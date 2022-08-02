//************************************************************************
//*
//*		Systeme			:	FX共通マスタ
//*		Program			:	諸口登録DLG
//*		ProgramID		:	JNTCRP0020032
//*		Name			:	広田　茂雄（プライム）
//*		Create			:	2005/02/XX
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	00/12/25 HIS0001  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						部門登録の諸口登録時に部門分類にデフォルト１を設定
//*	01/2/5	 HIS0002  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						HojyoMAに内部コード２がのフィールドが追加されたのでその対応
//* 04/01/14 HIS0003  Y.Ichihashi
//*                     排他制御処理追加
//* 04/12/10 HIS0004  Y.Ichihashi
//*                     解像度対応
//*	13/01/25 <MLXHAP> T.Shinoda(Lab)
//*						MLX給与大将対応
//*	20/03/05 <D10-P>  N.Honda(CyberCom)
//*						Delphi10 ストアドデータ型エラー対応
//*	20/03/13 <D10-Stored>  Y.Iwakawa
//*						Delphi10 ストアドデータ型エラー対応
//*                     m_SPMsHistのTanNCodeはFloat→Currencyのまま（D10-P戻し）
//******************************************************************************
//* 2005/04/01  FX10000 M.KATSUNUMA JNT共通関数対応
//*                                     uses 順番変更
//*                                     include 変更
//************************************************************************
unit JNTCRP0020032u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Buttons, VCL.StdCtrls, VCL.ExtCtrls, FireDAC.Comp.Client,
  MJSCommonu, MJSDBModuleu, MJSDispCtrl, MJSStrCtrl, MJSMsgStdu,
  MJSEdits, MJSBitBtn, MJSPanel, MJSQuery,
  JNTMasComu, MJSLabel;

type
//{$I JNTMASExceptIFI.inc}    //FX10000
//{$I JNTMASExceptIFH.inc}    //FX10000

  TJNTCRP0020032f = class(TForm)
    DialogEditExCodeNumeric: TMNumEdit;
    DialogEditAssociation: TMTxtEdit;
    DialogEditName: TMTxtEdit;
    DialogEditNameSimple: TMTxtEdit;
    DialogButtonRegistration: TMBitBtn;
    BCancel: TMBitBtn;
    DialogEditExCodeFree: TMTxtEdit;
    DialogPanelErrorMessage: TMPanel;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    procedure fnJNTCRP0020032fOnCreate(Sender: TObject);
	procedure fnDialogCommonFunctionOnKeyDown01(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnDialogCommonFunctionOnKeyDown02(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDialogButtonRegistrationOnClick(Sender: TObject);
    procedure fnDialogEditNameSimpleOnEnter(Sender: TObject);
  private
    { Private 宣言 }
	m_pRec				: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_nDivision			: Integer;
	m_cDataModule		: TMDataModulef;
	m_cDBSelect			: TFDConnection;
	m_nMasterDivision	: Integer;
	m_nCodeDigit		: Integer;
	m_nCodeAttribute	: Integer;
	m_strValidCharacters: String;

//    m_cExcept           : ^TJNTMasExceptIF; //HIS0003 FX10000
    m_BmnFlg            : ^Boolean;         //HIS0003
    m_SegFlg            : ^Boolean;         //HIS0003

	m_SPMsHist			: ^TFDStoredProc;				// <080214_2>

	procedure	SessionPractice(iSyori: Integer);	// <080214_2> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
  public
    { Public 宣言 }
//	constructor	fnCreateDialog	(pRec: Pointer; nDivision: Integer; AOwner: TComponent; cDBSelect: TDataBase; nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strValidCharacters: String; BmnFlg, SegFlg, cExcept: Pointer);
//<080214_2>↓
//	constructor	fnCreateDialog	(pRec: Pointer; nDivision: Integer; AOwner: TComponent; cDBSelect: TDataBase; nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strValidCharacters: String; BmnFlg, SegFlg: Pointer);
	constructor	fnCreateDialog	(pRec: Pointer; nDivision: Integer; AOwner: TComponent; cDBSelect: TFDConnection; nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer; strValidCharacters: String; BmnFlg, SegFlg, SPMsHist: Pointer);
//<080214_2>↑

	function	fnCheckExCodeValidCharacter		(strExCode: String): Boolean;
	function	fnCheckExCodeValue				(strExCode: String): Boolean;
	function	fnCheckMasterDataRecordValid	(strExCode: String): Boolean;
	function	fnRegistrationTotalRecord		(strExCode: String): Boolean;
	function	fnRegistrationGeneralRecord		(strExCode: String): Boolean;

	procedure	fnSetErrorMessage				();

    function    fnExcept(nMasterDivision: Integer): Integer;
  end;

var
  JNTCRP0020032f: TJNTCRP0020032f;

implementation

var
	_CodeError: String	= 'コードには次の文字は使用できません。'' " : ? \ *';

const
	// FXテスト用★★★★
	DEF_HOJYOMA				= 'HojyoMA';
	DEF_NSPTLR 				= 'HAPTLR';
	DEF_NSPTLR2 			= 'HAPTLR2';

	DEF_S_DATE  = 2;		//1900/01/01
	DEF_E_DATE  = 73050;	//2099/12/31
	//  <マスタ同期>---Begin---
	MSG_REGCHK_SYO      = '諸口は、既に他の端末などにより登録済みのため、'#13#10
						+ '更新できませんでした。';
	MSG_REGCHK_SOKEI    = '総合計は、既に他の端末などにより登録済みのため、'#13#10
                        + '更新できませんでした。';
	//  <マスタ同期>--- End ---

//<080214_2>↓
	// J-SOX履歴対応
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
//<080214_2>↑

{$R *.DFM}
{$include JNTMASERRORCODECHECK.inc}     //FX10000
//{$include JNTMASExceptIFB.inc}          //HIS0003 FX10000

constructor	TJNTCRP0020032f.fnCreateDialog (pRec: Pointer; nDivision: Integer; AOwner: TComponent;
										cDBSelect: TFDConnection; nMasterDivision: Integer;
										nCodeDigit: Integer; nCodeAttribute: Integer;
//<080214_2>↓
//										strValidCharacters: String; BmnFlg, SegFlg: Pointer);
										strValidCharacters: String; BmnFlg, SegFlg, SPMsHist: Pointer);
//<080214_2>↑
//										strValidCharacters: String; BmnFlg, SegFlg, cExcept: Pointer);
begin
	m_pRec					:= pRec;
	m_nDivision				:= nDivision;
	m_cDataModule			:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect				:= cDBSelect;
	m_nMasterDivision		:= nMasterDivision;
	m_nCodeDigit			:= nCodeDigit;
	m_nCodeAttribute		:= nCodeAttribute;
	m_strValidCharacters	:= strValidCharacters;

    m_BmnFlg                := BmnFlg;
    m_SegFlg                := SegFlg;
//    m_cExcept               := cExcept;
//<080214_2>↓
	m_SPMsHist				:= SPMsHist;
//<080214_2>↑

	inherited	Create (AOwner);
end;


procedure	TJNTCRP0020032f.fnJNTCRP0020032fOnCreate (Sender: TObject);
var
	strFormat: String;

begin

//<MLXHAP>↓
//	MJSColorChange (TJNTCRP0020032f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);
	MJSColorChange (TJNTCRP0020032f (Self),
					TJNTMASCom (m_pRec^.m_pSystemArea^).SystemArea.SysColorB,
					TJNTMASCom (m_pRec^.m_pSystemArea^).SystemArea.SysColorD,
					TJNTMASCom (m_pRec^.m_pSystemArea^).SystemArea.SysBaseColorB,
					TJNTMASCom (m_pRec^.m_pSystemArea^).SystemArea.SysBaseColorD,
					rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);
//<MLXHAP>↑

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
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
		DialogEditExCodeNumeric.MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCodeDigit))
	end
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DialogEditExCodeNumeric.Visible		:= FALSE;
		DialogEditExCodeFree   .Visible		:= TRUE;
		DialogEditExCodeFree   .Text		:= '';
		DialogEditExCodeFree   .MaxLength	:= m_nCodeDigit;
	end;

//	DialogPanelErrorMessage     .Color	:= $000000;
//	DialogPanelErrorMessage.Font.Color	:= $00ffff;

	if	(m_nDivision = 0) then														// ﾀﾞｲｱﾛｸﾞ区分: 0=総合計
	begin
		Caption							:= '総合計登録';
		DialogEditName         .Text	:= '総合計';
		DialogEditNameSimple   .Text	:= '総合計';
		DialogEditAssociation  .Text	:= 'ｿｳｺﾞｳｹｲ';
		DialogPanelErrorMessage.Caption	:= ' 総合計を登録してください。';
	end
	else																			// ﾀﾞｲｱﾛｸﾞ区分: 1=諸口
	begin
		Caption							:= '諸口登録';
		DialogEditName         .Text	:= '諸口';
		DialogEditNameSimple   .Text	:= '諸口';
		DialogEditAssociation  .Text	:= 'ｼｮｸﾁ';
		DialogPanelErrorMessage.Caption	:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';
	end;

	MJSFontResize (TJNTCRP0020032f (Self),Pointer (m_pRec));    //HIS0004
end;


procedure	TJNTCRP0020032f.fnDialogCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	(Key = VK_ESCAPE) then
    begin
		ModalResult	:= mrCancel;
		Exit;
	end
    else if (Key = VK_END) then
    begin
		DialogButtonRegistration.SetFocus;
		Exit;
	end
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	((Sender is TMTxtEdit) AND (Key = VK_LEFT)) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	((Sender is TMTxtEdit) AND (Key = VK_RIGHT)) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;


procedure	TJNTCRP0020032f.fnDialogCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
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
		// 050909 >>
        // エディットでENDキー
		if	((Key = VK_END) AND (Sender is TMTxtEdit)) then
        begin
        	// 最後の文字じゃなかったら
			if	(not MJSChkCurEnd (Sender as TComponent)) then
            	Exit;	// 最後の文字に
        end;
		// 050909 <<
        if (Key = VK_END) then
			DialogButtonRegistration.SetFocus
        else
			ModalResult	:= mrCancel;
		Exit;
	end
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	((Sender is TMTxtEdit) AND (Key = VK_LEFT)) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	((Sender is TMTxtEdit) AND (Key = VK_RIGHT)) then
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
//*																											*/
//*	関数	: TJNTCRP0020032f.fnDialogEditNameSimpleOnEnter (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                     		                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020032f.fnDialogEditNameSimpleOnEnter (Sender: TObject);
begin
	if	(DialogEditNameSimple.Text = '') then
	begin
		if	(StrLen (PChar (DialogEditName.Text)) <= 14) then
       	DialogEditNameSimple.Text	:= DialogEditName.Text
		else
			DialogEditNameSimple.Text	:= MJSCopy (DialogEditName.Text, 14);
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnDialogButtonRegistrationOnClick (TObject)								*/
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ ﾎﾞﾀﾝ[登録] OnClick ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020032f.fnDialogButtonRegistrationOnClick (Sender: TObject);
var
	strExCode: String;
	fReturn	 : Boolean;
begin
	//--- HIS0003 St -----
	if m_nMasterDivision = 41 then
    begin
        if m_BmnFlg^ = False then
        begin
            if fnExcept(m_nMasterDivision) <> 99 then
                m_BmnFlg^    := True
            else
            begin
                DialogEditExCodeFree.Text       := '';
                DialogEditExCodeNumeric.Value   := 0;
                DialogEditAssociation.Text      := '';
                DialogEditName.Text             := '';
                DialogEditNameSimple.Text       := '';
                BCancel.SetFocus;
                abort;
            end;
        end;
    end
    else
    if m_nMasterDivision = 42 then
    begin
        if m_SegFlg^ = False then
        begin
            if fnExcept(m_nMasterDivision) <> 99 then
                m_SegFlg^    := True
            else
            begin
                DialogEditExCodeFree.Text       := '';
                DialogEditExCodeNumeric.Value   := 0;
                DialogEditAssociation.Text      := '';
                DialogEditName.Text             := '';
                DialogEditNameSimple.Text       := '';
                BCancel.SetFocus;
                abort;
            end;
        end;
    end;
    //--- HIS0003 Ed -----

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
		strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
		strExCode	:= DialogEditExCodeFree.Text;

	if	(not fnCheckExCodeValue (strExCode)) then									// 外部ｺｰﾄﾞ入力ﾁｪｯｸ
	begin
		if	(m_nCodeAttribute <= 1) then		 									// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 									// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();

		Exit;
	end;

//  <マスタ同期>	m_cDataModule.BeginTran (m_cDBSelect);											// ﾄﾗﾝｻﾞｸｼｮﾝの開始

//<080214_2>↓
	SessionPractice(C_ST_PROCESS);
	try
//<080214_2>↑
		if	(m_nDivision = 0) then														// 区分: 総合計
			fReturn	:= fnRegistrationTotalRecord (strExCode)
		else																			// 区分: 諸口
			fReturn	:= fnRegistrationGeneralRecord (strExCode);
//<080214_2>↓
	finally
		SessionPractice(C_ED_PROCESS);
	end;
//<080214_2>↑

	if	(not fReturn) then															// ｴﾗｰ
	begin
//  <マスタ同期>		m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
	end;

//  <マスタ同期>	m_cDataModule.Commit (m_cDBSelect);												// ｺﾐｯﾄ(反映)

	ModalResult	:= mrOK;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnRegistrationTotalRecord (String)										*/
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ 総合計ﾚｺｰﾄﾞ登録取得                                  		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)					                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 総合計部門ｺｰﾄﾞ											                */
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020032f.fnRegistrationTotalRecord (strExCode: String): Boolean;
var
//	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;

begin
//	dqMasterTree	:= TMQuery.Create (Self);		// 050606
	dqMasterData	:= TMQuery.Create (Self);		// 050606

//	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('INSERT INTO ' + DEF_HOJYOMA);
		// ◆◇◆Syokuchikbn=0（諸口以外）
		SQL.Add   ('	   (MasterKbn, 		  SumKbn, RDelKbn, GCode, 	   Renso, 			LongName, SimpleName, 	  Syokuchikbn, TStartDate, TEndDate, HojyoKbn1, HojyoKbn2, BunCode, BSBumonNCode) ');	// 050915
		SQL.Add   ('VALUES (:nMasterDivision, 9, 	  0, 	   :strExCode, :strAssociation, :strName, :strNameSimple, 0, 		   :StartDate, :EndDate, 0,         0,         0,       0)');				// 050915

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;
		ParamByName ('strAssociation' ).AsString	:= DialogEditAssociation.Text;
		ParamByName ('strName'        ).AsString	:= DialogEditName.Text;
		ParamByName ('strNameSimple'  ).AsString	:= DialogEditNameSimple.Text;
//		ParamByName ('TotalNCode'     ).AsString	:= IntToStr(GetNewNCode());
		ParamByName ('StartDate'  	  ).AsDateTime	:= DEF_S_DATE;
		ParamByName ('EndDate'        ).AsDateTime	:= DEF_E_DATE;

		ExecSQL ();

		if  (Status <> 0) then															// ｴﾗｰ
		begin
//			dqMasterTree.Close ();
			dqMasterData.Close ();
//			dqMasterTree.Free  ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;
	end;

//	with (dqMasterTree) do
//	begin
//		Close ();

//		SQL.Clear ();
//		SQL.Add   ('INSERT INTO HojyoTree (MasterKbn, PatternNo, SumCode, EntNo, BasedCode)');
//		SQL.Add   ('VALUES (:nMasterDivision, 0, :strExCodeDst, :nEntryNo, :strExCodeSrc)');

//		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
//		ParamByName ('strExCodeDst'   ).AsString	:= '          ';
//		ParamByName ('nEntryNo'       ).AsInteger	:= fnGetMasterTreeEntryNo ('          ');
//		ParamByName ('strExCodeSrc'   ).AsString	:= strExCode;

//		ExecSQL ();

//		if  (Status <> 0) then															// ｴﾗｰ
//		begin
//			dqMasterData.Close ();
//			dqMasterTree.Close ();
//			dqMasterData.Free  ();
//			dqMasterTree.Free  ();

//			Result	:= FALSE;
//			Exit;
//		end;
//	end;

//	dqMasterTree.Close ();
	dqMasterData.Close ();
//	dqMasterTree.Free  ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnRegistrationGeneralRecord (String)										*/
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ 諸口ﾚｺｰﾄﾞ登録取得                                  		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)					                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 総合計部門ｺｰﾄﾞ											                */
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020032f.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;
//	strExCodeDst: String;

begin
	dqMasterTree	:= TMQuery.Create (Self);		// 050606
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);						// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

{
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT NCode FROM ' + DEF_HOJYOMA);
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision and SumKbn = 9 and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		strExCodeDst	:= FieldByName ('NCode').AsString;							// 総合計部門ｺｰﾄﾞ
	end;
}
	with (dqMasterData) do
	begin
{
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT RDelKbn FROM ' + DEF_HOJYOMA);
		// ◆◇◆Syokuchikbn=1（諸口）
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND Syokuchikbn = 1 AND RDelKbn = 1');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		// 削除ﾚｺｰﾄﾞ再利用
		if	(not EOF) then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('UPDATE ' + DEF_HOJYOMA);
			SQL.Add   ('SET    SumKbn = 0, RDelKbn = 0, GCode = :strExCode, NCode = NCode, Renso = :strAssociation, ');
			SQL.Add	  ('       LongName = :strName, SimpleName = :strNameSimple, BSBumon = NULL ');
			// ◆◇◆Syokuchikbn=1（諸口）
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND Syokuchikbn = 1 AND RDelKbn = 1');
		end
		// 新規
		else
		begin
}
			Close ();

			SQL.Clear ();
			SQL.Add   ('INSERT INTO ' + DEF_HOJYOMA);
			// ◆◇◆Syokuchikbn=1（諸口）
			SQL.Add   ('	   (MasterKbn, 		  SumKbn, RDelKbn, GCode, 	   Renso, 			LongName, SimpleName, 	  Syokuchikbn, TStartDate, TEndDate, HojyoKbn1, HojyoKbn2, BunCode, BSBumonNCode) ');	//	050915
			SQL.Add   ('VALUES (:nMasterDivision, 0, 	  0, 	   :strExCode, :strAssociation, :strName, :strNameSimple, 1, 		   :StartDate, :EndDate, 0,         1,         0,       0)');				//	050915

			ParamByName ('StartDate'  	  ).AsDateTime	:= DEF_S_DATE;
			ParamByName ('EndDate'        ).AsDateTime	:= DEF_E_DATE;
//		end;

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;
		ParamByName ('strAssociation' ).AsString	:= DialogEditAssociation.Text;
		ParamByName ('strName'        ).AsString	:= DialogEditName.Text;
		ParamByName ('strNameSimple'  ).AsString	:= DialogEditNameSimple.Text;

		ExecSQL ();

		if  (Status <> 0) then															// ｴﾗｰ
		begin
			dqMasterData.Close ();
			dqMasterTree.Close ();
			dqMasterData.Free  ();
			dqMasterTree.Free  ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	dqMasterData.Close ();
	dqMasterTree.Close ();
	dqMasterData.Free  ();
	dqMasterTree.Free  ();

	Result	:= TRUE;																	// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnCheckExCodeValue (String)												*/
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ 部門外部ｺｰﾄﾞ入力ﾁｪｯｸ											*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ												                */
//*                       外部コードの重複チェック（諸口と総合計は重複不可）                        */
//***************************************************************************************************/
function    TJNTCRP0020032f.fnCheckExCodeValue (strExCode: String): Boolean;
var
	fReturn: Boolean;

begin
	fReturn	:= FALSE;

	while (TRUE) do
	begin
		if	(not fnCheckExCodeValidCharacter (strExCode)) then
		begin
			Result	:= FALSE;
			Exit;
		end;

		if	(m_nDivision <> 1) then
		begin
			if	(Trim (strExCode) = '0') then
				Break;

			if	(m_nCodeAttribute <= 1) then
			begin
				if	(StrToInt64 (Trim (strExCode)) = 0) then
					Break;
			end;
		end;

		if	(not fnCheckMasterDataRecordValid (strExCode)) then
			Break;

		fReturn	:= TRUE;

		Break;
	end;

	if	(not fReturn) then
		fnSetErrorMessage ();

	Result	:= fReturn;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnCheckMasterDataRecordValid (Integer; String)                            */
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ 補助基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ										*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020032f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;
	//  <マスタ同期>---Start---
	strMsg		: String;
	//  <マスタ同期>--- End ---
begin
	fReturn	:= FALSE;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		//  <マスタ同期>---Start---
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT * FROM ' + DEF_HOJYOMA);
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision and RDelKbn = 0');
		if	(m_nDivision = 0) then				// 総合計登録
		begin
			SQL.Add (' and SumKbn = 9');
		end
		else									// 諸口登録
		begin
			SQL.Add (' and Syokuchikbn = 1');
		end;

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			Result	:= False;
			Close ();
			Free ();

			if	(m_nDivision = 0) then
			begin
				strMsg := MSG_REGCHK_SOKEI;
			end
			else
			begin
				strMsg := MSG_REGCHK_SYO;
			end;

			MjsMessageBoxEx(Self,strMsg,'エラー',MjWarning,MjOK,MjDefOK);
			ModalResult := mrRetry;
			Exit;
		end;

		//  <マスタ同期>--- End ---
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT * FROM ' + DEF_HOJYOMA);
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision and RDelKbn = 0 and GCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(EOF) then
			fReturn	:= True;

		Close ();
	end;

	dqMasterData.Free ();

	Result	:= fReturn;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020032f.fnSetErrorMessage ()														*/
//*																									*/
//*	目的	: 総合計/諸口登録ﾀﾞｲｱﾛｸﾞ ｴﾗｰﾒｯｾｰｼﾞ ｾｯﾄ処理												*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020032f.fnSetErrorMessage ();
begin
	Beep ();

//	DialogPanelErrorMessage     .Color	:= clBtnFace;
//	DialogPanelErrorMessage.Font.Color	:= clWindowText;
	DialogPanelErrorMessage.Caption		:= ' コードを正しく入力してください。';

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
		DialogEditExCodeNumeric.SetFocus ()
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
		DialogEditExCodeFree   .SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020032f.fnCheckExCodeValidCharacter (strExCode: String): Boolean;
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
//  FX10000
	if	(not JNTMASERRORCODECHECK (strExCode, m_strValidCharacters)) then
	begin
		Beep ();

//  FX10000
		TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (cErrorMsgRec, 30, 21);

		MJSMessageBoxEx (Self, cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, cErrorMsgRec.icontype,
											cErrorMsgRec.btntype, cErrorMsgRec.btndef, cErrorMsgRec.LogType);

		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;
end;

//**************************************************************************
//	Proccess	:	排他チェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/01/14
//	Parameter	:	nMasterDivision     Integer
//	Return		:
//	History		:	HIS0003
//**************************************************************************
function TJNTCRP0020032f.fnExcept(nMasterDivision: Integer): Integer;
//var
//    iRet            :   Integer;
//	stMessageRec    :   TMJSMsgRec;
begin
    Result      := 0;

//    m_cExcept^  := nil;

//    m_cExcept^  := TMASExceptIF.Init(m_pRec);

{
    if nMasterDivision = 41 then
        iRet    := m_cExcept^.SetExcept(541)   //部門
    else
        iRet    := m_cExcept^.SetExcept(542);  //セグメント
}

//  FX10000
{
    if iRet <> JNTMAS_EXCEPT_RET_OK then
    begin
        showmessage('排他情報セット失敗');

        Result  := -1;

        Exit;
    end;
 }

{
//    if (m_cExcept^.Status100 = 1) or (m_cExcept^.Status400 = 1) then
    begin
//  FX10000
        TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (stMessageRec, 10, 113);
        MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
                   	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

//        m_cExcept^.ResetTerm;
//        m_cExcept^.Free;
//        m_cExcept^ := nil;

//        m_cExcept^.ResetExcept(500 + nMasterDivision);

        Result  := 99;
    end;
}
end;

//<080214_2>↓
//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name		:	T.Shinoda(Lab)
//	Date		:	2008/02/14
//	Parameter	:	iSyori  0=設定 1=開放
//	History		:	9999/99/99  X.Xxxxxx
//**********************************************************************
procedure TJNTCRP0020032f.SessionPractice(iSyori: Integer);
begin
	with m_SPMsHist^ do
	begin
												// 処理区分
		ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		ParamByName('@pMSHistKbn').AsInteger	:= 1;
												// 担当者内部ｺｰﾄﾞ
		ParamByName('@pTanNCode').AsCurrency	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

		//Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする			//<D10-Stored> DEL
		ExecProc();								// ｽﾄｱﾄﾞ実行
		//UnPrepare();							// ﾘｿｰｽを解放する				//<D10-Stored> DEL
	end;
end;
//<080214_2>↑

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*																									*/
//***************************************************************************************************/

