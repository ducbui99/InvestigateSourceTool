//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    販売情報(印刷処理)
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
//  <001>   広田 茂雄   2005/12/12(MON) 送り状ﾌｫｰﾑ名がﾚｲｱｳﾄにおさまっていない対応。
//  <002>   茂木 勇次   2006/02/01(WED) 帳票ﾀｲﾄﾙを「取引先登録ﾘｽﾄ」に変更。
//                                      合計得意先・仕入先も印字するように修正。
//                                      実在／合計区分項目の追加。
//  <003>   茂木 勇次   2006/02/01(WED) 得意先・仕入先簡略型の追加。
//	<004>	長谷川耕平	2006/04/25(Tue)	販売評価ﾚﾎﾟｰﾄ【Gali0285】
//	<005>	長谷川耕平	2006/06/20(Tue)	ﾗｲｾﾝｽ考慮
//	<006>	長谷川耕平	2006/07/21(Fri)	拡張分類対応
//  <   >   久保義和    2007.08.23(Thu) 裏面のﾏｰｼﾞﾝ設定を0に修正
//                                     （裏面のﾏｰｼﾞﾝは印刷ﾌﾟﾛｸﾞﾗﾑ(rbRCL55.bpl)で自動ｾｯﾄ)
//	<008>	LEAD M.Yamashita 2008/02/19	ホウエイ対応       
//	<PLOG>	久保義和	2008/07/14(Mon) 印刷履歴対応
//  <KOJ>   倉持  剛    2009/03/19(Thu) 工事ﾓｼﾞｭｰﾙが採用されている場合、得意先･仕入先印刷情報から各工事伝票情報を登録出来るように修正
//  <009>   新保一馬    2009/04/22(Wed) 簡略型(得意先)、簡略型(仕入先)のファイル出力をしようとすると、エラーになってファイル出力ができない。
//
//  ================== ↓Ver 4.01 リリース向け ===================================================
//
//	<   >	新保一馬	2010.07.29(Thu)	名称文字数UP対応(DBTxt_s_Nm、DBTxt_k_Nmに長体を設定。)
//
//  ==================↓Ver4.05差分 アディスミューズ対応==========================================
//
//	<2255>	吉田健吾	2011.11.17(Thu) アディスミューズ対応、印刷レイアウトにML簡略型の追加
//
// =================== ↓Ver 4.09(NX-I5.02) リリース向け ===================================================
//
//  <Authority>高橋功二 2012.07.24(TUE) サブモジュールの権限管理対応
//
//  ================== ↓Ver 4.13(NX-I 5.07) リリース向け ===================================================
//
//	<CD16>	柄松克弥	2014/01/17(Fri)	取引先コード16桁対応。パネル位置の変更(dfmの変更のみ）
//
//	<010>	小川(NTC)	2015.04.01(Wed) 詳細リストの下記項目を入力不可にする条件追加。現在は販売/仕入管理の採用のみだが、債権/債務管理の採用も追加する。（※画面表示に合わせる）
//										・納品書ﾌｫｰﾑ/仕入伝票ﾌｫｰﾑ、売上合計欄印字/仕入合計欄印字、上代合計欄印字、送り状ﾌｫｰﾑ
//                                      詳細リストの下記項目をライセンス条件なしにする。（※画面表示に合わせる）
//										・単価ﾗﾝｸ、単価掛率、指定商品ｺｰﾄﾞ、指定商品ｺｰﾄﾞ桁数
//	<D10>	鈴木基男	2019.09.13(Fri)	Delphi10対応
//
//	<PASS>	衣川  貴	2021.12.03(Fri) パスワード区分を追加（GaliDXのみ出力する）
//
//=============================================================================
unit JNTCRP004004Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, Db,
  FireDAC.Comp.Client, IniFiles,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, {<D10>ppDBBDE,}
  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl, FXLicense,
  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  dxmdaset, JNTCommonu, daDatMod, ppModule,
  SeriesCheck3U,     //<PASS>
  JNTAuthorityu, ppDesignLayer, ppParameter;// <Authority> ADD

const
//<008> ↓
    ucPrvSys_HOUEI = 'HE01';
//<008> ↑

type
{$include JNTSelPrtIF.inc}
{$include JNTSelFncH.inc}

  TDmJNTCRP004004L = class(TDataModule)
    ppReportShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    LppCorpCode1: TppLabel;
    LppCorpName1: TppLabel;
    ppReportShosaiJLabelTitle: TppLabel;
    ppReportShosaiJLineTitle: TppLine;
    SVppDate1: TppSystemVariable;
    ppLine92: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppDetailBand_StandardGen: TppDetailBand;
    ppStandardGenUnderLine: TppLine;
    DBTxt_s_GCode: TppDBText;
    DBTxt_s_Nm: TppDBText;
    DBTxt_s_Nmk: TppDBText;
    DBTxt_s_Renso: TppDBText;
    ppLine93: TppLine;
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    DBTxt_s_PostNo1: TppDBText;
    ppRep_s_PostNo: TppLabel;
    DBTxt_s_PostNo2: TppDBText;
    DBTxt_s_Ads1: TppDBText;
    DBTxt_s_Ads2: TppDBText;
    DBTxt_s_UpdDateTM: TppDBText;
    DBTxt_s_Tel1: TppDBText;
    DBTxt_s_SumKbnNm: TppDBText;
    ppLine1: TppLine;
    DataSourceShosaiJ: TDataSource;
    ppBDEPipelineShosaiJ: TppDBPipeline;
    DBTxt_s_Memo1: TppDBText;
    ppLine12: TppLine;
    ppLabel12: TppLabel;
    DBTxt_s_SectNm: TppDBText;
    DBTxt_s_BmNCd: TppDBText;
    DBTxt_s_TanNm: TppDBText;
    DBTxt_s_BmNm: TppDBText;
    DBTxt_s_TnNCd: TppDBText;
    DBTxt_s_TnNm: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    DBTxt_s_Fax1: TppDBText;
    ppLabel10: TppLabel;
    ppLabel19: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel20: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel21: TppLabel;
    ppLabel26: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel39: TppLabel;
    ppLabel41: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    DBTxt_s_Tel2: TppDBText;
    DBTxt_s_UrKinHsuKbn: TppDBText;
    DBTxt_s_GRuZSeiKbn: TppDBText;
    DBTxt_s_ZSeiKbn: TppDBText;
    DBTxt_s_ZHsuTniKbn: TppDBText;
    DBTxt_s_ZHsuKbn: TppDBText;
    DBTxt_s_UrKinHsuKbnNm: TppDBText;
    DBTxt_s_GRuZSeiKbnNm: TppDBText;
    DBTxt_s_ZHsuTniKbnNm: TppDBText;
    DBTxt_s_ZSeiKbnNm: TppDBText;
    DBTxt_s_ZHsuKbnNm: TppDBText;
    DBTxt_s_TrihikiKbn: TppDBText;
    DBTxt_s_NmKbn: TppDBText;
    DBTxt_s_TnkRnk: TppDBText;
    DBTxt_s_SShCdKbn: TppDBText;
    DBTxt_s_USGKEI: TppDBText;
    DBTxt_s_JYGKEI: TppDBText;
    DBTxt_s_YYKbn: TppDBText;
    DBTxt_s_USDENPFM: TppDBText;
    DBTxt_s_TrihikiKbnNm: TppDBText;
    DBTxt_s_NmKbnNm: TppDBText;
    DBTxt_s_KakeRt: TppDBText;
    ppRep_s_KakeRt: TppLabel;
    DBTxt_s_SShCdKbnNm: TppDBText;
    DBTxt_s_YYKbnNm: TppDBText;
    DBTxt_s_SShCdKet: TppDBText;
    DBTxt_s_DaiNmKbn: TppDBText;
    DBTxt_s_DaiNmKbnNm: TppDBText;
    DBTxt_s_USDENPFMNm: TppDBText;
    DBTxt_s_USGKEINm: TppDBText;
    DBTxt_s_JYGKEINm: TppDBText;
    DBTxt_s_MITPFM: TppDBText;
    DBTxt_s_JHDENPFM: TppDBText;
    DBTxt_s_SNDENPFM: TppDBText;
    DBTxt_s_SOFOPFM: TppDBText;
    DBTxt_s_MITPFMNm: TppDBText;
    DBTxt_s_JHDENPFMNm: TppDBText;
    DBTxt_s_SNDENPFMNm: TppDBText;
    DBTxt_s_SOFOPFMNm: TppDBText;
    DBTxt_s_Memo2: TppDBText;
    ppLabel44: TppLabel;
    DBTxt_s_MasKbn: TppDBText;
    DBTxt_s_MasKbnNm: TppDBText;
    ppRep_s_SShCdKet: TppLabel;
    ppReportKanryakuJ: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine8: TppLine;
    LppCorpCode2: TppLabel;
    LppCorpName2: TppLabel;
    ppLabel47: TppLabel;
    ppLine9: TppLine;
    SVppDate2: TppSystemVariable;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLine17: TppLine;
    ppLabel81: TppLabel;
    ppDetailBand_StandardGen2: TppDetailBand;
    ppStandardGenUnderLine2: TppLine;
    DBTxt_k_GCode: TppDBText;
    DBTxt_k_Nm: TppDBText;
    DBTxt_k_Nmk: TppDBText;
    DBTxt_k_Renso: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppRep_k_PostNo1: TppDBText;
    ppRep_k_PostNo: TppLabel;
    ppRep_k_PostNo2: TppDBText;
    DBTxt_k_Ads1: TppDBText;
    DBTxt_k_Ads2: TppDBText;
    DBTxt_k_SectNm: TppDBText;
    DBTxt_k_Tel1: TppDBText;
    DBTxt_k_SumKbnNm: TppDBText;
    ppLine21: TppLine;
    DBTxt_k_Fkana: TppDBText;
    DBTxt_k_BmNCd: TppDBText;
    DBTxt_k_TanNm: TppDBText;
    DBTxt_k_BmNm: TppDBText;
    DBTxt_k_TnNCd: TppDBText;
    DBTxt_k_TnNm: TppDBText;
    DBTxt_k_Fax1: TppDBText;
    ppLine23: TppLine;
    DBTxt_k_KeisyoKbn: TppDBText;
    ppFooterBand1: TppFooterBand;
    SVppPage2: TppSystemVariable;
    ppLabel4: TppLabel;
    DBTxt_k_TStartDate: TppDBText;
    ppLabel62: TppLabel;
    DBTxt_k_TEndDate: TppDBText;
    ppBDEPipelineKanryakuJ: TppDBPipeline;
    DataSourceKanryakuJ: TDataSource;
    ppDBImage1: TppDBImage;
    ppLabel2: TppLabel;
    DBTxt_s_MailAds: TppDBText;
    ppLabel18: TppLabel;
    DBTxt_s_Keisyo: TppDBText;
    ppLabelKK1: TppLabel;
    ppLabelKK2: TppLabel;
    DBTxt_s_KKBNCD1: TppDBText;
    DBTxt_s_KKBNNM1: TppDBText;
    DBTxt_s_KKBNCD2: TppDBText;
    DBTxt_s_KKBNNM2: TppDBText;
    pddCOUNTRY: TppDBText;
    pddCOUNTRYNM: TppDBText;
    pddCURRENCY: TppDBText;
    pddCURRENCYNM: TppDBText;
    phlCOUNTRY: TppLabel;
    phlCURRENCY: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel65: TppLabel;
    DBTxt_s_KUSGKEI: TppDBText;
    DBTxt_s_KUSGKEINm: TppDBText;
    DBTxt_s_KUSDENPFM: TppDBText;
    DBTxt_s_KUSDENPFMNm: TppDBText;
    DBTxt_s_KMITPFMNm: TppDBText;
    DBTxt_s_KMITPFM: TppDBText;
    DBTxt_s_KJHDENPFM: TppDBText;
    DBTxt_s_KJHDENPFMNm: TppDBText;
    ppReportkanryakuML: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine15: TppLine;
    LppCorpCode3: TppLabel;
    LppCorpName3: TppLabel;
    ppLabel68: TppLabel;
    ppLine16: TppLine;
    SVppDate3: TppSystemVariable;
    ppLine18: TppLine;
    ppLine22: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLhanbaizyouhou: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLtantou: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLine26: TppLine;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppDetailBand_StandardGen3: TppDetailBand;
    ppStandardGenUnderLine3: TppLine;
    DBTxt_ML_GCode: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppDBText5: TppDBText;
    ppRep_ML_PostNo: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine30: TppLine;
    ppDBText12: TppDBText;
    DBTxt_ML_BmNCd: TppDBText;
    ppDBText14: TppDBText;
    DBTxt_ML_TnNCd: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine31: TppLine;
    ppDBText18: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText32: TppDBText;
    pdbt2ZUISSITE: TppDBText;
    pdbt2TSEINO: TppDBText;
    ppFooterBand2: TppFooterBand;
    SVppPage3: TppSystemVariable;
    ppBDEPipelineKanryakuML: TppDBPipeline;
    DataSourceKanryakuML: TDataSource;
    ppDBText1: TppDBText;
    ppDBText15: TppDBText;
    DBTxt_ML_Closeday1: TppDBText;
    DBTxt_ML_Closeday2: TppDBText;
    DBTxt_ML_Closeday3: TppDBText;
    DBTxt_ML_cvMonth1: TppDBText;
    DBTxt_ML_cvMonth2: TppDBText;
    DBTxt_ML_cvMonth3: TppDBText;
    ppLine32: TppLine;
    DBTxt_ML_cvDay3: TppDBText;
    DBTxt_ML_cvDay2: TppDBText;
    DBTxt_ML_cvDay1: TppDBText;
    ppDBText28: TppDBText;
    DBTxt_ML_SeiGcode: TppDBText;
    ppLabelPassKbn: TppLabel;
    ppLabelPassItemKbn1: TppLabel;
    ppLabelPassItemKbn2: TppLabel;
    DBTxt_s_PassKbnNm: TppDBText;
    DBTxt_s_PassItemKbn1Nm: TppDBText;
    DBTxt_s_PassItemKbn2Nm: TppDBText;
    DBTxt_s_PassKbn: TppDBText;
    DBTxt_s_PassItemKbn1: TppDBText;
    DBTxt_s_PassItemKbn2: TppDBText;

	constructor     CreateModule                            (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy                       (Sender: TObject);
    procedure       CmnReportExtStandardGenBeforePrint      (Sender: TObject);
    procedure       ppReportShosaiJBeforePrint              (Sender: TObject);
    procedure       ppDetailBand_StandardGenBeforeGenerate  (Sender: TObject);
    procedure       ppReportKanryakuJBeforePrint            (Sender: TObject);  // <003>
    procedure       ppDetailBand_StandardGen2BeforeGenerate (Sender: TObject);  // <003>
    procedure       ppReportKanryakuMLBeforePrint            (Sender: TObject);  // <2255>
    procedure       ppDetailBand_StandardGen3BeforeGenerate (Sender: TObject);  // <2255>
    procedure		DataModuleCreate						(Sender: TObject);
    procedure ppLabelPassItemKbn2DrawCommandClick(Sender, aDrawCommand: TObject);

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

//<006>
	uvKBN1Attr		: Integer;
	uvKBN1Digit		: Integer;
	uvKBN1HojyoNm	: String;
	uvKBN1UseKbn	: Integer;
	uvKBN2Attr		: Integer;
	uvKBN2Digit		: Integer;
	uvKBN2HojyoNm	: String;
	uvKBN2UseKbn	: Integer;

    uvDatabase  :   TFDConnection;


	procedure ppReport1FileOut();
    procedure fnGetKakuchoInfo;

//<KOJ> Ins-s
    function  fnKojUse(): Boolean;          //建設工事業採用ﾁｪｯｸ
//<KOJ> Ins-e

  public
    { Public 宣言 }
    JNTAuthority    : TJNTAuthority;        // <Authority> ADD

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
  DmJNTCRP004004L: TDmJNTCRP004004L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError;
    {<D10>Calendar;}
{$include JNTSelFncB.inc}

{$R *.DFM}

var
//<226> ↓
    uvCstM_CTR: array [1..2] of String = ('国内','国外');
    uvPrvSysFlg: String = '';  // 専用システムフラグ
//<226> ↑

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
	pFrm    :   ^TDmJNTCRP004004L;
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
				pFrm^   :=  TDmJNTCRP004004L.CreateModule( AOwner,pRec );
                pFrm^.JNTAuthority := TJntAuthority(ArHdl[0]^); // <Authority> ADD

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
constructor TDmJNTCRP004004L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004004L.DataModuleCreate(Sender: TObject);
begin
//
    uvDatabase  :=  m_pMDataModule^.COPDBOpen( 1, m_pRec.m_iCorpID );
end;

procedure TDmJNTCRP004004L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.CmnReportExtStandardGenBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i: Integer;
	lvQry: TMQuery;
begin

	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

//<006> ↓
    //専用システムフラグ確認
    lvQry := TMQuery.Create(Application);
    try
        uvPrvSysFlg := '';      //Createしっぱなしになるのでここでも初期化
        m_pMDataModule.SetDBInfoToQuery(uvDataBase, lvQry);
        if IsCustomSel(lvQry, ucPrvSys_HOUEI) then
            uvPrvSysFlg := ucPrvSys_HOUEI;          //ホウエイ対応
    finally
        lvQry.Close;
        lvQry.Free;
    end;
//<006> ↑

//<006>
	fnGetKakuchoInfo;

   	// 得意先・仕入先詳細型
    if ( uvHani.pvrPattern in [1,3] ) then
    begin
        // DataSourceの設定
        DataSourceShosaiJ.DataSet   :=  TargetMD;

	    PrnSupport.ApRB				:=  ppReportShosaiJ;
        PrnSupport.strDocName		:=  uvHani.pvrRepTitle;	        //
        PrnSupport.pPage			:=  SVppPage1;			        // 頁
        PrnSupport.pDate			:=  SVppDate1;			        // 日付
        PrnSupport.pCorpCode		:=  LppCorpCode1;		        // 会社ｺｰﾄﾞ
        PrnSupport.pCorpName		:=  LppCorpName1;		        // 会社名称
        PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot +
                                        'tmp\' + uvHani.pvrRepTitle + '.csv';
    end
    // 得意先・仕入先簡略型<003>
    else if (uvHani.pvrPattern in [0,2] ) then
    begin
        // DataSourceの設定
        DataSourceKanryakuJ.DataSet :=  TargetMD;

	    PrnSupport.ApRB				:=  ppReportKanryakuJ;
        PrnSupport.strDocName		:=  uvHani.pvrRepTitle;	        //
        PrnSupport.pPage			:=  SVppPage2;			        // 頁
        PrnSupport.pDate			:=  SVppDate2;			        // 日付
        PrnSupport.pCorpCode		:=  LppCorpCode2;		        // 会社ｺｰﾄﾞ
        PrnSupport.pCorpName		:=  LppCorpName2;		        // 会社名称
        PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot +
                                        'tmp\' + uvHani.pvrRepTitle + '.csv';
    end
//<2255>↓
    // 得意先・仕入先ML型
    else if (uvHani.pvrPattern in [4,5] ) then
    begin
        // DataSourceの設定
        DataSourceKanryakuML.DataSet :=  TargetMD;

	    PrnSupport.ApRB				:=  ppReportkanryakuML;
        PrnSupport.strDocName		:=  uvHani.pvrRepTitle;	        //
        PrnSupport.pPage			:=  SVppPage3;			        // 頁
        PrnSupport.pDate			:=  SVppDate3;			        // 日付
        PrnSupport.pCorpCode		:=  LppCorpCode3;		        // 会社ｺｰﾄﾞ
        PrnSupport.pCorpName		:=  LppCorpName3;		        // 会社名称
        PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot +
                                        'tmp\' + uvHani.pvrRepTitle + '.csv';
    end;
//<2255>↑
    PrnSupport.pApRec			:=  m_pRec;						//<PLOG>
    PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
    PrnSupport.MdataModule	    :=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
// <Authority> ↓
//    if ( m_cJNTArea.IsExtract = FALSE )  then
    if ( JntAuthority.IsExtract = FALSE )  then
// <Authority> ↑
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
procedure TDmJNTCRP004004L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;

    bKoj    : Boolean;    //<KOJ> Ins 建設工事業採用判定ﾌﾗｸﾞ
    ds      : TDataSet;   //<009>ファイル出力用データセット
begin

//<KOJ> Ins-s
    // 建設工事業ﾗｲｾﾝｽ採用判定
    bKoj    := fnKojUse;
//<KOJ> Ins-e

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    ds := nil; //<009>

    // 詳細型
    if ( uvHani.pvrPattern in [1,3] ) then
    begin
    	ds := DataSourceShosaiJ.DataSet; //<009>詳細型のデータセットを使用します。

        sTitle.Add('取引先コード'           );
        sTitle.Add('得意先区分'             );
        sTitle.Add('得意先名称'             );
        sTitle.Add('連想'                   );
        sTitle.Add('簡略名称'               );
        sTitle.Add('正式名称'               );
        sTitle.Add('郵便番号（基番）'       );
        sTitle.Add('郵便番号（枝番）'       );
        sTitle.Add('住所上段'               );
        sTitle.Add('住所下段'               );
        sTitle.Add('送付先部署名'           );
        sTitle.Add('担当者名'               );
        sTitle.Add('適用期間（開始）'       );
        sTitle.Add('適用期間（終了）'       );
        sTitle.Add('更新日'                 );
        sTitle.Add('実在／合計'             );  // <002>
        sTitle.Add('実在／合計名称'         );  // <002>

        sTitle.Add('電話番号'               );
        sTitle.Add('電話番号２'             );
        sTitle.Add('ＦＡＸ番号'             );
        sTitle.Add('部門コード'             );
        sTitle.Add('部門名'                 );
        sTitle.Add('担当者コード'           );
        sTitle.Add('担当者名'               );

        // 得意先
        if ( uvHani.pvrPattern = 1 ) then
        begin
            sTitle.Add('売上端数区分'           );
            sTitle.Add('売上端数区分名称'       );
            sTitle.Add('現売税請求区分'         );
            sTitle.Add('現売税請求区分名称'     );
            sTitle.Add('消費税請求区分'         );
            sTitle.Add('消費税請求区分名称'     );
        end
        // 仕入先
        else if ( uvHani.pvrPattern = 3 ) then
        begin
            sTitle.Add('仕入端数区分'           );
            sTitle.Add('仕入端数区分名称'       );
            sTitle.Add('現仕税支払区分 '        );
            sTitle.Add('現仕税支払区分名称'     );
            sTitle.Add('消費税支払区分'         );
            sTitle.Add('消費税支払区分名称'     );
        end;

        sTitle.Add('消費税端数単位'         );
        sTitle.Add('消費税端数単位名称'     );
        sTitle.Add('消費税端数区分'         );
        sTitle.Add('消費税端数区分位名称'   );
//<008> ↓
        if (uvPrvSysFlg = ucPrvSys_HOUEI) then
        begin
            sTitle.Add('国内外区分');
            sTitle.Add('国内外区分名称');
            sTitle.Add('通貨');
            sTitle.Add('通貨名称');
        end;
//<008> ↑

//<006>↓
        sTitle.Add(uvKBN1HojyoNm + 'コード' );
        sTitle.Add(uvKBN1HojyoNm + '名称'   );
        sTitle.Add(uvKBN2HojyoNm + 'コード' );
        sTitle.Add(uvKBN2HojyoNm + '名称'   );
//<006>↑

        sTitle.Add('取引区分'               );
        sTitle.Add('取引区分名称'           );
        sTitle.Add('名称入力区分'           );
        sTitle.Add('名称入力区分名称'       );
        sTitle.Add('単価ランク'             );
        sTitle.Add('単価掛率'               );
        sTitle.Add('指定商品コード区分'     );
        sTitle.Add('指定商品コード区分名称' );
        sTitle.Add('桁数'                   );
        sTitle.Add('和暦/西暦区分'          );
        sTitle.Add('和暦/西暦区分名称'      );
        sTitle.Add('代表者名の印字'         );
        sTitle.Add('代表者名'               );

        // 得意先
        if ( uvHani.pvrPattern = 1 ) then
        begin
            sTitle.Add('納品書フォーム'         );
            sTitle.Add('納品書フォーム名称'     );
            sTitle.Add('売上合計欄税印字'       );
            sTitle.Add('売上合計欄税印字名称'   );
            sTitle.Add('上代合計欄税印字'       );
            sTitle.Add('上代合計欄税印字名称'   );
            sTitle.Add('見積書フォーム'         );
            sTitle.Add('見積書フォーム名称'     );
            sTitle.Add('受注伝票フォーム'       );
            sTitle.Add('受注伝票フォーム名称'   );
            sTitle.Add('出荷伝票フォーム'       );
            sTitle.Add('出荷伝票フォーム名称'   );
            sTitle.Add('送り状フォーム'         );
            sTitle.Add('送り状フォーム名称'     );
//<KOJ> Ins-s
            // 建設工事業ﾗｲｾﾝｽが採用されている場合は工事伝票項目を出力する
            if (bKoj) then
            begin
                sTitle.Add('工事売上伝票フォーム'     );
                sTitle.Add('工事売上伝票フォーム名称' );
                sTitle.Add('工事見積書フォーム'       );
                sTitle.Add('工事見積書フォーム名称'   );
                sTitle.Add('工事受注伝票フォーム'     );
                sTitle.Add('工事受注伝票フォーム名称' );
                sTitle.Add('工事合計欄税印字'         );
                sTitle.Add('工事合計欄税印字名称'     );
            end;
//<KOJ> Ins-e
        end
        // 仕入先
        else if ( uvHani.pvrPattern = 3 ) then
        begin
            sTitle.Add('仕入伝票フォーム'       );
            sTitle.Add('仕入伝票フォーム名称'   );
            sTitle.Add('仕入合計欄税印字'       );
            sTitle.Add('仕入合計欄税印字名称'   );
            sTitle.Add('発注伝票フォーム'       );
            sTitle.Add('発注伝票フォーム名称'   );
            sTitle.Add('入荷伝票フォーム'       );
            sTitle.Add('入荷伝票フォーム名称'   );
//<KOJ> Ins-s
            // 建設工事業ﾗｲｾﾝｽが採用されている場合は工事伝票項目を出力する
            if (bKoj) then
            begin
                sTitle.Add('工事原価伝票フォーム'     );
                sTitle.Add('工事原価伝票フォーム名称' );
                sTitle.Add('工事発注伝票フォーム'     );
                sTitle.Add('工事発注伝票フォーム名称' );
                sTitle.Add('工事合計欄税印字'         );
                sTitle.Add('工事合計欄税印字名称'     );
            end;
//<KOJ> Ins-e
        end;

        sTitle.Add('コメント1'          );
        sTitle.Add('コメント2'          );

//<PASS>ins-s
		//DXの場合はパスワード項目を出力
		if TMSeries3.isGalileopt4 then
        begin
        	sTitle.Add('パスワード設定'          );
        	sTitle.Add('パスワード設定名称'      );
			sTitle.Add('パスワード合成項目1'     );
			sTitle.Add('パスワード合成項目1名称' );
			sTitle.Add('パスワード合成項目2'     );
			sTitle.Add('パスワード合成項目2名称' );
        end;
//<PASS>ins-e

        sMemFld.Add('GCode'             );		    // 取引先ｺｰﾄﾞ

        sMemFld.Add('MasKbn'            );		    // 得意先区分
        sMemFld.Add('MasKbnNm'          ); 	        // 得意先名称

        sMemFld.Add('Renso'             );		    // 連想
        sMemFld.Add('Nmk'               );		    // 簡略名称
        sMemFld.Add('Nm'                );		    // 正式名称
        sMemFld.Add('PostNo1'           );		    // 郵便番号（基番）
        sMemFld.Add('PostNo2'           );		    // 郵便番号（枝番）
        sMemFld.Add('Ads1'              );		    // 住所上段
        sMemFld.Add('Ads2'              );		    // 住所下段
        sMemFld.Add('SectNm'            );		    // 送付先部署名
        sMemFld.Add('TanNm'             );		    // 担当者名
        sMemFld.Add('TStartDate'        );	        // 適用期間（開始）
        sMemFld.Add('TEndDate'          );	        // 適用期間（終了）
        sMemFld.Add('UpdDateTm'         );	        // 更新日
        sMemFld.Add('SumKbn'            );          // 実在／合計区分    <002>
        sMemFld.Add('SumKbnNm'          );          // 実在／合計区分名称<002>

        sMemFld.Add('Tel1'              );		    // 電話番号
        sMemFld.Add('Tel2'              );		    // 電話番号2
        sMemFld.Add('FAX'               );		    // 電話番号2
        sMemFld.Add('BmNCd'             );		    // 部門ｺｰﾄﾞ
        sMemFld.Add('BmNm'              );		    // 部門名
        sMemFld.Add('TnNCd'             );		    // 担当者ｺｰﾄﾞ
        sMemFld.Add('TnNm'              );		    // 担当者名

        sMemFld.Add('UrKinHsuKbn'       );		    // 売上/仕入端数区分
        sMemFld.Add('UrKinHsuKbnNm'     );	        // 売上/仕入端数区分名称
        sMemFld.Add('GRuZSeiKbn'        );		    // 現売税請求区分/現仕税支払区分
        sMemFld.Add('GRuZSeiKbnNm'      );	        // 現売税請求区分/現仕税支払区分名称
        sMemFld.Add('ZSeiKbn'           );		    // 消費税請求区分/消費税支払区分
        sMemFld.Add('ZSeiKbnNm'         );		    // 消費税請求区分/消費税支払区分名称
        sMemFld.Add('ZHsuTniKbn'        );		    // 消費税端数単位
        sMemFld.Add('ZHsuTniKbnNm'      );	        // 消費税端数単位名称
        sMemFld.Add('ZHsuKbn'           );		    // 消費税端数区分
        sMemFld.Add('ZHsuKbnNm'         );		    // 消費税端数区分名称
//<008> ↓
        if (uvPrvSysFlg = ucPrvSys_HOUEI) then
        begin
            sMemFld.Add('CountryKbn');		        // 国内外区分
            sMemFld.Add('CountryNm');		        // 国内外区分名
            sMemFld.Add('CurrencyCd');		        // 通貨
            sMemFld.Add('CurrencyNm');		        // 通貨名
        end;
//<008> ↑
//<006>↓
        sMemFld.Add('KKBNCD1'           );
        sMemFld.Add('KKBNNM1'           );
        sMemFld.Add('KKBNCD2'           );
        sMemFld.Add('KKBNNM2'           );
//<006>↑
        sMemFld.Add('TrihikiKbn'        );		    // 取引区分
        sMemFld.Add('TrihikiKbnNm'      );	        // 取引区分名称
        sMemFld.Add('NmKbn'             );	        // 名称変更区分
        sMemFld.Add('NmKbnNm'           );	        // 名称変更区分名称
        sMemFld.Add('TnkRnk'            );	        // 単価ﾗﾝｸ
        sMemFld.Add('KakeRt'            );		    // 単価掛率
        sMemFld.Add('SShCdKbn'          );		    // 指定商品ｺｰﾄﾞ区分
        sMemFld.Add('SShCdKbnNm'        );	        // 指定商品ｺｰﾄﾞ区分名称
        sMemFld.Add('SShCdKet'          );	        // 桁数
        sMemFld.Add('YYKbn'             );	        // 和暦/西暦区分
        sMemFld.Add('YYKbnNm'           );	        // 和暦/西暦区分名称
        sMemFld.Add('DaiNmKbn'          );		    // 代表者名の印字
        sMemFld.Add('DaiNmKbnNm'        );	        // 代表者名
        sMemFld.Add('USDENPFM'          );		    // 納品書/仕入伝票ﾌｫｰﾑ
        sMemFld.Add('USDENPFMNm'        );		    // 納品書/仕入伝票ﾌｫｰﾑ名称
        sMemFld.Add('USGKEI'            );		    // 売上/仕入合計欄税印字
        sMemFld.Add('USGKEINm'          );		    // 売上/仕入合計欄税印字名称

        // 得意先
        if ( uvHani.pvrPattern = 1 ) then
        begin
            sMemFld.Add('JYGKEI'            );	    // 上代合計欄税印字
            sMemFld.Add('JYGKEINm'          );	    // 上代合計欄税印字名称
            sMemFld.Add('MITPFM'            );	    // 見積書ﾌｫｰﾑ
            sMemFld.Add('MITPFMNm'          );	    // 見積書ﾌｫｰﾑ名称
        end;

        sMemFld.Add('JHDENPFM'          );		    // 受注/発注伝票ﾌｫｰﾑ
        sMemFld.Add('JHDENPFMNm'        );		    // 受注/発注伝票ﾌｫｰﾑ名称
        sMemFld.Add('SNDENPFM'          );		    // 出荷/入荷伝票ﾌｫｰﾑ
        sMemFld.Add('SNDENPFMNm'        );		    // 出荷/入荷伝票ﾌｫｰﾑ名称

        // 得意先
        if ( uvHani.pvrPattern = 1 ) then
        begin
            sMemFld.Add('SOFOPFM'           );	    // 送り状ﾌｫｰﾑ
            sMemFld.Add('SOFOPFMNm'         );	    // 送り状ﾌｫｰﾑ名称
        end;

//<KOJ> Ins-s
        // 詳細型(得意先)でかつ建設工事業ﾗｲｾﾝｽが
        // 採用されている場合は工事伝票項目を出力する
        if (( uvHani.pvrPattern = 1 ) and (bKoj)) then
        begin
            sMemFld.Add('KUSDENPFM'         );	    // 工事売上伝票ﾌｫｰﾑ
            sMemFld.Add('KUSDENPFMNm'       );	    // 工事売上伝票ﾌｫｰﾑ名称
            sMemFld.Add('KMITPFM'           );	    // 工事見積書ﾌｫｰﾑ
            sMemFld.Add('KMITPFMNm'         );	    // 工事見積書ﾌｫｰﾑ名称
            sMemFld.Add('KJHDENPFM'         );	    // 工事発注伝票ﾌｫｰﾑ
            sMemFld.Add('KJHDENPFMNm'       );	    // 工事発注伝票ﾌｫｰﾑ名称
            sMemFld.Add('KUSGKEI'           );	    // 工事合計欄税印字
            sMemFld.Add('KUSGKEINm'         );	    // 工事合計欄税印字名称
        end;

        // 詳細型(仕入先)でかつ建設工事業ﾗｲｾﾝｽが
        // 採用されている場合は工事伝票項目を出力する
        if (( uvHani.pvrPattern = 3 ) and (bKoj)) then
        begin
            sMemFld.Add('KUSDENPFM'         );	    // 工事原価伝票ﾌｫｰﾑ
            sMemFld.Add('KUSDENPFMNm'       );	    // 工事原価伝票ﾌｫｰﾑ名称
            sMemFld.Add('KJHDENPFM'         );	    // 工事受注伝票ﾌｫｰﾑ
            sMemFld.Add('KJHDENPFMNm'       );	    // 工事受注伝票ﾌｫｰﾑ名称
            sMemFld.Add('KUSGKEI'           );	    // 工事合計欄税印字
            sMemFld.Add('KUSGKEINm'         );	    // 工事合計欄税印字名称
        end;
//<KOJ> Ins-e

        sMemFld.Add('Memo1'             );		    // ｺﾒﾝﾄ1
        sMemFld.Add('Memo2'             );		    // ｺﾒﾝﾄ2

//<PASS>ins-s
		//DXの場合はパスワード項目を出力
		if TMSeries3.isGalileopt4 then
        begin
        	sMemFld.Add('PassKbn'          );
        	sMemFld.Add('PassKbnNm'        );
        	sMemFld.Add('PassItemKbn1'     );
        	sMemFld.Add('PassItemKbn1Nm'   );
        	sMemFld.Add('PassItemKbn2'     );
        	sMemFld.Add('PassItemKbn2Nm'   );
        end;
//<PASS>ins-e

    end
    // 簡略型<003>
//<2255>    else if ( uvHani.pvrPattern in [0,2] ) then
    else if ( uvHani.pvrPattern in [0,2,4,5] ) then	//<2255>
    begin
		//<2255>↓
		if ( uvHani.pvrPattern in [0,2] ) then
		begin
	    	ds := DataSourceKanryakuJ.DataSet; //簡略型のデータセットを使用します。
		end
		else
		begin
	    	ds := DataSourceKanryakuML.DataSet; //ML型のデータセットを使用します。
		end;
		//<2255>↑

//<2255>	    	ds := DataSourceKanryakuJ.DataSet; //<009>簡略型のデータセットを使用します。

        sTitle.Add('取引先コード'       );
        sTitle.Add('正式名称'           );
        sTitle.Add('敬称'               );
        sTitle.Add('フリガナ'           );
        sTitle.Add('連想'               );
        sTitle.Add('簡略名称'           );
        sTitle.Add('実在／合計区分'     );
        sTitle.Add('実在／合計区分名称' );

        sTitle.Add('郵便番号（基番）'   );
        sTitle.Add('郵便番号（枝番）'   );
        sTitle.Add('住所上段'           );
        sTitle.Add('住所下段'           );

        sTitle.Add('電話番号'           );
        sTitle.Add('ＦＡＸ番号'         );
        sTitle.Add('送付先部署名'       );

//<2255>↓
		if ( uvHani.pvrPattern in [4,5] ) then
		begin
			sTitle.Add('代表者名'           );
		end;
//<2255>↑

//<2255>↓
		if not ( uvHani.pvrPattern in [4,5] ) then
		begin
        	sTitle.Add('担当者名'           );
		end;
//<2255>↑

//<2255>		sTitle.Add('担当者名'           );

        sTitle.Add('担当者コード'       );
        sTitle.Add('担当者名'           );
        sTitle.Add('部門コード'         );
        sTitle.Add('部門名'             );

//<2255>↓
		if not ( uvHani.pvrPattern in [4,5] ) then
		begin
	        sTitle.Add('適用期間（開始）'   );
	        sTitle.Add('適用期間（終了）'   );
		end;
//<2255>↑
//<2255>        sTitle.Add('適用期間（開始）'   );
//<2255>        sTitle.Add('適用期間（終了）'   );

//<2255>↓
		if ( uvHani.pvrPattern in [4,5] ) then
		begin
            sTitle.Add( '請求先ｺｰﾄﾞ' );
            sTitle.Add( '請求先名' );
            sTitle.Add( '請求区分' );

			if uvHani.pvrPattern = 4 then
			begin
            	sTitle.Add( '随時請求回収サイト' );
            	sTitle.Add( '特殊請求Ｎｏ' );
           		sTitle.Add('休日区分名');
            	sTitle.Add( '締日1' );
            	sTitle.Add( 'ｻｲｸﾙ1' );
            	sTitle.Add( '回収日1' );
            	sTitle.Add( '締日2' );
            	sTitle.Add( 'ｻｲｸﾙ2' );
            	sTitle.Add( '回収日2' );
            	sTitle.Add( '締日3' );
            	sTitle.Add( 'ｻｲｸﾙ3' );
            	sTitle.Add( '回収日3' );
			end
			else if uvHani.pvrPattern = 5 then
			begin
            	sTitle.Add( '随時請求支払サイト' );
            	sTitle.Add( '特殊請求Ｎｏ' );
           		sTitle.Add('休日区分名');
            	sTitle.Add( '締日1' );
            	sTitle.Add( 'ｻｲｸﾙ1' );
            	sTitle.Add( '支払日1' );
            	sTitle.Add( '締日2' );
            	sTitle.Add( 'ｻｲｸﾙ2' );
            	sTitle.Add( '支払日2' );
            	sTitle.Add( '締日3' );
            	sTitle.Add( 'ｻｲｸﾙ3' );
            	sTitle.Add( '支払日3' );
			end;


		end;
//<2255>↑

        sMemFld.Add('GCode'             );		    // 取引先ｺｰﾄﾞ
        sMemFld.Add('Nm'                );		    // 正式名称
        sMemFld.Add('KeisyoKbn'         );		    // 敬称
        sMemFld.Add('Fkana'             );		    // ﾌﾘｶﾞﾅ
        sMemFld.Add('Renso'             );		    // 連想
        sMemFld.Add('Nmk'               );		    // 簡略名称
        sMemFld.Add('SumKbn'            );          // 実在／合計区分
        sMemFld.Add('SumKbnNm'          );          // 実在／合計区分名称

        sMemFld.Add('PostNo1'           );		    // 郵便番号（基番）
        sMemFld.Add('PostNo2'           );		    // 郵便番号（枝番）
        sMemFld.Add('Ads1'              );		    // 住所上段
        sMemFld.Add('Ads2'              );		    // 住所下段
        sMemFld.Add('Tel1'              );		    // 電話番号
        sMemFld.Add('FAX'               );		    // ＦＡＸ番号
        sMemFld.Add('SectNm'            );		    // 送付先部署名
//<2255>↓
		if ( uvHani.pvrPattern in [4,5] ) then
		begin
			sMemFld.Add('DHyoNm2'              	);	// 代表者名
		end;
//<2255>↑
//<2255>↓
		if not ( uvHani.pvrPattern in [4,5] ) then
		begin
        	sMemFld.Add('TanNm'             );		// 担当者名
		end;
//<2255>↑
//<2255>        sMemFld.Add('TanNm'             );		    // 担当者名


        sMemFld.Add('TnNCd'             );		    // 担当者ｺｰﾄﾞ
        sMemFld.Add('TnNm'              );		    // 担当者名
        sMemFld.Add('BmNCd'             );		    // 部門ｺｰﾄﾞ
        sMemFld.Add('BmNm'              );		    // 部門名

//<2255>↓
		if not ( uvHani.pvrPattern in [4,5] ) then
		begin
	        sMemFld.Add('TStartDate'        );	    // 適用期間（開始）
	        sMemFld.Add('TEndDate'          );	    // 適用期間（終了）
		end;
//<2255>↑

//<2255>        sMemFld.Add('TStartDate'        );	        // 適用期間（開始）
//<2255>        sMemFld.Add('TEndDate'          );	        // 適用期間（終了）

//<2255>↓

		if ( uvHani.pvrPattern in [4,5] ) then
		begin
            sMemFld.Add( 'SeiGCode' );				// 請求先ｺｰﾄﾞ
            sMemFld.Add( 'SeiNMK' );				// 請求先名
            sMemFld.Add( 'UsKinNM' );				// 請求区分
            sMemFld.Add('RZuiSSite');				// 随時請求回収サイト
            sMemFld.Add( 'RTSEINO' );				// 特殊請求Ｎｏ
            sMemFld.Add( 'RHolidayKbnNM');			// 回収日休日区分名
            sMemFld.Add( 'ENDDD1' );				// 締日1
            sMemFld.Add( 'CYCLE1' );				// ｻｲｸﾙ1
            sMemFld.Add( 'KAISYUDD1' );				// 回収日1
            sMemFld.Add( 'ENDDD2' );				// 締日2
            sMemFld.Add( 'CYCLE2' );				// ｻｲｸﾙ2
            sMemFld.Add( 'KAISYUDD2' );				// 回収日2
            sMemFld.Add( 'ENDDD3' );				// 締日3
            sMemFld.Add( 'CYCLE3' );				// ｻｲｸﾙ3
            sMemFld.Add( 'KAISYUDD3' );				// 回収日3
		end;
//<2255>↑

    end;

try
//<009>    if ( MjsFileOut(DataSourceShosaiJ.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    if ( MjsFileOut(ds, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then //<009>詳細版のデータセットを常に渡していた。切り替えたデータセットを渡します。
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;
except
    on e:exception do
showmessage(e.message);
end;

    sTitle.Free;
    sMemFld.Free;

end;

//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004004L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
// 得意先・仕入先詳細型印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppReportShosaiJBeforePrint(Sender: TObject);
var
//<KOJ> Upd-s
//	bHanbai, bSiire, bMitu, bJuchu, bHachu : Boolean;
// <010> upd -s
//	bHanbai, bSiire, bMitu, bJuchu, bHachu, bKoj : Boolean;
	bHanbai, bSiire, bMitu, bJuchu, bHachu, bSaimu, bSaiken, bKoj : Boolean;
// <010> upd -e
//<KOJ> Upd-e
begin
	PrnSupport.BeforePrint(Sender);

//<008> ↓
    //表示制御(ホウエイ版のときのみ表示)
    phlCOUNTRY.Visible    := (uvPrvSysFlg = ucPrvSys_HOUEI);
    pddCOUNTRY.Visible    := (uvPrvSysFlg = ucPrvSys_HOUEI);
    pddCOUNTRYNM.Visible  := (uvPrvSysFlg = ucPrvSys_HOUEI);
    phlCURRENCY.Visible   := (uvPrvSysFlg = ucPrvSys_HOUEI);
    pddCURRENCY.Visible   := (uvPrvSysFlg = ucPrvSys_HOUEI);
    pddCURRENCYNM.Visible := (uvPrvSysFlg = ucPrvSys_HOUEI);
//<008> ↑

	// 得意先(詳細型)
    if ( uvHani.pvrPattern = 1 ) then
    begin
    	ppLabel12.Caption   :=  '【販売情報－得意先】';
        ppLabel10.Caption   :=  '売上端数区分';
        ppLabel19.Caption   :=  '現売税請求区分';
        ppLabel27.Caption   :=  '消費税請求区分';
        ppLabel32.Caption   :=  '納品書ﾌｫｰﾑ';
        ppLabel34.Caption   :=  '売上合計欄税印字';
        ppLabel35.Visible   :=  TRUE;
        ppLabel24.Visible   :=  TRUE;
        ppLabel25.Caption   :=  '受注伝票ﾌｫｰﾑ';
        ppLabel40.Caption   :=  '出荷伝票ﾌｫｰﾑ';
        ppLabel42.Visible   :=  TRUE;
//<004>
		ppLabel44.Caption	:=	'得意先区分';

//<KOJ> Ins-s
        // 工事伝票項目
        ppLabel43.Caption   :=   '工事売上伝票ﾌｫｰﾑ';
        ppLabel45.Visible   :=   TRUE;                 // ﾀｲﾄﾙ-工事見積書ﾌｫｰﾑ
        ppLabel46.Caption   :=   '工事受注伝票ﾌｫｰﾑ';
//<KOJ> Ins-e
    end
    // 仕入先(詳細型)
    else if ( uvHani.pvrPattern = 3 ) then
    begin
    	ppLabel12.Caption   :=  '【販売情報－仕入先】';
        ppLabel10.Caption   :=  '仕入端数区分';
        ppLabel19.Caption   :=  '現仕税支払区分';
        ppLabel27.Caption   :=  '消費税支払区分';
        ppLabel32.Caption   :=  '仕入伝票ﾌｫｰﾑ';
        ppLabel34.Caption   :=  '仕入合計欄税印字';
        ppLabel35.Visible   :=  FALSE;
        ppLabel24.Visible   :=  FALSE;
        ppLabel25.Caption   :=  '発注伝票ﾌｫｰﾑ';
        ppLabel40.Caption   :=  '入荷伝票ﾌｫｰﾑ';
        ppLabel42.Visible   :=  FALSE;
//<004>
		ppLabel44.Caption	:=	'仕入先区分';

//<KOJ> Ins-s
        // 工事伝票項目
        ppLabel43.Caption   :=   '工事原価伝票ﾌｫｰﾑ';
        ppLabel45.Visible   :=   False;                // ﾀｲﾄﾙ-工事見積書ﾌｫｰﾑ
        ppLabel46.Caption   :=   '工事発注伝票ﾌｫｰﾑ';
//<KOJ> Ins-e
    end;

	// 得意先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
        DBTxt_s_GCode.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else
        DBTxt_s_GCode.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	// 部門ｺｰﾄﾞ属性
	if ( uvSelSys.GetBmCdZs = 2 ) then
        DBTxt_s_BmNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else
        DBTxt_s_BmNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	// 担当者ｺｰﾄﾞ属性
	if ( uvSelSys.GetTnCdZs = 2 ) then
        DBTxt_s_TnNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else
        DBTxt_s_TnNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)

//<006>
	if uvKBN1UseKbn = 1 then
		ppLabelKK1.Caption	:=	uvKBN1HojyoNm
	else
		ppLabelKK1.Visible := False;

	if uvKBN1Attr = 2 then
    	    DBTxt_s_KKBNCD1.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_s_KKBNCD1.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	if uvKBN2UseKbn = 1 then
		ppLabelKK2.Caption	:=	uvKBN2HojyoNm
	else
		ppLabelKK2.Visible := False;

	if uvKBN2Attr = 2 then
    	    DBTxt_s_KKBNCD2.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_s_KKBNCD2.Alignment :=  taRightJustify; // 右寄せ(数値属性)

//<005>↓
	bHanbai	:= CheckModuleLicense(m_pRec,FXLicense.SEL_HAN);
	bSiire	:= CheckModuleLicense(m_pRec,FXLicense.SEL_SHI);
	bMitu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_MIT);
	bJuchu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_TYU);
	bHachu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_HAT);
// <010> ins -s
	bSaimu	:= CheckModuleLicense(m_pRec,FXLicense.MAS_SMU);
	bSaiken	:= CheckModuleLicense(m_pRec,FXLicense.MAS_SKN);
// <010> ins -e

//<KOJ> Ins-s
    // 建設工事業ﾗｲｾﾝｽ採用ﾁｪｯｸ
	bKoj    := fnKojUse;
//<KOJ> Ins-e

// <010> del -s ライセンス条件なしにする。
{
//<KOJ> Upd-s
//	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai))  or
//		(( uvHani.pvrPattern = 3 ) and (not bSiire ))  then
    // 印刷ﾊﾟﾀｰﾝが詳細型のとき販売管理･仕入管理･工事ﾗｲｾﾝｽが全て採用されていない場合
    // 「単価ﾗﾝｸ」等の項目を非表示にする
	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai) and (not bKoj)) or
		(( uvHani.pvrPattern = 3 ) and (not bSiire ) and (not bKoj)) then
//<KOJ> Upd-e
	begin
		ppLabel31.Visible		:= False;   // ﾀｲﾄﾙ-単価ﾗﾝｸ
		ppLabel36.Visible		:= False;   // ﾀｲﾄﾙ-単価掛率
		ppLabel37.Visible		:= False;   // ﾀｲﾄﾙ-指定商品ｺｰﾄﾞ
		ppLabel30.Visible		:= False;   // ﾀｲﾄﾙ-桁数
}
// <010> del -e

//<KOJ> Del-s
{       // ↓販売管理または仕入管理の採用有無のみで判定を行う項目の為移動しました。
		ppLabel35.Visible		:= False;   // ﾀｲﾄﾙ-上代合計欄税印字
		ppLabel24.Visible		:= False;   // ﾀｲﾄﾙ-見積書ﾌｫｰﾑ
		ppLabel25.Visible		:= False;   // ﾀｲﾄﾙ-受注伝票ﾌｫｰﾑ/発注伝票ﾌｫｰﾑ
		ppLabel40.Visible		:= False;   // ﾀｲﾄﾙ-出荷伝票ﾌｫｰﾑ/入荷伝票ﾌｫｰﾑ
		ppLabel42.Visible		:= False;   // ﾀｲﾄﾙ-送り状ﾌｫｰﾑ
}
//<KOJ> Del-e
//<010>	end;

//<KOJ> Ins-s
        // 販売管理または仕入管理が採用されていない場合は非表示にする
        if ((uvHani.pvrPattern = 1) and (not bHanbai)) or
           ((uvHani.pvrPattern = 3) and (not bSiire))  then
        begin
//<010>            ppLabel35.Visible	:= False;   // ﾀｲﾄﾙ-上代合計欄税印字
            ppLabel24.Visible	:= False;   // ﾀｲﾄﾙ-見積書ﾌｫｰﾑ
            ppLabel25.Visible	:= False;   // ﾀｲﾄﾙ-受注伝票ﾌｫｰﾑ/発注伝票ﾌｫｰﾑ
            ppLabel40.Visible	:= False;   // ﾀｲﾄﾙ-出荷伝票ﾌｫｰﾑ/入荷伝票ﾌｫｰﾑ
//<010>            ppLabel42.Visible	:= False;   // ﾀｲﾄﾙ-送り状ﾌｫｰﾑ
        end;
//<KOJ> Ins-e

// <010> ins -s
    // 販売管理または仕入管理が採用されていない、債権管理または債務管理が採用されていない場合は非表示にする
    if ((uvHani.pvrPattern = 1) and (not bHanbai) and (not bSaiken)) or
       ((uvHani.pvrPattern = 3) and (not bSiire) and (not bSaimu))  then
    begin
    	ppLabel35.Visible	:= False;   // ﾀｲﾄﾙ-上代合計欄税印字
        ppLabel42.Visible	:= False;   // ﾀｲﾄﾙ-送り状ﾌｫｰﾑ
    end;
// <010> ins -e

    // 印刷ﾊﾟﾀｰﾝ詳細型(得意先)
	if uvHani.pvrPattern = 1 then
	begin
		if not bMitu then
			ppLabel24.Visible	:= False;
		if not bJuchu then
			ppLabel25.Visible	:= False;
	end;

    // 印刷ﾊﾟﾀｰﾝ詳細型(仕入先)
	if uvHani.pvrPattern = 3 then
	begin
		if not bHachu then
			ppLabel25.Visible	:= False;
	end;
//<005>↑

//<KOJ> Ins-s
    // 建設工事業が採用されていない場合は工事伝票項目を非表示にする
    if (not bKoj) then
    begin
        ppLabel43.Visible := False;     // ﾀｲﾄﾙ-工事売上伝票ﾌｫｰﾑ/工事原価ﾌｫｰﾑ
        ppLabel45.Visible := False;     // ﾀｲﾄﾙ-工事見積書ﾌｫｰﾑ
        ppLabel46.Visible := False;     // ﾀｲﾄﾙ-工事受注伝票ﾌｫｰﾑ/工事発注ﾌｫｰﾑ
        ppLabel65.Visible := False;     // ﾀｲﾄﾙ-工事合計欄税印字
    end;

    // 建設工事業のみが採用されている場合は納品書ﾌｫｰﾑ･売上合計欄税印字を非表示にする
// <010> upd -s
//    if ((uvHani.pvrPattern = 1) and (not bHanbai) and (not bMitu)  and (not bJuchu) and (bKoj)) or
//       ((uvHani.pvrPattern = 3) and (not bSiire) and (not bHachu) and (bKoj))                  then
    if ((uvHani.pvrPattern = 1) and (not bHanbai) and (not bMitu) and (not bJuchu) and (not bSaiken) and (bKoj)) or
       ((uvHani.pvrPattern = 3) and (not bSiire) and (not bHachu) and (not bSaimu) and (bKoj))                   then
// <010> upd -e
    begin
        ppLabel32.Visible := False;     // ﾀｲﾄﾙ-納品書ﾌｫｰﾑ/仕入伝票ﾌｫｰﾑ
        ppLabel34.Visible := False;     // ﾀｲﾄﾙ-売上合計欄税印字/仕入合計欄税印字
    end;
//<KOJ> Ins-e

//<PASS>ins-s
	//パスワード項目はDXのみ表示
	if not(TMSeries3.isGalileopt4) then
    begin
		ppLabelPassKbn.Visible := False;  //パスワード設定
		ppLabelPassItemKbn1.Visible := False;  //パスワード合成項目1
		ppLabelPassItemKbn2.Visible := False;  //パスワード合成項目2

        ppLabel13.Top     := 0.9063; //パスワード項目が消えるため、更新日時を上に詰める
    end;
//<PASS>ins-e

end;


//------------------------------------------------------------------------------
// 得意先・仕入先簡略型印刷前処理   <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppReportKanryakuJBeforePrint(Sender: TObject);
begin
	PrnSupport.BeforePrint(Sender);

	// 得意先(簡略型)
    if      ( uvHani.pvrPattern = 0 ) then
	begin
    	ppLabel48.Caption   :=  '【販売情報－得意先】';
//<004>
			ppLabel59.Caption	:=	'受注担当者';
	end
    // 仕入先(簡略型)
    else if ( uvHani.pvrPattern = 2 ) then
	begin
    	ppLabel48.Caption   :=  '【販売情報－仕入先】';
//<004>
		ppLabel59.Caption	:=	'発注担当者';
	end;

    // 得意先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
            DBTxt_k_GCode.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_k_GCode.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	// 部門ｺｰﾄﾞ属性
	if ( uvSelSys.GetBmCdZs = 2 ) then
    	    DBTxt_k_BmNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_k_BmNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	// 担当者ｺｰﾄﾞ属性
	if ( uvSelSys.GetTnCdZs = 2 ) then
    	    DBTxt_k_TnNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_k_TnNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)

end;
//<2255>↓
//------------------------------------------------------------------------------
// 得意先ML型印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppReportkanryakuMLBeforePrint(Sender: TObject);
begin
	PrnSupport.BeforePrint(Sender);
	if      ( uvHani.pvrPattern = 4 ) then
	begin
		ppLabel89.Caption   := '随時請求回収ｻｲﾄ';
		ppLabel98.Caption   := '回収日1';
		ppLabel99.Caption   := '回収日2';
		ppLabel100.Caption  := '回収日3';
	end
	else if ( uvHani.pvrPattern = 5 ) then
	begin
		ppLabel89.Caption := '随時請求支払ｻｲﾄ';
		ppLabel98.Caption   := '支払日1';
		ppLabel99.Caption   := '支払日2';
		ppLabel100.Caption  := '支払日3';
	end;

	// 得意先(ML型)
    if      ( uvHani.pvrPattern = 4 ) then
	begin
    	ppLhanbaizyouhou.Caption	:=  '【販売情報－得意先】';
		ppLtantou.Caption			:=	'受注担当者';
	end
    // 仕入先(ML型)
    else if ( uvHani.pvrPattern = 5 ) then
	begin                                                                       
    	ppLhanbaizyouhou.Caption	:=  '【販売情報－仕入先】';
		ppLtantou.Caption			:=	'発注担当者';
	end;
    // 得意先ｺｰﾄﾞ属性
	if ( uvSelSys.GetTkCdZs = 2 ) then
	begin
        DBTxt_ML_GCode.Alignment 	:=  taLeftJustify;   // 左寄せ(文字属性)
		DBTxt_ML_SeiGcode.Alignment :=  taLeftJustify;	  // 請求先コード
	end
    else
	begin
		DBTxt_ML_GCode.Alignment 	:=  taRightJustify; // 右寄せ(数値属性)
		DBTxt_ML_SeiGcode.Alignment :=  taRightJustify; // 請求先コード
	end;
	// 部門ｺｰﾄﾞ属性
	if ( uvSelSys.GetBmCdZs = 2 ) then
   			DBTxt_ML_BmNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_ML_BmNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)

	// 担当者ｺｰﾄﾞ属性
	if ( uvSelSys.GetTnCdZs = 2 ) then
    	    DBTxt_ML_TnNCd.Alignment :=  taLeftJustify   // 左寄せ(文字属性)
    else    DBTxt_ML_TnNCd.Alignment :=  taRightJustify; // 右寄せ(数値属性)


end;
//<2255>↑


//------------------------------------------------------------------------------
// 得意先・仕入先詳細型ディテイルバンド印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);
var
//<KOJ> Upd-s
//	bHanbai, bSiire, bMitu, bJuchu, bHachu : Boolean;
// <010> upd -s
//	bHanbai, bSiire, bMitu, bJuchu, bHachu, bKoj : Boolean;
	bHanbai, bSiire, bMitu, bJuchu, bHachu, bSaimu, bSaiken, bKoj : Boolean;
// <010> upd -e
//<KOJ> Upd-e
begin
	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_StandardGen.LastRecord            ) or
       ( ppDetailBand_StandardGen.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_StandardGen.OverFlow = FALSE ) then
            ppDetailBand_StandardGen.OverFlow   :=  TRUE;

		if ( ppStandardGenUnderLine.ReprintOnOverFlow = FALSE ) then
			ppStandardGenUnderLine.ReprintOnOverFlow    :=  TRUE;

        // ﾗｲﾝの太さを太くしている
		ppStandardGenUnderLine.Weight   :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppStandardGenUnderLine.Weight   :=	0.25;
	end;

    // 郵便番号の「－」
    if ( not DataSourceShosaiJ.DataSet.FieldByName('PostNo1').IsNull      ) and
       ( DataSourceShosaiJ.DataSet.FieldByName('PostNo1').AsString <> '0' ) then
    		ppRep_s_PostNo.Visible  :=  TRUE
    else    ppRep_s_PostNo.Visible  :=  FALSE;

    // 単価掛率の「％」
    if ( not DataSourceShosaiJ.DataSet.FieldByName('KakeRt').IsNull   ) and
       ( DataSourceShosaiJ.DataSet.FieldByName('KakeRt').AsFloat <> 0 ) then
		    ppRep_s_KakeRt.Visible  :=  TRUE
    else    ppRep_s_KakeRt.Visible  :=  FALSE;

    // 桁数の「桁」
    if ( not DataSourceShosaiJ.DataSet.FieldByName('SShCdKet').IsNull   ) and
       ( DataSourceShosaiJ.DataSet.FieldByName('SShCdKet').AsFloat <> 0 ) then
		    ppRep_s_SShCdKet.Visible := TRUE
    else    ppRep_s_SShCdKet.Visible := FALSE;

//<005>↓
	bHanbai	:= CheckModuleLicense(m_pRec,FXLicense.SEL_HAN);
	bSiire	:= CheckModuleLicense(m_pRec,FXLicense.SEL_SHI);
	bMitu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_MIT);
	bJuchu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_TYU);
	bHachu	:= CheckModuleLicense(m_pRec,FXLicense.SEL_HAT);
//<KOJ> Ins-s
// <010> ins -s
	bSaimu	:= CheckModuleLicense(m_pRec,FXLicense.MAS_SMU);
	bSaiken	:= CheckModuleLicense(m_pRec,FXLicense.MAS_SKN);
// <010> ins -e
    // 建設工事業ﾗｲｾﾝｽ採用ﾁｪｯｸ
    bKoj    := fnKojUse;
//<KOJ> Ins-e

// <010> del -s ライセンス条件なしにする。
{
//<KOJ> Upd-s
//	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai))  or
//		(( uvHani.pvrPattern = 3 ) and (not bSiire ))  then
    // 印刷ﾊﾟﾀｰﾝが詳細型の時、販売管理･仕入管理･工事ﾗｲｾﾝｽが全て採用されていない場合
    // 「単価ﾗﾝｸ」等の項目を非表示にする
	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai) and (not bKoj))  or
		(( uvHani.pvrPattern = 3 ) and (not bSiire ) and (not bKoj))  then
//<KOJ> Upd-e
	begin
		DBTxt_s_TnkRnk.Visible		:= False;   // 単価ﾗﾝｸ
		DBTxt_s_KakeRt.Visible		:= False;   // 単価掛率
		ppRep_s_KakeRt.Visible		:= False;   // 「%」
		DBTxt_s_SShCdKbn.Visible	:= False;   // 指定商品ｺｰﾄﾞ
		DBTxt_s_SShCdKbnNm.Visible	:= False;   // 指定商品ｺｰﾄﾞ名称
		DBTxt_s_SShCdKet.Visible	:= False;   // 指定商品ｺｰﾄﾞ桁数
		ppRep_s_SShCdKet.Visible	:= False;   // 「桁」
}
// <010> del -e

//<KOJ> Del-s
{       // ↓販売管理または仕入管理の採用有無のみで判定を行う項目の為移動しました。
		DBTxt_s_JYGKEI.Visible		:= False;
		DBTxt_s_JYGKEINm.Visible	:= False;
		DBTxt_s_MITPFM.Visible		:= False;
		DBTxt_s_MITPFMNm.Visible	:= False;
		DBTxt_s_JHDENPFM.Visible	:= False;
		DBTxt_s_JHDENPFMNm.Visible	:= False;
		DBTxt_s_SNDENPFM.Visible	:= False;
		DBTxt_s_SNDENPFMNm.Visible	:= False;
		DBTxt_s_SOFOPFM.Visible		:= False;
		DBTxt_s_SOFOPFMNm.Visible	:= False;
}
//<KOJ> Del-e
//<010>	end;

//<KOJ> Ins-s
        // 販売管理または仕入管理が採用されていない場合は非表示にする
	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai))  or
		(( uvHani.pvrPattern = 3 ) and (not bSiire ))  then
    begin
//<010>		DBTxt_s_JYGKEI.Visible		:= False;   // 上代合計欄税印字
//<010>		DBTxt_s_JYGKEINm.Visible	:= False;   // 上代合計欄税印字名称
		DBTxt_s_MITPFM.Visible		:= False;   // 見積書ﾌｫｰﾑ
		DBTxt_s_MITPFMNm.Visible	:= False;   // 見積書ﾌｫｰﾑ名称
		DBTxt_s_JHDENPFM.Visible	:= False;   // 受注伝票ﾌｫｰﾑ/発注伝票ﾌｫｰﾑ
		DBTxt_s_JHDENPFMNm.Visible	:= False;   // 受注伝票ﾌｫｰﾑ名称/発注伝票ﾌｫｰﾑ名称
		DBTxt_s_SNDENPFM.Visible	:= False;   // 出荷伝票ﾌｫｰﾑ/入荷伝票ﾌｫｰﾑ
		DBTxt_s_SNDENPFMNm.Visible	:= False;   // 出荷伝票ﾌｫｰﾑ名称/入荷伝票ﾌｫｰﾑ名称
//<010>		DBTxt_s_SOFOPFM.Visible		:= False;   // 送り状ﾌｫｰﾑ
//<010>		DBTxt_s_SOFOPFMNm.Visible	:= False;   // 送り状ﾌｫｰﾑ名称
    end;
//<KOJ> Ins-e

// <010> ins -s
        // 販売管理または仕入管理が採用されていない、債権管理または債務管理が採用されていない場合は非表示にする
	if	(( uvHani.pvrPattern = 1 ) and (not bHanbai) and (not bSaiken))	or
		(( uvHani.pvrPattern = 3 ) and (not bSiire ) and (not bSaimu))  then
    begin
		DBTxt_s_JYGKEI.Visible		:= False;   // 上代合計欄税印字
		DBTxt_s_JYGKEINm.Visible	:= False;   // 上代合計欄税印字名称
		DBTxt_s_SOFOPFM.Visible		:= False;   // 送り状ﾌｫｰﾑ
		DBTxt_s_SOFOPFMNm.Visible	:= False;   // 送り状ﾌｫｰﾑ名称
	end;
// <010> ins -e

    // 印刷ﾊﾟﾀｰﾝ詳細型(得意先)
	if uvHani.pvrPattern = 1 then
	begin
		if not bMitu then
		begin
			DBTxt_s_MITPFM.Visible		:= False;
			DBTxt_s_MITPFMNm.Visible	:= False;
		end;

		if not bJuchu then
		begin
			DBTxt_s_JHDENPFM.Visible	:= False;
			DBTxt_s_JHDENPFMNm.Visible	:= False;
		end;
	end;

    // 印刷ﾊﾟﾀｰﾝ詳細型(仕入先)
	if uvHani.pvrPattern = 3 then
	begin
		if not bHachu then
		begin
			DBTxt_s_JHDENPFM.Visible	:= False;
			DBTxt_s_JHDENPFMNm.Visible	:= False;
		end;
	end;
//<005>↑

//<KOJ> Ins-s
    // 建設工事業が採用されていない場合は工事伝票項目を非表示にする
    if (not bKoj) then
    begin
        DBTxt_s_KUSDENPFM.Visible   := False;   // 工事売上伝票ﾌｫｰﾑ/工事原価伝票ﾌｫｰﾑ
        DBTxt_s_KUSDENPFMNm.Visible := False;   // 工事売上伝票ﾌｫｰﾑ名称/工事原価伝票ﾌｫｰﾑ名称
        DBTxt_s_KMITPFM.Visible     := False;   // 工事見積書ﾌｫｰﾑ
        DBTxt_s_KMITPFMNm.Visible   := False;   // 工事見積書ﾌｫｰﾑ名称
        DBTxt_s_KJHDENPFM.Visible   := False;   // 工事受注伝票ﾌｫｰﾑ/工事発注伝票ﾌｫｰﾑ
        DBTxt_s_KJHDENPFMNm.Visible := False;   // 工事受注伝票ﾌｫｰﾑ名称/工事発注伝票ﾌｫｰﾑ名称
        DBTxt_s_KUSGKEI.Visible     := False;   // 工事合計欄税印字
        DBTxt_s_KUSGKEINm.Visible   := False;   // 工事合計欄税印字名称

    end;

    // 建設工事業のみが採用されている場合は納品書ﾌｫｰﾑ･売上合計欄税印字を非表示にする
// <010> upd -s
//    if ((uvHani.pvrPattern = 1) and (not bHanbai) and (not bMitu)  and (not bJuchu) and (bKoj)) or
//       ((uvHani.pvrPattern = 3) and (not bSiire) and (not bHachu) and (bKoj))                  then
    if ((uvHani.pvrPattern = 1) and (not bHanbai) and (not bMitu) and (not bJuchu) and (not bSaiken) and (bKoj)) or
       ((uvHani.pvrPattern = 3) and (not bSiire) and (not bHachu) and (not bSaiken) and (bKoj))                  then
// <010> upd -e
    begin
        DBTxt_s_USDENPFM.Visible    := False;   // 納品書ﾌｫｰﾑ/仕入伝票ﾌｫｰﾑ
        DBTxt_s_USDENPFMNm.Visible  := False;   // 納品書ﾌｫｰﾑ名称/仕入伝票ﾌｫｰﾑ名称
        DBTxt_s_USGKEI.Visible      := False;   // 売上合計欄税印字
        DBTxt_s_USGKEINm.Visible    := False;   // 売上合計欄税印字名称
    end;
//<KOJ> Ins-e

//<PASS>ins-s
    //パスワード項目はDXのみ
	if not(TMSeries3.IsGalileopt4) then
    begin
		DBTxt_s_PassKbn.Visible		   := False;  //パスワード設定
		DBTxt_s_PassKbnNm.Visible	   := False;  //パスワード設定名称
        DBTxt_s_PassItemKbn1.Visible   := False;  //パスワード合成項目1
        DBTxt_s_PassItemKbn1Nm.Visible := False;  //パスワード合成項目1名称
        DBTxt_s_PassItemKbn2.Visible   := False;  //パスワード合成項目2
        DBTxt_s_PassItemKbn2Nm.Visible := False;  //パスワード合成項目2名称

		DBTxt_s_UpdDateTM.Top		 := 0.3333; //パスワード項目が消えるため、更新日時を上に詰める
    end;
//<PASS>ins-e

end;


procedure TDmJNTCRP004004L.ppLabelPassItemKbn2DrawCommandClick(Sender,
  aDrawCommand: TObject);
begin

end;

//------------------------------------------------------------------------------
// 得意先・仕入先簡略型ディテイルバンド印刷前処理   <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppDetailBand_StandardGen2BeforeGenerate(Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_StandardGen2.LastRecord            ) or
       ( ppDetailBand_StandardGen2.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_StandardGen2.OverFlow = FALSE ) then
			ppDetailBand_StandardGen2.OverFlow  :=  TRUE;

		if ( ppStandardGenUnderLine2.ReprintOnOverFlow = FALSE ) then
			ppStandardGenUnderLine2.ReprintOnOverFlow   :=	TRUE;

        // ﾗｲﾝの太さを太くしている
		ppStandardGenUnderLine2.Weight	    :=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppStandardGenUnderLine2.Weight     :=	0.25;
	end;

    // 郵便番号の「－」
    if ( not DataSourceKanryakuJ.DataSet.FieldByName ('PostNo1').IsNull      ) and
       ( DataSourceKanryakuJ.DataSet.FieldByName ('PostNo1').AsString <> '0' ) then
		    ppRep_k_PostNo.Visible  :=  TRUE
    else    ppRep_k_PostNo.Visible  :=  FALSE;

end;
//<2255>↓
//------------------------------------------------------------------------------
// 得意先・仕入先簡略型ディテイルバンド印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.ppDetailBand_StandardGen3BeforeGenerate(Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand_StandardGen3.LastRecord            ) or
       ( ppDetailBand_StandardGen3.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_StandardGen3.OverFlow = FALSE ) then
			ppDetailBand_StandardGen3.OverFlow  :=  TRUE;

		if ( ppStandardGenUnderLine3.ReprintOnOverFlow = FALSE ) then
			ppStandardGenUnderLine3.ReprintOnOverFlow   :=	TRUE;

        // ﾗｲﾝの太さを太くしている
		ppStandardGenUnderLine3.Weight	    :=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppStandardGenUnderLine3.Weight     :=	0.25;
	end;

    // 郵便番号の「－」
    if ( not DataSourceKanryakuML.DataSet.FieldByName ('PostNo1').IsNull      ) and
       ( DataSourceKanryakuML.DataSet.FieldByName ('PostNo1').AsString <> '0' ) then
		    ppRep_ML_PostNo.Visible  :=  TRUE
    else    ppRep_ML_PostNo.Visible  :=  FALSE;

end;
//<2255>↑
//<006>↓
//------------------------------------------------------------------------------
//拡張分類の情報取得
//------------------------------------------------------------------------------
procedure TDmJNTCRP004004L.fnGetKakuchoInfo;
var
	qry		:	TMQuery;
begin

    qry := TMQuery.Create(Application);
    m_pMDataModule.SetDBInfoToQuery( uvDatabase, qry );

	try
		with qry do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT         	'
				+	'	 UseKbn			'
				+	'	,JHojyoName		'
				+	'	,CodeDigit		'
				+	'	,CodeAttr		'
			    +   'FROM MasterInfo	'
				+	'WHERE MasterKbn = :MasterKbn');

			// 拡張分類１
//<2255>		    if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
				SetFld('MasterKbn').AsInteger := 811
			else
				SetFld('MasterKbn').AsInteger := 821;
			Open;

			uvKBN1UseKbn	:= GetFld('UseKbn').AsInteger;
			uvKBN1HojyoNm	:= GetFld('JHojyoName').AsString;
			uvKBN1Digit		:= GetFld('CodeDigit').AsInteger;
			uvKBN1Attr		:= GetFld('CodeAttr').AsInteger;

			// 拡張分類２
			Close;
//<2255>		    if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
				SetFld('MasterKbn').AsInteger := 812
			else
				SetFld('MasterKbn').AsInteger := 822;
			Open;

			uvKBN2UseKbn	:= GetFld('UseKbn').AsInteger;
			uvKBN2HojyoNm	:= GetFld('JHojyoName').AsString;
			uvKBN2Digit		:= GetFld('CodeDigit').AsInteger;
			uvKBN2Attr		:= GetFld('CodeAttr').AsInteger;

			Close;
		end;
	finally
		qry.Close;
		qry.Free;
	end;

end;
//<006>↑

//<KOJ> Ins-s
// *********************************************************************
//	Proccess	:	建設工事業採用チェック
//	Name		:	倉持 剛
//	Date		:	2009/03/16
//	Parameter	:   なし
//	Return		:	True:採用、False：未採用
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TDmJNTCRP004004L.fnKojUse() : Boolean;
var
    Query       : TMQuery;
begin
    Result := False;

    // 工事ライセンスチェック
    if CheckModuleLicense(m_pRec, 850000) = False then
        Exit;

    // 工事採用区分チェック
	Query := TMQuery.Create( Self );
	with Query do
	begin
    	try
//<D10>     DatabaseName  := uvDatabase.DatabaseName;
//<D10>     SessionName   := uvDatabase.SessionName;
			m_pMDataModule.SetDBInfoToQuery(uvDatabase, Query);		//<D10>

			Close;
			SQL.Clear;
			SQL.Add('Select count(*) Cnt');
			SQL.Add('From MasterInfo ');
            SQL.Add('Where (MasterKbn Between 201 and 299) and (UseKbn = 1) and (KojUseKbn Between 1 and 3)');

			Open;

			Result := (FieldByName('Cnt').AsInteger >= 1);
		finally
			Close;
		end;
	end;
end;
//<KOJ> Ins-e




end.

