//*****************************************************************************************************
//*
//*	Systeme			:   ＦＸ共通マスタ
//*	Program			:   工種/作業内訳登録
//*	ProgramID		:	JNTCRP018004
//*	Name			:	飯塚 健介(LEAD)
//*	Create			:   2005.03.02(WED)
//*	Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*
//* History
//* <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//* <   >   飯塚 健介(LEAD) 2005.03.02(WED) MJSLINK財務大将よりGalileoptへｺﾝﾊﾞｰﾄ
//* <001>   茂木 勇次(LEAD) 2005.10.20(THU) 工種ﾊﾟﾀｰﾝ画面でﾊﾟﾀｰﾝｺｰﾄﾞを選択した後直ぐに「＜」ﾎﾞﾀﾝを押下
//*                                         するとｱﾄﾞﾚｽ違反が発生する不具合対応。
//* <002>   加藤(PRIME)     2005.10.27(THU) ｷｰ動作修正
//* <003>   加藤(PRIME)     2005.11.28(MON) 履歴用ｽﾄｱﾄﾞ呼び出し
//* <004>   広田(PRIME)     2005.12.13(TUE) 印刷順対応
//* <CHK>   加藤(PRIME)     2006.02.15(WED) 削除ﾁｪｯｸ対応
//* <   >   加藤(PRIME)     2006.02.23(THU) 正式名称を40→60byteに 外部ｺｰﾄﾞを6→10byteに
//* <005>   加藤(PRIME)     2006.02.23(THU) ｺｰﾄﾞ属性がﾌﾘｰの時に印刷ﾃﾞｰﾀを抽出できない不具合修正
//* <006>   加藤(PRIME)     2006.02.23(THU) 内部ｺｰﾄﾞはIntegerで扱わない
//* <007>   加藤(PRIME)     2006.02.23(THU) ﾏｳｽでｺﾝﾎﾞを触った時の不自然な動きを修正
//* <008>   飯塚 健介(LEAD) 2006.03.29(WED) ﾚﾎﾟｰﾄに付箋を追加
//* <009>   飯塚 健介(LEAD) 2006.03.29(WED) ﾊﾟﾀｰﾝ登録をﾀﾞﾌﾞﾙｸﾘｯｸで行えるように修正
//* <010>   H.Endo(MJS)     2006.10.30(MON) KEY操作の修正
//*									        ①情報区分　SHIFT+TAB→選択Combo移動
//*								            ②CmnInstructionBarのﾀﾌﾞ順変更
//* <011>   高橋 功二(LEAD) 2007.01.25(THU) ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一) Ver1.07正式版(2007/2)にてﾘﾘｰｽ
//* <012>   高橋 功二(LEAD) 2007.02.23(FRI) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//* <013>   茂木 勇次(LEAD) 2007.04.18(WED) ﾏｽﾀ同期で全社情報を同期付ける際に、ﾒｯｾｰｼﾞ表示後に別ﾉｰﾄﾞに
//*                                         ﾏｳｽでｸﾘｯｸするとｸﾞﾘｯﾄﾞの内容が諸口以外消えてしまう不具合対応。
//* <014>   茂木 勇次(LEAD) 2007.04.18(WED) 情報区分をｷｰﾎﾞｰﾄﾞで「ﾊﾟﾀｰﾝ登録」を選択した場合に、'無効/非表示ｳｨﾝﾄﾞｳ
//*                                         にはﾌｫｰｶｽを設定できません」のｴﾗｰが発生し、入力が一切できない不具合対応。
//* <015>   茂木 勇次(LEAD) 2007.04.18(WED) KousyuPtnが同期配信されない不具合対応。
//* <016>   茂木 勇次(LEAD) 2007.04.18(WED) KousyuPtnMAの同期配信を行った場合、ﾊﾟﾀｰﾝ名称を再描画するように修正。
//* <017>   茂木 勇次(LEAD) 2007.04.19(THU) 工種・作業内訳登録時に同一ﾁｪｯｸの前にﾏｽﾀ同期を行っていたので、ﾁｪｯｸ後に変更。
//* <018>   茂木 勇次(LEAD) 2007.04.19(THU) 工種・作業内訳登録で外部ｺｰﾄﾞ０の登録ができない不具合対応。
//* <019>   茂木 勇次(LEAD) 2007.04.19(THU) 作業ﾊﾟﾀｰﾝ登録で一度削除したﾊﾟﾀｰﾝについても同期関連付けを行ってしまう不具合対応。
//* <020>   茂木 勇次(LEAD) 2007.05.06(SUN) 処理終了時に、ｸﾞﾙｰﾌﾟ会計を行っている場合は、一括配信DLGを呼出。
//* <021>   茂木 勇次(LEAD) 2007.05.09(WED) Screen.ActiveControl.Nameで判定している部分でｱﾄﾞﾚｽ違反が発生している不具合対応。
//* <022>   茂木 勇次(LEAD) 2007.05.10(THU) 工種ﾊﾟﾀｰﾝでKousyuPtnの情報を削除する際に、全子社DBに対して削除を行うように修正。
//* <023>   茂木 勇次(LEAD) 2007.05.10(THU) 工種ﾊﾟﾀｰﾝでKousyuPtnの情報を削除しても、_RELの更新がﾛｰﾙﾊﾞｯｸされてしまう不具体対応。
//* <024>   高橋 功二(LEAD) 2007.06.02(SAT) 工種ﾊﾟﾀｰﾝでﾂﾘｰからｸﾞﾘｯﾄﾞへ移動した場合に親のKousyuPtnを削除
//* <025>   茂木 勇次(LEAD) 2007.06.07(THU) 全社でも一括配信DLGを呼出。
//* <026>   高橋 功二(LEAD) 2007.06.14(THU) 工種ﾊﾟﾀｰﾝの同期を「ROWDEL」で行う
//* <   >   鈴木(PRIME)     2007.07.10(TUE) ｺｰﾄﾞ16桁対応
//* <027>   鈴木(PRIME)     2007.07.19(THU) 決算確定時にﾊﾟﾀｰﾝ登録ができてしまう不具合を修正
//* <028>   鈴木(PRIME)     2007.07.27(FRI) 子社でﾊﾟﾀｰﾝ登録のﾊﾟﾀｰﾝを削除した場合は全社のﾊﾟﾀｰﾝも削除する
//* <029>   鈴木(PRIME)     2007.08.08(WED) ﾊﾟﾀｰﾝ登録のﾊﾟﾀｰﾝを全社で削除した場合、子社のﾊﾟﾀｰﾝも削除するように修正
//* <030>   鈴木(PRIME)     2007.08.08(WED) ﾊﾟﾀｰﾝ登録のﾊﾟﾀｰﾝ明細を全社で削除した場合、子社のﾊﾟﾀｰﾝ明細も削除するように修正
//* <031>   鈴木(PRIME)     2007.08.09(THU) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//* <032>   鈴木(PRIME)     2007.08.22(WED) 該当の変数を工種/作業内訳の中で共通のｱﾄﾞﾚｽに対してｱｸｾｽ
//*                                         し変数を書換えてしまう為ｸﾗｽに移動
//*	<033>   鈴木(PRIME)     2007.08.22(WED) 追加、修正権限がなしで、削除権限がありの場合はﾊﾟﾀｰﾝを削除できるように修正
//* <034>   鈴木(PRIME)     2007.08.22(WED) ｸﾞﾘｯﾄﾞにﾏｳｽｶｰｿﾙを当てたときにﾍﾙﾌﾟﾋﾝﾄを表示するように修正
//* <035>   鈴木(PRIME)     2007.08.23(THU) 新規作成した工種に付箋を追加しても、付箋が保存されない不具合を修正
//* <036>   鈴木(PRIME)     2007.08.23(THU) 新規ﾃﾞｰﾀ挿入中は付箋を貼れないように修正
//* <037>   大竹文顕(LEAD)  2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//*	<038>	関(PRIME)		2008.05.09(FRI) J-SOXﾏｽﾀ更新履歴対応
//*	<039>	小川(RIT)		2010.05.21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//
//======================= Ver4.07修正 Start ==============================
//*	<040>	小川(LEAD)		2011.08.22(MON) TreeViewにてドラッグエンドドロップによる不具合対応
//======================= Ver4.08修正 Start ==============================
//*	<041>	黒田 祐生		2012.02.14(MON)	ShiftState対応
//
//*	<042>	小松     		2018.09.11(THU)	Edgetracker対応
//*****************************************************************************************************
unit JNTCRP018004u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.ExtCtrls, ComCtrls, VCL.StdCtrls,ToolWin, Buttons,Db, FireDAC.Comp.Client, Menus, VCL.ImgList,
  dxmdaset,

  dxDBGrid, dxGrClms, dxTL, dxCntner,
  ppCtrls, ppBands, ppClass,ppDB, ppProd, ppReport, ppComm, ppRelatv, ppDBJIT,
  ppVar, ppPrnabl,ppCache, ppDBPipe,

  MJSTab, MJSLabel, MJSSpeedButton, MJSPanel, MJSStatusBar, MJSQuery, MJSEdits,
  MJSComboBox, MJSBitBtn,

  MJSMsgStdu, MjsDispCtrl, MjsDateCtrl, MjsPreviewIFu, MjsPrnDlgU, MjsPrnSupportU,
  MJSCommonu, MjsDBModuleu, JNTMasWndIFu, JNTMasComu, JNTCommonu, MjsStrCtrl,
  MjsExceptU, MJSCommon2u,

  JNTExpGlobal, JNTSelCorpSys, JNTPDlg,

  JNTCRP018004_D1u, JNTCRP018004_D2u, JNTCRP018004_D3u, MJSToolBar,  JNTFuncU,
  MJSFunctionBar, MJSSPFunctionBar, MJSCheckBox{<039> ADD St},MLBplLoaderU{<039> ADD Ed}
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer, ppParameter,
  FireDAC.Comp.DataSet, System.ImageList, System.AnsiStrings	// <041>ADD
  ;

const
	WM_ONPAINT = WM_APP + 1;	                                                // OnPaint 時の処理起動ﾒｯｾｰｼﾞ用

type
    TreeViewRec  = record
            nDivision : Byte;
            strExCode : string;
            strName   : string;
    end;

	MasterData = record
			strExCodeParent : String;				                            // 補助外部ｺｰﾄﾞ(親)
			strExCode	    : String;                                           // 補助外部ｺｰﾄﾞ
			strAssociation  : String;                                           // 連想
			strName		    : String;                                           // 正式名称
			strNameSimple   : String;                                           // 簡略名称
    end;

    SyncKey = record
            strGCode  : string;
            nPtnNCode : Extended;
            sPtnName  : string;     // <016>
            nKsyNCode : Extended;
    end;

    // 付箋情報 //
  	FusenCmntRec = record
  			strCmnt	: String;         											// 付箋ｺﾒﾝﾄ
  	end;


type
{$include ActionInterface.inc}
{$include JNTMASFUSENBIKODLGIFH.inc}
{$include JNTSelPrtIF.inc}
{$include JNTCRPSyncMasterH.inc}        // <012> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMAsterIFH.inc}         // <020> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部

  TPrintAppEntry = function
    (AOwner       :   TComponent;
     pRec		  :   Pointer;
     Mode		  :   Integer;
     PrtParam	  :   rcPrtParam;
     var ArHdl    :   array of Pointer): Integer;

  TJNTCRP018004f = class(TForm)
    PPanelSpeed: TMPanel;
    BSpeedButtonEnd: TMSpeedButton;
    BSpeedButtonPrn: TMSpeedButton;
    BSpeedButtonChg: TMSpeedButton;
    BSpeedButtonDel: TMSpeedButton;
    LVStyleBar: TMToolBar;
    MPnlCount: TMPanel;
    SStatusBar: TMStatusBar;
    DKousyuMemData: TdxMemData;
    DPtnMemData: TdxMemData;
    DKousyuMemDataGCode: TStringField;
    DKousyuMemDataRenso: TStringField;
    DKousyuMemDataLongName: TStringField;
    DKousyuMemDataSimpleName: TStringField;
    DKousyuDataSource: TDataSource;
    DPtnDataSource: TDataSource;
    CmnTreeViewImage: TImageList;
    CmnInstructionBar: TMPanel;
    MLabel50: TMLabel;
    CmnInstructionCombo: TMComboBox;
    DPtnMemDataGCode: TStringField;
    DPtnMemDataLongName: TStringField;
    DdxMemPrintKousyu: TdxMemData;
    DDBPipelinePrintKousyu: TppDBPipeline;
    RReportKousyu: TppReport;
    DdxMemPrintKousyuPtn: TdxMemData;
    DDBPipelinePrintKousyuPtn: TppDBPipeline;
    RReportKousyuPtn: TppReport;
    DdxMemPrintKousyuGCode: TStringField;
    DdxMemPrintKousyuRenso: TStringField;
    DdxMemPrintKousyuLongName: TStringField;
    DdxMemPrintKousyuSimpleName: TStringField;
    DdxMemPrintKousyuPtnPtnNo: TIntegerField;
    DdxMemPrintKousyuPtnPtnName: TStringField;
    DdxMemPrintKousyuPtnGCode: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    DDataSourcPrintKousyu: TDataSource;
    DDataSourcePrintKousyuPtn: TDataSource;
    LppCorpCode: TppLabel;
    LppCorpName: TppLabel;
    SVppPage: TppSystemVariable;
    SVppDate: TppSystemVariable;
    LppAccOffice: TppLabel;
    LineKousyuTitle: TppLine;
    pLKousyuTitle: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppJITPipeline1: TppJITPipeline;
    LKousyu_Kensu: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel70: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ReportkousyuLineDetailsBottom: TppLine;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    LppCorpCode2: TppLabel;
    LppCorpName2: TppLabel;
    LineKousyuPtnTitle: TppLine;
    pLKousyuPtnTitle: TppLabel;
    SVppDate2: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppColumnFooterBand2: TppColumnFooterBand;
    SVppPage2: TppSystemVariable;
    LppAccOffice2: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBTextPtnNo: TppDBText;
    ppDBTextPtnName: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppShape2: TppShape;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ReportkousyuPtnLineDetailsBottom: TppLine;
    DdxMemPrintKousyuPtnLongName: TStringField;
    ppDetailBand2: TppDetailBand;
    ReportkousyuPtnLineDetailsTop: TppLine;
    ScrollBox1: TScrollBox;
    PPanelPtn: TMPanel;
    MPanel1: TMPanel;
    CmnTreeView: TTreeView;
    MPanel3: TMPanel;
    MLabel1: TMLabel;
    EPtnNo: TMNumEdit;
    EPtnName: TMTxtEdit;
    MPanel5: TMPanel;
    DdxDBGrid2: TdxDBGrid;
    DdxDBGrid2GCode: TdxDBGridMaskColumn;
    DdxDBGrid2LongName: TdxDBGridMaskColumn;
    PPanelKousyu: TMPanel;
    MPanel2: TMPanel;
    DdxDBGrid: TdxDBGrid;
    DdxDBGridGCode: TdxDBGridMaskColumn;
    DdxDBGridRenso: TdxDBGridColumn;
    DdxDBGridLongName: TdxDBGridColumn;
    DdxDBGridSimpleName: TdxDBGridColumn;
    Btn_Right: TMBitBtn;
    Btn_Left: TMBitBtn;
    DPtnMemDataNCode: TFloatField;
    DKousyuMemDataNCode: TFloatField;
    ImLst: TImageList;
    lTitle: TMLabel;
    CmnPrjCombo: TMComboBox;
    DPrjComboData: TdxMemData;
    DPrjComboDataIndex: TIntegerField;
    DPrjComboDataKojMstKbn: TIntegerField;
    DPrjComboDataKosyuMstKbn: TIntegerField;
    DPrjComboDataCodeAttr: TIntegerField;
    DPrjComboDataCodeDigit: TIntegerField;
    DPrjComboDataJHojyoName: TStringField;
    CmnImageGeneral: TImageList;
    CmnToolbarImage: TImageList;
    CmnToolbarDropDownMenu: TPopupMenu;
    CmnToolbarDropDownMenuTag01: TMenuItem;
    CmnToolbarDropDownMenuTag02: TMenuItem;
    CmnToolbarDropDownMenuTag03: TMenuItem;
    CmnToolbarDropDownMenuTag04: TMenuItem;
    StdCmnGridTag: TdxDBGridGraphicColumn;
    DKousyuMemDatagrTag: TGraphicField;
    StdCmnGridPopupMenu: TPopupMenu;
    StdCmnGridPopupMenuTagOff: TMenuItem;
    StdCmnGridPopupMenuTagComment: TMenuItem;
    N2: TMenuItem;
    StdCmnGridPopupMenuTag01: TMenuItem;
    StdCmnGridPopupMenuItemTag01: TMenuItem;
    StdCmnGridPopupMenuItemTag01Ex: TMenuItem;
    StdCmnGridPopupMenuTag02: TMenuItem;
    StdCmnGridPopupMenuItemTag02: TMenuItem;
    StdCmnGridPopupMenuItemTag02Ex: TMenuItem;
    StdCmnGridPopupMenuTag03: TMenuItem;
    StdCmnGridPopupMenuItemTag03: TMenuItem;
    StdCmnGridPopupMenuItemTag03Ex: TMenuItem;
    StdCmnGridPopupMenuTag04: TMenuItem;
    StdCmnGridPopupMenuItemTag04: TMenuItem;
    StdCmnGridPopupMenuItemTag04Ex: TMenuItem;
    DKousyuMemDatastrComment: TStringField;
    DisableImage: TImageList;
    CmnPanelGroupTitleRight: TMLabel;
    FusenBar: TMToolBar;
    CmnToolbarButtonTag: TToolButton;
    MSPFunctionBar: TMSPFunctionBar;
    CmnToolbarDropDownMenuTag001: TMenuItem;
    CmnToolbarDropDownMenuTag002: TMenuItem;
    CmnToolbarDropDownMenuTag003: TMenuItem;
    CmnToolbarDropDownMenuTag004: TMenuItem;
    SPMasHoj: TFDStoredProc;
    SPPayHoj: TFDStoredProc;
    DdxMemPrintKousyuPtnFusen: TGraphicField;
    DdxMemPrintKousyuFusen: TGraphicField;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormHide(Sender: TObject);
    procedure BSpeedButtonChgClick(Sender: TObject);
    procedure BSpeedButtonEndClick(Sender: TObject);
    procedure CmnInstructionComboChange(Sender: TObject);
    procedure DdxDBGridBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure DdxDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DKousyuMemDataBeforePost(DataSet: TDataSet);
    procedure DKousyuDataSourceStateChange(Sender: TObject);
    procedure EPtnNoArrowClick(Sender: TObject);
    procedure EPtnNoExit(Sender: TObject);
    procedure EPtnNameExit(Sender: TObject);
    procedure Btn_RightClick(Sender: TObject);
    procedure DdxDBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DdxDBGrid2DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure CmnTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CmnTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Btn_LeftClick(Sender: TObject);
    procedure BSpeedButtonDelClick(Sender: TObject);
    procedure DdxDBGridEnter(Sender: TObject);
    procedure CmnInstructionComboEnter(Sender: TObject);
    procedure DdxDBGridChangeNodeEx(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BSpeedButtonPrnClick(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand2BeforeGenerate(Sender: TObject);
    procedure ppDBTextPtnNoPrint(Sender: TObject);
    procedure RReportKousyuPtnEndPage(Sender: TObject);
    procedure CmnPrjComboChange(Sender: TObject);
    procedure CmnPrjComboExit(Sender: TObject);
    procedure CmnToolbarButtonTagsClick(Sender: TObject);
    procedure fnCmnToolbarDropDownMenuItemOnClick (Sender: TObject);

    procedure fnStdCmnGridPopupMenuTagOnClick(Sender: TObject);                 // 備考無し
    procedure fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);
    procedure DdxDBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StdCmnGridPopupMenuPopup(Sender: TObject);
    procedure DdxDBGrid2DblClick(Sender: TObject);
    procedure CmnTreeViewDblClick(Sender: TObject);
    procedure evtDdxDBGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CmnTreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);                             // 備考有り

  private
    { Private 宣言 }
	m_pMyAppRecord		: ^TMjsAppRecord;
    MDataModule			: TMDataModulef;
    ComArea				: TJNTMASCom;
    m_cJNTArea          : TJNTCommon;
	dbCorp_Select   	: TFDConnection;                                            // 子会社DB
    MjsMsgRec			: TMJSMsgRec;

	m_ACControl 	    : TWinControl; 	                                        // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
	mjspreview			: TMjsPreviewIF;
    uvExpOpenSW         : Boolean;                                              // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)　
	giReferFlag			: Integer;					                            // 参照ﾌﾗｸﾞ
	m_iMailKbn			: Integer;
    m_CodeAttr          : Integer;
    m_CodeDigit         : Integer;
	m_strValidCharacters: String;
    m_fUpdateRecord     : Boolean;
	m_fUnderConstruction: Boolean;
	m_cNodePrevSelect   : TTreeNode;
    m_fAccessTab        : Boolean;

    m_KojiFlg           : Boolean;
    m_KousyuFlg         : Boolean;

    m_PtnFlg            : Boolean;                                              // KousyuPtnMAの存在ﾌﾗｸﾞ(True:ﾚｺｰﾄﾞあり、False:ﾚｺｰﾄﾞなし)

    m_DlgOpen           : Boolean;
    m_SetPrj            : Boolean;

    m_PtnNCode          : Extended;                                             // Ncode
    m_Code              : Integer;                                              // PtnNO
    m_Name              : String;                                               // PtnName
    m_End               : Boolean;
    m_KousyuName        : String;
    m_ComboItem         : Integer;
    m_ComboItemPrj      : Integer;

	m_nOrderDivision	: Integer;								                // 印刷範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr	: String;								                // 印刷開始工種ｺｰﾄﾞ
	m_strExCodeScopeEnd	: String;								                // 印刷終了工種ｺｰﾄﾞ
	m_intExCodeScopeStr	: Integer;								                // 印刷開始工種ﾊﾟﾀｰﾝｺｰﾄﾞ
	m_intExCodeScopeEnd	: Integer;								                // 印刷終了工種ﾊﾟﾀｰﾝｺｰﾄﾞ
	m_strExCodePrint    : String;

    m_TantoNCode        : Extended;
	m_nDBErrorCode		: Integer;

    m_FusenClrIdx       : Integer;

    m_IsUpdate          : Boolean;

    m_OccupiedFlg       : Boolean;
    m_bFirstFlag        : Boolean;

    uvSelSys            : TJNTSelCorpSys; 	                                    // 会社ｼｽﾃﾑ情報
    uvHani              : TJNTHani;		                                        // 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	: TPrintAppEntry;                                       //
    ArrHdl              : Array[0..100] of Pointer;			                    // Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    : rcPrtParam;                                           //
    DmqPrint            : TMQuery;                                              // 印刷用ｸｴﾘｰ

    m_SyncMaster        : TSyncMaster;                                          // <012>

// <032> ADD start
																				// 共有してしまうためｸﾗｽに変数を定義
    uvKMasteKbn : Integer;
    m_KousyuKbn : Integer;
// <032> ADD end

// <034> ADD start
	m_aryFusenData		: Array of FusenCmntRec;
    m_iHintRow			: Integer;
// <034> ADD end

    function    fnNCodeGet(pGCode:String):Extended;
	function    MakeSQL(nType: Integer):String;
    procedure   WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
	function	fnCheckRequisiteItem(iMstKbn: Integer): Integer;
    procedure   KousyuGridDataSet();
    procedure   KousyuPtnGridDataSet();
    procedure   TreeMake();
    function    fnCheckMasterDataRecordValid(strExCode: String): Boolean;
    procedure   fnChangeSelectionScreen();
    procedure   GridToTreeSet();
    procedure   TreetoGridSet();
    procedure   RecordDelete(strExCode  : String);
    function    CheckSyokutiRecDelete(): Boolean;
    procedure   DelteBtnCheck();
    procedure   DisplayControl(Select: Integer);
	procedure   ErrorMessageDsp(DmQuery: TMQuery);
    procedure   fnUpdateTreeViewItemsEx(cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent: TTreeNode);
    procedure   PrintKousyu();
    procedure   PrintKousyuPtn();
	procedure	fnSetFileOutTF(PrintDivision: Integer; var sTitle: TStringList; var sMemFld: TStringList);
    procedure   fnChgBtnAction();

    procedure   fnGetMasterInfo;
    function    fnGetMstKbn(pIndex:Integer):Boolean;
    function    fnCheckExCodeValidCharacter(strHojCode: String): Boolean;

    procedure   fnChangeCondition(fEnable: Boolean);

    function	fnUpdateMasterDataTagInfo(cExCode: Extended; var nTagKind: Integer): Boolean;
    procedure	fnUpdateGridMemDataRecord(nDivision: Integer; strExCode: String; nTagKind: Integer);
    procedure	fnOutputDBErrorMessage();
    function    fnGetTagColorBitmap(nTagColor: Integer): TBitmap;
    procedure	fnSetGridTagInfo(nTagKind: Integer);
    procedure	fnFusenEnabled(fEnabled:Boolean);
    function	fnGetMasterDataTagInfo(cNCode: Extended): Integer;
    procedure   fnGetGrants();
    function    fnDelCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;

    function    fnCorpRelation(var pSync: SyncKey; pType: Integer): Integer;    // <012>
	procedure	SessionPractice(iSyori: Integer);	// <038>
	procedure   fnEdgeTrackerKeihiSeisanMsg();  // <042> add

  public
    { Public 宣言 }
	constructor CreateForm(pRec: Pointer);
	procedure	CMChildkey(var Msg: TWMKey); message CM_CHILDKEY;
	procedure   WMSetFocus(var Msg: TWMSetFocus);  message WM_SETFOCUS;
  end;

const
	// 参照ﾌﾗｸﾞ時に使用
	NORMAL			    = 1;		                                            // 通常処理
	BASICONLY		    = 2;                                                    // 基本のみ設定可能(詳細ﾎﾞﾀﾝ使用不可)
	REFER			    = 3;                                                    // 参照

	// ﾃｰﾌﾞﾙ番号
	TBL_MASTERINFO	    = 10;
	TBL_HOJYOMA		    = 111;
    TBL_KOUSYUPTN       = 118;

	REQUISITE_OK		= 0;
	REQUISITE_CANCEL	= 1;
	REQUISITE_EXIT		= 9;

	DIVISION_GENERAL	= 11;
	DIVISION_NEWRECORD	= 99;

    ColumnGCode         = 1;
    ColumnRenso         = 2;
    ColumnName          = 3;
    ColumnSimpleName    = 4;

// <032> ADD start
    ucSKO_MKBN          = 201;
    ucEKO_MKBN          = 210;
// <032> ADD end

	// -----<038> Add-St-----
	C_ST_PROCESS		= 0;					// 設定
	C_ED_PROCESS		= 1;					// 開放
	// -----<038> Add-Ed-----

    function AppEntry(pParam:Pointer)	: Integer;
exports
	AppEntry;

implementation

// <032> DEL start
											// ここに記述すると共有で参照してしまう為、ｸﾗｽに移動
(*var
    uvKMasteKbn : Integer;
    m_KousyuKbn : Integer;

    Const ucSKO_MKBN = 201;
    Const ucEKO_MKBN = 210;
*)
// <032> DEL end

{$R *.DFM}
{$include JNTMASFUSENBIKODLGIFB.inc}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTCRPSyncMasterB.inc}            // <012> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}             // <020> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部

//**************************************************************************
//	Proccess	:	外部ﾌﾟﾛｸﾞﾗﾑからのｴﾝﾄﾘﾎﾟｲﾝﾄ
//	Name		:
//	Date		:	2004/09/02
//	Parameter	:	pParam	Pointer
//	Retrun		:	result
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function AppEntry(pParam: Pointer): Integer;
var
	pMyForm	:	^TJNTCRP018004f;
	pRec    :	^TMjsAppRecord;
begin
	result	:= ACTID_RET_OK;
	pRec	:= Pointer(TAppParam(pParam^).pRecord);

	case TAppParam(pParam^).iAction of

		ACTID_FORMCREATESTART:							                        // ﾌｫｰﾑの作成要求（作成のみ）
		begin
			new (pMyForm);
			try
				pMyForm^:= TJNTCRP018004f.CreateForm(pRec);
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				result	:= ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCREATESHOWSTART:						                        // ﾌｫｰﾑの作成要求（作成&表示）
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP018004f.CreateForm(pRec);
				pMyForm^.Show;
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				result	:= ACTID_RET_NG;
			end;
		end;

		ACTID_FORMCLOSESTART:                                                   // ﾌｫｰﾑの解放要求							
		begin
			pMyForm	:= Pointer(pRec^.m_pChildForm);
			pMyForm^.Close();
			pMyForm^.Free();
			Dispose(pMyForm);
		end;

		ACTID_FORMCANCLOSESTART:                                                // ﾌｫｰﾑの解放直前要求
		begin
			pMyForm	:= Pointer(pRec^.m_pChildForm);
			if pMyForm^.CloseQuery = False then
				result	:= ACTID_RET_NG;
		end;

		ACTID_SHOWSTART:                                                        // ﾌｫｰﾑの表示要求
		begin
			pMyForm	:= Pointer(pRec^.m_pChildForm);
			pMyForm^.Show();
		end;

		ACTID_HIDESTART:
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );

			if pMyForm^.Parent <> nil then
			begin
				pMyForm^.Hide;
			end;
		end;
	end;
end;


//**************************************************************************
//	Proccess	:	ﾌｫｰﾑｺﾝｽﾄﾗｸﾄ
//	Name		:	unknown
//	Date		:	2004/09/02
//	Parameter	:	pRec	Pointer
//	Retrun		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
constructor TJNTCRP018004f.CreateForm(pRec: Pointer);
var
	DmqData		:	TMQuery;
	sMessage	:	String;
begin

	// 初期処理
	dbCorp_Select   := nil;
	m_fAccessTab	:= False;
    m_KojiFlg       := False;
    m_KousyuFlg     := False;
    m_DlgOpen       := False;
    m_End           := False;
    m_bFirstFlag    := False;
    m_FusenClrIdx   := 0;
	m_nDBErrorCode	:= 0;
    m_PtnNCode      := 0;
    m_Code          := 0;
    m_Name          := '                              ';

    DmqData         := Nil;

    // 共通ﾏｽﾀ基本ｸﾗｽ
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
	m_cJNTArea.setMasAppRecord;

	m_pMyAppRecord	:= pRec;											        // 構造体のSave

	MDataModule		:= TMDataModulef(m_pMyAppRecord^.m_pDBModule^);		        // DBModuleを取得
	ComArea			:= TJNTMASCom   (m_pMyAppRecord^.m_pSystemArea^);	 	    // 会社Noを共通ﾒﾓﾘから取得
    m_TantoNCode    := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;   // <037>

	// DBOpen
    dbCorp_Select := MDataModule.COPDBOpen( 1, m_pMyAppRecord.m_iCorpID);		// DB Open

	if dbCorp_Select = nil then
	begin
		ComArea.m_MsgStd.GetMsg(MjsMsgRec,10000,MDataModule.GetStatus);
		MjsMessageBoxEx(Self,MjsMsgRec.sMsg,
						MjsMsgRec.sTitle,
						MjsMsgRec.icontype,
						MjsMsgRec.btntype,
						MjsMsgRec.btndef,
						MjsMsgRec.LogType);

		raise Exception.Create('');
        ShowMessage ('エラー');
        raise   EMathError.Create ('エラー');
	end;

    try
        // MQueryの構築
        DmqData := TMQuery.Create( Self );
        // 子会社DBとMQueryの接続
        MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );

        // ﾏｽﾀ履歴用のｽﾄｱﾄﾞ(開始)を実行(子会社用)
        DmqData.Close;
        DmqData.SQL.Clear;
        DmqData.SQL.Add(MakeSQL(1));
        DmqData.SetFld('TANCD').AsFloat := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

        if (DmqData.ExecSQL = False) then
        begin
            sMessage := IntToStr(ComArea.m_MsgStd.GetDBCode(DmqData));
            showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ﾏｽﾀ履歴ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりました。');
            raise Exception.Create( '' );
        end;

        // SyncMasterｸﾗｽの生成 <012>
        try
            m_SyncMaster := TSyncMaster.Create(Self, m_pMyAppRecord, m_cJNTArea, dbCorp_Select);
            m_SyncMaster.InitData;
        except
            raise;
        end;

    finally
        DmqData.Close;
        DmqData.Free;
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pMyAppRecord) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
            Abort;
    except
		MjsMessageBox(self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
    	if ( uvSelSys.CreateSysInfo(dbCorp_Select) <> 0 ) then
            Abort;
    except
        MjsMessageBox(self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;

    m_SyncMaster.m_AOwner := TForm(m_pMyAppRecord^.m_pOwnerForm^);              // <012>
    inherited Create(TForm(m_pMyAppRecord^.m_pOwnerForm^))

end;

//**********************************************************************
//*		Proccess	:	ｽﾄｱﾄﾞのSQL文作成
//*		Name		:	H.Endo
//*		Date		:	2001/2/15
//*		Parameter	:	nType:	ｽﾄｱﾄﾞの開始(1 or 10)/終了(2 or 20)
//*		Return		:	作成したSQL文
//*		History		:
//**********************************************************************
function TJNTCRP018004f.MakeSQL(nType: Integer): String;
var
	sSQL : String;
begin

	sSQL := '';
	case nType of
        1:  sSQL := 'CALL MP200010(0, :TANCD)';                                 // ｽﾄｱﾄﾞの開始
    	2:	sSQL :=	'CALL MP200010(1)';                                         // ｽﾄｱﾄﾞの終了
        10: sSQL := 'CALL MP200011(0, :SEGCD)';                                 // ｽﾄｱﾄﾞの開始
    	20:	sSQL :=	'CALL MP200011(1)';                                         // ｽﾄｱﾄﾞの終了
    end;

	Result	:=	sSQL;

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnActivate
//	Name	    :	unknown
//**************************************************************************
procedure TJNTCRP018004f.FormActivate(Sender: TObject);
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
//	Name	    :	unknown
//**************************************************************************
procedure TJNTCRP018004f.FormCreate(Sender: TObject);
var
    Qe          :   TMQuery;
	i			:	Integer;
    iRet        :   Integer;
    lvHandle    :   THandle;

    strLine     :   String;
    strWkLine   :   String;

begin
	// -----<038> Add-St-----
	SPMsHist.Connection := dbCorp_Select;
	//SPMsHist.SessionName  := dbCorp_Select.SessionName;

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<038> Add-Ed-----

	Parent	:= TPanel(m_pMyAppRecord^.m_pOwnerPanel^);		                    // 親ﾊﾟﾈﾙをParent
	Align	:= alClient; 							 		                    // 全領域を作成


	MjsColorChange(				                                                // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP018004f(Self),
					ComArea .SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor
				  );

    fnGetGrants();                                                              // 権限取得

	mjspreview := TMjsPreviewIF.Create;
	mjspreview.Init( m_pMyAppRecord );

	Qe  := TMQuery.Create (Self);			                                    // MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		                    //	DBとMQueryの接続

    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.Add('select YearKbn, ComKbn3, ComKbn4, DTName7, DataKbn from DTMAIN,DTMAIN_MAS ');
    Qe.Open;
	m_strValidCharacters := Qe.GetFld('DTName7').AsString;					    // 使用可能ｺｰﾄﾞ

    Qe.Close;

    m_ComboItem    := -1;
    m_ComboItemPrj := -1;
    m_SetPrj       := False;

    fnGetMasterInfo;

    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.Add('SELECT ComKbn3 FROM DTMAIN_MAS ');
    Qe.Open;

    if not Qe.Eof then
        m_iMailKbn  := Qe.GetFld('ComKbn3').AsInteger;

//	giReferFlag		:=	NORMAL;						// 参照ﾌﾗｸﾞ初期化


{<01>
    //	メール会計によって通常処理・基本のみ設定・参照を切り替える
//	(NORMAL:通常処理,BASICONLY:基本のみ設定可能,REFER:参照のみ)

	KousyuMaster    :=	aMailEntCheck(dbCorp_Select,MDataModule,ComArea,51,1);	//	ﾒｰﾙ会計登録権利をCheck  //工種登録は工事と同一の登録権利制御を行う
	case KousyuMaster of
		DISPOSE_SETTLE,	                        //決算確定の為参照のみ
		DISPOSE_OFFLINELICENSE:                 //オフラインのため参照のみ
		begin
			giReferFlag	:=	REFER;
		end;

		DISPOSE_MAILNOTUSE,		                //メール未採用の為通常処理
		DISPOSE_USUALLY:		                //通常処理
		begin
			giReferFlag	:=	NORMAL;
		end;

		DISPOSE_BASIC:			                //基本のみ設定可能
		begin
			giReferFlag	:=	BASICONLY;
		end;

		DISPOSE_REFER:	giReferFlag	:=	REFER;	//参照のみ
	end;
}
//    giReferFlag	:=	NORMAL;

	DisplayControl(giReferFlag);

//	if (m_iMailKbn = 1) or (giReferFlag = REFER) then
//		BSpeedButtonDel.Visible := False;
	BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;

	MPnlCount.Align := alNone;
	MPnlCount.Align := alRight;

    m_fAccessTab	    := True;
    m_fUpdateRecord     := FALSE;
	m_cNodePrevSelect	:= nil;

	MjsFontResize(TJNTCRP018004f( Self )	,Pointer(m_pMyAppRecord));

    Qe.Close;
    Qe.Free;

    PPanelKousyu.Visible    := True;
    PPanelPtn.Visible       := False;

    // ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続<PRN>
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

	try
//<039> DEL		lvHandle := LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP018004L.BPL');
		lvHandle := LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP018004L.BPL');  //<039> ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(self, 'JNTCRP018004LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(self, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
//<039> DEL    	UnloadPackage( lvHandle );
    	UnloadPackageHelper( lvHandle );  //<039> ADD
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

		iRet := PrintAppEntry(self,m_pMyAppRecord,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(self,
                 m_pMyAppRecord,
                 MDataModule,
                 ComArea,
                 dbCorp_Select,
                'JNTCRP018004',
                 uvHani,
                 uvSelSys);

   	PostMessage( Self.Handle,WM_ONPAINT,0,0 );		// OnPaint Post

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnClose
//	Name	    :	unknown                                                 
//**************************************************************************
procedure TJNTCRP018004f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam  : TAppParam;
	DmqData  : TMQuery;
	sMessage : String;
    Dlg      : TJNTSyncMasterIF;       // <020>
    IDs      : Array[0..2] of integer; // <020>
begin
    DmqData := Nil;

    // <020> - ST
    // ｸﾞﾙｰﾌﾟ会社ありの場合
    // <025>if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    if ( m_SyncMaster.m_flgGrpCorp in [0,1] ) then   // <025>
    begin
// <031> MOD start
(*
        IDs[0] := JNTSYNC_HojyoMA;
        IDs[1] := JNTSYNC_KousyuPtnMA;
        IDs[2] := JNTSYNC_KousyuPtn;
        Dlg := TJNTSyncMasterIF.Create (Self, m_pMyAppRecord);

        try
            Dlg.ShowDlg(IDs);
    	finally
    		Dlg.Free;
    		Dlg:=nil;
    	end;
*)
		if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or        	// 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_KojiFlg) and  				// 工事採用あり
		   (m_KousyuFlg) and                // 工種採用あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
        begin
        	IDs[0] := JNTSYNC_HojyoMA;
        	IDs[1] := JNTSYNC_KousyuPtnMA;
        	IDs[2] := JNTSYNC_KousyuPtn;
        	Dlg := TJNTSyncMasterIF.Create (Self, m_pMyAppRecord);

        	try
            	Dlg.ShowDlg(IDs);
    		finally
    			Dlg.Free;
    			Dlg:=nil;
    		end;
		end;
// <031> MOD end
    end;
    // <020> - ED

    try
        // DBとMQueryの接続(子会社用)
        DmqData := TMQuery.Create( Application );
        MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );

        // ﾏｽﾀ履歴用のｽﾄｱﾄﾞ(終了)を実行(子会社用)
        DmqData.Close;
        DmqData.SQL.Clear;
        DmqData.SQL.Add(MakeSQL(2));

        if (DmqData.ExecSQL = False) then
        begin
            sMessage :=	IntToStr(ComArea.m_MsgStd.GetDBCode(DmqData));
            showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage);
        end;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

    // Syncｸﾗｽ 開放 <012>
    m_SyncMaster.fnSyncTerm();

    // 共通ﾏｽﾀ基本ｸﾗｽの開放
    m_cJNTArea.Free;

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

    // 印刷用ｸｴﾘｰの開放
    DmqPrint.Close();
    DmqPrint.Free();

    // 販売ｼｽﾃﾑ情報の開放
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

	m_fUnderConstruction := True;

	MDataModule.COPDBClose(dbCorp_Select);				                        // 子DB Close

    // 親会社DBのClose <012>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        MDataModule.COPDBClose( m_SyncMaster.m_cPDBSelect );
    end;

	m_pMyAppRecord^.m_iDelete := 1;
	wkParam.iAction			  := ACTID_FORMCLOSEEND;		                    // 呼び出し区分 設定
	wkParam.pRecord			  := Pointer(m_pMyAppRecord);                       // 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	  := nil;                                           // 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);                     // 親を呼び出す!!
	Action	:= caFree;

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnDestroy
//	Name	    :	unknown
//**************************************************************************
procedure TJNTCRP018004f.FormDestroy(Sender: TObject);
begin

	mjspreview. Term();
	mjspreview. Free();

    // 終了処理
	gfnHaniTerm(uvHani);

    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  nil;
        JNTArea     :=  nil;
	end;

    // 開放
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

    // Sync ｸﾗｽ 解放 <012>
    if ( m_SyncMaster <> nil ) then
		m_SyncMaster.Free();

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	OnCloseQuery
//	Name	    :	unknown
//**************************************************************************
procedure TJNTCRP018004f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

    if ( uvHani.mjspre <> nil )then
    begin
        if ( uvHani.mjspre.IsPreView = TRUE ) then
        begin
            ComArea.m_MsgStd.GetMsg( MjsMsgRec, 10040,2);
            Beep;
            MjsMessageBoxEx(Self, MjsMsgRec.sMsg, MjsMsgRec.sTitle, MjsMsgRec.icontype,
                                MjsMsgRec.btntype, MjsMsgRec.btndef, MJsMsgRec.LogType);
            CanClose := False;
        end
        else
        begin
            CanClose := True;
        end;
    end;

end;

//**************************************************************************
//	Component	:	Form
//	Event	    :	FormHide
//	Name	    :	unknown
//**************************************************************************
procedure TJNTCRP018004f.FormHide(Sender: TObject);
begin

	if mjspreview.IsPreView then
		mjspreview.Hide;

end;

//**************************************************************************
//	Component	:	bDocking ( TMSpeedButton )
//		    			ﾂｰﾙﾊﾞｰの取出ﾎﾞﾀﾝ
//	Event		:	OnClick
//	Name		:	unknown
//**************************************************************************
procedure TJNTCRP018004f.BSpeedButtonChgClick(Sender: TObject);
begin

	m_fUnderConstruction	:= TRUE;

    fnChgBtnAction;

	m_fUnderConstruction	:= FALSE;

end;

//**************************************************************************
//	Component	:	OnClick ( TMSpeedButton )
//                      ｽﾋﾟｰﾄﾞﾎﾞﾀﾝ → 終了
//	Event		:	OnClick
//**************************************************************************
procedure TJNTCRP018004f.BSpeedButtonEndClick(Sender: TObject);
begin

    m_End := True;
    Close();

end;


//**************************************************************************
//	Component  :	Form
//	Event	    :	OnPaint ( ﾕｰｻﾞｰﾒｯｾｰｼﾞ)
//	Name	    :	T.Nobezawa
//**************************************************************************
procedure TJNTCRP018004f.WMOnPaint(var Msg: TMessage);
var
	stMessageRec    : TMJSMsgRec;
begin
    //工事が採用されていない時
    if m_KojiFlg = False then
    begin
       	ComArea.m_MsgStd.GetMsg (stMessageRec, 30, 10);

	    stMessageRec.sMsg	:= ComArea.m_MsgStd.MsgChange (stMessageRec.sMsg, '@_@', '工事');

    	MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
	    									stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);


    	Close;

        Exit;
    end;


    //作業内訳が採用されていない時
    if m_KousyuFlg = False then
    begin
   	ComArea.m_MsgStd.GetMsg (stMessageRec, 30, 10);

	    stMessageRec.sMsg	:= ComArea.m_MsgStd.MsgChange (stMessageRec.sMsg, '@_@', '作業内訳');

    	MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
	    									stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

    	Close;

        Exit;
    end;

    CmnPrjCombo.ItemIndex := 0;

    if m_pMyAppRecord.m_sParameter = '1' then
    begin
        CmnPrjCombo.Enabled := False;            // 工事は1つしかないので選択させないように
        fnGetMstKbn(0);
        fnChangeSelectionScreen;
    end
    else
        CmnInstructionCombo.Enabled := False;

    if m_pMyAppRecord.m_sParameter = '1' then
    begin
        // 工種登録
        lTitle.Caption := '工 事';
        m_ACControl := CmnInstructionCombo;
    end
    else
    begin
        // 作業内訳登録
        lTitle.Caption := 'プロジェクト';
        m_ACControl := CmnPrjCombo;
    end;

    m_AcControl.SetFocus; //←ﾌｫｰｶｽを当てるとDropDown = Falseになる？

    // 初期のみ一回の処理
	if ( m_bFirstFlag = False ) then
	begin
		if ( m_AcControl = CmnPrjCombo ) then
    	begin
			CmnPrjCombo  .DroppedDown   :=  True;
	    end else
            CmnInstructionCombo.DroppedDown   :=  True;

    	m_bFirstFlag                :=  True;
    end;

end;

//**************************************************************************
//	Proccess	:	初期表示
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.fnChangeSelectionScreen;
var
	nReturn	: Integer;
    Qe      : TMQuery;
begin

    m_SetPrj := false;

    if ( m_DlgOpen ) then Exit;

    // 入力画面を使用不可にする
    PPanelKousyu.Enabled := False;
    PPanelPtn.Enabled    := False;

    // ｸﾞﾙｰﾌﾟ会計[採用/ｺｰﾄﾞ属性,桁数ﾁｪｯｸ] <012>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        case m_SyncMaster.fnChkP_MasterInfo( m_KousyuKbn ) of
            -1: begin
                    MjsMessageBoxEx(Self,
                                '全社にて当該マスタが採用されていません。'#13#10
                                    + '全社で当該マスタを採用してください。',
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Abort;
                    Exit;
                end;
            -2: begin
                    MjsMessageBoxEx(Self,
                                'マスタのコード属性、桁数が、'#13#10
                                    + '全社と子会社で異なっています。'#13#10
                                    + '会社基本情報をご確認ください。',
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Abort;
                    Exit;
                end;
            -9: begin   // 例外ｴﾗｰ
                    Abort;
                    Exit;
                end;
        end;
    end;

    // 工種登録
    if ( CmnInstructionCombo.ItemIndex = 0 ) then
    begin
        // ｸﾞﾙｰﾌﾟ会計採用時には、処理開始時にﾏｽﾀ同期処理を起動 <012>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA);

        Qe := TMQuery.Create(Self);

        try
            MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );

            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('select * from HojyoMA      ');
            Qe.SQL.Add('where MasterKbn = :pMstKbn ');
            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
            Qe.Open;

            // 諸口ﾁｪｯｸ(ﾀﾞｲｱﾛｸﾞの表示)
            nReturn	:= fnCheckRequisiteItem( m_KousyuKbn );

            if (( nReturn = REQUISITE_CANCEL )  or
                ( nReturn = REQUISITE_EXIT   )) then
            begin
                // 画面使用制御(使用不可)
                fnChangeCondition(False);
                Abort;
            end;

            m_SetPrj := True;
            // 画面使用制御(使用可)
            fnChangeCondition(True);

            // 画面の表示(作業内訳/工種ｸﾞﾘｯﾄﾞ)
            KousyuGridDataSet();
        finally
            Qe.Close;
            Qe.Free;
        end;
    end
    // 工種ﾊﾟﾀｰﾝ
    else
    begin
        // ｸﾞﾙｰﾌﾟ会計採用時には、処理開始時にﾏｽﾀ同期処理を起動 <012>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtnMA);
            m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE);        // <026>
        end;

        // 画面の表示
        PPanelKousyu.Visible := False;
        PPanelPtn.Visible    := True;
        PPanelPtn.Enabled    := true;   // <014>
    end;

    m_DlgOpen := False;

end;

//**************************************************************************
//	Proccess	:	諸口ﾁｪｯｸ
//	Name		:
//	Date		:
//	Parameter	:   nMasterDivision : ﾏｽﾀ区分
//                  nCodeDigit		: ｺｰﾄﾞ桁数
//                  nCodeAttribute	: ｺｰﾄﾞ属性
//	Return		:   Integer
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004f.fnCheckRequisiteItem(iMstKbn: Integer): Integer;
var
	cDlgRequisite : TJNTCRP018004_D2f;    // 諸口ﾀﾞｲｱﾛｸﾞ
	dqMasterData  : TMQuery;
	nReturn		  : Integer;
	fNoRecord     : Boolean;
    iMastKbn      : Integer;
    nPNCode       : Extended;
    bRet          : Boolean;
begin

	fNoRecord := True;
	nReturn	  := REQUISITE_OK;

	dqMasterData := TMQuery.Create ( Self );
    MDataModule.SetDBInfoToQuery ( dbCorp_Select, dqMasterData );

	with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('select * from HojyoMA           ');
        SQL.Add('where (MasterKbn = :pMasterKbn) ');
        SQL.Add(' and  (Syokuchikbn = 1)         ');
        SQL.Add(' and  (RDelKbn     = 0)         ');
        ParamByName('pMasterKbn').AsInteger := iMstKbn;

        if ( Open() = false ) then
        begin
            // SQLｴﾗｰ
            ComArea.m_MsgStd.GetMsgDB ( MjsMsgRec, dqMasterData );
            with MjsMsgRec do
                MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);

            result := REQUISITE_EXIT;
            exit;
        end;

        // 既に諸口ﾃﾞｰﾀが登録済みの場合、諸口登録DLGは表示しない
		if ( not EOF ) then
			fNoRecord := False;

		Close();
    end;

	if ( fNoRecord ) then
	begin
		if ( giReferFlag = REFER ) then
		begin
			dqMasterData.Close();
			dqMasterData.Free();

			result := REQUISITE_EXIT;
			exit;
		end;

        // ｸﾞﾙｰﾌﾟ会計有の場合 <012>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            dqMasterData.Close();
            // 親会社DBとMQueryの接続
            MDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, dqMasterData );

            dqMasterData.Close();
            dqMasterData.SQL.Clear();
            dqMasterData.SQL.Add('select * from HojyoMA        ');
            dqMasterData.SQL.Add('where (MasterKbn = :pMstKbn) ');
            dqMasterData.SQL.Add(' and  (Syokuchikbn = 1)      ');
            dqMasterData.SQL.Add(' and  (RDelKbn     = 0)      ');
            dqMasterData.ParamByName('pMstKbn').AsInteger := iMstKbn;

            if ( dqMasterData.Open() = false ) then
            begin
                // SQLｴﾗｰ
                ErrorMessageDsp(dqMasterData);
                Abort;
            end;

            // 親会社DBに「諸口」が存在していた場合は、諸口ﾏｽﾀ同期処理を行う
            if ( not dqMasterData.EOF ) then
            begin
                iMastKbn := dqMasterData.GetFld('MasterKbn').AsInteger;
                nPNCode  := dqMasterData.GetFld('NCode'    ).AsFloat;

                dqMasterData.Close();
                dqMasterData.SQL.Clear();
                dqMasterData.SQL.Add('select * from HojyoMA_Rel           ');
                dqMasterData.SQL.Add('where (MasterKbn   = :pMstKbn)      ');
                dqMasterData.SQL.Add(' and  (NCode       = :pNCode)       ');
                dqMasterData.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');
                dqMasterData.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( dqMasterData.Open() = false ) then
                begin
                    // SQLｴﾗｰ
                    ErrorMessageDsp(dqMasterData);
                    Abort;
                end;

                if ( dqMasterData.Eof ) then
                        bRet := True
                else    bRet := False;

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );

                try
                    // 親会社のHojyoMA_Relの更新
                    if ( bRet ) then    // 新規挿入
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('insert into HojyoMA_Rel (            ');
                        dqMasterData.SQL.Add('    MasterKbn ,NCode ,GrpSegNCode    ');
                        dqMasterData.SQL.Add('   ,RDelKbn_REL)                     ');
                        dqMasterData.SQL.Add('values (                             ');
                        dqMasterData.SQL.Add('    :pMstKbn ,:pNCode                ');
                        dqMasterData.SQL.Add('   ,:pGrpSegNCode, 0)                ');
                    end
                    else                // 更新
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('update HojyoMA_Rel set               ');
                        dqMasterData.SQL.Add('    RDelKbn_REL = 0                  ');
                        dqMasterData.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                        dqMasterData.SQL.Add('where  (MasterKbn   = :pMstKbn)      ');
                        dqMasterData.SQL.Add('  and  (NCode       = :pNCode)       ');
                        dqMasterData.SQL.Add('  and  (GrpSegNCode = :pGrpSegNCode) ');
                    end;

                    dqMasterData.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                    dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    if ( dqMasterData.ExecSQL = false ) then
                    begin
                        MjsMessageBoxEx (Self,
                                         '自社への関連付けに失敗しました。',
                                         'マスタ同期', mjError, mjOk, mjDefOk);
                        Abort;
                    end;

                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = False ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback ( dbCorp_Select );
                        Abort;
                    end;
                except
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback ( dbCorp_Select );
                    Abort;
                end;

                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit ( dbCorp_Select );
                nReturn	  := REQUISITE_OK;
                result := nReturn;
                Exit;
            end;
        end;

        // 諸口登録ﾀﾞｲｱﾛｸﾞの表示
		cDlgRequisite := TJNTCRP018004_D2f.fnCreateDialog(
                            Pointer(m_pMyAppRecord), Self, dbCorp_Select, m_KousyuKbn,
                            m_CodeDigit, m_CodeAttr, m_strValidCharacters, @m_SyncMaster); // <012>

		if ( cDlgRequisite.ShowModal() = mrCancel ) then
			nReturn	:= REQUISITE_CANCEL;

		cDlgRequisite.Close();
		cDlgRequisite.Free();
	end;

	dqMasterData.Close();
	dqMasterData.Free();

	result := nReturn;

end;

//**************************************************************************
//	Proccess	:	工種データをGridにセット
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.KousyuGridDataSet;
var
    Qe          :   TMQuery;
	strExCode   :   String;
	strFormat   :   String;
    nTagKind    :   Integer;
begin

	Qe  := TMQuery.Create (Self);			                // MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		//	DBとMQueryの接続

    m_fUpdateRecord := False;

    DKousyuMemData.Close;
    DKousyuMemData.Open;

    DKousyuDataSource.DataSet := nil;   // <013>
    DdxDBGrid.BeginUpdate;              // <013>

    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.Add('Select HM.NCode,HM.GCode,HM.Renso,HM.LongName,HM.SimpleName,');
    Qe.SQL.Add('FI.FusenKbn,FI.FusenCmnt ');
    Qe.SQL.Add('from HojyoMA HM ');
    Qe.SQL.Add('Left outer join MFusenInfo FI on ');
    Qe.SQL.Add('FI.MasterKbn = HM.MasterKbn and FI.NCode = HM.NCode ');

   	Qe.SQL.Add('where  HM.MasterKbn=:pMstKbn ');
    Qe.SQL.Add('and    HM.SumKbn    = 0  ');
    Qe.SQL.Add('and    HM.RDelKbn = 0  ');
    Qe.SQL.Add('Order  By HM.GCode       ');
    Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

    if Qe.Open = False then
    begin
        ErrorMessageDsp(Qe);
        Qe.Close;
        Qe.Free;
        Exit;
    end;

    while not Qe.Eof do
    begin

        if m_CodeAttr <= 1 then
        begin
        	case (m_CodeAttr) of
    			0:	strFormat	:= '%'  + IntToStr (m_CodeDigit) + 'd';
		    	1:	strFormat	:= '%.' + IntToStr (m_CodeDigit) + 'd';
    		end;
        	strExCode	:= Format (strFormat, [StrToInt64 (Trim (Qe.FieldByName('GCode').AsString))]);
        end
        else
        	strExCode	:= Qe.FieldByName('GCode').AsString;


        nTagKind := Qe.FieldByName('FusenKbn').AsInteger;

        DKousyuMemData.Append;
        DKousyuMemData.FieldByName('NCode'      ).AsFloat    := Qe.FieldByName('NCode').AsFloat;
        DKousyuMemData.FieldByName('GCode'      ).AsString   := strExCode;
        DKousyuMemData.FieldByName('Renso'      ).AsString   := Qe.FieldByName('Renso'   ).AsString;
        DKousyuMemData.FieldByName('LongName'   ).AsString   := Qe.FieldByName('LongName'  ).AsString;
        DKousyuMemData.FieldByName('SimpleName' ).AsString   := Qe.FieldByName('SimpleName').AsString;

		DKousyuMemData.FieldByName('grTag'      ).AsSign (fnGetTagColorBitmap (nTagKind));
        DKousyuMemData.FieldByName('strComment' ).AsString   := Qe.FieldByName('FusenCmnt').AsString;
        DKousyuMemData.Post;


// <034> ADD start
		SetLength(m_aryFusenData, Length(m_aryFusenData) + 1);
		m_aryFusenData[Length(m_aryFusenData)-1].strCmnt := Qe.FieldByName('FusenCmnt').AsString;
// <034> ADD end

        Qe.Next;
    end;

    DKousyuDataSource.DataSet := DKousyuMemData;    // <013>
    DdxDBGrid.EndUpdate;                            // <013>

    m_fUpdateRecord := true;

    DKousyuMemData.First;

    Qe.Close;
    Qe.Free;
end;

//**************************************************************************
//	Proccess	:	コンボボックスアイテムチェンジ
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.CmnInstructionComboChange(Sender: TObject);
var
    iLoop       :   Integer;
  	stItemRec   :   ^TreeViewRec;
begin

    //情報区分Combo
    if not CmnInstructionCombo.DroppedDown then
    begin
        if CmnInstructionCombo.ItemIndex = 0 then
        begin
            EPtnNo.Value            := 0;
            EPtnName.Text           := '';
            m_PtnNCode              := 0;
            m_Code                  := 0;
            m_Name                  := '                              ';
            DPtnMemData.Close;

            for iLoop := 0 to CmnTreeView.Items.Count -1 do
            begin
                stItemRec   := CmnTreeView.Items[CmnTreeView.Items.Count -1].Data;

                Dispose(stItemRec);
                CmnTreeView.Items[CmnTreeView.Items.Count -1].Delete;
            end;
            PPanelKousyu.Visible    := True;
            PPanelPtn.Visible       := False;
        end
        else
        begin
            PPanelKousyu.Visible    := False;
            PPanelPtn.Visible       := True;
        end;

        m_ComboItem := CmnInstructionCombo.ItemIndex;

    end;

end;

//**************************************************************************
//	Proccess	:	会社関連付処理(ﾏｽﾀ同期) <012>
//	Name		:
//	Date		:
//	Parameter	:   pExCode : 外部ｺｰﾄﾞ
//                  pType   : 1.HojyoMA、2.KousyuPtn、3.KousyuPtnMA
//	Return		:   0: 対象外 1: 正常 2:ｷｬﾝｾﾙ -9:ｴﾗｰ
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004f.fnCorpRelation(var pSync: SyncKey; pType: Integer): Integer;
var
    Qe       : TMQuery;
    iMastKbn : Integer;
    iSumKbn  : Integer;
    nPNCode  : Extended;
    nKNCode  : Extended;
    bRet     : Boolean;
    iRet     : Integer;
    iSyncID  : Integer;
    nPName   : String;  // <016>
begin

    Result := 0;

    nKNCode  := 0;
    iSyncID  := 0;
    nPNCode  := 0;
    iRet     := 0;
    iMastKbn := 0;

    Qe := TMQuery.Create( Self );
    // 親会社DBとMQueryの接続
    MDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe );

    // 親DBの存在ﾁｪｯｸ
    Qe.Close();
    Qe.SQL.Clear();
    case pType of
    1:
    begin
        Qe.SQL.Add('select * from HojyoMA        ');
        Qe.SQL.Add('where (MasterKbn = :pMstKbn) ');
        Qe.SQL.Add(' and  (SumKbn    = 0)        ');
        Qe.SQL.Add(' and  (RDelKbn   = 0)        ');
        Qe.SQL.Add(' and  (GCode     = :pGCode)  ');

        Qe.ParamByName('pMstKbn').AsInteger := m_KousyuKbn;
        Qe.ParamByName('pGCode' ).AsString  := pSync.strGCode;
    end;
    2:
    begin
        Qe.SQL.Add('select * from KousyuPtn      ');
        Qe.SQL.Add('where (MasterKbn = :pMstKbn) ');
        Qe.SQL.Add(' and  (PtnNCode  = :pPtnNCd) ');
        Qe.SQL.Add(' and  (KsyNCode  = :pKsyNCd) ');

        Qe.ParamByName('pMstKbn').AsInteger := m_KousyuKbn;
        Qe.ParamByName('pPtnNCd').AsFloat   := pSync.nPtnNCode;
        Qe.ParamByName('pKsyNCd').AsFloat   := pSync.nKsyNCode;
    end;
    3:
    begin
        Qe.SQL.Add('select * from KousyuPtnMA    ');
        Qe.SQL.Add('where (PtnNo     = :pPtnNo)  ');
        Qe.SQL.Add(' and  (MasterKbn = :pMstKbn) ');        // <015>
        Qe.SQL.Add(' and  (RDelKbn   = 0)        ');        // <019>

        Qe.ParamByName('pPtnNo').AsInteger  := StrToInt(pSync.strGCode);
        Qe.ParamByName('pMstKbn').AsInteger := m_KousyuKbn; // <015>
    end;
    end;

    if ( Qe.Open = false ) then
    begin
        // SQLｴﾗｰ
        ErrorMessageDsp(Qe);
        result := -9;
        Exit;
    end;

    // 親会社に既に該当ﾃﾞｰﾀが存在した場合
    if not Qe.Eof then
    begin
        if ( pType = 1 ) then
            iRet := MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC + #13#10#13#10
                           + Qe.FieldByName('SimpleName').AsString,
                           '確認', mjQuestion, mjYESNO, mjDefNO)
        else if ( pType = 2 ) then
            iRet := mrYES
        else if ( pType = 3 ) then
            iRet := MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC + #13#10#13#10
                           + Qe.FieldByName('PtnName').AsString,
                             '確認', mjQuestion, mjYESNO, mjDefNO);

        if ( iRet = mrYES ) then
        begin
            // 親の_Relの存在ﾁｪｯｸ
            case pType of
            1:
            begin
                // HojyoMA_Relｷｰ情報を取得
                iMastKbn := Qe.FieldByName('MasterKbn').AsInteger;
                iSumKbn  := Qe.FieldByName('SumKbn'   ).AsInteger;
                nPNCode  := Qe.FieldByName('NCode'    ).AsFloat;

                Qe.Close();
                Qe.SQL.Clear();

                Qe.SQL.Add('select * from HojyoMA_Rel           ');
                Qe.SQL.Add('where (MasterKbn   = :pMstKbn)      ');
                Qe.SQL.Add(' and  (NCode       = :pNCode)       ');
                Qe.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');

                Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;
            end;
            2:
            begin
                // KousyuPtn_Relｷｰ情報を取得
                iMastKbn := Qe.FieldByName('MasterKbn').AsInteger;
                nPNCode  := Qe.FieldByName('PtnNCode' ).AsFloat;
                nKNCode  := Qe.FieldByName('KsyNCode' ).AsFloat;

                Qe.Close();
                Qe.SQL.Clear();

                Qe.SQL.Add('select * from KousyuPtn_Rel         ');
                Qe.SQL.Add('where (MasterKbn   = :pMstKbn)      ');
                Qe.SQL.Add(' and  (PtnNCode    = :pPNCode)      ');
                Qe.SQL.Add(' and  (KsyNCode    = :pKNCode)      ');
                Qe.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');

                Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                Qe.ParamByName('pPNCode'     ).AsFloat   := nPNCode;
                Qe.ParamByName('pKNCode'     ).AsFloat   := nKNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;
            end;
            3:
            begin
                // KousyuPtnMA_Relｷｰ情報を取得
                nPNCode  := Qe.FieldByName('NCode'    ).AsFloat;
                nPName   := Qe.FieldByName('PtnName'  ).AsString;   // <016>

                Qe.Close();
                Qe.SQL.Clear();

                Qe.SQL.Add('select * from KousyuPtnMA_Rel       ');
                Qe.SQL.Add('where (NCode = :pNCode)             ');
                Qe.SQL.Add(' and  (GrpSegNCode = :pGrpSegNCode) ');

                Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                // ﾊﾟﾀｰﾝ内部ｺｰﾄﾞを戻す
                pSync.nPtnNCode := nPNCode;
                pSync.sPtnName  := nPName;  // <016>
            end;
            end;

            if ( Qe.Open = False ) then
            begin
                // SQLｴﾗｰ
                ErrorMessageDsp(Qe);
                result := -9;
                Exit;
            end;

            if ( Qe.Eof ) then
                    bRet := True
            else    bRet := False;


            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
//            MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
//            MDataModule.BeginTran( dbCorp_Select );

            try
                // 親の_Relの更新
                Qe.Close();
                Qe.SQL.Clear();
                case pType of
                1:
                begin
                    if ( bRet ) then                                            // 新規
                    begin
                        Qe.SQL.Add('insert into HojyoMA_Rel (MasterKbn,  ');
                        Qe.SQL.Add(' NCode, GrpSegNCode, RDelKbn_REL)    ');
                        Qe.SQL.Add('values (                             ');
                        Qe.SQL.Add(' :pMstKbn, :pNCode, :pGrpSegNCode, 0)');
                    end
                    else                                                        // 更新
                    begin
                        Qe.SQL.Add('update HojyoMA_Rel set               ');
                        Qe.SQL.Add('    RDelKbn_REL = 0                  ');
                        Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                        Qe.SQL.Add('where (MasterKbn   = :pMstKbn)       ');
                        Qe.SQL.Add('  and (NCode       = :pNCode)        ');
                        Qe.SQL.Add('  and (GrpSegNCode = :pGrpSegNCode)  ');
                    end;

                    Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                    Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    iSyncID := JNTSYNC_HojyoMA;
                end;
                2:
                begin
                    if ( bRet ) then                                            // 新規
                    begin
                        Qe.SQL.Add('insert into KousyuPtn_Rel (          ');
                        Qe.SQL.Add(' MasterKbn, PtnNCode, KsyNCode,      ');
                        Qe.SQL.Add(' GrpSegNCode, RDelKbn_REL)           ');
                        Qe.SQL.Add('values (                             ');
                        Qe.SQL.Add(' :pMstKbn, :pPNCode, :pKNCode,       ');
                        Qe.SQL.Add(' :pGrpSegNCode, 0)                   ');
                    end
                    else                                                        // 更新
                    begin
                        Qe.SQL.Add('update KousyuPtn_Rel set             ');
                        Qe.SQL.Add('    RDelKbn_REL = 0                  ');
                        Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                        Qe.SQL.Add('where (MasterKbn   = :pMstKbn)       ');
                        Qe.SQL.Add('  and (PtnNcode    = :pPNCode)       ');
                        Qe.SQL.Add('  and (KsyNcode    = :pKNCode)       ');
                        Qe.SQL.Add('  and (GrpSegNCode = :pGrpSegNCode)  ');
                    end;

                    Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                    Qe.ParamByName('pPNCode'     ).AsFloat   := nPNCode;
                    Qe.ParamByName('pKNCode'     ).AsFloat   := nKNCode;
                    Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    iSyncID := JNTSYNC_KousyuPtn;
                end;
                3:
                begin
                    if ( bRet ) then                                            // 新規
                    begin
                        Qe.SQL.Add('insert into KousyuPtnMA_Rel (        ');
                        Qe.SQL.Add(' NCode, GrpSegNCode, RDelKbn_REL)    ');
                        Qe.SQL.Add('values (                             ');
                        Qe.SQL.Add(' :pNCode, :pGrpSegNCode, 0)          ');
                    end
                    else                                                        // 更新
                    begin
                        Qe.SQL.Add('update KousyuPtnMA_Rel set           ');
                        Qe.SQL.Add('    RDelKbn_REL = 0                  ');
                        Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                        Qe.SQL.Add('where (Ncode       = :pNCode)        ');
                        Qe.SQL.Add('  and (GrpSegNCode = :pGrpSegNCode)  ');
                    end;

                    Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    iSyncID := JNTSYNC_KousyuPtnMA;
                end;
                end;

                if ( Qe.ExecSQL = false ) then
                begin
                    MjsMessageBoxEx (Self,
                                     '自社への関連付けに失敗しました。',
                                     'マスタ同期', mjError, mjOk, mjDefOk);
                    Abort;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動 <026>
                if pType = 2 then
                begin
                    if ( m_SyncMaster.fnCall_SYNC(iSyncID, JNTSYNC_DELETE) = False ) then
                        Abort;
                end
                else
                begin
                    if ( m_SyncMaster.fnCall_SYNC(iSyncID) = False ) then
                        Abort;
                end;
            except
                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
//                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
//                MDataModule.Rollback( dbCorp_Select );
                Result := -9;
                Exit;
            end;

            // 親会社DBに対してｺﾐｯﾄを実行する
//            MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
//            MDataModule.Commit( dbCorp_Select );
            Result := 1;    // 正常
            Exit;
        end
        else
        begin
            // ｷｬﾝｾﾙ
            Result := 2;
            Exit;
        end;
    end;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: DdxDBGridBeforeChangeColumn (TObject; TdxTreeListNode ...)		                    */
//*																									*/
//*	目的	: ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP018004f.DdxDBGridBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
    cField        : TField;
	strExCode	  : String;
	strFormat	  : String;
    strName       : String;
    strNameSimple : String;
    rSyncKey      : SyncKey;
    iRet          : Integer;
begin

    // 対象ｶﾗﾑ：外部ｺｰﾄﾞ
    if ( Column = ColumnGCode ) then
    begin
        with ( DKousyuDataSource.DataSet ) do
        begin
            cField  := FieldByName ('GCode');

            // 有効ｺｰﾄﾞﾁｪｯｸ
			if ( not fnCheckExCodeValidCharacter (cField.AsString) ) then
			begin
				cField.FocusControl ();
				Abort;
			end;

            // ﾌﾞﾗﾝｸNG
    	    if ( Trim (cField.AsString) = '' ) then
    	    begin
	    	    Beep();
				cField.FocusControl ();
				Abort;
			end;

            // <017> - ST
            if ( not DdxDBGrid.Columns [ColumnGCode].ReadOnly ) then
            begin
                if ( not fnCheckMasterDataRecordValid (cField.AsString) ) then
                begin
                    // 同一ｺｰﾄﾞが存在します
                    Beep();
					ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,8);
					MjsMsgRec.sMsg := ComArea.m_MsgStd.MsgChange( MjsMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MjsMsgRec.LogType);
                    cField.FocusControl;
                    Abort;
                end;

				strExCode := TrimRight(cField.AsString);

				case (m_CodeAttr) of
					0: strFormat := '%'  + IntToStr (m_CodeDigit) + 'd';
					1: strFormat := '%.' + IntToStr (m_CodeDigit) + 'd';
				end;

                if ( m_CodeAttr <= 1 ) then
    				    strExCode := Format(strFormat, [StrToInt64 (Trim (strExCode))])
                else    strExCode := TrimRight(strExCode);

				DKousyuMemData.FieldByName ('GCode').AsString	:= strExCode;
            end;
            // <017> - ED

			if ( DKousyuMemData.State in [dsInsert] ) then
			begin
                (*
				if ( Trim (cField.AsString) = '0' ) then
				begin
                    // 同一ｺｰﾄﾞが存在します
					Beep ();
					ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,8);
					MjsMsgRec.sMsg := ComArea.m_MsgStd.MsgChange( MjsMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MjsMsgRec.LogType);
					cField.FocusControl;
					Abort;
				end;
                *) // <018>

                if ( m_CodeAttr <= 1 ) then
                begin
            	    if ( StrToInt64(Trim(cField.AsString)) = 0 ) then
	    			begin
		    			Beep();
			    		cField.FocusControl;
				    	Abort;
    				end;
                end;

                // 親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる <012>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    if ( m_CodeAttr <= 1 ) then
                            strExCode := Format ('%.16d', [StrToInt64 (Trim (cField.AsString))])    // 数値属性
                    else    strExCode := TrimRight (cField.AsString);                               // 文字属性


                    // ﾄﾗﾝｻﾞｸｼｮﾝを開始
                    MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );         // 親会社DB
                    MDataModule.BeginTran( dbCorp_Select );                     // 子会社DB

                    // 会社関連付処理
                    rSyncKey.StrGCode := strExCode;
                    iRet := fnCorpRelation(rSyncKey, 1);

                    if iRet <> 1 then
                    begin
                        // ﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );      // 親会社DB
                        MDataModule.Rollback( dbCorp_Select );                  // 子会社DB
                    end;

                    case iRet of
                        0:
                        begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                        end;
                        1:
                        begin
                            // ｺﾐｯﾄを実行する
                            MDataModule.Commit( m_SyncMaster.m_cPDBSelect );    // 親会社DB
                            MDataModule.Commit( dbCorp_Select );                // 子会社DB

                            // 正常に関連付が行えた場合は、画面の再描画を行う
                            KousyuGridDataSet();
                            DKousyuMemData.Last();  // とりあえず、ﾌｫｰｶｽ位置は最終行
                            cField.FocusControl();
                            Abort;
                        end;
                        2:
                        begin
                            // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                            cField.FocusControl();
                            Abort;
                        end;
                        -9:
                        begin
                            // 例外ｴﾗｰ
                            Abort;
                        end;
                    end;
                end;
			end;
        end;
    end;

    // 対象ｶﾗﾑ：正式名称
    if ( Column = ColumnName ) then
    begin
        with ( DdxDBGrid ) do
        begin
            // 簡略名称
            strNameSimple := DataSource.DataSet.FieldByName ('SimpleName').AsString;

            // 簡略名称がﾌﾞﾗﾝｸの場合は、正式名称をｺﾋﾟｰする
            if ( strNameSimple = '' ) then
            begin
                strName := DataSource.DataSet.FieldByName ('LongName').AsString;

                if ( strName <> '' ) then
                begin
                    DdxDBGrid.DataLink.Edit;

					if	(MjsHanLength(strName) <= 14) then
						DdxDBGrid.Columns [ColumnSimpleName].Field.AsString    := MJSHanCopy (strName, 1, 14)
					else
						DdxDBGrid.Columns [ColumnSimpleName].Field.AsString	:= MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: fnCheckMasterDataRecordValid (String)										            */
//*																									*/
//*	目的	: 補助基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		                */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 工種外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function TJNTCRP018004f.fnCheckMasterDataRecordValid(
  strExCode: String): Boolean;
var
    dqMasterData: TMQuery;

begin
	if	(Trim (strExCode) = '') then
	begin
		Result	:= FALSE;
		Exit;
	end;


    if m_CodeAttr <= 1 then
        strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))])
    else
        strExCode   := TrimRight (strExCode);

    dqMasterData    := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);	                                    // DBとMQueryの接続

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM HojyoMA ');
        SQL.Add   ('WHERE  MasterKbn = :pMstkbn AND RDelKbn = 0 AND GCode = :strExCode');
        ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
		ParamByName ('strExCode'      ).AsString    := strExCode;
		Open ();

		if  (not EOF) then
			Result	:= FALSE
        else
			Result	:= TRUE;

		Close ();
    end;

	dqMasterData.Free ();
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: DdxDBGridKeyPress (TObject; Char)										                        */
//*																											*/
//*	目的	: DdxDBGridｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ											    	            */
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure TJNTCRP018004f.DdxDBGridKeyPress(Sender: TObject; var Key: Char);
begin

    if m_CodeAttr <= 1 then
    begin
    	if	(DdxDBGrid.FocusedColumn = ColumnGCode) then
    	begin
        	if	(((Key < '0') or  (Key > '9')) and
    		      (Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
    		begin
    			Beep ();
    			Abort;
    		end;
    	end;
    end;

inherited;
end;

//**************************************************************************
//	Proccess	:	工種をDBにセット
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DKousyuMemDataBeforePost(DataSet: TDataSet);
var
    Qe         : TMQuery;
    cFieldWork : TField;
    strExCode  : String;

    strQry     : String;
    bRet       : Boolean;
    iMastKbn   : Integer;
    iSumKbn    : Integer;
    iRDelKbn   : Integer;
    strGCode   : String;
    nPNCode    : Extended;
    rSyncKey   : SyncKey;    
    iRet       : Integer;
    
begin

    if ( m_fUpdateRecord ) then
    begin
        cFieldWork := DKousyuMemData.FieldByName ( 'GCode' );

    	if ( Trim (cFieldWork.AsSTring) = '' ) then
	    begin
		    Beep();
			cFieldWork.FocusControl();
			Abort();
		end;

        // MQueryの構築
    	Qe := TMQuery.Create(Self);

		SessionPractice(C_ST_PROCESS);			// <038>

        try
            //----------------------------------------
            // 子会社の存在ﾁｪｯｸ     ｺｰﾄﾞの重複ﾁｪｯｸ
            //----------------------------------------

            // 子会社DBとMQueryの接続
            MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

            if ( m_CodeAttr <= 1 ) then
                strExCode := Format ('%.16d', [StrToInt64 (Trim (DKousyuMemData.FieldByName('GCode').AsString))])
            else
                strExCode := TrimRight (DKousyuMemData.FieldByName('GCode').AsString);

            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('select * from HojyoMA      ');
            Qe.SQL.Add('where MasterKbn = :pMstkbn ');
            Qe.SQL.Add(' and  SumKbn    = 0        ');
            Qe.SQL.Add(' and  RDelKbn   = 0        ');
            Qe.SQL.Add(' and  GCode     = :pGCode  ');
            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
            Qe.ParamByName('pGCode' ).AsString  := strExCode;

            if ( Qe.Open = False ) then
            begin
                ErrorMessageDsp(Qe);
                Abort; // Exit; <011>
            end;

            if Qe.Eof then
                    bRet := True
            else    bRet := False;

            // 重複ﾁｪｯｸ
            if ( DKousyuMemData.State in [dsInsert] ) and ( bRet = False ) then
            begin
                Beep ();
                cFieldWork.FocusControl ();
                Abort ();
            end;

            //----------------------------------------------
            //  新規登録の場合は親会社の存在ﾁｪｯｸ   <012>
            //----------------------------------------------
            if ( DKousyuMemData.State in [dsInsert] ) and ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // ﾄﾗﾝｻﾞｸｼｮﾝを開始
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );             // 親会社DB
                MDataModule.BeginTran( dbCorp_Select );                         // 子会社DB

                // 会社関連付処理
                rSyncKey.strGCode := strExCode;
                iRet := fnCorpRelation(rSyncKey, 1);

                if iRet <> 1 then
                begin
                    // ﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );          // 親会社DB
                    MDataModule.Rollback( dbCorp_Select );                      // 子会社DB
                end;

                case iRet of
                    0:  begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                        end;
                    1:
                    begin
                        // ｺﾐｯﾄを実行する
                        MDataModule.Commit( m_SyncMaster.m_cPDBSelect );        // 親会社DB
                        MDataModule.Commit( dbCorp_Select );                    // 子会社DB

                        // 正常に関連付が行えた場合は、画面の再描画を行う
                        KousyuGridDataSet();
                        DKousyuMemData.Last();  // とりあえず、ﾌｫｰｶｽ位置は最終行
                        cFieldWork.FocusControl();
                        Abort;
                    end;
                    2:
                    begin
                        // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                        cFieldWork.FocusControl();
                        Abort;
                    end;
                    -9:
                    begin
                        // 例外ｴﾗｰ
                        Abort;
                    end;
                end;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                Qe.Close();
                // 親会社DBとMQueryの接続
                MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            end
            else
            begin
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );
            end;

            if ( bRet ) then
            begin
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('insert into HojyoMA (                                   ');
                Qe.SQL.Add(' MasterKbn, SumKbn, RDelKbn, GCode, Renso, LongName,    ');
                Qe.SQL.Add(' SimpleName, SyokuchiKbn, TStartDate, TEndDate,         ');
                Qe.SQL.Add(' UpdTantoNCode)                                         '); // <037>
                Qe.SQL.Add('values (                                                ');
                Qe.SQL.Add(' :pMstkbn, 0, 0, :GCode, :Renso, :LongName, :SimpleName,');
                Qe.SQL.Add(' 0, :TStartDate, :TEndDate,                             ');
                Qe.SQL.Add(' :UpdTantoNCode)                                        '); // <037>

                Qe.ParamByName ('TStartDate').AsDateTime := m_cJNTArea.getDefDate(1);
                Qe.ParamByName ('TEndDate').AsDateTime   := m_cJNTArea.getDefDate(2);

// <034> ADD start
                SetLength(m_aryFusenData, Length(m_aryFusenData) + 1);
// <034> ADD end
            end
            else
            begin
                Qe.Close;
                Qe.SQL.Clear;
                Qe.SQL.Add('update HojyoMA                  ');
                Qe.SQL.Add('set    Renso      = :Renso,     ');
                Qe.SQL.Add('       LongName   = :LongName,  ');
                Qe.SQL.Add('       SimpleName = :SimpleName,');
                Qe.SQL.Add('       UpdTantoNCode = :UpdTantoNCode '); // <037>
                Qe.SQL.Add('where (MasterKbn  = :pMstkbn)   ');
                Qe.SQL.Add(' and  (SumKbn     = 0)          ');
                Qe.SQL.Add(' and  (RDelKbn    = 0)          ');
                Qe.SQL.Add(' and  (GCode      = :GCode)     ');
            end;

            Qe.ParamByName('pMstKbn'   ).Asinteger := m_KousyuKbn;
            Qe.ParamByName('GCode'     ).AsString  := strExCode;
            Qe.ParamByName('Renso'     ).AsString  := DKousyuMemData.FieldByName('Renso'     ).AsString;
            Qe.ParamByName('LongName'  ).AsString  := DKousyuMemData.FieldByName('LongName'  ).AsSTring;
            Qe.ParamByName('SimpleName').AsString  := DKousyuMemData.FieldByName('SimpleName').AsString;
            Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

            if ( Qe.ExecSQL = false ) then
            begin
                // SQLｴﾗｰ
                ErrorMessageDsp(Qe);
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( dbCorp_Select );
                Abort;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = false ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Abort;
                end;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit( dbCorp_Select );

// <035> ADD start

       		if bRet then        			// 新規の場合は内部ｺｰﾄﾞを取得する
        	begin                           // 子社の場合
            	if m_SyncMaster.m_flgGrpCorp = 1 then
                begin                       // 親会社に接続しているため自社に接続する
                 	MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);
                end;

          		Qe.Close();
            	Qe.SQL.Clear();
            	Qe.SQL.Add('Select NCode From HojyoMA');
            	Qe.SQL.Add('Where MasterKbn = :parMstKbn');
           		Qe.SQL.Add('And RDelKbn = 0');
            	Qe.SQL.Add('And SumKbn = 0');
            	Qe.SQL.Add('And GCode = :parGCode');
                                      		// ﾏｽﾀ区分
            	Qe.ParamByName('parMstKbn').AsInteger := m_KousyuKbn;
            								// 入力した外部ｺｰﾄﾞ
            	Qe.ParamByName('parGCode').AsString := strExCode;

            	if not Qe.Open() then
            	begin
            		ErrorMessageDsp(Qe);
                	Exit;
            	end;

            	if not Qe.Eof then
            	begin
            		DKousyuMemData.Edit();  // MemDataに内部ｺｰﾄﾞをｾｯﾄ
            		DKousyuMemData.FieldByName('NCode').AsFloat := Qe.GetFld('NCode').AsFloat;
            	end;
         	end;
// <035> ADD end

        finally
			SessionPractice(C_ED_PROCESS);		// <038>
            Qe.Close;
            Qe.Free;
        end;
    end;

end;

//**************************************************************************
//	Proccess	:   DKousyuDataSourceStateChange
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DKousyuDataSourceStateChange(Sender: TObject);
begin

    if  (DKousyuMemData.State in [dsInsert]) then
    	DdxDBGrid.Columns [ColumnGCode].ReadOnly    := False
    else
		DdxDBGrid.Columns [ColumnGCode].ReadOnly    := True;

	if  (DKousyuMemData.Active and (DKousyuDataSource.DataSet <> nil)) then
	begin
		if  (DdxDBGrid.DataSource.DataSet.RecordCount = 0) then
        	DdxDBGrid.Columns [ColumnGCode].ReadOnly    := False;
	end;

end;

//**************************************************************************
//	Proccess	:   CMChildkey
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.CMChildkey(var Msg: TWMKey);
var
	cShiftState: TShiftState;
	strNameWork: String;

begin
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);								// Shiftｷｰの取得 <041>MOD

	if	((GetKeyState (VK_MENU) < 0) and (Msg.CharCode = VK_DOWN)) then		            // Altｷｰが押された時
		Exit;

    //<02> Add ↓
	if	(Screen.ActiveControl.Name = CmnPrjCombo.Name) then     						// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then				// End & Esc
		begin
			Close ();
			Abort;
		end;
// <002>→も追加
//		if	(Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		if	(Msg.CharCode = VK_RETURN) or
            ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
            (Msg.CharCode = VK_RIGHT) then
   		begin

            if fnGetMstKbn(CmnPrjCombo.ItemIndex) = false then
                exit
            else
            begin
                m_OccupiedFlg := True;
                fnChangeSelectionScreen;
// <002>↓第1ｺﾝﾎﾞからは第2ｺﾝﾎﾞに移動
{                if PPanelKousyu.Visible then
                begin
                    m_ACControl := DdxDBGrid;
                    m_ACControl.SetFocus;
                  	DdxDBGrid.FocusedColumn	:= ColumnGCode;
                end else
                begin
                    m_ACControl := EPtnNo;
                    m_ACControl.SetFocus;
                end;
}
                MjsSetFocus(Self, CmnInstructionCombo.Name);
                Abort;
// <002>↑
                exit;
            end;
		end;

		if	(((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_LEFT)) then
			Abort;

		Exit;
	end;
    //<02> Add ↑

	if	(Screen.ActiveControl.Name = CmnInstructionCombo.Name) then						// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then				// End & Esc
		begin
            if CmnPrjCombo.Enabled then
                CmnPrjCombo.SetFocus;
			Exit;
		end;

		if	((Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
			 (Msg.CharCode = VK_RIGHT)) then
		begin
            fnChangeSelectionScreen();

            // ﾌｫｰｶｽ制御
            if PPanelKousyu.Visible then
            begin
                m_ACControl := DdxDBGrid;
                m_ACControl.SetFocus;
	        	DdxDBGrid.FocusedColumn	:= ColumnGCode;
            end else
            begin
                m_ACControl := EPtnNo;
                m_ACControl.SetFocus;
            end;
            Abort;                          // <002>
            Exit;
		end;

		if	(((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_LEFT)) then
		begin
            MjsPrevCtrl (Self);
			abort;							//<010>①
		end;

		Exit;
	end;

	if	(CmnTreeView.Focused) then
	begin
        if ((Msg.CharCode = VK_TAB  ) and (cShiftState  = [ssShift])) then
        begin
            MjsPrevCtrl (Self);
            abort;
        end;

		if	(Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_TAB) then
		begin
            MjsNextCtrl (Self);
            abort;
		end;

		if	(Msg.CharCode = VK_END) and (Msg.CharCode = VK_ESCAPE) then				// End
		begin
            CmnInstructionCombo.SetFocus;
			Abort;
		end;

        // <002>ﾂﾘｰでの↑↓ｷｰはｺﾝﾄﾛｰﾙに任せる
        if	(Msg.CharCode = VK_UP) or (Msg.CharCode = VK_DOWN) then
            Exit;

	end;

	if	(Screen.ActiveControl.Name = DdxDBGrid.Name) then							    // 実在Grid
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then				// Home
		begin
			if	(DdxDBGrid.EditingText = '') then
			begin
				DdxDBGrid.FocusedColumn	:= ColumnGCode;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then				// End
		begin
	 		if	(DdxDBGrid.EditingText = '') then
			begin
				if	(DdxDBGrid.FocusedColumn = ColumnGCode) then
				begin
					CmnInstructionCombo.SetFocus ();
					Abort
				end
				else
                begin
					DdxDBGrid.FocusedColumn	:= ColumnSimpleName;

					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((DKousyuDataSource.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (DdxDBGrid.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

            if CmnInstructionCombo.Enabled then
    			CmnInstructionCombo.SetFocus ();
			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if (DdxDBGrid.FocusedNode.Index = 0) and ( DdxDBGrid.FocusedColumn = ColumnGCode) then
			begin
                if CmnInstructionCombo.Enabled then
	    			CmnInstructionCombo.SetFocus ();
				Abort;
            end;
		end;

		if	((DdxDBGrid.FocusedColumn = ColumnSimpleName) and ((Msg.CharCode = VK_F8) and (cShiftState = []))) then
		begin
			strNameWork	:= DKousyuMemData.FieldByName ('LongName').AsString;			// 正式名称

			if	(strNameWork <> '') then
			begin
				DKousyuMemData.Edit ();
				DKousyuMemData.FieldByName ('SimpleName').AsString	:= MJSKabuCut (strNameWork, 14);
				DKousyuMemData.Post ();
			end;

			Abort;
		end;

		Exit;
	end;

    if (Screen.ActiveControl.Name = DdxDBGrid2.Name) then
    begin
        if ((Msg.CharCode = VK_TAB  ) and (cShiftState  = [ssShift])) then
        begin
            MjsPrevCtrl (Self);
            abort;
        end;

		if	(Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_TAB) then
		begin
            MjsNextCtrl (Self);
            abort;
		end;

		if	(Msg.CharCode = VK_ESCAPE) then
		begin
            if CmnInstructionCombo.Enabled then
                CmnInstructionCombo.SetFocus;
			Abort;
		end;
        // <002>↑↓ｷｰはｺﾝﾄﾛｰﾙに任せる
        if	(Msg.CharCode = VK_UP) or (Msg.CharCode = VK_DOWN) then
            Exit;

    end;

    if (Screen.ActiveControl.Name = EPtnNo.Name) then
    begin
        if ((Msg.CharCode = VK_TAB  ) and (cShiftState  = [ssShift])) or
           (Msg.CharCode = VK_Left ) or  (Msg.CharCode = VK_UP) then
        begin
            m_End   := True;
            MjsPrevCtrl (Self);
            m_End   := False;
            abort;
        end
  		else if	(Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_TAB ) or
                (Msg.CharCode = VK_RIGHT ) or (Msg.CharCode = VK_DOWN) then
        begin
            MjsNextCtrl (Self);
            abort;
        end;

		if	(Msg.CharCode = VK_ESCAPE) then
		begin
            if CmnInstructionCombo.Enabled then
                CmnInstructionCombo.SetFocus;

			Abort;
		end;

        if (Msg.CharCode = VK_END) then
        begin
            CmnTreeView.SetFocus;
            Exit;
        end;
    end;

    if (Screen.ActiveControl.Name = EPtnName.Name) then
    begin
    	if (Msg.CharCode = VK_LEFT)  and (MjsChkCurTop(Screen.ActiveControl) = False) or
	       (Msg.CharCode = VK_RIGHT) and (MjsChkCurEnd(Screen.ActiveControl) = False) then
		    Exit;

        if ((Msg.CharCode = VK_TAB  ) and (cShiftState  = [ssShift])) or
           (Msg.CharCode = VK_Left )  or  (Msg.CharCode = VK_UP) then
        begin
            m_End   := True;
            MjsPrevCtrl (Self);
            m_End   := False;
            abort;
        end
  		else if	(Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_TAB ) or
                (Msg.CharCode = VK_RIGHT ) or (Msg.CharCode = VK_DOWN) then
        begin
            MjsNextCtrl (Self);
            abort;
        end;

		if	(Msg.CharCode = VK_ESCAPE) then
		begin
            if CmnInstructionCombo.Enabled then
                CmnInstructionCombo.SetFocus;
			Abort;
		end;

        if (Msg.CharCode = VK_END) then
        begin
            CmnTreeView.SetFocus;
            Exit;
        end;
    end;

    // <KEY> St-----------------------------------------------------------------
    if PPanelPtn.Visible then
    begin
        if (Screen.ActiveControl is  TMBitBtn) = False then
        begin
            // [Return] [Tab] [↓] [→]
            if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
            begin
                MjsDispCtrl.MjsNextCtrl (Self);
                abort;
            end;

            // [Shift + Tab]  [←][↑]
    		if	 ((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
	    		 ((Msg.CharCode = VK_UP  ) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
            begin
                MJSDispCtrl.MjsPrevCtrl (Self);
                abort;
            end;
        end;
    end;
    // <KEY> Ed-----------------------------------------------------------------


	inherited;
end;

//**************************************************************************
//	Proccess	:   工種パターン検索Exp
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.EPtnNoArrowClick(Sender: TObject);
var
    CompName  : String;
    lvExpSend : rcJNTExpSend;
    lvExpRecv : rcJNTExpRecv;
    iExpRtn   : Integer;
	lvSQL	  :	String;

begin

    CompName := TComponent(Sender).Name;

    fnJNTExpMakeParam(@lvExpSend);                                              // ﾊﾟﾗﾒｰﾀ初期設定

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := m_pMyAppRecord;                                     // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @dbCorp_Select;                                     // 会社DB TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     := ComArea.SystemArea.SysColorD;

    lvExpSend.MasterKbn  := 9060;                                               
    lvExpSend.ModulKbn   := 0;
    lvExpSend.PatternNo  := 1;
    lvExpSend.TableName  := 'KousyuPtnMA';

    lvSQL := 'Masterkbn = ' + IntToStr(m_KousyuKbn) + ' And RDelKbn = 0 ';

    lvExpSend.WhereStr   := lvSQL;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn := fnJNTExpShow(@lvExpSend, @lvExpRecv);

    if iExpRtn <> 1 then                                                        // ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then                                     // 中身あり?
    begin
        EPtnNo.Value  := StrToInt(lvExpRecv.GCode);
        EPtnName.Text := lvExpRecv.Nm;
        Keybd_Event(VK_RETURN, 0, 0, 0);                                        // Enter ｷｰのｴﾐｭﾚｲﾄ
		Abort;
    end;

end;

//**************************************************************************
//	Proccess	:   PtnNoExit
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.EPtnNoExit(Sender: TObject);
var
    Qe        : TMQuery;
	stItemRec : ^TreeViewRec;
    iLoop     : Integer;
begin
    Qe := Nil;

    if ( m_End               = true   ) then Exit;
    if ( Trunc(EPtnNo.Value) = 0      ) then Exit;
    if ( Trunc(EPtnNo.Value) = m_Code ) then Exit;

    DPtnMemData.Close;

    for iLoop := 0 to CmnTreeView.Items.Count -1 do
    begin
        stItemRec := CmnTreeView.Items[CmnTreeView.Items.Count -1].Data;
        Dispose(stItemRec);
        CmnTreeView.Items[CmnTreeView.Items.Count -1].Delete;
    end;

    m_PtnFlg := false;

	SessionPractice(C_ST_PROCESS);				// <038>

    try
        Qe := TMQuery.Create(Self);			                                    // MQueryの構築
        MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);		                // DBとMQueryの接続

        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select * from KousyuPtnMA   ');
        Qe.SQL.Add('where MasterKbn = :MasterKbn');
        Qe.SQL.Add('and   PtnNo     = :PtnNo    ');
        Qe.SQL.Add('and   RDelKbn   = 0         ');

        Qe.ParamByName('MasterKbn').AsInteger := m_KousyuKbn;
        Qe.ParamByName('PtnNo').AsInteger     := Trunc(EPtnNo.Value);

        if Qe.Open = False then
        begin
            ErrorMessageDsp(Qe);
            Exit;
        end;

        if not Qe.Eof then
        begin
            EPtnName.Text := Qe.GetFld('PtnName').AsString;
            m_PtnNCode    := Qe.GetFld('NCode').AsFloat;
            m_Name        := Qe.GetFld('PtnName').AsString;
            m_PtnFlg      := True;

            KousyuPtnGridDataSet();

            TreeMake();

        end
        else
        begin
            EPtnName.Text := '';
            m_Name        := '                              ';
            m_PtnNCode    := 0;
        end;

        m_Code := Trunc(EPtnNo.Value);
    finally
		SessionPractice(C_ED_PROCESS);			// <038>
        Qe.Close;
        Qe.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   PtnNameExit
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.EPtnNameExit(Sender: TObject);
var
    Qe       : TMQuery;
    cNode    : TTreeNode;
    rSyncKey : SyncKey;
    iRet     : Integer;

begin
    Qe := Nil;

    if ( m_End         = true   ) then Exit;
    if ( EPtnName.Text = m_Name ) then Exit;    // ﾊﾟﾀｰﾝ名称に変更がない場合
    if ( EPtnNo.Value  = 0      ) then Exit;    // ﾊﾟﾀｰﾝNo.が0の場合

	SessionPractice(C_ST_PROCESS);				// <038>

    try
        Qe := TMQuery.Create ( Self );
        MDataModule.SetDBInfoToQuery ( dbCorp_Select, Qe );

        // 諸口が存在するかﾁｪｯｸ
        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select * from HojyoMA       ');
        Qe.SQL.Add('where MasterKbn  = :pMstkbn ');
        Qe.SQL.Add(' and RDelKbn     = 0        ');
        Qe.SQL.Add(' and SyokuchiKbn = 1        ');
        Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

        if ( Qe.Open = false ) then Exit;

        if Qe.Eof then
        begin
            MJSMessageBoxEx (Self, '諸口を登録してください。', '登録',
                             mjInformation, mjOk, mjDefOk, False);

            EPtnNo.Value  := 0;
            EPtnName.Text := '';
            m_PtnNCode    := 0;
            EPtnNo.SetFocus;
            Exit;
        end;

        // ----------------------------
        //  KousyuPtnMAが新規の場合
        // ----------------------------
        if not m_PtnFlg then
        begin
            //----------------------------------------------
            //  新規登録の場合は親会社の存在ﾁｪｯｸ   <012>
            //----------------------------------------------
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // ﾄﾗﾝｻﾞｸｼｮﾝを開始
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );         // 親会社DB
                MDataModule.BeginTran( dbCorp_Select );                     // 子会社DB

                // 会社関連付処理
                rSyncKey.strGCode := EPtnNo.Text;
                iRet := fnCorpRelation(rSyncKey, 3);

                if iRet <> 1 then
                begin
                    // ﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );      // 親会社DB
                    MDataModule.Rollback( dbCorp_Select );                  // 子会社DB
                end;

                case iRet of
                0:
                begin
                    // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                end;
                1:
                begin
                    try
                        // KousyuPtn を同期する
                        Qe.Close;
                        Qe.SQL.Clear;
                        Qe.SQL.Add('select * from P_KousyuPtn ');
                        Qe.SQL.Add('where MasterKbn = :pMstkbn');
                        Qe.SQL.Add(' and PtnNCode = :pPNCode  ');
                        Qe.SQL.Add(' and RDelKbn = 0          ');

                        Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
                        Qe.ParamByName('pPNCode').AsFloat   := rSyncKey.nPtnNCode;

                        if Qe.Open = False then
                            Abort;

                        Qe.First;
                        while not Qe.Eof do
                        begin
                            rSyncKey.nKsyNCode := Qe.FieldByName('KsyNCode').AsFloat;
                            iRet := fnCorpRelation(rSyncKey, 2);

                            if (iRet <> 0) and (iRet <> 1) then
                                Abort;

                            Qe.Next;
                        end;

                        // ｺﾐｯﾄを実行する
                        MDataModule.Commit( m_SyncMaster.m_cPDBSelect );        // 親会社DB
                        MDataModule.Commit( dbCorp_Select );                    // 子会社DB

                        m_PtnFlg := True;

                        m_PtnNCode    := rSyncKey.nPtnNCode;
                        EPtnName.Text := rSyncKey.sPtnName;     // <016>

                        // 正常に関連付が行えた場合は、画面の再描画を行う
                        KousyuPtnGridDataSet();
                        TreeMake();

                        Exit;
                    except
                        // ﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );      // 親会社DB
                        MDataModule.Rollback( dbCorp_Select );                  // 子会社DB
                        Abort;
                    end;
                end;
                2:
                begin
                    // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                    EPtnName.SetFocus;
                    Abort;
                end;
                -9:
                begin
                    // 例外ｴﾗｰ
                    Abort;
                end;
                end;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                Qe.Close();
                // 親会社DBとMQueryの接続
                MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            end
            else
            begin
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );
            end;

            // KousyuPtnMAの新規登録
            Qe.Close;
            Qe.SQL.Clear;

            Qe.SQL.Add('insert into KousyuPtnMA              ');
            Qe.SQL.Add(' (MasterKbn, PtnNo, PtnName, RDelKbn ');
            Qe.SQL.Add(' ,UpdTantoNCode)                     ');  // <037>
            Qe.SQL.Add('values                               ');
            Qe.SQL.Add(' (:MasterKbn,:PtnNo, :PtnName, 0     ');
            Qe.SQL.Add(' ,:UpdTantoNCode)                    ');  // <037>

            Qe.ParamByName('PtnNo').AsInteger     := Trunc(EPtnNo.Value);
            Qe.ParamByName('PtnName').AsString    := EPtnName.Text;
            Qe.ParamByName('MasterKbn').AsInteger := m_KousyuKbn;
            Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

            if Qe.ExecSQL = False then
            begin
                ErrorMessageDsp(Qe);
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // ﾛｰﾙﾊﾞｯｸ
                MDataModule.Rollback(dbCorp_Select);
                Exit;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtnMA) = false ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit( dbCorp_Select );

            // 登録した内部ｺｰﾄﾞの取得
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('select @@Identity as NCode from KousyuPtnMA');
            Qe.Open;

            m_PtnNCode := Qe.GetFld('NCode').AsFloat;
        end
        // KousyuPtnMAが更新の場合
        else
        begin
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                Qe.Close();
                // 親会社DBとMQueryの接続
                MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            end
            else
            begin
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );
            end;

            // KousyuPtnMAの更新
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('update KousyuPtnMA          ');
            Qe.SQL.Add(' set PtnName = :PtnName,    ');
            Qe.SQL.Add('UpdTantoNCode = :UpdTantoNCode '); // <037>
            Qe.SQL.Add('where PtnNo     = :PtnNo    ');
            Qe.SQL.Add(' and  MasterKbn = :MasterKbn');
            Qe.SQL.Add(' and  RDelKbn   = 0         ');
            Qe.SQL.Add(' and  NCode     = :NCode    ');

            Qe.ParamByName('NCode').AsFloat       := m_PtnNCode;
            Qe.ParamByName('PtnNo').AsInteger     := Trunc(EPtnNo.Value);
            Qe.ParamByName('PtnName').AsString    := EPtnName.Text;
            Qe.ParamByName('MasterKbn').AsInteger := m_KousyuKbn;
            Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

            if Qe.ExecSQL = False then
            begin
                ErrorMessageDsp(Qe);
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );

                // ﾛｰﾙﾊﾞｯｸ
                MDataModule.Rollback(dbCorp_Select);
                Exit;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtnMA) = false ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;
            end;

            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit( dbCorp_Select );
        end;

        if not m_PtnFlg then
        begin
            KousyuPtnGridDataSet();

            TreeMake();

            m_PtnFlg := True;
        end
        else
        begin
            cNode      := CmnTreeView.Items.GetFirstNode;
            cNode.Text := IntToStr(Trunc(EPtnNo.Value)) + ' ' + EPtnName.Text;
        end;

        m_Name := EPtnName.Text;
    finally
		SessionPractice(C_ED_PROCESS);			// <038>
        Qe.Close;
        Qe.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   工種パターン登録での工種データをGridにセット
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.KousyuPtnGridDataSet;
var
    Qe        : TMQuery;
    strExCode : String;
	strFormat : String;

begin
    Qe := Nil;

    try
        Qe := TMQuery.Create(Self);			                                    // MQueryの構築
        MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);		                // DBとMQueryの接続

        DPtnMemData.Close;
        DPtnMemData.Open;

        case (m_CodeAttr) of
            0: strFormat := '%'  + IntToStr(m_CodeDigit) + 'd';
            1: strFormat := '%.' + IntToStr(m_CodeDigit) + 'd';
        end;

        if m_PtnFlg then
        begin
            Qe.Close;
            Qe.SQL.Clear;

            Qe.SQL.Add('select distinct GCode, LongName, NCode from HojyoMA    ');
            Qe.SQL.Add('where HojyoMA.NCode not in                             ');
            Qe.SQL.Add('(select KsyNCode from KousyuPtn where PtnNCode = :PtnNo');
            Qe.SQL.Add(' and MasterKbn = :pMstKbn)                             ');
            Qe.SQL.Add(' and MasterKbn = :pMstKbn and SumKbn = 0               ');
            Qe.SQL.Add(' and RDelKbn = 0 and SyokuchiKbn = 0                   ');
            Qe.SQL.Add('order by GCode                                         ');

            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
            Qe.ParamByName('PtnNo').AsFloat     := m_PtnNCode;

            if Qe.Open = False then
            begin
                ErrorMessageDsp(Qe);
                Exit;
            end;
        end
        else
        begin
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('select NCode, GCode, LongName from HojyoMA');
            Qe.SQL.Add('where MasterKbn = :pMstkbn and SumKbn = 0 ');
            Qe.SQL.Add(' and RDelKbn = 0 and SyokuchiKbn = 0      ');
            Qe.SQL.Add('order by GCode                            ');

            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

            if Qe.Open = False then
            begin
                ErrorMessageDsp(Qe);
                Exit;
            end;
        end;

        while not Qe.Eof do
        begin
            if m_CodeAttr <= 1 then
                strExCode := Format(strFormat, [StrToInt64(Trim(Qe.GetFld('GCode').AsString))])
            else
                strExCode := Qe.GetFld('GCode').AsString;

            DPtnMemData.Append;
            DPtnMemData.FieldByName('GCode').AsString    := strExCode;
            DPtnMemData.FieldByName('LongName').AsString := Qe.GetFld('LongName').AsString;
            DPtnMemData.FieldByName('NCode').AsFloat     := Qe.GetFld('NCode').AsFloat;

            DPtnMemData.Post;

            Qe.Next;
        end;

        DPtnMemData.First;
    finally
        Qe.Close;
        Qe.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   ツリー作成
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.TreeMake;
var
    Qe          : TMQuery;
    Qe2         : TMQuery;
    cNode       : TTreeNode;
    cNode2      : TTreeNode;
    stWorkRec   : ^TreeViewRec;
    strExCode   : String;
    strExCode2  : String;
	strFormat   : String;
    strItemName : String;

begin

   	Qe  := TMQuery.Create (Self);			                                    // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		                    // DBとMQueryの接続

   	Qe2 := TMQuery.Create (Self);                                               // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe2 );                         // DBとMQueryの接続

    try
        case (m_CodeAttr) of
            0: strFormat := '%'  + IntToStr (m_CodeDigit) + 'd';
            1: strFormat := '%.' + IntToStr (m_CodeDigit) + 'd';
        end;

        // 工種ﾊﾟﾀｰﾝﾂﾘｰ作成
        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select PtnName from KousyuPtnMA ');
        Qe.SQL.Add('where  PtnNo  = :PtnNo          ');
        Qe.SQL.Add('and MasterKbn = :MstKbn         ');
        Qe.SQL.Add('and RDelKbn = 0                 ');

        Qe.ParamByName('PtnNo').AsInteger  := Trunc(EPtnNo.Value);
        Qe.ParamByName('MstKbn').AsInteger := m_KousyuKbn;

        if Qe.Open = False then
        begin
            ErrorMessageDsp(Qe);
            Exit;
        end;

        if not Qe.Eof then
        begin
            New(stWorkRec);

            stWorkRec^.nDivision := 1;
            stWorkRec^.strExCode := IntToStr(Trunc(EPtnNo.Value));
            stWorkRec^.strName   := Qe.GetFld('PtnName').AsString;
            strItemName          := IntToStr(Trunc(EPtnNo.Value)) + ' ' + Qe.GetFld('PtnName').AsString;

            cNode := CmnTreeView.Items.AddChildObject (nil, strItemName, stWorkRec);

            cNode.ImageIndex    := 0;
            cNode.SelectedIndex := 2;
        end;

        // 諸口ﾂﾘｰ作成
        if not m_PtnFlg then
        begin
            // 諸口ﾚｺｰﾄﾞの取得
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('select NCode, GCode, LongName from HojyoMA ');
            Qe.SQL.Add('where  MasterKbn = :pMstkbn and SyokuchiKbn = 1 and Rdelkbn = 0 ');

            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

            if Qe.Open = False then
            begin
                ErrorMessageDsp(Qe);
                Exit;
            end;

            if not Qe.Eof then
            begin
                // ﾂﾘｰの作成
                cNode := CmnTreeView.Items.GetFirstNode;

                if m_CodeAttr <= 1 then
                    strExCode := Format (strFormat, [StrToInt64 (Trim (Qe.GetFld('GCode').AsString))])
                else
                    strExCode := Qe.GetFld('GCode').AsString;

                New(stWorkRec);

                stWorkRec^.nDivision := 9;
                stWorkRec^.strExCode := Trim(strExCode);
                stWorkRec^.strName   := Qe.GetFld('LongName').AsString;
                strItemName          := Trim(strExCode) + ' ' + Qe.GetFld('LongName').AsString;

                cNode2 := CmnTreeView.Items.AddChildObject (cNode, strItemName, stWorkRec);

                cNode2.ImageIndex    := 1;
                cNode2.SelectedIndex := 3;


                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // ﾄﾗﾝｻﾞｸｼｮﾝを開始
                    MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );         // 親会社DB

                    Qe2.Close;
                    // 親会社DBとMQueryの接続
                    MDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe2 );
                end;

                 MDataModule.BeginTran( dbCorp_Select );                        // 子会社DB

                // 工種ﾊﾟﾀｰﾝへ登録
                Qe2.Close;
                Qe2.SQL.Clear;
                Qe2.SQL.Add('insert into KousyuPtn (MasterKbn, PtnNCode, KsyNCode, ');
                Qe2.SQL.Add('UpdTantoNCode) '); // <037>
                Qe2.SQL.Add('values (:MasterKbn, :PtnNo, :NCode, ');
                Qe2.SQL.Add(':UpdTantoNCode) '); // <037>

                Qe2.ParamByName('MasterKbn').AsInteger := m_KousyuKbn;
                Qe2.ParamByName('PtnNo').AsFloat       := m_PtnNCode;
                Qe2.ParamByName('NCode').AsFloat       := Qe.GetFld('NCode').AsFloat;
                Qe2.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

                if Qe2.ExecSQL = False then
                begin
                    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback ( dbCorp_Select );

                    ErrorMessageDsp(Qe2);
                    Exit;
                end;

                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE) = False ) then // <026>
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback ( dbCorp_Select );
                        Exit;
                    end;
                end;

                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBに対してｺﾐｯﾄを実行する
                    MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( dbCorp_Select );
           end;
        end;

        // 工種ﾂﾘｰ作成
        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select KP.ksyNCode from KousyuPtn KP');
        Qe.SQL.ADD('left outer join HojyoMA HM on       ');
        Qe.SQL.ADD('KP.ksyNCode = HM.NCode              ');
        Qe.SQL.Add('Where KP.PtnNCode  = :PtnNo         ');
        Qe.SQL.Add('and   KP.MasterKbn = :MstKbn        ');
        Qe.SQL.Add('order  by HM.GCode                  ');


        Qe.ParamByName('PtnNo').AsFloat   := m_PtnNCode;
        Qe.ParamByName('MstKbn').AsInteger := m_KousyuKbn;
        if Qe.Open = False then
        begin
            ErrorMessageDsp(Qe);
            Exit;
        end;

        while not Qe.Eof do
        begin
            Qe2.Close;
            Qe2.SQL.Clear;
            Qe2.SQL.Add('select GCode, LongName, NCode ,SyokuchiKbn from HojyoMA');
            Qe2.SQL.Add('where  MasterKbn = :pMstkbn and SumKbn = 0 ');
            Qe2.SQL.Add('and    RDelKbn = 0  and NCode  = :NCode ');

            Qe2.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

            if not m_PtnFlg then
                Qe2.SQL.Add('and    SyokuchiKbn = 0                      ');

            Qe2.ParamByName('NCode').AsFloat    := Qe.GetFld('KsyNCode').AsFloat ;

            if Qe2.Open = False then
            begin
                ErrorMessageDsp(Qe2);
                Exit;
            end;

            if not Qe2.Eof then
            begin
                cNode := CmnTreeView.Items.GetFirstNode;

                    if m_CodeAttr <= 1 then
                        strExCode2 := Format (strFormat, [StrToInt64 (Trim (Qe2.GetFld('GCode').AsString))])
                    else
                        strExCode2 := Qe2.GetFld('GCode').AsString;

                New (stWorkRec);

                if Qe2.GetFld('SyokuchiKbn').AsInteger = 1 then
                    stWorkRec^.nDivision:= 9
                else
                    stWorkRec^.nDivision:= 0;

                stWorkRec^.strExCode := Trim(strExCode2);
                stWorkRec^.strName   := Qe2.GetFld('LongName').AsString;
                strItemName          := Trim(strExCode2) + ' ' + Qe2.GetFld('LongName').AsString;

                cNode2   := CmnTreeView.Items.AddChildObject (cNode, strItemName, stWorkRec);

                cNode2.ImageIndex    := 1;
                cNode2.SelectedIndex := 3;
            end;

            Qe.Next;
        end;

        CmnTreeView.FullExpand;
    finally
        Qe.Close;
        Qe.Free;

        Qe2.Close;
        Qe2.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   DdxDBGrid2DragOver
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DdxDBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
   	cNodeSrc : ^TreeViewRec;

begin

    if Sender = Source then
        Exit;

    cNodeSrc := CmnTreeView.Selected.Data;

    if (cNodeSrc^.nDivision = 1) or (cNodeSrc^.nDivision = 9) then
        Accept  := False
    else
        Accept  := True;

end;

//**************************************************************************
//	Proccess	:   DdxDBGrid2DragDrop
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DdxDBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin

    // Grid内での移動は不可
    if Sender = Source then Exit;

    // ﾂﾘｰからのﾃﾞｰﾀをGridにｾｯﾄ
    TreetoGridSet();

end;

//**************************************************************************
//	Proccess	:   CmnTreeViewDragDrop
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.CmnTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
var
    cNodeSrcParent    : TTreeNode;
    cNodeDstParent    : TTreeNode;
    cNodeSrc          : TTreeNode;
    cNodeDst          : TTreeNode;
    stWorkRecSrcParent: ^TreeViewRec;
    stWorkRecSrc      : ^TreeViewRec;
    stWorkRecDst      : ^TreeViewRec;
    strExCodeDstParent: String;

begin
//    if Sender = Source then Exit;

    // Tree内での移動時
    if Sender = Source then
    begin
        cNodeSrc        := CmnTreeView.Selected;
        cNodeDst        := CmnTreeView.DropTarget;
        cNodeSrcParent  := cNodeSrc.Parent;
        cNodeDstParent  := cNodeDst.Parent;

        stWorkRecSrcParent  := cNodeSrcParent.Data;                             // 挿入元親ﾃﾞｰﾀ

        stWorkRecSrc    := cNodeSrc.Data;                                       // 挿入元ﾃﾞｰﾀ
        stWorkRecDst    := cNodeDst.Data;                                       // 挿入先ﾃﾞｰﾀ

{        if  (stWorkRecDstParent = nil) then
            strExCodeDstParent  := ''
        else
            strExCodeDstParent  := stWorkRecDstParent^.strExCode;

    	if stWorkRecSrcParent^.strExCode <> strExCodeDstParent then		//HIS0018
	    begin
    		Exit;
    	end;
}
    	if (stWorkRecSrc^.strExCode       = stWorkRecDst^.strExCode)  and
           (stWorkRecSrcParent^.strExCode = strExCodeDstParent     )  then
    	begin
	    	Exit;
    	end;

    	fnUpdateTreeViewItemsEx (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent);

        Exit;
    end;

    if not (Source is TdxDBGrid) then  Exit;

    // GridからのﾃﾞｰﾀをTreeに移動
    GridToTreeSet();

end;

//**************************************************************************
//	Proccess	:   CmnTreeViewDragOver
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.CmnTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
	cNodeDst     : TTreeNode;
    stWorkRecSrc : ^TreeViewRec;

begin

    if (Sender is TdxDBGrid) then
    begin
        stWorkRecSrc    := CmnTreeView.Selected.Data;

        if (stWorkRecSrc^.nDivision = 1) then
        begin
            Accept  := False;
            Exit;
        end;
    end;

    if (Sender = Source) then
    begin
        cNodeDst := CmnTreeView.GetNodeAt (X, Y);								// ﾄﾞﾛｯﾌﾟ先ﾉｰﾄﾞ

        if (cNodeDst = nil) then
            Accept  := False
        else
            Accept  := True;
    end;

end;

//**************************************************************************
//	Proccess	:   Btn_LeftClick
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.Btn_LeftClick(Sender: TObject);
begin

    if EPtnNo.Value = 0 then exit;

    // TreeのﾃﾞｰﾀをGridにｾｯﾄ
    TreetoGridSet();

end;

//**************************************************************************
//	Proccess	:   Btn_RightClick
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.Btn_RightClick(Sender: TObject);
begin

    if EPtnNo.Value = 0 then exit;

    if DdxDBGrid2.SelectedCount <= 1 then
        DdxDBGrid2.Options  := DdxDBGrid2.Options - [egoMultiSelect];

    // GridのﾃﾞｰﾀをTreeにｾｯﾄ
    GridToTreeSet();

end;

//**************************************************************************
//	Proccess	:   GridのデータをTreeにセット
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.GridToTreeSet;
var
	iCnt,
    iMaxCnt		: Integer;
    Qe          : TMQuery;
    cNode       : TTreeNode;
    cNode2      : TTreeNode;
    stWorkRec   : ^TreeViewRec;
    strExCode   : String;
    strItemName : String;

    rSyncKey    : SyncKey;
    iRet        : Integer;

begin

   	Qe := TMQuery.Create (Self);			                                    // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		                    // DBとMQueryの接続

	SessionPractice(C_ST_PROCESS);				// <038>

    try
        DdxDBGrid2.Options := DdxDBGrid2.Options + [egoMultiSelect];

        if DdxDBGrid2.SelectedCount > 0 then
        begin
            // SelectedCount > 0はD&Dされた場合
            iMaxCnt := DdxDBGrid2.SelectedCount - 1
        end
        else
        begin
            // ｸﾞﾘｯﾄﾞの行が選択されていない場合はExit
            if Trim (DPtnMemData.FieldByName('GCode').AsString) = '' then
                Exit;

            iMaxCnt := 0;
        end;

        for iCnt := 0 to iMaxCnt do
        begin
            // 選択済みのﾃﾞｰﾀ1件ごとにｶﾚﾝﾄの移動(D&Dの場合)
            if DdxDBGrid2.SelectedCount > 0 then
                DdxDBGrid2.DataSource.DataSet.GotoBookmark(DdxDBGrid2.SelectedRows[iCnt]);


            iRet := 0;
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // ﾄﾗﾝｻﾞｸｼｮﾝを開始
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );             // 親会社DB
                MDataModule.BeginTran( dbCorp_Select );                         // 子会社DB

                // 会社関連付処理
                rSyncKey.nPtnNCode := m_PtnNCode;
                rSyncKey.nKsyNCode := DPtnMemData.FieldByName('NCode').AsFloat;
                iRet := fnCorpRelation(rSyncKey, 2);

                if iRet <> 1 then
                begin
                    // ﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );          // 親会社DB
                    MDataModule.Rollback( dbCorp_Select );                      // 子会社DB
                end;

                case iRet of
                0:
                begin
                    // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                end;
                1:
                begin
                    // ｺﾐｯﾄを実行する
                    MDataModule.Commit( m_SyncMaster.m_cPDBSelect );            // 親会社DB
                    MDataModule.Commit( dbCorp_Select );                        // 子会社DB
                end;
                2:
                begin
                    // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                    m_AcControl.SetFocus();
                    Exit;
                end;
                -9:
                begin
                    // 例外ｴﾗｰ
                    Exit;
                end;
                end;
            end;


            // ｸﾞﾙｰﾌﾟ管理を行っていないか、親DBにﾚｺｰﾄﾞが存在しない場合(iRet=0)
            if iRet = 0 then
            begin
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    Qe.Close();
                    // 親会社DBとMQueryの接続
                    MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);

                    // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                end
                else
                begin
                    // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                    MDataModule.BeginTran( dbCorp_Select );
                end;

                Qe.Close;
                Qe.SQL.Clear;
                Qe.SQL.Add('insert into KousyuPtn (MasterKbn, PtnNCode, KsyNCode,');
                Qe.SQL.Add('UpdTantoNCode)'); // <037>
                Qe.SQL.Add('values (:MasterKbn, :PtnNo, :NCode,');
                Qe.SQL.Add(':UpdTantoNCode)'); // <037>

                Qe.ParamByName('MasterKbn').AsInteger := m_KousyuKbn;
                Qe.ParamByName('PtnNo').AsFloat       := m_PtnNCode;
                Qe.ParamByName('NCode').AsFloat       := DPtnMemData.FieldByName('NCode').AsFloat;
                Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

                if Qe.ExecSQL = False then
                begin
                    ErrorMessageDsp(Qe);

                    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );

                    Exit;
                end;

                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE) = false ) then // <026>
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Abort;
                    end;
                end;

                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    // 親会社DBに対してｺﾐｯﾄを実行する
                    MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( dbCorp_Select );
            end;

            // ﾂﾘｰの作成
            cNode := CmnTreeView.Items.GetFirstNode;

            New(stWorkRec);

            stWorkRec^.nDivision := 0;
            stWorkRec^.strExCode := Trim(DPtnMemData.FieldByName('GCode').AsString);
            stWorkRec^.strName   := DPtnMemData.FieldByName('LongName').AsString;
            strItemName          := Trim(DPtnMemData.FieldByName('GCode').AsString) + ' ' + DPtnMemData.FieldByName('LongName').AsString;

            cNode2 := CmnTreeView.Items.AddChildObject (cNode, strItemName, stWorkRec);

            cNode2.ImageIndex    := 1;
            cNode2.SelectedIndex := 3;

            // ｸﾞﾘｯﾄﾞの該当行を削除する
            DPtnMemData.Delete;
        end;

        // ﾂﾘｰの先頭ﾉｰﾄﾞへ移動する
        CmnTreeView.Items.GetFirstNode.Selected := True;

    finally
		SessionPractice(C_ED_PROCESS);			// <038>
        DdxDBGrid2.Options := DdxDBGrid2.Options - [egoMultiSelect];
        DdxDBGrid2.Options := DdxDBGrid2.Options + [egoMultiSelect];

        Qe.Close;
        Qe.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   TreeのデータをGridにセット
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.TreetoGridSet;
var
    Qe         : TMQuery;
	strExCode  : String;
    exNCode    : Extended;
	cNodeSrc   : ^TreeViewRec;
	stItemData : ^TreeViewRec;
    iLoop      : Integer;
begin

    // TMTreeViewがSelectされていない場合は処理を抜ける <001>
    if ( CmnTreeView.Selected = nil ) then
        Exit;

    cNodeSrc := CmnTreeView.Selected.Data;

    if (cNodeSrc^.nDivision = 1) or (cNodeSrc^.nDivision = 9) then
        Exit;

   	Qe := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );

	SessionPractice(C_ST_PROCESS);				// <038>

    try
        // 外部ｺｰﾄﾞの編集
        if m_CodeAttr <= 1 then
            strExCode := Format ('%.16d', [StrToInt64 (Trim (cNodeSrc^.strExCode))])
        else
            strExCode := TrimRight (cNodeSrc^.strExCode);

        // HojyoMAの内部ｺｰﾄﾞを取得
        exNCode := fnNCodeGet(strExCode);

        // ｸﾞﾙｰﾌﾟ管理を行っている場合は、親子の関連(_Rel)情報を削除(削除区分ON)する <012>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            Qe.Close();
            // 親会社DBとMQueryの接続
            MDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, Qe );

            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            MDataModule.BeginTran( dbCorp_Select );

            // 親会社のHojyoMA_Relを削除
            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('update KousyuPtn_Rel                ');
            Qe.SQL.Add('set RDelKbn_Rel = 1,                ');
            Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
            Qe.SQL.Add('where MasterKbn   = :pMstKbn        ');
            Qe.SQL.Add(' and  PtnNCode    = :pPtnNCode      ');
            Qe.SQL.Add(' and  KsyNCode    = :pKsyNCode      ');
            // <022>Qe.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

            Qe.ParamByName('pMstKbn'     ).AsInteger := m_KousyuKbn;
            Qe.ParamByName('pPtnNCode'   ).AsFloat   := m_PtnNCode;
            Qe.ParamByName('pKsyNCode'   ).AsFloat   := exNCode;
            //<022> Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

            if ( Qe.ExecSQL = False ) then
            begin
                ErrorMessageDsp(Qe);

                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( dbCorp_Select );
                Exit;
            end;

            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE) = False ) then
            begin
                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( dbCorp_Select );
                Exit;
            end;

            // 親会社の実ﾃﾞｰﾀを削除する <024>
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('delete from KousyuPtn ');
            Qe.SQL.Add('where  PtnNCode = :PtnNo ');
            Qe.SQL.Add('and    ksyNCode = :NCode ');
            Qe.ParamByName('PtnNo').AsFloat := m_PtnNCode;
            Qe.ParamByName('NCode').AsFloat := exNCode;

            if Qe.ExecSQL = False then
            begin
                ErrorMessageDsp(Qe);

                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback( dbCorp_Select );
                Exit;
            end;
        end
        // ｸﾞﾙｰﾌﾟ管理を行っていない場合(親の場合も含む)
        else
        begin

// <030> DEL start
(*
            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('select Count(PtnNCode) CNT from KousyuPtn_Rel ');
            Qe.SQL.Add('where MasterKbn   = :pMstKbn                  ');
            Qe.SQL.Add(' and  PtnNCode    = :pPtnNCode                ');
            Qe.SQL.Add(' and  KsyNCode    = :pKsyNCode                ');
            //Qe.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode             ');
            Qe.SQL.Add(' and  RDelKbn_REL = 0                         ');

            Qe.ParamByName('pMstKbn'     ).AsInteger := m_KousyuKbn;
            Qe.ParamByName('pPtnNCode'   ).AsFloat   := m_PtnNCode;
            Qe.ParamByName('pKsyNCode'   ).AsFloat   := exNCode;
            //Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

            if ( Qe.Open = False ) then
            begin
                ErrorMessageDsp(Qe);
                Exit;
            end;

            if ( Qe.FieldByName('CNT').AsInteger <> 0 ) then
            begin
                MjsMessageBoxEx(Self,
                            '子会社で使用しているため、削除できません。',
                            '削除', mjInformation, mjOk, mjDefOk);
                Exit;
            end;
*)
// <030> DEL end

            // 子ﾄﾗﾝｻﾞｸｼｮﾝ開始
            MDataModule.BeginTran( dbCorp_Select );


// <030> ADD start

			// 全社の場合は子社のﾊﾟﾀｰﾝ明細も削除する
			if m_SyncMaster.m_flgGrpCorp = 0 then
            begin

            	Qe.Close();
            	Qe.SQL.Clear();
            	Qe.SQL.Add('Update KousyuPtn_Rel');
            	Qe.SQL.Add('Set RDelKbn_Rel = 1,');
            	Qe.SQL.Add('    UpdDateTM = CURRENT_TIMESTAMP');
            	Qe.SQL.Add('Where MasterKbn = :parMstKbn');
            	Qe.SQL.Add('And PtnNCode = :parPtnNCode');
            	Qe.SQL.Add('And KsyNCode = :parKsyNCode');

            	Qe.ParamByName('parMstKbn').AsInteger := m_KousyuKbn;
               	Qe.ParamByName('parPtnNCode').AsFloat := m_PtnNCode;
            	Qe.ParamByName('parKsyNCode').AsFloat := exNCode;
                
                if Qe.ExecSQL = False then
              	begin
                   	ErrorMessageDsp(Qe);
                   	MDataModule.Rollback(dbCorp_Select);
                   	Exit;
               	end;
            end;

// <030> ADD end

            // 実ﾃﾞｰﾀを削除する
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('delete from KousyuPtn ');
            Qe.SQL.Add('where  PtnNCode = :PtnNo ');
            Qe.SQL.Add('and    ksyNCode = :NCode ');
            Qe.ParamByName('PtnNo').AsFloat := m_PtnNCode;
            Qe.ParamByName('NCode').AsFloat := exNCode;

            if Qe.ExecSQL = False then
            begin
                ErrorMessageDsp(Qe);
                MDataModule.Rollback(dbCorp_Select);
                Exit;
            end;

        end;

        // <023> -ST
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 親会社DBに対してｺﾐｯﾄする
            MDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
        end;
        // 子会社DBに対してｺﾐｯﾄする
        MDataModule.Commit( dbCorp_Select );
        // <023> - ED

        // ｸﾞﾘｯﾄﾞへﾚｺｰﾄﾞの追加
        DPtnMemData.Append;
        DPtnMemData.FieldByName('GCode').AsString    := cNodeSrc^.strExCode;

        DPtnMemData.FieldByName('LongName').AsString := cNodeSrc^.strName;
        DPtnMemData.FieldByName('NCode').AsFloat     := exNCode;
        DPtnMemData.Post;

        // ﾂﾘｰからﾉｰﾄﾞを削除
        for iLoop := 0 to CmnTreeView.Items.Count -1 do
        begin
            stItemData  := CmnTreeView.Items[iLoop].Data;

            if (stItemData^.nDivision = cNodeSrc^.nDivision) and
               (stItemData^.strExCode = cNodeSrc^.strExCode) then
            begin
                Dispose(stItemData);
                CmnTreeView.Items[iLoop].Delete;
                break;
            end;
        end;

        KousyuPtnGridDataSet();

    finally
		SessionPractice(C_ED_PROCESS);			// <038>
        Qe.Close;
        Qe.Free;
    end;

end;

//**************************************************************************
//	Proccess	:   削除ボタンが押された時
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.BSpeedButtonDelClick(Sender: TObject);
var
	stMessageRec    :   TMJSMsgRec;
	strExCode       :   String;
	strMessage      :   String;
    iLoop           :   Integer;
	stItemData      :   ^TreeViewRec;
    strCode         :   String;                                                 // <CHK>
    strName         :   String;                                                 // <CHK>
    strErr          :   String;                                                 // <CHK>
    strMsg          :   String;                                                 // <CHK>
    exNCode         :   Extended;                                               // <CHK>

begin
    {工種登録ｸﾞﾘｯﾄﾞ}
    if      (m_ACControl.Name = DdxDBGrid.Name) then
    begin
        with DdxDBGrid.DataSource.DataSet do
        begin
            strExCode  := FieldByName('GCode').AsString;
            strMessage := '"' + FieldByName('SimpleName').AsString;
            strCode    := FieldByName('GCode').AsString;                        // <CHK>表示用外部ｺｰﾄﾞ
            strName	   := FieldByName('SimpleName').AsString;                   // <CHK>簡略名称
        end;

    	if (Trim(strExCode) = '') then
	    	Exit;

        if m_CodeAttr <= 1 then
            strExCode := Format('%.16d', [StrToInt64 (Trim (strExCode))])
        else
            strExCode := TrimRight(strExCode);
    end
// <033> MOD start
//    else if (m_ACControl.Name = EPtnName.Name) then
   	{ﾊﾟﾀｰﾝ登録画面}
 	else       								// 削除権限ありの場合、ﾊﾟﾀｰﾝNo、ｸﾞﾘｯﾄﾞまたはﾂﾘｰで削除ﾎﾞﾀﾝが有効になるため
// <033> MOD end
    begin
		strExCode  := IntToStr(Trunc(EPtnNo.Value));
		strMessage := '"' + EPtnName.Text;

    	if (Trim(strExCode) = '') then
	    	Exit;

            if m_CodeAttr <= 1 then
 				strExCode := Format('%.16d', [StrToInt64 (Trim (strExCode))])
            else
                strExCode := TrimRight (strExCode);
    end;

   	ComArea.m_MsgStd.GetMsg(stMessageRec, 30, 4);
    strMessage := strMessage + '"のレコードを' + stMessageRec.sMsg;

   	if	(MJSMessageBoxEx (Self, strMessage, stMessageRec.sTitle,
                                stMessageRec.icontype,
	    				   		stMessageRec.btntype,
                                stMessageRec.btndef,
                                stMessageRec.LogType) = mrYes) then
    begin

        // 作業内訳・工種の削除時                                               // <CHK>↓
        if (m_ACControl.Name = DdxDBGrid.Name) then
        begin
            // 内部ｺｰﾄﾞ取得
            exNCode := fnNCodeGet(strExCode);

            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
            if not fnDelCheck(exNCode, m_KousyuKbn, strErr) then
            begin
                //「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
                strMsg := strCode + ' ' + strName + ' ' + strErr ;
                MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
                Exit;
            end;
        end;                                                                    // <CHK>↑

        // ﾚｺｰﾄﾞの削除
        RecordDelete(strExCode);

        if (m_ACControl.Name = DdxDBGrid.Name) then
            // 画面の再描画
            KousyuGridDataSet()
        else
        begin
            m_PtnNCode    := 0;
            m_Code        := 0;
            m_Name        := '                              ';
            EPtnNo.Value  := 0;
            EPtnName.Text := '';

            DPtnMemData.Close;

            for iLoop := 0 to CmnTreeView.Items.Count -1 do
            begin
                stItemData  := CmnTreeView.Items[CmnTreeView.Items.Count -1].Data;

                Dispose(stItemData);
		        CmnTreeView.Items [CmnTreeView.Items.Count -1].Delete;
            end;

            m_End := True;
            EPtnNo.SetFocus;
            m_End := False;
        end;

        // 諸口ﾚｺｰﾄﾞ含め全件ｸﾞﾘｯﾄﾞから削除されたら…
        if ( DKousyuMemData.RecordCount = 0 ) then
        begin
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                if ( PPanelKousyu.Visible ) then
                begin
                    // 画面使用制御(使用不可)
                    fnChangeCondition(False);

                    // ﾌﾟﾛｼﾞｪｸﾄｺﾝﾎﾞに移動
                    m_ACControl := CmnPrjCombo;
                    m_ACControl.SetFocus;
                    CmnPrjCombo.DroppedDown := True;
                end else
                begin
                    fnChangeSelectionScreen;
                    m_ACControl := EPtnNo;
                    m_ACControl.SetFocus;
                end;
            end
            else
            begin
                fnChangeSelectionScreen;

                if ( PPanelKousyu.Visible ) then
                begin
                    m_ACControl := DdxDBGrid;
                    m_ACControl.SetFocus;
                    DdxDBGrid.FocusedColumn	:= ColumnGCode;
                end else
                begin
                    m_ACControl := EPtnNo;
                    m_ACControl.SetFocus;
                end;
            end;
        end;
    end;

end;

//**************************************************************************
//	Proccess	:   レコード削除
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.RecordDelete(strExCode: String);
var
    Qe          :   TMQuery;
    Qe2         :   TMQuery;
    iSKbn       :   Integer;
    SyokutiFlg  :   Boolean;
    bRet        :   Boolean;

    iMastKbn    :   Integer;
    iSumKbn     :   Integer;
    iRDelKbn    :   Integer;
    strGCode    :   String;
    nNCode      :   Extended;

begin

    Qe := TMQuery.Create (Self);                                                // MQueryの構築
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);                            // 子会社DBとMQueryの接続

	SessionPractice(C_ST_PROCESS);				// <038>

    try
        if ( m_ACControl.Name = DdxDBGrid.Name ) then
        begin
            // 削除対象補助ﾏｽﾀ情報の取得
            Qe.Close;
            Qe.SQL.Clear;
            Qe.SQL.Add('select * from HojyoMA      ');
            Qe.SQL.Add('where  MasterKbn = :pMstkbn');
            Qe.SQL.Add('and    RDelKbn = 0         ');
            Qe.SQL.Add('and    GCode = :GCode      ');
            Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
            Qe.ParamByName('GCode').AsString    := strExCode;

            if ( Qe.Open = False ) then Exit;

            // 諸口か否かﾁｪｯｸ
            SyokutiFlg := False;
            iSKbn := Qe.GetFld('SyokuchiKbn').AsInteger;

            if ( iSKbn = 1 ) then
                SyokutiFlg := True;

            // HojyoMA_Relｷｰ情報を取得
            iMastKbn := Qe.FieldByName('MasterKbn').AsInteger;
            iSumKbn  := Qe.FieldByName('SumKbn').AsInteger;
            iRDelKbn := Qe.FieldByName('RDelKbn').AsInteger;
            strGCode := Qe.FieldByName('GCode').AsString;
            nNCode   := Qe.FieldByName('NCode').AsFloat;

            // ｸﾞﾙｰﾌﾟ管理を行っている場合は、親子の関連(_Rel)情報を削除(削除区分ON)する <012>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                Qe.Close();
                // 親会社DBとMQueryの接続
                MDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, Qe);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );


                //----------------------------------------
                // HojyoMAのﾒﾝﾃﾅﾝｽ
                //----------------------------------------

                // 親会社のHojyoMA_Relを削除
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('update HojyoMA_Rel                  ');
                Qe.SQL.Add('set RDelKbn_Rel = 1,                ');
                Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
                Qe.SQL.Add('where MasterKbn   = :pMstKbn        ');
                Qe.SQL.Add(' and  RDelKbn_Rel = :pRDelKbn       ');
                Qe.SQL.Add(' and  NCode       = :pNCode         ');
                Qe.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

                Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                Qe.ParamByName('pRDelKbn'    ).AsInteger := iRDelKbn;
                Qe.ParamByName('pNCode'      ).AsFloat   := nNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( Qe.ExecSQL = False ) then
                begin
                    ErrorMessageDsp(Qe);

                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Abort;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = False ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Abort;
                end;

                //----------------------------------------
                // KousyuPtnMAのﾒﾝﾃﾅﾝｽ
                //----------------------------------------

                if SyokutiFlg = True then                                       // 諸口が削除された場合
                begin
                    // 諸口が削除されたという事はHojyoMAがない状態なので
                    // 全てのKousyuPtnMAを削除する
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('update KousyuPtnMA_Rel set          ');
                    Qe.SQL.Add('    RDelKbn_REL = 1,                ');
                    Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');

                    if ( Qe.ExecSQL = False ) then
                    begin
                        ErrorMessageDsp(Qe);

                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;

                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtnMA) = False ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;

// <028> ADD start
                 	Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('UpDate KousyuPtnMA'			+
                		   	   ' Set'						+
                           	   ' RDelKbn = 1,'              +
                           	   ' UpdTantoNCode = :UpdTantoNCode');           // <037>
                    Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

					if ( Qe.ExecSQL = False ) then
                    begin
                        ErrorMessageDsp(Qe);

                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;
// <028> ADD end

                end;

                //----------------------------------------
                // KousyuPtnのﾒﾝﾃﾅﾝｽ
                //----------------------------------------

                Qe2 := TMQuery.Create (Self);                                   // MQueryの構築
                MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe2);               // 子会社DBとMQueryの接続

                try
                    // 削除対象のKousyuPtnの取得
                    Qe2.Close;
                    Qe2.SQL.Clear;
                    Qe2.SQL.Add('select PtnNCode from KousyuPtn ');
                    Qe2.SQL.Add('where (MasterKbn = :pMstKbn)   ');
                    Qe2.SQL.Add(' and  (KsyNCode  = :pKsyNCd)   ');

                    Qe2.ParamByName('pMstKbn').Asinteger := iMastKbn;
                    Qe2.ParamByName('pKsyNCd').AsFloat   := nNCode;

                    if ( Qe2.Open = False ) then
                    begin
                        ErrorMessageDsp(Qe2);

                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;

                    while not Qe2.Eof do
                    begin
                        // 親会社のKousyuPtn_Relを削除
                        Qe.Close();
                        Qe.SQL.Clear();
                        Qe.SQL.Add('update KousyuPtn_Rel                ');
                        Qe.SQL.Add('set RDelKbn_Rel = 1,                ');
                        Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
                        Qe.SQL.Add('where MasterKbn   = :pMstKbn        ');
                        Qe.SQL.Add(' and  PtnNCode    = :pPtnNCode      ');
                        Qe.SQL.Add(' and  KsyNCode    = :pKsyNCode      ');

                        Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                        Qe.ParamByName('pPtnNCode'   ).AsFloat   := Qe2.FieldByName('PtnNCode').AsFloat;
                        Qe.ParamByName('pKsyNCode'   ).AsFloat   := nNCode;

                        if ( Qe.ExecSQL = False ) then
                        begin
                            ErrorMessageDsp(Qe);

                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            MDataModule.Rollback( dbCorp_Select );
                            Exit;
                        end;

                        Qe2.Next;
                    end;

                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE) = False ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;

                    // 親会社の実ﾃﾞｰﾀを削除する <024>
                    Qe.Close;
                    Qe.SQL.Clear;
                    Qe.SQL.Add('delete from KousyuPtn ');
                    Qe.SQL.Add('where  PtnNCode = :PtnNo ');
                    Qe.SQL.Add('and    ksyNCode = :NCode ');
                    Qe.ParamByName('PtnNo').AsFloat := Qe2.FieldByName('PtnNCode').AsFloat;
                    Qe.ParamByName('NCode').AsFloat := nNCode;

                    if Qe.ExecSQL = False then
                    begin
                        ErrorMessageDsp(Qe);

                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback( dbCorp_Select );
                        Exit;
                    end;

                finally
                    Qe2.Close;
                    Qe2.Free;
                end;
            end
            // ｸﾞﾙｰﾌﾟ管理を行っていない場合(親の場合も含む)
            else
            begin
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('select Count(NCode) CNT from HojyoMA_Rel ');
                Qe.SQL.Add('where MasterKbn   = :pMstKbn             ');
                Qe.SQL.Add('  and NCode       = :pNCode              ');
                Qe.SQL.Add('  and RDelKbn_REL = 0                    ');
                Qe.ParamByName('pMstKbn').AsInteger := iMastKbn;
                Qe.ParamByName('pNCode' ).AsFloat   := nNCode;

                if ( Qe.Open = False ) then
                begin
                    ErrorMessageDsp(Qe);
                    Abort;
                end;

                if ( Qe.FieldByName('CNT').AsInteger <> 0 ) then
                begin
                    MjsMessageBoxEx(Self,
                                '子会社で使用しているため、削除できません。',
                                '削除', mjInformation, mjOk, mjDefOk);
                    Abort;
                end;

                // 子ﾄﾗﾝｻﾞｸｼｮﾝ開始
                MDataModule.BeginTran( dbCorp_Select );

                // 実ﾃﾞｰﾀを削除する
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('update HojyoMA             ');
                Qe.SQL.Add('set    RDelKbn = 1,        ');
                Qe.SQL.Add('UpdTantoNCode = :UpdTantoNCode ');           // <037>
                Qe.SQL.Add('where  MasterKbn = :pMstkbn');
                Qe.SQL.Add('and    SumKbn = 0          ');
                Qe.SQL.Add('and    RDelKbn = 0         ');
                Qe.SQL.Add('and    GCode = :GCode      ');
                Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
                Qe.ParamByName('GCode'  ).AsString  := strExCode;
                Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

                if ( Qe.ExecSQL = False ) then
                begin
                    ErrorMessageDsp(Qe);
                    MDataModule.Rollback( dbCorp_Select );
                    Abort;
                end;

                // KousyuPtnﾃｰﾌﾞﾙから諸口以外の工種ｺｰﾄﾞのものを削除
                if SyokutiFlg = False then
                begin
                    Qe.Close;
                    Qe.SQL.Clear;

                    Qe.SQL.Add('delete from KousyuPtn   ');
                    Qe.SQL.Add('where  KsyNCode = :NCode');
                    Qe.ParamByName('NCode').AsFloat := nNCode;

                    if Qe.ExecSQL = False then
                    begin
                        ErrorMessageDsp(Qe);

                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback(dbCorp_Select);
                        if (m_SyncMaster.m_flgGrpCorp = 1) then
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );

                        exit;
                    end;

                end
                // 諸口が削除された時は工種ﾊﾟﾀｰﾝにぶら下がってる諸口、工種ﾊﾟﾀｰﾝを削除
                else
                begin
                    // KousyuPtnMA
                    Qe.Close;
                    Qe.SQL.Clear;
                    Qe.SQL.Add('Update KousyuPtnMA       ');
                    Qe.SQL.Add('Set RDelKbn = 1,         ');
                    Qe.SQL.Add('UpdTantoNCode = :UpdTantoNCode '); // <037>
                    Qe.SQL.Add('Where MasterKbn = :MstKbn');
                    Qe.ParamByName('MstKbn').AsInteger := m_KousyuKbn;
                    Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

                    if Qe.ExecSQL = False then
                    begin
                        ErrorMessageDsp(Qe);
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback(dbCorp_Select);
                        if (m_SyncMaster.m_flgGrpCorp = 1) then
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );

                        exit;
                    end;

                    // KousyuPtn
                    Qe.Close;
                    Qe.SQL.Clear;
                    Qe.SQL.Add('delete from KousyuPtn    ');
                    Qe.SQL.Add('Where MasterKbn = :MstKbn');
                    Qe.ParamByName('MstKbn').AsInteger := m_KousyuKbn;

                    if Qe.ExecSQL = False then
                    begin
                        ErrorMessageDsp(Qe);
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        MDataModule.Rollback(dbCorp_Select);
                        if (m_SyncMaster.m_flgGrpCorp = 1) then
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );

                        exit;
                    end;
                end;
            end;

            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit( dbCorp_Select );
            if (m_SyncMaster.m_flgGrpCorp = 1) then
                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
        end
        else
        begin
            // ｸﾞﾙｰﾌﾟ管理を行っている場合は、親子の関連(_Rel)情報を削除(削除区分ON)する <012>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                Qe.Close();
                // 親会社DBとMQueryの接続
                MDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, Qe);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                MDataModule.BeginTran( dbCorp_Select );


                //----------------------------------------
                // KousyuPtnMAの削除(RDelKbn = 1)
                //----------------------------------------
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('update KousyuPtnMA_Rel set          ');
                Qe.SQL.Add('    RDelKbn_REL = 1,                ');
                Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
                Qe.SQL.Add('where (Ncode    = :pNCode)          ');

                Qe.ParamByName('pNCode').AsFloat := m_PtnNCode;

                if ( Qe.ExecSQL = False ) then
                begin
                    ErrorMessageDsp(Qe);

                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtnMA) = False ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;

// <028> ADD start
                // 親会社のﾊﾟﾀｰﾝも削除する
            	Qe.Close;
            	Qe.SQL.Clear;
            	Qe.SQL.Add('UpDate KousyuPtnMA'			+
                		   ' Set'						+
                           ' RDelKbn = 1,'    			+
                           ' UpdTantoNCode = :UpdTantoNCode' + // <037>
                           ' Where NCode = :parNCode');

            	Qe.ParamByName('parNCode').AsFloat := m_PtnNCode;
                Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

            	if ( Qe.ExecSQL = False ) then
            	begin
                	ErrorMessageDsp(Qe);

                	// 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                	MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                	// 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                	MDataModule.Rollback( dbCorp_Select );
               	 	Exit;
                end;
// <028> ADD end

                //----------------------------------------
                // KousyuPtnの削除(Delete)
                //----------------------------------------
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('update KousyuPtn_Rel               ');
                Qe.SQL.Add('set RDelKbn_Rel = 1,               ');
                Qe.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP');
                Qe.SQL.Add('where MasterKbn = :pMstKbn         ');
                Qe.SQL.Add(' and  PtnNCode  = :pPtnNCode       ');

                Qe.ParamByName('pMstKbn'  ).AsInteger := m_KousyuKbn;
                Qe.ParamByName('pPtnNCode').AsFloat   := m_PtnNCode;

                if ( Qe.ExecSQL = False ) then
                begin
                    ErrorMessageDsp(Qe);

                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_KousyuPtn, JNTSYNC_DELETE) = False ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;


// <028> ADD start
				// 親会社のﾊﾟﾀｰﾝ明細も削除する
				Qe.Close;
            	Qe.SQL.Clear;
            	Qe.SQL.Add('Delete From KousyuPtn'			+
                		   ' Where MasterKbn = :parMstKbn'	+
						   ' And PtnNCode = :parPtnNo');

                Qe.ParamByName('parMstKbn').AsInteger := m_KousyuKbn;
            	Qe.ParamByName('parPtnNo').AsFloat := m_PtnNCode;

                if ( Qe.ExecSQL = False ) then
                begin
                    ErrorMessageDsp(Qe);

                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    MDataModule.Rollback( dbCorp_Select );
                    Exit;
                end;
// <028> ADD end



            end
            // ｸﾞﾙｰﾌﾟ管理を行っていない場合(親の場合も含む)
            else
            begin
// <029> DEL start
(*
                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('select Count(NCode) CNT from KousyuPtnMA_Rel');
                Qe.SQL.Add('where (Ncode       = :pNCode)               ');
                Qe.SQL.Add('  and (RDelKbn_REL = 0)                     ');

                Qe.ParamByName('pNCode').AsFloat := m_PtnNCode;

                if ( Qe.Open = False ) then
                begin
                    ErrorMessageDsp(Qe);
                    Abort;
                end;

                if ( Qe.FieldByName('CNT').AsInteger <> 0 ) then
                begin
                    MjsMessageBoxEx(Self,
                                '子会社で使用しているため、削除できません。',
                                '削除', mjInformation, mjOk, mjDefOk);
                    Abort;
                end;
*)
// <029> DEL end


                // 子ﾄﾗﾝｻﾞｸｼｮﾝ開始
                MDataModule.BeginTran( dbCorp_Select );

                // KousyuPtnMAの削除(RDelKbn = 1)
                Qe.Close;
                Qe.SQL.Clear;
                Qe.SQL.Add('Update KousyuPtnMA       ');
                Qe.SQL.Add('Set RDelKbn = 1,         ');
                Qe.SQL.Add('UpdTantoNCode = :UpdTantoNCode '); // <037>
                Qe.SQL.Add('where  NCode =  :PtnNCode');
                Qe.SQL.Add('and MasterKbn = :MstKbn  ');
                Qe.ParamByName('PtnNCode').AsFloat := m_PtnNCode;
                Qe.ParamByName('MstKbn').AsInteger := m_KousyuKbn;
                Qe.ParamByName('UpdTantoNCode').AsFloat := m_TantoNCode; // <037>

                if Qe.ExecSQL = False then
                begin
                    ErrorMessageDsp(Qe);
                    MDataModule.Rollback(dbCorp_Select);
                    Exit;
                end;

// <029> ADD start
				// 全社の場合は子社のﾊﾟﾀｰﾝも削除する
                if m_SyncMaster.m_flgGrpCorp = 0 then
                begin
               		Qe.Close();
                	Qe.SQL.Clear();
                	Qe.SQL.Add('Update KousyuPtnMA_Rel Set');
                	Qe.SQL.Add('RDelKbn_REL = 1,');
                    Qe.SQL.Add('UpdDateTM = CURRENT_TIMESTAMP');
                	Qe.SQL.Add('Where NCode = :parNCode');

                	Qe.ParamByName('parNCode').AsFloat := m_PtnNCode;

                	if Qe.ExecSQL = False then
                	begin
                    	ErrorMessageDsp(Qe);
                    	MDataModule.Rollback(dbCorp_Select);
                    	Exit;
                	end;
                end;
// <029> ADD end


                // KousyuPtnの削除(Delete)
                Qe.Close;
                Qe.SQL.Clear;
                Qe.SQL.Add('delete from KousyuPtn      ');
                Qe.SQL.Add('where  PtnNCode = :PtnNCode');
                Qe.ParamByName('PtnNCode').AsFloat   := m_PtnNCode;

                if Qe.ExecSQL = False then
                begin
                    ErrorMessageDsp(Qe);
                    MDataModule.Rollback(dbCorp_Select);
                    Exit;
                end;

// <029> ADD start
				// 全社の場合は子社のﾊﾟﾀｰﾝ明細も削除する
                if m_SyncMaster.m_flgGrpCorp = 0 then
                begin
                 	Qe.Close();
                	Qe.SQL.Clear();
                	Qe.SQL.Add('Update KousyuPtn_Rel');
                	Qe.SQL.Add('Set RDelKbn_Rel = 1,');
                	Qe.SQL.Add('UpdDateTM = CURRENT_TIMESTAMP');
                	Qe.SQL.Add('Where MasterKbn = :parMstKbn');
                	Qe.SQL.Add('And PtnNCode = :parPtnNCode');

                	Qe.ParamByName('parPtnNCode').AsFloat := m_PtnNCode;
                    Qe.ParamByName('parMstKbn'  ).AsInteger := m_KousyuKbn;


                    if Qe.ExecSQL = False then
                	begin
                    	ErrorMessageDsp(Qe);
                    	MDataModule.Rollback(dbCorp_Select);
                    	Exit;
                	end;
                end;
// <029> ADD end


            end;

            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit( dbCorp_Select );
            if (m_SyncMaster.m_flgGrpCorp = 1) then
                // 親会社DBに対してｺﾐｯﾄを実行する
                MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
        end;
    finally
		SessionPractice(C_ED_PROCESS);			// <038>
        Qe.Close;
        Qe.Free;
    end;
    // <042> start
	//実在グリッドの場合
	if (Screen.ActiveControl.Name = DdxDBGrid.Name) then
	begin
		fnEdgeTrackerKeihiSeisanMsg;
	end;
    // <042> end
    
end;

//**************************************************************************
//	Proccess	:   DdxDBGridEnter
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DdxDBGridEnter(Sender: TObject);
begin
	m_ACControl := Screen.ActiveControl;

    //削除ボタン使用可・不可チェック
    DelteBtnCheck();
end;
//**************************************************************************
//	Proccess	:   DdxDBGridChangeNodeEx
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DdxDBGridChangeNodeEx(Sender: TObject);
begin

    if (DdxDBGrid.DataSource.DataSet.FieldByName('GCode').IsNull) then
        DdxDBGrid.FocusedColumn := ColumnGCode;


    //削除ボタン使用可・不可チェック
    DelteBtnCheck();

end;

//**************************************************************************
//	Proccess	:   削除ボタン使用可・不可チェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DelteBtnCheck;
var
	strExCode   : String;
    Qe          :   TMQuery;
begin

    Qe  := TMQuery.Create (Self);			                                    // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		                    // DBとMQueryの接続

    if CmnInstructionCombo.ItemIndex = 0 then
    begin

// <036> ADD start
    	if (DKousyuMemData.State in [dsInsert]) then                            // 新規ﾃﾞｰﾀ挿入中は付箋を貼れないようにする
        begin
         	fnFusenEnabled(false);
    	    Exit;
        end;
// <036> ADD end

        if (Screen.ActiveControl = nil) then
        begin
	    	BSpeedButtonDel.Enabled	:= FALSE;
            fnFusenEnabled(false);
    	    Exit;
        end;

        if (Screen.ActiveControl.Name = CmnPrjCombo.Name) then
    	begin
	    	BSpeedButtonDel.Enabled	:= FALSE;
            fnFusenEnabled(false);
    	    Exit;
	    end;

        if (Screen.ActiveControl.Name = CmnInstructionCombo.Name) then
    	begin
	    	BSpeedButtonDel.Enabled	:= FALSE;
            fnFusenEnabled(false);
    	    Exit;
	    end;

        strExCode	:= DdxDBGrid.DataSource.DataSet.FieldByName ('GCode').AsString;

	    if	(Trim (strExCode) = '') then
    	begin
	    	BSpeedButtonDel.Enabled	:= FALSE;
            fnFusenEnabled(false);
    	    Exit;
	    end;

        if m_CodeAttr  <= 1 then
        	strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))])
        else
            strExCode   := TrimRight (strExCode);


        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.Add('select * From HojyoMA      ');
        Qe.SQL.Add('where  MasterKbn = :pMstkbn');
        Qe.SQL.Add('and    RDelKbn = 0         ');
        Qe.SQL.Add('and    GCode     = :GCode  ');
        Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
        Qe.ParamByName('GCode').AsString    := strExCode;
        if Qe.Open = False then
        begin
            ErrorMessageDsp(Qe);
            Qe.Close;
            Qe.Free;
            Exit;
        end;

        if not Qe.Eof then
        begin

            if (Qe.FieldByName ('SyokuchiKbn').Asinteger = 1 ) then
		    begin
                if CheckSyokutiRecDelete() then
                begin
                    BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;
                end
                else
                    BSpeedButtonDel.Enabled := False;
            end
            else
            begin
                BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;
            end;
        end;
        fnFusenEnabled(True);
    end
    else
    begin
        fnFusenEnabled(false);
        // <021>if (Screen.ActiveControl.Name = EPtnName.Name) and (Trunc(EPtnNo.Value)<>0) then

// <033> MOD start
(*
		if (Screen.ActiveControl = EPtnName) and (Trunc(EPtnNo.Value)<>0) then    // <021>
            BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete
        else
            BSpeedButtonDel.Enabled := False;
*)
										// 追加権限なしおよび削除権限ありの場合
		if (not EPtnName.Enabled) then
    	begin
        	if ((Screen.ActiveControl = EPtnNo) or    			// ﾊﾟﾀｰﾝNoにﾌｫｰｶｽ
               (Screen.ActiveControl = DdxDBGrid2) or           // ｸﾞﾘｯﾄﾞにﾌｫｰｶｽ
               (Screen.ActiveControl = CmnTreeView)) and        // ﾂﾘｰにﾌｫｰｶｽ
               (Trunc(EPtnNo.Value) <> 0) and                   // ﾊﾟﾀｰﾝNoが空白以外
               (CmnTreeView.Items.Count <> 0) then              // ﾂﾘｰにﾃﾞｰﾀがある
			begin                       // 削除ﾎﾞﾀﾝを有効にする
    			BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;
            end
            else
            begin
            	BSpeedButtonDel.Enabled := False;
            end;
    	end
    	else
    	begin
        	if (Screen.ActiveControl = EPtnName) and (Trunc(EPtnNo.Value)<>0) then
            begin
            	BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;
            end
        	else
            begin
            	BSpeedButtonDel.Enabled := False;
            end;
    	end;
// <033> MOD end

    end;

    Qe.Close;
    Qe.Free;

end;

//**************************************************************************
//	Proccess	:   諸口削除可・不可チェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP018004f.CheckSyokutiRecDelete(): Boolean;
var
    Qe  :   TMQuery;

begin

    Qe  := TMQuery.Create (Self);			                                    // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		                    // DBとMQueryの接続

    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.Add('select GCode from HojyoMA  ');
    Qe.SQL.Add('where  MasterKbn = :pMstkbn');
    Qe.SQL.Add('and    RDelKbn = 0         ');
    Qe.SQL.ADD('and    SyokuchiKbn = 0     ');
    Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

    if Qe.Open = False then
    begin
        ErrorMessageDsp(Qe);
        Result  := False;
        Qe.Close;
        Qe.Free;
        Exit;
    end;

    if not Qe.Eof then
        Result  := False
    else
        Result  := True;

    Qe.Close;
    Qe.Free;

end;

//**************************************************************************
//	Proccess	:   DisplayControl
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.DisplayControl(Select: Integer);
begin

    BSpeedButtonPrn.Enabled := m_cJNTArea.IsPrint;
    BSpeedButtonDel.Enabled	:= m_cJNTArea.IsDelete;

	case Select of
		REFER:
		begin
			//	工種Grid
            DdxDBGrid.Options               := DdxDBGrid.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
			DdxDBGridGCode.ReadOnly			:= True;
			DdxDBGridRenso.ReadOnly		    := True;
			DdxDBGridLongName.ReadOnly		:= True;
			DdxDBGridSimpleName.ReadOnly    := True;

            StdCmnGridTag.ReadOnly          := True;
            StdCmnGridTag.DisableEditor     := True;

			//	合計Grid
			DdxDBGrid2GCode.ReadOnly        := True;
			DdxDBGrid2LongName.ReadOnly	    := True;
            DdxDBGrid2.DragMode             := dmManual;

			CmnTreeView.DragMode	        := dmManual;

            EPtnName.Enabled                := False;


            Btn_Right.Enabled               := False;
            Btn_Left.Enabled                := False;
		end;

		NORMAL,
		BASICONLY:
		begin
			//	工種Grid
    		DdxDBGrid.Options	            := DdxDBGrid.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
			DdxDBGridGCode.ReadOnly			:= False;
			DdxDBGridRenso.ReadOnly		    := False;
			DdxDBGridLongName.ReadOnly		:= False;
			DdxDBGridSimpleName.ReadOnly    := False;

            StdCmnGridTag.ReadOnly          := True;
            StdCmnGridTag.DisableEditor     := True;


			//	合計Grid
			DdxDBGrid2GCode.ReadOnly        := False;
			DdxDBGrid2LongName.ReadOnly	    := False;
            DdxDBGrid2.DragMode             := dmAutomatic;

			CmnTreeView.DragMode	        := dmAutomatic;

            EPtnName.Enabled                := True;
            Btn_Right.Enabled               := True;
            Btn_Left.Enabled                := True;
		end;
	end;

end;

//**************************************************************************
//	Proccess	:   CmnInstructionComboEnter
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.CmnInstructionComboEnter(Sender: TObject);
begin

	m_ACControl := Screen.ActiveControl;

{// <007>
// <002>↓ﾌｫｰｶｽ時にﾘｽﾄを開く
    if (Sender = CmnPrjCombo) or (Sender = CmnInstructionCombo) then
    begin
        TMComboBox(Sender).DroppedDown := True;
    end;
}
// <002>↑

	//削除ボタン使用可・不可チェック
    DelteBtnCheck();

end;

//**************************************************************************
//	Proccess	:   ErrorMessageDsp
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.ErrorMessageDsp(DmQuery: TMQuery);
begin
	case ComArea.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
			//	最大登録件数をｵｰﾊﾞｰしました
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 0,1);
			MjsMessageBoxEx(Self,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		2:
		begin
			//	･･･のため削除できません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,5);
			MjsMessageBoxEx(Self,'固定体系区分が固定' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		3:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'子供が存在する為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		4:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'仕訳が存在する為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		5:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'諸口、総合計を削除する時にその他のマスタが登録済みの為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		6:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'支払予定データが存在する為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		7:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'部署情報が存在する為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
		8:
		begin
			//	･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'未連結仕訳(部署or分散)が存在する為削除' + MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType);
		end;
// <011> ↓
        -193, -196:
        begin
            // 重複ｴﾗｰ
            ComArea.m_MsgStd.GetMsg ( MjsMsgRec, 10000, 10017 );
			MjsMessageBoxEx(Self, MjsMsgRec.sMsg, MjsMsgRec.sTitle, MjsMsgRec.icontype, MjsMsgRec.btntype, MjsMsgRec.btndef, FALSE );
        end;
        -210:
        begin
            // ﾛｯｸｴﾗｰ
            ComArea.m_MsgStd.GetMsg ( MjsMsgRec, 10000, 10016 );
			MjsMessageBoxEx(Self, MjsMsgRec.sMsg, MjsMsgRec.sTitle, MjsMsgRec.icontype, MjsMsgRec.btntype, MjsMsgRec.btndef, FALSE );
        end;
// <011> ↑
		else
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmQuery );
			MjsMessageBoxEx(Self, MjsMsgRec.sMsg, MjsMsgRec.sTitle, MjsMsgRec.icontype, MjsMsgRec.btntype, MjsMsgRec.btndef, FALSE );
		end;
	end;
end;
//**************************************************************************
//	Proccess	:   Tree内での移動
//	Name		:	Y.Ichihashi
//	Date		:	2004/09/00
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP018004f.fnUpdateTreeViewItemsEx(cNodeSrc, cNodeSrcParent,
  cNodeDst, cNodeDstParent: TTreeNode);
var
    stRecDst      : ^TreeViewRec;														// 挿入先ﾉｰﾄﾞ･ﾃﾞｰﾀ
    stRecDstParent: ^TreeViewRec;														// 挿入先ﾉｰﾄﾞ･ﾃﾞｰﾀ(親)
	strExCodeWork : String;																// 補助外部ｺｰﾄﾞ Work

begin
	stRecDst		:= cNodeDst.Data;													// 挿入先ﾉｰﾄﾞ     ﾃﾞｰﾀ取得

	if	(cNodeDstParent <> nil) then
		stRecDstParent  := cNodeDstParent.Data											// 挿入先ﾉｰﾄﾞ(親) ﾃﾞｰﾀ取得
	else
		stRecDstParent	:= nil;

	if	((stRecDst^.nDivision = 0) or (stRecDst^.nDivision = 9)) then	                // 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
	begin
		cNodeSrc.MoveTo (cNodeDst, naInsert);											// 挿入元ﾉｰﾄﾞを挿入先(子)ﾉｰﾄﾞの前に移動

		if	(stRecDstParent <> nil) then
			strExCodeWork	:= stRecDstParent^.strExCode
		else
			strExCodeWork	:= '';
	end
	else																				// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
	begin
		cNodeSrc.MoveTo (cNodeDst, naAddChild);											// 挿入元ﾉｰﾄﾞを挿入先(親)ﾉｰﾄﾞの子として末尾に移動

		strExCodeWork	:= stRecDst^.strExCode;
	end;
end;

procedure TJNTCRP018004f.FormShow(Sender: TObject);
begin
	JNTMASSetCaption( m_pMyAppRecord );
	MJSBtnVisible( TJNTCRP018004f(Self), True );

//	if (m_iMailKbn = 1) or (giReferFlag = REFER) then
//		BSpeedButtonDel.Visible := False;
//    BSpeedButtonDel.Enabled := m_cJNTArea.IsDelete;

{
	if mjspreview.IsPreview then
		mjspreview.Show
	else
		m_ACControl.SetFocus;
}
end;

//**********************************************************************
//	Proccess	:	ﾌｫｰｶｽ設定処理
//	Name		:	A.Takara (RIT)
//	Date		:	2003/01/31
//	Parameter	:	Sender
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP018004f.WMSetFocus(var Msg: TWMSetFocus);
begin
    Exit;
//	m_ACControl.SetFocus;

	Inherited;
end;

procedure TJNTCRP018004f.BSpeedButtonPrnClick(Sender: TObject);
var
    lvRet   : 	Integer;
    JNTPDlg :   TFrmJNTPDialog;	// <999>
begin

    // 販売ｼｽﾃﾑｴﾘｱに設定
    m_cJNTArea.setSelAppRecord;

    uvHani.pvMasterKbn := m_KousyuKbn;
    uvHani.pvHojyoName := m_KousyuName;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<999>
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<Del10-VerUp001><D10_OwnMapRules> ST
	dbCorp_Select.FormatOptions.MapRules.Clear;
	dbCorp_Select.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED
    // 財務ｼｽﾃﾑｴﾘｱに設定し直し
    m_cJNTArea.setMasAppRecord;

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
	        case uvHani.pvrPattern of
				0:
	            begin
	            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
    	        	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
        	    	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
    	            PrintKousyu();
					PrtParam.TargetMD    := DdxMemPrintKousyu;
            	end;

	            1:
    	        begin
	            	m_nOrderDivision	:= uvHani.pvrOrder;             		// <004>
        	        PrintKousyuPtn();
					PrtParam.TargetMD    := DdxMemPrintKousyuPtn;
	            end;
            end;


		    with PrtParam do
			begin
		        Para		:=  uvHani;
				TargetQry	:=  DmqPrint;
				//TargetMD    :=  nil;
				CorpSys		:=  uvSelSys;
		        JNTArea     :=  m_cJNTArea;
			end;
		    // 印刷する
		    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else Exit;		//ｴﾗｰ
    end;
{

var
	dqPrintWork      : TMQuery;
	cDlgCondition    : TJNTCRP018004_D3f;
	cDlgPrint	     : TMJSPrnDlgf;
	cMemDataWork	 : TdxMemData;
	stMessageRec	 : TMJSMsgRec;
	nReturn		     : Integer;
	sTitle			 : TStringList;		//	HIS0007
	sMemFld			 : TStringList;		//	HIS0007
begin
	cMemDataWork	:= nil;

	cDlgCondition	:= TJNTCRP018004_D3f.fnCreateDialog (Pointer (m_pMyAppRecord), Self, MDataModule, dbCorp_Select, m_CodeDigit, m_CodeAttr, m_KousyuName);

	if	(cDlgCondition.ShowModal () = mrCancel) then
		Exit;

    sTitle	:=	TStringList.Create;
	sMemFld	:=	TStringList.Create;

	m_nOrderDivision	:= cDlgCondition.m_nOrderDivision;											// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr	:= cDlgCondition.m_strExCodeScopeStr;										// 開始実在工種ｺｰﾄﾞ
	m_strExCodeScopeEnd	:= cDlgCondition.m_strExCodeScopeEnd;										// 終了実在工種ｺｰﾄﾞ
	m_intExCodeScopeStr	:= cDlgCondition.m_intExCodeScopeStr;										// 開始実在工種ﾊﾟﾀｰﾝｺｰﾄﾞ
	m_intExCodeScopeEnd	:= cDlgCondition.m_intExCodeScopeEnd;										// 終了実在工種ﾊﾟﾀｰﾝｺｰﾄﾞ

	dqPrintWork	:= TMQuery.Create (Self);													// MQueryの構築
	MDataModule.SetDBInfoToQuery (dbCorp_Select, dqPrintWork);										// DBとMQueryの接続

	cDlgPrint	:= TMJSPrnDlgf.Create (Self);
	PrnSupport  := TMjsPrnSupport.Create ();

	gfnJNTMasSetPrnInfo (PrnSupport, dqPrintWork);

	case (cDlgCondition.m_nPrintDivision) of
        0   :
        begin
			PrnSupport.ApRB				:=	RReportKousyu;
			PrnSupport.strDocName		:=	m_KousyuName + '登録リスト';
			PrnSupport.pPage			:=	SVppPage;	  		//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	SVppDate;	  		//	日付
			PrnSupport.pCorpCode		:=	LppCorpCode;		//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	LppCorpName;		//	会社名称
			PrnSupport.pAccountOffice	:=	LppAccOffice;		//	会計事務所名称
			PrnSupport.strFileName		:=	rcCOMMONAREA ( m_pMyAppRecord^.m_pCommonArea^ ).SysCliRoot +
											'\tmp\' + m_KousyuName + '登録リスト.csv';
        end;

        1   :
        begin
			PrnSupport.ApRB				:=	RReportKousyuPtn;
			PrnSupport.strDocName		:=	m_KousyuName + 'パターン登録リスト';
			PrnSupport.pPage			:=	SVppPage2;	  		//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	SVppDate2;	  		//	日付
			PrnSupport.pCorpCode		:=	LppCorpCode2;		//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	LppCorpName2;		//	会社名称
			PrnSupport.pAccountOffice	:=	LppAccOffice2;		//	会計事務所名称
			PrnSupport.strFileName		:=	rcCOMMONAREA ( m_pMyAppRecord^.m_pCommonArea^ ).SysCliRoot +
											'\tmp\' + m_KousyuName + 'パターン登録リスト.csv';

			m_strExCodePrint	:= '';
        end;
    end;

	PrnSupport.pComArea	 	:= m_pMyAppRecord^.m_pCommonArea;
	PrnSupport.iDspFileBtn	:= 1; 								// ファイル出力表示
	PrnSupport.iSysCode		:= m_pMyAppRecord^.m_iSystemCode;   // システムコード
	PrnSupport.MdataModule	:= MDataModule;
	PrnSupport.iReportID    :=	990100;							//	帳票ｸﾞﾙｰﾌﾟNO

	nReturn	:= cDlgPrint.DoDLG (PrnSupport);

	if	(nReturn > 0) then
	begin
		if	((mjspreview.IsExistPreview ()) and (PrnSupport.iCommand = PDLG_PREVIEW)) then
		begin
			ComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 1);

			MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

			cDlgPrint  .Free ();
			dqPrintWork.Free ();

			Exit;
		end;

		case (cDlgCondition.m_nPrintDivision) of
			0:
            begin
				pLKousyuTitle.Caption   := m_KousyuName + '登録リスト';

				LineKousyuTitle.Left	:= pLKousyuTitle.Left;
    			LineKousyuTitle.Width	:= pLKousyuTitle.Width;

                PrintKousyu();

				cMemDataWork    := DdxMemPrintKousyu;
            end;

            1:
            begin
				pLKousyuPtnTitle.Caption    := m_KousyuName + 'パターン登録リスト';

				LineKousyuPtnTitle.Left	    := pLKousyuPtnTitle.Left;
    			LineKousyuPtnTitle.Width	:= pLKousyuPtnTitle.Width;

                PrintKousyuPtn();

				cMemDataWork    := DdxMemPrintKousyuPtn;
            end;
        end;

		if	((PrnSupport.iCommand = PDLG_PRINT) or (PrnSupport.iCommand = PDLG_PREVIEW)) then
			mjspreview.Exec (PrnSupport, cDlgPrint, nil)
		else if	(PrnSupport.iCommand = PDLG_FILE) then
		begin
			fnSetFileOutTF(cDlgCondition.m_nPrintDivision,sTitle,sMemFld);
			if ( MjsFileOut(cMemDataWork, sMemFld, sTitle, PrnSupport, m_pMyAppRecord) = -1 ) then
			begin
				//	ファイル出力大失敗
				ComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
		    	MjsMessageBoxEx(Self,stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
			end;
		end;
    end;
}
end;



procedure TJNTCRP018004f.PrintKousyu;
var
    Qe          :   TMQuery;
    iCnt        :   Integer;
    iLength     :   Integer;
    sCnt        :   String;
	sWork1		:	String;
	sWork2		:	String;
    strFormat   :   String;
    strExCode   :   String;
	DmqFusen	:	TMQuery;		//<008> 付箋情報
begin
    Qe  := TMQuery.Create (Self);			                    // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		    // DBとMQueryの接続

	DmqFusen := TMQuery.Create( Self );					        //<008>	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqFusen );	//<008>	DBとMQueryの接続

    iCnt    := 0;

    DdxMemPrintKousyu.Close;
    DdxMemPrintKousyu.Open;

    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.Add('select * from HojyoMA ');
    Qe.SQL.Add('where  MasterKbn = :pMstkbn ');
    Qe.SQL.Add('and    RDelKbn = 0  ');
// <005>↓
{    Qe.SQL.Add('and   (GCode Between :StCode and :EdCode) ');
	if (m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
    	Qe.SQL.Add ('ORDER BY GCode')
	else																	// 印刷範囲指定: 1=連想順
		Qe.SQL.Add ('ORDER BY Renso, GCode');

    Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
    Qe.ParamByName('StCode').AsString   := m_strExCodeScopeStr;
    Qe.ParamByName('EdCode').AsString   := m_strExCodeScopeEnd;
}
    // ｺｰﾄﾞ範囲指定
                                            // 開始のみ
    if (m_strExCodeScopeStr <> '') and (m_strExCodeScopeEnd = '') then
    begin
        Qe.SQL.Add(' AND GCode >= :StCode');
        Qe.ParamByName('StCode').AsString   := m_strExCodeScopeStr;
    end
                                            // 終了のみ
    else if (m_strExCodeScopeStr = '') and (m_strExCodeScopeEnd <> '') then
    begin
        Qe.SQL.Add(' AND GCode <= :EdCode');
        Qe.ParamByName('EdCode').AsString   := m_strExCodeScopeEnd;
    end
                                            // 開始・終了設定
    else if (m_strExCodeScopeStr <> '') and (m_strExCodeScopeEnd <> '') then
    begin
        Qe.SQL.Add('and   (GCode Between :StCode and :EdCode) ');
        Qe.ParamByName('StCode').AsString   := m_strExCodeScopeStr;
        Qe.ParamByName('EdCode').AsString   := m_strExCodeScopeEnd;
    end;

    Qe.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;

	if (m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
    	Qe.SQL.Add ('ORDER BY GCode')
	else																	// 印刷範囲指定: 1=連想順
		Qe.SQL.Add ('ORDER BY Renso, GCode');

// <005>↑

    if Qe.Open = False then
    begin
        Qe.Close;
        Qe.Free;
        Exit;
    end;

    while not Qe.Eof do
    begin
		strExCode	:= Qe.GetFld ('GCode').AsString;

		case (m_CodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_CodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_CodeDigit) + 'd';
		end;

        if m_CodeAttr < 2 then              // <005>数字の場合だけ
    		strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);

        DdxMemPrintKousyu.Append;
        DdxMemPrintKousyu.FieldByName('GCode'     ).AsString    := strExCode;
        DdxMemPrintKousyu.FieldByName('Renso'   ).AsString      := Qe.GetFld('Renso'   ).AsString;
        DdxMemPrintKousyu.FieldByName('LongName'  ).AsString    := Qe.GetFld('LongName'  ).AsString;
        DdxMemPrintKousyu.FieldByName('SimpleName').AsString    := Qe.GetFld('SimpleName').AsString;

// <008>↓
		DmqFusen.Close;
		DmqFusen.SQL.Clear;
		DmqFusen.SQL.Add('SELECT '					);
    	DmqFusen.SQL.ADD(	'FusenKbn '			    );	    //	付箋区分
	    DmqFusen.SQL.ADD('FROM '	   				);
		DmqFusen.SQL.ADD(	'MFusenInfo '			);	    //	ﾏｽﾀ付箋管理情報
		DmqFusen.SQL.ADD('WHERE '					);
		DmqFusen.SQL.ADD(	'MasterKbn = :pMKBN AND '	);	//	ﾏｽﾀ区分
		DmqFusen.SQL.ADD(	'NCode = :Code'		);	        //	内部ｺｰﾄﾞ
        DmqFusen.SetFld('pMKBN').AsInteger      :=  m_KousyuKbn;
	    DmqFusen.ParamByName('Code').AsFloat	:=	Qe.GetFld('NCode').AsFloat;
		DmqFusen.Open;
		if DmqFusen.EOF <> True then
		begin
            DdxMemPrintKousyu.FieldByName('Fusen').AsSign (fnGetTagColorBitmap (DmqFusen.GetFLD('FusenKbn').AsInteger));
    	end;

// <008>↑

        DdxMemPrintKousyu.Post;

        inc(iCnt);

        Qe.Next;
    end;

    sCnt    := IntToStr(iCnt);
	iLength	:= Length(sCnt);

	if (iLength = 4) then
	begin
		sWork1	:=	COPY(sCnt,2,3);
		sWork2	:=	COPY(sCnt,1,1);
		sCnt	:=	sWork2 + ',' + sWork1;
	end;

	LKousyu_Kensu.Caption   :=	sCnt + ' 件';

    Qe.Close;
    Qe.Free;
end;


procedure TJNTCRP018004f.PrintKousyuPtn;
var
    Qe          :   TMQuery;
    Qe2         :   TMQuery;
    strFormat   :   String;
    strExCode   :   String;
begin
    Qe  := TMQuery.Create (Self);			        // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		// DBとMQueryの接続

    Qe2 := TMQuery.Create (Self);			        // MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe2 );		// DBとMQueryの接続

    DdxMemPrintKousyuPtn.Close;
    DdxMemPrintKousyuPtn.Open;

    Qe.Close;
    Qe.SQL.Clear;
{
    Qe.SQL.Add('select PtnNo, PtnName from KousyuPtn      ');
    Qe.SQL.Add('where  GCode = ''''                       ');
//    Qe.SQL.Add('and   (PtnNo between :StCode and :EdCode) ');
    Qe.SQL.Add('Order By PtnNo   ');
//    Qe.ParamByName('StCode').AsInteger  := m_intExCodeScopeStr;
//    Qe.ParamByName('EdCode').AsInteger  := m_intExCodeScopeEnd;
}
    Qe.SQL.Add('select * from KousyuPtnMA  ');
    Qe.SQL.Add('where  MasterKbn = :MasterKbn ');
    Qe.SQL.Add('and    RDelKbn   = 0          ');

    Qe.ParamByName('MasterKbn') .AsInteger   := m_KousyuKbn;
    if Qe.Open = False then
    begin
        Qe.Close;
        Qe.Free;

        Qe2.Close;
        Qe2.Free;

        Exit;
    end;

    while not Qe.Eof do
    begin
        Qe2.Close;
        Qe2.SQL.Clear;
        Qe2.SQL.Add(' select distinct GCode, LongName, Renso from HojyoMA '); // <004>
        Qe2.SQL.Add(' where  HojyoMA.NCode in ');
        //Qe2.SQL.Add('(select GCode from KousyuPtn ');
        Qe2.SQL.Add('(select KsyNCode from KousyuPtn ');
        Qe2.SQL.Add(' where  PtnNCode = :PtnNo) ');
        Qe2.SQL.Add(' and    MasterKbn = :pMstkbn ');
        Qe2.SQL.Add(' and    SumKbn    = 0 ');
        Qe2.SQL.Add(' and    RDelKbn = 0 ');
		// <004> >>
//        Qe2.SQL.Add(' Order  By GCode ');
		if (m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
    		Qe2.SQL.Add ('ORDER BY GCode')
		else																	// 印刷範囲指定: 1=連想順
			Qe2.SQL.Add ('ORDER BY Renso, GCode');
		// <004> <<
        Qe2.ParamByName('pMstKbn').Asinteger := m_KousyuKbn;
// <006>↓
//        Qe2.ParamByName('PtnNo').AsInteger  := Qe.GetFld('NCode').AsInteger;
        Qe2.ParamByName('PtnNo').AsFloat  := Qe.GetFld('NCode').AsFloat;
// <006>↑
        if Qe2.Open = False then
        begin
            Qe.Close;
            Qe.Free;

            Qe2.Close;
            Qe2.Free;

            Exit;
        end;

        while not Qe2.Eof do
        begin
    		strExCode	:= Qe2.GetFld ('GCode').AsString;

	    	case (m_CodeAttr) of
		    	0:	strFormat	:= '%'  + IntToStr (m_CodeDigit) + 'd';
			    1:	strFormat	:= '%.' + IntToStr (m_CodeDigit) + 'd';
    		end;

            if m_CodeAttr < 2 then              // <005>数字の場合だけ
	        	strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);

            DdxMemPrintKousyuPtn.Append;
            DdxMemPrintKousyuPtn.FieldByName('PtnNo'   ).AsInteger  := Qe.GetFld('PtnNo'    ).AsInteger;
            DdxMemPrintKousyuPtn.FieldByName('PtnName' ).AsString   := Qe.GetFld('PtnName'  ).AsString;
            DdxMemPrintKousyuPtn.FieldByName('GCode'   ).AsString   := strExCode;
            DdxMemPrintKousyuPtn.FieldByName('LongName').AsString   := Qe2.GetFld('LongName').AsString;
            DdxMemPrintKousyuPtn.Post;

            Qe2.Next;
        end;

        Qe.Next;
    end;
end;


procedure TJNTCRP018004f.fnSetFileOutTF(PrintDivision: Integer; var sTitle,
  sMemFld: TStringList);
begin
	case PrintDivision of
		0:
		begin
			sTitle.Add('コード'	 );
			sTitle.Add('連想'    );
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');

			sMemFld.Add	('GCode'	 );
			sMemFld.Add	('Renso'	 );
			sMemFld.Add	('LongName'	 );
			sMemFld.Add	('SimpleName');
        end;

        1:
        begin
			sTitle.Add('パターンNo'	 );
			sTitle.Add('パターン名称');
            sTitle.Add('コード'      );
            sTitle.Add('作業内訳名称'    );

			sMemFld.Add	('PtnNo'   );
			sMemFld.Add	('PtnName' );
			sMemFld.Add	('GCode'   );
			sMemFld.Add	('LongName');
        end;
    end;
end;


procedure TJNTCRP018004f.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand1.LastRecord) or
		(ppDetailBand1.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand1.OverFlow = False) then
			ppDetailBand1.OverFlow	:=	True;

		if (ReportkousyuLineDetailsBottom.ReprintOnOverFlow = False) then
			ReportkousyuLineDetailsBottom.ReprintOnOverFlow	:=	True;

		ReportkousyuLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ReportkousyuLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TJNTCRP018004f.ppDetailBand2BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand2.LastRecord) or
		(ppDetailBand2.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand2.OverFlow = False) then
			ppDetailBand2.OverFlow	:=	True;

		if (ReportkousyuPtnLineDetailsBottom.ReprintOnOverFlow = False) then
			ReportkousyuPtnLineDetailsBottom.ReprintOnOverFlow	:=	True;

		ReportkousyuPtnLineDetailsBottom.Visible    :=	True;
		ReportkousyuPtnLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ReportkousyuPtnLineDetailsBottom.Visible    :=	False;
		ReportkousyuPtnLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TJNTCRP018004f.ppDBTextPtnNoPrint(Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;

begin
	cDBTextExCode	:= Sender as TppDBText;
	strExCode		:= cDBTextExCode.Text;

	if	(CompareStr (strExCode, m_strExCodePrint) = 0) then
	begin
		cDBTextExCode.Visible	:= False;

		ppDBTextPtnName.Visible	:= False;
		ReportkousyuPtnLineDetailsTop.Visible	:= False;
	end
	else
    begin
		cDBTextExCode.Visible	:= True;

		ppDBTextPtnName.Visible	:= True;

		if	(m_strExCodePrint = '') then
			ReportkousyuPtnLineDetailsTop.Visible	:= False
	    else
			ReportkousyuPtnLineDetailsTop.Visible	:= True;

		m_strExCodePrint	:= strExCode;
	end;
end;

procedure TJNTCRP018004f.RReportKousyuPtnEndPage(Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;

//**********************************************************************
//	Proccess	:   GCodeを受け取りHojyoMAよりNCodeを返す
//	Name		:
//	Date		:
//	Parameter	:	pGCode  : 外部ｺｰﾄﾞ
//	Return		:	Extened : 内部ｺｰﾄﾞ
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP018004f.fnNCodeGet(pGCode:String): Extended;
var
    MQry    :   TMQuery;

begin

    Result := 0;

	MQry := TMQuery.Create(Self);			                                    // MQueryの構築
	MDataModule.SetDBInfoToQuery(dbCorp_Select, MQry);		                    // DBとMQueryの接続

    try
        with MQry do
        begin
            Close;
            SQL.Clear;
            SQL.ADD('select NCode from HojyoMA ');
            SQL.ADD('where GCode     = :pGCode ');
            SQL.ADD(' and  MasterKbn = :pMstKbn');
            SQL.ADD(' and  RDelKbn   = 0       ');

            ParamByName('pMstKbn').AsInteger := m_KousyuKbn;
            ParamByName('pGCode').AsString   := pGCode;

            Open;

            if not EOF then
                Result := GetFld('NCode').AsFloat;
        end;
    finally
        MQry.Close;
        MQry.Free;
    end;

end;

//-----------------------------------------------------------------------------
// fnChgBtnAction() <11>
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP018004f.fnChgBtnAction;
var
    AppPrm: TAppParam;
    lvRect: TRect;
    lvWidth, lvHeight: Integer;
//    lvBit:      TBitMap;
begin

//    lvBit       :=  TBitMap.Create;

    if  (BSpeedButtonChg.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        AppPrm.iAction      :=  ACTID_DOCKINGINEND;         //  格納通知

        BSpeedButtonChg.Caption := '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
//        ImLst.GetBitmap(0,lvBit);
    end
    else
    begin
		Visible     :=	False;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect      := Self.ClientRect;
        lvWidth     := lvRect.Right - lvRect.Left;
        lvHeight    := lvRect.Bottom - lvRect.Top;

        ClientWidth  :=  lvWidth;
        ClientHeight :=  lvHeight;
		Visible		 :=	True;

        // 親画面への設定
        AppPrm.iAction      :=  ACTID_DOCKINGOUTEND;         //  取出通知
        BSpeedButtonChg.Caption := '埋込(&G)';               // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
//        ImLst.GetBitmap(1,lvBit);
    end;
//    BSpeedButtonChg.Glyph  :=  lvBit;

    AppPrm.pRecord         :=    Pointer(m_pMyAppRecord);    // 管理構造体ﾎﾟｲﾝﾀ設定
    AppPrm.pActionParam    :=    nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@AppPrm);
end;

//-----------------------------------------------------------------------------
//<02>
//
// fnGetMasterInfo
//      MasterInfo取得・CmnPrjCombo作成
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP018004f.fnGetMasterInfo();
var
    Qe              :   TMQuery;
    Qe2             :   TMQuery;
    iLoop           :   Integer;
    lvKMasteKbn     :   Integer;
    lvKousyuKbn     :   Integer;

begin

    iLoop   :=  0;

	Qe  := TMQuery.Create (Self);			                //  MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe );		//	DBとMQueryの接続

	Qe2  := TMQuery.Create (Self);			                //  MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Qe2 );		//	DBとMQueryの接続


    if ( DPrjComboData.Active ) then DPrjComboData.Close;
        DPrjComboData.Open;


    // 工事採用
    Qe.Close;
    Qe.SQL.Clear;
    Qe.SQL.add(' Select MasterKbn,JHojyoName From MasterInfo '+
               ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
               ' and (KojUseKBN <> 0 )');
    Qe.ParamByName('pSMKBN').AsInteger := ucSKO_MKBN;
    Qe.ParamByName('pEMKBN').AsInteger := ucEKO_MKBN;
    Qe.Open;
    if not Qe.Eof then
         m_KojiFlg   := True;   //工事採用ON


    // 作業内訳限定処理↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    if m_pMyAppRecord.m_sParameter <> '1' then
    begin
        m_KojiFlg   := True;        // 作業内訳登録時には工事採用は常にTrue

//        lvKMasteKbn := 0;
//        lvKousyuKbn := 0;
        uvKMasteKbn := 0;
        m_KousyuKbn := 0;
        Qe.Close;
        Qe.SQL.Clear;
        Qe.SQL.add(' Select MasterKbn,JHojyoName From MasterInfo '+
                   ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
                   ' and (UseKBN <>0 and KojUseKbn = 0 )');  // ﾌﾟﾛｼﾞｪｸﾄ採用のみ
        Qe.ParamByName('pSMKBN').AsInteger := ucSKO_MKBN;
        Qe.ParamByName('pEMKBN').AsInteger := ucEKO_MKBN;

        Qe.Open;
    end;
    // 作業内訳限定処理↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    if not Qe.Eof then
    begin

        iLoop := 0;
        while not Qe.Eof do
        begin
            //工種MasterKbn判別（3桁対応）
            lvKMasteKbn := Qe.GetFLD('MasterKbn').AsInteger;
            lvKousyuKbn :=
                (lvKMasteKbn
                    - (StrToInt(Copy(IntToStr(ucSKO_MKBN),1,1)) * 100)
                    + (StrToInt(Copy(IntToStr(lvKMasteKbn + 100),1,1)) * 100));

            Qe2.Close;
            Qe2.SQL.Clear;
            Qe2.SQL.Add('SELECT * FROM MasterInfo ');
            Qe2.SQL.Add('WHERE MasterKbn=:pMstKbn ');
            Qe2.SQL.Add('AND    UseKbn   <> 0     ');
            Qe2.ParamByName('pMstKbn').Asinteger := lvKousyuKbn;
            Qe2.Open;

            if not Qe2.Eof then
            begin
                //ﾌﾟﾛｼﾞｪｸﾄCombo
                CmnPrjCombo.Items.Add(Qe2.GetFld('JHojyoName').AsString);
                //ﾌﾟﾛｼﾞｪｸﾄMem
                DPrjComboData.Append;
                DPrjComboData.FieldByName('Index')      .AsInteger  :=  iLoop;
                DPrjComboData.FieldByName('KojMstKbn')  .AsInteger  :=  lvKMasteKbn;
                DPrjComboData.FieldByName('KosyuMstKbn').AsInteger  :=  lvKousyuKbn;
                DPrjComboData.FieldByName('JHojyoName') .AsString   :=  Qe2.GetFld('JHojyoName').AsString;
                DPrjComboData.FieldByName('CodeAttr')   .AsInteger  :=  Qe2.GetFld('CodeAttr' ).AsInteger;
                DPrjComboData.FieldByName('CodeDigit')  .AsInteger  :=  Qe2.GetFld('CodeDigit').AsInteger;
                DPrjComboData.Post;
                iLoop := iLoop +1;
                Next;
                CmnPrjCombo.DropDownCount := iLoop;
            end;
            Qe.Next;
        end;
    end;

    if iLoop > 0 then
        m_KousyuFlg := True;

end;

//-----------------------------------------------------------------------------
//<02>
//
// fnGetMstKbn
//	< MasterKbn取得 >
//-----------------------------------------------------------------------------
function TJNTCRP018004f.fnGetMstKbn( pIndex:Integer ):Boolean;
var
    iLoop       :   Integer;
  	stItemRec   :   ^TreeViewRec;

begin
    Result  :=  false;

    with DPrjComboData do
    begin
        First;
        while not Eof do
        begin

            if ( FieldByName('Index').AsInteger = pIndex ) then
            begin
                uvKMasteKbn := FieldByName('KojMstKbn').AsInteger;
                m_KousyuKbn := FieldByName('KosyuMstKbn').AsInteger;

                m_KousyuName    := FieldByName('JHojyoName').AsString;
                m_CodeAttr      := FieldByName('CodeAttr' ).AsInteger;
                m_CodeDigit     := FieldByName('CodeDigit').AsInteger;

                DdxDBGrid2LongName.Caption      := FieldByName('JHojyoName').AsString + '名称';
                CmnPanelGroupTitleRight.Caption := FieldByName('JHojyoName').AsString + 'パターン名称';

                //情報区分Combo初期化
                CmnInstructionCombo.Items.Clear;
                CmnInstructionCombo.Items.Add(FieldByName('JHojyoName').AsString + '登録');
                CmnInstructionCombo.Items.Add(FieldByName('JHojyoName').AsString + 'パターン登録');

                //Grid初期化
                CmnInstructionCombo.ItemIndex    :=  0;
                DKousyuMemData.Close;
                DKousyuMemData.Open;

                //Ptn初期化
                EPtnNo.Value            := 0;
                EPtnName.Text           := '';
                m_PtnNCode              := 0;
                m_Code                  := 0;
                m_Name                  := '                              ';
                DPtnMemData.Close;

                //Tree初期化
                for iLoop := 0 to CmnTreeView.Items.Count -1 do
                begin
                    stItemRec   := CmnTreeView.Items[CmnTreeView.Items.Count -1].Data;
                    Dispose(stItemRec);
                    CmnTreeView.Items[CmnTreeView.Items.Count -1].Delete;
                end;

                //Grid設定
                if  (m_CodeAttr = 2) then
                begin
            		DdxDBGridGCode.Alignment		:= taLeftJustify;
            		DdxDBGridGCode.EditAlignment	:= taLeftJustify;
            		DdxDBGridGCode.MaxLength		:= m_CodeDigit;
            		DdxDBGridGCode.ImeMode			:= imClose;
            		DdxDBGridGCode.Hankaku			:= TRUE;

                    StdCmnGridTag.ReadOnly          := True;
                    StdCmnGridTag.DisableEditor     := True;

            		DdxDBGrid2GCode.Alignment		:= taLeftJustify;
            		DdxDBGrid2GCode.EditAlignment	:= taLeftJustify;
            		DdxDBGrid2GCode.MaxLength		:= m_CodeDigit;
            		DdxDBGrid2GCode.ImeMode			:= imClose;
            		DdxDBGrid2GCode.Hankaku			:= TRUE;

                end
                else
                begin
            		DdxDBGridGCode.Alignment		:= taRightJustify;
            		DdxDBGridGCode.EditAlignment	:= taRightjustify;
            		DdxDBGridGCode.MaxLength		:= m_CodeDigit;
            		DdxDBGridGCode.ImeMode			:= imDisable;
            		DdxDBGridGCode.Hankaku			:= FALSE;

                    StdCmnGridTag.ReadOnly          := True;
                    StdCmnGridTag.DisableEditor     := True;

            		DdxDBGrid2GCode.Alignment		:= taRightJustify;
            		DdxDBGrid2GCode.EditAlignment	:= taRightjustify;
            		DdxDBGrid2GCode.MaxLength		:= m_CodeDigit;
            		DdxDBGrid2GCode.ImeMode			:= imDisable;
            		DdxDBGrid2GCode.Hankaku			:= FALSE;
                end;

                Result := True;
                Break;
            end;

            Next;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//<02>  CmnPrjComboChange
//-----------------------------------------------------------------------------
procedure TJNTCRP018004f.CmnPrjComboChange(Sender: TObject);
begin

    //ﾌﾟﾛｼﾞｪｸﾄCombo
    if not CmnPrjCombo.DroppedDown then
    begin
        if fnGetMstKbn(CmnPrjCombo.ItemIndex) = false then
            exit
        else
        begin
            if not m_OccupiedFlg then
            begin
               //採用情報DLG・諸口DLG
                fnChangeSelectionScreen;

                if PPanelKousyu.Visible then
                begin
                    m_ACControl := DdxDBGrid;
                    m_ACControl.SetFocus;
                  	DdxDBGrid.FocusedColumn	:= ColumnGCode;
                end else
                begin
                    m_ACControl := EPtnNo;
                    m_ACControl.SetFocus;
                end;

            end;
            m_OccupiedFlg := False;

       end;
        m_ComboItemPrj := CmnPrjCombo.ItemIndex;
    end;

end;

//-----------------------------------------------------------------------------
//<02>  CmnPrjComboExit
//-----------------------------------------------------------------------------
procedure TJNTCRP018004f.CmnPrjComboExit(Sender: TObject);
begin

    //ﾌﾟﾛｼﾞｪｸﾄCombo
    if not CmnPrjCombo.DroppedDown then
        m_ComboItemPrj := CmnPrjCombo.ItemIndex;


end;

//**********************************************************************
//*		Proccess	:
//*		Parameter	:	strHojCode	:	補助ｺｰﾄﾞ
//*		Return		:	(True)/(False)
//*		History		:
//**********************************************************************
function TJNTCRP018004f.fnCheckExCodeValidCharacter(strHojCode: String): Boolean;
begin

	if (Trim (strHojCode) = '') then
	begin
		Result := TRUE;
		Exit;
	end;

	if (m_CodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		Result := TRUE;
		Exit;
	end;

	if (not JNTMASERRORCODECHECK (strHojCode, m_strValidCharacters)) then
	begin
		Beep ();

		ComArea.m_MsgStd.GetMsg (MjsMsgRec, 30, 21);

		MJSMessageBoxEx (Self,MjsMsgRec.sMsg, m_pMyAppRecord^.m_ProgramName, MjsMsgRec.icontype,
										MjsMsgRec.btntype, MjsMsgRec.btndef, MjsMsgRec.LogType);

		Result := FALSE;
		Exit;
	end;

	Result := TRUE;
end;

//**********************************************************************
//*		Proccess	:
//*		History		:
//**********************************************************************
procedure TJNTCRP018004f.fnChangeCondition(fEnable: Boolean);
begin

    PPanelKousyu.Visible    := True;
    PPanelPtn.Visible       := False;

    if fEnable = False then
    begin
        PPanelKousyu.Enabled := False;
        PPanelPtn.Enabled    := False;

      	CmnInstructionCombo.ItemIndex	:= 0;
        CmnInstructionCombo.Items.Clear;
        CmnInstructionCombo.Enabled := False;
    end
    else begin
        PPanelKousyu.Enabled := True;
        PPanelPtn.Enabled    := True;

        CmnInstructionCombo.Enabled := True;
    end;

end;

//**********************************************************************
//*		Proccess	:
//*		History		:
//**********************************************************************
procedure TJNTCRP018004f.CmnToolbarButtonTagsClick(Sender: TObject);
var
//	stItemRec	: ^TreeViewRec;
	nTagKindWork: Integer;

begin
	nTagKindWork	:= 0;

	case (CmnToolbarButtonTag.ImageIndex) of
		0:	nTagKindWork	:= 1;
		1:	nTagKindWork	:= 3;
		2:	nTagKindWork	:= 2;
		3:	nTagKindWork	:= 4;
	end;

  	if	 (Screen.ActiveControl.Name = DdxDBGrid.Name) then
    begin
    	fnUpdateMasterDataTagInfo (DKousyuMemData.FieldByName ('NCode').AsFloat, nTagKindWork);
    	fnUpdateGridMemDataRecord (m_KousyuKbn,DKousyuMemData.FieldByName ('GCode').AsString, nTagKindWork);
   	end;

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP018004f.fnUpdateMasterDataTagInfo
//*
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報更新
//*
//*	戻り値	: Boolean, (TRUE:正常, FALSE:異常)
//*
//*---------------------------------------------------------------------
//*
//*	ﾊﾟﾗﾒｰﾀ	: cExCode	= 内部ｺｰﾄﾞ
//*           nTagKind  = 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)
//*
//**********************************************************************
function	TJNTCRP018004f.fnUpdateMasterDataTagInfo(cExCode: Extended; var nTagKind: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin

	MDataModule.BeginTran(dbCorp_Select);										// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData := TMQuery.Create(Self);                                       // MQueryの構築
	MDataModule.SetDBInfoToQuery(dbCorp_Select, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('select FusenKbn from MFusenInfo                  ');
		SQL.Add('where MasterKbn = :nMasterKbn and NCode = :cNCode');

		SetFld('nMasterKbn').AsInteger := m_KousyuKbn;
		SetFld('cNCode'    ).AsFloat   := cExCode;

		Open();

		if  (not EOF) then
		begin
			if ((nTagKind = 0) or
                (GetFld('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind := 0;

				Close();

				SQL.Clear();
				SQL.Add('delete from MFusenInfo                           ');
				SQL.Add('where MasterKbn = :nMasterKbn and NCode = :cNCode');
			end
			else
			begin
				Close ();

				SQL.Clear();
				SQL.Add('update MFusenInfo set FusenKbn = :nTagDivision, FusenCmnt = ''''');
				SQL.Add(', UpdTantoNCode = :nUpdTantoNCode ');
				SQL.Add('where  MasterKbn = :nMasterKbn and NCode = :cNCode              ');

				ParamByName('nTagDivision').AsInteger := nTagKind;
                ParamByName('nUpdTantoNCode').AsFloat    := m_TantoNCode; // <202>
			end;

			ParamByName('nMasterKbn').AsInteger := m_KousyuKbn;
			ParamByName('cNCode'    ).AsFloat   := cExCode;

			if (not ExecSQL()) then
			begin
				ComArea.m_MsgStd.GetMsgDB(MjsMsgRec, dqMasterData);
				m_nDBErrorCode := ComArea.m_MsgStd.GetDBCode(dqMasterData);

				fnOutputDBErrorMessage();

				MDataModule.Rollback(dbCorp_Select);							// ﾛｰﾙﾊﾞｯｸ
				dqMasterData.Close();
				dqMasterData.Free();
				Result := False;
				Exit;
			end;

			MDataModule.Commit(dbCorp_Select);									// ｺﾐｯﾄ

			dqMasterData.Close();
			dqMasterData.Free();

// <034> ADD start
            if nTagKind = 0 then
            begin
				m_aryFusenData[DKousyuMemData.RecNo - 1].strCmnt := '';
			end;
// <034> ADD end

			Result := True;
			Exit;
		end;

		Close();
	end;

	with (dqMasterData) do
	begin
		Close();

		SQL.Clear();
		SQL.Add('insert into MFusenInfo                                          ');
        SQL.Add('(MasterKbn, SubNCode, NCode, FusenKbn, FusenCmnt, UpdTantoNCode)');
// <034> MOD start
//		SQL.Add('values (:nMasterKbn, 0, :cNCode, :nFusenKbn, '' '', :cUpdNCode) ');
		SQL.Add('values (:nMasterKbn, 0, :cNCode, :nFusenKbn, :parFusenCmnt, :cUpdNCode) ');
// <034> MOD end

		ParamByName('nMasterKbn').AsInteger := m_KousyuKbn;
		ParamByName('cNCode'    ).AsFloat   := cExCode;
		ParamByName('nFusenKbn' ).AsInteger := nTagKind;
		ParamByName('cUpdNCode' ).AsFloat   := m_TantoNCode;

// <034> ADD start
		ParamByName('parFusenCmnt').AsString:= '';
// <034> ADD end

		if (not ExecSQL()) then
		begin
			ComArea.m_MsgStd.GetMsgDB(MjsMsgRec, dqMasterData);
			m_nDBErrorCode := ComArea.m_MsgStd.GetDBCode(dqMasterData);

			fnOutputDBErrorMessage();

			MDataModule.Rollback(dbCorp_Select);								// ﾛｰﾙﾊﾞｯｸ
			dqMasterData .Close();
			dqMasterData .Free ();

			Result := FALSE;
			Exit;
		end;
	end;

	MDataModule.Commit(dbCorp_Select);											// ｺﾐｯﾄ
	dqMasterData.Close();
	dqMasterData.Free();

	Result := TRUE;

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP018004f.fnUpdateGridMemDataRecord
//*
//*	目的	: 補助登録処理
//*
//*	戻り値	: なし,
//*
//*---------------------------------------------------------------------
//*
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)
//*			  strExCode	= 部門ｺｰﾄﾞ
//*			  nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑...)
//*
//**********************************************************************
procedure	TJNTCRP018004f.fnUpdateGridMemDataRecord (nDivision: Integer; strExCode: String; nTagKind: Integer);
var
	cMemData	 : TdxMemData;
	strExCodeWork: String;
	strFormat	 : String;
	nRetRecNo	 : Integer;

begin

	strExCodeWork := strExCode;

	if	(m_CodeAttr <= 1) then
	begin
		case (m_CodeAttr) of
        0:  strFormat := '%'  + IntToStr(m_CodeDigit) + 'd';
        1:  strFormat := '%.' + IntToStr(m_CodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
	end;

	cMemData	:= DKousyuMemData;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'GCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			cMemData.First ()
		else
			cMemData.RecNo	:= nRetRecNo;

		cMemData.Edit ();
		cMemData.FieldByName ('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
		cMemData.Post ();
	end;

end;

//**********************************************************************
//*		Proccess	: fnOutputDBErrorMessage
//*		History		: エラーメッセージを返す
//**********************************************************************
procedure	TJNTCRP018004f.fnOutputDBErrorMessage ();
begin

	if (m_nDBErrorCode <> 0) then
	begin
		case (m_nDBErrorCode) of
        1:  ComArea.m_MsgStd.GetMsg(MjsMsgRec, 0, 1);
		end;
	end;

	MJSMessageBoxEx(Self, MjsMsgRec.sMsg, m_pMyAppRecord^.m_ProgramName,
                        MjsMsgRec.icontype, MjsMsgRec.btntype, MjsMsgRec.btndef, MjsMsgRec.LogType);

	m_nDBErrorCode := 0;

end;

//**********************************************************************
//*		Proccess	: fnCmnToolbarDropDownMenuItemOnClick
//*		History		: PopUpMenu変更時
//**********************************************************************
procedure	TJNTCRP018004f.fnCmnToolbarDropDownMenuItemOnClick (Sender: TObject);
begin

    CmnToolbarButtonTag.ImageIndex	:= (Sender as TMenuItem).ImageIndex;
    m_FusenClrIdx := CmnToolbarButtonTag.ImageIndex;

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP008001f.fnGetTagColorBitmap (Integer)
//*
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報取得
//*
//*	戻り値	: TBitmap,
//*
//**********************************************************************
function	TJNTCRP018004f.fnGetTagColorBitmap (nTagColor: Integer): TBitmap;
var
	bmpTagColor : TBitmap;

begin

	bmpTagColor := nil;

	case (nTagColor) of
    1:  bmpTagColor	:= CmnToolbarDropDownMenuTag001.Bitmap;
    2:	bmpTagColor	:= CmnToolbarDropDownMenuTag003.Bitmap;
    3:	bmpTagColor	:= CmnToolbarDropDownMenuTag002.Bitmap;
    4:	bmpTagColor	:= CmnToolbarDropDownMenuTag004.Bitmap;
	end;

	Result := bmpTagColor;

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP018004f.fnStdCmnGridPopupMenuTagOnClick (TObject)
//*
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick ｲﾍﾞﾝﾄ
//*
//*	戻り値	: なし,
//*
//**********************************************************************
procedure	TJNTCRP018004f.fnStdCmnGridPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem: TMenuItem;
	nTagKind : Integer;

begin

	cMenuItem := Sender as TMenuItem;

	if	(cMenuItem.Name = StdCmnGridPopupMenuTagOff.Name) then
		nTagKind := 0
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01.Name) then
		nTagKind := 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02.Name) then
		nTagKind := 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03.Name) then
		nTagKind := 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04.Name) then
		nTagKind := 4
	else
		nTagKind := 0;

	fnSetGridTagInfo (nTagKind);

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP018004f.fnStdCmnGridPopupMenuTagOnClickEx (TObject)
//*
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick ｲﾍﾞﾝﾄ
//*
//*	戻り値	: なし,
//*
//**********************************************************************
procedure	TJNTCRP018004f.fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);
var
	dqMasterData    :   TMQuery;
	cMasDlgParam    :   TJNTMasDLGParam;
	cMasDlgIF	    :   TJNTMASFUSENBIKODLGIF;
	cMenuItem	    :   TMenuItem;
	cMemData	    :   TdxMemData;
	nCount		    :   Integer;
	nTagKindWork    :   Integer;
	fIgnore		    :   Boolean;

    strExCode       :   String;

begin

	cMenuItem	 := Sender as TMenuItem;
	nTagKindWork := 0;
	fIgnore		 := False;

	if (cMenuItem.Name = StdCmnGridPopupMenuTagComment.Name) then
	begin
		for	nCount := 1 to 4 do
		begin
			if (not TMenuItem(MJSFindCtrl(Self, Format('StdCmnGridPopupMenuTag%.2d', [nCount]))).Visible) then
			begin
				case (nCount) of
                1:	nTagKindWork := 1;
                2:	nTagKindWork := 3;
                3:	nTagKindWork := 2;
                4:	nTagKindWork := 4;
				end;
			end;
		end;

		fIgnore	:= True;
	end
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01Ex.Name) then
		nTagKindWork := 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02Ex.Name) then
		nTagKindWork := 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03Ex.Name) then
		nTagKindWork := 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04Ex.Name) then
		nTagKindWork := 4
	else
		Exit;

	if (not fIgnore) then
		fnSetGridTagInfo(nTagKindWork);

	cMasDlgIF := TJNTMASFUSENBIKODLGIF.Create();
	cMasDlgIF.Init (Self,Pointer(m_pMyAppRecord));

	cMasDlgParam := TJNTMasDLGParam.CreateParam();

	cMasDlgParam.m_iMasterkbn := m_KousyuKbn;     								// ﾏｽﾀ区分

	cMasDlgParam.m_iNCode	 := 0;												// 科目ｺｰﾄﾞ
	cMasDlgParam.m_iSubNCode := 0;												// 科目別補助ｺｰﾄﾞ

	if (m_CodeAttr <= 1) then
	begin
		if (DKousyuMemData.FieldByName ('GCode').AsString <> '') then
			strExCode := Format ('%.16d', [StrToInt64 (Trim (DKousyuMemData.FieldByName ('GCode').AsString))])
	end
	else
    begin
        strExCode := DKousyuMemData.FieldByName('GCode').AsString;
    end;

    cMasDlgParam.m_iNCode := DKousyuMemData.FieldByName ('NCode').AsFloat;

	cMasDlgParam.m_iFusenKbn := nTagKindWork;									// 付箋区分
	cMasDlgParam.m_pApRec	 := Pointer (m_pMyAppRecord);						// TMjsAppRecord

	if	(cMasDlgIF.DoDlg (cMasDlgParam) = mrOK) then							// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData := TMQuery.Create (Self);
		MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);				// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close();
			SQL.Clear();
			SQL.Add('select FusenCmnt from MFusenInfo mf                    ');
            SQL.Add('right join HojyoMA hm ON                               ');
            SQL.Add('(mf.MasterKbn = hm.MasterKbn and mf.NCode=hm.NCode)    ');
			SQL.Add('where mf.MasterKbn = :nMasterKbn and hm.GCode = :ExCode');

			ParamByName('nMasterKbn').AsInteger := cMasDlgParam.m_iMasterkbn;
			ParamByName('ExCode'   ).AsFloat    := cMasDlgParam.m_iNCode;

			Open();

			cMemData := DKousyuMemData;

			cMemData.Edit();

			if (not EOF) then
				cMemData.FieldByName('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				cMemData.FieldByName('strComment').AsString	:= '';

			cMemData.Post();

// <034> ADD start
			  m_aryFusenData[DKousyuMemData.RecNo - 1].strCmnt := cMasDlgParam.m_sCmnt;
// <034> ADD end
		end;

		dqMasterData.Close();
		dqMasterData.Free ();
	end;

	cMasDlgParam.Free();

	cMasDlgIF.Term();
	cMasDlgIF.Free();

end;

//**********************************************************************
//*
//*	関数	: TJNTCRP018004f.fnSetGridTagInfo (Integer)
//*
//*	目的	: 補助登録処理
//*
//*	戻り値	: なし,
//*
//*---------------------------------------------------------------------
//*
//*	ﾊﾟﾗﾒｰﾀ	: nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)
//*
//**********************************************************************
procedure	TJNTCRP018004f.fnSetGridTagInfo (nTagKind: Integer);
var
	strExCode	    :   String;
	nDivision	    :   Integer;
	nTagKindWork    :   Integer;
    cNCode          :   Currency;

begin

	if (Trim(DKousyuMemData.FieldByName('GCode').AsString) = '') then
		Exit;

	if (m_CodeAttr <= 1) then
		strExCode := Format('%.16d', [StrToInt64 (Trim(DKousyuMemData.FieldByName ('GCode').AsString))])
	else
		strExCode := DKousyuMemData.FieldByName ('GCode').AsString;


    cNCode    := DKousyuMemData.FieldByName('NCode').AsFloat;
    nDivision := 0;

	if (fnUpdateMasterDataTagInfo(cNCode, nTagKind)) then
		nTagKindWork := nTagKind
	else
		nTagKindWork := 0;

	fnUpdateGridMemDataRecord(nDivision, strExCode, nTagKindWork);

end;

//**********************************************************************
//*		Proccess	: fnFusenEnabled
//**********************************************************************
procedure	TJNTCRP018004f.fnFusenEnabled(fEnabled: Boolean);
begin
    if m_cJNTArea.IsFusen then
    begin
        if fEnabled then
            CmnToolbarButtonTag.ImageIndex := m_FusenClrIdx
        else
            CmnToolbarButtonTag.ImageIndex := 4;                                // 灰色

        CmnToolbarButtonTag.Enabled := fEnabled;
    end else
    begin
        CmnToolbarButtonTag.ImageIndex := 4;                                    // 灰色
        CmnToolbarButtonTag.Enabled := False;
    end;

end;


//**********************************************************************
//*		Proccess	: DdxDBGridMouseDown
//**********************************************************************
procedure TJNTCRP018004f.DdxDBGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;
begin

    // ﾌｫｰｶｽ位置: 0=付箋
	if	(DdxDBGrid.FocusedColumn = 0) then
	begin
		cField	:= DKousyuDataSource.DataSet.FieldByName ('GCode');
		cField.FocusControl ();
		Abort;
		Exit;
	end;
end;

//**********************************************************************
//**********************************************************************
procedure TJNTCRP018004f.StdCmnGridPopupMenuPopup(Sender: TObject);
var
	strExCode	    :   String;
    cNCode          :   Extended;
	nTagDivision    :   Integer;
    PopMenu			:   TMenuItem;
begin

	StdCmnGridPopupMenuTagOff    .Enabled := m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTagComment.Enabled := m_cJNTArea.IsFusen;

	strExCode := '';
    cNCode    :=  0;

	if DKousyuMemData.RecordCount <> 0 then
	begin
        cNCode := DKousyuMemData.FieldByName('NCode').AsCurrency;

    	if  (m_CodeAttr <= 1) then
		begin
			if (DKousyuMemData.FieldByName('GCode').AsString <> '') then
				strExCode :=
                    Format('%.16d', [StrToInt64(Trim (DKousyuMemData.FieldByName('GCode').AsString))])
		end
		else
        begin
			strExCode := DKousyuMemData.FieldByName('GCode').AsString;
        end;
	end;

// <037> MOD start
//	if (strExCode <> '') then
											// 外部ｺｰﾄﾞ入力済みかつ新規ﾃﾞｰﾀ入力中でない場合
  	if (strExCode <> '') and (DKousyuMemData.State <> dsInsert) then
// <037> MOD end

	begin
    	StdCmnGridPopupMenuTag01.Enabled := m_cJNTArea.IsFusen;
	    StdCmnGridPopupMenuTag02.Enabled := m_cJNTArea.IsFusen;
    	StdCmnGridPopupMenuTag03.Enabled := m_cJNTArea.IsFusen;
	    StdCmnGridPopupMenuTag04.Enabled := m_cJNTArea.IsFusen;

		nTagDivision := fnGetMasterDataTagInfo(cNCode);

		if (nTagDivision > 0) then
		begin
			StdCmnGridPopupMenuTagOff    .Visible := True;
			StdCmnGridPopupMenuTagComment.Visible := True;

			case (nTagDivision) of
            1:	begin
                    StdCmnGridPopupMenuTagOff.Bitmap  := StdCmnGridPopupMenuTag01.Bitmap;
                    StdCmnGridPopupMenuTag01 .Visible := False;
                    StdCmnGridPopupMenuTag02 .Visible := True;
                    StdCmnGridPopupMenuTag03 .Visible := True;
                    StdCmnGridPopupMenuTag04 .Visible := True;
                end;
            2:	begin
                    StdCmnGridPopupMenuTagOff.Bitmap  := StdCmnGridPopupMenuTag03.Bitmap;
                    StdCmnGridPopupMenuTag01 .Visible := True;
                    StdCmnGridPopupMenuTag02 .Visible := True;
                    StdCmnGridPopupMenuTag03 .Visible := False;
                    StdCmnGridPopupMenuTag04 .Visible := True;
                end;
            3:	begin
                    StdCmnGridPopupMenuTagOff.Bitmap  := StdCmnGridPopupMenuTag02.Bitmap;
                    StdCmnGridPopupMenuTag01 .Visible := True;
                    StdCmnGridPopupMenuTag02 .Visible := False;
                    StdCmnGridPopupMenuTag03 .Visible := True;
                    StdCmnGridPopupMenuTag04 .Visible := True;
                end;
            4:	begin
                    StdCmnGridPopupMenuTagOff.Bitmap  := StdCmnGridPopupMenuTag04.Bitmap;
                    StdCmnGridPopupMenuTag01 .Visible := True;
                    StdCmnGridPopupMenuTag02 .Visible := True;
                    StdCmnGridPopupMenuTag03 .Visible := True;
                    StdCmnGridPopupMenuTag04 .Visible := False;
                end;
			end;
		end
		else
		begin
			StdCmnGridPopupMenuTagOff    .Visible := False;
			StdCmnGridPopupMenuTagComment.Visible := False;

			StdCmnGridPopupMenuTag01.Visible := True;
			StdCmnGridPopupMenuTag02.Visible := True;
			StdCmnGridPopupMenuTag03.Visible := True;
			StdCmnGridPopupMenuTag04.Visible := True;
		end;
	end
	else
	begin
		StdCmnGridPopupMenuTagOff    .Visible := False;
		StdCmnGridPopupMenuTagComment.Visible := False;

		StdCmnGridPopupMenuTag01.Enabled := False;
		StdCmnGridPopupMenuTag02.Enabled := False;
		StdCmnGridPopupMenuTag03.Enabled := False;
		StdCmnGridPopupMenuTag04.Enabled := False;
	end;
end;

//**********************************************************************
//**********************************************************************
function TJNTCRP018004f.fnGetMasterDataTagInfo(cNCode: Extended): Integer;
var
	dqMasterData    :   TMQuery;
	nTagDivision    :   Integer;

begin

	dqMasterData := TMQuery.Create(Self);                                       // MQueryの構築
	MDataModule.SetDBInfoToQuery(dbCorp_Select, dqMasterData);					// DBとMQueryの接続

	nTagDivision := 0;

	with (dqMasterData) do
	begin
		Close();

		SQL.Clear();
		SQL.Add('select FusenKbn from MFusenInfo'                  );
		SQL.Add('where MasterKbn = :nMasterKbn and NCode = :cNCode');

		SetFld('nMasterKbn').AsInteger := m_KousyuKbn;
		SetFld('cNCode'    ).AsFloat   := cNCode;

		Open();

		if (not EOF) then
			nTagDivision := GetFld('FusenKbn').AsInteger;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result := nTagDivision;

end;

//**********************************************************************
//*		Proccess	:	権限取得
//*		Name		:
//*		Date		:
//*		Parameter	:	なし
//*		Return		:	なし
//**********************************************************************
procedure TJNTCRP018004f.fnGetGrants();
begin

    m_cJNTArea.FxPermission;						                            // 権限取得

    if ( m_cJNTArea.IsKessan(True) = 1 ) then		                            // 決算確定MSG
    begin
        giReferFlag	:= REFER;						                            // 決算確定の為参照のみ
        m_IsUpdate  := False;
    end
    else
	begin
        // 新規、更新権限のﾁｪｯｸ
        if m_cJNTArea.IsAppend and m_cJNTArea.IsModify then
            m_IsUpdate := True
        else
            m_IsUpdate := False;


		if ( m_IsUpdate ) then
	        giReferFlag	:= NORMAL					                            // 通常処理
		else
			giReferFlag	:= REFER;					                            // 更新権限無し

        if giReferFlag = REFER then
            Exit;


        // ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮 <012>
        if ( m_SyncMaster.m_flgGrpCorp = 0 ) then                               // 全社で過年度DBを選択している場合
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
                    m_IsUpdate  := False;
                end;
            end;
        end
        // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
        else if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 子会社が過年度DBの場合
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := False;
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := False;
            end;
        end;
	end;

end;

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/15
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     iMKbn   : ﾏｽﾀ区分
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP018004f.fnDelCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;
    try
        SPMasHoj.Connection := dbCorp_Select;
        //SPMasHoj.SessionName := dbCorp_Select.SessionName;

        // 【会計】MP_MAS_CHK_HOJYOMA
        with SPMasHoj do
        begin
// Delphi10 ST
//            UnPrepare;
//            Prepare;
// Delphi10 ED
            ParamByName('@NCode').AsFloat := exNCode;
            ParamByName('@MasterKbn').AsInteger := iMKbn;
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
        strErr := '例外発生(MP_MAS_CHK_HOJYOMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    try
        SPPayHoj.Connection := dbCorp_Select;
        //SPPayHoj.SessionName := dbCorp_Select.SessionName;

        // 【債務】MP_PAY_CHK_HOJYOMA
        with SPPayHoj do
        begin
// Delphi10 ST
//            UnPrepare;
//            Prepare;
// Delphi10 ED
            ParamByName('@NCode').AsFloat := exNCode;
            ParamByName('@MasterKbn').AsInteger := iMKbn;
// Delphi10 ST
            FetchOptions.Items := FetchOptions.Items - [fimeta];
// Delphi10 ED
            ExecProc;                   // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_PAY_CHK_HOJYOMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

procedure TJNTCRP018004f.DdxDBGrid2DblClick(Sender: TObject);
begin
// <027> ADD start
    if giReferFlag = REFER then				// 参照時ははﾊﾟﾀｰﾝ登録を変更しない
    begin
    	Exit;
    end;
// <027> ADD end

    Btn_RightClick(Sender); //<009>

end;

procedure TJNTCRP018004f.CmnTreeViewDblClick(Sender: TObject);
begin
// <027> ADD start
    if giReferFlag = REFER then				// 参照時はﾊﾟﾀｰﾝ登録を変更しない
    begin
    	Exit;
    end;
// <027> ADD end


    Btn_LeftClick(Sender);  //<009>

end;

//**************************************************************************
//	Component	:	DdxDBGrid(TdxDBGrid)
//	Event	    :	MouseMove
//	Name	    :   S.Suzuki
//**************************************************************************
procedure TJNTCRP018004f.evtDdxDBGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	iRow : Integer;
begin
	inherited;
											// 付箋備考表示処理
	iRow := Y div DdxDBGrid.DefaultRowHeight + DdxDBGrid.TopIndex;

	if iRow <> m_iHintRow then
	begin
		m_iHintRow := iRow;
		DdxDBGrid.Hint := '';
		DdxDBGrid.ShowHint := False;
		Exit;
	end;

	if (X < 12) or (X > 32) then            // 付箋の枠以外はExit
    begin
		Exit;
    end;

	if (Y >= 0) and (Y <= 17) then    		// ﾍｯﾀﾞ
    begin
		Exit;
    end;
	                                  		// 現在位置が付箋かつﾌﾟﾛﾊﾟﾃｨがTrue
	if (iRow = m_iHintRow) and (DdxDBGrid.ShowHint) then
    begin
		Exit;
    end;
                           					// ﾚｺｰﾄﾞありかつ付箋備考がありの場合は備考を表示する
	if (iRow <= DKousyuMemData.RecordCount) and (m_aryFusenData[iRow - 1].strCmnt <> '') then
	begin
		DdxDBGrid.Hint		:= m_aryFusenData[iRow - 1].strCmnt;
		DdxDBGrid.ShowHint	:= True;
	end;

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<038>
//	Name		:	T.Seki
//	Date		:	2008/05/09
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP018004f.SessionPractice(iSyori: Integer);
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
//    SPMsHist.Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc();						// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare();						// ﾘｿｰｽを解放する
// Delphi10 ED

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
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
//    	SPMsHistParent.Prepare();				// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
    	SPMsHistParent.ExecProc();				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare();				// ﾘｿｰｽを解放する
// Delphi10 ED
	end;
end;

/////////////////////////////////////////////////////////
// 概要： TreeView StartDragイベント  <040> ADD
/////////////////////////////////////////////////////////
procedure TJNTCRP018004f.CmnTreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
	DragNode	: TTreeNode;
begin
    DragNode := CmnTreeView.Selected;

    if DragNode.Parent = nil then  // 親がいなければ処理中止
        abort;
end;

// <042> Start
//**********************************************************************
//*		Proccess	:	EdgeTracker経費精算連携用メッセージ表示(コード削除した時にメッセージを出力)
//*		Name		:	T.Komatsu
//*		Date		:	2018.09.11
//*		Parameter	:	なし
//*		Return		:	なし
//**********************************************************************
procedure TJNTCRP018004f.fnEdgeTrackerKeihiSeisanMsg();
var
	DmqData			: TMQuery;
    iCnt			: Integer;

begin

	DmqData := TMQuery.Create( Self );					        //	MQueryの構築
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );		//	DBとMQueryの接続
    iCnt := 0 ;

	//	区分情報から経費精算連携採用の有無を取得
	with DmqData do
	begin
		Close();
		SQL.Clear;
        // RecKbn=54(経費精算)、GnPuKbn1（Edge Tracker 経費精算連携採用区分）
		SQL.ADD('SELECT count(*) as cnt FROM KbnInfo WHERE RecKbn=54 and GnPuKbn1 = 1');
		if Open = False then
		begin
			ErrorMessageDsp(DmqData);
			Close;
			Free;
			Exit;
		end;
        iCnt := GetFld('cnt').AsInteger;
		Close;
		Free;
	end;

    // 「Edge Tracker 経費精算連携」があるときにメッセージを表示する
	if (iCnt > 0) then
	begin
		if (m_pMyAppRecord.m_sParameter = '1' ) then
		begin
			MjsMessageBoxEx(Self, '工種が削除されました。' + #13#10 + 'Edge Tracker でマスタを見直してください。', '確認', mjInformation, mjOk, mjDefOk);
		end
		else
		begin
			MjsMessageBoxEx(Self, '作業内訳が削除されました。' + #13#10 + 'Edge Tracker でマスタを見直してください。', '確認', mjInformation, mjOk, mjDefOk);
		end;
	end;
end;
// <042> End

end.


