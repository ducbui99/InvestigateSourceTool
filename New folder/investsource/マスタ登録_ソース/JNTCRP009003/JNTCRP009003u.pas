//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目登録
//                    キャッシュ・フロー科目登録
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：高橋 功二(LEAD)
//      作成日      ：2005.01.25(TUE)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <!!!>   高橋 功二(LEAD) 2005.04.11(MON) 仕様確認後修正予定。
//  <001>   高橋 功二(LEAD) 2005.04.11(MON) FX-STYLE対応。
//  <002>   茂木 勇次(LEAD) 2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <003>   飯塚 健介(LEAD) 2005.08.04(THU) 決算確定・権限対応。
//  <004>   高橋 功二(LEAD) 2005.08.19(FRI) JNTCommon,TMjsAppRecordを親から引き継ぐように修正。
//  <   >   茂木 勇次(LEAD) 2005.09.08(THU) ｷｰの動作を修正。
//  <   >   茂木 勇次(LEAD) 2005.09.12(MON) 内部ｺｰﾄﾞ Int⇒Floatへ変更。
//  <PRN>   茂木 勇次(LEAD) 2005.09.12(MON) 印刷機能の追加。
//  <KEY>   茂木 勇次(LEAD) 2005.09.17(SAT) VK_ESC,VK_ENDｷｰで子BPLをCLOSEする場合、現状だと正常に
//                                          終了できない(ｱﾄﾞﾚｽ違反が発生)為、一時ｺﾒﾝﾄに。
//  <005>   茂木 勇次(LEAD) 2005.09.22(THU) 同一CF科目を2回以上削除すると、Index unique keyｴﾗｰとなる。
//                                          ⇒対処法として、削除ﾃﾞｰﾀ再利用にて対応。
//  <006>   茂木 勇次(LEAD) 2005.09.22(THU) 削除時にCFKmkTreeのﾚｺｰﾄﾞが削除されない不具合対応。
//  <007>   加藤 香織(PRIME)2005.10.14(FRI) 削除ﾒｯｾｰｼﾞ変更
//  <ESC>   加藤 香織(PRIME)2005.10.20(THU) 子のEscｷｰ動作対応のためにIFに第1ｺﾝﾎﾞ追加
//  <   >   加藤 香織(PRIME)2006.02.22(WED) 連想・正式名称・簡略名称のIME設定
//  <   >   加藤 香織(PRIME)2006.02.22(WED) ｺｰﾄﾞを最大8桁までに制限
//	<008>	渡邊 慎太郎(LAB)2007.07.02(MON) 決算確定の判定は権限に依存させる（子でメッセージを出さない）
//  <009>   大竹 文顕(LEAD) 2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//	<010>	関　 隆宏(PRIME)2008.04.03(THU)	ﾏｽﾀ更新履歴対応
//  <DKAI>  難波 江里子(LAB)2008.08.27(WED) 名称に改行が入らないようにする
//  <   >   小島 佑介(LEAD) 2008.11.14(FRI) 連想ｶﾗﾑの半角ｶﾅ英数字のみの入力
//  <011>   西岡 正博(PRIME)2009.01.28(WED) 新規科目追加後、子のアイテム情報に内部コードをセットする。
//  <012>   西岡 正博(PRIME)2009.01.28(WED) 直接法且つ営業活動の時、小計科目の下位に科目が追加できないようにする。
//	<013>   西岡 正博(PRIME)2009.01.30(FRI)	移動先と移動元が同じ場合、加算体系ﾃｰﾌﾞﾙ移動処理をしない。
//	<014>   西岡 正博(PRIME)2009.02.02(MON)	移動先と移動元が同じ場合、加算体系ﾃｰﾌﾞﾙ移動処理をしない。
//
//  ※ BeforePost時にTdxMemdataのNCodeに値が落ちていない。現状問題はないが今後対応する必要性があるかも
//     現状TdxMemdataの内部ｺｰﾄﾞは使用していないが･･･2005.09.22 mogi
//
//  <015>   黒田 祐生       2010.05.21(FRI) MLBplLoader対応(LoadPackageの置換)
//	<016>	黒田 祐生		2012.02.13(MON)	ShiftState対応
//
//=============================================================================
unit JNTCRP009003u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  ComCtrls, Buttons, VCL.ExtCtrls, Db, FireDAC.Comp.Client, VCL.ImgList, VCL.StdCtrls,
  dxTL, dxDBGrid, dxCntner, dxGrClms, dxmdaset,

  ppDB, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDBPipe,
  //ppDBBDE,
  MjsDispCtrl, MJSMsgStdu, ppModule, daDatMod,

  MJSComboBox, MJSLabel, MJSSpeedButton, MJSPanel, MJSStatusBar, MJSQuery,
  MJSDBModuleu, MJSTreeView,

  MJSCommonu, JNTMasComu, JNTCommonu{<003>}, JNTSelCorpSys, JNTExpGlobal{<PRN>},
  MLBplLoaderU{<015>}
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, FireDAC.Comp.DataSet, MJSStrctrl	// <016>ADD
  ;

// ++++++++++++++++++++
//  レコードの定義
// ++++++++++++++++++++
type
	TreeViewRec = record				    // ﾂﾘｰﾋﾞｭｰの情報
		iSumKbn         :   Integer;		// 実在/合計区分
		iNCode          :   Extended;		// ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ
		strCode         :   String;			// ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
		strName         :   String;			// ｷｬｯｼｭﾌﾛｰ科目名称
end;

type
	MasterData = record						// ｸﾞﾘｯﾄﾞで設定したﾏｽﾀﾃﾞｰﾀ
		iParentNCode    :   Extended;		// ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ(親ｺｰﾄﾞ:加算先)
		strParentCode   :   String;			// ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ(親ｺｰﾄﾞ:加算先)
        iNCode          :   Extended;       // ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ
		strCode         :   String;			// ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
		iClassCode      :   Integer;		// 科目分類
		strRenso        :   String;			// 連想
		strName         :   String;			// 正式名称
		strSimpleName   :   String;			// 簡略名称
		iSeikakuNo      :   Integer;		// 科目性格
		iSeizanNo       :   Integer;		// 正残区分
end;

type
{$include ActionInterface.inc} 			 	// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
{$include JNTSelPrtIF.inc}                  // <PRN>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP009003f = class(TForm)
    CmnSplitter: TSplitter;
    CmnInstructionBar: TMPanel;
    MLabel50: TMLabel;
    mainESyurui_: TMComboBox;
    CmnStatusBar: TMStatusBar;
    CmnTreeView: TMTreeView;
    PDodai: TMPanel;
    CmnGrid: TdxDBGrid;
    strGridRenso: TdxDBGridColumn;
    strGridName: TdxDBGridColumn;
    strGridSimpleName: TdxDBGridColumn;
    CmnTreeQuery: TMQuery;
    CmnDataSource: TDataSource;
    VImageList: TImageList;
    CmnMemDataGrid: TdxMemData;
    CmnMemDataGridstrCode: TStringField;
    CmnMemDataGridName: TStringField;
    CmnMemDataGridSimpleName: TStringField;
    CmnMemDataGridstrRenso: TStringField;
    CmnMemDataGridstrSeikaku: TStringField;
    CmnMemDataGridstrSeizan: TStringField;
    CmnMemDataClass1: TdxMemData;
    CmnMemDataClass1Description: TStringField;
    CmnMemDataClass2: TdxMemData;
    StringField1: TStringField;
    strGridCode: TdxDBGridMaskColumn;
    nGridSeikakuNo: TdxDBGridLookupColumn;
    strGridSeikaku: TdxDBGridMaskColumn;
    nGridSeizanNo: TdxDBGridLookupColumn;
    strGridSeizan: TdxDBGridMaskColumn;
    CmnMemDataGridiKoteiKbn: TIntegerField;
    DMemPrint: TdxMemData;
    DMemPrintKmkCode: TIntegerField;
    DMemPrintSimpleName: TStringField;
    DMemPrintOutPutName: TStringField;
    DMemPrintLongName: TStringField;
    DMemPrintDCKbnName: TStringField;
    DMemPrintCharCode: TIntegerField;
    DMemPrintDCKbn: TIntegerField;
    CmnMemDataClass2nDivision: TIntegerField;
    CmnMemDataClass1nDivision: TIntegerField;
    CmnMemDataGridnAdoptData01: TIntegerField;
    CmnMemDataGridnAdoptData02: TIntegerField;
    CmnMemDataGridnSeikakuNo: TIntegerField;
    CmnMemDataGridnSeizanNo: TIntegerField;
    CmnMemDataGridiNCode: TFloatField;
    SPMsHist: TFDStoredProc;

	procedure   CMChildkey                  (var Msg: TWMKey); message CM_CHILDKEY;
    procedure   FormCreate                  (Sender: TObject);
    procedure   FormClose                   (Sender: TObject; var Action: TCloseAction);
    procedure   FormCloseQuery              (Sender: TObject; var CanClose: Boolean);
    procedure   FormShow                    (Sender: TObject);
    procedure   FormHide                    (Sender: TObject);
    procedure   FormActivate                (Sender: TObject);
    procedure   FormDestroy                 (Sender: TObject);
    procedure   mainESyurui_Change          (Sender: TObject);
    procedure   mainESyurui_Enter           (Sender: TObject);
    procedure   mainESyurui_KeyDown         (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   CmnTreeViewChange           (Sender: TObject; Node: TTreeNode);
    procedure   CmnTreeViewEnter            (Sender: TObject);
    procedure   CmnTreeViewDragOver         (Sender, Source: TObject; X, Y: Integer;
                                                State: TDragState; var Accept: Boolean);
    procedure   CmnTreeViewDragDrop         (Sender, Source: TObject; X, Y: Integer);
    procedure   CmnGridEnter                (Sender: TObject);
    procedure   CmnGridExit                 (Sender: TObject);
    procedure   CmnGridBeforeChangeColumn   (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure   CmnGridChangeNodeEx         (Sender: TObject);
    procedure   CmnGridKeyPress             (Sender: TObject; var Key: Char);
    procedure   CmnMemDataGridBeforePost    (DataSet: TDataSet);
    procedure   CmnDataSourceStateChange    (Sender: TObject);
    procedure   CmnToolbarButtonDelete_Click(Sender: TObject);
    procedure   CmnToolbarButtonPrint_Click (Sender: TObject);

  private
    m_pRec                  :   ^TMjsAppRecord;		// BPL管理構造体ﾎﾟｲﾝﾀ
    m_Base_pRec		        :   ^TMjsAppRecord;     // BPL管理構造体ﾎﾟｲﾝﾀ(親ﾎﾟｲﾝﾀの継承)<004>
    m_DataModule            :   TMDataModulef;		// 共通DBﾓｼﾞｭｰﾙｵﾌﾞｼﾞｪｸﾄ
    m_ComArea               :   TJNTMASCom;			// ｼｽﾃﾑ共通ﾒﾓﾘ
    m_cJNTArea              :   TJNTCommon;         // 共通ﾏｽﾀﾒﾓﾘ<003>
	m_MjsMsgRec             :   TMJSMsgRec;			// ﾒｯｾｰｼﾞ共通ｴﾘｱ
	m_ACControl             :   TWinControl;		// ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
    m_DBSelect              :   TFDConnection;          // ﾃﾞｰﾀﾍﾞｰｽﾓｼﾞｭｰﾙ
    m_bClose                :   Boolean;			// TRUE:ﾌｫｰﾑをｸﾛｰｽﾞ中
	m_bCutSw                :   Boolean;			// TRUE:ﾌｫｰﾑを切出/埋込中
    m_iCfKbn                :   Integer;			// C/F区分
	m_iGnPuKbn5             :   Integer;			// 利息の扱い区分
	m_iGnPuKbn11            :   Integer;			// 自己株式区分
	m_iGnPuKbn12            :   Integer;			// 社債区分
	m_iGnPuKbn13            :   Integer;			// ﾌｧｲﾅﾝｽ区分
    m_iCurrentJob           :   Integer;            // 処理区分
    m_strCurrentCFCode      :   String;				// 処理中活動のﾄｯﾌﾟﾚﾍﾞﾙｺｰﾄﾞ(CFｺｰﾄﾞ)
    m_strCFSyoukeiCode      :   String;				// 処理中活動の小計ｺｰﾄﾞ(CFｺｰﾄﾞ)
    m_iNodeCFNCode          :   Extended;			// ﾂﾘｰﾋﾞｭｰで選択しているﾉｰﾄﾞの内部ｺｰﾄﾞ(CFｺｰﾄﾞ)
    m_strNodeCFCode         :   String;				// ﾂﾘｰﾋﾞｭｰで選択しているﾉｰﾄﾞのｺｰﾄﾞ(CFｺｰﾄﾞ)
	m_iGridExistRecords     :   Integer; 			// ｸﾞﾘｯﾄﾞに表示中の行数
	m_MasterData            :   MasterData;			// ｸﾞﾘｯﾄﾞで設定したﾏｽﾀﾃﾞｰﾀ
	m_bDBStopUpdate         :   Boolean;			// TRUE: ﾃﾞｰﾀﾍﾞｰｽの更新を行わない FALSE: 行う
	m_TopItem               :   TTreeNode;			// ﾂﾘｰ上に表示する一番上のﾉｰﾄﾞ
	m_iClientwidth 	        :   Integer;		    // ﾌｫｰﾑ上のｸﾗｲｱﾝﾄ領域の幅
	m_iClientHeight         :   Integer;      		// ﾌｫｰﾑ上のｸﾗｲｱﾝﾄ領域の高
    m_iCorpKbn		        :   Integer;			// 法人区分

    // ----- <BPL> -------------------------------------------------------------
    m_CmpList	            :   TList;
    CmnToolbarButtonPrint   :   TSpeedButton;       // 印刷
    CmnToolbarButtonDelete  :   TSpeedButton;       // 削除
    mainESyurui             :   TMComboBox;
    //--------------------------------------------------------------------------

    AOwner                  :   TComponent;         // <002>
    // --<003>権限St
    giReferFlag             :   Integer;
    m_IsUpdate              :   Boolean;
    // --<003>権限Ed

    uvSelSys                :   TJNTSelCorpSys; 	                // <PRN> 会社ｼｽﾃﾑ情報
    uvHani                  :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry           :	TPrintAppEntry;                     // <PRN>
    ArrHdl                  :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        :	rcPrtParam;                         // <PRN>
    DmqPrint                :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ

    function    GetNewNCode                 (): Extended;
    function    GetNCode                    (GCode: String; nCfKbn: Integer): Extended;
	procedure	SessionPractice				(iSyori: Integer);		// <010> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
    function    fnDelCRLF                   (sData: String): String;// <DKAI> 改行削除

  public
    constructor fnCreateForm                (pRec : Pointer);
	function    GetComInfo                  (): Boolean;
    procedure   LoadEigyou                  ();
    procedure   LoadTousi                   ();
    procedure   LoadZaimu                   ();
    procedure   LoadGenkin                  ();
	procedure   BuildTreeViewItems          (iKind: Integer);
	procedure   CreateTreeViewItems         (iKind: Integer; cSrcNode: TTreeNode);
	procedure   SetGdidDatas                (iKind: Integer; cNode: TTreeNode);
	function    CheckMasterTreeInsertValid  (strCodeSrc: string; strCodeDst: string): Boolean;
	procedure   MoveTreeRecord              (iNCodeSrc,iNCodeSrcParent: Extended;
							                 iNCodeDst,iNCodeDstParent: Extended; iSumKbn: Integer);
	function    GetTreeEntryNo              (dqMasterTree: TMQuery; iNCode, iNCodeParent: Extended): Integer;
	procedure   RewriteTreeRecords          (iNCodeParent: Extended);
	function    GetTreeEntryNoFinal         (dqMasterTree: TMQuery; iDstNCode: Extended): Integer;
	function    CheckMasterDataInsertValid  (strCode: String; iRecKbn: Integer): Boolean;
	procedure   SetDeleteButtonCondition    (strCode: String);
	procedure   UpdateDatabase              (Master: MasterData);
	function    UpdateTreeRecord            (Master: MasterData): Boolean;
// <005>	function    UpdateMasterRecord          (Master: MasterData): Boolean;
    function    UpdateMasterRecord          (Master: MasterData; nUpdateMode: Integer): Boolean;   // <005>
	procedure   UpdateTreeViewItems         (iSumKbn: Integer; strCode: String; strSimpleName: String; iAccessKind: Integer);
	procedure   DeleteDatabase              (iSumKbn: Integer; iNCode: Extended; strCode: String);
// <006>	function    DeleteTreeRecord            (iNCode: Extended): Boolean;
    function    DeleteTreeRecord            (strCode: String): Boolean; // <006>
	function    DeleteMasterRecord          (strCode: String): Boolean;
	procedure   PrnSet                      ();
	function    fnMakeSQL                   (TAN_CD: Integer; TAN_NAME: String; FLAG: Boolean ):String;
	procedure   fnErrorMessageDsp           (DmQuery: TMQuery);
	procedure   ErrMsg                      (strErrMsg: string);
    function    GetCorpKbn                  (): Boolean;
    procedure   fnGetGrants                 (); // <003>

  end;

{MJS共通仕様のpublic区を宣言}
function AppEntry(pPar: Pointer) : Integer;
exports
	AppEntry;

implementation

// -----------------------
//      定数定義
// -----------------------
const
	E_MSG_O_CMNDB		   	= '共通データベースのオープンに失敗しました。';
	E_MSG_O_CORPDB			= '会社データベースのオープンに失敗しました。';
	E_MSG_R_KBNINFO		   	= '区分情報の取得に失敗しました。';
	E_MSG_R_KMKMA			= '科目基本マスタの取得に失敗しました。';
	E_MSG_W_KMKMA		   	= '科目基本マスタの書込みに失敗しました。';
	E_MSG_D_KMKMA		   	= '科目基本マスタの削除に失敗しました。';
	E_MSG_I_KMKMA		   	= '科目基本マスタの追加に失敗しました。';
	E_MSG_U_KMKMA		   	= '科目基本マスタの更新に失敗しました。';
	E_MSG_R_KMKTREE			= '科目加算体系マスタの取得に失敗しました。';
	E_MSG_W_KMKTREE		   	= '科目加算体系マスタの書込みに失敗しました。';
	E_MSG_D_KMKTREE		   	= '科目加算体系マスタの削除に失敗しました。';
	E_MSG_I_KMKTREE		   	= '科目加算体系マスタの追加に失敗しました。';
	E_MSG_U_KMKTREE		   	= '科目加算体系マスタの更新に失敗しました。';

	SELECT_KANSETU			= 0;			// 間接法ｲﾝﾃﾞｯｸｽ
    SELECT_CHOKUSETU		= 1;			// 直接法ｲﾝﾃﾞｯｸｽ

	CFCODE_EIGYOU			= '0000003990';	// 営業活動のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	CFCODE_TOUSI			= '0000004990';	// 投資活動のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	CFCODE_ZAIMU			= '0000005990';	// 財務活動のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	CFCODE_GENKIN			= '0000006990';	// 現金及び現金同等物のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	CFCODE_SYOUKEI_KANSETU	= '0000001990';	// 営業活動の小計のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ(間接法)
	CFCODE_SYOUKEI_CHOKUSETU= '0000002990';	// 営業活動の小計のｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ(直接法)

	CFCODE_3000				= '0000003000';	// 利息及び配当金の受取額
	CFCODE_3010				= '0000003010';	// 利息の支払額
	CFCODE_4000				= '0000004000';	// 利息及び配当金の受取額
	CFCODE_5800				= '0000005800';	// 配当金の支払額
	CFCODE_5801				= '0000005801';	// 利息及び配当金の支払額

	RISOKU_PATTERN1			= 0;
	RISOKU_PATTERN2			= 1;

	SPKBN_NORMAL			= 0;			// 通常科目
	SPKBN_KABUSIKI			= 2;			// 自己株式・子会社株式
	SPKBN_SYASAI			= 3;			// 社債
	SPKBN_SAIMU				= 4;			// ﾘｰｽ債権・割賦債務による固定資産

	SELECT_EIGYOU			= 0;			// 営業活動ｲﾝﾃﾞｯｸｽ
    SELECT_TOUSI			= 1;			// 投資活動ｲﾝﾃﾞｯｸｽ
    SELECT_ZAIMU			= 2;			// 財務活動ｲﾝﾃﾞｯｸｽ
    SELECT_GENKIN			= 3;			// 現金及び現金同等物ｲﾝﾃﾞｯｸｽ

	KAMOKU_JITUZAI 			= 0;			// 実在科目
	KAMOKU_GOUKEI 			= 1;			// 合計科目

	CHARCODE_RYUNYU			= 1;			// 流入
	CHARCODE_RYUSYUTU		= 2;			// 流出
	CHARCODE_BSZANDAKA		= 3;			// 残高
	CHARCODE_KANSANSAGAKU	= 11;			// 換算差額
	CHARCODE_ZOUGENGAKU		= 12;			// 増減額
	CHARCODE_KISYUZANDAKA	= 13;			// 期首残高
	CHARCODE_KIMATUZANDAKA	= 14;			// 期末残高

	DCKBN_KARIKATA			= 0;			// 正残区分(借方)
	DCKBN_KASIKATA			= 1;			// 正残区分(貸方)

	SEIKAKU_RYUNYU			= 'キャッシュ流入';
	SEIKAKU_RYUSYUTU		= 'キャッシュ流出';
	SEIKAKU_BSZANDAKA		= 'ＢＳ残高';

	SEIKAKU_KANSANSAGAKU	= '換算差額';
	SEIKAKU_ZOUGENGAKU		= '増減額';
	SEIKAKU_KISYUZANDAKA	= '期首残高';
	SEIKAKU_KIMATUZANDAKA	= '期末残高';

	SEIZAN_KARIKATA			= '借方';
	SEIZAN_KASIKATA			= '貸方';

	CHARCODE_EIGYOU			= 1;			// 科目分類(営業活動)
    CHARCODE_TOUSI			= 2;			// 科目分類(投資活動)
    CHARCODE_ZAIMU			= 3;			// 科目分類(財務活動)
    CHARCODE_GENKIN			= 4;			// 科目分類(現金及び現金同等物)

	INDEX_CODE				= 0;			// ｺｰﾄﾞ(ｸﾞﾘｯﾄﾞのｲﾝﾃﾞｯｸｽ)
	INDEX_RENSO				= 1;			// 連想
	INDEX_LONGNAME			= 2;			// ｷｬｯｼｭﾌﾛｰ科目名称
	INDEX_SIMPLENAME		= 3;			// 簡略名称
	INDEX_SEIKAKUNO			= 4;			// 科目性格No.
	INDEX_SEIKAKU			= 5;			// 科目性格名称
	INDEX_SEIZANNO			= 6;			// 正残区分No.
	INDEX_SEIZAN			= 7;			// 正残区分名称

	KOTEIKBN_NINI			= 0;			// 固定区分(任意)
	KOTEIKBN_KOTEI			= 1;			// 固定区分(固定)

	RECKBN_NORMAL			= 0;			// ﾚｺｰﾄﾞ区分(正規ﾚｺｰﾄﾞ)
	RECKBN_DELETE			= 1;			// ﾚｺｰﾄﾞ区分(削除ﾚｺｰﾄﾞ)
	RECKBN_TEMP				= 2;			// ﾚｺｰﾄﾞ区分(一時ﾚｺｰﾄﾞ)

	MODE_INSERT				= 1;			// ﾃﾞｰﾀﾍﾞｰｽ追加/更新ﾓｰﾄﾞ(挿入)
	MODE_UPDATE				= 2;			// ﾃﾞｰﾀﾍﾞｰｽ追加/更新ﾓｰﾄﾞ(更新)
    MODE_REUSED             = 3;            // ﾃﾞｰﾀﾍﾞｰｽ追加/更新ﾓｰﾄﾞ(再利用)<005>

	ACCESS_TREE_ADD         = 1;			// ﾂﾘｰﾋﾞｭｰ登録ﾓｰﾄﾞ(追加)
	ACCESS_TREE_INSERT      = 2;			// ﾂﾘｰﾋﾞｭｰ登録ﾓｰﾄﾞ(挿入)
	ACCESS_TREE_UPDATE      = 3;			// ﾂﾘｰﾋﾞｭｰ登録ﾓｰﾄﾞ(更新)
	ACCESS_TREE_DELETE      = 4;			// ﾂﾘｰﾋﾞｭｰ登録ﾓｰﾄﾞ(削除)

    MEDICALCORP		    	= 2;			// 医療法人

	// 参照ﾌﾗｸﾞ時に使用
	NORMAL			        = 1;    		//	通常処理
	REFER	        		= 3;	    	//	参照

	// -----<010> Add-St-----
	C_ST_PROCESS			= 0;			// 設定
	C_ED_PROCESS			= 1;			// 開放
	// -----<010> Add-Ed-----

{$Include JNTConst.inc}                     // <007>    
{$R *.DFM}

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pPar :Pointer): Integer;
var
	pForm  : ^TJNTCRP009003f;
	pRecord: ^TMjsAppRecord;

begin
	Result	:= ACTID_RET_OK;
	pRecord	:= Pointer(TAppParam(pPar^).pRecord);

	case (TAppParam(pPar^).iAction) of
        // ----------------------
        //	Form Create要求
        // ----------------------
		ACTID_FORMCREATESTART       :
        begin
            New(pForm);

            try
				pForm^ := TJNTCRP009003f.fnCreateForm(pPar);
                pRecord^.m_pChildForm	:= pForm;
			except
				Dispose(pForm);
				Result	:= ACTID_RET_NG;
			end;
        end;
        // ----------------------
        //	Form Create&Show要求
        // ----------------------
		ACTID_FORMCREATESHOWSTART   :
		begin
			New(pForm);

			try
				pForm^	:= TJNTCRP009003f.fnCreateForm(pRecord);
				pForm^.Show;
				pRecord^.m_pChildForm	:= pForm;
			except
				Dispose(pForm);
				Result	:= ACTID_RET_NG;
			end;
		end;
        // ----------------------
        //	Form Close要求
        // ----------------------
		ACTID_FORMCLOSESTART        :
		begin
			pForm	:= Pointer(pRecord^.m_pChildForm);
			pForm^.Close;
			pForm^.Free;
			Dispose(pForm);
		end;
        // ----------------------
        //	Form CanClose要求
        // ----------------------
		ACTID_FORMCANCLOSESTART     :
		begin
			pForm	:= Pointer(pRecord^.m_pChildForm);

			if ( pForm^.CloseQuery() = FALSE ) then
				Result	:= ACTID_RET_NG;
		end;
        // ----------------------
        //	Show要求
        // ----------------------
		ACTID_SHOWSTART             :
		begin
			pForm	:= Pointer(pRecord^.m_pChildForm);
			pForm^.Show;
		end;
        // ----------------------
        // Hide要求
        // ----------------------
		ACTID_HIDESTART             :
		begin
			pForm	:= Pointer(pRecord^.m_pChildForm);

			if ( pForm^.Parent <> nil ) then
	        	pForm^.Hide;
	    end;
	end;

end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TJNTCRP009003f.fnCreateForm(pRec: Pointer);
begin

	m_bClose    :=  FALSE;						// TRUE:ﾌｫｰﾑをｸﾛｰｽﾞ中
	m_bCutSw    :=  FALSE;						// TRUE:ﾌｫｰﾑを切出/埋込中

	m_pRec		    :=  Pointer( TAppParam( pRec^ ).pRecord );
    m_DataModule    :=  TMDataModulef(m_pRec^.m_pDBModule^);
    m_ComArea       :=  TJNTMASCom(m_pRec^.m_pSystemArea^);

    // JNTCommonの構築
//    m_cJNTArea      := TJNTCommon.Create(Self);                         // <003><004>
//    m_cJNTArea.Init(m_pRec);                                            // <003><004>


    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList   := TList(TAppParam( pRec^ ).pActionParam^);

    // 選択されている会社ｺｰﾄﾞの該当ﾃﾞｰﾀﾍﾞｰｽをｵｰﾌﾟﾝ
    m_DBSelect := m_DataModule.COPDBOpen(0, m_ComArea.m_iCopNo);
    if ( m_DBSelect = nil ) then
    begin
        ErrMsg(E_MSG_O_CORPDB);
        raise EMathError.Create(E_MSG_O_CORPDB);
    end;

//	ｽﾄｱﾄﾞの初期処理	************************************************************
(* <001> <!!!>
	bFlag :=	FALSE;
	iTanCD :=	0;							// 担当者ｺｰﾄﾞ
	sTanName :=	'';							// 担当者名
											// 共通ﾒﾓﾘﾎﾟｲﾝﾀの担当者内部ｺｰﾄﾞ
	if	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD <> -1 then
	begin
											// CTLDBOpen
		CTRL_DB	:=	m_DataModule.CTLDBOpen(0);
		if	CTRL_DB = nil then
		begin
	        ErrMsg(E_MSG_O_CMNDB);
			raise EMathError.Create(E_MSG_O_CMNDB);
		end;

		DmqCtrlDb := TMQuery.Create(Self);
		m_DataModule.SetDBInfoToQuery(CTRL_DB, DmqCtrlDb);

		DmqCtrlDb.Close;
		DmqCtrlDb.SQL.Clear;
		DmqCtrlDb.SQL.Add('SELECT Name, TantoGCD FROM MOS_OFFICE_STAFF ');
		DmqCtrlDb.SQL.Add('WHERE TantoNCD = :NCode');
		DmqCtrlDb.ParamByName('NCode').AsInteger := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
		DmqCtrlDb.Open;
											//	ｴﾗｰの判定
		if DmqCtrlDb.Status <> 0 then
		begin
			fnErrorMessageDsp(DmqCtrlDb);
			DmqCtrlDb.Close;
			DmqCtrlDb.Free;
            Exit;
		end;

		if	not DmqCtrlDb.Eof then
		begin
			iTanCD := DmqCtrlDb.GetFLD('TantoGCD').AsInteger;
			sTanName := DmqCtrlDb.GetFLD('Name').AsString;
		end;
		bFlag	:=	TRUE;

		DmqCtrlDb.Close;
		DmqCtrlDb.Free;

		m_DataModule.CTLDBClose(CTRL_DB);
	end;

	DmqData := TMQuery.Create(Self);
	m_DataModule.SetDBInfoToQuery(m_DBSelect, DmqData);

	DmqData.Close;
	DmqData.SQL.Clear;
	DmqData.SQL.Add(fnMakeSQL(iTanCD, sTanName, bFlag));
	DmqData.ExecSQL;

	if	DmqData.Status <> 0 then
	begin
		sMessage := IntToStr(m_ComArea.m_MsgStd.GetDBCode(DmqData));
		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
	end;

	DmqData.Close;
	DmqData.Free;
*)

    // 会社情報の取得
	if	not GetComInfo then
    begin
        ErrMsg(E_MSG_R_KBNINFO);
        raise EMathError.Create(E_MSG_R_KBNINFO);
    end;

	if	not GetCorpKbn then
    begin
        ErrMsg(E_MSG_R_KBNINFO);
        raise EMathError.Create(E_MSG_R_KBNINFO);
    end;

// ↓↓↓<PRN>

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if ( uvSelSys = nil ) then
            Abort;

    	if ( uvSelSys.CreateSysMsg(m_pRec) <> 0 ) then
            Abort;
    except
		MjsMessageBox(AOwner,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if ( uvSelSys.CreateSysInfo(m_DBSelect) <> 0 ) then
            Abort;
    except
        uvSelSys.MsgDlg(1001,20);
        raise;
    end;
// ↑↑↑<PRN>



    AOwner  :=  TForm(m_pRec.m_pOwnerForm^);    // <002>
    inherited Create( AOwner );                 // <002>

// <002>	inherited Create(TForm(m_pRec.m_pOwnerForm^));

end;

//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ <BPL>
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CMChildkey(var Msg: TWMKey);
var
    sShift              : 	TShiftState;
    lvCompoName         : 	String;
begin

    // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    lvCompoName := '';
    if ( Screen.ActiveControl <> nil ) then
            lvCompoName := TComponent(Screen.ActiveControl).Name
    else    Exit;

    // ｼﾌﾄｷｰの状態を取得する
	sShift	:=  MJSKeyDataToShiftState (Msg.KeyData);	// <016>MOD

// +++++++++++++++++++++++++
//  指示コンボボックス
// +++++++++++++++++++++++++
    if ( lvCompoName = 'mainESyurui' ) then
	begin
(*
        // Escape/Endｷｰの補足
		if ( Msg.CharCode = VK_ESCAPE ) or ( Msg.CharCode = VK_END ) then
		begin
            // ﾌｫｰﾑを閉じる
			Close();
			Abort;
		end;
*) //<KEY>

        // Shift&Tab/Leftｷｰの補足
		if (( Msg.CharCode = VK_TAB  ) and ( sShift = [ssShift] )) or
           (( Msg.CharCode = VK_LEFT ) and ( sShift = []        )) then Abort;

        // Return/Tab/Rightｷｰの補足
		if	( Msg.CharCode = VK_RETURN ) or
           (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
           (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then
		begin
            // ﾂﾘｰﾋﾞｭｰにﾌｫｰｶｽをｾｯﾄする
			m_ACControl :=  CmnTreeView;
			m_ACControl.SetFocus;
			Abort;
		end;
	end;

// +++++++++++++++++++++++++
//  ツリービュー
// +++++++++++++++++++++++++
    if ( lvCompoName = 'CmnTreeView' ) then
	begin
        // Return/Tabｷｰの補足
		if  ( Msg.CharCode = VK_RETURN ) or
           (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) then
		begin
            // ｸﾞﾘｯﾄﾞにﾌｫｰｶｽをｾｯﾄする
			m_ACControl :=  CmnGrid;
			m_ACControl.SetFocus;
			Abort;
		end;
	end;

// +++++++++++++++++++++++++
//  グリッド
// +++++++++++++++++++++++++
    if ( lvCompoName = 'CmnGrid' ) then
	begin
        // Insertｷｰ押下(無効)
		if ( Msg.CharCode = VK_INSERT ) then Abort;

        // Ctrl&Homeｷｰの補足
		if ( Msg.CharCode = VK_HOME ) and ( sShift <> [ssCtrl] ) then
		begin
			if ( CmnGrid.EditingText = '' ) then
			begin
                // 先頭ｶﾗﾑへﾌｫｰｶｽを移動
				CmnGrid.FocusedColumn   :=  INDEX_CODE;
				Abort;
			end;
		end;
        // Ctrl&Endｷｰの補足
		if ( Msg.CharCode = VK_END ) and ( sShift <> [ssCtrl] ) then
		begin
	 		if ( CmnGrid.EditingText = '' ) then
			begin
                // 先頭ｶﾗﾑﾌｫｰｶｽ時
				if ( CmnGrid.FocusedColumn = INDEX_CODE ) then
				begin
                    // 指示ｺﾝﾎﾞへﾌｫｰｶｽを移動
					m_ACControl :=  mainESyurui;
					m_ACControl.SetFocus;
                    mainESyurui.DroppedDown :=  TRUE;
					Abort;
				end
				else
				begin
                    // 最終ｶﾗﾑへﾌｫｰｶｽを移動
					CmnGrid.FocusedColumn   :=  INDEX_SEIKAKUNO;
					Abort;
				end;
			end;
		end;
        // Escapeｷｰの補足
		if ( Msg.CharCode = VK_ESCAPE ) then
		begin
            // ﾃﾞｰﾀ変更中かﾃﾞｰﾀ入力中の時
			if ( CmnMemDataGrid.State in [dsEdit, dsInsert] ) or
               ( CmnGrid.EditingText <> '' ) then Exit;

            // 指示ｺﾝﾎﾞへﾌｫｰｶｽを移動
			m_ACControl :=  mainESyurui;
			m_ACControl.SetFocus;
            mainESyurui.DroppedDown :=  TRUE;
			Abort;
		end;
        // Shift&Tabｷｰの補足
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		begin
			if ( CmnGrid.FocusedColumn = 1 ) then
			begin
                // ﾂﾘｰﾋﾞｭｰにﾌｫｰｶｽをｾｯﾄする
				m_ACControl	:= CmnTreeView;
				m_ACControl.SetFocus;
				Abort;
			end;
		end;
	end;

	inherited;

end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormCreate(Sender: TObject);
var
    iRet            :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
    iLoop           :   Integer;        // <PRN>
begin
	// -----<010> Add-St-----
	SPMsHist.Connection	:= m_DBSelect;
	//SPMsHist.SessionName	:= m_DBSelect.SessionName;
	// -----<010> Add-Ed-----

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    CmnToolbarButtonPrint  := TSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    CmnToolbarButtonDelete := TSpeedButton( m_CmpList.Items[2]^ );     // 削除
// <ESC>↓
//    mainESyurui            := TMComboBox  ( m_CmpList.Items[6]^ );
//    m_cJNTArea             := TJNTCommon  ( m_CmpList.Items[7]^ );     // <004>
//    m_Base_pRec            := Pointer     ( m_CmpList.Items[8]^ );     // <004>
    mainESyurui            := TMComboBox  ( m_CmpList.Items[7]^ );     // 第2ｺﾝﾎﾞ
    m_cJNTArea             := TJNTCommon  ( m_CmpList.Items[8]^ );     // <004>
    m_Base_pRec            := Pointer     ( m_CmpList.Items[9]^ );     // <004>
// <ESC>↑
    // ｲﾍﾞﾝﾄの継承
    CmnToolbarButtonPrint.OnClick  := CmnToolbarButtonPrint_Click;
    CmnToolbarButtonDelete.OnClick := CmnToolbarButtonDelete_Click;
    mainESyurui.OnChange           := mainESyurui_Change;
    mainESyurui.OnEnter            := mainESyurui_Enter;
    mainESyurui.OnKeyDown          := mainESyurui_KeyDown;
    //--------------------------------------------------------------------------

    // 親ｳｲﾝﾄﾞｳを設定
	Parent := TPanel(m_pRec^.m_pOwnerPanel^);
    // ｸﾗｲｱﾝﾄ領域にﾌｫｰﾑを組込む
	Align := alClient;

    // <PRN>ArrHdlの初期化。
    for iLoop := 0 to 100 do
        ArrHdl[iLoop] := nil;

    m_DataModule.SetDBInfoToQuery(m_DBSelect, CmnTreeQuery);


	if ( m_iCorpKbn = MEDICALCORP ) then
		    mainESyurui.Items.Add('業務活動')
	else    mainESyurui.Items.Add('営業活動');

    mainESyurui.Items.Add('投資活動');
    mainESyurui.Items.Add('財務活動');
    mainESyurui.Items.Add('現金及び現金同等物');


	mainESyurui.ItemIndex   :=  SELECT_EIGYOU;	    // 営業活動をｺﾝﾎﾞﾎﾞｯｸｽのﾃﾞﾌｫﾙﾄに設定
	m_ACControl             :=  mainESyurui;		// ｺﾝﾎﾞﾎﾞｯｸｽをｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙに設定
	m_bDBStopUpdate         :=  FALSE;				// TRUE: ﾃﾞｰﾀﾍﾞｰｽを更新しない
    m_iCurrentJob           :=  SELECT_EIGYOU; 		// 処理区分ｲﾝﾃﾞｯｸｽを設定

	m_MasterData.iClassCode :=  CHARCODE_EIGYOU;    // 科目分類
	m_strCurrentCFCode      :=  CFCODE_EIGYOU;	    // ﾄｯﾌﾟﾚﾍﾞﾙｺｰﾄﾞを設定

    // 小計ｺｰﾄﾞを設定
	if ( m_iCfKbn = SELECT_KANSETU ) then
	        m_strCFSyoukeiCode  :=  CFCODE_SYOUKEI_KANSETU
	else    m_strCFSyoukeiCode  :=  CFCODE_SYOUKEI_CHOKUSETU;

    // 営業活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ
    LoadEigyou();

	m_ACControl     :=  mainESyurui;				// ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙをｾｯﾄ
	m_iClientwidth 	:=  Self.Clientwidth;           // ﾌｫｰﾑ上のｸﾗｲｱﾝﾄ領域の幅
	m_iClientHeight :=  Self.ClientHeight;	        // ﾌｫｰﾑ上のｸﾗｲｱﾝﾄ領域の高

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MJSColorChange(TJNTCRP009003f(Self),
                   m_ComArea.SystemArea.SysColorB,
                   m_ComArea.SystemArea.SysColorD,
				   m_ComArea.SystemArea.SysBaseColorB,
                   m_ComArea.SystemArea.SysBaseColorD,
				   rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor);

    MJSFontResize(TJNTCRP009003f(Self), Pointer(m_pRec));

// ↓↓↓<PRN>

    // MQueryの構築<PRN>
    DmqPrint      :=  TMQuery.Create (self);
    // DBとMQueryの接続<PRN>
    m_DataModule.SetDBInfoToQuery( m_DBSelect, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 <PRN>}

	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009003L.BPL');           // <015>DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009003L.BPL');     // <015>ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
	 // MjsMessageBox(Self, 'JNTCRP009003LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        // <015>DEL
        MjsMessageBox(Self, 'JNTCRP009003LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  // <015>ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     // UnloadPackage( lvHandle );  // <015>DEL
        UnloadPackageHelper( lvHandle );  // <015>ADD
    end;

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
            Para		    :=  uvHani;
			TargetQry	    :=  nil;
            TargetMD        :=  nil;
			CorpSys		    :=  uvSelSys;
            JNTArea         :=  m_cJNTArea;
            // *** 汎用変数 *** //
            TargetParam	    :=  nil;
	    	TargetStr	    :=  '';
    		TargetInt	    :=  0;
            // *** 汎用変数 *** //
            iAPP_HDL_REC    :=  100;
		end;

		iRet := PrintAppEntry(AOwner,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit2(AOwner,
                 m_Base_pRec,
                 m_DataModule,
                 m_ComArea,
                 m_DBSelect,
                 uvHani,
                 uvSelSys);

// ↑↑↑<PRN>

    // 決算確定・権限取得<003>
    fnGetGrants();

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< ﾌｫｰﾑ終了前処理 >
//      PARAM   : Sender    : 	TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose  :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	strCode :   String;
label ExitProc;

begin

    // ﾌﾟﾚﾋﾞｭｰの状態をﾁｪｯｸする
    if ( uvHani.mjspre.IsPreView = TRUE ) then
    begin
        m_ComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
        Beep;
        MjsMessageBoxEx(AOwner,    // <001>
                        m_MjsMsgRec.sMsg,
                        m_MjsMsgRec.sTitle,
                        m_MjsMsgRec.icontype,
                        m_MjsMsgRec.btntype,
                        m_MjsMsgRec.btndef,
                        m_MjsMsgRec.LogType
                       );
        CanClose    :=  FALSE;
        Exit;
    end
	else
	begin

		CanClose    :=  TRUE;

		if not( (CmnMemDataGrid.State in [dsInsert]) or
    		    (CmnMemDataGrid.State in [dsEdit]  ) )then
            Exit;

        // ｲﾍﾞﾝﾄのﾏｽｸ
		m_bDBStopUpdate :=  TRUE;
		if  not CmnMemDataGrid.IsEmpty then
		begin
            // ｺｰﾄﾞﾌｨｰﾙﾄﾞを取り出して入力状態を確認する
			strCode :=  Trim(CmnMemDataGrid.FieldByName('strCode').AsString);
			if ( strCode = '' ) or ( StrToInt64(strCode) = 0 ) then
			begin
				goto ExitProc;
			end;

            // 新規ﾃﾞｰﾀ追加中の時
			if ( CmnMemDataGrid.State in [dsInsert] ) then
			begin
                // 既に同一のｺｰﾄﾞが登録済みの時はｴﾗｰ
				if  not CheckMasterDataInsertValid(strCode, RECKBN_NORMAL) then
				begin
					goto ExitProc;
				end;
			end;

            // 固定ﾚｺｰﾄﾞでない時
			if ( CmnMemDataGrid.FieldByName('nSeikakuNo').ReadOnly = FALSE ) then
			begin
                // 科目性格No.の入力省略は不可
				if ( CmnMemDataGrid.FieldByName('nSeikakuNo').AsInteger = 0 ) then
				begin
					goto ExitProc;
				end;
                // 科目性格がBS残高の場合正残区分No.の入力省略は不可
				if ( CmnMemDataGrid.FieldByName('nSeikakuNo').AsInteger = CHARCODE_BSZANDAKA ) then
	            begin
					if ( CmnMemDataGrid.FieldByName('nSeizanNo').AsInteger = 0 ) then
					begin
						goto ExitProc;
					end;
	            end
	            else
	            begin
					CmnMemDataGrid.FieldByName('nAdoptData02').AsInteger := 0;
	            end;
	        end;

            // 簡略名称が未入力の場合は正式名称の全角7文字分をｺﾋﾟｰする
			if ( CmnMemDataGrid.FieldByName('strSimpleName').AsString = '' ) then
			begin
				if ( CmnMemDataGrid.FieldByName('strName').AsString <> '' ) then
				begin
                    // 最後尾の文字が2Byte文字の場合は半角13文字分をｺﾋﾟｰする
					if ( MJSHanByteType(CmnMemDataGrid.FieldByName('strName').AsString, 14) = mbLeadByte ) then
						CmnMemDataGrid.FieldByName('strSimpleName').AsString :=
										MJSHanCopy(CmnMemDataGrid.FieldByName('strName').AsString, 1, 13)
					else
						CmnMemDataGrid.FieldByName('strSimpleName').AsString :=
										MJSHanCopy(CmnMemDataGrid.FieldByName('strName').AsString, 1, 14);
				end;
			end;

            // 追加/更新行の情報よりﾏｽﾀﾚｺｰﾄﾞを作成する
            // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ(親ｺｰﾄﾞ:加算先)
			m_MasterData.strParentCode  :=  m_strNodeCFCode;
            // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
			m_MasterData.strCode        :=  CmnMemDataGrid.FieldByName('strCode').AsString;
			m_MasterData.strCode        :=  Format('%.10d', [StrToInt64(Trim(m_MasterData.strCode))]);
            // 連想
			m_MasterData.strRenso       :=  CmnMemDataGrid.FieldByName('strRenso').AsString;
            // 正式名称
			m_MasterData.strName        :=  CmnMemDataGrid.FieldByName('strName').AsString;
            // 簡略名称
			m_MasterData.strSimpleName  :=  CmnMemDataGrid.FieldByName('strSimpleName').AsString;
            // 科目性格
			m_MasterData.iSeikakuNo     :=  CmnMemDataGrid.FieldByName('nSeikakuNo').AsInteger;
            // 正残区分
			m_MasterData.iSeizanNo      :=  CmnMemDataGrid.FieldByName('nSeizanNo').AsInteger;

            // ﾃﾞｰﾀﾍﾞｰｽへの追加/更新を行う
			UpdateDatabase(m_MasterData);
		end;
	end;

ExitProc:
    // MemDataをﾘｾｯﾄする(2回目のCloseQuery対策)
   	CmnMemDataGrid.Active	:= FALSE;
    CmnMemDataGrid.Active	:= TRUE;

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑ終了処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//		VAR     : Action    : 	TCloseActionｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	AppPrm  :   TAppParam;
begin

    // ﾌｫｰﾑｸﾛｰｽﾞを実行中
	m_bClose    :=  TRUE;
	Action      :=  caFree;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 会社ﾃﾞｰﾀﾍﾞｰｽを閉じる
    if ( m_DBSelect <> nil ) then
    	m_DataModule.COPDBClose(m_DBSelect);

    // 販売ｼｽﾃﾑ情報の開放   // <PRN>
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

    // JNTCommonの解放 <003>
//    m_cJNTArea.Free(); <004>

	m_pRec^.m_iDelete   :=  1;
	AppPrm.iAction      :=  ACTID_FORMCLOSEEND; 	// 呼び出し区分設定
	AppPrm.pRecord      :=  Pointer(m_pRec);  	    // 管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam :=  nil;				    // 予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);  // 親ｴﾝﾄﾘを呼出す

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//	< ﾌｫｰﾑ破棄処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormDestroy(Sender: TObject);
begin

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  nil;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< ﾌｫｰﾑ表示処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormShow(Sender: TObject);
begin

    // ﾌﾟﾚﾋﾞｭｰ表示中の時はﾌﾟﾚﾋﾞｭｰ画面を表示する
	if ( uvHani.mjspre.IsPreView ) then
		uvHani.mjspre.Show
	else
        // ｱｸﾃｲﾌﾞｺﾝﾄﾛｰﾙにﾌｫｰｶｽをｾｯﾄする
		m_AcControl.SetFocus;

    if ( m_ACControl = mainESyurui ) then
        mainESyurui.DroppedDown :=  TRUE;

	JNTMasSetCaption(m_pRec);
	MJSBtnVisible(TJNTCRP009003f(Self), TRUE);

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑ非表示処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormHide(Sender: TObject);
begin

	MJSBtnVisible(TJNTCRP009003f(Self), FALSE);


	if ( uvHani.mjspre <> nil ) then
    begin
        // ﾌﾟﾚﾋﾞｭｰ表示中の時はﾌﾟﾚﾋﾞｭｰ画面を非表示にする
		if uvHani.mjspre.IsPreview then
			uvHani.mjspre.Hide
	end;


end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ処理 >
//      PARAM   : Sender    : 	TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.FormActivate(Sender: TObject);
var
	AppParam    :   TAppParam;
begin

	AppParam.iAction        :=  ACTID_ACTIVEEND;
	AppParam.pRecord        :=  Pointer(m_pRec);
	AppParam.pActionParam   :=  nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppParam);

end;

//-----------------------------------------------------------------------------
// CmnToolbarButtonDelete_Click()
//	< 削除処理(ToolBar) >
//      PARAM   : Sender    : 	TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnToolbarButtonDelete_Click(Sender: TObject);
var
	iRet        :   Integer;				    // ﾘﾀｰﾝｺｰﾄﾞ
	cNode       :   TTreeNode;					// ﾂﾘｰﾋﾞｭｰで選択しているﾉｰﾄﾞ
	cParentNode :   TTreeNode;					// ﾂﾘｰﾋﾞｭｰで選択しているﾉｰﾄﾞの親ﾉｰﾄﾞ(合計科目)
	stItemRec   :   ^TreeViewRec;				// ｱｲﾃﾑﾚｺｰﾄﾞ
	iNCode      :   Extended;					// ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ
	strCode     :   String;						// ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	iSumKbn     :   Integer;					// 実在/合計区分
    iFocusedNo  :   Integer;					// ｸﾞﾘｯﾄﾞ内で削除した場合の削除行No.
begin

	iFocusedNo  :=  0;

    // 削除確認ﾒｯｾｰｼﾞを表示する
	m_ComArea.m_MsgStd.GetMsg(m_MjsMsgRec, 30, 4);
// <007> 「当該ﾏｽﾀにﾃﾞｰﾀが存在している場合、削除すると管理表に不整合が生ずる恐れがあります。
//          削除してもよろしいですか？」
//	iRet := MjsMessageBoxEx(AOwner, // <002>
//                            m_MjsMsgRec.sMsg,
	iRet := MjsMessageBoxEx(AOwner, // <002>
                            MSG_DELETE,
							m_MjsMsgRec.sTitle,
							m_MjsMsgRec.icontype,
							m_MjsMsgRec.btntype,
							m_MjsMsgRec.btndef,
							m_MJsMsgRec.LogType);

    // 削除処理実行の時
	if ( iRet = mrYes ) then
	begin
		cNode       :=  CmnTreeView.Selected;		// 選択しているﾉｰﾄﾞを取り出す
		stItemRec   :=  cNode.Data;			        // 選択しているﾉｰﾄﾞのｱｲﾃﾑ情報を取出す

        // ﾉｰﾄﾞが実在科目の場合は親ﾉｰﾄﾞを取出す(合計科目)
		if ( stItemRec^.iSumKbn = KAMOKU_JITUZAI ) then
			cParentNode :=  cNode.Parent
		else
			cParentNode :=  cNode;

        // ﾂﾘｰﾋﾞｭｰにﾌｫｰｶｽがある時の削除
		if	CmnTreeView.Focused then
		begin
			stItemRec   :=  cNode.Data;		        // ｱｲﾃﾑﾚｺｰﾄﾞを取り出す
			iNCode	    :=  stItemRec^.iNCode;	    // ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ
			strCode	    :=  stItemRec^.strCode;	    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
			iSumKbn	    :=  stItemRec^.iSumKbn;	    // 実在/合計区分
		end
        // ｸﾞﾘｯﾄﾞにﾌｫｰｶｽがある時の削除
		else
		begin
            // ｸﾞﾘｯﾄﾞで選択しているｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞを取出す
			iNCode	    :=  CmnMemDataGrid.FieldByName('iNCode').AsFloat;
			strCode	    :=  CmnMemDataGrid.FieldByName('strCode').AsString;
			strCode     :=  Format('%.10d', [StrToInt64(Trim(strCode))]);
			iSumKbn	    :=  KAMOKU_JITUZAI;
            // 現在の位置を保存
            iFocusedNo  :=  CmnMemDataGrid.RecNo;
		end;
        // ﾃﾞｰﾀﾍﾞｰｽの削除を行う
		DeleteDatabase(iSumKbn, iNCode, strCode);
        // ｸﾞﾘｯﾄﾞﾃﾞｰﾀの再作成
		SetGdidDatas(m_iCurrentJob, cParentNode);

        // ﾂﾘｰﾋﾞｭｰにﾌｫｰｶｽがある時の削除
		if	CmnTreeView.Focused then
		begin
			cNode       :=  CmnTreeView.Selected;	// 選択しているﾉｰﾄﾞを取り出す
			stItemRec   :=  cNode.Data;		        // 選択しているﾉｰﾄﾞのｱｲﾃﾑ情報を取出す
											        // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを制御にする
			SetDeleteButtonCondition(stItemRec^.strCode);
		end
        // ｸﾞﾘｯﾄﾞにﾌｫｰｶｽがある時の削除
		else
		begin
            // ｸﾞﾘｯﾄﾞ上のﾌｫｰｶｽを調整する
            // 最終行を削除した場合は一行上にﾌｫｰｶｽをｾｯﾄする
        	if ( CmnMemDataGrid.RecordCount < iFocusedNo ) then
            	iFocusedNo := CmnMemDataGrid.RecordCount;

            CmnMemDataGrid.RecNo := iFocusedNo;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// CmnToolbarButtonPrint_Click()    <PRN>
//	< 印刷処理(ToolBar) >
//      PARAM   : Sender    : 	TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnToolbarButtonPrint_Click(Sender: TObject);
begin

    // ｸﾞﾘｯﾄﾞ内を編集中の時はﾚｺｰﾄﾞをPostする
	if ( CmnMemDataGrid.State in [dsInsert] ) or
       ( CmnMemDataGrid.State in [dsEdit]   ) then
		CmnMemDataGrid.Post();

    PrnSet();

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry	:=  DmqPrint;
        TargetMD    :=  DMemPrint;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  m_cJNTArea;
        TargetInt   :=  m_iCurrentJob;
	end;

    // 印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);

end;

//-----------------------------------------------------------------------------
// mainESyurui_Enter
//	< 指示ｺﾝﾎﾞﾌｫｰｶｽ取得時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.mainESyurui_Enter(Sender: TObject);
begin

    MjsDispCtrl.MjsSetEnabled(Self, 'CmnToolbarButtonDelete',   FALSE);
	m_ACControl :=  Screen.ActiveControl;

end;

//-----------------------------------------------------------------------------
// mainESyurui_KeyDown
//	< 指示ｺﾝﾎﾞｷｰ入力時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key       :   Word(ｷｰ情報)
//                Shift     :   TShiftStateｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.mainESyurui_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
(*
    // Escape/Endｷｰの補足
	if ( Key = VK_ESCAPE ) or ( Key = VK_END ) then
	begin
        // ﾌｫｰﾑを閉じる
		Close();
        Abort;
	end;
*) //<KEY>

    // Shift+Tabは無視する
	if ( Key = VK_TAB ) and ( Shift = [ssShift] ) then Abort;

    // Return/Tabｷｰの補足
	if ( Key = VK_RETURN ) or ( Key = VK_TAB ) then
    begin
        mainESyurui.DroppedDown :=  FALSE;
        // TMComboBoxのOnChangeをｴﾐｭﾚｰﾄする
        mainESyurui_Change(Sender);
        // ﾂﾘｰﾋﾞｭｰにﾌｫｰｶｽをｾｯﾄする
        MjsDispCtrl.MjsSetFocus(Self, 'CmnTreeView');
    end;

end;

//-----------------------------------------------------------------------------
// mainESyurui_Change
//	< 指示ｺﾝﾎﾞ変更時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.mainESyurui_Change(Sender: TObject);
begin

    // 指示ｺﾝﾎﾞDroppedDownｵｰﾌﾟﾝ時は無視
	if ( mainESyurui.DroppedDown = TRUE ) then Exit;

    // ｺﾝﾎﾞﾎﾞｯｸｽで表示中画面でない処理を選択した時
	if ( m_iCurrentJob <> mainESyurui.ItemIndex ) then
    begin
        // 処理区分ｲﾝﾃﾞｯｸｽを更新
	    m_iCurrentJob   :=  mainESyurui.ItemIndex;

		case m_iCurrentJob of
            // 営業活動を選択
    		SELECT_EIGYOU:
            begin
                // 科目分類
				m_strCurrentCFCode      :=  CFCODE_EIGYOU;
				m_MasterData.iClassCode :=  CHARCODE_EIGYOU;
                // 営業活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ
				LoadEigyou();
			end;
            // 投資活動を選択
    		SELECT_TOUSI:
            begin
				m_strCurrentCFCode      :=  CFCODE_TOUSI;
				m_MasterData.iClassCode :=  CHARCODE_TOUSI;
                // 投資活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ
				LoadTousi();
			end;
            // 財務活動を選択
    		SELECT_ZAIMU:
            begin
				m_strCurrentCFCode      :=  CFCODE_ZAIMU;
				m_MasterData.iClassCode :=  CHARCODE_ZAIMU;
                // 財務活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ
				LoadZaimu();
			end;
            // 現金及び現金同等物を選択
    		SELECT_GENKIN:
            begin
				m_strCurrentCFCode      :=  CFCODE_GENKIN;
				m_MasterData.iClassCode :=  CHARCODE_GENKIN;
                // 現金及び現金同等物ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ
				LoadGenkin();
			end;
    	end;
    end;

end;

//-----------------------------------------------------------------------------
// CmnTreeViewEnter()
//	< TMTreeView OnEnterｲﾍﾞﾝﾄ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnTreeViewEnter(Sender: TObject);
var
	cNode       :   TTreeNode;
    stItemRec   :   ^TreeViewRec;
begin

    // 選択しているﾉｰﾄﾞを取得する
	cNode       :=  CmnTreeView.Selected;
	stItemRec   :=  cNode.Data;
    // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを制御にする
	SetDeleteButtonCondition(stItemRec^.strCode);

end;

//-----------------------------------------------------------------------------
// CmnTreeViewEnter()
//	< TMTreeView OnChangeｲﾍﾞﾝﾄ >
//      PARAM   : Sender:   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node  :   TTreeNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnTreeViewChange(Sender: TObject; Node: TTreeNode);
var
    stItemRec   :   ^TreeViewRec;   // ｱｲﾃﾑ情報
    stItemRec2  :   ^TreeViewRec;	// ｱｲﾃﾑ情報
	cNode       :   TTreeNode;		// ｸﾞﾘｯﾄﾞに表示するﾂﾘｰのﾉｰﾄﾞ
begin

    // 選択しているﾉｰﾄﾞのｱｲﾃﾑ情報を取出す
	stItemRec   :=  Node.Data;

    // 表示対象ﾉｰﾄﾞが実在科目の場合は親ﾉｰﾄﾞを取出す
	if ( stItemRec^.iSumKbn = KAMOKU_JITUZAI ) then
		    cNode   :=  Node.Parent
	else    cNode   :=  Node;

    // 再度、ﾉｰﾄﾞのｱｲﾃﾑ情報を取出す
	stItemRec2  :=  cNode.Data;

    // ｸﾞﾘｯﾄﾞ表示中ﾃﾞｰﾀと異なる場合のみｸﾞﾘｯﾄﾞを再作成
	if ( m_strNodeCFCode <> stItemRec2^.strCode ) then
        SetGdidDatas(m_iCurrentJob, cNode);

    // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを制御にする
	SetDeleteButtonCondition(stItemRec^.strCode);

end;

//-----------------------------------------------------------------------------
// CmnTreeViewDragOver()
//	< TMTreeView OnDragOverｲﾍﾞﾝﾄ >
//      PARAM   : Sender,Source :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                X,Y           :   Integer
//                State         :   TDragStateｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Accept        :   Boolean
//      RETURN  :
//      MEMO    : 移動先の正当性を判断する
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
                                             State: TDragState; var Accept: Boolean);
var
    cNodeSrc        :   TTreeNode;					// 移動元のﾉｰﾄﾞ
	cNodeDst        :   TTreeNode;					// 移動先のﾉｰﾄﾞ
    stItemRecSrc    :   ^TreeViewRec;				// 移動元ｱｲﾃﾑﾚｺｰﾄﾞ
begin

    // ﾂﾘｰで選択しているﾉｰﾄﾞを取り出す(移動元)
	cNodeSrc        :=  CmnTreeView.Selected;
    // ﾉｰﾄﾞからｱｲﾃﾑﾚｺｰﾄﾞを取り出す
    stItemRecSrc    :=  cNodeSrc.Data;

    // ﾉｰﾄﾞのﾄｯﾌﾟﾚﾍﾞﾙのとき
    if ( stItemRecSrc^.strCode = m_strCurrentCFCode ) then
    begin
        // 移動不可
        Accept  :=  FALSE;
        Exit;
    end;

    // 移動先ﾉｰﾄﾞを取出す
	cNodeDst    :=  CmnTreeView.GetNodeAt(X, Y);

	if ( cNodeDst = nil ) then
	begin
        // 範囲外の移動
		Accept  :=  FALSE;
		Exit;
	end;

end;

//-----------------------------------------------------------------------------
// CmnTreeViewDragDrop()
//	< TMTreeView OnDragDropｲﾍﾞﾝﾄ >
//      PARAM   : Sender,Source :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                X,Y           :   Integer
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
var
	cNodeSrc            :   TTreeNode;		        // 移動元ﾉｰﾄﾞ
	cNodeDst            :   TTreeNode;				// 移動先ﾉｰﾄﾞ
	stItemRecSrc        :   ^TreeViewRec;			// 移動元のｱｲﾃﾑﾚｺｰﾄﾞ
	stItemRecDst        :   ^TreeViewRec;			// 移動先のｱｲﾃﾑﾚｺｰﾄﾞ
	cNodeSrcParent      :   TTreeNode;				// 移動元の親ﾉｰﾄﾞ
	cNodeDstParent      :   TTreeNode;				// 移動先の親ﾉｰﾄﾞ
	stItemRecSrcParent  :   ^TreeViewRec;		    // 移動元の親ﾉｰﾄﾞのｱｲﾃﾑﾚｺｰﾄﾞ
	stItemRecDstParent  :   ^TreeViewRec;		    // 移動先の親ﾉｰﾄﾞのｱｲﾃﾑﾚｺｰﾄﾞ
	strCodeDstParent    :   String;				    // 移動先の親ﾉｰﾄﾞの科目ｺｰﾄﾞ
	cNode               :   TTreeNode;				// ｸﾞﾘｯﾄﾞに表示するﾂﾘｰのﾉｰﾄﾞ
	stRecDst            :   ^TreeViewRec;			// 移動先のｱｲﾃﾑﾚｺｰﾄﾞ
begin

	cNodeSrc        :=  CmnTreeView.Selected;		// 移動元ﾉｰﾄﾞを取り出す
	cNodeDst        :=  CmnTreeView.DropTarget;		// 移動先ﾉｰﾄﾞを取り出す
	cNodeSrcParent  :=  cNodeSrc.Parent;		    // 移動元の親ﾉｰﾄﾞを取り出す
	cNodeDstParent  :=  cNodeDst.Parent;		    // 移動先の親ﾉｰﾄﾞを取り出す

	stItemRecSrc    :=  cNodeSrc.Data;			    // 移動元のｱｲﾃﾑﾚｺｰﾄﾞ
	stItemRecDst    :=  cNodeDst.Data;			    // 移動先のｱｲﾃﾑﾚｺｰﾄﾞ

    // 移動元と移動先の正当性を確認する
	if ( not CheckMasterTreeInsertValid(stItemRecSrc^.strCode, stItemRecDst^.strCode) ) then Exit;

    // 移動元の親ﾉｰﾄﾞのｱｲﾃﾑﾚｺｰﾄﾞ
	stItemRecSrcParent  :=  cNodeSrcParent.Data;

    // 親ﾉｰﾄﾞが異なる位置には移動不可
	if ( cNodeDstParent = nil ) or ( cNodeSrcParent <> cNodeDstParent ) then Exit;

    // 移動先が小計内の場合、小計に属するもの以外は移動不可
    // <014> MOD start
	//if ( stItemRecDst^.strCode = m_strCFSyoukeiCode ) and ( cNodeSrcParent <> cNodeDst ) then Exit;
    if ( Format('%.10d', [StrToInt64(Trim(stItemRecDst^.strCode))]) = m_strCFSyoukeiCode ) and
       ( cNodeSrcParent <> cNodeDst ) then
    begin
    	Exit;
    end;
    // <014> MOD end

	stItemRecDstParent  :=  cNodeDstParent.Data;
	strCodeDstParent    :=  stItemRecDstParent^.strCode;

    // <013> ADD start
    // 移動先と移動元が同じ場合、加算体系ﾃｰﾌﾞﾙ移動処理を行わない
	if ( stItemRecDst^.iNCode 		= stItemRecSrc^.iNCode ) and
       ( stItemRecDstParent^.iNCode = stItemRecSrcParent^.iNCode ) then
    begin
    	Exit;
    end;
    // <013> ADD end

	MoveTreeRecord(stItemRecSrc^.iNCode,
                   stItemRecSrcParent^.iNCode,
                   stItemRecDst^.iNCode,
                   stItemRecDstParent^.iNCode,
                   stItemRecDst^.iSumKbn);

    // 移動先のｱｲﾃﾑﾚｺｰﾄﾞ
	stRecDst    :=  cNodeDst.Data;
    // 移動先が実在科目の時
	if ( stRecDst^.iSumKbn = KAMOKU_JITUZAI ) then
        // 移動元ﾉｰﾄﾞを移動先ﾉｰﾄﾞの前に移動する
		cNodeSrc.MoveTo(cNodeDst, naInsert)
    // 移動先が合計科目の時
	else
        // 移動元ﾉｰﾄﾞを移動先ﾉｰﾄﾞの子として末尾に移動
		cNodeSrc.MoveTo(cNodeDst, naAddChild);

    // 表示対象ﾉｰﾄﾞが実在科目の場合は親ﾉｰﾄﾞを取出す
	if ( stItemRecDst^.iSumKbn = KAMOKU_JITUZAI ) then
		cNode := cNodeDst.Parent
	else
		cNode := cNodeDst;

    // ｸﾞﾘｯﾄﾞﾃﾞｰﾀの再作成
	SetGdidDatas(m_iCurrentJob, cNode);

end;

//-----------------------------------------------------------------------------
// CmnDataSourceStateChange()
//	< TDataSource OnStateChangeｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnDataSourceStateChange(Sender: TObject);
begin

    // 新規行の追加中の時はｺｰﾄﾞﾌｨｰﾙﾄﾞの入力を可能とする
	if ( CmnMemDataGrid.State in [dsInsert] ) then
		CmnGrid.Columns[INDEX_CODE].ReadOnly := FALSE
    // 他の状態(修正等)の時は入力不可とする
	else
		CmnGrid.Columns[INDEX_CODE].ReadOnly := TRUE;

    // MemDataがｵｰﾌﾟﾝ状態で登録件数がの0件の時は入力可能
	if ( CmnMemDataGrid.Active ) and ( CmnMemDataGrid.RecordCount = 0 ) then
		CmnGrid.Columns[INDEX_CODE].ReadOnly := FALSE;

end;

//-----------------------------------------------------------------------------
// CmnGridEnter()
//	< TdxdbGrid OnEnterｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnGridEnter(Sender: TObject);
begin

	m_ACControl :=  Screen.ActiveControl;

	CmnGrid.FocusedColumn   :=  INDEX_CODE;

	if ( CmnGrid.FocusedNode.Strings[INDEX_CODE] = '' ) then
	begin
        // ｺｰﾄﾞﾌｨｰﾙﾄﾞが未入力の場合はｺｰﾄﾞﾌｨｰﾙﾄﾞにﾌｫｰｶｽ
		CmnGrid.FocusedColumn           :=  INDEX_CODE;
        // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを無効にする
		CmnToolbarButtonDelete.Enabled  :=  FALSE;
	end
    // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを制御にする
	else
	begin
		SetDeleteButtonCondition(CmnMemDataGrid.FieldByName('strCode').AsString);
	end;

end;

//-----------------------------------------------------------------------------
// CmnGridExit()
//	< TdxdbGrid OnExitｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnGridExit(Sender: TObject);
begin

    // 処理中のﾚｺｰﾄﾞをPostする
	if ( CmnMemDataGrid.State in [dsInsert] ) or
       ( CmnMemDataGrid.State in [dsEdit]   ) then
		CmnMemDataGrid.Post();

end;

//-----------------------------------------------------------------------------
// CmnGridKeyPress()
//	< TdxdbGrid OnKeyPressｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key       :   Char
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnGridKeyPress(Sender: TObject; var Key: Char);
begin

	if ( CmnGrid.FocusedColumn = INDEX_CODE ) then
	begin
        // ｺｰﾄﾞ入力の時
		if ( UpCase(Key) >= 'A' ) and ( UpCase(Key) <= 'Z' ) then
		begin
            // 数値入力以外不可
			Beep();
			Abort;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// CmnGridBeforeChangeColumn()
//	< TdxdbGrid OnBeforeColumnｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node      :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                Column    :   Integer
//                NewNode   :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                NewColumn :   Integer
//      VAR     : CanChange :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnGridBeforeChangeColumn(Sender: TObject; Node: TdxTreeListNode;
             Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cField          :   TField;		// ﾌｨｰﾙﾄﾞﾃﾞｰﾀ
	strCode         :   String;		// ｺｰﾄﾞ
	strName         :   String;		// 正式名称
	strSimpleName   :   String;     // 簡略名称
begin

	if ( Column = INDEX_CODE ) and ( CmnMemDataGrid.State in [dsInsert] ) then
	begin
    	if ( Column = INDEX_CODE ) and ( NewColumn = INDEX_CODE ) then
        begin
    		Exit;
        end;

		cField  :=  CmnMemDataGrid.FieldByName('strCode');
		strCode :=  cField.AsString;

		if ( strCode = '' ) or ( StrToInt64(strCode) = 0 ) then
		begin
			Beep();							// ｺｰﾄﾞ未入力/0入力はｴﾗｰ
    		CanChange := FALSE;	  			// 移動不可にする(ﾏｳｽｸﾘｯｸによる移動の対応)
	    	Exit;
		end;

        // 既に同一のｺｰﾄﾞが登録済みの時はｴﾗｰ
		if ( not CheckMasterDataInsertValid(strCode, RECKBN_NORMAL) ) then
        begin
			Beep();
    		CanChange := FALSE;	  			// 移動不可にする(ﾏｳｽｸﾘｯｸによる移動の対応)
	    	Exit;
		end;
	end;

    // 移動する列が科目性格/正残区分の時
	if ( NewColumn = INDEX_SEIKAKU ) or ( NewColumn = INDEX_SEIZAN ) then
	begin
		Beep();								// 移動不可にする(ﾏｳｽｸﾘｯｸによる移動の対応)
		CanChange := FALSE;					// 移動不可にする(ﾏｳｽｸﾘｯｸによる移動の対応)
		Exit;
	end;

	if ( Column = INDEX_LONGNAME ) then		// 正式名称入力から移動する時
	begin
		strSimpleName   :=  CmnMemDataGrid.FieldByName('strSimpleName').AsString;

		if ( strSimpleName = '' ) then
		begin								// 簡略名称が未入力の場合は正式名称の全角7文字分をｺﾋﾟｰする
			strName :=  CmnMemDataGrid.FieldByName('strName').AsString;

			if ( strName <> '' ) then
			begin
				CmnGrid.DataLink.Edit;
                // 最後尾の文字が2Byte文字の場合は半角13文字分をｺﾋﾟｰする
				if ( MJSHanByteType(Node.Values[INDEX_LONGNAME], 14) = mbLeadByte ) then
					CmnGrid.Columns[INDEX_SIMPLENAME].Field.AsString    :=  MJSHanCopy(Node.Values[INDEX_LONGNAME], 1, 13)
				else
					CmnGrid.Columns[INDEX_SIMPLENAME].Field.AsString    :=  MJSHanCopy(Node.Values[INDEX_LONGNAME], 1, 14);
			end;
		end;
	end;

    // 移動する列が正残区分No.で且つ固定ﾚｺｰﾄﾞでない時
	if ( NewColumn = INDEX_SEIZANNO ) and ( CmnMemDataGrid.FieldByName('nSeikakuNo').ReadOnly = FALSE ) then
	begin
		if ( CmnMemDataGrid.FieldByName('nSeikakuNo').AsInteger <> CHARCODE_BSZANDAKA ) then
		begin
			CmnGrid.DataLink.Edit;
			CmnMemDataGrid.FieldByName('nAdoptData02')  .AsInteger  :=  0;
			CmnMemDataGrid.FieldByName('nSeizanNo')     .ReadOnly   :=  TRUE;
        end
        else
        begin
			CmnMemDataGrid.FieldByName('nSeizanNo')     .ReadOnly   :=  FALSE;

            // 正残区分が未設定のときは初期値として1:借方をｾｯﾄする
			if ( CmnMemDataGrid.FieldByName('nSeizanNo').AsInteger = 0 ) then
            begin
				CmnGrid.DataLink.Edit;
				CmnMemDataGrid.FieldByName('nAdoptData02').AsInteger    :=  1;
            end;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// CmnGridChangeNodeEx()
//	< TdxdbGrid OnChangeNodeExｲﾍﾞﾝﾄ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnGridChangeNodeEx(Sender: TObject);
var
	cField  :   TField;
begin

    // TRUE: OnBeforPostでﾃﾞｰﾀﾍﾞｰｽの更新を行わない FALSE: 行う
	if ( not m_bDBStopUpdate ) then
    begin
		cField  :=  CmnMemDataGrid.FieldByName('iKoteiKbn');

        // その行が固定ﾚｺｰﾄﾞの時、科目性格/正残区分を書き込み不可にする
		if ( not cField.IsNull ) and ( cField.AsInteger = KOTEIKBN_KOTEI ) then
		begin
			CmnMemDataGrid.FieldByName('nSeikakuNo').ReadOnly   :=  TRUE;
			CmnMemDataGrid.FieldByName('nSeizanNo') .ReadOnly   :=  TRUE;
		end
        // 固定ﾚｺｰﾄﾞでない時
		else
	    begin
            // 科目性格の入力可
			CmnMemDataGrid.FieldByName('nSeikakuNo').ReadOnly   :=  FALSE;
            // 正残区分は科目性格により入力可/不可となる
			cField  :=  CmnMemDataGrid.FieldByName('nSeikakuNo');

            // BS残高以外は入力可
			if ( cField.AsInteger <> CHARCODE_BSZANDAKA ) then
				CmnMemDataGrid.FieldByName('nSeizanNo').ReadOnly    :=  TRUE
            // BS残高は入力不可
    	    else
				CmnMemDataGrid.FieldByName('nSeizanNo').ReadOnly    :=  FALSE;
		end;

        // 移動行のｺｰﾄﾞﾌｨｰﾙﾄﾞが未入力の場合はｺｰﾄﾞﾌｨｰﾙﾄﾞにﾌｫｰｶｽ
		if ( CmnGrid.FocusedNode.Strings[INDEX_CODE] = '' ) then
		begin
			CmnGrid.FocusedColumn           :=  INDEX_CODE;
            // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを無効にする
			CmnToolbarButtonDelete.Enabled  :=  FALSE;
		end
        // ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝを制御にする
		else
		begin
			SetDeleteButtonCondition(CmnMemDataGrid.FieldByName('strCode').AsString);
		end;
    end;

end;

//-----------------------------------------------------------------------------
// CmnMemDataGridBeforePost()
//	< TdxMemdata BeforePostｲﾍﾞﾝﾄ >
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CmnMemDataGridBeforePost(DataSet: TDataSet);
var
	strCode :   String;
begin

    // TRUE: OnBeforPostでﾃﾞｰﾀﾍﾞｰｽの更新を行わない FALSE: 行う
	if ( not m_bDBStopUpdate ) then
    begin
        // ｺｰﾄﾞﾌｨｰﾙﾄﾞを取り出して入力状態を確認する
		strCode :=  Trim(DataSet.FieldByName('strCode').AsString);

		if ( strCode = '' ) or ( StrToInt64(strCode) = 0 ) then
		begin
			Beep();
			Abort;
		end;

        // 新規ﾃﾞｰﾀ追加中の時
		if ( CmnMemDataGrid.State in [dsInsert] ) then
		begin
            // 既に同一のｺｰﾄﾞが登録済みの時はｴﾗｰ
			if ( not CheckMasterDataInsertValid(strCode, RECKBN_NORMAL) ) then
			begin
				Beep;
				Abort;
			end;
		end;

        // 固定ﾚｺｰﾄﾞでない時
		if ( DataSet.FieldByName('nSeikakuNo').ReadOnly = FALSE ) then
		begin
            // 科目性格No.の入力省略は不可
			if ( DataSet.FieldByName('nSeikakuNo').AsInteger = 0 ) then
			begin
				Beep;
				Abort;
			end;

            // 科目性格がBS残高の場合正残区分No.の入力省略は不可
			if ( DataSet.FieldByName('nSeikakuNo').AsInteger = CHARCODE_BSZANDAKA ) then
            begin
				if ( DataSet.FieldByName('nSeizanNo').AsInteger = 0 ) then
				begin
					Beep;
					Abort;
				end;
            end
            else
            begin
				DataSet.FieldByName('nAdoptData02').AsInteger := 0;
            end;
        end;

        // 簡略名称が未入力の場合は正式名称の全角7文字分をｺﾋﾟｰする
		if ( DataSet.FieldByName('strSimpleName').AsString = '' ) then
		begin
			if ( DataSet.FieldByName('strName').AsString <> '' ) then
			begin
                // 最後尾の文字が2Byte文字の場合は半角13文字分をｺﾋﾟｰする
				if ( MJSHanByteType(DataSet.FieldByName('strName').AsString, 14) = mbLeadByte ) then
					DataSet.FieldByName('strSimpleName').AsString   :=  MJSHanCopy(DataSet.FieldByName('strName').AsString, 1, 13)
				else
					DataSet.FieldByName('strSimpleName').AsString   :=  MJSHanCopy(DataSet.FieldByName('strName').AsString, 1, 14);
			end;
		end;

        // 追加/更新行の情報よりﾏｽﾀﾚｺｰﾄﾞを作成する

        // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ(親ｺｰﾄﾞ:加算先)
		m_MasterData.iParentNCode   :=  m_iNodeCFNCode;
		m_MasterData.strParentCode  :=  m_strNodeCFCode;
        // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
		m_MasterData.iNCode         :=  CmnMemDataGrid.FieldByName('iNCode').AsFloat;
		m_MasterData.strCode        :=  CmnMemDataGrid.FieldByName('strCode').AsString;
		m_MasterData.strCode        :=  Format('%.10d', [StrToInt64(Trim(m_MasterData.strCode))]);
        // 連想
		m_MasterData.strRenso       :=  CmnMemDataGrid.FieldByName('strRenso').AsString;
        // 正式名称
		m_MasterData.strName        :=  CmnMemDataGrid.FieldByName('strName').AsString;
        // 簡略名称
		m_MasterData.strSimpleName  :=  CmnMemDataGrid.FieldByName('strSimpleName').AsString;
        // 科目性格
		m_MasterData.iSeikakuNo     :=  CmnMemDataGrid.FieldByName('nSeikakuNo').AsInteger;
        // 正残区分
		m_MasterData.iSeizanNo      :=  CmnMemDataGrid.FieldByName('nSeizanNo').AsInteger;
        // ﾃﾞｰﾀﾍﾞｰｽへの追加/更新を行う
		UpdateDatabase(m_MasterData);
    end;

end;

//-----------------------------------------------------------------------------
// GetComInfo()
//	< 会社情報取得 >
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常(SQLｴﾗｰ)
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetComInfo(): Boolean;
var
	KbnQuery    :   TMQuery;
begin

    Result  :=  TRUE;

    // TMQueryを生成する
	KbnQuery    :=  TMQuery.Create(Self);
    // DBとMQueryの接続
    m_DataModule.SetDBInfoToQuery(m_DBSelect, KbnQuery);

    with KbnQuery do
    begin
	    Close();
        SQL.Clear;
        SQL.Add('SELECT GnPuKbn1,GnPuKbn3,GnPuKbn5,GnPuKbn11,GnPuKbn12,GnPuKbn13    '
            +   'FROM KbnInfo WHERE (RecKbn = 12)                                   ');
        Open();

    	if ( Status = 0 ) then
    	begin
    		m_iGnPuKbn5     :=  GetFld('GnPuKbn5').AsInteger;
    		m_iGnPuKbn11    :=  GetFld('GnPuKbn11').AsInteger;
    		m_iGnPuKbn12    :=  GetFld('GnPuKbn12').AsInteger;
    		m_iGnPuKbn13    :=  GetFld('GnPuKbn13').AsInteger;

            // 間接法採用
    		if ( GetFld('GnPuKbn3').AsInteger = 1 ) then
    	        m_iCfKbn    :=  SELECT_KANSETU
            // 直接法採用
    		else if ( GetFld('GnPuKbn1').AsInteger = 1 ) then
	            m_iCfKbn    :=  SELECT_CHOKUSETU;

    		Close();
    	end
    	else
    	begin
            m_ComArea.m_MsgStd.GetMsgDB(m_MjsMsgRec, KbnQuery);
            MjsMessageBoxEx(AOwner, // <002>
                            m_MjsMsgRec.sMsg,
                            m_MjsMsgRec.sTitle,
                            m_MjsMsgRec.icontype,
                            m_MjsMsgRec.btntype,
                            m_MjsMsgRec.btndef,
                            FALSE
                           );
    		Result := FALSE;
    	end;
    end;

    KbnQuery.Close();
	KbnQuery.Free();

end;

//-----------------------------------------------------------------------------
// LoadEigyou()
//	< 営業活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.LoadEigyou;
begin

	nGridSeikakuNo.DropDownRows := 3;		// ｸﾞﾘｯﾄﾞ[科目性格]ｺﾝﾎﾞﾎﾞｯｸｽのﾄﾞﾛｯﾌﾟﾀﾞｳﾝ行を設定
											// ｸﾞﾘｯﾄﾞ[科目性格]用MemData 初期化
	CmnMemDataClass1.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass1.Active	:= TRUE;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUNYU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUNYU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUSYUTU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUSYUTU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_BSZANDAKA;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_BSZANDAKA;
	CmnMemDataClass1.Post;
											// ｸﾞﾘｯﾄﾞ[正残区分]用MemData 初期化
	CmnMemDataClass2.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass2.Active	:= TRUE;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KARIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KARIKATA;
	CmnMemDataClass2.Post;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KASIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KASIKATA;
	CmnMemDataClass2.Post;

	BuildTreeViewItems(SELECT_EIGYOU);		// ﾂﾘｰﾃﾞｰﾀを生成/表示
											// ｸﾞﾘｯﾄﾞﾃﾞｰﾀを生成/表示
	SetGdidDatas(SELECT_EIGYOU, CmnTreeView.Selected);

end;

//-----------------------------------------------------------------------------
// LoadTousi()
//	< 投資活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.LoadTousi;
begin

	nGridSeikakuNo.DropDownRows := 3;		// ｸﾞﾘｯﾄﾞ[科目性格]ｺﾝﾎﾞﾎﾞｯｸｽのﾄﾞﾛｯﾌﾟﾀﾞｳﾝ行を設定
											// ｸﾞﾘｯﾄﾞ[科目性格]用MemData 初期化
	CmnMemDataClass1.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass1.Active	:= TRUE;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUNYU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUNYU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUSYUTU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUSYUTU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_BSZANDAKA;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_BSZANDAKA;
	CmnMemDataClass1.Post;
											// ｸﾞﾘｯﾄﾞ[正残区分]用MemData 初期化
	CmnMemDataClass2.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass2.Active	:= TRUE;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KARIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KARIKATA;
	CmnMemDataClass2.Post;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KASIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KASIKATA;
	CmnMemDataClass2.Post;

	BuildTreeViewItems(SELECT_TOUSI);		// ﾂﾘｰﾃﾞｰﾀを生成/表示
											// ｸﾞﾘｯﾄﾞﾃﾞｰﾀを生成/表示
	SetGdidDatas(SELECT_TOUSI, CmnTreeView.Selected);

end;

//-----------------------------------------------------------------------------
// LoadZaimu()
//	< 財務活動ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.LoadZaimu;
begin

	nGridSeikakuNo.DropDownRows := 3;		// ｸﾞﾘｯﾄﾞ[科目性格]ｺﾝﾎﾞﾎﾞｯｸｽのﾄﾞﾛｯﾌﾟﾀﾞｳﾝ行を設定
											// ｸﾞﾘｯﾄﾞ[科目性格]用MemData 初期化
	CmnMemDataClass1.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass1.Active	:= TRUE;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUNYU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUNYU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_RYUSYUTU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_RYUSYUTU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_BSZANDAKA;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_BSZANDAKA;
	CmnMemDataClass1.Post;
											// ｸﾞﾘｯﾄﾞ[正残区分]用MemData 初期化
	CmnMemDataClass2.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass2.Active	:= TRUE;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KARIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KARIKATA;
	CmnMemDataClass2.Post;
    CmnMemDataClass2.Append;
	CmnMemDataClass2.FieldByName('nDivision')       .AsInteger  := (DCKBN_KASIKATA + 1);
	CmnMemDataClass2.FieldByName('strDescription')  .AsString	:= SEIZAN_KASIKATA;
	CmnMemDataClass2.Post;

	BuildTreeViewItems(SELECT_ZAIMU);		// ﾂﾘｰﾃﾞｰﾀを生成/表示
											// ｸﾞﾘｯﾄﾞﾃﾞｰﾀを生成/表示
	SetGdidDatas(SELECT_ZAIMU, CmnTreeView.Selected);

end;

//-----------------------------------------------------------------------------
// LoadGenkin()
//	< 現金及び現金同等物ｸﾞﾘｯﾄﾞをﾛｰﾄﾞ >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.LoadGenkin;
begin

	nGridSeikakuNo.DropDownRows := 4;		// ｸﾞﾘｯﾄﾞ[科目性格]ｺﾝﾎﾞﾎﾞｯｸｽのﾄﾞﾛｯﾌﾟﾀﾞｳﾝ行を設定
											// ｸﾞﾘｯﾄﾞ[科目性格]用MemData 初期化
	CmnMemDataClass1.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass1.Active	:= TRUE;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_KANSANSAGAKU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_KANSANSAGAKU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_ZOUGENGAKU;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_ZOUGENGAKU;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_KISYUZANDAKA;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_KISYUZANDAKA;
	CmnMemDataClass1.Post;
    CmnMemDataClass1.Append;
	CmnMemDataClass1.FieldByName('nDivision')       .AsInteger  := CHARCODE_KIMATUZANDAKA;
	CmnMemDataClass1.FieldByName('strDescription')  .AsString	:= SEIKAKU_KIMATUZANDAKA;
	CmnMemDataClass1.Post;
											// ｸﾞﾘｯﾄﾞ[正残区分]用MemData 初期化
	CmnMemDataClass2.Active	:= FALSE;		// MemDataをﾘｾｯﾄする
	CmnMemDataClass2.Active	:= TRUE;

	BuildTreeViewItems(SELECT_GENKIN);		// ﾂﾘｰﾃﾞｰﾀを生成/表示
											// ｸﾞﾘｯﾄﾞﾃﾞｰﾀを生成/表示
	SetGdidDatas(SELECT_GENKIN, CmnTreeView.Selected);

end;

//-----------------------------------------------------------------------------
// BuildTreeViewItems()
//	< ﾂﾘｰﾋﾞｭｰを表示する >
//      PARAM   : iKind	    :   活動種別
//                              (SELECT_GENKIN  : 営業活動
//                               SELECT_TOUSI   : 投資活動
//                               SELECT_ZAIMU   : 財務活動
//                               SELECT_GENKIN  : 現金及び現金同等物)
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.BuildTreeViewItems(iKind: Integer);
var
    stItemRec   :   ^TreeViewRec;		        // ｱｲﾃﾑ情報
    iCnt        :   Integer;					// ﾙｰﾌﾟｶｳﾝﾀ
    iClassCode  :   Integer; 					// ﾃﾞｰﾀﾍﾞｰｽ上の活動区分(1-4)
    cNode       :   TTreeNode;					// ﾉｰﾄﾞ
begin

    // 現在表示中の情報ｴﾘｱを解放する
	for iCnt := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec := CmnTreeView.Items[iCnt - 1].Data;
		Dispose(stItemRec);
	end;

	if ( CmnTreeView.Items.Count > 0 ) then
	begin
        // ﾂﾘｰﾉｰﾄﾞを削除する
		CmnTreeView.Items[0].Delete;
	end;

    with CmnTreeQuery do
    begin
	    Close();
    	SQL.Clear();
    	SQL.Add('SELECT SumKbn,SimpleName FROM CFKmkMA  '
    	    +   'WHERE  (MasterKbn  = 11)               '
            +   '  AND  (CfKbn      = :iCfKbn)          '
            +   '  AND  (GCode      = :strGCode)        '
    	    +   '  AND  (RDelKbn    = 0)                '
            +   '  AND  (ClassCode  = :iClassCode)      ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
	    ParamByName('strGCode') .AsInteger  :=  StrToInt64(Trim(m_strCurrentCFCode));

	    iClassCode := 1;
        case iKind of							// 活動種別
            SELECT_EIGYOU:	iClassCode := 1;	// 営業活動
            SELECT_TOUSI:	iClassCode := 2;	// 投資活動
            SELECT_ZAIMU:	iClassCode := 3;	// 財務活動
            SELECT_GENKIN:	iClassCode := 4;	// 現金及び現金同等物
        end;

	    ParamByName('iClassCode')   .AsInteger  :=  iClassCode;
	    Open;

        if ( Status = 0 ) then
        begin
            // ﾚｺｰﾄﾞが存在する時
            if	not EOF then
            begin
                // ｱｲﾃﾑﾚｺｰﾄﾞを生成する
                New(stItemRec);
                // 実在/合計区分を設定
                stItemRec^.iSumKbn := CmnTreeQuery.FieldByName('SumKbn').AsInteger;
                // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞを設定
                stItemRec^.iNCode  := GetNCode(m_strCurrentCFCode,m_iCfKbn);
                stItemRec^.strCode := m_strCurrentCFCode;
                // ｷｬｯｼｭﾌﾛｰ科目名称(簡略名称)を設定
                if ( m_iCorpKbn                         = MEDICALCORP ) and
                   ( FieldByName('SimpleName').AsString = '営業活動'  ) then
                    stItemRec^.strName := '業務活動'
                else
                    stItemRec^.strName := FieldByName('SimpleName').AsString;

                Close();

                // ﾄｯﾌﾟﾉｰﾄﾞに設定
                cNode       :=  CmnTreeView.Items.AddChildObject(nil, stItemRec^.strName, stItemRec);
                // 表示時のﾄｯﾌﾟﾉｰﾄﾞ(営業活動の時はCreateTreeViewItems()内で小計のﾉｰﾄﾞで上書きする)
                m_TopItem   :=  cNode;

                // 表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
                cNode.ImageIndex    :=  0;
                // ﾉｰﾄﾞが選択された場合に表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
                cNode.SelectedIndex	:=  2;

                // 子ﾉｰﾄﾞを生成する
                CreateTreeViewItems(iKind, cNode);

                // ﾉｰﾄﾞを全て展開する
                CmnTreeView.FullExpand;

                // ｽｸﾛｰﾙﾊﾞｰの位置をﾄｯﾌﾟﾉｰﾄﾞに合わせる
                CmnTreeView.TopItem     :=  cNode;
                // 活動種別を選択状態にする
                CmnTreeView.Selected    :=  m_TopItem;
            end;

            Close();
        end
        else
        begin
            fnErrorMessageDsp(CmnTreeQuery);
        end;
    end;

end;

//-----------------------------------------------------------------------------
// CreateTreeViewItems()
//	< ﾂﾘｰﾋﾞｭｰ子ﾉｰﾄﾞを作成する >
//      PARAM   : iKind	    :   活動種別
//                              (SELECT_GENKIN  : 営業活動
//                               SELECT_TOUSI   : 投資活動
//                               SELECT_ZAIMU   : 財務活動
//                               SELECT_GENKIN  : 現金及び現金同等物)
//               cSrcNode	:   ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.CreateTreeViewItems(iKind: Integer; cSrcNode: TTreeNode);
var
    stItemRec   :   ^TreeViewRec;				// ｱｲﾃﾑ情報
	FirstQuery  :   TMQuery;					// ｸｴﾘ
	SecondQuery :   TMQuery;					// ｸｴﾘ
    iClassCode  :   Integer; 					// ﾃﾞｰﾀﾍﾞｰｽ上の活動区分(1-4)
    iSpKmkKbn   :   Integer;					// 特殊区分
	bPassRec    :   Boolean;					// TRUE:基本情報の制限により無視するﾚｺｰﾄﾞ
    stChildRec  :   ^TreeViewRec;				// 子ｱｲﾃﾑ情報
	cNode       :   TTreeNode;					// 子ﾉｰﾄﾞ
begin

	FirstQuery	:= TMQuery.Create(Self);
	SecondQuery	:= TMQuery.Create(Self);

    m_DataModule.SetDBInfoToQuery(m_DBSelect, FirstQuery);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, SecondQuery);

    // 親ﾉｰﾄﾞのｱｲﾃﾑ情報を取出す
    stItemRec := cSrcNode.Data;

    // 親ﾉｰドのCFｺｰﾄﾞと一致する加算先CFｺｰﾄﾞをもつ加算元CFｺｰﾄﾞを取得する
	FirstQuery.Close();
	FirstQuery.SQL.Clear();
	FirstQuery.SQL.Add('SELECT BasedNCode FROM CFKmkTree    '
	                +  'WHERE   (MasterKbn  = 11)           '
                    +  '  AND   (CfKbn      = :iCfKbn)      '
                    +  '  AND   (SumNCode   = :iSumNCode)   '
	                +  'ORDER BY EntNo desc                 ');

	FirstQuery.ParamByName('iCfKbn')    .AsInteger  :=  m_iCfKbn;
	FirstQuery.ParamByName('iSumNCode') .AsFloat    :=  stItemRec^.iNCode;
	FirstQuery.Open;

	if ( FirstQuery.Status <> 0 ) then
	begin
		fnErrorMessageDsp(FirstQuery);
		FirstQuery.Free();
		SecondQuery.Free();
		Exit;
	end;

    // ﾚｺｰﾄﾞの数分繰り返す
	while not FirstQuery.EOF do
	begin
        // 一致するﾏｽﾀ情報を取得する
		SecondQuery.Close();
		SecondQuery.SQL.Clear();
		SecondQuery.SQL.Add('SELECT SumKbn, SimpleName, GCode, SpKmkKbn     '
                        +   'FROM CFKmkMA                                   '
                        +   'WHERE  (Masterkbn  = 11)                       '
                        +   '  AND  (CfKbn      = :iCfKbn)                  '
                        +   '  AND  (NCode      = :iBasedNCode)             '
                        +   '  AND  (RDelKbn    = 0)                        '
                        +   '  AND  (ClassCode  = :iClassCode)              ');

		SecondQuery.ParamByName('iCfKbn')       .AsInteger  :=  m_iCfKbn;
		SecondQuery.ParamByName('iBasedNCode')  .AsInteger  :=  FirstQuery.FieldByName('BasedNCode').AsInteger;

		iClassCode := 1;
		case iKind of						    // 活動種別
    		SELECT_EIGYOU:	iClassCode := 1;    // 営業活動
    		SELECT_TOUSI:	iClassCode := 2;    // 投資活動
	    	SELECT_ZAIMU:	iClassCode := 3;    // 財務活動
    		SELECT_GENKIN:	iClassCode := 4;    // 現金及び現金同等物
		end;

		SecondQuery.ParamByName('iClassCode')   .AsInteger  :=  iClassCode;
		SecondQuery.Open;

		if (SecondQuery.Status <> 0 ) then
		begin
            fnErrorMessageDsp(SecondQuery);
			FirstQuery.Close();
			FirstQuery.Free();
			SecondQuery.Free();
			Exit;
		end;

        // 一致するﾚｺｰﾄﾞがある時
		if not SecondQuery.EOF then
		begin
            // 特殊区分取出し
		    iSpKmkKbn   :=  SecondQuery.FieldByName('SpKmkKbn').AsInteger;
			bPassRec    :=  FALSE;

			case iKind of					// 活動種別
    			SELECT_EIGYOU:	begin		// 営業活動
	    			if	( m_iGnPuKbn5 = RISOKU_PATTERN2 ) and
                       (( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_3000)) )  or
                        ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_3010)) )) then
    				begin
                        // このﾚｺｰﾄﾞを無視する
						bPassRec := TRUE;
	    			end;
    			end;

    			SELECT_TOUSI:	begin		// 投資活動
	    			if ( m_iGnPuKbn5 = RISOKU_PATTERN1 ) and
                       ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_4000)) ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // 自己株式採用なしの時でﾏｽﾀの特殊区分が自己株式の時
					if ( m_iGnPuKbn11 = 0 ) and ( iSpKmkKbn = SPKBN_KABUSIKI ) then
    				begin
						bPassRec := TRUE;
    				end;
	    		end;

		    	SELECT_ZAIMU:	begin		// 財務活動
	    			if (( m_iGnPuKbn5 = RISOKU_PATTERN1 ) and ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_5801)) )  or
    				    ( m_iGnPuKbn5 = RISOKU_PATTERN2 ) and ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_5800)) )) then
    				begin
						bPassRec := TRUE;
	    			end;

                    // 自己株式採用なしの時でﾏｽﾀの特殊区分が自己株式の時
					if ( m_iGnPuKbn11 = 0 ) and ( iSpKmkKbn = SPKBN_KABUSIKI ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // 社債採用なしの時でﾏｽﾀの特殊区分が社債の時
					if ( m_iGnPuKbn12 = 0 ) and ( iSpKmkKbn = SPKBN_SYASAI ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // ﾘｰｽ債権採用なしの時でﾏｽﾀの特殊区分がﾘｰｽ債権の時
					if ( m_iGnPuKbn13 = 0 ) and ( iSpKmkKbn = SPKBN_SAIMU ) then
    				begin
						bPassRec := TRUE;
    				end;
		    	end;
			end;

			if	not bPassRec then
			begin
                // 子ｱｲﾃﾑ情報を生成する
				New(stChildRec);
                // 実在/合計区分を設定
				stChildRec^.iSumKbn := SecondQuery.FieldByName('SumKbn')    .AsInteger;
                // ｷｬｯｼｭﾌﾛ科目ｺｰﾄﾞ、名称(簡略)を取得して保存する
				stChildRec^.iNCode  := FirstQuery.FieldByName('BasedNCode') .AsInteger;
				stChildRec^.strCode := SecondQuery.FieldByName('GCode')     .AsString;
				stChildRec^.strName := SecondQuery.FieldByName('SimpleName').AsString;
                // 子ﾉｰﾄﾞを親ﾉｰﾄﾞに追加する(子ﾉｰﾄﾞの先頭に追加)
				cNode := CmnTreeView.Items.AddChildObjectFirst(cSrcNode, stChildRec^.strName, stChildRec);

                // 科目ｺｰﾄﾞが営業活動(小計)の時はそのﾉｰﾄﾞを表示時のﾄｯﾌﾟﾉｰﾄﾞとして保存しておく
				if ( stChildRec^.strCode = m_strCFSyoukeiCode ) then
					m_TopItem := cNode;

                // 実在科目の時
				if ( SecondQuery.FieldByName('SumKbn').AsInteger = KAMOKU_JITUZAI ) then
	    	    begin
                    // 表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
					cNode.ImageIndex    :=  1;
                    // ﾉｰﾄﾞが選択された場合に表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
					cNode.SelectedIndex	:=  3;
		        end
                // 合計科目の時
		        else
	    	    begin
					cNode.ImageIndex    :=  0;
					cNode.SelectedIndex :=  2;

                    // 合計科目なので更に子ﾉｰﾄﾞを生成する(再起呼出し)
					CreateTreeViewItems(iKind, cNode);
				end;
			end;
		end;

        // 次のﾚｺｰﾄﾞへ移動
		FirstQuery.Next;
	end;

	SecondQuery.Close();
	FirstQuery.Close();
	SecondQuery.Free();
	FirstQuery.Free();

end;

//-----------------------------------------------------------------------------
// SetGdidDatas()
//	< ｸﾞﾘｯﾄﾞを表示する >
//      PARAM   : iKind	    :   活動種別
//                              (SELECT_GENKIN  : 営業活動
//                               SELECT_TOUSI   : 投資活動
//                               SELECT_ZAIMU   : 財務活動
//                               SELECT_GENKIN  : 現金及び現金同等物)
//               cNode	    :   ｸﾞﾘｯﾄﾞに表示するﾂﾘｰのﾉｰﾄﾞ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.SetGdidDatas(iKind: Integer; cNode: TTreeNode);
var
	bSVFlg      :   Boolean;					// m_bDBStopUpdateの保存
    stItemRec   :   ^TreeViewRec;				// ｱｲﾃﾑﾚｺｰﾄﾞ
	FirstQuery  :   TMQuery;					// ｸｴﾘ
	SecondQuery :   TMQuery;					// ｸｴﾘ
    iClassCode  :   Integer; 					// ﾃﾞｰﾀﾍﾞｰｽ上の活動区分(1-4)
    iSpKmkKbn   :   Integer;					// 特殊区分
	bPassRec    :   Boolean;					// TRUE:基本情報の制限により無視するﾚｺｰﾄﾞ
begin

	bSVFlg  :=  m_bDBStopUpdate;

    // TRUE: ﾃﾞｰﾀﾍﾞｰｽを更新しない
	m_bDBStopUpdate         :=  TRUE;
    // MemDataをﾘｾｯﾄする
	CmnMemDataGrid.Active	:=  FALSE;
	CmnMemDataGrid.Active	:=  TRUE;

    // ﾉｰﾄﾞがない時は処理しない
    if ( cNode = nil ) then
    begin
		m_bDBStopUpdate     :=  bSVFlg;
    	Exit;
    end;

    // ﾉｰﾄﾞからｱｲﾃﾑﾚｺｰﾄﾞを取り出す
    stItemRec   :=  cNode.Data;

    // ﾂﾘｰで選択しているﾉｰﾄﾞのｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞを保存する
    m_iNodeCFNCode      :=  stItemRec^.iNCode;
    m_strNodeCFCode     :=  stItemRec^.strCode;

    // 表示中行数をｸﾘｱ
	m_iGridExistRecords	:=  0;


	FirstQuery	:= TMQuery.Create(Self);
	SecondQuery	:= TMQuery.Create(Self);

    m_DataModule.SetDBInfoToQuery(m_DBSelect, FirstQuery);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, SecondQuery);

    // ﾂﾘｰで選択しているﾉｰﾄﾞのCFｺｰﾄﾞと一致する加算先CFｺｰﾄﾞをもつ加算元CFｺｰﾄﾞを取得する
	FirstQuery.Close();
	FirstQuery.SQL.Clear();
	FirstQuery.SQL.Add('SELECT BasedNCode FROM CFKmkTree    '
	                +  'WHERE   (MasterKbn  = 11)           '
                    +   ' AND   (CfKbn      = :iCfKbn)      '
                    +   ' AND   (SumNCode   = :iSumNCode)   '
                    +	'ORDER BY EntNo                     ');

	FirstQuery.ParamByName('iCfKbn')    .AsInteger  :=  m_iCfKbn;
	FirstQuery.ParamByName('iSumNCode') .AsFloat    :=  m_iNodeCFNCode;
	FirstQuery.Open;

	if ( FirstQuery.Status <> 0 ) then
	begin
        fnErrorMessageDsp(FirstQuery);
		SecondQuery.Free();
		FirstQuery.Free();
		m_bDBStopUpdate :=  bSVFlg;
		Exit;
	end;

    // ﾚｺｰﾄﾞの数分繰り返す
	while not FirstQuery.EOF do
	begin
        // 一致するﾏｽﾀ情報を取得する
		SecondQuery.Close();
		SecondQuery.SQL.Clear();
		SecondQuery.SQL.Add('SELECT GCode, Renso, LongName, SimpleName, CharCode,   '
                        +   '   DCKbn, SpKmkKbn, KoteiKbn FROM CFKmkMA              '
		                +   'WHERE  (Masterkbn  = 11)                               '
                        +   '  AND  (CfKbn      = :iCfKbn)                          '
                        +   '  AND  (NCode      = :iBasedNCode)                     '
		                +   '  AND  (RDelKbn    = 0)                                '
                        +   '  AND  (ClassCode  = :iClassCode)                      ');

		SecondQuery.ParamByName('iCfKbn')       .AsInteger  :=  m_iCfKbn;
		SecondQuery.ParamByName('iBasedNCode')  .AsInteger  :=  FirstQuery.FieldByName('BasedNCode').AsInteger;

		iClassCode := 1;
		case iKind of						    // 活動種別
    		SELECT_EIGYOU:	iClassCode := 1;    // 営業活動
    		SELECT_TOUSI:	iClassCode := 2;    // 投資活動
	    	SELECT_ZAIMU:	iClassCode := 3;    // 財務活動
    		SELECT_GENKIN:	iClassCode := 4;    // 現金及び現金同等物
		end;

		SecondQuery.ParamByName('iClassCode')   .AsInteger  :=  iClassCode;
		SecondQuery.Open;

		if ( SecondQuery.Status <> 0 ) then
		begin
            fnErrorMessageDsp(SecondQuery);
			SecondQuery.Free();
			FirstQuery.Close();
			FirstQuery.Free();
			m_bDBStopUpdate :=  bSVFlg;
			Exit;
		end;

        // 一致するﾚｺｰﾄﾞがある時
		if ( SecondQuery.Status = 0 ) and ( not SecondQuery.EOF ) then
		begin
            // 特殊区分取出し
		    iSpKmkKbn   :=  SecondQuery.FieldByName('SpKmkKbn').AsInteger;
			bPassRec    :=  FALSE;

			case iKind of					// 活動種別
    			SELECT_EIGYOU:	begin		// 営業活動
	    			if ( m_iGnPuKbn5 = RISOKU_PATTERN2 ) and
    				  (( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_3000)) )  or
                       ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_3010)) )) then
    				begin
                        // このﾚｺｰﾄﾞを無視する
						bPassRec := TRUE;
	    			end;
    			end;

    			SELECT_TOUSI:	begin		// 投資活動
	    			if ( m_iGnPuKbn5 = RISOKU_PATTERN1 ) and ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_4000)) ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // 自己株式採用なしの時でﾏｽﾀの特殊区分が自己株式の時
					if ( m_iGnPuKbn11 = 0 ) and ( iSpKmkKbn = SPKBN_KABUSIKI ) then
    				begin
						bPassRec := TRUE;
    				end;
	    		end;

		    	SELECT_ZAIMU:	begin		// 財務活動
	    			if (( m_iGnPuKbn5 = RISOKU_PATTERN1 ) and ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_5801)) )  or
    				    ( m_iGnPuKbn5 = RISOKU_PATTERN2 ) and ( SecondQuery.FieldByName('GCode').AsInteger = StrToInt64(Trim(CFCODE_5800)) )) then
    				begin
						bPassRec := TRUE;
	    			end;

                    // 自己株式採用なしの時でﾏｽﾀの特殊区分が自己株式の時
					if ( m_iGnPuKbn11 = 0 ) and ( iSpKmkKbn = SPKBN_KABUSIKI ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // 社債採用なしの時でﾏｽﾀの特殊区分が社債の時
					if ( m_iGnPuKbn12 = 0 ) and ( iSpKmkKbn = SPKBN_SYASAI ) then
    				begin
						bPassRec := TRUE;
    				end;

                    // ﾘｰｽ債権採用なしの時でﾏｽﾀの特殊区分がﾘｰｽ債権の時
					if ( m_iGnPuKbn13 = 0 ) and ( iSpKmkKbn = SPKBN_SAIMU ) then
    				begin
						bPassRec := TRUE;
    				end;
		    	end;
			end;

			if	not bPassRec then
			begin
                // MemDataへのﾚｺｰﾄﾞ追加を開始
				CmnMemDataGrid.Append;
				CmnMemDataGrid.FieldByName('iNCode')        .AsFloat	:= FirstQuery.FieldByName('BasedNCode') .AsInteger;
				CmnMemDataGrid.FieldByName('strCode')       .AsInteger	:= SecondQuery.FieldByName('GCode')     .AsInteger;
				CmnMemDataGrid.FieldByName('strRenso')      .AsString	:= SecondQuery.FieldByName('Renso')     .AsString;
				CmnMemDataGrid.FieldByName('strName')       .AsString	:= SecondQuery.FieldByName('LongName')  .AsString;
				CmnMemDataGrid.FieldByName('strSimpleName') .AsString   := SecondQuery.FieldByName('SimpleName').AsString;
				CmnMemDataGrid.FieldByName('iKoteiKbn')     .AsInteger  := SecondQuery.FieldByName('KoteiKbn')  .AsInteger;

                // [科目性格][残高区分]をｾｯﾄ
				if ( not SecondQuery.FieldByName('CharCode').IsNull     ) and
                   ( SecondQuery.FieldByName('CharCode').AsInteger <> 0 ) then
				begin
					CmnMemDataGrid.FieldByName ('nAdoptData01').AsInteger := SecondQuery.FieldByName('CharCode').AsInteger;

					if ( SecondQuery.FieldByName('CharCode').AsInteger = CHARCODE_BSZANDAKA ) then
					begin
						if ( not SecondQuery.FieldByName('DCKbn').IsNull ) then
						begin
                            // (ﾃﾞｰﾀﾍﾞｰｽの設定値は0:借方 1:貸方 ｸﾞﾘｯﾄﾞ内の表示は1:借方 2:貸方)
							CmnMemDataGrid.FieldByName ('nAdoptData02').AsInteger := (SecondQuery.FieldByName('DCKbn').AsInteger + 1);
						end;
					end;
				end;

                // ﾚｺｰﾄﾞを書き込んで表示中行数をｱｯﾌﾟ
				CmnMemDataGrid.Post;
				m_iGridExistRecords := m_iGridExistRecords + 1;
			end;
		end;

        // 次のﾚｺｰﾄﾞへ移動
		FirstQuery.Next;
	end;

	SecondQuery.Close();
	FirstQuery.Close();
	SecondQuery.Free();
	FirstQuery.Free();

	m_bDBStopUpdate := bSVFlg;

    // 先頭ﾚｺｰﾄﾞに移動する
	CmnMemDataGrid.First;
	CmnGrid.FocusedColumn := INDEX_CODE;

    // 小計（直接法）なら、追加不可
    // <012> MOD start
	//if ( m_strNodeCFCode = CFCODE_SYOUKEI_CHOKUSETU ) then
    if (Format('%.10d', [StrToInt64(Trim(m_strNodeCFCode))]) = CFCODE_SYOUKEI_CHOKUSETU ) then
    // <012> MOD end
		CmnGrid.Options	:= CmnGrid.Options - ([egoCanAppend]+[egoCanInsert])
	else
		CmnGrid.Options	:= CmnGrid.Options + ([egoCanAppend]+[egoCanInsert]);

end;

//-----------------------------------------------------------------------------
// CheckMasterTreeInsertValid()
//	< 移動元と移動先の正当性を確認する >
//      PARAM   : strCodeSrc    :   移動元のｺｰﾄﾞ
//                strCodeDst	:   移動先のｺｰﾄﾞ
//      VAR     :
//      RETURN  : TRUE:移動可能 FALSE:移動不可能
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.CheckMasterTreeInsertValid(strCodeSrc: String; strCodeDst: String): Boolean;
var
    iCnt        :   Integer;		// ﾙｰﾌﾟｶｳﾝﾀ
    cNode       :   TTreeNode;		// ﾂﾘｰのﾉｰﾄﾞ
    stItemRec   :   ^TreeViewRec;   // ｱｲﾃﾑﾚｺｰﾄﾞ
begin

    // 全てのﾉｰﾄﾞをﾁｪｯｸする
	for iCnt := 1 to CmnTreeView.Items.Count do
    begin
        // ﾉｰﾄﾞよりｱｲﾃﾑﾚｺｰﾄﾞを取り出す
		stItemRec   :=  CmnTreeView.Items[iCnt - 1].Data;

        // 移動先のｺｰﾄﾞと一致した時
		if ( stItemRec^.strCode = strCodeDst ) then
		begin
			cNode       :=  CmnTreeView.Items[iCnt - 1];
			stItemRec   :=  cNode.Data;

            // 移動先が実在科目の時
            if ( stItemRec^.iSumKbn = KAMOKU_JITUZAI ) then
			begin
                // 更に移動先ﾉｰﾄﾞの親ﾉｰﾄﾞを取り出す
				cNode       :=  cNode.Parent;
				stItemRec   :=  cNode.Data;
			end;

            // 移動元が移動先の親ﾉｰﾄﾞになっている場合は移動不可にする
			while (TRUE) do
			begin
				if ( stItemRec^.strCode = strCodeSrc ) then
				begin
					Result  := FALSE;
					Exit;
				end;

                // 更にその親ﾉｰﾄﾞを取出す
				cNode := cNode.Parent;

                // 親がﾄｯﾌﾟﾚﾍﾞﾙの時は処理を抜ける
				if ( cNode = nil ) then break
                else
                    // 親ﾉｰﾄﾞのｱｲﾃﾑﾚｺｰﾄﾞを取り出してﾁｪｯｸを続ける
					stItemRec := cNode.Data;
            end;
        end;
    end;

    // 移動可能
    Result  := TRUE;

end;

//-----------------------------------------------------------------------------
// MoveTreeRecord()
//	< 加算体系ﾃｰﾌﾞﾙを移動(更新)する >
//      PARAM   : strCodeSrc		:   移動元内部ｺｰﾄﾞ
//                strCodeSrcParent  :   移動元親内部ｺｰﾄﾞ
//                strCodeDst		:   移動先内部ｺｰﾄﾞ
//                strCodeDstParent  :   移動元親内部ｺｰﾄﾞ
//                iSumKbn			:   移動先実在合計区分
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.MoveTreeRecord(iNCodeSrc,iNCodeSrcParent: Extended;
                                        iNCodeDst,iNCodeDstParent: Extended; iSumKbn: Integer);
var
	dqMasterTree    :   TMQuery;    // 科目加算体系ﾏｽﾀ用ｸｴﾘ
	iEntryNo        :   Integer;	// 登録番号
	iNCode          :   Extended;	// 加算先内部ｺｰﾄﾞ
begin
	// -----<010> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<010> Add-Ed-----

	dqMasterTree := TMQuery.Create(Self);

    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterTree);
    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_DataModule.BeginTran(m_DBSelect);

    with dqMasterTree do
    begin
	    Close();
	    SQL.Clear();
    	SQL.Add('DELETE FROM CFKmkTree              '
    	    +   'WHERE (MasterKbn  = 11)            '
            +   '  AND (CfKbn      = :iCfKbn)       '
            +   '  AND (SumNCode   = :iDstNCode)    '
            +   '  AND (BasedNCode = :iSrcNCode)    ');

	    ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
        ParamByName('iDstNCode').AsFloat    :=  iNCodeSrcParent;
	    ParamByName('iSrcNCode').AsFloat    :=  iNCodeSrc;

	    ExecSQL;

        // ﾚｺｰﾄﾞの削除に失敗したのでﾛｰﾙﾊﾞｯｸする
    	if ( Status <> 0 ) then
    	begin
            fnErrorMessageDsp(dqMasterTree);
    		m_DataModule.Rollback(m_DBSelect);
    		Free();
    		Exit;
    	end;

        // 移動先が実在科目の時
        if ( iSumKbn = KAMOKU_JITUZAI ) then
    	begin
            // 登録No.を取得する
    		iEntryNo    :=  GetTreeEntryNo(dqMasterTree, iNCodeDst, iNCodeDstParent);

    		if ( iEntryNo = -1 ) then
                iEntryNo    :=  GetTreeEntryNo(dqMasterTree, iNCodeDst, iNCodeDstParent);

            // 加算先ｺｰﾄﾞを設定(移動先の親ﾉｰﾄﾞの科目ｺｰﾄﾞ)
		    iNCode  :=  iNCodeDstParent;
	    end
        // 移動先が合計科目
    	else
    	begin
            // 登録No.を取得する
    		iEntryNo    :=  GetTreeEntryNoFinal(dqMasterTree, iNCodeDst);
            // 加算先ｺｰﾄﾞを設定(移動先の科目ｺｰﾄﾞ)
    		iNCode      :=  iNCodeDst;
    	end;

	    Close();
    	SQL.Clear();
    	SQL.Add('INSERT INTO CFKmkTree (                            '
            +   '   MasterKbn, CfKbn, SumNCode, EntNo, BasedNCode   '
            +   '  ,UpdTantoNCode                                   ' // <009>
            +   ') VALUES (                                         '
    	    +   '   11, :iCfKbn, :iNCode, :iEntryNo, :iBasedNCode   '
            +   '  ,:iUpdTantoNCode)                                '); // <009>

    	ParamByName('iCfKbn')       .AsInteger  :=  m_iCfKbn;
    	ParamByName('iNCode')       .AsFloat    :=  iNCode;
	    ParamByName('iEntryNo')     .AsInteger  :=  iEntryNo;
	    ParamByName('iBasedNCode')  .AsFloat    :=  iNCodeSrc;
	    ParamByName('iUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
    	ExecSQL;

        // ﾚｺｰﾄﾞの追加に失敗したのでﾛｰﾙﾊﾞｯｸする
    	if ( Status <> 0 ) then
    	begin
            fnErrorMessageDsp(dqMasterTree);
    		m_DataModule.Rollback(m_DBSelect);
    		Free();
    		Exit;
    	end;

        // ﾚｺｰﾄﾞの移動(削除/追加)に成功したのでｺﾐｯﾄする
        m_DataModule.Commit(m_DBSelect);
    end;

    dqMasterTree.Close();
	dqMasterTree.Free();

	// -----<010> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<010> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// GetTreeEntryNo()
//	< 加算体系ﾏｽﾀ 登録No.を取得する >
//      PARAM   : dqMasterTree      :   加算体系ﾏｽﾀ用ｸｴﾘｰ
//                iNCode		    :   移動先内部ｺｰﾄﾞ  (実在科目)
//                iNCodeParent		:   移動先親内部ｺｰﾄﾞ(合計科目)
//      VAR     :
//      RETURN  : 登録No.
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetTreeEntryNo(dqMasterTree: TMQuery; iNCode, iNCodeParent: Extended): Integer;
var
	iEntryNo    :   Integer;    // 返却する登録No.
	iEntryNoCur :   Integer;	// 移動先ｺｰﾄﾞの登録No.
	iEntryNoPre :   Integer;	// 移動先ｺｰﾄﾞの登録No.の1つ前(小さい)の登録No.
begin

    with dqMasterTree do
    begin
        // 移動先の登録No.を取得する
        Close();
	    SQL.Clear;
    	SQL.Add('SELECT EntNo FROM CFKmkTree        '
    	    +   'WHERE  (MasterKbn  = 11)           '
            +   '  AND  (CfKbn      = :iCfKbn)      '
            +   '  AND  (SumNCode   = :iDstNCode)   '
            +   '  AND  (BasedNCode = :iSrcNCode)   ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('iDstNCode').AsFloat    :=  iNCodeParent;
    	ParamByName('iSrcNCode').AsFloat    :=  iNCode;
    	Open();

    	if ( Status <> 0 ) then
    	begin
    		Result := -1;
            Exit;
    	end;

    	iEntryNoCur :=  FieldByName ('EntNo').AsInteger;

        // 移動先の登録No.の1つ前の(小さい)No.を取得する
    	Close();
    	SQL.Clear();
    	SQL.Add('SELECT EntNo FROM CFKmkTree        '
    	    +   'WHERE  (MasterKbn = 11)            '
            +   '  AND  (CfKbn     = :iCfKbn)       '
            +   '  AND  (SumNCode  = :iDstNCode)    '
            +   '  AND  (EntNo     < :iEntryNo)     '
    	    +   'ORDER BY EntNo DESC                ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('iDstNCode').AsFloat    :=  iNCodeParent;
    	ParamByName('iEntryNo') .AsInteger  :=  iEntryNoCur;
    	Open();

    	if ( Status <> 0 ) then
    	begin
    		Result := -1;
            Exit;
    	end;

        // 該当ﾚｺｰﾄﾞがある時
    	if ( not dqMasterTree.EOF ) then
    		iEntryNoPre :=  FieldByName ('EntNo').AsInteger
        // 該当ﾚｺｰﾄﾞがない時
    	else
    		iEntryNoPre :=  0;

    end;

	dqMasterTree.Close();

    // 中間のNo.を登録No.とする
	iEntryNo    :=  iEntryNoPre + (iEntryNoCur - iEntryNoPre) div 2;

    // 正当な登録No.を生成できなかった時は加算体系ﾏｽﾀを再作成する
	if ( iEntryNo <= iEntryNoPre ) or
       ( iEntryNo >= iEntryNoCur ) then
	begin
		RewriteTreeRecords(iNCodeParent);
		iEntryNo    :=  -1;
	end;

    // 登録No.を返却する
	Result  :=  iEntryNo;

end;

//-----------------------------------------------------------------------------
// GetTreeEntrRewriteTreeRecordsyNo()
//	< 加算体系ﾏｽﾀ 登録No.再採番する >
//      PARAM   : iNCodeParent		:   移動先親内部ｺｰﾄﾞ(合計科目)
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.RewriteTreeRecords(iNCodeParent: Extended);
var
	dqMasterTreeSelect  :   TMQuery;    // 抽出用ｸｴﾘ
	dqMasterTreeUpdate  :   TMQuery;	// 更新用ｸｴﾘ
	iCnt                :   Integer;	// ｶｳﾝﾀ
begin
	// -----<010> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<010> Add-Ed-----

	iCnt    :=  1;

	dqMasterTreeSelect  :=  TMQuery.Create(Self);
	dqMasterTreeUpdate  :=  TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterTreeSelect);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterTreeUpdate);

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_DataModule.BeginTran(m_DBSelect);

    // 再採番する合計科目ｺｰﾄﾞを加算先ｺｰﾄﾞにしているﾚｺｰﾄﾞを抽出する
	dqMasterTreeSelect.Close();
	dqMasterTreeSelect.SQL.Clear();
	dqMasterTreeSelect.SQL.Add('SELECT SumNCode, BasedNCode FROM CFKmkTree      '
                            +  'WHERE (MasterKbn = 11) AND (CfKbn = :iCfKbn)    '
                            +  '  AND (SumNCode  = :iDstNCode)                  '
                            +  'ORDER BY EntNo                                  ');

	dqMasterTreeSelect.ParamByName('iCfKbn')    .AsInteger  :=  m_iCfKbn;
	dqMasterTreeSelect.ParamByName('iDstNCode') .AsFloat    :=  iNCodeParent;
	dqMasterTreeSelect.Open();

	if ( dqMasterTreeSelect.Status <> 0 ) then
	begin
        fnErrorMessageDsp(dqMasterTreeSelect);
		dqMasterTreeSelect.Free();
		dqMasterTreeUpdate.Free();
	end;

	while ( not dqMasterTreeSelect.EOF ) do
	begin
        // 既存登録No.とぶつかる可能性があるのでここではﾏｲﾅｽ値で更新しておく
		dqMasterTreeUpdate.Close();
		dqMasterTreeUpdate.SQL.Clear();
		dqMasterTreeUpdate.SQL.Add('UPDATE CFKmkTree SET EntNo = :iEntryNo, '
                                +  'UpdTantoNCode       = :iUpdTantoNCode   ' // <009>
                                +  'WHERE   (MasterKbn  = 11)               '
                                +  '  AND   (CfKbn      = :iCfKbn)          '
                                +  '  AND   (SumNCode   = :iDstNCode)       '
                                +  '  AND   (BasedNCode = :iSrcNCode)       ');

		dqMasterTreeUpdate.ParamByName('iCfKbn')    .AsInteger  :=  m_iCfKbn;
		dqMasterTreeUpdate.ParamByName('iDstNCode') .AsFloat    :=  dqMasterTreeSelect.FieldByName('SumNCode')  .AsFloat;
		dqMasterTreeUpdate.ParamByName('iSrcNCode') .AsFloat    :=  dqMasterTreeSelect.FieldByName('BasedNCode').AsFloat;
		dqMasterTreeUpdate.ParamByName ('iEntryNo') .AsInteger  :=  iCnt * -100;
    	dqMasterTreeUpdate.ParamByName('iUpdTantoNCode').AsFloat := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
		dqMasterTreeUpdate.ExecSQL();

        // ﾚｺｰﾄﾞの更新に失敗したのでﾛｰﾙﾊﾞｯｸする
		if ( dqMasterTreeUpdate.Status <> 0 ) then
		begin
            fnErrorMessageDsp(dqMasterTreeUpdate);
			m_DataModule.Rollback(m_DBSelect);
			dqMasterTreeSelect.Free();
			dqMasterTreeUpdate.Free();
			Exit;
		end;

		iCnt := iCnt + 1;

        // 次のﾚｺｰﾄﾞに移動する
		dqMasterTreeSelect.NEXT;
	end;

	dqMasterTreeSelect.Close();

    // ﾏｲﾅｽ値で更新したﾚｺｰﾄﾞを再度正常値で更新する
	dqMasterTreeUpdate.Close();
	dqMasterTreeUpdate.SQL.Clear();
	dqMasterTreeUpdate.SQL.Add('UPDATE CFKmkTree SET EntNo = EntNo * -1,'
                            +  'UpdTantoNCode      = :iUpdTantoNCode    ' // <009>
                            +  'WHERE   (MasterKbn = 11)                '
                            +  '  AND   (CfKbn     = :iCfKbn)           '
                            +  '  AND   (SumNCode  = :iDstExNCode)      ');

	dqMasterTreeUpdate.ParamByName('iCfKbn')        .AsInteger  :=  m_iCfKbn;
	dqMasterTreeUpdate.ParamByName('iDstExNCode')   .AsFloat    :=  iNCodeParent;
    dqMasterTreeUpdate.ParamByName('iUpdTantoNCode').AsFloat    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
	dqMasterTreeUpdate.ExecSQL();

    // ﾚｺｰﾄﾞの更新に失敗したのでﾛｰﾙﾊﾞｯｸする
	if ( dqMasterTreeUpdate.Status <> 0 ) then
	begin
        fnErrorMessageDsp(dqMasterTreeUpdate);
		m_DataModule.Rollback(m_DBSelect);
		dqMasterTreeSelect.Free();
		dqMasterTreeUpdate.Free();
		Exit;
	end;

    // ﾚｺｰﾄﾞの更新に成功したのでｺﾐｯﾄする
    m_DataModule.Commit(m_DBSelect);

    dqMasterTreeSelect.Close();
    dqMasterTreeUpdate.Close();
	dqMasterTreeSelect.Free();
	dqMasterTreeUpdate.Free();

	// -----<010> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<010> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// GetTreeEntryNoFinal()
//	< 加算体系ﾏｽﾀ 登録No.を取得する >
//      PARAM   : dqMasterTree  :   加算体系ﾏｽﾀ用ｸｴﾘｰ
//                iDstNCode     :   移動先内部ｺｰﾄﾞ(合計科目)
//      VAR     :
//      RETURN  : 登録No.
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetTreeEntryNoFinal(dqMasterTree: TMQuery; iDstNCode: Extended): Integer;
var
	iEntryNo    :   Integer;
begin

    with dqMasterTree do
    begin
        // 移動先の合計科目ｺｰﾄﾞを加算先にしているﾚｺｰﾄﾞを抽出する
	    Close();
    	SQL.Clear;
    	SQL.Add('SELECT EntNo FROM CFKmkTree        '
    	    +   'WHERE  (MasterKbn = 11)            '
            +   '  AND  (CfKbn     = :iCfKbn)       '
            +   '  AND  (SumNCode  = :iDstNCode)    '
    	    +   'ORDER BY EntNo DESC                ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('iDstNCode').AsFloat    :=  iDstNCode;
    	Open();

        // 該当ﾚｺｰﾄﾞがある時
    	if ( dqMasterTree.Status = 0 ) and ( not dqMasterTree.EOF ) then
    		iEntryNo    :=  FieldByName('EntNo').AsInteger
        // 該当ﾚｺｰﾄﾞがない時
    	else
    		iEntryNo    :=  0;
    end;

    dqMasterTree.Close();

    // 100番単位に登録No.をｾｯﾄする
    Result  :=  (iEntryNo + 100) div 100 * 100;

end;

//-----------------------------------------------------------------------------
// CheckMasterDataInsertValid()
//	< 指定するｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞが追加可能かをﾁｪｯｸする >
//      PARAM   : strCode	:   ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
//                iRecKbn	:   ﾚｺｰﾄﾞ区分
//                              RECKBN_NORMAL	(正規ﾚｺｰﾄﾞ)
//                              RECKBN_DELETE	(削除ﾚｺｰﾄﾞ)
//      VAR     :
//      RETURN  : TRUE:追加可能(未登録) FALSE:追加不可能(既に登録済み)
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.CheckMasterDataInsertValid(strCode: String; iRecKbn: Integer): Boolean;
var
    dqMasterData    :   TMQuery;
begin

    dqMasterData    :=  TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterData);

    with dqMasterData do
    begin
        // 一致する科目ｺｰﾄﾞが存在するか
	    Close();
	    SQL.Clear();
	    SQL.Add('SELECT * FROM CFKmkMA ');

        // 正規ﾚｺｰﾄﾞで検索する場合、要約会計科目ｺｰﾄﾞとの重複もNG
    	if (iRecKbn = RECKBN_NORMAL ) then
    	begin
            // 正規のﾚｺｰﾄﾞが存在した場合⇒追加/更新ﾓｰﾄﾞ
            SQL.Add('WHERE  (Masterkbn = 11 or Masterkbn = 12)  '
                +   '  AND  (CfKbn     = :iCfKbn)               '
                +   '  AND  (RDelKbn   = :iRecKbn)              '
                +   '  AND  (GCode     = :strCode)              ');
    	end
    	else
    	begin
            // 正規ﾚｺｰﾄﾞ区分は参照せずに、同一ｺｰﾄﾞが存在するか否か判断する。
            // 存在しない場合         ⇒新規追加ﾓｰﾄﾞ
            // 削除ﾚｺｰﾄﾞが存在した場合⇒再利用ﾓｰﾄﾞ
    		SQL.Add('WHERE  (Masterkbn = 11)        '
                +   '  AND  (CfKbn     = :iCfKbn)   '
                +   '  AND  (RDelKbn   = :iRecKbn)  '
                +   '  AND  (GCode     = :strCode)  ');
    	end;

        ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
        ParamByName('iRecKbn')  .AsInteger  :=  iRecKbn;
        ParamByName('strCode')  .AsInteger  :=  StrToInt64(Trim(strCode));
    	Open();

        // 既に登録済み
    	if ( Status <> 0 ) or ( not EOF ) then
    		Result  :=  FALSE
        // 未登録のため新規登録が可能
    	else
    		Result  :=  TRUE;

    end;

	dqMasterData.Close();
	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// SetDeleteButtonCondition()
//	< ﾂｰﾙﾊﾞｰの削除ﾎﾞﾀﾝの有効/無効を判定し削除ﾎﾞﾀﾝを制御する >
//      PARAM   : strCode	: ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞﾞ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.SetDeleteButtonCondition(strCode: String);
var
    dqMasterData    :   TMQuery;
begin

    dqMasterData    :=  TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterData);

    with dqMasterData do
    begin
        // 該当ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞの固定区分を取得する
	    Close();
	    SQL.Clear();
    	SQL.Add('SELECT KoteiKbn FROM CFKmkMA   '
            +   'WHERE  (Masterkbn = 11)        '
            +   '  AND  (CfKbn     = :iCfKbn)   '
            +   '  AND  (GCode     = :strCode)  '
            +   '  AND  (RDelKbn   = 0)         ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('strCode')  .AsInteger  :=  StrToInt64(Trim(strCode));
    	Open();

    	if ( Status <> 0 ) or ( not EOF ) then
    	begin
            // 固定区分が固定の時は削除ﾎﾞﾀﾝ無効
    		if ( dqMasterData.FieldByName('KoteiKbn').AsInteger = KOTEIKBN_KOTEI ) then
                    CmnToolbarButtonDelete.Enabled := FALSE
    		else    CmnToolbarButtonDelete.Enabled := m_cJNTArea.IsDelete;
    	end
        // ﾚｺｰﾄﾞが存在しない時
    	else
    	begin
    		CmnToolbarButtonDelete.Enabled := FALSE
    	end;
    end;

	dqMasterData.Close();
	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// UpdateDatabase()
//	< 加算体系ﾏｽﾀﾃｰﾌﾞﾙ及び科目基本ﾏｽﾀﾃｰﾌﾞﾙへ追加/更新を行う >
//      PARAM   : MasterData    :   追加/更新するﾃﾞｰﾀ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.UpdateDatabase(Master: MasterData);
var
    strCode         :   String;	    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ<005>
	iUpdateMode     :   Integer;	// 更新/追加ﾓｰﾄﾞ   <005>
begin
	// -----<010> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<010> Add-Ed-----

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_DataModule.BeginTran(m_DBSelect);

    // 内部ｺｰﾄﾞの取得
// <005> 新規に内部ｺｰﾄﾞは取得しない    Master.iNCode   :=  GetNewNCode;
//       以下の処理でﾓｰﾄﾞにより内部ｺｰﾄﾞを取得する

// ↓↓↓<005>
    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	strCode :=  Master.strCode;

    // 科目ｺｰﾄﾞが正規ﾚｺｰﾄﾞで存在するかﾁｪｯｸする
	if ( not CheckMasterDataInsertValid(strCode, RECKBN_NORMAL) ) then
	begin
        // 既にﾃﾞｰﾀﾍﾞｰｽ上に存在する科目ｺｰﾄﾞなので更新ﾓｰﾄﾞを設定
		iUpdateMode     :=  MODE_UPDATE;
        // 既存の削除ﾃﾞｰﾀの内部ｺｰﾄﾞを取得
        Master.iNCode   :=  GetNCode(strCode,m_iCfKbn);
	end
	else
	begin
        // 科目ｺｰﾄﾞが削除ﾚｺｰﾄﾞで存在するかﾁｪｯｸする
		if ( not CheckMasterDataInsertValid(strCode, RECKBN_DELETE) ) then
		begin
            // 再利用ﾓｰﾄﾞを設定
			iUpdateMode     :=  MODE_REUSED;
            // 既存の削除ﾃﾞｰﾀの内部ｺｰﾄﾞを取得
            Master.iNCode   :=  GetNCode(strCode,m_iCfKbn);
		end
        // 正規ﾚｺｰﾄﾞにも削除ﾚｺｰﾄﾞにもない新規ﾚｺｰﾄﾞ
		else
		begin
            // 挿入(追加)ﾓｰﾄﾞを設定
			iUpdateMode     :=  MODE_INSERT;
            Master.iNCode   :=  GetNewNCode;
		end;
	end;
// ↑↑↑<005>
(* <010> Del-St
    // 加算体系ﾏｽﾀを追加/更新する
	if ( not UpdateTreeRecord(Master) ) then
	begin
        // 失敗した時はﾄﾗﾝｻﾞｸｼｮﾝを破棄する
		m_DataModule.Rollback(m_DBSelect);
		Exit;
	end;
<010> Del-Ed *)
    // 科目基本ﾏｽﾀを追加/更新する
// <005>	if ( not UpdateMasterRecord(Master) ) then
    if ( not UpdateMasterRecord(Master,iUpdateMode) ) then  // <005>
	begin
        // 失敗した時はﾄﾗﾝｻﾞｸｼｮﾝを破棄する
		m_DataModule.Rollback(m_DBSelect);
		Exit;
	end;

	// -----<010> Add-St-----
	// 加算体系ﾏｽﾀを追加/更新する
	if ( not UpdateTreeRecord(Master) ) then
	begin
		// 失敗した時はﾄﾗﾝｻﾞｸｼｮﾝを破棄する
		m_DataModule.Rollback(m_DBSelect);
		Exit;
	end;
	// -----<010> Add-Ed-----

    // ﾚｺｰﾄﾞの更新に成功したのでｺﾐｯﾄする
    m_DataModule.Commit(m_DBSelect);

	// -----<010> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<010> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// UpdateTreeRecord()
//	< 加算体系ﾃｰﾌﾞﾙを更新する >
//      PARAM   : MasterData    :   追加/更新するﾃﾞｰﾀ
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.UpdateTreeRecord(Master: MasterData): Boolean;
var
	dqMasterTree    :   TMQuery;    // 科目加算体系ﾏｽﾀ用ｸｴﾘ
	iEntryNo        :   Integer;	// 登録番号
	strCode         :   String;		// ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
begin

	dqMasterTree := TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterTree);

    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	strCode := Master.strCode;

    with dqMasterTree do
    begin
        // 更新するﾚｺｰﾄﾞが存在するかﾁｪｯｸする
    	Close();
    	SQL.Clear();
    	SQL.Add('SELECT * FROM CFKmkTree            '
    	    +   'WHERE  (MasterKbn  = 11)           '
            +   '  AND  (CfKbn      = :iCfKbn)      '
            +   '  AND  (SumNCode   = :DstNCode)    '
            +   '  AND  (BasedNCode = :SrcNCode)    ');

    	ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('DstNCode') .AsFloat    :=  Master.iParentNCode;
    	ParamByName('SrcNCode') .AsFloat    :=  Master.iNCode;
    	Open();

    	if ( Status <> 0 ) then
    	begin
            fnErrorMessageDsp(dqMasterTree);
    		Free();
    		Result  := FALSE;
    		Exit;
    	end;

        // ﾚｺｰﾄﾞが存在する
        // 該当ﾚｺｰﾄﾞは既に存在するのでこれ以降は処理せず、正常とする
    	if ( not EOF ) then
        begin
    		Close();
    		Free();
       	    Result := TRUE;
           	Exit;
        end;

    	Close();
        // 登録No.を取得する
    	iEntryNo    :=  GetTreeEntryNoFinal(dqMasterTree, Master.iParentNCode);

        // 移動先での加算体系ﾚｺｰﾄﾞを追加する
    	Close();
    	SQL.Clear();
    	SQL.Add('INSERT INTO CFKmkTree (                            '
            +   '   MasterKbn, CfKbn, SumNCode, EntNo, BasedNCode,  '
            +   '   UpdTantoNCode                                   ' // <009>
            +   ') VALUES (                                         '
            +   '   11, :iCfKbn, :iNCode, :iEntryNo, :iBasedNCode,  '
            +   '   :iUpdTantoNCode)                                '); // <009>

    	ParamByName('iCfKbn')       .AsInteger  :=  m_iCfKbn;
    	ParamByName('iNCode')       .AsFloat    :=  Master.iParentNCode;
    	ParamByName('iEntryNo')     .AsInteger  :=  iEntryNo;
    	ParamByName('iBasedNCode')  .AsFloat    :=  Master.iNCode;
	    ParamByName('iUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
    	ExecSQL();

    	if ( Status <> 0 ) then		// ｴﾗｰ
        begin
            fnErrorMessageDsp(dqMasterTree);
    		Close();
    		Free();
    		Result  := FALSE;
    		Exit;
    	end;
    end;

    dqMasterTree.Close();
    dqMasterTree.Free();

    // 正常終了
	Result := TRUE;

end;

//-----------------------------------------------------------------------------
// UpdateMasterRecord()
//	< 科目基本ﾏｽﾀﾃｰﾌﾞﾙを更新する >
//      PARAM   : MasterData    :   追加/更新するﾃﾞｰﾀ
//              : nUpdateMode   :   ﾚｺｰﾄﾞ区分
//                                  MODE_INSERT	(新規挿入ﾓｰﾄﾞ)
//                                  MODE_UPDATE	(追加/更新ﾓｰﾄﾞ)
//                                  MODE_REUSED（再利用ﾓｰﾄﾞ)
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常
//      MEMO    :
//-----------------------------------------------------------------------------
// <005> function TJNTCRP009003f.UpdateMasterRecord(Master: MasterData): Boolean;
function TJNTCRP009003f.UpdateMasterRecord(Master: MasterData; nUpdateMode: Integer): Boolean;    // <005>
var
	strCode         :   String;	    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
// <005>	iUpdateMode     :   Integer;	// 更新/追加ﾓｰﾄﾞ
	dqMasterData    :   TMQuery;	// 科目基本ﾏｽﾀ用ｸｴﾘ
begin

    // ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
	strCode :=  Master.strCode;

	//<DKAI>↓
	Master.strRenso 		:= fnDelCRLF(Master.strRenso);
	Master.strName 			:= fnDelCRLF(Master.strName);
	Master.strSimpleName	:= fnDelCRLF(Master.strSimpleName);
	//<DKAI>↑
(*

    // 科目ｺｰﾄﾞが正規ﾚｺｰﾄﾞで存在するかﾁｪｯｸする
	if ( not CheckMasterDataInsertValid(strCode, RECKBN_NORMAL) ) then
	begin
        // 既にﾃﾞｰﾀﾍﾞｰｽ上に存在する科目ｺｰﾄﾞなので更新ﾓｰﾄﾞを設定
		iUpdateMode :=  MODE_UPDATE;
	end
	else
	begin
{
        // 科目ｺｰﾄﾞが削除ﾚｺｰﾄﾞで存在するかﾁｪｯｸする
		if ( not CheckMasterDataInsertValid(strCode, RECKBN_DELETE) ) then
		begin
            // 更新ﾓｰﾄﾞを設定
			iUpdateMode := MODE_UPDATE;
		end
        // 正規ﾚｺｰﾄﾞにも削除ﾚｺｰﾄﾞにもない新規ﾚｺｰﾄﾞ
		else
		begin
            // 挿入(追加)ﾓｰﾄﾞを設定
			iUpdateMode := MODE_INSERT;
		end;
}
        // 挿入(追加)ﾓｰﾄﾞを設定
        iUpdateMode := MODE_INSERT;
end;
*) // <005>
// ↑ここで判断しない。CFKmkTree更新前に行う。


	dqMasterData    :=  TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterData);

    // 挿入(追加)ﾓｰﾄﾞの時
// <005>    if ( iUpdateMode = MODE_INSERT ) then

// --------------------------------------
//  新規挿入モード
// --------------------------------------
    if ( nUpdateMode = MODE_INSERT ) then
    begin
        with dqMasterData do
        begin
		    Close();
		    SQL.Clear();
    		SQL.Add('INSERT INTO CFKmkMA (                                  '
    		    +   '   MasterKbn, CfKbn, SumKbn, RdelKbn, NCode, GCode,    '
                +   '   Renso, LongName, SimpleName, ClassCode, CharCode,   '
                +   '   DCKbn, SubTotal, KoteiKbn, SubCode,                 '
                +   '   UpdTantoNCode                                       ' // <009>
                +   ') VALUES (                                             '
                +   '   11, :iCfKbn, :SumKbn, 0, :iNCode, :strCode,         '
                +   '   :strRenChar, :strName, :strSimpleName, :iClassCode, '
                +   '   :iCharCode, :iDCKbn, :iSubTotal, 0, 0,              '
                +   '   :iUpdTantoNCode)                                    '); // <009>

    		ParamByName('iCfKbn')       .AsInteger  :=  m_iCfKbn;
    		ParamByName('SumKbn')       .AsInteger  :=  KAMOKU_JITUZAI;
    		ParamByName('iNCode')       .AsFloat    :=  Master.iNCode;
    		ParamByName('strCode')      .AsInteger  :=  StrToInt64(Trim(strCode));
    		ParamByName('strRenChar')   .AsString   :=  Master.strRenso;
    		ParamByName('strName')      .AsString   :=  Master.strName;
       		ParamByName('strSimpleName').AsString   :=  Master.strSimpleName;
    		ParamByName('iClassCode')   .AsInteger  :=  Master.iClassCode;
    		ParamByName('iCharCode')    .AsInteger  :=  Master.iSeikakuNo;

            // 設定している時(ﾃﾞｰﾀﾍﾞｰｽの設定値は0:借方 1:貸方)
    		if ( Master.iSeizanNo <> 0 ) then
    			ParamByName('iDCKbn')   .AsInteger  :=  Master.iSeizanNo - 1
            // 未設定の時
    		else
    			ParamByName('iDCKbn')   .AsInteger  :=  0;

            // 加算先が"小計"の時は"小計より上"
    		if ( Master.strParentCode = m_strCFSyoukeiCode ) then
    			ParamByName('iSubTotal').AsInteger	:=  1
            // "小計"より下
    		else
    			ParamByName('iSubTotal').AsInteger	:=  0;
    	    ParamByName('iUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>

		    ExecSQL();

    		if ( Status <> 0 ) then	// ｴﾗｰ
            begin
                fnErrorMessageDsp(dqMasterData);
    			Free();
    			Result := FALSE;
                Exit;
            end;

            // ﾂﾘｰﾋﾞｭｰを更新する(追加)
            UpdateTreeViewItems(KAMOKU_JITUZAI, strCode, Master.strSimpleName, ACCESS_TREE_ADD);
        end;
    end
// --------------------------------------
//  追加/更新モード
// --------------------------------------
    else if ( nUpdateMode = MODE_UPDATE ) then
    begin
        with dqMasterData do
        begin
    		Close();
    		SQL.Clear();
    		SQL.Add('UPDATE CFKmkMA SET                 '
    		    +   '    RDelKbn    = 0                 '
                +   '   ,Renso      = :strRenChar       '
                +   '   ,LongName   = :strName          '
                +   '   ,SimpleName = :strSimpleName    '
                +   '   ,ClassCode  = :iClassCode       '
                +   '   ,CharCode   = :iCharCode        '
                +   '   ,DCKbn      = :iDCKbn           '
                +   '   ,SubTotal   = :iSubTotal        '
                +   '   ,UpdTantoNCode = :iUpdTantoNCode ' // <009>
    		    +   'WHERE  (Masterkbn = 11)            '
                +   '  AND  (CfKbn     = :iCfKbn)       '
                +   '  AND  (RDelKbn   = 0)             '
                +   '  AND  (GCode     = :strCode)      ');

    		ParamByName('strRenChar')   .AsString   :=  Master.strRenso;
    		ParamByName('strName')      .AsString   :=  Master.strName;
    		ParamByName('strSimpleName').AsString   :=  Master.strSimpleName;
    		ParamByName('iClassCode')   .AsInteger  :=  Master.iClassCode;
    		ParamByName('iCharCode')    .AsInteger  :=  Master.iSeikakuNo;

            // 設定している時(ﾃﾞｰﾀﾍﾞｰｽの設定値は0:借方 1:貸方)
    		if ( Master.iSeizanNo <> 0 ) then
    			ParamByName('iDCKbn')   .AsInteger  :=  Master.iSeizanNo - 1
            // 未設定の時
    		else
    			ParamByName('iDCKbn')   .AsInteger  :=  0;

    		if ( Master.strParentCode = m_strCFSyoukeiCode ) then
    			ParamByName('iSubTotal').AsInteger	:=  1
    		else
    			ParamByName('iSubTotal').AsInteger	:=  0;

    		ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    		ParamByName('strCode')  .AsInteger  :=  StrToInt64(Trim(strCode));
            ParamByName('iUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
    		ExecSQL();

    		if ( Status <> 0 ) then	// ｴﾗｰ
    		begin
                fnErrorMessageDsp(dqMasterData);
                Result  := FALSE;
    			Exit;
    		end;

            // ﾂﾘｰﾋﾞｭｰを更新する
            UpdateTreeViewItems(KAMOKU_JITUZAI, strCode, Master.strSimpleName, ACCESS_TREE_UPDATE);
        end;
    end
// --------------------------------------
//  削除データ再利用モード<005>
// --------------------------------------
    else if ( nUpdateMode = MODE_REUSED ) then
    begin
        with dqMasterData do
        begin
    		Close();
    		SQL.Clear();
    		SQL.Add('UPDATE CFKmkMA SET                 '
    		    +   '    RDelKbn    = 0                 '
                +   '   ,Renso      = :strRenChar       '
                +   '   ,LongName   = :strName          '
                +   '   ,SimpleName = :strSimpleName    '
                +   '   ,ClassCode  = :iClassCode       '
                +   '   ,CharCode   = :iCharCode        '
                +   '   ,DCKbn      = :iDCKbn           '
                +   '   ,SubTotal   = :iSubTotal        '
                +   '   ,UpdTantoNCode = :iUpdTantoNCode ' // <009>
    		    +   'WHERE  (Masterkbn = 11)            '
                +   '  AND  (CfKbn     = :iCfKbn)       '
                +   '  AND  (GCode     = :strCode)      ');

    		ParamByName('strRenChar')   .AsString   :=  Master.strRenso;
    		ParamByName('strName')      .AsString   :=  Master.strName;
    		ParamByName('strSimpleName').AsString   :=  Master.strSimpleName;
    		ParamByName('iClassCode')   .AsInteger  :=  Master.iClassCode;
    		ParamByName('iCharCode')    .AsInteger  :=  Master.iSeikakuNo;

            // 設定している時(ﾃﾞｰﾀﾍﾞｰｽの設定値は0:借方 1:貸方)
    		if ( Master.iSeizanNo <> 0 ) then
    			ParamByName('iDCKbn')   .AsInteger  :=  Master.iSeizanNo - 1
            // 未設定の時
    		else
    			ParamByName('iDCKbn')   .AsInteger  :=  0;

    		if ( Master.strParentCode = m_strCFSyoukeiCode ) then
    			ParamByName('iSubTotal').AsInteger	:=  1
    		else
    			ParamByName('iSubTotal').AsInteger	:=  0;

    		ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    		ParamByName('strCode')  .AsInteger  :=  StrToInt64(Trim(strCode));
            ParamByName('iUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
    		ExecSQL();

    		if ( Status <> 0 ) then	// ｴﾗｰ
    		begin
                fnErrorMessageDsp(dqMasterData);
                Result  := FALSE;
    			Exit;
    		end;

            // ﾂﾘｰﾋﾞｭｰを更新する
            UpdateTreeViewItems(KAMOKU_JITUZAI, strCode, Master.strSimpleName, ACCESS_TREE_ADD);
        end;
    end;

    dqMasterData.Close();
	dqMasterData.Free();

    // 正常終了
	Result	:= TRUE;

end;

//-----------------------------------------------------------------------------
// UpdateTreeViewItems()
//	< ﾂﾘｰﾋﾞｭｰを更新する >
//      PARAM   : iSumKbn		:   実在/合計区分
//                strCode		:   ｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞ
//                strSimpleName :   簡略名称
//                iAccessKind	:   ｱｸｾｽ方法
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.UpdateTreeViewItems(iSumKbn: Integer; strCode: String; strSimpleName: String; iAccessKind: Integer);
var
	strCodeCmp  :   String;			    // 現在のﾂﾘｰﾋﾞｭｰ上の比較対照となるｺｰﾄﾞ
    iCnt        :   Integer;			// ﾙｰﾌﾟｶｳﾝﾀ
    stItemRec   :   ^TreeViewRec;		// ｱｲﾃﾑﾚｺｰﾄﾞ
    cNode       :   TTreeNode;			// ﾂﾘｰのﾉｰﾄﾞ
	stItemRecAdd:   ^TreeViewRec;		// 新規追加時に使用するｱｲﾃﾑﾚｺｰﾄﾞ
begin


	case iAccessKind of
        // 追加/挿入時はﾂﾘｰﾋﾞｭｰで選択しているﾉｰﾄﾞのｷｬｯｼｭﾌﾛｰ科目ｺｰﾄﾞが比較対象
// <005>		ACCESS_TREE_ADD   : strCodeCmp := m_strNodeCFCode;
// <005>		ACCESS_TREE_INSERT: strCodeCmp := m_strNodeCFCode;
        ACCESS_TREE_ADD   : strCodeCmp := Format('%.10d', [StrToInt64(Trim(m_strNodeCFCode))]); // <005>
        ACCESS_TREE_INSERT: strCodeCmp := Format('%.10d', [StrToInt64(Trim(m_strNodeCFCode))]); // <005>
        // 更新/削除時は指定のｷｬｯｼｭﾌﾛｰ科目のｺｰﾄﾞが比較対象
		ACCESS_TREE_UPDATE: strCodeCmp := strCode;
		ACCESS_TREE_DELETE: strCodeCmp := strCode;
	end;

    // ﾂﾘｰﾋﾞｭｰのｱｲﾃﾑ数分繰り返す
	for iCnt := 1 to CmnTreeView.Items.Count do
	begin
        // ｱｲﾃﾑﾚｺｰﾄﾞを取り出す
		stItemRec := CmnTreeView.Items[iCnt - 1].Data;

        // 一致した時ﾉｰﾄﾞ情報を取出す
		if ( Format('%.10d', [StrToInt64(Trim(stItemRec^.strCode))]) = strCodeCmp ) then
        begin
            cNode := CmnTreeView.Items [iCnt - 1];
			case iAccessKind of
                // 追加ﾓｰﾄﾞの時は新規にｱｲﾃﾑﾚｺｰﾄﾞを生成する
				ACCESS_TREE_ADD:
                begin
                    // ｴﾘｱを確保
					New(stItemRecAdd);
                    // 実在/合計区分を設定
					stItemRecAdd^.iSumKbn := iSumKbn;
                    // ｷｬｯｼｭﾌﾛ科目ｺｰﾄﾞ、名称(簡略)を取得して保存する
					stItemRecAdd^.iNCode  := GetNCode(strCode,m_iCfKbn);		// <011> ADD
					stItemRecAdd^.strCode := strCode;
					stItemRecAdd^.strName := strSimpleName;
                    // 子ﾉｰﾄﾞを親ﾉｰﾄﾞに追加する(子ﾉｰﾄﾞの先頭に追加)
					cNode := CmnTreeView.Items.AddChildObject(cNode, strSimpleName, stItemRecAdd);

                    // 実在科目の時
					if ( iSumKbn = KAMOKU_JITUZAI ) then
			        begin
                        // 表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
						cNode.ImageIndex    := 1;
                        // ﾉｰﾄﾞが選択された場合に表示するｲﾒｰｼﾞﾘｽﾄ中のｲﾝﾃﾞｯｸｽ
						cNode.SelectedIndex	:= 3;
			        end
                    // 合計科目の時
			        else
	    		    begin
						cNode.ImageIndex    := 0;
						cNode.SelectedIndex := 2;
					end;
				end;
                // ｱｲﾃﾑ変更の時は簡略名称を更新する
				ACCESS_TREE_UPDATE:
                begin
					cNode.Text := strSimpleName;
				end;

                // ｱｲﾃﾑ削除の時はﾉｰﾄﾞを削除する
				ACCESS_TREE_DELETE:
                begin
					cNode.Delete;
				end;
			end;

            // 処理終了
			Break;
        end;
    end;

    // ﾉｰﾄﾞを全て展開する
    CmnTreeView.FullExpand;

end;

//-----------------------------------------------------------------------------
// DeleteDatabase()
//	< 加算体系ﾏｽﾀﾃｰﾌﾞﾙ及び科目基本ﾏｽﾀﾃｰﾌﾞﾙの削除を行う >
//      PARAM   : iSumKbn		:   実在/合計区分
//                iNCode        :   ｷｬｯｼｭﾌﾛｰ科目内部ｺｰﾄﾞ
//                strCode		:   ｷｬｯｼｭﾌﾛｰ科目外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.DeleteDatabase(iSumKbn: Integer; iNCode: Extended; strCode: String);
begin

    // 合計科目は削除できない
	if ( iSumKbn = KAMOKU_GOUKEI ) then Exit;

	// -----<010> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<010> Add-Ed-----

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_DataModule.BeginTran(m_DBSelect);

    // 加算体系ﾏｽﾀを削除する
// <006>	if  not DeleteTreeRecord(iNCode) then
    if  not DeleteTreeRecord(strCode) then  // <006>
	begin
        // 失敗した時はﾄﾗﾝｻﾞｸｼｮﾝを破棄する
		m_DataModule.Rollback(m_DBSelect);
		Exit;
	end;

    // 科目基本ﾏｽﾀを削除する
	if	not DeleteMasterRecord(strCode) then
	begin
        // 失敗した時はﾄﾗﾝｻﾞｸｼｮﾝを破棄する
		m_DataModule.Rollback(m_DBSelect);
		Exit;
	end;

    // ﾚｺｰﾄﾞの更新に成功したのでｺﾐｯﾄする
    m_DataModule.Commit(m_DBSelect);

	// -----<010> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<010> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// DeleteTreeRecord()
//	< 加算体系ﾃｰﾌﾞﾙを削除する >
//      PARAM   : strCode           :   ｷｬｯｼｭﾌﾛｰ科目外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常
//      MEMO    :
//-----------------------------------------------------------------------------
// <006>function TJNTCRP009003f.DeleteTreeRecord(iNCode: Extended): Boolean;
function TJNTCRP009003f.DeleteTreeRecord(strCode: String): Boolean; // <006>
var
	dqMasterTree    :   TMQuery;
    iNCode          :   Extended;   // <006>
begin

    // 指定の内部ｺｰﾄﾞを取得<006>
    iNCode  :=  GetNCode(strCode, m_iCfKbn);

	dqMasterTree := TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterTree);

    with dqMasterTree do
    begin
	    Close();
	    SQL.Clear();
	    SQL.Add('DELETE FROM CFKmkTree              '
            +   'WHERE  (MasterKbn  = 11)           '
            +   '  AND  (CfKbn      = :iCfKbn)      '
            +   '  AND  (BasedNCode = :iSrcNCode)   ');

	    ParamByName('iCfKbn')   .AsInteger  :=  m_iCfKbn;
    	ParamByName('iSrcNCode').AsFloat    :=  iNCode;
    	ExecSQL;

        if ( Status <> 0 ) then
        begin
            fnErrorMessageDsp(dqMasterTree);
            Close();
            Free();
            Result  := FALSE;
            Exit;
        end;
    end;

	dqMasterTree.Close();
	dqMasterTree.Free();

    // 正常終了
	Result := TRUE;

end;

//-----------------------------------------------------------------------------
// DeleteMasterRecord()
//	< 科目基本ﾏｽﾀﾃｰﾌﾞﾙを削除する >
//      PARAM   : strCode       :   ｷｬｯｼｭﾌﾛｰ科目外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.DeleteMasterRecord(strCode: string): Boolean;
var
	dqMasterData    :   TMQuery;
begin

	dqMasterData := TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, dqMasterData);

    with dqMasterData do
    begin
	    Close();
	    SQL.Clear();
	    SQL.Add('SELECT NCode FROM CFKmkMA      '
	        +   'WHERE  (Masterkbn  = 11)       '
            +   '  AND  (CfKbn      = :iCfKbn)  '
            +   '  AND  (RDelKbn    = 0)        '
            +   '  AND  (GCode      = :strCode) ');

	    ParamByName('iCfKbn')   .AsInteger := m_iCfKbn;
    	ParamByName('strCode')  .AsInteger := StrToInt64(Trim(strCode));
    	Open;

        // ｴﾗｰ
        if ( Status <> 0 ) then
        begin
            fnErrorMessageDsp(dqMasterData);
            Close();
            Free();
            Result  := FALSE;
            Exit;
        end;

        // ﾚｺｰﾄﾞが存在しない
        if EOF then
        begin
            Close();
            Free();
            Result  := FALSE;
            Exit;
        end;

	    Close();
	    SQL.Clear;
    	SQL.Add('UPDATE CFKmkMA SET             '
            +   '   RDelKbn = 1,                '
            +   '   UpdTantoNCode   = :iUpdTantoNCode ' // <009>
    	    +   'WHERE  (Masterkbn  = 11)       '
            +   '  AND  (CfKbn      = :iCfKbn)  '
            +   '  AND  (RDelKbn    = 0)        '
            +   '  AND  (GCode      = :strCode) ');

    	ParamByName('iCfKbn')   .AsInteger := m_iCfKbn;
    	ParamByName('strCode')  .AsInteger := StrToInt64(Trim(strCode));
        ParamByName('iUpdTantoNCode').AsFloat := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <009>
    	ExecSQL;

        // ｴﾗｰ
        if ( Status <> 0 ) then
        begin
            fnErrorMessageDsp(dqMasterData);
            Close();
            Free();
            Result  := FALSE;
            Exit;
        end;

        // ﾂﾘｰﾋﾞｭｰを更新する
	    UpdateTreeViewItems(KAMOKU_JITUZAI, strCode, '', ACCESS_TREE_DELETE);
    end;

    dqMasterData.Close();
	dqMasterData.Free();

    // 正常終了
	Result	:= TRUE;

end;

//-----------------------------------------------------------------------------
// PrnSet()
//	< 印刷情報ｾｯﾄする >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.PrnSet;
var
	DmqData     :   TMQuery;
	iClassCode  :   Integer;    // 科目分類
begin

	DmqData :=  TMQuery.Create(Self);
	m_DataModule.SetDBInfoToQuery(m_DBSelect, DmqData);

    iClassCode  :=  m_MasterData.iClassCode;	// 科目分類の取出し
											    
    // 明細部分をMemDataにｾｯﾄ
	DMemPrint.Close();
	DMemPrint.Open();

	with DmqData do
	begin
        // 科目基本ﾏｽﾀを外部ｺｰﾄﾞ昇順でGET
		Close();
		SQL.Clear();
		SQL.Add('SELECT * FROM CFKmkMA              '
		    +   'WHERE  (MasterKbn = 11)            '
            +   '  AND  (CFKbn     = :iCFKbn)       '
            +   '  AND  (SumKbn    = 0)             '
            +   '  AND  (RDelKbn   = 0)             '
            +   '  AND  (ClassCode = :iClassCode)   '
            +   'ORDER BY GCode                     ');

		SetFld('iCFKbn')    .AsInteger	:=  m_iCFKbn;
		SetFld('iClassCode').AsInteger  :=  iClassCode;
		Open();

		if ( Status = 0 ) then
		begin
			while not EOF do
			begin
				DMemPrint.Append();
                // 出力科目
				DMemPrint.FieldByName('KmkCode')    .AsInteger  :=  GetFld('GCode')     .AsInteger;
				// 正式名称
				DMemPrint.FieldByName('LongName')   .AsString   :=  GetFld('LongName')  .AsString;
				// 簡略名称
				DMemPrint.FieldByName('SimpleName') .AsString   :=  GetFld('SimpleName').AsString;
				// 科目性格/科目性格名称

				if ( iClassCode <> CHARCODE_GENKIN ) then
				begin
                    // 営業・投資・財務活動の時
                	if ( GetFld('CharCode').AsInteger <> 0 ) then
						DMemPrint.FieldByName('CharCode').AsString := GetFld('CharCode').AsString;

					case GetFld('CharCode').AsInteger of
                        // ｷｬｯｼｭ流入
						CHARCODE_RYUNYU     :
                            DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_RYUNYU;
                        // ｷｬｯｼｭ流出
						CHARCODE_RYUSYUTU   :
                            DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_RYUSYUTU;
                        // BS残高
						CHARCODE_BSZANDAKA  :
                        begin
							DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_BSZANDAKA;

                            // 更に正残区分/正残区分名称をｾｯﾄ
							case GetFld('DCKbn').AsInteger of
								DCKBN_KARIKATA:
                                begin
                                    DMemPrint.FieldByName('DCKbn').AsString := IntToStr(GetFld('DCKbn').AsInteger + 1);
								  	DMemPrint.FieldByName('DCKbnName').AsString := SEIZAN_KARIKATA;
                                end;
								DCKBN_KASIKATA:
                                begin
									DMemPrint.FieldByName('DCKbn').AsString := IntToStr(GetFld('DCKbn').AsInteger + 1);
								  	DMemPrint.FieldByName('DCKbnName').AsString := SEIZAN_KASIKATA;
                                end;
							end;
                        end;
					end;
				end
                // 現金及び現金同等物の時
				else
				begin
                	if ( GetFld('CharCode').AsInteger <> 0 ) then
						DMemPrint.FieldByName('CharCode').AsString := GetFld('CharCode').AsString;

					case GetFld('CharCode').AsInteger of
                        // 換算差額
						CHARCODE_KANSANSAGAKU:
							DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_KANSANSAGAKU;
                        // 増減額
						CHARCODE_ZOUGENGAKU:
                            DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_ZOUGENGAKU;
                        // 期首残高
						CHARCODE_KISYUZANDAKA:
							DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_KISYUZANDAKA;
                        // 期末残高
						CHARCODE_KIMATUZANDAKA:
                            DMemPrint.FieldByName('CharCodeName').AsString := SEIKAKU_KIMATUZANDAKA;
					end;
				end;

				DMemPrint.Post;
				Next;
			end;

			DmqData.Close();
		end
		else
		begin
			fnErrorMessageDsp(DmqData);
			DmqData.Free;
			Exit;
		end;
	end;
    // MemDataの先頭に移動
	DMemPrint.First;
	DmqData.Free();

end;

//-----------------------------------------------------------------------------
// fnMakeSQL()
//	< ｽﾄｱﾄﾞのSQL文作成 >
//      PARAM   : TAN_CD	:   担当者ｺｰﾄﾞ
//                TAN_NAME  :   担当者名
//                FLAG	    :   担当者選択なし(-1以外:TRUE/-1:FALSE)
//      VAR     :
//      RETURN  : 作成したSQL文
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.fnMakeSQL(TAN_CD: Integer; TAN_NAME: String; FLAG: Boolean):String;
var
	sSQL    :   String;
	sTanCD  :   String;
begin

	sTanCD  :=  IntToStr(TAN_CD);
	sSQL    :=	'CALL MP200010(0';

    //	担当者選択なし
	if	FLAG then
	begin
		sSQL :=	sSQL + ',' + ''+ sTanCD + ',' + ''''+ TAN_NAME + '''';
	end;

	sSQL    :=	sSQL + ')';
	Result	:=	sSQL;

end;

//-----------------------------------------------------------------------------
// fnErrorMessageDsp()
//	< ｴﾗｰﾒｯｾｰｼﾞ表示処理 >
//      PARAM   : DmQuery	:   ｴﾗｰになったQuery
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.fnErrorMessageDsp(DmQuery: TMQuery);
begin

    Beep;
	case m_ComArea.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
            // 最大登録件数をｵｰﾊﾞｰしました
			m_ComArea.m_MsgStd.GetMsg(m_MjsMsgRec, 0, 1);
    		MjsMessageBoxEx(AOwner, // <002>
                            m_MjsMsgRec.sMsg,
                            m_MjsMsgRec.sTitle,
                            m_MjsMsgRec.icontype,
            				m_MjsMsgRec.btntype,
                            m_MjsMsgRec.btndef,
                            m_MjsMsgRec.LogType
                           );
		end;
		else
		begin
			m_ComArea.m_MsgStd.GetMsgDB(m_MjsMsgRec, DmQuery);
			MjsMessageBoxEx(AOwner, // <002>
                            m_MjsMsgRec.sMsg,
                            m_MjsMsgRec.sTitle,
                            m_MjsMsgRec.icontype,
            				m_MjsMsgRec.btntype,
                            m_MjsMsgRec.btndef,
                            FALSE
                           );
		end;
	end;

end;

//-----------------------------------------------------------------------------
// ErrMsg()
//	< ｴﾗｰﾒｯｾｰｼﾞ出力 >
//      PARAM   : strErrMsg :   ｴﾗｰﾒｯｾｰｼﾞ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.ErrMsg(strErrMsg: string);
begin

    Beep;
	ShowMessage(strErrMsg);

end;

//-----------------------------------------------------------------------------
// GetCorpKbn()
//	< 法人区分の取得 >
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE:正常 FALSE:異常
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetCorpKbn: Boolean;
var
	KbnQuery    :   TMQuery;
begin

    Result := TRUE;

	KbnQuery := TMQuery.Create(Self);
    m_DataModule.SetDBInfoToQuery(m_DBSelect, KbnQuery);

	with KbnQuery do
    begin
        // SQLを実行して基本情報を取得する
        Close();
        SQL.Clear();
        SQL.Add('SELECT CorpKbn FROM DTMAIN_MAS '); // <001>
        Open;

        if ( Eof = FALSE ) then
        begin
            m_iCorpKbn := KbnQuery.GetFld('CorpKbn').AsInteger;
            Close();
        end
        else
        begin
            m_ComArea.m_MsgStd.GetMsgDB(m_MjsMsgRec, KbnQuery);
            MjsMessageBoxEx(AOwner, // <002>
                            m_MjsMsgRec.sMsg,
                            m_MjsMsgRec.sTitle,
                            m_MjsMsgRec.icontype,
                            m_MjsMsgRec.btntype,
                            m_MjsMsgRec.btndef,
                            FALSE
                           );
            Result := FALSE;
        end;
    end;

    KbnQuery.Close();
	KbnQuery.Free();

end;

//-----------------------------------------------------------------------------
// GetNewNCode()
//	< 新規追加の内部ｺｰﾄﾞ取得 >
//      PARAM   :
//      VAR     :
//      RETURN  : 内部ｺｰﾄﾞ(異常：-1)
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetNewNCode():Extended;
var
	QueryWk : TMQuery;
begin

    Result  :=  -1;
	QueryWk :=  TMQuery.Create( Self );

	try
    	m_DataModule.SetDBInfoToQuery( m_DBSelect, QueryWk );

	    QueryWk.Close();
    	QueryWk.SQL.Clear();
	    QueryWk.SQL.Add('SELECT MAX(NCode) as MaxNcode FROM CFKMKMA');

        try
       	    QueryWk.Open;
        except
		    fnErrorMessageDsp(QueryWk);
			Exit;
        end;

    	if QueryWk.Eof <> TRUE then
	    begin
                                            // 内部ｺｰﾄﾞの最大+1
    		Result := QueryWk.GetFld('MaxNcode').AsInteger + 1;
        end
        else
        begin
            Result := 1;                    // 1ｵﾘｼﾞﾝ
	    end;
    finally
	    QueryWk.Free;
    end;

end;

//-----------------------------------------------------------------------------
// GetNCode()
//	< 指定の内部ｺｰﾄﾞ取得 >
//      PARAM   :
//      VAR     :
//      RETURN  : 内部ｺｰﾄﾞ(異常：-1)
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009003f.GetNCode(GCode: String; nCfKbn: Integer):Extended;
var
	QueryWk : TMQuery;
begin
    Result := -1;

	QueryWk := TMQuery.Create( Self );
	try

    	m_DataModule.SetDBInfoToQuery( m_DBSelect, QueryWk );

	    QueryWk.Close();
    	QueryWk.SQL.Clear();
	    QueryWk.SQL.Add('SELECT NCode FROM CFKMKMA      '
                    +   'WHERE  (Masterkbn  = 11)       '
                    +   '  AND  (CfKbn      = :iCfKbn)  '
                    +   '  AND  (GCode      = :GCode)   ');

        QueryWk.ParamByName('GCode')    .AsInteger  :=  StrToInt64(Trim(GCode));
        QueryWk.ParamByName('iCfKbn')   .AsInteger  :=  nCfKbn;

        try
       	    QueryWk.Open;
        except
		    fnErrorMessageDsp(QueryWk);
			Exit;
        end;

    	if QueryWk.Eof <> TRUE then
	    begin
                                            // 内部ｺｰﾄﾞ
    		Result := QueryWk.GetFld('NCode').AsInteger;
        end
        else
        begin
            Result := 0;                    // 該当なし
	    end;
    finally
	    QueryWk.Free;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetGrants()    <003>
//	< 権限取得 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009003f.fnGetGrants();
begin

//    m_cJNTArea.FxPermission;						// 権限取得 <004>

//<008>↓
//親画面ですでに追加・変更・削除の権限をFalseにしているため、
//ここであえて処理する必要はない（後述のロジックで参照モードが確定する）
{
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then		// 決算確定MSG
    begin
        giReferFlag	:= REFER;						// 決算確定の為参照のみ
        m_IsUpdate  := FALSE;
    end
    else
	begin
}
        if ( m_cJNTArea.IsAppend and m_cJNTArea.IsModify ) then
            m_IsUpdate := TRUE
        else
            m_IsUpdate := FALSE;

		if ( m_IsUpdate ) then
	        giReferFlag	:= NORMAL					// 通常処理
		else
			giReferFlag	:= REFER;					// 更新権限無し
//	end;	//<008>

    CmnToolbarButtonPrint.Enabled := m_cJNTArea.IsPrint;

    // 参照時画面ﾓｰﾄﾞ
    if ( giReferFlag = REFER ) then
    begin
    	CmnGrid.Options	:= CmnGrid.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		CmnTreeView.DragMode :=	dmManual;
    end;

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<010>
//	Name		:	T.Seki
//	Date		:	2008/04/03
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP009003f.SessionPractice(iSyori: Integer);
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
//	SPMsHist.Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc();						// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare();						// ﾘｿｰｽを解放する
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
function TJNTCRP009003f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.
