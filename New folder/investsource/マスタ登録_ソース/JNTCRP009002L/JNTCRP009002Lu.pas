//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目
//                    資金繰科目/タイトル科目/要約BS科目
//                    要約PL科目/固定変動科目(印刷処理)
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
//  <PRN>   茂木 勇次   2005.10.06(THU) 印刷機能の実装。
//  <   >   加藤(PRIME) 2006.01.10(THU) RenCharをRensoに修正
//  <001>   加藤(PRIME) 2006.02.22(WED) ﾀｲﾄﾙ科目のﾌｧｲﾙ出力項目修正
//	<002>	斎藤		2008.05.22(THU)	JSOX印刷履歴対応
//	<003>	黒田 祐生	2011.06.13(MON)	他の処理でプレビュー中にプレビューを起動するとエラーとして表示される点を修正
//
//=============================================================================
unit JNTCRP009002Lu;

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
  ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP009002L = class(TDataModule)
    ds_SHIKIN: TDataSource;
    ppBDE_SHIKIN: TppDBPipeline;
    ppRep_SHIKIN: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel1: TppLabel;
    ppCorpName_SHIKIN: TppLabel;
    ppCorpCode_SHIKIN: TppLabel;
    ppDate_SHIKIN: TppSystemVariable;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine21: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppFooterBand1: TppFooterBand;
    ppPage_SHIKIN: TppSystemVariable;
    ppAccOffice_SHIKIN: TppLabel;
    dxMD_SHIKIN: TdxMemData;
    dxMD_SHIKINGCode: TIntegerField;
    dxMD_SHIKINRenChar: TStringField;
    dxMD_SHIKINLongName: TStringField;
    dxMD_SHIKINSimpleName: TStringField;
    dxMD_SHIKINDcKbnCode: TIntegerField;
    dxMD_SHIKINDcKbnName: TStringField;
    dxMD_SHIKINAnalyzeCode: TIntegerField;
    dxMD_SHIKINAnalyzeName: TStringField;
    dxMD_SHIKINDecoKbnCode: TIntegerField;
    dxMD_SHIKINDecoKbnName: TStringField;
    ppRep_Title: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppCorpName_Title: TppLabel;
    ppCorpCode_Title: TppLabel;
    ppDate_Title: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppLine22: TppLine;
    ppLabel18: TppLabel;
    ppLine23: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLine32: TppLine;
    ppFooterBand2: TppFooterBand;
    ppPage_Title: TppSystemVariable;
    ppAccOffice_Title: TppLabel;
    ppBDETitle: TppDBPipeline;
    ds_Title: TDataSource;
    dxMD_Title: TdxMemData;
    dxMD_TitleGCode: TIntegerField;
    dxMD_TitleRenChar: TStringField;
    dxMD_TitleLongName: TStringField;
    dxMD_TitleSimpleName: TStringField;
    dxMD_TitleDecoKbnCode: TIntegerField;
    dxMD_TitleDecoKbnName: TStringField;
    dxMD_TitleTitleKbnCode: TIntegerField;
    dxMD_TitleTitleKbnName: TStringField;
    dxMD_TitleConnectCode: TIntegerField;
    dxMD_TitleConnectName: TStringField;
    dxMD_TitleMinusName: TStringField;
    ppRep_YOBS: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppCorpName_YoBs: TppLabel;
    ppCorpCode_YoBs: TppLabel;
    ppDate_YoBs: TppSystemVariable;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppFooterBand3: TppFooterBand;
    ppPage_YoBs: TppSystemVariable;
    ppAccOffice_YoBs: TppLabel;
    ppBDE_YOBS: TppDBPipeline;
    dxMD_YOBS: TdxMemData;
    dxMD_YOBSGCode: TIntegerField;
    dxMD_YOBSRenChar: TStringField;
    dxMD_YOBSLongName: TStringField;
    dxMD_YOBSSimpleName: TStringField;
    dxMD_YOBSDecoKbnCode: TIntegerField;
    dxMD_YOBSDecoKbnName: TStringField;
    ds_YOBS: TDataSource;
    dxMD_YOPL: TdxMemData;
    dxMD_YOPLGCode: TIntegerField;
    dxMD_YOPLRenChar: TStringField;
    dxMD_YOPLLongName: TStringField;
    dxMD_YOPLSimpleName: TStringField;
    dxMD_YOPLDecoKbnCode: TIntegerField;
    dxMD_YOPLDecoKbnName: TStringField;
    ppBDEP_YOPL: TppDBPipeline;
    ppRep_YOPL: TppReport;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppCorpName_YoPl: TppLabel;
    ppCorpCode_YoPl: TppLabel;
    ppDate_YoPl: TppSystemVariable;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppFooterBand4: TppFooterBand;
    ppPage_YoPl: TppSystemVariable;
    ppAccOffice_YoPl: TppLabel;
    ds_YOPL: TDataSource;
    dxMD_KOTEI: TdxMemData;
    dxMD_KOTEIGCode: TIntegerField;
    dxMD_KOTEIRenChar: TStringField;
    dxMD_KOTEILongName: TStringField;
    dxMD_KOTEISimpleName: TStringField;
    dxMD_KOTEIDecoKbnCode: TIntegerField;
    dxMD_KOTEIDecoKbnName: TStringField;
    dxMD_KOTEIKmkKbnCode: TIntegerField;
    dxMD_KOTEIKmkKbnName: TStringField;
    ppBDE_KOTEI: TppDBPipeline;
    ppRep_KOTEI: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppCorpName_Kotei: TppLabel;
    ppCorpCode_Kotei: TppLabel;
    ppDate_Kotei: TppSystemVariable;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLabel35: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppPage_Kotei: TppSystemVariable;
    ppAccOffice_Kotei: TppLabel;
    ds_KOTEI: TDataSource;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;

	constructor     CreateModule                    (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate                (Sender: TObject);
    procedure       DataModuleDestroy               (Sender: TObject);
    procedure       ppRepBeforePrint                (Sender: TObject);
    procedure       ppDetailBand1BeforeGenerate     (Sender: TObject);
    procedure ppDetailBand2BeforeGenerate(Sender: TObject);
    procedure ppDetailBand3BeforeGenerate(Sender: TObject);
    procedure ppDetailBand4BeforeGenerate(Sender: TObject);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);

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
    m_iRekiKbn	    :   Integer;

	procedure ppReport1FileOut();
    procedure GetCorpKbn    (TargetQry: TMQuery);

  public
    { Public 宣言 }
	procedure DoPrint       (Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata; TargetInt: Integer;
                             CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
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
  DmJNTCRP009002L: TDmJNTCRP009002L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

const
    SELECT_SHIKINGURI   =   0;			// 資金繰科目
    SELECT_TITLE		=   1;			// ﾀｲﾄﾙ科目
    SELECT_YOUYAKUBS	=   2;			// 要約B/S科目
    SELECT_YOUYAKUPL	=   3;			// 要約P/L科目
    SELECT_KOTEIHNDO    =   4;          // 固定変動科目

var
    uvSELECTION :   Integer;

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
	pFrm    :   ^TDmJNTCRP009002L;
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
				pFrm^   :=  TDmJNTCRP009002L.CreateModule( AOwner,pRec );
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.TargetInt,
                           PrtParam.CorpSys, PrtParam.JNTArea );
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
constructor TDmJNTCRP009002L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP009002L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP009002L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.DoPrint(Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata; TargetInt: Integer;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i           :   Integer;
    strTitle    :   String;
begin

    uvSELECTION := TargetInt;
	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する


    ds_SHIKIN.DataSet   :=  nil;

    case uvSELECTION of
        // -----------------------
        //      資金繰科目
        // -----------------------
        SELECT_SHIKINGURI:
        begin
            // DataSourceの設定
            ds_SHIKIN.DataSet           := TargetMD;

            PrnSupport.ApRB				:= ppRep_SHIKIN;
            PrnSupport.strDocName		:= ('資金繰科目登録リスト');
            PrnSupport.pPage			:= ppPage_SHIKIN;
            PrnSupport.pDate			:= ppDate_SHIKIN;
            PrnSupport.pCorpCode		:= ppCorpCode_SHIKIN;
            PrnSupport.pCorpName		:= ppCorpName_SHIKIN;
            PrnSupport.pAccountOffice	:= ppAccOffice_SHIKIN;
            PrnSupport.iReportID		:= 990100;
        	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
			PrnSupport.pApRec			:= m_pRec;
//<002> end
            strTitle                    := '資金繰科目チェックリスト';
            PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

        	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
            PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
        end;
        // -----------------------
        //      ﾀｲﾄﾙ科目
        // -----------------------
        SELECT_TITLE:
        begin
            // DataSourceの設定
            ds_Title.DataSet            := TargetMD;

            PrnSupport.ApRB				:= ppRep_Title;
            PrnSupport.strDocName		:= ('タイトル科目登録リスト');
            PrnSupport.pPage			:= ppPage_Title;
            PrnSupport.pDate			:= ppDate_Title;
            PrnSupport.pCorpCode		:= ppCorpCode_Title;
            PrnSupport.pCorpName		:= ppCorpName_Title;
            PrnSupport.pAccountOffice	:= ppAccOffice_Title;
            PrnSupport.iReportID		:= 990100;
        	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
			PrnSupport.pApRec			:= m_pRec;
//<002> end
            strTitle                    := 'タイトル科目登録リスト';
            PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

        	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
            PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
        end;
        // -----------------------
        //      要約B/S科目
        // -----------------------
        SELECT_YOUYAKUBS:
        begin
            // DataSourceの設定
            ds_YOBS.DataSet             := TargetMD;

            PrnSupport.ApRB				:= ppRep_YOBS;
            PrnSupport.strDocName		:= ('要約ＢＳ科目登録リスト');
            PrnSupport.pPage			:= ppPage_YoBs;
            PrnSupport.pDate			:= ppDate_YoBs;
            PrnSupport.pCorpCode		:= ppCorpCode_YoBs;
            PrnSupport.pCorpName		:= ppCorpName_YoBs;
            PrnSupport.pAccountOffice	:= ppAccOffice_YoBs;
            PrnSupport.iReportID		:= 990100;
        	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
			PrnSupport.pApRec			:= m_pRec;
//<002> end
            strTitle                    := '要約ＢＳ科目登録リスト';
            PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

        	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
            PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
        end;
        // -----------------------
        //      要約P/L科目
        // -----------------------
        SELECT_YOUYAKUPL:
        begin
            // DataSourceの設定
            ds_YOPL.DataSet             := TargetMD;

            PrnSupport.ApRB				:= ppRep_YOPL;
            PrnSupport.strDocName		:= ('要約ＰＬ科目登録リスト');
            PrnSupport.pPage			:= ppPage_YoPl;
            PrnSupport.pDate			:= ppDate_YoPl;
            PrnSupport.pCorpCode		:= ppCorpCode_YoPl;
            PrnSupport.pCorpName		:= ppCorpName_YoPl;
            PrnSupport.pAccountOffice	:= ppAccOffice_YoPl;
            PrnSupport.iReportID		:= 990100;
        	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
			PrnSupport.pApRec			:= m_pRec;
//<002> end
            strTitle                    := '要約ＰＬ科目登録リスト';
            PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

        	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
            PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
        end;
        // -----------------------
        //      固定変動科目
        // -----------------------
        SELECT_KOTEIHNDO:
        begin
            // DataSourceの設定
            ds_KOTEI.DataSet            := TargetMD;

            PrnSupport.ApRB				:= ppRep_KOTEI;
            PrnSupport.strDocName		:= ('固定変動科目登録リスト');
            PrnSupport.pPage			:= ppPage_Kotei;
            PrnSupport.pDate			:= ppDate_Kotei;
            PrnSupport.pCorpCode		:= ppCorpCode_Kotei;
            PrnSupport.pCorpName		:= ppCorpName_Kotei;
            PrnSupport.pAccountOffice	:= ppAccOffice_Kotei;
            PrnSupport.iReportID		:= 990100;
        	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
			PrnSupport.pApRec			:= m_pRec;
//<002> end
            strTitle                    := '固定変動科目登録リスト';
            PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

        	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
            PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
        end;
    end;

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

    m_iRekiKbn  :=  0;
    GetCorpKbn(TargetQry);
    PrnSupport.iCalendarKbn	:=	m_iRekiKbn + 1;	//　暦区分

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

	if ( i > 0 ) then
	begin
    	// 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
    	if ( mjspre.IsExistPreview ) and
           ( PrnSupport.iCommand = PDLG_PREVIEW ) then
        begin
			MessageBeep(MB_OK);
		// <003>MOD↓
		//	MjsMessageBox(Owner,'他のプログラムでプレビューが起動中です。', mjError, mjDefOk);
			MjsMessageBox(Owner,'他の処理でプレビューが起動しています。'+#13#10+
								'他のプレビューを終了してください。',mjInformation, mjDefOk);
		// <003>MOD↑
           Exit;
        end;

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE: ppReport1FileOut();
        end;
	end;

end;

//------------------------------------------------------------------------------
//  法人区分の取得
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.GetCorpKbn(TargetQry: TMQuery);
begin


    with TargetQry do
    begin
	    Close();
        SQL.Clear();
        SQL.Add('SELECT YearKbn FROM DTMAIN ');
        Open();

        if ( EOF = FALSE ) then
    		m_iRekiKbn  :=  GetFld('YearKbn').AsInteger;
    end;

    TargetQry.Close();

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    case uvSELECTION of
        // -----------------------
        //      資金繰科目
        // -----------------------
        SELECT_SHIKINGURI:
        begin
            sTitle.Add('コード');
            sTitle.Add('連想シンボル');
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');
            sTitle.Add('正残区分');
            sTitle.Add('正残名称');
            sTitle.Add('分析コード');
            sTitle.Add('分析名称');
            sTitle.Add('装飾区分');
            sTitle.Add('装飾');

            sMemFld.Add('GCode');
            sMemFld.Add('Renso');
            sMemFld.Add('LongName');
            sMemFld.Add('SimpleName');
            sMemFld.Add('DcKbnCode');
            sMemFld.Add('DcKbnName');
            sMemFld.Add('AnalyzeCode');
            sMemFld.Add('AnalyzeName');
            sMemFld.Add('DecoKbnCode');
            sMemFld.Add('DecoKbnName');

            if ( MjsFileOut(ds_SHIKIN.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
            begin
               MessageBeep(MB_OK);
               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
            end;
        end;
        // -----------------------
        //      ﾀｲﾄﾙ科目
        // -----------------------
        SELECT_TITLE:
        begin
            sTitle.Add('コード');
            sTitle.Add('連想シンボル');
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');
            sTitle.Add('装飾区分');
            sTitle.Add('装飾');
//            sTitle.Add('タイトル種別');       // <001>
//            sTitle.Add('タイトル種別名称');   // <001>
            sTitle.Add('連動科目コード');
            sTitle.Add('連動科目名称');
            sTitle.Add('マイナス変換科目名称');

            sMemFld.Add('GCode');
            sMemFld.Add('Renso');
            sMemFld.Add('LongName');
            sMemFld.Add('SimpleName');
            sMemFld.Add('DecoKbnCode');
            sMemFld.Add('DecoKbnName');
//            sMemFld.Add('TitleKbnCode');      // <001>
//            sMemFld.Add('TitleKbnName');      // <001>
            sMemFld.Add('ConnectCode');
            sMemFld.Add('ConnectName');
            sMemFld.Add('MinusName');

            if ( MjsFileOut(ds_Title.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
            begin
               MessageBeep(MB_OK);
               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
            end;
        end;
        // -----------------------
        //      要約B/S科目
        // -----------------------
        SELECT_YOUYAKUBS:
        begin
            sTitle.Add('コード');
        	sTitle.Add('連想シンボル');
        	sTitle.Add('正式名称');
        	sTitle.Add('簡略名称');
        	sTitle.Add('装飾区分');
        	sTitle.Add('装飾');

        	sMemFld.Add('GCode');
        	sMemFld.Add('Renso');
        	sMemFld.Add('LongName');
        	sMemFld.Add('SimpleName');
        	sMemFld.Add('DecoKbnCode');
        	sMemFld.Add('DecoKbnName');

            if ( MjsFileOut(ds_YOBS.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
            begin
               MessageBeep(MB_OK);
               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
            end;
        end;
        // -----------------------
        //      要約P/L科目
        // -----------------------
        SELECT_YOUYAKUPL:
        begin
            sTitle.Add('コード');
        	sTitle.Add('連想シンボル');
        	sTitle.Add('正式名称');
        	sTitle.Add('簡略名称');
        	sTitle.Add('装飾区分');
        	sTitle.Add('装飾');

        	sMemFld.Add('GCode');
        	sMemFld.Add('Renso');
        	sMemFld.Add('LongName');
        	sMemFld.Add('SimpleName');
        	sMemFld.Add('DecoKbnCode');
        	sMemFld.Add('DecoKbnName');

            if ( MjsFileOut(ds_YOPL.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
            begin
               MessageBeep(MB_OK);
               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
            end;
        end;
        // -----------------------
        //      固定変動科目
        // -----------------------
        SELECT_KOTEIHNDO:
        begin
            sTitle.Add('コード');
        	sTitle.Add('連想シンボル');
        	sTitle.Add('正式名称');
        	sTitle.Add('簡略名称');
        	sTitle.Add('装飾区分');
        	sTitle.Add('装飾');
        	sTitle.Add('優先区分');
        	sTitle.Add('優先名称');

        	sMemFld.Add('GCode');
        	sMemFld.Add('Renso');
        	sMemFld.Add('LongName');
        	sMemFld.Add('SimpleName');
        	sMemFld.Add('DecoKbnCode');
        	sMemFld.Add('DecoKbnName');
        	sMemFld.Add('KmkKbnCode');
        	sMemFld.Add('KmkKbnName');

            if ( MjsFileOut(ds_KOTEI.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
            begin
               MessageBeep(MB_OK);
               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
            end;
        end;
    end;

    sTitle.Free();
    sMemFld.Free();

end;

//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP009002L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//  資金繰科目 DetailBand BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppDetailBand1BeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand1.LastRecord ) or
       ( ppDetailBand1.PageOutOfSpace = TRUE ) then
	begin
		if ( ppDetailBand1.OverFlow = FALSE ) then
			ppDetailBand1.OverFlow      :=  TRUE;
		if ( ppLine11.ReprintOnOverFlow = FALSE ) then
			ppLine11.ReprintOnOverFlow  :=  TRUE;
        // ﾗｲﾝの太さを太くしている
		ppLine11.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppLine11.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//  ﾀｲﾄﾙ科目 DetailBand BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppDetailBand2BeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand2.LastRecord ) or
       ( ppDetailBand2.PageOutOfSpace = TRUE ) then
	begin
		if ( ppDetailBand2.OverFlow = FALSE ) then
			ppDetailBand2.OverFlow      :=  TRUE;
		if ( ppLine24.ReprintOnOverFlow = FALSE ) then
			ppLine24.ReprintOnOverFlow  :=  TRUE;
        // ﾗｲﾝの太さを太くしている
		ppLine24.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppLine24.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//  要約BS科目 DetailBand BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppDetailBand3BeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand3.LastRecord ) or
       ( ppDetailBand3.PageOutOfSpace = TRUE ) then
	begin
		if ( ppDetailBand3.OverFlow = FALSE ) then
			ppDetailBand3.OverFlow      :=  TRUE;
		if ( ppLine38.ReprintOnOverFlow = FALSE ) then
			ppLine38.ReprintOnOverFlow  :=  TRUE;
        // ﾗｲﾝの太さを太くしている
		ppLine38.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppLine38.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//  要約PL科目 DetailBand BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppDetailBand4BeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand4.LastRecord ) or
       ( ppDetailBand4.PageOutOfSpace = TRUE ) then
	begin
		if ( ppDetailBand4.OverFlow = FALSE ) then
			ppDetailBand4.OverFlow      :=  TRUE;
		if ( ppLine50.ReprintOnOverFlow = FALSE ) then
			ppLine50.ReprintOnOverFlow  :=  TRUE;
        // ﾗｲﾝの太さを太くしている
		ppLine50.Weight :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppLine50.Weight :=  0.25;
	end;

end;

//------------------------------------------------------------------------------
//  固定変動科目 DetailBand BeforeGenerate
//------------------------------------------------------------------------------
procedure TDmJNTCRP009002L.ppDetailBand5BeforeGenerate(Sender: TObject);
begin

    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( ppDetailBand5.LastRecord ) or
       ( ppDetailBand5.PageOutOfSpace = TRUE ) then
	begin
		if ( ppDetailBand5.OverFlow = FALSE ) then
			ppDetailBand5.OverFlow      :=  TRUE;
		if ( ppLine63.ReprintOnOverFlow = FALSE ) then
			ppLine63.ReprintOnOverFlow  :=  TRUE;
        // ﾗｲﾝの太さを太くしている
		ppLine63.Weight :=  0.75; 
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppLine63.Weight :=  0.25;
	end;
    
end;

end.

