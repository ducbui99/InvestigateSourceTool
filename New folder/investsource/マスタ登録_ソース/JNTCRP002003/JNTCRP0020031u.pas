//******************************************************************************
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*		2002/05/01	HIS0001	Y.Ichihashi	Alt+↓を押されたときにﾌｫｰｶｽ移動しないで
//*										検索ｴｸｽﾌﾟﾛｰﾗを表示するように修正
//*
//*		2002/05/01	HIS0002	Y.Ichihashi	帳票ｺﾝﾎﾞﾎﾞｯｸｽにﾌｫｰｶｽがあるとき↑、↓ｷｰで
//*										ﾌｫｰｶｽ移動ができないように修正
//*		2002/11/25	HIS0003	Y.Ichihashi	出力順序で連想を選択された時、検索エクスプローラでも
//*										連想順で表示されるように対応
//*		2002/11/29	HIS0004 Y.Ichihashi 開始・終了コードで摘要の連想順に対応
//*     2004/12/10  HIS0005 Y.Ichihashi 解像度対応
//******************************************************************************
//*     2005/04/01  FX10000 M.KATSUNUMA JNT共通関数対応
//*                                         HojyoMA RecordKbn->RDelKbn
//*                                         MasWndIF関係 JNT化
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
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
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
    { Private 宣言 }
	m_pRec			 : ^TMjsAppRecord;						// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule    : TMDataModulef;
	m_cDBSelect      : TDatabase;
	m_nMasterDivision: Integer;
	m_nCodeDigit     : Integer;
	m_nCodeAttribute : Integer;
	m_strItemName	 : String;

  public
    { Public 宣言 }
	m_nPrintDivision   : Integer;							// 印刷区分: 0=実在, 1=合計, 2=体系
	m_nOrderDivision   : Integer;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr: String;							// 開始実在部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd: String;							// 終了実在部門外部ｺｰﾄﾞ

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
	cShiftState	:= KeyDataToShiftState (Msg.KeyData);							// Shiftｷｰの取得

	if	(DialogComboBoxListKind.Focused) then									// 帳票ｺﾝﾎﾞﾎﾞｯｸｽ
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

	DialogComboBoxListKind.Items.Add ('実在' + m_strItemName + '登録リスト');
	DialogComboBoxListKind.Items.Add ('合計' + m_strItemName + '登録リスト');
	DialogComboBoxListKind.Items.Add (m_strItemName + '加算登録リスト');
	DialogComboBoxListKind.Items.Add (m_strItemName + '体系登録リスト');

	m_nPrintDivision					:= 0;
	DialogComboBoxListKind.ItemIndex	:= m_nPrintDivision;

	if	(m_nCodeAttribute <= 1) then										// ｺｰﾄﾞ属性: 数字
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
	else																	// ｺｰﾄﾞ属性: ﾌﾘｰ
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
//*	関数	: TJNTCRP0020031f.fnDialogComboboxFunctionOnKeyDown (TObject; var Word; TShiftState)				*/
//*																											*/
//*	目的	: 部門登録処理 共通(ComboBox用) OnKeyDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
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
//*	関数	: TMas210100f.fnDialogEditExCodeStartOnExit (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ [印刷開始部門ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
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
//*	関数	: TMas210100f.fnDialogEditExCodeEndOnExit (TObject)												*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ [印刷終了部門ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
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
//*	関数	: TJNTCRP0020031f.fnChangeSelectionScreen ()												*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ																		*/
//*																									*/
//*	戻り値	: Boolean,													                            */
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

	if	((m_nPrintDivision = 2) or (m_nPrintDivision = 3)) then							// xxxx加算/xxxx体系登録ﾘｽﾄ
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
	else																	// 実在/合計xxxx登録ﾘｽﾄ
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
//*	関数	: TJNTCRP0020031f.fnGetRequestExCode (Integer)												*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ 部門外部ｺｰﾄﾞ取得														*/
//*																									*/
//*	戻り値	: String, (部門外部ｺｰﾄﾞ)									                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nAccessMethod	= 取得方法 (REQUEST_START:開始ｺｰﾄﾞ, REQUEST_END:終了ｺｰﾄﾞ)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetRequestExCode (nAccessMethod: Integer): String;
var
	dqMasterData: TMQuery;
	strExCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
//*	関数	: TJNTCRP0020031f.fnSetDepartmentName (Integer; TObject)									*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ 部門簡略名称ｾｯﾄ処理													*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSetPosition	= ｾｯﾄ位置 (0:開始, 1:終了)												*/
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

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
//*	関数	: TJNTCRP0020031f.fnGetDepartmentName (String)												*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ 部門簡略名称取得														*/
//*																									*/
//*	戻り値	: String, (部門簡略名称)									                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nAccessMethod	= 取得方法 (REQUEST_START:開始ｺｰﾄﾞ, REQUEST_END:終了ｺｰﾄﾞ)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetDepartmentName (strExCode: String): String;
var
	dqMasterData	 : TMQuery;
	strDepartmentName: String;

begin
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
	if	(DialogRadioButtonExCode.Checked) then									// 出力順序: ｺｰﾄﾞ順
		m_nOrderDivision	:= 0
	else																		// 出力順序: 連想順
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
//*	関数	: TJNTCRP0020031f.fnDialogEditExCodeStartOnArrowClick (TObject)								*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ ｴﾃﾞｨｯﾄ [印刷開始部門ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ							*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
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

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_START);	// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性

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
//*	関数	: TJNTCRP0020031f.fnDialogEditExCodeEndOnArrowClick (TObject)								*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ ｴﾃﾞｨｯﾄ [印刷終了部門ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ							*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
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

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_END);		// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性

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
//*	関数	: TJNTCRP0020031f.fnGetSQLConstruction (Integer)											*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ 条件SQL文取得処理														*/
//*																									*/
//*	戻り値	: String, (条件SQL文)										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nAccessMethod	= 取得方法 (REQUEST_START:開始ｺｰﾄﾞ, REQUEST_END:終了ｺｰﾄﾞ)				*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020031f.fnGetSQLConstruction (nAccessMethod: Integer): String;
var
	strSQLConst	  : String;
	strExCodeStart: String;

begin
	strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [m_nMasterDivision]) + ' AND RDelKbn = 0';

	if	(m_nPrintDivision = 0) then											// 印刷区分: 0=実在
		strSQLConst	:= strSQLConst + ' AND SumKbn = 0'
	else																	// 印刷区分: 1=合計
		strSQLConst	:= strSQLConst + ' AND SumKbn <> 0';


{	if	(nAccessMethod = REQUEST_END) then									// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
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

	if	(nAccessMethod = REQUEST_END) then									// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
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
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
