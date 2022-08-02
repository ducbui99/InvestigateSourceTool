//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：固定摘要(印刷処理)
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
//  <ﾏｰｸ> <修正者>   　	<修正日>	<修正内容>
//  <001> 青木(PRTIME) 	2006.01.12	科目連想登録ﾘｽﾄ(科目ｺｰﾄﾞ順)追加
//  <002> 青木(PRTIME) 	2006.01.12	科目連想登録ﾘｽﾄ(摘要ｺｰﾄﾞ順)追加
//	<003> Tak.Kobayashi	2006/09/25	帳票種類の修正
//	<004> 加藤(PRIME)	2006/12/22	仕訳辞書摘要登録ﾘｽﾄ追加
//  <005> 加藤(PRIME)	2007/01/10  固定摘要一覧表・固定摘要体系登録ﾘｽﾄ・固定摘要分類登録ﾘｽﾄ追加
//	<006> 斎藤			2008/05/22	JSOX印刷履歴対応
//  <007> 黒田 祐生     2010/10/04  仕訳辞書摘要登録ﾘｽﾄのカラムがずれて出力されている不具合修正
//  <008> 大田原(MSI)   2010/11/02  「部署伝票の辞書として使用する」のチェックの有無が分かるように、印刷およびファイル出力に部署伝票辞書の項目を追加
//  <009> 小川(LEAD)    2012/01/24  固定摘要体系登録リストのファイル出力は加算先のコードと名称は行毎に出力する対応。
//	<MLXDEP> 岩田(NTC)	2013/01/15	MLX固定資産・リース対応
//	<MLXDEP2>岩田(NTC)	2013/05/07	MLX固定資産・リース印刷レイアウト変更
//=============================================================================
unit JNTCRP020000Lu;

interface

uses

  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  SeriesCheckU,//<MLXDEP>
  JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  ppDesignLayer, ppParameter;

const
// <005> MOD start
(*
    //<001><002><003>
    C_TOUROKU   = 0;
    C_KMKRENSO  = 1;
    C_TEKIRENSO = 2;
    //<001><002><003>
    C_SWDICTEKI = 3;			   			// 仕訳辞書摘要登録ﾘｽﾄ <004> ADD
    C_ICHIRAN   = 4;    					// 固定摘要一覧表 	   <005> ADD
    C_TAIKEI    = 5;						// 固定摘要体系登録ﾘｽﾄ <005> ADD
    C_BUNRUI    = 6;    					// 固定摘要分類登録ﾘｽﾄ <005> ADD
*)
    C_TOUROKU   = 0; 	// 固定摘要登録ﾘｽﾄ
    C_SWDICTEKI = 1;	// 仕訳辞書摘要登録ﾘｽﾄ
    C_BUNRUI    = 2;	// 固定摘要分類登録ﾘｽﾄ
    C_TAIKEI    = 3;	// 固定摘要体系登録ﾘｽﾄ
    C_KMKRENSO  = 4;	// 科目連想ﾘｽﾄ(科目順)
    C_TEKIRENSO = 5;	// 科目連想ﾘｽﾄ(摘要順)
    C_ICHIRAN   = 6;	// 固定摘要一覧表
// <005> MOD end

	// 採用情報配列のindex
	IDX_KAMOKU				= 0;			// 科目
	IDX_BUMON				= 1;			// 部門
    IDX_PRJ1				= 2;			// ﾌﾟﾛｼﾞｪｸﾄ1
    IDX_PRJSUB1				= 3;			// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1
    IDX_PRJ2				= 4;
    IDX_PRJSUB2				= 5;
    IDX_PRJ3				= 6;
    IDX_PRJSUB3				= 7;
    IDX_PRJ4				= 8;
    IDX_PRJSUB4				= 9;
    IDX_PRJ5				= 10;
    IDX_PRJSUB5				= 11;
    IDX_PRJ6				= 12;
    IDX_PRJSUB6				= 13;
    IDX_PRJ7				= 14;
    IDX_PRJSUB7				= 15;
    IDX_PRJ8				= 16;
    IDX_PRJSUB8				= 17;
    IDX_PRJ9				= 18;
    IDX_PRJSUB9				= 19;
    IDX_PRJ10				= 20;			// ﾌﾟﾛｼﾞｪｸﾄ10
    IDX_PRJSUB10			= 21;			// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ10
    IDX_KMKHOJ				= 22;			// 科目別補助
    IDX_BANK				= 23;			// 銀行
    IDX_TORIHIKI			= 24;			// 取引先
    IDX_SYAIN				= 25;			// 社員
    IDX_HANYOU1				= 26;			// 汎用補助1
    IDX_HANYOU2				= 27;
    IDX_HANYOU3				= 28;
    IDX_HANYOU4				= 29;
    IDX_HANYOU5				= 30;			// 汎用補助5
    IDX_SEG1				= 31;			// ｾｸﾞﾒﾝﾄ1
    IDX_SEG2				= 32;
    IDX_SEG3				= 33;
    IDX_SEG4				= 34;
    IDX_SEG5				= 35;
    IDX_SEG6				= 36;
    IDX_SEG7				= 37;
    IDX_SEG8				= 38;
    IDX_SEG9				= 39;
    IDX_SEG10				= 40;

type
	TAryMaster = array[0..40] of String;	// <004> ADD

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP020000L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    RReport1: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLine102: TppLine;
    ppLine104: TppLine;
    ppLine106: TppLine;
    ppLine114: TppLine;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine119: TppLine;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    SVppDate0: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    PDetailBandM: TppDetailBand;
    PFuterLine: TppLine;
    ppDBImage1: TppDBImage;
    ppLine122: TppLine;
    ppDBText77: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText82: TppDBText;
    ppDBText85: TppDBText;
    ppLine94: TppLine;
    ppLine95: TppLine;
    ppLine98: TppLine;
    ppLine101: TppLine;
    ppLine103: TppLine;
    ppLine105: TppLine;
    ppLine107: TppLine;
    ppLine117: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine121: TppLine;
    ppLine124: TppLine;
    ppFooterBand8: TppFooterBand;
    SVppPage0: TppSystemVariable;
    AccOffice0: TppLabel;
    RepRensoTekiCd: TppReport;
    ppHeaderBand3: TppHeaderBand;
    LCorpCode6: TppLabel;
    LCorpName6: TppLabel;
    SVppDate6: TppSystemVariable;
    pTitleName: TppLabel;
    pTitleLine: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel31: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine32: TppLine;
    ppLine42: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine91: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    SDetailBand: TppDetailBand;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine92: TppLine;
    FLine: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText18: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand3: TppFooterBand;
    SVppPage6: TppSystemVariable;
    RepRensoKmkCd: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel119: TppLabel;
    ppLine174: TppLine;
    LCorpCode4: TppLabel;
    LCorpName4: TppLabel;
    SVppDate4: TppSystemVariable;
    ppLine24: TppLine;
    ppLine23: TppLine;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLine177: TppLine;
    ppLine179: TppLine;
    ppLine181: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLabel8: TppLabel;
    ppLine62: TppLine;
    ppLine64: TppLine;
    ppLabel10: TppLabel;
    PDetailBandKR: TppDetailBand;
    ppDBText128: TppDBText;
    PLineKR: TppLine;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppLine176: TppLine;
    ppLine178: TppLine;
    ppLine180: TppLine;
    ppLine182: TppLine;
    ppLine183: TppLine;
    ppDBText16: TppDBText;
    ppLine63: TppLine;
    ppLine65: TppLine;
    ppDBText17: TppDBText;
    ppFooterBand12: TppFooterBand;
    SVppPage4: TppSystemVariable;
    bdeplKmk: TppDBPipeline;
    bdeplTeki: TppDBPipeline;
    ppLabel38: TppLabel;
    bdeplSwDic: TppDBPipeline;
    RepSwDic: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel79: TppLabel;
    ppLine125: TppLine;
    LCorpCodeSw: TppLabel;
    LCorpNameSw: TppLabel;
    SVppDateSw: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel83: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine130: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine135: TppLine;
    ppLine150: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    PDetailBandST: TppDetailBand;
    ppLine151: TppLine;
    ppDBTextSwTekiCode: TppDBText;
    ppDBTextSwTekiName: TppDBText;
    ppDBTextSwUpdDate: TppDBText;
    ppDBTextSwSTaxKbn: TppDBText;
    ppDBTextSwDHojyoCode: TppDBText;
    ppDBTextSwCHojyoCode: TppDBText;
    ppLine131: TppLine;
    ppLine148: TppLine;
    ppLine149: TppLine;
    ppDBTextSwDHojyoName: TppDBText;
    ppDBTextSwCHojyoName: TppDBText;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine6: TppLine;
    ppColumnFooterBand7: TppColumnFooterBand;
    ppFooterBand9: TppFooterBand;
    SVppPageSw: TppSystemVariable;
    ppDBTextSwFusen: TppDBImage;
    ppLineSwBottom: TppLine;
    ppDBTextSwRenso: TppDBText;
    ppDBTextSwZanKbn: TppDBText;
    ppDBTextSwSTaxCode: TppDBText;
    ppDBTextSwSTaxRate: TppDBText;
    ppDBTextSwTypeCode: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDBTextSwDKmkCode: TppDBText;
    ppDBTextSwDKmkName: TppDBText;
    ppDBTextSwCKmkCode: TppDBText;
    ppDBTextSwCKmkName: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    pdepIchiran: TppDBPipeline;
    RepTekiIchiran: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppPageStyle1: TppPageStyle;
    lblCorpCd: TppLabel;
    SVppDate: TppSystemVariable;
    pL_IchiTitle: TppLabel;
    ppLine14: TppLine;
    ppShape1: TppShape;
    ppLine27: TppLine;
    ppLine26: TppLine;
    ppLine29: TppLine;
    ppLine36: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    SVppPage: TppSystemVariable;
    lblCorpName: TppLabel;
    ppdepTaikei: TppDBPipeline;
    ppRepTaikei: TppReport;
    ppHeaderBand2: TppHeaderBand;
    SVppDateTk: TppSystemVariable;
    ppLabel54: TppLabel;
    ppLine17: TppLine;
    LCorpCodeTk: TppLabel;
    LCorpNameTk: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine25: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLine28: TppLine;
    ppDetailBandTk: TppDetailBand;
    dbTxtGCd: TppDBText;
    dbTxtGCdT: TppDBText;
    dbTxtBunNm: TppDBText;
    dbTxtTekiNm: TppDBText;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    TkLine: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppFooterBand2: TppFooterBand;
    SVppPageTk: TppSystemVariable;
    pdepBunrui: TppDBPipeline;
    ppRepBunrui: TppReport;
    ppHeaderBand4: TppHeaderBand;
    LppCorpCdBun: TppLabel;
    LppCorpNmBun: TppLabel;
    ppLabel13: TppLabel;
    ppLine37: TppLine;
    SVppDateBun: TppSystemVariable;
    lblOrder: TppLabel;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppLine39: TppLine;
    ppLine38: TppLine;
    ppLabel14: TppLabel;
    ppLine40: TppLine;
    ppLabel15: TppLabel;
    ppLine41: TppLine;
    ppLabel22: TppLabel;
    ppLine43: TppLine;
    ppLabel23: TppLabel;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppDetailBandBun: TppDetailBand;
    ppLine46: TppLine;
    dbTxtBunGCd: TppDBText;
    ppLine47: TppLine;
    dbTxtTekiChar: TppDBText;
    ppLine66: TppLine;
    dbTxtBunRen: TppDBText;
    ppLine67: TppLine;
    dbTxtUpDt: TppDBText;
    ppLine68: TppLine;
    BunLine: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    SVppPageBun: TppSystemVariable;
    LOrderSw: TppLabel;
    ppDBTextBusDicKbn: TppDBText;
    RReport1_DEP: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine69: TppLine;
    ppLine70: TppLine;
    LabelTitle0_DEP: TppLabel;
    LineTitle0_DEP: TppLine;
    ppLabel12: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel34: TppLabel;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    CorpCode0_DEP: TppLabel;
    CorpName0_DEP: TppLabel;
    SVppDate0_DEP: TppSystemVariable;
    ppLine85: TppLine;
    ppLine86: TppLine;
    PDetailBandM_DEP: TppDetailBand;
    PFuterLine_DEP: TppLine;
    ppDBImage2: TppDBImage;
    ppLine88: TppLine;
    ppDBTextCode_DEP: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText22: TppDBText;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine93: TppLine;
    ppLine108: TppLine;
    ppLine123: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage0_DEP: TppSystemVariable;
    AccOffice0_DEP: TppLabel;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);

    procedure RReport1BeforePrint(Sender: TObject);

    //<001>
    procedure PDetailBandKRBeforeGenerate(Sender: TObject);
    //<002>
    procedure SDetailBandBeforeGenerate(Sender: TObject);
    procedure PDetailBandSTBeforeGenerate(Sender: TObject);
    procedure PDetailBandSTBeforePrint(Sender: TObject);
    procedure ppDetailBandTkBeforeGenerate(Sender: TObject);    // <005>
    procedure ppDetailBandBunBeforeGenerate(Sender: TObject);
    procedure PDEPDetailBandKRBeforeGenerate(Sender: TObject);  // <MLXDEP2>

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
    m_strNowCode			:	String;				// 体系用 <009> ADD

    sDEPHani	    :	String;             //<MLXDEP>

	procedure ppReport1FileOut          ();
    procedure fnInzPrint                ();
	function  GetMasterName				(): TAryMaster;	// <003>ADD

  public
    { Public 宣言 }
// <003> MOD 引数追加
//	procedure DoPrint       (Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon);
	procedure DoPrint       (Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon;pPar: Pointer);
//    function  fnSetSQL      (TargetQry: TQuery; Para: TJNTHani; MsgFlg: Boolean = TRUE): Boolean;
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
  DmJNTCRP020000L: TDmJNTCRP020000L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;

{$include JNTConst.inc}						// <004> ADD
    
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
	pFrm    :   ^TDmJNTCRP020000L;
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
				pFrm^   :=  TDmJNTCRP020000L.CreateModule( AOwner,pRec );
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
// <003> MOD 引数追加
//			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetMD, PrtParam.CorpSys ,PrtParam.JNTArea);
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetMD, PrtParam.CorpSys ,PrtParam.JNTArea, PrtParam.TargetParam);
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
constructor TDmJNTCRP020000L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP020000L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP020000L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;
//@
//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
{
procedure TDmJNTCRP020000L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);


end;
}
//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
// <003> MOD 引数追加
//procedure TDmJNTCRP020000L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon);
procedure TDmJNTCRP020000L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;
									JNTArea: TJNTCommon; pPar: Pointer);
var
    wRep    :   TppReport;
	i       :   Integer;
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

    fnInzPrint;                                             // 印刷初期化処理

    wRep := nil;
    case uvHani.pvrPattern of
//<MLXDEP>↓
//*     C_TOUROKU : wRep := RReport1;
	    C_TOUROKU:
		begin
			if (TMSeries.IsMjsLink3) then
				wRep := RReport1_DEP
			else
				wRep := RReport1;
		end;
//<MLXDEP>↑
        C_KMKRENSO: wRep := RepRensoKmkCd; //<001>

        C_TEKIRENSO: wRep := RepRensoTekiCd;//<002>

		C_SWDICTEKI: wRep := RepSwDic;		//<003>仕訳辞書摘要登録ﾘｽﾄ

        C_ICHIRAN  : wRep := RepTekiIchiran;//<005>固定摘要一覧表

        C_TAIKEI   : wRep := ppRepTaikei;   //<005>固定摘要体系登録ﾘｽﾄ

        C_BUNRUI   : wRep := ppRepBunrui;   //<005>固定摘要分類登録ﾘｽﾄ
    end;

	PrnSupport.ApRB				:= wRep;
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    := m_pMDataModule^;         // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
//<006> start
	PrnSupport.pApRec			:= m_pRec;
//<006> end
    //PrnSupport.iReportID        :=
    

    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then                        
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
// <003> MOD start
//            PDLG_FILE: ppReport1FileOut;
            PDLG_FILE: 						// ﾌｧｲﾙ出力
			begin
											// 仕訳辞書摘要登録ﾘｽﾄ
				if uvHani.pvrPattern = C_SWDICTEKI then
				begin
											// 帳票とCSVのﾚｲｱｳﾄが異なるためMemData変更
					dsMain.DataSet := TdxMemData(pPar^);
				end;

				ppReport1FileOut();			// CSV出力
			end;
// <003> MOD end
        end;
	end;

end;
//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.ppReport1FileOut();
var
	iDCCnt	: Integer;						// <003> ADD
	iCnt	: Integer;						// <003> ADD
	strDC	: String;						// <003> ADD
	aryMaster	: TAryMaster;				// ﾏｽﾀ名称配列<003> ADD
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    case uvHani.pvrPattern of
        C_TOUROKU:      //固定摘要登録ﾘｽﾄ
        begin
			sTitle.Add('コード'			 );
			sTitle.Add('摘要'			 );
			sTitle.Add('連想'			 );
			if (TMSeries.IsMjsLink3 = False) then	//<MLXDEP>
			begin                   		//<MLXDEP>
				sTitle.Add('消費税区分'		 );
				sTitle.Add('消費税ｺｰﾄﾞ'		 );
				sTitle.Add('消費税率'		 );
				sTitle.Add('業種'			 );
				sTitle.Add('摘要残'			 );
				sTitle.Add('取引先区分'		 );
				sTitle.Add('取引先分類'		 );
			end;                    //<MLXDEP>
			sTitle.Add('最終更新日'		 );

			sMemFld.Add('GCode'			 );
			sMemFld.Add('TekiChar'		 );
			sMemFld.Add('RenChar'		 );
			if (TMSeries.IsMjsLink3 = False) then	//<MLXDEP>
			begin                   		//<MLXDEP>
				sMemFld.Add('StaxKbn'		 );
				sMemFld.Add('StaxCode'		 );
				sMemFld.Add('StaxRate'		 );
				sMemFld.Add('TypeCode'		 );
				sMemFld.Add('ZanKbn'		 );
				sMemFld.Add('ExgKbn'		 );
				sMemFld.Add('BunCode'		 );
			end;                    //<MLXDEP>
			sMemFld.Add('UpdateTime'	 );
        end;
        //<001>
        C_KMKRENSO :    // 科目連想登録ﾘｽﾄ(科目ｺｰﾄﾞ順)
		begin
            sTitle.Add('科目コード'			 );
			sTitle.Add('連想'			 );
			sTitle.Add('科目名'		 );
			sTitle.Add('摘要コード'		 );
			sTitle.Add('連想'		 );
			sTitle.Add('摘要'			 );

            sMemFld.Add('KGcodeC'			 );
			sMemFld.Add('RenChar'		 );
			sMemFld.Add('KTekiCharN'		 );
			sMemFld.Add('MGcodec'		 );
			sMemFld.Add('TRenChar'		 );
			sMemFld.Add('MTekiCharN'		 );

        end;
        //<001>

        //<002>
        C_TEKIRENSO:    // 科目連想登録ﾘｽﾄ(摘要ｺｰﾄﾞ順)
		begin
			sTitle.Add('摘要コード'		 );
			sTitle.Add('連想'		 );
			sTitle.Add('摘要'			 );
            sTitle.Add('消費税コード'			 );
            sTitle.Add('科目コード'			 );
			sTitle.Add('連想'			 );
			sTitle.Add('科目名'			 );

            sMemFld.Add('TekiCode'			 );
			sMemFld.Add('TRenChar'		 );
			sMemFld.Add('TekiChar'		 );
			sMemFld.Add('TaxCode'		 );
			sMemFld.Add('Kmkcode'		 );
			sMemFld.Add('RenChar'		 );
            sMemFld.Add('SimpleName'		 );
        end;
        //<002>

		//<003>
		C_SWDICTEKI:	// 仕訳辞書摘要登録ﾘｽﾄ
		begin
			sTitle.Add('コード');
			sTitle.Add('摘要');
			sTitle.Add('連想');
			sTitle.Add('消費税区分');
			sTitle.Add('消費税ｺｰﾄﾞ');
			sTitle.Add('消費税率');
			sTitle.Add('業種');
			sTitle.Add('摘要残');
			sTitle.Add('部署伝票辞書');     //<008>ADD
			sTitle.Add('最終更新日時');

            { // <007>DEL↓
			sTitle.Add('借方科目区分');
			sTitle.Add('借方科目コード');
			sTitle.Add('借方科目名称');
			} // <007>DEL↑
                                    //ﾏｽﾀ名称取得
			aryMaster := GetMasterName();

			for iCnt := 0 to High(aryMaster) do
			begin
				sTitle.Add('借方' + aryMaster[iCnt] + '区分');
				sTitle.Add('借方' + aryMaster[iCnt] + 'コード');
				sTitle.Add('借方' + aryMaster[iCnt] + '名称');
			end;

            { // <007>DEL↓
			sTitle.Add('貸方科目区分');
			sTitle.Add('貸方科目コード');
			sTitle.Add('貸方科目名称');
            } // <007>DEL↑

			for iCnt := 0 to High(aryMaster) do
			begin
				sTitle.Add('貸方' + aryMaster[iCnt] + '区分');
				sTitle.Add('貸方' + aryMaster[iCnt] + 'コード');
				sTitle.Add('貸方' + aryMaster[iCnt] + '名称');
			end;

			sMemFld.Add('GCode'		 	);	// 摘要ｺｰﾄﾞ
			sMemFld.Add('TekiChar'		);	// 摘要文字列
			sMemFld.Add('RenChar'		);	// 連想
			sMemFld.Add('STaxKbn'		);	// 消費税区分
			sMemFld.Add('STaxCode'		);	// 消費税ｺｰﾄﾞ
			sMemFld.Add('STaxRate'		);	// 消費税率
			sMemFld.Add('TypeCode'		);	// 業種
			sMemFld.Add('ZanKbn'		);	// 摘要残
			sMemFld.Add('BusDicKbn'		);	// 部署伝票辞書 <008>ADD
			sMemFld.Add('UpdateTime'	);	// 最終更新日時

			for iDCCnt := 0 to 1 do
			begin
				if iDCCnt = 0 then
				begin
					strDC := 'D';			// 借方
				end
				else
				begin
					strDC := 'C';			// 貸方
				end;

				sMemFld.Add(strDC + 'KmkKbn'		);	// 科目区分
				sMemFld.Add(strDC + 'KmkCode'		);	// 科目ｺｰﾄﾞ
				sMemFld.Add(strDC + 'KmkName'		);	// 科目名称
				sMemFld.Add(strDC + 'BmnKbn'		);	// 部門区分
				sMemFld.Add(strDC + 'BmnCode'		);	// 部門ｺｰﾄﾞ
				sMemFld.Add(strDC + 'BmnName'		);	// 部門名称
				for iCnt := 1 to 10 do
				begin									// ﾌﾟﾛｼﾞｪｸﾄ1～10
					sMemFld.Add(strDC + 'PrjKbn' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'PrjCode' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'PrjName' + IntToStr(iCnt));
                    // <007>ADD↓
                    sMemFld.Add(strDC + 'PjSubKbn' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'PjSubCode' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'PjSubName' + IntToStr(iCnt));
                    // <007>ADD↑
				end;
				sMemFld.Add(strDC + 'SubKbn'		);	// 科目別補助
				sMemFld.Add(strDC + 'SubCode'		);
				sMemFld.Add(strDC + 'SubName'		);
				sMemFld.Add(strDC + 'BankKbn'		);	// 銀行
				sMemFld.Add(strDC + 'BankCode'		);
				sMemFld.Add(strDC + 'BankName'		);
				sMemFld.Add(strDC + 'CsKbn'			);	// 取引先
				sMemFld.Add(strDC + 'CsCode'		);
				sMemFld.Add(strDC + 'CsName'		);
				sMemFld.Add(strDC + 'EmpKbn'		);	// 社員
				sMemFld.Add(strDC + 'EmpCode'		);
				sMemFld.Add(strDC + 'EmpName'		);
				for iCnt := 1 to 5 do
				begin									// 汎用補助1～5
					sMemFld.Add(strDC + 'MulKbn' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'MulCode' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'MulName' + IntToStr(iCnt));
				end;
				for iCnt := 1 to 10 do
				begin									// ｾｸﾞﾒﾝﾄ1～10
					sMemFld.Add(strDC + 'SegKbn' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'SegCode' + IntToStr(iCnt));
					sMemFld.Add(strDC + 'SegName' + IntToStr(iCnt));
				end;
			end;
		end;

		// <005> ADD start
        C_ICHIRAN:							// 固定摘要一覧表
        begin
            sTitle.Add('コード'			 );
			sTitle.Add('摘要名称'			 );

            sMemFld.Add ('nExCode'       );
			sMemFld.Add ('strDescription');
        end;

        C_TAIKEI:							// 固定摘要体系登録ﾘｽﾄ
        begin
            sTitle.Add('分類コード'		 );
			sTitle.Add('分類'			 );
            sTitle.Add('摘要コード'		 );
			sTitle.Add('摘要'			 );

            sMemFld.Add ('Gcode'       );
			sMemFld.Add ('BunName');
            sMemFld.Add ('GcodeT'       );
			sMemFld.Add ('TekiChar');
        end;

        C_BUNRUI:							// 固定摘要分類登録ﾘｽﾄ
         begin
            sTitle.Add('コード'			 );
			sTitle.Add('摘要'			 );
            sTitle.Add('連想'			 );
			sTitle.Add('最終更新日時'	 );

            sMemFld.Add ('Gcode'       );
			sMemFld.Add ('TekiChar');
            sMemFld.Add ('RenChar'       );
			sMemFld.Add ('UpDateTime');
        end;
        // <005> ADD end
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
function  TDmJNTCRP020000L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;
//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.fnInzPrint();
var
	strFormatDate		:   String;
	strFormatDateTime	:   String;

    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;

    dqMasterInfo        : TMQuery;
    strCaption          : String;
begin
    m_strNowCode := '';							// 加算体系用 <009> ADD

    //--------------------------------------------------------------------------
    // MasterInfo取得
    //--------------------------------------------------------------------------

	dqMasterInfo    := TMQuery.Create (Self);			    		                        // MQueryの構築
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, dqMasterInfo ); // DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add('SELECT MasterKbn,UseKbn,JHojyoName,CodeDigit,CodeAttr ');
        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ORDER BY MasterKbn');
		ParamByName('nMasterDivision').AsInteger    := 61;
		Open ();

		if not EOF then
        begin
            strCaption := GetFld ('JHojyoName').AsString;
    		if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then					// ｺｰﾄﾞ属性: 数字
	    	begin
		    	case uvHani.pvrPattern of
			    	C_TOUROKU :    // 固定摘要登録ﾘｽﾄ
				    begin
                        strCaption := GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText77.Alignment	:= taRightJustify;
						ppDBTextCode_DEP.Alignment		:= taRightJustify;	//<MLXDEP>
	    			end;
                    //<001>
                    C_KMKRENSO:    // 科目連想登録ﾘｽﾄ(科目ｺｰﾄﾞ順)
				    begin
                        strCaption := uvHani.pvrRepTitle;
	    			end;
                    //<001>

                    //<002>
                    C_TEKIRENSO:    // 科目連想登録ﾘｽﾄ(摘要ｺｰﾄﾞ順)
				    begin
                        strCaption := uvHani.pvrRepTitle;
    				end;
                    //<002>
                    //<003> ADD start
                    C_SWDICTEKI:   	// 仕訳辞書摘要登録ﾘｽﾄ
                    begin
                    	strCaption := uvHani.pvrRepTitle;
                    end;
                    //<003> ADD end
                    //<005> ADD start
                    C_ICHIRAN:    	// 固定摘要一覧表
				    begin
                        strCaption := uvHani.pvrRepTitle;
    				end;

                    C_TAIKEI:    	// 固定摘要体系登録ﾘｽﾄ
				    begin
                        strCaption := uvHani.pvrRepTitle;
    				end;

                    C_BUNRUI:    	// 固定摘要分類登録ﾘｽﾄ
				    begin
                        strCaption := uvHani.pvrRepTitle;
    				end;
                    // <005> ADD end
	    		end;
		    end
    		else										   					// ｺｰﾄﾞ属性: 文字
	    	begin
		    	case uvHani.pvrPattern of
			    	C_TOUROKU:    // 固定摘要登録ﾘｽﾄ
				    begin
                        strCaption := GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText77.Alignment	:= taLeftJustify;
	    			end;
	    		end;
		    end;
        end;
		Close;
    end;

    dqMasterInfo.Free;
    PrnSupport.strDocName   := strCaption;

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

    case uvHani.pvrPattern of
        C_TOUROKU:
        begin
	        ppDBText85  .DisplayFormat	:= strFormatDateTime;
			ppDBText22  .DisplayFormat	:= strFormatDateTime;	//<MLXDEP>
			if (TMSeries.IsMjsLink3) then sDEPHani := '_DEP';           //<MLXDEP>
        end;
        // <003> ADD start
        C_SWDICTEKI:						// 仕訳辞書摘要登録ﾘｽﾄ
        begin								// 更新日時
        	ppDBTextSwUpdDate.DisplayFormat := strFormatDateTime;
        end;
        // <003> ADD end
    end;


    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------

    case uvHani.pvrPattern of
        C_TOUROKU:
        begin
            // 会社ｺｰﾄﾞ
//<MLXDEP>↓
//* 		wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
		    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
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
//<MLXDEP>↓
//* 		wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
			wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
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

//<MLXDEP>↓
//* 		wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
			wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
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
//<MLXDEP>↓
//* 		wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
			wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
            with wTppLabel do
            begin
                Caption     := strCaption;
                Left        := 4.865;
                Top         := 0.1667;

                Width       := 3.5;
                Height      := 0.25;
                Alignment   := taCenter;
                Distributed2    := True;
                FontRatio.Auto  := True;
            end;

            // ﾀｲﾄﾙｱﾝﾀﾞ-
//<MLXDEP>↓
//* 		wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
			wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
            with wTppLine do
            begin
                Left        := 4.802;
                Top         := 0.2917;
                Width       := 3.626;
                Height      := 0.1667;
//        Position    := lpBottom;
                Pen.Width       := 0;
                Pen.Style       := psSolid;
            end;


            // 頁
//<MLXDEP>↓
//* 		wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
			wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
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
//<MLXDEP>↓
//* 		wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern])));
			wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
            wTppLabel.Visible := False;
        end;
    //<001>
        C_KMKRENSO:
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := LCorpCode4;
            // 会社名
            PrnSupport.pCorpName := LCorpName4;
            // 日付
            PrnSupport.pDate	:= SVppDate4;
            // 頁
            PrnSupport.pPage	:= SVppPage4;
        end;
    //<001>

    //<002>
        C_TEKIRENSO:
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := LCorpCode6;
            // 会社名
            PrnSupport.pCorpName := LCorpName6;
            // 日付
            PrnSupport.pDate	:= SVppDate6;
            // 頁
            PrnSupport.pPage	:= SVppPage6;
        end;
    //<002>

    //<003>
    	C_SWDICTEKI:						// 仕訳辞書摘要登録ﾘｽﾄ
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := LCorpCodeSw;
            // 会社名
            PrnSupport.pCorpName := LCorpNameSw;
            // 日付
            PrnSupport.pDate	:= SVppDateSw;
            // 頁
            PrnSupport.pPage	:= SVppPageSw;
        end;
    //<003>
    //<005> ADD start
        C_ICHIRAN: 							// 固定摘要一覧表
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := lblCorpCd;
            // 会社名
            PrnSupport.pCorpName := lblCorpName;
            // 日付
            PrnSupport.pDate	 := SVppDate;
            // 頁
            PrnSupport.pPage	 := SVppPage;
        end;

        C_TAIKEI:   						// 固定摘要体系登録ﾘｽﾄ
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := LCorpCodeTk;
            // 会社名
            PrnSupport.pCorpName := LCorpNameTk;
            // 日付
            PrnSupport.pDate	 := SVppDateTk;
            // 頁
            PrnSupport.pPage	 := SVppPageTk;
        end;

        C_BUNRUI:							// 固定摘要分類登録ﾘｽﾄ
        begin
            // 会社ｺｰﾄﾞ
            PrnSupport.pCorpCode := LppCorpCdBun;
            // 会社名
            PrnSupport.pCorpName := LppCorpNmBun;
            // 日付
            PrnSupport.pDate	 := SVppDateBun;
            // 頁
            PrnSupport.pPage	 := SVppPageBun;
        end;
    //<005> ADD end
    end;

    // ﾌｧｲﾙ名
    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strCaption + '.csv';

end;
//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.RReport1BeforePrint(Sender: TObject);
begin
    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

    case uvHani.pvrPattern of
        C_TEKIRENSO:
        begin
            if uvHani.pvrOrder = 0 then
            begin
                ppLabel38.Caption := '【コード順】' ;
            end
            else
            begin
                ppLabel38.Caption := '【連想順】' ;
            end;
        end;
        // <004> ADD start
        C_SWDICTEKI:						// 仕訳辞書摘要登録ﾘｽﾄ
        begin
			if uvHani.pvrOrder = 0 then
            begin
            	LOrderSw.Caption := '【コード順】' ;
            end
            else
            begin
                LOrderSw.Caption := '【連想順】' ;
            end;
		end;
        // <004> ADD end
        // <005> ADD start
        C_BUNRUI:							// 固定摘要分類登録ﾘｽﾄ
        begin
            if uvHani.pvrOrder = 0 then
            begin
                lblOrder.Caption  := '【コード順】' ;
            end
            else
            begin
                lblOrder.Caption  := '【連想順】' ;
            end;
        end;
        // <005> ADD end
    end;
end;

//  <001>
procedure TDmJNTCRP020000L.PDetailBandKRBeforeGenerate(Sender: TObject);
begin
    // 最終レコード、頁の最下行を判定する関数の追加
	if (PDetailBandKR.LastRecord) or
		(PDetailBandKR.PageOutOfSpace = TRUE) Then
	begin
		if (PDetailBandKR.OverFlow = FALSE) then
			PDetailBandKR.OverFlow	:=	TRUE;

		if (PLineKR.ReprintOnOverFlow = FALSE) then
			PLineKR.ReprintOnOverFlow	:=	TRUE;

		PLineKR.Visible    :=	TRUE;
		PLineKR.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		PLineKR.Visible    :=	TRUE;
		PLineKR.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;
//  <001>
//  <002>
procedure TDmJNTCRP020000L.SDetailBandBeforeGenerate(Sender: TObject);
begin
    // 最終レコード、頁の最下行を判定する関数の追加
	if (SDetailBand.LastRecord) or
		(SDetailBand.PageOutOfSpace = TRUE) Then
	begin
		if (SDetailBand.OverFlow = FALSE) then
			SDetailBand.OverFlow	:=	TRUE;

		if (FLine.ReprintOnOverFlow = FALSE) then
			FLine.ReprintOnOverFlow	:=	TRUE;

		FLine.Visible    :=	TRUE;
		FLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		FLine.Visible    :=	TRUE;
		FLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;

    if dsMain.DataSet.FieldByName('TaxCode').AsString = '科目に従う' then
    begin
        ppDBText18.Alignment := taLeftJustify;
    end
    else
    begin
        ppDBText18.Alignment := taRightjustify;
    end;
end;
//  <002>
//  <005> ADD start
//------------------------------------------------------------------------------
//  ppRepTaikeiの詳細行BeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.ppDetailBandTkBeforeGenerate(Sender: TObject);
begin
//<009> ADD St
	// 加算先コードが１行前と同じだったら
	if dsMain.DataSet.FieldByName('Gcode').AsString = m_strNowCode then
    begin
    	// 親は表示しない
    	dbTxtGCd.Visible := False;
    	dbTxtBunNm.Visible := False;
        // 上の線も表示しない
//        ppLineDetailsTopKasan.Visible := False;
    end
    else
    begin
    	// 親を表示する
    	dbTxtGCd.Visible := True;
    	dbTxtBunNm.Visible := True;
        // 上の線も表示する
//        ppLineDetailsTopKasan.Visible := True;
    end;
    										// 加算先コードをとっておく
    m_strNowCode := dsMain.DataSet.FieldByName('Gcode').AsString;
//<009> ADD Ed
    // 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBandTk.LastRecord) or
		(ppDetailBandTk.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBandTk.OverFlow = FALSE) then
			ppDetailBandTk.OverFlow	:=	TRUE;

		if (TkLine.ReprintOnOverFlow = FALSE) then
			TkLine.ReprintOnOverFlow	:=	TRUE;

		TkLine.Visible    :=	TRUE;
		TkLine.Weight	  :=	0.75;	// ラインの太さを太くしている
        m_strNowCode := '';		// 次のページの頭は必ず親も表示  <009> ADD
	end
	else
	begin
		TkLine.Visible    :=	TRUE;
		TkLine.Weight	  :=	0.25;	// ラインの太さを元にもどす
	end;
end;
//  <005> ADD end
//  <005> ADD start
//------------------------------------------------------------------------------
//  ppRepBunruiの詳細行BeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.ppDetailBandBunBeforeGenerate(Sender: TObject);
begin
    // 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBandBun.LastRecord) or
		(ppDetailBandBun.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBandBun.OverFlow = FALSE) then
			ppDetailBandBun.OverFlow	:=	TRUE;

		if (BunLine.ReprintOnOverFlow = FALSE) then
			BunLine.ReprintOnOverFlow	:=	TRUE;

		BunLine.Visible    :=	TRUE;
		BunLine.Weight	   :=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		BunLine.Visible    :=	TRUE;
		BunLine.Weight	   :=	0.25;	// ラインの太さを元にもどす
	end;
end;
//  <005> ADD end
// 	<003> ADD start
//------------------------------------------------------------------------------
//  仕訳辞書摘要登録ﾘｽﾄ　DetailBandのBeforeGenerateｲﾍﾞﾝﾄ <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.PDetailBandSTBeforeGenerate(Sender: TObject);
begin
	{ 1明細が終わったら描線 }
	if dsMain.DataSet.FieldByName('bDtlLast').AsBoolean then
	begin
		ppLineSwBottom.Visible := True;
	end
	else
	begin
		ppLineSwBottom.Visible := False;
	end;

	{ 線の太さ変更 }
    if (PDetailBandST.LastRecord) or (PDetailBandST.PageOutOfSpace) then
	begin
		if not PDetailBandST.OverFlow then
        begin
			PDetailBandST.OverFlow := True;
        end;

		if not ppLineSwBottom.ReprintOnOverFlow then
        begin
			ppLineSwBottom.ReprintOnOverFlow := True;
        end;

		ppLineSwBottom.Visible := True;		// 表示
		ppLineSwBottom.Weight := 0.75;		// ﾗｲﾝの太さを太く
    end
	else
	begin
		ppLineSwBottom.Weight := 0.25;		// ﾗｲﾝの太さを元にもどす
    end;
end;
// <003> ADD end
// <003> ADD start
//------------------------------------------------------------------------------
//  仕訳辞書摘要登録ﾘｽﾄ　DetailBandのBeforePrintｲﾍﾞﾝﾄ <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP020000L.PDetailBandSTBeforePrint(Sender: TObject);
var
	iLine	: Integer;
const
	TEXT_KAHEN = '可変マスタ';
	TEXT_TOUGAI	= '当該マスタ';
begin
	{ 明細のどの行かによって出力内容を切替 }

	{ 一度全て非表示にする }
    ppDBTextSwFusen.Visible := False;		// 付箋
	ppDBTextSwTekiCode.Visible := False;	// 摘要ｺｰﾄﾞ
	ppDBTextSwTekiName.Visible := False;	// 摘要文字列
	ppDBTextSwRenso.Visible := False;		// 連想
	ppDBTextSwZanKbn.Visible := False;		// 摘要残管理
	ppDBTextSwUpdDate.Visible := False;		// 最終更新日時
	ppDBTextSwSTaxKbn.Visible := False;		// 売上/仕入区分
	ppDBTextSwSTaxCode.Visible := False;	// 消費税ｺｰﾄﾞ
	ppDBTextSwSTaxRate.Visible := False;	// 消費税率
	ppDBTextSwTypeCode.Visible := False;	// 業種ｺｰﾄﾞ
    ppDBTextBusDicKbn.Visible := False;     // 部署伝票辞書使用区分 <008>ADD
											// 行番号
	iLine := dsMain.DataSet.FieldByName('iLine').AsInteger;
	{ 行によって必要なものを表示 }
	case iLine of
		1:									// 1行目
		begin
        									// 付箋
        	ppDBTextSwFusen.Visible := True;
											// 摘要ｺｰﾄﾞ
			ppDBTextSwTekiCode.Visible := True;
											// 摘要文字列
			ppDBTextSwTekiName.Visible := True;
											// 売上/仕入区分
											// ※部署伝票では出力しない
//			ppDBTextSwSTaxKbn.Visible := True;
		end;
		2:									// 2行目
		begin
											// 連想
			ppDBTextSwRenso.Visible := True;
											// 消費税ｺｰﾄﾞ
			ppDBTextSwSTaxCode.Visible := True;

		end;
		3:									// 3行目
		begin
											// 摘要残管理
			ppDBTextSwZanKbn.Visible := True;
											// 消費税率
			ppDBTextSwSTaxRate.Visible := True;
		end;
// ↓↓<008>↓↓
		4:									// 4行目
		begin
                                            // 部署伝票辞書使用区分
            ppDBTextBusDicKbn.Visible := True;
		end;
// ↑↑<008>↑↑
//<008>	4:									// 4行目
		5:									// 5行目
		begin
											// 最終更新日時
			ppDBTextSwUpdDate.Visible := True;
											// 業種ｺｰﾄﾞ
			ppDBTextSwTypeCode.Visible := True;
		end;
		else								// 以降の行
		begin
			// 補助以外は表示しない
		end;
	end;

    { 補助のAlignment設定 }
      										// 数字・0つき数字 and 可変・当該以外
    if (dsMain.DataSet.FieldByName('DiAttr').AsInteger < 2) and
		(dsMain.DataSet.FieldByName('DHojName').AsString <> TEXT_KAHEN) and
		(dsMain.DataSet.FieldByName('DHojName').AsString <> TEXT_TOUGAI) then
    begin									// 借方補助ｺｰﾄﾞ
    	ppDBTextSwDHojyoCode.Alignment := taRightJustify;
    end
    else									// 文字
    begin
    	ppDBTextSwDHojyoCode.Alignment := taLeftJustify;
    end;

    										// 数字・0つき数字 and 可変・当該以外
    if (dsMain.DataSet.FieldByName('CiAttr').AsInteger < 2) and
		(dsMain.DataSet.FieldByName('CHojName').AsString <> TEXT_KAHEN) and
		(dsMain.DataSet.FieldByName('CHojName').AsString <> TEXT_TOUGAI) then
    begin                            		// 貸方補助ｺｰﾄﾞ
    	ppDBTextSwCHojyoCode.Alignment := taRightJustify;
    end
    else									// 文字
    begin
    	ppDBTextSwCHojyoCode.Alignment := taLeftJustify;
    end;
end;
// <003> ADD end
// <003> ADD start
//------------------------------------------------------------------------------
//  仕訳辞書摘要登録　ﾏｽﾀ名称を取得 <003>
//------------------------------------------------------------------------------
function TDmJNTCRP020000L.GetMasterName(): TAryMaster;
var
	iIndex			: Integer;
	iMasterKbn		: Integer;
    dqMasterInfo	: TMQuery;
    aryName			: TAryMaster;
const
	aryProject	: array[0..9] of Integer = (IDX_PRJ1, IDX_PRJ2, IDX_PRJ3, IDX_PRJ4, IDX_PRJ5,
    										IDX_PRJ6, IDX_PRJ7, IDX_PRJ8, IDX_PRJ9, IDX_PRJ10);
	aryPrjSub	: array[0..9] of Integer = (IDX_PRJSUB1, IDX_PRJSUB2, IDX_PRJSUB3, IDX_PRJSUB4, IDX_PRJSUB5,
    										IDX_PRJSUB6, IDX_PRJSUB7, IDX_PRJSUB8, IDX_PRJSUB9, IDX_PRJSUB10);
begin
	iIndex := 0;
	dqMasterInfo := TMQuery.Create (Self);	// MQueryの構築
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, dqMasterInfo ); // DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add('SELECT MasterKbn, JHojyoName ');
        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn <= :nMasterDivision ');
		ParamByName('nMasterDivision').AsInteger := MKBN_PROSUB10;
		Open ();

		while not EOF do
        begin
											// ﾏｽﾀ区分
			iMasterKbn := GetFld('MasterKbn').AsInteger;
			case iMasterKbn of
				MKBN_KAMOKU:                        // 科目
				begin
					iIndex := IDX_KAMOKU;
				end;
				MKBN_BUMON:                         // 部門
				begin
					iIndex := IDX_BUMON;
				end;
				MKBN_PROJECT1..MKBN_PROJECT10: 		// ﾌﾟﾛｼﾞｪｸﾄ1～10
				begin
		        	iIndex := aryProject[iMasterKbn - MKBN_PROJECT1];
				end;
				MKBN_PROSUB1..MKBN_PROSUB10: 		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
				begin
		        	iIndex := aryPrjSub[iMasterKbn - MKBN_PROSUB1];
				end;
				MKBN_SAIMOKU:                       // 科目別補助
				begin
					iIndex := IDX_KMKHOJ;
				end;
				MKBN_GINKOU:                        // 銀行
				begin
		    		iIndex := IDX_BANK;
				end;
				MKBN_TORIHIKI:                      // 取引先
				begin
					iIndex := IDX_TORIHIKI;
		    	end;
				MKBN_SYAIN:                         // 社員
				begin
					iIndex := IDX_SYAIN;
				end;
				MKBN_HHOJYO1..MKBN_HHOJYO5:         // 汎用補助1～5
				begin
					iIndex := iMasterKbn - MKBN_HHOJYO1 + IDX_HANYOU1;
				end;
				MKBN_SEG1..MKBN_SEG10:				// ｾｸﾞﾒﾝﾄ1～10
				begin
					iIndex := iMasterKbn - MKBN_SEG1 + IDX_SEG1;
				end;
				else
				begin
					Next;
					Continue;
				end;
			end;
											// 補助名称取得
            aryName[iIndex] := GetFld('JHojyoName').AsString;

			Next;
        end;
		Close;
		Free;
    end;

	Result := aryName;						// 配列を返す
end;

// <MLXDEP2> ADD end
procedure TDmJNTCRP020000L.PDEPDetailBandKRBeforeGenerate(Sender: TObject);
begin
    // 最終レコード、頁の最下行を判定する関数の追加
	if (PDetailBandM_DEP.LastRecord) or
		(PDetailBandM_DEP.PageOutOfSpace = TRUE) Then
	begin
		if (PDetailBandM_DEP.OverFlow = FALSE) then
			PDetailBandM_DEP.OverFlow	:=	TRUE;

		if (PFuterLine_DEP.ReprintOnOverFlow = FALSE) then
			PFuterLine_DEP.ReprintOnOverFlow	:=	TRUE;

		PFuterLine_DEP.Visible  :=	TRUE;
		PFuterLine_DEP.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		PFuterLine_DEP.Visible :=	TRUE;
		PFuterLine_DEP.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;
// <MLXDEP2> ADD end

end.

