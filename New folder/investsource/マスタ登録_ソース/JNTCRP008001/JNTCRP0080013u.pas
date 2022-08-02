//************************************************************************
//*
//*		Systeme			:	新会計システム
//*		Program			:	採用区分DLG
//*		ProgramID		:	JNTCRP0080013
//*		Name			:	S.Suzuki（AP開発）
//*		Create			:	2000/11/07
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	2000/12/21 HIS0001  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ESCｷｰで終了できるようにする
//* 2002/04/24 HIS0002	Y.Ichihashi	キャンセルボタンが押されたらダイアログを終了し
//*									ｺｰﾄﾞセットのダイアログが表示されないように修正
//* 2008/03/17 HIS0003  F.Ootake    更新担当者内部ｺｰﾄﾞのｾｯﾄ
//*-ver4.08 / NX-Ⅰ5.01修正内容-------------------------------
//* <Shift> T.Ogawa(LEAD)   2012.02.08(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//************************************************************************
unit JNTCRP0080013u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, VCL.ExtCtrls, Buttons, FireDAC.Comp.Client,
  MJSCommonu, MJSDBModuleu, MJSQuery, MJSDispCtrl,
  MJSKeyDataState,  //<Shift> ADD
  MJSLabel, MJSBitBtn, MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox;

type
  TJNTCRP0080013f = class(TForm)
    MPanel2: TMPanel;
    DialogLabelGroupAdoption: TMLabel;
    DialogLabelDescAdoption: TMLabel;
    DialogRadioButtonAdoption01: TMRadioButton;
    DialogRadioButtonAdoption02: TMRadioButton;
    MGroupBox1: TMGroupBox;
    DialogLabelDescCodeDigit: TMLabel;
    DialogLabelDescCodeDigitAddition: TMLabel;
    DialogLabelDescCodeAttribute: TMLabel;
    DialogLabelCodeAttributeDesc: TMLabel;
    DialogEditCodeDigit: TMNumEdit;
    DialogEditCodeAttribute: TMNumEdit;
    MPanel1: TMPanel;
    DialogLabelMessage: TMLabel;
    DialogButtonOk: TMBitBtn;
    DialogButtonCancel: TMBitBtn;
    procedure fnJNTCRP0080013fOnCreate(Sender: TObject);
	procedure fnDialogCommonFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDialogButtonOkOnClick(Sender: TObject);
    procedure fnDialogButtonCancelOnClick(Sender: TObject);
    procedure fnDialogEditCodeAttributeOnChange(Sender: TObject);
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;		//	HIS0001
  private
    { Private 宣言 }
	m_pRec			 : ^TMjsAppRecord;						// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	 : TMDataModulef;
	m_cDBSelect		 : TFDConnection;
	m_nMasterDivision: Integer;
	m_strItemName	 : String;

  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;					// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;					// ｺｰﾄﾞ属性

	constructor	fnCreateDialog			(pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef; cDBSelect: TFDConnection; nMasterDivision: Integer);

	procedure	fnUpdateMasterInfoData	();

	function	fnCheckInputValue		(nDivision: Integer): Boolean;

  end;

var
  JNTCRP0080013f: TJNTCRP0080013f;

implementation

{$R *.DFM}

constructor	TJNTCRP0080013f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDataModule: TMDataModulef;
																cDBSelect: TFDConnection; nMasterDivision: Integer);
begin
	m_pRec				:= pRec;
	m_cDataModule		:= cDataModule;
	m_cDBSelect			:= cDBSelect;
	m_nMasterDivision	:= nMasterDivision;

	inherited	Create (AOwner);
end;


procedure	TJNTCRP0080013f.fnJNTCRP0080013fOnCreate (Sender: TObject);
var
	dqMasterData: TMQuery;

begin
	MJSColorChange (TJNTCRP0080013f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQl.ADD ('WHERE  MasterKbn = :nMasterKbn');

		ParamByName ('nMasterKbn').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			m_strItemName	:= GetFld ('JHojyoName').AsString;

			if	(m_strItemName = '') then
			begin
                if (m_nMasterDivision = 21) then
					m_strItemName	:= '銀行';
			end;

			if	(GetFld ('UseKbn').AsInteger = 0) then
				DialogLabelMessage.Caption	:= m_strItemName + 'は採用されていません。採用しますか？'
			else
			begin
				DialogLabelGroupAdoption   .Enabled	:= False;
				DialogLabelDescAdoption    .Enabled	:= False;
				DialogRadioButtonAdoption01.Enabled	:= False;
				DialogRadioButtonAdoption02.Enabled	:= False;

				DialogLabelMessage.Caption	:= 'コード桁数及び属性を変更することができます。';
			end;

			DialogEditCodeDigit    .Value	:= GetFld ('CodeDigit').AsInteger;
			DialogEditCodeAttribute.Value	:= GetFld ('CodeAttr' ).AsInteger;
		end;
	end;

	DialogLabelDescAdoption.Caption	:= m_strItemName + '採用区分';

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;
end;


procedure	TJNTCRP0080013f.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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


procedure	TJNTCRP0080013f.fnDialogEditCodeAttributeOnChange (Sender: TObject);
begin
	if	((Trunc (DialogEditCodeAttribute.Value) < 0) or (Trunc (DialogEditCodeAttribute.Value) > 2)) then
	begin
		Beep ();
		DialogLabelCodeAttributeDesc.Caption	:= '';
		DialogEditCodeAttribute.SetFocus ();
		Abort;
	end;

	case (Trunc (DialogEditCodeAttribute.Value)) of
		0:	DialogLabelCodeAttributeDesc.Caption	:= '数字';
		1:	DialogLabelCodeAttributeDesc.Caption	:= '数字(前ゼロあり)';
		2:	DialogLabelCodeAttributeDesc.Caption	:= 'フリー';
	end;
end;


procedure	TJNTCRP0080013f.fnDialogButtonOkOnClick (Sender: TObject);
begin
	if	(not fnCheckInputValue (0)) then
		Abort;

	if	(DialogRadioButtonAdoption01.Checked) then
		fnUpdateMasterInfoData ()
	else
    begin
		ModalResult	:= mrCancel;

		Exit;
	end;

	m_nCodeDigit		:= Trunc (DialogEditCodeDigit    .Value);			// ｺｰﾄﾞ桁数
	m_nCodeAttribute	:= Trunc (DialogEditCodeAttribute.Value);			// ｺｰﾄﾞ属性

	ModalResult	:= mrOK;
end;


procedure	TJNTCRP0080013f.fnDialogButtonCancelOnClick (Sender: TObject);
var
	dqMasterData: TMQuery;
//	fAdoption	: Boolean;

begin
//	fAdoption	:= False;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT UseKbn, CodeDigit, CodeAttr FROM MasterInfo WHERE MasterKbn = :nMasterKbn');

		ParamByName ('nMasterKbn').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			if	(GetFld ('UseKbn').AsInteger = 1) then
			begin
				m_nCodeDigit		:= GetFld ('CodeDigit').AsInteger;			// ｺｰﾄﾞ桁数
				m_nCodeAttribute	:= GetFld ('CodeAttr' ).AsInteger;			// ｺｰﾄﾞ属性

//				fAdoption	:= True;
			end;
		end;
	end;

//----------------------------------HIS0002Start
//	if	(fAdoption) then
//		ModalResult	:= mrOK
//	else
//----------------------------------HIS0002End
		ModalResult	:= mrCancel;
end;


procedure	TJNTCRP0080013f.fnUpdateMasterInfoData ();
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

    try
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD('UPDATE MasterInfo SET ');
        SQL.Add('UseKbn=1, CodeDigit=:nCodeDigit, CodeAttr=:nCodeAttribute, ');
        SQL.Add('UpdTantoNCode = :nUpdTantoNCode '); // HIS0002
		SQL.ADD('WHERE  MasterKbn=:nMasterKbn');

		ParamByName ('nMasterKbn'    ).AsInteger	:= m_nMasterDivision;
		ParamByName ('nCodeDigit'    ).AsInteger	:= Trunc (DialogEditCodeDigit    .Value);
		ParamByName ('nCodeAttribute').AsInteger	:= Trunc (DialogEditCodeAttribute.Value);
        ParamByName ('nUpdTantoNCode' ).AsFloat     := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0002

		ExecSQL;
	end;
    except
        on E: Exception do
        begin
            showmessage(E.Message + ':' + intToStr(E.HelpContext));
        end;
    end;
end;


function	TJNTCRP0080013f.fnCheckInputValue (nDivision: Integer): Boolean;
var
	nCodeDigit    : Integer;
	nCOdeAttribute: Integer;

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
//*		Component		:	TJNTCRP0080013f ( TForm )
//*							Fromのｷｰｲﾍﾞﾝﾄ処理
//*		Event			:	CMChildKey
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）	HIS0001
//************************************************************************
procedure TJNTCRP0080013f.CMChildKey(var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then	// Esc
		ModalResult	:= mrCancel;

//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得  <Shift> ADD

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
