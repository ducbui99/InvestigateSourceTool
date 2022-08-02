//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    債権情報(印刷処理)
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
//  <001>   広田 茂雄   2005/12/12(MON) 郵便番号の「-」非表示。
//  <002>   茂木 勇次   2006/02/07(TUE) 未対応の帳票の対応。
//          吉澤 義明   2007/03/09(FRI) 部門・担当者の印字
//  <003>   吉澤 義明   2007/06/13(WED) CSV出力先デフォルトのTMPの前に\を追加
//  <004>   吉澤 義明   2008/04/21(MON) カナ2・3の対応
//  <005>   吉澤 義明   2008/05/21(WED) 印刷履歴対応
//----Ver4.09 / NX-Ⅰ5.02
//  <DENSHI>    小川 哲央   2012/07/13(FRI) 電子記録債権情報登録リスト追加
//  <Authority> 小川 哲央   2012/07/13(FRI) サブモジュールの権限管理対応
//----NX-Ⅰ5.03
//  <Account>   小川 哲央   2012/11/16(FRI) 口座振替情報登録リスト追加
//  <GAIKA>     小川 哲央   2014/01/10(FRI) 外貨債権対応
//----NX-Ⅰ5.06
//  <T16>   吉澤 義明   2014/04/04(FRI) 取引先16ケタ対応（印刷幅の拡張と長体化）
//----NX-Ⅰ5.08/4.13
//  <GFB>   小川 哲央   2014/12/04(THU) 外貨FB対応
//  <GFB2>  小川 哲央   2015/07/13(MON) 外貨FB対応(送金依頼人名称登録リスト)
//  <006>                               両面印刷の「上綴じ」で印刷したとき2頁目の印刷日時が欠けていたため、微調整する
//                                      上記条件で簡略印刷の2頁目も右側の一覧が収まらなかったため微調整(※デザインのみの編集)
//=============================================================================
unit JNTCRP004003Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  dxmdaset, JNTCommonu
  ,JNTAuthorityu, ppDesignLayer, ppParameter;  // <Authority> ADD

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004003L = class(TDataModule)
    ppRepShosai: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppRep_S_TorihikiInfo: TppLabel;
    ppRep_S_BaseInfo: TppLabel;
    ppRep_S_SaikenInfo: TppLabel;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    SVppDate1: TppSystemVariable;
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
    ppLine93: TppLine;
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    DBTxt_S_PostNo1: TppDBText;
    ppRep_S_PostLine: TppLabel;
    DBTxt_S_PostNo2: TppDBText;
    DBTxt_S_Ads1: TppDBText;
    DBTxt_S_Ads2: TppDBText;
    DBTxt_S_UpdDateTM: TppDBText;
    DBTxt_S_Tel1: TppDBText;
    DBTxt_S_TStartDate: TppDBText;
    DBTxt_S_TEndDate: TppDBText;
    ppRep_S_TekiD: TppLabel;
    ppLine1: TppLine;
    DBTxt_S_nSSsyoPfmNm: TppDBText;
    ppLine4: TppLine;
    DBTxt_S_nSSsyoKgm: TppDBText;
    ppRep_S_StdKin_En: TppLabel;
    ppRep_S_StdRitu_Per: TppLabel;
    DBTxt_S_Jouken1: TppDBText;
    DBTxt_S_Jouken2: TppDBText;
    DBTxt_S_EDIKbn: TppDBText;
    DBTxt_S_DefoltEDI: TppDBText;
    DBTxt_S_KanaName: TppDBText;
    DBTxt_S_TesuryoFutan: TppDBText;
    DBTxt_S_EDINm: TppDBText;
    ppLine6: TppLine;
    dsShosai: TDataSource;
    PipelineShosai: TppDBPipeline;
    DBTxt_S_nSSsyoPfm: TppDBText;
    DBTxt_S_StdRitu: TppDBText;
    DBTxt_S_StdKin: TppDBText;
    DBTxt_S_nSSsyoKgmNm: TppDBText;
    DBTxt_S_BunkaiNm: TppDBText;
    DBTxt_S_OyaNm: TppDBText;
    DBTxt_S_Jouken1Nm: TppDBText;
    DBTxt_S_Jouken2Nm: TppDBText;
    DBTxt_S_TesuryoNm: TppDBText;
    DBTxt_S_OyaNCd: TppDBText;
    ppLine12: TppLine;
    ppRep_S_KaisyuInfo: TppLabel;
    LabelSubTitle1: TppLabel;
    DBTxt_S_SectNm: TppDBText;
    DBTxt_S_Mail: TppDBText;
    DBTxt_S_BmNCd: TppDBText;
    DBTxt_S_TanNm: TppDBText;
    DBTxt_S_BmNm: TppDBText;
    DBTxt_S_TnNCd: TppDBText;
    DBTxt_S_TnNm: TppDBText;
    DBTxt_S_Keisyo: TppDBText;
    ppLine2: TppLine;
    ppRep_S_MachingInfo: TppLabel;
    ppLine3: TppLine;
    ppRep_S_GCode: TppLabel;
    ppRep_S_Renso: TppLabel;
    ppRep_S_Nm: TppLabel;
    ppRep_S_PostNo: TppLabel;
    ppRep_S_TekiyoKikan: TppLabel;
    ppRep_S_Nmk: TppLabel;
    ppRep_S_UpdDateTM: TppLabel;
    ppRep_S_Ads1: TppLabel;
    ppRep_S_Tel1: TppLabel;
    ppRep_S_SectNm: TppLabel;
    ppRep_S_TanNm: TppLabel;
    ppRep_S_Mail: TppLabel;
    ppRep_S_Bumon: TppLabel;
    ppRep_S_Tanto: TppLabel;
    ppRep_S_USDenPfm: TppLabel;
    ppRep_S_USGKei: TppLabel;
    ppRep_S_nSSsyoPfm: TppLabel;
    ppRep_S_nSSsyoKgm: TppLabel;
    ppRep_S_BunkaiKbn: TppLabel;
    ppRep_S_StdRitu: TppLabel;
    ppRep_S_StdKin: TppLabel;
    ppRep_S_Jouken1: TppLabel;
    ppRep_S_Jouken2: TppLabel;
    ppRep_S_KanaName: TppLabel;
    ppRep_S_TesuryoFutan: TppLabel;
    ppRep_S_EDIKbn: TppLabel;
    ppRep_S_DefoltEDI: TppLabel;
    ppRep_S_OyaNCd: TppLabel;
    ppLine8: TppLine;
    ppLine10: TppLine;
    DBTxt_S_Mail2: TppDBText;
    DBTxt_S_Mail3: TppDBText;
    DBTxt_S_nRyoPfm: TppDBText;
    DBTxt_S_nRyoPfmNm: TppDBText;
    DBTxt_S_nRyoTeki: TppDBText;
    DBTxt_S_nRyoTekiNm: TppDBText;
    DBTxt_S_nSyuRyoKbn: TppDBText;
    DBTxt_S_nSyuRyoKbnNm: TppDBText;
    DBTxt_S_nHasuuHou: TppDBText;
    DBTxt_S_nHasuuHouNm: TppDBText;
    ppRep_S_Ads2: TppLabel;
    ppRep_S_nRyoPfm: TppLabel;
    ppRep_S_nRyoTeki: TppLabel;
    ppRep_S_nSyuRyoKbn: TppLabel;
    ppRep_S_nHasuuHou: TppLabel;
    ppRep_S_YsGKin: TppLabel;
    ppRep_S_Site: TppLabel;
    DBTxt_S_USDenPfm: TppDBText;
    DBTxt_S_USDenPfmNm: TppDBText;
    DBTxt_S_USGKei: TppDBText;
    DBTxt_S_USGKeiNm: TppDBText;
    DBTxt_S_YsGKin: TppDBText;
    ppRep_S_YsGKin_En: TppLabel;
    DBTxt_S_Site: TppDBText;
    ppRep_S_Site_Days: TppLabel;
    DBTxt_S_BunkaiKbn: TppDBText;
    ppRepKanryaku: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine30: TppLine;
    ppLine53: TppLine;
    ppRep_K_GCode: TppLabel;
    ppRep_K_Nm: TppLabel;
    ppRep_K_Nmk: TppLabel;
    ppRep_K_Renso: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    K_HeaderUnderLine: TppLine;
    K_Header_UpperLine: TppLine;
    ppLine126: TppLine;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    ppDetailBand0: TppDetailBand;
    DBTxt_K_GCode: TppDBText;
    DBTxt_K_Nm: TppDBText;
    DBTxt_K_Nmk: TppDBText;
    DBTxt_K_Renso: TppDBText;
    ppLine61: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine67: TppLine;
    ppStandardUnderLine0: TppLine;
    ppFooterBand3: TppFooterBand;
    SVppPage0: TppSystemVariable;
    PipelineKanryaku: TppDBPipeline;
    dsKanryaku: TDataSource;
    LabelSubTitle0: TppLabel;
    ppRep_S_NayoseInfo: TppLabel;
    DBTxt_S_SeikyuKbn: TppDBText;
    DBTxt_S_SeikyuKbnNm: TppDBText;
    ppRep_S_SeikyuKbn: TppLabel;
    ppRepNayose: TppReport;
    ppHeaderBand2: TppHeaderBand;
    CorpCode2: TppLabel;
    LabelTitle2: TppLabel;
    LineTitle2: TppLine;
    SVppDate2: TppSystemVariable;
    CorpName2: TppLabel;
    LabelSubTitle2: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppRep_N_NayoseOya: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine36: TppLine;
    ppLine9: TppLine;
    ppRep_N_SeikyuKbn: TppLabel;
    ppRep_N_Sime1: TppLabel;
    ppRep_N_Sime2: TppLabel;
    ppRep_N_Sime3: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine11: TppLine;
    ppRep_N_Mark: TppLabel;
    ppRep_N_NayoseKo: TppLabel;
    ppLine15: TppLine;
    ppLine24: TppLine;
    ppLine28: TppLine;
    ppDetailBand2: TppDetailBand;
    DBTxt_N_SName: TppDBText;
    DBTxt_N_HojCd: TppDBText;
    DBTxt_N_DaitaiMark: TppDBText;
    ppStandardUnderLine2: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    DBTxt_N_Key: TppDBText;
    ppLine29: TppLine;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    SVppPage2: TppSystemVariable;
    ppPageStyle1: TppPageStyle;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    DBTxt_N_OyaHojCd: TppDBText;
    DBTxt_N_OyaName: TppDBText;
    DBTxt_N_SeikyuKbnNm: TppDBText;
    ppLine134: TppLine;
    ppLine133: TppLine;
    DBTxt_N_RCloseDay1Nm: TppDBText;
    GroupUnderLine2: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    DBTxt_N_RcvMonth1Nm: TppDBText;
    DBTxt_N_RcvDay1Nm: TppDBText;
    DBTxt_N_RHolidayKbn1Nm: TppDBText;
    DBTxt_N_RCloseDay2Nm: TppDBText;
    DBTxt_N_RcvMonth2Nm: TppDBText;
    DBTxt_N_RcvDay2Nm: TppDBText;
    DBTxt_N_RHolidayKbn2Nm: TppDBText;
    DBTxt_N_RCloseDay3Nm: TppDBText;
    DBTxt_N_RcvMonth3Nm: TppDBText;
    DBTxt_N_RcvDay3Nm: TppDBText;
    DBTxt_N_RHolidayKbn3Nm: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    PipelineNayose: TppDBPipeline;
    dsNayose: TDataSource;
    DBTxt_S_KanaName2: TppDBText;
    DBTxt_S_KanaName3: TppDBText;
    ppRepDensai: TppReport;
    ppHeaderBand1: TppHeaderBand;
    CorpCode3: TppLabel;
    CorpName3: TppLabel;
    LabelTitle3: TppLabel;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    ppLine31: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    DBTxt_Densai_GCode: TppDBText;
    DBTxt_Densai_Nm: TppDBText;
    ppDBText3: TppDBText;
    ppLine39: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppStandardUnderLine3: TppLine;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    SVppPage3: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLine45: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    dsDensai: TDataSource;
    PipelineDensai: TppDBPipeline;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    dsJEMCO: TDataSource;
    PipelineJEMCO: TppDBPipeline;
    ppRepJEMCO: TppReport;
    ppHeaderBand4: TppHeaderBand;
    CorpCode4: TppLabel;
    CorpName4: TppLabel;
    LabelTitle4: TppLabel;
    LineTitle4: TppLine;
    SVppDate4: TppSystemVariable;
    ppLabel17: TppLabel;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppLine33: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine46: TppLine;
    ppLine48: TppLine;
    ppLabel22: TppLabel;
    ppLine49: TppLine;
    ppLabel23: TppLabel;
    ppDetailBand4: TppDetailBand;
    DBTxt_JEMCO_GCode: TppDBText;
    DBTxt_JEMCO_Nm: TppDBText;
    ppDBText11: TppDBText;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppStandardUnderLine4: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    SVppPage4: TppSystemVariable;
    ppDBText12: TppDBText;
    dsAccount: TDataSource;
    PipelineAccount: TppDBPipeline;
    ppRepAccount: TppReport;
    ppHeaderBand6: TppHeaderBand;
    CorpCode5: TppLabel;
    CorpName5: TppLabel;
    LabelTitle5: TppLabel;
    LineTitle5: TppLine;
    SVppDate5: TppSystemVariable;
    ppColumnHeaderBand5: TppColumnHeaderBand;
    ppLine32: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine44: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLabel26: TppLabel;
    ppLine59: TppLine;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppDetailBand5: TppDetailBand;
    DBTxt_Account_GCode: TppDBText;
    DBTxt_Account_Nm: TppDBText;
    ppDBText9: TppDBText;
    ppLine60: TppLine;
    ppLine62: TppLine;
    ppLine66: TppLine;
    ppStandardUnderLine5: TppLine;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppColumnFooterBand5: TppColumnFooterBand;
    ppFooterBand6: TppFooterBand;
    SVppPage5: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel14: TppLabel;
    ppLabel28: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLine18: TppLine;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine69: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLine70: TppLine;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLine71: TppLine;
    ppRep_S_GaikaSaiyo: TppLabel;
    DBTxt_S_GaikaSaiyoKbnNm: TppDBText;
    DBTxt_S_GaikaSaiyoKbn: TppDBText;
    dsSoukin: TDataSource;
    PipelineSoukin: TppDBPipeline;
    ppRepSoukin: TppReport;
    ppHeaderBand7: TppHeaderBand;
    CorpCode6: TppLabel;
    CorpName6: TppLabel;
    LabelTitle6: TppLabel;
    LineTitle6: TppLine;
    SVppDate6: TppSystemVariable;
    ppColumnHeaderBand6: TppColumnHeaderBand;
    ppLine73: TppLine;
    ppLabel34: TppLabel;
    ppLabel43: TppLabel;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppDetailBand6: TppDetailBand;
    DBTxt_Gaika_GCode: TppDBText;
    ppDBText2: TppDBText;
    ppDBText30: TppDBText;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine82: TppLine;
    ppStandardUnderLine6: TppLine;
    ppColumnFooterBand6: TppColumnFooterBand;
    ppFooterBand7: TppFooterBand;
    SVppPage6: TppSystemVariable;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText1: TppDBText;
    ppDBText33: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel30: TppLabel;
    ppLine68: TppLine;
    ppLabel32: TppLabel;
    ppLabel42: TppLabel;
    ppLabel44: TppLabel;

	constructor     CreateModule                        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy                   (Sender: TObject);
    procedure       ppRepBeforePrint                    (Sender: TObject);
    procedure       fnCmnBeforeGenerate                 (Sender: TObject);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);

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
    m_Pattern 		:	Integer;
    m_strNowCode	:	String;				// 外部コード表示・非表示判定用 <DENSHI> ADD

	procedure   ppReport1FileOut            ();
    procedure   fnInzPrint                  ();                                 // <002>

  public
    { Public 宣言 }
    JntAuthority : TJNTAuthority;  // <Authority> ADD
    GaikaBaseUseKbn : Integer;     // <GAIKA> ADD
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
  DmJNTCRP004003L: TDmJNTCRP004003L;

  giIndex       :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
  uvCSVFileName :   String;
  uvRepTitleName:   String;

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
	pFrm    :   ^TDmJNTCRP004003L;
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
				pFrm^   :=  TDmJNTCRP004003L.CreateModule( AOwner,pRec );
                pFrm^.JntAuthority := TJntAuthority(ArHdl[0]^);  //<Authority> ADD
                pFrm^.GaikaBaseUseKbn := Integer(ArHdl[1]^);     //<GAIKA> ADD
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
constructor TDmJNTCRP004003L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004003L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004003L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
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
    m_Pattern 	:= 0;

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

    // ↓↓↓<002>
    wRep := nil;
    case uvHani.pvrPattern of
        // 実在取引先債権情報登録ﾘｽﾄ(簡略型)
        0:
        begin
            wRep                    :=  ppRepKanryaku;
            dsKanryaku.DataSet      :=  TargetMD;
            uvCSVFileName           :=  '実在取引先債権情報登録リスト(簡略型)';
            uvRepTitleName			:=	'実在取引先登録リスト';
            m_Pattern 				:=	0;
        end;
        // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
        1:
        begin
            wRep                    :=  ppRepShosai;
            dsShosai.DataSet        :=  TargetMD;
            uvCSVFileName           :=  '実在取引先債権情報登録リスト(詳細型)';
            uvRepTitleName			:=	'実在取引先登録リスト';
            m_Pattern 				:=	1;
        end;
        // 合計取引先債権情報登録ﾘｽﾄ(簡略型)
        2:
        begin
            wRep                    :=  ppRepKanryaku;
            dsKanryaku.DataSet      :=  TargetMD;
            uvCSVFileName           :=  '合計取引先債権情報登録リスト(簡略型)';
            uvRepTitleName			:=	'合計取引先登録リスト';
            m_Pattern 				:=	0;
        end;
        // 合計取引先債権情報登録ﾘｽﾄ(詳細型)
        3:
        begin
            wRep                    :=  ppRepShosai;
            dsShosai.DataSet        :=  TargetMD;
            uvCSVFileName           :=  '合計取引先債権情報登録リスト(詳細型)';
            uvRepTitleName			:=	'合計取引先登録リスト';
            m_Pattern 				:=	1;
        end;
        // 一括請求債権登録ﾘｽﾄ
        4:
        begin
            wRep                    :=  ppRepNayose;
            dsNayose.DataSet       	:=  TargetMD;
            uvCSVFileName           :=  '一括請求債権登録リスト';
            uvRepTitleName			:=	'一括請求登録リスト';
            m_Pattern 				:=	2;
        end;
//<DENSHI> ADD St
        // 電子記録債権情報登録ﾘｽﾄ(でんさいネット)
        5:
        begin
            wRep                    :=  ppRepDensai;
            dsDensai.DataSet       	:=  TargetMD;
            uvCSVFileName           :=  '電子記録債権情報登録リスト(でんさいネット)';
            uvRepTitleName			:=	'電子記録債権情報登録リスト';
            m_Pattern 				:=	3;
        end;
        // 電子記録債権情報登録ﾘｽﾄ(JEMCO)
        6:
        begin
            wRep                    :=  ppRepJEMCO;
            dsJEMCO.DataSet       	:=  TargetMD;
            uvCSVFileName           :=  '電子記録債権情報登録リスト(JEMCO)';
            uvRepTitleName			:=	'電子記録債権情報登録リスト';
            m_Pattern 				:=	4;
        end;
//<DENSHI> ADD Ed
//<Account> ADD St
        // 口座振替情報登録ﾘｽﾄ
        7:
        begin
            wRep                    :=  ppRepAccount;
            dsAccount.DataSet       	:=  TargetMD;
            uvCSVFileName           :=  '口座振替情報登録リスト';
            uvRepTitleName			:=	'口座振替情報登録リスト';
            m_Pattern 				:=	5;
        end;
//<Account> ADD Ed
//<GFB2> ADD St
        // 送金依頼人名称登録リスト
        8:
        begin
            wRep                    :=  ppRepSoukin;
            dsSoukin.DataSet       	:=  TargetMD;
            uvCSVFileName           :=  '送金依頼人名称登録リスト';
            uvRepTitleName			:=	'送金依頼人名称登録リスト';
            m_Pattern 				:=	6;
        end;
//<GFB2> ADD Ed
    end;

    // 印刷初期化処理
    fnInzPrint;

    PrnSupport.ApRB				:=  wRep;
    PrnSupport.strDocName		:=  uvHani.pvrRepTitle;

    PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
    PrnSupport.MdataModule	    :=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    PrnSupport.pApRec := m_pRec; //<005>  JSOX印刷履歴対応

    // ↑↑↑<002>

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
// ファイル出力処理 <002>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004003L.ppReport1FileOut();
var
    sTitle      :   TStringList;
    sMemFld     :   TStringList;
    ds          :   TDataSource;
begin
    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;
    ds      :=  nil;

    case m_Pattern of
        // 実在/合計取引先債権情報登録ﾘｽﾄ(簡略型)
        0:
        begin
            ds  :=  dsKanryaku;

            sTitle.Add('ｺｰﾄﾞ'             		);
        	sTitle.Add('正式名称'               );
    	    sTitle.Add('簡略名称'               );
        	sTitle.Add('連想'                   );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('Nm'                    );
            sMemFld.Add('Nmk'                   );
            sMemFld.Add('Renso'                 );
        end;
        // 実在/合計取引先債権情報登録ﾘｽﾄ(詳細型)
        1:
        begin
            ds  :=  dsShosai;

    	    sTitle.Add('ｺｰﾄﾞ'		           	);
        	sTitle.Add('連想'                   );
    	    sTitle.Add('簡略名称'               );
        	sTitle.Add('正式名称'               );
        	sTitle.Add('郵便番号（基番）'       );
    	    sTitle.Add('郵便番号（枝番）'       );
    	    sTitle.Add('住所上段'               );
        	sTitle.Add('住所下段'               );
        	sTitle.Add('更新日'                 );
    	    sTitle.Add('電話番号'             	);
        	sTitle.Add('送付先部署'           	);
    	    sTitle.Add('担当者'               	);
        	sTitle.Add('敬称'                   );
    	    sTitle.Add('ﾒｰﾙｱﾄﾞﾚｽ'         		);
            sTitle.Add('与信限度額'             );
            sTitle.Add('手形ｻｲﾄ'                );
            sTitle.Add('請求書ﾌｫｰﾑ'             );
            sTitle.Add('請求書ﾌｫｰﾑ名称'         );
            sTitle.Add('鏡欄税印字'             );
            sTitle.Add('鏡欄税印字名称'         );
            sTitle.Add('領収証ﾌｫｰﾑ'             );
            sTitle.Add('領収証ﾌｫｰﾑ名称'         );
            sTitle.Add('領収証の但し書き'       );
            sTitle.Add('領収証の但し書き名称'   );
            sTitle.Add('集金用領収証'           );
            sTitle.Add('集金用領収証名称'       );
            sTitle.Add('分解方法'               );
            sTitle.Add('分解方法名称'           );
            sTitle.Add('回収割合（率）'         );
            sTitle.Add('回収割合（金額）'       );
            sTitle.Add('回収種別１'         	);
            sTitle.Add('回収種別１名称'     	);
            sTitle.Add('回収種別２'         	);
            sTitle.Add('回収種別２名称'     	);
            sTitle.Add('端数処理方法'           );
            sTitle.Add('端数処理方法名称'       );
            case uvHani.pvrPattern of
                // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
                1:
                begin
                    sTitle.Add('ｶﾅ名称1'                 ); //<004>
                    sTitle.Add('ｶﾅ名称2'                 ); //<004>
                    sTitle.Add('ｶﾅ名称3'                 ); //<004>
                    sTitle.Add('手数料負担区分'         );
                    sTitle.Add('手数料負担区分名称'     );
                    sTitle.Add('EDI採用区分'            );
                    sTitle.Add('EDI採用区分名称'        );
                    sTitle.Add('EDI情報'                );
                end;
                // 合計取引先債権情報登録ﾘｽﾄ(詳細型)
                3:
                begin
		            sTitle.Add('請求区分' 				);
		            sTitle.Add('請求区分名称' 			);
		            sTitle.Add('名寄せ親代替得意先ｺｰﾄﾞ' );
		            sTitle.Add('名寄せ親代替得意先名称' );
                end;
            end;

//<GAIKA> ADD St
            if (GaikaBaseUseKbn <> 0) then
            begin
                // 外貨情報
                sTitle.Add('外貨入金消込採用区分'  		);  // 外貨採用区分
                sTitle.Add('外貨入金消込採用区分名称' 	);  // 外貨採用区分名称
//<GFB> ADD St
                sTitle.Add('外貨送金依頼人名称1'        );
                sTitle.Add('外貨送金依頼人名称2'        );
                sTitle.Add('外貨送金依頼人名称3'        );
//<GFB> ADD Ed
            end;
//<GAIKA> ADD Ed

            sMemFld.Add('GCode'                 );	// 取引先ｺｰﾄﾞ
            sMemFld.Add('Renso'                 );	// 連想
            sMemFld.Add('Nmk'                   );	// 簡略名称
            sMemFld.Add('Nm'                    );	// 正式名称
            sMemFld.Add('PostNo1'               );	// 郵便番号（基番）
            sMemFld.Add('PostNo2'               );	// 郵便番号（枝番）
            sMemFld.Add('Ads1'                  );	// 住所上段
            sMemFld.Add('Ads2'                  );	// 住所下段
            sMemFld.Add('UpdDateTm'             );  // 更新日
            sMemFld.Add('Tel1'                  );	// 電話番号
            sMemFld.Add('SectNm'                );	// 送付先部署
            sMemFld.Add('TanNm'                 );	// 担当者
            sMemFld.Add('Keisyo'                );	// 敬称
            sMemFld.Add('Mail'                  );	// ﾒｰﾙｱﾄﾞﾚｽ
            sMemFld.Add('YsGKin'                );	// 与信限度額
            sMemFld.Add('Site'                  );	// 手形ｻｲﾄ
            sMemFld.Add('nSSsyoPfm'             );	// 請求書ﾌｫｰﾑ
            sMemFld.Add('nSSsyoPfmNm'           );	// 請求書ﾌｫｰﾑ名称
            sMemFld.Add('nSSsyoKgm'             );	// 鏡欄税印字
            sMemFld.Add('nSSsyoKgmNm'           );	// 鏡欄税印字名称
            sMemFld.Add('nRyoPfm'               );	// 領収証ﾌｫｰﾑ
            sMemFld.Add('nRyoPfmNm'             );	// 領収証ﾌｫｰﾑ名称
            sMemFld.Add('nRyoTeki'              );	// 領収証の但し書き
            sMemFld.Add('nRyoTekiNm'            );	// 領収証の但し書き名称
            sMemFld.Add('nSyuRyoKbn'            );	// 集金用領収証
            sMemFld.Add('nSyuRyoKbnNm'          );  // 集金用領収証名称
            sMemFld.Add('BunkaiKbn'             );	// 分解方法
            sMemFld.Add('BunkaiNm'              );	// 分解方法名称
            sMemFld.Add('StdRitu'               );	// 回収割合（率）
            sMemFld.Add('StdKin'                );	// 回収割合（金額）
            sMemFld.Add('Jouken1'               );	// 回収種別１
            sMemFld.Add('Jouken1Nm'             );	// 回収種別１名称
            sMemFld.Add('Jouken2'               );	// 回収種別２
            sMemFld.Add('Jouken2Nm'             );	// 回収種別２名称
            sMemFld.Add('nHasuuHou'             );	// 端数処理方法
            sMemFld.Add('nHasuuHouNm'           );	// 端数処理方法名称
            case uvHani.pvrPattern of
                // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
                1:
                begin
                    sMemFld.Add('KanaName'              );	// ｶﾅ名称
                    sMemFld.Add('KanaName2'              );	// ｶﾅ名称2 //<004>
                    sMemFld.Add('KanaName3'              );	// ｶﾅ名称3 //<004>
                    sMemFld.Add('TesuryoFutan'          );  // 手数料負担区分
                    sMemFld.Add('TesuryoNm'             );	// 手数料負担区分名称
                    sMemFld.Add('EDIKbn'                );	// EDI採用区分
                    sMemFld.Add('EDINm'                 );	// EDI採用区分名称
                    sMemFld.Add('DefoltEDI'             );	// EDI情報
            	end;
                // 合計取引先債権情報登録ﾘｽﾄ(詳細型)
                3:
                begin
		            sMemFld.Add('SeikyuKbn'  			);  // 請求区分
		            sMemFld.Add('SeikyuKbnNm' 			);  // 請求区分名称
        		    sMemFld.Add('OyaNCd'                );	// 名寄せ親代替得意先ｺｰﾄﾞ
		            sMemFld.Add('OyaNm'                 );	// 名寄せ親代替得意先名称
                end;
            end;
//<GAIKA> ADD St
            if (GaikaBaseUseKbn <> 0) then
            begin
                // 外貨情報
                sMemFld.Add('GaikaSaiyoKbn'  			);  // 外貨採用区分
                sMemFld.Add('GaikaSaiyoKbnNm' 			);  // 外貨採用区分名称
//<GFB> ADD St
                sMemFld.Add('GaikaSoukinName1'           );	// 外貨送金人名称１
                sMemFld.Add('GaikaSoukinName2'          );	// 外貨送金人名称２
                sMemFld.Add('GaikaSoukinName3'          );	// 外貨送金人名称３
//<GFB> ADD Ed
            end;
//<GAIKA> ADD Ed
        end;
        // 一括請求債権登録ﾘｽﾄ
        2:
        begin
            ds  :=  dsNayose;

            sTitle.Add('名寄せ親得意先ｺｰﾄﾞ'   	);
            sTitle.Add('名寄せ親得意先名称'   	);
		    sTitle.Add('請求区分'	 			);
            sTitle.Add('締め日１'         		);
            sTitle.Add('予定月１'         		);
            sTitle.Add('予定日１'         		);
            sTitle.Add('休日１'         		);
            sTitle.Add('締め日２'         		);
            sTitle.Add('予定月２'         		);
            sTitle.Add('予定日２'         		);
            sTitle.Add('休日２'         		);
            sTitle.Add('締め日３'         		);
            sTitle.Add('予定月３'         		);
            sTitle.Add('予定日３'         		);
            sTitle.Add('休日３'         		);
            sTitle.Add('代替'         			);
            sTitle.Add('子得意先ｺｰﾄﾞ'   		);
            sTitle.Add('子得意先名称'   		);

            sMemFld.Add('OyaHojCD'              );  // 名寄せ親得意先ｺｰﾄﾞ
            sMemFld.Add('OyaName'               );	// 名寄せ親得意先名称
            sMemFld.Add('SeikyuKbnNm'           );	// 請求区分
            sMemFld.Add('RCloseDay1Nm'          );	// 締め日１
            sMemFld.Add('RcvMonth1Nm'           );	// 予定月１
            sMemFld.Add('RcvDay1Nm'             );	// 予定日１
            sMemFld.Add('RHolidayKbn1Nm'        );	// 休日１
            sMemFld.Add('RCloseDay2Nm'          );	// 締め日２
            sMemFld.Add('RcvMonth2Nm'           );	// 予定月２
            sMemFld.Add('RcvDay2Nm'             );	// 予定日２
            sMemFld.Add('RHolidayKbn2Nm'        );	// 休日２
            sMemFld.Add('RCloseDay3Nm'          );	// 締め日３
            sMemFld.Add('RcvMonth3Nm'           );	// 予定月３
            sMemFld.Add('RcvDay3Nm'             );	// 予定日３
            sMemFld.Add('RHolidayKbn3Nm'        );	// 休日３
            sMemFld.Add('DaitaiMark'             );	// 代替
            sMemFld.Add('HojCode'               );	// 子得意先ｺｰﾄﾞ
            sMemFld.Add('SName'                 );	// 子得意先名称
        end;
//<DENSHI> ADD St
        // 電子記録債権情報登録ﾘｽﾄ(でんさいネット)
        3:
        begin
            ds  :=  dsDensai;

            sTitle.Add('ｺｰﾄﾞ'             		);
        	sTitle.Add('正式名称'               );
    	    sTitle.Add('利用者番号'             );
        	sTitle.Add('カナ名称'               );
        	sTitle.Add('全銀ｺｰﾄﾞ'               );
        	sTitle.Add('支店ｺｰﾄﾞ'               );
        	sTitle.Add('預金種目ｺｰﾄﾞ'           );
        	sTitle.Add('預金種目名称'           );
        	sTitle.Add('口座番号'               );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('LongName'              );
            sMemFld.Add('DenUserID1'            );
            sMemFld.Add('DenCSKanaName'         );
            sMemFld.Add('AllBkCode'             );
            sMemFld.Add('AllBraCode'            );
            sMemFld.Add('AccKbn'                );
            sMemFld.Add('AccName'               );
            sMemFld.Add('AccNo'                 );
        end;
        // 電子記録債権情報登録ﾘｽﾄ(JEMCO)
        4:
        begin
            ds  :=  dsJEMCO;

            sTitle.Add('ｺｰﾄﾞ'             		);
        	sTitle.Add('正式名称'               );
    	    sTitle.Add('お客様番号(4桁)'        );
    	    sTitle.Add('お客様番号(7桁)'        );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('LongName'              );
            sMemFld.Add('DenUserID1'            );
            sMemFld.Add('DenUserID2'            );
        end;
//<DENSHI> ADD Ed
//<Account> ADD St
        // 電子記録債権情報登録ﾘｽﾄ(でんさいネット)
        5:
        begin
            ds  :=  dsAccount;

            sTitle.Add('ｺｰﾄﾞ'             		);
        	sTitle.Add('正式名称'               );
    	    sTitle.Add('口座振替ｸﾞﾙｰﾌﾟNO'       );
        	sTitle.Add('口座振替名称'           );
        	sTitle.Add('銀行ｶﾅ'                 );
        	sTitle.Add('支店ｶﾅ'                 );
        	sTitle.Add('預金種目ｺｰﾄﾞ'           );
        	sTitle.Add('預金種目名称'           );
        	sTitle.Add('口座番号'               );
        	sTitle.Add('顧客番号'               );
        	sTitle.Add('銀行ｺｰﾄﾞ'               );
        	sTitle.Add('支店ｺｰﾄﾞ'               );
        	sTitle.Add('銀行ｶﾅ'                 );
        	sTitle.Add('支店ｶﾅ'                 );
        	sTitle.Add('預金種目ｺｰﾄﾞ'           );
        	sTitle.Add('預金種目名称'           );
        	sTitle.Add('口座番号'               );
        	sTitle.Add('預金者名'               );
        	sTitle.Add('フリー項目１'           );
        	sTitle.Add('フリー項目２'           );
        	sTitle.Add('フリー項目３'           );
        	sTitle.Add('フリー項目４'           );
        	sTitle.Add('フリー項目５'           );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('LongName'              );
            sMemFld.Add('KoufuriNo'             );
            sMemFld.Add('KoufuriName'           );
            sMemFld.Add('BankName'              );
            sMemFld.Add('BranchName'            );
            sMemFld.Add('AccKbn'                );
            sMemFld.Add('AccName'               );
            sMemFld.Add('AccNo'                 );
            sMemFld.Add('UserCode'              );
            sMemFld.Add('AllBkCode'             );
            sMemFld.Add('AllBraCode'            );
            sMemFld.Add('CsBankName'            );
            sMemFld.Add('CsBranchName'          );
            sMemFld.Add('CsAccKbn'              );
            sMemFld.Add('CsAccName'             );
            sMemFld.Add('CsAccNo'               );
            sMemFld.Add('UserName'              );
            sMemFld.Add('FreeFld1'              );
            sMemFld.Add('FreeFld2'              );
            sMemFld.Add('FreeFld3'              );
            sMemFld.Add('FreeFld4'              );
            sMemFld.Add('FreeFld5'              );
        end;
//<Account> ADD Ed
//<GFB2> ADD St
        // 送金依頼人名称登録ﾘｽﾄ
        6:
        begin
            ds  :=  dsSoukin;

        	sTitle.Add('ｺｰﾄﾞ'                       );
        	sTitle.Add('正式名称'                   );
            sTitle.Add('外貨入金消込採用区分'  		);  // 外貨採用区分
            sTitle.Add('外貨入金消込採用区分名称' 	);  // 外貨採用区分名称
        	sTitle.Add('送金依頼人名称１'           );
        	sTitle.Add('送金依頼人名称２'           );
        	sTitle.Add('送金依頼人名称３'           );

            sMemFld.Add('GCode'                     );
            sMemFld.Add('LongName'                  );
            sMemFld.Add('GaikaSaiyoKbn'  			);  // 外貨採用区分
            sMemFld.Add('GaikaSaiyoKbnNm' 			);  // 外貨採用区分名称
            sMemFld.Add('GaikaSoukinName1'          );	// 外貨送金人名称１
            sMemFld.Add('GaikaSoukinName2'          );	// 外貨送金人名称２
            sMemFld.Add('GaikaSoukinName3'          );	// 外貨送金人名称３
        end;
//<GFB2> ADD Ed
    end;

    if ( MjsFileOut(ds.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free();
    sMemFld.Free();

end;

//------------------------------------------------------------------------------
// プレビューの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004003L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
// レポート印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004003L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
// ディテイルバンド印刷前処理   <002>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004003L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
begin

    DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.',        [m_Pattern])));
    DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [m_Pattern])));

//<DENSHI> ADD St
    if ( m_Pattern = 3) then
    begin
        if (dsDensai.DataSet.FieldByName('GCode').AsString = m_strNowCode) then
        begin
            DBTxt_Densai_GCode.Visible := false;
            DBTxt_Densai_Nm.Visible := false;
        end
        else
        begin
            DBTxt_Densai_GCode.Visible := true;
            DBTxt_Densai_Nm.Visible := true;
        end;

        m_strNowCode := dsDensai.DataSet.FieldByName('Gcode').AsString;
    end
    else if ( m_Pattern = 4) then
    begin
        if (dsJEMCO.DataSet.FieldByName('GCode').AsString = m_strNowCode) then
        begin
            DBTxt_JEMCO_GCode.Visible := false;
            DBTxt_JEMCO_Nm.Visible := false;
        end
        else
        begin
            DBTxt_JEMCO_GCode.Visible := true;
            DBTxt_JEMCO_Nm.Visible := true;
        end;

        m_strNowCode := dsJEMCO.DataSet.FieldByName('Gcode').AsString;
    end;
//<DENSHI> ADD Ed

	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( DtlBand.LastRecord ) or ( DtlBand.PageOutOfSpace = TRUE ) Then
	begin
		if ( DtlBand.OverFlow = FALSE ) then
			DtlBand.OverFlow    :=  TRUE;

		if ( DtlBottomLine.ReprintOnOverFlow = FALSE ) then
			DtlBottomLine.ReprintOnOverFlow :=  TRUE;

       	if ( m_Pattern =  2 ) and ( dsNayose.DataSet.FieldByName('PageEnd').AsInteger <> 1 ) and
           ( not DtlBand.LastRecord ) Then
		begin
	        // ﾗｲﾝの太さを太くしている
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight    :=	0.25;
        end
        else
        begin
	        // ﾗｲﾝの太さを太くしている
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight    :=	0.75;
        end;
//<DENSHI> ADD St
        if ( m_Pattern in [3,4]) then
                m_strNowCode := '';		// 次のページの頭は必ず親も表示
//<DENSHI> ADD Ed
	end
	else
	begin
	    if ( m_Pattern = 2 ) then
        begin
	        // ﾗｲﾝを消す
	        DtlBottomLine.Visible    := False;
			DtlBottomLine.Weight     :=	0.25;
        end
        else
        begin
	        // ﾗｲﾝの太さを元にもどす
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight     :=	0.25;
        end;
	end;

    // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
    if ( m_Pattern = 1 ) then
    begin
        // 郵便番号の「－」
        if ( not dsShosai.DataSet.FieldByName('PostNo1').IsNull      ) and
           ( dsShosai.DataSet.FieldByName('PostNo1').AsString <> ''  ) and		// <001>
           ( dsShosai.DataSet.FieldByName('PostNo1').AsString <> '0' ) then
		        ppRep_S_PostLine    .Visible    :=  TRUE
        else    ppRep_S_PostLine    .Visible    :=  FALSE;

        // 回収割合の「％」
        if ( not dsShosai.DataSet.FieldByName('StdRitu').IsNull   ) and
           ( dsShosai.DataSet.FieldByName('StdRitu').AsFloat <> 0 ) then
		        ppRep_S_StdRitu_Per .Visible    :=  TRUE
        else    ppRep_S_StdRitu_Per .Visible    :=  FALSE;

        // 回収割合の「円」
        if ( not dsShosai.DataSet.FieldByName('StdKin').IsNull   ) and
           ( dsShosai.DataSet.FieldByName('StdKin').AsFloat <> 0 ) then
    		    ppRep_S_StdKin_En   .Visible    :=  TRUE
        else    ppRep_S_StdKin_En   .Visible    :=  FALSE;

        // 与信限度額の「円」
        if ( not dsShosai.DataSet.FieldByName('YsGKin').IsNull   ) and
           ( dsShosai.DataSet.FieldByName('YsGKin').AsFloat <> 0 ) then
    		    ppRep_S_YsGKin_En   .Visible    :=  TRUE
        else    ppRep_S_YsGKin_En   .Visible    :=  FALSE;

        // 手形ｻｲﾄの「日」
        if ( not dsShosai.DataSet.FieldByName('Site').IsNull   ) and
           ( dsShosai.DataSet.FieldByName('Site').AsFloat <> 0 ) then
		        ppRep_S_Site_Days   .Visible    :=  TRUE
        else    ppRep_S_Site_Days   .Visible    :=  FALSE;

        // 名寄せ情報の「請求区分」
        if ( not dsShosai.DataSet.FieldByName('NYKRootKbn').IsNull    ) and
           ( dsShosai.DataSet.FieldByName('NYKRootKbn').AsInteger = 1 ) then
        begin
		        DBTxt_S_SeikyuKbn   .Visible    :=  TRUE;
		        DBTxt_S_SeikyuKbnNm .Visible    :=  TRUE;
        end
        else
        begin
        	    DBTxt_S_SeikyuKbn   .Visible    :=  FALSE;
		        DBTxt_S_SeikyuKbnNm .Visible    :=  FALSE;
        end;
    end
    // 一括請求登録ﾘｽﾄ
    else if ( m_Pattern = 2 ) then
    begin
    end;
end;

//------------------------------------------------------------------------------
//  印刷初期化処理  <002>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP004003L.fnInzPrint();
//<GAIKA> ADD St
const
    TopMargin = 0.3334;
//<GAIKA> ADD Ed
var
    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;
//<GAIKA> ADD St
    procedure AddGaikaInfo(headerLable: TppLabel);
    begin
        if (GaikaBaseUseKbn <> 0) then
        begin
            headerLable.Caption := StringReplace(headerLable.Caption,
                ' ', '', [rfReplaceAll])  +
                '/外貨情報';
        end
        else
        begin
            ppRep_S_GaikaSaiyo.Visible      := False;
            DBTxt_S_GaikaSaiyoKbn.Visible   := False;
            DBTxt_S_GaikaSaiyoKbnNm.Visible := False;
        end;
    end;
//<GAIKA> ADD Ed
begin
    m_strNowCode := '';							// <DENSHI> ADD
    case uvHani.pvrPattern of
        // 実在取引先債権情報登録ﾘｽﾄ(簡略型)
        0:
        begin
        end;
        // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
        1:
        begin
			ppRep_S_MachingInfo.Visible		:=	True;
            ppRep_S_KanaName.Visible		:=	True;
            //ppRep_S_KanaName2.Visible		:=	True; //<004>
            //ppRep_S_KanaName3.Visible		:=	True; //<004>

            ppRep_S_TesuryoFutan.Visible	:=	True;
            ppRep_S_EDIKbn.Visible			:=	True;
            ppRep_S_DefoltEDI.Visible		:=	True;
            DBTxt_S_KanaName.Visible		:=	True;
            DBTxt_S_KanaName2.Visible		:=	True;  //<004>
            DBTxt_S_KanaName3.Visible		:=	True;  //<004>

            DBTxt_S_TesuryoFutan.Visible	:=	True;
            DBTxt_S_TesuryoNm.Visible		:=	True;
            DBTxt_S_EDIKbn.Visible			:=	True;
            DBTxt_S_EDINm.Visible			:=	True;
            DBTxt_S_DefoltEDI.Visible		:=	True;

			ppRep_S_NayoseInfo.Visible		:=	False;
            ppRep_S_SeikyuKbn.Visible		:=	False;
            ppRep_S_OyaNCd.Visible			:=	False;
            DBTxt_S_SeikyuKbn.Visible  		:=	False;
            DBTxt_S_SeikyuKbnNm.Visible		:=	False;
            DBTxt_S_OyaNCd.Visible			:=	False;
            DBTxt_S_OyaNm.Visible			:=	False;
//<GAIKA> ADD St
            AddGaikaInfo(ppRep_S_MachingInfo);
            // EDI情報の下に配置
            ppRep_S_GaikaSaiyo.Top      := ppRep_S_DefoltEDI.Top + TopMargin;
            DBTxt_S_GaikaSaiyoKbn.Top   := DBTxt_S_DefoltEDI.Top + TopMargin;
            DBTxt_S_GaikaSaiyoKbnNm.Top := DBTxt_S_GaikaSaiyoKbn.Top;
//<GAIKA> ADD Ed
        end;
        // 合計取引先債権情報登録ﾘｽﾄ(簡略型)
        2:
        begin
        end;
        // 合計取引先債権情報登録ﾘｽﾄ(詳細型)
        3:
        begin
			ppRep_S_MachingInfo.Visible		:=	False;
            ppRep_S_KanaName.Visible		:=	False;
            ppRep_S_TesuryoFutan.Visible	:=	False;
            ppRep_S_EDIKbn.Visible			:=	False;
            ppRep_S_DefoltEDI.Visible		:=	False;
            DBTxt_S_KanaName.Visible		:=	False;
            DBTxt_S_TesuryoFutan.Visible	:=	False;
            DBTxt_S_TesuryoNm.Visible		:=	False;
            DBTxt_S_EDIKbn.Visible			:=	False;
            DBTxt_S_EDINm.Visible			:=	False;
            DBTxt_S_DefoltEDI.Visible		:=	False;

			ppRep_S_NayoseInfo.Visible		:=	True;
            ppRep_S_SeikyuKbn.Visible		:=	True;
            ppRep_S_OyaNCd.Visible			:=	True;
            DBTxt_S_SeikyuKbn.Visible  		:=	True;
            DBTxt_S_SeikyuKbnNm.Visible		:=	True;
            DBTxt_S_OyaNCd.Visible			:=	True;
            DBTxt_S_OyaNm.Visible			:=	True;
//<GAIKA> ADD St
            AddGaikaInfo(ppRep_S_NayoseInfo);
            // 名寄せ情報の下に配置
            ppRep_S_GaikaSaiyo.Top      := ppRep_S_OyaNCd.Top + TopMargin;
            DBTxt_S_GaikaSaiyoKbn.Top   := DBTxt_S_OyaNm.Top + TopMargin;
            DBTxt_S_GaikaSaiyoKbnNm.Top := DBTxt_S_GaikaSaiyoKbn.Top;
//<GAIKA> ADD Ed
        end;
        // 一括請求債権登録ﾘｽﾄ
        4:
        begin
        end;
    end;

    // 各種ｺｰﾄﾞ属性対応
    case m_Pattern of
        // 実在取引先債権情報登録ﾘｽﾄ(簡略型)
        0:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_K_GCode.Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_K_GCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
        end;
        // 実在取引先債権情報登録ﾘｽﾄ(詳細型)
        1:
        begin
            // 取引先
            if ( uvSelSys.GetTkCdZs = 2 ) then
            begin
                DBTxt_S_GCode   .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
                DBTxt_S_OyaNCd  .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            end
            else
            begin
                DBTxt_S_GCode   .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            	DBTxt_S_OyaNCd  .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            end;
            // 部門
            if ( uvSelSys.GetBmCdZs = 2 ) then
                    DBTxt_S_BmNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_BmNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)
            // 担当者
            if ( uvSelSys.GetTnCdZs = 2 ) then
                    DBTxt_S_TnNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_TnNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)
        end;
        // 一括請求登録ﾘｽﾄ
        2:
        begin
        	if ( uvSelSys.GetTkCdZs = 2 ) then
            begin
            	DBTxt_N_OyaHojCd    .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            	DBTxt_N_HojCd       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
        	end
            else
            begin
            	DBTxt_N_OyaHojCd    .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            	DBTxt_N_HojCd       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            end;
        end;
//<DENSHI> ADD St
        // 電子記録債権情報登録ﾘｽﾄ(でんさい)
        3:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_Densai_GCode.Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_Densai_GCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
        end;
        // 電子記録債権情報登録ﾘｽﾄ(ＪＥＭＣＯ電手)
        4:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_JEMCO_GCode.Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_JEMCO_GCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
        end;
//<DENSHI> ADD Ed
//<Account> ADD St
        // 口座振替情報登録ﾘｽﾄ
        5:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_Account_GCode.Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_Account_GCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
        end;
//<Account> ADD Ed
//<GFB2> ADD St
        // 送金依頼人名称登録ﾘｽﾄ
        6:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_Gaika_GCode.Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_Gaika_GCode.Alignment  :=  taRightJustify; // 右寄せ(数値属性)
        end;
//<GFB2> ADD Ed
    end;

    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [m_Pattern])));
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
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [m_Pattern])));
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
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [m_Pattern])));
    PrnSupport.pDate	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
//<006> DEL        Left            :=  10.773;
        Left            :=  10.673;  //<006> ADD
        Top             :=  0;
        Width           :=  2.52;
        Height          :=  0.125;
        Alignment       :=  taRightJustify;
    end;

    // ﾀｲﾄﾙ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [m_Pattern])));
    with wTppLabel do
    begin
        Left            :=  4.865;
        Top             :=  0.1667;
        Width           :=  3.5;
        Height          :=  0.25;
        Alignment       :=  taCenter;
        Distributed2    :=  True;
        FontRatio.Auto  :=  True;
        Caption         :=  uvRepTitleName;
    end;

    // ﾀｲﾄﾙｱﾝﾀﾞ-
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [m_Pattern])));
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
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [m_Pattern])));
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
    //<003>
    //PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + uvCSVFileName + '.csv';
    PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + uvCSVFileName + '.csv';    //デリミタ\の追加

end;

//------------------------------------------------------------------------------
// グループヘッダーバンド印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004003L.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
	// 頁の最下行を判定する
	if ( dsNayose.DataSet.FieldByName('PageEnd').AsInteger = 2 ) Then
	begin
        // ﾗｲﾝの太さを太くしている
        GroupUnderLine2.Visible		:=	TRUE;
		GroupUnderLine2.Weight		:=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを細くしている
        GroupUnderLine2.Visible		:=	TRUE;
		GroupUnderLine2.Weight		:=	0.25;
	end;
end;

end.

