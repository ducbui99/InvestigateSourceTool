//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：科目
//                    勘定科目情報(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.08.19(FRI)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ> <修正者>   <修正日>        <修正内容>
//
//
//=============================================================================
unit JNTCRP009001Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset, VCL.ImgList,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP009001L = class(TDataModule)
    RList: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLineJS_Top: TppLine;
    ppLineJS_Bottom: TppLine;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    SVppDate: TppSystemVariable;
    LppCorpCode: TppLabel;
    LppCorpName: TppLabel;
    RLKamokuName: TppLabel;
    ppLabel3: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel8: TppLabel;
    ppLabel33: TppLabel;
    ppLabel68: TppLabel;
    pL_Bunseki: TppLabel;
    pL_YouBunseki: TppLabel;
    ppLabel2: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel13: TppLabel;
    ppLine115: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine120: TppLine;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine123: TppLine;
    ppLine124: TppLine;
    ppLabel34: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppLine125: TppLine;
    ppLine127: TppLine;
    ppLine128: TppLine;
    ppLine129: TppLine;
    ppLine130: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel30: TppLabel;
    ppLabel12: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel47: TppLabel;
    ppLabel25: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLineJS_Left: TppLine;
    ppLineJS_Right: TppLine;
    ppLabel9: TppLabel;
    ppLabel16: TppLabel;
    ppLabel23: TppLabel;
    ppLabel37: TppLabel;
    ppDetailBand_JitsuS: TppDetailBand;
    ppUnderLineJS: TppLine;
    pDT_Code: TppDBText;
    pDT_Seishiki: TppDBText;
    pDT_Kanryaku: TppDBText;
    pDT_Renso: TppDBText;
    pDT_Bunseki: TppDBText;
    pDT_Seikaku: TppDBText;
    pDT_BunsekiName: TppDBText;
    pDT_StartDate: TppDBText;
    pDT_EndDate: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pDT_BsPlName: TppDBText;
    pDT_KisyuName: TppDBText;
    pDT_HiritsuName: TppDBText;
    pDT_SeizanName: TppDBText;
    ppLine6: TppLine;
    ppLine8: TppLine;
    pDT_KariKuri: TppDBText;
    pDT_KashiKuri: TppDBText;
    pDT_Hendouhi: TppDBText;
    ppLine9: TppLine;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText13: TppDBText;
    ppDBText17: TppDBText;
    ppLine12: TppLine;
    ppDBText8: TppDBText;
    ppDBText21: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText37: TppDBText;
    RImageZitsuSFusen: TppDBImage;
    ppLine114: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppLine119: TppLine;
    ppLine131: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    ppLine135: TppLine;
    ppLine136: TppLine;
    ppLine137: TppLine;
    ppDBText1: TppDBText;
    R_JS_LastUpDate: TppDBText;
    pDT_Youyaku: TppDBText;
    pDT_Kotei: TppDBText;
    pDT_Hendo: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    SVppPage: TppSystemVariable;
    LppAccOffice: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    LKensu: TppLabel;
    LGouLeft: TppLabel;
    LGouRight: TppLabel;
    RPipeline: TppDBPipeline;
    DDataSource: TDataSource;
    RSaimoku: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppLineBootom: TppLine;
    ppLineLeft: TppLine;
    ppLineTop: TppLine;
    ppLine15: TppLine;
    ppLabel50: TppLabel;
    R_SDate: TppSystemVariable;
    R_SCorpNo: TppLabel;
    R_SCorpName: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLabel53: TppLabel;
    ppLabel18: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel55: TppLabel;
    ppLabel54: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel90: TppLabel;
    ppLabel97: TppLabel;
    ppLine141: TppLine;
    ppLine142: TppLine;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLineRight: TppLine;
    ppDetailBand_Saimoku: TppDetailBand;
    ppUnderLineS: TppLine;
    R_KmkCode: TppDBText;
    R_KmkName: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppDBText48: TppDBText;
    ppLine30: TppLine;
    ppDBText49: TppDBText;
    ppLine32: TppLine;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    R_S_StartDate: TppDBText;
    R_S_EndDate: TppDBText;
    ppDBText79: TppDBText;
    ppDBText84: TppDBText;
    ppDBText83: TppDBText;
    ppDBText80: TppDBText;
    ppDBText98: TppDBText;
    ppLine35: TppLine;
    ppDBImage1: TppDBImage;
    ppLine143: TppLine;
    ppLine144: TppLine;
    R_S_LastUpDate: TppDBText;
    ppFooterBand1: TppFooterBand;
    R_SPage: TppSystemVariable;
    R_SKaikeiName: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    RPipeline_Saimoku: TppDBPipeline;
    DataSource_Saimoku: TDataSource;
    RGoukei: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppLine43: TppLine;
    ppLine21: TppLine;
    ppLabel108: TppLabel;
    ppLine37: TppLine;
    ppLabel62: TppLabel;
    R_GDate: TppSystemVariable;
    R_GCorpNo: TppLabel;
    R_GCorpName: TppLabel;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine52: TppLine;
    ppLine54: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine138: TppLine;
    ppLine139: TppLine;
    ppLine148: TppLine;
    ppLine150: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel73: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel110: TppLabel;
    ppLabel88: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel107: TppLabel;
    ppLabel32: TppLabel;
    ppLine7: TppLine;
    ppDetailBand_Gou: TppDetailBand;
    ppUnderLineG: TppLine;
    ppDBText33: TppDBText;
    ppDBText41: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppDBText78: TppDBText;
    ppDBText82: TppDBText;
    ppDBText86: TppDBText;
    ppLine46: TppLine;
    ppLine48: TppLine;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText107: TppDBText;
    ppDBText111: TppDBText;
    ppLine49: TppLine;
    ppDBText112: TppDBText;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine53: TppLine;
    ppLine55: TppLine;
    ppLine58: TppLine;
    ppLine153: TppLine;
    ppLine154: TppLine;
    ppLine157: TppLine;
    ppLine158: TppLine;
    ppDBImage2: TppDBImage;
    R_G_LastUpDate: TppDBText;
    ppFooterBand3: TppFooterBand;
    R_GPage: TppSystemVariable;
    R_GKaikeiName: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    RL_Kensu: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    RPipeline_Goukei: TppDBPipeline;
    DataSource_Goukei: TDataSource;
    RTaikeiList: TppReport;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppLine59: TppLine;
    pL_Title: TppLabel;
    R_TLDate: TppSystemVariable;
    R_TLCorpNo: TppLabel;
    R_TLCorpName: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppLineT_Bottom: TppLine;
    ppLineT_Top: TppLine;
    ppLine62: TppLine;
    ppLine70: TppLine;
    ppLabel71: TppLabel;
    ppLine65: TppLine;
    ppLabel102: TppLabel;
    ppLabel85: TppLabel;
    ppLineT_Left: TppLine;
    ppLineT_Right: TppLine;
    ppLabel28: TppLabel;
    ppLabel31: TppLabel;
    ppLine75: TppLine;
    ppDetailBand_Taikei: TppDetailBand;
    ppUnderLineT: TppLine;
    ppLine72: TppLine;
    ppDBTextCode: TppDBText;
    ppLine77: TppLine;
    ppDBTextKanryaku: TppDBText;
    ppLine71: TppLine;
    ppDBText56: TppDBText;
    ppLine84: TppLine;
    ppDBText62: TppDBText;
    ppLine60: TppLine;
    ppDBText85: TppDBText;
    ppLine79: TppLine;
    ppLine64: TppLine;
    ppDBText2: TppDBText;
    ppLine66: TppLine;
    ppDBText3: TppDBText;
    ppLine67: TppLine;
    ppDBText4: TppDBText;
    ppLine68: TppLine;
    ppDBText5: TppDBText;
    ppLine74: TppLine;
    ppLine76: TppLine;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    R_TLPage: TppSystemVariable;
    R_TLKaikeiName: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    RPipeline_TaikeiList: TppDBPipeline;
    DataSource_TaikeiList: TDataSource;
    RJitsuzai_K: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    ppLine88: TppLine;
    ppLabel7: TppLabel;
    RSV_JitsuK_Date: TppSystemVariable;
    RL_Jitsu_CorpCode: TppLabel;
    RL_JitsuK_CorpName: TppLabel;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine93: TppLine;
    ppLabel61: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel91: TppLabel;
    ppLine102: TppLine;
    ppLine103: TppLine;
    ppLabel119: TppLabel;
    ppLine104: TppLine;
    ppLabel120: TppLabel;
    ppLine105: TppLine;
    ppLabel114: TppLabel;
    ppLine106: TppLine;
    ppLabel117: TppLabel;
    ppLine107: TppLine;
    ppLabel118: TppLabel;
    ppLabel133: TppLabel;
    ppLineJK_Top: TppLine;
    ppLineJK_Left: TppLine;
    ppLineJK_Right: TppLine;
    ppLineJK_Bottom: TppLine;
    ppDetailBand_JitsuK: TppDetailBand;
    ppUnderLineJK: TppLine;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText57: TppDBText;
    ppDBText61: TppDBText;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppDBText110: TppDBText;
    ppDBText117: TppDBText;
    ppDBText124: TppDBText;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppLine99: TppLine;
    ppDBText142: TppDBText;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine108: TppLine;
    ppLine109: TppLine;
    ppLine110: TppLine;
    ppLine111: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    RImageJitsuFusen: TppDBImage;
    ppFooterBand5: TppFooterBand;
    RSV_JitsuK_Page: TppSystemVariable;
    RL_JitsuK_Kaikei: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    LJitsu_Kensu: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    RPipeline_JitsuKan: TppDBPipeline;
    DataSource_JitsuKan: TDataSource;
    RTaikei: TppReport;
    ppTitleBand6: TppTitleBand;
    ppHeaderBand6: TppHeaderBand;
    ppLine47: TppLine;
    ppLabel24: TppLabel;
    R_TDate: TppSystemVariable;
    R_TCorpNo: TppLabel;
    R_TCorpName: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLineBottom: TppLine;
    ppLine85: TppLine;
    ppDBText_TR_Code: TppDBText;
    ppDBText_TR_SName: TppDBText;
    ppDBText_TR_AddKbn01: TppDBText;
    ppDBText_TR_Code01: TppDBText;
    ppDBText_TR_Name01: TppDBText;
    ppLine145: TppLine;
    ppDBText_TR_AddKbn02: TppDBText;
    ppDBText_TR_Code02: TppDBText;
    ppDBText_TR_Name02: TppDBText;
    ppDBText_TR_AddKbn03: TppDBText;
    ppDBText_TR_Code03: TppDBText;
    ppDBText_TR_Name03: TppDBText;
    ppDBText_TR_AddKbn04: TppDBText;
    ppDBText_TR_Code04: TppDBText;
    ppDBText_TR_Name04: TppDBText;
    ppDBText_TR_AddKbn05: TppDBText;
    ppDBText_TR_Code05: TppDBText;
    ppDBText_TR_Name05: TppDBText;
    ppDBText_TR_AddKbn06: TppDBText;
    ppDBText_TR_Code06: TppDBText;
    ppDBText_TR_Name06: TppDBText;
    ppDBText_TR_AddKbn07: TppDBText;
    ppDBText_TR_Code07: TppDBText;
    ppDBText_TR_Name07: TppDBText;
    ppDBText_TR_AddKbn08: TppDBText;
    ppDBText_TR_Code08: TppDBText;
    ppDBText_TR_Name08: TppDBText;
    ppDBText_TR_AddKbn09: TppDBText;
    ppDBText_TR_Code09: TppDBText;
    ppDBText_TR_Name09: TppDBText;
    ppLineTate_101: TppLine;
    ppLineTate_102: TppLine;
    ppLineYoko_101: TppLine;
    ppLineYoko_102: TppLine;
    ppLineYoko_201: TppLine;
    ppLineYoko_202: TppLine;
    ppLineTate_202: TppLine;
    ppLineTate_301: TppLine;
    ppLineTate_302: TppLine;
    ppLineYoko_301: TppLine;
    ppLineYoko_302: TppLine;
    ppLineTate_401: TppLine;
    ppLineTate_402: TppLine;
    ppLineYoko_401: TppLine;
    ppLineYoko_402: TppLine;
    ppLineTate_501: TppLine;
    ppLineTate_502: TppLine;
    ppLineYoko_501: TppLine;
    ppLineYoko_502: TppLine;
    ppLineTate_601: TppLine;
    ppLineTate_602: TppLine;
    ppLineYoko_601: TppLine;
    ppLineYoko_602: TppLine;
    ppLineTate_701: TppLine;
    ppLineTate_702: TppLine;
    ppLineYoko_701: TppLine;
    ppLineYoko_702: TppLine;
    ppLineTate_801: TppLine;
    ppLineTate_802: TppLine;
    ppLineYoko_802: TppLine;
    ppLineYoko_801: TppLine;
    ppLineTate_901: TppLine;
    ppLineTate_902: TppLine;
    ppLineYoko_902: TppLine;
    ppLineYoko_901: TppLine;
    ppDBImage_01: TppDBImage;
    ppLineTate_201: TppLine;
    ppDBImage_02: TppDBImage;
    ppDBImage_03: TppDBImage;
    ppDBImage_04: TppDBImage;
    ppDBImage_05: TppDBImage;
    ppDBImage_06: TppDBImage;
    ppDBImage_07: TppDBImage;
    ppDBImage_08: TppDBImage;
    ppDBImage_09: TppDBImage;
    ppDBImage: TppDBImage;
    ppLabel29: TppLabel;
    ppFooterBand6: TppFooterBand;
    R_TPage: TppSystemVariable;
    R_TKaikeiName: TppLabel;
    ppPageStyle1: TppPageStyle;
    ppShape1: TppShape;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine86: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    RPipeline_Taikei: TppDBPipeline;
    DataSource_Taikei: TDataSource;
    RIchiran: TppReport;
    ppTitleBand7: TppTitleBand;
    ppHeaderBand7: TppHeaderBand;
    ppLine61: TppLine;
    pL_IchiTitle: TppLabel;
    R_IchiDate: TppSystemVariable;
    R_IchiCorpNo: TppLabel;
    R_IchiCorpName: TppLabel;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLine69: TppLine;
    ppLine63: TppLine;
    ppLabel42: TppLabel;
    ppLine80: TppLine;
    ppLabel43: TppLabel;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppDetailBand_Ichi: TppDetailBand;
    UnderLine_Ichi: TppLine;
    ppLine94: TppLine;
    ppDBText11: TppDBText;
    ppLine140: TppLine;
    ppDBText12: TppDBText;
    ppLine146: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand7: TppFooterBand;
    R_IchiPage: TppSystemVariable;
    R_IchiKaikeiName: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    RPipeline_Ichiran: TppDBPipeline;
    DataSource_Ichiran: TDataSource;
    RHendo: TppReport;
    ppTitleBand8: TppTitleBand;
    ppHeaderBand8: TppHeaderBand;
    ppLine73: TppLine;
    ppLabel22: TppLabel;
    R_HDate: TppSystemVariable;
    R_HCorpNo: TppLabel;
    R_HCorpName: TppLabel;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppLine78: TppLine;
    ppLine83: TppLine;
    ppLine87: TppLine;
    ppLine147: TppLine;
    ppLabel45: TppLabel;
    ppLine149: TppLine;
    ppLabel46: TppLabel;
    ppLabel49: TppLabel;
    ppLine151: TppLine;
    ppLine152: TppLine;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine155: TppLine;
    ppDetailBand_Hendo: TppDetailBand;
    UnderLine_Hendo: TppLine;
    ppLine159: TppLine;
    ppDBText15: TppDBText;
    ppLine160: TppLine;
    ppDBText18: TppDBText;
    ppLine161: TppLine;
    ppDBText20: TppDBText;
    ppLine163: TppLine;
    ppDBText22: TppDBText;
    ppLine164: TppLine;
    ppLine165: TppLine;
    ppDBText23: TppDBText;
    ppLine166: TppLine;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppLine169: TppLine;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand8: TppFooterBand;
    R_HPage: TppSystemVariable;
    R_HKaikeiName: TppLabel;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    RPipeline_Hendo: TppDBPipeline;
    DataSource_Hendo: TDataSource;
    ppLabel41: TppLabel;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel72: TppLabel;
    ppDBText28: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       BeforePrint         (Sender: TObject);
    procedure ppDetailBand_JitsuSBeforeGenerate(Sender: TObject);
    procedure RSaimokuEndPage(Sender: TObject);
    procedure ppDetailBand_SaimokuBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_GouBeforeGenerate(Sender: TObject);
    procedure RTaikeiListEndColumn(Sender: TObject);
    procedure RTaikeiListEndPage(Sender: TObject);
    procedure ppDetailBand_TaikeiBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_JitsuKBeforeGenerate(Sender: TObject);
    procedure RTaikeiEndPage(Sender: TObject);
    procedure ppColumnHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand_IchiBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_HendoBeforeGenerate(Sender: TObject);
    procedure R_KmkCodePrint(Sender: TObject);
    procedure ppDBTextCodePrint(Sender: TObject);
    procedure ppDBText_TR_CodePrint(Sender: TObject);
    procedure ppDBText_TR_AddKbn01Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn02Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn03Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn04Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn05Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn06Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn07Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn08Print(Sender: TObject);
    procedure ppDBText_TR_AddKbn09Print(Sender: TObject);

  private
    { Private 宣言 }
    m_cJNTArea      :   TJNTCommon;												// 050825 hirota
	m_pRec          :   ^TMjsAppRecord;
	m_pMDataModule  :   ^TMDataModulef;
	m_pCommonArea   :   ^rcCOMMONAREA;	    // 共通ｴﾘｱ
	MJSPrnDlgf	    :	TMJSPrnDlgf;		// 印刷ﾀﾞｲｱﾛｸﾞ
	PrnSupport      :	TMjsPrnSupport;		// 印刷設定
    mjspre		    :	TMjsPreviewIF;		// ﾌﾟﾚﾋﾞｭｰ
	uvSelSys        :   TJNTSelCorpSys;     // 会社ｼｽﾃﾑ情報
    uvHani		    :	TJNTHani;           //
    Owner           :   TComponent;

    gsT_KamokuCode  :	String;			    // 印刷時細目科目ﾘｽﾄ時に使用(科目ｺｰﾄﾞ)
    gsT_GoukeiCode  :	String;			    // 印刷時科目加算ﾘｽﾄ時に使用(合計ｺｰﾄﾞ)
//    gsT_TaikeiCode	:	String;				// 印刷時科目体系ﾘｽﾄ時に使用(合計ｺｰﾄﾞ)	// 050825 hirota
	m_YearKbn		:	Integer;		    // 西暦/和暦区分
//	aSaveFlag	    :	array[0..9]   of Boolean;								// 050825 hirota

    procedure    fnInzPrint                 ();
	procedure    ppReport1FileOut           (iSelectRep : Integer; TargetMD: TdxMemdata);	// 050825 hirota
//    procedure	 fnGetLinePosition          (DspName: String; DspNameLeft,TateLeft: Single;	var YokoLeft: Single; var YokoWidth: Single);	// 050825 hirota

  public
    { Public 宣言 }
	procedure DoPrint       (Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
    function  fnSetSQL      (TargetQry: TMQuery; Para: TJNTHani; iSelectRep: Integer; iRetCommand: TDlgRetID; MsgFlg: Boolean = TRUE): Boolean;
	function  fnIsPreview   (): Boolean;

  end;

// { Exports関数宣言 } <PRN>
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP009001L: TDmJNTCRP009001L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;

{$R *.DFM}

const
	GOUKEI		    =	1;		// 合計
	ZITSUZAI    	=	2;		// 実在(詳細)
	SAIMOKU		    =	3;		// 細目
	TAIKEI		    =	4;		// 体系
	JITSUZAI_K	    =	5;		// 実在(簡略)
	TAIKEILIST	    =	6;		// 体系２(実在)
	TAIKEILIST_G    =	7;		// 体系２(合計)
	ICHIRAN_J	    =	8;		// 実在科目ｺｰﾄﾞ一覧
	ICHIRAN_G	    =	9;		// 合計科目ｺｰﾄﾞ一覧
	HENDO		    =	10;		// 変動損益関係ﾘｽﾄ

//-----------------------------------------------------------------------------
//  PrintAppEntry<kfrm>追加<dou>内容大幅変更<dou2>内容大幅変更、ｺﾋﾟｰし直してください。
//	  ｴﾝﾄﾘｰ関数群	 <BPL>
//	  親ﾌｫｰﾑから呼ばれる関数 <PRN>
//-----------------------------------------------------------------------------
function PrintAppEntry(	AOwner		:   TComponent;   // 親ﾌｫｰﾑ
						pRec		:   Pointer;      //
						Mode		:   Integer;      //
                        PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
var
    i       :   Integer;                // ArHdlの添え字。
	pFrm    :   ^TDmJNTCRP009001L;
begin

	Result  :=  ACTID_RET_OK;

	{ 各Modeについて処理する }
	{ 0:CreateModule }
	{ 1:DoPrint }
	{ 2:fnIsPreview }
	{ 3:Close }

    case Mode of
        // ------------------------
        //      CreateModule
        // ------------------------
		0:
		begin
			new( pFrm );
			try
                // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^   :=  TDmJNTCRP009001L.CreateModule( AOwner,pRec );
                { <dou2>ArHdlを検索して、Nilの場所にﾌｫｰﾑﾎﾟｲﾝﾀを代入。 }
				{ そのときのｲﾝﾃﾞｯｸｽを保持しておく。 }
                for i := 0 to PrtParam.iAPP_HDL_REC do
                begin
                    if ( ArHdl[i] = nil ) then
                    begin
                        ArHdl[i]    :=  pFrm;
                        giIndex     :=  i;
                        break;
                    end;
                end;
			except
				Dispose( pFrm );
				Result  :=  ACTID_RET_NG;
			end;
		end;
        // ------------------------
        //        DoPrint
        // ------------------------
		1:
		begin
    		pFrm    :=  Pointer( ArHdl[giIndex] );
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea );
		end;
        2:
        begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
            pFrm^.fnIsPreview;
        end;
		3:
		begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
            ArHdl[giIndex] := nil;
            pFrm^.Free();
		end;
	end;

end;

//------------------------------------------------------------------------------
//	Constructor
//------------------------------------------------------------------------------
constructor TDmJNTCRP009001L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP009001L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP009001L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  BeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.BeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);


end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.DoPrint(Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i,
    iSelectRep  :   Integer;
begin

    iSelectRep      :=  0;
	uvHani          :=  Para;
  	MJSPrnDlgf	    :=  uvHani.MJSPrnDlgf;
	PrnSupport      :=  uvHani.PrnSupport;
    mjspre		    :=  uvHani.mjspre;
    uvSelSys        :=  CorpSys;                            // 会社情報取得
    m_cJNTArea      :=  JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する
    fnInzPrint();

    case uvHani.pvrPattern of
        0:  iSelectRep  :=  JITSUZAI_K;		                // 実在(簡略)
		1:	iSelectRep  :=  ZITSUZAI;			            // 実在(詳細)
		2:	iSelectRep  :=  SAIMOKU;			            // 細目
		3:	iSelectRep  :=  GOUKEI;			                // 合計
		4:	iSelectRep  :=  TAIKEI;			                // 体系
		5:	iSelectRep  :=  TAIKEILIST;		                // 体系2(実在)
		6:	iSelectRep  :=  TAIKEILIST_G;		            // 体系2(合計)
		7:	iSelectRep  :=  ICHIRAN_J;		                // 科目ｺｰﾄﾞ一覧
		8:	iSelectRep  :=  ICHIRAN_G;		                // 科目ｺｰﾄﾞ一覧
		9:	iSelectRep  :=  HENDO;			                // 変動損益関係ﾘｽﾄ
    end;

    case iSelectRep of
        // ----------------------------
        //	    実在科目登録リスト
        // ----------------------------
		ZITSUZAI:
		begin
			PrnSupport.ApRB				:=	RList;
			PrnSupport.strDocName		:=	('実在科目登録リスト');
			PrnSupport.pPage			:=	SVppPage;				                // ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	SVppDate;				                // 日付
			PrnSupport.pCorpCode		:=	LppCorpCode;			                // 会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	LppCorpName;			                // 会社名称
			PrnSupport.pAccountOffice	:=	LppAccOffice;			                // 会計事務所名称
            DDataSource.DataSet         :=  TargetMD;                               // ﾃﾞｰﾀｾｯﾄの設定
            LKensu.Caption	            :=	FormatFloat('#,##0',TargetMD.RecordCount) + ' 件'; // ﾚｺｰﾄﾞ件数
		end;
        // ----------------------------
        //      科目別補助登録リスト
        // ----------------------------
		SAIMOKU:
		begin
			PrnSupport.ApRB				:=	RSaimoku;
			PrnSupport.strDocName		:=	('科目別補助登録リスト');
			PrnSupport.pPage			:=	R_SPage;				                //	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_SDate;				                //	日付
			PrnSupport.pCorpCode		:=	R_SCorpNo;				                //	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_SCorpName;			                //	会社名称
			PrnSupport.pAccountOffice	:=	R_SKaikeiName;			                //	会計事務所名称
            DataSource_Saimoku.DataSet  :=  TargetMD;                               // ﾃﾞｰﾀｾｯﾄの設定
        end;
        // ----------------------------
        //      合計科目登録リスト
        // ----------------------------
		GOUKEI:
		begin
			PrnSupport.ApRB				:=	RGoukei;
			PrnSupport.strDocName		:=	('合計科目登録リスト');
			PrnSupport.pPage			:=	R_GPage;				                // ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_GDate;				                // 日付
			PrnSupport.pCorpCode		:=	R_GCorpNo;				                // 会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_GCorpName;			                // 会社名称
			PrnSupport.pAccountOffice	:=	R_GKaikeiName;			                // 会計事務所名称
            DataSource_Goukei.DataSet   :=  TargetMD;                               // ﾃﾞｰﾀｾｯﾄの設定
            RL_Kensu.Caption	        :=	FormatFloat('#,##0',TargetMD.RecordCount) + ' 件'; // ﾚｺｰﾄﾞ件数
        end;
        // ----------------------------
        //      科目登録リスト
        // ----------------------------
		TAIKEI:
		begin
			PrnSupport.ApRB				:=	RTaikei;
			PrnSupport.strDocName		:=	('科目登録リスト');
			PrnSupport.pPage			:=	R_TPage;				//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_TDate;				//	日付
			PrnSupport.pCorpCode		:=	R_TCorpNo;				//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_TCorpName;			//	会社名称
			PrnSupport.pAccountOffice	:=	R_TKaikeiName;			//	会計事務所名称
            DataSource_Taikei.DataSet   :=  TargetMD;               // ﾃﾞｰﾀｾｯﾄの設定	// 050825 hirota
//			for i := 0 to 9 do													// 050825 hirota
//				aSaveFlag[i]    :=  FALSE;	                                  	// 050825 hirota
        end;
        // ----------------------------
        //      科目登録リスト(簡略)
        // ----------------------------
		JITSUZAI_K:
		begin
			PrnSupport.ApRB				:=	RJitsuzai_K;
			PrnSupport.strDocName		:=	('科目登録リスト(簡略)');
			PrnSupport.pPage			:=	RSV_JitsuK_Page;		            // ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	RSV_JitsuK_Date;		            // 日付
			PrnSupport.pCorpCode		:=	RL_Jitsu_CorpCode; 		            // 会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	RL_JitsuK_CorpName;		            // 会社名称
			PrnSupport.pAccountOffice	:=	RL_JitsuK_Kaikei;		            // 会計事務所名称
            DataSource_JitsuKan.DataSet :=  TargetMD;                           // ﾃﾞｰﾀｾｯﾄの設定
            LJitsu_Kensu.Caption	    :=	FormatFloat('#,##0',TargetMD.RecordCount) + ' 件'; // ﾚｺｰﾄﾞ件数
        end;
        // ----------------------------
        //      科目登録リスト(実在)
        // ----------------------------
        TAIKEILIST:
		begin
			PrnSupport.ApRB				:=	RTaikeiList;
			PrnSupport.strDocName		:=	('科目登録リスト(実在)');
			PrnSupport.pPage			:=	R_TLPage;				//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_TLDate;				//	日付
			PrnSupport.pCorpCode		:=	R_TLCorpNo;				//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_TLCorpName;			//	会社名称
			PrnSupport.pAccountOffice	:=	R_TLKaikeiName;			//	会計事務所名称
			pL_Title.Caption			:=	'実在科目加算リスト';
            DataSource_Ichiran.DataSet   :=  TargetMD;               // ﾃﾞｰﾀｾｯﾄの設定	// 050825 hirota
        end;
        // ----------------------------
        //      科目登録リスト(合計)
        // ----------------------------
		TAIKEILIST_G:
		begin
			PrnSupport.ApRB				:=	RTaikeiList;
			PrnSupport.strDocName		:=	('科目登録リスト(合計)');
			PrnSupport.pPage			:=	R_TLPage;				//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_TLDate;				//	日付
			PrnSupport.pCorpCode		:=	R_TLCorpNo;				//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_TLCorpName;			//	会社名称
			PrnSupport.pAccountOffice	:=	R_TLKaikeiName;			//	会計事務所名称
			pL_Title.Caption			:=	'合計科目加算リスト';
            DataSource_Ichiran.DataSet   :=  TargetMD;               // ﾃﾞｰﾀｾｯﾄの設定	// 050825 hirota
        end;
        // ----------------------------
        //      変動損益関係リスト
        // ----------------------------
        HENDO:
		begin
			PrnSupport.ApRB				:=	RHendo;
			PrnSupport.strDocName		:=	('変動損益関係リスト');
			PrnSupport.pPage			:=	R_HPage;				//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_HDate;				//	日付
			PrnSupport.pCorpCode		:=	R_HCorpNo;				//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_HCorpName;			//	会社名称
			PrnSupport.pAccountOffice	:=	R_HKaikeiName;			//	会計事務所名称
            DataSource_Hendo.DataSet   :=  TargetMD;                // ﾃﾞｰﾀｾｯﾄの設定	// 050825 hirota
        end;
        // ----------------------------
        //      実在科目コード一覧
        //      合計科目コード一覧
        // ----------------------------
        ICHIRAN_J,
        ICHIRAN_G:
		begin
			PrnSupport.ApRB				:=	RIchiran;
			if ( iSelectRep = ICHIRAN_J ) then
			begin
				PrnSupport.strDocName := ('実在科目コード一覧');
				pL_IchiTitle.Caption  := '実在科目コード一覧';
			end
			else
			begin
				PrnSupport.strDocName := ('合計科目コード一覧');
				pL_IchiTitle.Caption  := '合計科目コード一覧';
			end;
			PrnSupport.pPage			:=	R_IchiPage;				//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	R_IchiDate;				//	日付
			PrnSupport.pCorpCode		:=	R_IchiCorpNo;		  	//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	R_IchiCorpName;			//	会社名称
			PrnSupport.pAccountOffice	:=	R_IchiKaikeiName;	  	//	会計事務所名称
        end;
    end;

	PrnSupport.strFileName	    :=	rcCOMMONAREA ( m_pRec^.m_pCommonArea^ ).SysCliRoot + '\tmp\' + PrnSupport.strDocName + '.csv';		// 050825 hirota
	PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    :=	m_pMDataModule^;                // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                              // 保存ﾎﾞﾀﾝ制御(0:表示する)
    PrnSupport.iDspFileBtn	    :=	1;                              // ﾌｧｲﾙ出力表示
//  PrnSupport.iSysCode			:=	m_pRec^.m_iSystemCode;          // ｼｽﾃﾑｺｰﾄﾞ
//	PrnSupport.iReportID		:=  990100;                         // 帳票ｸﾞﾙｰﾌﾟNO

	// 050825 hirota >>
    if (m_cJNTArea.IsExtract = False)  then
		PrnSupport.iDspFileBtn	:= 0 						// 抽出権限なし→ファイル出力非表示
	else
		PrnSupport.iDspFileBtn	:= 1; 						// 抽出権限あり→ファイル出力表示
	// 050825 hirota <<

    // 暦区分
    if ( m_YearKbn = 0 ) then
		PrnSupport.iCalendarKbn	:=  1	//　和暦
    else
    	PrnSupport.iCalendarKbn	:=  2;	//　西暦


    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

	if ( i > 0 ) then
	begin
    	// 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
    	if (mjspre.IsExistPreview) and
           (PrnSupport.iCommand = PDLG_PREVIEW) then
        begin
			MessageBeep(MB_OK);
			MjsMessageBox(Owner,'他のプログラムでプレビューが起動中です。', mjError, mjDefOk);	//<DSP>
            Exit;
        end;

        // SQLをｾｯﾄ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW,
            PDLG_FILE:
            begin
                if fnSetSQL(TargetQry, Para, iSelectRep, PrnSupport.iCommand) = FALSE then Exit;

            end;
        end;

        // ﾃﾞｰﾀの存在ﾁｪｯｸ
        if ( TargetMD.RecordCount = 0 ) then
        begin
    		uvSelSys.MsgDlg(2010,10);
            Exit;
        end;

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, nil);			// 050825 hirota
            PDLG_FILE: ppReport1FileOut(iSelectRep, TargetMD);					// 050825 hirota
        end;
	end;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.fnInzPrint();
var
    DmqDTMAIN   :   TMQuery;
begin

    // MQueryの構築
    DmqDTMAIN   := TMQuery.Create( Self );
    //	DBとMQueryの接続
	m_pMDataModule^.SetDBInfoToQuery( uvHani.UseDb, DmqDTMAIN );


    with DmqDTMAIN do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT YearKbn FROM DTMAIN');
        Open();

        if ( EOF <> TRUE ) then
		begin
            m_YearKbn := GetFLD('YearKbn').AsInteger;

            //	適用開始・終了の和暦/西暦設定
			case GetFLD('YearKbn').AsInteger of
				0:	//	和暦
				begin
                    //	印刷での適用開始・終了の設定
					//	実在(詳細)
					pDT_StartDate.DisplayFormat   := '';					//	適用開始
					pDT_EndDate.DisplayFormat     := '';					//	適用終了
					R_JS_LastUpDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
					//	細目
					R_S_StartDate.DisplayFormat  :=	'';						//	適用開始
					R_S_EndDate.DisplayFormat    :=	'';						//	適用終了
					R_S_LastUpDate.DisplayFormat :=	'ee/mm/dd hh:mm:ss';	//	最終更新日時
					//	合計
					R_G_LastUpDate.DisplayFormat :=	'ee/mm/dd hh:mm:ss';	//	最終更新日時
				end;
                1:	//	西暦
				begin
                    //	印刷での適用開始・終了の設定
					//	実在(詳細)
					pDT_StartDate.DisplayFormat   := 'yy/mm/dd';			//	適用開始
					pDT_EndDate.DisplayFormat     := 'yy/mm/dd';			//	適用終了
					R_JS_LastUpDate.DisplayFormat := 'yy/mm/dd hh:mm:ss';	//	最終更新日時
					//	細目
					R_S_StartDate.DisplayFormat  :=	'yy/mm/dd';				//	適用開始
					R_S_EndDate.DisplayFormat    :=	'yy/mm/dd';				//	適用終了
					R_S_LastUpDate.DisplayFormat :=	'yy/mm/dd hh:mm:ss';	//	最終更新日時
					//	合計
					R_G_LastUpDate.DisplayFormat :=	'yy/mm/dd hh:mm:ss';	//	最終更新日時
				end;
            end;
        end
        else
        begin
            //	印刷での適用開始・終了の設定
			//	実在(詳細)
			pDT_StartDate.DisplayFormat   := '';					//	適用開始
			pDT_EndDate.DisplayFormat     := '';					//	適用終了
			R_JS_LastUpDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
			//	細目
			R_S_StartDate.DisplayFormat  :=	'';						//	適用開始
			R_S_EndDate.DisplayFormat    :=	'';						//	適用終了
			R_S_LastUpDate.DisplayFormat :=	'ee/mm/dd hh:mm:ss';	//	最終更新日時
			//	合計
			R_G_LastUpDate.DisplayFormat :=	'ee/mm/dd hh:mm:ss';	//	最終更新日時
        end;

        Close();
    end;

// 050825 hirota >>
	// タイトルに分類１～５名称を設定
    ppLabel39.Caption := '';
    ppLabel59.Caption := '';
    ppLabel63.Caption := '';
    ppLabel64.Caption := '';
    ppLabel72.Caption := '';
    with DmqDTMAIN do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT MasterKbn, JHojyoName FROM MasterInfo ');
        SQL.Add('Where UseKbn <> 0 And 481 <= MasterKbn And MasterKbn <= 485 ');
        Open();

        while (not EOF) do
		begin
			case GetFLD('MasterKbn').AsInteger of
				481:
				begin
                    ppLabel39.Caption := GetFLD('JHojyoName').AsString;
				end;
				482:
				begin
                    ppLabel59.Caption := GetFLD('JHojyoName').AsString;
				end;
				483:
				begin
                    ppLabel63.Caption := GetFLD('JHojyoName').AsString;
				end;
				484:
				begin
                    ppLabel64.Caption := GetFLD('JHojyoName').AsString;
				end;
				485:
				begin
                    ppLabel72.Caption := GetFLD('JHojyoName').AsString;
				end;
            end;
            next;
        end;

        Close();
    end;
// 050825 hirota <<

    DmqDTMAIN.Close();
    DmqDTMAIN.Free();

end;

//------------------------------------------------------------------------------
//  ＳＱＬ文の設定
//------------------------------------------------------------------------------
function TDmJNTCRP009001L.fnSetSQL(TargetQry    : TMQuery;
                                   Para         : TJNTHani;
                                   iSelectRep   : Integer;
                                   iRetCommand  : TDlgRetID;
                                   MsgFlg       : Boolean): Boolean;
begin

    Result  :=  TRUE;



end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppReport1FileOut(iSelectRep : Integer; TargetMD: TdxMemdata);	// 050825 hirota
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

	// 050825 hirota >>
    case iSelectRep of
		ZITSUZAI:	//	実在時
		begin
			sTitle.Add('コード'					 );
			sTitle.Add('正式科目名'				 );
			sTitle.Add('簡略科目名'				 );
			sTitle.Add('連想'					 );
			sTitle.Add('ﾏｲﾅｽ変換科目名'			 );
			sTitle.Add('分析ｺｰﾄﾞ'				 );
			sTitle.Add('要約分析ｺｰﾄﾞ'			 );
			sTitle.Add('性格ｺｰﾄﾞ'				 );
			sTitle.Add('期首残区分'				 );
			sTitle.Add('正残区分'				 );
			sTitle.Add('BS/PL区分'				 );
			sTitle.Add('借方資金繰ｺｰﾄﾞ'			 );
			sTitle.Add('貸方資金繰ｺｰﾄﾞ'			 );
			sTitle.Add('装飾区分'				 );
			sTitle.Add('表示／印刷不可区分'		 );
// 050825 hirota			sTitle.Add('科目別補助採用区分'		 );
// 050825 hirota			sTitle.Add('第１補助採用区分'		 );
// 050825 hirota			sTitle.Add('第２補助採用区分'		 );
// 050825 hirota			sTitle.Add('部門採用区分'			 );
// 050825 hirota			sTitle.Add('ｾｸﾞﾒﾝﾄ採用区分'			 );
			sTitle.Add('比率科目区分'			 );
			sTitle.Add('変動費比率'				 );
			sTitle.Add('差額印刷区分'			 );
			sTitle.Add('利益印刷区分'			 );
			sTitle.Add('ﾏｲﾅｽ印刷区分'			 );
			sTitle.Add('元帳摘要欄起票者印字区分');
			sTitle.Add('平均値採用区分'			 );
			sTitle.Add('累計集計区分'			 );
			sTitle.Add('仕訳入力区分'			 );
			sTitle.Add('期日入力区分'			 );
			sTitle.Add('期日必須入力区分'		 );
			sTitle.Add('手形番号入力区分'		 );
			sTitle.Add('手形番号必須入力区分'	 );
			sTitle.Add('固定摘要必須入力'		 );
// 050825 hirota			sTitle.Add('摘要分類ｺｰﾄﾞ'			 );
// 050825 hirota >>
			sTitle.Add(ppLabel39.Caption         );								// 分類１
			sTitle.Add(ppLabel59.Caption         );								// 分類２
			sTitle.Add(ppLabel63.Caption         );								// 分類３
			sTitle.Add(ppLabel64.Caption         );								// 分類４
			sTitle.Add(ppLabel72.Caption         );								// 分類５
// 050825 hirota <<
            sTitle.Add('小数点桁数'				 );
			sTitle.Add('資金繰ｺｰﾄﾞ優先区分'		 );
			sTitle.Add('履歴管理区分'			 );
// 050825 hirota			sTitle.Add('第1補助電子帳簿採用区分' );
// 050825 hirota			sTitle.Add('第2補助電子帳簿採用区分' );
			sTitle.Add('適用開始年月日'			 );
			sTitle.Add('適用終了年月日'			 );
			sTitle.Add('更新日時'				 );
			sTitle.Add('集計単位区分'			 );								//HIS0098	//HIS0101(修正→集計)

			sMemFld.Add('Code'			);
			sMemFld.Add('SeishikiName'	);
			sMemFld.Add('KanryakuName'	);
			sMemFld.Add('Rensou'		);
			sMemFld.Add('MainaKamoku'	);
			sMemFld.Add('Bunseki'		);
			sMemFld.Add('YouYakuCode'	);
			sMemFld.Add('Seikaku'		);
			sMemFld.Add('KisyuName'		);
			sMemFld.Add('SeiZanName'	);
			sMemFld.Add('BsPlName'		);
			sMemFld.Add('KariKuri'		);
			sMemFld.Add('KashiKuri'		);
			sMemFld.Add('SousyokuName'	);
			sMemFld.Add('DspPriName'	);
// 050825 hirota			sMemFld.Add('Saimoku'		);
// 050825 hirota			sMemFld.Add('Hojo1'			);
// 050825 hirota			sMemFld.Add('Hojo2'			);
// 050825 hirota			sMemFld.Add('Bumon'			);
// 050825 hirota			sMemFld.Add('Seg'			);
			sMemFld.Add('HiritsuName'	);
			sMemFld.Add('Hendouhi'		);
			sMemFld.Add('SagakuName'	);
			sMemFld.Add('RiekiName'		);
			sMemFld.Add('MainasuPriName');
			sMemFld.Add('KihyouPri'		);
			sMemFld.Add('AveName'		);
			sMemFld.Add('RuikeiName'	);
			sMemFld.Add('ShiwakeName'	);
			sMemFld.Add('KijitsuName'	);
			sMemFld.Add('KijitsuHisu'	);
			sMemFld.Add('TegataNoName'	);
			sMemFld.Add('TegataHisu'	);
			sMemFld.Add('KoteiTekiName'	);
// 050825 hirota			sMemFld.Add('TekiyouBun'	);
// 050825 hirota >>
			sMemFld.Add('Bun1Nm'		);
			sMemFld.Add('Bun2Nm'		);
			sMemFld.Add('Bun3Nm'		);
			sMemFld.Add('Bun4Nm'		);
			sMemFld.Add('Bun5Nm'		);
// 050825 hirota <<
			sMemFld.Add('Syousu'		);
			sMemFld.Add('ShikuriYuName'	);
			sMemFld.Add('RirekiName'	);
// 050825 hirota			sMemFld.Add('DenHojo1Name'	);
// 050825 hirota			sMemFld.Add('DenHojo2Name'	);
			sMemFld.Add('StartDate' 	);										// 050825 hirota
			sMemFld.Add('EndDate'		);										// 050825 hirota
			sMemFld.Add('LastUpDate'	);
			sMemFld.Add('AddUnit'		);										//HIS0098
		end;
		SAIMOKU:	//	細目時
		begin
			sTitle.Add('科目ｺｰﾄﾞ'		   );
			sTitle.Add('科目簡略名称'	   );
			sTitle.Add('科目別補助ｺｰﾄﾞ'	   );
			sTitle.Add('正式科目名'		   );
			sTitle.Add('簡略科目名'		   );
			sTitle.Add('連想'			   );
			sTitle.Add('借方資金繰ｺｰﾄﾞ'	   );
			sTitle.Add('借方資金繰ｺｰﾄﾞ名称');
			sTitle.Add('貸方資金繰ｺｰﾄﾞ'	   );
			sTitle.Add('貸方資金繰ｺｰﾄﾞ名称');
			sTitle.Add('装飾区分'		   );
			sTitle.Add('小数点桁数'		   );
			sTitle.Add('適用開始年月日'	   );
			sTitle.Add('適用終了年月日'	   );
			sTitle.Add('更新日時'		   );

			sMemFld.Add('S_KCode'		 );
			sMemFld.Add('S_KName'		 );
			sMemFld.Add('S_SCode'		 );
			sMemFld.Add('S_SeisikiName'	 );
			sMemFld.Add('S_KanryakuName' );
			sMemFld.Add('S_Renso'		 );
			sMemFld.Add('S_KarikuriNo'	 );
			sMemFld.Add('S_KarikuriName' );
			sMemFld.Add('S_KashikuriNo'	 );
			sMemFld.Add('S_KashikuriName');
			sMemFld.Add('S_SousyokuName' );
			sMemFld.Add('S_Syousu'		 );
			sMemFld.Add('S_StartDate'	 );
			sMemFld.Add('S_EndDate'		 );
			sMemFld.Add('S_LastUpDate'	 );
        end;
		GOUKEI:		//	合計時
		begin
			sTitle.Add('合計ｺｰﾄﾞ'		   );
			sTitle.Add('正式科目名'		   );
			sTitle.Add('簡略科目名'		   );
			sTitle.Add('連想'			   );
			sTitle.Add('正残区分'		   );
			sTitle.Add('BS/PL区分'		   );
			sTitle.Add('装飾区分'		   );
			sTitle.Add('表示／印刷不可区分');
			sTitle.Add('差額印刷区分'	   );
			sTitle.Add('利益印刷区分'	   );
			sTitle.Add('ﾏｲﾅｽ印刷区分'	   );
			sTitle.Add('平均値採用区分'	   );
			sTitle.Add('累計集計区分'	   );
			sTitle.Add('合計表示区分'	   );
			sTitle.Add('ﾏｲﾅｽ変換科目名'	   );
			sTitle.Add('更新日時'		   );

			sMemFld.Add('G_Code'		 );
			sMemFld.Add('G_SeishikiName' );
			sMemFld.Add('G_KanryakuName' );
			sMemFld.Add('G_Rensou'		 );
			sMemFld.Add('G_SeizanName'	 );
			sMemFld.Add('G_BPName'		 );
			sMemFld.Add('G_SousyokuName' );
			sMemFld.Add('G_DsPriName'	 );
			sMemFld.Add('G_SagakuPriName');
			sMemFld.Add('G_RiekiPriName' );
			sMemFld.Add('G_MainaPriName' );
			sMemFld.Add('G_AveName'		 );
			sMemFld.Add('G_RuikeiName'	 );
			sMemFld.Add('G_GoukeiDsp'	 );
			sMemFld.Add('G_MainaKmk'	 );
			sMemFld.Add('G_LastUpDate'	 );
        end;
		TAIKEI:		//	体系時
		begin
			sTitle.Add('');
{			sTitle.Add('加算先簡略名称');
			sTitle.Add('加算元加算区分');
			sTitle.Add('加算元ｺｰﾄﾞ');
			sTitle.Add('加算元簡略名称');
}
//			sMemFld.Add('BitmapTop' );
			sMemFld.Add('Code'		);
			sMemFld.Add('SimpleName');
//			sMemFld.Add('Bitmap01'	);
			sMemFld.Add('Code01'	);
			sMemFld.Add('Name01'	);
//			sMemFld.Add('Bitmap02'	);
			sMemFld.Add('Code02'	);
			sMemFld.Add('Name02'	);
//			sMemFld.Add('Bitmap03'	);
			sMemFld.Add('Code03'	);
			sMemFld.Add('Name03'	);
//			sMemFld.Add('Bitmap04'	);
			sMemFld.Add('Code04'	);
			sMemFld.Add('Name04'	);
//			sMemFld.Add('Bitmap05'	);
			sMemFld.Add('Code05'	);
			sMemFld.Add('Name05'	);
//			sMemFld.Add('Bitmap06'	);
			sMemFld.Add('Code06'	);
			sMemFld.Add('Name06'	);
//			sMemFld.Add('Bitmap07'	);
			sMemFld.Add('Code07'	);
			sMemFld.Add('Name07'	);
//			sMemFld.Add('Bitmap08'	);
			sMemFld.Add('Code08'	);
			sMemFld.Add('Name08'	);
//			sMemFld.Add('Bitmap09'	);
			sMemFld.Add('Code09'	);
			sMemFld.Add('Name09'	);
        end;
		JITSUZAI_K:	//	実在科目(簡略)
		begin
			sTitle.Add('コード'			   );
			sTitle.Add('正式科目名'		   );
			sTitle.Add('簡略科目名'		   );
			sTitle.Add('連想'			   );
			sTitle.Add('分析ｺｰﾄﾞ'		   );
			sTitle.Add('分析名称'		   );
			sTitle.Add('性格ｺｰﾄﾞ'		   );
			sTitle.Add('性格名称'		   );
			sTitle.Add('正残区分'		   );
			sTitle.Add('BS/PL区分'		   );
			sTitle.Add('期首残区分'		   );
			sTitle.Add('借方資金繰ｺｰﾄﾞ'	   );
			sTitle.Add('借方資金繰ｺｰﾄﾞ名称');
			sTitle.Add('貸方資金繰ｺｰﾄﾞ'	   );
			sTitle.Add('貸方資金繰ｺｰﾄﾞ名称');
			sTitle.Add('装飾区分'		   );

			sMemFld.Add('J_Code'		 );
			sMemFld.Add('J_LongName'	 );
			sMemFld.Add('J_SimpleName'	 );
			sMemFld.Add('J_Renso'		 );
			sMemFld.Add('J_BunsekiCode'	 );
			sMemFld.Add('J_BunsekiName'	 );
			sMemFld.Add('J_SeikakuCode'	 );
			sMemFld.Add('J_SeikakuName'	 );
			sMemFld.Add('J_Seizan'		 );
			sMemFld.Add('J_BPKbn'		 );
			sMemFld.Add('J_Kisyuzan'	 );
			sMemFld.Add('J_KariKuriCode' );
			sMemFld.Add('J_KariKuriName' );
			sMemFld.Add('J_KashiKuriCode');
			sMemFld.Add('J_KashiKuriName');
			sMemFld.Add('J_Sousyoku');
        end;
		TAIKEILIST,TAIKEILIST_G:	//	体系時(実在,合計)
		begin
			sTitle.Add('加算元ｺｰﾄﾞ'	 );
			sTitle.Add('加算元科目名');
			sTitle.Add('加算減算'	 );
			sTitle.Add('加算先ｺｰﾄﾞ'	 );
			sTitle.Add('加算先科目名');
			sTitle.Add('加算減算'	 );
			sTitle.Add('加算先ｺｰﾄﾞ'	 );
			sTitle.Add('加算先科目名');
			sTitle.Add('加算減算'	 );
			sTitle.Add('加算先ｺｰﾄﾞ'	 );
			sTitle.Add('加算先科目名');

			sMemFld.Add('T_KMCode'	  );
			sMemFld.Add('T_KMKanryaku');
			sMemFld.Add('T_Add01'	  );
			sMemFld.Add('T_KSCode01'  );
			sMemFld.Add('T_KSName01'  );
			sMemFld.Add('T_Add02'	  );
			sMemFld.Add('T_KSCode02'  );
			sMemFld.Add('T_KSName02'  );
			sMemFld.Add('T_Add03'	  );
			sMemFld.Add('T_KSCode03'  );
			sMemFld.Add('T_KSName03'  );
		end;
//--- HIS0058 START -----
		ICHIRAN_J,ICHIRAN_G:	//	科目ｺｰﾄﾞ一覧
		begin
			sTitle.Add('科目ｺｰﾄﾞ'	 );
			sTitle.Add('科目名');

			sMemFld.Add('Ichi_KmkCode');
			sMemFld.Add('Ichi_KmkName');
		end;
//--- HIS0058  END  -----
//--- HIS0085 START -----
		HENDO:	//	変動損益関係ﾘｽﾄ
		begin
			sTitle.Add('科目ｺｰﾄﾞ'	);
			sTitle.Add('科目名'	 	);
			sTitle.Add('変動費ｺｰﾄﾞ'	);
			sTitle.Add('変動科目名'	);
			sTitle.Add('固定費ｺｰﾄﾞ'	);
			sTitle.Add('固定科目名'	);
			sTitle.Add('変動比率'	);

			sMemFld.Add('H_KMCode'	  );
			sMemFld.Add('H_KMKanryaku');
			sMemFld.Add('H_HendoCode' );
			sMemFld.Add('H_HendoName' );
			sMemFld.Add('H_KoteiCode' );
			sMemFld.Add('H_KoteiName' );
			sMemFld.Add('H_HendoRate' );
		end;
    end;

    if MjsFileOut(TargetMD, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;
	// 050825 hirota <<

    sTitle.Free;
    sMemFld.Free;

end;
//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP009001L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_JitsuS ( TppDetailBand )
//							実在科目最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_JitsuSBeforeGenerate(
  Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_JitsuS.LastRecord             ) or
       ( ppDetailBand_JitsuS.PageOutOfSpace  = TRUE ) Then
	begin
		if ( ppDetailBand_JitsuS.OverFlow = FALSE ) then
			ppDetailBand_JitsuS.OverFlow := TRUE;

		if ( ppUnderLineJS.ReprintOnOverFlow = FALSE ) then
			ppUnderLineJS.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineJS.Weight    :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineJS.Weight    :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	RSaimoku ( TppReport )
//							ﾍﾟｰｼﾞの最後
//		Event			:	OnEndPage
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.RSaimokuEndPage(Sender: TObject);
begin

    gsT_KamokuCode	:=	'';

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_Saimoku ( TppDetailBand )
//							細目科目最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_SaimokuBeforeGenerate(
  Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_Saimoku.LastRecord            ) or
       ( ppDetailBand_Saimoku.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Saimoku.OverFlow = FALSE ) then
			ppDetailBand_Saimoku.OverFlow := TRUE;

		if ( ppUnderLineS.ReprintOnOverFlow = FALSE ) then
			ppUnderLineS.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineS.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineS.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_GouBeforeGenerate ( TppDetailBand )
//							合計科目最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_GouBeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_Gou.LastRecord            ) or
       ( ppDetailBand_Gou.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Gou.OverFlow = FALSE ) then
			ppDetailBand_Gou.OverFlow := TRUE;

		if ( ppUnderLineG.ReprintOnOverFlow = FALSE ) then
			ppUnderLineG.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineG.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineG.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	RTaikeiListEndColumn ( TppReport )
//
//		Event			:	OnEndColumn
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.RTaikeiListEndColumn(Sender: TObject);
begin

    gsT_GoukeiCode	:=	'';

end;

//------------------------------------------------------------------------------
//		Component		:	RTaikeiListEndPage ( TppReport )
//                          ﾍﾟｰｼﾞの最後
//		Event			:	OnEndPage
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.RTaikeiListEndPage(Sender: TObject);
begin

    gsT_GoukeiCode	:=	'';

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_TaikeiBeforeGenerate ( TppDetailBand )
//							体系最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_TaikeiBeforeGenerate(
  Sender: TObject);
begin

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_Taikei.LastRecord            ) or
       ( ppDetailBand_Taikei.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Taikei.OverFlow = FALSE ) then
			ppDetailBand_Taikei.OverFlow := TRUE;

		if ( ppUnderLineT.ReprintOnOverFlow = FALSE ) then
            ppUnderLineT.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineT.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineT.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_JitsuKBeforeGenerate ( TppDetailBand )
//							在科目(簡略)最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_JitsuKBeforeGenerate(
  Sender: TObject);
begin

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_JitsuK.LastRecord            ) or
       ( ppDetailBand_JitsuK.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_JitsuK.OverFlow = FALSE ) then
			ppDetailBand_JitsuK.OverFlow := TRUE;

		if ( ppUnderLineJK.ReprintOnOverFlow = FALSE ) then
			ppUnderLineJK.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineJK.Weight    :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineJK.Weight    :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	RTaikeiEndPage ( TppReport )
//                          ﾍﾟｰｼﾞの最後
//		Event			:	OnEndPage
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.RTaikeiEndPage(Sender: TObject);
begin

//	fnArrayClear(0,FALSE);

end;

procedure TDmJNTCRP009001L.ppColumnHeaderBand1BeforeGenerate(
  Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_IchiBeforeGenerate ( TppDetailBand )
//							実在科目一覧の最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_IchiBeforeGenerate(
  Sender: TObject);
begin

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_Ichi.LastRecord            ) or
       ( ppDetailBand_Ichi.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Ichi.OverFlow = FALSE ) then
			ppDetailBand_Ichi.OverFlow := TRUE;

		if ( UnderLine_Ichi.ReprintOnOverFlow = FALSE ) then
			UnderLine_Ichi.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		UnderLine_Ichi.Weight   :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		UnderLine_Ichi.Weight   :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDetailBand_HendoBeforeGenerate ( TppDetailBand )
//							変動損益関係ﾘｽの最終ﾚｺｰﾄﾞ、頁の最下行を判定
//		Event			:	BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDetailBand_HendoBeforeGenerate(
  Sender: TObject);
begin

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_Hendo.LastRecord            ) or
       ( ppDetailBand_Hendo.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Hendo.OverFlow = FALSE ) then
			ppDetailBand_Hendo.OverFlow := TRUE;

		if ( UnderLine_Hendo.ReprintOnOverFlow = FALSE ) then
			UnderLine_Hendo.ReprintOnOverFlow := TRUE;

        // ﾗｲﾝの太さを太くしている
		UnderLine_Hendo.Weight  :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		UnderLine_Hendo.Weight  :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	R_KmkCode ( TppDBText )
//							細目科目ﾘｽﾄ印刷時の同一名表示制御
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.R_KmkCodePrint(Sender: TObject);
var
	sCode	:	String;
begin
	sCode	:=	R_KmkCode.Text;

	if ( gsT_KamokuCode <> sCode ) then
	begin
		R_KmkCode.Visible	:=	TRUE;
		R_KmkName.Visible	:=	TRUE;
		gsT_KamokuCode		:=	sCode;
	end
	else
	begin
		R_KmkCode.Visible	:=	FALSE;
		R_KmkName.Visible	:=	FALSE;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDBTextCodePrint ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBTextCodePrint(Sender: TObject);
var
	sCode	:	String;
begin
	sCode	:=	ppDBTextCode.Text;

	if ( gsT_GoukeiCode <> sCode ) then											// 050825 hirota
	begin
		ppDBTextCode.Visible		:=	TRUE;
		ppDBTextKanryaku.Visible	:=	TRUE;
		gsT_GoukeiCode	:=	sCode;
	end
	else
	begin
		ppDBTextCode.Visible		:=	FALSE;
		ppDBTextKanryaku.Visible	:=	FALSE;
	end;

end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_CodePrint ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_CodePrint(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
	swork		:	String;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
//	sCode := TargetQry.FieldByName('Code').AsString;							// 050825 hirota
	sCode := DataSource_Taikei.DataSet.FieldByName('Code').AsString;			// 050825 hirota

	//	Lineの移動処理
	//fnGetLinePosition(MemPrint_Taikei.FieldByName('SimpleName').AsString		// 050825 hirota
	fnGetLinePosition(DataSource_Taikei.DataSet.FieldByName('SimpleName').AsString	// 050825 hirota
						,ppDBText_TR_SName.Left,ppLineTate_101.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_101.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_101.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (gsT_TaikeiCode = '') then												// 050825 hirota
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if gsT_TaikeiCode <> sCode then												// 050825 hirota
	begin
		if (sCode = '-1') then
			ppDBText_TR_Code .Visible := FALSE		//	ｺｰﾄﾞ
		else
			ppDBText_TR_Code .Visible := TRUE;		//	ｺｰﾄﾞ
		ppDBText_TR_SName.Visible := TRUE;		//	簡略名称
		ppDBImage.Visible := TRUE;

		//	ｺｰﾄﾞ(Code01)が空白ではない時
		//swork := MemPrint_Taikei.FieldByName('Code01').AsString;				// 050825 hirota
		swork := DataSource_Taikei.DataSet.FieldByName('Code01').AsString;		// 050825 hirota
		if ( swork <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			//if (MemPrint_Taikei.FieldByName('MaxEnt01').AsString <> '*') then			// 050825 hirota
			if (DataSource_Taikei.DataSet.FieldByName('MaxEnt01').AsString <> '*') then	// 050825 hirota
			begin
				//	┬型の表示
				ppLineTate_101.Visible := FALSE;
				ppLineTate_102.Visible := TRUE;
				ppLineYoko_101.Visible := TRUE;
				ppLineYoko_102.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	非表示
				ppLineTate_101.Visible := FALSE;
				ppLineTate_102.Visible := FALSE;
				ppLineYoko_101.Visible := TRUE;
				ppLineYoko_102.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞ(Code01)が空白の時
		else
		begin
			//	非表示
			ppLineTate_101.Visible := FALSE;
			ppLineTate_102.Visible := FALSE;
			ppLineYoko_101.Visible := FALSE;
			ppLineYoko_102.Visible := FALSE;
		end;

		aSaveFlag[1] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(0,FALSE);			//	退避配列をClear
		gsT_TaikeiCode := sCode;		//	ｺｰﾄﾞを退避							// 050825 hirota
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_Code .Visible := FALSE;		//	ｺｰﾄﾞ
		ppDBText_TR_SName.Visible := FALSE;		//	簡略名称
		ppDBImage.Visible := FALSE;

		sCode := MemPrint_Taikei.FieldByName('Code01').AsString;
		//	ｺｰﾄﾞ(Code01)が空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_101.Visible := FALSE;
			ppLineTate_102.Visible := FALSE;
			ppLineYoko_101.Visible := FALSE;
			ppLineYoko_102.Visible := FALSE;
		end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[1] <> sCode then
		begin
			//	ｺｰﾄﾞ(Code01)が空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt01').AsString = '*') and (aSaveFlag[1] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_101.Visible := TRUE;
					ppLineTate_102.Visible := FALSE;
					ppLineYoko_101.Visible := FALSE;
					ppLineYoko_102.Visible := TRUE;
					aSaveFlag[1] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_101.Visible := FALSE;
						ppLineTate_102.Visible := TRUE;
						ppLineYoko_101.Visible := TRUE;
						ppLineYoko_102.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_101.Visible := TRUE;
						ppLineTate_102.Visible := TRUE;
						ppLineYoko_101.Visible := FALSE;
						ppLineYoko_102.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞ(Code01)が空白の時
			else
			begin
				//	非表示
				ppLineTate_101.Visible := FALSE;
				ppLineTate_102.Visible := FALSE;
				ppLineYoko_101.Visible := FALSE;
				ppLineYoko_102.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt01').AsString = '*') then
			begin
				//	非表示
				ppLineTate_101.Visible := FALSE;
				ppLineTate_102.Visible := FALSE;
				ppLineYoko_101.Visible := FALSE;
				ppLineYoko_102.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_101.Visible := TRUE;
				ppLineTate_102.Visible := TRUE;
				ppLineYoko_101.Visible := FALSE;
				ppLineYoko_102.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn01Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(01)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn01Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code01').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name01').AsString
						,ppDBText_TR_Name01.Left,ppLineTate_201.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_201.Left	 := siYokoLeft;	//	横線のLeft
	ppLineYoko_201.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[1] <> sCode then
	begin
		ppDBText_TR_AddKbn01.Visible := TRUE;	//	加算減算区分
		ppDBImage_01		.Visible := TRUE;
		ppDBText_TR_Code01	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name01	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code02').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt02').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_201.Visible := FALSE;
				ppLineTate_202.Visible := TRUE;
				ppLineYoko_201.Visible := TRUE;
				ppLineYoko_202.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_201.Visible := FALSE;
				ppLineTate_202.Visible := FALSE;
				ppLineYoko_201.Visible := TRUE;
				ppLineYoko_202.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_201.Visible := FALSE;
			ppLineTate_202.Visible := FALSE;
			ppLineYoko_201.Visible := FALSE;
			ppLineYoko_202.Visible := FALSE;
		end;

		aSaveFlag[2] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(1,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[1] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn01.Visible := FALSE;	//	加算減算区分
		ppDBImage_01		.Visible := FALSE;
		ppDBText_TR_Code01	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name01	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code02').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_201.Visible := FALSE;
			ppLineTate_202.Visible := FALSE;
			ppLineYoko_201.Visible := FALSE;
			ppLineYoko_202.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[2] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt02').AsString = '*') and (aSaveFlag[2] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_201.Visible := TRUE;
					ppLineTate_202.Visible := FALSE;
					ppLineYoko_201.Visible := FALSE;
					ppLineYoko_202.Visible := TRUE;
					aSaveFlag[2] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_201.Visible := FALSE;
						ppLineTate_202.Visible := TRUE;
						ppLineYoko_201.Visible := TRUE;
						ppLineYoko_202.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_201.Visible := TRUE;
						ppLineTate_202.Visible := TRUE;
						ppLineYoko_201.Visible := FALSE;
						ppLineYoko_202.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_201.Visible := FALSE;
				ppLineTate_202.Visible := FALSE;
				ppLineYoko_201.Visible := FALSE;
				ppLineYoko_202.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt02').AsString = '*') then
			begin
				//	非表示
				ppLineTate_201.Visible := FALSE;
				ppLineTate_202.Visible := FALSE;
				ppLineYoko_201.Visible := FALSE;
				ppLineYoko_202.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_201.Visible := TRUE;
				ppLineTate_202.Visible := TRUE;
				ppLineYoko_201.Visible := FALSE;
				ppLineYoko_202.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn02Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(02)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn02Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code02').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name02').AsString
						,ppDBText_TR_Name02.Left,ppLineTate_301.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_301.Left	 := siYokoLeft;	//	横線のLeft
	ppLineYoko_301.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[2] <> sCode then
	begin
		ppDBText_TR_AddKbn02.Visible := TRUE;	//	加算減算区分
		ppDBImage_02		.Visible := TRUE;
		ppDBText_TR_Code02	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name02	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code03').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt03').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_301.Visible := FALSE;
				ppLineTate_302.Visible := TRUE;
				ppLineYoko_301.Visible := TRUE;
				ppLineYoko_302.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_301.Visible := FALSE;
				ppLineTate_302.Visible := FALSE;
				ppLineYoko_301.Visible := TRUE;
				ppLineYoko_302.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_301.Visible := FALSE;
			ppLineTate_302.Visible := FALSE;
			ppLineYoko_301.Visible := FALSE;
			ppLineYoko_302.Visible := FALSE;
		end;

		aSaveFlag[3] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(2,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[2] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn02.Visible := FALSE;	//	加算減算区分
		ppDBImage_02		.Visible := FALSE;
		ppDBText_TR_Code02	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name02	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code03').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_301.Visible := FALSE;
			ppLineTate_302.Visible := FALSE;
			ppLineYoko_301.Visible := FALSE;
			ppLineYoko_302.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[3] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt03').AsString = '*') and (aSaveFlag[3] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_301.Visible := TRUE;
					ppLineTate_302.Visible := FALSE;
					ppLineYoko_301.Visible := FALSE;
					ppLineYoko_302.Visible := TRUE;
					aSaveFlag[3] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_301.Visible := FALSE;
						ppLineTate_302.Visible := TRUE;
						ppLineYoko_301.Visible := TRUE;
						ppLineYoko_302.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_301.Visible := TRUE;
						ppLineTate_302.Visible := TRUE;
						ppLineYoko_301.Visible := FALSE;
						ppLineYoko_302.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_301.Visible := FALSE;
				ppLineTate_302.Visible := FALSE;
				ppLineYoko_301.Visible := FALSE;
				ppLineYoko_302.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt03').AsString = '*') then
			begin
				//	非表示
				ppLineTate_301.Visible := FALSE;
				ppLineTate_302.Visible := FALSE;
				ppLineYoko_301.Visible := FALSE;
				ppLineYoko_302.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_301.Visible := TRUE;
				ppLineTate_302.Visible := TRUE;
				ppLineYoko_301.Visible := FALSE;
				ppLineYoko_302.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn03Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(03)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn03Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code03').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name03').AsString
						,ppDBText_TR_Name03.Left,ppLineTate_401.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_401.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_401.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[3] <> sCode then
	begin
		ppDBText_TR_AddKbn03.Visible := TRUE;	//	加算減算区分
		ppDBImage_03		.Visible := TRUE;
		ppDBText_TR_Code03	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name03	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code04').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt04').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_401.Visible := FALSE;
				ppLineTate_402.Visible := TRUE;
				ppLineYoko_401.Visible := TRUE;
				ppLineYoko_402.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_401.Visible := FALSE;
				ppLineTate_402.Visible := FALSE;
				ppLineYoko_401.Visible := TRUE;
				ppLineYoko_402.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_401.Visible := FALSE;
			ppLineTate_402.Visible := FALSE;
			ppLineYoko_401.Visible := FALSE;
			ppLineYoko_402.Visible := FALSE;
		end;

		aSaveFlag[4] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(3,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[3] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn03.Visible := FALSE;	//	加算減算区分
		ppDBImage_03		.Visible := FALSE;
		ppDBText_TR_Code03	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name03	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code04').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_401.Visible := FALSE;
			ppLineTate_402.Visible := FALSE;
			ppLineYoko_401.Visible := FALSE;
			ppLineYoko_402.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[4] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt04').AsString = '*') and (aSaveFlag[4] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_401.Visible := TRUE;
					ppLineTate_402.Visible := FALSE;
					ppLineYoko_401.Visible := FALSE;
					ppLineYoko_402.Visible := TRUE;
					aSaveFlag[4] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_401.Visible := FALSE;
						ppLineTate_402.Visible := TRUE;
						ppLineYoko_401.Visible := TRUE;
						ppLineYoko_402.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_401.Visible := TRUE;
						ppLineTate_402.Visible := TRUE;
						ppLineYoko_401.Visible := FALSE;
						ppLineYoko_402.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_401.Visible := FALSE;
				ppLineTate_402.Visible := FALSE;
				ppLineYoko_401.Visible := FALSE;
				ppLineYoko_402.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt04').AsString = '*') then
			begin
				//	非表示
				ppLineTate_401.Visible := FALSE;
				ppLineTate_402.Visible := FALSE;
				ppLineYoko_401.Visible := FALSE;
				ppLineYoko_402.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_401.Visible := TRUE;
				ppLineTate_402.Visible := TRUE;
				ppLineYoko_401.Visible := FALSE;
				ppLineYoko_402.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn04 ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(04)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn04Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code04').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name04').AsString
						,ppDBText_TR_Name04.Left,ppLineTate_501.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_501.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_501.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[4] <> sCode then
	begin
		ppDBText_TR_AddKbn04.Visible := TRUE;	//	加算減算区分
		ppDBImage_04		.Visible := TRUE;
		ppDBText_TR_Code04	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name04	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code05').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt05').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_501.Visible := FALSE;
				ppLineTate_502.Visible := TRUE;
				ppLineYoko_501.Visible := TRUE;
				ppLineYoko_502.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_501.Visible := FALSE;
				ppLineTate_502.Visible := FALSE;
				ppLineYoko_501.Visible := TRUE;
				ppLineYoko_502.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_501.Visible := FALSE;
			ppLineTate_502.Visible := FALSE;
			ppLineYoko_501.Visible := FALSE;
			ppLineYoko_502.Visible := FALSE;
		end;

		aSaveFlag[5] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(4,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[4] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn04.Visible := FALSE;	//	加算減算区分
		ppDBImage_04		.Visible := FALSE;
		ppDBText_TR_Code04	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name04	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code05').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_501.Visible := FALSE;
			ppLineTate_502.Visible := FALSE;
			ppLineYoko_501.Visible := FALSE;
			ppLineYoko_502.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[5] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt05').AsString = '*') and (aSaveFlag[5] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_501.Visible := TRUE;
					ppLineTate_502.Visible := FALSE;
					ppLineYoko_501.Visible := FALSE;
					ppLineYoko_502.Visible := TRUE;
					aSaveFlag[5] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_501.Visible := FALSE;
						ppLineTate_502.Visible := TRUE;
						ppLineYoko_501.Visible := TRUE;
						ppLineYoko_502.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_501.Visible := TRUE;
						ppLineTate_502.Visible := TRUE;
						ppLineYoko_501.Visible := FALSE;
						ppLineYoko_502.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_501.Visible := FALSE;
				ppLineTate_502.Visible := FALSE;
				ppLineYoko_501.Visible := FALSE;
				ppLineYoko_502.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt05').AsString = '*') then
			begin
				//	非表示
				ppLineTate_501.Visible := FALSE;
				ppLineTate_502.Visible := FALSE;
				ppLineYoko_501.Visible := FALSE;
				ppLineYoko_502.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_501.Visible := TRUE;
				ppLineTate_502.Visible := TRUE;
				ppLineYoko_501.Visible := FALSE;
				ppLineYoko_502.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn05 ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(05)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn05Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code05').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name05').AsString
						,ppDBText_TR_Name05.Left,ppLineTate_601.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_601.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_601.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[5] <> sCode then
	begin
		ppDBText_TR_AddKbn05.Visible := TRUE;	//	加算減算区分
		ppDBImage_05		.Visible := TRUE;
		ppDBText_TR_Code05	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name05	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code06').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt06').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_601.Visible := FALSE;
				ppLineTate_602.Visible := TRUE;
				ppLineYoko_601.Visible := TRUE;
				ppLineYoko_602.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_601.Visible := FALSE;
				ppLineTate_602.Visible := FALSE;
				ppLineYoko_601.Visible := TRUE;
				ppLineYoko_602.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_601.Visible := FALSE;
			ppLineTate_602.Visible := FALSE;
			ppLineYoko_601.Visible := FALSE;
			ppLineYoko_602.Visible := FALSE;
		end;

		aSaveFlag[6] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(5,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[5] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn05.Visible := FALSE;	//	加算減算区分
		ppDBImage_05		.Visible := FALSE;
		ppDBText_TR_Code05	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name05	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code06').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_601.Visible := FALSE;
			ppLineTate_602.Visible := FALSE;
			ppLineYoko_601.Visible := FALSE;
			ppLineYoko_602.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[6] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt06').AsString = '*') and (aSaveFlag[6] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_601.Visible := TRUE;
					ppLineTate_602.Visible := FALSE;
					ppLineYoko_601.Visible := FALSE;
					ppLineYoko_602.Visible := TRUE;
					aSaveFlag[6] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_601.Visible := FALSE;
						ppLineTate_602.Visible := TRUE;
						ppLineYoko_601.Visible := TRUE;
						ppLineYoko_602.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_601.Visible := TRUE;
						ppLineTate_602.Visible := TRUE;
						ppLineYoko_601.Visible := FALSE;
						ppLineYoko_602.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_601.Visible := FALSE;
				ppLineTate_602.Visible := FALSE;
				ppLineYoko_601.Visible := FALSE;
				ppLineYoko_602.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt06').AsString = '*') then
			begin
				//	非表示
				ppLineTate_601.Visible := FALSE;
				ppLineTate_602.Visible := FALSE;
				ppLineYoko_601.Visible := FALSE;
				ppLineYoko_602.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_601.Visible := TRUE;
				ppLineTate_602.Visible := TRUE;
				ppLineYoko_601.Visible := FALSE;
				ppLineYoko_602.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn06Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(06)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn06Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code06').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name06').AsString
						,ppDBText_TR_Name06.Left,ppLineTate_701.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_701.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_701.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[6] <> sCode then
	begin
		ppDBText_TR_AddKbn06.Visible := TRUE;	//	加算減算区分
		ppDBImage_06		.Visible := TRUE;
		ppDBText_TR_Code06	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name06	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code07').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt07').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_701.Visible := FALSE;
				ppLineTate_702.Visible := TRUE;
				ppLineYoko_701.Visible := TRUE;
				ppLineYoko_702.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_701.Visible := FALSE;
				ppLineTate_702.Visible := FALSE;
				ppLineYoko_701.Visible := TRUE;
				ppLineYoko_702.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_701.Visible := FALSE;
			ppLineTate_702.Visible := FALSE;
			ppLineYoko_701.Visible := FALSE;
			ppLineYoko_702.Visible := FALSE;
		end;

		aSaveFlag[7] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(6,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[6] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn06.Visible := FALSE;	//	加算減算区分
		ppDBImage_06		.Visible := FALSE;
		ppDBText_TR_Code06	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name06	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code07').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_701.Visible := FALSE;
			ppLineTate_702.Visible := FALSE;
			ppLineYoko_701.Visible := FALSE;
			ppLineYoko_702.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[7] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt07').AsString = '*') and (aSaveFlag[7] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_701.Visible := TRUE;
					ppLineTate_702.Visible := FALSE;
					ppLineYoko_701.Visible := FALSE;
					ppLineYoko_702.Visible := TRUE;
					aSaveFlag[7] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_701.Visible := FALSE;
						ppLineTate_702.Visible := TRUE;
						ppLineYoko_701.Visible := TRUE;
						ppLineYoko_702.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_701.Visible := TRUE;
						ppLineTate_702.Visible := TRUE;
						ppLineYoko_701.Visible := FALSE;
						ppLineYoko_702.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_701.Visible := FALSE;
				ppLineTate_702.Visible := FALSE;
				ppLineYoko_701.Visible := FALSE;
				ppLineYoko_702.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt07').AsString = '*') then
			begin
				//	非表示
				ppLineTate_701.Visible := FALSE;
				ppLineTate_702.Visible := FALSE;
				ppLineYoko_701.Visible := FALSE;
				ppLineYoko_702.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_701.Visible := TRUE;
				ppLineTate_702.Visible := TRUE;
				ppLineYoko_701.Visible := FALSE;
				ppLineYoko_702.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn07Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(07)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn07Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code07').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name07').AsString
						,ppDBText_TR_Name07.Left,ppLineTate_801.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_801.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_801.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[7] <> sCode then
	begin
		ppDBText_TR_AddKbn07.Visible := TRUE;	//	加算減算区分
		ppDBImage_07		.Visible := TRUE;
		ppDBText_TR_Code07	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name07	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code08').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt08').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_801.Visible := FALSE;
				ppLineTate_802.Visible := TRUE;
				ppLineYoko_801.Visible := TRUE;
				ppLineYoko_802.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_801.Visible := FALSE;
				ppLineTate_802.Visible := FALSE;
				ppLineYoko_801.Visible := TRUE;
				ppLineYoko_802.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_801.Visible := FALSE;
			ppLineTate_802.Visible := FALSE;
			ppLineYoko_801.Visible := FALSE;
			ppLineYoko_802.Visible := FALSE;
		end;

		aSaveFlag[8] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(7,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[7] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn07.Visible := FALSE;	//	加算減算区分
		ppDBImage_07		.Visible := FALSE;
		ppDBText_TR_Code07	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name07	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code08').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_801.Visible := FALSE;
			ppLineTate_802.Visible := FALSE;
			ppLineYoko_801.Visible := FALSE;
			ppLineYoko_802.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[8] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt08').AsString = '*') and (aSaveFlag[8] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_801.Visible := TRUE;
					ppLineTate_802.Visible := FALSE;
					ppLineYoko_801.Visible := FALSE;
					ppLineYoko_802.Visible := TRUE;
					aSaveFlag[8] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_801.Visible := FALSE;
						ppLineTate_802.Visible := TRUE;
						ppLineYoko_801.Visible := TRUE;
						ppLineYoko_802.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_801.Visible := TRUE;
						ppLineTate_802.Visible := TRUE;
						ppLineYoko_801.Visible := FALSE;
						ppLineYoko_802.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_801.Visible := FALSE;
				ppLineTate_802.Visible := FALSE;
				ppLineYoko_801.Visible := FALSE;
				ppLineYoko_802.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt08').AsString = '*') then
			begin
				//	非表示
				ppLineTate_801.Visible := FALSE;
				ppLineTate_802.Visible := FALSE;
				ppLineYoko_801.Visible := FALSE;
				ppLineYoko_802.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_801.Visible := TRUE;
				ppLineTate_802.Visible := TRUE;
				ppLineYoko_801.Visible := FALSE;
				ppLineYoko_802.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn08Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(08)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn08Print(Sender: TObject);
var
	sCode		:	String;
	bFlag		:	Boolean;
	siYokoLeft	:	Single;
	siYokoWidth	:	Single;
begin
{
	siYokoLeft  := 0;
	siYokoWidth := 0;

	bFlag := TRUE;
	sCode := MemPrint_Taikei.FieldByName('Code08').AsString;

	//	Lineの移動処理
	fnGetLinePosition(MemPrint_Taikei.FieldByName('Name08').AsString
						,ppDBText_TR_Name08.Left,ppLineTate_901.Left,siYokoLeft,siYokoWidth);
	ppLineYoko_901.Left	 := siYokoLeft;		//	横線のLeft
	ppLineYoko_901.Width := siYokoWidth;	//	横線のWidth

	//	改頁の時
	if (aTaikeiSaveCode[0] = '') then
		bFlag := FALSE;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[8] <> sCode then
	begin
		ppDBText_TR_AddKbn08.Visible := TRUE;	//	加算減算区分
		ppDBImage_08		.Visible := TRUE;
		ppDBText_TR_Code08	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name08	.Visible := TRUE;	//	簡略名称

		//	ｺｰﾄﾞが空白ではない時
		if ( MemPrint_Taikei.FieldByName('Code09').AsString <> '') then
		begin
			//	最大登録NOの科目ｺｰﾄﾞではない時
			if (MemPrint_Taikei.FieldByName('MaxEnt09').AsString <> '*') then
			begin
				//	┬型の表示
				ppLineTate_901.Visible := FALSE;
				ppLineTate_902.Visible := TRUE;
				ppLineYoko_901.Visible := TRUE;
				ppLineYoko_902.Visible := TRUE;
			end
			//	最大登録NOの科目ｺｰﾄﾞの時
			else
			begin
				//	─型の表示
				ppLineTate_901.Visible := FALSE;
				ppLineTate_902.Visible := FALSE;
				ppLineYoko_901.Visible := TRUE;
				ppLineYoko_902.Visible := TRUE;
			end;
		end
		//	ｺｰﾄﾞが空白の時
		else
		begin
			//	非表示
			ppLineTate_901.Visible := FALSE;
			ppLineTate_902.Visible := FALSE;
			ppLineYoko_901.Visible := FALSE;
			ppLineYoko_902.Visible := FALSE;
		end;

		aSaveFlag[9] := FALSE;			//	退避ﾌﾗｸﾞをFALSE
		fnArrayClear(8,FALSE);			//	退避配列をClear
		aTaikeiSaveCode[8] := sCode;	//	ｺｰﾄﾞを退避
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn08.Visible := FALSE;	//	加算減算区分
		ppDBImage_08		.Visible := FALSE;
		ppDBText_TR_Code08	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name08	.Visible := FALSE;	//	簡略名称

		sCode := MemPrint_Taikei.FieldByName('Code09').AsString;
		//	ｺｰﾄﾞが空白の時
		if (sCode = '') then
		begin
			//	非表示
			ppLineTate_901.Visible := FALSE;
			ppLineTate_902.Visible := FALSE;
			ppLineYoko_901.Visible := FALSE;
			ppLineYoko_902.Visible := FALSE;
        end
		//	保存ｺｰﾄﾞと違う時は表示
		else if aTaikeiSaveCode[9] <> sCode then
		begin
			//	ｺｰﾄﾞが空白ではない時
			if (sCode <> '') then
			begin
				//	最大登録NOの科目ｺｰﾄﾞの時でかつｾｰﾌﾞﾌﾗｸﾞがFALSEの時
				//	(SaveFlagは最後の科目表示後線を表示しない様にする為に使用)
				if (MemPrint_Taikei.FieldByName('MaxEnt09').AsString = '*') and (aSaveFlag[9] = FALSE) then
				begin
					//	└型の表示
					ppLineTate_901.Visible := TRUE;
					ppLineTate_902.Visible := FALSE;
					ppLineYoko_901.Visible := FALSE;
					ppLineYoko_902.Visible := TRUE;
					aSaveFlag[9] := TRUE;
				end
				else
				begin
					//	改頁の時
					if (bFlag = FALSE) then
					begin
						//	┬型の表示
						ppLineTate_901.Visible := FALSE;
						ppLineTate_902.Visible := TRUE;
						ppLineYoko_901.Visible := TRUE;
						ppLineYoko_902.Visible := TRUE;
					end
					//	改頁ではない時
					else
					begin
						//	├型の表示
						ppLineTate_901.Visible := TRUE;
						ppLineTate_902.Visible := TRUE;
						ppLineYoko_901.Visible := FALSE;
						ppLineYoko_902.Visible := TRUE;
					end;
				end;
			end
			//	ｺｰﾄﾞが空白の時
			else
			begin
				//	非表示
				ppLineTate_901.Visible := FALSE;
				ppLineTate_902.Visible := FALSE;
				ppLineYoko_901.Visible := FALSE;
				ppLineYoko_902.Visible := FALSE;
			end;
		end
		else
		begin
			//	最大登録NOの科目ｺｰﾄﾞの時
			if (MemPrint_Taikei.FieldByName('MaxEnt09').AsString = '*') then
			begin
				//	非表示
				ppLineTate_901.Visible := FALSE;
				ppLineTate_902.Visible := FALSE;
				ppLineYoko_901.Visible := FALSE;
				ppLineYoko_902.Visible := FALSE;
			end
			//	最大登録NOの科目ｺｰﾄﾞではない時
			else
			begin
				//	│型の表示
				ppLineTate_901.Visible := TRUE;
				ppLineTate_902.Visible := TRUE;
				ppLineYoko_901.Visible := FALSE;
				ppLineYoko_902.Visible := FALSE;
			end;
		end;
	end;
}
end;

//------------------------------------------------------------------------------
//		Component		:	ppDBText_TR_AddKbn09Print ( TppDBText )
//							科目加算ﾘｽﾄ印刷時の同一名表示制御(09)
//		Event			:	OnPrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009001L.ppDBText_TR_AddKbn09Print(Sender: TObject);
var
	sCode		:	String;
//	pOverRec	:	POverCodeRec;
	iLoop		:	Integer;
	iCode		:	Integer;
begin
{
	sCode := MemPrint_Taikei.FieldByName('Code09').AsString;

	//	保存ｺｰﾄﾞと違う時は表示
	if aTaikeiSaveCode[9] <> sCode then
	begin
		ppDBText_TR_AddKbn09.Visible := TRUE;	//	加算減算区分
		ppDBImage_09		.Visible := TRUE;
		ppDBText_TR_Code09	.Visible := TRUE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name09	.Visible := TRUE;	//	簡略名称
		fnArrayClear(9,FALSE);
		aTaikeiSaveCode[9] := sCode;
	end
	//	保存ｺｰﾄﾞと同一の時は非表示
	else
	begin
		ppDBText_TR_AddKbn09.Visible := FALSE;	//	加算減算区分
		ppDBImage_09		.Visible := FALSE;
		ppDBText_TR_Code09	.Visible := FALSE;	//	ｺｰﾄﾞ
		ppDBText_TR_Name09	.Visible := FALSE;	//	簡略名称
	end;

	//	ｺｰﾄﾞが空白でなく、実在/合計区分が合計の時
	if (sCode <> '') and (MemPrint_Taikei.FieldByName('SumKbn09').AsInteger = 1) then
    begin
		iCode := StrToInt(sCode);
		for iLoop := 0 to m_OverCodeList2.Count-1 do
		begin
			pOverRec := m_OverCodeList2.Items[iLoop];
			if (iCode = pOverRec^.KmkCode) and (pOverRec^.SumKbn = 1) then
				ppLabel29.Visible := TRUE;
		end;
	end
	else
		ppLabel29.Visible := FALSE;
}
end;

// 050825 hirota>>
{
//-----------------------------------------------------------------------------
// HagureMakePrint()
//	< はぐれの印刷処理 >
//      PARAM   : DspName			:	表示する文字 ]
//                DspNameLeft		:	名称表示のｺﾝﾎﾟｰﾈﾝﾄのLeft
//                TateLeft		    :	縦線のｺﾝﾎﾟｰﾈﾝﾄのLeft
//      VAR     : YokoLeft	        :	横線のｺﾝﾎﾟｰﾈﾝﾄLeft
//                YokoWidth	        :	横線のｺﾝﾎﾟｰﾈﾝﾄWeight
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TDmJNTCRP009001L.fnGetLinePosition(DspName: String; DspNameLeft,TateLeft: Single;
												var YokoLeft: Single; var YokoWidth: Single);
var
	iCount		:	Single;
begin
	//	表示する文字数を取得
	iCount := Length(DspName);

	//	文字数が12文字を超えていた時
	if (iCount > 12) then
		iCount := 12;

	//	横線の左の位置(Left)を取得
	YokoLeft := (iCount * 0.063) + DspNameLeft;

	//	横線の幅(Weight)を取得
	YokoWidth := (TateLeft - YokoLeft);
end;
}
// 050825 hirota<<

end.
