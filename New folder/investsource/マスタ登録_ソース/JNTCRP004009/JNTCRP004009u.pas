//================================================xxxxxxxxxxxxxx=============================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登　資産情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：飯塚 健介(LEAD)
//      作成日      ：2006.01.25(WED)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ> <修正者>  	<修正日>        <修正内容>
//  <112> 荒井秀士 		2006/06/29(TUE) リース取引先情報（消費税端数処理区分追加)
//  <Rel> 高橋功二  	2007/06/05(TUE) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//	<113> 品川和之		2008.05.20(TUE) J-SOX　共通マスタ更新履歴対応
//	<TCU> 倉持　剛(NTC)	2013.03.26(WED) 取引先コード欄の幅を変更
//	<KDS> 本田崇(Cycom)	2020.09.16(WED) MJSKeyDataToShiftState対応
//	<D10_OwnMapRules> 本田崇(Cycom)	2020.09.23(THU) 「JNTPDialog」が呼ばれた後に、MapOption.ClearとOwnMapRules := Falseの記述を追加
//	<CHOUON> 渡邊(CyCom) 2021.01.08(FRI) 長音対応。MJSライティングガイドに則った文言に修正
//
//=============================================================================
unit JNTCRP004009U;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
    VCL.StdCtrls, ComCtrls, Buttons, VCL.ExtCtrls, FileCtrl,

	MJSStatusBar, MJSBitBtn, MJSFunctionBar, MJSSPFunctionBar, MJSLabel, MJSPanel,
    MJSCheckBox, MJSSpeedButton, MJSEdits, MJSQuery, MJSRadioButton, MJSGroupBox,
    MJSComboBox,

    MJSCommonu, MjsDBModuleu, MjsDateCtrl, MjsDispCtrl, MjsMsgStdU, {MjsFolderU,}
    CMNExpFuncU, MjsStrCtrl, MJSPostCtrl,
	DB, FireDAC.Comp.Client, DBCtrls, dxmdaset, dxTL, dxDBGrid, dxCntner, dxGrClms,
    //myChkBox,
    daDatMod,JNTCommonU,

    JNTSelGlobal,
    JNTMasComu,
    JNTMasWndIFu,
    JNTSelCorpSys,
	MJSKeyDataState,  //<KDS> ADD
    MjsPrnDlgU,
    JNTMasMonth, MJSTab, MJSMemo, ActnList,
    JNTFuncU,
    JNTExpGlobal,
	FXLicense,
	MLBplLoaderU,     // <LPH> ADD
	JNTPDlg, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

  const
	WM_ONPAINT	= WM_APP + 1;	                            // OnPaint 時の処理起動メッセージ用

type
  {$include ActionInterface.inc}
  {$include MasCommonFuncH.inc}
  {$include JNTSelPrtIF.inc}
  {$include JNTCRPSyncMasterH.inc}                          // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP004009F = class(TForm)
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
    PTop: TScrollBox;
    PSousa: TScrollBox;
    f0CODE: TMTxtEdit;
    LabTRNM: TMLabel;
    fNAME: TMTxtEdit;
    MLabel2: TMLabel;
    Jituzai_PPanel_Card_2: TMPanel;
    BUpdate_Sousa: TMBitBtn;
    BCancel_Sousa: TMBitBtn;
    MPanel3: TMPanel;
    SStatusBar: TMStatusBar;
    AddPanel: TScrollBox;
    LblYUBIN: TMLabel;
    LblJUSHO1: TMLabel;
    LblTEL: TMLabel;
    Label1: TMLabel;
    MLabel1: TMLabel;
    Label2: TMLabel;
    Label48: TMLabel;
    MLabel16: TMLabel;
    f1POSTNO1: TMNumEdit;
    f1POSTNO2: TMNumEdit;
    f1ADS1: TMTxtEdit;
    f1ADS2: TMTxtEdit;
    f1TEL1: TMTxtEdit;
    f1SOFUB: TMTxtEdit;
    f1KEISYO: TMTxtEdit;
    f1MailAd: TMTxtEdit;
    f1TANM: TMTxtEdit;
    MSPFunctionBar: TMSPFunctionBar;
    MDPrint: TdxMemData;
    MDPrintGCode: TStringField;
    MDPrintRenso: TStringField;
    MDPrintNmk: TStringField;
    MDPrintNm: TStringField;
    MDPrintPostNo1: TStringField;
    MDPrintPostNo2: TStringField;
    MDPrintTStartDate: TStringField;
    MDPrintTEndDate: TStringField;
    MDPrintUpdDateTM: TStringField;
    MDPrintAds1: TStringField;
    MDPrintAds2: TStringField;
    MDPrintTel1: TStringField;
    MDPrintSectNm: TStringField;
    MDPrintTanNm: TStringField;
    MDPrintKeisyo: TStringField;
    MDPrintMail: TStringField;
    MDPrintBunCode: TStringField;
    MDPrintTDebitCashCd: TIntegerField;
    MDPrintTDebitCashNm: TStringField;
    MDPrintTCreditCashCd: TIntegerField;
    MDPrintTCreditCashNm: TStringField;
    MDPrintSDebitCashCd: TIntegerField;
    MDPrintSDebitCashNm: TStringField;
    MDPrintSCreditCashCd: TIntegerField;
    MDPrintSCreditCashNm: TStringField;
    MDPrintSTaxCode: TIntegerField;
    MDPrintSTaxName: TStringField;
    MDPrintBTaxCode: TIntegerField;
    MDPrintBTaxName: TStringField;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    f1TEL2: TMTxtEdit;
    MLabel5: TMLabel;
    f1FAX1: TMTxtEdit;
    MDPrintTel2: TStringField;
    MDPrintFax1: TStringField;
    lblTorihiki: TMLabel;
    lblSyozeiKbn: TMLabel;
    f1Hasukbn: TMNumEdit;
    lblKbnNm: TMLabel;
    MDPrintSyozeiHasuNM: TStringField;
    MDPrintSyozeiHasu: TStringField;
    SPMsHist: TFDStoredProc;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormDestroy(Sender: TObject);

    procedure fnWCtlEnter(Sender: TObject);
	procedure fnWCtlExit(Sender:TObject);

	procedure BUpdate(Sender: TObject);
	procedure BCancel(Sender: TObject);
	procedure BPrintClick(Sender: TObject);
    procedure fnPostArrowClick(Sender: TObject);
    procedure fnAdsArrowClick(Sender: TObject);
    procedure ArrowClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure evtOnChange(Sender: TObject);
    procedure kbnChange(Sender: TObject);
    procedure kbnExit(Sender: TObject);

  private
	{ Private 宣言 }
	m_pMyAppRecord	:   ^TMjsAppRecord;
	m_Base_pRec		:   ^TMjsAppRecord;
	MDataModule		:   TMDataModulef;
    ComArea			:   TJNTMASCom;
    dbCorp_Select	:   TFDConnection;
    m_dbMjsCmn		:   TFDConnection;
    m_AcControl		:   TWinControl;
    m_cJNTArea      :   TJNTCommon;

    m_MjsMsgRec		:   TMjsMsgRec;

    m_CmpList	    :   TList;
    B_Print 	    :   TMSpeedButton;                      // 印刷ﾎﾞﾀﾝ
    B_Change        :   TMSpeedButton;                      // 切出/埋込ﾎﾞﾀﾝ<107>
    m_bBtnChange	:   Boolean;                            // 切出≪=≫埋込ﾌﾗｸﾞ<107>

	m_bFirstFlag	:   array [0..1] of Boolean;

    m_iSysColor		:   Integer;
	m_iSysCode		:   Integer;
    m_iOptCode		:   Integer;
	m_iCorpCode		:   Integer;
	m_iCorpSubCode	:   Integer;
	m_iSysCodeNo 	:   Integer;
    m_nTaxInfoAccDivision   : Integer;
    MComboBox       :   TMComboBox;

    CloseFlg	    :   Boolean;
    m_EdtSw         :   Boolean;                            // 編集ｽｲｯﾁ

    uvAttr,uvDigit  :   Integer;                            // 桁数属性
    uvExpOpenSW     :   Boolean;                            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
	uvSelSys        :   TJNTSelCorpSys;                     // 会社ｼｽﾃﾑ情報
    uvDispFlg       :   Integer;                            // 決算フラグ（ 0:未確定、1:確定済）

    uvHani          :   TJNTHani;
    PrintAppEntry   :	TPrintAppEntry;
    ArrHdl          :   Array[0..100] of Pointer;
    PrtParam		:	rcPrtParam;
    DmqPrint        :   TMQuery;
	m_iRekiKbn		:   Integer;
    m_TantoNCode    :   Extended;

    m_SyncMaster    :   TSyncMaster;                        // <Rel> ﾏｽﾀ同期基本ｸﾗｽ

    m_RepHandle			: THandle;                              // <077> ADD 印刷モジュールハンドル


    procedure   WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
	procedure   fnSetProperty(iKbn:integer;eEdit:TMTxtEdit ;lLabel:TMLabel);overload;
	procedure   fnSetProperty(iKbn:integer;eEdit:TMNumEdit ;lLabel:TMLabel);overload;
	procedure   fnPrnSET();
    procedure   fnKbnStrSet;
    Procedure   fnCompEnabled(pBol:Boolean);
    Procedure   fnCompClear;
    procedure   fnCallPostExplorer(pvKeyWord: String; pvPostEdit1,
                        pvPostEdit2: TMNumEdit; pvAdsEdit1, pvAdsEdit2: TMTxtEdit);

    function    fnGetDspData(sCode: String): String;
    // function    fnChkTRCODE: Boolean;                    // <Rel>
    function    fnChkTRCODE: Integer;                       // <Rel>

    function    fnCancel: Boolean;
	function    fnGetList(cmpEdit: TObject): Boolean;
	function    fnSousa_Select:Boolean;
	function    fnSousa_Update:Boolean;
    function    fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
    function    NspSepStr(const sSrc: String; iLen: integer; var sDst1,
                        sDst2: string): boolean;
	procedure	SessionPractice(iSyori: Integer);	//<113> セッション管理ストアドのパラメータ追加

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


{$R *.DFM}
var
    uvClearFlg  : Boolean;
    uvNCODE     : Extended;
    uvInsFlg    : Boolean;

//<113>st
const
	C_ST_PROCESS		= 0;	// 設定
	C_ED_PROCESS		= 1;	// 開放
//<113>ed

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
	pMyForm	:	^TJNTCRP004009f;
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
				pMyForm^ := TJNTCRP004009f.CreateForm(pParam);
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
				pMyForm^	:=	TJNTCRP004009f.CreateForm(pRec);
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
constructor TJNTCRP004009F.CreateForm(pRec: pointer);
begin

    m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );              // 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);	    // MJS共通DBﾓｼﾞｭｰﾙ
    ComArea		    :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);		    // ｼｽﾃﾑﾒﾓﾘ 取得

    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

    m_iSysColor	    :=  ComArea.SystemArea.SysColorB;		                // ｼｽﾃﾑｶﾗｰ(淡) 取得
	m_iSysCode	    :=  m_pMyAppRecord^.m_iSystemCode;		                // ｼｽﾃﾑｺｰﾄﾞ 取得

    m_iCorpCode	    :=  m_pMyAppRecord^.m_iCorpCode;			            // 会社ｺｰﾄﾞ 取得
    m_iCorpSubCode	:=  m_pMyAppRecord^.m_iCorpSubCode;	                    // ｼｽﾃﾑDBｺｰﾄﾞ 取得 (決算開始年月日)
	m_iSysCodeNo    :=  (m_iSysCode * 100) + m_iOptCode;	                // ｼｽﾃﾑｺｰﾄﾞ+ｵﾌﾟｼｮﾝｺｰﾄﾞ 取得

    m_TantoNCode    := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

	if fnCMNPostInit(m_pMyAppRecord) <> 0 then			                    // 郵便番号辞書 初期化
	begin
		raise EMathError.Create('郵便番号辞書の初期化に失敗しました｡');
		Exit;
	end;

//↓<Gali2258>FormCreateから移動
    m_cJNTArea           := TJNTCommon   ( m_CmpList.Items[8]^ );
    m_Base_pRec          := Pointer      ( m_CmpList.Items[9]^ );
//↑<Gali2258>

	m_cJNTArea.setSelAppRecord; //<Gali2258>

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

//<Gali2258>if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
    	if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then //<Gali2258>
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

  	m_cJNTArea.setMasAppRecord; //<Gali2258>

    // 会社DB Open
	dbCorp_Select := MDataModule.COPDBOpen( 1, ComArea.m_iCopNo );				// 会社DBOpne
	if dbCorp_Select = nil then
	begin
		ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx (Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		raise Exception.Create('');
		MDataModule.CTLDBClose(m_dbMjsCmn);
		Exit;																// 例外生成
	end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
    	if (uvSelSys.CreateSysInfo(dbCorp_Select) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;

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
procedure TJNTCRP004009F.FormCreate(Sender: TObject);
var
	DMQuery		:   TMQuery;
    i,
    iRet        :   Integer;
    lvHandle    :   THandle;
begin

	CloseFlg        :=  False;
    m_bFirstFlag[0]	:=  False;
	m_bFirstFlag[1]	:=  False;
    m_bBtnChange 	:=  TRUE;

    // ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

    B_Print 	     := TMSpeedButton( m_CmpList.Items[0]^ );   // 印刷
{↓<Gali2258>CreateFormへ移動
    m_cJNTArea       := TJNTCommon   ( m_CmpList.Items[8]^ );
    m_Base_pRec      := Pointer      ( m_CmpList.Items[9]^ );
↑<Gali2258>}
    MComboBox        := TMComboBox   ( m_CmpList.Items[10]^ );
    B_Change         := TMSpeedButton( m_CmpList.Items[11]^ );
	m_SyncMaster     := TSyncMaster  ( m_CmpList.Items[13]^ );  // <Rel>

    B_Print.OnClick  := BPrintClick;
    B_Change.OnClick := BChangeClick;

	Parent           := TPanel(m_pMyAppRecord^.m_pOwnerPanel^); // 親のﾊﾟﾈﾙに埋込む
	Align            := alClient;

    MjsColorChange(				                                // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP004009F(Self),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor
				  );

    MjsFontResize( TJNTCRP004009F(Self), Pointer(m_pMyAppRecord) );

//<113>----->
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;
//<-----<113>

    // Enabledの制御
    uvClearFlg := False;
    fnCompClear;
    fnCompEnabled(False);

    uvClearFlg := True;

	m_nTaxInfoAccDivision	:= 0;								// 消費税基本情報: 会計処理区分 (0:免税業者)

    m_RepHandle	:= 0;       // <077> ADD 印刷モジュールハンドル

	DMQuery := TMQuery.Create(self);							// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);		// DBとの接続
    Try
        with DMQuery do
        begin
            Close ();
            LabTRNM.Caption := '';

            Close;
            Sql.Clear;
            Sql.add(' Select CodeDigit,CodeAttr,JHojyoName From MasterInfo '+
                    ' Where (MasterKBN = 22)');
            Open;
            if not Eof then
            begin
                uvDigit := GetFld('CodeDigit') .AsInteger;      // 桁数
                uvAttr  := GetFld('CodeAttr').asInteger;        // 属性
                LabTRNM.Caption := GetFld('JHojyoName').asString + 'コード';
            end;

            Close ();
            SQL.Clear;
            SQL.Add ('SELECT ComKbn2, YearKbn FROM DTMAIN');
            Open ();
            if not Eof then
	        begin
                uvDispFlg := FieldByName ('ComKbn2').AsInteger;	// 決算確定
				m_iRekiKbn:= GetFld('YearKbn').AsInteger;
    	    end;

			Close ();

        end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

    // 権限情報を取得
    if (m_cJNTArea.IsModify = False) then
    begin
        if (m_cJNTArea.IsAppend = False ) then
        begin
            uvDispFlg := 1;                                     // 決算確定と同様の処理
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

    // 文字列ｵﾌﾞｼﾞｪｸﾄを作成する
    fnKbnStrSet;

    m_AcControl :=  f0CODE;

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 }
	try
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004009L.BPL');

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP004009LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
    	UnloadPackageHelper( lvHandle );
    end;

    m_RepHandle	:= lvHandle;                            // <077> ADD 印刷モジュールハンドル

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

		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(Self,
                m_Base_pRec,
                MDataModule,
                ComArea,
                dbCorp_Select,
                'JNTCRP004009',
                uvHani,
                uvSelSys);

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pMyAppRecord) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);


    m_EdtSw := False;                               //編集状態ｽｲｯﾁを初期化する

    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);		//イベントOnCreateの最後に


end;

//************************************************************************
//*		Proccess		:	WMOnPaint関数
//*		Name			:	S.Ogawa
//************************************************************************
procedure TJNTCRP004009F.WMOnPaint(var Msg: TMessage);
begin

	// 初期のみ一回の処理
	if m_bFirstFlag[0] = False then
	begin
        m_bFirstFlag[0] := True;

        // 得意先ｺｰﾄﾞの属性対応
        case uvAttr of
            0:  f0CODE.InputAttr    :=  iaZeroSup;
            1:  f0CODE.InputAttr    :=  iaZeroPad;
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
procedure TJNTCRP004009F.FormShow(Sender: TObject);
begin

    JNTMasSetCaption( m_pMyAppRecord );
	MjsBtnVisible( TJNTCRP004009F(Self), TRUE );

    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Show
    else
    begin
        PSousa.Visible  :=  True;
	    FormActivate( Sender );
        m_AcControl.SetFocus();
    end;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Hide
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004009F.FormHide(Sender: TObject);
begin

    MJSBtnVisible( TJNTCRP004009F(Self), False );

    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Hide;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Close
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004009F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
begin

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if ( uvExpOpenSW = TRUE ) then
        fnJNTExpFree;

    // 販売ｼｽﾃﾑ情報の解放
    uvSelSys.Free;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 会社DBｸﾛｰｽﾞ処理
    if ( dbCorp_Select <> nil ) then
        MDataModule.COPDBClose(dbCorp_Select);

    // 郵便番号辞書 終了
	fnCMNPostFree;

    Action                      :=  caFree;
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
procedure TJNTCRP004009F.FormDestroy(Sender: TObject);
begin

	gfnHaniTerm(uvHani);

    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  uvSelSys;
	end;

    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

// <077> ADD-STR
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
// <077> ADD-END

end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004009F.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
var
    iRet : Integer;
begin

    // 終了ﾌﾗｸﾞをONに設定する
    if ( CloseFlg = False ) then CloseFlg := True;

    if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		ComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType );
	   	CanClose := FALSE;
        Exit;
	end
    else
    	CanClose := TRUE;

    	if (m_EdtSw) then                   // 変更あり
	    begin
            // 変更を保存します。よろしいですか？
            ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10020,2);
            with m_MjsMsgRec do
            begin
                iRet := MjsMessageBoxEx(Self, sMsg, sTitle, icontype,
                                    btntype, btndef, LogType );
            end;

            if iRet = mrYes then            // 「はい」
            begin
                                            // 入力ﾁｪｯｸ
                if fnFldChk(Self, True) = False then
                begin
                    CanClose := False;
                end
                else
                begin
                	fnSousa_Update;         // 更新処理
                    m_EdtSw := False;
                end;
            end
            else if iRet = mrCancel then    // 「ｷｬﾝｾﾙ」
            begin
                CanClose := False;
            end
            else                            // 「いいえ」
            begin
                m_EdtSw := False;
            end;
        end;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Activate
//		Name		:KOS.HORI
//		Histry		:
//**********************************************************************
procedure TJNTCRP004009F.FormActivate(Sender: TObject);
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
procedure TJNTCRP004009F.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	SName	:	string;
begin

	if GetKeyState(VK_MENU) < 0 then
		Exit;

	SName		:= Screen.ActiveControl.Name;
//<KDS>Upd St
//	sShift		:= KeyDataToShiftState(Msg.KeyData);
	sShift		:= MJSKeyDataToShiftState(Msg.KeyData);
//<KDS>Upd Ed
	m_ACControl	:= Screen.ActiveControl;

    // ENTER / TABｷｰの補足
    if  ( Msg.CharCode = VK_RETURN ) or
       (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) then
    begin

        // ENTERｷｰの場合だけ何も行わない<110>
        if ( Msg.CharCode = VK_RETURN ) then
        begin
            if ( m_ACControl is TMBitBtn )  then Exit;
        end;

        // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸを行う
        if ( fnFldChk(TComponent(Screen.ActiveControl), True) = False ) then
            Abort;

        // 先頭ｺﾝﾎﾟｰﾈﾝﾄの場合
    	if ( m_ACControl = f0CODE ) then
        begin
            // ﾃﾞｰﾀの読込
            fnSousa_Select;

            // ↓↓↓<110>
            MjsNextCtrl(Self);
            Abort;
            // ↑↑↑<110>

            Exit;
        end;
    end;


	{文字入力コンポーネント}
	if m_ACControl is TMTxtEdit then
	begin
		case Msg.CharCode of
			VK_TAB:					//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RETURN, VK_DOWN:		//Return、↓
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_RIGHT:				//→
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
			VK_LEFT:				//←
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
			VK_UP:					//↑
			begin
				if sShift = [] then
				begin
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;
			VK_END:					//END
			begin
				if MjsChkCurEnd(m_ACControl) = False then
					exit;
			end;
		end;
	end;

	{チェックボックス・数値入力・日付入力コンポーネント}
	if (m_ACControl is TMCheckBox) or (m_ACControl is TMNumEdit) or
		(m_ACControl is TMDateEdit) then
	begin
		case Msg.CharCode of
			VK_TAB:							//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RETURN, VK_RIGHT, VK_DOWN:	//Enter、→、↓
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_LEFT, VK_UP:					//←、↑
			begin
				if sShift = [] then
				begin
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;
		end;
	end;

	{更新・削除ボタン}
	if (m_ACControl is TMBitBtn) then
	begin
		case Msg.CharCode of
			VK_TAB:							//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RIGHT, VK_DOWN:
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_LEFT, VK_UP:
			if sShift = [] then
			begin
				MjsPrevCtrl(Self);
				Abort;
			end;
			//更新・キャンセルボタン上でのESCは何もなし
			VK_ESCAPE:
				Exit;
			VK_END:
			begin
                Exit;
			end;
		end;
	end;

 	case Msg.CharCode of
		VK_ESCAPE,VK_END:
		begin
			//先頭項目ならば終了
			if (SName = 'f0CODE') then
			begin
    			MComboBox.SetFocus ();
				exit;
			end;

            MjsSetFocus(Self,'BUpdate_Sousa');
            Abort;
		end;
	end;

end;

//**********************************************************************
//		Component	:BUpdate_XXX  更新処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004009F.BUpdate(Sender: TObject);
begin

    //フィールド入力値のチェックをする
    if fnFldChk(Self, True) = False then
        Exit;

	fnSousa_Update;

    fnCompClear;
    fnCompEnabled(False);

    m_EdtSw := false;

    f0CODE.SetFocus;


    FormActivate(nil);


end;

//**********************************************************************
//		Component	:BCancel_XXX    取消処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004009F.BCancel(Sender: TObject);
begin
    // キャンセル
	fnCancel;
    m_EdtSw := False;	//変更ｽｲｯﾁOFF

end;

//**********************************************************************
//		Proccess	:ｺﾝﾎﾟｰﾈﾝﾄﾌｫｰｶｽ取得
//		Name		:丘 嶸(上海未来)
//		Date		:2001/01/06
//		Parameter	:なし
//		Return		:なし
//		History		:2001/04/13 KOS.HORI
//					:ステータスメッセージを非表示
//**********************************************************************
procedure TJNTCRP004009F.fnWCtlEnter(Sender: TObject);
begin

	m_ACControl:=Sender as TWinControl;

end;

//**********************************************************************
//		Proccess	:ｺﾝﾎﾟｰﾈﾝﾄﾌｫｰｶｽ消失
//		Name		:丘 嶸(上海未来)
//		Date		:2001/01/06
//		Parameter	:なし
//		Return		:なし
//		History		:2001/02/02 KOS ADD 郵便番号編集
//					:2001/04/20 KOS ADD デフォルトセット条件追加
//					:2004/06/21(T.Aoki)
//					:月指定時の補完月 追加<040621>
//					:2004/07/15(T.Aoki)
//					:労災保険料の制御 修正<040715>
//					:2004/08/18(T.Aoki)
//					:総括表判定区分の制御 追加<040818A>
//**********************************************************************
procedure TJNTCRP004009F.fnWCtlExit(Sender: TObject);
var
	i		: integer;
    bRtn    : Boolean;
begin

	//------------------------------------------
	//自フォームがACTIVEでない場合は処理を抜ける
	for i:=0 to ComponentCount-1 do
	begin
		if Components[i]=Screen.activecontrol then
			break;
	end;
	if i>=ComponentCount then
		Exit;
	//------------------------------------------

    if(Sender is TMnumEdit)then
	begin
		//リスト名称表示
		bRtn:=fnGetList(Sender);
		if bRtn = False then
		begin
			MjsSetFocus(Self,TMNumEdit(Sender).Name);
			Beep;
			Abort;
		end;
    end;


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
function TJNTCRP004009F.fnGetList(cmpEdit: TObject): Boolean;
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

		if TMNumEdit(cmpEdit).Value = StrToInt(sName) then
			break;
	end;
	//一致しなかった
	if i > TMNumEdit(cmpEdit).SelectItems.Count then
	begin
		result := false;
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
procedure TJNTCRP004009F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
    JNTPDlg     :   TFrmJNTPDialog;
begin

    // 販売ポインタ設定
//    m_cJNTArea.setSelAppRecord;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<D10_OwnMapRules>Add St
	dbCorp_Select.FormatOptions.MapRules.Clear;
	dbCorp_Select.FormatOptions.OwnMapRules := False;
//<D10_OwnMapRules>Add Ed

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
            // 実在取引先リスト
            if ( uvHani.pvrPattern = 0 ) then
            begin
                fnPrnSET();
				PrtParam.TargetMD   :=  MDPrint;
		    end;
            with PrtParam do
			begin
				Para		    :=  uvHani;
				TargetQry	    :=  DmqPrint;
				CorpSys		    :=  uvSelSys;
                JNTArea         :=  m_cJNTArea;
                // *** 汎用変数 *** //
                TargetParam	    :=  nil;
	    	    TargetStr	    :=  '';
    		    TargetInt	    :=  0;
                // *** 汎用変数 *** //
			end;

            //印刷する
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else Exit;		//ｴﾗｰ
    end;

    // 財務ポインタ設定
//    m_cJNTArea.setMasAppRecord;
end;
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】
// -----------------------------------------------------------------------------
procedure TJNTCRP004009F.fnPrnSET();
var
	dqMasterData    :   TMQuery;
    sCode           :   String;
begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);

    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
        SQL.Add('select DE.*,                           	'
            +   '    mt.GCode           m_GCode         	'   // 外部ｺｰﾄﾞ       		(mtokui)
            +   '   ,mt.Renso           m_Renso         	'   // 連想　　       		(mtokui)
            +   '   ,mt.Nm              m_Nm            	'   // 正式名称       		(mtokui)
            +   '   ,mt.Nmk             m_Nmk           	'   // 簡略名称       		(mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        	'   // 与信限度額     		(mtokui)
            +   '   ,mt.TStartDate      m_StDate        	'   // 適用日（自）   		(mtokui)
            +   '   ,mt.TEndDate        m_EnDate        	'   // 適用日（至）   		(mtokui)
            +   '   ,mt.UpdDateTM       m_UpDate        	'   // 最終更新日時   		(mtokui)
			+	'	,mt.SisanHojyoKbn3	m_SisanHojyoKbn3	'   // 資産リース会社区分   (mtokui)

            +   'from MTOKUI_DEP DE           				'
            +   'left outer join MTOKUI mt ON       		'
            +   '   (DE.BaseNCode = mt.NCode)           	'
            +   'where (mt.RDelKbn = 0)                 	'
            +   '  and (mt.SumKbn = 0)                  	'
            +   '  and ((mt.SisanHojyokbn1 <> 0) or (mt.SisanHojyoKbn2 <> 0) or (mt.SisanHojyoKbn3 <> 0)) '	//<112>
            +   '  and (mt.TemplateKbn = 0)             ');

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
            SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY mt.GCode         ')
        else    SQL.Add('ORDER BY mt.Renso, mt.GCode  ');

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
			dqMasterData.Close();
			dqMasterData.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MDPrint.Append();
			//------------------------------------------------------------------
            // 取引先情報
			//------------------------------------------------------------------
            // 外部ｺｰﾄﾞ
            // 数値属性
            if ( uvAttr = 0 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( uvAttr = 1 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 2);
			MDPrint.FieldByName('GCode'	).AsString	    :=  sCode;
            // 連想
			MDPrint.FieldByName('Renso'	).AsString	    :=  GetFld('m_Renso'	).AsString;
            // 簡略名称
			MDPrint.FieldByName('Nmk'	).AsString	    :=  GetFld('m_Nmk'		).AsString;
            // 正式名称
			MDPrint.FieldByName('Nm'	).AsString	    :=  GetFld('m_Nm'		).AsString;
            // 郵便番号(基番)
            if ( not GetFld('POSTNO1').IsNull      ) and
               ( GetFld('POSTNO1').AsString <> '0' ) then
               MDPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('POSTNO1').AsInteger]);
            // 郵便番号(枝番)
            if ( not GetFld('POSTNO2').IsNull      ) and
               ( GetFld('POSTNO2').AsString <> '0' ) then
                MDPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('POSTNO2').AsInteger]);
			//------------------------------------------------------------------
            // 基本情報
			//------------------------------------------------------------------
            // 住所
			MDPrint.FieldByName('Ads1'	).AsString	    	:=  GetFld('Ads1'		).AsString;
			MDPrint.FieldByName('Ads2'	).AsString	    	:=  GetFld('Ads2'		).AsString;
            // 電話番号1
			MDPrint.FieldByName('Tel1'	).AsString	    	:=  GetFld('Tel1'		).AsString;
            // 電話番号2
			MDPrint.FieldByName('Tel2'	).AsString	    	:=  GetFld('Tel2'		).AsString;
            // FAX1
			MDPrint.FieldByName('FAX1'	).AsString	    	:=  GetFld('FAX1'		).AsString;

            // 送付先部署名
			MDPrint.FieldByName('SectNm').AsString	    	:=  GetFld('SectionName'	).AsString;
            // 担当者名
			MDPrint.FieldByName('TanNm'	).AsString	    	:=  GetFld('TanNm'		).AsString;
            // 敬称
			MDPrint.FieldByName('Keisyo').AsString	    	:=  GetFld('KeisyoKbn'	).AsString;
            // メアド
			MDPrint.FieldByName('Mail'	).AsString	    	:=  GetFld('MailAddress'	).AsString;

			//<112>ST---消費税端数処理区分
			if (CheckModuleLicense(m_pMyAppRecord,FXLicense.DEP_LEA) = True ) and (GetFld('m_SisanHojyoKbn3').AsInteger = 1) then
			begin
				MDPrint.FieldByName('SyozeiHasu').AsString	:=  InttoStr(GetFld('SyozeiHasuKbn'	).AsInteger);
				case GetFld('SyozeiHasuKbn'	).AsInteger	of
					0 :	MDPrint.FieldByName('SyozeiHasuNM').AsString	:=	'切り捨て'  ;
					1 :	MDPrint.FieldByName('SyozeiHasuNM').AsString	:=	'切り上げ'  ;
					2 :	MDPrint.FieldByName('SyozeiHasuNM').AsString	:=	'四捨五入'  ;
				end;
			end
			else
			begin
				MDPrint.FieldByName('SyozeiHasu').AsString		:=	'';
				MDPrint.FieldByName('SyozeiHasuNM').AsString	:=	'';
			end;
			//<112>ED---
            
            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  MjsGetGengou( GetFld('m_StDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString	 := MjsGetGengou( GetFld('m_EnDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_EnDate').AsDateTime );
                 // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                begin
                    MDPrint.FieldByName('UpdDateTM').AsString:= MjsGetGengou(GetFld('m_UpDate').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('m_UpDate').AsDateTime);
                end;
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  FormatDateTime( 'yyyy/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString	 :=	FormatDateTime( 'yyyy/mm/dd', GetFld('m_EnDate').AsDateTime );
                 // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                begin
                    MDPrint.FieldByName('UpdDateTM').AsString:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('m_UpDate').AsDateTime);
                end;
            end;

            MDPrint.Post();
            Next;
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();

end;
//******************************************************************************
//		procedure	:
//		Name		: 華 震名(上海未来)
//		Date		: 2001/03/27
//		Parameter	: なし
//		Return		:
//		History		: 9999/99/99	X.Xxxx
//******************************************************************************
procedure TJNTCRP004009F.fnSetProperty(iKbn: integer; eEdit: TMTxtEdit ;
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
procedure TJNTCRP004009F.fnSetProperty(iKbn: integer; eEdit: TMNumEdit;
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
function TJNTCRP004009F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompoName : string;
    lvErrCod    : Integer;                                  // ｴﾗｰｺｰﾄﾞ

begin

    Result := True;

    lvCompoName := TComponent(Sender).Name;

    //===================================================================
    //取引先コード
    //===================================================================
    with f0CODE do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if uvAttr <> 2 then
            begin
                if f0CODE.InputFlag = False then
                    f0CODE.Zero := True
                else
                    f0CODE.Zero := False;
            end
            else
                f0CODE.Zero := False;

            if Trim(Text) = '' then
            begin
                uvSelSys.MsgDlg(1010,10);                   // 必須入力です。
                SetFocus;
                Result := False;
                Exit;
            end;
            if JNTSelXKanjiCheck(Text) = True then
            begin
                uvSelSys.MsgDlg(1010,20);                   // 入力値に漢字もしくは特殊文字が含まれています。
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
//<CHOUON>Upd St
//                      MjsMessageBoxEx (Self,'登録が異常終了しました。', 'マスタ同期', mjError, mjOk, mjDefOk);
                        MjsMessageBoxEx (Self,'登録が異常終了しました。', 'マスター同期', mjError, mjOk, mjDefOk);
//<CHOUON>Upd Ed
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
    //===================================================================
    //郵便番号１
    //===================================================================
    with f1POSTNO1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //郵便番号２
    //===================================================================
    with f1POSTNO2 do
    begin
        if (lvCompoName = Name) then
        begin
	        fnCallPostExplorer('郵便2',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

   			//ゼロ表示
            if f1POSTNO1.Value <> 0 then
               	f1POSTNO2.Zero := True
            else
               	f1POSTNO2.Zero := False;

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //住所１
    //===================================================================
    with f1ADS1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //住所２
    //===================================================================
    with f1ADS2 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //電話番号１
    //===================================================================
    with f1TEL1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            //漢字のチェック
            if JNTSelXKanjiCheck(Text) = True then
            begin
				uvSelSys.MsgDlg(1010,20);
                SetFocus;
                Result := False;
                exit;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //電話番号２
    //===================================================================
    with f1TEL2 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            //漢字のチェック
            if JNTSelXKanjiCheck(Text) = True then
            begin
				uvSelSys.MsgDlg(1010,20);
                SetFocus;
                Result := False;
                exit;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //ＦＡＸ１
    //===================================================================
    with f1FAX1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            //漢字のチェック
            if JNTSelXKanjiCheck(Text) = True then
            begin
				uvSelSys.MsgDlg(1010,20);
                SetFocus;
                Result := False;
                exit;
            end;
            if AllChkMode = False then Exit;
        end;
    end;

end;
//-----------------------------------------------------------------------------
//  選択文字列を作成する
//-----------------------------------------------------------------------------
procedure TJNTCRP004009F.fnKbnStrSet;
var
    lvStr: TStringList;
    Qry : TFDQuery;

//--------------------------------------------
// [区分名コード]文字列オブジェクトを作成する
//--------------------------------------------
function lfnKbnStrSet(Qry: TFDQuery; TBL, TYP: String; var Str: TStringList):Integer;
var
    lvSelectCount: Integer;

begin

    lvSelectCount := 0;

    //[区分]テーブルよりレコードを取得する
    with Qry do
    begin
        Str.Clear;
        SQL.Clear;
        SQL.Add('select CODE, NM from MKBN ');
        SQL.Add('where (TBL = :pTBL) and (TYPE = :pTYPE) order by CODE');
        ParamByName('pTBL') .AsString  := TBL;
        ParamByName('pTYPE').AsString  := TYP;

        Open;
        while not  EOF  do
        begin
            Inc(lvSelectCount);
            //取得結果を文字列オブジェクトにセットする
            Str.Add(FieldByName('NM').AsString);
            Next;
        end;
        Close;
    end;

    Result := lvSelectCount;

end;



begin
    Qry := TMQuery.Create(Self);											// MQueryの構築

    //文字列オブジェクトを作成する
    try

        if Assigned(Qry) <> True then
        begin
            Exit;
        end;

        MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);						// DBとの接続

        lvStr := TStringList.Create;

        //[敬称区分]を作成する
        lfnKbnStrSet(Qry, 'ALL', '敬称区分',lvStr);
        f1KEISYO.SelectItems := lvStr;

    finally
        lvStr.Free;
        Qry.Close;
        Qry.Free;
    end;


end;	{fnKbnStrSet}
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
function TJNTCRP004009F.fnSousa_Select: Boolean;
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
                if m_cJNTArea.IsModify = True then
            		MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
            end;

            Close;
            //MTOKUIを呼び出す
            SQL.Clear;
            Sql.Add('Select DE.*,m.TemplateKbn,m.SisanHojyoKbn3 from MTOKUI_DEP DE '+
			        'Left Outer Join MTOKUI m On DE.BaseNCode = m.NCode'+
                    ' Where (DE.BaseNCode = :pCODE)'
                    );
            ParamByName('pCODE').asFloat := uvNCODE;
            Open(True);
            if not Eof then
            begin
                f1POSTNO1.value  := GetFld('POSTNO1')    .AsInteger;
                f1POSTNO2.value  := GetFld('POSTNO2')    .AsInteger;
                f1ADS1.Text      := GetFld('ADS1')       .AsString;
                f1ADS2.Text      := GetFld('ADS2')       .AsString;
                f1TEL1.Text      := GetFld('TEL1')       .AsString;
                f1TEL2.Text      := GetFld('TEL2')       .AsString;
                f1FAX1.Text      := GetFld('FAX1')       .AsString;

                f1SOFUB.Text     := GetFld('SectionName').AsString;
                f1TANM.Text      := GetFld('TanNm')      .AsString;
                f1KEISYO.text    := GetFld('KeisyoKbn')  .AsString;
                f1MailAd.text    := GetFld('MailAddress')  .AsString;

                if GetFld('TemplateKbn').asInteger = 1 then
                begin
                    AddPanel.Enabled := False;
                    if uvDispFlg = 0 then
                    begin
//                        f1BRCD.SetFocus;
                    end
                    else
                    begin
                        f0CODE.Enabled := True;
                        f0CODE.SetFocus;
                        BCancel_Sousa.Enabled := True;
                    end;
                end
                else
                begin
                    if uvDispFlg = 0 then
                    begin
//                        f1BRCD.SetFocus;
                    end
                    else
                    begin
                        f0CODE.Enabled := True;
                        f0CODE.SetFocus;
                        BCancel_Sousa.Enabled := True;
                    end;
                end;

				//リース管理のライセンスチェック及びリース取引先区分の採用チェック
				//<112>ST---
				if (CheckModuleLicense(m_pMyAppRecord,FXLicense.DEP_LEA) = True ) and (GetFld('SisanHojyoKbn3').AsInteger = 1) then
				begin
					f1Hasukbn.Enabled:=True;
					f1Hasukbn.Zero:=True;
					f1Hasukbn.Value:=GetFld('SyozeiHasuKbn').AsInteger;
				end
				else
					f1Hasukbn.Enabled:=false;
				//<112>ED---

                uvInsFlg    := False;    //更新
            end
            else
                uvInsFlg    := True ;    //新規

        end;
        Result := True;

        m_EdtSw := False;                       // <111>変更ﾌﾗｸﾞOFF

	finally
		DMQuery.Close ;
		DMQuery.Free ;
	end;
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
function TJNTCRP004009F.fnSousa_Update: Boolean;
var
	DMQuery		:TMQuery;
//-------------------------------------------
//  パラメータをセット
//-------------------------------------------
Procedure lfnParamSet;
begin

    with DMQuery do
    begin
        ParamByName('UpdTantoNCode').AsFloat 	:=  m_TantoNCode;
        ParamByName('PostNo1').asInteger     	:=  f1POSTNO1.AsInteger;
        ParamByName('PostNo2').asInteger     	:=  f1POSTNO2.AsInteger;
        ParamByName('ADS1').asString         	:=  f1ADS1.Text;
        ParamByName('ADS2').asString         	:=  f1ADS2.Text;
        ParamByName('TEL1').asString         	:=  f1TEL1.Text;
        ParamByName('TEL2').asString         	:=  f1TEL2.Text;
        ParamByName('FAX1').asString         	:=  f1FAX1.Text;
        ParamByName('SectionName').asString  	:=  f1SOFUB.Text;
        ParamByName('TanNm').asString        	:=  f1TANM.Text;
        ParamByName('KeisyoKbn').asString    	:=  f1KEISYO.text;
        ParamByName('BaseNCode').AsFloat     	:=  uvNCODE;
        ParamByName('MailAddress').asString  	:=  f1MailAd.Text;
		ParamByName('SyozeiHasuKbn').Asinteger	:=	f1Hasukbn.AsInteger;		//<112>
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

//<113>st
	SessionPractice(C_ST_PROCESS);
	try
//<113>ed

	try

        with DMQuery do
        begin
            Close;
            SQL.Clear;

            if uvInsFlg then
            begin
                SQL.Add('Insert Into MTOKUI_DEP ');
                SQL.Add('(BaseNCode,PostNo1,PostNo2,ADS1,ADS2,TEL1,TEL2,FAX1,SectionName,TanNm,KeisyoKbn,MailAddress,UpdTantoNCode,SyozeiHasuKbn) ');				//<112>SyozeiHasuKbn追加
                SQL.Add('Values ');
                SQL.Add('(:BaseNCode,:PostNo1,:PostNo2,:ADS1,:ADS2,:TEL1,:TEL2,:FAX1,:SectionName,:TanNm,:KeisyoKbn,:MailAddress,:UpdTantoNCode,:SyozeiHasuKbn)');	//<112>SyozeiHasuKbn追加
            end
            else
            begin
                SQL.Add(' Update MTOKUI_DEP SET   '+
                        ' PostNo1   = :PostNo1  , '+
                        ' PostNo2   = :PostNo2  , '+
                        ' ADS1      = :ADS1     , '+
                        ' ADS2      = :ADS2     , '+
                        ' TEL1       = :TEL1      , '+
                        ' TEL2       = :TEL2      , '+
                        ' FAX1       = :FAX1      , '+
                        ' SectionName = :SectionName, '+
                        ' TanNm       = :TanNm,       '+
                        ' KeisyoKbn   = :KeisyoKbn,   '+
                        ' MailAddress = :MailAddress, '+
                        ' UpdTantoNCode = :UpdTantoNCode, '+
						' SyozeiHasuKbn = :SyozeiHasuKbn'+						//<112>SyozeiHasuKbn追加
						' Where  BaseNCode = :BaseNCode');
            end;
            lfnParamSet;
            EXECSQL(true);

            m_EdtSw := False;               //変更ﾌﾗｸﾞOFF
        end;

//↓<Rel>
        // ﾄﾘｶﾞで子取引先ﾚｺｰﾄﾞの_Relが更新されるので、同期ﾌﾟﾛｼｼﾞｬを実行して配信してあげる。
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_DEP) = False ) then
            begin
                Result := False;
                Exit;
            end;

            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,uvNCode,DMQuery) then
            begin
                Result := False;
                Exit;
            end;
        end;
//↑<Rel>

//<113>st
	finally
		SessionPractice(C_ED_PROCESS);
	end;
//<113>ed

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;


end;
//============================================================================
//  コンポーネントの使用可・不可の制御
//============================================================================
Procedure TJNTCRP004009F.fnCompEnabled(pBol:Boolean);
begin
    //<112>
	f1Hasukbn.Enabled:=True;

    // [f1]項目を使用不可にする
    PTop.enabled   := not(pBol);
    PSousa.enabled := pBol;

    BUpdate_Sousa.Enabled := pBol;
    BCancel_Sousa.Enabled := pBol;


end;
//============================================================================
//  コンポーネントのクリア
//============================================================================
Procedure TJNTCRP004009F.fnCompClear;
begin

    JNTSelXClrCtrls(Self, 'f1');

	//<112>
	f1Hasukbn.Zero:=false;
	lblKbnNm.Caption:='';

end;
//-----------------------------------------------------------------------------
// fnPostArrowClick()
//	< 入力ｺﾝﾎﾟｰﾈﾝﾄ ｸﾘｯｸ ｲﾍﾞﾝﾄ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004009F.fnPostArrowClick(Sender: TObject);
begin
    //エクスプローラ表示
    fnCallPostExplorer('郵便1',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

end;
//-----------------------------------------------------------------------------
// fnAdsArrowClick()
//	< 入力ｺﾝﾎﾟｰﾈﾝﾄ ｸﾘｯｸ ｲﾍﾞﾝﾄ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004009F.fnAdsArrowClick(Sender: TObject);
begin
    //エクスプローラ表示
    fnCallPostExplorer('住所',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

end;
//-----------------------------------------------------------------------------
// fnPostArrowClick()
//	< 郵便番号入力のOnArrowClickの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004009F.fnCallPostExplorer(pvKeyWord:String; pvPostEdit1,pvPostEdit2:TMNumEdit; pvAdsEdit1,pvAdsEdit2:TMTxtEdit);
var
	sAdr1  :	String;
	sAdr2  :	String;
	sZip   :	String;
	iZip1  :	Integer;
	iZip2  :	Integer;
	iValue :	Integer;
	s1     :	String;
	s2     :	String;
begin

	if  ( pvKeyWord = '郵便1' ) or      		   	// 郵便番号枝番入力
	    ( pvKeyWord = '郵便2' ) then
	begin
		iZip1 := Trunc(pvPostEdit1.Value);			// 基番 取得
		iZip2 := Trunc(pvPostEdit2.Value);			// 枝番 取得
		sZip  := MjsEditNum(iZip1,'0000',3);				// 基番文字列変換
		sZip  := sZip + '-' + MjsEditNum(iZip2,'0000',4);   // 枝番文字列変換

		sAdr1 := '';
		sAdr2 := '';
	end
	else begin  									// 住所上段入力
		sZip  := '';
		sAdr1 := pvAdsEdit1.Text;					// 住所上段 取得
		sAdr2 := pvAdsEdit2.Text;					// 住所下段 取得
	end;

	if  ( pvKeyWord = '郵便1' ) or      				// 郵便番号枝番入力
	    ( pvKeyWord = '住所' ) then
    begin
    	iValue := fnCMNPostShow(sZip,sAdr1,sAdr2,0);     // 郵便番号辞書Exp 起動
    end
    else begin

        if ( pvAdsEdit1.Text = '' ) and
           ( pvAdsEdit2.Text = '' ) then
    		iValue := fnCMNPostGet(sZip,sAdr1,sAdr2,0)  // 郵便番号から直接検索
        else
            Exit;
    end;

	if iValue = 1 then
	begin
		iZip1 := StrToInt(MjsCopy(sZip,3));				// 基番 取り出し
		iZip2 := StrToInt(Copy(sZip,5,4));				// 枝番 取り出し

    	if  ( pvKeyWord = '郵便1' ) or      		   	// 郵便番号枝番入力
	        ( pvKeyWord = '郵便2' ) then
		begin
			if ((pvAdsEdit1.Text <> '') and (pvAdsEdit1.Text <> sAdr1)) or
			   ((pvAdsEdit2.Text <> '') and (pvAdsEdit2.Text <> sAdr2)) then
			begin
            	iValue := uvSelSys.MsgDlg(1010, 800);
				if iValue <> mrYes then
					Exit;
			end;
		end;

		pvPostEdit1.Value := iZip1;						// 基番 SET
		pvPostEdit2.Value := iZip2;						// 枝番 SET

		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr1)>40 then
		begin
			if not NspSepStr(sAdr1,40,s1,s2)then
				Exit;

			sAdr1:=s1;
			sAdr2:=s2+sAdr2;
		end;
		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr2)>40 then
		begin
			if not NspSepStr(sAdr2,40,s1,s2)then
				Exit;

			sAdr2:=s1;
		end;

		pvAdsEdit1.Text  := sAdr1;						// 住所上段 SET
		pvAdsEdit2.Text  := sAdr2;						// 住所下段 SET

        //次ﾌｨｰﾙﾄﾞへ
        if  ( pvKeyWord = '郵便1' ) or
            ( pvKeyWord = '住所' ) then
	        SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, True);

	end
	else if iValue < 0 then
	begin
		MjsMessageBox(	Self,'郵便番号辞書の呼び出しに失敗しました。', mjError, mjDefOk);
		Exit;
	end;
end;
//-----------------------------------------------------------------------------
//  NspSepStr()	<229>
//      郵便番号辞書からの住所桁数調節
//
//-----------------------------------------------------------------------------
function TJNTCRP004009F.NspSepStr(const sSrc:String;iLen:integer;var sDst1,sDst2:string):boolean;
var
	i,iCopy:integer;
	sRet:String;
	bFlg:boolean;	//True:全角前半/False:他
begin
	sDst1:='';
	sDst2:='';

//Byte比較し分割長以下ならそのまま返す
	if MjsHanLength(sSrc)<=iLen then
	begin
		sDst1:=sSrc;
		Result:=true;
		Exit;
	end;

//文字数分Loopしﾁｪｯｸ後分割

	sRet	:='';
	bFlg	:=False;
	iCopy	:=0;

	for i:=1 to MjsHanlength(sSrc) do
	begin
		if i>iLen then
			break;

		case MjsHanByteType(sSrc,i)of
			//半角
			mbSingleByte:
			begin
				if bFlg then	//全前+半角?
				begin
					Result:=False;
					Exit;
				end;
				sRet	:=sRet+MjsHanCopy(sSrc,i,1);
				iCopy	:=iCopy+1;
			end;
			//全角前半
			mbLeadByte:
			begin
				if bFlg then	//全前+全前?
				begin
					Result:=False;
					Exit;
				end;
				bFlg:=True;
			end;
			//全角後半
			mbTrailByte:
			begin
				if not bFlg then	//(全後or半角)+全後?
				begin
					Result:=False;
					Exit;
				end;
				//2byte分まとめてCopy
				sRet	:=sRet+MjsHanCopy(sSrc,i-1,2);
				bFlg	:=False;
				iCopy	:=iCopy+2;
			end;
		end;
	end;

	//前半
	sDst1:=sRet;
	//後半(残)
	sDst2:=MjsHanCopy(sSrc,iCopy+1,MjsHanLength(sSrc)-iCopy);

	Result:=True;
end;

//-----------------------------------------------------------------------------
//     コード属性・桁数を考慮した表示用コードを生成する
//
// 引数
//     sCode   変換前コード
//
// 戻り値
//     変換後コード
//
//-----------------------------------------------------------------------------
function TJNTCRP004009F.fnGetDspData(sCode: String): String;
var
    lvPara: Double;
    lvStr:  String;
    lvDigit : Integer;
begin
    Result := '';

    lvDigit := 16;

    try
        //文字属性なら
        if uvAttr = 2 then
        begin
            if Length(sCode) > lvDigit then
                Result := Copy(sCode, 1, lvDigit)
            else
                Result := sCode;

            Exit;
        end;

        //数値属性なら
        if (uvAttr = 0) or (uvAttr = 1) then
        begin
            lvPara := JNTSelXStrToFloat(sCode);
            lvStr  := FormatFloat('#', lvPara);

            //前ゼロをつける
            lvStr := JNTSelXLeftAddCh(lvStr, lvDigit, '0');

            Result := lvStr;
            Exit;
        end;

    except
    end;

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
//Function TJNTCRP004009f.fnChkTRCODE:Boolean;
Function TJNTCRP004009f.fnChkTRCODE: Integer;
var
    Qry :TMQuery;
//↓<Rel>
    lvCODE  : String;
	PQe     : TMQuery;                                      // 全社DB用ｸｴﾘ
	Qe      : TMQuery;                                      // 子社DB用ｸｴﾘ
	strNmk  : string;
	nPNCode : Extended;
//↑<Rel>
begin

    fNAME.text := '';

//↓<Rel>
    Result     := 0;

    if f0CODE.text = '' then
        lvCode := ''
    else
        lvCode := fnGetDspData(f0CODE.text);

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
//<CHOUON>Upd St
//                              MjsMessageBoxEx (Self,
//                                                   '自社への関連付けに失敗しました。',
//                                                   'マスタ同期', mjError, mjOk, mjDefOk);
                                MjsMessageBoxEx (Self,
                                                     '自社への関連付けに失敗しました。',
                                                     'マスター同期', mjError, mjOk, mjDefOk);
//<CHOUON>Upd Ed
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
                    ' Where (GCODE = :pCODE) and (RDelKbn = 0)' +
                    '  and ((SisanHojyokbn1 <> 0) or (SisanHojyoKbn2 <> 0) or (SisanHojyoKbn3 <> 0))'	//<112>
                    );
{ <Rel>
            if f0CODE.text = '' then
                ParamByName('pCODE').asString := ''
            else
                ParamByName('pCODE').asString := fnGetDspData(f0CODE.text);
  <Rel>}
            ParamByName('pCODE').asString := lvCode;        // <Rel>

            Open;						                    // ｸｴﾘの開始

            if EOF = False then
            begin
//                Result := True;                           // <Rel>
                Result := 0;                                // <Rel>
                fNAME.text  := FieldByName('NM').asString;
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
function TJNTCRP004009f.fnCancel: Boolean;
begin

    Result := False;

    fnCompClear;
    fnCompEnabled(False);

    MjsSetFocus(Self, 'f0CODE');


end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004009F.ArrowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    CompName:   String;         //
begin

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pMyAppRecord;             //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;             //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;

    if Sender = f0CODE then
    begin
        lvExpSend.MasterKbn     :=  22;                 //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TBarNM        :=  LabTRNM.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TableName     :=  'MTOKUI';
        lvExpSend.TrRootCaption :=  LabTRNM.Caption;
        lvExpSend.WhereStr      :=  ' (RDelKBN = 0) '
                                    + ' and (TemplateKbn = 0)'
                                    + ' and ((SisanHojyokbn1 <> 0) or (SisanHojyoKbn2 <>0) or (SisanHojyoKbn3 <>0))'; //<112>

    end;

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin

        if Sender is TMNumEdit then
        begin
           TMNumEdit(MJSFindCtrl(Self,CompName )).value := StrToFloat(lvExpRecv.GCode);
        	TMLabel(MJSFindCtrl(Self, Copy(TmNumEdit(Sender).Name,1,8) + 'NM')).Caption := lvExpRecv.NMK;
        end
        else if Sender is TMTxtEdit then
        begin
           TMTxtEdit(MJSFindCtrl(Self,CompName )).Text := lvExpRecv.GCode;
        end;

        if Sender = f0CODE then
            f0CODE.InputFlag := False;

        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
		abort;
    end;

end;

//-----------------------------------------------------------------------------
// BChangeClick()   <107>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004009F.BChangeClick(Sender: TObject);
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

// <111>
//**************************************************************************
//	Component	:	入力ﾌｨｰﾙﾄﾞ
//		    			入力ｺﾝﾄﾛｰﾙ共通Changeｲﾍﾞﾝﾄ
//	Event		:	OnChange
//	Name		:	unknown
//**************************************************************************
procedure TJNTCRP004009F.evtOnChange(Sender: TObject);
begin
    if not m_EdtSw then
        m_EdtSw := True;                    // 変更ﾌﾗｸﾞON

end;

//<112>
//**************************************************************************
//	Component	:	消費税端数処理区分
//		    		Changeｲﾍﾞﾝﾄ
//	Event		:	kbnChange
//	Name		:	unknown
//**************************************************************************
procedure TJNTCRP004009F.kbnChange(Sender: TObject);
const
    lvKBNNM : Array[0..2] of String = ('切り捨て','切り上げ','四捨五入');
begin
	if not m_EdtSw then
        m_EdtSw := True;                    // 変更ﾌﾗｸﾞON

	lblKbnNm.caption := '';

	if (f1Hasukbn.Value >=0) and (f1Hasukbn.Value < 3) then
		lblKbnNm.caption :=lvKBNNM[f1Hasukbn.asinteger];

       
end;

//<112>
//**************************************************************************
//	Component	:	消費税端数処理区分
//		    		Exitｲﾍﾞﾝﾄ
//	Event		:	kbnExit
//	Name		:	unknown
//**************************************************************************
procedure TJNTCRP004009F.kbnExit(Sender: TObject);
begin
	if (f1Hasukbn.Value < 0) or (f1Hasukbn.Value > 2) then
	begin
		MessageDlg('入力に誤りがあります', mtWarning, [mbOk], 0);
		MjsSetFocus(Self, 'f1Hasukbn');
	end;
end;

//<113>st
//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name		:	S.Hirama(MJS)
//	Date		:	2008/03/13
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004009F.SessionPractice(iSyori: Integer);
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
//  SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

end;
//<113>ed


end.
