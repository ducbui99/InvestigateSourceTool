//******************************************************************************
//  System      :   新会計システム 支払管理システム
//  Program     :   銀行情報登録（新手数料設定）
//  ProgramID   :   JNTCRP008002
//  Name        :   T.SATOH(GSOL)
//  Create      :   2013/08/01
//  Comment		:
//	History		:	  2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//  <001> 大下(3A)   2014/01/06(MON) 電子記録債権の処理を追加
//  <002> 大下(3A)   2014/01/06(MON) 値変更時のチェック処理を修正（日付エディット）。ファイル出力修正
//  <003> 佐藤(GSOL) 2014/05/19(MON) 新手数料登録画面で、最小支店コードが削除された銀行を選択できなかった点を修正
//
//  <#NGEN>		小室(Admax)		2019/03/16(MON) 新元号対応
//******************************************************************************
unit JNTCRP008002_9u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSKeyDataState,
  MjsDateCtrl,
  JNTCommonu,
  JNTFuncU,
  JNTMasComu,
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, MjsStrCtrl;

type
  TJNTCRP008002_9f = class(TForm)
    DlgPanelMessage: TMPanel;
    DlgLabelMessage: TMLabel;
    DlgButtonOK: TMBitBtn;
    DlgButtonCancel: TMBitBtn;
    SpMSHist: TFDStoredProc;
    MPanelStartYMD: TMPanel;
    MLabel_From: TMLabel;
    MDateStartYMD: TMDateEdit;
    CmnLabelAccountCode: TMLabel;
    NeAllBkCode: TMNumEdit;
    LabelAllBkName: TMLabel;
    LabelStatus: TMLabel;
    CmnPanelInformation01: TMPanel;
    CmnPanelFeeStandard: TMPanel;
    CmnPanelFeeListTitle0101: TMPanel;
    CmnPanelFeeListTitle0102: TMPanel;
    CmnPanelFeeListTitle0103: TMPanel;
    CmnPanelFeeListTitle0104: TMPanel;
    CmnPanelFeeListTitle0105: TMPanel;
    CmnPanelFeeStdColumn01: TMPanel;
    CmnLabelFeeUnit010201: TMLabel;
    CmnLabelFeeUnit010301: TMLabel;
    CmnLabelFeeUnit010102: TMLabel;
    CmnLabelFeeUnit010202: TMLabel;
    CmnLabelFeeUnit010101: TMLabel;
    CmnEditFeeValue010101: TMNumEdit;
    CmnEditFeeValue010201: TMNumEdit;
    CmnEditFeeValue010301: TMNumEdit;
    CmnEditFeeValue010102: TMNumEdit;
    CmnEditFeeValue010202: TMNumEdit;
    CmnPanelFeeStdColumn02: TMPanel;
    CmnLabelFeeUnit010103: TMLabel;
    CmnLabelFeeUnit010203: TMLabel;
    CmnLabelFeeUnit010303: TMLabel;
    CmnEditFeeValue010106: TMNumEdit;
    CmnEditFeeValue010206: TMNumEdit;
    CmnEditFeeValue010306: TMNumEdit;
    CmnPanelFeeStdColumn03: TMPanel;
    CmnLabelFeeUnit010104: TMLabel;
    CmnLabelFeeUnit010204: TMLabel;
    CmnLabelFeeUnit010304: TMLabel;
    CmnEditFeeValue010105: TMNumEdit;
    CmnEditFeeValue010205: TMNumEdit;
    CmnEditFeeValue010305: TMNumEdit;
    CmnPanelFeeStdColumn04: TMPanel;
    CmnLabelFeeUnit010105: TMLabel;
    CmnLabelFeeUnit010205: TMLabel;
    CmnLabelFeeUnit010305: TMLabel;
    CmnEditFeeValue010104: TMNumEdit;
    CmnEditFeeValue010204: TMNumEdit;
    CmnEditFeeValue010304: TMNumEdit;
    CmnPanelFeeStdColumn05: TMPanel;
    CmnLabelFeeUnit010106: TMLabel;
    CmnLabelFeeUnit010206: TMLabel;
    CmnLabelFeeUnit010306: TMLabel;
    CmnEditFeeValue010103: TMNumEdit;
    CmnEditFeeValue010203: TMNumEdit;
    CmnEditFeeValue010303: TMNumEdit;
    CmnPanelFeeFBUse: TMPanel;
    CmnPanelFeeListTitle0201: TMPanel;
    CmnPanelFeeListTitle0202: TMPanel;
    CmnPanelFeeListTitle0203: TMPanel;
    CmnPanelFeeListTitle0204: TMPanel;
    CmnPanelFeeListTitle0205: TMPanel;
    CmnPanelFeeFbuColumn01: TMPanel;
    CmnLabelFeeUnit020101: TMLabel;
    CmnLabelFeeUnit020201: TMLabel;
    CmnLabelFeeUnit020301: TMLabel;
    CmnLabelFeeUnit020102: TMLabel;
    CmnLabelFeeUnit020202: TMLabel;
    CmnEditFeeValue020101: TMNumEdit;
    CmnEditFeeValue020201: TMNumEdit;
    CmnEditFeeValue020301: TMNumEdit;
    CmnEditFeeValue020102: TMNumEdit;
    CmnEditFeeValue020202: TMNumEdit;
    CmnPanelFeeFbuColumn02: TMPanel;
    CmnLabelFeeUnit020103: TMLabel;
    CmnLabelFeeUnit020203: TMLabel;
    CmnLabelFeeUnit020303: TMLabel;
    CmnEditFeeValue020106: TMNumEdit;
    CmnEditFeeValue020206: TMNumEdit;
    CmnEditFeeValue020306: TMNumEdit;
    CmnPanelFeeFbuColumn03: TMPanel;
    CmnLabelFeeUnit020104: TMLabel;
    CmnLabelFeeUnit020204: TMLabel;
    CmnLabelFeeUnit020304: TMLabel;
    CmnEditFeeValue020105: TMNumEdit;
    CmnEditFeeValue020205: TMNumEdit;
    CmnEditFeeValue020305: TMNumEdit;
    CmnPanelFeeFbuColumn04: TMPanel;
    CmnLabelFeeUnit020105: TMLabel;
    CmnLabelFeeUnit020205: TMLabel;
    CmnLabelFeeUnit020305: TMLabel;
    CmnEditFeeValue020104: TMNumEdit;
    CmnEditFeeValue020204: TMNumEdit;
    CmnEditFeeValue020304: TMNumEdit;
    CmnPanelFeeFbuColumn05: TMPanel;
    CmnLabelFeeUnit020106: TMLabel;
    CmnLabelFeeUnit020206: TMLabel;
    CmnLabelFeeUnit020306: TMLabel;
    CmnEditFeeValue020103: TMNumEdit;
    CmnEditFeeValue020203: TMNumEdit;
    CmnEditFeeValue020303: TMNumEdit;
    CmnPanelFeeWindowUse: TMPanel;
    CmnPanelFeeListTitle0301: TMPanel;
    CmnPanelFeeListTitle0302: TMPanel;
    CmnPanelFeeListTitle0303: TMPanel;
    CmnPanelFeeListTitle0304: TMPanel;
    CmnPanelFeeListTitle0305: TMPanel;
    CmnPanelFeeWinColumn01: TMPanel;
    CmnLabelFeeUnit030101: TMLabel;
    CmnLabelFeeUnit030201: TMLabel;
    CmnLabelFeeUnit030301: TMLabel;
    CmnLabelFeeUnit030102: TMLabel;
    CmnLabelFeeUnit030202: TMLabel;
    CmnEditFeeValue030101: TMNumEdit;
    CmnEditFeeValue030201: TMNumEdit;
    CmnEditFeeValue030301: TMNumEdit;
    CmnEditFeeValue030102: TMNumEdit;
    CmnEditFeeValue030202: TMNumEdit;
    CmnPanelFeeWinColumn02: TMPanel;
    CmnLabelFeeUnit030103: TMLabel;
    CmnLabelFeeUnit030203: TMLabel;
    CmnLabelFeeUnit030303: TMLabel;
    CmnEditFeeValue030106: TMNumEdit;
    CmnEditFeeValue030206: TMNumEdit;
    CmnEditFeeValue030306: TMNumEdit;
    CmnPanelFeeWinColumn03: TMPanel;
    CmnLabelFeeUnit030104: TMLabel;
    CmnLabelFeeUnit030204: TMLabel;
    CmnLabelFeeUnit030304: TMLabel;
    CmnEditFeeValue030105: TMNumEdit;
    CmnEditFeeValue030205: TMNumEdit;
    CmnEditFeeValue030305: TMNumEdit;
    CmnPanelFeeWinColumn04: TMPanel;
    CmnLabelFeeUnit030105: TMLabel;
    CmnLabelFeeUnit030205: TMLabel;
    CmnLabelFeeUnit030305: TMLabel;
    CmnEditFeeValue030104: TMNumEdit;
    CmnEditFeeValue030204: TMNumEdit;
    CmnEditFeeValue030304: TMNumEdit;
    CmnPanelFeeWinColumn05: TMPanel;
    CmnLabelFeeUnit030106: TMLabel;
    CmnLabelFeeUnit030206: TMLabel;
    CmnLabelFeeUnit030306: TMLabel;
    CmnEditFeeValue030103: TMNumEdit;
    CmnEditFeeValue030203: TMNumEdit;
    CmnEditFeeValue030303: TMNumEdit;
    DlgButtonEnd: TMBitBtn;
    CmnSaveDialogFileName: TMSaveDialog;
    MPanel2: TMPanel;
    MPanel3: TMPanel;
    MPanel4: TMPanel;
    MPanel5: TMPanel;
    MLabel20: TMLabel;
    CmnEdit01044Densai1: TMNumEdit;
    MPanel6: TMPanel;
    MLabel21: TMLabel;
    CmnEdit01045Densai2: TMNumEdit;
    MLabel22: TMLabel;

	procedure	fnJNTCRP008002_9fOnCreate		(Sender: TObject);
	procedure	fnDlgFunctionOnKeyDown		(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDlgButtonOKOnClick		(Sender: TObject);
	procedure	fnDlgButtonCancelOnClick	(Sender: TObject);
    procedure NeAllBkCodeArrowClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DlgButtonEndClick(Sender: TObject);
    procedure NeAllBkCodeExit(Sender: TObject);
    procedure NeAllBkCodeEnter(Sender: TObject);
    procedure MDateStartYMDExit(Sender: TObject);
    procedure CmnChange(Sender: TObject);
    procedure CmnEditFeeValue010102Exit(Sender: TObject);
    procedure CmnEditFeeValue010202Exit(Sender: TObject);
    procedure CmnEditFeeValue020102Exit(Sender: TObject);
    procedure CmnEditFeeValue020202Exit(Sender: TObject);
    procedure CmnEditFeeValue030102Exit(Sender: TObject);
    procedure CmnEditFeeValue030202Exit(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	: TMDataModulef;
	m_cDBSelect		: TFDConnection;
    m_cComArea		: TJNTMASCom;
	m_bChangeFlg	: Boolean;

	m_arStandardFee	: array of String;
	TantoNCode      : Int64;
	m_DateStartYMD	: TDateTime;														// <002> ADD 適用開始日変更判定用

    procedure SessionPractice(iSyori : Integer);			   							// ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行

	procedure	fnInitializeStandardFeeValue	();
	function	fnUpdateRecordFeeInfo			(): Boolean;

	procedure	fnClearScreenDetailInfo		    (bCodeClear: Boolean = True);
	procedure	fnInitializeScreenDetailInfo	();
	procedure	fnInitializeScreenDetailInfo01	(nBankCode, nClass: Integer);
	procedure	fnSetScreenDetailInformation01	(dqMasterData: TMQuery; nFeeDivision: Integer; nPayDivision: Integer);
	function	fnMakeSQLConstFeeInfoInsert		(nClass: Integer): String;
    procedure	fnFileOut                       ();
// <001> ADD↓
	procedure	fnInitializeScreenDensai		(nBankCode: Integer);
	function	fnUpdateDensai					(dqMasterData: TMQuery): Boolean;
// <001> ADD↑
  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;															// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;															// ｺｰﾄﾞ属性

	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer);

	procedure	CMChildKey						(var Msg: TWMKey); message CM_CHILDKEY;
  end;

var
  JNTCRP008002_9f: TJNTCRP008002_9f;

implementation

var
	_FeeTitle	 : String					= 'CmnPanelFeeListTitle%.2d%.2d';
	_FeeValue	 : String					= 'CmnEditFeeValue%.2d%.2d%.2d';
	_FeeUnit	 : String					= 'CmnLabelFeeUnit%.2d%.2d%.2d';

const
	MASTER_BANK		= 21;																// 銀行

	C_ST_PROCESS			= 0; 														// 設定
    C_ED_PROCESS            = 1;                                                        // 開放

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP008002_9f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer);
begin
	m_pRec			:= pRec;
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		:= cDBSelect;
	m_cComArea		:= TJNTMASCom    (m_pRec^.m_pSystemArea^);

	//m_arStandardFee	:= pStandardFee;
    Pointer(m_arStandardFee)	:= pStandardFee;
	m_bChangeFlg	:= False;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
    begin
        if (Screen.ActiveControl.Name = NeAllBkCode.Name) then
            // フォーカスが全銀協コードの場合は終了と等価
            DlgButtonEndClick(DlgButtonEnd)
        else
            // その他は取り消しと等価
            fnDlgButtonCancelOnClick(DlgButtonEnd);
        Abort ();
    end;

    if (Msg.CharCode = VK_F8) then
    begin
        // ファイル出力
        fnFileOut();
        Abort ();
    end;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);

	if	(Screen.ActiveControl.Name = DlgButtonOK.Name) then								// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DlgButtonCancel.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			CmnEditFeeValue010102.SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnJNTCRP008002_9fOnCreate (Sender: TObject);
begin
	MJSColorChange (TJNTCRP008002_9f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MjsFontResize( TJNTCRP008002_9f(Self), Pointer(m_pRec) );

	SpMSHist.Connection := m_cDBSelect;
    //SpMSHist.SessionName  := m_cDBSelect.SessionName;
	TantoNCode := rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;

	fnInitializeStandardFeeValue ();
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.FormDestroy(Sender: TObject);
begin
//
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnDlgFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
		MJSDispCtrl.MJSNextCtrl (Self)
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MJSPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MJSNextCtrl (Self);
		end
		else
			MJSDispCtrl.MJSNextCtrl (Self);
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnDlgButtonOKOnClick (Sender: TObject);
begin
    if (MDateStartYMD.Value = 0) then
    begin
        // 未入力不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end
//    else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.Value)) then		// <#NGEN>
    else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.AsIntYM)) then		// <#NGEN>
    begin
        // 不正日付不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end;

	// 標準手数料の1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue010102.AsCurrency > CmnEditFeeValue010202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue010202.SetFocus  ();
		abort;
	end;
	// FB用手数料の1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue020102.AsCurrency > CmnEditFeeValue020202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue020202.SetFocus  ();
		abort;
	end;
	// 窓口手数料の1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue030102.AsCurrency > CmnEditFeeValue030202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue030202.SetFocus  ();
		abort;
	end;

	// DB更新
	if	(not fnUpdateRecordFeeInfo ()) then
		Abort ();

	// 更新OKで銀行コードをクリアしてフォーカスを移動
	NeAllBkCode.Value := 0;
	NeAllBkCode.Clear();

    NeAllBkCode.SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnDlgButtonCancelOnClick (Sender: TObject);
begin
    if	(Screen.ActiveControl.Name <> NeAllBkCode.Name) and
		(m_bChangeFlg) then										// 変更された
        if MjsMessageBoxEx(Self, '編集中のデータを取り消します。' + #13#10 + 'よろしいですか？', '取消', mjQuestion, mjYesNo, mjDefNo) <> mrYes then
            Abort;

    NeAllBkCode.SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.DlgButtonEndClick(Sender: TObject);
begin
    if	(Screen.ActiveControl.Name <> NeAllBkCode.Name) and
		(m_bChangeFlg) then										// 変更された
        if MjsMessageBoxEx(Self, '編集中のデータを取り消します。' + #13#10 + 'よろしいですか？', '取消', mjQuestion, mjYesNo, mjDefNo) <> mrYes then
            Abort;

	ModalResult	:= mrCancel;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnInitializeStandardFeeValue ();
var
	dqFeeInfo : TMQuery;

begin
	dqFeeInfo	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqFeeInfo);							// DBとMQueryの接続

	with (dqFeeInfo) do
	begin
        // 適用開始日プロパティ設定
        Close ();
        SQL.Clear ();
        SQL.Add   ('SELECT KStDate, KEdDate, YearKbn FROM DTMAIN');
        Open ();

		if not Eof then
		begin
			MDateStartYMD.HokanFromDate	:= FieldByName('KStDate').AsDateTime;
			MDateStartYMD.HokanToDate	:= FieldByName('KEdDate').AsDateTime;
			MDateStartYMD.HokanFlag		:= true;
	        if (FieldByName('YearKbn').AsInteger = 0) then 	//和暦
    	    begin
    	        MDateStartYMD.DateFormat:= MjsEdits.dfEMD;
        	    MDateStartYMD.Gengou 	:= MjsDateCtrl.MjsGetGengou(FieldByName('KEdDate').AsDateTime, MdtCMP_YM);
    	    end
	        else
        	begin
            	MDateStartYMD.DateFormat:= MjsEdits.dfYMD;
	            MDateStartYMD.Gengou	:= #0;
    	    end;
		end
		else
		begin
           	MDateStartYMD.DateFormat	:= MjsEdits.dfYMD;
            MDateStartYMD.Gengou		:= #0;
		end;
	end;

	dqFeeInfo.Close ();
	dqFeeInfo.Free  ();

    // 画面初期化
	fnClearScreenDetailInfo ();
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Parameter	:   iSyori 0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008002_9f.SessionPractice(iSyori : Integer);
begin
												// 処理区分
	SpMSHist.ParamByName('@pSyoriKbn').AsInteger := iSyori;
			                   					// 履歴取得区分
	SpMSHist.ParamByName('@pMSHistKbn').AsInteger    := 1;
    											// 担当者内部ｺｰﾄﾞ
    SpMSHist.ParamByName('@pTanNCode').AsCurrency    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    											// 担当者名称
    SpMSHist.ParamByName('@pTanSimpleName').AsString := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
    											// ｼｽﾃﾑｺｰﾄﾞ
    SpMSHist.ParamByName('@pSysCode').AsInteger      := m_pRec^.m_iSystemCode;
    											// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SpMSHist.ParamByName('@pOptCode').AsInteger      := m_pRec^.m_iOptionCode;
    											// 処理ｺｰﾄﾞ
    SpMSHist.ParamByName('@pPrgCode').AsInteger      := m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SpMSHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SpMSHist.FetchOptions.Items := SpMSHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SpMSHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SpMSHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.NeAllBkCodeArrowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
begin
    fnJNTExpMakeParam(@lvExpSend);              //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;         //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;   //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    lvExpSend.MasterKbn     := 9111;                    // ﾏｽﾀ区分
    lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
    lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
// <003> MOD-STR
//  lvExpSend.WhereStr      := 'AllBkCode * 1000 + AllBraCode IN (SELECT AllBkCode * 1000 + MIN(AllBraCode) FROM BankInfo GROUP BY AllBkCode) AND RDelKbn = 0';
    lvExpSend.WhereStr      := 'AllBkCode * 1000 + AllBraCode IN (SELECT AllBkCode * 1000 + MIN(AllBraCode) FROM BankInfo WHERE RDelKbn = 0 GROUP BY AllBkCode) AND RDelKbn = 0';
// <003> MOD-STR

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    if fnJNTExpShow(@lvExpSend, @lvExpRecv) <> 1 then   //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then
    begin
        NeAllBkCode.Value := StrToFloat(lvExpRecv.GCode);
        MJSDispCtrl.MJSNextCtrl (Self);
    end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.NeAllBkCodeEnter(Sender: TObject);
begin
	fnClearScreenDetailInfo (False);
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.NeAllBkCodeExit(Sender: TObject);
var
	dqBankInfo : TMQuery;
begin
    if	(Screen.ActiveControl.Name = DlgButtonEnd.Name   ) or	// 終了ボタンとキャンセルボタンはチェック無し
		(Screen.ActiveControl.Name = DlgButtonCancel.Name) then
        Exit;

    if (NeAllBkCode.Value = 0) then
    begin
        Beep;
		NeAllBkCode.SetFocus ();
        Abort;
    end;

    // 銀行コードチェック
    dqBankInfo	:= TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqBankInfo);							// DBとMQueryの接続

    with (dqBankInfo) do
    begin
        Close ();

        SQL.Clear ();
        SQL.Add   ('SELECT BankName');
        SQL.Add   ('  FROM BankInfo B1');
        SQL.Add   (' INNER JOIN (SELECT AllBkCode BkCode, MIN(AllBraCode) MinBraCode FROM BankInfo WHERE RDelKbn = 0 GROUP BY AllBkCode) B2 ON B1.AllBkCode = B2.BkCode AND B1.AllBraCode = B2.MinBraCode');
        SQL.Add   (' WHERE B1.AllBkCode = ' + NeAllBkCode.Text);
        SQL.Add   ('   AND RDelKbn = 0');
        SQL.Add   (' ORDER BY AllBkCode');

        Open ();

        if (not EOF) then
        begin
            LabelAllBkName.Caption := FieldByName ('BankName').AsString;

            fnInitializeScreenDetailInfo ();
        end
        else
        begin
            Beep;
			NeAllBkCode.SetFocus ();
        end;
    end;

    dqBankInfo.Close ();
    dqBankInfo.Free  ();
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnClearScreenDetailInfo (bCodeClear: Boolean = True);
var
	iLoop: Integer;
    ChildControl: TComponent;

begin
    // ヘッダエリアクリア
    if bCodeClear then
        NeAllBkCode.Clear();
    LabelAllBkName.Caption := '';
    MDateStartYMD.Value := 0;
	m_DateStartYMD := MDateStartYMD.AsDateTime;		// <002> ADD 適用開始日変更判定用
    LabelStatus.Caption := '';

    // 手数料エリアクリア
    for iLoop := 0 to Self.ComponentCount -1 do
    begin
        ChildControl := Self.Components[iLoop];

        if (ChildControl is TMNumEdit) and (ChildControl <> NeAllBkCode) then
            TMNumEdit(ChildControl).Value := 0;
    end;

// <001> ADD↓
	// 電子記録債権エリアクリア
	CmnEdit01044Densai1.Value := 0;
	CmnEdit01045Densai2.Value := 0;
// <001> ADD↑

	m_bChangeFlg		:= False;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnInitializeScreenDetailInfo ();
var
	nClass: Integer;

begin
	for	nClass := 21 to 23 do
		fnInitializeScreenDetailInfo01 (Trunc(NeAllBkCode.Value), nClass);

// <001> ADD↓
	// 電子記録債権のデータ読み込み
	fnInitializeScreenDensai(Trunc(NeAllBkCode.Value));
// <001> ADD↑

	m_bChangeFlg		:= False;

    if (LabelStatus.Caption = '') then
    begin
        LabelStatus.Caption := '新規';
        // 新標準手数料読み込み
		fnInitializeScreenDetailInfo01 (0, 21);
    end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnInitializeScreenDetailInfo01 (nBankCode, nClass: Integer);
var
	dqMasterData  : TMQuery;
	arBasedFee	  : array [1..3] of Extended;
	nRow		  : Integer;
	nColumn		  : Integer;

begin
    dqMasterData	:= TMQuery.Create (Self);		   						// MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

    with (dqMasterData) do
    begin
        Close ();

        SQL.Clear ();
        SQL.Add   ('SELECT RecSyubetu, FeeStand1, FeeStand2, Fee11, Fee12, Fee13, ');
        SQL.Add   ('       Fee21, Fee22, Fee23, Fee31, Fee32, Fee33, Fee41, Fee42, Fee43, StartDate ');
        SQL.Add   ('FROM   FeeInfo ');
        SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
        SQL.Add   ('       BankNCode = :strBankCode AND RecSyubetu = :nClass');

        ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
        ParamByName ('strBankCode'    ).AsFloat 	:= nBankCode;
        ParamByName ('nClass'         ).AsInteger	:= nClass;

        Open ();

        if	(not EOF) then
        begin
            if (nBankCode <> 0) then
                LabelStatus.Caption := '修正';  // 修正モード
            fnSetScreenDetailInformation01 (dqMasterData, -1, -1);

            dqMasterData.Close ();
            dqMasterData.Free  ();
            Exit;
        end;
    end;

    dqMasterData.Close ();
    dqMasterData.Free  ();

	arBasedFee [1]	:= 0;
	arBasedFee [2]	:= 10000;
	arBasedFee [3]	:= 30000;

    if (20 < nClass) then
        nClass := nClass - 20;

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 1 to 6 do
		begin
			if	((nRow = 3) and (nColumn = 2)) then
				Continue;

			case (nColumn) of
				1:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow];
				2:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow + 1];
				else	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= 0;
			end;
		end;
	end;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_9f.fnSetScreenDetailInformation01 (dqMasterData: TMQuery;
																	nFeeDivision: Integer; nPayDivision: Integer);
var
	arBasedFee	  : array [1..3] of Extended;
	nClass		  : Integer;
	nRow		  : Integer;
	nColumn		  : Integer;

begin
	with (dqMasterData) do
	begin
		arBasedFee [1]	:= 0;
		arBasedFee [2]	:= FieldByName ('FeeStand1').AsCurrency;
		arBasedFee [3]	:= FieldByName ('FeeStand2').AsCurrency;

		nClass	:= FieldByName ('RecSyubetu').AsInteger;
        if (20 < nClass) then
            nClass := nClass - 20;

        // 適用開始日セット
        if (nClass = 1) then
// <002> MOD↓
//            MDateStartYMD.AsDateTime := MjsDateCtrl.MjsIntToDate(FieldByName ('StartDate').AsInteger, #0);
		begin
			MDateStartYMD.AsDateTime := MjsDateCtrl.MjsIntToDate(FieldByName ('StartDate').AsInteger, #0);
            // 変更判定変数にも値を格納する
			m_DateStartYMD := MDateStartYMD.AsDateTime;
		end;
// <002> MOD↑

		for	nRow := 1 to 3 do
		begin
			for	nColumn := 1 to 6 do
			begin
				if	((nRow = 3) and (nColumn = 2)) then
					Continue;

				case (nColumn) of
					1:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow];
					2:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow + 1];
					else	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:=
															FieldByName ('Fee' + IntToStr (nColumn - 2) + IntToStr (nRow)).AsCurrency;
				end;
			end;
		end;
	end;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_9f.fnUpdateRecordFeeInfo (): Boolean;
var
	dqMasterData: TMQuery;
	nClass		: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始 <001> ADD

    SessionPractice(C_ST_PROCESS);

	with (dqMasterData) do
	begin
		for	nClass := 1 to 3 do
		begin
            Close ();

            SQL.Clear ();
            SQL.Add   (fnMakeSQLConstFeeInfoInsert (nClass));

			if	(not ExecSQL ()) then
			begin
				dqMasterData.Close ();
				dqMasterData.Free  ();
				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄) <001> ADD

				Result  := FALSE;
				Exit;
			end;
		end;
	end;

// <001> ADD↓
	// 電子記録債権のデータ書き込み
	if	(not fnUpdateDensai(dqMasterData)) then
	begin
		dqMasterData.Close ();
		dqMasterData.Free  ();
		m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)

		Result  := FALSE;
		Exit;
	end;
// <001> ADD↑

    SessionPractice(C_ED_PROCESS);

	m_cDataModule.Commit(m_cDBSelect);													// コミット <001> ADD

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_9f.fnMakeSQLConstFeeInfoInsert (nClass: Integer): String;
var
	nColumn	   : Integer;
	nRow	   : Integer;
	strSQLConst: String;

begin
	strSQLConst	:= 'INSERT INTO FeeInfo  (' + 'MasterKbn ,'							// ﾏｽﾀ区分
											+ 'UpdTantoNCode ,'						// 担当者内部コード
											+ 'BankNCode  ,'						// 銀行ｺｰﾄﾞ
											+ 'RecSyubetu,'							// ﾚｺｰﾄﾞ種別
											+ 'FeeStand1 ,'							// 分割基準額1
											+ 'FeeStand2 ,'							// 分割基準額2
											+ 'Fee11     ,'							// 他銀行(電信)1
											+ 'Fee21     ,'							// 他銀行(文書)1
											+ 'Fee31     ,'							// 同銀行他支店1
											+ 'Fee41     ,'							// 同銀行同支店1
											+ 'Fee12     ,'							// 他銀行(電信)2
											+ 'Fee22     ,'							// 他銀行(文書)2
											+ 'Fee32     ,'							// 同銀行他支店2
											+ 'Fee42     ,'							// 同銀行同支店2
											+ 'Fee13     ,'							// 他銀行(電信)3
											+ 'Fee23     ,'							// 他銀行(文書)3
											+ 'Fee33     ,'							// 同銀行他支店3
											+ 'Fee43     ,' 						// 同銀行同支店3
                                            + 'StartDate  ';                        // 適用開始日

	strSQLConst	:= strSQLConst + ') ON EXISTING UPDATE VALUES ('
							   + Format ('%d,', [MASTER_BANK         ])				// ﾏｽﾀ区分
							   + Format ('%d,', [TantoNCode          ])			    // 担当者内部コード
							   + Format ('%g,', [NeAllBkCode.Value   ])   		    // 銀行ｺｰﾄﾞ
							   + Format ('%d,', [nClass + 20         ])				// ﾚｺｰﾄﾞ種別

	+ Format ('%d,', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 1, 2]))).Value)])
	+ Format ('%d ', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 2, 2]))).Value)]);

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 3 to 6 do
			strSQLConst	:= strSQLConst + Format (',%d', [Trunc (TMNumEdit (
								   		MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value)]);
	end;

  	strSQLConst	:= strSQLConst + ', ' + IntToStr(MjsDateCtrl.MjsDateToInt8(MDateStartYMD.AsDateTime));

	Result	:= strSQLConst + ')';
end;

// <001> ADD↓
//***********************************************************************************************************/
//*		Proccess	:	電子記録債権データ読み込み
//*		Name		:	T.Ooshita(3A)
//*		Date		:	2014/01/06
//*		Parameter	:	nBankCode : 全銀協ｺｰﾄﾞ
//*		Return		:	なし
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.fnInitializeScreenDensai(nBankCode: Integer);
var
	dqMasterData  : TMQuery;

begin
	dqMasterData := TMQuery.Create (Self);						// MQueryの構築
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT Fee11, Fee41 ');
		SQL.Add   ('FROM   FeeInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       BankNCode = :strBankCode AND RecSyubetu = :nClass');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strBankCode'    ).AsFloat 	:= nBankCode;
		ParamByName ('nClass'         ).AsInteger	:= 31;

		Open ();

		if	(not EOF) then
		begin
			CmnEdit01044Densai1.Value := FieldByName ('Fee41').AsCurrency;
			CmnEdit01045Densai2.Value := FieldByName ('Fee11').AsCurrency;
		end
		else
		begin
			CmnEdit01044Densai1.Value := 0;
			CmnEdit01045Densai2.Value := 0;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;

//***********************************************************************************************************/
//*		Proccess	:	電子記録債権データ書き込み
//*		Name		:	T.Ooshita(3A)
//*		Date		:	2014/01/06
//*		Parameter	:	dqMasterData : DBに接続済のMQuery
//*		Return		:	なし
//***********************************************************************************************************/
function TJNTCRP008002_9f.fnUpdateDensai(dqMasterData: TMQuery): Boolean;
begin
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('INSERT INTO FeeInfo  ('								+
									'MasterKbn,'						+	// ﾏｽﾀ区分
									'BankNCode,'						+	// 銀行ｺｰﾄﾞ
									'RecSyubetu,'						+	// ﾚｺｰﾄﾞ種別
									'Fee11,' 							+	// 他銀行(電信)1
									'Fee41,'							+	// 同銀行同支店1
									'UpdTantoNCode ,'					+	// 担当者内部コード
									'StartDate'							+	// 適用開始日
				   ') ON EXISTING UPDATE VALUES ('						+
				   Format ('%d,', [MASTER_BANK         ])				+	// ﾏｽﾀ区分
				   Format ('%g,', [NeAllBkCode.Value   ])				+	// 銀行ｺｰﾄﾞ
				   '31,'												+	// ﾚｺｰﾄﾞ種別
				   Format ('%d,', [Trunc(CmnEdit01045Densai2.Value)])	+	// 他銀行
				   Format ('%d,', [Trunc(CmnEdit01044Densai1.Value)])	+	// 関係銀行
				   Format ('%d,', [TantoNCode          ])				+	// 担当者内部コード
				   IntToStr(MjsDateCtrl.MjsDateToInt8(MDateStartYMD.AsDateTime)) +	// 適用開始日
                   ')');

		if	(not ExecSQL ()) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result  := FALSE;
			Exit;
		end;
	end;

	Result	:= TRUE;											// 正常終了
end;
// <001> ADD↑

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.MDateStartYMDExit(Sender: TObject);
begin
//    if (MDateStartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.Value)) then		// <#NGEN>
    if (MDateStartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.AsIntYM)) then		// <#NGEN>
    begin
        // 不正日付不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end;

// <002> ADD↓
	// 日付が変わっていたら、変更フラグを立てる
	if (m_DateStartYMD <> MDateStartYMD.AsDateTime) then
		// 項目が変更された
		m_bChangeFlg := True;
// <002> ADD↑
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.fnFileOut();
var
    sFileName       : String;
	dqMasterData    : TMQuery;
	FileStream		: TFileStream;
	WriteStringData	: ^String;
	sFindFile		: TSearchRec;
	iAttr			: Integer;
	iRet			: Integer;
begin
	CmnSaveDialogFileName.InitialDir:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\TMP';
	CmnSaveDialogFileName.Filter	:= 'ﾌｧｲﾙ名称 (*.*)|*.*';
	CmnSaveDialogFileName.Options	:= [ofNochangeDir];
// <002> MOD↓
//	CmnSaveDialogFileName.DefaultExt:= '.csv';
	CmnSaveDialogFileName.DefaultExt:= 'csv';
// <002> MOD↑

	if	(CmnSaveDialogFileName.Execute ()) then
    begin
		sFileName	:= CmnSaveDialogFileName.FileName;

		try
			iAttr := Sysutils.faAnyFile;
			iRet  := FindFirst(sFileName, iAttr, sFindFile);
			if iRet = 0 then
			begin
				try
					case MjsMessageBoxEx(Self, '同一ファイルが存在します。上書きしてもよろしいですか？',
										'新手数料登録', mjQuestion, mjYesNo, mjDefYes ) of
						mrYes 	 : iRet	:= 0;
						mrNo  	 : iRet	:= 1;
					end;
					if	iRet = 1 then
						exit;
				finally
					FindClose(sFindFile);
				end;
			end;
		except
			MjsMessageBoxEx(Self, sFileName + 'の検索に失敗しました。',
						    '新手数料登録',mjError, mjOK, mjDefOk);
			Abort;
		end;

        dqMasterData	:= TMQuery.Create (Self);

        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

        with (dqMasterData) do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT F.*, B.AllBkCode, B.BankName FROM FeeInfo F');
            SQL.Add   ('  LEFT JOIN (SELECT NCode, AllBkCode, BankName' +
                                    '  FROM BankInfo B1' +
                                    ' INNER JOIN (SELECT AllBkCode BkCode, MIN(AllBraCode) MinBraCode FROM BankInfo WHERE RDelKbn = 0 GROUP BY AllBkCode) B2' +
                                    '    ON B1.AllBkCode = B2.BkCode'+
                                    '   AND B1.AllBraCode = B2.MinBraCode) B' +
// <002> MOD↓
// 新手数料登録のF.BankNCodeは、銀行内部コードではなく銀行コードなので修正
//                          ' ON F.BankNCode = B.NCode');
							' ON F.BankNCode = B.AllBkCode');
// <002> MOD↑
            SQL.Add   (' WHERE MasterKbn = ' + IntToStr(MASTER_BANK));
// <001> MOD↓
// 電子記録債権を追加
//            SQL.Add   ('   AND RecSyubetu BETWEEN 21 AND 23');
			SQL.Add   ('   AND RecSyubetu IN(21, 22, 23, 31)');
// <001> MOD↑
            SQL.Add   ('   AND RDelKbn = 0');
            SQL.Add   (' ORDER BY B.AllBkCode, RecSyubetu');

            Open ();

            if (EOF) then
            begin
                MjsMessageBoxEX(Self, '対象データがありません。', '確認', mjInformation, mjOk, mjDefNo);
                dqMasterData.Close ();
                dqMasterData.Free  ();
                Exit;
            end
            else
            begin
                // ファイル出力
                WriteStringData	:= nil;
                New( WriteStringData );
                FileStream	:= TFileStream.Create(sFileName, (fmCreate or fmOpenWrite) );

// <001> MOD↓
// 電子記録債権用のカラムを追加
//                WriteStringData^ := '銀行コード,銀行名,種別,適用開始日,分割基準額１,分割基準額２,他銀行（電信）１,他銀行（電信）２,他銀行（電信）３,他銀行（文書）１,他銀行（文書）２,他銀行（文書）３,同銀行他支店１,同銀行他支店２,同銀行他支店３,同銀行同支店１,同銀行同支店２,同銀行同支店３' + #13#10;
				WriteStringData^ := '銀行コード,銀行名,種別,適用開始日,分割基準額１,分割基準額２,他銀行（電信）１,他銀行（電信）２,他銀行（電信）３,他銀行（文書）１,他銀行（文書）２,他銀行（文書）３,同銀行他支店１,同銀行他支店２,同銀行他支店３,同銀行同支店１,同銀行同支店２,同銀行同支店３';
				WriteStringData^ := WriteStringData^ + ',他行,同行' + #13#10;
// <001> MOD↑
                FileStream.Write(PAnsiChar(AnsiString(WriteStringData^))^, MjsHanLength(WriteStringData^));

                while not Eof do
                begin
                    if (FieldbyName('AllBkCode').AsInteger = 0) then
                        WriteStringData^ := ',新標準手数料'
                    else
                        WriteStringData^ := FieldbyName('AllBkCode').AsString + ',' + FieldbyName('BankName').AsString;

// <001> ADD↓
					if ((FieldbyName('RecSyubetu').AsInteger >= 21) and
                    	(FieldbyName('RecSyubetu').AsInteger <= 23)) Then
					begin
// <001> ADD↑	以下インデントを右にずらす

						case FieldbyName('RecSyubetu').AsInteger of
							21:WriteStringData^ := WriteStringData^ + ',標準手数料';
							22:WriteStringData^ := WriteStringData^ + ',FB用手数料';
							23:WriteStringData^ := WriteStringData^ + ',窓口用手数料';
						end;

	                    WriteStringData^ := WriteStringData^ + ',' +
	                                        FormatFloat('0000/00/00', FieldbyName('StartDate').AsInteger) + ',' +
	                                        FieldbyName('FeeStand1').AsString + ',' +
	                                        FieldbyName('FeeStand2').AsString + ',' +
	                                        FieldbyName('Fee11').AsString + ',' +
	                                        FieldbyName('Fee12').AsString + ',' +
	                                        FieldbyName('Fee13').AsString + ',' +
	                                        FieldbyName('Fee21').AsString + ',' +
	                                        FieldbyName('Fee22').AsString + ',' +
	                                        FieldbyName('Fee23').AsString + ',' +
	                                        FieldbyName('Fee31').AsString + ',' +
	                                        FieldbyName('Fee32').AsString + ',' +
	                                        FieldbyName('Fee33').AsString + ',' +
	                                        FieldbyName('Fee41').AsString + ',' +
	                                        FieldbyName('Fee42').AsString + ',' +
// <001> MOD↓
//                                        FieldbyName('Fee43').AsString + #13#10;
											FieldbyName('Fee43').AsString + ',,' + #13#10;	// 他行、同行のカンマを追加
					end
					else
					begin
						WriteStringData^ := WriteStringData^ + ',電子債権手数料,' +
											FormatFloat('0000/00/00', FieldbyName('StartDate').AsInteger) +	// 適用開始日
                                            ',,,,,,,,,,,,,,,' +												// 分割基準額１～同銀行同支店３は空で出力
	                                        FieldbyName('Fee11').AsString + ',' +							// 他行
											FieldbyName('Fee41').AsString + #13#10;							// 同行
					end;
// <001> MOD↑

                    FileStream.Write(PAnsiChar(AnsiString(WriteStringData^))^, MjsHanLength(WriteStringData^));
                    Next;
                end;

            	Dispose(WriteStringData);
	            FileStream.Free( );
            end;
        end;

        dqMasterData.Close ();
        dqMasterData.Free  ();
    end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnChange(Sender: TObject);
begin
	// 項目が変更された
	m_bChangeFlg := True;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue010102Exit(Sender: TObject);
begin
	CmnEditFeeValue010201.Value := CmnEditFeeValue010102.AsCurrency;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue010202Exit(Sender: TObject);
begin
	// 1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue010102.AsCurrency > CmnEditFeeValue010202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue010202.SetFocus();
		abort;
	end;

	CmnEditFeeValue010301.Value := CmnEditFeeValue010202.AsCurrency;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue020102Exit(Sender: TObject);
begin
	CmnEditFeeValue020201.Value := CmnEditFeeValue020102.AsCurrency;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue020202Exit(Sender: TObject);
begin
	// 1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue020102.AsCurrency > CmnEditFeeValue020202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue020202.SetFocus();
		abort;
	end;
	CmnEditFeeValue020301.Value := CmnEditFeeValue020202.AsCurrency;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue030102Exit(Sender: TObject);
begin
	CmnEditFeeValue030201.Value := CmnEditFeeValue030102.AsCurrency;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP008002_9f.CmnEditFeeValue030202Exit(Sender: TObject);
begin
	// 1段目の入力金額と比較し、１段目が大きい場合エラー
	if CmnEditFeeValue030102.AsCurrency > CmnEditFeeValue030202.AsCurrency then
	begin
		beep;
        CmnEditFeeValue030202.SetFocus();
		abort;
	end;
	CmnEditFeeValue030301.Value := CmnEditFeeValue030202.AsCurrency;

end;

end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

