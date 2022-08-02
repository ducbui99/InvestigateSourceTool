//******************************************************************************
//		System		: Galileopt人事給与システム
//		Program		: 社員登録(親)
//		ProgramID	: HAP000010
//		Name		: Yoshitaka Kondo
//		Create		: 2012/07/09
//		Comment		: タブ制御をマスタ化することによる、大幅改良の為再作成
//		History		: 2012/08/20	Y.Kondo
//					: 担当者管理変更対応
//					: マスタ同期に関する箇所を削除
//					: 2012/12/12	E.Inukai	<121212>
//					: 労働者名簿の帳票グループを「990100」から「990200」に変更
//					: 2012/12/18	E.Inukai	<121218>
//					: 離職証明書ファイル出力対応
//					: 2013/02/21	Y.Kondo
//					: MJSLINK NX-I対応						<MLX>
//					: 2013/04/16	E.Inukai				<130416>
//					: 社員削除の呼出処理を変更
//					: 2013/08/29	E.Inukai
//					: 労働者名簿のデフォルト用紙サイズをB4→A4に変更	<130829>
//					: 2014/03/26	Y.Kondo
//					: MJSLINK NX-I 採番設定情報の反映		<2014-03-26>
//					: 2014/11/26	E.Inukai
//					: 社員未登録で基本情報を呼んだ時の動作を変更
//					: 2015/04/16	高速化対応 <高速化>
//					: 2015/07/08	H.Takaishi
//					: マイナンバー対応						<MYN>
//					: 2016/01/27	M.Tamaki
//					: 予約入力メッセージ変更				<2016-01-27>
//					: 2016/04/22	Y.Kondo
//					: 社員検索エクスプローラー拡張機能追加	<CSTM>
//					: 2016/11/22	Y.Kondo					<2016-11-22>
//					: 計算対象者支給グループ未設定チェック追加
//					: 2017/10/04	Y.Kondo					<2017-10-04>
//					: 「年末調整情報確認表」チェックボックス表示対応
//					: 2020/01/16	Y.Kondo					<JinTan>
//					: 計算対象者支給グループ未設定チェック/ライセンス判定追加
//					: 2020/02/07	Y.Arakawa(TakumiCo.)	<JinTan-G>
//					: ライセンス判定変更　CheckModuleLicense→HAPCheckModuleLicense
//					: 2020/04/14 R.Masuno(CyberCom)
//					: ストアドプロシージャ対応				<D10-Stored>
//					: 2020/05/08	Y.Kondo
//					: 基準日対応							<RefDay>
//					: 2020/05/21	H.Kanbayashi(CyberCom)	<D10-E017>
//					: Delphi10移行 共通案件別対応 E017
//					: 2020/09/09	R.Kobayashi(TakumiCo)	<2020-09-09>
//					: 【MLX】人事大将で予約入力呼び出すと会社選択ダイアログが表示される現象を修正
//					: 2020/11/20	Y.Kondo
//					: 「区分情報」タブ追加対応				<2020-11-20>
//					: 2021/01/08	H.Takaishi(TakumiCo.)	<DRILD>
//					: ドリルダウン対応
//					: 2022/01/18	M.Yamada(CyberCom)
//					: 計算区分・人事予備区分追加対応（20→40）	<20220118>
//******************************************************************************
unit HAP000010BaseU;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
	Buttons, VCL.Dialogs, ComCtrls, VCL.ExtCtrls, VCL.StdCtrls, DBCtrls, FireDAC.Comp.Client,
	Menus, Math,

	MJSPanel, MJSEdits, MJSStatusBar, MJSFunctionBar, MJSSPFunctionBar,
	MJSTab, MJSFormTab, MJSLabel, MJSBitBtn, MJSSpeedButton, MJSQuery,
	MJSDateCtrl, MjsKeyDataState,
	MjsPrnDlgU, MjsPreviewIFu, MjsPrnSupportU, MJSDBModuleU, MLBplLoaderU,
	MJSDBNavigator, MjsMsgStdu, MJSPopupMenu,
	MJSMyNumApIf20U,MYNAccess3U,HapMyNumInfoU,	// <MYN>

	HapPrnDlgSpU, HapSYDataModuleU, HapSYExpIFU, HapApIFU, HapKMExpIFU,
	HapSYLockU, HAPPerms,

	SeriesCheck2U,
	FxPerms,
	FXLicense;

const
{$I HapCmnDef.inc}						// 給与共通定義
{$I HapPrnConst.inc}					// 印刷AP間定数定義
  WM_DISPRUN	=WM_APP +2;				// ダイアログ表示時のメッセージ用
  WM_SETFOCUS	=WM_APP	+3;

  C_STAFF_MASTER = 25;					// 社員ﾏｽﾀ区分

type
{$I ActionInterface.inc}
{$I HapPrnType.inc}						// 印刷AP間ﾊﾟﾗﾒｰﾀ定義
{$I HAPSyncMasterH.inc}					// ﾏｽﾀ同期共通ﾍｯﾀﾞ部

{$I HAPSyncMasterIFH.inc}

  //子AP情報
  TChildInfo=record
	sCaption: string;
	iPrgCode,
	iPrgId,
	iPrgPara: integer;
	bExist,
	bSelected,
	bRefDay	: boolean;
  end;


  //子AP検索方向
  TChildBplFindAction=(cfNext,cfTop,cfEnd,cfPrev);

  TFuncCaptions = array[0..7] of String;

  THAP000010BaseF = class(TForm)
	PTool: TMPanel;
	pnlTop: TMPanel;
	FuncBar: TMSPFunctionBar;
	MLabel1: TMLabel;
	BNavi: TMDBNavigator;
	BExit: TMSpeedButton;
	BChange: TMSpeedButton;
	BPrint: TMSpeedButton;
	Bevel1: TBevel;
	LSyainCount: TMLabel;
	LZaisyoku: TMLabel;
	LShiharai: TMLabel;
	MLabel3: TMLabel;
	LShowOrder: TMLabel;
	MLabel5: TMLabel;
	PClient: TMPanel;
	sbxClient: TScrollBox;
	PAPParent: TMPanel;
	LStatus: TMLabel;
	LEmpName: TMLabel;
	LDeptName: TMLabel;
	PTab: TMPanel;
	MTab: TMTab;
	PnlBottom: TMPanel;
	BUpdate: TMBitBtn;
	BCancel: TMBitBtn;
	BNext: TMBitBtn;
	BBack: TMBitBtn;
	BEnter: TMSpeedButton;
	StatusBar: TMStatusBar;
	ENEmpNo: TMNumEdit;
	ESEmpNo: TMTxtEdit;
	LDeptNo: TMLabel;
	FusenInfo: TMLabel;
	FusenLabel: TMLabel;
	LRetire: TMLabel;
	TRetire: TMLabel;
	btnMask: TMSpeedButton;
	MPopMenu: TMPopupMenu;
	N3: TMenuItem;
	N4: TMenuItem;
	N1: TMenuItem;
	N2: TMenuItem;
	LRefDate: TMLabel;
	YoyakuTimer: TTimer;
	constructor CreateForm(pRec:pointer; pParam: Pointer=nil);	// <DRILD>
	{Form}
	procedure FormCreate(Sender:TObject);
	procedure FormShow(Sender:TObject);
	procedure FormHide(Sender: TObject);
	procedure FormClose(Sender:TObject; var Action: TCloseAction);
	procedure FormDestroy(Sender:TObject);
	procedure FormActivate(Sender:TObject);
	{Component}
	procedure fnWCTLEnter(Sender:TObject);
	procedure fnWCTLExit(Sender:TObject);
	procedure BExitClick(Sender:TObject);
	procedure BChangeClick(Sender:TObject);
	procedure FuncBarFunctionClick(Sender: TObject; FuncNo: Integer);
	procedure fnToolBtnClick(Sender:TObject);
	procedure EEmpNoEnter(Sender:TObject);
	procedure EEmpNoArrowClick(Sender: TObject);
	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure BNaviClick(Sender: TObject; Button: TMNavigateBtn);
	procedure MTabChange(Sender: TObject);
	procedure MTabEnter(Sender: TObject);
	procedure FormResize(Sender: TObject);
	procedure BUpdateClick(Sender: TObject);
	procedure BCancelClick(Sender: TObject);
	procedure BNextClick(Sender: TObject);
	procedure BBackClick(Sender: TObject);
	procedure MTabExit(Sender: TObject);
	procedure BEnterClick(Sender: TObject);

	procedure BPrintClick(Sender: TObject);
	procedure EEmpNoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure MTabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure StatusBarResize(Sender: TObject);
	procedure btnMaskClick(Sender: TObject);
	procedure LRefDateClick(Sender: TObject);
	procedure N3Click(Sender: TObject);
	procedure N1Click(Sender: TObject);
	procedure N2Click(Sender: TObject);
	procedure YoyakuTimerTimer(Sender: TObject);

  private
	{ Private 宣言 }
	pAppRec			:^TMjsAppRecord;						// AP<->SystemMenu間ﾊﾟﾗﾒｰﾀ
	MDBModule		: TMDataModuleF;						// DBﾓｼﾞｭｰﾙ
	mqMA,													// 会社
	mqKM,													// 会社
	mqSY,													// 社員
	mqSC,													// 社員
	mqSLK			: TMQuery;								// 社員ﾛｯｸ

	HapApParam		: THapApParam;							// 親AP<->子AP間ﾊﾟﾗﾒｰﾀ

	HapApIF			: array[0..29]of THapApIF;				//

	ActiveChildPos	: Integer;								//
	svActiveChildPos: Integer;								// 前画面保持

	ACCtrl			: TWinControl;							// ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ

	sEmpNo			: string;								// 社員No(ﾏｽﾀ格納形式返還後)
	m_iEmpNCode,
	m_iCmnNCode		: Int64;								// マッピング先担当者（共通）内部コード

	arrLoadBplNo	: array[0..29]of integer;				// Loadした子APのNo(arrChildBplの配列No)

	HapSYExpParam	: THapSYExpParam;						// 社員検索Expﾊﾟﾗﾒｰﾀ
	HapSYExpIF		: THapSYExpIF;							// 社員検索Exp I/F

	ddCopDB			: TFDConnection;
	ddMjsDB			: TFDConnection;

	SYDBModule		: THapSYDataModuleF;

	// <DRILD>
	m_bDrillDown	: Boolean;
	m_iDrillEmpNCode: Int64;

	// <高速化>
	m_arrHAPKM		: THAPKM;
	m_arrHAPMN		: THAPMN;

	// マイナンバー管理用 <MYN>
	m_MYN			: TMYNAccess3;							// マイナンバー共通クラス
	m_HAPMyNum		: THAPEmpMyNumInfo;						// 社員マイナンバー情報管理モジュール
	m_bUsePGChgDlg	: Boolean;								// 支給グループ変更ダイアログ使用フラグ

	InsFlg,													// True:新規社員ｲﾝｻｰﾄ
	gbExitFromChild,										// True:ｷｰ押下(MTab-OnChangeでの判定)
	gbUpdateClick	: Boolean;								// True:更新ﾎﾞﾀﾝ押下

	iBNextWidth,											// [次へ][前へ]ﾎﾞﾀﾝ幅
	iBBackWidth		: integer;								// 可視/不可視でなく幅0で非表示にする

	// ｼｽﾃﾑ判定
	m_iParam		: Integer;
	arrParam		: array[0..1]of integer;

	// 子AP情報
	arrChildInfo	: array of TChildInfo;

	// 指定条件ﾀﾞｲｱﾛｸﾞ
	slCondition		: TStringList;

	arrKMCnt		: array[0..1]of integer;				// [0]給与+基礎給 / [1]賞与
	arrMNCnt		: array[0..4]of integer;				// [0]資格免許 / [1]教育[2]研修 / [3]褒賞[4]懲罰

	// 印刷
	MPrnDlgF		: TMjsPrnDlgF;							// 印刷ﾀﾞｲｱﾛｸﾞ
	MPreview		: TMjsPreviewIF;						// ﾌﾟﾚﾋﾞｭｰ

	HapPrnDlgInfo	: array of THapPrnDlgSpInfo;			// 書式構造体->HapPrnDlg

	// 親子間制御
	TBtn			: TToolButton;
	PMenu			: TPopUpMenu;

	EnterFlg		: Boolean;								// True:親APにﾌｫｰｶｽ

	bWMDispRunBfr	: boolean;
	m_bErrClose		: Boolean;

	m_iRatio		: Integer;

	recCommon		: rcCommonArea;
	recSystem		: rcSystemArea;

	giEmpDigit,
	giEmpAttr		: Integer;

	giDeptAttr		: Integer;

	arrFuncBar		: TFuncCaptions;

	m_bPrmAppend	: Boolean;								// 追加権限用
	m_bPrmDisplay	: Boolean;								// 表示権限用
	m_bPrmModify	: Boolean;								// 修正権限用
	m_bPrmDelete	: Boolean;								// 削除権限用
	m_bPrmPrint		: Boolean;								// 印刷権限用
	m_bPrmExtract	: Boolean;								// csv出力権限用
	m_bModify		: Boolean;								// 登録系追加修正権限用

	m_sBmCd			: String;								// 部門権限絞込みSQL

	m_SyncMaster	: THapSyncMaster;						// <マスタ同期>

	m_iErrorKbn		: Integer;								// ｴﾗｰﾒｯｾｰｼﾞ区分

	m_iHanyo		: Integer;								// 汎用振込採用数

	m_HAPPerms		: THapPerms;							// 権限管理・決算更新区分管理ﾓｼﾞｭｰﾙ object
	m_bPrmKessan	: Boolean;								// 決算更新区分

	m_iPrivateFlg	: shortInt;								// 0:表示する 1:表示しない

	m_iRekiKbn		: shortInt;

	m_FImage		: TImage;

	m_iPrintOrder	: shortInt;
	m_iaddin30		: shortInt;
	m_iaddin32		: shortInt;
	m_iaddin33		: shortInt;

	m_aCodeinfo		: array[0..3]of Integer;

	m_aJIGFlg		: array[1..5]of Integer;				// 事業所判定(未使用)

	m_bDefTab		: Boolean;								// 規定タブ読み込みフラグ

	m_bMNCntZero	: Boolean;								// 区分登録なしによる処理呼び出し不可フラグ

	m_Series		: TMSeries2;							// シリーズ判定クラス<MLX>

	m_RefEna		: Boolean;								// 基準日指定可能フラグ <RefDay>

	procedure WMDispRun(var Msg: TMessage); message WM_DISPRUN;
	procedure fnFormIni;									// ﾌｫｰﾑ初期設定
	function fnChildLoad(iPos:Integer):boolean;				// 子AP ﾛｰﾄﾞ/表示
	procedure fnChildUnLoad(iPos:byte);						// 子AP 破棄/ｱﾝﾛｰﾄﾞ

	procedure fnTopPanelSet;								// 社員選択ﾊﾟﾈﾙ内容表示
	procedure fnTopPanelClear;								// 社員選択ﾊﾟﾈﾙ内容ｸﾘｱ
	function fnChildBplExist:boolean;						// 社員BPL格納状態 検索

	function fnChildBplFind(cfAction:TChildBplFindAction):integer;	//社員BPL選択状態 検索
	procedure fnTabEnable(bEnable:boolean);					// 処理選択ﾊﾟﾈﾙ使用可/不可切替
	procedure fnChildBplIni;								// 子BPL初期読込

	//以下OwnerEntry(子APからの指示)で実行
	procedure fnFuncBarSet;									// ﾌｧﾝｸｼｮﾝﾊﾞｰ更新
	procedure fnTopPanelEnable(bEnable:boolean);			// 社員選択ﾊﾟﾈﾙ使用可/不可 切替]

	procedure fnAfterTabClick;								// 子AP入力完了->次AP
	procedure fnAfterUpdateClick;							// 子AP入力完了->社員No
	function fnCommitAndLock: Integer;						// 一旦Commit->再ロック <MYN>

	function fnSyainExist:boolean;							// 社員登録済判定

	procedure fnBottomPanelEnable(bEnable:Boolean);

	procedure fnTopBplSelect;

	function fnObjectCreate:Boolean;
	procedure fnObjectFree;
	procedure fnTopPanelUpdate;
	procedure fnCallChgDlg;
	procedure fnCallDelDlg;
	procedure fnCallSelDlg;
	procedure fnCallPGChgDlg;								// 支給グループ変更ダイアログ <MYN>
	function fnCallRefDlg: Boolean;

	procedure WMSetFocus(var Msg:TMsg);message WM_SETFOCUS;

	function fnNumEdit(vNum: variant; iLength: integer): string;
	procedure fnBtnVisible(bVisible:boolean);

	procedure fnPrintInfoIni;
	procedure fnRrefixDateUpd;
	function fnPrintBplExists(iId:integer):boolean;
	procedure fnKMCntSet(iMODE: ShortInt);
	procedure fnCall_LogProc;

	procedure fnMNCntSet(MODE: ShortInt);
	function fnMNCntSet2: Boolean;

	procedure fnHanCntSet;

	function fnNewEmpDate(iMode : ShortInt = 0) : Boolean;	// 新規社員登録ダイアログ呼び出し

	procedure ChangeOrder;

	function fnEmpEnter(EEmpNo:TObject):boolean;

	procedure fnFusenClick(Sender:TObject);

	procedure fnCallCopyDlg;

	function fnSysKbnCheck : Integer;

	function fnSetEmpCode(var retCodeNo:int64; var retCodeTx:String) : Boolean;	// 社員コード自動採番

	function fnSYCheck	: Boolean;

	procedure fnJIGCheck;				// 事業所判定(保留)

	// <MYN> マイナンバー管理
	function fnMyNumInit: Boolean;
	procedure fnMyNumUpd;

	procedure fnPayGroupNoCheck;		//<2016-11-22>

	procedure fnReferDay(MODE:Integer=0);

  public
	{ Public 宣言 }
  protected
	{ Prptected 宣言 }
	procedure CMChildKey(var Msg: TWMKey);message CM_ChildKey;
  end;


function AppEntry(pPar:pointer):integer;					// SystemMenu->Self
function OwnerEntry(pPar:pointer):integer;					// ChildAP	->Self

//共通?

function HapGetPrnInfo(pAppRec:Pointer;MPrnSupport:TMjsPrnSupport;COwner:TComponent=nil):Boolean;

exports
  AppEntry,OwnerEntry;

implementation

uses
	MjsDispCtrl,
	MjsStrCtrl,
	MjsCommonU,
	MjsCommon2U,
	HapLibU,
	HapMsgU,
	HAP000010DialogU,
	HAP000010RefDlgU,
	HAP000010SetCodeDlgU,
	HAP000010StaffSelDlgU;

const

	arrShowOrder:array[0..1]of string=('所属順','社員順');

	arrFuncBarConst: TFuncCaptions =(						//社員Noﾌｧﾝｸｼｮﾝ
										' F1 表示順変更',
										'',
										'',
										'',
										'',
										' F6 社員コピー',
										' F7 社員No変更',
										' F8 社員削除'
									);

	arrFuncBar00:array[0..7]of String=(						//社員Noﾌｧﾝｸｼｮﾝ
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										''
									);

	//社員登録件数
	_EMPNCD_MAX_=99999999;

	//在職者表示
	gaZaishoku : array[0..3] of String=('在職者','在職者','退職者','休職者');

	//支払形態表示
	gaShiharai : array[0..4] of String=('月給者','年収者','月給者','日給者','時給者');

	//区分名称
	gaMNItemNo : array[0..4]of Integer=(170200,170700,171100,171500,171900);

	_MN_SHIKAKU	=0;
	_MN_KYOUIKU	=1;
	_MN_KENSYU	=2;
	_MN_HOUSYOU	=3;
	_MN_CHOBATSU=4;

{$R *.DFM}

{$include MYNAccessDefI.inc}								// <MYN>
{$include HAPSysDef.inc}

{$include HAPSyncMasterB.inc}								// ﾏｽﾀ同期共通実装部
{$include HAPSyncMasterIFB.inc}

//----------------------------------------------------------------------
//	Package Export Function
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:SystemMenu入り口
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:pPar	:
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000010BaseF;
	pRec	: ^TMjsAppRecord;
	iAction	: integer;
begin
	Result	:= ACTID_RET_NG;
	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );		// TMjsAppRecord 構造体 pointer 取得
	iAction := TAppParam( pPar^ ).iAction;					// Action ID 取得

	case iAction of

		ACTID_FORMCREATESTART ,
		ACTID_FORMCREATESHOWSTART :
		begin
			try
				New( pForm );
			except
				Exit;
			end;

			try
				pForm^ := THAP000010BaseF.CreateForm( pRec, ParrHAPActionParam(TAppParam(pPar^).pActionParam) );	// <DRILD>
				pRec^.m_pChildForm := pForm;
				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					PostMessage(pForm^.Handle,WM_SETFOCUS,0,0);
				end;
			except
				Dispose( pForm );
				Exit;
			end;
		end;

		ACTID_FORMCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Close;
			pForm^.Free;
			Dispose( pForm );
		end;

		ACTID_FORMCANCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.CloseQuery = False then
			begin
				Exit;
			end;
		end;

		ACTID_SHOWSTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			if pForm^.WindowState=wsMinimized then
				pForm^.WindowState:=wsNormal;
			pForm^.Show;
			PostMessage(pForm^.Handle,WM_SETFOCUS,0,0);
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
			end;
		end;

	end;

	Result:=ACTID_RET_OK;
end;

//**********************************************************************
//		Proccess	:ChildAp Menu入り口
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:pPar	:
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function OwnerEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000010BaseF;
	pRec	: ^TMjsAppRecord;
	iAction	: integer;

begin
	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );		// TMjsAppRecord 構造体 pointer 取得
	iAction	:= TAppParam( pPar^ ).iAction;					// Action ID 取得

	case iAction of
		HAPAP_ACTID_FBARCAPTION:		// ﾌｧﾝｸｼｮﾊﾞｰ表示
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			pForm^.fnFuncBarSet;
		end;

		HAPAP_ACTID_STATUSTEXT,			// ｽﾃｰﾀｽﾊﾞｰ更新1
		HAPAP_ACTID_STATUSTEXTEX:		// ｽﾃｰﾀｽﾊﾞｰ更新2
		begin
			//
		end;

		HAPAP_ACTID_SETFOCUS_TAB:		// 子AP先頭で[Shift]+[Tab]抜け
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			with pForm^ do
			begin
				gbExitFromChild:=True;	// 子AP抜けﾌﾗｸﾞON
				//ﾀﾌﾞへﾌｫｰｶｽ移動
				MjsSetFocus(pForm^,MTab.Name);
			end;
		end;

		HAPAP_ACTID_SETFOCUS_BTN:		// 子AP[Esc][End]抜け
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			with pForm^ do
			begin
				with BNext do
				begin
					if(Visible and Enabled)then				// 次へ[表示]+[使用可]
						MjsSetFocus(pForm^,BNext.Name)
					else									// 最終ﾀﾌﾞor単一状態
						MjsSetFocus(pForm^,BUpdate.Name);
				end;
			end;
		end;

		//子AP入力完了
		HAPAP_ACTID_EXIT_OK:			// 子APからの終了可通知
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			with pForm^ do
			begin
				if not gbUpdateClick then					// ﾀﾌﾞ/次/前押下
					fnAfterTabClick
				else
					fnAfterUpdateClick;
				gbUpdateClick:=False;						// 判定完了したのでFalse
			end;
		end;

		//子AP入力完了不可
		HAPAP_ACTID_EXIT_NG:
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			with pForm^ do				// 処理ﾎﾞﾀﾝ状態変更(元に戻す)
			begin
				//更新押下をOFF
				gbUpdateClick:=False;

				svActiveChildPos := ActiveChildPos;			// TabChangeにより変更があるため元に戻す

				MTab.Items.Selected:=arrLoadBplNo[ActiveChildPos];
				//ﾌｫｰｶｽを子側に復帰させる
				EnterFlg:=False;
				//内部にﾌｫｰｶｽが移動する
				HAPApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SETFOCUS,
														@HAPApParam			);
			end;
		end;

		HAPAP_ACTID_ENTER_OK:			// 子AP入力開始
		begin
			//社員選択部を使用不可にする
			pForm := Pointer( pRec^.m_pOwnerForm );
			with pForm^ do
			begin
				fnTopPanelEnable(FALSE);					// 社員選択ﾊﾟﾈﾙ使用[不可]
				fnTabEnable(True);							// 処理選択ﾊﾟﾈﾙ使用[可]
			end;
		end;

		// <MYN>
		HAPAP_ACTID_COMMIT_LOCK:
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			Result := pForm.fnCommitAndLock;
			exit;
		end;

		HAPAP_ACTID_CLOSEEND:
		begin
			pForm := Pointer( pRec^.m_pOwnerForm );
			pForm.Close;
		end;

	end;

	Result:=ACTID_RET_OK;
end;

//----------------------------------------------------------------------
//	OwnerEntryから直接呼ばれる関数
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:ﾌｧﾝｸｼｮﾝﾊﾞｰｷｬﾌﾟｼｮﾝ更新
//		Name		:T.Aoki
//		Date		:2000/12/18
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnFuncBarSet;
var
	sFunc	: array of string;
begin
	Setlength(sFunc,8);										// ﾌｧﾝｼｮﾝ8個
	HAPApParam.GetFuncCaption(sFunc);						// ｷｬﾌﾟｼｮﾝ文字列 取出
	FuncBar.CopyFuncData(sFunc);							// ｺﾝﾎﾟｰﾈﾝﾄにｾｯﾄ
end;

//**********************************************************************
//		Proccess	:ｽﾃｰﾀｽﾊﾞｰ文字列更新
//		Name		:T.Aoki
//		Date		:2000/12/18
//		Parameter	:
//		Return		:
//		History		:2002/09/25(T.Aoki)
//					:新規登録で内容部に移動する場合	->付箋ﾂｰﾙﾎﾞﾀﾝ[使用不可]
//					:他								->使用可
//**********************************************************************
procedure THAP000010BaseF.fnTopPanelEnable(bEnable:boolean);
begin
	pnlTop.Enabled	:= bEnable;								// 社員選択ﾊﾟﾈﾙ
	BExit.Enabled	:= bEnable;								// 終了ﾎﾞﾀﾝ
	BPrint.Enabled	:= bEnable								// 印刷ﾎﾞﾀﾝ
					and (Length(HAPPrnDlgInfo)>0)			// 帳票あり
					and m_bPrmPrint							// ロール権限付加
                    and not m_bDrillDown;					// ドリルダウン呼び出し以外 <DRILD>

	BNavi.Enabled	:= bEnable								// DB Navigator
    				and not m_bDrillDown;					// ドリルダウン呼び出し以外 <DRILD>

	if bEnable=False then
	begin

		if InsFlg then
			TBtn.Enabled:=False
		else
			TBtn.Enabled:=True and m_bModify;
	end
	else
		TBtn.Enabled:=True and m_bModify;
end;

//**********************************************************************
//		Proccess	:子AP入力完了後処理
//		Name		:T.Aoki
//		Date		:2000/12/25
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnAfterTabClick;
var
	iRet	: integer;
begin

//---------------------
//	現在社員 表示更新
//---------------------

	try
		//使用不可にして非表示
		HapApIF[ActiveChildPos	].ChildBplAction(HAPAP_ACTID_DISABLE);
		HapApIF[ActiveChildPos	].ChildBplAction(ACTID_HIDESTART);

		//使用可にして表示
		ActiveChildPos	:= svActiveChildPos;				// 入れ替え

		if PAPParent.Enabled then
			HapApIF[ActiveChildPos	].ChildBplAction(HAPAP_ACTID_ENABLE);

		HapApIF[ActiveChildPos		].ChildBplAction(ACTID_SHOWSTART);

		//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
		BNext.Enabled:=
			(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfEnd))and
			(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));

		BBack.Enabled:=
			(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfTop))and
			(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));

		//内容表示
		iRet:=HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SHOWDATA,
														@HapApParam			);
		if iRet<>ACTID_RET_OK then
			Abort;

		if PAPParent.Enabled and not gbExitFromChild then	// ｷｰ押下なし->ﾏｳｽｸﾘｯｸ
		begin
			//入力開始
			EnterFlg:=False;			// 内部にﾌｫｰｶｽが移動する
			iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SETFOCUS_FIRST);
			if iRet<>ACTID_RET_OK then	// 子APﾌｫｰｶｽ取得失敗
				Abort;
		end
		else if not PAPParent.Enabled then
		begin
			if giEmpAttr = 2 then		// フリーコード
				MjsSetFocus(Self,ESEmpNo.Name)
			else
				MjsSetFocus(Self,ENEmpNo.Name);
		end;

	except
		fnTopPanelEnable(TRUE);

		if giEmpAttr = 2 then			// フリーコード
			MjsSetFocus(Self,ESEmpNo.Name)
		else
			MjsSetFocus(Self,ENEmpNo.Name);
	end;

end;

//******************************************************************************
//		Proccess	: 更新ﾎﾞﾀﾝ押下->子AP終了受信後処理
//		Name		: T.Aoki
//		Date		: 01/03/28
//		Parameter	:
//		Return		:
//		History		: 2010/01/16 <JinTan>
//					: 給与ライセンスがあるときのみ支給Gの未登録チェックを行う
//******************************************************************************
procedure THAP000010BaseF.fnAfterUpdateClick;
var
	iRet	: integer;
	p		: THapApIF;

	bCommit	: Boolean;

	dWk		: Double;
begin

	bCommit:=False;

	try
		try
			fnRrefixDateUpd;			// 最終更新日Up
			fnMyNumUpd;					// マイナンバー更新 <MYN>

			if HapCheckModuleLicense(pAppRec, HAP_KYU) then	// <JinTan> 給与ライセンスがあるときのみ支給グループ登録チェックを行う
				fnPayGroupNoCheck;		//<2016-11-22>

//Transaction更新---------------------------------------
			with SYDBModule do
			begin
				if InsFlg then			// 新規登録
				begin

					LSyainCount.Caption:=fnNumEdit(SYDBModule.GetCount,13);
					//Navi用ｸｴﾘ再Open
					NaviQueryOpen;
					//登録した社員まで

					dWk	:= m_iEmpNCode;
					Locate('NCode',dWk,[]);
				end;

				fnTopPanelUpdate;		// 修正内容を反映
										// 子APで変更のある項目のみ
				fnTopBplSelect;			// 先頭頁に戻す

				if not InsFlg then
					Next;				// 次社員読込

// <MYN>
// 社員切替のタイミングでマイナンバー情報の初期化を行うため
// 最終社員で[更新]した時も無条件に処理を実行する
//				if not Eof then
//				begin

				fnTopPanelSet;		// 社員選択部ﾃﾞｰﾀ再表示
									// 内容再表示
				m_iEmpNCode	:= Trunc(GetMosFld('NCode').AsFloat);
				m_iCmnNCode	:= Trunc(GetMosFld('CmnTantoNCD').AsFloat);
				HapApParam.SetEmpNCd(m_iEmpNCode);
				HapApParam.SetCmnNCd(m_iCmnNCode);
				p	:= HapApIF[ActiveChildPos];
				iRet:= p.ChildBplAction(HAPAP_ACTID_SHOWDATA,
										@HapApParam			);
				if iRet<>ACTID_RET_OK then
					Abort;

				iRet:= p.ChildBplAction(HAPAP_ACTID_DISABLE,
										@HapApParam			);

				if iRet<>ACTID_RET_OK then
					Abort;
// <MYN>
//				end;
			end;
			bCommit:=True;

		except
			raise Exception.Create('社員更新 失敗');
		end;

	finally
		//社員Noへ戻る
		SYDBModule.LockOff(bCommit);	// ﾛｯｸ解除

		fnTopPanelEnable(True);

		if giEmpAttr = 2 then			// フリーコード
			MjsSetFocus(Self,ESEmpNo.Name)
		else
			MjsSetFocus(Self,ENEmpNo.Name);
	end;

end;

// <MYN>
//**********************************************************************
//      Process     : 一旦Commit -> 再ロック
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2015/07/08
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnCommitAndLock: Integer;
begin
	Result := ACTID_RET_OK;
	try
		fnRrefixDateUpd;				// 最終更新日Up
		fnMyNumUpd;						// マイナンバー更新

		SYDBModule.LockOff(True);		// Commit
		SYDBModule.LockOn(m_iEmpNCode);	// 再ロック
	except
		Result := ACTID_RET_NG;
	end;
end;

//----------------------------------------------------------------------
//	Constructor
//----------------------------------------------------------------------
//**********************************************************************
//		Component	:Form
//		Event		:Constructor
//		Proccess	:社員選択MAINﾌｫｰﾑ 生成
//		Name		:T.Aoki
//		Date		:00/12/13
//		Parameter	:pRec	:MjsAppRecord
//		Return		:
//		History		:03/10/28(T.Aoki)
//					:起動ﾁｪｯｸ中に[Esc]押下でAPが先に終了してから
//					:Msgが表示されOK押下でMjsDeskTopが終了する不具合
//**********************************************************************
constructor THAP000010BaseF.CreateForm(pRec:pointer; pParam: Pointer=nil);
var
	POwnerForm	: ^TControl;
	sPara		: String;
	I			: Integer;		// <DRILD>

{$IFDEF _HAP_GALILEOPT_}		// <MLX> MLXではプライベートフラグは無視
	mqCtl		: TMQuery;
{$ENDIF}
begin
//変数初期化

	m_iErrorKbn	:= 0;

	//WMDispRun[前]
	bWMDispRunBfr	:= True;

	pAppRec			:= pRec;

	recCommon		:= rcCOMMONAREA(pAppRec^.m_pCommonArea^);
	recSystem		:= rcSYSTEMAREA(pAppRec^.m_pSystemArea^);

	MDBModule		:= TMDataModuleF(TMJSAppRecord(pRec^).m_pDBModule^);
	gbExitFromChild	:= False;
	gbUpdateClick	:= False;

	//ﾊﾟﾗﾒｰﾀ判定
	sPara	:= pAppRec^.m_sParameter;
	if sPara = '' then
		sPara := '0';

	// <DRILD>
	if Assigned(pParam) then	// ドリルダウン用パラメータあり
	begin
		for I := Low(PArrHAPActionParam(pParam)) to High(PArrHAPActionParam(pParam)) do
		begin
			with PArrHAPActionParam(pParam)[I] do
			begin
                case iParamType of
                    HAP_ANOTHER_MENUPARAM	: sPara := sParamStr;				// メニューパラメータ
                    HAP_ANOTHER_EMPNCODE	: m_iDrillEmpNCode := iParamInt;	// 社員内部コード
                end;
			end;
        end;
		m_bDrillDown	:= True;
	end;

	m_iParam	:= StrToInt(sPara);
	arrParam[0]	:= m_iParam div 1000;
	arrParam[1]	:= m_iParam mod 1000;

	//<MLX>
	if m_Series = nil then
		m_Series := TMSeries2.Create;

	arrFuncBar	:= arrFuncBarConst;

	try
		// 速度改善、SYDBModuleにCTLDBを渡すためにトランザクションOPEN
		ddMjsDB	:= MDBModule.CTLDBOpen(1);										// 共通 DB open
	except
		MjsMessageBox(nil, '共通ＤＢのオープンに失敗しました。', mjError, mjDefOk );
		Exit;
	end;

	try
		ddCopDB	:= MDBModule.CopDBOpen(1,TMjsAppRecord(pRec^).m_iCorpID);
	except
		MjsMessageBox(nil,'会社DBのOpenに失敗しました。',mjError,mjDefOK);
		Abort;
	end;

	try
		SYDBModule	:= THapSYDataModuleF.CreateForm(pRec,Self,ddCopDB,ddMjsDB);	// 速度改善、SYDBModuleにCTLDBを渡す
	except
		MDBModule.CopDBClose(ddCopDB);
		MjsMessageBox(nil,'社員選択ﾓｼﾞｭｰﾙの獲得に失敗しました。',mjError,mjDefOK);
		Abort;
	end;

	// マイナンバーモジュール初期化 <MYN>
	if not fnMyNumInit then
	begin
		m_bErrClose := True;
	end;

	// ｵﾌﾞｼﾞｪｸﾄ生成
	if not fnObjectCreate then
	begin
		fnObjectFree;
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('ｵﾌﾞｼﾞｪｸﾄ生成 失敗');
	end;

	HapAPParam.SetRefDay(0,now);		// 基準日指定状態なし <RefDay>
	m_RefEna	:= FALSE;				// 基準日指定可能フラグ初期化 <RefDay>

// 子AP BPL存在確認
	SYDBModule.SetDBInfoToQuery(mqMA);
	SYDBModule.SetDBInfoToQuery(mqKM);
	SYDBModule.SetDBInfoToQuery(mqSY);

	if not fnChildBplExist then			// 子BPL検索
	begin
		fnObjectFree;
		MDBModule.CopDBClose(ddCopDB);
		MjsMessageBox(nil,'この処理は選択できません。',mjError,mjDefOK);
		Abort;
	end;

	MPreview.Init(pAppRec);

{$IFDEF _HAP_GALILEOPT_}				// <MLX> MLXではプライベートフラグは無視
	mqCtl	:= TMQuery.Create(Self);
	try
		MDBModule.SetDBInfoToQuery(ddMjsDB,mqCtl);

		with mqCtl do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT PrivateFlg FROM SYS_MAIN');

				Open;
				if Eof then
					Abort;

				if pAppRec.m_iProgramCode = 10 then
					m_iPrivateFlg	:= GetFld('PrivateFlg').AsInteger
				else
					m_iPrivateFlg	:= 0;
			except
				raise Exception.Create('会社情報 取得失敗');
			end;

		end;
	finally
		mqCtl.Close;
		mqCtl.Free;
	end;
{$ENDIF}

	SYDBModule.SetDBInfoToQuery(mqSC);
	SYDBModule.SetDBInfoToQuery(mqSLK);

// <高速化> 項目・区分情報を親で保持する
	m_arrHAPKM := THAPKM.Create(mqKM,'');
	HapAPParam.SetKMMod(m_arrHAPKM);

	m_arrHAPMN := THAPMN.Create(mqKM,[]);
	HapAPParam.SetMNMod(m_arrHAPMN);

	// <MYN>
	HapAPParam.SetMYNAccess(m_MYN);
	HapAPParam.SetHAPMYNMod(m_HAPMyNum);

//会社情報Open-----------------
	with mqMA do
	begin
		Close;
		with SQL do
		begin
			Clear;
			Add('SELECT'
				+' MasterKbn,'
				+' CodeDigit,'
				+' CodeAttr'		);
			Add('FROM MasterInfo'	);
			Add('WHERE MasterKbn in(25,41)');
		end;

		try
			Open(True);

			if Eof then
				Abort;

			while not EOF do
			begin
				if GetFld('MasterKbn').AsInteger = 25 then
				begin
					giEmpDigit	:= GetFld('CodeDigit').AsInteger;
					giEmpAttr	:= GetFld('CodeAttr').AsInteger;
				end
				else
				begin
					giDeptAttr	:= GetFld('CodeAttr').AsInteger;
				end;

				Next;
			end;
		except
			fnObjectFree;
			SYDBModule.Free;
			MDBModule.CopDBClose(ddCopDB);

			raise Exception.Create('会社情報読込(コード属性)');
		end;

		Close;
		with SQL do
		begin
			Clear;
			Add('SELECT YearKbn FROM DTMAIN');
		end;
		try
			Open(True);

			if Eof then
				Abort;

			m_iRekiKbn := GetFld('YearKbn').AsInteger;
		except
			fnObjectFree;
			SYDBModule.Free;
			MDBModule.CopDBClose(ddCopDB);

			MjsMessageBox(nil,'会社情報取得に失敗しました。',mjError,mjDefOK);
			raise Exception.Create('会社情報読込');
		end;

		Close;
		with SQL do
		begin
			Clear;
			Add('SELECT'			);
			Add('PrintOrder,addin30,addin32,addin33');
			Add('FROM HAPM3');
		end;
		try
			Open(True);
			if Eof then
				Abort;

			m_iPrintOrder	:= GetFld('PrintOrder').AsInteger;
			m_iaddin30		:= GetFld('addin30').AsInteger;
			m_iaddin32		:= GetFld('addin32').AsInteger;
			m_iaddin33		:= GetFld('addin33').AsInteger;
		except
			fnObjectFree;
			SYDBModule.Free;
			MDBModule.CopDBClose(ddCopDB);

			MjsMessageBox(nil,'会社情報取得に失敗しました。',mjError,mjDefOK);
			raise Exception.Create('会社情報読込');
		end;
	end;

	// SyncMasterｸﾗｽの生成 <マスタ同期>
	try
		m_SyncMaster := THapSyncMaster.Create(Self, pAppRec, ddCopDB);
		m_SyncMaster.InitData();
	except
		fnObjectFree;
		SYDBModule.Free;
		MDBModule.CopDBClose(ddCopDB);
		MDBModule.CTLDBClose(ddMjsDB);

		raise Exception.Create('グループ会社情報生成');
	end;

	POwnerForm := pAppRec^.m_pOwnerForm;					// オーナーフォームを取得
	inherited Create(POwnerForm^);							// ﾌｫｰﾑCreate

end;

//----------------------------------------------------------------------
//	Component Event
//----------------------------------------------------------------------
{HAP000010F}
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:社員選択MAINﾌｫｰﾑ 生成時
//		Name		:T.Aoki
//		Date		:00/12/13
//		Parameter	:
//		Return		:
//		History		:04/12/01(T.Aoki)
//					:MjsFontResize()追加
//**********************************************************************
procedure THAP000010BaseF.FormCreate(Sender:TObject);
begin
	try
		fnFormIni;						// ﾌｫｰﾑ初期設定

//アンカーの設定
		BCancel.Anchors		:= [akLeft,akTop];
		BUpdate.Anchors		:= [akLeft,akTop];
		BNext.Anchors		:= [akLeft,akTop];
		BBack.Anchors		:= [akLeft,akTop];

		m_iRatio := MjsFontResize(THAP000010BaseF(Self), Pointer(pAppRec));		// ﾌｫﾝﾄ･ｻｲｽﾞの変更

//アンカーの戻し
		BCancel.Anchors		:= [akRight,akTop];
		BUpdate.Anchors		:= [akRight,akTop];
		BNext.Anchors		:= [akRight,akTop];
		BBack.Anchors		:= [akRight,akTop];

//ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ用ｺﾝﾎﾟｰﾈﾝﾄ動的作成
		PMenu:=SYDBModule.PopUpMenuInit(Self,pnlTop);

//付箋ﾂｰﾙﾊﾞｰ
		TBtn:=SYDBModule.ToolBarInit(Self,PTool,BNavi.Top,BNavi.Left+BNavi.Width);

		fnPrintInfoIni;					// 印刷情報初期処理
		fnChildBplIni;					// 子AP初期処理/初期画面表示

		with SYDBModule do
		begin

// 部門権限管理 SYDBModuleへ絞込条件の引渡し
			m_sBmCd	:= 'SELECT BmCd FROM MV_MAS_STFBMN WHERE TantoNCD = '+IntToStr(recCommon.TantoNCD);

            // <DRILD>
			if m_bDrillDown then
			begin
				SetSQL( '','','','SC.NCode = ' + IntToStr(m_iDrillEmpNCode) + ' AND ((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
			end
			else
			begin
				SetSQL( '','','','((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
			end;

			if GetShowOrder = 0 then
				SetFreeOrder(105801)
			else
				SetFreeOrder(100100);

			if not Eof then
			begin
				fnTopPanelSet;
				m_iEmpNCode	:= Trunc(GetMosFld('NCode').AsFloat);
				m_iCmnNCode	:= Trunc(GetMosFld('CmnTantoNCD').AsFloat);
				HapApParam.SetEmpNCd(m_iEmpNCode);			// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
				HapApParam.SetCmnNCd(Trunc(GetMosFld('CmnTantoNCD').AsFloat));
				HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
			end
			else						//会社新規
			begin
				MTab.Enabled:=False;
				//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
				BNext.Enabled:=False;
				Bback.Enabled:=False;
				fnTopPanelClear;
				SYDBModule.FusenClear;
			end;

			SYDBModule.FusenOnClick :=fnFusenClick;

			HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_DISABLE,@HapApParam);

			LShowOrder.Caption:=GetFreeOrderItem;			// 表示順序
		end;

		MTab.Items.Selected:=arrLoadBplNo[ActiveChildPos];

		EnterFlg:=True;

		if giEmpAttr = 2 then			//フリーコード
			ACCtrl	:=ESEmpNo
		else
			ACCtrl	:=ENEmpNo;			// 初期ﾌｫｰｶｽ位置[社員No]

		if giDeptAttr = 2 then			// フリーコード
		begin
			LDeptNo.Alignment	:= taLeftJustify;
			LDeptNo.Font.Name	:= 'ＭＳ Ｐゴシック'
		end
		else
		begin
			LDeptNo.Alignment	:= taRightJustify;
			LDeptNo.Font.Name	:= 'ＭＳ Ｐ明朝'
		end;

		// <DRILD>
		if m_bDrillDown then	// ドリルダウン呼び出し
		begin
			BPrint.Enabled	:= False;
        	BNavi.Enabled	:= False;

            if giEmpAttr = 2 then
            begin
				// フリーコード
            	with ESEmpNo do
                begin
                	ArrowDisp	:= adNone;
                	ReadOnly	:= True;
                    OnArrowClick:= nil;
                end;
			end
            else
            begin
				// 数値コード
				with ENEmpNo do
                begin
                	ArrowDisp	:= adNone;
                	ReadOnly	:= True;
                    OnArrowClick:= nil;
                end;
            end;
		end;
	except
		m_bErrClose := True;
	end;

	PostMessage(Self.Handle, WM_DISPRUN,0,0);				//メッセージ送信？
end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Proccess	:社員選択MAINﾌｫｰﾑ 表示時
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.FormShow(Sender:TObject);
var
	ApIF	: THapApIF;
begin
	if m_bErrClose then exit;

	ApIF	:= HapApIF[ActiveChildPos];

	//ﾎﾞﾀﾝ
	fnBtnVisible(True);
	ApIF.ChildBplAction(ACTID_SHOWSTART);

	try
		if MPreview.isPreview then
			MPreview.Show
		else
		begin
			if EnterFlg then			// 自分自身のﾌｫｰｶｽ復帰を流す
				MjsSetFocus(Self,ACCtrl.Name)
			else						// 子APにﾌｫｰｶｽ復帰を通知
				ApIF.ChildBplAction(HAPAP_ACTID_SETFOCUS);
		end;
	except			//念のため?AP終了できなくなるとまずいので社員Noに戻す
		fnTopPanelEnable(True);

		if giEmpAttr = 2 then			//フリーコード
			MjsSetFocus(Self,ESEmpNo.Name)
		else
			MjsSetFocus(Self,ENEmpNo.Name);
	end;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Hide
//		Proccess	:社員選択MAINﾌｫｰﾑ 非表示時
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.FormHide(Sender: TObject);
begin
	if m_bErrClose then exit;

	//子APに非表示送信
	HapApIF[ActiveChildPos].ChildBplAction(ACTID_HIDESTART);
	//自分自身のﾎﾞﾀﾝ

//	MjsBtnVisibleだとﾌｫｰﾑ上の全ﾎﾞﾀﾝが対象になるので自前
	fnBtnVisible(False);

	if MPreview.isPreview then
		MPreview.Hide;

end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Proccess	:社員選択MAINﾌｫｰﾑ 終了確認
//		Name		:T.Aoki
//		Date		:00/12/13
//		Parameter	:
//		Return		:
//		History		:03/10/28(T.Aoki)
//					:起動ﾁｪｯｸ中に[Esc]押下でAPが先に終了してから
//					:Msgが表示されOK押下でMjsDeskTopが終了する不具合
//**********************************************************************
procedure THAP000010BaseF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
	rcMsg	: TMjsMsgRec;
begin
	//WMDispRun[前]?
	if bWMDispRunBfr then
	begin
		CanClose:=False;
		Exit;
	end;

	if MPreview.IsPreView then
	begin
		GetMsg(rcMsg,30,3);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,sMsg,sTitle,icontype,btntype,btnDef,LogType);
		end;
		CanClose := FALSE;				// 終了不可
	end
	else if not BExit.Enabled then
	begin
		GetMsg(rcMsg,120,4);
		with rcMsg do
			MjsMessageBoxEx(Self,'社員入力'+sMsg,sTitle,icontype,btntype,btnDef,LogType);

		CanClose:=False;
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Close
//		Proccess	:社員選択MAINﾌｫｰﾑ 終了時
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2002/09/10(T.Aoki)
//					:Close前にHide状態にする
//**********************************************************************
procedure THAP000010BaseF.FormClose(Sender:TObject; var Action: TCloseAction);
var
	AppPrm		: TAppParam;
	Dlg			: THAPSyncMasterIF;
	aryIDs		: array[0..0] of Integer;
begin

	if m_SyncMaster.IsGroup() then
	begin
		if((m_bPrmAppend) or								// 追加権限あり
		   (m_bPrmModify) or								// 修正権限あり
		   (m_bPrmDelete)) and								// 削除権限あり
		   (m_SyncMaster.m_CEComKbn5 = 0) and
		   (m_SyncMaster.m_PEComKbn5 = 0) then				// 表示のみでなくて翌期更新済みでもない場合
		begin
			Dlg := THAPSyncMasterIF.Create(Self, pAppRec);	// 初期処理

			try
				aryIDs[0] := 32;
				Dlg.ShowDlg(aryIDs);	// 配信ﾀﾞｲｱﾛｸﾞ呼び出し

			finally
				Dlg.Free;				// 破棄
			end;
		end;
	end;

	m_SyncMaster.fnSyncTerm();

	Self.Hide;

	Action	:= caFree;										// ﾒﾓﾘを解放する
	pAppRec^.m_iDelete	:= 1;

	AppPrm.iAction		:= ACTID_FORMCLOSEEND;
	AppPrm.pRecord		:= Pointer(pAppRec);
	AppPrm.pActionParam	:= nil;

	TMjsAppRecord(pAppRec^).m_pOwnerEntry(@AppPrm);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Proccess	:社員選択MAINﾌｫｰﾑ 破棄時
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.FormDestroy(Sender:TObject);
var
	j		: Integer;
	// <MYN>
	iRet	: Integer;
	rcMsg	: TMjsMsgRec;
begin
	//<MLX>
	if m_Series <> nil then
		m_Series.Free;

	if Assigned(SYDBModule) then
	begin
		SYDBModule.PopUpMenuTerm;
		SYDBModule.ToolBarTerm;
	end;

	if Assigned(MPreview) then
	begin
		MPreview.Term;
	end;

	for j:=Length(arrChildInfo)-1 downto 0 do
		fnChildUnLoad(j);

	fnObjectFree;

	// <MYN>
	if Assigned(m_MYN) then
	begin
		iRet := m_MYN.Term;

		if iRet <> MYNACCESS_SUCCESS then
		begin
			{ メッセージ表示のみで処理は継続する }
			GetMsg(rcMsg, 900, 4);	// マイナンバーシステムの切断に失敗しました。
			MjsMessageBoxEx(Self,
							rcMsg.sMsg + '(' + IntToStr(iRet) + ')',
							rcMsg.sTitle,
							rcMsg.icontype,
							rcMsg.btntype,
							rcMsg.btnDef,
							rcMsg.LogType);
		end;

		m_MYN.Free;
	end;
	m_HAPMyNum.Free;

	SYDBModule.Free;					// 社員選択ﾓｼﾞｭｰﾙ解放
	MDBModule.CopDBClose(ddCopDB);		// 会社DB Close
	MDBModule.CTLDBClose(ddMjsDB);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Activate
//		Proccess	:社員選択MAINﾌｫｰﾑ ｱｸﾃｨﾌﾞ時
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.FormActivate(Sender:TObject);
begin
	HapSendToOwner(ACTID_ACTIVEEND,pAppRec);				// Active完了を送信
end;

//**********************************************************************
//		Proccess	:終端ｷｰ判定
//		Name		:T.Aoki
//		Date		:2000/12/11
//		Parameter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	ACtl	: TWinControl;
	pKey	: ^Word;

	KBState	: TKeyBoardState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MjsKeyDataToShiftState(0);
	ACtl	:= Screen.ActiveControl;
	pKey	:= @Msg.CharCode;

//----------------------
//	底部のﾎﾞﾀﾝSTART
//----------------------
	if(ACtl=BCancel)then				// 取消
	begin
		case pKey^ of
			VK_TAB:
			begin
				if sShift<>[ssShift] then
				begin
					pKey^:=0;
					Abort;
				end;
			end;
			VK_DOWN,					// ↓
			VK_RIGHT:					// →
			begin
				pKey^:=0;
				Abort;
			end;
		end;
	end;

	if(ACtl=BBack)or										// 前へ
	  ((ACtl=BNext)and((BBack.Enabled)<>True))or			// 次へで前へ使用不可
	  ((ACtl=BUpdate)and((BBack.Enabled)or(BNext.Enabled)<>True))then			// 更新で次へも前へも使用不可
	begin
		case pKey^ of
			VK_TAB:
			begin
				if sShift=[ssShift]then
				begin
					HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SETFOCUS_LAST,
															@HapApParam	);
					pKey^:=0;
					Abort;
				end;
			end;
			VK_LEFT,
			VK_UP:
			begin
				HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SETFOCUS_LAST,
														@HapApParam	);
				pKey^:=0;
				Abort;
			end;
		end;
	end;
//----------------------
//	底部のﾎﾞﾀﾝEND
//----------------------


//----------------------
//	[Shift]+[TAB]
//----------------------

	if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
	begin
		Msg.CharCode:=0;
		MjsPrevCtrl(Self);
		Abort;
	end;


//----------------------------------------
//	社員No
//	CodeAttr= 0 or 1
//	数値属性の場合
//----------------------------------------
	if ACtl=ENEmpNo then
	begin
		case Msg.CharCode of
			VK_TAB,VK_RETURN:
			begin
				fnEmpEnter(ACtl);		// 社員選択
				Msg.CharCode:=0;
				Abort;
			end;

			VK_PRIOR,					// 前社員
			VK_NEXT:					// 次社員
			begin
				with SYDBModule do
				begin
					if Msg.CharCode=VK_PRIOR then
						Prior
					else
						Next;

					if(not Bof)or(not Eof)then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(GetMosFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(GetMosFld('CmnTantoNCD').AsFloat));
						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;
				end;
				ENEmpNo.SelectAll;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_ESCAPE:
			begin
				Self.Close;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_HOME:
			begin
				if sShift=[ssCtrl] then	//[Ctrl]+[Home]->先頭社員へ
				begin
					SYDBModule.First;

					if SYDBModule.GetFld('GCode').AsString<>'' then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;
					ENEmpNo.SelectAll;
					Msg.CharCode:=0;
					Abort;
				end;
			end;

			VK_END:
			begin
				if sShift=[ssCtrl] then	//[Ctrl]+[End]->最終社員へ
				begin
					SYDBModule.Last;
					if SYDBModule.GetFld('GCode').AsString<>'' then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));

						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;
					ENEmpNo.SelectAll;
					Msg.CharCode:=0;
					Abort;
				end;

				Close;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_F12:
				if sShift=[ssCtrl,ssShift] then				// [Ctrl]+[Shift]+[F12]->削除担当者復旧ﾓｰﾄﾞ
				begin

{$IFDEF _HAP_GALILEOPT_}			// <MLX>では担当者復旧なし
					// 共通情報登録以外
					if (arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId=100000)
                    and (not m_bDrillDown)				// ドリルダウン呼び出しの時は担当者復旧無効 <DRILD>
					and (m_bModify) then				// 登録系追加修正権限
					begin
						//削除担当者復旧
						if fnNewEmpDate(1) = False then
						begin
							Msg.CharCode:=0;
							Abort;
						end;

						//社員がNaviﾃﾞｰﾀｾｯﾄ内に存在しない
						if not SYDBModule.Locate(sEmpNo) then
						begin
							Beep;

							MjsMessageBox(	Self,
											'選択した社員コードは処理できません。',
											mjWarning,
											mjdefOK		);

							Exit;
						end;

						if SYDBModule.GetFld('GCode').AsString<>'' then
						begin
							fnTopPanelSet;
							HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
							HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));

							HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
						end;
						ENEmpNo.SelectAll;
						Msg.CharCode:=0;
						Abort;
					end;
{$ENDIF}
				end;

		end;
	end;

//----------------------------------------
//	社員No
//	CodeAttr= 2
//	文字属性の場合
//----------------------------------------
	if ACtl=ESEmpNo then
	begin
		case Msg.CharCode of
			VK_TAB,VK_RETURN:
			begin
				fnEmpEnter(ACtl);		// 社員選択
				Msg.CharCode:=0;
				Abort;
			end;

			VK_PRIOR,					// 前社員
			VK_NEXT:					// 次社員
			begin
				with SYDBModule do
				begin
					if Msg.CharCode=VK_PRIOR then
						Prior
					else
						Next;

					if(not Bof)or(not Eof)then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(GetMosFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(GetMosFld('CmnTantoNCD').AsFloat));
						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;
				end;
				ESEmpNo.SelectAll;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_ESCAPE:
			begin
				Self.Close;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_HOME:
			begin
				if sShift=[ssCtrl] then	// [Ctrl]+[Home]->先頭社員へ
				begin
					SYDBModule.First;

					if SYDBModule.GetFld('GCode').AsString<>'' then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;

					ESEmpNo.SelectAll;
					Msg.CharCode:=0;
					Abort;
				end;
			end;

			VK_END:
			begin
				if sShift=[ssCtrl] then	//[Ctrl]+[End]->最終社員へ
				begin
					SYDBModule.Last;
					if SYDBModule.GetFld('GCode').AsString<>'' then
					begin
						fnTopPanelSet;
						HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
						HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));

						HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
					end;
					ESEmpNo.SelectAll;
					Msg.CharCode:=0;
					Abort;
				end;

				Close;
				Msg.CharCode:=0;
				Abort;
			end;

			VK_F12:
				if sShift=[ssCtrl,ssShift] then				// [Ctrl]+[Shift]+[F12]->削除担当者復旧ﾓｰﾄﾞ
				begin
{$IFDEF _HAP_GALILEOPT_}			// <MLX>では担当者復旧なし

					// 共通情報登録以外
					if (arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId=100000)
                    and (not m_bDrillDown)									//ドリルダウン呼び出しの時は担当者復旧無効 <DRILD>
					and (m_bModify) then									//登録系追加修正権限
					begin
						//削除担当者復旧
						if fnNewEmpDate(1) = False then
						begin
							Msg.CharCode:=0;
							Abort;
						end;

						//社員がNaviﾃﾞｰﾀｾｯﾄ内に存在しない
						if not SYDBModule.Locate(sEmpNo) then
						begin
							Beep;

							MjsMessageBox(	Self,
											'選択した社員コードは処理できません。',
											mjWarning,
											mjdefOK		);

							Exit;
						end;

						if SYDBModule.GetFld('GCode').AsString<>'' then
						begin
							fnTopPanelSet;
							HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
							HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));

							HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
						end;
						ENEmpNo.SelectAll;
						Msg.CharCode:=0;
						Abort;
					end;
{$ENDIF}
				end;

		end;

		//削除
			GetkeyBoardState( KBState );
			if ((KBState[VK_CONTROL] and $80)<>0)and((KBState[VK_F11] and $80)<>0)
			and ((KBState[VK_SHIFT] and $80)<>0)then
			begin
				fnCallDelDlg;
				Exit;
			end;
//<Key> ED	-------------

		{以下ｷｬﾚｯﾄ位置判定}
		if MjsChkCurTop(ACtl) and (Msg.CharCode = VK_LEFT) and (sShift = []) then
		begin
			Msg.CharCode	:= 0;
			MjsPrevCtrl(Self);
			Exit;
		end;

		if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
		begin
			Msg.CharCode := 0;
			MjsNextCtrl(Self);
			Exit;
		end;
	end;
//----------------------
//	[TAB]
//----------------------

	if (Msg.CharCode = VK_TAB) and (sShift = []) then
	begin
		Msg.CharCode:=0;
		MjsNextCtrl(Self);
		Abort;
	end;


	if(Msg.CharCode=VK_ESCAPE)or
	  (Msg.CharCode=VK_END)then
	begin
//
	end;


//-----------------------------------
//	ｸﾞﾘｯﾄﾞ系無視
//-----------------------------------
	if ACtl is TSelectStrGrid then
	begin
		case pKey^ of
			VK_TAB:
			begin
				if sShift<>[ssShift] then
					MjsNextCtrl(Self)
				else
					MjsPrevCtrl(Self);
				pKey^:=0;
				Abort;
			end;
		end;
		Exit;

	end;
	if ACtl is TListBox then
	begin
		case pKey^ of
			VK_TAB:
			begin
				if sShift<>[ssShift] then
					MjsNextCtrl(Self)
				else
					MjsPrevCtrl(Self);
				pKey^:=0;
				Abort;
			end;
		end;
		Exit;
	end;

	if ACtl is TMBitBtn then
	begin
		if Msg.CharCode = VK_RETURN then
			Exit;
	end;

	if ACtl is TMTab then				// ﾀﾌﾞ
	begin
		case pKey^ of
			VK_RETURN:
			begin
				MjsNextCtrl(Self);
			end;
			VK_RIGHT,VK_LEFT:
			begin
				gbExitFromChild:=True;
			end;
		end;
		Exit;
	end;


	if not(ACtl is TCustomEdit) then	// 文字入力除く
	begin
		case Msg.CharCode of
			VK_RETURN, VK_RIGHT, VK_DOWN:
			begin
				if sShift = [] then
				begin
					Msg.CharCode:=0;
					MjsNextCtrl(Self);
					Abort
				end;
			end;

			VK_LEFT, VK_UP:
			begin
				if sShift = [] then
				begin
					Msg.CharCode:=0;
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;

			VK_ESCAPE, VK_END:
			begin
				Exit;
			end;
		end;
	end;

	if ACtl is TWinControl then
	begin
		case Msg.CharCode of
			VK_TAB:
				Exit;

			VK_RETURN, VK_DOWN:
				if sShift = [] Then
				begin
					Msg.CharCode	:= VK_RETURN;
					MjsNextCtrl(Self);
					Abort;
//Exitだと更新ﾎﾞﾀﾝへ移動したときそのまま押下状態になる
//					Exit;
				end;

			VK_UP:
				if sShift = [] then
				begin
					Msg.CharCode	:= VK_RETURN;
					MjsPrevCtrl(Self);
					Exit;
				end;
		end;

		if ACtl is TCustomEdit then
		begin
			{NumEditはｷｬﾚｯﾄ位置判定不要}
			if(ACtl is TMDateEdit)or
			  (ACtl is TMNumEdit)then
			begin
				if(Msg.CharCode = VK_LEFT) and (sShift = []) then
				begin
					Msg.CharCode	:= 0;
					MjsPrevCtrl(Self);
					Exit;
				end;
				if(Msg.CharCode = VK_RIGHT) and (sShift = []) then
				begin
					Msg.CharCode	:= 0;
					MjsNextCtrl(Self);
					Exit;
				end;
			end;
			{NumEdit End}

			{以下ｷｬﾚｯﾄ位置判定}
			if MjsChkCurTop(ACtl) and (Msg.CharCode = VK_LEFT) and (sShift = []) then
			begin
				Msg.CharCode	:= 0;
				MjsPrevCtrl(Self);
				Exit;
			end;

			if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl(Self);
				Exit;
			end;

			Exit;				//入力途中は抜けない
		end;
	end;

	inherited;

end;

{Components}
//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ取得
//		Name		:T.Aoki
//		Date		:2000/12/15
//		Parameter	:
//		Return		:
//		History		:2002/09/10(T.Aoki)
//					:2回目の切出以降ﾌｧﾝｸｼｮﾝが表示されない不具合修正
//**********************************************************************
procedure THAP000010BaseF.fnWCTLEnter(Sender:TObject);
begin
	ACCtrl:=Screen.ActiveControl;

	//次/前/更新/取消
	if(ACCtrl is TMBitBtn)or
	  (ACCtrl is TMTab) then
	begin
		if PAPParent.Enabled then
		begin
			FuncBar.CopyFuncData(arrFuncBar00);
		end
		else
		begin

			if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then	// 現在共通情報
			begin
				if not m_bModify then											// 登録系追加修正権限
				begin
					arrFuncBar[5]	:= 'F6 社員コピー,0';
					arrFuncBar[6]	:= 'F7 社員No変更,0';
					arrFuncBar[7]	:= 'F8 社員削除,0';
				end
				else if not m_bPrmDelete then									// 削除権限
				begin
					arrFuncBar[5]	:= 'F6 社員コピー';
					arrFuncBar[6]	:= 'F7 社員No変更';
					arrFuncBar[7]	:= 'F8 社員削除,0';
				end
				else
				begin
					arrFuncBar[5]	:= 'F6 社員コピー';
					arrFuncBar[6]	:= 'F7 社員No変更';
					arrFuncBar[7]	:= 'F8 社員削除';
				end;
			end;

			// <MYN>
			if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 現在基本情報
			begin
				if m_bUsePGChgDlg then											// 支給グループ変更ダイアログ使用
				begin
					if not m_bModify or											// 登録系追加修正権限
						(m_MYN.AccType = MYNACCESS_TYPE_NONE) then				// 個人番号権限なし（初期処理後のエラー対応）
					begin
						arrFuncBar[5]	:= '';
						arrFuncBar[6]	:= '';
						arrFuncBar[7]	:= 'F8 支給G変更,0';
					end
					else
					begin
						arrFuncBar[5]	:= '';
						arrFuncBar[6]	:= '';
						arrFuncBar[7]	:= 'F8 支給G変更';
					end;
				end;
			end;

			FuncBar.CopyFuncData(arrFuncBar);
		end;
	end;

	EnterFlg:=True;

	if (ACCtrl=ENEmpNo)
	or (ACCtrl=ESEmpNo) then
		EEmpNoEnter(Sender);

	//[↓]ﾎﾞﾀﾝ
	if giEmpAttr = 2 then	//フリーコード
		BEnter.Enabled:=(ACCtrl=ESEmpNo) or not PAPParent.Enabled
	else
		BEnter.Enabled:=(ACCtrl=ENEmpNo) or not PAPParent.Enabled;

// 更新権限がない場合は、登録部に処理を移動することはできない
	//[↓]ﾎﾞﾀﾝ
	BEnter.Enabled	:= m_bModify;												// 登録系追加修正権限

// <RefDay> S
	if HapApParam.GetRefType > 0 then	// 基準日指定中
		BEnter.Enabled	:= FALSE;
// <RefDay> E

end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ消失
//		Name		:T.Aoki
//		Date		:2000/12/15
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnWCTLExit(Sender:TObject);
begin

	//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
	if not HapActiveControlOnForm(Self) then
		Exit;		//以下不要

end;

//**********************************************************************
//		Component	:btnExit
//		Event		:Click
//		Proccess	:終了ﾎﾞﾀﾝ押下
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BExitClick(Sender:TObject);
begin
	Close;
end;

//**********************************************************************
//		Component	:btnChange
//		Event		:Click
//		Proccess	:切出/埋込ﾎﾞﾀﾝ押下
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BChangeClick(Sender:TObject);
var
	iAction	: Integer;
begin
	EnterFlg:=HapActiveControlOnForm(Self);

	if BChange.Caption = '切出(&G)' then
	begin
		BChange.Caption := '埋込(&G)';
		iAction := ACTID_DOCKINGOUTEND;
	end
	else
	begin
		BChange.Caption := '切出(&G)';
		iAction := ACTID_DOCKINGINEND;
	end;

	HapSendToOwner(iAction,pAppRec);	// SystemMenuに完了通知
	PostMessage(Self.Handle,WM_SETFOCUS,0,0);
end;

//**********************************************************************
//		Component	:FuncBar
//		Event		:Click
//		Proccess	:ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.FuncBarFunctionClick(Sender: TObject; FuncNo: Integer);
var
	arrFlg	: array[1..8] of boolean;
begin
	if pnlTop.Enabled then				// 子APｱｸﾃｨﾌﾞでない
	begin
		//<KEY> ST-------------------------
		if (ACCtrl <> ESEmpNo) and (ACCtrl <> ENEmpNo)
		and (ACCtrl <> MTab) then							// TABでもファンクションを有効にする
			Exit;

		case FuncNo of
			1,
			2,
			3,
			7,
			8:
			begin
				with FuncBar do
				begin
					GetFuncEnabledA(arrFlg);
					case FuncNo of
						1:	if not arrFlg[1]then	exit;
						2:	if not arrFlg[2]then	exit;
						3:	if not arrFlg[3]then	exit;
						7:	if not arrFlg[7]then	exit;
						8:	if not arrFlg[8]then	exit;
					end;
				end;
			end;
		end;

		case FuncNo of
			1:	ChangeOrder;			// 表示順変更
			2:	fnCallSelDlg;			// 処理選択
			3:  fnReferDay;				// 基準日指定		//<RefDay>
			6:	fnCallCopyDlg;			// 社員コピー
			7:	fnCallChgDlg;			// 社員No変更
			8:
			begin
				// <MYN> 共通情報／基本情報で異なるファンクション呼び出し
				if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報
				begin
					fnCallDelDlg;			// 社員削除
				end
				else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 基本情報
				begin
					fnCallPGChgDlg;			// 支給グループ変更
				end;
			end;
		end;

		//<KEY> ED-------------------------

		Exit;	//子へ通知不要
	end;

	HapApParam.SetFuncNo(FuncNo);		// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
	HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_FBARCLICK,@HapApParam);	// 通知
end;

//**********************************************************************
//		Component	: 基準日ラベル
//		Event		: OnClick
//		History		: <RefDay>
//**********************************************************************
procedure THAP000010BaseF.LRefDateClick(Sender: TObject);
begin
	if HapApParam.GetRefType = 1 then	// 基準日指定の時
	begin
		fnReferDay(2);					// 現在参照モードへ
	end
	else
	begin
		fnReferDay(1);					// 基準日指定モードへ
	end
end;

//**********************************************************************
//		Component	:処理ﾎﾞﾀﾝ
//		Event		:Click
//		Proccess	:処理ﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnToolBtnClick(Sender:TObject);
begin
//子が処理するﾎﾞﾀﾝは子ﾌｫｰﾑ側に持つ
//(Ownerは子/Parentは親の処理ﾎﾞﾀﾝﾊﾟﾈﾙ)
//
end;

//**********************************************************************
//		Component	:EEmpNo
//		Event		:Enter
//		Proccess	:社員Noﾌｫｰｶｽ取得
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2002/09/10(T.Aoki)
//					:2回目の切出以降ﾌｧﾝｸｼｮﾝが表示されない不具合修正
//**********************************************************************
procedure THAP000010BaseF.EEmpNoEnter(Sender:TObject);
begin
	if m_bErrClose then exit;

	fnTabEnable(False);					// 処理選択ﾊﾞｰ使用不可

	//子AP選択あり
	if(Length(arrChildInfo)>1)and(arrParam[0]<>3)and(arrParam[0]<>4)then		// 教育研修・賞罰はF2なし
		arrFuncBar[1]:='F2 処理選択'
	else
		arrFuncBar[1]:='';

// <RefDay> S
	if HapApParam.GetRefType > 0 then	// 基準日指定中
		arrFuncBar[2]	:= 'F3 基準日解除'
	else
	begin
		if m_RefEna then				// 基準日指定可能
			arrFuncBar[2]	:= 'F3 基準日指定'
		else
			arrFuncBar[2]	:= '';
	end;
// <RefDay> E

//<FUNCTION_HIDE>

// 共通情報タブ以外では、『社員No変更』『社員削除』は行なえない
	if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then			// 共通情報の時
	begin
		if not m_bModify then													// 登録系追加修正権限
		begin
			arrFuncBar[5]	:= 'F6 社員コピー,0';
			arrFuncBar[6]	:= 'F7 社員No変更,0';
			arrFuncBar[7]	:= 'F8 社員削除,0';
		end
		else if not m_bPrmDelete then											// 削除権限
		begin
			arrFuncBar[5]	:= 'F6 社員コピー';
			arrFuncBar[6]	:= 'F7 社員No変更';
			arrFuncBar[7]	:= 'F8 社員削除,0';
		end
		else
		begin
			arrFuncBar[5]	:= 'F6 社員コピー';
			arrFuncBar[6]	:= 'F7 社員No変更';
			arrFuncBar[7]	:= 'F8 社員削除';
		end;
	end
	// <MYN>
	else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then		// 基本情報の時
	begin
		if m_bUsePGChgDlg then													// 支給グループ変更ダイアログ使用
		begin
			if not m_bModify or													// 登録系追加修正権限
				(m_MYN.AccType = MYNACCESS_TYPE_NONE) then						// 個人番号権限なし（初期処理後のエラー対応）
			begin
				arrFuncBar[5]	:= '';
				arrFuncBar[6]	:= '';
				arrFuncBar[7]	:= 'F8 支給G変更,0';
			end
			else
			begin
				arrFuncBar[5]	:= '';
				arrFuncBar[6]	:= '';
				arrFuncBar[7]	:= 'F8 支給G変更';
			end;
		end
		else
		begin
			arrFuncBar[5]	:= '';
			arrFuncBar[6]	:= '';
			arrFuncBar[7]	:= '';
		end;
	end
	else
	begin
		arrFuncBar[5]	:= '';
		arrFuncBar[6]	:= '';
		arrFuncBar[7]	:= '';
	end;

	FuncBar.CopyFuncData(arrFuncBar);
end;

//**********************************************************************
//		Component	:EEmpNo
//		Event		:ArrowClick
//		Proccess	:社員No[...]ﾎﾞﾀﾝ Click
//		Name		:T.Aoki
//		Date		:2000/12/22
//		Parameter	:
//		Return		:
//		History		: <CSTM> Y.Kondo
//					: 社員検索エクスプローラー拡張機能追加
//**********************************************************************
procedure THAP000010BaseF.EEmpNoArrowClick(Sender: TObject);
begin
	if HapSYExpIF.Init(Self,pAppRec)=-1 then				// 初期処理
		Exit;

// 社員検索エクスプローラー、部門権限管理絞込み追加
// 共通系も部門権限管理を行う

	if HapApParam.GetRefType > 0 then						// 基準日社員絞り込み
	begin
		HapSYExpParam.SetSQL('','','JOIN HAPSY SY ON (SC.CorpNCode=SY.CorpNCode AND SC.NCode=SY.EmpNCode)',
							'((CHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(CHG.DeptNCode,0) = 0))'
							+' AND ((SY.Nyuusha <= ' + FormatDateTime('yyyymmdd',HapApParam.GetRefDate)+') or (SY.Nyuusha IS NULL))');
	end
	else
	begin
		HapSYExpParam.SetSQL('','','','((CHG.DeptNCode in (' +m_sBmCd+ ')) or (ISNULL(CHG.DeptNCode,0) = 0))');
	end;

// 社員検索エクスプローラー 在職チェックボックスデフォルト指定<CSTM>
	HapSYExpParam.SetDefZaiCheck();		// 規定設定を読む場合引数なし

	HapSYExpIF.DoDlg(HapSYExpParam);						// 呼び出し
	HapSYExpIF.Term;										// 終了処理

	if HapSYExpParam.ExpResult<>mrOK then					// 未選択
		Exit;

	sEmpNo:=HapSYExpParam.ExpRetCode;						// 社員No取得(ﾏｽﾀ格納形式)

	if giEmpAttr = 2 then				// フリーコード
		ESEmpNo.Text	:= sEmpNo
	else
		ENEmpNo.Value	:= StrToInt64(sEmpNo);

	fnEmpEnter(Sender);					// 社員選択
end;

//**********************************************************************
//		Component	:DBNavigatr
//		Event		:Click
//		Process		:DBNaviﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/20
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BNaviClick(Sender: TObject; Button: TMNavigateBtn);
begin
	HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));
	HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
	fnTopPanelSet;
	HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);

	if giEmpAttr = 2 then				// フリーコード
		ESEmpNo.SelectAll
	else
		ENEmpNo.SelectAll;
end;


//***********************************************************************
//		Compoenent	:BUpdate
//		Event		:Click
//		Proccess	:取消ﾎﾞﾀﾝ押下
//		Name		:T.Aoki
//		Date		:01/03/27
//		Parameter	:
//		Return		:
//		History		:99/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
procedure THAP000010BaseF.BUpdateClick(Sender: TObject);
begin
	FuncBar.CopyFuncData(arrFuncBar00);

	gbUpdateClick:=True;				// 更新/次/前の押下区別
										// Focus取得で判定するとｼｮｰﾄｶｯﾄｷｰで不具合

	//前面の子APへ終了(更新)通知
	HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_EXIT,@HapApParam);

	{結果はfnAfterUpdateClickに帰る}
end;

//***********************************************************************
//		Compoenent	:BCancel
//		Event		:Click
//		Proccess	:取消ﾎﾞﾀﾝ押下
//		Name		:T.Aoki
//		Date		:01/03/27
//		Parameter	:
//		Return		:
//		History		:02/09/24(T.Aoki)
//					:2重にTransaction終了していたのを修正
//***********************************************************************
procedure THAP000010BaseF.BCancelClick(Sender: TObject);
var
	rcMsg	: TMjsMsgRec;
	Ret		: Word;
begin

	FuncBar.CopyFuncData(arrFuncBar00);

	GetMsg(rcMsg,110,1);				// ｷｬﾝｾﾙ用ﾒｯｾｰｼﾞ取得
	with rcMsg do
	begin
		Ret:=MjsMessageBoxEx(	Self,
								sMsg,
								sTitle,
								icontype,
								btntype,
								btnDef,
								LogType		);

		if Ret<>mrYes then
		begin
			Exit;						// 以下不要なので抜ける
		end;
	end;

	try

		SYDBModule.LockOff(False);		// ﾛｯｸ解除
		SYDBModule.NaviQueryOpen;		// 再取得

		with SYDBModule do
		begin

			if InsFlg then				// 新規登録
			begin
				if(GetCount>0) then
				begin
					sEmpNo:=GetFld('GCode').AsString;
					if Locate(sEmpNo) then
						fnTopPanelSet
					else
						fnTopPanelClear;
				end
				else
				begin
					MTab.Enabled:=False;
					//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
					BNext.Enabled:=False;
					Bback.Enabled:=False;

					fnTopPanelClear;

					InsFlg	:= FALSE;
				end;
			end
			else						// 更新
			begin
				if Locate(sEmpNo) then
					fnTopPanelSet
				else
					fnTopPanelClear;
			end;

			if not Eof then
			begin
				HapApParam.SetEmpNCd(Trunc(GetFld('NCode').AsFloat));
				HapApParam.SetCmnNCd(Trunc(GetMosFld('CmnTantoNCD').AsFloat));
			end;

		end;
		fnTopBplSelect;					// 先頭ﾀﾌﾞ選択/内容再表示

	finally
		fnTopPanelEnable(True);			// 選択部使用可

		if giEmpAttr = 2 then			// フリーコード
			MjsSetFocus(Self,ESEmpNo.Name)					// 社員Noへﾌｫｰｶｽ
		else
			MjsSetFocus(Self,ENEmpNo.Name);
	end;
end;

//**********************************************************************
//		Component	:BNext
//		Event		:Click
//		Proccess	:次へﾎﾞﾀﾝｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:01/03/27
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BNextClick(Sender: TObject);
begin
	if PAPParent.Enabled then
	begin
		FuncBar.CopyFuncData(arrFuncBar00);
	end
	else
	begin
		FuncBar.CopyFuncData(arrFuncBar);
	end;

//一応ｶﾞｰﾄﾞ(実際はﾎﾞﾀﾝ使用不可)
	if arrLoadBplNo[ActiveChildPos]=fnChildBplFind(cfNext) then
		Exit;

	MTab.Items.Selected:=fnChildBplFind(cfNext);			// 次ﾀﾌﾞｸﾘｯｸ
end;

//**********************************************************************
//		Component	:BBack
//		Event		:Click
//		Proccess	:前へﾎﾞﾀﾝｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:01/03/27
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BBackClick(Sender: TObject);
begin
	if PAPParent.Enabled then
	begin
		FuncBar.CopyFuncData(arrFuncBar00);
	end
	else
	begin
		if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報の時
		begin
			if not m_bModify then												// 登録系追加修正権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー,0';
				arrFuncBar[6]	:= 'F7 社員No変更,0';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else if not m_bPrmDelete then										// 削除権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除';
			end;
		end;

		// <MYN>
		if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then		// 基本情報の時
		begin
			if m_bUsePGChgDlg then												// 支給グループ変更ダイアログ使用
			begin
				if not m_bModify or												// 登録系追加修正権限
					(m_MYN.AccType = MYNACCESS_TYPE_NONE) then					// 個人番号権限なし（初期処理後のエラー対応）
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更,0';
				end
				else
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更';
				end;
			end;
		end;

		FuncBar.CopyFuncData(arrFuncBar);
	end;

//一応ｶﾞｰﾄﾞ(実際はﾎﾞﾀﾝ使用不可)
	if arrLoadBplNo[ActiveChildPos]=fnChildBplFind(cfPrev) then
		Exit;

	MTab.Items.Selected:=fnChildBplFind(cfPrev);			// 前ﾀﾌﾞｸﾘｯｸ
end;


//----------------------------------------------------------------------
//	Detail
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:ﾌｫｰﾑ初期設定
//		Name		:T.Aoki
//		Date		:2000/12/13
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnFormIni;
var
	i,j			: Integer;

	recMsg		: TMjsMsgRec;
	sMessage	: String;
begin

//1度設定したらﾌｫｰﾑが破棄するまで保持するﾌﾟﾛﾊﾟﾃｨを設定
//画面初期設定

	Position			:= poDefaultPosOnly;				// 切出時の位置
	Parent				:= TMPanel(pAppRec^.m_pOwnerPanel^);// 埋込時の貼付先
	BorderStyle			:= bsNone;							// 境界(埋込で起動されるので[なし])
	Align				:= alClient;						// 貼付先ﾊﾟﾈﾙ一杯に広がる
	BChange.Caption		:= '切出(&G)';						// 変更先をｷｬﾌﾟｼｮﾝ表示
	ClientHeight		:= 622;								// ﾌｫｰﾑ高
	ClientWidth			:= 945;								// ﾌｫｰﾑ幅

	LSyainCount.Color	:= HAP_COLOR_COUNT;					// 件数背景色
	LShowOrder.Color	:= HAP_COLOR_ORDER;					// 表示順序背景色


//MjsColorChange前にBaseｶﾗｰを設定しておく

	//処理選択ﾊﾞｰ
	PTab.Color	:= $00F2F2F2;

	with MTab do
	begin
		for i:=0 to Items.Count-1 do
			Items[i].Color	:= recSystem.SysBaseColorD;
	end;


	//子APの親になるﾊﾟﾈﾙ
	with PAPParent do
	begin
		Height		:= 410;
		Width		:= 940;
		ParentColor	:= True;
	end;


//表示色/ﾌｫｰｶｽ色に設定色ｾｯﾄ
	MjsColorChange(	THAP000010BaseF(Self),					// m_pChildFormはｴﾗｰ(FormCreateｲﾍﾞﾝﾄ終了でｾｯﾄ)
					recSystem.SysColorB,
					recSystem.SysColorD,
					recSystem.SysBaseColorB,
					recSystem.SysBaseColorD,
					recCommon.SysFocusColor
					);

	with LStatus do						// ｽﾃｰﾀｽﾊﾞｰ上のﾗﾍﾞﾙ
	begin
		Parent	:= StatusBar;			// 設計時にはｽﾃｰﾀｽﾊﾞｰをParentにできないので動的に設定
		Left	:= 2;
		Top		:= 4;
		AutoSize:= True;
		Visible	:= False;

		Transparent	:= TRUE;
		Align		:= alRight;
		if m_iaddin30 = 1 then
			Visible		:= TRUE;
	end;

	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		if Components[i] is TMNumEdit then
			(Components[i] as TMNumEdit).Value	:= 0;

		if Components[i] is TMTxtEdit then
			(Components[i] as TMTxtEdit).Text	:= '';

		if (Components[i] is TMLabel)and
		   (Copy((Components[i] as TMLabel).Name,1,1)='L') then
			(Components[i] as TMLabel).Caption	:= '';

		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMNumEdit then
		begin
			(Components[i] as TMNumEdit).OnEnter:= fnWCTLEnter;
			(Components[i] as TMNumEdit).OnExit	:= fnWCTLExit;
		end;
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).OnEnter:= fnWCTLEnter;
			(Components[i] as TMTxtEdit).OnExit	:= fnWCTLExit;
		end;
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter	:= fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit	:= fnWCTLExit;
		end;
	end;

	SYDBModule.SetNaviBtnLink(BNavi);						// Naviとのﾘﾝｸ
	SYDBModule.SetEmpNoProperty(ENEmpNo);					// 社員No桁数
	SYDBModule.SetFreeCodeProperty(ESEmpNo);				// 社員No桁数

	m_bUsePGChgDlg := SYDBModule.EmpPayGroupChgEnable(m_HAPMyNum);	// <MYN> 支給グループ変更ダイアログ呼出可否フラグ取得

//----------------------------
//社員コードの属性により、パーツの使用切替
	//フリーコード
	if giEmpAttr = 2 then
	begin
		ENEmpNo.Enabled	:= False;
		ENEmpNo.Visible	:= False;

		ESEmpNo.Enabled	:= True;
		ESEmpNo.Visible	:= True;

		ESEmpNo.MaxLength:= giEmpDigit;
	end
	//数値
	else
	begin
		ESEmpNo.Enabled	:= False;
		ESEmpNo.Visible	:= False;

		ENEmpNo.Enabled	:= True;
		ENEmpNo.Visible	:= True;
	end;

	PAPParent.Height	:= _HAP_CHILDAP_HEIGHT_;
	PAPParent.Width		:= _HAP_CHILDAP_WIDTH_;

	iBNextWidth	:= BNext.Width;
	iBBackWidth	:= BBack.Width;

	LSyainCount.Caption:=fnNumEdit(SYDBModule.GetCount,13);

//設計時に貼り付けてあるﾎﾞﾀﾝを解放

	MTab.OnChange:=nil;
	try
		//ﾀﾌﾞ設定
		MTab.Items.Clear;
		for i:=0 to Length(arrChildInfo)-1 do
		begin
			MTab.Items.Add;
			with MTab.Items[MTab.Items.Count-1] do
			begin
				Color	:= recSystem.SysColorD;
				with arrChildInfo[i] do
				begin
					Caption	:= sCaption;
					Visible	:= bSelected;
				end;
			end;
		end;
		//変更後にｲﾍﾞﾝﾄ割り当て
		MTab.OnChange	:= MTabChange;
	except
	end;

	j	:= 0;
	for i:=0 to Length(arrChildInfo)-1 do
	begin
		if arrChildInfo[i].bExist then
			Inc(j);
	end;
	BNext.Enabled	:= (J>1);
	BBack.Enabled	:= (J>1);
	BNext.Visible	:= (J>1);
	BBack.Visible	:= (J>1);

	m_HAPPerms		:= nil;														// 権限管理・決算更新区分管理モジュール object 初期化

	//------------------------------------------
	// 権限管理・決算区分管理モジュール 生成
	//------------------------------------------
	m_HAPPerms	:= THAPPerms.CreateModule( pAppRec, 1 );
	if ( Assigned( m_HAPPerms ) <> True ) then
	begin
		GetMsg( recMsg, 200, 1 );
		with recMsg do
		begin
			sMessage	:= '権限管理モジュールの生成に失敗しました。';
			MjsMessageBoxEx( Self, sMessage, sTitle, IconType, BtnType, BtnDef, LogType );
		end;
		Abort;
	end;

	//----------------------
	// 決算更新区分 取得
	//----------------------
	m_bPrmKessan	:= m_HAPPerms.IsKessan( @Self );

	//------------------
	// 各種権限 取得
	//------------------
	m_bPrmDisplay	:= m_HAPPerms.IsDisplay();									// 表示権限
	m_bPrmModify	:= m_HAPPerms.IsModify() and m_bPrmKessan;					// 修正権限
	m_bPrmAppend	:= m_HAPPerms.IsAppend() and m_bPrmKessan;					// 追加権限
	m_bModify		:= (m_bPrmModify and m_bPrmAppend);							// 追加更新権限
	m_bPrmPrint		:= m_HAPPerms.IsPrint();									// 印刷権限
	m_bPrmDelete	:= m_HAPPerms.IsDelete() and m_bPrmKessan;					// 削除権限
	m_bPrmExtract	:= m_HAPPerms.IsExtract();									// 出力権限

	// <マスタ同期>---Start---
	// 全社の場合
	if m_SyncMaster.IsParent() then
	begin
		// 過年度DBを選択している場合
		if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
		begin
			if ( MjsMessageBoxEx(Self, HAPSYNC_MSG_YokukiChk_Oya,
									'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
			begin
				// 通常のﾏｽﾀ登録として起動する。
				// 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
			end
			else
			begin
				// ﾏｽﾀをUpdata、Insertすることはできない。
				m_bPrmModify	:= false;					// 修正の制限
				m_bPrmAppend	:= false;					// 追加の制限
				m_bModify		:= (m_bPrmModify and m_bPrmAppend);
				m_bPrmDelete	:= false;					// 削除の制限
			end;
		end;
	end;
	// <マスタ同期>--- End ---

	if m_iErrorKbn <> 0 then								// 全社と自社の会社基本情報が異なる場合
	begin
		m_bPrmAppend	:= False;							// 追加権限なし
		m_bPrmDisplay	:= False;							// 表示権限なし
		m_bPrmModify	:= False;							// 修正権限なし
		m_bPrmDelete	:= False;							// 削除権限なし
		m_bPrmPrint		:= False;							// 印刷権限なし
		m_bPrmExtract	:= False;							// CSV出力権限なし
		m_bModify		:= False;							// 登録系追加修正権限なし

		arrFuncBar[0]	:= 'F1 表示順変更,0';				// F1を無効
	end;

	if m_iErrorKbn = HAPSYNC_RET_MASCHK_NO_USE then			// 全社では採用なし
	begin
		MjsMessageBoxEx(Self,
						HAPSYNC_MSG_NO_USE,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
	end
	else if m_iErrorKbn = HAPSYNC_RET_MASCHK_DIFF_C then	// 属性・桁数が違う
	begin
		MjsMessageBoxEx(Self,
						HAPSYNC_MSG_DIFF_C,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
	end
	else if m_iErrorKbn = HAPSYNC_RET_MASCHK_DIFF_U then	// 採用区分が違う
	begin
		MjsMessageBoxEx(Self,
						HAPSYNC_MSG_DIFF_U,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
	end
	else if m_iErrorKbn = HAPSYNC_RET_MASCHK_ERR then		// ｴﾗｰ
	begin
		MjsMessageBoxEx(Self,
						'マスター基本情報の取得に失敗しました。',//<210202>Upd 長音対応
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
	end;

end;

//**********************************************************************
//		Proccess	:社員選択ﾊﾟﾈﾙ部内容ｾｯﾄ
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnTopPanelSet;
var
	iKbn	: Integer;
	sCode,
	sDate	: String;
	dDateT	: TDateTime;
begin

	//社員選択ﾓｼﾞｭｰﾙ

	with SYDBModule do
	begin
		//社員No
		if giEmpAttr = 2 then	//フリーコード
			ESEmpNo.Text	:= GetFld('GCode').AsString
		else
		begin
			try
				sCode			:= GetFld('GCode').AsString;
				ENEmpNo.Value	:= StrToInt64(sCode);
			except
				ENEmpNo.Value	:= 0;
			end;
		end;

		//氏名
		LEmpName.Caption	:= GetMosFld('Name').AsString;

		dDateT := GetFld('UpdDateTM').AsDateTime;
		//入力暦区分[西暦以外]
		if m_iRekiKbn = 0 then
			sDate := MjsGetGengou(dDateT,MdtCMP_YMD)+FormatDateTime(' ee/mm/dd hh:nn ',dDateT)
		else
			sDate := FormatDateTime('yyyy/mm/dd hh:nn ',dDateT);

		LStatus.Caption		:= '最終更新者：'+GetFld('UpdTanto').AsString+' '+sDate;

		//在職区分
		iKbn	:= GetFld('Zaishoku').AsInteger;
		LZaisyoku.Caption	:=gaZaishoku[iKbn];

		case iKbn of
			2:	LZaisyoku.Font.Color := HAP_FONT_COLOR_BLUE;
			3:	LZaisyoku.Font.Color := HAP_FONT_COLOR_RED;
			else
				LZaisyoku.Font.Color := clWindowText;
		end;

		if iKbn = 2 then
		begin
			dDateT	:= GetFld('Retire').AsDateTime;
			//入力暦区分[西暦以外]
			if m_iRekiKbn = 0 then
				sDate := MjsGetGengou(dDateT,MdtCMP_YMD)+FormatDateTime(' ee/mm/dd',dDateT)
			else
				sDate := FormatDateTime('yyyy/mm/dd',dDateT);

			LRetire.Visible	:= TRUE;
			TRetire.Visible	:= TRUE;
			LRetire.Caption	:= sDate;
		end
		else
		begin
			LRetire.Visible	:= FALSE;
			TRetire.Visible	:= FALSE;
		end;

		//支払形態
		iKbn	:= GetFld('Shiharai').AsInteger;
		LShiharai.Caption	:= gaShiharai[iKbn];

		//所属No
		LDeptNo.Caption		:= GetFld('DeptGCode').AsString;

		//所属名
		LDeptName.Caption	:= GetFld('DeptName').AsString;

		//付箋表示
		FusenClear;
		FusenShow;

		m_FImage := GetFusenInfo;
		if m_FImage.Hint <> '' then
		begin
			FusenLabel.Visible:= TRUE;
			FusenInfo.Visible := TRUE;
			FusenInfo.Caption := m_FImage.Hint;
			case m_FImage.Tag of
				1://赤
					FusenLabel.Color := $3121DC;
				2://緑
					FusenLabel.Color := $668C42;
				3://青
					FusenLabel.Color := $C68C4A;
				4://橙
					FusenLabel.Color := $318CFF;
			end;
		end
		else
		begin
			FusenLabel.Visible	:= FALSE;
			FusenInfo.Visible	:= FALSE;
		end;

		// 表示順序情報表示
		StatusBar.SimpleText	:= GetFreeOrder;
	end;
end;

//**********************************************************************
//		Process		:社員選択ﾊﾟﾈﾙ更新
//		Name		:T.Aoki
//		Date		:01/05/28
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnTopPanelUpdate;
var
	mqCopWk	: TMQuery;

	iKbn	: Integer;
begin

	try
		mqCopWk:=TMQuery.Create(Self);

		try
			SYDBModule.SetDBInfoToQuery(mqCopWk);

			with mqCopWk do
			begin
				Close;
				with SQL do
				begin
					Clear;
					Add('SELECT SC.NCode,MS.Name,SC.Zaishoku,SC.Shiharai'
						+' FROM HAPSC SC'
						+' JOIN MOS_OFFICE_STAFF MS'
							+ ' ON SC.NCode = MS.NCode'	);
					Add( 'WHERE SC.CorpNCode=0'
						+ ' AND SC.GCode='+AnsiQuotedStr(sEmpNo,'''')	);
				end;

				Open;

				if not Eof then
				begin
					LEmpName.Caption	:= GetFld('Name').AsString;

				//在職区分
					iKbn := GetFld('Zaishoku').AsInteger;
					LZaisyoku.Caption	:= gaZaishoku[iKbn];

					case iKbn of
						2:	LZaisyoku.Font.Color := HAP_FONT_COLOR_BLUE;
						3:	LZaisyoku.Font.Color := HAP_FONT_COLOR_RED;
						else
							LZaisyoku.Font.Color := clWindowText;
					end;

				//支払形態
					iKbn	:= GetFld('Shiharai').AsInteger;
					LShiharai.Caption	:= gaShiharai[iKbn];

				//所属No
					LDeptNo.Caption		:= SYDBModule.GetFld('DeptGCode').AsString;

				//所属
					LDeptName.Caption	:= SYDBModule.GetFld('DeptName').AsString;
				end;
			end;
		finally
			mqCopWk.Free;
		end;
	except
		raise Exception.Create('社員情報 再表示失敗');
	end;
end;


//**********************************************************************
//		Proccess	:社員選択ﾊﾟﾈﾙ部内容ｸﾘｱ
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnTopPanelClear;
begin
//入力したNoは残す
	LEmpName.Caption	:= '';			// 氏名
	LShiharai.Caption	:= '';			// 備考
	LZaisyoku.Caption	:= '';			// 在職区分
	LDeptNo.Caption		:= '';			// 所属No
	LDeptName.Caption	:= '';			// 所属名
	LStatus.Caption		:= ' ';			// 最終更新日
	FusenLabel.Visible	:= FALSE;		//
	FusenInfo.Visible	:= FALSE;		//

	LRetire.Visible		:= FALSE;
	TRetire.Visible		:= FALSE;		// 退職日
end;

//**********************************************************************
//		Proccess	:子AP検索
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:TRUE	:子APあり
//					:		:子APなし
//**********************************************************************
function THAP000010BaseF.fnChildBplExist:boolean;
var
	i		: integer;
	sBplPath: string;
begin
	Result:=FALSE;

	// 初期化
	arrKMCnt[0]	:= -1;					// 給与手当項目数
	arrKMCnt[1]	:= -1;					// 賞与手当項目数

	// 区分名称件数初期化
	for i:=0 to Length(arrMNCnt)-1 do
		arrMNCnt[i]:=0;

	SetLength(arrChildInfo,0);

	m_bDefTab	:= FALSE;

	with mqMA do
	begin
		try
			try
				Close;
				SQL.Clear;
				SQL.ADD( 'SELECT ETL.PrgCode, ETL.PrgID, ETL.Param, ETL.PrgTagName, ETL.RefDay'
						+ ' FROM HAPETM ETM'
						+ ' JOIN HAPETL ETL ON ETM.PrgCode = ETL.PrgCode'
						+ ' JOIN HAPETG ETG ON ETM.PatternNo = ETG.PatternNo'
						+' WHERE ETG.ComCode = 0 '
						+	'AND ETG.GrpNo = (SELECT TOP 1 GrpNo FROM MOS_OFFICE_STFGRP_STAFF WHERE TantoNCD = :hTanto ORDER BY GrpNo) '
						+	'AND ETM.MenuPara = :hMenuP '
						+	'AND ETM.DispType = 0 '
						+	'AND (((ETL.LicKbn & '+IntToStr(fnSysKbnCheck)+') > 0) or (ETL.LicKbn = 0))'
						+' ORDER BY ETM.DispOrder');

				SetFld('hMenuP').AsInteger	:= m_iParam;
				SetFld('hTanto').AsString	:= IntToStr(recCommon.TantoNCD);

				OPEN(TRUE);

				if EOF then				// 該当担当者グループに見つからない場合は、規定を読み直す
				begin
					m_bDefTab	:= TRUE;

					Close;
					SQL.Clear;
					SQL.ADD( 'SELECT ETL.PrgCode, ETL.PrgID, ETL.Param, ETL.PrgTagName, ETL.RefDay'
						+ ' FROM HAPETM ETM'
						+ ' JOIN HAPETL ETL ON ETM.PrgCode = ETL.PrgCode'
						+' WHERE ETM.PatternNo = 0 '
						+	'AND ETM.MenuPara = :hMenuP '
						+	'AND ETM.DispType = 0 '
						+	'AND (((ETL.LicKbn & '+IntToStr(fnSysKbnCheck)+') > 0) or (ETL.LicKbn = 0))'
						+' ORDER BY ETM.DispOrder');

					SetFld('hMenuP').AsInteger	:= m_iParam;

					OPEN(TRUE);
				end;

				i := 0;
				while not EOF do
				begin

					case GetFld('PrgID').AsInteger of
					 100030 :	// 資格免許
					 begin
						// 資格免許名称の登録状況により呼出を制御
						// 資格免許名称数ﾁｪｯｸ
						fnMNCntSet(_MN_SHIKAKU);

						// 単体起動の場合は無条件
						// WMDispRunで、呼出し不可とする
						if (arrMNCnt[_MN_SHIKAKU] < 1) and (arrParam[1] <> 30) then
						begin
							Next;
							continue;
						end;
					 end;

					 100040 :	// 手当/控除
					 begin

						if (GetFld('Param').AsInteger = 0) then	// 給与
						begin
							fnKMCntSet(0);

							if (arrKMCnt[0] < 1) and (arrParam[1] <> 40) then
							begin
								Next;
								continue;
							end;
						end;

						if (GetFld('Param').AsInteger = 1) then	// 賞与
						begin
							fnKMCntSet(1);

							if (arrKMCnt[1] < 1) and (arrParam[1] <> 50) then
							begin
								Next;
								continue;
							end;
						end;
					 end;

{保留
					 100070 :	// 社会保険
					 begin
						fnJIGCheck;

						if (m_aJIGFlg[1] < 1) and (arrParam[1] <> 70) then
						begin
							Next;
							continue;
						end;
					 end;

					 100075 :	// 雇用保険
					 begin
						fnJIGCheck;

						if (m_aJIGFlg[2] < 1) and (arrParam[1] <> 75) then
						begin
							Next;
							continue;
						end;
					 end;

					 100080 :	// 労働保険
					 begin
						fnJIGCheck;

						if (m_aJIGFlg[3] < 1) and (arrParam[1] <> 80) then
						begin
							Next;
							continue;
						end;
					 end;
}
					 100100 :	// 汎用振込
					 begin
						if GetFld('Param').AsInteger = 1 then
						begin
							fnHanCntSet;

							if (m_iHanyo < 1) and (arrParam[1] <> 105) then
							begin
								Next;
								continue;
							end;
						end;
					 end;

					 // <MYN>
					 100900 :	// マイナンバー
					 begin
						if m_MYN.AccType = MYNACCESS_TYPE_NONE then	// 参照不可（権限なし）
						begin
							Next;
							continue;
						end;
					 end;

					 15 :		//教育研修
					 begin
						// 教育研修名称数ﾁｪｯｸ
						fnMNCntSet(_MN_KYOUIKU);
						fnMNCntSet(_MN_KENSYU);

						if (arrParam[0]<>3) then				// 単体呼出以外
						begin
							if (GetFld('Param').AsInteger = 0) and (arrMNCnt[_MN_KYOUIKU] < 1) then
							begin
								Next;
								continue;
							end;

							if (GetFld('Param').AsInteger = 1) and (arrMNCnt[_MN_KENSYU] < 1) then
							begin
								Next;
								continue;
							end;
						end;
					 end;

					 16 :		// 賞罰
					 begin
						// 賞罰名称数ﾁｪｯｸ
						fnMNCntSet(_MN_HOUSYOU);
						fnMNCntSet(_MN_CHOBATSU);

						if (arrParam[0]<>4) then				// 単体呼出以外
						begin
							if (GetFld('Param').AsInteger = 0) and (arrMNCnt[_MN_HOUSYOU] < 1) then
							begin
								Next;
								continue;
							end;

							if (GetFld('Param').AsInteger = 1) and (arrMNCnt[_MN_CHOBATSU] < 1) then
							begin
								Next;
								continue;
							end;
						end;

					 end;

					 100170 :			// 区分情報			<2020-11-20>
					 begin
						// 区分名称数ﾁｪｯｸ
						if not fnMNCntSet2 then				// 設定可能項目有無
						begin
							Next;
							continue;
						end;

					 end;

					end;

					SetLength(arrChildInfo,i+1);

					arrChildInfo[i].iPrgCode:= GetFld('PrgCode'	).AsInteger;
					arrChildInfo[i].iPrgId	:= GetFld('PrgID'	).AsInteger;
					arrChildInfo[i].sCaption:= GetFld('PrgTagName').AsString;
					arrChildInfo[i].iPrgPara:= GetFld('Param'	).AsInteger;
					arrChildInfo[i].bRefDay	:= GetFld('RefDay'	).AsInteger=1;	// 基準日指定可能子AP<RefDay>

					Inc(i);

					// 人事/給与採用なしのマスタ社員登録の場合
					if (m_iParam = 0) and (fnSysKbnCheck < 1) then
					begin
						if fnSYCheck then					// 整合性回避
						begin
							SetLength(arrChildInfo,i+1);

							arrChildInfo[i].iPrgCode:= 24;
							arrChildInfo[i].iPrgId	:= 100190;
							arrChildInfo[i].sCaption:= '退職/休職';
							arrChildInfo[i].iPrgPara:= 0;
							arrChildInfo[i].bRefDay	:= TRUE;					// 基準日指定可能子AP<RefDay>

							Inc(i);
						end;
					end;
					Next;
				end;

				// 単体（項目別）呼出以外で、区分等の件数不足により呼べない場合
				// いったん画面は表示させた上でWM_DispRunで終了する。
				m_bMNCntZero := FALSE;
				if 0>=Length(arrChildInfo) then
				begin
					i := 0;

					First;
					while not EOF do
					begin
						SetLength(arrChildInfo,i+1);

						arrChildInfo[i].iPrgCode:= GetFld('PrgCode'	).AsInteger;
						arrChildInfo[i].iPrgId	:= GetFld('PrgID'	).AsInteger;
						arrChildInfo[i].sCaption:= GetFld('PrgTagName').AsString;
						arrChildInfo[i].iPrgPara:= GetFld('Param'	).AsInteger;
						arrChildInfo[i].bRefDay	:= GetFld('RefDay'	).AsInteger=1;	// 基準日指定可能子AP<RefDay>

						Inc(i);
						Next;
					end;

					m_bMNCntZero := TRUE;
				end;

			except
				Exit;
			end;
		finally
			mqMA.Close;
		end;

		for i:=0 to Length(arrChildInfo)-1 do
		begin
			with arrChildInfo[i]do
			begin
				// ファイル名 HAPxxxxxxC.bpl
				sBplPath	:=recCommon.SysRoot + '\'
							+ recSystem.SysPrefix + '\prg10\'					//<D10-E017> Prg→Prg10
							+ Format('HAP%6.6uC.BPL',[iPrgId]);					// 'C'が付く

				//子AP存在検索
				if not FileExists(sBplPath) then
					continue;

// <RefDay> S
				if bRefDay				// 基準日指定可能子APあり
				and (m_Series.IsMjsLink4 or m_Series.IsGalileopt3) then			// Plusシリーズのみ有効
					m_RefEna	:= TRUE;
// <RefDay> E

				bExist		:= TRUE;
				bSelected	:= TRUE;
			end;
		end;

		for i:=0 to Length(arrChildInfo)-1 do
		begin
			if arrChildInfo[i].bExist then
				break;
		end;

		// 選択可能処理なし
		if i>=Length(arrChildInfo) then
			Exit;
	end;

	Result:=TRUE;
end;


//**********************************************************************
//		Proccess	:子AP表示
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:iPos	:0..1	子AP読込I/Fｸﾗｽの配列No
//		Return		:TRUE	:成功
//					:FALSE	:失敗
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnChildLoad(iPos:Integer):boolean;
begin
	Result:=False;
	with HapApIF[iPos] do
	begin
		// 子AP Load
		if not ChildLoad(	Self, pAppRec,
							Format(	'HAP%6.6uC.BPL',[arrChildInfo[iPos].iPrgId]))then
		begin
			MjsMessageBox(Self,'子APのﾛｰﾄﾞに失敗しました。',mjError,mjDefOK);
			Exit;
		end;

		SetChildFormParent(pointer(@PAPParent));			// 内容部 貼付先ﾊﾟﾈﾙｾｯﾄ

		HapApParam.SetChildBtnParent(@PTool);				// 処理ﾎﾞﾀﾝの貼付先
		HapApParam.SetCopDB(ddCopDB);
		HapApParam.SetMjsDB(ddMjsDB);
		HapApParam.SetPara(arrChildInfo[ipos].iPrgPara);

// ﾃｽﾄ用-何もｾｯﾄしなければﾃﾞﾌｫﾙﾄ(終了+印刷+切出+Navi+付箋ToolBar)使用します。
		HapApParam.SetBtnLeft(Bnavi.Left+Bnavi.Width+TBtn.Width +2, BExit.Top);

		if ChildBplAction(ACTID_FORMCREATESTART,@HapApParam)<>ACTID_RET_OK then
		begin
			MjsMessageBox(Self,'子APﾌｫｰﾑの作成に失敗しました。',mjError,mjDefOK);
			Exit;
		end;

		ChildBplAction(HAPAP_ACTID_DISABLE);				// 子AP内容部[使用不可]
	end;

	Result:=True;

end;


//**********************************************************************
//		Proccess	:子APｱﾝﾛｰﾄﾞ
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//					:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnChildUnLoad(iPos:byte);
begin
	with HapApIF[iPos] do
	begin
		if not IsChildLoad then								// Loadしていない
			Exit;											// 以下不要(実行するとｴﾗｰ発生)

		ChildUnLoad;										// ﾊﾟｯｹｰｼﾞUnLoad
	end;
end;

//**********************************************************************
//		Proccess	:子AP前後検索
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:cfTop		:先頭
//					:cfEnd		:最終
//					:cfNext		:次
//		Return		:cfPrev		:前
//					:
//		History		:2002/02/08
//					:最終の子APに次ﾎﾞﾀﾝで進まない不具合を修正
//**********************************************************************
function THAP000010BaseF.fnChildBplFind(cfAction:TChildBplFindAction):integer;
const
	BplNo:integer=0;
var
	i	: integer;
begin

	//次
	if(cfAction=cfNext)then
	begin
		for i:=arrLoadBplNo[ActiveChildPos]+1 to High(arrChildInfo) do
		begin
			if arrChildInfo[i].bSelected then
				break;
		end;
		if i<=High(arrChildInfo) then
			Result:=i
		else
			Result:=arrLoadBplNo[ActiveChildPos];
		Exit;
	end
	//先頭
	else if(cfAction=cfTop)then
	begin
		for i:=Low(arrChildInfo) to High(arrChildInfo) do
		begin
			if arrChildInfo[i].bSelected then
			begin
				Result:=i;
				Exit;
			end;
		end;
	end
	//前
	else if(cfAction=cfPrev)then
	begin
		for i:=arrLoadBplNo[ActiveChildPos]-1 downto Low(arrChildInfo) do
		begin
			if arrChildInfo[i].bSelected then
				break;
		end;
		if i>=Low(arrChildInfo) then
			Result:=i
		else
			Result:=arrLoadBplNo[ActiveChildPos];
		Exit;
	end
	//最終
	else if(cfAction=cfEnd)then
	begin
		for i:=High(arrChildInfo) downto Low(arrChildInfo) do
		begin
			if arrChildInfo[i].bSelected then
			begin
				Result:=i;
				Exit;
			end;
		end;
	end;

	Result:=-1;
end;


//**********************************************************************
//		Proccess	:処理選択ﾊﾟﾈﾙ使用可/不可 切替
//		Name		:T.Aoki
//		Date		:2000/12/26
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnTabEnable(bEnable:boolean);
begin
	PAPParent.Enabled := bEnable;

	fnBottomPanelEnable(bEnable);
end;

//**********************************************************************
//		Proccess	:子AP初期処理
//		Name		:T.Aoki
//		Date		:2000/12/26
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnChildBplIni;
var
	j	: Integer;
begin
	ActiveChildPos:=$0;										// 配列0番目から使用
															// ﾃﾞﾌｫﾙﾄで読み込む子APを取得
	try
		HapApParam.SetPointer(pAppRec);						// 郵便番号辞書呼出し用
		HapApParam.SetPointer(@m_SyncMaster, 1);			// マスタ同期用

		for j:=0 to Length(arrChildInfo)-1 do
		begin
			if not arrChildInfo[j].bExist then
				continue;

			arrLoadBplNo[j] := j;
			if not(fnChildLoad(j)) then	// 子APLoad
				Abort;

			if j>0 then
			begin
				HapApIF[arrLoadBplNo[j]].ChildBplAction(HAPAP_ACTID_DISABLE);
				HapApIF[arrLoadBplNo[j]].ChildBplAction(ACTID_HIDESTART);
			end;
		end;

		HapApIF[ActiveChildPos].ChildBplAction(ACTID_SHOWSTART);
	except
		MjsMessageBox(Self,'障害が発生したため'#13#10'処理を終了します。',mjError,mjdefok);
		abort;
	end;
end;

//**********************************************************************
//		Proccess	:社員登録/未登録ﾁｪｯｸ
//		Name		:T.Aoki
//		Date		:01/01/15
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnSyainExist:boolean;
var
	e		: TObject;
	sSQL	: string;
begin
	Result:=False;

	m_iEmpNCode:=0;
	m_iCmnNCode:=0;
	try
		with mqSC do
		begin
			Close;

			sSQL := '';
			sSQL := sSQL + 'Select';
			sSQL := sSQL + ' HAP.NCode,';
			sSQL := sSQL + ' HAP.GCode,';
			sSQL := sSQL + ' MOS.SimpleName,';
			sSQL := sSQL + ' MAP.CMNTantoNCD';
			sSQL := sSQL + ' From';
			sSQL := sSQL + ' HAPSC as HAP';
			sSQL := sSQL + ' Inner Join MOS_OFFICE_STAFF as MOS';
			sSQL := sSQL + ' On HAP.NCode = MOS.NCode';
			sSQL := sSQL + ' LEFT JOIN MOS_OFFICE_STAFF_MAPPING as MAP';
			sSQL := sSQL + ' On HAP.NCode = MAP.TantoNCD';
			sSQL := sSQL + ' Where HAP.CorpNCode = 0';
			sSQL := sSQL + ' AND HAP.GCode =' + AnsiQuotedStr(sEmpNo,'''');

			SQL.Clear;
			SQL.Add(sSQL);

			Open(True);					// 登録済?
			if not Eof then
			begin
				m_iEmpNCode	:= Trunc(GetFld('NCode').AsFloat);
				m_iCmnNCode	:= Trunc(GetFld('CMNTantoNCD').AsFloat);
				Result:=True;
				Exit;
			end;

			Close;
		end;
	except;
		e:=exceptobject;
		ShowException(e,ExceptAddr);
	end;
end;

//**********************************************************************
//		Proccess	:処理選択ﾀﾞｲｱﾛｸﾞ呼出
//		Name		:T.Aoki
//		Date		:01/02/13
//		Parameter	:
//		Return		:
//		History		:03/11/21(T.Aoki)
//					:帳票初期処理を追加
//**********************************************************************
procedure THAP000010BaseF.fnCallSelDlg;
var
	i,j	: integer;
	Dlg	: THAP000010DialogF;
begin

	if SYDBModule.GetCount=0 then
		Exit;

	if arrParam[1]>1 then				// 単一起動指定
		Exit;							// ->無視

	with Dlg do
	begin
		try
			Dlg:=THAP000010DialogF.CreateForm(pAppRec,Self);
			try
				//初期設定をｾｯﾄ
				Init(arrChildInfo);

				if ShowModal=mrOK then
					Term(arrChildInfo);	// 選択結果を受取
			finally
				Release;
			end;
		except
			raise Exception.create('処理指定ﾀﾞｲｱﾛｸﾞ');
		end;
	end;


	//ﾀﾌﾞ表示
	j:=0;
	for i:=0 to MTab.Items.Count-1 do
	begin
		with arrChildInfo[i]do
		begin
			MTab.Items[i].Visible:=bSelected;
			if bSelected then
				Inc(j);
		end;
	end;
	//次/前ﾎﾞﾀﾝ表示
	BNext.Visible:=(j>1);
	BBack.Visible:=(j>1);

	//印刷情報初期処理
	fnPrintInfoIni;

//先頭BPL変更

	try
		//最前面が切り替わらなければ何もしない
		if arrLoadBplNo[ActiveChildPos]=fnChildBplFind(cfTop) then
			Exit;

		//裏側にあったらそのまま使用
		//裏側にもなければ読み込み
		svActiveChildPos := ActiveChildPos;

		ActiveChildPos	:= fnChildBplFind(cfTop);

		HapApIF[svActiveChildPos].ChildBplAction(ACTID_HIDESTART);
		HapApIF[ActiveChildPos	].ChildBplAction(ACTID_SHOWSTART);

		with MTab do
		begin
			OnChange		:= nil;							// ｲﾍﾞﾝﾄ切り離し
			OnEnter			:= nil;							// ｲﾍﾞﾝﾄ切り離し
			Items.Selected	:= fnChildBplFind(cfTop);		// 選択状態のみ変更
			OnChange		:= MTabChange;					// ｲﾍﾞﾝﾄ再割り当て
			OnEnter			:= MTabEnter;					// ｲﾍﾞﾝﾄ再割り当て
		end;

		fnTabEnable(FALSE);									// 処理選択ﾎﾞﾀﾝ状態変更[使用可/不可]

		if not(SYDBModule.Bof) or							// 社員あり
		   not(SYDBModule.Eof) then							// 社員あり
		begin
			fnTopPanelSet;
			HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
			HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
			HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
		end
		else												// 社員なし
		begin
			if giEmpAttr = 2 then		// フリーコード
				ESEmpNo.Text := ''
			else
				ENEmpNo.Value:=0;

			fnTopPanelClear;
		end;

		if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報の時
		begin
			if not m_bModify then							// 登録系追加修正権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー,0';
				arrFuncBar[6]	:= 'F7 社員No変更,0';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else if not m_bPrmDelete then					// 削除権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除';
			end;
		end
		// <MYN>
		else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 基本情報の時
		begin
			if m_bUsePGChgDlg then							// 支給グループ変更ダイアログ使用
			begin
				if not m_bModify or								// 登録系追加修正権限
					(m_MYN.AccType = MYNACCESS_TYPE_NONE) then	// 個人番号権限なし（初期処理後のエラー対応）
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更,0';
				end
				else
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更';
				end;
			end
			else
			begin
				arrFuncBar[5]	:= '';
				arrFuncBar[6]	:= '';
				arrFuncBar[7]	:= '';
			end;
		end
		else
		begin
			arrFuncBar[5]	:= '';
			arrFuncBar[6]	:= '';
			arrFuncBar[7]	:= '';
		end;
		FuncBar.CopyFuncData(arrFuncBar);
		HapApParam.SetFuncCaption(arrFuncBar);

	except
		MjsMessageBox(Self,'処理の切替でｴﾗｰが発生しました。社員登録を終了します。',mjError,mjdefok);
		Close;
	end;
end;

//**********************************************************************
//		Proccess	:印刷情報取得
//		Name		:T.Aoki
//		Date		:01/01/29
//		Parameter	:pAppRec	:MJSAppRecordﾎﾟｲﾝﾀ
//					:MPrnSupport:MJS印刷ﾀﾞｲｱﾛｸﾞ構造体
//					:COwner		:ｺﾝﾎﾟｰﾈﾝﾄCreateの親
//		Return		:True		:取得成功
//					:False		:取得失敗
//**********************************************************************
function HapGetPrnInfo(pAppRec:Pointer;MPrnSupport:TMjsPrnSupport;COwner:TComponent):Boolean;
var
	AppRec	: TMjsAppRecord;			// MjsAppRecord
	MDBModule:TMDataModuleF;			// MjsDBModule

	ddCopDB	: TFDConnection;				// 会社DB

	mqPrn	: TMQuery;					// 会社用ｸｴﾘ

	iCorpID	: integer;					// 会社DB ID
begin

	AppRec	:= TMjsAppRecord(pAppRec^);
	MDBModule:=TMDataModuleF(AppRec.m_pDBModule^);

//(1)
//MjsAppRecordから直接値ｾｯﾄ

	MPrnSupport.pComArea	:= AppRec.m_pCommonArea;
	with MPrnSupport.lstCorpCode do
	begin
		Clear();;
		Add('出力しない');
		Add('会社コード');
	end;

	// 会社コードリストの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
	with MPrnSupport.iarCorpCodeValue do
	begin
		Clear();
		Add(0);
		Add(1);
	end;

	with MPrnSupport.lstCorpName do
	begin
		Clear();
		Add('出力しない');
		Add('会社名');
	end;

	// 会社名リストの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
	with MPrnSupport.iarCorpNameValue do
	begin
		Clear();
		Add(0);
		Add(3);
	end;

	with MPrnSupport do
	begin
		strCorpCode		:= InttoStr(AppRec.m_iCorpCode);
		strBranchCode	:= '';
		strBranchName	:= '';
	end;


//(2)
//会社情報からｾｯﾄ

	iCorpID:=TMjsAppRecord(pAppRec^).m_iCorpID;
	try
		ddCopDB:=MDBModule.CopDBOpen(0,iCorpID);
		try
			try
				if COwner=nil then
					mqPrn	:= TMQuery.Create(TComponent(TMjsAppRecord(pAppRec^).m_pChildForm^))
				else
					mqPrn	:= TMQuery.Create(COwner);

				try
					MDBModule.SetDBInfoToQuery(ddCopDB,mqPrn);
					with mqPrn do
					begin

						MPrnSupport.strOfficeName := '';

						Close;
						//会社名
						with SQL do
						begin
							Clear;
							Add('SELECT LComName FROM DTMAIN'	);
						end;

						try
							Open;
							if not Eof then
								MPrnSupport.strCorpName:=GetFld('LComName').AsString;
						except
							raise Exception.Create('共通情報取得失敗');
						end;

						Close;
						SQL.Clear;
						SQL.Add('SELECT CalendarKbn FROM HAPM3'	);

						try
							Open;
							if Eof then
								Abort;

							MPrnSupport.iCalendarKbn	:= GetFld('CalendarKbn').AsInteger;

							MPrnSupport.iDate			:= 0;
							MPrnSupport.iPage			:= 0;
							MPrnSupport.iKaishaCode		:= 0;
							MPrnSupport.iKaishaName		:= 0;

						except
							raise Exception.Create('会社ｸｴﾘ 情報取得失敗');
						end;
					end;
				finally
					mqPrn.Close;
					mqPrn.Free;
				end;
			except
				raise Exception.Create('会社ｸｴﾘ 生成失敗');
			end;
		finally
			MDBModule.CopDBClose(ddCopDB);
		end;
	except
		raise Exception.Create('会社DB生成失敗');
	end;

	Result:=True;
end;


//**********************************************************************
//		Component	:MTab
//		Event		:Change
//		Proccess	:ﾀﾌﾞ状態変更
//		Name		:T.Aoki
//		Date		:01/03/23
//		Proccess	:
//		Parameter	:
//		History		:02/03/13
//					:ﾌｧﾝｸｼｮﾝﾊﾞｰのｸﾘｱ
//					:+親子間ﾊﾟﾗﾒｰﾀのﾌｧﾝｸｼｮﾝﾊﾞｰｷｬﾌﾟｼｮﾝのｸﾘｱを追加
//**********************************************************************
procedure THAP000010BaseF.MTabChange(Sender: TObject);
var
	ClickNo	: integer;
begin
	if m_bErrClose then exit;

	ClickNo:=MTab.Items.Selected;

	//同じﾀﾌﾞをｸﾘｯｸ(切替不要)
	if arrLoadBplNo[ActiveChildPos]=ClickNo then
		Exit;

	svActiveChildPos := ClickNo;

	//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｱ
	if PAPParent.Enabled then
	begin
		FuncBar.CopyFuncData(arrFuncBar00);
		HapApParam.SetFuncCaption(arrFuncBar00);
	end
	else
	begin

		if arrChildInfo[arrLoadBplNo[svActiveChildPos]].iPrgId = 100000 then	// 共通情報の時
		begin
			if not m_bModify then							// 登録系追加修正権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー,0';
				arrFuncBar[6]	:= 'F7 社員No変更,0';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else if not m_bPrmDelete then					// 削除権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除';
			end;
		end
		// <MYN>
		else if arrChildInfo[arrLoadBplNo[svActiveChildPos]].iPrgId = 100010 then	// 基本情報の時
		begin
			if m_bUsePGChgDlg then							// 支給グループ変更ダイアログ使用
			begin
				if not m_bModify or								// 登録系追加修正権限
					(m_MYN.AccType = MYNACCESS_TYPE_NONE) then	// 個人番号権限なし（初期処理後のエラー対応）
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更,0';
				end
				else
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更';
				end;
			end
			else
			begin
				arrFuncBar[5]	:= '';
				arrFuncBar[6]	:= '';
				arrFuncBar[7]	:= '';
			end;
		end
		else
		begin
			arrFuncBar[5]	:= '';
			arrFuncBar[6]	:= '';
			arrFuncBar[7]	:= '';
		end;

		FuncBar.CopyFuncData(arrFuncBar);
		HapApParam.SetFuncCaption(arrFuncBar);
	end;

	//2重読み込みしない

	//前面の子APに終了通知
	if PAPParent.Enabled then
	begin
		HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_EXIT,
												@HapApParam		);
	end
	else
	begin
		fnAfterTabClick;
	end;

	{この間の子APからの結果はOwnerEntryに返される}
	{fnAfterTabClick実行}

	gbExitFromChild:=False;	//KeyDownﾌﾗｸﾞをOff
end;


//***********************************************************************
//		Component	:MTab
//		Event		:Enter
//		Proccess	:ﾀﾌﾞ ﾌｫｰｶｽ取得
//		Name		:T.Aoki
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
procedure THAP000010BaseF.MTabEnter(Sender: TObject);
begin
	if m_bErrClose then exit;

	ACCtrl:=Sender as TWinControl;
	EnterFlg:=True;

	if PAPParent.Enabled then
	begin
		FuncBar.CopyFuncData(arrFuncBar00);
	end
	else
	begin
		FuncBar.CopyFuncData(arrFuncBar);
	end;
end;


//**********************************************************************
//		Proccess	:底部(ﾎﾞﾀﾝ群)ﾊﾟﾈﾙ使用可/不可
//		Name		:T.Aoki
//		Date		:01/03/28
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnBottomPanelEnable(bEnable:Boolean);
begin
	BUpdate.Enabled	:= bEnable;			// 更新
	BCancel.Enabled	:= bEnable;			// 取消

// タブが使えないならNextボタンはデフォルト設定
	if not MTab.Enabled then
		Exit;

	//使用可にするかどうかは現在のﾀﾌﾞ位置による
	//次前ﾎﾞﾀﾝ 使用可/不可状態 変更

	BNext.Enabled:=
		(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfEnd))and
		(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));
	BBack.Enabled:=
		(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfTop))and
		(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));
end;

procedure THAP000010BaseF.FormResize(Sender: TObject);
begin
end;

//**********************************************************************
//		Proccess	:社員選択ﾊﾟﾈﾙへ戻る
//		Name		:T.Aoki
//		Date		:01/03/27
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnTopBplSelect;
var
	iRet	: integer;
begin
	try
		//先頭ﾀﾌﾞ内容を表示している?
		if arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfTop)then
		begin
			//先頭ﾀﾌﾞ内容を読み込んでいる?
			ActiveChildPos	:= fnChildBplFind(cfTop);
			HapApIF[svActiveChildPos].ChildBplAction(HAPAP_ACTID_DISABLE);
			HapApIF[svActiveChildPos].ChildBplAction(ACTID_HIDESTART);
			HapApIF[ActiveChildPos	].ChildBplAction(ACTID_SHOWSTART);

		end;

		HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_DISABLE);

		//内容表示
		iRet:=HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SHOWDATA,
														@HapApParam			);

		if iRet<>ACTID_RET_OK then
			Abort;

		with MTab do
		begin
			OnChange		:= nil;							// ｲﾍﾞﾝﾄ切り離し
			OnEnter			:= nil;							// ｲﾍﾞﾝﾄ切り離し
			Items.Selected	:= fnChildBplFind(cfTop);		// 選択状態のみ変更
			OnChange		:= MTabChange;					// ｲﾍﾞﾝﾄ再割り当て
			OnEnter			:= MTabEnter;					// ｲﾍﾞﾝﾄ再割り当て
		end;
	except
		raise Exception.Create('先頭ﾀﾌﾞ切替失敗');
	end;
end;

//**********************************************************************
//		Process		:ｵﾌﾞｼﾞｪｸﾄ生成
//		Name		:T.Aoki
//		Parameter	:
//		Return		:True	:成功
//					:False	:失敗
//		History		:03/02/13(T.Aoki)
//					:MPrnSupportを削除
//**********************************************************************
function THAP000010BaseF.fnObjectCreate:Boolean;
var
	i	: Integer;
begin
	Result:=False;

	mqMA			:= nil;				// 会社情報
	mqKM			:= nil;				// 会社情報
	mqSY			:= nil;				// 社員情報
	mqSC			:= nil;				// 社員
	mqSLK			:= nil;				// 社員ﾛｯｸ
	HapApParam		:= nil;				// AP間ﾊﾟﾗﾒｰﾀ

	HapSYExpParam	:= nil;				// 検索Expﾊﾟﾗﾒｰﾀ
	HapSYExpIF		:= nil;				// 社員 検索Exp I/F
	MPrnDlgF		:= nil;				// 印刷ﾀﾞｲｱﾛｸﾞ
	MPreview		:= nil;				// 印刷ﾌﾟﾚﾋﾞｭｰ
	slCondition		:= nil;				// 検索ﾀﾞｲｱﾛｸﾞﾊﾟﾗﾒｰﾀ

	mqMA:=TMQuery.Create(Self);			// 会社情報
	if not Assigned(mqMA) then
		Exit;

	mqKM:=TMQuery.Create(Self);			// 会社情報
	if not Assigned(mqKM) then
		Exit;

	mqSY:=TMQuery.Create(Self);			// 社員情報
	if not Assigned(mqSY) then
		Exit;

	mqSC:=TMQuery.Create(Self);			// 社員
	if not Assigned(mqSC) then
		Exit;

	mqSLK:=TMQuery.Create(Self);		// 社員ﾛｯｸ
	if not Assigned(mqSLK) then
		Exit;

	HapApParam:=THapApParam.CreateParam;// AP間ﾊﾟﾗﾒｰﾀ
	if not Assigned(HapApParam)then
		Exit;

	HapSYExpParam:=THapSYExpParam.CreateParam;
	if not Assigned(HapSYExpParam)then
		Exit;

	HapSYExpIF:=THapSYExpIF.Create;		// 社員 検索Exp I/F
	if not Assigned(HapSYExpIF)then
		Exit;

	MPrnDlgF:=TMjsPrnDlgF.Create(Self);	// 印刷ﾀﾞｲｱﾛｸﾞ
	if not Assigned(MPrnDlgF)then
		Exit;

	MPreview:=TMjsPreviewIF.Create;		// 印刷ﾌﾟﾚﾋﾞｭｰ
	if not Assigned(MPreview)then
		Exit;

	slCondition:=TStringList.Create;	// 指定条件
	if not Assigned(slCondition)then
		Exit;

	// AP間ｲﾝﾀｰﾌｪｰｽ初期化
	for i := 0 to 29 do
	begin
		HapApIF[i]:= nil;
		HapApIF[i]:=THapApIF.Create;
		if not Assigned(HapApIF[i])then
			Exit;
	end;

	Result:=True;
end;

//**********************************************************************
//		Process		:ｵﾌﾞｼﾞｪｸﾄ生成
//		Name		:T.Aoki
//		Parameter	:
//		Return		:True	:成功
//					:False	:失敗
//		History		:03/02/13(T.Aoki)
//					:MPrnSupportを削除
//**********************************************************************
procedure THAP000010BaseF.fnObjectFree;
var
	i	: Integer;
begin

	slCondition.Free;					// 指定条件
	slCondition:=nil;

	mqSLK.Free;							// 社員ﾛｯｸ
	mqSLK:= nil;

	mqSC.Free;							// 社員
	mqSC:= nil;

	mqSY.Free;							// 社員情報
	mqSY:= nil;

	mqKM.Free;							// 会社情報
	mqKM:= nil;

	mqMA.Free;							// 会社情報
	mqMA:= nil;

	HapApParam.Free;					// AP間ﾊﾟﾗﾒｰﾀ
	HapApParam:=nil;

	for i := 0 to 29 do
	begin
		HapApIF[i].Free;				// AP間ｲﾝﾀｰﾌｪｰｽ1～29
		HapApIF[i]:=nil;
	end;

	HapSYExpParam.Free;					// 検索Expﾊﾟﾗﾒｰﾀ
	HapSYExpParam:=nil;

	HapSYExpIF.Free;					// 社員 検索Exp I/F
	HapSYExpIF:=nil;

	MPrnDlgF.Free;						// 印刷ﾀﾞｲｱﾛｸﾞ
	MPrnDlgF:=nil;

	MPreview.Free;						// 印刷ﾌﾟﾚﾋﾞｭｰ
	MPreview:=nil;

	//----------------------------------------------
	// 権限管理・決算更新区分管理モジュール 解放
	//----------------------------------------------
	if ( m_HAPPerms <> nil ) then
	begin
		m_HAPPerms.Free;
	end;

end;

//**********************************************************************
//		Process		:社員No変更ﾀﾞｲｱﾛｸﾞ呼出
//		Name		:T.Aoki
//		Date		:01/06/08
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnCallChgDlg;
begin
	with SYDBModule do
	begin
		if not EmpNoChange then
			Exit;

		//再表示
		fnTopPanelSet;
		//子AP
		HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));
		HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
		//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SHOWDATA,
												@HapApParam			);

		if giEmpAttr = 2 then			//フリーコード
			ESEmpNo.SelectAll
		else
			ENEmpNo.SelectAll;
	end;
end;


//**********************************************************************
//		Process		:削除ﾀﾞｲｱﾛｸﾞ呼出
//		Name		:T.Aoki
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnCallDelDlg;
begin
	//社員なし
	if SYDBModule.IsEmpty then
		Exit;

	SYDBModule.ShowEmpDeleteDialog(Trunc(SYDBModule.GetFld('NCode').AsFloat));

//<130416>↓
	//if not SYDBModule.Delete then
	//	Exit;
//<130416>↑

	LSyainCount.Caption:=fnNumEdit(SYDBModule.GetCount,13);

	if SYDBModule.GetCount=0 then
	begin
		if giEmpAttr = 2 then			// フリーコード
			ESEmpNo.Text := ''
		else
			ENEmpNo.Value:=0;

		MTab.Enabled:=False;
		//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
		BNext.Enabled:=False;
		Bback.Enabled:=False;
		fnTopPanelClear;
		SYDBModule.FusenClear;

        // <DRILD>
        if m_bDrillDown then
        begin
        	Close;
            Exit;
        end;
	end
	else
	begin
		fnTopPanelSet;
		HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));
		HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
		HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SHOWDATA,
												@HapApParam				);
	end;

	if giEmpAttr = 2 then				//フリーコード
		ESEmpNo.SelectAll
	else
		ENEmpNo.SelectAll;
end;

// <MYN>
//**********************************************************************
//      Process     : 支給グループ変更ダイアログ呼出
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2015/07/23
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnCallPGChgDlg;
var
	bRet: Boolean;
begin
	with SYDBModule do
	begin
		bRet := EmpPayGroupChg(m_HAPMyNum);

		if m_MYN.AccType = MYNACCESS_TYPE_NONE then	// 個人番号権限なし（ダイアログ内でのエラー対応）
		begin
			arrFuncBar[7]	:= 'F8 支給G変更,0';
			FuncBar.CopyFuncData(arrFuncBar);
		end;

		if bRet then
		begin
			//再表示
			fnTopPanelSet;
			//子AP
			HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));
			HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
			//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
			HapApIF[ActiveChildPos].ChildBplAction(	HAPAP_ACTID_SHOWDATA,
													@HapApParam			);

			if giEmpAttr = 2 then			//フリーコード
				ESEmpNo.SelectAll
			else
				ENEmpNo.SelectAll;
		end;
	end;
end;

//**********************************************************************
//		Component	:MTab
//		Event		:Exit
//		Name		:T.Aoki
//		Date		:01/07/04
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.MTabExit(Sender: TObject);
begin
	if m_bErrClose then exit;

	// ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
	if not HapActiveControlOnForm(Self) then
		Exit;		// 以下不要
end;

procedure THAP000010BaseF.WMSetFocus(var Msg: TMsg);
begin
end;

//**********************************************************************
//		Component	: Timer
//		Event		: OnTimer
//		Memo		: AnotherCall 呼び出し遅延（デスクトップ不具合回避）
//**********************************************************************
procedure THAP000010BaseF.YoyakuTimerTimer(Sender: TObject);
begin
	YoyakuTimer.Enabled := FALSE;
//<2020-09-09>MOD St
//	HapAnotherCall(pAppRec,3210,0,100300,nil);				// 予約入力 Another呼出
	HapAnotherCall(pAppRec,pAppRec^.m_iSystemCode,0,100300,nil);
//<2020-09-09>MOD Ed
end;

//**********************************************************************
//		Component	:BEnter
//		Event		:Click
//		Process		:[↓]ﾎﾞﾀﾝClick
//		Name		:T.Aoki
//		Date		:01/11/21
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.BEnterClick(Sender: TObject);
begin

	// ﾒﾆｭｰ等外部のﾌｫｰﾑにﾌｫｰｶｽがある状態でClick
	if Screen.ActiveForm<>Self then
	begin
		if giEmpAttr = 2 then			// フリーコード
			MjsSetFocus(Self,ESEmpNo.Name)					// 社員Noにﾌｫｰｶｽ=自分をActiveにする
		else
			MjsSetFocus(Self,ENEmpNo.Name);
	end;

	keybd_event(VK_RETURN,0,0,0)
end;

//**********************************************************************
//		Process		:数値編集
//		Date		:01/11/21
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnNumEdit(vNum:variant;iLength:integer):string;
var
	e:extended;
begin
	e:=vNum;
	Result:=Format('%'+IntToStr(iLength)+'.0n',[e]);
end;

//**********************************************************************
//	↓選択ﾓｼﾞｭｰﾙに組み込む?
//**********************************************************************
//**********************************************************************
//		Process		:ﾎﾞﾀﾝ表示/非表示切替
//		Name		:T.Aoki
//		Date		:01/12/05
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnBtnVisible(bVisible:boolean);
var
	i,j,
	cnt	: integer;
begin
	for i:=0 to ComponentCount-1 do
	begin
		if Components[i] is TSpeedButton then
			(Components[i] as TSpeedButton).Visible:=bVisible
		else if Components[i] is TBitBtn then
		begin
			//次へ/前へ
			if(bVisible)and
			  (((Components[i] as TBitBtn)=BNext)or
			   ((Components[i] as TBitBtn)=BBack))then
			begin
				cnt:=0;
				for j:=0 to Length(arrChildInfo)-1 do
					if arrChildInfo[j].bSelected then
						Inc(cnt);
				(Components[i] as TBitBtn).Visible:=(bVisible and(cnt>1));
			end
			else
				(Components[i] as TBitBtn).Visible:=bVisible;
		end;
	end;

	TBtn.Enabled := m_bModify;
	for i := 0 to PMenu.Items.Count-1 do
	begin
		PMenu.Items[i].Enabled := m_bModify;
	end;

	btnMask.Visible := False;	// <MYN> 現在は親側の番号表示ボタンは非表示
end;


//**********************************************************************
//		Component	:BPrint
//		Event		:Click
//		Proccess	:印刷ﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/29
//		Parameter	:
//					:
//		Return		:
//		History		:2002/07/11(T.Aoki)
//					:傷病休暇管理台帳(HAP100069)を追加
//					:2002/09/12(T.Aoki)
//					:傷病休暇管理台帳(HAP100069)を削除
//					:03/02/13(T.Aoki)
//					:MPrnSupportをﾛｰｶﾙ取得/解放
//					:04/08/04(T.Aoki)
//					:印刷ﾀﾞｲｱﾛｸﾞ(在職/支払形態区分ﾁｪｯｸBOXあり)に対応
//					:04/08/20(T.Aoki)
//					:印刷ﾀﾞｲｱﾛｸﾞ(在職/支払形態区分ﾁｪｯｸBOXあり)のﾊﾟﾗﾒｰﾀ追加(社内経歴用)に対応
//**********************************************************************
procedure THAP000010BaseF.BPrintClick(Sender: TObject);
var
	HapPrnDlgF	: THapPrnDlgSpF;

	HapPrnSupport:THapPrnSpSupport;
	Ret			: TModalResult;
	i,iRet		: integer;

	sBplPath,
	sBplName	: string;

	mh			: HModule;
	pAppEntry	: function (p:pointer):integer;

	ApParam		: TAppParam;
	PrnParam	: THapPrnParam;

	pPrnAppRec	: ^TMjsAppRecord;

	iSvPage,
	iSvDate,
	iSvKaishaCode,
	iSvKaishaName: Integer;

	MPrnSupport	: TMjsPrnSupport;		// 印刷補助

	i100CHK		: shortInt;

	sRefDate	: String;
begin

	// 共通設定
	for i:=0 to Length(HapPrnDlgInfo)-1 do
	begin
		with HapPrnDlgInfo[i] do
		begin
			// 所属毎に改頁
			// 単票型除く
			// 離職証明書転記資料は所属毎の改頁無し...
			//
			if iListId = 100091 then
				bPageBreakShow := False
			else
				// 労働者名簿(100095)は所属改ページしない
				bPageBreakShow := ((iListId<>000051)and(iListId<>100070)and(iListId<>100072)and(iListId<>100095));

			// 本日変更分
			bTodayOnlyShow	:=True;

			// 合計
			iSum	:=HAPPRN_SUM_SYAIN;

			// 出力順
			iOrder	:=	HAPPRN_ODR_SYAIN
					+	HAPPRN_ODR_SYOZOKU
					+	HAPPRN_ODR_KANA;

			// 住民税登録リストに『地区順』追加』
			if iListId = 100084 then
				iOrder	:= iOrder + HAPPRN_ODR_CITY;

			//ﾃﾞﾌｫﾙﾄ出力順
			case m_iPrintOrder of
				0:	iDefOrder:=HAPPRN_ODR_TAIKEI;
				1:	iDefOrder:=HAPPRN_ODR_SYAIN;
				2:	iDefOrder:=HAPPRN_ODR_KANA;
			end;

			//直接印刷有無ﾁｪｯｸBOX
			with PrintOut do
			begin
				bVisible:=FALSE;
				bChecked:=FALSE;
			end;

			// 人事給与印刷条件ダイアログ 部門権限管理条件
			// 共通情報とセグメント情報を除く
			// 共通系も部門権限管理を行う
			With EmpSQL do	
			begin
				bUse	:= TRUE;
				sWHERE	:= '((CHG.DeptNCode in (' +m_sBmCd+ ')) or (ISNULL(CHG.DeptNCode,0) = 0))';
			end;

			With DeptSQL do
			begin
				bUse	:= TRUE;
				sWHERE	:= '((DeptNCode in (' +m_sBmCd+ ')) or (ISNULL(DeptNCode,0) = 0))';
			end;

//<2017-10-04> S
			SetLength(arrExtFree, 0);

			// 社員年末調整情報確認表
			if iListId = 100100 then
			begin
				//会社管理情報取得--------------------
				i100CHK	:= 0;
				with mqMA do
				begin
					Close;
					with SQL do
					begin
						Clear;
						Add('SELECT'						);
						Add('ISNULL(NumData,0) as NumData'	);
						Add('FROM HAPCTL'					);
						Add('WHERE KeyNoA=10 AND KeyNoB=102 AND KeyNoC=1');
					end;
					try
						Open(True);
						if not Eof then
							i100CHK	:= GetFld('NumData').AsInteger;
					except
						MjsMessageBox(nil,'管理情報取得に失敗しました。',mjError,mjDefOK);
					end;
				end;

				SetLength(arrExtFree,1);

				arrExtFree[0].iFreeType	:= HAPPRN_EXT_CHKBOX;
				arrExtFree[0].iFreeInt	:= 1;									// CheckBox1
				arrExtFree[0].sFreeStr	:= '摘要欄に扶養を出力する';

				SetLength(arrExtFree[0].aFreeInt,2);
				arrExtFree[0].aFreeInt[HAPPRN_EXT_CHKBOX_ENA]	:= 1;			// 1:True
				arrExtFree[0].aFreeInt[HAPPRN_EXT_CHKBOX_DEF]	:= i100CHK;		// HAPCTL
			end
//<2017-10-04> E

		end;
	end;


//ﾀﾞｲｱﾛｸﾞ呼出
	try
		HapPrnDlgF:=THapPrnDlgSpF.CreateForm(pAppRec);
		try
			Ret:=HapPrnDlgF.DoDlg(HapPrnDlgInfo,@HapPrnSupport);
		finally
			HapPrnDlgF.Free;
		end;
	except
		raise Exception.Create('給与印刷ﾀﾞｲｱﾛｸﾞの呼出に失敗しました。');
	end;

	if Ret<>mrOk then					// 印刷ｷｬﾝｾﾙ
		Exit;


	try
//MJS印刷ﾀﾞｲｱﾛｸﾞ

		MPrnSupport:=TMjsPrnSupport.Create;

		HapGetPrnInfo(pAppRec,MPrnSupport,Self);

		//BPL名合成
		sBplName:='HAP'+Format('%.6u',[HapPrnSupport.iListId])+'P.bpl';
		//ﾊﾟｽ合成
		sBplPath	:= recCommon.SysRoot
				+ '\'+ recSystem.SysPrefix
				+ '\Prg\'
				+ sBplName
				;

		//社員選択不可にする
		PnlTop.Enabled:=False;

		//BPLﾛｰﾄﾞ
		mh:=LoadPackageHelper(sBplPath);

		New(pPrnAppRec);
		pPrnAppRec^:=pAppRec^;			// ﾒﾆｭｰから受け取った内容をｺﾋﾟｰ

		try
			//AppEntryｱﾄﾞﾚｽ取得
			pAppEntry:=GetProcAddress(mh,'AppEntry');
			if @pAppEntry=nil then
				Abort;

			ApParam.pRecord:=pointer(pPrnAppRec);
			with PrnParam do
			begin
				MPrev		:= MPreview;					// ﾌﾟﾚﾋﾞｭｰ
				MDlgF		:= MPrnDlgF;					// Mjs印刷ﾀﾞｲｱﾛｸﾞ
				MPrnSpt		:= MPrnSupport;					// MJS印刷ﾀﾞｲｱﾛｸﾞ指定情報
				HapPrnSpt	:= HapPrnSupport;				// 給与印刷ﾀﾞｲｱﾛｸﾞ指定情報
			end;

			//データ件数を-1で初期化する（データ件数取得処理が行われたか判定する為）
			PrnParam.m_iTAPData := -1;

			PrnParam.pMenuAppRec:=pointer(pAppRec);

			ApParam.pActionParam:=@PrnParam;

			ApParam.iAction	:=ACTID_FORMCREATESTART;
			if pAppEntry(@ApParam)=ACTID_RET_NG then
				Abort;

			try
				//データ件数取得処理が行われている場合
				if PrnParam.m_iTAPData <> -1 then
				begin
					if PrnParam.m_iTAPData = 0 then
					begin
						MjsMessageBox(nil, '印刷ﾃﾞｰﾀが存在しません。',mjwarning,mjdefOK);
						exit;
					end;
				end;

				with MPrnSupport do
				begin
					pApRec		:= pAppRec;
					//出力ﾌｧｲﾙﾊﾟｽ
					strFileName	:= recCommon.SysCliRoot+'\tmp\';

//<RefDay> S
					// 基準日指定している場合に基準日指定可能帳票のCSVファイル名に日付を付加する。
					sRefDate	:= '';
					if (HapApParam.GetRefType > 0) and (HapPrnDlgInfo[HapPrnSupport.iListIndex].RefType > 0) then
						sRefDate	:= '_' +FormatDateTime('YYYYMMDD',HapApParam.GetRefDate);
//<RefDay> E

					strFileName	:= strFileName+HapPrnDlgInfo[HapPrnSupport.iListIndex].sListName+sRefDate+'.csv';
					strDocName	:= HapPrnDlgInfo[HapPrnSupport.iListIndex].sListName;
					//ﾌｧｲﾙ出力ﾎﾞﾀﾝ表示
					pComArea	:= @recCommon;
					MDataModule	:= MDBModule;
					iSysCode	:= pAppRec^.m_iSystemCode;
//<121212>↓
					//iReportID	:= 990100;

					//労働者名簿の帳票グループを「990100」から「990200」に変更
					if (HapPrnSupport.iListId = 100095) then
					begin
						iReportID	:= 990200;
					end
					else
					begin
						iReportID	:= 990100;
					end;
//<121212>↑

					//@@@@@ 2003/01/27 by t.k @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					// 離職証明書転記資料は出力条件が他と違う...
					//
					// この作り（MjsPrnSupportを使い回す）作りだとﾊﾞｸﾞが
					// 発生する可能性が高い。
					// MjsPrnSupportは、毎回、初期化して使う事をお勧めする。
					//
					iSvPage			:= iPage;
					iSvDate			:= iDate;
					iSvKaishaCode	:= iKaishaCode;
					iSvKaishaName	:= iKaishaName;

					if HapPrnSupport.iListId = 100091 then
					begin
//<121218>↓
						//iDspFileBtn			:= 0;
						iDspFileBtn			:= 1;
//<121218>↑
						iDspOfficeBtn		:= 1;
						iEnableDateCombo	:= 1;
						iEnablePageCombo	:= 1;
						iEnableCorpCodeCombo:= 1;
						iEnableCorpNameCombo:= 1;
						iDefaultPaperSize	:= DMPAPER_A4;

						iPage				:= 0;
						iDate				:= 0;
						iKaishaCode			:= 0;
						iKaishaName			:= 0;
						pPage				:= nil;
						pDate				:= nil;
						pCorpCode			:= nil;
						pCorpName			:= nil;
						pAccountOffice		:= nil;
					end
					// 労働者名簿
					else if HapPrnSupport.iListId = 100095 then
					begin
						iDspFileBtn			:= 0;			// ファイル出力なし
						iDspOfficeBtn		:= 0;
						iEnableDateCombo	:= 0;
						iEnablePageCombo	:= 0;
						iEnableCorpCodeCombo:= 0;
						iEnableCorpNameCombo:= 0;
						//iDefaultPaperSize	:= DMPAPER_B4;
						iDefaultPaperSize	:= DMPAPER_A4;	//<130829>
					end
					else
					begin
						iDspFileBtn			:= 1;			// ４次リリースファイル出力有効
						iDspOfficeBtn		:= 0;
						iEnableDateCombo	:= 0;
						iEnablePageCombo	:= 0;
						iEnableCorpCodeCombo:= 0;
						iEnableCorpNameCombo:= 0;
						iDefaultPaperSize	:= DMPAPER_B4;
					end;

					// csv抽出権限
					if not m_bPrmExtract then
						iDspFileBtn		:= 0;

					iRet:=MPrnDlgF.DoDlg(MPrnSupport);

					iPage		:= iSvPage;
					iDate		:= iSvDate;
					iKaishaCode	:= iSvKaishaCode;
					iKaishaName	:= iSvKaishaName;

					//ｷｬﾝｾﾙ以外
					if(iRet>0)and
					  ((iCommand=PDLG_PRINT)or
					   (iCommand=PDLG_PREVIEW)or
					   (iCommand=PDLG_FILE))then
					begin
						ApParam.iAction	:=HAP_ACTID_PRINTSTART;
						if pAppEntry(@ApParam)=ACTID_RET_NG then
							Abort;
					end;
				end;
			finally
				//ﾌｫｰﾑ解放
				ApParam.iAction:=ACTID_FORMCLOSESTART;
				pAppEntry(@ApParam);
			end;
		finally
			Dispose(pPrnAppRec);

			//ﾛｰﾄﾞﾓｼﾞｭｰﾙ解放
			UnLoadPackageHelper(mh);

			MPrnSupport.Free;

			//社員選択可+ﾌｫｰｶｽ[社員No]に戻す
			PnlTop.Enabled:=True;

			if giEmpAttr = 2 then
				MjsSetFocus(Self,ESEmpNo.Name)
			else
				MjsSetFocus(Self,ENEmpNo.Name);
		end;
	except
		raise Exception.Create('印刷処理で不具合が発生しました。');
	end;

end;


//**********************************************************************
//		Process		:帳票情報初期処理
//		Name		:T.Aoki
//		Date		:02/03/02
//		Parameter	:
//		Return		:
//		Histyory	:06/10/24(Y.Kondo)
//					:<06-10-24> 人事給与共通社員登録対応
//**********************************************************************
procedure THAP000010BaseF.fnPrintInfoIni;
var
	i,
	iId		: Integer;
	sCode	: String;
begin

//帳票情報
	sCode := '';
	for i:=0 to Length(arrChildInfo)-1 do
	begin
		with arrChildInfo[i]do
		begin
			// 現在タブに表示されている処理の確認
			if not bSelected then
				continue;

			if Length(sCode) > 0 then
				sCode := sCode + ',';

			sCode	:= sCode + IntToStr(arrChildInfo[i].iPrgCode);
		end;
	end;

	SetLength(HapPrnDlgInfo,0);

	with mqMA do
	begin
		try
			try
				Close;
				SQL.Clear;
				SQL.ADD( 'SELECT DISTINCT ETM.DispOrder, ETL.PrgID, ETL.Param, ETL.PrgTagName, ETL.GroupNo, ETL.ListNo, ETL.RefDay'
						+ ' FROM HAPETM ETM'
						+ ' JOIN HAPETL ETL ON ETM.PrgCode = ETL.PrgCode');

				if m_bDefTab then		//設定がデフォルト指定の場合
				begin
					SQL.Add( ' JOIN HAPETB ETB ON ETM.PrgCode = ETB.PrnPrgCode'
							+' WHERE ETM.PatternNo = 0'
							+ ' AND ETM.MenuPara = :hMenuP'
							+ ' AND ETM.DispType = 1'
							+ ' AND ETB.PrgCode in ('+sCode+')'
							+ ' AND (((ETL.LicKbn & '+IntToStr(fnSysKbnCheck)+') > 0) or (ETL.LicKbn = 0))');
				end
				else
				begin
					SQL.ADD( ' JOIN HAPETG ETG ON ETM.PatternNo = ETG.PatternNo'
							+' JOIN HAPETB ETB ON ETM.PrgCode = ETB.PrnPrgCode'
							+ ' WHERE ETG.ComCode = 0'
							+	' AND ETG.GrpNo = (SELECT TOP 1 GrpNo FROM MOS_OFFICE_STFGRP_STAFF WHERE TantoNCD = :hTanto ORDER BY GrpNo)'
							+	' AND ETM.MenuPara = :hMenuP'
							+	' AND ETM.DispType = 1'
							+	' AND ETB.PrgCode in ('+sCode+')'
							+	' AND (((ETL.LicKbn & '+IntToStr(fnSysKbnCheck)+') > 0) or (ETL.LicKbn = 0))');

					SetFld('hTanto').AsString	:= IntToStr(recCommon.TantoNCD);
				end;

// <RefDay> S
				// 基準日指定してある場合に基準日指定帳票に絞り込む
				if HapApParam.GetRefType > 0 then
					SQL.Add(	' AND ETL.RefDay = 1');
// <RefDay> E

				SQL.Add(' ORDER BY ETM.DispOrder');

				SetFld('hMenuP').AsInteger	:= m_iParam;
				OPEN(TRUE);

				while not EOF do
				begin

					iId	:= GetFld('PrgID').AsInteger;
					if fnPrintBplExists(iId) then
					begin
						SetLength(HapPrnDlgInfo,Length(HapPrnDlgInfo)+1);
						with HapPrnDlgInfo[Length(HapPrnDlgInfo)-1] do
						begin
							sListName	:= GetFld('PrgTagName').AsString;
							iListId		:= iId;
							iListPara	:= GetFld('Param').AsInteger;

							iGroupNo	:= GetFld('GroupNo').AsInteger;
							iListNo		:= GetFld('ListNo').AsInteger;

							if (iGroupNo = 0) and (iListNo = 0) then
							begin
								with Ena do
								begin
									iZaishoku:=HAP_ZAI_ALL;
									iShiharai:=HAP_SHR_ALL;
								end;
								with Def do
								begin
									iZaishoku:=HAP_ZAI_ALL;
									iShiharai:=HAP_SHR_ALL;
								end;
							end;

// <RefDay> S
// 給与帳票出力条件ダイアログに基準日情報を渡す
							if GetFld('RefDay').AsInteger =1 then
							begin
								RefType	:= HapApParam.GetRefType;
								RefDate	:= HapApParam.GetRefDate;
							end
							else
							begin
								RefType	:= 0;
								RefDate	:= 0;
							end;
// <RefDay> S

						end;
					end;

					Next;
				end;

			except
				Exit;
			end;
		finally
			mqMA.Close;
		end;
	end;

	BPrint.Enabled	:= (Length(HapPrnDlgInfo)>0)
    				 and m_bPrmPrint				// ロール権限付加
                     and not m_bDrillDown;			// ドリルダウン呼び出し以外 <DRILD>

end;

//************************************************************************************
//		Process		:起動時ｴﾗｰﾒｯｾｰｼﾞ
//		Name		:T.Aoki
//		Date		:02/03/02
//		Parameter	:
//		Return		:
//		History		:03/03/25(T.Aoki)
//					:給与手当/控除の項目数ﾁｪｯｸで
//					:・(社員一般-基礎給)を対象としていない不具合修正
//					:・社員特殊の項目数を求めて判定していない不具合修正
//					:  (固定なし/特殊設定だと手当/控除がｶﾞｰﾄﾞされ起動できない)
//					:03/10/28(T.Aoki)
//					:起動ﾁｪｯｸ中に[Esc]押下でAPが先に終了してから
//					:Msgが表示されOK押下でMjsDeskTopが終了する不具合
//************************************************************************************
procedure THAP000010BaseF.WMDispRun(var Msg: TMessage);
var
	i,
	iRet	: integer;
	sMsg	: string;
	mqCnt	: TMQuery;
	MsgRec	: TMjsMsgRec;
begin
	if m_bErrClose then
	begin
		bWMDispRunBfr:=False;
		Close;
		exit;
	end;
	//単体起動で会社設定によりNGの場合,ﾒｯｾｰｼﾞ
	sMsg:='';
	mqCnt:=TMQuery.Create(Self);
	try
		SYDbModule.SetDBInfoToQuery(mqCnt);
		mqCnt.Close;
		mqCnt.SQL.Clear;
		mqCnt.SQL.Add('SELECT COUNT(NCode) CNT FROM HAPSC'
					+ ' WHERE CorpNCode=0 AND SyokuchiKbn=0');					// Syokuchi以外
		try
			mqCnt.Open(true);
		except
			bWMDispRunBfr:=False;
			Close;
			raise Exception.Create('社員件数取得に失敗しました。');
		end;

		//社員未登録
		if mqCnt.GetFld('CNT').AsInteger=0 then
		begin
			for i:=0 to Length(arrChildInfo)-1 do
				//<141126>↓
				//社員登録/基本情報
				//if(arrChildInfo[i].iPrgId=100000)
				//or(arrChildInfo[i].iPrgId=100010)then
				//	break;

				//共通情報のみ起動可
				if (arrChildInfo[i].iPrgId = 100000) then
					break;
				//<141126>↑
			if i<Length(arrChildInfo)then
			begin
				bWMDispRunBfr:=False;
				Exit;
			end;

			//社員未登録
			GetMsg(MsgRec,100,2);
			Beep;
			with MsgRec do
				MjsMessageBoxEx(	Self,
									'社員'+sMsg,
									sTitle,
									icontype,
									btntype,
									btnDef,
									LogType		);
		end

		// 選択可能処理なし
		else if m_bMNCntZero then
		begin
			sMsg:=				'選択可能な処理がありません。';
			sMsg:=sMsg+#13#10+	'';
			sMsg:=sMsg+#13#10+	'OKボタンを押すと処理を終了します。';

			MjsMessageBox(Self,sMsg,mjWarning,mjDefOK);
		end

		//資格免許
		else if (arrParam[1]=30) and (arrMNCnt[_MN_SHIKAKU] = 0) then
		begin
			sMsg:=				'資格免許名が設定されていません。';
			sMsg:=sMsg+#13#10+	'導入処理～資格免許名登録で';
			sMsg:=sMsg+			'名称を登録できます。';
			sMsg:=sMsg+#13#10+	'';
			sMsg:=sMsg+#13#10+	'OKボタンを押すと処理を終了します。';

			MjsMessageBox(Self,sMsg,mjWarning,mjDefOK);
		end

		// 給与手当控除/単体起動/項目=0
		// 賞与手当控除/単体起動/項目=0
		else if((arrParam[0]=11)and(arrParam[1]=40)and(arrKMCnt[0]=0))or
			   ((arrParam[0]=11)and(arrParam[1]=50)and(arrKMCnt[1]=0))then
		begin
			sMsg:=				'該当する項目が設定されていません。';

{$IFDEF _HAP_MJSLINK_NX_I_}
			sMsg:=sMsg+#13#10+	'導入処理～計算項目登録・計算体系設定で';
{$ELSE}
			sMsg:=sMsg+#13#10+	'共通体系設定～計算項目登録・計算体系設定で';
{$ENDIF}

			sMsg:=sMsg+			'項目を設定できます。';
			sMsg:=sMsg+#13#10+	'';
			sMsg:=sMsg+#13#10+	'OKボタンを押すと処理を終了します。';

			MjsMessageBox(Self,sMsg,mjWarning,mjDefOK);
		end

		// 教育研修/起動/名称=0
		// 賞罰/起動/名称=0
		else if((arrParam[0]=3)and(arrMNCnt[_MN_KYOUIKU]=0)and(arrMNCnt[_MN_KENSYU]=0))or
			   ((arrParam[0]=4)and(arrMNCnt[_MN_HOUSYOU]=0)and(arrMNCnt[_MN_CHOBATSU]=0))then
		begin
			sMsg:=				'該当する名称が設定されていません。';
			sMsg:=sMsg+#13#10+	'導入処理～区分名称登録(拡張)で';
			sMsg:=sMsg+			'名称を登録できます。';
			sMsg:=sMsg+#13#10+	'';
			sMsg:=sMsg+#13#10+	'OKボタンを押すと処理を終了します。';

			MjsMessageBox(Self,sMsg,mjWarning,mjDefOK);
		end

		else if (m_iHanyo = 0) and (arrParam[1]=105) then
		begin
			sMsg:=				'汎用振込が設定されていません。';
			sMsg:=sMsg+#13#10+	'';
			sMsg:=sMsg+#13#10+	'OKボタンを押すと処理を終了します。';

			MjsMessageBox(Self,sMsg,mjWarning,mjDefOK);
		end

		else if(arrParam[0]=1)or(arrParam[0]=10)or(arrParam[0]=11)or(arrParam[0]=20)then
		begin
        	if not m_bDrillDown then // <DRILD> 条件追加（ドリルダウンのときは実行しない）
            begin
                iRet := HapReserveCheck(pAppRec,self);			// 予約入力件数確認
                if iRet > 0 then
                begin
                    // 予約入力呼出
                    sMsg:=				'予約反映日を経過した予約入力情報があります。';
                    sMsg:=sMsg+#13#10;
                //<2016-01-27>↓
                    //sMsg:=sMsg+#13#10+	'『給与計算』-『社員情報登録』-『予約入力』により';
                    sMsg:=sMsg+#13#10+	'『社員情報登録』-『予約入力』により';
                //<2016-01-27>↑
                    sMsg:=sMsg+#13#10+	'予約状況を確認してください。';

                    if HapGetPermit(pAppRec,3210,0,100300,atDisplay) then			// 予約入力[表示]権限確認
                    begin
                        sMsg:=sMsg+#13#10;
                        sMsg:=sMsg+#13#10+	'OKボタンを押すと『予約入力』処理を呼び出します。';

                        iRet := MjsMessageBoxEx(Self,sMsg,'確認',
                                                mjInformation,mjOkCancel,mjDefOk	);

                        if iRet = mrOk then
                            YoyakuTimer.Enabled := TRUE;							// Another呼び出しを遅延
    //						HapAnotherCall(pAppRec,3210,0,100300,nil);				// 予約入力 Another呼出
                    end
                    else
                    begin
                        MjsMessageBoxEx(Self,sMsg,'予約入力',mjInformation,mjOk,mjDefOk);
                    end;
                end;
			end;
			bWMDispRunBfr:=False;
			Exit;
		end
		else
		begin
			bWMDispRunBfr:=False;
			Exit;
		end;

		bWMDispRunBfr:=False;
		Close;
	finally
		mqCnt.Free;
	end;
end;

//**********************************************************************
//		Component	:EEmpNo
//		Event		:KeyDown
//		Process		:社員No ｷｰ押下ｲﾍﾞﾝﾄ
//		Name		:T.Aoki
//		Date		:02/03/07
//		Parameter	:
//		Return		:
//		History		:06/03/03 H.Takaishi (BUNTECHNO)
//					:F8社員削除を有効に
//**********************************************************************
procedure THAP000010BaseF.EEmpNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	arrFlg		: array[1..8] of boolean;
begin
	case Key of
		VK_F1,
		VK_F2,
		VK_F3,
		VK_F4,
		VK_F5,
		VK_F6,
		VK_F7,
		VK_F8:
		begin
			with FuncBar do
			begin
				GetFuncEnabledA(arrFlg);
				//GetFuncEnabledが怪しい?のでA付きを使用
				//使用不可状態なら抜け
				case Key of
					VK_F1:	if not arrFlg[1]then	exit;
					VK_F2:	if not arrFlg[2]then	exit;
					VK_F3:	if not arrFlg[3]then	exit;
					VK_F4:	if not arrFlg[4]then	exit;
					VK_F5:	if not arrFlg[5]then	exit;
					VK_F6:	if not arrFlg[6]then	exit;
					VK_F7:	if not arrFlg[7]then	exit;
					VK_F8:	if not arrFlg[8]then	exit;
				end;
			end;
		end;
	end;

	case Key of
		VK_F1:		// 表示順変更
			ChangeOrder;

		VK_F2:		// 処理選択
			fnCallSelDlg;

		VK_F3:		// 基準日指定		<RefDay>
			fnReferDay;

		VK_F6:		// 社員コピー
			fnCallCopyDlg;

		VK_F7:		//社員No変更
			fnCallChgDlg;

		VK_F8:		//社員削除 or 支給グループ変更
		begin
			// <MYN> 共通情報／基本情報で異なるファンクション呼び出し
			if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報
			begin
				fnCallDelDlg;			// 社員削除
			end
			else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 基本情報
			begin
				fnCallPGChgDlg;			// 支給グループ変更
			end;
		end;

	end;
end;


//**********************************************************************
//		Process		:最終更新日Up
//		Name		:T.Aoki
//		Date		:02/08/27
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
//  HAPSCのUPDATEが行なわれると、トリガによってmstHistoryにログが残される。
// （ログを残す必要のある更新の場合のみ－共通仕様）
//  ログ書き込みの際には、更新者の担当者内部コードを使用するので、更新日時の
//UpDateだけではあるが、担当者内部コードの更新もしておく。
//
//**********************************************************************
procedure THAP000010BaseF.fnRrefixDateUpd;					//最終更新日Up
var
	sSQL	: string;
	DQuery	: TMQuery;
begin
	sSQL:=			'UPDATE HAPSC SET';
	sSQL:=sSQL+#13#10' UpdDateTM=Now(),';
	sSQL:=sSQL+#13#10' UpdTantoNCode=' + IntToStr(recCommon.TantoNCD);
	sSQL:=sSQL+#13#10' WHERE CorpNCode=0';
	sSQL:=sSQL+#13#10' AND NCode='+IntToStr(m_iEmpNCode);

	// 自社に接続
	DQuery := TMQuery.Create( Self );
	MDBModule.SetDBInfoToQuery( ddCopDB, DQuery );

	with DQuery do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);
		ExecSQL(True);
	end;

	DQuery.Free();
end;


//**********************************************************************
//		Process		:印刷BPL存在ﾁｪｯｸ
//		Name		:T.Aoki
//		Date		:02/10/18
//		Parameter	:iId:印刷BPL ID
//		Return		:True	:存在する
//					:False	:存在しない
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnPrintBplExists(iId:integer):boolean;
var
	sBplPath	: string;
begin
	sBplPath := recCommon.SysRoot + '\' + recSystem.SysPrefix + '\prg10\'		//<D10-E017> prg→prg10
				+'HAP'+Format('%.6u',[iId]) + 'P.BPL';

	//子AP存在検索
	Result:=FileExists(sBplPath);
end;

//**********************************************************************
//		Process		:給与/賞与の手当/控除の項目数を取得
//		Name		:T.Aoki
//		Date		:03/03/26
//		Parameter	: iMode 0：給与/1：賞与
//		Return		:
//		History		:2010/11/15			<2010-11-15>
//					:速度改善対応
//**********************************************************************
procedure THAP000010BaseF.fnKMCntSet(iMode:ShortInt);
var
	sSQL	: string;
begin
	if arrKMCnt[iMode] >= 0 then		// 取得済
		Exit;

	//項目数取得
	//[0]給与基礎給+固定 [1]賞与項目
	try
		with mqKM do
		begin
			sSQL	:='SELECT'
						+' KM.Sort,'
						+' COUNT(*)AS KMCNT'
					+ ' FROM'
						+ ' HAPKM AS KM,'
						+ ' HAPKC AS KC '
					+ 'WHERE'
						+ ' KM.ItemNo = KC.ItemNo'
					+ ' AND KC.ItemUse = 1'
					+ ' AND KM.Sort = :hSORT'
					+ ' AND Sort2 in(2,3)'
					+ ' AND ((KC.Manage=5 AND KC.Common=1)'
						+'OR (KC.Manage IN(1,3))';

			if m_iaddin32 =1 then
			begin
				sSQL:= sSQL+'OR (KC.Manage=5 AND KC.Common IN(2,3,4,5))';
				sSQL:= sSQL+'OR (KC.Manage=4)';
			end;

			sSQL:=sSQL+')';

			sSQL:=sSQL+' AND KM.ItemUse=1';

			sSQL:=sSQL+' GROUP BY KM.Sort';

			try
				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				if iMode = 1 then		// 賞与
					SetFld('hSORT').AsInteger := 4			// 賞与
				else
					SetFld('hSORT').AsInteger := 3;			// 給与

				Open(True);

				arrKMCnt[iMode]	:= GetFld('KMCNT').AsInteger
			except
				raise Exception.Create('項目数のﾁｪｯｸに失敗しました。');
			end;
		end;
	finally
		mqKM.Close;
	end;
end;

//**********************************************************************
//		Process		:ログ書き込み用
//					:fnCall_LogProc
//		Parameter	:
//		Return		:
//					:
//**********************************************************************
procedure THAP000010BaseF.fnCall_LogProc;
begin

	with mqSLK do
	begin
		Close;
		SQL.Clear;
		SQL.Add('CALL MP200010(0,:hTANCD)');

//<D10-Stored> S
		//SetFld('hTANCD').AsString	:= IntToStr(recCommon.TantoNCD);
		SetFld('hTANCD').AsInteger	:= recCommon.TantoNCD;
//<D10-Stored> E

		ExecSQL;

		Close;

// 履歴プロシージャ
		SQL.Clear;
		SQL.Add('CALL MP_HAP_HistoryInit(0,:hTANCD)');

//<D10-Stored> S
		//SetFld('hTANCD').AsString	:= IntToStr(recCommon.TantoNCD);
		SetFld('hTANCD').AsFloat	:= recCommon.TantoNCD;
//<D10-Stored> E

		ExecSQL;

		Close;
	end;

end;


//**********************************************************************
//		Process		:資格/教育/研修/褒賞/懲罰の区分名称数を取得
//		Name		:Y.Kondo
//		Date		:06/03/29
//		Parameter	:MODE :[0]資格免許[1]教育[2]研修[3]褒賞[4]懲罰
//**********************************************************************
procedure THAP000010BaseF.fnMNCntSet(MODE: ShortInt);
var
	sSQL	: string;
begin
	//区分名称数取得
	try
		with mqKM do
		begin
			sSQL:=			 'SELECT';
			sSQL:=sSQL+#13#10' COUNT(KM.ItemNo)AS KMCNT';
			sSQL:=sSQL+#13#10'FROM';
			sSQL:=sSQL+#13#10' HAPKM AS KM,';
			sSQL:=sSQL+#13#10' HAPMNEx AS MN';
			sSQL:=sSQL+#13#10'WHERE';
			sSQL:=sSQL+#13#10'KM.ItemNo = MN.ItemNo';
			sSQL:=sSQL+#13#10'AND KM.ItemNo=:INO';
			sSQL:=sSQL+#13#10' AND';
			sSQL:=sSQL+#13#10' KM.ItemUse=1';

			Close;
			SQL.Clear;
			SQL.Add(sSQL);

			SetFld('INO').AsInteger	:= gaMNItemNo[MODE];

			try
				Open(True);
				arrMNCnt[MODE]:=GetFld('KMCNT').AsInteger;
			except
				raise Exception.Create('区分名称のﾁｪｯｸに失敗しました。');
			end;
			Close;
		end;
	finally
		mqKM.Close;
	end;
end;


//**********************************************************************
//		Process		: 予備区分名称数を取得
//		Name		: Y.Kondo
//		Date		: 20/11/20			<2020-11-20>
//**********************************************************************
function THAP000010BaseF.fnMNCntSet2: Boolean;
var
	sSQL	: string;
begin
	Result := FALSE;

	//区分名称数取得
	try
		with mqKM do
		begin
			sSQL:=			 'SELECT';
			sSQL:=sSQL+#13#10' COUNT(KM.ItemNo)AS KMCNT';
			sSQL:=sSQL+#13#10'FROM';
			sSQL:=sSQL+#13#10' HAPKM AS KM,';
			sSQL:=sSQL+#13#10' HAPMN AS MN';
			sSQL:=sSQL+#13#10'WHERE';
			sSQL:=sSQL+#13#10'KM.ItemNo = MN.ItemNo';
			sSQL:=sSQL+#13#10' AND KM.ItemNo in(120100,120200,120300,120400,120500,'	// 人事予備区分
											+ ' 120600,120700,120800,120900,121000,'
											+ ' 121100,121200,121300,121400,121500,'
											+ ' 121600,121700,121800,121900,122000,'
											+ ' 122010,122020,122030,122040,122050,'	// 人事予備区分21～40追加 <20220118>
											+ ' 122060,122070,122080,122090,122100,'
											+ ' 122110,122120,122130,122140,122150,'
											+ ' 122160,122170,122180,122190,122200,'
											+ ' 140100,140200,140300,140400,140500,'	// 計算区分
											+ ' 140600,140700,140800,140900,141000,'
											+ ' 141100,141200,141300,141400,141500,'
											+ ' 141600,141700,141800,141900,142000,'
											+ ' 142100,142200,142300,142400,142500,'	// 計算区分21～40追加 <20220118>
											+ ' 142600,142700,142800,142900,143000,'
											+ ' 143100,143200,143300,143400,143500,'
											+ ' 143600,143700,143800,143900,144000)';
			sSQL:=sSQL+#13#10' AND KM.ItemUse=1';

			Close;
			SQL.Clear;
			SQL.Add(sSQL);

			try
				Open(True);
				Result := GetFld('KMCNT').AsInteger > 0;
			except
				raise Exception.Create('（予備区分）区分名称のﾁｪｯｸに失敗しました。');
			end;
			Close;
		end;
	finally
		mqKM.Close;
	end;
end;


//**********************************************************************
//		Process		: 汎用振込みの件数取得
//		Name		: Y.Kondo
//		Date		: 07/06/11	<07-06-11>
//		Return		:
//**********************************************************************
procedure THAP000010BaseF.fnHanCntSet;
begin
	// 汎用振込数取得
	try
		with mqKM do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT HanFurikomi FROM HAPM2');
			try
				Open(True);
				m_iHanyo	:= GetFld('HanFurikomi').AsInteger;
			except
				raise Exception.Create('汎用振込数のﾁｪｯｸに失敗しました。');
			end;
		end;
	finally
		mqKM.Close;
	end;
end;


//**********************************************************************
//	Component	: MTab
//	Event		: KeyDown
//	Process		: MTab ｷｰ押下ｲﾍﾞﾝﾄ
//	Name		: Y.Kondo(TakumiCo.)
//	Date		: 08/02/20	<080220>
//**********************************************************************
procedure THAP000010BaseF.MTabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	arrFlg	: array[1..8] of boolean;
begin

	case Key of
		VK_F1,
		VK_F2,
		VK_F3,
		VK_F4,
		VK_F5,
		VK_F6,
		VK_F7,
		VK_F8:
		begin
			with FuncBar do
			begin
				GetFuncEnabledA(arrFlg);
				//GetFuncEnabledが怪しい?のでA付きを使用
				//使用不可状態なら抜け
				case Key of
					VK_F1:	if not arrFlg[1]then	exit;
					VK_F2:	if not arrFlg[2]then	exit;
					VK_F3:	if not arrFlg[3]then	exit;
					VK_F4:	if not arrFlg[4]then	exit;
					VK_F5:	if not arrFlg[5]then	exit;
					VK_F6:	if not arrFlg[6]then	exit;
					VK_F7:	if not arrFlg[7]then	exit;
					VK_F8:	if not arrFlg[8]then	exit;
				end;

			end;
		end;
	end;

	case Key of
		VK_F1:		// 表示順変更
			ChangeOrder;

		VK_F2:		// 処理選択
			fnCallSelDlg;

		VK_F3:		// 基準日指定 <RefDay>
			fnReferDay;

		VK_F6:		// 社員コピー
			fnCallCopyDlg;

		VK_F7:		// 社員No変更
			fnCallChgDlg;

		VK_F8:		// 社員削除 or 支給グループ変更
		begin
			// <MYN> 共通情報／基本情報で異なるファンクション呼び出し
			if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報
			begin
				fnCallDelDlg;			// 社員削除
			end
			else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 基本情報
			begin
				fnCallPGChgDlg;			// 支給グループ変更
			end;
		end;
	end;
end;


//**********************************************************************
//	Component	: PopupMenu N1
//	Event		: OnClick
//	Process		: ポップアップメニュー 《基準日指定》クリック
//	Date		: <RefDay>
//**********************************************************************
procedure THAP000010BaseF.N1Click(Sender: TObject);
begin
	fnReferDay(1);						// 基準日指定
end;

//**********************************************************************
//	Component	: PopupMenu N2
//	Event		: OnClick
//	Process		: ポップアップメニュー 《現在内容参照》クリック
//	Date		: <RefDay>
//**********************************************************************
procedure THAP000010BaseF.N2Click(Sender: TObject);
begin
	fnReferDay(2);						// 現在内容参照
end;

//**********************************************************************
//	Component	: PopupMenu N3
//	Event		: OnClick
//	Process		: ポップアップメニュー 《基準日変更》クリック
//	Date		: <RefDay>
//**********************************************************************
procedure THAP000010BaseF.N3Click(Sender: TObject);
begin
	fnReferDay(3);						// 基準日変更
end;

//**********************************************************************
//		Process		: 新規社員登録ダイアログ呼び出し
//		Name		: T.Shinoda
//		Date		: 08/02/19
//		Return		:
//**********************************************************************
function THAP000010BaseF.fnNewEmpDate(iMode : ShortInt) : Boolean;
var
	Dlg		: THAP000010StaffSelDlgF;
	iRet	: TModalResult;
begin

	//<MLX>では、新規社員登録ダイアログを通らずに新規社員を作る
{$IFDEF _HAP_MJSLINK_NX_I_}
	InsFlg	:= TRUE;

	m_iEmpNCode	:= -1;
	m_iCmnNCode	:= -1;

	Result := TRUE;
	exit;
{$ELSE}
	Result	:= False;
{$ENDIF}

	Dlg	:= THAP000010StaffSelDlgF.CreateDialog (Self, pAppRec, sEmpNo, iMode, m_aCodeInfo);
	MjsFontResize(Dlg, pointer(pAppRec));
	try
		try
			// 削除担当者復旧処理の時
			if iMode = 1 then
			begin
				if Dlg.fnRetNotMosSc = False then
				begin
					Exit;
				end;
			end;

			iRet := Dlg.ShowModal;

			if iRet <> mrOK then
			begin
				Exit;
			end;

			m_iEmpNCode	:= Dlg.fnRetNCode;
			m_iCmnNCode	:= Dlg.fnRetCmnNCode;
			sEmpNo		:= Dlg.fnRetGCode;
			if giEmpAttr = 2 then	//フリーコード
				ESEmpNo.Text	:= sEmpNo
			else
				ENEmpNo.Value	:= StrToInt64(sEmpNo);

			LSyainCount.Caption	:= fnNumEdit(SYDBModule.GetCount,13);

			if SYDBModule.GetShowOrder = 0 then
				SYDBModule.SetFreeOrder(105801)
			else
				SYDBModule.SetFreeOrder(100100);

			LShowOrder.Caption:=SYDBModule.GetFreeOrderItem;

			//Navi用ｸｴﾘ再Open
			SYDBModule.NaviQueryOpen;
			MTab.Enabled:=True;
			//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
			BNext.Enabled:=
				(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfEnd))and
				(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));
			Result	:= True;
		except
			raise Exception.create('ダイアログ処理失敗');
		end;
	finally
		Dlg.Free;
	end;
end;


//**********************************************************************
//	Process		: 順序変更ダイアログ呼び出し
//	Name		: Y.Kondo(TakumiCo.)
//	Date		: <2010-01-07>
//**********************************************************************
procedure THAP000010BaseF.ChangeOrder;
var
	KMExpPara	: THAPKMExpParam;
	KMExpIF		: THAPKMExpIF;
	SCondition	: TStringList;
	i,
	iCode,
	Ret			: Integer;
	sName,
	sOrderKM	: String;
begin
	if SYDBModule.GetCount=0 then
		Exit;

	// 項目検索ExpのパラメータをCreate(常駐型)
	KMExpIF := THAPKMExpIF.Create;							// 項目検索Expインターフェイス生成

	if KMExpIF = Nil then
		abort;

	KMExpPara := THAPKMExpParam.CreateParam;				// 項目検索Expパラメータ生成

	if KMExpPara = Nil then
		abort;

	try
		try
			// パラメータをSet
			if KMExpIF.Init(Self,pAppRec,KMExpPara) = -1 then
				abort;

			//順序指定するKMを取得
			for i:=1 to OrderKM do
			begin
				if (m_iPrivateFlg = 1) and (AOrderKM[i] = 101100) then			//プライバシー表示なしのとき、生年月日は選べない
					continue;

				if i>1 then
					sOrderKM := sOrderKM + ',';

				sOrderKM := sOrderKM + IntToStr(AOrderKM[i]);
			end;

			// プログラムパラメータから読み込む項目の選択
			KMExpPara.SetFindComboEnable(False);			// 分類1、2参照

			SCondition := TStringList.Create;				// STringListのCreate
			SCondition.Clear;
			SCondition.Add( ' HAPKM.ItemUse = 1'+			// 使用可能項目のみ
							' AND '+
							' HAPKM.ItemNo in('+sOrderKM+')');

			KMExpPara.SetCondition(SCondition);				// 指定文字列Set

			KMExpIF.ItemSet(KMExpPara);						// 情報Set

			// 項目検索Exp実行
			Ret		:= KMExpIF.DoDlg(KMExppara);			// ダイアログ呼び出し

			if Ret <> mrOK then								// 未選択
				exit;

			iCode := KMExpPara.ExpRetCode;					// 項目コード取得
			SName := KMExpPara.ExpRetText;					// 項目名称取得
			SCondition.Free;
		except
			MjsMessageBox(Self,'項目検索エクスプローラー処理に失敗しました。',mjError,mjDefOk);//<210202>Upd 長音対応
			Exit;
		end;
	finally
		KMExpIF.Term;										// 項目検索Expインターフェイス解放
		KMExpIF.Free;										// クラス解放
		KMExpPara.Free;										// クラス解放
	end;

	with SYDBModule do
	begin
		SetFreeOrder(iCode);
		LShowOrder.Caption:=sName;
	end;
	fnTopPanelSet;
end;


//**********************************************************************
//	Process		: 社員の選択関数
//	Name		: Y.Kondo(TakumiCo.)
//	Date		: <2010-07-20>
//**********************************************************************
function THAP000010BaseF.fnEmpEnter(EEmpNo:TObject):boolean;
var
	rcMsg	: TMjsMsgRec;
	iRet	: Integer;
	sEWork	: String;

	iMakeCode	: int64;
begin
	Result := FALSE;

	m_aCodeinfo[0]	:= 0;
	m_aCodeinfo[1]	:= 0;
	m_aCodeinfo[2]	:= 0;
	m_aCodeinfo[3]	:= 0;

	if m_iaddin33 = 1 then				// 自動採番
	begin
		if EEmpNo is TMNumEdit then
		begin
			if TMNumEdit(ENEmpNo).Value=0 then				// 社員No=0
			begin

				// 共通情報登録以外
				if (arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId<>100000)
				or (not m_bModify) then						// 登録系追加修正権限
				begin
					//社員未登録
					GetMsg(rcMsg,120,3);
					with rcMsg do
						MjsMessageBoxEx(Self,sMsg,sTitle,
										icontype,btntype,btnDef,LogType		);
					Exit;
				end;

				if not fnSetEmpCode(iMakeCode,sEWork) then
					Exit;

				ENEmpNo.Value	:= iMakeCode;
			end;
		end
		else
		begin
			if ESEmpNo.Text = '' then						// 社員No=0
			begin

				// 共通情報登録以外
				if (arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId<>100000)
				or (not m_bModify) then						// 登録系追加修正権限
				begin
					//社員未登録
					GetMsg(rcMsg,120,3);
					with rcMsg do
						MjsMessageBoxEx(Self,sMsg,sTitle,
										icontype,btntype,btnDef,LogType		);
					Exit;
				end;

				if not fnSetEmpCode(iMakeCode,sEWork) then
					Exit;

				ESEmpNo.Text	:= sEWork;
			end;
		end;
	end;

	if EEmpNo is TMNumEdit then
	begin
		if TMNumEdit(ENEmpNo).Value=0 then					// 社員No=0
		begin
			Beep;						// NG
			Exit;
		end;

		//ﾏｽﾀ格納形式に補完
		sEmpNo:=HapCodeAttribute(	ENEmpNo.Text,			// 入力値
									16,						// ﾏｽﾀﾚﾝｸﾞｽ
															// 文字?
									False
								);

		sEWork	:= HapCodeAttribute2(sEmpNo,giEmpDigit,giEmpAttr);
	end
	else
	begin
		if ESEmpNo.Text = '' then							// 社員No=0
		begin
			Beep;						// NG
			Exit;
		end;

		// ﾏｽﾀ格納形式に補完
		sEmpNo := TrimRight(ESEmpNo.Text);

		sEWork := sEmpNo;
	end;

	//排他ﾁｪｯｸ 社員使用中or新規No重複
	//社員検索
	if fnSyainExist = False then		// 未登録社員
	begin
		// 共通情報登録以外
		if (arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId<>100000)
		or (not m_bModify)									// 登録系追加修正権限
		or (HapApParam.GetRefType > 0) then					// or 基準日指定の場合<RefDay>
		begin
			//社員未登録
			GetMsg(rcMsg,120,3);
			with rcMsg do
				MjsMessageBoxEx(Self,sMsg,sTitle,
								icontype,btntype,btnDef,LogType		);
			Exit;
		end;

		iRet := MjsMessageBox(	Self,
								sEWork+' : で新規社員の登録処理を開始します。'+#10#13+#10#13+'よろしいですか？',
								mjQuestion,
								mjdefNo		);

		if iRet <> mrYES then
		begin
			Exit;
		end;

		HapApParam.SetPointer(@m_aCodeinfo,2);				// 採番ダイアログセット情報<2014-03-26>

		fnTopPanelClear;
		SYDBModule.FusenClear;
		HapApParam.SetEmpNCd(m_iEmpNCode);					// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApParam.SetCmnNCd(m_iCmnNCode);
		HapApParam.SetEmpNo(sEmpNo);						// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);

		// 新規社員登録
		if fnNewEmpDate() = False then
		begin
			InsFlg:=False;
			fnTopPanelSet;
			HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
			HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
			HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
			Exit;
		end;

		// <MLX>では、新規社員は内部で行う
{$IFDEF _HAP_MJSLINK_NX_I_}
		//社員No
		if giEmpAttr = 2 then	//フリーコード
			ESEmpNo.Text	:= sEmpNo
		else
		begin
			try
				ENEmpNo.Value	:= StrToInt64(sEmpNo);
			except
				ENEmpNo.Value	:= 0;
			end;
		end;

		HapApParam.SetEmpNCd(m_iEmpNCode);	// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApParam.SetCmnNCd(m_iCmnNCode);
		HapApParam.SetEmpNo(sEmpNo);		// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ

		//社員編集開始
		try
			MTab.Enabled:=True;
			//次前ﾎﾞﾀﾝ 使用可/不可状態 変更
			BNext.Enabled:=
				(arrLoadBplNo[ActiveChildPos]<>fnChildBplFind(cfEnd))and
				(fnChildBplFind(cfTop)<>fnChildBplFind(cfEnd));

			iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
			if iRet<>ACTID_RET_OK then
				Exit;
			iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_ENABLE);
			if iRet<>ACTID_RET_OK then
				Exit;

			PAPParent.Enabled := True;

			EnterFlg:=False;				// 内部にﾌｫｰｶｽが移動する
			iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SETFOCUS_FIRST);
			if iRet<>ACTID_RET_OK then
				Exit;

			//[↓]ﾎﾞﾀﾝ
			BEnter.Enabled:=False;
		except
			PAPParent.Enabled := False;
			MjsSetFocus(Self,TCustomEdit(EEmpNo).Name);		//移動をｶﾞｰﾄﾞ
		end;

		// トランザクションの開始
		if not ddCopDB.InTransaction then
			MDBModule.BeginTran(ddCopDB);

		Result := TRUE;
		Exit;
{$ENDIF}
	end;

	//社員がNaviﾃﾞｰﾀｾｯﾄ内に存在しない
	if not SYDBModule.Locate(sEmpNo) then
	begin
		Beep;

		GetMsg(rcMsg,120,7);
		with rcMsg do
			MjsMessageBoxEx(Self,sMsg,sTitle,
							icontype,btntype,btnDef,LogType		);

		Exit;
	end;

	InsFlg:=False;
	fnTopPanelSet;

// 更新権限がない場合は、該当社員のデータのみ表示し、登録部には入らない
	if (not m_bModify) or (HapApParam.GetRefType > 0) then	// 登録系追加修正権限 or 基準日指定の場合<RefDay>
	begin
		HapApParam.SetEmpNCd(m_iEmpNCode);					// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApParam.SetCmnNCd(m_iCmnNCode);
		HapApParam.SetEmpNo(sEmpNo);						// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ

		HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);

		Exit;
	end;

	//ﾛｯｸ
	if not SYDBModule.LockOn(m_iEmpNCode) then
	begin
		Exit;
	end;

	HapApParam.SetEmpNCd(m_iEmpNCode);	// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
	HapApParam.SetCmnNCd(m_iCmnNCode);
	HapApParam.SetEmpNo(sEmpNo);		// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ

	//ログ書き込み用
	fnCall_LogProc;

	//社員編集開始
	try
		iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
		if iRet<>ACTID_RET_OK then
			Exit;
		iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_ENABLE);
		if iRet<>ACTID_RET_OK then
			Exit;

		PAPParent.Enabled := True;

		EnterFlg:=False;				// 内部にﾌｫｰｶｽが移動する
		iRet:=HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SETFOCUS_FIRST);
		if iRet<>ACTID_RET_OK then
			Exit;

		//[↓]ﾎﾞﾀﾝ
		BEnter.Enabled:=False;
	except
		PAPParent.Enabled := False;

		SYDBModule.LockOff(False);							//ﾛｯｸ解除
		MjsSetFocus(Self,TCustomEdit(EEmpNo).Name);			//移動をｶﾞｰﾄﾞ
	end;

	Result := TRUE;
end;


//**********************************************************************
//	Component	: StatusBar
//	Event		: OnResize
//	Process		: SateusBar 状態変更ｲﾍﾞﾝﾄ
//	Name		: Y.Kondo(TakumiCo.)
//	Date		: 2010/07/22	<2010-07-22>
//**********************************************************************
procedure THAP000010BaseF.StatusBarResize(Sender: TObject);
begin
	StatusBar.Realign;
end;


//**********************************************************************
//	Process		: 付箋状態変更ｲﾍﾞﾝﾄ
//	Name		: Y.Kondo(TakumiCo.)
//	Date		: //<2010-10-07>
//**********************************************************************
procedure THAP000010BaseF.fnFusenClick(Sender:TObject);
begin
	with SYDBModule do
	begin
		FusenClear;
		FusenShow;

		m_FImage := GetFusenInfo;
	end;

	if m_FImage.Hint <> '' then
	begin
		FusenLabel.Visible	:= TRUE;
		FusenInfo.Visible	:= TRUE;
		FusenInfo.Caption	:= m_FImage.Hint;
		case m_FImage.Tag of
			1://赤
				FusenLabel.Color := $3121DC;
			2://緑
				FusenLabel.Color := $668C42;
			3://青
				FusenLabel.Color := $C68C4A;
			4://橙
				FusenLabel.Color := $318CFF;
		end;
	end
	else
	begin
		FusenLabel.Visible	:= FALSE;
		FusenInfo.Visible	:= FALSE;
	end;
end;


//**********************************************************************
//		Process		:	社員コピーﾀﾞｲｱﾛｸﾞ呼出
//		Name		:
//		Date		:	2011 /  3 / 14	( Mon )
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnCallCopyDlg;
begin
	with SYDBModule do
	begin
		if not EmpCopy then
			exit;

		// 再表示
		fnTopPanelSet;
		// 子AP
		HapApParam.SetEmpNCd( Trunc( SYDBModule.GetFld('NCode').AsFloat ) );
		HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
		// 受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
		HapApIF[ActiveChildPos].ChildBplAction( HAPAP_ACTID_SHOWDATA, @HapApParam );

		if giEmpAttr = 2 then			// フリーコード
			ESEmpNo.SelectAll
		else							// 数値コード
			ENEmpNo.SelectAll;
	end;
end;


//******************************************************************************
//		Proccess	: システム採用区分をチェック
//		Return		: 1 : 給与システム採用
//					: 2 : 人事システム採用
//					: 3 : 給与人事システム採用
//******************************************************************************
function THAP000010BaseF.fnSysKbnCheck : Integer;
var
	iRet	: Integer;

begin
	iRet := 0;

	if HAPCheckModuleLicense( pAppRec, HAP_JIN) then		// <JinTan-G>
		iRet := 1;

	if HAPCheckModuleLicense( pAppRec, HAP_KYU) then		// <JinTan-G>
		iRet := iRet + 2;

	Result := iRet;
end;


//**********************************************************************
//		Process		: 社員コード自動採番
//		Name		: Y.Kondo
//		Date		: 2011/04/19<2011-04-22>
//		Return		:
//**********************************************************************
function THAP000010BaseF.fnSetEmpCode(var retCodeNo:int64; var retCodeTx:String) : Boolean;
var
	Dlg		: THAP000010SetCodeDlgF;
	iRet	: TModalResult;
begin
	Result	:= False;

	Dlg	:= THAP000010SetCodeDlgF.fnCreateDialog (Self, pAppRec);
	MjsFontResize(Dlg, pointer(pAppRec));
	try
		try
			iRet := Dlg.ShowModal;

			if iRet <> mrOK then
			begin
				Exit;
			end;

			retCodeNo	:= Dlg.fnRetNo;
			retCodeTx	:= Dlg.fnRetTx;

			m_aCodeinfo[0]	:= Dlg.fnRetInfo(0);
			m_aCodeinfo[1]	:= Dlg.fnRetInfo(1);
			m_aCodeinfo[2]	:= Dlg.fnRetInfo(2);
			m_aCodeinfo[3]	:= Dlg.fnRetInfo(3);

			Result	:= True;
		except
			raise Exception.create('ダイアログ処理失敗');
		end;
	finally
		Dlg.Free;
	end;
end;


//**********************************************************************
//		Process		: HAPSC-SY の整合性確認
//		Name		: Y.Kondo
//		Date		: 2012/01/24	<2012-01-24>
//		Memo		: MLコンバートなどで、財務・販売系の処理では
//					: HAPSCのみしか作成されない場合があるのでその回避
//		Return		:
//**********************************************************************
function THAP000010BaseF.fnSYCheck:Boolean;
begin
	Result := TRUE;

	// HAPSC、HAPSYのレコード整合性をチェック
	try
		with mqSY do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT Count(NCode) as NULLSYCount'
					+' FROM HAPSC SC'
					+' LEFT JOIN HAPSY SY ON SC.CorpNCode = SY.CorpNCode AND SC.NCode = SY.EmpNCode'
					+' WHERE SY.EmpNCode is NULL');
			try
				Open(True);

				if GetFld('NULLSYCount').AsInteger > 0 then
					Result := FALSE;
			except
				raise Exception.Create('社員レコードのﾁｪｯｸに失敗しました。');
			end;
		end;
	finally
		mqSY.Close;
	end;
end;


//**********************************************************************
//		Process		: 摘要事業所数を取得
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010BaseF.fnJIGCheck;
var
	i		: integer;
	sSQL	: string;
begin
	for i:=1 to 5 do
		m_aJIGFlg[i]:=0;

	try
		sSQL	:='SELECT'
					+' MAX(JIG.FlagA) FlA,'
					+' MAX(JIG.FlagB) FlB,'
					+' MAX(JIG.FlagC) FlC,'
					+' MAX(JIG.FlagD) FlD,'
					+' MAX(JIG.FlagE) FlE'
				+ ' FROM'
					+ ' HAPJIG AS JIG'
				+ ' JOIN'
					+ ' HAPMS AS MS on JIG.WorkCode = MS.WorkCode';

		with mqKM do
		begin
			Close;
			SQL.Clear;
			SQL.Add(sSQL);
			try
				Open(True);

				m_aJIGFlg[1]	:= GetFld('FlA').AsInteger;	// 社会保険該当区分
				m_aJIGFlg[2]	:= GetFld('FlB').AsInteger;	// 所得税該当区分
				m_aJIGFlg[3]	:= GetFld('FlC').AsInteger;	// 雇用保険該当区分
				m_aJIGFlg[4]	:= GetFld('FlD').AsInteger;	// 労働保険該当区分
				m_aJIGFlg[5]	:= GetFld('FlE').AsInteger;	// 予備
			except
				raise Exception.Create('事業所情報のﾁｪｯｸに失敗しました。');
			end;
		end;
	finally
		mqKM.Free;
	end;
end;

// <MYN>
//**********************************************************************
//      Process     : マイナンバーモジュール初期化
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2015/07/08
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010BaseF.fnMyNumInit: Boolean;
var
	iRet: Integer;
	wRet: Word;
	rcMsg: TMjsMsgRec;
	sMsg: String;
begin
	Result := True;

	try
		m_MYN := TMYNAccess3.Create;
		m_HAPMyNum := THAPEmpMyNumInfo.Create(pAppRec, ddMjsDB, ddCopDB, m_MYN);

		iRet := m_MYN.Init(	@recCommon,
							pAppRec.m_iSystemCode,
							pAppRec.m_iOptionCode,
							pAppRec.m_iProgramCode,
							@MDBModule,
							ddCopDB);

		if iRet <> MYNACCESS_SUCCESS then	// 接続成功以外
		begin
			m_MYN.AccType := MYNACCESS_TYPE_NONE;

			if iRet = MYNACCESS_NOKANRI then	// マイナンバー管理なし・受託なし
			begin
				// マイナンバー管理なしは、メッセージなしで権限無しの動作とする
				exit;
			end;

			sMsg := '(' + IntToStr(iRet) + ')'	+ #13#10 +
					'社員登録を継続しますか？';

			GetMsg(rcMsg, 900, 2);	// マイナンバーの初期処理に失敗しました。
			wRet := MjsMessageBoxEx(TControl(pAppRec^.m_pOwnerForm^),	// ← Create前なのでSelfは使えない
									rcMsg.sMsg + sMsg,
									rcMsg.sTitle,
									rcMsg.icontype,
									rcMsg.btntype,
									rcMsg.btnDef,
									rcMsg.LogType);

			if wRet <> mrYes then
			begin
				Result := False;	// 処理終了
				exit;
			end;
		end;
	except
		raise Exception.Create('マイナンバーモジュールの初期化に失敗しました。');
	end;
end;

// <MYN>
//**********************************************************************
//      Process     : マイナンバー情報更新
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2015/07/08
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.fnMyNumUpd;
var
	iRet : Integer;
	rcMsg: TMjsMsgRec;
	sMsg: String;
begin
	iRet := m_HAPMyNum.WriteMyNumbers;

	if iRet <> MYNACCESS_SUCCESS then
	begin
		GetMsg(rcMsg, 900, 6);	// マイナンバー情報の更新に失敗しました。

		sMsg := '';

		if iRet = MYNAccess_ERRCD_406 then
		begin
			sMsg := #13#10 + #13#10 +
					'従業員等の登録可能件数を超えました。'						+ #13#10 +
					'本契約ではこれ以上従業員等の個人番号の登録はできません。'	+ #13#10 +
					'支社にお問い合わせください。'								;
		end;

		MjsMessageBoxEx(Self,
						rcMsg.sMsg + '(' + IntToStr(iRet) + ')' + sMsg,
						rcMsg.sTitle,
						rcMsg.icontype,
						rcMsg.btntype,
						rcMsg.btnDef,
						rcMsg.LogType);
	end;
end;

// <MYN>
//**********************************************************************
//      Component   : 番号表示ボタン
//      Event       : OnClick
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2015/07/08
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010BaseF.btnMaskClick(Sender: TObject);
begin
	{ 選択部で個人番号表示するために使用する			}
	{ 現在は親側の番号表示ボタンは非表示のため未使用	}
	HAPApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_MYN_SHOWHIDE);
end;


//******************************************************************************
//		Process		: 計算対象者支給グループ未設定チェック
//		Name		: Y.Kondo
//		Date		: <2016-11-22>
//		Parameter	: None
//		Return		: None
//******************************************************************************
procedure THAP000010BaseF.fnPayGroupNoCheck;
var
	i		: Integer;
	sSQL,
	sMsg	: string;
	DQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;
begin

	for i:=0 to Length(arrChildInfo)-1 do
	begin
		if arrChildInfo[i].iPrgId = 100010 then				// 基本情報タブあり
		begin
			// 自社に接続
			DQuery := TMQuery.Create( Self );
			MDBModule.SetDBInfoToQuery( ddCopDB, DQuery );

			try
				sSQL:=			'SELECT PayGroupNo FROM HAPSY SY JOIN HAPSC SC ON SC.CorpNCode = SY.CorpNCode AND SC.NCode = SY.EmpNCode';
				sSQL:=sSQL+#13#10' WHERE SY.CorpNCode=0';
				sSQL:=sSQL+#13#10' AND SY.EmpNCode='+IntToStr(HapApParam.GetEmpNCd);	// ここではMLX新規社員を考慮してパラメータより再取得する。
				sSQL:=sSQL+#13#10' AND ISNULL(PayGroupNo,0) = 0';
				sSQL:=sSQL+#13#10' AND (ISNULL(SC.QyoKbn,0) = 1';
				sSQL:=sSQL+#13#10' OR ISNULL(SC.ShoKbn,0) = 1';
				sSQL:=sSQL+#13#10' OR ISNULL(SC.NenKbn,0) = 1)';

				with DQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add(sSQL);
					Open(True);

					if not EOF then
					begin
						sMsg := '給与計算の対象者ですが給与支給グループが設定されていません。'	+ #13#10 +
								'給与支給グループが設定されていない場合は給与計算の対象になりません。'	+ #13#10 +
								'［基本情報］の「給与支給G」を確認してください。';

						GetMsg(rcMsg, 200, 3);
						MjsMessageBoxEx(self,
										rcMsg.sMsg + sMsg,
										rcMsg.sTitle,
										rcMsg.icontype,
										rcMsg.btntype,
										rcMsg.btnDef,
										rcMsg.LogType);
					end;

				end;

			finally
				DQuery.Free();
			end;

			break;
		end;
	end;
end;

//******************************************************************************
//		Process		: 基準日指定/解除関数
//		Date		: <RefDay>
//		Parameter	: MODE 0:F3押下 / 1:基準日指定 / 2:現在参照 / 3:基準日変更
//		Return		: None
//******************************************************************************
procedure THAP000010BaseF.fnReferDay(MODE:Integer);
var
	sDate	: String;
	sEWork	: String;

	rcMsg	: TMjsMsgRec;
begin
	if MODE = 0 then
	begin
		if HapApParam.GetRefType = 0 then
		begin
			if not fnCallRefDlg then						// 基準日指定ダイアログ呼び出し
				exit;

			BEnter.Enabled	:= FALSE;						// 登録系追加修正権限
		end
		else
		begin
			GetMsg(rcMsg,200,8);
			with rcMsg do
				MjsMessageBoxEx(Self,'基準日指定を解除します。',sTitle,
								icontype,btntype,btnDef,LogType		);

			HapApParam.SetRefDay(0,HapApParam.GetRefDate);
			LRefDate.Visible := FALSE;

			BEnter.Enabled	:= TRUE;						// 登録系追加修正権限
		end;
	end
	else if MODE = 1 then
	begin
		if HapApParam.GetRefType = 1 then
			exit;

		HapApParam.SetRefDay(1,HapApParam.GetRefDate);
	end
	else if MODE = 2 then
	begin
		if HapApParam.GetRefType = 2 then
			exit;

		HapApParam.SetRefDay(2,HapApParam.GetRefDate);
	end
	else if MODE = 3 then
	begin
		if not fnCallRefDlg then		// 基準日変更
			exit;
	end;

	if giEmpAttr = 2 then		// フリーコード
	begin
		if ESEmpNo.Text = '' then							// 社員No=0
			sEmpNo	:= ''
		else
			sEmpNo := TrimRight(ESEmpNo.Text);

		sEWork := sEmpNo;
	end
	else
	begin
		if ENEmpNo.Value=0 then								// 社員No=0
			sEmpNo	:= ''
		else
			sEmpNo:=HapCodeAttribute(	ENEmpNo.Text,			// 入力値
										16,						// ﾏｽﾀﾚﾝｸﾞｽ
																// 文字?
										False
									);

		sEWork	:= HapCodeAttribute2(sEmpNo,giEmpDigit,giEmpAttr);
	end;


	if HapApParam.GetRefType > 0 then						// 子APによる絞り込み必要
	begin
		arrFuncBar[2]:='F3 基準日解除';

		if HapApParam.GetRefType = 2 then
		begin
			GetMsg(rcMsg,200,8);
			with rcMsg do
				MjsMessageBoxEx(Self,'現在登録内容参照に切り替えます。',sTitle,
								icontype,btntype,btnDef,LogType		);

			HapApParam.SetRefDay(2,HapApParam.GetRefDate);
			LRefDate.Caption			:= '参照：現在登録内容';
			MPopMenu.Items[3].Checked	:= TRUE;			// 基準日
			MPopMenu.Items[2].Checked	:= FALSE;			// 基準日
			LRefDate.Color				:= $00FFFFD0;

            // <DRILD>
            if m_bDrillDown then
            begin
                SYDBModule.SetSQL( '','','','SC.NCode = ' + IntToStr(m_iDrillEmpNCode) + ' AND ((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
            end
            else
            begin
                SYDBModule.SetSQL( '','','','((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
            end;
		end
		else
		begin
			//入力暦区分[西暦以外]
			if m_iRekiKbn = 0 then
				sDate := MjsGetGengou(HapApParam.GetRefDate,MdtCMP_YMD)+FormatDateTime(' ee/mm/dd',HapApParam.GetRefDate)
			else
				sDate := FormatDateTime('yyyy/mm/dd',HapApParam.GetRefDate);

			LRefDate.Visible			:= TRUE;
			LRefDate.Caption			:= '基準日：' +sDate;
			MPopMenu.Items[2].Checked	:= TRUE;			// 基準日
			MPopMenu.Items[3].Checked	:= FALSE;			// 基準日
			LRefDate.Color				:= $0090FFFF;

            // <DRILD>
            if m_bDrillDown then
            begin
                SYDBModule.SetSQL( '','','JOIN HAPSY SY ON (SC.CorpNCode=SY.CorpNCode AND SC.NCode=SY.EmpNCode)',
                                    '((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))'
									+' AND SC.NCode = ' + IntToStr(m_iDrillEmpNCode)
                                    +' AND ((SY.Nyuusha <= ' + FormatDateTime('yyyymmdd',HapApParam.GetRefDate)+') or (SY.Nyuusha IS NULL))','');
            end
            else
            begin
                SYDBModule.SetSQL( '','','JOIN HAPSY SY ON (SC.CorpNCode=SY.CorpNCode AND SC.NCode=SY.EmpNCode)',
                                    '((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))'
                                    +' AND ((SY.Nyuusha <= ' + FormatDateTime('yyyymmdd',HapApParam.GetRefDate)+') or (SY.Nyuusha IS NULL))','');
            end;
		end;

	end
	else
	begin
		arrFuncBar[2]:='F3 基準日指定';

        // <DRILD>
        if m_bDrillDown then
        begin
            SYDBModule.SetSQL( '','','','SC.NCode = ' + IntToStr(m_iDrillEmpNCode) + ' AND ((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
        end
        else
        begin
			SYDBModule.SetSQL( '','','','((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
        end;
	end;

	SYDBModule.NaviQueryOpen;			// 再取得

	if SYDBModule.GetCount > 0 then
	begin
		SYDBModule.Locate(sEWork);		// 表示中の社員がいれば
	end
	else
	begin
		//社員がNaviﾃﾞｰﾀｾｯﾄ内に存在しない
		GetMsg(rcMsg,120,3);
		with rcMsg do
			MjsMessageBoxEx(Self,sMsg,sTitle,
							icontype,btntype,btnDef,LogType		);

		arrFuncBar[2]:='F3 基準日指定';

		HapApParam.SetRefDay(0,HapApParam.GetRefDate);
		LRefDate.Visible := FALSE;

		BEnter.Enabled	:= TRUE;						// 登録系追加修正権限

        // <DRILD>
        if m_bDrillDown then
        begin
            SYDBModule.SetSQL( '','','','SC.NCode = ' + IntToStr(m_iDrillEmpNCode) + ' AND ((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
        end
        else
        begin
			SYDBModule.SetSQL( '','','','((MVCHG.DeptNCode in ('+m_sBmCd+')) or (ISNULL(MVCHG.DeptNCode,0) = 0))','');
        end;

		SYDBModule.NaviQueryOpen;		// 再取得
	end;

	//印刷情報再セット
	fnPrintInfoIni;

//先頭BPL変更

	try
		//裏側にあったらそのまま使用
		//裏側にもなければ読み込み
		svActiveChildPos := ActiveChildPos;

		HapApIF[svActiveChildPos].ChildBplAction(ACTID_HIDESTART);
		HapApIF[ActiveChildPos	].ChildBplAction(ACTID_SHOWSTART);

		if not(SYDBModule.Bof) or							// 社員あり
		   not(SYDBModule.Eof) then							// 社員あり
		begin
			fnTopPanelSet;
			HapApParam.SetEmpNCd(Trunc(SYDBModule.GetFld('NCode').AsFloat));	//受渡ﾊﾟﾗﾒｰﾀにｾｯﾄ
			HapApParam.SetCmnNCd(Trunc(SYDBModule.GetMosFld('CmnTantoNCD').AsFloat));
			HapApIF[ActiveChildPos].ChildBplAction(HAPAP_ACTID_SHOWDATA,@HapApParam);
		end
		else												// 社員なし
		begin
			if giEmpAttr = 2 then		// フリーコード
				ESEmpNo.Text := ''
			else
				ENEmpNo.Value:=0;

			fnTopPanelClear;
		end;

		if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100000 then		// 共通情報の時
		begin
			if not m_bModify then							// 登録系追加修正権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー,0';
				arrFuncBar[6]	:= 'F7 社員No変更,0';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else if not m_bPrmDelete then					// 削除権限
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除,0';
			end
			else
			begin
				arrFuncBar[5]	:= 'F6 社員コピー';
				arrFuncBar[6]	:= 'F7 社員No変更';
				arrFuncBar[7]	:= 'F8 社員削除';
			end;
		end
		// <MYN>
		else if arrChildInfo[arrLoadBplNo[ActiveChildPos]].iPrgId = 100010 then	// 基本情報の時
		begin
			if m_bUsePGChgDlg then							// 支給グループ変更ダイアログ使用
			begin
				if not m_bModify or								// 登録系追加修正権限
					(m_MYN.AccType = MYNACCESS_TYPE_NONE) then	// 個人番号権限なし（初期処理後のエラー対応）
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更,0';
				end
				else
				begin
					arrFuncBar[5]	:= '';
					arrFuncBar[6]	:= '';
					arrFuncBar[7]	:= 'F8 支給G変更';
				end;
			end
			else
			begin
				arrFuncBar[5]	:= '';
				arrFuncBar[6]	:= '';
				arrFuncBar[7]	:= '';
			end;
		end
		else
		begin
			arrFuncBar[5]	:= '';
			arrFuncBar[6]	:= '';
			arrFuncBar[7]	:= '';
		end;
		FuncBar.CopyFuncData(arrFuncBar);
		HapApParam.SetFuncCaption(arrFuncBar);

	except
		MjsMessageBox(Self,'基準日の切替でｴﾗｰが発生しました。社員登録を終了します。',mjError,mjdefok);
		Close;
	end;

end;

//******************************************************************************
//		Proccess	: 基準日指定ダイアログ呼び出し
//		Date		: <RefDay>
//		Return		: TRUE/FALSE
//******************************************************************************
function THAP000010BaseF.fnCallRefDlg:Boolean;
var
	Dlg	: THAP000010RefDlgF;
begin

	Result	:= FALSE;

	if SYDBModule.GetCount = 0 then
		Exit;

	with Dlg do
	begin
		try
			Dlg	:= THAP000010RefDlgF.CreateForm(pAppRec,self,m_iRekiKbn,HapApParam.GetRefDate);
			try
				if ShowModal = mrOK then
				begin
					HapApParam.SetRefDay(1,Dlg.fnRetRefDate);					// 基準日状態セット
				end
				else
				begin
					Exit;
				end;
			finally
				Release;
			end;
		except
			raise Exception.create('基準日指定ﾀﾞｲｱﾛｸﾞ');
		end;
	end;

	Result := TRUE;
end;

end.
