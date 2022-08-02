//******************************************************************************
//	Project Name	:	Galileopt���^
//	Project Memo	:	����w��_�C�A���O
//	Project ID		:	HAP000010
//	Create Date		:	2020/05/08	Y.Kondo					<RefDay>
//	Remake Date		:
//******************************************************************************
unit HAP000010RefDlgU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, MJSBitBtn, MJSEdits, MJSComboBox, MJSLabel,
  MJSCommonU,MJSKeyDataState,
  MjsDispCtrl,MjsStrCtrl,MjsDateCtrl,
  HAPMsgu, Vcl.ComCtrls, MJSRichMemo, Vcl.ExtCtrls, MJSPanel;

type
{$I ActionInterface.inc}

  THAP000010RefDlgF = class(TForm)
	MLabel2: TMLabel;
	dtRefDay: TMDateEdit;
	btnOK: TMBitBtn;
	btnCancel: TMBitBtn;
    MPanel1: TMPanel;
    MRichMemo1: TMRichMemo;
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCreate(Sender: TObject);
	procedure btnOKClick(Sender: TObject);
	procedure btnCancelClick(Sender: TObject);
	procedure dtDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
	m_pRec		: ^TMjsAppRecord;
	recCommon	: ^rcCOMMONAREA;							// ���ʴر
	recSystem	: rcSYSTEMAREA;								// �V�X�e���E������ �\����

	m_iYearDisp	: Integer;				// ���n���Ұ�
	m_dRefDate	: TDate;

	rcMsg		: TMjsMsgRec;													//���b�Z�[�W

	procedure fnPartsInitialize;
	{ Private �錾 }
  public
	{ Public �錾 }
	constructor	CreateForm( pParam : Pointer; COwner: TComponent; YearKbn: Integer; RefDate: TDate);
	procedure	CMChildKey( var Msg : TWMKey ); message CM_CHILDKEY;
	function fnRetRefDate : TDate;

  end;

implementation

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
//	CONSTRUCTOR
//******************************************************************************
//	Function	:	CreateForm
//	Memo		:	�ݽ�׸�
//	Return		:
//******************************************************************************
constructor	THAP000010RefDlgF.CreateForm( pParam : Pointer;cOwner:TComponent; YearKbn: Integer; RefDate: TDate );
begin
	m_pRec		:= pParam;
	m_iYearDisp	:= YearKbn;
	m_dRefDate := RefDate;

	recCommon	:= m_pRec^.m_pCommonArea;					// ���ʃG���A
	recSystem	:= rcSYSTEMAREA( m_pRec^.m_pSystemArea^ );	// �V�X�e���E������ �\���� �ێ�

	inherited Create( cOwner );
end;

////////////////////////////////////////////////////////////////////////////////
//	KEY
//************************************************************************
//	function	:	CMChildkey
//	Memo		:	�L�[�ړ�
//	Parameters	:	Msg	:	TWMKey object
//	Retrun		:
//************************************************************************
procedure THAP000010RefDlgF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	NowComp : TWinControl;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift := MJSKeyDataToShiftState(Msg.KeyData);

	if sShift = [ssAlt] then
		sShift := [];

	NowComp := Screen.ActiveControl;

	////////////////////////////////
	//		TMBitBtn ����
	if NowComp is TMBitBtn then
	begin
		case Msg.CharCode of
			VK_RETURN:
			begin
				if sShift = [] then
				begin
					if NowComp = btnOK then		btnOKClick(btnOK);
					if NowComp = btnCancel then	btnCancelClick(btnCancel);
					Exit;
				end;
			end;
		end;
	end;

	////////////////////////////////
	//		�ʏ�
	case Msg.CharCode of
		VK_ESCAPE,
		VK_END:
		begin
			if btnCancel.Focused then
			begin
				ModalResult := mrCancel;
				Abort;
			end
			else
			begin
				if btnCancel.CanFocus then
				begin
					btnCancel.SetFocus;
					Exit;
				end;
			end;
		end;

		VK_RETURN :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl(Self);
				Abort;
			end;
		end;

		VK_TAB:
		begin
			if sShift = [ssShift] then
			begin
				MjsPrevCtrl(Self);
				Msg.CharCode := 0;
				abort;
			end
			else
			begin
				MjsNextCtrl(Self);
				Msg.CharCode := 0;
				abort;
			end;
		end;

		VK_RIGHT,
		VK_DOWN:
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl(Self);
				Abort;
			end;
		end;

		VK_LEFT,
		VK_UP:
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsPrevCtrl(Self);
				Abort;
			end;
		end;
	end;
end;

////////////////////////////////////////////////////////////////////////////////
//	FORM EVENT
//******************************************************************************
//	Function	:	FormCreate
//	Memo		:	�쐬
//	Return		:
//******************************************************************************
procedure THAP000010RefDlgF.FormCreate(Sender: TObject);
begin
	fnPartsInitialize;

// �V�X�e���F�̐ݒ�
	MJSCommonU.MJSColorChange ( THAP000010RefDlgF(Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								recCommon.SysFocusColor);

	MjsFontResize(THAP000010RefDlgF(Self), Pointer(m_pRec));		// ̫�ĥ���ނ̕ύX
end;

procedure THAP000010RefDlgF.FormShow(Sender: TObject);
begin
	MjsSetFocus(Self,dtRefDay.Name);
	dtRefDay.AsDateTime := m_dRefDate;
end;

//******************************************************************************
//	Function	:	FormClose
//	Memo		:	�I��
//	Return		:
//******************************************************************************
procedure THAP000010RefDlgF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

////////////////////////////////////////////////////////////////////////////////
//	PARTS EVENT
//******************************************************************************
//	Function	:	btnOkClick
//	Part		:	btnOk
//	Event		:	OnClick
//	Memo		:	OK���� �د�
//	Return		:
//******************************************************************************
procedure THAP000010RefDlgF.btnOKClick(Sender: TObject);
begin
	// �l���������ݒ肳��Ă��Ȃ��ꍇ�͉������Ȃ��B
	if dtRefDay.Text = '' then
	begin
		GetMsg(rcMsg,100,1);
		with rcMsg do
			MjsMessageBoxEx(Self,'��N����'+sMsg,sTitle,icontype,btntype,btnDef,LogType);

		dtRefDay.SetFocus;
		Exit;
	end
	else if not (MjsIntYMDChk(dtRefDay.AsIntYM)) then
	begin
		GetMsg(rcMsg,100,7);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,sMsg,sTitle,icontype,btntype,btnDef,LogType);
		end;

		dtRefDay.SetFocus;
		Exit;
	end;

	m_dRefDate	:= dtRefDay.AsDateTime;
	ModalResult := mrOk;
end;

//******************************************************************************
//	Function	:	btnCancelClick
//	Part		:	btnCancel
//	Event		:	OnClick
//	Memo		:	��ݾ����� �د�
//	Return		:
//******************************************************************************
procedure THAP000010RefDlgF.btnCancelClick(Sender: TObject);
begin
//pInfo^.StDate	:= 0;
	ModalResult := mrCancel;
end;


////////////////////////////////////////////////////////////////////////////////
//	FUNCTION
//******************************************************************************
//	Function	:	fnPartsInitialize
//	Memo		:	�߰�����
//	Param		:
//	Return		:
//******************************************************************************
procedure THAP000010RefDlgF.fnPartsInitialize;
begin

	if m_iYearDisp = 1 then
	begin
		dtRefDay.DateFormat := dfYMD;
	end
	else
	begin
		dtRefDay.DateFormat := dfEMD;
	end;
end;

procedure THAP000010RefDlgF.dtDateExit(Sender: TObject);
begin
	if (Screen.ActiveControl = btnCancel) then
		Exit;

	if (dtRefDay.Text <> '') and (not MjsIntYMDChk(TMDateEdit(Sender).AsIntYM)) then
	begin
		GetMsg(rcMsg,100,7);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,sMsg,sTitle,icontype,btntype,btnDef,LogType);
		end;

		TMDateEdit(Sender).SetFocus;
		abort;
	end;

end;

//**********************************************************************
//		Event		:fnRetNCode
//		Process		:�S���ғ����R�[�h�߂�
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010RefDlgF.fnRetRefDate : TDate;
begin
	Result := m_dRefDate;
end;

end.
