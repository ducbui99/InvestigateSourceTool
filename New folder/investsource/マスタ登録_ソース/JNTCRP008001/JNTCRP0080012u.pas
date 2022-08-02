//************************************************************************
//*
//*		Systeme			:	新会計システム
//*		Program			:	諸口登録DLG
//*		ProgramID		:	JNTCRP0080012
//*		Name			:	S.Suzuki（AP開発）
//*		Create			:	2000/11/XX
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	00/12/25    HIS0001 H.Endo(企業ｼｽﾃﾑ企画設計)
//*						取引先の諸口登録時に得意先区分・仕入先区分に１(採用あり)を
//*						ﾃﾞﾌｫﾙﾄする
//*	01/2/5	    HIS0002 H.Endo(企業ｼｽﾃﾑ企画設計)
//*						HojyoMAに内部ｺｰﾄﾞ2がのﾌｨｰﾙﾄﾞが追加されたのでその対応
//* 04/01/20..  HIS0003 Y.Ichihashi
//*                     排他制御
//* 06/09/19    HIS0004 K.Takahashi(LEAD)
//*                     HojyoTreeのEntNo取得SQLの修正
//* 07/03/22    HIS0005 Y.Mogi(LEAD)
//*                     ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//* 07/06/06    HIS0006 Y.Mogi(LEAD)
//*                     諸口の場合のSecHojyoDispInfoのﾒﾝﾃを行う。
//* 07/12/11    HIS0007 ﾏｽﾀ更新履歴対応
//*						S.Suzuki(PRIME)
//* 08/01/08    HIS0008 HojyoTreeの履歴対応
//*						S.Suzuki(PRIME)
//* 08/08/27    DKAI    名称に改行が入らないようにする
//*						E.Nanba(LAB)
//************************************************************************
unit JNTCRP0080012u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, VCL.ExtCtrls, Buttons, Db, FireDAC.Comp.Client,

  MJSQuery, MJSEdits, MJSPanel, MJSBitBtn, MJSLabel,
  MJSCommonu, MJSDBModuleu, MJSMsgStdu, MJSDispCtrl, MetaSpt, JNTMasComu, JNTCommonU,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, MjsStrCtrl;

type
{$include JNTMASExceptIFI.inc}      // HIS0003
{$include JNTMASExceptIFH.inc}      // HIS0003
{$include JNTCRPSyncMasterH.inc}    // HIS0005

  TJNTCRP0080012f = class(TForm)
    DialogEditExCodeNumeric: TMNumEdit;
    DialogEditAssociation: TMTxtEdit;
    DialogEditName: TMTxtEdit;
    DialogEditNameSimple: TMTxtEdit;
    DialogEditExCodeFree: TMTxtEdit;
    BtnOK: TMBitBtn;
    BtnCancel: TMBitBtn;
    DialogPanelErrorMessage: TMPanel;
    MLabel2: TMLabel;
    MLabel1: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    SpMSHist: TFDStoredProc;

    procedure   fnOnCreate                          (Sender: TObject);
    procedure   fnOnCloseQuery                      (Sender: TObject; var CanClose: Boolean);
	procedure   fnDialogCommonFunctionOnKeyDown01   (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure   fnDialogCommonFunctionOnKeyDown02   (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   BtnOKClick                          (Sender: TObject);
  private
    { Private 宣言 }
	m_pRec				    : ^TMjsAppRecord;			// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule		    : TMDataModulef;            //
	m_cCDBSelect			: TFDConnection;                //
	m_nMasterDivision	    : Integer;                  // ﾏｽﾀ区分
	m_nCodeDigit		    : Integer;                  // ｺｰﾄﾞ桁数
	m_nCodeAttribute	    : Integer;                  // ｺｰﾄﾞ属性
	m_strValidCharacters    : String;
    sCompName               : String;                   // 実行ｺﾝﾋﾟｭｰﾀ名
    m_TantoNCode            : Currency;                 // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
    m_cJNTArea              : TJNTCommon;
    m_pSystemArea	        : ^rcSYSTEMAREA;
    AOwner                  : TComponent;
    m_WorkNCode             : Extended;                 // HIS0005 内部ｺｰﾄﾞ保管
    m_pSyncMaster           : ^TSyncMaster;             // HIS0005 同期ｸﾗｽ

    procedure   SessionPractice(iSyori : Integer); 		// HIS0007 ADD ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
    function    fnDelCRLF(sData: String): String;		// <DKAI> 改行削除

  public
    { Public 宣言 }
	constructor fnCreateDialog(pRec: Pointer; Owner: TComponent; cDBSelect: TFDConnection;
                               nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer;
                               strValidCharacters: String;
                               pSyncMaster: Pointer); // HIS0005
	function	fnCheckExCodeValue				    (strExCode: String): Integer;
	function	fnCheckMasterDataRecordValid	    (strExCode: String): Integer;


	function	fnRegistrationGeneralRecord		    (strExCode: String): Boolean;
    function	fnRegistrationGeneralRecord_Tree    (strExCode: String): Boolean;                   // HIS0005
	function	fnGetMasterTreeEntryNo			    (): Integer;
    function    fnRegistrationSecHojyoDispInfo      (MstKbn: Integer; ExNCode: Extended): Boolean;  // HIS0006
// HIS0004 function	fnGetMasterTreeEntryNo			(strExCode: String): Integer;    

	function	fnCheckValidExCodeCharacter		    (strExCode: String): Boolean;
	procedure	fnSetErrorMessage				    (iErrCode: Integer);
  end;

var
  JNTCRP0080012f: TJNTCRP0080012f;

implementation
{$R *.DFM}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTMASExceptIFB.inc}      // HIS0003
{$include JNTCRPSyncMasterB.inc}    // HIS0005

const
    JNT_HOJYO_BASE = 500;

// HIS0007 ADD start
	C_ST_PROCESS			= 0; 	// 設定
    C_ED_PROCESS            = 1;    // 開放
// HIS0007 ADD end    

//-----------------------------------------------------------------------------
//  fnCreateDialog
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor	TJNTCRP0080012f.fnCreateDialog(pRec: Pointer; Owner: TComponent; cDBSelect: TFDConnection;
										   nMasterDivision: Integer; nCodeDigit: Integer;
										   nCodeAttribute: Integer; strValidCharacters: String;
                                           pSyncMaster: Pointer);   // HIS0005
begin

	m_pRec					:= pRec;
	m_cDataModule			:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cCDBSelect			:= cDBSelect;
	m_nMasterDivision		:= nMasterDivision;
	m_nCodeDigit			:= nCodeDigit;
	m_nCodeAttribute		:= nCodeAttribute;
	m_strValidCharacters	:= strValidCharacters;
    m_TantoNCode            := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    m_pSystemArea           := m_pRec^.m_pSystemArea;
    AOwner                  := Owner;
    m_pSyncMaster           := pSyncMaster;             // HIS0005

	inherited	Create (Owner);

end;
//-----------------------------------------------------------------------------
// fnOnCreate()
//	< ﾌｫｰﾑ作成 >
//-----------------------------------------------------------------------------
procedure	TJNTCRP0080012f.fnOnCreate(Sender: TObject);
var
	strFormat   : String;
    ComputerName: String;
begin

    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init ( m_pRec );

	MJSColorChange( TJNTCRP0080012f(Self),
                    m_pSystemArea.SysColorB,
					m_pSystemArea.SysColorD,
					m_pSystemArea.SysBaseColorB,
					m_pSystemArea.SysBaseColorD,
                    rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor);

// <HIS0007> ADD start
	SpMSHist.Connection := m_cCDBSelect;
    //SpMSHist.SessionName  := m_cCDBSelect.SessionName;
// <HIS0007> ADD end

    // ｺｰﾄﾞ属性: 数字
	if ( m_nCodeAttribute <= 1 ) then
	begin
		DialogEditExCodeFree   .Visible	:= FALSE;
		DialogEditExCodeNumeric.Visible	:= TRUE;

		if	( m_nCodeAttribute = 1 ) then
    			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else    strFormat	:= '';

		DialogEditExCodeNumeric.FormatStr	:= strFormat;
		DialogEditExCodeNumeric.Value		:= 0;
		DialogEditExCodeNumeric.Digits		:= m_nCodeDigit;
		DialogEditExCodeNumeric.MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCodeDigit));
	end
    // ｺｰﾄﾞ属性: ﾌﾘｰ
	else
	begin
		DialogEditExCodeNumeric.Visible		:= FALSE;
		DialogEditExCodeFree   .Visible		:= TRUE;
		DialogEditExCodeFree   .Text		:= '';
		DialogEditExCodeFree   .MaxLength	:= m_nCodeDigit
	end;

    GetClientName(ComputerName);
	sCompName := ComputerName;

	Caption								:= '諸口登録';
	DialogEditName         .Text		:= '諸口';
	DialogEditNameSimple   .Text		:= '諸口';
	DialogPanelErrorMessage.Caption		:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';

end;
//-----------------------------------------------------------------------------
// fnOnCloseQuery()
//	< ﾌｫｰﾑ修了前処理 >  :
//-----------------------------------------------------------------------------
procedure TJNTCRP0080012f.fnOnCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

    //  共通ｼｽﾃﾑ開放
    m_cJNTArea.Free();

end;
//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown01()
//	< ｺｰﾄﾞ入力処理 >
//-----------------------------------------------------------------------------
procedure TJNTCRP0080012f.fnDialogCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if ( Key = VK_RETURN ) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	(( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if ( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if ( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;
//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown02()
//	< ｺｰﾄﾞ以外入力処理 >
//-----------------------------------------------------------------------------
procedure TJNTCRP0080012f.fnDialogCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if ( Key = VK_RETURN ) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if (( TMTxtEdit (Sender).Name = DialogEditName.Name ) and
                ( DialogEditNameSimple.Text = '' )) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;

		MjsDispCtrl.MjsNextCtrl (Self);
	end
	else if	(( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if ( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN) ) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if ( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end
	else if	( Key = VK_F8 ) then
	begin
		if ( Sender is TMTxtEdit ) then
		begin
			if	(( TMTxtEdit (Sender).Name = DialogEditNameSimple.Name ) and
				 ( DialogEditName.Text <> '' )) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;
	end;
end;
//-----------------------------------------------------------------------------
// BtnOKClick()
//  < ﾎﾞﾀﾝ[登録] OnClick ｲﾍﾞﾝﾄ >
//-----------------------------------------------------------------------------
procedure TJNTCRP0080012f.BtnOKClick (Sender: TObject);
var
	strExCode	 : String;
	fReturn		 : Boolean;
    iErrCode     : Integer;
begin

	if ( m_nCodeAttribute <= 1 ) then										    // ｺｰﾄﾞ属性: 数字
		strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																		// ｺｰﾄﾞ属性: ﾌﾘｰ
		strExCode	:= DialogEditExCodeFree.Text;

    // ↓↓↓ HIS0005
    // 外部ｺｰﾄﾞ入力ﾁｪｯｸ
    iErrCode := fnCheckExCodeValue (strExCode);

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
            if ( m_nCodeAttribute <= 1 ) then
                    DialogEditExCodeNumeric.SetFocus()                          // ｺｰﾄﾞ属性: 数字
            else    DialogEditExCodeFree.SetFocus();						    // ｺｰﾄﾞ属性: ﾌﾘｰ
            Exit;
    	end;
    end;
    // ↑↑↑ HIS0005

    // 正常な場合は諸口ﾚｺｰﾄﾞを作成する HIS0005
    if ( iErrCode = 0 ) then
    begin
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran ( m_cCDBSelect );

        SessionPractice(C_ST_PROCESS); 			// HIS0007 ADD

        // HojyoMAへ登録
        fReturn	:= fnRegistrationGeneralRecord (strExCode);

// <HIS0008> DEL start
//        SessionPractice(C_ED_PROCESS);   		// HIS0007 ADD
// <HIS0008> DEL end

        if ( not fReturn ) then // ｴﾗｰ
        begin
            if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
            SessionPractice(C_ED_PROCESS);   	  // HIS0008 ADD
            // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_cCDBSelect );
            exit;
        end;

        // HojyoTREEへの登録
        fReturn	:= fnRegistrationGeneralRecord_Tree ( strExCode );

        SessionPractice(C_ED_PROCESS);   		  // HIS0008 ADD

        if ( not fReturn ) then // ｴﾗｰ
        begin
            if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
            // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_cCDBSelect );
            exit;
        end;

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_HojyoMA) = false ) then
            begin
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;

            // HIS0006 ST SecHojyoDispInfoのﾒﾝﾃを行う
            fReturn	:= fnRegistrationSecHojyoDispInfo (m_nMasterDivision, m_WorkNCode);

            if ( not fReturn ) then // ｴﾗｰ
            begin
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            // HIS0006 ED
        end;

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのｺﾐｯﾄを実行する
            m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_cCDBSelect );
    end;
    // ↑↑↑HIS0005

	ModalResult :=  mrOK;

end;
//-----------------------------------------------------------------------------
// fnRegistrationGeneralRecord()    <HIS0005>
//  < 諸口 補助マスタ登録処理 >  true (正常) false (異常)
//-----------------------------------------------------------------------------
function	TJNTCRP0080012f.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
    dqMasterData : TMQuery;
begin

    dqMasterData := TMQuery.Create ( Self );

    // DBとMQueryの接続
    if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
	    m_cDataModule.SetDBInfoToQuery ( m_pSyncMaster.m_cPDBSelect, dqMasterData )     // 親会社DB
    else
	    m_cDataModule.SetDBInfoToQuery ( m_cCDBSelect, dqMasterData );                  // 子会社DB

    try
    	with ( dqMasterData ) do
    	begin
			Close();
			SQL.Clear();
			SQL.Add('insert into HojyoMA (                          ');
			SQL.Add(' MasterKbn,SumKbn,RDelKbn,GCode,Renso,LongName ');
			SQL.Add(',SimpleName,TStartDate,TEndDate,Syokuchikbn    ');
            SQL.Add(',UpdTantoNCode)                                ');
			SQL.Add('values (:nMasterDivision,0,0,:strExCode        ');
            SQL.Add(',:strAssociation,:strName,:strNameSimple       ');
            SQL.Add(',:TStartDate,:TEndDate,1,:UpdTantoNCode)       ');

			ParamByName('nMasterDivision').AsInteger  := m_nMasterDivision;
			ParamByName('strExCode'      ).AsString	  := strExCode;
			//<DKAI> MOD ↓
//			ParamByName('strAssociation' ).AsString	  := DialogEditAssociation.Text;
//			ParamByName('strName'        ).AsString	  := DialogEditName.Text;
//			ParamByName('strNameSimple'  ).AsString	  := DialogEditNameSimple.Text;
			ParamByName('strAssociation' ).AsString	  := fnDelCRLF(DialogEditAssociation.Text);
			ParamByName('strName'        ).AsString	  := fnDelCRLF(DialogEditName.Text);
			ParamByName('strNameSimple'  ).AsString	  := fnDelCRLF(DialogEditNameSimple.Text);
			//<DKAI> MOD ↑
            ParamByName('TStartDate'     ).AsDateTime := m_cJNTArea.GetDEFDATE(1);
			ParamByName('TEndDate'       ).AsDateTime := m_cJNTArea.GetDEFDATE(2);
            ParamByName('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;
			ExecSQL();

            // ｴﾗｰ
			if ( Status <> 0 ) then
			begin
				Result := false;
				Exit;
			end;

            // 内部ｺｰﾄﾞを取得
            m_WorkNCode := 0;
            Close();
            SQL.Clear();
            SQL.Add('select @@identity NCode from HojyoMA');
            Open();

            if ( not EOF ) then
            begin
                m_WorkNCode := FieldByName('NCode').AsFloat;
            end;
    	end;
    finally
        dqMasterData.Close();
        dqMasterData.Free ();
    end;

    // 正常終了
	Result := true;

end;
//-----------------------------------------------------------------------------
// fnRegistrationGeneralRecord_Tree()   <HIS0005>
//  < 承知 補助体系マスタの登録処理 >   true (正常) false (異常)
//-----------------------------------------------------------------------------
function TJNTCRP0080012f.fnRegistrationGeneralRecord_Tree(strExCode: String): Boolean;
var
	dqMasterTree    :   TMQuery;
begin

    dqMasterTree	:= TMQuery.Create ( Self );
    m_cDataModule.SetDBInfoToQuery ( m_cCDBSelect, dqMasterTree );              // 子会社DB

    try
        with ( dqMasterTree ) do
    	begin
    		Close();
    		SQL.Clear();
            SQL.Add('insert into HojyoTree (                                        ');
            SQL.Add(' MasterKbn,PatternNo,SumNCode,EntNo,BasedNCode,UpdTantoNCode)  ');
            SQL.Add('VALUES (:nMasterDivision,0,:strExCodeDst                       ');
            SQL.Add(',:nEntryNo,:strExCodeSrc,:UpdTantoNCode)                       ');

    		ParamByName('nMasterDivision').AsInteger  := m_nMasterDivision;
            ParamByName('strExCodeDst'   ).AsInteger  := 0;
    		ParamByName('nEntryNo'       ).AsInteger  := fnGetMasterTreeEntryNo();
            ParamByName('strExCodeSrc'   ).AsFloat    := m_WorkNCode;
            ParamByName('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;
    		ExecSQL();

            // ｴﾗｰ
    		if ( Status <> 0 ) then
    		begin
    			Result	:= false;
    			Exit;
    		end;
    	end;
    finally
        dqMasterTree.Close();
    	dqMasterTree.Free ();
    end;

    // 正常終了
	Result := true;

end;
//-----------------------------------------------------------------------------
// fnGetMasterTreeEntryNo()
//  < 補助体系マスタ 登録NO.の取得処理 >
//-----------------------------------------------------------------------------
// HIS0004 function	TJNTCRP0080012f.fnGetMasterTreeEntryNo(strExCode: String): Integer;
function TJNTCRP0080012f.fnGetMasterTreeEntryNo(): Integer;
var
    dqMasterTree : TMQuery;
	nWorkEntryNo : Integer;
begin

    dqMasterTree	:= TMQuery.Create ( Self );
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery ( m_cCDBSelect, dqMasterTree );

    try
        with ( dqMasterTree ) do
        begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT EntNo FROM HojyoTree            ');
            SQL.Add('WHERE (MasterKbn = :nMasterDivision)   ');
            SQL.Add('  AND (SumNCode  = :strExCodeDst)      ');
            SQL.Add('ORDER BY EntNo DESC                    ');

            ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
            ParamByName ('strExCodeDst'   ).AsInteger	:= 0;
            Open();

            if	( not EOF ) then
                    nWorkEntryNo	:= dqMasterTree.FieldByName ('EntNo').AsInteger
            else    nWorkEntryNo	:= 0;
        end;

        Result := (nWorkEntryNo + 100) div 100 * 100;

    finally
        dqMasterTree.Close();
        dqMasterTree.Free ();
    end;

end;
//-----------------------------------------------------------------------------
// fnCheckExCodeValue()
//  < 補助コード入力値チェック処理 >
//  0 (正常) -1 (子に存在) -2 (親に存在[同期]) -97 (コードに不正文字有)
//  -98 (親に存在[同期キャンセル]) -99 異常
//-----------------------------------------------------------------------------
function TJNTCRP0080012f.fnCheckExCodeValue (strExCode: String): Integer;
begin

    Result := 0;

    // ｺｰﾄﾞﾁｪｯｸ
	if ( not fnCheckValidExCodeCharacter(strExCode) ) then
	begin
        Result := -97;  // ｺｰﾄﾞ内に不正文字有
		fnSetErrorMessage ( Result );
		Exit;
	end;

    // ﾚｺｰﾄﾞ存在ﾁｪｯｸ
    Result := fnCheckMasterDataRecordValid ( strExCode );
    if ( Result = -99 ) then
    begin
        fnSetErrorMessage ( Result );
    end;

end;
//-----------------------------------------------------------------------------
// fnCheckMasterDataRecordValid()   <HIS0005>
//  < レコード存在チェック及び同期処理 >
//  0 (正常) -1 (子に存在) -2 (親に存在[同期]) -98 (親に存在[同期キャンセル]) -99 (異常)
//-----------------------------------------------------------------------------
function TJNTCRP0080012f.fnCheckMasterDataRecordValid (strExCode: String): Integer;
var
    dqMasterData : TMQuery;
    iMastKbn     : Integer;
    nPNCode      : Extended;
	bRet		 : Boolean;
begin

	Result := 0;

	dqMasterData := TMQuery.Create ( Self );

    try
        //----------------------
        //  子会社の存在ﾁｪｯｸ
        //----------------------

        // 子会社DBとMQueryの接続
	    m_cDataModule.SetDBInfoToQuery( m_cCDBSelect, dqMasterData );

        // 諸口ﾃﾞｰﾀが存在するか否かﾁｪｯｸ
        dqMasterData.Close();
        dqMasterData.SQL.Clear();
        dqMasterData.SQL.Add('select * from HojyoMA         ');
        dqMasterData.SQL.Add('where MasterKbn   = :pMstkbn  ');
        dqMasterData.SQL.Add(' and  Syokuchikbn = 1         ');
        dqMasterData.SQL.Add(' and  RDelKbn     = 0         ');
        dqMasterData.ParamByName('pMstKbn').Asinteger := m_nMasterDivision;

        if ( dqMasterData.Open = False ) then
        begin
			Result := -99;  // SQLｴﾗｰ
            exit;
        end;

        if ( not dqMasterData.Eof ) then
        begin
			Result := -1;   // 存在有
            exit;
        end;

        //----------------------
        //  親会社の存在ﾁｪｯｸ
        //----------------------
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then  // ｸﾞﾙｰﾌﾟ管理有
        begin
            // TMQueryをCloseする
            dqMasterData.Close();
            // 親会社DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery ( m_pSyncMaster.m_cPDBSelect, dqMasterData );

            dqMasterData.Close();
            dqMasterData.SQL.Clear();
            dqMasterData.SQL.Add('select * from HojyoMA        ');
            dqMasterData.SQL.Add('where (MasterKbn = :pMstkbn) ');
            dqMasterData.SQL.Add(' and  (Syokuchikbn = 1)      ');
            dqMasterData.SQL.Add(' and  (RDelKbn     = 0)      ');
            dqMasterData.ParamByName('pMstkbn').Asinteger := m_nMasterDivision;

            if ( dqMasterData.Open = False ) then
            begin
    			Result := -99;  // SQLｴﾗｰ
                exit;
            end;

            // 親に諸口が存在していた場合
            if not dqMasterData.Eof then
            begin
                if ( MjsMessageBoxEx(AOwner, JNTSYNC_MSG_CHK_SYNC,
                                     '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
                begin
                    // HojyoMA_Relｷｰ情報を取得
                    iMastKbn := dqMasterData.FieldByName('MasterKbn').AsInteger;
                    nPNCode  := dqMasterData.FieldByName('NCode')    .AsFloat;

                    // HojyoMA_Relの存在ﾁｪｯｸ
                    dqMasterData.Close();
                    dqMasterData.SQL.Clear();
                    dqMasterData.SQL.Add('select * from HojyoMA_Rel           ');
                    dqMasterData.SQL.Add('where (MasterKbn   = :pMstkbn)      ');
                    dqMasterData.SQL.Add(' and  (NCode       = :pNCode)       ');
                    dqMasterData.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');
                    dqMasterData.ParamByName('pMstkbn'     ).AsInteger := iMastKbn;
                    dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;

                    if ( dqMasterData.Open() = false ) then
                    begin
                        result := -99;  // SQLｴﾗｰ
                        Exit;
                    end;

                    if ( dqMasterData.Eof ) then
                            bRet := True
                    else    bRet := False;

                    // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    m_cDataModule.BeginTran ( m_cCDBSelect );

                    try
                        // 親会社のHojyoMA_Relの更新
                        if ( bRet ) then    // 新規挿入
                        begin
                            dqMasterData.Close();
                            dqMasterData.SQL.Clear();
                            dqMasterData.SQL.Add('insert into HojyoMA_Rel (                   ');
                            dqMasterData.SQL.Add(' MasterKbn ,NCode ,GrpSegNCode,RDelKbn_REL) ');
                            dqMasterData.SQL.Add('values (:pMstkbn,:pNCode,:pGrpSegNCode,0)   ');
                        end
                        else
                        begin
                            dqMasterData.Close();
                            dqMasterData.SQL.Clear();
                            dqMasterData.SQL.Add('update HojyoMA_Rel set               ');
                            dqMasterData.SQL.Add('    RDelKbn_REL = 0                  ');
                            dqMasterData.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                            dqMasterData.SQL.Add('where  (MasterKbn   = :pMstkbn)      ');
                            dqMasterData.SQL.Add('  and  (NCode       = :pNCode)       ');
                            dqMasterData.SQL.Add('  and  (GrpSegNCode = :pGrpSegNCode) ');
                        end;

                        dqMasterData.ParamByName('pMstkbn'     ).AsInteger := iMastKbn;
                        dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                        dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;

                        if ( dqMasterData.ExecSQL = false ) then
                        begin
                            MjsMessageBoxEx (AOwner,
                                             '自社への関連付けに失敗しました。',
                                             'マスタ同期', mjError, mjOk, mjDefOk);
                            Abort;
                        end;

                        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                        if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_HojyoMA) = false ) then
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_cCDBSelect );
                            Abort;
                        end;

                        // HIS0006 ST SecHojyoDispInfoのﾒﾝﾃを行う
                        bRet := fnRegistrationSecHojyoDispInfo (iMastKbn, nPNCode);

                        if ( not bRet ) then // ｴﾗｰ
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_cCDBSelect );
                            Abort;
                        end;
                        // HIS0006 ED
                    except
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;

                    // 親会社DBに対してｺﾐｯﾄを実行する
                    m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
                    // 子会社DBに対してｺﾐｯﾄを実行する
                    m_cDataModule.Commit ( m_cCDBSelect );
                    Result := -2;
                    exit;
                end
                else
                begin
                    Result := -98;
                    exit;
                end;
            end;
        end;
    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnRegistrationSecHojyoDispInfo() HIS0006
//  < 補SecHojyoDispInfoのメンテを行う >
//-----------------------------------------------------------------------------
function TJNTCRP0080012f.fnRegistrationSecHojyoDispInfo(MstKbn: Integer; ExNCode: Extended): Boolean;
var
    Qe : TMQuery;
begin

    Qe := TMQuery.Create ( Self );

    try
        // 親会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery ( m_pSyncMaster.m_cPDBSelect, Qe );

        Qe.Close();
        Qe.SQL.Clear();
        Qe.SQL.Add('select * from SecHojyoDispInfo   ');
        Qe.SQL.Add('where Opekbn          = 2        ');  // 使用区分
        Qe.SQL.Add('  and Masterkbn       = :Mstkbn  ');  // ﾏｽﾀ区分(101～110)
        Qe.SQL.Add('  and PlaceNCode      = :PNCode  ');  // ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
        Qe.SQL.Add('  and NoDispMasterkbn = :NMstKbn ');  // ﾏｽﾀ区分
        Qe.SQL.Add('  and NCode           = :NCode   ');  // 内部ｺｰﾄﾞ

        Qe.ParamByName('Mstkbn' ).AsInteger := m_pSyncMaster.m_SecMasterKbn;
        Qe.ParamByName('PNCode' ).AsFloat   := m_pSyncMaster.m_nSegNCode;
        Qe.ParamByName('NMstKbn').AsInteger := MstKbn;
        Qe.ParamByName('NCode'  ).AsFloat   := ExNCode;

        //  ｴﾗｰの判定
        if	( not Qe.Open() ) then
        begin
            Qe.Close ();
            Qe.Free  ();
            Result := false;
            exit;
        end;

        // 該当ﾚｺｰﾄﾞが存在していない場合は、表示ﾚｺｰﾄを生成する。
        if	( Qe.Eof ) then
        begin
            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('insert into SecHojyoDispInfo  ( ');
            Qe.SQL.Add(' Opekbn,Masterkbn,PlaceNCode,   ');
            Qe.SQL.Add(' NoDispMasterKbn,NCode,DispKbn, ');
            Qe.SQL.Add(' UpdateTime ) values (          ');
            Qe.SQL.Add(' :Opekbn,:Mstkbn,:PNCode,       ');
            Qe.SQL.Add(' :NMstKbn,:NCode,:DispKbn,      ');
            Qe.SQL.Add(' CURRENT_TIMESTAMP )            ');

            Qe.ParamByName('Opekbn' ).AsInteger := 2;
            Qe.ParamByName('Mstkbn' ).AsInteger := m_pSyncMaster.m_SecMasterKbn;
            Qe.ParamByName('PNCode' ).AsFloat   := m_pSyncMaster.m_nSegNCode;
            Qe.ParamByName('NMstKbn').AsInteger := MstKbn;
            Qe.ParamByName('NCode'  ).AsFloat   := ExNCode;
            Qe.ParamByName('DispKbn').AsInteger := 1;

            if	( not Qe.ExecSQL() ) then
            begin
                Result := false;
                exit;
            end;
        end
        else
        begin
            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('update SecHojyoDispInfo set      ');
            Qe.SQL.Add(' DispKbn    = :DispKbn,          ');
            Qe.SQL.Add(' UpdateTime = CURRENT_TIMESTAMP  ');
            Qe.SQL.Add('where Opekbn          = :Opekbn  ');
            Qe.SQL.Add('  and Masterkbn       = :MstKbn  ');
            Qe.SQL.Add('  and PlaceNCode      = :PNCode  ');
            Qe.SQL.Add('  and NoDispMasterKbn = :NMstKbn ');
            Qe.SQL.Add('  and NCode           = :NCode   ');

            Qe.ParamByName('Opekbn' ).AsInteger := 2;
            Qe.ParamByName('MstKbn' ).AsInteger := m_pSyncMaster.m_SecMasterKbn;
            Qe.ParamByName('PNCode' ).AsFloat   := m_pSyncMaster.m_nSegNCode;
            Qe.ParamByName('NMstKbn').AsInteger := MstKbn;
            Qe.ParamByName('NCode'  ).AsFloat   := ExNCode;
            Qe.ParamByName('DispKbn').AsInteger := 1;

            if	( not Qe.ExecSQL() ) then
            begin
                Result := false;
                Exit;
            end;
        end;
    finally
        Qe.Close();
    	Qe.Free ();
    end;

    // 正常終了
	Result := true;

end;

//-----------------------------------------------------------------------------
// fnCheckValidExCodeCharacter()
//  < 補助コードの有効文字コードチェック >
//-----------------------------------------------------------------------------
function TJNTCRP0080012f.fnCheckValidExCodeCharacter (strExCode: String): Boolean;
var
	cErrorMsgRec : TMJSMsgRec;
begin

	if ( Trim ( strExCode ) = '' ) then
	begin
		Beep ();
		Result := FALSE;
		Exit;
	end;

    // ｺｰﾄﾞ属性: 数字
	if ( m_nCodeAttribute <= 1 ) then
	begin
		Result := TRUE;
		Exit;
	end;

	if ( not JNTMASERRORCODECHECK (strExCode, m_strValidCharacters) ) then
	begin
		Beep ();
		TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (cErrorMsgRec, 30, 21);
		MJSMessageBoxEx(AOwner,
                        cErrorMsgRec.sMsg,
                        m_pRec^.m_ProgramName,
                        cErrorMsgRec.icontype,
						cErrorMsgRec.btntype,
                        cErrorMsgRec.btndef,
                        cErrorMsgRec.LogType);

		Result := FALSE;
		Exit;
	end;

	Result := TRUE;

end;

//-----------------------------------------------------------------------------
// fnSetErrorMessage()
//  < エラーメッセージセット処理 >
//-----------------------------------------------------------------------------
procedure TJNTCRP0080012f.fnSetErrorMessage (iErrCode: Integer);
begin

	Beep ();
    case iErrCode of
        - 1: DialogPanelErrorMessage.Caption := ' コードを正しく入力してください。';
        -99: DialogPanelErrorMessage.Caption := ' 登録が異常終了しました。';
    end;

    // ｺｰﾄﾞ属性: 数字
	if ( m_nCodeAttribute <= 1 ) then
        DialogEditExCodeNumeric.SetFocus ()
    // ｺｰﾄﾞ属性: ﾌﾘｰ
	else
		DialogEditExCodeFree   .SetFocus ();
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行<HIS0007>
//	Name		:	S.Suzuki
//	Date		:	2007/12/11
//	Parameter	:   iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP0080012f.SessionPractice(iSyori : Integer);
begin
												// 処理区分
	SpMSHist.ParamByName('@pSyoriKbn').AsInteger := iSyori;
			                   					// 履歴取得区分
	SpMSHist.ParamByName('@pMSHistKbn').AsInteger    := 1;
    											// 担当者内部ｺｰﾄﾞ
    SpMSHist.ParamByName('@pTanNCode').AsCurrency     := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
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

//**************************************************************************
//	Proccess	:	名称から改行コードを削除する  <DKAI>
//	Name		:	E.Nanba
//	Date		:	2008 / 08 / 27
//	Parameter	:	sData
//	Retrun		:	String
//	History		:	2001 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP0080012f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;


end.



