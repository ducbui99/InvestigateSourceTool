//******************************************************************************
//*		History			:	XXXX/XX/XX  XX�C����XX�i�����j
//*                                     XXXXXXXXXX�X�V���eXXXXXXXXXX
//*
//*		2002/05/01	HIS0001	Y.Ichihashi	Alt+���������ꂽ�Ƃ���̫����ړ����Ȃ���
//*										���������۰ׂ�\������悤�ɏC��
//*
//*		2002/05/01	HIS0002	Y.Ichihashi	���[�����ޯ����̫���������Ƃ����A������
//*										̫����ړ����ł��Ȃ��悤�ɏC��
//*		2002/11/25	HIS0003	Y.Ichihashi	�o�͏����ŘA�z��I�����ꂽ���A�����G�N�X�v���[���ł�
//*										�A�z���ŕ\�������悤�ɑΉ�
//*		2002/11/29	HIS0004 Y.Ichihashi �J�n�E�I���R�[�h�œE�v�̘A�z���ɑΉ�
//*     2004/12/10  HIS0005 Y.Ichihashi �𑜓x�Ή�
//******************************************************************************
//*     2005/04/01  FX10000 M.KATSUNUMA JNT���ʊ֐��Ή�
//*                                         HojyoMA RecordKbn->RDelKbn
//*                                         MasWndIF�֌W JNT��
//******************************************************************************
unit JNTCRP0020031u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MJSComboBox, MJSLabel, MJSEdits, ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, DBTables, MJSQuery,
  MJSGroupBox, MJSCommonu,
  JNTMasWndIFu;

type
{$include ActionInterface.inc} 			 		// ����ݲ���̪���̒ǉ�
  TJNTCRP0020031f = class(TForm)
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    MPanel1: TMPanel;
    MLabel1: TMLabel;
    DialogComboBoxListKind: TMComboBox;
    DialogGroupBoxOrder: TMGroupBox;
    DialogRadioButtonExCode: TMRadioButton;
    DialogRadioButtonAssociation: TMRadioButton;
    DialogGroupBoxScope: TMGroupBox;
    DialogLabelExCodeDescStart: TMLabel;
    DialogEditExCodeNumericStart: TMNumEdit;
    DialogLabelNameSimpleStart: TMLabel;
    DialogLabelExCodeDescFrom: TMLabel;
    DialogLabelExCodeDescTo: TMLabel;
    DialogLabelNameSimpleEnd: TMLabel;
    DialogEditExCodeNumericEnd: TMNumEdit;
    DialogLabelExCodeDescEnd: TMLabel;
    DialogEditExCodeFreeStart: TMTxtEdit;
    DialogEditExCodeFreeEnd: TMTxtEdit;
    procedure fnJNTCRP0020031fOnCreate(Sender: TObject);
	procedure fnDialogCommonFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnDialogComboboxFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDialogComboBoxListKindOnChange(Sender: TObject);
    procedure fnDialogButtonOkOnClick(Sender: TObject);
    procedure DialogComboBoxListKindOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fnDialogEditExCodeStartOnExit(Sender: TObject);
    procedure fnDialogEditExCodeEndOnExit(Sender: TObject);
    procedure fnDialogEditExCodeStartOnArrowClick(Sender: TObject);
    procedure fnDialogEditExCodeEndOnArrowClick(Sender: TObject);
  private
    { Private �錾 }
	m_pRec			 : ^TMjsAppRecord;						// ���ޗp�߲��
	m_cDataModule    : TMDataModulef;
	m_cDBSelect      : TDatabase;
	m_nMasterDivision: Integer;
	m_nCodeDigit     : Integer;
	m_nCodeAttribute : Integer;
	m_strItemName	 : String;

  public
    { Public �錾 }
	m_nPrintDivision   : Integer;							// ����敪: 0=����, 1=���v, 2=�̌n
	m_nOrderDivision   : Integer;							// �͈͎w��: 0=���ޏ�, 1=�A�z��
	m_strExCodeScopeStr: String;							// �J�n���ݕ���O������
	m_strExCodeScopeEnd: String;							// �I�����ݕ���O������

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TDataBase;
								 nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strItemName: String);

	procedure	CMChildkey				(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnGetRequestExCode		(nAccessMethod: Integer): String;
	function	fnGetSQLConstruction	(nAccessMethod: Integer): String;
	procedure	fnSetDepartmentName		(nSetPosition: Integer; Sender: TObject);
	function	fnGetDepartmentName		(strExCode: String): String;
	function	fnChangeSelectionScreen (): Boolean;
	function	fnCodeCheck				(GCode: String): Boolean;
  end;

var
	JNTCRP0020031f: TJNTCRP0020031f;

implementation
const
	REQUEST_START	= 0;
	REQUEST_END		= 1;

{$R *.DFM}


constructor	TJNTCRP0020031f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TDataBase;
										nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strItemName: String);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;
	m_nCodeDigit		:= nCodeDigit;
	m_nCodeAttribute	:= nCodeAttribute;
	m_strItemName		:= strItemName;

	inherited	Create (AOwner);
end;


procedure	TJNTCRP0020031f.CMChildkey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	cShiftState	:= KeyDataToShiftState (Msg.KeyData);							// Shift���̎擾

	if	(DialogComboBoxListKind.Focused) then									// ���[�����ޯ��
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then		// End & Esc
		begin
			Close;
			Abort;
		end;

		if	((Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
			 (Msg.CharCode = VK_RIGHT)) then
		begin
			if	(fnChangeSelectionScreen ()) then
				MjsDispCtrl.MjsNextCtrl (Self);

			Abort;
		end;

		if	(((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_LEFT)) then
			Abort;

		Exit;
	end;

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
			DialogComboBoxListKind.SetFocus ();
			Abort;
		end;
	end;

	inherited;
end;


procedure	TJNTCRP0020031f.fnJNTCRP0020031fOnCreate (Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange (TJNTCRP0020031f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	DialogComboBoxListKind.Items.Add ('����' + m_strItemName + '�o�^���X�g');
	DialogComboBoxListKind.Items.Add ('���v' + m_strItemName + '�o�^���X�g');
	DialogComboBoxListKind.Items.Add (m_strItemName + '���Z�o�^���X�g');
	DialogComboBoxListKind.Items.Add (m_strItemName + '�̌n�o�^���X�g');

	m_nPrintDivision					:= 0;
	DialogComboBoxListKind.ItemIndex	:= m_nPrintDivision;

	if	(m_nCodeAttribute <= 1) then										// ���ޑ���: ����
	begin
		DialogEditExCodeFreeStart   .Visible	:= False;
		DialogEditExCodeFreeEnd     .Visible	:= False;
		DialogEditExCodeNumericStart.Visible	:= True;
		DialogEditExCodeNumericEnd  .Visible	:= True;

		if	(m_nCodeAttribute = 1) then
			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else
			strFormat	:= '';

		DialogEditExCodeNumericStart.FormatStr	:= strFormat;
		DialogEditExCodeNumericEnd  .FormatStr	:= strFormat;

		DialogEditExCodeNumericStart.Value		:= 0;
		DialogEditExCodeNumericEnd  .Value		:= 0;
	end
	else																	// ���ޑ���: �ذ
	begin
		DialogEditExCodeNumericStart.Visible	:= False;
		DialogEditExCodeNumericEnd  .Visible	:= False;
		DialogEditExCodeFreeStart   .Visible	:= True;
		DialogEditExCodeFreeEnd     .Visible	:= True;

		DialogEditExCodeFreeStart   .Text		:= '';
		DialogEditExCodeFreeEnd     .Text		:= '';
	end;

	DialogLabelNameSimpleStart.Caption	:= '';
	DialogLabelNameSimpleEnd  .Caption	:= '';

	MJSFontResize (TJNTCRP0020031f (Self),Pointer (m_pRec));    //HIS0005
end;


procedure	TJNTCRP0020031f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
//------------------------------------------------------------------------------HIS0001Start
	else if (GetKeyState(VK_MENU) < 0) and (Key = VK_DOWN) then
	begin
    	Exit;
	end
//------------------------------------------------------------------------------HIS0001End
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


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TJNTCRP0020031f.fnDialogComboboxFunctionOnKeyDown (TObject; var Word; TShiftState)				*/
//*																											*/
//*	�ړI	: ����o�^���� ����(ComboBox�p) OnKeyDown �����													*/
//*																											*/
//*	�߂�l	: �Ȃ�,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020031f.fnDialogComboboxFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	cComboBox: TMComboBox;

begin
	cComboBox	:= Sender as TMComboBox;

	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
		Abort;
	end;

//	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	if	(Key = VK_LEFT) then						//HIS0002
	begin
		if	(cComboBox.ItemIndex = 0) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;

		Exit;
	end;

//	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	if	(Key = VK_RIGHT) then 						//HIS0002
	begin
		if	(cComboBox.ItemIndex = cComboBox.Items.Count - 1) then
		begin
			MJSDispCtrl.MjsNextCtrl (Self);
			Abort;
		end;

        Exit;
	end;
end;


procedure	TJNTCRP0020031f.fnDialogComboBoxListKindOnChange (Sender: TObject);
begin
//	if	(not DialogComboBoxListKind.DroppedDown) then
		fnChangeSelectionScreen ();
end;


procedure	TJNTCRP0020031f.DialogComboBoxListKindOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_ESCAPE) or (Key = VK_END)) then								// End & Esc
	begin
		Close;
		Abort;
	end;

	if	((Key = VK_TAB) and (Shift = [ssShift])) then							// Shift+Tab
		Abort;

	if	((Key = VK_RETURN) or (Key = VK_TAB)) then								// Enter & Tab
	begin
		if	(fnChangeSelectionScreen ()) then
			MjsDispCtrl.MjsNextCtrl (Self);

		Abort;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TMas210100f.fnDialogEditExCodeStartOnExit (TObject)											*/
//*																											*/
//*	�ړI	: ����o�^���� ��ި�� [����J�n���庰��] OnExit �����											*/
//*																											*/
//*	�߂�l	: �Ȃ�,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020031f.fnDialogEditExCodeStartOnExit (Sender: TObject);
var
	sGCode	:	String;
begin
	if	(m_nCodeAttribute <= 1) then
	begin
		if DialogEditExCodeNumericStart.Text <> '' then
			sGCode	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericStart.Value)])
		else
			sGCode	:= '';
	end
	else
		sGCode	:= DialogEditExCodeFreeStart.Text;

	if sGCode <> '' then
	begin
		if fnCodeCheck(sGCode) = False then
		begin
			beep;

	     	if	(m_nCodeAttribute <= 1) then
    	  		DialogEditExCodeNumericStart.SetFocus
			else
        		DialogEditExCodeFreeStart.SetFocus;
	    end;
	end;

	fnSetDepartmentName (0, Sender);
end;


//***********************************************************************************************************/
//*																											*/
//*	�֐�	: TMas210100f.fnDialogEditExCodeEndOnExit (TObject)												*/
//*																											*/
//*	�ړI	: ����o�^���� ��ި�� [����I�����庰��] OnExit �����											*/
//*																											*/
//*	�߂�l	: �Ȃ�,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020031f.fnDialogEditExCodeEndOnExit (Sender: TObject);
var
	sGCode	:	String;
begin
	if	(m_nCodeAttribute <= 1) then
	begin
		if DialogEditExCodeNumericEnd.Text <> '' then
			sGCode	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericEnd.Value)])
		else
			sGCode	:= '';
	end
	else
		sGCode	:= DialogEditExCodeFreeEnd.Text;

	if sGCode <> '' then
	begin
		if fnCodeCheck(sGCode) = False then
		begin
			beep;

	     	if	(m_nCodeAttribute <= 1) then
    	  		DialogEditExCodeNumericEnd.SetFocus
			else
        		DialogEditExCodeFreeEnd.SetFocus;
	    end;
	end;

	fnSetDepartmentName (1, Sender);

	if DialogRadioButtonExCode.Checked = True then
	begin
		if	(m_nCodeAttribute <= 1) then
		begin
			if	(Trunc (DialogEditExCodeNumericStart.Value) > Trunc (DialogEditExCodeNumericEnd.Value)) then
			begin
				Beep ();
				DialogEditExCodeNumericEnd.SetFocus ();
				Exit;
			end;
		end
		else
		begin
			if	(CompareStr (DialogEditExCodeFreeStart.Text, DialogEditExCodeFreeEnd.Text) > 0) then
			begin
				Beep ();
				DialogEditExCodeFreeEnd.SetFocus ();
				Exit;
			end;
		end;
	end;

{	if	(m_nCodeAttribute <= 1) then
	begin
		if	(Trunc (DialogEditExCodeNumericStart.Value) > Trunc (DialogEditExCodeNumericEnd.Value)) then
		begin
			Beep ();
			DialogEditExCodeNumericEnd.SetFocus ();
			Exit;
		end;
	end
	else
	begin
		if	(CompareStr (DialogEditExCodeFreeStart.Text, DialogEditExCodeFreeEnd.Text) > 0) then
		begin
			Beep ();
			DialogEditExCodeFreeEnd.SetFocus ();
			Exit;
		end;
	end;
}
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnChangeSelectionScreen ()												*/
//*																									*/
//*	�ړI	: ��������޲�۸�																		*/
//*																									*/
//*	�߂�l	: Boolean,													                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020031f.fnChangeSelectionScreen (): Boolean;
begin
	if	(DialogComboBoxListKind.ItemIndex = m_nPrintDivision) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	DialogEditExCodeNumericStart.Value		:= 0;
	DialogEditExCodeNumericEnd  .Value		:= 0;
	DialogEditExCodeFreeStart   .Text		:= '';
	DialogEditExCodeFreeEnd     .Text		:= '';
	DialogLabelNameSimpleStart  .Caption	:= '';
	DialogLabelNameSimpleEnd    .Caption	:= '';

	m_nPrintDivision	:= DialogComboBoxListKind.ItemIndex;

	if	((m_nPrintDivision = 2) or (m_nPrintDivision = 3)) then							// xxxx���Z/xxxx�̌n�o�^ؽ�
	begin
		DialogGroupBoxOrder			.Enabled	:= FALSE;
		DialogGroupBoxScope         .Enabled	:= FALSE;
		DialogRadioButtonExCode     .Enabled	:= FALSE;
		DialogRadioButtonAssociation.Enabled	:= FALSE;
		DialogLabelExCodeDescStart  .Enabled	:= FALSE;
		DialogLabelExCodeDescEnd    .Enabled	:= FALSE;
		DialogLabelExCodeDescFrom   .Enabled	:= FALSE;
		DialogLabelExCodeDescTo     .Enabled	:= FALSE;

		if	(m_nCodeAttribute <= 1) then
		begin
			DialogEditExCodeNumericStart.Color		:= clBtnFace;
			DialogEditExCodeNumericEnd  .Color		:= clBtnFace;
			DialogEditExCodeNumericStart.Enabled	:= FALSE;
			DialogEditExCodeNumericEnd  .Enabled	:= FALSE;
		end
		else
		begin
			DialogEditExCodeFreeStart.Color		:= clBtnFace;
			DialogEditExCodeFreeEnd  .Color		:= clBtnFace;
			DialogEditExCodeFreeStart.Enabled	:= FALSE;
			DialogEditExCodeFreeEnd  .Enabled	:= FALSE;
		end;
	end
	else																	// ����/���vxxxx�o�^ؽ�
	begin
		DialogGroupBoxOrder         .Enabled	:= TRUE;
		DialogGroupBoxScope         .Enabled	:= TRUE;
		DialogRadioButtonExCode     .Enabled	:= TRUE;
		DialogRadioButtonAssociation.Enabled	:= TRUE;
		DialogLabelExCodeDescStart  .Enabled	:= TRUE;
		DialogLabelExCodeDescEnd    .Enabled	:= TRUE;
		DialogLabelExCodeDescFrom   .Enabled	:= TRUE;
		DialogLabelExCodeDescTo     .Enabled	:= TRUE;

		if	(m_nCodeAttribute <= 1) then
		begin
			DialogEditExCodeNumericStart.Color		:= clWindow;
			DialogEditExCodeNumericEnd  .Color		:= clWindow;
			DialogEditExCodeNumericStart.Enabled	:= TRUE;
			DialogEditExCodeNumericEnd  .Enabled	:= TRUE;
		end
		else
		begin
			DialogEditExCodeFreeStart.Color		:= clWindow;
			DialogEditExCodeFreeEnd  .Color		:= clWindow;
			DialogEditExCodeFreeStart.Enabled	:= TRUE;
			DialogEditExCodeFreeEnd  .Enabled	:= TRUE;
		end;
	end;

	Result	:= TRUE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnGetRequestExCode (Integer)												*/
//*																									*/
//*	�ړI	: ��������޲�۸� ����O�����ގ擾														*/
//*																									*/
//*	�߂�l	: String, (����O������)									                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	���Ұ�	: nAccessMethod	= �擾���@ (REQUEST_START:�J�n����, REQUEST_END:�I������)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetRequestExCode (nAccessMethod: Integer): String;
var
	dqMasterData: TMQuery;
	strExCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT GCode FROM HojyoMA ');

		if	(m_nPrintDivision = 0) then
			SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn = 0 and RDelKbn = 0 ')
		else
			SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn <> 0 and RDelKbn = 0 ');

		SQL.ADD ('ORDER BY GCode ');

		if	(nAccessMethod = REQUEST_END) then
			SQL.ADD ('DESC');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
			strExCode	:= FieldByName ('GCode').AsString
        else
			strExCode	:= '';

		Close ();
	end;

	result	:= strExCode;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnSetDepartmentName (Integer; TObject)									*/
//*																									*/
//*	�ړI	: ��������޲�۸� ����ȗ����̾�ď���													*/
//*																									*/
//*	�߂�l	: �Ȃ�,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	���Ұ�	: nSetPosition	= ��Ĉʒu (0:�J�n, 1:�I��)												*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP0020031f.fnSetDepartmentName (nSetPosition: Integer; Sender: TObject);
var
	dqMasterData	 : TMQuery;
	cNumEditBox		 : TMNumEdit;
	cTxtEditBox		 : TMTxtEdit;
	strDepartmentName: String;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	strDepartmentName	:= '';

	if	(m_nCodeAttribute <= 1) then
	begin
		cNumEditBox	:= Sender as TMNumEdit;

		if	((Trunc (cNumEditBox.Value) > 0) or (not cNumEditBox.InputFlag)) then
			strDepartmentName	:= fnGetDepartmentName (Format ('%.10d', [Trunc (cNumEditBox.Value)]))
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = :nSumDivision AND RDelKbn = 0 ');
				SQL.Add   ('ORDER BY GCode');

{				//HIS0004
				if DialogRadioButtonExCode.Checked = True then
					SQL.Add   ('ORDER BY GCode')
				else
					SQL.Add   ('ORDER BY RenChar ');
}
				if	(nSetPosition = 1) then
					SQL.Add (' DESC');

				ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
				ParamByName ('nSumDivision'   ).AsInteger	:= DialogComboBoxListKind.ItemIndex;

				Open ();

				if	(not EOF) then
				begin
					cNumEditBox.Value		:= StrToInt64 (FieldByName ('GCode').AsString);
					cNumEditBox.InputFlag	:= FALSE;
					strDepartmentName		:= FieldByName ('SimpleName').AsString;
				end
				else
					cNumEditBox.Value	:= 0;
			end;
		end;
	end
	else
	begin
		cTxtEditBox			:= Sender as TMTxtEdit;

		if	(Trim (cTxtEditBox.Text) <> '') then
			strDepartmentName	:= fnGetDepartmentName (cTxtEditBox.Text)
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = :nSumDivision AND RDelKbn = 0 ');
				SQL.Add   ('ORDER BY GCode');

{                //HIS0004
				if DialogRadioButtonExCode.Checked = True then
					SQL.Add   ('ORDER BY GCode')
            	else
                	SQL.Add   ('ORDER BY RenChar ');
}
				if	(nSetPosition = 1) then
					SQL.Add (' DESC');

				ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
				ParamByName ('nSumDivision'   ).AsInteger	:= DialogComboBoxListKind.ItemIndex;

				Open ();

				if	(not EOF) then
				begin
					cTxtEditBox.Text	:= FieldByName ('GCode'     ).AsString;
					strDepartmentName	:= FieldByName ('SimpleName').AsString;
				end
				else
					cTxtEditBox.Text	:= '';
			end;
		end;
	end;

	if	(nSetPosition = 0) then
		DialogLabelNameSimpleStart.Caption	:= strDepartmentName
	else
		DialogLabelNameSimpleEnd  .Caption	:= strDepartmentName;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnGetDepartmentName (String)												*/
//*																									*/
//*	�ړI	: ��������޲�۸� ����ȗ����̎擾														*/
//*																									*/
//*	�߂�l	: String, (����ȗ�����)									                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	���Ұ�	: nAccessMethod	= �擾���@ (REQUEST_START:�J�n����, REQUEST_END:�I������)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetDepartmentName (strExCode: String): String;
var
	dqMasterData	 : TMQuery;
	strDepartmentName: String;

begin
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT SimpleName FROM HojyoMA ');

		if	(m_nPrintDivision = 0) then
			SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and SumKbn = 0 and GCode = :strExCode and RDelKbn = 0')
		else
			SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and SumKbn <> 0 and GCode = :strExCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
			strDepartmentName	:= FieldByName ('SimpleName').AsString;

		Close ();
	end;

	Result	:= strDepartmentName;
end;


procedure	TJNTCRP0020031f.fnDialogButtonOkOnClick (Sender: TObject);
begin
	if	(DialogRadioButtonExCode.Checked) then									// �o�͏���: ���ޏ�
		m_nOrderDivision	:= 0
	else																		// �o�͏���: �A�z��
		m_nOrderDivision	:= 1;

	m_strExCodeScopeStr	:= '';
	m_strExCodeScopeEnd	:= '';

	if	(m_nCodeAttribute <= 1) then
	begin
		if	(DialogEditExCodeNumericStart.Value <> 0) then
			m_strExCodeScopeStr	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericStart.Value)]);

		if	(DialogEditExCodeNumericEnd.Value <> 0) then
			m_strExCodeScopeEnd	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericEnd.Value)]);
	end
	else
	begin
		m_strExCodeScopeStr	:= DialogEditExCodeFreeStart.Text;
		m_strExCodeScopeEnd	:= DialogEditExCodeFreeEnd  .Text;
	end;

	if	(m_strExCodeScopeStr = '') then
		m_strExCodeScopeStr	:= fnGetRequestExCode (REQUEST_START);

	if	(m_strExCodeScopeEnd = '') then
		m_strExCodeScopeEnd	:= fnGetRequestExCode (REQUEST_END);

	ModalResult	:= mrOK;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnDialogEditExCodeStartOnArrowClick (TObject)								*/
//*																									*/
//*	�ړI	: ��������޲�۸� ��ި�� [����J�n���庰��] OnArrowClick �����							*/
//*																									*/
//*	�߂�l	: �Ȃ�,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020031f.fnDialogEditExCodeStartOnArrowClick (Sender: TObject);
var
//  FX10000
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;

begin
//  FX10000
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (self, Pointer (m_pRec));

//  FX10000
	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ����      ̨���ޖ�
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// �A�z����� ̨���ޖ�
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// �ȗ�����  ̨���ޖ�
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ð��ٖ�
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_START);	// Where��̏���
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRec���߲��
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ���ތ���
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ���ޑ���

{	//HIS0003
	if DialogRadioButtonAssociation.Checked	= True then
		cMasWndParam.m_SQL_Order:= 'RenChar';
}
	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DialogEditExCodeNumericStart.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DialogEditExCodeFreeStart   .Text	:= cMasWndParam.m_ExpRetCode;

		DialogLabelNameSimpleStart.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnDialogEditExCodeEndOnArrowClick (TObject)								*/
//*																									*/
//*	�ړI	: ��������޲�۸� ��ި�� [����I�����庰��] OnArrowClick �����							*/
//*																									*/
//*	�߂�l	: �Ȃ�,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020031f.fnDialogEditExCodeEndOnArrowClick (Sender: TObject);
var
//  FX10000
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;

begin
//  FX10000
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (self, Pointer (m_pRec));

//  FX10000
	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ����      ̨���ޖ�
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// �A�z����� ̨���ޖ�
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// �ȗ�����  ̨���ޖ�
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ð��ٖ�
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_END);		// Where��̏���
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRec���߲��
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ���ތ���
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ���ޑ���

{	//HIS0003
	if DialogRadioButtonAssociation.Checked	= True then
		cMasWndParam.m_SQL_Order:= 'RenChar';
}
	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DialogEditExCodeNumericEnd.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DialogEditExCodeFreeEnd   .Text		:= cMasWndParam.m_ExpRetCode;

		DialogLabelNameSimpleEnd.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	�֐�	: TJNTCRP0020031f.fnGetSQLConstruction (Integer)											*/
//*																									*/
//*	�ړI	: ��������޲�۸� ����SQL���擾����														*/
//*																									*/
//*	�߂�l	: String, (����SQL��)										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	���Ұ�	: nAccessMethod	= �擾���@ (REQUEST_START:�J�n����, REQUEST_END:�I������)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetSQLConstruction (nAccessMethod: Integer): String;
var
	strSQLConst	  : String;
	strExCodeStart: String;

begin
	strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [m_nMasterDivision]) + ' AND RDelKbn = 0';

	if	(m_nPrintDivision = 0) then											// ����敪: 0=����
		strSQLConst	:= strSQLConst + ' AND SumKbn = 0'
	else																	// ����敪: 1=���v
		strSQLConst	:= strSQLConst + ' AND SumKbn <> 0';


{	if	(nAccessMethod = REQUEST_END) then									// �擾���@: REQUEST_END=�I������
	begin
		//HIS0003
   		if DialogRadioButtonExCode.Checked = True then
		begin
			strExCodeStart	:= '';

			if	(m_nCodeAttribute <= 1) then
			begin
				if	(DialogEditExCodeNumericStart.Value <> 0) then
					strExCodeStart	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericStart.Value)]);
			end
			else
				strExCodeStart	:= DialogEditExCodeFreeStart.Text;

			if	(strExCodeStart <> '') then
				strSQLConst	:= strSQLConst + ' AND GCode >= ''' + strExCodeStart + '''';
		end;
	end;
}

	if	(nAccessMethod = REQUEST_END) then									// �擾���@: REQUEST_END=�I������
	begin
		strExCodeStart	:= '';

		if	(m_nCodeAttribute <= 1) then
		begin
			if	(DialogEditExCodeNumericStart.Value <> 0) then
				strExCodeStart	:= Format ('%.10d', [Trunc (DialogEditExCodeNumericStart.Value)]);
		end
		else
			strExCodeStart	:= DialogEditExCodeFreeStart.Text;

		if	(strExCodeStart <> '') then
			strSQLConst	:= strSQLConst + ' AND GCode >= ''' + strExCodeStart + '''';
	end;

	Result	:= strSQLConst;
end;

function TJNTCRP0020031f.fnCodeCheck(GCode: String): Boolean;
var
	dqMasterData	:	TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DB��MQuery�̐ڑ�

	with dqMasterData do
	begin
        SQL.Add('select GCode from HojyoMA ');
		SQL.Add('where MasterKbn = :MasterKbn ');
		SQL.Add('and   RDelKbn = 0          ');

		if DialogComboBoxListKind.ItemIndex = 0 then
			SQL.Add('and SumKbn  = 0          ')
		else
			SQL.Add('and SumKbn <> 0          ');

		SQL.Add('and   GCode     = :GCode     ');

		ParamByName('MasterKbn').AsInteger	:= m_nMasterDivision;
		ParamByName('GCode').AsString		:= GCode;

		if Open = False then
		begin
			Close;
			Free;
			Result	:= False;
			Exit;
		end;

		if not Eof then
			Result	:= True
		else
			Result	:= False;
	end;
end;

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*                                                                                                 */
//***************************************************************************************************/
