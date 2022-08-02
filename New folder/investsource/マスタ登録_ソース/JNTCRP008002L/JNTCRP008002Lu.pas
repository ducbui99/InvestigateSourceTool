//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：依頼先銀行(印刷処理)
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
//  <ﾏｰｸ> <修正者>   <修正日>        <修正内容>
//		  広田茂雄	 2005.12.14		 ファイルパス類は長体をかけた
//	<001> 関(PRIME)  2008.05.08(THU) 依頼先口座登録ﾘｽﾄ追加
//	<002> 鈴木(PRIME)2008.05.09(FRI) 銀行登録リストのレイアウト変更
//	<003> 渡邊(LAB)  2008.06.12(THU) 印刷スプール名のセット
//  <004> SATOH(IDC) 2008/09/29(MON) 印刷履歴スプール名改良
//  <005> 大田原(MSI)2011/01/14(FRI) 組戻対応：組戻依頼書ﾚｲｱｳﾄﾊﾟｽを追加
//  <006> 小島(MSI)	 2011/03/01(THU) 手数料支払区分追加
//  <007> 佐藤(GSOL) 2011/04/01(FRI) ver4.03総合評価時の以下の不具合を修正(デザインのみ)
//                                   依頼先銀行登録リスト
//                                   ・タイトル文字列の文字間隔の統一
//                                   依頼先口座登録リスト
//                                   ・タイトル文字列の文字間隔の統一
//                                   ・仕訳情報エリアの縦線のはみ出しを修正
//                                   ・銀行コードに支店コードを追加出力
//
//	<   > A.CHOU(MJS)2012/04/20      口座管理情報画面の「FB情報」→「FB／電子債権情報」へ変更(デザインのみ)
//  <009> 佐藤(GSOL) 2012/06/22(FRI) 電子債権支払レイアウト設定対応
//
// ========================↓MLX対応============================================
//
// <MLXHAP> 新保一馬 2013.01.26(Sat) MLX給与対応
//
//  <010> 佐藤(GSOL) 2013/04/11(THU) 依頼口座登録リストの依頼人名を長体出力に変更(デザインのみ)
//  <011> 佐藤(GSOL) 2013/04/11(THU) 電子債権用フリー項目追加
//  <TX26>佐藤(GSOL) 2013/08/01(THU) H26消費税改正対応(デザインのみ)
//  <012> 大下(3A)   2014/01/06(MON) 外貨債務対応 外国送金情報、電子記録債権、海外送金を追加
//  <C16> 雲         2014/07/02(WED) 取引先コード16桁対応（デザインのみ）
//                                   ・RBの取引先補助コードを長体をかけて修正
//  <013> 佐藤(GSOL) 2014/09/18(THU) 口座メモ対応(旧Galiでは出力しない)
//  <014> 荒川(TakumiCo.) 2018/11/14(Wed) 全銀協（ZEDI）対応
//  <20200707> 今野  2020/07/07(TUE) 銀行口座メモ表示対応(OEY-0458)
//
//=============================================================================
unit JNTCRP008002Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  SeriesCheckU,//<MLXHAP>
  SeriesCheck2U,//<20200707>
  dxmdaset,JNTCommonu, ppStrtch, ppMemo, ppDesignLayer, ppParameter;


type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP008002L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    ppRep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    Repdt: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    CmnReportAccount: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    CmnReportAccountSysVarDate: TppSystemVariable;
    CmnReportAccountLabelCorpCode: TppLabel;
    CmnReportAccountLabelCorpName: TppLabel;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    CmnDetailBandAccount: TppDetailBand;
    CmnLineReportAccountDetailBand: TppLine;
    ppDBText57: TppDBText;
    CmnReportAccountDBTextAccCode: TppDBText;
    CmnReportAccountDBTextBankCode: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppDBText126: TppDBText;
    CmnReportAccountDBTextHojCode02: TppDBText;
    ppDBText130: TppDBText;
    ppLine99: TppLine;
    ppDBText142: TppDBText;
    ppLine108: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine111: TppLine;
    ppLine107: TppLine;
    ppLine13: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    CmnReportAccountDBTextHojCode01: TppDBText;
    ppDBText4: TppDBText;
    CmnReportAccountDBTextHojCode03: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand5: TppFooterBand;
    CmnReportAccountSysVarPage: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLineJK_Bottom: TppLine;
    ppLineJK_Top: TppLine;
    ppLabel91: TppLabel;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLabel28: TppLabel;
    ppLine106: TppLine;
    ppLabel117: TppLabel;
    ppLineJK_Right: TppLine;
    ppLabel58: TppLabel;
    ppLabel31: TppLabel;
    ppLine89: TppLine;
    ppLineJK_Left: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    CmnReportDetail: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    CmnReportDetailSysVarDate: TppSystemVariable;
    CmnReportDetailLabelCorpCode: TppLabel;
    CmnReportDetailLabelCorpName: TppLabel;
    CmnReportDetailLabelTitle: TppLabel;
    CmnReportDetailLineTitle: TppLine;
    CmnDetailBandDetail: TppDetailBand;
    ppLine15: TppLine;
    CmnReportDetailDBTextBankCode: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine31: TppLine;
    CmnLineReportDetailDetailBand: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel16: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
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
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppLabel56: TppLabel;
    ppLabel62: TppLabel;
    ppLabel65: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel7: TppLabel;
    ppLine10: TppLine;
    ppFooterBand2: TppFooterBand;
    CmnReportDetailSysVarPage: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine28: TppLine;
    ppLine27: TppLine;
    ppLabel10: TppLabel;
    ppLine29: TppLine;
    ppLine33: TppLine;
    ppLabel14: TppLabel;
    ppLine34: TppLine;
    ppLabel15: TppLabel;
    ppLine36: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText8: TppDBText;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel36: TppLabel;
    ppDBText10: TppDBText;
    ppLine3: TppLine;
    ppLabel60: TppLabel;
    ppDBText12: TppDBText;
    ppLabel61: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel102: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLine4: TppLine;
    ppLine11: TppLine;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText29: TppDBText;
    ppDBText43: TppDBText;
    ppLabel120: TppLabel;
    ppDBText46: TppDBText;
    ppLine12: TppLine;
    ppDBText49: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText62: TppDBText;
    ppDBText85: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText3: TppDBText;
    ppLabel17: TppLabel;
    ppLine5: TppLine;
    ppLabel18: TppLabel;
    ppDBText11: TppDBText;
    ppDBText18: TppDBText;
    CmnReport_MLXHAP: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    CmnReportSysVarDate_MLXHAP: TppSystemVariable;
    CmnReportLabelCorpCode_MLXHAP: TppLabel;
    CmnReportLabelCorpName_MLXHAP: TppLabel;
    ppLabel21: TppLabel;
    ppLine9: TppLine;
    CmnDetailBand_MLXHAP: TppDetailBand;
    CmnLineReport_MLXHAPDetailBand: TppLine;
    ppDBText21: TppDBText;
    ppDBText24: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLine23: TppLine;
    ppLine30: TppLine;
    ppLine32: TppLine;
    ppLine35: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLabel71: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppFooterBand3: TppFooterBand;
    CmnReportSysVarPage_MLXHAP: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLabel126: TppLabel;
    ppLine56: TppLine;
    ppLabel127: TppLabel;
    ppLine58: TppLine;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine14: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel110: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppLabel128: TppLabel;
    ppLabel131: TppLabel;
    ppDBText107: TppDBText;
    ppLabel132: TppLabel;
    ppDBText108: TppDBText;
    ppLine55: TppLine;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppDBText109: TppDBText;
    ppLabel138: TppLabel;
    ppDBText110: TppDBText;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLine49: TppLine;
    ppLine52: TppLine;
    ppLine57: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppDBText118: TppDBText;
    ppLabel142: TppLabel;
    ppDBText119: TppDBText;
    ppLabel143: TppLabel;
    ppDBText120: TppDBText;
    ppLabel144: TppLabel;
    ppLine64: TppLine;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLabel149: TppLabel;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLabel150: TppLabel;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppLine69: TppLine;
    ppDBMemo1: TppDBMemo;
    AccZanLimitLabel: TppLabel;
    AccZanLimitName: TppDBText;
    ppLabel152: TppLabel;
    ppDBText128: TppDBText;
    ppLine24: TppLine;
    ppDBMemo2: TppDBMemo;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       ppRepBeforePrint    (Sender: TObject);
    procedure CmnDetailBandDetailBeforeGenerate(Sender: TObject);
    procedure CmnDetailBandAccountBeforeGenerate(Sender: TObject);
    procedure CmnReportAccountDBTextHojCodePrint(Sender: TObject);
    procedure CmnDetailBand_MLXHAPBeforeGenerate(Sender: TObject);

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

	procedure ppReport1FileOut();

  public
    { Public 宣言 }
	procedure DoPrint                   (Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea:TJNTCommon);
	function  fnIsPreview   (): Boolean;
	procedure fnInzPrint();

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
  DmJNTCRP008002L: TDmJNTCRP008002L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

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
	pFrm    :   ^TDmJNTCRP008002L;
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
				pFrm^   :=  TDmJNTCRP008002L.CreateModule( AOwner,pRec );
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
constructor TDmJNTCRP008002L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP008002L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP008002L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP008002L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);


end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP008002L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon);
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
//<MLXHAP>0 : wRep := CmnReportDetail;
//↓<MLXHAP>
		0:
		begin
            if TMSeries.IsMjsLink3 then
            begin
                // MLX給与は専用レイアウト
                wRep := CmnReport_MLXHAP;
            end
            else
            begin
                // MLX給与以外は通常レイアウト
                wRep := CmnReportDetail;
            end;
		end;
//↑<MLXHAP>
		1 : wRep := CmnReportAccount;						// <001>
    end;

	PrnSupport.ApRB				:= wRep;
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    := m_pMDataModule^;         // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)

//<003>↓
	case uvHani.pvrPattern of
		0:
		begin
			PrnSupport.strDocName := '依頼先銀行登録リスト';
		end;

		1:
		begin
			PrnSupport.strDocName := '依頼先口座登録リスト';
		end;
	end;
//<003>↑

    PrnSupport.strDocName := PrnSupport.strDocName + '[' + uvHani.pvrOrderNM + ']'; // <004> ADD

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    prnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

	PrnSupport.pApRec := m_pRec;							// <001>

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
            PDLG_FILE: ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP008002L.ppReport1FileOut();
var
    cTitleField  : TStringList;
    cMemDataField : TStringList;
begin

    cTitleField  :=  TStringList.Create;
    cMemDataField :=  TStringList.Create;

    case uvHani.pvrPattern of
		0:
        begin
//↓<MLXHAP>
			if TMSeries.IsMjsLink3 then
			begin
				// MLX給与の依頼先銀行登録ﾘｽﾄ（ベースは既存の依頼先口座登録ﾘｽﾄのほう。）
                cTitleField.Add('全銀協ｺｰﾄﾞ');
                cTitleField.Add('銀行名称');
                cTitleField.Add('カナ銀行名');
                cTitleField.Add('支店名称');
                cTitleField.Add('カナ支店名');
                cTitleField.Add('簡略名称');
                cTitleField.Add('口座ｺｰﾄﾞ');
                cTitleField.Add('預金種目');
                cTitleField.Add('口座番号');
//<20200707>Add-S
                if TMSeries2.IsMjsLink4 then
					cTitleField.Add('メモ');
//<20200707>Add-E
                cTitleField.Add('振込種別');
                cTitleField.Add('依頼書電信扱い');
                cTitleField.Add('取扱種目');
                cTitleField.Add('半角ｺｰﾄﾞ体系');
                cTitleField.Add('ﾚｺｰﾄﾞ区切');
                cTitleField.Add('振込依頼人ｺｰﾄﾞ');
                cTitleField.Add('振込依頼人名');
                cTitleField.Add('ｶﾅ振込依頼人名');
                cTitleField.Add('ﾌｧｲﾙ名');
                cTitleField.Add('ﾎﾞﾘｭｰﾑ名');
                cTitleField.Add('総合振込出力方式');	// <014>

                cMemDataField.Add('BankCode');			// 全銀協ｺｰﾄﾞ
                cMemDataField.Add('BankName');			// 銀行名称
                cMemDataField.Add('BankKanaName');		// カナ銀行名
                cMemDataField.Add('BkBraName');			// 支店名称
                cMemDataField.Add('BraKanaName');		// カナ支店名
                cMemDataField.Add('SimpleName');		// 簡略名称
                cMemDataField.Add('AccCode');			// 口座ｺｰﾄﾞ
                cMemDataField.Add('AccKbnName');		// 預金種目
                cMemDataField.Add('AccNo');				// 口座番号
//<20200707>Add-S
                if TMSeries2.IsMjsLink4 then
					cMemDataField.Add('AccMemo');       // 口座メモ
//<20200707>Add-E
                cMemDataField.Add('ShubetsuName');		// 振込種別
                cMemDataField.Add('RequestKbnName');	// 依頼書電信扱い
                cMemDataField.Add('ShumokuName');		// 取扱種目
                cMemDataField.Add('FBCodeModeName');	// 半角ｺｰﾄﾞ体系
                cMemDataField.Add('RecordPauseName');	// ﾚｺｰﾄﾞ区切
                cMemDataField.Add('ClientCode');		// 振込依頼人ｺｰﾄﾞ
                cMemDataField.Add('AccInfo1');			// 振込依頼人名
                cMemDataField.Add('ClientName');		// ｶﾅ振込依頼人名
                cMemDataField.Add('FileName');			// ﾌｧｲﾙ名
                cMemDataField.Add('VolName');			// ﾎﾞﾘｭｰﾑ名
                cMemDataField.Add('AccZanLimitName');		// 総合振込出力方式 <014>
			end
			else
			begin
//↑<MLXHAP>下記、字下げ。
                //cTitleField  .Add ('ｺｰﾄﾞ');
                cTitleField  .Add ('名称');
                cTitleField  .Add ('全銀協ｺｰﾄﾞ'		  	  );
                cTitleField  .Add ('全銀協銀行名称'		  );
                cTitleField  .Add ('全銀協銀行名称(ｶﾅ)'	  );
                cTitleField  .Add ('全銀協支店名称'		  );
                cTitleField  .Add ('全銀協支店名称(ｶﾅ)'	  );
                //cTitleField  .Add ('FB振込方法'			  );
    // <002> DEL start
    (*
                cTitleField  .Add ('FB半角ｺｰﾄﾞ体系'		  );
                cTitleField  .Add ('FBﾚｺｰﾄﾞ区切'		  );
                cTitleField  .Add ('FB支払ﾌｧｲﾙ名称'		  );
                cTitleField  .Add ('FB支払ﾎﾞﾘｭｰﾑ名称'	  );
    *)
    // <002> DEL end
                //cTitleField  .Add ('FB経費ﾌｧｲﾙ名称'		  );
                //cTitleField  .Add ('FB経費ﾎﾞﾘｭｰﾑ名称'	  );
                //cTitleField  .Add ('FB送信区分'			  );

    // <002> MOD start
    (*
                cTitleField  .Add ('手形ﾚｲｱｳﾄﾌｧｲﾙ名'	  );
                cTitleField  .Add ('手形文字種別'		  );
                cTitleField  .Add ('小切手ﾚｲｱｳﾄﾌｧｲﾙ名'	  );
                cTitleField  .Add ('小切手文字種別'		  );
    *)
                cTitleField  .Add ('手形ﾚｲｱｳﾄﾊﾟｽ'	  		);
                cTitleField  .Add ('手形金額文字種別'		);
                cTitleField  .Add ('小切手ﾚｲｱｳﾄﾊﾟｽ'	  		);
                cTitleField  .Add ('小切手金額文字種別'		);
    // <002> MOD end

                cTitleField  .Add ('割引依頼書ﾚｲｱｳﾄﾊﾟｽ'	  );
    // <005>↓↓
    //			cTitleField  .Add ('取立依頼書ﾚｲｱｳﾄﾊﾟｽ'	  );
                cTitleField  .Add ('取立依頼表ﾚｲｱｳﾄﾊﾟｽ'	  );
    // <005>↑↑
                cTitleField  .Add ('担保依頼差入証ﾚｲｱｳﾄﾊﾟｽ'	  );
                cTitleField  .Add ('組戻依頼書ﾚｲｱｳﾄﾊﾟｽ'	  );    // <005>Add
                cTitleField  .Add ('入金口座'	  );

    // <002> DEL start
    //			cTitleField  .Add ('個別手数料採用区分'	  );
    // <002> DEL end
// <012> ADD ↓
				// 外国送金情報はGaliNX-Iのみ
				if not TMSeries.IsGalileopt then
				begin
					cTitleField  .Add ('外国送金依頼人ｺｰﾄﾞ'		);
					cTitleField  .Add ('外国送金依頼人名称'		);
					cTitleField  .Add ('外国送金半角ｺｰﾄﾞ体系'	);
					cTitleField  .Add ('外国送金ﾚｺｰﾄﾞ区切'		);
					cTitleField  .Add ('外国送金支払ﾌｧｲﾙ名称'	);
				end;
// <012> ADD ↑
                //以降の手数料情報はML同様出力させない

                //cMemDataField.Add ('nBkCode'			);
                cMemDataField.Add ('strNameSimple'			);
                cMemDataField.Add ('strAllBankCd'			);
                cMemDataField.Add ('strAllBankCodeDesc'		);
                cMemDataField.Add ('strAllBankCodeDescKana'	);
                cMemDataField.Add ('strBranchCodeDesc'		);
                cMemDataField.Add ('strBranchCodeDescKana'	);
                //cMemDataField.Add ('strPayDivisionDesc'		);

    // <002> DEL start
    (*
                cMemDataField.Add ('strFBCodeModeDesc'		);
                cMemDataField.Add ('strRecordPauseDesc'		);
                cMemDataField.Add ('strFileName'			);
                cMemDataField.Add ('strVolumeName'			);
    *)
    // <002> DEL end

                //cMemDataField.Add ('strFileNameExp'			);
                //cMemDataField.Add ('strVolumeNameExp'		);
                //cMemDataField.Add ('strFBSendDivisionDesc'  );
                cMemDataField.Add ('strLayoutPathDraft'		);
                cMemDataField.Add ('strChaDivisionDraftDesc');
                cMemDataField.Add ('strLayoutPathCheck'		);
                cMemDataField.Add ('strChaDivisionCheckDesc');

                cMemDataField.Add ('BillLayPath1'		);
                cMemDataField.Add ('BillLayPath2'		);
                cMemDataField.Add ('BillLayPath3'		);
                cMemDataField.Add ('BillLayPath4'		);      // <005>Add
                cMemDataField.Add ('AccNo'		);

    // <002> DEL start
    //			cMemDataField.Add ('strFeeDivisionDesc'		);
    // <002> DEL end
// <012> ADD ↓
				// 外国送金情報はGaliNX-Iのみ
				if not TMSeries.IsGalileopt then
				begin
					cMemDataField.Add ('strSoukinClientCode'		);
					cMemDataField.Add ('strSoukinClientName'		);
					cMemDataField.Add ('strSoukinCodeModeDesc'		);
					cMemDataField.Add ('strSoukinRecordPauseDesc'	);
					cMemDataField.Add ('strSoukinFileName'			);
				end;
// <012> ADD ↑
//↓<MLXHAP>
			end;
//↑<MLXHAP>
		end;

		// -----<001> Add-St-----
		1:										// 依頼先口座登録ﾘｽﾄ
		begin
			cTitleField.Add('口座ｺｰﾄﾞ');
			cTitleField.Add('銀行ｺｰﾄﾞ');
			cTitleField.Add('銀行名称');
			cTitleField.Add('預金種目');
			cTitleField.Add('口座番号');
			cTitleField.Add('振込種別');
			cTitleField.Add('依頼書電信扱い');
			cTitleField.Add('取扱種目');
			cTitleField.Add('半角ｺｰﾄﾞ体系');
			cTitleField.Add('ﾚｺｰﾄﾞ区切');
			cTitleField.Add('支払ﾚｲｱｳﾄ');           // 支払レイアウト <009>
			cTitleField.Add('振込依頼人ｺｰﾄﾞ');
			cTitleField.Add('振込依頼人名');
			cTitleField.Add('ｶﾅ振込依頼人名');
			cTitleField.Add('ﾌｧｲﾙ名');
			cTitleField.Add('ﾎﾞﾘｭｰﾑ名');
			cTitleField.Add('手数料適用区分');
			cTitleField.Add('ｺｰﾄﾞ');				// 科目
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// 部門
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// ﾌﾟﾛｼﾞｪｸﾄ
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// 科目別補助
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// 補助1
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// 補助2
			cTitleField.Add('名称');
			cTitleField.Add('ｺｰﾄﾞ');				// ｾｸﾞﾒﾝﾄ
			cTitleField.Add('名称');
            cTitleField.Add('手数料支払区分');		// <006> Add
			cTitleField.Add('ﾌﾘｰ項目');             // フリー項目 <011>
// <013> ADD-STR
		    if not TMSeries.IsMjsLink3 and not TMSeries.IsGalileopt then
			begin
    			cTitleField.Add('メモ');            // 口座メモ
    			cTitleField.Add('総合振込出力方式');    // 総合振込出力方式 <014>
			end;
// <013> ADD-END


			cMemDataField.Add('AccCode');			// 口座ｺｰﾄﾞ
			cMemDataField.Add('BankCode');			// 銀行ｺｰﾄﾞ
			cMemDataField.Add('BankName');			// 銀行名称
			cMemDataField.Add('AccKbnName');		// 預金種目
			cMemDataField.Add('AccNo');				// 口座番号
			cMemDataField.Add('ShubetsuName');		// 振込種別
			cMemDataField.Add('RequestKbnName');	// 依頼書電信扱い
			cMemDataField.Add('ShumokuName');		// 取扱種目
			cMemDataField.Add('FBCodeModeName');	// 半角ｺｰﾄﾞ体系
			cMemDataField.Add('RecordPauseName');	// ﾚｺｰﾄﾞ区切
			cMemDataField.Add('LayoutInfo');        // 支払レイアウト <009>
			cMemDataField.Add('ClientCode');		// 振込依頼人ｺｰﾄﾞ
			cMemDataField.Add('AccInfo1');			// 振込依頼人名
			cMemDataField.Add('ClientName');		// ｶﾅ振込依頼人名
			cMemDataField.Add('FileName');			// ﾌｧｲﾙ名
			cMemDataField.Add('VolName');			// ﾎﾞﾘｭｰﾑ名
			cMemDataField.Add('FeeUseModeName');	// 手数料適用区分
			cMemDataField.Add('nKmkCode');			// 科目ｺｰﾄﾞ
			cMemDataField.Add('strKmkCodeDesc');	// 科目名称
			cMemDataField.Add('strHojCode02');		// 部門ｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc02');	// 部門名称
			cMemDataField.Add('strHojCode06');		// ﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc06');	// ﾌﾟﾛｼﾞｪｸﾄ名称
			cMemDataField.Add('strHojCode07');		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc07');	// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ名称
			cMemDataField.Add('strHojCode01');		// 科目別補助ｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc01');	// 科目別補助名称
			cMemDataField.Add('strHojCode04');		// 補助1ｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc04');	// 補助1名称
			cMemDataField.Add('strHojCode05');		// 補助2ｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc05');	// 補助2名称
			cMemDataField.Add('strHojCode03');		// ｾｸﾞﾒﾝﾄｺｰﾄﾞ
			cMemDataField.Add('strHojCodeDesc03');	// ｾｸﾞﾒﾝﾄ名称
            cMemDataField.Add('FeePayKbnName');		// 手数料支払区分 <006> Add
			cMemDataField.Add('AccInfo2');          // フリー項目 <011>
// <013> ADD-STR
		    if not TMSeries.IsMjsLink3 and not TMSeries.IsGalileopt then
			begin
    			cMemDataField.Add('AccMemo');       // 口座メモ
    			cMemDataField.Add('AccZanLimitName');  // 総合振込出力方式 <014>
			end;
// <013> ADD-END
			
		end;
		// -----<001> Add-Ed-----
	end;

    if ( MjsFileOut(dsMain.DataSet, cMemDataField, cTitleField, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    cTitleField.Free;
    cMemDataField.Free;

end;
//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP008002L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure  TDmJNTCRP008002L.fnInzPrint();
var
//	strFormatDate		:   String;
//	strFormatDateTime	:   String;

    wTppLabel           :   TppLabel;
//    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;

//    dqMasterInfo        : TMQuery;
//    strCaption          : String;

begin
{
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
		ParamByName('nMasterDivision').AsInteger    := 21; //銀行
		Open ();

		if not EOF then
        begin
            strCaption := GetFld ('JHojyoName').AsString;
    		if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then					// ｺｰﾄﾞ属性: 数字
	    	begin
		    	case uvHani.pvrPattern of
			    	Rep_Jituzai:    // 実在
				    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
    					CmnReportExtStandardBnkDBTextCode.Alignment	:= taRightJustify;
	    			end;
		    		Rep_Goukei:		// 合計
			    	begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
   	                	CmnReportTtlStandardBnkDBTextCode.Alignment	:= taRightJustify;
    				end;
	    			Rep_Kasan: 		// 加算
		    		begin
                        strCaption := GetFld ('JHojyoName').AsString + '加算登録リスト';
    	                CmnReportSystemDBTextCodeDst.Alignment	:= taRightJustify;
   	    	            CmnReportSystemDBTextCodeSrc.Alignment	:= taRightJustify;
    				end;
                    3:				// Seg/Bun
				    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText3.Alignment	:= taRightJustify;
	    			end;
	    		end;
		    end
    		else										   					// ｺｰﾄﾞ属性: 文字
	    	begin
		    	case uvHani.pvrPattern of
			    	Rep_Jituzai:    // 実在
    				begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
	    				CmnReportExtStandardBnkDBTextCode.Alignment	:= taLeftJustify;
		    		end;
		    		Rep_Goukei:		// 合計
				    begin
                        strCaption := '合計' + GetFld ('JHojyoName').AsString + '登録リスト';
                   		CmnReportTtlStandardBnkDBTextCode.Alignment	:= taLeftJustify;
	    			end;
	    			Rep_Kasan: 		// 加算
			    	begin
                        strCaption := GetFld ('JHojyoName').AsString + '加算登録リスト';
    	                CmnReportSystemDBTextCodeDst.Alignment	:= taLeftJustify;
   	    	            CmnReportSystemDBTextCodeSrc.Alignment	:= taLeftJustify;
    				end;
                    3:				// Seg/Bun
				    begin
                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
    					ppDBText3.Alignment	:= taLeftJustify;
	    			end;
	    		end;
		    end;
        end;

        Close();
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
        0:
        begin
            CmnReportExtStandardBnkDBTextAppDateStart.DisplayFormat	:= strFormatDate;
           	CmnReportExtStandardBnkDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
	        CmnReportExtStandardBnkDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;
        end;
        Rep_Goukei :  CmnReportTtlStandardBnkDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;
    end;
}
	// -----<001> Add-St-----
	wTppLabel := nil;
	wTppSystemVariable := nil;
	// -----<001> Add-Ed-----

    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
    case uvHani.pvrPattern of
//<MLXHAP>0:	wTppLabel   := CmnReportDetailLabelCorpCode;
//↓<MLXHAP>
		0:
		begin
            if TMSeries.IsMjsLink3 then
            begin
                // MLX給与は専用コンポーネント
                wTppLabel := CmnReportLabelCorpCode_MLXHAP;
            end
            else
            begin
                // MLX給与以外は既存コンポーネント
                wTppLabel   := CmnReportDetailLabelCorpCode;
            end;
		end;
//↑<MLXHAP>
		1:	wTppLabel	:= CmnReportAccountLabelCorpCode;		// <001>
    end;
    //wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
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
    case uvHani.pvrPattern of
//<MLXHAP>0:	wTppLabel   := CmnReportDetailLabelCorpName;
//↓<MLXHAP>
		0:
		begin
            if TMSeries.IsMjsLink3 then
            begin
                // MLX給与は専用コンポーネント
                wTppLabel   := CmnReportLabelCorpName_MLXHAP;
            end
            else
            begin
                // MLX給与以外は既存コンポーネント
                wTppLabel   := CmnReportDetailLabelCorpName;
            end;
		end;
//↑<MLXHAP>
		1:	wTppLabel	:= CmnReportAccountLabelCorpName;		// <001>
    end;
    //wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
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
    case uvHani.pvrPattern of
//<MLXHAP>0:	wTppSystemVariable   := CmnReportDetailSysVarDate;
//↓<MLXHAP>
		0:
		begin
            if TMSeries.IsMjsLink3 then
            begin
                // MLX給与は専用コンポーネント
                wTppSystemVariable   := CmnReportSysVarDate_MLXHAP;
            end
            else
            begin
                // MLX給与以外は既存コンポーネント
                wTppSystemVariable   := CmnReportDetailSysVarDate;
            end;
		end;
//↑<MLXHAP>
		1:	wTppSystemVariable   := CmnReportAccountSysVarDate	// <001>
    end;
    //wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
    PrnSupport.pDate	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left        := 10.773;
        Top         := 0;
        Width       := 2.52;
        Height      := 0.125;
        Alignment   := taRightJustify;
    end;
{
    // ﾀｲﾄﾙ
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
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
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
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
}

    // 頁
    case uvHani.pvrPattern of
//<MLXHAP>0:	wTppSystemVariable   := CmnReportDetailSysVarPage;
//↓<MLXHAP>
		0:
		begin
            if TMSeries.IsMjsLink3 then
            begin
                // MLX給与は専用コンポーネント
                wTppSystemVariable   := CmnReportSysVarPage_MLXHAP;
            end
            else
            begin
                // MLX給与以外は既存コンポーネント
                wTppSystemVariable   := CmnReportDetailSysVarPage;
            end;
		end;
//↑<MLXHAP>
		1:	wTppSystemVariable   := CmnReportAccountSysVarPage;		// <001>
    end;
    //wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
    PrnSupport.pPage	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left        := 6.4193;
        Top         := 0;
        Width       := 0.5;
        Height      := 0.125;
        Alignment   := taCenter;
    end;
// <012> ADD ↓
	// 外国送金情報、海外手数料関連はGaliNX-Iのみ印字する
	if (TMSeries.IsGalileopt) Then
	begin
		// 罫線の調整
		// 	横線
		CmnLineReportDetailDetailBand.Top := 1.7708;
		// 	縦線
		ppLine18.Height	:= 1.9166;
		ppLine21.Height	:= 1.9166;
		ppLine16.Height	:= 1.9166;
		ppLine1.Height	:= 1.9166 - ppLine1.Top;
		ppLine25.Height	:= 1.9166;
		ppLine26.Height	:= 1.9166;
		ppLine19.Height	:= 1.9166;
		ppLine49.Height	:= 0.1563;
		ppLine52.Height	:= 0.1563;
		ppLine57.Height	:= 0.3125;
		ppLine62.Height	:= 0.3125;
		ppLine61.Top	:= 1.75;
		ppLine61.Height	:= 0.1563;

		// 項目名、データ欄の移動
		//	適用開始日
		ppLabel132.Top	:= 1.7604;
		ppDBText108.Top	:= 1.7604;
		//	手形割引率
		ppLabel60.Top	:= 1.7604;
		ppDBText12.Top	:= 1.7604;
		ppLabel61.Top	:= 1.7604;

        // 使用しない罫線、項目名、データ欄を非表示
		//	外国送金情報関連
		ppLine55.Visible := false;
		ppLine65.Visible := false;
		ppLine66.Visible := false;
		ppLine67.Visible := false;
		ppLine68.Visible := false;
		ppLabel145.Visible := false;
		ppLabel146.Visible := false;
		ppLabel147.Visible := false;
		ppLabel148.Visible := false;
		ppLabel149.Visible := false;
		ppLabel150.Visible := false;
		ppDBText121.Visible := false;
		ppDBText122.Visible := false;
		ppDBText123.Visible := false;
		ppDBText124.Visible := false;
		ppDBText125.Visible := false;
		//	海外手数料関連
		ppLine63.Visible := false;
		ppLine64.Visible := false;
		ppLabel134.Visible := false;
		ppLabel137.Visible := false;
		ppLabel142.Visible := false;
		ppLabel140.Visible := false;
		ppLabel143.Visible := false;
		ppLabel141.Visible := false;
		ppLabel144.Visible := false;
		ppDBText118.Visible := false;
		ppDBText119.Visible := false;
		ppDBText120.Visible := false;

		// 明細欄の高さ調整
		CmnDetailBandDetail.Height := 1.9166;

		// 総合振込出力方式
        AccZanLimitLabel.Visible := false;
        AccZanLimitName.Visible := false;

	end;
// <012> ADD ↑
{
    // 会計会社(非表示?)
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern])));
    wTppLabel.Visible := False;
}
    // ﾌｧｲﾙ名
//  PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + '銀行登録リスト【依頼先銀行情報】' + '.csv';	// <001>
	// -----<001> Add-St-----
	case uvHani.pvrPattern of
		0:
		begin
			PrnSupport.strFileName := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + '依頼先銀行登録リスト' + '.csv';
		end;

		1:
		begin
			PrnSupport.strFileName := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + '依頼先口座登録リスト' + '.csv';
		end;
	end;
	// -----<001> Add-Ed-----
end;


procedure TDmJNTCRP008002L.CmnDetailBandDetailBeforeGenerate(
  Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (CmnDetailBandDetail.LastRecord) or
		(CmnDetailBandDetail.PageOutOfSpace = TRUE) Then
	begin
		if (CmnDetailBandDetail.OverFlow = FALSE) then
			CmnDetailBandDetail.OverFlow	:=	TRUE;

		if (CmnLineReportDetailDetailBand.ReprintOnOverFlow = FALSE) then
			CmnLineReportDetailDetailBand.ReprintOnOverFlow	:=	TRUE;

		CmnLineReportDetailDetailBand.Visible    :=	TRUE;
		CmnLineReportDetailDetailBand.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		CmnLineReportDetailDetailBand.Visible    :=	TRUE;
		CmnLineReportDetailDetailBand.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;

end;

// -----<001> Add-St-----
//**************************************************************************
//		Component	:	CmnDetailBandAccount
//						依頼先口座登録ﾘｽﾄ詳細ﾊﾞﾝﾄﾞ
//		Event		:	OnBeforeGenerate
//		Name		:	T.Seki
//**************************************************************************
procedure TDmJNTCRP008002L.CmnDetailBandAccountBeforeGenerate(
  Sender: TObject);
begin
	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if	(CmnDetailBandAccount.LastRecord) or (CmnDetailBandAccount.PageOutOfSpace) Then
	begin
		if	not CmnDetailBandAccount.OverFlow then
		begin
			CmnDetailBandAccount.OverFlow := True;
		end;

		if	not CmnLineReportAccountDetailBand.ReprintOnOverFlow then
		begin
			CmnLineReportAccountDetailBand.ReprintOnOverFlow := True;
		end;

		CmnLineReportAccountDetailBand.Weight := 0.75;	// ﾗｲﾝの太さを太くしている
	end
	else
	begin
		CmnLineReportAccountDetailBand.Weight := 0.25;	// ﾗｲﾝの太さを元にもどす
	end;



end;

//**************************************************************************
//		Component	:	CmnReportAccountDBText
//						補助ｺｰﾄﾞ共通
//		Event		:	OnPrint
//		Name		:	T.Seki
//**************************************************************************
procedure TDmJNTCRP008002L.CmnReportAccountDBTextHojCodePrint(
  Sender: TObject);
var
	iPosition: Integer;
begin
	iPosition := StrToInt(Copy(TppDBText(Sender).DataField, 11, 2));

												// 属性が数値の場合、右寄せにする
	if	dsMain.DataSet.FieldByName(Format('nCodeAttribute%.2d', [iPosition])).AsInteger <= 1 then
	begin
		TppDBText(Sender).Alignment	:= taRightJustify;
	end
	else										// 属性がﾌﾘｰの場合、左寄せにする
	begin
		TppDBText(Sender).Alignment := taLeftJustify;
	end;
end;
// -----<001> Add-Ed-----

//↓<MLXHAP>
//**************************************************************************
//		Component	:	CmnDetailBand_MLXHAP
//						【MLX給与】依頼先銀行登録ﾘｽﾄ詳細ﾊﾞﾝﾄﾞ
//		Event		:	OnBeforeGenerate
//**************************************************************************
procedure TDmJNTCRP008002L.CmnDetailBand_MLXHAPBeforeGenerate(
  Sender: TObject);
begin
	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if	(CmnDetailBand_MLXHAP.LastRecord) or (CmnDetailBand_MLXHAP.PageOutOfSpace) Then
	begin
		if	not CmnDetailBand_MLXHAP.OverFlow then
		begin
			CmnDetailBand_MLXHAP.OverFlow := True;
		end;

		if	not CmnLineReport_MLXHAPDetailBand.ReprintOnOverFlow then
		begin
			CmnLineReport_MLXHAPDetailBand.ReprintOnOverFlow := True;
		end;

		CmnLineReport_MLXHAPDetailBand.Weight := 0.75;	// ﾗｲﾝの太さを太くしている
	end
	else
	begin
		CmnLineReport_MLXHAPDetailBand.Weight := 0.25;	// ﾗｲﾝの太さを元にもどす
	end;
end;
//↑<MLXHAP>

end.

