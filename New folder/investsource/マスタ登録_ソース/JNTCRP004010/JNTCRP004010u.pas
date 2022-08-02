//******************************************************************************
//	System		: Galileopt
//	Program		: 取引先登録　グループ別セキュリティ
//	ProgramID	: JNTCRP004010
//	Name		: E.Nanba(Lab)
//	Create		: 2007/02/27
//	Comment		:
//	History		:	2007 / 02 / 27	E.Nanba(Lab)
//					JNTNCRP004008を基に新規作成
//-------------- Galieopt v2.02対応 --------------------------------------------
//  2008/02/15  <#1> E.Nanba(Lab)・SecHojyoDispInfoにKmkNCodeフィールド(NULL不可)が追加された考慮がなく、INSERT時にエラーになる不具合を修正
//-------------- Galieopt v2.07対応 --------------------------------------------
//  2008/07/23  <#2> E.Nanba(Lab)・[補助表示初期値区分]対応  GWY-0123
//-------------- Galieopt v3.01対応 --------------------------------------------
//  2009/01/15  <#3> E.Nanba(Lab)・プロジェクト登録からの呼び出しに対応
//  2009/01/19  <#4> E.Nanba(Lab)・マスタコード属性がフリーのとき、コード列が左寄せにならない不具合を修正
//  2009/02/03  <#5> E.Nanba(Lab)・部署グリッド  コード列ヘッダ文言に補助名称がセットされていた件を修正
//-------------- Galieopt v3.02対応 --------------------------------------------
//  2009/03/19  <#6> E.Nanba(Lab)・[補助表示初期値区分]が「表示可」のときデフォルト設定のマスタが印刷されない件を修正
//  2009/09/14  <#7> T.Miyagi(RIT)・削除済み取引先がある場合に、使用可ﾁｪｯｸﾎﾞｯｸｽの表示がおかしい件を修正
//-------------- Galieopt v4.00対応 --------------------------------------------
//  2010/05/21  <#8> T.Ogawa(RIT)・MLBplLoader対応(LoadPackageの置き換え)
//-------------- Galieopt v4.08/NX-Ⅰ5.01対応 --------------------------------------------
//  2012/02/10  <Shift> T.Ogawa(LEAD)・KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//  2012/02/10  <Gali2258> T.Ogawa(LEAD)・起動時エラーの回避(Gali2258)
//-------------- Galieopt NX-Ⅰ5.02対応 --------------------------------------------
//  2012/04/11  <#9> T.Ogawa(LEAD) <Gali2258>の対応でプロジェクト登録から呼び出されると例外が発生する件を修正。
//  2012.06.22  <Authority> T.Ogawa(LEAD)   サブモジュールの権限管理対応
//
//-------------- Galieopt NX-Ⅰ5.06対応 --------------------------------------------
//  2014.04.04  <>          T.Ogawa(LEAD)   取引先１６桁対応(プロパティ修正のみ)
//******************************************************************************
unit JNTCRP004010u;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
	VCL.StdCtrls, ComCtrls, Buttons, VCL.ExtCtrls, FileCtrl,

	MJSStatusBar, MJSBitBtn, MJSFunctionBar, MJSSPFunctionBar, MJSLabel, MJSPanel,
	MJSSpeedButton,
	MJSQuery,
	MJSComboBox,

	MJSCommonu, MjsDBModuleu,
	MjsDateCtrl, MjsDispCtrl, MjsMsgStdU, {MjsFolderU,}
	DB, FireDAC.Comp.Client, DBCtrls, dxmdaset, dxTL, dxDBGrid, dxCntner, dxGrClms,
	dbgrids,
	dxExEdtr,

//	JNTSelGlobal,
	JNTMasComu,		//<LEAD> 財務に統一
//	JNTMasWndIFu,
	JNTSelCorpSys,
	JNTCommonu,

	JNTExPGlobal, JNTPDlg,{<PRN>}
    MJSKeyDataState,  //<Shift> ADD
	MjsPreviewIFu,	//<LEAD>
	MjsPrnDlgU,
	MjsPrnSupportU,
	JNTMasMonth,
    JNTCRP004010PrnDlgu, VCL.ImgList
    ,MLBplLoaderU //<#8> ADD
    ,JNTAuthorityu// <Authority> ADD
    ,Variants
    ;

  const
	{$include MASDef.inc}
	WM_ONPAINT	= WM_APP + 1;	// OnPaint 時の処理起動メッセージ用

type
	{$include ActionInterface.inc}
	{$include MasCommonFuncH.inc}
	{$include JNTSelPrtIF.inc}          // <PRN>
	{$include JNTCRP004010IFH.inc}		//<#3>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   pRptParam	:	Pointer;
   var ArHdl    :   array of Pointer): Integer;

	TRptParam = Record
		iMasterKbn1		:	Integer;
		iCodeAttr1		:   Integer;
		iCodeDigit1		:   Integer;
		sMasterName1	:	String;
		iMasterKbn2		:	Integer;
		iCodeAttr2		:   Integer;
		iCodeDigit2		:   Integer;
		sMasterName2	:	String;
		sRetStCode		:	String;		//開始コード    (戻り値)
		sRetEdCode		:	String;		//終了コード    (戻り値)
	end;

	TJNTCRP004010F = class(TForm)
	lStatusMessage: TMLabel;
    DtlCmnClientPanel: TMPanel;
    ScrollBox1: TScrollBox;
    BUpdate_Sec: TMBitBtn;
    BCancel_Sec: TMBitBtn;
    MPanel3: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    stbStatusBar: TMStatusBar;
    MemPrint: TdxMemData;
    PPanel_DGrid_Place: TMPanel;
    DGrid_Place: TdxDBGrid;
    DGrid_Place_GCode: TdxDBGridColumn;
    DGrid_Place_Name: TdxDBGridColumn;
    DDataSource_Place: TDataSource;
    DMemData_Place: TdxMemData;
    DMemData_PlaceDispKbn: TBooleanField;
    DMemData_PlaceNCode: TCurrencyField;
    DMemData_PlaceGCode: TStringField;
    DMemData_PlaceName: TStringField;
    DGrid_Place_DispKbn: TdxDBGridCheckColumn;
    PPanel_DGrid_Hojyo: TMPanel;
    DGrid_Hojyo: TdxDBGrid;
    DDataSource_Hojyo: TDataSource;
    DMemData_Hojyo: TdxMemData;
    DMemData_HojyoNCode: TCurrencyField;
    DMemData_HojyoGCode: TStringField;
    DMemData_HojyoRenso: TStringField;
    DMemData_HojyoName: TStringField;
    DMemData_HojyoInsDateTM: TDateTimeField;
    DGrid_Hojyo_GCode: TdxDBGridColumn;
    DGrid_Hojyo_Renso: TdxDBGridColumn;
    DGrid_Hojyo_Name: TdxDBGridColumn;
    DGrid_Hojyo_InsDateTM: TdxDBGridTimeColumn;
    LPlace: TMLabel;
    LHojyo: TMLabel;
    MemPrintGCode1: TStringField;
    MemPrintNm1: TStringField;
    MemPrintGCode2: TStringField;
    MemPrintNm2: TStringField;
    DMemData_Hojyo_Dmy: TdxMemData;
    DMemData_Hojyo_DmyNCode: TCurrencyField;
    BPrint_Sec: TMBitBtn;
    BOk_Sec: TMBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormDestroy(Sender: TObject);

	procedure BUpdate(Sender: TObject);
	procedure BCancel(Sender: TObject);
	procedure BPrintClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure DGrid_HojyoChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure DGrid_HojyoChangeNodeEx(Sender: TObject);
    procedure DGrid_HojyoSelectedCountChange(Sender: TObject);
    procedure DGrid_Place_DispKbnToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);

    procedure MSPFunctionBarFunctionClick(Sender: TObject;
      FuncNo: Integer);
    procedure DGrid_PlaceEnter(Sender: TObject);
    procedure DGrid_PlaceExit(Sender: TObject);

  private
	{ Private 宣言 }
	m_pMyAppRecord	:   ^TMjsAppRecord;
	m_Base_pRec		:   ^TMjsAppRecord;
	m_pwkRec		:   ^TMjsAppRecord;	//<#3> DLGﾌﾟﾚﾋﾞｭｰ用
	MDataModule		:   TMDataModulef;
    ComArea			:   TJNTMASCom;
    dbCorp_Select	:   TFDConnection;
    m_dbMjsCmn		:   TFDConnection;
//	m_dbMasCmn		:   TDatabase;
    m_AcControl		:   TWinControl;
    m_cJNTArea      :   TJNTCommon;
    m_cErrorMsgRec	:   TMJSMsgRec;                        // MJS専用ﾒｯｾｰｼﾞ
    m_MjsMsgRec		:   TMjsMsgRec;
//	m_cPreview		:   TMJSPreviewIF;

    m_CmpList		:   TList;
    B_Print			:   TMSpeedButton;
    B_Change		:   TMSpeedButton;                // 切出/埋込ﾎﾞﾀﾝ
    m_bBtnChange	:   Boolean;                      // 切出≪=≫埋込ﾌﾗｸﾞ

	m_bFirstFlag	:   array [0..1] of Boolean;
	m_bChangeNode	:	Boolean;						// True: GridのOnChangeNodeExｲﾍﾞﾝﾄ無効
	m_bChangeNode2	:	Boolean;						// True: GridのOnChangeNodeExｲﾍﾞﾝﾄ、OnSelectedCountChangeｲﾍﾞﾝﾄ無効

//	m_MsgStd		:   TMjsMsgStd;

    m_iSysColor		:   Integer;
	m_iSysCode		:   Integer;
    m_iOptCode		:   Integer;
	m_iCorpCode		:   Integer;
	m_iCorpSubCode	:   Integer;
	m_iSysCodeNo	:   Integer;
    m_nDateFormatDivision	: Integer;					// 和暦/西暦区分
    m_nMailAdoption			: Integer;					// ﾒｰﾙ会計処理区分
    nCompDivision			: Integer;					// 公益法人区分
    m_strValidCharacters	: String;					// 使用可能ｺｰﾄﾞ
    m_DataKbn				: Integer;					// データ区分
	m_iHojyoKbn		:	Integer;
	m_iSecMasterKbn	:	Integer;						// セキュリティ採用セグメントマスタ区分
	m_iHojDefKbn	:	Integer;						// 補助表示初期値区分 0:非表示 1:表示 <#2>
	m_iHojDigit,m_iHojAttr	: Integer;
	m_iSecDigit,m_iSecAttr	: Integer;

    CloseFlg		:	Boolean;
    m_EdtSw         :	Boolean;                        // 編集ｽｲｯﾁ

	uvSelSys		:	TJNTSelCorpSys;					//会社ｼｽﾃﾑ情報
    uvDispFlg		:	Integer;						//決算フラグ（ 0:未確定、1:確定済）

    uvHani			:	TJNTHani;	                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry	:	TPrintAppEntry;                 // <PRN>
    ArrHdl			:   Array[0..100] of Pointer;		// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		:	rcPrtParam;                     // <PRN>
    DmqPrint        :   TMQuery;                        // <PRN> 印刷用ｸｴﾘｰ
    MComboBox       :   TMComboBox;
	m_iRekiKbn		:	Integer;						// 051114
	m_lDspHNCode	:	TStringList;
	m_lDspPNCode	:	TStringList;
	m_lDspKbn		:	TStringList;
	m_lDspKbnDB		:	TStringList;
	m_lDspKbnExt	:	TStringList;					// SecHojyoDispテーブルレコード有無

	m_lHojyo		:	TStringList;
	m_lPlace		:	TStringList;
	m_Handle		:	THandle;
	m_iPlaceCount	:	Integer;						// 部署件数

	m_iDlgKbn		:	Integer;						// <#3> DLG区分 1:DLG起動
	m_DLG4010Prm	:	TJNTCRP004010Prm;				// <#3> DLG呼出ﾊﾟﾗﾒｰﾀ
	m_iZoom			:	Integer;						// <#3> 拡大率

    m_JNTAuthority  :   TJNTAuthority;                  // 権限管理クラス <Authority> ADD

	procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;

	procedure DspInit();								// <#3> 画面初期処理
	function  fnCancel(): Boolean;
	function  fnGetMasterInfo(Query: TMQuery; iMasterKbn: Integer; var iDigit, iAttr: Integer; var sName: String): Boolean;
//	procedure setGridColumn(column: TdxDBGridColumn; iAttr,iDigit: Integer);
	procedure setGridColumn(column: TdxDBGridColumn; iDigit,iAttr: Integer);    //<#4> MOD
	procedure ListCreate;
	procedure ListReload(iFstFlg: Integer = -1);
	procedure ListReload_1(iNCode: Int64; index: Integer = -1);
	procedure Set_DGrid_Place_DispKbn();
	procedure Set_List_DispKbn(bCheck: Boolean; iPNCode: Int64 = -1);
	function  fnGetSearchIndex(iNCode: Int64; var iSt,iEd: Integer): Boolean;
	function  fnGetListIndex(List: TStringList; iData: Int64): Integer;
//	function  fnGetIndex(iStIndex,iEdIndex: Integer; iHNCode: Int64; iPNCode: Int64 = -1): Integer;
	function  fnGetDspKbn(sKbn: String): Boolean;
	function  fnSec_Select:Boolean;
	procedure FncBtnControl(btnEnabled: Boolean);
	procedure HojyoSQLMake(var sSQL: String; iMasterKbn,iOrderKbn: Integer);
	function  fnSec_Update:Boolean;
	function  fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
	Procedure fnCompEnabled(pBol:Boolean);
	Procedure fnCompClear;
	function  fnPrnSET(RptParam: TRptParam): Boolean;
	procedure ErrorMessageDsp(DMQuery: TMQuery);

  protected
	procedure	CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;

  public
	{ Public 宣言 }
//	constructor CreateForm(pRec:pointer);										// ｺﾝｽﾄﾗｸﾀ
	constructor CreateForm(pRec:pointer; iDlgKbn: Integer = 0);					// ｺﾝｽﾄﾗｸﾀ  <#3>iDlgKbn追加

end;

function AppEntry(pParam : Pointer): Integer;
function AppEntryDlg(pParam : Pointer): Integer;		//<#3> ADD

exports
	AppEntry,
	AppEntryDlg;										//<#3> ADD

implementation
	{$include JNTCRP004010IFB.inc}						//<#3> ADD

{$R *.DFM}

//******************************************************************************
//		Proccess	: AppEntry
//		Name		: Y.Sato
//		Date		: 2000/07/24
//		Parameter	: pPar
//		Return		: Integer
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function AppEntry(pParam: Pointer):	Integer;
var
	pMyForm	:	^TJNTCRP004010f;
	pRec	:	^TMjsAppRecord;
begin
	result	:=	ACTID_RET_OK;
	pRec	:=	Pointer(TAppParam(pParam^).pRecord);

	case TAppParam(pParam^).iAction of
		// ----------------------
		//	Form Create要求
		// ----------------------
		ACTID_FORMCREATESTART		:
		begin
			new(pMyForm);
			try
				pMyForm^ := TJNTCRP004010f.CreateForm(pParam);
				pRec^.m_pChildForm	:=	pMyForm;
			except
				Dispose(pMyForm);
				Result	:=	ACTID_RET_NG;
			end;
		end;
		// ----------------------
		//	Form Create&Show要求
		// ----------------------
		ACTID_FORMCREATESHOWSTART	:
		begin
			new(pMyForm);
			try
				pMyForm^	:=	TJNTCRP004010f.CreateForm(pRec);
				pMyForm^.Show();
				pRec^.m_pChildForm	:=	pMyForm;
			except
				Dispose(pMyForm);
				Result	:=	ACTID_RET_NG;
			end;
		end;
		// ----------------------
		//	Form Close要求
		// ----------------------
		ACTID_FORMCLOSESTART		:
		begin
			pMyForm	:=	Pointer(pRec^.m_pChildForm);
			pMyForm^.Close();
			pMyForm^.Free();
			Dispose(pMyForm);
		end;
		// ----------------------
		//	Form CanClose要求
		// ----------------------
		ACTID_FORMCANCLOSESTART		:
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			if pMyForm^.CloseQuery = False then
				Result	:=	ACTID_RET_NG;
		end;
		// ----------------------
		//	Show要求
		// ----------------------
		ACTID_SHOWSTART				:
		begin
			pMyForm	:=	Pointer(pRec^.m_pChildForm);
			pMyForm^.Show();
		end;
		// ----------------------
		// Hide要求
		// ----------------------
		ACTID_HIDESTART :
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			if pMyForm^.Parent <> nil then
				pMyForm^.Hide();
		end;
	end;
end;

//******************************************************************************
//		Proccess	: AppEntryDlg  <#3>
//		Name		: E.Nanba(Lab)
//		Date		: 2009/01/15
//		Parameter	: pPar
//		Return		: Integer
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function AppEntryDlg(pParam: Pointer):	Integer;
var
	pMyForm	:	^TJNTCRP004010f;
	pRec	:	^TMjsAppRecord;
	DLG4010Prm	:	TJNTCRP004010Prm;
begin
	Result	:= ACTID_RET_OK;

	pRec		:= Pointer(TAppParam(pParam^).pRecord);
	DLG4010Prm	:= TJNTCRP004010Prm( TAppParam(pParam^).pActionParam^ );

	case TAppParam(pParam^).iAction of
		ACTID_FORMCREATESTART		:			//	Form Create要求
		begin
			new( pMyForm );

			try
				pMyForm^ := TJNTCRP004010F.CreateForm(pParam, 1);
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose( pMyForm );
				result := ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCREATESHOWSTART	:			//	Form Create&Show要求
		begin
			new( pMyForm );

			try
				pMyForm^ := TJNTCRP004010F.CreateForm(pParam, 1);

				DLG4010Prm.MasDLGResult := pMyForm^.ShowModal();
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose( pMyForm );
				result := ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCLOSESTART		:			//	Form Close要求
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			pMyForm^.Free();
			Dispose( pMyForm );
		end;

		ACTID_FORMCANCLOSESTART		:			//	Form CanClose要求
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			if pMyForm^.CloseQuery() = False then
				result := ACTID_RET_NG;
		end;

		ACTID_SHOWSTART				:			//	Show要求
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			DLG4010Prm.MasDLGResult := pMyForm^.ShowModal();
		end;
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:Y.Sato
//**********************************************************************
constructor TJNTCRP004010F.CreateForm(pRec:pointer; iDlgKbn: Integer = 0);	//<#3>iDlgKbn追加
begin
	//<#3> ADD St
	m_iDlgKbn    := iDlgKbn;
	m_DLG4010Prm := nil;
	m_CmpList    := nil;
	//<#3> ADD Ed

//<#3> MOD St
//	m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave
//	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);	// MJS共通DBﾓｼﾞｭｰﾙ
//	ComArea			:=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得
//	m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

	m_pMyAppRecord  :=  Pointer( TAppParam(pRec^).pRecord );		// 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);	// MJS共通DBﾓｼﾞｭｰﾙ
	ComArea			:=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得

	if m_iDlgKbn <> 1 then
	begin
		m_CmpList       :=  TList( TAppParam(pRec^).pActionParam^ );
	end
	else begin
		m_DLG4010Prm	:=  TJNTCRP004010Prm( TAppParam(pRec^).pActionParam^ );
	end;
//<#3> MOD Ed

    m_iSysColor	    :=  ComArea.SystemArea.SysColorB;		            // ｼｽﾃﾑｶﾗｰ(淡) 取得
	m_iSysCode	    :=  m_pMyAppRecord^.m_iSystemCode;		            // ｼｽﾃﾑｺｰﾄﾞ 取得

    m_iCorpCode	    :=  m_pMyAppRecord^.m_iCorpCode;			        // 会社ｺｰﾄﾞ 取得
    m_iCorpSubCode	:=  m_pMyAppRecord^.m_iCorpSubCode;	                // ｼｽﾃﾑDBｺｰﾄﾞ 取得 (決算開始年月日)
	m_iSysCodeNo    :=  (m_iSysCode * 100) + m_iOptCode;	            // ｼｽﾃﾑｺｰﾄﾞ+ｵﾌﾟｼｮﾝｺｰﾄﾞ 取得

(*
    // 共通DB Open
	m_dbMasCmn := MDataModule.CTLDBOpen;													// 共通DBOpne
	if m_dbMjsCmn = nil then
	begin
		raise EMathError.Create('共通DBのオープンに失敗しました｡');
		Exit;																	// 例外生成
	end;

    // MASCOMMON.DBのOPEN
    m_dbMasCmn := MDataModule.COPDBOpen(1,ComArea.m_iMasCommonNo);		// Tran使用
    if m_dbMasCmn = nil then
    begin
        ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx (Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		raise EMathError.Create('MASCOMMON.DBのOPENに失敗しました。');
		MDataModule.CTLDBClose(m_dbMjsCmn);
		Exit;
    end;
*)

    // 会社DB Open
	dbCorp_Select := MDataModule.COPDBOpen( 1, ComArea.m_iCopNo );							// 会社DBOpne
	if dbCorp_Select = nil then
	begin
		ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx (Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		raise Exception.Create('');
		MDataModule.CTLDBClose(m_dbMjsCmn);
		Exit;																// 例外生成
	end;

// <Gali2258> ADD St
    if m_iDlgKbn <> 1 then  //<#9> ADD
    begin  //<#9> ADD
    // FormCreateから移動
            m_cJNTArea           := TJNTCommon   ( m_CmpList.Items[8]^ );
            m_Base_pRec          := Pointer      ( m_CmpList.Items[9]^ );
    // <Gali2258> ADD Ed
            m_JNTAuthority           := TJNTAuthority   ( m_CmpList.Items[16]^ );  //<Authority> ADD

        m_cJNTArea.setSelAppRecord; //<Gali2258> ADD
    end;  //<#9> ADD

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

//<Gali2258> DEL    	if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
        if m_iDlgKbn <> 1 then  //<#9> ADD
        begin  //<#9> ADD
            if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then //<Gali2258> ADD
                Abort;
//<#9> ADD St
        end
        else
        begin
            if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then abort;
        end;
//<#9> ADD Ed
    except
//<DSP>		MessageDlg(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mtError, [mbOk], 0);
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    if m_iDlgKbn <> 1 then  //<#9> ADD
      	m_cJNTArea.setMasAppRecord; //<Gali2258>

	// 051114 >>
    // 会社別ｼｽﾃﾑ情報読み込み<PRN>
    try
    	if (uvSelSys.CreateSysInfo(dbCorp_Select) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;
	// 051114 <<

    // FormCreate
    inherited Create(TForm(m_pMyAppRecord^.m_pOwnerForm^))

end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:洪英傑(上海未来)
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/07/20(T.Aoki)
//					:<040720>
//					:文字pt=10に変更したら切れるので9ptに戻す
//					:所定労働日数ｸﾞﾞﾘｯﾄﾞは10ptで高さ取っているので10ptのまま
//**********************************************************************
procedure TJNTCRP004010F.FormCreate(Sender: TObject);
var
	DMQuery	:TMQuery;

	iRet        :   Integer;        // <PRN>
	sHojyo,sPlace		:	String;
begin
	//<#3> MOD St
{
	m_iHojyoKbn		:= 22;

	// 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
	B_Print 	    :=  TMSpeedButton( m_CmpList.Items[0]^ );		// 印刷
	m_cJNTArea      :=  TJNTCommon   ( m_CmpList.Items[8]^ );
	m_Base_pRec     :=  Pointer      ( m_CmpList.Items[9]^ );
	MComboBox       :=  TMComboBox   ( m_CmpList.Items[10]^ );
	B_Change        :=  TMSpeedButton( m_CmpList.Items[11]^ );

	B_Print.OnClick     :=  BPrintClick;
	B_Change.OnClick    :=  BChangeClick;
	//--------------------------------------------------------------------------

	Parent      :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^);			// 親のﾊﾟﾈﾙに埋込む
	Align       :=  alClient;
}
	if m_iDlgKbn <> 1 then
	begin
		m_iHojyoKbn		:= 22;

		// 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
		B_Print 	    :=  TMSpeedButton( m_CmpList.Items[0]^ );       // 印刷
//<Gali2258> DEL St  CreateFormへ移動
{
		m_cJNTArea      :=  TJNTCommon   ( m_CmpList.Items[8]^ );
		m_Base_pRec     :=  Pointer      ( m_CmpList.Items[9]^ );
}
//<Gali2258> DEL Ed
		MComboBox       :=  TMComboBox   ( m_CmpList.Items[10]^ );
		B_Change        :=  TMSpeedButton( m_CmpList.Items[11]^ );

		B_Print.OnClick     :=  BPrintClick;
		B_Change.OnClick    :=  BChangeClick;
		//--------------------------------------------------------------------------

		Parent      :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^);			// 親のﾊﾟﾈﾙに埋込む
		Align       :=  alClient;
        B_Print.Enabled := m_JNTAuthority.IsPrint;  // 呼び出し元でしか制御していなかったので追加 <Athority> ADD
	end
	else begin
		m_iHojyoKbn		:= m_DLG4010Prm.iMasDefKbn;

		m_cJNTArea		:= TJNTCommon(m_DLG4010Prm.pJNTArea^);

		m_Base_pRec		:= Pointer(m_DLG4010Prm.pApRec);

        m_JNTAuthority := TJNTAuthority.Create(m_Base_pRec,m_cJNTArea);  // ダイアログモードは直接生成する <Authority> ADD
	end;
	//<#3> MOD Ed

	CloseFlg        :=  False;
    m_bFirstFlag[0]	:=  False;
	m_bFirstFlag[1]	:=  False;
    m_bBtnChange 	:=  TRUE;

//	m_cPreview	:= TMJSPreviewIF.Create ();
//	m_cPreview.Init (m_pMyAppRecord);
//<Gali2258> DEL St CreateFormの最後で行っているので、ここでは再度の設定は不要なのでコメントアウトしました。
//	m_cJNTArea.setMasAppRecord;						            // 財務ポインタ設定
//<Gali2258> DEL Ed

    MjsColorChange(				                                // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP004010F(Self),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor
				  );

//	MjsFontResize( TJNTCRP004010F(Self), Pointer(m_pMyAppRecord) );
	m_iZoom := MjsFontResize( TJNTCRP004010F(Self), Pointer(m_pMyAppRecord) );	//<#3>

	// 画面初期処理 <#3>
	DspInit;

	// Enabledの制御
	fnCompEnabled(False);

	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続
    Try
        with DMQuery do
        begin
            Close ();
            m_nDateFormatDivision	:= 0;					// 和暦/西暦区分
            m_nMailAdoption			:= 0;					// ﾒｰﾙ会計処理区分
            nCompDivision			:= 0;					// 公益法人区分
            m_strValidCharacters	:= '';					// 使用可能ｺｰﾄﾞ
            m_DataKbn				:= 0;					// データ区分
			m_iSecMasterKbn			:= 0;					// セキュリティ採用セグメントマスタ区分
			m_iHojDefKbn			:= 0;					// 補助表示初期値区分 <#2>

            Close;
            Sql.Clear;

			// 取引先情報取得
			fnGetMasterInfo(DMQuery, m_iHojyoKbn, m_iHojDigit, m_iHojAttr, sHojyo);
			setGridColumn(DGrid_Hojyo_GCode, m_iHojDigit, m_iHojAttr);
			LHojyo.Caption := sHojyo;
			DGrid_Hojyo_Name.Caption := sHojyo;

			Close;
			Sql.Clear;
			Sql.add('SELECT SecMasterKbn, ISNULL(HojyoDefKbn,0) AS HojyoDefKbn');
			Sql.add('FROM SecMain WHERE OpeKbn = 1 AND UseKbn = 1');
			Open;
			if not Eof then
			begin
				m_iSecMasterKbn := GetFld('SecMasterKbn').AsInteger;
				m_iHojDefKbn    := GetFld('HojyoDefKbn').AsInteger;		//<#2>
			end;

			// 部署セグメント情報取得
			if m_iSecMasterKbn > 0 then
			begin
				fnGetMasterInfo(DMQuery, m_iSecMasterKbn, m_iSecDigit, m_iSecAttr, sPlace);
				setGridColumn(DGrid_Place_GCode, m_iSecDigit, m_iSecAttr);
				LPlace.Caption := sPlace;
				//DGrid_Place_GCode.Caption := sPlace;
				DGrid_Place_Name.Caption := sPlace;		//<#5>
			end;

            Close;
            SQL.Clear;
            SQL.Add ('SELECT ComKbn2, YearKbn FROM DTMAIN');
            Open;
            if not Eof then
            begin
                uvDispFlg := FieldByName ('ComKbn2').AsInteger;	// 決算確定
				m_iRekiKbn:= GetFld('YearKbn').AsInteger;
            end;
            Close;
        end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

    //権限情報を取得
//<Authority> DEL    if (m_cJNTArea.IsModify = False) then
    if (m_JNTAuthority.IsModify = False) then  //<Authority> ADD
    begin
//<Authority> DEL        if (m_cJNTArea.IsAppend = False ) then
        if (m_JNTAuthority.IsAppend = False ) then  //<Authority> ADD
        begin
            uvDispFlg := 1;//決算確定と同様の処理
        end;
    end;

	m_AcControl	:= DGrid_Hojyo;

// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    MDataModule.SetDBInfoToQuery(dbCorp_Select,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
    m_Handle := 0;
	try
//<#8> DEL		m_Handle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004010L.BPL');
		m_Handle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004010L.BPL');  //<#8> ADD

        if ( m_Handle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP004010LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(m_Handle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
//<#8> DEL    	UnloadPackage( m_Handle );
    	UnloadPackageHelper( m_Handle );  //<#8> ADD
    end;

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
            Para		    :=  uvHani;
			TargetQry	    :=  nil;
            TargetMD        :=  nil;
			CorpSys		    :=  uvSelSys;
            // *** 汎用変数 *** //
            TargetParam	    :=  nil;
	    	TargetStr	    :=  '';
    		TargetInt	    :=  0;
            // *** 汎用変数 *** //
            iAPP_HDL_REC    :=  100;
		end;
        ArrHdl[0] := @m_JntAuthority;  //<Authority> ADD
		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,nil,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

	//<#3> MOD St
	{
	// 印刷用ｵﾌﾞｼﾞｪｸﾄ構築(INIファイル読込行わない)
	gfnPrnInit(	Self,
				m_Base_pRec,
				MDataModule,
				ComArea,
				dbCorp_Select,
				uvHani,
				uvSelSys);
	}

	new(m_pwkRec);
	m_pwkRec^ := m_Base_pRec^;

	// ﾌﾟﾚﾋﾞｭｰ全画面表示
	if m_iDlgKbn = 1 then
	begin
		m_pwkRec^.m_pChildForm := nil;
	end;

	// 印刷用ｵﾌﾞｼﾞｪｸﾄ構築(INIファイル読込行わない)
	gfnPrnInit(	Self,
				m_pwkRec,
				MDataModule,
				ComArea,
				dbCorp_Select,
				uvHani,
				uvSelSys);
	//<#3> MOD Ed

// <PRN> -----------Add↑-----------------

	ListCreate;		// リスト作成
	ListReload(1);	// DBから表示区分取得

	fnSec_Select;	// 画面表示

	FncBtnControl(False);

    // 編集状態ｽｲｯﾁを初期化する
    m_EdtSw := False;

    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);		//イベントOnCreateの最後に
end;

//************************************************************************
//*		Proccess		:	WMOnPaint関数
//*		Name			:	S.Ogawa
//************************************************************************
procedure TJNTCRP004010F.WMOnPaint(var Msg: TMessage);
var
	N : TdxTreeListNode;
begin
	// 初期のみ一回の処理
	if m_bFirstFlag[0] = False then
	begin
		m_bFirstFlag[0] := True;

		DGrid_Hojyo.SetFocus;
		N := DGrid_Hojyo.FocusedNode;
		if N <> nil then
			N.Selected := True;
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.FormShow(Sender: TObject);
begin
	if m_iDlgKbn <> 1 then	//<#3> 条件追加
	begin
		JNTMasSetCaption( m_pMyAppRecord );
		MjsBtnVisible( TJNTCRP004010F(Self), TRUE );

		//<#3> MjsBtnVisibleで表示されるので非表示にする
		BPrint_Sec.Visible := False;
		BOk_Sec.Visible    := False;
	end;

	FormActivate( Sender );
	m_AcControl.SetFocus();
end;

//**********************************************************************
//		Component	:Form
//		Event		:Activate
//		Name		:KOS.HORI
//		Histry		:
//**********************************************************************
procedure TJNTCRP004010F.FormActivate(Sender: TObject);
var
	wkParam :	TAppParam;
begin
	if m_iDlgKbn <> 1 then	//<#3> 条件追加
	begin
		wkParam.iAction         :=  ACTID_ACTIVEEND;
		wkParam.pRecord         :=  Pointer(m_pMyAppRecord);
		wkParam.pActionParam    :=  nil;
		TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Hide
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.FormHide(Sender: TObject);
begin
	if m_iDlgKbn <> 1 then	//<#3> 条件追加
	begin
		MJSBtnVisible( TJNTCRP004010F(Self), False );
	end;

    // 印刷オブジェクトあり
//inoue
{	if PrnForm <> nil then
	begin
		if PrnForm.mjsPreview.IsPreview then
			PrnForm.mjspreview.Hide;
	end;
}
end;

//**********************************************************************
//		Component	:Form
//		Event		:Close
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
//	i : Integer;
begin
    // 販売ｼｽﾃﾑ情報の解放
	uvSelSys.Free;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	if m_lDspHNCode <> nil then
		m_lDspHNCode.Free;
	if m_lDspPNCode <> nil then
		m_lDspPNCode.Free;
	if m_lDspKbn <> nil then
		m_lDspKbn.Free;
	if m_lDspKbnDB <> nil then
		m_lDspKbnDB.Free;
	if m_lDspKbnExt <> nil then
		m_lDspKbnExt.Free;

	if m_lHojyo <> nil then
		m_lHojyo.Free;
	if m_lPlace <> nil then
		m_lPlace.Free;

    MDataModule.COPDBClose(dbCorp_Select);

	if m_iDlgKbn <> 1 then	//<#3> 条件追加
	begin
		Action := caFree;

		m_pMyAppRecord^.m_iDelete   :=  1;
		wkParam.iAction	            :=	ACTID_FORMCLOSEEND;
		wkParam.pRecord	            :=	Pointer(m_pMyAppRecord);
		wkParam.pActionParam	    :=	nil;
		TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
	iRtn : Word;
begin

    // 終了ﾌﾗｸﾞをONに設定する
    if ( CloseFlg = False ) then CloseFlg := True;

    if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		ComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType );
	   	CanClose := FALSE;
	end
    else
    	CanClose := TRUE;


	if (m_EdtSw) and
	   (m_iDlgKbn <> 1) then	//<#3> 条件追加
	begin
        // 変更を保存します。よろしいですか？
        ComArea.m_MsgStd.GetMsg(m_cErrorMsgRec,10020,2);
        with m_cErrorMsgRec do
        begin
            iRtn := MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg,
                                    m_cErrorMsgRec.sTitle,
                                    icontype,
                                    m_cErrorMsgRec.btntype,
                                    m_cErrorMsgRec.btndef,
                                    m_cErrorMsgRec.LogType );
        end;

  		case iRtn of
    		mrYes:
	    	begin
            //フィールド入力値のチェックをする
                if fnFldChk(Self, True)  then
                begin
	    			BUpdate(Sender);
		    		CanClose := True;
			    	CloseFlg := True;
   				end
    			else
                begin
	    			CanClose := False;
                    Exit;
                end;
		    end;
   			mrNo:
    		begin
	    		CanClose := True;
		    	CloseFlg := True;
   			end;
    		mrCancel:
	    	begin
		    	CanClose := False;
                Exit;
   			end;
    	end;

        m_EdtSw := False;   // 編集ｽｲｯﾁをOFF
    end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.FormDestroy(Sender: TObject);
begin

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
		Para		:=  uvHani;
		TargetQry   :=  nil;
		CorpSys		:=  uvSelSys;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,3,PrtParam,nil,ArrHdl);
	if m_Handle <> 0 then
//<#8> DEL		UnloadPackage(m_Handle);
		UnloadPackageHelper(m_Handle);  //<#8> ADD

	//<#3>
	if m_pwkRec <> nil then
		Dispose(m_pwkRec);

//	m_cPreview.Term ();
//	m_cPreview.Free ();
end;

//**********************************************************************
//		Component	:Form
//		Event		:CMChildKey
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.CMChildKey(var Msg: TWMKey);
var
	sShift	:	TShiftState;
	SName	:	String;
//	iRtn	:	Integer;
begin

	if GetKeyState(VK_MENU) < 0 then
		Exit;

    // Shilt状態の取得
//<Shift> DEL	sShift		:= KeyDataToShiftState(Msg.KeyData);
	sShift		:= MJSKeyDataToShiftState(Msg.KeyData);  //<Shift> ADD

    // ﾌｫｰｶｽのあるｺﾝﾄﾛｰﾙ取得
	SName		:= Screen.ActiveControl.Name;
	m_ACControl	:= Screen.ActiveControl;

    if ((Msg.CharCode = VK_RETURN) and (sShift = [])) or
       ((Msg.CharCode = VK_TAB)	   and (sShift = [])) then
    begin

        // ENTERｷｰの場合だけ何も行わない
        if ( Msg.CharCode = VK_RETURN ) then
        begin
            // ﾎﾞﾀﾝﾌｫｰｶｽ時は処理しない
            if (m_ACControl is TMBitBtn)  then
                Exit;
        end;

        // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
        if fnFldChk(TComponent(Screen.ActiveControl), True) = False then
            abort;
    end;
    //-------------------------------------------------------------------------
    // 更新・削除ﾎﾞﾀﾝ
    //-------------------------------------------------------------------------
	if (m_ACControl is TMBitBtn) then
	begin
		case Msg.CharCode of
        VK_TAB:							                    // TAB
        begin
            if (sShift = []) then
                MjsNextCtrl(Self);
            if (sShift = [ssShift]) then
                MjsPrevCtrl(Self);
            Abort;
        end;
        VK_RIGHT, VK_DOWN:                                  // RIGHT, DOWN
        begin
            if sShift = [] then
            begin
                MjsNextCtrl(Self);
                Abort;
            end;
        end;
        VK_LEFT, VK_UP:                                     // LEFT, UP
        if sShift = [] then
        begin
            MjsPrevCtrl(Self);
            Abort;
        end;
        VK_ESCAPE:                                          // 更新,ｷｬﾝｾﾙﾎﾞﾀﾝ上でのESCは制御なし
            Exit;
        VK_END:
        begin
//            self.bCancel(m_ACControl);				// ｷｬﾝｾﾙﾎﾞﾀﾝｸﾘｯｸｲﾍﾞﾝﾄ起動(FXでは不要？)
        end;
		end;
	end;

	if (m_ACControl = DGrid_Place) then
	begin
		if (Msg.CharCode = VK_F5) and (sShift = []) then
		begin
			MSPFunctionBarFunctionClick(MSPFunctionBar, 5);
			Abort;
		end
		else if (Msg.CharCode = VK_F6) and (sShift = []) then
		begin
			MSPFunctionBarFunctionClick(MSPFunctionBar, 6);
			Abort;
		end;
	end;

    // ESCキーの捕捉 St-----------------------------------------------------
    if (Msg.CharCode = VK_ESCAPE) and (sShift = []) then
    begin
		//<#3> MOD St
{
        //先頭項目だった場合
		if m_ACControl = DGrid_Hojyo then
        begin
            MComboBox.SetFocus;
            Exit;
        end;
}

		if m_iDlgKbn <> 1 then
		begin
			//先頭項目だった場合
			if m_ACControl = DGrid_Hojyo then
			begin
				MComboBox.SetFocus;
				Exit;
			end;
		end
		else begin
			ModalResult := mrCancel;
			Exit;
		end;
		//<#3> MOD Ed
    end;
    // ESCキーの捕捉 ED-----------------------------------------------------

    // ENDキーの補足 St-----------------------------------------------------
    if (Msg.CharCode = VK_END) and (sShift = []) then
    begin
        //先頭項目だった場合
{
        if m_ACControl = DGrid_Hojyo then
        begin
            MComboBox.SetFocus;
            Exit;
        end
        else
        //先頭項目だった場合
        begin
        	//ﾋﾞｯﾄﾎﾞﾀﾝへ
            if BUpdate_Sec.Enabled then
                BUpdate_Sec.SetFocus
            else
            begin
                if BCancel_Sec.Enabled then
                    BCancel_Sec.SetFocus;
            end;

            Abort;
        end;
}
    end;
    // ENDキーの補足 ED-----------------------------------------------------
end;

//**********************************************************************
//		Component	:BUpdate_XXX  更新処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.BUpdate(Sender: TObject);
begin

    //フィールド入力値のチェックをする
    if fnFldChk(Self, True) = False then
        Exit;

	fnSec_Update;

    DGrid_Hojyo.SetFocus;

    m_EdtSw := False;
    FormActivate(nil);
end;

//**********************************************************************
//		Component	:BCancel_XXX    取消処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004010F.BCancel(Sender: TObject);
var
    iRtn : Integer;
begin
    if (m_EdtSw) and
       (m_iDlgKbn <> 1) then	//<#3> 条件追加
    begin
    	//「編集中のデータを取り消します。よろしいですか？」
	    ComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 10020, 1);
    	iRtn	:= MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg,
                                    m_pMyAppRecord^.m_ProgramName,
                                    m_cErrorMsgRec.icontype,
									m_cErrorMsgRec.btntype,
                                    m_cErrorMsgRec.btndef,
                                    m_cErrorMsgRec.LogType);


        // ｢はい｣
        if iRtn = mrYes then
        begin
            fnCancel;
        end;
    end// else fnCancel;
end;

//************************************************************************
//	Component		:	BPrint
//	Event			:	Click
//	Name			:	丘	嶸(上海未来)
//************************************************************************
procedure TJNTCRP004010F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
	JNTCRP004010PrnDlg	:	TJNTCRP004010PrnDlgf;
	DlgParam	:	TDlgParam;
	RptParam	:	TRptParam;
begin

	m_cJNTArea.setSelAppRecord;						// 販売ポインタ設定

	with DlgParam do
	begin
		DM			:= MDataModule;
		pComArea	:= pointer(m_pMyAppRecord);
		dbCorp		:= dbCorp_Select;

		iSecMastarKbn	:= m_iSecMasterKbn;		//部署マスター区分
		iSecCodeAttr	:= m_iSecAttr;			//部署コード属性
		iSecCodeDigit	:= m_iSecDigit;			//部署コード桁数
		sSecMasterName	:= LPlace.Caption;

		//マスター区分・コード情報は後で取得する
		iMastarKbn		:= m_iHojyoKbn;			//マスター区分
		iCodeAttr		:= m_iHojAttr;			//コード属性
		iCodeDigit		:= m_iHojDigit;			//コード桁数
		sMasterName		:= LHojyo.Caption;

		sRetStCode		:= '';				//開始コード(戻り値)
		sRetEdCode		:= '';				//終了コード(戻り値)
	end;

	JNTCRP004010PrnDlg 	:= TJNTCRP004010PrnDlgf.Create(Self);
	JNTCRP004010PrnDlg.Init(@DlgParam);

	//条件指定ダイアログ表示
	lvRet := JNTCRP004010PrnDlg.ShowModal;
	JNTCRP004010PrnDlg.Free;
	JNTCRP004010PrnDlg := nil;

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
			// 印刷に必要な情報をセット
			if DlgParam.iRetBunrui = m_iHojyoKbn then
			begin
				RptParam.iMasterKbn1	:= m_iHojyoKbn;
				RptParam.iCodeAttr1		:= DlgParam.iCodeAttr;
				RptParam.iCodeDigit1	:= DlgParam.iCodeDigit;
				RptParam.sMasterName1	:= DlgParam.sMasterName;

				RptParam.iMasterKbn2	:= m_iSecMasterKbn;
				RptParam.iCodeAttr2		:= DlgParam.iSecCodeAttr;
				RptParam.iCodeDigit2	:= DlgParam.iSecCodeDigit;
				RptParam.sMasterName2	:= DlgParam.sSecMasterName;
			end
			else begin
				RptParam.iMasterKbn1	:= m_iSecMasterKbn;
				RptParam.iCodeAttr1		:= DlgParam.iSecCodeAttr;
				RptParam.iCodeDigit1	:= DlgParam.iSecCodeDigit;
				RptParam.sMasterName1	:= DlgParam.sSecMasterName;

				RptParam.iMasterKbn2	:= m_iHojyoKbn;
				RptParam.iCodeAttr2		:= DlgParam.iCodeAttr;
				RptParam.iCodeDigit2	:= DlgParam.iCodeDigit;
				RptParam.sMasterName2	:= DlgParam.sMasterName;
			end;
			RptParam.sRetStCode		:= DlgParam.sRetStCode;
			RptParam.sRetEdCode		:= DlgParam.sRetEdCode;

            if fnPrnSET (RptParam) = False then Exit;

			PrtParam.TargetMD   :=  MemPrint;
            // <PRN>
            with PrtParam do
			begin
				Para		:=  uvHani;
				TargetQry	:=  DmqPrint;
				CorpSys		:=  uvSelSys;
                JNTArea         :=  m_cJNTArea;
                // *** 汎用変数 *** //
                TargetParam	    :=  nil;
	    	    TargetStr	    :=  '';
    		    TargetInt	    :=  0;
                // *** 汎用変数 *** //
			end;

            //印刷する<PRN>
            PrintAppEntry(nil,nil,1,PrtParam,@RptParam,ArrHdl);
        end;
    end;

	m_cJNTArea.setMasAppRecord;						                    // 財務ポインタ設定


{inoue
    PrnForm := TJNTCRP001030PrintF.Create( Self ); // <LEAD>

	if Assigned(PrnForm) <> True then
	begin

//<LEAD>		GetMsg(rcMsg,30,2);
//<LEAD>		with rcMsg do
//<LEAD>		begin
//<LEAD>			MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
//<LEAD>		end;
		Abort;
	end;
}
(*
	try
		try
			PrnForm.NSPDB	:= dbNSPCorp;										// 会社DB
			PrnForm.dbNSPCom:= DBNSPCommon;									    // 給与DB
			PrnForm.DBCTL	:= dbCtlDb;											// 共通DB
			PrnForm.iCopNo	:= m_pRec.m_iCorpCode;								// 会社コード
			PrnForm.DBMod	:= DBMod;											// DBモジュール
			PrnForm.giKeta	:= 4;												// 桁数

			PrnForm.fnPrint(m_pRec);											// 印刷処理

		except
//<LEAD>			GetMsg(rcMsg,30,2);
//<LEAD>			with rcMsg do
//<LEAD>			begin
//<LEAD>				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
//<LEAD>			end;
			Abort;
		end;
	finally
		PrnForm.Free;
		PrnForm := Nil;
	end;
*)
end;

//-----------------------------------------------------------------------------
// BChangeClick()
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004010F.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    lvRect  : TRect;
    lvWidth,
    lvHeight: Integer;
begin

    // ここでActiveControlをｾｯﾄする。
    m_ACControl :=  Screen.ActiveControl;

    m_bBtnChange := FALSE;

    if ( B_Change.Caption = '埋込(&G)' ) then
    begin
        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGINEND;         // 格納通知
        B_Change.Caption    := '切出(&G)';                  // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible             :=	FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect              :=  Self.ClientRect;
        lvWidth             :=  lvRect.Right - lvRect.Left;
        lvHeight            :=  lvRect.Bottom - lvRect.Top;

        ClientWidth         :=  lvWidth;
        ClientHeight        :=  lvHeight;
		Visible		        :=	TRUE;

        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGOUTEND;        // 取出通知
        B_Change.Caption    :=  '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=  Pointer(m_Base_pRec);       // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=  nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := TRUE;

end;

//************************************************************************
//	Component		:	DGrid_Hojyo
//	Event			:	ChangeNode(選択行位置が変わったとき - ChangeNodeExの前に実行)
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_HojyoChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
	// ChangeNodeEx, SelectedCountChangeｲﾍﾞﾝﾄ前に初期化
	m_bChangeNode2 := False;
end;

//************************************************************************
//	Component		:	DGrid_Hojyo
//	Event			:	ChangeNodeEx(選択行位置が変わったとき)
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_HojyoChangeNodeEx(Sender: TObject);
var
	N : TdxTreeListNode;
begin

	if m_bFirstFlag[0] = False then
		Exit;
	if m_bChangeNode = True then
		Exit;
	// 先にSelectedCountChangeｲﾍﾞﾝﾄ実行済みの場合はEXIT
	if m_bChangeNode2 = True then
		Exit;
	// 移動先のノードを選択していない場合はEXIT
	N := DGrid_Hojyo.FocusedNode;
	if (N <> nil) then
		if N.Selected = False then Exit;

	Set_DGrid_Place_DispKbn;

	m_bChangeNode2	:= True;

end;

//************************************************************************
//	Component		:	DGrid_Hojyo
//	Event			:	SelectedCountChange(選択行数が変わったとき)
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_HojyoSelectedCountChange(Sender: TObject);
begin

	if m_bFirstFlag[0] = False then
		Exit;
	if m_bChangeNode = True then
		Exit;

	Set_DGrid_Place_DispKbn;

	m_bChangeNode2 := True;

end;

//************************************************************************
//	Component		:	DGrid_Place_DispKbn
//	Event			:	ToggleClick
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_Place_DispKbnToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
var
	iPlaceNCode	: Int64;
begin
	if m_bChangeNode = True then
		Exit;

	iPlaceNCode := Trunc(DMemData_PlaceNCode.AsCurrency);
	if State = cbsUnchecked then
		Set_List_DispKbn(False, iPlaceNCode)
	else if State = cbsChecked then
		Set_List_DispKbn(True, iPlaceNCode);
end;

//************************************************************************
//	Component		:	MSPFunctionBarFunction
//	Event			:	Click
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
var
	bCheck	: Boolean;
begin
	if (uvDispFlg = 1) then Exit;

	if FuncNo = 5 then	// 全選択
		bCheck := True
	else if FuncNo = 6 then	// 全選択解除
		bCheck := False
	else
		Exit;

	Set_List_DispKbn(bCheck);
end;

//************************************************************************
//	Component		:	DGrid_Place
//	Event			:	Enter
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_PlaceEnter(Sender: TObject);
begin
	FncBtnControl(True);
end;

//************************************************************************
//	Component		:	DGrid_Place
//	Event			:	Exit
//	Name			:	E.Nanba(Lab)
//************************************************************************
procedure TJNTCRP004010F.DGrid_PlaceExit(Sender: TObject);
begin
	if CloseFlg = False then
		FncBtnControl(False);
end;

//-----------------------------------------------------------------------------
{private function記述 START位置}
//=============================================================================

//******************************************************************************
//		Proccess	: 画面初期処理 <#3>
//		Name		: E.Nanba(Lab)
//		Date		: 2009/01/15
//		Parameter	: Nothing
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.DspInit();
begin
	if m_iDlgKbn <> 1 then
	begin
		TJNTCRP004010F(Self).BorderStyle	:= bsNone;
		TJNTCRP004010F(Self).Position		:= poDesigned;

		BPrint_Sec.Visible					:= False;

		BUpdate_Sec.Visible					:= True;

		BOk_Sec.Visible						:= False;

		BCancel_Sec.Caption					:= '取消(&C)';
		BCancel_Sec.ModalResult				:= mrNone;
	end
	else begin
		TJNTCRP004010F(Self).BorderStyle	:= bsDialog;
		TJNTCRP004010F(Self).Position		:= poScreenCenter;
		TJNTCRP004010F(Self).ClientHeight	:= Trunc(564 * m_iZoom / 100);

		BPrint_Sec.Visible					:= True;
		BPrint_Sec.OnClick                  := BPrintClick;

		BUpdate_Sec.Visible					:= False;

		BOk_Sec.Visible						:= True;
		BOk_Sec.Top							:= Trunc(487 * m_iZoom / 100);
		BOk_Sec.Left						:= Trunc(729 * m_iZoom / 100);

		BCancel_Sec.Caption					:= 'キャンセル(&C)';
		BCancel_Sec.ModalResult				:= mrCancel;
		BCancel_Sec.Width					:= Trunc(110 * m_iZoom / 100);
	end;
end;

//******************************************************************************
//		Proccess	: 編集をキャンセルする
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: Nothing
//		Return		: Nothing
//******************************************************************************
function TJNTCRP004010F.fnCancel: Boolean;
var
	N : TdxTreeListNode;
begin
	Result := False;

	// 編集状態ｽｲｯﾁを初期化する
	m_EdtSw := False;

	if (DMemData_Hojyo.RecordCount = 0) or (DMemData_Place.RecordCount = 0) then
	begin
		Result := True;
		Exit;
	end;

	ListReload;

	// 表示区分クリア
	DMemData_Place.First;
	while not DMemData_Place.Eof do
	begin
		DMemData_Place.Edit;
		DMemData_PlaceDispKbn.AsBoolean := False;
		DMemData_Place.Next;
	end;

	// 部署グリッド更新
	DMemData_Hojyo.First;
	ListReload_1(Trunc(DMemData_HojyoNCode.AsCurrency));

	DGrid_Hojyo.ClearSelection;	// 選択解除
	MjsSetFocus(Self, 'DGrid_Hojyo');
	N := DGrid_Hojyo.FocusedNode;
	if N <> nil then
		N.Selected := True;
end;

//******************************************************************************
//		Proccess	: マスタ情報取得
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: Query
//					: iMasterKbn
//					: (out)iDigit,iAttr,sName
//		Return		: True		: OK
//					: False		: NG
//******************************************************************************
function TJNTCRP004010F.fnGetMasterInfo(Query: TMQuery; iMasterKbn: Integer;
	var iDigit, iAttr: Integer; var sName: String): Boolean;
begin
	Result := False;

	iDigit	:= 0;
	iAttr	:= 0;
	sName	:= '';

	with Query do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT CodeDigit,CodeAttr,JHojyoName FROM MasterInfo');
		SQL.Add('WHERE MasterKbn = :KBN AND UseKbn > 0');
		SetFld('KBN').AsInteger := iMasterKbn;
		if Open = False then
		begin
			ErrorMessageDsp(Query);
			Exit;
		end;
		if not Eof then
		begin
			iDigit	:= GetFld('CodeDigit').AsInteger;
			iAttr	:= GetFld('CodeAttr').AsInteger;
			sName	:= GetFld('JHojyoName').AsString;
		end
		else Exit;
	end;

	Result := True;
end;

//******************************************************************************
//		Proccess	: Gridカラムプロパティセット
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: column
//					: iDigit,iAttr
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.setGridColumn(column: TdxDBGridColumn; iDigit,iAttr: Integer);
begin
	if iAttr = 2 then
	begin
		column.Alignment		:= taLeftJustify;
		column.EditAlignment	:= taLeftJustify;
		column.Hankaku			:= True;
		column.ImeMode			:= imSKata;
		column.MaxLength		:= iDigit;
	end
	else begin
		column.Alignment		:= taRightJustify;
		column.EditAlignment	:= taRightJustify;
		column.Hankaku			:= False;
		column.ImeMode			:= imDisable;
		column.MaxLength		:= iDigit;
	end;
end;

//******************************************************************************
//		Proccess	: リスト作成
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: Nothing
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.ListCreate;
var
	sSQL	: String;
	iHojyoNCode	: Int64;
	dqHojyo, dqPlace	: TMQuery;
begin

	m_lDspHNCode	:= TStringList.Create;
	m_lDspPNCode	:= TStringList.Create;
	m_lDspKbn		:= TStringList.Create;
	m_lDspKbnDB		:= TStringList.Create;
	m_lDspKbnExt	:= TStringList.Create;
	m_lHojyo		:= TStringList.Create;
	m_lPlace		:= TStringList.Create;
	m_iPlaceCount	:= 0;

	dqHojyo := TMQuery.Create(Self);
	dqPlace := TMQuery.Create(Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, dqHojyo);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, dqPlace);

	try
		dqPlace.Close;
		dqPlace.SQL.Clear;
		HojyoSQLMake(sSQL, m_iSecMasterKbn, 1);	// 内部コード順
		dqPlace.SQL.Add(sSQL);
		if dqPlace.Open = False then
		begin
			ErrorMessageDsp(dqPlace);
			Exit;
		end;
		m_iPlaceCount := dqPlace.RecordCount;

		dqHojyo.Close;
		dqHojyo.SQL.Clear;
		HojyoSQLMake(sSQL, m_iHojyoKbn, 1);	// 内部コード順
		dqHojyo.SQL.Add(sSQL);
		if dqHojyo.Open = False then
		begin
			ErrorMessageDsp(dqHojyo);
			Exit;
		end;
		while not dqHojyo.Eof do
		begin
			iHojyoNCode := Trunc(dqHojyo.GetFld('NCode').AsCurrency);

			// リストインデックス保存
			m_lHojyo.Add	(IntToStr(iHojyoNCode));

			dqPlace.First;
			while not dqPlace.Eof do
			begin
				m_lDspHNCode.Add(IntToStr(iHojyoNCode));
				m_lDspPNCode.Add(CurrToStr(Trunc(dqPlace.GetFld('NCode').AsCurrency)));
//<#2> MOD St
//				m_lDspKbn.Add('2');		// 非表示
//				m_lDspKbnDB.Add('2');	// 非表示
				m_lDspKbn.Add('0');		// ﾃﾞﾌｫﾙﾄ
				m_lDspKbnDB.Add('0');	// ﾃﾞﾌｫﾙﾄ
//<#2> MOD Ed
				m_lDspKbnExt.Add('0');	// データなし

				if m_lHojyo.Count = 1 then // 初回のみ
					m_lPlace.Add(CurrToStr(Trunc(dqPlace.GetFld('NCode').AsCurrency)));

				dqPlace.Next;
			end;

			dqHojyo.Next;
		end;
	finally
		dqHojyo.Close;
		dqHojyo.Free;
		dqPlace.Close;
		dqPlace.Free;
	end;
end;

//******************************************************************************
//		function	: DB→リスト
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: Nothing
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.ListReload(iFstFlg: Integer = -1);
var
	i	: Integer;
	DMQuery	: TMQuery;
	iHojyoNCode,iPlaceNCode	: Int64;
//	indexfm,indexto	: Integer;
	index,iHidx,iPidx	: Integer;
begin
	// リストクリア
	if Assigned(m_lDspHNCode) then
	begin
		i := 0;
		while i < m_lDspKbn.Count do
		begin
//<#2> MOD St
//			m_lDspKbn[i]	:= '2';
//			m_lDspKbnDB[i]	:= '2';
			m_lDspKbn[i]	:= '0';	// ﾃﾞﾌｫﾙﾄ
			m_lDspKbnDB[i]	:= '0';	// ﾃﾞﾌｫﾙﾄ
//<#2> MOD Ed
			Inc(i);
		end;
	end;

	DMQuery  := TMQuery.Create(Self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	iHojyoNCode := 0;
//	indexfm := 0;
//	indexto := m_lDspKbn.Count - 1;

	iHidx := -1;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);
	try
		with DMQuery do
		begin
			Close;
			SQL.Clear;
{
			SQL.Add('SELECT PlaceNCode,NCode,ISNULL(DispKbn,2) AS DispKbn FROM SecHojyoDispInfo');
			SQL.Add('WHERE OpeKbn  = 1');
			SQL.Add('AND MasterKbn = :KBN');
			SQL.Add('AND NoDispMasterKbn = :HOJKBN');
			if iFstFlg = -1 then
				SQL.Add('AND DispKbn = 1');
			SQL.Add('ORDER BY NCode');
}
//<#2> MOD St
//			SQL.Add('SELECT SD.PlaceNCode,SD.NCode,ISNULL(SD.DispKbn,2) AS DispKbn');
			SQL.Add('SELECT SD.PlaceNCode,SD.NCode,ISNULL(SD.DispKbn,0) AS DispKbn');
//<#2> MOD Ed
			SQL.Add('FROM SecHojyoDispInfo AS SD');

//<#3> MOD St
//			SQL.Add('LEFT OUTER JOIN MTOKUI AS MTK ON (SD.NCode = MTK.NCode AND MTK.SumKbn = 0)')

			case m_iHojyoKbn of
				MST_CUSTOMER
				:begin
					SQL.Add('LEFT OUTER JOIN MTOKUI AS MTK ON (SD.NCode = MTK.NCode AND MTK.SumKbn = 0 AND MTK.TemplateKbn = 0 AND MTK.RDelKbn = 0)');
				end;

				MST_KOJI..MST_KOJI+9
				:begin
					SQL.Add('LEFT OUTER JOIN HojyoMA AS MTK ON (SD.NCode = MTK.NCode AND MTK.SumKbn = 0 AND MTK.RDelKbn = 0 )');
				end;
			end;
//<#3> MOD Ed

			SQL.Add('LEFT OUTER JOIN HojyoMA AS HMA ON (SD.MasterKbn = HMA.MasterKbn AND SD.PlaceNCode = HMA.NCode AND HMA.SumKbn = 0)');
			SQL.Add('WHERE SD.OpeKbn  = 1');
			SQL.Add('AND SD.MasterKbn = :KBN');
			SQL.Add('AND SD.NoDispMasterKbn = :HOJKBN');

//<#3> DEL St
//			SQL.Add('AND MTK.TemplateKbn = 0 AND MTK.RDelKbn = 0');
//<#3> DEL Ed
//<#7> ADD St
			case m_iHojyoKbn of
				MST_CUSTOMER
				:begin
					SQL.Add('AND MTK.SumKbn = 0 AND MTK.TemplateKbn = 0 AND MTK.RDelKbn = 0');
				end;

				MST_KOJI..MST_KOJI+9
				:begin
					SQL.Add('AND MTK.SumKbn = 0 AND MTK.RDelKbn = 0 ');
				end;
			end;
//<#7> ADD Ed

			SQL.Add('AND HMA.RDelKbn = 0 AND HMA.Syokuchikbn = 0');

//<#2> DEL St
//			if iFstFlg = -1 then
//				SQL.Add('AND SD.DispKbn = 1');
//<#2> DEL Ed

			SQL.Add('ORDER BY SD.NCode');

			SetFld('KBN').AsInteger		:= m_iSecMasterKbn;
			SetFld('HOJKBN').AsInteger	:= m_iHojyoKbn;
			if Open = False then
			begin
				ErrorMessageDsp(DMQuery);
				Exit;
			end;

			while not Eof do
			begin
				if iHojyoNCode <> Trunc(Fields[1].AsCurrency) then // NCode
				begin
					iHojyoNCode := Trunc(Fields[1].AsCurrency);

//					if fnGetSearchIndex(iHojyoNCode, indexfm, indexto) = False then
//						Exit;
					iHidx := fnGetListIndex(m_lHojyo, iHojyoNCode);
					if iHidx = -1 then continue;
				end;

				iPlaceNCode := Trunc(Fields[0].AsCurrency); // PlaceNCode
				iPidx := fnGetListIndex(m_lPlace, iPlaceNCode);
				if iPidx = -1 then continue;

				// 更新先リストインデックス取得
//				index := fnGetIndex(indexfm, indexto, iHojyoNCode, iPlaceNCode);
				// リストは取引先別部署別で作成されていることが前提
				index := (iHidx * m_iPlaceCount) + iPidx;
				if (index < 0) or (m_lDspKbn.Count <= index) then
					Exit;

//<#2> MOD St
//				if Fields[2].AsInteger = 1 then // DispKbn
//				begin
//					m_lDspKbn[index]	:= '1';
//					m_lDspKbnDB[index]	:= '1';
//				end;

				m_lDspKbn[index]	:= IntToStr(Fields[2].AsInteger);
				m_lDspKbnDB[index]	:= IntToStr(Fields[2].AsInteger);
//<#2> MOD Ed
				m_lDspKbnExt[index] := '1';	// データあり

				Next;
			end;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//******************************************************************************
//		function	: リスト→部署グリッド表示区分  表示
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: iNCode	取引先内部コード
//					: index		選択行内のインデックス
//		Return		: Nothing
//		Memo		: この関数呼出前にDMemData_PlaceDispKbnをFalseにしておく事！
//******************************************************************************
procedure TJNTCRP004010F.ListReload_1(iNCode: Int64; index: Integer = -1);
var
	i,indexfm,indexto	: Integer;
	cPlaceNCode		: Currency;
begin
	// 取引先開始インデックス取得
	if fnGetSearchIndex(iNCode, indexfm, indexto) = False then
		Exit;

	for i := indexfm to indexto do
	begin
		cPlaceNCode := StrToCurr(m_lDspPNCode[i]);

		if DMemData_Place.Locate('NCode', cPlaceNCode, [loCaseInsensitive]) then
		begin
			DMemData_Place.Edit;

			if DMemData_PlaceDispKbn.AsBoolean <> fnGetDspKbn(m_lDspKbn[i]) then
			begin
				// 複数行選択のときNULL値をセット
				if (DGrid_Hojyo.SelectedCount > 1) then
				begin
					if index = 0 then	// 1行目
						DMemData_PlaceDispKbn.AsBoolean := fnGetDspKbn(m_lDspKbn[i])
					else
						DMemData_PlaceDispKbn.AsVariant := NULL;
				end
				else
					DMemData_PlaceDispKbn.AsBoolean := fnGetDspKbn(m_lDspKbn[i]);
			end;

			DMemData_Place.Post;
		end;
	end;
	DMemData_Place.First;
end;

//******************************************************************************
//		function	: DGrid_Hojyo選択行変更時、使用可否チェックボックス更新
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: Nothing
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.Set_DGrid_Place_DispKbn();
var
	idx,iRetNo	: Integer;
	iHojyoNCode	: Int64;
	sBookmark	: TBookMark;
begin
	m_bChangeNode	:= True;

	DMemData_Place.DisableControls;
	iRetNo := DMemData_Hojyo.RecNo;

	try
		// 複数行選択でない
		if DGrid_Hojyo.SelectedCount <= 1 then
		begin
			// 表示区分クリア
			DMemData_Place.First;
			while not DMemData_Place.Eof do
			begin
				DMemData_Place.Edit;
				DMemData_PlaceDispKbn.AsBoolean := False;
				DMemData_Place.Next;
			end;
		end;

		for idx := 0 to DGrid_Hojyo.SelectedCount - 1 do
		begin
			sBookmark := DGrid_Hojyo.SelectedRows[idx];
            DMemData_Hojyo_Dmy.GotoBookmark(sBookmark);
			iHojyoNCode := Trunc(DMemData_Hojyo_DmyNCode.AsCurrency);

			ListReload_1(iHojyoNCode, idx);
		end;
{
		// 取引先別情報をリストから再セット
		iHojyoNCode := Trunc(DMemData_HojyoNCode.AsCurrency);
		ListReload_1(iHojyoNCode, DGrid_Hojyo.SelectedCount - 1);
}
	finally
		DMemData_Hojyo.RecNo := iRetNo;
		DMemData_Place.EnableControls;

		m_bChangeNode := False;
	end;
end;

//******************************************************************************
//		function	: リスト  表示区分セット
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: bCheck	True:全選択　False:全選択解除
//					: iPNCode	部署内部コード（指定なしのときは全部署）
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.Set_List_DispKbn(bCheck: Boolean; iPNCode: Int64 = -1);
var
	idx	: Integer;
	iHojyoNCode,iPlaceNCode	: Int64;
	sBookmark	: TBookMark;
	index,indexfm,indexto	: Integer;
	iLoop,iLoopMax	: Integer;
	bAll	: Boolean;
	iHidx,iPidx	: Integer;
begin
	if DMemData_Hojyo.RecordCount = 0 then Exit;

	if iPNCode = -1 then
	begin
		iLoopMax	:= DMemData_Place.RecordCount - 1;	// 全部署
		bAll		:= True;
	end
	else begin
		iLoopMax	:= 0;
		bAll		:= False;
	end;

	m_bChangeNode := True;
	try
		if bAll then
		begin
			DMemData_Place.First;
			for iLoop := 0 to iLoopMax do
			begin
				// チェック変更
				DMemData_Place.Edit;
				DMemData_PlaceDispKbn.AsBoolean := bCheck;
				DMemData_Place.Next;
			end;
		end;

		for idx := 0 to DGrid_Hojyo.SelectedCount - 1 do
		begin
			sBookmark := DGrid_Hojyo.SelectedRows[idx];
			DMemData_Hojyo_Dmy.GotoBookmark(sBookmark);
			iHojyoNCode := Trunc(DMemData_Hojyo_DmyNCode.AsCurrency);

			iHidx := fnGetListIndex(m_lHojyo, iHojyoNCode);
			if iHidx = -1 then continue;

			// 取引先開始インデックス取得
			if fnGetSearchIndex(iHojyoNCode, indexfm, indexto) = False then
				Exit;

			if bAll then
			begin
				for iLoop := indexfm to indexto do
				begin
//<#2> MOD St
//					if fnGetDspKbn(m_lDspKbn[iLoop]) <> bCheck then
//						m_EdtSw := True;	// 編集ｽｲｯﾁを設定する

					if (m_lDspKbn[iLoop] = '0') or
					   (fnGetDspKbn(m_lDspKbn[iLoop]) <> bCheck) then
						m_EdtSw := True;	// 編集ｽｲｯﾁを設定する
//<#2> MOD Ed

					if bCheck then
						m_lDspKbn[iLoop] := '1'
					else
						m_lDspKbn[iLoop] := '2';
				end;
			end
			else begin
				for iLoop := 0 to iLoopMax do
				begin
					if bAll then
					begin
						// チェック変更
						DMemData_Place.Edit;
						DMemData_PlaceDispKbn.AsBoolean := bCheck;

						iPlaceNCode := Trunc(DMemData_PlaceNCode.AsCurrency);
					end
					else
						iPlaceNCode := iPNCode;

					iPidx := fnGetListIndex(m_lPlace, iPlaceNCode);
					if iPidx = -1 then continue;

					// 更新先リストインデックス取得
//					index := fnGetIndex(indexfm, indexto, iHojyoNCode, iPlaceNCode);
					// リストは取引先別部署別で作成されていることが前提
					index := (iHidx * m_iPlaceCount) + iPidx;
					if (index < 0) or (m_lDspKbn.Count <= index) then
						Exit;

//<#2> MOD St
//					if fnGetDspKbn(m_lDspKbn[index]) <> bCheck then
//						m_EdtSw := True;	// 編集ｽｲｯﾁを設定する

					if (m_lDspKbn[index] = '0') or
					   (fnGetDspKbn(m_lDspKbn[index]) <> bCheck) then
						m_EdtSw := True;	// 編集ｽｲｯﾁを設定する
//<#2> MOD Ed

					if bCheck then
						m_lDspKbn[index] := '1'
					else
						m_lDspKbn[index] := '2';

					if bAll then
						DMemData_Place.Next;
				end;
			end;
		end;
	finally
		if bAll then
			DMemData_Place.First;

		m_bChangeNode := False;
	end;
end;

//******************************************************************************
//		function	: 検索対象インデックス取得
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: iNCode	取引先内部コード
//					: (out)iSt,iEd
//		Return		: Boolean
//******************************************************************************
function TJNTCRP004010F.fnGetSearchIndex(iNCode: Int64; var iSt,iEd: Integer): Boolean;
var
	i	: Integer;
	iPlaceCount	: Integer;
begin
	Result := False;

	i := m_lHojyo.IndexOf(IntToStr(iNCode));

	if (i < 0) then Exit;

	iPlaceCount := DMemData_Place.RecordCount;

	iSt := i * iPlaceCount;
	iEd := iSt + iPlaceCount - 1;

	Result := True;
end;

//******************************************************************************
//		function	: リスト検索
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: List	検索対象リスト
//					: iData	検索データ（内部コード）
//		Return		: Integer
//******************************************************************************
function TJNTCRP004010F.fnGetListIndex(List: TStringList; iData: Int64): Integer;
var
	Left,
	Right,
	Middle	:	Integer;
begin
	Result	:= -1;
	Left	:= 0;
	Right	:= List.Count - 1;

	while Left < Right do
	begin
		Middle	:= (Left + Right) div 2;

		if iData = StrToInt64Def(List[Middle], 0) then
		begin
			Result	:= Middle;
			Exit;
		end
		else if iData < StrToInt64Def(List[Middle], 0) then
		begin
			Right	:= Middle;
		end
		else if iData > StrToInt64Def(List[Middle], 0) then
		begin
			Left	:= Middle + 1;
		end;
	end;

	if Left = Right then
	begin
		if iData = StrToInt64Def(List[Left], 0) then
		begin
			Result	:= Left;
			Exit;
		end;
	end;
end;

//******************************************************************************
//		function	: 取引先別部署別リスト検索
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: iStIndex	検索開始インデックス（全検索のときは0）
//					: iEdIndex	検索終了インデックス（全検索のときは0）
//					: iHNCode	補助内部コード
//					: iPNCode	部署内部コード
//		Return		: Integer
//******************************************************************************
{function TJNTCRP004010F.fnGetIndex(iStIndex,iEdIndex: Integer; iHNCode: Int64; iPNCode: Int64 = -1): Integer;
var
	Left,
	Right,
	Middle	:	Integer;
begin
	Result	:= -1;
	Left	:= 0;
	Right	:= m_lDspHNCode.Count - 1;

	// 指定インデックス範囲で検索
	if (iStIndex > 0) and (iStIndex < m_lDspHNCode.Count) then
		Left	:= iStIndex;
	if (iEdIndex > 0) and (iEdIndex < m_lDspHNCode.Count) then
		Right	:= iEdIndex;

	while Left < Right do
	begin
		Middle	:= (Left + Right) div 2;

		if iHNCode = StrToInt64Def(m_lDspHNCode[Middle], 0) then
		begin
			if iPNCode = StrToInt64Def(m_lDspPNCode[Middle], 0) then
			begin
				Result	:= Middle;
				Exit;
			end
			else if iPNCode < StrToInt64Def(m_lDspPNCode[Middle], 0) then
			begin
				Right	:= Middle;
			end
			else if iPNCode > StrToInt64Def(m_lDspPNCode[Middle], 0) then
			begin
				Left	:= Middle + 1;
			end;
		end
		else if iHNCode < StrToInt64Def(m_lDspHNCode[Middle], 0) then
		begin
			Right	:= Middle;
		end
		else if iHNCode > StrToInt64Def(m_lDspHNCode[Middle], 0) then
		begin
			Left	:= Middle + 1;
		end;
	end;

	if Left = Right then
	begin
		if (iHNCode = StrToInt64Def(m_lDspHNCode[Left], 0))
		and (iPNCode = StrToInt64Def(m_lDspPNCode[Left], 0)) then
		begin
			Result	:= Left;
			Exit;
		end;
	end;
end;
}
//******************************************************************************
//		function	: 表示区分Boolean型変換
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: sKbn	表示区分
//		Return		: Boolean
//******************************************************************************
function TJNTCRP004010F.fnGetDspKbn(sKbn: String): Boolean;
begin
//<#2> MOD St
//	if (sKbn = '1') then

	if (sKbn = '1') or
	   ((sKbn = '0') and (m_iHojDefKbn = 1)) then
//<#2> MOD Ed
		Result := True
	else
		Result := False;
end;

//******************************************************************************
//		function	: fnSec_Select 関数
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//******************************************************************************
function TJNTCRP004010F.fnSec_Select: Boolean;
var
	DMQuery		: TMQuery;
	iHojyoNCode	: Int64;
	sSQL,sGCode		: String;
begin
	Result := False;
	DMQuery  := TMQuery.Create(Self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続
	try
		fnCompClear;
		if uvDispFlg = 0 then
			fnCompEnabled(True)
		else
		begin
			fnCompEnabled(False);

//<Authority> DEL			BPrint_Sec.Enabled  := m_cJNTArea.IsPrint;							//<#3> ADD
			BPrint_Sec.Enabled  := m_JNTAuthority.IsPrint;							//<Authority> ADD
			BCancel_Sec.Enabled := True;

//<#3> DEL
//			if m_cJNTArea.IsModify = True then
//				MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
		end;

		with DMQuery do
		begin
			// 取引先表示
			Close;
			SQL.Clear;
			HojyoSQLMake(sSQL, m_iHojyoKbn, 0);	// 外部コード順
			SQL.Add(sSQL);

			if Open = False then
			begin
				ErrorMessageDsp(DMQuery);
				Exit;
			end;

			while not Eof do
			begin
				DMemData_Hojyo.Append;
				DMemData_HojyoNCode.AsCurrency		:= GetFld('NCode').AsCurrency;

				// 外部ｺｰﾄﾞ編集
				sGCode := GetFld('GCode').AsString;
				if m_iHojAttr < 2 then
				begin
					System.Delete(sGCode, 1, 16 - m_iHojDigit);
					if m_iHojAttr = 0 then
						sGCode := IntToStr(StrToInt64(sGCode));
				end;
				DMemData_HojyoGCode.AsString		:= sGCode;

				DMemData_HojyoName.AsString			:= GetFld('SimpleName').AsString;
				DMemData_HojyoRenso.AsString		:= GetFld('Renso').AsString;
				DMemData_HojyoInsDateTM.AsDateTime	:= GetFld('InsDateTM').AsDateTime;
				DMemData_Hojyo.Post;

				DMemData_Hojyo_Dmy.Append;
				DMemData_Hojyo_DmyNCode.AsCurrency	:= GetFld('NCode').AsCurrency;
				DMemData_Hojyo_Dmy.Post;

				Next;
			end;

			// 部署表示(諸口以外)
			Close;
			SQL.Clear;
			HojyoSQLMake(sSQL, m_iSecMasterKbn, 0);	// 外部コード順
			SQL.Add(sSQL);

			if Open = False then
			begin
				ErrorMessageDsp(DMQuery);
				Exit;
			end;
			while not Eof do
			begin
				DMemData_Place.Append;
				DMemData_PlaceNCode.AsCurrency		:= GetFld('NCode').AsCurrency;

				// 外部ｺｰﾄﾞ編集
				sGCode := GetFld('GCode').AsString;
				if m_iSecAttr < 2 then
				begin
					System.Delete(sGCode, 1, 16 - m_iSecDigit);
					if m_iSecAttr = 0 then
						sGCode := IntToStr(StrToInt64(sGCode));
				end;
				DMemData_PlaceGCode.AsString		:= sGCode;

				DMemData_PlaceName.AsString			:= GetFld('SimpleName').AsString;
				DMemData_Place.Post;
				Next;
			end;
		end;

		if DMemData_Hojyo.RecordCount > 0 then
		begin
			// 使用可否表示
			DMemData_Hojyo.First;
			iHojyoNCode := Trunc(DMemData_HojyoNCode.AsCurrency);

			DMemData_Place.DisableControls;
			try
				// 表示区分クリア
				DMemData_Place.First;
				while not DMemData_Place.Eof do
				begin
					DMemData_Place.Edit;
					DMemData_PlaceDispKbn.AsBoolean := False;
					DMemData_Place.Next;
				end;

				ListReload_1(iHojyoNCode);		// 取引先別情報をリストから再セット
			finally
				DMemData_Place.EnableControls;
			end;
		end;

		Result := True;

	finally
		DMQuery.Close ;
		DMQuery.Free ;
	end;

	DGrid_Hojyo.DataSource := DDataSource_Hojyo;

	m_EdtSw := False;
end;

//******************************************************************************
//		function	: ﾌｧﾝｸｼｮﾝﾊﾞｰﾎﾞﾀﾝ制御
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: btnEnabled
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.FncBtnControl(btnEnabled: Boolean);
var
	arCaption: array[0..7] of String;
begin
	arCaption[0] := ',0';
	arCaption[1] := ',0';
	arCaption[2] := ',0';
	arCaption[3] := ',0';

	if (btnEnabled) and (uvDispFlg = 0) then
	begin
		arCaption[4] := 'F5 全選択,1';
		arCaption[5] := 'F6 全選択解除,1';
	end
	else begin
		arCaption[4] := 'F5 全選択,0';
		arCaption[5] := 'F6 全選択解除,0';
	end;
	arCaption[6] := ',0';
	arCaption[7] := ',0';

	MSPFunctionBar.CopyFuncData(arCaption);
end;

//******************************************************************************
//		function	: MV_MAS_HojyoMA SELECT文作成
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: (out)sSQL
//					: iMasterKbn	マスタ区分
//					: iOrderKbn		0:外部コード順  1:内部コード順
//		Return		: Nothing
//******************************************************************************
procedure TJNTCRP004010F.HojyoSQLMake(var sSQL: String; iMasterKbn,iOrderKbn: Integer);
begin
	sSQL := '';

//	sSQL := 'SELECT NCode,GCode,SimpleName,Renso,InsDateTM FROM MV_MAS_HojyoMA '
//			+ 'WHERE MasterKbn = ' + IntToStr(iMasterKbn) + ' AND SumKbn = 0 AND RDelKbn = 0 ';
//	if iMasterKbn in [MST_SEGMENT..MST_SEGMENT+10] then	// 部署
//		sSQL := sSQL + 'AND Syokuchikbn = 0 ';

	case iMasterKbn of
		MST_CUSTOMER				// 取引先
		:begin
			sSQL := 'SELECT NCode,GCode,Nmk AS SimpleName,Renso,InsDateTM FROM MTOKUI '
					+ 'WHERE SumKbn = 0 AND TemplateKbn = 0 AND RDelKbn = 0 ';
		end;

		MST_SEGMENT..MST_SEGMENT+9	// 部署：諸口以外
		:begin
			sSQL := 'SELECT NCode,GCode,SimpleName,Renso,InsDateTM FROM HojyoMA '
					+ 'WHERE MasterKbn = ' + IntToStr(iMasterKbn) + ' AND SumKbn = 0 AND RDelKbn = 0 '
					+ 'AND Syokuchikbn = 0 ';
		end;

		MST_KOJI..MST_KOJI+9		// プロジェクト <#3>ADD
		:begin
			sSQL := 'SELECT NCode,GCode,SimpleName,Renso,InsDateTM FROM HojyoMA '
					+ 'WHERE MasterKbn = ' + IntToStr(iMasterKbn) + ' AND SumKbn = 0 AND RDelKbn = 0 ';
		end;
	end;

	if iOrderKbn = 0 then
		sSQL := sSQL + 'ORDER BY GCode '
	else if iOrderKbn = 1 then
		sSQL := sSQL + 'ORDER BY NCode ';
end;

//******************************************************************************
//		function	: fnSec_Update 関数
//		Name		: E.Nanba(Lab)
//		Date		: 2007/02/27
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//******************************************************************************
function TJNTCRP004010F.fnSec_Update: Boolean;
var
	DMQuery		: TMQuery;
//	sSelSQL,
	sInsSQL,sUpdSQL	: String;
	iCnt	: Integer;
	cHojyoNCode,cPlaceNCode	: Currency;
	bInsert		: Boolean;
begin
	Result := False;
	DMQuery := TMQuery.Create(self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

//	sSelSQL := 'SELECT OpeKbn FROM SecHojyoDispInfo '
//				+ 'WHERE OpeKbn = 1'
//				+ ' AND MasterKbn = ' + IntToStr(m_iSecMasterKbn)
//				+ ' AND PlaceNCode = :PNCODE'
//				+ ' AND NoDispMasterKbn = ' + IntToStr(m_iHojyoKbn)
//				+ ' AND NCode = :HNCODE';


	//<#1> KmkNCode追加
	sInsSQL := 'INSERT INTO SecHojyoDispInfo (OpeKbn, MasterKbn, PlaceNCode, NoDispMasterKbn, NCode, DispKbn, KmkNCode) VALUES '
				+ '(1, ' + IntToStr(m_iSecMasterKbn) + ', :PNCODE, ' + IntToStr(m_iHojyoKbn) + ', :HNCODE, :DISP, 0)';

	sUpdSQL := 'UPDATE SecHojyoDispInfo SET'
				+ ' DispKbn = :DISP'
				+ ' WHERE OpeKbn = 1'
				+ ' AND MasterKbn = ' + IntToStr(m_iSecMasterKbn)
				+ ' AND PlaceNCode = :PNCODE'
				+ ' AND NoDispMasterKbn = ' + IntToStr(m_iHojyoKbn)
				+ ' AND NCode = :HNCODE';

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);
	try
		MDataModule.BeginTran(dbCorp_Select);	//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

		with DMQuery do
		begin
			for iCnt := 0 to m_lDspHNCode.Count - 1 do
			begin
				cHojyoNCode := StrToCurr(m_lDspHNCode[iCnt]);
				cPlaceNCode := StrToCurr(m_lDspPNCode[iCnt]);

				// チェック変更ありのとき更新
				if m_lDspKbn[iCnt] = m_lDspKbnDB[iCnt] then
					Continue;

				// データ存在チェック
				if m_lDspKbnExt[iCnt] = '0' then
					bInsert := True
				else
					bInsert := False;

				Close;
				SQL.Clear;

				if bInsert then
					SQL.Add(sInsSQL)
				else
					SQL.Add(sUpdSQL);
				SetFld('PNCODE').AsCurrency := cPlaceNCode;
				SetFld('HNCODE').AsCurrency := cHojyoNCode;
				SetFld('DISP').AsInteger := StrToInt(m_lDspKbn[iCnt]);

				if ExecSQL = False then
				begin
					MDataModule.Rollback(dbCorp_Select);
					ErrorMessageDsp(DMQuery);
					Exit;
				end;

				m_lDspKbnDB[iCnt]	:= m_lDspKbn[iCnt];
				m_lDspKbnExt[iCnt]	:= '1';
			end;
		end;

		MDataModule.Commit (dbCorp_Select);	//	ｺﾐｯﾄ(反映)

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

	Result := True;
end;

//-----------------------------------------------------------------------------
// フィールド入力値のチェックをする
//-----------------------------------------------------------------------------
function TJNTCRP004010F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
begin
    Result := True;
end;

//============================================================================
//  コンポーネントの使用可・不可の制御
//============================================================================
Procedure TJNTCRP004010F.fnCompEnabled(pBol:Boolean);
begin
	BUpdate_Sec.Enabled := pBol;
	BCancel_Sec.Enabled := pBol;
	BPrint_Sec.Enabled  := pBol;	//<#3>
	BOk_Sec.Enabled     := pBol;	//<#3>

	if pBol then
		DGrid_Place.Options := DGrid_Place.Options - [egoRowSelect]
	else
		DGrid_Place.Options := DGrid_Place.Options + [egoRowSelect];
end;
//============================================================================
//  コンポーネントのクリア
//============================================================================
Procedure TJNTCRP004010F.fnCompClear;
begin
	DMemData_Hojyo.Close;
	DMemData_Hojyo.Open;
	DMemData_Place.Close;
	DMemData_Place.Open;
	DMemData_Hojyo_Dmy.Close;
	DMemData_Hojyo_Dmy.Open;
end;

// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】    <PRN>
// -----------------------------------------------------------------------------
function TJNTCRP004010F.fnPrnSET(RptParam: TRptParam): Boolean;
var
	DmqMTOKUI       : TMQuery;
	sCode1,sCode2	: String;
	sSQL			: String;
	sSecMasterKbn	: String;
	sHojyoKbn		: String;	//<#3>
begin
	Result := False;

    // MQueryの構築
	DmqMTOKUI       :=  TMQuery.Create (Self);
    // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery (dbCorp_Select, DmqMTOKUI);

    if ( MemPrint.Active ) then MemPrint.Close();
    MemPrint.Open();

	sSecMasterKbn := IntToStr(m_iSecMasterKbn);
	sHojyoKbn     := IntToStr(m_iHojyoKbn);		//<#3>

	//<#2> DEL St
	{
	if RptParam.iMasterKbn1 = m_iHojyoKbn then
	begin
		// 取引先別部署別
		sSQL := 'SELECT'
				+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode1,'
				+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm1,'
				+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,' + sSecMasterKbn + ') AS GCode2,'
				+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm2 ';
	end
	else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
	begin
		// 部署別取引先別
		sSQL := 'SELECT'
				+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,'+ sSecMasterKbn + ') AS GCode1,'
				+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm1,'
				+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode2,'
				+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm2 ';
	end
	else Exit;

	sSQL := sSQL
		+ ' FROM SecHojyoDispInfo'
		+ ' WHERE'
		+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
		+ ' AND PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 AND RDelKbn = 0)'
		+ ' AND NCode NOT IN (Select NCode FROM MTOKUI WHERE SumKbn > 0 AND TemplateKbn = 0 AND RDelKbn = 0)'
		+ ' AND OpeKbn = 1'
		+ ' AND MasterKbn = ' + sSecMasterKbn
		+ ' AND NoDispMasterKbn = ' + IntToStr(m_iHojyoKbn)
		+ ' AND DispKbn = 1'
		+ ' ORDER BY GCode1,GCode2';
	}
	//<#2> DEL Ed

	//<#3> DEL St
	{
	if m_iHojDefKbn = 0 then
	begin
		// ﾃﾞﾌｫﾙﾄ非表示
		// 従来通りSecHojyoDispInfoﾒｲﾝで取得

		if RptParam.iMasterKbn1 = m_iHojyoKbn then
		begin
			// 取引先別部署別
			sSQL := 'SELECT'
					+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode1,'
					+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm1,'
					+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,' + sSecMasterKbn + ') AS GCode2,'
					+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm2 ';
		end
		else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
		begin
			// 部署別取引先別
			sSQL := 'SELECT'
					+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,'+ sSecMasterKbn + ') AS GCode1,'
					+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm1,'
					+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode2,'
					+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm2 ';
		end
		else Exit;

		sSQL := sSQL
			+ ' FROM SecHojyoDispInfo'
			+ ' WHERE'
			+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
			+ ' AND PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 AND RDelKbn = 0)'
			+ ' AND NCode NOT IN (Select NCode FROM MTOKUI WHERE SumKbn > 0 AND TemplateKbn = 0 AND RDelKbn = 0)'
			+ ' AND OpeKbn = 1'
			+ ' AND MasterKbn = ' + sSecMasterKbn
			+ ' AND NoDispMasterKbn = ' + IntToStr(m_iHojyoKbn)
			+ ' AND DispKbn = 1'
			+ ' ORDER BY GCode1,GCode2';
	end
	else begin
		// ﾃﾞﾌｫﾙﾄ表示
		// SecHojyoDispInfoにないﾚｺｰﾄﾞも「表示可」として取得するためMTOKUI,HojyoMAをJOIN

		if RptParam.iMasterKbn1 = m_iHojyoKbn then
		begin
			// 取引先別部署別
			sSQL := 'SELECT'
					+ ' MF_MAS_GetMTOKUIGCode(M.NCode) AS GCode1,'
					+ ' MF_MAS_GetMTOKUINmk(M.NCode) AS Nm1,'
					+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode2,'
					+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm2 ';
		end
		else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
		begin
			// 部署別取引先別
			sSQL := 'SELECT'
					+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode1,'
					+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm1,'
					+ ' MF_MAS_GetMTOKUIGCode(M.NCode) AS GCode2,'
					+ ' MF_MAS_GetMTOKUINmk(M.NCode) AS Nm2 ';
		end
		else Exit;

		sSQL := sSQL
			+ ' FROM MTOKUI M'
			+ ' LEFT OUTER JOIN HojyoMA HM ON (HM.MasterKbn=' + sSecMasterKbn + ' AND HM.SumKbn=0 AND HM.RDelKbn=0 AND HM.SyokuchiKbn=0)'
			+ ' LEFT OUTER JOIN SecHojyoDispInfo D ON (D.OpeKbn=1 AND D.MasterKbn=' + sSecMasterKbn + ' AND D.NoDispMasterKbn=' + IntToStr(m_iHojyoKbn) + ' AND D.NCode=M.NCode AND D.PlaceNCode=HM.NCode)'
			+ ' WHERE'
			+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
			+ ' AND M.SumKbn = 0'
			+ ' AND M.TemplateKbn = 0'
			+ ' AND M.RDelKbn = 0'
			+ ' AND ISNULL(D.DispKbn,1) IN (0,1)'					// DispKbn=null,0,1を取得
			+ ' AND D.PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 AND RDelKbn = 0)'
			+ ' ORDER BY GCode1,GCode2';
	end;
	}
	//<#3> DEL Ed

	//<#3> ADD St
	if m_iHojDefKbn = 0 then
	begin
		// ﾃﾞﾌｫﾙﾄ非表示
		// 従来通りSecHojyoDispInfoﾒｲﾝで取得

		// 補助別部署別
		if RptParam.iMasterKbn1 = m_iHojyoKbn then
		begin
			case m_iHojyoKbn of
				MST_CUSTOMER
				:begin
					// 取引先別部署別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode1,'
							+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,' + sSecMasterKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm2 ';
				end;

				MST_KOJI..MST_KOJI+9
				:begin
					// プロジェクト別部署別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(NCode,' + sHojyoKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(NCode,' + sHojyoKbn + ') AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,' + sSecMasterKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm2 ';
				end;
			end;
		end
		// 部署別補助別
		else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
		begin
			case m_iHojyoKbn of
				MST_CUSTOMER
				:begin
					// 部署別取引先別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,'+ sSecMasterKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm1,'
							+ ' MF_MAS_GetMTOKUIGCode(NCode) AS GCode2,'
							+ ' MF_MAS_GetMTOKUINmk(NCode) AS Nm2 ';
				end;

				MST_KOJI..MST_KOJI+9
				:begin
					// 部署別プロジェクト別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(PlaceNCode,'+ sSecMasterKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(PlaceNCode,' + sSecMasterKbn + ') AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(NCode,' + sHojyoKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(NCode,' + sHojyoKbn + ') AS Nm2 ';
				end;
			end;
		end
		else Exit;

		sSQL := sSQL
			+ ' FROM SecHojyoDispInfo'
			+ ' WHERE'
			+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
//			+ ' AND PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 OR RDelKbn > 0)';
			+ ' AND PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND (SumKbn > 0 OR RDelKbn > 0))'; //<#6> MOD

		case m_iHojyoKbn of
			MST_CUSTOMER
			:begin
				sSQL := sSQL + ' AND NCode NOT IN (Select NCode FROM MTOKUI WHERE SumKbn > 0 OR TemplateKbn > 0 OR RDelKbn > 0)';
			end;
			MST_KOJI..MST_KOJI+9
			:begin
//				sSQL := sSQL + ' AND NCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sHojyoKbn + ' AND SumKbn > 0 OR RDelKbn > 0)';
				sSQL := sSQL + ' AND NCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sHojyoKbn + ' AND (SumKbn > 0 OR RDelKbn > 0))'; //<#6> MOD
			end;
		end;

		sSQL := sSQL
			+ ' AND OpeKbn = 1'
			+ ' AND MasterKbn = ' + sSecMasterKbn
			+ ' AND NoDispMasterKbn = ' + sHojyoKbn
			+ ' AND DispKbn = 1'
			+ ' ORDER BY GCode1,GCode2';
	end
	else begin
		// ﾃﾞﾌｫﾙﾄ表示
		// SecHojyoDispInfoにないﾚｺｰﾄﾞも「表示可」として取得するためMTOKUI,HojyoMAをJOIN

		case m_iHojyoKbn of
			MST_CUSTOMER
			:begin
				if RptParam.iMasterKbn1 = m_iHojyoKbn then
				begin
					// 取引先別部署別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetMTOKUIGCode(M.NCode) AS GCode1,'
							+ ' MF_MAS_GetMTOKUINmk(M.NCode) AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm2 ';

				end
				else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
				begin
					// 部署別取引先別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm1,'
							+ ' MF_MAS_GetMTOKUIGCode(M.NCode) AS GCode2,'
							+ ' MF_MAS_GetMTOKUINmk(M.NCode) AS Nm2 ';
				end
				else Exit;

				sSQL := sSQL
					+ ' FROM MTOKUI M'
					+ ' LEFT OUTER JOIN HojyoMA HM ON (HM.MasterKbn=' + sSecMasterKbn + ' AND HM.SumKbn=0 AND HM.RDelKbn=0 AND HM.SyokuchiKbn=0)'
					+ ' LEFT OUTER JOIN SecHojyoDispInfo D ON (D.OpeKbn=1 AND D.MasterKbn=' + sSecMasterKbn + ' AND D.NoDispMasterKbn=' + sHojyoKbn + ' AND D.NCode=M.NCode AND D.PlaceNCode=HM.NCode)'
					+ ' WHERE'
					+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
					+ ' AND M.SumKbn = 0'
					+ ' AND M.TemplateKbn = 0'
					+ ' AND M.RDelKbn = 0'
					+ ' AND ISNULL(D.DispKbn,1) IN (0,1)'					// DispKbn=null,0,1を取得
//					+ ' AND D.PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 OR RDelKbn > 0)'
					+ ' AND ISNULL(D.PlaceNCode,-1) NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND (SumKbn > 0 OR RDelKbn > 0))' //<#6> MOD
					+ ' ORDER BY GCode1,GCode2';
			end;

			MST_KOJI..MST_KOJI+9
			:begin
				if RptParam.iMasterKbn1 = m_iHojyoKbn then
				begin
					// プロジェクト別部署別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(M.NCode,' + sHojyoKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(M.NCode,' + sHojyoKbn + ') AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm2 ';

				end
				else if RptParam.iMasterKbn1 = m_iSecMasterKbn then
				begin
					// 部署別プロジェクト別
					sSQL := 'SELECT'
							+ ' MF_MAS_GetHojyoMAGCode(HM.NCode,' + sSecMasterKbn + ') AS GCode1,'
							+ ' MF_MAS_GetHojyoMASimpleName(HM.NCode,' + sSecMasterKbn + ') AS Nm1,'
							+ ' MF_MAS_GetHojyoMAGCode(M.NCode,' + sHojyoKbn + ') AS GCode2,'
							+ ' MF_MAS_GetHojyoMASimpleName(M.NCode,' + sHojyoKbn + ') AS Nm2 ';
				end
				else Exit;

				sSQL := sSQL
					+ ' FROM HojyoMA M'
					+ ' LEFT OUTER JOIN HojyoMA HM ON (HM.MasterKbn=' + sSecMasterKbn + ' AND HM.SumKbn=0 AND HM.RDelKbn=0 AND HM.SyokuchiKbn=0)'
					+ ' LEFT OUTER JOIN SecHojyoDispInfo D ON (D.OpeKbn=1 AND D.MasterKbn=' + sSecMasterKbn + ' AND D.NoDispMasterKbn=' + sHojyoKbn + ' AND D.NCode=M.NCode AND D.PlaceNCode=HM.NCode)'
					+ ' WHERE'
					+ ' GCode1 BETWEEN ' + QuotedStr(RptParam.sRetStCode) + ' AND ' + QuotedStr(RptParam.sRetEdCode)
					+ ' AND M.MasterKbn = ' + sHojyoKbn
					+ ' AND M.SumKbn = 0'
					+ ' AND M.RDelKbn = 0'
					+ ' AND ISNULL(D.DispKbn,1) IN (0,1)'					// DispKbn=null,0,1を取得
//					+ ' AND D.PlaceNCode NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND SumKbn > 0 OR RDelKbn > 0)'
					+ ' AND ISNULL(D.PlaceNCode,-1) NOT IN (Select NCode FROM HojyoMA WHERE MasterKbn = ' + sSecMasterKbn + ' AND (SumKbn > 0 OR RDelKbn > 0))' //<#6> MOD
					+ ' ORDER BY GCode1,GCode2';
			end;
		end;
	end;
	//<#3> ADD Ed

	with DmqMTOKUI do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);

		// ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
			ErrorMessageDsp(DmqMTOKUI);
			DmqMTOKUI.Close();
			DmqMTOKUI.Free();
			Exit;
		end;

		while ( EOF <> TRUE ) do
		begin
			MemPrint.Append();

			// 数値属性
			if ( RptParam.iCodeAttr1 = 0 ) then
				sCode1	:= ComArea.SetDspCodeAttr(GetFld('GCode1').AsString, RptParam.iCodeDigit1, 0)
			// 数値属性前ｾﾞﾛ有
			else if ( RptParam.iCodeAttr1 = 1 ) then
				sCode1	:= ComArea.SetDspCodeAttr(GetFld('GCode1').AsString, RptParam.iCodeDigit1, 1)
			// ﾌﾘｰ属性
			else
				sCode1	:= ComArea.SetDspCodeAttr(GetFld('GCode1').AsString, RptParam.iCodeDigit1, 2);

			// 外部ｺｰﾄﾞ
			MemPrint.FieldByName('GCode1').AsString		:= sCode1;
			// 簡略名称
			MemPrint.FieldByName('Nm1').AsString		:= GetFld('Nm1').AsString;


			// 数値属性
			if ( RptParam.iCodeAttr2 = 0 ) then
				sCode2	:= ComArea.SetDspCodeAttr(GetFld('GCode2').AsString, RptParam.iCodeDigit2, 0)
			// 数値属性前ｾﾞﾛ有
			else if ( RptParam.iCodeAttr2 = 1 ) then
				sCode2	:= ComArea.SetDspCodeAttr(GetFld('GCode2').AsString, RptParam.iCodeDigit2, 1)
			// ﾌﾘｰ属性
			else
				sCode2	:= ComArea.SetDspCodeAttr(GetFld('GCode2').AsString, RptParam.iCodeDigit2, 2);

			// 外部ｺｰﾄﾞ
			MemPrint.FieldByName('GCode2').AsString		:= sCode2;
			// 簡略名称
			MemPrint.FieldByName('Nm2').AsString		:= GetFld('Nm2').AsString;

			MemPrint.Post();
			Next;
		end;
	end;

	DmqMTOKUI.Close();
	DmqMTOKUI.Free();
	Result := True;
end;

procedure TJNTCRP004010F.ErrorMessageDsp(DMQuery: TMQuery);
var
	MsgRec		: TMjsMsgRec;
begin
	with MsgRec do
	begin
		ComArea.m_MsgStd.GetMsgDB(MsgRec,DMQuery);
		MjsMessageBoxEx(Self,sMsg,sTitle,icontype,btntype,btndef,FALSE);
	end;
end;

end.
