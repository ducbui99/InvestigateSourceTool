//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：資金繰科目登録
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
//  <002>   茂木 勇次   2005.07.14(THU) 付箋備考の第１引数にAOwnerを追加
//  <003>   茂木 勇次   2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <004>   飯塚 健介   2005.08.03(THU) 決算確定・権限の実装
//  <005>   高橋 功二   2005.08.19(FRI) JNTCommon,TMjsAppRecordを親から引き継ぐように修正
//  <KEY>   茂木 勇次   2005.09.17(SAT) VK_ESC,VK_ENDｷｰで子BPLをCLOSEする場合、現状だと正常に
//                                      終了できない(ｱﾄﾞﾚｽ違反が発生)為、一時ｺﾒﾝﾄに。
//  <PRN>   茂木 勇次   2005.09.17(SAT) 印刷機能が実装できていない為、一時印刷ﾎﾞﾀﾝを使用不可に。
//  <006>   茂木 勇次   2005.09.29(THU) ｸﾞﾘｯﾄﾞの付箋Bitmapを変更。TImageを追加。
//  <PRN>   茂木 勇次   2005.10.06(THU) 印刷機能の実装。
//  <007>   加藤(PRIME) 2005.10.14(FRI) 削除ﾒｯｾｰｼﾞ変更
//  <ESC>   加藤(PRIME) 2005.10.20(THU) Escｷｰ動作対応
//  <008>   加藤(PRIME) 2005.10.24(MON) CashCodeの内部ｺｰﾄﾞ化
//  <009>   加藤(PRIME) 2005.10.24(MON) 実在/合計を切り替えたときに付箋のEnabledを制御
//  <010>   加藤(PRIME) 2005.11.16(WED) 履歴用ｽﾄｱﾄﾞ呼び出し
//  <011>   加藤(PRIME) 2006.01.10(TUE) 印刷を有効にする
//  <CHK>   加藤(PRIME) 2006.02.14(TUE) 削除ﾁｪｯｸ対応
//  <012>   加藤(PRIME) 2006.02.14(TUE) 内部ｺｰﾄﾞをIntegerで扱っている不具合修正
//  <013>   高橋 功二   2007.01.25(THU) ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一) Ver1.07正式版(2007/2)にてﾘﾘｰｽ
//	<014>	加藤(PRIME) 2007.03.30(FRI) ﾏｽﾀ同期対応(仮)　★次回ﾘﾘｰｽ時に削除予定
//	<015>	加藤(PRIME) 2007.05.07(MON)	ﾏｽﾀ同期対応
//	<016>	加藤(PRIME)	2007.05.15(TUE)	ﾏｽﾀ同期 配信ﾀﾞｲｱﾛｸﾞ対応
//	<017>	渡邊(LAB)   2007.07.02(MON) 決算確定の判定は権限に依存させる（子でメッセージを出さない）
//  <018>   鈴木(PRIME) 2007.08.09(THU) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//	<019>	関(PRIME)	2008.02.19(TUE)	ﾏｽﾀ更新履歴対応
//  <020>   大竹 文顕   2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//  <DKAI>  難波(Lab)   2008.08.27(WED) 名称に改行が入らないようにする
//  <021>   黒田 祐生   2010.05.21(FRI) MLBplLoader対応(LoadPackageの置換)
//	<022>	黒田 祐生	2012.02.13(MON) ShiftState対応
//=============================================================================
unit JNTCRP009002_1u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, ComCtrls,
  Commctrl, Grids, DBGrids, VCL.StdCtrls, Buttons, VCL.ExtCtrls, VCL.ImgList, Db, FireDAC.Comp.Client, Menus,
  ToolWin, dxGrClms, dxDBGrid, dxTL, dxCntner, daDatMod, dxmdaset,

  MJSDBGrid, MJSComboBox, MJSFunctionBar, MJSStatusBar,  MJSSpeedButton, MJSPanel,
  MJSQuery, MJSPageControl, MJSTab, MJSTreeView,

  MJSCommonu, MjsCommon2u, MjsDBModuleu, MjsDispCtrl, MjsStrCtrl, MJSMsgStdu,

  JNTCommonu{<004>}, JNTMasComu, JNTMasTreee2Dlgu,

  JNTSelCorpSys, JNTExpGlobal, MJSToolBar,{<PRN>}
  MLBplLoaderU{<021>}
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, FireDAC.Comp.DataSet	// <022>ADD
  ;

type
  TreeViewRec  = record
//    prmNCode    :   Integer;            // 内部ｺｰﾄﾞ  <012>削除
    prmNCode    :   Extended;           // 内部ｺｰﾄﾞ    <012>追加
	prmCode		:   Integer;			// 外部ｺｰﾄﾞ
	prmName		:   String;				// 簡略名称
	prmSumKbn  	:   Integer;			// 実在/合計区分
	prmAddKbn	:   Integer;			// 加算区分
end;

type
  FusenCmntRec = record
    Code		:	Extended;			//	ｺｰﾄﾞ
	Cmnt		:	String;				//	付箋ｺﾒﾝﾄ
end;

type
{$include ActionInterface.inc}
{$include JNTMASFUSENBIKODLGIFH.inc}
{$include JNTSelPrtIF.inc}              // <PRN>
{$include JNTCRPSyncMasterH.inc}     	// <014> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMasterIFH.inc}   		// <016> 配信ﾀﾞｲｱﾛｸﾞ共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP009002_1f = class(TForm)
	PTool: TMPanel;
	BClose: TMSpeedButton;
    BPrint_: TMSpeedButton;
	BChange: TMSpeedButton;
	SStatus: TMStatusBar;
	DataSource1: TDataSource;
	MQuery1: TMQuery;
	ImageList1: TImageList;
	MPanel1: TMPanel;
	dxMemData1: TdxMemData;
	dxMemData1GCode: TIntegerField;
	dxMemData1RenChar: TStringField;
	dxMemData1LongName: TStringField;
	dxMemData1SimpleName: TStringField;
	dxMemData1DcKbnCode: TIntegerField;
	dxMemData1DcKbnName: TStringField;
	dxMemData1AnalyzeCode: TIntegerField;
	dxMemData1AnalyzeName: TStringField;
	dxMemData1DecoKbnCode: TIntegerField;
	dxMemData1DecoKbnName: TStringField;
	dxMemData2: TdxMemData;
	DataSource2: TDataSource;
	dxMemData2Gcode: TIntegerField;
	dxMemData2RenChar: TStringField;
	dxMemData2LongName: TStringField;
	dxMemData2SimpleName: TStringField;
	dxMemData2DcKbnCode: TIntegerField;
	dxMemData2DcKbnName: TStringField;
	dxMemData2AnalyzeCode: TIntegerField;
	dxMemData2AnalyzeName: TStringField;
	dxMemData2DecoKbnCode: TIntegerField;
	dxMemData2DecoKbnName: TStringField;
	Splitter1: TSplitter;
	VKasantaikei: TMTreeView;
	MPanel2: TMPanel;
	MTab1: TMTab;
	MPanel3: TMPanel;
	MPanel4: TMPanel;
	PMKasantaikei: TPopupMenu;
	Copy: TMenuItem;
	Paste: TMenuItem;
	N1: TMenuItem;
	Delete: TMenuItem;
	AllDel: TMenuItem;
	ImageList2: TImageList;
    BDelete_: TMSpeedButton;
	PMSikinguri: TPopupMenu;
	ListMemDc: TdxMemData;
	ListMemAnalyze: TdxMemData;
	ListMemDeco: TdxMemData;
	ListMemDciCode: TIntegerField;
	ListMemDciName: TStringField;
	ListMemAnalyzeiCode: TIntegerField;
	ListMemAnalyzeiName: TStringField;
	ListMemDecoiCode: TIntegerField;
	ListMemDecoiName: TStringField;
	dxMemData1DummyDc: TSmallintField;
	dxMemData1DummyAna: TSmallintField;
	dxMemData1DummyDeco: TSmallintField;
	dxMemData2DummyDc: TSmallintField;
	dxMemData2DummyAna: TSmallintField;
	dxMemData2DummyDeco: TSmallintField;
	GFBlue: TMenuItem;
	GFGreen: TMenuItem;
	GFOrange: TMenuItem;
	GFRed: TMenuItem;
	TFBlue: TMenuItem;
	TFGreen: TMenuItem;
	TFOrange: TMenuItem;
	dxMemData1Fusen: TGraphicField;
	dxMemData2Fusen: TGraphicField;
	DSikinguriJ: TdxDBGrid;
	DSikinguriJRecId: TdxDBGridColumn;
	DSikinguriJFusen: TdxDBGridGraphicColumn;
	DSikinguriJGCode: TdxDBGridMaskColumn;
	DSikinguriJRenChar: TdxDBGridMaskColumn;
	DSikinguriJLongName: TdxDBGridMaskColumn;
	DSikinguriJSimpleName: TdxDBGridMaskColumn;
	DSikinguriJDummyDc: TdxDBGridMaskColumn;
	DSikinguriJDcKbnCode: TdxDBGridLookupColumn;
	DSikinguriJDcKbnName: TdxDBGridMaskColumn;
	DSikinguriJDummyAna: TdxDBGridMaskColumn;
	DSikinguriJAnalyzeCode: TdxDBGridLookupColumn;
	DSikinguriJAnalyzeName: TdxDBGridMaskColumn;
	DSikinguriJDummyDeco: TdxDBGridMaskColumn;
	DSikinguriJDecoKbnCode: TdxDBGridLookupColumn;
	DSikinguriJDecoKbnName: TdxDBGridMaskColumn;
	DSikinguriG: TdxDBGrid;
	DSikinguriGRecId: TdxDBGridColumn;
	DSikinguriGFusen: TdxDBGridGraphicColumn;
	DSikinguriGGcode: TdxDBGridMaskColumn;
	DSikinguriGRenChar: TdxDBGridMaskColumn;
	DSikinguriGLongName: TdxDBGridMaskColumn;
	DSikinguriGSimpleName: TdxDBGridMaskColumn;
	DSikinguriGDummyDc: TdxDBGridMaskColumn;
	DSikinguriGDcKbnCode: TdxDBGridLookupColumn;
	DSikinguriGDcKbnName: TdxDBGridMaskColumn;
	DSikinguriGDummyAna: TdxDBGridMaskColumn;
	DSikinguriGAnalyzeCode: TdxDBGridLookupColumn;
	DSikinguriGAnalyzeName: TdxDBGridMaskColumn;
	DSikinguriGDummyDeco: TdxDBGridMaskColumn;
	DSikinguriGDecoKbnCode: TdxDBGridLookupColumn;
	DSikinguriGDecoKbnName: TdxDBGridMaskColumn;
	ImageList3: TImageList;
	dxMemData1NCode: TIntegerField;
	dxMemData2NCode: TIntegerField;
	N3: TMenuItem;
	TPlus: TMenuItem;
	TMinus: TMenuItem;
	dxMemData3: TdxMemData;
	dxMemData3GCode: TIntegerField;
	dxMemData3RenChar: TStringField;
	dxMemData3LongName: TStringField;
	dxMemData3SimpleName: TStringField;
	dxMemData3DcKbnName: TStringField;
	dxMemData3AnalyzeName: TStringField;
	dxMemData3DecoKbnName: TStringField;
	dxMemData3DcKbnCode: TIntegerField;
	dxMemData3AnalyzeCode: TIntegerField;
	dxMemData3DecoKbnCode: TIntegerField;
	N2: TMenuItem;
	GFDel: TMenuItem;
	GFSep: TMenuItem;
	TFDel: TMenuItem;
	TFSep: TMenuItem;
	GFRedOff: TMenuItem;
	GFRedOn: TMenuItem;
	GFGreenOff: TMenuItem;
	GFGreenOn: TMenuItem;
	GFBlueOff: TMenuItem;
	GFBlueOn: TMenuItem;
	GFOrangeOff: TMenuItem;
	GFOrangeOn: TMenuItem;
	GFRe: TMenuItem;
	TFRe: TMenuItem;
	TFBlueOff: TMenuItem;
	TFBlueOn: TMenuItem;
	TFGreenOff: TMenuItem;
	TFGreenOn: TMenuItem;
	TFOrangeOff: TMenuItem;
	TFOrangeOn: TMenuItem;
	TFRed: TMenuItem;
	TFRedOff: TMenuItem;
	TFRedOn: TMenuItem;
	LVStyleBar: TMToolBar;
    btnFusenCtl_: TToolButton;
	PMFusen: TPopupMenu;
	MenuItem1: TMenuItem;
	B1: TMenuItem;
	G1: TMenuItem;
	O1: TMenuItem;
	imgFusenD: TImageList;
	imgFusen: TImageList;
	dxMemData1FusenIndex: TIntegerField;
	dxMemData2FusenIndex: TIntegerField;
    Image_Fusen_Red: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Glay: TImage;
    SPMasSKmk: TFDStoredProc;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCreate(Sender: TObject);
	procedure EnterEvent(Sender: TObject);
	procedure FormActivate(Sender: TObject);

	procedure GetData();
	procedure DataDsp(iPage: Integer; Query : TMQuery);
	procedure TaikeiSelectDsp(NodeDsp : TTreeNode);
	function  NodeCreate(cNode : TTreeNode; Query : TMQuery; iFlg : Integer; iSun : Integer): TTreeNode;
	procedure TaikeiOyaCreate(NodeOya : TTreeNode);
	procedure TaikeiKoCreate(QueryTree : TMQuery; NodeOya : TTreeNode);
	procedure TaikeiOyaCreateHagure(NodeOya : TTreeNode; iFlg : Integer);
	procedure TaikeiKoCreateHagure(QueryTree : TMQuery; NodeOya : TTreeNode; iFlg : Integer);
	procedure TaikeiDelete(NodeOya : TTreeNode; NodeKo : TTreeNode);

	procedure WriteSKMKMAJ();
	procedure WriteSKMKMAG();
	function  DeleteSKMKMA(iCode : Integer; iSumKbn : Integer): Boolean;
// <015> MOD start
//	function  WriteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode; NodeTarget : TTreeNode): Boolean;
	function  WriteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode; NodeTarget : TTreeNode; 
							bUseTran : Boolean = True): Boolean;
// <015> MOD end
	function  DeleteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode): Boolean;

	function  NodeSearch(stWorkRecSearch : TreeViewRec; stWorkRecOya : TreeViewRec): Integer;
	procedure BCloseClick(Sender: TObject);
	procedure BPrint_Click(Sender: TObject);
	procedure BChangeClick(Sender: TObject);
	procedure BDelete_Click(Sender: TObject);
	procedure VKasantaikeiClick(Sender: TObject);
	procedure VKasantaikeiChange(Sender: TObject; Node: TTreeNode);
	procedure VKasantaikeiDragOver(Sender, Source: TObject; X, Y: Integer;
	  State: TDragState; var Accept: Boolean);
	procedure VKasantaikeiDragDrop(Sender, Source: TObject; X, Y: Integer);
	procedure dxMemData1BeforePost(DataSet: TDataSet);
	procedure dxMemData2BeforePost(DataSet: TDataSet);
	procedure dxMemData1AfterPost(DataSet: TDataSet);
	procedure dxMemData2AfterPost(DataSet: TDataSet);
	procedure DataSource1StateChange(Sender: TObject);
	procedure DataSource2StateChange(Sender: TObject);
	procedure DSikinguriJBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure DSikinguriGBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure PMKasantaikeiPopup(Sender: TObject);
	procedure CutClick(Sender: TObject);
	procedure CopyClick(Sender: TObject);
	procedure PasteClick(Sender: TObject);
	procedure DeleteClick(Sender: TObject);
	procedure AllDelClick(Sender: TObject);
	procedure DelSikinguriClick(Sender: TObject);
	procedure LookUpDataSet();
	procedure MTab1Change(Sender: TObject);
	procedure FusenDsp(iPage : Integer; iCode : Extended; iFlg : Integer);
	procedure FusenInfoWrite(iColor : Integer; iCode : Extended; bSw: Boolean);
	procedure FusenInfaDelete(iCode : Extended);
	procedure GFBlueOffClick(Sender: TObject);
	procedure GFGreenOffClick(Sender: TObject);
	procedure GFOrangeOffClick(Sender: TObject);
	procedure GFRedOffClick(Sender: TObject);
	procedure GFBlueOnClick(Sender: TObject);
	procedure GFGreenOnClick(Sender: TObject);
	procedure GFOrangeOnClick(Sender: TObject);
	procedure GFRedOnClick(Sender: TObject);
	procedure TFBlueOffClick(Sender: TObject);
	procedure TFGreenOffClick(Sender: TObject);
	procedure TFOrangeOffClick(Sender: TObject);
	procedure TFRedOffClick(Sender: TObject);
	procedure TFBlueOnClick(Sender: TObject);
	procedure TFGreenOnClick(Sender: TObject);
	procedure TFOrangeOnClick(Sender: TObject);
	procedure TFRedOnClick(Sender: TObject);

	procedure PMSikinguriPopup(Sender: TObject);
	procedure DSikinguriJKeyUp(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DSikinguriGKeyUp(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure TPlusClick(Sender: TObject);
	procedure TMinusClick(Sender: TObject);
	procedure GPlusClick(Sender: TObject);
	procedure GMinusClick(Sender: TObject);
	procedure DSikinguriJKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DSikinguriJMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure DSikinguriGMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure FormShow(Sender: TObject);
	procedure FormHide(Sender: TObject);
	procedure DSikinguriGKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DSikinguriJExit(Sender: TObject);
	procedure DSikinguriGExit(Sender: TObject);
// <012>↓
//	procedure AgainEntNoSet(ParentCode: Integer);
	procedure AgainEntNoSet(ParentCode: Extended);
// <012>↑
	function fnDeleteCheck(iGCode: Integer): Boolean;
	procedure FormDestroy(Sender: TObject);
	procedure DisplayControl(Select: Integer);
	procedure ErrorMessageDsp(DmQuery: TMQuery);
	procedure DSikinguriGChangeNodeEx(Sender: TObject);
	procedure DSikinguriJChangeNodeEx(Sender: TObject);
	procedure GFDelClick(Sender: TObject);
	procedure TFDelClick(Sender: TObject);
	procedure DSikinguriJKeyPress(Sender: TObject; var Key: Char);
	procedure DSikinguriGKeyPress(Sender: TObject; var Key: Char);
	procedure GFReClick(Sender: TObject);
	procedure TFReClick(Sender: TObject);
	procedure btnFusenCtl_Click(Sender: TObject);
	procedure FusenListClick(Sender: TObject);
	procedure DSikinguriJMouseMove(Sender: TObject; Shift: TShiftState; X,
	  Y: Integer);
	procedure DSikinguriGMouseMove(Sender: TObject; Shift: TShiftState; X,
	  Y: Integer);
	procedure MTab1KeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	function  fnCheckMasterTreeInsertValid(DragCode,DropCode: Integer): Boolean;
//    function  GetNCode(iGCode: Integer; iSumKbn: Integer): Extended;    // <008> <CHK>削除
    function  GetNCode(iGCode: Integer; iSumKbn: Integer; var strName: String): Extended;   // <CHK>引数追加
    function  fnDelCheck(exNCode: Extended; var strErr: String): Boolean;   // <CHK>
//<014> ADD start
	function  IsDeleteEx(): Boolean;
	function  IsUpdateEx(): Boolean;
//<014> ADD end
	procedure CallSyncDlg();				// <016>

  private
	{ Private 宣言 }
    m_pMyAppRecord      :   ^TMjsAppRecord;
    m_Base_pRec		    :   ^TMjsAppRecord;                     // <005>
	dbCorp_Select       :   TFDConnection;
	m_AcControl	        :   TWinControl;
	MDataModule	        :   TMDataModulef;
	ComArea		        :   TJNTMASCom;
	MjsMsgRec	        :   TMJSMsgRec;
	MasTreee2Dlg        :   TJNTMasTreee2Dlgf;

    // ----- <BPL> -------------------------------------------------------------
    m_CmpList	        :   TList;
    BPrint 	            :   TSpeedButton;                       // 印刷
    BDelete             :   TSpeedButton;                       // 削除
    btnFusenCtl         :   TToolButton;                        // 付箋
    MComboBox           :   TMComboBox;                         // <ESC>第1ｺﾝﾎﾞ
    //--------------------------------------------------------------------------

	m_fUpdateRecord     :   Integer;		                    // Post判定ﾌﾗｸﾞ
	m_stRecPaste        :   ^TreeViewRec;	                    // NodeDataｾｰﾌﾞ用
	m_cNodeRightClk     :   TTreeNode;		                    // 右ｸﾘｯｸNodeｾｰﾌﾞ
	m_fAccessTab        :   Boolean;
	m_fEnd		        :   Integer;
	m_iGCodeSave        :   Integer;
	m_iRekiKbn	        :   Integer;
	m_iMailKbn	        :   Integer;
	gbKmkTree2Flag      :	Boolean;		                    // 書き込みﾌﾗｸﾞ
	giReferFlag		    :	Integer;		                    // 参照ﾌﾗｸﾞ
	gbKmkTreeDelFlag    :	Boolean;		                    // 削除ﾌﾗｸﾞ
	m_Key			    :   TWMKey;			                    // ｷｰｵﾍﾟﾚｰｼｮﾝ保存用
    m_FusenColorIdx     :   Integer;                            // ToolButtonの付箋ｶﾗｰを保存
	m_HintRow_Jitu	    :	Integer;
	m_aCmnt_Jitu	    :	array of FusenCmntRec;
	m_HintRow_Gou	    :	Integer;
	m_aCmnt_Gou		    :	array of FusenCmntRec;
    m_Zoom              :   Integer;
    AOwner              :   TComponent;                         // <003>
    m_cJNTArea          :   TJNTCommon;
    m_IsUpdate          :   Boolean;                            // <004>
    uvSelSys            :   TJNTSelCorpSys; 	                // <PRN> 会社ｼｽﾃﾑ情報
    uvHani              :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry       :	TPrintAppEntry;                     // <PRN>
    ArrHdl              :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    :	rcPrtParam;                         // <PRN>
    DmqPrint            :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ

    m_SyncMaster        : 	TSyncMaster;	 					// <014> ﾏｽﾀ同期ｸﾗｽ
	m_iSecMasterKbn		:	Integer;							// <015> ｸﾞﾙｰﾌﾟ管理ｾｸﾞﾒﾝﾄﾏｽﾀ区分

// <012>↓
//    function  GetNewNCode():Integer;
    function  GetNewNCode():Extended;
// <012>↑
    procedure fnGetGrants();    //<004>

// <015> ADD start
	function  GetSecMain		(): Boolean;
    function  fnAllCorpRelation	(exNCode: Extended): Boolean;
	procedure ExecParentDBTran	(iTrnKind: Integer);
	function  WriteSKmkREL		(iMasterKbn: Integer; exNCode: Extended;
									exSegNCode: Extended; Query: TMQuery): Boolean;
// <015> ADD end

	procedure SessionPractice(iSyori: Integer);	// <019> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
	function  fnDelCRLF(sData: String): String;	// <DKAI> 改行削除

  public
	{ Public 宣言 }
	constructor CreateForm(pRec: Pointer);
	procedure	CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
  end;

var
  JNTCRP009002_1f: TJNTCRP009002_1f;

const
	// ﾍﾟｰｼﾞﾃﾞﾌｧｲﾝ
	PAGE_JITUZAI	=   0;
	PAGE_GOKEI		=   1;

	// ｶﾗﾑﾃﾞﾌｧｲﾝ
	COL_FUSEN		=   0;
	COL_GCODE		=   1;
	COL_REN			=   2;
	COL_L_NAME		=   3;
	COL_S_NAME		=   4;
	COL_DC_KBN_CD   =   5;
	COL_DC_KBN_NM   =   6;
	COL_ANA_CD	    =   7;
	COL_ANA_NM  	=   8;
	COL_DECO_KBN_CD	=   9;
	COL_DECO_KBN_NM	=   10;

	// ﾌｾﾝﾃﾞﾌｧｲﾝ
	RED				=   1;
	GREEN			=   2;
	BLUE			=   3;
	ORANGE			=   4;
	NOCOLOR			=   99;

	// ﾂﾘｰｱｲｺﾝﾃﾞﾌｧｲﾝ
	IC_GPCLOSE		=   0;
	IC_GPOPEN		=   1;
	IC_GMCLOSE		=   2;
	IC_GMOPEN		=   3;

	IC_JP			=   4;
	IC_JM			=   5;
	IC_JPCHK		=   6;
	IC_JMCHK		=   7;

	// ﾃｰﾌﾞﾙ番号
	TBL_SKMKMA		=   104;
	TBL_KMKTREE		=   198;

	//	参照フラグ時に使用
	NORMAL			=	1;		//	通常処理
	BASICONLY		=	2;		//	基本のみ設定可能(詳細ボタン使用不可)
	REFER			=	3;		//	参照


	sDc		: array[0..1] of String = ('借方','貸方');
	sDeco	: array[0..6] of String = ('なし','【】','（）','〔〕','＜＞','(( ))','｛｝');
	sAnalyze: array[0..17] of String = ('',
										'経常収入',
										'経常支出',
										'経常収支差額',
										'資本的収入',
										'資本的支出',
										'資本収支差額',
										'収入合計',
										'支出合計',
										'財務収入',
										'財務支出',
										'財務収支差額',
										'前月繰越１',
										'前月繰越２',
										'次月繰越１',
										'次月繰越２',
										'預金預入れ',
										'預金引出し');

// <014> ADD start
	// ﾏｽﾀ同期ｸﾗｽの採用ﾌﾗｸﾞ
	GRP_SYNC_CHILD			= 1;		// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	GRP_SYNC_PARENT			= 0;		// ｸﾞﾙｰﾌﾟ会計採用あり 親会社
	GRP_SYNC_NOTUSE			= -1;		// ｸﾞﾙｰﾌﾟ会計採用なし

// <015> ADD start
	// ｸﾞﾙｰﾌﾟ会計採用時の親会社DBへの指示
	GRP_PARENTDB_BEGINTRAN	= 0;		// ﾄﾗﾝｻﾞｸｼｮﾝ開始
	GRP_PARENTDB_ROLLBACK	= 1;		// ﾛｰﾙﾊﾞｯｸ
	GRP_PARENTDB_COMMIT		= 2;		// ｺﾐｯﾄ

// <015> ADD end

	// ﾒｯｾｰｼﾞ
	MSGCAP_GRP				= 'グループ会計';
										// ★暫定対応
	MSG_GRP_CHILD_READONLY	= 'グループ会計の子会社として採用されています。'#13#10 +
							'体系のみの修正が可能です。';
										// <015> ADD
    MSG_GRP_RELATIONALL_ERR	= '子会社への関連付けに失敗しました。';

// <014> ADD end

	// -----<019> Add-St-----
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放
	// -----<019> Add-Ed-----

implementation
{$include JNTMASFUSENBIKODLGIFB.inc}
{$Include JNTConst.inc}                 // <007>
{$Include JNTCRPSyncMasterB.inc}   		// <014> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}   		// <016> 配信ﾀﾞｲｱﾛｸﾞ共通実装部
{$R *.DFM}


//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TJNTCRP009002_1f.CreateForm(pRec: Pointer);
var
    DmqData : TMQuery;                      // <010>
//    sMessage    : String;                   // <010> <014> DEL
begin

    m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);
	ComArea         :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);

//  m_cJNTArea      :=  TJNTCommon.Create(Self);        //<004><005>
//  m_cJNTArea.Init(m_pMyAppRecord);                    //<004><005>


    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);
    AOwner          :=  TForm(m_pMyAppRecord.m_pOwnerForm^);    // <003>

	// 会社DB OPEN
	dbCorp_Select   :=  MDataModule.COPDBOpen(1, ComArea.m_iCopNo);
	if ( dbCorp_Select = nil ) then
	begin
		ComArea.m_MsgStd.GetMsg(MjsMsgRec,10000,MDataModule.GetStatus);
		MjsMessageBoxEx(AOwner, // <003>
                        MjsMsgRec.sMsg,
						MjsMsgRec.sTitle,
						MjsMsgRec.icontype,
						MjsMsgRec.btntype,
						MjsMsgRec.btndef,
						MjsMsgRec.LogType
                       );
		raise Exception.Create('');
	end;

// <010>↓
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
// <014> MOD start
//		sMessage :=	IntToStr(ComArea.m_MsgStd.GetDBCode(DmqData));
//		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
		ErrorMessageDsp(DmqData);			// DBｴﾗｰﾒｯｾｰｼﾞ表示
// <014> MOD end
	end;

	DmqData.Close;
	DmqData.Free;

// <010>↑

// <014> ADD start
    // SyncMasterｸﾗｽの生成
    try
        m_SyncMaster := TSyncMaster.Create(Self, m_pMyAppRecord, m_cJNTArea, dbCorp_Select);
        m_SyncMaster.InitData();
	    m_SyncMaster.m_AOwner := TForm(m_pMyAppRecord^.m_pOwnerForm^);
// <015> ADD start
											// 子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								// 同期ｽﾄｱﾄﾞ呼出
			MDataModule.BeginTran(dbCorp_Select);
											// SKmkMA
   			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
			begin
				MDataModule.RollBack(dbCorp_Select);
                Abort;
			end;

			MDataModule.Commit(dbCorp_Select);
        end;
// <015> ADD end
    except
        raise;
    end;
// <014> ADD end

// <015> ADD start
	try
	    if not GetSecMain() then   			// ｾｷｭﾘﾃｨ基本情報取得
		begin
        	Abort;
        end;
    except
    	raise;
	end;
// <015> ADD end

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

//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ <BPL>
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_1f.CMChildKey(var Msg: TWMKey);
var
	sShift	:	TShiftState;
	cField	:	TField;
	bCtrl	:	Boolean;
begin

	m_Key   :=  Msg;
    // Shiftｷｰの取得
	sShift  :=  MJSKeyDataToShiftState(Msg.KeyData);	// <022>MOD

	// Gridｷｰｵﾍﾟﾚｰｼｮﾝ
	if ( m_AcControl = DSikinguriJ ) or ( m_AcControl = DSikinguriG ) then
	begin
        // Shift+TAB処理
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		begin
			if ( m_AcControl = DSikinguriJ ) then
			begin
				if (( dxMemData1.RecNo = 0 ) and ( DSikinguriJ.FocusedColumn = COL_GCODE )) or
                   (( dxMemData1.RecNo = 1 ) and ( DSikinguriJ.FocusedColumn = COL_GCODE )) then
				begin
		  			MjsDispCtrl.MjsSetFocus(Self, 'MTab1');
					Abort;
				end;
			end
			else
			begin
				if (( dxMemData2.RecNo = 0 ) and ( DSikinguriG.FocusedColumn = COL_GCODE )) or
                   (( dxMemData2.RecNo = 1 ) and ( DSikinguriG.FocusedColumn = COL_GCODE )) then
				begin
		  			MjsDispCtrl.MjsSetFocus(Self, 'MTab1');
					Abort;
				end;
			end;
		end;

		bCtrl := MjsSystemKeyChk(sShift);

		if ( m_AcControl = DSikinguriJ ) then
		begin
			if ( Msg.CharCode = VK_F8 ) then
			begin
				if ( DSikinguriJ.FocusedColumn = COL_S_NAME ) then
				begin
					dxMemData1.Edit;
					dxMemData1SimpleName.AsString := MjsCopy(dxMemData1LongName.AsString, 14);
				end;
			end;

            // ESC処理
			if ( Msg.CharCode = VK_ESCAPE ) then
			begin
                // ﾃﾞｰﾀ編集中
				if ( dxMemData1.State in [dsInsert,dsEdit] ) then
				begin
				end
				else
				begin
(*
					iRet := MjsMessageBoxEX(AOwner, // <003>
                                            '処理を終了します。よろしいですか？',
                                            '終了',
                                            mjQuestion,
                                            mjYesNo,
                                            mjDefYes
                                           );
					if ( iRet <> mrYes ) then
					begin
						Abort;
						Exit;
					end
					else
					begin
						Close();
						Exit;
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

            // END+CONTROL処理
			if ( Msg.CharCode = VK_END ) and ( bCtrl = TRUE ) then
			begin
				Exit;
			end;

            // HOME+CONTROL処理
			if ( Msg.CharCode = VK_HOME ) and ( bCtrl = TRUE ) then
			begin
				Exit;
			end;

            // END処理
			if ( Msg.CharCode = VK_END ) then
			begin
(*
				if ( DSikinguriJ.FocusedColumn = COL_GCODE ) then
				begin
					iRet := MjsMessageBoxEX(AOwner, // <003>
                                            '処理を終了します。よろしいですか？',
                                            '終了',
                                            mjQuestion,
                                            mjYesNo,
                                            mjDefYes
                                           );
					if ( iRet <> mrYes ) then
					begin
						Abort;
						Exit;
					end
					else
					begin
						if ( dxMemData1GCode.IsNull ) then
							dxMemData1.Cancel;

                        // ﾃﾞｰﾀ編集中
						if ( dxMemData1.State in [dsInsert,dsEdit] ) then
							dxMemData1.Post;
						Close;
						Exit;
					end;
				end;
*) // <KEY>

				if ( DSikinguriJ.FocusedColumn <> COL_DECO_KBN_CD ) then
				begin
					cField  := dxMemData1DecoKbnCode;
					cField.FocusControl;
					Abort;
					Exit;
				end;
			end;

            // HOME処理
			if ( Msg.CharCode = VK_HOME ) then
			begin
				if ( DSikinguriJ.FocusedColumn <> COL_GCODE ) then
				begin
					cField  := dxMemData1GCode;
					cField.FocusControl;
					Abort;
					Exit;
				end
				else
				begin
					Abort;
					Exit;
				end;
			end;

            // ←処理
			if ( Msg.CharCode = VK_LEFT ) then
			begin
				if ( dxMemData1.RecNo = 1 ) and ( DSikinguriJ.FocusedColumn = COL_GCODE ) then
				begin
					Beep;
					Abort;
				end;
			end;

			// その他のｷｰ
			Exit;
		end
		else
		begin
			if ( m_AcControl = DSikinguriG ) then
			begin
				if ( Msg.CharCode = VK_F8 ) then
				begin
					if ( DSikinguriG.FocusedColumn = COL_S_NAME ) then
					begin
						dxMemData1.Edit;
						dxMemData2SimpleName.AsString := MjsCopy(dxMemData2LongName.AsString, 14);
					end;
				end;

                // ESC処理
				if ( Msg.CharCode = VK_ESCAPE ) then
				begin
                    // ﾃﾞｰﾀ編集中
					if ( dxMemData2.State in [dsInsert,dsEdit] ) then
					begin
					end
					else
					begin
(*
						iRet := MjsMessageBoxEX(AOwner, // <003>
                                                '処理を終了します。よろしいですか？',
                                                '終了',
                                                mjQuestion,
                                                mjYesNo,
                                                mjDefYes
                                               );
						if ( iRet <> mrYes ) then
						begin
							Abort;
							Exit;
						end
						else
						begin
							Close;
							Exit;
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

                // END+CONTROL処理
				if ( Msg.CharCode = VK_END ) and ( bCtrl = TRUE ) then
				begin
					Exit;
				end;

                // HOME+CONTROL処理
				if ( Msg.CharCode = VK_HOME ) and ( bCtrl = TRUE ) then
				begin
					Exit;
				end;

                // END処理
				if ( Msg.CharCode = VK_END ) then
				begin
(*
					if ( DSikinguriG.FocusedColumn = COL_GCODE ) then
					begin
						iRet := MjsMessageBoxEX(AOwner, // <003>
                                                '処理を終了します。よろしいですか？',
                                                '終了',
                                                mjQuestion,
                                                mjYesNo,
                                                mjDefYes
                                               );
						if ( iRet <> mrYes ) then
						begin
							Abort;
							Exit;
						end
						else
						begin
							if ( dxMemData2GCode.IsNull ) then
								dxMemData2.Cancel;

                            // ﾃﾞｰﾀ編集中
							if ( dxMemData2.State in [dsInsert,dsEdit] ) then
								dxMemData2.Post;
							Close;
							Exit;
						end;
					end;
*) // <KEY>

					if ( DSikinguriG.FocusedColumn <> COL_DECO_KBN_CD ) then
					begin
						cField  := dxMemData2DecoKbnCode;
						cField.FocusControl;
						Abort;
						Exit;
					end;
				end;

                // HOME処理
				if ( Msg.CharCode = VK_HOME ) then
				begin
					if ( DSikinguriG.FocusedColumn <> COL_GCODE ) then
					begin
						cField  := dxMemData2GCode;
						cField.FocusControl;
						Abort;
						Exit;
					end
					else
					begin
						Abort;
						Exit;
					end;
				end;

                // ←処理
				if ( Msg.CharCode = VK_LEFT ) then
				begin
					if ( dxMemData1.RecNo = 1 ) and ( DSikinguriG.FocusedColumn = COL_GCODE ) then
					begin
						Beep;
						Abort;
					end;
				end;
				// その他のｷｰ
				Exit;

			end;
		end;
	end;

	// MTab1ｷｰｵﾍﾟﾚｰｼｮﾝ
	if ( m_AcControl = MTab1 ) then
	begin
        // ENTER処理
		if ( Msg.CharCode = VK_RETURN ) then
		begin
			if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
			begin
				MjsDispCtrl.MjsSetFocus(Self, 'DSikinguriJ');
                // ｺｰﾄﾞに初期ﾌｫｰｶｽ
				DSikinguriJ.FocusedColumn := 1;
				Abort;
				Exit;
			end
			else
			begin
				MjsDispCtrl.MjsSetFocus(Self, 'DSikinguriG');
                // ｺｰﾄﾞに初期ﾌｫｰｶｽ
				DSikinguriG.FocusedColumn := 1;
				Abort;
				Exit;
			end;
		end;

        // Shift+TAB処理
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		begin
			MjsDispCtrl.MjsSetFocus(Self, 'VKasantaikei');
			Abort;
		end;
		Exit;
	end;

	// TreeViewｷｰｵﾍﾟﾚｰｼｮﾝ
	if ( m_AcControl = VKasantaikei ) then
	begin
        // ENTER処理
		if ( Msg.CharCode = VK_RETURN ) or ( Msg.CharCode = VK_TAB ) then
		begin
			if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
			begin
				MjsDispCtrl.MjsSetFocus(Self, 'DSikinguriJ');
                // ｺｰﾄﾞに初期ﾌｫｰｶｽ
				DSikinguriJ.FocusedColumn := 1;
				Abort;
				Exit;
			end
			else
			begin
				MjsDispCtrl.MjsSetFocus(Self, 'DSikinguriG');
                // ｺｰﾄﾞに初期ﾌｫｰｶｽ
				DSikinguriG.FocusedColumn := 1;
				Abort;
				Exit;
			end;
		end;
	end;

    // TAB処理
	if ( Msg.CharCode = VK_TAB ) and ( sShift = [] ) then
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, TRUE);

    // Shift+TAB処理
	if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, FALSE);

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
procedure TJNTCRP009002_1f.FormCreate(Sender: TObject);
var
    iRet            :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
    iLoop           :   Integer;        // <PRN>
begin
	// -----<019> Add-St-----
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<019> Add-Ed-----

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    BPrint 	    :=  TSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    BDelete 	:=  TSpeedButton( m_CmpList.Items[2]^ );     // 削除
    btnFusenCtl :=  TToolButton ( m_CmpList.Items[5]^ );     // 付箋
// <ESC>↓
//    m_cJNTArea  :=  TJNTCommon  ( m_CmpList.Items[7]^ );     // <005>
//    m_Base_pRec :=  Pointer     ( m_CmpList.Items[8]^ );     // <005>
    MComboBox   :=  TMComboBox  ( m_CmpList.Items[6]^ );     // <ESC>追加
    m_cJNTArea  :=  TJNTCommon  ( m_CmpList.Items[8]^ );     // <005>
    m_Base_pRec :=  Pointer     ( m_CmpList.Items[9]^ );     // <005>
// <ESC>↑
    BPrint.OnClick              :=  BPrint_Click;
    BDelete.OnClick             :=  BDelete_Click;
    btnFusenCtl.OnClick         :=  btnFusenCtl_Click;
    btnFusenCtl.DropdownMenu    :=  PMFusen;
    //--------------------------------------------------------------------------

	m_fAccessTab    :=  FALSE;
	Parent          :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^); // 親ﾊﾟﾈﾙをParent
	Align           :=  alClient;								// 全領域を作成

    // <PRN>ArrHdlの初期化。
    for iLoop := 0 to 100 do
        ArrHdl[iLoop] := nil;

	MjsColorChange(TJNTCRP009002_1f ( Self ),
				   TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorB,
				   TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorD,
				   TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorB,
				   TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorD,
				   rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor	);

	m_Zoom  :=  MjsFontResize(TJNTCRP009002_1f( Self )	,Pointer(m_pMyAppRecord));
    MJSCompoResize(LVStyleBar, 0, Pointer(m_pMyAppRecord));

    LVStyleBar.ButtonHeight :=  LVStyleBar.Height;
    LVStyleBar.ButtonWidth  :=  Trunc(LVStyleBar.ButtonWidth * m_Zoom / 100);
    LVStyleBar.Left         :=  Trunc(LVStyleBar.Left * m_Zoom / 100);

	MDataModule.SetDBInfoToQuery(dbCorp_Select, MQuery1);

	m_iRekiKbn := 0;
	m_iMailKbn := 0;
	with MQuery1 do
	begin
		Close();
		SQL.Clear();
// <001>		SQL.Add('select YearKbn, ComKbn3 from DTMAIN');
		SQL.Add('SELECT YearKbn, ComKbn3 from DTMAIN, DTMAIN_MAS');
		Open();

		if ( EOF = FALSE ) then
		begin
			m_iRekiKbn  :=  GetFld('YearKbn').AsInteger;
			m_iMailKbn  :=  GetFld('ComKbn3').AsInteger;
		end;
	end;

    // ﾃﾞｰﾀ表示
	GetData();

	MTab1.Items.Selected        :=  PAGE_JITUZAI;       // どのﾀﾌﾞがActiveか取得
	m_AcControl                 :=  DSikinguriJ;		// 初期ﾌｫｰｶｽ 設定
	DSikinguriJ.FocusedColumn   :=  1;					// ｺｰﾄﾞに初期ﾌｫｰｶｽ
	DSikinguriG.FocusedColumn   :=  1;					// ｺｰﾄﾞに初期ﾌｫｰｶｽ
	m_fAccessTab                :=  TRUE;
	m_fEnd                      :=  0;					// 終了ﾌﾗｸﾞ初期化
	m_iGCodeSave                :=  0;					// 外部ｺｰﾄﾞｾｰﾌﾞ変数初期化
	gbKmkTree2Flag	            :=	FALSE;				// 加算体系2仕様ﾌﾗｸﾞ初期化
	gbKmkTreeDelFlag            :=  FALSE;				// ﾒｰﾙ会計履歴洗い替えﾌﾗｸﾞ初期化
	MasTreee2Dlg                :=  nil;
	giReferFlag		            :=	NORMAL;				// 参照ﾌﾗｸﾞ初期化
    m_FusenColorIdx             :=  -1;

    fnGetGrants();  // <004>
	DisplayControl(giReferFlag);

	if ( m_iMailKbn = 1 ) or ( giReferFlag = REFER ) then
	begin
// <004>		BDelete.Visible := FALSE;
// <004>		Delete.Visible  := FALSE;
		BDelete.Enabled := FALSE;
		Delete.Enabled  := FALSE;
		LVStyleBar.Left := Trunc(220 * m_Zoom / 100);
	end;

// ↓↓↓<PRN>

    // MQueryの構築<PRN>
    DmqPrint      :=  TMQuery.Create (self);
    // DBとMQueryの接続<PRN>
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 <PRN>}

	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL');       // <021> DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL'); // <021> ADD
        if ( lvHandle = 0 ) then
            Abort;
	except
	 // MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        // <021> DEL
        MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  // <021> ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     // UnloadPackage( lvHandle );          // <021>DEL
        UnloadPackageHelper( lvHandle );    //<021>ADD
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

//******************************************************************************
//	Component	:	Form
//	Event		:	OnActivate
//	Memo		:	フォーム アクティブ
//	Create		:	N.Nabe
//******************************************************************************
procedure	TJNTCRP009002_1f.FormActivate(Sender: TObject);
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
//	Event	    :	OnCloseQuery
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_1f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
//var
//	iRet :	Integer;
begin
{	if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
  	begin
		iRet := MjsMessageBoxEX(AOwner, // <003>
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
	if uvHani.mjspre.IsPreView then
   	begin
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 10040,2);
   		MjsMessageBoxEx(AOwner, // <003>
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
		m_fEnd := 1;										// 終了ﾌﾗｸﾞON
		CanClose := TRUE;
	end;
end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnClose
//	Name	    :	N.Nabe
//**************************************************************************
procedure TJNTCRP009002_1f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam			:	TAppParam;
	iarMasterKbn 	:	Array of integer;
	Dmpuery			:	TMQuery;
begin

	if (gbKmkTree2Flag = TRUE) then
	begin

		//	科目加算体系ﾏｽﾀ２を呼ぶ処理
		SetLength( iarMasterKbn, 1 );
		iarMasterKbn[0] := 3;			//	資金繰科目(3)

		// 加算更新処理
		MasTreee2Dlg:= TJNTMasTreee2Dlgf.Create( Self );
		if MasTreee2Dlg.ExecTree2( 	rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot,
										MDataModule,
										ComArea.m_iCopNo,
										iarMasterKbn, Dmpuery ) < 0 then
		begin
			if (Dmpuery <> nil) then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmpuery );
				MjsMessageBoxEx(AOwner, // <003>
                                MjsMsgRec.sMsg,
                                MjsMsgRec.sTitle,
                                MjsMsgRec.icontype,
                                MjsMsgRec.btntype,
                                MjsMsgRec.btndef,
                                FALSE
                               );
				Dmpuery.Free;
			end
			else
			begin
				MjsMessageBoxEx(AOwner, // <003>
                                MjsMsgRec.sMsg,
                                MjsMsgRec.sTitle,
                                MjsMsgRec.icontype,
                                MjsMsgRec.btntype,
                                MjsMsgRec.btndef,
                                FALSE
                               );
			end;
	   	end;
		MasTreee2Dlg.Free;
	end;

	gbKmkTree2Flag	:=	FALSE;

// <016> ADD start ﾏｽﾀ同期一括配信ﾀﾞｲｱﾛｸﾞ呼出
											// ｸﾞﾙｰﾌﾟ会計採用あり
    if m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE then
    begin
// <018> MOD start
//		if (giReferFlag <> REFER) and (m_SyncMaster.m_CEComKbn5 = 0) then
		if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
// <018> MOD end

        begin
			CallSyncDlg();				   	// 配信ﾀﾞｲｱﾛｸﾞ呼出
        end;
    end;
// <016> ADD end

	MQuery1.Close;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 販売ｼｽﾃﾑ情報の開放   // <PRN>
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

    // 共通ｼｽﾃﾑ開放
//    m_cJNTArea.Free; <005>

    m_SyncMaster.fnSyncTerm();				// <014> ADD ｽﾄｱﾄﾞ終了処理呼出

	MDataModule.COPDBClose(dbCorp_Select);

// <014> ADD start
											// 自社が子会社だった場合
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBのClose
        MDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;
// <014> ADD end

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
procedure TJNTCRP009002_1f.FormDestroy(Sender: TObject);
begin

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <014> ADD start
    if (m_SyncMaster <> nil) then
	begin
		m_SyncMaster.Free();				// ﾏｽﾀ同期ｸﾗｽ破棄
	end;
    // <014> ADD end

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
procedure TJNTCRP009002_1f.GetData();
var
	MyTreeNode1		: TTreeNode;
	stWorkRec1		: ^TreeViewRec;
begin
	m_fUpdateRecord := 0;

	VKasantaikei.Items.BeginUpdate;

	VKasantaikei.Items.Clear; { 既存のノードを削除する }
	New (stWorkRec1);

	stWorkRec1^.prmNCode     := 0;							// 一番上の階層はSumCode=0で加算体系マスタに登録されている
	stWorkRec1^.prmCode      := 0;							// 一番上の階層はSumCode=0で加算体系マスタに登録されている
	stWorkRec1^.prmName      := '資金繰加算体系';
	stWorkRec1^.prmSumKbn    := 9;
	stWorkRec1^.prmAddKbn    := 9;

	MyTreeNode1 := VKasantaikei.Items.AddChildObject(nil, '資金繰加算体系', stWorkRec1); { ルートノードを追加する }
	MyTreeNode1.ImageIndex := IC_GPCLOSE;
	MyTreeNode1.SelectedIndex := IC_GPOPEN;

	LookUpDataSet();							// LookUp用ﾘｽﾄﾃﾞｰﾀｾｯﾄ

	TaikeiOyaCreate(MyTreeNode1);				// 加算体系ﾂﾘｰﾋﾞｭｰ作成

	TaikeiOyaCreateHagure(MyTreeNode1, 0);		// 加算体系ﾂﾘｰﾋﾞｭｰ作成(はぐれマスタ対応)

	// グリッド再表示
	TaikeiSelectDsp(MyTreeNode1);

	VKasantaikei.FullExpand;
//	VKasantaikei.Selected := MyTreeNode1;
	VKasantaikei.Selected := VKasantaikei.Items[0];

	if TreeView_EnsureVisible(VKasantaikei.Handle, VKasantaikei.Selected.ItemID) then
		VKasantaikei.Invalidate;

	m_fUpdateRecord := 1;

	VKasantaikei.Items.EndUpdate;

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
procedure TJNTCRP009002_1f.DataDsp(iPage : Integer; Query : TMQuery);
var
	i		:	Integer;
	dQuery	:	TMQuery;
	sCmnt	:	String;
begin

	dQuery := TMQuery.Create(Self);
	try
		MDataModule.SetDBInfoToQuery(dbCorp_Select, dQuery);

		with dQuery do
		begin
            // -----------------------
			// 付箋ｺﾒﾝﾄを取得
            // -----------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT FusenCmnt FROM MFusenInfo   '
			    +   'WHERE  (MasterKbn = 3)             '
                +   '  AND  (NCode     = :iNCode)       ');
			SetFld('iNCode').AsFloat    :=  Query.GetFld('NCode').AsFloat;
			Open();

			if ( Eof = FALSE ) then
    				sCmnt := GetFld('FusenCmnt').AsString
			else    sCmnt := '';
		end;
	finally
		dQuery.Close();
		dQuery.Free();
	end;

	case iPage of
		1:											// 実在
		begin
			dxMemData1.Append;						// ｱﾍﾟﾝﾄﾞﾓｰﾄﾞ

			// 付箋情報SET
			FusenDsp(iPage, Query.GetFld('NCode').AsFloat, 0);

			// 外部ｺｰﾄﾞ
			dxMemData1GCode.AsInteger := Query.GetFld('Gcode').AsInteger;
			// 連想ｼﾝﾎﾞﾙ
			dxMemData1RenChar.AsString := Query.GetFld('Renso').AsString;
			// 正式名称
			dxMemData1LongName.AsString := Query.GetFld('LongName').AsString;
			// 簡略名称
			dxMemData1SimpleName.AsString := Query.GetFld('SimpleName').AsString;
			// 正残区分
			i := Query.GetFld('DcKbn').AsInteger;
	//		dxMemData1DcKbnCode.AsInteger:= i;
			dxMemData1DummyDc.AsInteger:= i;
			dxMemData1DcKbnName.AsString := sDc[i];
			// 分析コード区分
			i := Query.GetFld('AnalyzeCode').AsInteger;
	//		dxMemData1AnalyzeCode.AsInteger:= i;
			dxMemData1DummyAna.AsInteger:= i;
			dxMemData1AnalyzeName.AsString := sAnalyze[i];
			// 装飾区分
			i := Query.GetFld('DecoKbn').AsInteger;
	//		dxMemData1DecoKbnCode.AsInteger:= i;
			dxMemData1DummyDeco.AsInteger:= i;
			dxMemData1DecoKbnName.AsString := sDeco[i];

			// 内部ｺｰﾄﾞ
// <012>↓
//			dxMemData1NCode.AsInteger := Query.GetFld('Ncode').AsInteger;
			dxMemData1NCode.AsFloat := Query.GetFld('Ncode').AsFloat;
// <012>↑

			SetLength(m_aCmnt_Jitu,Length(m_aCmnt_Jitu)+1);
			m_aCmnt_Jitu[Length(m_aCmnt_Jitu)-1].Code := Query.GetFld('NCode').AsFloat;
			m_aCmnt_Jitu[Length(m_aCmnt_Jitu)-1].Cmnt := sCmnt;

			dxMemData1.Post;							// Memoに登録
		end;
		2:											// 合計
		begin
			dxMemData2.Append;						// ｱﾍﾟﾝﾄﾞﾓｰﾄﾞ

			// 付箋情報SET
			FusenDsp(iPage, Query.GetFld('NCode').AsFloat, 0);

			// 外部ｺｰﾄﾞ
			dxMemData2GCode.AsInteger := Query.GetFld('Gcode').AsInteger;
			// 連想ｼﾝﾎﾞﾙ
			dxMemData2RenChar.AsString := Query.GetFld('Renso').AsString;
			// 正式名称
			dxMemData2LongName.AsString := Query.GetFld('LongName').AsString;
			// 簡略名称
			dxMemData2SimpleName.AsString := Query.GetFld('SimpleName').AsString;
			// 正残区分
			i := Query.GetFld('DcKbn').AsInteger;
	//		dxMemData2DcKbnCode.AsInteger:= i;
			dxMemData2DummyDc.AsInteger:= i;
			dxMemData2DcKbnName.AsString := sDc[i];
			// 分析コード区分
			i := Query.GetFld('AnalyzeCode').AsInteger;
	//		dxMemData2AnalyzeCode.AsInteger:= i;
			dxMemData2DummyAna.AsInteger:= i;
			dxMemData2AnalyzeName.AsString := sAnalyze[i];
			// 装飾区分
			i := Query.GetFld('DecoKbn').AsInteger;
	//		dxMemData2DecoKbnCode.AsInteger:= i;
			dxMemData2DummyDeco.AsInteger:= i;
			dxMemData2DecoKbnName.AsString := sDeco[i];

			// 内部ｺｰﾄﾞ
// <012>↓
//			dxMemData2NCode.AsInteger := Query.GetFld('Ncode').AsInteger;
			dxMemData2NCode.AsFloat := Query.GetFld('Ncode').AsFloat;
// <012>↑

			dxMemData2.Post;							// Memoに登録

			SetLength(m_aCmnt_Gou,Length(m_aCmnt_Gou)+1);
			m_aCmnt_Gou[Length(m_aCmnt_Gou)-1].Code := Query.GetFld('GCode').AsInteger;
			m_aCmnt_Gou[Length(m_aCmnt_Gou)-1].Cmnt := sCmnt;
		end;
		3:											// 印刷
		begin
			dxMemData3.Append;						// ｱﾍﾟﾝﾄﾞﾓｰﾄﾞ

			// 外部ｺｰﾄﾞ
			dxMemData3GCode.AsInteger := Query.GetFld('Gcode').AsInteger;
			// 連想ｼﾝﾎﾞﾙ
			dxMemData3RenChar.AsString := Query.GetFld('Renso').AsString;
			// 正式名称
			dxMemData3LongName.AsString := Query.GetFld('LongName').AsString;
			// 簡略名称
			dxMemData3SimpleName.AsString := Query.GetFld('SimpleName').AsString;
			// 正残区分
			i := Query.GetFld('DcKbn').AsInteger;
			dxMemData3DcKbnCode.AsInteger:= i;
			dxMemData3DcKbnName.AsString := sDc[i];
			// 分析コード区分
			i := Query.GetFld('AnalyzeCode').AsInteger;
			dxMemData3AnalyzeCode.AsInteger:= i;
			dxMemData3AnalyzeName.AsString := sAnalyze[i];
			// 装飾区分
			i := Query.GetFld('DecoKbn').AsInteger;
			dxMemData3DecoKbnCode.AsInteger:= i;
			dxMemData3DecoKbnName.AsString := sDeco[i];

			dxMemData3.Post;							// Memoに登録
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	親ノードにノードを作成
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_1f.NodeCreate(cNode : TTreeNode; Query : TMQuery; iFlg : Integer; iSun : Integer): TTreeNode;
var
	stWorkRec	:	^TreeViewRec;
	TreeNode	:	TTreeNode;
	stName		:	String;
begin
	New (stWorkRec);
// <012>↓
//	stWorkRec^.prmNCode     := Query.GetFld('NCode').AsInteger;
	stWorkRec^.prmNCode     := Query.GetFld('NCode').AsFloat;
// <012>↑
	stWorkRec^.prmCode      := Query.GetFld('GCode').AsInteger;
	stWorkRec^.prmName      := Query.GetFld('SimpleName').AsString;
	stWorkRec^.prmSumKbn    := iFlg;
	stWorkRec^.prmAddKbn    := iSun;
	stName := IntToStr(Query.GetFld('GCode').AsInteger) + ' ' + Query.GetFld('SimpleName').AsString;
	TreeNode := VKasantaikei.Items.AddChildObject(cNode, stName, stWorkRec);
	if iFlg = 1 then							// 合計
	begin
		if iSun = 0 then
		begin
			TreeNode.ImageIndex := IC_GPCLOSE;
			TreeNode.SelectedIndex := IC_GPOPEN;
		end
		else
		begin
			TreeNode.ImageIndex := IC_GMCLOSE;
			TreeNode.SelectedIndex := IC_GMOPEN;
		end;
	end
	else										// 実在
	begin
		if iSun = 0 then
		begin
			TreeNode.ImageIndex := IC_JP;
			TreeNode.SelectedIndex := IC_JPCHK;
		end
		else
		begin
			TreeNode.ImageIndex := IC_JM;
			TreeNode.SelectedIndex := IC_JMCHK;
		end;
	end;

	result := TreeNode;
end;

//**************************************************************************
//	Proccess  :	LookUp用リストにﾃﾞｰﾀ追加
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 28
//	Parameter :
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.LookUpDataSet();
var
	iLoop: Integer;
begin
	ListMemDc.close;
	ListMemDc.Open;
	ListMemAnalyze.close;
	ListMemAnalyze.Open;
	ListMemDeco.close;
	ListMemDeco.Open;

	for iLoop := 0 to 1 do
	begin
		ListMemDc.Append;
		ListMemDc.FieldByName('iCode').AsInteger := iLoop;
		ListMemDc.FieldByName('iName').AsString := sDc[iLoop];
		ListMemDc.Post;
	end;
	ListMemDc.First;

	for iLoop := 0 to 17 do
	begin
		ListMemAnalyze.Append;
		ListMemAnalyze.FieldByName('iCode').AsInteger := iLoop;
		ListMemAnalyze.FieldByName('iName').AsString := sAnalyze[iLoop];
		ListMemAnalyze.Post;
	end;
	ListMemAnalyze.First;

	for iLoop := 0 to 6 do
	begin
		ListMemDeco.Append;
		ListMemDeco.FieldByName('iCode').AsInteger := iLoop;
		ListMemDeco.FieldByName('iName').AsString := sDeco[iLoop];
		ListMemDeco.Post;
	end;
	ListMemDeco.First;
end;



//**************************************************************************
//	Proccess  :	WM_SETFOCUS
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter :	Msg		TWMSetFocus
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
{procedure TJNTCRP009002_1f.WMSetFocus(var Msg: TWMSetFocus);
begin
	m_AcControl.SetFocus;

	inherited;
end;
}
//**************************************************************************
//	Proccess  :	OnShowｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.FormShow(Sender: TObject);
begin
	JNTMASSetCaption( m_pMyAppRecord );
	MJSBtnVisible( TJNTCRP009002_1f(Self), TRUE );

//<004>	if (m_iMailKbn = 1) or (giReferFlag = REFER) then
//<004>	begin
//<004>		BDelete.Visible := FALSE;
//<004>		Delete.Visible  := FALSE;
//<004>	end;

//<014> MOD start
//	BDelete.Enabled := m_cJNTArea.IsDelete;
//	Delete.Enabled  := m_cJNTArea.IsDelete;
	BDelete.Enabled := IsDeleteEx();
	Delete.Enabled  := IsDeleteEx();
//<014> MOD end

//	if giReferFlag = REFER then
//	begin
//		BDelete.Visible := FALSE;
//		Delete.Visible  := FALSE;
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
procedure TJNTCRP009002_1f.FormHide(Sender: TObject);
begin
	MJSBtnVisible( TJNTCRP009002_1f(Self), FALSE );

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
procedure TJNTCRP009002_1f.EnterEvent(Sender: TObject);
var
	NodeSelect  	:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
begin
	m_Key.CharCode := 0;
	m_AcControl := Screen.ActiveControl;

	if m_AcControl = VKasantaikei then
	begin
		NodeSelect := VKasantaikei.Selected;
		stWorkRecSelect := NodeSelect.Data;
		if stWorkRecSelect^.prmSumKbn <> 9 then
		begin
//<004>			BDelete.Enabled         :=  TRUE;
//<014> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end
			GFBlue.Enabled          :=  TRUE;
			GFGreen.Enabled         :=  TRUE;
			GFOrange.Enabled        :=  TRUE;
			GFRed.Enabled           :=  TRUE;
//<004>         btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>    		btnFusenCtl.Enabled     :=  TRUE;

            if ( m_cJNTArea.IsFusen ) then      //<004>
            begin
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
  	    		btnFusenCtl.Enabled     :=  TRUE;
            end else
            begin
                btnFusenCtl.ImageIndex	:=  4;
       			btnFusenCtl.Enabled     :=  FALSE;
            end;
		end
		else
		begin
			BDelete.Enabled         :=  FALSE;
			GFBlue.Enabled          :=  FALSE;
			GFGreen.Enabled         :=  FALSE;
			GFOrange.Enabled        :=  FALSE;
			GFRed.Enabled           :=  FALSE;
            btnFusenCtl.ImageIndex	:=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end;
	end
	else
	begin
		if (m_AcControl = DSikinguriJ) or (m_AcControl = DSikinguriG) then
		begin
			if MTab1.Items.Selected = PAGE_JITUZAI then
			begin
				if dxMemData1GCode.AsInteger = 0 then
				begin
					BDelete.Enabled         :=  FALSE;
					GFBlue.Enabled          :=  FALSE;
					GFGreen.Enabled         :=  FALSE;
					GFOrange.Enabled        :=  FALSE;
					GFRed.Enabled           :=  FALSE;
                    btnFusenCtl.ImageIndex	:=  4;
					btnFusenCtl.Enabled     :=  FALSE;
				end
				else
				begin
//<004>					BDelete.Enabled         :=  TRUE;
//<014> MOD start
//        			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
        			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end
					GFBlue.Enabled          :=  TRUE;
					GFGreen.Enabled         :=  TRUE;
					GFOrange.Enabled        :=  TRUE;
					GFRed.Enabled           :=  TRUE;
//<004>                 btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>					btnFusenCtl.Enabled     :=  TRUE;
                    if ( m_cJNTArea.IsFusen ) then      //<004>
                    begin
                        btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
        	    		btnFusenCtl.Enabled     :=  TRUE;
                    end else
                    begin
                        btnFusenCtl.ImageIndex	:=  4;
            			btnFusenCtl.Enabled     :=  FALSE;
                    end;
				end;
			end
			else
			begin
				if dxMemData2GCode.AsInteger = 0 then
				begin
					BDelete.Enabled         :=  FALSE;
					GFBlue.Enabled          :=  FALSE;
					GFGreen.Enabled         :=  FALSE;
					GFOrange.Enabled        :=  FALSE;
					GFRed.Enabled           :=  FALSE;
                    btnFusenCtl.ImageIndex	:=  4;
					btnFusenCtl.Enabled     :=  FALSE;
				end
				else
				begin
//<004>				BDelete.Enabled         :=  TRUE;
//<014> MOD start
//        			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
        			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end
					GFBlue.Enabled          :=  TRUE;
					GFGreen.Enabled         :=  TRUE;
					GFOrange.Enabled        :=  TRUE;
					GFRed.Enabled           :=  TRUE;
//<004>             btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>				btnFusenCtl.Enabled     :=  TRUE;
                    if ( m_cJNTArea.IsFusen ) then      //<004>
                    begin
                        btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
        	    		btnFusenCtl.Enabled     :=  TRUE;
                    end else
                    begin
                        btnFusenCtl.ImageIndex	:=  4;
            			btnFusenCtl.Enabled     :=  FALSE;
                    end;

				end;
			end;
		end
		else
		begin
			if m_AcControl = MTab1 then
			begin
				BDelete.Enabled         :=  FALSE;
				GFBlue.Enabled          :=  FALSE;
				GFGreen.Enabled         :=  FALSE;
				GFOrange.Enabled        :=  FALSE;
				GFRed.Enabled           :=  FALSE;
                btnFusenCtl.ImageIndex	:=  4;
				btnFusenCtl.Enabled     :=  FALSE;
			end;
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
procedure TJNTCRP009002_1f.BCloseClick(Sender: TObject);
begin
	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		if dxMemData1GCode.IsNull then
			dxMemData1.Cancel;

// <015> MOD start
(*		if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
			dxMemData1.Post;
*)
		if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
        begin
        	if giReferFlag = REFER then		// 表示のみ権限なのにEdit状態になることがある
            begin
				dxMemData1.Cancel;
            end
            else
            begin
				dxMemData1.Post;
            end;
        end;
// <015> MOD end
	end
	else
	begin
		if dxMemData2GCode.IsNull then
			dxMemData2.Cancel;

// <015> MOD start
(*		if dxMemData2.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
			dxMemData2.Post;
*)
		if dxMemData2.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
		begin
        	if giReferFlag = REFER then		// 表示のみ権限なのにEdit状態になることがある
	        begin
				dxMemData2.Cancel;
    	    end
        	else
	        begin
				dxMemData2.Post;
        	end;
        end;
// <015> MOD end
	end;
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
procedure TJNTCRP009002_1f.BPrint_Click(Sender: TObject);
var
	QueryRead	:	TMQuery;
begin

    // MQueryの構築
// <014> MOD start
//    QueryRead := TMQuery.Create( Application );
    QueryRead := TMQuery.Create( Self );
// <014> MOD end
    // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryRead );

    // DataSet
	dxMemData3.Close();
	dxMemData3.Open();

	with QueryRead do
	begin
		// 資金繰科目科目を外部ｺｰﾄﾞ昇順でGET
		Close();
		SQL.Clear();
		SQL.Add('SELECT * FROM SKmkMA   '
		    +   'WHERE  (MasterKbn = 3) '
            +   '  AND  (RDelKbn   = 0) '
		    +   'ORDER BY GCODE         ');

		Open();
		while EOF = FALSE do
		begin
			DataDsp(3, QueryRead);
			Next;
		end;
	end;

	if ( dxMemData3.RecordCount <> 0 ) then
		dxMemData3.First();

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry	:=  DmqPrint;
        TargetMD    :=  dxMemData3;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  m_cJNTArea;
        TargetInt   :=  0;
	end;

    // 印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);

    dxMemData3.Close();
	QueryRead.Free();

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
procedure TJNTCRP009002_1f.BChangeClick(Sender: TObject);
var
	AppPara : TAppParam;

	iAction : Integer;
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
procedure TJNTCRP009002_1f.BDelete_Click(Sender: TObject);
var
	iCode			:	Integer;
	iIndex			:	Integer;
	NodeSelect  	:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
	iRet			:	Integer;
//	iRetChk			:	Boolean;            // <CHK>ｺﾒﾝﾄｱｳﾄ
	stName			:	String;
//	QueryRead		:	TMQuery;
begin

	if (m_AcControl <> DSikinguriJ) AND (m_AcControl <> DSikinguriG) and (m_AcControl <> VKasantaikei) then
		exit;

	iIndex := MTab1.Items.Selected;						// どのタブがActiveか取得

	if m_AcControl = VKasantaikei then
	begin
		NodeSelect := VKasantaikei.Selected;
		stWorkRecSelect := NodeSelect.Data;
		iCode := stWorkRecSelect.prmCode;
		stName := stWorkRecSelect.prmName;
	end
	else
	begin
		if iIndex = PAGE_GOKEI then
		begin
			iCode := dxMemData2GCode.AsInteger;
			stName := dxMemData2SimpleName.AsString;
		end
		else
		begin
			iCode := dxMemData1GCode.AsInteger;
			stName := dxMemData1SimpleName.AsString;
		end;
	end;

	if iCode = 0 then
		exit;

{	QueryRead		:= TMQuery.Create(Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

	try
		if iIndex = PAGE_GOKEI then
		begin
			// 加算先かどうか判定
			QueryRead.Close;
			QueryRead.SQL.Clear;		 							// QueryFree 初期化
			QueryRead.SQL.Add('Select * from KmkTree');
			QueryRead.SQL.Add('Where MasterKbn=3 AND SumCode=:iCode');
			QueryRead.SetFld('iCode').AsInteger := iCode;
			QueryRead.Open;

			if QueryRead.EOF = FALSE then
			begin
				MjsMessageBoxEX(AOwner, // <003>
                                '加算先として登録済みです。'#13#10'削除することはできません。',
                                '削除',
                                mjWarning,
                                mjOk,
                                mjDefOk
                               );
				exit;
			end;
		end;
	finally
		QueryRead.Free;
	end;
}
// <CHK>↓ｽﾄｱﾄﾞでﾁｪｯｸするのでｺﾒﾝﾄｱｳﾄ
{	if iIndex = PAGE_JITUZAI then
	begin
		// 発生データの存在チェック
		iRetChk := fnDeleteCheck(iCode);
		if iRetChk = FALSE then
		begin
			MjsMessageBoxEX(AOwner, // <003>
                            '仕訳データが入力済みです。'#13#10'削除することはできません。',
                            '削除',
                            mjWarning,
                            mjOk,
                            mjDefOk
                           );
			exit;
		end;
	end;
}
// <007> 「当該ﾏｽﾀにﾃﾞｰﾀが存在している場合、削除すると管理表に不整合が生ずる恐れがあります。
//          削除してもよろしいですか？」
//	iRet := MjsMessageBoxEX(AOwner, // <003>
//                            ''''+stName+''''+'を削除します。よろしいですか？',
	iRet := MjsMessageBoxEX(AOwner, // <003>
                            MSG_DELETE,
                            '削除',
                            mjQuestion,
                            mjYesNo,
                            mjDefNo
                           );
	if iRet <> mrYes then
		exit;

	// -----<019> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<019> Add-Ed-----

	NodeSelect := VKasantaikei.Selected;
	stWorkRecSelect := NodeSelect.Data;
	if stWorkRecSelect^.prmSumKbn = 0 then
		NodeOya := NodeSelect.Parent
	else
		NodeOya := NodeSelect;

//	stWorkRecOya := NodeOya.Data;

	if stWorkRecSelect^.prmCode <> iCode then
	begin
		NodeSelect := NodeOya.getFirstChild;
		while NodeSelect<> nil do
		begin
			stWorkRecSelect := NodeSelect.Data;
			if stWorkRecSelect^.prmCode = iCode then
			begin
				NodeOya := NodeSelect.Parent;
				break;
			end;

			NodeSelect := NodeOya.GetNextChild(NodeSelect);
		end;
	end;

	stWorkRecSelect := NodeSelect.Data;
	stWorkRecOya := NodeOya.Data;

	if NodeSearch(stWorkRecSelect^, stWorkRecOya^) <= 1 then							// ツリー内に一件のみの時は削除
	begin
		// 資金繰科目削除
		if DeleteSKMKMA(stWorkRecSelect^.prmCode, stWorkRecSelect^.prmSumKbn) = FALSE then
		begin
			abort;
			exit;
		end;
	end
	else																				// 一件以上存在する時は加算体系のみ削除
	begin
		// 加算体系削除
		if DeleteKMKTREE(NodeOya, NodeSelect) = FALSE then
		begin
			abort;
			exit;
		end;
	end;

	// グリッド再表示
//	TaikeiSelectDsp(NodeSelect);
	TaikeiSelectDsp(NodeOya);

	// ノード自体を削除
	NodeSelect.Delete;

	if iIndex = PAGE_JITUZAI then
	begin
		if dxMemData1GCode.AsInteger = 0 then
		begin
			BDelete.Enabled         :=  FALSE;
            btnFusenCtl.ImageIndex	:=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
//<014> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end
//<004>            btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>			btnFusenCtl.Enabled     :=  TRUE;
            if ( m_cJNTArea.IsFusen ) then      //<004>
            begin
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
 	    		btnFusenCtl.Enabled     :=  TRUE;
            end else
            begin
                btnFusenCtl.ImageIndex	:=  4;
      			btnFusenCtl.Enabled     :=  FALSE;
            end;
		end;
	end
	else
	begin
		if dxMemData2GCode.AsInteger = 0 then
		begin
			BDelete.Enabled         :=  FALSE;
            btnFusenCtl.ImageIndex	:=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
//<014> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end
//<004>            btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>			btnFusenCtl.Enabled     :=  TRUE;
            if ( m_cJNTArea.IsFusen ) then      //<004>
            begin
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
  	    		btnFusenCtl.Enabled     :=  TRUE;
            end else
            begin
                btnFusenCtl.ImageIndex	:=  4;
      			btnFusenCtl.Enabled     :=  FALSE;
            end;

		end;
	end;

	// -----<019> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<019> Add-Ed-----
end;

//**************************************************************************
//	Proccess  :	ﾂﾘｰｸﾘｯｸｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.VKasantaikeiClick(Sender: TObject);
//var
//	NodeSelect		: TTreeNode;
//	stWorkRecSelect	: ^TreeViewRec;
begin
{	m_fUpdateRecord := 0;

	NodeSelect := VKasantaikei.Selected;
	stWorkRecSelect := NodeSelect.Data;

	if stWorkRecSelect^.prmSumKbn = 0 then
	begin
		MTab1.Items.Selected := PAGE_JITUZAI;
	end;
//	else
//	begin
//		MTab1.Items.Selected := PAGE_GOKEI;
//	end;

	m_fUpdateRecord := 1;
}
end;

//**************************************************************************
//	Proccess  :	ノードから次のノードへ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : TTreeNode
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.VKasantaikeiChange(Sender: TObject;
  Node: TTreeNode);
var
	Node1			:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
	iGCode			:	Integer;
	iMemGCode		:	Integer;
	bFlg			:	Boolean;
begin
	m_fUpdateRecord := 0;
	bFlg := FALSE;

	Node1 := VKasantaikei.Selected;
	NodeOya := Node1.Parent;
	stWorkRecSelect := Node1.Data;
	iMemGCode := stWorkRecSelect^.prmCode;

	if stWorkRecSelect^.prmSumKbn = 0 then
	begin
		MTab1.Items.Selected := PAGE_JITUZAI;
	end;

	if iMemGCode = 0 then
	begin
		BDelete.Enabled         :=  FALSE;
        btnFusenCtl.ImageIndex	:=  4;
		btnFusenCtl.Enabled     :=  FALSE;
	end
	else
	begin
//<004>		BDelete.Enabled         :=  TRUE;
//<014> MOD start
//    	BDelete.Enabled         :=  m_cJNTArea.IsDelete;
    	BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD end

        if ( m_cJNTArea.IsFusen ) then      //<004>
        begin
            if ( m_FusenColorIdx = -1 ) then
            begin
                btnFusenCtl.ImageIndex	:=  0;
                m_FusenColorIdx         :=  0;
            end
            else
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
	    	btnFusenCtl.Enabled     :=  TRUE;

        end else
        begin
            btnFusenCtl.ImageIndex	:=  4;
   			btnFusenCtl.Enabled     :=  FALSE;

        end;

	end;

	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		if dxMemData1.RecordCount <> 0 then
			dxMemData1.First;

		while dxMemData1.Eof = FALSE do
		begin
			if iMemGCode = dxMemData1GCode.AsInteger then
			begin
				bFlg := TRUE;
				break;
			end
			else
				dxMemData1.Next;
		end;
	end
	else
	begin
		if dxMemData2.RecordCount <> 0 then
			dxMemData2.First;

		while dxMemData2.Eof = FALSE do
		begin
			if iMemGCode = dxMemData2GCode.AsInteger then
			begin
				bFlg := TRUE;
				break;
			end
			else
				dxMemData2.Next;
		end;
	end;

	if bFlg = FALSE then
	begin
		if dxMemData1.RecordCount <> 0 then
			dxMemData1.First;

		if dxMemData2.RecordCount <> 0 then
			dxMemData2.First;
	end;

	if (stWorkRecSelect^.prmSumKbn = 9) or (stWorkRecSelect^.prmSumKbn = 1) then
	begin
		iGCode := stWorkRecSelect^.prmCode;
	end
	else
	begin
		stWorkRecOya := NodeOya.Data;
		iGCode := stWorkRecOya^.prmCode;
	end;

	if m_iGCodeSave = iGCode then
	begin
		m_fUpdateRecord := 1;
		exit;
	end;

	if Node1 = nil then
	begin
		m_fUpdateRecord := 1;
		exit;
	end;

	TaikeiSelectDsp(Node1);

	bFlg := FALSE;

	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		if dxMemData1.RecordCount <> 0 then
			dxMemData1.First;

		while dxMemData1.Eof = FALSE do
		begin
			if iMemGCode = dxMemData1GCode.AsInteger then
			begin
				bFlg := TRUE;
				break;
			end
			else
				dxMemData1.Next;
		end;
	end
	else
	begin
		if dxMemData2.RecordCount <> 0 then
			dxMemData2.First;

		while dxMemData2.Eof = FALSE do
		begin
			if iMemGCode = dxMemData2GCode.AsInteger then
			begin
				bFlg := TRUE;
				break;
			end
			else
				dxMemData2.Next;
		end;
	end;

	if bFlg = FALSE then
	begin
		if dxMemData1.RecordCount <> 0 then
			dxMemData1.First;

		if dxMemData2.RecordCount <> 0 then
			dxMemData2.First;
	end;

	// 付箋ボタン入力制御
{	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		if dxMemData1.RecordCount <> 0 then
		begin
			btnFusenCtl.Enabled := TRUE;
			LVStyleBar.Enabled := TRUE;
		end
		else
		begin
			btnFusenCtl.Enabled := FALSE;
			LVStyleBar.Enabled := FALSE;
		end;
	end
	else
	begin
		if dxMemData2.RecordCount <> 0 then
		begin
			btnFusenCtl.Enabled := TRUE;
			LVStyleBar.Enabled := TRUE;
		end
		else
		begin
			btnFusenCtl.Enabled := FALSE;
			LVStyleBar.Enabled := FALSE;
		end;
	end;}

	m_iGCodeSave := iGCode;							// ｺｰﾄﾞのｾｰﾌﾞ

	m_fUpdateRecord := 1;
end;

//**************************************************************************
//	Proccess  :	ﾂﾘｰﾄﾞﾗｯｸﾞｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.VKasantaikeiDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
	NodeSelect		:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	DropNode		:	TTreeNode;
	stWorkRecDrop	:	^TreeViewRec;
	QueryDrag		:	TMQuery;
begin
	NodeSelect := VKasantaikei.Selected;
	stWorkRecSelect := NodeSelect.Data;

	if stWorkRecSelect^.prmSumKbn = 9 then
		abort;

	DropNode	:=	(VKasantaikei.GetNodeAt (X, Y));	//	Drop先のNode取得

	if  (DropNode = nil) then			//	Nil時
	begin
		Accept  := FALSE;
		exit;
	end;

	stWorkRecDrop	:=	DropNode.Data;			//	Drop先のData取得

	if  (stWorkRecSelect.prmSumKbn = 1) then	//	選択したNodeが合計の時
	begin
		if  (not fnCheckMasterTreeInsertValid (stWorkRecSelect.prmCode,stWorkRecDrop.prmCode)) then
		begin
			Accept	:= FALSE;
			Exit;
		end;
	end;


	QueryDrag := TMQuery.Create( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryDrag );

	try
		with QueryDrag do
		begin
            // ------------------
			// ﾃﾞｰﾀ存在確認
            // ------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM SKmkMA           '
			    +   'WHERE  (MasterKbn = 3)         '
                +   '  AND  (SumKbn    = :iSum)     '
                +   '  AND  (RDelKbn   = 0)         '
                +   '  AND  (GCode     = :iGCode)   ');
			SetFld('iSum').AsInteger   := stWorkRecSelect^.prmSumKbn;
			SetFld('iGCode').AsInteger := stWorkRecSelect^.prmCode;
			Open;
		end;

		if QueryDrag.GetFld('KoteiKbn').AsInteger = 1 then			// 固定体系区分が1：固定のとき
			abort;
	finally
		QueryDrag.Free;
	end;

end;

//**************************************************************************
//	Proccess  :	ﾂﾘｰﾄﾞﾛｯﾌﾟｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.VKasantaikeiDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
	NodeSakiOya		:	TTreeNode;
	NodeMotoOya		:	TTreeNode;
	NodeKo			:	TTreeNode;
	NodeFree		:	TTreeNode;
	NodeTarget		:	TTreeNode;
//	stWorkRecMotoOya:	^TreeViewRec;
	stWorkRecSakiOya:	^TreeViewRec;
	stWorkRecKo		:	^TreeViewRec;
	stWorkRecTarget	:	^TreeViewRec;
	QueryWrite 		:	TMQuery;
//	QueryTree 		:	TMQuery;
	stName			:	String;
	iCode			:	Integer;
begin
	// -----<019> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<019> Add-Ed-----

	{ドロップしたノードを追加}
	// 移動するノード関係
	NodeKo := VKasantaikei.Selected;
	stWorkRecKo := NodeKo.Data;

	//　移動元ノードの親ノード関係
	NodeMotoOya := NodeKo.Parent;
//	stWorkRecMotoOya := NodeMotoOya.Data;

	//　移動先ノード関係
	NodeSakiOya := VKasantaikei.DropTarget;
	NodeTarget := VKasantaikei.DropTarget;

	if NodeTarget = nil then
		exit;

	stWorkRecSakiOya := NodeSakiOya.Data;
	stWorkRecTarget := NodeTarget.Data;
	if stWorkRecSakiOya^.prmSumKbn = 0 then
	begin
		NodeFree := NodeSakiOya.Parent;
		NodeSakiOya := NodeFree;
		stWorkRecSakiOya := NodeSakiOya.Data;
	end;

	// 同一加算先には貼り付け禁止
	if stWorkRecSakiOya^.prmCode = stWorkRecKo^.prmCode then
  	begin
		MjsMessageBoxEX(AOwner, // <003>
                        '同一加算先です',
                        '登録',
                        mjQuestion,
                        mjOk,
                        mjDefOk
                       );
		exit;
	end;

	// 加算体系ﾁｪｯｸ(移動先ノードに同一ﾚｺｰﾄﾞがあるかどうか)
	QueryWrite := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);
	try
		with QueryWrite do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化

			// ﾃﾞｰﾀ存在確認
			SQL.Add('select * from KmkTree');
			SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
//          SQL.Add('order by EntNo DESC');
// <012>↓
//			SetFld('iSum').AsInteger   := stWorkRecSakiOya^.prmNCode;
//			SetFld('iBased').AsInteger := stWorkRecKo^.prmNCode;
			SetFld('iSum').AsFloat     := stWorkRecSakiOya^.prmNCode;
			SetFld('iBased').AsFloat   := stWorkRecKo^.prmNCode;
// <012>↑

			Open;
			if EOF = FALSE then
			begin
				MjsMessageBoxEX(AOwner, // <003>
                                '同一コードが登録済みです',
                                '登録',
                                mjQuestion,
                                mjOk,
                                mjDefOk
                               );
				abort;
			end;
		end;
	finally
		QueryWrite.Free;
	end;

	// 選択されたノードを移動
	if stWorkRecTarget^.prmSumKbn = 0 then
		NodeKo.MoveTo(NodeTarget, naInsert)
	else
		NodeKo.MoveTo(NodeSakiOya, naAddChild);

	// 加算体系組みなおし
	// 移動元ノードの親ノードが’資金繰加算体系’じゃない場合
//	if stWorkRecMotoOya^.prmSumKbn <> 9 then
		// 加算体系ﾚｺｰﾄﾞ削除
	if DeleteKMKTREE(NodeMotoOya, NodeKo) = FALSE then
	begin
		abort;
		exit;
	end;

	// 移動先が’資金繰加算体系’じゃない場合
//	if stWorkRecSakiOya^.prmSumKbn <> 9 then
		// 加算体系書込み
	if WriteKMKTREE(NodeSakiOya, NodeKo, NodeTarget) = FALSE then
	begin
		abort;
		exit;
	end;

	VKasantaikei.Selected := NodeSakiOya;
	stWorkRecSakiOya := NodeSakiOya.Data;
	stName := stWorkRecSakiOya^.prmName;
	iCode := stWorkRecSakiOya^.prmCode;

	if iCode = 0 then
		Mtab1.BorderCaption := ' ' + stName
	else
		Mtab1.BorderCaption := IntToStr(iCode) + ' ' + stName;

	// グリッド再表示
	TaikeiSelectDsp(NodeSakiOya);

{	QueryWrite := TMQuery.Create (Self);
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);
	try
		with QueryTree do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select MasterKbn, SumCode, EntNo, BasedCode from KmkTree');
			SQL.Add('where MasterKbn=3 AND SumCode=:iGCode');
			SQL.Add('order by EntNo');
			SetFld('iGcode').AsInteger := stWorkRecSakiOya^.prmCode;// 検索対象の外部ｺｰﾄﾞ 設定
			Open;								// ｸｴﾘの開始
		end;

		dxMemData1.Close;
		dxMemData2.Close;
		dxMemData1.Open;
//		dxMemData1.First;
		dxMemData2.Open;
//		dxMemData2.First;
		if EOF = FALSE then
		begin
			SetLength(m_aCmnt_Jitu,0);	//	配列をｸﾘｱ
			SetLength(m_aCmnt_Gou,0);	//	配列をｸﾘｱ
		end;

		while QueryTree.EOF = FALSE do
		begin
			with QueryWrite do
			begin
				Close;

				SQL.Clear;							// ｸｴﾘの初期化
				// 合計資金繰科目科目を外部ｺｰﾄﾞ昇順でGET
				SQL.Add('select MasterKbn, RecordKbn, SumKbn, GCode, Renso, LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn from SKmkMA');
				SQL.Add('where MasterKbn=3 AND RecordKbn=0 AND GCode=:iGCode');
				SQL.Add('order by GCode');
				SetFld('iGcode').AsInteger := QueryTree.GetFld('BasedCode').AsInteger;// 検索対象の外部ｺｰﾄﾞ 設定
				Open;						// ｸｴﾘの開始
				if EOF = FALSE then
				begin
					dxMemData1.DisableControls;
					dxMemData2.DisableControls;
					try
						while EOF = FALSE do
						begin
							if GetFld('SumKbn').AsInteger = 1 then
							begin
								DataDsp(2, QueryWrite);
								Next;
							end
							else
							begin
								DataDsp(1, QueryWrite);
								Next;
							end;
						end;
					finally
						dxMemData1.EnableControls;
						dxMemData2.EnableControls;
					end;
				end;
			end;
			QueryTree.Next;
		end;
		if dxMemData1.RecordCount <> 0 then
			dxMemData1.First;				// Memoの先頭に移動

		if dxMemData2.RecordCount <> 0 then
			dxMemData2.First;				// Memoの先頭に移動
	finally
		QueryTree.Free;
		QueryWrite.Free;
	end;}

	// -----<019> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<019> Add-Ed-----
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
procedure TJNTCRP009002_1f.dxMemData1BeforePost(DataSet: TDataSet);
var
	cField		:	TField;
	iCode		:	Integer;
	stWork		:	String;
	QueryRead	:	TMQuery;
//	NodeSelect	:	TTreeNode;
begin
	if 	m_fUpdateRecord = 1 then
	begin
{		if MPanel3.Visible = FALSE then
		begin
			dxMemData1.Cancel;
			exit;
		end;}

		// 外部コード
		iCode := dxMemData1GCode.AsInteger;
		cField  := dxMemData1GCode;

		//　外部コードの0は許さない
		if iCode = 0 then
		begin
			cField.FocusControl;
			abort;
		end
		else
		begin
			if iCode > 99 then
			begin
				MjsMessageBoxEX(AOwner, // <003>
                                '実在資金繰は２桁以内で登録してください。',
                                '登録',
                                mjInformation,
                                mjOk,
                                mjDefOk
                               );
				cField.FocusControl;
				abort;
				exit;
			end;
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
					SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND GCode = :iGCode');
					SQL.Add('order by Gcode');
					SetFld('iGCode').AsInteger := iCode;

					Open;						// ｸｴﾘの開始

	//                showmessage('Mem内部' + IntToStr(dxMemData1NCode.AsInteger));
	//                showmessage('Que内部' + IntToStr(GetFld('NCode').AsInteger));
	//                showmessage('Mem外部' + IntToStr(dxMemData1GCode.AsInteger));
	//                showmessage('Que外部' + IntToStr(GetFld('GCode').AsInteger));

//					if (dxMemData1NCode.AsInteger <> GetFld('NCode').AsInteger) AND // <012>削除
					if (dxMemData1NCode.AsFloat <> GetFld('NCode').AsFloat) AND     // <012>追加
						(dxMemData1GCode.AsInteger = GetFld('GCode').AsInteger) then
					begin
	//                    dxMemData1.Edit;
	//                	dxMemData1.ClearFields;
	//        			m_fUpdateRecord := 0;
	//                    dxMemData1.Post;
	//        			m_fUpdateRecord := 1;
						MjsMessageBoxEX(AOwner, // <003>
                                        '同一資金繰科目が登録済みです。',
                                        '登録',
                                        mjInformation,
                                        mjOk,
                                        mjDefOk
                                       );
						cField  := dxMemData1GCode;
						cField.FocusControl;
						abort;
	//					exit;
					end;
				end;
			finally
				QueryRead.Free;
			end;
		end;

		//　正残区分の''は許さない
		stWork := dxMemData1DcKbnName.AsString;
		if dxMemData1DcKbnName.AsString = '' then
		begin
//			dxMemData1DcKbnCode.AsInteger := 0;
			dxMemData1DummyDc.AsInteger := 0;
			dxMemData1DcKbnName.AsString := sDc[0];
		end;

		//　分析コードの''は許さない
		stWork := dxMemData1AnalyzeName.AsString;
		if dxMemData1AnalyzeName.AsString = '' then
		begin
//			dxMemData1AnalyzeCode.AsInteger := 0;
			dxMemData1DummyAna.AsInteger := 0;
			dxMemData1AnalyzeName.AsString := sAnalyze[0];
		end;

		//　装飾区分の''は許さない
		stWork := dxMemData1DecoKbnName.AsString;
		if dxMemData1DecoKbnName.AsString = '' then
		begin
//			dxMemData1DecoKbnCode.AsInteger := 0;
			dxMemData1DummyDeco.AsInteger := 0;
			dxMemData1DecoKbnName.AsString := sDeco[0];
		end;
	end;

	WriteSKMKMAJ();							// 実在資金繰科目書込み
end;

//**************************************************************************
//	Proccess  :	MemData2Post前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.dxMemData2BeforePost(DataSet: TDataSet);
var
	cField	:	TField;
	iCode	:	Integer;
	stWork	:	String;
	QueryRead	:	TMQuery;
//	NodeSelect	:	TTreeNode;
begin
	if 	m_fUpdateRecord = 1 then
	begin
{		if MPanel4.Visible = FALSE then
		begin
			dxMemData2.Cancel;
			exit;
		end;}

		// 外部コード
		iCode := dxMemData2GCode.AsInteger;
//		ShowMessage(IntToStr(iCode));

		//　外部コードの0は許さない
		if iCode = 0 then
		begin
			cField  := dxMemData2GCode;
			cField.FocusControl;
			abort;
		end
		else
		begin
			if (iCode < 100) or  (iCode > 999)then
			begin
				MjsMessageBoxEX(AOwner, // <003>
                                '合計資金繰は３桁で登録してください。',
                                '登録',
                                mjInformation,
                                mjOk,
                                mjDefOk
                               );
				cField  := dxMemData2GCode;
				cField.FocusControl;
				abort;
				exit;
			end;
		end;

		if dxMemData2.State in [dsInsert] then		// 新規ﾃﾞｰﾀ？
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
					SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND GCode = :iGCode');
					SQL.Add('order by Gcode');
					SetFld('iGCode').AsInteger := iCode;

					Open;						// ｸｴﾘの開始

//					if (dxMemData2NCode.AsInteger <> GetFld('NCode').AsInteger) AND // <012>削除
					if (dxMemData2NCode.AsFloat <> GetFld('NCode').AsFloat) AND     // <012>追加
						(dxMemData2GCode.AsInteger = GetFld('GCode').AsInteger) then
					begin
	//                    dxMemData2.Edit;
	//                	dxMemData2.ClearFields;
	//        			m_fUpdateRecord := 0;
	//                    dxMemData2.Post;
	//        			m_fUpdateRecord := 1;
						MjsMessageBoxEX(AOwner, // <003>
                                        '同一資金繰科目が登録済みです。',
                                        '登録',
                                        mjInformation,
                                        mjOk,
                                        mjDefOk
                                       );
						cField  := dxMemData2GCode;
						cField.FocusControl;
						abort;
						exit;
					end;
				end;
			finally
				QueryRead.Free;
			end;
		end;

		//　正残区分の''は許さない
		stWork := dxMemData2DcKbnName.AsString;
		if dxMemData2DcKbnName.AsString = '' then
		begin
//			dxMemData2DcKbnCode.AsInteger := 0;
			dxMemData2DummyDc.AsInteger := 0;
			dxMemData2DcKbnName.AsString := sDc[0];
		end;

		//　分析コードの''は許さない
		stWork := dxMemData2AnalyzeName.AsString;
		if dxMemData2AnalyzeName.AsString = '' then
		begin
//			dxMemData2AnalyzeCode.AsInteger := 0;
			dxMemData2DummyAna.AsInteger := 0;
			dxMemData2AnalyzeName.AsString := sAnalyze[0];
		end;

		//　装飾区分の''は許さない
		stWork := dxMemData2DecoKbnName.AsString;
		if dxMemData2DecoKbnName.AsString = '' then
		begin
//			dxMemData2DecoKbnCode.AsInteger := 0;
			dxMemData2DummyDeco.AsInteger := 0;
			dxMemData2DecoKbnName.AsString := sDeco[0];
		end;
	end;

	WriteSKMKMAG();							// 実在資金繰科目書込み
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
procedure TJNTCRP009002_1f.dxMemData1AfterPost(DataSet: TDataSet);
begin
//	WriteSKMKMAJ();							// 実在資金繰科目書込み
end;

//**************************************************************************
//	Proccess  :	MemData2Post後ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.dxMemData2AfterPost(DataSet: TDataSet);
begin
//	WriteSKMKMAG();							// 実在資金繰科目書込み
end;

//**************************************************************************
//	Proccess  :	実在資金繰用ﾃﾞｰﾀｿｰｽStateChangeｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DataSource1StateChange(Sender: TObject);
begin
	if  (dxMemData1.State in [dsInsert]) then
	begin
//		DSikinguriJ.Columns[COL_GCODE].ReadOnly := FALSE;
		dxMemData1GCode.ReadOnly := FALSE;
	end
	else
	begin
//		DSikinguriJ.Columns[COL_GCODE].ReadOnly := TRUE;
		dxMemData1GCode.ReadOnly := TRUE;
	end;

	if  (dxMemData1.Active) then
	begin
		if  (DSikinguriJ.DataSource.DataSet.RecordCount = 0) then
		begin
//			DSikinguriJ.Columns [COL_GCODE].ReadOnly := FALSE;
			dxMemData1GCode.ReadOnly := FALSE;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	合計資金繰用ﾃﾞｰﾀｿｰｽStateChangeｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DataSource2StateChange(Sender: TObject);
begin
	if  (dxMemData2.State in [dsInsert]) then
	begin
//		DSikinguriG.Columns[COL_GCODE].ReadOnly := FALSE;
		dxMemData2GCode.ReadOnly := FALSE;
	end
	else
	begin
//		DSikinguriG.Columns[COL_GCODE].ReadOnly := TRUE;
		dxMemData2GCode.ReadOnly := TRUE;
	end;

	if  (dxMemData2.Active) then
	begin
		if  (DSikinguriG.DataSource.DataSet.RecordCount = 0) then
		begin
//			DSikinguriG.Columns [COL_GCODE].ReadOnly := FALSE;
			dxMemData2GCode.ReadOnly := FALSE;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	実在資金繰用DB書込みｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.WriteSKMKMAJ();
var
	QueryWrite	:	TMQuery;
	NodeOya		:   TTreeNode;
	NodeKo		:   TTreeNode;
	stWorkRecKo	:	^TreeViewRec;
	stWorkRecOya:	^TreeViewRec;
//	iRecKbn		:	Integer;
	stName		:	String;
	bEOF		:	Boolean;
// <012>↓
//    iNCode      :   Integer;
    iNCode      :   Extended;
// <012>↑
begin
	iNCode := 0;									// <015>

	if 	m_fUpdateRecord = 1 then
	begin
		NodeOya := VKasantaikei.Selected;			// 現在選択されている親ノード取得
		stWorkRecOya := NodeOya.Data;
		if stWorkRecOya^.prmSumKbn = 0 then
			NodeOya := NodeOya.Parent;

		New(stWorkRecKo);

		QueryWrite := TMQuery.Create (Self);

// <015> MOD start
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
// <015> MOD end

		SessionPractice(C_ST_PROCESS);		// <019>

		MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始
		ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);	//  <015> 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始

		try
			with QueryWrite do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化

				// ﾃﾞｰﾀ存在確認
				SQL.Add('select * from SKmkMA');
				SQL.Add('where MasterKbn = 3 AND SumKbn = 0 AND GCode = :iGCode AND RDelKbn = 0');
				SetFld('iGCode').AsInteger := dxMemData1GCode.AsInteger;
//                ShowMessage(IntToStr(dxMemData1.FieldByName ('GCode').AsInteger));
				Open;
//				iRecKbn := GetFld('RecordKbn').AsInteger;
				// 実在資金繰科目をDBにWriteする
				bEOF := EOF;
				if EOF = TRUE then	// 新規ﾃﾞｰﾀ？
				begin
//                	showmessage('insert');

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
					SQL.Add(', UpdTantoNCode) '); // <020>
					SQL.Add('values (:iMasterKbn, :iSumKbn, :iRDelKbn, :iNcode, :iGcode, :sRenChar,');
// FX					SQL.Add(':sLongName, :sSimpleName, :iDcKbn, :iAnalyzeCode, :iDecoKbn, 0, 0, 0, 0, '''', 0, 0, 1)');
					SQL.Add(':sLongName, :sSimpleName, :iDcKbn, :iAnalyzeCode, :iDecoKbn, 0, 0, 0, 0, '''', 0, 0');
					SQL.Add(', :cUpdTantoNCode)'); // <020>

					// ﾏｽﾀ区分
					SetFld('iMasterKbn').AsInteger := 3;
					// 実在/合計区分
					SetFld('iSumKbn').AsInteger    := 0;
					// 内部ｺｰﾄﾞ
// <012>↓
//					SetFld('iNcode').AsInteger     := iNCode;
//                    dxMemData1NCode.AsInteger      := iNCode;
					SetFld('iNcode').AsFloat    := iNCode;
                    dxMemData1NCode.AsFloat     := iNCode;
// <012>↑
				end
				else
				begin
//                	showmessage('update');
					Close;
					SQL.Clear;							// ｸｴﾘの初期化
					// 更新ｸｴﾘの作成
					SQL.Add('update SKmkMA');
					SQL.Add('set RDelKbn = :iRDelKbn, Renso = :sRenChar, LongName = :sLongName, SimpleName = :sSimpleName, DcKbn = :iDcKbn, AnalyzeCode = :iAnalyzeCode, DecoKbn = :iDecoKbn');
					SQL.Add(', UpdTantoNCode = :cUpdTantoNCode'); // <020>
					SQL.Add('where MasterKbn = 3 AND SumKbn = 0 AND Gcode = :iGcode AND RDelKbn = 0');
				end;

				// 削除区分
				SetFld('iRDelKbn').AsInteger    := 0;
				// 外部ｺｰﾄﾞ
				SetFld('iGcode').AsInteger      := dxMemData1GCode.AsInteger;
				// 連想ｼﾝﾎﾞﾙ
				SetFld('sRenChar').AsString     := fnDelCRLF(dxMemData1RenChar.AsString);    //<DKAI>
				// 正式名称
				SetFld('sLongName').AsString    := fnDelCRLF(dxMemData1LongName.AsString);   //<DKAI>
				// 簡略名称
				SetFld('sSimpleName').AsString  := fnDelCRLF(dxMemData1Simplename.AsString); //<DKAI>
				// 正残区分
//				SetFld('iDcKbn').AsInteger := dxMemData1DcKbnCode.AsInteger;
				SetFld('iDcKbn').AsInteger := dxMemData1DummyDc.AsInteger;
				// 分析コード
//				SetFld('iAnalyzeCode').AsInteger := dxMemData1AnalyzeCode.AsInteger;
				SetFld('iAnalyzeCode').AsInteger := dxMemData1DummyAna.AsInteger;
				// 装飾区分
//				SetFld('iDecoKbn').AsInteger := dxMemData1DecoKbnCode.AsInteger;
				SetFld('iDecoKbn').AsInteger := dxMemData1DummyDeco.AsInteger;
                // 更新担当者内部ｺｰﾄﾞ<020>
                SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryWrite);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <015> 親会社DBもﾛｰﾙﾊﾞｯｸ
					QueryWrite.Close;
//					QueryWrite.Free;
					dxMemData1.Cancel;
					Abort;
				end;

				if bEOF = TRUE then
				begin
					// ﾂﾘｰﾋﾞｭｰに反映
// <012>↓
//					stWorkRecKo^.prmNCode     := dxMemData1NCode.AsInteger;
					stWorkRecKo^.prmNCode     := dxMemData1NCode.AsFloat;
// <012>↑
					stWorkRecKo^.prmCode      := dxMemData1GCode.AsInteger;
					stWorkRecKo^.prmName      := dxMemData1SimpleName.AsString;
					stWorkRecKo^.prmSumKbn    := 0;
					stWorkRecKo^.prmAddKbn    := 0;
					stName := IntToStr(dxMemData1GCode.AsInteger) + ' ' + dxMemData1SimpleName.AsString;
					NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, stName, stWorkRecKo);
					NodeKo.ImageIndex := IC_JP;
					NodeKo.SelectedIndex := IC_JPCHK;

					SetLength(m_aCmnt_Jitu,Length(m_aCmnt_Jitu)+1);	// 付箋コメント追加

					// 加算体系書込み
// <015> MOD start 関数内でﾄﾗﾝｻﾞｸｼｮﾝをかけさせない
//					if WriteKMKTREE(NodeOya, NodeKo, nil) = FALSE then
					if WriteKMKTREE(NodeOya, NodeKo, nil, False) = FALSE then
// <015> MOD end
					begin
						MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <015> 親会社DBもﾛｰﾙﾊﾞｯｸ
						dxMemData1.Cancel;
						Abort;
					end;
				end
				else
				begin
					// ﾂﾘｰﾋﾞｭｰに反映
//					if iRecKbn = 0 then
//					begin
						NodeKo := NodeOya.getFirstChild;
						if NodeKo <> nil then
						begin
							while NodeKo <> nil do
							begin;
								stWorkRecKo := NodeKo.Data;
								if stWorkRecKo^.prmCode = dxMemData1GCode.AsInteger then
								begin
//									stWorkRecKo^.prmCode      := dxMemData1GCode.AsInteger;
//									stWorkRecKo^.prmName      := dxMemData1SimpleName.AsString;
//									stWorkRecKo^.prmSumKbn    := 0;
//									stWorkRecKo^.prmAddKbn    := 0;
	//                                NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, dxMemData1SimpleName.AsString, stWorkRecKo);
	//                                NodeKo.ImageIndex := 2;
	//                                NodeKo.SelectedIndex := 2;
									NodeKo.Text := IntToStr(dxMemData1GCode.AsInteger) + ' ' + dxMemData1SimpleName.AsString;
									break;
								end
								else
									NodeKo := NodeOya.GetNextChild(NodeKo);
							end;
						end;
{					end
					else
					begin
						stWorkRecKo^.prmCode      := dxMemData1GCode.AsInteger;
						stWorkRecKo^.prmName      := dxMemData1SimpleName.AsString;
						stWorkRecKo^.prmSumKbn    := 0;
						stWorkRecKo^.prmAddKbn    := 0;
						stName := IntToStr(dxMemData1GCode.AsInteger) + ' ' + dxMemData1SimpleName.AsString;
						NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, stName, stWorkRecKo);
						NodeKo.ImageIndex := IC_JP;
						NodeKo.SelectedIndex := IC_JPCHK;

						// 加算体系書込み
						if WriteKMKTREE(NodeOya, NodeKo, nil) = FALSE then
						begin
							abort;
							exit;
						end;
					end;}
				end;

// <015> ADD start
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
						dxMemData1.Cancel;
						Abort;
					end;
				end;

				{ ｸﾞﾙｰﾌﾟ会計を採用している場合、全子会社にRELを作成 }
                if (bEof) and							// 新規
                	(m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE) then
				begin									// 全子会社にRELを作成
					if not fnAllCorpRelation(iNCode) then
					begin								// ﾛｰﾙﾊﾞｯｸ
						MDataModule.Rollback (dbCorp_Select);
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
						dxMemData1.Cancel;
						Abort;
					end;
				end;
// <015> ADD end
				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
				ExecParentDBTran(GRP_PARENTDB_COMMIT);	//  <015> 親会社DBもｺﾐｯﾄ
			end;
		finally
			SessionPractice(C_ED_PROCESS);	// <019>
			QueryWrite.Free;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	合計資金繰用DB書込みｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.WriteSKMKMAG();
var
	QueryWrite	:	TMQuery;
	NodeOya		:   TTreeNode;
	NodeKo		:   TTreeNode;
	stWorkRecOya:	^TreeViewRec;
	stWorkRecKo	:	^TreeViewRec;
//	iRecKbn		:	Integer;
	stName		:	String;
	bEOF		:	Boolean;
// <012>↓
//    iNCode      :   Integer;
    iNCode      :   Extended;
// <012>↑
begin
	iNCode := 0;									// <015>
    
	if 	m_fUpdateRecord = 1 then
	begin
		NodeOya := VKasantaikei.Selected;			// 現在選択されている親ノード取得
		stWorkRecOya := NodeOya.Data;
		if stWorkRecOya^.prmSumKbn = 0 then
			NodeOya := NodeOya.Parent;

		New(stWorkRecKo);

		QueryWrite := TMQuery.Create (Self);
// <015> MOD start
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
// <015> MOD end

		SessionPractice(C_ST_PROCESS);		// <019>

		MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始
		ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);	//  <015> 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始

		try
			with QueryWrite do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化

				// ﾃﾞｰﾀ存在確認
				SQL.Add('select * from SKmkMA');
				SQL.Add('where MasterKbn = 3 AND SumKbn = 1 AND GCode = :iGCode AND RDelKbn = 0');
				SetFld('iGCode').AsInteger := dxMemData2GCode.AsInteger;
//                ShowMessage(IntToStr(dxMemData2.FieldByName ('GCode').AsInteger));
				Open;
//				iRecKbn := GetFld('RecordKbn').AsInteger;
				// 合計資金繰科目をDBにWriteする
				bEOF := EOF;
				if EOF = TRUE then	// 新規ﾃﾞｰﾀ？
				begin
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
					SQL.Add(', UpdTantoNCode) '); // <020>
					SQL.Add('values (:iMasterKbn, :iSumKbn, :iRDelKbn, :iNcode, :iGcode, :sRenChar,');
// FX					SQL.Add(':sLongName, :sSimpleName, :iDcKbn, :iAnalyzeCode, :iDecoKbn, 0, 0, 0, 0, '''', 0, 0, 1)');
					SQL.Add(':sLongName, :sSimpleName, :iDcKbn, :iAnalyzeCode, :iDecoKbn, 0, 0, 0, 0, '''', 0, 0');
					SQL.Add(', :cUpdTantoNCode) '); // <020>

					// ﾏｽﾀ区分
					SetFld('iMasterKbn').AsInteger := 3;
					// 実在/合計区分
					SetFld('iSumKbn').AsInteger := 1;
					// 内部ｺｰﾄﾞ
// <012>↓
//					SetFld('iNcode').AsInteger     := iNCode;
//                    dxMemData2NCode.AsInteger      := iNCode;
					SetFld('iNcode').AsFloat    := iNCode;
                    dxMemData2NCode.AsFloat     := iNCode;
// <012>↑
				end
				else
				begin
					Close;
					SQL.Clear;							// ｸｴﾘの初期化
//					ShowMessage('dsUpdate');
					// 更新ｸｴﾘの作成
					SQL.Add('update SKmkMA');
					SQL.Add('set RDelKbn = :iRDelKbn, Renso = :sRenChar, LongName = :sLongName, SimpleName = :sSimpleName, DcKbn = :iDcKbn, AnalyzeCode = :iAnalyzeCode, DecoKbn = :iDecoKbn');
					SQL.Add(', UpdTantoNCode = :cUpdTantoNCode '); // <020>
					SQL.Add('where MasterKbn = 3 AND SumKbn = 1 AND Gcode = :iGcode AND RDelKbn = 0');
				end;

				// 削除区分
				SetFld('iRDelKbn').AsInteger    := 0;
				// 外部ｺｰﾄﾞ
				SetFld('iGcode').AsInteger      := dxMemData2GCode.AsInteger;
				// 連想ｼﾝﾎﾞﾙ
				SetFld('sRenChar').AsString     := fnDelCRLF(dxMemData2RenChar.AsString);    //<DKAI>
				// 正式名称
				SetFld('sLongName').AsString    := fnDelCRLF(dxMemData2LongName.AsString);   //<DKAI>
				// 簡略名称
				SetFld('sSimpleName').AsString  := fnDelCRLF(dxMemData2Simplename.AsString); //<DKAI>
				// 正残区分
//				SetFld('iDcKbn').AsInteger := dxMemData2DcKbnCode.AsInteger;
				SetFld('iDcKbn').AsInteger := dxMemData2DummyDc.AsInteger;
				// 分析コード
//				SetFld('iAnalyzeCode').AsInteger := dxMemData2AnalyzeCode.AsInteger;
				SetFld('iAnalyzeCode').AsInteger := dxMemData2DummyAna.AsInteger;
				// 装飾区分
//				SetFld('iDecoKbn').AsInteger := dxMemData2DecoKbnCode.AsInteger;
				SetFld('iDecoKbn').AsInteger := dxMemData2DummyDeco.AsInteger;
                // 更新担当者内部ｺｰﾄﾞ<020>
                SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryWrite);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <015> 親会社DBもﾛｰﾙﾊﾞｯｸ
					QueryWrite.Close;
//					QueryWrite.Free;
					dxMemData2.Cancel;
					abort;
				end;

				if bEOF = TRUE then
				begin
					// ﾂﾘｰﾋﾞｭｰに反映
// <012>↓
//					stWorkRecKo^.prmNCode     := dxMemData2NCode.AsInteger;
					stWorkRecKo^.prmNCode     := dxMemData2NCode.AsFloat;
// <012>↑
					stWorkRecKo^.prmCode      := dxMemData2GCode.AsInteger;
					stWorkRecKo^.prmName      := dxMemData2SimpleName.AsString;
					stWorkRecKo^.prmSumKbn    := 1;
					stWorkRecKo^.prmAddKbn    := 0;
					stName := IntToStr(dxMemData2GCode.AsInteger) + ' ' + dxMemData2SimpleName.AsString;
					NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, stName, stWorkRecKo);
					NodeKo.ImageIndex := IC_GPCLOSE;
					NodeKo.SelectedIndex := IC_GPOPEN;

					SetLength(m_aCmnt_Gou,Length(m_aCmnt_Gou)+1);	// 付箋コメント追加

					// 加算体系書込み
// <015> MOD start 関数内でﾄﾗﾝｻﾞｸｼｮﾝをかけさせない
//					if WriteKMKTREE(NodeOya, NodeKo, nil) = FALSE then
					if WriteKMKTREE(NodeOya, NodeKo, nil, False) = FALSE then
// <015> MOD end
					begin
						MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <015> 親会社DBもﾛｰﾙﾊﾞｯｸ
						dxMemData2.Cancel;
						abort;
					end;
				end
				else
				begin
					// ﾂﾘｰﾋﾞｭｰに反映
//					if iRecKbn = 0 then
//					begin
						NodeKo := NodeOya.getFirstChild;
						if NodeKo <> nil then
						begin
							while NodeKo <> nil do
							begin;
								stWorkRecKo := NodeKo.Data;
								if stWorkRecKo^.prmCode = dxMemData2GCode.AsInteger then
								begin
//									stWorkRecKo^.prmCode      := dxMemData2GCode.AsInteger;
//									stWorkRecKo^.prmName      := dxMemData2SimpleName.AsString;
//									stWorkRecKo^.prmSumKbn    := 1;
//									stWorkRecKo^.prmAddKbn    := 0;
	//                                NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, dxMemData2SimpleName.AsString, stWorkRecKo);
	//                                NodeKo.ImageIndex := 2;
	//                                NodeKo.SelectedIndex := 2;
									NodeKo.Text := IntToStr(dxMemData2GCode.AsInteger) + ' ' + dxMemData2SimpleName.AsString;
									break;
								end
								else
									NodeKo := NodeOya.GetNextChild(NodeKo);
							end;
						end;
{					end
					else
					begin
						stWorkRecKo^.prmCode      := dxMemData2GCode.AsInteger;
						stWorkRecKo^.prmName      := dxMemData2SimpleName.AsString;
						stWorkRecKo^.prmSumKbn    := 1;
						stWorkRecKo^.prmAddKbn    := 0;
						stName := IntToStr(dxMemData2GCode.AsInteger) + ' ' + dxMemData2SimpleName.AsString;
						NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, stName, stWorkRecKo);
						NodeKo.ImageIndex := IC_GPCLOSE;
						NodeKo.SelectedIndex := IC_GPOPEN;

						// 加算体系書込み
						if WriteKMKTREE(NodeOya, NodeKo, nil) = FALSE then
						begin
							abort;
							exit;
						end;
					end;}
				end;

// <015> ADD start
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
						dxMemData2.Cancel;
						abort;
					end;
				end;

				{ ｸﾞﾙｰﾌﾟ会計を採用している場合、全子会社にRELを作成 }
                if (bEof) and				// 新規
                	(m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE) then
				begin						// 全子会社にRELを作成
					if not fnAllCorpRelation(iNCode) then
					begin					// ﾛｰﾙﾊﾞｯｸ
						MDataModule.Rollback (dbCorp_Select);
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
						dxMemData2.Cancel;
						abort;
					end;
				end;
// <015> ADD end
				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
				ExecParentDBTran(GRP_PARENTDB_COMMIT);	//  <015> 親会社DBもｺﾐｯﾄ
			end;
		finally
			SessionPractice(C_ED_PROCESS);	// <019>
			QueryWrite.Free;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	資金繰科目ﾚｺｰﾄﾞ削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_1f.DeleteSKMKMA(iCode : Integer; iSumKbn : Integer): Boolean;
var
	QueryDelete	:	TMQuery;
// <012>↓
//	iNCode		:	Integer;
	iNCode		:	Extended;
// <012>↑
    strErr      :   String;                 // <CHK>
    strName, strMsg    : String;            // <CHK>
begin
    // <CHK>↓
                                            // 内部ｺｰﾄﾞ取得
    iNCode := GetNCode(iCode, iSumKbn, strName);

                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
    if not fnDelCheck(iNCode, strErr) then
    begin
                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
        strMsg := IntToStr(iCode) + ' ' + strName + ' ' + strErr;
// <015> MOD start Self→AOwner
//        MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
        MjsMessageBoxEx(AOwner, strMsg, '確認', mjInformation, mjOk, mjDefOk);
// <015> MOD end
        Result := False;
        Exit;
    end;
    // <CHK>↑

	QueryDelete := TMQuery.Create (Self);

	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryDelete);
	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	try
		with QueryDelete do
		begin
{
			if iSumKbn = 0 then
			begin
				// CashSM.CashDSM.CashBM.CashZM.MFusenInfoの削除
				// 資金繰実績
				Close;
				SQL.Clear;
				SQL.Add('Delete CashSM');
				SQL.Add('Where CashCode=:iGCode');
				SetFld('iGCode').AsInteger	:= iCode;
				ExecSQL;								// Query 発行

				// 資金繰実績(日次)
				Close;
				SQL.Clear;
				SQL.Add('Delete CashDSM');
				SQL.Add('Where CashCode=:iGCode');
				SetFld('iGCode').AsInteger	:= iCode;
				ExecSQL;								// Query 発行

				// 資金繰予算
				Close;
				SQL.Clear;
				SQL.Add('Delete CashBM');
				SQL.Add('Where CashCode=:iGCode');
				SetFld('iGCode').AsInteger	:= iCode;
				ExecSQL;								// Query 発行

				// 資金繰過年度実績
				Close;
				SQL.Clear;
				SQL.Add('Delete CashZM');
				SQL.Add('Where CashCode=:iGCode');
				SetFld('iGCode').AsInteger	:= iCode;
				ExecSQL;								// Query 発行
			end;
}
			// 資金繰科目の該当ﾚｺｰﾄﾞを読み込み
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// ｸｴﾘの作成
			SQL.Add('select NCode from SKmkMA');
			SQL.Add('where MasterKbn = 3 AND SumKbn = :iSum AND RDelKbn = 0 AND Gcode = :iGcode');
			// 外部ｺｰﾄﾞ
			SetFld('iGcode').AsInteger := iCode;
			// 実在/合計区分
			SetFld('iSum').AsInteger := iSumKbn;
			Open;
// <012>↓
//			iNCode := GetFld('NCode').AsInteger;
			iNCode := GetFld('NCode').AsFloat;
// <012>↑
			// 資金繰科目の該当ﾚｺｰﾄﾞを削除ﾚｺｰﾄﾞにする
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 挿入ｸｴﾘの作成
			SQL.Add('update SKmkMA');
// FX			SQL.Add('set RecordKbn =:iRecord, NCode2 =:iNCode2');
			SQL.Add('set RDelKbn =:iRDelKbn');
			SQL.Add(',UpdTantoNCode =:cUpdTantoNCode '); // <020>
			SQL.Add('where MasterKbn = 3 AND SumKbn =:iSum  AND RDelKbn=0 AND Gcode = :iGcode');

			// 外部ｺｰﾄﾞ
			SetFld('iGcode').AsInteger := iCode;

			// 実在/合計区分
			SetFld('iSum').AsInteger := iSumKbn;
			// ﾚｺｰﾄﾞ区分
			SetFld('iRDelKbn').AsInteger := 1;
			// 内部コード2
// FX			SetFld('iNCode2').AsInteger := iNCode;
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if ExecSQL = FALSE then
			begin
				ErrorMessageDsp(QueryDelete);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryDelete.Close;
//				QueryDelete.Free;
				result := FALSE;
				Exit;
			end;

			gbKmkTreeDelFlag := TRUE;				// メール会計履歴洗い替えﾌﾗｸﾞOn

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

			// 付箋情報削除
			Close;
			SQL.Clear;
			SQL.Add('Delete MFusenInfo');
			SQL.Add('Where MasterKbn=3 and NCode=:iNCode');
			SetFld('iNCode').AsFloat	:= iNCode;
			ExecSQL;								// Query 発行

		end;
	finally
		QueryDelete.Free;
	end;

	result := TRUE;

end;

//**************************************************************************
//	Proccess  :	加算体系用DB書込みｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//			  : 2007 / 05 / 08	K.Katou(PRIME)
//				引数追加 bUseTran	ﾄﾗﾝｻﾞｸｼｮﾝ使用有無　T: 使用(ﾃﾞﾌｫ) F: 不使用
//**************************************************************************
// <015> MOD start
//function TJNTCRP009002_1f.WriteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode; NodeTarget : TTreeNode): Boolean;
function TJNTCRP009002_1f.WriteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode; NodeTarget : TTreeNode; 
									bUseTran : Boolean = True): Boolean;
// <015> MOD end
var
	QueryWrite		:	TMQuery;
	QueryTree		:	TMQuery;
	stWorkRecOya	:	^TreeViewRec;
	stWorkRecKo		:	^TreeViewRec;
	stWorkRecTarget	:	^TreeViewRec;
	iMaxEntNo		:	Integer;
	iWkEntNo1		:	Integer;
	iWkEntNo2		:	Integer;
begin
	stWorkRecOya := NodeOya.Data;
	stWorkRecKo := NodeKo.Data;
	if NodeTarget <> nil Then
		stWorkRecTarget := NodeTarget.Data
	else
		stWorkRecTarget := nil;

//	if stWorkRecOya^.prmSumKbn = 9 then						// ’資金繰加算体系’の場合は加算体系には更新しない
//		exit;

	QueryWrite := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

// <015> MOD start
//	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始
	if bUseTran then
	begin
		MDataModule.BeginTran (dbCorp_Select);	//	ﾄﾗﾝｻﾞｸｼｮﾝの開始
	end;
// <015> MOD end

	try
		with QueryWrite do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化

			if NodeTarget <> nil Then
			begin
				if stWorkRecTarget^.prmSumKbn = 0 then
				begin
					// ターゲットノード
					SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
					SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
					SQL.Add('order by EntNo DESC');
// <012>↓
//					SetFld('iSum').AsInteger   := stWorkRecOya^.prmNCode;
//					SetFld('iBased').AsInteger := stWorkRecTarget^.prmNCode;
					SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
					SetFld('iBased').AsFloat := stWorkRecTarget^.prmNCode;
// <012>↑
					Open;

					iWkEntNo1 := QueryWrite.GetFld('EntNo').AsInteger;

					// ターゲットノードの上のノード
					Close;
					SQL.Clear;							// ｸｴﾘの初期化

					SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
					SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND EntNo < :iEnt');
					SQL.Add('order by EntNo DESC');
// <012>↓
//					SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
					SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
// <012>↑
					SetFld('iEnt').AsInteger := iWkEntNo1;

					Open;

					iWkEntNo2 := QueryWrite.GetFld('EntNo').AsInteger;

					// 登録NOを求める
					iMaxEntNo := (iWkEntNo1 + iWkEntNo2) div 2;
					if iMaxEntNo = iWkEntNo2 then
					begin
						AgainEntNoSet (stWorkRecOya^.prmCode);				// 登録ＮＯ再編成処理

						Close;
						SQL.Clear;							// ｸｴﾘの初期化

						// ターゲットノード
						SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
						SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
						SQL.Add('order by EntNo DESC');
// <012>↓
//						SetFld('iSum').AsInteger   := stWorkRecOya^.prmNCode;
//						SetFld('iBased').AsInteger := stWorkRecTarget^.prmNCode;
						SetFld('iSum').AsFloat     := stWorkRecOya^.prmNCode;
						SetFld('iBased').AsFloat   := stWorkRecTarget^.prmNCode;
// <012>↑
						Open;

						iWkEntNo1 := QueryWrite.GetFld('EntNo').AsInteger;

						// ターゲットノードの上のノード
						Close;
						SQL.Clear;							// ｸｴﾘの初期化

						SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
						SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND EntNo < :iEnt');
						SQL.Add('order by EntNo DESC');
// <012>↓
//						SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
						SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
// <012>↑
						SetFld('iEnt').AsInteger := iWkEntNo1;

						Open;

						iWkEntNo2 := QueryWrite.GetFld('EntNo').AsInteger;

						// 登録NOを求める
						iMaxEntNo := (iWkEntNo1 + iWkEntNo2) div 2;
					end;
				end
				else
				begin
					// ターゲットノード
					SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
					SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum');
					SQL.Add('order by EntNo DESC');
// <012>↓
//					SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
					SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
// <012>↑
					Open;

					if EOF = FALSE then
					begin
						iMaxEntNo := GetFld('EntNo').AsInteger;
						iMaxEntNo := iMaxEntNo + 100;
						if iMaxEntNo >= 999999 then
						begin
							AgainEntNoSet (stWorkRecOya^.prmCode);				// 登録ＮＯ再編成処理

							// ターゲットノード
							SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
							SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum');
							SQL.Add('order by EntNo DESC');
// <012>↓
//							SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
							SetFld('iSum').AsFloat := stWorkRecOya^.prmNCode;
// <012>↑
							Open;

							iMaxEntNo := GetFld('EntNo').AsInteger;
							iMaxEntNo := iMaxEntNo + 100;
						end;
					end
					else
						iMaxEntNo := 100;
				end;
			end
			else
			begin
				// ﾃﾞｰﾀ存在確認
				SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
				SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum');
				SQL.Add('order by EntNo DESC');
// <012>↓
//				SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
				SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
// <012>↑
				Open;

				// 登録NOの最大値を検索
				if EOF = FALSE then
				begin
					iMaxEntNo := QueryWrite.GetFld('EntNo').AsInteger;
					iMaxEntNo := iMaxEntNo + 100;
				end
				else
					iMaxEntNo := 100;
			end;

//			showmessage('加算体系書込み');
			// 実在資金繰科目をDBにWriteする
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 挿入ｸｴﾘの作成
			SQL.Add('insert into KmkTree');
			SQL.Add('(MasterKbn, SumNCode, EntNo, MasterKbn2, BasedNCode, AddKbn');
			SQL.Add(', UpdTantoNCode) ');  // <020>
			SQL.Add('values (:iMasterKbn, :iSumCode, :iEntNo, 3, :iBasedCode, :iAddKbn');
			SQL.Add(', :cUpdTantoNCode) ');  // <020>

			// マスタ区分
			SetFld('iMasterKbn').AsInteger := 3;
			// 加算先外部ｺｰﾄﾞ
// <012>↓
//			SetFld('iSumCode').AsInteger := stWorkRecOya^.prmNCode;
			SetFld('iSumCode').AsFloat   := stWorkRecOya^.prmNCode;
// <012>↑
//            showmessage('加算先コード'+IntToStr(stWorkRecOya^.prmCode));
			// 登録NO
			SetFld('iEntNo').AsInteger := iMaxEntNo;
//            showmessage('登録NO'+IntToStr(iMaxEntNo));
			// 加算元外部ｺｰﾄﾞ
// <012>↓
//			SetFld('iBasedCode').AsInteger := stWorkRecKo^.prmNCode;
			SetFld('iBasedCode').AsFloat := stWorkRecKo^.prmNCode;
// <012>↑
//            showmessage('加算元コード'+IntToStr(stWorkRecKo^.prmCode));
			// 加算区分
			SetFld('iAddKbn').AsInteger := stWorkRecKo^.prmAddKbn;

            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryWrite);
// <015> MOD start
//				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				if bUseTran then
				begin									//	ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
				end;
// <015> MOD end
				QueryWrite.Close;
//				QueryWrite.Free;
				result := FALSE;
				Exit;
			end;
// <015> MOD start
//			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
			if bUseTran then
			begin
				MDataModule.Commit (dbCorp_Select);	//	ｺﾐｯﾄ(反映)
			end;
// <015> MOD end

			gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
		end;
	finally
		QueryWrite.Free;
		QueryTree.Free;
	end;

	result := TRUE;

end;

//**************************************************************************
//	Proccess  :	加算体系ﾚｺｰﾄﾞ削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_1f.DeleteKMKTREE(NodeOya : TTreeNode; NodeKo : TTreeNode): Boolean;
var
	QueryWrite	:	TMQuery;
	stWorkRecOya:	^TreeViewRec;
	stWorkRecKo	:	^TreeViewRec;
begin
	stWorkRecOya := NodeOya.Data;
	stWorkRecKo := NodeKo.Data;

//	if stWorkRecOya^.prmSumKbn = 9 then						// ’資金繰加算体系’の場合は加算体系には更新しない
//		exit;

	QueryWrite := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	try
		with QueryWrite do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化

			// ﾃﾞｰﾀ存在確認
			SQL.Add('select * from KmkTree');
			SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
//          SQL.Add('order by EntNo DESC');
// <012>↓
//			SetFld('iSum').AsInteger   := stWorkRecOya^.prmNCode;
//			SetFld('iBased').AsInteger := stWorkRecKo^.prmNCode;
			SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
			SetFld('iBased').AsFloat := stWorkRecKo^.prmNCode;
// <012>↑
//			ShowMessage(IntToStr(stWorkRecOya^.prmCode)+'親');
//			ShowMessage(IntToStr(stWorkRecKo^.prmCode)+'子');

			Open;

			if EOF = FALSE then
			begin
				// 加算体系の該当ﾚｺｰﾄﾞを削除する
//				ShowMessage('加算体系の該当ﾚｺｰﾄﾞあり');
				Close;
				SQL.Clear;							// ｸｴﾘの初期化
				// 挿入ｸｴﾘの作成
				SQL.Add('delete from KmkTree');
				SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
// <012>↓
//				SetFld('iSum').AsInteger   := stWorkRecOya^.prmNCode;
//				SetFld('iBased').AsInteger := stWorkRecKo^.prmNCode;
				SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
				SetFld('iBased').AsFloat := stWorkRecKo^.prmNCode;
// <012>↑
				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryWrite);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					QueryWrite.Close;
//					QueryWrite.Free;
					result := FALSE;
					Exit;
				end;

				gbKmkTreeDelFlag := TRUE;				// メール会計履歴洗い替えﾌﾗｸﾞOn
				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

				gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
			end;
		end;
	finally
		QueryWrite.Free;
	end;

	result := TRUE;

end;

//**************************************************************************
//	Proccess  :	加算体系作成（体系読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiOyaCreate(NodeOya : TTreeNode);
var
	QueryTree	:	TMQuery;
	stWorkRecOya:	^TreeViewRec;
begin
	stWorkRecOya := NodeOya.Data;

	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	try
		with QueryTree do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
			SQL.Add('where MasterKbn = :iMaster AND SumNCode = :iSum');
			SQL.Add('order by EntNo');
			SetFld('iMaster').AsInteger := 3;
// <012>↓
//			SetFld('iSum').AsInteger    := stWorkRecOya^.prmNCode;
			SetFld('iSum').AsFloat    := stWorkRecOya^.prmNCode;
// <012>↑
			Open;								// ｸｴﾘの開始

			while EOF = FALSE do
			begin
				TaikeiKoCreate(QueryTree, NodeOya);
				Next;
			end;
		end;
	finally
		QueryTree.Free;
	end;

end;

//**************************************************************************
//	Proccess  :	加算体系作成（管理科目マスタ読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiKoCreate(QueryTree : TMQuery; NodeOya : TTreeNode);
var
	QueryRead	:	TMQuery;
	TreeNode	:	TTreeNode;
begin
	QueryRead := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

	try
		with QueryRead do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 資金繰科目を外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select MasterKbn, RDelKbn, SumKbn, NCode, GCode, Renso, LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn from SKmkMA');
			SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND NCode = :iNCode');
			SQL.Add('order by Gcode');
// <012>↓
//	          SetFld('iNCode').AsInteger := QueryTree.GetFld('BasedNCode').AsInteger;
			SetFld('iNCode').AsFloat := QueryTree.GetFld('BasedNCode').AsFloat;
// <012>↑
			Open;						// ｸｴﾘの開始

			if EOF = FALSE then
			begin
				TreeNode := NodeCreate(NodeOya, QueryRead, GetFld('SumKbn').AsInteger, QueryTree.GetFld('AddKbn').AsInteger);
				TaikeiOyaCreate(TreeNode);
			end;
		end;
	finally
		QueryRead.Free;
	end;
end;

//**************************************************************************
//	Proccess  :	加算体系作成（体系読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiOyaCreateHagure(NodeOya : TTreeNode; iFlg : Integer);
var
	QueryTree	:	TMQuery;
	stWorkRecOya:	^TreeViewRec;
begin
	stWorkRecOya := NodeOya.Data;

	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	try
		with QueryTree do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化

			// 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
			if iFlg = 0 then
			begin
				SQL.ADD('SELECT MA.NCode,MA.SumKbn ');
				SQL.ADD('FROM SKmkMA MA');
				SQL.ADD('where MA.NCode not in(select TR.BasedNCode from KmkTree TR where TR.masterKbn = 3)');
//				SQL.ADD('and MA.GCode not in(select TR.SumCode from KmkTree TR where TR.masterKbn = 3)');
				SQL.ADD('and MA.MasterKbn = 3 and MA.RDelKbn = 0');
			end
			else
			begin
				SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode, AddKbn from KmkTree');
				SQL.Add('where MasterKbn = :iMaster AND SumNCode = :iSum');
				SQL.Add('order by EntNo');
				SetFld('iMaster').AsInteger := 3;
// <012>↓
//				SetFld('iSum').AsInteger    := stWorkRecOya^.prmNCode;
				SetFld('iSum').AsFloat    := stWorkRecOya^.prmNCode;
// <012>↑
			end;

			Open;								// ｸｴﾘの開始

			while EOF = FALSE do
			begin
				TaikeiKoCreateHagure(QueryTree, NodeOya, iFlg);
				Next;
			end;
		end;
	finally
		QueryTree.Free;
	end;

end;

//**************************************************************************
//	Proccess  :	加算体系作成（管理科目マスタ読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiKoCreateHagure(QueryTree : TMQuery; NodeOya : TTreeNode; iFlg : Integer);
var
	QueryRead	:	TMQuery;
	TreeNode	:	TTreeNode;
begin
	QueryRead := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

	try
		with QueryRead do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 資金繰科目を外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select MasterKbn, RDelKbn, SumKbn, NCode, GCode, Renso, LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn from SKmkMA');
			SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND NCode=:iNCode');
			SQL.Add('order by Gcode');
// <012>↓
{			if iFlg = 0 then
				SetFld('iNCode').AsInteger := QueryTree.GetFld('NCode').AsInteger
			else
				SetFld('iNCode').AsInteger := QueryTree.GetFld('BasedNCode').AsInteger;
}
			if iFlg = 0 then
				SetFld('iNCode').AsFloat := QueryTree.GetFld('NCode').AsFloat
			else
				SetFld('iNCode').AsFloat := QueryTree.GetFld('BasedNCode').AsFloat;
// <012>↑

			Open;						// ｸｴﾘの開始

			if EOF = FALSE then
			begin
				if iFlg = 0 then
					TreeNode := NodeCreate(NodeOya, QueryRead, GetFld('SumKbn').AsInteger, 0)
				else
					TreeNode := NodeCreate(NodeOya, QueryRead, GetFld('SumKbn').AsInteger, QueryTree.GetFld('AddKbn').AsInteger);

				TaikeiOyaCreateHagure(TreeNode, 1);
			end;
		end;
	finally
		QueryRead.Free;
	end;
end;

//**************************************************************************
//	Proccess  :	実在資金繰科目登録グリッドｶﾗﾑ移動前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
//	cField		:	TField;
	iWork		:	Integer;
	stWork		:	String;
	QueryRead	:	TMQuery;
	stMessageRec: TMJSMsgRec;
begin
	// 移動元
	case Column of
		COL_GCODE:							// 外部コード
		begin
//			cField  := dxMemData1GCode;

			iWork := dxMemData1GCode.AsInteger;
			if iWork = 0 then
			begin
//				DSikinguriJ.FocusedColumn := COL_GCODE;						// コードに初期ﾌｫｰｶｽ
//				cField.FocusControl;
//				abort;
				CanChange := FALSE;
				exit;
			end
			else
			begin
				if iWork > 100 then
				begin
					MjsMessageBoxEX(AOwner, // <003>
                                    '実在資金繰は２桁以内で登録してください。',
                                    '登録',
                                    mjInformation,
                                    mjOk,
                                    mjDefOk
                                   );
					CanChange := FALSE;
					abort;
				end;
			end;

			if dxMemData1GCode.ReadOnly = FALSE then
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
						SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND GCode = :iGCode');
						SQL.Add('order by Gcode');
						SetFld('iGCode').AsInteger := iWork;

						Open;						// ｸｴﾘの開始

						if EOF = FALSE then
						begin
	//						QueryRead.Free;
							MjsMessageBoxEX(AOwner, // <003>
                                            '同一資金繰科目が登録済みです。',
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
		COL_DC_KBN_CD:
		begin
			if dxMemData1DcKbnName.AsString = '' then
			begin
			   	dxMemData1.Edit;
//				dxMemData1DcKbnCode.AsInteger := 0;
				dxMemData1DummyDc.AsInteger := 0;
				dxMemData1DcKbnName.AsString := sDc[0];
			end;
		end;
		COL_DC_KBN_NM:
		begin
		end;
		COL_ANA_CD:
		begin
			if dxMemData1AnalyzeName.AsString = '' then
			begin
			   	dxMemData1.Edit;
//				dxMemData1AnalyzeCode.AsInteger := 0;
				dxMemData1DummyAna.AsInteger := 0;
				dxMemData1AnalyzeName.AsString := sAnalyze[0];
			end;
		end;
		COL_ANA_NM:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
			if dxMemData1DecoKbnName.AsString = '' then
			begin
			   	dxMemData1.Edit;
//				dxMemData1DecoKbnCode.AsInteger := 0;
				dxMemData1DummyDeco.AsInteger := 0;
				dxMemData1DecoKbnName.AsString := sDeco[0];
			end;
		end;
		COL_DECO_KBN_NM:
		begin
		end;
	end;

	// ステータスバー消去
	SStatus.SimpleText := '';

	case NewColumn of
		COL_S_NAME:
		begin
			dxMemData1.Edit;
			ComArea.m_MsgStd.GetMsg( stMessageRec, 30, 19);
			SStatus.SimpleText := stMessageRec.sMsg;
 		end;
	end;
end;

//**************************************************************************
//	Proccess  :	合計資金繰科目登録グリッドｶﾗﾑ移動前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
//	cField		:	TField;
	iWork		:	Integer;
	stWork		:	String;
	QueryRead	:	TMQuery;
	stMessageRec: TMJSMsgRec;
begin
	case Column of
		COL_GCODE:							// 外部コード
		begin
//			cField  := dxMemData2GCode;

			iWork := dxMemData2GCode.AsInteger;
			if iWork = 0 then
			begin
//				DSikinguriG.FocusedColumn := COL_GCODE;						// コードに初期ﾌｫｰｶｽ
//				abort;
				CanChange := FALSE;
				exit;
			end
			else
			begin
				if (iWork < 100) or  (iWork > 999)then
				begin
					MjsMessageBoxEX(AOwner, // <003>
                                    '合計資金繰は３桁で登録してください。',
                                    '登録',
                                    mjInformation,
                                    mjOk,
                                    mjDefOk
                                   );
//					DSikinguriG.FocusedColumn := COL_GCODE;						// コードに初期ﾌｫｰｶｽ
//					abort;
					CanChange := FALSE;
					abort;
				end;
			end;

			if dxMemData2GCode.ReadOnly = FALSE then
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
						SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND GCode = :iGCode');
						SQL.Add('order by Gcode');
						SetFld('iGCode').AsInteger := iWork;

						Open;						// ｸｴﾘの開始

						if EOF = FALSE then
						begin
	//						QueryRead.Free;
							MjsMessageBoxEX(AOwner, // <003>
                                            '同一資金繰科目が登録済みです。',
                                            '登録',
                                            mjInformation,
                                            mjOk,
                                            mjDefOk
                                           );
//							DSikinguriG.FocusedColumn := COL_GCODE;						// コードに初期ﾌｫｰｶｽ
//							abort;
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
			stWork := dxMemData2SimpleName.AsString;
			if stWork = '' then
			begin
				dxMemdata2.Edit;
				dxMemData2SimpleName.AsString := MjsCopy(dxMemData2LongName.AsString, 14);
			end;
		end;
		COL_S_NAME:
		begin
		end;
		COL_DC_KBN_CD:
		begin
			if dxMemData2DcKbnName.AsString = '' then
			begin
			   	dxMemData2.Edit;
//				dxMemData2DcKbnCode.AsInteger := 0;
				dxMemData2DummyDc.AsInteger := 0;
				dxMemData2DcKbnName.AsString := sDc[0];
			end;
		end;
		COL_DC_KBN_NM:
		begin
		end;
		COL_ANA_CD:
		begin
			if dxMemData2AnalyzeName.AsString = '' then
			begin
			   	dxMemData2.Edit;
//				dxMemData2AnalyzeCode.AsInteger := 0;
				dxMemData2DummyAna.AsInteger := 0;
				dxMemData2AnalyzeName.AsString := sAnalyze[0];
			end;
		end;
		COL_ANA_NM:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
			if dxMemData2DecoKbnName.AsString = '' then
			begin
			   	dxMemData2.Edit;
//				dxMemData2DecoKbnCode.AsInteger := 0;
				dxMemData2DummyDeco.AsInteger := 0;
				dxMemData2DecoKbnName.AsString := sDeco[0];
			end;
		end;
		COL_DECO_KBN_NM:
		begin
		end;
	end;

	// ステータスバー消去
	SStatus.SimpleText := '';

	case NewColumn of
		COL_S_NAME:
		begin
			dxMemData2.Edit;
			ComArea.m_MsgStd.GetMsg( stMessageRec, 30, 19);
			SStatus.SimpleText := stMessageRec.sMsg;
 		end;
	end;
end;

//**************************************************************************
//	Proccess  :	ツリービュー右クリックﾎﾟｯﾌﾟｱｯﾌﾟｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.PMKasantaikeiPopup(Sender: TObject);
var
	NodeSelect	: TTreeNode;
	stWorkRec	: ^TreeViewRec;
	NodeOya		: TTreeNode;
	stWorkRecOya: ^TreeViewRec;
	QueryFusen	: TMQuery;
    pEnabled    : Boolean;  //<004> 加算/減算/他の加算先へｺﾋﾟｰ/他の加算先に貼り付け/加算しない/OnOff
//    fEnabled    : Boolean;  //<004> 付箋OnOff

begin

	NodeSelect          := VKasantaikei.Selected;
	m_cNodeRightClk     := NodeSelect;
	stWorkRec           := NodeSelect.Data;
// <014> MOD start
//  pEnabled            :=  m_IsUpdate;
    pEnabled            :=  IsUpdateEx();
// <014> MOD end

	VKasantaikei.Selected  := NodeSelect;

	if  stWorkRec^.prmSumKbn = 9 then			// 資金繰加算体系だったら
	begin
//		Cut.Enabled  := FALSE;
		Copy.Enabled  := FALSE;
		Delete.Enabled  := FALSE;
		AllDel.Enabled  := FALSE;
		TPlus.Enabled  := FALSE;
		TMinus.Enabled  := FALSE;
		TFDel.Enabled  := FALSE;
		TFRe.Enabled  := FALSE;
		TFSep.Enabled  := FALSE;
		TFBlue.Enabled  := FALSE;
		TFGreen.Enabled  := FALSE;
		TFOrange.Enabled  := FALSE;
		TFRed.Enabled  := FALSE;
	end
	else
	begin
//		Cut.Enabled  := TRUE;
// <014> MOD start
(*		Delete.Enabled  := m_cJNTArea.IsDelete;  //<004>

		Copy.Enabled     := m_IsUpdate;
		AllDel .Enabled  := m_IsUpdate;
		TPlus.Enabled    := m_IsUpdate;
		TMinus.Enabled   := m_IsUpdate;
*)
		Delete.Enabled   := IsDeleteEx();	// 削除

		Copy.Enabled     := IsUpdateEx();	// 他の加算先へｺﾋﾟｰ
		AllDel .Enabled  := IsUpdateEx();	// 加算しない
		TPlus.Enabled    := IsUpdateEx();	// 加算
		TMinus.Enabled   := IsUpdateEx();	// 減算
// <014> MOD end

		TFDel.Enabled    := m_cJNTArea.IsFusen;
		TFRe.Enabled     := m_cJNTArea.IsFusen;
		TFSep.Enabled    := m_cJNTArea.IsFusen;
		TFBlue.Enabled   := m_cJNTArea.IsFusen;
		TFGreen.Enabled  := m_cJNTArea.IsFusen;
		TFOrange.Enabled := m_cJNTArea.IsFusen;
		TFRed.Enabled    := m_cJNTArea.IsFusen;

		NodeOya			    := NodeSelect.Parent;
		stWorkRecOya        := NodeOya.Data;
		if  stWorkRecOya^.prmAddKbn = 9 then
			AllDel.Enabled  := FALSE;
	end;

    if (not pEnabled) then    //<004> 更新権限がなければ必然的に使用不可
   		Paste.Enabled  := FALSE
    else
    begin
    	if  m_stRecPaste = nil then
	    	Paste.Enabled  := FALSE
    	else
	    begin
		    // 貼り付けられるのは合計のみ
    		if  stWorkRec^.prmSumKbn = 0 then
	    		Paste.Enabled  := FALSE
		    else
    		begin
	    		// 二重加算は許さない
		    	if  m_stRecPaste^.prmCode = stWorkRec^.prmCode then
			    	Paste.Enabled  := FALSE
    			else
	    		begin
		    		// 自分より下位の体系には貼り付けられない
			    	if  (not fnCheckMasterTreeInsertValid (m_stRecPaste.prmCode, stWorkRec^.prmCode)) then
				    	Paste.Enabled  := FALSE
    				else
	    				Paste.Enabled  := TRUE;
		    	end;
    		end;
    	end;
    end;

	QueryFusen := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryFusen);

//	PMKasantaikei.Items[9].Checked := FALSE;
//	PMKasantaikei.Items[10].Checked := FALSE;
//	PMKasantaikei.Items[11].Checked := FALSE;
//	PMKasantaikei.Items[12].Checked := FALSE;
	try
		// 付箋ﾁｪｯｸ
		with QueryFusen do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 資金繰科目科目付箋情報をGET
			SQL.Add('select * from MFusenInfo');
			SQL.Add('where MasterKbn=3 AND NCode=:iNCode');
			SetFld('iNCode').AsFloat := stWorkRec^.prmNCode;// 検索対象の外部ｺｰﾄﾞ 設定
			Open;					// ｸｴﾘの開始

			if EOF = False then
			begin
				PMKasantaikei.Items[9].Visible := True;
				PMKasantaikei.Items[10].Visible := True;
				PMKasantaikei.Items[11].Visible := True;
				case GetFld('FusenKbn').AsInteger of
					RED:
					begin
						PMKasantaikei.Items[12].Visible := False;
						PMKasantaikei.Items[13].Visible := True;
						PMKasantaikei.Items[14].Visible := True;
						PMKasantaikei.Items[15].Visible := True;
						TFDel.Bitmap.Assign(TFRed.Bitmap);
					end;
					BLUE:
					begin
						PMKasantaikei.Items[12].Visible := True;
						PMKasantaikei.Items[13].Visible := False;
						PMKasantaikei.Items[14].Visible := True;
						PMKasantaikei.Items[15].Visible := True;
						TFDel.Bitmap.Assign(TFBlue.Bitmap);
					end;
					GREEN:
					begin
						PMKasantaikei.Items[12].Visible := True;
						PMKasantaikei.Items[13].Visible := True;
						PMKasantaikei.Items[14].Visible := False;
						PMKasantaikei.Items[15].Visible := True;
						TFDel.Bitmap.Assign(TFGreen.Bitmap);
					end;
					ORANGE:
					begin
						PMKasantaikei.Items[12].Visible := True;
						PMKasantaikei.Items[13].Visible := True;
						PMKasantaikei.Items[14].Visible := True;
						PMKasantaikei.Items[15].Visible := False;
						TFDel.Bitmap.Assign(TFOrange.Bitmap);
					end;
				end;
			end
			else
			begin
				PMKasantaikei.Items[9].Visible := False;
				PMKasantaikei.Items[10].Visible := False;
				PMKasantaikei.Items[11].Visible := False;
				PMKasantaikei.Items[12].Visible := True;
				PMKasantaikei.Items[13].Visible := True;
				PMKasantaikei.Items[14].Visible := True;
				PMKasantaikei.Items[15].Visible := True;
			end;
		end;
	finally
		QueryFusen.Free;
	end;

end;

//**************************************************************************
//	Proccess  :	ツリービューﾎﾟｯﾌﾟｱｯﾌﾟ切り取りｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.CutClick(Sender: TObject);
var
	NodeOya		: TTreeNode;
//	stWorkRecKo : ^TreeViewRec;
begin
	NodeOya			:= m_cNodeRightClk.Parent;
	m_stRecPaste	:= m_cNodeRightClk.Data;

	// 指定のノードのﾊﾟﾗﾒｰﾀをｾｰﾌﾞ
//	m_stRecPaste^.prmCode  := stWorkRecKo^.prmCode;
//	m_stRecPaste^.prmName  := stWorkRecKo^.prmName;
//	m_stRecPaste^.prmSumKbn:= stWorkRecKo^.prmSumKbn;
//	m_stRecPaste^.prmAddKbn:= stWorkRecKo^.prmAddKbn;

	// 加算体系削除
	if DeleteKMKTREE(NodeOya, m_cNodeRightClk) = FALSE then
	begin
		abort;
		exit;
	end;

	// ノード自体を削除
	m_cNodeRightClk.Delete;

end;

//**************************************************************************
//	Proccess  :	ツリービューﾎﾟｯﾌﾟｱｯﾌﾟコピーｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.CopyClick(Sender: TObject);
//var
//	stWorkRecKo : ^TreeViewRec;
begin
	m_stRecPaste  := m_cNodeRightClk.Data;

	// 指定のノードのﾊﾟﾗﾒｰﾀをｾｰﾌﾞ
//	m_stRecPaste^.prmCode  := stWorkRecKo^.prmCode;
//	m_stRecPaste^.prmName  := stWorkRecKo^.prmName;
//	m_stRecPaste^.prmSumKbn:= stWorkRecKo^.prmSumKbn;
//	m_stRecPaste^.prmAddKbn:= stWorkRecKo^.prmAddKbn;

	// 加算体系削除
//    DeleteKMKTREE(NodeOya, m_cNodeRightClk);

	// ノード自体を削除
//	m_cNodeRightClk.Delete;

end;

//**************************************************************************
//	Proccess  :	ツリービューﾎﾟｯﾌﾟｱｯﾌﾟ貼り付けｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.PasteClick(Sender: TObject);
var
	NodeSelect		: TTreeNode;
	NodeOya			: TTreeNode;
	NodeKo			: TTreeNode;
	stWorkRecSelect	: ^TreeViewRec;
	stWorkRecOya	: ^TreeViewRec;
	stWorkRecAdd 	: ^TreeViewRec;
	QueryCheck		: TMQuery;
	stName			: String;
begin
	// -----<019> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<019> Add-Ed-----

	New(stWorkRecAdd);

	NodeSelect		:= m_cNodeRightClk;
	stWorkRecSelect	:= NodeSelect.Data;

	// 親ノード取得
	if stWorkRecSelect^.prmSumKbn = 0 then
		NodeOya			:= NodeSelect.Parent
	else
		NodeOya			:= NodeSelect;

	stWorkRecOya	:= NodeOya.Data;

	// 同一加算先には貼り付け禁止
	if m_stRecPaste^.prmCode = stWorkRecSelect^.prmCode then
	begin
		MjsMessageBoxEX(AOwner, // <003>
                        '２重加算の為コピーすることができません。',
                        '確認',
                        mjInformation,
                        mjOk,
                        mjDefOk
                       );
		exit;
	end;

	// 加算体系ﾁｪｯｸ(移動先ノードに同一ﾚｺｰﾄﾞがあるかどうか)
	QueryCheck := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryCheck);
	try
		with QueryCheck do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化

			// ﾃﾞｰﾀ存在確認
			SQL.Add('select * from KmkTree');
			SQL.Add('where MasterKbn = 3 AND SumNCode = :iSum AND BasedNCode = :iBased');
//          SQL.Add('order by EntNo DESC');
// <012>↓
//			SetFld('iSum').AsInteger := stWorkRecOya^.prmNCode;
//			SetFld('iBased').AsInteger := m_stRecPaste^.prmNCode;
			SetFld('iSum').AsFloat   := stWorkRecOya^.prmNCode;
			SetFld('iBased').AsFloat := m_stRecPaste^.prmNCode;
// <012>↑
			Open;
			if EOF = FALSE then
			begin
				MjsMessageBoxEX(AOwner, // <003>
                                '同一コードが登録済みです',
                                '登録',
                                mjQuestion,
                                mjOk,
                                mjDefOk
                               );
				exit;
			end;
		end;
	finally
		QueryCheck.Free;
	end;

	if stWorkRecSelect^.prmSumKbn = 0 then
	begin
		// ﾂﾘｰﾋﾞｭｰに反映
		stWorkRecAdd^.prmNCode	:= m_stRecPaste^.prmNCode;
		stWorkRecAdd^.prmCode	:= m_stRecPaste^.prmCode;
		stWorkRecAdd^.prmName	:= m_stRecPaste^.prmName;
		stWorkRecAdd^.prmSumKbn	:= m_stRecPaste^.prmSumKbn;
		stWorkRecAdd^.prmAddKbn	:= m_stRecPaste^.prmAddKbn;
		stName := IntToStr(m_stRecPaste^.prmCode) + ' ' + m_stRecPaste^.prmName;
		NodeKo := VKasantaikei.Items.AddChildObject(NodeOya, stName, stWorkRecAdd);
		if m_stRecPaste^.prmSumKbn = 0 then			// 追加するノードが実在
		begin
			if m_stRecPaste^.prmAddKbn = 0 then
			begin
				NodeKo.ImageIndex := IC_JP;
				NodeKo.SelectedIndex := IC_JPCHK;
			end
			else
			begin
				NodeKo.ImageIndex := IC_JM;
				NodeKo.SelectedIndex := IC_JMCHK;
			end;
		end
		else 									// 合計
		begin
			if m_stRecPaste^.prmAddKbn = 0 then
			begin
				NodeKo.ImageIndex := IC_GPCLOSE;
				NodeKo.SelectedIndex := IC_GPOPEN;
			end
			else
			begin
				NodeKo.ImageIndex := IC_GMCLOSE;
				NodeKo.SelectedIndex := IC_GMOPEN;
			end;
		end;

		// 加算体系書込
		if WriteKMKTREE(NodeOya, NodeKo, NodeSelect) = FALSE then
		begin
			abort;
			exit;
		end;

		NodeOya.DeleteChildren;

		VKasantaikei.Items.BeginUpdate;

		TaikeiOyaCreate(NodeOya);				// 加算体系ﾂﾘｰﾋﾞｭｰ作成

		VKasantaikei.Items.EndUpdate;

		// グリッド再表示
		TaikeiSelectDsp(NodeOya);
	end
	else
	begin
		// ﾂﾘｰﾋﾞｭｰに反映
		stWorkRecAdd^.prmNCode	:= m_stRecPaste^.prmNCode;
		stWorkRecAdd^.prmCode	:= m_stRecPaste^.prmCode;
		stWorkRecAdd^.prmName	:= m_stRecPaste^.prmName;
		stWorkRecAdd^.prmSumKbn	:= m_stRecPaste^.prmSumKbn;
		stWorkRecAdd^.prmAddKbn	:= m_stRecPaste^.prmAddKbn;
		stName := IntToStr(m_stRecPaste^.prmCode) + ' ' + m_stRecPaste^.prmName;
		NodeKo := VKasantaikei.Items.AddChildObject(NodeSelect, stName, stWorkRecAdd);
		if m_stRecPaste^.prmSumKbn = 0 then			// 追加するノードが実在
		begin
			if m_stRecPaste^.prmAddKbn = 0 then
			begin
				NodeKo.ImageIndex := IC_JP;
				NodeKo.SelectedIndex := IC_JPCHK;
			end
			else
			begin
				NodeKo.ImageIndex := IC_JM;
				NodeKo.SelectedIndex := IC_JMCHK;
			end;
		end
		else 									// 合計
		begin
			if m_stRecPaste^.prmAddKbn = 0 then
			begin
				NodeKo.ImageIndex := IC_GPCLOSE;
				NodeKo.SelectedIndex := IC_GPOPEN;
			end
			else
			begin
				NodeKo.ImageIndex := IC_GMCLOSE;
				NodeKo.SelectedIndex := IC_GMOPEN;
			end;
		end;

		// 加算体系書込
		if WriteKMKTREE(NodeSelect, NodeKo, NodeSelect) = FALSE then
		begin
			abort;
			exit;
		end;

		NodeSelect.DeleteChildren;

		VKasantaikei.Items.BeginUpdate;

		TaikeiOyaCreate(NodeSelect);				// 加算体系ﾂﾘｰﾋﾞｭｰ作成

		VKasantaikei.Items.EndUpdate;

		// グリッド再表示
		TaikeiSelectDsp(NodeSelect);
	end;

//	m_stRecPaste := nil;							// 初期化
//	VKasantaikei.Selected := m_cNodeRightClk;
//	Mtab1.BorderCaption := m_cNodeRightClk.Text;
	VKasantaikei.FullExpand;

	// -----<019> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<019> Add-Ed-----
end;

//**************************************************************************
//	Proccess  :	ツリービューﾎﾟｯﾌﾟｱｯﾌﾟ削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DeleteClick(Sender: TObject);
var
	NodeOya			: TTreeNode;
	NodeKo			: TTreeNode;
	stWorkRecKo		: ^TreeViewRec;
	stWorkRecOya	: ^TreeViewRec;
	iRet			:	Integer;
//	iRetChk			:	Boolean;            // <CHK>ｺﾒﾝﾄｱｳﾄ
begin
	NodeKo		 := m_cNodeRightClk;
	stWorkRecKo  := NodeKo.Data;
	NodeOya		 := NodeKo.Parent;
	stWorkRecOya := NodeOya.Data;

{	if NodeKo.getFirstChild <> nil then
	begin
		MjsMessageBoxEX(AOwner, // <003>
                        '加算先として登録済みです。'#13#10'削除することはできません。',
                        '削除',
                        mjWarning,
                        mjOk,
                        mjDefOk
                       );
		exit;
	end;
}
// <CHK>↓ｽﾄｱﾄﾞでﾁｪｯｸするのでｺﾒﾝﾄｱｳﾄ
{	if stWorkRecKo.prmSumKbn = 0 then
	begin
		// 発生データの存在チェック
		iRetChk := fnDeleteCheck(stWorkRecKo^.prmCode);
		if iRetChk = FALSE then
		begin
			MjsMessageBoxEX(AOwner, // <003>
                            '仕訳データが入力済みです。'#13#10'削除することはできません。',
                            '削除',
                            mjWarning,
                            mjOk,
                            mjDefOk
                           );
			exit;
		end;
	end;
}
// <007> 「当該ﾏｽﾀにﾃﾞｰﾀが存在している場合、削除すると管理表に不整合が生ずる恐れがあります。
//          削除してもよろしいですか？」
//	iRet := MjsMessageBoxEX(AOwner, // <003>
//                            ''''+stWorkRecKo^.prmName+''''+'を削除します。よろしいですか？',
	iRet := MjsMessageBoxEX(AOwner, // <003>
                            MSG_DELETE,
                            '削除',
                            mjQuestion,
                            mjYesNo,
                            mjDefNo
                           );
	if iRet <> mrYes then
		exit;

	// -----<019> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<019> Add-Ed-----

	if NodeSearch(stWorkRecKo^, stWorkRecOya^) <= 1 then							// ツリー内に一件のみの時は削除
	begin
		// 資金繰科目削除
		if DeleteSKMKMA(stWorkRecKo^.prmCode, stWorkRecKo^.prmSumKbn) = FALSE then
		begin
			abort;
			exit;
		end;
	end
	else																			// 一件以上存在する場合は加算体系のみ削除
	begin
		// 加算体系削除
		if DeleteKMKTREE(NodeOya, NodeKo) = FALSE then
		begin
			abort;
			exit;
		end;
	end;

	// グリッド再表示
	TaikeiSelectDsp(NodeKo);

	// ノード自体を削除
	NodeKo.Delete;

	// -----<019> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<019> Add-Ed-----

end;

//**************************************************************************
//	Proccess  :	ツリービューﾎﾟｯﾌﾟｱｯﾌﾟ体系消去ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.AllDelClick(Sender: TObject);
//var
//	iRet		:	Integer;
//	QuerySKMKMA	:	TMQuery;
//	QueryKMKTREE:	TMQuery;
//	iMaxEntNo	:	Integer;
var
	NodeWork		:	TTreeNode;
	NodeTop			:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecWk		: ^TreeViewRec;
	stWorkRecOya	: ^TreeViewRec;
	QueryRead		:	TMQuery;
	iCount			:	Integer;
begin
	// -----<019> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<019> Add-Ed-----

	NodeTop  := VKasantaikei.Items[0];
	NodeWork := m_cNodeRightClk;
	NodeOya := NodeWork.Parent;
	stWorkRecWk := NodeWork.Data;
	stWorkRecOya := NodeTop.Data;

	// 加算体系削除
	if DeleteKMKTREE(NodeOya, NodeWork) = FALSE then
	begin
		abort;
		exit;
	end;

	QueryRead := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

	try
		with QueryRead do
		begin
			Close;
			SQL.Clear;							// ｸｴﾘの初期化
			// 工事を外部ｺｰﾄﾞ昇順でGET
			SQL.Add('select Count(*) as Kensu from KmkTree');
			SQL.Add('where MasterKbn = 3 AND SumNCode = :SUM AND BasedNCode = :BASE');
// <012>↓
//			SetFld('SUM').AsInteger  := stWorkRecOya^.prmNCode;
//			SetFld('BASE').AsInteger := stWorkRecWk^.prmNCode;
			SetFld('SUM').AsFloat  := stWorkRecOya^.prmNCode;
			SetFld('BASE').AsFloat := stWorkRecWk^.prmNCode;
// <012>↑
			Open;

			iCount := GetFld('Kensu').AsInteger;
		end;
	finally
		QueryRead.Close;
		QueryRead.Free;
	end;

	// 加算体系書込
	if iCount < 1 then
	begin
		if WriteKMKTREE(NodeTop, NodeWork, NodeTop) = FALSE then
		begin
			abort;
			exit;
		end;

		// Nodeの移動
		NodeWork.MoveTo (NodeTop, naAddChild);
	end
	else
		NodeWork.Delete;

	// グリッド再表示
	TaikeiSelectDsp(NodeTop);

{	iRet := MjsMessageBoxEX(AOwner, // <003>
                            '資金繰加算体系を消去します。よろしいですか？',
                            '削除',
                            mjQuestion,
                            mjYesNo,
                            mjDefNo
                           );
	if iRet = mrYes then
	begin
		QuerySKMKMA := TMQuery.Create (Self);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QuerySKMKMA);
		QueryKMKTREE := TMQuery.Create (Self);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryKMKTREE);

		VKasantaikei.Items.Clear; 	{ 既存のノードを削除する }

{		iMaxEntNo := 0;

		MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

		try
			with QuerySKMKMA do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化
				// 資金繰科目科目を外部ｺｰﾄﾞ昇順でGET
				SQL.Add('select * from SKmkMA');
				SQL.Add('where MasterKbn=3 AND RecordKbn=0');
				SQL.Add('order by GCode');

				Open;
			end;

			with QueryKMKTREE do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化
				// 加算体系マスタ該当ﾚｺｰﾄﾞ全削除
				SQL.Add('delete from KmkTree');
				SQL.Add('where MasterKbn=3');

				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryKMKTREE);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					QueryKMKTREE.Close;
//					QueryKMKTREE.Free;
					Exit;
				end;

				gbKmkTreeDelFlag := TRUE;				// メール会計履歴洗い替えﾌﾗｸﾞOn
//				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

				// 加算体系新規に書込み
				while QuerySKMKMA.EOF = FALSE do
				begin
					Close;
					SQL.Clear;							// ｸｴﾘの初期化

					// 挿入ｸｴﾘの作成
					SQL.Add('insert into KmkTree');
					SQL.Add('(MasterKbn, SumCode, EntNo, MasterKbn2, BasedCode, AddKbn)');
					SQL.Add('values (:iMasterKbn, :iSumCode, :iEntNo, 3, :iBasedCode, :iAddKbn)');

					// マスタ区分
					SetFld('iMasterKbn').AsInteger := 3;
					// 加算先外部ｺｰﾄﾞ
					SetFld('iSumCode').AsInteger := 0;
					// 登録NO
					iMaxEntNo := iMaxEntNo + 100;
					SetFld('iEntNo').AsInteger := iMaxEntNo;			// 登録NOは親内部で100番単位
					// 加算元外部ｺｰﾄﾞ
					SetFld('iBasedCode').AsInteger := QuerySKMKMA.GetFld('GCode').AsInteger;
					// 加算区分
					SetFld('iAddKbn').AsInteger := 0;					// とりあえず加算にしておく

					// DB更新
					if (ExecSQL = FALSE) then
					begin
						ErrorMessageDsp(QueryKMKTREE);
						MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
						QueryKMKTREE.Close;
//						QueryKMKTREE.Free;
						Exit;
					end;
		
					MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

					gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ

					QuerySKMKMA.Next;
				end;
			end;
		finally
			QuerySKMKMA.Free;
			QueryKMKTREE.Free;
		end;

		GetData();                  // データ表示
	end
	else
		exit;
}

	// -----<019> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<019> Add-Ed-----
end;

//**************************************************************************
//	Proccess  :	ツリービュー該当科目サーチ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_1f.NodeSearch(stWorkRecSearch : TreeViewRec; stWorkRecOya : TreeViewRec): Integer;
var
	iCount   		: Integer;
	iLoop   		: Integer;
	stWorkRec		: ^TreeViewRec;
begin
	iCount := 0;

	for iLoop := 1 to VKasantaikei.Items.Count do
	begin
		stWorkRec := VKasantaikei.Items [iLoop - 1].Data;
		if stWorkRecSearch.prmCode = stWorkRec.prmCode then
		begin
			iCount := iCount+1;
			if (iCount >= 2) AND
			   (stWorkRecOya.prmCode = stWorkRec.prmCode) AND
			   (stWorkRecOya.prmSumKbn = stWorkRec.prmSumKbn) then
				VKasantaikei.Items [iLoop - 1].Delete;
		end
	end;

	result := iCount;
end;

//**************************************************************************
//	Proccess  :	加算体系削除ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiDelete(NodeOya : TTreeNode; NodeKo : TTreeNode);
var
	stWorkRecKo	:	^TreeViewRec;
	stWorkRecOya:	^TreeViewRec;
	NodeChild	:	TTreeNode;
begin
	stWorkRecKo  := NodeKo.Data;
	stWorkRecOya := NodeOya.Data;
	NodeChild := NodeKo.getFirstChild;

	if NodeSearch(stWorkRecKo^, stWorkRecOya^) <= 1 then	// ツリー内に一件のみの時は削除
	begin
		// 加算体系削除
//		DeleteKMKTREE(NodeOya, NodeKo);

		// 資金繰科目削除
		if DeleteSKMKMA(stWorkRecKo^.prmCode, stWorkRecKo^.prmSumKbn) = FALSE then
		begin
			abort;
			exit;
		end;
	end;

	// 子ノードを削除
	while NodeChild <> nil do
	begin
		// 加算体系削除
		TaikeiDelete(NodeKo, NodeChild);
		NodeChild := NodeKo.GetNextChild(NodeChild);
	end;
end;

//**************************************************************************
//	Proccess  :	指定されたノードに関するﾃﾞｰﾀの読み込み＆表示
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : TTreeNode
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TaikeiSelectDsp(NodeDsp : TTreeNode);
var
	NodeOya		: TTreeNode;
	stWk		: String;
	stWorkRecDsp: ^TreeViewRec;
	stWorkRecOya: ^TreeViewRec;
	QueryTree, QueryOya	: TMQuery;
	iCode		: Integer;
begin

	m_fUpdateRecord := 0;

	stWorkRecDsp := NodeDsp.Data;

	if stWorkRecDsp^.prmSumKbn <> 0 then
	begin
		QueryTree := TMQuery.Create (Self);
		QueryOya := TMQuery.Create (Self);

		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryOya);

		try
			stWk := stWorkRecDsp^.prmName;
			iCode := stWorkRecDsp^.prmCode;
			if iCode = 0 then
				Mtab1.BorderCaption := ' ' + stWk
			else
				Mtab1.BorderCaption := IntToStr(iCode) + ' ' + stWk;

			with QueryTree do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化
				// 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
				SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode from KmkTree');
				SQL.Add('where MasterKbn = 3 AND SumNCode = :iNCode');
				SQL.Add('order by EntNo');
// <012>↓
//				SetFld('iNcode').AsInteger := stWorkRecDsp^.prmNCode;// 検索対象の外部ｺｰﾄﾞ 設定
				SetFld('iNCode').AsFloat := stWorkRecDsp^.prmNCode;// 検索対象の外部ｺｰﾄﾞ 設定
// <012>↑
				Open;								// ｸｴﾘの開始
			end;

			dxMemData1.Close;
			dxMemData2.Close;
			dxMemData1.Open;
//			dxMemData1.First;
			dxMemData2.Open;
//			dxMemData2.First;
			if QueryTree.EOF = FALSE then
			begin
				SetLength(m_aCmnt_Jitu,0);	//	配列をｸﾘｱ
				SetLength(m_aCmnt_Gou,0);	//	配列をｸﾘｱ
			end;
			while QueryTree.EOF = FALSE do
			begin
				with QueryOya do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 合計資金繰科目科目を外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select MasterKbn, RDelKbn, SumKbn, GCode, Renso, LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn, NCode from SKmkMA');
					SQL.Add('where MasterKbn = 3 AND RDelKbn = 0 AND NCode = :iNCode');
					SQL.Add('order by GCode');
// <012>↓
//					SetFld('iNcode').AsInteger := QueryTree.GetFld('BasedNCode').AsInteger;// 検索対象の外部ｺｰﾄﾞ 設定
					SetFld('iNcode').AsFloat := QueryTree.GetFld('BasedNCode').AsFloat;// 検索対象の外部ｺｰﾄﾞ 設定
// <012>↑
					Open;						// ｸｴﾘの開始
					if EOF = FALSE then
					begin
//						dxMemData1.DisableControls;
//						dxMemData2.DisableControls;
//						try
							while EOF = FALSE do
							begin
								if GetFld('SumKbn').AsInteger = 1 then
								begin
									DataDsp(2, QueryOya);
									Next;
								end
								else
								begin
									DataDsp(1, QueryOya);
									Next;
								end;
							end;
//						finally
//							dxMemData1.EnableControls;
//							dxMemData2.EnableControls;
//						end;
					end;
				end;
				QueryTree.Next;
			end;

			if stWorkRecDsp^.prmSumKbn = 9 then						// はぐれマスタ表示
			begin
				with QueryOya do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select MA.MasterKbn, MA.RDelKbn, MA.SumKbn, MA.GCode, MA.Renso, MA.LongName, MA.SimpleName, MA.DcKbn, MA.AnalyzeCode, MA.DecoKbn, MA.NCode ');
					SQL.ADD('FROM SKmkMA MA');
					SQL.ADD('where MA.NCode not in(select TR.BasedNCode from KmkTree TR where TR.masterKbn = 3)');
//                    SQL.ADD('and MA.GCode not in(select TR.SumCode from KmkTree TR where TR.masterKbn = 3)');
					SQL.ADD('and MA.MasterKbn=3 and MA.RDelKbn=0');

					Open;						// ｸｴﾘの開始
					if EOF = FALSE then
					begin
//						dxMemData1.DisableControls;
//						dxMemData2.DisableControls;
//						try
							while EOF = FALSE do
							begin
								if GetFld('SumKbn').AsInteger = 1 then
								begin
									DataDsp(2, QueryOya);
									Next;
								end
								else
								begin
									DataDsp(1, QueryOya);
									Next;
								end;
							end;
//						finally
//							dxMemData1.EnableControls;
//							dxMemData2.EnableControls;
//						end;
					end;
				end;
			end;

			if dxMemData1.RecordCount <> 0 then
				dxMemData1.First;				// Memoの先頭に移動

			if dxMemData2.RecordCount <> 0 then
				dxMemData2.First;				// Memoの先頭に移動
		finally
			QueryTree.Free;
			QueryOya.Free;
		end;
	end
	else
	begin
		NodeOya := NodeDsp.Parent;
		stWorkRecOya := NodeOya.Data;

		stWk := stWorkRecOya^.prmName;
		iCode := stWorkRecOya^.prmCode;
//            VKasantaikei.Selected := NodeOya;
		if iCode = 0 then
			Mtab1.BorderCaption := ' ' + stWk
		else
			Mtab1.BorderCaption := IntToStr(iCode) + ' ' + stWk;

		QueryTree := TMQuery.Create (Self);
		QueryOya := TMQuery.Create (Self);

		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryOya);

		dxMemData1.Close;
		dxMemData2.Close;
		dxMemData1.Open;
//		dxMemData1.First;
		dxMemData2.Open;
//		dxMemData2.First;

		try
			with QueryTree do
			begin
				Close;
				SQL.Clear;							// ｸｴﾘの初期化
				// 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
				SQL.Add('select MasterKbn, SumNCode, EntNo, BasedNCode from KmkTree');
				SQL.Add('where MasterKbn=3 AND SumNCode=:iNCode');
				SQL.Add('order by EntNo');
// <012>↓
//				SetFld('iNcode').AsInteger := stWorkRecOya^.prmNCode;// 検索対象の外部ｺｰﾄﾞ 設定
				SetFld('iNCode').AsFloat := stWorkRecOya^.prmNCode;// 検索対象の外部ｺｰﾄﾞ 設定
// <012>↑
				Open;								// ｸｴﾘの開始
			end;

			if QueryTree.EOF = FALSE then
			begin
				SetLength(m_aCmnt_Jitu,0);	//	配列をｸﾘｱ
				SetLength(m_aCmnt_Gou,0);	//	配列をｸﾘｱ
			end;

			while QueryTree.EOF = FALSE do
			begin
				with QueryOya do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 合計資金繰科目科目を外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select MasterKbn, RDelKbn, SumKbn, GCode, Renso, LongName, SimpleName, DcKbn, AnalyzeCode, DecoKbn, NCode from SKmkMA');
					SQL.Add('where MasterKbn=3 AND RDelKbn=0 AND NCode=:iNCode');
					SQL.Add('order by GCode');
// <012>↓
//					SetFld('iNcode').AsInteger := QueryTree.GetFld('BasedNCode').AsInteger;// 検索対象の外部ｺｰﾄﾞ 設定
					SetFld('iNcode').AsFloat := QueryTree.GetFld('BasedNCode').AsFloat;// 検索対象の外部ｺｰﾄﾞ 設定
// <012>↑
					Open;						// ｸｴﾘの開始
					if EOF = FALSE then
					begin
//						dxMemData1.DisableControls;
//						dxMemData2.DisableControls;
//						try
							while EOF = FALSE do
							begin
								if GetFld('SumKbn').AsInteger = 1 then
								begin
									DataDsp(2, QueryOya);
									Next;
								end
								else
								begin
									DataDsp(1, QueryOya);
									Next;
								end;
							end;
//						finally
//							dxMemData1.EnableControls;
//							dxMemData2.EnableControls;
//						end;
					end;
				end;
				QueryTree.Next;
			end;

			if stWorkRecOya^.prmSumKbn = 9 then						// はぐれマスタ表示
			begin
				with QueryOya do
				begin
					Close;

					SQL.Clear;							// ｸｴﾘの初期化
					// 外部ｺｰﾄﾞ昇順でGET
					SQL.Add('select MA.MasterKbn, MA.RDelKbn, MA.SumKbn, MA.GCode, MA.Renso, MA.LongName, MA.SimpleName, MA.DcKbn, MA.AnalyzeCode, MA.DecoKbn, MA.NCode ');
					SQL.ADD('FROM SKmkMA MA');
					SQL.ADD('where MA.NCode not in(select TR.BasedNCode from KmkTree TR where TR.masterKbn = 3)');
//                    SQL.ADD('and MA.GCode not in(select TR.SumCode from KmkTree TR where TR.masterKbn = 3)');
					SQL.ADD('and MA.MasterKbn=3 and MA.RDelKbn=0');

					Open;						// ｸｴﾘの開始
					if EOF = FALSE then
					begin
//						dxMemData1.DisableControls;
//						dxMemData2.DisableControls;
//						try
							while EOF = FALSE do
							begin
								if GetFld('SumKbn').AsInteger = 1 then
								begin
									DataDsp(2, QueryOya);
									Next;
								end
								else
								begin
									DataDsp(1, QueryOya);
									Next;
								end;
							end;
//						finally
//							dxMemData1.EnableControls;
//							dxMemData2.EnableControls;
//						end;
					end;
				end;
			end;
			if dxMemData1.RecordCount <> 0 then
				dxMemData1.First;				// Memoの先頭に移動

			if dxMemData2.RecordCount <> 0 then
				dxMemData2.First;				// Memoの先頭に移動
		finally
			QueryTree.Free;
			QueryOya.Free;
		end;
	end;

	m_fUpdateRecord := 1;

end;

//**************************************************************************
//	Proccess  :	ﾎﾟｯﾌﾟｱｯﾌﾟからの資金繰削除
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : TTreeNode
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DelSikinguriClick(Sender: TObject);
begin
	BDelete_Click(Sender);
end;

//**************************************************************************
//	Proccess  :	タブチェンジｲﾍﾞﾝﾄ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : TTreeNode
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.MTab1Change(Sender: TObject);
var
//	bEnable	:	Boolean;
	cField	:	TField;
begin
	if  m_fAccessTab = FALSE then
	begin
		m_fAccessTab := TRUE;
		exit;
	end;

	if MTab1.Items.Selected = PAGE_JITUZAI then
		m_AcControl := DSikinguriJ						// ﾌｫｰｶｽ 設定
	else
		m_AcControl := DSikinguriG;						// ﾌｫｰｶｽ 設定

	m_AcControl.SetFocus;

	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		dxMemData1.Cancel;
		cField  := dxMemData1GCode;
		cField.FocusControl;
	end
	else
	begin
		dxMemData2.Cancel;
		cField  := dxMemData2GCode;
		cField.FocusControl;
	end;

{	if MTab1.Items.Selected = PAGE_JITUZAI then
	begin
		if dxMemData1GCode.AsInteger = 0 then
			bEnable := FALSE
		else
			bEnable := TRUE;
	end
	else
	begin
		if dxMemData2GCode.AsInteger = 0 then
			bEnable := FALSE
		else
			bEnable := TRUE;
	end;

	if giReferFlag <> REFER then
	begin
		BDelete.Enabled := bEnable;
//	DelSikinguri.Enabled := bEnable;
		GFBlue.Enabled := bEnable;
		GFGreen.Enabled := bEnable;
		GFOrange.Enabled := bEnable;
		GFRed.Enabled := bEnable;
}
// <009>
    if m_cJNTArea.IsFusen then
    begin
		// 付箋ボタン入力制御
		if MTab1.Items.Selected = PAGE_JITUZAI then
		begin
			if dxMemData1.RecordCount <> 0 then
			begin
                if ( m_FusenColorIdx = -1 ) then
                begin
                    btnFusenCtl.ImageIndex	:=  0;
                    m_FusenColorIdx         :=  0;
                end
                else
                    btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;

				btnFusenCtl.Enabled := TRUE;
			end
			else
			begin
				btnFusenCtl.Enabled := FALSE;
			end;
		end
		else
		begin
			if dxMemData2.RecordCount <> 0 then
			begin
                if ( m_FusenColorIdx = -1 ) then
                begin
                    btnFusenCtl.ImageIndex	:=  0;
                    m_FusenColorIdx         :=  0;
                end
                else
                    btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;

				btnFusenCtl.Enabled := TRUE;
			end
			else
			begin
				btnFusenCtl.Enabled := FALSE;
			end;
		end;
	end;

end;

//**************************************************************************
//	Proccess  :	タブキーダウンｲﾍﾞﾝﾄ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : TTreeNode
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.MTab1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	m_fAccessTab := FALSE;
end;

//**********************************************************************
//	Proccess	:	付箋表示処理
//	Name		:	N.Nabe
//	Date		:	2000/08/23
//	Return		:
//	History		:	9999/99/99	X.Xxxx
//					XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP009002_1f.FusenDsp(iPage : Integer; iCode : Extended; iFlg : Integer);
var
	QueryFusen	:	TMQuery;
begin

	QueryFusen := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryFusen);

	try
		with QueryFusen do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 資金繰科目科目付箋情報をGET
			SQL.Add('select * from MFusenInfo');
			SQL.Add('where MasterKbn=3 AND NCode=:iNCode');
			SetFld('iNcode').AsFloat := iCode;// 検索対象の外部ｺｰﾄﾞ 設定
			Open;						// ｸｴﾘの開始

			if EOF = FALSE then
			begin
				if iPage = 1 then
				begin
					if iFlg = 1 then
						dxMemData1.Edit;
					dxMemData1Fusen.Clear;
					dxMemData1FusenIndex.AsInteger := GetFld('FusenKbn').AsInteger;

                    // ↓↓↓<006>
                    case GetFld('FusenKbn').AsInteger of
                        RED     :   dxMemData1Fusen.Assign(Image_Fusen_Red   .Picture.Bitmap);
                        GREEN   :   dxMemData1Fusen.Assign(Image_Fusen_Green .Picture.Bitmap);
                        BLUE    :   dxMemData1Fusen.Assign(Image_Fusen_Blue  .Picture.Bitmap);
                        ORANGE  :   dxMemData1Fusen.Assign(Image_Fusen_Orange.Picture.Bitmap);
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
					if iFlg = 1 then
						dxMemData2.Edit;
					dxMemData2Fusen.Clear;
					dxMemData2FusenIndex.AsInteger := GetFld('FusenKbn').AsInteger;

                    // ↓↓↓<006>
                    case GetFld('FusenKbn').AsInteger of
                        RED     :   dxMemData2Fusen.Assign(Image_Fusen_Red   .Picture.Bitmap);
                        GREEN   :   dxMemData2Fusen.Assign(Image_Fusen_Green .Picture.Bitmap);
                        BLUE    :   dxMemData2Fusen.Assign(Image_Fusen_Blue  .Picture.Bitmap);
                        ORANGE  :   dxMemData2Fusen.Assign(Image_Fusen_Orange.Picture.Bitmap);
                    end;
                    // ↑↑↑<006>
{
					case GetFld('FusenKbn').AsInteger of
					RED:	dxMemData2Fusen.Assign(GFRed.Bitmap);
					GREEN:	dxMemData2Fusen.Assign(GFGreen.Bitmap);
					BLUE:	dxMemData2Fusen.Assign(GFBlue.Bitmap);
					ORANGE:	dxMemData2Fusen.Assign(GFOrange.Bitmap);
					end;
} // <006>
				end;
			end
			else
			begin
				if iPage = 1 then
				begin
					if iFlg = 1 then
						dxMemData1.Edit;
					dxMemData1Fusen.Clear;
					dxMemData1FusenIndex.AsInteger := NOCOLOR;
				end
				else
				begin
					if iFlg = 1 then
						dxMemData2.Edit;
					dxMemData2Fusen.Clear;
					dxMemData2FusenIndex.AsInteger := NOCOLOR;
				end;
			end;
		end;
	finally
		QueryFusen.Free;
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
procedure TJNTCRP009002_1f.FusenInfoWrite(iColor : Integer; iCode : Extended; bSw: Boolean);
var
	QueryFusen	:	TMQuery;
	sCmnt		:	String;
begin

	QueryFusen := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryFusen);

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	try
		with QueryFusen do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 資金繰科目科目付箋情報をGET
			SQL.Add('select * from MFusenInfo');
			SQL.Add('where MasterKbn=3 AND NCode=:iNCode ');
			SQL.Add('and SubNCode =:iSub');
			// 検索対象の外部ｺｰﾄﾞ 設定
			SetFld('iNCode').AsFloat := iCode;
			// 細目コード
			SetFld('iSub').AsInteger := 0;
			Open;						// ｸｴﾘの開始

			if EOF = FALSE then
			begin
				// 付箋コメント退避
				sCmnt := GetFld('FusenCmnt').AsString;

				SQL.Clear;							// ｸｴﾘの初期化
				// 削除ｸｴﾘの作成
				SQL.Add('Delete MFusenInfo');
				SQL.Add('where MasterKbn=3 AND NCode=:iNCode ');
				SQL.Add('and SubNCode =:iSub');
				// 科目コード
				SetFld('iNCode').AsFloat := iCode;
				// 細目コード
				SetFld('iSub').AsInteger := 0;

				// DB更新
				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(QueryFusen);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					QueryFusen.Close;
//					QueryFusen.Free;
					Exit;
				end;

//				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
			end;

			SQL.Clear;							// ｸｴﾘの初期化
			// 挿入ｸｴﾘの作成
			SQL.Add('insert into MFusenInfo');
			SQL.Add('(MasterKbn, NCode, SubNCode, FusenKbn, FusenCmnt,');
			SQL.Add('UpdTantoNCode) '); // <020>
			SQL.Add('values (:iMasterKbn, :iNCode, :iSubNCode, :iFusenKbn, :sFusenCmnt,');
			SQL.Add(':cUpdTantoNCode) '); // <020>
			// ﾏｽﾀ区分
			SetFld('iMasterKbn').AsInteger := 3;
			// 科目コード
			SetFld('iNCode').AsFloat := iCode;
			// 細目コード
			SetFld('iSubNCode').AsInteger := 0;
			// 付箋区分
			SetFld('iFusenKbn').AsInteger := iColor;
			// 付箋コメント
			if bSw = TRUE then
				SetFld('sFusenCmnt').AsString := sCmnt
			else
				SetFld('sFusenCmnt').AsString := '';
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryFusen);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryFusen.Close;
//				QueryFusen.Free;
				Exit;
			end;

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
		end;
	finally
		QueryFusen.Free;
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
procedure TJNTCRP009002_1f.FusenInfaDelete(iCode : Extended);
var
	QueryFusen  :   TMQuery;
begin

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	MDataModule.BeginTran (dbCorp_Select);

	try
		with QueryFusen do
		begin
            // ---------------------------------
            //  資金繰科目科目付箋情報を取得
            // ---------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo       '
                +   'WHERE  (MasterKbn = 3)         '
                +   '  AND  (NCode     = :iNCode)   '
			    +   '  AND  (SubNCode  = :iSub)     ');

			SetFld('iNCode').AsFloat    :=  iCode;
			SetFld('iSub')  .AsFloat    :=  0;
			Open();

			if ( EOF = FALSE ) then
			begin
				Close();
				SQL.Clear();
				SQL.Add('DELETE FROM MFusenInfo         '
				    +   'WHERE  (MasterKbn = 3)         '
                    +   '  AND  (NCode     = :iNCode)   '
				    +   '  AND  (SubNCode  = :iSub)     ');

				SetFld('iNCode').AsFloat    :=  iCode;
				SetFld('iSub')  .AsFloat    :=  0;

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
//	Proccess  :	グリッドﾎﾟｯﾌﾟｱｯﾌﾟｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.PMSikinguriPopup(Sender: TObject);
var
    QueryFusen  :   TMQuery;

begin

    //<004> Add↓
   	PMSikinguri.Items[0].Enabled    :=  m_cJNTArea.IsFusen;
    PMSikinguri.Items[1].Enabled    :=  m_cJNTArea.IsFusen;
   	PMSikinguri.Items[2].Enabled    :=  m_cJNTArea.IsFusen;
    PMSikinguri.Items[3].Enabled    :=  m_cJNTArea.IsFusen;
   	PMSikinguri.Items[4].Enabled    :=  m_cJNTArea.IsFusen;
    PMSikinguri.Items[5].Enabled    :=  m_cJNTArea.IsFusen;
   	PMSikinguri.Items[6].Enabled    :=  m_cJNTArea.IsFusen;
    //<004> Add↑

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

	try
		with QueryFusen do
		begin
            // -----------------------------------
			//  資金繰科目科目付箋情報を取得
            // -----------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM MFusenInfo       '
			    +   'WHERE  (MasterKbn = 3)         '
                +   '  AND  (NCode     = :iNCode)   ');

			if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
				SetFld('iNcode').AsFloat    :=  dxMemData1NCode.AsFloat
			else
				SetFld('iNcode').AsFloat    :=  dxMemData2NCode.AsFloat;

			Open();

			if ( EOF = FALSE ) then
			begin
				PMSikinguri.Items[0].Visible    :=  TRUE;
				PMSikinguri.Items[1].Visible    :=  TRUE;
				PMSikinguri.Items[2].Visible    :=  TRUE;

				case GetFld('FusenKbn').AsInteger of
					RED:
					begin
						PMSikinguri.Items[3].Visible    :=  FALSE;
						PMSikinguri.Items[4].Visible    :=  TRUE;
						PMSikinguri.Items[5].Visible    :=  TRUE;
						PMSikinguri.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFRed.Bitmap);
					end;
					BLUE:
					begin
						PMSikinguri.Items[3].Visible    :=  TRUE;
						PMSikinguri.Items[4].Visible    :=  FALSE;
						PMSikinguri.Items[5].Visible    :=  TRUE;
						PMSikinguri.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFBlue.Bitmap);
					end;
					GREEN:
					begin
						PMSikinguri.Items[3].Visible    :=  TRUE;
						PMSikinguri.Items[4].Visible    :=  TRUE;
						PMSikinguri.Items[5].Visible    :=  FALSE;
						PMSikinguri.Items[6].Visible    :=  TRUE;
						GFDel.Bitmap.Assign(GFGreen.Bitmap);
					end;
					ORANGE:
					begin
						PMSikinguri.Items[3].Visible    :=  TRUE;
						PMSikinguri.Items[4].Visible    :=  TRUE;
						PMSikinguri.Items[5].Visible    :=  TRUE;
						PMSikinguri.Items[6].Visible    :=  FALSE;
						GFDel.Bitmap.Assign(GFOrange.Bitmap);
					end;
				end;
			end
			else
			begin
				PMSikinguri.Items[0].Visible    :=  FALSE;
				PMSikinguri.Items[1].Visible    :=  FALSE;
				PMSikinguri.Items[2].Visible    :=  FALSE;
				PMSikinguri.Items[3].Visible    :=  TRUE;
				PMSikinguri.Items[4].Visible    :=  TRUE;
				PMSikinguri.Items[5].Visible    :=  TRUE;
				PMSikinguri.Items[6].Visible    :=  TRUE;
			end;
		end;
	finally
		QueryFusen.Free();
	end;

end;

//**************************************************************************
//	Proccess  :	グリッドﾎﾟｯﾌﾟｱｯﾌﾟ付箋貼り付けｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ(各色)
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.GFBlueOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
begin
	iIndex := MTab1.Items.Selected;

	if iIndex = PAGE_JITUZAI then
		iCode := dxMemData1NCode.AsFloat
	else
		iCode := dxMemData2NCode.AsFloat;

//	if PMSikinguri.Items[2].Checked = FALSE then
		FusenInfoWrite(BLUE, iCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(BLUE, iCode);
//		PMSikinguri.Items[2].Checked := FALSE;
//		if iIndex = PAGE_JITUZAI then
//		begin
//			dxMemData1.Edit;
//			dxMemData1Fusen.Clear;
//		end
//		else
//		begin
//			dxMemData2.Edit;
//			dxMemData2Fusen.Clear;
//		end;
//	end;

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord := 0;
	if iIndex = PAGE_JITUZAI then
		dxMemData1.Post
	else
		dxMemData2.Post;
	m_fUpdateRecord := 1;

	if iIndex = PAGE_JITUZAI then
	begin
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end
	else
	begin
		m_aCmnt_Gou[dxMemData2.RecNo-1].Code := 0;
		m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt := '';
	end;

end;

procedure TJNTCRP009002_1f.GFGreenOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
begin
	iIndex := MTab1.Items.Selected;

	if iIndex = PAGE_JITUZAI then
		iCode := dxMemData1NCode.AsFloat
	else
		iCode := dxMemData2NCode.AsFloat;

//	if PMSikinguri.Items[1].Checked = FALSE then
		FusenInfoWrite(GREEN, iCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(GREEN, iCode);
//		PMSikinguri.Items[1].Checked := FALSE;
//		if iIndex = PAGE_JITUZAI then
//		begin
//			dxMemData1.Edit;
//			dxMemData1Fusen.Clear;
//		end
//		else
//		begin
//			dxMemData2.Edit;
//			dxMemData2Fusen.Clear;
//		end;
//	end;

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord := 0;
	if iIndex = PAGE_JITUZAI then
		dxMemData1.Post
	else
		dxMemData2.Post;
	m_fUpdateRecord := 1;

	if iIndex = PAGE_JITUZAI then
	begin
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end
	else
	begin
		m_aCmnt_Gou[dxMemData2.RecNo-1].Code := 0;
		m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt := '';
	end;

end;

procedure TJNTCRP009002_1f.GFOrangeOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
begin
	iIndex := MTab1.Items.Selected;

	if iIndex = PAGE_JITUZAI then
		iCode := dxMemData1NCode.AsFloat
	else
		iCode := dxMemData2NCode.AsFloat;

//	if PMSikinguri.Items[3].Checked = FALSE then
		FusenInfoWrite(ORANGE, iCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(ORANGE, iCode);
//		PMSikinguri.Items[3].Checked := FALSE;
//		if iIndex = PAGE_JITUZAI then
//		begin
//			dxMemData1.Edit;
//			dxMemData1Fusen.Clear;
//		end
//		else
//		begin
//			dxMemData2.Edit;
//			dxMemData2Fusen.Clear;
//		end;
//	end;

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord := 0;
	if iIndex = PAGE_JITUZAI then
		dxMemData1.Post
	else
		dxMemData2.Post;
	m_fUpdateRecord := 1;

	if iIndex = PAGE_JITUZAI then
	begin
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end
	else
	begin
		m_aCmnt_Gou[dxMemData2.RecNo-1].Code := 0;
		m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt := '';
	end;

end;

procedure TJNTCRP009002_1f.GFRedOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
begin
	iIndex := MTab1.Items.Selected;

	if iIndex = PAGE_JITUZAI then
		iCode := dxMemData1NCode.AsFloat
	else
		iCode := dxMemData2NCode.AsFloat;

//	if PMSikinguri.Items[0].Checked = FALSE then
		FusenInfoWrite(RED, iCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(RED, iCode);
//		PMSikinguri.Items[0].Checked := FALSE;
//		if iIndex = PAGE_JITUZAI then
//		begin
//			dxMemData1.Edit;
//			dxMemData1Fusen.Clear;
//		end
//		else
//		begin
//			dxMemData2.Edit;
//			dxMemData2Fusen.Clear;
//		end;
//	end;

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord := 0;
	if iIndex = PAGE_JITUZAI then
		dxMemData1.Post
	else
		dxMemData2.Post;
	m_fUpdateRecord := 1;

	if iIndex = PAGE_JITUZAI then
	begin
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end
	else
	begin
		m_aCmnt_Gou[dxMemData2.RecNo-1].Code := 0;
		m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt := '';
	end;

end;

procedure TJNTCRP009002_1f.GFBlueOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iIndex  :=  MTab1.Items.Selected;

	if ( iIndex = PAGE_JITUZAI ) then
		    iCode   :=  dxMemData1NCode.AsFloat
	else    iCode   :=  dxMemData2NCode.AsFloat;

	FusenInfoWrite(BLUE, iCode, TRUE);

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord :=  0;

	if ( iIndex = PAGE_JITUZAI ) then
		    dxMemData1.Post
	else    dxMemData2.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  BLUE;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( iIndex = PAGE_JITUZAI ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  iCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end
		else
		begin
			m_aCmnt_Gou[dxMemData2.RecNo-1].Code    :=  iCode;
			m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt    :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.GFGreenOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iIndex  :=  MTab1.Items.Selected;

	if ( iIndex = PAGE_JITUZAI ) then
		    iCode   :=  dxMemData1NCode.AsFloat
	else    iCode   :=  dxMemData2NCode.AsFloat;

	FusenInfoWrite(GREEN, iCode, TRUE);

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord :=  0;
	if ( iIndex = PAGE_JITUZAI ) then
		    dxMemData1.Post
	else    dxMemData2.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  GREEN;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=    MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( iIndex = PAGE_JITUZAI ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  iCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end
		else
		begin
			m_aCmnt_Gou[dxMemData2.RecNo-1].Code    :=  iCode;
			m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt    :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.GFOrangeOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iIndex  :=  MTab1.Items.Selected;

	if ( iIndex = PAGE_JITUZAI ) then
		    iCode   :=  dxMemData1NCode.AsFloat
	else    iCode   :=  dxMemData2NCode.AsFloat;

	FusenInfoWrite(ORANGE, iCode, TRUE);

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord :=  0;
	if ( iIndex = PAGE_JITUZAI ) then
		    dxMemData1.Post
	else    dxMemData2.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  ORANGE;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( iIndex = PAGE_JITUZAI ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  iCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end
		else
		begin
			m_aCmnt_Gou[dxMemData2.RecNo-1].Code    :=  iCode;
			m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt    :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.GFRedOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	iIndex  :=  MTab1.Items.Selected;

	if ( iIndex = PAGE_JITUZAI ) then
		    iCode   :=  dxMemData1NCode.AsFloat
	else    iCode   :=  dxMemData2NCode.AsFloat;

	FusenInfoWrite(RED, iCode, TRUE);

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord :=  0;
	if ( iIndex = PAGE_JITUZAI ) then
    		dxMemData1.Post
	else    dxMemData2.Post;
	m_fUpdateRecord :=  1;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  iCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  RED;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( iIndex = PAGE_JITUZAI ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  iCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end
		else
		begin
			m_aCmnt_Gou[dxMemData2.RecNo-1].Code    :=  iCode;
			m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt    :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.GFDelClick(Sender: TObject);
var
	iIndex		:	Integer;
	iCode		:	Extended;
begin

	iIndex := MTab1.Items.Selected;

	if ( iIndex = PAGE_JITUZAI ) then
		    iCode   :=  dxMemData1NCode.AsFloat
	else    iCode   :=  dxMemData2NCode.AsFloat;

	FusenInfaDelete(iCode);

	FusenDsp(iIndex+1, iCode, 1);

	m_fUpdateRecord := 0;
	if iIndex = PAGE_JITUZAI then
		dxMemData1.Post
	else
		dxMemData2.Post;
	m_fUpdateRecord := 1;

	if iIndex = PAGE_JITUZAI then
	begin
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end
	else
	begin
		m_aCmnt_Gou[dxMemData2.RecNo-1].Code := 0;
		m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt := '';
	end;

end;

// 付箋備考修正イベント
procedure TJNTCRP009002_1f.GFReClick(Sender: TObject);
var
	MasDLGParam :   TJNTMasDLGParam;
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
            // --------------------------------
			//  資金繰科目科目付箋情報を取得
            // --------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT FusenKbn FROM MFusenInfo    '
			    +   'WHERE  (MasterKbn = 3)             '
                +   '  AND  (NCode     = :iNCode)       ');

			if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
				SetFld('iNCode').AsFloat    :=  dxMemData1NCode.AsFloat
			else
				SetFld('iNCode').AsFloat    :=  dxMemData2NCode.AsFloat;

			Open();

			iColor  :=  GetFld('FusenKbn').AsInteger;
		end;
	finally
		QueryFusen.Free();
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
		MasDLGParam.m_iNCode	:=  dxMemData1NCode.AsFloat
	else
//		MasDLGParam.m_iNCode    :=  dxMemData2NCode.AsInteger;  // <012>削除
		MasDLGParam.m_iNCode    :=  dxMemData2NCode.AsFloat;    // <012>追加
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  iColor;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  dxMemData1NCode.AsFloat;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end
		else
		begin
			m_aCmnt_Gou[dxMemData2.RecNo-1].Code    :=  dxMemData2NCode.AsFloat;
			m_aCmnt_Gou[dxMemData2.RecNo-1].Cmnt    :=  sCmnt;
		end;
	end;

	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

//**************************************************************************
//	Proccess  :	ツリーﾎﾟｯﾌﾟｱｯﾌﾟ加算区分ﾒﾝﾃｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.GPlusClick(Sender: TObject);
var
// <012>↓
//	iSum			:	Integer;
//	iBased			:	Integer;
	iSum			:	Extended;
	iBased			:	Extended;
// <012>↑
	QueryTree		:	TMQuery;
	NodeSelect		:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
begin
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	NodeSelect := VKasantaikei.Selected;
	stWorkRecSelect := NodeSelect.Data;
	if stWorkRecSelect^.prmSumKbn = 9 then
	begin
		NodeOya := NodeSelect;
		stWorkRecOya := NodeOya.Data;
	end
	else
	begin
		NodeOya := NodeSelect.Parent;
		stWorkRecOya := NodeOya.Data;
	end;
// <012>↓
{	if MTab1.Items.Selected = PAGE_JITUZAI then
		iBased := dxMemData1NCode.AsInteger
	else
		iBased := dxMemData2NCode.AsInteger;
}
	if MTab1.Items.Selected = PAGE_JITUZAI then
		iBased := dxMemData1NCode.AsFloat
	else
		iBased := dxMemData2NCode.AsFloat;
// <012>↑
	if (stWorkRecSelect^.prmSumKbn = 1) or (stWorkRecSelect^.prmSumKbn = 9) then
		iSum := stWorkRecSelect^.prmNCode
	else
		iSum := stWorkRecOya^.prmNCode;

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	try
		with QueryTree do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 科目体系を更新
			SQL.Add('update KmkTree');
			SQL.Add('set AddKbn =:iAddKbn');
			SQL.Add(',UpdTantoNCode =:cUpdTantoNCode'); // <020>
			SQL.Add('where MasterKbn = 3 AND SumNCode =:iSumCode AND BasedNCode =:iBasedCode');
			SetFld('iAddKbn').AsInteger    := 0;				// 加算区分を0：加算に変更
// <012>↓
//			SetFld('iSumCode').AsInteger   := iSum;
//			SetFld('iBasedCode').AsInteger := iBased;
			SetFld('iSumCode').AsFloat   := iSum;
			SetFld('iBasedCode').AsFloat := iBased;
// <012>↑
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryTree);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryTree.Close;
//				QueryTree.Free;
				Exit;
			end;

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

			gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
		end;
	finally
		QueryTree.Free;
	end;

	if stWorkRecSelect^.prmSumKbn = 0 then
		NodeSelect := NodeOya.getFirstChild
	else
		NodeSelect := NodeSelect.getFirstChild;

	// 変更されたノードを検索
	while NodeSelect <> nil do
	begin
		stWorkRecSelect := NodeSelect.Data;
//        showmessage(IntToStr(stWorkRecSelect^.prmCode));
		if stWorkRecSelect^.prmNCode = iBased then
		begin
			if stWorkRecSelect^.prmSumKbn = 1 then		// ノードの色を変える
			begin
				NodeSelect.ImageIndex := IC_GPCLOSE;
				NodeSelect.SelectedIndex := IC_GPOPEN;
				stWorkRecSelect^.prmAddKbn := 0;
			end
			else
			begin
				NodeSelect.ImageIndex := IC_JP;
				NodeSelect.SelectedIndex := IC_JPCHK;
				stWorkRecSelect^.prmAddKbn := 0;
			end;
			break;
		end;

	   	NodeSelect := NodeOya.GetNextChild(NodeSelect);
	end;

end;

procedure TJNTCRP009002_1f.GMinusClick(Sender: TObject);
var
// <012>↓
//	iSum			:	Integer;
//	iBased			:	Integer;
	iSum			:	Extended;
	iBased			:	Extended;
// <012>↑
	QueryTree		:	TMQuery;
	NodeSelect		:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
begin
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	NodeSelect := VKasantaikei.Selected;
	stWorkRecSelect := NodeSelect.Data;
	if stWorkRecSelect^.prmSumKbn = 9 then
	begin
		NodeOya := NodeSelect;
		stWorkRecOya := NodeOya.Data;
	end
	else
	begin
		NodeOya := NodeSelect.Parent;
		stWorkRecOya := NodeOya.Data;
	end;
// <012>↓
{	if MTab1.Items.Selected = PAGE_JITUZAI then
		iBased := dxMemData1NCode.AsInteger
	else
		iBased := dxMemData2NCode.AsInteger;
}
	if MTab1.Items.Selected = PAGE_JITUZAI then
		iBased := dxMemData1NCode.AsFloat
	else
		iBased := dxMemData2NCode.AsFloat;
// <012>↑
	if (stWorkRecSelect^.prmSumKbn = 1) or (stWorkRecSelect^.prmSumKbn = 9) then
		iSum := stWorkRecSelect^.prmNCode
	else
		iSum := stWorkRecOya^.prmNCode;

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	try
		with QueryTree do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 科目体系を更新
			SQL.Add('update KmkTree');
			SQL.Add('set AddKbn =:iAddKbn');
			SQL.Add(',UpdTantoNCode =:cUpdTantoNCode'); // <020>
			SQL.Add('where MasterKbn = 3 AND SumNCode =:iSumCode AND BasedNCode =:iBasedCode');
			SetFld('iAddKbn').AsInteger    := 1;				// 加算区分を0：加算に変更
// <012>↓
//			SetFld('iSumCode').AsInteger   := iSum;
//			SetFld('iBasedCode').AsInteger := iBased;
			SetFld('iSumCode').AsFloat   := iSum;
			SetFld('iBasedCode').AsFloat := iBased;
// <012>↑
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryTree);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryTree.Close;
//				QueryTree.Free;
				Exit;
			end;

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

			gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
		end;
	finally
		QueryTree.Free;
	end;

	if stWorkRecSelect^.prmSumKbn = 0 then
		NodeSelect := NodeOya.getFirstChild
	else
		NodeSelect := NodeSelect.getFirstChild;

	// 変更されたノードを検索
	while NodeSelect <> nil do
	begin
		stWorkRecSelect := NodeSelect.Data;
		if stWorkRecSelect^.prmNCode = iBased then
		begin
			if stWorkRecSelect^.prmSumKbn = 1 then		// ノードの色を変える
			begin
				NodeSelect.ImageIndex := IC_GMCLOSE;
				NodeSelect.SelectedIndex := IC_GMOPEN;
				stWorkRecSelect^.prmAddKbn := 1;
			end
			else
			begin
				NodeSelect.ImageIndex := IC_JM;
				NodeSelect.SelectedIndex := IC_JMCHK;
				stWorkRecSelect^.prmAddKbn := 1;
			end;
			break;
		end;

	   	NodeSelect := NodeOya.GetNextChild(NodeSelect);
	end;

end;


//**************************************************************************
//	Proccess  :	ツリーﾎﾟｯﾌﾟｱｯﾌﾟ付箋貼り付けｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ(各色)
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TFRedOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
begin
	NodeSelect := m_cNodeRightClk;
	stWorkRec := NodeSelect.Data;

	iIndex := stWorkRec^.prmSumKbn;
	iIndex := iIndex + 1;

//	if PMKasantaikei.Items[9].Checked = FALSE then
		FusenInfoWrite(RED, stWorkRec^.prmNCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(stWorkRec^.prmCode);
//		PMKasantaikei.Items[9].Checked := FALSE;
//	end;

	if stWorkRec^.prmSumKbn = 0 then
	begin
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord := 0;
	//	if MTab1.Items.Selected = PAGE_JITUZAI then
		dxMemData1.Post;
		m_fUpdateRecord := 1;

		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end;

	// グリッド再表示
//	TaikeiSelectDsp(NodeSelect);
end;

procedure TJNTCRP009002_1f.TFGreenOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
begin
	NodeSelect := m_cNodeRightClk;
	stWorkRec := NodeSelect.Data;

	iIndex := stWorkRec^.prmSumKbn;
	iIndex := iIndex + 1;

//	if PMKasantaikei.Items[10].Checked = FALSE then
		FusenInfoWrite(GREEN, stWorkRec^.prmNCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(stWorkRec^.prmCode);
//		PMKasantaikei.Items[10].Checked := FALSE;
//	end;

	if stWorkRec^.prmSumKbn = 0 then
	begin
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord := 0;
	//	if MTab1.Items.Selected = PAGE_JITUZAI then
		dxMemData1.Post;
		m_fUpdateRecord := 1;

		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end;

	// グリッド再表示
//	TaikeiSelectDsp(NodeSelect);
end;

procedure TJNTCRP009002_1f.TFBlueOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
begin
	NodeSelect := m_cNodeRightClk;
	stWorkRec := NodeSelect.Data;

	iIndex := stWorkRec^.prmSumKbn;
	iIndex := iIndex + 1;

//	if PMKasantaikei.Items[11].Checked = FALSE then
		FusenInfoWrite(BLUE, stWorkRec^.prmNCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(stWorkRec^.prmCode);
//		PMKasantaikei.Items[11].Checked := FALSE;
//	end;

	if stWorkRec^.prmSumKbn = 0 then
	begin
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord := 0;
	//	if MTab1.Items.Selected = PAGE_JITUZAI then
		dxMemData1.Post;
		m_fUpdateRecord := 1;

		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end;

	// グリッド再表示
//	TaikeiSelectDsp(NodeSelect);

end;

procedure TJNTCRP009002_1f.TFOrangeOffClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
begin
	NodeSelect := m_cNodeRightClk;
	stWorkRec := NodeSelect.Data;

	iIndex := stWorkRec^.prmSumKbn;
	iIndex := iIndex + 1;

//	if PMKasantaikei.Items[12].Checked = FALSE then
		FusenInfoWrite(ORANGE, stWorkRec^.prmNCode, FALSE);
//	else
//	begin
//		FusenInfaDelete(stWorkRec^.prmCode);
//		PMKasantaikei.Items[12].Checked := FALSE;
//	end;

	if stWorkRec^.prmSumKbn = 0 then
	begin
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);
	
		m_fUpdateRecord := 0;
	//	if MTab1.Items.Selected = PAGE_JITUZAI then
		dxMemData1.Post;
		m_fUpdateRecord := 1;
	
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end;

	// グリッド再表示
//	TaikeiSelectDsp(NodeSelect);
end;

procedure TJNTCRP009002_1f.TFRedOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	NodeSelect  :=  m_cNodeRightClk;
	stWorkRec   :=  NodeSelect.Data;

	iIndex      :=  stWorkRec^.prmSumKbn;
	iIndex      :=  iIndex + 1;

	FusenInfoWrite(RED, stWorkRec^.prmNCode, TRUE);

	if ( stWorkRec^.prmSumKbn = 0 ) then
	begin
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);
		m_fUpdateRecord :=  0;
		dxMemData1.Post;
		m_fUpdateRecord :=  1;
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  stWorkRec^.prmNCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  RED;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( stWorkRec^.prmSumKbn = 0 ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  stWorkRec^.prmNCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.TFGreenOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	NodeSelect  :=  m_cNodeRightClk;
	stWorkRec   :=  NodeSelect.Data;

	iIndex      :=  stWorkRec^.prmSumKbn;
	iIndex      :=  iIndex + 1;

	FusenInfoWrite(GREEN, stWorkRec^.prmNCode, TRUE);

	if ( stWorkRec^.prmSumKbn = 0 ) then
	begin
		// ｸﾞﾘｯﾄﾞ再表示
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord :=  0;
		dxMemData1.Post;
		m_fUpdateRecord :=  1;
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  stWorkRec^.prmNCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  GREEN;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( stWorkRec^.prmSumKbn = 0 ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  stWorkRec^.prmNCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.TFBlueOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	NodeSelect  :=  m_cNodeRightClk;
	stWorkRec   :=  NodeSelect.Data;

	iIndex      :=  stWorkRec^.prmSumKbn;
	iIndex      :=  iIndex + 1;

	FusenInfoWrite(BLUE, stWorkRec^.prmNCode, TRUE);

	if ( stWorkRec^.prmSumKbn = 0 ) then
	begin
		// ｸﾞﾘｯﾄﾞ再表示
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord :=  0;
		dxMemData1.Post;
		m_fUpdateRecord :=  1;
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  stWorkRec^.prmNCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  BLUE;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( stWorkRec^.prmSumKbn = 0 ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  stWorkRec^.prmNCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.TFOrangeOnClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	sCmnt		:	String;
begin

	NodeSelect  :=  m_cNodeRightClk;
	stWorkRec   :=  NodeSelect.Data;

	iIndex      :=  stWorkRec^.prmSumKbn;
	iIndex      :=  iIndex + 1;

	FusenInfoWrite(ORANGE, stWorkRec^.prmNCode, TRUE);

	if ( stWorkRec^.prmSumKbn = 0 ) then
	begin
		// ｸﾞﾘｯﾄﾞ再表示
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);

		m_fUpdateRecord :=  0;
		dxMemData1.Post;
		m_fUpdateRecord :=  1;
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002>
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn	:=  3;
	MasDLGParam.m_iNCode		:=  stWorkRec^.prmNCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  ORANGE;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( stWorkRec^.prmSumKbn = 0 ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  stWorkRec^.prmNCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

procedure TJNTCRP009002_1f.TFDelClick(Sender: TObject);
var
	iIndex		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
begin
	NodeSelect := m_cNodeRightClk;
	stWorkRec := NodeSelect.Data;

	iIndex := stWorkRec^.prmSumKbn;
	iIndex := iIndex + 1;

	FusenInfaDelete(stWorkRec^.prmNCode);

	if stWorkRec^.prmSumKbn = 0 then
	begin
		// グリッド再表示
		FusenDsp(iIndex, stWorkRec^.prmNCode, 1);
	
		m_fUpdateRecord := 0;
	//	if MTab1.Items.Selected = PAGE_JITUZAI then
		dxMemData1.Post;
		m_fUpdateRecord := 1;

		m_aCmnt_Jitu[dxMemData1.RecNo-1].Code := 0;
		m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt := '';
	end;

//	TaikeiSelectDsp(NodeSelect);
end;

//**************************************************************************
//	Proccess  :	ツリーﾎﾟｯﾌﾟｱｯﾌﾟ加算区分ﾒﾝﾃｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.TPlusClick(Sender: TObject);
var
// <012>↓
//	iSum			:	Integer;
//	iBased			:	Integer;
	iSum			:	Extended;
	iBased			:	Extended;
// <012>↑
	QueryTree		:	TMQuery;
	NodeSelect		:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
begin
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	NodeSelect := m_cNodeRightClk;
	stWorkRecSelect := NodeSelect.Data;

	NodeOya := NodeSelect.Parent;
	stWorkRecOya := NodeOya.Data;

	iSum := stWorkRecOya^.prmNCode;
	iBased := stWorkRecSelect^.prmNCode;

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	SessionPractice(C_ST_PROCESS);				// <019>

	try
		with QueryTree do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 科目体系を更新
			SQL.Add('update KmkTree');
			SQL.Add('set AddKbn =:iAddKbn');
			SQL.Add(',UpdTantoNCode =:cUpdTantoNCode'); // <020>
			SQL.Add('where MasterKbn = 3 AND SumNCode =:iSumCode AND BasedNCode =:iBasedCode');
			SetFld('iAddKbn').AsInteger    := 0;				// 加算区分を0：加算に変更
// <012>↓
//			SetFld('iSumCode').AsInteger   := iSum;
//			SetFld('iBasedCode').AsInteger := iBased;
			SetFld('iSumCode').AsFloat   := iSum;
			SetFld('iBasedCode').AsFloat := iBased;
// <012>↑
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryTree);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryTree.Close;
//				QueryTree.Free;
				Exit;
			end;

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
			
			gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
		end;
	finally
		SessionPractice(C_ED_PROCESS);			// <019>
		QueryTree.Free;
	end;

	if stWorkRecSelect^.prmSumKbn = 1 then		// ノードの色を変える
	begin
		NodeSelect.ImageIndex := IC_GPCLOSE;
		NodeSelect.SelectedIndex := IC_GPOPEN;
		stWorkRecSelect^.prmAddKbn := 0;
	end
	else
	begin
		NodeSelect.ImageIndex := IC_JP;
		NodeSelect.SelectedIndex := IC_JPCHK;
		stWorkRecSelect^.prmAddKbn := 0;
	end;
end;

procedure TJNTCRP009002_1f.TMinusClick(Sender: TObject);
var
// <012>↓
//	iSum			:	Integer;
//	iBased			:	Integer;
	iSum			:	Extended;
	iBased			:	Extended;
// <012>↑
	QueryTree		:	TMQuery;
	NodeSelect		:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
begin
	QueryTree := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	NodeSelect := m_cNodeRightClk;
	stWorkRecSelect := NodeSelect.Data;

	NodeOya := NodeSelect.Parent;
	stWorkRecOya := NodeOya.Data;

	iSum := stWorkRecOya^.prmNCode;
	iBased := stWorkRecSelect^.prmNCode;

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	SessionPractice(C_ST_PROCESS);				// <019>

	try
		with QueryTree do
		begin
			Close;

			SQL.Clear;							// ｸｴﾘの初期化
			// 科目体系を更新
			SQL.Add('update KmkTree');
			SQL.Add('set AddKbn =:iAddKbn');
			SQL.Add(',UpdTantoNCode =:cUpdTantoNCode'); // <020>
			SQL.Add('where MasterKbn = 3 AND SumNCode =:iSumCode AND BasedNCode =:iBasedCode');
			SetFld('iAddKbn').AsInteger    := 1;				// 加算区分を0：加算に変更
// <012>↓
//			SetFld('iSumCode').AsInteger   := iSum;
//			SetFld('iBasedCode').AsInteger := iBased;
			SetFld('iSumCode').AsFloat   := iSum;
			SetFld('iBasedCode').AsFloat := iBased;
// <012>↑
            // 更新担当者内部ｺｰﾄﾞ<020>
            SetFld('cUpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
			// DB更新
			if (ExecSQL = FALSE) then
			begin
				ErrorMessageDsp(QueryTree);
				MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
				QueryTree.Close;
//				QueryTree.Free;
				Exit;
			end;

			MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)

			gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ
		end;
	finally
		SessionPractice(C_ED_PROCESS);			// <019>
		QueryTree.Free;
	end;

	if stWorkRecSelect^.prmSumKbn = 1 then		// ノードの色を変える
	begin
		NodeSelect.ImageIndex := IC_GMCLOSE;
		NodeSelect.SelectedIndex := IC_GMOPEN;
		stWorkRecSelect^.prmAddKbn := 1;
	end
	else
	begin
		NodeSelect.ImageIndex := IC_JM;
		NodeSelect.SelectedIndex := IC_JMCHK;
		stWorkRecSelect^.prmAddKbn := 1;
	end;
end;

// 付箋備考修正イベント
procedure TJNTCRP009002_1f.TFReClick(Sender: TObject);
var
	MasDLGParam	:	TJNTMasDLGParam;
	Fusen		:	TJNTMASFUSENBIKODLGIF;
	QueryFusen	:	TMQuery;
	iColor		:	Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	sCmnt		:	String;
begin

	NodeSelect  :=  m_cNodeRightClk;
	stWorkRec   :=  NodeSelect.Data;

	QueryFusen  :=  TMQuery.Create ( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

	try
		with QueryFusen do
		begin
            // -----------------------------------
			//  資金繰科目科目付箋情報を取得
            // -----------------------------------
			Close();
			SQL.Clear();
			SQL.Add('SELECT FusenKbn FROM MFusenInfo    '
			    +   'WHERE  (MasterKbn = 3)             '
                +   '  AND  (NCode     = :iNCode)       ');

			SetFld('iNCode').AsFloat    :=  stWorkRec^.prmNCode;
			Open();

			iColor  :=  GetFld('FusenKbn').AsInteger;
		end;
	finally
		QueryFusen.Free();
	end;

	// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	Fusen   :=  TJNTMASFUSENBIKODLGIF.Create();
	Fusen.Init( TForm(m_pMyAppRecord.m_pOwnerForm^), Pointer ( m_pMyAppRecord ) );  // <002> 
	MasDLGParam					:=  TJNTMasDLGParam.CreateParam();
	MasDLGParam.m_iMasterkbn    :=  3;
	MasDLGParam.m_iNCode		:=  stWorkRec^.prmNCode;
	MasDLGParam.m_iSubNCode		:=  0;
	MasDLGParam.m_iFusenKbn		:=  iColor;
	MasDLGParam.m_pApRec		:=  pointer( m_pMyAppRecord );
	Fusen.DoDlg( MasDLGParam );
	sCmnt   :=  MasDLGParam.m_sCmnt;

	if ( MasDLGParam.m_MasDLGResult <> mrCancel ) then
	begin
		if ( stWorkRec^.prmSumKbn = 0 ) then
		begin
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Code   :=  stWorkRec^.prmNCode;
			m_aCmnt_Jitu[dxMemData1.RecNo-1].Cmnt   :=  sCmnt;
		end;
	end;
	MasDLGParam.Free();
	Fusen.Term();
	Fusen.Free();

end;

//**************************************************************************
//	Proccess  :	実在資金繰上矢印キーｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//	if (Key = VK_UP) AND (dxMemData1NCode.AsInteger <> 0) then
	if giReferFlag = REFER then
		exit;

//	if (Key = VK_UP) then
//	begin
//		BDelete.Enabled := TRUE;
//		DelSikinguri.Enabled := TRUE;
//		GFBlue.Enabled := TRUE;
//		GFGreen.Enabled := TRUE;
//		GFOrange.Enabled := TRUE;
//		GFRed.Enabled := TRUE;
//	end;

	if (Key = VK_INSERT) then
		abort;
end;

//**************************************************************************
//	Proccess  :	合計資金繰上矢印キーｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//	if (Key = VK_UP) AND (dxMemData2NCode.AsInteger <> 0) then
	if giReferFlag = REFER then
		exit;

//	if (Key = VK_UP) then
//	begin
//		BDelete.Enabled := TRUE;
//		DelSikinguri.Enabled := TRUE;
//		GFBlue.Enabled := TRUE;
//		GFGreen.Enabled := TRUE;
//		GFOrange.Enabled := TRUE;
//		GFRed.Enabled := TRUE;
//	end;
end;

//**************************************************************************
//	Proccess  :	実在資金繰キー押下ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	//  ↑カーソル or PageUp
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then
	begin
		if ( DSikinguriJ.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	//	TAB AND SHIFT  ←カーソル and 編集中ではない
	if ((Key = VK_TAB) and (Shift = [ssShift])) or
				((Key = VK_LEFT) and (DSikinguriJ.State <> tsEditing))then
	begin
		if ( DSikinguriJ.FocusedColumn = 1 ) and ( DSikinguriJ.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	if (Key = VK_INSERT) then
		abort;
end;

//**************************************************************************
//	Proccess  :	合計資金繰キー押下ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	//  ↑カーソル or PageUp
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then
	begin
		if ( DSikinguriG.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	//	TAB AND SHIFT  ←カーソル and 編集中ではない
	if ((Key = VK_TAB) and (Shift = [ssShift])) or
				((Key = VK_LEFT) and (DSikinguriG.State <> tsEditing))then
	begin
		if ( DSikinguriG.FocusedColumn = 1 ) and ( DSikinguriG.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	if (Key = VK_INSERT) then
		abort;
end;

//**************************************************************************
//	Proccess  :	実在資金繰ﾏｳｽｸﾘｯｸｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	iFocus	:	Integer;
	cField	:	TField;
begin
	iFocus := DSikinguriJ.FocusedColumn;					// ﾌｫｰｶｽ位置

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
		COL_DC_KBN_CD:
		begin
		end;
		COL_DC_KBN_NM:
		begin
			cField  := dxMemData1DcKbnCode;
			cField.FocusControl;
			abort;
			exit;
		end;
		COL_ANA_CD:
		begin
		end;
		COL_ANA_NM:
		begin
			cField  := dxMemData1AnalyzeCode;
			cField.FocusControl;
			abort;
			exit;
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
	end;
end;

//**************************************************************************
//	Proccess  :	合計資金繰ﾏｳｽｸﾘｯｸｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	iFocus	:	Integer;
	cField	:	TField;
begin
	iFocus := DSikinguriG.FocusedColumn;					// ﾌｫｰｶｽ位置

	case iFocus of
		COL_FUSEN:
		begin
			cField  := dxMemData2GCode;
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
		COL_DC_KBN_CD:
		begin
		end;
		COL_DC_KBN_NM:
		begin
			cField  := dxMemData2DcKbnCode;
			cField.FocusControl;
			abort;
			exit;
		end;
		COL_ANA_CD:
		begin
		end;
		COL_ANA_NM:
		begin
			cField  := dxMemData2AnalyzeCode;
			cField.FocusControl;
			abort;
			exit;
		end;
		COL_DECO_KBN_CD:
		begin
		end;
		COL_DECO_KBN_NM:
		begin
			cField  := dxMemData2DecoKbnCode;
			cField.FocusControl;
			abort;
			exit;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	実在資金繰EXITｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJExit(Sender: TObject);
begin
	if m_fEnd = 0 then
	begin
// <015> MOD start
(*		if dxMemData1.State in [dsEdit] then	// ﾃﾞｰﾀ編集中？
			dxMemData1.Post
		else
			dxMemData1.Cancel;
*)
		if dxMemData1.State in [dsEdit] then	// ﾃﾞｰﾀ編集中？
        begin
        	if giReferFlag = REFER then			// 表示のみ権限なのにEdit状態になることがある
            begin
				dxMemData1.Cancel;
            end
            else
            begin
				dxMemData1.Post;                // 更新権限がある場合だけPost
            end;
        end
		else
        begin
			dxMemData1.Cancel;
        end;
// <015> MOD end
	end;
end;

//**************************************************************************
//	Proccess  :	合計資金繰EXITｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGExit(Sender: TObject);
begin
	if m_fEnd = 0 then
	begin
// <015> MOD start
(*		if dxMemData2.State in [dsEdit] then	// ﾃﾞｰﾀ編集中？
			dxMemData2.Post
		else
			dxMemData2.Cancel;
*)
		if dxMemData2.State in [dsEdit] then	// ﾃﾞｰﾀ編集中？
        begin
           	if giReferFlag = REFER then			// 表示のみ権限なのにEdit状態になることがある
            begin
            	dxMemData2.Cancel;
            end
            else
            begin
				dxMemData2.Post;            	// 更新権限がある場合だけPost
            end;
        end
		else
        begin
			dxMemData2.Cancel;
        end;
// <015> MOD end
	end;
end;

//**************************************************************************
//	Proccess  :	実在資金繰行移動ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriJChangeNodeEx(Sender: TObject);
var
	twAcCtrl   :	TWinControl;
begin
	if giReferFlag = REFER then
		exit;

	if m_fUpdateRecord = 0 then
	begin
//		BDelete.Enabled := TRUE;
		exit;
	end;

	twAcCtrl := Screen.ActiveControl;

	if (m_AcControl = VKasantaikei) or (twAcCtrl = VKasantaikei) then
	begin
//		BDelete.Enabled := TRUE;
		exit;
	end;

	if (DSikinguriJ.DataSource.DataSet.FieldByName('GCode').IsNull) then	//	実在GridのｺｰﾄﾞがNullの時
	begin
		BDelete.Enabled         :=  FALSE;
		GFBlue.Enabled          :=  FALSE;
		GFGreen.Enabled         :=  FALSE;
		GFOrange.Enabled        :=  FALSE;
		GFRed.Enabled           :=  FALSE;
        btnFusenCtl.ImageIndex	:=  4;
		btnFusenCtl.Enabled     :=  FALSE;

		DSikinguriJ.FocusedColumn := 1;	//	ﾌｫｰｶｽのｶﾗﾑ位置を指定
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
            btnFusenCtl.ImageIndex	:=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
// <014> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
// <014> MOD end
			GFBlue.Enabled          :=  TRUE;
			GFGreen.Enabled         :=  TRUE;
			GFOrange.Enabled        :=  TRUE;
			GFRed.Enabled           :=  TRUE;
//<004>            btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>			btnFusenCtl.Enabled     :=  TRUE;
  			if ( m_cJNTArea.IsFusen ) then            // <004>
            begin
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
  	    		btnFusenCtl.Enabled     :=  TRUE;

            end else
            begin
                btnFusenCtl.ImageIndex	:=  4;
       			btnFusenCtl.Enabled     :=  FALSE;

            end;

		end;
	end;

end;

//**************************************************************************
//	Proccess  :	合計資金繰行移動ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//	Name	  :	N.Nabe
//	Date	  :	2000/ 08 / 09
//	Parameter : Sender
//	Retrun	  :
//	History	　:	2000 / 99 / 99	X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP009002_1f.DSikinguriGChangeNodeEx(Sender: TObject);
var
	twAcCtrl   :	TWinControl;
begin
	if giReferFlag = REFER then
		exit;

	if m_fUpdateRecord = 0 then
	begin
//		BDelete.Enabled := TRUE;
		exit;
	end;

	twAcCtrl := Screen.ActiveControl;

	if (m_AcControl = VKasantaikei) or (twAcCtrl = VKasantaikei) then
	begin
//		BDelete.Enabled := TRUE;
		exit;
	end;

	if (DSikinguriG.DataSource.DataSet.FieldByName('GCode').IsNull) then	//	実在GridのｺｰﾄﾞがNullの時
	begin
		BDelete.Enabled         :=  FALSE;
		GFBlue.Enabled          :=  FALSE;
		GFGreen.Enabled         :=  FALSE;
		GFOrange.Enabled        :=  FALSE;
		GFRed.Enabled           :=  FALSE;
        btnFusenCtl.ImageIndex	:=  4;
		btnFusenCtl.Enabled     :=  FALSE;

		DSikinguriG.FocusedColumn := 1;	//	ﾌｫｰｶｽのｶﾗﾑ位置を指定
	end
	else
	begin
		if dxMemData2.State in [dsInsert] then	// ﾃﾞｰﾀ挿入中？
		begin
			BDelete.Enabled         :=  FALSE;
			GFBlue.Enabled          :=  FALSE;
			GFGreen.Enabled         :=  FALSE;
			GFOrange.Enabled        :=  FALSE;
			GFRed.Enabled           :=  FALSE;
            btnFusenCtl.ImageIndex	:=  4;
			btnFusenCtl.Enabled     :=  FALSE;
		end
		else
		begin
//<004>			BDelete.Enabled         :=  TRUE;
//<014> MOD start
//			BDelete.Enabled         :=  m_cJNTArea.IsDelete;
			BDelete.Enabled         :=  IsDeleteEx();
//<014> MOD enc
			GFBlue.Enabled          :=  TRUE;
			GFGreen.Enabled         :=  TRUE;
			GFOrange.Enabled        :=  TRUE;
			GFRed.Enabled           :=  TRUE;
//<004>         btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
//<004>			btnFusenCtl.Enabled     :=  TRUE;
  			if ( m_cJNTArea.IsFusen) then            // <004>
            begin
                btnFusenCtl.ImageIndex	:=  m_FusenColorIdx;
  	    		btnFusenCtl.Enabled     :=  TRUE;
            end else
            begin
                btnFusenCtl.ImageIndex	:=  4;
       			btnFusenCtl.Enabled     :=  FALSE;
            end;

		end;

	end;

end;

//**********************************************************************
//*		Proccess	:	登録ＮＯ再付番
//*		Name		:	H.Endo
//*		Date		:	2000/11/27
//*		Parameter	:	ParentCode		:	再付番する親の外部ｺｰﾄﾞ
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//*                     2006/02/14  K.Katou
//*                                 引数の型変更Integer→Extended
//**********************************************************************
//procedure TJNTCRP009002_1f.AgainEntNoSet(ParentCode: Integer);    // <012>削除
procedure TJNTCRP009002_1f.AgainEntNoSet(ParentCode: Extended);     // <012>追加
var
	DmqTreeSelect	:	TMQuery;
	DmqTreeUpdate	:	TMQuery;
	iCount			:	Integer;
begin
	iCount	:=	1;

	DmqTreeSelect := TMQuery.Create( Self );					    //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqTreeSelect );	//	DBとMQueryの接続

	DmqTreeUpdate := TMQuery.Create( Self );					    //	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqTreeUpdate );	//	DBとMQueryの接続

	MDataModule.BeginTran (dbCorp_Select);		//	ﾄﾗﾝｻﾞｸｼｮﾝの開始

	with DmqTreeSelect do
	begin
		Close ();
		SQL.Clear;
		SQL.ADD ('SELECT MasterKbn, SumNCode, BasedNCode FROM KmkTree ');
		SQL.ADD ('WHERE MasterKbn = :MasterKbn AND SumNCode = :SakiGCode ');
		SQL.ADD ('ORDER BY EntNo');
		ParamByName('MasterKbn').AsInteger	:=	3;
// <012>↓
//		ParamByName('SakiGCode').AsInteger	:=	ParentCode;
		ParamByName('SakiGCode').AsFloat	:=	ParentCode;
// <012>↑
		Open ();
		while (not EOF) do
		begin
			with DmqTreeUpdate do
			begin
				Close ();
				SQL.Clear;
				SQL.ADD('UPDATE KmkTree SET EntNo = :EntryNo ');
				SQL.ADD(',UpdTantoNCode = :UpdTantoNCode '); // <020>
				SQL.ADD('WHERE MasterKbn = :MasterKbn and ');
				SQL.ADD('SumNCode = :SakiGCode and BasedNCode = :MotoGCode');

				ParamByName('MasterKbn').AsInteger	:=	DmqTreeSelect.GetFLD('MasterKbn').AsInteger;
// <012>↓
//				ParamByName('SakiGCode').AsInteger	:=	DmqTreeSelect.GetFLD('SumNCode'  ).AsInteger;
//				ParamByName('MotoGCode').AsInteger	:=	DmqTreeSelect.GetFLD('BasedNCode').AsInteger;
				ParamByName('SakiGCode').AsFloat	:=	DmqTreeSelect.GetFLD('SumNCode'  ).AsFloat;
				ParamByName('MotoGCode').AsFLoat	:=	DmqTreeSelect.GetFLD('BasedNCode').AsFloat;
// <012>↑
				ParamByName('EntryNo').AsInteger	:=	iCount * -100;
                // 更新担当者内部ｺｰﾄﾞ<020>
                ParamByName('UpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

				if (ExecSQL = FALSE) then
				begin
					ErrorMessageDsp(DmqTreeUpdate);
					MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
					DmqTreeUpdate.Close;
					DmqTreeUpdate.Free;
					Exit;
				end;

//				MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
			end;

			iCount	:=	iCount + 1;

			NEXT;
		end;
	end;
	DmqTreeSelect.Close;
	DmqTreeSelect.Free;

	with DmqTreeUpdate do
	begin
		Close ();
		SQL.Clear;
		SQL.ADD ('UPDATE KmkTree SET EntNo = EntNo * -1 ');
		SQL.ADD (',UpdTantoNCode = :UpdTantoNCode '); // <020>
		SQL.ADD ('WHERE MasterKbn = :MasKbn AND SumNCode = :SakiGCode');

		ParamByName ('MasKbn'	).AsInteger	:=	3;
// <012>↓
//		ParamByName ('SakiGCode').AsInteger	:=	ParentCode;
		ParamByName ('SakiGCode').AsFloat	:=	ParentCode;
// <012>↑
        // 更新担当者内部ｺｰﾄﾞ<020>
        ParamByName('UpdTantoNCode').AsCurrency := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

		if (ExecSQL = FALSE) then
		begin
			ErrorMessageDsp(DmqTreeUpdate);
			MDataModule.Rollback (dbCorp_Select);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
			DmqTreeUpdate.Close;
			DmqTreeUpdate.Free;
			Exit;
		end;

		MDataModule.Commit (dbCorp_Select);		//	ｺﾐｯﾄ(反映)
	end;

	gbKmkTree2Flag	:=	TRUE;	// 加算体系２更新ﾌﾗｸﾞＯＮ

	DmqTreeUpdate.Close;
	DmqTreeUpdate.Free;
end;

//**************************************************************************
//	Proccess	:	削除前仕訳・実績有無チェック
//	Name		:	N.Nabe
//	Date		:	2000.11.16
//	Parameter	:	strGCode	: String
//				:	iSumKbn		: Integer
//	Retrun		:
//	History		:	9999.99.99	X.Xxxxxx
//					XXXXXXXX修正内容
//  Comment     :   2006.02.14 K.Katou
//                  削除ﾁｪｯｸはｽﾄｱﾄﾞに任せるのでこの関数は呼ばれません
//**************************************************************************
function TJNTCRP009002_1f.fnDeleteCheck(iGCode: Integer): Boolean;
var
	QueryFree	: TMQuery;
	QueryMain	: TMQuery;
	iFlg		: Integer;
    exNCode     : Extended;                 // <008>内部ｺｰﾄﾞ
    strName     : String;                   // <CHK>
begin
	QueryFree		:= TMQuery.Create(Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryFree);
	QueryMain		:= TMQuery.Create(Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryMain);

	iFlg := 0;													// 削除不可ﾌﾗｸﾞ初期化

//    exNCode := GetNCode(iGCode, 0);           // <008>内部ｺｰﾄﾞ取得 <CHK>削除
    exNCode := GetNCode(iGCode, 0, strName);    // <008>内部ｺｰﾄﾞ取得 <CHK>引数追加

	try
		// 会社基本情報読み込み
		QueryMain.Close;
		QueryMain.SQL.Clear;		 							// QueryFree 初期化
		QueryMain.SQL.Add('Select * from DTMAIN_Mas');
		QueryMain.Open;

		// 資金繰実績有無のチェック
		QueryFree.Close;
		QueryFree.SQL.Clear;		 							// QueryFree 初期化
		QueryFree.SQL.Add('Select * from CashSM');
// <008>
//		QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashCode=:iCode');
		QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashNCode=:iCode');
		QueryFree.SetFld('iNMonth').AsInteger	:= QueryMain.GetFld('strMonth').AsInteger;
// <008>
//		QueryFree.SetFld('iCode').AsInteger	:= iGCode;
  		QueryFree.SetFld('iCode').AsFloat	:= exNCode;
		QueryFree.Open;

		if QueryFree.EOF = FALSE then
		begin
			while QueryFree.EOF = FALSE do
			begin
				if QueryFree.GetFld('CashSum').AsInteger <> 0then
				begin
					iFlg := 1;
				end;

				if iFlg = 1 then
				begin
					result := FALSE;
					exit;
				end;

				QueryFree.Next;
			end;

			// 仕訳有無のチェック(借方)
			QueryFree.Close;
			QueryFree.SQL.Clear;		 							// QueryFree 初期化
			QueryFree.SQL.Add('Select * from SwkDetail');
// <008>
//			QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashCode=:iKariSikin and CashKbn=1');
			QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashNCode=:iKariSikin and CashKbn=1');
			QueryFree.SetFld('iNMonth').AsInteger	:= QueryMain.GetFld('strMonth').AsInteger;
// <008>
//			QueryFree.SetFld('iKariSikin').AsInteger	:= iGCode;
			QueryFree.SetFld('iKariSikin').AsFloat	:= exNCode;
			QueryFree.Open;

			if QueryFree.EOF = FALSE then
			begin
				result := FALSE;
				exit;
			end;

			// 仕訳有無のチェック(貸方)
			QueryFree.Close;
			QueryFree.SQL.Clear;		 							// QueryFree 初期化
			QueryFree.SQL.Add('Select * from SwkDetail');
// <008>
//			QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashCode=:iKasiSikin and CashKbn=2');
			QueryFree.SQL.Add('Where NMonth>=:iNMonth and CashNCode=:iKasiSikin and CashKbn=2');
			QueryFree.SetFld('iNMonth').AsInteger	:= QueryMain.GetFld('strMonth').AsInteger;
// <008>
//			QueryFree.SetFld('iKasiSikin').AsInteger	:= iGCode;
			QueryFree.SetFld('iKasiSikin').AsFloat	:= exNCode;
			QueryFree.Open;

			if QueryFree.EOF = FALSE then
			begin
				result := FALSE;
				exit;
			end;

			result := TRUE;
			exit;

		end
		else
		begin
			result := TRUE;
			exit;
		end;

	finally
		QueryMain.Free;										// QueryFree 開放
		QueryFree.Free;										// QueryFree 開放
	end;
end;

//**********************************************************************
//*		Proccess	:	ｴﾗｰﾒｯｾｰｼﾞ表示処理
//*		Name		:	H.Endo
//*		Date		:	2001/2/16
//*		Parameter	:	DmQuery		:	ｴﾗｰになったQuery
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP009002_1f.ErrorMessageDsp(DmQuery: TMQuery);
begin
	case ComArea.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
			//	最大登録件数をｵｰﾊﾞｰしました
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 0, 1 );
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
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
			MjsMessageBoxEx(AOwner, // <003>
                            '未連結仕訳(部署or分散)が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
//--- 追加  END  -----
// <013> ↓
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
// <013> ↑
		else
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmQuery );
			MjsMessageBoxEx(AOwner, // <003>
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

procedure TJNTCRP009002_1f.DSikinguriJKeyPress(Sender: TObject;
  var Key: Char);
begin
	if  (DSikinguriJ.FocusedColumn = COL_GCODE) then
	begin
		if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) and (Key <> #13) then
		begin                          // #8=BackSpace   #27=Esc  #9=Tab #13=Enter
			Beep ();
			Abort;
		end;
	end;
end;

//-----------------------------------------------------------------------------
// DSikinguriGKeyPress()
//	<  >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  : Key       :   Char
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_1f.DSikinguriGKeyPress(Sender: TObject; var Key: Char);
begin

	if ( DSikinguriG.FocusedColumn = COL_GCODE ) then
	begin
        // #8=BackSpace   #27=Esc  #9=Tab  #13=Enter
		if ((Key < '0') or  (Key > '9')) and
            (Key <> #8) and (Key <> #27) and
            (Key <> #9) and (Key <> #13) then
		begin
			Beep ();
			Abort;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// btnFusenCtl_Click()
//	< 付箋ﾎﾞﾀﾝｸﾘｯｸ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_1f.btnFusenCtl_Click(Sender: TObject);
var
	iColor	    :	Integer;
	iCode	    :	Extended;
	iIndex	    :   Integer;
	NodeSelect	:	TTreeNode;
	stWorkRec	:	^TreeViewRec;
	QueryFusen	:	TMQuery;
begin

	iIndex      :=  0;
	stWorkRec   :=  nil;

    // 加算体系
	if ( Screen.ActiveControl = VKasantaikei ) then
	begin
		NodeSelect  :=  VKasantaikei.Selected;
		stWorkRec   :=  NodeSelect.Data;
	end;

    // 加算体系
	if ( Screen.ActiveControl = VKasantaikei ) and
       (stWorkRec^.prmSumKbn  = 1            ) then
	begin
		iCode   :=  stWorkRec^.prmNCode;

		try
			QueryFusen := TMQuery.Create (Self);
		except
			// ｸｴﾘのｲﾝｽﾀﾝｽに失敗
			MjsMessageBoxEX(AOwner, // <003>
                            'Query Instance Error','btnFusenCtlClick',
                            mjError,
                            mjOk,
                            mjDefOk
                           );
			Exit;
		end;

		MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryFusen );

		try
			// 付箋ﾁｪｯｸ
			with QueryFusen do
			begin
                // --------------------------------------
                //  工事合計/集計科目付箋情報を取得
                // --------------------------------------
				Close ();
				SQL.Clear();
				SQL.Add('SELECT FusenKbn FROM MFusenInfo    '
				    +   'WHERE  (MasterKbn = 3)             '
                    +   '  AND  (NCode     = :iNCode)       ');

				SetFld('iNCode').AsFloat    :=  iCode;
				Open ();

				if ( EOF = FALSE ) then
                    iColor  :=  GetFld('FusenKbn').AsInteger
				else
					iColor  :=  NOCOLOR;
			end;
		finally
			QueryFusen.Close();
			QueryFusen.Free();
		end;
	end
	else
	begin
		if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
		begin
			iCode   :=  dxMemData1NCode.AsFloat;
			iColor  :=  dxMemData1FusenIndex.AsInteger;
		end
		else
		begin
			iCode   :=  dxMemData2NCode.AsFloat;
			iColor  :=  dxMemData2FusenIndex.AsInteger;
		end;
	end;

	case iColor of
		NOCOLOR:	iIndex := 99;
		RED:		iIndex := 0;
		GREEN:		iIndex := 2;
		BLUE:		iIndex := 1;
		ORANGE:		iIndex := 3;
	end;

    // 同色を設定→はがす。
	if ( btnFusenCtl.ImageIndex = iIndex ) then
	begin
        // 加算体系
		if ( Screen.ActiveControl = VKasantaikei ) and
           ( stWorkRec^.prmSumKbn = 1            ) then
		begin
			m_cNodeRightClk :=  VKasantaikei.Selected;
			TFDelClick( Sender );
		end
		else
			GFDelClick( Sender );
	end
	else
	begin
		case btnFusenCtl.ImageIndex of
			0:	iColor := RED;
			1:	iColor := BLUE;
			2:	iColor := GREEN;
			3:	iColor := ORANGE;
		end;

		FusenInfoWrite(iColor, iCode, TRUE);

        // 加算体系
		if ( Screen.ActiveControl = VKasantaikei ) and
           ( stWorkRec^.prmSumKbn = 1            ) then Exit;

		FusenDsp(MTab1.Items.Selected+1, iCode, 1);

		m_fUpdateRecord :=  0;
		if ( MTab1.Items.Selected = PAGE_JITUZAI ) then
    			dxMemData1.Post
		else    dxMemData2.Post;

		m_fUpdateRecord :=  1;
	end;

end;

// 付箋ボタンdropdownクリック
procedure TJNTCRP009002_1f.FusenListClick(Sender: TObject);
begin
	btnFusenCtl.ImageIndex := TControl(Sender).Tag-1;

    m_FusenColorIdx :=  btnFusenCtl.ImageIndex;
end;

// 実在グリッドマウス移動イベント
procedure TJNTCRP009002_1f.DSikinguriJMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	Row	:	Integer;
begin
  inherited;
	// 付箋備考表示処理
	Row	:= Y div DSikinguriJ.DefaultRowHeight + DSikinguriJ.TopIndex;

	if (Row <> m_HintRow_Jitu) then
	begin
		m_HintRow_Jitu			:= Row;
		DSikinguriJ.Hint		:= '';
		DSikinguriJ.ShowHint	:= FALSE;
		exit;
	end;

	//	付箋の枠以外
	if (X < 12) or (X > 32) then
		exit;

	if (Y >= 0) and (Y <= 17) then
		exit;

	//	行
	if (Row = m_HintRow_Jitu) and (DSikinguriJ.ShowHint = TRUE) then
		Exit;

	if (Row <= dxMemData1.RecordCount) and (m_aCmnt_Jitu[Row-1].Cmnt <> '') then
	begin
		DSikinguriJ.Hint		:= m_aCmnt_Jitu[Row-1].Cmnt;
		DSikinguriJ.ShowHint	:= TRUE;
	end;
end;

// 合計グリッドマウス移動イベント
procedure TJNTCRP009002_1f.DSikinguriGMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	Row	:	Integer;
begin
  inherited;
	// 付箋備考表示処理
	Row	:= Y div DSikinguriG.DefaultRowHeight + DSikinguriG.TopIndex;

	if (Row <> m_HintRow_Gou) then
	begin
		m_HintRow_Gou			:= Row;
		DSikinguriG.Hint		:= '';
		DSikinguriG.ShowHint	:= FALSE;
		exit;
	end;

	//	付箋の枠以外
	if (X < 12) or (X > 32) then
		exit;

	if (Y >= 0) and (Y <= 17) then
		exit;

	//	行
	if (Row = m_HintRow_Gou) and (DSikinguriG.ShowHint = TRUE) then
		Exit;

	if (Row <= dxMemData2.RecordCount) and (m_aCmnt_Gou[Row-1].Cmnt <> '') then
	begin
		DSikinguriG.Hint		:= m_aCmnt_Gou[Row-1].Cmnt;
		DSikinguriG.ShowHint	:= TRUE;
	end;
end;

//**********************************************************************
//*		Proccess	:	加算体系ﾏｽﾀ 挿入ﾁｪｯｸ
//*		Name		:	H.Endo
//*		Date		:	2001/06/28
//*		Parameter	:	DragCode	:	挿入元
//*						DropCode	:	挿入先
//*		Return		:	正常(TRUE)/異常(FALSE)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP009002_1f.fnCheckMasterTreeInsertValid(DragCode,DropCode: Integer): Boolean;
var
	iCount  : Integer;
	cNode   : TTreeNode;
	WorkRec	: ^TreeViewRec;
begin
	for iCount := 1 to VKasantaikei.Items.Count do
	begin
		WorkRec   := VKasantaikei.Items [iCount - 1].Data;

		if  (WorkRec^.prmCode = DropCode) then
		begin
			cNode       := VKasantaikei.Items [iCount - 1];
			WorkRec   := cNode.Data;

			if  WorkRec^.prmSumKbn = 0 then
			begin
				cNode       := cNode.Parent;
				WorkRec   := cNode.Data;
			end;

			while (TRUE) do
			begin
				if  (WorkRec^.prmCode = DragCode) then
				begin
					Result	:= FALSE;
					Exit;
				end;

				cNode   := cNode.Parent;

				if  (cNode = nil) then
					break
				else
					WorkRec   := cNode.Data;
			end;
		end;
	end;

	result  := TRUE;

end;

//**********************************************************************
//*		Proccess	:	新規追加の内部ｺｰﾄﾞ取得
//*		Name		:	K.Takahashi
//*		Date		:	2005/02/07
//*		Parameter	:	なし
//*		Return		:	Integer　内部ｺｰﾄﾞ(異常：-1)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//*                     2006/02/14  K.Katou
//*                                 戻り値の型変更(Integer→Extended)
//**********************************************************************
//function TJNTCRP009002_1f.GetNewNCode():Integer;  // <012>削除
function TJNTCRP009002_1f.GetNewNCode():Extended;   // <012>追加
var
	QueryWk   : TMQuery;
begin
    Result := -1;

    										//MQueryの構築
	QueryWk := TMQuery.Create( Self );
	try
											//DBとMQueryの接続
// <015> MOD start
//   	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryWk );
											// ｸﾞﾙｰﾌﾟ会計の子会社の場合
		if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
		begin								// 親会社から最大NCode取得
	    	MDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, QueryWk );
		end
		else
		begin								// 自社から最大NCode取得
	    	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryWk );
		end;
// <015> MOD end

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
// <012>↓
//    		Result := QueryWk.GetFld('MaxNcode').AsInteger + 1;
    		Result := QueryWk.GetFld('MaxNcode').AsFloat + 1;
// <012>↑
        end
        else
        begin
            Result := 1;                    // 1ｵﾘｼﾞﾝ
	    end;
    finally
	    QueryWk.Free;
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
procedure TJNTCRP009002_1f.DisplayControl(Select: Integer);
begin

    if m_cJNTArea.IsFusen then
        btnFusenCtl.ImageIndex	:=  m_FusenColorIdx
    else
        btnFusenCtl.ImageIndex	:=  4;

    btnFusenCtl.Enabled     :=  m_cJNTArea.IsFusen;

  	DSikinguriJ .PopupMenu	:=	PMSikinguri;
  	DSikinguriG .PopupMenu	:=	PMSikinguri;
  	VKasantaikei.PopupMenu	:=	PMKasantaikei;

// <014> MOD start
// 	BDelete.Enabled	        :=	m_cJNTArea.IsDelete;
  	BDelete.Enabled	        :=	IsDeleteEx();
// <014> MOD end


	if (Select = REFER) then
	begin
		//	実在Grid
		DSikinguriJ.Options	:=	DSikinguriJ.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		DSikinguriJFusen.ReadOnly		:= TRUE;
		DSikinguriJGCode.ReadOnly		:= TRUE;
		DSikinguriJRenChar.ReadOnly		:= TRUE;
		DSikinguriJLongName.ReadOnly	:= TRUE;
		DSikinguriJSimpleName.ReadOnly	:= TRUE;
		DSikinguriJDummyDc.ReadOnly		:= TRUE;
		DSikinguriJDcKbnCode.ReadOnly	:= TRUE;
		DSikinguriJDcKbnName.ReadOnly	:= TRUE;
		DSikinguriJDummyAna.ReadOnly	:= TRUE;
		DSikinguriJAnalyzeCode.ReadOnly	:= TRUE;
		DSikinguriJAnalyzeName.ReadOnly	:= TRUE;
		DSikinguriJDummyDeco.ReadOnly	:= TRUE;
		DSikinguriJDecoKbnCode.ReadOnly	:= TRUE;
		DSikinguriJDecoKbnName.ReadOnly	:= TRUE;

		//	合計Grid
		DSikinguriG.Options	:=	DSikinguriG.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		DSikinguriGFusen.ReadOnly		:= TRUE;
		DSikinguriGGCode.ReadOnly		:= TRUE;
		DSikinguriGRenChar.ReadOnly		:= TRUE;
		DSikinguriGLongName.ReadOnly	:= TRUE;
		DSikinguriGSimpleName.ReadOnly	:= TRUE;
		DSikinguriGDummyDc.ReadOnly		:= TRUE;
		DSikinguriGDcKbnCode.ReadOnly	:= TRUE;
		DSikinguriGDcKbnName.ReadOnly	:= TRUE;
		DSikinguriGDummyAna.ReadOnly	:= TRUE;
		DSikinguriGAnalyzeCode.ReadOnly	:= TRUE;
		DSikinguriGAnalyzeName.ReadOnly	:= TRUE;
		DSikinguriGDummyDeco.ReadOnly	:= TRUE;
		DSikinguriGDecoKbnCode.ReadOnly	:= TRUE;
		DSikinguriGDecoKbnName.ReadOnly	:= TRUE;

		VKasantaikei.DragMode	:=	dmManual;

// <014> ADD start　★暫定対応 <015> DEL
											// ｸﾞﾙｰﾌﾟ会計の子会社の場合
                                            // 翌期更新済みでなければ
(*		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) and
        	((m_SyncMaster.m_CEComKbn5 <> 1) and (m_SyncMaster.m_PEComKbn5 <> 1)) then
	    begin                            	// Treeの体系変更可
			VKasantaikei.DragMode	:=	dmAutomatic;
		end;
*)
// <014> ADD end

	end
	else
	begin
		//	実在Grid
		DSikinguriJ.Options	:=	DSikinguriJ.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		DSikinguriJFusen.ReadOnly		:= FALSE;
		DSikinguriJGCode.ReadOnly		:= FALSE;
		DSikinguriJRenChar.ReadOnly		:= FALSE;
		DSikinguriJLongName.ReadOnly	:= FALSE;
		DSikinguriJSimpleName.ReadOnly	:= FALSE;
		DSikinguriJDummyDc.ReadOnly		:= FALSE;
		DSikinguriJDcKbnCode.ReadOnly	:= FALSE;
		DSikinguriJDcKbnName.ReadOnly	:= FALSE;
		DSikinguriJDummyAna.ReadOnly	:= FALSE;
		DSikinguriJAnalyzeCode.ReadOnly	:= FALSE;
		DSikinguriJAnalyzeName.ReadOnly	:= FALSE;
		DSikinguriJDummyDeco.ReadOnly	:= FALSE;
		DSikinguriJDecoKbnCode.ReadOnly	:= FALSE;
		DSikinguriJDecoKbnName.ReadOnly	:= FALSE;

		//	合計Grid
		DSikinguriG.Options	:=	DSikinguriG.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		DSikinguriGFusen.ReadOnly		:= FALSE;
		DSikinguriGGCode.ReadOnly		:= FALSE;
		DSikinguriGRenChar.ReadOnly		:= FALSE;
		DSikinguriGLongName.ReadOnly	:= FALSE;
		DSikinguriGSimpleName.ReadOnly	:= FALSE;
		DSikinguriGDummyDc.ReadOnly		:= FALSE;
		DSikinguriGDcKbnCode.ReadOnly	:= FALSE;
		DSikinguriGDcKbnName.ReadOnly	:= FALSE;
		DSikinguriGDummyAna.ReadOnly	:= FALSE;
		DSikinguriGAnalyzeCode.ReadOnly	:= FALSE;
		DSikinguriGAnalyzeName.ReadOnly	:= FALSE;
		DSikinguriGDummyDeco.ReadOnly	:= FALSE;
		DSikinguriGDecoKbnCode.ReadOnly	:= FALSE;
		DSikinguriGDecoKbnName.ReadOnly	:= FALSE;

		VKasantaikei.DragMode	:=	dmAutomatic;

		VKasantaikei.PopupMenu	:=	PMKasantaikei;
		DSikinguriJ .PopupMenu	:=	PMSikinguri;
		DSikinguriG .PopupMenu	:=	PMSikinguri;
	end;
end;
//**********************************************************************
//*		Proccess	:	権限取得 <004>
//**********************************************************************
procedure TJNTCRP009002_1f.fnGetGrants();
begin

//    m_cJNTArea.FxPermission;						// 権限取得 <005>

//<017>↓
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
//<017>↑
        if m_cJNTArea.IsAppend and m_cJNTArea.IsModify then
            m_IsUpdate := True
        else
            m_IsUpdate := False;

		if ( m_IsUpdate ) then
	        giReferFlag	:= NORMAL					// 通常処理
		else
			giReferFlag	:= REFER;					// 更新権限無し
//	end;	//<017>

    BPrint.Enabled  :=  m_cJNTArea.IsPrint;           // ToolBar印刷ﾎﾞﾀﾝ
// <011>↓ｺﾒﾝﾄｱｳﾄ
//    BPrint.Enabled  :=  FALSE;  // <PRN>

// <014> ADD start ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
    // 参照権限の場合は以下の処理は行わない。
    if ( giReferFlag = REFER ) then
	begin
		Exit;
	end;

	// ADD start ★子会社の場合は権限なしと判断させて登録できなくする
// <015> DEL
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
            if ( MjsMessageBoxEx(AOwner, JNTSYNC_MSG_YokukiChk_Oya,
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
            MjsMessageBoxEx(AOwner, JNTSYNC_MSG_YokukiChk_Ko_K,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
        end
        // 親会社が過年度DBの場合
        else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
        begin
            MjsMessageBoxEx(AOwner, JNTSYNC_MSG_YokukiChk_Ko_O,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
		end
        else
        begin
// <015> DEL
											// 「ｸﾞﾙｰﾌﾟ会計の子会社として採用されています。
										   	// 体系のみの修正が可能です。」
//			MjsMessageBoxEx(AOwner, MSG_GRP_CHILD_READONLY, MSGCAP_GRP, mjInformation, mjOk, mjDefOk);
        end;
    end;
// <014> ADD end
end;

// <008>
// *************************************************************
// *
// *　　　作成日付：2005.10.24
// *　　　作成者  ：K.Katou
// *
// *　　　関数名称：GetNCode
// *　　　関数説明：外部ｺｰﾄﾞから資金繰科目の内部ｺｰﾄﾞ取得
// *
// *　　　入力　　：iGCode      : 外部ｺｰﾄﾞ
// *                iSumKbn     : 実在/合計区分
// *                strName     : 簡略名称格納域 <CHK>追加
// *　　　出力　　：Extended    : 内部ｺｰﾄﾞ
// *
// *************************************************************
//function TJNTCRP009002_1f.GetNCode(iGCode: Integer; iSumKbn: Integer): Extended;
function TJNTCRP009002_1f.GetNCode(iGCode: Integer; iSumKbn: Integer; var strName: String): Extended;    // <CHK>
var
    Query       : TMQuery;
begin
	Result := 0;
    strName := '';                          // <CHK>

    Query := TMQuery.Create(Self);

    try
											// DBとMQueryの接続
  	    MDataModule.SetDBInfoToQuery( dbCorp_Select, Query );

    	Query.Close;
	    Query.SQL.Clear;

//    	Query.SQL.Add('select NCode from SKmkMA');              // <CHK>
    	Query.SQL.Add('select NCode, SimpleName from SKmkMA');  // <CHK>
		Query.SQL.Add('where MasterKbn = 3 AND SumKbn = :iSum AND RDelKbn = 0 AND Gcode = :iGcode');
		// 外部ｺｰﾄﾞ
        Query.ParamByName('iGCode').AsInteger := iGCode;
		// 実在/合計区分
        Query.ParamByName('iSum').AsInteger := iSumKbn;
		Query.Open;

    	if not Query.Eof then
	    begin
            Result := Query.GetFld('NCode').AsFloat;
                                            // 簡略名称
            strName := Query.GetFld('SimpleName').AsString;     // <CHK>
    	end;
	finally
		Query.Free;
    end;

end;

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/14
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP009002_1f.fnDelCheck(exNCode: Extended; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;
    try
        SPMasSKmk.Connection := dbCorp_Select;
        //SPMasSKmk.SessionName := dbCorp_Select.SessionName;

        // 【会計】MP_MAS_CHK_SKMKMA
        with SPMasSKmk do
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
        strErr := '例外発生(MP_MAS_CHK_SKMKMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

// <014> ADD start
//**********************************************************************
//*		Proccess	:	削除ﾎﾞﾀﾝのEnabled制御	<014>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/30
//*		Parameter	:	なし
//*		Return		:	Boolean	T: 有効 F: 無効
//**********************************************************************
function TJNTCRP009002_1f.IsDeleteEx(): Boolean;
begin
// <015> MOD start
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
	// ★2007.06ﾘﾘｰｽ用暫定対応 ｸﾞﾙｰﾌﾟ会計を採用する場合、削除は無効とする
   	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_NOTUSE then
    begin                                   // ｸﾞﾙｰﾌﾟ会計なし
		Result := m_cJNTArea.IsDelete;		// 通常は権限に従う
    end
    else    								// ｸﾞﾙｰﾌﾟ会計あり
    begin
		Result := False;
    end;
// <015> MOD end
end;

//**********************************************************************
//*		Proccess	:	登録系ﾎﾞﾀﾝのEnabled制御	<014>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/30
//*		Parameter	:	なし
//*		Return		:	Boolean	T: 有効 F: 無効
//**********************************************************************
function TJNTCRP009002_1f.IsUpdateEx(): Boolean;
begin
// <015> MOD start
											// ★ｸﾞﾙｰﾌﾟ会計の子会社の場合の暫定対応
(*	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		// ※子会社の場合は権限の変数を上書きしてしまっているため、共通ｸﾗｽを見て判断
		if (m_cJNTArea.IsAppend() and m_cJNTArea.IsModify()) then
		begin
			Result := True;
		end
		else
		begin
			Result := False;				// 削除不可
		end;
	end
	else
	begin
		Result := m_IsUpdate;				// 通常はﾒﾝﾊﾞの権限に従う
	end;
*)
	Result := m_IsUpdate;					// ﾒﾝﾊﾞの権限に従う
// <015> MOD end
end;

// <014> ADD end
// <015> ADD start
//**********************************************************************
//*		Proccess	:	ｾｷｭﾘﾃｨ基本情報取得 <015>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/07
//*		Parameter	:	なし
//*		Return		:   True or False
//**********************************************************************
function TJNTCRP009002_1f.GetSecMain(): Boolean;
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
//*		Proccess	:	全部の子会社に関連付処理(ﾏｽﾀ同期) <015>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/07
//*		Parameter	:	exNCode		科目内部ｺｰﾄﾞ
//*		Return		:   Boolean 	True or False
//**********************************************************************
function TJNTCRP009002_1f.fnAllCorpRelation(exNCode: Extended): Boolean;
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
			if not WriteSKmkREL(MKBN_SIKIN, exNCode, QuerySeg.GetFld('NCode').AsFloat, Qe) then
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
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の親会社DBﾄﾗﾝｻﾞｸｼｮﾝ処理 <015>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/07
//*		Parameter	:	iTrnKind	親会社DBへの指示
//*		Return		:	なし
//*		Comment		:	ｸﾞﾙｰﾌﾟ管理を採用していない、または親会社の処理中は
//*					:	何もしない。子会社選択中のみ親会社との同期を考慮する
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_1f.ExecParentDBTran(iTrnKind: Integer);
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
//	Proccess	:  	関連付け(SKmkMA_REL)更新 <015>
//	Name	  	:	K.Katou
//	Date	  	:	2007/05/07
//	Parameter 	:   iMasterKbn		ﾏｽﾀ区分
//				:	exNCode			科目内部ｺｰﾄﾞ
//				:	exSegNCode		会社識別ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
//				:	Query			接続済みｸｴﾘ(親会社)
//	Retrun	  	:	True or False
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009002_1f.WriteSKmkREL(iMasterKbn: Integer; exNCode: Extended;
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

// <015> ADD end
// <016> ADD start
//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の一括配信ﾀﾞｲｱﾛｸﾞ呼出 <016>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/15
//*		Parameter	:	なし
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_1f.CallSyncDlg();
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
// <016> ADD end

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<019>
//	Name		:	T.Seki
//	Date		:	2008/02/19
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP009002_1f.SessionPractice(iSyori: Integer);
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
function TJNTCRP009002_1f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.



