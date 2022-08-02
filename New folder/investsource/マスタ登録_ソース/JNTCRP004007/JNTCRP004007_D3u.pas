//************************************************************************
//*
//*     Systeme         :   支払情報登録
//*     Program         :   印刷選択ダイアログ
//*     ProgramID       :   JNTCRP004007_D3u
//*     Name            :   H.Endo
//*     Create          :   2003/11/14
//*     Comment         :   XXXXXXXXXXXXXXXXXXXXXX
//*     History         :   XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//		2005/01/18 H.Endo(MJS)
//		<#1>  解像度対応
//************************************************************************
unit JNTCRP004007_D3u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSComboBox, MJSLabel, MJSEdits, VCL.ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery,

  JNTMasWndIFu,
  MJSKeyDataState,		// <KDS> ADD

  MJSGroupBox, MJSCommonu, MJSCheckBox;

type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  TJNTCRP004007_D3f = class(TForm)
    MPanel1: TMPanel;
    DlgGroupBoxOrder: TMGroupBox;
    DlgRBtnOrderHojCD: TMRadioButton;
    DlgRBtnOrderRen: TMRadioButton;
    DlgGroupBoxHojCodeScope: TMGroupBox;
    DlgLabelHojCDSt: TMLabel;
    DlgLabelHojCDStDesc: TMLabel;
    DlgLabelHojCDFrom: TMLabel;
    DlgLabelHojCDTo: TMLabel;
    DlgLabelHojCDEdDesc: TMLabel;
    DlgLabelHojCDEd: TMLabel;
    DlgEditHojCDFreeEd: TMTxtEdit;
    DlgEditHojCDFreeSt: TMTxtEdit;
    DlgEditHojCDNumSt: TMNumEdit;
    DlgEditHojCDNumEd: TMNumEdit;
    DlgBtnOk: TMBitBtn;
    DlgBtnCancel: TMBitBtn;
	procedure fnDlgCmnFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDlgBtnOkOnClick(Sender: TObject);
    procedure fnDlgEditHojCDStOnExit(Sender: TObject);
    procedure fnDlgEditHojCDEdOnExit(Sender: TObject);
//	procedure fnDlgEditHojCDStOnArrowClick(Sender: TObject);
//	procedure fnDlgEditHojCDEdOnArrowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule   : TMDataModulef;
	m_cDBSelect     : TFDConnection;
	m_nCodeDigit    : Integer;
	m_nCodeAttribute: Integer;
	m_nSelect		: Integer;

  public
    { Public 宣言 }
	m_nOrderDivision: Integer;															// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_sHojCDSt		: String;															// 出力範囲: 支払先ｺｰﾄﾞ(開始)
	m_sHojCDEd		: String;															// 出力範囲: 支払先ｺｰﾄﾞ(終了)

	constructor	fnCreateDialog(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; nCodeDigit,nCodeAttribute,nSelect: Integer);

	procedure	CMChildkey					(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnGetDescriptionHojCode		(sHojCD: String; var sName: String): Boolean;
	function	fnGetRequestHojCode			(nAccessMethod: Integer): String;
	function	fnGetSQLConstruction		(nAccessMethod: Integer): String;
	function	fnSetDescriptionHojCode		(Sender: TObject; nSetPosition: Integer): Boolean;

  end;

var
	JNTCRP004007_D3f: TJNTCRP004007_D3f;

implementation
const
	REQUEST_START	= 0;
	REQUEST_END		= 1;

{$R *.DFM}


//**************************************************************************
//	Proccess  	:	アプリケーションからのパラメータセット
//	Name	  	:  	H.Endo
//	Date		:  	2003/11/14
//	Parameter  	:	pRec			:	TMjsAppRecordのﾎﾟﾝﾀ
//					AOwner			:	TComponent
//					cDBSelect		:	TDataBase
//					nCodeDigit		:	支払先ｺｰﾄﾞの桁数
//					nCodeAttribute	:	支払先ｺｰﾄﾞの属性
//					nSelect			:	処理対象	 0:実在情報
//													 1:合計情報
//													 2:支払方法(比率)
//													 3:支払方法(定額)
//													 4:振込情報
//													 5:期日指定振込情報
//													 6:手形情報
//													 7:小切手情報
//													 8:相殺情報
//													 9:その他情報
//													10:名寄せ情報
//	Retrun	  	:	Nothing
//	History	　	:
//**************************************************************************
constructor	TJNTCRP004007_D3f.fnCreateDialog (pRec: Pointer; AOwner: TComponent;
											cDBSelect: TFDConnection; nCodeDigit,nCodeAttribute,nSelect: Integer);
begin
	m_pRec			 := pRec;
	m_cDataModule	 := TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		 := cDBSelect;
	m_nCodeDigit	 := nCodeDigit;
	m_nCodeAttribute := nCodeAttribute;
	m_nSelect		 := nSelect;

	inherited	Create (AOwner);
end;


//************************************************************************
//*     Component       :   CMChildKey
//*
//*     Event           :
//*     Name            :   H.Endo
//************************************************************************
procedure TJNTCRP004007_D3f.CMChildkey (var Msg: TWMKey);
var
	cShiftState : TShiftState;
begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = DlgBtnOk.Name) then								// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DlgBtnCancel.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			if DlgGroupBoxOrder.Enabled = True then
			begin
				if DlgRBtnOrderHojCD.Checked = True then
					DlgRBtnOrderHojCD.SetFocus()
				else
					DlgRBtnOrderRen.SetFocus();
			end
			else
			begin
				if (m_nCodeAttribute <= 1) then
					DlgEditHojCDNumSt.SetFocus()
				else
					DlgEditHojCDFreeSt.SetFocus();
			end;

			Abort ();
		end;
	end;

	inherited;
end;


//************************************************************************
//*		Component		:	TJNTCRP004007_D3f ( TForm )
//*							フォーム作成
//*		Event			:	OnCreate
//*		Name			:	H.Endo
//************************************************************************
procedure TJNTCRP004007_D3f.FormCreate(Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange(TJNTCRP004007_D3f(Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP004007_D3f (Self), Pointer (m_pRec));						//<#1>

	if (m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		DlgEditHojCDFreeSt.Visible	:= FALSE;
		DlgEditHojCDFreeEd     .Visible	:= FALSE;
		DlgEditHojCDNumSt.Visible	:= TRUE;
		DlgEditHojCDNumEd  .Visible	:= TRUE;

		if	(m_nCodeAttribute = 1) then
			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else
			strFormat	:= '';

		DlgEditHojCDNumSt.Value		:= 0;
		DlgEditHojCDNumEd  .Value		:= 0;
		DlgEditHojCDNumSt.InputFlag	:= TRUE;
		DlgEditHojCDNumEd  .InputFlag	:= TRUE;
		DlgEditHojCDNumSt.FormatStr	:= strFormat;
		DlgEditHojCDNumEd  .FormatStr	:= strFormat;
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DlgEditHojCDNumSt.Visible	:= FALSE;
		DlgEditHojCDNumEd  .Visible	:= FALSE;
		DlgEditHojCDFreeSt   .Visible	:= TRUE;
		DlgEditHojCDFreeEd     .Visible	:= TRUE;

		DlgEditHojCDFreeSt.Text	:= '';
		DlgEditHojCDFreeEd  .Text	:= '';
	end;

	DlgLabelHojCDStDesc.Caption	:= '';
	DlgLabelHojCDEdDesc.Caption	:= '';


	if m_nSelect = 10 then	// 名寄せ情報
	begin
		DlgGroupBoxOrder.Caption	    := '';
		DlgGroupBoxHojCodeScope.Caption	:= '';

		DlgRBtnOrderHojCD.Checked := TRUE;
		DlgRBtnOrderHojCD.Enabled := FALSE;
		DlgRBtnOrderRen.Enabled	  := FALSE;
	end
	else					// 以外
	begin
		DlgGroupBoxOrder.Caption		:= '出力順序';
		DlgGroupBoxHojCodeScope.Caption	:= '支払先範囲';

		DlgRBtnOrderHojCD.Enabled := TRUE;
		DlgRBtnOrderRen.Enabled	  := TRUE;
	end;
end;


//************************************************************************
//*     Component       :   Edit (TMNumEdit/TMTxtEdit)
//*							入力ﾊﾟｰﾂの共通ｲﾍﾞﾝﾄ
//*     Event           :   OnKeyDown
//*     Name            :   H.Endo
//************************************************************************
procedure	TJNTCRP004007_D3f.fnDlgCmnFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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


//************************************************************************
//*     Component       :   Edit (TMNumEdit/TMTxtEdit)
//*							開始入力ﾊﾟｰﾂの共通ｲﾍﾞﾝﾄ
//*     Event           :   OnExit
//*     Name            :   H.Endo
//************************************************************************
procedure TJNTCRP004007_D3f.fnDlgEditHojCDStOnExit (Sender: TObject);
begin
	if	(not fnSetDescriptionHojCode (Sender, 0)) then
	begin
		Beep ();

		if	(m_nCodeAttribute <= 1) then
			DlgEditHojCDNumSt.SetFocus ()
		else
			DlgEditHojCDFreeSt.SetFocus ();

		Exit;
	end;
end;


//************************************************************************
//*     Component       :   Edit (TMNumEdit/TMTxtEdit)
//*							終了入力ﾊﾟｰﾂの共通ｲﾍﾞﾝﾄ
//*     Event           :   OnExit
//*     Name            :   H.Endo
//************************************************************************
procedure TJNTCRP004007_D3f.fnDlgEditHojCDEdOnExit (Sender: TObject);
begin
	if (not fnSetDescriptionHojCode (Sender, 1)) then
	begin
		Beep();

		if (m_nCodeAttribute <= 1) then
			DlgEditHojCDNumEd.SetFocus ()
		else
			DlgEditHojCDFreeEd.SetFocus ();

		Exit;
	end;

	if	(m_nCodeAttribute <= 1) then
	begin
		if	(Trunc (DlgEditHojCDNumSt.Value) > Trunc (DlgEditHojCDNumEd.Value)) then
		begin
			Beep ();
			DlgEditHojCDNumEd.SetFocus ();
			Exit;
		end;
	end
	else
	begin
		if	(CompareStr (DlgEditHojCDFreeSt.Text, DlgEditHojCDFreeEd.Text) > 0) then
		begin
			Beep ();
			DlgEditHojCDFreeEd.SetFocus ();
			Exit;
		end;
	end;
end;


//**********************************************************************
//*		Proccess	:	名称取得
//*		Name		:	H.Endo
//*		Date		:	2003/11/14
//*		Parameter	:	nAccessMethod
//*		Return		:	補助名称
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007_D3f.fnGetRequestHojCode(nAccessMethod: Integer): String;
var
	dqMasterData: TMQuery;
	strHojCode	: String;
begin
	dqMasterData := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strHojCode := '';

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT GCode FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

		case (m_nSelect) of
			0:	  SQL.Add('AND SumKbn = 0 AND HojyoKbn2 = 1');									// 実在取引先のみ, 仕入先採用あり
			1,10: SQL.Add('AND SumKbn <> 0');													// 合計取引先のみ
			2:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 0)');	// 支払方法(比率)
			3:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 1)');	// 支払方法(定額)
			4:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 1)');		// 振込情報
			5:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 2)');		// 期日指定振込情報
			6:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 3)');		// 手形情報
			7:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 4)');		// 小切手情報
			8:	  SQL.Add('AND GCode in (SELECT GCode FROM PayOffsetInfo)');  					// 相殺情報
			9:	  SQL.Add('AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1)');				// その他情報
		end;

		SQL.Add(' ORDER BY GCode ');

		if (nAccessMethod = REQUEST_END) then
			SQL.ADD ('DESC');

		Open();

		if (not EOF) then
			strHojCode := FieldByName ('GCode').AsString;
	end;

	dqMasterData.Close();
	dqMasterData.Free();

	Result := strHojCode;
end;


//**********************************************************************
//*		Proccess	:	支払先ｺｰﾄﾞのﾃﾞﾌｫﾙﾄ値取得
//*		Name		:	H.Endo
//*		Date		:	2003/11/14
//*		Parameter	:	nAccessMethod
//*		Return		:	正常(True)/異常(False)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007_D3f.fnSetDescriptionHojCode(Sender: TObject; nSetPosition: Integer): Boolean;
var
	dqMasterData  	: TMQuery;
	strDescription	: String;
	fReturn		  	: Boolean;
begin
	dqMasterData := TMQuery.Create(Self);

	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strDescription := '';
	fReturn		   := TRUE;

	// 数値
	if (m_nCodeAttribute <= 1) then
	begin
		// 入力時
		if ((Trunc(TMNumEdit(Sender).Value) > 0) or (not TMNumEdit(Sender).InputFlag)) then
		begin
			if (not fnGetDescriptionHojCode(Format('%.10d',[Trunc(TMNumEdit(Sender).Value)]),strDescription)) then
				fReturn	:= FALSE;
		end
		// 未入力時
		else
		begin
			with (dqMasterData) do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT GCode, SimpleName FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

				case (m_nSelect) of
					0:	  SQL.Add('AND SumKbn = 0 AND HojyoKbn2 = 1');									// 実在取引先のみ, 仕入先採用あり
					1,10: SQL.Add('AND SumKbn <> 0');													// 合計取引先のみ
					2:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 0)');	// 支払方法(比率)
					3:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 1)');	// 支払方法(定額)
					4:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 1)');		// 振込情報
					5:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 2)');		// 期日指定振込情報
					6:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 3)');		// 手形情報
					7:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 4)');		// 小切手情報
					8:	  SQL.Add('AND GCode in (SELECT GCode FROM PayOffsetInfo)');					// 相殺情報
					9:	  SQL.Add('AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1)');				// その他情報
				end;

				SQL.Add(' ORDER BY GCode');

				if (nSetPosition = 1) then												// 支払先ｺｰﾄﾞ(終了)
					SQL.Add(' DESC');

				Open();

				if (not EOF) then
				begin
					TMNumEdit(Sender).Value		:= StrToInt64(FieldByName ('GCode').AsString);
					TMNumEdit(Sender).InputFlag	:= FALSE;

					strDescription := FieldByName ('SimpleName').AsString;
				end
				else
					TMNumEdit(Sender).Value	:= 0;
			end;
		end;
	end
	// 文字
	else
	begin
		// 入力時
		if (Trim(TMTxtEdit(Sender).Text) <> '') then
		begin
			if (not fnGetDescriptionHojCode(TMTxtEdit(Sender).Text, strDescription)) then
				fReturn	:= FALSE;
		end
		// 未入力時
		else
		begin
			with (dqMasterData) do
			begin
				Close();

				SQL.Clear();
				SQL.Add('SELECT GCode, SimpleName FROM HojyoMA WHERE MasterKbn = 22 AND RecordKbn = 0 ');

				case (m_nSelect) of
					0:	  SQL.Add('AND SumKbn = 0 AND HojyoKbn2 = 1');									// 実在取引先のみ, 仕入先採用あり
					1,10: SQL.Add('AND SumKbn <> 0');													// 合計取引先のみ
					2:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 0)');	// 支払方法(比率)
					3:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 1)');	// 支払方法(定額)
					4:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 1)');		// 振込情報
					5:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 2)');		// 期日指定振込情報
					6:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 3)');		// 手形情報
					7:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 4)');		// 小切手情報
					8:	  SQL.Add('AND GCode in (SELECT GCode FROM PayOffsetInfo)');  					// 相殺情報
					9:	  SQL.Add('AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1)');				// その他情報
				end;

				SQL.Add(' ORDER BY GCode');

				if (nSetPosition = 1) then												// 支払先ｺｰﾄﾞ(終了)
					SQL.Add(' DESC');

				Open();

				if (not EOF) then
				begin
					TMTxtEdit(Sender).Text := FieldByName ('GCode'     ).AsString;
					strDescription		   := FieldByName ('SimpleName').AsString;
				end
				else
					TMTxtEdit (Sender).Text	:= '';
			end;
		end;
	end;

	dqMasterData.Close();
	dqMasterData.Free();

	if (nSetPosition = 0) then
		DlgLabelHojCDStDesc.Caption	:= strDescription
	else
		DlgLabelHojCDEdDesc.Caption	:= strDescription;

	Result := fReturn;
end;


//**********************************************************************
//*		Proccess	:	入力されたｺｰﾄﾞから名称取得
//*		Name		:	H.Endo
//*		Date		:	2003/11/14
//*		Parameter	:	sHojCD	:	支払先ｺｰﾄﾞ
//*						sName	:	名称
//*		Return		:	正常(True)/異常(False)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007_D3f.fnGetDescriptionHojCode(sHojCD: String; var sName: String): Boolean;
var
	dqMasterData: TMQuery;
begin
	dqMasterData := TMQuery.Create(Self);
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	sName := '';

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT SimpleName FROM HojyoMA ');
		SQL.Add('WHERE  MasterKbn = 22 AND RecordKbn = 0 AND GCode = :strHojCode ');

		case (m_nSelect) of
			0:	  SQL.Add('AND SumKbn = 0 AND HojyoKbn2 = 1');									// 実在取引先のみ, 仕入先採用あり
			1,10: SQL.Add('AND SumKbn <> 0');													// 合計取引先のみ
			2:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 0)');	// 支払方法(比率)
			3:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 1)');	// 支払方法(定額)
			4:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 1)');		// 振込情報
			5:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 2)');		// 期日指定振込情報
			6:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 3)');		// 手形情報
			7:	  SQL.Add('AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 4)');		// 小切手情報
			8:	  SQL.Add('AND GCode in (SELECT GCode FROM PayOffsetInfo)');					// 相殺情報
			9:	  SQL.Add('AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1)');				// その他情報
		end;

		ParamByName('strHojCode').AsString := sHojCD;

		Open();

		if (EOF) then
		begin
			dqMasterData.Close();
			dqMasterData.Free();
			Result := FALSE;
			Exit;
		end;

		sName := FieldByName('SimpleName').AsString
	end;

	dqMasterData.Close();
	dqMasterData.Free();

	Result := TRUE;
end;


//************************************************************************
//*     Component       :	DlgBtnOk ( TMBitBtn )
//*							OKﾎﾞﾀﾝを押された時
//*     Event           :   OnClick
//*     Name            :   H.Endo
//************************************************************************
procedure	TJNTCRP004007_D3f.fnDlgBtnOkOnClick (Sender: TObject);
begin
	if (DlgRBtnOrderHojCD.Checked) then										// 出力順序: ｺｰﾄﾞ順
		m_nOrderDivision := 0
	else																				// 出力順序: 連想順
		m_nOrderDivision := 1;

	m_sHojCDSt := '';
	m_sHojCDEd := '';

	if (m_nCodeAttribute <= 1) then
	begin
		if (DlgEditHojCDNumSt.Value <> 0) then
			m_sHojCDSt := Format('%.10d',[Trunc(DlgEditHojCDNumSt.Value)]);

		if (DlgEditHojCDNumEd.Value <> 0) then
			m_sHojCDEd := Format('%.10d',[Trunc (DlgEditHojCDNumEd.Value)]);
	end
	else
	begin
		m_sHojCDSt := DlgEditHojCDFreeSt.Text;
		m_sHojCDEd := DlgEditHojCDFreeEd.Text;
	end;

	if (m_sHojCDSt = '') then
		m_sHojCDSt := fnGetRequestHojCode(REQUEST_START);

	if (m_sHojCDEd = '') then
		m_sHojCDEd := fnGetRequestHojCode(REQUEST_END);

	ModalResult	:= mrOK;
end;

(*
procedure TJNTCRP004007_D3f.fnDlgEditHojCDStOnArrowClick (Sender: TObject);
var
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;

begin
	cMasWndIF := TJNTMasWndIF.Create ();
	cMasWndIF.Init(Pointer (m_pRec));

	cMasWndParam := TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction (REQUEST_START);	// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;							// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;						// ｺｰﾄﾞ属性

	if (cMasWndIF.DoDlg(cMasWndParam) = mrOK) then
	begin
		if (m_nCodeAttribute <= 1) then
			DlgEditHojCDNumSt.Value	:= StrToInt64(Trim(cMasWndParam.m_ExpRetCode))
		else
			DlgEditHojCDFreeSt.Text	:= cMasWndParam.m_ExpRetCode;

		DlgLabelHojCDStDesc.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free();
	cMasWndIF.Term();
	cMasWndIF.Free();
end;

procedure TJNTCRP004007_D3f.fnDlgEditHojCDEdOnArrowClick(Sender: TObject);
var
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
begin

	cMasWndIF := TJNTMasWndIF.Create ();
	cMasWndIF.Init(Pointer (m_pRec));

	cMasWndParam := TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';											// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnGetSQLConstruction(REQUEST_END);					// Where句の条件
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCodeDigit;										// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCodeAttribute;									// ｺｰﾄﾞ属性

	if (cMasWndIF.DoDlg(cMasWndParam) = mrOK) then
	begin
		if (m_nCodeAttribute <= 1) then
			DlgEditHojCDNumEd.Value	:= StrToInt64(Trim(cMasWndParam.m_ExpRetCode))
		else
			DlgEditHojCDFreeEd.Text	:= cMasWndParam.m_ExpRetCode;

		DlgLabelHojCDEdDesc.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free();
	cMasWndIF.Term();
	cMasWndIF.Free();
end;
*)

//**********************************************************************
//*		Proccess	:	検索Exp表示時の条件作成
//*		Name		:	H.Endo
//*		Date		:	2003/11/14
//*		Parameter	:	nAccessMethod	:
//*		Return		:	条件SQL
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007_D3f.fnGetSQLConstruction(nAccessMethod: Integer): String;
var
	strSQLConst	: String;
	strHojCode	: String;
begin
	strSQLConst	:= 'MasterKbn = 22 AND RecordKbn = 0 ';

	case (m_nSelect) of
		0:	  strSQLConst := strSQLConst + 'AND SumKbn = 0 AND HojyoKbn2 = 1';									// 実在情報
		1,10: strSQLConst := strSQLConst + 'AND SumKbn <> 0';													// 合計情報、名寄せ情報
		2:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 0)';	// 支払方法(比率)
		3:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnInfo WHERE BunkaiKbn = 1)';	// 支払方法(定額)
		4:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 1)';		// 振込情報
		5:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 2)';		// 期日指定振込情報
		6:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 3)';		// 手形情報
		7:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayPtnDtl WHERE Houhou = 4)';		// 小切手情報
		8:	  strSQLConst := strSQLConst + 'AND GCode in (SELECT GCode FROM PayOffsetInfo)';					// 相殺情報
		9:	  strSQLConst := strSQLConst + 'AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1) ';				// その他情報
	end;

	if (nAccessMethod = REQUEST_END) then										// 取得方法: REQUEST_END=終了ｺｰﾄﾞ
	begin
		strHojCode := '';

		if (m_nCodeAttribute <= 1) then
		begin
			if (DlgEditHojCDNumSt.Value <> 0) then
				strHojCode := Format('%.10d',[Trunc (DlgEditHojCDNumSt.Value)]);
		end
		else
			strHojCode := DlgEditHojCDFreeSt.Text;

		if (strHojCode <> '') then
			strSQLConst	:= strSQLConst + ' AND GCode >= ''' + strHojCode + '''';
	end;

	Result := strSQLConst;
end;


end.
//***********************************************************************************************************/
//*																											*/
//*	End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

