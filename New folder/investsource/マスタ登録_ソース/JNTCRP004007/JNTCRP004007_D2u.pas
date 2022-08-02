//  System      :   新会計システム 支払管理システム
//  Program     :   支払先情報登録(支払方法別)/諸口登録
//  ProgramID   :   PAY210400
//  Name        :   H.Endo(MJS)
//  Create      :
//  Comment		:
//	History		:  2000 / 99 / 99	X.Xxxxxx
//				         XXXXXXXX更新内容XXXXXXX
//
//		           2005 / 03 / 16   K.Iiduka(LEAD)   FXDB対応    <01>
//******************************************************************************
unit JNTCRP004007_D2u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, MJSCommonu, MJSMsgStdu,
  Buttons, MJSBitBtn, VCL.StdCtrls, MJSEdits, VCL.ExtCtrls, MJSPanel, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,

  JNTMasComu,
  MJSKeyDataState,		// <KDS> ADD

  //<100>JNTGlobalu;
  JNTCommonu; // <100>

type
  TJNTCRP004007_D2f = class(TForm)
    DialogEditExCodeNumeric: TMNumEdit;
    DialogEditAssociation: TMTxtEdit;
    DialogEditName: TMTxtEdit;
    DialogEditNameSimple: TMTxtEdit;
    DialogButtonRegistration: TMBitBtn;
    MBitBtn2: TMBitBtn;
    MPanel1: TMPanel;
    MPanel2: TMPanel;
    MPanel3: TMPanel;
    MPanel4: TMPanel;
    DialogEditExCodeFree: TMTxtEdit;
    DialogPanelErrorMessage: TMPanel;


	procedure	fnPay210102fOnCreate				(Sender: TObject);
	procedure	fnDialogCommonFunctionOnKeyDown01	(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDialogCommonFunctionOnKeyDown02	(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDialogButtonRegistrationOnClick	(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private 宣言 }
	m_pRec				: ^TMjsAppRecord;												// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule   	: TMDataModulef;
	m_cDBSelect     	: TFDConnection;
	m_nCodeDigit    	: Integer;
	m_nCodeAttribute	: Integer;
	m_strValidCharacters: String;

//<01>
    m_ExNCode           : Extended;                                                      //NCode取得用
//<100>    m_JNTGlobal         : TJNTGlobal;
    m_cJNTArea      :   TJNTCommon; // <100>

  public
    { Public 宣言 }
	m_strHojCodeGeneral: String;														// 諸口

	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; nCodeDigit: Integer; nCodeAttribute: Integer; strValidCharacters: String);

	procedure	CMChildKey						(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnCheckExCodeValue				(strExCode: String): Boolean;
	function	fnCheckMasterDataRecordValid	(strExCode: String): Boolean;
	function	fnCheckValidExCodeCharacter 	(strExCode: String): Boolean;
	function	fnGetMasterTreeEntryNo			(): Integer;
	function	fnRegistrationGeneralRecord		(strExCode: String): Boolean;

	procedure	fnSetErrorMessage				();

  end;

var
  JNTCRP004007_D2f: TJNTCRP004007_D2f;

implementation

const
	MASTER_CUSTOMER		= 22;															// 取引先

{$R *.DFM}
{$include MASERRORCODECHECK.inc}

//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP004007_D2f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection;
										nCodeDigit: Integer; nCodeAttribute: Integer; strValidCharacters: String);
begin
	m_pRec					:= pRec;
	m_cDataModule			:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect				:= cDBSelect;
	m_nCodeDigit			:= nCodeDigit;
	m_nCodeAttribute		:= nCodeAttribute;
	m_strValidCharacters	:= strValidCharacters;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D2f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = DialogButtonRegistration.Name) then   				// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = MBitBtn2.Name) then								// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			if	(m_nCodeAttribute <= 1) then
				DialogEditExCodeNumeric.SetFocus ()
			else
				DialogEditExCodeFree   .SetFocus ();

			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D2f.fnPay210102fOnCreate (Sender: TObject);
var
	strFormat: String;

begin
	MJSColorChange (TJNTCRP004007_D2f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP004007_D2f (Self), Pointer (m_pRec));						//<#1>

//<100>    m_JNTGlobal := TJNTGlobal.Create;
//<100>    m_JNTGlobal.Init( m_pRec);

    // <100>
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(m_pRec);
	m_cJNTArea.setSelAppRecord;						                    // 販売ポインタ設定
    // <100>

	if	(m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		DialogEditExCodeFree   .Visible	:= FALSE;
		DialogEditExCodeNumeric.Visible	:= TRUE;

		if	(m_nCodeAttribute = 1) then
			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else
			strFormat	:= '';

		DialogEditExCodeNumeric.FormatStr	:= strFormat;
		DialogEditExCodeNumeric.Value		:= 0;
		DialogEditExCodeNumeric.Digits		:= m_nCodeDigit;
		DialogEditExCodeNumeric.MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCodeDigit));
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DialogEditExCodeNumeric.Visible		:= FALSE;
		DialogEditExCodeFree   .Visible		:= TRUE;
		DialogEditExCodeFree   .Text		:= '';
		DialogEditExCodeFree   .MaxLength	:= m_nCodeDigit
	end;

	DialogEditAssociation.Text	:= '';
	DialogEditName       .Text	:= '諸口';
	DialogEditNameSimple .Text	:= '諸口';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D2f.fnDialogCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if  (Key = VK_RETURN) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
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
procedure	TJNTCRP004007_D2f.fnDialogCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	((TMTxtEdit (Sender).Name = DialogEditName.Name) and
				 (DialogEditNameSimple.Text = '')) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;

		MjsDispCtrl.MjsNextCtrl (Self);
	end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
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
	end
	else if	(Key = VK_F8) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	((TMTxtEdit (Sender).Name = DialogEditNameSimple.Name) and
				 (DialogEditName.Text <> '')) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D2f.fnDialogButtonRegistrationOnClick (Sender: TObject);
var
	strHojCode: String;

begin
	if	(m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
		strHojCode	:= Format ('%.10d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
		strHojCode	:= DialogEditExCodeFree.Text;

	if	(not fnCheckExCodeValue (strHojCode)) then										// 外部ｺｰﾄﾞ入力ﾁｪｯｸ
	begin
		if	(m_nCodeAttribute <= 1) then		 										// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 										// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();

		Exit;
	end;

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	if	(not fnRegistrationGeneralRecord (strHojCode)) then								// ｴﾗｰ
	begin
		m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)

	m_strHojCodeGeneral	:= strHojCode;

	ModalResult	:= mrOK;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D2f.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
	dqMasterTree : TMQuery;
	dqMasterData : TMQuery;

begin
	dqMasterTree	:= TMQuery.Create (Self);
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

    ////////////////////////////////////////////////////////////////////////////////
    //
    //  ※削除された諸口ﾚｺｰﾄﾞの復活処理は廃棄
    //  ※Insertの順番を MTOKUI⇒HojyoTreeに変更(NCodeを取得する関係上)
    //
    ////////////////////////////////////////////////////////////////////////////////

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('INSERT INTO MTOKUI (SumKbn, RDelkbn, GCode,RootKbn, ');
		SQL.Add   ('         Renso,NM,NMK,SyokuchiKbn,Hojyokbn1, Hojyokbn2,TStartDate,TEndDate) ');
		SQL.Add   ('VALUES (0, 0, :strExCode,0, ');
		SQL.Add   ('        :strAssociation, :strName, :strNameSimple,1, 1, 1,:TSDATE,:TEDATE)');
		ParamByName ('strExCode'      ).AsString	:= strExCode;                   //外部ｺｰﾄﾞ
		ParamByName ('strAssociation' ).AsString	:= DialogEditAssociation.Text;  //連想
		ParamByName ('strName'        ).AsString	:= DialogEditName       .Text;  //名称
		ParamByName ('strNameSimple'  ).AsString	:= DialogEditNameSimple .Text;  //簡略名称
   		ParamByName ('TSDATE'         ).AsDatetime  := m_cJNTArea.getDefDate(1);
    	ParamByName ('TEDATE'         ).AsDatetime  := m_cJNTArea.getDefDate(2);

		ExecSQL ();

		if	(Status <> 0) then														// ｴﾗｰ
		begin
			dqMasterTree.Free ();
			dqMasterData.Free ();

			Result	:= FALSE;
			Exit;
		end;
	end;

    //ﾄﾗﾝｻﾞｸｼｮﾝ内処理につき@@IdentityによりNCodeを取得予定
	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('SELECT @@Identity as ExNCode from MTOKUI ');
        Open();
		if	(Status <> 0) then														// ｴﾗｰ
		begin
			dqMasterTree.Free ();
			dqMasterData.Free ();

			Result	:= FALSE;
			Exit;
		end;
        m_ExNCode := GetFld('ExNCode').AsFloat;
    end;


	with (dqMasterTree) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('INSERT INTO HojyoTree (MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode,TStartDate,TEndDate)');
		SQL.Add   ('VALUES (:nMasterDivision, 0, :SumNCode, :nEntryNo, :ExCodeSrc,:TSDATE,:TEDATE)');

		ParamByName ('nMasterDivision').AsInteger   := MASTER_CUSTOMER;
		ParamByName ('SumNCode'       ).AsFloat     := 0;
		ParamByName ('nEntryNo'       ).AsInteger   := fnGetMasterTreeEntryNo ();
		ParamByName ('ExCodeSrc'      ).AsFloat     := m_ExNCode;
   		ParamByName ('TSDATE'         ).AsDatetime  := m_cJNTArea.getDefDate(1);
    	ParamByName ('TEDATE'         ).AsDatetime  := m_cJNTArea.getDefDate(2);

		ExecSQL ();

		if  (Status <> 0) then															// ｴﾗｰ
		begin
			dqMasterTree.Free ();
			dqMasterData.Free ();

			Result	:= FALSE;
			Exit;
		end;
	end;

    dqMasterTree.Close ();
	dqMasterTree.Free  ();
	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D2f.fnGetMasterTreeEntryNo (): Integer;
var
	dqMasterTree: TMQuery;
	nWorkEntryNo: Integer;

begin
	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT EntNo FROM HojyoTree ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumNCode = :ExCodeDst ORDER BY EntNo DESC');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
		ParamByName ('ExCodeDst'   ).AsFloat 	    := 0;

		Open ();

		if	(not EOF) then
			nWorkEntryNo	:= FieldByName ('EntNo').AsInteger
        else
			nWorkEntryNo	:= 0;
	end;

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

	Result	:= (nWorkEntryNo + 100) div 100 * 100;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D2f.fnCheckExCodeValue (strExCode: String): Boolean;
begin
	if	(not fnCheckValidExCodeCharacter (strExCode)) then
	begin
		fnSetErrorMessage ();

		Result	:= FALSE;
		Exit;
	end;

	if	(not fnCheckMasterDataRecordValid (strExCode)) then
	begin
		fnSetErrorMessage ();

		Result	:= FALSE;
		Exit;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D2f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode,GCode FROM MTOKUI ');
		SQL.Add   ('WHERE  RDelKbn = 0 AND GCode = :strExCode');
        ParamByName('strExCode').AsString := strExCode;

		Open ();

		if	(not EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

    end;
	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D2f.fnSetErrorMessage ();
begin
	Beep ();

	DialogPanelErrorMessage.Caption	:= ' コードを正しく入力してください。';

	if	(m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
		DialogEditExCodeNumeric.SetFocus ()
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
		DialogEditExCodeFree   .SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP004007_D2f.fnCheckValidExCodeCharacter (strExCode: String): Boolean;
var
	cErrorMsgRec: TMJSMsgRec;

begin
	if	(Trim (strExCode) = '') then
	begin
		Beep ();

		Result	:= FALSE;
		Exit;
	end;

	if	(m_nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(not MASERRORCODECHECK (strExCode, m_strValidCharacters)) then
	begin
		Beep ();

		TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (cErrorMsgRec, 30, 21);

		MJSMessageBoxEx (Self, cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, cErrorMsgRec.icontype,
											cErrorMsgRec.btntype, cErrorMsgRec.btndef, cErrorMsgRec.LogType);

		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP004007_D2f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//<100>    m_JNTGlobal.Free;

    //  共通システム開放 <100>
    m_cJNTArea.Free;


end;

end.
//***********************************************************************************************************/
//*                 		                                                                                */
//*	End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

