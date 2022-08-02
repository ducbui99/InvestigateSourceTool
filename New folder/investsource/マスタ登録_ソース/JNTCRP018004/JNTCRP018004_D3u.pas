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
//	2012/02/14	HIS0002	Y.Kuroda	ShiftState対応
//************************************************************************
unit JNTCRP018004_D3u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSEdits, MJSRadioButton, MJSGroupBox, MJSComboBox, MJSLabel,
  Buttons, MJSBitBtn, VCL.ExtCtrls, MJSPanel, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client,
  MJSQuery, JNTMasComu, JNTMasWndIFu, Db, MJSCommonu
  ,MJSKeyDataState	// <HIS0002>ADD
  ;

type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  TJNTCRP018004_D3f = class(TForm)
    P_DLG: TMPanel;
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    PDLGPanel: TMPanel;
    MLabel1: TMLabel;
    DialogComboBoxListKind: TMComboBox;
    DialogGroupBoxOrder: TMGroupBox;
    DialogRadioButtonAssociation: TMRadioButton;
    DialogRadioButtonExCode: TMRadioButton;
    DialogGroupBoxScope: TMGroupBox;
    DlgLabelScopeExCodeStart: TMLabel;
    DlgLabelScopeExCodeEnd: TMLabel;
    DlgLabelScopeAddition: TMLabel;
    DialogLabelNameSimpleStart: TMLabel;
    DialogLabelNameSimpleEnd: TMLabel;
    DialogEditExCodeNumericStart: TMNumEdit;
    DialogEditExCodeNumericEnd: TMNumEdit;
    DialogLabelExCodeDescFrom: TMLabel;
    procedure FormCreate(Sender: TObject);
    procedure DialogEditExCodeNumericStartKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DialogComboBoxListKindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DialogComboBoxListKindChange(Sender: TObject);
    procedure DialogEditExCodeNumericStartExit(Sender: TObject);
    procedure DialogEditExCodeNumericEndExit(Sender: TObject);
    procedure DialogButtonOkClick(Sender: TObject);
    procedure DialogEditExCodeNumericStartArrowClick(Sender: TObject);
    procedure DialogEditExCodeNumericEndArrowClick(Sender: TObject);
    procedure DialogRadioButtonKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private 宣言 }
	m_pRec			 : ^TMjsAppRecord;						// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule    : TMDataModulef;
	m_cDBSelect      : TFDConnection;
	m_nMasterDivision: Integer;
	m_nCodeDigit     : Integer;
	m_nCodeAttribute : Integer;
	m_strItemName	 : String;
  public
    { Public 宣言 }
	m_nPrintDivision   : Integer;							// 印刷区分: 0=工種, 1=工種パターン
	m_nOrderDivision   : Integer;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr: String;							// 開始工種ｺｰﾄﾞ
	m_strExCodeScopeEnd: String;							// 終了工種ｺｰﾄﾞ
	m_intExCodeScopeStr: Integer;							// 開始工種パターンｺｰﾄﾞ
	m_intExCodeScopeEnd: Integer;							// 終了工種パターンｺｰﾄﾞ

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TFDConnection;
								 nCodeDigit: Integer; nCodeAttribute: Integer; strItemName: String);
	procedure	CMChildkey				(var Msg: TWMKey); message CM_CHILDKEY;
	function	fnChangeSelectionScreen (): Boolean;
	function	fnCodeCheck				(GCode: String): Boolean;
	function	fnCodeCheck2			(GCode: Integer): Boolean;
	procedure	fnSetDepartmentName		(nSetPosition: Integer; Sender: TObject);
	function	fnGetDepartmentName		(strExCode: String = ''; iGCode: Integer = 0): String;
	function	fnGetRequestExCode		(nAccessMethod: Integer): String;
	function	fnGetRequestExCode2		(nAccessMethod: Integer): Integer;
  end;

var
  JNTCRP018004_D3f: TJNTCRP018004_D3f;

implementation

const
	REQUEST_START	= 0;
	REQUEST_END		= 1;

{$R *.DFM}

//******************************************************************************
//
//******************************************************************************
constructor TJNTCRP018004_D3f.fnCreateDialog(pRec: Pointer; AOwner: TComponent;
  cDataModule: TMDataModulef; cDBSelect: TFDConnection; nCodeDigit,
  nCodeAttribute: Integer; strItemName: String);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= 52;
	m_nCodeDigit		:= nCodeDigit;
	m_nCodeAttribute	:= nCodeAttribute;
	m_strItemName		:= strItemName;

	inherited	Create (AOwner);
end;


//******************************************************************************
//  CMchildKey
//******************************************************************************
procedure TJNTCRP018004_D3f.CMChildkey(var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);   						// Shiftｷｰの取得 <HIS0002>MOD

	if	(Screen.ActiveControl.Name =  DialogComboBoxListKind.Name) then									// 帳票ｺﾝﾎﾞﾎﾞｯｸｽ
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


//**************************************************************************
//	Proccess	:	FormCreate
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.FormCreate(Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange (TJNTCRP018004_D3f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	DialogComboBoxListKind.Items.Add (m_strItemName + '登録リスト');
	DialogComboBoxListKind.Items.Add (m_strItemName + 'パターン登録リスト');

	m_nPrintDivision					:= 0;
	DialogComboBoxListKind.ItemIndex	:= m_nPrintDivision;

	if	(m_nCodeAttribute = 1) then
		strFormat	:= StringOfChar ('0', m_nCodeDigit)
	else
		strFormat	:= '';

	DialogEditExCodeNumericStart.FormatStr	:= strFormat;
	DialogEditExCodeNumericEnd  .FormatStr	:= strFormat;

	DialogEditExCodeNumericStart.Value		:= 0;
	DialogEditExCodeNumericEnd  .Value		:= 0;

	DialogLabelNameSimpleStart.Caption	:= '';
	DialogLabelNameSimpleEnd  .Caption	:= '';

    fnChangeSelectionScreen();

	MjsFontResize(TJNTCRP018004_D3f( Self )	,Pointer(m_pRec));
end;



//**************************************************************************
//	Proccess	:	fnChangeSelectionScreen
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnChangeSelectionScreen: Boolean;
begin
	if	(DialogComboBoxListKind.ItemIndex = m_nPrintDivision) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	DialogEditExCodeNumericStart.Value		:= 0;
	DialogEditExCodeNumericEnd  .Value		:= 0;
	DialogLabelNameSimpleStart  .Caption	:= '';
	DialogLabelNameSimpleEnd    .Caption	:= '';


    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
        DialogRadioButtonAssociation.Enabled            := True;

        if m_nCodeAttribute  = 0 then
        begin
            DialogEditExCodeNumericStart.FormatStr      := '';
            DialogEditExCodeNumericEnd.FormatStr        := '';
        end
        else
        begin
            DialogEditExCodeNumericStart.FormatStr      := StringOfChar ('0', m_nCodeDigit);
            DialogEditExCodeNumericEnd.FormatStr        := StringOfChar ('0', m_nCodeDigit);
        end;

        DialogEditExCodeNumericStart.InputFlag          := True;
        DialogEditExCodeNumericStart.InputFlagEnabled   := True;
        DialogEditExCodeNumericStart.Zero               := True;

        DialogEditExCodeNumericEnd.InputFlag            := True;
        DialogEditExCodeNumericEnd.InputFlagEnabled     := True;
        DialogEditExCodeNumericEnd.Zero                 := True;
    end
    //工種パターン登録
    else
    begin
        DialogRadioButtonAssociation.Enabled            := False;

        DialogEditExCodeNumericStart.FormatStr          := '';
        DialogEditExCodeNumericEnd.FormatStr            := '';

        DialogEditExCodeNumericStart.InputFlag          := False;
        DialogEditExCodeNumericStart.InputFlagEnabled   := False;
        DialogEditExCodeNumericStart.Zero               := False;

        DialogEditExCodeNumericEnd.InputFlag            := False;
        DialogEditExCodeNumericEnd.InputFlagEnabled     := False;
        DialogEditExCodeNumericEnd.Zero                 := False;
    end;

	m_nPrintDivision	:= DialogComboBoxListKind.ItemIndex;

	Result	:= TRUE;
end;



//**************************************************************************
//	Proccess	:	DialogEditExCodeNumericStartKeyDown
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogEditExCodeNumericStartKeyDown(Sender: TObject;
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
	else if (GetKeyState(VK_MENU) < 0) and (Key = VK_DOWN) then
	begin
    	Exit;
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



//**************************************************************************
//	Proccess	:	DialogComboBoxListKindKeyDown
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogComboBoxListKindKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	cComboBox: TMComboBox;

begin
	cComboBox	:= Sender as TMComboBox;

	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
		Abort;
	end;

	if	(Key = VK_LEFT) then
	begin
		if	(cComboBox.ItemIndex = 0) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;

		Exit;
	end;

	if	(Key = VK_RIGHT) then 					   
	begin
		if	(cComboBox.ItemIndex = cComboBox.Items.Count - 1) then
		begin
			MJSDispCtrl.MjsNextCtrl (Self);
			Abort;
		end;

        Exit;
	end;
end;



//**************************************************************************
//	Proccess	:	DialogComboBoxListKindChange
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogComboBoxListKindChange(Sender: TObject);
begin
	fnChangeSelectionScreen ();
end;


//**************************************************************************
//	Proccess	:	開始コードExit
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogEditExCodeNumericStartExit(Sender: TObject);
var
	sGCode	:	String;
    iGCode  :   Integer;
begin
    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
		if DialogEditExCodeNumericStart.Text <> '' then
    		sGCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumericStart.Value)])
        else
            sGCode  := '';

    	if sGCode <> '' then
	    begin
		    if fnCodeCheck(sGCode) = False then
    		begin
	    		beep;
    	  		DialogEditExCodeNumericStart.SetFocus;
            end;
	    end;
    end
    //工種パターン登録
    else
    begin
        if DialogEditExCodeNumericStart.Text <> '' then
            iGCode  := Trunc(DialogEditExCodeNumericStart.Value)
        else
            iGCode  := 0;

        if iGCode <> 0 then
        begin
            if fnCodeCheck2(iGCode) = False then
            begin
    	    	beep;
   	  		    DialogEditExCodeNumericStart.SetFocus;
            end;
        end;
    end;

	fnSetDepartmentName (0, Sender);
end;



//**************************************************************************
//	Proccess	:	工種コードチェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnCodeCheck(GCode: String): Boolean;
var
	dqMasterData	:	TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with dqMasterData do
	begin
        SQL.Add('select GCode from HojyoMA ');
		SQL.Add('where MasterKbn = 52      ');
		SQL.Add('and   RDelKbn = 0       ');
		SQL.Add('and   GCode     = :GCode     ');
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



//**************************************************************************
//	Proccess	:	工種パターンコードチェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnCodeCheck2(GCode: Integer): Boolean;
var
	dqMasterData	:	TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with dqMasterData do
	begin
        SQL.Add('select GCode from KousyuPtn ');
		SQL.Add('where PtnNo = :PtnNo        ');
		SQL.Add('and   GCode = ''''          ');
		ParamByName('PtnNo').AsInteger  := GCode;

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



//**************************************************************************
//	Proccess	:	コード名称取得
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.fnSetDepartmentName(nSetPosition: Integer;
  Sender: TObject);
var
	dqMasterData	 : TMQuery;
	cNumEditBox		 : TMNumEdit;
	strDepartmentName: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	strDepartmentName	:= '';

    //工種登録
	if DialogComboBoxListKind.ItemIndex = 0 then
	begin
		cNumEditBox	:= Sender as TMNumEdit;

		if	((Trunc (cNumEditBox.Value) > 0) or (not cNumEditBox.InputFlag)) then
			strDepartmentName	:= fnGetDepartmentName (Format ('%.16d', [Trunc (cNumEditBox.Value)]), 0)
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, SimpleName FROM HojyoMA ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RDelKbn = 0 ');
				SQL.Add   ('ORDER BY GCode');

				if	(nSetPosition = 1) then
					SQL.Add (' DESC');

				ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

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
    //工種パターン登録
    else
    begin
		cNumEditBox	:= Sender as TMNumEdit;

		if (Trunc (cNumEditBox.Value) > 0) then
			strDepartmentName	:= fnGetDepartmentName ('', Trunc (cNumEditBox.Value))
		else
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT PtnNo, PtnName FROM KousyuPtn ');
                SQL.Add   ('WHERE  GCode = ''''           ');
				SQL.Add   ('ORDER  BY PtnNo');

				if	(nSetPosition = 1) then
					SQL.Add (' DESC');

				Open ();

				if	(not EOF) then
				begin
					cNumEditBox.Value		:= StrToInt64 (FieldByName ('PtnNO').AsString);
					cNumEditBox.InputFlag	:= FALSE;
					strDepartmentName		:= FieldByName ('PtnName').AsString;
				end
				else
					cNumEditBox.Value	:= 0;
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




//**************************************************************************
//	Proccess	:	コード名称取得
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnGetDepartmentName(strExCode: String; iGCode: Integer): String;
var
	dqMasterData	 : TMQuery;
	strDepartmentName: String;
begin
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
        if strExCode <> '' then
        begin
    		Close ();

	    	SQL.Clear;
		    SQL.ADD ('SELECT SimpleName FROM HojyoMA ');
    		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and SumKbn = 0 and GCode = :strExCode and RDelKbn = 0');

    		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
	    	ParamByName ('strExCode'      ).AsString	:= strExCode;

		    Open ();

    		if	(not EOF) then
	    		strDepartmentName	:= FieldByName ('SimpleName').AsString;
        end
        else
        begin
            Close ();

            SQL.Clear;
            SQL.Add('SELECT PtnName FROM KousyuPtn ');
            SQL.Add('WHERE  PtnNo = :PtnNo         ');
            SQL.Add('AND    GCode = ''''           ');

            ParamByName('PtnNo').AsInteger  := iGCode;

            Open;

            if (not EOF) then
                strDepartmentName   := FieldByName('PtnName').AsString;
        end;

		Close ();
	end;

	Result	:= strDepartmentName;
end;




//**************************************************************************
//	Proccess	:	終了コードExit
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogEditExCodeNumericEndExit(Sender: TObject);
var
	sGCode	:	String;
    iGCode  :   Integer;
begin
    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
		if DialogEditExCodeNumericEnd.Text <> '' then
			sGCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumericEnd.Value)])
		else
			sGCode	:= '';

    	if sGCode <> '' then
	    begin
		    if fnCodeCheck(sGCode) = False then
    		begin
	    		beep;
   	  		    DialogEditExCodeNumericEnd.SetFocus;
	        end;
    	end;
    end
    //工種パターン登録
    else
    begin
		if DialogEditExCodeNumericEnd.Text <> '' then
			iGCode	:= Trunc(DialogEditExCodeNumericEnd.Value)
		else
			iGCode	:= 0;

    	if iGCode <> 0 then
	    begin
		    if fnCodeCheck2(iGCode) = False then
    		begin
	    		beep;
   	  		    DialogEditExCodeNumericEnd.SetFocus;
	        end;
    	end;
    end;

	fnSetDepartmentName (1, Sender);

	if DialogRadioButtonExCode.Checked = True then
	begin
		if	(Trunc (DialogEditExCodeNumericStart.Value) > Trunc (DialogEditExCodeNumericEnd.Value)) then
		begin
			Beep ();
			DialogEditExCodeNumericEnd.SetFocus ();
			Exit;
		end;
	end;
end;




//**************************************************************************
//	Proccess	:	工種コード取得
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnGetRequestExCode(nAccessMethod: Integer): String;
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
		SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn = 0 and RDelKbn = 0 ');
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



//**************************************************************************
//	Proccess	:	工種パターンコード取得
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004_D3f.fnGetRequestExCode2(nAccessMethod: Integer): Integer;
var
	dqMasterData: TMQuery;
	intExCode	: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT PtnNo FROM KousyuPtn ');
        SQL.Add ('WHERE  GCode = ''''         ');
		SQL.ADD ('ORDER  BY PtnNo             ');

		if	(nAccessMethod = REQUEST_END) then
			SQL.ADD ('DESC');

		Open ();

		if	(not EOF) then
			intExCode	:= FieldByName ('PtnNo').AsInteger
        else
			intExCode	:= 0;

		Close ();
	end;

	result	:= intExCode;
end;



//**************************************************************************
//	Proccess	:	OKボタンが押された時
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogButtonOkClick(Sender: TObject);
begin
	if	(DialogRadioButtonExCode.Checked) then									// 出力順序: ｺｰﾄﾞ順
		m_nOrderDivision	:= 0
	else																		// 出力順序: 連想順
		m_nOrderDivision	:= 1;

	m_strExCodeScopeStr	:= '';
	m_strExCodeScopeEnd	:= '';

    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
    	if	(DialogEditExCodeNumericStart.Value <> 0) then
	    	m_strExCodeScopeStr	:= Format ('%.16d', [Trunc (DialogEditExCodeNumericStart.Value)]);

    	if	(DialogEditExCodeNumericEnd.Value <> 0) then
	    	m_strExCodeScopeEnd	:= Format ('%.16d', [Trunc (DialogEditExCodeNumericEnd.Value)]);

    	if	(m_strExCodeScopeStr = '') then
	    	m_strExCodeScopeStr	:= fnGetRequestExCode (REQUEST_START);

    	if	(m_strExCodeScopeEnd = '') then
	    	m_strExCodeScopeEnd	:= fnGetRequestExCode (REQUEST_END);
    end
    //工種パターン登録
    else
    begin
    	if	(DialogEditExCodeNumericStart.Value <> 0) then
            m_intExCodeScopeStr := Trunc (DialogEditExCodeNumericStart.Value);

    	if	(DialogEditExCodeNumericEnd.Value <> 0) then
            m_intExCodeScopeEnd := Trunc (DialogEditExCodeNumericEnd.Value);

    	if	(m_intExCodeScopeStr = 0) then
	    	m_intExCodeScopeStr	:= fnGetRequestExCode2(REQUEST_START);

    	if	(m_intExCodeScopeEnd = 0) then
	    	m_intExCodeScopeEnd	:= fnGetRequestExCode2(REQUEST_END);
    end;


	ModalResult	:= mrOK;
end;



//**************************************************************************
//	Proccess	:	開始コード検索Exp
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogEditExCodeNumericStartArrowClick(
  Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;
//    sSQL        : String;
begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
    	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_RenCharFD	:= 'Renso';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
        cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
    	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
        sSQL                        := sSQL + 'MasterKbn = 52 and ';
        sSQL                        := sSQL + 'RDelKbn = 0';
	    cMasWndParam.m_SQL_Where	:= sSQL;                                    // Where句の条件
    	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	    cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
    	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性
    end
    //工種パターン登録
    else
    begin
    	cMasWndParam.m_GCodeFD		:= 'PtnNo';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_RenCharFD	:= '';								        // 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
        cMasWndParam.m_SimpleNameFD	:= 'PtnName';							    // 簡略名称  ﾌｨｰﾙﾄﾞ名
    	cMasWndParam.m_TableName	:= 'KousyuPtn';								// ﾃｰﾌﾞﾙ名
        sSQL                        := sSQL + 'GCode = ''''';
	    cMasWndParam.m_SQL_Where	:= sSQL;    	                            // Where句の条件
    	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	    cMasWndParam.m_iCodeLength	:= 6;							            // ｺｰﾄﾞ桁数
    	cMasWndParam.m_iCodeAttr	:= 0;						                // ｺｰﾄﾞ属性
    end;

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		DialogEditExCodeNumericStart.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode));
		DialogLabelNameSimpleStart.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;


//**************************************************************************
//	Proccess	:	終了コード検索Exp
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogEditExCodeNumericEndArrowClick(
  Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;
//    sSQL        : String;
//    strExCode   : String;
begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

    //工種登録
    if DialogComboBoxListKind.ItemIndex = 0 then
    begin
    	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_RenCharFD	:= 'Renso';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
    	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
    	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名

        sSQL                        := sSQL + 'MasterKbn = 52 and ';
        sSQL                        := sSQL + 'RDelKbn = 0';

		if	(DialogEditExCodeNumericStart.Value <> 0) then
			strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumericStart.Value)]);

		if	(strExCode <> '') then
			sSQL	                := sSQL + ' AND GCode >= ''' + strExCode + '''';

	    cMasWndParam.m_SQL_Where	:= sSQL;		                            // Where句の条件
	    cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
    	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	    cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性
    end
    //工種パターン登録
    else
    begin
    	cMasWndParam.m_GCodeFD		:= 'PtnNo';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_RenCharFD	:= '';								        // 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
        cMasWndParam.m_SimpleNameFD	:= 'PtnName';							    // 簡略名称  ﾌｨｰﾙﾄﾞ名
    	cMasWndParam.m_TableName	:= 'KousyuPtn';								// ﾃｰﾌﾞﾙ名

        sSQL                        := sSQL + 'GCode = '''' ';                            

		if	(DialogEditExCodeNumericStart.Value <> 0) then
			strExCode	:= IntToStr(Trunc (DialogEditExCodeNumericStart.Value));

		if	(strExCode <> '') then
			sSQL	                := sSQL + 'AND PtnNo >= ''' + strExCode + '''';

	    cMasWndParam.m_SQL_Where	:= sSQL;	                                // Where句の条件
    	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	    cMasWndParam.m_iCodeLength	:= 6;							            // ｺｰﾄﾞ桁数
    	cMasWndParam.m_iCodeAttr	:= 0;						                // ｺｰﾄﾞ属性
    end;

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		DialogEditExCodeNumericEnd.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode));
		DialogLabelNameSimpleEnd.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;


//**************************************************************************
//	Proccess	:	DialogRadioButtonKeyDown
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/15
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004_D3f.DialogRadioButtonKeyDown(Sender: TObject;
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
	else if (GetKeyState(VK_MENU) < 0) and (Key = VK_DOWN) then
	begin
    	Exit;
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

end.
