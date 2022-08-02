//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   PRIME加藤   2005/11/29(TUE) @@identityの対象ﾃｰﾌﾞﾙを修正
//  <002>   PRIME加藤   2005/11/29(TUE) 諸口はﾃﾞﾌｫﾙﾄで得意先・仕入先の採用をありとする
//  <003>   LEAD飯塚    2006/01/27(FRI) F8正式名称ｺﾋﾟｰ機能追加
//  <004>   LEAD飯塚    2006/01/27(FRI) 諸口の再利用廃止
//  <005>   LEAD飯塚    2006/01/27(FRI) 更新時にMTOKUI_SEL,MTOKUI_MAS,MTOKUI_PAY,MTOKUI_DEP,MTOKUI_CRDをInsert
//  <006>   茂木 勇次   2006/02/15(WED) 諸口の入力担当者をWriteするように修正。
//	<007>	荒井秀士	2006/07/03(MON) リース取引先区分追加　
//	<008>	新保一馬	2006/09/04(MON) 諸口にテンプレート情報をセットする。
//  <Rel>   新保一馬    2007/03/30(Fri) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <009>   新保一馬    2007/05/16(Wed) 諸口にテンプレート情報をセットする際、単価ランク、単価掛率を設定する。(Gali0698)
//  <010>	新保一馬	2008/08/28(Thu) 名称に改行が入るのを防ぐ対応
//  <   >	高橋功二	2013/04/17(Wed) コードで半角カナ入力を可能にする(dfmのみ修正)
//
//=============================================================================
unit JNTCRP004001SyokuchiDlgu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Buttons, MJSBitBtn, VCL.StdCtrls, MJSEdits, VCL.ExtCtrls, MJSPanel, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  {MasMailEntu,} MjsStrCtrl, MJSMsgStdu, JNTMasComu, MJSCommonu,
  MetaSpt,	//<27>
  JNTCommonU, MJSLabel;

//↓<Rel>
const
	WM_ONPAINT = WM_APP + 1;			// OnPaint時の処理起動ﾒｯｾｰｼﾞ用
//↑<Rel>

type
{$include JNTCRPSyncMasterH.inc}    // <Rel>

  TJNTCRP004001SyokuchiDlgf = class(TForm)
	DialogEditExCodeNumeric: TMNumEdit;
	DialogEditAssociation: TMTxtEdit;
	DialogEditName: TMTxtEdit;
	DialogEditNameSimple: TMTxtEdit;
	DialogButtonRegistration: TMBitBtn;
	MBitBtn2: TMBitBtn;
	DialogEditExCodeFree: TMTxtEdit;
	DialogPanelErrorMessage: TMPanel;
    MLabel2: TMLabel;
    MLabel1: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
	procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT; //<Rel>
	procedure fnJNTCRP004001SyokuchiDlgfOnCreate(Sender: TObject);
	procedure fnDialogCommonFunctionOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnDialogButtonRegistrationOnClick(Sender: TObject);
	procedure DialogEditNameSimpleEnter(Sender: TObject);
	procedure DialogEditNameSimpleExit(Sender: TObject);
	procedure DialogEditExCodeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
	{ Private 宣言 }
	m_pMyAppRecord	 : ^TMjsAppRecord;
	m_cDataModule    : TMDataModulef;
	m_cCDBSelect      : TFDConnection; // <Rel>変数名一括変更。m_cDBSelect→m_cCDBSelect。以降特にマークはしない。
	m_nMasterDivision: Integer;
	m_nCodeDigit     : Integer;
	m_nCodeAttribute : Integer;
	ComArea			 : TJNTMASCom;
	gstErrorStr		 : String;					// フリーコード入力可能文字列
	MjsMsgRec		 : TMJSMsgRec;
    sCompName : String;         //実行ｺﾝﾋﾟｭｰﾀ名         //<25>

    m_cJNTArea      :   TJNTCommon; // <100>
	m_pSystemArea	:	^rcSYSTEMAREA;	// MJSｼｽﾃﾑｴﾘｱ
    uvClose         :   Boolean;    // <100>

    m_TantoNCode    :   Extended;
    m_WorkNCode     :   Extended;       // <Rel>
    m_pSyncMaster   :   ^TSyncMaster;   // <Rel>
    m_IsFirst       :   Boolean;        // <Rel>

	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
	function  fnChkCur(Sender: TObject; iMode: Integer):	Boolean;

  public
	{ Public 宣言 }
	constructor	fnCreateDialog	(AOwner: TComponent; cDataModule: TMDataModulef; cCDBSelect: TFDConnection; Com: TJNTMASCom; //<Rel>引数名一括変更。cDBSelect→cCDBSelect。以降特にマークはしない。
									nMasterDivision: Integer; nCodeDigit: Integer;
									nCodeAttribute: Integer; ErrorCode: String; pRec: Pointer;
									pSyncMaster: Pointer); // <Rel>

	function	fnCheckExCodeValue				(strExCode: String): Integer; //<Rel>戻り値の型をBoolean→Integerに。
	function	fnCheckMasterDataRecordValid	(strExCode: String; iMode:Integer=0): Integer; //<Rel>戻り値の型をBoolean→Integerに。
	function	fnRegistrationGeneralRecord		(strExCode: String): Boolean;
	function	fnRegistrationGeneralRecord_Tree():                  Boolean; //<Rel>
	function	fnCheckValidExCodeCharacter	    (strExCode: String): Boolean; //<Rel>
	procedure	fnSetErrorMessage				(iErrCode: Integer); // <Rel>引数にiErrCode追加。

  end;

const
	// ﾃｰﾌﾞﾙ番号
	TBL_HOJYOMA		= 111;
	TBL_HOJYOTREE	= 199;
	TBL_MASTERINFO	= 10;

var
  JNTCRP004001SyokuchiDlgf: TJNTCRP004001SyokuchiDlgf;

implementation
{$I MASERRORCODECHECK.INC}
{$include JNTCRPSyncMasterB.inc}    // <Rel>
{$include JNTMTOKUI_Sync.INC} // <Rel>

{$R *.DFM}

constructor	TJNTCRP004001SyokuchiDlgf.fnCreateDialog (AOwner: TComponent; cDataModule: TMDataModulef; cCDBSelect: TFDConnection; Com: TJNTMASCom;
													nMasterDivision: Integer; nCodeDigit: Integer;
													nCodeAttribute: Integer; ErrorCode: String; pRec: Pointer;
													pSyncMaster: Pointer); // <Rel>
begin
	m_pMyAppRecord		:= pRec;											// 構造体のSave
	m_cDataModule		:= cDataModule;
	m_cCDBSelect		:= cCDBSelect;
	ComArea				:= Com;
	m_nMasterDivision	:= nMasterDivision;
	m_nCodeDigit		:= nCodeDigit;
	m_nCodeAttribute	:= nCodeAttribute;
	gstErrorStr			:= ErrorCode;

	m_pSystemArea  := m_pMyAppRecord^.m_pSystemArea;	    	// ｼｽﾃﾑﾒﾓﾘ  取得
    m_pSyncMaster       := pSyncMaster;             // <Rel>

	inherited	Create (AOwner);
end;


procedure	TJNTCRP004001SyokuchiDlgf.fnJNTCRP004001SyokuchiDlgfOnCreate (Sender: TObject);
var
	strFormat: String;
	ComputerName: String;	//<27>

begin
    // <100>
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(m_pMyAppRecord);
//	m_cJNTArea.setSelAppRecord;						                    // 販売ポインタ設定
    // <100>

	MJSColorChange (TJNTCRP004001SyokuchiDlgf (Self), ComArea.SystemArea.SysColorB,
                                           ComArea.SystemArea.SysColorD,
									       ComArea.SystemArea.SysBaseColorB,
                                           ComArea.SystemArea.SysBaseColorD,
										  	rcCOMMONAREA (m_pMyAppRecord^.m_pCommonArea^).SysFocusColor);

//↓2005/01/13 T.Shimada
//    MjsFontResize(TJNTCRP004001SyokuchiDlgf(Self), Pointer(m_pMyAppRecord));
//↑
    m_TantoNCode := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
	begin
		DialogEditExCodeFree   .Visible	:= False;
		DialogEditExCodeNumeric.Visible	:= True;

		if	(m_nCodeAttribute = 1) then
			strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else
			strFormat	:= '';

		DialogEditExCodeNumeric.Digits		:= m_nCodeDigit;
		DialogEditExCodeNumeric.FormatStr	:= strFormat;
		DialogEditExCodeNumeric.Value		:= 0;
	end
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DialogEditExCodeNumeric.Visible	:= False;
		DialogEditExCodeFree   .Visible	:= True;

		DialogEditExCodeFree.MaxLength := m_nCodeDigit;
		DialogEditExCodeFree.Text	:= '';
	end;

//	DialogPanelErrorMessage     .Color	:= $000000;
//	DialogPanelErrorMessage.Font.Color	:= $00ffff;

    GetClientName(ComputerName);	//<27>
	sCompName := ComputerName;

	Caption							:= '諸口登録';
	DialogEditName         .Text	:= '諸口';
	DialogEditNameSimple   .Text	:= '諸口';
	DialogPanelErrorMessage.Caption	:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';
    uvClose :=  False; // <100>

    m_IsFirst := True; //<Rel>

end;


procedure	TJNTCRP004001SyokuchiDlgf.fnDialogCommonFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{	if  (Key = VK_Return)   then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
	end;
	if  (Key = VK_END)   then
	begin
		MjsDispCtrl.MjsSetFocus (Self, 'MBitBtn2');
	end;
	if  (Key = VK_ESCAPE)   then
	begin
		ModalResult	:= mrCancel;
	end;

	// 簡略名称
	if Screen.ActiveControl = DialogEditNameSimple then
	begin
		if (Key=VK_F8) then
			DialogEditNameSimple.Text := MjsCopy(DialogEditName.Text, 14);
	end;
    }

	// 簡略名称
	if Screen.ActiveControl = DialogEditNameSimple then
	begin
		if (Key=VK_F8) then
			DialogEditNameSimple.Text := MjsCopy(DialogEditName.Text, 14);
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnDialogButtonRegistrationOnClick (TObject)  						*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ ﾎﾞﾀﾝ[登録] OnClick ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP004001SyokuchiDlgf.fnDialogButtonRegistrationOnClick (Sender: TObject);
var
	strExCode: String;
	fReturn	 : Boolean;
    iErrCode : Integer; //<Rel>
	dq       : TMQuery; //<Rel>
begin
	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
		strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		strExCode	:= DialogEditExCodeFree.Text;
		strExCode := TrimRight(strExCode);
		DialogEditExCodeFree.Text := strExCode;
	end;

{↓<Rel> fnCheckExCodeValue の fnCheckValidExCodeCharacter で行うので、コメント。
	// フリーコードチェック
	if not MASERRORCODECHECK(strExCode,gstErrorStr) then
	begin
		Beep;
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 21);
		MjsMessageBoxEx(Self,MjsMsgRec.sMsg,MjsMsgRec.sTitle,MjsMsgRec.icontype,MjsMsgRec.btntype,MjsMsgRec.btndef,MjsMsgRec.LogType);
		if	(m_nCodeAttribute <= 1) then		 									// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 									// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();
		Exit;
	end;
↑<Rel>}

{↓<Rel> fnCheckExCodeValue の 戻り値の型がIntegerに変わったので論理を組みなおし。
	if	(not fnCheckExCodeValue (strExCode)) then									// 外部ｺｰﾄﾞ入力ﾁｪｯｸ
	begin
		if	(m_nCodeAttribute <= 1) then		 									// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 									// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();

		Exit;
	end;
↑<Rel>}
//↓<Rel>
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
//↑<Rel>
{↓<Rel>
	m_cDataModule.BeginTran (m_cCDBSelect);											// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	fReturn	:= fnRegistrationGeneralRecord (strExCode);

	if	(not fReturn) then															// ｴﾗｰ
	begin
		m_cDataModule.Rollback (m_cCDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
	end;

	m_cDataModule.Commit (m_cCDBSelect);												// ｺﾐｯﾄ(反映)
↑<Rel>}
//↓<Rel>
    // 正常な場合は諸口ﾚｺｰﾄﾞを作成する
    if ( iErrCode = 0 ) then
    begin
        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran ( m_cCDBSelect );

        // MTOKUI,MTOKUI_MAS,MTOKUI_SEL,MTOKUI_CRD,MTOKUI_PAY,MTOKUI_DEPへ登録
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
        fReturn	:= fnRegistrationGeneralRecord_Tree ();

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
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI_MAS) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI_SEL) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI_CRD) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI_PAY) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
            if ( m_pSyncMaster.fnCall_SYNC (JNTSYNC_MTOKUI_DEP) = false ) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;

            // 更新されたときはSecHojyoDispInfoのメンテを行う。
			dq := TMQuery.Create (Self);
			m_cDataModule.SetDBInfoToQuery(m_pSyncMaster.m_cPDBSelect, dq);
            if not fnUpdSecHojyoDispInfo(1,Self,TSyncMaster(m_pSyncMaster^),m_WorkNCode,dq) then
            begin
                if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBのﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBのﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback ( m_cCDBSelect );
                exit;
            end;
			dq.Close;
			dq.Free;
        end;

        if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBのｺﾐｯﾄを実行する
            m_cDataModule.Commit ( m_pSyncMaster.m_cPDBSelect );
        // 子会社DBのｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_cCDBSelect );
    end;
//↑<Rel>

	// メール会計履歴更新
{	MailHisUpdate(m_cCDBSelect, m_cDataModule, TBL_MASTERINFO, 51, 0, 0);		// マスタ基本
	MailHisUpdate(m_cCDBSelect, m_cDataModule, TBL_HOJYOMA, 51, 0, 0);			// 補助基本
	MailHisUpdate(m_cCDBSelect, m_cDataModule, TBL_HOJYOTREE, 51, 0, 0);			// 補助加算体系

}	ModalResult	:= mrOK;
end;

{<004>
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnRegistrationGeneralRecord (strExCode: String)					*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ 諸口ﾚｺｰﾄﾞ登録取得     		                             		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)					                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP004001SyokuchiDlgf.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;
	iEntNo		: Integer;
    lvNCODE     : Extended;
begin
	dqMasterTree	:= TMQuery.Create (Self);
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cCDBSelect, dqMasterTree);						// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cCDBSelect, dqMasterData);						// DBとMQueryの接続


	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT RDelKbn FROM MTOKUI ');
		SQL.Add ('WHERE  Syokuchikbn = 1 and RDelKbn = 1');

		Open ();

		if	(not EOF) then															// 削除ﾚｺｰﾄﾞ再利用
		begin
			Close ();

			SQL.Clear;
			SQL.Add ('UPDATE MTOKUI ');
			SQL.Add ('SET    SumKbn = 0, RDelKbn = 0, GCode = :strExCode, ');
			SQL.Add ('       Renso = :strAssociation, NM = :strName, NMK = :strNameSimple ');
			SQL.Add ('WHERE  Syokuchikbn = 1 and RDelKbn = 1');

			ParamByName ('strExCode'      ).AsString	:= strExCode;
			ParamByName ('strAssociation' ).AsString	:= DialogEditAssociation.Text;
			ParamByName ('strName'        ).AsString	:= DialogEditName.Text;
			ParamByName ('strNameSimple'  ).AsString	:= DialogEditNameSimple.Text;

			ExecSQL;
			if  (Status <> 0) then													// ｴﾗｰ
			begin
				dqMasterData.Free ();
				dqMasterTree.Free ();

				Result	:= FALSE;
				Exit;
			end;
		end
		else
		begin
			Close ();

			SQL.Clear;
			SQL.Add ('INSERT INTO MTOKUI ');
			SQL.Add ('(SumKbn, RDelKbn, GCode,');
			SQL.Add ('Renso, NM, NMK, ');
            SQL.Add ('HojyoKbn1, HojyoKbn2, ');         // <002>追加
			SQL.Add ('Syokuchikbn,TStartDate,TEndDate) ');
			SQL.Add ('VALUES (0, 0, :strExCode, :strAssociation, :strName, :strNameSimple, ');
            SQL.Add ('1, 1, ');                         // <002>追加
			SQL.Add ('1,:TStartDate,:TEndDate)');

			ParamByName ('strExCode'      ).AsString	:= strExCode;
			ParamByName ('strAssociation' ).AsString	:= DialogEditAssociation.Text;
			ParamByName ('strName'        ).AsString	:= DialogEditName.Text;
			ParamByName ('strNameSimple'  ).AsString	:= DialogEditNameSimple.Text;
			ParamByName ('TStartDate').AsDateTime  	    := m_cJNTArea.GetDEFDATE(1);
			ParamByName ('TEndDate').AsDateTime     	:= m_cJNTArea.GetDEFDATE(2);

			ExecSQL;

			if  (Status <> 0) then													// ｴﾗｰ
			begin
				dqMasterData.Free ();
				dqMasterTree.Free ();

				Result	:= FALSE;
				Exit;
			end;
            //内部コードを取得
            lvNCODE := 0;
            Close ();
            SQL.Clear;
// <001>↓
//            Sql.Add(' select @@identity NCODE From HojyoMA');
            Sql.Add(' select @@identity NCODE From MTOKUI');
// <001>↑
            Open ();
            if not Eof then
                lvNCODE := FieldByName('NCODE').asFloat;

		end;
	end;


	with (dqMasterTree) do
	begin
		Close ();
		SQL.Clear;
		SQL.Add ('Select EntNo From HojyoTree Where MasterKbn = :nMasterDivision and PatternNo = 0 and SumNCode =:strSum ');
		SQL.Add ('Order by EntNo DESC');
		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strSum'		  ).AsInteger	:= 0;
		Open;
		if  (Status <> 0) then														// ｴﾗｰ
		begin
			dqMasterData.Free ();
			dqMasterTree.Free ();

			Result	:= FALSE;
			Exit;
		end;

		iEntNo := GetFld('EntNo').AsInteger;

		Close ();
		SQL.Clear;
		SQL.Add ('INSERT INTO HojyoTree (MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode, AddKbn) ');
		SQL.Add ('VALUES (:nMasterDivision, 0, :strSum, :nEntryNo, :strExCodeSrc, 0) ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
		ParamByName ('strSum'		  ).AsInteger	:= 0;
		ParamByName ('nEntryNo'       ).AsInteger	:= iEntNo + 100;
		ParamByName ('strExCodeSrc'   ).AsFloat  	:= lvNCODE;

		ExecSQL;

		if  (Status <> 0) then														// ｴﾗｰ
		begin
			dqMasterData.Free ();
			dqMasterTree.Free ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	dqMasterData.Free ();
	dqMasterTree.Free ();

	Result	:= TRUE;																// 正常終了
end;
}
{↓<Rel>
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnCheckExCodeValue (String)										*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ 工事外部ｺｰﾄﾞ入力ﾁｪｯｸ													*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode																                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP004001SyokuchiDlgf.fnCheckExCodeValue (strExCode: String): Boolean;
var
	fReturn: Boolean;

begin
	fReturn	:= FALSE;

	while (TRUE) do
	begin
		if	(Trim (strExCode) = '') then
			Break;

		if	(not fnCheckMasterDataRecordValid (strExCode)) then
			Break;

		fReturn	:= TRUE;

		Break;
	end;

	if	(not fReturn) then
		fnSetErrorMessage ();

	Result	:= fReturn;
end;
↑<Rel>}
//↓<Rel>
//-----------------------------------------------------------------------------
// fnCheckExCodeValue()
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : 0:正常終了, -1:子に存在, -2:親に存在(同期)
//                -97:ｺｰﾄﾞに不正な文字あり
//                -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//      MEMO    :
//-----------------------------------------------------------------------------
function    TJNTCRP004001SyokuchiDlgf.fnCheckExCodeValue (strExCode: String): Integer;
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
//↑<Rel>
{↓<Rel>
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnCheckMasterDataRecordValid (Integer; String)                    */
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ 補助基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ											*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP004001SyokuchiDlgf.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	fReturn	:= FALSE;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cCDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT * FROM MTOKUI ');
		SQL.Add ('WHERE  RDelKbn = 0 and GCode = :strExCode');

		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(EOF) then
			fReturn	:= True;

		Close ();
	end;

	dqMasterData.Free ();

	Result	:= fReturn;
end;
↑<Rel>}
//↓<Rel>
//-----------------------------------------------------------------------------
// fnCheckMasterDataRecordValid()
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//              : iMode     :   0:通常  1:グループ会計子社の「諸口レコードが親にあるか」の同期用。外部コードは判断に含めないモード。
//      VAR     :
//      RETURN  : Integer       0:正常終了, -1:子に存在, -2:親に存在(同期)
//                              -98:親に存在(同期ｷｬﾝｾﾙ), -99:異常終了
//      MEMO    : 諸口存在ﾁｪｯｸ
//                (親子同時入力対応)
//-----------------------------------------------------------------------------
function    TJNTCRP004001SyokuchiDlgf.fnCheckMasterDataRecordValid (strExCode: String; iMode:Integer): Integer; //<Rel>戻り値の型を変更。Boolean→Integer。引数にiModeを追加。
var
	dqMasterData: TMQuery;
    nPNCode      : Extended;
	fReturn	  : Boolean;



//-----------------------------------------------------------------------------
// lfnUpd_Rel()
//      PARAM   : PDB    : 親会社DB
//                CDB    : 子会社DB
//                dq     : 親会社DBと接続されたクエリ
//                NCode  : _Relを検索する内部コード
//                SyncNo : 「JNTCRPSyncMasterB.inc」に定義されている定数
//                RecKbn : 1:得意先 2:仕入先 (SyncNoが「JNTSYNC_MTOKUI_SEL」のときのみ有効)
//      RETURN  : Boolean True:成功, False:失敗
//      MEMO    : _Relを更新するための関数内の関数。
//-----------------------------------------------------------------------------
function lfnUpd_Rel(PDB:TFDConnection;CDB:TFDConnection;NCode:Extended;dq:TMQuery;SyncNo:Integer;RecKbn:Integer):Boolean;
var
	sTbl      : string; // _Relテーブル名格納用
	sNCodeFld : string; // 内部コードフィールド名格納用。MTOKUI_Rel は NCode。それ以外はBaseNCode。
begin
	Result := True;

	// テーブル名の決定
    case SyncNo of
        JNTSYNC_MTOKUI:     sTbl := 'MTOKUI_Rel';
        JNTSYNC_MTOKUI_MAS: sTbl := 'MTOKUI_MAS_Rel';
        JNTSYNC_MTOKUI_SEL: sTbl := 'MTOKUI_SEL_Rel';
        JNTSYNC_MTOKUI_CRD: sTbl := 'MTOKUI_CRD_Rel';
        JNTSYNC_MTOKUI_PAY: sTbl := 'MTOKUI_PAY_Rel';
        JNTSYNC_MTOKUI_DEP: sTbl := 'MTOKUI_DEP_Rel';
    end;

	// 内部コードフィールド名の決定
	if (SyncNo = JNTSYNC_MTOKUI) then
	begin
		sNCodeFld := 'NCode';
	end
	else
	begin
		sNCodeFld := 'BaseNCode';
	end;

    // _Relの存在ﾁｪｯｸ
    dq.Close();
    dq.SQL.Clear();
    dq.SQL.Add('select * from ' + sTbl);
    dq.SQL.Add(' where (' + sNCodeFld + ' = :pNCode) ');
    dq.SQL.Add('   and (GrpSegNCode = :pGrpSegNCode) ');
    if (SyncNo = JNTSYNC_MTOKUI_SEL) then
    begin
        dq.SQL.Add('   and (RecKbn = :pRecKbn) ');
    end;
    dq.ParamByName('pNCode'      ).AsFloat   := NCode;
    dq.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;
    if (SyncNo = JNTSYNC_MTOKUI_SEL) then
    begin
        dq.ParamByName('pRecKbn').AsInteger  := RecKbn;
    end;

    if ( dq.Open() = false ) then
    begin
        Result := False;  // SQLｴﾗｰ
        Exit;
    end;

    // 親会社の_Relの更新
    if ( dq.Eof ) then    // 新規挿入
    begin
        dq.Close();
        dq.SQL.Clear();
        dq.SQL.Add('insert into ' + sTbl + ' ( ');
        dq.SQL.Add(' ' + sNCodeFld + ' ');
        dq.SQL.Add(',GrpSegNCode ');
        dq.SQL.Add(',RDelKbn_REL ');
        if (SyncNo = JNTSYNC_MTOKUI_SEL) then
        begin
            dq.SQL.Add(',RecKbn ');
        end;
        dq.SQL.Add(' ) values ( ');
        dq.SQL.Add(' :pNCode ');
        dq.SQL.Add(',:pGrpSegNCode ');
        dq.SQL.Add(',0 ');
        if (SyncNo = JNTSYNC_MTOKUI_SEL) then
        begin
            dq.SQL.Add(',:pRecKbn ');
        end;
        dq.SQL.Add(' ) ');
    end
    else
    begin
        dq.Close();
        dq.SQL.Clear();
        dq.SQL.Add('update ' + sTbl + ' set ');
        dq.SQL.Add('    RDelKbn_REL = 0                  ');
        dq.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
        dq.SQL.Add('where  (' + sNCodeFld + ' = :pNCode) ');
        dq.SQL.Add('  and  (GrpSegNCode = :pGrpSegNCode) ');
        if (SyncNo = JNTSYNC_MTOKUI_SEL) then
        begin
            dq.SQL.Add('   and (RecKbn = :pRecKbn) ');
        end;
    end;

    dq.ParamByName('pNCode'      ).AsFloat   := NCode;
    dq.ParamByName('pGrpSegNCode').AsFloat   := m_pSyncMaster.m_nSegNCode;
    if (SyncNo = JNTSYNC_MTOKUI_SEL) then
    begin
        dq.ParamByName('pRecKbn').AsInteger  := RecKbn;
    end;

    if ( dq.ExecSQL = false ) then
    begin
        MjsMessageBoxEx (Self,
                         '自社への関連付けに失敗しました。',
                         'マスタ同期', mjError, mjOk, mjDefOk);
        Result := False;
        Exit;
    end;

    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
    if ( m_pSyncMaster.fnCall_SYNC (SyncNo) = false ) then
    begin
        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
        m_cDataModule.Rollback ( PDB );
        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
        m_cDataModule.Rollback ( CDB );
        Result := False;
        Exit;
    end;

end;




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
        dqMasterData.SQL.Add('SELECT * FROM MTOKUI ');

        if iMode = 0 then
        begin
            // 通常ﾓｰﾄﾞは外部コードを含めて検索
            dqMasterData.SQL.Add('WHERE  RDelKbn = 0 and GCode = :strExCode');
            dqMasterData.ParamByName ('strExCode'      ).AsString	:= strExCode;
        end
        else
        begin
            // 自動配信ﾓｰﾄﾞは外部コードは含めず検索
            dqMasterData.SQL.Add('WHERE  RDelKbn = 0 and SyokuchiKbn = 1');
        end;

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
            dqMasterData.SQL.Add('SELECT * FROM MTOKUI ');
            if iMode = 0 then
            begin
                // 通常ﾓｰﾄﾞは外部コードを含めて検索
                dqMasterData.SQL.Add('WHERE  RDelKbn = 0 and GCode = :strExCode');
                dqMasterData.ParamByName ('strExCode'      ).AsString	:= strExCode;
            end
            else
            begin
                // 自動配信ﾓｰﾄﾞは外部コードは含めず検索
                dqMasterData.SQL.Add('WHERE  RDelKbn = 0 and SyokuchiKbn = 1');
            end;

            if ( dqMasterData.Open = False ) then
            begin
    			Result := -99;  // SQLｴﾗｰ
                exit;
            end;

            // 親に諸口が存在していた場合
            if not dqMasterData.Eof then
            begin
                // 諸口の場合はメッセージ確認はせず、強制的に同期する。

                // MTOKUI_Relｷｰ情報を取得
                nPNCode  := dqMasterData.FieldByName('NCode')    .AsFloat;

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                m_cDataModule.BeginTran ( m_pSyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                m_cDataModule.BeginTran ( m_cCDBSelect );

                try
                    // MTOKUI_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI,0) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_MAS_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_MAS,0) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_SEL_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_SEL,1) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_SEL_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_SEL,2) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_CRD_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_CRD,0) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_PAY_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_PAY,0) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;
                    // MTOKUI_DEP_Rel の更新
                    if not lfnUpd_Rel(m_pSyncMaster.m_cPDBSelect,m_cCDBSelect,nPNCode,dqMasterData,JNTSYNC_MTOKUI_DEP,0) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのメンテを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,TSyncMaster(m_pSyncMaster^),nPNCode,dqMasterData) then
                    begin
	                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
	                    m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;

                    // 配信されたレコードをHojyoTREEへ登録する
                    m_WorkNCode := nPNCode;

                    fReturn	:= fnRegistrationGeneralRecord_Tree ();

                    if ( not fReturn ) then // ｴﾗｰ
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_pSyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_cCDBSelect );
                        Result := -99;
                        Exit;
                    end;

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
            end;
        end;
    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;
    
end;
//↑<Rel>

//↓<Rel>
//-----------------------------------------------------------------------------
// fnCheckValidExCodeCharacter()
//      PARAM   : strExCode :   諸口外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   True:ﾁｪｯｸOK, False:ﾁｪｯｸNG
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ 有効文字ｺｰﾄﾞ入力ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP004001SyokuchiDlgf.fnCheckValidExCodeCharacter (strExCode: String): Boolean;
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

	if not MASERRORCODECHECK(strExCode,gstErrorStr) then
	begin
		Beep;
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 21);
		MjsMessageBoxEx(Self,MjsMsgRec.sMsg,MjsMsgRec.sTitle,MjsMsgRec.icontype,MjsMsgRec.btntype,MjsMsgRec.btndef,MjsMsgRec.LogType);
		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;

end;
//↑<Rel>

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnSetErrorMessage ()												*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ ｴﾗｰﾒｯｾｰｼﾞ ｾｯﾄ処理														*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP004001SyokuchiDlgf.fnSetErrorMessage (iErrCode: Integer); // <Rel>引数にiErrCode追加
begin
	Beep ();

//	DialogPanelErrorMessage     .Color	:= clBtnFace;
//	DialogPanelErrorMessage.Font.Color	:= clWindowText;
//<Rel>	DialogPanelErrorMessage.Caption		:= ' コードを正しく入力してください。';
//↓<Rel>
    case iErrCode of
        - 1: DialogPanelErrorMessage.Caption := ' コードを正しく入力してください。';
        -99: DialogPanelErrorMessage.Caption := ' 登録が異常終了しました。';
    end;
//↑<Rel>

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
		DialogEditExCodeNumeric.SetFocus ()
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
		DialogEditExCodeFree   .SetFocus ();
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.DialogEditNameSimpleEnter ()												*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ 簡略名称ｾｯﾄ処理														*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP004001SyokuchiDlgf.DialogEditNameSimpleEnter(Sender: TObject);
begin
	// 簡略名未登録の時、正式名称よりデフォルト登録
	if DialogEditNameSimple.Text = '' then
		DialogEditNameSimple.Text := MjsCopy(DialogEditName.Text, 14);

	// メッセージ表示
//	ComArea.m_MsgStd.GetMsg( MJSMsgRec, 30, 19);
//	DialogPanelErrorMessage.Caption := MJSMsgRec.sMsg;
//	DialogPanelErrorMessage.Caption := 'F8 正式名称コピー';
	DialogPanelErrorMessage.Caption := 'F8 正式名称コピー';

end;

procedure TJNTCRP004001SyokuchiDlgf.DialogEditNameSimpleExit(Sender: TObject);
begin
	DialogPanelErrorMessage.Caption := '';
	DialogPanelErrorMessage.Caption	:= ' 諸口を登録してください。登録しない場合は"キャンセル"を押してください。';
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.DialogEditExCodeExit ()												*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ コードExit処理														*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP004001SyokuchiDlgf.DialogEditExCodeExit(Sender: TObject);
var
	strExCode: String;
    iErrCode : Integer; //<Rel>
begin
	// 取り消しボタンへの移動は入力チェックしない。
	if Screen.ActiveControl.Name = MBitBtn2.Name then Exit;

	if	(m_nCodeAttribute <= 1) then												// ｺｰﾄﾞ属性: 数字
		strExCode	:= Format ('%.16d', [Trunc (DialogEditExCodeNumeric.Value)])
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		strExCode	:= DialogEditExCodeFree.Text;
		strExCode := TrimRight(strExCode);
		DialogEditExCodeFree.Text := strExCode;
	end;

{↓<Rel> fnCheckExCodeValue の fnCheckValidExCodeCharacter で行うので、コメント。
	// フリーコードチェック
	if not MASERRORCODECHECK(strExCode,gstErrorStr) then
	begin
		Beep;
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 21);
		MjsMessageBoxEx(Self,MjsMsgRec.sMsg,MjsMsgRec.sTitle,MjsMsgRec.icontype,MjsMsgRec.btntype,MjsMsgRec.btndef,MjsMsgRec.LogType);
		if	(m_nCodeAttribute <= 1) then		 									// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 									// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();
		Exit;
	end;
↑<Rel>}

{↓<Rel> fnCheckExCodeValue の 戻り値の型がIntegerに変わったので論理を組みなおし。
	if	(not fnCheckExCodeValue (strExCode)) then									// 外部ｺｰﾄﾞ入力ﾁｪｯｸ
	begin
		if	(m_nCodeAttribute <= 1) then		 									// ｺｰﾄﾞ属性: 数字
			DialogEditExCodeNumeric.SetFocus ()
		else									 									// ｺｰﾄﾞ属性: ﾌﾘｰ
			DialogEditExCodeFree   .SetFocus ();

		Exit;
	end;
↑<Rel>}
//↓<Rel>
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
//↑<Rel>
end;

//**************************************************************************
//  Component : TJNTCRP004001SyokuchiDlgf
//  Event     : CMChildKey
//  Name      : N.Nabe
//**************************************************************************
procedure TJNTCRP004001SyokuchiDlgf.CMChildKey(var Msg: TWMKey);
begin
	if GetKeyState(VK_MENU) < 0 then				// Altｷｰを拾う
		Exit;

	// 外部コード(Shift+Tab)
	if (Screen.ActiveControl = DialogEditExCodeFree) or (Screen.ActiveControl = DialogEditExCodeNumeric) then
	begin
		case Msg.CharCode of
			VK_RETURN, VK_DOWN, VK_RIGHT:
			begin
				if (Screen.ActiveControl = DialogEditExCodeFree) and (Msg.CharCode = VK_RIGHT) then
				begin
					// アイビーム(文字入力カーソル)の位置をチェック
					if fnChkCur(Screen.ActiveControl,1) then MjsDispCtrl.MjsNextCtrl(Self);
				end
				else
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end;
			VK_UP, VK_LEFT:
			begin
				if (Screen.ActiveControl = DialogEditExCodeFree) and (Msg.CharCode = VK_LEFT) then
				begin
					// アイビーム(文字入力カーソル)の位置をチェック
					if fnChkCur(Screen.ActiveControl,0) then
					begin
						Beep;
						Abort;
					end;
				end
				else
				begin
					Beep;
					Abort;
				end;
			end;
			VK_END:
			begin
				MBitBtn2.SetFocus;
			end;
			VK_ESCAPE:
				MBitBtn2.Click;
		end;
		Exit;
	end;

	// 連想シンボル、正式名称、簡略名称
	if (Screen.ActiveControl = DialogEditAssociation) or
		(Screen.ActiveControl = DialogEditName) or
		(Screen.ActiveControl = DialogEditNameSimple) then
	begin
		case Msg.CharCode of
			VK_RETURN, VK_DOWN, VK_RIGHT:
			begin
				if Msg.CharCode = VK_RIGHT then
				begin
					// アイビーム(文字入力カーソル)の位置をチェック
					if fnChkCur(Screen.ActiveControl,1) then MjsDispCtrl.MjsNextCtrl(Self);
				end
				else
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end;
			VK_UP, VK_LEFT:
			begin
				if Msg.CharCode = VK_LEFT then
				begin
					// アイビーム(文字入力カーソル)の位置をチェック
					if fnChkCur(Screen.ActiveControl,0) then MjsDispCtrl.MjsPrevCtrl(Self);
				end
				else
				begin
					MjsDispCtrl.MjsPrevCtrl(Self);
					abort;
				end;
			end;
			VK_END:		DialogButtonRegistration.SetFocus;
			VK_ESCAPE:	MBitBtn2.Click;
		end;

		// 簡略名称
		if Screen.ActiveControl = DialogEditNameSimple then
		begin
			if (Msg.CharCode=VK_F8) then
				DialogEditNameSimple.Text := MjsCopy(DialogEditName.Text, 14);
		end;
		Exit;
	end;

	// 登録ボタン
	if Screen.ActiveControl = DialogButtonRegistration then
	begin
		case Msg.CharCode of
			VK_END:
				MBitBtn2.SetFocus;
			VK_ESCAPE:
				MBitBtn2.Click;
		end;
		Exit;
	end;

	// 取消ボタン
	if Screen.ActiveControl = MBitBtn2 then
	begin
		if (MjsShiftKeyChk = False) and (Msg.CharCode = VK_TAB) then
		begin
			Beep;
			Abort;
		end;

		case Msg.CharCode of
			VK_END:
				MBitBtn2.Click;
			VK_ESCAPE:
				MBitBtn2.Click;
		end;
		Exit;
	end;

end;

//**************************************************************************
//  Proccess  :  アイビーム(文字入力カーソル)の位置をチェック
//  Name      :  N.Nabe
//  Date    　:  2000/12/08
//  Parametar :  Sender
//               imode			:０ Top(先頭)　１ End(最後)
//  Retrun    :  Boolean
//  History 　:  xxxx/xx/xx     名前
//                  履歴内容
//**************************************************************************
function TJNTCRP004001SyokuchiDlgf.fnChkCur(Sender: TObject; iMode: Integer): Boolean;
begin
	Result := True;
	case iMode of
		0: // MjsChkCurTop
		begin
			if      Sender = DialogEditExCodeFree  then Result := MjsChkCurTop(DialogEditExCodeFree)
			else if Sender = DialogEditAssociation    then Result := MjsChkCurTop(DialogEditAssociation)
			else if Sender = DialogEditName   then Result := MjsChkCurTop(DialogEditName)
			else if Sender = DialogEditNameSimple then Result := MjsChkCurTop(DialogEditNameSimple);
		end;
		1: // MjsChkCurEnd
		begin
			if      Sender = DialogEditExCodeFree  then Result := MjsChkCurEnd(DialogEditExCodeFree)
			else if Sender = DialogEditAssociation    then Result := MjsChkCurEnd(DialogEditAssociation)
			else if Sender = DialogEditName   then Result := MjsChkCurEnd(DialogEditName)
			else if Sender = DialogEditNameSimple then Result := MjsChkCurEnd(DialogEditNameSimple);
		end;
	end;
end;

procedure TJNTCRP004001SyokuchiDlgf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    uvClose :=  True; // <100>

end;

procedure TJNTCRP004001SyokuchiDlgf.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

    //  共通システム開放 <100>
    m_cJNTArea.Free;

end;

//↓<Rel>
//-----------------------------------------------------------------------------
// fnRegistrationGeneralRecord_Tree()
//      PARAM   :
//      VAR     :
//      RETURN  : Boolean   :   TRUE(正常) FALSE(異常)
//      MEMO    : 補助体系の登録
//-----------------------------------------------------------------------------
function TJNTCRP004001SyokuchiDlgf.fnRegistrationGeneralRecord_Tree(): Boolean;
var
	dqMasterTree : TMQuery;
    iEntNo		 : Integer;
begin
    dqMasterTree	:= TMQuery.Create ( Self );
    m_cDataModule.SetDBInfoToQuery ( m_cCDBSelect, dqMasterTree );              // 子会社DB

    try
        with ( dqMasterTree ) do
    	begin
			Close ();
			SQL.Clear;
			SQL.Add ('Select EntNo From HojyoTree Where MasterKbn = :nMasterDivision and PatternNo = 0 and SumNCode =:strSum ');
			SQL.Add ('Order by EntNo DESC');
			ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
			ParamByName ('strSum'		  ).AsInteger	:= 0;
			Open;
			if  (Status <> 0) then														// ｴﾗｰ
			begin
				Result	:= FALSE;
				Exit;
			end;
	
			iEntNo := GetFld('EntNo').AsInteger;
			Close ();
			SQL.Clear;
			SQL.Add ('INSERT INTO HojyoTree (MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode, AddKbn, UpdTantoNCode) ');
			SQL.Add ('VALUES (:nMasterDivision, 0, :strSum, :nEntryNo, :strExCodeSrc, 0, :UpdTantoNCode) ');
	
			ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
			ParamByName ('strSum'		  ).AsInteger	:= 0;
			ParamByName ('nEntryNo'       ).AsInteger	:= iEntNo + 100;
			ParamByName ('strExCodeSrc'   ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
            ParamByName('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;
			ExecSQL;
	
			if  (Status <> 0) then														// ｴﾗｰ
			begin
				Result	:= FALSE;
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
//↑<Rel>

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004001SyokuchiDlgf.fnRegistrationGeneralRecord (strExCode: String)					*/
//*																									*/
//*	目的	: 諸口登録ﾀﾞｲｱﾛｸﾞ 諸口ﾚｺｰﾄﾞ登録取得     		                             		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)					                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP004001SyokuchiDlgf.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
// <Rel> 不要
//	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;
//<Rel>	iEntNo		: Integer;
// <Rel>privateに昇格
//    lvNCODE     : Extended;
    i           : Integer;
//↓<008>
	uvTmpURKINHSUKBN    : Integer; // 売上端数区分
	uvTmpGRUZSEIKBN     : Integer; // 現売税請求区分
	uvTmpZSEIKBN        : Integer; // 消費税請求区分
	uvTmpZHSUKBN        : Integer; // 消費税端数単位
	uvTmpZHSUTNIKBN     : Integer; // 消費税端数処理
	uvTmpTRIHIKIKBN     : Integer; // 取引区分
	uvTmpNMKBN          : Integer; // 名称変更区分
	uvTmpSSHCDKBN       : Integer; // 指定商品ｺｰﾄﾞ区分
	uvTmpSSHCDKET       : Integer; // 指定商品ｺｰﾄﾞ桁数
	uvTmpYYKBN          : Integer; // 和暦西暦区分
	uvTmpDAINMKBN       : Integer; // 代表者名の印字
	uvTmpUSDENPFM       : Integer; // 納品書ﾌｫｰﾑ
	uvTmpJHDENPFM       : Integer; // 受注伝票ﾌｫｰﾑ
	uvTmpSNDENPFM       : Integer; // 出荷伝票ﾌｫｰﾑ
	uvTmpUSGKEI         : Integer; // 売上合計欄税印字
	uvTmpSSDENPFM       : Integer; // 請求書ﾌｫｰﾑ
	uvTmpSSGKEI         : Integer; // 請求書鏡欄税印字
	uvTmpMITPFM         : Integer; // 見積書ﾌｫｰﾑ
	uvTmpJYGKEI         : Integer; // 上代合計欄税印字
	uvTmpSOFOPFM        : Integer; // 送り状ﾌｫｰﾑ
	uvTmpRYOPFM         : Integer; // 領収証ﾌｫｰﾑ
	uvTmpRYOTEKI        : Integer; // 領収証の但し書き
	uvTmpSYURYOKBN      : Integer; // 集金用領収証
//↑<008>
//↓<009>
	uvTmpTnkRnk			: Integer; // 単価ランク
	uvTmpKakeRt			: Extended;// 単価掛率
//↑<009>
begin
//<Rel>	dqMasterTree	:= TMQuery.Create (Self);
	dqMasterData	:= TMQuery.Create (Self);

//<Rel>	m_cDataModule.SetDBInfoToQuery (m_cCDBSelect, dqMasterTree);	// DBとMQueryの接続
//<Rel>	m_cDataModule.SetDBInfoToQuery (m_cCDBSelect, dqMasterData);	// DBとMQueryの接続

    // DBとMQueryの接続<Rel>
    if ( m_pSyncMaster.m_flgGrpCorp = 1 ) then
	    m_cDataModule.SetDBInfoToQuery ( m_pSyncMaster.m_cPDBSelect, dqMasterData )     // 親会社DB
    else
	    m_cDataModule.SetDBInfoToQuery ( m_cCDBSelect, dqMasterData );                  // 子会社DB

    try //<Rel>
		with (dqMasterData) do
		begin
{↓<Rel>
			Close ();
	
			SQL.Clear;
			SQL.Add ('SELECT RDelKbn FROM MTOKUI ');
			SQL.Add ('WHERE  Syokuchikbn = 1 and RDelKbn = 0');     // 念のため、登録済みの諸口をﾁｪｯｸ
	
			Open ();
			if	(not EOF) then
			begin
				dqMasterData.Free ();                               // 存在していたら終了(そもそもこのDLGが立ち上がらない)
				dqMasterTree.Free ();
				Result	:= FALSE;
	    		Exit;
			end
			else
			begin
↑<Rel>}
				Close ();
	
				SQL.Clear;
				SQL.Add('INSERT INTO MTOKUI (   '
				    +   '    SumKbn             '
	                +   '   ,RDelKbn            '
	                +   '   ,GCode              '
	                +   '   ,Renso              '
	                +   '   ,NM                 '
	                +   '   ,NMK                '
	                +   '   ,HojyoKbn1          '
	                +   '   ,HojyoKbn2          '
	                +   '   ,SisanHojyoKbn1     '
	                +   '   ,SisanHojyoKbn2     '
					+	'	,SisanHojyoKbn3		'	// <007>
				    +   '   ,Syokuchikbn        '
	                +   '   ,TStartDate         '
	                +   '   ,TEndDate           '
	                +   '   ,UpdTantoNCode      '   // <006>
				    +   ') VALUES (             '
	                +   '    0                  '
	                +   '   ,0                  '
	                +   '   ,:strExCode         '
	                +   '   ,:strAssociation    '
	                +   '   ,:strName           '
	                +   '   ,:strNameSimple     '
	                +   '   ,1                  '
	                +   '   ,1                  '
	                +   '   ,1                  '
	                +   '   ,1                  '
					+   '   ,1                  '	// <007>
				    +   '   ,1                  '
	                +   '   ,:TStartDate        '
	                +   '   ,:TEndDate          '
	                +   '   ,:UpdTantoNCode     '   // <006>
	                +   ')                      ');
	
				ParamByName('strExCode')       .AsString	:=  strExCode;
{↓<010>
				ParamByName('strAssociation')  .AsString	:=  DialogEditAssociation.Text;
				ParamByName('strName')         .AsString	:=  DialogEditName.Text;
				ParamByName('strNameSimple')   .AsString    :=  DialogEditNameSimple.Text;
↑<010>}
//↓<010>
				ParamByName('strAssociation')  .AsString	:=  StringReplace(AdjustLineBreaks(DialogEditAssociation.Text), #13#10, '',[rfReplaceAll,rfIgnoreCase]);
				ParamByName('strName')         .AsString	:=  StringReplace(AdjustLineBreaks(DialogEditName.Text),        #13#10, '',[rfReplaceAll,rfIgnoreCase]);
				ParamByName('strNameSimple')   .AsString    :=  StringReplace(AdjustLineBreaks(DialogEditNameSimple.Text),  #13#10, '',[rfReplaceAll,rfIgnoreCase]);
//↑<010>
				ParamByName('TStartDate')      .AsDateTime  :=  m_cJNTArea.GetDEFDATE(1);
				ParamByName('TEndDate')        .AsDateTime  :=  m_cJNTArea.GetDEFDATE(2);
	            ParamByName('UpdTantoNCode')   .AsFloat     :=  rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
	
				ExecSQL;
	
				if  (Status <> 0) then													// ｴﾗｰ
				begin
	//<Rel>				dqMasterData.Free ();
	//<Rel>				dqMasterTree.Free ();
	
					Result	:= FALSE;
					Exit;
				end;
	            //内部コードを取得
	            m_WorkNCode := 0; //<Rel>lvNCODE→m_WorkNCodeに。
	            Close ();
	            SQL.Clear;
	            Sql.Add(' select @@identity NCODE From MTOKUI');
	            Open ();
	            if not Eof then
	                m_WorkNCode := FieldByName('NCODE').asFloat; //<Rel>lvNCODE→m_WorkNCodeに。

//<Rel>			end;
//<Rel>		end;

	
	{↓<Rel> fnRegistrationGeneralRecord_Tree に論理を移動。
		with (dqMasterTree) do
		begin
	        // *** HojyoTree作成 ***
			Close ();
			SQL.Clear;
			SQL.Add ('Select EntNo From HojyoTree Where MasterKbn = :nMasterDivision and PatternNo = 0 and SumNCode =:strSum ');
			SQL.Add ('Order by EntNo DESC');
			ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
			ParamByName ('strSum'		  ).AsInteger	:= 0;
			Open;
			if  (Status <> 0) then														// ｴﾗｰ
			begin
				dqMasterData.Free ();
				dqMasterTree.Free ();
	
				Result	:= FALSE;
				Exit;
			end;
	
			iEntNo := GetFld('EntNo').AsInteger;
			Close ();
			SQL.Clear;
			SQL.Add ('INSERT INTO HojyoTree (MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode, AddKbn) ');
			SQL.Add ('VALUES (:nMasterDivision, 0, :strSum, :nEntryNo, :strExCodeSrc, 0) ');
	
			ParamByName ('nMasterDivision').AsInteger	:= m_nMasterDivision;
			ParamByName ('strSum'		  ).AsInteger	:= 0;
			ParamByName ('nEntryNo'       ).AsInteger	:= iEntNo + 100;
			ParamByName ('strExCodeSrc'   ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
	
			ExecSQL;
	
			if  (Status <> 0) then														// ｴﾗｰ
			begin
				dqMasterData.Free ();
				dqMasterTree.Free ();
	
				Result	:= FALSE;
				Exit;
			end;
	↑<Rel>}
	        // *** MTOKUI_SEL ***
	        for i := 1 to 2 do
	        begin
	//↓<008>
	            // ループ中において、1回目は得意先、2回目は仕入先のテンプレートを取得。
	    		Close();
		    	SQL.Clear;
	            SQL.Add('select se.* from MTOKUI_SEL se '+
	                    'inner Join MTOKUI m on se.BaseNCode = m.NCode '+
	                    'where (m.TemplateKbn = 1) '+
	                    'and (se.RecKbn = :RecKbn)');
	            ParamByName('RecKbn').AsInteger	:= i; // ループのインデックスを使用します。
	            Open;
	            if Eof then
	            begin
	                // テンプレート情報がなかったらエラー。
	//<Rel>                dqMasterData.Free ();
	//<Rel>                dqMasterTree.Free ();
	
	                Result	:= FALSE;
	                Exit;
	            end
	            else
	            begin
	                // テンプレート情報を変数に保存。(とりあえず、得意先仕入先に関わらず全て保存します。)
	                // 販売情報用
	                uvTmpURKINHSUKBN    := GetFld('URKINHSUKBN').AsInteger; // 売上端数区分
	                uvTmpGRUZSEIKBN     := GetFld('GRUZSEIKBN') .AsInteger; // 現売税請求区分
	                uvTmpZSEIKBN        := GetFld('ZSEIKBN')    .AsInteger; // 消費税請求区分
	                // 諸口はこのダイアログの登録では随時(固定)で登録されるので、
	                // テンプレート情報の消費税請求区分が「2:請求書単位」だったら「1:伝票単位」にする。
	                if (uvTmpZSEIKBN = 2) then
	                begin
	                    uvTmpZSEIKBN := 1;
	                end;
	                uvTmpZHSUKBN        := GetFld('ZHSUKBN')    .AsInteger; // 消費税端数単位
	                uvTmpZHSUTNIKBN     := GetFld('ZHSUTNIKBN') .AsInteger; // 消費税端数処理
	                uvTmpTRIHIKIKBN     := GetFld('TRIHIKIKBN') .AsInteger; // 取引区分
	                uvTmpNMKBN          := GetFld('NMKBN')      .AsInteger; // 名称変更区分
	                uvTmpSSHCDKBN       := GetFld('SSHCDKBN')   .AsInteger; // 指定商品ｺｰﾄﾞ区分
	                uvTmpSSHCDKET       := GetFld('SSHCDKET')   .AsInteger; // 指定商品ｺｰﾄﾞ桁数
	                uvTmpYYKBN          := GetFld('YYKBN')      .AsInteger; // 和暦西暦区分
	                uvTmpDAINMKBN       := GetFld('DAINMKBN')   .AsInteger; // 代表者名の印字
	                uvTmpUSDENPFM       := GetFld('USDENPFM')   .AsInteger; // 納品書ﾌｫｰﾑ
	                uvTmpMITPFM         := GetFld('MITPFM')     .AsInteger; // 見積書ﾌｫｰﾑ
	                uvTmpJHDENPFM       := GetFld('JHDENPFM')   .AsInteger; // 受注伝票ﾌｫｰﾑ
	                uvTmpSNDENPFM       := GetFld('SNDENPFM')   .AsInteger; // 出荷伝票ﾌｫｰﾑ
	                uvTmpUSGKEI         := GetFld('USGKEI')     .AsInteger; // 売上合計欄税印字
	                uvTmpJYGKEI         := GetFld('JYGKEI')     .AsInteger; // 上代合計欄税印字
	                uvTmpSOFOPFM        := GetFld('SOFOPFM')    .AsInteger; // 送り状ﾌｫｰﾑ
	                // 債権情報用
	                uvTmpSSDENPFM       := GetFld('SSsyoPfm').AsInteger;    // 請求書ﾌｫｰﾑ
	                uvTmpSSGKEI         := GetFld('SSsyoKgm').AsInteger;    // 請求書鏡欄税印字
	                uvTmpRYOPFM         := GetFld('RyoPfm').AsInteger;      // 領収証ﾌｫｰﾑ
	                uvTmpRYOTEKI        := GetFld('RyoTeki').AsInteger;     // 領収証の但し書き
	                uvTmpSYURYOKBN      := GetFld('SyuRyoKbn').AsInteger;   // 集金用領収証
//↓<009>
                    uvTmpTnkRnk			:= GetFld('TnkRnk')     .AsInteger; // 単価ランク
                    uvTmpKakeRt			:= GetFld('KakeRt')     .AsFloat;   // 単価掛率
//↑<009>
	            end;
	//↑<008>
	    		Close ();
		    	SQL.Clear;
	            SQL.Add(' Insert into MTOKUI_SEL (' +
	                    ' BaseNCode     , ' +   //内部ｺｰﾄﾞ
	                    ' UpdTantoNCode , ' +   //担当者内部ｺｰﾄﾞ
	                    ' RecKBN        , ' +   //1 or 2
	                    ' MASKBN        , ' +   //1
	                    ' UsKinKbn      , ' +   //1
	                    ' TnNCode       , ' +   //0
	                    ' BmNCode       , ' +   //0
	                    ' SeiNCode      , ' +   //内部ｺｰﾄﾞ
	                    ' TRSEIKBN      , ');   //2
	//↓<008>
	            SQL.Add('  URKINHSUKBN '
	            +       ' ,GRUZSEIKBN  '
	            +       ' ,ZSEIKBN     '
	            +       ' ,ZHSUKBN     '
	            +       ' ,ZHSUTNIKBN  '
	            +       ' ,TRIHIKIKBN  '
	            +       ' ,NMKBN       '
	            +       ' ,SSHCDKBN    '
	            +       ' ,SSHCDKET    '
	            +       ' ,YYKBN       '
	            +       ' ,DAINMKBN    '
	            +       ' ,USDENPFM    '
	            +       ' ,JHDENPFM    '
	            +       ' ,SNDENPFM    '
	            +       ' ,USGKEI      '
	            +       ' ,SSsyoPfm    '
	            +       ' ,SSsyoKgm    '
//↓<009>
                +       ' ,TnkRnk      '
   	            +       ' ,KakeRt      ');
//↑<009>

	            if i = 1 then
	            begin
	                // 得意先について更新フィールド決定。(仕入先には不要。)
	                SQL.Add(' ,MITPFM      '
	                +       ' ,JYGKEI      '
	                +       ' ,SOFOPFM     '
	                +       ' ,RyoPfm      '
	                +       ' ,RyoTeki     '
	                +       ' ,SyuRyoKbn   ');
	            end;
	            SQL.Add(' ) ');
	//↑<008>
	            SQL.Add(' Values (' +
	                    ' :BaseNCode    , ' +   //内部ｺｰﾄﾞ
	                    ' :UpdTantoNCode, ' +   //担当者内部ｺｰﾄﾞ
	                    ' :RecKBN       , ' +   //1 or 2
	                    ' :MASKBN       , ' +   //1
	                    ' :UsKinKbn     , ' +   //1
	                    ' :TnNCode      , ' +   //0
	                    ' :BmNCode      , ' +   //0
	                    ' :SeiNCode     , ' +   //内部ｺｰﾄﾞ
	                    ' :TRSEIKBN     , ');   //2
	//↓<008>
	            SQL.Add('  :URKINHSUKBN '
	            +       ' ,:GRUZSEIKBN  '
	            +       ' ,:ZSEIKBN     '
	            +       ' ,:ZHSUKBN     '
	            +       ' ,:ZHSUTNIKBN  '
	            +       ' ,:TRIHIKIKBN  '
	            +       ' ,:NMKBN       '
	            +       ' ,:SSHCDKBN    '
	            +       ' ,:SSHCDKET    '
	            +       ' ,:YYKBN       '
	            +       ' ,:DAINMKBN    '
	            +       ' ,:USDENPFM    '
	            +       ' ,:JHDENPFM    '
	            +       ' ,:SNDENPFM    '
	            +       ' ,:USGKEI      '
	            +       ' ,:SSsyoPfm    '
	            +       ' ,:SSsyoKgm    '
//↓<009>
	            +       ' ,:TnkRnk      '
	            +       ' ,:KakeRt      ');
//↑<009>
	            if i = 1 then
	            begin
	                // 得意先についてバインド変数決定。
	                SQL.Add(' ,:MITPFM      '
	                +       ' ,:JYGKEI      '
	                +       ' ,:SOFOPFM     '
	                +       ' ,:RyoPfm      '
	                +       ' ,:RyoTeki     '
	                +       ' ,:SyuRyoKbn   ');
	            end;
	            SQL.Add(' ) ');
	//↑<008>
		    	ParamByName ('BaseNCode'    ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
			    ParamByName ('UpdTantoNCode').AsFloat  	:= m_TantoNCode;
	    		ParamByName ('RecKbn'       ).AsInteger	:= i;
		    	ParamByName ('MASKBN'       ).AsInteger	:= 1;
			    ParamByName ('UsKinKbn'     ).AsInteger	:= 1;
	    		ParamByName ('TnNCode'      ).AsFloat	:= 0;
		    	ParamByName ('BmNCode'      ).AsFloat	:= 0;
			    ParamByName ('SeiNCode'     ).AsFloat	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
	    		ParamByName ('TRSEIKBN'     ).AsInteger	:= 2;
	//↓<008>
				ParamByName('URKINHSUKBN').AsInteger	:= uvTmpURKINHSUKBN;	// 売上端数区分
				ParamByName('GRUZSEIKBN') .AsInteger	:= uvTmpGRUZSEIKBN;		// 現売税請求区分
				ParamByName('ZSEIKBN')    .AsInteger	:= uvTmpZSEIKBN;		// 消費税請求区分
				ParamByName('ZHSUKBN')    .AsInteger	:= uvTmpZHSUKBN;		// 消費税端数単位
				ParamByName('ZHSUTNIKBN') .AsInteger	:= uvTmpZHSUTNIKBN;		// 消費税端数処理
				ParamByName('TRIHIKIKBN') .AsInteger	:= uvTmpTRIHIKIKBN;		// 取引区分
				ParamByName('NMKBN')      .AsInteger	:= uvTmpNMKBN;			// 名称変更区分
				ParamByName('SSHCDKBN')   .AsInteger	:= uvTmpSSHCDKBN;		// 指定商品ｺｰﾄﾞ区分
				ParamByName('SSHCDKET')   .AsInteger	:= uvTmpSSHCDKET;		// 指定商品ｺｰﾄﾞ桁数
				ParamByName('YYKBN')      .AsInteger	:= uvTmpYYKBN;			// 和暦西暦区分
				ParamByName('DAINMKBN')   .AsInteger	:= uvTmpDAINMKBN;		// 代表者名の印字
				ParamByName('USDENPFM')   .AsInteger	:= uvTmpUSDENPFM;		// 納品書ﾌｫｰﾑ
				ParamByName('JHDENPFM')   .AsInteger	:= uvTmpJHDENPFM;		// 受注伝票ﾌｫｰﾑ
				ParamByName('SNDENPFM')   .AsInteger	:= uvTmpSNDENPFM;		// 出荷伝票ﾌｫｰﾑ
				ParamByName('USGKEI')     .AsInteger	:= uvTmpUSGKEI;			// 売上合計欄税印字
				ParamByName('SSsyoPfm')   .AsInteger	:= uvTmpSSDENPFM;		// 請求書ﾌｫｰﾑ
				ParamByName('SSsyoKgm')   .AsInteger	:= uvTmpSSGKEI;			// 請求書鏡欄税印字
//↓<009>
				ParamByName('TnkRnk')     .AsInteger	:= uvTmpTnkRnk; 		// 単価ランク
				ParamByName('KakeRt')     .AsFloat  	:= uvTmpKakeRt;			// 単価掛率
//↑<009>
	            if i = 1 then
	            begin
	                // 得意先についてバインド変数にセット。(仕入先には不要。)
					ParamByName('MITPFM')     .AsInteger	:= uvTmpMITPFM;			// 見積書ﾌｫｰﾑ
					ParamByName('JYGKEI')     .AsInteger	:= uvTmpJYGKEI;			// 上代合計欄税印字
					ParamByName('SOFOPFM')    .AsInteger	:= uvTmpSOFOPFM;		// 送り状ﾌｫｰﾑ
					ParamByName('RyoPfm')     .AsInteger	:= uvTmpRYOPFM;			// 領収証ﾌｫｰﾑ
					ParamByName('RyoTeki')    .AsInteger	:= uvTmpRYOTEKI;		// 領収証の但し書き
					ParamByName('SyuRyoKbn')  .AsInteger	:= uvTmpSYURYOKBN;		// 集金用領収証
				end;
	//↑<008>
		    	ExecSQL;

	    		if  (Status <> 0) then
		    	begin
	//<Rel>		    	dqMasterData.Free ();
	//<Rel>			    dqMasterTree.Free ();
	
	    			Result	:= FALSE;
		    		Exit;
			    end;
	        end;
	
	        // *** MTOKUI_MAS ***
	        SQL.Clear;
	        SQL.Add(' Insert into MTOKUI_MAS (' +
	                ' BaseNCode     , ' +
	                ' UpdTantoNCode , ' +
	                ' TCreditCash   , ' +
	                ' SDebitCash      ' +
	                ')');
	        SQL.Add(' Values ('         +
	                ' :BaseNCode    , ' +   //内部ｺｰﾄﾞ
	                ' :UpdTantoNCode, ' +   //担当者内部ｺｰﾄﾞ
	                ' :TCreditCash  , ' +
	                ' :SDebitCash     ' +
	                ')');
	      	ParamByName ('BaseNCode'    ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
		    ParamByName ('UpdTantoNCode').AsFloat  	:= m_TantoNCode;
	    	ParamByName ('TCreditCash'  ).AsInteger	:= 0;
		   	ParamByName ('SDebitCash'   ).AsInteger	:= 0;
	       	ExecSQL;
	
	        if  (Status <> 0) then
		    begin
	//<Rel>		   	dqMasterData.Free ();
	//<Rel>		    dqMasterTree.Free ();
	
	    		Result	:= FALSE;
		    	Exit;
			end;
	
	        // *** MTOKUI_CRD ***
	        SQL.Clear;
	        SQL.Add(' Insert into MTOKUI_CRD (' +
	                ' BaseNCode     , ' +
	                ' UpdTantoNCode , ' +
	                ' Ku            , ' +
	                ' TesuryoFutan    ' +
	                ')');
	        SQL.Add(' Values ('         +
	                ' :BaseNCode    , ' +   //内部ｺｰﾄﾞ
	                ' :UpdTantoNCode, ' +   //担当者内部ｺｰﾄﾞ
	                ' :Ku           , ' +
	                ' :TesuryoFutan   ' +
	                ')');
	      	ParamByName ('BaseNCode'    ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
		    ParamByName ('UpdTantoNCode').AsFloat  	:= m_TantoNCode;
	    	ParamByName ('Ku'           ).AsInteger	:= 0;
		   	ParamByName ('TesuryoFutan' ).AsInteger	:= 0;
	       	ExecSQL;
	
	        if  (Status <> 0) then
		    begin
	//<Rel>		   	dqMasterData.Free ();
	//<Rel>		    dqMasterTree.Free ();
	
	    		Result	:= FALSE;
		    	Exit;
			end;
	        // *** MTOKUI_DEP ***
	        SQL.Clear;
	        SQL.Add(' Insert into MTOKUI_DEP (' +
	                ' BaseNCode     , ' +
	                ' UpdTantoNCode , ' +
	                ')');
	        SQL.Add(' Values ('         +
	                ' :BaseNCode    , ' +   //内部ｺｰﾄﾞ
	                ' :UpdTantoNCode, ' +   //担当者内部ｺｰﾄﾞ
	                ')');
	      	ParamByName ('BaseNCode'    ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
		    ParamByName ('UpdTantoNCode').AsFloat  	:= m_TantoNCode;
	       	ExecSQL;
	
	        if  (Status <> 0) then
		    begin
	//<Rel>		   	dqMasterData.Free ();
	//<Rel>		    dqMasterTree.Free ();
	
	    		Result	:= FALSE;
		    	Exit;
			end;
	        // *** MTOKUI_PAY ***
	        SQL.Clear;
	        SQL.Add(' Insert into MTOKUI_PAY (' +
	                ' BaseNCode     , ' +
	                ' UpdTantoNCode , ' +
	                ')');
	        SQL.Add(' Values ('         +
	                ' :BaseNCode    , ' +   //内部ｺｰﾄﾞ
	                ' :UpdTantoNCode, ' +   //担当者内部ｺｰﾄﾞ
	                ')');
	      	ParamByName ('BaseNCode'    ).AsFloat  	:= m_WorkNCode; //<Rel>lvNCODE→m_WorkNCodeに。
		    ParamByName ('UpdTantoNCode').AsFloat  	:= m_TantoNCode;
	       	ExecSQL;

	        if  (Status <> 0) then
		    begin
	//<Rel>		   	dqMasterData.Free ();
	//<Rel>		    dqMasterTree.Free ();

	    		Result	:= FALSE;
		    	Exit;
			end;
		end;
    finally //<Rel>
        dqMasterData.Close();
        dqMasterData.Free ();
    end;

//<Rel>	dqMasterData.Free ();
//<Rel>	dqMasterTree.Free ();

	Result	:= TRUE;																// 正常終了
end;

//↓<Rel>
//************************************************************************
//	Component		:	JNTCRP004001SyokuchiDlgf(TForm)
//					:	フォームが表示されたときの処理
//	Event			:	OnShow
//************************************************************************
procedure TJNTCRP004001SyokuchiDlgf.FormShow(Sender: TObject);
begin
	PostMessage(Self.Handle,WM_ONPAINT,0,0);	// OnPaint Post
end;

//**************************************************************************
//	Proccess  :
//	Name	  :
//	Parameter :
//	Retrun	  :
//**************************************************************************
procedure TJNTCRP004001SyokuchiDlgf.WMOnPaint(var Msg: TMessage);
var
    iErrCode : Integer;
begin
	// 初回だけの論理
	if m_IsFirst then
	begin
		m_IsFirst := False;

        // グループ会計子社は親に諸口があるかを判定し、あれば、自動配信する。
        if (m_pSyncMaster.m_flgGrpCorp = 1 ) then
        begin
            iErrCode := fnCheckMasterDataRecordValid ( '', 1 );
            if ( iErrCode = -99 ) then
            begin
                MjsMessageBoxEx (Self,
                             '自社への関連付けに失敗しました。',
                             'マスタ同期', mjError, mjOk, mjDefOk);
            end
            else if (iErrCode = -2) then
            begin
                //同期されたときは、ダイアログを閉じる。
                ModalResult	:= mrOK;
            end;
        end;
	end;
end;
//↑<Rel>

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*																									*/
//***************************************************************************************************/


