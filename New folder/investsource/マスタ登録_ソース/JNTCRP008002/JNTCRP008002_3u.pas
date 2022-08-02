//******************************************************************************
//  System      :   新会計システム 支払管理システム
//  Program     :   銀行情報登録（標準手数料設定）
//  ProgramID   :   Pay210100
//  Name        :   ？？？
//  Create      :   ？？？
//  Comment		:
//	History		:	  2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//					2005/01/17	H.Endo ( MJS )
//					<#1>  解像度対応
//					2007/12/12  S.Suzuki( PRIME )
//  				<#2>  ﾏｽﾀ更新履歴対応
//                  2012/02/07  SATOH(GSOL)
//                  <KDS> ShiftState対応
//                  2013/08/01  T.SATOH(GSOL)
//                  <TX26>H26消費税改正対応
//					2019/03/16	S.Komuro(Admax)
//					<#NGEN>	新元号対応
//					2019/03/22	K.Adachi(Admax)
//					<#NGEN>	新元号対応( 不具合対応)
//******************************************************************************
unit JNTCRP008002_3u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSKeyDataState,	// <KDS> ADD
  MjsDateCtrl,      // <TX26> ADD
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, System.AnsiStrings, MjsStrCtrl;

type
  TJNTCRP008002_3f = class(TForm)
    DlgPanelMessage: TMPanel;
    DlgLabelMessage: TMLabel;
    DlgButtonOK: TMBitBtn;
    DlgButtonCancel: TMBitBtn;
    DlgPanelFeeList: TMPanel;
    CmnPanelFeeStandard: TMPanel;
    CmnPanelFeeListTitle0101: TMPanel;
    CmnPanelFeeListTitle0102: TMPanel;
    CmnPanelFeeListTitle0103: TMPanel;
    CmnPanelFeeListTitle0104: TMPanel;
    CmnPanelFeeListTitle0105: TMPanel;
    CmnPanelFeeStdColumn01: TMPanel;
    CmnLabelFeeUnit010101: TMLabel;
    CmnLabelFeeUnit010201: TMLabel;
    CmnLabelFeeUnit010301: TMLabel;
    CmnLabelFeeUnit010102: TMLabel;
    CmnLabelFeeUnit010202: TMLabel;
    DlgEditFeeValue0101: TMNumEdit;
    DlgEditFeeValue0201: TMNumEdit;
    DlgEditFeeValue0301: TMNumEdit;
    DlgEditFeeValue0102: TMNumEdit;
    DlgEditFeeValue0202: TMNumEdit;
    CmnPanelFeeStdColumn02: TMPanel;
    CmnLabelFeeUnit010103: TMLabel;
    CmnLabelFeeUnit010203: TMLabel;
    CmnLabelFeeUnit010303: TMLabel;
    DlgEditFeeValue0106: TMNumEdit;
    DlgEditFeeValue0206: TMNumEdit;
    DlgEditFeeValue0306: TMNumEdit;
    CmnPanelFeeStdColumn03: TMPanel;
    CmnLabelFeeUnit010104: TMLabel;
    CmnLabelFeeUnit010204: TMLabel;
    CmnLabelFeeUnit010304: TMLabel;
    DlgEditFeeValue0105: TMNumEdit;
    DlgEditFeeValue0205: TMNumEdit;
    DlgEditFeeValue0305: TMNumEdit;
    CmnPanelFeeStdColumn04: TMPanel;
    CmnLabelFeeUnit010105: TMLabel;
    CmnLabelFeeUnit010205: TMLabel;
    CmnLabelFeeUnit010305: TMLabel;
    CmnPanelFeeStdColumn05: TMPanel;
    CmnLabelFeeUnit010106: TMLabel;
    CmnLabelFeeUnit010206: TMLabel;
    CmnLabelFeeUnit010306: TMLabel;
    DlgEditFeeValue0104: TMNumEdit;
    DlgEditFeeValue0204: TMNumEdit;
    DlgEditFeeValue0304: TMNumEdit;
    DlgEditFeeValue0103: TMNumEdit;
    DlgEditFeeValue0203: TMNumEdit;
    DlgEditFeeValue0303: TMNumEdit;
    SpMSHist: TFDStoredProc;
    MPanelStartYMD: TMPanel;
    MLabel_From: TMLabel;
    MDateStartYMD: TMDateEdit;

	procedure	fnJNTCRP008002_3fOnCreate		(Sender: TObject);
	procedure	fnDlgFunctionOnKeyDown		(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDlgButtonOKOnClick		(Sender: TObject);
	procedure	fnDlgButtonCancelOnClick	(Sender: TObject);
    procedure fnDlgEditFeeListColumn02OnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MDateStartYMDExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

const


  private
    { Private 宣言 }

	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	: TMDataModulef;
	m_cDBSelect		: TFDConnection;

	m_arStandardFee	: array of String;
	TantoNCode      : Int64;

    procedure SessionPractice(iSyori : Integer);			   							// <#2> ADD ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;															// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;															// ｺｰﾄﾞ属性

    m_bIsNewFee     : Boolean;                  // 新手数料フラグ <TX26> ADD

// <TX26> MOD-STR
//	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TDataBase; pStandardFee: Pointer);
	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer; bIsNewFee: Boolean = False);
// <TX26> MOD-END

	procedure	CMChildKey						(var Msg: TWMKey); message CM_CHILDKEY;

	function	fnCheckValidFeeListValue		(): Boolean;
	function	fnGetFieldValueStandardFee		(nPosition: Integer): Integer;
	procedure	fnInitializeStandardFeeValue	();
	function	fnMakeSQLConstFeeInfoInsert		(): String;
	function	fnMakeSQLConstFeeInfoUpdate		(): String;
	function	fnUpdateRecordFeeInfo			(): Boolean;

  end;

var
  JNTCRP008002_3f: TJNTCRP008002_3f;

implementation

var
	_StandardKeyCode: Extended	= 0;
	_FeeValue		: String	= 'DlgEditFeeValue%.2d%.2d';

const
	MASTER_BANK		= 21;																// 銀行

// <#2> ADD start
	C_ST_PROCESS			= 0; 														// 設定
    C_ED_PROCESS            = 1;                                                        // 開放
// <#2> ADD end

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
// <TX26> MOD-STR
//constructor	TJNTCRP008002_3f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TDataBase; pStandardFee: Pointer);
constructor	TJNTCRP008002_3f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer; bIsNewFee: Boolean = False);
// <TX26> MOD-END
begin
	m_pRec			:= pRec;
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		:= cDBSelect;

	//m_arStandardFee	:= pStandardFee;
    Pointer(m_arStandardFee)	:= pStandardFee;

    m_bIsNewFee     := bIsNewFee;       // <TX26> ADD

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = DlgButtonOK.Name) then								// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DlgButtonCancel.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			DlgEditFeeValue0102.SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnJNTCRP008002_3fOnCreate (Sender: TObject);
// <TX26> ADD-STR
var
    iDiff: Integer;
// <TX26> ADD-END
begin
	MJSColorChange (TJNTCRP008002_3f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

// <TX26> ADD-STR
    if m_bIsNewFee then
    begin
        // 新標準手数料画面レイアウト変更
        with MPanelStartYMD do
        begin
            Top := 16;
            Left := 8;
            Visible := True;
            iDiff := Top + Height;
        end;
        DlgPanelFeeList.Top := DlgPanelFeeList.Top + iDiff;
        iDiff := iDiff + 20;
        DlgPanelMessage.Top := DlgPanelMessage.Top + iDiff;
        DlgButtonOK.Top := DlgButtonOK.Top + iDiff;
        DlgButtonCancel.Top := DlgButtonCancel.Top + iDiff;
        Height := Height + iDiff;
    end;
// <TX26> ADD-END

	MjsFontResize( TJNTCRP008002_3f(Self), Pointer(m_pRec) );						//<#1>

// <#2> ADD start
	SpMSHist.Connection := m_cDBSelect;
    //SpMSHist.SessionName  := m_cDBSelect.SessionName;
// <#2> ADD end
	TantoNCode := rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;

	fnInitializeStandardFeeValue ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnDlgFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
		MJSDispCtrl.MJSNextCtrl (Self)
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MJSPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MJSNextCtrl (Self);
		end
		else
			MJSDispCtrl.MJSNextCtrl (Self);
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnDlgEditFeeListColumn02OnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	nPrevFee: Extended;
	nRow	: Integer;

begin
	if	((Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not ((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN))) then				// Altｷｰが押された時以外
		begin
			nRow		:= StrToInt (Copy (TMNumEdit (Sender).Name, 16, 2));
			nPrevFee	:= TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, 1]))).Value;

			if	(TMNumEdit (Sender).AsInteger <= nPrevFee) then
			begin
				Beep ();

				TMNumEdit (Sender).SetFocus  ();
				TMNumEdit (Sender).SelectAll ();

				Exit;
			end;

			TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow + 1, 1]))).Value	:= TMNumEdit (Sender).Value;
		end;
	end;

	fnDlgFunctionOnKeyDown (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnDlgButtonOKOnClick (Sender: TObject);
begin
// <TX26> ADD-STR
    if m_bIsNewFee then
    begin
        // 新標準手数料
        if (MDateStartYMD.Value = 0) then
        begin
            // 未入力不可
			Beep ();
			MDateStartYMD.SetFocus  ();
    		Abort ();
        end
//        else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.Value)) then		// <#NGEN>
        else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.AsIntYM)) then		// <#NGEN>
        begin
            // 不正日付不可
            Beep ();
            MDateStartYMD.SetFocus  ();
            Abort ();
        end;
    end;
// <TX26> ADD-END

	if	(not fnCheckValidFeeListValue ()) then
		Abort ();

	if	(not fnUpdateRecordFeeInfo ()) then
		Abort ();

	ModalResult	:= mrOK;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnDlgButtonCancelOnClick (Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_3f.fnCheckValidFeeListValue (): Boolean;
var
	cNumEdit: TMNumEdit;
	nPrevFee: Extended;
	nRow	: Integer;

begin
	for	nRow := 1 to 2 do
	begin
		cNumEdit	:= TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, 2])));
		nPrevFee	:= TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, 1]))).Value;

		if	(cNumEdit.AsInteger <= nPrevFee) then
		begin
			Beep ();

			cNumEdit.SetFocus  ();
			cNumEdit.SelectAll ();

			Result	:= FALSE;
			Exit;
		end;

		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow + 1, 1]))).Value	:= cNumEdit.Value;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_3f.fnGetFieldValueStandardFee (nPosition: Integer): Integer;
var
	nCount	   : Integer;
	nFieldValue: Integer;

begin
	nFieldValue	:= 0;

	for	nCount := 1 to StrLen (PChar (m_arStandardFee [nPosition])) do
	begin
		if	(Copy (m_arStandardFee [nPosition], nCount, 1) = '=') then
		begin
			nFieldValue	:= StrToInt (Copy (m_arStandardFee [nPosition], nCount + 1, 256));
			Break;
		end;
	end;

	Result	:= nFieldValue;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_3f.fnInitializeStandardFeeValue ();
var
	dqFeeInfo : TMQuery;
	arBasedFee: array [1.. 3] of Extended;
	arFeeValue: array [0..11] of Integer;
	nRow	  : Integer;
	nColumn	  : Integer;
	nPosition : Integer;
    bStartDateIsZero : Boolean;		// 適用開始日がゼロの時はTRUE														//<#NGEN1> Add

begin
	bStartDateIsZero	:= True;	// 初期化																			//<#NGEN1> Add

	dqFeeInfo	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqFeeInfo);							// DBとMQueryの接続

	with (dqFeeInfo) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM FeeInfo ');
// <TX26> ADD-STR
        if m_bIsNewFee then
        begin
            // 新標準手数料の場合、RecSyubetu=21を優先して取得
    		SQl.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu IN (1, 21)');
    		SQl.Add   ('ORDER  BY RecSyubetu DESC');
        end
        else
// <TX26> ADD-END
    		SQl.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu = 1');

		ParamByName ('nMasterDivision').AsInteger := MASTER_BANK;
		ParamByName ('strBankCode'    ).AsFloat   := _StandardKeyCode;

		Open ();

		arBasedFee [1]	:= 0;

		if	(not EOF) then
		begin
// <TX26> ADD-STR
            if m_bIsNewFee then
            begin
                // 新標準手数料の場合、適用開始日を取得
                if (FieldByName ('RecSyubetu').AsInteger = 21) then
                begin																									//<#NGEN1> Add
                    MDateStartYMD.AsDateTime := MjsDateCtrl.MjsIntToDate(FieldByName ('StartDate').AsInteger, #0);
                    if FieldByName ('StartDate').AsInteger > 0 then bStartDateIsZero := False;							//<#NGEN1> Add
                end;																									//<#NGEN1> Add
            end;
// <TX26> ADD-END
			arBasedFee [2]	:= FieldByName ('FeeStand1').AsCurrency;					// 分割基準額1
			arBasedFee [3]	:= FieldByName ('FeeStand2').AsCurrency;					// 分割基準額2

			nPosition	:= 0;

			for	nColumn := 1 to 4 do
			begin
				for	nRow := 1 to 3 do
				begin
					arFeeValue [nPosition]	:= FieldByName ('Fee' + IntToStr (nColumn) + IntToStr (nRow)).AsInteger;

					nPosition	:= nPosition + 1;
				end;
			end;
		end
		else
		begin
			arBasedFee [2]	:= fnGetFieldValueStandardFee (0);							// 分割基準額1
			arBasedFee [3]	:= fnGetFieldValueStandardFee (1);							// 分割基準額2

			for	nPosition := 0 to 11 do
				arFeeValue [nPosition]	:= fnGetFieldValueStandardFee (nPosition + 2);
		end;

// <TX26> ADD-STR
        if m_bIsNewFee then
        begin
            // 新標準手数料の適用開始日プロパティ設定
            Close ();
            SQL.Clear ();
            SQL.Add   ('SELECT KEdDate, YearKbn FROM DTMAIN');
            Open ();

            if (FieldByName('YearKbn').AsInteger = 0) then 	//和暦
            begin
                MDateStartYMD.DateFormat := MjsEdits.dfEMD;
//<#NGEN1> Mod St
//                MDateStartYMD.Gengou	 := MjsDateCtrl.MjsGetGengou(FieldByName('KEdDate').AsDateTime, MdtCMP_YM);
				if bStartDateIsZero then
                begin
                	MDateStartYMD.Gengou	 := MjsDateCtrl.MjsGetGengou(FieldByName('KEdDate').AsDateTime, MdtCMP_YM);
                end;
//<#NGEN1> Mod Ed
            end
            else
            begin
                MDateStartYMD.DateFormat := MjsEdits.dfYMD;
                MDateStartYMD.Gengou	 := #0;
            end;
        end;
// <TX26> ADD-END
	end;

	dqFeeInfo.Close ();
	dqFeeInfo.Free  ();

	nPosition	:= 0;

	for	nColumn := 1 to 6 do
	begin
		for	nRow := 1 to 3 do
		begin
			if	((nRow = 3) and (nColumn = 2)) then
				Continue;

			case (nColumn) of
				1:	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, nColumn]))).Value	:= arBasedFee [nRow];
				2:	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, nColumn]))).Value	:= arBasedFee [nRow + 1];
				else
				begin
					TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, nColumn]))).Value	:= arFeeValue [nPosition];

					nPosition	:= nPosition + 1;
				end;
			end;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_3f.fnMakeSQLConstFeeInfoInsert (): String;
var
	nColumn	   : Integer;
	nRow	   : Integer;
	strSQLConst: String;
    iRecSyubetu: Integer;   // <TX26> ADD
begin
	strSQLConst	:= 'INSERT INTO FeeInfo  (' + 'MasterKbn ,'								// ﾏｽﾀ区分
											+ 'UpdTantoNCode,'  		   				// 担当者内部ｺｰﾄﾞ
											+ 'BankNCode  ,'  							// 銀行ｺｰﾄﾞ
											+ 'RecSyubetu,'								// ﾚｺｰﾄﾞ種別
											+ 'FeeStand1 ,'								// 分割基準額1
											+ 'FeeStand2 ,'								// 分割基準額2
											+ 'Fee11     ,'								// 他銀行(電信)1
											+ 'Fee12     ,'								// 他銀行(電信)2
											+ 'Fee13     ,'								// 他銀行(電信)3
											+ 'Fee21     ,'								// 他銀行(文書)1
											+ 'Fee22     ,'								// 他銀行(文書)2
											+ 'Fee23     ,'								// 他銀行(文書)3
											+ 'Fee31     ,'								// 同銀行他支店1
											+ 'Fee32     ,'								// 同銀行他支店2
											+ 'Fee33     ,'								// 同銀行他支店3
											+ 'Fee41     ,'								// 同銀行同支店1
											+ 'Fee42     ,'								// 同銀行同支店2
											+ 'Fee43      ';							// 同銀行同支店3
// <TX26> ADD-STR
    strSQLConst := strSQLConst + ', StartDate';                                         // 適用開始日

    if m_bIsNewFee then
        iRecSyubetu := 21
    else
        iRecSyubetu := 1;
// <TX26> ADD-END

	strSQLConst	:= strSQLConst + ') VALUES ('
							   + Format ('%d,'    , [MASTER_BANK     ])					// ﾏｽﾀ区分
							   + Format ('%d,'    , [TantoNCode      ])					// 担当者内部ｺｰﾄﾞ
							   + Format ('%g,'    , [_StandardKeyCode])					// 銀行ｺｰﾄﾞ
// <TX26> MOD-STR
//							   + Format ('%d,'    , [1               ])					// ﾚｺｰﾄﾞ種別
							   + Format ('%d,'    , [iRecSyubetu     ])					// ﾚｺｰﾄﾞ種別
// <TX26> MOD-END

					+ Format ('%d,', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [1, 2]))).Value)])
					+ Format ('%d ', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [2, 2]))).Value)]);

// <TX26> MOD-STR
//	for	nRow := 1 to 3 do
//	begin
//		for	nColumn := 3 to 6 do
    for	nColumn := 3 to 6 do
	begin
    	for	nRow := 1 to 3 do
// <TX26> MOD-END
			strSQLConst	:= strSQLConst + Format (',%d', [Trunc (TMNumEdit (
								  		 		MJSFindCtrl (Self, Format (_FeeValue, [nRow, nColumn]))).Value)]);
	end;

// <TX26> ADD-STR
    // 適用開始日
    strSQLConst := strSQLConst + ', ' + IntToStr(MjsDateCtrl.MjsDateToInt8(MDateStartYMD.AsDateTime));
// <TX26> ADD-END

	Result	:= strSQLConst + ')';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_3f.fnMakeSQLConstFeeInfoUpdate (): String;
var
	nColumn	   : Integer;
	nRow	   : Integer;
	strSQLConst: String;
    iRecSyubetu: Integer;   // <TX26> ADD
begin
	strSQLConst	:= 'UPDATE FeeInfo SET '
		+ Format ('UpdTantoNCode = %d,', [TantoNCode])
		+ Format ('FeeStand1 = %d,', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [1, 2]))).Value)])
		+ Format ('FeeStand2 = %d ', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [2, 2]))).Value)]);

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 3 to 6 do
			strSQLConst	:= strSQLConst + Format (', Fee%d%d = %d', [nColumn - 2, nRow,
							Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nRow, nColumn]))).Value)]);
	end;

// <TX26> ADD-STR
    strSQLConst := strSQLConst + ', StartDate = ' + IntToStr(MjsDateCtrl.MjsDateToInt8(MDateStartYMD.AsDateTime));

    if m_bIsNewFee then
        iRecSyubetu := 21
    else
        iRecSyubetu := 1;
// <TX26> ADD-END

	strSQLConst	:= strSQLConst + ' WHERE '
							+ Format ('MasterKbn  = %d     AND ', [MASTER_BANK     ])	// ﾏｽﾀ区分
							+ Format ('BankNCode  = %g     AND ', [_StandardKeyCode])	// 外部ｺｰﾄﾞ
// <TX26> MOD-STR
//							+ Format ('RecSyubetu = %d'         , [1               ]);	// ﾚｺｰﾄﾞ種別
							+ Format ('RecSyubetu = %d'         , [iRecSyubetu     ]);	// ﾚｺｰﾄﾞ種別
// <TX26> MOD-END

	Result	:= strSQLConst;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_3f.fnUpdateRecordFeeInfo (): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT BankNCode FROM FeeInfo ');
// <TX26> ADD-STR
        if m_bIsNewFee then
            // 新標準手数料の場合、RecSyubetu=21
    		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu = 21')
        else
// <TX26> ADD-END
    		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu = 1');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strBankCode'    ).AsFloat 	:= _StandardKeyCode;

		Open ();

		if	(EOF) then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstFeeInfoInsert ());
		end
		else
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstFeeInfoUpdate ());
		end;

        SessionPractice(C_ST_PROCESS);			// <#2> ADD

		ExecSQL ();

        SessionPractice(C_ED_PROCESS);			// <#2> ADD
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行 <#2>
//	Name		:	S.Suzuki
//	Date		:	2007/12/11
//	Parameter	:   iSyori 0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008002_3f.SessionPractice(iSyori : Integer);
begin
												// 処理区分
	SpMSHist.ParamByName('@pSyoriKbn').AsInteger := iSyori;
			                   					// 履歴取得区分
	SpMSHist.ParamByName('@pMSHistKbn').AsInteger    := 1;
    											// 担当者内部ｺｰﾄﾞ
    SpMSHist.ParamByName('@pTanNCode').AsCurrency    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    											// 担当者名称
    SpMSHist.ParamByName('@pTanSimpleName').AsString := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
    											// ｼｽﾃﾑｺｰﾄﾞ
    SpMSHist.ParamByName('@pSysCode').AsInteger      := m_pRec^.m_iSystemCode;
    											// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SpMSHist.ParamByName('@pOptCode').AsInteger      := m_pRec^.m_iOptionCode;
    											// 処理ｺｰﾄﾞ
    SpMSHist.ParamByName('@pPrgCode').AsInteger      := m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SpMSHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SpMSHist.FetchOptions.Items := SpMSHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SpMSHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SpMSHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

// <TX26> ADD-STR
procedure TJNTCRP008002_3f.MDateStartYMDExit(Sender: TObject);
begin
//    if (MDateStartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.Value)) then		// <#NGEN>
    if (MDateStartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.AsIntYM)) then		// <#NGEN>
    begin
        // 不正日付不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end;
end;

procedure TJNTCRP008002_3f.FormShow(Sender: TObject);
begin
	if m_bIsNewFee then
	begin
		Self.Caption := '新標準手数料設定';
		MDateStartYMD.SetFocus();
	end
	else
	begin
		Self.Caption := '標準手数料設定';
		DlgEditFeeValue0102.SetFocus();
	end;
end;
// <TX26> ADD-END

end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

