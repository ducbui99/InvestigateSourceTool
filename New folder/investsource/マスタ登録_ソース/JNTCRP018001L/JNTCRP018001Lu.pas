//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：工事/プロジェクト登録(印刷処理)
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
//  <001>   加藤(PRIME) 2006/01/12(THU) 帳票・ﾌｧｲﾙ出力の出力項目修正
//  <002>   加藤(PRIME) 2006/01/12(THU) 計上基準区分は画面を有効にするまで保留とする（帳票・ﾌｧｲﾙ）
//  <003>   加藤(PRIME) 2006/01/17(TUE) 実在簡略・合計簡略・合計詳細を出力
//  <004>   加藤(PRIME) 2006/03/08(WED) 受注先名称対応(一部ｺﾝﾄﾛｰﾙ名変更)
//  <005>   加藤(PRIME) 2006/03/08(WED) 実在詳細帳票に備考追加
//  <006>   H.Endo(MJS) 2006/06/21		CSV出力時に税率名が表示されない(1.04不具合一覧表:No.17,20)
//  <007>   H.Endo(MJS) 2006/06/21		受注者→受注先に変更(1.04不具合一覧表:No.19)
//  <008>   H.Endo(MJS) 2006/06/22		ﾌﾟﾛｼﾞｪｸﾄと工事の切り分けがうまくいってない
//											※｢ppReportShosaiJ_Prj｣作成
//  <009>   H.Endo(MJS) 2006/06/26		分類帳票追加
//
//  <   >   鈴木(PRIME) 2007/07/12(THU) ｺｰﾄﾞ16桁対応
//  <010>	鈴木(PRIME) 2008/05/15(THU) J-SOX印刷履歴対応
//  <011>   T.Miyagi(RIT) 2008/06/25(THU) 323027 建設工事業改良
//                                      　2-3　工事マスタと受注マスタ連携に伴う改良
//  <012>   T.Miyagi(RIT) 2008/08/04(MON) 合計工事に備考・概要追加
//  <013>   T.Miyagi(RIT) 2008/09/26(FRI) 「備考・概要」の表示順を「概要・備考」に変更
//  <014>   T.Miyagi(RIT) 2008/10/27(MON) 契約情報MAX999件に増加に伴い
//                                          「ppReportKeiyakuKJ」・「ppReportKeiyaku」・「ppReportNyukin」作成
//  <015>   T.Miyagi(RIT) 2008/10/27(MON) 売上高自動振替区分の追加
//  <016>   T.Miyagi(RIT) 2009/03/18(WED) プロジェクト登録工事大将対応
//  <017>   T.Miyagi(RIT) 2009/10/30(FRI) 施行→施工に変更
//****** Ver4.01 **************************************************************************************
//  <018>   T.Ogawa(RIT)  2010/08/17(TUE) 合計プロジェクトのラベルキャプションが「工事情報」になっているのを修正
//  <019>   T.Ogawa(RIT)  2010/08/23(MON) プロジェクトの場合、ファイル出力(実在-詳細リスト)の作業内訳のキャプションがおかしかったのを修正
//****** Ver4.02 **************************************************************************************
//  <020>   T.Ogawa(RIT)  2010/10/07(THU) ファイル出力のタイトル項目が工事固定になっているところを修正
//****** Ver4.05(個別) ********************************************************************************
//  <021>   K.Katou(PRIME)2011/06/14(TUE) 加算登録リスト追加
//  <022>   K.Katou(PRIME)2011/06/22(WED) 分類･セグメント帳票のタイトルが枠に重なっているのを修正(ヘッダの高さ変更)
//      								  ppReportSegBunにBeforePrintイベントがなかった
//****** Ver5.02 **************************************************************************************
//	<023>	M.Makino(MJS) 2012/07/04(WED) 工事大将ライセンスありの場合以外、詳細型の「施主」を非表示するよう修正。
//  <024>   A.Chou(MJS)   2012/07/19(THU) プロジェクト完成振替対応
//  <   >   A.Chou(MJS)   2012/07/23(MON) GalileoptNX-1プロジェクト登録の場合、売上計上区分を帳票に表示
//****** Ver5.03 **************************************************************************************
//	<025>	M.Makino(MJS) 2012/09/13(WED) 「施主」項目の非表示について、工事ライセンスに加え、新たにAPGファイルによる判断もするよう修正。
//****** MLX 固定資産**********************************************************************************
//	<MLXDEP>K.Iwata(NTC)  2013/01/15(TUE) MLX固定資産・リース対応
//****** Ver5.04 **************************************************************************************
//  <>      T.Ogawa(LEAD) 2013/07/16(TUE) MLX対応の<MLXDEP>は2014/01リリースまでコメントアウト
//  <TAX>   T.Ogawa(LEAD) 2013/07/16(TUE) 消費税(経過措置)対応。
//  <>      T.Ogawa(LEAD) 2013/07/29(MON) MLX対応の<MLXDEP>コメントアウト解除
//
//****** Ver5.07 **************************************************************************************
//  <>      T.Ogawa(LEAD) 2014/09/12(FRI) １６桁コード拡張(プロパティのみ修正)
//  <026>   S.Sawanobori(Impress) 2020/12/01 収益認識基準対応
//=============================================================================
unit JNTCRP018001Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
//@
  FXLicense,	// <023> ADD
    JNTSelError,
    SeriesCheckU, // <024> ADD
    Vcl.Samples.Calendar, ppStrtch, ppMemo, ppDesignLayer, ppParameter;

type
	AdoptInfo = Record	nMasterDivision: Integer;	        // ﾏｽﾀ区分
			   			nAdoption	   : Integer;	        // 採用区分
			   			nCodeDigit	   : Integer;	        // ｺｰﾄﾞ桁数
			   			nCodeAttribute : Integer;	        // ｺｰﾄﾞ属性
			   			strDescription : String;	        // 名称
    end;

type
//<TAX> ADD St
  // 再定義
  TJNTHani = record
    // Iniﾌｧｲﾙ名
    pvDlgIniFile    :   String;						// ﾀﾞｲｱﾛｸﾞ用Iniﾌｧｲﾙ名
    pvPrgID         :   String;                     // ﾌﾟﾛｸﾞﾗﾑID

    pvMasterKbn     :   Integer;
    pvHojyoName     :   String;

    // Return用兼表示ﾃﾞｰﾀ保存用
    pvrRepTitle     :   String;                     // 帳票ﾀｲﾄﾙ
    pvrStDate       :	Integer;			        // 開始日付
    pvrEdDate       :	Integer;			        // 終了日付

    pvrStDate2       :	Integer;			        // 開始日付(予定終了日)
    pvrEdDate2       :	Integer;			        // 終了日付(予定終了日)
    pvrPattern      :	Integer;					// 印刷ﾊﾟﾀｰﾝ
    pvrOrder        :	Integer;					// 出力順序1
    pvrOrderNM      :	String;					    // 出力順序1名

    pvrYearKbn      :   Integer;                    // 和暦/西暦区分

    pvrRgType       :   array of Integer;           // 範囲指定の種類（0-2）
    pvrStCode       :	array of String;			// 開始ｺｰﾄﾞ
    pvrStName       :	array of String;			// 開始名称
    pvrEdCode       :	array of String;			// 終了ｺｰﾄﾞ
    pvrEdName       :	array of String;			// 終了名称

    pvrWhere        :	array of String;			// Where条件

    pvrCodeCnt      :	Integer;					// ｺｰﾄﾞ個数

    pvrShokei       :	Boolean;					// 小計毎に改頁
    pvrTemplate     :	Boolean;					// 直接印刷する
    pvrNayoseOya    :   Boolean;                    // 名寄せ親を除く
    pvrNayoseKo     :   Boolean;                    // 名寄せ子を除く
    UseTokui        :   Boolean;                    // 得意先採用
    UseSiire        :   Boolean;                    // 仕入先採用
    UseNashi        :   Boolean;                    // 採用無し


    // 内部的に使用する項目
    SelSys           :	TJNTSelCorpSys;				// 会社ｼｽﾃﾑ情報
    UseDb           :	TFDConnection;					// ﾃﾞｰﾀﾍﾞｰｽ
    pMjsAppRec      :   ^TMjsAppRecord;             // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ

    // 帳票に使用する項目
    MJSPrnDlgf	    :	TMJSPrnDlgf;				// 印刷ﾀﾞｲｱﾛｸﾞ
    PrnSupport      :	TMjsPrnSupport;				// 印刷設定
    mjspre		    :	TMjsPreviewIF;				// ﾌﾟﾚﾋﾞｭｰ
  end;
//<TAX> ADD Ed
{$include JNTSelPrtIF.inc}

  TDmJNTCRP018001L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    ppReportKaniJ: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLabel61: TppLabel;
    ppLabel86: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppLine94: TppLine;
    ppDBText14: TppDBText;
    ppDBText53: TppDBText;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine108: TppLine;
    RImageJitsuFusen: TppDBImage;
    ppDBText16: TppDBText;
    ppDBText52: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand5: TppFooterBand;
    SVppPage0: TppSystemVariable;
    AccOffice0: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    LJitsu_Kensu: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppReportKaniG: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    LineTitle2: TppLine;
    SVppDate2: TppSystemVariable;
    CorpCode2: TppLabel;
    CorpName2: TppLabel;
    LabelTitle2: TppLabel;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    SVppPage2: TppSystemVariable;
    AccOffice2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    LGou_Kensu: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppReportShosaiG: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    CorpCode3: TppLabel;
    CorpName3: TppLabel;
    LabelTitle3: TppLabel;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape3: TppShape;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppLabel81: TppLabel;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText82: TppDBText;
    ppDBTxtGCustomerCode: TppDBText;
    ppDBText85: TppDBText;
    ppDBTxtGCustomerCodeName: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppTantoG: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel98: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine75: TppLine;
    ppLine77: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppDBText98: TppDBText;
    ppLabel109: TppLabel;
    ppLine105: TppLine;
    ppLabel110: TppLabel;
    ppLine106: TppLine;
    ppLine107: TppLine;
    ppLabel111: TppLabel;
    ppLine109: TppLine;
    ppLine110: TppLine;
    ppLabel112: TppLabel;
    ppLine111: TppLine;
    ppLabel113: TppLabel;
    ppLine112: TppLine;
    ppLabel114: TppLabel;
    ppLine113: TppLine;
    ppLabel115: TppLabel;
    ppLine114: TppLine;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppLine123: TppLine;
    ppLabel129: TppLabel;
    ppLine127: TppLine;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppLine99: TppLine;
    ppDBTxtGCustomerName: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppLine15: TppLine;
    ppBmnG: TppLabel;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppLine60: TppLine;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppDBText181: TppDBText;
    ppDBText182: TppDBText;
    ppDBText183: TppDBText;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel59: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel90: TppLabel;
    ppLine61: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine142: TppLine;
    ppLine143: TppLine;
    ppLine144: TppLine;
    ppLine146: TppLine;
    ppLine147: TppLine;
    ppLine148: TppLine;
    ppLabel91: TppLabel;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppDBText195: TppDBText;
    ppDBText196: TppDBText;
    ppDBText197: TppDBText;
    ppDBText198: TppDBText;
    ppDBText199: TppDBText;
    ppDBText200: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppDBText204: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppDBText207: TppDBText;
    ppDBText208: TppDBText;
    ppDBText209: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText214: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppLine124: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand3: TppFooterBand;
    SVppPage3: TppSystemVariable;
    AccOffice3: TppLabel;
    ppReportShosaiJ: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    LineTitle1: TppLine;
    SVppDate1: TppSystemVariable;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    pDT_Code: TppDBText;
    pDT_Seishiki: TppDBText;
    pDT_Kanryaku: TppDBText;
    pDT_Renso: TppDBText;
    RImageZitsuSFusen: TppDBImage;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel15: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBTxtJCustomerCode: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBTxtJCustomerCodeName: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel33: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppKanFuriBmnJ: TppLabel;
    ppTantoJ: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine14: TppLine;
    ppLine22: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppDBText29: TppDBText;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLine16: TppLine;
    ppLabel37: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel38: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel39: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLine24: TppLine;
    ppLabel41: TppLabel;
    ppLine44: TppLine;
    ppLabel43: TppLabel;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLabel68: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine58: TppLine;
    ppDBText31: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppLabel74: TppLabel;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppLabelTokusyu: TppDBText;
    ppDBText81: TppDBText;
    ppDBText84: TppDBText;
    ppDBText90: TppDBText;
    ppDBText21: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppLabel14: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine102: TppLine;
    ppLine139: TppLine;
    ppLabel48: TppLabel;
    ppLine140: TppLine;
    ppLabel49: TppLabel;
    ppLine141: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
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
    ppLine62: TppLine;
    ppLine59: TppLine;
    ppLabel50: TppLabel;
    ppLine93: TppLine;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel99: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    SVppPage1: TppSystemVariable;
    AccOffice1: TppLabel;
    ppLabel79: TppLabel;
    ppDBText30: TppDBText;
    ppLabel80: TppLabel;
    ppLabel105: TppLabel;
    ppDBText100: TppDBText;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel116: TppLabel;
    ppLabel42: TppLabel;
    ppLabel117: TppLabel;
    ppLine1: TppLine;
    ppLine11: TppLine;
    ppLabel119: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine23: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine70: TppLine;
    ppLine88: TppLine;
    ppShape5: TppShape;
    ppLine125: TppLine;
    ppLine126: TppLine;
    ppLine128: TppLine;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppLabel118: TppLabel;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText218: TppDBText;
    ppDBText219: TppDBText;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText224: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText229: TppDBText;
    ppDBText230: TppDBText;
    ppDBText231: TppDBText;
    ppDBText232: TppDBText;
    ppDBText233: TppDBText;
    ppDBText234: TppDBText;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppDBText237: TppDBText;
    ppDBText238: TppDBText;
    ppDBText239: TppDBText;
    ppDBText240: TppDBText;
    ppDBText241: TppDBText;
    ppDBText242: TppDBText;
    ppDBText243: TppDBText;
    ppDBText244: TppDBText;
    ppDBText245: TppDBText;
    ppDBText246: TppDBText;
    ppDBText247: TppDBText;
    ppDBText248: TppDBText;
    ppDBText249: TppDBText;
    ppDBText250: TppDBText;
    ppDBText251: TppDBText;
    ppDBText252: TppDBText;
    ppDBText253: TppDBText;
    ppDBText254: TppDBText;
    ppDBText255: TppDBText;
    ppDBText256: TppDBText;
    ppDBText257: TppDBText;
    ppDBText258: TppDBText;
    ppDBText259: TppDBText;
    ppDBText260: TppDBText;
    ppDBText261: TppDBText;
    ppDBText262: TppDBText;
    ppDBText263: TppDBText;
    ppDBText264: TppDBText;
    ppDBText265: TppDBText;
    ppDBText266: TppDBText;
    ppDBText267: TppDBText;
    ppDBText268: TppDBText;
    ppDBText269: TppDBText;
    ppDBText270: TppDBText;
    ppDBText271: TppDBText;
    ppDBText272: TppDBText;
    ppDBText273: TppDBText;
    ppDBText274: TppDBText;
    ppDBText275: TppDBText;
    ppDBText276: TppDBText;
    ppDBText277: TppDBText;
    ppDBText278: TppDBText;
    ppDBText279: TppDBText;
    ppDBText280: TppDBText;
    ppDBText281: TppDBText;
    ppDBText282: TppDBText;
    ppDBText283: TppDBText;
    ppDBText284: TppDBText;
    ppDBText285: TppDBText;
    ppDBText286: TppDBText;
    ppDBText287: TppDBText;
    ppDBText288: TppDBText;
    ppDBText289: TppDBText;
    ppDBText290: TppDBText;
    ppDBText291: TppDBText;
    ppDBText292: TppDBText;
    ppDBText293: TppDBText;
    ppDBText294: TppDBText;
    ppDBText295: TppDBText;
    ppDBText296: TppDBText;
    ppLine129: TppLine;
    ppLine130: TppLine;
    ppLine131: TppLine;
    ppDBText297: TppDBText;
    ppDBText298: TppDBText;
    ppDBText299: TppDBText;
    ppDBText300: TppDBText;
    ppDBText301: TppDBText;
    ppDBText302: TppDBText;
    ppDBText303: TppDBText;
    ppDBText304: TppDBText;
    ppDBText305: TppDBText;
    ppDBText306: TppDBText;
    ppDBText307: TppDBText;
    ppDBText308: TppDBText;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    ppLabel122: TppLabel;
    ppLabel108: TppLabel;
    ppLabel_Info: TppLabel;
    ppLabel85: TppLabel;
    ppDBText75: TppDBText;
    ppDBText99: TppDBText;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    pplblType0: TppLabel;
    pplblType2: TppLabel;
    pplblType1: TppLabel;
    pplblType3: TppLabel;
    ppLine71: TppLine;
    ppLine74: TppLine;
    ppLine76: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppDBText310: TppDBText;
    ppDBText309: TppDBText;
    ppDBTxtJCustomerName: TppDBText;
    ppLabel128: TppLabel;
    ppDBMemoBiko: TppDBMemo;
    ppReportShosaiJ_Prj: TppReport;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    LineTitle4: TppLine;
    SVppDate4: TppSystemVariable;
    CorpCode4: TppLabel;
    CorpName4: TppLabel;
    LabelTitle4: TppLabel;
    pplblType4: TppLabel;
    ppColumnHeaderBand5: TppColumnHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppShape1: TppShape;
    ppDBText12: TppDBText;
    ppShape4: TppShape;
    ppDBText17: TppDBText;
    ppDBText22: TppDBText;
    ppDBText83: TppDBText;
    ppDBText86: TppDBText;
    ppDBImage3: TppDBImage;
    ppDBText322: TppDBText;
    ppDBText323: TppDBText;
    ppDBText324: TppDBText;
    ppDBText325: TppDBText;
    ppDBText326: TppDBText;
    ppDBText327: TppDBText;
    ppDBText328: TppDBText;
    ppDBText329: TppDBText;
    ppDBText330: TppDBText;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppDBText331: TppDBText;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLine104: TppLine;
    ppLabel157: TppLabel;
    ppLine135: TppLine;
    ppLine136: TppLine;
    ppLabel158: TppLabel;
    ppLine137: TppLine;
    ppLine138: TppLine;
    ppLabel159: TppLabel;
    ppLine149: TppLine;
    ppLabel160: TppLabel;
    ppLine150: TppLine;
    ppLabel161: TppLabel;
    ppLine151: TppLine;
    ppLabel162: TppLabel;
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
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLine162: TppLine;
    ppDBText332: TppDBText;
    ppDBText333: TppDBText;
    ppDBText334: TppDBText;
    ppDBText335: TppDBText;
    ppDBText336: TppDBText;
    ppDBText337: TppDBText;
    ppDBText338: TppDBText;
    ppDBText339: TppDBText;
    ppDBText340: TppDBText;
    ppDBText341: TppDBText;
    ppDBText342: TppDBText;
    ppDBText343: TppDBText;
    ppDBText344: TppDBText;
    ppDBText345: TppDBText;
    ppDBText346: TppDBText;
    ppDBText347: TppDBText;
    ppDBText348: TppDBText;
    ppDBText349: TppDBText;
    ppDBText350: TppDBText;
    ppDBText351: TppDBText;
    ppDBText352: TppDBText;
    ppDBText353: TppDBText;
    ppDBText354: TppDBText;
    ppDBText355: TppDBText;
    ppDBText356: TppDBText;
    ppLabel167: TppLabel;
    ppDBText357: TppDBText;
    ppDBText358: TppDBText;
    ppDBText359: TppDBText;
    ppDBText360: TppDBText;
    ppDBText361: TppDBText;
    ppDBText362: TppDBText;
    ppDBText363: TppDBText;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLine163: TppLine;
    ppLine164: TppLine;
    ppLine165: TppLine;
    ppLine166: TppLine;
    ppLabel183: TppLabel;
    ppLine167: TppLine;
    ppLabel184: TppLabel;
    ppLine169: TppLine;
    ppLine170: TppLine;
    ppLine171: TppLine;
    ppDBText364: TppDBText;
    ppDBText365: TppDBText;
    ppDBText366: TppDBText;
    ppDBText367: TppDBText;
    ppDBText368: TppDBText;
    ppDBText369: TppDBText;
    ppDBText370: TppDBText;
    ppDBText371: TppDBText;
    ppDBText372: TppDBText;
    ppDBText373: TppDBText;
    ppDBText374: TppDBText;
    ppDBText375: TppDBText;
    ppDBText376: TppDBText;
    ppDBText377: TppDBText;
    ppDBText378: TppDBText;
    ppDBText379: TppDBText;
    ppDBText380: TppDBText;
    ppDBText381: TppDBText;
    ppDBText382: TppDBText;
    ppDBText383: TppDBText;
    ppDBText384: TppDBText;
    ppDBText385: TppDBText;
    ppDBText386: TppDBText;
    ppDBText387: TppDBText;
    ppDBText388: TppDBText;
    ppDBText389: TppDBText;
    ppDBText390: TppDBText;
    ppDBText391: TppDBText;
    ppDBText392: TppDBText;
    ppDBText393: TppDBText;
    ppDBText394: TppDBText;
    ppDBText395: TppDBText;
    ppDBText396: TppDBText;
    ppDBText397: TppDBText;
    ppDBText398: TppDBText;
    ppDBText399: TppDBText;
    ppDBText400: TppDBText;
    ppDBText401: TppDBText;
    ppDBText402: TppDBText;
    ppDBText403: TppDBText;
    ppLine172: TppLine;
    ppLine173: TppLine;
    ppLabel185: TppLabel;
    ppLine174: TppLine;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppDBText408: TppDBText;
    ppDBText409: TppDBText;
    ppDBText412: TppDBText;
    ppDBText413: TppDBText;
    ppLabel191: TppLabel;
    ppDBText414: TppDBText;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppDBText415: TppDBText;
    ppLine200: TppLine;
    ppLine203: TppLine;
    ppLine204: TppLine;
    ppLabel203: TppLabel;
    ppDBText516: TppDBText;
    ppLabel204: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppColumnFooterBand5: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    SVppPage4: TppSystemVariable;
    AccOffice4: TppLabel;
    ppReportShosaiG_Prj: TppReport;
    ppTitleBand6: TppTitleBand;
    ppHeaderBand6: TppHeaderBand;
    LineTitle5: TppLine;
    SVppDate5: TppSystemVariable;
    CorpCode5: TppLabel;
    CorpName5: TppLabel;
    LabelTitle5: TppLabel;
    pplblType5: TppLabel;
    ppColumnHeaderBand6: TppColumnHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppShape6: TppShape;
    ppDBText314: TppDBText;
    ppDBText315: TppDBText;
    ppDBText316: TppDBText;
    ppDBText317: TppDBText;
    ppDBImage4: TppDBImage;
    ppDBText407: TppDBText;
    ppDBText410: TppDBText;
    ppDBText411: TppDBText;
    ppDBText416: TppDBText;
    ppDBText417: TppDBText;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel188: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLine92: TppLine;
    ppLine103: TppLine;
    ppLine168: TppLine;
    ppLine175: TppLine;
    ppDBText418: TppDBText;
    ppLabel200: TppLabel;
    ppLine178: TppLine;
    ppLabel201: TppLabel;
    ppLine179: TppLine;
    ppLine180: TppLine;
    ppLabel202: TppLabel;
    ppLine181: TppLine;
    ppLine182: TppLine;
    ppLabel205: TppLabel;
    ppLine183: TppLine;
    ppLabel206: TppLabel;
    ppLine184: TppLine;
    ppLabel207: TppLabel;
    ppLine185: TppLine;
    ppLabel208: TppLabel;
    ppLine186: TppLine;
    ppLine187: TppLine;
    ppLine188: TppLine;
    ppLine189: TppLine;
    ppLine190: TppLine;
    ppLine191: TppLine;
    ppLine192: TppLine;
    ppLine193: TppLine;
    ppLine194: TppLine;
    ppLine195: TppLine;
    ppLabel209: TppLabel;
    ppLine196: TppLine;
    ppDBText419: TppDBText;
    ppDBText420: TppDBText;
    ppDBText421: TppDBText;
    ppDBText422: TppDBText;
    ppDBText423: TppDBText;
    ppDBText424: TppDBText;
    ppDBText425: TppDBText;
    ppDBText426: TppDBText;
    ppDBText427: TppDBText;
    ppDBText428: TppDBText;
    ppDBText429: TppDBText;
    ppDBText430: TppDBText;
    ppDBText431: TppDBText;
    ppDBText432: TppDBText;
    ppDBText433: TppDBText;
    ppDBText434: TppDBText;
    ppDBText435: TppDBText;
    ppDBText436: TppDBText;
    ppDBText437: TppDBText;
    ppDBText438: TppDBText;
    ppDBText439: TppDBText;
    ppDBText440: TppDBText;
    ppDBText441: TppDBText;
    ppDBText442: TppDBText;
    ppDBText443: TppDBText;
    ppDBText444: TppDBText;
    ppDBText445: TppDBText;
    ppDBText446: TppDBText;
    ppLine197: TppLine;
    ppDBText447: TppDBText;
    ppDBText448: TppDBText;
    ppDBText449: TppDBText;
    ppLabel210: TppLabel;
    ppDBText450: TppDBText;
    ppDBText451: TppDBText;
    ppLine199: TppLine;
    ppDBText452: TppDBText;
    ppDBText453: TppDBText;
    ppDBText454: TppDBText;
    ppDBText455: TppDBText;
    ppDBText456: TppDBText;
    ppDBText457: TppDBText;
    ppDBText458: TppDBText;
    ppDBText459: TppDBText;
    ppDBText460: TppDBText;
    ppDBText461: TppDBText;
    ppLabel211: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel220: TppLabel;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    ppLabel223: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLabel226: TppLabel;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    ppLabel231: TppLabel;
    ppLine201: TppLine;
    ppLine202: TppLine;
    ppLine205: TppLine;
    ppLine206: TppLine;
    ppLine207: TppLine;
    ppLine208: TppLine;
    ppLine209: TppLine;
    ppLine210: TppLine;
    ppLine211: TppLine;
    ppLine212: TppLine;
    ppLine213: TppLine;
    ppLine214: TppLine;
    ppLine215: TppLine;
    ppLine216: TppLine;
    ppLine217: TppLine;
    ppLabel232: TppLabel;
    ppDBText462: TppDBText;
    ppDBText463: TppDBText;
    ppDBText464: TppDBText;
    ppDBText465: TppDBText;
    ppDBText466: TppDBText;
    ppDBText467: TppDBText;
    ppDBText468: TppDBText;
    ppDBText469: TppDBText;
    ppDBText470: TppDBText;
    ppDBText471: TppDBText;
    ppDBText472: TppDBText;
    ppDBText473: TppDBText;
    ppDBText474: TppDBText;
    ppDBText475: TppDBText;
    ppDBText476: TppDBText;
    ppDBText477: TppDBText;
    ppDBText478: TppDBText;
    ppDBText479: TppDBText;
    ppDBText480: TppDBText;
    ppDBText481: TppDBText;
    ppDBText482: TppDBText;
    ppDBText483: TppDBText;
    ppDBText484: TppDBText;
    ppDBText485: TppDBText;
    ppDBText486: TppDBText;
    ppDBText487: TppDBText;
    ppDBText488: TppDBText;
    ppDBText489: TppDBText;
    ppDBText490: TppDBText;
    ppDBText491: TppDBText;
    ppLine218: TppLine;
    ppLabel233: TppLabel;
    ppLabel234: TppLabel;
    ppDBText492: TppDBText;
    ppDBText493: TppDBText;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppDBText494: TppDBText;
    ppColumnFooterBand6: TppColumnFooterBand;
    ppFooterBand6: TppFooterBand;
    SVppPage5: TppSystemVariable;
    AccOffice5: TppLabel;
    ppReportSegBun: TppReport;
    ppHeaderBand7: TppHeaderBand;
    CorpCode6: TppLabel;
    CorpName6: TppLabel;
    LabelTitle6: TppLabel;
    LineTitle6: TppLine;
    SVppDate6: TppSystemVariable;
    pplblType6: TppLabel;
    ppLine176: TppLine;
    ppRep_BS_GCode: TppLabel;
    ppRep_BS_TStartDate: TppLabel;
    ppLine177: TppLine;
    ppLine198: TppLine;
    ppLine219: TppLine;
    ppLine220: TppLine;
    ppLine221: TppLine;
    ppRep_BS_Nm: TppLabel;
    ppLine222: TppLine;
    ppLine223: TppLine;
    ppRep_BS_TEndDate: TppLabel;
    ppLine224: TppLine;
    ppRep_BS_Bunrui01: TppLabel;
    ppRep_BS_Segment01: TppLabel;
    ppLine225: TppLine;
    ppLine226: TppLine;
    ppRep_BS_Bunrui02: TppLabel;
    ppRep_BS_Segment02: TppLabel;
    ppLine227: TppLine;
    ppRep_BS_Bunrui03: TppLabel;
    ppRep_BS_Segment03: TppLabel;
    ppRep_BS_Bunrui04: TppLabel;
    ppRep_BS_Segment04: TppLabel;
    ppLine228: TppLine;
    ppRep_BS_Bunrui05: TppLabel;
    ppRep_BS_Segment05: TppLabel;
    ppLine229: TppLine;
    ppRep_BS_Segment06: TppLabel;
    ppRep_BS_Segment07: TppLabel;
    ppRep_BS_Segment08: TppLabel;
    ppRep_BS_Segment09: TppLabel;
    ppRep_BS_Segment10: TppLabel;
    ppRep_BS_Bunrui06: TppLabel;
    ppRep_BS_Bunrui07: TppLabel;
    ppRep_BS_Bunrui08: TppLabel;
    ppRep_BS_Bunrui09: TppLabel;
    ppRep_BS_Bunrui10: TppLabel;
    ppLine230: TppLine;
    ppDetailBand7: TppDetailBand;
    ppLine231: TppLine;
    DBTxt_BS_GCode: TppDBText;
    DBTxt_BS_Nm: TppDBText;
    DBTxt_BS_TStartDate: TppDBText;
    DBTxt_BS_TEndDate: TppDBText;
    ppLine232: TppLine;
    ppLine233: TppLine;
    ppLine234: TppLine;
    ppLine235: TppLine;
    ppLine236: TppLine;
    ppStandardUnderLine2: TppLine;
    ppLine237: TppLine;
    ppLine238: TppLine;
    ppLine239: TppLine;
    ppLine240: TppLine;
    ppLine241: TppLine;
    ppLine242: TppLine;
    ppLine243: TppLine;
    ppLine244: TppLine;
    ppLine245: TppLine;
    ppLine246: TppLine;
    ppLine247: TppLine;
    DBTxt_BS_Bun01Code: TppDBText;
    DBTxt_BS_Seg01Code: TppDBText;
    DBTxt_BS_Bun02Code: TppDBText;
    DBTxt_BS_Seg02Code: TppDBText;
    DBTxt_BS_Bun03Code: TppDBText;
    DBTxt_BS_Seg03Code: TppDBText;
    DBTxt_BS_Seg04Code: TppDBText;
    DBTxt_BS_Bun04Code: TppDBText;
    DBTxt_BS_Bun05Code: TppDBText;
    DBTxt_BS_Seg05Code: TppDBText;
    DBTxt_BS_Bun01Name: TppDBText;
    DBTxt_BS_Seg01Name: TppDBText;
    DBTxt_BS_Bun02Name: TppDBText;
    DBTxt_BS_Seg02Name: TppDBText;
    DBTxt_BS_Bun03Name: TppDBText;
    DBTxt_BS_Seg03Name: TppDBText;
    DBTxt_BS_Seg04Name: TppDBText;
    DBTxt_BS_Bun04Name: TppDBText;
    DBTxt_BS_Seg05Name: TppDBText;
    DBTxt_BS_Bun05Name: TppDBText;
    ppLine248: TppLine;
    DBTxt_BS_Seg06Code: TppDBText;
    DBTxt_BS_Seg06Name: TppDBText;
    DBTxt_BS_Seg07Code: TppDBText;
    DBTxt_BS_Seg07Name: TppDBText;
    DBTxt_BS_Seg08Code: TppDBText;
    DBTxt_BS_Seg08Name: TppDBText;
    DBTxt_BS_Seg09Code: TppDBText;
    DBTxt_BS_Seg09Name: TppDBText;
    DBTxt_BS_Seg10Code: TppDBText;
    DBTxt_BS_Seg10Name: TppDBText;
    DBTxt_BS_Bun06Code: TppDBText;
    DBTxt_BS_Bun06Name: TppDBText;
    DBTxt_BS_Bun07Code: TppDBText;
    DBTxt_BS_Bun07Name: TppDBText;
    DBTxt_BS_Bun08Code: TppDBText;
    DBTxt_BS_Bun08Name: TppDBText;
    DBTxt_BS_Bun09Code: TppDBText;
    DBTxt_BS_Bun09Name: TppDBText;
    DBTxt_BS_Bun10Code: TppDBText;
    DBTxt_BS_Bun10Name: TppDBText;
    ppFooterBand7: TppFooterBand;
    SVppPage6: TppSystemVariable;
    AccOffice6: TppLabel;
    ppDBMemoGaiyou: TppDBMemo;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppDBText311: TppDBText;
    ppDBText312: TppDBText;
    ppLabel132: TppLabel;
    ppDBText313: TppDBText;
    ppDBText318: TppDBText;
    ppLabel133: TppLabel;
    ppDBText319: TppDBText;
    ppLabel134: TppLabel;
    ppDBText320: TppDBText;
    ppDBText321: TppDBText;
    ppLabel141: TppLabel;
    ppDBText404: TppDBText;
    ppDBText405: TppDBText;
    ppLabel142: TppLabel;
    ppDBText406: TppDBText;
    ppLabel143: TppLabel;
    ppLabel186: TppLabel;
    ppDBText495: TppDBText;
    ppDBText496: TppDBText;
    ppDBText497: TppDBText;
    ppDBText498: TppDBText;
    ppLabel187: TppLabel;
    ppLabel235: TppLabel;
    ppDBText499: TppDBText;
    ppDBText500: TppDBText;
    ppDBText501: TppDBText;
    ppDBText502: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLabel236: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppLabel240: TppLabel;
    ppReportKeiyakuKJ: TppReport;
    ppTitleBand7: TppTitleBand;
    ppHeaderBand8: TppHeaderBand;
    LabelTitle7: TppLabel;
    LineTitle7: TppLine;
    SVppDate7: TppSystemVariable;
    CorpCode7: TppLabel;
    CorpName7: TppLabel;
    pplblType7: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppLine256: TppLine;
    ppDBText503: TppDBText;
    ppLine257: TppLine;
    ppLine258: TppLine;
    ppLine259: TppLine;
    ppLine260: TppLine;
    ppLine261: TppLine;
    ppDBText506: TppDBText;
    ppFooterBand8: TppFooterBand;
    SVppPage7: TppSystemVariable;
    AccOffice7: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText509: TppDBText;
    ppLine263: TppLine;
    ppDBText510: TppDBText;
    ppDBText511: TppDBText;
    ppDBText512: TppDBText;
    ppLine264: TppLine;
    ppDBText513: TppDBText;
    ppLine266: TppLine;
    ppLine267: TppLine;
    ppLine268: TppLine;
    ppDBText514: TppDBText;
    ppDBText504: TppDBText;
    ppLabel250: TppLabel;
    ppLine271: TppLine;
    ppLine272: TppLine;
    ppLine273: TppLine;
    ppLine274: TppLine;
    ppLine275: TppLine;
    ppDBText505: TppDBText;
    ppDBText515: TppDBText;
    ppLine276: TppLine;
    ppReportKeiyaku: TppReport;
    ppTitleBand8: TppTitleBand;
    ppHeaderBand9: TppHeaderBand;
    LabelTitle8: TppLabel;
    LineTitle8: TppLine;
    SVppDate8: TppSystemVariable;
    CorpCode8: TppLabel;
    CorpName8: TppLabel;
    pplblType8: TppLabel;
    ppColumnHeaderBand8: TppColumnHeaderBand;
    ppLabel261: TppLabel;
    ppLine278: TppLine;
    ppLine279: TppLine;
    ppLine280: TppLine;
    ppLine282: TppLine;
    ppLine283: TppLine;
    ppLine284: TppLine;
    ppLabel264: TppLabel;
    DBKJCode: TppDBText;
    ppDBText518: TppDBText;
    ppLabel265: TppLabel;
    ppLine285: TppLine;
    ppLine286: TppLine;
    ppLine287: TppLine;
    ppDetailBand9: TppDetailBand;
    ppLine289: TppLine;
    ppDBText519: TppDBText;
    ppLine291: TppLine;
    ppLine292: TppLine;
    ppLine293: TppLine;
    ppLine294: TppLine;
    ppDBText521: TppDBText;
    ppLine295: TppLine;
    ppDBText522: TppDBText;
    ppDBText523: TppDBText;
    ppDBText524: TppDBText;
    ppLine297: TppLine;
    ppLine298: TppLine;
    ppLine299: TppLine;
    ppDBText526: TppDBText;
    ppDBText527: TppDBText;
    ppColumnFooterBand8: TppColumnFooterBand;
    ppFooterBand9: TppFooterBand;
    SVppPage8: TppSystemVariable;
    AccOffice8: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel272: TppLabel;
    ppLine300: TppLine;
    ppLine301: TppLine;
    ppLine302: TppLine;
    ppLine303: TppLine;
    ppLine304: TppLine;
    ppDBText528: TppDBText;
    ppDBText529: TppDBText;
    ppLine305: TppLine;
    ppLine252: TppLine;
    ppLabel245: TppLabel;
    ppLine253: TppLine;
    ppLine254: TppLine;
    ppLine255: TppLine;
    ppLine262: TppLine;
    ppLine269: TppLine;
    ppLine270: TppLine;
    ppLine307: TppLine;
    ppLine308: TppLine;
    ppLabel246: TppLabel;
    ppLine250: TppLine;
    ppLabel247: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppLabel255: TppLabel;
    ppLabel257: TppLabel;
    ppLabel273: TppLabel;
    ppDBText508: TppDBText;
    DBTextGCode: TppDBText;
    ppLabel258: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppDBText507: TppDBText;
    ppDBText517: TppDBText;
    ppReportNyukin: TppReport;
    ppTitleBand9: TppTitleBand;
    ppHeaderBand10: TppHeaderBand;
    LabelTitle9: TppLabel;
    LineTitle9: TppLine;
    SVppDate9: TppSystemVariable;
    CorpCode9: TppLabel;
    CorpName9: TppLabel;
    pplblType9: TppLabel;
    ppColumnHeaderBand7: TppColumnHeaderBand;
    ppLine249: TppLine;
    ppLine251: TppLine;
    ppLine277: TppLine;
    ppLine281: TppLine;
    ppLine288: TppLine;
    ppLabel262: TppLabel;
    DBTextCode: TppDBText;
    ppDBText525: TppDBText;
    ppLabel263: TppLabel;
    ppLine290: TppLine;
    ppLine306: TppLine;
    ppLabel267: TppLabel;
    ppLabel269: TppLabel;
    ppLabel270: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppColumnFooterBand7: TppColumnFooterBand;
    ppFooterBand10: TppFooterBand;
    SVppPage9: TppSystemVariable;
    AccOffice9: TppLabel;
    ppLabel251: TppLabel;
    ppDBText530: TppDBText;
    ppDBText531: TppDBText;
    ppDBText532: TppDBText;
    ppDBText533: TppDBText;
    ppLabel252: TppLabel;
    ppLabel256: TppLabel;
    ppDBText534: TppDBText;
    ppDBText535: TppDBText;
    ppDBText536: TppDBText;
    ppDBText537: TppDBText;
    ppDBText538: TppDBText;
    ppDBText539: TppDBText;
    ppDBText540: TppDBText;
    ppDBText541: TppDBText;
    ppDBText542: TppDBText;
    ppDBText543: TppDBText;
    ppLabel259: TppLabel;
    ppLabel268: TppLabel;
    ppLabel271: TppLabel;
    ppLabel274: TppLabel;
    ppLabel275: TppLabel;
    ppLabel276: TppLabel;
    ppLabel277: TppLabel;
    ppDBText544: TppDBText;
    ppDBText545: TppDBText;
    ppDBText546: TppDBText;
    ppDBText547: TppDBText;
    ppDBText548: TppDBText;
    ppDBText549: TppDBText;
    ppLabel260: TppLabel;
    ppDBText550: TppDBText;
    ppDBText551: TppDBText;
    ppLine85: TppLine;
    ppLine265: TppLine;
    ppLine296: TppLine;
    ppLine309: TppLine;
    ppLine310: TppLine;
    ppLine311: TppLine;
    ppLine312: TppLine;
    ppLine313: TppLine;
    ppLine314: TppLine;
    ppLine315: TppLine;
    ppLabel266: TppLabel;
    ppDBText552: TppDBText;
    ppLine316: TppLine;
    ppLine317: TppLine;
    ppLine318: TppLine;
    ppLine319: TppLine;
    ppDBText553: TppDBText;
    ppDBText554: TppDBText;
    ppDBText555: TppDBText;
    ppDBText556: TppDBText;
    ppDBText557: TppDBText;
    ppDBText558: TppDBText;
    ppDBText559: TppDBText;
    ppDBText560: TppDBText;
    ppDBText561: TppDBText;
    ppDBText562: TppDBText;
    ppDBText563: TppDBText;
    ppDBText564: TppDBText;
    ppDBText565: TppDBText;
    ppDBText566: TppDBText;
    ppDBText567: TppDBText;
    ppDBText568: TppDBText;
    ppDBText569: TppDBText;
    ppDBText570: TppDBText;
    ppLabel278: TppLabel;
    ppLabel279: TppLabel;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppLabel284: TppLabel;
    ppLabel285: TppLabel;
    ppLabel282: TppLabel;
    ppLabel283: TppLabel;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppLabel288: TppLabel;
    ppDBText520: TppDBText;
    ppDBText571: TppDBText;
    ppDBText572: TppDBText;
    ppDBText573: TppDBText;
    ppDBText574: TppDBText;
    ppDBText575: TppDBText;
    ppDBText576: TppDBText;
    ppDBText577: TppDBText;
    ppDBText578: TppDBText;
    ppDBText579: TppDBText;
    ppDBText580: TppDBText;
    ppLine320: TppLine;
    ppLabel289: TppLabel;
    ppLine321: TppLine;
    ppLabel290: TppLabel;
    ppLine322: TppLine;
    ppLabel291: TppLabel;
    ppDBText581: TppDBText;
    ppDBText582: TppDBText;
    ppLabel292: TppLabel;
    ppDBText583: TppDBText;
    ppLabel293: TppLabel;
    ppDBText584: TppDBText;
    ppDBText585: TppDBText;
    ppDBText586: TppDBText;
    ppDBText587: TppDBText;
    ppDBText588: TppDBText;
    ppLabel294: TppLabel;
    ppLabel295: TppLabel;
    ppLabel296: TppLabel;
    ppLabel297: TppLabel;
    ppDBMemo4: TppDBMemo;
    ppLabel298: TppLabel;
    ppDBText589: TppDBText;
    ppDBText590: TppDBText;
    ppReportKasan: TppReport;
    ppHeaderBand11: TppHeaderBand;
    CorpCode10: TppLabel;
    CorpName10: TppLabel;
    LabelTitle10: TppLabel;
    LineTitle10: TppLine;
    SVppDate10: TppSystemVariable;
    ppColumnHeaderBand9: TppColumnHeaderBand;
    ppLine119: TppLine;
    ppLabel123: TppLabel;
    ppLabel299: TppLabel;
    ppLine120: TppLine;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine323: TppLine;
    ppDetailBandKasan: TppDetailBand;
    ppDBTextExCodeDst: TppDBText;
    ppDBTextNameDst: TppDBText;
    ppDBTextExCodeSrc: TppDBText;
    ppDBTextNameSrc: TppDBText;
    ppLine324: TppLine;
    ppLine325: TppLine;
    ppLine326: TppLine;
    ppLine327: TppLine;
    ppLine328: TppLine;
    ppLineDetailsBottomKasan: TppLine;
    ppLineDetailsTopKasan: TppLine;
    ppColumnFooterBand9: TppColumnFooterBand;
    ppFooterBand11: TppFooterBand;
    SVppPage10: TppSystemVariable;
    AccOffice10: TppLabel;
    ppLine329: TppLine;
    ppLine330: TppLine;
    ppLine331: TppLine;
    ppLabel300: TppLabel;
    ppLine332: TppLine;
    ppLine333: TppLine;
    ppLabel301: TppLabel;
    ppLine334: TppLine;
    ppLine335: TppLine;
    ppLine336: TppLine;
    ppLine337: TppLine;
    ppLine338: TppLine;
    ppLine339: TppLine;
    ppLine340: TppLine;
    ppLine341: TppLine;
    ppLine342: TppLine;
    ppLine343: TppLine;
    ppLine344: TppLine;
    ppLine345: TppLine;
    ppLine346: TppLine;
    ppLine347: TppLine;
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
    ppLine358: TppLine;
    ppLabel302: TppLabel;
    ppLabel303: TppLabel;
    ppDBText591: TppDBText;
    ppDBText592: TppDBText;
    ppDBText593: TppDBText;
    ppDBText594: TppDBText;
    ppLabel304: TppLabel;
    ppDBText595: TppDBText;
    ppDBText596: TppDBText;
    ppDBText597: TppDBText;
    ppDBText598: TppDBText;
    ppDBText599: TppDBText;
    ppDBText600: TppDBText;
    ppDBText601: TppDBText;
    ppDBText602: TppDBText;
    ppDBText603: TppDBText;
    ppDBText604: TppDBText;
    ppDBText605: TppDBText;
    ppDBText606: TppDBText;
    ppDBText607: TppDBText;
    ppDBText608: TppDBText;
    ppDBText609: TppDBText;
    ppDBText610: TppDBText;
    ppDBText611: TppDBText;
    ppDBText612: TppDBText;
    ppDBText613: TppDBText;
    ppDBText614: TppDBText;
    ppDBText615: TppDBText;
    ppDBText616: TppDBText;
    ppDBText617: TppDBText;
    ppDBText618: TppDBText;
    ppDBText619: TppDBText;
    ppDBText620: TppDBText;
    ppDBText621: TppDBText;
    ppDBText622: TppDBText;
    ppDBText623: TppDBText;
    ppDBText624: TppDBText;
    ppDBText625: TppDBText;
    ppDBText626: TppDBText;
    ppDBText627: TppDBText;
    ppDBText628: TppDBText;
    ppDBText629: TppDBText;
    ppDBText630: TppDBText;
    ppDBText631: TppDBText;
    ppDBText632: TppDBText;
    ppDBText633: TppDBText;
    ppDBText634: TppDBText;
    ppDBText635: TppDBText;
    ppDBText636: TppDBText;
    ppDBText637: TppDBText;
    ppDBText638: TppDBText;
    ppDBText639: TppDBText;
    ppDBText640: TppDBText;
    ppDBText641: TppDBText;
    ppDBText642: TppDBText;
    ppDBText643: TppDBText;
    ppDBText644: TppDBText;
    ppDBText645: TppDBText;
    ppDBText646: TppDBText;
    ppDBText647: TppDBText;
    ppDBText648: TppDBText;
    ppDBText649: TppDBText;
    ppDBText650: TppDBText;
    ppDBText651: TppDBText;
    ppDBText652: TppDBText;
    ppDBText653: TppDBText;
    ppDBText654: TppDBText;
    ppDBText655: TppDBText;
    ppDBText656: TppDBText;
    ppDBText657: TppDBText;
    ppDBText658: TppDBText;
    ppDBText659: TppDBText;
    ppDBText660: TppDBText;
    ppDBText661: TppDBText;
    ppDBText662: TppDBText;
    ppDBText663: TppDBText;
    ppDBText664: TppDBText;
    ppDBText665: TppDBText;
    ppDBText666: TppDBText;
    ppDBText667: TppDBText;
    ppDBText668: TppDBText;
    ppDBText669: TppDBText;
    ppDBText670: TppDBText;
    ppDBText671: TppDBText;
    ppDBText672: TppDBText;
    ppDBText673: TppDBText;
    ppDBText674: TppDBText;
    ppDBText675: TppDBText;
    ppDBText676: TppDBText;
    ppDBText677: TppDBText;
    ppDBText678: TppDBText;
    ppDBText679: TppDBText;
    ppDBText680: TppDBText;
    ppDBText681: TppDBText;
    ppDBText682: TppDBText;
    ppDBText683: TppDBText;
    ppDBText684: TppDBText;
    ppDBText685: TppDBText;
    ppDBText686: TppDBText;
    ppDBText687: TppDBText;
    ppDBText688: TppDBText;
    ppDBText689: TppDBText;
    ppDBText690: TppDBText;
    ppLine359: TppLine;
    ppLine360: TppLine;
    ppLine361: TppLine;
    ppDBText691: TppDBText;
    ppDBText692: TppDBText;
    ppLabel306: TppLabel;
    ppLabel307: TppLabel;
    ppLabel308: TppLabel;
    ppLabel309: TppLabel;
    ppLabel310: TppLabel;
    ppDBText693: TppDBText;
    ppDBText694: TppDBText;
    ppDBText695: TppDBText;
    ppDBText696: TppDBText;
    ppDBText697: TppDBText;
    ppDBText698: TppDBText;
    ppDBText699: TppDBText;
    ppDBText700: TppDBText;
    ppLabel305: TppLabel;
    ppDBText701: TppDBText;
    ppLine362: TppLine;
    ppLabel311: TppLabel;
    ppDBText702: TppDBText;
    ppLine363: TppLine;
    pplblKeiyakuPartPattern: TppLabel;
    pptxtKeiyakuPartPattern: TppDBText;
    pplblKeiyakuKjPartPattern: TppLabel;
    pptxtKeiyakuKJPartPattern: TppDBText;
    pplblKeiyakuKJMarkE: TppLabel;
    pplblKeiyakuMarkE: TppLabel;
    ppLabel312: TppLabel;
    ppDBText703: TppDBText;
    ppDBText704: TppDBText;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       ppRepBeforePrint    (Sender: TObject);
    procedure ppReportShosaiJPreviewFormCreate(Sender: TObject);
    //@ ↓12.01
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBandKasanBeforeGenerate(Sender: TObject);
    //@ ↑ 12.01
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
    m_iKojUse       :   Integer;            // 工事管理種別<001>

    m_cJNTArea      :   TJNTCommon;

    m_KojKbn17      :   Integer;            // 契約情報連動区分 <014>　

//<009> - ST
	m_arSegMa			: Array [1..10] of Integer;
	m_arAdoptInfo_Seg	: array [1..10] of AdoptInfo;
	m_arAdoptInfo_PBr	: array [1..10] of AdoptInfo;
//<009> - ED
    m_strNowCode			:	String;				// 加算体系用 <021> ADD
    m_bNoControlSesyu	: Boolean;			// 「施主」項目の無条件表示フラグ


	procedure ppReport1FileOut();
	function  fnInzSegBun		(): Boolean;	//<009>
	function IsExistLicense(aModuleCode: Integer): Boolean;	//<023> ADD
    procedure LoadAPGFile();	//<025> ADD

  public
    { Public 宣言 }

	procedure DoPrint       (Para: TJNTHani; TargetMD: TdxMemData; TargetStr: String; CorpSys: TJNTSelCorpSys; JNTArea:TJNTCommon);
	function  fnIsPreview   (): Boolean;
    procedure fnInzPrint    ();
  end;

// <PRN2>
const
// <003>↓
{	JITUZAIKANRYAKU	= 2;		                            // 実在簡略(２次ではなし)
	JITUZAISHOSAI	= 0;		                            // 実在詳細
	GOUKEIKANRYAKU	= 3;                                    // 合計簡略(２次ではなし)
	GOUKEISHOSAI	= 1;                                    // 合計詳細
}
//<009> - ST
{
	JITUZAIKANRYAKU	= 0;		                            // 実在簡略
	JITUZAISHOSAI	= 1;		                            // 実在詳細
	GOUKEIKANRYAKU	= 2;                                    // 合計簡略
	GOUKEISHOSAI	= 3;                                    // 合計詳細
}
// <014> MOD start
{
	JITUZAIKANRYAKU	= 0;		                            // 実在簡略
	JITUZAISHOSAI	= 1;		                            // 実在詳細
	JITUZAIBUNRUI	= 2;									// 実在分類
	GOUKEIKANRYAKU	= 3;                                    // 合計簡略
	GOUKEISHOSAI	= 4;                                    // 合計詳細
}
	JITUZAIKANRYAKU	    = 0;		                        // 実在簡略
	JITUZAISHOSAI	    = 1;		                        // 実在詳細
	JITUZAIKEIYAKU	    = 2;		                        // 実在契約情報
	JITUZAIKEIYAKUDTL	= 3;		                        // 実在契約情報詳細*
	JITUZAINYUUKIN     	= 4;	                            // 実在入金情報*
	JITUZAIBUNRUI	    = 5;								// 実在分類
	GOUKEIKANRYAKU	    = 6;                                // 合計簡略
	GOUKEISHOSAI	    = 7;                                // 合計詳細
	GOUKEIKEIYAKU	    = 8;                                // 合計契約情報
    GOUKEIKEIYAKUDTL    = 9;	                            // 合計契約情報詳細*
	GOUKEINYUUKIN     	= 10;	                            // 合計入金情報*
	KASANTOUROKU		= 11;								// 加算登録 <021> ADD
// <014> MOD end
//<009> - ED
// <003>↑
// <PRN2>

//<009> - ST
	ucSSG_MKBN = 101;
	ucESG_MKBN = 110;
	ucSPB_MKBN = 511;
    ucEPB_MKBN = 520;
//<009> - ED
	MODULECODE_KOJI = 850000;	//<023> ADD

// { Exports関数宣言 } <PRN>
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP018001L: TDmJNTCRP018001L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation
{$I JNTConst.inc}


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
	pFrm    :   ^TDmJNTCRP018001L;
begin
	Result  :=  ACTID_RET_OK;

	{ 各Modeについて処理する }
	{ 0:CreateModule }
	{ 1:DoPrint }
	{ 2:fnSetSQL }
	{ 3:fnSetTmpTbl }
	{ 4:fnDelTmpTbl }
	{ 5:fnIsPreview }
	{ 6:Close }

    case Mode of
        // ------------------------
        //      CreateModule
        // ------------------------
		0:
		begin
			new( pFrm );
			try
                // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^   :=  TDmJNTCRP018001L.CreateModule( AOwner,pRec );
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetMD, PrtParam.TargetStr, PrtParam.CorpSys,PrtParam.JNTArea);
		end;
        2:
        begin
        end;
        3:
        begin
        end;
        4:
        begin
        end;
        5:
        begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
            pFrm^.fnIsPreview;
        end;
		6:
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
constructor TDmJNTCRP018001L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP018001L.DataModuleCreate(Sender: TObject);
begin
	LoadAPGFile();	//<025> ADD
//<023> ADD START
	// 工事大将ライセンスなしの場合「施主」に関して非表示
//<025> MOD	st if NOT (IsExistLicense(MODULECODE_KOJI)) then
	if (m_bNoControlSesyu = False) and
       (IsExistLicense(MODULECODE_KOJI) = False) then	//<025> MOD ed
    begin
    	// 工事詳細型
		ppLabel131.Visible	:= False;
        ppDBText311.Visible	:= False;
        ppDBText312.Visible	:= False;
        ppLabel134.Visible	:= False;
        ppDBText320.Visible	:= False;
        ppDBText321.Visible	:= False;
        // プロジェクト詳細
        ppLabel286.Visible	:= False;
        ppDBText579.Visible	:= False;
        ppDBText573.Visible	:= False;
    end;
//<023> ADD END
////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP018001L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP018001L.ppRepBeforePrint(Sender: TObject);
var
    TargetMD: TdxMemData;
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);



end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP018001L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; TargetStr: String; CorpSys: TJNTSelCorpSys; JNTArea:TJNTCommon);
var
    wRep    :   TppReport;
	i       :   Integer;
//	iKensu		:	Integer;		//	表示件数(Integer型)
	sKensu		:	String;			//	表示件数(String型)
	iLength		:	Integer;		//	文字の桁数
	sWork1		:	String;
	sWork2		:	String;
begin

	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する
    m_cJNTArea := JNTArea;

    //DataSourceの設定
    dsMain.DataSet := TargetMD;

//<009> - ST
	// 分類、セグメント時
	if uvHani.pvrPattern = JITUZAIBUNRUI then
	begin
		if (not fnInzSegBun()) then
		begin
			MjsMessageBox(Owner,'分類とセグメントが採用されていません。', mjError, mjDefOk);
			Exit;
		end;
	end;
//<009> - ED

    fnInzPrint;                                             // 印刷初期化処理

    wRep := nil;
//<008> - ST
{
    case uvHani.pvrPattern of
        JITUZAIKANRYAKU	: wRep := ppReportKaniJ;
        JITUZAISHOSAI   : wRep := ppReportShosaiJ;
        GOUKEIKANRYAKU 	: wRep := ppReportKaniG;
        GOUKEISHOSAI   	: wRep := ppReportShosaiG;
    end;
}
    case uvHani.pvrPattern of
        JITUZAIKANRYAKU	: wRep := ppReportKaniJ;
        JITUZAISHOSAI:
		begin
			if m_pRec.m_sParameter = '1' then       // 工事の時
				wRep := ppReportShosaiJ
			else
				wRep := ppReportShosaiJ_Prj;
		end;
        GOUKEIKANRYAKU 	: wRep := ppReportKaniG;
        GOUKEISHOSAI:
		begin
//<018> MOD St
			if m_pRec.m_sParameter = '1' then       // 工事の時
            begin
				wRep := ppReportShosaiG;
                ppLabel_Info.Caption := '工　　　　　　事　　　　　　情　　　　　　報';
            end
			else
            begin
// <016> MOD start
//				wRep := ppReportShosaiG_Prj;
				wRep := ppReportShosaiG;
                ppLabel_Info.Caption := 'プ　　ロ　　ジ　　ェ　　ク　　ト　　情　　報';
// <016> MOD end
            end;
//<018> ADD Ed
		end;
		JITUZAIBUNRUI:								// 分類						//<009>
			wRep := ppReportSegBun;
// <014> ADD start
        JITUZAIKEIYAKU,GOUKEIKEIYAKU:
        begin
		    wRep := ppReportKeiyaku;
        end;
        JITUZAIKEIYAKUDTL,GOUKEIKEIYAKUDTL:
        begin
            wRep := ppReportKeiyakuKJ;
        end;
        JITUZAINYUUKIN,GOUKEINYUUKIN:
        begin
            wRep := ppReportNyukin;
        end;
// <014> ADD end
// <021> ADD start
		KASANTOUROKU:						// 加算登録リスト
		begin
			wRep := ppReportKasan;
		end;
// <021> ADD end
    end;
//<008> - ED

	PrnSupport.ApRB				:= wRep;
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    := m_pMDataModule^;         // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
    PrnSupport.iCalendarKbn     := CorpSys.GetYYKbn + 1;    // <003>

    PrnSupport.pApRec           := m_pRec;		// <010> ADD

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    prnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

    //<024> -St 旧Gali　プロジェクトの場合
    if not TMSeries.IsGalielopt2 then
    begin
        if m_pRec.m_sParameter <> '1' then
        begin
            ppLine329.Visible   := False;
            ppLine330.Visible   := False;
            ppLine331.Visible   := False;
            ppLabel300.Visible  := False;
            ppLine332.Visible   := False;
            ppLine333.Visible   := False;
            ppLabel301.Visible  := False;
            ppLine334.Visible   := False;
            ppLine335.Visible   := False;
            ppLine336.Visible   := False;
            ppLine337.Visible   := False;
            ppLine338.Visible   := False;
            ppLine339.Visible   := False;
            ppLine340.Visible   := False;
            ppLine341.Visible   := False;
            ppLine342.Visible   := False;
            ppLine343.Visible   := False;
            ppLine344.Visible   := False;
            ppLine345.Visible   := False;
            ppLine346.Visible   := False;
            ppLine347.Visible   := False;
            ppLine348.Visible   := False;
            ppLine349.Visible   := False;
            ppLine350.Visible   := False;
            ppLine351.Visible   := False;
            ppLine352.Visible   := False;
            ppLine353.Visible   := False;
            ppLine354.Visible   := False;
            ppLine355.Visible   := False;
            ppLine356.Visible   := False;
            ppLine357.Visible   := False;
            ppLine358.Visible   := False;
            ppLabel302.Visible  := False;
            ppLabel303.Visible  := False;
            ppDBText591.Visible := False;
            ppDBText592.Visible := False;
            ppDBText593.Visible := False;
            ppDBText594.Visible := False;
            ppLabel304.Visible  := False;
            ppDBText595.Visible := False;
            ppDBText596.Visible := False;
            ppDBText597.Visible := False;
            ppDBText598.Visible := False;
            ppDBText599.Visible := False;
            ppDBText600.Visible := False;
            ppDBText601.Visible := False;
            ppDBText602.Visible := False;
            ppDBText603.Visible := False;
            ppDBText604.Visible := False;
            ppDBText605.Visible := False;
            ppDBText606.Visible := False;
            ppDBText607.Visible := False;
            ppDBText608.Visible := False;
            ppDBText609.Visible := False;
            ppDBText610.Visible := False;
            ppDBText611.Visible := False;
            ppDBText612.Visible := False;
            ppDBText613.Visible := False;
            ppDBText614.Visible := False;
            ppDBText615.Visible := False;
            ppDBText616.Visible := False;
            ppDBText617.Visible := False;
            ppDBText618.Visible := False;
            ppDBText619.Visible := False;
            ppDBText620.Visible := False;
            ppDBText621.Visible := False;
            ppDBText622.Visible := False;
            ppDBText623.Visible := False;
            ppDBText624.Visible := False;
            ppDBText625.Visible := False;
            ppDBText626.Visible := False;
            ppDBText627.Visible := False;
            ppDBText628.Visible := False;
            ppDBText629.Visible := False;
            ppDBText630.Visible := False;
            ppDBText631.Visible := False;
            ppDBText632.Visible := False;
            ppDBText633.Visible := False;
            ppDBText634.Visible := False;
            ppDBText635.Visible := False;
            ppDBText636.Visible := False;
            ppDBText637.Visible := False;
            ppDBText638.Visible := False;
            ppDBText639.Visible := False;
            ppDBText640.Visible := False;
            ppDBText641.Visible := False;
            ppDBText642.Visible := False;
            ppDBText643.Visible := False;
            ppDBText644.Visible := False;
            ppDBText645.Visible := False;
            ppDBText646.Visible := False;
            ppDBText647.Visible := False;
            ppDBText648.Visible := False;
            ppDBText649.Visible := False;
            ppDBText650.Visible := False;
            ppDBText651.Visible := False;
            ppDBText652.Visible := False;
            ppDBText653.Visible := False;
            ppDBText654.Visible := False;
            ppDBText655.Visible := False;
            ppDBText656.Visible := False;
            ppDBText657.Visible := False;
            ppDBText658.Visible := False;
            ppDBText659.Visible := False;
            ppDBText660.Visible := False;
            ppDBText661.Visible := False;
            ppDBText662.Visible := False;
            ppDBText663.Visible := False;
            ppDBText664.Visible := False;
            ppDBText665.Visible := False;
            ppDBText666.Visible := False;
            ppDBText667.Visible := False;
            ppDBText668.Visible := False;
            ppDBText669.Visible := False;
            ppDBText670.Visible := False;
            ppDBText671.Visible := False;
            ppDBText672.Visible := False;
            ppDBText673.Visible := False;
            ppDBText674.Visible := False;
            ppDBText675.Visible := False;
            ppDBText676.Visible := False;
            ppDBText677.Visible := False;
            ppDBText678.Visible := False;
            ppDBText679.Visible := False;
            ppDBText680.Visible := False;
            ppDBText681.Visible := False;
            ppDBText682.Visible := False;
            ppDBText683.Visible := False;
            ppDBText684.Visible := False;
            ppDBText685.Visible := False;
            ppDBText686.Visible := False;
            ppDBText687.Visible := False;
            ppDBText688.Visible := False;
            ppDBText689.Visible := False;
            ppDBText690.Visible := False;
            ppLine359.Visible   := False;
            ppLine360.Visible   := False;
            ppLine361.Visible   := False;
            ppDBText691.Visible := False;
            ppDBText692.Visible := False;
            ppLabel306.Visible  := False;
            ppLabel307.Visible  := False;
            ppLabel308.Visible  := False;
            ppLabel309.Visible  := False;
            ppLabel310.Visible  := False;
            ppDBText693.Visible := False;
            ppDBText694.Visible := False;
            ppDBText695.Visible := False;
            ppDBText696.Visible := False;
            ppDBText697.Visible := False;
            ppDBText698.Visible := False;
            ppDBText699.Visible := False;
            ppDBText700.Visible := False;
//<TAX> MOD St
//            ppShape1.Height     := 3.6353;
            // 契約情報の枠線の高さ調整
            ppShape1.Height := (ppLine333.Top + ppLine333.Height) - ppShape1.Top;
//<TAX> MOD Ed
            ppShape4.Height     := 5.8333;

            ppLabel297.Top 	    := 4.4792;
            ppDBMemo4.Top  	    := 4.4792;
            ppLabel204.Top      := 5.1146;
            ppDBMemo1.Top       := 5.1146;
            ppLabel203.Top	    := 5.7396;
            ppDBText516.Top	    := 5.7396;
        end;
    end;
    //<024> -Ed

    case uvHani.pvrPattern of
        //JITUZAIKANRYAKU	: ;
// <016> MOD start
//        JITUZAISHOSAI   : ppKanFuriBmnJ.Caption	:= TargetStr;
        JITUZAISHOSAI:
        begin
            if ( m_pRec.m_sParameter = '1' ) then
                ppKanFuriBmnJ.Caption	:= TargetStr
            else
                ppLabel298.Caption	:= TargetStr;
        end;
// <016> MOD end
        //GOUKEIKANRYAKU   	: ;
        GOUKEISHOSAI   	: ppBmnG.Caption := TargetStr;
//<TAX> ADD St
        GOUKEIKEIYAKU   :
        begin
            pplblKeiyakuPartPattern.Visible := false;
            pplblKeiyakuMarkE.Visible       := false;
            pptxtKeiyakuPartPattern.Visible := false;
        end;
        GOUKEIKEIYAKUDTL    :
        begin
            pplblKeiyakuKJPartPattern.Visible := false;
            pplblKeiyakuKJMarkE.Visible       := false;
            pptxtKeiyakuKJPartPattern.Visible := false;
        end;
//<TAX> ADD Ed
    end;
	//	件数表示処理
	if (uvHani.pvrPattern = JITUZAIKANRYAKU) or  (uvHani.pvrPattern = GOUKEIKANRYAKU)then
	begin
		sKensu	:=	IntToStr(TargetMD.RecordCount);	//	数値型を文字型に
		iLength	:=	Length(sKensu);
		if (iLength = 4) then
		begin
			sWork1	:=	COPY(sKensu,2,3);
			sWork2	:=	COPY(sKensu,1,1);
			sKensu	:=	sWork2 + ',' + sWork1;
		end;
		if uvHani.pvrPattern = JITUZAIKANRYAKU then
			LJitsu_Kensu.Caption	:=	sKensu + ' 件'
		else
			LGou_Kensu.Caption	:=	sKensu + ' 件'
	end;

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
procedure TDmJNTCRP018001L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
    iCnt    : Integer;                      // <001>
	i, j	: Integer;						//<009>
	tmpLabel: TppLabel;						//<009>
    sPrjTitle:String;	                    //<024> 完成振替名称
begin
    tmpLabel := Nil;

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    case uvHani.pvrPattern of
		JITUZAIKANRYAKU:					        // 実在工事簡略
		begin
			sTitle.Add('コード');
			sTitle.Add('連想');
			sTitle.Add('正式名称');
			sTitle.Add('簡略名称');

			sMemFld.Add('GCode');
			sMemFld.Add('RenChar');
			sMemFld.Add('LongName');
			sMemFld.Add('SimpleName');
		end;
		JITUZAISHOSAI:
		begin
			sTitle.Add('コード');
			sTitle.Add('連想');
			sTitle.Add('正式名称');
			sTitle.Add('簡略名称');
			//sTitle.Add('付箋コメント');
// <016> DEL start
{
// <001>↓
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
// <001>↑
}
// <016> DEL end
    			sTitle.Add('郵便番号基番');
	    		sTitle.Add('郵便番号枝番');
		    	sTitle.Add('住所上段');
			    sTitle.Add('住所下段');
    			sTitle.Add('電話番号');
                sTitle.Add('FAX番号');                 // ADD <011>
// <016> MOD start
{
	    		sTitle.Add(ppKanFuriBmnJ.Caption + 'コード');
		    	sTitle.Add(ppKanFuriBmnJ.Caption + '名称');
}
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
	    		sTitle.Add(ppKanFuriBmnJ.Caption + 'コード');
		    	sTitle.Add(ppKanFuriBmnJ.Caption + '名称');
            end
            else
            begin
	    		sTitle.Add(ppLabel298.Caption + 'コード');
		    	sTitle.Add(ppLabel298.Caption + '名称');
            end;


// <016> MOD end
			    sTitle.Add('担当者コード');
    			sTitle.Add('担当者名称');
// <003>↓ <004>復帰
        		sTitle.Add('受注者コード');
		    	sTitle.Add('受注者名称');
//<007>		    sTitle.Add('受注者');
				sTitle.Add('受注先');											//<007>
//	    		sTitle.Add('受注先コード');
//		    	sTitle.Add('受注先名称');
// <011> ADD start
                sTitle.Add('施主コード');
                sTitle.Add('施主名称');
// <017> start
{
                sTitle.Add('施行部門コード');
                sTitle.Add('施行部門名称');
                sTitle.Add('施行担当者コード');
                sTitle.Add('施行担当者名称');
}
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
                sTitle.Add('施工部門コード');
                sTitle.Add('施工部門名称');
                sTitle.Add('施工担当者コード');
                sTitle.Add('施工担当者名称');
            end
            else
            begin
                sTitle.Add('製造部門コード');
                sTitle.Add('製造部門名称');
                sTitle.Add('製造担当者コード');
                sTitle.Add('製造担当者名称');
            end;
// <017> end
// <011> ADD end
// <003>↑
// <016> DEL            end;                            // <001>工事のみend

			sTitle.Add('予定工期(開始日)');
			sTitle.Add('予定工期(終了日)');
			sTitle.Add('実績工期(開始日)');
			sTitle.Add('実績工期(終了日)');
			sTitle.Add('完成(引渡)年月日');
// <016> MOD start
// <002>↓
//			sTitle.Add('計上基準区分');
//			sTitle.Add('計上基準名称');
// <002>↑

            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
			    sTitle.Add('売上計上基準区分');
			    sTitle.Add('売上計上基準名称');
			    sTitle.Add('配賦区分');
			    sTitle.Add('配賦区分名称');
            //<024> -St
            //end;
            end
            else
            begin
                //Gali2 のプロジェクトの場合
                if TMSeries.IsGalielopt2 then
                begin
			        sTitle.Add('売上計上基準区分');
			        sTitle.Add('売上計上基準名称');
	    		    sTitle.Add('配賦区分');
    			    sTitle.Add('配賦区分名称');
                end;
            end;
            //<024> -Ed

			sTitle.Add('入力区分');
			sTitle.Add('入力区分名称');
			sTitle.Add('翌期移送区分');
			sTitle.Add('翌期移送区分名称');
{
// <011> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
                sTitle.Add('請負区分');
                sTitle.Add('請負区分名称');
            end;
// <011> ADD end
}
            sTitle.Add('請負区分');
            sTitle.Add('請負区分名称');
// <016> MOD end

// <013> MOD start
//            sTitle.Add('備考');                     // <005>
            if m_pRec.m_sParameter <> '1' then
            begin
// <016> MOD start
//                sTitle.Add('備考');
                sTitle.Add('概要');
                sTitle.Add('備考');
// <016> MOD end
            end;

// <013> MOD end
// <001>↓
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
// <001>↑
                sTitle.Add('工事概要');             // ADD <011>
                sTitle.Add('備考');                 // ADD <013>
                sTitle.Add('完成振替パターン');
                sTitle.Add('完成振替パターン名称');
            end;                            // <001>工事のみend
//            if MasterInfo_DMemDataKojKbn2.AsInteger <> 0 then
            begin
// <001>↓
                if m_pRec.m_sParameter = '1' then   // 工事のみ
                begin
// <001>↑
// <015> ADD start
                sTitle.Add('売上高自動振替区分');
                sTitle.Add('売上高自動振替区分名称');
// <015> ADD end
// <>
                sTitle.Add('売上計上科目コード');
//                sTitle.Add('売上計上科目コード名称'); // <001>削除
                sTitle.Add('売上計上科目名称');         // <001>追加
                sTitle.Add('完成売上高相手勘定区分');
                sTitle.Add('完成売上高相手勘定区分名称');
                //<024> -St
                end
                //end;
                else
                begin
                    //Gali2 のプロジェクトの場合
                    if TMSeries.IsGalielopt2 then
                    begin
                        sTitle.Add('完成振替パターン');
                        sTitle.Add('完成振替パターン名称');
                        sTitle.Add('売上高自動振替区分');
                        sTitle.Add('売上高自動振替区分名称');
                        sTitle.Add('売上計上科目コード');
                        sTitle.Add('売上計上科目名称');
                        sTitle.Add('完成売上高相手勘定区分');
                        sTitle.Add('完成売上高相手勘定区分名称');
                    end;
                end;
                //<024> -Ed
                
            end;

//            if MasterInfo_DMemDataKsyUse.AsInteger <> 0 then
            begin
//<019> MOD St
{
                sTitle.Add(ppLabel103.Caption);
                sTitle.Add(ppLabel103.Caption+'名称');
                sTitle.Add(ppLabel104.Caption);
                sTitle.Add(ppLabel104.Caption+'名称');
}
                if m_pRec.m_sParameter = '1' then   // 工事
                begin
                    sTitle.Add(ppLabel103.Caption);
                    sTitle.Add(ppLabel103.Caption+'名称');
                    sTitle.Add(ppLabel104.Caption);
                    sTitle.Add(ppLabel104.Caption+'名称');
                end
                else  // プロジェクト
                begin
                    sTitle.Add(ppLabel189.Caption);
                    sTitle.Add(ppLabel189.Caption+'名称');
                    sTitle.Add(ppLabel190.Caption);
                    sTitle.Add(ppLabel190.Caption+'名称');
                end;
//<019> MOD Ed
            end;
// <001>↓追加
            //<024> -st
            {// 工事完成振替
            if (m_pRec.m_sParameter = '1') and (m_iKojUse = 1) then   // B/S工事のみ
            begin
                sTitle.Add('工事完成振替１マスタ区分');
                sTitle.Add('工事完成振替１マスタ名称');
                sTitle.Add('工事完成振替１振替先コード');
                sTitle.Add('工事完成振替１振替先名称');
                sTitle.Add('工事完成振替２マスタ区分');
                sTitle.Add('工事完成振替２マスタ名称');
                sTitle.Add('工事完成振替２振替先コード');
                sTitle.Add('工事完成振替２振替先名称');
                sTitle.Add('工事完成振替３マスタ区分');
                sTitle.Add('工事完成振替３マスタ名称');
                sTitle.Add('工事完成振替３振替先コード');
                sTitle.Add('工事完成振替３振替先名称');
                sTitle.Add('工事完成振替４マスタ区分');
                sTitle.Add('工事完成振替４マスタ名称');
                sTitle.Add('工事完成振替４振替先コード');
                sTitle.Add('工事完成振替４振替先名称');
                sTitle.Add('工事完成振替５マスタ区分');
                sTitle.Add('工事完成振替５マスタ名称');
                sTitle.Add('工事完成振替５振替先コード');
                sTitle.Add('工事完成振替５振替先名称');
                sTitle.Add('工事完成振替６マスタ区分');
                sTitle.Add('工事完成振替６マスタ名称');
                sTitle.Add('工事完成振替６振替先コード');
                sTitle.Add('工事完成振替６振替先名称');
                sTitle.Add('工事完成振替７マスタ区分');
                sTitle.Add('工事完成振替７マスタ名称');
                sTitle.Add('工事完成振替７振替先コード');
                sTitle.Add('工事完成振替７振替先名称');
                sTitle.Add('工事完成振替８マスタ区分');
                sTitle.Add('工事完成振替８マスタ名称');
                sTitle.Add('工事完成振替８振替先コード');
                sTitle.Add('工事完成振替８振替先名称');
                sTitle.Add('工事完成振替９マスタ区分');
                sTitle.Add('工事完成振替９マスタ名称');
                sTitle.Add('工事完成振替９振替先コード');
                sTitle.Add('工事完成振替９振替先名称');
                sTitle.Add('工事完成振替１０マスタ区分');
                sTitle.Add('工事完成振替１０マスタ名称');
                sTitle.Add('工事完成振替１０振替先コード');
                sTitle.Add('工事完成振替１０振替先名称');
                sTitle.Add('工事完成振替１１マスタ区分');
                sTitle.Add('工事完成振替１１マスタ名称');
                sTitle.Add('工事完成振替１１振替先コード');
                sTitle.Add('工事完成振替１１振替先名称');
                sTitle.Add('工事完成振替１２マスタ区分');
                sTitle.Add('工事完成振替１２マスタ名称');
                sTitle.Add('工事完成振替１２振替先コード');
                sTitle.Add('工事完成振替１２振替先名称');
                sTitle.Add('工事完成振替１３マスタ区分');
                sTitle.Add('工事完成振替１３マスタ名称');
                sTitle.Add('工事完成振替１３振替先コード');
                sTitle.Add('工事完成振替１３振替先名称');
                sTitle.Add('工事完成振替１４マスタ区分');
                sTitle.Add('工事完成振替１４マスタ名称');
                sTitle.Add('工事完成振替１４振替先コード');
                sTitle.Add('工事完成振替１４振替先名称');
                sTitle.Add('工事完成振替１５マスタ区分');
                sTitle.Add('工事完成振替１５マスタ名称');
                sTitle.Add('工事完成振替１５振替先コード');
                sTitle.Add('工事完成振替１５振替先名称');
                sTitle.Add('工事完成振替１６マスタ区分');
                sTitle.Add('工事完成振替１６マスタ名称');
                sTitle.Add('工事完成振替１６振替先コード');
                sTitle.Add('工事完成振替１６振替先名称');
                sTitle.Add('工事完成振替１７マスタ区分');
                sTitle.Add('工事完成振替１７マスタ名称');
                sTitle.Add('工事完成振替１７振替先コード');
                sTitle.Add('工事完成振替１７振替先名称');
                sTitle.Add('工事完成振替１８マスタ区分');
                sTitle.Add('工事完成振替１８マスタ名称');
                sTitle.Add('工事完成振替１８振替先コード');
                sTitle.Add('工事完成振替１８振替先名称');
                sTitle.Add('工事完成振替１９マスタ区分');
                sTitle.Add('工事完成振替１９マスタ名称');
                sTitle.Add('工事完成振替１９振替先コード');
                sTitle.Add('工事完成振替１９振替先名称');
                sTitle.Add('工事完成振替２０マスタ区分');
                sTitle.Add('工事完成振替２０マスタ名称');
                sTitle.Add('工事完成振替２０振替先コード');
                sTitle.Add('工事完成振替２０振替先名称');
                sTitle.Add('工事完成振替２１マスタ区分');
                sTitle.Add('工事完成振替２１マスタ名称');
                sTitle.Add('工事完成振替２１振替先コード');
                sTitle.Add('工事完成振替２１振替先名称');
                sTitle.Add('工事完成振替２２マスタ区分');
                sTitle.Add('工事完成振替２２マスタ名称');
                sTitle.Add('工事完成振替２２振替先コード');
                sTitle.Add('工事完成振替２２振替先名称');
                sTitle.Add('工事完成振替２３マスタ区分');
                sTitle.Add('工事完成振替２３マスタ名称');
                sTitle.Add('工事完成振替２３振替先コード');
                sTitle.Add('工事完成振替２３振替先名称');
                sTitle.Add('工事完成振替２４マスタ区分');
                sTitle.Add('工事完成振替２４マスタ名称');
                sTitle.Add('工事完成振替２４振替先コード');
                sTitle.Add('工事完成振替２４振替先名称');
                sTitle.Add('工事完成振替２５マスタ区分');
                sTitle.Add('工事完成振替２５マスタ名称');
                sTitle.Add('工事完成振替２５振替先コード');
                sTitle.Add('工事完成振替２５振替先名称');
            end;}
            if ((m_pRec.m_sParameter = '1') and (m_iKojUse = 1)) or                             // B/S   工事
            ((m_pRec.m_sParameter <> '1') and  (TMSeries.IsGalielopt2 = True)) then             // Gali2 プロジェクト
            begin
                sPrjTitle := '';
                if (m_pRec.m_sParameter = '1') and (m_iKojUse = 1) then                         // B/S   工事
                    sPrjTitle := '工事'
                else if (m_pRec.m_sParameter <> '1') and  (TMSeries.IsGalielopt2 = True) then   // Gali2 プロジェクト
                    sPrjTitle :='プロジェクト';

                //「工事完成」の見出しを変数から取得に変更
                sTitle.Add(sPrjTitle + '完成振替１マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２振替先名称');
                sTitle.Add(sPrjTitle + '完成振替３マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替３マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替３振替先コード');
                sTitle.Add(sPrjTitle + '完成振替３振替先名称');
                sTitle.Add(sPrjTitle + '完成振替４マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替４マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替４振替先コード');
                sTitle.Add(sPrjTitle + '完成振替４振替先名称');
                sTitle.Add(sPrjTitle + '完成振替５マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替５マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替５振替先コード');
                sTitle.Add(sPrjTitle + '完成振替５振替先名称');
                sTitle.Add(sPrjTitle + '完成振替６マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替６マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替６振替先コード');
                sTitle.Add(sPrjTitle + '完成振替６振替先名称');
                sTitle.Add(sPrjTitle + '完成振替７マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替７マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替７振替先コード');
                sTitle.Add(sPrjTitle + '完成振替７振替先名称');
                sTitle.Add(sPrjTitle + '完成振替８マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替８マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替８振替先コード');
                sTitle.Add(sPrjTitle + '完成振替８振替先名称');
                sTitle.Add(sPrjTitle + '完成振替９マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替９マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替９振替先コード');
                sTitle.Add(sPrjTitle + '完成振替９振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１０マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１０マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１０振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１０振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１１マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１１マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１１振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１１振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１２マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１２マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１２振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１２振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１３マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１３マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１３振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１３振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１４マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１４マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１４振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１４振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１５マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１５マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１５振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１５振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１６マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１６マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１６振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１６振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１７マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１７マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１７振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１７振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１８マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１８マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１８振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１８振替先名称');
                sTitle.Add(sPrjTitle + '完成振替１９マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替１９マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替１９振替先コード');
                sTitle.Add(sPrjTitle + '完成振替１９振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２０マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２０マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２０振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２０振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２１マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２１マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２１振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２１振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２２マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２２マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２２振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２２振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２３マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２３マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２３振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２３振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２４マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２４マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２４振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２４振替先名称');
                sTitle.Add(sPrjTitle + '完成振替２５マスタ区分');
                sTitle.Add(sPrjTitle + '完成振替２５マスタ名称');
                sTitle.Add(sPrjTitle + '完成振替２５振替先コード');
                sTitle.Add(sPrjTitle + '完成振替２５振替先名称');
            end;
            //<024> -Ed
// <001>↑
			sTitle.Add('最終更新日時');
			sTitle.Add('契約金額入力方法');  //<TAX> ADD
			sTitle.Add('契約情報１契約年月日');
			sTitle.Add('契約情報１契約書ＮＯ');
			sTitle.Add('契約情報１契約金額');
			sTitle.Add('契約情報１税率');
			sTitle.Add('契約情報１税率名称');									//<006>
			sTitle.Add('契約情報１消費税額');
			sTitle.Add('契約情報２契約年月日');
			sTitle.Add('契約情報２契約書ＮＯ');
			sTitle.Add('契約情報２契約金額');
			sTitle.Add('契約情報２税率');
			sTitle.Add('契約情報２税率名称');									//<006>
			sTitle.Add('契約情報２消費税額');
			sTitle.Add('契約情報３契約年月日');
			sTitle.Add('契約情報３契約書ＮＯ');
			sTitle.Add('契約情報３契約金額');
			sTitle.Add('契約情報３税率');
			sTitle.Add('契約情報３税率名称');									//<006>
			sTitle.Add('契約情報３消費税額');
			sTitle.Add('契約情報４契約年月日');
			sTitle.Add('契約情報４契約書ＮＯ');
			sTitle.Add('契約情報４契約金額');
			sTitle.Add('契約情報４税率');
			sTitle.Add('契約情報４税率名称');									//<006>
			sTitle.Add('契約情報４消費税額');
			sTitle.Add('契約情報５契約年月日');
			sTitle.Add('契約情報５契約書ＮＯ');
			sTitle.Add('契約情報５契約金額');
			sTitle.Add('契約情報５税率');
			sTitle.Add('契約情報５税率名称');									//<006>
			sTitle.Add('契約情報５消費税額');
			sTitle.Add('契約情報６契約年月日');
			sTitle.Add('契約情報６契約書ＮＯ');
			sTitle.Add('契約情報６契約金額');
			sTitle.Add('契約情報６税率');
			sTitle.Add('契約情報６税率名称');									//<006>
			sTitle.Add('契約情報６消費税額');
			sTitle.Add('契約情報７契約年月日');
			sTitle.Add('契約情報７契約書ＮＯ');
			sTitle.Add('契約情報７契約金額');
			sTitle.Add('契約情報７税率');
			sTitle.Add('契約情報７税率名称');									//<006>
			sTitle.Add('契約情報７消費税額');
			sTitle.Add('契約情報８契約年月日');
			sTitle.Add('契約情報８契約書ＮＯ');
			sTitle.Add('契約情報８契約金額');
			sTitle.Add('契約情報８税率');
			sTitle.Add('契約情報８税率名称');									//<006>
			sTitle.Add('契約情報８消費税額');
			sTitle.Add('入金予定情報１入金予定日');
			sTitle.Add('入金予定情報１入金予定金額');
			sTitle.Add('入金予定情報２入金予定日');
			sTitle.Add('入金予定情報２入金予定金額');
			sTitle.Add('入金予定情報３入金予定日');
			sTitle.Add('入金予定情報３入金予定金額');
			sTitle.Add('入金予定情報４入金予定日');
			sTitle.Add('入金予定情報４入金予定金額');
			sTitle.Add('入金予定情報５入金予定日');
			sTitle.Add('入金予定情報５入金予定金額');
			sTitle.Add('入金予定情報６入金予定日');
			sTitle.Add('入金予定情報６入金予定金額');
			sTitle.Add('入金予定情報７入金予定日');
			sTitle.Add('入金予定情報７入金予定金額');
			sTitle.Add('入金予定情報８入金予定日');
			sTitle.Add('入金予定情報８入金予定金額');
			sTitle.Add('入金予定情報９入金予定日');
			sTitle.Add('入金予定情報９入金予定金額');
			sTitle.Add('入金予定情報１０入金予定日');
			sTitle.Add('入金予定情報１０入金予定金額');
			sTitle.Add('合計契約金額');
			sTitle.Add('合計消費税額');
			sTitle.Add('合計入金予定金額');

			sMemFld.Add('GCode');
			sMemFld.Add('RenChar');
			sMemFld.Add('LongName');
			sMemFld.Add('SimpleName');
			//sMemFld.Add('FusenCmt');
// <016> DEL start
{
// <001>↓
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
// <001>↑
}
// <016> DEL end
    			sMemFld.Add('ZipCode1');
	    		sMemFld.Add('ZipCode2');
		    	sMemFld.Add('Address1');
			    sMemFld.Add('Address2');
    			sMemFld.Add('TelNo');
                sMemFld.Add('FAXNo');                 // <011>
	    		sMemFld.Add('BmnCode');
		    	sMemFld.Add('BmnCodeName');
			    sMemFld.Add('PersonCode');
    			sMemFld.Add('PersonCodeName');
	    		sMemFld.Add('CostomerCode');
		    	sMemFld.Add('CostomerCodeName');
			    sMemFld.Add('CostomerName');    // <003>受注先 <004>復帰
// <011> ADD start
                sMemFld.Add('SeshuCode');
                sMemFld.Add('SeshuCodeName');
                sMemFld.Add('SekouBmnCode');
                sMemFld.Add('SekouBmnCodeName');
                sMemFld.Add('SekouPersonCode');
                sMemFld.Add('SekouPersonCodeName');
// <011> ADD end

// <016> DEL start            end;                            // <001>工事のみend
//			sMemFld.Add('StartDate');
//			sMemFld.Add('ScheduleDate');
			sMemFld.Add('ScheduleDateS');
			sMemFld.Add('ScheduleDate');
			sMemFld.Add('StartDate');
			sMemFld.Add('EndDate');

			sMemFld.Add('FinishDate');

// <016> MOD start
// <002>↓
//			sMemFld.Add('SalesBase');
//			sMemFld.Add('SalesBaseName');
// <002>↑

//			sMemFld.Add('HaifuKbn');
//			sMemFld.Add('HaifuKbnName');
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
			    sMemFld.Add('SalesBase');
			    sMemFld.Add('SalesBaseName');

			    sMemFld.Add('HaifuKbn');
			    sMemFld.Add('HaifuKbnName');
            //<024> -St
            //end;
            end
            else
            begin
                //Gali2 のプロジェクトの場合
                if TMSeries.IsGalielopt2 then
                begin
                    sMemFld.Add('SalesBase');
                    sMemFld.Add('SalesBaseName');

                    sMemFld.Add('HaifuKbn');
                    sMemFld.Add('HaifuKbnName');
                end;
            end;
            //<024> -Ed

// <016> MOD end
			sMemFld.Add('BunCode');
			sMemFld.Add('BunCodeName');
			sMemFld.Add('MoveKbn');
			sMemFld.Add('MoveKbnName');
// <016> MOD start
{
// <011> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
                sMemFld.Add('UkeoiKbn');
                sMemFld.Add('UkeoiKbnName');
            end;
// <011> ADD end
}
            sMemFld.Add('UkeoiKbn');
            sMemFld.Add('UkeoiKbnName');
// <016> MOD end

// <013> MOD start
//            sMemFld.Add('BIKO');                    // <005>備考
            if m_pRec.m_sParameter <> '1' then
            begin
// <016> MOD start
//                sMemFld.Add('BIKO');
                sMemFld.Add('Gaiyou');
                sMemFld.Add('BIKO');
// <016> MOD end
            end;

// <013> MOD start
// <001>↓
            if m_pRec.m_sParameter = '1' then       // 工事のみ
            begin
// <001>↑
                sMemFld.Add('Gaiyou');              // ADD <011>
                sMemFld.Add('BIKO');                // ADD <013>
                sMemFld.Add('DetailKbn1');
                sMemFld.Add('DetailKbn1Name');
            end;
// <001>工事のみend
            //if MasterInfo_DMemDataKojKbn2.AsInteger <> 0 then
            begin
// <001>↓
                if m_pRec.m_sParameter = '1' then   // 工事のみ
                begin
// <001>↑
// <015> ADD start
                    sMemFld.Add('KojKbn2');
                    sMemFld.Add('KojKbn2Name');
// <015> ADD end
                    sMemFld.Add('SalesKmkCd');
                    sMemFld.Add('SalesKmkCdName');
                    sMemFld.Add('DetailKbn2');
                    sMemFld.Add('DetailKbn2Name');
                //<024> -St
                end
                //end;
                else
                begin
                    // Gali2 ﾌﾟﾛｼﾞｪｸﾄの場合
                    if TMSeries.IsGalielopt2 then
                    begin
                        //完成振替パターン
                        sMemFld.Add('DetailKbn1');
                        sMemFld.Add('DetailKbn1Name');

                        //完成売上高自動振替区分
                        sMemFld.Add('KojKbn2');
                        sMemFld.Add('KojKbn2Name');
                        //売上計上科目コード
                        sMemFld.Add('SalesKmkCd');
                        sMemFld.Add('SalesKmkCdName');
                        //完成売上高相手勘定区分
                        sMemFld.Add('DetailKbn2');
                        sMemFld.Add('DetailKbn2Name');
                    end;
                end;
                //<024> -Ed

            end;
            //if MasterInfo_DMemDataKsyUse.AsInteger <> 0 then
            begin
                sMemFld.Add('PartKbn');
                sMemFld.Add('PartKbnName');
                sMemFld.Add('PatternNo');
                sMemFld.Add('PatternNoName');
            end;

// <001>↓追加
            // 工事完成振替
            if (m_pRec.m_sParameter = '1') and (m_iKojUse = 1) then   // B/S工事のみ
            begin
                for iCnt := 1 to 25 do
                begin
                    sMemFld.Add('MasKbn' + IntToStr(iCnt));
                    sMemFld.Add('MasNm' + IntToStr(iCnt));
                    sMemFld.Add('KanseiCd' + IntToStr(iCnt));
                    sMemFld.Add('KanseiNm' + IntToStr(iCnt));
                end;
            //<024> -St
            //end;
            end
            // Gali2 ﾌﾟﾛｼﾞｪｸﾄの場合
            else if (m_pRec.m_sParameter <> '1') and  (TMSeries.IsGalielopt2 = True) then   // Gali2 プロジェクト
            begin
                for iCnt := 1 to 25 do
                begin
                    sMemFld.Add('MasKbn' + IntToStr(iCnt));
                    sMemFld.Add('MasNm' + IntToStr(iCnt));
                    sMemFld.Add('KanseiCd' + IntToStr(iCnt));
                    sMemFld.Add('KanseiNm' + IntToStr(iCnt));
                end;
            end;
            //<024> -Ed

// <001>↑
			sMemFld.Add('UpDateTime');
			sMemFld.Add('PartPatternName');  //<TAX> ADD
			sMemFld.Add('ContDateK1');
			sMemFld.Add('ContNoK1');
			sMemFld.Add('ContMoneyK1');
			sMemFld.Add('Tax_RateK1');
			sMemFld.Add('Tax_RateK1Name');										//<006>
			sMemFld.Add('Sales_TaxK1');

			sMemFld.Add('ContDateK2');
			sMemFld.Add('ContNoK2');
			sMemFld.Add('ContMoneyK2');
			sMemFld.Add('Tax_RateK2');
			sMemFld.Add('Tax_RateK2Name');										//<006>
			sMemFld.Add('Sales_TaxK2');

			sMemFld.Add('ContDateK3');
			sMemFld.Add('ContNoK3');
			sMemFld.Add('ContMoneyK3');
			sMemFld.Add('Tax_RateK3');
			sMemFld.Add('Tax_RateK3Name');										//<006>
			sMemFld.Add('Sales_TaxK3');

			sMemFld.Add('ContDateK4');
			sMemFld.Add('ContNoK4');
			sMemFld.Add('ContMoneyK4');
			sMemFld.Add('Tax_RateK4');
			sMemFld.Add('Tax_RateK4Name');										//<006>
			sMemFld.Add('Sales_TaxK4');

			sMemFld.Add('ContDateK5');
			sMemFld.Add('ContNoK5');
			sMemFld.Add('ContMoneyK5');
			sMemFld.Add('Tax_RateK5');
			sMemFld.Add('Tax_RateK5Name');										//<006>
			sMemFld.Add('Sales_TaxK5');

			sMemFld.Add('ContDateK6');
			sMemFld.Add('ContNoK6');
			sMemFld.Add('ContMoneyK6');
			sMemFld.Add('Tax_RateK6');
			sMemFld.Add('Tax_RateK6Name');										//<006>
			sMemFld.Add('Sales_TaxK6');

			sMemFld.Add('ContDateK7');
			sMemFld.Add('ContNoK7');
			sMemFld.Add('ContMoneyK7');
			sMemFld.Add('Tax_RateK7');
			sMemFld.Add('Tax_RateK7Name');										//<006>
			sMemFld.Add('Sales_TaxK7');

			sMemFld.Add('ContDateK8');
			sMemFld.Add('ContNoK8');
			sMemFld.Add('ContMoneyK8');
			sMemFld.Add('Tax_RateK8');
			sMemFld.Add('Tax_RateK8Name');										//<006>
			sMemFld.Add('Sales_TaxK8');

			sMemFld.Add('ContDateN1');
			sMemFld.Add('ContMoneyN1');

			sMemFld.Add('ContDateN2');
			sMemFld.Add('ContMoneyN2');

			sMemFld.Add('ContDateN3');
			sMemFld.Add('ContMoneyN3');

			sMemFld.Add('ContDateN4');
			sMemFld.Add('ContMoneyN4');

			sMemFld.Add('ContDateN5');
			sMemFld.Add('ContMoneyN5');

			sMemFld.Add('ContDateN6');
			sMemFld.Add('ContMoneyN6');

			sMemFld.Add('ContDateN7');
			sMemFld.Add('ContMoneyN7');

			sMemFld.Add('ContDateN8');
			sMemFld.Add('ContMoneyN8');

			sMemFld.Add('ContDateN9');
			sMemFld.Add('ContMoneyN9');

			sMemFld.Add('ContDateN10');
			sMemFld.Add('ContMoneyN10');

			sMemFld.Add('KeiyakuG');
			sMemFld.Add('ShohiG');
			sMemFld.Add('NyukinG');
		end;
		GOUKEIKANRYAKU:
		begin
			sTitle.Add('コード');
			sTitle.Add('連想');
			sTitle.Add('正式名称');
			sTitle.Add('簡略名称');

			sMemFld.Add('GCode');
			sMemFld.Add('RenChar');
			sMemFld.Add('LongName');
			sMemFld.Add('SimpleName');
		end;
		GOUKEISHOSAI:
		begin
			sTitle.Add('コード');
			sTitle.Add('連想');
			sTitle.Add('正式名称');
			sTitle.Add('簡略名称');
			//sTitle.Add('付箋コメント');
// <016> DEL start
{
// <001>↓
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
// <001>↑
}
// <016> DEL end
        		sTitle.Add('郵便番号基番');
		    	sTitle.Add('郵便番号枝番');
			    sTitle.Add('住所上段');
    			sTitle.Add('住所下段');
	    		sTitle.Add('電話番号');
	    		sTitle.Add('FAX番号');             // ADD <011>
		    	sTitle.Add('担当者コード');
			    sTitle.Add('担当者名称');
// <003>↓<004>復帰
    			sTitle.Add('受注者コード');
	    		sTitle.Add('受注者名称');
//<007>	    	sTitle.Add('受注者');
		    	sTitle.Add('受注先');											//<007>
//    			sTitle.Add('受注先コード');
//	    		sTitle.Add('受注先名称');
// <003>↑
// <011> ADD start
                sTitle.Add('施主ｺｰﾄﾞ');
                sTitle.Add('施主名称');
// <016> MOD start
{
                sTitle.Add('施行部門コード');
                sTitle.Add('施行部門名称');
                sTitle.Add('施行担当者コード');
                sTitle.Add('施行担当者名称');
}
                if m_pRec.m_sParameter = '1' then
                begin
// <017> start
{
                    sTitle.Add('施行部門コード');
                    sTitle.Add('施行部門名称');
                    sTitle.Add('施行担当者コード');
                    sTitle.Add('施行担当者名称');
}
                    sTitle.Add('施工部門コード');
                    sTitle.Add('施工部門名称');
                    sTitle.Add('施工担当者コード');
                    sTitle.Add('施工担当者名称');
// <017> end
                end
                else
                begin
                    sTitle.Add('製造部門コード');
                    sTitle.Add('製造部門名称');
                    sTitle.Add('製造担当者コード');
                    sTitle.Add('製造担当者名称');
                end;
// <016> MOD end
                sTitle.Add('請負区分');
                sTitle.Add('請負区分名称');
// <011> ADD end
// <016> DEL             end;                            // <001>工事のみend
			sTitle.Add('名寄せ区分');
			sTitle.Add('名寄せ区分名称');
			sTitle.Add(ppBmnG.Caption + 'コード');
			sTitle.Add(ppBmnG.Caption + '名称');
			sTitle.Add('予定工期(開始日)');
			sTitle.Add('予定工期(終了日)');
			sTitle.Add('実績工期(開始日)');
			sTitle.Add('実績工期(終了日)');
			sTitle.Add('完成(引渡)年月日');
// <002>↓
//			sTitle.Add('計上基準区分');
//			sTitle.Add('計上基準名称');
// <002>↑
// <003>↓
{			sTitle.Add('配賦区分');
			sTitle.Add('配賦区分名称');
			sTitle.Add('翌期移送区分');
			sTitle.Add('翌期移送区分名称');
}
// <003>↑

// <012> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
// <013> MOD start
//                sTitle.Add('備考');
//                sTitle.Add('工事概要');
                sTitle.Add('工事概要');
                sTitle.Add('備考');
// <013> MOD end
            end
// <012> ADD end
// <016> ADD start
            else
            begin
                sTitle.Add('概要');
                sTitle.Add('備考');
            end;
// <016> ADD end
			sTitle.Add('最終更新日時');
			sTitle.Add('契約情報１契約年月日');
			sTitle.Add('契約情報１契約書ＮＯ');
			sTitle.Add('契約情報１契約金額');
			sTitle.Add('契約情報１税率');
			sTitle.Add('契約情報１税率名称');									//<006>
			sTitle.Add('契約情報１消費税額');
			sTitle.Add('契約情報２契約年月日');
			sTitle.Add('契約情報２契約書ＮＯ');
			sTitle.Add('契約情報２契約金額');
			sTitle.Add('契約情報２税率');
			sTitle.Add('契約情報２税率名称');									//<006>
			sTitle.Add('契約情報２消費税額');
			sTitle.Add('契約情報３契約年月日');
			sTitle.Add('契約情報３契約書ＮＯ');
			sTitle.Add('契約情報３契約金額');
			sTitle.Add('契約情報３税率');
			sTitle.Add('契約情報３税率名称');									//<006>
			sTitle.Add('契約情報３消費税額');
			sTitle.Add('契約情報４契約年月日');
			sTitle.Add('契約情報４契約書ＮＯ');
			sTitle.Add('契約情報４契約金額');
			sTitle.Add('契約情報４税率');
			sTitle.Add('契約情報４税率名称');									//<006>
			sTitle.Add('契約情報４消費税額');
			sTitle.Add('契約情報５契約年月日');
			sTitle.Add('契約情報５契約書ＮＯ');
			sTitle.Add('契約情報５契約金額');
			sTitle.Add('契約情報５税率');
			sTitle.Add('契約情報５税率名称');									//<006>
			sTitle.Add('契約情報５消費税額');
			sTitle.Add('契約情報６契約年月日');
			sTitle.Add('契約情報６契約書ＮＯ');
			sTitle.Add('契約情報６契約金額');
			sTitle.Add('契約情報６税率');
			sTitle.Add('契約情報６税率名称');									//<006>
			sTitle.Add('契約情報６消費税額');
			sTitle.Add('契約情報７契約年月日');
			sTitle.Add('契約情報７契約書ＮＯ');
			sTitle.Add('契約情報７契約金額');
			sTitle.Add('契約情報７税率');
			sTitle.Add('契約情報７税率名称');									//<006>
			sTitle.Add('契約情報７消費税額');
			sTitle.Add('契約情報８契約年月日');
			sTitle.Add('契約情報８契約書ＮＯ');
			sTitle.Add('契約情報８契約金額');
			sTitle.Add('契約情報８税率');
			sTitle.Add('契約情報８税率名称');									//<006>
			sTitle.Add('契約情報８消費税額');
			sTitle.Add('入金予定情報１入金予定日');
			sTitle.Add('入金予定情報１入金予定金額');
			sTitle.Add('入金予定情報２入金予定日');
			sTitle.Add('入金予定情報２入金予定金額');
			sTitle.Add('入金予定情報３入金予定日');
			sTitle.Add('入金予定情報３入金予定金額');
			sTitle.Add('入金予定情報４入金予定日');
			sTitle.Add('入金予定情報４入金予定金額');
			sTitle.Add('入金予定情報５入金予定日');
			sTitle.Add('入金予定情報５入金予定金額');
			sTitle.Add('入金予定情報６入金予定日');
			sTitle.Add('入金予定情報６入金予定金額');
			sTitle.Add('入金予定情報７入金予定日');
			sTitle.Add('入金予定情報７入金予定金額');
			sTitle.Add('入金予定情報８入金予定日');
			sTitle.Add('入金予定情報８入金予定金額');
			sTitle.Add('入金予定情報９入金予定日');
			sTitle.Add('入金予定情報９入金予定金額');
			sTitle.Add('入金予定情報１０入金予定日');
			sTitle.Add('入金予定情報１０入金予定金額');
			sTitle.Add('合計契約金額');
			sTitle.Add('合計消費税額');
			sTitle.Add('合計入金予定金額');

			sMemFld.Add('GCode');
			sMemFld.Add('RenChar');
			sMemFld.Add('LongName');
			sMemFld.Add('SimpleName');
			//sMemFld.Add('FusenCmt');

// <016> DEL start
{
// <001>↓
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
// <001>↑
}
// <016> DEL end
// <003>↓
//    			sMemFld.Add('ZipCode1');
//	    		sMemFld.Add('ZipCode2');
    			sMemFld.Add('strZipCode1');
	    		sMemFld.Add('strZipCode2');
// <003>↑
		    	sMemFld.Add('Address1');
    			sMemFld.Add('Address2');
	    		sMemFld.Add('TelNo');
                sMemFld.Add('FAXNo');                 // <011>
		    	sMemFld.Add('PersonCode');
    			sMemFld.Add('PersonCodeName');
	    		sMemFld.Add('CostomerCode');
		    	sMemFld.Add('CostomerCodeName');
			    sMemFld.Add('CostomerName');    // <003>受注先<004>復帰
// <011> ADD start
                sMemFld.Add('SeshuCode');
                sMemFld.Add('SeshuCodeName');
                sMemFld.Add('SekouBmnCode');
                sMemFld.Add('SekouBmnCodeName');
                sMemFld.Add('SekouPersonCode');
                sMemFld.Add('SekouPersonCodeName');
                sMemFld.Add('UkeoiKbn');
                sMemFld.Add('UkeoiKbnName');
// <011> ADD end
// <016> DEL             end;                            // <001>工事のみend
			sMemFld.Add('RootKbn');
			sMemFld.Add('RootKbnName');
			sMemFld.Add('BmnCode');
			sMemFld.Add('BmnCodeName');
//			sMemFld.Add('StartDate');
//			sMemFld.Add('ScheduleDate');
			sMemFld.Add('ScheduleDateS');
			sMemFld.Add('ScheduleDate');
			sMemFld.Add('StartDate');
			sMemFld.Add('EndDate');
			sMemFld.Add('FinishDate');
// <002>↓
//			sMemFld.Add('SalesBase');
//			sMemFld.Add('SalesBaseName');
// <002>↑
// <003>↓
{			sMemFld.Add('HaifuKbn');
			sMemFld.Add('HaifuKbnName');
			sMemFld.Add('MoveKbn');
			sMemFld.Add('MoveKbnName');
}
// <003>↑

// <012> ADD start
// <016> DEL start
{
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
}
// <016> DEL end
// <013> MOD start
//                sMemFld.Add('BIKO');        // 備考
//                sMemFld.Add('Gaiyou');      // 工事概要
                sMemFld.Add('Gaiyou');  // 工事概要
                sMemFld.Add('BIKO');    // 備考
// <013> MOD end
// <016> DEL             end;
// <012> ADD end
			sMemFld.Add('UpDateTime');

			sMemFld.Add('ContDateK1');
			sMemFld.Add('ContNoK1');
			sMemFld.Add('ContMoneyK1');
			sMemFld.Add('Tax_RateK1');
			sMemFld.Add('Tax_RateK1Name');										//<006>
			sMemFld.Add('Sales_TaxK1');

			sMemFld.Add('ContDateK2');
			sMemFld.Add('ContNoK2');
			sMemFld.Add('ContMoneyK2');
			sMemFld.Add('Tax_RateK2');
			sMemFld.Add('Tax_RateK2Name');										//<006>
			sMemFld.Add('Sales_TaxK2');

			sMemFld.Add('ContDateK3');
			sMemFld.Add('ContNoK3');
			sMemFld.Add('ContMoneyK3');
			sMemFld.Add('Tax_RateK3');
			sMemFld.Add('Tax_RateK3Name');										//<006>
			sMemFld.Add('Sales_TaxK3');

			sMemFld.Add('ContDateK4');
			sMemFld.Add('ContNoK4');
			sMemFld.Add('ContMoneyK4');
			sMemFld.Add('Tax_RateK4');
			sMemFld.Add('Tax_RateK4Name');										//<006>
			sMemFld.Add('Sales_TaxK4');

			sMemFld.Add('ContDateK5');
			sMemFld.Add('ContNoK5');
			sMemFld.Add('ContMoneyK5');
			sMemFld.Add('Tax_RateK5');
			sMemFld.Add('Tax_RateK5Name');										//<006>
			sMemFld.Add('Sales_TaxK5');

			sMemFld.Add('ContDateK6');
			sMemFld.Add('ContNoK6');
			sMemFld.Add('ContMoneyK6');
			sMemFld.Add('Tax_RateK6');
			sMemFld.Add('Tax_RateK6Name');										//<006>
			sMemFld.Add('Sales_TaxK6');

			sMemFld.Add('ContDateK7');
			sMemFld.Add('ContNoK7');
			sMemFld.Add('ContMoneyK7');
			sMemFld.Add('Tax_RateK7');
			sMemFld.Add('Tax_RateK7Name');										//<006>
			sMemFld.Add('Sales_TaxK7');

			sMemFld.Add('ContDateK8');
			sMemFld.Add('ContNoK8');
			sMemFld.Add('ContMoneyK8');
			sMemFld.Add('Tax_RateK8');
			sMemFld.Add('Tax_RateK8Name');										//<006>
			sMemFld.Add('Sales_TaxK8');

			sMemFld.Add('ContDateN1');
			sMemFld.Add('ContMoneyN1');

			sMemFld.Add('ContDateN2');
			sMemFld.Add('ContMoneyN2');

			sMemFld.Add('ContDateN3');
			sMemFld.Add('ContMoneyN3');

			sMemFld.Add('ContDateN4');
			sMemFld.Add('ContMoneyN4');

			sMemFld.Add('ContDateN5');
			sMemFld.Add('ContMoneyN5');

			sMemFld.Add('ContDateN6');
			sMemFld.Add('ContMoneyN6');

			sMemFld.Add('ContDateN7');
			sMemFld.Add('ContMoneyN7');

			sMemFld.Add('ContDateN8');
			sMemFld.Add('ContMoneyN8');

			sMemFld.Add('ContDateN9');
			sMemFld.Add('ContMoneyN9');

			sMemFld.Add('ContDateN10');
			sMemFld.Add('ContMoneyN10');

			sMemFld.Add('KeiyakuG');
			sMemFld.Add('ShohiG');
			sMemFld.Add('NyukinG');
		end;
//<009> - ST
		JITUZAIBUNRUI:
		begin
			sTitle.Add	('コード'				);
			sTitle.Add	('正式名称'				);
			sTitle.Add	('適用期間開始'			);
			sTitle.Add	('適用期間終了'			);
			sMemFld.Add	('strExCodeDst'			);
			sMemFld.Add	('strNameSimpleDst'		);
			sMemFld.Add	('dtStart'		        );
			sMemFld.Add	('dtEnd'			    );

            for i:=1 to 10 do
            begin
				case (i) of
					1:  tmpLabel := ppRep_BS_Segment01;
					2:  tmpLabel := ppRep_BS_Segment02;
					3:  tmpLabel := ppRep_BS_Segment03;
					4:  tmpLabel := ppRep_BS_Segment04;
					5:  tmpLabel := ppRep_BS_Segment05;
					6:  tmpLabel := ppRep_BS_Segment06;
					7:  tmpLabel := ppRep_BS_Segment07;
					8:  tmpLabel := ppRep_BS_Segment08;
					9:  tmpLabel := ppRep_BS_Segment09;
					10: tmpLabel := ppRep_BS_Segment10;
				end;
				if ( tmpLabel.Text <> '' ) then
				begin
					sTitle.Add(tmpLabel.Text+'コード'   );
					sTitle.Add(tmpLabel.Text+'名称'     );

					sMemFld.Add('strSeg'+Format('%.2d',[i])+'Code');
					sMemFld.Add('strSeg'+Format('%.2d',[i])+'Name');
				end;
			end;

            for i:=1 to 10 do
            begin
				case (i) of
					1:  tmpLabel := ppRep_BS_Bunrui01;
	                2:  tmpLabel := ppRep_BS_Bunrui02;
					3:  tmpLabel := ppRep_BS_Bunrui03;
					4:  tmpLabel := ppRep_BS_Bunrui04;
					5:  tmpLabel := ppRep_BS_Bunrui05;
					6:  tmpLabel := ppRep_BS_Bunrui06;
					7:  tmpLabel := ppRep_BS_Bunrui07;
					8:  tmpLabel := ppRep_BS_Bunrui08;
					9:  tmpLabel := ppRep_BS_Bunrui09;
					10: tmpLabel := ppRep_BS_Bunrui10;
				end;

				if ( tmpLabel.Text <> '' ) then
				begin
					sTitle.Add(tmpLabel.Text+'コード'   );
					sTitle.Add(tmpLabel.Text+'名称'     );

					sMemFld.Add('strBun'+Format('%.2d',[i])+'Code');
					sMemFld.Add('strBun'+Format('%.2d',[i])+'Name');
				end;
			end;
		end;
//<009> - ED
// <014> ADD start
        JITUZAIKEIYAKU,GOUKEIKEIYAKU:
        begin
//<020> MOD St
//			sTitle.Add('工事コード');
            if m_pRec.m_sParameter = '1' then
                sTitle.Add('工事コード')
            else
                sTitle.Add('プロジェクトコード');
//<020> MOD Ed
			sTitle.Add('簡略名称');
//<TAX> ADD St
            if uvHani.pvrPattern = JITUZAIKEIYAKU then
            begin
    			sTitle.Add('契約金額入力方法');
            end;
//<TAX> ADD Ed
			sTitle.Add('契約年月日');
			sTitle.Add('契約書NO');
			sTitle.Add('契約金額');
			sTitle.Add('税率');
			sTitle.Add('税率名称');
			sTitle.Add('消費税額');

			sMemFld.Add('GCode');
			sMemFld.Add('SimpleName');
//<TAX> ADD St
            if uvHani.pvrPattern = JITUZAIKEIYAKU then
            begin
    			sMemFld.Add('PartPatternName');
            end;
//<TAX> ADD Ed
			sMemFld.Add('ContDate');
			sMemFld.Add('ContNo');
			sMemFld.Add('ContMoney');
			sMemFld.Add('Tax_Rate');
			sMemFld.Add('Tax_RateName');										//<006>
			sMemFld.Add('Sales_Tax');
        end;
        JITUZAIKEIYAKUDTL,GOUKEIKEIYAKUDTL:
        begin
//<020> MOD St
//			sTitle.Add('工事コード');
            if m_pRec.m_sParameter = '1' then
                sTitle.Add('工事コード')
            else
                sTitle.Add('プロジェクトコード');
//<020> MOD Ed
			sTitle.Add('簡略名称');
//<TAX> ADD St
            if uvHani.pvrPattern = JITUZAIKEIYAKUDTL then
            begin
    			sTitle.Add('契約金額入力方法');
            end;
//<TAX> ADD Ed
			sTitle.Add('契約年月日');
			sTitle.Add('契約書NO');
			sTitle.Add('取引先コード');
			sTitle.Add('取引先名称');
			sTitle.Add('契約金額');
			sTitle.Add('税率');
			sTitle.Add('税率名称');
			sTitle.Add('消費税額');

			sMemFld.Add('GCode');
			sMemFld.Add('SimpleName');
//<TAX> ADD St
            if uvHani.pvrPattern = JITUZAIKEIYAKUDTL then
            begin
    			sMemFld.Add('PartPatternName');
            end;
//<TAX> ADD Ed
			sMemFld.Add('ContDate');
			sMemFld.Add('ContNo');
            sMemFld.Add('CostomerCode');
            sMemFld.Add('CostomerName');
			sMemFld.Add('ContMoney');
			sMemFld.Add('Tax_Rate');
			sMemFld.Add('Tax_RateName');										//<006>
			sMemFld.Add('Sales_Tax');
        end;
        JITUZAINYUUKIN,GOUKEINYUUKIN:
        begin
//<020> MOD St
//			sTitle.Add('工事コード');
            if m_pRec.m_sParameter = '1' then
                sTitle.Add('工事コード')
            else
                sTitle.Add('プロジェクトコード');
//<020> MOD Ed
			sTitle.Add('簡略名称');
			sTitle.Add('入金予定情報１入金予定日');
			sTitle.Add('入金予定情報１取引先コード');
			sTitle.Add('入金予定情報１取引先名称');
			sTitle.Add('入金予定情報１入金予定金額');

			sTitle.Add('入金予定情報２入金予定日');
			sTitle.Add('入金予定情報２取引先コード');
			sTitle.Add('入金予定情報２取引先名称');
			sTitle.Add('入金予定情報２入金予定金額');

			sTitle.Add('入金予定情報３入金予定日');
			sTitle.Add('入金予定情報３取引先コード');
			sTitle.Add('入金予定情報３取引先名称');
			sTitle.Add('入金予定情報３入金予定金額');

			sTitle.Add('入金予定情報４入金予定日');
			sTitle.Add('入金予定情報４取引先コード');
			sTitle.Add('入金予定情報４取引先名称');
			sTitle.Add('入金予定情報４入金予定金額');

			sTitle.Add('入金予定情報５入金予定日');
			sTitle.Add('入金予定情報５取引先コード');
			sTitle.Add('入金予定情報５取引先名称');
			sTitle.Add('入金予定情報５入金予定金額');

			sTitle.Add('入金予定情報６入金予定日');
			sTitle.Add('入金予定情報６取引先コード');
			sTitle.Add('入金予定情報６取引先名称');
			sTitle.Add('入金予定情報６入金予定金額');

			sTitle.Add('入金予定情報７入金予定日');
			sTitle.Add('入金予定情報７取引先コード');
			sTitle.Add('入金予定情報７取引先名称');
			sTitle.Add('入金予定情報７入金予定金額');

			sTitle.Add('入金予定情報８入金予定日');
			sTitle.Add('入金予定情報８取引先コード');
			sTitle.Add('入金予定情報８取引先名称');
			sTitle.Add('入金予定情報８入金予定金額');

			sTitle.Add('入金予定情報９入金予定日');
			sTitle.Add('入金予定情報９取引先コード');
			sTitle.Add('入金予定情報９取引先名称');
			sTitle.Add('入金予定情報９入金予定金額');

			sTitle.Add('入金予定情報１０入金予定日');
			sTitle.Add('入金予定情報１０取引先コード');
			sTitle.Add('入金予定情報１０取引先名称');
			sTitle.Add('入金予定情報１０入金予定金額');

			sTitle.Add('合計契約金額');
			sTitle.Add('合計消費税額');
			sTitle.Add('合計入金予定金額');

			sMemFld.Add('GCode');
			sMemFld.Add('SimpleName');
			sMemFld.Add('ContDateN1');
            sMemFld.Add('CostomerCode1');
            sMemFld.Add('CostomerName1');
			sMemFld.Add('ContMoneyN1');

			sMemFld.Add('ContDateN2');
            sMemFld.Add('CostomerCode2');
            sMemFld.Add('CostomerName2');
			sMemFld.Add('ContMoneyN2');

			sMemFld.Add('ContDateN3');
            sMemFld.Add('CostomerCode3');
            sMemFld.Add('CostomerName3');
			sMemFld.Add('ContMoneyN3');

			sMemFld.Add('ContDateN4');
            sMemFld.Add('CostomerCode4');
            sMemFld.Add('CostomerName4');
			sMemFld.Add('ContMoneyN4');

			sMemFld.Add('ContDateN5');
            sMemFld.Add('CostomerCode5');
            sMemFld.Add('CostomerName5');
			sMemFld.Add('ContMoneyN5');

			sMemFld.Add('ContDateN6');
            sMemFld.Add('CostomerCode6');
            sMemFld.Add('CostomerName6');
			sMemFld.Add('ContMoneyN6');

			sMemFld.Add('ContDateN7');
            sMemFld.Add('CostomerCode7');
            sMemFld.Add('CostomerName7');
			sMemFld.Add('ContMoneyN7');

			sMemFld.Add('ContDateN8');
            sMemFld.Add('CostomerCode8');
            sMemFld.Add('CostomerName8');
			sMemFld.Add('ContMoneyN8');

			sMemFld.Add('ContDateN9');
            sMemFld.Add('CostomerCode9');
            sMemFld.Add('CostomerName9');
			sMemFld.Add('ContMoneyN9');

			sMemFld.Add('ContDateN10');
            sMemFld.Add('CostomerCode10');
            sMemFld.Add('CostomerName10');
			sMemFld.Add('ContMoneyN10');

			sMemFld.Add('KeiyakuG');
			sMemFld.Add('ShohiG');
			sMemFld.Add('NyukinG');
        end;
{
        GOUKEINYUUKIN:
        begin
			sTitle.Add('入金予定情報１入金予定日');
			sTitle.Add('入金予定情報１入金予定金額');
			sTitle.Add('入金予定情報２入金予定日');
			sTitle.Add('入金予定情報２入金予定金額');
			sTitle.Add('入金予定情報３入金予定日');
			sTitle.Add('入金予定情報３入金予定金額');
			sTitle.Add('入金予定情報４入金予定日');
			sTitle.Add('入金予定情報４入金予定金額');
			sTitle.Add('入金予定情報５入金予定日');
			sTitle.Add('入金予定情報５入金予定金額');
			sTitle.Add('入金予定情報６入金予定日');
			sTitle.Add('入金予定情報６入金予定金額');
			sTitle.Add('入金予定情報７入金予定日');
			sTitle.Add('入金予定情報７入金予定金額');
			sTitle.Add('入金予定情報８入金予定日');
			sTitle.Add('入金予定情報８入金予定金額');
			sTitle.Add('入金予定情報９入金予定日');
			sTitle.Add('入金予定情報９入金予定金額');
			sTitle.Add('入金予定情報１０入金予定日');
			sTitle.Add('入金予定情報１０入金予定金額');
			sTitle.Add('合計契約金額');
			sTitle.Add('合計消費税額');
			sTitle.Add('合計入金予定金額');

			sMemFld.Add('ContDateN1');
			sMemFld.Add('ContMoneyN1');

			sMemFld.Add('ContDateN2');
			sMemFld.Add('ContMoneyN2');

			sMemFld.Add('ContDateN3');
			sMemFld.Add('ContMoneyN3');

			sMemFld.Add('ContDateN4');
			sMemFld.Add('ContMoneyN4');

			sMemFld.Add('ContDateN5');
			sMemFld.Add('ContMoneyN5');

			sMemFld.Add('ContDateN6');
			sMemFld.Add('ContMoneyN6');

			sMemFld.Add('ContDateN7');
			sMemFld.Add('ContMoneyN7');

			sMemFld.Add('ContDateN8');
			sMemFld.Add('ContMoneyN8');

			sMemFld.Add('ContDateN9');
			sMemFld.Add('ContMoneyN9');

			sMemFld.Add('ContDateN10');
			sMemFld.Add('ContMoneyN10');

			sMemFld.Add('KeiyakuG');
			sMemFld.Add('ShohiG');
			sMemFld.Add('NyukinG');

        end;
}
// <014> ADD end
// <021> ADD start
		KASANTOUROKU:						// 加算登録リスト
		begin
			sTitle.Add	('加算先コード'				);
			sTitle.Add	('加算先名称'				);
			sTitle.Add	('加算元コード'				);
			sTitle.Add	('加算元名称'				);

			sMemFld.Add	('strExCodeDst'				);
			sMemFld.Add	('strNameSimpleDst'			);
			sMemFld.Add	('strExCodeSrc'				);
			sMemFld.Add	('strNameSimpleSrc'			);
		end;
// <021> ADD end
	end;


    if ( MjsFileOut(dsMain.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free;
    sMemFld.Free;

end;
//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP018001L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;
//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure  TDmJNTCRP018001L.fnInzPrint();
var
	strFormatDate		:   String;
	strFormatDateTime	:   String;

    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;

    dqMasterInfo        : TMQuery;
    dqBmnAlign          : TMQuery;
    strCaption          : String;
    tmpNo				: Integer;
begin
    m_strNowCode := '';							// 加算体系用 <021> ADD

    tmpNo := 0;

    //--------------------------------------------------------------------------
    // MasterInfo取得
    //--------------------------------------------------------------------------

	dqMasterInfo    := TMQuery.Create (Self);			    		                        // MQueryの構築
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, dqMasterInfo ); // DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		Close ();
		SQL.Clear ();
//		SQL.Add('SELECT MasterKbn,UseKbn,JHojyoName,CodeDigit,CodeAttr ');              // <001>削除
// <212> MOD start
//		SQL.Add('SELECT MasterKbn,UseKbn,JHojyoName,CodeDigit,CodeAttr, KojUseKbn ');   // <001>追加 工事管理種別も取得
		SQL.Add('SELECT MasterKbn,UseKbn,JHojyoName,CodeDigit,CodeAttr, KojUseKbn, KojKbn17 ');
// <212> MOD end

        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ORDER BY MasterKbn');
		ParamByName('nMasterDivision').AsInteger    := uvHani.pvMasterKbn; // <PRN2>
		Open ();

		if not EOF then
        begin
            m_KojKbn17  := GetFld ('KojKbn17'  ).AsInteger;     // <014> 契約情報連動区分
            strCaption := GetFld ('JHojyoName').AsString;
    		if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then					// ｺｰﾄﾞ属性: 数字
	    	begin
		    	case uvHani.pvrPattern of
			    	JITUZAIKANRYAKU:    // 実在(簡略)
				    begin
//<MLXDEP>↓

						if (TMSeries.IsMjsLink3) then
						begin
	                        strCaption := GetFld ('JHojyoName').AsString + '登録リスト';
                            pplblType0.Visible := False;
						end
                        else
	                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';

//<MLXDEP>↑
//<MLXDEP> DEL                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';

    					ppDBText14.Alignment	:= taRightJustify;
	    			end;
					JITUZAISHOSAI:		// 実在(詳細)
			    	begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
//<009> - ST
//						pDT_Code.Alignment	:= taRightJustify;
						if (m_pRec.m_sParameter = '1') then  // 工事の場合
							pDT_Code.Alignment	 := taRightJustify
						else
							ppDBText17.Alignment := taRightJustify;
//<009> - ED
    				end;
//<009> - ST
					JITUZAIBUNRUI:		// 実在(分類、セグメント)
			    	begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
   	                	DBTxt_BS_GCode.Alignment := taRightJustify;
    				end;
//<009> - ED
			    	GOUKEIKANRYAKU:     // 合計(簡略)
				    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText1.Alignment	:= taRightJustify;
	    			end;
					GOUKEISHOSAI:		// 合計(詳細)
			    	begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
//<009> - ST
//						ppDBText71.Alignment	:= taRightJustify;
						if (m_pRec.m_sParameter = '1') then  // 工事の場合
							ppDBText71.Alignment  := taRightJustify
						else
							ppDBText314.Alignment := taRightJustify;
//<009> - ED
    				end;
// <014> ADD start
                    JITUZAIKEIYAKU:     // 実在契約
                    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
				        if (m_pRec.m_sParameter = '1') and (m_KojKbn17 = 1) then
                            DBTextGCode.Alignment   := taRightJustify
                        else
                            DBKJCode.Alignment   := taRightJustify;
                    end;
                    GOUKEIKEIYAKU:     // 合計契約
                    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
				        if (m_pRec.m_sParameter = '1') and (m_KojKbn17 = 1) then
                            DBTextGCode.Alignment   := taRightJustify
                        else
                            DBKJCode.Alignment   := taRightJustify;
                    end;
                    JITUZAINYUUKIN:     // 実在入金
                    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
                            DBTextCode.Alignment   := taRightJustify
                    end;
                    GOUKEINYUUKIN:     // 合計入金
                    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
                        DBTextCode.Alignment   := taRightJustify
                    end;
                    JITUZAIKEIYAKUDTL:
                    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
                        DBTextGCode.Alignment   := taRightJustify;
                    end;
                    GOUKEIKEIYAKUDTL:
                    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
                        DBTextGCode.Alignment   := taRightJustify;
                    end;
// <014> ADD end
// <021> ADD start
					KASANTOUROKU:			// 加算登録リスト
					begin
                        strCaption := GetFld ('JHojyoName').AsString + '加算登録リスト';
                        ppDBTextExCodeDst.Alignment   := taRightJustify;
                        ppDBTextExCodeSrc.Alignment   := taRightJustify;
					end;
// <021> ADD end
	    		end;
		    end
    		else										   					// ｺｰﾄﾞ属性: 文字
	    	begin
		    	case uvHani.pvrPattern of
			    	JITUZAIKANRYAKU:    // 実在(簡略)
				    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText14.Alignment	:= taLeftJustify;
	    			end;
		    		JITUZAISHOSAI:		// 実在(詳細)
			    	begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
//<009> - ST
//						pDT_Code.Alignment	:= taLeftJustify;
						if (m_pRec.m_sParameter = '1') then  // 工事の場合
							pDT_Code.Alignment	 := taLeftJustify
						else
							ppDBText17.Alignment := taLeftJustify;
//<009> - ED

    				end;
//<009> - ST
					JITUZAIBUNRUI:		// 実在(分類、セグメント)
			    	begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
   	                	DBTxt_BS_GCode.Alignment := taLeftJustify;
    				end;
//<009> - ED
			    	GOUKEIKANRYAKU:     // 合計(簡略)
				    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText1.Alignment	:= taLeftJustify;
	    			end;
		    		GOUKEISHOSAI:		// 合計(詳細)
			    	begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
//<009> - ST
//						ppDBText71.Alignment	:= taLeftJustify;
						if (m_pRec.m_sParameter = '1') then  // 工事の場合
							ppDBText71.Alignment  := taLeftJustify
						else
							ppDBText314.Alignment := taLeftJustify;
//<009> - ED

    				end;
// <014> ADD start
                    JITUZAIKEIYAKU,JITUZAIKEIYAKUDTL:     // 実在契約
                    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
				        if (m_pRec.m_sParameter = '1') and (m_KojKbn17 = 1) then
                            DBTextGCode.Alignment   := taLeftJustify
                        else
                            DBKJCode.Alignment   := taLeftJustify;
                    end;
                    GOUKEIKEIYAKU,GOUKEIKEIYAKUDTL:     // 合計契約
                    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
				        if (m_pRec.m_sParameter = '1') and (m_KojKbn17 = 1) then
                            DBTextGCode.Alignment   := taLeftJustify
                        else
                            DBKJCode.Alignment   := taLeftJustify;
                    end;
                    JITUZAINYUUKIN:     // 実在入金
                    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
                            DBTextCode.Alignment   := taLeftJustify
                    end;
                    GOUKEINYUUKIN:     // 合計入金
                    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
                        DBTextCode.Alignment   := taLeftJustify
                    end;
// <014> ADD end
// <021> ADD start
					KASANTOUROKU:			// 加算登録リスト
					begin
                        strCaption := GetFld ('JHojyoName').AsString + '加算登録リスト';
                        ppDBTextExCodeDst.Alignment   := taLeftJustify;
                        ppDBTextExCodeSrc.Alignment   := taLeftJustify;
					end;
// <021> ADD end
	    		end;
		    end;
            m_iKojUse := GetFld ('KojUseKbn'  ).AsInteger;      // <001>工事管理種別を保存
        end;
		Close;

//<008> - ST
{
		// <PRN2>
		SQL.Clear ();
		SQL.Add('SELECT JHojyoName ');
        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ');
		ParamByName('nMasterDivision').AsInteger    := uvHani.pvMasterKbn + 100;
		Open ();
		if not EOF then
        begin
	        ppLabel103.Caption := GetFld ('JHojyoName').AsString + '管理区分';
    	    ppLabel104.Caption := GetFld ('JHojyoName').AsString + 'パターンＮＯ';
        end
        else
        begin
	        ppLabel103.Caption := '工種管理区分';
    	    ppLabel104.Caption := '工種パターンＮＯ';
        end;

		Close ();
		SQL.Clear;
		SQL.ADD ('SELECT ');
		SQL.ADD ('UseKbn, ');
		SQL.ADD ('JHojyoName, ');
		SQL.ADD ('GHojyoName, ');
		SQL.ADD ('CodeDigit, ');
		SQL.ADD ('CodeAttr');
		SQL.ADD ('From MasterInfo ');
		SQL.ADD ('WHERE MasterKbn = 22');
		Open ();

		if (GetFld('UseKbn').AsInteger = 1) and
           (m_pRec.m_sParameter = '1')            then  // 工事の場合
        begin
			ppDBTxtJCustomerCode.Visible	       := True;
			ppDBTxtJCustomerCodeName.Visible	   := True;
            ppDBTxtJCustomerName.Visible           := True;     // <004>
//			ppDBText21.Visible					   := False;
			ppDBTxtGCustomerCode.Visible		   := True;
			ppDBTxtGCustomerCodeName.Visible 	   := True;
            ppDBTxtGCustomerName.Visible           := True;     // <004>
//            ppDBText22.Visible					   := False;
        end
        else
        begin
			ppDBTxtJCustomerCode.Visible	  	   := False;
			ppDBTxtJCustomerCodeName.Visible  	   := False;
            ppDBTxtJCustomerName.Visible           := False;    // <004>
//			ppDBText21.Visible					   := True;
			ppDBTxtGCustomerCode.Visible	       := False;
			ppDBTxtGCustomerCodeName.Visible  	   := False;
            ppDBTxtGCustomerName.Visible           := False;    // <004>
//            ppDBText22.Visible					   := True;
        end;

		Close;
		// <PRN2>
}
		if (m_pRec.m_sParameter = '1') then  // 工事の場合
		begin
			SQL.Clear ();
			SQL.Add('SELECT JHojyoName ');
        	SQL.Add('FROM MasterInfo ');
			SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ');
			ParamByName('nMasterDivision').AsInteger    := uvHani.pvMasterKbn + 100;
			Open ();
			if not EOF then
    	    begin
	    	    ppLabel103.Caption := GetFld ('JHojyoName').AsString + '管理区分';
    	    	ppLabel104.Caption := GetFld ('JHojyoName').AsString + 'パターンＮＯ';
	        end
    	    else
        	begin
	        	ppLabel103.Caption := '工種管理区分';
	    	    ppLabel104.Caption := '工種パターンＮＯ';
    	    end;

			Close ();
			SQL.Clear;
			SQL.ADD ('SELECT UseKbn,JHojyoName,GHojyoName,CodeDigit,CodeAttr From MasterInfo ');
			SQL.ADD ('WHERE MasterKbn = 22');
			Open ();

			if (GetFld('UseKbn').AsInteger = 1) then  // 工事の場合
    	    begin
				ppDBTxtJCustomerCode.Visible	       := True;
				ppDBTxtJCustomerCodeName.Visible	   := True;
	            ppDBTxtJCustomerName.Visible           := True;     // <004>
				ppDBTxtGCustomerCode.Visible		   := True;
				ppDBTxtGCustomerCodeName.Visible 	   := True;
        	    ppDBTxtGCustomerName.Visible           := True;     // <004>
    	    end
	        else
        	begin
				ppDBTxtJCustomerCode.Visible	  	   := False;
				ppDBTxtJCustomerCodeName.Visible  	   := False;
        	    ppDBTxtJCustomerName.Visible           := False;    // <004>
				ppDBTxtGCustomerCode.Visible	       := False;
				ppDBTxtGCustomerCodeName.Visible  	   := False;
        	    ppDBTxtGCustomerName.Visible           := False;    // <004>
	        end;
		end
		else	// ﾌﾟﾛｼﾞｪｸﾄの時
		begin
			SQL.Clear ();
			SQL.Add('SELECT JHojyoName ');
        	SQL.Add('FROM MasterInfo ');
			SQL.Add('WHERE MasterKbn=:nMasterDivision ');
			ParamByName('nMasterDivision').AsInteger := uvHani.pvMasterKbn + 100;
			Open ();
			if not EOF then
    	    begin
	    	    ppLabel189.Caption := GetFld ('JHojyoName').AsString + '管理区分';
    	    	ppLabel190.Caption := GetFld ('JHojyoName').AsString + 'パターンＮＯ';
    	    end;

// <016> ADD start
            ppLabel235.Caption  := '製造部門';
            ppLabel187.Caption  := '製造担当者';
            ppLabel240.Caption  := '概要';
// <016> ADD end

		end;
		Close;
//<008> - ED
    end;

    dqMasterInfo.Free;

// <003>↓
//    PrnSupport.strDocName   := strCaption;
    PrnSupport.strDocName   := uvHani.pvrRepTitle;  // 実在xx登録ﾘｽﾄ[xx型]
// <003>↑

    //@ ↓12.01
    //--------------------------------------------------------------------------
    //  部門アライメント設定
    //--------------------------------------------------------------------------

    dqBmnAlign    := TMQuery.Create (Self);			    		                        // MQueryの構築
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, dqBmnAlign );                         // DBとMQueryの接続

	with dqBmnAlign do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add('SELECT MasterKbn,UseKbn,CodeAttr ');
        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ORDER BY MasterKbn');
		ParamByName('nMasterDivision').AsInteger    := MKBN_BUMON; // <PRN2>
		Open ();

        if not EOF then
        begin
            if uvHani.pvrPattern = GOUKEISHOSAI then		// 合計(詳細)
            begin
                if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then					// ｺｰﾄﾞ属性: 数字
                begin
                    ppDBText96.Alignment := taRightJustify;
// <016> MOD start
{
// <011> ADD start
                    if m_pRec.m_sParameter = '1' then   // 工事のみ
                    begin
                        ppDBText499.Alignment := taRightJustify;    //施行部門
                    end
// <011> ADD end
}
                    ppDBText499.Alignment := taRightJustify;    //施行部門
// <016> MOD start
                end
                else
                begin
                    ppDBText96.Alignment := taLeftJustify;
// <016> MOD start
{
// <011> ADD start
                    if m_pRec.m_sParameter = '1' then   // 工事のみ
                    begin
                        ppDBText499.Alignment := taLeftJustify;    //施行部門
                    end;
// <011> ADD end
}
                    ppDBText499.Alignment := taLeftJustify;    //施行部門
                end;
            end;
// <011> ADD start
// <016> DEL start
{
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
}
// <016> DEL end
                if uvHani.pvrPattern = JITUZAISHOSAI then
                begin
                    if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then					// ｺｰﾄﾞ属性: 数字
                    begin
                        ppDBText495.Alignment   := taRightJustify;
                        ppDBText10.Alignment    := taRightJustify;
// <016> ADD start
                        ppDBText580.Alignment   := taRightJustify;
                        ppDBText589.Alignment   := taRightJustify;
// <016> ADD end
                    end
                    else
                    begin
                        ppDBText495.Alignment   := taLeftJustify;
                        ppDBText10.Alignment    := taLeftJustify;
// <016> ADD start
                        ppDBText580.Alignment   := taLeftJustify;
                        ppDBText589.Alignment   := taLeftJustify;
// <016> ADD end
                    end;
                end;
// <016> DEL             end;
// <011> ADD end
        end;
    end;
    //@ ↑
// <003>↓
    //--------------------------------------------------------------------------
    //  ｺｰﾄﾞのAlignment設定
    //--------------------------------------------------------------------------
                                            // 合計詳細型
    if uvHani.pvrPattern = GOUKEISHOSAI then
    begin
        if uvSelSys.GetTnCdZs = 2 then      // 担当者
        begin
            ppDBText82.Alignment := taLeftJustify;
// <016> MOD start
{
// <011> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
                ppDBText501.Alignment   :=taLeftJustify; //施行担当者
            end;
// <011> ADD end
}
            ppDBText501.Alignment   :=taLeftJustify; //施行担当者
// <016> MOD end
        end
        else
        begin
            ppDBText82.Alignment := taRightJustify;
// <016> MOD start
{
// <011> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
                ppDBText501.Alignment   :=taRightJustify; //施行担当者
            end;
// <011> ADD end
}
            ppDBText501.Alignment   :=taRightJustify; //施行担当者
        end;
        if uvSelSys.GetTkCdZs = 2 then      // 受注先
            ppDBTxtGCustomerCode.Alignment := taLeftJustify
        else
            ppDBTxtGCustomerCode.Alignment := taRightJustify;
// <011> ADD start
        if uvSelSys.GetNoCdZs = 2 then      // 施主
            ppDBText320.Alignment := taLeftJustify
        else
            ppDBText320.Alignment := taRightJustify;
// <011> ADD end
    end;
// <003>↑
// <004>↓
                                            // 実在詳細型
    if uvHani.pvrPattern = JITUZAISHOSAI then
    begin
        if uvSelSys.GetTnCdZs = 2 then      // 担当者
        begin
            ppDBText11.Alignment := taLeftJustify;
// <016> MOD start
{
// <011> ADD start
            if m_pRec.m_sParameter = '1' then   // 工事のみ
            begin
                ppDBText496.Alignment   :=taLeftJustify; //施行担当者
            end
// <011> ADD end
}
            ppDBText496.Alignment   :=taLeftJustify; //施行担当者
            ppDBText577.Alignment   :=taLeftJustify;
            ppDBText520.Alignment   :=taLeftJustify;
// <016> MOD end



        end
        else
        begin
            ppDBText11.Alignment := taRightJustify;
// <016> ADD start
{
// <011> ADD start
            if m_pRec.m_sParameter = '1'    then   // 工事のみ
            begin
                ppDBText496.Alignment   :=taRightJustify; //施行担当者
            end
// <011> ADD end
}
            ppDBText496.Alignment   :=taRightJustify; //施行担当者
            ppDBText577.Alignment   :=taRightJustify;
            ppDBText520.Alignment   :=taRightJustify;
// <016> ADD end
        end;
        if uvSelSys.GetTkCdZs = 2 then      // 受注先
        begin
            ppDBTxtJCustomerCode.Alignment := taLeftJustify;
            ppDBText578.Alignment := taLeftJustify;     // <016> ADD
        end
        else
        begin
            ppDBTxtJCustomerCode.Alignment := taRightJustify;
            ppDBText578.Alignment := taRightJustify;     // <016> ADD
        end;
// <011> ADD start
        if uvSelSys.GetNoCdZs = 2 then      // 施主
        begin
            ppDBText311.Alignment := taLeftJustify;
            ppDBText579.Alignment := taLeftJustify;     // <016> ADD
        end
        else
        begin
            ppDBText311.Alignment := taRightJustify;
            ppDBText579.Alignment := taRightJustify;     // <016> ADD
        end;
// <011> ADD end
    end;
// <004>↑


// <014> ADD start
    // 契約情報
    if (uvHani.pvrPattern = JITUZAIKEIYAKU) or (uvHani.pvrPattern = GOUKEIKEIYAKU) then
    begin
        if uvSelSys.GetTkCdZs = 2 then      // 取引先
            ppDBText513.Alignment := taLeftJustify
        else
            ppDBText513.Alignment := taRightJustify;
    end;
    // 契約情報詳細
    if (uvHani.pvrPattern = JITUZAIKEIYAKUDTL) or (uvHani.pvrPattern = GOUKEIKEIYAKUDTL) then
    begin
        if uvSelSys.GetTkCdZs = 2 then      // 取引先
            ppDBText513.Alignment := taLeftJustify
        else
            ppDBText513.Alignment := taRightJustify;
    end;
    // 入金情報詳細
    if (uvHani.pvrPattern = JITUZAINYUUKIN) or (uvHani.pvrPattern = GOUKEINYUUKIN) then
    begin
        if uvSelSys.GetTkCdZs = 2 then      // 取引先
        begin
            ppDBText550.Alignment := taLeftJustify;
            ppDBText553.Alignment := taLeftJustify;
            ppDBText554.Alignment := taLeftJustify;
            ppDBText555.Alignment := taLeftJustify;
            ppDBText556.Alignment := taLeftJustify;
            ppDBText557.Alignment := taLeftJustify;
            ppDBText558.Alignment := taLeftJustify;
            ppDBText559.Alignment := taLeftJustify;
            ppDBText560.Alignment := taLeftJustify;
            ppDBText561.Alignment := taLeftJustify;
        end
        else
        begin
            ppDBText550.Alignment := taRightJustify;
            ppDBText553.Alignment := taRightJustify;
            ppDBText554.Alignment := taRightJustify;
            ppDBText555.Alignment := taRightJustify;
            ppDBText556.Alignment := taRightJustify;
            ppDBText557.Alignment := taRightJustify;
            ppDBText558.Alignment := taRightJustify;
            ppDBText559.Alignment := taRightJustify;
            ppDBText560.Alignment := taRightJustify;
            ppDBText561.Alignment := taRightJustify;
        end;
    end;
// <014> ADD end

    //--------------------------------------------------------------------------
    //  日付書式設定
    //--------------------------------------------------------------------------
	if	(uvHani.pvrYearKbn = 0) then	    // 和暦/西暦区分: 0=和暦
	begin
		strFormatDate		:= 'ee/mm/dd';
		strFormatDateTime	:= 'ee/mm/dd hh:mm:ss';
	end
	else									// 和暦/西暦区分: 1=西暦
    begin
		strFormatDate		:= 'yy/mm/dd';
		strFormatDateTime	:= 'yy/mm/dd hh:mm:ss';
	end;

{    case uvHani.pvrPattern of
        JITUZAISHOSAI:		// 実在(詳細)
        begin
            ppDBText18.DisplayFormat	    := strFormatDate;
           	ppDBText19.DisplayFormat	    := strFormatDate;
            ppDBText20.DisplayFormat	    := strFormatDate;
                                            // 最終更新日時
            ppDBText310.DisplayFormat	:= strFormatDateTime;

        end;
        GOUKEISHOSAI :		// 合計(詳細)
        begin
            ppDBText87.DisplayFormat	    := strFormatDate;
           	ppDBText88.DisplayFormat	    := strFormatDate;
            ppDBText89.DisplayFormat	    := strFormatDate;
                                            // 最終更新日時
            ppDBText309.DisplayFormat    	:= strFormatDateTime;

        end;
    end;
}

    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
//<008> - ST
{
    case uvHani.pvrPattern of
        JITUZAIKANRYAKU:	// 実在(簡略)
		    tmpNo := 0;
        JITUZAISHOSAI:		// 実在(詳細)
		    tmpNo := 1;
        GOUKEIKANRYAKU :	// 合計(簡略)
		    tmpNo := 2;
        GOUKEISHOSAI :		// 合計(詳細)
		    tmpNo := 3;
	end;
}
    case uvHani.pvrPattern of
        JITUZAIKANRYAKU:	// 実在(簡略)
		    tmpNo := 0;
        JITUZAISHOSAI:		// 実在(詳細)
		begin
			if (m_pRec.m_sParameter = '1') then  // 工事の場合
			    tmpNo := 1
			else
				tmpNo := 4;
		end;
        GOUKEIKANRYAKU :	// 合計(簡略)
		    tmpNo := 2;
        GOUKEISHOSAI :		// 合計(詳細)
		begin
//			if (m_pRec.m_sParameter = '1') then  // 工事の場合
			    tmpNo := 3;
//			else
//			    tmpNo := 5;
		end;
        JITUZAIBUNRUI:		// 実在(分類)
		    tmpNo := 6;
// <014> ADD start
        JITUZAIKEIYAKU,GOUKEIKEIYAKU:     // 実在(契約)/合計(契約)
            tmpNo := 8;
        JITUZAIKEIYAKUDTL,GOUKEIKEIYAKUDTL:
            tmpNo := 7;
        JITUZAINYUUKIN,GOUKEINYUUKIN:
            tmpNo := 9;
// <014> ADD end
// <021> ADD start
		KASANTOUROKU:						// 加算登録リスト
            tmpNo := 10;
// <021> ADD end

	end;
//<008> - ED

    // 会社ｺｰﾄﾞ
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [tmpNo])));
    PrnSupport.pCorpCode := wTppLabel;
    with wTppLabel do
    begin
        Left        := 0.063;
        Top         := 0;
        Width       := 0.504;
        Height      := 0.125;
        Alignment   := taLeftJustify;
    end;

    // 会社名
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [tmpNo])));
    PrnSupport.pCorpName := wTppLabel;
    with wTppLabel do
    begin
        Left        := 0.63;
        Top         := 0;
        Width       := 3.78;
        Height      := 0.125;
        Alignment   := taLeftJustify;
    end;

    // 日付
//    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [tmpNo])));
    PrnSupport.pDate	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left        := 10.773;
        Top         := 0;
        Width       := 2.52;
        Height      := 0.125;
        Alignment   := taRightJustify;
    end;

    // ﾀｲﾄﾙ
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [tmpNo])));
    with wTppLabel do
    begin
        Caption     := strCaption;
        Left        := 4.865;
        Top         := 0.1667;
//<008> - ST
		if (m_pRec.m_sParameter <> '1') then  // ﾌﾟﾛｼﾞｪｸﾄの時
			Top := Top+0.2;
//<008> - ED
        Width       := 3.5;
        Height      := 0.25;
        Alignment   := taCenter;
        Distributed2    := True;
        FontRatio.Auto  := True;
    end;

    // ﾀｲﾄﾙｱﾝﾀﾞ-
//    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [tmpNo])));
    with wTppLine do
    begin
        Left        := 4.802;
        Top         := 0.2917;
//<008> - ST
		if (m_pRec.m_sParameter <> '1') then  // ﾌﾟﾛｼﾞｪｸﾄの時
			Top := Top+0.2;
//<008> - ED
        Width       := 3.626;
        Height      := 0.1667;
//        Position    := lpBottom;
        Pen.Width       := 0;
        Pen.Style       := psSolid;
    end;

// <003>↓
    // 【簡略型】、【詳細型】など
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('pplblType%.d%.', [tmpNo])));
    if wTppLabel <> nil then				// <021> ADD
    begin                                   // <021> ADD
        with wTppLabel do
        begin
            Left        := 8.615;
            Top         := 0.1667;
//<008> - ST
            if (m_pRec.m_sParameter <> '1') then  // ﾌﾟﾛｼﾞｪｸﾄの時
                Top := Top+0.2;
//<008> - ED
		end;
	end;									// <021> ADD
// <003>↑

    // 頁
//    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [tmpNo])));
    PrnSupport.pPage	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left        := 6.4193;
        Top         := 0;
        Width       := 0.5;
        Height      := 0.125;
        Alignment   := taCenter;
    end;

    // 会計会社(非表示?)
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [tmpNo])));
    wTppLabel.Visible := False;

    // ﾌｧｲﾙ名
// <003>↓実在xx登録ﾘｽﾄ[xx型]
//    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strCaption + '.csv';
    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + uvHani.pvrRepTitle + '.csv';
// <003>↑



end;

procedure TDmJNTCRP018001L.ppReportShosaiJPreviewFormCreate(
  Sender: TObject);
begin

end;
//@ ↓12.01
//--------------------------------------------------------------------------
//  予定・実績後期・郵便番号設定ハイフン設定
//--------------------------------------------------------------------------
procedure TDmJNTCRP018001L.ppDetailBand3BeforePrint(Sender: TObject);
begin
    ppLabel124.Visible := True;
     ppLabel125.Visible := True;
     ppLabel81.Visible  := True;

     if (dsMain.DataSet.FieldByName('ScheduleDateS').AsString = '')
        or  (dsMain.DataSet.FieldByName('ScheduleDate').AsString = '') then
     begin
     ppLabel124.Visible := False;
     end;

     if (dsMain.DataSet.FieldByName('StartDate').AsString = '')
        or  (dsMain.DataSet.FieldByName('EndDate').AsString = '') then
     begin
        ppLabel125.Visible := False;
     end;

     if (dsMain.DataSet.FieldByName('ZipCode1').AsString = '')
        or  (dsMain.DataSet.FieldByName('ZipCode2').AsString = '') then
        begin
            ppLabel81.Visible := False;
        end;
end;

procedure TDmJNTCRP018001L.ppDetailBand2BeforePrint(Sender: TObject);
begin
    ppLabel80.Visible   := True;
    ppLabel105.Visible  := True;
    ppLabel15.Visible   := True;

    if (dsMain.DataSet.FieldByName('ScheduleDateS').AsString = '')
        or  (dsMain.DataSet.FieldByName('ScheduleDate').AsString = '') then
    begin
        ppLabel80.Visible := False;
    end;

    if (dsMain.DataSet.FieldByName('StartDate').AsString = '')
        or  (dsMain.DataSet.FieldByName('EndDate').AsString = '') then
    begin
        ppLabel105.Visible := False;
    end;

    if (dsMain.DataSet.FieldByName('ZipCode1').AsString = '')
        or  (dsMain.DataSet.FieldByName('ZipCode2').AsString = '') then
    begin
        ppLabel15.Visible := False;
    end;

end;
//@ ↑
//--------------------------------------------------------------------------
//  実在簡略型 DetailBandのBeforeGenerateｲﾍﾞﾝﾄ  <003>
//--------------------------------------------------------------------------
procedure TDmJNTCRP018001L.ppDetailBand5BeforeGenerate(Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定
    if (ppDetailBand5.LastRecord) or
        (ppDetailBand5.PageOutOfSpace) then
    begin
        if (ppDetailBand5.OverFlow = False) then
            ppDetailBand5.OverFlow := True;

        if (ppLine94.ReprintOnOverFlow = False) then
            ppLine94.ReprintOnOverFlow := True;

        ppLine94.Weight := 0.75;            // 最後のﾗｲﾝを太く
    end
    else
    begin
        ppLine94.Weight := 0.25;            // 最後のﾗｲﾝを元に戻す
    end;

end;

//--------------------------------------------------------------------------
//  合計簡略型 DetailBandのBeforeGenerateｲﾍﾞﾝﾄ  <003>
//--------------------------------------------------------------------------
procedure TDmJNTCRP018001L.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定
    if (ppDetailBand1.LastRecord) or
        (ppDetailBand1.PageOutOfSpace) then
    begin
        if (ppDetailBand1.OverFlow = False) then
            ppDetailBand1.OverFlow := True;

        if (ppLine5.ReprintOnOverFlow = False) then
            ppLine5.ReprintOnOverFlow := True;

        ppLine5.Weight := 0.75;             // 最後のﾗｲﾝを太く
    end
    else
    begin
        ppLine5.Weight := 0.25;             // 最後のﾗｲﾝを元に戻す
    end;

end;

//<009> - ST
//--------------------------------------------------------------------------
//	分類、セグメントの項目表示非表示設定
//--------------------------------------------------------------------------
function  TDmJNTCRP018001L.fnInzSegBun(): Boolean;
var
	i	: Integer;
	Qe	: TMQuery;
begin
	Result := FALSE;

	Qe := TMQuery.Create (Self);			    		                        // MQueryの構築
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, Qe ); // DBとMQueryの接続

	with (Qe) do
	begin
		for i := 1 to  10 do
		begin
			// セグメント
			m_arAdoptInfo_Seg [i].nMasterDivision	:= 0;
			m_arAdoptInfo_Seg [i].nAdoption      	:= 0;
			m_arAdoptInfo_Seg [i].nCodeDigit    	:= 0;
			m_arAdoptInfo_Seg [i].nCodeAttribute	:= 0;
			m_arAdoptInfo_Seg [i].strDescription	:= '';

			// ﾌﾟﾛｼﾞｪｸﾄ分類
			m_arAdoptInfo_PBr [i].nMasterDivision	:= 0;
			m_arAdoptInfo_PBr [i].nAdoption      	:= 0;
			m_arAdoptInfo_PBr [i].nCodeDigit    	:= 0;
			m_arAdoptInfo_PBr [i].nCodeAttribute	:= 0;
			m_arAdoptInfo_PBr [i].strDescription	:= '';
		end;

		Close;
		SQL.Clear ();
		SQL.Add('SELECT * FROM SegMA ');
		SQL.Add('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger := uvHani.pvMasterKbn;

		Open ();

		if	(not EOF) then
   	    begin
			m_arSegMa[1]  := FieldByName ('SegUse1' ).AsInteger;
			m_arSegMa[2]  := FieldByName ('SegUse2' ).AsInteger;
			m_arSegMa[3]  := FieldByName ('SegUse3' ).AsInteger;
			m_arSegMa[4]  := FieldByName ('SegUse4' ).AsInteger;
			m_arSegMa[5]  := FieldByName ('SegUse5' ).AsInteger;
			m_arSegMa[6]  := FieldByName ('SegUse6' ).AsInteger;
			m_arSegMa[7]  := FieldByName ('SegUse7' ).AsInteger;
			m_arSegMa[8]  := FieldByName ('SegUse8' ).AsInteger;
			m_arSegMa[9]  := FieldByName ('SegUse9' ).AsInteger;
			m_arSegMa[10] := FieldByName ('SegUse10').AsInteger;
       	end;

		// セグメント情報
		i := 1;
        Close;
		Sql.Clear;
		Sql.add(' Select MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr From MasterInfo '+
				' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
				' Order By MasterKBN');
		ParamByName('pSMKBN').asInteger := ucSSG_MKBN;
		ParamByName('pEMKBN').asInteger := ucESG_MKBN;
		Open;
		While not eof do
		begin
			if i > 10 then Break;
			m_arAdoptInfo_Seg [i].nMasterDivision	:= FieldByName ('MasterKBN'   ).AsInteger;
			m_arAdoptInfo_Seg [i].nAdoption        	:= FieldByName ('UseKbn').AsInteger;
			m_arAdoptInfo_Seg [i].nCodeDigit		:= FieldByName ('CodeDigit').AsInteger;
			m_arAdoptInfo_Seg [i].nCodeAttribute	:= FieldByName ('CodeAttr' ).AsInteger;
			m_arAdoptInfo_Seg [i].strDescription	:= FieldByName ('JHojyoName').AsString;
			inc(i);
			Next;
		end;

		// 分類情報
		i := 1;
        Close;
		Sql.Clear;
		Sql.add(' Select MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr From MasterInfo '+
				' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
				'   Order By MasterKBN');
		ParamByName('pSMKBN').asInteger := ucSPB_MKBN;
		ParamByName('pEMKBN').asInteger := ucEPB_MKBN;
		Open;
		While not eof do
		begin
			if i > 10 then Break;
			m_arAdoptInfo_PBr [i].nMasterDivision	:= FieldByName ('MasterKBN'   ).AsInteger;
			m_arAdoptInfo_PBr [i].nAdoption			:= FieldByName ('UseKbn'   ).AsInteger;
			m_arAdoptInfo_PBr [i].nCodeDigit		:= FieldByName ('CodeDigit').AsInteger;
			m_arAdoptInfo_PBr [i].nCodeAttribute	:= FieldByName ('CodeAttr' ).AsInteger;
			m_arAdoptInfo_PBr [i].strDescription	:= FieldByName ('JHojyoName').AsString;
			inc(i);
			Next;
		end;
	end;
	Qe.Close;
	Qe.Free;

    // ﾌﾟﾛｼﾞｪｸﾄ分類１採用区分
	if ( m_arAdoptInfo_PBr[1].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui01.Visible := TRUE;
		ppRep_BS_Bunrui01.Caption := m_arAdoptInfo_PBr[1].strDescription;
		if ( m_arAdoptInfo_PBr[1].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun01Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun01Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui01.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類２採用区分
	if ( m_arAdoptInfo_PBr[2].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui02.Visible := TRUE;
		ppRep_BS_Bunrui02.Caption := m_arAdoptInfo_PBr[2].strDescription;
		if ( m_arAdoptInfo_PBr[2].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun02Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun02Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui02.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類３採用区分
	if ( m_arAdoptInfo_PBr[3].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui03.Visible := TRUE;
		ppRep_BS_Bunrui03.Caption := m_arAdoptInfo_PBr[3].strDescription;
		if ( m_arAdoptInfo_PBr[3].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun03Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun03Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui03.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類４採用区分
	if ( m_arAdoptInfo_PBr[4].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui04.Visible := TRUE;
		ppRep_BS_Bunrui04.Caption := m_arAdoptInfo_PBr[4].strDescription;
		if ( m_arAdoptInfo_PBr[4].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun04Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun04Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui04.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類５採用区分
	if ( m_arAdoptInfo_PBr[5].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui05.Visible := TRUE;
		ppRep_BS_Bunrui05.Caption := m_arAdoptInfo_PBr[5].strDescription;
		if ( m_arAdoptInfo_PBr[5].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun05Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun05Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui05.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類６採用区分
	if ( m_arAdoptInfo_PBr[6].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui06.Visible := TRUE;
		ppRep_BS_Bunrui06.Caption := m_arAdoptInfo_PBr[6].strDescription;
		if ( m_arAdoptInfo_PBr[6].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun06Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun06Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui06.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類７採用区分
	if ( m_arAdoptInfo_PBr[7].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui07.Visible := TRUE;
		ppRep_BS_Bunrui07.Caption := m_arAdoptInfo_PBr[7].strDescription;
		if ( m_arAdoptInfo_PBr[7].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun07Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun07Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui07.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類８採用区分
	if ( m_arAdoptInfo_PBr[8].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui08.Visible := TRUE;
		ppRep_BS_Bunrui08.Caption := m_arAdoptInfo_PBr[8].strDescription;
		if ( m_arAdoptInfo_PBr[8].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun08Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun08Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui08.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類９採用区分
	if ( m_arAdoptInfo_PBr[9].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui09.Visible := TRUE;
		ppRep_BS_Bunrui09.Caption := m_arAdoptInfo_PBr[9].strDescription;
		if ( m_arAdoptInfo_PBr[9].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun09Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun09Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui09.Visible := FALSE;
	end;

    // ﾌﾟﾛｼﾞｪｸﾄ分類10採用区分
	if ( m_arAdoptInfo_PBr[10].nAdoption <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui10.Visible := TRUE;
		ppRep_BS_Bunrui10.Caption := m_arAdoptInfo_PBr[10].strDescription;
		if ( m_arAdoptInfo_PBr[10].nCodeAttribute = 2 ) then
			DBTxt_BS_Bun10Code.Alignment := taLeftJustify
		else
			DBTxt_BS_Bun10Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui10.Visible := FALSE;
	end;

    // ｾｸﾞﾒﾝﾄ１採用区分
    if ( m_arSegMa[1] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment01.Visible := TRUE;
		ppRep_BS_Segment01.Caption := m_arAdoptInfo_Seg[1].strDescription;
		if ( m_arAdoptInfo_Seg[1].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg01Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg01Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment01.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ２採用区分
    if ( m_arSegMa[2] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment02.Visible := TRUE;
		ppRep_BS_Segment02.Caption := m_arAdoptInfo_Seg[2].strDescription;
		if ( m_arAdoptInfo_Seg[2].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg02Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg02Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment02.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ３採用区分
    if ( m_arSegMa[3] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment03.Visible := TRUE;
		ppRep_BS_Segment03.Caption := m_arAdoptInfo_Seg[3].strDescription;
		if ( m_arAdoptInfo_Seg[3].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg03Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg03Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment03.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ４採用区分
    if ( m_arSegMa[4] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment04.Visible := TRUE;
		ppRep_BS_Segment04.Caption := m_arAdoptInfo_Seg[4].strDescription;
		if ( m_arAdoptInfo_Seg[4].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg04Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg04Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment04.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ５採用区分
    if ( m_arSegMa[5] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment05.Visible := TRUE;
		ppRep_BS_Segment05.Caption := m_arAdoptInfo_Seg[5].strDescription;
		if ( m_arAdoptInfo_Seg[5].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg05Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg05Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment05.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ６採用区分
    if ( m_arSegMa[6] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment06.Visible := TRUE;
		ppRep_BS_Segment06.Caption := m_arAdoptInfo_Seg[6].strDescription;
		if ( m_arAdoptInfo_Seg[6].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg06Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg06Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment06.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ７採用区分
    if ( m_arSegMa[7] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment07.Visible := TRUE;
		ppRep_BS_Segment07.Caption := m_arAdoptInfo_Seg[7].strDescription;
		if ( m_arAdoptInfo_Seg[7].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg07Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg07Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment07.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ８採用区分
    if ( m_arSegMa[8] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment08.Visible := TRUE;
		ppRep_BS_Segment08.Caption := m_arAdoptInfo_Seg[8].strDescription;
		if ( m_arAdoptInfo_Seg[8].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg08Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg08Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment08.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ９採用区分
    if ( m_arSegMa[9] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment09.Visible := TRUE;
		ppRep_BS_Segment09.Caption := m_arAdoptInfo_Seg[9].strDescription;
		if ( m_arAdoptInfo_Seg[9].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg09Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg09Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment09.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ１０採用区分
    if ( m_arSegMa[10] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment10.Visible := TRUE;
		ppRep_BS_Segment10.Caption := m_arAdoptInfo_Seg[10].strDescription;
		if ( m_arAdoptInfo_Seg[10].nCodeAttribute = 2 ) then
			    DBTxt_BS_Seg10Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg10Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment10.Visible := FALSE;
	end;
end;
//<009> - ED

//--------------------------------------------------------------------------
//  加算登録 DetailBandのBeforeGenerateｲﾍﾞﾝﾄ  <021>
//--------------------------------------------------------------------------
procedure TDmJNTCRP018001L.ppDetailBandKasanBeforeGenerate(
  Sender: TObject);
begin
	// 加算先コードが１行前と同じだったら
	if dsMain.DataSet.FieldByName('strExCodeDst').AsString = m_strNowCode then
    begin
    	// 親は表示しない
    	ppDBTextExCodeDst.Visible := False;
    	ppDBTextNameDst.Visible := False;
        // 上の線も表示しない
        ppLineDetailsTopKasan.Visible := False;
    end
    else
    begin
    	// 親を表示する
    	ppDBTextExCodeDst.Visible := True;
    	ppDBTextNameDst.Visible := True;
        // 上の線も表示する
        ppLineDetailsTopKasan.Visible := True;
    end;
    										// 加算先コードをとっておく
    m_strNowCode := dsMain.DataSet.FieldByName('strExCodeDst').AsString;

	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBandKasan.LastRecord) or
		(ppDetailBandKasan.PageOutOfSpace) Then
	begin
		if (not ppDetailBandKasan.OverFlow) then
			ppDetailBandKasan.OverFlow	:=	True;

		if (not ppLineDetailsBottomKasan.ReprintOnOverFlow) then
			ppLineDetailsBottomKasan.ReprintOnOverFlow	:=	True;

		ppLineDetailsBottomKasan.Visible    :=	True;
		ppLineDetailsBottomKasan.Weight	:=	0.75;	// ラインの太さを太くしている
        m_strNowCode := '';		// 次のページの頭は必ず親も表示
	end
	else
	begin
		ppLineDetailsBottomKasan.Visible    :=	False;
		ppLineDetailsBottomKasan.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//<023> ADD START
// -----------------------------------------------------------------------------
//   ライセンスチェック関数
// -----------------------------------------------------------------------------
function TDmJNTCRP018001L.IsExistLicense(aModuleCode: Integer): Boolean;
begin
	result := False;

    if (CheckModuleLicense(m_pRec,aModuleCode)) then
    begin
    	// ライセンスあり
    	result := True;
    end;
end;
//<023> ADD END
//<025> ADD st
// -----------------------------------------------------------------------------
//   APGファイル読み込み処理
// -----------------------------------------------------------------------------
procedure TDmJNTCRP018001L.LoadAPGFile();
var
	oIni	: TIniFile;
	sPath	: String;
begin
	m_bNoControlSesyu := False;
	sPath := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP018001.APG';
	if (FileExists(sPath) = False) then Exit;

    oIni := TIniFile.Create(sPath);
    try
	    if (oIni.ReadInteger('DisplayInfo', 'Sesyu', 0) = 1) then// 0=ライセンスにより判断, 1=無条件で表示
			m_bNoControlSesyu := True;
    finally
        if Assigned(oIni) then oIni.Free;
    end;
end;
//<025> ADD ed

end.

