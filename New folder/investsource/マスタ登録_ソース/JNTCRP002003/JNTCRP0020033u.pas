//************************************************************************
//*
//*		Systeme			:	�V��v�V�X�e��
//*		Program			:	�̗p�敪DLG
//*		ProgramID		:	JNTCRP0020033
//*		Name			:	S.Suzuki�iAP�J���j
//*		Create			:	2000/11/07
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX�C����XX�i�����j
//*                                     XXXXXXXXXX�X�V���eXXXXXXXXXX
//*
//*	2000/12/21 HIS0001  H.Endo(��Ƽ��ъ��݌v)
//*						ESC���ŏI���ł���悤�ɂ���
//* 2002/04/24 HIS0002	Y.Ichihashi	�L�����Z���{�^���������ꂽ��_�C�A���O���I������
//*									���ރZ�b�g�̃_�C�A���O���\������Ȃ��悤�ɏC��
//* 2004/12/10 HIS0003  Y.Ichihashi �𑜓x�Ή�
//******************************************************************************
//* 2005/04/01  FX10000 M.KATSUNUMA JNT���ʊ֐��Ή�
//*                                     uses ���ԕύX
//************************************************************************
unit JNTCRP0020033u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables,
  MJSCommonu, MJSDBModuleu, MJSDispCtrl, MJSQuery,
  MJSLabel, MJSBitBtn, MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox;

type
  TJNTCRP0020033f = class(TForm)
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    MPanel1: TMPanel;
    DialogLabelMessage: TMLabel;
    MPanel2: TMPanel;
    DialogLabelGroupAdoption: TMLabel;
    DialogLabelDescAdoption: TMLabel;
    DialogRadioButtonAdoption01: TMRadioButton;
    DialogRadioButtonAdoption02: TMRadioButton;
    DialogRadioButtonAdoption03: TMRadioButton;
    MGroupBox1: TMGroupBox;
    DialogLabelDescCodeDigit: TMLabel;
    DialogEditCodeDigit: TMNumEdit;
    DialogLabelDescCodeDigitAddition: TMLabel;
    DialogLabelDescCodeAttribute: TMLabel;
    DialogEditCodeAttribute: TMNumEdit;
    DialogLabelDescCodeAttributeAddition: TMLabel;
    Panel1: TMPanel;
    procedure fnJNTCRP0020033fOnCreate(Sender: TObject);
	procedure fnDialogCommonFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDialogButtonOkOnClick(Sender: TObject);
    procedure fnDialogButtonCancelOnClick(Sender: TObject);
    procedure fnDialogEditCodeAttributeOnChange(Sender: TObject);
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
    procedure fnDialogRadioButtonAdoption01OnClick(Sender: TObject);
    procedure fnDialogRadioButtonAdoption02OnClick(Sender: TObject);
    procedure fnDialogRadioButtonAdoption03OnClick(Sender: TObject);
  private
    { Private �錾 }
	m_pRec			 : ^TMjsAppRecord;													// ���ޗp�߲��
	m_cDataModule	 : TMDataModulef;
	m_cDBSelect		 : TDatabase;
	m_nMasterDivision: Integer;
	m_strItemName	 : String;

  public
    { Public �錾 }
	m_nAdoptDivision: Integer;					// �̗p�敪
	m_nCodeDigit	: Integer;					// ���ތ���
	m_nCodeAttribute: Integer;					// ���ޑ���

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TDataBase; nMasterDivision: Integer);

	procedure	fnUpdateMasterInfoData	();

	function	fnCheckInputValue		(nDivision: Integer): Boolean;

  end;

var
  JNTCRP0020033f: TJNTCRP0020033f;

implementation

const
    MK_SEG01	= 101;		// �Z�O�����g�P�̃}�X�^�敪

{$R *.DFM}

constructor	TJNTCRP0020033f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef;
																cDBSelect: TDataBase; nMasterDivision: Integer);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;

	inherited	Create (AOwner);
end;


procedure	TJNTCRP0020033f.fnJNTCRP0020033fOnCreate (Sender: TObject);
var
	dqMasterData: TMQuery;

begin
	MJSColorChange (TJNTCRP0020033f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	dqMasterData	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQl.ADD ('WHERE  MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			m_strItemName	:= GetFld ('JHojyoName').AsString;

			if	(m_strItemName = '') then
			begin
				case (m_nMasterDivision) of
					41          :	m_strItemName := '����';
					MK_SEG01    :	m_strItemName := '������1';
					MK_SEG01 + 1:	m_strItemName := '������2';
					MK_SEG01 + 2:	m_strItemName := '������3';
					MK_SEG01 + 3:	m_strItemName := '������4';
					MK_SEG01 + 4:	m_strItemName := '������5';
					MK_SEG01 + 5:	m_strItemName := '������6';
					MK_SEG01 + 6:	m_strItemName := '������7';
					MK_SEG01 + 7:	m_strItemName := '������8';
					MK_SEG01 + 8:	m_strItemName := '������9';
					MK_SEG01 + 9:	m_strItemName := '������10';
				end;
			end;

			if	(GetFld ('UseKbn').AsInteger = 0) then
				DialogLabelMessage.Caption	:= m_strItemName + '�͍̗p����Ă��܂���B�̗p���܂����H'
			else
			begin
				if	(GetFld ('UseKbn').AsInteger = 1) then
					DialogRadioButtonAdoption01.Checked	:= TRUE
				else
					DialogRadioButtonAdoption02.Checked	:= TRUE;

				DialogLabelGroupAdoption   .Enabled	:= FALSE;
				DialogLabelDescAdoption    .Enabled	:= FALSE;
				DialogRadioButtonAdoption01.Enabled	:= FALSE;
				DialogRadioButtonAdoption02.Enabled	:= FALSE;
				DialogRadioButtonAdoption03.Enabled	:= FALSE;

				DialogLabelMessage.Caption	:= '�R�[�h�����y�ё�����ύX���邱�Ƃ��ł��܂��B';
			end;

			DialogEditCodeDigit    .Value	:= GetFld ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= GetFld ('CodeAttr' ).AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '�̗p�敪';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelDescCodeAttributeAddition.Caption	:= '����';
		1:	DialogLabelDescCodeAttributeAddition.Caption	:= '����(�O�[������)';
		2:	DialogLabelDescCodeAttributeAddition.Caption	:= '�t���[';
	end;

	MJSFontResize (TJNTCRP0020033f (Self),Pointer (m_pRec));    //HIS0003
end;


procedure	TJNTCRP0020033f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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


procedure	TJNTCRP0020033f.fnDialogEditCodeAttributeOnChange (Sender: TObject);
begin
	if	((Trunc (DialogEditCodeAttribute.Value) < 0) or (Trunc (DialogEditCodeAttribute.Value) > 2)) then
	begin
		Beep ();
		DialogLabelDescCodeAttributeAddition.Caption	:= '';
		DialogEditCodeAttribute.SetFocus ();
		Abort;
	end;

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelDescCodeAttributeAddition.Caption	:= '����';
		1:	DialogLabelDescCodeAttributeAddition.Caption	:= '����(�O�[������)';
		2:	DialogLabelDescCodeAttributeAddition.Caption	:= '�t���[';
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TJNTCRP0020033f.fnDialogRadioButtonAdoption01OnClick (TObject)									*/
//*																											*/
//*	�ړI	: ����o�^���� ׼޵�����[P/L�̂ݍ̗p] OnClick �����												*/
//*																											*/
//*	�߂�l	: �Ȃ�,                                                     		                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020033f.fnDialogRadioButtonAdoption01OnClick (Sender: TObject);
begin
//	DialogLabelGroupCodeDigit           .Enabled	:= TRUE;
//	DialogLabelGroupDescCodeDigit       .Enabled	:= TRUE;
	DialogLabelDescCodeDigit            .Enabled	:= TRUE;
	DialogLabelDescCodeDigitAddition    .Enabled	:= TRUE;
	DialogLabelDescCodeAttribute        .Enabled	:= TRUE;
	DialogLabelDescCodeAttributeAddition.Enabled    := TRUE;

	DialogEditCodeDigit    .Enabled	:= TRUE;
	DialogEditCodeAttribute.Enabled	:= TRUE;
	DialogEditCodeDigit    .Color	:= clWindow;
	DialogEditCodeAttribute.Color	:= clWindow;
end;


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TJNTCRP0020033f.fnDialogRadioButtonAdoption02OnClick (TObject)									*/
//*																											*/
//*	�ړI	: ����o�^���� ׼޵�����[B/S&P/L�̗p] OnClick �����												*/
//*																											*/
//*	�߂�l	: �Ȃ�,                                                     		                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020033f.fnDialogRadioButtonAdoption02OnClick (Sender: TObject);
begin
//	DialogLabelGroupCodeDigit           .Enabled	:= TRUE;
//	DialogLabelGroupDescCodeDigit       .Enabled	:= TRUE;
	DialogLabelDescCodeDigit            .Enabled	:= TRUE;
	DialogLabelDescCodeDigitAddition    .Enabled	:= TRUE;
	DialogLabelDescCodeAttribute        .Enabled	:= TRUE;
	DialogLabelDescCodeAttributeAddition.Enabled    := TRUE;

	DialogEditCodeDigit    .Enabled	:= TRUE;
	DialogEditCodeAttribute.Enabled	:= TRUE;
	DialogEditCodeDigit    .Color	:= clWindow;
	DialogEditCodeAttribute.Color	:= clWindow;
end;


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TJNTCRP0020033f.fnDialogRadioButtonAdoption03OnClick (TObject)									*/
//*																											*/
//*	�ړI	: ����o�^���� ׼޵�����[�̗p���Ȃ�] OnClick �����												*/
//*																											*/
//*	�߂�l	: �Ȃ�,                                                     		                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020033f.fnDialogRadioButtonAdoption03OnClick (Sender: TObject);
begin
//	DialogLabelGroupCodeDigit           .Enabled	:= FALSE;
//	DialogLabelGroupDescCodeDigit       .Enabled	:= FALSE;
	DialogLabelDescCodeDigit            .Enabled	:= FALSE;
	DialogLabelDescCodeDigitAddition    .Enabled	:= FALSE;
	DialogLabelDescCodeAttribute        .Enabled	:= FALSE;
	DialogLabelDescCodeAttributeAddition.Enabled    := FALSE;

	DialogEditCodeDigit    .Enabled	:= FALSE;
	DialogEditCodeAttribute.Enabled	:= FALSE;
	DialogEditCodeDigit    .Color	:= clBtnFace;
	DialogEditCodeAttribute.Color	:= clBtnFace;
end;


procedure	TJNTCRP0020033f.fnDialogButtonOkOnClick (Sender: TObject);
begin
	if	(not fnCheckInputValue (0)) then
		Abort;

	if	((DialogRadioButtonAdoption01.Checked) or (DialogRadioButtonAdoption02.Checked)) then
	begin
		fnUpdateMasterInfoData ();

		if	(DialogRadioButtonAdoption01.Checked) then
			m_nAdoptDivision	:= 1
		else
			m_nAdoptDivision	:= 2;
	end
	else
    begin
		ModalResult	:= mrCancel;

		Exit;
	end;

	m_nCodeDigit		:= Trunc (DialogEditCodeDigit    .Value);			// ���ތ���
	m_nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);			// ���ޑ���

	ModalResult	:= mrOK;
end;


procedure	TJNTCRP0020033f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData: TMQuery;
//	fAdoption	: Boolean;

begin
//	fAdoption	:= False;

	dqMasterData	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			if	(GetFld ('UseKbn').AsInteger >= 1) then
			begin
				m_nAdoptDivision	:= GetFld ('UseKbn'   ).AsInteger;			// �̗p�敪
				m_nCodeDigit		:= GetFld ('CodeDigit').AsInteger;			// ���ތ���
				m_nCodeAttribute	:= GetFld ('CodeAttr' ).AsInteger;			// ���ޑ���

//				fAdoption	:= True;
			end;
		end;
	end;
//---------------------------------HIS0002Start
//	if	(fAdoption) then
//		ModalResult	:= mrOK
//	else
//---------------------------------HIS0002End
		ModalResult	:= mrCancel;
end;


procedure	TJNTCRP0020033f.fnUpdateMasterInfoData ();
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('UPDATE MasterInfo ');
		SQL.ADD ('SET    UseKbn = :nUseDivision, CodeDigit = :nCodeDigit, CodeAttr = :nCodeAttribute ');
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('nCodeDigit'     ).AsInteger	:= Trunc (DialogEditCodeDigit    .Value);
		ParamByName ('nCodeAttribute' ).AsInteger	:= Trunc (DialogEditCodeAttribute.Value);

		if	(DialogRadioButtonAdoption01.Checked) then
			ParamByName ('nUseDivision').AsInteger	:= 1
		else
			ParamByName ('nUseDivision').AsInteger	:= 2;

		ExecSQL;
	end;
end;


function	TJNTCRP0020033f.fnCheckInputValue (nDivision: Integer): Boolean;
var
	nCodeDigit    : Integer;
	nCodeAttribute: Integer;

begin
	if	((nDivision = 0) or (nDivision = 1)) then
	begin
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);							// ���ތ���

		if	((nCodeDigit < 3) or (nCodeDigit > 10)) then
		begin
			DialogEditCodeDigit.SetFocus ();

			Result	:= False;
			Exit;
		end;
	end;

	if	((nDivision = 0) or (nDivision = 2)) then
	begin
		nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);					// ���ޑ���

		if	(nCodeAttribute > 2) then
		begin
			DialogEditCodeAttribute.SetFocus ();

			Result	:= False;
			Exit;
		end;
	end;

	Result	:= True;
end;

//************************************************************************
//*		Component		:	TJNTCRP0020033f ( TForm )
//*							From�̷�����ď���
//*		Event			:	CMChildKey
//*		Name			:	H.Endo�i��Ƽ��ъ��݌v�j	HIS0001
//************************************************************************
procedure TJNTCRP0020033f.CMChildKey(var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then	// Esc
		ModalResult	:= mrCancel;

	cShiftState	:= KeyDataToShiftState (Msg.KeyData);							// Shift���̎擾

	if	(Screen.ActiveControl.Name = DialogButtonOk.Name) then							// ���� [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ��
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

	if	(Screen.ActiveControl.Name = DialogButtonCancel.Name) then						// ���� [��ݾ�]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// ��
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			DialogEditCodeDigit.SetFocus ();
			Abort;
		end;
	end;

	inherited;
end;

end.
