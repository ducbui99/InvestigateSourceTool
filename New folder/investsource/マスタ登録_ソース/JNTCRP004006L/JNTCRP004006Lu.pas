//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    支払先情報(印刷処理)
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
//  <001>   広田 茂雄   2005/12/05(MON) 更新日時書式設定。
//  <002>   広田 茂雄   2005/12/12(MON) ﾌｧｲﾙ出力ﾎﾞﾀﾝを無効。
//  <003>   広田 茂雄   2005/12/12(MON) ｺｰﾄﾞ属性対応。
//  <004>   茂木 勇次   2006/02/06(MON) 未対応帳票の作成。
//  <005>   川戸 仁美   2006/08/08(TUE) 分解基準値の設定。
//  <006>   川戸 仁美   2006/10/11(WED) プロジェクト別支払対応
//  <007>   川戸 仁美   2007/02/07(WED) プロジェクト別支払の採用により、
//                                      ファイル出力の内容を切り替え。
//  <008>   川戸 仁美   2007/12/13(THU) 査定金額自動計算対応
//  <009>   大竹 文顕   2008.06.06(FRI) 印刷履歴更新対応。
//  <010>   T.SATOH(IDC)2008/09/29(MON) 印刷履歴スプール名改良
//	<011>	長沼 雄一   2009/09/29(TUE) 優先支払を手形以外を設定できるよう対応
//	<012>	長沼 雄一   2009/12/25(FRI) 優先支払でサイトに「日」を出すよう修正
//  <013>   SATOH(GSOL) 2012/07/04(WED) 電子債権対応
//  <AUT>   SATOH(GSOL) 2012.08.07(TUE) JNTAuthority対応
//  <014>   SATOH(GSOL) 2012/11/26(MON) 電子債権対応時の不具合修正(デザインのみ)
//  <015>   K.Kato(PRIME)2013/12/16(MON) 外貨債務対応(外貨情報帳票を追加)
//	<016>	Y.Kuroda	2014/01/30(THU) 電信送金情報に取引先照会番号、送金目的、送金許可を追加
//										為替手形／送金小切手情報に送金目的、送金許可を追加
//  <#C16>  H.KUMO      2014/06/30(MON) 取引先コード16桁対応（デザインのみ）
//                                      ・印刷で、取引先コードに長体をかけて修正
//  <017> 	SATOH(GSOL) 2014/07/14(MON) 電子記録債権手数料改良対応時の不具合修正
//  <MTA> 	M.Tsuta	    2021/10/04(MON) 複数振込先口座対応
//  <018> 	M.Tsuta	    2022/06/08(THO) CSV出力時に「正式名称」列に簡略名称が出力されてしまう不具合修正 <SRB:CMY-0111>
//                                      ※支払情報関連帳票は、印刷も含めて簡略名称を出力しており、
//										  既存ユーザーへの影響も考慮し、出力内容ではなくタイトルを「支払先簡略名称」に変更する
//=============================================================================
unit JNTCRP004006Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,dxmdaset,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  JNTAuthorityu,   //  <AUT> ADD
  JNTCommonu, ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004006L = class(TDataModule)
    dsShousaiJ: TDataSource;
    PipelineShousaiJ: TppDBPipeline;
    ppRepShousaiJ: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    SVppDate0: TppSystemVariable;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppDetailBand0: TppDetailBand;
    ppLine115: TppLine;
    ppLine78: TppLine;
    ppLine45: TppLine;
    ppLine3: TppLine;
    ppLine2: TppLine;
    ppLine17: TppLine;
    ppLine86: TppLine;
    ppLine16: TppLine;
    ppLine6: TppLine;
    ppLine85: TppLine;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    CmnReportDetailDBTextHojCode: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel136: TppLabel;
    ppDBText6: TppDBText;
    ppLabel137: TppLabel;
    ppDBText24: TppDBText;
    ppDBText8: TppDBText;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppDBText183: TppDBText;
    ppDBTextPrjTitle: TppDBText;
    CmnReportDetailDBTextPrjCode: TppDBText;
    ppDBText198: TppDBText;
    ppDBText186: TppDBText;
    ppLabel3: TppLabel;
    ppLine19: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel118: TppLabel;
    ppDBText52: TppDBText;
    ppLabel139: TppLabel;
    ppDBText49: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel221: TppLabel;
    ppDBText1: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel222: TppLabel;
    CmnReportDetailDBTextPaymentBasedValue01: TppDBText;
    CmnReportDetailDBTextPaymentBasedValue02: TppDBText;
    CmnReportDetailDBTextPaymentBasedValue03: TppDBText;
    CmnReportDetailDBTextPaymentBasedValue04: TppDBText;
    CmnReportDetailDBTextPaymentBasedValue05: TppDBText;
    ppDBText38: TppDBText;
    ppDBText37: TppDBText;
    ppDBText36: TppDBText;
    ppDBText35: TppDBText;
    ppDBText34: TppDBText;
    ppLabel223: TppLabel;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText44: TppDBText;
    ppDBText42: TppDBText;
    ppDBText41: TppDBText;
    ppDBText40: TppDBText;
    ppDBText39: TppDBText;
    ppLabel224: TppLabel;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppDBText51: TppDBText;
    ppDBText50: TppDBText;
    ppDBText48: TppDBText;
    ppDBText47: TppDBText;
    ppDBText45: TppDBText;
    ppLabel140: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppLine5: TppLine;
    ppLine94: TppLine;
    ppLine93: TppLine;
    ppLine87: TppLine;
    ppLine10: TppLine;
    ppLine48: TppLine;
    ppLine47: TppLine;
    ppLabel7: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLine20: TppLine;
    ppLine31: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText62: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppLine25: TppLine;
    ppLabel11: TppLabel;
    CmnReportDetailDBTextPaymentBasedHiritu01: TppDBText;
    CmnReportDetailDBTextPaymentBasedHiritu02: TppDBText;
    CmnReportDetailDBTextPaymentBasedHiritu03: TppDBText;
    CmnReportDetailDBTextPaymentBasedHiritu04: TppDBText;
    CmnReportDetailDBTextPaymentBasedHiritu05: TppDBText;
    ppDBText88: TppDBText;
    ppDBText87: TppDBText;
    ppDBText86: TppDBText;
    ppDBText84: TppDBText;
    ppDBText83: TppDBText;
    ppLine32: TppLine;
    ppLabel12: TppLabel;
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
    ppLine33: TppLine;
    ppLabel13: TppLabel;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText85: TppDBText;
    ppDBText93: TppDBText;
    ppDBText95: TppDBText;
    ppLine34: TppLine;
    ppDBText165: TppDBText;
    ppDBText129: TppDBText;
    ppDBText126: TppDBText;
    ppDBText109: TppDBText;
    ppDBText108: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText96: TppDBText;
    ppLine18: TppLine;
    ppLabel120: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppDBText120: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppLabel159: TppLabel;
    ppDBText99: TppDBText;
    ppLabel245: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppDBText123: TppDBText;
    ppDBText122: TppDBText;
    ppDBText100: TppDBText;
    ppLabel162: TppLabel;
    ppDBText143: TppDBText;
    ppLine46: TppLine;
    ppLine13: TppLine;
    ppLine56: TppLine;
    ppLine12: TppLine;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppDBText121: TppDBText;
    ppLabel165: TppLabel;
    ppDBText144: TppDBText;
    ppDBText101: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppLabel161: TppLabel;
    ppLabel160: TppLabel;
    ppDBText102: TppDBText;
    ppDBText147: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText103: TppDBText;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppDBText124: TppDBText;
    ppLabel166: TppLabel;
    ppDBText145: TppDBText;
    ppDBText125: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText152: TppDBText;
    ppDBText107: TppDBText;
    ppLabel168: TppLabel;
    ppDBText149: TppDBText;
    ppDBText148: TppDBText;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel167: TppLabel;
    ppLabel123: TppLabel;
    ppLabel141: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppDBText179: TppDBText;
    ppLabel173: TppLabel;
    ppDBText161: TppDBText;
    ppDBText157: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppLabel169: TppLabel;
    ppLabel171: TppLabel;
    ppLabel175: TppLabel;
    ppDBText181: TppDBText;
    ppLabel174: TppLabel;
    ppDBText162: TppDBText;
    ppDBText158: TppDBText;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText159: TppDBText;
    ppDBText163: TppDBText;
    ppLabel172: TppLabel;
    ppLabel170: TppLabel;
    ppDBText160: TppDBText;
    ppDBText164: TppDBText;
    ppLine4: TppLine;
    ppLine73: TppLine;
    ppLine14: TppLine;
    ppLine80: TppLine;
    ppLabel202: TppLabel;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppLine82: TppLine;
    ppDBText180: TppDBText;
    ppDBText217: TppDBText;
    ppDBText253: TppDBText;
    ppDBText265: TppDBText;
    ppDBText277: TppDBText;
    ppDBText289: TppDBText;
    ppDBText241: TppDBText;
    ppDBText229: TppDBText;
    ppDBText205: TppDBText;
    ppDBText193: TppDBText;
    ppLine83: TppLine;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine11: TppLine;
    ppLine81: TppLine;
    ppLine103: TppLine;
    ppLine15: TppLine;
    ppLine118: TppLine;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppDBText256: TppDBText;
    ppDBText257: TppDBText;
    ppDBText268: TppDBText;
    ppDBText269: TppDBText;
    ppDBText280: TppDBText;
    ppDBText281: TppDBText;
    ppDBText292: TppDBText;
    ppDBText293: TppDBText;
    ppDBText244: TppDBText;
    ppDBText245: TppDBText;
    ppDBText232: TppDBText;
    ppDBText233: TppDBText;
    ppDBText208: TppDBText;
    ppDBText209: TppDBText;
    ppDBText196: TppDBText;
    ppDBText197: TppDBText;
    ppLine119: TppLine;
    ppLine21: TppLine;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText224: TppDBText;
    ppDBText225: TppDBText;
    ppDBText260: TppDBText;
    ppDBText261: TppDBText;
    ppDBText272: TppDBText;
    ppDBText273: TppDBText;
    ppDBText284: TppDBText;
    ppDBText285: TppDBText;
    ppDBText296: TppDBText;
    ppDBText297: TppDBText;
    ppDBText248: TppDBText;
    ppDBText249: TppDBText;
    ppDBText236: TppDBText;
    ppDBText237: TppDBText;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText200: TppDBText;
    ppDBText201: TppDBText;
    ppLine116: TppLine;
    ppDBText190: TppDBText;
    ppDBText192: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText262: TppDBText;
    ppDBText263: TppDBText;
    ppDBText274: TppDBText;
    ppDBText275: TppDBText;
    ppDBText286: TppDBText;
    ppDBText287: TppDBText;
    ppDBText298: TppDBText;
    ppDBText299: TppDBText;
    ppDBText250: TppDBText;
    ppDBText251: TppDBText;
    ppDBText238: TppDBText;
    ppDBText239: TppDBText;
    ppDBText214: TppDBText;
    ppDBText215: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppLine117: TppLine;
    ppDBText191: TppDBText;
    ppDBText228: TppDBText;
    ppDBText264: TppDBText;
    ppDBText276: TppDBText;
    ppDBText288: TppDBText;
    ppDBText300: TppDBText;
    ppDBText252: TppDBText;
    ppDBText240: TppDBText;
    ppDBText216: TppDBText;
    ppDBText204: TppDBText;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel185: TppLabel;
    ppLabel184: TppLabel;
    ppLabel183: TppLabel;
    ppLabel182: TppLabel;
    ppLabel179: TppLabel;
    ppLabel176: TppLabel;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    SVppPage0: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine26: TppLine;
    ppLabel5: TppLabel;
    ppDBText12: TppDBText;
    ppLine27: TppLine;
    ppLine28: TppLine;
    CmnReportDetailDBTextSateiCalcValue: TppDBText;
    ppDBText14: TppDBText;
    ppLabel6: TppLabel;
    ppDBText13: TppDBText;
    ppLabel8: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppLabel21: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppLabel23: TppLabel;
    ppDBText29: TppDBText;
    ppLabel24: TppLabel;
    ppDBText53: TppDBText;
    ppLine7: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine35: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLabel25: TppLabel;
    ppDBText54: TppDBText;
    ppLabel26: TppLabel;
    ppDBText55: TppDBText;
    ppLabel27: TppLabel;
    ppDBText89: TppDBText;
    ppLabel28: TppLabel;
    ppDBText90: TppDBText;
    ppLabel29: TppLabel;
    ppDBText91: TppDBText;
    ppLabel30: TppLabel;
    ppDBText92: TppDBText;
    CmnDataSourcePrintGaika: TDataSource;
    CmnPipelinePrintGaika: TppDBPipeline;
    CmnReportGaika: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    SVppDate1: TppSystemVariable;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLine76: TppLine;
    ppDBTextLongName: TppDBText;
    ppLine92: TppLine;
    ppLabel34: TppLabel;
    ppLabelGaikaPrjName: TppLabel;
    ppLine160: TppLine;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppDBText557: TppDBText;
    ppDBText558: TppDBText;
    ppLine171: TppLine;
    ppLine172: TppLine;
    ppDBText562: TppDBText;
    ppDBText222: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText219: TppDBText;
    ppLabel42: TppLabel;
    ppDBText223: TppDBText;
    ppLabel43: TppLabel;
    ppDBText231: TppDBText;
    ppLabel44: TppLabel;
    ppDBText234: TppDBText;
    ppLabel45: TppLabel;
    ppDBText235: TppDBText;
    ppLabel46: TppLabel;
    ppDBText243: TppDBText;
    ppLine74: TppLine;
    ppLine79: TppLine;
    ppLine88: TppLine;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine95: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine41: TppLine;
    ppLine75: TppLine;
    ppLine99: TppLine;
    ppLine102: TppLine;
    ppLine106: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine109: TppLine;
    ppLine110: TppLine;
    ppLine111: TppLine;
    ppLine114: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLabel47: TppLabel;
    ppLabel69: TppLabel;
    ppDBText335: TppDBText;
    ppLine164: TppLine;
    ppLabel200: TppLabel;
    ppDBText511: TppDBText;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppDBText211: TppDBText;
    ppStandardUnderLine1: TppLine;
    ppLine44: TppLine;
    ppLine96: TppLine;
    ppLine49: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    SVppPage1: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBTextGroup: TppDBText;
    ppLineDetailTop: TppLine;
    ppLine40: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLabel31: TppLabel;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLabel32: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLabel33: TppLabel;
    ppLine57: TppLine;
    ppLabel35: TppLabel;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLabel48: TppLabel;
    ppLine60: TppLine;
    ppDBText94: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppLine61: TppLine;
    ppDBText133: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppLine62: TppLine;
    ppDBText142: TppDBText;
    ppLabel49: TppLabel;
    ppDBText146: TppDBText;
    DSFurikomi: TDataSource;
    PipelineFurikomi: TppDBPipeline;
    ReportFurikomi: TppReport;
    ppHeaderBand8: TppHeaderBand;
    LabelTitle2: TppLabel;
    LineTitle2: TppLine;
    ppShape3: TppShape;
    ppLine123: TppLine;
    ppLabel50: TppLabel;
    ppLine140: TppLine;
    ppLabel51: TppLabel;
    ppLine141: TppLine;
    ppLabel59: TppLabel;
    ppLine142: TppLine;
    ppLine143: TppLine;
    ppLabel64: TppLabel;
    ppLine144: TppLine;
    ppLine145: TppLine;
    ppLabel52: TppLabel;
    ppLine146: TppLine;
    ppLabel53: TppLabel;
    ppLine147: TppLine;
    ppLine148: TppLine;
    ppLine149: TppLine;
    ppLine150: TppLine;
    ppLine151: TppLine;
    ppLabel54: TppLabel;
    ppLabel68: TppLabel;
    ppLabel55: TppLabel;
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
    ppLine63: TppLine;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
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
    ppLine64: TppLine;
    ppLine161: TppLine;
    ppLine162: TppLine;
    ppLine163: TppLine;
    ppLine65: TppLine;
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
    ppLine66: TppLine;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppFooterBand8: TppFooterBand;
    SVppPage2: TppSystemVariable;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLabel58: TppLabel;
    ppDBText182: TppDBText;

	constructor     CreateModule                (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy           (Sender: TObject);
    procedure       ppRepBeforePrint            (Sender: TObject);
    procedure       fnCmnBeforeGenerate         (Sender: TObject);              // <004>
    procedure       ppDetailBand0BeforeGenerate (Sender: TObject);
    procedure CmnReportGaikaStartColumn(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);

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
    m_bDetailTopVisible	: Boolean;			// <015> ADD

	procedure ppReport1FileOut          ();
    procedure ppReportGaikaFileOut      ();										// <015>
    procedure fnInzPrint                ();                                     // <004>
    procedure ppReportFurikomiFileOut	();										// <MTA> Add

  public
    { Public 宣言 }
    JNTAuthority  :   TJNTAuthority;        // <AUT> ADD

	procedure DoPrint       (Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);   // <004>
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
  DmJNTCRP004006L: TDmJNTCRP004006L;

  giIndex       :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
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
	pFrm    :   ^TDmJNTCRP004006L;
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
				pFrm^   :=  TDmJNTCRP004006L.CreateModule( AOwner,pRec );
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetMD, PrtParam.CorpSys,PrtParam.JNTArea );   // <004>
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
constructor TDmJNTCRP004006L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004006L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon); // <004>
var
	i       :   Integer;
    wRep    :   TppReport;
begin

	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    m_cJNTArea  := JNTArea; // <004>
    uvSelSys    := CorpSys;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

    // ↓↓↓<004>
    wRep := nil;
    case uvHani.pvrPattern of
        // 支払先登録ﾘｽﾄ(詳細)
        0:  begin
                wRep                    :=  ppRepShousaiJ;
                dsShousaiJ.DataSet      :=  TargetMD;
                uvCSVFileName           :=  '支払先登録リスト(詳細)';
            end;
// <015> ADD start
        1:	begin
        		wRep					:=	CmnReportGaika;
                CmnDataSourcePrintGaika.DataSet :=  TargetMD;
                uvCSVFileName           :=  '支払先登録リスト(外貨情報)';
        	end;
// <015> ADD end

// <MTA> Add st
        2:	begin
        		wRep					:=	ReportFurikomi;
                DSFurikomi.DataSet 		:=  TargetMD;
                uvCSVFileName           :=  '振込支払情報登録';
        	end;
// <MTA> Add end
    end;

    // 印刷初期化処理
    fnInzPrint;

    PrnSupport.ApRB				:=  wRep;
// <010> MOD-STR
//    PrnSupport.strDocName		:=  uvHani.pvrRepTitle;
    PrnSupport.strDocName		:=  uvHani.pvrRepTitle + '[' + uvHani.pvrOrderNM + ']';
// <010> MOD-END

	PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    :=  m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    // ↑↑↑<004>

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
// <AUT> MOD-STR
//  if ( m_cJNTArea.IsExtract = FALSE )  then
    if (JNTAuthority.IsExtract = FALSE)  then
// <AUT> MOD-END
	    prnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

    PrnSupport.pApRec           := m_pRec;                      // <009>

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

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
// <015> MOD start
(*
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE: ppReport1FileOut;
*)
            PDLG_PREVIEW:
            begin
            	case uvHani.pvrPattern of
                    0:   					// 支払先登録リスト
                    begin
                        mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
                    end;
                    1:						// 支払先登録リスト(外貨情報)
                    begin
                		mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReportGaikaFileOut);
                    end;
//<MTA> Add st
                    2:						// 振込支払情報登録リスト
                    begin
                		mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReportFurikomiFileOut);
                    end;
//<MTA> Add end
                end;
            end;
            PDLG_FILE:
            begin
            	case uvHani.pvrPattern of
                    0:						// 支払先登録リスト
                    begin
		            	ppReport1FileOut();
                    end;
                    1:						// 支払先登録リスト(外貨情報)
                    begin
                    	ppReportGaikaFileOut();
                    end;
//<MTA> Add st
                    2:						// 振込支払情報登録リスト
                    begin
                    	ppReportFurikomiFileOut();
                    end;
//<MTA> Add end
                end;
            end;
// <015> MOD end
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理 <004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppReport1FileOut();
var
    cTitleField     :   TStringList;
    cMemDataField   :   TStringList;
    ds              :   TDataSource;
    strPrjCode      :   String;         // <006> 2006/10/11 H.Kawato Add
    strPrjName      :   String;         // <006> 2006/10/11 H.Kawato Add
    strPrjSubCode   :   String;         // <006> 2006/10/11 H.Kawato Add
    strPrjSubName   :   String;         // <006> 2006/10/11 H.Kawato Add
begin

    ds              :=  nil;
    cTitleField     :=  TStringList.Create;
    cMemDataField   :=  TStringList.Create;

// <006> 2006/10/11 H.Kawato Add Start
    strPrjCode      := dsShousaiJ.DataSet.FieldByName ('strPrjHojyoName').AsString + 'ｺｰﾄﾞ';
    strPrjName      := dsShousaiJ.DataSet.FieldByName ('strPrjHojyoName').AsString + '名称';
    strPrjSubCode   := dsShousaiJ.DataSet.FieldByName ('strPrjSubHojyoName').AsString + 'ｺｰﾄﾞ';
    strPrjSubName   := dsShousaiJ.DataSet.FieldByName ('strPrjSubHojyoName').AsString + '名称';
// <006> 2006/10/11 H.Kawato Add End

    case uvHani.pvrPattern of
        // 支払先登録ﾘｽﾄ(詳細)
        0:
        begin
            ds  :=  dsShousaiJ;

            cTitleField.Add('支払先ｺｰﾄﾞ'	                    );
			cTitleField.Add('支払先正式名称'                    );
			cTitleField.Add('支払先簡略名称'                    );
			cTitleField.Add('連想'			                    );
//			cTitleField.Add('名寄せ'	                        );              // <006> 2006/10/11 H.Kawato Del
            cTitleField.Add('実在／合計区分'	                );
//			cTitleField.Add('適用期間'	                        );              // <006> 2006/10/11 H.Kawato Del
// <005> 2006/08/08 H.Kawato Mod
//			cTitleField.Add('支払方法'                          );
			cTitleField.Add('査定方法'                          );
			cTitleField.Add('査定金額計算区分'                  );              // <008> 2007/12/13 H.Kawato Add
			cTitleField.Add('査定金額計算値'                    );              // <008> 2007/12/13 H.Kawato Add
// <006> 2006/10/11 H.Kawato Add Start
			cTitleField.Add('分解ﾊﾟﾀｰﾝ'                         );
// <007> 2007/02/07 H.Kawato Add Start
            if (dsShousaiJ.DataSet.FieldByName ('nPrjAdoptKbn').AsInteger = 1) then
            begin
// <007> 2007/02/07 H.Kawato Add End
                cTitleField.Add(strPrjCode                      );
                cTitleField.Add(strPrjName                      );
// <007> 2007/02/07 H.Kawato Add Start
                if (dsShousaiJ.DataSet.FieldByName ('nPjSubAdoptKbn').AsInteger = 1) then
                begin
// <007> 2007/02/07 H.Kawato Add End
                    cTitleField.Add(strPrjSubCode               );
                    cTitleField.Add(strPrjSubName               );
// <007> 2007/02/07 H.Kawato Add Start
                end;
            end;
// <007> 2007/02/07 H.Kawato Add End
// <006> 2006/10/11 H.Kawato Add End
			cTitleField.Add('分解方法'                          );
// <005> 2006/08/08 H.Kawato Mod
			cTitleField.Add('№'                                );
			cTitleField.Add('支払方法'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('支払最低額'	                    );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('№'                                );
			cTitleField.Add('支払方法'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('支払最低額'	                    );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('№'                                );
			cTitleField.Add('支払方法'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('支払最低額'	                    );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('№'                                );
			cTitleField.Add('支払方法'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('支払最低額'	                    );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('№'                                );
			cTitleField.Add('支払方法'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('支払最低額'	                    );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
// <006> 2006/10/11 H.Kawato Add Start
// <011> Mod
//			cTitleField.Add('手形優先'                          );
			cTitleField.Add('優先支払'                          );
// <011> Mod
			cTitleField.Add('№'                                );
			cTitleField.Add('基準金額'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('サイト'                            );
			cTitleField.Add('№'                                );
			cTitleField.Add('基準金額'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('サイト'                            );
			cTitleField.Add('№'                                );
			cTitleField.Add('基準金額'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('サイト'                            );
			cTitleField.Add('№'                                );
			cTitleField.Add('基準金額'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('サイト'                            );
			cTitleField.Add('№'                                );
			cTitleField.Add('基準金額'	                        );
			cTitleField.Add('分解基準値'                        );
			cTitleField.Add('端数処理額'                        );
			cTitleField.Add('端数処理方法'                      );
			cTitleField.Add('サイト'                            );
			cTitleField.Add('共通情報: 受取人名称'              );
// <006> 2006/10/11 H.Kawato Add End
			cTitleField.Add('振込情報: 支払口座ｺｰﾄﾞ'            );
			cTitleField.Add('振込情報: 支払口座名称'            );
			cTitleField.Add('振込情報: 預金種目'                );
			cTitleField.Add('振込情報: 口座番号'			    );
			cTitleField.Add('振込情報: 全銀協ｺｰﾄﾞ'              );
			cTitleField.Add('振込情報: 支店ｺｰﾄﾞ'                );
			cTitleField.Add('振込情報: 銀行名称'                );
			cTitleField.Add('振込情報: 支店名称'                );
			cTitleField.Add('振込情報: 銀行名(ｶﾅ)'              );
			cTitleField.Add('振込情報: 支店名(ｶﾅ)'              );
			cTitleField.Add('振込情報: 振込先(ｶﾅ)'              );
			cTitleField.Add('振込情報: 預金種目'                );
			cTitleField.Add('振込情報: 口座番号'                );
			cTitleField.Add('振込情報: 手数料負担区分'          );
			cTitleField.Add('振込情報: 手数料計算区分'          );
			cTitleField.Add('振込情報: 振込方法'                );
			cTitleField.Add('振込情報: 口座自動引落区分'        );              // <005> 2006/08/08 H.Kawato Add
			cTitleField.Add('振込情報: 引落支払データ'          );              // <005> 2006/08/08 H.Kawato Add
			cTitleField.Add('振込情報: FBｾｯﾄ区分'               );
			cTitleField.Add('振込情報: 顧客ｺｰﾄﾞA'               );
			cTitleField.Add('振込情報: 顧客ｺｰﾄﾞB'               );
			cTitleField.Add('振込情報: EDI情報'                 );
			cTitleField.Add('期日指定振込情報: 支払口座ｺｰﾄﾞ'    );
			cTitleField.Add('期日指定振込情報: 支払口座名称'    );
			cTitleField.Add('期日指定振込情報: 預金種目'        );
			cTitleField.Add('期日指定振込情報: 口座番号'        );
			cTitleField.Add('期日指定振込情報: 全銀協ｺｰﾄﾞ'      );
			cTitleField.Add('期日指定振込情報: 支店ｺｰﾄﾞ'        );
			cTitleField.Add('期日指定振込情報: 銀行名称'        );
			cTitleField.Add('期日指定振込情報: 支店名称'        );
			cTitleField.Add('期日指定振込情報: 銀行名(ｶﾅ)'      );
			cTitleField.Add('期日指定振込情報: 支店名(ｶﾅ)'      );
			cTitleField.Add('期日指定振込情報: 振込先(ｶﾅ)'      );
			cTitleField.Add('期日指定振込情報: 預金種目'        );
			cTitleField.Add('期日指定振込情報: 口座番号'        );
			cTitleField.Add('期日指定振込情報: 手数料負担区分'  );
			cTitleField.Add('期日指定振込情報: 手数料計算区分'  );
			cTitleField.Add('期日指定振込情報: 振込方法'        );
			cTitleField.Add('期日指定振込情報: FBｾｯﾄ区分'       );
			cTitleField.Add('期日指定振込情報: 顧客ｺｰﾄﾞA'       );
			cTitleField.Add('期日指定振込情報: 顧客ｺｰﾄﾞB'       );
			cTitleField.Add('期日指定振込情報: EDI情報'         );
			cTitleField.Add('期日指定振込情報: 振込ｻｲﾄ'         );
// <013> MOD-STR
//			cTitleField.Add('手形情報: 支払口座ｺｰﾄﾞ'            );
//			cTitleField.Add('手形情報: 支払口座名称'            );
//			cTitleField.Add('手形情報: 預金種目'                );
//			cTitleField.Add('手形情報: 口座番号'                );
//			cTitleField.Add('手形情報: 手形郵送区分'            );
//			cTitleField.Add('手形情報: 郵送料負担区分'          );
//			cTitleField.Add('手形情報: 手形ｻｲﾄ'                 );
//			cTitleField.Add('手形情報: 手形分割枚数'            );
			cTitleField.Add('手形／電子債権情報: 支払口座ｺｰﾄﾞ'            );
			cTitleField.Add('手形／電子債権情報: 支払口座名称'            );
			cTitleField.Add('手形／電子債権情報: 預金種目'                );
			cTitleField.Add('手形／電子債権情報: 口座番号'                );
			cTitleField.Add('手形／電子債権情報: 手形郵送区分'            );
			cTitleField.Add('手形／電子債権情報: 郵送料負担区分'          );
			cTitleField.Add('手形／電子債権情報: 手形ｻｲﾄ'                 );
			cTitleField.Add('手形／電子債権情報: 手形分割枚数'            );
// <013> MOD-END
// <013> ADD-STR
            cTitleField.Add('手形／電子債権情報: 電子債権採用区分'        );
            cTitleField.Add('手形／電子債権情報: 全銀協ｺｰﾄﾞ'              );
            cTitleField.Add('手形／電子債権情報: 支店ｺｰﾄﾞ'                );
            cTitleField.Add('手形／電子債権情報: 銀行名称'                );
            cTitleField.Add('手形／電子債権情報: 支店名称'                );
            cTitleField.Add('手形／電子債権情報: 銀行名(ｶﾅ)'              );
            cTitleField.Add('手形／電子債権情報: 支店名(ｶﾅ)'              );
            cTitleField.Add('手形／電子債権情報: 振込先(ｶﾅ)'              );
            cTitleField.Add('手形／電子債権情報: 預金種目'                );
            cTitleField.Add('手形／電子債権情報: 口座番号'                );
            cTitleField.Add('手形／電子債権情報: 手数料負担区分'          );
            cTitleField.Add('手形／電子債権情報: フリー項目1'             );
            cTitleField.Add('手形／電子債権情報: フリー項目2'             );
            cTitleField.Add('手形／電子債権情報: フリー項目3'             );
            cTitleField.Add('手形／電子債権情報: フリー項目4'             );
            cTitleField.Add('手形／電子債権情報: フリー項目5'             );
// <013> ADD-END
			cTitleField.Add('小切手情報: 支払口座ｺｰﾄﾞ'          );
			cTitleField.Add('小切手情報: 支払口座名称'          );
			cTitleField.Add('小切手情報: 預金種目'              );
			cTitleField.Add('小切手情報: 口座番号'              );
			cTitleField.Add('小切手情報: 小切手郵送区分'        );
			cTitleField.Add('小切手情報: 郵送料負担区分'        );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
			cTitleField.Add('相殺情報: №'                      );
			cTitleField.Add('相殺情報: 科目ｺｰﾄﾞ'                );
			cTitleField.Add('相殺情報: 科目名称'                );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ1'               );
			cTitleField.Add('相殺情報: 補助名称1'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ2'               );
			cTitleField.Add('相殺情報: 補助名称2'               );
			cTitleField.Add('相殺情報: 補助ｺｰﾄﾞ3'               );
			cTitleField.Add('相殺情報: 補助名称3'               );
			cTitleField.Add('相殺情報: 消費税ｺｰﾄﾞ'              );
			cTitleField.Add('相殺情報: 消費税率'                );
			cTitleField.Add('相殺情報: 相殺金額'                );
            cTitleField.Add('手形／電子債権情報: 手数料計算区分');  //  <017>
(*
			cTitleField.Add('その他情報: 取引先分類'            );
			cTitleField.Add('その他情報: 受取人名称'            );
			cTitleField.Add('その他情報: 郵便番号(基番)'        );
			cTitleField.Add('その他情報: 郵便番号(枝番)'        );
			cTitleField.Add('その他情報: 電話番号'              );
			cTitleField.Add('その他情報: 住所１'                );
			cTitleField.Add('その他情報: 住所２'                );
			cTitleField.Add('その他情報: 送付先部署'            );
			cTitleField.Add('その他情報: 担当者'                );
			cTitleField.Add('その他情報: 敬称区分'              );
			cTitleField.Add('その他情報: 支払通知書区分'        );
			cTitleField.Add('その他情報: 名寄せ支払先(親)ｺｰﾄﾞ'  );
			cTitleField.Add('その他情報: 名寄せ支払先(親)名称'  );
			cTitleField.Add('その他情報: 名寄せ親代替支払先ｺｰﾄﾞ');
			cTitleField.Add('その他情報: 名寄せ親代替支払先名称');
			cTitleField.Add('その他情報: 売上消費税ｺｰﾄﾞ'        );
			cTitleField.Add('その他情報: 売上消費税率'          );
			cTitleField.Add('その他情報: 仕入消費税ｺｰﾄﾞ'        );
			cTitleField.Add('その他情報: 仕入消費税率'          );
			cTitleField.Add('その他情報: 借方資金繰'            );
			cTitleField.Add('その他情報: 貸方資金繰'            );
			cTitleField.Add('締日'                              );
			cTitleField.Add('予定月'                            );
			cTitleField.Add('予定日'                            );
			cTitleField.Add('休日'                              );
			cTitleField.Add('締日'                              );
			cTitleField.Add('予定月'                            );
			cTitleField.Add('予定日'                            );
			cTitleField.Add('休日'                              );
			cTitleField.Add('締日'                              );
			cTitleField.Add('予定月'                            );
			cTitleField.Add('予定日'                            );
			cTitleField.Add('休日'                              );
*)

			cMemDataField.Add('strHojCode'                      );
			cMemDataField.Add('strName'	                        );
			cMemDataField.Add('strNameSimple'                   );
			cMemDataField.Add('strAssociation'                  );
//			cMemDataField.Add('strRecordClassDesc'              );              // <006> 2006/10/11 H.Kawato Del
            cMemDataField.Add('nSumKbn'                         );
//			cMemDataField.Add('strAppDate'                      );              // <006> 2006/10/11 H.Kawato Del
			cMemDataField.Add('strSateiDivisionDesc'            );              // <005> 2006/08/08 H.Kawato Add
			cMemDataField.Add('strSateiCalcKbnDesc'             );              // <008> 2006/12/13 H.Kawato Add
			cMemDataField.Add('nSateiCalcValue'                 );              // <008> 2006/12/13 H.Kawato Add
// <006> 2006/10/11 H.Kawato Add Start
			cMemDataField.Add('strDecPtnDivisionDesc'           );
// <007> 2007/02/07 H.Kawato Add Start
            if (dsShousaiJ.DataSet.FieldByName ('nPrjAdoptKbn').AsInteger = 1) then
            begin
// <007> 2007/02/07 H.Kawato Add End
			    cMemDataField.Add('strProjectCode'              );
                cMemDataField.Add('strProjectCodeDesc'          );
// <007> 2007/02/07 H.Kawato Add Start
                if (dsShousaiJ.DataSet.FieldByName ('nPjSubAdoptKbn').AsInteger = 1) then
                begin
// <007> 2007/02/07 H.Kawato Add End
                    cMemDataField.Add('strProjectSubCode'       );
                    cMemDataField.Add('strProjectSubCodeDesc'   );
// <007> 2007/02/07 H.Kawato Add Start
                end;
            end;
// <007> 2007/02/07 H.Kawato Add End
// <006> 2006/10/11 H.Kawato Add End
			cMemDataField.Add('strDecDivisionDesc'              );
			cMemDataField.Add('nPaymentNo01'                    );
			cMemDataField.Add('strPaymentDesc01'                );
			cMemDataField.Add('nPaymentBasedValue01'            );
			cMemDataField.Add('nPaymentMinimumPrice01'          );
			cMemDataField.Add('nPaymentFractionPrice01'         );
			cMemDataField.Add('strPaymentFractionDesc01'        );
			cMemDataField.Add('nPaymentNo02'                    );
			cMemDataField.Add('strPaymentDesc02'                );
			cMemDataField.Add('nPaymentBasedValue02'            );
			cMemDataField.Add('nPaymentMinimumPrice02'          );
			cMemDataField.Add('nPaymentFractionPrice02'         );
			cMemDataField.Add('strPaymentFractionDesc02'        );
			cMemDataField.Add('nPaymentNo03'                    );
			cMemDataField.Add('strPaymentDesc03'                );
			cMemDataField.Add('nPaymentBasedValue03'            );
			cMemDataField.Add('nPaymentMinimumPrice03'          );
			cMemDataField.Add('nPaymentFractionPrice03'         );
			cMemDataField.Add('strPaymentFractionDesc03'        );
			cMemDataField.Add('nPaymentNo04'                    );
			cMemDataField.Add('strPaymentDesc04'                );
			cMemDataField.Add('nPaymentBasedValue04'            );
			cMemDataField.Add('nPaymentMinimumPrice04'          );
			cMemDataField.Add('nPaymentFractionPrice04'         );
			cMemDataField.Add('strPaymentFractionDesc04'        );
			cMemDataField.Add('nPaymentNo05'                    );
			cMemDataField.Add('strPaymentDesc05'                );
			cMemDataField.Add('nPaymentBasedValue05'            );
			cMemDataField.Add('nPaymentMinimumPrice05'          );
			cMemDataField.Add('nPaymentFractionPrice05'         );
			cMemDataField.Add('strPaymentFractionDesc05'        );
// <006> 2006/10/11 H.Kawato Add Start
			cMemDataField.Add('strPriPayWayDesc'                );
			cMemDataField.Add('nPriPayWayNo01'                  );
			cMemDataField.Add('nPriPayWayBaseKingaku01'         );
			cMemDataField.Add('nPriPayWayBaseHiritu01'          );
			cMemDataField.Add('nPriPayWayHasuuKingaku01'        );
			cMemDataField.Add('strPriPayWayHasuuDesc01'         );
//<012> Mod
//			cMemDataField.Add('nPriPayWaySite01'                );
			cMemDataField.Add('strPriPayWaySite01'              );
//<012> Mod
			cMemDataField.Add('nPriPayWayNo02'                  );
			cMemDataField.Add('nPriPayWayBaseKingaku02'         );
			cMemDataField.Add('nPriPayWayBaseHiritu02'          );
			cMemDataField.Add('nPriPayWayHasuuKingaku02'        );
			cMemDataField.Add('strPriPayWayHasuuDesc02'         );
//<012> Mod
//			cMemDataField.Add('nPriPayWaySite02'                );
			cMemDataField.Add('strPriPayWaySite02'              );
//<012> Mod
			cMemDataField.Add('nPriPayWayNo03'                  );
			cMemDataField.Add('nPriPayWayBaseKingaku03'         );
			cMemDataField.Add('nPriPayWayBaseHiritu03'          );
			cMemDataField.Add('nPriPayWayHasuuKingaku03'        );
			cMemDataField.Add('strPriPayWayHasuuDesc03'         );
//<012> Mod
//			cMemDataField.Add('nPriPayWaySite03'                );
			cMemDataField.Add('strPriPayWaySite03'              );
//<012> Mod
			cMemDataField.Add('nPriPayWayNo04'                  );
			cMemDataField.Add('nPriPayWayBaseKingaku04'         );
			cMemDataField.Add('nPriPayWayBaseHiritu04'          );
			cMemDataField.Add('nPriPayWayHasuuKingaku04'        );
			cMemDataField.Add('strPriPayWayHasuuDesc04'         );
//<012> Mod
//			cMemDataField.Add('nPriPayWaySite04'                );
			cMemDataField.Add('strPriPayWaySite04'              );
//<012> Mod
			cMemDataField.Add('nPriPayWayNo05'                  );
			cMemDataField.Add('nPriPayWayBaseKingaku05'         );
			cMemDataField.Add('nPriPayWayBaseHiritu05'          );
			cMemDataField.Add('nPriPayWayHasuuKingaku05'        );
			cMemDataField.Add('strPriPayWayHasuuDesc05'         );
//<012> Mod
//// <011> Mod
////		cMemDataField.Add('nPriPayWaySite01'                );
//			cMemDataField.Add('nPriPayWaySite05'                );
//// <011> Mod
			cMemDataField.Add('strPriPayWaySite05'              );
//<012> Mod
			cMemDataField.Add('strReceiverName'                 );
// <006> 2006/10/11 H.Kawato Add End
			cMemDataField.Add('nInfo01AccountCode'              );
			cMemDataField.Add('strInfo01AccountCodeDesc'        );
			cMemDataField.Add('strInfo01DepositDesc01'          );
			cMemDataField.Add('strInfo01AccountNo01'            );
			cMemDataField.Add('nInfo01BankCode'                 );
			cMemDataField.Add('nInfo01BranchCode'               );
			cMemDataField.Add('strInfo01BankCodeDesc'           );
			cMemDataField.Add('strInfo01BranchCodeDesc'         );
			cMemDataField.Add('strInfo01BankCodeDescKana'       );
			cMemDataField.Add('strInfo01BranchCodeDescKana'     );
			cMemDataField.Add('strInfo01TranslationName'        );
			cMemDataField.Add('strInfo01DepositDesc02'          );
			cMemDataField.Add('strInfo01AccountNo02'            );
			cMemDataField.Add('strInfo01ComDivisionDesc'        );
			cMemDataField.Add('strInfo01ComCalculationDesc'     );
			cMemDataField.Add('strInfo01PayDivisionDesc'        );
			cMemDataField.Add('strAutoKbnDesc'                  );              // <005> 2006/08/08 H.Kawato Add
			cMemDataField.Add('nAccAutoData'                    );              // <005> 2006/08/08 H.Kawato Add
			cMemDataField.Add('strInfo01FBDivisionDesc'         );
			cMemDataField.Add('strInfo01VisitorCode01'          );
			cMemDataField.Add('strInfo01VisitorCode02'          );
			cMemDataField.Add('strInfo01EDIInfo'                );
			cMemDataField.Add('nInfo02AccountCode'              );
			cMemDataField.Add('strInfo02AccountCodeDesc'        );
			cMemDataField.Add('strInfo02DepositDesc01'          );
			cMemDataField.Add('strInfo02AccountNo01'            );
			cMemDataField.Add('nInfo02BankCode'                 );
			cMemDataField.Add('nInfo02BranchCode'               );
			cMemDataField.Add('strInfo02BankCodeDesc'           );
			cMemDataField.Add('strInfo02BranchCodeDesc'         );
			cMemDataField.Add('strInfo02BankCodeDescKana'       );
			cMemDataField.Add('strInfo02BranchCodeDescKana'     );
			cMemDataField.Add('strInfo02TranslationName'        );
			cMemDataField.Add('strInfo02DepositDesc02'          );
			cMemDataField.Add('strInfo02AccountNo02'            );
			cMemDataField.Add('strInfo02ComDivisionDesc'        );
			cMemDataField.Add('strInfo02ComCalculationDesc'     );
			cMemDataField.Add('strInfo02PayDivisionDesc'        );
			cMemDataField.Add('strInfo02FBDivisionDesc'         );
			cMemDataField.Add('strInfo02VisitorCode01'          );
			cMemDataField.Add('strInfo02VisitorCode02'          );
			cMemDataField.Add('strInfo02EDIInfo'                );
			cMemDataField.Add('nInfo02PaySight'                 );
			cMemDataField.Add('nInfo03AccountCode'              );
			cMemDataField.Add('strInfo03AccountCodeDesc'        );
			cMemDataField.Add('strInfo03DepositDesc'            );
			cMemDataField.Add('strInfo03AccountNo'              );
			cMemDataField.Add('strInfo03PosDivisionDesc'        );
			cMemDataField.Add('strInfo03BurDivisionDesc'        );
			cMemDataField.Add('nInfo03PaySight'                 );
			cMemDataField.Add('nInfo03DivSheets'                );
// <013> ADD-STR
			cMemDataField.Add('strERKbnDesc'                    );
			cMemDataField.Add('nInfo03BankCode'                 );
			cMemDataField.Add('nInfo03BranchCode'               );
			cMemDataField.Add('strInfo03BankCodeDesc'           );
			cMemDataField.Add('strInfo03BranchCodeDesc'         );
			cMemDataField.Add('strInfo03BankCodeDescKana'       );
			cMemDataField.Add('strInfo03BranchCodeDescKana'     );
			cMemDataField.Add('strInfo03TranslationName'        );
			cMemDataField.Add('strInfo03DepositDesc02'          );
			cMemDataField.Add('strInfo03AccountNo02'            );
			cMemDataField.Add('strInfo03ComDivisionDesc'        );
			cMemDataField.Add('strVFree1'                       );
			cMemDataField.Add('strVFree2'                       );
			cMemDataField.Add('strVFree3'                       );
			cMemDataField.Add('strVFree4'                       );
			cMemDataField.Add('strVFree5'                       );
// <013> ADD-END
			cMemDataField.Add('nInfo04AccountCode'              );
			cMemDataField.Add('strInfo04AccountCodeDesc'        );
			cMemDataField.Add('strInfo04DepositDesc'            );
			cMemDataField.Add('strInfo04AccountNo'              );
			cMemDataField.Add('strInfo04PosDivisionDesc'        );
			cMemDataField.Add('strInfo04BurDivisionDesc'        );
			cMemDataField.Add('nOffsetNo01'                     );
			cMemDataField.Add('nOffsetKmkCode01'                );
			cMemDataField.Add('strOffsetKmkCodeDesc01'          );
			cMemDataField.Add('strOffsetHojCode0101'            );
			cMemDataField.Add('strOffsetHojCodeDesc0101'        );
			cMemDataField.Add('strOffsetHojCode0201'            );
			cMemDataField.Add('strOffsetHojCodeDesc0201'        );
			cMemDataField.Add('strOffsetHojCode0301'            );
			cMemDataField.Add('strOffsetHojCodeDesc0301'        );
			cMemDataField.Add('nOffsetTaxCode01'                );
			cMemDataField.Add('strOffsetTaxRateDesc01'          );
			cMemDataField.Add('nOffsetPrice01'                  );
			cMemDataField.Add('nOffsetNo02'                     );
			cMemDataField.Add('nOffsetKmkCode02'                );
			cMemDataField.Add('strOffsetKmkCodeDesc02'          );
			cMemDataField.Add('strOffsetHojCode0102'            );
			cMemDataField.Add('strOffsetHojCodeDesc0102'        );
			cMemDataField.Add('strOffsetHojCode0202'            );
			cMemDataField.Add('strOffsetHojCodeDesc0202'        );
			cMemDataField.Add('strOffsetHojCode0302'            );
			cMemDataField.Add('strOffsetHojCodeDesc0302'        );
			cMemDataField.Add('nOffsetTaxCode02'                );
			cMemDataField.Add('strOffsetTaxRateDesc02'          );
			cMemDataField.Add('nOffsetPrice02'                  );
			cMemDataField.Add('nOffsetNo03'                     );
			cMemDataField.Add('nOffsetKmkCode03'                );
			cMemDataField.Add('strOffsetKmkCodeDesc03'          );
			cMemDataField.Add('strOffsetHojCode0103'            );
			cMemDataField.Add('strOffsetHojCodeDesc0103'        );
			cMemDataField.Add('strOffsetHojCode0203'            );
			cMemDataField.Add('strOffsetHojCodeDesc0203'        );
			cMemDataField.Add('strOffsetHojCode0303'            );
			cMemDataField.Add('strOffsetHojCodeDesc0303'        );
			cMemDataField.Add('nOffsetTaxCode03'                );
			cMemDataField.Add('strOffsetTaxRateDesc03'          );
			cMemDataField.Add('nOffsetPrice03'                  );
			cMemDataField.Add('nOffsetNo04'                     );
			cMemDataField.Add('nOffsetKmkCode04'                );
			cMemDataField.Add('strOffsetKmkCodeDesc04'          );
			cMemDataField.Add('strOffsetHojCode0104'            );
			cMemDataField.Add('strOffsetHojCodeDesc0104'        );
			cMemDataField.Add('strOffsetHojCode0204'            );
			cMemDataField.Add('strOffsetHojCodeDesc0204'        );
			cMemDataField.Add('strOffsetHojCode0304'            );
			cMemDataField.Add('strOffsetHojCodeDesc0304'        );
			cMemDataField.Add('nOffsetTaxCode04'                );
			cMemDataField.Add('strOffsetTaxRateDesc04'          );
			cMemDataField.Add('nOffsetPrice04'                  );
			cMemDataField.Add('nOffsetNo05'                     );
			cMemDataField.Add('nOffsetKmkCode05'                );
			cMemDataField.Add('strOffsetKmkCodeDesc05'          );
			cMemDataField.Add('strOffsetHojCode0105'            );
			cMemDataField.Add('strOffsetHojCodeDesc0105'        );
			cMemDataField.Add('strOffsetHojCode0205'            );
			cMemDataField.Add('strOffsetHojCodeDesc0205'        );
			cMemDataField.Add('strOffsetHojCode0305'            );
			cMemDataField.Add('strOffsetHojCodeDesc0305'        );
			cMemDataField.Add('nOffsetTaxCode05'                );
			cMemDataField.Add('strOffsetTaxRateDesc05'          );
			cMemDataField.Add('nOffsetPrice05'                  );
			cMemDataField.Add('nOffsetNo06'                     );
			cMemDataField.Add('nOffsetKmkCode06'                );
			cMemDataField.Add('strOffsetKmkCodeDesc06'          );
			cMemDataField.Add('strOffsetHojCode0106'            );
			cMemDataField.Add('strOffsetHojCodeDesc0106'        );
			cMemDataField.Add('strOffsetHojCode0206'            );
			cMemDataField.Add('strOffsetHojCodeDesc0206'        );
			cMemDataField.Add('strOffsetHojCode0306'            );
			cMemDataField.Add('strOffsetHojCodeDesc0306'        );
			cMemDataField.Add('nOffsetTaxCode06'                );
			cMemDataField.Add('strOffsetTaxRateDesc06'          );
			cMemDataField.Add('nOffsetPrice06'                  );
			cMemDataField.Add('nOffsetNo07'                     );
			cMemDataField.Add('nOffsetKmkCode07'                );
			cMemDataField.Add('strOffsetKmkCodeDesc07'          );
			cMemDataField.Add('strOffsetHojCode0107'            );
			cMemDataField.Add('strOffsetHojCodeDesc0107'        );
			cMemDataField.Add('strOffsetHojCode0207'            );
			cMemDataField.Add('strOffsetHojCodeDesc0207'        );
			cMemDataField.Add('strOffsetHojCode0307'            );
			cMemDataField.Add('strOffsetHojCodeDesc0307'        );
			cMemDataField.Add('nOffsetTaxCode07'                );
			cMemDataField.Add('strOffsetTaxRateDesc07'          );
			cMemDataField.Add('nOffsetPrice07'                  );
			cMemDataField.Add('nOffsetNo08'                     );
			cMemDataField.Add('nOffsetKmkCode08'                );
			cMemDataField.Add('strOffsetKmkCodeDesc08'          );
			cMemDataField.Add('strOffsetHojCode0108'            );
			cMemDataField.Add('strOffsetHojCodeDesc0108'        );
			cMemDataField.Add('strOffsetHojCode0208'            );
			cMemDataField.Add('strOffsetHojCodeDesc0208'        );
			cMemDataField.Add('strOffsetHojCode0308'            );
			cMemDataField.Add('strOffsetHojCodeDesc0308'        );
			cMemDataField.Add('nOffsetTaxCode08'                );
			cMemDataField.Add('strOffsetTaxRateDesc08'          );
			cMemDataField.Add('nOffsetPrice08'                  );
			cMemDataField.Add('nOffsetNo09'                     );
			cMemDataField.Add('nOffsetKmkCode09'                );
			cMemDataField.Add('strOffsetKmkCodeDesc09'          );
			cMemDataField.Add('strOffsetHojCode0109'            );
			cMemDataField.Add('strOffsetHojCodeDesc0109'        );
			cMemDataField.Add('strOffsetHojCode0209'            );
			cMemDataField.Add('strOffsetHojCodeDesc0209'        );
			cMemDataField.Add('strOffsetHojCode0309'            );
			cMemDataField.Add('strOffsetHojCodeDesc0309'        );
			cMemDataField.Add('nOffsetTaxCode09'                );
			cMemDataField.Add('strOffsetTaxRateDesc09'          );
			cMemDataField.Add('nOffsetPrice09'                  );
			cMemDataField.Add('nOffsetNo10'                     );
			cMemDataField.Add('nOffsetKmkCode10'                );
			cMemDataField.Add('strOffsetKmkCodeDesc10'          );
			cMemDataField.Add('strOffsetHojCode0110'            );
			cMemDataField.Add('strOffsetHojCodeDesc0110'        );
			cMemDataField.Add('strOffsetHojCode0210'            );
			cMemDataField.Add('strOffsetHojCodeDesc0210'        );
			cMemDataField.Add('strOffsetHojCode0310'            );
			cMemDataField.Add('strOffsetHojCodeDesc0310'        );
			cMemDataField.Add('nOffsetTaxCode10'                );
			cMemDataField.Add('strOffsetTaxRateDesc10'          );
			cMemDataField.Add('nOffsetPrice10'                  );
			cMemDataField.Add('strInfo03ComCalculationDesc'     );  //  <017>
(*
			cMemDataField.Add('strClassCodeDesc'                );
			cMemDataField.Add('strReceiverName'                 );
			cMemDataField.Add('nZipCodeUpper'                   );
			cMemDataField.Add('nZipCodeLower'                   );
			cMemDataField.Add('strTelephoneNo'                  );
			cMemDataField.Add('strAddressUpper'                 );
			cMemDataField.Add('strAddressLower'                 );
			cMemDataField.Add('strPostName'                     );
			cMemDataField.Add('strChargeName'                   );
			cMemDataField.Add('strResDivisionDesc'              );
			cMemDataField.Add('strPasDivisionDesc'              );
			cMemDataField.Add('strParentCode'                   );
			cMemDataField.Add('strParentCodeDesc'               );
			cMemDataField.Add('strSubstCode'                    );
			cMemDataField.Add('strSubstCodeDesc'                );
			cMemDataField.Add('nTaxCodeSales'                   );
			cMemDataField.Add('strTaxRateSalesDesc'             );
			cMemDataField.Add('nTaxCodeStock'                   );
			cMemDataField.Add('strTaxRateStockDesc'             );
			cMemDataField.Add('strFundCodeDebDesc'              );
			cMemDataField.Add('strFundCodeCreDesc'              );
			cMemDataField.Add('nPlanClosingDay01'               );
			cMemDataField.Add('strPlanExpectMonthDesc01'        );
			cMemDataField.Add('nPlanExpectDay01'                );
			cMemDataField.Add('strPlanHolDivisionDesc01'        );
			cMemDataField.Add('nPlanClosingDay02'               );
			cMemDataField.Add('strPlanExpectMonthDesc02'        );
			cMemDataField.Add('nPlanExpectDay02'                );
			cMemDataField.Add('strPlanHolDivisionDesc02'        );
			cMemDataField.Add('nPlanClosingDay03'               );
			cMemDataField.Add('strPlanExpectMonthDesc03'        );
			cMemDataField.Add('nPlanExpectDay03'                );
			cMemDataField.Add('strPlanHolDivisionDesc03'        );
*) // <004>
        end;
    end;

    if ( MjsFileOut(ds.DataSet, cMemDataField, cTitleField, PrnSupport, m_pRec) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    cTitleField.Free;
    cMemDataField.Free;

end;

// <015> ADD start
//------------------------------------------------------------------------------
// 外貨情報ファイル出力処理 <015>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppReportGaikaFileOut();
var
    cTitleField     :   TStringList;
    cMemDataField   :   TStringList;
    ds              :   TDataSource;
    strPrjCode      :   String;
    strPrjName      :   String;
begin

    cTitleField     :=  TStringList.Create;
    cMemDataField   :=  TStringList.Create;

    strPrjCode      := CmnDataSourcePrintGaika.DataSet.FieldByName ('strPrjMasterName').AsString + 'ｺｰﾄﾞ';
    strPrjName      := CmnDataSourcePrintGaika.DataSet.FieldByName ('strPrjMasterName').AsString + '名称';

    ds  :=  CmnDataSourcePrintGaika;

    cTitleField.Add('支払先ｺｰﾄﾞ'	                    );
    cTitleField.Add('支払先名称'                    	);
    if strPrjCode <> '' then
    begin
        cTitleField.Add(strPrjCode                 		);
        cTitleField.Add(strPrjName	  	                );
    end;
    cTitleField.Add('外貨支払情報: 採用区分'            );
    cTitleField.Add('外貨支払情報: 標準支払方法'        );
    // 電信送金情報
    cTitleField.Add('電信送金情報: 支払口座ｺｰﾄﾞ'    	);
    cTitleField.Add('電信送金情報: 支払口座名称'    	);
    cTitleField.Add('電信送金情報: 預金種目'    		);
    cTitleField.Add('電信送金情報: 口座番号'    		);

    cTitleField.Add('電信送金情報: 手数料支払口座ｺｰﾄﾞ' 	);
    cTitleField.Add('電信送金情報: 手数料支払口座名称' 	);
    cTitleField.Add('電信送金情報: 手数料預金種目'    	);
    cTitleField.Add('電信送金情報: 手数料口座番号'    	);

    cTitleField.Add('電信送金情報: 手数料負担'    		);
    cTitleField.Add('電信送金情報: 手数料計算区分'    	);

    //<016>ADD↓
    cTitleField.Add('電信送金情報: 取引先照会番号'		);

    cTitleField.Add('電信送金情報: 送金目的 No'			);
    cTitleField.Add('電信送金情報: 送金目的 内容' 		);

    cTitleField.Add('電信送金情報: 送金許可 No' 		);
    cTitleField.Add('電信送金情報: 送金許可 日付' 		);
    //<016>ADD↑

    // 為替手形情報
    cTitleField.Add('為替手形情報: 支払口座ｺｰﾄﾞ'    	);
    cTitleField.Add('為替手形情報: 支払口座名称'    	);
    cTitleField.Add('為替手形情報: 預金種目'    		);
    cTitleField.Add('為替手形情報: 口座番号'    		);

    // 送金小切手情報
    cTitleField.Add('送金小切手情報: 支払口座ｺｰﾄﾞ' 		);
    cTitleField.Add('送金小切手情報: 支払口座名称' 		);
    cTitleField.Add('送金小切手情報: 預金種目'			);
    cTitleField.Add('送金小切手情報: 口座番号'			);

    cTitleField.Add('送金小切手情報: 手数料支払口座ｺｰﾄﾞ');
    cTitleField.Add('送金小切手情報: 手数料支払口座名称');
    cTitleField.Add('送金小切手情報: 手数料預金種目'   	);
    cTitleField.Add('送金小切手情報: 手数料口座番号'   	);

    //<116>ADD↓
    cTitleField.Add('送金小切手情報: 送金目的 No'		);
    cTitleField.Add('送金小切手情報: 送金目的 内容' 	);

    cTitleField.Add('送金小切手情報: 送金許可 No' 		);
    cTitleField.Add('送金小切手情報: 送金許可 日付' 	);
    //<116>ADD↑
    
    // 電信送金情報－可変項目情報
    cTitleField.Add('電信送金情報－可変項目情報: ID'    );
    cTitleField.Add('電信送金情報－可変項目情報: 項目名');
    cTitleField.Add('電信送金情報－可変項目情報: 内容'	);

    cMemDataField.Add('strCode'                      	);
    cMemDataField.Add('strName'	                        );
    if strPrjCode <> '' then
    begin
        cMemDataField.Add('strPrjHojyoCode'             );
        cMemDataField.Add('strPrjHojyoName'            	);
    end;
    cMemDataField.Add('strInfo00GaikaUseDesc'           );
    cMemDataField.Add('strInfo00BasePaymentDesc'        );

    // 電信送金情報
	cMemDataField.Add('nInfo09AccountBank01'          	);	// 銀行コード
    cMemDataField.Add('strInfo09AccountBankName01'     	);	// 銀行名
	cMemDataField.Add('nInfo09AccountKbn01'             );	// 預金種目
    cMemDataField.Add('nInfo09AccountCode01'        	);	// 口座番号


	cMemDataField.Add('nInfo09AccountBank02'          	);	// 銀行コード
    cMemDataField.Add('strInfo09AccountBankName02'     	);	// 銀行名
	cMemDataField.Add('nInfo09AccountKbn02'             );	// 預金種目
    cMemDataField.Add('nInfo09AccountCode02'        	);	// 口座番号

    cMemDataField.Add('strInfo09ComDivisionDesc03'      );
    cMemDataField.Add('strInfo09ComCalculationDesc04'   );

    //<016>ADD↓
    cMemDataField.Add('strInfo09CustomerInquiryNo06'	);	// 取引先照会番号

    cMemDataField.Add('strInfo09PayHeadingNo07'			);	// 送金目的No
    cMemDataField.Add('strInfo09SendPurpose08'			);	// 送金目的内容

    cMemDataField.Add('strInfo09PermLicenceNo09'		);	// 送金許可No
    cMemDataField.Add('strInfo09PermDate10'				);	// 送金許可日付
    //<016>ADD↑

    // 為替手形情報
	cMemDataField.Add('nInfo10AccountBank01'          	);	// 銀行コード
    cMemDataField.Add('strInfo10AccountBankName01'     	);	// 銀行名
	cMemDataField.Add('nInfo10AccountKbn01'             );	// 預金種目
    cMemDataField.Add('nInfo10AccountCode01'        	);	// 口座番号

    // 送金小切手情報
	cMemDataField.Add('nInfo10AccountBank02'          	);	// 銀行コード
    cMemDataField.Add('strInfo10AccountBankName02'     	);	// 銀行名
	cMemDataField.Add('nInfo10AccountKbn02'             );	// 預金種目
    cMemDataField.Add('nInfo10AccountCode02'        	);	// 口座番号

  	cMemDataField.Add('nInfo10AccountBank03'          	);	// 銀行コード
    cMemDataField.Add('strInfo10AccountBankName03'     	);	// 銀行名
	cMemDataField.Add('nInfo10AccountKbn03'             );	// 預金種目
    cMemDataField.Add('nInfo10AccountCode03'        	);	// 口座番号

    //<016>ADD↓
    cMemDataField.Add('strInfo10PayHeadingNo04'			);	// 送金目的No
    cMemDataField.Add('strInfo10SendPurpose05'			);	// 送金目的内容

    cMemDataField.Add('strInfo10PermLicenceNo06'		);	// 送金許可No
    cMemDataField.Add('strInfo10PermDate07'				);	// 送金許可日付
    //<016>ADD↑

    // 電信送金情報－可変項目情報
    cMemDataField.Add('ItemID'                			);
    cMemDataField.Add('SimpleName'            			);
    cMemDataField.Add('ItemValue'          				);

    if ( MjsFileOut(ds.DataSet, cMemDataField, cTitleField, PrnSupport, m_pRec) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    cTitleField.Free;
    cMemDataField.Free;

end;
// <015> ADD end

// <MTA> Add st
//------------------------------------------------------------------------------
// 振込情報登録ファイル出力処理 <MTA>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppReportFurikomiFileOut();
var
    cTitleField     :   TStringList;
    cMemDataField   :   TStringList;
    ds              :   TDataSource;
begin

    cTitleField     :=  TStringList.Create;
    cMemDataField   :=  TStringList.Create;

    ds  :=  DSFurikomi;

	// 振込支払情報登録
    cTitleField.Add('支払先ｺｰﾄﾞ'	        );
//<018> mod st
//  cTitleField.Add('支払先正式名称'        );
    cTitleField.Add('支払先簡略名称'        		);
//<018> mod end
    cTitleField.Add('振込依頼口座ｺｰﾄﾞ'      );
    cTitleField.Add('振込依頼口座名称'      );
    cTitleField.Add('預金種目'      	    );
    cTitleField.Add('口座番号'     		    );
    cTitleField.Add('NO'     				);
    cTitleField.Add('全銀協ｺｰﾄﾞ'      	    );
    cTitleField.Add('支店ｺｰﾄﾞ'     		    );
    cTitleField.Add('銀行名称'        	    );
    cTitleField.Add('支店名称'        	    );
    cTitleField.Add('銀行名(ｶﾅ)'      	    );
    cTitleField.Add('支店名(ｶﾅ)'      	    );
    cTitleField.Add('振込先(ｶﾅ)'      	    );
    cTitleField.Add('預金種目'       	    );
    cTitleField.Add('口座番号'       	    );
    cTitleField.Add('手数料負担区分' 	    );
    cTitleField.Add('手数料計算区分'  	    );
    cTitleField.Add('振込方法'        	    );
    cTitleField.Add('口座自動引落区分' 	    );
    cTitleField.Add('引落支払データ'     	);

	case PrnSupport.iCommand of
    	PDLG_PRINT,PDLG_PREVIEW:   //印刷、プレビューでは取引先コード、取引先名称先頭行以外不要
        begin
    		cMemDataField.Add('GCode'		);
    		cMemDataField.Add('SimpleName'  );
        end;
		PDLG_FILE:                 //印刷、プレビューでは取引先コード、取引先名称表示
        begin
    		cMemDataField.Add('FGCode'		);
    		cMemDataField.Add('FSimpleName'	);
        end;
    end;
    cMemDataField.Add('IraiAccNo'		    );
    cMemDataField.Add('IraiAccName'	    );
    cMemDataField.Add('ShiAccKbnName'	    );
    cMemDataField.Add('ShiAccNo'		    );
    cMemDataField.Add('Edaban'		        );
    cMemDataField.Add('BankCode'		    );
    cMemDataField.Add('BkBraCode'	    	);
    cMemDataField.Add('BankName'		    );
    cMemDataField.Add('BkBraName'		    );
    cMemDataField.Add('BankKanaName'	    );
    cMemDataField.Add('BraKanaName'		);
    cMemDataField.Add('TransKanaName'	    );
    cMemDataField.Add('HuriAccKbnName'	    );
    cMemDataField.Add('HuriAccKbnNo'	    );
    cMemDataField.Add('ChargeFutanName'	);
    cMemDataField.Add('ChargeKbnName'	    );
    cMemDataField.Add('TransKbn'		    );
    cMemDataField.Add('AutoKbnData'  	    );
    cMemDataField.Add('AccAutoData'  	    );

    if ( MjsFileOut(ds.DataSet, cMemDataField, cTitleField, PrnSupport, m_pRec) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    cTitleField.Free;
    cMemDataField.Free;

end;
// <MTA> Add end

//------------------------------------------------------------------------------
// プレビューの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004006L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理  <004>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP004006L.fnInzPrint();
var
    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;
begin

	// 支払先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
    begin
        case uvHani.pvrPattern of
            0:  CmnReportDetailDBTextHojCode.Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
			2:  DBTxt_Furikomi_GCode     .Alignment  	:=  taLeftJustify;  // 左寄せ(文字属性) //<MTA> Add
        end;
   	end
    else
    begin
        case uvHani.pvrPattern of
            0:  CmnReportDetailDBTextHojCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
			2:  DBTxt_Furikomi_GCode   .Alignment  		:=  taRightJustify; // 右寄せ(数値属性) //<MTA> Add
        end;
    end;

// <015> ADD start
	if uvHani.pvrPattern = 1 then			// 外貨情報
    begin
    	if CmnDataSourcePrintGaika.DataSet.RecordCount > 0 then
        begin
        	// プロジェクトマスタ名
			ppLabelGaikaPrjName.Caption := CmnDataSourcePrintGaika.DataSet.FieldByName ('strPrjMasterName').AsString;
        end;
    end;
// <015> ADD end
//<MTA> Add st
	if uvHani.pvrPattern = 2 then			// 振込情報
    begin
        LabelTitle2.Caption :=  '振込支払情報登録リスト';
        LabelWay.Caption    :=  '振込方法';
        DBTextTransKbn_F.Visible := TRUE;
        DBTextTransKbn_D.Visible := FALSE;
        DBTextSite_D.Visible	 := FALSE;
       	LabelSite.Visible		 := FALSE;
    end;
//<MTA> Add end
    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
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
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
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
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
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
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
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
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
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
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
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
// ディテイルバンド印刷前処理   <004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
    strGroup		: String;		// <015> ADD
    objMem			: TdxMemData;	// <015> ADD
begin

    DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [uvHani.pvrPattern])));
    DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvHani.pvrPattern])));

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
		DtlBottomLine.Weight     :=	0.25;
	end;

// <015> ADD start
	if uvHani.pvrPattern = 1 then			// 外貨情報
    begin
    	ppLineDetailTop.Visible := False;
    	objMem := TdxMemData(CmnDataSourcePrintGaika.DataSet);
    	if objMem.RecNo > 1 then
        begin
        	objMem.Prior;
            strGroup := objMem.FieldByName('strGroup').AsString;
            objMem.Next;

            // カラムが変わって前の行とグループが同じ場合、詳細の上線を出力する
            // （グループヘッダが出力されないと上線がないため）
            if (strGroup = objMem.FieldByName('strGroup').AsString) and
            	(m_bDetailTopVisible) then
            begin
                ppLineDetailTop.Visible := True;
                m_bDetailTopVisible := False;
            end;
        end;
    end;
// <015> ADD end
end;

//------------------------------------------------------------------------------
// ディテイルバンド印刷前処理(支払先登録リスト(詳細))
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppDetailBand0BeforeGenerate(Sender: TObject);
var		i 			: Integer;
//		nPosition	: Integer;				// <015> DEL
		pL			: TppLabel;
begin
// <005> 2006/08/08 H.Kawato Add Start
    if (dsShousaiJ.DataSet.FieldByName ('nPrjAdoptKbn').AsInteger = 0) then
        ppDBTextPrjTitle.Visible    := False
    else
        ppDBTextPrjTitle.Visible    := True;
{
    if (dsShousaiJ.DataSet.FieldByName ('nPjSubAdoptKbn').AsInteger = 0) then
        ppDBTextPjSubTitle.Visible    := False
    else
        ppDBTextPjSubTitle.Visible    := True;
}

// <008> 2007/12/13 H.Kawato Add Start
    if (not dsShousaiJ.DataSet.FieldByName ('strSateiCalcKbnDesc').IsNull ) then
    begin
        if (Trim(dsShousaiJ.DataSet.FieldByName ('strSateiCalcKbnDesc').AsString) = '比率' ) then
            CmnReportDetailDBTextSateiCalcValue.DisplayFormat       := '0.#0'
        else
        if (Trim(dsShousaiJ.DataSet.FieldByName ('strSateiCalcKbnDesc').AsString) = '定額' ) then
            CmnReportDetailDBTextSateiCalcValue.DisplayFormat       := '#,##0'
        else
            CmnReportDetailDBTextSateiCalcValue.DisplayFormat       := '#,###';
    end;
// <008> 2007/12/13 H.Kawato Add End

    if (not dsShousaiJ.DataSet.FieldByName ('strDecDivisionDesc').IsNull )
    and (Trim(dsShousaiJ.DataSet.FieldByName ('strDecDivisionDesc').AsString) = '比率' ) then
    begin
        CmnReportDetailDBTextPaymentBasedValue01.DisplayFormat  := '0.#0';
        CmnReportDetailDBTextPaymentBasedValue02.DisplayFormat  := '0.#0';
        CmnReportDetailDBTextPaymentBasedValue03.DisplayFormat  := '0.#0';
        CmnReportDetailDBTextPaymentBasedValue04.DisplayFormat  := '0.#0';
        CmnReportDetailDBTextPaymentBasedValue05.DisplayFormat  := '0.#0';
        CmnReportDetailDBTextPaymentBasedHiritu01.DisplayFormat := '0.#0';
        CmnReportDetailDBTextPaymentBasedHiritu02.DisplayFormat := '0.#0';
        CmnReportDetailDBTextPaymentBasedHiritu03.DisplayFormat := '0.#0';
        CmnReportDetailDBTextPaymentBasedHiritu04.DisplayFormat := '0.#0';
        CmnReportDetailDBTextPaymentBasedHiritu05.DisplayFormat := '0.#0';
    end
    else
    begin
        CmnReportDetailDBTextPaymentBasedValue01.DisplayFormat  := '#,##0';
        CmnReportDetailDBTextPaymentBasedValue02.DisplayFormat  := '#,##0';
        CmnReportDetailDBTextPaymentBasedValue03.DisplayFormat  := '#,##0';
        CmnReportDetailDBTextPaymentBasedValue04.DisplayFormat  := '#,##0';
        CmnReportDetailDBTextPaymentBasedValue05.DisplayFormat  := '#,##0';
        CmnReportDetailDBTextPaymentBasedHiritu01.DisplayFormat := '#,##0';
        CmnReportDetailDBTextPaymentBasedHiritu02.DisplayFormat := '#,##0';
        CmnReportDetailDBTextPaymentBasedHiritu03.DisplayFormat := '#,##0';
        CmnReportDetailDBTextPaymentBasedHiritu04.DisplayFormat := '#,##0';
        CmnReportDetailDBTextPaymentBasedHiritu05.DisplayFormat := '#,##0';
    end;
// <005> 2006/08/08 H.Kawato Add End

// <006> 2006/10/11 H.Kawato Del Start
{
    // 郵便番号の「－」
    if (not dsShousaiJ.DataSet.FieldByName ('nZipCodeUpper').IsNull )
    and (dsShousaiJ.DataSet.FieldByName ('nZipCodeUpper').AsInteger <> 0 ) then
    begin
		ppLabel186.Visible := True;
        ppDBText301.DisplayFormat := '000';
        ppDBText302.DisplayFormat := '0000';
    end
    else
    begin
		ppLabel186.Visible := False;
        ppDBText301.DisplayFormat := '#';
	    if (not dsShousaiJ.DataSet.FieldByName ('nZipCodeLower').IsNull )
    	and (dsShousaiJ.DataSet.FieldByName ('nZipCodeLower').AsInteger <> 0 ) then
	        ppDBText302.DisplayFormat := '0000'
        else
	        ppDBText302.DisplayFormat := '#';
    end;
}
// <149> 2006/10/11 H.Kawato Del End

    // 全銀協コードの「－」
    if (not dsShousaiJ.DataSet.FieldByName ('nInfo01BankCode').IsNull )
    and (dsShousaiJ.DataSet.FieldByName ('nInfo01BankCode').AsInteger <> 0 ) then
    begin
		ppLabel165.Visible := True;
        ppDBText121.DisplayFormat := '0000';
        ppDBText144.DisplayFormat := '000';
    end
    else
    begin
		ppLabel165.Visible := False;
        ppDBText121.DisplayFormat := '#';
	    if (not dsShousaiJ.DataSet.FieldByName ('nInfo01BranchCode').IsNull )
    	and (dsShousaiJ.DataSet.FieldByName ('nInfo01BranchCode').AsInteger <> 0 ) then
	        ppDBText144.DisplayFormat := '000'
        else
	        ppDBText144.DisplayFormat := '#';
    end;

    if (not dsShousaiJ.DataSet.FieldByName ('nInfo02BankCode').IsNull )
    and (dsShousaiJ.DataSet.FieldByName ('nInfo02BankCode').AsInteger <> 0 ) then
    begin
		ppLabel166.Visible := True;
        ppDBText124.DisplayFormat := '0000';
        ppDBText145.DisplayFormat := '000';
    end
    else
    begin
		ppLabel166.Visible := False;
        ppDBText124.DisplayFormat := '#';
	    if (not dsShousaiJ.DataSet.FieldByName ('nInfo02BranchCode').IsNull )
    	and (dsShousaiJ.DataSet.FieldByName ('nInfo02BranchCode').AsInteger <> 0 ) then
	        ppDBText145.DisplayFormat := '000'
        else
	        ppDBText145.DisplayFormat := '#';
    end;

    // 振込サイトの「日」
    if (not dsShousaiJ.DataSet.FieldByName ('nInfo02PaySight').IsNull ) then
		ppLabel168.Visible := True
    else
		ppLabel168.Visible := False;

    // 手形サイトの「日」
    if (not dsShousaiJ.DataSet.FieldByName ('nInfo03PaySight').IsNull ) then
		ppLabel173.Visible := True
    else
		ppLabel173.Visible := False;

    // 手形分割枚数の「枚」
    if (not dsShousaiJ.DataSet.FieldByName ('nInfo03DivSheets').IsNull ) then
		ppLabel174.Visible := True
    else
		ppLabel174.Visible := False;

	// 相殺金額の「円」
	for i := 1 to 10 do
    begin
    	if i = 1 then
        	pL := ppLabel176
        else if i = 2 then
        	pL := ppLabel179
        else if i = 3 then
        	pL := ppLabel182
        else if i = 4 then
        	pL := ppLabel183
        else if i = 5 then
        	pL := ppLabel184
        else if i = 6 then
        	pL := ppLabel185
        else if i = 7 then
        	pL := ppLabel181
        else if i = 8 then
        	pL := ppLabel180
        else if i = 9 then
        	pL := ppLabel178
        else
        	pL := ppLabel177;

	    if (not dsShousaiJ.DataSet.FieldByName ('nOffsetPrice' + Format('%.2d',[i])).IsNull ) then
			pL.Visible := True
	    else
			pL.Visible := False;
    end;
// <013> DEL-STR
{    // ↓↓↓<003>
    for i:=1 to 10 do
    begin
		for	nPosition := 1 to 3 do
    	begin
			if dsShousaiJ.DataSet.FieldByName (Format ('nOffsetAttribute%.2d%.2d',
												[nPosition, i])).AsInteger	= 2 then
				TppDBText (MJSFindCtrl (Self, Format ('CmnReportDetailDBTextOffsetHojCode%.2d%.2d'  , [nPosition, i]))).Alignment := taLeftJustify
			else
				TppDBText (MJSFindCtrl (Self, Format ('CmnReportDetailDBTextOffsetHojCode%.2d%.2d'  , [nPosition, i]))).Alignment := taRightJustify;
        end;
    end;
    // ↑↑↑<003>}
// <013> DEL-END
end;

// <015> ADD start
//------------------------------------------------------------------------------
// 外貨情報 カラムが変わった時　<015>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.CmnReportGaikaStartColumn(Sender: TObject);
begin
   	m_bDetailTopVisible := True;
end;

//------------------------------------------------------------------------------
// 外貨情報　グループヘッダを出力する前 <015>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004006L.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
   	m_bDetailTopVisible := False;
end;

// <015> ADD end


end.


