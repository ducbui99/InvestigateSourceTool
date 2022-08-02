//************************************************************************
//	System		:	ＭＪＳ ＦＸ開発
//	Program		:	補助登録(採用区分ダイアログ)
//	ProgramID	:	JNTCRP016003
//	Name		:   茂木勇次
//	Create		:	2005.02.28
//	Comment		:
//
//-------------------------------------------------------------------------
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//-------------------------------------------------------------------------
//	<LEAD>  LEAD変更部分
//======================== Ver4.08修正 Start ==============================
//  <Shift> 小川(LEAD)      2012/02/01(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//
//*************************************************************************
unit JNTCRP016003u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, VCL.ExtCtrls, Buttons, FireDAC.Comp.Client,

  MJSLabel, MJSBitBtn, MJSQuery, MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox,
  MJSCommonu,MJSDBModuleu, MJSDispCtrl
  ,MJSKeyDataState  //<Shift> ADD
  ;

type
  TJNTCRP016003f = class(TForm)
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

    procedure   fnJNTCRP016003fOnCreate             (Sender: TObject);
	procedure   fnDialogCommonFunctionOnKeyDown     (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   fnDialogButtonOkOnClick             (Sender: TObject);
    procedure   fnDialogButtonCancelOnClick         (Sender: TObject);
    procedure   fnDialogEditCodeAttributeOnChange   (Sender: TObject);
	procedure   CMChildKey                          (var Msg: TWMKey); message CM_CHILDKEY;
  private
    { Private 宣言 }
	m_pRec			    :   ^TMjsAppRecord;
	m_cDataModule	    :   TMDataModulef;
	m_cDBSelect		    :   TFDConnection;
	m_nMasterDivision   :   Integer;
	m_strItemName	    :   String;

    m_pSystemArea	    :	^rcSYSTEMAREA;

  public
    { Public 宣言 }
	m_nCodeDigit	    :   Integer;					// ｺｰﾄﾞ桁数
	m_nCodeAttribute    :   Integer;					// ｺｰﾄﾞ属性

	constructor	fnCreateDialog			    (pRec: Pointer; AOwner: TComponent;
                                             cDataModule: TMDataModulef; cDBSelect: TFDConnection;
                                             nMasterDivision: Integer);
	procedure	fnUpdateMasterInfoData	    ();
	function	fnCheckInputValue		    (nDivision: Integer): Boolean;

  end;

var
  JNTCRP016003f: TJNTCRP016003f;

implementation

{$R *.DFM}

//-----------------------------------------------------------------------------
//  fnCreateDialog
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor	TJNTCRP016003f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef;
                                           cDBSelect: TFDConnection; nMasterDivision: Integer);
begin

	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;

    m_pSystemArea       := m_pRec^.m_pSystemArea;

	inherited	Create (AOwner);

end;

//-----------------------------------------------------------------------------
// fnJNTCRP016003fOnCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnJNTCRP016003fOnCreate (Sender: TObject);
var
	dqMasterData    :   TMQuery;
begin

	MJSColorChange (TJNTCRP016003f (Self),
                    m_pSystemArea.SysColorB,
					m_pSystemArea.SysColorD,
					m_pSystemArea.SysBaseColorB,
					m_pSystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo '
		    +   'WHERE  (MasterKbn = :nMasterDivision)                          ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		Open();

		if	( not EOF ) then
		begin
			m_strItemName	:= GetFld ('JHojyoName').AsString;

			if	( m_strItemName = '' ) then
			begin
				case m_nMasterDivision of
//					21: m_strItemName	:= '銀行';
//					22: m_strItemName	:= '取引先';
//					24: m_strItemName	:= '社員';
					31: m_strItemName	:= '汎用補助1';
					32: m_strItemName	:= '汎用補助2';
					33: m_strItemName	:= '汎用補助3';
					34: m_strItemName	:= '汎用補助4';
					35: m_strItemName	:= '汎用補助5';
				end;
			end;

			if	( GetFld ('UseKbn').AsInteger = 0 ) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
			else
			begin
				DialogLabelGroupAdoption   .Enabled	:= False;
				DialogLabelDescAdoption    .Enabled	:= False;
				DialogRadioButtonAdoption01.Enabled	:= False;
				DialogRadioButtonAdoption02.Enabled	:= False;

				DialogLabelMessage.Caption	:= 'コード桁数及び属性を変更することができます。';
			end;

			DialogEditCodeDigit    .Value	:= GetFld ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= GetFld ('CodeAttr' ).AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '採用区分';

	case ( Trunc (DialogEditCodeAttribute.Value) ) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;

end;

//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown()
//	< OnKeyDown >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key   : Word
//                Shift : TShiftState
//      RETURN  :
//      MEMO    : ｷｰ制御
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	( Key = VK_RETURN ) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
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
//	< OnChange >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ｺｰﾄﾞ属性OnChangeｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnDialogEditCodeAttributeOnChange (Sender: TObject);
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
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : OKﾎﾞﾀﾝｸﾘｯｸ時処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnDialogButtonOkOnClick (Sender: TObject);
begin

	if	( not fnCheckInputValue (0) ) then
		Abort;

	if	( DialogRadioButtonAdoption01.Checked ) then
		fnUpdateMasterInfoData ()
	else
    begin
		ModalResult	:= mrCancel;
		Exit;
	end;

	m_nCodeDigit		:= Trunc (DialogEditCodeDigit    .Value);			// ｺｰﾄﾞ桁数
	m_nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);			// ｺｰﾄﾞ属性

	ModalResult	:= mrOK;

end;

//-----------------------------------------------------------------------------
// fnDialogButtonCancelOnClick()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : Cancelﾎﾞﾀﾝｸﾘｯｸ時処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData    :   TMQuery;
	fAdoption	    :   Boolean;
begin

	fAdoption	:= False;

	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo '
            +   'WHERE (MasterKbn = :nMasterDivision)               ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		Open();

		if	( not EOF ) then
		begin
			if	( GetFld ('UseKbn').AsInteger = 1 ) then
			begin
				m_nCodeDigit		:= GetFld ('CodeDigit').AsInteger;			// ｺｰﾄﾞ桁数
				m_nCodeAttribute	:= GetFld ('CodeAttr' ).AsInteger;			// ｺｰﾄﾞ属性
				fAdoption	        := True;
			end;
		end;
	end;

    ModalResult	:= mrCancel;

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterInfoData()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 採用情報更新処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016003f.fnUpdateMasterInfoData ();
var
	dqMasterData    :   TMQuery;
begin

	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear();
		SQL.Add('UPDATE MasterInfo SET                  '
            +   '    UseKbn     = 1                     '
            +   '   ,CodeDigit  = :nCodeDigit           '
            +   '   ,CodeAttr   = :nCodeAttribute       '
		    +   'WHERE (MasterKbn = :nMasterDivision)   ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('nCodeDigit'     ).AsInteger	:= Trunc (DialogEditCodeDigit    .Value);
		ParamByName ('nCodeAttribute' ).AsInteger	:= Trunc (DialogEditCodeAttribute.Value);
		ExecSQL();
	end;

end;

//-----------------------------------------------------------------------------
// fnCheckInputValue()
//      PARAM   : nDivision
//      VAR     :
//      RETURN  : Boolean       :   TRUE(正常) FALSE(異常)
//      MEMO    : 入力値ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP016003f.fnCheckInputValue (nDivision: Integer): Boolean;
var
    nCodeDigit      :   Integer;
	nCOdeAttribute  :   Integer;
begin

	if	(( nDivision = 0 ) or ( nDivision = 1 )) then
	begin
        // ｺｰﾄﾞ桁数
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);

		if	(( nCodeDigit < 3 ) or ( nCodeDigit > 10 )) then
		begin
			DialogEditCodeDigit.SetFocus ();
			Result	:= False;
			Exit;
		end;
	end;

	if	(( nDivision = 0 ) or ( nDivision = 2 )) then
	begin
        // ｺｰﾄﾞ属性
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

//-----------------------------------------------------------------------------
// fnCheckInputValue()
//  < ｷｰ制御>
//      PARAM   :
//      VAR     : Msg       :   TWMKey
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016003f.CMChildKey(var Msg: TWMKey);
var
	cShiftState :   TShiftState;
begin

    // ESCｷｰの補足
	if ( Msg.CharCode = VK_ESCAPE ) then
		ModalResult	:= mrCancel;

    // Shiftｷｰの取得
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);  //<Shift> ADD


	if	( Screen.ActiveControl.Name = DialogButtonOk.Name ) then
	begin
        // LEFT,UPｷｰの補足
		if	((( Msg.CharCode = VK_LEFT ) and ( cShiftState = [] ))  or
			 (( Msg.CharCode = VK_UP   ) and ( cShiftState = [] ))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

	if	(Screen.ActiveControl.Name = DialogButtonCancel.Name) then
	begin
        // RIGHT,DOWNｷｰの補足
		if	((( Msg.CharCode = VK_RIGHT ) and ( cShiftState = [] ))  or
			 (( Msg.CharCode = VK_DOWN  ) and ( cShiftState = [] ))) then
		begin
			DialogEditCodeDigit.SetFocus ();
			Abort;
		end;
	end;

	inherited;

end;

end.
