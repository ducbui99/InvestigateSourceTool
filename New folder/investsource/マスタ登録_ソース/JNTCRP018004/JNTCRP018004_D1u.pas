//************************************************************************
//	System		:	新会計システム
//	Program		:
//	ProgramID	:	MAS230900
//	Name		:	Y.Ichihashi
//	Create		:	2004/09/02
//	Comment	:	XXXX注意事項等XXXXXXXXXXXXX
//			 		XXXXXXXXXXXXXXXXXXXXXXXXX
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//
//  2004/12/10  HIS0001 Y.Ichihashi 解像度対応
//  2005/03/02  LEAD    K.Iiduka    FXDB対応        <01>
//  2008/03/17  LEAD    F.Ootake    更新担当者内部ｺｰﾄﾞのｾｯﾄ <02>
//	2012/02/14	HIS0002	Y.Kuroda	ShiftState対応
//************************************************************************
unit JNTCRP018004_D1u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu
  ,MJSKeyDataState	// <HIS0002>ADD
  ;

type
  TJNTCRP018004_D1f = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure DialogEditCodeDigitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DialogEditCodeAttributeChange(Sender: TObject);
    procedure DialogButtonOkClick(Sender: TObject);
    procedure DialogButtonCancelClick(Sender: TObject);
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;		//	HIS0001
  private
    { Private 宣言 }
	m_pRec			 : ^TMjsAppRecord;						// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	 : TMDataModulef;
	m_cDBSelect		 : TFDConnection;
	m_nMasterDivision: Integer;
	m_strItemName	 : String;

  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;					// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;					// ｺｰﾄﾞ属性

	constructor	fnCreateDialog(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TFDConnection; nMasterDivision: Integer);
	procedure	fnUpdateMasterInfoData	();
	function	fnCheckInputValue		(nDivision: Integer): Boolean;
  end;

var
  JNTCRP018004_D1f: TJNTCRP018004_D1f;

implementation

{$R *.DFM}

{ TJNTCRP018004_D1f }

constructor TJNTCRP018004_D1f.fnCreateDialog(pRec: Pointer; AOwner: TComponent;
  cDataModule: TMDataModulef; cDBSelect: TFDConnection;
  nMasterDivision: Integer);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;

	inherited	Create (AOwner);
end;

procedure TJNTCRP018004_D1f.FormCreate(Sender: TObject);
var
	dqMasterData: TMQuery;
begin
	MJSColorChange (TJNTCRP018004_D1f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

//<01>		SQL.ADD ('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQL.ADD ('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQl.ADD ('WHERE  MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			m_strItemName	:= GetFld ('JHojyoName').AsString;

			if	(m_strItemName = '') then
                m_strItemName   := '工種';

			if	(GetFld ('UseKbn').AsInteger = 0) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
			else
			begin
				DialogLabelGroupAdoption   .Enabled	:= False;
				DialogLabelDescAdoption    .Enabled	:= False;
				DialogRadioButtonAdoption01.Enabled	:= False;
				DialogRadioButtonAdoption02.Enabled	:= False;

				DialogLabelMessage.Caption	:= 'コード属性を変更することができます。';
			end;

			DialogEditCodeDigit    .Value	:= GetFld ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= GetFld ('CodeAttr' ).AsInteger;
		end;
        //<01>
        DialogEditCodeAttribute.Enabled := False;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '採用区分';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
	end;

	MjsFontResize(TJNTCRP018004_D1f( Self )	,Pointer(m_pRec));
end;

procedure TJNTCRP018004_D1f.DialogEditCodeDigitKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;

procedure TJNTCRP018004_D1f.DialogEditCodeAttributeChange(Sender: TObject);
begin
	if	((Trunc (DialogEditCodeAttribute.Value) < 0) or (Trunc (DialogEditCodeAttribute.Value) > 1)) then
	begin
		Beep ();
		DialogLabelCodeAttributeDesc.Caption	:= '';
		//DialogEditCodeAttribute.SetFocus ();
		Abort;
	end;

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
	end;
end;

procedure TJNTCRP018004_D1f.DialogButtonOkClick(Sender: TObject);
begin
	if	(not fnCheckInputValue (0)) then
		Abort;

	if	(DialogRadioButtonAdoption01.Checked) then
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

procedure TJNTCRP018004_D1f.DialogButtonCancelClick(Sender: TObject);
var
	dqMasterData: TMQuery;
//	fAdoption	: Boolean;
begin
//	fAdoption	:= False;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
//<01>		SQL.ADD ('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo WHERE MasterKbn = :nMasterDivision');
		SQL.ADD ('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo WHERE MasterKbn = :nMasterDivision');
		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			if	(GetFld ('UseKbn').AsInteger = 1) then
			begin
				m_nCodeDigit		:= GetFld ('CodeDigit').AsInteger;			// ｺｰﾄﾞ桁数
				m_nCodeAttribute	:= GetFld ('CodeAttr' ).AsInteger;			// ｺｰﾄﾞ属性

//				fAdoption	:= True;
			end;
		end;
	end;

	ModalResult	:= mrCancel;
end;

procedure TJNTCRP018004_D1f.fnUpdateMasterInfoData;
var
	dqMasterData: TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('UPDATE MasterInfo SET UseKbn = 1, CodeDigit = :nCodeDigit, CodeAttr = :nCodeAttribute, ');
		SQL.ADD ('UpdTantoNCode = :nUpdTantoNCode '); // <02>
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('nCodeDigit'     ).AsInteger	:= Trunc (DialogEditCodeDigit    .Value);
		ParamByName ('nCodeAttribute' ).AsInteger	:= Trunc (DialogEditCodeAttribute.Value);
        ParamByName ('nUpdTantoNCode' ).AsFloat     := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <02>
		ExecSQL;
	end;
end;

function TJNTCRP018004_D1f.fnCheckInputValue(nDivision: Integer): Boolean;
var
	nCodeDigit    : Integer;
//	nCOdeAttribute: Integer;
begin
	if	((nDivision = 0) or (nDivision = 1)) then
	begin
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);							// ｺｰﾄﾞ桁数

		if	((nCodeDigit < 3) or (nCodeDigit > 10)) then
		begin

			Result	:= False;
			Exit;
		end;
	end;

{
	if	(nDivision = 0) then
	begin
		nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);					// ｺｰﾄﾞ属性

		if	(nCodeAttribute > 1) then
		begin

			Result	:= False;
			Exit;
		end;
	end;
}
	Result	:= True;
end;

procedure TJNTCRP018004_D1f.CMChildKey(var Msg: TWMKey);
var
	cShiftState: TShiftState;
begin
	if (Msg.CharCode = VK_ESCAPE) then	// Esc
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);  								// Shiftｷｰの取得 <HIS0002>MOD

	if	(Screen.ActiveControl.Name = DialogButtonOk.Name) then							// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

	if	(Screen.ActiveControl.Name = DialogButtonCancel.Name) then						// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
//			DialogEditCodeDigit.SetFocus ();
			Abort;
		end;
	end;

	inherited;
end;

end.
