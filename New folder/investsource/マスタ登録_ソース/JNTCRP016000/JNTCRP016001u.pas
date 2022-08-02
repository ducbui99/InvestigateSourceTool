//************************************************************************
//	System		:	ＭＪＳ ＦＸ開発
//	Program		:	補助登録(印刷ダイアログ)
//	Name		:   茂木勇次
//	Create		:
//	Comment		:
//
//-------------------------------------------------------------------------
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <001>   茂木勇次(LEAD)  2005/07/19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//
//======================== Ver4.08修正 Start ==============================
//  <Shift> 小川(LEAD)      2012/02/01(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//*************************************************************************
unit JNTCRP016001u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSComboBox, MJSLabel, MJSEdits, VCL.ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, JNTMasWndIFu,
  MJSGroupBox, MJSCommonu, MJSCheckBox
  ,MJSKeyDataState  //<Shift> ADD
  ;

type

{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加

  TJNTCRP016001f = class(TForm)
    MPanel1: TMPanel;
    MLabel1: TMLabel;
    DialogComboBoxListKind: TMComboBox;
    DialogGroupBoxOrder: TMGroupBox;
    DialogRadioButtonExCode: TMRadioButton;
    DialogRadioButtonAssociation: TMRadioButton;
    DialogGroupBoxScope: TMGroupBox;
    DialogLabelExCodeDescStart: TMLabel;
    DialogLabelNameSimpleStart: TMLabel;
    DialogLabelExCodeDescFrom: TMLabel;
    DialogLabelExCodeDescTo: TMLabel;
    DialogLabelNameSimpleEnd: TMLabel;
    DialogLabelExCodeDescEnd: TMLabel;
    DialogEditExCodeFreeEnd: TMTxtEdit;
    DialogEditExCodeFreeStart: TMTxtEdit;
    DialogEditExCodeNumericStart: TMNumEdit;
    DialogEditExCodeNumericEnd: TMNumEdit;
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    CTokuisaki: TMCheckBox;
    CSiiresaki: TMCheckBox;
    CNoCheck: TMCheckBox;
    procedure fnJNTCRP016001fOnCreate(Sender: TObject);
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
    procedure fnTorihikisaki(Flag: Boolean);
  private
    { Private 宣言 }
	m_pRec			    :   ^TMjsAppRecord;						// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule       :   TMDataModulef;
	m_cDBSelect         :   TFDConnection;
	m_nMasterDivision   :   Integer;
	m_nCodeDigit        :   Integer;
	m_nCodeAttribute    :   Integer;
	m_strItemName	    :   String;
    AOwner              :   TComponent;     // <001>

  public
    { Public 宣言 }
	m_nPrintDivision   : Integer;							// 印刷区分: 0=実在, 1=合計, 2=体系
	m_nOrderDivision   : Integer;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr: String;							// 開始実在部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd: String;							// 終了実在部門外部ｺｰﾄﾞ

    m_TokuisakiCheck   : Boolean;                           // HIS0005
    m_SiiresakiCheck   : Boolean;                           // HIS0005
    m_NoCheck          : Boolean;                           // HIS0005

	constructor	fnCreateDialog	(pRec: Pointer; Owner: TComponent; cDataModule: TMDataModulef; cDBSelect: TFDConnection;
								 nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strItemName: String);

	procedure	CMChildkey				(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnGetRequestExCode		(nAccessMethod: Integer): String;
	function	fnGetSQLConstruction	(nAccessMethod: Integer): String;
	procedure	fnSetDepartmentName		(nSetPosition: Integer; Sender: TObject);
	function	fnGetDepartmentName		(strExCode: String): String;
	function	fnChangeSelectionScreen (): Boolean;
	function	fnCodeCheck				(sGCode: String): Boolean;
  end;

var
	JNTCRP016001f: TJNTCRP016001f;

implementation
const
	REQUEST_START	= 0;
	REQUEST_END		= 1;

{$R *.DFM}


constructor	TJNTCRP016001f.fnCreateDialog (pRec: Pointer; Owner: TComponent; cDataModule: TMDataModulef; cDBSelect: TFDConnection;
										nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strItemName: String);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;
	m_nCodeDigit		:= nCodeDigit;
	m_nCodeAttribute	:= nCodeAttribute;
	m_strItemName		:= strItemName;

    AOwner              :=  Owner;  // <001>
	inherited	Create (Owner);

end;


procedure	TJNTCRP016001f.CMChildkey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);							// Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);							// Shiftｷｰの取得  <Shift> ADD

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

    //--- HIS0005St ------------------------------
    if (Screen.ActiveControl.Name = CTokuisaki.Name) or
       (Screen.ActiveControl.Name = CSiiresaki.Name) or
       (Screen.ActiveControl.Name = CNoCheck.Name)   then
    begin
        if ((Msg.CharCode = VK_RETURN) or
           ((Msg.CharCode = VK_TAB)    and (cShiftState = [])) or (Msg.CharCode = VK_RIGHT)) then
        begin
            MjsDispCtrl.MjsNextCtrl (Self);
            abort;
        end;

        if (((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_LEFT)) then
        begin
            MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
        end;
    end;
    //--- HIS0005 Ed ------------------------------

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


procedure	TJNTCRP016001f.fnJNTCRP016001fOnCreate (Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange (TJNTCRP016001f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	if	(m_nMasterDivision = 22) then												// 取引先
	begin
		DialogComboBoxListKind.Items.Add ('実在' + m_strItemName + '登録リスト(簡略)');
		DialogComboBoxListKind.Items.Add ('実在' + m_strItemName + '登録リスト(詳細)');
	end
	else																			// 取引先以外
		DialogComboBoxListKind.Items.Add ('実在' + m_strItemName + '登録リスト');

	DialogComboBoxListKind.Items.Add ('合計' + m_strItemName + '登録リスト');
	DialogComboBoxListKind.Items.Add (m_strItemName + '加算登録リスト');

	m_nPrintDivision					:= 0;
	DialogComboBoxListKind.ItemIndex	:= m_nPrintDivision;

    //--- HIS0005 St ------
    if	(m_nMasterDivision = 22) then												// 取引先
	begin
        fnTorihikisaki(True);
    end;
    //--- HIS0005 Ed ------

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
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
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
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
end;


procedure	TJNTCRP016001f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
//*	関数	: TJNTCRP016001f.fnDialogComboboxFunctionOnKeyDown (TObject; var Word; TShiftState)				*/
//*																											*/
//*	目的	: 補助登録処理 共通(ComboBox用) OnKeyDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016001f.fnDialogComboboxFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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


procedure	TJNTCRP016001f.fnDialogComboBoxListKindOnChange (Sender: TObject);
begin
	if	(not DialogComboBoxListKind.DroppedDown) then
		fnChangeSelectionScreen ();
end;


procedure	TJNTCRP016001f.DialogComboBoxListKindOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
//*	関数	: TMas220100f.fnDialogEditExCodeStartOnExit (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ [印刷開始補助ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016001f.fnDialogEditExCodeStartOnExit (Sender: TObject);
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
		sGCode		:= DialogEditExCodeFreeStart.Text;

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
//*	関数	: TMas220100f.fnDialogEditExCodeEndOnExit (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ [印刷終了補助ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016001f.fnDialogEditExCodeEndOnExit (Sender: TObject);
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
		sGCode		:= DialogEditExCodeFreeEnd.Text;

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

{	if	(m_nCodeAttribute <= 1) then
	begin
		if DialogRadioButtonExCode.Checked = True then
		begin
			if	(Trunc (DialogEditExCodeNumericStart.Value) > Trunc (DialogEditExCodeNumericEnd.Value)) then
			begin
				Beep ();
				DialogEditExCodeNumericEnd.SetFocus ();
				Exit;
			end;
		end;
	end
	else
	begin
		if DialogRadioButtonExCode.Checked = True then
		begin
			if	(CompareStr (DialogEditExCodeFreeStart.Text, DialogEditExCodeFreeEnd.Text) > 0) then
			begin
				Beep ();
				DialogEditExCodeFreeEnd.SetFocus ();
				Exit;
			end;
		end;
	end;
}
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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TMas210101f.fnChangeSelectionScreen ()												*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ																		*/
//*																									*/
//*	戻り値	: Boolean,													                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP016001f.fnChangeSelectionScreen (): Boolean;
var
	nPrintDivisionWork: Integer;

begin
	if	(DialogComboBoxListKind.ItemIndex = m_nPrintDivision) then
	begin
		Result	:= True;
		Exit;
	end;

	DialogEditExCodeNumericStart.Value		:= 0;
	DialogEditExCodeNumericEnd  .Value		:= 0;
	DialogEditExCodeFreeStart   .Text		:= '';
	DialogEditExCodeFreeEnd     .Text		:= '';
	DialogLabelNameSimpleStart  .Caption	:= '';
	DialogLabelNameSimpleEnd    .Caption	:= '';

	m_nPrintDivision	:= DialogComboBoxListKind.ItemIndex;

	if	((m_nPrintDivision >= 1) and (m_nMasterDivision <> 22)) then
		nPrintDivisionWork	:= m_nPrintDivision + 1
	else
		nPrintDivisionWork	:= m_nPrintDivision;

	if	(nPrintDivisionWork = 3) then										// xxxx体系登録ﾘｽﾄ
	begin
        //--- HIS0005 St -----
        if m_nMasterDivision = 22 then
            fnTorihikisaki(False);
        //--- HIS0005 Ed -----

//		DialogLabelGroupTitleOrder  .Enabled	:= False;
// 		DialogLabelGroupTitleScope  .Enabled	:= False;
		DialogRadioButtonExCode     .Enabled	:= False;
		DialogRadioButtonAssociation.Enabled	:= False;
		DialogLabelExCodeDescStart  .Enabled	:= False;
		DialogLabelExCodeDescEnd    .Enabled	:= False;
		DialogLabelExCodeDescFrom   .Enabled	:= False;
		DialogLabelExCodeDescTo     .Enabled	:= False;

		if	(m_nCodeAttribute <= 1) then
		begin
			DialogEditExCodeNumericStart.Color		:= clBtnFace;
			DialogEditExCodeNumericEnd  .Color		:= clBtnFace;
			DialogEditExCodeNumericStart.Enabled	:= False;
			DialogEditExCodeNumericEnd  .Enabled	:= False;
		end
		else
		begin
			DialogEditExCodeFreeStart.Color		:= clBtnFace;
			DialogEditExCodeFreeEnd  .Color		:= clBtnFace;
			DialogEditExCodeFreeStart.Enabled	:= False;
			DialogEditExCodeFreeEnd  .Enabled	:= False;
		end;
	end
	else																	// 実在/合計xxxx登録ﾘｽﾄ
	begin
        //--- HIS0005 St ------
        if m_nMasterDivision = 22 then
        begin
            case nPrintDivisionWork of
                0,1:    fnTorihikisaki(True);
                else    fnTorihikisaki(False);
            end;
        end;
        //--- HIS0005 Ed ------

//		DialogLabelGroupTitleOrder  .Enabled	:= True;
//		DialogLabelGroupTitleScope  .Enabled	:= True;
		DialogRadioButtonExCode     .Enabled	:= True;
		DialogRadioButtonAssociation.Enabled	:= True;
		DialogLabelExCodeDescStart  .Enabled	:= True;
		DialogLabelExCodeDescEnd    .Enabled	:= True;
		DialogLabelExCodeDescFrom   .Enabled	:= True;
		DialogLabelExCodeDescTo     .Enabled	:= True;

		if	(m_nCodeAttribute <= 1) then
		begin
			DialogEditExCodeNumericStart.Color		:= clWindow;
			DialogEditExCodeNumericEnd  .Color		:= clWindow;
			DialogEditExCodeNumericStart.Enabled	:= True;
			DialogEditExCodeNumericEnd  .Enabled	:= True;
		end
		else
		begin
			DialogEditExCodeFreeStart.Color		:= clWindow;
			DialogEditExCodeFreeEnd  .Color		:= clWindow;
			DialogEditExCodeFreeStart.Enabled	:= True;
			DialogEditExCodeFreeEnd  .Enabled	:= True;
		end;
	end;

	Result	:= True;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TMas210101f.fnGetRequestExCode (Integer)												*/
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
function	TJNTCRP016001f.fnGetRequestExCode (nAccessMethod: Integer): String;
var
	dqMasterData: TMQuery;
	strExCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT GCode FROM HojyoMA ');

//		if	(m_nPrintDivision = 0) then
		if  (m_nPrintDivision = 0) or (m_nPrintDivision = 1) then				//実在簡略、実在詳細	//2002/04/01	Y.Ichihashi
			SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn = 0 and RecordKbn = 0 ')
		else
			SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn <> 0 and RecordKbn = 0 ');

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
//*	関数	: TMas210101f.fnSetDepartmentName (Integer; TObject)									*/
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
procedure	TJNTCRP016001f.fnSetDepartmentName (nSetPosition: Integer; Sender: TObject);
var
	dqMasterData	 : TMQuery;
	cNumEditBox		 : TMNumEdit;
	cTxtEditBox		 : TMTxtEdit;
	strDepartmentName: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

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
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = :nSumDivision AND RecordKbn = 0 ');
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

				if	(m_nMasterDivision <> 22) then
					ParamByName ('nSumDivision').AsInteger	:= DialogComboBoxListKind.ItemIndex
				else
				begin
					case (DialogComboBoxListKind.ItemIndex) of
						0:	ParamByName ('nSumDivision').AsInteger	:= 0;
						1:	ParamByName ('nSumDivision').AsInteger	:= 0;
						2:	ParamByName ('nSumDivision').AsInteger	:= 1;
					end;
				end;

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
		cTxtEditBox	:= Sender as TMTxtEdit;

		if	(Trim (cTxtEditBox.Text) <> '') then
			strDepartmentName	:= fnGetDepartmentName (cTxtEditBox.Text)
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = :nSumDivision AND RecordKbn = 0 ');
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

				if	(m_nMasterDivision <> 22) then
					ParamByName ('nSumDivision').AsInteger	:= DialogComboBoxListKind.ItemIndex
				else
				begin
					case (DialogComboBoxListKind.ItemIndex) of
						0:	ParamByName ('nSumDivision').AsInteger	:= 0;
						1:	ParamByName ('nSumDivision').AsInteger	:= 0;
						2:	ParamByName ('nSumDivision').AsInteger	:= 1;
					end;
				end;

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
//*	関数	: TMas210101f.fnGetDepartmentName (String)												*/
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
function	TJNTCRP016001f.fnGetDepartmentName (strExCode: String): String;
var
	dqMasterData	 : TMQuery;
	strDepartmentName: String;

begin
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT SimpleName FROM HojyoMA ');

		if	((m_nPrintDivision = 0) or ((m_nMasterDivision = 22) and (m_nPrintDivision <= 1))) then
			SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and SumKbn = 0 and GCode = :strExCode and RecordKbn = 0')
		else
			SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and SumKbn <> 0 and GCode = :strExCode and RecordKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
			strDepartmentName	:= FieldByName ('SimpleName').AsString;

		Close ();
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= strDepartmentName;
end;


procedure	TJNTCRP016001f.fnDialogButtonOkOnClick (Sender: TObject);
begin
	if	((m_nPrintDivision >= 1) and (m_nMasterDivision <> 22)) then
		m_nPrintDivision	:= m_nPrintDivision + 1;

	if	(DialogRadioButtonExCode.Checked) then									// 出力順序: ｺｰﾄﾞ順
		m_nOrderDivision	:= 0
	else																		// 出力順序: 連想順
		m_nOrderDivision	:= 1;

	m_strExCodeScopeStr	:= '';
	m_strExCodeScopeEnd	:= '';


    //--- HIS0005 St ---------------------------
    if ((m_nPrintDivision <= 1) and (m_nMasterDivision = 22)) then
    begin
        if (CTokuisaki.Checked = False) and (CSiiresaki.Checked = False) and (CNoCheck.Checked = False) then
        begin
            MjsMessageBoxEX(AOwner, // <001>
                            '採用状態をどれかチェックしてください',
                            '採用状態',
                            mjInformation,
                            mjOk,mjDefOk
                           );
            Exit;
        end;

        m_TokuisakiCheck    := False;
        m_SiiresakiCheck    := False;
        m_NoCheck           := False;

        if CTokuisaki.Checked = True then
            m_TokuisakiCheck    := True;

        if CSiiresaki.Checked = True then
            m_SiiresakiCheck    := True;

        if CNoCheck.Checked = True then
            m_NoCheck           := True;
    end
    else
    begin
        m_TokuisakiCheck    := False;
        m_SiiresakiCheck    := False;
        m_NoCheck           := False;
    end;
    //--- HIS0005 Ed ------------------------------


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
//*	関数	: TJNTCRP016001f.fnDialogEditExCodeStartOnArrowClick (TObject)								*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ ｴﾃﾞｨｯﾄ [印刷開始部門ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ							*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016001f.fnDialogEditExCodeStartOnArrowClick (Sender: TObject);
{
var
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
}
begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_START);	// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性

	//HIS0003
//	if DialogRadioButtonAssociation.Checked = True then
//		cMasWndParam.m_SQL_Order	:= 'RenChar';

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DialogEditExCodeNumericStart.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DialogEditExCodeFreeStart   .Text	:= cMasWndParam.m_ExpRetCode;

		DialogLabelNameSimpleStart.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF	.Term ();
	cMasWndIF	.Free ();
}    
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016001f.fnDialogEditExCodeEndOnArrowClick (TObject)								*/
//*																									*/
//*	目的	: 印刷条件ﾀﾞｲｱﾛｸﾞ ｴﾃﾞｨｯﾄ [印刷終了部門ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ							*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016001f.fnDialogEditExCodeEndOnArrowClick (Sender: TObject);
{
var
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
}
begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_END);		// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性

	//HIS0003
//	if DialogRadioButtonAssociation.Checked = True then
//		cMasWndParam.m_SQL_Order	:= 'RenChar';

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DialogEditExCodeNumericEnd.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DialogEditExCodeFreeEnd   .Text		:= cMasWndParam.m_ExpRetCode;

		DialogLabelNameSimpleEnd.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF	.Term ();
	cMasWndIF	.Free ();
}
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016001f.fnGetSQLConstruction (Integer)											*/
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
function	TJNTCRP016001f.fnGetSQLConstruction (nAccessMethod: Integer): String;
var
	strSQLConst	  : String;
	strExCodeStart: String;

begin
	strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [m_nMasterDivision]) + ' AND RecordKbn = 0';

	if m_nMasterDivision = 22 then
	begin
		if	((m_nPrintDivision = 0) or (m_nPrintDivision = 1)) then				// 印刷区分: 0or1=実在
			strSQLConst	:= strSQLConst + ' AND SumKbn = 0'
		else																	// 印刷区分: 2=合計
			strSQLConst	:= strSQLConst + ' AND SumKbn <> 0';
	end
	else
	begin
		if m_nPrintDivision = 0 then
			strSQLConst	:= strSQLConst + ' AND SumKbn = 0'
		else																	// 印刷区分: 2=合計
			strSQLConst	:= strSQLConst + ' AND SumKbn <> 0';
	end;
{	if	((m_nPrintDivision = 0) or (m_nPrintDivision = 1)) then				// 印刷区分: 0or1=実在
		strSQLConst	:= strSQLConst + ' AND SumKbn = 0'
	else																	// 印刷区分: 2=合計
		strSQLConst	:= strSQLConst + ' AND SumKbn <> 0';
}

	if	(nAccessMethod = REQUEST_END) then									// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
	begin
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


{	if	(nAccessMethod = REQUEST_END) then									// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
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
}

	Result	:= strSQLConst;
end;

function TJNTCRP016001f.fnCodeCheck(sGCode: String): Boolean;
var
 	dqMasterData	:	TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with dqMasterData do
	begin
		SQL.Add('select GCode from HojyoMA     ');
		SQL.Add('where  MasterKbn = :MasterKbn ');
		SQL.Add('and    RecordKbn = 0          ');
		SQL.Add('and    GCode     = :GCode     ');

		if m_nMasterDivision <> 22 then
		begin
			if m_nPrintDivision = 0 then
				SQL.Add('and SumKbn   = 0      ')
			else
				SQL.Add('and SumKbn  <> 0      ');
		end
		else
		begin
			if (m_nPrintDivision <= 1) then
				SQL.Add('and SumKbn   = 0      ')
			else
				SQL.Add('and SumKbn  <> 0      ');
		end;

		ParamByName('MasterKbn').AsInteger	:= m_nMasterDivision;
		ParamByName('GCode').AsString		:= sGCode;

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

		Close;
		Free;
	end;
end;

procedure TJNTCRP016001f.fnTorihikisaki(Flag: Boolean);
begin
    if Flag = True then
    begin
        Self.ClientHeight               := 266;
        Self.ClientWidth                := 369;

        MPanel1.Height                  := 232;

        DialogGroupBoxScope.Height      := 104;

        CTokuisaki.Visible              := True;
        CTokuisaki.Left                 := 22;
        CTokuisaki.Top                  := 75;

        CSiiresaki.Visible              := True;
        CSiiresaki.Left                 := 130;
        CSiiresaki.Top                  := 75;

        CNoCheck.Visible                := True;
        CNoCheck.Left                   := 240;
        CNoCheck.Top                    := 75;

        DialogButtonOk.Top              := 240;
        DialogButtonCancel.Top          := 240;
    end
    else
    begin
        Self.ClientHeight               := 247;
        Self.ClientWidth                := 369;

        MPanel1.Height                  := 213;

        DialogGroupBoxScope.Height      := 85;

        CTokuisaki.Visible              := False;
        CSiiresaki.Visible              := False;
        CNoCheck.Visible                := False;

        DialogLabelExCodeDescStart.Top  := 24;
        DialogEditExCodeNumericStart.Top:= 24;
        DialogEditExCodeFreeStart.Top   := 24;
        DialogLabelNameSimpleStart.Top  := 24;
        DialogLabelExCodeDescFrom.Top   := 24;

        DialogLabelExCodeDescEnd.Top    := 48;
        DialogEditExCodeNumericEnd.Top  := 48;
        DialogEditExCodeFreeEnd.Top     := 48;
        DialogLabelNameSimpleEnd.Top    := 48;
        DialogLabelExCodeDescTo.Top     := 48;

        DialogButtonOk.Top              := 219;
        DialogButtonCancel.Top          := 219;
    end;
end;

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*                                                                                                 */
//***************************************************************************************************/
