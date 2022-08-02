//  System      :   新会計システム 支払管理システム
//  Program     :   支払先情報登録(支払方法別)/採用情報設定
//  ProgramID   :   PAY210400
//  Name        :   H.Endo(MJS)
//  Create      :
//  Comment		:
//	History		:  2000 / 99 / 99	X.Xxxxxx
//				         XXXXXXXX更新内容XXXXXXX
//
//		           2005 / 03 / 16   K.Iiduka(LEAD)   FXDB対応    <01>
//******************************************************************************
unit JNTCRP004007_D1u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSKeyDataState,		// <KDS> ADD
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu;

type
  TJNTCRP004007_D1f = class(TForm)
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

	procedure	fnPay210101fOnCreate				(Sender: TObject);
	procedure	fnDialogCommonFunctionOnKeyDown		(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDialogButtonOkOnClick				(Sender: TObject);
	procedure	fnDialogButtonCancelOnClick			(Sender: TObject);
	procedure	fnDialogEditCodeAttributeOnChange	(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	: TMDataModulef;
	m_cDBSelect		: TFDConnection;
	m_strItemName	: String;

  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;															// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;															// ｺｰﾄﾞ属性

	constructor	fnCreateDialog			(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);

	procedure	CMChildKey				(var Msg: TWMKey); message CM_CHILDKEY;

	procedure	fnUpdateMasterInfoData	();

	function	fnCheckInputValue		(nDivision: Integer): Boolean;

  end;

var
  JNTCRP004007_D1f: TJNTCRP004007_D1f;

implementation

const
	MASTER_CUSTOMER		= 22;															// 取引先

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP004007_D1f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);
begin
	m_pRec			:= pRec;
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		:= cDBSelect;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = DialogButtonOk.Name) then							// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DialogButtonCancel.Name) then						// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			DialogEditCodeDigit.SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.fnPay210101fOnCreate (Sender: TObject);
var
	dqMasterData: TMQuery;

begin
	MJSColorChange (TJNTCRP004007_D1f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP004007_D1f (Self), Pointer (m_pRec));

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQl.Add   ('WHERE  MasterKbn = :nMasterDivision');
		ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
		Open ();

		if	(not EOF) then
		begin
			m_strItemName	:= FieldByName ('JHojyoName').AsString;

			if	(m_strItemName = '') then
				m_strItemName	:= '取引先';

			if	(FieldByName ('UseKbn').AsInteger = 0) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
			else
			begin
				DialogLabelGroupAdoption   .Enabled	:= FALSE;
				DialogLabelDescAdoption    .Enabled	:= FALSE;
				DialogRadioButtonAdoption01.Enabled	:= FALSE;
				DialogRadioButtonAdoption02.Enabled	:= FALSE;

				DialogLabelMessage.Caption	:= 'コード桁数及び属性を変更することができます。';
			end;

			DialogEditCodeDigit    .Value	:= FieldByName ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= FieldByName ('CodeAttr' ).AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '採用区分';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure	TJNTCRP004007_D1f.fnDialogEditCodeAttributeOnChange (Sender: TObject);
begin
	if	((Trunc (DialogEditCodeAttribute.Value) < 0) or (Trunc (DialogEditCodeAttribute.Value) > 2)) then
	begin
		Beep ();

		DialogLabelCodeAttributeDesc.Caption	:= '';
		DialogEditCodeAttribute.SetFocus ();

		Abort ();
	end;

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.fnDialogButtonOkOnClick (Sender: TObject);
begin
	if	(not fnCheckInputValue (0)) then
		Abort ();

	if	(DialogRadioButtonAdoption01.Checked) then
		fnUpdateMasterInfoData ()
	else
    begin
		ModalResult	:= mrCancel;

		Exit;
	end;

	m_nCodeDigit		:= Trunc (DialogEditCodeDigit    .Value);						// ｺｰﾄﾞ桁数
	m_nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);						// ｺｰﾄﾞ属性

	ModalResult	:= mrOK;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData: TMQuery;
	fAdoption	: Boolean;

begin
	fAdoption	:= FALSE;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo WHERE MasterKbn = :nMasterDivision');
		ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
		Open ();

		if	(not EOF) then
		begin
			if	(FieldByName ('UseKbn').AsInteger = 1) then
			begin
				m_nCodeDigit		:= FieldByName ('CodeDigit').AsInteger;				// ｺｰﾄﾞ桁数
				m_nCodeAttribute	:= FieldByName ('CodeAttr' ).AsInteger;				// ｺｰﾄﾞ属性

				fAdoption	:= TRUE;
			end;
		end;
	end;

	if	(fAdoption) then
		ModalResult	:= mrOK
	else
		ModalResult	:= mrCancel;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D1f.fnUpdateMasterInfoData ();
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('UPDATE MasterInfo SET UseKbn = 1, CodeDigit = :nCodeDigit, CodeAttr = :nCodeAttribute ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
		ParamByName ('nCodeDigit'     ).AsInteger	:= Trunc (DialogEditCodeDigit    .Value);
		ParamByName ('nCodeAttribute' ).AsInteger	:= Trunc (DialogEditCodeAttribute.Value);

		ExecSQL ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D1f.fnCheckInputValue (nDivision: Integer): Boolean;
var
	nCodeDigit    : Integer;
	nCodeAttribute: Integer;

begin
	if	((nDivision = 0) or (nDivision = 1)) then
	begin
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);								// ｺｰﾄﾞ桁数

		if	((nCodeDigit < 3) or (nCodeDigit > 10)) then
		begin
			DialogEditCodeDigit.SetFocus ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	if	((nDivision = 0) or (nDivision = 2)) then
	begin
		nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);						// ｺｰﾄﾞ属性

		if	(nCodeAttribute > 2) then
		begin
			DialogEditCodeAttribute.SetFocus ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	Result	:= TRUE;
end;

end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

