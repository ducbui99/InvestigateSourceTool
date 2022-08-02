//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    支払先(項目別)情報(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.08.14(SUN)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   茂木 勇次   2006.02.02(THU) 未対応の帳票の作成。
//  <002>   川戸 仁美   2006.08.08(THU) 査定区分、口座自動引落区分の追加。
//  <003>   川戸 仁美   2007.02.20(THU) ﾌﾟﾛｼﾞｪｸﾄ別支払対応
//  <004>   川戸 仁美   2007.07.10(THU) ﾌﾟﾛｼﾞｪｸﾄ別支払採用時、相殺補助情報の
//                                      属性を参照するよう修正
//  <005>   川戸 仁美   2007.07.19(THU) 支払先登録リスト不具合修正
//  <006>   川戸 仁美   2007.12.25(MON) 査定金額自動計算対応
//  <007>   T.SATOH(IDC)2008/09/29(MON) 印刷履歴スプール名改良
//  <008>   T.SATOH(IDC)2009/07/03(FRI) 支払方法登録リスト名の改良
//	<009>	長沼 雄一   2009/10/06(TUE) 優先支払を手形以外を設定できるよう対応
//  <AUT>   SATOH(GSOL) 2012.08.07(TUE) JNTAuthority対応
//  <010>   SATOH(GSOL) 2012.08.07(TUE) 電子債権対応
//  <GA001> T.Kobayashi 2014/01/22      外貨債務対応
//  <203>   T.Kobayashi 2014/02/07(FRI) 電子記録債権の時、手形情報に手数料計算区分を追加する
//  <GA002> T.Kobayashi 2014/02/17(THU) 印刷履歴対応
//  <#C16>  H.KUMO      2014/07/03(THU) 取引先コード16桁対応（デザインのみ）
//                                      ・RBの取引先コードに長体をかけて修正
//  <#NGEN>	小室(Admax)	2019/05/10(FRI) R01消費税対応
//	<011>	M.Tsuta		2022/06/08(THU)	CSV出力時に「正式名称」列に簡略名称が出力されてしまう不具合修正 <SRB:CMY-0111>
//                                      ※支払情報関連帳票は、印刷も含めて簡略名称を出力しており、
//										  既存ユーザーへの影響も考慮し、出力内容ではなくタイトルを「支払先簡略名称」に変更する
//=============================================================================
unit JNTCRP004007Lu;

interface

uses

  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTAuthorityu,   //  <AUT> ADD
  JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
    ppModule, daDatMod, ppDesignLayer, ppParameter;
  //raCodMod;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004007L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    CmnReportPay: TppReport;
    DSPayMethods: TDataSource;
    PipelinePayMethods: TppDBPipeline;
    ReportFurikomi: TppReport;
    DSFurikomi: TDataSource;
    PipelineFurikomi: TppDBPipeline;
    PipelineFurikomippField1: TppField;
    PipelineFurikomippField2: TppField;
    PipelineFurikomippField3: TppField;
    PipelineFurikomippField4: TppField;
    PipelineFurikomippField5: TppField;
    PipelineFurikomippField6: TppField;
    PipelineFurikomippField7: TppField;
    PipelineFurikomippField8: TppField;
    PipelineFurikomippField9: TppField;
    PipelineFurikomippField10: TppField;
    PipelineFurikomippField11: TppField;
    PipelineFurikomippField12: TppField;
    PipelineFurikomippField13: TppField;
    PipelineFurikomippField14: TppField;
    PipelineFurikomippField15: TppField;
    PipelineFurikomippField16: TppField;
    PipelineFurikomippField17: TppField;
    PipelineFurikomippField18: TppField;
    PipelineFurikomippField19: TppField;
    PipelineFurikomippField20: TppField;
    PipelineFurikomippField21: TppField;
    PipelineFurikomippField22: TppField;
    PipelineFurikomippField23: TppField;
    PipelineFurikomippField24: TppField;
    ReportDraft: TppReport;
    ReportCheck: TppReport;
    PipelineDraftCheck: TppDBPipeline;
    PipelineDraftCheckppField1: TppField;
    PipelineDraftCheckppField2: TppField;
    PipelineDraftCheckppField3: TppField;
    PipelineDraftCheckppField4: TppField;
    PipelineDraftCheckppField5: TppField;
    PipelineDraftCheckppField6: TppField;
    PipelineDraftCheckppField7: TppField;
    PipelineDraftCheckppField8: TppField;
    PipelineDraftCheckppField9: TppField;
    PipelineDraftCheckppField10: TppField;
    PipelineDraftCheckppField11: TppField;
    DSDraftCheck: TDataSource;
    ReportOffset: TppReport;
    PipelineOffset: TppDBPipeline;
    PipelineOffsetppField1: TppField;
    PipelineOffsetppField2: TppField;
    PipelineOffsetppField3: TppField;
    PipelineOffsetppField4: TppField;
    PipelineOffsetppField5: TppField;
    PipelineOffsetppField6: TppField;
    PipelineOffsetppField7: TppField;
    PipelineOffsetppField8: TppField;
    PipelineOffsetppField9: TppField;
    PipelineOffsetppField10: TppField;
    PipelineOffsetppField11: TppField;
    PipelineOffsetppField12: TppField;
    PipelineOffsetppField13: TppField;
    PipelineOffsetppField14: TppField;
    PipelineOffsetppField15: TppField;
    PipelineOffsetppField16: TppField;
    PipelineOffsetppField17: TppField;
    PipelineOffsetppField18: TppField;
    DSPrintOffset: TDataSource;
    ppHeaderBand4: TppHeaderBand;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel1: TppLabel;
    ppLine51: TppLine;
    ppLabel3: TppLabel;
    ppDetailBand0: TppDetailBand;
    ppStandardUnderLine0: TppLine;
    DBTxt_Base_GCode: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    CmnReportExtStandardBnkDBTextAppDateStart: TppDBText;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine88: TppLine;
    ppDBText1: TppDBText;
    ppLine2: TppLine;
    ppDBText110: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand4: TppFooterBand;
    SVppPage0: TppSystemVariable;
    ppHeaderBand5: TppHeaderBand;
    ppLine66: TppLine;
    ppLine26: TppLine;
    ppLine46: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel32: TppLabel;
    CorpCode5: TppLabel;
    CorpName5: TppLabel;
    LabelTitle5: TppLabel;
    LineTitle5: TppLine;
    SVppDate5: TppSystemVariable;
    ppLine48: TppLine;
    ppLine53: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine70: TppLine;
    ppLabel33: TppLabel;
    ppLine89: TppLine;
    ppLabel34: TppLabel;
    ppLine91: TppLine;
    ppLabel36: TppLabel;
    ppLine93: TppLine;
    ppDetailBand5: TppDetailBand;
    ppStandardUnderLine5: TppLine;
    DBTxt_Offset_GCode: TppDBText;
    ppDBText802: TppDBText;
    ppDBText801: TppDBText;
    ppDBText803: TppDBText;
    ppDBText804: TppDBText;
    ppLine74: TppLine;
    ppLine37: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine38: TppLine;
    ppLine47: TppLine;
    ppDBText806: TppDBText;
    DBTextHojCD01: TppDBText;
    ppLine39: TppLine;
    DBTextHojCD02: TppDBText;
    ppLine40: TppLine;
    ppDBText809: TppDBText;
    ppLine41: TppLine;
    DBTextHojCD03: TppDBText;
    ppLine87: TppLine;
    ppDBText811: TppDBText;
    ppLine42: TppLine;
    ppDBText812: TppDBText;
    ppLine90: TppLine;
    ppDBText813: TppDBText;
    ppLine92: TppLine;
    ppDBText814: TppDBText;
    ppLine94: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage5: TppSystemVariable;
    ppHeaderBand7: TppHeaderBand;
    ppLine97: TppLine;
    ppLine106: TppLine;
    ppLine108: TppLine;
    ppLabel38: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    CorpCode3: TppLabel;
    CorpName3: TppLabel;
    LabelTitle3: TppLabel;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    ppLine110: TppLine;
    ppLine111: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppLabel51: TppLabel;
    ppLine115: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine122: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine136: TppLine;
    ppLine137: TppLine;
    ppDetailBand3: TppDetailBand;
    ppStandardUnderLine3: TppLine;
    DBTxt_Draft_GCode: TppDBText;
    ppDBText602: TppDBText;
    ppLine128: TppLine;
    ppLine129: TppLine;
    ppDBText603: TppDBText;
    ppLine130: TppLine;
    ppDBText604: TppDBText;
    ppLine131: TppLine;
    ppDBText605: TppDBText;
    ppLine132: TppLine;
    ppDBText606: TppDBText;
    ppLine133: TppLine;
    ppDBText610: TppDBText;
    ppLine134: TppLine;
    ppDBText609: TppDBText;
    ppLine135: TppLine;
    ppLine138: TppLine;
    ppLine139: TppLine;
    ppDBText608: TppDBText;
    ppDBText607: TppDBText;
    ppLabel63: TppLabel;
    ppLabel62: TppLabel;
    ppFooterBand7: TppFooterBand;
    SVppPage3: TppSystemVariable;
    ppHeaderBand6: TppHeaderBand;
    ppLine71: TppLine;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    CorpCode4: TppLabel;
    CorpName4: TppLabel;
    LabelTitle4: TppLabel;
    LineTitle4: TppLine;
    SVppDate4: TppSystemVariable;
    ppLine98: TppLine;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine102: TppLine;
    ppLabel45: TppLabel;
    ppLine103: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLine105: TppLine;
    ppDetailBand4: TppDetailBand;
    ppStandardUnderLine4: TppLine;
    DBTxt_Check_GCode: TppDBText;
    ppDBText702: TppDBText;
    ppLine107: TppLine;
    ppLine116: TppLine;
    ppDBText703: TppDBText;
    ppLine117: TppLine;
    ppDBText704: TppDBText;
    ppLine118: TppLine;
    ppDBText705: TppDBText;
    ppLine119: TppLine;
    ppDBText706: TppDBText;
    ppLine120: TppLine;
    ppDBText708: TppDBText;
    ppLine121: TppLine;
    ppDBText707: TppDBText;
    ppLine104: TppLine;
    ppFooterBand6: TppFooterBand;
    SVppPage4: TppSystemVariable;
    ppLine43: TppLine;
    ppLabel28: TppLabel;
    ppLine44: TppLine;
    ppDBText5: TppDBText;
    ppHeaderBand8: TppHeaderBand;
    LabelTitle2: TppLabel;
    LineTitle2: TppLine;
    ppShape3: TppShape;
    ppLine123: TppLine;
    ppLabel49: TppLabel;
    ppLine140: TppLine;
    ppLabel50: TppLabel;
    ppLine141: TppLine;
    ppLabel59: TppLabel;
    ppLine142: TppLine;
    ppLine143: TppLine;
    ppLabel64: TppLabel;
    ppLine144: TppLine;
    ppLine145: TppLine;
    ppLabel19: TppLabel;
    ppLine146: TppLine;
    ppLabel20: TppLabel;
    ppLine147: TppLine;
    ppLine148: TppLine;
    ppLine149: TppLine;
    ppLine150: TppLine;
    ppLine151: TppLine;
    ppLabel21: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    LabelWay: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    CorpCode2: TppLabel;
    CorpName2: TppLabel;
    SVppDate2: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppLineLeft: TppLine;
    ppLine152: TppLine;
    ppLine153: TppLine;
    ppLine154: TppLine;
    ppLine155: TppLine;
    ppLine156: TppLine;
    ppLine157: TppLine;
    ppLine158: TppLine;
    ppLine159: TppLine;
    ppLine160: TppLine;
    ppLine161: TppLine;
    ppLine162: TppLine;
    ppLine163: TppLine;
    ppLine164: TppLine;
    ppLine165: TppLine;
    ppStandardUnderLine2: TppLine;
    DBTxt_Furikomi_GCode: TppDBText;
    DBTxt_Furikomi_Nmk: TppDBText;
    ppDBTextIraiAccNo: TppDBText;
    ppDBTextIraiAccName: TppDBText;
    ppDBTextShiAccKbnName: TppDBText;
    ppDBTextShiAccNo: TppDBText;
    ppDBTextBankCode: TppDBText;
    ppDBTextBkBraCode: TppDBText;
    ppLabel79: TppLabel;
    ppDBTextBankName: TppDBText;
    ppDBTextBkBraName: TppDBText;
    ppDBTextBankKanaName: TppDBText;
    ppDBTextBraKanaName: TppDBText;
    ppDBTextTransKanaName: TppDBText;
    ppDBTextHuriAccKbnName: TppDBText;
    ppDBTextHuriAccKbnNo: TppDBText;
    ppDBTextChargeFutanName: TppDBText;
    ppDBTextChargeKbnName: TppDBText;
    ppDBTextFBSetName: TppDBText;
    ppDBTextEdiInfo: TppDBText;
    ppLine166: TppLine;
    ppDBTextAiteNo1: TppDBText;
    ppDBTextAiteNo2: TppDBText;
    DBTextTransKbn_D: TppDBText;
    DBTextTransKbn_F: TppDBText;
    DBTextSite_D: TppDBText;
    LabelSite: TppLabel;
    ppFooterBand8: TppFooterBand;
    SVppPage2: TppSystemVariable;
    ppLine45: TppLine;
    ppLine49: TppLine;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    CmnReportPrjPay: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine50: TppLine;
    ppLine52: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLabel31: TppLabel;
    ppLabel35: TppLabel;
    ppLabel53: TppLabel;
    CorpCode6: TppLabel;
    CorpName6: TppLabel;
    LabelTitle6: TppLabel;
    LineTitle6: TppLine;
    SVppDate6: TppSystemVariable;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLabel72: TppLabel;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLabel81: TppLabel;
    ppLine63: TppLine;
    ppLabel82: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    SVppPage6: TppSystemVariable;
    ReportPrjDraft: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine167: TppLine;
    ppLine169: TppLine;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    CorpCode9: TppLabel;
    CorpName9: TppLabel;
    LabelTitle9: TppLabel;
    LineTitle9: TppLine;
    SVppDate9: TppSystemVariable;
    ppLine171: TppLine;
    ppLine172: TppLine;
    ppLine173: TppLine;
    ppLine174: TppLine;
    ppLine175: TppLine;
    ppLabel90: TppLabel;
    ppLine176: TppLine;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine177: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLine178: TppLine;
    ppLine179: TppLine;
    ppDetailBand7: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    SVppPage9: TppSystemVariable;
    ReportPrjCheck: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLine191: TppLine;
    ppLine192: TppLine;
    ppLine193: TppLine;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    CorpCode10: TppLabel;
    CorpName10: TppLabel;
    LabelTitle10: TppLabel;
    LineTitle10: TppLine;
    SVppDate10: TppSystemVariable;
    ppLine195: TppLine;
    ppLine196: TppLine;
    ppLine197: TppLine;
    ppLine198: TppLine;
    ppLine199: TppLine;
    ppLabel104: TppLabel;
    ppLine200: TppLine;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLine201: TppLine;
    ppDetailBand8: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    SVppPage10: TppSystemVariable;
    ReportPrjPayMethods: TppReport;
    ppHeaderBand10: TppHeaderBand;
    LabelTitle7: TppLabel;
    LineTitle7: TppLine;
    ppShape2: TppShape;
    ppLine213: TppLine;
    ppLabel109: TppLabel;
    ppLine214: TppLine;
    ppLabel110: TppLabel;
    ppLine215: TppLine;
    ppLine216: TppLine;
    ppLabel111: TppLabel;
    ppLine217: TppLine;
    ppLabel112: TppLabel;
    ppLine218: TppLine;
    ppLabel113: TppLabel;
    ppLine219: TppLine;
    ppLabel114: TppLabel;
    ppLine220: TppLine;
    ppLabel115: TppLabel;
    ppLine221: TppLine;
    ppLine222: TppLine;
    ppLine223: TppLine;
    ppLine224: TppLine;
    ppLine225: TppLine;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    CorpCode7: TppLabel;
    CorpName7: TppLabel;
    SVppDate7: TppSystemVariable;
    ppDetailBand9: TppDetailBand;
    ppFooterBand10: TppFooterBand;
    SVppPage7: TppSystemVariable;
    ReportPrjOffset: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLine244: TppLine;
    ppLine246: TppLine;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    CorpCode11: TppLabel;
    CorpName11: TppLabel;
    LabelTitle11: TppLabel;
    LineTitle11: TppLine;
    SVppDate11: TppSystemVariable;
    ppLine248: TppLine;
    ppLine249: TppLine;
    ppLine250: TppLine;
    ppLine251: TppLine;
    ppLine252: TppLine;
    ppLabel133: TppLabel;
    ppLine253: TppLine;
    ppLabel134: TppLabel;
    ppLine254: TppLine;
    ppLabel135: TppLabel;
    ppLine255: TppLine;
    ppDetailBand10: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    SVppPage11: TppSystemVariable;
    ReportPrjFurikomi: TppReport;
    ppHeaderBand12: TppHeaderBand;
    LabelTitle8: TppLabel;
    LineTitle8: TppLine;
    ppShape4: TppShape;
    ppLine273: TppLine;
    ppLabel137: TppLabel;
    ppLine274: TppLine;
    ppLabel138: TppLabel;
    ppLine275: TppLine;
    ppLabel139: TppLabel;
    ppLine276: TppLine;
    ppLine277: TppLine;
    ppLabel140: TppLabel;
    ppLine278: TppLine;
    ppLine279: TppLine;
    ppLabel141: TppLabel;
    ppLine280: TppLine;
    ppLabel142: TppLabel;
    ppLine281: TppLine;
    ppLine282: TppLine;
    ppLine283: TppLine;
    ppLine284: TppLine;
    ppLine285: TppLine;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    PrjLabelWay: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    CorpCode8: TppLabel;
    CorpName8: TppLabel;
    SVppDate8: TppSystemVariable;
    ppLine286: TppLine;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppFooterBand12: TppFooterBand;
    SVppPage8: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine56: TppLine;
    DBTxt_PrjBase_GCode: TppDBText;
    ppDBText11: TppDBText;
    ppLine64: TppLine;
    ppDBText8: TppDBText;
    ppLine65: TppLine;
    ppDBText9: TppDBText;
    ppLine72: TppLine;
    ppLine109: TppLine;
    ppLabel48: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    DBTxt_PrjPayMethods_GCode: TppDBText;
    ppDBtxtPrjPayName: TppDBText;
    ppLine226: TppLine;
    ppLine227: TppLine;
    ppLine228: TppLine;
    ppLine229: TppLine;
    ppLabel131: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    DBTxt_PrjFurikomi_GCode: TppDBText;
    DBTxt_PrjFurikomi_Nmk: TppDBText;
    ppLine294: TppLine;
    ppLine297: TppLine;
    ppLine298: TppLine;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine310: TppLine;
    ppLine311: TppLine;
    ppLine312: TppLine;
    DBTxt_PrjCheck_GCode: TppDBText;
    ppDBText46: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine315: TppLine;
    ppLine316: TppLine;
    DBTxt_PrjDraft_GCode: TppDBText;
    ppDBText49: TppDBText;
    ppLine181: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine323: TppLine;
    ppLine324: TppLine;
    ppLine325: TppLine;
    DBTxt_PrjOffset_GCode: TppDBText;
    ppDBText55: TppDBText;
    ppLine73: TppLine;
    ppStandardUnderLine6: TppLine;
    ppLine124: TppLine;
    ppLine239: TppLine;
    ppLine245: TppLine;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText12: TppDBText;
    ppDBText10: TppDBText;
    ppLine69: TppLine;
    ppLine125: TppLine;
    ppLine257: TppLine;
    ppLine258: TppLine;
    ppLine259: TppLine;
    ppLine260: TppLine;
    ppLine261: TppLine;
    ppLine262: TppLine;
    ppLine263: TppLine;
    ppLine264: TppLine;
    ppLine265: TppLine;
    ppLine266: TppLine;
    ppLine267: TppLine;
    ppLine268: TppLine;
    ppLine269: TppLine;
    ppLine270: TppLine;
    ppLine271: TppLine;
    ppStandardUnderLine7: TppLine;
    ppDBText24: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBtxtPrjHouhouNo1: TppDBText;
    ppDBtxtPrjHouhouNo2: TppDBText;
    ppDBtxtPrjHouhouNo3: TppDBText;
    ppDBtxtPrjHouhouNo4: TppDBText;
    ppDBtxtPrjHouhouNo5: TppDBText;
    ppDBTxtPrjHouhouName1: TppDBText;
    ppDBTxtPrjHouhouName2: TppDBText;
    ppDBTxtPrjHouhouName3: TppDBText;
    ppDBTxtPrjHouhouName4: TppDBText;
    ppDBTxtPrjHouhouName5: TppDBText;
    ppDBtxtPrjStdRitu1: TppDBText;
    ppDBtxtPrjStdRitu2: TppDBText;
    ppDBtxtPrjStdRitu3: TppDBText;
    ppDBtxtPrjStdRitu4: TppDBText;
    ppDBtxtPrjStdRitu5: TppDBText;
    ppDBtxtPrjMinKin1: TppDBText;
    ppDBtxtPrjMinKin2: TppDBText;
    ppDBtxtPrjMinKin3: TppDBText;
    ppDBtxtPrjMinKin4: TppDBText;
    ppDBtxtPrjMinKin5: TppDBText;
    ppDBtxtPrjHasuuKin1: TppDBText;
    ppDBtxtPrjHasuuKin2: TppDBText;
    ppDBtxtPrjHasuuKin3: TppDBText;
    ppDBtxtPrjHasuuKin4: TppDBText;
    ppDBtxtPrjHasuuKin5: TppDBText;
    ppDBtxtPrjHasuuHou1: TppDBText;
    ppDBtxtPrjHasuuHou2: TppDBText;
    ppDBtxtPrjHasuuHou3: TppDBText;
    ppDBtxtPrjHasuuHou4: TppDBText;
    ppDBtxtPrjHasuuHou5: TppDBText;
    ppDBText26: TppDBText;
    ppDBText50: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBtxtPrjBaseHiritu1: TppDBText;
    ppDBtxtPrjBaseHiritu2: TppDBText;
    ppDBtxtPrjBaseHiritu3: TppDBText;
    ppDBtxtPrjBaseHiritu4: TppDBText;
    ppDBtxtPrjBaseHiritu5: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppLine126: TppLine;
    ppLine127: TppLine;
    ppLine170: TppLine;
    ppLine180: TppLine;
    ppLine194: TppLine;
    ppLine202: TppLine;
    ppLine211: TppLine;
    ppLine231: TppLine;
    ppLine232: TppLine;
    ppLine233: TppLine;
    ppLine235: TppLine;
    ppLine296: TppLine;
    ppLine302: TppLine;
    ppStandardUnderLine8: TppLine;
    ppLine212: TppLine;
    ppLine230: TppLine;
    ppLine234: TppLine;
    ppLine305: TppLine;
    ppDBText85: TppDBText;
    ppDBText17: TppDBText;
    ppDBTextPrjIraiAccNo: TppDBText;
    ppDBTextPrjIraiAccName: TppDBText;
    ppDBTextPrjShiAccKbnName: TppDBText;
    ppDBTextPrjShiAccNo: TppDBText;
    ppDBTextPrjBankCode: TppDBText;
    ppLabel103: TppLabel;
    ppDBTextPrjBkBraCode: TppDBText;
    ppDBTextPrjBankName: TppDBText;
    ppDBTextPrjBkBraName: TppDBText;
    ppDBTextPrjBankKanaName: TppDBText;
    ppDBTextPrjBraKanaName: TppDBText;
    ppDBTextPrjTransKanaName: TppDBText;
    ppDBTextPrjHuriAccKbnName: TppDBText;
    ppDBTextPrjHuriAccKbnNo: TppDBText;
    ppDBTextPrjChargeFutanName: TppDBText;
    ppDBTextPrjChargeKbnName: TppDBText;
    DBTextPrjTransKbn_D: TppDBText;
    DBTextPrjTransKbn_F: TppDBText;
    DBTextPrjSite_D: TppDBText;
    LabelPrjSite: TppLabel;
    ppDBTextPrjFBSetName: TppDBText;
    ppDBTextPrjEdiInfo: TppDBText;
    ppLine236: TppLine;
    ppDBTextPrjAiteNo1: TppDBText;
    ppDBTextPrjAiteNo2: TppDBText;
    ppDBText28: TppDBText;
    ppDBText36: TppDBText;
    ppLine237: TppLine;
    ppLine238: TppLine;
    ppLine240: TppLine;
    ppLine241: TppLine;
    ppLine242: TppLine;
    ppLine243: TppLine;
    ppLine247: TppLine;
    ppLine256: TppLine;
    ppLine272: TppLine;
    ppLine287: TppLine;
    ppStandardUnderLine9: TppLine;
    ppDBText18: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLabel107: TppLabel;
    ppDBText35: TppDBText;
    ppLabel108: TppLabel;
    ppDBText45: TppDBText;
    ppDBText47: TppDBText;
    ppLine203: TppLine;
    ppLine204: TppLine;
    ppLine205: TppLine;
    ppLine206: TppLine;
    ppLine207: TppLine;
    ppLine208: TppLine;
    ppLine209: TppLine;
    ppLine210: TppLine;
    ppStandardUnderLine10: TppLine;
    ppDBText48: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppLine288: TppLine;
    ppLine289: TppLine;
    ppLine290: TppLine;
    ppLine291: TppLine;
    ppLine292: TppLine;
    ppLine293: TppLine;
    ppLine295: TppLine;
    ppLine299: TppLine;
    ppLine300: TppLine;
    ppLine301: TppLine;
    ppLine303: TppLine;
    ppLine304: TppLine;
    ppLine306: TppLine;
    ppLine307: TppLine;
    ppLine308: TppLine;
    ppStandardUnderLine11: TppLine;
    ppDBText44: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    DBTextPrjHojCD01: TppDBText;
    ppDBText23: TppDBText;
    DBTextPrjHojCD02: TppDBText;
    ppDBText86: TppDBText;
    DBTextPrjHojCD03: TppDBText;
    ppDBText88: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText87: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppDBText2: TppDBText;
    DBTxt_Base_SateiCalc: TppDBText;
    ppLine168: TppLine;
    ppLabel2: TppLabel;
    ppDBText65: TppDBText;
    DBTxt_PrjBase_SateiCalc: TppDBText;
    ppLine182: TppLine;
    ppLine183: TppLine;
    ppLabel54: TppLabel;
    ppLine185: TppLine;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ReportPayMethods: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    ppShape5: TppShape;
    ppLine186: TppLine;
    ppLine187: TppLine;
    ppLabel56: TppLabel;
    ppLine188: TppLine;
    ppLine189: TppLine;
    ppLabel80: TppLabel;
    ppLine190: TppLine;
    ppLabel83: TppLabel;
    ppLine309: TppLine;
    ppLabel87: TppLabel;
    ppLine313: TppLine;
    ppLabel88: TppLabel;
    ppLine314: TppLine;
    ppLabel89: TppLabel;
    ppLine317: TppLine;
    ppLine318: TppLine;
    ppLine319: TppLine;
    ppLine320: TppLine;
    ppLine321: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    SVppDate1: TppSystemVariable;
    ppLine322: TppLine;
    ppLabel136: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLineDLeft: TppLine;
    ppLine327: TppLine;
    ppLine328: TppLine;
    ppLine329: TppLine;
    ppLine330: TppLine;
    ppLine331: TppLine;
    ppLine332: TppLine;
    ppLine333: TppLine;
    ppLine334: TppLine;
    ppLine335: TppLine;
    ppLine336: TppLine;
    ppLine337: TppLine;
    ppLine338: TppLine;
    ppLine339: TppLine;
    ppLine340: TppLine;
    ppLine341: TppLine;
    ppLine342: TppLine;
    ppStandardUnderLine1: TppLine;
    ppDBtxtBunkaiName: TppDBText;
    ppDBtxtHouhouNo1: TppDBText;
    ppDBtxtHouhouNo2: TppDBText;
    ppDBtxtHouhouNo3: TppDBText;
    ppDBtxtHouhouNo4: TppDBText;
    ppDBtxtHouhouNo5: TppDBText;
    ppDBTxtHouhouName1: TppDBText;
    ppDBTxtHouhouName2: TppDBText;
    ppDBTxtHouhouName3: TppDBText;
    ppDBTxtHouhouName4: TppDBText;
    ppDBTxtHouhouName5: TppDBText;
    ppDBtxtStdRitu1: TppDBText;
    ppDBtxtStdRitu2: TppDBText;
    ppDBtxtStdRitu3: TppDBText;
    ppDBtxtStdRitu4: TppDBText;
    ppDBtxtStdRitu5: TppDBText;
    ppDBtxtMinKin1: TppDBText;
    ppDBtxtMinKin2: TppDBText;
    ppDBtxtMinKin3: TppDBText;
    ppDBtxtMinKin4: TppDBText;
    ppDBtxtMinKin5: TppDBText;
    ppDBtxtHasuuKin1: TppDBText;
    ppDBtxtHasuuKin2: TppDBText;
    ppDBtxtHasuuKin3: TppDBText;
    ppDBtxtHasuuKin4: TppDBText;
    ppDBtxtHasuuKin5: TppDBText;
    ppDBtxtHasuuHou1: TppDBText;
    ppDBtxtHasuuHou2: TppDBText;
    ppDBtxtHasuuHou3: TppDBText;
    ppDBtxtHasuuHou4: TppDBText;
    ppDBtxtHasuuHou5: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBtxtBaseHiritu1: TppDBText;
    ppDBtxtBaseHiritu2: TppDBText;
    ppDBtxtBaseHiritu3: TppDBText;
    ppDBtxtBaseHiritu4: TppDBText;
    ppDBtxtBaseHiritu5: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppFooterBand1: TppFooterBand;
    SVppPage1: TppSystemVariable;
    DBTxt_PayMethods_GCode: TppDBText;
    DBtxtPayName1: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel6: TppLabel;
    ppDBText68: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel7: TppLabel;
    ppDBText69: TppDBText;
    ppLabel8: TppLabel;
    ppDBText100: TppDBText;
    ppLine11: TppLine;
    ppLabel9: TppLabel;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppLine12: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppLabel15: TppLabel;
    ppDBText107: TppDBText;
    ppLabel16: TppLabel;
    ppDBText108: TppDBText;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel52: TppLabel;
    ppLabel55: TppLabel;
    ppLabel130: TppLabel;
    ppDBText109: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine184: TppLine;
    ppLine326: TppLine;
    ppLine343: TppLine;
    ppLine344: TppLine;
    ppLine345: TppLine;
    ppLine346: TppLine;
    ppLine347: TppLine;
    ppLabel132: TppLabel;
    ppDBText117: TppDBText;
    ppLabel148: TppLabel;
    ppDBText118: TppDBText;
    ppLabel155: TppLabel;
    ppDBText119: TppDBText;
    ppLine348: TppLine;
    ppLine349: TppLine;
    ppLine350: TppLine;
    ppLine351: TppLine;
    ppLine352: TppLine;
    ppLine353: TppLine;
    ppLine354: TppLine;
    ppLine355: TppLine;
    ppLine356: TppLine;
    ppLine357: TppLine;
    ppLabel156: TppLabel;
    ppLabel159: TppLabel;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppLabel164: TppLabel;
    ppDBText126: TppDBText;
    ppLabel165: TppLabel;
    ppDBText127: TppDBText;
    ppLine358: TppLine;
    ppLine359: TppLine;
    ppLine360: TppLine;
    ppLine361: TppLine;
    ppLine362: TppLine;
    ppLine363: TppLine;
    ppLine364: TppLine;
    ppLine365: TppLine;
    ppDBText128: TppDBText;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppDBText129: TppDBText;
    ppLabel168: TppLabel;
    ppDBText130: TppDBText;
    ppLabel169: TppLabel;
    ppDBText131: TppDBText;
    ppLabel170: TppLabel;
    ppDBText132: TppDBText;
    dsMainG: TDataSource;
    bdeplMainG: TppDBPipeline;
    ReportKihonG: TppReport;
    ppHeaderBand16: TppHeaderBand;
    CorpCode16: TppLabel;
    CorpName16: TppLabel;
    LabelTitle16: TppLabel;
    LineTitle16: TppLine;
    SVppDate16: TppSystemVariable;
    ppDetailBand16: TppDetailBand;
    ppStandardUnderLine16: TppLine;
    DBTxt_KihonG_GCode: TppDBText;
    DBTxt_KihonG_Name: TppDBText;
    ppDBText186: TppDBText;
    ppLine397: TppLine;
    ppLine398: TppLine;
    ppLine399: TppLine;
    ppLine400: TppLine;
    ppLine401: TppLine;
    DBTxt_KihonG_strGaiPay: TppDBText;
    ppLine402: TppLine;
    DBTxt_KihonG_strGaiKbn: TppDBText;
    ppFooterBand16: TppFooterBand;
    SVppPage16: TppSystemVariable;
    DSFurikomiGD: TDataSource;
    PipelineFurikomiGD: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    ppField20: TppField;
    ppField21: TppField;
    ppField22: TppField;
    ppField23: TppField;
    ppField24: TppField;
    ReportFurikomiGD: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel171: TppLabel;
    ppLine366: TppLine;
    LabelTitle17: TppLabel;
    LineTitle17: TppLine;
    ppLine368: TppLine;
    ppLabel173: TppLabel;
    ppLine369: TppLine;
    ppLine370: TppLine;
    ppLabel194: TppLabel;
    ppLabel196: TppLabel;
    ppLabel200: TppLabel;
    CorpCode17: TppLabel;
    CorpName17: TppLabel;
    SVppDate17: TppSystemVariable;
    ppLabel205: TppLabel;
    ppLabel204: TppLabel;
    ppLine371: TppLine;
    ppLine377: TppLine;
    ppLine387: TppLine;
    ppLabel189: TppLabel;
    ppLabel182: TppLabel;
    ppLine372: TppLine;
    ppLabel175: TppLabel;
    ppLine373: TppLine;
    ppLabel190: TppLabel;
    ppLine413: TppLine;
    ppLabel191: TppLabel;
    ppLabel174: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppLine404: TppLine;
    ppLine405: TppLine;
    ppLine415: TppLine;
    ppLine416: TppLine;
    ppLine417: TppLine;
    ppStandardUnderLine17: TppLine;
    DBTxt_FuriGD_HojCode: TppDBText;
    DBTxt_FuriGD_sName: TppDBText;
    DBTxt_FuriGD_ChangeFutanName: TppDBText;
    DBTxt_FuriGD_ChangeKbnName: TppDBText;
    ppLine421: TppLine;
    DBTxt_FuriGD_SendNo: TppDBText;
    DBTxt_FuriGD_SendLNo: TppDBText;
    ppLine388: TppLine;
    ppLine374: TppLine;
    ppLine403: TppLine;
    DBTxt_FuriGD_IraiFeeAccNo: TppDBText;
    DBTxt_FuriGD_IraiFeeAccName: TppDBText;
    DBTxt_FuriGD_ShiFeeAccKbnName: TppDBText;
    DBTxt_FuriGD_ShiFeeAccNo: TppDBText;
    ppLine414: TppLine;
    ppLine488: TppLine;
    DBTxt_FuriGD_IraiAccNo: TppDBText;
    DBTxt_FuriGD_ShiAccKbnName: TppDBText;
    DBTxt_FuriGD_ShiAccNo: TppDBText;
    DBTxt_FuriGD_EditInfo: TppDBText;
    DBTxt_FuriGD_SendPos: TppDBText;
    ppLine375: TppLine;
    DBTxt_FuriGD_SendDate: TppDBText;
    ppFooterBand17: TppFooterBand;
    SVppPage17: TppSystemVariable;
    DSFurikomiGT: TDataSource;
    PipelineFurikomiGT: TppDBPipeline;
    ppField25: TppField;
    ppField26: TppField;
    ppField27: TppField;
    ppField28: TppField;
    ppField29: TppField;
    ppField30: TppField;
    ppField31: TppField;
    ppField32: TppField;
    ppField33: TppField;
    ppField34: TppField;
    ppField35: TppField;
    ppField36: TppField;
    ppField37: TppField;
    ppField38: TppField;
    ppField39: TppField;
    ppField40: TppField;
    ppField41: TppField;
    ppField42: TppField;
    ppField43: TppField;
    ppField44: TppField;
    ppField45: TppField;
    ppField46: TppField;
    ppField47: TppField;
    ppField48: TppField;
    ReportFurikomiGT: TppReport;
    ppHeaderBand18: TppHeaderBand;
    LabelTitle18: TppLabel;
    LineTitle18: TppLine;
    ppLine378: TppLine;
    ppLabel177: TppLabel;
    CorpCode18: TppLabel;
    CorpName18: TppLabel;
    SVppDate18: TppSystemVariable;
    ppLine384: TppLine;
    ppLabel199: TppLabel;
    ppLabel201: TppLabel;
    ppLine386: TppLine;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppLine406: TppLine;
    ppLine407: TppLine;
    ppStandardUnderLine18: TppLine;
    DBTxt_FuriGT_HojCode: TppDBText;
    DBTxt_FuriGT_SName: TppDBText;
    ppLine412: TppLine;
    ppLine422: TppLine;
    ppLine423: TppLine;
    DBTxt_FuriGT_IraiAccNo: TppDBText;
    DBTxt_FuriGT_IraiAccName: TppDBText;
    DBTxt_FuriGT_ShiAccKbnName: TppDBText;
    DBTxt_FuriGT_ShiAccNo: TppDBText;
    ppFooterBand18: TppFooterBand;
    SVppPage18: TppSystemVariable;
    ppShape6: TppShape;
    DSFurikomiGK: TDataSource;
    PipelineFurikomiGK: TppDBPipeline;
    ReportFurikomiGK: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppShape7: TppShape;
    ppLabel172: TppLabel;
    LabelTitle19: TppLabel;
    LineTitle19: TppLine;
    ppLine380: TppLine;
    ppLabel178: TppLabel;
    CorpCode19: TppLabel;
    CorpName19: TppLabel;
    SVppDate19: TppSystemVariable;
    ppLine383: TppLine;
    ppLine409: TppLine;
    ppLabel198: TppLabel;
    ppLabel206: TppLabel;
    ppLine410: TppLine;
    ppLabel207: TppLabel;
    ppLine411: TppLine;
    ppLabel208: TppLabel;
    ppLine418: TppLine;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppLine419: TppLine;
    ppLine420: TppLine;
    ppStandardUnderLine19: TppLine;
    DBTxt_FuriGK_HojCode: TppDBText;
    DBTxt_FuriGK_SName: TppDBText;
    ppLine429: TppLine;
    ppLine430: TppLine;
    ppLine431: TppLine;
    DBTxt_FuriGK_IraiFeeAccNo: TppDBText;
    DBTxt_FuriGK_IraiFeeAccName: TppDBText;
    DBTxt_FuriGK_ShiFeeAccKbnName: TppDBText;
    DBTxt_FuriGK_ShiFeeAccNO: TppDBText;
    ppLine432: TppLine;
    ppLine433: TppLine;
    DBTxt_FuriGK_IraiAccNO: TppDBText;
    DBTxt_FuriGK_IraiAccName: TppDBText;
    DBTxt_FuriGK_ShiAccKbnName: TppDBText;
    DBTxt_FuriGK_ShiAccNO: TppDBText;
    ppLine434: TppLine;
    ppFooterBand19: TppFooterBand;
    SVppPage19: TppSystemVariable;
    ppShape8: TppShape;
    ppLabel176: TppLabel;
    ppLabel179: TppLabel;
    ppLine425: TppLine;
    DBTxt_FuriGK_SendNO: TppDBText;
    DBTxt_FuriGK_SendLNo: TppDBText;
    DBTxt_FuriGK_SendPos: TppDBText;
    DBTxt_FuriGK_SendDate: TppDBText;
    ppLine376: TppLine;
    DSKhnsetG: TDataSource;
    PipelineKhnsetG: TppDBPipeline;
    ppField73: TppField;
    ppField74: TppField;
    ppField75: TppField;
    ppField76: TppField;
    ppField77: TppField;
    ppField78: TppField;
    ppField79: TppField;
    ppField80: TppField;
    ppField81: TppField;
    ppField82: TppField;
    ppField83: TppField;
    ppField84: TppField;
    ppField85: TppField;
    ppField86: TppField;
    ppField87: TppField;
    ppField88: TppField;
    ppField89: TppField;
    ppField90: TppField;
    ppField91: TppField;
    ppField92: TppField;
    ppField93: TppField;
    ppField94: TppField;
    ppField95: TppField;
    ppField96: TppField;
    ReportKhnsetG: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppShape10: TppShape;
    ppLabel180: TppLabel;
    LabelTitle20: TppLabel;
    LineTitle20: TppLine;
    ppLine382: TppLine;
    ppLabel192: TppLabel;
    CorpCode20: TppLabel;
    CorpName20: TppLabel;
    SVppDate20: TppSystemVariable;
    ppLine408: TppLine;
    ppLine424: TppLine;
    ppLine426: TppLine;
    ppLabel213: TppLabel;
    ppLine427: TppLine;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel217: TppLabel;
    ppDetailBand20: TppDetailBand;
    ppLine436: TppLine;
    ppLine437: TppLine;
    ppStandardUnderLine20: TppLine;
    DBTxt_KhnsetG_strHojCode: TppDBText;
    DBTxt_KhnsetG_strHojName: TppDBText;
    ppLine439: TppLine;
    DBTxt_KhnsetG_MaxDigit: TppDBText;
    ppLine441: TppLine;
    ppLine442: TppLine;
    DBTxt_KhnsetG_ItemID: TppDBText;
    DBTxt_KhnsetG_IDName: TppDBText;
    ppLine443: TppLine;
    ppLine444: TppLine;
    DBTxt_KhnsetG_ItemValue: TppDBText;
    ppFooterBand20: TppFooterBand;
    SVppPage20: TppSystemVariable;
    DBTxt_FuriGD_IraiAccName: TppDBText;
    ppLine367: TppLine;
    ppLine379: TppLine;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppLine390: TppLine;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLine391: TppLine;
    ppLine392: TppLine;
    ppLine393: TppLine;
    ppLine394: TppLine;
    ppLabel186: TppLabel;
    ppLine395: TppLine;
    ppLine396: TppLine;
    ppLabel188: TppLabel;
    ppLine389: TppLine;
    ppDBText133: TppDBText;
    ppDBText145: TppDBText;
    ppLine381: TppLine;
    ppLine385: TppLine;
    ppLine428: TppLine;
    ppLine435: TppLine;
    ppLine438: TppLine;
    ppLine440: TppLine;
    ppLine449: TppLine;
    PipelineOffsetTaxCodePrt: TppField;
    PipelineOffsetTaxRatePrt: TppField;

	constructor     CreateModule                (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy           (Sender: TObject);
    procedure       ppRepBeforePrint            (Sender: TObject);
    procedure       fnCmnBeforeGenerate         (Sender: TObject);
    procedure       CmnOffsetDBTextPrint        (Sender: TObject);              // <001>
    procedure       CmnPrjOffsetDBTextPrint     (Sender: TObject);              // <004>
    procedure       CmnPrjOffsetPrjCodePrint    (Sender: TObject);              // <004>
    procedure ReportProjectStartPage(Sender: TObject);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand9BeforePrint(Sender: TObject);
    procedure ppDetailBand9AfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand11BeforePrint(Sender: TObject);
    procedure ppDetailBand11AfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand5BeforePrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure ppDetailBand7AfterPrint(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand8AfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand6AfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand10BeforePrint(Sender: TObject);
    procedure ppDetailBand10AfterPrint(Sender: TObject);
//    procedure ppGroupFooterBand2BeforeGenerate(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec          :   ^TMjsAppRecord;
	m_pMDataModule  :   ^TMDataModulef;
	m_pCommonArea   :   ^rcCOMMONAREA;	    // 共通ｴﾘｱ
	MJSPrnDlgf	    :	TMJSPrnDlgf;		// 印刷ﾀﾞｲｱﾛｸﾞ
	PrnSupport      :	TMjsPrnSupport;		// 印刷設定
    mjspre		    :	TMjsPreviewIF;		// ﾌﾟﾚﾋﾞｭｰ
	uvSelSys        :   TJNTSelCorpSys;     // 会社ｼｽﾃﾑ情報
    uvHani		    :	TJNTHani;           //
    Owner           :   TComponent;

    m_cJNTArea      :   TJNTCommon;
    uvMD            :   TdxMemdata;

	m_iPayCodeCount     : Integer;			// 支払先カウンタ（１ページ中の支払先の数をカウントする）   <003> Add
	m_iPageLineCount	: Integer;			// 行数カウンタ（１ページ中の表の数をカウントする）         <003> Add

	procedure ppReport1FileOut          ();
    procedure fnInzPrint                ();

  public
    { Public 宣言 }
    JNTAuthority  :   TJNTAuthority;        // <AUT> ADD

	procedure DoPrint                   (Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea:TJNTCommon);
	function  fnIsPreview               (): Boolean;

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
  DmJNTCRP004007L: TDmJNTCRP004007L;

  giIndex       :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
  uvRepType     :   Integer;
  uvCSVFileName :   String;

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;


{$R *.DFM}

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
	pFrm    :   ^TDmJNTCRP004007L;
begin

	Result  :=  ACTID_RET_OK;

    case Mode of
        // ------------------------
        //      CreateModule
        // ------------------------
		0:
		begin
			new( pFrm );
			try
                // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^   :=  TDmJNTCRP004007L.CreateModule( AOwner,pRec );
                pFrm^.JNTAuthority := TJNTAuthority(ArHdl[0]^);     // <AUT> ADD
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetMD, PrtParam.CorpSys,PrtParam.JNTArea);
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
constructor TDmJNTCRP004007L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004007L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon);
var
    wRep    :   TppReport;
	i       :   Integer;
begin
	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;
    m_cJNTArea  := JNTArea;
    uvMD        := TargetMD;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

    wRep := nil;
    case uvHani.pvrPattern of
        // 支払先登録ﾘｽﾄ
        0:  begin
                wRep                    :=  CmnReportPay;                    
                dsMain.DataSet          :=  TargetMD;
                uvRepType               :=  0;
                uvCSVFileName           :=  '支払先登録';
            end;
        // 支払先方法登録ﾘｽﾄ(比率／定額)<001>
        1,2:begin
                wRep                    :=  ReportPayMethods;
                DSPayMethods.DataSet    :=  TargetMD;
                uvRepType               :=  1;
                if ( uvHani.pvrPattern = 1 ) then
                        uvCSVFileName   :=  '支払先方法登録(比率)'
                else    uvCSVFileName   :=  '支払先方法登録(定額)';
// <008> ADD-STR
                if ( uvHani.pvrPattern = 1 ) then
						LabelTitle1.Caption :=  '支払方法登録リスト(比率)'
				else    LabelTitle1.Caption :=  '支払方法登録リスト(定額)';
// <008> ADD-END
            end;
        // 振込支払情報登録／期日指定振込支払情報登録ﾘｽﾄ<001>
        3,4:begin
                wRep                    :=  ReportFurikomi;                    
                DSFurikomi.DataSet      :=  TargetMD;
                uvRepType               :=  2;
                if ( uvHani.pvrPattern = 3 ) then
                        uvCSVFileName   :=  '振込支払情報登録'
                else    uvCSVFileName   :=  '期日指定振込支払情報登録';
            end;
        // 手形情報登録ﾘｽﾄ<001>
        5:  begin
                wRep                    :=  ReportDraft;            
                DSDraftCheck.DataSet    :=  TargetMD;
                uvRepType               :=  3;
                uvCSVFileName           :=  '手形情報登録';
            end;
        // 小切手情報登録ﾘｽﾄ<001>
        6:  begin
                wRep                    :=  ReportCheck;                    
                DSDraftCheck.DataSet    :=  TargetMD;
                uvRepType               :=  4;
                uvCSVFileName           :=  '小切手情報登録';
            end;
        // 相殺情報登録ﾘｽﾄ<001>
        7:  begin
                wRep                    :=  ReportOffset;
                DSPrintOffset.DataSet   :=  TargetMD;
                uvRepType               :=  5;
                uvCSVFileName           :=  '相殺情報登録';
            end;
// <003> 2007/02/20 H.Kawato Add Start
        // 支払先登録ﾘｽﾄ
        8:  begin
                wRep                    :=  CmnReportPrjPay;
                dsMain.DataSet          :=  TargetMD;
                uvRepType               :=  6;
                uvCSVFileName           :=  '支払先登録';
            end;
        // 支払先方法登録ﾘｽﾄ(比率／定額)
        9,10:begin
                wRep                    :=  ReportPrjPayMethods;
                DSPayMethods.DataSet    :=  TargetMD;
                uvRepType               :=  7;
                if ( uvHani.pvrPattern = 9 ) then
                        uvCSVFileName   :=  '支払先方法登録(比率)'
                else    uvCSVFileName   :=  '支払先方法登録(定額)';
// <008> ADD-STR
                if ( uvHani.pvrPattern = 9 ) then
                        LabelTitle7.Caption   :=  '支払方法登録リスト(比率)'
                else    LabelTitle7.Caption   :=  '支払方法登録リスト(定額)';
// <008> ADD-END
            end;
        // 振込支払情報登録／期日指定振込支払情報登録ﾘｽﾄ
        11,12:begin
                wRep                    :=  ReportPrjFurikomi;
                DSFurikomi.DataSet      :=  TargetMD;
                uvRepType               :=  8;
                if ( uvHani.pvrPattern = 11 ) then
                        uvCSVFileName   :=  '振込支払情報登録'
                else    uvCSVFileName   :=  '期日指定振込支払情報登録';
            end;
        // 手形情報登録ﾘｽﾄ
        13:  begin
                wRep                    :=  ReportPrjDraft;
                DSDraftCheck.DataSet    :=  TargetMD;
                uvRepType               :=  9;
                uvCSVFileName           :=  '手形情報登録';
            end;
        // 小切手情報登録ﾘｽﾄ
        14:  begin
                wRep                    :=  ReportPrjCheck;
                DSDraftCheck.DataSet    :=  TargetMD;
                uvRepType               :=  10;
                uvCSVFileName           :=  '小切手情報登録';
            end;
        // 相殺情報登録ﾘｽﾄ
        15:  begin
                wRep                    :=  ReportPrjOffset;
                DSPrintOffset.DataSet   :=  TargetMD;
                uvRepType               :=  11;
                uvCSVFileName           :=  '相殺情報登録';
            end;
// <003> 2007/02/20 H.Kawato Add End
        // 外貨基本情報登録ﾘｽﾄ
        16:  begin
                wRep                    :=  ReportKihonG;
                dsMainG.DataSet         :=  TargetMD;
                uvRepType               :=  16;
                uvCSVFileName           :=  '外貨基本情報登録';
            end;
        // 電信送金
        17:begin
                wRep                    :=  ReportFurikomiGD;
                DSFurikomiGD.DataSet    :=  TargetMD;
                uvRepType               :=  17;
                uvCSVFileName           :=  '電信送金情報登録';
            end;

        // 為替手形
        18:begin
                wRep                    :=  ReportFurikomiGT;
                DSFurikomiGT.DataSet    :=  TargetMD;
                uvRepType               :=  18;
                uvCSVFileName           :=  '為替手形情報登録';
            end;

        // 送金小切手登録ﾘｽﾄ
        19:begin
                wRep                    :=  ReportFurikomiGK;
                DSFurikomiGK.DataSet    :=  TargetMD;
                uvRepType               :=  19;
                uvCSVFileName           :=  '送金小切手情報登録';
            end;

        // 可変項目登録ﾘｽﾄ
        20:  begin
                wRep                    :=  ReportKhnsetG;
                DSKhnsetG.DataSet       :=  TargetMD;
                uvRepType               :=  20;
                uvCSVFileName           :=  '可変項目登録';
            end;
    end;

    // 印刷初期化処理
    fnInzPrint;

	PrnSupport.ApRB				:=  wRep;
// <007> MOD-STR
//  PrnSupport.strDocName		:=  uvHani.pvrRepTitle;
    case uvHani.pvrPattern of
        0:      PrnSupport.strDocName := '支払先登録リスト（基本）';
        5, 13:  PrnSupport.strDocName := '手形支払情報登録リスト';
        6, 14:  PrnSupport.strDocName := '小切手支払情報登録リスト';
    else
        PrnSupport.strDocName		:=  uvHani.pvrRepTitle;
    end;
    PrnSupport.strDocName		:=  PrnSupport.strDocName + '[' + uvHani.pvrOrderNM + ']';
// <007> MOD-END

	PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    :=  m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    PrnSupport.pApRec           := m_pRec;		                // <GA002> ADD


    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
// <AUT> MOD-STR
//  if ( m_cJNTArea.IsExtract = FALSE )  then
    if (JNTAuthority.IsExtract = FALSE)  then
// <AUT> MOD-END
	    prnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

	if ( i > 0 ) then
	begin
    	// 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
    	if (mjspre.IsExistPreview) and
           (PrnSupport.iCommand = PDLG_PREVIEW) then
        begin
			MessageBeep(MB_OK);
			MjsMessageBox(Owner,'他のプログラムでプレビューが起動中です。', mjError, mjDefOk);
           Exit;
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
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE: ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppReport1FileOut();
var
    sTitle          :   TStringList;
    sMemFld         :   TStringList;
    ds              :   TDataSource;
    strPrjCode      :   String;         // <003> Add
    strPrjName      :   String;         // <003> Add
begin

    ds      :=  nil;
    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    case uvHani.pvrPattern of
        // 支払先登録ﾘｽﾄ
        0:
        begin
            ds  :=  dsMain;
            sTitle.Add('支払先ｺｰﾄﾞ'             );
            sTitle.Add('正式名称'               );
            sTitle.Add('簡略名称'               );
            sTitle.Add('連想'                   );
            sTitle.Add('査定方法'               );      // <002> 2006/08/08 H.Kawato Add
            sTitle.Add('査定金額計算区分'       );      // <006> 2007/12/25 H.Kawato Add
            sTitle.Add('査定金額計算値'         );      // <006> 2007/12/25 H.Kawato Add
            sTitle.Add('分解方法'               );
//            sTitle.Add('分解方法名称'           );    // <002> 2006/08/08 H.Kawato Del
//            sTitle.Add('通知書区分'             );    // <003> 2007/02/20 H.Kawato Del
//            sTitle.Add('通知書区分名称'         );    // <002> 2006/08/08 H.Kawato Del
            sTitle.Add('受取人名称'             );

            sMemFld.Add('strHojCode'            );
            sMemFld.Add('strName'               );
            sMemFld.Add('strNameSimple'         );
            sMemFld.Add('strAssociation'        );
            sMemFld.Add('strSatei'              );      // <002> 2006/08/08 H.Kawato Add
            sMemFld.Add('strSateiCalc'          );      // <006> 2007/12/25 H.Kawato Add
            sMemFld.Add('SateiCalcValue'        );      // <006> 2007/12/25 H.Kawato Add
//            sMemFld.Add('intApartNo'            );    // <002> 2006/08/08 H.Kawato Del
            sMemFld.Add('strApart'              );
//            sMemFld.Add('LetterKbn'             );    // <002> 2006/08/08 H.Kawato Del
//            sMemFld.Add('LetterName'            );    // <003> 2007/02/20 H.Kawatp Del
            sMemFld.Add('UketoriName'           );

        end;
        // 支払先方法ﾘｽﾄ(比率／定額)<001>
        1,2:
        begin
            ds  :=  DSPayMethods;
            sTitle.Add('支払先ｺｰﾄﾞ'	            );
//<011> mod st
//			sTitle.Add('支払先正式名称'         );
			sTitle.Add('支払先簡略名称'			);
//<011> mod end
			sTitle.Add('分解方法'	            );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
// <009> Add
			// 優先支払詳細
			sTitle.Add('優先支払'               );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
// <009> Add

			sMemFld.Add('GCode'                 );
			sMemFld.Add('SimpleName'	        );
			sMemFld.Add('BunkaiName'            );
			sMemFld.Add('HouhouNo1'             );
			sMemFld.Add('HouhouName1'           );
			sMemFld.Add('StdRitu1'              );
			sMemFld.Add('MinKin1'               );
			sMemFld.Add('HasuuKin1'             );
			sMemFld.Add('HasuuHou1'             );
			sMemFld.Add('HouhouNo2'             );
			sMemFld.Add('HouhouName2'           );
			sMemFld.Add('StdRitu2'              );
			sMemFld.Add('MinKin2'               );
			sMemFld.Add('HasuuKin2'             );
			sMemFld.Add('HasuuHou2'             );
			sMemFld.Add('HouhouNo3'             );
			sMemFld.Add('HouhouName3'           );
			sMemFld.Add('StdRitu3'              );
			sMemFld.Add('MinKin3'               );
			sMemFld.Add('HasuuKin3'             );
			sMemFld.Add('HasuuHou3'             );
			sMemFld.Add('HouhouNo4'             );
			sMemFld.Add('HouhouName4'           );
			sMemFld.Add('StdRitu4'              );
			sMemFld.Add('MinKin4'               );
			sMemFld.Add('HasuuKin4'             );
			sMemFld.Add('HasuuHou4'             );
			sMemFld.Add('HouhouNo5'             );
			sMemFld.Add('HouhouName5'           );
			sMemFld.Add('StdRitu5'              );
			sMemFld.Add('MinKin5'               );
			sMemFld.Add('HasuuKin5'             );
			sMemFld.Add('HasuuHou5'             );
// <009> Add
			// 優先支払詳細
			sMemFld.Add('PriPayWayName'         );
			sMemFld.Add('PriPayWayNo1'          );
			sMemFld.Add('PriPayWayBaseKingaku1' );
			sMemFld.Add('PriPayWayBaseHiritu1'  );
			sMemFld.Add('PriPayWayHasuuKin1'    );
			sMemFld.Add('PriPayWayHasuuDesc1'   );
			sMemFld.Add('PriPayWaySite1'        );
			sMemFld.Add('PriPayWayNo2'          );
			sMemFld.Add('PriPayWayBaseKingaku2' );
			sMemFld.Add('PriPayWayBaseHiritu2'  );
			sMemFld.Add('PriPayWayHasuuKin2'    );
			sMemFld.Add('PriPayWayHasuuDesc2'   );
			sMemFld.Add('PriPayWaySite2'        );
			sMemFld.Add('PriPayWayNo3'          );
			sMemFld.Add('PriPayWayBaseKingaku3' );
			sMemFld.Add('PriPayWayBaseHiritu3'  );
			sMemFld.Add('PriPayWayHasuuKin3'    );
			sMemFld.Add('PriPayWayHasuuDesc3'   );
			sMemFld.Add('PriPayWaySite3'        );
			sMemFld.Add('PriPayWayNo4'          );
			sMemFld.Add('PriPayWayBaseKingaku4' );
			sMemFld.Add('PriPayWayBaseHiritu4'  );
			sMemFld.Add('PriPayWayHasuuKin4'    );
			sMemFld.Add('PriPayWayHasuuDesc4'   );
			sMemFld.Add('PriPayWaySite4'        );
			sMemFld.Add('PriPayWayNo5'          );
			sMemFld.Add('PriPayWayBaseKingaku5' );
			sMemFld.Add('PriPayWayBaseHiritu5'  );
			sMemFld.Add('PriPayWayHasuuKin5'    );
			sMemFld.Add('PriPayWayHasuuDesc5'   );
			sMemFld.Add('PriPayWaySite5'        );
// <009> Add
        end;
        // 振込支払情報登録／期日指定振込支払情報登録ﾘｽﾄ<001>
        3,4:
        begin
            ds  :=  DSFurikomi;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
//<011> mod st
//			sTitle.Add('支払先正式名称'	        );
			sTitle.Add('支払先簡略名称'	     	);
//<011> mod end
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
// <003> 2007/02/20 H.Kawato Mod
//			sTitle.Add('預金種別'      	        );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('全銀協ｺｰﾄﾞ'      	    );
			sTitle.Add('支店ｺｰﾄﾞ'     		    );
			sTitle.Add('銀行名称'        	    );
			sTitle.Add('支店名称'        	    );
			sTitle.Add('銀行名(ｶﾅ)'      	    );
			sTitle.Add('支店名(ｶﾅ)'      	    );
			sTitle.Add('振込先(ｶﾅ)'      	    );
// <003> 2007/02/20 H.Kawato Mod
//			sTitle.Add('預金種別'       	    );
			sTitle.Add('預金種目'       	    );
			sTitle.Add('口座番号'       	    );
			sTitle.Add('手数料負担区分' 	    );
			sTitle.Add('手数料計算区分'  	    );
			sTitle.Add('振込方法'        	    );
			if ( uvHani.pvrPattern = 4 ) then
				sTitle.Add('振込ｻｲﾄ'      	    );
			sTitle.Add('FBｾｯﾄ区分'       	    );
			sTitle.Add('EDI情報'         	    );
			sTitle.Add('顧客ｺｰﾄﾞA'       	    );
			sTitle.Add('顧客ｺｰﾄﾞB'       	    );
// <002> 2006/08/08 H.Kawato Add Start
			if ( uvHani.pvrPattern = 3 ) then
            begin
				sTitle.Add('口座自動引落区分'   );
				sTitle.Add('引落支払データ'     );
            end;
// <002> 2006/08/08 H.Kawato Add End

			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
			sMemFld.Add('IraiAccNo'		        );
			sMemFld.Add('IraiAccName'		    );
			sMemFld.Add('ShiAccKbnName'	        );
			sMemFld.Add('ShiAccNo'		        );
			sMemFld.Add('BankCode'		        );
			sMemFld.Add('BkBraCode'	    	    );
			sMemFld.Add('BankName'		        );
			sMemFld.Add('BkBraName'		        );
			sMemFld.Add('BankKanaName'	        );
			sMemFld.Add('BraKanaName'		    );
			sMemFld.Add('TransKanaName'	        );
			sMemFld.Add('HuriAccKbnName'	    );
			sMemFld.Add('HuriAccKbnNo'	        );
			sMemFld.Add('ChargeFutanName'	    );
			sMemFld.Add('ChargeKbnName'	        );
			sMemFld.Add('TransKbn'		        );
			if ( uvHani.pvrPattern = 4 ) then
				sMemFld.Add('Site'      	    );
			sMemFld.Add('FBSetName'		        );
			sMemFld.Add('EdiInfo'			    );
			sMemFld.Add('AiteNo1'			    );
			sMemFld.Add('AiteNo2'			    );
// <002> 2006/08/08 H.Kawato Add Start
			if ( uvHani.pvrPattern = 3 ) then
            begin
				sMemFld.Add('AutoKbnData'  	    );
				sMemFld.Add('AccAutoData'  	    );
            end;
// <002> 2006/08/08 H.Kawato Add End
        end;
        // 手形情報登録ﾘｽﾄ<001>
        5:
        begin
            ds  :=  DSDraftCheck;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称'		        );
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
// <003> 2007/02/20 H.Kawato Mod
//			sTitle.Add('預金種別'      	        );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('サイト'   		   	    );
			sTitle.Add('分割枚数'     		    );
// <010> MOD-STR
//			sTitle.Add('小切手郵送区分'         );
			sTitle.Add('手形郵送区分'           );
// <010> MOD-END
			sTitle.Add('郵送料負担区分'         );
// <010> ADD-STR
			sTitle.Add('電子債権採用区分'       );
			sTitle.Add('全銀協ｺｰﾄﾞ'      	    );
			sTitle.Add('支店ｺｰﾄﾞ'     		    );
			sTitle.Add('銀行名称'        	    );
			sTitle.Add('支店名称'        	    );
			sTitle.Add('銀行名(ｶﾅ)'      	    );
			sTitle.Add('支店名(ｶﾅ)'      	    );
			sTitle.Add('振込先(ｶﾅ)'      	    );
			sTitle.Add('預金種目'       	    );
			sTitle.Add('口座番号'       	    );
			sTitle.Add('手数料負担区分' 	    );
			sTitle.Add('手数料計算区分'  	    );  //<203>
			sTitle.Add('フリー項目1' 	        );
			sTitle.Add('フリー項目2' 	        );
			sTitle.Add('フリー項目3' 	        );
			sTitle.Add('フリー項目4' 	        );
			sTitle.Add('フリー項目5' 	        );
// <010> ADD-END

			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
			sMemFld.Add('IraiAccNo'   	        );
			sMemFld.Add('IraiAccName'           );
			sMemFld.Add('AccName'			    );
			sMemFld.Add('AccNo'			        );
			sMemFld.Add('Site'			        );
			sMemFld.Add('TegBunkatuMax'	        );
			sMemFld.Add('TegYusoName' 	        );
			sMemFld.Add('TegYusoFutanName'      );
// <010> ADD-STR
			sMemFld.Add('ERKbnName'	            );
			sMemFld.Add('BankCode'		        );
			sMemFld.Add('BkBraCode'	    	    );
			sMemFld.Add('BankName'		        );
			sMemFld.Add('BkBraName'		        );
			sMemFld.Add('BankKanaName'	        );
			sMemFld.Add('BraKanaName'		    );
			sMemFld.Add('TransKanaName'	        );
			sMemFld.Add('HuriAccKbnName'	    );
			sMemFld.Add('HuriAccKbnNo'	        );
			sMemFld.Add('ChargeFutanName'	    );
			sMemFld.Add('ChargeKbnName'	        );  //<203>
			sMemFld.Add('VFree1'	            );
			sMemFld.Add('VFree2'	            );
			sMemFld.Add('VFree3'	            );
			sMemFld.Add('VFree4'	            );
			sMemFld.Add('VFree5'	            );
// <010> ADD-END
        end;
        // 小切手情報登録ﾘｽﾄ<001>
        6:
        begin
            ds  :=  DSDraftCheck;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称'		        );
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
// <003> 2007/02/20 H.Kawato Mod
//			sTitle.Add('預金種別'      	        );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('小切手郵送区分'         );
			sTitle.Add('郵送料負担区分'         );

			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
			sMemFld.Add('IraiAccNo'   	        );
			sMemFld.Add('IraiAccName'           );
			sMemFld.Add('AccName'			    );
			sMemFld.Add('AccNo'			        );
			sMemFld.Add('TegYusoName' 	        );
			sMemFld.Add('TegYusoFutanName'      );
        end;
        // 相殺情報登録ﾘｽﾄ<001>
        7:
        begin
            ds  :=  DSPrintOffset;
            sTitle.Add('支払先ｺｰﾄﾞ'	            );
			sTitle.Add('支払先名称'	            );
			sTitle.Add('№'                     );
			sTitle.Add('科目ｺｰﾄﾞ'               );
			sTitle.Add('科目名称'               );
			sTitle.Add('補助ｺｰﾄﾞ1'              );
			sTitle.Add('補助名称1'              );
			sTitle.Add('補助ｺｰﾄﾞ2'              );
			sTitle.Add('補助名称2'              );
			sTitle.Add('補助ｺｰﾄﾞ3'              );
			sTitle.Add('補助名称3'              );
			sTitle.Add('消費税ｺｰﾄﾞ'             );
			sTitle.Add('消費税率'               );
			sTitle.Add('相殺金額'               );
// <#TAX10> ADD-STR
			sTitle.Add('税率区分'				);
// <#TAX10> ADD-END

			sMemFld.Add('GCode'		            );
			sMemFld.Add('SimpleName'	        );
			sMemFld.Add('SousaiNo'              );
			sMemFld.Add('KmCD'      	        );
			sMemFld.Add('KmCDName'	            );
			sMemFld.Add('HojCD01'		        );
			sMemFld.Add('HojCDName01'           );
			sMemFld.Add('HojCD02'		        );
			sMemFld.Add('HojCDName02'           );
			sMemFld.Add('HojCD03'		        );
			sMemFld.Add('HojCDName03'           );
			sMemFld.Add('TaxCD'      	        );
// <#TAX10> MOD-STR
//			sMemFld.Add('TaxRate'               );
			sMemFld.Add('TaxRateDesc'           );
// <#TAX10> MOD-END
			sMemFld.Add('SousaiKin'             );
// <#TAX10> ADD-STR
			sMemFld.Add('TaxCodeMark'			);
// <#TAX10> ADD-END
        end;
// <003> 2007/02/20 H.Kawato Add Start
        // 支払先登録ﾘｽﾄ
        8:
        begin
            ds  :=  dsMain;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'             );
            sTitle.Add('正式名称'               );
            sTitle.Add('簡略名称'               );
            sTitle.Add('連想'                   );
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
            sTitle.Add('査定方法'               );
            sTitle.Add('査定金額計算区分'       );      // <006> 2007/12/25 H.Kawato Add
            sTitle.Add('査定金額計算値'         );      // <006> 2007/12/25 H.Kawato Add
            sTitle.Add('分解方法'               );
            sTitle.Add('分解パターン'           );
            sTitle.Add('受取人名称'             );
            sMemFld.Add('strHojCode'            );
            sMemFld.Add('strName'               );
            sMemFld.Add('strNameSimple'         );
            sMemFld.Add('strAssociation'        );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
            sMemFld.Add('strSatei'              );
            sMemFld.Add('strSateiCalc'          );      // <006> 2007/12/25 H.Kawato Add
            sMemFld.Add('SateiCalcValue'        );      // <006> 2007/12/25 H.Kawato Add
            sMemFld.Add('strApart'              );
            sMemFld.Add('BunkaiPtnName'         );
            sMemFld.Add('UketoriName'           );
        end;
        // 支払先方法ﾘｽﾄ(比率／定額)
        9,10:
        begin
            ds  :=  DSPayMethods;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'	            );
//<011> mod st
//			sTitle.Add('支払先正式名称'         );
			sTitle.Add('支払先簡略名称'    	    );
//<011> mod end
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
			sTitle.Add('分解方法'	            );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('№'                     );
			sTitle.Add('支払方法'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('支払最低額'	            );
			sTitle.Add('端数処理額'             );
			sTitle.Add('端数処理方法'           );
// 優先支払詳細 St
// <009> Mod
//			sTitle.Add('手形優先'               );
			sTitle.Add('優先支払'               );
// <009> Mod
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
			sTitle.Add('№'                     );
			sTitle.Add('基準金額'	            );
			sTitle.Add('分解基準値'             );
			sTitle.Add('端数処理額'	            );
			sTitle.Add('端数処理方法'           );
			sTitle.Add('サイト'                 );
// 優先支払詳細 Ed
			sMemFld.Add('GCode'                 );
			sMemFld.Add('SimpleName'	        );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
			sMemFld.Add('BunkaiName'            );
			sMemFld.Add('HouhouNo1'             );
			sMemFld.Add('HouhouName1'           );
			sMemFld.Add('StdRitu1'              );
			sMemFld.Add('MinKin1'               );
			sMemFld.Add('HasuuKin1'             );
			sMemFld.Add('HasuuHou1'             );
			sMemFld.Add('HouhouNo2'             );
			sMemFld.Add('HouhouName2'           );
			sMemFld.Add('StdRitu2'              );
			sMemFld.Add('MinKin2'               );
			sMemFld.Add('HasuuKin2'             );
			sMemFld.Add('HasuuHou2'             );
			sMemFld.Add('HouhouNo3'             );
			sMemFld.Add('HouhouName3'           );
			sMemFld.Add('StdRitu3'              );
			sMemFld.Add('MinKin3'               );
			sMemFld.Add('HasuuKin3'             );
			sMemFld.Add('HasuuHou3'             );
			sMemFld.Add('HouhouNo4'             );
			sMemFld.Add('HouhouName4'           );
			sMemFld.Add('StdRitu4'              );
			sMemFld.Add('MinKin4'               );
			sMemFld.Add('HasuuKin4'             );
			sMemFld.Add('HasuuHou4'             );
			sMemFld.Add('HouhouNo5'             );
			sMemFld.Add('HouhouName5'           );
			sMemFld.Add('StdRitu5'              );
			sMemFld.Add('MinKin5'               );
			sMemFld.Add('HasuuKin5'             );
			sMemFld.Add('HasuuHou5'             );
// 優先支払詳細 St
			sMemFld.Add('PriPayWayName'         );
			sMemFld.Add('PriPayWayNo1'          );
			sMemFld.Add('PriPayWayBaseKingaku1' );
			sMemFld.Add('PriPayWayBaseHiritu1'  );
			sMemFld.Add('PriPayWayHasuuKin1'    );
			sMemFld.Add('PriPayWayHasuuDesc1'   );
			sMemFld.Add('PriPayWaySite1'        );
			sMemFld.Add('PriPayWayNo2'          );
			sMemFld.Add('PriPayWayBaseKingaku2' );
			sMemFld.Add('PriPayWayBaseHiritu2'  );
			sMemFld.Add('PriPayWayHasuuKin2'    );
			sMemFld.Add('PriPayWayHasuuDesc2'   );
			sMemFld.Add('PriPayWaySite2'        );
			sMemFld.Add('PriPayWayNo3'          );
			sMemFld.Add('PriPayWayBaseKingaku3' );
			sMemFld.Add('PriPayWayBaseHiritu3'  );
			sMemFld.Add('PriPayWayHasuuKin3'    );
			sMemFld.Add('PriPayWayHasuuDesc3'   );
			sMemFld.Add('PriPayWaySite3'        );
			sMemFld.Add('PriPayWayNo4'          );
			sMemFld.Add('PriPayWayBaseKingaku4' );
			sMemFld.Add('PriPayWayBaseHiritu4'  );
			sMemFld.Add('PriPayWayHasuuKin4'    );
			sMemFld.Add('PriPayWayHasuuDesc4'   );
			sMemFld.Add('PriPayWaySite4'        );
			sMemFld.Add('PriPayWayNo5'          );
			sMemFld.Add('PriPayWayBaseKingaku5' );
			sMemFld.Add('PriPayWayBaseHiritu5'  );
			sMemFld.Add('PriPayWayHasuuKin5'    );
			sMemFld.Add('PriPayWayHasuuDesc5'   );
			sMemFld.Add('PriPayWaySite5'        );
// 優先支払詳細 Ed
        end;
        // 振込支払情報登録／期日指定振込支払情報登録ﾘｽﾄ
        11,12:
        begin
            ds  :=  DSFurikomi;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
//<011> mod st
//			sTitle.Add('支払先正式名称'	        );
			sTitle.Add('支払先簡略名称'	        );
//<011> mod end
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('全銀協ｺｰﾄﾞ'      	    );
			sTitle.Add('支店ｺｰﾄﾞ'     		    );
			sTitle.Add('銀行名称'        	    );
			sTitle.Add('支店名称'        	    );
			sTitle.Add('銀行名(ｶﾅ)'      	    );
			sTitle.Add('支店名(ｶﾅ)'      	    );
			sTitle.Add('振込先(ｶﾅ)'      	    );
			sTitle.Add('預金種目'       	    );
			sTitle.Add('口座番号'       	    );
			sTitle.Add('手数料負担区分' 	    );
			sTitle.Add('手数料計算区分'  	    );
			sTitle.Add('振込方法'        	    );
			if ( uvHani.pvrPattern = 12 ) then
				sTitle.Add('振込ｻｲﾄ'      	    );
			sTitle.Add('FBｾｯﾄ区分'       	    );
			sTitle.Add('EDI情報'         	    );
			sTitle.Add('顧客ｺｰﾄﾞA'       	    );
			sTitle.Add('顧客ｺｰﾄﾞB'       	    );
			if ( uvHani.pvrPattern = 11 ) then
            begin
				sTitle.Add('口座自動引落区分'   );
				sTitle.Add('引落支払データ'     );
            end;
			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
			sMemFld.Add('IraiAccNo'		        );
			sMemFld.Add('IraiAccName'		    );
			sMemFld.Add('ShiAccKbnName'	        );
			sMemFld.Add('ShiAccNo'		        );
			sMemFld.Add('BankCode'		        );
			sMemFld.Add('BkBraCode'	    	    );
			sMemFld.Add('BankName'		        );
			sMemFld.Add('BkBraName'		        );
			sMemFld.Add('BankKanaName'	        );
			sMemFld.Add('BraKanaName'		    );
			sMemFld.Add('TransKanaName'	        );
			sMemFld.Add('HuriAccKbnName'	    );
			sMemFld.Add('HuriAccKbnNo'	        );
			sMemFld.Add('ChargeFutanName'	    );
			sMemFld.Add('ChargeKbnName'	        );
			sMemFld.Add('TransKbn'		        );
			if ( uvHani.pvrPattern = 12 ) then
				sMemFld.Add('Site'      	    );
			sMemFld.Add('FBSetName'		        );
			sMemFld.Add('EdiInfo'			    );
			sMemFld.Add('AiteNo1'			    );
			sMemFld.Add('AiteNo2'			    );
			if ( uvHani.pvrPattern = 11 ) then
            begin
				sMemFld.Add('AutoKbnData'  	    );
				sMemFld.Add('AccAutoData'  	    );
            end;
        end;
        // 手形情報登録ﾘｽﾄ
        13:
        begin
            ds  :=  DSDraftCheck;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称'		        );
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('サイト'   		   	    );
			sTitle.Add('分割枚数'     		    );
			sTitle.Add('小切手郵送区分'         );
			sTitle.Add('郵送料負担区分'         );
			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
			sMemFld.Add('IraiAccNo'   	        );
			sMemFld.Add('IraiAccName'           );
			sMemFld.Add('AccName'			    );
			sMemFld.Add('AccNo'			        );
			sMemFld.Add('Site'			        );
			sMemFld.Add('TegBunkatuMax'	        );
			sMemFld.Add('TegYusoName' 	        );
			sMemFld.Add('TegYusoFutanName'      );
        end;
        // 小切手情報登録ﾘｽﾄ
        14:
        begin
            ds  :=  DSDraftCheck;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称'		        );
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
			sTitle.Add('振込依頼口座ｺｰﾄﾞ'       );
			sTitle.Add('振込依頼口座名称'       );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('小切手郵送区分'         );
			sTitle.Add('郵送料負担区分'         );
			sMemFld.Add('GCode'			        );
			sMemFld.Add('SimpleName'		    );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
			sMemFld.Add('IraiAccNo'   	        );
			sMemFld.Add('IraiAccName'           );
			sMemFld.Add('AccName'			    );
			sMemFld.Add('AccNo'			        );
			sMemFld.Add('TegYusoName' 	        );
			sMemFld.Add('TegYusoFutanName'      );
        end;
        // 相殺情報登録ﾘｽﾄ
        15:
        begin
            ds  :=  DSPrintOffset;
            strPrjCode      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + 'ｺｰﾄﾞ';
            strPrjName      := ds.DataSet.FieldByName ('PrjHojyoName').AsString + '名称';
            sTitle.Add('支払先ｺｰﾄﾞ'	            );
			sTitle.Add('支払先名称'	            );
            sTitle.Add(strPrjCode               );
            sTitle.Add(strPrjName               );
			sTitle.Add('№'                     );
			sTitle.Add('科目ｺｰﾄﾞ'               );
			sTitle.Add('科目名称'               );
			sTitle.Add('補助ｺｰﾄﾞ1'              );
			sTitle.Add('補助名称1'              );
			sTitle.Add('補助ｺｰﾄﾞ2'              );
			sTitle.Add('補助名称2'              );
			sTitle.Add('補助ｺｰﾄﾞ3'              );
			sTitle.Add('補助名称3'              );
			sTitle.Add('消費税ｺｰﾄﾞ'             );
			sTitle.Add('消費税率'               );
			sTitle.Add('相殺金額'               );
// <#TAX10> ADD-STR
			sTitle.Add('税率区分'				);
// <#TAX10> ADD-END
			sMemFld.Add('GCode'		            );
			sMemFld.Add('SimpleName'	        );
            sMemFld.Add('PrjGCode'              );
            sMemFld.Add('PrjName'               );
			sMemFld.Add('SousaiNo'              );
			sMemFld.Add('KmCD'      	        );
			sMemFld.Add('KmCDName'	            );
			sMemFld.Add('HojCD01'		        );
			sMemFld.Add('HojCDName01'           );
			sMemFld.Add('HojCD02'		        );
			sMemFld.Add('HojCDName02'           );
			sMemFld.Add('HojCD03'		        );
			sMemFld.Add('HojCDName03'           );
			sMemFld.Add('TaxCD'      	        );
			sMemFld.Add('TaxRate'               );
			sMemFld.Add('SousaiKin'             );
// <#TAX10> ADD-STR
			sMemFld.Add('TaxCodeMark'			);
// <#TAX10> ADD-END
        end;
// <003> 2007/02/20 H.Kawato Add End
//<GA001>
        //外貨基本情報登録
        16:
        begin
            ds  :=  dsMainG;
            sTitle.Add('支払先ｺｰﾄﾞ'             );
            sTitle.Add('支払先名'               );
            sTitle.Add('連想'                   );
            sTitle.Add('採用区分'               );
            sTitle.Add('標準支払方法'           );
            sMemFld.Add('strHojCode'            );
            sMemFld.Add('strNameSimple'         );
            sMemFld.Add('strAssociation'        );
            sMemFld.Add('strGaiKbn'             );
            sMemFld.Add('strGaiPay'             );
        end;
        //電信送金情報登録
        17:
        begin
            ds  :=  DSFurikomiGD;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称' 	        );
			sTitle.Add('依頼口座ｺｰﾄﾞ'           );
			sTitle.Add('依頼口座名称'           );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('手数料依頼口座ｺｰﾄﾞ'     );
			sTitle.Add('手数料依頼口座名称'     );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('手数料負担区分' 	    );
			sTitle.Add('手数料計算区分'  	    );
			sTitle.Add('取引先照会番号'    	    );
			sTitle.Add('送金目的No'       	    );
			sTitle.Add('送金目的'       	    );
			sTitle.Add('送金許可'               );
			sTitle.Add('送金許可日付'      	    );

			sMemFld.Add('HojCode' 		        );
			sMemFld.Add('SName'	        	    );
			sMemFld.Add('IraiAccNo'		        );
			sMemFld.Add('IraiAccName'		    );
			sMemFld.Add('ShiAccKbnName'	        );
			sMemFld.Add('ShiAccNo'		        );
			sMemFld.Add('IraiFeeAccNo'		    );
			sMemFld.Add('IraiFeeAccName'	    );
			sMemFld.Add('ShiFeeAccKbnName'	    );
			sMemFld.Add('ShiFeeAccNo'		    );
			sMemFld.Add('ChargeName'    	    );
			sMemFld.Add('ChargeKbnName'	        );
			sMemFld.Add('EdiInfo'			    );
			sMemFld.Add('SendNo'			    );
			sMemFld.Add('SendPos'			    );
			sMemFld.Add('SendLNO'			    );
			sMemFld.Add('SendDate_S'		    );
        end;
        //為替手形
        18:
        begin
            ds  :=  DSFurikomiGT;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称' 	        );
			sTitle.Add('支払口座ｺｰﾄﾞ'       );
			sTitle.Add('支払口座名称'       );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );

			sMemFld.Add('HojCode'		        );
			sMemFld.Add('SName'	        	    );
			sMemFld.Add('IraiAccNo'		        );
			sMemFld.Add('IraiAccName'		    );
			sMemFld.Add('ShiAccKbnName'	        );
			sMemFld.Add('ShiAccNo'		        );
        end;
        //送金小切手
        19:
        begin
            ds  :=  DSFurikomiGK;
            sTitle.Add('支払先ｺｰﾄﾞ'		        );
			sTitle.Add('支払先名称' 	        );
			sTitle.Add('依頼口座ｺｰﾄﾞ'           );
			sTitle.Add('依頼口座名称'           );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('手数料依頼口座ｺｰﾄﾞ'     );
			sTitle.Add('手数料依頼口座名称'     );
			sTitle.Add('預金種目'      	        );
			sTitle.Add('口座番号'     		    );
			sTitle.Add('送金目的No'       	    );
			sTitle.Add('送金目的'       	    );
			sTitle.Add('送金許可'               );
			sTitle.Add('送金許可日付'           );

			sMemFld.Add('HojCode'		        );
			sMemFld.Add('SName'	        	    );
			sMemFld.Add('IraiAccNo'		        );
			sMemFld.Add('IraiAccName'		    );
			sMemFld.Add('ShiAccKbnName'	        );
			sMemFld.Add('ShiAccNo'		        );
			sMemFld.Add('IraiFeeAccNo'		    );
			sMemFld.Add('IraiFeeAccName'	    );
			sMemFld.Add('ShiFeeAccKbnName'	    );
			sMemFld.Add('ShiFeeAccNo'		    );
			sMemFld.Add('SendNo'			    );
			sMemFld.Add('SendPos'			    );
			sMemFld.Add('SendLNO'			    );
			sMemFld.Add('SendDate_S'    	    );
        end;
        // 可変情報登録ﾘｽﾄ
        20:
        begin
            ds  :=  DSKhnsetG;
            sTitle.Add('支払先ｺｰﾄﾞ'	            );
			sTitle.Add('支払先名称'	            );
			sTitle.Add('ID'                     );
			sTitle.Add('項目名'                 );
			sTitle.Add('桁数'                   );
			sTitle.Add('内容'                   );
			sMemFld.Add('strHojCode'            );
			sMemFld.Add('strHojName'	        );
			sMemFld.Add('ItemID'                );
			sMemFld.Add('IDName'                );
			sMemFld.Add('MaxDigit'    	        );
			sMemFld.Add('ItemValue'	            );
        end;
//<GA001>
    end;

    if ( MjsFileOut(ds.DataSet, sMemFld, sTitle, PrnSupport, m_pRec) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free;
    sMemFld.Free;

end;

//------------------------------------------------------------------------------
// プレビューの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004007L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure  TDmJNTCRP004007L.fnInzPrint();
var                                  
    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;
    sFormat	            :   String;
begin

	// 支払先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
    begin
        case uvHani.pvrPattern of
            0:      DBTxt_Base_GCode         .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            1,2:    DBTxt_PayMethods_GCode   .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<001>
            3,4:    DBTxt_Furikomi_GCode     .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<001>
            5:      DBTxt_Draft_GCode        .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<001>
            6:      DBTxt_Check_GCode        .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<001>
            7:      DBTxt_Offset_GCode       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<001>
            8:      DBTxt_PrjBase_GCode      .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
            9,10:   DBTxt_PrjPayMethods_GCode.Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
            11,12:  DBTxt_PrjFurikomi_GCode  .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
            13:     DBTxt_PrjDraft_GCode     .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
            14:     DBTxt_PrjCheck_GCode     .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
            15:     DBTxt_PrjOffset_GCode    .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)<003>
//<GA001>
            16:     DBTxt_KihonG_GCode       .Alignment  :=  taLeftJustify;
            17:     DBTxt_FuriGD_HojCode     .Alignment  :=  taLeftJustify;
            18:     DBTxt_FuriGT_HojCode     .Alignment  :=  taLeftJustify;
            19:     DBTxt_FuriGK_HojCode     .Alignment  :=  taLeftJustify;
            20:     DBTxt_KhnsetG_strHojCode .Alignment  :=  taLeftJustify;
//<GA001>

        end;
   	end
    else
    begin
        case uvHani.pvrPattern of
    	    0:      DBTxt_Base_GCode         .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            1,2:    DBTxt_PayMethods_GCode   .Alignment  :=  taRightJustify; // 右寄せ(数値属性)<001>
            3,4:    DBTxt_Furikomi_GCode     .Alignment  :=  taRightJustify; // 右寄せ(数値属性)<001>
            5:      DBTxt_Draft_GCode        .Alignment  :=  taRightJustify; // 右寄せ(数値属性)<001>
            6:      DBTxt_Check_GCode        .Alignment  :=  taRightJustify; // 右寄せ(数値属性)<001>
            7:      DBTxt_Offset_GCode       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)<001>
            8:      DBTxt_PrjBase_GCode      .Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
            9,10:   DBTxt_PrjPayMethods_GCode.Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
            11,12:  DBTxt_PrjFurikomi_GCode  .Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
            13:     DBTxt_PrjDraft_GCode     .Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
            14:     DBTxt_PrjCheck_GCode     .Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
            15:     DBTxt_PrjOffset_GCode    .Alignment  :=  taRightJustify; // 左寄せ(文字属性)<003>
//<GA001>
            16:     DBTxt_KihonG_GCode       .Alignment  :=  taRightJustify;
            17:     DBTxt_FuriGD_HojCode     .Alignment  :=  taRightJustify;
            18:     DBTxt_FuriGT_HojCode     .Alignment  :=  taRightJustify;
            19:     DBTxt_FuriGK_HojCode     .Alignment  :=  taRightJustify;
            20:     DBTxt_KhnsetG_strHojCode .Alignment  :=  taRightJustify;
//<GA001>
        end;
    end;

    if ( uvHani.pvrPattern in [1,2] ) then  // <001>
    begin
        case uvHani.pvrPattern of
            1:  sFormat := '0.00';
            2:  sFormat := '#,0';
        end;

		ppDBtxtStdRitu1.DisplayFormat := sFormat;
		ppDBtxtStdRitu2.DisplayFormat := sFormat;
		ppDBtxtStdRitu3.DisplayFormat := sFormat;
		ppDBtxtStdRitu4.DisplayFormat := sFormat;
		ppDBtxtStdRitu5.DisplayFormat := sFormat;
//<009> Add
        ppDBtxtBaseHiritu1.DisplayFormat := sFormat;
        ppDBtxtBaseHiritu2.DisplayFormat := sFormat;
        ppDBtxtBaseHiritu3.DisplayFormat := sFormat;
        ppDBtxtBaseHiritu4.DisplayFormat := sFormat;
        ppDBtxtBaseHiritu5.DisplayFormat := sFormat;
//<009> Add
    end
    else if ( uvHani.pvrPattern in [3,4] ) then // <001>
    begin
        case uvHani.pvrPattern of
            3:
            begin
                LabelTitle2.Caption :=  '振込支払情報登録リスト';
				LabelWay.Caption    :=  '振込方法';
				DBTextTransKbn_F.Visible := TRUE;
				DBTextTransKbn_D.Visible := FALSE;
				DBTextSite_D.Visible	 := FALSE;
				LabelSite.Visible		 := FALSE;
            end;
            4:
            begin
                LabelTitle2.Caption :=  '期日指定振込支払情報登録リスト';
                LabelWay.Caption    :=  '振込方法 振込ｻｲﾄ';
                DBTextTransKbn_F.Visible := FALSE;
                DBTextTransKbn_D.Visible := TRUE;
                DBTextSite_D.Visible	 := TRUE;
                LabelSite.Visible		 := TRUE;
            end;
        end;
// <003> 2007/02/20 H.Kawato Add Start
    end
    else if ( uvHani.pvrPattern in [9,10] ) then
    begin
        case uvHani.pvrPattern of
            9 : sFormat := '0.00';
            10: sFormat := '#,0';
        end;

		ppDBtxtPrjStdRitu1.DisplayFormat := sFormat;
		ppDBtxtPrjStdRitu2.DisplayFormat := sFormat;
		ppDBtxtPrjStdRitu3.DisplayFormat := sFormat;
		ppDBtxtPrjStdRitu4.DisplayFormat := sFormat;
		ppDBtxtPrjStdRitu5.DisplayFormat := sFormat;

        ppDBtxtPrjBaseHiritu1.DisplayFormat := sFormat;
        ppDBtxtPrjBaseHiritu2.DisplayFormat := sFormat;
        ppDBtxtPrjBaseHiritu3.DisplayFormat := sFormat;
        ppDBtxtPrjBaseHiritu4.DisplayFormat := sFormat;
        ppDBtxtPrjBaseHiritu5.DisplayFormat := sFormat;
    end
    else if ( uvHani.pvrPattern in [11,12] ) then
    begin
        case uvHani.pvrPattern of
            11:
            begin
                LabelTitle8.Caption :=  '振込支払情報登録リスト';
				PrjLabelWay.Caption :=  '振込方法';
				DBTextPrjTransKbn_F.Visible := TRUE;
				DBTextPrjTransKbn_D.Visible := FALSE;
				DBTextPrjSite_D.Visible	    := FALSE;
				LabelPrjSite.Visible		:= FALSE;
            end;
            12:
            begin
                LabelTitle8.Caption :=  '期日指定振込支払情報登録リスト';
                PrjLabelWay.Caption :=  '振込方法 振込ｻｲﾄ';
                DBTextPrjTransKbn_F.Visible := FALSE;
                DBTextPrjTransKbn_D.Visible := TRUE;
                DBTextPrjSite_D.Visible	    := TRUE;
                LabelPrjSite.Visible		:= TRUE;
            end;
        end;
// <003> 2007/02/20 H.Kawato Add End
    end;

// <002> 2006/08/08 H.Kawato Add Start
    if ( uvHani.pvrPattern = 4 ) then
    begin
        ppLine45 .Visible := False;
        ppLine158.Visible := False;
        ppLabel29.Visible := False;
        ppLabel30.Visible := False;
        ppDBText6.Visible := False;
        ppDBText7.Visible := False;
        ppLine49 .Left    := 12.3727;
        ppLine149.Width   := 3.8333;
        ppLine162.Width   := 3.8437;
        ppShape3 .Width   := 12.03;
        ppStandardUnderLine2.Width := 12.033;
    end
    else
    begin
        ppLine45 .Visible := True;
        ppLine158.Visible := True;
        ppLabel29.Visible := True;
        ppLabel30.Visible := True;
        ppDBText6.Visible := True;
        ppDBText7.Visible := True;
        ppLine49 .Left    := 12.9375;
        ppLine149.Width   := 4.4003;
        ppLine162.Width   := 4.4107;
        ppShape3 .Width   := 12.6025;
        ppStandardUnderLine2.Width := 12.6;
    end;
// <002> 2006/08/08 H.Kawato Add End

// <002> 2006/08/08 H.Kawato Add Start
    if ( uvHani.pvrPattern = 12 ) then
    begin
        ppLine286.Visible  := False;
        ppLine296.Visible  := False;
        ppLabel157.Visible := False;
        ppLabel158.Visible := False;
        ppDBText28.Visible := False;
        ppDBText36.Visible := False;
        ppLine297 .Left    := 12.111;
        ppLine302 .Left    := 12.111;
        ppLine283.Width    := 3.843;
        ppLine305.Width    := 3.843;
        ppLine298.Width    := 11.7815;
        ppShape4 .Width    := 11.7815;
        ppStandardUnderLine8.Width := 11.7815;
    end
    else
    begin
        ppLine286.Visible  := True;
        ppLine296.Visible  := True;
        ppLabel157.Visible := True;
        ppLabel158.Visible := True;
        ppDBText28.Visible := True;
        ppDBText36.Visible := True;
        ppLine297 .Left    := 12.678;
        ppLine302 .Left    := 12.678;
        ppLine283.Width    := 4.4107;
        ppLine305.Width    := 4.4107;
        ppLine298.Width    := 12.3485;
        ppShape4 .Width    := 12.3485;
        ppStandardUnderLine8.Width := 12.3485;
    end;
// <002> 2006/08/08 H.Kawato Add End


    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvRepType])));
    PrnSupport.pCorpCode := wTppLabel;
    with wTppLabel do
    begin
        Left            :=  0.063;
        Top             :=  0;
        Width           :=  0.504;
        Height          :=  0.125;
        Alignment       :=  taLeftJustify;
    end;

    // 会社名
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvRepType])));
    PrnSupport.pCorpName := wTppLabel;
    with wTppLabel do
    begin
        Left            :=  0.63;
        Top             :=  0;
        Width           :=  3.78;
        Height          :=  0.125;
        Alignment       :=  taLeftJustify;
    end;

    // 日付
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvRepType])));
    PrnSupport.pDate	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left            :=  10.773;
        Top             :=  0;
        Width           :=  2.52;
        Height          :=  0.125;
        Alignment       :=  taRightJustify;
    end;

    // ﾀｲﾄﾙ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvRepType])));
    with wTppLabel do
    begin
        Left            :=  4.865;
        Top             :=  0.1667;
        Width           :=  3.5;
        Height          :=  0.25;
        Alignment       :=  taCenter;
        Distributed2    :=  True;
        FontRatio.Auto  :=  True;
    end;

    // ﾀｲﾄﾙｱﾝﾀﾞ-
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvRepType])));
    with wTppLine do
    begin
        Left            :=  4.802;
        Top             :=  0.2917;
        Width           :=  3.626;
        Height          :=  0.1667;
        Pen.Width       :=  0;
        Pen.Style       :=  psSolid;
    end;


    // 頁
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvRepType])));
    PrnSupport.pPage	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left            :=  6.4193;
        Top             :=  0;
        Width           :=  0.5;
        Height          :=  0.125;
        Alignment       :=  taCenter;
    end;
{
    // 会計会社(非表示?)
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvRepType])));
    wTppLabel.Visible := False;
}

    // ﾌｧｲﾙ名
    PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + uvCSVFileName + '.csv';

end;

//------------------------------------------------------------------------------
// ディテイルバンド印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
begin
// <006> 2007/12/25 H.Kawato Add Start
    if (uvHani.pvrPattern = 0) then
    begin
        if (not dsMain.DataSet.FieldByName ('strSateiCalc').IsNull ) then
        begin
            if (Trim(dsMain.DataSet.FieldByName ('strSateiCalc').AsString) = '比率' ) then
                DBTxt_Base_SateiCalc.DisplayFormat  := '0.#0'
            else
            if (Trim(dsMain.DataSet.FieldByName ('strSateiCalc').AsString) = '定額' ) then
                DBTxt_Base_SateiCalc.DisplayFormat  := '#,##0'
            else
                DBTxt_Base_SateiCalc.DisplayFormat  := '#,###';
        end;
    end;
// <006> 2007/12/25 H.Kawato Add End

    DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [uvRepType])));
    DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvRepType])));

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( DtlBand.LastRecord ) or ( DtlBand.PageOutOfSpace = TRUE ) Then
	begin
		if ( DtlBand.OverFlow = FALSE ) then
			DtlBand.OverFlow    :=  TRUE;

		if ( DtlBottomLine.ReprintOnOverFlow = FALSE ) then
			DtlBottomLine.ReprintOnOverFlow :=  TRUE;

        // ﾗｲﾝの太さを太くしている
		DtlBottomLine.Weight    :=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		DtlBottomLine.Weight    :=	0.25;
	end;

end;

//------------------------------------------------------------------------------
// 相殺の科目補助の共通関数(OnPrint)    <001>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.CmnOffsetDBTextPrint(Sender: TObject);
var
	nPosition	: Integer;
begin
    nPosition   :=  StrToInt(Copy(TppDBText(Sender).Name, 12, 2));

    if ( uvMD.FieldByName(Format('HojCDAttr%.2d',[nPosition])).AsInteger <= 1 ) then
    		TppDBText(Sender).Alignment :=  taRightJustify      // 左寄せ(文字属性)
	else    TppDBText(Sender).Alignment	:=  taLeftJustify;      // 右寄せ(数値属性)

end;

// <004> 2007/07/10 H.Kawato Add Start
//------------------------------------------------------------------------------
// 相殺の科目補助の共通関数(OnPrint)        <004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.CmnPrjOffsetDBTextPrint(Sender: TObject);
var
	nPosition	: Integer;
begin
    nPosition   :=  StrToInt(Copy(TppDBText(Sender).Name, 15, 2));

    if ( uvMD.FieldByName(Format('HojCDAttr%.2d',[nPosition])).AsInteger <= 1 ) then
    		TppDBText(Sender).Alignment :=  taRightJustify      // 左寄せ(文字属性)
	else    TppDBText(Sender).Alignment	:=  taLeftJustify;      // 右寄せ(数値属性)

end;

//------------------------------------------------------------------------------
// 相殺のﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞの共通関数(OnPrint)    <004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.CmnPrjOffsetPrjCodePrint(Sender: TObject);
begin
    if ( uvMD.FieldByName('PrjAttr').AsInteger <= 1 ) then
    		TppDBText(Sender).Alignment :=  taRightJustify      // 左寄せ(文字属性)
	else    TppDBText(Sender).Alignment	:=  taLeftJustify;      // 右寄せ(数値属性)
end;
// <004> 2007/07/10 H.Kawato Add End

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 StartPageイベント                    <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ReportProjectStartPage(Sender: TObject);
begin
    m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
	m_iPageLineCount    := 0;   // 行数カウンタの初期化
end;
{
procedure TDmJNTCRP004007L.ppGroupFooterBand2BeforeGenerate(
  Sender: TObject);
var
    FtrBand         : TppGroupFooterBand;
    FtrBottomLine   : TppLine;
begin

    FtrBand :=  TppGroupFooterBand(MJSFindCtrl(Self, Format ('ppGroupFooterBand%.d%.', [2])));
    FtrBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvRepType])));

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
//	if ( FtrBand.LastRecord ) or ( FtrBand.PageOutOfSpace = TRUE ) Then
	if ( FtrBand.LastRecord ) Then
//	if ( FtrBand.PageOutOfSpace = TRUE ) Then
	begin
        // ﾗｲﾝの太さを太くしている
		FtrBottomLine.Weight    :=	0.75;
	end;
end;
}

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払先情報登録リスト                  <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
    m_iPayCodeCount := m_iPayCodeCount + 1;

// <006> 2007/12/25 H.Kawato Add Start
    if (not dsMain.DataSet.FieldByName ('strSateiCalc').IsNull ) then
    begin
        if (Trim(dsMain.DataSet.FieldByName ('strSateiCalc').AsString) = '比率' ) then
            DBTxt_PrjBase_SateiCalc.DisplayFormat  := '0.#0'
        else
        if (Trim(dsMain.DataSet.FieldByName ('strSateiCalc').AsString) = '定額' ) then
            DBTxt_PrjBase_SateiCalc.DisplayFormat  := '#,##0'
        else
            DBTxt_PrjBase_SateiCalc.DisplayFormat  := '#,###';
    end;
// <006> 2007/12/25 H.Kawato Add End

	// 強制空白 強制改ページ
    if ((m_iPageLineCount + m_iPayCodeCount) > 50) then
        // ヘッダーは出力しない
        ppGroupHeaderBand1.Visible  := False
	else
        // ヘッダーを出力する
        ppGroupHeaderBand1.Visible  := True;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払先情報登録リスト                  <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand6BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
// <005> 2007/07/19 H.Kawato Mod
//    if ((m_iPageLineCount + m_iPayCodeCount) > 50) or
    if ((m_iPageLineCount + m_iPayCodeCount) > 49) or
        (dsMain.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine6.Weight := 0.75;
        // 改ページを挿入
		ppGroup1.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine6.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup1.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払先情報登録リスト                  <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand6AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount + m_iPayCodeCount) > 50 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払方法(比率／定額)                 <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
    m_iPayCodeCount := m_iPayCodeCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount * 5 + m_iPayCodeCount) > 45) then
        // ヘッダーは出力しない
        ppGroupHeaderBand2.Visible  := False
	else
        // ヘッダーを出力する
        ppGroupHeaderBand2.Visible  := True;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払方法(比率／定額)                 <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand9BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount * 5 + m_iPayCodeCount) > 47) or
        (DSPayMethods.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine7.Weight := 0.75;
        // 改ページを挿入
		ppGroup2.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine7.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup2.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 支払方法(比率／定額)                 <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand9AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount * 5 + m_iPayCodeCount) > 47 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 振込支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
    m_iPayCodeCount := m_iPayCodeCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount * 2 + m_iPayCodeCount) > 48) then
        // ヘッダーは出力しない
        ppGroupHeaderBand3.Visible  := False
	else
        // ヘッダーを出力する
        ppGroupHeaderBand3.Visible  := True;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 振込支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand11BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount * 2 + m_iPayCodeCount) > 49) or
        (DSFurikomi.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine8.Weight := 0.75;
        // 改ページを挿入
		ppGroup3.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine8.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup3.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 振込支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand11AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount * 2 + m_iPayCodeCount) > 49 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 手形支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand5BeforePrint(Sender: TObject);
begin
    if (Trim(DSDraftCheck.DataSet.FieldByName ('GCode').AsString) = '') then
    begin
        ppGroupHeaderBand5.Visible  := False;
    end
    else
    begin
        ppGroupHeaderBand5.Visible  := True;
        m_iPayCodeCount := m_iPayCodeCount + 1;
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 手形支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand7BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount + m_iPayCodeCount) > 51) or
        (DSDraftCheck.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine9.Weight := 0.75;
        // 改ページを挿入
		ppGroup5.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine9.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup5.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 手形支払情報登録リスト               <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand7AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount + m_iPayCodeCount) > 51 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 小切手支払情報登録リスト              <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand4BeforePrint(Sender: TObject);
begin
    if (Trim(DSDraftCheck.DataSet.FieldByName ('GCode').AsString) = '') then
    begin
        ppGroupHeaderBand4.Visible  := False;
    end
    else
    begin
        ppGroupHeaderBand4.Visible  := True;
        m_iPayCodeCount := m_iPayCodeCount + 1;
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 小切手支払情報登録リスト              <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand8BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount + m_iPayCodeCount) > 51) or
        (DSDraftCheck.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine10.Weight := 0.75;
        // 改ページを挿入
		ppGroup4.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine10.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup4.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 小切手支払情報登録リスト              <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand8AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount + m_iPayCodeCount) > 51 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 相殺情報登録リスト                    <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppGroupHeaderBand6BeforePrint(Sender: TObject);
begin
        m_iPayCodeCount := m_iPayCodeCount + 1;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 相殺情報登録リスト                    <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand10BeforePrint(Sender: TObject);
begin
    m_iPageLineCount    := m_iPageLineCount + 1;

	// 強制空白 強制改ページ
    if ((m_iPageLineCount + m_iPayCodeCount) > 51) or
        (DSPrintOffset.DataSet.FieldByName ('EOF').AsBoolean = True) then
	begin
        // 区切り線を太くする
        ppStandardUnderLine11.Weight := 0.75;
        // 改ページを挿入
		ppGroup6.NewPage	:= True;
	end
	else
	begin
        // 区切り線を細くする
        ppStandardUnderLine11.Weight := 0.25;
        // 改ページは挿入しない
		ppGroup6.NewPage	:= False;
	end;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾛｼﾞｪｸﾄ別支払 相殺情報登録リスト                    <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004007L.ppDetailBand10AfterPrint(Sender: TObject);
begin
    if (m_iPageLineCount + m_iPayCodeCount) > 51 then
    begin
        m_iPayCodeCount     := 0;   // 支払先カウンタの初期化
    	m_iPageLineCount    := 0;   // 行数カウンタの初期化
    end;
end;

end.

