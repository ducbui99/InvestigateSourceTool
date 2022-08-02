//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目 勘定科目（採用情報ダイアログ）
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.03.26(SAT)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   茂木 勇次   2005.09.22(THU) 採用情報設定画面のｺｰﾄﾞ属性/桁数をMasterInfo
//                                      からではなく、対象科目KmkMAのｺｰﾄﾞ属性/桁数から
//                                      取得するように修正。   
//	<002>	関(PRIME)	2007.12.21(FRI)	ﾏｽﾀ更新履歴対応
//  <003>   大竹 文顕   2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//	<004>	黒田 祐生	2012.02.13(MON)	ShiftState対応
//=============================================================================
unit JNTCRP009001_D4u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, VCL.ExtCtrls, Buttons, FireDAC.Comp.Client,

  MJSLabel, MJSBitBtn, MJSDBModuleu, MJSQuery, MJSDispCtrl, MJSPanel, MJSRadioButton,
  MJSEdits, MJSGroupBox,


  MJSCommonu, Db
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet	// <004>ADD
  ;

type
  TJNTCRP009001_D4f = class(TForm)
    MPanel2: TMPanel;
    DialogLabelGroupAdoption: TMLabel;
    DialogLabelDescAdoption: TMLabel;
    DialogRadioButtonAdoption01: TMRadioButton;
    DialogRadioButtonAdoption02: TMRadioButton;
    MGroupBox1: TMGroupBox;
    DialogLabelDescCodeDigit: TMLabel;
    DialogLabelDescCodeDigitAddition: TMLabel;
    DialogLabelDescCodeAttribute: TMLabel;
    DialogLabelCodeAttributeDesc: TMLabel;
    DialogEditCodeDigit: TMNumEdit;
    DialogEditCodeAttribute: TMNumEdit;
    MPanel1: TMPanel;
    DialogLabelMessage: TMLabel;
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    SPMsHist: TFDStoredProc;

    procedure   fnJNTCRP009001_D4fOnCreate          (Sender: TObject);
	procedure   fnDialogCommonFunctionOnKeyDown     (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   fnDialogButtonOkOnClick             (Sender: TObject);
    procedure   fnDialogButtonCancelOnClick         (Sender: TObject);
    procedure   fnDialogEditCodeAttributeOnChange   (Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			    :   ^TMjsAppRecord;
	m_cDataModule	    :   TMDataModulef;
	m_cDBSelect		    :   TFDConnection;
    m_cExNCode          :   Extended;
	m_strItemName	    :   String;

    procedure	SessionPractice(iSyori: Integer);		// <002> ADD ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加

  public
    { Public 宣言 }
	m_nCodeDigit	    :   Integer;					// ｺｰﾄﾞ桁数
	m_nCodeAttribute    :   Integer;					// ｺｰﾄﾞ属性

	constructor	fnCreateDialog			            (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; cExNCode: Extended);
    procedure   CMChildKey                          (var Msg: TWMKey); message CM_CHILDKEY;
	procedure	fnUpdateMasterInfoData	            ();
	function	fnCheckInputValue		            (nDivision: Integer): Boolean;

  end;

var
  JNTCRP009001_D4F: TJNTCRP009001_D4F;

implementation

const
    MKBN_KAMOKU     =   1;  // 勘定科目
    MKBN_SAIMOKU    =   2;  // 細目科目

    // -----<002> Add-St-----
	C_ST_PROCESS	= 0;					// 設定
	C_ED_PROCESS	= 1;					// 開放
	// -----<002> Add-Ed-----

{$R *.DFM}

//-----------------------------------------------------------------------------
// fnCreateDialog()
//      PARAM   : pRec
//              : AOwner
//              : cDBSelect
//      RETURN  :
//      MEMO    : 科目ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
constructor	    TJNTCRP009001_D4f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; cExNCode: Extended);
begin

	m_pRec				:=  pRec;
	m_cDataModule		:=  TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect			:=  cDBSelect;
    m_cExNCode          :=  cExNCode;

	inherited	Create (AOwner);

end;

//-----------------------------------------------------------------------------
// CMChildKey()
//	< ｷｰ制御 >
//      PARAM   : Msg
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure       TJNTCRP009001_D4f.CMChildKey(var Msg: TWMKey);
var
	cShiftState :   TShiftState;
begin

    // ESCｷｰの補足
	if ( Msg.CharCode = VK_ESCAPE ) then
    begin
		ModalResult :=  mrCancel;
    end;

    // Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);	// <004>MOD

    // OKﾎﾞﾀﾝ
	if	( Screen.ActiveControl.Name = DialogButtonOk.Name ) then
	begin
        // LEFT/UPｷｰの補足
		if	(( (Msg.CharCode = VK_LEFT) and (cShiftState = []) )  or
			 ( (Msg.CharCode = VK_UP  ) and (cShiftState = []) )) then
		begin
            // 次へ
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

    // Cancelﾎﾞﾀﾝ
	if	( Screen.ActiveControl.Name = DialogButtonCancel.Name ) then
	begin
        // RIGHT/DOWNｷｰの補足
		if	(( (Msg.CharCode = VK_RIGHT) and (cShiftState = []) )  or
			 ( (Msg.CharCode = VK_DOWN ) and (cShiftState = []) )) then
		begin
            // 先頭ﾌｨｰﾙﾄﾞへ
			DialogEditCodeDigit.SetFocus ();
			Abort;
		end;
	end;

	inherited;

end;

//-----------------------------------------------------------------------------
// fnJNTCRP009001_D4fOnCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP009001_D4f.fnJNTCRP009001_D4fOnCreate (Sender: TObject);
var
	dqMasterData    :   TMQuery;
begin

	MJSColorChange (TJNTCRP009001_D4F (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

    MjsFontResize( TJNTCRP009001_D4F(Self), Pointer(m_pRec) );

    // -----<002> Add-St-----
	SPMsHist.Connection := m_cDBSelect;
    //SPMsHist.SessionName  := m_cDBSelect.SessionName;
	// -----<002> Add-Ed-----

    // MQueryの構築
	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
(*
        // DEFAULT値はMASTERINFOの値を表示する
		Close();
		SQL.Clear();
		SQL.Add('SELECT                                 '
            +   '    UseKbn                             '
            +   '   ,JHojyoName                         '
            +   '   ,CodeDigit                          '
            +   '   ,CodeAttr                           '
            +   'FROM MasterInfo                        '
		    +   'WHERE (MasterKbn = :nMasterDivision)   ');

		ParamByName('nMasterDivision').AsInteger	:= MKBN_SAIMOKU;
*)// <001>

// ↓↓↓<001>
        // DEFAULT値はKmkMAの対象科目の値を表示する
        Close();
		SQL.Clear();
		SQL.Add('SELECT                             '
            +   '    CodeDigit                      '
            +   '   ,CodeAttr                       '
            +   'FROM KmkMA                         '
		    +   'WHERE  (MasterKbn  = :nMasKbn)     '
            +   '  AND  (NCode      = :nExNCode)    '
            +   '  AND  (RDelKbn    = 0)            ');

        ParamByName('nMasKbn')  .AsInteger  :=  MKBN_KAMOKU;
        ParamByName('nExNCode') .AsFloat    :=  m_cExNCode;
// ↑↑↑<001>

		Open();

		if	( not EOF ) then
		begin
(*
            m_strItemName	:= GetFld ('JHojyoName').AsString;

			if	( m_strItemName = '' ) then
			begin
*) // <001>
                m_strItemName	:= '細目科目';
(*
			end;

			if	( GetFld('UseKbn').AsInteger = 0 ) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
			else
			begin
*) // <001>
				DialogLabelGroupAdoption    .Enabled    :=  False;
				DialogLabelDescAdoption     .Enabled	:=  False;
				DialogRadioButtonAdoption01 .Enabled	:=  False;
				DialogRadioButtonAdoption02 .Enabled	:=  False;

				DialogLabelMessage.Caption  :=  'コード桁数及び属性を変更することができます。';
// <001>			end;

			DialogEditCodeDigit     .Value	:=  GetFld('CodeDigit') .AsInteger;
			DialogEditCodeAttribute .Value	:=  GetFld('CodeAttr')  .AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption :=  m_strItemName + '採用区分';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;

end;

//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key, Shift
//      RETURN  :
//      MEMO    : Form OnKeyDown ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D4f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    // RETUENｷｰの補足
	if	( Key = VK_RETURN ) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
    // RIGHT/DOWNｷｰの補足
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
    
end;

//-----------------------------------------------------------------------------
// fnDialogEditCodeAttributeOnChange()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ｺｰﾄﾞ属性 OnChange ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D4f.fnDialogEditCodeAttributeOnChange (Sender: TObject);
begin

	if	(( Trunc (DialogEditCodeAttribute.Value) < 0 )  or
         ( Trunc (DialogEditCodeAttribute.Value) > 2 )) then
	begin
		Beep ();
		DialogLabelCodeAttributeDesc.Caption	:= '';
		DialogEditCodeAttribute.SetFocus ();
		Abort;
	end;

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;

end;

//-----------------------------------------------------------------------------
// fnDialogButtonOkOnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : OKﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D4f.fnDialogButtonOkOnClick (Sender: TObject);
begin

    // ﾌｨｰﾙﾄﾞ入力値ﾁｪｯｸ
	if	( not fnCheckInputValue (0) ) then Abort;

	if	( DialogRadioButtonAdoption01.Checked ) then
		fnUpdateMasterInfoData ()
	else
    begin
        ModalResult :=  mrCancel;
		Exit;
	end;

	m_nCodeDigit        :=  Trunc (DialogEditCodeDigit    .Value);			// ｺｰﾄﾞ桁数
	m_nCodeAttribute	:=  Trunc (DialogEditCodeAttribute.Value);			// ｺｰﾄﾞ属性

	ModalResult	:= mrOK;

end;

//-----------------------------------------------------------------------------
// fnDialogButtonCancelOnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : Cancelﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D4f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData    :   TMQuery;
	fAdoption	    :   Boolean;
begin

	fAdoption	:= False;
    // MQueryの構築
	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
(*
		SQL.Add('SELECT                                 '
            +   '    UseKbn                             '
            +   '   ,CodeDigit                          '
            +   '   ,CodeAttr                           '
            +   'FROM MasterInfo                        '
            +   'WHERE (MasterKbn = :nMasterDivision)   ');

		ParamByName('nMasterDivision').AsInteger    :=  MKBN_SAIMOKU;
*) // <001>

// ↓↓↓<001>
        SQL.Add('SELECT CodeDigit ,CodeAttr         '
            +   'FROM KmkMA                         '
            +   'WHERE  (MasterKbn  = :nMasKbn)     '
            +   '  AND  (NCode      = :nExNCode)    ');
        ParamByName('nMasKbn')  .AsInteger  :=  MKBN_KAMOKU;
        ParamByName('nExNCode') .AsFloat    :=  m_cExNCode;
// ↑↑↑<001>

		Open ();

		if	( not EOF ) then
		begin
(*
			if	( GetFld('UseKbn').AsInteger = 1 ) then
			begin
*) // <001>
				m_nCodeDigit		:=  GetFld ('CodeDigit').AsInteger;			// ｺｰﾄﾞ桁数
				m_nCodeAttribute    :=  GetFld ('CodeAttr') .AsInteger;			// ｺｰﾄﾞ属性

				fAdoption	:= True;
// <001>			end;
		end;
	end;

    ModalResult	:= mrCancel;

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterInfoData()
//      PARAM   :
//      RETURN  :
//      MEMO    : 採用情報の更新
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D4f.fnUpdateMasterInfoData ();
var
	dqMasterData    :   TMQuery;
begin
    // -------------------------------------------------------------------------
    //  細目科目に対する勘定科目のｺｰﾄﾞ属性/ｺｰﾄﾞ桁数ﾌｨｰﾙﾄﾞに入力値を更新する
    // -------------------------------------------------------------------------

    SessionPractice(C_ST_PROCESS);			// <002>

    // MQueryの構築
	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
		SQL.Add('UPDATE KmkMA SET                   '
            +   '    CodeDigit  =   :nCodeDigit     '
            +   '   ,CodeAttr   =   :nCodeAttr      '
            +   '   ,UpdTantoNCode = :nUpdTantoNCode ' // <003>
            +   'WHERE MasterKbn = :nMasterDivision '
            +   '  AND RDelKbn   = 0                '
            +   '  AND NCode     = :nExNCode        '
            +   '  AND CNCode    = 0                '
            +   '  AND SUMKBN    = 0                ');

		ParamByName('nMasterDivision')  .AsInteger	:=  MKBN_KAMOKU;
        ParamByName('nExNCode')         .AsFloat    :=  m_cExNCode;
		ParamByName('nCodeDigit')       .AsInteger	:=  Trunc (DialogEditCodeDigit    .Value);
		ParamByName('nCodeAttr')        .AsInteger	:=  Trunc (DialogEditCodeAttribute.Value);
        ParamByName('nUpdTantoNCode')   .AsCurrency :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <003>

		ExecSQL;

	end;

    SessionPractice(C_ED_PROCESS);			// <002>

end;

//-----------------------------------------------------------------------------
// fnCheckInputValue()
//      PARAM   : nDivision
//      RETURN  : Boolen : (True: 正常終了 False: 異常終了)
//      MEMO    : ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸ処理
//-----------------------------------------------------------------------------
function	    TJNTCRP009001_D4f.fnCheckInputValue (nDivision: Integer): Boolean;
var
	nCodeDigit      :   Integer;
	nCOdeAttribute  :   Integer;
begin

    // ------------------------
    //  ｺｰﾄﾞ桁数
    // ------------------------
	if	(( nDivision = 0 ) or ( nDivision = 1 )) then
	begin
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);

		if	(( nCodeDigit < 3 ) or ( nCodeDigit > 10 )) then
		begin
			DialogEditCodeDigit.SetFocus ();
			Result	:= False;
			Exit;
		end;
	end;

    // ------------------------
    //  ｺｰﾄﾞ属性
    // ------------------------
	if	(( nDivision = 0 ) or ( nDivision = 2 )) then
	begin
		nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);

		if	( nCodeAttribute > 2 ) then
		begin
			DialogEditCodeAttribute.SetFocus ();
			Result	:= False;
			Exit;
		end;
	end;

	Result	:= True;

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<002>
//	Name		:	T.Seki
//	Date		:	2007/12/21
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP009001_D4f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

end.
