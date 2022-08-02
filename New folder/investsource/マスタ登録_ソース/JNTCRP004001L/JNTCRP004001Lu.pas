//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    基本情報(印刷処理)
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
//  <001>   広田 茂雄   2005/12/12(MON) 頁指定をしても全頁が出力される対応。
//  <002>   飯塚 健介   2006/01/12(THU) 実在取引先登録ﾘｽﾄ【簡略】追加。
//  <003>   飯塚 健介   2006/01/31(THU) 資産情報対応。
//  <004>   茂木 勇次   2006/02/03(FRI) 未対応の帳票の作成。
//  <005>   高橋 功二   2006/03/13(MON) 資産管理ﾗｲｾﾝｽの制御なし(MJS遠山様より修正依頼)
//	<006>	長谷川耕平	2006/04/25(Tue)	実在取引先【詳細】の特殊請求Noが4桁表示できなかった
//  <007>	荒井秀士	2006/07/03(MON) リース区分追加のためラインの長さを変更
//  <   >   久保義和    2007.08.23(Thu) 裏面のﾏｰｼﾞﾝ設定を0に修正
//                                     （裏面のﾏｰｼﾞﾝは印刷ﾌﾟﾛｸﾞﾗﾑ(rbRCL55.bpl)で自動ｾｯﾄ)
//	<PLOG>	久保義和	2008/07/14(Mon) 印刷履歴対応
//
//  ================== ↓Ver 4.01 リリース向け ===================================================
//
//	<   >	新保一馬	2010.07.29(Thu)	名称文字数UP対応(DBTxt_K_Nm、DBTxt_S_Nm、DBTxt_BS_Nm、DBTxt_G_Nmに長体を設定。)
//
//  ================== ↓Ver 4.08(NX-I 5.01) リリース向け ===================================================
//
//	<   >	小川哲央	2011.12.21(Wed)	加算登録リストの名称を広げる対応 (ColumnPositionも調整)
//	<2284>	 吉田健吾	2012.02.14(Tue	取引先登録にて基本情報から印刷（実在取引先登録リスト「詳細」）にてファイル
//									    出力すると入金予定日情報・支払締日情報が出力されない。修正に伴い詳細型の印刷レイアウトに項目を追加する。
//										ppReportShosaiJにﾌﾘｶﾞﾅ・敬称・業種の外部ｺｰﾄﾞ・業種の名称を追加しました。
//
//  ================== ↓Ver 4.09(NX-I 5.02) リリース向け ===================================================
//  <Authority> 小川哲央  2012.07.13(Fri) サブモジュールの権限管理対応
//
//  ================== ↓Ver 4.13(NX-I 5.07) リリース向け ===================================================
//
//	<CD16>	柄松克弥	2014/01/17(Fri)	取引先コード16桁対応。パネル位置の変更。
//	<ZCF-0016> 	小川(NTC)   2015.01.16(Fri) 印刷、CSV出力の簡略名称で15バイト以降が正確に表示されない不具合修正。
//											合計取引先登録リスト(ppReportGoukeiJ)の簡略名称、連想、住所等の長体をかけ、位置調整する。
//	<MYN>		小川(NTC)	2015.06.17(Wed)	マイナンバー対応。実在取引先登録リスト(ppReportShosaiJ)の基本情報に「法人･個人番号」追加。
//											・更新日時を右にずらす。
//	<2722>	柄松克弥	2019.03.13(Wed)	ファイル出力の初期ファイルパス名に「\」が足りなかったのを修正。
//	<D10>	鈴木基男	2019.09.13(Fri)	Delphi10対応
//
//=============================================================================
unit JNTCRP004001Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, {<D10>ppDBBDE,}

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  FXLicense,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  dxmdaset, JNTCommonu
  ,JNTAuthorityu, ppDesignLayer, ppParameter;  // <Authority> ADD

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004001L = class(TDataModule)
    ppReportShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLine73: TppLine;
    ppLine89: TppLine;
    ppRep_S_TorihikiInfo: TppLabel;
    ppRep_S_BaseInfo: TppLabel;
    ppRep_S_RCloseDay: TppLabel;
    ppRep_S_PcvSimeInfo: TppLabel;
    ppRep_S_RHolidayKbnName: TppLabel;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    SVppDate1: TppSystemVariable;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppDetailBand1: TppDetailBand;
    ppStandardUnderLine1: TppLine;
    DBTxt_S_GCode: TppDBText;
    DBTxt_S_Nm: TppDBText;
    DBTxt_S_Nmk: TppDBText;
    DBTxt_S_Renso: TppDBText;
    DBTxt_S_RCloseDay1: TppDBText;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLine97: TppLine;
    ppLine99: TppLine;
    ppLine100: TppLine;
    DBImg_S_Fusen: TppDBImage;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    DBTxt_S_PostNo1: TppDBText;
    ppRep_S_PostLine: TppLabel;
    DBTxt_S_PostNo2: TppDBText;
    DBTxt_S_Ads1: TppDBText;
    DBTxt_S_Ads2: TppDBText;
    DBTxt_S_UpdDateTM: TppDBText;
    DBTxt_S_DHyoNm1: TppDBText;
    DBTxt_S_DHyoNm2: TppDBText;
    DBTxt_S_Tel1: TppDBText;
    DBTxt_S_Tel2: TppDBText;
    DBTxt_S_Fax1: TppDBText;
    DBTxt_S_ShihonKin: TppDBText;
    DBTxt_S_SyainSu: TppDBText;
    DBTxt_S_Nensyo: TppDBText;
    DBTxt_S_TStartDate: TppDBText;
    DBTxt_S_TEndDate: TppDBText;
    ppRep_S_TekiD: TppLabel;
    ppRep_S_RCloseDay1: TppLabel;
    ppRep_S_RCloseDay2: TppLabel;
    ppRep_S_RCloseDay3: TppLabel;
    DBTxt_S_DBTxt_S_RCloseDay2: TppDBText;
    DBTxt_S_DBTxt_S_DBTxt_S_RCloseDay3: TppDBText;
    DBTxt_S_RcvDay1: TppDBText;
    ppRep_S_PCloseDay1: TppLabel;
    ppLine1: TppLine;
    DBTxt_S_RcvDay2: TppDBText;
    DBTxt_S_RcvDay3: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    DBTxt_S_TRRZuiSSite: TppDBText;
    DBTxt_S_TRRTSEINO: TppDBText;
    DBTxt_S_HPAddress: TppDBText;
    ppRep_S_PCloseDay2: TppLabel;
    ppRep_S_PCloseDay3: TppLabel;
    DBTxt_S_PCloseDay1: TppDBText;
    DBTxt_S_PCloseDay2: TppDBText;
    DBTxt_S_PCloseDay3: TppDBText;
    DBTxt_S_SRRZuiSSite: TppDBText;
    DBTxt_S_PayDay1: TppDBText;
    DBTxt_S_PayDay2: TppDBText;
    DBTxt_S_PayDay3: TppDBText;
    DBTxt_S_SRRTSEINO: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine9: TppLine;
    dsShosaiJ: TDataSource;
    PipelineShosaiJ: TppDBPipeline;
    DBTxt_S_HojyoKbn: TppDBText;
    DBTxt_S_RcvMonth1Name: TppDBText;
    DBTxt_S_RcvMonth2Name: TppDBText;
    DBTxt_S_RcvMonth3Name: TppDBText;
    DBTxt_S_RHolidayKbn1Name: TppDBText;
    DBTxt_S_RHolidayKbn2Name: TppDBText;
    DBTxt_S_RHolidayKbn3Name: TppDBText;
    DBTxt_S_TRRHolidayName: TppDBText;
    DBTxt_S_PayMonth1Name: TppDBText;
    DBTxt_S_PHolidayKbn1Name: TppDBText;
    DBTxt_S_PayMonth2Name: TppDBText;
    DBTxt_S_PayMonth3Name: TppDBText;
    DBTxt_S_PHolidayKbn3Name: TppDBText;
    DBTxt_S_PHolidayKbn2Name: TppDBText;
    DBTxt_S_SRRHolidayName: TppDBText;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppRep_S_RcvMonthDayName: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppRep_S_PaySimeInfo: TppLabel;
    ppRep_S_PCloseDay: TppLabel;
    ppRep_S_PHolidayKbnName: TppLabel;
    ppRep_S_PayMonthDayName: TppLabel;
    ppReportSegBun: TppReport;
    ppHeaderBand1: TppHeaderBand;
    CorpCode2: TppLabel;
    CorpName2: TppLabel;
    LabelTitle2: TppLabel;
    LineTitle2: TppLine;
    SVppDate2: TppSystemVariable;
    LabelSubTitle2: TppLabel;
    ppLine15: TppLine;
    ppRep_BS_GCode: TppLabel;
    ppRep_BS_TStartDate: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppRep_BS_Nm: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppRep_BS_TEndDate: TppLabel;
    ppLine23: TppLine;
    ppRep_BS_Bunrui01: TppLabel;
    ppRep_BS_Segment01: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppRep_BS_Bunrui02: TppLabel;
    ppRep_BS_Segment02: TppLabel;
    ppLine26: TppLine;
    ppRep_BS_Bunrui03: TppLabel;
    ppRep_BS_Segment03: TppLabel;
    ppRep_BS_Bunrui04: TppLabel;
    ppRep_BS_Segment04: TppLabel;
    ppLine27: TppLine;
    ppRep_BS_Bunrui05: TppLabel;
    ppRep_BS_Segment05: TppLabel;
    ppLine28: TppLine;
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
    ppLine43: TppLine;
    ppDetailBand2: TppDetailBand;
    DBTxt_BS_GCode: TppDBText;
    DBTxt_BS_Nm: TppDBText;
    DBTxt_BS_TStartDate: TppDBText;
    DBTxt_BS_TEndDate: TppDBText;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppStandardUnderLine2: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine29: TppLine;
    ppLine48: TppLine;
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
    ppLine49: TppLine;
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
    ppLine50: TppLine;
    ppFooterBand1: TppFooterBand;
    SVppPage2: TppSystemVariable;
    ppRep_S_Post: TppLabel;
    ppRep_S_Nm: TppLabel;
    ppRep_S_Renso: TppLabel;
    ppRep_S_Nmk: TppLabel;
    ppRep_S_HojyoKbn: TppLabel;
    ppRep_S_GCode: TppLabel;
    ppRep_S_Ads1: TppLabel;
    ppRep_S_Ads2: TppLabel;
    ppRep_S_DHyoNm1: TppLabel;
    ppRep_S_DHyoNm2: TppLabel;
    ppRep_S_Tel1: TppLabel;
    ppRep_S_Tel2: TppLabel;
    ppRep_S_Fax1: TppLabel;
    ppRep_S_ShihonKin: TppLabel;
    ppRep_S_SyainSu: TppLabel;
    ppRep_S_Nensyo: TppLabel;
    ppRep_S_TekiyoKikan: TppLabel;
    ppRep_S_UpdDateTM: TppLabel;
    ppRep_S_HPAddress: TppLabel;
    ppRep_S_TRRZuiSSite: TppLabel;
    ppRep_S_TRRTSEINO: TppLabel;
    ppRep_S_SRRZuiSSite: TppLabel;
    ppRep_S_SRRTSEINO: TppLabel;
    ppReportKanryakuJ: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine30: TppLine;
    ppLine53: TppLine;
    ppRep_K_GCode: TppLabel;
    ppRep_K_Nm: TppLabel;
    ppRep_K_Nmk: TppLabel;
    ppRep_K_Renso: TppLabel;
    ppRep_K_TSaiyou: TppLabel;
    ppRep_K_SSaiyou: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine137: TppLine;
    K_HeaderUnderLine: TppLine;
    K_Header_UpperLine: TppLine;
    ppLine126: TppLine;
    ppDetailBand0: TppDetailBand;
    DBTxt_K_GCode: TppDBText;
    DBTxt_K_Nm: TppDBText;
    DBTxt_K_Nmk: TppDBText;
    DBTxt_K_Renso: TppDBText;
    DBTxt_K_TSaiyou: TppDBText;
    DBTxt_K_SSaiyou: TppDBText;
    ppLine61: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine70: TppLine;
    ppStandardUnderLine0: TppLine;
    DBImg_K_Fusen: TppDBImage;
    ppFooterBand3: TppFooterBand;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    SVppPage0: TppSystemVariable;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppRep_K_KSaiyou: TppLabel;
    ppRep_K_BSaiyou: TppLabel;
    K_Hd_SisanLine01: TppLine;
    K_Dt_SisanLine01: TppLine;
    K_Hd_SisanLine02: TppLine;
    DBTxt_K_KSaiyou: TppDBText;
    DBTxt_K_BSaiyou: TppDBText;
    K_Dt_SisanLine02: TppLine;
    ppReportGoukeiJ: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLine71: TppLine;
    ppLine138: TppLine;
    ppRep_G_GCode: TppLabel;
    ppRep_G_Nm: TppLabel;
    ppRep_G_Nmk: TppLabel;
    ppRep_G_Renso: TppLabel;
    ppRep_G_TSaiyou: TppLabel;
    CorpCode3: TppLabel;
    CorpName3: TppLabel;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    ppRep_G_Jyusyo: TppLabel;
    ppLine141: TppLine;
    ppLine142: TppLine;
    ppLine148: TppLine;
    ppRep_G_SSaiyou: TppLabel;
    LabelTitle3: TppLabel;
    G_HeaderUnderLine: TppLine;
    G_Header_UpperLine: TppLine;
    ppLine122: TppLine;
    G_Hd_SisanLine02: TppLine;
    ppDetailBand3: TppDetailBand;
    ppLine149: TppLine;
    DBTxt_G_GCode: TppDBText;
    DBTxt_G_Nm: TppDBText;
    DBTxt_G_Nmk: TppDBText;
    DBTxt_G_Renso: TppDBText;
    ppLine150: TppLine;
    G_Dt_SisanLine02: TppLine;
    ppLine152: TppLine;
    ppLine153: TppLine;
    ppLine154: TppLine;
    ppLine156: TppLine;
    DBTxt_G_PostNo1: TppDBText;
    ppLine157: TppLine;
    DBTxt_G_Ads1: TppDBText;
    DBTxt_G_PostNo2: TppDBText;
    ppLine161: TppLine;
    ppRep_G_PostKigou: TppLabel;
    ppRep_G_PostLine: TppLabel;
    ppStandardUnderLine3: TppLine;
    ppFooterBand7: TppFooterBand;
    SVppPage3: TppSystemVariable;
    PipelineGoukeiJ: TppDBPipeline;
    dsGoukeiJ: TDataSource;
    ppReportKasanJ: TppReport;
    ppHeaderBand11: TppHeaderBand;
    CorpCode4: TppLabel;
    CorpName4: TppLabel;
    LabelTitle4: TppLabel;
    LineTitle4: TppLine;
    SVppDate4: TppSystemVariable;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppLine68: TppLine;
    ppRep_Ks_SumName: TppLabel;
    ppRep_Ks_BaseName: TppLabel;
    ppLine69: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine119: TppLine;
    ppDetailBand4: TppDetailBand;
    DBTxt_Ks_SumCode: TppDBText;
    DBTxt_Ks_SumName: TppDBText;
    DBTxt_Ks_BaseCode: TppDBText;
    DBTxt_Ks_BaseName: TppDBText;
    ppLine72: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppStandardUnderLine4: TppLine;
    CmnReportSystemLineDetailsTop: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand11: TppFooterBand;
    SVppPage4: TppSystemVariable;
    PipelineKasanJ: TppDBPipeline;
    dsKasanJ: TDataSource;
    dsKanryakuJ: TDataSource;
    PipelineKanryakuJ: TppDBPipeline;
    PipelineSegBunJ: TppDBPipeline;
    dsSegBunJ: TDataSource;
    ppRep_G_KSaiyou: TppLabel;
    ppRep_G_BSaiyou: TppLabel;
    ppLine78: TppLine;
    ppLine79: TppLine;
    G_Hd_SisanLine01: TppLine;
    ppLine81: TppLine;
    G_Dt_SisanLine01: TppLine;
    DBTxt_G_TSaiyou1: TppDBText;
    DBTxt_G_SSaiyou1: TppDBText;
    DBTxt_G_KSaiyou: TppDBText;
    DBTxt_G_BSaiyou: TppDBText;
    DBImg_G_Fusen: TppDBImage;
    ppRep_K_RSaiyou: TppLabel;
    K_Hd_SisanLine03: TppLine;
    K_Dt_SisanLine03: TppLine;
    DBTxt_K_BRSaiyou: TppDBText;
    G_Hd_SisanLine03: TppLine;
    ppRep_G_RSaiyou1: TppLabel;
    DBTxt_G_RSaiyou1: TppDBText;
    G_Dt_SisanLine03: TppLine;
    ppRep_S_Keisyokbn: TppLabel;
    ppRep_S_Fkana: TppLabel;
    ppRep_S_GYO: TppLabel;
    DBTxt_S_Fkana: TppDBText;
    DBTxt_S_GyoGcode: TppDBText;
    DBTxt_S_GyoNMK: TppDBText;
    DBTxt_S_Keisyokbn: TppDBText;
// <MYN> ins -s
    ppRep_S_MYNHoujinKojinNo: 		TppLabel;
    DBTxt_S_MYNHoujinKojinKbnNm: 	TppDBText;
    DBTxt_S_MYNHoujinKojinNo: 		TppDBText;
// <MYN> ins -e

	constructor     CreateModule                        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy                   (Sender: TObject);
    procedure       fnCmnBeforeGenerate                 (Sender: TObject);      // <004>
    procedure       CmnReportExtStandardGenBeforePrint  (Sender: TObject);      // <004>
    procedure       ppReportBeforePrint                 (Sender: TObject);
    procedure       DBTxt_Ks_SumCodePrint               (Sender: TObject);      // <004>
    procedure       ppReportKasanJEndPage               (Sender: TObject);      // <004>

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
	urSegSaiyo		:   array[1..10] of Integer;

	procedure   ppReport1FileOut            ();
    procedure   fnInzPrint                  ();                                 // <004>
	function    fnInzSegBun                 (TargetQry : TFDQuery): Boolean;

  public
    { Public 宣言 }
    JntAuthority : TJNTAuthority;  // <Authority> ADD
	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
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
  DmJNTCRP004001L: TDmJNTCRP004001L;

  giIndex           :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
  uvCSVFileName     :   String;
  m_strExCodePrint  :   String;

implementation

uses
    JNTSelError;
    {<D10>Calendar;}

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
	pFrm    :   ^TDmJNTCRP004001L;
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
				pFrm^   :=  TDmJNTCRP004001L.CreateModule( AOwner,pRec );
                pFrm^.JntAuthority := TJntAuthority(ArHdl[0]^);  //<Authority> ADD
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea);
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
constructor TDmJNTCRP004001L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004001L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.CmnReportExtStandardGenBeforePrint(Sender: TObject);
begin

	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i       :   Integer;
    wRep    :   TppReport;
begin

    uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

    wRep := nil;
    case uvHani.pvrPattern of
        // 実在取引先登録ﾘｽﾄ(簡略型)<002>
        0:  begin
                wRep                    :=  ppReportKanryakuJ;
                dsKanryakuJ.DataSet     :=  TargetMD;
                uvCSVFileName           :=  '実在取引先登録リスト(簡略型)';
            end;
        // 実在取引先登録ﾘｽﾄ(詳細型)
        1:  begin
                wRep                    :=  ppReportShosaiJ;
                dsShosaiJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '実在取引先登録リスト(詳細型)';
            end;
        // 実在取引先登録ﾘｽﾄ(分類、ｾｸﾞﾒﾝﾄ型)
        2:  begin
                wRep                    :=  ppReportSegBun;
                dsSegBunJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '実在取引先登録リスト(分類・セグメント型)';

                if (not fnInzSegBun(TargetQry)) then
                begin
                   MjsMessageBox(Owner,'分類とセグメントが採用されていません。', mjError, mjDefOk);
                   Exit;
                end;
            end;
        // 合計取引先登録ﾘｽﾄ<004>
        3:  begin
                wRep                    :=  ppReportGoukeiJ;
                dsGoukeiJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '合計取引先登録リスト';
            end;
        // 取引先加算登録ﾘｽﾄ<004>
        4:  begin
                wRep                    :=  ppReportKasanJ;
                dsKasanJ.DataSet        :=  TargetMD;
                uvCSVFileName           :=  '取引先加算登録リスト';
            end;
    end;

    // 印刷初期化処理
    fnInzPrint;

    PrnSupport.ApRB				:=  wRep;
    PrnSupport.strDocName		:=  uvHani.pvrRepTitle;

    PrnSupport.pApRec			:=  m_pRec;						//<PLOG>
    PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
    PrnSupport.MdataModule	    :=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo


    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
//<Authority> DEL    if ( m_cJNTArea.IsExtract = FALSE )  then
    if ( JntAuthority.IsExtract = FALSE )  then  //<Authority> ADD
	    PrnSupport.iDspFileBtn	:=  0
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

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE:      ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.ppReport1FileOut();
var
    sTitle      :   TStringList;
    sMemFld     :   TStringList;
    i		    :   Integer;
    tmpLabel	:	TppLabel;
    ds          :   TDataSource;
begin

    sTitle      :=  TStringList.Create;
    sMemFld     :=  TStringList.Create;
    ds          :=  nil;
    tmpLabel    :=  nil;

    case uvHani.pvrPattern of
        // 実在取引先登録ﾘｽﾄ(簡略型)
        0:  begin
                ds  :=  dsKanryakuJ;

                sTitle.Add('ｺｰﾄﾞ'           );
                sTitle.Add('正式名称'       );
                sTitle.Add('簡略名称'       );
                sTitle.Add('連想'           );
                sTitle.Add('得意先採用'     );
                sTitle.Add('仕入先採用'     );

// <005>                if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>               begin
                    sTitle.Add('資産購入先'     );
                    sTitle.Add('資産売却先'     );
					sTitle.Add('リース取引先'   );	//<007>リース取引先追加
// <005>               end;

                sMemFld.Add('GCode'         );
                sMemFld.Add('Nm'            );
                sMemFld.Add('Nmk'           );
                sMemFld.Add('Renso'         );
                sMemFld.Add('TSAIYOU'       );
                sMemFld.Add('SSAIYOU'       );
// <005>                if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>                begin
                    sMemFld.Add('SisanHojyoKbn1');
                    sMemFld.Add('SisanHojyoKbn2');
					sMemFld.Add('SisanHojyoKbn3');	//<007>リース取引先追加
// <005>                end;
            end;
        // 実在取引先登録ﾘｽﾄ(詳細型)
        1:  begin
                ds  :=  dsShosaiJ;

                sTitle.Add('ｺｰﾄﾞ'           );
                sTitle.Add('採用区分'       );
                sTitle.Add('連想'           );
                sTitle.Add('簡略名称'       );
                sTitle.Add('正式名称'       );
//↓<2284>
                sTitle.Add('敬称'       );
                sTitle.Add('ﾌﾘｶﾞﾅ'       );
//↑<2284>
                sTitle.Add('郵便番号(基番)' );
                sTitle.Add('郵便番号(枝番)' );
                sTitle.Add('住所上段'       );
                sTitle.Add('住所下段'       );
                sTitle.Add('代表者役職名'   );
                sTitle.Add('代表者名'       );
                sTitle.Add('電話番号１'     );
                sTitle.Add('電話番号２'     );
                sTitle.Add('FAX番号'        );
//↓<2284>
                sTitle.Add('業種ｺｰﾄﾞ'       );
                sTitle.Add('業種名'			);
                sTitle.Add('HPアドレス'		);
//↑<2284>
                sTitle.Add('資本金'         );
                sTitle.Add('社員数'         );
                sTitle.Add('年商'           );
                sTitle.Add('適用開始'       );
                sTitle.Add('適用終了'       );
//↓<2284>
                sTitle.Add('得意先締日１'   );
                sTitle.Add('回収予定月１'	);
                sTitle.Add('回収予定日１'	);
                sTitle.Add('回収予定休日１'	);
                sTitle.Add('得意先締日２'   );
                sTitle.Add('回収予定月２'	);
                sTitle.Add('回収予定日２'	);
                sTitle.Add('回収予定休日２'	);
                sTitle.Add('得意先締日３'   );
                sTitle.Add('回収予定月３'	);
                sTitle.Add('回収予定日３'	);
                sTitle.Add('回収予定休日３'	);
                sTitle.Add('得意先随時請求回収ｻｲﾄ'	);
                sTitle.Add('得意先特殊請求ＮＯ'		);
                sTitle.Add('得意先随時/特殊休日'	);
                sTitle.Add('仕入先締日１'   );
                sTitle.Add('支払予定月１'	);
                sTitle.Add('支払予定日１'	);
                sTitle.Add('支払予定休日１'	);
                sTitle.Add('仕入先締日２'   );
                sTitle.Add('支払予定月２'	);
                sTitle.Add('支払予定日２'	);
                sTitle.Add('支払予定休日２'	);
                sTitle.Add('仕入先締日３'   );
                sTitle.Add('支払予定月３'	);
                sTitle.Add('支払予定日３'	);
                sTitle.Add('支払予定休日３'	);
                sTitle.Add('仕入先随時請求支払ｻｲﾄ'	);
                sTitle.Add('仕入先特殊請求ＮＯ'		);
                sTitle.Add('仕入先随時/特殊休日'	);
//↑<2284>
                sTitle.Add('最終更新日時'   );
// <MYN> ins -s
                sTitle.Add('法人・個人区分'   );
                sTitle.Add('法人・個人番号'   );
// <MYN> ins -e

                sMemFld.Add('GCode'         );
                sMemFld.Add('HojyoKbn'      );
                sMemFld.Add('Renso'         );
                sMemFld.Add('Nmk'           );
                sMemFld.Add('Nm'            );
//↓<2284>
                sMemFld.Add('Keisyokbn'     );
                sMemFld.Add('Fkana'         );
//↑<2284>
                sMemFld.Add('PostNo1'       );
                sMemFld.Add('PostNo2'       );
                sMemFld.Add('Ads1'          );
                sMemFld.Add('Ads2'          );
                sMemFld.Add('DHyoNm1'       );
                sMemFld.Add('DHyoNm2'       );
                sMemFld.Add('Tel1'          );
                sMemFld.Add('Tel2'          );
                sMemFld.Add('Fax1'          );
//↓<2284>
                sMemFld.Add('GyoGcode'      );
                sMemFld.Add('GyoNMK'        );
                sMemFld.Add('HPAddress'     );
//↑<2284>
                sMemFld.Add('ShihonKin'     );
                sMemFld.Add('SyainSu'       );
                sMemFld.Add('Nensyo'        );
                sMemFld.Add('TStartDate'    );
                sMemFld.Add('TEndDate'      );
//↓<2284>
                sMemFld.Add('RCloseDay1' 	);
                sMemFld.Add('RcvMonth1Name' );
                sMemFld.Add('RcvDay1'    	);
                sMemFld.Add('RHolidayKbn1Name'  );
                sMemFld.Add('RCloseDay2' 	);
                sMemFld.Add('RcvMonth2Name' );
                sMemFld.Add('RcvDay2'    	);
                sMemFld.Add('RHolidayKbn2Name'  );
                sMemFld.Add('RCloseDay3' 	);
                sMemFld.Add('RcvMonth3Name' );
                sMemFld.Add('RcvDay3'    	);
                sMemFld.Add('RHolidayKbn3Name'  );
                sMemFld.Add('TRRZuiSSite'   );
                sMemFld.Add('TRRTSEINO'  	);
                sMemFld.Add('TRRHolidayName');
                sMemFld.Add('PCloseDay1'    );
                sMemFld.Add('PayMonth1Name' );
                sMemFld.Add('PayDay1'       );
                sMemFld.Add('PHolidayKbn1Name'  );
                sMemFld.Add('PCloseDay2'    );
                sMemFld.Add('PayMonth2Name' );
                sMemFld.Add('PayDay2'       );
                sMemFld.Add('PHolidayKbn2Name'  );
                sMemFld.Add('PCloseDay3'    );
                sMemFld.Add('PayMonth3Name' );
                sMemFld.Add('PayDay3'       );
                sMemFld.Add('PHolidayKbn3Name'  );
                sMemFld.Add('SRRZuiSSite'   );
                sMemFld.Add('SRRTSEINO'     );
                sMemFld.Add('SRRHolidayName' );
//↑<2284>
                sMemFld.Add('UpdDateTM'     );
// <MYN> ins -s
                sMemFld.Add('MYNHoujinKojinKbnNm'  );
                sMemFld.Add('MYNHoujinKojinNo' );
// <MYN> ins -e

        end;
        // 実在取引先登録ﾘｽﾄ(分類、ｾｸﾞﾒﾝﾄ型)
		2:  begin
                ds  :=  dsSegBunJ;

			    sTitle.Add('コード'				    );
    			sTitle.Add('正式名称'				);
    			sTitle.Add('適用期間開始'			);
    			sTitle.Add('適用期間終了'			);

    			sMemFld.Add('strExCodeDst'			);
    			sMemFld.Add('strNameSimpleDst'		);
    			sMemFld.Add('dtStart'		        );
    			sMemFld.Add('dtEnd'			        );

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
        // 合計取引先登録ﾘｽﾄ<004>
        3:  begin
                ds  :=  dsGoukeiJ;

                sTitle.Add('ｺｰﾄﾞ'               );
                sTitle.Add('正式名称'           );
                sTitle.Add('簡略名称'           );
                sTitle.Add('連想'               );
                sTitle.Add('郵便番号（基番）'   );
                sTitle.Add('郵便番号（枝番）'   );
                sTitle.Add('住所'               );
                sTitle.Add('得意先採用'         );
                sTitle.Add('仕入先採用'         );
// <005>                if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>                begin
                    sTitle.Add('資産購入先'         );
                    sTitle.Add('資産売却先'         );
					sTitle.Add('リース取引先'       );	//<007>リース取引先追加
// <005>                end;

                sMemFld.Add('strExCode'         );
                sMemFld.Add('strName'           );
                sMemFld.Add('strNameSimple'     );
                sMemFld.Add('strAssociation'    );
                sMemFld.Add('nZipCodeUpper'     );
                sMemFld.Add('nZipCodeLower'     );
                sMemFld.Add('strAddress'        );
                sMemFld.Add('TSAIYOU'           );
                sMemFld.Add('SSAIYOU'           );
// <005>                if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>                begin
                    sMemFld.Add('KSAIYOU'           );
                    sMemFld.Add('BSAIYOU'           );
					sMemFld.Add('RSAIYOU'           );	//<007>リース取引先追加
// <005>                end;
            end;
        // 取引先加算登録ﾘｽﾄ<004>
        4:  begin
                ds  :=  dsKasanJ;

                sTitle.Add	('加算先ｺｰﾄﾞ'		);
			    sTitle.Add	('加算先名称'		);
    			sTitle.Add	('加算元ｺｰﾄﾞ'		);
    			sTitle.Add	('加算元名称'		);

    			sMemFld.Add	('strExCodeDst'		);
    			sMemFld.Add	('strNameSimpleDst'	);
    			sMemFld.Add	('strExCodeSrc'		);
    			sMemFld.Add	('strNameSimpleSrc'	);
            end;
    end;

    if ( MjsFileOut(ds.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free;
    sMemFld.Free;

end;

//------------------------------------------------------------------------------
// プレビューの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004001L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
// レポート印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.ppReportBeforePrint(Sender: TObject);
begin

	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
// ディテイルバンド印刷前処理<004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
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
        DtlBottomLine.Visible    := TRUE;
		DtlBottomLine.Weight    :=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
        DtlBottomLine.Visible    := TRUE;
		DtlBottomLine.Weight     :=	0.25;
	end;

    // 実在取引先登録ﾘｽﾄ(詳細型)
    if ( uvHani.pvrPattern = 1 ) then
    begin
        // 郵便番号の「－」
        if ( not dsShosaiJ.DataSet.FieldByName('PostNo1').IsNull      ) and
           ( dsShosaiJ.DataSet.FieldByName('PostNo1').AsString <> '0' ) then
                ppRep_S_PostLine.Visible    :=  TRUE
        else    ppRep_S_PostLine.Visible    :=  FALSE;

        // 適用日の「～」
        if ( dsShosaiJ.DataSet.FieldByName('TStartDate').IsNull ) and
           ( dsShosaiJ.DataSet.FieldByName('TEndDate').IsNull   ) then
                ppRep_S_TekiD.Visible       :=  FALSE
        else    ppRep_S_TekiD.Visible       :=  TRUE;
    end
    // 合計取引先登録ﾘｽﾄ
    else if ( uvHani.pvrPattern = 3 ) then
    begin
        // 郵便番号の「〒」「－」
        if ( not dsGoukeiJ.DataSet.FieldByName('nZipCodeUpper').IsNull      ) and
           ( dsGoukeiJ.DataSet.FieldByName('nZipCodeUpper').AsString <> '0' ) then
        begin
            ppRep_G_PostKigou.Visible   :=  TRUE;
            ppRep_G_PostLine.Visible    :=  TRUE;
        end
        else
        begin
            ppRep_G_PostKigou.Visible   :=  FALSE;
            ppRep_G_PostLine.Visible    :=  FALSE;
        end;
    end;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理<004>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP004001L.fnInzPrint();
var
    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;
begin

	// 取引先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
    begin
        case uvHani.pvrPattern of
            0:  DBTxt_K_GCode       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            1:  DBTxt_S_GCode       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            2:  DBTxt_BS_GCode      .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            3:  DBTxt_G_GCode       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            4:  begin
                    DBTxt_Ks_SumCode    .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
                    DBTxt_Ks_BaseCode   .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
                end;
        end;
   	end
    else
    begin
        case uvHani.pvrPattern of
    	    0:  DBTxt_K_GCode       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            1:  DBTxt_S_GCode       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            2:  DBTxt_BS_GCode      .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            3:  DBTxt_G_GCode       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            4:   begin
                    DBTxt_Ks_SumCode    .Alignment  :=  taRightJustify;  // 右寄せ(数値属性)
                    DBTxt_Ks_BaseCode   .Alignment  :=  taRightJustify;  // 右寄せ(数値属性)
                end;
        end;
    end;

    if ( uvHani.pvrPattern = 0 ) then
    begin
        // <003> 資産ﾗｲｾﾝｽﾁｪｯｸ(識別子420000)
// <005>        if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>        begin
//<CD16>↓
{
            K_Header_UpperLine      .Width      :=  8.7292;		//<007>長さを8.3021から8.7292に変更
            K_HeaderUnderLine       .Width      :=  8.7292;		//<007>長さを8.3021から8.7292に変更
            ppStandardUnderLine0    .Width      :=  8.7292;     //<007>長さを8.3021から8.7292に変更
}
            K_Header_UpperLine      .Width      :=  9.2360;
            K_HeaderUnderLine       .Width      :=  9.2360;
            ppStandardUnderLine0    .Width      :=  9.2360;
//<CD16>↑
            ppLine137.Pen           .Width      :=  0;
            ppLine70.Pen            .Width      :=  0;
// <005>        end
        // 資産のﾗｲｾﾝｽがない場合は、購入先、売却先は印字しない
// <005>        else
// <005>        begin
// <005>            K_Hd_SisanLine01        .Visible    :=  FALSE;
// <005>            K_Hd_SisanLine02        .Visible    :=  FALSE;
// <005>            K_Dt_SisanLine01        .Visible    :=  FALSE;
// <005>            K_Dt_SisanLine02        .Visible    :=  FALSE;
// <005>            ppRep_K_KSaiyou         .Visible    :=  FALSE;
// <005>            ppRep_K_BSaiyou         .Visible    :=  FALSE;
// <005>            DBTxt_K_KSaiyou         .Visible    :=  FALSE;
// <005>            DBTxt_K_BSaiyou         .Visible    :=  FALSE;
// <005>        end;
    end
    else if ( uvHani.pvrPattern = 3 ) then
    begin
// <005>        if ( CheckModuleLicense(m_pRec,420000) ) then
// <005>        begin
// <CD16>↓
{
            G_Header_UpperLine      .Width      :=  12.1145;	//<007>長さを11.6875から12.1145に変更
            G_HeaderUnderLine       .Width      :=  12.1145;	//<007>長さを11.6875から12.1145に変更
            ppStandardUnderLine3    .Width      :=  12.1145;	//<007>長さを11.6875から12.1145に変更
}
            G_Header_UpperLine      .Width      :=  12.5145;	//<007>長さを11.6875から12.1145に変更
            G_HeaderUnderLine       .Width      :=  12.5145;	//<007>長さを11.6875から12.1145に変更
            ppStandardUnderLine3    .Width      :=  12.5145;	//<007>長さを11.6875から12.1145に変更
// <CD16>↑
            ppLine79.Pen            .Width      :=  0;
            ppLine81.Pen            .Width      :=  0;
// <005>        end
        // 資産のﾗｲｾﾝｽがない場合は、購入先、売却先は印字しない
// <005>        else
// <005>        begin
// <005>            G_Hd_SisanLine01        .Visible    :=  FALSE;
// <005>            G_Hd_SisanLine02        .Visible    :=  FALSE;
// <005>            G_Dt_SisanLine01        .Visible    :=  FALSE;
// <005>            G_Dt_SisanLine02        .Visible    :=  FALSE;
// <005>            ppRep_G_KSaiyou         .Visible    :=  FALSE;
// <005>            ppRep_G_BSaiyou         .Visible    :=  FALSE;
// <005>            DBTxt_G_KSaiyou         .Visible    :=  FALSE;
// <005>            DBTxt_G_BSaiyou         .Visible    :=  FALSE;
// <005>        end;
    end;

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

    // ﾌｧｲﾙ名
//<2722>    PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + uvCSVFileName + '.csv';
    PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + uvCSVFileName + '.csv'; //<2722>

end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
function  TDmJNTCRP004001L.fnInzSegBun(TargetQry : TFDQuery): Boolean;
var	i	: Integer;
begin

	Result := FALSE;

    // 得意先分類１採用区分
	if ( uvSelSys.GetTkBn1UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui01.Visible := TRUE;
		ppRep_BS_Bunrui01.Caption := uvSelSys.GettkBrNm1();
		if ( uvSelSys.GetTkBn1CdZs() = 2 ) then
			    DBTxt_BS_Bun01Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun01Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui01.Visible := FALSE;
	end;

    // 得意先分類２採用区分
	if ( uvSelSys.GetTkBn2UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui02.Visible := TRUE;
		ppRep_BS_Bunrui02.Caption := uvSelSys.GettkBrNm2();
		if ( uvSelSys.GetTkBn2CdZs() = 2 ) then
	    		DBTxt_BS_Bun02Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun02Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui02.Visible := FALSE;
	end;

    // 得意先分類３採用区分
	if ( uvSelSys.GetTkBn3UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui03.Visible := TRUE;
		ppRep_BS_Bunrui03.Caption := uvSelSys.GettkBrNm3();
		if ( uvSelSys.GetTkBn3CdZs() = 2 ) then
			    DBTxt_BS_Bun03Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun03Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui03.Visible := FALSE;
	end;

    // 得意先分類４採用区分
	if ( uvSelSys.GetTkBn4UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui04.Visible := TRUE;
		ppRep_BS_Bunrui04.Caption := uvSelSys.GettkBrNm4();
		if ( uvSelSys.GetTkBn4CdZs() = 2 ) then
			    DBTxt_BS_Bun04Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun04Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui04.Visible := FALSE;
	end;

    // 得意先分類５採用区分
	if ( uvSelSys.GetTkBn5UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui05.Visible := TRUE;
		ppRep_BS_Bunrui05.Caption := uvSelSys.GettkBrNm5();
		if ( uvSelSys.GetTkBn5CdZs() = 2 ) then
			    DBTxt_BS_Bun05Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun05Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui05.Visible := FALSE;
	end;

    // 仕入先分類１採用区分
	if ( uvSelSys.GetSiBn1UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui06.Visible := TRUE;
		ppRep_BS_Bunrui06.Caption := uvSelSys.GetsiBrNm1();
		if ( uvSelSys.GetSiBn1CdZs() = 2 ) then
    			DBTxt_BS_Bun06Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun06Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui06.Visible := FALSE;
	end;

    // 仕入先分類２採用区分
	if ( uvSelSys.GetSiBn2UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui07.Visible := TRUE;
		ppRep_BS_Bunrui07.Caption := uvSelSys.GetsiBrNm2();
		if ( uvSelSys.GetSiBn2CdZs() = 2 ) then
			    DBTxt_BS_Bun07Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun07Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui07.Visible := FALSE;
	end;

    // 仕入先分類３採用区分
	if ( uvSelSys.GetSiBn3UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui08.Visible := TRUE;
		ppRep_BS_Bunrui08.Caption := uvSelSys.GetsiBrNm3();
		if ( uvSelSys.GetSiBn3CdZs() = 2 ) then
			    DBTxt_BS_Bun08Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun08Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui08.Visible := FALSE;
	end;

    // 仕入先分類４採用区分
	if ( uvSelSys.GetSiBn4UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui09.Visible := TRUE;
		ppRep_BS_Bunrui09.Caption := uvSelSys.GetsiBrNm4();
		if ( uvSelSys.GetSiBn4CdZs() = 2 ) then
			    DBTxt_BS_Bun09Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun09Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui09.Visible := FALSE;
	end;

    // 仕入先分類５採用区分
	if ( uvSelSys.GetSiBn5UseKbn() <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Bunrui10.Visible := TRUE;
		ppRep_BS_Bunrui10.Caption := uvSelSys.GetsiBrNm5();
		if ( uvSelSys.GetSiBn5CdZs() = 2 ) then
			    DBTxt_BS_Bun10Code.Alignment := taLeftJustify
		else    DBTxt_BS_Bun10Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Bunrui10.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄの採用判定
	with TargetQry do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
		SQL.Add('SELECT * from SegMA where MasterKBN = 22 AND RDelKbn = 0 ');
   		Open ();
        if (not EOF) then
        begin
            for i := 1 to  10 do
                urSegSaiyo[i]	:= FieldByName ('SegUse' + IntToStr(i)).AsInteger;
        end
        else
        begin
            for i := 1 to  10 do
                urSegSaiyo[i]	:= 0;
        end;
    end;

    // ｾｸﾞﾒﾝﾄ１採用区分
    if ( urSegSaiyo[1] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment01.Visible := TRUE;
		ppRep_BS_Segment01.Caption := uvSelSys.GetSegNm1();
		if ( uvSelSys.GetSeg1CdZs() = 2 ) then
			    DBTxt_BS_Seg01Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg01Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment01.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ２採用区分
    if ( urSegSaiyo[2] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment02.Visible := TRUE;
		ppRep_BS_Segment02.Caption := uvSelSys.GetSegNm2();
		if ( uvSelSys.GetSeg2CdZs() = 2 ) then
			    DBTxt_BS_Seg02Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg02Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment02.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ３採用区分
    if ( urSegSaiyo[3] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment03.Visible := TRUE;
		ppRep_BS_Segment03.Caption := uvSelSys.GetSegNm3();
		if ( uvSelSys.GetSeg3CdZs() = 2 ) then
			    DBTxt_BS_Seg03Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg03Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment03.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ４採用区分
    if ( urSegSaiyo[4] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment04.Visible := TRUE;
		ppRep_BS_Segment04.Caption := uvSelSys.GetSegNm4();
		if ( uvSelSys.GetSeg4CdZs() = 2 ) then
			    DBTxt_BS_Seg04Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg04Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment04.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ５採用区分
    if ( urSegSaiyo[5] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment05.Visible := TRUE;
		ppRep_BS_Segment05.Caption := uvSelSys.GetSegNm5();
		if ( uvSelSys.GetSeg5CdZs() = 2 ) then
			    DBTxt_BS_Seg05Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg05Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment05.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ６採用区分
    if ( urSegSaiyo[6] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment06.Visible := TRUE;
		ppRep_BS_Segment06.Caption := uvSelSys.GetSeg6Nm();
		if ( uvSelSys.GetSeg6CdZs() = 2 ) then
			    DBTxt_BS_Seg06Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg06Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment06.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ７採用区分
    if ( urSegSaiyo[7] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment07.Visible := TRUE;
		ppRep_BS_Segment07.Caption := uvSelSys.GetSeg7Nm();
		if ( uvSelSys.GetSeg7CdZs() = 2 ) then
			    DBTxt_BS_Seg07Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg07Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment07.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ８採用区分
    if ( urSegSaiyo[8] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment08.Visible := TRUE;
		ppRep_BS_Segment08.Caption := uvSelSys.GetSeg8Nm();
		if ( uvSelSys.GetSeg8CdZs() = 2 ) then
			    DBTxt_BS_Seg08Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg08Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment08.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ９採用区分
    if ( urSegSaiyo[9] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment09.Visible := TRUE;
		ppRep_BS_Segment09.Caption := uvSelSys.GetSeg9Nm();
		if ( uvSelSys.GetSeg9CdZs() = 2 ) then
			    DBTxt_BS_Seg09Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg09Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment09.Visible := FALSE;
	end;

	// ｾｸﾞﾒﾝﾄ１０採用区分
    if ( urSegSaiyo[10] <> 0 ) then
	begin
    	Result := TRUE;
		ppRep_BS_Segment10.Visible := TRUE;
		ppRep_BS_Segment10.Caption := uvSelSys.GetSeg10Nm();
		if ( uvSelSys.GetSeg10CdZs() = 2 ) then
			    DBTxt_BS_Seg10Code.Alignment := taLeftJustify
		else    DBTxt_BS_Seg10Code.Alignment := taRightJustify;
	end
	else
	begin
		ppRep_BS_Segment10.Visible := FALSE;
	end;

end;

//------------------------------------------------------------------------------
// 加算リスト【加算先ｺｰﾄﾞ印刷前処理】<004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.DBTxt_Ks_SumCodePrint(Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;
begin

	cDBTextExCode   :=  Sender as TppDBText;
	strExCode		:=  cDBTextExCode.Text;

	if ( CompareStr (strExCode,m_strExCodePrint) = 0) then
	begin
		cDBTextExCode                   .Visible    :=  FALSE;
		DBTxt_Ks_SumName                .Visible    :=  FALSE;
		CmnReportSystemLineDetailsTop   .Visible	:=  FALSE;
	end
	else
    begin
		cDBTextExCode                   .Visible    :=  TRUE;
		DBTxt_Ks_SumName                .Visible	:=  TRUE;

		if ( m_strExCodePrint = '') then
			    CmnReportSystemLineDetailsTop.Visible	:= FALSE
		else    CmnReportSystemLineDetailsTop.Visible	:= TRUE;

		m_strExCodePrint	:= strExCode;
	end;

end;

//------------------------------------------------------------------------------
// 加算リストOnEnd <004>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004001L.ppReportKasanJEndPage(Sender: TObject);
begin

    m_strExCodePrint    :=  '';

end;

end.

