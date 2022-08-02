//  System      :   新会計システム 支払管理システム
//  Program     :   銀行情報登録（新手数料取込）
//  ProgramID   :   JNTCRP008002
//  Name        :   T.SATOH(GSOL)
//  Create      :   2013/08/01
//  Comment		:
//	History		:	  2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//  <001> 大下(3A)   2014/01/06(MON) 電子記録債権の処理を追加
//
//  <#NGEN>		小室(Admax)		2019/03/16(MON) 新元号対応
//******************************************************************************
unit JNTCRP008002_8u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSKeyDataState,
  MjsDateCtrl,
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TJNTCRP008002_8f = class(TForm)
    DlgButtonOK: TMBitBtn;
    DlgButtonCancel: TMBitBtn;
    SpMSHist: TFDStoredProc;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    MLabel5: TMLabel;
    MLabel6: TMLabel;
    MGroupBox1: TMGroupBox;
    MPanelStartYMD: TMPanel;
    MLabel_From: TMLabel;
    MDateStartYMD: TMDateEdit;
    MLabel7: TMLabel;

	procedure	fnJNTCRP008002_8fOnCreate		(Sender: TObject);
	procedure	fnDlgFunctionOnKeyDown		(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure	fnDlgButtonOKOnClick		(Sender: TObject);
	procedure	fnDlgButtonCancelOnClick	(Sender: TObject);
    procedure MDateStartYMDExit(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	: TMDataModulef;
	m_cDBSelect		: TFDConnection;

	TantoNCode      : Int64;

    procedure SessionPractice(iSyori : Integer);

	procedure	fnInitializeStandardFeeValue	();
	function	fnUpdateRecordFeeRecord		    (dqTarget: TMQuery): Boolean;
	function	fnUpdateRecordFeeInfo			(): Boolean;
  public
    { Public 宣言 }
	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);

	procedure	CMChildKey						(var Msg: TWMKey); message CM_CHILDKEY;
  end;

var
  JNTCRP008002_8f: TJNTCRP008002_8f;

implementation

const
	MASTER_BANK		= 21;																// 銀行

	C_ST_PROCESS			= 0; 														// 設定
    C_ED_PROCESS            = 1;                                                        // 開放

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP008002_8f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);
begin
	m_pRec			:= pRec;
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		:= cDBSelect;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_8f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);

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
			MDateStartYMD.SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_8f.fnJNTCRP008002_8fOnCreate (Sender: TObject);
begin
	MJSColorChange (TJNTCRP008002_8f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MjsFontResize( TJNTCRP008002_8f(Self), Pointer(m_pRec) );

	SpMSHist.Connection := m_cDBSelect;
    //SpMSHist.SessionName  := m_cDBSelect.SessionName;

	TantoNCode := rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;

	fnInitializeStandardFeeValue ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_8f.fnDlgFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure	TJNTCRP008002_8f.fnDlgButtonOKOnClick (Sender: TObject);
begin
    if (MDateStartYMD.Value = 0) then
    begin
        // 未入力不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end
//    else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.Value)) then		// <#NGEN>
    else if (not MjsDateCtrl.MjsIntYMDChk(MDateStartYMD.AsIntYM)) then		// <#NGEN>
    begin
        // 不正日付不可
        Beep ();
        MDateStartYMD.SetFocus  ();
        Abort ();
    end;

	if	(not fnUpdateRecordFeeInfo ()) then
		Abort ();

	ModalResult	:= mrOK;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_8f.fnDlgButtonCancelOnClick (Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_8f.fnInitializeStandardFeeValue ();
var
	dqDT : TMQuery;

begin
	dqDT	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqDT);							// DBとMQueryの接続

	with (dqDT) do
	begin
        // 適用開始日プロパティ設定
        Close ();
        SQL.Clear ();
        SQL.Add   ('SELECT KEdDate, YearKbn FROM DTMAIN');
        Open ();

        if (FieldByName('YearKbn').AsInteger = 0) then 	//和暦
        begin
            MDateStartYMD.DateFormat := MjsEdits.dfEMD;
            MDateStartYMD.Gengou	 := MjsDateCtrl.MjsGetGengou(FieldByName('KEdDate').AsDateTime, MdtCMP_YM);
        end
        else
        begin
            MDateStartYMD.DateFormat := MjsEdits.dfYMD;
            MDateStartYMD.Gengou	 := #0;
        end;
	end;

	dqDT.Close ();
	dqDT.Free  ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_8f.fnUpdateRecordFeeRecord (dqTarget: TMQuery): Boolean;
var
	iLoop	    : Integer;
    sSQL1, sSQL2: String;
    sFldNm      : String;
    iBankNCode,
    iRecSyubetu : Integer;
	dqMasterData: TMQuery;

begin
    iBankNCode := 0;

	Result	:= False;

    sSQL1 := '';
    sSQL2 := '';
    iRecSyubetu := 0;

	for iLoop := 0 to dqTarget.Fields.Count - 1 do
    begin
        sFldNm := dqTarget.Fields[iLoop].FieldName;

        if (sFldNm = 'MasterKbn') or (sFldNm = 'BankNCode') or (sFldNm = 'RecSyubetu') then
        begin
            // 主キー
            if (sSQL2 <> '') then
                sSQL2 := sSQL2 + ' AND ';
            if (sFldNm = 'BankNCode') then
            begin
                sSQL2 := sSQL2 + sFldNm + ' = :iBankNCode';
                iBankNCode := dqTarget.Fields[iLoop].AsInteger;
            end
            else if (sFldNm = 'RecSyubetu') then
            begin
                sSQL2 := sSQL2 + sFldNm + ' = :iRecSyubetu';
                iRecSyubetu := dqTarget.Fields[iLoop].AsInteger;
            end
            else
                sSQL2 := sSQL2 + sFldNm + ' = ' + dqTarget.Fields[iLoop].AsString;
        end
        else
        begin
            // それ以外
            if (sSQL1 <> '') then
                sSQL1 := sSQL1 + ', ';
            if (sFldNm = 'UpdDateTM') or (sFldNm = 'InsDateTM') then
                sSQL1 := sSQL1 + sFldNm + ' = ' + AnsiQuotedStr(dqTarget.Fields[iLoop].AsString, '''')
            else
// <001> MOD↓
// 値がnullの場合の処理を追加
//                sSQL1 := sSQL1 + sFldNm + ' = ' + dqTarget.Fields[iLoop].AsString;
            begin
            	if (dqTarget.Fields[iLoop].IsNull) then
                begin
					sSQL1 := sSQL1 + sFldNm + ' = null';
                end
                else
                begin
					sSQL1 := sSQL1 + sFldNm + ' = ' + dqTarget.Fields[iLoop].AsString;
                end;
            end;
// <001> MOD↑
        end;
    end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

        // 空レコード作成
		SQL.Clear ();
		SQL.Add   ('INSERT INTO FeeInfo (MasterKbn, BankNCode, RecSyubetu) ');
		SQL.Add   ('ON EXISTING SKIP ');
		SQL.Add   ('SELECT MasterKbn, NCode, :iRecSyubetu FROM BankInfo WHERE AllBkCode = :iBankNCode ');

        ParamByName ('iBankNCode').AsInteger := iBankNCode;
        ParamByName ('iRecSyubetu').AsInteger := iRecSyubetu - 20;

        if	(not ExecSQL ()) then
        begin
            dqMasterData.Close ();
            dqMasterData.Free  ();
            Exit;
        end;

        // 新手数料→手数料更新
		SQL.Clear ();
		SQL.Add   ('UPDATE FeeInfo SET ' + sSQL1);
        if (iBankNCode = 0) then
    		SQL.Add   (' WHERE ' + sSQL2)
        else
    		SQL.Add   (' WHERE ' + StringReplace(sSQL2, '= :iBankNCode', 'IN (SELECT NCode FROM BankInfo WHERE AllBkCode = :iBankNCode)', [rfReplaceAll]));

        ParamByName ('iBankNCode').AsInteger := iBankNCode;
        ParamByName ('iRecSyubetu').AsInteger := iRecSyubetu - 20;

        if	(not ExecSQL ()) then
        begin
            dqMasterData.Close ();
            dqMasterData.Free  ();
            Exit;
        end
        else
        begin
            // 新手数料削除
            Close ();
            SQL.Clear ();
            SQL.Add   ('DELETE FROM FeeInfo');
    		SQL.Add   (' WHERE ' + sSQL2);

            ParamByName ('iBankNCode').AsInteger := iBankNCode;
            ParamByName ('iRecSyubetu').AsInteger := iRecSyubetu;

            if	(not ExecSQL ()) then
            begin
                dqMasterData.Close ();
                dqMasterData.Free  ();
                Exit;
            end;
        end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= True;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002_8f.fnUpdateRecordFeeInfo (): Boolean;
var
	dqMasterData: TMQuery;

begin
	Result	:= FALSE;

    if MjsMessageBoxEx(Self, '適用開始日が、' + MDateStartYMD.Text + '以前の新手数料を取り込みます。' + #13#10 + 'よろしいですか？' + #13#10 +
                             #13#10 +
                             '【注意】' + #13#10 +
                             '　取り込まれた「新手数料」、「新標準手数料」はすべて削除されます。', '確認', mjQuestion, mjYesNo, mjDefNo) <> mrYes then
        Exit;;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM FeeInfo');
		SQL.Add   (' WHERE MasterKbn = ' + IntToStr(MASTER_BANK));
		SQL.Add   ('   AND StartDate BETWEEN 1 AND ' + IntToStr(MjsDateCtrl.MjsDateToInt8(MDateStartYMD.AsDateTime)));
// <001> MOD↓
// 31：新電子記録債権手数料を追加
//		SQL.Add   ('   AND RecSyubetu BETWEEN 21 AND 23');
		SQL.Add   ('   AND RecSyubetu IN (21, 22, 23, 31)');
// <001> MOD↑
		SQL.Add   (' ORDER BY BankNCode, RecSyubetu');

		Open ();

		if (EOF) then
		begin
            MjsMessageBoxEX(Self, '対象データがありません。', '確認', mjInformation, mjOk, mjDefNo);
        	dqMasterData.Close ();
        	dqMasterData.Free  ();
            Exit;
		end
		else
		begin
        	m_cDataModule.BeginTran (m_cDBSelect);

            SessionPractice(C_ST_PROCESS);

            while not Eof do
            begin
                fnUpdateRecordFeeRecord(dqMasterData);
                Next;
            end;

            SessionPractice(C_ED_PROCESS);

        	m_cDataModule.Commit(m_cDBSelect);
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

    MjsMessageBoxEX(Self, '新手数料の取り込みが完了しました。', '確認', mjInformation, mjOk, mjDefNo);

	Result	:= TRUE;																	// 正常終了
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Parameter	:   iSyori 0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008002_8f.SessionPractice(iSyori : Integer);
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

procedure TJNTCRP008002_8f.MDateStartYMDExit(Sender: TObject);
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

end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

