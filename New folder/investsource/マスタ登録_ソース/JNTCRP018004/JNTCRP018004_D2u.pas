//******************************************************************************
//	System		:	FX_会計システム
//	Program		:	工事/プロジェクト 作業内訳/工種登録
//                  諸口ダイアログ
//	ProgramID	:	JNTCRP018004_D2u
//	Name		:   K.Iiduka(LEAD)
//	Create		:	2005 / 03 / 02
//	Comment		:   MJSLINK財務大将よりGalileoptへｺﾝﾊﾞｰﾄ
//
//	History		:
//
//==============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   高橋 功二   2007.02.23(FRI) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <SYNC>  茂木 勇次   2007.03.07(WED) 同期処理を別ｸﾗｽで管理。
//  <   >   鈴木(PRIME) 2007.07.17(TUE) ｺｰﾄﾞ16桁対応
//  <002>   大竹 文顕   2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//	<003>	関(PRIME)	2008.05.09(FRI)	J-SOXﾏｽﾀ更新履歴対応
//******************************************************************************
unit JNTCRP018004_D2u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  JNTMasComu, MJSCommonu, MJSMsgStdu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl, MJSStrCtrl,
  VCL.StdCtrls, Buttons, MJSBitBtn, MJSEdits, VCL.ExtCtrls, MJSPanel, MJSDBModuleu,
  MJSLabel, JNTCommonu, dxmdaset, Db, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  {$include JNTCRPSyncMasterH.inc}    // <SYNC>

  TJNTCRP018004_D2f = class(TForm)
    DialogEditExCodeNumeric     : TMNumEdit;
    DialogEditAssociation       : TMTxtEdit;
    DialogEditName              : TMTxtEdit;
    DialogEditNameSimple        : TMTxtEdit;
    DialogEditExCodeFree        : TMTxtEdit;
    DialogPanelErrorMessage     : TMPanel;
    MLabel1                     : TMLabel;
    MLabel2                     : TMLabel;
    MLabel3                     : TMLabel;
    MLabel4                     : TMLabel;
    DialogButtonRegistration    : TMBitBtn;
    BCancel                     : TMBitBtn;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

    procedure FormCreate(Sender: TObject);
    procedure DialogEditExCodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DialogEditAssociationKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DialogButtonRegistrationClick(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			  : ^TMjsAppRecord;									        // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	  : TMDataModulef;
	m_cCDBSelect	  : TFDConnection;
	m_nMasterDivision : Integer;
	m_nCodeDigit	  : Integer;
	m_nCodeAttribute  : Integer;
	m_strValidChar    : String;

    m_pSyncMaster     : ^TSyncMaster;    // <SYNC>

	function	fnRegistrationGeneralRecord(strExCode: String): Boolean;
	function	fnCheckExCodeValue(strExCode: String): Integer;
	function	fnCheckMasterDataRecordValid(): Integer;
	function	fnCheckValidExCodeCharacter(strExCode: String): Boolean;
	procedure	fnSetErrorMessage(iErrCode: Integer);
	procedure	SessionPractice(iSyori: Integer);	// <003>

  public
    { Public 宣言 }
(*
	constructor	fnCreateDialog(pRec: Pointer; AOwner: TComponent;
                                 cCDBSelect, cPDBSelect: TDataBase;
                                 nMstKbn, nCodeDigit, nCodeAttribute: Integer;
                                 strValidChar: String; nSegNCode: Extended);
*) // <SYNC>

    // <SYNC>
    constructor	fnCreateDialog  (pRec: Pointer; AOwner: TComponent;
                                 cCDBSelect: TFDConnection;
                                 nMstKbn, nCodeDigit, nCodeAttribute: Integer;
                                 strValidChar: String; pSyncMaster: Pointer);
  end;

const
	// -----<003> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<003> Add-Ed-----

var
  JNTCRP018004_D2f: TJNTCRP018004_D2f;

implementation


{$R *.DFM}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTCRPSyncMasterB.inc}    // <SYNC>

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ ｺﾝｽﾄﾗｸﾀ
//	Name		:
//	Date		:
//	Parameter	:
//	Return		:   なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
(*
constructor TJNTCRP018004_D2f.fnCreateDialog(
    pRec: Pointer; AOwner: TComponent; cCDBSelect, cPDBSelect: TDataBase;
    nMstKbn, nCodeDigit, nCodeAttribute: Integer; strValidChar: String; nSegNCode: Extended);
*) // <SYNC>
constructor TJNTCRP018004_D2f.fnCreateDialog(
    pRec: Pointer; AOwner: TComponent; cCDBSelect: TFDConnection;
    nMstKbn, nCodeDigit, nCodeAttribute: Integer; strValidChar: String;
    pSyncMaster: Pointer); // <SYNC>
begin

	m_pRec			  := pRec;
	m_cDataModule	  := TMDataModulef(m_pRec^.m_pDBModule^);
	m_cCDBSelect	  := cCDBSelect;
	m_nMasterDivision := nMstKbn;
	m_nCodeDigit	  := nCodeDigit;
	m_nCodeAttribute  := nCodeAttribute;
	m_strValidChar    := strValidChar;
    m_pSyncMaster     := pSyncMaster;   // <SYNC>

	inherited Create(AOwner);

end;

procedure TJNTCRP018004_D2f.FormCreate(Sender: TObject);
var
	strFormat : String;
begin
	// -----<003> Add-St-----
	SPMsHist.Connection := m_cCDBSelect;
	//SPMsHist.SessionName  := m_cCDBSelect.SessionName;

	if	m_pSyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
		SPMsHistParent.Connection	:= m_pSyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_pSyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<003> Add-Ed-----

	MJSColorChange(TJNTCRP018004_D2f(Self), 0, 0, 0, 0,
        rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	DialogEditExCodeNumeric.Visible	:= True;

	if (m_nCodeAttribute <= 1) then	        // ｺｰﾄﾞ属性: 数字
	begin
		DialogEditExCodeFree   .Visible	:= False;
		DialogEditExCodeNumeric.Visible	:= True;

		if	(m_nCodeAttribute = 1) then
			    strFormat := StringOfChar ('0', m_nCodeDigit)
		else    strFormat := '';

		DialogEditExCodeNumeric.FormatStr := strFormat;
		DialogEditExCodeNumeric.Value	  := 0;
		DialogEditExCodeNumeric.Digits	  := m_nCodeDigit;
		DialogEditExCodeNumeric.MaxValue  := StrToInt64 (StringOfChar ('9', m_nCodeDigit));
	end
	else								    // ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DialogEditExCodeNumeric.Visible	  := False;
		DialogEditExCodeFree   .Visible	  := True;
		DialogEditExCodeFree   .Text	  := '';
		DialogEditExCodeFree   .MaxLength := m_nCodeDigit
	end;

	Caption							:= '諸口登録';
	DialogEditName         .Text	:= '諸口';
	DialogEditNameSimple   .Text	:= '諸口';
	DialogPanelErrorMessage.Caption	:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';

	MjsFontResize(TJNTCRP018004_D2f( Self )	,Pointer(m_pRec));

end;

procedure TJNTCRP018004_D2f.DialogEditExCodeKeyDown
                (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if ( Key = VK_RETURN ) then
    begin
		MjsDispCtrl.MjsNextCtrl (Self)
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
			if (MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
        begin
			MJSDispCtrl.MjsPrevCtrl (Self);
        end;
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
        begin
			MJSDispCtrl.MjsNextCtrl (Self);
        end;
	end;

end;

procedure TJNTCRP018004_D2f.DialogEditAssociationKeyDown
                (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if (Key = VK_RETURN) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	((TMTxtEdit(Sender).Name = DialogEditName.Name) and
				 (DialogEditNameSimple.Text = '')) then
				DialogEditNameSimple.Text := MJSKabuCut (DialogEditName.Text, 14);
		end;

		MjsDispCtrl.MjsNextCtrl(Self);
	end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if (Sender is TMTxtEdit) then
		begin
			if (MJSChkCurTop(Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl(Self);
		end
		else
        begin
			MJSDispCtrl.MjsPrevCtrl(Self);
        end;
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if (MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl(Self);
		end
		else
        begin
			MJSDispCtrl.MjsNextCtrl(Self);
        end;
	end
	else if	(Key = VK_F8) then
	begin
		if (Sender is TMTxtEdit) then
		begin
			if ((TMTxtEdit(Sender).Name = DialogEditNameSimple.Name) and
				                            (DialogEditName.Text <> '')) then
				DialogEditNameSimple.Text := MJSKabuCut (DialogEditName.Text, 14);
		end;
	end;

end;

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ ﾎﾞﾀﾝ[登録] OnClick ｲﾍﾞﾝﾄ
//	Name		:
//	Date		:
//	Parameter	:   なし
//	Return		:   なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP018004_D2f.DialogButtonRegistrationClick(Sender: TObject);
var
	strExCode : String;
	fReturn	  : Boolean;
    iErrCode  : Integer;

begin

	if ( m_nCodeAttribute <= 1 ) then										    // ｺｰﾄﾞ属性: 数字
		strExCode := Format('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																		// ｺｰﾄﾞ属性: ﾌﾘｰ
		strExCode := DialogEditExCodeFree.Text;

    iErrCode := fnCheckExCodeValue(strExCode);                                  // 外部ｺｰﾄﾞ入力ﾁｪｯｸ

    case iErrCode of
        -1:     // 子に存在⇒諸口ﾀﾞｲｱﾛｸﾞを閉じて、当該画面をﾘﾌﾚｯｼｭ
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_REGCHK_SYO,
                            'マスタ同期', mjInformation, mjOk, mjDefOk);

            ModalResult :=  mrOK;   // 子会社で同期配信済
            Exit;
        end;
        -97,    // ｺｰﾄﾞに不正な文字あり
        -98,    // 同期ｷｬﾝｾﾙ
        -99:    // その他異常終了
        begin
            if (m_nCodeAttribute <= 1) then		 								// ｺｰﾄﾞ属性: 数字
                DialogEditExCodeNumeric.SetFocus()
            else									 							// ｺｰﾄﾞ属性: ﾌﾘｰ
                DialogEditExCodeFree.SetFocus();

            Exit;
    	end;
    end;

    // 正常な場合は諸口ﾚｺｰﾄﾞを作成する<SYNC>
    if (iErrCode = 0) then
    begin
		// -----<003> Add-St-----
		SessionPractice(C_ST_PROCESS);

		try
		// -----<003> Add-Ed-----

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran ( m_pSyncMaster.m_cCDBSelect );

        // HojyoMAへ登録
        fReturn	:= fnRegistrationGeneralRecord ( strExCode );

        if ( not fReturn ) then // ｴﾗｰ
        begin
            if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
            // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_pSyncMaster.m_cCDBSelect );
            exit;
        end;

        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
        begin
            if ( m_pSyncMaster.fnCall_SYNC(10) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cCDBSelect );
                exit;
            end;
        end;

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのｺﾐｯﾄを実行する
            m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_pSyncMaster.m_cCDBSelect );

		// -----<003> Add-St-----
		finally
			SessionPractice(C_ED_PROCESS);
		end;
		// -----<003> Add-Ed-----
    end;
    // ↑↑↑<SYNC>

	ModalResult	:= mrOK;

end;

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ 諸口ﾚｺｰﾄﾞ登録取得
//	Name		:
//	Date		:
//	Parameter	:   strExCode   : 総合計部門ｺｰﾄﾞ
//	Return		:   Boolean, (TRUE:正常終了, FALSE:異常終了)
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP018004_D2f.fnRegistrationGeneralRecord(strExCode: String): Boolean;
var
	dqMasterData: TMQuery;

begin

	Result := True;

    // MQueryの構築
	dqMasterData := TMQuery.Create(Self);

    // DBとMQueryの接続<SYNC>
    if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
	    m_cDataModule.SetDBInfoToQuery(m_pSyncMaster.m_cPDBSelect, dqMasterData)    // 子会社DB
    else
	    m_cDataModule.SetDBInfoToQuery(m_pSyncMaster.m_cCDBSelect, dqMasterData);   // 親会社DB

    try
        with ( dqMasterData ) do
        begin
            Close();
            SQL.Clear();
            SQL.Add('insert into HojyoMA (');
            SQL.Add(' MasterKbn, SumKbn, RDelKbn, GCode, Renso, LongName,');
            SQL.Add(' SimpleName, SyokuchiKbn, TStartDate,TEndDate,      ');
            SQL.Add(' UpdTantoNCode)                                     '); // <002>
            SQL.Add('values (:nMasterDivision, 0, 0, :strExCode,         ');
            SQL.Add(' :strAssociation, :strName, :strNameSimple, 1,      ');
            SQL.Add(' :TStartDate, :TEndDate,                            ');
            SQL.Add(' :UpdTantoNCode)                                    '); // <002>

            ParamByName('TStartDate').AsDateTime  	 := StrToDate('1900/01/01');
            ParamByName('TEndDate').AsDateTime       := StrToDate('2099/12/31');
            ParamByName('nMasterDivision').AsInteger := m_nMasterDivision;
            ParamByName('strExCode'      ).AsString  := strExCode;
            ParamByName('strAssociation' ).AsString  := DialogEditAssociation.Text;
            ParamByName('strName'        ).AsString  := DialogEditName.Text;
            ParamByName('strNameSimple'  ).AsString  := DialogEditNameSimple.Text;
            ParamByName('UpdTantoNCode').AsFloat     := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <002>

            ExecSQL();

            if (Status <> 0) then
            begin
                Result := false;                			                    // ｴﾗｰ
                Exit;
            end;
        end;
    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;

end;

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ 外部ｺｰﾄﾞ入力ﾁｪｯｸ
//	Name		:
//	Date		:
//	Parameter	:   strExCode   : 外部ｺｰﾄﾞ
//	Return		:   Integer     : 0:正常終了, -1:子に存在, -2:親に存在(同期)
//                              : -97:ｺｰﾄﾞに不正な文字あり
//                              : -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP018004_D2f.fnCheckExCodeValue(strExCode: String): Integer;
begin

    Result := 0;

    // ｺｰﾄﾞﾁｪｯｸ
	if (not fnCheckValidExCodeCharacter(strExCode)) then
	begin
		Result := -97;
		fnSetErrorMessage(Result);
		Exit;
	end;

    // ﾚｺｰﾄﾞ存在ﾁｪｯｸ
    Result := fnCheckMasterDataRecordValid();
	if (Result = -99) then
		fnSetErrorMessage(Result);

end;

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ 外部ｺｰﾄﾞ存在ﾁｪｯｸ
//	Name		:
//	Date		:
//	Parameter	:   strExCode   : 外部ｺｰﾄﾞ
//	Return		:   Integer     : 0:正常終了, -1:子に存在, -2:親に存在(同期)
//                              : -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP018004_D2f.fnCheckMasterDataRecordValid(): Integer;
var
	Qe          :   TMQuery;
    strQry      :   String;
    iMastKbn    :   Integer;
    iSumKbn     :   Integer;
    iRDelKbn    :   Integer;
    strGCode    :   String;
    nPNCode     :   Extended;
    bRet        :   Boolean;

begin

	Result := 0;

    // MQueryの構築
	Qe := TMQuery.Create(Self);

    try
        //----------------------------------------
        // 子会社の存在ﾁｪｯｸ
        //----------------------------------------

        // 子会社DBとMQueryの接続
	    m_cDataModule.SetDBInfoToQuery(m_pSyncMaster.m_cCDBSelect, Qe);

        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select * from HojyoMA       ');
        Qe.SQL.Add('where MasterKbn   = :pMstkbn');
        Qe.SQL.Add(' and  Syokuchikbn = 1       ');
        Qe.SQL.Add(' and  RDelKbn     = 0       ');

        Qe.ParamByName('pMstKbn').Asinteger := m_nMasterDivision;

        if ( Qe.Open = False ) then
        begin
			Result := -99;  // SQLｴﾗｰ
            Exit;
        end;

		if ( not Qe.Eof ) then
        begin
			Result := -1;   // 存在有
            Exit;
        end;

        //----------------------------------------
        // 親会社の存在ﾁｪｯｸ
        //----------------------------------------
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then  // ｸﾞﾙｰﾌﾟ管理有
        begin
            Qe.Close();
            // 親会社DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery(m_pSyncMaster.m_cPDBSelect, Qe);

            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add(strQry);
            Qe.SQL.Add('select * from HojyoMA        ');
            Qe.SQL.Add('where (MasterKbn = :pMstkbn) ');
            Qe.SQL.Add(' and  (Syokuchikbn = 1)      ');
            Qe.SQL.Add(' and  (RDelKbn     = 0)      ');
            Qe.ParamByName('pMstKbn').Asinteger := m_nMasterDivision;

            if ( Qe.Open = False ) then
            begin
    			Result := -99;
                Exit;
            end;

            // 親に諸口が存在していた場合は無条件で関連付を行う
            if not Qe.Eof then
            begin
                if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC,
                                     '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
                begin
                    // HojyoMA_Relｷｰ情報を取得
                    iMastKbn := Qe.FieldByName('MasterKbn').AsInteger;
                    nPNCode  := Qe.FieldByName('NCode').AsFloat;

                    // HojyoMA_Relの存在ﾁｪｯｸ
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('select * from HojyoMA_Rel           ');
                    Qe.SQL.Add('where (MasterKbn   = :pMstkbn)      ');
                    Qe.SQL.Add(' and  (NCode       = :pNCode)       ');
                    Qe.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');
                    Qe.ParamByName('pMstkbn'     ).AsInteger := iMastKbn;
                    Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    Qe.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;

                    if ( Qe.Open() = false ) then
                    begin
                        result := -99;
                        Exit;
                    end;

                    if ( Qe.Eof ) then
                            bRet := True
                    else    bRet := False;

                    // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    m_cDataModule.BeginTran(m_pSyncMaster.m_cPDBSelect);
                    // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    m_cDataModule.BeginTran(m_pSyncMaster.m_cCDBSelect);

                    try
                        // 親会社のHojyoMA_Relの更新
                        if ( bRet ) then    // 新規挿入
                        begin
                            Qe.Close();
                            Qe.SQL.Clear();
                            Qe.SQL.Add('insert into HojyoMA_Rel (            ');
                            Qe.SQL.Add('    MasterKbn ,NCode ,GrpSegNCode    ');
                            Qe.SQL.Add('   ,RDelKbn_REL ,MainSegNCode)       ');
                            Qe.SQL.Add('values (                             ');
                            Qe.SQL.Add('    :pMstkbn ,:pNCode                ');
                            Qe.SQL.Add('   ,:pGrpSegNCode ,0 ,0)             ');
                        end
                        else
                        begin
                            Qe.Close();
                            Qe.SQL.Clear();
                            Qe.SQL.Add('update HojyoMA_Rel set               ');
                            Qe.SQL.Add('    RDelKbn_REL = 0                  ');
                            Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                            Qe.SQL.Add('where  (MasterKbn   = :pMstkbn)      ');
                            Qe.SQL.Add('  and  (NCode       = :pNCode)       ');
                            Qe.SQL.Add('  and  (GrpSegNCode = :pGrpSegNCode) ');
                        end;

                        Qe.ParamByName('pMstkbn'     ).AsInteger := iMastKbn;
                        Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                        Qe.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;

                        if Qe.ExecSQL = False then
                        begin
                            MjsMessageBoxEx (Self,
                                             '自社への関連付けに失敗しました。',
                                             'マスタ同期', mjError, mjOk, mjDefOk);
                            Abort;
                        end;

                        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                        if ( m_pSyncMaster.fnCall_SYNC(10) = False ) then
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cCDBSelect );
                            Abort;
                        end;
                    except
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_pSyncMaster.m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;

                    // 親会社DBに対してｺﾐｯﾄを実行する
                    m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
                    // 子会社DBに対してｺﾐｯﾄを実行する
                    m_cDataModule.Commit ( m_pSyncMaster.m_cCDBSelect );
                    Result := -2;
                    Exit;
                end
                else
                begin
                    Result := -98;
                    exit;
                end;
            end;
        end;
    finally
        Qe.Close();
        Qe.Free();
    end;

end;

//**********************************************************************
//	Proccess	:   諸口登録ﾀﾞｲｱﾛｸﾞ ｺｰﾄﾞﾁｪｯｸ
//	Name		:
//	Date		:
//	Parameter	:   strExCode   : 外部ｺｰﾄﾞ
//	Return		:   Boolean, (TRUE:正常終了, FALSE:異常終了)
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP018004_D2f.fnCheckValidExCodeCharacter(strExCode: String): Boolean;
begin

	if (Trim(strExCode) = '') then
	begin
		Beep();

		Result := False;
		Exit;
	end;

	if (m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
	begin
		Result := True;
		Exit;
	end;

	if (not JNTMASERRORCODECHECK(strExCode, m_strValidChar)) then
	begin
		Beep();
		Result := False;
		Exit;
	end;

	Result  := True;

end;

procedure TJNTCRP018004_D2f.fnSetErrorMessage(iErrCode: Integer);
begin

	Beep();

    case iErrCode of
    - 1: DialogPanelErrorMessage.Caption := ' コードを正しく入力してください。';
    -99: DialogPanelErrorMessage.Caption := ' 登録が異常終了しました。';
    end;

	DialogEditExCodeNumeric.SetFocus();

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<003>
//	Name		:	T.Seki
//	Date		:	2008/05/09
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP018004_D2f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SPMsHist.Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc();						// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare();						// ﾘｿｰｽを解放する
// Delphi10 ED

	if	m_pSyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    	SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

// Delphi10 ST
//    	SPMsHistParent.Prepare();				// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
    	SPMsHistParent.ExecProc();				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare();				// ﾘｿｰｽを解放する
// Delphi10 ED
	end;
end;

end.
