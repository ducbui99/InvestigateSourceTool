//******************************************************************************
//	System		:	Ｇａｌｉｌｅｏｐｔ
//	Program		:	補助登録(諸口ダイアログ)
//	ProgramID	:	JNTCRP016002
//	Name		:   茂木勇次
//	Create		:	2005.02.28
//	Comment		:
//******************************************************************************
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   茂木 勇次   2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <002>   茂木 勇次   2007.03.12(MON) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <003>   茂木 勇次   2007.06.06(WED) 諸口の場合のSecHojyoDispInfoのﾒﾝﾃを行う。
//	<004>	関(PRIME)	2008/02/08(FRI)	ﾏｽﾀ更新履歴対応
//  <DKAI>  難波(LAB)   2008.08.27(WED) 名称に改行が入らないようにする
//
//******************************************************************************
unit JNTCRP016002u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.StdCtrls, VCL.ExtCtrls, FireDAC.Comp.Client,

  MJSBitBtn,  MJSEdits,  MJSPanel, MJSQuery,
  MJSCommonu, MJSMsgStdu, MJSDBModuleu, MJSDispCtrl, MetaSpt, JNTMasComu, JNTCommonU,
  MJSLabel, Db, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, MJSStrctrl;

type
{$include JNTCRPSyncMasterH.inc}    // <002>

  TJNTCRP016002f = class(TForm)
    DialogEditExCodeNumeric: TMNumEdit;
    DialogEditAssociation: TMTxtEdit;
    DialogEditName: TMTxtEdit;
    DialogEditNameSimple: TMTxtEdit;
    DialogButtonRegistration: TMBitBtn;
    BCancel: TMBitBtn;
    DialogEditExCodeFree: TMTxtEdit;
    DialogPanelErrorMessage: TMPanel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

    procedure   fnJNTCRP016002fOnCreate             (Sender: TObject);
    procedure   fnJNTCRP016002fOnCloseQuery         (Sender: TObject; var CanClose: Boolean);
	procedure   fnDialogCommonFunctionOnKeyDown01   (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure   fnDialogCommonFunctionOnKeyDown02   (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   fnDialogButtonRegistrationOnClick   (Sender: TObject);
    procedure   DialogEditNameSimpleEnter           (Sender: TObject);
    procedure   DialogEditNameSimpleExit            (Sender: TObject);

  private
    { Private 宣言 }
	m_pRec				    :   ^TMjsAppRecord;
	m_cDataModule		    :   TMDataModulef;
	m_cCDBSelect		    :   TFDConnection;      // 子会社DB
	m_nMasterDivision	    :   Integer;
	m_nCodeDigit		    :   Integer;
	m_nCodeAttribute	    :   Integer;
	m_strValidCharacters    :   String;
    sCompName               :   String;         // 実行ｺﾝﾋﾟｭｰﾀ名
    m_TantoNCode            :   Currency;       // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
    m_cJNTArea              :   TJNTCommon;
    m_pSystemArea	        :	^rcSYSTEMAREA;
    AOwner                  :   TComponent;     // <001>
    m_WorkNCode             :   Extended;       // <002>
    m_pSyncMaster           :   ^TSyncMaster;   // <002>

	procedure	SessionPractice(iSyori: Integer);					// <004> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
    function    fnDelCRLF(sData: String): String;					// <DKAI> 改行削除

  public
    { Public 宣言 }
	constructor	fnCreateDialog	(pRec: Pointer; Owner: TComponent; cCDBSelect: TFDConnection;
                                 nMasterDivision: Integer; nCodeDigit: Integer;
                                 nCodeAttribute: Integer; strValidCharacters: String;
                                 pSyncMaster: Pointer); // <002>

	function	fnCheckExCodeValue				    (strExCode: String): Integer;
	function	fnCheckMasterDataRecordValid	    (strExCode: String): Integer;
	function	fnGetMasterTreeEntryNo			    (): Integer;
	function	fnRegistrationGeneralRecord		    (strExCode: String): Boolean;
	function	fnRegistrationGeneralRecord_Tree    (strExCode: String): Boolean;   // <002>
    function    fnRegistrationSecHojyoDispInfo      (MstKbn: Integer; ExNCode: Extended): Boolean;  // <003>
	function	fnCheckValidExCodeCharacter		    (strExCode: String): Boolean;
	procedure	fnSetErrorMessage				    (iErrCode: Integer);
  end;

var
  JNTCRP016002f: TJNTCRP016002f;

implementation

const
	// -----<004> Add-St-----
	GRP_SYNC_CHILD			= 1;						// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	C_ST_PROCESS			= 0;						// 設定
	C_ED_PROCESS			= 1;						// 開放
	// -----<004> Add-Ed-----

{$R *.DFM}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTCRPSyncMasterB.inc}    // <002>

//-----------------------------------------------------------------------------
//  fnCreateDialog
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor	TJNTCRP016002f.fnCreateDialog (pRec: Pointer; Owner: TComponent; cCDBSelect: TFDConnection;
                                           nMasterDivision: Integer; nCodeDigit: Integer;
										   nCodeAttribute: Integer; strValidCharacters: String; pSyncMaster: Pointer); // <002>
begin

	m_pRec					:= pRec;
	m_cDataModule			:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cCDBSelect		  	:= cCDBSelect;
	m_nMasterDivision		:= nMasterDivision;
	m_nCodeDigit			:= nCodeDigit;
	m_nCodeAttribute		:= nCodeAttribute;
	m_strValidCharacters	:= strValidCharacters;
    m_TantoNCode            := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    m_pSystemArea           := m_pRec^.m_pSystemArea;
    AOwner                  := Owner;                   // <001>
    m_pSyncMaster           := pSyncMaster;             // <002>

	inherited	Create (Owner);

end;
//-----------------------------------------------------------------------------
// fnJNTCRP016002fOnCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016002f.fnJNTCRP016002fOnCreate (Sender: TObject);
var
	strFormat   :   String;
    ComputerName:   String;
begin
	// -----<004> Add-St-----
	SPMsHist.Connection	:= m_cCDBSelect;
	//SPMsHist.SessionName	:= m_cCDBSelect.SessionName;

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_pSyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_pSyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_pSyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<004> Add-Ed-----

    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(m_pRec);

	MJSColorChange (TJNTCRP016002f (Self),
                    m_pSystemArea.SysColorB,
					m_pSystemArea.SysColorD,
					m_pSystemArea.SysBaseColorB,
					m_pSystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

    // ｺｰﾄﾞ属性: 数字
	if	( m_nCodeAttribute <= 1 ) then
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
	sCompName   :=  ComputerName;

	Caption								:= '諸口登録';
	DialogEditName         .Text		:= '諸口';
	DialogEditNameSimple   .Text		:= '諸口';
	DialogPanelErrorMessage.Caption		:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';

end;
//-----------------------------------------------------------------------------
// fnJNTCRP016002fOnCloseQuery()
//	< ﾌｫｰﾑ修了前処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose  :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016002f.fnJNTCRP016002fOnCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

    //  共通ｼｽﾃﾑ開放
    m_cJNTArea.Free();

end;
//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown01()
//	< ｷｰ制御 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key   : Word
//                Shift : TShiftState
//      RETURN  :
//      MEMO    : ｺｰﾄﾞ時のｷｰ制御
//-----------------------------------------------------------------------------
procedure	TJNTCRP016002f.fnDialogCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if  ( Key = VK_RETURN ) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	(( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;

end;
//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown02()
//	< ｷｰ制御 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key   : Word
//                Shift : TShiftState
//      RETURN  :
//      MEMO    : ｺｰﾄﾞ時以外のｷｰ制御
//-----------------------------------------------------------------------------
procedure	TJNTCRP016002f.fnDialogCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	( Key = VK_RETURN ) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( (TMTxtEdit (Sender).Name = DialogEditName.Name ) and
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
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end
	else if	( Key = VK_F8 ) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( (TMTxtEdit (Sender).Name = DialogEditNameSimple.Name ) and
                ( DialogEditName.Text <> '' )) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;
	end;

end;
//-----------------------------------------------------------------------------
// fnDialogButtonRegistrationOnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ ﾎﾞﾀﾝ[登録] OnClick ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016002f.fnDialogButtonRegistrationOnClick (Sender: TObject);
var
	strExCode   :   String;
	fReturn	    :   Boolean;
    iErrCode    :   Integer;
begin

	if ( m_nCodeAttribute <= 1 ) then                                           // ｺｰﾄﾞ属性: 数字
		strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else                                                                        // ｺｰﾄﾞ属性: ﾌﾘｰ
		strExCode	:= DialogEditExCodeFree.Text;

    // 外部ｺｰﾄﾞ入力ﾁｪｯｸ
    iErrCode := fnCheckExCodeValue( strExCode );

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

    // 正常な場合は諸口ﾚｺｰﾄﾞを作成する <002>
    if ( iErrCode = 0 ) then
    begin
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );

		// -----<004> Add-St-----
		SessionPractice(C_ST_PROCESS);

		try
		// -----<004> Add-Ed-----

        // 子会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran ( m_cCDBSelect );

        // HojyoMAへ登録
        fReturn	:= fnRegistrationGeneralRecord (strExCode);

        if ( not fReturn ) then // ｴﾗｰ
        begin
            if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
            // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_cCDBSelect );
            exit;
        end;

        // HojyoTREEへの登録
        fReturn	:= fnRegistrationGeneralRecord_Tree ( strExCode );

        if ( not fReturn ) then // ｴﾗｰ
        begin
            if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
            // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_cCDBSelect );
            exit;
        end;

        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
        begin
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_HojyoMA) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;

            // <003> ST SecHojyoDispInfoのﾒﾝﾃを行う
            fReturn	:= fnRegistrationSecHojyoDispInfo (m_nMasterDivision, m_WorkNCode);

            if ( not fReturn ) then // ｴﾗｰ
            begin
                // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            // <003> ED
        end;

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのｺﾐｯﾄを実行する
            m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_cCDBSelect );

		// -----<004> Add-St-----
		finally
			SessionPractice(C_ED_PROCESS);
		end;
		// -----<004> Add-Ed-----
    end;
    // ↑↑↑<002>

	ModalResult :=  mrOK;

end;
//-----------------------------------------------------------------------------
// fnRegistrationGeneralRecord()
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE(正常) FALSE(異常)
//      MEMO    : 補助ﾏｽﾀの登録
//-----------------------------------------------------------------------------
function	TJNTCRP016002f.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
	dqMasterData : TMQuery;
begin

	dqMasterData := TMQuery.Create ( Self );

    // DBとMQueryの接続<002>
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
			ParamByName('strAssociation' ).AsString	  := fnDelCRLF(DialogEditAssociation.Text);	//<DKAI>
			ParamByName('strName'        ).AsString	  := fnDelCRLF(DialogEditName.Text);		//<DKAI>
			ParamByName('strNameSimple'  ).AsString	  := fnDelCRLF(DialogEditNameSimple.Text);	//<DKAI>
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
// fnRegistrationGeneralRecord_Tree()   <002>
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE(正常) FALSE(異常)
//      MEMO    : 補助体系の登録
//-----------------------------------------------------------------------------
function TJNTCRP016002f.fnRegistrationGeneralRecord_Tree(strExCode: String): Boolean;
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
//      PARAM   :
//      VAR     :
//      RETURN  : Integer   :   最終登録№
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ 補助加算体系ﾏｽﾀ 登録№取得
//-----------------------------------------------------------------------------
function	TJNTCRP016002f.fnGetMasterTreeEntryNo (): Integer;
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
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : 0:正常終了, -1:子に存在, -2:親に存在(同期)
//                -97:ｺｰﾄﾞに不正な文字あり
//                -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//      MEMO    :
//-----------------------------------------------------------------------------
function    TJNTCRP016002f.fnCheckExCodeValue (strExCode: String): Integer;
begin

    Result := 0;

    // ｺｰﾄﾞﾁｪｯｸ
	if ( not fnCheckValidExCodeCharacter (strExCode) ) then
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
// fnCheckMasterDataRecordValid()
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Integer       0:正常終了, -1:子に存在, -2:親に存在(同期)
//                              -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//      MEMO    : 諸口存在ﾁｪｯｸ
//                (親子同時入力対応)
//-----------------------------------------------------------------------------
function    TJNTCRP016002f.fnCheckMasterDataRecordValid (strExCode: String): Integer;
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
//      dqMasterData.SQL.Add(' and  GCode       = :pGCode   ');
        dqMasterData.ParamByName('pMstKbn').Asinteger := m_nMasterDivision;
//      dqMasterData.ParamByName('pGCode') .AsString  := strExCode;

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
                            Result := -99;
                            Exit;
                        end;

                        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                        if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_HojyoMA) = false ) then
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_cCDBSelect );
                            Result := -99;
                            Exit;
                        end;

                        // <003> ST SecHojyoDispInfoのﾒﾝﾃを行う
                        bRet := fnRegistrationSecHojyoDispInfo (iMastKbn, nPNCode);

                        if ( not bRet ) then // ｴﾗｰ
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback ( m_cCDBSelect );
                            Abort;
                        end;
                        // <003> ED
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
// fnRegistrationSecHojyoDispInfo() <003>
//  < 補SecHojyoDispInfoのメンテを行う >
//-----------------------------------------------------------------------------
function TJNTCRP016002f.fnRegistrationSecHojyoDispInfo(MstKbn: Integer; ExNCode: Extended): Boolean;
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
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   True:ﾁｪｯｸOK, False:ﾁｪｯｸNG
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ 有効文字ｺｰﾄﾞ入力ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP016002f.fnCheckValidExCodeCharacter (strExCode: String): Boolean;
var
	cErrorMsgRec    :   TMJSMsgRec;
begin

	if	( Trim (strExCode) = '' ) then
	begin
		Beep();
		Result	:= FALSE;
		Exit;
	end;

    // ｺｰﾄﾞ属性: 数字
	if	( m_nCodeAttribute <= 1 ) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	( not JNTMASERRORCODECHECK (strExCode, m_strValidCharacters) ) then
	begin
		Beep();
		TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (cErrorMsgRec, 30, 21);
		MJSMessageBoxEx (AOwner,    // <001>
                         cErrorMsgRec.sMsg,
                         m_pRec^.m_ProgramName,
                         cErrorMsgRec.icontype,
                         cErrorMsgRec.btntype,
                         cErrorMsgRec.btndef,
                         cErrorMsgRec.LogType);
		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;

end;

//-----------------------------------------------------------------------------
// fnSetErrorMessage()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ ｴﾗｰﾒｯｾｰｼﾞ ｾｯﾄ処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016002f.fnSetErrorMessage (iErrCode: Integer);
begin

	Beep();
    case iErrCode of
        - 1: DialogPanelErrorMessage.Caption := ' コードを正しく入力してください。';
        -99: DialogPanelErrorMessage.Caption := ' 登録が異常終了しました。';
    end;

    // ｺｰﾄﾞ属性: 数字
	if	( m_nCodeAttribute <= 1 ) then
		DialogEditExCodeNumeric.SetFocus ()
    // ｺｰﾄﾞ属性: ﾌﾘｰ
	else
		DialogEditExCodeFree   .SetFocus ();

end;
//-----------------------------------------------------------------------------
// DialogEditNameSimpleEnter()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 簡略名称ﾌｫｰｶｽ取得時処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016002f.DialogEditNameSimpleEnter(Sender: TObject);
begin

    // 簡略名未登録の時、正式名称よりﾃﾞﾌｫﾙﾄ登録
	if ( DialogEditNameSimple.Text = '' ) then
        DialogEditNameSimple.Text := MJSKabuCut (DialogEditName.Text, 14);

    DialogPanelErrorMessage.Caption := 'F8 正式名称コピー';
    
end;
//-----------------------------------------------------------------------------
// DialogEditNameSimpleExit()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 簡略名称ﾌｫｰｶｽ消失時処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016002f.DialogEditNameSimpleExit(Sender: TObject);
begin

    DialogPanelErrorMessage.Caption := '';
	DialogPanelErrorMessage.Caption	:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<004>
//	Name		:	T.Seki
//	Date		:	2008/02/08
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP016002f.SessionPractice(iSyori: Integer);
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
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_pSyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
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

//		SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
		SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
// Delphi10 ED
	end;
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
function TJNTCRP016002f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.


