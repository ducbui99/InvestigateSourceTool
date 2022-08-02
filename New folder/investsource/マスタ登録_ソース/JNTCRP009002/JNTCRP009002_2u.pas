//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：タイトル科目登録
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：高橋 功二(LEAD)
//      作成日      ：2005.01.25(TUE)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <!!!>   高橋 功二   2005.04.08(FRI) 仕様確認後修正予定
//  <001>   高橋 功二   2005.04.08(FRI) FX-STYLE対応
//  <002>   茂木 勇次   2005.07.14(THU) 検索ｴｸｽﾌﾟﾛｰﾗ機能の追加
//  <003>   茂木 勇次   2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <004>   飯塚 健介   2005.08.04(THU) 決算確定・権限対応
//  <005>   高橋 功二   2005.08.19(FRI) JNTCommon,TMjsAppRecordを親から引き継ぐように修正。
//  <KEY>   茂木 勇次   2005.09.17(SAT) VK_ESC,VK_ENDｷｰで子BPLをCLOSEする場合、現状だと正常に
//                                      終了できない(ｱﾄﾞﾚｽ違反が発生)為、一時ｺﾒﾝﾄに。
//  <PRN>   茂木 勇次   2005.09.17(SAT) 印刷機能が実装できていない為、一時印刷ﾎﾞﾀﾝを使用不可に。
//  <006>   茂木 勇次   2005.09.29(THU) ｸﾞﾘｯﾄﾞの付箋Bitmapを変更。TImageを追加。
//  <PRN>   茂木 勇次   2005.10.06(THU) 印刷機能の実装。
//  <007>   加藤(PRIME) 2005.10.14(FRI) 削除ﾒｯｾｰｼﾞの変更
//  <ESC>   加藤(PRIME) 2005.10.14(FRI) Escｷｰ動作追加
//  <008>   加藤(PRIME) 2005.11.16(WED) 履歴用ｽﾄｱﾄﾞ呼び出し
//  <009>   加藤(PRIME) 2006.01.10(THU) 印刷を有効にする
//  <   >   加藤(PRIME) 2006.02.22(WED) 連動科目のｺｰﾄﾞ最大桁数6→8対応
//  <010>   高橋 功二   2007.01.25(THU) ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一) Ver1.07正式版(2007/2)にてﾘﾘｰｽ
//	<011>	加藤(PRIME) 2007.03.30(FRI) ﾏｽﾀ同期対応(仮)　★次回ﾘﾘｰｽ時に削除予定
//  <012>   佐藤(IDC)   2007.04.06(FRI) VISTA対応(横スクロールバー対応のためグリッドカラム幅を調整
//	<013>	加藤(PRIME) 2007.05.08(TUE)	ﾏｽﾀ同期対応
//	<014>	加藤(PRIME)	2007.05.15(TUE)	ﾏｽﾀ同期 配信ﾀﾞｲｱﾛｸﾞ対応
//	<015>	渡邊(LAB)   2007.07.02(MON) 決算確定の判定は権限に依存させる（子でメッセージを出さない）
//  <016>   鈴木(PRIME) 2007.08.09(THU) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//	<017>	関(PRIME)	2008.02.19(TUE)	ﾏｽﾀ更新履歴対応
//  <018>   大竹 文顕   2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//  <DKAI>  難波(Lab)   2008.08.27(WED) 名称に改行が入らないようにする
//  <019>   黒田 祐生   2010.05.21(FRI) MLBplLoader対応(LoadPackageの置換)
//	<020>	黒田 祐生	2012.02.13(MON)	ShiftState対応
//=============================================================================
unit JNTCRP009002_2u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  ComCtrls, Grids, DBGrids, VCL.StdCtrls, Buttons, VCL.ExtCtrls, VCL.ImgList, Db, FireDAC.Comp.Client,
  Menus, ToolWin,
  dxGrClms, dxDBGrid, dxTL, dxCntner, dxmdaset,

  MJSDBGrid, MJSComboBox, MJSFunctionBar, MJSStatusBar, MJSSpeedButton, MJSQuery,
  MJSPanel,

  MJSCommonu, MjsCommon2u, MjsDBModuleu, MjsDispCtrl, MJSMsgStdu, MjsStrCtrl,
  JNTMasComu, JNTCommonu{<004>}, JNTFuncU{<002>}, JNTMasWndIFu,
  JNTSelCorpSys, JNTExpGlobal, MJSToolBar,{<PRN>}
  MLBplLoaderU{<019>}
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, FireDAC.Comp.DataSet	// <020>ADD
  ;

type
	FusenCmntRec = record
		Code		:	Extended;		// ｺｰﾄﾞ
		Cmnt		:	String;			// 付箋ｺﾒﾝﾄ
end;

type
{$include ActionInterface.inc}
{$include JNTMASWND_ColorDef.inc}
{$include JNTMASFUSENBIKODLGIFH.inc}
{$include JNTSelPrtIF.inc}              // <PRN>
{$include JNTCRPSyncMasterH.inc}     	// <011> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMasterIFH.inc}   		// <014> 配信ﾀﾞｲｱﾛｸﾞ共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP009002_2f = class(TForm)
	SStatus: TMStatusBar;
	DataSource1: TDataSource;
	MQuery1: TMQuery;
	MPanel: TMPanel;
	DTitle: TdxDBGrid;
	dxMemData1: TdxMemData;
	dxMemData1GCode: TIntegerField;
	dxMemData1RenChar: TStringField;
	dxMemData1LongName: TStringField;
	dxMemData1SimpleName: TStringField;
	dxMemData1DecoKbnCode: TIntegerField;
	dxMemData1DecoKbnName: TStringField;
	dxMemData1TitleKbnCode: TIntegerField;
	dxMemData1TitleKbnName: TStringField;
	dxMemData1ConnectCode: TIntegerField;
	dxMemData1ConnectName: TStringField;
	dxMemData1MinusName: TStringField;
	dxMemData1DummyDeco: TSmallintField;
	dxMemData1DummyTitle: TSmallintField;
	DTitleRecId: TdxDBGridColumn;
	DTitleGCode: TdxDBGridMaskColumn;
	DTitleRenChar: TdxDBGridMaskColumn;
	DTitleLongName: TdxDBGridMaskColumn;
	DTitleSimpleName: TdxDBGridMaskColumn;
	DTitleConnectName: TdxDBGridMaskColumn;
	DTitleMinusName: TdxDBGridMaskColumn;
	DTitleFusen: TdxDBGridGraphicColumn;
	DTitleDecoKbnName: TdxDBGridMaskColumn;
	DTitleTitleKbnName: TdxDBGridMaskColumn;
	DTitleDummyDeco: TdxDBGridMaskColumn;
	DTitleDummyTitle: TdxDBGridMaskColumn;
	DTitleDecoKbnCode: TdxDBGridLookupColumn;
	DTitleTitleKbnCode: TdxDBGridLookupColumn;
	dxMemData1Fusen: TGraphicField;
	PMTitle: TPopupMenu;
	GFBlue: TMenuItem;
	GFGreen: TMenuItem;
	GFOrange: TMenuItem;
	GFRed: TMenuItem;
	ImageList1: TImageList;
	ListDeco: TdxMemData;
	ListDecoiCode: TSmallintField;
	ListDecoiName: TStringField;
	ListTitle: TdxMemData;
	ListTitleiCode: TSmallintField;
	ListTitleiName: TStringField;
	ListRen: TdxMemData;
	ListReniName: TStringField;
	dxMemData1NCode: TIntegerField;
	ListReniCode: TIntegerField;
	dxMemData2: TdxMemData;
	dxMemData2GCode: TIntegerField;
	dxMemData2RenChar: TStringField;
	dxMemData2LongName: TStringField;
	dxMemData2SimpleName: TStringField;
	dxMemData2DecoKbnCode: TIntegerField;
	dxMemData2DecoKbnName: TStringField;
	dxMemData2TitleKbnCode: TIntegerField;
	dxMemData2TitleKbnName: TStringField;
	dxMemData2ConnectCode: TIntegerField;
	dxMemData2ConnectName: TStringField;
	dxMemData2MinusName: TStringField;
	GFDel: TMenuItem;
	GFSep: TMenuItem;
	GFRe: TMenuItem;
	GFRedOff: TMenuItem;
	GFRedOn: TMenuItem;
	GFBlueOff: TMenuItem;
	GFBlueOn: TMenuItem;
	GFGreenOff: TMenuItem;
	GFGreenOn: TMenuItem;
	GFOrangeOff: TMenuItem;
	GFOrangeOn: TMenuItem;
	imgFusen: TImageList;
	imgFusenD: TImageList;
	PMFusen: TPopupMenu;
	MenuItem1: TMenuItem;
	B1: TMenuItem;
	G1: TMenuItem;
	O1: TMenuItem;
	dxMemData1FusenIndex: TIntegerField;
	DTitleConnectCode: TdxDBGridButtonColumn;
	dxMemData1FusenCmnt: TStringField;
    PTool: TMPanel;
    BClose: TMSpeedButton;
    BPrint_: TMSpeedButton;
    BChange: TMSpeedButton;
    BDelete_: TMSpeedButton;
    LVStyleBar: TMToolBar;
    btnFusenCtl_: TToolButton;
    Image_Fusen_Red: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Glay: TImage;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCreate(Sender: TObject);
	procedure EnterEvent(Sender: TObject);
	procedure FormActivate(Sender: TObject);

	procedure GetData();
	procedure DataDsp(iFlg : Integer);
	procedure LookUpDataSet();
	procedure WriteSKMKMA();
	procedure DeleteSKMKMA();
	procedure BCloseClick(Sender: TObject);
	procedure BPrint_Click(Sender: TObject);
	procedure BChangeClick(Sender: TObject);
	procedure FFuncFunctionClick(Sender: TObject; FuncNo: Integer);
	procedure DataSource1StateChange(Sender: TObject);
	procedure dxMemData1BeforePost(DataSet: TDataSet);
	procedure dxMemData1AfterPost(DataSet: TDataSet);
	procedure DTitleBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure BDelete_Click(Sender: TObject);
	procedure DeleteClick(Sender: TObject);

	procedure GFBlueOffClick(Sender: TObject);
	procedure GFGreenOffClick(Sender: TObject);
	procedure GFOrangeOffClick(Sender: TObject);
	procedure GFRedOffClick(Sender: TObject);

	procedure GFBlueOnClick(Sender: TObject);
	procedure GFGreenOnClick(Sender: TObject);
	procedure GFOrangeOnClick(Sender: TObject);
	procedure GFRedOnClick(Sender: TObject);

	procedure PMTitlePopup(Sender: TObject);
	procedure FusenDsp(iCode: Extended; iFlg : Integer);
	procedure FusenInfoWrite(iColor: Integer; iCode: Extended; bSw: Boolean);
	procedure FusenInfaDelete(iCode : Extended);
	procedure DTitleKeyUp(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DTitleKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DTitleMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure FormShow(Sender: TObject);
	procedure FormHide(Sender: TObject);
	procedure DTitleExit(Sender: TObject);
	procedure DTitleConnectCodeEditButtonClick(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure ErrorMessageDsp(DmQuery: TMQuery);
	procedure DisplayControl(Select: Integer);
	procedure DTitleChangeNodeEx(Sender: TObject);
	procedure GFDelClick(Sender: TObject);
	procedure DTitleKeyPress(Sender: TObject; var Key: Char);
	procedure GFReClick(Sender: TObject);
	procedure btnFusenCtl_Click(Sender: TObject);
	procedure FusenListClick(Sender: TObject);
	procedure DTitleMouseMove(Sender: TObject; Shift: TShiftState; X,
	  Y: Integer);
	procedure DTitleDecoKbnCodeCloseUp(Sender: TObject; var Value: Variant;
	  var Accept: Boolean);

  private
	{ Private 宣言 }

    // ----- <BPL> -------------------------------------------------------------
    m_CmpList	            :   TList;
    BPrint 	                :   TSpeedButton;   // 印刷
    BDelete                 :   TSpeedButton;   // 削除
    btnFusenCtl             :   TToolButton;    // 付箋
    MComboBox               :   TMComboBox;     // <ESC>第1ｺﾝﾎﾞ
    //--------------------------------------------------------------------------

	m_pMyAppRecord          :   ^TMjsAppRecord;
    m_Base_pRec		        :   ^TMjsAppRecord; // <005>
	dbCorp_Select           :   TFDConnection;
	m_AcControl	            :   TWinControl;
	MDataModule	            :   TMDataModulef;
	ComArea		            :   TJNTMASCom;
	MjsMsgRec	            :   TMJSMsgRec;

	m_fUpdateRecord         :   Integer;					// Post判定ﾌﾗｸﾞ
	m_fEnd		            :   Integer;
	m_iRekiKbn	            :   Integer;
	m_iMailKbn	            :   Integer;
	giReferFlag		        :	Integer;					//	参照ﾌﾗｸﾞ
	m_HintRow		        :	Integer;
	m_aCmnt			        :	array of FusenCmntRec;
	bEBFlg			        :	Boolean;
    m_Zoom                  :   Integer;
    m_FusenColorIdx         :   Integer;                    // ToolButtonの付箋ｶﾗｰを保存
    m_ExpOpenSW             :   Boolean;                    // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)<002>
    AOwner                  :   TComponent;                 // <003>

    m_cJNTArea              :   TJNTCommon;                 // <004>

    //--<004>権限St
    m_IsUpdate              :   Boolean;
    //--<004>権限Ed

    uvSelSys                :   TJNTSelCorpSys; 	        // <PRN> 会社ｼｽﾃﾑ情報
    uvHani                  :   TJNTHani;		            // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry           :	TPrintAppEntry;             // <PRN>
    ArrHdl                  :   Array[0..100] of Pointer;	// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        :	rcPrtParam;                 // <PRN>
    DmqPrint                :   TMQuery;                    // <PRN> 印刷用ｸｴﾘｰ

    m_SyncMaster        	: 	TSyncMaster;	   			// <011> ﾏｽﾀ同期ｸﾗｽ
	m_iSecMasterKbn			:	Integer;					// <013> ｸﾞﾙｰﾌﾟ管理ｾｸﾞﾒﾝﾄﾏｽﾀ区分

// <013> MOD start
//    function  GetNewNCode                   (): Integer;
    function  GetNewNCode      				(): Extended;
// <013> MOD end

    function  gfnGetKmkMA_GCODE            (nNCode: Extended; nMasCode: Integer): Integer;
    function  gfnGetKmkMA_NCODE            (nGCode,nMasCode: Integer): Extended;

    procedure fnGetGrants                   ();      // 権限取得<004>

	function  IsDeleteEx					(): Boolean;	// <011> ADD

// <013> ADD start
	function  GetSecMain					(): Boolean;
    function  fnAllCorpRelation				(exNCode: Extended): Boolean;
	procedure ExecParentDBTran				(iTrnKind: Integer);
	function  WriteSKmkREL					(iMasterKbn: Integer; exNCode: Extended;
												exSegNCode: Extended; Query: TMQuery): Boolean;
// <013> ADD end

	procedure CallSyncDlg					();	// <014>

	procedure SessionPractice(iSyori: Integer);	// <017> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
	function  fnDelCRLF(sData: String): String;	// <DKAI> 改行削除

  public
	{ Public 宣言 }
	constructor     CreateForm              (pRec: Pointer);
	procedure	    CMChildKey              (var Msg: TWMKey); message CM_CHILDKEY;

  end;

var
  JNTCRP009002_2f: TJNTCRP009002_2f;

const
	// ﾌｾﾝﾃﾞﾌｧｲﾝ
	RED				= 1;
	GREEN			= 2;
	BLUE			= 3;
	ORANGE			= 4;
	NOCOLOR			= 99;

	// ｶﾗﾑﾃﾞﾌｧｲﾝ
	COL_FUSEN		= 0;
	COL_GCODE		= 1;
	COL_REN			= 2;
	COL_L_NAME		= 3;
	COL_S_NAME		= 4;
	COL_DECO_KBN_CD	= 5;
	COL_DECO_KBN_NM = 6;
	COL_REN_CODE	= 7;
	COL_REN_NAME	= 8;
	COL_MINUS		= 9;

	// ﾃｰﾌﾞﾙ番号
	TBL_SKMKMA		= 104;

	//	参照ﾌﾗｸﾞ時に使用
	NORMAL			= 1;		//	通常処理
	BASICONLY		= 2;		//	基本のみ設定可能(詳細ボタン使用不可)
	REFER			= 3;		//	参照

	sDeco	: array[0..6] of String = ('なし','【】','（）','〔〕','＜＞','(( ))','｛｝');
	sTitle	: array[0..2] of String = ('通常科目','大見出し','中見出し');

// <011> ADD start
	// ﾏｽﾀ同期ｸﾗｽの採用ﾌﾗｸﾞ
	GRP_SYNC_CHILD			= 1;		// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	GRP_SYNC_PARENT			= 0;		// ｸﾞﾙｰﾌﾟ会計採用あり 親会社
	GRP_SYNC_NOTUSE			= -1;		// ｸﾞﾙｰﾌﾟ会計採用なし

// <013> ADD start
	// ｸﾞﾙｰﾌﾟ会計採用時の親会社DBへの指示
	GRP_PARENTDB_BEGINTRAN	= 0;		// ﾄﾗﾝｻﾞｸｼｮﾝ開始
	GRP_PARENTDB_ROLLBACK	= 1;		// ﾛｰﾙﾊﾞｯｸ
	GRP_PARENTDB_COMMIT		= 2;		// ｺﾐｯﾄ

// <013> ADD end

	// ﾒｯｾｰｼﾞ
	MSGCAP_GRP				= 'グループ会計';
										// ★暫定対応
	MSG_GRP_CHILD_READONLY	= 'グループ会計の子会社として採用されています。'#13#10 +
							'体系のみの修正が可能です。';
										// <013> ADD
    MSG_GRP_RELATIONALL_ERR	= '子会社への関連付けに失敗しました。';

// <011> ADD end

	// -----<017> Add-St-----
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放
	// -----<017> Add-Ed-----

implementation
{$include JNTMASFUSENBIKODLGIFB.inc}
//{$include JNTMasExceptIFB.inc}
{$Include JNTConst.inc}                     // <007>
{$Include JNTCRPSyncMasterB.inc}   			// <011> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}   			// <014> 配信ﾀﾞｲｱﾛｸﾞ共通実装部
{$R *.DFM}

//**************************************************************************
//	Proccess  :	ﾌｫｰﾑｺﾝｽﾄﾗｸﾄ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :	pRec	Pointer
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
constructor TJNTCRP009002_2f.CreateForm(pRec: Pointer);
var
    DmqData : TMQuery;                      // <008>
//    sMessage: String;                       // <008> <011> DEL
begin

	m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );              // 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);		// DBModuleを取得
	ComArea         :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);			// 会社Noを共通ﾒﾓﾘから取得

    // JNTCommonの構築
//    m_cJNTArea      := TJNTCommon.Create(Self);                           // <004><005>
//    m_cJNTArea.Init(m_pMyAppRecord);                                      // <004><005>


    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);
    AOwner          :=  TForm(m_pMyAppRecord.m_pOwnerForm^);                // <003>

	// DBOpne
	dbCorp_Select := MDataModule.COPDBOpen(1, ComArea.m_iCopNo);
	if ( dbCorp_Select = nil ) then
	begin
		ComArea.m_MsgStd.GetMsg(MjsMsgRec,10000,MDataModule.GetStatus);
		MjsMessageBoxEx(AOwner, // <003>
                        MjsMsgRec.sMsg,
						MjsMsgRec.sTitle,
						MjsMsgRec.icontype,
						MjsMsgRec.btntype,
						MjsMsgRec.btndef,
						MjsMsgRec.LogType);
		raise Exception.Create('');
	end;

// <008>↓
	DmqData := TMQuery.Create( Self );		// MQueryの構築
                                            // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );

	DmqData.Close;
	DmqData.SQL.Clear;
                                            // 履歴用ｽﾄｱﾄﾞ呼び出し
	DmqData.SQL.Add('CALL MP200010(0,:TANCD)');
                                            // 担当者ｺｰﾄﾞ
	DmqData.ParamByName('TANCD'  ).AsFloat := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

	if ( DmqData.ExecSQL = FALSE ) then
	begin
// <011> MOD start
//		sMessage :=	IntToStr(ComArea.m_MsgStd.GetDBCode(DmqData));
//		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
		ErrorMessageDsp(DmqData);			// DBｴﾗｰﾒｯｾｰｼﾞ表示
// <011> MOD end
	end;

	DmqData.Close;
	DmqData.Free;

// <008>↑

// <011> ADD start
    // SyncMasterｸﾗｽの生成
    try
        m_SyncMaster := TSyncMaster.Create(Self, m_pMyAppRecord, m_cJNTArea, dbCorp_Select);
        m_SyncMaster.InitData();
	    m_SyncMaster.m_AOwner := TForm(m_pMyAppRecord^.m_pOwnerForm^);
// <013> ADD start
											// 子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								// 同期ｽﾄｱﾄﾞ呼出
			MDataModule.BeginTran(dbCorp_Select);
            // ﾀｲﾄﾙ科目だけは勘定科目を参照するので一緒に同期を取る
											// KmkMA
   			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_KMKMA) then
			begin
				MDataModule.RollBack(dbCorp_Select);
                Abort;
			end;
											// KmkMB
   			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_KMKMB) then
			begin
				MDataModule.RollBack(dbCorp_Select);
                Abort;
			end;
											// SKmkMA
   			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
			begin
				MDataModule.RollBack(dbCorp_Select);
                Abort;
			end;

			MDataModule.Commit(dbCorp_Select);
        end;
// <013> ADD end
    except
        raise;
    end;
// <011> ADD end

// <013> ADD start
	try
	    if not GetSecMain() then   			// ｾｷｭﾘﾃｨ基本情報取得
		begin
        	Abort;
        end;
    except
    	raise;
	end;
// <013> ADD end

// ↓↓↓<PRN>

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if ( uvSelSys = nil ) then
            Abort;

    	if ( uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 ) then
            Abort;
    except
		MjsMessageBox(AOwner,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if ( uvSelSys.CreateSysInfo(dbCorp_Select) <> 0 ) then
            Abort;
    except
        uvSelSys.MsgDlg(1001,20);
        raise;
    end;
// ↑↑↑<PRN>

    inherited Create( AOwner );                         // <003>
// <003>	inherited Create(TForm(m_pMyAppRecord.m_pOwnerForm^));

end;

//******************************************************************************
//	Component	:	Form
//	Event		:	OnActivate
//	Memo		:	フォーム アクティブ
//	Create		:	N.Nabe
//******************************************************************************
procedure	TJNTCRP009002_2f.FormActivate(Sender: TObject);
var
	AppPara : TAppParam;
begin
	AppPara.iAction := ACTID_ACTIVEEND;
	AppPara.pRecord := Pointer( m_pMyAppRecord );
	AppPara.pActionParam := nil;

	TMjsAppRecord( m_pMyAppRecord^ ).m_pOwnerEntry( @AppPara );
end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnCreate
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_2f.FormCreate(Sender: TObject);
var
    iRet            :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
    iLoop           :   Integer;        // <PRN>
begin
	// -----<017> Add-St-----
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<017> Add-Ed-----

// 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    BPrint 	    := TSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    BDelete 	:= TSpeedButton( m_CmpList.Items[2]^ );     // 削除
    btnFusenCtl := TToolButton ( m_CmpList.Items[5]^ );     // 付箋
// <ESC>↓
//    m_cJNTArea  := TJNTCommon  ( m_CmpList.Items[7]^ );     // <005>
//    m_Base_pRec := Pointer     ( m_CmpList.Items[8]^ );     // <005>
    MComboBox   := TMComboBox  ( m_CmpList.Items[6]^ );     // <ESC>第1ｺﾝﾎﾞ追加
    m_cJNTArea  := TJNTCommon  ( m_CmpList.Items[8]^ );     // <005>
    m_Base_pRec := Pointer     ( m_CmpList.Items[9]^ );     // <005>
// <ESC>↑
    BPrint.OnClick              :=  BPrint_Click;
    BDelete.OnClick             :=  BDelete_Click;
    btnFusenCtl.OnClick         :=  btnFusenCtl_Click;
    btnFusenCtl.DropdownMenu    :=  PMFusen;
//--------------------------------------------------------------------------

	Parent  :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^); // 親ﾊﾟﾈﾙをParent
	Align   :=  alClient;								// 全領域を作成

    // <PRN>ArrHdlの初期化。
    for iLoop := 0 to 100 do
        ArrHdl[iLoop] := nil;

	MjsColorChange(	TJNTCRP009002_2f ( Self ),
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorB,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorD,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorB,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor	);

	m_Zoom  :=  MjsFontResize(TJNTCRP009002_2f( Self )	,Pointer(m_pMyAppRecord));
    MJSCompoResize(LVStyleBar, 0, Pointer(m_pMyAppRecord));

    LVStyleBar.ButtonHeight :=  LVStyleBar.Height;
    LVStyleBar.ButtonWidth  :=  Trunc(LVStyleBar.ButtonWidth * m_Zoom / 100);
    LVStyleBar.Left         :=  Trunc(LVStyleBar.Left * m_Zoom / 100);

	m_fUpdateRecord         :=  0;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, MQuery1);

	m_iRekiKbn  :=  0;
	m_iMailKbn  :=  0;
	with MQuery1 do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT YearKbn, ComKbn3 FROM DTMAIN, DTMAIN_MAS');
		Open();

		if ( EOF = FALSE ) then
		begin
			m_iRekiKbn := GetFld('YearKbn').AsInteger;
			m_iMailKbn := GetFld('ComKbn3').AsInteger;
		end;
	end;

	LookUpDataSet();								// 連動科目コードﾃﾞｰﾀｾｯﾄ
	GetData();										// ﾃﾞｰﾀ表示

	m_fUpdateRecord     :=  1;
//<004>	giReferFlag		:=	NORMAL;				    // 参照ﾌﾗｸﾞ初期化
    fnGetGrants();                                  // 権限取得<004>

	m_AcControl             :=  DTitle;			    // 初期ﾌｫｰｶｽ 設定
	DTitle.FocusedColumn    :=  1;					// ｺｰﾄﾞに初期ﾌｫｰｶｽ
	m_fEnd                  :=  0;					// 終了ﾌﾗｸﾞ初期化
    m_FusenColorIdx         :=  -1;
	DisplayControl(giReferFlag);

	if ( m_iMailKbn = 1 ) or ( giReferFlag = REFER ) then
	begin
//<004>		BDelete.Visible := FALSE;
        BDelete.Enabled :=  m_cJNTArea.IsDelete;
		LVStyleBar.Left :=  Trunc(220 * m_Zoom / 100);
	end;

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化<002>
    m_ExpOpenSW := FALSE;
    if ( fnJNTExpInit( Self,m_pMyAppRecord ) = 0 ) then
        m_ExpOpenSW :=  TRUE
    else
		MjsMessageBox(AOwner,   // <003>
                      'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。',
                      mjError,
                      mjDefOk
                     );

// ↓↓↓<PRN>

    // MQueryの構築<PRN>
    DmqPrint      :=  TMQuery.Create (self);
    // DBとMQueryの接続<PRN>
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 <PRN>}

	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL');       // <019>DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL'); // <019>ADD
        if ( lvHandle = 0 ) then
            Abort;
	except
	 // MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        // <019>DEL
        MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  // <019>ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     // UnloadPackage( lvHandle );  //<021> DEL
        UnloadPackageHelper( lvHandle );  //<021> ADD
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
                 MDataModule,
                 ComArea,
                 dbCorp_Select,
                 uvHani,
                 uvSelSys);

// ↑↑↑<PRN>

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnCloseQuery
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_2f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
//var
//	iRet :	Integer;
begin
{	if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
  	begin
		iRet := MjsMessageBoxEX(AOwner,   // <003>
                                '科目を編集中です。変更内容を破棄しますか？',
                                '登録',
                                mjQuestion,
                                mjYesNoCancel,
                                mjDefYes
                               );
		if iRet <> mrYes then
		begin
			SetData(BS_PAGE);
		end
		else if iRet = mrCancel then
		begin
			CanClose := FALSE;
			exit;
		end;
	end;
}

	if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 10040,2);
   		MjsMessageBoxEx(AOwner,   // <003>
                        MjsMsgRec.sMsg,
                        MjsMsgRec.sTitle,
                        MjsMsgRec.icontype,
                        MjsMsgRec.btntype,
                        MjsMsgRec.btndef,
                        MJsMsgRec.LogType
                       );
	   	CanClose := FALSE;
	end
	else
	begin
		m_fEnd := 1;									
		CanClose := TRUE;
	end;

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放<002>
    if ( m_ExpOpenSW = TRUE ) then
        fnJNTExpFree();

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnClose
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_2f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam :	TAppParam;
begin

// <014> ADD start ﾏｽﾀ同期一括配信ﾀﾞｲｱﾛｸﾞ呼出
											// ｸﾞﾙｰﾌﾟ会計採用あり
    if m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE then
    begin
// <016> MOD start
//    	if (giReferFlag <> REFER) and (m_SyncMaster.m_CEComKbn5 = 0) then
       	if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
// <016> MOD end
        begin
			CallSyncDlg();				   	// 配信ﾀﾞｲｱﾛｸﾞ呼出
        end;
    end;
// <014> ADD end

	MQuery1.Close;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 販売ｼｽﾃﾑ情報の開放   // <PRN>
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

    // JNTCommonの解放 <004>
//    m_cJNTArea.Free(); <005>

    m_SyncMaster.fnSyncTerm();				// <011> ADD ｽﾄｱﾄﾞ終了処理呼出

	MDataModule.COPDBClose(dbCorp_Select);

// <011> ADD start
											// 自社が子会社だった場合
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBのClose
        MDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;
// <011> ADD end

	m_pMyAppRecord^.m_iDelete := 1;
	wkParam.iAction			  := ACTID_FORMCLOSEEND;			// 呼び出し区分 設定
	wkParam.pRecord			  := Pointer(m_pMyAppRecord);		// 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	  := nil;							// 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);		// 親を呼び出す!!

	Action := caFree;

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnDestroy
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_2f.FormDestroy(Sender: TObject);
begin

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <011> ADD start
    if (m_SyncMaster <> nil) then
	begin
		m_SyncMaster.Free();				// ﾏｽﾀ同期ｸﾗｽ破棄
	end;
    // <011> ADD end

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

//**************************************************************************
//	Proccess  :	ｸｴﾘｰでﾃﾞｰﾀ読み込み
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :	iPage	表示するﾍﾟｰｼﾞ
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.GetData();
var
	bRet :	Boolean;
begin
	with MQuery1 do
	begin
		Close;
		SQL.Clear;							// ｸｴﾘの初期化
		// 要約貸借科目を外部ｺｰﾄﾞ昇順でGET
		SQL.Add('select MasterKbn, RDelKbn, SumKbn, GCode, Renso, LongName, SimpleName, DecoKbn, TitleKbn, ConnectNCode, MinusName, NCode from SKmkMA');
		SQL.Add('where MasterKbn=7 AND RDelKbn=0');
		SQL.Add('order by Gcode');
		bRet := Open;						// ｸｴﾘの開始
		if bRet = TRUE then
		begin
			dxMemData1.Open;
//			dxMemData1.First;

//			dxMemData1.DisableControls;
//			try
				if EOF = FALSE then
				begin
					SetLength(m_aCmnt,0);	//	配列をｸﾘｱ
				end;

				while EOF = FALSE do
				begin
					DataDsp(0);
					Next;
				end;
//			finally
//				dxMemData1.EnableControls;
//			end;

			if dxMemData1.RecordCount <> 0 then
				dxMemData1.First;				// Memoの先頭に移動
			Close;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	読み込んだﾃﾞｰﾀをMemoDataにSET
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :	iPage	表示するﾍﾟｰｼﾞ
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DataDsp(iFlg : Integer);
var
	i		:	Integer;
	dQuery	:	TMQuery;
	sName	:	String;
	sCmnt	:	String;
begin
	dQuery := TMQuery.Create(Self);

	try
		MDataModule.SetDBInfoToQuery(dbCorp_Select, dQuery);

		with dQuery do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 勘定科目を外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select SimpleName from KmkMA');
//			SQL.Add('where MasterKbn=1 AND RDelKbn=0 AND GCode=:iGCode');
            SQL.Add('where MasterKbn=1 AND RDelKbn=0 AND NCode=:iGCode');
			SQL.Add('order by Gcode');
//			SetFld('iGCode').AsInteger := MQuery1.GetFld('ConnectNCode').AsInteger;// 検索対象の外部ｺｰﾄﾞ 設定
            SetFld('iGCode').AsFloat := MQuery1.GetFld('ConnectNCode').AsFloat;// 検索対象の外部ｺｰﾄﾞ 設定
			Open;						// ｸｴﾘの開始

			if Eof = FALSE then
				sName := GetFld('SimpleName').AsString
			else
				sName := '';

            // --------------------
			// 付箋ｺﾒﾝﾄを取得
            // --------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT FusenCmnt FROM MFusenInfo   '
			    +   'WHERE (MasterKbn = 7)              '
                +   '  AND (NCode     = :iNCode)        ');
			SetFld('iNCode').AsFloat    :=  MQuery1.GetFld('NCode').AsFloat;
			Open();

			if ( EOF = FALSE ) then
				    sCmnt   :=  GetFld('FusenCmnt').AsString
			else    sCmnt   :=  '';
		end;

		if ( iFlg = 0 ) then
		begin
			dxMemData1.Append;

			// 付箋貼り付け
			FusenDsp(MQuery1.GetFld('NCode').AsFloat, 0);
			// 外部ｺｰﾄﾞ
			dxMemData1GCode.AsInteger := MQuery1.GetFld('GCode').AsInteger;
			// 連想ｼﾝﾎﾞﾙ
			dxMemData1RenChar.AsString := MQuery1.GetFld('Renso').AsString;
			// 正式名称
			dxMemData1LongName.AsString := MQuery1.GetFld('LongName').AsString;
			// 簡略名称
			dxMemData1SimpleName.AsString := MQuery1.GetFld('SimpleName').AsString;
			// 装飾区分
			i := MQuery1.GetFld('DecoKbn').AsInteger;
	//		dxMemData1DecoKbnCode.AsInteger := i;
			dxMemData1DummyDeco.AsInteger := i;
			dxMemData1DecoKbnName.AsString := sDeco[i];
	//        Showmessage(IntToStr(dxMemData1DecoKbnCode.AsInteger));
	//        Showmessage(dxMemData1DecoKbnName.AsString);
			// ﾀｲﾄﾙ種別
			i := MQuery1.GetFld('TitleKbn').AsInteger;
	//		dxMemData1TitleKbnCode.AsInteger := i;
			dxMemData1DummyTitle.AsInteger := i;
			dxMemData1TitleKbnName.AsString := sTitle[i];
			// 連結科目コード
//			if MQuery1.GetFld('ConnectNCode').AsInteger <> 0 then
            if MQuery1.GetFld('ConnectNCode').AsFloat <> 0 then
//				dxMemData1ConnectCode.AsInteger := MQuery1.GetFld('ConnectNCode').AsInteger;
                dxMemData1ConnectCode.AsInteger := gfnGetKmkMA_GCODE(MQuery1.GetFld('ConnectNCode').AsFloat,1);
			// 連結科目名称
//			if (dQuery.Eof = FALSE) and  (MQuery1.GetFld('ConnectCode').AsInteger <> 0) then
				dxMemData1ConnectName.AsString := sName;
//			else
//				dxMemData1ConnectName.AsString := '';
			// マイナス変換科目名
			dxMemData1MinusName.AsString := MQuery1.GetFld('MinusName').AsString;
			// 内部ｺｰﾄﾞ
			dxMemData1NCode.AsInteger := MQuery1.GetFld('NCode').AsInteger;
			// 付箋コメント
			dxMemData1FusenCmnt.AsString := sCmnt;

			SetLength(m_aCmnt,Length(m_aCmnt)+1);
			m_aCmnt[Length(m_aCmnt)-1].Code := MQuery1.GetFld('GCode').AsInteger;
			m_aCmnt[Length(m_aCmnt)-1].Cmnt := sCmnt;

	//		ListDeco.Close;
	//		ListTitle.Close;
	//		ListRen.Close;
			dxMemData1.Post;							// Memoに登録
		end
		else
		begin
			dxMemData2.Append;						// ｱﾍﾟﾝﾄﾞﾓｰﾄﾞ

			// 外部ｺｰﾄﾞ
			dxMemData2GCode.AsInteger := MQuery1.GetFld('GCode').AsInteger;
			// 連想ｼﾝﾎﾞﾙ
			dxMemData2RenChar.AsString := MQuery1.GetFld('Renso').AsString;
			// 正式名称
			dxMemData2LongName.AsString := MQuery1.GetFld('LongName').AsString;
			// 簡略名称
			dxMemData2SimpleName.AsString := MQuery1.GetFld('SimpleName').AsString;
			// 装飾区分
			i := MQuery1.GetFld('DecoKbn').AsInteger;
			dxMemData2DecoKbnCode.AsInteger := i;
			dxMemData2DecoKbnName.AsString := sDeco[i];
			// ﾀｲﾄﾙ種別
			i := MQuery1.GetFld('TitleKbn').AsInteger;
			dxMemData2TitleKbnCode.AsInteger := i;
			dxMemData2TitleKbnName.AsString := sTitle[i];
			// 連結科目コード
//			if MQuery1.GetFld('ConnectNCode').AsInteger <> 0 then
            if MQuery1.GetFld('ConnectNCode').AsFloat <> 0 then
//				dxMemData2ConnectCode.AsInteger := MQuery1.GetFld('ConnectNCode').AsInteger;
				dxMemData2ConnectCode.AsInteger := gfnGetKmkMA_GCODE(MQuery1.GetFld('ConnectNCode').AsFloat,1);
			// 連結科目名称
//			if (dQuery.Eof = FALSE) and  (MQuery1.GetFld('ConnectCode').AsInteger <> 0) then
				dxMemData2ConnectName.AsString := sName;
//			else
//				dxMemData2ConnectName.AsString := '';
			// マイナス変換科目名
			dxMemData2MinusName.AsString := MQuery1.GetFld('MinusName').AsString;

			dxMemData2.Post;							// Memoに登録
		end;

{        dListMem.First;

		while dListMem.EOF = FALSE do
		begin
			if MQuery1.GetFld('ConnectCode').AsInteger = dListMem.FieldByName('iCode').AsInteger then
			begin
				// 連結科目コード
				dxMemData1ConnectCode.AsInteger := dListMem.FieldByName('iCode').AsInteger;
				// 連結科目名称
				dxMemData1ConnectName.AsString := dListMem.FieldByName('iName').AsString;
				showmessage('にゃー');
				Break;
			end;
			dListMem.Next;
		end;
 }
	finally
		dQuery.Free;
	end;
end;

//**************************************************************************
//	Proccess  :	ｸｴﾘｰでﾃﾞｰﾀ読み込み
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 28
//	Parameter :
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.LookUpDataSet();
var
//	bRet : Boolean;
	iLoop: Integer;
begin
	ListDeco.close;
	ListDeco.Open;
	ListTitle.close;
	ListTitle.Open;
	ListRen.close;
	ListRen.Open;

{	MDataModule.SetDBInfoToQuery(dbCorp_Select, MQuery1);

//    dListMem.Append;
//    dListMem.FieldByName('iCode').AsInteger := 0;
//    dListMem.FieldByName('iName').AsString := '';
//    dListMem.Post;
	with MQuery1 do
	begin
		Close;
		SQL.Clear;							// ｸｴﾘの初期化
		// 勘定科目を外部ｺｰﾄﾞ昇順でGET
		SQL.Add('select MasterKbn, SumKbn, RecordKbn, GCode, SimpleName from KmkMA');
		SQL.Add('where MasterKbn=1 AND SumKbn=0 AND RecordKbn=0');
		SQL.Add('order by Gcode');
		bRet := Open;						// ｸｴﾘの開始
		if bRet = TRUE then
		begin
			while EOF = FALSE do
			begin
				ListRen.Append;
				ListRen.FieldByName('iCode').AsInteger := MQuery1.GetFld('GCode').AsInteger;
				ListRen.FieldByName('iName').AsString := MQuery1.GetFld('SimpleName').AsString;
				ListRen.Post;
				Next;
			end;
			if ListRen.RecordCount <> 0 then
				ListRen.First;
			if RecordCount < 5 then
				DTitleConnectCode.DropDownRows := RecordCount
			else
				DTitleConnectCode.DropDownRows := 5;

			Close;
		end;
	end;
}
   	for iLoop := 0 to 6 do
	begin
		ListDeco.Append;
		ListDeco.FieldByName('iCode').AsInteger := iLoop;
		ListDeco.FieldByName('iName').AsString := sDeco[iLoop];
		ListDeco.Post;
	end;
	DTitleDecoKbnCode.DropDownRows := 7;
	ListDeco.First;

   	for iLoop := 0 to 2 do
	begin
		ListTitle.Append;
		ListTitle.FieldByName('iCode').AsInteger := iLoop;
		ListTitle.FieldByName('iName').AsString := sTitle[iLoop];
		ListTitle.Post;
	end;
	DTitleTitleKbnCode.DropDownRows := 3;
	ListTitle.First;
end;

//**************************************************************************
//	Proccess  :	CM_CHILDKEY
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :	Msg		TWMKey
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.CMChildKey(var Msg: TWMKey);
var
	sShift :	TShiftState;
	bCtrl	:	Boolean;
begin

	sShift := MJSKeyDataToShiftState(Msg.KeyData);		// Shiftｷｰの取得 <020>MOD

	// Gridｷｰｵﾍﾟﾚｰｼｮﾝ
	if m_AcControl = DTitle then
	begin
		bCtrl := MjsSystemKeyChk(sShift);

		if (Msg.CharCode=VK_F8) then
		begin
			if DTitle.FocusedColumn = COL_S_NAME then
			begin
				dxMemData1.Edit;
				dxMemData1SimpleName.AsString := MjsCopy(dxMemData1LongName.AsString, 14);
			end;
		end;

		if Msg.CharCode=VK_ESCAPE then	// ESC処理
		begin
			if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
			begin
			end
			else
			begin
(*
				iRet := MjsMessageBoxEX(AOwner,   // <003>
                                        '処理を終了します。よろしいですか？',
                                        '終了',
                                        mjQuestion,
                                        mjYesNo,
                                        mjDefYes
                                       );
				if iRet <> mrYes then
				begin
					abort;
					exit;
				end
				else
				begin
					close;
					exit;
				end;
*) // <KEY>
                // <ESC>↓
                // 第1指示ｺﾝﾎﾞへﾌｫｰｶｽを移動
     			m_ACControl :=  MComboBox;
       			m_ACControl.SetFocus;
                MComboBox.DroppedDown :=  TRUE;
           		Abort;
                // <ESC>↑
			end;
		end;

		if (Msg.CharCode=VK_END) and (bCtrl = TRUE) then	// END+CONTROL処理
		begin
			exit;
		end;

		if (Msg.CharCode=VK_HOME) and (bCtrl = TRUE) then // HOME+CONTROL処理
		begin
			exit;
		end;

		if Msg.CharCode=VK_END then	// END処理
		begin
			if DTitle.FocusedColumn = COL_GCODE then
			begin
(*
				iRet := MjsMessageBoxEX(AOwner,   // <003>
                                        '処理を終了します。よろしいですか？',
                                        '終了',
                                        mjQuestion,
                                        mjYesNo,
                                        mjDefYes
                                       );
				if iRet <> mrYes then
				begin
					abort;
					exit;
				end
				else
				begin
					if dxMemData1GCode.IsNull then
						dxMemData1.Cancel;

					if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
						dxMemData1.Post;
					close;
					exit;
				end;
*) // <KEY>
			end;

			if DTitle.FocusedColumn <> COL_MINUS then
			begin
				DTitle.FocusedColumn := COL_MINUS;
				abort;
				exit;
			end;
		end;

		if Msg.CharCode=VK_HOME then	// HOME処理
		begin
			if DTitle.FocusedColumn <> COL_GCODE then
			begin
				DTitle.FocusedColumn := COL_GCODE;
				abort;
				exit;
			end
			else
			begin
				abort;
				exit;
			end;
		end;

		if (Msg.CharCode=VK_LEFT) or ((Msg.CharCode=VK_TAB) and (sShift=[ssShift])) then	// Shift+Tab,←処理
		begin
			if (dxMemData1.RecNo = 1) and (DTitle.FocusedColumn = COL_GCODE) then
			begin
				Beep;
				abort;
			end;
		end;

		exit;
	end;

	if (Msg.CharCode=VK_TAB) and (sShift=[]) then			// TAB処理
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, TRUE);

	if (Msg.CharCode=VK_TAB) and (sShift=[ssShift]) then	// Shift+TAB処理
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, FALSE);

	inherited;
end;

//**************************************************************************
//	Proccess  :	OnShowｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.FormShow(Sender: TObject);
begin
	JNTMASSetCaption( m_pMyAppRecord );
	MJSBtnVisible( TJNTCRP009002_2f(Self), TRUE );

	if (m_iMailKbn = 1) or (giReferFlag = REFER) then
	begin
//<004>		BDelete.Visible := FALSE;
		BDelete.Enabled := FALSE;
	end;

//	if giReferFlag = REFER then
//	begin
//		BDelete.Visible := FALSE;
//	end;

	if uvHani.mjspre.IsPreview then
		uvHani.mjspre.Show
	else
		m_AcControl.SetFocus;

end;

//**************************************************************************
//	Proccess  :	OnHideｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.FormHide(Sender: TObject);
begin
	MJSBtnVisible( TJNTCRP009002_2f(Self), FALSE );

	if uvHani.mjspre.IsPreView then
		uvHani.mjspre.Hide;

end;

//**************************************************************************
//	Proccess  :	OnEnterの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.EnterEvent(Sender: TObject);
begin
	m_AcControl := Screen.ActiveControl;

	if m_AcControl = DTitle then
	begin
		if dxMemData1GCode.AsInteger = 0 then
		begin
			BDelete.Enabled         :=  FALSE;
			GFBlue.Enabled          :=  FALSE;
			GFGreen.Enabled         :=  FALSE;
			GFOrange.Enabled        :=  FALSE;
			GFRed.Enabled           :=  FALSE;
            btnFusenCtl.ImageIndex  :=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
//<011> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
//<011> MOD end
			GFBlue.Enabled          :=  TRUE;
			GFGreen.Enabled         :=  TRUE;
			GFOrange.Enabled        :=  TRUE;
			GFRed.Enabled           :=  TRUE;

            if ( m_FusenColorIdx = -1 ) then
            begin
                btnFusenCtl.ImageIndex	:=  0;
                m_FusenColorIdx         :=  0;
            end
            else
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;

//<004>			btnFusenCtl.Enabled     :=  TRUE;
			btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	終了ﾎﾞﾀﾝｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.BCloseClick(Sender: TObject);
begin
	if dxMemData1GCode.IsNull then
		dxMemData1.Cancel;

	if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
		dxMemData1.Post;
	close;
//	MAS130200f.fnCloseApp(m_pMyAppRecord^);
end;

//**************************************************************************
//	Proccess  :	印刷ﾎﾞﾀﾝｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.BPrint_Click(Sender: TObject);
var
    bRet    :   Boolean;
begin

	with MQuery1 do
	begin
        // 要約貸借科目を外部ｺｰﾄﾞ昇順でGET
		Close();
		SQL.Clear();
		SQL.Add('SELECT MasterKbn, RDelKbn, SumKbn, GCode, Renso,   '
            +   '       LongName, SimpleName, DecoKbn, TitleKbn,    '
            +   '       ConnectNCode, MinusName, NCode              '
            +   'FROM SKmkMA                                        '
            +   'WHERE  (MasterKbn = 7)                             '
            +   '  AND  (RDelKbn   = 0)                             '
            +   'ORDER BY GCode                                     ');

		bRet := Open();
		if ( bRet = TRUE ) then
		begin
			dxMemData2.Open;

			while EOF = FALSE do
			begin
				DataDsp(1);
				Next;
			end;

			if ( dxMemData2.RecordCount <> 0 ) then
				dxMemData2.First;
			Close();
		end;
	end;

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry	:=  DmqPrint;
        TargetMD    :=  dxMemData2;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  m_cJNTArea;
        TargetInt   :=  1;
	end;

    // 印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);

    dxMemData2.Close();

end;

//**************************************************************************
//	Proccess  :	切替ﾎﾞﾀﾝｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.BChangeClick(Sender: TObject);
var
	iAction	:	Integer;
	AppPara : TAppParam;
begin
{	Hide;											// 再描画でﾁｬｶつかないように不可視

	// 埋め込み
	if Parent = TPanel(m_pMyAppRecord^.m_pOwnerPanel^) then
	begin
		Align				:= alNone;
		Parent				:= nil;
		BorderStyle			:= bsSizeable;
		Position			:= poDefaultPosOnly;
		BChange.Caption		:= '埋込(&G)';
		ClientHeight		:= 622;
		ClientWidth			:= 945;
   	end
	// 切り出し
	else
	begin
		Parent				:= TPanel(m_pMyAppRecord^.m_pOwnerPanel^);
		Align				:= alClient;
		BorderStyle			:= bsNone;
		BChange.Caption		:= '切出(&G)';
	end;

	Show;											// 元に戻す
}
	Visible := FALSE;

	// 切り出し
	if Parent = TPanel(m_pMyAppRecord^.m_pOwnerPanel^) then
	begin
		Align			:= alNone;
		Parent			:= nil;
		BorderStyle		:= bsSizeable;
		Position		:= poDefaultPosOnly;
		BChange.Caption := '埋込(&G)';
//↓2005/01/14 T.Shimada
//		ClientHeight	:= 622;
//		ClientWidth		:= 945;
		ClientHeight	:= Trunc(622 * m_Zoom / 100);
		ClientWidth		:= Trunc(945 * m_Zoom / 100);
//↑
		iAction			:= ACTID_DOCKINGOUTEND;
	end
	// 埋め込み
	else
	begin
		Parent			:= TPanel(m_pMyAppRecord^.m_pOwnerPanel^);
		Align			:= alClient;
		BorderStyle		:= bsNone;
		BChange.Caption := '切出(&G)';
		iAction			:= ACTID_DOCKINGINEND;
	end;

	AppPara.iAction := iAction;
	AppPara.pRecord := Pointer( m_pMyAppRecord );
	AppPara.pActionParam := nil;

	TMjsAppRecord( m_pMyAppRecord^ ).m_pOwnerEntry( @AppPara );

	Visible := TRUE;

end;

//**************************************************************************
//	Proccess  :	削除ﾎﾞﾀﾝｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.BDelete_Click(Sender: TObject);
var
	iRet	:	Integer;
begin
// <007> 「当該ﾏｽﾀにﾃﾞｰﾀが存在している場合、削除すると管理表に不整合が生ずる恐れがあります。
//          削除してもよろしいですか？」
//	iRet := MjsMessageBoxEX(AOwner,   // <003>
//                            ''''+dxMemData1SimpleName.AsString+''''+'を削除します。よろしいですか？',
	iRet := MjsMessageBoxEX(AOwner,   // <003>
                            MSG_DELETE,
                            '削除',
                            mjQuestion,
                            mjYesNo,
                            mjDefNo
                           );
	if iRet <> mrYes then
		exit;

	DeleteSKMKMA();						// タイトル科目削除

	dxMemData1.Close;					// グリッド表示データ削除
	m_fUpdateRecord := 0;
	GetData();							// データ表示
	m_fUpdateRecord := 1;

	if dxMemData1GCode.AsInteger = 0 then
	begin
		BDelete.Enabled         :=  FALSE;
		GFBlue.Enabled          :=  FALSE;
		GFGreen.Enabled         :=  FALSE;
		GFOrange.Enabled        :=  FALSE;
		GFRed.Enabled           :=  FALSE;
        btnFusenCtl.ImageIndex  :=  4;
		btnFusenCtl.Enabled     :=  FALSE;
	end
	else
	begin
//<004>		BDelete.Enabled         :=  TRUE;
		BDelete.Enabled         :=  m_cJNTArea.IsDelete;
		GFBlue.Enabled          :=  TRUE;
		GFGreen.Enabled         :=  TRUE;
		GFOrange.Enabled        :=  TRUE;
		GFRed.Enabled           :=  TRUE;
        btnFusenCtl.ImageIndex  :=  m_FusenColorIdx;
//<004>		btnFusenCtl.Enabled     :=  TRUE;
		btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;
	end;

end;

//**************************************************************************
//	Proccess  :	ﾌｧﾝｸｼｮﾝﾎﾞﾀﾝｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.FFuncFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin
//	Showmessage(IntToStr(FuncNo));
end;

//**************************************************************************
//	Proccess  :	タイトル科目用ﾃﾞｰﾀｿｰｽStateChangeｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DataSource1StateChange(Sender: TObject);
begin
	if  (dxMemData1.State in [dsInsert]) then
	begin
//		DTitle.Columns [COL_GCODE].ReadOnly    := FALSE;
		dxMemData1GCode.ReadOnly := FALSE;
	end
	else
	begin
//		DTitle.Columns [COL_GCODE].ReadOnly    := TRUE;
		dxMemData1GCode.ReadOnly := TRUE;
	end;

	if  (dxMemData1.Active) then
	begin
		if  (DTitle.DataSource.DataSet.RecordCount = 0) then
		begin
//			DTitle.Columns [COL_GCODE].ReadOnly    := FALSE;
			dxMemData1GCode.ReadOnly := FALSE;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	タイトル科目dxGridｶﾗﾑ移動前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	iWork		:	Integer;
	stWork		:	String;
	QueryRead	:	TMQuery;
	stMessageRec: TMJSMsgRec;
begin
	case Column of
		COL_GCODE:							// 外部コード
		begin
			iWork := dxMemData1GCode.AsInteger;
			if iWork = 0 then
			begin
//				DTitle.FocusedColumn := COL_GCODE;						// コードに初期ﾌｫｰｶｽ
//				abort;
				CanChange := FALSE;
				exit;
			end;

			if dxMemData1GCode.ReadOnly = FALSE then
			begin
//            	ShowMessage('Column FALSE');
				QueryRead := TMQuery.Create (Self);
				MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

				try
					with QueryRead do
					begin
						Close;

						SQL.Clear;							// ｸｴﾘの初期化
						// 資金繰科目を外部ｺｰﾄﾞ昇順でGET
						SQL.Add('select * from SKmkMA');
						SQL.Add('where MasterKbn=7 AND RDelKbn=0 AND GCode=:iGCode');
						SQL.Add('order by Gcode');
						SetFld('iGCode').AsInteger := iWork;

						Open;						// ｸｴﾘの開始

						if EOF = FALSE then
						begin
	//						QueryRead.Free;
							MjsMessageBoxEX(AOwner,   // <003>
                                            '同一タイトル科目が登録済みです。',
                                            '登録',
                                            mjInformation,
                                            mjOk,
                                            mjDefOk
                                           );
							CanChange := FALSE;
							abort;
						end;
					end;
				finally
					QueryRead.Free;
				end;
			end;
		end;
		COL_REN:
		begin
		end;
		COL_L_NAME:
		begin
			stWork := dxMemData1SimpleName.AsString;
			if stWork = '' then
			begin
				dxMemData1.Edit;
				dxMemData1SimpleName.AsString := MjsCopy(dxMemData1LongName.AsString, 14);
			end;
		end;
		COL_S_NAME:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
			if dxMemData1DecoKbnCode.AsInteger = 0 then
			begin
				dxMemData1.Edit;
				dxMemData1DummyDeco.AsInteger := 0;
//				dxMemData1DecoKbnCode.AsInteger := 0;
				dxMemData1DecoKbnName.AsString := sDeco[0];
			end;
		end;
		COL_DECO_KBN_NM:
		begin
		end;
//		COL_TITLE_CODE:
//		begin
//			if dxMemData1TitleKbnCode.AsInteger = 0 then
//			begin
//				dxMemData1.Edit;
//				dxMemData1DummyTitle.AsInteger := 0;
//				dxMemData1TitleKbnCode.AsInteger := 0;
//				dxMemData1TitleKbnName.AsString := sTitle[0];
//			end;
//		end;
//		COL_TITLE_NAME:
//		begin
//		end;
		COL_REN_CODE:
		begin
			iWork := dxMemData1ConnectCode.AsInteger;
			if iWork = 0 then
			begin
				dxMemData1.Edit;
				dxMemData1ConnectName.AsString := '';
				exit;
			end;

			QueryRead := TMQuery.Create (Self);
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

			try
				with QueryRead do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 科目を外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select SimpleName from KmkMA');
					SQL.Add('where MasterKbn=1 AND RDelKbn=0 AND GCode=:iGCode');
					SQL.Add('order by Gcode');
					SetFld('iGCode').AsInteger := iWork;

					Open;						// ｸｴﾘの開始

					if EOF = FALSE then
					begin
						dxMemData1.Edit;
						dxMemData1ConnectName.AsString := GetFld('SimpleName').AsString;
					end
					else
					begin
						CanChange := FALSE;
						exit;
					end;

				end;
			finally
				QueryRead.Free;
			end;
		end;
		COL_REN_NAME:
		begin
		end;
		COL_MINUS:
		begin
		end;
	end;

	// ステータスバー消去
	SStatus.SimpleText := '';

	case NewColumn of
		COL_S_NAME:
		begin
			ComArea.m_MsgStd.GetMsg( stMessageRec, 30, 19);
			SStatus.SimpleText := stMessageRec.sMsg;
 		end;
	end;
end;

//**************************************************************************
//	Proccess  :	MemData1Post前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.dxMemData1BeforePost(DataSet: TDataSet);
var
	cField	:	TField;
	iCode	:	Integer;
	iWork	:	Integer;
	QueryRead	:	TMQuery;
begin
	if 	m_fUpdateRecord = 1 then
	begin
		// 外部コード
		iCode := dxMemData1GCode.AsInteger;
		cField  := dxMemData1GCode;

		//　外部コードの0は許さない
		if iCode = 0 then
		begin
			cField.FocusControl;
			abort;
		end;

		if dxMemData1.State in [dsInsert] then		// 新規ﾃﾞｰﾀ？
		begin
			QueryRead := TMQuery.Create (Self);
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

			try
				with QueryRead do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 資金繰科目を外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select * from SKmkMA');
					SQL.Add('where MasterKbn=7 AND RDelKbn=0 AND GCode=:iGCode');
					SQL.Add('order by Gcode');
					SetFld('iGCode').AsInteger := iCode;

					Open;						// ｸｴﾘの開始

					if (dxMemData1NCode.AsInteger <> GetFld('NCode').AsInteger) AND
						(dxMemData1GCode.AsInteger = GetFld('GCode').AsInteger) then
					begin
	//                    dxMemData1.Edit;
	//                	dxMemData1.ClearFields;
	//        			m_fUpdateRecord := 0;
	//                    dxMemData1.Post;
	//        			m_fUpdateRecord := 1;
						MjsMessageBoxEX(AOwner,   // <003>
                                        '同一タイトル科目が登録済みです。',
                                        '登録',
                                        mjInformation,
                                        mjOk,
                                        mjDefOk
                                       );
						cField  := dxMemData1GCode;
						cField.FocusControl;
						abort;
						exit;
					end;
				end;
			finally
				QueryRead.Free;
			end;
		end;

		//　装飾区分の''は許さない
		if dxMemData1DummyDeco.AsInteger = 0 then
		begin
			dxMemData1.Edit;
			dxMemData1DummyDeco.AsInteger := 0;
//			dxMemData1DecoKbnCode.AsInteger := 0;
			dxMemData1DecoKbnName.AsString := sDeco[0];
		end;

		//　タイトル種別の''は許さない
		if dxMemData1DummyTitle.AsInteger = 0 then
		begin
			dxMemData1.Edit;
			dxMemData1DummyTitle.AsInteger := 0;
//			dxMemData1TitleKbnCode.AsInteger := 0;
			dxMemData1TitleKbnName.AsString := sTitle[0];
		end;

		//　勘定科目チェック
		if dxMemData1ConnectCode.AsInteger <> 0 then
		begin
			cField  := dxMemData1ConnectCode;

			iWork := dxMemData1ConnectCode.AsInteger;
			if iWork = 0 then
				exit;

			QueryRead := TMQuery.Create (Self);
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

			try
				with QueryRead do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 科目を外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select SimpleName from KmkMA');
					SQL.Add('where MasterKbn=1 AND RDelKbn=0 AND GCode=:iGCode');
					SQL.Add('order by Gcode');
					SetFld('iGCode').AsInteger := iWork;

					Open;						// ｸｴﾘの開始

					if EOF = FALSE then
					begin
						dxMemData1.Edit;
						dxMemData1ConnectName.AsString	 := GetFld('SimpleName').AsString;
					end
					else
					begin
						cField.FocusControl;
						abort;
					end;

				end;
			finally
				QueryRead.Free;
			end;
		end;
	end;

	WriteSKMKMA();							// タイトル科目科目書込み
end;

//**************************************************************************
//	Proccess  :	MemData1Post後ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.dxMemData1AfterPost(DataSet: TDataSet);
begin
//	WriteSKMKMA();							// タイトル科目科目書込み
end;

//**************************************************************************
//	Proccess  :	タイトル科目DB書込みｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.WriteSKMKMA();
var
	QueryWrite	:	TMQuery;
// <013> MOD start
//    iNCode      :   Integer;
    iNCode      :   Extended;
// <013> MOD end
    bInsert		:	Boolean;						// T: 新規 F: 更新 <013>
begin
	if 	m_fUpdateRecord = 1 then
	begin
		QueryWrite := TMQuery.Create (Self);

// <013> MOD start
//		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);

											//  ｸﾞﾙｰﾌﾟ会計の子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								//  親会社に接続
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QueryWrite);
		end
		else
		begin								//  自社に接続
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);
		end;
// <013> MOD end

		SessionPractice(C_ST_PROCESS);		// <017>

		MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始
		ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);	//  <013> 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始

		try
			with QueryWrite do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化

				// ﾃﾞｰﾀ存在確認
				SQL.Add('select * from SKmkMA');
				SQL.Add('where MasterKbn=7 AND SumKbn=0 AND GCode=:iGCode AND RDelKbn=0');
				SetFld('iGCode').AsInteger := dxMemData1GCode.AsInteger;
				Open;

                bInsert := EOF;						// <013> ADD

				// タイトル科目をDBにWriteする
				if EOF = TRUE then	// 新規ﾃﾞｰﾀ？
				begin
//			showMessage('insert');

                    // 内部ｺｰﾄﾞの取得<FX>
                    iNCode := GetNewNCode;

					Close;
					SQL.Clear;							// ｸｴﾘの初期化
					// 挿入ｸｴﾘの作成
					SQL.Add('insert into SKmkMA');
					SQL.Add('(MasterKbn, SumKbn, RDelKbn, Ncode, Gcode, Renso,');
					SQL.Add('LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn,');
// FX					SQL.Add('MinusKbn, KmkKbn, TitleKbn, ConnectNCode, MinusName, UseKbn, KoteiKbn, NCode2)');
					SQL.Add('MinusKbn, KmkKbn, TitleKbn, ConnectNCode, MinusName, UseKbn, KoteiKbn');
					SQL.Add(', UpdTantoNCode)'); // <018>
					SQL.Add('values (:iMasterKbn, :iSumKbn, :iRDelKbn, :iNcode, :iGcode, :sRenChar,');
// FX					SQL.Add(':sLongName, :sSimpleName, 0, 0, :iDecoKbn, 0, 0, :iTitle, :iConnect, :sMinus, 0, 0, 1)');
					SQL.Add(':sLongName, :sSimpleName, 0, 0, :iDecoKbn, 0, 0, :iTitle, :iConnect, :sMinus, 0, 0');
					SQL.Add(', :cUpdTantoNCode)'); // <018>

					SetLength(m_aCmnt,Length(m_aCmnt)+1);	// 付箋コメント追加

					// ﾏｽﾀ区分
					SetFld('iMasterKbn').AsInteger := 7;
					// 実在/合計区分
					SetFld('iSumKbn').AsInteger := 0;
					// 内部ｺｰﾄﾞ
// <013> MOD start
//					SetFld('iNcode').AsInteger     := iNCode;
//                    dxMemData1NCode.AsInteger      := iNCode;
					SetFld('iNcode').AsFloat     := iNCode;
                    dxMemData1NCode.AsFloat      := iNCode;
// <013> MOD end
					// 外部ｺｰﾄﾞ
					SetFld('iGcode').AsInteger := dxMemData1GCode.AsInteger;	// <013> ADD
				end
				else
				begin
                	iNCode := GetFld('NCode').AsFloat;	// <013> ADD

					Close;
					SQL.Clear;							// ｸｴﾘの初期化
					// 更新ｸｴﾘの作成
					SQL.Add('update SKmkMA');
					SQL.Add('set RDelKbn = :iRDelKbn, Renso = :sRenChar, LongName = :sLongName, SimpleName = :sSimpleName,');
					SQL.Add('DecoKbn = :iDecoKbn, TitleKbn = :iTitle, ConnectNCode = :iConnect, MinusName = :sMinus');
					SQL.Add(',UpdTantoNCode = :cUpdTantoNCode'); // <018>
// <013> MOD start
//					SQL.Add('where MasterKbn = 7 AND SumKbn = 0 AND Gcode = :iGcode AND RDelKbn = 0');
					SQL.Add('where MasterKbn = 7 AND SumKbn = 0 AND NCode = :iNCode AND RDelKbn = 0');

                    SetFld('iNCode').AsFloat := iNCode;
// <013> MOD end
				end;

				// 削除区分
				SetFld('iRDelKbn').AsInteger := 0;

				// 外部ｺｰﾄﾞ
//				SetFld('iGcode').AsInteger      := dxMemData1GCode.AsInteger;	// <013> DEL
				// 連想ｼﾝﾎﾞﾙ
				SetFld('sRenChar').AsString     := fnDelCRLF(dxMemData1RenChar.AsString);       //<DKAI>
				// 正式名称
				SetFld('sLongName').AsString    := fnDelCRLF(dxMemData1LongName.AsString);      //<DKAI>
				// 簡略名称
				SetFld('sSimpleName').AsString  := fnDelCRLF(dxMemData1Simplename.AsString);    //<DKAI>
				// 装飾区分
				SetFld('iDecoKbn').AsInteger    := dxMemData1DummyDeco.AsInteger;
				// タイトル種別
				SetFld('iTitle').AsInteger      := dxMemData1DummyTitle.AsInteger;
				// 連動科目コード
				SetFld('iConnect').AsFloat      := gfnGetKmkMA_NCODE(dxMemData1ConnectCode.AsInteger,1);
				// マイナス変換科目名称
				SetFld('sMinus').AsString       := dxMemData1MinusName.AsString;
				// 更新担当者内部ｺｰﾄﾞ <018>
                SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryWrite);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <013> 親会社DBもﾛｰﾙﾊﾞｯｸ
					QueryWrite.Close;
					dxMemData1.Cancel;
					abort;
				end;

// <013> ADD start
											//  子会社の場合
				if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
				begin
					{親会社から子会社への同期取り(同期ｽﾄｱﾄﾞ呼出)}
											// SKMKMA同期
					if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
					begin					// 子会社のﾛｰﾙﾊﾞｯｸ
						MDataModule.Rollback (dbCorp_Select);
											// 親会社DBもﾛｰﾙﾊﾞｯｸ
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
						QueryWrite.Close;
						dxMemData1.Cancel;
						abort;
					end;
				end;

				{ ｸﾞﾙｰﾌﾟ会計を採用している場合、全子会社にRELを作成 }
                if (bInsert) and						// 新規
                	(m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE) then
				begin									// 全子会社にRELを作成
					if not fnAllCorpRelation(iNCode) then
					begin								// ﾛｰﾙﾊﾞｯｸ
						MDataModule.Rollback (dbCorp_Select);
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
						QueryWrite.Close;
						dxMemData1.Cancel;
						abort;
					end;
				end;
// <013> ADD end

				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
				ExecParentDBTran(GRP_PARENTDB_COMMIT);	//  <013> 親会社DBもｺﾐｯﾄ
			end;
		finally
			SessionPractice(C_ED_PROCESS);	// <017>
			QueryWrite.Free;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	タイトル科目DB削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DeleteSKMKMA();
var
	QueryDelete	:	TMQuery;
    exNCode		:	Extended;				// 内部ｺｰﾄﾞ <013> ADD
begin

	QueryDelete := TMQuery.Create (Self);

// <013> MOD start
//	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryDelete);
											//  ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin									//  親会社に接続
		MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QueryDelete);
	end
	else
	begin									//  自社に接続
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryDelete);
	end;
// <013> MOD end

	SessionPractice(C_ST_PROCESS);			// <017>

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	MDataModule.BeginTran (dbCorp_Select);
	ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);//  <013> 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始

	try
		with QueryDelete do
		begin
			// ﾀｲﾄﾙ科目の該当ﾚｺｰﾄﾞを読み込み内部ｺｰﾄﾞを取得
			Close();
			SQL.Clear();
			SQL.Add('SELECT NCode FROM SKmkMA       '
                +   'WHERE  (MasterKbn = 7)         '
                +   '  AND  (SumKbn    = 0)         '
                +   '  AND  (RDelKbn   = 0)         '
                +   '  AND  (Gcode     = :iGcode)   ');

			SetFld('iGcode').AsInteger := dxMemData1GCode.AsInteger;
			Open();

            exNCode := GetFld('NCode').AsFloat;	// <013> ADD

			// ﾀｲﾄﾙ科目の該当ﾚｺｰﾄﾞを削除ﾚｺｰﾄﾞにする
			Close();
			SQL.Clear();
			SQL.Add('UPDATE SKmkMA SET              '
			    +   '   RDelKbn =:iRDelKbn          '
			    +   '  ,UpdTantoNCode =:cUpdTantoNCode ' // <018>
			    +   'WHERE  (MasterKbn = 7)         '
                +   '  AND  (SumKbn    = 0)         '
                +   '  AND  (RDelKbn   = 0)         '
// <013> MOD start
(*                +   '  AND  (Gcode     = :iGcode)   ');
			// 外部ｺｰﾄﾞ
			SetFld('iGcode')    .AsInteger := dxMemData1GCode.AsInteger;
*)
                +   '  AND  (NCode     = :exNCode)   ');

			// 内部ｺｰﾄﾞ
			SetFld('exNCode')	.AsFloat := exNCode;
// <013> MOD end
			// ﾚｺｰﾄﾞ区分
			SetFld('iRDelKbn')  .AsInteger := 1;
            // 更新担当者内部ｺｰﾄﾞ <018>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryDelete);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <013> 親会社DBもﾛｰﾙﾊﾞｯｸ
				QueryDelete.Close;
				Exit;
			end;

            // ------------------------
			// 付箋管理情報削除
            // ------------------------
			Close();
			SQL.Clear();
			SQL.Add('DELETE FROM MFusenInfo         '
			    +   'WHERE  (MasterKbn = 7)         '
                +   '  AND  (NCode     = :iNCode)   '
                +   '  AND  (SubNCode  = :iSubCode) ');
			SetFld('iNcode')    .AsFloat    :=  dxMemData1NCode.AsFloat;
			SetFld('iSubcode')  .AsInteger  :=  0;
			// DB更新
			if ( ExecSQL = FALSE ) then
			begin
				ErrorMessageDsp(QueryDelete);
                // ﾛｰﾙﾊﾞｯｸ(破棄)
				MDataModule.Rollback (dbCorp_Select);
				ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <013> 親会社DBもﾛｰﾙﾊﾞｯｸ
				QueryDelete.Close();
				Exit;
			end;

// <013> ADD start
											//  子会社の場合
			if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
			begin
            	{RELの削除区分も1にしないと同期できない}
	            Close();
				SQL.Clear();
				SQL.Add('Update SKmkMA_REL         '
        	    	+	'SET RDelKbn_REL = 1 '
				    +   'WHERE  (MasterKbn = 7)         '
            	    +   '  AND  (NCode     = :iNCode)   ');

				SetFld('iNcode')    .AsFloat    :=  exNCode;

				// DB更新
				if ( ExecSQL = FALSE ) then
				begin
					ErrorMessageDsp(QueryDelete);
        	        // ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
					QueryDelete.Close();
					Exit;
				end;

				{親会社から子会社への同期取り(同期ｽﾄｱﾄﾞ呼出)}
											// SKMKMA同期
				if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
				begin
	                // ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
					QueryDelete.Close();
					Exit;
				end;
			end;
// <013> ADD end

            // ｺﾐｯﾄ(反映)
			MDataModule.Commit (dbCorp_Select);
			ExecParentDBTran(GRP_PARENTDB_COMMIT);	//  <013> 親会社DBもｺﾐｯﾄ
		end;
	finally
		SessionPractice(C_ED_PROCESS);		// <017>
		QueryDelete.Free();
	end;

end;

//**************************************************************************
//	Proccess  :	タイトル科目ﾎﾟｯﾌﾟｱｯﾌﾟｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.PMTitlePopup(Sender: TObject);
var
    QueryFusen  :   TMQuery;
begin

    if ( not m_cJNTArea.IsFusen ) then
    begin
		PMTitle.Items[0].Enabled    :=  FALSE;
		PMTitle.Items[1].Enabled    :=  FALSE;
		PMTitle.Items[2].Enabled    :=  FALSE;
		PMTitle.Items[3].Enabled    :=  FALSE;
		PMTitle.Items[4].Enabled    :=  FALSE;
		PMTitle.Items[5].Enabled    :=  FALSE;
		PMTitle.Items[6].Enabled    :=  FALSE;
    end;

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

	try
		with QueryFusen do
		begin
            // ----------------------------------
			// 資金繰科目科目付箋情報を取得
            // ----------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo       '
			    +   'WHERE  (MasterKbn = 7)         '
                +   '  AND  (NCode     = :iNCode)   ');
			SetFld('iNCode').AsFloat    :=  dxMemData1NCode.AsFloat;
			Open();

			if ( EOF = FALSE ) then
			begin
				PMTitle.Items[0].Visible    :=  TRUE;
				PMTitle.Items[1].Visible    :=  TRUE;
				PMTitle.Items[2].Visible    :=  TRUE;
				case GetFld('FusenKbn').AsInteger of
					RED:
					begin
						PMTitle.Items[3].Visible    :=  FALSE;
						PMTitle.Items[4].Visible    :=  TRUE;
						PMTitle.Items[5].Visible    :=  TRUE;
						PMTitle.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFRed.Bitmap);
					end;
					BLUE:
					begin
						PMTitle.Items[3].Visible    :=  TRUE;
						PMTitle.Items[4].Visible    :=  FALSE;
						PMTitle.Items[5].Visible    :=  TRUE;
						PMTitle.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFBlue.Bitmap);
					end;
					GREEN:
					begin
						PMTitle.Items[3].Visible    :=  TRUE;
						PMTitle.Items[4].Visible    :=  TRUE;
						PMTitle.Items[5].Visible    :=  FALSE;
						PMTitle.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFGreen.Bitmap);
					end;
					ORANGE:
					begin
						PMTitle.Items[3].Visible    :=  TRUE;
						PMTitle.Items[4].Visible    :=  TRUE;
						PMTitle.Items[5].Visible    :=  TRUE;
						PMTitle.Items[6].Visible    :=  FALSE;
						GFDel.Bitmap.Assign(GFOrange.Bitmap);
					end;
				end;
			end
			else
			begin
				PMTitle.Items[0].Visible    :=  FALSE;
				PMTitle.Items[1].Visible    :=  FALSE;
				PMTitle.Items[2].Visible    :=  FALSE;
				PMTitle.Items[3].Visible    :=  TRUE;
				PMTitle.Items[4].Visible    :=  TRUE;
				PMTitle.Items[5].Visible    :=  TRUE;
				PMTitle.Items[6].Visible    :=  TRUE;
			end;

		end;
	finally
		QueryFusen.Free();
	end;

end;

//**************************************************************************
//	Proccess  :	タイトル科目ﾎﾟｯﾌﾟｱｯﾌﾟ削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ(各色)
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DeleteClick(Sender: TObject);
begin
	BDelete_Click(Sender);
end;

//**************************************************************************
//	Proccess  :	タイトル科目ﾎﾟｯﾌﾟｱｯﾌﾟ付箋貼り付けｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ(各色)
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.GFBlueOffClick(Sender: TObject);
var
	iCode   :   Extended;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

    FusenInfoWrite(BLUE, iCode, FALSE);

	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	m_aCmnt[dxMemData1.RecNo-1].Code    :=  0;
	m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  '';

end;

procedure TJNTCRP009002_2f.GFGreenOffClick(Sender: TObject);
var
	iCode   :   Extended;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

    FusenInfoWrite(GREEN, iCode, FALSE);
	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	m_aCmnt[dxMemData1.RecNo-1].Code    :=  0;
	m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  '';

end;

procedure TJNTCRP009002_2f.GFOrangeOffClick(Sender: TObject);
var
	iCode   :   Extended;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

    FusenInfoWrite(ORANGE, iCode, FALSE);
	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	m_aCmnt[dxMemData1.RecNo-1].Code    :=  0;
	m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  '';

end;

procedure TJNTCRP009002_2f.GFRedOffClick(Sender: TObject);
var
	iCode   :   Extended;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

    FusenInfoWrite(RED, iCode, FALSE);
	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	m_aCmnt[dxMemData1.RecNo-1].Code    :=  0;
	m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  '';

end;

procedure TJNTCRP009002_2f.GFBlueOnClick(Sender: TObject);
var
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

	FusenInfoWrite(BLUE, iCode, TRUE);

	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  7;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  BLUE;
	MasDLGParam.m_pApRec		:=  Pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		m_aCmnt[dxMemData1.RecNo-1].Code    :=  iCode;
		m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  sCmnt;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_2f.GFGreenOnClick(Sender: TObject);
var
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

	FusenInfoWrite(GREEN, iCode, TRUE);

	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  7;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  GREEN;
	MasDLGParam.m_pApRec		:=  Pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		m_aCmnt[dxMemData1.RecNo-1].Code    :=  iCode;
		m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  sCmnt;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_2f.GFOrangeOnClick(Sender: TObject);
var
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

	FusenInfoWrite(ORANGE, iCode, TRUE);

	FusenDsp(iCode, 1);

	m_fUpdateRecord :=  0;
	dxMemData1.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  7;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  ORANGE;
	MasDLGParam.m_pApRec		:=  Pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		m_aCmnt[dxMemData1.RecNo-1].Code    :=  iCode;
		m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  sCmnt;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_2f.GFRedOnClick(Sender: TObject);
var
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iCode   :=  dxMemData1NCode.AsFloat;

	FusenInfoWrite(RED, iCode, TRUE);

	FusenDsp(iCode, 1);

	m_fUpdateRecord := 0;
	dxMemData1.Post;
	m_fUpdateRecord := 1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  7;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  RED;
	MasDLGParam.m_pApRec		:=  Pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		m_aCmnt[dxMemData1.RecNo-1].Code    :=  iCode;
		m_aCmnt[dxMemData1.RecNo-1].Cmnt    :=  sCmnt;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_2f.GFDelClick(Sender: TObject);
var
	iCode		:	Integer;
begin
	iCode := dxMemData1GCode.AsInteger;

	FusenInfaDelete(iCode);
	dxMemData1.Edit;
	dxMemData1Fusen.Clear;
	dxMemData1FusenIndex.AsInteger := NOCOLOR;

	m_fUpdateRecord := 0;
	dxMemData1.Post;
	m_fUpdateRecord := 1;

	m_aCmnt[dxMemData1.RecNo-1].Code := 0;
	m_aCmnt[dxMemData1.RecNo-1].Cmnt := '';

end;

// 付箋備考修正イベント
procedure TJNTCRP009002_2f.GFReClick(Sender: TObject);
var
	MasDLGParam :	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	QueryFusen	:	TMQuery;
	iColor		:	Integer;
	sCmnt		:	String;
begin

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

	try
		with QueryFusen do
		begin
            // ---------------------------------
			// 資金繰科目科目付箋情報を取得
            // ---------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT FusenKbn FROM MFusenInfo    '
			    +   'WHERE  (MasterKbn = 7)             '
                +   '  AND  (NCode     = :iNCode)       ');
			SetFld('iNCode').AsFloat    :=  dxMemData1NCode.AsFloat;
			Open();

			iColor  :=  GetFld('FusenKbn').AsInteger;
		end;
	finally
		QueryFusen.Free();
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam				    :=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  7;
	MasDLGParam.m_iNCode		:=  dxMemData1NCode.AsFloat;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  iColor;
	MasDLGParam.m_pApRec		:=  Pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		m_aCmnt[dxMemData1.RecNo-1].Code := dxMemData1NCode.AsFloat;
		m_aCmnt[dxMemData1.RecNo-1].Cmnt := sCmnt;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

//**********************************************************************
//	Proccess	:	付箋表示処理
//	Name		:	N.Nabe
//	Date		:	2000/08/23
//	Return		:
//	History		:	9999/99/99	X.Xxxx
//					XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009002_2f.FusenDsp(iCode : Extended; iFlg : Integer);
var
    QueryFusen  :   TMQuery;
begin

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

	try
		with QueryFusen do
		begin
            // ----------------------------------
			// 資金繰科目科目付箋情報を取得
            // ----------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo       '
			    +   'WHERE  (MasterKbn = 7)         '
                +   '  AND  (NCode     = :iNCode)   ');
			SetFld('iNCode').AsFloat    :=  iCode;
			Open();

			if ( EOF = FALSE ) then
			begin
				if ( iFlg = 1 ) then
					dxMemData1.Edit;
				dxMemData1Fusen.Clear;
				dxMemData1FusenIndex.AsInteger := GetFld('FusenKbn').AsInteger;

                // ↓↓↓<006>
                case GetFld('FusenKbn').AsInteger of
    				RED     :	dxMemData1Fusen.Assign(Image_Fusen_Red   .Picture.Bitmap);
    				GREEN   :	dxMemData1Fusen.Assign(Image_Fusen_Green .Picture.Bitmap);
    				BLUE    :	dxMemData1Fusen.Assign(Image_Fusen_Blue  .Picture.Bitmap);
    				ORANGE  :	dxMemData1Fusen.Assign(Image_Fusen_Orange.Picture.Bitmap);
				end;
                // ↑↑↑<006>
{
				case GetFld('FusenKbn').AsInteger of
    				RED:	dxMemData1Fusen.Assign(GFRed.Bitmap);
    				GREEN:	dxMemData1Fusen.Assign(GFGreen.Bitmap);
    				BLUE:	dxMemData1Fusen.Assign(GFBlue.Bitmap);
    				ORANGE:	dxMemData1Fusen.Assign(GFOrange.Bitmap);
				end;
} // <006>
			end
			else
			begin
				if ( iFlg = 1 ) then
					dxMemData1.Edit;
				dxMemData1FusenIndex.AsInteger := NOCOLOR;
			end;
		end;
	finally
		QueryFusen.Free();
	end;

end;

//**********************************************************************
//	Proccess	:	付箋情報書込み処理
//	Name		:	N.Nabe
//	Date		:	2000/08/23
//	Return		:
//	History		:	9999/99/99	X.Xxxx
//					XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009002_2f.FusenInfoWrite(iColor : Integer; iCode : Extended; bSw: Boolean);
var
	QueryFusen  :	TMQuery;
	sCmnt		:	String;
begin

	QueryFusen := TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	MDataModule.BeginTran (dbCorp_Select);

	try
		with QueryFusen do
		begin
            // ---------------------------------
			// 資金繰科目科目付箋情報を取得
            // ---------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo           '
			    +   'WHERE  (MasterKbn = 7)             '
                +   '  AND  (NCode     = :iNCode)       '
                +   '  AND  (SubNCode  = :iSubNCode)    ');
			SetFld('iNCode')    .AsFloat    :=  iCode;
			SetFld('iSubNCode') .AsFloat    :=  0;
			Open();

			if ( EOF = FALSE ) then
			begin
				// 付箋ｺﾒﾝﾄ退避
				sCmnt   :=  GetFld('FusenCmnt').AsString;

                // -------------------
				// 削除ｸｴﾘの作成
                // -------------------
				Close();
				SQL.Clear();
				SQL.Add('DELETE FROM MFusenInfo             '
				    +   'WHERE  (MasterKbn = 7)             '
                    +   '  AND  (NCode     = :iNCode)       '
                    +   '  AND  (SubNCode  = :iSubNCode)    ');
				SetFld('iNCode')    .AsFloat    :=  iCode;
				SetFld('iSubNCode') .AsFloat    :=  0;

				// DB更新
				if ( ExecSQL = FALSE ) then
				begin
					ErrorMessageDsp(QueryFusen);
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
					QueryFusen.Close();
					Exit;
				end;
			end;

            // -------------------
			// 挿入ｸｴﾘの作成
            // -------------------
			Close();
			SQL.Clear();
			SQL.Add('INSERT INTO MFusenInfo (   '
			    +   '    MasterKbn              '
                +   '   ,NCode                  '
                +   '   ,SubNCode               '
                +   '   ,FusenKbn               '
                +   '   ,FusenCmnt              '
                +   '   ,UpdTantoNCode          '
                +   ') VALUES (                 '
			    +   '    :iMasterKbn            '
                +   '   ,:iNCode                '
                +   '   ,:iSubNCode             '
                +   '   ,:iFusenKbn             '
                +   '   ,:sFusenCmnt            '
                +   '   ,:cUpdTantoNCode        '
                +   ')                          ');

			SetFld('iMasterKbn')    .AsInteger  :=  7;
			SetFld('iNCode')        .AsFloat    :=  iCode;
			SetFld('iSubNCode')     .AsFloat    :=  0;
			SetFld('iFusenKbn')     .AsInteger  :=  iColor;

			if ( bSw = TRUE ) then
    				SetFld('sFusenCmnt').AsString   :=  sCmnt
			else    SetFld('sFusenCmnt').AsString   :=  '';
            // 更新担当者内部ｺｰﾄﾞ <018>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if ( ExecSQL = FALSE ) then
			begin
				ErrorMessageDsp(QueryFusen);
                // ﾛｰﾙﾊﾞｯｸ(破棄)
				MDataModule.Rollback (dbCorp_Select);
				QueryFusen.Close();
				Exit;
			end;

            // ｺﾐｯﾄ(反映)
			MDataModule.Commit (dbCorp_Select);
		end;
	finally
		QueryFusen.Free();
	end;

end;

//**********************************************************************
//	Proccess	:	付箋情報削除処理
//	Name		:	N.Nabe
//	Date		:	2000/08/23
//	Return		:
//	History		:	9999/99/99	X.Xxxx
//					XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009002_2f.FusenInfaDelete(iCode: Extended);
var
    QueryFusen  :   TMQuery;
begin

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	MDataModule.BeginTran ( dbCorp_Select );

	try
		with QueryFusen do
		begin
            // ---------------------------------
			// 資金繰科目科目付箋情報を取得
            // ---------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo           '
			    +   'WHERE  (MasterKbn = 7)             '
                +   '  AND  (NCode     = :iNCode)       '
                +   '  AND  (SubNCode  = :iSubNCode)    ');
			SetFld('iNCode')    .AsFloat    :=  iCode;
			SetFld('iSubNCode') .AsFloat    :=  0;
			Open();

			if ( EOF = FALSE ) then
			begin
                // -------------------
				// 削除ｸｴﾘの作成
                // -------------------
				Close();
				SQL.Clear();
				SQL.Add('DELETE FROM MFusenInfo             '
				    +   'WHERE  (MasterKbn = 7)             '
                    +   '  AND  (NCode     = :iNCode)       '
                    +   '  AND  (SubNCode  = :iSubNCode)    ');
				SetFld('iNCode')    .AsFloat    :=  iCode;
				SetFld('iSubNCode') .AsFloat    :=  0;

				// DB更新
				if ( ExecSQL = FALSE ) then
				begin
					ErrorMessageDsp(QueryFusen);
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
					QueryFusen.Close();
					Exit;
				end;

                // ｺﾐｯﾄ(反映)
				MDataModule.Commit (dbCorp_Select);
			end;
		end;
	finally
		QueryFusen.Free();
	end;

end;

//**************************************************************************
//	Proccess  :	タイトル科目行移動ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleChangeNodeEx(Sender: TObject);
begin
	if giReferFlag = REFER then
		exit;

	if (DTitle.DataSource.DataSet.FieldByName('GCode').IsNull) then	//	実在GridのｺｰﾄﾞがNullの時
	begin
		BDelete.Enabled         :=  FALSE;
		GFBlue.Enabled          :=  FALSE;
		GFGreen.Enabled         :=  FALSE;
		GFOrange.Enabled        :=  FALSE;
		GFRed.Enabled           :=  FALSE;
        btnFusenCtl.ImageIndex  :=  4;
		btnFusenCtl.Enabled     :=  FALSE;

		DTitle.FocusedColumn := COL_GCODE;
	end
	else
	begin
		if dxMemData1.State in [dsInsert] then	// ﾃﾞｰﾀ挿入中？
		begin
			BDelete.Enabled         :=  FALSE;
			GFBlue.Enabled          :=  FALSE;
			GFGreen.Enabled         :=  FALSE;
			GFOrange.Enabled        :=  FALSE;
			GFRed.Enabled           :=  FALSE;
            btnFusenCtl.ImageIndex  :=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			GFBlue.Enabled          :=  TRUE;
			GFGreen.Enabled         :=  TRUE;
			GFOrange.Enabled        :=  TRUE;
			GFRed.Enabled           :=  TRUE;
            btnFusenCtl.ImageIndex  :=  m_FusenColorIdx;
//<004>			btnFusenCtl.Enabled     :=  TRUE;
            btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;
		end;
	end;

end;

//**************************************************************************
//	Proccess  :	タイトル科目上矢印キーｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if giReferFlag = REFER then
		exit;

//	if Key = VK_UP then
//	begin
//		BDelete.Enabled := TRUE;
//		Delete.Enabled := TRUE;
//		GFBlue.Enabled := TRUE;
//		GFGreen.Enabled := TRUE;
//		GFOrange.Enabled := TRUE;
//		GFRed.Enabled := TRUE;
//	end;

end;

//**************************************************************************
//	Proccess  :	タイトル科目キー押下ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	//  ↑カーソル or PageUp
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then
	begin
		if ( DTitle.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	//	TAB AND SHIFT  ←カーソル and 編集中ではない
	if ((Key = VK_TAB) and (Shift = [ssShift])) or
				((Key = VK_LEFT) and (DTitle.State <> tsEditing))then
	begin
		if ( DTitle.FocusedColumn = 1 ) and ( DTitle.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	if (Key = VK_INSERT) then
		abort;
end;

//**************************************************************************
//	Proccess  :	タイトル科目ﾏｳｽｸﾘｯｸｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	iFocus	:	Integer;
	cField	:	TField;
begin
	iFocus := DTitle.FocusedColumn;					// ﾌｫｰｶｽ位置

	case iFocus of
		COL_FUSEN:
		begin
			cField  := dxMemData1GCode;
			cField.FocusControl;
			abort;
			exit;
		end;
		COL_GCODE:							// 外部コード
		begin
		end;
		COL_REN:
		begin
		end;
		COL_L_NAME:
		begin
		end;
		COL_S_NAME:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
		end;
		COL_DECO_KBN_NM:
		begin
			cField  := dxMemData1DecoKbnCode;
			cField.FocusControl;
			abort;
			exit;
		end;
//		COL_TITLE_CODE:
//		begin
//		end;
//		COL_TITLE_NAME:
//		begin
//			cField  := dxMemData1TitleKbnCode;
//			cField.FocusControl;
//			abort;
//			exit;
//		end;
		COL_REN_CODE:
		begin
		end;
		COL_REN_NAME:
		begin
			cField  := dxMemData1ConnectCode;
			cField.FocusControl;
			abort;
			exit;
		end;
		COL_MINUS:
		begin
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	タイトル科目EXITｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleExit(Sender: TObject);
begin
	if m_fEnd = 0 then
	begin
		if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
		begin
			dxMemData1.Post;
		end;
	end;

    BDelete.Enabled         :=  FALSE;
	GFBlue.Enabled          :=  FALSE;
	GFGreen.Enabled         :=  FALSE;
	GFOrange.Enabled        :=  FALSE;
	GFRed.Enabled           :=  FALSE;
    btnFusenCtl.ImageIndex  :=  4;
	btnFusenCtl.Enabled     :=  FALSE;

end;

//**************************************************************************
//	Proccess  :	タイトル科目連動科目EditBottonClickｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ   <002>
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_2f.DTitleConnectCodeEditButtonClick(Sender: TObject);
var
    lvExpSend   :   rcJNTExpSend;   // 親BPL送信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    lvExpRecv   :   rcJNTExpRecv;   // 親BPL受信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    iExpRtn     :   Integer;        // 戻り値
begin

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam( @lvExpSend );
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pMyAppRecord;                     // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;                     // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;       //
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;       //

    lvExpSend.MasterKbn     :=  1;                                  // ﾏｽﾀ区分
    lvExpSend.ModulKbn      :=  0;                                  // ﾓｼﾞｭｰﾙ区分(共通=0)
    lvExpSend.PatternNo     :=  1;                                  // ﾊﾟﾀｰﾝNo.
    lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';                     // ﾂｰﾙﾊﾞｰｷｬﾌﾟｼｮﾝ
    lvExpSend.TableName     :=  'KmkMA';                            // ﾃｰﾌﾞﾙ名
    lvExpSend.WhereStr      :=  'MasterKbn=1 and RDelKbn=0';
    lvExpSend.SortStr       :=  'Order By GCode';
    lvExpSend.TrRootCaption :=  '';

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり?
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin
        dxMemData1.Edit;
        // 連結科目ｺｰﾄﾞ
        dxMemData1ConnectCode.AsInteger :=  StrToInt(lvExpRecv.GCode);
        // 連結科目名称
        dxMemData1ConnectName.AsString  :=  lvExpRecv.NMK;
    end
    else
    begin
        dxMemData1.Edit;
		// 連結科目ｺｰﾄﾞ
		dxMemData1ConnectCode.AsInteger := 0;
		// 連結科目名称
		dxMemData1ConnectName.AsString := '';
    end;

    // Enter ｷｰのｴﾐｭﾚｲﾄ
    keybd_event(VK_RETURN, 0, 0, 0);
	Abort;

end;

//**********************************************************************
//*		Proccess	:	ｴﾗｰﾒｯｾｰｼﾞ表示処理
//*		Name		:	H.Endo
//*		Date		:	2001/2/16
//*		Parameter	:	DmQuery		:	ｴﾗｰになったQuery
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP009002_2f.ErrorMessageDsp(DmQuery: TMQuery);
begin
	case ComArea.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
			//	最大登録件数をｵｰﾊﾞｰしました
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 0, 1 );
			MjsMessageBoxEx(AOwner,   // <003>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		2:
		begin
			//	･･･のため削除できません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 5 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '固定体系区分が固定' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		3:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '子供が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		4:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '仕訳が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
//--- 追加 START -----
		5:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '諸口、総合計を削除する時にその他のマスタが登録済みの為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		6:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '支払予定データが存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		7:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '部署情報が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		8:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30, 18 );
			MjsMessageBoxEx(AOwner,   // <003>
                            '未連結仕訳(部署or分散)が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
//--- 追加  END  -----
// <010> ↓
        -193, -196:
        begin
            // 重複ｴﾗｰ
            ComArea.m_MsgStd.GetMsg ( MjsMsgRec, 10000, 10017 );
			MjsMessageBoxEx(AOwner, // <003>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
        end;
        -210:
        begin
            // ﾛｯｸｴﾗｰ
            ComArea.m_MsgStd.GetMsg ( MjsMsgRec, 10000, 10016 );
			MjsMessageBoxEx(AOwner, // <003>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
        end;
// <010> ↑
		else
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmQuery );
			MjsMessageBoxEx(AOwner,   // <003>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	参照・更新時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Name		:	N.Nabe
//*		Date		:	2001/2/2
//*		Parameter	:	Select		:	REFER(参照)･NORMAL(通常処理)･BASICONLY(基本のみ設定可能)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP009002_2f.DisplayControl(Select: Integer);
begin
	if (Select = REFER) then
	begin
		//	実在Grid
		DTitle.Options	:=	DTitle.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		DTitleFusen.ReadOnly		:= TRUE;
		DTitleGCode.ReadOnly		:= TRUE;
		DTitleRenChar.ReadOnly		:= TRUE;
		DTitleLongName.ReadOnly		:= TRUE;
		DTitleSimpleName.ReadOnly	:= TRUE;
		DTitleConnectName.ReadOnly	:= TRUE;
		DTitleMinusName.ReadOnly	:= TRUE;
		DTitleDummyTitle.ReadOnly	:= TRUE;
		DTitleTitleKbnCode.ReadOnly	:= TRUE;
		DTitleTitleKbnName.ReadOnly	:= TRUE;

//<004>		BDelete.Enabled	        :=	FALSE;
		BDelete.Enabled	        :=	m_cJNTArea.IsDelete;

        if ( m_cJNTArea.IsFusen ) then
        begin
            btnFusenCtl.ImageIndex  :=  m_FusenColorIdx;
//<004>		    btnFusenCtl.Enabled     :=  TRUE;
            btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;
        end else
        begin
            btnFusenCtl.ImageIndex  :=  4;
	    	btnFusenCtl.Enabled     :=  FALSE;
        end;

//<004>		DTitle.PopupMenu	    :=	nil;
		DTitle.PopupMenu	    :=	PMTitle;
	end
	else
	begin
		//	実在Grid
		DTitle.Options	:=	DTitle.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		DTitleFusen.ReadOnly		:= FALSE;
		DTitleGCode.ReadOnly		:= FALSE;
		DTitleRenChar.ReadOnly		:= FALSE;
		DTitleLongName.ReadOnly		:= FALSE;
		DTitleSimpleName.ReadOnly	:= FALSE;
		DTitleConnectName.ReadOnly	:= FALSE;
		DTitleMinusName.ReadOnly	:= FALSE;
		DTitleDummyTitle.ReadOnly	:= FALSE;
		DTitleTitleKbnCode.ReadOnly	:= FALSE;
		DTitleTitleKbnName.ReadOnly	:= FALSE;

//<004>		BDelete.Enabled	        :=  TRUE;
		BDelete.Enabled	        :=  m_cJNTArea.IsDelete;
        btnFusenCtl.ImageIndex  :=  m_FusenColorIdx;
//<004>		btnFusenCtl.Enabled     :=  TRUE;
        btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;
		DTitle.PopupMenu	    :=	PMTitle;
	end;
end;

procedure TJNTCRP009002_2f.DTitleKeyPress(Sender: TObject; var Key: Char);
begin
	if  (DTitle.FocusedColumn = COL_GCODE) then
	begin
		if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) and (Key <> #13) then
		begin                          // #8=BackSpace   #27=Esc  #9=Tab #13=Enter
			Beep ();
			Abort;
		end;
	end;
end;

// 付箋ボタンクリック
procedure TJNTCRP009002_2f.btnFusenCtl_Click(Sender: TObject);
var
	iColor	:	Integer;
	iIndex	:	Integer;
	iCode	:	Extended;
begin

	iIndex  :=  0;

	iColor  :=  dxMemData1FusenIndex.AsInteger;
	iCode   :=  dxMemData1NCode     .AsFloat;

	case iColor of
		NOCOLOR :	iIndex  :=  99;
		RED     :	iIndex  :=  0;
		GREEN   :	iIndex  :=  2;
		BLUE    :	iIndex  :=  1;
		ORANGE  :   iIndex  :=  3;
	end;

    // 同色を設定→はがす。
	if ( btnFusenCtl.ImageIndex = iIndex ) then
		GFDelClick(Sender)
	else
	begin
		case btnFusenCtl.ImageIndex of
			0:  iColor  :=  RED;
			1:	iColor  :=  BLUE;
			2:	iColor  :=  GREEN;
			3:	iColor  :=  ORANGE;
		end;

		FusenInfoWrite(iColor, iCode, TRUE);
		FusenDsp(iCode, 1);

		m_fUpdateRecord :=  0;
		dxMemData1.Post;
		m_fUpdateRecord :=  1;
	end;

end;

// 付箋ボタンdropdownクリック
procedure TJNTCRP009002_2f.FusenListClick(Sender: TObject);
begin
	btnFusenCtl.ImageIndex := TControl(Sender).Tag-1;

    m_FusenColorIdx :=  btnFusenCtl.ImageIndex;
end;

// マウス移動イベント
procedure TJNTCRP009002_2f.DTitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	Row	:	Integer;
begin
  inherited;
	// 付箋備考表示処理
	Row	:= Y div DTitle.DefaultRowHeight + DTitle.TopIndex;

	if (Row <> m_HintRow) then
	begin
		m_HintRow		:= Row;
		DTitle.Hint		:= '';
		DTitle.ShowHint	:= FALSE;
		exit;
	end;

	//	付箋の枠以外
	if (X < 12) or (X > 32) then
		exit;

	if (Y >= 0) and (Y <= 17) then
		exit;

	//	行
	if (Row = m_HintRow) and (DTitle.ShowHint = TRUE) then
		Exit;

	if (Row <= dxMemData1.RecordCount) and (m_aCmnt[Row-1].Cmnt <> '') then
	begin
		DTitle.Hint		:= m_aCmnt[Row-1].Cmnt;
		DTitle.ShowHint	:= TRUE;
	end;
end;

procedure TJNTCRP009002_2f.DTitleDecoKbnCodeCloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
begin
	if bEBFlg = FALSE then
		bEBFlg := TRUE
	else
		bEBFlg := FALSE;
end;

//**********************************************************************
//*		Proccess	:	新規追加の内部ｺｰﾄﾞ取得
//*		Name		:	K.Takahashi
//*		Date		:	2005/02/07
//*		Parameter	:	なし
//*		Return		:	Integer　内部ｺｰﾄﾞ(異常：-1)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//*                     2007/05/08  K.Katou
//*                                 戻り値の型変更(Integer→Extended)
//**********************************************************************
//function TJNTCRP009002_2f.GetNewNCode():Integer;	// <013> DEL
function TJNTCRP009002_2f.GetNewNCode():Extended;	// <013> ADD
var
	QueryWk   : TMQuery;
begin
    Result := -1;

    										//MQueryの構築
	QueryWk := TMQuery.Create( Self );
	try
											//DBとMQueryの接続
// <013> MOD start
//    	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryWk );

											//  ｸﾞﾙｰﾌﾟ会計の子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								//  親会社に接続
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QueryWk);
		end
		else
		begin								//  自社に接続
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWk);
		end;
// <013> MOD end

	    QueryWk.Close;
    	QueryWk.SQL.Clear;
	    QueryWk.SQL.ADD('Select MAX(NCode) as MaxNcode From SKMKMA');

        try
       	    QueryWk.Open;
        except
		    ErrorMessageDsp(QueryWk);
			Exit;
        end;

    	if QueryWk.Eof <> TRUE then
	    begin
                                            // 内部ｺｰﾄﾞの最大+1
// <013> MOD start
//    		Result := QueryWk.GetFld('MaxNcode').AsInteger + 1;
    		Result := QueryWk.GetFld('MaxNcode').AsInteger + 1;
// <013> MOD end
        end
        else
        begin
            Result := 1;                    // 1ｵﾘｼﾞﾝ
	    end;
    finally
	    QueryWk.Free;
    end;
end;

// =============================================================================
// 科目外部ｺｰﾄﾞ取得処理
// =============================================================================
function TJNTCRP009002_2f.gfnGetKmkMA_GCODE(nNCode:Extended; nMasCode: Integer):Integer;
var
    DmqKmkMA   :   TMQuery;
begin
    Result  :=  0;

    DmqKmkMA := TMQuery.Create( Self );					            //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqKmkMA );	    //	DBとMQueryのS接続

    with DmqKmkMA do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT GCODE FROM KmkMA        '
            +   'WHERE MasterKbn = :MasKbn      '
            +   '  AND RDelKbn   = 0            '
            +   '  AND NCode     = :CODE        ');
        ParamByName('MasKbn').AsInteger :=  nMasCode;
        ParamByName('CODE')     .AsFloat  :=  nNCode;
        Open();

        if not EOF then
            Result  :=  GetFld('GCODE').AsInteger;

        Close();
    end;

    DmqKmkMA.Close();
    DmqKmkMA.Free();

end;

// =============================================================================
// 科目内部ｺｰﾄﾞ取得処理
// =============================================================================
function TJNTCRP009002_2f.gfnGetKmkMA_NCODE(nGCode,nMasCode: Integer):Extended;
var
    DmqKmkMA   :   TMQuery;
begin
    Result  :=  0;

    DmqKmkMA := TMQuery.Create( Self );					            //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqKmkMA );	    //	DBとMQueryのS接続

    with DmqKmkMA do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT NCODE FROM KmkMA        '
            +   'WHERE MasterKbn = :MasKbn      '
            +   '  AND RDelKbn   = 0            '
            +   '  AND GCode     = :CODE        ');
        ParamByName('MasKbn').AsInteger :=  nMasCode;
		ParamByName('CODE').AsInteger   :=  nGCode;
        Open();

        if not EOF then
            Result  :=  GetFld('NCODE').AsFloat;

        Close();
    end;

    DmqKmkMA.Close();
    DmqKmkMA.Free();
end;
//**********************************************************************
//*		Proccess	:	権限取得 <004>
//**********************************************************************
procedure TJNTCRP009002_2f.fnGetGrants();
begin

//    m_cJNTArea.FxPermission;						// 権限取得 <005>

//<015>↓
//親画面ですでに追加・変更・削除の権限をFalseにしているため、
//ここであえて処理する必要はない（後述のロジックで参照モードが確定する）
{
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then		// 決算確定MSG
    begin
        giReferFlag	:= REFER;						// 決算確定の為参照のみ
        m_IsUpdate  := False;
    end
    else
	begin
}
//<015>↑
        if m_cJNTArea.IsAppend and m_cJNTArea.IsModify then
            m_IsUpdate := True
        else
            m_IsUpdate := False;

		if ( m_IsUpdate ) then
	        giReferFlag	:= NORMAL					// 通常処理
		else
			giReferFlag	:= REFER;					// 更新権限無し
//	end;	//<015>

    BPrint.Enabled  :=  m_cJNTArea.IsPrint;
// <009>↓ｺﾒﾝﾄｱｳﾄ
//    BPrint.Enabled  :=  FALSE;  // <PRN>

// <011> ADD start ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
    // 参照権限の場合は以下の処理は行わない。
    if ( giReferFlag = REFER ) then
	begin
		Exit;
	end;

	// ADD start ★子会社の場合は権限なしと判断させて登録できなくする
// <013> DEL
													// 子会社の場合
(*	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		m_IsUpdate := FALSE;
        giReferFlag	:= REFER;		// 参照ﾓｰﾄﾞ
	end;
*)
	// ADD end ★

    // 全社の過年度DBを選択している場合
    if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT ) then
    begin
        if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
        begin
            if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
                                    'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
            begin
                // 通常のﾏｽﾀ登録として起動する。
                // 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
                giReferFlag	:= NORMAL;  // 通常ﾓｰﾄﾞ
            end
            else
            begin
                // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                // ﾏｽﾀをUpdata、Insertすることはできない。
                m_cJNTArea.Invalidity;
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end;
        end;
    end
    // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
    else if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
    begin
        // 子会社が過年度DBの場合
        if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
        end
        // 親会社が過年度DBの場合
        else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
        end
        else
        begin
// <013> DEL
											// 「ｸﾞﾙｰﾌﾟ会計の子会社として採用されています。
										   	// 体系のみの修正が可能です。」
//			MjsMessageBoxEx(AOwner, MSG_GRP_CHILD_READONLY, MSGCAP_GRP, mjInformation, mjOk, mjDefOk);
        end;
    end;
// <011> ADD end

end;

//**********************************************************************
//*		Proccess	:	削除ﾎﾞﾀﾝのEnabled制御	<011>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/30
//*		Parameter	:	なし
//*		Return		:	Boolean	T: 有効 F: 無効
//**********************************************************************
function TJNTCRP009002_2f.IsDeleteEx(): Boolean;
begin
// <013> MOD start
											// ★ｸﾞﾙｰﾌﾟ会計の子会社の場合の暫定対応
(*	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		Result := False;					// 削除不可
	end
	else
	begin
		Result := m_cJNTArea.IsDelete;		// 通常は権限に従う
	end;
*)
	Result := m_cJNTArea.IsDelete;			// 権限に従う
// <013> MOD end
end;

// <013> ADD start
//**********************************************************************
//*		Proccess	:	ｾｷｭﾘﾃｨ基本情報取得 <013>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/08
//*		Parameter	:	なし
//*		Return		:   True or False
//**********************************************************************
function TJNTCRP009002_2f.GetSecMain(): Boolean;
var
    strSQL		: String;
    Query		: TMQuery;
begin
	Result := False;
    m_iSecMasterKbn := 0;					// ｸﾞﾙｰﾌﾟ管理用ｾｸﾞﾒﾝﾄﾏｽﾀ区分

    Query := TMQuery.Create(Self);

    try
	    // 親会社DBとMQueryの接続
											// 自社が子会社の場合
		if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
		begin
	    									// 親会社DBに接続
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Query);
		end
		else
		begin
	    									// 自会社(親会社)DBに接続
			MDataModule.SetDBInfoToQuery(dbCorp_Select, Query);
		end;

    	Query.Close;
	    Query.SQL.Clear;

	  	strSQL := 'SELECT SecMasterKbn ' +
				'FROM SecMain ' +
				'WHERE OpeKbn = 2 ';		// ｸﾞﾙｰﾌﾟ管理

    	Query.SQL.Add(strSQL);

		if not Query.Open() then
    	begin
			Exit;
	    end;

   		if not Query.Eof then
	    begin
                                        	// 採用ｾｸﾞﾒﾝﾄﾏｽﾀ区分
            m_iSecMasterKbn := Query.GetFld('SecMasterKbn').AsInteger;
		end;
		Result := True;
	finally
    	Query.Free;
    end;
end;

//**********************************************************************
//*		Proccess	:	全部の子会社に関連付処理(ﾏｽﾀ同期) <013>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/08
//*		Parameter	:	exNCode		科目内部ｺｰﾄﾞ
//*		Return		:   Boolean 	True or False
//**********************************************************************
function TJNTCRP009002_2f.fnAllCorpRelation(exNCode: Extended): Boolean;
var
	bErr		: Boolean;					// True: ｴﾗｰ発生
    strSQL		: String;
    Qe			: TMQuery;
	QuerySeg	: TMQuery;					// 子会社に関連付けたｾｸﾞﾒﾝﾄ取得用
begin
    Result := False;
	bErr := False;

    Qe := TMQuery.Create(Self);
    QuerySeg := TMQuery.Create(Self);

	try
	    // 親会社DBとMQueryの接続
											// 自社が子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin
	    									// 親会社DBに接続
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QuerySeg);
		end
		else
		begin								// 翌期更新済み
			if m_SyncMaster.m_CEComKbn5 = 1 then
			begin
				Result := True;				// RELを作らない
				Exit;
			end;
	    									// 自会社(親会社)DBに接続
			MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QuerySeg);
		end;

		// 子会社に関連付けたｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞを取得

		strSQL := 'SELECT NCode FROM GrpSegMA ' +
				'WHERE MasterKbn = :parMasterKbn ' +
				'AND ParentKbn = 0 ' +
				'AND ForbidKbn = 0 ';

		QuerySeg.Close;
		QuerySeg.SQL.Clear;
		QuerySeg.SQL.Add(strSQL);
											// ｸﾞﾙｰﾌﾟ管理ｾｸﾞﾒﾝﾄﾏｽﾀ区分
        QuerySeg.ParamByName('parMasterKbn').AsInteger := m_iSecMasterKbn;

		if not QuerySeg.Open() then
		begin
            ErrorMessageDsp(QuerySeg);
			Exit;
		end;

		if QuerySeg.Eof then
		begin
			Exit;
		end;

		// 各子会社にRELを作成 + 非表示ﾏｽﾀ情報も作成
		while not QuerySeg.Eof do			// 子会社の数だけﾙｰﾌﾟ
		begin
			// SKmkMA_REL書き込み
			if not WriteSKmkREL(MKBN_TITLE, exNCode, QuerySeg.GetFld('NCode').AsFloat, Qe) then
			begin
				bErr := True;
                Exit;
			end;

			QuerySeg.Next;
		end;

		Result := True;
	finally
		QuerySeg.Free;
		Qe.Free;

		if bErr then
		begin                               // 「子会社への関連付けに失敗しました。」
    	    MjsMessageBoxEx (AOwner,
                     MSG_GRP_RELATIONALL_ERR,
                     'マスタ同期', mjError, mjOk, mjDefOk);
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の親会社DBﾄﾗﾝｻﾞｸｼｮﾝ処理 <013>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/08
//*		Parameter	:	iTrnKind	親会社DBへの指示
//*		Return		:	なし
//*		Comment		:	ｸﾞﾙｰﾌﾟ管理を採用していない、または親会社の処理中は
//*					:	何もしない。子会社選択中のみ親会社との同期を考慮する
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_2f.ExecParentDBTran(iTrnKind: Integer);
begin
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
		if m_SyncMaster.m_cPDBSelect = nil then
		begin
			Exit;
		end;

		case iTrnKind of
			GRP_PARENTDB_BEGINTRAN:			// ﾄﾗﾝｻﾞｸｼｮﾝ開始
			begin
				MDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_ROLLBACK:			// ﾛｰﾙﾊﾞｯｸ
			begin
				MDataModule.RollBack(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_COMMIT:			// ｺﾐｯﾄ
			begin
				MDataModule.Commit(m_SyncMaster.m_cPDBSelect);
			end;
		end;
	end;
end;

//**************************************************************************
//	Proccess	:  	関連付け(SKmkMA_REL)更新 <013>
//	Name	  	:	K.Katou
//	Date	  	:	2007/05/08
//	Parameter 	:   iMasterKbn		ﾏｽﾀ区分
//				:	exNCode			科目内部ｺｰﾄﾞ
//				:	exSegNCode		会社識別ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
//				:	Query			接続済みｸｴﾘ(親会社)
//	Retrun	  	:	True or False
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_2f.WriteSKmkREL(iMasterKbn: Integer; exNCode: Extended;
									exSegNCode: Extended; Query: TMQuery): Boolean;
var
	strSQL	: String;
begin
	Result := False;

   	with Query do
	begin
		// SKmkMA_RELはある？
		strSQL := 'SELECT * FROM SKmkMA_REL ' +
                  'WHERE MasterKbn = :parMasterKbn ' +
                  'AND NCode = :parNCode ' +
                  'AND GrpSegNCode = :parGrpSegNCode ';

        Close();
        SQL.Clear();
        SQL.Add(strSQL);

        ParamByName('parMasterKbn'  ).AsInteger := iMasterKbn;
        ParamByName('parNCode'      ).AsFloat := exNCode;
        ParamByName('parGrpSegNCode').AsFloat := exSegNCode;

        if not Open() then
        begin
	        Close();
            Exit;
        end;

        // 親のSKmkMA_RELの更新
        if Eof then   			// 新規挿入
        begin
			strSQL := 'INSERT INTO SKmkMA_REL ( ' +
                      ' MasterKbn, NCode, GrpSegNCode, ' +
                      ' RDelKbn_REL) ' +
                      'VALUES ( ' +
                      ' :parMasterKbn, :parNCode, ' +
                      ' :parGrpSegNCode, 0) ';

        end
        else                	// 更新
        begin
			strSQL := 'UPDATE SKmkMA_REL SET ' +
                          'RDelKbn_REL = 0, ' +
                          'UpdDateTM = CURRENT_TIMESTAMP ' +
                      'WHERE MasterKbn  = :parMasterKbn ' +
                      'AND NCode = :parNCode ' +
                      'AND GrpSegNCode = :parGrpSegNCode ';
        end;

        Close();
        SQL.Clear();
        SQL.Add(strSQL);

        ParamByName('parMasterKbn'  ).AsInteger := iMasterKbn;
        ParamByName('parNCode'      ).AsFloat := exNCode;
        ParamByName('parGrpSegNCode').AsFloat := exSegNCode;

        if not ExecSQL() then
        begin
	        Close();
			Exit;
        end;
	end;
    Query.Close();
	Result := True;
end;

// <013> ADD end

// <014> ADD start
//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の一括配信ﾀﾞｲｱﾛｸﾞ呼出 <014>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/15
//*		Parameter	:	なし
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_2f.CallSyncDlg();
var
	objSync	: TJNTSyncMasterIF;				// 配信ﾀﾞｲｱﾛｸﾞIF
	aryID 	: array[0..0] of Integer;
begin
	aryID[0] := JNTSYNC_SKMKMA;				// SKmkMA 管理科目

	objSync := TJNTSyncMasterIF.Create(AOwner, m_pMyAppRecord);

	try
		objSync.ShowDlg(aryID);
	finally
		objSync.Free;
	end;

end;
// <014> ADD end

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<017>
//	Name		:	T.Seki
//	Date		:	2008/02/19
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP009002_2f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
	SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
	SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
	SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
	SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
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
function TJNTCRP009002_2f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.

