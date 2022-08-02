//******************************************************************************
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*		2002/05/01	HIS0001	Y.Ichihashi	Alt+↓を押されたときにﾌｫｰｶｽ移動しないで
//*										検索ｴｸｽﾌﾟﾛｰﾗを表示するように修正
//*		2002/06/25	HIS0002	Y.Ichihashi 科目連想リストの摘要コード順を追加
//*		2002/06/25	HIS0003	Y.Ichihashi	HIS0002を追加のため一覧表のIndexが変更
//*		2002/11/01	HIS0004	Y.Ichihashi	科目連想リスト（連想順）を追加
//*		2002/11/25	HIS0005	Y.Ichihashi	検索エクスプローラでの連想順表示
//*		2002/11/29	HIS0006	y.Ichihashi	開始・終了摘要の連想順に対応
//============================== Ver4.08 修正 Start ============================
//*		2012/02/01	Shift	T.Ogawa(LEAD)	KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//******************************************************************************
unit JNTCRP020101u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSComboBox, MJSLabel, MJSEdits, VCL.ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery,
  JNTMasComu, MJSGroupBox, JNTMasWndIFu, Db, MJSCommonu
  ,MJSKeyDataState  //<Shift> ADD
  ;

type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  TJNTCRP020101f = class(TForm)
    P_DLG: TMPanel;
    B_Set: TMBitBtn;
    B_Torikesi: TMBitBtn;
    PDLGPanel: TMPanel;
    MLabel1: TMLabel;
    MDLGComboBox: TMComboBox;
    DlgGroupBoxOrder: TMGroupBox;
    BRen: TMRadioButton;
    DlgGroupBoxScope: TMGroupBox;
    DlgLabelScopeExCodeStart: TMLabel;
    DlgLabelScopeExCodeEnd: TMLabel;
    EStart: TMNumEdit;
    EEnd: TMNumEdit;
    DlgLabelScopeAddition: TMLabel;
    LStartName: TMLabel;
    LEndName: TMLabel;
    BCode: TMRadioButton;
    procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
    procedure B_SetClick(Sender: TObject);
    procedure B_TorikesiClick(Sender: TObject);
    procedure MDLGComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure MDLGComboBoxChange(Sender: TObject);
    procedure BCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BRenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BCodeClick(Sender: TObject);
    procedure BRenClick(Sender: TObject);
    procedure EStartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EEndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EStartExit(Sender: TObject);
    procedure EEndExit(Sender: TObject);
    procedure EStartArrowClick(Sender: TObject);
    procedure EEndArrowClick(Sender: TObject);
    procedure FnJNTCRP020101fOnShow(Sender: TObject);
  private
    { Private 宣言 }
    FlagR   : Boolean;
    RFlag   : Boolean;
  public
    { Public 宣言 }
	MDataModule		: TMDataModulef;
	dbCorp_Select	: TFDConnection;
	pComArea		: ^TMjsAppRecord;
	ComArea			: TJNTMASCom;
	iPrint          : Integer;								// 印刷区分: 0=固定摘要登録リスト
                                                            //           1=仕訳辞書摘要登録リスト
			                                                //           2=固定摘要分類登録リスト
                                                            //           3=固定摘要分類体系リスト
                                                            //           4=科目連想リスト

	m_iJnSitei  : Integer;									// 出力指定　0=コード順, 1=連想順
	m_iHnSitei	: Integer;									// 範囲指定: 0=なし, 1=あり
	m_iStart  : Integer;							            // 開始外部ｺｰﾄﾞ
	m_iEnd    : Integer;										// 終了外部ｺｰﾄﾞ

	procedure EArrow();
  end;

var
  JNTCRP020101f: TJNTCRP020101f;

implementation

{$R *.DFM}

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   fnMas220101fOnCreate
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.FormCreate(Sender: TObject);
begin
    //ComboBoxにリスト名を入れる
	LStartName.Caption := '';
	LEndName.Caption   := '';

    MDLGComboBox.Items.Add ('固定摘要登録リスト');
	MDLGComboBox.Items.Add ('仕訳辞書摘要登録リスト');
	MDLGComboBox.Items.Add ('固定摘要分類登録リスト');
	MDLGComboBox.Items.Add ('固定摘要体系登録リスト');
	MDLGComboBox.Items.Add ('科目連想リスト(科目順)');
	MDLGComboBox.Items.Add ('科目連想リスト(摘要順)');		//HIS0002
	MDLGComboBox.Items.Add ('固定摘要一覧表');

	iPrint					:= 0;
	MDLGComboBox.ItemIndex	:= iPrint;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   fnDialogComboBoxListKindOnChange
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.MDLGComboBoxChange(Sender: TObject);
var
	icode : Integer;
begin
    icode := MDLGComboBox.ItemIndex;

	iPrint	:= icode;

    //固定摘要登録リスト、仕訳辞書登録リスト、摘要分類登録リストの時、連想順はtrue
//    if (iPrint = 0) or (iPrint = 1) or (iPrint = 2) then
	if (iPrint = 0) or (iPrint = 1) or (iPrint = 2) or (iPrint = 5) then	//HIS0004
	begin
		BRen.Enabled 		:= true;
		BRen.Font.Color 	:= clBtnText;
		BCode.Font.Color	:= clWindowText;	//HIS0004
		BCode.Checked		:= true;			//HIS0004
		BRen.Checked		:= false;			//HIS0004
	end
	// 摘要体系登録リスト、科目連想登録リストの時、連想順はfalse
//	else if ((iPrint = 3) or (iPrint = 4) or (iPrint = 5) or (iPrint = 6)) then	//HIS0002
	else if ((iPrint = 3) or (iPrint = 4) or (iPrint = 6)) then	//HIS0002
	begin
        BRen.Enabled		:= false;
		BRen.Font.Color 	:= clBtnFace;
		BCode.Font.Color	:= clWindowText;	//HIS0004
		BCode.Checked		:= true;			//HIS0004
		BRen.Checked		:= false;			//HIS0004
	end;

//	if	(iPrint = 5) then
	if 	(iPrint = 6) then		//HIS0003
	begin
		DlgGroupBoxOrder        .Caption	:= '';
		DlgGroupBoxScope        .Caption	:= '';
		DlgLabelScopeExCodeStart.Enabled	:= false;
		DlgLabelScopeExCodeEnd  .Enabled	:= false;
		DlgLabelScopeAddition   .Enabled	:= false;
		BCode                   .Enabled	:= false;
		EStart                  .Enabled	:= false;
		EEnd                    .Enabled	:= false;
		EStart                  .Color		:= clBtnFace;
		EEnd                    .Color		:= clBtnFace;
	end
	else
	begin
		DlgGroupBoxOrder        .Caption	:= '出力順序';
		DlgGroupBoxScope        .Caption	:= '範囲';
		DlgLabelScopeExCodeStart.Enabled	:= true;
		DlgLabelScopeExCodeEnd  .Enabled	:= true;
		DlgLabelScopeAddition   .Enabled	:= true;
		BCode                   .Enabled	:= true;
		EStart                  .Enabled	:= true;
		EEnd                    .Enabled	:= true;
		EStart                  .Color		:= clWindow;
		EEnd                    .Color		:= clWindow;
	end;
end;


//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   MDLGComboBoxKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.MDLGComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if  (Key = VK_Return)   then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
	end
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   BCodeKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.BCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if  (Key = VK_Return)   then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
	end
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   BCodeClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.BCodeClick(Sender: TObject);
begin
    //コード順の時は連想順をfalse
    BCode.Checked := true;
	BRen.Checked  := false;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   BRenKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.BRenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if  (Key = VK_Return)   then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
	end
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   BRenClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.BRenClick(Sender: TObject);
begin
    //連想順の時はコード順をfalse
    BCode.Checked := false;
	BRen.Checked  := true;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EStartKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020101f.EStartKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EEndKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020101f.EEndKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   B_SetClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.B_SetClick(Sender: TObject);
begin
    iPrint := MDLGComboBox.ItemIndex;

	//2002/12/02
	EStartExit(Sender);
	EEndExit(Sender);

    //固定摘要登録リスト、仕訳辞書登録リスト、摘要分類登録リスト
//	if (iPrint = 0) or (iPrint = 1) or (iPrint = 2) then
	if (iPrint = 0) or (iPrint = 1) or (iPrint = 2) or (iPrint = 5) then	//HIS0004
	begin
		if Bcode.Checked = true then
		begin
			m_iJnSitei := 0; //コード順の時
		end
		else if BRen.Checked = true then
		begin
			m_iJnSitei := 1; //連想順の時
		end;
	end
    //固定摘要体系登録リスト、科目連想リスト(科目順)、科目連想リスト(摘要順)
//	else if (iPrint = 3) or (iPrint = 4) or (iPrint = 5) then		//HIS0002
	else if (iPrint = 3) or (iPrint = 4) then		//HIS0002
    begin
		m_iJnSitei := 0; //固定摘要体系登録リスト、科目連想リストの時はコード順のみ
	end

//HIS0004
	else if (iPrint = 6) then
	begin
		m_iJnSitei	:= 1;
	end;


    //開始コードと終了コードがない時（０の時）
	if (EStart.Value = 0) and (EEnd.Value = 0) then
	begin
    	m_iHnSitei := 0;
	end
	else
	begin
		m_iHnSitei := 1;
	end;

    ModalResult := mrOk;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   B_TorikesiClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.B_TorikesiClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   CMChildKey
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.CMChildKey(var Msg: TWMKey);
var
	cShiftState: TShiftState;
begin
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得  <Shift> ADD

    if ((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then							// Esc
		ModalResult := mrCancel;

	if	(Screen.ActiveControl.Name = B_Set.Name) then									// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

	if	(Screen.ActiveControl.Name = B_Torikesi.Name) then								// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			MDLGComboBox.SetFocus ();
			Abort;
		end;
	end;

	inherited;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EStartExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.EStartExit(Sender: TObject);
var
	dqMasterData: TMQuery;

begin
    //開始コードが入力されてEnterを押された時
	dqMasterData	:= TMQuery.Create (Self);									// MQueryの構築
	MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);

	FlagR	:= false;

    //固定摘要登録リスト、仕訳辞書登録リスト、摘要分類リスト、固定摘要体系リストのときコードと名前を取得
	if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or
		 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or
		 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or (MDLGComboBox.ItemINdex = 5)) then	//HIS0002
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT TekiChar FROM TekiMA ');
			SQL.Add   ('WHERE  MasterKbn = 61 AND RecordKbn = 0 AND SumKbn = :nDivision AND GCode = :nExCode');

			if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
				ParamByName ('nDivision').AsInteger	:= 0
			else if	((MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3)) then
				ParamByName ('nDivision').AsInteger	:= 1;

			ParamByName ('nExCode').AsInteger	:= Trunc (EStart.Value);

			Open ();

	        if	(not EOF) then
				FlagR	:= true;
		end;
	end
	else if	(MDLGComboBox.ItemIndex = 4) then									// 科目連想の時ｺｰﾄﾞと名前を取得
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT LongName FROM KmkMA ');
			SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RecordKbn = 0 AND GCode = :nExCode');

			ParamByName ('nExCode').AsInteger	:= Trunc (EStart.Value);

			Open ();

	        if	(not EOF) then
				FlagR	:= true;
		end;
	end;

	if	(Trunc (EStart.Value) <> 0) then
	begin
		if	(FlagR) then
		begin
			if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or
				 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
				LStartName.Caption	:= dqMasterData.FieldByName ('TekiChar').AsString
            else
				LStartName.Caption	:= dqMasterData.FieldByName ('LongName').AsString;
		end
		else
			EStart.SetFocus ();
	end
	else
	begin
		if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1)  or		//HIS0002
			 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or (MDLGComboBox.ItemIndex = 5)) then
		begin
			with (dqMasterData) do
			begin
				SQL.Clear ();
				SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA WHERE MasterKbn = 61 ');

//				if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1)) then
//				if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
				if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or
                     (MDLGComboBox.ItemIndex = 5) or (MDLGComboBox.ItemIndex = 6)) then	//HIS0004
					SQL.Add ('AND SumKbn = 0 ')
				else if	((MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3)) then
		    	    SQL.Add ('AND SumKbn = 1 ');

                SQL.Add ('AND RecordKbn = 0 ORDER BY GCode');

{				//HIS0006
				if BCode.Checked = true then
					SQL.Add ('AND RecordKbn = 0 ORDER BY GCode')
				else
					SQL.Add ('AND RecordKbn = 0 ORDER BY RenChar ');
}
				Open ();

				if	(not EOF) then
				begin
					EStart    .Value	:= FieldByName ('GCode'   ).AsInteger;
					LStartName.Caption	:= FieldByName ('TekiChar').AsString;
				end
				else
					LStartName.Caption	:= '';
			end;
		end
		else if	(MDLGComboBox.ItemIndex = 4) then
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, LongName FROM KmkMA ');
				SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RecordKbn = 0 ORDER BY GCode');

				Open ();

		        if	(not EOF) then
				begin
					EStart    .Value	:= FieldByName ('GCode'   ).AsInteger;
					LStartName.Caption	:= FieldByName ('LongName').AsString;
				end
				else
					LStartName.Caption	:= '';
			end;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_iStart	:= Trunc (EStart.Value);
end;


//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EEndExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.EEndExit(Sender: TObject);
var
	dqMasterData: TMQuery;

begin
    //終了コードが入力されてEnterを押された時
	dqMasterData	:= TMQuery.Create (Self);									// MQueryの構築
	MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);

	RFlag	:= false;

    //終了コードが開始コードより小さい時
	if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or
		 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
    //固定摘要登録リスト、仕訳辞書登録リスト、摘要分類リスト、固定摘要体系リストのときコードと名前を取得
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT TekiChar FROM TekiMA ');
			SQL.Add   ('WHERE  MasterKbn = 61 AND RecordKbn = 0 AND SumKbn = :nDivision AND GCode = :nExCode');

//			if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1)) then
			if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
				ParamByName ('nDivision').AsInteger	:= 0
			else if	((MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3)) then
				ParamByName ('nDivision').AsInteger	:= 1;

			ParamByName ('nExCode').AsInteger	:= Trunc (EEnd.Value);

			Open ();

			if	(not EOF) then
				RFlag	:= true;
		end;
	end
	else if	(MDLGComboBox.ItemIndex = 4) then									// 科目連想の時ｺｰﾄﾞと名前を取得
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT LongName FROM KmkMA ');
			SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RecordKbn = 0 AND GCode = :nExCode');

			ParamByName ('nExCode').AsInteger	:= Trunc (EEnd.Value);

			Open ();

			if	(not EOF) then
				RFlag	:= true;
        end;
	end;

	if	(Trunc (EEnd.Value) <> 0) then
	begin
		if	(RFlag) then
		begin
			if	(MDLGComboBox.ItemIndex <> 4) then
				LEndName.Caption	:= dqMasterData.FieldByName ('TekiChar').AsString
			else
				LEndName.Caption	:= dqMasterData.FieldByName ('LongName').AsString;
        end
        else
			EEnd.SetFocus ();
	end
	else
	begin
		if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or		//HIS0002
			 (MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3) or (MDLGComboBox.ItemIndex = 5)) then
		begin
			with (dqMasterData) do
			begin
				SQL.Clear ();
				SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA');
				SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nDivision AND RecordKbn = 0 ');
//				SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nDivision AND RecordKbn = 0 ORDER BY GCode DESC');
				SQL.Add ('ORDER BY GCode DESC ');

{				//HIS0006
              	if BCode.Checked = true then
					SQL.Add ('ORDER BY GCode DESC ')
				else
					SQL.Add ('ORDER BY RenChar DESC ');
}
				if	((MDLGComboBox.ItemIndex = 0) or (MDLGComboBox.ItemIndex = 1) or (MDLGComboBox.ItemIndex = 5)) then	//HIS0002
					ParamByName ('nDivision').AsInteger	:= 0
				else if	((MDLGComboBox.ItemIndex = 2) or (MDLGComboBox.ItemIndex = 3)) then
					ParamByName ('nDivision').AsInteger	:= 1;

				Open ();

				if	(not EOF) then
				begin
					EEnd    .Value		:= FieldByName ('GCode'   ).AsInteger;
					LEndName.Caption	:= FieldByName ('TekiChar').AsString;
				end
				else
					LEndName.Caption	:= '';
			end;
		end
		else if	(MDLGComboBox.ItemIndex = 4) then
		begin
			with (dqMasterData) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT GCode, LongName FROM KmkMA ');
				SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RecordKbn = 0 ORDER BY GCode DESC');

				Open ();

		        if	(not EOF) then
				begin
					EEnd    .Value		:= FieldByName ('GCode'   ).AsInteger;
					LEndName.Caption	:= FieldByName ('LongName').AsString;
				end
				else
					LEndName.Caption	:= '';
			end;
		end;
	end;

    //終了コードが開始コードより大きい時
	if BCode.Checked = true then
	begin
		if	(Trunc (EStart.Value) > Trunc (EEnd.Value)) then
			EEnd.SetFocus ();
	end;
//	if	(Trunc (EStart.Value) > Trunc (EEnd.Value)) then
//		EEnd.SetFocus ();

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_iEnd	:= Trunc (EEnd.Value);
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EStartArrowClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.EStartArrowClick(Sender: TObject);
begin
    //検索エクスプローラ
    EArrow();
//    EStartExit(Sender);
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EEndArrowClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.EEndArrowClick(Sender: TObject);
begin
    //検索エクスプローラ
    EArrow();
//    EEndExit(Sender);
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   EEndExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020101f.EArrow;
//<HIS0078 start>
//var
//	MasWndParam :	TJNTMasWndParam;
//	Wnd			:	TJNTMasWndIF;
//	sSQL		:	String;
//<HIS0078 end>
begin
{
    //検索エクスプローラを表示
    if (MDLGComboBox.ItemIndex <> 4) then //固定摘要、仕訳辞書摘要、摘要分類、摘要体系の時
	begin
	    //初期処理
    	Wnd := TJNTMasWndIF.Create();
		Wnd.Init( pointer ( pComArea ) );

		MasWndParam 						:= TJNTMasWndParam.CreateParam();
		MasWndParam.m_GCodeFD				:= 'GCode';   //コードフィールド名
    	MasWndParam.m_RenCharFD				:= 'RenChar'; //連想フィールド名
		MasWndParam.m_SimpleNameFD  		:= 'TekiChar';//摘要フィールド名
		MasWndParam.m_TableName				:= 'TekiMA';  //テーブル名

//		if BRen.Checked = true then
//			MasWndParam.m_SQL_Order         := 'RenChar'; //ソート				//HIS0005

		case MDLGComboBox.ItemIndex of
			0,1,5,6: sSQL := 'Masterkbn = 61 and Recordkbn = 0 and Sumkbn = 0 ';
			else	 sSQL := 'Masterkbn = 61 and Recordkbn = 0 and Sumkbn = 1 ';
		end;

		MasWndParam.m_SQL_Where 			:= sSQL;// Where句の条件
    	MasWndParam.m_pApRec 				:= pointer( pComArea );//ApRecのポインタ
		MasWndParam. m_iCodeLength 			:= 8;//　6桁//コード桁数
		MasWndParam. m_iCodeAttr 			:= 0;//　前０なし数字//コード属性
	end
	else  //科目連想登録リスト
	begin
        Wnd := TJNTMasWndIF.Create();
		Wnd.Init( pointer ( pComArea ) );

		MasWndParam 						:= TJNTMasWndParam.CreateParam();
		MasWndParam.m_GCodeFD				:= 'GCode';     //コードフィールド名
    	MasWndParam.m_RenCharFD				:= 'RenChar';   //連想フィールド名
		MasWndParam.m_SimpleNameFD  		:= 'SimpleName';// 簡略名フィールド名
		MasWndParam.m_TableName				:= 'kmkma';     // テーブル名
		MasWndParam.m_SQL_Where 			:= 'Masterkbn = 1 and Sumkbn = 0 and Recordkbn = 0';// Where句の条件
    	MasWndParam.m_pApRec 				:= pointer( pComArea );//ApRecのポインタ
		MasWndParam. m_iCodeLength 			:= 6;//　6桁//コード桁数
		MasWndParam. m_iCodeAttr 			:= 0;//　前０なし数字//コード属性
	end;

    If Wnd.DoDlg(MasWndParam) = mrOk then
	begin
		if (MasWndParam.m_ExpRetCode = '') then
		begin
			Exit;
		end
		else
		begin
            if EStart.Focused then
			    EStart.Value := StrToInt(MasWndParam.m_ExpRetCode)
			else
	            EEnd.Value   := StrToInt(MasWndParam.m_ExpRetCode);
   	    end;

		MjsDispCtrl.MjsNextCtrl (Self);
   	end;
	MasWndParam.Free();

	//終了処理
	Wnd.Term();
   	Wnd.Free();
}
end;

procedure TJNTCRP020101f.FnJNTCRP020101fOnShow(Sender: TObject);
begin
	MJSColorChange (TJNTCRP020101f (Self), 0, 0, 0, 0, rcCOMMONAREA (pComArea^.m_pCommonArea^).SysFocusColor);
end;

end.


