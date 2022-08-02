//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目情報 勘定科目
//                    他科目内容コピー選択ダイアログ
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：高橋 功二(LEAD)
//      作成日      ：2005.01.25(TUE)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <001>   茂木 勇次(LEAD) 2005.03.11(FRI) FX対応(ｽｷｰﾏ・内部ｺｰﾄﾞ対応）
//  <002>   茂木 勇次(LEAD) 2005.07.15(FRI) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <003>   茂木 勇次(LEAD) 2005.09.17(SAT) 検索ｴｸｽﾌﾟﾛｰﾗ機能の追加。
//  <004>   小柴 尚子(MJS)  2006.06.28(THU) 科目桁数を６桁⇒８桁に修正。（画面のみ修正）
//	<005>	黒田 祐生		2012.02.13(MON) ShiftState対応
//	<006>	黒田 祐生		2013.10.04(FRI) 分類を追加
//=============================================================================
unit JNTCRP009001_D1u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, Db, FireDAC.Comp.Client, IniFiles, FileCtrl, VCL.ExtCtrls, Buttons,

  MJSEdits, MJSLabel, MJSBitBtn, MJSGroupBox, MJSPanel, MJSComboBox, MJSQuery,
  MJSCheckBox, MJSRadioButton,

  MjsCommonu, MjsDBModuleu, MjsMsgStdu, MJSDispCtrl, MetaSpt,
  JNTMasComu, JNTMasWndIFu, JNTFuncU{<003>}
  ,MJSKeyDataState	// <005>ADD
  ;

type
{$include JNTMASWND_ColorDef.inc}
{$include JNTCRP009001.inc}

	CopyInfo = record
		MasterKbn   :   Integer;
		UseKbn		:   Integer;
		JHojyoName	:   String;
		CodeDigit	:   Integer;
		CodeAttr	:   Integer;
	end;

	TerminalRec = record
		Name	    :	String;
		Flag	    :	Boolean;
	end;

  TJNTCRP009001_D1f = class(TForm)
    P_Panel		:	TMPanel;
    LCopyTitle: TMLabel;
    ECopyCode: TMNumEdit;
    LCopyName: TMLabel;
    BOK: TMBitBtn;
    BCancel: TMBitBtn;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    MGroupBox1: TMGroupBox;
    Check_Rensou: TMCheckBox;
    Check_Kisyu: TMCheckBox;
    Check_Kari: TMCheckBox;
    Check_Kashi: TMCheckBox;
    Check_Inp: TMCheckBox;
    Check_Out: TMCheckBox;
    Check_Hiritsu: TMCheckBox;
    Check_Seizan: TMCheckBox;
    Check_Seikaku: TMCheckBox;
    Check_Bunseki: TMCheckBox;
    Check_SimpleName: TMCheckBox;
    Check_LongName: TMCheckBox;
    PanelCopyChoice: TMPanel;
    Radio_All: TMRadioButton;
    Radio_Choice: TMRadioButton;
    MLabel3: TMLabel;
    Check_Bunrui: TMCheckBox;

	procedure   CMChildKey              (var Msg: TWMKey); message CM_CHILDKEY;
    procedure   ECopyCodeArrowClick     (Sender: TObject);
    procedure   ECopyCodeExit           (Sender: TObject);
    procedure   Radio_Click             (Sender: TObject);
    procedure   BOKClick                (Sender: TObject);
    procedure   BCancelClick            (Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private 宣言 }
	MjsMsgRec 		:   TMjsMsgRec;
	m_DlgCopyInfo	:	^DLGCopyInfoRec;	// ﾀﾞｲｱﾛｸﾞｺﾋﾟｰ情報
	m_iChoice		:	Integer;			// 実在/合計区分
	m_iBPKbn		:	Integer;			// BS/PL区分
	m_Check			:	Boolean;			// ｺﾋﾟｰ内容の再表示に使用(全て/選択の切り分け)
	m_Terminal		:	TerminalRec;
    m_ExpOpenSW     :   Boolean;            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)<003>

	procedure   fnChoiceEnable          (Enable: Boolean);
	procedure   fnDLGCopyInfoSet        ();
	procedure   fnGetTerminalName       ();

	function    fnGetName               (Code: Integer; var SimpName: String): Boolean;
	function    fnCodeDefaultDsp        (): Integer;
	function    fnIniFileLoad           (): Boolean;
	function    fnIniSave               (): Boolean;

  public
    { Public 宣言 }
	MDataModule		:	TMDataModulef;
	dbCorp_Select	:	TFDConnection;
	pComArea		:	^TMjsAppRecord;
	ComArea			:	TJNTMASCom;
    AOwner          :   TComponent; // <002>

	function    fnCopyDLG               (Owner: TComponent; Choice, BsPlKbn: Integer;
                                         m_pRec, pDlgCopyInfo: Pointer): Integer;   // <002>

  end;

implementation

{$R *.DFM}

//**************************************************************************
//	Proccess  	:  	アプリケーションからのパラメータセット
//	Name	  	:  	H.Endo（企業ｼｽﾃﾑ企画設計）
//	Date		:  	2001/08/23
//	Parameter  	:	Choice				:	実在(0)/合計(1)
//					BsPlKbn				:	BS/PL区分
//					m_pRec				:	TMjsAppRecordのﾎﾟﾝﾀ
//					pDlgCopyInfo		:	ﾀﾞｲｱﾛｸﾞｺﾋﾟｰ情報ほﾎﾟｲﾝﾀ
//	Retrun	  	:	正常（１）／ｷｬﾝｾﾙ（２）
//	History	　	:
//**************************************************************************
function TJNTCRP009001_D1f.fnCopyDLG(Owner:TComponent; Choice,BsPlKbn: Integer; m_pRec,pDlgCopyInfo: pointer):Integer; // <002>
var
	iReturn	:	Integer;
	sName	:	String;
begin

	pComArea	:=	m_pRec;
	ComArea		:=	TJNTMASCom( pComArea^.m_pSystemArea^ );
    AOwner      :=  Owner;  // <002>

	//	ｼｽﾃﾑｶﾗｰとｱｸｾﾝﾄｶﾗｰをｾｯﾄされた色に変更
	MjsColorChange(
			TJNTCRP009001_D1f ( Self ),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(pComArea^.m_pCommonArea^).SysFocusColor
				);

	//	ﾌｫﾝﾄを、ﾕｰｻﾞｰｶｽﾀﾏｲｽﾞされたﾌｫﾝﾄに変更
	MjsFontResize(TJNTCRP009001_D1f(Self),Pointer(m_pRec));

	m_DlgCopyInfo := pDlgCopyInfo;

	//	実在/合計
	m_iChoice := Choice;
	//	BS/PL区分
	m_iBPKbn  := BsPlKbn;

	m_Check := False;							//HIS0001

	fnGetTerminalName();						//HIS0002

	if ( fnIniFileLoad() = False ) then				//HIS0001
	begin
		//	科目の最小ｺｰﾄﾞをﾃﾞﾌｫﾙﾄ表示処理
		ECopyCode.Value := fnCodeDefaultDsp;
    end;
	fnGetName(Trunc(ECopyCode.Value),sName);
	LCopyName.Caption := sName;

	//	選択内容を使用不可
	fnChoiceEnable(m_Check);	//	HIS0001(引数を｢False｣から変数に変更)

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化<003>
    m_ExpOpenSW := FALSE;
    if ( fnJNTExpInit( Self, pComArea ) = 0 ) then
        m_ExpOpenSW :=  TRUE
    else
		MjsMessageBox(AOwner,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10 // <005>
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);

	iReturn := ShowModal;

	if ( iReturn = IDOK )then
		fnDLGCopyInfoSet();

	Result := iReturn;

end;

//************************************************************************
//*     Component       :   CMChildKey
//*
//*     Event           :
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin

	sShift		:=	MJSKeyDataToShiftState(Msg.KeyData);   	// Shiftｷｰの取得 <005>MOD
	twAcCtrl	:=	Screen.ActiveControl;

	//	ｺｰﾄﾞにﾌｫｰｶｽがある時かつALTが押されている時
	if ( twAcCtrl.Name = ECopyCode.Name ) and ( GetKeyState(VK_MENU) < 0 ) then
		Exit;

	//	ESCAPE処理
	if ( Msg.CharCode = VK_ESCAPE ) then
	begin
		ModalResult := IDCANCEL;
		Abort;
    end;

	// End処理
	if (( Msg.CharCode=VK_END ) and ( sShift=[] )) then
	begin
		MjsSetFocus(Self, BOK.Name);
		Abort;
	end;

	if ( twAcCtrl is TMBitBtn ) then
	begin
		// Enter処理
		if (( Msg.CharCode=VK_RETURN ) and ( sShift=[] )) then
		begin
			if ( twAcCtrl = BOK ) then		//	OKﾎﾞﾀﾝ
				BOkClick(twAcCtrl);
			if ( twAcCtrl = BCancel ) then	//	ｷｬﾝｾﾙﾎﾞﾀﾝ
				BCancelClick(twAcCtrl);
			Abort;
		end;
	end;

	//	TAB,Enter処理
	if (( Msg.CharCode = VK_TAB ) and ( sShift = [] )) or
	   (( Msg.CharCode = VK_RETURN ) and ( sShift = [] )) then
	begin
		MjsNextCtrl(Self);
		Abort;
	end;

	//	ENTER処理
	if ( Msg.CharCode = VK_RETURN ) then
	begin
		if ( twAcCtrl.Name <> BOK.Name ) or ( twAcCtrl.Name <> BCancel.Name ) then
			MjsDispCtrl.MjsNextCtrl(Self)
	end;

	//	→,↓処理
	if (( Msg.CharCode = VK_RIGHT ) and ( sShift = [] )) or
       (( Msg.CharCode = VK_DOWN ) and ( sShift = [] )) then
	begin
		if ( twAcCtrl is TMRadioButton ) then		//	ﾗｼﾞｵﾎﾞﾀﾝの時は左右の移動
			Exit;
		MjsNextCtrl(Self);
		Abort;
	end;

	//	↑,←処理
	if (( Msg.CharCode = VK_UP ) and ( sShift = [] )) or
       (( Msg.CharCode = VK_LEFT ) and ( sShift = [] )) then
	begin
		if ( twAcCtrl is TMRadioButton ) then		//	ﾗｼﾞｵﾎﾞﾀﾝの時は左右の移動
			Exit;
		MjsPrevCtrl(Self);
		Abort;
	end;

	inherited;

end;

//************************************************************************
//*     Component       :   ECopyCode ( TMNumEdit ) <003>
//*							検索エクスプローラを呼び出す(開始)
//*     Event           :   OnArrowClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.ECopyCodeArrowClick(Sender: TObject);
var
    lvExpSend   :   rcJNTExpSend;   // 親BPL送信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    lvExpRecv   :   rcJNTExpRecv;   // 親BPL受信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    iExpRtn     :   Integer;        // 戻り値
    sSQL        :   String;
begin

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam( @lvExpSend );
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  pComArea;                           // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;                     // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;       //
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;       //


    lvExpSend.MasterKbn     :=  1;                  // ﾏｽﾀ区分
    lvExpSend.ModulKbn      :=  0;                  // ﾓｼﾞｭｰﾙ区分(共通=0)
    lvExpSend.PatternNo     :=  1;                  // ﾊﾟﾀｰﾝNo.
    lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';     // ﾂｰﾙﾊﾞｰｷｬﾌﾟｼｮﾝ
    lvExpSend.TableName     :=  '';                 // ﾃｰﾌﾞﾙ名

    // Where句の条件作成
	sSQL    :=  ' MasterKbn = 1 AND RDelKbn = 0 AND ';
	sSQL    :=	sSQL + 'BPKbn  = ' + IntToStr(m_iBPKbn) + ' AND ';	//	BS/PL区分
	sSQL    :=  sSQL + 'SumKbn = ' + IntToStr(m_iChoice);			//	実在/合計区分

    lvExpSend.WhereStr      :=  sSQL;
    lvExpSend.SortStr       :=  '';
    lvExpSend.TrRootCaption :=  '';

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin
        ECopyCode.Value     :=  StrToFloat(lvExpRecv.GCode);
        LCopyName.Caption   :=  lvExpRecv.NMK;

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
		Abort;
    end;
    
end;

//************************************************************************
//*     Component       :   EStartExit ( TMNumEdit )
//*
//*     Event           :   OnExit
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.ECopyCodeExit(Sender: TObject);
var
	sName	:	String;
	iGCode	:	Integer;
begin
	//	初期処理
	sName := '';

	if Trunc(ECopyCode.Value) <> 0 then
    begin
		if ( fnGetName(Trunc(ECopyCode.Value),sName) ) then
			LCopyName.Caption := sName
		else
			ECopyCode.SetFocus;
	end
	//	空ENTER時最小のｺｰﾄﾞ・名称表示
	else
	begin
		iGCode := fnCodeDefaultDsp;
		if ( iGCode <> 0 ) then
		begin
			fnGetName(iGCode,sName);
			ECopyCode.Value	  := iGCode;
			LCopyName.Caption := sName;
		end;
	end;

end;

//**********************************************************************
//*		Proccess	:	名称取得
//*		Name		:	H.Endo
//*		Date		:	2000/10/23
//*		Parameter	:	Code		:	入力されたｺｰﾄﾞ
//*					:	Name		:	名称
//*		Return		:	ﾚｺｰﾄﾞがあるかないか(TRUE/FALSE)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP009001_D1f.fnGetName(Code: Integer; var SimpName: String): Boolean;
var
	DmqData		:	TMQuery;
	iName		:	String;
begin
	Result := False;

	//	初期化
	iName	:=	'';

	DmqData := TMQuery.Create( Self );					        //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );		//	DBとMQueryの接続

	with DmqData do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT                     ');
		SQL.Add('    SimpleName             ');	//	簡略名称
// <001>		SQL.Add('FROM KmkMA                 '); //	勘定科目基本ﾏｽﾀ
        SQL.Add('FROM KmkMA                 '); //	勘定科目基本ﾏｽﾀ <001>
		SQL.Add('WHERE MasterKbn = 1        '); //	ﾏｽﾀ区分(1:勘定科目)
		SQL.Add('  AND SumKbn    = :SumKbn  ');	//	実在/合計区分
// <001>		SQL.Add('  AND RecordKbn = 0        ');	//	ﾚｺｰﾄﾞ区分(0:正規ﾚｺｰﾄﾞ)
        SQL.Add('  AND RDelKbn   = 0        ');	//	ﾚｺｰﾄﾞ区分(0:正規ﾚｺｰﾄﾞ)  <001>
		SQL.Add('  AND GCode     = :Code    ');	//	外部ｺｰﾄﾞ
		SQL.Add('  AND SubCode   = 0        ');	//	科目別補助ｺｰﾄﾞ
		SQL.Add('  AND BPKbn     = :BsPlKbn ');	//	BS/PL区分

		ParamByName('SumKbn')   .AsInteger :=	m_iChoice;	//	実在/合計区分
		ParamByName('Code')     .AsInteger :=	Code;		//	外部ｺｰﾄﾞ
		ParamByName('BsPlKbn')  .AsInteger :=	m_iBPKbn;	//	BS/PL区分

		//	ｴﾗｰの判定
		if ( Open = False ) then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqData );
			MjsMessageBoxEx(AOwner, // <002>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
			Close;
			Free;
			Exit;
		end;

		if ( EOF <> True ) then
		begin
			SimpName := GetFLD('SimpleName').AsString;
			Result	 := True;
		end;
    end;

	DmqData.Close;
	DmqData.Free;

end;

//**********************************************************************
//*		Proccess	:	ｺｰﾄﾞの最小値Default表示処理
//*		Name		:	H.Endo
//*		Date		:	2001/08/23
//*		Parameter	:	なし
//*		Return		:	最小ｺｰﾄﾞ
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP009001_D1f.fnCodeDefaultDsp():Integer;
var
	DmqData		:	TMQuery;
begin

	Result := 0;

	DmqData := TMQuery.Create( Self );					        //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );		//	DBとMQueryの接続

	with DmqData do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT                     ');
		SQL.Add('    MIN(GCode)             ');	//	外部ｺｰﾄﾞの最小値
// <001>		SQL.Add('FROM KmkMA                 '); 	//	勘定科目基本ﾏｽﾀ
        SQL.Add('FROM KmkMA                 '); 	//	勘定科目基本ﾏｽﾀ
		SQL.Add('WHERE MasterKbn = 1        ');//	ﾏｽﾀ区分(1:勘定科目)
		SQL.Add('  AND SumKbn    = :SumKbn  ');	//	実在/合計区分
		SQL.Add('  AND RDelKbn   = 0        ');	//	ﾚｺｰﾄﾞ区分(0:正規ﾚｺｰﾄﾞ)  // <001>
// <001>        SQL.Add('  AND RecordKbn = 0        ');	//	ﾚｺｰﾄﾞ区分(0:正規ﾚｺｰﾄﾞ)
		SQL.Add('  AND SubCode   = 0        ');	//	科目別補助ｺｰﾄﾞ
		SQL.Add('  AND BPKbn     = :BsPlKbn ');	//	BS/PL区分

		ParamByName('SumKbn')   .AsInteger :=	m_iChoice;	//	実在/合計区分
		ParamByName('BsPlKbn')  .AsInteger :=	m_iBPKbn;	//	BS/PL区分

		//	ｴﾗｰの判定
		if ( Open = False ) then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqData );
			MjsMessageBoxEx(AOwner, // <002>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
			Close;
			Free;
			Exit;
		end;

		if ( EOF <> True ) then
		begin
			Result := GetFld('MIN(KmkMA.GCode)').AsInteger;
		end;
    end;

	DmqData.Close;
	DmqData.Free;

end;

//************************************************************************
//*		Component		:	Radio_Xxx ( TMRadioButton )
//*							Radioﾎﾞﾀﾝの共通ｲﾍﾞﾝﾄ
//*		Event			:	OnClick
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.Radio_Click(Sender: TObject);
begin

	//	全てCheck時
	if ( Radio_All.Checked = True ) then
		fnChoiceEnable(False)
	//	選択Chec時
	else if ( Radio_Choice.Checked = True ) then
		fnChoiceEnable(True);

end;

//**********************************************************************
//*		Proccess	:	選択内容のCheckBox使用可・不可制御
//*		Name		:	H.Endo
//*		Date		:	2001/08/27
//*		Parameter	:	Enable		:	使用可(True)/使用不可(False)
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009001_D1f.fnChoiceEnable(Enable: Boolean);
begin

	//	使用不可
	if ( Enable = False ) then
	begin
		MGroupBox1		.Enabled := False;
		Check_Rensou	.Enabled := False;	//	連想ｼﾝﾎﾞﾙ
		Check_LongName	.Enabled := False;	//	正式名称
		Check_SimpleName.Enabled := False;	//	簡略名称
		Check_Bunseki	.Enabled := False;	//	分析ｺｰﾄﾞ
		Check_Seikaku	.Enabled := False;	//	性格ｺｰﾄﾞ
		Check_Seizan	.Enabled := False;	//	正残区分
        Check_Kisyu		.Enabled := False;	//	期首残区分
		Check_Kari		.Enabled := False;	//	借方資金繰ｺｰﾄﾞ
        Check_Kashi		.Enabled := False;	//	貸方資金繰ｺｰﾄﾞ
		Check_Inp		.Enabled := False;	//	入力条件
    	Check_Out		.Enabled := False;	//	出力条件
		Check_Hiritsu	.Enabled := False;	//	比率
        Check_Bunrui	.Enabled := False;	//	分類 <006>ADD
	end
	//	使用可
	else if ( Enable = True ) then
	begin
		MGroupBox1		.Enabled := True;
		Check_Rensou	.Enabled := True;	//	連想ｼﾝﾎﾞﾙ
		Check_LongName	.Enabled := True;	//	正式名称
		Check_SimpleName.Enabled := True;	//	簡略名称
		Check_Seizan	.Enabled := True;	//	正残区分
    	Check_Out		.Enabled := True;	//	出力条件
		//	合計
		if ( m_iChoice = 1 ) then
		begin
			Check_Bunseki.Enabled := False;	//	分析ｺｰﾄﾞ
			Check_Seikaku.Enabled := False;	//	性格ｺｰﾄﾞ
        	Check_Kisyu	 .Enabled := False;	//	期首残区分
			Check_Kari	 .Enabled := False;	//	借方資金繰ｺｰﾄﾞ
    	    Check_Kashi	 .Enabled := False;	//	貸方資金繰ｺｰﾄﾞ
			Check_Inp	 .Enabled := False;	//	入力条件
			Check_Hiritsu.Enabled := False;	//	比率
            Check_Bunrui .Enabled := False;	//	分類 <006>ADD
		end
		else
		begin
			Check_Bunseki.Enabled := True;	//	分析ｺｰﾄﾞ
			Check_Seikaku.Enabled := True;	//	性格ｺｰﾄﾞ
        	Check_Kisyu	 .Enabled := True;	//	期首残区分
			Check_Kari	 .Enabled := True;	//	借方資金繰ｺｰﾄﾞ
    	    Check_Kashi	 .Enabled := True;	//	貸方資金繰ｺｰﾄﾞ
			Check_Inp	 .Enabled := True;	//	入力条件
			Check_Hiritsu.Enabled := True;	//	比率
            Check_Bunrui .Enabled := True;	//	分類 <006>ADD
		end;
	end;

end;

//************************************************************************
//*		Component		:	BOK ( TMBitBtn )
//*
//*		Event			:	OnClick
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.BOKClick(Sender: TObject);
begin

	fnIniSave();
	ModalResult := IDOK;

end;

//************************************************************************
//*		Component		:	BCancel ( TMBitBtn )
//*
//*		Event			:	OnClick
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP009001_D1f.BCancelClick(Sender: TObject);
begin

	ModalResult := IDCANCEL;

end;

//**********************************************************************
//*		Proccess	:	ﾀﾞｲｱﾛｸﾞのｺﾋﾟｰ情報ｾｯﾄ
//*		Name		:	H.Endo
//*		Date		:	2001/08/27
//*		Parameter	:	なし
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009001_D1f.fnDLGCopyInfoSet();
begin

	m_DlgCopyInfo.CopyCode:= Trunc(ECopyCode.Value);	//	ｺﾋﾟｰ元ｺｰﾄﾞ

	//	すべてにCheck時
	if ( Radio_All.Checked = True ) then
	begin
		m_DlgCopyInfo.Choice	 := False;		//	すべて
		m_DlgCopyInfo.Rensou	 := False;		//	連想ｼﾝﾎﾞﾙ
		m_DlgCopyInfo.LongName	 := False;		//	正式名称
		m_DlgCopyInfo.SimpleName := False;		//	簡略名称
		m_DlgCopyInfo.Bunseki	 := False;		//	分析ｺｰﾄﾞ
		m_DlgCopyInfo.Seikaku	 := False;		//	性格ｺｰﾄﾞ
		m_DlgCopyInfo.Seizan	 := False;		//	正残区分
		m_DlgCopyInfo.Kisyu		 := False;		//	期首残区分
		m_DlgCopyInfo.Kari		 := False;		//	借方資金繰ｺｰﾄﾞ
		m_DlgCopyInfo.Kashi		 := False;		//	貸方資金繰ｺｰﾄﾞ
		m_DlgCopyInfo.Inp		 := False;		//	入力条件
		m_DlgCopyInfo.OutInfo	 := False;		//	出力情報
		m_DlgCopyInfo.Hiritsu	 := False;		//	比率
        m_DlgCopyInfo.Bunrui	 := False;		//  分類 <006>ADD
	end
    //	選択にCheck時
	else if ( Radio_Choice.Checked = True ) then
	begin
		m_DlgCopyInfo.Choice	 := True;		//	選択
		m_DlgCopyInfo.Rensou	 := Check_Rensou	.Checked;	//	連想ｼﾝﾎﾞﾙ
		m_DlgCopyInfo.LongName	 := Check_LongName	.Checked;	//	正式名称
		m_DlgCopyInfo.SimpleName := Check_SimpleName.Checked;	//	簡略名称
		m_DlgCopyInfo.Bunseki	 := Check_Bunseki	.Checked;	//	分析ｺｰﾄﾞ
		m_DlgCopyInfo.Seikaku	 := Check_Seikaku	.Checked;	//	性格ｺｰﾄﾞ
		m_DlgCopyInfo.Seizan	 := Check_Seizan	.Checked;	//	正残区分
		m_DlgCopyInfo.Kisyu		 := Check_Kisyu		.Checked;	//	期首残区分
		m_DlgCopyInfo.Kari		 := Check_Kari		.Checked;	//	借方資金繰ｺｰﾄﾞ
		m_DlgCopyInfo.Kashi		 := Check_Kashi		.Checked;	//	貸方資金繰ｺｰﾄﾞ
		m_DlgCopyInfo.Inp		 := Check_Inp		.Checked;	//	入力条件
		m_DlgCopyInfo.OutInfo	 := Check_Out		.Checked;	//	出力情報
		m_DlgCopyInfo.Hiritsu	 := Check_Hiritsu	.Checked;	//	比率
        m_DlgCopyInfo.Bunrui	 := Check_Bunrui	.Checked;	//  分類 <006>ADD
	end;

end;

//--- HIS0001 START -----

//**********************************************************************
//*		Proccess	:	Iniﾌｧｲﾙ読み取り
//*		Name		:	H.Endo
//*		Date		:	2001/11/02
//*		Parameter	:	なし
//*		Return		:	正常(True)/異常(False)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP009001_D1f.fnIniFileLoad(): Boolean;
var
	TIni	:	TiniFile;
	sPath	:	String;
begin

	Result := False;

//--- HIS0002 START -----
	//端末名が存在しない時
	if ( m_Terminal.Flag = False ) then
		exit;
//--- HIS0002  END  -----
	sPath := rcCOMMONAREA(pComArea^.m_pCommonArea^).SysCliRoot + '\Env\Mas';			// Iniﾌｧｲﾙ出力ﾃﾞｨﾚｸﾄﾘ
	if ( SysUtils.DirectoryExists(sPath) ) then
	begin
		sPath := sPath+'\'+m_Terminal.Name+'MAS130100_Copy.APG';

		//ﾌｧｲﾙが存在するかどうかCheck
		if ( FileExists(sPath) = False ) then
			Exit;

		Tini := TiniFile.create(sPath);

        //	ｺﾋﾟｰ元ｺｰﾄﾞ
		ECopyCode.Value := Tini.ReadInteger('CopyInfo','CopyCode',0);
		//	ｺﾋﾟｰ内容
		if ( Tini.ReadInteger('CopyInfo','CopyContents',0) = 0 ) then
		begin
			Radio_All.Checked := True;		//	全てCheck時
			m_Check := False;
		end
		else
		begin
			Radio_Choice.Checked := True;		//	選択Chec時
			m_Check := True;
		end;
		//	連想ｼﾝﾎﾞﾙ
		if ( Tini.ReadInteger('CopyInfo','CopyAssociation',0) = 0 ) then
			Check_Rensou.Checked := False
		else
			Check_Rensou.Checked := True;	//	Check
		//	正式名称
		if ( Tini.ReadInteger('CopyInfo','CopyFormalName',0) = 0 ) then
			Check_LongName.Checked := False
		else
			Check_LongName.Checked := True;	//	Check
		//	簡略名称
		if ( Tini.ReadInteger('CopyInfo','CopySimpleName',0) = 0 ) then
			Check_SimpleName.Checked := False
		else
			Check_SimpleName.Checked := True;	//	Check
		//	分析ｺｰﾄﾞ
		if ( Tini.ReadInteger('CopyInfo','CopyAnalyze',0) = 0 ) then
			Check_Bunseki.Checked := False
		else
			Check_Bunseki.Checked := True;	//	Check
		//	性格ｺｰﾄﾞ
		if ( Tini.ReadInteger('CopyInfo','CopyCharacter',0) = 0 ) then
			Check_Seikaku.Checked := False
		else
			Check_Seikaku.Checked := True;	//	Check
		//	正残区分
		if ( Tini.ReadInteger('CopyInfo','CopyDebitCredit',0) = 0 ) then
			Check_Seizan.Checked := False
		else
			Check_Seizan.Checked := True;	//	Check
		//	期首残区分
		if ( Tini.ReadInteger('CopyInfo','CopyStartPeriod',0) = 0 ) then
			Check_Kisyu.Checked := False
		else
			Check_Kisyu.Checked := True;	//	Check
		//	借方資金繰ｺｰﾄﾞ
		if ( Tini.ReadInteger('CopyInfo','CopyDebitCode',0) = 0 ) then
			Check_Kari.Checked := False
		else
			Check_Kari.Checked := True;	//	Check
		//	貸方資金繰ｺｰﾄﾞ
		if ( Tini.ReadInteger('CopyInfo','CopyCreditCode',0) = 0 ) then
			Check_Kashi.Checked := False
		else
			Check_Kashi.Checked := True;	//	Check
		//	入力条件
		if ( Tini.ReadInteger('CopyInfo','CopyInput',0) = 0 ) then
			Check_Inp.Checked := False
		else
			Check_Inp.Checked := True;	//	Check
		//	出力条件
		if ( Tini.ReadInteger('CopyInfo','CopyOutput',0) = 0 ) then
			Check_Out.Checked := False
		else
			Check_Out.Checked := True;	//	Check
		//	比率
		if ( Tini.ReadInteger('CopyInfo','CopyRatio',0) = 0 ) then
			Check_Hiritsu.Checked := False
		else
			Check_Hiritsu.Checked := True;	//	Check
        //<006>ADD↓
        //  分類
		if ( Tini.ReadInteger('CopyInfo','CopyBunrui',0) = 0 ) then
			Check_Bunrui.Checked := False
		else
			Check_Bunrui.Checked := True;	//	Check
        //<006>ADD↑

		Tini.free();
		Result := True;
	end;

end;

//**********************************************************************
//*		Proccess	:	Iniﾌｧｲﾙ登録関数
//*		Name		:	H.Endo
//*		Date		:	2001/11/02
//*		Parameter	:	なし
//*		Return		:	正常(True)/異常(False)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP009001_D1f.fnIniSave(): Boolean;
var
	TIni	:	TiniFile;
	sPath	:	String;
	bRet	:	Boolean;
begin

//--- HIS0002 START -----
	//端末名が存在しない時
	if ( m_Terminal.Flag = False ) then
	begin
		Result := False;
		Exit;
	end;
//--- HIS0002  END  -----

	sPath := rcCOMMONAREA(pComArea^.m_pCommonArea^).SysCliRoot + '\Env\Mas';			// Iniﾌｧｲﾙﾃﾞｨﾚｸﾄﾘ
	if ( SysUtils.DirectoryExists(sPath) ) then
	begin
		Try
			sPath := sPath+'\'+m_Terminal.Name+'MAS130100_Copy.APG';
			Tini := TiniFile.create(sPath);

			//	ｺﾋﾟｰ元ｺｰﾄﾞ
			Tini.WriteInteger('CopyInfo','CopyCode',ECopyCode.AsInteger);
			//	ｺﾋﾟｰ内容
			if ( Radio_All.Checked = True ) then
				Tini.WriteInteger('CopyInfo','CopyContents',0)	//	全てCheck時
			else if ( Radio_Choice.Checked = True ) then
				Tini.WriteInteger('CopyInfo','CopyContents',1);	//	選択Chec時
			//	連想ｼﾝﾎﾞﾙ
			if ( Check_Rensou.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyAssociation',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyAssociation',0);
			//	正式名称
			if ( Check_LongName.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyFormalName',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyFormalName',0);
			//	簡略名称
			if ( Check_SimpleName.Checked ) then
				Tini.WriteInteger('CopyInfo','CopySimpleName',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopySimpleName',0);
			//	分析ｺｰﾄﾞ
			if ( Check_Bunseki.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyAnalyze',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyAnalyze',0);
			//	性格ｺｰﾄﾞ
			if ( Check_Seikaku.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyCharacter',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyCharacter',0);
			//	正残区分
			if ( Check_Seizan.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyDebitCredit',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyDebitCredit',0);
			//	期首残区分
			if ( Check_Kisyu.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyStartPeriod',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyStartPeriod',0);
			//	借方資金繰ｺｰﾄﾞ
			if ( Check_Kari.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyDebitCode',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyDebitCode',0);
			//	貸方資金繰ｺｰﾄﾞ
			if ( Check_Kashi.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyCreditCode',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyCreditCode',0);
			//	入力条件
			if ( Check_Inp.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyInput',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyInput',0);
			//	出力条件
			if ( Check_Out.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyOutput',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyOutput',0);
			//	比率
			if ( Check_Hiritsu.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyRatio',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyRatio',0);
            //<006>ADD↓
			if ( Check_Bunrui.Checked ) then
				Tini.WriteInteger('CopyInfo','CopyBunrui',1)	//	Check時
			else
				Tini.WriteInteger('CopyInfo','CopyBunrui',0);
            //<006>ADD↑

			Tini.free();
			bRet := True;
		except
			bRet := False;
		end;
	end else begin
		bRet := False;
	end;
	Result := bRet;

end;

//--- HIS0001 END -------

//--- HIS0002 START -----
//**********************************************************************
//*		Proccess	:	端末名取得
//*		Name		:	H.Endo
//*		Date		:	2002/05/02
//*		Parameter	:	なし
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009001_D1f.fnGetTerminalName();
var
	iwk	:	Integer;
begin

	m_Terminal.Flag := False;
	m_Terminal.Name := '';
	iwk := GetClientName( m_Terminal.Name );
	//RET_METAFRAME	= 1	ﾒﾀﾌﾚｰﾑｾｯｼｮﾝを実行しているｺﾝﾋﾟｭｰﾀの名称を取得しました。
	//RET_LOCAL    	= 0	通常のｺﾝﾋﾟｭｰﾀ名を取得しました。
	//ｺﾝﾋﾟｭｰﾀ名を取得した時
	if ( iwk = RET_METAFRAME ) or ( iwk = RET_LOCAL ) then
		m_Terminal.Flag := True;

end;
//--- HIS0002  END  -----
procedure TJNTCRP009001_D1f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放<003>
    if ( m_ExpOpenSW = TRUE ) then
        fnJNTExpFree();
        
end;

end.
