//******************************************************************************
//  System      :   新会計システム 支払管理システム
//  Program     :   支払先情報登録（諸口登録）
//  ProgramID   :   Pay210100
//  Name        :   ？？？
//  Create      :   ？？？
//  Comment		:
//	History		:	  2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//					2005/01/17	H.Endo ( MJS )
//					<#1>  解像度対応
//******************************************************************************
unit JNTCRP0040063u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSComboBox, MJSLabel, MJSEdits, VCL.ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery,
//    MasWndIFu,
    JNTMasWndIFu,
  MJSKeyDataState,		// <KDS> ADD

  MJSGroupBox, MJSCommonu, MJSCheckBox;



type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  TJNTCRP0040063f = class(TForm)
    MPanel1: TMPanel;
    MLabel1: TMLabel;
    DlgComboBoxListKind: TMComboBox;
    DlgGroupBoxOrder: TMGroupBox;
    DlgRadioButtonOrderHojCode: TMRadioButton;
    DlgRadioButtonOrderAssociation: TMRadioButton;
    DlgGroupBoxHojCodeScope: TMGroupBox;
    DlgLabelHojCodeStart: TMLabel;
    DlgLabelHojCodeStartDesc: TMLabel;
    DlgLabelHojCodeFrom: TMLabel;
    DlgLabelHojCodeTo: TMLabel;
    DlgLabelHojCodeEndDesc: TMLabel;
    DlgLabelHojCodeEnd: TMLabel;
    DlgEditHojCodeFreeEnd: TMTxtEdit;
    DlgEditHojCodeFreeStart: TMTxtEdit;
    DlgEditHojCodeNumericStart: TMNumEdit;
    DlgEditHojCodeNumericEnd: TMNumEdit;
    DlgButtonOk: TMBitBtn;
    DlgButtonCancel: TMBitBtn;
    DlgGroupBoxCondition: TMGroupBox;
    DlgCheckBoxConditionOmitParent: TMCheckBox;
    DlgCheckBoxConditionOmitChild: TMCheckBox;
    procedure fnJNTCRP0040063fOnCreate(Sender: TObject);
	procedure fnDlgCmnFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnDlgComboBoxListKindOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDlgComboBoxListKindOnChange(Sender: TObject);
    procedure fnDlgButtonOkOnClick(Sender: TObject);
    procedure fnDlgEditHojCodeStartOnExit(Sender: TObject);
    procedure fnDlgEditHojCodeEndOnExit(Sender: TObject);
	procedure fnDlgEditHojCodeStartOnArrowClick(Sender: TObject);
	procedure fnDlgEditHojCodeEndOnArrowClick(Sender: TObject);
  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule   : TMDataModulef;
	m_cDBSelect     : TFDConnection;
	m_nCodeDigit    : Integer;
	m_nCodeAttribute: Integer;

  public
    { Public 宣言 }
	m_nSelected		: Integer;															// 印刷区分: 0=銀行登録ﾘｽﾄ(簡略), 1=銀行登録ﾘｽﾄ(詳細), 2=口座登録ﾘｽﾄ
	m_nOrderDivision: Integer;															// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strHojCodeStr	: String;															// 出力範囲: 支払先ｺｰﾄﾞ(開始)
	m_strHojCodeEnd	: String;															// 出力範囲: 支払先ｺｰﾄﾞ(終了)

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; nCodeDigit: Integer; nCodeAttribute: Integer);

	procedure	CMChildkey					(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnGetDescriptionHojCode		(strHojCode: String; var strDescription: String): Boolean;
	function	fnGetRequestHojCode			(nAccessMethod: Integer): String;
	function	fnGetSQLConstruction		(nAccessMethod: Integer): String;

	function	fnSetDescriptionHojCode		(Sender: TObject; nSetPosition: Integer): Boolean;
	function	fnChangeSelectionScreen 	(): Boolean;

  end;

var
	JNTCRP0040063f: TJNTCRP0040063f;

implementation
const
	REQUEST_START	= 0;
	REQUEST_END		= 1;

{$R *.DFM}


//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP0040063f.fnCreateDialog (pRec: Pointer; AOwner: TComponent;
											cDBSelect: TFDConnection; nCodeDigit: Integer; nCodeAttribute: Integer);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect			:= cDBSelect;
	m_nCodeDigit		:= nCodeDigit;
	m_nCodeAttribute	:= nCodeAttribute;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.CMChildkey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(DlgComboBoxListKind.Focused) then												// 帳票ｺﾝﾎﾞﾎﾞｯｸｽ
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then				// End & Esc
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

	if	(Screen.ActiveControl.Name = DlgButtonOk.Name) then								// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DlgButtonCancel.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			DlgComboBoxListKind.SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnJNTCRP0040063fOnCreate (Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange (TJNTCRP0040063f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MjsFontResize( TJNTCRP0040063f(Self), Pointer(m_pRec) );						//<#1>

	DlgComboBoxListKind.Items.Add ('実在支払先登録リスト(簡略)');
	DlgComboBoxListKind.Items.Add ('合計支払先登録リスト(簡略)');
	DlgComboBoxListKind.Items.Add ('支払先登録リスト(詳細)');
	DlgComboBoxListKind.Items.Add ('名寄せ登録リスト');
	DlgComboBoxListKind.ItemIndex	:= 0;

	m_nSelected	:= 0;

	DlgGroupBoxCondition.Caption	:= '';

	DlgCheckBoxConditionOmitParent.Checked	:= FALSE;
	DlgCheckBoxConditionOmitChild .Checked	:= FALSE;
	DlgCheckBoxConditionOmitParent.Enabled	:= FALSE;
	DlgCheckBoxConditionOmitChild .Enabled	:= FALSE;

	if	(m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		DlgEditHojCodeFreeStart   .Visible	:= FALSE;
		DlgEditHojCodeFreeEnd     .Visible	:= FALSE;
		DlgEditHojCodeNumericStart.Visible	:= TRUE;
		DlgEditHojCodeNumericEnd  .Visible	:= TRUE;

		if	(m_nCodeAttribute = 1) then
			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else
			strFormat	:= '';

		DlgEditHojCodeNumericStart.Value		:= 0;
		DlgEditHojCodeNumericEnd  .Value		:= 0;
		DlgEditHojCodeNumericStart.InputFlag	:= TRUE;
		DlgEditHojCodeNumericEnd  .InputFlag	:= TRUE;
		DlgEditHojCodeNumericStart.FormatStr	:= strFormat;
		DlgEditHojCodeNumericEnd  .FormatStr	:= strFormat;
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DlgEditHojCodeNumericStart.Visible	:= FALSE;
		DlgEditHojCodeNumericEnd  .Visible	:= FALSE;
		DlgEditHojCodeFreeStart   .Visible	:= TRUE;
		DlgEditHojCodeFreeEnd     .Visible	:= TRUE;

		DlgEditHojCodeFreeStart.Text	:= '';
		DlgEditHojCodeFreeEnd  .Text	:= '';
	end;

	DlgLabelHojCodeStartDesc.Caption	:= '';
	DlgLabelHojCodeEndDesc  .Caption	:= '';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgCmnFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgComboBoxListKindOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	cComboBox: TMComboBox;

begin
	cComboBox	:= Sender as TMComboBox;

	if	(Key = VK_RETURN) then
	begin
		fnChangeSelectionScreen ();

		MjsDispCtrl.MjsNextCtrl (Self);
		Abort ();
	end;

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(cComboBox.ItemIndex = 0) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort ();
		end;

		Exit;
	end;

	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(cComboBox.ItemIndex = cComboBox.Items.Count - 1) then
		begin
			fnChangeSelectionScreen ();

			MJSDispCtrl.MjsNextCtrl (Self);
			Abort ();
		end;

        Exit;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgComboBoxListKindOnChange (Sender: TObject);
begin
	if	(not DlgComboBoxListKind.DroppedDown) then
		fnChangeSelectionScreen ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgEditHojCodeStartOnExit (Sender: TObject);
begin
	if	(not fnSetDescriptionHojCode (Sender, 0)) then
	begin
		Beep ();

		if	(m_nCodeAttribute <= 1) then
			DlgEditHojCodeNumericStart.SetFocus ()
		else
			DlgEditHojCodeFreeStart   .SetFocus ();

		Exit;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgEditHojCodeEndOnExit (Sender: TObject);
begin
	if	(not fnSetDescriptionHojCode (Sender, 1)) then
	begin
		Beep ();

		if	(m_nCodeAttribute <= 1) then
			DlgEditHojCodeNumericEnd.SetFocus ()
		else
			DlgEditHojCodeFreeEnd   .SetFocus ();

		Exit;
	end;

	if	(m_nCodeAttribute <= 1) then
	begin
		if	(Trunc (DlgEditHojCodeNumericStart.Value) > Trunc (DlgEditHojCodeNumericEnd.Value)) then
		begin
			Beep ();
			DlgEditHojCodeNumericEnd.SetFocus ();
			Exit;
		end;
	end
	else
	begin
		if	(CompareStr (DlgEditHojCodeFreeStart.Text, DlgEditHojCodeFreeEnd.Text) > 0) then
		begin
			Beep ();
			DlgEditHojCodeFreeEnd.SetFocus ();
			Exit;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040063f.fnChangeSelectionScreen (): Boolean;
begin
	if	(DlgComboBoxListKind.ItemIndex = m_nSelected) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	DlgEditHojCodeNumericStart.Value		:= 0;
	DlgEditHojCodeNumericEnd  .Value		:= 0;
	DlgEditHojCodeNumericStart.InputFlag	:= TRUE;
	DlgEditHojCodeNumericEnd  .InputFlag	:= TRUE;
	DlgEditHojCodeFreeStart   .Text			:= '';
	DlgEditHojCodeFreeEnd     .Text			:= '';
	DlgLabelHojCodeStartDesc  .Caption		:= '';
	DlgLabelHojCodeEndDesc    .Caption		:= '';

	m_nSelected	:= DlgComboBoxListKind.ItemIndex;

	if	(m_nSelected = 2) then															// 支払先登録ﾘｽﾄ(詳細)
	begin
		DlgGroupBoxCondition.Caption	:= '条件';

		DlgCheckBoxConditionOmitParent.Enabled	:= TRUE;
		DlgCheckBoxConditionOmitChild .Enabled	:= TRUE;
	end
	else
	begin
		DlgGroupBoxCondition.Caption	:= '';

		DlgCheckBoxConditionOmitParent.Checked	:= FALSE;
		DlgCheckBoxConditionOmitChild .Checked	:= FALSE;
		DlgCheckBoxConditionOmitParent.Enabled	:= FALSE;
		DlgCheckBoxConditionOmitChild .Enabled	:= FALSE;
	end;

	if	(m_nSelected = 3) then															// 名寄せ登録ﾘｽﾄ
	begin
		DlgGroupBoxOrder       .Caption	:= '';
		DlgGroupBoxHojCodeScope.Caption	:= '';

		DlgRadioButtonOrderHojCode    .Checked	:= TRUE;
		DlgRadioButtonOrderHojCode    .Enabled	:= FALSE;
		DlgRadioButtonOrderAssociation.Enabled	:= FALSE;
	end
	else
	begin
		DlgGroupBoxOrder       .Caption	:= '出力順序';
		DlgGroupBoxHojCodeScope.Caption	:= '支払先範囲';

		DlgRadioButtonOrderHojCode    .Enabled	:= TRUE;
		DlgRadioButtonOrderAssociation.Enabled	:= TRUE;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040063f.fnGetRequestHojCode (nAccessMethod: Integer): String;
var
	dqMasterData: TMQuery;
	strHojCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strHojCode	:= '';

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

		case (m_nSelected) of
			0:		SQL.Add ('AND SumKbn = 0 AND HojyoKbn2 = 1');						// 実在取引先のみ, 仕入先採用あり
			1, 3:	SQL.Add ('AND SumKbn <> 0');										// 合計取引先のみ
			2:		SQL.Add ('AND (NOT (SumKbn = 0 AND HojyoKbn2 <> 1))');				// 仕入先採用なしの実在取引先以外
		end;

		SQL.Add (' ORDER BY GCode ');

		if	(nAccessMethod = REQUEST_END) then
			SQL.ADD ('DESC');

		Open ();

		if	(not EOF) then
			strHojCode	:= FieldByName ('GCode').AsString;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= strHojCode;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040063f.fnSetDescriptionHojCode (Sender: TObject; nSetPosition: Integer): Boolean;
var
	dqMasterData  : TMQuery;
	strDescription: String;
	fReturn		  : Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strDescription	:= '';
	fReturn			:= TRUE;

	if	(m_nCodeAttribute <= 1) then
	begin
		if	((Trunc (TMNumEdit (Sender).Value) > 0) or (not TMNumEdit (Sender).InputFlag)) then
		begin
			if	(not fnGetDescriptionHojCode (Format (
										'%.10d', [Trunc (TMNumEdit (Sender).Value)]), strDescription)) then
				fReturn	:= FALSE;
		end
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

				case (m_nSelected) of
					0:		SQL.Add ('AND SumKbn = 0 AND HojyoKbn2 = 1');				// 実在取引先のみ, 仕入先採用あり
					1, 3:	SQL.Add ('AND SumKbn <> 0');								// 合計取引先のみ
					2:		SQL.Add ('AND (NOT (SumKbn = 0 AND HojyoKbn2 <> 1))');		// 仕入先採用なしの実在取引先以外
				end;

				SQL.Add (' ORDER BY GCode');

				if	(nSetPosition = 1) then												// 支払先ｺｰﾄﾞ(終了)
					SQL.Add (' DESC');

				Open ();

				if	(not EOF) then
				begin
					TMNumEdit (Sender).Value		:= StrToInt64 (FieldByName ('GCode').AsString);
					TMNumEdit (Sender).InputFlag	:= FALSE;

					strDescription	:= FieldByName ('SimpleName').AsString;
				end
				else
					TMNumEdit (Sender).Value	:= 0;
			end;
		end;
	end
	else
	begin
		if	(Trim (TMTxtEdit (Sender).Text) <> '') then
		begin
			if	(not fnGetDescriptionHojCode (TMTxtEdit (Sender).Text, strDescription)) then
				fReturn	:= FALSE;
		end
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

				case (m_nSelected) of
					0:		SQL.Add ('AND SumKbn = 0 AND HojyoKbn2 = 1');				// 実在取引先のみ, 仕入先採用あり
					1, 3:	SQL.Add ('AND SumKbn <> 0');								// 合計取引先のみ
					2:		SQL.Add ('AND (NOT (SumKbn = 0 AND HojyoKbn2 <> 1))');		// 仕入先採用なしの実在取引先以外
				end;

				SQL.Add (' ORDER BY GCode');

				if	(nSetPosition = 1) then												// 支払先ｺｰﾄﾞ(終了)
					SQL.Add (' DESC');

				Open ();

				if	(not EOF) then
				begin
					TMTxtEdit (Sender).Text	:= FieldByName ('GCode'     ).AsString;
					strDescription			:= FieldByName ('SimpleName').AsString;
				end
				else
					TMTxtEdit (Sender).Text	:= '';
			end;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	if	(nSetPosition = 0) then
		DlgLabelHojCodeStartDesc.Caption	:= strDescription
	else
		DlgLabelHojCodeEndDesc  .Caption	:= strDescription;

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040063f.fnGetDescriptionHojCode (strHojCode: String; var strDescription: String): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strDescription	:= '';

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
		SQL.Add   ('WHERE  MasterKbn = 22 AND RecordKbn = 0 AND GCode = :strHojCode ');

		case (m_nSelected) of
			0:		SQL.Add ('AND SumKbn = 0 AND HojyoKbn2 = 1');						// 実在取引先のみ, 仕入先採用あり
			1, 3:	SQL.Add ('AND SumKbn <> 0');										// 合計取引先のみ
			2:		SQL.Add ('AND (NOT (SumKbn = 0 AND HojyoKbn2 <> 1))');				// 仕入先採用なしの実在取引先以外
		end;

		ParamByName ('strHojCode').AsString	:= strHojCode;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgButtonOkOnClick (Sender: TObject);
begin
	if	(DlgRadioButtonOrderHojCode.Checked) then										// 出力順序: ｺｰﾄﾞ順
		m_nOrderDivision	:= 0
	else																				// 出力順序: 連想順
		m_nOrderDivision	:= 1;

	m_strHojCodeStr	:= '';
	m_strHojCodeEnd	:= '';

	if	(m_nCodeAttribute <= 1) then
	begin
		if	(DlgEditHojCodeNumericStart.Value <> 0) then
			m_strHojCodeStr	:= Format ('%.10d', [Trunc (DlgEditHojCodeNumericStart.Value)]);

		if	(DlgEditHojCodeNumericEnd.Value <> 0) then
			m_strHojCodeEnd	:= Format ('%.10d', [Trunc (DlgEditHojCodeNumericEnd.Value)]);
	end
	else
	begin
		m_strHojCodeStr	:= DlgEditHojCodeFreeStart.Text;
		m_strHojCodeEnd	:= DlgEditHojCodeFreeEnd  .Text;
	end;

	if	(m_strHojCodeStr = '') then
		m_strHojCodeStr	:= fnGetRequestHojCode (REQUEST_START);

	if	(m_strHojCodeEnd = '') then
		m_strHojCodeEnd	:= fnGetRequestHojCode (REQUEST_END);

	ModalResult	:= mrOK;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgEditHojCodeStartOnArrowClick (Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;

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

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DlgEditHojCodeNumericStart.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DlgEditHojCodeFreeStart.Text	:= cMasWndParam.m_ExpRetCode;

		DlgLabelHojCodeStartDesc.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF	.Term ();
	cMasWndIF	.Free ();
}
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040063f.fnDlgEditHojCodeEndOnArrowClick (Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;

begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';											// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_END);					// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;										// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;									// ｺｰﾄﾞ属性

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DlgEditHojCodeNumericEnd.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DlgEditHojCodeFreeEnd.Text	:= cMasWndParam.m_ExpRetCode;

		DlgLabelHojCodeEndDesc.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF	.Term ();
	cMasWndIF	.Free ();
}
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040063f.fnGetSQLConstruction (nAccessMethod: Integer): String;
var
	strSQLConst: String;
	strHojCode : String;

begin
	strSQLConst	:= 'MasterKbn = 22 AND RecordKbn = 0 ';

	case (m_nSelected) of
		0:		strSQLConst	:= strSQLConst + 'AND SumKbn = 0 AND HojyoKbn2 = 1';
		1, 3:	strSQLConst	:= strSQLConst + 'AND SumKbn <> 0';
		2:		strSQLConst	:= strSQLConst + 'AND (NOT (SumKbn = 0 AND HojyoKbn2 <> 1))';
	end;

	if	(nAccessMethod = REQUEST_END) then												// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
	begin
		strHojCode	:= '';

		if	(m_nCodeAttribute <= 1) then
		begin
			if	(DlgEditHojCodeNumericStart.Value <> 0) then
				strHojCode	:= Format ('%.10d', [Trunc (DlgEditHojCodeNumericStart.Value)]);
		end
		else
			strHojCode	:= DlgEditHojCodeFreeStart.Text;

		if	(strHojCode <> '') then
			strSQLConst	:= strSQLConst + ' AND GCode >= ''' + strHojCode + '''';
	end;

	Result	:= strSQLConst;
end;

end.
//***********************************************************************************************************/
//*																											*/
//*	End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

