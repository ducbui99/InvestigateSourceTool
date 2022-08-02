//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登録　手形情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上 佳美(LEAD)
//      作成日      ：2005.02.03(THU)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <101>   高橋 功二   2005/08/12(Fri) JNTCommonを親から引き継ぐように修正
//  <102>   高橋 功二   2005/08/24(Wed) TMJSAppRecordを親から引き継ぐように修正
//  <103>   高橋 功二   2005.08.25(Thu) ﾃﾝﾌﾟﾚｰﾄ区分(TemplateKbn)の考慮
//  <104>   高橋 功二   2005/09/06(Tue) 印刷機能の正式実装まで印刷ﾎﾞﾀﾝをDiableする
//  <105>   高橋 功二   2005/09/13(TUE) 細目科目がﾌﾘｰ属性の場合、禁則文字入力を考慮する。
//  <106>   茂木 勇次   2005/09/28(WED) 切出/埋込ﾎﾞﾀﾝを継承し、子側で処理を行う。
//  <107>   飯塚 健介   2005/10/14(FRI) 終了確認機能追加
//  <108>   飯塚 健介   2005/10/14(FRI) ESC ENDｷｰ制御追加
//  <109>   茂木 勇次   2005/10/18(WED) ｷｰの修正。
//  <122>   飯塚 健介   2005/10/21(FRI) 0ｺｰﾄﾞ入力可能
//  <123>   PRIME加藤   2005/11/07(MON) 終了がｷｬﾝｾﾙされてもSelCorpSysを解放する不具合修正
//	<HAN>   広田 茂雄	2005/12/08(THU)	印刷時の範囲指定修正
//  <Rel>   高橋 功二   2007/05/29(TUE) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//	<124>	渡邊 慎太郎 2007/07/02(MON) 決算確定の判定は親側で行うため子でメッセージを出さない
//	<125>	PRIME関		2008/02/12(TUE)	ﾏｽﾀ更新履歴対応
//  <126>   黒田 祐生   2010/05/27(THU) MLBplLoader対応(LoadPackageの置換)
//  <127>   大田原(MSI) 2010/10/29(FRI) ﾌｧｲﾙ出力でﾃﾞﾌｫﾙﾄ(ﾕｰｻﾞｰ未設定)の適用期間が表示されないように修正。
//  <128>   大田原(MSI) 2011/05/13(FRI) 印刷モジュールをUnLoadしていなかった点を修正
//	<129>	PRIME加藤	2012/02/08(WED) KeyDataToShiftStateをMJSKeyDataToShiftStateに置き換え
//	<130>	PRIME加藤	2012/08/03(FRI) ﾓｼﾞｭｰﾙ別ﾛｰﾙ対応
//	<131>	PRIME加藤	2014/01/15(WED) 取引先ｺｰﾄﾞ16桁対応(Formのみ) f0CODEを広げてﾗﾍﾞﾙを右にずらした
//=============================================================================
unit JNTCRP004008U;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
    VCL.StdCtrls, ComCtrls, Buttons, VCL.ExtCtrls, FileCtrl,

	MJSStatusBar, MJSBitBtn, MJSFunctionBar, MJSSPFunctionBar, MJSLabel, MJSPanel,
    MJSCheckBox, MJSSpeedButton, MJSEdits, MJSQuery, MJSRadioButton, MJSGroupBox,
    MJSComboBox,

    MJSCommonu, MjsDBModuleu, MjsDateCtrl, MjsDispCtrl, MjsMsgStdU, {MjsFolderU,}
    //<107> CMNExpFuncU,
    MjsStrCtrl, MJSPostCtrl,
  	MJSKeyDataState,				// <129> ADD
	DB, FireDAC.Comp.Client, DBCtrls, dxmdaset, dxTL, dxDBGrid, dxCntner, dxGrClms,
    //myChkBox,
    daDatMod,

    JNTSelGlobal,
    JNTMasComu,                                             // 財務に統一
    JNTMasWndIFu,
    JNTSelCorpSys,
    JNTCommonu,

    JNTExPGlobal, JNTPDlg,                                  {<PRN>}
    JNTAuthorityu,											// <130>

    MjsPreviewIFu,
    MjsPrnDlgU,
    MjsPrnSupportU,
    JNTMasMonth, MJSTab, MJSMemo,JNTFuncU,
    MLBplLoaderU, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;   // <126>

  const
	WM_ONPAINT	= WM_APP + 1;	                            // OnPaint 時の処理起動メッセージ用

type
  {$i ActionInterface.inc}
  {$I MasCommonFuncH.inc}
  {$include JNTSelPrtIF.inc}                                // <PRN>
  {$include JNTCRPSyncMasterH.inc}                          // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;


	TJNTCRP004008F = class(TForm)
	DSrcTanka: TDataSource;
	DMemRitu: TdxMemData;
	DMemRituRitu: TStringField;
	DMemRituTaxRitu: TFloatField;
	DSrcRitu: TDataSource;
	lStatusMessage: TMLabel;
	KanaAdd1: TMFurigana;
	KanaAdd2: TMFurigana;
	DMemRituFieldName: TStringField;
	DMemRituTableName: TStringField;
    DtlCmnClientPanel: TMPanel;
    ScrollBox2: TScrollBox;
    PnlTop: TScrollBox;
    BUpdate_Sousa: TMBitBtn;
    BCancel_Sousa: TMBitBtn;
    f0CODELab: TMLabel;
    f0NAME: TMTxtEdit;
    PSousa: TScrollBox;
    LblTEL: TMLabel;
    Label1: TMLabel;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    f1Frdasi1: TMTxtEdit;
    f1Basho1: TMTxtEdit;
    f1BRCDLab: TMLabel;
    f1Basho2: TMTxtEdit;
    f1Basho3: TMTxtEdit;
    f1Frdasi2: TMTxtEdit;
    f1Frdasi3: TMTxtEdit;
    f1Frdasi4: TMTxtEdit;
    f1Frdasi5: TMTxtEdit;
    MLabel3: TMLabel;
    f0CODE: TMTxtEdit;
    f1TRank: TMTxtEdit;
    MPanel3: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    stbStatusBar: TMStatusBar;
    MemPrint: TdxMemData;
    MemPrintGCode: TStringField;
    MemPrintRenso: TStringField;
    MemPrintNmk: TStringField;
    MemPrintNm: TStringField;
    MemPrintTStartDate: TStringField;
    MemPrintTEndDate: TStringField;
	//@　↓12.02
    MemPrintUpdDateTM: TStringField;
	//@ ↑
    MemPrintPaybash1: TStringField;
    MemPrintPaybash2: TStringField;
    MemPrintPaybash3: TStringField;
    MemPrintFuri1: TStringField;
    MemPrintFuri2: TStringField;
    MemPrintFuri3: TStringField;
    MemPrintFuri4: TStringField;
    MemPrintFuri5: TStringField;
    MemPrintTgtRnk: TStringField;
    SPMsHistParent: TFDStoredProc;
    SPMsHist: TFDStoredProc;

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
    procedure f0CODEArrowClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure fnFldOnChg(Sender: TObject);                  // <106>

  private
	{ Private 宣言 }
	m_pMyAppRecord	        : ^TMjsAppRecord;
	m_Base_pRec             : ^TMjsAppRecord;               // <102>
	MDataModule             : TMDataModulef;
    ComArea                 : TJNTMASCom;
    dbCorp_Select           : TFDConnection;
    m_dbMjsCmn              : TFDConnection;
    m_dbMasCmn              : TFDConnection;
    m_AcControl             : TWinControl;
    m_cJNTArea              : TJNTCommon;
    m_cErrorMsgRec          : TMJSMsgRec;                   // MJS専用ﾒｯｾｰｼﾞ

    m_MjsMsgRec             : TMjsMsgRec;
	m_Month                 : TJNTMASMonth;

    PrnSupport              : TMjsPrnSupport;
	m_cPreview              : TMJSPreviewIF;

    m_CmpList               : TList;
    B_Print                 : TMSpeedButton;
    B_Change                : TMSpeedButton;                // 切出/埋込ﾎﾞﾀﾝ<106>
    m_bBtnChange            : Boolean;                      // 切出≪=≫埋込ﾌﾗｸﾞ<106>

	m_bFirstFlag            : array [0..1] of Boolean;

	rcMsg2                  : MjsMsgStdU.TMjsMsgRec;
	m_MsgStd                : TMjsMsgStd;

    m_iSysColor		        : Integer;
	m_iSysCode              : Integer;
    m_iOptCode              : Integer;
	m_iCorpCode             : Integer;
	m_iCorpSubCode          : Integer;
	m_iSysCodeNo 	        : Integer;
    m_nDateFormatDivision	: Integer;					    // 和暦/西暦区分
    m_nMailAdoption			: Integer;					    // ﾒｰﾙ会計処理区分
    nCompDivision			: Integer;					    // 公益法人区分
    m_strValidCharacters	: String;					    // 使用可能ｺｰﾄﾞ
    m_DataKbn				: Integer;					    // データ区分	//HIS0036

    CloseFlg	            : Boolean;
    m_EdtSw                 : Boolean;                      // 編集ｽｲｯﾁ     <107>


    uvAttr,uvDigit          : Integer;                      // 桁数属性
    uvExpOpenSW             : Boolean;                      // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
	uvSelSys                : TJNTSelCorpSys;			    // 会社ｼｽﾃﾑ情報
    uvDispFlg               : Integer;                      // 決算フラグ（ 0:未確定、1:確定済）

    uvHani                  : TJNTHani;		                // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry           : TPrintAppEntry;               // <PRN>
    ArrHdl                  : Array[0..100] of Pointer;		// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        : rcPrtParam;                   // <PRN>
    DmqPrint                : TMQuery;                      // <PRN> 印刷用ｸｴﾘｰ
    MComboBox               : TMComboBox;
	m_iRekiKbn		        : Integer;						// 051114

    m_SyncMaster            : TSyncMaster;                  // <Rel> ﾏｽﾀ同期基本ｸﾗｽ

    m_RepHandle             : THandle;                      // 印刷モジュールハンドル <128>
    m_JNTAuthority			: TJNTAuthority;				// <130>

    procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
	function  fnGetList(cmpEdit: TObject): Boolean;
	procedure fnSetProperty(iKbn:integer;eEdit:TMTxtEdit ;lLabel:TMLabel);overload;
	procedure fnSetProperty(iKbn:integer;eEdit:TMNumEdit ;lLabel:TMLabel);overload;
	function  fnSousa_Select:Boolean;
	function  fnSousa_Update:Boolean;
    function  fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
    Procedure fnCompEnabled(pBol:Boolean);
    Procedure fnCompClear;
//    function  fnChkTRCODE: Boolean;                                           // <Rel>
    function  fnChkTRCODE: Integer;                                             // <Rel>
    function  fnCancel: Boolean;
	procedure fnPrnSET();
	procedure SessionPractice(iSyori: Integer);				// <125> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し

  protected
	procedure	CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;

  public
	{ Public 宣言 }
	constructor CreateForm(pRec:pointer);					// ｺﾝｽﾄﾗｸﾀ

end;

function AppEntry(pParam : Pointer)	:	Integer;

exports
	AppEntry;

implementation

const
	// -----<125> Add-St-----
	GRP_SYNC_CHILD	= 1;						// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<125> Add-Ed-----

    DEF_S_DATE  = 2;	    // 1900/01/01  <127>
    DEF_E_DATE  = 73050;	// 2099/12/31  <127>

{$R *.DFM}
var
	Qry : TMQuery;
    uvClearFlg : Boolean;
    uvNCODE     : Extended;
    uvInsFlg : Boolean;

{$include JNTCRPSyncMasterB.inc}                            // <Rel> ﾏｽﾀ同期共通実装部
{$include JNTMTOKUI_Sync.INC}                               // <Rel>


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
	pMyForm	:	^TJNTCRP004008f;
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
				pMyForm^ := TJNTCRP004008f.CreateForm(pParam);
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
				pMyForm^	:=	TJNTCRP004008f.CreateForm(pRec);
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

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:Y.Sato
//**********************************************************************
constructor TJNTCRP004008F.CreateForm(pRec: pointer);
begin

    m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);	// MJS共通DBﾓｼﾞｭｰﾙ
    ComArea		    :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得

    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

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

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
            Abort;
    except
//<DSP>		MessageDlg(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mtError, [mbOk], 0);
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;
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
procedure TJNTCRP004008F.FormCreate(Sender: TObject);
var
	DMQuery	 : TMQuery;
    nCount   : Integer;
    iRet     : Integer;                                     // <PRN>
    lvHandle : THandle;                                     // <PRN>

begin

	CloseFlg         := False;
    m_bFirstFlag[0]	 := False;
	m_bFirstFlag[1]	 := False;
    m_bBtnChange 	 := True;                               // <106>

    m_RepHandle      := 0;                                  // 印刷モジュールハンドル <128>

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    B_Print 	     := TMSpeedButton(m_CmpList.Items[0]^); // 印刷
    m_cJNTArea       := TJNTCommon   (m_CmpList.Items[8]^); // <101>
    m_Base_pRec      := Pointer      (m_CmpList.Items[9]^); // <102>
    MComboBox        := TMComboBox   (m_CmpList.Items[10]^);
    B_Change         := TMSpeedButton(m_CmpList.Items[11]^);// <106>
	m_SyncMaster     := TSyncMaster  (m_CmpList.Items[13]^);// <Rel>
    m_JNTAuthority	 := TJNTAuthority(m_CmpList.Items[16]^);// <130>

    B_Print.OnClick  := BPrintClick;
    B_Change.OnClick := BChangeClick;                       // <106>
//    B_Print     .Enabled    :=  False;                        // <104>
    //--------------------------------------------------------------------------

	// -----<125> Add-St-----
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<125> Add-Ed-----

	Parent     := TPanel(m_pMyAppRecord^.m_pOwnerPanel^);   // 親のﾊﾟﾈﾙに埋込む
	Align      := alClient;

    m_cPreview := TMJSPreviewIF.Create ();
	m_cPreview.Init (m_pMyAppRecord);


//    m_cJNTArea      :=  TJNTCommon.Create(Self); <101>
//    m_cJNTArea.Init(m_pMyAppRecord);             <101>
	m_cJNTArea.setMasAppRecord;						        // 販売ポインタ設定

    MjsColorChange(				                            // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP004008F(Self),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor
				  );

    MjsFontResize( TJNTCRP004008F(Self), Pointer(m_pMyAppRecord) );


    // Enabledの制御
    uvClearFlg := False;
    fnCompClear;
    fnCompEnabled(False);

    uvClearFlg := True;
	DMQuery := TMQuery.Create(self);						// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);  	// DBとの接続
    Try
        with DMQuery do
        begin
            Close ();
            m_nDateFormatDivision := 0;					    // 和暦/西暦区分
            m_nMailAdoption		  := 0;					    // ﾒｰﾙ会計処理区分
            nCompDivision		  := 0;					    // 公益法人区分
            m_strValidCharacters  := '';					// 使用可能ｺｰﾄﾞ
            m_DataKbn			  := 0;					    // ﾃﾞｰﾀ区分	//HIS0036
            f0CODELab.Caption     := '';
            Close;
            Sql.Clear;
            Sql.add(' Select CodeDigit,CodeAttr,JHojyoName From MasterInfo '+
                    ' Where (MasterKBN = 22)');
            Open;
            if not Eof then
            begin
                uvDigit := GetFld('CodeDigit') .AsInteger;  // 桁数
                uvAttr  := GetFld('CodeAttr').asInteger;    // 属性
                f0CODELab.Caption := GetFld('JHojyoName').asString + 'コード';
            end;

            Close ();
            SQL.Clear;
            SQL.Add ('SELECT ComKbn2, YearKbn FROM DTMAIN');
            Open ();
            if not Eof then
            begin                                           // 決算確定
                uvDispFlg := FieldByName ('ComKbn2').AsInteger;
				m_iRekiKbn:= GetFld('YearKbn').AsInteger;
    	    end;
            Close;
        end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

    // 権限情報を取得
// <130> MOD start
(*
    if (m_cJNTArea.IsModify = False) then
    begin
        if (m_cJNTArea.IsAppend = False ) then
*)
    if (m_JNTAuthority.IsModify = False) then
    begin
        if (m_JNTAuthority.IsAppend = False ) then
// <130> MOD end
        begin
            uvDispFlg := 1;                                 // 決算確定と同様の処理
        end;
    end;

//↓<Rel>
	// この時点で、参照ﾓｰﾄﾞ以外のときのみ、以下の論理を行う。
	if (uvDispFlg <> 1) then
	begin
        // 全社の過年度DBを選択している場合
        if ( m_SyncMaster.m_flgGrpCorp = 0 ) then
        begin
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin
                if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
                                        'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
                begin
                    // 通常のﾏｽﾀ登録として起動する。
                    // 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
                    // 通常ﾓｰﾄﾞ
                end
                else
                begin
                    // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                    // ﾏｽﾀをUpdata、Insertすることはできない。
                    m_cJNTArea.Invalidity;

                    // 参照ﾓｰﾄﾞ
                    uvDispFlg := 1;
                end;
            end;
        end
        // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
        else if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 子会社が過年度DBの場合
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;

                // 参照ﾓｰﾄﾞ
                uvDispFlg := 1;
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;

                // 参照ﾓｰﾄﾞ
                uvDispFlg := 1;
            end;
        end;
	end;
//↑<Rel>

    m_AcControl :=  f0CODE;

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pMyAppRecord) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);


// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    MDataModule.SetDBInfoToQuery(dbCorp_Select,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
    lvHandle := 0;
	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004008L.BPL');       // <126>DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004008L.BPL'); // <126>ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
	 //	MjsMessageBox(Self, 'JNTCRP004008LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        // <126>DEL
        MjsMessageBox(Self, 'JNTCRP004008LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  // <126>ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     //	UnloadPackage( lvHandle );          // <126>DEL
        UnloadPackageHelper( lvHandle );    // <126>ADD
    end;

    m_RepHandle	:= lvHandle;                // 印刷モジュールハンドル <128>

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
        ArrHdl[0] := @m_JNTAuthority;		// <130> ADD

		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    gfnHaniInit(Self,
                m_Base_pRec,
                MDataModule,
                ComArea,
                dbCorp_Select,
                'JNTCRP004008',
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------

    // <107>編集状態ｽｲｯﾁを初期化する
    m_EdtSw := False;


    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);		//イベントOnCreateの最後に


end;

//************************************************************************
//*		Proccess		:	WMOnPaint関数
//*		Name			:	S.Ogawa
//************************************************************************
procedure TJNTCRP004008F.WMOnPaint(var Msg: TMessage);
begin

	// 初期のみ一回の処理
	if m_bFirstFlag[0] = False then
	begin
        m_bFirstFlag[0] := True;

        // 得意先ｺｰﾄﾞの属性対応
        case uvAttr of
            0:  f0CODE.InputAttr    :=  iaZeroSup;
            1:  f0CODE.InputAttr    :=  iaZeroPad;
// <105>            2:  f0CODE.InputAttr    :=  iaFree;
            2:  f0CODE.InputAttr    :=  iaNone;
        end;

        f0CODE.MaxLength    :=  uvDigit;

        // 得意先ｺｰﾄﾞにﾌｫｰｶｽを設定する
        m_AcControl.SetFocus;
    end;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.FormShow(Sender: TObject);
begin

    JNTMasSetCaption( m_pMyAppRecord );
	MjsBtnVisible( TJNTCRP004008F(Self), TRUE );

    // 印刷オブジェクトあり
{inoue
    if PrnForm <> nil then
	begin
        // プレビュー中はPreview画面表示
		if PrnForm.mjsPreview.IsPreview then
			PrnForm.mjspreview.Show;
	end
	else
	begin
        PSousa.Visible  :=  True;
	    m_AcControl.SetFocus;
    end;
}
    PSousa.Visible  :=  True;
	FormActivate( Sender );
    m_AcControl.SetFocus();   // <106>

end;

//**********************************************************************
//		Component	:Form
//		Event		:Hide
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.FormHide(Sender: TObject);
begin


    MJSBtnVisible( TJNTCRP004008F(Self), False );

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
procedure TJNTCRP004008F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
begin

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

// <123>
    // 販売ｼｽﾃﾑ情報の解放
	uvSelSys.Free;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    MDataModule.COPDBClose(dbCorp_Select);

    Action := caFree;

	m_pMyAppRecord^.m_iDelete   :=  1;
	wkParam.iAction	            :=	ACTID_FORMCLOSEEND;
	wkParam.pRecord	            :=	Pointer(m_pMyAppRecord);
	wkParam.pActionParam	    :=	nil;
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);

end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.FormDestroy(Sender: TObject);
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
//  PrintAppEntry(nil,nil,6,PrtParam,ArrHdl);   // 開放時のﾊﾟﾗﾒｰﾀが間違っていたので修正 <128>
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

// <128>↓↓
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
// <128>↑↑

    m_cPreview.Term ();
	m_cPreview.Free ();

end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
	iRtn : Word;
begin

    // 終了ﾌﾗｸﾞをONに設定する
    if ( CloseFlg = False ) then CloseFlg := True;

// <123>FormCloseに移動
    // 販売ｼｽﾃﾑ情報の開放
//	uvSelSys.Free;

//    if m_cPreview.IsPreView then
    if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		ComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType );
	   	CanClose := FALSE;
	end
    else
    	CanClose := TRUE;

// <107> St --------------------------------------------------------------------
	if (m_EdtSw) then
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
// <107> Ed --------------------------------------------------------------------

//    B_Print     .Enabled    :=  True; // <104>
end;

//**********************************************************************
//		Component	:Form
//		Event		:Activate
//		Name		:KOS.HORI
//		Histry		:
//**********************************************************************
procedure TJNTCRP004008F.FormActivate(Sender: TObject);
var
	wkParam :	TAppParam;
begin

	wkParam.iAction         :=  ACTID_ACTIVEEND;
	wkParam.pRecord         :=  Pointer(m_pMyAppRecord);
	wkParam.pActionParam    :=  nil;
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);

end;

//**********************************************************************
//		Component	:Form
//		Event		:CMChildKey
//		Name		:洪英傑(上海未来)
//		修正履歴	:2001/01/30 hori 修正
//					:2004/08/18(T.Aoki)
//					:総括表判定区分の制御 追加<040818A>
//**********************************************************************
procedure TJNTCRP004008F.CMChildKey(var Msg: TWMKey);
var
	sShift	:   TShiftState;
	SName	:	String;
    iRtn    :   Integer;
begin

	if GetKeyState(VK_MENU) < 0 then
		Exit;

    // Shilt状態の取得
// <129> MOD start
//	sShift		:= KeyDataToShiftState(Msg.KeyData);
	sShift		:= MJSKeyDataToShiftState(Msg.KeyData);
// <129> MOD end

    // ﾌｫｰｶｽのあるｺﾝﾄﾛｰﾙ取得
	SName		:= Screen.ActiveControl.Name;
	m_ACControl	:= Screen.ActiveControl;

    if ((Msg.CharCode = VK_RETURN) and (sShift = [])) or
       ((Msg.CharCode = VK_TAB)	   and (sShift = [])) then
    begin

        // ENTERｷｰの場合だけ何も行わない<109>
        if ( Msg.CharCode = VK_RETURN ) then
        begin
            // ﾎﾞﾀﾝﾌｫｰｶｽ時は処理しない
            if (m_ACControl is TMBitBtn)  then
                Exit;
        end;

        // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
        if fnFldChk(TComponent(Screen.ActiveControl), True) = False then
            abort;

    	if m_ACControl = f0CODE then
            fnSousa_Select;
    end;
    //-------------------------------------------------------------------------
	// 文字入力ｺﾝﾎﾟｰﾈﾝﾄ
    //-------------------------------------------------------------------------
	if m_ACControl is TMTxtEdit then
	begin
		case Msg.CharCode of
        VK_TAB:					                            // TAB
        begin
            if (sShift = []) then
                MjsNextCtrl(Self);
            if (sShift = [ssShift]) then
                MjsPrevCtrl(Self);
            Abort;
        end;
        VK_RETURN, VK_DOWN:		                            // RETURN, DOWN
        begin
            if sShift = [] then
            begin
                MjsNextCtrl(Self);
                Abort;
            end;
        end;
        VK_RIGHT:				                            // RIGHT
        begin
            if MjsChkCurEnd(m_ACControl) then
            begin
                if sShift = [] then
                begin
                    MjsNextCtrl(Self);
                    Abort;
                end;
            end;
        end;
        VK_LEFT:				                            // LEFT
        begin
            if MjsChkCurTop(m_ACControl) and (sShift = []) then
            begin
                if sShift = [] then
                begin
                    MjsPrevCtrl(Self);
                    Abort;
                end;
            end;
        end;
        VK_UP:					                            // UP
        begin
            if sShift = [] then
            begin
                MjsPrevCtrl(Self);
                Abort;
            end;
        end;
        VK_END:					                            // END
        begin
            if MjsChkCurEnd(m_ACControl) = False then
                exit;
        end;
		end;
	end;

    //-------------------------------------------------------------------------
	// ﾁｪｯｸﾎﾞｯｸｽ、数値入力、日付入力ｺﾝﾎﾟｰﾈﾝﾄ
    //-------------------------------------------------------------------------
	if (m_ACControl is TMCheckBox) or
       (m_ACControl is TMNumEdit)  or
	   (m_ACControl is TMDateEdit) then
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
        VK_RETURN, VK_RIGHT, VK_DOWN:	                    // ENTER, RIGHT, DOWN
        begin
            if sShift = [] then
            begin
                MjsNextCtrl(Self);
                Abort;
            end;
        end;
        VK_LEFT, VK_UP:					                    // LEFT, UP
        begin
            if sShift = [] then
            begin
                MjsPrevCtrl(Self);
                Abort;
            end;
        end;
		end;
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
//<108>            self.bCancel(m_ACControl);		 		// ｷｬﾝｾﾙﾎﾞﾀﾝｸﾘｯｸｲﾍﾞﾝﾄ起動(FXでは不要？)
        end;
		end;
	end;

    //<108>ESCキーの捕捉 St-----------------------------------------------------
    if (Msg.CharCode = VK_ESCAPE) and (sShift = []) then
    begin
        //<47>
        //先頭項目だった場合
		if m_ACControl = f0CODE then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        else
        begin
          	//「編集中のデータを取り消します。よろしいですか？」
            if m_EdtSw then
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

            end
            else
                fnCancel;

            Abort;
        end;
    end;
    //<108>ESCキーの捕捉 ED-----------------------------------------------------

    //<108>ENDキーの補足 St-----------------------------------------------------
    if (Msg.CharCode = VK_END) and (sShift = []) then
    begin
        //先頭項目だった場合
        if m_ACControl = f0CODE then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        else
        //先頭項目だった場合
        begin
        	//ﾋﾞｯﾄﾎﾞﾀﾝへ
            if BUpdate_Sousa.Enabled then
                BUpdate_Sousa.SetFocus
            else
            begin
                if BCancel_Sousa.Enabled then
                    BCancel_Sousa.SetFocus;
            end;

           	Abort;
        end;
    end;
    //<108>ENDキーの補足 ED-----------------------------------------------------

end;

//**********************************************************************
//		Component	:BUpdate_XXX  更新処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.BUpdate(Sender: TObject);
begin
	// -----<125> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<125> Add-Ed-----

    //フィールド入力値のチェックをする
    if fnFldChk(Self, True) = False then
        Exit;

	fnSousa_Update;

    fnCompClear;
    fnCompEnabled(False);

    f0CODE.SetFocus;
    m_EdtSw := False;   //<107>
    FormActivate(nil);

	// -----<125> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<125> Add-Ed-----
end;

//**********************************************************************
//		Component	:BCancel_XXX    取消処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004008F.BCancel(Sender: TObject);
var
    iRtn : Integer;
begin
// <107> St --------------------------------------------------------------------
    if m_EdtSw then
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
    end else fnCancel;
// <107> Ed --------------------------------------------------------------------


(* <107>Del
    // 入力破棄・再読込
    if iRtn = mrYes then
    begin
	   	fnSousa_Select;
    end
    // 更新
    else if iRtn=mrNo then
	begin
    //フィールド入力値のチェックをする
        if fnFldChk(Self, True) = False then     //<30>
            Exit;

    	fnSousa_Update;
    end
    // キャンセル
	else
	    fnCancel;

*)

end;


//******************************************************************************
//		Proccess	: SelectItemから名称を取得する
//		Name		: 丘 嶸(上海未来)
//		Date		: 2001/01/06
//		Parameter	: cmpEdit	:
//		Return		: True		: OK
//					: False		: NG
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function TJNTCRP004008F.fnGetList(cmpEdit: TObject): Boolean;
var
	i		: Integer;
	iPos	: Integer;
	iLen	: Integer;
	sName	: String;
	cmpLabel: TMLabel;
	ParentCtrl:TWinControl;
begin
	Result	:= False;

	//名称ｾｯﾄなし
	if TMNumEdit(cmpEdit).SelectItems.Count = 0 then
	begin
		Result				:= True;
		Exit;
	end;

	cmpLabel:=nil;

	ParentCtrl:=TMNumEdit(cmpEdit).Parent;
	if ParentCtrl <> nil then
	begin
		for i := 0 to ParentCtrl.ControlCount - 1 do
		begin
			if (ParentCtrl.Controls[i] is TMLabel) then
			begin
				if (ParentCtrl.Controls[i].Tag = TMNumEdit(cmpEdit).Tag)
					and (TMNumEdit(cmpEdit).Tag<>0) then
				begin
					cmpLabel:=TMLabel(ParentCtrl.Controls[i]);
					break;
				end;
			end;
		end;
	end;

	if cmpLabel=nil then
		exit;

	iPos	:= 0;
	for i:=1 to TMNumEdit(cmpEdit).SelectItems.Count do
	begin
		iPos	:= MjsHanPos(':', TMNumEdit(cmpEdit).SelectItems.Strings[i-1]);
		if iPos = 0 then
			continue;

		sName	:= MjsHanCopy(TMNumEdit(cmpEdit).SelectItems.Strings[i-1], 1, iPos-1);

		if TMNumEdit(cmpEdit).Value = StrToInt(sName) then						//No一致?
			break;
	end;
	//一致しなかった
	if i > TMNumEdit(cmpEdit).SelectItems.Count then
	begin
		result := false;	// 01/04/27 Kondo Add
		cmpLabel.Caption	:= '';
		Exit;
	end;

	iLen			:= MjsHanLength(TMNumEdit(cmpEdit).SelectItems.Strings[i-1]);
	sName			:= MjsHanCopy(TMNumEdit(cmpEdit).SelectItems.Strings[i-1], iPos+1, iLen-iPos);
	cmpLabel.Caption:= sName;
	Result			:= True;
end;
//************************************************************************
//	Component		:	BPrint
//	Event			:	Click
//	Name			:	丘	嶸(上海未来)
//************************************************************************
procedure TJNTCRP004008F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
    JNTPDlg     :   TFrmJNTPDialog;

begin

	m_cJNTArea.setSelAppRecord;						                    // 販売ポインタ設定

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<PRN>
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<Del10-VerUp001><D10_OwnMapRules> ST
	dbCorp_Select.FormatOptions.MapRules.Clear;
	dbCorp_Select.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
            fnPrnSET ();
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
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
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


// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】    <PRN>
// -----------------------------------------------------------------------------
procedure TJNTCRP004008F.fnPrnSET();
var
	DmqMTOKUI       :   TMQuery;
    Qry	       		:   TMQuery;
    i               :   Integer;
    sCode           :   String;

	strExCode	: String;
	strFormat	: String;
	sName		: String;
    lName		: String;

begin

    // MQueryの構築
	DmqMTOKUI       :=  TMQuery.Create (Self);
    // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery (dbCorp_Select, DmqMTOKUI);

    if ( MemPrint.Active ) then MemPrint.Close();
    MemPrint.Open();

	with DmqMTOKUI do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
        SQL.Add('SELECT                                 '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.TStartDate                      '   // 適用開始       (mtokui)
            +   '   ,mt.TEndDate                        '   // 適用終了       (mtokui)
            +   '   ,mt.UpdDateTM                       '   // 更新日時       (mtokui)
			+   '   ,mas.*                              '
            +   'FROM MTOKUI_MAS mas, MTOKUI mt         '
            +   'WHERE (mt.RDelKbn = 0)                 '
            +   '  AND (mt.TemplateKbn   = 0)           '
            +   '  AND (mas.BaseNCode = mt.NCode)       ');

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
(* <HAN>
            if ( uvHani.pvrStCode[0] <> '' ) and
               ( uvHani.pvrEdCode[0] =  '' ) then
            begin
//@　↓12.02
{
                SQL.Add('  AND  (GCode >= :ExCode)   ');
                if ( uvAttr <= 1 ) then
    			    ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrStCode[0];
            end
            else if ( uvHani.pvrStCode[0] =  '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
                SQL.Add('  AND  (GCode <= :ExCode)   ');
                if ( uvAttr <= 1 ) then
        			ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrEdCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrEdCode[0];
            end
            else if ( uvHani.pvrStCode[0] <> '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
}
 //@ ↑
                SQL.Add('  AND  (GCode >= :ExStCode)     ');
			    SQL.Add('  AND  (GCode <= :ExEdCode)     ');
                if ( uvAttr <= 1 ) then
                begin
        			ParamByName('ExStCode').AsString   :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))]);
        			ParamByName('ExEdCode').AsString   :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrEdCode[0]))]);
                end
                else
                begin
                    ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
        			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
                end;
            end;
*)
			// <HAN> >>
            SQL.Add('  AND  (GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
			// <HAN> <<
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY GCode         ')
        else    SQL.Add('ORDER BY Renso, GCode  ');

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
//			ErrorMessageDsp(DmqMTOKUI);
			DmqMTOKUI.Close();
			DmqMTOKUI.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MemPrint.Append();

            // 数値属性
            if ( uvAttr = 0 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( uvAttr = 1 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 2);

            // 外部ｺｰﾄﾞ
			MemPrint.FieldByName('GCode').AsString	    :=  sCode;
            // 連想
			MemPrint.FieldByName('Renso').AsString			:=	GetFld('m_Renso').AsString;
            // 簡略名称
			MemPrint.FieldByName('Nmk').AsString	            :=	GetFld('m_Nmk').AsString;
		    // 正式名称
            MemPrint.FieldByName('Nm').AsString	            :=	GetFld('m_Nm').AsString;

            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
//<127>                MemPrint.FieldByName('TStartDate').AsString   :=  MjsGetGengou( GetFld('TStartDate').AsDateTime, MdtCMP_YMD )
//<127>                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TStartDate').AsDateTime );
                // ↓↓↓<127>
                if ((not GetFld('TStartDate').IsNull) AND (GetFld('TStartDate').AsDateTime <> DEF_S_DATE)) then
                    MemPrint.FieldByName('TStartDate').AsString := MjsGetGengou( GetFld('TStartDate').AsDateTime, MdtCMP_YMD )
                                                                        + FormatDateTime( 'ee/mm/dd', GetFld('TStartDate').AsDateTime )
                else
                    MemPrint.FieldByName('TStartDate').Clear;
                // ↑↑↑<127>

                // 適用期間(終了)
//<127>                MemPrint.FieldByName('TEndDate').AsString		:=	MjsGetGengou( GetFld('TEndDate').AsDateTime, MdtCMP_YMD )
//<127>                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TEndDate').AsDateTime );
                // ↓↓↓<127>
                if ((not GetFld('TEndDate').IsNull) AND (GetFld('TEndDate').AsDateTime <> DEF_E_DATE)) then
                    MemPrint.FieldByName('TEndDate').AsString := MjsGetGengou( GetFld('TEndDate').AsDateTime, MdtCMP_YMD )
                                                                        + FormatDateTime( 'ee/mm/dd', GetFld('TEndDate').AsDateTime )
                else
                    MemPrint.FieldByName('TEndDate').Clear;
                // ↑↑↑<127>

                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString	:=	MjsGetGengou(GetFld('UpdDateTM').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('UpdDateTM').AsDateTime);
                //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
//<127>                MemPrint.FieldByName('TStartDate').AsString   :=  FormatDateTime( 'yyyy/mm/dd', GetFld('TStartDate').AsDateTime );
                // ↓↓↓<127>
                if ((not GetFld('TStartDate').IsNull) AND (GetFld('TStartDate').AsDateTime <> DEF_S_DATE)) then
                    MemPrint.FieldByName('TStartDate').AsString := FormatDateTime( 'yyyy/mm/dd', GetFld('TStartDate').AsDateTime )
                else
                    MemPrint.FieldByName('TStartDate').Clear;
                // ↑↑↑<127>

                // 適用期間(終了)
//<127>                MemPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('TEndDate').AsDateTime );
                // ↓↓↓<127>
                if ((not GetFld('TEndDate').IsNull) AND (GetFld('TEndDate').AsDateTime <> DEF_E_DATE)) then
                    MemPrint.FieldByName('TEndDate').AsString := FormatDateTime( 'yyyy/mm/dd', GetFld('TEndDate').AsDateTime )
                else
                    MemPrint.FieldByName('TEndDate').Clear;
                // ↑↑↑<127>

                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('UpdDateTM').AsDateTime);
                //@ ↑
            end;

		    // 手形ランク
            MemPrint.FieldByName('TgtRnk').AsString     :=	GetFld('BillRank').AsString;
		    // 支払場所
            MemPrint.FieldByName('Paybash1').AsString     :=	GetFld('ClearHouse1').AsString;
            MemPrint.FieldByName('Paybash2').AsString     :=	GetFld('ClearHouse2').AsString;
            MemPrint.FieldByName('Paybash3').AsString     :=	GetFld('ClearHouse3').AsString;

            // 振出人
            MemPrint.FieldByName('Furi1'	).AsString :=  GetFld('DrawerDraft1').AsString;
            MemPrint.FieldByName('Furi2'	).AsString :=  GetFld('DrawerDraft2').AsString;
            MemPrint.FieldByName('Furi3'	).AsString :=  GetFld('DrawerDraft3').AsString;
            MemPrint.FieldByName('Furi4'	).AsString :=  GetFld('DrawerDraft4').AsString;
            MemPrint.FieldByName('Furi5'	).AsString :=  GetFld('DrawerDraft5').AsString;

            MemPrint.Post();
            Next;
        end;
	end;

    DmqMTOKUI.Close();
	DmqMTOKUI.Free();

end;

//******************************************************************************
//		procedure	:
//		Name		: 華 震名(上海未来)
//		Date		: 2001/03/27
//		Parameter	: なし
//		Return		:
//		History		: 9999/99/99	X.Xxxx
//******************************************************************************
procedure TJNTCRP004008F.fnSetProperty(iKbn: integer; eEdit: TMTxtEdit ;
  lLabel: TMLabel);
begin

	Case iKbn of
        // 通常
		0:
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
		end;
        // 入力不可・非表示
		1:;
		2:
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled:=False;
			eEdit.Text :='';
			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;

end;
procedure TJNTCRP004008F.fnSetProperty(iKbn: integer; eEdit: TMNumEdit;
  lLabel: TMLabel);
begin

	Case iKbn of
        // 通常
		0:
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
        // 入力不可・表示
		1:
		begin
			eEdit.ParentColor:=True;
		end;
        // 入力不可・非表示
		2:
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled	:=False;
			eEdit.Value		:=0;
			eEdit.Zero		:=False;
			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;

end;

//-----------------------------------------------------------------------------
{private function記述 START位置}
//=============================================================================
//-----------------------------------------------------------------------------
// フィールド入力値のチェックをする
//-----------------------------------------------------------------------------
function TJNTCRP004008F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompoName : string;
    lvRowNo     : Integer;
    lvCode,
    lvNm,
    lvNmk       : String;
    lvNo        : Integer;
    lvDFM       : Integer;
    i           : Integer;
    Bol         : Boolean;
    iSeiKbn     : Integer;                                  // 請求区分
    iOyakoFL    : Integer;                                  // 親子ﾌﾗｸﾞ
    lvErrCod    : Integer;                                  // ｴﾗｰｺｰﾄﾞ

begin

    Result := True;

    lvCompoName := TComponent(Sender).Name;

    //===================================================================
    // 取引先ｺｰﾄﾞ
    //===================================================================
    with f0CODE do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            //<122> --- St ---
            if uvAttr <> 2 then
            begin
                if f0CODE.InputFlag = False then
                    f0CODE.Zero := True
                else
                    f0CODE.Zero := False;
            end
            else
                f0CODE.Zero := False;
            //<122> --- Ed ---

            if Trim(Text) = '' then
            begin
                // 必須入力です。
				uvSelSys.MsgDlg(1010,10);
                SetFocus;
                Result := False;
                Exit;
            end;
            if JNTSelXKanjiCheck(Text) = True then
            begin
                // 入力値に漢字もしくは特殊文字が含まれています。
				uvSelSys.MsgDlg(1010,20);
                SelectAll;                                  // ｺｰﾄﾞ欄を全選択する。
                SetFocus;
                Result := False;
                Exit;
			end;
{↓<Rel>
            if fnChkTRCODE = False then
            begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
 ↑<Rel>}
// ↓<Rel>
            lvErrCod := fnChkTRCODE;
            if lvErrCod <> 0 then
            begin
                case lvErrCod of
                    -1:
                    begin
                        uvSelSys.MsgDlg(1010,50);
                    end;
                    -98:
                    begin
                        // 親に存在(同期ｷｬﾝｾﾙ) は何もしない。
                    end;
                    -99:
                    begin
                        MjsMessageBoxEx (Self,'登録が異常終了しました。', 'マスタ同期', mjError, mjOk, mjDefOk);
                    end;
                end;
                SelectAll;                                  // ｺｰﾄﾞ欄を全選択する。
                SetFocus;
                Result := False;
                Exit;
            end;
// ↑<Rel>
            if AllChkMode = False then Exit;
        end;
    end;
end;

//******************************************************************************
//		function	: fnSousa_Select 関数
//		Name		: 沈暁輝（上海未来）
//		Date		: 2001/01/04
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//		History		: 2002/11/22	Y.Kondo	<K021122>
//									年間所定労働時間追加
//					: 2004/08/18	T.Aoki
//					:	納付書氏名
//					:	総括表判定区分
//					:	を追加<040818>
//					: 2004/09/14	T.Aoki
//					:	総括表判定区分=1区分判定で,
//					:	退職者集計区分の内容が表示される不具合修正<040914>
//******************************************************************************
function TJNTCRP004008F.fnSousa_Select: Boolean;
var
	DMQuery		:TMQuery;
begin


	Result := False;
	DMQuery  := TMQuery.Create(Self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続
	try

        with DMQuery do
        begin

            fnCompClear;
            if uvDispFlg = 0 then
                fnCompEnabled(True)
            else
            begin
                fnCompEnabled(False);
                BCancel_Sousa.Enabled := True;
//<124>↓
//親画面でメッセージ出力するため、
//ここでは表示しない
{
                if m_cJNTArea.IsModify = True then
            		MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
}
//<124>↑
            end;

            Close;
            //MTOKUIを呼び出す
            SQL.Clear;
            Sql.Add('Select * from MTOKUI_MAS '+
                    ' Where (BaseNCode = :pCODE)');
            ParamByName('pCODE').asFloat := uvNCODE;
            Open(True);
            if not Eof then
            begin
                f1TRank.Text     := GetFld('BillRank').AsString;
                f1Basho1.Text    := GetFld('ClearHouse1').AsString;
                f1Basho2.Text    := GetFld('ClearHouse2').AsString;
                f1Basho3.Text    := GetFld('ClearHouse3').AsString;
                f1Basho3.Text    := GetFld('ClearHouse3').AsString;
                f1Frdasi1.Text   := GetFld('DrawerDraft1').AsString;
                f1Frdasi2.Text   := GetFld('DrawerDraft2').AsString;
                f1Frdasi3.Text   := GetFld('DrawerDraft3').AsString;
                f1Frdasi4.Text   := GetFld('DrawerDraft4').AsString;
                f1Frdasi5.Text   := GetFld('DrawerDraft5').AsString;

                uvInsFlg    := False;    //更新
            end
            else
                uvInsFlg    := True ;    //新規

        end;
        Result := True;

	finally
		DMQuery.Close ;
		DMQuery.Free ;
	end;

    m_EdtSw := False;   //<107>
end;

//******************************************************************************
//		function	: fnSousa_Update 関数
//		Name		: 沈暁輝（上海未来）
//		Date		: 2001/01/04
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//		History		: 2002/11/22	Y.Kondo	<K021122>
//									年間所定労働時間追加
//					: 2004/08/18	T.Aoki
//					:	納付書氏名
//					:	総括表判定区分
//					:	を追加<040818>
//******************************************************************************
function TJNTCRP004008F.fnSousa_Update: Boolean;
var
	DMQuery		:TMQuery;
//-------------------------------------------
//  パラメータをセット
//-------------------------------------------
Procedure lfnParamSet;
begin

    with DMQuery do
    begin
        ParamByName('BaseNCode').AsFloat     :=  uvNCODE;
        ParamByName('BillRank').AsString     :=  f1TRank.text;
        ParamByName('ClearHouse1').AsString  :=  f1Basho1.text;
        ParamByName('ClearHouse2').AsString  :=  f1Basho2.text;
        ParamByName('ClearHouse3').AsString  :=  f1Basho3.text;
        ParamByName('DrawerDraft1').AsString  :=  f1Frdasi1.text;
        ParamByName('DrawerDraft2').AsString  :=  f1Frdasi2.text;
        ParamByName('DrawerDraft3').AsString  :=  f1Frdasi3.text;
        ParamByName('DrawerDraft4').AsString  :=  f1Frdasi4.text;
        ParamByName('DrawerDraft5').AsString  :=  f1Frdasi5.text;
    end;

end;
begin
	Result := False;
	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

// <Rel>	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続

//↓<Rel>
    // -------------------------------------------------------------------------
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        // 親会社DBとTStoredProcの接続
    	MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, DMQuery)		// DBとの接続
    else
    	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);					// DBとの接続
//↑<Rel>

	try

        with DMQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add(' Update MTOKUI_MAS SET ' +
                    ' BillRank   = :BillRank  , '+
                    ' ClearHouse1  = :ClearHouse1  , '+
                    ' ClearHouse2  = :ClearHouse2  , '+
                    ' ClearHouse3  = :ClearHouse3  , '+
                    ' DrawerDraft1 = :DrawerDraft1  , '+
                    ' DrawerDraft2 = :DrawerDraft2  , '+
                    ' DrawerDraft3 = :DrawerDraft3  , '+
                    ' DrawerDraft4 = :DrawerDraft4  , '+
                    ' DrawerDraft5 = :DrawerDraft5   '+
                    ' Where  BaseNCode = :BaseNCode    ');

            lfnParamSet;
            EXECSQL(true);
        end;

//↓<Rel>
        // ﾄﾘｶﾞで子取引先ﾚｺｰﾄﾞの_Relが更新されるので、同期ﾌﾟﾛｼｼﾞｬを実行して配信してあげる。
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_MAS) = false ) then
            begin
                Result := false;
                Exit;
            end;

            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,uvNCode,DMQuery) then
            begin
                Result := false;
                Exit;
            end;
        end;
//↑<Rel>

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;


end;
//============================================================================
//  コンポーネントの使用可・不可の制御
//============================================================================
Procedure TJNTCRP004008F.fnCompEnabled(pBol:Boolean);
begin

    PnlTop.Enabled     := not(pBol);
    PSousa.Enabled     := pBol;

    BUpdate_Sousa.Enabled := pBol;
    BCancel_Sousa.Enabled := pBol;

end;
//============================================================================
//  コンポーネントのクリア
//============================================================================
Procedure TJNTCRP004008F.fnCompClear;
begin

    f1TRank.text     := '';
    f1Basho1.text    := '';
    f1Basho2.text    := '';
    f1Basho3.text    := '';

    f1Frdasi1.text   := '';
    f1Frdasi2.text   := '';
    f1Frdasi3.text   := '';
    f1Frdasi4.text   := '';
    f1Frdasi5.text   := '';


end;
//-----------------------------------------------------------------------------
//  取引先コードのチェック
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// fnChkTRCODE()
//      RETURN  : Integer         0:正常終了,
//                               -1:存在しない。
//                              ※↓以下はグループ会計の子社のみ返る可能性がある値。
//                              -98:親に存在(同期ｷｬﾝｾﾙ),
//                              -99:異常終了
//      MEMO    : 取引先コードのチェック
//-----------------------------------------------------------------------------
//Function TJNTCRP004008f.fnChkTRCODE:Boolean;
Function TJNTCRP004008f.fnChkTRCODE: Integer;
var
    Qry     :TMQuery;
    lvCODE  : String;
//↓<Rel>
	PQe     : TMQuery;                                      // 全社DB用ｸｴﾘ
	Qe      : TMQuery;                                      // 子社DB用ｸｴﾘ
	strNmk  : string;
	nPNCode : Extended;
//↑<Rel>
begin

// <Rel>    Result      := False;
    Result      := 0;
    f0NAME.text := '';
    uvNCODE     := 0;
    lvCODE      := '';


	if uvAttr = 2 then
		lvCODE:= f0CODE.text
	else
	begin
		if f0CODE.text <> '' then
			lvCODE	:= Format ('%.16d', [StrToInt64 (Trim(f0CODE.text))])
		else
			lvCODE := '';
	end;

//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
	begin
        // 親会社用ｸｴﾘの作成
		PQe := TMQuery.Create(Self);
		MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, PQe);

        // 子会社用ｸｴﾘの作成
		Qe  := TMQuery.Create(Self);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

		try
			// 子社DBにあるか？
			Qe.Close;
			Qe.SQL.Clear;
			Qe.SQL.Add('select NCODE from MTOKUI '
				+   ' where (GCODE = :pCODE) and (RDelKbn = 0)');
            Qe.ParamByName('pCODE').AsString := lvCode;

			if not Qe.Open then
			begin
				Result := -99;
				Exit;
			end;

			if Qe.EOF then
			begin
				// 子社DBに存在しないときは全社DBにあるか？
				PQe.Close;
				PQe.SQL.Clear;
				PQe.SQL.Add('select NCODE,NMK from MTOKUI '
					+   ' where (GCODE = :pCODE) and (RDelKbn = 0)');
                PQe.ParamByName('pCODE').asString := lvCode;

				if not PQe.Open then
				begin
					Result := -99;
					Exit;
				end;

				if not PQe.EOF then
				begin
                    // 親に存在した。
					strNmk  := PQe.FieldByName('NMK').AsString;
					nPNCode := PQe.FieldByName('NCODE').AsFloat;

			        if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC + #13#10#13#10
			                           + strNmk,
			                             '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
			        begin
                        // 同期確認ﾀﾞｲｱﾛｸﾞの結果→「同期する」論理

			            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
			            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            MDataModule.BeginTran( dbCorp_Select );

				        try
                            if not fnMTOKUI_Sync(m_SyncMaster,nPNCode,PQe) then
                            begin
                                MjsMessageBoxEx (Self,
                                                     '自社への関連付けに失敗しました。',
                                                     'マスタ同期', mjError, mjOk, mjDefOk);
                                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                MDataModule.Rollback( dbCorp_Select );
				                Result := -99;
				                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,nPNCode,PQe) then
                            begin
                                Result := -99;
                                Exit;
                            end;

			            except
			                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
			                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                MDataModule.Rollback( dbCorp_Select );
			                Result := -99;
			                Exit;
			            end;

			            // 親会社DBに対してｺﾐｯﾄを実行する
			            MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してｺﾐｯﾄを実行する
	                    MDataModule.Commit( dbCorp_Select );
					end
                    else
                    begin
                        // 同期確認ﾀﾞｲｱﾛｸﾞの結果→「同期ｷｬﾝｾﾙ」論理
						Result := -98;
		                Exit;
                    end;
				end;
			end;
		finally
			PQe.Close;
			PQe.Free;
			Qe.Close;
			Qe.Free;
		end;
	end;
//↑<Rel>

    Qry := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							            // ｸｴﾘの初期化
            Sql.Add('Select NCODE,NM from MTOKUI '+
                    ' Where (GCODE = :pCODE) and (RDelKbn <> 1)');
            ParamByName('pCODE').asString := lvCODE;
            Open;						                    // ｸｴﾘの開始

            if EOF = False then
            begin
//                Result := True;                           // <Rel>
                Result := 0;                                // <Rel>
                f0NAME.text := FieldByName('NM').asString;
                uvNCODE     := FieldByName('NCODE').asFloat;
            end
            else
//                Result := False;                          // <Rel>
                Result := -1;                               // <Rel>
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  編集をキャンセルする
//-----------------------------------------------------------------------------
function TJNTCRP004008f.fnCancel: Boolean;
begin

    Result := False;

//    f0CODE         .InputFlag := True;  //<122>
//    f0CODE         .Zero := False;      //<122>

    fnCompClear;
    fnCompEnabled(False);

    // <107>編集状態ｽｲｯﾁを初期化する
    m_EdtSw := False;

    MjsSetFocus(Self, 'f0CODE');

end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004008F.f0CODEArrowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    CompName:   String;         //
    i : Integer;
begin

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pMyAppRecord;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;

    lvExpSend.MasterKbn     :=  22;         //マスタ区分＝
    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
    lvExpSend.TBarNM        :=  f0CODELab.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
    lvExpSend.TableName     :=  'MTOKUI';           //
    lvExpSend.TrRootCaption :=  f0CODELab.Caption;
    lvExpSend.WhereStr      :=  ' MTOKUI.RDelKBN = 0 '
                                + ' and MTOKUI.TemplateKbn = 0';          // <103>
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        f0CODE.Text    := lvExpRecv.GCode;   // 情報取得

        //<122> --- St ---
        if Sender = f0CODE then
            f0CODE.InputFlag := False;
        //<122> --- Ed ---

        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
		abort;
    end;


end;

//-----------------------------------------------------------------------------
// BChangeClick()   <106>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004008F.BChangeClick(Sender: TObject);
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

procedure TJNTCRP004008F.fnFldOnChg(Sender: TObject);
begin

    // <107>編集ｽｲｯﾁを設定する
    if ( m_EdtSw = False ) then m_EdtSw := True;

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<125>
//	Name		:	T.Seki
//	Date		:	2008/02/12
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004008F.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
	SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
	SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
	SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
	SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//		SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
		SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
// Delphi10 ED
	end;
end;

end.
