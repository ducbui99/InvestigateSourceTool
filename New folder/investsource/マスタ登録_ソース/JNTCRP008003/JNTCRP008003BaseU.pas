//************************************************************************
//	System		:	ＭＪＳ ＦＸ開発
//	Program		:	振込銀行登録
//	ProgramID	:	xxxxxxxxxx
//	Name		:   K.Iizuka
//	Create		:	2005.03.30
//	Comment		:	XXXX注意事項等XXXXXXXXXXXXX
//					XXXXXXXXXXXXXXXXXXXXXXXXX
//	History		:	2001 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//                  2005.03.30  FX環境作成              <001>
//                  2005.04.07  DBSchema20050331対応
//                  2005.05.09  FX-Style対応            <002>
//
//  <003>  高橋功二   2005.08.19(FRI) JNTCommonを親から引き継ぐように修正
//  <0830> 飯塚健介   2005.08.30(Thu) 08.30一時対応
//  <004>  飯塚健介   2005.09.02(FRI) DisableEditer = TrueだとEnterが効かない
//  <005>  加藤(PRIME)2006.01.13(FRI) 印刷可能とする　<0830>の対応を戻す
//  <006>  加藤(PRIME)2006.01.13(FRI) ﾌﾟﾚﾋﾞｭｰ中に終了時にｴﾗｰとなる不具合修正
//  <CHK>  加藤(PRIME)2006.03.01(WED) 削除ﾁｪｯｸ対応
//  <007>  加藤(PRIME)2006.03.01(WED) TTreeViewをTMTreeViewに変更
//  <008>  加藤(PRIME)2006.03.23(THU) 支店のﾂﾘｰからのｷｰ動作修正
//  <009>  飯塚健介   2006.07.10(MON) ﾂﾘｰ表示名称修正
//  <010>  佐藤(IDC)  2007.05.16(WED) グリッド上で支店を削除できない場合があった
//	<011>  茂木勇次   2007.06.07(THU) ｸﾞﾙｰﾌﾟ会社管理対応(子会社の場合は表示のみとする)
//  <012>  鈴木(PRIME)2007.08.01(WED) 親側で決算確定済みのﾒｯｾｰｼﾞを出すので、
//									  子の方はﾒｯｾｰｼﾞを出さないように修正
//  <013>  鈴木(PRIME)2007.08.03(FRI) 参照時は削除および挿入ができないように修正
//  <014>  鈴木(PRIME)2007.08.10(FRI) 決算確定時は ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸを行わないように修正
//  <015>  鈴木(PRIME)2007.08.28(TUE) 追加、修正権限なしの場合、
//									  削除権限があっても削除できない不具合を修正
//	<016>  鈴木(PRIME)2007.08.31(FRI) 決算確定時および追加修正権限なしの場合、
//									  ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸを行わないように修正
//	<017>  関　(PRIME)2008.01.08(TUE) ﾏｽﾀ更新履歴対応
//	<018>  大竹文顕   2008.03.15(SAT) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//  <DKAI> 難波(LAB)  2008.08.27(WED) 名称に改行が入らないようにする
//  <LPH>  佐藤(IDC)  2010.05.21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//  <019>  大田原(MSI)2011.05.12(THU) 印刷モジュールをUnLoadしていなかった点を修正
//	<020>  小島(MSI)  2011.06.08(WED) WF申請中は銀行マスタの修正・削除不可対応
//  <KDS>  SATOH(GSOL)2012.02.07(TUE) ShiftState対応
//
// ========================↓MLX対応============================================
//
// <MLXHAP> 新保一馬 2013.01.26(Sat) MLX給与対応
// <DIC_BANK>新保一馬 2013.03.01(Fri) 銀行辞書対応。（MLXでの新規対応。Galiでもこの仕様で動作することになります。）
// <021>    新保一馬 2013.03.01(Fri) グリッドにて、新規のみ、検索Expボタンを出す。
// <CDCHG> 新保一馬  2013.08.20(Tue) コード変更統合対応
// <DIC_BANK_2>新保一馬 2013.08.27(Tue) 銀行辞書対応（JNT系PGの仕様でTMjsAppRecord.rcSYSTEMAREAがTJNTMASComなために
//                                      Galiで銀行辞書を起動したとき、MjsColorChangeが正しく動作しない。グリッドの色がおかしくなる。
//                                      銀行辞書の仕様前後でrcSYSTEMAREAを切り替える対応を行った。）
//
//  <SCA>  T.SATOH   2014/08/20(WED)  同一コード別支店振込先対応
// <022> 保坂(SIG) 2019.09.03(TUE) 既存の支店よりも支店コードの小さいデータを最終行に登録するとエラーとなる問題の対応
// <023> 保坂(SIG) 2019.09.03(TUE) 支店の追加後にツリービュー上で、追加した支店、及び支店を追加した銀行を選択するとエラーとなる問題の対応
// <024> 足立(NEOTEX) 2019.12.23 コード変更時に外部コードによる検索でエラーになった点について、不要な検索を行わないように修正
// <025> 仲澤（NTC）2021.01.27(Wed)	ﾂﾘｰﾋﾞｭｰ内の支店ﾄﾞﾗｯｸﾞ＆ﾄﾞﾛｯﾌﾟにおいて、
//									ﾄﾞﾛｯﾌﾟする支店が社員振込情報（HAPSF）に登録済の場合はﾄﾞﾛｯﾌﾟを無効化するように修正。
// <026> 仲澤（NTC）2021.01.28(Thu)	<025>のｸｴﾘについて、速度UPのためexists構文を採用。
//*************************************************************************
unit JNTCRP008003BaseU;

interface

uses


  Windows,Messages,SysUtils,Classes,VCL.Graphics,VCL.Controls,
  VCL.Forms,VCL.Dialogs, MJSCommonDialogs,Buttons,VCL.ExtCtrls,
  DBCtrls,dxTL,dxDBGrid,dxCntner,ComCtrls,ppDB,
  ppDBPipe,ppBands,ppCtrls,ppVar,ppPrnabl,ppClass,ppCache,ppComm,
  ppRelatv,ppProd,ppReport,Db,dxmdaset,VCL.StdCtrls,MJSBitBtn,dxGrClms,
  FireDAC.Comp.Client,Menus,
  ppTxPipe,ppModule,daDatMod,

  dxExEdtr,		//<021>

  JNTCommonu,     //<002>Add
  JNTMasComu,     //<002>Add
  JNTSelCorpSys,

  JNTExPGlobal, JNTPDlg,{<PRN>}
  MJSMsgStdu,
  MLBplLoaderU,   // <LPH> ADD
  MJSKeyDataState,	// <KDS> ADD

  MJSPanel,
  MJSSpeedButton,
  MJSTab,
  MJSEdits,
  MJSDispCtrl,
  MjsDBModuleu,
  MJSQuery,
  MjsPrnSupportU,
  MjsPrnDlgU,
  MJSCommonu,
  MJSStatusBar,
  MJSComboBox,

  JNTCRP008003PrintU,
//↓<CDCHG>
  JNTCRP008003ChgDlgU,
  FXLicense,
//↑<CDCHG>
//<DIC_BANK>  CMNExpFuncU, 		//検索ｴｸｽﾌﾟﾛｰﾗ呼出関数のユニットです。
  CMNExpFuncExU, 		//検索ｴｸｽﾌﾟﾛｰﾗ呼出関数のユニットです。<DIC_BANK>
  MjsPreviewIFu,
  MJSLabel,
  SeriesCheckU,//<MLXHAP>
  Inifiles,    // <SCA> ADD
  VCL.ImgList, MJSFunctionBar, MJSSPFunctionBar, MJSTreeView, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.ImageList, MjsStrCtrl;

type
  {$i ActionInterface.inc}
  {$include JNTSelPrtIF.inc}              // <PRN>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;


  TTViewInfo=record
	eNCode:Extended;
    iBankCode,iBranchCode,iHontenKbn:integer //<001>HontenKbn 本店:1  支店:2
   ;eBsNCode:Extended;      // <SCA> ADD
  end;


  TJNTCRP008003BaseF = class(TForm)
	MTab: TMTab;
	DDataGenKo: TDataSource;
    MdBank: TdxMemData;
    MdBranch: TdxMemData;
	DDataTen: TDataSource;
    MdBankBankName: TStringField;
    MdBankBankKana: TStringField;
    MdBranchBranchName: TStringField;
    MdBranchBranchKana: TStringField;
    MdBankBankCode: TIntegerField;
    MdBranchBranchCode: TIntegerField;
	Panel23: TMPanel;
	Panel22: TMPanel;
    TView: TMTreeView;
	Panel1: TMPanel;
    GrBank: TdxDBGrid;
    GrBankColBankName: TdxDBGridColumn;
    GrBankColBankKana: TdxDBGridColumn;
	MPanel1: TMPanel;
	MPanel2: TMPanel;
	Panel2: TMPanel;
    GrBranch: TdxDBGrid;
    GrBranchColumn2: TdxDBGridColumn;
    GrBranchColumn4: TdxDBGridColumn;
    GrBranchColumn5: TdxDBGridColumn;
    GrBranchColumn1: TdxDBGridButtonColumn;
    GrBankColBankCode: TdxDBGridButtonColumn;
    MdBranchBankCode: TIntegerField;
    TreeImage: TImageList;
    MdBranchTVItemPtr: TIntegerField;
    MdBranchBankNCode: TFloatField;
    MdBankNCode: TFloatField;
    CmnStatusBar: TMStatusBar;
    MSPFunctionBar: TMSPFunctionBar;
    MdBranchBranchNCode: TFloatField;
    SPHapBS: TFDStoredProc;
    SPMsHist: TFDStoredProc;
    LBankName: TMLabel;
    MdBranchSortCode: TFloatField;
	procedure PrintDlg;
	procedure FormCreate            (Sender: TObject);
	procedure FormClose             (Sender: TObject; var Action: TCloseAction);
	procedure FormCloseQuery        (Sender: TObject; var CanClose: Boolean);
	procedure CloseBtnClick         (Sender: TObject);
	procedure FormResize            (Sender: TObject);
	procedure FormHide              (Sender: TObject);
	procedure FormDestroy           (Sender: TObject);
	procedure FormShow              (Sender: TObject);
//	procedure BChangeClick          (Sender: TObject);
	procedure MTabKeyDown           (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure MTabEnter             (Sender: TObject);
	procedure BInsertClick          (Sender: TObject);
	procedure MdBankAfterCancel     (DataSet: TDataSet);
	procedure MdBankAfterDelete     (DataSet: TDataSet);
	procedure MdBankAfterInsert     (DataSet: TDataSet);
	procedure DDataGenKoStateChange (Sender: TObject);
	procedure MdBankBeforePost      (DataSet: TDataSet);
	procedure BDeleteClick          (Sender: TObject);
	procedure MTabChange            (Sender: TObject);
	procedure BPrintClick           (Sender: TObject);
	procedure TViewChange           (Sender: TObject; Node: TTreeNode);
	procedure DDataTenStateChange   (Sender: TObject);
	procedure MdBranchAfterCancel   (DataSet: TDataSet);
	procedure MdBranchAfterDelete   (DataSet: TDataSet);
	procedure MdBranchAfterInsert   (DataSet: TDataSet);
	procedure MdBranchBeforePost    (DataSet: TDataSet);
	procedure GrBankKeyDown         (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure MdBankAfterPost       (DataSet: TDataSet);
	procedure MdBranchAfterPost     (DataSet: TDataSet);
	procedure GrBranchEnter         (Sender: TObject);
	procedure GrBankEnter           (Sender: TObject);
	procedure TViewEnter            (Sender: TObject);
	procedure FormActivate          (Sender: TObject);
	procedure DDBGridKeyPress       (Sender: TObject; var Key: Char);
	procedure GrBranchColumn1EditButtonClick(Sender: TObject);
	procedure GrBankColBankCodeEditButtonClick(Sender: TObject);
    procedure TViewDragDrop (Sender, Source: TObject; X, Y: Integer);
    procedure TViewDragOver (Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);

    procedure BChangeClick          (Sender: TObject);
    procedure fnCmnChangeColumn(Sender: TObject; //←<DIC_BANK>このメソッドは使用しないことになった。
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
//↓<DIC_BANK>
    procedure GrBranchBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure GrBankBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
//↑<DIC_BANK>
//↓<CDCHG>
    procedure BCodeChangeClick(Sender: TObject);
//↑<CDCHG>
  private
	{ Private 宣言 }
	m_pRec			: ^TMjsAppRecord;
	m_Base_pRec		: ^TMjsAppRecord;

	m_pMDataModule	      : TMDataModulef;

	m_pCommonArea	      : rcCOMMONAREA;				//共通ｴﾘｱ
    m_cComArea		      : TJNTMASCom;
	dbCorp		          : TFDConnection;					// 会社DB
	dbCtlDb			      : TFDConnection;					// 共通DB

    m_CmpList	    :   TList;
    B_Print 	    :   TMSpeedButton;
    B_Delete        :   TMSpeedButton;
    B_Ins           :   TMSpeedButton;
    B_Change 	    :   TMSpeedButton;
    B_CodeChange	:   TMSpeedButton;  // <CDCHG>
    P_ComBox        :   TMComboBox;     // 処理選択コンボ

    m_IsUpdate      : Boolean;

//	giDataCnt		: Integer;													//銀行TABのRecordCount
//	giDataTen		: Integer;													//支店TABのRecordCount
//	gSBankCode		: String;													//銀行コート
//	gSBankName		: String;													//銀行名
//	gBChangeBank	: Boolean;
	giTabIndex		: Integer;
	giGetFocus		: Boolean;

//	参照ﾌﾗｸﾞ
	giReferFlag		:	Integer;
    m_cJNTArea      :   TJNTCommon;

	PrnForm			: TJNTCRP008003Printf;
//<001>	rcMsg			: TMjsMsgRec;
	ACControl		: TWinControl;
//	<DSP>
    m_ratio			: Integer;

    m_bBtnChange    : Boolean;
    m_TantoNCode    : Currency; // <018>

	//2001/08/08 追加 FB用文字判定
	FBChar:		array[0..255] of char;
	FbMBCS:		Boolean;					//	MBCS判定	2001/08/10Add


	bMTabKeyDown:boolean;	//TRUE:ﾀﾌﾞで[←][→]押下

    uvHani              :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	:	TPrintAppEntry;                     // <PRN>
    ArrHdl              :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    :	rcPrtParam;                         // <PRN>
    DmqPrint            :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ
	uvSelSys            :   TJNTSelCorpSys; 	                // <PRN> 会社ｼｽﾃﾑ情報

    m_bDelete			:   Boolean;							// <015> ADD True=削除可能 False=削除不可
// <020> Add start
    m_sWFError			:	String;
    m_iBraNCode			:	Integer;							// ツリーDrag時銀行支店内部CD
// <020> Add end

    m_RepHandle			:   THandle;                            // 印刷モジュールハンドル <019>

//↓<CDCHG>
	m_bSaimu		: Boolean;		// 債務が入っているか
	m_bKeihi		: Boolean;      // 経費精算が入っているか
//↑<CDCHG>

    m_bAllowSameBraCode :   Boolean;// 同一振込先支店コード可区分 <SCA> ADD

	procedure fnCreatNewTreeView;
	function  fnFBKanaChange(const sBase: string; var sEdit: string; bInp: Boolean): Boolean;
	procedure 	fnFBCharInit;
	//2001/08/08 END

	Function CheckdsInsert_Bank :Boolean;										//値のチェック
	Function CheckdsInsert_Siten :Boolean;										//値のチェック

	function fnFindSyain(iBank:integer;iBranch:integer=-1):Boolean;  //2001/08/24 KOS YK 社員情報存在チェック


    //<001>支店ﾚｺｰﾄﾞ存在ﾁｪｯｸ（名称取得）
    function fnExistChk         (pBankCD:Extended;pBranchCD:Integer;  var NM,NMK: String): Boolean;

    //<001>TreeDrag Drop時の更新処理
    function    fnUpDateTreeDrop    (BfrBankCD,AftBankCD:Extended; BranchCD: Integer): Boolean;
    function    fnBankNCodeGet      (BankCD:Integer):Extended;

    // 参照用
    procedure   fnPartsControl(Select: Integer);
    procedure   fnGetGrants   ();


    procedure fnGetBraName(pBkCode:Integer;pBraCode:Integer);
    procedure fnGetBKName(pBkCode:Integer);

    // <CHK>削除ﾁｪｯｸ
    function  fnDelCheck(exNCode: Extended; var strErr: String): Boolean;           // 支店
    function  fnDelCheckBank(exBankNCode: Extended; var strErr: String): Boolean;   // 銀行

    function  fnMakeDspString(CODE: Integer; NAME: String;KETA:Integer): String;    //<009>

    function  fnChkGroupKbn(): Boolean;                                             // <011>

    function  IsDeleteEnable(DMemBank : TdxMemData): Boolean;						// <015>

    procedure SessionPractice(iSyori: Integer);	// <017> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
    function  fnDelCRLF(sData: String): String;	// <DKAI> 改行削除
	function  fnWFChk_FriBank(iChkKbn: Integer; iBkNCd: Integer ): Boolean;		// <020> Add

    function GetPayCommonValue(sSection, sKey: String): String;                 // <SCA> ADD

  protected
	procedure CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;


  public
	{ Public 宣言 }
	constructor CreateForm(pRec:pointer);										// ｺﾝｽﾄﾗｸﾀ
  end;

function AppEntry(pPar : Pointer)	:	Integer;
function fnCopy(sSrc:string;iPos,iLen:integer):String;

exports
	AppEntry;

implementation

uses
  JNTCRP008003DlgU;

//<001>
const
    TreeBankF = 1;         //本店
    TreeBankS = 2;         //支店

	//	参照フラグ時に使用
	NORMAL					=	1;						//	通常処理
	BASICONLY				=	2;						//	基本のみ設定可能(詳細ボタン使用不可)
	REFER					=	3;						//	参照

    // -----<017> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<017> Add-Ed-----


{$R *.DFM}
//******************************************************************************
//		Proccess	: AppEntry
//		Name		: hzm
//		Date		: 2000/11/14
//		Parameter	: pPar
//		Return		: Integer
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function AppEntry(pPar	:	Pointer):	Integer;
var
	pFrm	:	^TJNTCRP008003BaseF;
	pRec	:	^TMjsAppRecord;
begin
	result	:=	ACTID_RET_OK;

	pRec	:=	Pointer(TAppParam(pPar^).pRecord);

	case TAppParam(pPar^).iAction of
		ACTID_FORMCREATESTART		:											//	Form Create要求
		begin
			new(pFrm);
			try
				pFrm^	:=	TJNTCRP008003BaseF.CreateForm(pPar);
				pRec^.m_pChildForm	:=	pFrm;
			except
				Dispose(pFrm);
				Result	:=	ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCREATESHOWSTART	:											//	Form Create&Show要求
		begin
			new(pFrm);
			try
				pFrm^	:=	TJNTCRP008003BaseF.CreateForm(pRec);
				pFrm^.Show();
				pRec^.m_pChildForm	:=	pFrm;
			except
				Dispose(pFrm);
				Result	:=	ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCLOSESTART		:											//	Form Close要求
		begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			pFrm^.Close();
			pFrm^.Free();
			Dispose(pFrm);
		end;

		ACTID_FORMCANCLOSESTART		:											//	Form CanClose要求
		begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			// 2001/01/20 KOS ADD
			if pFrm^.CloseQuery = False then
				Result	:=	ACTID_RET_NG;
			// END
		end;

		ACTID_SHOWSTART				:											//	Show要求
		begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			pFrm^.Show();
		end;

		ACTID_HIDESTART :														// Hide要求
		begin
			pFrm := Pointer( pRec^.m_pChildForm );
			if pFrm^.Parent <> nil then
				pFrm^.Hide();
		end;
	end;
end;

//******************************************************************************
//		constructor	: ﾌｫｰﾑを作成
//		Name		: hzm
//		Date		: 2000/11/14
//		Parameter	: pRec		: TMjsAppRecordﾎﾟｲﾝﾀ
//		Return		: なし
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
constructor TJNTCRP008003BaseF.CreateForm(pRec: pointer);
begin

	dbCorp	:= nil;
	dbCtlDb	:= nil;

//    m_cJNTArea      :=  TJNTCommon.Create(Self); <003>
//    m_cJNTArea.Init(Pointer( TAppParam( pRec^ ).pRecord )); <003>
//    m_cJNTArea.SetMasAppRecord;

    m_pRec          := Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave
    m_pMDataModule  := TMDataModulef (m_pRec^.m_pDBModule^  );
	m_cComArea		:= TJNTMASCom       (m_pRec^.m_pSystemArea^);

    m_CmpList := TList(TAppParam(pRec^).pActionParam^);
    m_TantoNCode    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <018>

    //共通DB Open
	dbCtlDb := m_pMDataModule.CTLDBOpen(0);
	if dbCtlDb = nil then
	begin
		MjsMessageBox(Self,'共通DB接続処理(JNTCRP008003)', mjError, mjDefOk);
		m_pMDataModule.COPDBClose(dbCorp);
		Abort;
	end;

    //会社DB Open
	dbCorp := m_pMDataModule.COPDBOpen(1,m_cComArea.m_iCopNo);
	if dbCorp = nil then
	begin
		MjsMessageBox(Self,'会社DB接続処理(JNTCRP008003)', mjError, mjDefOk);
		Abort;
	end;

// ↓↓↓<PRN>

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
    	if ( uvSelSys.CreateSysInfo(dbCorp) <> 0 ) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;

// ↑↑↑<PRN>


inherited Create(TForm(m_pRec^.m_pOwnerForm^))


end;

//************************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/20(T.Aoki)
//					:ﾃﾞｻﾞｲﾝ時のﾌﾟﾛﾊﾟﾃｨを実行時に補正する
//					:04/12/06(T.Aoki)
//					:高解像度対応
//************************************************************************
procedure TJNTCRP008003BaseF.FormCreate(Sender: TObject);
var
	DMQuery		:TMQuery;
//	iErrorFlag	:Integer;
	i:integer;

    iRet        :   Integer;        // <PRN>
    lvHandle    :   THandle;        // <PRN>
//↓<CDCHG>
    ACheck: array of TMLicenseInfo;
    AIndex: Integer;
//↑<CDCHG>
begin
	// -----<017> Add-St-----
	SPMsHist.Connection := dbCorp;
	//SPMsHist.SessionName  := dbCorp.SessionName;
	// -----<017> Add-Ed-----

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    B_Print 	     := TMSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    B_Ins            := TMSpeedButton( m_CmpList.Items[1]^ );
    B_Delete         := TMSpeedButton( m_CmpList.Items[2]^ );
    P_ComBox         := TMComboBox   ( m_CmpList.Items[8]^ );     // 機能選択
    m_cJNTArea       := TJNTCommon   ( m_CmpList.Items[9]^ );     // <003>
    m_Base_pRec      := Pointer      ( m_CmpList.Items[10]^);
    B_Change         := TMSpeedButton( m_CmpList.Items[11]^);
    B_CodeChange     := TMSpeedButton( m_CmpList.Items[15]^ );	//<CDCHG>

    B_Print.OnClick  := BPrintClick;
    B_Ins.OnClick    := BInsertClick;
    B_Delete.OnClick := BDeleteClick;
    B_Change.OnClick := BChangeClick;
    B_CodeChange.OnClick := BCodeChangeClick;	//<CDCHG>
    //--------------------------------------------------------------------------

    m_bDelete := True;					// <015> ADD 削除可能に

	// WF申請エラー用Msg
	m_sWFError := '債務管理（経費精算）の支払処理で承認申請されているため、関連情報の修正は行えません。'; // <020> Add

    fnGetGrants();                      // 権限取得

// <016> MOD start
(*
// <014> MOD start
    // ｸﾞﾙｰﾌﾟ管理の確認<011>
//    fnChkGroupKbn();
    //if m_bDelete then					// 決算確定済みでない場合
    begin
     	fnChkGroupKbn();				// ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ
    end;
// <014> MOD end
*)

 	if giReferFlag <> REFER then        // 決算確定時および権限なしの場合
    begin
     	fnChkGroupKbn();				// ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ
    end;
// <016> MOD end

	fnPartsControl(giReferFlag);

//	<DSP>
	m_ratio := MjsFontResize(TJNTCRP008003BaseF(Self),pointer(m_pRec));

	bMTabKeyDown:=FALSE;

	//ﾃﾞｻﾞｲﾝ時はalClientにしない方がｺﾝﾃﾅのﾊﾟｰﾂ掴み易いのでは...
	GrBranch.Align:=alClient;
	//同じくﾊﾟﾈﾙは実行時までは別々にしていおいた方が重なりが分かり易いのでは...
	for i:=0 to ComponentCount-1 do
	begin
{↓<MLXHAP>
		if(Components[i]is TPanel)and
		  (Components[i]<>MPanel3)then
↑<MLXHAP>}
		if(Components[i]is TPanel)then //<MLXHAP>MLXカラー対応のため、MPanel3を削除したので。
			with(Components[i]as TPanel)do
				ParentColor:=TRUE;
	end;

	with GrBank do
	begin
		Options	:=Options+[egoLoadAllRecords];
		OptionsEx:=OptionsEx-[egoAutoSort];
		KeyField:='RecId';
	end;
	with GrBranch do
	begin
		Options	:=Options+[egoLoadAllRecords];
		OptionsEx:=OptionsEx-[egoAutoSort];
		KeyField:='RecId';
	end;

	//↓初期起動->ﾀﾌﾞで支店に切替でｸﾞﾘｯﾄﾞが空白2行表示になるのを回避するため必要
	MdBranch.Close;
	MdBranch.Open;
	//↑初期起動->ﾀﾌﾞで支店に切替でｸﾞﾘｯﾄﾞが空白2行表示になるのを回避するため必要


	Parent	:= TPanel(m_pRec^.m_pOwnerPanel^);
	Align	:= alClient;
	ACControl:=GrBank;

    m_RepHandle	:= 0;       // 印刷モジュールハンドル <019>

    // システム色の設定
	MJSColorChange (TJNTCRP008003Basef (Self), m_cComArea.SystemArea.SysColorB, m_cComArea.SystemArea.SysColorD,
									m_cComArea.SystemArea.SysBaseColorB, m_cComArea.SystemArea.SysBaseColorD,
															rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	fnFBCharInit;								//	FB用変換テーブル初期化
//	~~~~~~~~~~	①FBテーブル初期化


	DMQuery := TMQuery.Create(Self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	m_pMDataModule.SetDBInfoToQuery(dbCorp, DMQuery);

	with MdBank do
	begin
		BeforePost:=nil;
		DisableControls;
	end;
	MTab.OnChange:=nil;
	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear();
				SQL.Add('SELECT NCode,BankCode,BankName,BankKana FROM HAPBF');
				SQL.Add('Order by BankCode');
				Open(TRUE);
			end;
			with MdBank do
			begin
				Close;
				Open;
				while not DMQuery.Eof do
				begin
					Append;
                    FieldByName('NCode').AsFloat  :=DMQuery.GetFld('NCode').AsFloat;
					FieldByName('BankCode').AsInteger:=DMQuery.GetFld('BankCode').AsInteger;
					FieldByName('BankName').AsString :=DMQuery.GetFld('BankName').AsString;
					FieldByName('BankKana').AsString :=DMQuery.GetFld('BankKana').AsString;

					Post;

					DMQuery.Next;
				end;
			end;
		except
			raise Exception.Create('振込先銀行の取得に失敗しました');
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
		giTabIndex:=MTab.Items.Selected;
		giGetFocus:=False;

		MTab.OnChange:=MTabChange;
		with MdBank do
		begin
			EnableControls;
			BeforePost	:=MdBankBeforePost;
			AfterInsert	:=MdBankAfterInsert;


			MTab.Items[1].Enabled:=RecordCount>0;

// <013> MOD start
(*
   			B_Delete.Enabled :=RecordCount>0;
			if m_IsUpdate then
      			B_Ins.Enabled   :=RecordCount>0
            else
                B_Ins.Enabled   := False;
*)

			if giReferFlag = REFER then  	// 参照時
            begin
// <015> MOD start
//            	B_Delete.Enabled := False;  // 削除ﾎﾞﾀﾝを無効にする
											// 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
                B_Delete.Enabled := IsDeleteEnable(MdBank);
// <015> MOD end

				B_Ins.Enabled := False;     // 挿入ﾎﾞﾀﾝを無効にする

                B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
            end
            else
            begin
            	if m_cJNTArea.IsDelete then // 削除権限がある場合
                begin                       // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
                 	B_Delete.Enabled := RecordCount > 0;
                end
                else                    	// 削除権限がない場合
                begin                       // 削除ﾎﾞﾀﾝを無効にする
					B_Delete.Enabled := False;
                end;

                if m_IsUpdate then      	// 追加および修正権限がある場合
                begin                       // ﾃﾞｰﾀがある場合は挿入ﾎﾞﾀﾝを有効にする
					B_Ins.Enabled := RecordCount > 0
                end
                else                      	// 追加および修正権限がない場合
                begin
                	B_Ins.Enabled := False; // 挿入ﾎﾞﾀﾝを無効にする
                end;

                //↓<CDCHG>
            	if m_cJNTArea.IsDelete then // 削除権限がある場合
                begin                       // ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                 	B_CodeChange.Enabled := RecordCount > 0;
                end
                else                    	// 削除権限がない場合
                begin                       // ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
					B_CodeChange.Enabled := False;
                end;
                //↑<CDCHG>
            end;
// <013> MOD end

			//空でなければ先頭へ
			if(RecordCount>0)then
				First
			else
			begin
				//空行が2行できるのを防ぐ?
				Close;
				Open;
			end;
		end;
		MdBankAfterInsert(MdBank);
	end;


// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    m_pMDataModule.SetDBInfoToQuery(dbCorp,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
    lvHandle := 0;
	try
// <LPH> MOD-STR
//		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008003L.BPL');
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008003L.BPL');
// <LPH> MOD-END

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP008003LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
// <LPH> MOD-STR
//    	UnloadPackage( lvHandle );
    	UnloadPackageHelper( lvHandle );
// <LPH> MOD-END
    end;

    m_RepHandle	:= lvHandle;            // 印刷モジュールハンドル <019>

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
			Para		    :=  uvHani;
			TargetQry	    :=  nil;
			CorpSys		    :=  uvSelSys;
            iAPP_HDL_REC    :=  100;
            JntArea         :=  m_cJNTArea;
		end;

		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    gfnHaniInit(Self,
                m_Base_pRec,
                m_pMDataModule,
                m_cComArea,
                dbCorp,
                'JNTCRP008003',
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------

//↓<CDCHG>モジュールライセンスをチェックします
    SetLength(ACheck, 2);

    ACheck[0].ModuleCode	:= FXLicense.MAS_SMU;	// 債務
    ACheck[1].ModuleCode	:= FXLicense.MAS_SEI;	// 経費精算

    CheckModuleLicenses(m_Base_pRec, ACheck);

    for AIndex := Low(ACheck) to High(ACheck) do
    begin
		case ACheck[AIndex].ModuleCode of
            FXLicense.MAS_SMU:	m_bSaimu	:= ACheck[AIndex].IsLicense;
            FXLicense.MAS_SEI:	m_bKeihi	:= ACheck[AIndex].IsLicense;
        end;
    end;

    SetLength(ACheck, 0);
//↑<CDCHG>

    m_bAllowSameBraCode := (GetPayCommonValue('Master', 'HAPBS_SAMECODE') = '1');   // 同一振込先支店コード可区分 <SCA> ADD
end;

//************************************************************************
//	Component		:	Form
//	Event			:	Close
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.FormClose(Sender: TObject; var Action: TCloseAction);
var
	AppPrm	: TAppParam;
begin
//    m_cJNTArea.Free; <003>

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	Action	  := caFree;
	m_pRec^.m_iDelete	:=	1;

	AppPrm.iAction		:=	ACTID_FORMCLOSEEND;
	AppPrm.pRecord		:=	Pointer(m_pRec);
	AppPrm.pActionParam	:=	nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
end;

//************************************************************************
//	Component		:	Form
//	Event			:	CloseQuery
//	Name			:	hzm
//	履歴			:	印刷プレビュー処理追加		2001/01/20 KOS
//************************************************************************
procedure TJNTCRP008003BaseF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	gsText : string;
begin
// 印刷処理が実行中なら処理を行わない
// <006>ｺﾒﾝﾄｱｳﾄ
{	if PrnForm <> NIl then														// 印刷オブジェクトあり
	begin
		if PrnForm.mjsPreview.IsPreview then
		begin
}
{			m_pCommonArea.{m_MsgStd.GetMsg(MjsMsgRec, 10040,2);
			MjsMessageBoxEx(MjsMsgRec.Msg, MjsMsgRec.sTitle,
							MjsMsgRec.iconType, MjsMsgRec,BtnType
							MjsMsgRec.btnDef, MjsMsgRec.LogType);
}
// <006>ｺﾒﾝﾄｱｳﾄ
{
			gsText	:= 'プレビュー中のため、処理を終了できません。' +#13#10;	//2001/01/26 ADD
			gsText	:= gsText + 'プレビューを終了してください。';
			MjsMessageBoxEX(Self,gsText, 'エラー', mjError, mjOK, mjDefOK);
			CanClose := False;													// 終了不可
		end
		else
		begin
			CanClose := True;
		end;
	end;
}
// <006>↓追加
    if uvHani.mjspre <> nil then
    begin
        if (uvHani.mjspre.IsPreview = True) then
        begin
//			m_pCommonArea.m_MsgStd.GetMsg(MjsMsgRec, 10040,2);
            Beep;
{			MjsMessageBoxEx(MjsMsgRec.Msg, MjsMsgRec.sTitle,
							MjsMsgRec.iconType, MjsMsgRec,BtnType
							MjsMsgRec.btnDef, MjsMsgRec.LogType);
}
			gsText	:= 'プレビュー中のため、処理を終了できません。' +#13#10;	//2001/01/26 ADD
			gsText	:= gsText + 'プレビューを終了してください。';
			MjsMessageBoxEX(Self,gsText, 'エラー', mjError, mjOK, mjDefOK);

            CanClose := False;
            Exit;
        end;
    end;
// <006>↑
end;

//************************************************************************
//	Component		:	CloseBtn
//	Event			:	Click
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.CloseBtnClick(Sender: TObject);
var
	wRtn	:	Word;
begin
	case giTabIndex of
		0:
		begin
			if	 MdBank.RecordCount > 0 then
			begin
				if MdBank.State in [dsInsert,dsEdit] then
				begin
{<001>
					GetMsg(rcMsg,110,1);
					with rcMsg do
						WRtn:=MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);

					if wRtn = mrYes then
					begin
						MdBank.Cancel;
						Close;
					end
					else if wRtn=mrNo then
					begin
						if CheckdsInsert_Bank then
							MdBank.Post;
						Close;
					end
					else
    					Exit;
}
				end
				else
					Close;
			end
			else
			begin
				MdBank.Cancel;
				Close;
			end;
		end;
		1:
		begin
			if	MdBranch.RecordCount > 0 then
			begin
				if MdBranch.State in [dsInsert,dsEdit] then
				begin
{<001>
					GetMsg(rcMsg,110,1);
					with rcMsg do
						WRtn:=MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);

					if wRtn = mrYes then
					begin
						MdBranch.Cancel;
						Close;
					end
					else if wRtn=mrNo then

					begin
						if CheckdsInsert_Siten then
							MdBranch.Post;
						Close;
					end
					else
    					Exit;
}
				end
				else
					Close;

			end
			else
			begin
				MdBranch.Cancel;
				Close;
			end;
		end;
	end;
end;

//************************************************************************
//		Component	:Form
//		Event		:CMChildKey
//		Name		:HZM
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/20(T.Aoki)
//					:・ｸﾞﾘｯﾄﾞの[Ctrl]+[End](->最下行へ)を有効にする
//					:・ｸﾞﾘｯﾄﾞ以外(MTab.ﾂﾘｰﾋﾞｭｰ)で終了できないのを修正(≒ML)
//************************************************************************
procedure TJNTCRP008003BaseF.CMChildKey(var Msg : TWMKey);
var
	sShift	:	TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	 := MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD
	ACControl:= Screen.ActiveControl;

	//Escは必ず終了(≒ML)
	if(Msg.CharCode = VK_ESCAPE) then
	begin
		if (ACControl is TdxDBGrid) then
		begin
	    	// hirota 051206 >>
			if	(((ACControl as TdxDBGrid).DataSource.DataSet.State in [dsEdit, dsInsert]) or	// ﾃﾞｰﾀ変更中
				 ((ACControl as TdxDBGrid).EditingText <> '')) then						// ﾃﾞｰﾀ入力中
				Exit;
	    	// hirota 051206 <<
        {
			if((ACControl as TdxDBGrid).DataLink.Editing)then
				Exit;
}
//↑↓空のときうまく行かないので止めた
{
			with(ACControl as TdxDBGrid).DataSource.DataSet do
			begin
				if(State=dsEdit)then
					Exit;

				if(State=dsInsert)and
				  (RecordCount>0)then
					Exit;
			end;
}
		end;
//<001>↓正常にCloseが行われない為アドレス違反となる
//		Self.Close;
//		Msg.CharCode := 0;
//		Abort;

        ACControl := P_ComBox;
        ACControl.SetFocus;
        abort;
	end;

	if ACControl is TdxDBGrid then
	begin
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) or ( Msg.CharCode = VK_UP ) or ( Msg.CharCode = VK_LEFT )then
		begin
			if	(( ACControl as TdxDBGrid ).FocusedNode.AbsoluteIndex = 0)
					and (( ACControl as TdxDBGrid ).FocusedColumn=0) then
			begin
				MjsPrevCtrl( Self );
				Msg.CharCode := 0;
				Abort;
			end;
		end;
		if (Msg.CharCode = VK_END) or
		   (Msg.CharCode = VK_ESCAPE) then
		begin
			if Msg.CharCode = VK_END then
			begin
				//[Ctrl]+[End](->最下行へ)を有効にする
				if(sShift=[ssCtrl])then
					Exit;

				//左端で[End]は終了...
				if (ACControl as TdxDBGrid).FocusedColumn<>0 then
				begin
					Exit;
				end;
			end;
            ACControl := P_ComBox;
            ACControl.SetFocus;
            abort;
//          Close;
//			Msg.CharCode := 0;
//			Abort;
		end;
	end;
	case Msg.CharCode of
		VK_TAB:
		if ( sShift = [ssShift] ) then
		begin
			if ACControl is TMTab then											//TMTabならば無視
			begin																//20000112 naka
				MjsPrevCtrl( Self );
				Msg.CharCode := 0;
				Abort;
			end;
		end;
	end;

    // <008>↓
	if ACControl is TMTreeView then         // ﾂﾘｰﾋﾞｭｰ
	begin                                   // Return か Tab
		if ( Msg.CharCode = VK_RETURN ) or
            (( Msg.CharCode = VK_TAB ) and ( sShift = [] )) then
        begin
            MjsNextCtrl( Self );
            Abort;
		end;
	end;
    // <008>↑

	if ACControl is TMTab then
	begin
		case Msg.CharCode of
			VK_RIGHT,VK_LEFT:
				bMTabKeyDown:=TRUE;
		end;
	end;

inherited;
end;

//************************************************************************
//	Component		:	Form
//	Event			:	Resize
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.FormResize(Sender: TObject);
var
	iPosition,iPositionP	:	Integer;
begin
//	iPosition := self.Width;													//	フォームの幅サイズ
//	case giTabIndex of
//		0:
		begin
			iPosition := self.Width;											//	フォームの幅サイズ
			iPositionP := Panel1.Width;
			iPosition := ( iPosition - iPositionP ) div 2;
			panel1.Left := iPosition;
// <DSP>
			//パネルサイズ不具合のため追加　　									2001/01/24 KOS.hori
//			Panel1.Height := clientHeight - 89;
//			Panel1.Height := clientHeight - b1Group.Height - MTab.Height - SStatusBar.Height - 2;
//			Panel1.Height := clientHeight - MTab.Height - SStatusBar.Height - 2;
		end;
//		1:
		begin
			iPosition := self.Width;											//	フォームの幅サイズ
			iPositionP := Panel23.Width;
			iPosition := ( iPosition - iPositionP ) div 2;
			panel23.Left := iPosition;
// <DSP>
			//パネルサイズ不具合のため追加　　									2001/01/24 KOS.hori
//			Panel23.Height := clientHeight - 89;
// 			Panel23.Height := clientHeight - b1Group.Height - MTab.Height - SStatusBar.Height - 2;
// 			Panel23.Height := clientHeight - MTab.Height - SStatusBar.Height - 2;
		end;
//	end;
end;

//******************************************************************************
//		Component	: フォーム非表示
//		Event		: Hide
//		Name		: Hzm
//******************************************************************************
procedure TJNTCRP008003BaseF.FormHide(Sender: TObject);
begin
	if PrnForm <> NIl then														// 印刷オブジェクトあり
	begin
		if PrnForm.mjsPreview.IsPreview then
			PrnForm.mjspreview.Hide;
	end;
	MjsBtnVisible(	TJNTCRP008003BaseF( Self ), FALSE);
end;

//************************************************************************
//		Component	:Form
//		Event		:Destroy
//		Name		:hzm
//		History		:04/02/19(T.Aoki)
//					:ﾂﾘｰのDataﾌﾟﾛﾊﾟﾃｨに銀行ｺｰﾄﾞを格納するようにしたのでここでDispose
//************************************************************************
procedure TJNTCRP008003BaseF.FormDestroy(Sender: TObject);
var
	i:integer;
begin

	with TView do
	begin
		for i:=0 to Items.Count-1 do
			if Items[i].Data<>nil then
				dispose(Items[i].Data);
	end;

	m_pMDataModule.COPDBClose(dbCorp);
	m_pMDataModule.CTLDBClose(dbCtlDb);
	dbCorp	:= nil;
	dbCtlDb		:= nil;

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
		Para		:=  uvHani;
		TargetQry   :=  nil;
		CorpSys		:=  uvSelSys;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,6,PrtParam,ArrHdl);

//<019>↓↓
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
//<019>↑↑

end;

//************************************************************************
//	Component		:	Form
//	Event			:	Show
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.FormShow(Sender: TObject);
begin
	MjsBtnVisible(	TJNTCRP008003BaseF( Self ), TRUE );
	if PrnForm <> NIl then														// 印刷オブジェクトあり
	begin
		if PrnForm.mjsPreview.IsPreview then
			PrnForm.mjspreview.Show;											//プレビュー中はPreview画面表示
	end
	else
	begin
		ACControl.SetFocus;														// ﾌｫｰｶｽ復帰
		giGetFocus:=True;
	end;
	FormActivate(Sender);
//	ACControl.setFocus;
end;

(*
//************************************************************************
//	Component		:	ChangeBtn
//	Event			:	Click
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.BChangeClick(Sender: TObject);
var
	m_cAppPrm : TAppParam;
begin
	Hide;
	self.Visible:=False;
	if  (Parent = nil) then
	begin
		Parent  := TPanel (m_pRec^.m_pOwnerPanel^);
		Align  := alClient;
		BorderStyle := bsNone;
		Position := poDesigned;

//		BChange.Caption	:= '切出(&G)';
		m_cAppPrm.iAction  := ACTID_DOCKINGINEND;	   						// 取出通知
	end
	else
	begin
		Parent	:= nil;
		Align	 := alNone;
		BorderStyle := bsSizeable;
		Position := poDefaultPosOnly;

//		BChange.Caption	:= '埋込(&G)';
		m_cAppPrm.iAction  := ACTID_DOCKINGOUTEND;	  						// 格納通知

//	<DSP>
//		Self.ClientWidth :=945;
//		Self.ClientHeight :=622;
		Self.ClientWidth :=Trunc(945 * m_ratio / 100);
		Self.ClientHeight :=Trunc(622 * m_ratio / 100);
	end;
	m_cAppPrm.pRecord  := Pointer(m_pRec);										// 管理構造体ﾎﾟｲﾝﾀ設定
	m_cAppPrm.pActionParam := nil;		   									// 予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@m_cAppPrm);	   					// メニューに告知
	self.Visible:=True;
	Show;
end;
*)
//************************************************************************
//	Component		:	MTab
//	Event			:	KeyDown
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.MTabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if( Key = VK_END ) or ( Key = VK_ESCAPE )then								//EndキーとEscキー処理
	begin
//		CloseBtnClick(self);
        ACControl := P_ComBox;
        ACControl.SetFocus;
		Key := 0;
        abort;
	end;
	if ((Key = VK_Return) and (Shift = [])) then								//Return処理
	begin
		MJSNextCtrl(self);
		Abort;
	end;
	if (Key = VK_TAB) and (Shift = [ssShift]) then								// Shift + Tab処理
	begin
{		if ACControl is giTabIndex then											//コンボならば無視
		begin
			Msg.Result := 0;
		Abort;
	end
	else
}
		MJSPrevCtrl(self);
		Abort;
	end;
end;
//************************************************************************
//	Component		:	MTab
//	Event			:	Enter
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.MTabEnter(Sender: TObject);
begin
	ACControl:=Screen.ActiveControl;
end;

//**********************************************************************
//		Component	:BInsert
//		Event		:Click
//		Process		:新規ﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:hzm
//		Date		:00/11/16
//		Parameter	:なし
//		Return		:なし
//		History		:04/02/25(T.Aoki)
//					:・新規登録中に押下された時,
//					:  (旧)現在入力を破棄確認して新規行作成->(新)何もしないに変更
//					:・ﾀﾌﾞでも新規挿入できるように修正
//**********************************************************************
procedure TJNTCRP008003BaseF.BInsertClick(Sender: TObject);
var
	GrIns:TdxDBGrid;
	MData:TdxMemData;
begin
	case giTabIndex of
		//銀行
		0:		GrIns:=GrBank;
		//支店
		1:		GrIns:=GrBranch;
		//一応
		else	Exit;
	end;

	//MemData操作
	MData:=GrIns.DataSource.DataSet as TdxMemData;
	with MData do
	begin
		//挿入中?
		if(State in [dsInsert])then
			Exit
		//編集中?
		else if State in [dsEdit] then
			Post;

		Insert;
	end;
	//既にﾌｫｰｶｽがｸﾞﾘｯﾄﾞにある
	if(Screen.ActiveControl=GrIns)then
		Exit;

	//他(ﾀﾌﾞかﾂﾘｰ)なら移動
	GrIns.FocusedColumn:=0;
	MjsSetFocus(Self,GrIns.Name);

end;

//************************************************************************
//	Component		:	MdBank
//	Event			:	AfterCancel
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.MdBankAfterCancel(DataSet: TDataSet);
begin
//	inherited;
//	if giDataCnt > 0 then														//データがあれば
	if DataSet.RecordCount > 0 then
	begin
//		BInsert.Enabled := TRUE;
	end
	else																		//データがなければ
	begin
//		BInsert.Enabled := FALSE;
		//MdBank.Insert;
	end;
end;

//************************************************************************
//		Component	:MdBank
//		Event		:AfterDelete
//		Process		:振込先銀行MemData 削除後
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/04
//					:ﾀﾌﾞ/印刷ﾎﾞﾀﾝの制御を追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBankAfterDelete(DataSet: TDataSet);
begin


	//前面が"銀行"ではない?
	if(MTab.Items.Selected<>0)then
		Exit;

	with(DataSet as TdxMemData)do
	begin
		MTab.Items[1].Enabled:=RecordCount>0;

// <013> MOD start
(*
        // 削除ﾎﾞﾀﾝ
        if m_cJNTArea.IsDelete then
      		B_Delete.Enabled := RecordCount>0
        else
      		B_Delete.Enabled := False;

        // 挿入ﾎﾞﾀﾝ
        if m_IsUpdate then
   			B_Ins.Enabled   :=RecordCount>0
        else
            B_Ins.Enabled   := False;
*)
		if giReferFlag	= REFER then  	// 参照時
        begin
// <015> MOD start
//        	B_Delete.Enabled := False;  // 削除ﾎﾞﾀﾝを無効にする
										// 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
            B_Delete.Enabled := IsDeleteEnable(MdBank);
// <015> MOD end

            B_Ins.Enabled   := False;   // 挿入ﾎﾞﾀﾝを無効にする

            B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
        end
        else
        begin
          	if m_cJNTArea.IsDelete then // 削除権限がある場合
            begin                       // ﾃﾞｰﾀがあれば削除ﾎﾞﾀﾝを有効にする
				B_Delete.Enabled := RecordCount > 0;
            end
            else                     	// 削除権限がない場合
            begin                       // 削除ﾎﾞﾀﾝを無効にする
            	B_Delete.Enabled := False;
            end;

            if m_IsUpdate then    		// 追加および修正権限がある場合
            begin                       // ﾃﾞｰﾀがあれば挿入ﾎﾞﾀﾝを有効にする
            	B_Ins.Enabled := RecordCount > 0;
            end
            else               			// 追加および修正権限がない場合
            begin
				B_Ins.Enabled := False; // 挿入ﾎﾞﾀﾝを無効にする
            end;

            //↓<CDCHG>
            if m_cJNTArea.IsDelete then // 削除権限がある場合
            begin                       // ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                B_CodeChange.Enabled := RecordCount > 0;
            end
            else                    	// 削除権限がない場合
            begin                       // ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                B_CodeChange.Enabled := False;
            end;
            //↑<CDCHG>
		end;

// <013> MOD end

// <005>
//(*<0830>
        if m_cJNTArea.IsPrint then
    		B_Print.Enabled		 :=RecordCount>0
        else
            B_Print.Enabled		 :=False;
//*)
    end;
end;

//************************************************************************
//		Component	:MdBank
//		Event		:AfterInsert
//		Process		:振込先銀行MemData 挿入後
//		Name		:hzm
//		Date		:99/99/99(X.Name)
//		Parameter	:
//		Return		:
//		History		:04/02/24(T.Aoki)
//					:ﾀﾌﾞ/印刷ﾎﾞﾀﾝの制御を追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBankAfterInsert(DataSet: TDataSet);
begin
	//前面が"銀行"ではない?
	if(MTab.Items.Selected<>0)then
		Exit;

	with(DataSet as TdxMemData)do
	begin
		MTab.Items[1].Enabled:=RecordCount>0;

// <013> MOD start
(*
        // 削除ﾎﾞﾀﾝ
        if m_cJNTArea.IsDelete then
      		B_Delete.Enabled := RecordCount>0
        else
      		B_Delete.Enabled := False;

        // 挿入ﾎﾞﾀﾝ
        if m_IsUpdate then
   			B_Ins.Enabled   :=RecordCount>0
        else
            B_Ins.Enabled   := False;
*)
        if giReferFlag = REFER then  		// 参照時
        begin
// <015> MOD start
//        	B_Delete.Enabled := False;		// 削除ﾎﾞﾀﾝを無効にする
											// 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
            B_Delete.Enabled := IsDeleteEnable(MdBank);
// <015> MOD end
			B_Ins.Enabled := False;         // 挿入ﾎﾞﾀﾝを無効にする

            B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
        end
        else
        begin
         	if m_cJNTArea.IsDelete then    	// 削除権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
            	B_Delete.Enabled := RecordCount > 0;
            end
            else                      		// 削除権限がない場合
            begin
            	B_Delete.Enabled := False;  // 削除ﾎﾞﾀﾝを無効にする
            end;

            if m_IsUpDate then  			// 追加および修正権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は挿入ﾎﾞﾀﾝを有効にする
            	B_Ins.Enabled := RecordCount > 0;
            end
            else                       		// 追加および修正権限がない場合
            begin
            	B_Ins.Enabled := False;     // 挿入ﾎﾞﾀﾝを無効にする
            end;

            //↓<CDCHG>
            if m_cJNTArea.IsDelete then // 削除権限がある場合
            begin                       // ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                B_CodeChange.Enabled := RecordCount > 0;
            end
            else                    	// 削除権限がない場合
            begin                       // ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                B_CodeChange.Enabled := False;
            end;
            //↑<CDCHG>
        end;

// <013> MOD end

// <005>
//(*<0830>
        if m_cJNTArea.IsPrint then
    		B_Print.Enabled		 :=RecordCount>0
        else
            B_Print.Enabled      := False;

//*)
	end;
end;

//************************************************************************
//	Component		:	DDataGenKo
//	Event			:	StateChange
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.DDataGenKoStateChange(Sender: TObject);
begin
	if MdBank.State in [dsInsert] then								// [コード]の入力不可を切り替える
	begin
//↓<021>
        GrBankColBankCode.EditButtonStyle := ebsEllipsis;
        GrBankColBankCode.ClickKey        := TextToShortCut('F4');
//↑<021>
		GrBank.Columns[0].ReadOnly := False;
//<004>		GrBank.Columns[0].DisableEditor := False;
	end
	else																		// [コード]の入力可を切り替える
	begin
//↓<021>
        GrBankColBankCode.EditButtonStyle := ebsSimple;
        GrBankColBankCode.ClickKey        := TextToShortCut('');
//↑<021>
		GrBank.Columns[0].ReadOnly := True;
//<004>		GrBank.Columns[0].DisableEditor := true;
	end;

end;

//************************************************************************
//		Component	:MdBank
//		Event		:BeforePost
//		Process		:銀行ｸﾞﾘｯﾄﾞ 更新前
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/24(T.Aoki)
//					:桁数ｶﾞｰﾄﾞを追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBankBeforePost(DataSet: TDataSet);
var
	Fld			:	TField;
	iBankCode	:	Integer;
	sBankName	:	String;
	sBankKana	:	String;
	DMQuery		:	TMQuery;

	sTemp		: string;
	sEdit		: string;
	bCheckOK	: Boolean;
	sFieldName	: string;
	iErrorFlag  : integer;

    ExNCode     : Extended;

begin
//	if gBChangeBank then
//		exit;

	with DDataGenKo.DataSet do
	begin
// <020> Add start
        if( not fnWFChk_FriBank (0, Trunc(FieldByName('NCode').AsFloat))) then
        begin
            MjsMessageBox(Self,	m_sWFError,
                            mjWarning,
                            mjDefOK									);
            GrBank.FocusedColumn:=0;
            Abort;
        end;
// <020> Add end

		//ButtonColumにしたら桁数ｶﾞｰﾄﾞしてくれないようなので
		//ここでﾁｪｯｸ
		if(FieldByName('BankCode').AsInteger>9999)then
		begin
			MjsMessageBox(Self,	'銀行ｺｰﾄﾞは4桁以内で入力してください。',
							mjWarning,
							mjDefOK									);
			GrBank.FocusedColumn:=0;
			Abort;
		end;

		iBankCode := FieldByName('BankCode').AsInteger;
//<DKAI> MOD ↓
//		sBankName := trim(FieldByName('BankName').AsString);
//		sBankKana := trim(FieldByName('BankKana').AsString);
		sBankName := fnDelCRLF( trim(FieldByName('BankName').AsString) );
		sBankKana := fnDelCRLF( trim(FieldByName('BankKana').AsString) );
//<DKAI> MOD ↑

		//必須入力ﾁｪｯｸ
		bCheckOK	:= False;
{
		if iBankCode = 0 then
		begin
			sFieldName	:= 'BankCode';
			sTemp		:= '銀行ｺｰﾄﾞ';
		end
		else if sBankName = '' then
}
		if sBankName = '' then
		begin
			sFieldName	:= 'BankName';
			sTemp		:= '銀行名称';
		end
		else
			bCheckOK	:= True;		//必須入力OK

		if bCheckOK	= False then
		begin
{<001>
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(sTemp + sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
			FieldByName(sFieldName).FocusControl;
			Abort;
		end;

		//2001/08/08 KOS FBチェック	   ~~~~~~~~~~~~	②1行チェック＆変換
		{銀行名カナ}
		if fnFBKanaChange(sBankKana, sEdit, False) = False then
		begin
{<001>
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字が入力されています。';
				MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			FieldByName('BankKana').FocusControl;
			Abort;

		end;
		sBankKana := sEdit;
		FieldByName('BankKana').AsString := sEdit;
		//2001/08/08 KOS FBチェック	   ~~~~~~~~~~~~	END
	end;

	iErrorFlag := 0;
	DMQuery := TMQuery.Create(Self);											//	MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	m_pMDataModule.SetDBInfoToQuery( dbCorp, DMQuery );						//	DBとMQueryの接続

    SessionPractice(C_ST_PROCESS);				// <017>

	try
		try
			with DMQuery do
			begin
				{銀行ｺｰﾄﾞ重複ﾁｪｯｸ}
				SQL.Clear;
//<001>				SQL.Add('select BankCode from NSPBF where BankCode =:BankCode');
				SQL.Add('select BankCode from HAPBF where BankCode =:BankCode');
				ParamByName('BankCode').asinteger := iBankCode;				 // コードの検索
				Open();
				if ( EOF <> True ) then											// 重複あり？
				begin
					if MdBank.State in [dsInsert] then
					begin
						FLd := DDataGenKo.DataSet.FieldByName('BankCode');
{<001>
						GetMsg(rcMsg,20,2);
						with rcMsg do
							MjsMessageBox(sMsg,mjWarning,mjDefOk);
}
						MjsMessageBox(Self,'既に同一コードが入力済みです。',mjWarning,mjDefOk);
						FLd.FocusControl;
						iErrorFlag := -1;
						Abort;
					end;
				end;
				{銀行名称重複ﾁｪｯｸ}
				SQL.Clear;
//<001>				SQL.Add('select BankCode from NSPBF where BankName =:BankName');
    			SQL.Add('select BankCode from HAPBF where BankName =:BankName');
				ParamByName('BankName').asstring := sBankName;				 // Nameの検索
				Open();
				if ( EOF <> True ) then											// 重複あり？
				begin
					if DDataGenKo.DataSet.State in [dsInsert] then
					begin
						FLd := DDataGenKo.DataSet.FieldByName('BankName');
						MjsMessageBox(Self,'既に同一銀行名称が入力済みです。',mjWarning,mjDefOk);
						FLd.FocusControl;
						iErrorFlag := -1;
						Abort;
					end;
					if DDataGenKo.DataSet.State in [dsedit] then
					begin
						if GetFld('BankCode').AsInteger <> iBankCode then
						begin
							FLd := DDataGenKo.DataSet.FieldByName('BankName');
							MjsMessageBox(Self,'既に同一銀行名称が入力済みです。',mjWarning,mjDefOk);
							FLd.FocusControl;
							iErrorFlag := -1;
							Abort;
						end;
					end;
				end;

    			//念のためﾄﾗﾝｻﾞｸｼｮﾝで行う
	    		m_pMDataModule.BeginTran(dbCorp);

				{更新処理}
				if DDataGenKo.DataSet.State = dsInsert then
				begin
					SQL.Clear;
//<001>					SQL.ADD('Insert Into NSPBF (BankCode,BankName,BankKana)');

					SQL.ADD('Insert Into HAPBF (BankCode,BankName,BankKana,');
					SQL.ADD('UpdTantoNCode) '); // <018>
					SQL.ADD('Values (:No,:Name,:Kana,');
					SQL.ADD(':UpdTantoNCode) '); // <018>
					ParamByName('No').asinteger := iBankCode;
					ParamByName('Name').AsString := sBankName;
					ParamByName('Kana').AsString := sBankKana;
					ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode; // <018>
					ExecSQL(True);

                    //NCode取得
                    SQL.Clear;
                    SQL.Add('Select @@Identity as pNCode from HAPBF ');
                    if not Open then
                    begin
            			dbCorp.RollBack;
                        ShowMessage('Not Open HAPBF!!');
                		Abort;
                    end;

                    //ﾄﾗﾝｻﾞｸｼｮﾝ内で更新中のｲﾝｸﾘﾒﾝﾄ№を取得
                    ExNCode := GetFld('pNCode').AsFloat;
                    //MemDataに内部ｺｰﾄﾞをｾｯﾄ
                    MdBank.FieldByName('NCode').AsFloat:= ExNCode;


//					giDataCnt := giDataCnt + 1;
//					if	MTab.Enabled =False then
//						MTab.Enabled :=True;
					MTab.Items[1].Enabled:=TRUE;
//					MTab.Enabled:=MTab.Items[1].Enabled;
				end
				else
				begin
					SQL.Clear;
//<001>					SQL.Add( 'update NSPBF' );
					SQL.Add( 'Update HAPBF' );
					SQL.Add( 'set BankName   =:Name ,');
					SQL.Add( '	BankKana   =:Kana, ');
					SQL.Add( '	UpdTantoNCode =:UpdTantoNCode '); // <018>
					SQL.Add( 'where BankCode =:No');
					ParamByName('No').asinteger  := iBankCode;
					ParamByName('Name').AsString := sBankName;
					ParamByName('Kana').AsString := sBankKana;
           		    ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <018>
					ExecSQL(True);
				end;
                //Commit
				dbCorp.Commit;
			end;
		except
			if iErrorFlag = 0 then
			begin
				FLd := DDataGenKo.DataSet.FieldByName('BankCode');
{<001>
				GetMsg(rcMsg,1,4);
				with rcMsg do
					MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
				FLd.FocusControl;
			end;
		//Exit;	//Exitだとエラー処理されない（同一コード・名がグリッドに残る）
            if iErrorFlag <> -1 then    //<002> ﾄﾗﾝｻﾞｸｼｮﾝ開始前のｴﾗｰ。ﾛｰﾙﾊﾞｯｸの必要なし。
            begin
        		dbCorp.RollBack;
            end;
       		Abort;
		end;
	finally
    	SessionPractice(C_ED_PROCESS);			// <017>
		DMQuery.Close;
		DMQuery.Free;
	end;
end;


//************************************************************************
//		Component	:BDelete
//		Event		:Click
//		Process		:削除ﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/20(T.Aoki)
//					:・支店->銀行を名称で探す不具合修正
//					:  (ｺﾝﾊﾞｰﾄ/ﾃﾞｰﾀ交換で同一名銀行が存在するとNG)
//					:・社員連結ﾁｪｯｸ->(新規でなければ)削除確認->新規削除->既存削除から
//					:  新規削除->削除確認->社員連結ﾁｪｯｸ->既存削除へ変更
//					:・削除確認のDefをYes->Noへ変更
//					:07.05.16(T.Satoh)-<010>
//					:・操作手順によってはMemDataのNCodeがセットされていない為、
//					:  グリッド上で支店を削除できない場合があった
//************************************************************************
procedure TJNTCRP008003BaseF.BDeleteClick(Sender: TObject);
var
	DMQuery		:	TMQuery;
	sMsg,sTitle:string;
	bRet:boolean;
	i:integer;
	nParent:TTreeNode;
	DelBfr:TComponent;
	sSQL:string;
    exNCode : Extended;                     // <CHK>
    strErr, strMsg      : String;           // <CHK>
    strCode, strName    : String;           // <CHK>
// <020> Add start
	iBkChk	: Integer;
    iBkNCode: Integer;
// <020> Add end
begin
// <020> Add start
	iBkChk	:= 0;
    iBkNCode:= 0;
// <020> Add end
    exNCode := 0;

//[挿入]し入力途中または空のﾁｪｯｸ
	case giTabIndex of
		0:
		begin
			//IsEmpty?はNG
			if MdBank.RecordCount = 0 then
				Exit;

			if MdBank.State in [dsInsert] then
			begin
				MdBank.Delete;
				Exit;
			end;
		end;
		1:
		begin
			//IsEmpty?はNG
			if MdBranch.RecordCount = 0 then
				Exit;

			if MdBranch.State in [dsInsert] then
			begin
				MdBranch.Delete;
				if MdBranch.RecordCount = 0 then
					MdBranch.Insert;
				Exit;
			end;
		end;
	end;

//削除確認
	case giTabIndex of
		0:
		begin
			sMsg	:=	'('
					+	Format('%4.4u',[MdBank.FieldByName('BankCode').AsInteger])
					+	')'
					+	MdBank.FieldByName('BankName').AsString;

			sTitle	:='銀行';
// <020> Add start
            iBkChk := 0;
            iBkNCode := Trunc(MdBank.FieldByName('NCode').AsFloat);
// <020> Add end
		end;
		1:
		begin
			sMsg	:=	'('
					+	Format('%4.4u-%3.3u',[	MdBranch.FieldByName('BankCode').AsInteger,
												MdBranch.FieldByName('BranchCode').AsInteger])
					+	')'
					+	TTreeNode(MdBranch.FieldByName('TVItemPtr').AsInteger).Parent.Text
					+	'/'
					+	MdBranch.FieldByName('BranchName').AsString;

			sTitle	:='支店';
// <020> Add start
            iBkChk := 1;
            iBkNCode := Trunc(MdBranch.FieldByName('BranchNCode').AsFloat);
// <020> Add end
		end;
	end;
// <020> Add start
    if( not fnWFChk_FriBank (iBkChk, iBkNCode)) then
    begin
        MjsMessageBox(Self,	m_sWFError,
                        mjWarning,
                        mjDefOK									);
        Exit;
    end;
// <020> Add end

	sMsg	:=sMsg+#13#10'を削除してもよろしいですか？';
	sTitle	:=sTitle+'削除';

	if MjsMessageBoxEx(Self,	sMsg,
						sTitle,
						mjQuestion,
						mjYesNo,
						mjDefNo			)<>mrYes then
		Exit;

//社員登録済有無を確認
{<001>

	try
		bRet:=FALSE;
		case giTabIndex of
			0:
			begin
				with MdBank do
					bRet:=fnFindSyain(	FieldByName('BankCode').AsInteger	);
			end;
			1:
			begin
				with MdBranch do
					bRet:=fnFindSyain(	FieldByName('BankCode').AsInteger,
										FieldByName('BranchCode').AsInteger	);
			end;
		end;
		//該当社員[あり]
		if bRet then
		begin
			GetMsg(rcMsg,200,2);
			with rcMsg do
			begin
				sMsg:='社員登録されているため、削除できません。';
				MjsMessageBoxEx(sMsg,
								sTitle,
								IconType,
								BtnType,
								BtnDef,
								LogType		);
			end;
			Exit;

		end;
	except
		raise Exception.Create('社員情報の確認に失敗しました');
	end;
}

// <CHK>↓
		case giTabIndex of
			0:                              // 銀行→複数支店の削除ﾁｪｯｸ
			begin
                                            // 銀行内部ｺｰﾄﾞ
                exNCode := MdBank.FieldByName('NCode').AsFloat;
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
                if not fnDelCheckBank(exNCode, strErr) then
                begin
                    strCode := Format('%.4d', [MdBank.FieldByName('BankCode').AsInteger]);
                    strName := MdBank.FieldByName('BankName').AsString;
                                            // 「銀行ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
                    strMsg := strCode + ' ' + strName + ' ' + strErr;
                    MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
                    Exit;
                end;
			end;
			1:                              // 支店
			begin
                                            // 支店内部ｺｰﾄﾞ
                exNCode := MdBranch.FieldByName('BranchNCode').AsFloat;
//<010> - ST
                if exNCode = 0 then
                begin
                	DMQuery := TMQuery.Create( Self );							//MQueryの構築
        			m_pMDataModule.SetDBInfoToQuery( dbCorp, DMQuery );	        //DBとMQueryの接続

                    with DMQuery do
                    begin
                        Close;
                        SQL.Clear;
                        SQL.Add('SELECT Ncode '
                                + 'FROM HAPBS '
                                +'WHERE BankNCode = ' + FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode)
                                + ' AND BranchCode = ' + MdBranch.FieldByName('BranchCode').AsString);
                        SQL.Add(' AND BranchName = ' + AnsiQuotedStr(MdBranch.FieldByName('BranchName').AsString,''''));    // <SCA> ADD
                        Open(TRUE);

                        exNCode := DMQuery.GetFld('Ncode').AsFloat;
                    end;

                    DMQuery.Close;
                    DMQuery.Free;
                end;
//<010> - ED
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
                if not fnDelCheck(exNCode, strErr) then
                begin
                    strCode := Format('%.3d', [MdBranch.FieldByName('BranchCode').AsInteger]);
                    strName := MdBranch.FieldByName('BranchName').AsString;
                                            // 「支店ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
                    strMsg := strCode + ' ' + strName + ' ' + strErr;
                    MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
                    Exit;
                end;
            end;
        end;
// <CHK>↑

	//削除後のﾌｫｰｶｽ位置
	//(ｸﾞﾘｯﾄﾞが空になり,MemDataのClose/再Openをするとﾌｫｰｶｽが消失するので)
	DelBfr:=Screen.ActiveControl;

	DMQuery := TMQuery.Create( Self );								//MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

    SessionPractice(C_ST_PROCESS);				// <017>

	try
		try
			m_pMDataModule.SetDBInfoToQuery( dbCorp, DMQuery );	//DBとMQueryの接続

			//念のためﾄﾗﾝｻﾞｸｼｮﾝで行う
			m_pMDataModule.BeginTran(dbCorp);
			try
				case giTabIndex of
					//銀行
					0:
					begin
						//銀行-支店に削除ﾄﾘｶﾞがないのでLoop
						for i:=0 to 1 do
						begin
							sSQL:=			 'DELETE';
							sSQL:=sSQL+#13#10'FROM';

							//ﾄﾗﾝｻﾞｸｼｮﾝ中なので
							//銀行とのRelが切れた支店が残らない筈だが
							//一応支店から削除
{
							if(i=0)then
//<001>								sSQL:=sSQL+#13#10' NSPBS'
								sSQL:=sSQL+#13#10' FX_HAPBS'
							else
//<001>								sSQL:=sSQL+#13#10' NSPBF';
								sSQL:=sSQL+#13#10' FX_HAPBF';
							sSQL:=sSQL+#13#10'WHERE';
							sSQL:=sSQL+#13#10' BankCode=';
							sSQL:=sSQL+IntToStr(MdBank.FieldByName('BankCode').AsInteger);
}

							if(i=0)then
                            begin
								sSQL:=sSQL+#13#10' HAPBS';
    							sSQL:=sSQL+#13#10'WHERE';
	    						sSQL:=sSQL+#13#10' BankNCode=';
    	    					sSQL:=sSQL+FormatFloat('#',fnBankNCodeGet(MdBank.FieldByName('BankCode').AsInteger));
                            end
							else
                            begin
								sSQL:=sSQL+#13#10' HAPBF';
    							sSQL:=sSQL+#13#10'WHERE';
	    						sSQL:=sSQL+#13#10' BankCode=';
    							sSQL:=sSQL+IntToStr(MdBank.FieldByName('BankCode').AsInteger);
                            end;

							with DMQuery do
							begin
								Close;
								SQL.Clear;
								SQL.Add(sSQL);
								ExecSQL(TRUE);
							end;
						end;

						//MemDataから削除
						with MdBank do
						begin
							DisableControls;
							try
								Delete;
							finally
								EnableControls;
								//0件ならClose/再Openしないと最後の銀行が画面上残る
								if RecordCount=0 then
								begin
									Close;
									Open;
								end;
							end;
						end;
					end;

					//支店
					1:
					begin
						sSQL:=			 'DELETE';
						sSQL:=sSQL+#13#10'FROM';
						sSQL:=sSQL+#13#10' HAPBS';
						sSQL:=sSQL+#13#10'WHERE';

						sSQL:=sSQL+#13#10' BankNCode=';
    					sSQL:=sSQL+FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode);

						sSQL:=sSQL+#13#10' AND';
						sSQL:=sSQL+#13#10' BranchCode=';
						sSQL:=sSQL+		 IntToStr(MdBranch.FieldByName('BranchCode').AsInteger);
// <SCA> ADD-STR
						sSQL:=sSQL+#13#10' AND';
						sSQL:=sSQL+#13#10' NCode=';
    					sSQL:=sSQL+FormatFloat('#', exNCode);   // 内部コードも指定
// <SCA> ADD-END
						with DMQuery do
						begin
							Close;
							SQL.Clear;
							SQL.Add(sSQL);
							ExecSQL(TRUE);
						end;

						//画面ﾊﾟｰﾂ
						nParent:=TView.Items[0];//念のため\("銀行名")をｾｯﾄ
						TView.OnChange:=nil;
						MdBranch.DisableControls;
						try
							//ﾂﾘｰﾋﾞｭｰから削除
							if(MdBranch.FieldByName('TVItemPtr').AsInteger>0)then
							begin
								with TTreeNode(MdBranch.FieldByName('TVItemPtr').AsInteger)do
								begin
									nParent:=Parent;
									Delete;
								end;
							end;
							//MemDataから削除
							MdBranch.Delete;

						finally
							//MemData
							MdBranch.EnableControls;
							//ﾂﾘｰﾋﾞｭｰ
							TView.OnChange:=TViewChange;

							if(MdBranch.RecordCount=0)then
							begin
								//EnabledControlsで
								//再Openしないと不具合
								with MdBranch do
								begin
									Close;
									Open;
								end;

								if(nParent<>nil)then
								begin
									//xx銀行を再選択
									with TView do
									begin
										Selected:=nil;
										Selected:=nParent;
									end;
								end;
							end;
						end;
					end;
				end;

				//ここまで問題なければCommit
				dbCorp.Commit;
			except
				dbCorp.RollBack;
			end;
		except
			raise Exception.Create('削除処理に失敗しました');
		end;
	finally
    	SessionPractice(C_ED_PROCESS);			// <017>
		DMQuery.Close;
		DMQuery.Free;
//		MjsSetFocus(Self,DelBfr.Name);
	end;
end;

//************************************************************************
//		Component		:MTab
//		Event			:Change
//		Name			:hzm
//************************************************************************
procedure TJNTCRP008003BaseF.MTabChange(Sender: TObject);
//var
//	i		:integer;
begin
	try
		giTabIndex:=MTab.Items.Selected;
		case giTabIndex of
			//銀行
			0:																		//銀行の場合
			begin
				if giGetFocus=false then
					Exit;

// <013> MOD start
(*
   	    		B_Delete.Enabled := m_cJNTArea.IsDelete;
       			B_Ins.Enabled    := m_IsUpdate;
*)
				if giReferFlag = REFER then  										// 参照時
                begin
// <015> MOD start
//                	B_Delete.Enabled := False;

                    B_Delete.Enabled := IsDeleteEnable(MdBank);                     // 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
// <015> MOD end
       				B_Ins.Enabled := False;                                         // 挿入ﾎﾞﾀﾝを無効にする

	                B_CodeChange.Enabled := False;									// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
                end
                else
                begin
// <015> MOD start
(*
                	B_Delete.Enabled := m_cJNTArea.IsDelete;                		// 削除権限がある場合は削除ﾎﾞﾀﾝを有効にする
                    B_Ins.Enabled := m_IsUpDate;                                    // 追加および修正権限がある場合は挿入ﾎﾞﾀﾝを有効にする
*)
                	if m_cJNTArea.IsDelete then    									// 削除権限がある場合
            		begin
            			B_Delete.Enabled := MdBank.RecordCount > 0;                 // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
            		end
           	 		else                      										// 削除権限がない場合
           			begin
            			B_Delete.Enabled := False;  								// 削除ﾎﾞﾀﾝを無効にする
            		end;
// <015> MOD end
//↓<CDCHG>
                    if m_cJNTArea.IsDelete then 									// 削除権限がある場合
                    begin                       									// ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                        B_CodeChange.Enabled := MdBank.RecordCount > 0;
                    end
                    else                    										// 削除権限がない場合
                    begin                       									// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                        B_CodeChange.Enabled := False;
                    end;
//↑<CDCHG>
                end;
// <013> MOD end

				GrBank.FocusedColumn := 0;
				if(not bMTabKeyDown)then
					MJSSetFocus(Self,GrBank.Name);
			end;
			//支店
			1:																		//支店の場合
			begin
				if MdBank.State in [dsInsert] then
				begin
					MdBank.delete;
				end
				else
					if MdBank.State in [dsEdit] then
						MdBank.Cancel;

				//ﾂﾘｰ作成
				fnCreatNewTreeView;
				GrBranch.FocusedColumn := 0;
				if(not bMTabKeyDown)then
					MJSSetFocus(Self,TView.Name);
			end;
		end;
	finally
		bMTabKeyDown:=FALSE;
	end;
end;

//**********************************************************************
//		Process		:ツリー表示
//		Name		:hzm
//		Date		:00/11/14
//		Parameter	:なし
//		Return		:なし
//		History		:04/02/19(T.Aoki)
//					:銀行<->支店間の連結を銀行名一致で行っているのを修正
//					:04/02/20(T.Aoki)
//					:ﾂﾘｰｱｲｺﾝ/ﾂﾘｰ\"銀行名"(≒ML)
//**********************************************************************
//<Tree>
procedure TJNTCRP008003BaseF.fnCreatNewTreeView;
var
	mqBF,mqBS		:	TMQuery;
	p:^TTViewInfo;
//<001>	nRoot,nBank,nBranch:TTreeNode;
	nRoot,nBank,nBranch,nHontenKbn:TTreeNode;
	sSQL:string;
    exNCode :Extended;
begin


	with TView do
	begin
		OnChange:=nil;
		Items.Clear;
	end;
	mqBF:=TMQuery.Create(self);
	mqBS:=TMQuery.Create(self);
	try
		try
			with m_pMDataModule do
			begin
				SetDBInfoToQuery(dbCorp,mqBF);  //本店
				SetDBInfoToQuery(dbCorp,mqBS);  //支店
			end;

			sSQL:=			 'SELECT';
			sSQL:=sSQL+#13#10' NCode';
			sSQL:=sSQL+#13#10',BankCode';
			sSQL:=sSQL+#13#10',BankName';
			sSQL:=sSQL+#13#10'FROM';
//<001>			sSQL:=sSQL+#13#10' NSPBF';
			sSQL:=sSQL+#13#10' HAPBF';
			sSQL:=sSQL+#13#10'ORDER BY';
			sSQL:=sSQL+#13#10' BankCode';

			with mqBF do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//空はﾀﾌﾞｸﾘｯｸでｾｯﾄされる筈?
				if IsEmpty then
					Abort;
			end;

{(ﾂﾘｰ構成)--------------------------------------
			\-+-銀行名 -+-A銀行-+-A1支店
						|		+-A2支店
						|
						+-B銀行-+-B1支店
						|		+-B2支店
						|		+-B3支店
------------------------------------------------}
			with TView.Items do
			begin
				nRoot:=Add(nil,'銀行名');
				with nRoot do
				begin
					ImageIndex	 :=0;
					SelectedIndex:=ImageIndex+1;
				end;

				//銀行Loop
				while not mqBF.Eof do
				begin
					new(p);
					with p^ do
					begin
                        eNCode      :=mqBF.GetFld( 'NCode' ).AsFloat;
						iBankCode	:=mqBF.GetFld( 'BankCode' ).Asinteger;
						iBranchCode	:=-1;
                        iHontenKbn  :=TreeBankF;     //本店
                        eBsNCode    :=-1;            // <SCA> ADD
					end;


//<009>					nBank:=AddChildObject(	nRoot,
//<009>											mqBF.FieldByName( 'BANKNAME' ).AsString,
//<009>											p	);

					nBank:=AddChildObject(	nRoot,
                                            fnMakeDspString(
                                                            mqBF.FieldByName( 'BankCode' ).AsInteger,
                                                            mqBF.FieldByName( 'BANKNAME' ).AsString,4),
											p	);

					with nBank do
					begin
						ImageIndex	 :=0;
						SelectedIndex:=ImageIndex+1;
					end;

					//銀行下の支店を取得する
					sSQL:=			 'SELECT';
					sSQL:=sSQL+#13#10' BS.NCode';           //支店内部ｺｰﾄﾞ
					sSQL:=sSQL+#13#10',BS.BankNCode';       //銀行内部ｺｰﾄﾞ
					sSQL:=sSQL+#13#10',BF.BankCode';        //銀行外部ｺｰﾄﾞ
					sSQL:=sSQL+#13#10',BS.BranchCode';      //支店外部ｺｰﾄﾞ
					sSQL:=sSQL+#13#10',BS.BranchName';      //支店名

					sSQL:=sSQL+#13#10' FROM';
//<001>					sSQL:=sSQL+#13#10' NSPBS';
					sSQL:=sSQL+#13#10' HAPBS BS';
					sSQL:=sSQL+#13#10' LEFT OUTER JOIN HAPBF BF ON ';
					sSQL:=sSQL+#13#10' BF.NCode = BS.BankNCode        ';
					sSQL:=sSQL+#13#10' WHERE';
{
					sSQL:=sSQL+#13#10' BankCode=';
					sSQL:=sSQL+IntToStr(mqBF.GetFld('BankCode' ).Asinteger);
}
					sSQL:=sSQL+#13#10' BS.BankNCode = ';
					sSQL:=sSQL+FormatFloat('#',mqBF.GetFld('NCode').AsFloat);

					sSQL:=sSQL+#13#10' ORDER BY';
					sSQL:=sSQL+#13#10' BS.BranchCode';
					sSQL:=sSQL+#13#10',BS.NCode';           // <SCA> ADD

					with mqBS do
					begin
						Close;
						SQL.Clear;
						SQL.Add(sSQL);
						Open(TRUE);
					end;

					//支店Loop
					while not mqBS.Eof do
					begin
						new(p);
						with p^ do
						begin
//                            eNCode      :=mqBS.GetFld('NCode').AsFloat;
                            eNCode      :=mqBF.GetFld('NCode').AsFloat;         //支店内部ｺｰﾄﾞ保存用
							iBankCode	:=mqBS.GetFld('BankCode').Asinteger;    //銀行外部ｺｰﾄﾞ
							iBranchCode	:=mqBS.GetFld('BranchCode').Asinteger;  //支店外部ｺｰﾄﾞ
                            iHontenKbn  :=TreeBankS;                            //支店
                            eBsNCode    :=mqBS.GetFld('NCode').AsFloat;         // <SCA> ADD
						end;

						nBranch:=AddChildObject(	nBank,
													//<009> mqBS.GetFld('BranchName').AsString,
                                                    fnMakeDspString(
                                                                mqBS.GetFld('BranchCode').AsInteger,
                                                                mqBS.GetFld('BranchName').AsString,3),
													p	);
						with nBranch do
						begin
							ImageIndex	 :=4;
							SelectedIndex:=ImageIndex+1;
						end;

						mqBS.Next;
					end;

					mqBF.Next;
				end;
			end;
		except
			raise Exception.Create('振込先銀行ﾂﾘｰの作成に失敗しました');
		end;
	finally
		with mqBS do
		begin
			Close;
			Free;
		end;
		with mqBF do
		begin
			Close;
			Free;
		end;

		with TView do
		begin
			OnChange:=TViewChange;
			if Items.Count>0 then
			begin
				//\を選択
				Items[0].Selected:=TRUE;
				//\下(銀行名)を展開(支店は展開しない)
				Items[0].Expanded:=TRUE;
			end;
		end;
	end;
END;
//************************************************************************
//	function		:	fnMakeDspString
//************************************************************************
function TJNTCRP008003BaseF.fnMakeDspString(CODE: Integer; NAME: String;KETA:Integer): String;
var
	sWork		:	String;
	sWork2		:	String;
	iCnt		:	Integer;
begin
    //	初期処理
	sWork	:=	'';
	sWork2	:=	'';

	sWork	:=	IntToStr(CODE);
	iCnt	:=	KETA - Length(sWork);
	sWork2	:=	StringOfChar('0', iCnt);
   	sWork	:=	sWork2 + sWork;
	Result	:=	sWork + ' ' + NAME;
end;


//************************************************************************
//	Component		:	GrBank
//	Event			:	BeforeChangeColumn
//	Name			:	hzm
//************************************************************************
{procedure TJNTCRP008003BaseF.GrBankBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	sCode:string;
begin
//	inherited;
	if ( GrBank.FocusedColumn = 0 ) and (MdBank.State = dsInsert) then
	begin
		sCode:=GrBank.DataSource.DataSet.FieldByName('BankCode').AsString;
		sCode:=SupCodeAttribute(sCode,4,False);
		GrBank.DataSource.DataSet.FieldByName('BankCode').AsString := sCode;
	end;
end;
}
//************************************************************************
//	Component		:	BPrint
//	Event			:	Click
//	Name			:	hzm
//************************************************************************
procedure TJNTCRP008003BaseF.BPrintClick(Sender: TObject);
var
	Rtn		:	Word;
begin
{<001>
	case giTabIndex of
		0:
		if MdBank.State in [dsInsert] then
		begin
			GetMsg(rcMsg,110,1);
			with rcMsg do
				Rtn:=MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			if Rtn = mrYes then
				MdBank.Cancel
			else if Rtn=mrNo then
			begin
				if CheckdsInsert_Bank then
					MdBank.Post;
			end
			else
				exit;
		end
		else
			if MdBank.State in [dsEdit] then
				MdBank.Cancel;
		1:
		if MdBranch.State in [dsInsert] then
		begin
			GetMsg(rcMsg,110,1);
			with rcMsg do
				Rtn:=MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			if Rtn = mrYes then
				MdBranch.Cancel
			else if Rtn=mrNo then
			begin
				if CheckdsInsert_Siten then
					MdBranch.Post;
			end
			else
				exit;
		end
		else
			if MdBranch.State in [dsEdit] then
				MdBranch.Cancel;
	END;
}
    m_cJNTArea.SetSelAppRecord;
	PrintDlg;
    m_cJNTArea.SetMasAppRecord;

end;

//**********************************************************************
//		Process		:印刷処理
//		Name		:hzm
//		Date		:2000/11/14
//		Parameter	:なし
//		Return		:なし
//		History		:9999/99/99		X.Xxxxx
//									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008003BaseF.PrintDlg;
var
    cMem : TdxMemData;

begin

    if MTab.Items.Selected = 0 then
        cMem := MdBank
    else
        cMem := MdBranch;

    cMem.DisableControls;

    // <PRN>
    with PrtParam do
    begin
		Para		:=  uvHani;
		TargetQry	:=  DmqPrint;
		CorpSys		:=  uvSelSys;
	end;

    //印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);

    cMem.EnableControls;


{
    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<PRN>
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
            // <PRN>
            with PrtParam do
			begin
				Para		:=  uvHani;
				TargetQry	:=  DmqPrint;
				CorpSys		:=  uvSelSys;
			end;

            //印刷する<PRN>
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else Exit;		//ｴﾗｰ
    end;
}


//var
//	PrnForm		: TNSP101530Printf;
//begin
{<001>
	PrnForm := TNSP101530PrintF.Create( Self );									// 印刷用Form作成
	if Assigned(PrnForm) <> True then
	begin
		MjsMessageBox('印刷処理失敗(NSP101530)', mjError, mjDefOk);
		Abort;
	end;
	try
		try
			PrnForm.DBCRP	:= dbCorp;											// DB
			PrnForm.DBCTL	:= dbCtlDb;											// DB
			PrnForm.iCopNo	:= m_pRec.m_iCorpCode;								// 会社コード
			PrnForm.DBMod	:= m_pMDataModule^;									// DBモジュール
			PrnForm.giKeta	:= 4;												// 桁数
			PrnForm.fnPrint(m_pRec);											// 印刷処理
		except
			MjsMessageBox('印刷処理失敗(NSP101530)', mjError, mjDefOk);
			Abort;
		end;
	finally
		PrnForm.Free;
		//20010125 KOS ADD 開放後Nilをセット
		PrnForm := Nil;
	end;
}
end;

//************************************************************************
//		Component	:TView
//		Event		:Change
//		Name		:D.INOUE(MJS 開発)
///		Date		:99/99/99(X.Name)
//		Parameter	:
//		Return		:
//		History		:04/02/19(T.Aoki)
//					:銀行<->支店間の連結を銀行名一致で行っているのを修正
//************************************************************************
procedure TJNTCRP008003BaseF.TViewChange(Sender: TObject; Node: TTreeNode);
var
	i:integer;
	DMQuery	:	TMQuery;
	sSQL:string;
	p:^TTViewInfo;


begin

	with MdBranch do
	begin
		BeforePost :=nil;
		AfterInsert:=nil;
		DisableControls;
	end;
	try
		with MdBranch do
		begin
			Close;
			Open;
		end;

		GrBranch.Enabled:=(Node<>nil)and
						  (Node.Parent<>nil)and
						  (Node.Data<>nil);

		if(Node=nil)then
			Exit;

		//\?
		if(Node.Data=nil)or
		  (Node.Parent=nil)then
		begin

			LBankName.Caption := '振込先銀行：';
			Exit;
		end;

		p:=Node.Data;

		//支店
		if p^.iBranchCode>=0 then
			LBankName.Caption := '振込先銀行：' + Node.Parent.Text
		//銀行
		else
			LBankName.Caption := '振込先銀行：' + Node.Text;

		DMQuery := TMQuery.Create(self);
		try
			try
				m_pMDataModule.SetDBInfoToQuery(dbCorp, DMQuery);

				//支店
				if p^.iBranchCode>=0 then
				begin

					sSQL:=			 'SELECT';
					sSQL:=sSQL+#13#10' NCode';
					sSQL:=sSQL+#13#10',BankNCode';
					sSQL:=sSQL+#13#10',BranchCode';
					sSQL:=sSQL+#13#10',BranchName';
					sSQL:=sSQL+#13#10',BranchKana';
					sSQL:=sSQL+#13#10' FROM';
//<001>					sSQL:=sSQL+#13#10' NSPBS';
					sSQL:=sSQL+#13#10' HAPBS';
					sSQL:=sSQL+#13#10' WHERE';
//					sSQL:=sSQL+#13#10' BankCode	 =';
//					sSQL:=sSQL+		 IntToStr(p^.iBankCode);

					sSQL:=sSQL+#13#10' BankNCode =';
                    sSQL:=sSQL+     FormatFloat('#',p^.eNCode);      //銀行内部ｺｰﾄﾞ

					sSQL:=sSQL+#13#10' AND';
					sSQL:=sSQL+#13#10' BranchCode =';
					sSQL:=sSQL+		IntToStr(p^.iBranchCode);        //支店外部ｺｰﾄﾞ
// <SCA> ADD-STR
                    sSQL:=sSQL+#13#10' AND';
                    sSQL:=sSQL+#13#10' NCode=';
                    sSQL:=sSQL+		 FormatFloat('#',p^.eBsNCode);   //支店内部ｺｰﾄﾞ
// <SCA> ADD-END
					with DMQuery do
					begin
						Close;
						SQL.Clear;
						SQL.Add(sSQL);
						Open(TRUE);
						if IsEmpty then
							Abort;
					end;
					with MdBranch do
					begin
						Append;
                        //Add↓
   						FieldByName('BankNCode').AsFloat	:=DMQuery.GetFld('BankNCode').AsFloat;
                        //Add↑
//						FieldByName('BankCode').AsInteger	:=DMQuery.GetFld('BankCode').AsInteger;
						FieldByName('BankCode').AsInteger	:=p^.iBankCode;
						FieldByName('BranchCode').AsInteger	:=DMQuery.GetFld('BranchCode').AsInteger;
						FieldByName('BranchName').AsString	:=DMQuery.GetFld('BranchName').AsString;
						FieldByName('BranchKana').AsString	:=DMQuery.GetFld('BranchKana').AsString;
						FieldByName('TVItemPtr').AsInteger	:=LongInt(Node);
                                                FieldByName('BranchNCode').AsFloat  :=DMQuery.GetFld('NCode').AsFloat;  // <CHK>支店内部ｺｰﾄﾞ
// <022> mod start
						//FieldByName('SortCode').AsString	:=Format('%.3d',[p^.iBranchCode]) + Format('%.10e',[p^.eBsNCode]);  // <SCA> ADD
                        // SortCodeの型変更（Stringだとソート時にエラーとなったため）
                        FieldByName('SortCode').AsFloat	:= (p^.iBranchCode * 10000000000) + p^.eBsNCode;
// <022> mod end
						Post;
					end;
				end
				//銀行
				else
				begin
//					with (Sender as TTreeView)do
					with (Sender as TMTreeView)do           // <007>
					begin
						for i:=0 to Items.Count-1 do
						begin
							if(not((Items[i].Parent<>nil)and
								   (Items[i].Parent=Node)))then
								Continue;

							p:=Items[i].Data;
{
							sSQL:=			 'SELECT';
							sSQL:=sSQL+#13#10' BankCode';
							sSQL:=sSQL+#13#10',BranchCode';
							sSQL:=sSQL+#13#10',BranchName';
							sSQL:=sSQL+#13#10',BranchKana';
							sSQL:=sSQL+#13#10'FROM';
//<001>							sSQL:=sSQL+#13#10' NSPBS';
							sSQL:=sSQL+#13#10' FX_HAPBS';
							sSQL:=sSQL+#13#10'WHERE';
							sSQL:=sSQL+#13#10' BankCode	 =';
							sSQL:=sSQL+		 IntToStr(p^.iBankCode);
							sSQL:=sSQL+#13#10' AND';
							sSQL:=sSQL+#13#10' BranchCode=';
							sSQL:=sSQL+		 IntToStr(p^.iBranchCode);
}
    	    				sSQL:=			 'SELECT';
	    	    			sSQL:=sSQL+#13#10' NCode';
		    	    		sSQL:=sSQL+#13#10',BankNCode';
			    	    	sSQL:=sSQL+#13#10',BranchCode';
				    	    sSQL:=sSQL+#13#10',BranchName';
    				    	sSQL:=sSQL+#13#10',BranchKana';
    					    sSQL:=sSQL+#13#10'FROM';
//<001>					    sSQL:=sSQL+#13#10' NSPBS';
    					    sSQL:=sSQL+#13#10' HAPBS';
	    				    sSQL:=sSQL+#13#10'WHERE';
//  					    sSQL:=sSQL+#13#10' BankCode	 =';
//	    				    sSQL:=sSQL+		 IntToStr(p^.iBankCode);

		    			    sSQL:=sSQL+#13#10' BankNCode =';
                            sSQL:=sSQL+FormatFloat('#',p^.eNCode);       //銀行内部ｺｰﾄﾞ

				    	    sSQL:=sSQL+#13#10' AND';
					        sSQL:=sSQL+#13#10' BranchCode=';
					        sSQL:=sSQL+		 IntToStr(p^.iBranchCode);   //支店外部ｺｰﾄﾞ
// <SCA> ADD-STR
				    	    sSQL:=sSQL+#13#10' AND';
					        sSQL:=sSQL+#13#10' NCode=';
					        sSQL:=sSQL+FormatFloat('#',p^.eBsNCode);     //支店内部ｺｰﾄﾞ
// <SCA> ADD-END

							with DMQuery do
							begin
								Close;
								SQL.Clear;
								SQL.Add(sSQL);
								Open(TRUE);
								if IsEmpty then
									Abort;
							end;
							with MdBranch do
							begin
								Append;
                                //Add↓
   				        		FieldByName('BankNCode').AsFloat	:=DMQuery.GetFld('BankNCode').AsFloat;
                                //Add↑
//								FieldByName('BankCode').AsInteger	:=DMQuery.GetFld('BankCode').AsInteger;
								FieldByName('BankCode').AsInteger	:=p^.iBankCode;
								FieldByName('BranchCode').AsInteger	:=DMQuery.GetFld('BranchCode').AsInteger;
								FieldByName('BranchName').AsString	:=DMQuery.GetFld('BranchName').AsString;
								FieldByName('BranchKana').AsString	:=DMQuery.GetFld('BranchKana').AsString;
								FieldByName('TVItemPtr').AsInteger	:=LongInt(Items[i]);
                                FieldByName('BranchNCode').AsFloat  :=DMQuery.GetFld('NCode').AsFloat;	// <020> Add
// <022> mod start
        						//FieldByName('SortCode').AsString	:=Format('%.3d',[p^.iBranchCode]) + Format('%.10e',[p^.eBsNCode]);  // <SCA> ADD
                                // SortCodeの型変更（Stringだとソート時にエラーとなったため）
                                FieldByName('SortCode').AsFloat	:= (p^.iBranchCode * 10000000000) + p^.eBsNCode;
// <022> mod end
								Post;
							end;
						end;
					end;
				end;

				if(MdBranch.RecordCount>0)then
					MdBranch.First;

// <013> MOD start
(*
                // 削除ﾎﾞﾀﾝ
                if m_cJNTArea.IsDelete then
              		B_Delete.Enabled := MdBranch.RecordCount>0
                else
              		B_Delete.Enabled := False;

                // 挿入ﾎﾞﾀﾝ
                if m_IsUpdate then
           			B_Ins.Enabled   := MdBranch.RecordCount>0
                else
                    B_Ins.Enabled   := False;
*)
				if giReferFlag = REFER then  							// 参照時
                begin
// <015> MOD start
//					B_Delete.Enabled := False;                         	// 削除ﾎﾞﾀﾝを無効にする

                    B_Delete.Enabled := IsDeleteEnable(MdBranch);       // 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
// <015> MOD end
					B_Ins.Enabled := False;                             // 挿入ﾎﾞﾀﾝを無効にする

	                B_CodeChange.Enabled := False;						// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
				end
                else
                begin
					if m_cJNTArea.IsDelete then   						// 削除権限がある場合
                    begin
                    	B_Delete.Enabled := MdBranch.RecordCount > 0;   // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
                    end
                    else                                        		// 削除権限がない場合
                    begin
                        B_Delete.Enabled := False;                		// 削除ﾎﾞﾀﾝを無効にする
                    end;

                    if m_IsUpdate then          						// 追加および修正権限がある場合
                    begin
           				B_Ins.Enabled := MdBranch.RecordCount > 0;      // ﾃﾞｰﾀがある場合は挿入ﾎﾞﾀﾝを有効にする
                    end
                	else                         						// 追加および修正権限がない場合は
                    begin
                    	B_Ins.Enabled := False;                       	// 挿入ﾎﾞﾀﾝを無効にする
                    end;
//↓<CDCHG>
                    if m_cJNTArea.IsDelete then 						// 削除権限がある場合
                    begin                       						// ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                        B_CodeChange.Enabled := MdBranch.RecordCount > 0;
                    end
                    else                    							// 削除権限がない場合
                    begin                       						// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                        B_CodeChange.Enabled := False;
                    end;
//↑<CDCHG>
                end;

// <013> MOD end



			except
				raise Exception.Create('支店名の取得に失敗しました');
			end;

		finally
			DMQuery.Free;
		end;
	finally
		with MdBranch do
		begin
			EnableControls;
			BeforePost	:=MdBranchBeforePost;
			AfterInsert	:=MdBranchAfterInsert;
		end;
		//ﾎﾞﾀﾝ制御
		MdBranchAfterInsert(MdBranch);
	end;

end;

//************************************************************************
//	Component		:	DDataTen
//	Event			:	StateChange
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.DDataTenStateChange(Sender: TObject);
begin
	if MdBranch.State in [dsInsert] then									// [コード]の入力不可を切り替える
	begin
//↓<021>
        GrBranchColumn1.EditButtonStyle := ebsEllipsis;
        GrBranchColumn1.ClickKey        := TextToShortCut('F4');
//↑<021>
		GrBranch.Columns[0].ReadOnly := False;
//<004>		GrBranch.Columns[0].DisableEditor := False;
	end
	else
	begin
//↓<021>
        GrBranchColumn1.EditButtonStyle := ebsSimple;
        GrBranchColumn1.ClickKey        := TextToShortCut('');
//↑<021>
		GrBranch.Columns[0].ReadOnly := True;
//<004>		GrBranch.Columns[0].DisableEditor := True;
	end;

	if MdBranch.Active then
	begin
//		if (GrBranch.DataLink.Bof = TRUE) and (giDataTen=0) then
		if (GrBranch.DataLink.Bof = TRUE) and (MdBranch.RecordCount = 0) then
		begin
//↓<021>
	        GrBranchColumn1.EditButtonStyle := ebsEllipsis;
    	    GrBranchColumn1.ClickKey        := TextToShortCut('F4');
//↑<021>
			GrBranch.Columns[0].ReadOnly := False;
//<004>			GrBranch.Columns[0].DisableEditor := False;
		end;
	end;
end;

//************************************************************************
//	Component		:	MdBranch
//	Event			:	AfterCancel
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.MdBranchAfterCancel(DataSet: TDataSet);
begin
//	inherited;
	//if giDataTen > 0 then
	if DataSet.RecordCount > 0 then
	begin
//		BInsert.Enabled := TRUE;
	end
	else
	begin
//		BInsert.Enabled := FALSE;
		//DataSet.Insert;
	end;
end;

//************************************************************************
//		Component	:MdBranch
//		Event		:AfterDelete
//		Process		:振込先支店MemData 削除後
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/04
//					:ﾀﾌﾞの判定を追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBranchAfterDelete(DataSet: TDataSet);
begin
	//前面が"支店"ではない?
	if(MTab.Items.Selected<>1)then
		Exit;

	with(DataSet as TdxMemData)do
	begin
// <013> MOD start
(*
        // 削除ﾎﾞﾀﾝ
        if m_cJNTArea.IsDelete then
      		B_Delete.Enabled := RecordCount>0
        else
      		B_Delete.Enabled := False;

        // 挿入ﾎﾞﾀﾝ
        if m_IsUpdate then
   			B_Ins.Enabled   :=RecordCount>0
        else
            B_Ins.Enabled   := False;
*)
        if giReferFlag = REFER then  		// 参照時
        begin
// <015> MOD start
//        	B_Delete.Enabled := False;      // 削除ﾎﾞﾀﾝを無効にする
          									// 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
            B_Delete.Enabled := IsDeleteEnable(MdBranch);
// <015> MOD end
            B_Ins.Enabled := False;         // 挿入ﾎﾞﾀﾝを無効にする

            B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
		end
        else
        begin
        	if m_cJNTArea.IsDelete then    	// 削除権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
      			B_Delete.Enabled := RecordCount > 0;
            end
        	else                        	// 削除権限がない場合
            begin
      			B_Delete.Enabled := False;  // 削除ﾎﾞﾀﾝを無効にする
            end;

        	if m_IsUpdate then              // 追加および修正権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は挿入ﾎﾞﾀﾝを有効にする
   				B_Ins.Enabled := RecordCount > 0;
            end
            else             				// 追加および修正権限がない場合
            begin
	            B_Ins.Enabled := False;     // 挿入ﾎﾞﾀﾝを無効にする
            end;
//↓<CDCHG>
            if m_cJNTArea.IsDelete then 	// 削除権限がある場合
            begin                       	// ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                B_CodeChange.Enabled := RecordCount > 0;
            end
            else                    		// 削除権限がない場合
            begin                       	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                B_CodeChange.Enabled := False;
            end;
//↑<CDCHG>
        end;
// <013> MOD end

	end;
end;

//************************************************************************
//		Component	:MdBranch
//		Event		:AfterInsert
//		Process		:振込先支店MemData 挿入後
//		Name		:hzm
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/02/04
//					:ﾀﾌﾞの判定を追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBranchAfterInsert(DataSet: TDataSet);
begin
	//前面が"支店"ではない?
	if(MTab.Items.Selected<>1)then
		Exit;

	with(DataSet as TdxMemData)do
	begin
// <013> MOD start
(*
        // 削除ﾎﾞﾀﾝ
        if m_cJNTArea.IsDelete then
      		B_Delete.Enabled := RecordCount>0
        else
      		B_Delete.Enabled := False;

        // 挿入ﾎﾞﾀﾝ
        if m_IsUpdate then
   			B_Ins.Enabled   :=RecordCount>0
        else
            B_Ins.Enabled   := False;
*)

		if giReferFlag = REFER then  		// 参照時
        begin
// <015> MOD start
//			B_Delete.Enabled := False;      // 削除ﾎﾞﾀﾝを無効にする
		   									// 削除ﾎﾞﾀﾝのEnabledﾁｪｯｸ
            B_Delete.Enabled := IsDeleteEnable(MdBranch);
// <015> MOD end
			B_Ins.Enabled := False;         // 挿入ﾎﾞﾀﾝを無効にする

            B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
        end
        else
        begin
        	if m_cJNTArea.IsDelete then     // 削除権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は削除ﾎﾞﾀﾝを有効にする
      			B_Delete.Enabled := RecordCount > 0;
            end
        	else                 			// 削除権限がない場合
            begin
      			B_Delete.Enabled := False;  // 削除ﾎﾞﾀﾝを無効にする
            end;

        	if m_IsUpdate then      		// 追加および修正権限がある場合
            begin                           // ﾃﾞｰﾀがある場合は挿入ﾎﾞﾀﾝを有効にする
            	B_Ins.Enabled := RecordCount > 0;
            end
        	else                        	// 追加および修正権限がない場合
            begin
            	B_Ins.Enabled := False;     // 挿入ﾎﾞﾀﾝを無効にする
            end;
//↓<CDCHG>
            if m_cJNTArea.IsDelete then 	// 削除権限がある場合
            begin                       	// ﾃﾞｰﾀがある場合はｺｰﾄﾞ変更ﾎﾞﾀﾝを有効にする
                B_CodeChange.Enabled := RecordCount > 0;
            end
            else                    		// 削除権限がない場合
            begin                       	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする
                B_CodeChange.Enabled := False;
            end;
//↑<CDCHG>
        end;
// <013> MOD end

	end;
end;

//************************************************************************
//		Component	:MdBranch
//		Event		:BeforePost
//		Name		:HZM
//		Date		:99/99/99(X.Name)
//		Parameter	:
//		Return		:
//		History		:04/02/24(T.Aoki)
//					:桁数ｶﾞｰﾄﾞを追加
//************************************************************************
procedure TJNTCRP008003BaseF.MdBranchBeforePost(DataSet: TDataSet);
var
	Fld					:TField;
	iBranchCode			:integer;
	SBranchName			:String;
	SBranchKana			:String;
	DMQuery				:TMQuery;
	iErrorFlag			:Integer;
	sTemp				: string;
	sEdit				: string;
	bCheckOK			: Boolean;
	sFieldName			: string;

	sSQL:string;
	nCurrent,nParent:TTreeNode;
	p:^TTViewInfo;

    //銀行内部ｺｰﾄﾞ 支店内部ｺｰﾄﾞ
    exBankCD,exBranchCD : Extended;
    //銀行外部ｺｰﾄﾞ 支店外部ｺｰﾄﾞ
    iBankCD,iBranchCD   : Integer;


begin
    p := Nil;

	if(TView.Selected=nil)or
	  (TView.Selected.Data=nil)or
// 0は許可
//	  (TTViewInfo(TView.Selected.Data^).iBankCode<=0)then
	  (TTViewInfo(TView.Selected.Data^).iBankCode<0)then
		Abort;

	//更新時ﾂﾘｰとの連結をﾁｪｯｸ
	with(DataSet as TdxMemData)do
	begin
// <020> Add start
        if( not fnWFChk_FriBank (1, Trunc(MdBranch.FieldByName('BranchNCode').AsFloat))) then
        begin
            MjsMessageBox(Self,	m_sWFError,
                            mjWarning,
                            mjDefOK									);
            GrBranch.FocusedColumn:=0;
            Abort;
        end;
// <020> Add end
		//ButtonColumにしたらｸﾞﾘｯﾄﾞが桁数ｶﾞｰﾄﾞしてくれないようなので
		//ここでﾁｪｯｸ
		if(FieldByName('BranchCode').AsInteger>999)then
		begin
			MjsMessageBox(Self,	'支店ｺｰﾄﾞは3桁以内で入力してください。',
							mjWarning,
							mjDefOK									);
			GrBranch.FocusedColumn:=0;
			Abort;
		end;

		iBranchCode := FieldByName('BranchCode').AsInteger;
		sBranchName := trim(FieldByName('BranchName').AsString);
		sBranchKana := trim(FieldByName('BranchKana').AsString);

		//必須入力ﾁｪｯｸ
		bCheckOK	:= False;
		//2002/06/20 KOS　ゼロ入力あり
		//if iBranchCode = 0 then
		if FieldByName('BranchCode').Asstring = '' then
		begin
			sFieldName	:= 'BranchCode';
			sTemp		:= '支店ｺｰﾄﾞ';
		end
		else if sBranchName = '' then
		begin
			sFieldName	:= 'BranchName';
			sTemp		:= '支店名称';
		end
// Maru0724
{
		else if sBranchKana = '' then
		begin
			sFieldName	:= 'BranchKana';
			sTemp		:= '支店名称ｶﾅ';
		end
}
		else
			bCheckOK	:= True;		//必須入力OK

		if bCheckOK	= False then
		begin
{<001>
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(sTemp + sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
			FieldByName(sFieldName).FocusControl;
			Abort;
		end;

		//2001/08/27 KOS　何のチェックなのか・・・　		//特別ﾁｪｯｸ
		//特別ﾁｪｯｸ
		{if iBranchCode = 999 then
		begin
			GetMsg(rcMsg,200,2); //警告
			with rcMsg do
			begin
				sMsg :=	'999は総合計になります。';
				MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			FieldByName('BranchCode').FocusControl;
			Abort;
		end;
		}
		//2001/08/08 KOS FBチェック	   ~~~~~~~~~~~~	②1行チェック＆変換
		{銀行名カナ}
		if fnFBKanaChange(sBranchKana, sEdit, False) = False then
		begin
{
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字が入力されています。';
				MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			FieldByName('BranchKana').FocusControl;
			Abort;
		end;
		sBranchKana := sEdit;
		FieldByName('BranchKana').AsString := sEdit;
		//2001/08/08 KOS FBチェック	   ~~~~~~~~~~~~	END
	end;

	DMQuery := TMQuery.Create(self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

    //CodeSet
    iBranchCD   := iBranchCode;
    iBankCD     := TTViewInfo(TView.Selected.Data^).iBankCode;
    exBankCD    := TTViewInfo(TView.Selected.Data^).eNCode;

    SessionPractice(C_ST_PROCESS);				// <017>

	try
		m_pMDataModule.SetDBInfoToQuery(dbCorp, DMQuery);
		iErrorFlag:=0;
		try
			with DMQuery do
			begin
				{支店ｺｰﾄﾞ重複ﾁｪｯｸ}

// <SCA> ADD-STR
                if not m_bAllowSameBraCode then     // 同一コード別支店可でない
				begin
// <SCA> ADD-END
					sSQL:=			 'SELECT';
					sSQL:=sSQL+#13#10' NCode';
					sSQL:=sSQL+#13#10',BankNCode';
					sSQL:=sSQL+#13#10',BranchCode';
					sSQL:=sSQL+#13#10'FROM';
//<001>				sSQL:=sSQL+#13#10' NSPBS';
					sSQL:=sSQL+#13#10' HAPBS';
					sSQL:=sSQL+#13#10'WHERE';
//					sSQL:=sSQL+#13#10' BankCode	 =';
//					sSQL:=sSQL+IntToStr(TTViewInfo(TView.Selected.Data^).iBankCode);

					sSQL:=sSQL+#13#10' BankNCode	 =';
					sSQL:=sSQL+FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode);

					sSQL:=sSQL+#13#10' AND';
					sSQL:=sSQL+#13#10' BranchCode=';
					sSQL:=sSQL+IntToStr((DataSet as TdxMemData).FieldByName('BranchCode').AsInteger);

					Close();
					SQL.Clear;
					SQL.Add(sSQL);
					Open(true);
					if ( EOF <> True ) then											// 重複あり？
					begin
						if DDataTen.DataSet.State in [dsInsert] then
						begin
							FLd := DDataTen.DataSet.FieldByName('BranchCode');
{<001>
							GetMsg(rcMsg,20,2);
							with rcMsg do
								MjsMessageBox(sMsg,mjWarning,mjDefOk);			//同一ﾃﾞｰﾀあり
}
							MjsMessageBox(Self,'既に同一支店コードが入力済みです。',mjWarning,mjDefOk);
							iErrorFlag:=-1;
							FLd.FocusControl;
							Abort;
						end;
					end;
				end;	// <SCA> ADD

				{支店名称重複ﾁｪｯｸ}
				sSQL:=			 'SELECT';
				sSQL:=sSQL+#13#10' NCode';
				sSQL:=sSQL+#13#10',BankNCode';
				sSQL:=sSQL+#13#10',BranchCode';
				sSQL:=sSQL+#13#10'FROM';
//<001>				sSQL:=sSQL+#13#10' NSPBS';
				sSQL:=sSQL+#13#10' HAPBS';
				sSQL:=sSQL+#13#10'WHERE';
//				sSQL:=sSQL+#13#10' BankCode	 =';
//				sSQL:=sSQL+IntToStr(TTViewInfo(TView.Selected.Data^).iBankCode);
				sSQL:=sSQL+#13#10' BankNCode	 =';
				sSQL:=sSQL+FormatFLoat('#',TTViewInfo(TView.Selected.Data^).eNCode);

				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BranchName=';
				sSQL:=sSQL+AnsiQuotedStr(sBranchName,'''');
// <SCA> ADD-STR
                if m_bAllowSameBraCode then     // 同一コード別支店可
                begin
    				sSQL:=sSQL+#13#10' AND';
    				sSQL:=sSQL+#13#10' NCode <>';
	    			sSQL:=sSQL+FormatFloat('0', (DataSet as TdxMemData).FieldByName('BranchNCode').AsFloat);
                end;
// <SCA> ADD-END

				Close();
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				if ( EOF <> True )then											// 重複あり？
				begin
					if MdBranch.State in [dsInsert] then
					begin
						FLd := DDataTen.DataSet.FieldByName('BranchName');
						MjsMessageBox(Self,'既に同一支店名称が入力済みです。',mjWarning,mjDefOk);
						iErrorFlag:=-1;
						FLd.FocusControl;
						Abort;
					end;
					if MdBranch.State in [dsedit] then
					begin
// <SCA> MOD-STR
//						if GetFld('BranchCode').AsInteger <> iBranchCode then
						if m_bAllowSameBraCode or
                           (GetFld('BranchCode').AsInteger <> iBranchCode) then
// <SCA> MOD-END
						begin
							FLd := DDataTen.DataSet.FieldByName('BranchName');
// <SCA> MOD-STR
//							MjsMessageBox(Self,'既に同一銀行名称が入力済みです。',mjWarning,mjDefOk);
    						MjsMessageBox(Self,'既に同一支店名称が入力済みです。',mjWarning,mjDefOk);
// <SCA> MOD-END
							iErrorFlag:=-1;
							FLd.FocusControl;
							Abort;
						end;
					end;
				end;
			end;

			//ツリー更新
			with (DataSet as TdxMemData),
				 TTViewInfo(TView.Selected.Data^)do
			begin
				if(State=dsInsert)then
				begin

					nParent:=TView.Selected;
					if(iBranchCode>=0)then
						nParent:=TView.Selected.Parent;

					new(p);
                    p^.eNCode       :=exBankCD;
					p^.iBankCode	:=iBankCode;
					p^.iBranchCode	:=FieldByName('BranchCode').AsInteger;

//<009>					nCurrent:=TView.Items.AddChildObject(	nParent,
//<009>															FieldByName('BranchName').AsString,
//<009>															p	);

					nCurrent:=TView.Items.AddChildObject(	nParent,
                                                            fnMakeDspString
                                                            (
                                                            FieldByName('BranchCode').AsInteger,
                                                            FieldByName('BranchName').AsString,3
                                                            ),
															p	);

					with nCurrent do
					begin
						ImageIndex	 :=4;
						SelectedIndex:=ImageIndex+1;
					end;

					//未入力(非表示)のﾌｨｰﾙﾄﾞに値をｾｯﾄ
					//銀行ｺｰﾄﾞ
					FieldByName('BankCode').AsInteger	:=iBankCode;
					//ﾂﾘｰﾉｰﾄﾞ ﾎﾟｲﾝﾀ格納
					//(Index,AbsoluteIndexは支店削除=ﾂﾘｰﾉｰﾄﾞ削除で一致しなくなる)
					FieldByName('TVItemPtr').AsInteger	:=LongInt(nCurrent);
				end;
			end;

			//ツリー更新
			with (DataSet as TdxMemData)do
			begin
				if State = dsInsert then
				begin
//<001>					sSQL:='INSERT INTO NSPBS';
					sSQL:='INSERT INTO HAPBS';
					sSQL:=sSQL+'(';
//					sSQL:=sSQL+' BankCode';
					sSQL:=sSQL+' BankNCode';
					sSQL:=sSQL+',BranchCode';
					sSQL:=sSQL+',BranchName';
					sSQL:=sSQL+',BranchKana';
					sSQL:=sSQL+',UpdTantoNCode'; // <018>
					sSQL:=sSQL+')VALUES(';
//					sSQL:=sSQL+IntToStr(TTViewInfo(TView.Selected.Data^).iBankCode);

					sSQL:=sSQL+FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode);
					sSQL:=sSQL+',';
					sSQL:=sSQL+IntToStr(FieldByName('BranchCode').AsInteger);
					sSQL:=sSQL+',';
//					sSQL:=sSQL+AnsiQuotedStr(FieldByName('BranchName').AsString,'''');
					sSQL:=sSQL+AnsiQuotedStr( fnDelCRLF(FieldByName('BranchName').AsString), '''' ); //<DKAI>
					sSQL:=sSQL+',';
//					sSQL:=sSQL+AnsiQuotedStr(FieldByName('BranchKana').AsString,'''');
					sSQL:=sSQL+AnsiQuotedStr( fnDelCRLF(FieldByName('BranchKana').AsString), '''' ); //<DKAI>
					sSQL:=sSQL+','; // <018>
					sSQL:=sSQL+FormatFloat('#', m_TantoNCode); // <018>
					sSQL:=sSQL+')';
				end
				else
				begin
//<001>					sSQL:='UPDATE NSPBS SET';
					sSQL:='UPDATE HAPBS SET';
					sSQL:=sSQL+#13#10' BranchName=';
//					sSQL:=sSQL+AnsiQuotedStr(FieldByName('BranchName').AsString,'''');
					sSQL:=sSQL+AnsiQuotedStr( fnDelCRLF(FieldByName('BranchName').AsString), '''' ); //<DKAI>
					sSQL:=sSQL+#13#10',BranchKana=';
//					sSQL:=sSQL+AnsiQuotedStr(FieldByName('BranchKana').AsString,'''');
					sSQL:=sSQL+AnsiQuotedStr( fnDelCRLF(FieldByName('BranchKana').AsString), '''' ); //<DKAI>
					sSQL:=sSQL+#13#10',UpdTantoNCode='; // <018>
					sSQL:=sSQL+FormatFloat('#', m_TantoNCode); // <018>

					sSQL:=sSQL+#13#10'WHERE';
//					sSQL:=sSQL+#13#10' BankCode=';
//					sSQL:=sSQL+IntToStr(FieldByName('BankCode').AsInteger);

					sSQL:=sSQL+#13#10' BankNCode=';
//					sSQL:=sSQL+FormatFloat('#',FieldByName('BankNCode').AsFloat);
					sSQL:=sSQL+FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode);

					sSQL:=sSQL+#13#10' AND';
					sSQL:=sSQL+#13#10' BranchCode=';
					sSQL:=sSQL+IntToStr(FieldByName('BranchCode').AsInteger);
// <SCA> ADD-STR
					sSQL:=sSQL+#13#10' AND';
					sSQL:=sSQL+#13#10' NCode=';
   					sSQL:=sSQL+FormatFloat('#',FieldByName('BranchNCode').AsFloat);
// <SCA> ADD-END
				end;
			end;

			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				ExecSQL(true);
			end;
// <023> add start
// <024> add strat
			if MdBranch.State in [dsInsert] then
			begin
// <024> add end
	            // 内部コードをテーブルから取得（INSERT時はDB側で自動採番されPG側で持っていないため再取得）
	            with DMQuery do
	            begin
	                Close;
	                SQL.Clear;
	                SQL.Add('SELECT Ncode '
	                        + 'FROM HAPBS '
	                        +'WHERE BankNCode = ' + FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode)
	                        + ' AND BranchCode = ' + IntToStr(MdBranch.FieldByName('BranchCode').AsInteger)
	                        + ' AND BranchName = ' + AnsiQuotedStr(MdBranch.FieldByName('BranchName').AsString,''''));
	                Open(TRUE);
	                // ツリーのオブジェクトにセット（キー情報のためNULLは考慮しない）
	                p^.eBsNCode := FieldByName('Ncode').AsFloat;
	            end;
// <024> add strat
			end;
// <024> add end
// <023> add end

			//ツリー更新
			with (DataSet as TdxMemData),
				 TTreeNode(FieldByName('TVItemPtr').AsInteger)do
			begin
				if(State<>dsInsert)then
				begin
					//該当位置の見出しを更新
					//<009>Text:=FieldByName('BranchName').AsString;
                    Text := fnMakeDspString(FieldByName('BranchCode').AsInteger,FieldByName('BranchName').AsString,3);
// <SCA> ADD-STR
                end
                else
                begin
                    //採番された内部コードを取得
                    with DMQuery do
                    begin
                        Close;
                        SQL.Clear;
                        SQL.Add('SELECT Ncode '
                                + 'FROM HAPBS '
                                +'WHERE BankNCode = ' + FormatFloat('#',TTViewInfo(TView.Selected.Data^).eNCode)
                                + ' AND BranchCode = ' + IntToStr(MdBranch.FieldByName('BranchCode').AsInteger)
                                + ' AND BranchName = ' + AnsiQuotedStr(MdBranch.FieldByName('BranchName').AsString,''''));
                        Open(TRUE);
                        MdBranch.FieldByName('BranchNCode').AsFloat := FieldByName('Ncode').AsFloat;
// <022> mod start
//                        MdBranch.FieldByName('SortCode').AsString	:= Format('%.3d',[MdBranch.FieldByName('BranchCode').AsInteger]) +
//                                                                       Format('%.10e',[FieldByName('Ncode').AsFloat]);
                        // SortCodeの型変更（Stringだとソート時にエラーとなったため）
                        MdBranch.FieldByName('SortCode').AsFloat	:= (MdBranch.FieldByName('BranchCode').AsInteger * 10000000000) + FieldByName('Ncode').AsFloat;
// <022> mod end
                    end;
// <SCA> ADD-END
				end;
			end;
		except
			if iErrorFlag=0 then
			begin
				FLd := DDataTen.DataSet.FieldByName('BranchCode');
{<001>
				GetMsg(rcMsg,1,4);
				with rcMsg do
					MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
				FLd.FocusControl;
			end;
//			Exit;	//Exitだとエラー処理されない（同一コード・名がグリッドに残る）
			Abort;
		end;
	finally
    	SessionPractice(C_ED_PROCESS);			// <017>
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//************************************************************************
//	Component		:	GrBranch
//	Event			:	BeforeChangeColumn
//	Name			:	HZM
//************************************************************************
{procedure TJNTCRP008003BaseF.GrBranchBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	sCode:string;
begin
//	inherited;
	if ( GrBranch.FocusedColumn = 0 ) and (MdBranch.State = dsInsert) then
	begin
		sCode:=GrBranch.DataSource.DataSet.FieldByName('BranchCode').AsString;
		sCode:=SupCodeAttribute(sCode,3,False);
		GrBranch.DataSource.DataSet.FieldByName('BranchCode').AsString := sCode;
	end;

end;
}
//************************************************************************
//	Component		:	GrBank
//	Event			:	KeyDown
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.GrBankKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then								//	↑カーソル or PageUp
	begin
		if ( GrBank.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	if ((Key = VK_TAB) and (Shift = [ssShift])) or
						((Key = VK_LEFT) and (GrBank.State <> tsEditing))then
	begin
		if ( GrBank.FocusedColumn = 0 ) and ( GrBank.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

end;
//************************************************************************
//	Component		:	MdBank
//	Event			:	AfterPost
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.MdBankAfterPost(DataSet: TDataSet);
begin
	MdBank.SortedField := '';
	MdBank.SortedField := 'BankCode';
end;

//************************************************************************
//	Component		:	MdBranch
//	Event			:	AfterPost
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.MdBranchAfterPost(DataSet: TDataSet);
begin
	MdBranch.SortedField := '';
// <SCA> MOD-STR
//	MdBranch.SortedField := 'BranchCode';
	MdBranch.SortedField := 'SortCode';
// <SCA> MOD-END
end;

//************************************************************************
//	Component		:	GrBranch
//	Event			:	Enter
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.GrBranchEnter(Sender: TObject);
begin

	if MdBranch.IsEmpty then
		MdBranch.Edit;

	//ACControl := Screen.ActiveControl ;
	ACControl:=Sender as TWinControl;											//Activeなｺﾝﾎﾟｰﾈﾝﾄをｾｯﾄ
	GrBranch.FocusedColumn :=0;													//一番目にフォーカスをセット
end;

//************************************************************************
//	Component		:	GrBank
//	Event			:	Enter
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.GrBankEnter(Sender: TObject);
begin

	if MdBank.IsEmpty then
		MdBank.Edit;

	//ACControl := Screen.ActiveControl ;
	ACControl:=Sender as TWinControl;											//Activeなｺﾝﾎﾟｰﾈﾝﾄをｾｯﾄ
	GrBank.FocusedColumn :=0;													//一番目にフォーカスをセット
end;

//************************************************************************
//	Component		:	TView
//	Event			:	Enter
//	Name			:	HZM
//************************************************************************
procedure TJNTCRP008003BaseF.TViewEnter(Sender: TObject);
begin
//	SetImeMode((Sender as TTreeView).Handle,imDisable);
	SetImeMode((Sender as TMTreeView).Handle,imDisable);    // <007>

	ACControl:=Sender as TWinControl;											//Activeなｺﾝﾎﾟｰﾈﾝﾄをｾｯﾄ
	//ACControl := Screen.ActiveControl ;
end;
//**********************************************************************
//*		Component	:Form
//*		Event		:Activate
//*		Name		:華 震名
//**********************************************************************
procedure TJNTCRP008003BaseF.FormActivate(Sender: TObject);
var
	AppPrm :	TAppParam;

begin
	AppPrm.iAction := ACTID_ACTIVEEND;
	AppPrm.pRecord := Pointer(m_pRec);
	AppPrm.pActionParam := nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
end;
//**********************************************************************
//*		Component	:Grid
//*		Event		:値のチェック(銀行）
//*		Name		:KOS 2001/08/07
//**********************************************************************
Function TJNTCRP008003BaseF.CheckdsInsert_Bank :Boolean;							//値のチェック
begin
	{True = なんらかの入力あり}
	Result := True;
	if trim(DDataGenKo.DataSet.FieldByName('BankCode').Asstring) <> '' then
		exit;
	if trim(DDataGenKo.DataSet.FieldByName('BankName').Asstring) <> '' then
		exit;
	if trim(DDataGenKo.DataSet.FieldByName('BankKana').Asstring) <> '' then
		exit;

	MdBank.Cancel;		//挿入行消し
	Result := False;
end;
//**********************************************************************
//*		Component	:Grid
//*		Event		:値のチェック（支店）
//*		Name		:KOS 2001/08/07
//**********************************************************************
Function TJNTCRP008003BaseF.CheckdsInsert_Siten :Boolean;							//値のチェック
begin
	{True = なんらかの入力あり}
	Result := True;
	if trim(DDataTen.DataSet.FieldByName('BranchCode').Asstring) <> '' then
		exit;
	if trim(DDataTen.DataSet.FieldByName('BranchName').Asstring) <> '' then
		exit;
	if trim(DDataTen.DataSet.FieldByName('BranchKana').Asstring) <> '' then
		exit;

	MdBranch.Cancel;		//挿入行消し
	Result := False;
end;
//**************************************************************************
//  Proccess	:   FB用カナ変換表初期設定
//  Name		:   勝沼雅弘
//  Date		:   2001/08/03
//  Parameter   :   NON
//  Retrun	  :   NON
//	NOTE:		:	ﾌｧｰﾑﾊﾞﾝｷﾝｸﾞ使用可能文字列表よりASCIIｺｰﾄﾞ変換表を作成
//  History 　  :
//		2001/08/03	勝沼	Create
//**************************************************************************
procedure TJNTCRP008003BaseF.fnFBCharInit;
var
	I:	integer;
begin
	//	ASCIIｺｰﾄﾞｾｯﾄ
	for I := 0 to 255 do
		FBChar[I]	:=	char(I);
	//	制御文字はだめ
	for I := 0 to 31 do
		FBChar[I]	:=	char(0);
	//	Space はOK
	//	記号NG	!"#$%&'*+
	//	記号OK	().,/-
	for I := 33 to 39 do
		FBChar[I]	:=	char(0);
	FBChar[42]		:=	char(0);
	FBChar[43]		:=	char(0);
	//	数字OK	0123456789
	//	記号NG	:;<=>?@
	for I := 58 to 64 do
		FBChar[I]	:=	char(0);
	//	英字大文字OK
	//	括弧の変換
	FBChar[91]		:=	char(40);		//	[-> (
	FBChar[93]		:=	char(41);		//  ] -> )
	//	記号NG	^_`
	for I := 94 to 96 do
		FBChar[I]	:=	char(0);
	//	英字小文字は大文字でOK
	for I := 97 to 122 do
		FBChar[I]	:=	char(I-32);		//	a -> A
	//	括弧の変換
	FBChar[123]		:=	char(40);		//	{ -> (
	FBChar[124]		:=	char(0);		//  Error
	FBChar[125]		:=	char(41);		//  } -> )
	//
	for I := 126 to 161 do
		FBChar[I]	:=	char(0);
	//	カナ括弧OK	｢｣
	//	カナ記号NG	｡､･
	FBChar[164]		:=	char(0);
	FBChar[165]		:=	char(0);
	//	カナOK	ヲ
	//	カナ小文字を大文字へ
	for I := 167 to 171 do
		FBChar[I]	:=	char(I+10);		// ｧ -> ｱ
	FBChar[172]		:=	char(212);	  // ｬ -> ﾔ
	FBChar[173]		:=	char(213);	  // ｭ -> ﾕ
	FBChar[174]		:=	char(214);	  // ｮ -> ﾖ
	FBChar[175]		:=	char(194);	  // ｯ -> ﾂ
	FBChar[176]		:=	char(45);	   // ｰ -> -
	//	カナOK
	for I := 224 to 255 do
		FBChar[I]	:=	char(0);
end;
//**************************************************************************
//  Proccess	:   FB用カナ自動変換＆チェック処理
//  Name		:   勝沼雅弘
//  Date		:   2001/08/03
//  Parameter   :   sBase   変換、チェック前文字列
//				:	sEdit   変換後文字列
//				:	bInp	ｲﾝﾎﾟｰﾄ時処理
//  Retrun	  :   True	正常
//				:	False	変換不可能文字あり
//	NOTE:		:	ｲﾝﾎﾟｰﾄ時以外は変換不可文字は「！」に置き換え
//				:	ｲﾝﾎﾟｰﾄ時はSPに置き換える
//  History 　  :
//		2001/08/03	勝沼	Create
//**************************************************************************
function TJNTCRP008003BaseF.fnFBKanaChange(const sBase: string; var sEdit: string;
  bInp: Boolean): Boolean;
var
	sChar:		AnsiString;
	I:			integer;
	nLen:		integer;
	nChar:		integer;
	nGet:		integer;
	bErr:		Boolean;
begin
	sEdit	:=	'';
	bErr	:=	True;
	nLen	:=	MjsHanLength(sBase);
	for I:=1 to nLen do
	begin
		sChar	:=	AnsiString(MjsHanCopy(sBase,I,1));
		nChar	:=	integer(sChar[1]);
		nGet	:=	integer(FBChar[nChar]);
		if nGet = 0 then
		begin
			if bInp then
				sChar	:= ' '
			else
				sChar	:= '!';
			bErr	:=	False;
		end
		else
			sChar[1]	:=	AnsiChar(nGet);
		sEdit	:=	sEdit	+ string(sChar);
	end;
	Result  :=	bErr;
end;
//**********************************************************************
//*		Component	:GrBank
//*		Event		:KeyPress
//*		Name		:KOS	 2001/08/08 FB文字ﾁｪｯｸ
//		2001/08/10	勝沼	MBCS文字列の場合、２ﾊﾞｲﾄ目文字をｷｬﾝｾﾙするように変更
//**********************************************************************
procedure TJNTCRP008003BaseF.DDBGridKeyPress(Sender: TObject; var Key: Char);
var
	iCol:   	integer;
	nChar:		integer;
	nGet:		integer;
	sMSCB:		string;
    sChar:      AnsiString;
	sChgStr:	string;
begin
	iCol	:= (sender as TdxDBGrid).FocusedColumn;

	//数値入力
	if (iCol = 0) then
	begin
		if (not ((Key >= '0') and (Key <= '9'))) and (Key <> #8) then	// #8 = Back Space
			Key := #0;
	end;

	//ｶﾅ文字ﾁｪｯｸ
	if (iCol = 2) then
	begin
        sChar := AnsiString(Key);
		nChar := integer(sChar[1]);
		if nChar < 32 then						//	制御文字はそのまま
			Exit;

		//	2001/08/10	Add
		if FbMBCS then							//	MBCS文字列判定
		begin
			Key		:=	char(0);
			FbMBCS	:=	False;					//	MBCS判定解除
			Exit;
		end
		else
		begin
			sMSCB		:=	' ';
			sMSCB[1]	:=	Key;
			if MjsHanByteType(sMSCB,1) = mbLeadByte then
				FbMBCS	:=	True				//	MBCS判定設定
			else
				FbMBCS	:=	False;				//	MBCS判定解除
		end;
		//	2001/08/10	Add

		nGet	:=	integer(FBChar[nChar]);		//	1文字変換
		if nGet = 0 then						//	変換不可能文字
		begin
{<001>
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字です。';
				MjsMessageBoxEx(sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
		end;
        sChar[1] := AnsiChar(nGet);
        sChgStr := string(sChar);
		key := sChgStr[1];						//	変換後文字セット
	end;

end;
//**********************************************************************
//		Proccess	:振込先銀行が社員登録に存在する場合
//		Name		:KOS YK
//		Date		:01/08/24
//		Parameter	:iBank	:銀行ｺｰﾄﾞ
//					:iBranch:支店ｺｰﾄﾞ(省略時-1)
//		Return		:TRUE	:該当あり
//					:FALSE	:該当なし
//		History		:04/02/20(T.Aoki)
//					:ﾊﾟﾗﾒﾀが文字型->数値へ変更
//					:04/02/25(T.Aoki)
//					:社員口座情報のﾁｪｯｸを追加
//**********************************************************************
function TJNTCRP008003Basef.fnFindSyain(iBank:integer;iBranch:integer):Boolean;
var
	i:integer;
	sSQL:string;
	DMQuery:TMQuery;
begin
	Result:=false;
	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> true then
	begin
		Exit;
	end;
	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCorp, DMQuery);
			//0:社員振込情報 1:社員口座情報
			for i:=0 to 1 do
			begin
				sSQL:=			'SELECT';
				sSQL:=sSQL+#13#10' COUNT(SC.EmpNo) CNT ';
				sSQL:=sSQL+#13#10'FROM';
				if(i=0)then
					sSQL:=sSQL+#13#10' NSPSF'
				else
					sSQL:=sSQL+#13#10' NSPACC';
				sSQL:=sSQL+#13#10'AS BT';

				sSQL:=sSQL+#13#10' INNER JOIN';
				sSQL:=sSQL+#13#10' NSPSC AS SC';
				sSQL:=sSQL+#13#10' ON';
				sSQL:=sSQL+#13#10' BT.EmpNCd=SC.EmpNCd';

				sSQL:=sSQL+#13#10'WHERE';
				//振込先銀行ｺｰﾄﾞ
				if(i=0)then
					sSQL:=sSQL+#13#10' FuriCode='
				else
					sSQL:=sSQL+#13#10' BankCode=';

				sSQL:=sSQL+IntToStr(iBank);
				//支店指定時
				if(iBranch>=0)then
				begin
					//支店ｺｰﾄﾞも指定
					sSQL:=sSQL+#13#10'AND';
					if(i=0)then
						sSQL:=sSQL+#13#10'FuriBranch='
					else
						sSQL:=sSQL+#13#10'BranchCode=';
					sSQL:=sSQL+IntToStr(iBranch);
				end;

				with DMQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add(sSQL);
					Open(True);
					if(GetFld('CNT').AsInteger>0)then
						break;
				end;
			end;
			//Loop途中抜け=社員該当あり
			Result:=(i<2);
		except
{<001>
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx('NSPSFの'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Component	:ColBankCode
//		Event		:EditButtonClick
//		Process		:銀行ｺｰﾄﾞ [...]押下
//		Name		:T.Aoki
//		Date		:04/02/17(T.Aoki)
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008003BaseF.GrBankColBankCodeEditButtonClick(
  Sender: TObject);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;
	sBankName	:	string;
	sOfficeName	:	string;
	iRtn		:	integer;

	sSQL:string;
	mqQry:TMQuery;
//<DIC_BANK> >>
	sBankKana	:	string;
	sOfficeKana	:	string;
//<DIC_BANK> <<
begin

    if (MdBank.State in [dsInsert]) = False then
        Exit;

	//全銀検索EXP表示
//<DIC_BANK>	fnCMNBankInit(m_pRec) ;					 //初期化です
	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_BANKFIND) ;					 //初期化です<DIC_BANK>
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_BANKFIND) ;					 //初期化です<DIC_BANK><DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。
	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			nOfficeCD := -1;
{↓<DIC_BANK>
			iRtn:=fnCMNBankShow(	nBankCD,
									nOfficeCD,
									sBankName,
									sOfficeName		);
↑<DIC_BANK>}
//↓<DIC_BANK>
			iRtn:=fnCMNBankShow(	nBankCD,
									nOfficeCD,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);
//↑<DIC_BANK>
			//呼出失敗
			if(iRtn=-1)then
				Abort;

			//選択せず終了
			if(iRtn<>1)then
				Exit;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

{↓<DIC_BANK>
	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCtlDb,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//銀行名
				sSQL:=sSQL+#13#10',BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BankCode=';
				sSQL:=sSQL+		 IntToStr(nBankCD);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//取得できない->検索Expの戻値不正(念のため)
				if IsEmpty then
					Abort;

			end;
			//ｸﾞﾘｯﾄﾞMemDataにｾｯﾄ
			with GrBank.DataSource.DataSet as TdxMemData do
			begin
//[...]押下まででStateは必ず[dsInsert]になっている筈

//				if not(State in [dsInsert,dsEdit])then
//					Edit;

				//銀行ｺｰﾄﾞ
				FieldByName('BankCode').AsInteger:=mqQry.GetFld('BankCode').AsInteger;
				//銀行名
				FieldByName('BankName').AsString :=fnCopy(mqQry.GetFld('BankName').AsString,1,20);
				//銀行名ｶﾅ
				FieldByName('BankKana').AsString :=Copy(mqQry.GetFld('BankKana').AsString,1,20);
				//この時点では行にｾｯﾄするのみ
				//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
			end;
		except
			raise Exception.Create('全銀情報の取得に失敗しました');
		end;
	finally
		mqQry.Free;
	end;
↑<DIC_BANK>}
//↓<DIC_BANK>
	with GrBank.DataSource.DataSet as TdxMemData do
	begin
		//銀行ｺｰﾄﾞ
		FieldByName('BankCode').AsInteger := nBankCD;
		//銀行名
		FieldByName('BankName').AsString := fnCopy(sBankName,1,20);
		//銀行名ｶﾅ
		FieldByName('BankKana').AsString :=MjsHanCopy(sBankKana,1,20);
		//この時点では行にｾｯﾄするのみ
		//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
	end;
//↑<DIC_BANK>

end;

//**********************************************************************
//		Component	:ColBankCode
//		Event		:EditButtonClick
//		Process		:支店ｺｰﾄﾞ [...]押下
//		Name		:T.Aoki
//		Date		:04/02/17(T.Aoki)
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008003BaseF.GrBranchColumn1EditButtonClick(Sender: TObject);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;

	sSQL:string;
	mqQry:TMQuery;

	fDlg:TJNTCRP008003DlgF;

//<DIC_BANK> >>
	sBankName	:	string;
	sOfficeName	:	string;
	iRtn		:	integer;
	sBankKana	:	string;
	sOfficeKana	:	string;

	iRCnt		:	Integer;
//<DIC_BANK> <<

begin

    if (MdBranch.State in [dsInsert]) = False then
        Exit;


	//念のため?
	if(TView.Selected=nil)or
	  (TView.Selected.Data=nil)or
	  (TTViewInfo(TView.Selected.Data^).iBankCode<=0)then
		Exit;

	nBankCd:=TTViewInfo(TView.Selected.Data^).iBankCode;

{↓<DIC_BANK>
	fDlg:=TJNTCRP008003DlgF.CreateForm(	Self,
										m_pRec,
										nBankCD	);

	try
		if fDlg.DoDlg(@nOfficeCD)<>mrOK then
			Exit;
	finally
		fDlg.Free;
	end;

	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCtlDb,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BK.BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//支店ｺｰﾄﾞ
				sSQL:=sSQL+#13#10',BR.BankOfficeCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchCode';
				//銀行名
				sSQL:=sSQL+#13#10',BK.BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//支店名
				sSQL:=sSQL+#13#10',BR.BankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',BK.KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				//ｶﾅ支店名
				sSQL:=sSQL+#13#10',BR.KanaBankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchKana';

				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BK';
				sSQL:=sSQL+#13#10' INNER JOIN';
				sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BR';
				sSQL:=sSQL+#13#10' ON';
				sSQL:=sSQL+#13#10' BK.BankCD=BR.BankCD';

				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BK.BankCD=';
				sSQL:=sSQL+		 IntToStr(nBankCD);
				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BankOfficeCD=';
				sSQL:=sSQL+		 IntToStr(nOfficeCD);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//取得できない->検索Expの戻値不正(念のため)
				if IsEmpty then
					Abort;
			end;
			//ｸﾞﾘｯﾄﾞMemDataにｾｯﾄ
			with GrBranch.DataSource.DataSet as TdxMemData do
			begin
//[...]押下まででStateは必ず[dsInsert]になっている筈

//				if not(State in [dsInsert,dsEdit])then
//					Edit;

				//支店ｺｰﾄﾞ
				FieldByName('BranchCode').AsInteger	:=mqQry.GetFld('BranchCode').AsInteger;
				//支店名
				FieldByName('BranchName').AsString	:=fnCopy(mqQry.GetFld('BranchName').AsString,1,20);
				//支店名ｶﾅ
				FieldByName('BranchKana').AsString	:=Copy(mqQry.GetFld('BranchKana').AsString,1,15);
				//この時点では行にｾｯﾄするのみ
				//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
			end;
		except
			raise Exception.Create('全銀情報の取得に失敗しました');
		end;
	finally
		mqQry.Free;
	end;
↑<DIC_BANK>}
//↓<DIC_BANK>
	//=========================================
	//		銀行辞書
	//=========================================
	//全銀検索EXP表示（支店検索）
	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_TENPOFINDONLY) ;					 //初期化です
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_TENPOFINDONLY) ;			     //初期化です<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			nOfficeCD := 0;
			iRtn:=fnCMNBankShow(	nBankCD,
									nOfficeCD,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);
			//呼出失敗
			if(iRtn=-1)then
				Abort;

			//選択せず終了
			if(iRtn<>1)then
				Exit;

		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

	with GrBranch.DataSource.DataSet as TdxMemData do
	begin
//[...]押下まででStateは必ず[dsInsert]になっている筈
		//支店ｺｰﾄﾞ
		FieldByName('BranchCode').AsInteger	:=nOfficeCD;
		//支店名
		FieldByName('BranchName').AsString	:=fnCopy(sOfficeName,1,20);
		//支店名ｶﾅ
		FieldByName('BranchKana').AsString	:=MjsHanCopy(sOfficeKana,1,15);
		//この時点では行にｾｯﾄするのみ
		//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
	end;
//↑<DIC_BANK>
end;

//**********************************************************************
//		Process		:全角前半が境目ならｶｯﾄして文字列ｺﾋﾟｰ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:sSrc:元文字列
//					:iPos:開始位置
//					:iLen:ﾊﾞｲﾄ長
//		Return		:ｺﾋﾟｰ後文字列
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function fnCopy(sSrc:string;iPos,iLen:integer):String;
begin
	if(iLen>0)and
	  (iLen<(MjsHanLength(sSrc)-(iPos-1)))and
	  (MjsHanByteType(sSrc,iPos+iLen-1)=mbLeadByte)then
		Dec(iLen);

	Result:=MjsHanCopy(sSrc,iPos,iLen);
end;

//************************************************************************
//*		Component		:	TView ( TTreeView )
//*							オブジェクトをドラッグしたとき
//*		Event			:	OnDragOver
//************************************************************************
procedure TJNTCRP008003BaseF.TViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
	cDragNode	:	TTreeNode;
	cDropNode	:	TTreeNode;
	rDrag		:	^TTViewInfo;
	rDrop		:	^TTViewInfo;
    BfrBKCD,BfrKbn  : Integer;  //移動元銀行ｺｰﾄﾞ,移動元本支店区分
    AftBKCD,AftKbn  : Integer;  //移動先銀行ｺｰﾄﾞ,移動先本支店区分
    BHCD            : Integer;  //支店ｺｰﾄﾞ

begin
    rDrag := Nil;

    if TView.Focused then
	begin
		cDragNode := TView.Selected;
		if cDragNode <> nil then
			rDrag := cDragNode.Data;
	end
	else
	begin
		cDragNode := TView.Selected;
		if cDragNode <> nil then
			rDrag := cDragNode.Data;

	end;

    if rDrag = nil then
    begin
        Accept := False;
        exit;
    end;


	// 本店の移動は不可
	if (rDrag.iHontenKbn  = TreeBankF ) then
	begin
		Accept := False;
		exit;
	end;

//	cDropNode := (TTreeView(Sender).GetNodeAt(X,Y));
	cDropNode := (TTreeView(Sender).GetNodeAt(X,Y));        // <007>

	if (cDragNode = nil) or (cDropNode = nil) then		   // Nil時
	begin
		Accept := False;
		exit;
	end;

	rDrop := cDropNode.Data;					// Drop先のData取得

    //Drag Or Drop のNodeがNilの場合は処理終了
    if (rDrag = nil) or (rDrop = nil) then
    begin
		Accept := False;
        Exit;
    end;

    //同一支店ｺｰﾄﾞの移動は不可
    if rDrag.iBranchCode = rDrop.iBranchCode then
    begin
		Accept := False;
        Exit;
    end;


end;
//************************************************************************
//*		Component		:	TView ( TTreeView )
//*							ドラッグ＆ドロップ
//*		Event			:	OnDragDrop
//************************************************************************
procedure TJNTCRP008003BaseF.TViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);

var
    cNode       : TTreeNode;
    wkNode      : TTreeNode;
	wkRec		: ^TTViewInfo;
    iLoop       : Integer;
    sDspName    : String;
    lcNM        : String;
    lcNMK       : String;

	cDragNode		: TTreeNode;
	cDropNode		: TTreeNode;
	cDragNodeParent	: TTreeNode;
	cDropNodeParent	: TTreeNode;
	rDrag			: ^TTViewInfo;
	rDrop			: ^TTViewInfo;
	rDragParent		: ^TTViewInfo;
	rDropParent		: ^TTViewInfo;

    BfrBKCD,BfrKbn  : Integer;  //移動元銀行ｺｰﾄﾞ,移動元本支店区分
    AftBKCD,AftKbn  : Integer;  //移動先銀行ｺｰﾄﾞ,移動先本支店区分
    eBfrBKCD,eAftBKCD:Extended; //銀行内部ｺｰﾄﾞ

    BHCD            : Integer;  //支店ｺｰﾄﾞ

begin

	if (Screen.ActiveControl.Name = TView.Name) then		//	TreeViewの時
	begin

    	cDragNode := TView.Selected;
	    cDropNode := TView.DropTarget;

    	if cDropNode = nil then exit;                   //DropTargetが無い場合は終了

    	cDragNodeParent	:= cDragNode.Parent;
	    cDropNodeParent := cDropNode.Parent;

    	if (cDragNodeParent <> Nil) then
	    	rDragParent	 :=	cDragNodeParent.Data
    	else
	    	rDragParent	 :=	Nil;

    	if (cDropNodeParent <> Nil) then
	    	rDropParent	:= cDropNodeParent.Data
    	else
	    	rDropParent	:= Nil;

       	rDrag := cDragNode.Data;
        rDrop := cDropNode.Data;

        //Drag Or Drop のNodeがNilの場合は処理終了
        if (rDrag = nil) or (rDrop = nil) then
            Exit;

        // 移動元
        eBfrBKCD:= rDrag.eNCode;
        BfrBKCD := rDrag.iBankCode;
        BfrKbn  := rDrag.iHontenKbn;
        // 移動先
        eAftBKCD:= rDrop.eNCode;
        AftBKCD := rDrop.iBankCode;
        AftKbn  := rDrop.iHontenKbn;

        // 支店コード
        BHCD := rDrag.iBranchCode;

    	// 移動元が本店
    	if (BfrKbn = TreeBankF ) then
            Exit;

    	// 移動元本店と移動先本店が同一の時
	    if (BfrBKCD = AftBKCD) then
			Exit;

    	// Update
        if fnUpDateTreeDrop(eBfrBKCD,eAftBKCD,BHCD) = False then
            Exit;


        if rDrop.iHontenKbn <> TreeBankF then
            cNode := cDropNodeParent            //支店（親Node）
        else
            cNode :=  TView.DropTarget;         //本店（自Node）


        //移動先Tree追加
	    New(wkRec);
        wkRec.eNCode        := eAftBKCD;
        wkRec.iBankCode     := AftBKCD;
        wkRec.iBranchCode   := BHCD;
        wkRec.iHontenKbn    := TreeBankS;   //支店

        //移動元の名称取得
        if fnExistChk(eAftBKCD,BHCD,lcNM,lcNMK) = True then
            sDspName            := lcNM;


        sDspName := fnMakeDspString(BHCD,sDspName,3);               //<009>

       	wkNode := TView.Items.AddChildobject(cNode,sDspName,wkRec);
    	wkNode.ImageIndex	 := 4;
    	wkNode.SelectedIndex := wkNode.ImageIndex + 1;
    	wkNode.Expanded := True;

        //移動元Tree削除
    	for iLoop := TView.Items.Count-1 downto 0 do
    	begin
	    	cNode := TView.Items[iLoop];
    		wkRec := cNode.Data;
//    		if (wkRec.iBankCode = BfrBKCD) and (wkRec.iBranchCode  = BHCD) then
    		if (wkRec.eNCode  = eBfrBKCD) and (wkRec.iBranchCode  = BHCD) then
    		begin
    			cNode.Delete;
                exit;
		    end
    	end;
    end;

end;
//************************************************************************
//*		function		:	fnExistChk
//*							支店存在ﾁｪｯｸ(名称獲得)
//************************************************************************
function TJNTCRP008003BaseF.fnExistChk (pBankCD:Extended;pBranchCD:Integer;
                                                    var NM,NMK: String): Boolean;
var
	mqQry   : TMQuery;
begin

    Result := False;
	mqQry:=TMQuery.Create(Self);
    m_iBraNCode := 0;		// <020> Add

	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCorp,mqQry);

			with mqQry do
			begin
    			Close ();
		    	SQL.Clear ();
// <020> Mod start
//    			SQL.Add   ('SELECT BankNCode,BranchCode,BranchName,BranchKana FROM HAPBS    ');
				SQL.Add   ('SELECT Ncode, BankNCode,BranchCode,BranchName,BranchKana FROM HAPBS ');
// <020> Mod end
    			SQL.Add   ('WHERE   BankNCode   = :BankCD                          ');
    			SQL.Add   ('And     BranchCode  = :BranchCD                        ');
	    		ParamByName ('BankCD'   ).AsFloat    := pBankCD     ;
	    		ParamByName ('BranchCD' ).AsInteger  := pBranchCD   ;

                Open;

    			if	not EOF then
	    		begin
                    NM    := FieldByName('BranchName').AsString;
                    NMK   := FieldByName('BranchKana').AsString;
                    m_iBraNCode := Trunc(FieldByName('Ncode').AsFloat);		// <020> Add
                    Result := True;
                end;
    		end;
		except
			raise Exception.Create('支店情報の取得に失敗しました。');
            Result := False;
		end;
	finally
		mqQry.Free;
	end;
end;

//************************************************************************
//*		function		:	fnUpDateTreeDrop
//*							ﾄﾞﾛｯﾌﾟ時の更新処理
//************************************************************************
function TJNTCRP008003BaseF.fnUpDateTreeDrop(BfrBankCD,AftBankCD:Extended;BranchCD: Integer): Boolean;
var
	mqQry   : TMQuery;
    lcNM    : String;
    lcNMK   : String;
    UpdKbn  : Boolean;
    mQrySF  : TMQuery;	//<025>
begin

    //初期化
    Result  := True;
    lcNM    := '';
    lcNMK   := '';

    //移動先存在ﾁｪｯｸ(条件にHITしない場合はInsert)
    if fnExistChk(AftBankCD,BranchCD,lcNM,lcNMK) = True then
    begin
        Result := False;    //移動先に同支店ｺｰﾄﾞが存在する場合
        Exit;
    end;
//<025> ↓
	//②ドラッグ＆ドロップを無効化する
    mQrySF := TMQuery.Create(Self);
    try
    	m_pMDataModule.SetDBInfoToQuery(dbCorp,mQrySF);

        with mQrySF do
        begin
        	Close;
            SQL.Clear;
            SQL.Add('select 1 where exists (select HAPSF.BranchNcode, HAPBS.NCode from HAPSF inner join HAPBS on HAPSF.BranchNCode = HAPBS.NCode');	//<026>
            SQL.Add('where HAPBS.BranchCode = :hBranchCode) ');
            ParamByName('hBranchCode').AsInteger := BranchCD;
            if not Open(True) then
            begin
             	Result := False;
                Exit;
            end;

            if not Eof then
            begin
             	Result := False;		//振込先としてHAPSFに登録済の場合、ドロップ不可
                Exit;
            end;

        end;
    finally
    	mQrySF.Free;
    end;
//<025> ↑

    UpdKbn := False;

    //移動元存在ﾁｪｯｸ（名称取得）
    if fnExistChk(BfrBankCD,BranchCD,lcNM,lcNMK) = False then
    begin
        Result := False;
        Exit;
// <020> Add start
	end
    else
    begin
        if( not fnWFChk_FriBank (1, m_iBraNCode)) then
        begin
            MjsMessageBox(Self,	m_sWFError,
                            mjWarning,
                            mjDefOK									);
            Result := False;
            Exit;
        end;
// <020> Add end
    end;

    //ｸｴﾘの構築
	mqQry:=TMQuery.Create(Self);

    SessionPractice(C_ST_PROCESS);				// <017>

	try
		try
            //DB接続
			m_pMDataModule.SetDBInfoToQuery(dbCorp,mqQry);

			//ﾄﾗﾝｻﾞｸｼｮﾝ
			m_pMDataModule.BeginTran(dbCorp);

            with mqQry do
	        begin
    		    Close ();
	    	    SQL.Clear ();
                SQL.Add   ('Delete from HAPBS                               ');
   		    	SQL.Add   ('WHERE   BankNCode   = :BankCD                   ');
   			    SQL.Add   ('And     BranchCode  = :BranchCD                 ');
       		    ParamByName ('BankCD'   ).AsFloat    := BfrBankCD;
        	    ParamByName ('BranchCD' ).AsInteger  := BranchCD;
   		        ExecSQL(True);

    		    Close ();
	    	    SQL.Clear ();
                if UpdKbn = True then
                Begin
                //何もしない？
    			    SQL.Add   ('Update HAPBS Set                            ');
    			    SQL.Add   ('BranchName = :Name,                         ');
    			    SQL.Add   ('BranchKana = :Kana,                         ');
    			    SQL.Add   ('UpdTantoNCode = :UpdTantoNCode              '); // <018>
    		    	SQL.Add   ('WHERE   BankNCode   = :BankCD               ');
    			    SQL.Add   ('And     BranchCode  = :BranchCD             ');
           		    ParamByName ('BankCD'   ).AsFloat    := AftBankCD;
   	        	    ParamByName ('BranchCD' ).AsInteger  := BranchCD;
   		            ParamByName ('Name'     ).AsString   := lcNM;
   		            ParamByName ('Kana'     ).AsString   := lcNMK;
           		    ParamByName ('UpdTantoNCode').AsFloat := m_TantoNCode; // <018>
    		        ExecSQL(True);
                end
                else
                begin
    			    SQL.Add   ('Insert Into HAPBS                           ');
    			    SQL.Add   ('(BankNCode,BranchCode,BranchName,BranchKana,');
    			    SQL.Add   ('UpdTantoNCode)                              '); // <018>
    			    SQL.Add   ('Values                                      ');
    			    SQL.Add   ('(:BankCD,:BranchCD,:Name,:Kana,             ');
    			    SQL.Add   (':UpdTantoNCode)                             '); // <018>
           		    ParamByName ('BankCD'   ).AsFloat    := AftBankCD;
   	        	    ParamByName ('BranchCD' ).AsInteger  := BranchCD;
   		            ParamByName ('Name'     ).AsString   := lcNM;
   		            ParamByName ('Kana'     ).AsString   := lcNMK;
           		    ParamByName ('UpdTantoNCode').AsFloat := m_TantoNCode; // <018>
    		        ExecSQL(True);
                end;
            end;
        	//ここまで問題なければCommit
    		dbCorp.Commit;
		except
			dbCorp.RollBack;
			raise Exception.Create('更新に失敗しました。');
            Result := False;
		end;
	finally
    	SessionPractice(C_ED_PROCESS);			// <017>
		mqQry.Free;
	end;
end;

//************************************************************************
//*		function		:	NCode取得
//************************************************************************
function TJNTCRP008003BaseF.fnBankNCodeGet(BankCD:Integer):Extended;
var
mqQry   : TMQuery;

begin

    Result := 0;
	mqQry:=TMQuery.Create(Self);

	try
        //DB接続
    	m_pMDataModule.SetDBInfoToQuery(dbCorp,mqQry);

        with mqQry do
	    begin
            Close ();
	        SQL.Clear ();
            SQL.Add   ('Select NCode');
            SQL.Add   ('from HAPBF ');
   	   	    SQL.Add   ('WHERE BankCode = :BankCD');

       		ParamByName ('BankCD'   ).AsFloat  := BankCD;

   		    Open;


            if not Eof then
                Result := GetFld('NCode').AsFloat
        end;
  	finally
        mqQry.Close;
       	mqQry.Free;
    end;
end;

//**********************************************************************
//*		Proccess	:	参照・入力時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Parameter	:	Select		:	NORMAL(通常処理),BASICONLY(基本のみ設定可能),REFER(参照のみ)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP008003BaseF.fnPartsControl(Select: Integer);
begin

	//	削除ﾎﾞﾀﾝ
//    B_Delete.Enabled := m_cJNTArea.IsDelete;  	// <013> DEL

	if (Select = REFER) then	//	参照の時
	begin
		//	TreeView
		TView.DragMode	:=	dmManual;
		//	銀行Grid
		GrBank.Options	:=	GrBank.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		GrBankColBankCode		.ReadOnly	:=	True;
		GrBankColBankName		.ReadOnly 	:=	True;
		GrBankColBankKana		.ReadOnly	:=	True;
		//	支店Grid
		GrBranch.Options :=	GrBranch.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		GrBranchColumn1		.ReadOnly	:=	True;
		GrBranchColumn2		.ReadOnly 	:=	True;
		GrBranchColumn4		.ReadOnly	:=	True;
		GrBranchColumn5		.ReadOnly	:=	True;

        //  挿入ﾎﾞﾀﾝ
        B_Ins.Enabled := False;

		B_Delete.Enabled := False; 					// <013> ADD

        B_CodeChange.Enabled := False;	// ｺｰﾄﾞ変更ﾎﾞﾀﾝを無効にする<CDCHG>
	end
	else
	begin
		//	TreeView
		TView.DragMode	:=	dmAutomatic;
		//	銀行Grid
		GrBank.Options	:=	GrBank.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		GrBankColBankCode		.ReadOnly	:=	False;
		GrBankColBankName		.ReadOnly 	:=	False;
		GrBankColBankKana		.ReadOnly	:=	False;
		//	支店Grid
		GrBranch.Options :=	GrBranch.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		GrBranchColumn1		.ReadOnly	:=	False;
		GrBranchColumn2		.ReadOnly 	:=	False;
		GrBranchColumn4		.ReadOnly	:=	False;
		GrBranchColumn5		.ReadOnly	:=	False;

        //  挿入ﾎﾞﾀﾝ
        B_Ins.Enabled    := m_IsUpdate;

        B_Delete.Enabled := m_cJNTArea.IsDelete;    // <013> ADD

        B_CodeChange.Enabled := m_cJNTArea.IsDelete;	//<CDCHG>
    end;
end;
//**********************************************************************
//*		Proccess	:	権限取得
//**********************************************************************
procedure TJNTCRP008003BaseF.fnGetGrants();
var
// <012> ADD start
	dQuery    : TMQuery;
    MjsMsgRec : TMJSMsgRec;
// <012> ADD end
begin

//    m_cJNTArea.FxPermission;						// 権限取得 <003>
// <005>
//<0830>
//(*
	B_Print.Enabled := m_cJNTArea.IsPrint;			// 印刷権限
//*)
//    B_Print.Enabled := False;


// <012> DEL start
													// 親側で決算確定メッセージを出すので、ここでは出さない
(*    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then		// 決算確定MSG
	begin
        giReferFlag	:= REFER;						// 決算確定の為参照のみ
        m_IsUpdate  := False;
    end
    else
	begin
*)
// <012> DEL end

// <012> ADD start
	dQuery := TMQuery.Create (Self);				// MQueryの構築
                                             		// DBとMQueryの接続
	m_pMDataModule.SetDBInfoToQuery (dbCorp, dQuery);

	with (dQuery) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT ComKbn2 FROM DTMAIN');

		if not Open () then
        begin
        	m_cComArea.m_MsgStd.GetMsgDB (MjsMsgRec, dQuery);
            MjsMessageBoxEx(Self,
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            False);

            giReferFlag	:= REFER;   				// 参照ﾓｰﾄﾞ
// <015> ADD start
            m_bDelete := False;						// 削除不可
            m_IsUpdate  := False;
// <015> ADD end
            dQuery.Close();
            dQuery.Free();
            Exit;
        end;

		if (not EOF) then
		begin

            if FieldByName ('ComKbn2').AsInteger = 1 then
            begin
				giReferFlag	:= REFER;
// <015> ADD start
                m_bDelete := False;					// 削除不可
                m_IsUpdate := False;
// <015> ADD end
                dQuery.Close();
                dQuery.Free();
                Exit;
            end;
		end;
        dQuery.Close();
        dQuery.Free();
    end;
// <012> ADD end



        if m_cJNTArea.IsAppend and m_cJNTArea.IsModify then
            m_IsUpdate := True
        else
            m_IsUpdate := False;

// <013> DEL start
(*
		if ( m_IsUpdate ) then
	        giReferFlag	:= NORMAL
		else
			giReferFlag	:= REFER;
*)
// <013> DEL end

// <015> ADD start     								// 削除した箇所を復帰
	 	if m_IsUpdate then
        begin
         	giReferFlag	:= NORMAL;					// 通常処理
        end
        else
        begin
         	giReferFlag	:= REFER;					// 更新権限無し
        end;

        m_bDelete := m_cJNTArea.IsDelete;			// 削除ﾌﾗｸﾞを権限で判断
// <015> ADD end

//	end;    										// <012> DEL

end;
//-----------------------------------------------------------------------------
// BChangeClick()
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008003BaseF.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    iAction : Integer;

    lvRect: TRect;
    lvWidth, lvHeight: Integer;
begin

    m_bBtnChange := False;
    if  (B_Change.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGINEND;            //  格納通知
        B_Change.Caption := '切出(&G)';                         // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible      :=	False;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect       := Self.ClientRect;
        lvWidth      := lvRect.Right - lvRect.Left;
        lvHeight     := lvRect.Bottom - lvRect.Top;

        ClientWidth  := lvWidth;
        ClientHeight := lvHeight;
		Visible		 := True;

        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGOUTEND;           //  取出通知
        B_Change.Caption := '埋込(&G)';                         // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=    Pointer(m_Base_pRec);         // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                          // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := True;

end;
//**********************************************************************
//		Component	:ColBankCode
//		Event		:EditButtonClick
//		Process		:銀行ｺｰﾄﾞ [...]押下
//		Name		:T.Aoki
//		Date		:04/02/17(T.Aoki)
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008003BaseF.fnGetBKName(pBkCode:Integer);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;
	sBankName	:	string;
	sOfficeName	:	string;
	iRtn		:	integer;

	sSQL:string;
	mqQry:TMQuery;
begin

	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCtlDb,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//銀行名
				sSQL:=sSQL+#13#10',BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BankCode=';
				sSQL:=sSQL+		 IntToStr(pBkCode);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//取得できない->検索Expの戻値不正(念のため)
				if not Eof then
                begin
        			with GrBank.DataSource.DataSet as TdxMemData do
		        	begin
    			        //銀行名
                        if FieldByName('BankName').AsString = '' then
	        			    FieldByName('BankName').AsString :=fnCopy(mqQry.GetFld('BankName').AsString,1,20);
			        	//銀行名ｶﾅ
                        if FieldByName('BankKana').AsString = '' then
				            FieldByName('BankKana').AsString :=MjsHanCopy(mqQry.GetFld('BankKana').AsString,1,20);
				        //この時点では行にｾｯﾄするのみ
				        //ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
			        end;
                end;

			end;
		except

		end;
	finally
		mqQry.Close;
		mqQry.Free;
	end;
end;

//**********************************************************************
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008003BaseF.fnGetBraName(pBkCode:Integer;pBraCode:Integer);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;

	sSQL:string;
	mqQry:TMQuery;

    sName       : String;

begin


	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_pMDataModule.SetDBInfoToQuery(dbCtlDb,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BK.BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//支店ｺｰﾄﾞ
				sSQL:=sSQL+#13#10',BR.BankOfficeCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchCode';
				//銀行名
				sSQL:=sSQL+#13#10',BK.BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//支店名
				sSQL:=sSQL+#13#10',BR.BankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',BK.KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				//ｶﾅ支店名
				sSQL:=sSQL+#13#10',BR.KanaBankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchKana';

				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BK';
				sSQL:=sSQL+#13#10' INNER JOIN';
				sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BR';
				sSQL:=sSQL+#13#10' ON';
				sSQL:=sSQL+#13#10' BK.BankCD=BR.BankCD';

				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BK.BankCD=';
				sSQL:=sSQL+		 IntToStr(pBkCode);
				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BankOfficeCD=';
				sSQL:=sSQL+		 IntToStr(pBraCode);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				Open(TRUE);

				if not Eof then
                begin
        			with GrBranch.DataSource.DataSet as TdxMemData do
		        	begin
                        if FieldByName('BranchName').AsString = '' then
        				    FieldByName('BranchName').AsString	:=fnCopy(mqQry.GetFld('BranchName').AsString,1,20);

                        if FieldByName('BranchKana').AsString = '' then
		    	    	    FieldByName('BranchKana').AsString	:=MjsHanCopy(mqQry.GetFld('BranchKana').AsString,1,15);
		        	end;
                end;
			end;

		except


		end;
	finally
		mqQry.Close;
		mqQry.Free;
	end;
end;

procedure TJNTCRP008003BaseF.fnCmnChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);

var
    cMem     : TdxMemData;
    StrName  : String;
begin


    if (column = 0) then
    begin
        if ACControl.Name = GrBank.Name then
            fnGetBkName(MdBankBankCode.AsInteger)
        else
            fnGetBraName(TTViewInfo(TView.Selected.Data^).iBankCode,MdBranchBranchCode.AsInteger);
    end;
end;

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/03/01
//*		Parameter	:	exNCode : ﾁｪｯｸ対象支店内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008003BaseF.fnDelCheck(exNCode: Extended; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;
    try
        SPHapBS.Connection := dbCorp;
        //SPHapBS.SessionName := dbCorp.SessionName;

        // 【人給】MP_HAP_CHK_HAPBS
        with SPHapBS do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
// Delphi10 ST
            FetchOptions.Items := FetchOptions.Items - [fimeta];
// Delphi10 ED
            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_HAP_CHK_HAPBS)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

//**********************************************************************
//*		Proccess	:	銀行に付随する全支店の削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/03/01
//*		Parameter	:	exNCode : ﾁｪｯｸ対象銀行内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008003BaseF.fnDelCheckBank(exBankNCode: Extended; var strErr: String): Boolean;
var
    QueryBS    : TMQuery;
begin
    Result := False;

    QueryBS := TMQuery.Create(Self);
    m_pMDataModule.SetDBInfoToQuery (dbCorp, QueryBS);

    try
        with QueryBS do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT NCode FROM HAPBS '         );
            SQL.Add   ('WHERE BankNCode = :parBankNCode'    );
                                            // 銀行内部ｺｰﾄﾞ
            ParamByName ('parBankNCode').AsFloat    := exBankNCode;
            Open ();

            while not Eof do                // 口座1件ずつ
            begin
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
                if not fnDelCheck(GetFld('NCode').AsFloat, strErr) then
                begin
                    Exit;
                end;
                Next;
            end;
        end;
    finally
        QueryBS.Close;
        QueryBS.Free;
    end;

    Result := True;

end;

//**********************************************************************
//	Proccess	:	ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ <011>
//	Name		:	Y.Mogi
//	Date		:	2007/06/07
//	Parameter	:
//	Return		:	True: 正常 False: 異常
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP008003BaseF.fnChkGroupKbn(): Boolean;
var
    mqCtrlDb    : TMQuery;
    m_MjsMsgRec : TMJSMsgRec;

begin

    Result      := True;

//↓<MLXHAP>MLX給与の場合は、Trueで抜けます。
	if TMSeries.IsMjsLink3 then
	begin
		Exit;
	end;
//↑<MLXHAP>

    mqCtrlDb := TMQuery.Create(Self);

    try
        m_pMDataModule.SetDBInfoToQuery(dbCorp, mqCtrlDb);

        with mqCtrlDb do
        begin
            Close();
            SQL.Clear();
            SQL.Add('select * from SecMain');
            // ｸﾞﾙｰﾌﾟ管理、採用有、受信会社
            SQL.Add('where (OpeKbn = 2) and (UseKbn = 1) and (GrpTransKbn = 1)');

            // ｴﾗｰの判定
            if (Open = False) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, mqCtrlDb);
                MjsMessageBoxEx(Self,
                                m_MjsMsgRec.sMsg,
                                m_MjsMsgRec.sTitle,
                                m_MjsMsgRec.icontype,
                                m_MjsMsgRec.btntype,
                                m_MjsMsgRec.btndef,
                                False
                               );

		        giReferFlag	:= REFER;   // 参照ﾓｰﾄﾞ
                m_bDelete := False;		// <015> ADD 削除不可
                Result := False;
                Exit;
            end;

            // ﾚｺｰﾄﾞが存在する場合は、子会社としてｸﾞﾙｰﾌﾟ管理されている
            if (not Eof) then
            begin
                MJSMessageBoxEx(Self, 'ｸﾞﾙｰﾌﾟ管理が採用されている為、追加、修正、削除は'
                                    + '配信会社で行ってください。','振込先銀行登録',
                                    mjInformation, mjOk, mjDefOk, FALSE);

		        giReferFlag	:= REFER;   // 参照ﾓｰﾄﾞ
                m_bDelete   := False;	// <015> ADD 削除不可
            end;
        end;
    finally
        mqCtrlDb.Close();
        mqCtrlDb.Free();
    end;

end;

//**********************************************************************
//	Proccess	:	削除ﾎﾞﾀﾝのEnabled制御 <015>
//	Name		:	S.Suzuki
//	Date		:	2007/08/31
//	Parameter	:   DMemBank: 銀行MemDataまたは支店MemData
//	Return		:	True: 削除ﾎﾞﾀﾝ有効 False: 削除ﾎﾞﾀﾝ無効
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP008003BaseF.IsDeleteEnable(DMemBank : TdxMemData): Boolean;
begin
        									// 決算確定でなく、追加修正権限ありおよびﾚｺｰﾄﾞがある場合
	if (m_bDelete) and (DMemBank.RecordCount <> 0) then
    begin
       	Result := True;						// 削除ﾎﾞﾀﾝ有効にする
    end
    else
    begin
    	Result := False;                    // 削除ﾎﾞﾀﾝを無効にする
    end;
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<017>
//	Name		:	T.Seki
//	Date		:	2008/01/08
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008003BaseF.SessionPractice(iSyori: Integer);
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
//    SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
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
function TJNTCRP008003BaseF.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

// <020> Add start
//-----------------------------------------------------------------------------
// fnWFChk_FriBank()
//  Proccess    :	業務プロセスＷＦ振込先銀行関連チェック
//	Name		:	G.Kojima(MSI)
//	Date		:	2011 / 06 / 08
//	Parameter	:	iChkKbn(チェック区分:0.銀行チェック、1.銀行・支店チェック)
//				:   iBkNCd(銀行または支店内部コード)
//	Retrun		:	Boolean
//	History		:	2011 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//-----------------------------------------------------------------------------
function	TJNTCRP008003BaseF.fnWFChk_FriBank (iChkKbn: Integer; iBkNCd: Integer ): Boolean;
var
	cStored         :   TFDStoredProc;
begin
	Result	:= True;

//↓<MLXHAP>MLX給与の場合は、Trueで抜けます。
	if TMSeries.IsMjsLink3 then
	begin
		Exit;
	end;
//↑<MLXHAP>

	cStored := TFDStoredProc.Create(Self);
    with cStored do
    begin
        try
            m_pMDataModule.SetDBInfoToQuery(dbCorp, cStored);		// DBとStoredProcの接続

            cStored.StoredProcName := 'MP_PAY_WFChk_FriBank';
            Params.Clear;
// Delphi10 ST
//            Prepare;
            MjsPrepareStoredProc(cStored);
// Delphi10 ED

            ParamByName('@ChkKbn').AsInteger	:=  iChkKbn;
            ParamByName('@NCode').AsFloat		:=  iBkNCd;
			FetchOptions.Items := FetchOptions.Items - [fiMeta];
            ExecProc;                           // ｽﾄｱﾄﾞ実行

            // 結果
		    if (ParamByName('@RetCd').AsInteger = 1) then
		    begin
		        Result	:= False;
		    end;
        finally
// Delphi10 ST
//            UnPrepare;
// Delphi10 ED
            Free;
        end;
    end;
end;
// <020> Add end

//<DIC_BANK> >>
procedure TJNTCRP008003BaseF.GrBankBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	iRtn		:	integer;
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;
	sBankName	:	string;
	sBankKana	:	string;
	sOfficeName	:	string;
	sOfficeKana	:	string;
begin
	//
	if Column <> 0 then
		exit;

	with GrBank.DataSource.DataSet as TdxMemData do
	begin
		if (FieldByName('BankName').AsString <> '')
		  or (FieldByName('BankKana').AsString <> '') then
			exit;

		nBankCD := FieldByName('BankCode').AsInteger;
	end;

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_MASTERCHECK) ;					 //初期化です
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK) ;			 //初期化です<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			nOfficeCD := -1;
			iRtn:=fnCMNBankShow(	nBankCD,
									nOfficeCD,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);

			//呼出失敗
			if(iRtn=-1)then
				Abort;

			//選択せず終了
			if(iRtn<>1)then
				Exit;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

	with GrBank.DataSource.DataSet as TdxMemData do
	begin
		//銀行名
		FieldByName('BankName').AsString := fnCopy(sBankName,1,20);
		//銀行名ｶﾅ
		FieldByName('BankKana').AsString :=MjsHanCopy(sBankKana,1,20);
		//この時点では行にｾｯﾄするのみ
		//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
	end;
end;

procedure TJNTCRP008003BaseF.GrBranchBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	iRtn		:	integer;
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;
	sBankName	:	string;
	sBankKana	:	string;
	sOfficeName	:	string;
	sOfficeKana	:	string;
begin
	//
	if Column <> 0 then
		exit;

	with GrBranch.DataSource.DataSet as TdxMemData do
	begin
		if (FieldByName('BranchName').AsString <> '')
		  or (FieldByName('BranchKana').AsString <> '') then
			exit;

		nBankCd		:= TTViewInfo(TView.Selected.Data^).iBankCode;
		nOfficeCD	:= FieldByName('BranchCode').AsInteger;
	end;

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_MASTERCHECK) ;					 //初期化です
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK) ;			 //初期化です<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。
	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			iRtn:=fnCMNBankShow(	nBankCD,
									nOfficeCD,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);

			//呼出失敗
			if(iRtn=-1)then
				Abort;

			//選択せず終了
			if(iRtn<>1)then
				Exit;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

	with GrBranch.DataSource.DataSet as TdxMemData do
	begin
		//支店名
		FieldByName('BranchName').AsString := fnCopy(sOfficeName,1,20);
		//支店名ｶﾅ
		FieldByName('BranchKana').AsString :=MjsHanCopy(sOfficeKana,1,15);
		//この時点では行にｾｯﾄするのみ
		//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
	end;

end;
//<DIC_BANK> <<


//↓<CDCHG>
//************************************************************************
//		Component	: BCodeChange
//		Event		: Click
//		Memo		: コード変更ボタン押下時
//************************************************************************
procedure TJNTCRP008003BaseF.BCodeChangeClick(Sender: TObject);
var
	DlgForm			:	TJNTCRP008003ChgDlgF;       // コード変更ダイアログ
	iBankCode		:	Integer;                    // 銀行コード起動時保持用
	iBranchCode		:	Integer;                    // 支店コード起動時保持用
    sBranchName	    :   String;                     // 支店名称起動時保存用 <SCA> ADD
	nParent			:	TTreeNode;                  // ツリービューコントロールの個々のノード
	ChgBfr			:	TComponent;                 // フォーカス復帰させるコンポーネント
	sMsg			:	String;                     // 銀行⇔支店 文言切替用
	sInfoMsg		:	String;						// 確認メッセージ作成用
    exNCode			:	Extended;                   // 操作する HAPBS,HAPBF レコード の 内部コード
	DMQuery			:	TMQuery;                    // クエリコンポーネント
begin
    exNCode := 0;
    DMQuery := Nil;

	// [銀行]タブからの起動
	if MTab.Items.Selected = 0 then
	begin
    	// メモデータが挿入モードは抜ける
		if MdBank.State = dsInsert then
			exit;

		ChgBfr		:= GrBank;
		sMsg		:= '銀行';
		iBankCode	:= MdBankBankCode.Value;
		iBranchCode	:= -1;
        exNCode		:= MdBankNCode.AsFloat;
	end
	// [支店]タブからの起動
	else
	begin
    	// アクティヴなコントロール＝グリッド
		if ACControl = GrBranch then
		begin
			ChgBfr	:= GrBranch;

	    	// メモデータが挿入モードは抜ける
			if MdBranch.State = dsInsert then
				exit;
		end
    	// アクティヴなコントロール≠グリッド
		else
			ChgBfr	:= TView;

		sMsg		:= '支店';
		iBankCode	:= MdBranchBankCode.Value;
		iBranchCode	:= MdBranchBranchCode.Value;
		sBranchName	:= String(MdBranchBranchName.Value);                    // <SCA> ADD

        // HAPBSの操作レコードのNCodeを取得
        try
	        DMQuery := TMQuery.Create(Self);
			m_pMDataModule.SetDBInfoToQuery(dbCorp,DMQuery);

            with DMQuery do
            begin
                Close;
                SQL.Clear;
                SQL.Add('select BS.NCode from HAPBS BS '
                    +	' inner join HAPBF BF on (BS.BankNCode = BF.NCode) '
                    +	' where BF.BankCode   = :pBankCode '
                    +	'   and BS.BranchName = :pBranchName '      // <SCA> ADD
                    +	'   and BS.BranchCode = :pBranchCode ');
                SetFld('pBankCode').AsInteger	:= iBankCode;
                SetFld('pBranchCode').AsInteger	:= iBranchCode;
                SetFld('pBranchName').AsString	:= sBranchName;     // <SCA> ADD

                Open(True);

                if not EOF then
                begin
                    exNCode := GetFld('NCode').AsFloat;
                end;
            end;
        finally
        	DMQuery.Close;
        	DMQuery.Free;
        end;
	end;

	DlgForm		:= TJNTCRP008003ChgDlgF.CreateDialog(Self,m_pRec,dbCorp,m_Base_pRec,m_cJNTArea);

	if DlgForm = Nil then
		abort;

	try
		DlgForm.iBankCode		:= iBankCode;
		DlgForm.iBranchCode		:= iBranchCode;
        DlgForm.exBfBankNCode	:= exNCode;
        DlgForm.m_bAllowSameBraCode := m_bAllowSameBraCode; // 同一振込先支店コード可区分 <SCA> ADD

		try
			if DlgForm.ShowModal <> mrOk then
				exit;

			// [銀行]タブからの起動
			if MTab.Items.Selected = 0 then
			begin
            	// 新規コード
				if DlgForm.bNewCode then
				begin
					MdBank.Edit;
					MdBankBankCode.Value	:= Trunc(DlgForm.ECode.Value);
					MdBankBankName.AsString	:= DlgForm.EName.Text;
					MdBankBankKana.AsString	:= DlgForm.EKana.Text;
					MdBank.Post;
				end
            	// 既存コード
				else
				begin
                	// 変更前の銀行を削除するとき
					if DlgForm.bDelCode then
                    begin
						MdBank.Delete;
                    end;
				end;
			end
			// [支店]タブからの起動
			else
			begin
// <SCA> ADD-STR
                // 同一新規コード
                if DlgForm.bInsertCode then
                begin
					TTViewInfo(TTreeNode(MdBranch.FieldByName('TVItemPtr').AsInteger).Data^).iBranchCode	:= Trunc(DlgForm.ECode.Value);

					MdBranch.Edit;
					MdBranchBranchCode.Value	:= Trunc(DlgForm.ECode.Value);
					MdBranch.Post;
                end
                else
// <SCA> ADD-END
            	// 新規コード
				if DlgForm.bNewCode then
				begin
					TTViewInfo(TTreeNode(MdBranch.FieldByName('TVItemPtr').AsInteger).Data^).iBranchCode	:= Trunc(DlgForm.ECode.Value);

					MdBranch.Edit;
					MdBranchBranchCode.Value	:= Trunc(DlgForm.ECode.Value);
					MdBranchBranchName.Text		:= DlgForm.EName.Text;
					MdBranchBranchKana.Text		:= DlgForm.EKana.Text;
					MdBranch.Post;
				end
            	// 既存コード
				else
				begin
                	// 変更前の銀行を削除するとき
                	if DlgForm.bDelCode then
                    begin
                        //画面ﾊﾟｰﾂ
                        nParent			:= TView.Items[0];//念のため\("銀行名")をｾｯﾄ
                        TView.OnChange	:= nil;
                        MdBranch.DisableControls;

                        try
                            //ﾂﾘｰﾋﾞｭｰから削除
                            if MdBranch.FieldByName('TVItemPtr').AsInteger > 0 then
                            begin
                                with TTreeNode(MdBranch.FieldByName('TVItemPtr').AsInteger) do
                                begin
                                    nParent:=Parent;
                                    Delete;
                                end;
                            end;

                            //MemDataから削除
                            MdBranch.Delete;
                        finally
                            MdBranch.EnableControls;

                            //ﾂﾘｰﾋﾞｭｰ
                            TView.OnChange		:= TViewChange;

                            if MdBranch.RecordCount = 0 then
                            begin
                                MdBranch.Close;
                                MdBranch.Open;

                                if nParent <> nil then
                                begin
                                    //xx銀行を再選択
                                    TView.Selected	:=nil;
                                    TView.Selected	:=nParent;
                                end;
                            end;
                        end;
                    end;
				end;
			end;


            // 確認メッセージを出力
            sInfoMsg :=  '振込先'+sMsg+'のコード変更は、正常に終了しました。';

            // Gali/GaliNX-Iのみ
            if not TMSeries.IsMjsLink3 then
            begin
                if m_bSaimu or m_bKeihi then
                begin
	                sInfoMsg := sInfoMsg + #13#10 + 'コードの変更により、手数料金額の判定が変わる可能性があります。';
				end;

                if m_bSaimu and not m_bKeihi then
                begin
                	// 債務○、経費精算×
                	sInfoMsg := sInfoMsg + #13#10 + '取引先登録の支払情報の手数料計算区分を確認してください。';
                end
                else if not m_bSaimu and m_bKeihi then
                begin
                	// 債務×、経費精算○
                	sInfoMsg := sInfoMsg + #13#10 + '経費精算情報の手数料計算区分を確認してください。';
                end
                else if m_bSaimu and m_bKeihi then
                begin
                	// 債務○、経費精算○
                	sInfoMsg := sInfoMsg + #13#10 + '取引先登録の支払情報、経費精算情報の手数料計算区分を確認してください。';
                end;
            end;

			MjsMessageBox(Self,sInfoMsg,mjInformation,mjDefOk);

		except
			MjsMessageBox(Self,sMsg+'のコード変更に失敗しました。',mjError,mjDefOk);
		end;
	finally
		DlgForm.Release;
		MjsSetFocus(Self,ChgBfr.Name);
	end;
end;
//↑<CDCHG>

// <SCA> ADD-STR
//*****************************************************************************
//	Process			:	債務共通INIファイルから設定値を取得する
//	Name			:	T.SATOH(GSOL)
//	Date			:	2014/08/20
//	Parameter		:	sSection 	: String
//						sKey 		: String
//	Return			:	設定値
//	History			:	YYYY/MM/DD
//*****************************************************************************
function TJNTCRP008003BaseF.GetPayCommonValue(sSection, sKey: String): String;
const
    APG_FILE = 'MAS\PRG\PayControl.APG';
var
	_pRec       : ^TMjsAppRecord;
	cComArea    : rcCOMMONAREA;
	sPath       : String;
	sFile       : String;
    oIniFile    : TIniFile;
begin
    Result := '';

	_pRec := pointer(m_pRec);
	cComArea := rcCOMMONAREA(_pRec^.m_pCommonArea^);

	sPath := cComArea.SysRoot;
    if not IsPathDelimiter(sPath, Length(sPath)) then sPath := sPath + '\';

    sFile := sPath + APG_FILE;

    if FileExists(sFile) then
    begin
        oIniFile := Nil;
        try
            oIniFile := TIniFile.Create(sFile);
            Result := oIniFile.ReadString(sSection, sKey, '');
        finally
            if Assigned(oIniFile) then oIniFile.Free;
        end;
    end;
end;
// <SCA> ADD-END

end.

