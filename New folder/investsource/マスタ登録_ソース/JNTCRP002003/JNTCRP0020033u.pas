//************************************************************************
//*
//*		Systeme			:	新会計システム
//*		Program			:	採用区分DLG
//*		ProgramID		:	JNTCRP0020033
//*		Name			:	S.Suzuki（AP開発）
//*		Create			:	2000/11/07
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	2000/12/21 HIS0001  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ESCｷｰで終了できるようにする
//* 2002/04/24 HIS0002	Y.Ichihashi	キャンセルボタンが押されたらダイアログを終了して
//*									ｺｰﾄﾞセットのダイアログが表示されないように修正
//* 2004/12/10 HIS0003  Y.Ichihashi 解像度対応
//******************************************************************************
//* 2005/04/01  FX10000 M.KATSUNUMA JNT共通関数対応
//*                                     uses 順番変更
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
    { Private 宣言 }
	m_pRec			 : ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	 : TMDataModulef;
	m_cDBSelect		 : TDatabase;
	m_nMasterDivision: Integer;
	m_strItemName	 : String;

  public
    { Public 宣言 }
	m_nAdoptDivision: Integer;					// 採用区分
	m_nCodeDigit	: Integer;					// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;					// ｺｰﾄﾞ属性

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TDataBase; nMasterDivision: Integer);

	procedure	fnUpdateMasterInfoData	();

	function	fnCheckInputValue		(nDivision: Integer): Boolean;

  end;

var
  JNTCRP0020033f: TJNTCRP0020033f;

implementation

const
    MK_SEG01	= 101;		// セグメント１のマスタ区分

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

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
					41          :	m_strItemName := '部門';
					MK_SEG01    :	m_strItemName := 'ｾｸﾞﾒﾝﾄ1';
					MK_SEG01 + 1:	m_strItemName := 'ｾｸﾞﾒﾝﾄ2';
					MK_SEG01 + 2:	m_strItemName := 'ｾｸﾞﾒﾝﾄ3';
					MK_SEG01 + 3:	m_strItemName := 'ｾｸﾞﾒﾝﾄ4';
					MK_SEG01 + 4:	m_strItemName := 'ｾｸﾞﾒﾝﾄ5';
					MK_SEG01 + 5:	m_strItemName := 'ｾｸﾞﾒﾝﾄ6';
					MK_SEG01 + 6:	m_strItemName := 'ｾｸﾞﾒﾝﾄ7';
					MK_SEG01 + 7:	m_strItemName := 'ｾｸﾞﾒﾝﾄ8';
					MK_SEG01 + 8:	m_strItemName := 'ｾｸﾞﾒﾝﾄ9';
					MK_SEG01 + 9:	m_strItemName := 'ｾｸﾞﾒﾝﾄ10';
				end;
			end;

			if	(GetFld ('UseKbn').AsInteger = 0) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
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

				DialogLabelMessage.Caption	:= 'コード桁数及び属性を変更することができます。';
			end;

			DialogEditCodeDigit    .Value	:= GetFld ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= GetFld ('CodeAttr' ).AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '採用区分';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelDescCodeAttributeAddition.Caption	:= '数字';
		1:	DialogLabelDescCodeAttributeAddition.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelDescCodeAttributeAddition.Caption	:= 'フリー';
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
		0:	DialogLabelDescCodeAttributeAddition.Caption	:= '数字';
		1:	DialogLabelDescCodeAttributeAddition.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelDescCodeAttributeAddition.Caption	:= 'フリー';
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020033f.fnDialogRadioButtonAdoption01OnClick (TObject)									*/
//*																											*/
//*	目的	: 部門登録処理 ﾗｼﾞｵ･ﾎﾞﾀﾝ[P/Lのみ採用] OnClick ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,                                                     		                            */
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
//*	関数	: TJNTCRP0020033f.fnDialogRadioButtonAdoption02OnClick (TObject)									*/
//*																											*/
//*	目的	: 部門登録処理 ﾗｼﾞｵ･ﾎﾞﾀﾝ[B/S&P/L採用] OnClick ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,                                                     		                            */
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
//*	関数	: TJNTCRP0020033f.fnDialogRadioButtonAdoption03OnClick (TObject)									*/
//*																											*/
//*	目的	: 部門登録処理 ﾗｼﾞｵ･ﾎﾞﾀﾝ[採用しない] OnClick ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,                                                     		                            */
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

	m_nCodeDigit		:= Trunc (DialogEditCodeDigit    .Value);			// ｺｰﾄﾞ桁数
	m_nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);			// ｺｰﾄﾞ属性

	ModalResult	:= mrOK;
end;


procedure	TJNTCRP0020033f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData: TMQuery;
//	fAdoption	: Boolean;

begin
//	fAdoption	:= False;

	dqMasterData	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
				m_nAdoptDivision	:= GetFld ('UseKbn'   ).AsInteger;			// 採用区分
				m_nCodeDigit		:= GetFld ('CodeDigit').AsInteger;			// ｺｰﾄﾞ桁数
				m_nCodeAttribute	:= GetFld ('CodeAttr' ).AsInteger;			// ｺｰﾄﾞ属性

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

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
		nCodeDigit	:= Trunc (DialogEditCodeDigit.Value);							// ｺｰﾄﾞ桁数

		if	((nCodeDigit < 3) or (nCodeDigit > 10)) then
		begin
			DialogEditCodeDigit.SetFocus ();

			Result	:= False;
			Exit;
		end;
	end;

	if	((nDivision = 0) or (nDivision = 2)) then
	begin
		nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);					// ｺｰﾄﾞ属性

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
//*							Fromのｷｰｲﾍﾞﾝﾄ処理
//*		Event			:	CMChildKey
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）	HIS0001
//************************************************************************
procedure TJNTCRP0020033f.CMChildKey(var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then	// Esc
		ModalResult	:= mrCancel;

	cShiftState	:= KeyDataToShiftState (Msg.KeyData);							// Shiftｷｰの取得

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
			DialogEditCodeDigit.SetFocus ();
			Abort;
		end;
	end;

	inherited;
end;

end.
