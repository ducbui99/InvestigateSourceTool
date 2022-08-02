//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：汎用補助登録(印刷処理)
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
//	<001> 斎藤		2008/05/22		JSOX印刷履歴対応
//
//=============================================================================
unit JNTCRP016000Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTCommonu,
  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP016000L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    CmnReportExtStandardGen: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine89: TppLine;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    CmnReportExtStandardGenLabelCorpCode: TppLabel;
    CmnReportExtStandardGenLabelCorpName: TppLabel;
    CmnReportExtStandardGenLabelTitle: TppLabel;
    CmnReportExtStandardGenLineTitle: TppLine;
    CmnReportExtStandardGenSysVarDate: TppSystemVariable;
    ppLabel102: TppLabel;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppDetailBand_StandardGen: TppDetailBand;
    ppStandardGenUnderLine: TppLine;
    CmnReportExtStandardGenDBTextCode: TppDBText;
    ppDBText92: TppDBText;
    ppDBText108: TppDBText;
    ppDBText115: TppDBText;
    CmnReportExtStandardGenDBTextAppDateStart: TppDBText;
    CmnReportExtStandardGenDBTextAppDateEnd: TppDBText;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine99: TppLine;
    CmnReportExtStandardGenDBTextUpdateDate: TppDBText;
    ppLine100: TppLine;
    ppFooterBand5: TppFooterBand;
    CmnReportExtStandardGenSysVarPage: TppSystemVariable;
    CmnReportExtStandardGenAccOffice: TppLabel;
    CmnPipelinePrintExtStandard: TppDBPipeline;
    CmnPipelinePrintExtStandardppField1: TppField;
    CmnPipelinePrintExtStandardppField2: TppField;
    CmnPipelinePrintExtStandardppField3: TppField;
    CmnPipelinePrintExtStandardppField4: TppField;
    CmnPipelinePrintExtStandardppField5: TppField;
    CmnPipelinePrintExtStandardppField6: TppField;
    CmnPipelinePrintExtStandardppField7: TppField;
    CmnPipelinePrintExtStandardppField8: TppField;
    CmnPipelinePrintExtStandardppField9: TppField;
    CmnPipelinePrintExtStandardppField10: TppField;
    CmnPipelinePrintExtStandardppField11: TppField;
    CmnPipelinePrintExtStandardppField12: TppField;
    CmnPipelinePrintExtStandardppField13: TppField;
    CmnPipelinePrintExtStandardppField14: TppField;
    CmnPipelinePrintExtStandardppField15: TppField;
    CmnPipelinePrintExtStandardppField16: TppField;
    CmnPipelinePrintExtStandardppField17: TppField;
    CmnPipelinePrintExtStandardppField18: TppField;
    CmnPipelinePrintExtStandardppField19: TppField;
    CmnPipelinePrintExtStandardppField20: TppField;
    CmnPipelinePrintExtStandardppField21: TppField;
    CmnPipelinePrintExtStandardppField22: TppField;
    CmnPipelinePrintExtStandardppField23: TppField;
    CmnPipelinePrintExtStandardppField24: TppField;
    CmnPipelinePrintExtStandardppField25: TppField;
    CmnPipelinePrintExtStandardppField26: TppField;
    CmnPipelinePrintTtlStandard: TppDBPipeline;
    CmnReportTtlStandard: TppReport;
    ppHeaderBand4: TppHeaderBand;
    CmnReportTtlStandardLabelCorpCode: TppLabel;
    CmnReportTtlStandardLabelCorpName: TppLabel;
    CmnReportTtlStandardLabelTitle: TppLabel;
    CmnReportTtlStandardLineTitle: TppLine;
    CmnReportTtlStandardSysVarDate: TppSystemVariable;
    ppLabel2: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppLine38: TppLine;
    ppLine64: TppLine;
    ppLine66: TppLine;
    ppLine1: TppLine;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel40: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppDetailBand_TtlStandard: TppDetailBand;
    ppTtlStandardUnderLine: TppLine;
    CmnReportTtlStandardDBTextCode: TppDBText;
    ppDBText29: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    CmnReportTtlStandardDBTextUpdateDate: TppDBText;
    ppDBImage3: TppDBImage;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    CmnReportTtlStandardSysVarPage: TppSystemVariable;
    CmnReportTtlStandardAccOffice: TppLabel;
    CmnReportSystem: TppReport;
    ppHeaderBand6: TppHeaderBand;
    CmnReportSystemLabelCorpCode: TppLabel;
    CmnReportSystemLabelCorpName: TppLabel;
    CmnReportSystemLabelTitle: TppLabel;
    CmnReportSystemLineTitle: TppLine;
    CmnReportSystemSysVarDate: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLine116: TppLine;
    ppLabel81: TppLabel;
    ppLabel83: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine36: TppLine;
    ppDetailBand_CmnReportSystem: TppDetailBand;
    CmnReportSystemppDBTextExCodeDst: TppDBText;
    CmnReportSystemppDBTextNameSimpleDst: TppDBText;
    CmnReportSystemppDBTextExCodeSrc: TppDBText;
    ppDBText136: TppDBText;
    ppLine121: TppLine;
    ppLine129: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    CmnReportSystemppLineDetailsBottom: TppLine;
    CmnReportSystemppLineDetailsTop: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand6: TppFooterBand;
    CmnReportSystemSysVarPage: TppSystemVariable;
    CmnReportSystemAccOffice: TppLabel;
    CmnPipelinePrintSystem: TppDBPipeline;
    ppDBImage1: TppDBImage;
    CmnPipelinePrintSegBun: TppDBPipeline;
    CmnReportSegBun: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel8: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel9: TppLabel;
    ppLine11: TppLine;
    ppBun1: TppLabel;
    ppSeg1: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppBun2: TppLabel;
    ppSeg2: TppLabel;
    ppLine16: TppLine;
    ppBun3: TppLabel;
    ppSeg3: TppLabel;
    ppBun4: TppLabel;
    ppSeg4: TppLabel;
    ppLine17: TppLine;
    ppBun5: TppLabel;
    ppSeg5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppDBBun1: TppDBText;
    ppDBSeg1: TppDBText;
    ppDBBun2: TppDBText;
    ppDBSeg2: TppDBText;
    ppDBBun3: TppDBText;
    ppDBSeg3: TppDBText;
    ppDBSeg4: TppDBText;
    ppDBBun4: TppDBText;
    ppDBBun5: TppDBText;
    ppDBSeg5: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLine30: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine45: TppLine;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       ppRepBeforePrint    (Sender: TObject);
    procedure ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);
    procedure CmnReportSystemEndPage(Sender: TObject);
    procedure ppDetailBand_TtlStandardBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_CmnReportSystemBeforeGenerate(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);

  private
    { Private 宣言 }
    m_cJNTArea      :   TJNTCommon;
	m_pRec          :   ^TMjsAppRecord;
	m_pMDataModule  :   ^TMDataModulef;
	m_pCommonArea   :   ^rcCOMMONAREA;	    // 共通ｴﾘｱ
	MJSPrnDlgf	    :	TMJSPrnDlgf;		// 印刷ﾀﾞｲｱﾛｸﾞ
	PrnSupport      :	TMjsPrnSupport;		// 印刷設定
    mjspre		    :	TMjsPreviewIF;		// ﾌﾟﾚﾋﾞｭｰ
	uvSelSys        :   TJNTSelCorpSys;     // 会社ｼｽﾃﾑ情報
    uvHani		    :	TJNTHani;           //
    Owner           :   TComponent;
	m_strExCodePrint:	String;
	PrintDivision	:	Integer;
    nMasterDivision :	Integer;
    nMasterCaption	:	String;
    NowCode			:	String;


    procedure   fnInzPrint();
	procedure 	ppReport1FileOut();

  public
    { Public 宣言 }
	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
	function  fnIsPreview   (): Boolean;
	procedure setMasterKbn	(iMasterKbn:Integer);

  end;

// { Exports関数宣言 } <PRN>
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
					    iMasterKbn  :   Integer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;
                     
var
  DmJNTCRP016000L: TDmJNTCRP016000L;

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
					    iMasterKbn  :   Integer;
						Mode		:   Integer;      //
                        PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
var
    i       :   Integer;                // ArHdlの添え字。
	pFrm    :   ^TDmJNTCRP016000L;
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
				pFrm^   :=  TDmJNTCRP016000L.CreateModule( AOwner,pRec );
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
			pFrm^.setMasterKbn(iMasterKbn);
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMd, PrtParam.CorpSys, PrtParam.JNTArea );
		end;
        2:
        begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
			pFrm^.setMasterKbn(iMasterKbn);
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
constructor TDmJNTCRP016000L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP016000L.setMasterKbn(iMasterKbn:Integer);
begin
    nMasterDivision := iMasterKbn;
end;

procedure TDmJNTCRP016000L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP016000L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP016000L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);


end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP016000L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i   :   Integer;
    strTitle : String;
begin

	uvHani      := Para;
	PrintDivision := uvHani.pvrPattern;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する

    //DataSourceの設定
    dsMain.DataSet := TargetMD;

    fnInzPrint();

    if (uvHani.pvrPattern = 0) then												// 実在リスト
	begin
		PrnSupport.ApRB			:= CmnReportExtStandardGen;
	    PrnSupport.pPage		:= CmnReportExtStandardGenSysVarPage;			// 頁
    	PrnSupport.pDate		:= CmnReportExtStandardGenSysVarDate;			// 日付
	    PrnSupport.pCorpCode	:= CmnReportExtStandardGenLabelCorpCode;		// 会社ｺｰﾄﾞ
    	PrnSupport.pCorpName	:= CmnReportExtStandardGenLabelCorpName;		// 会社名称
        strTitle := '実在' + nMasterCaption + '登録リスト';
		CmnReportExtStandardGenLabelTitle.Caption := strTitle;
    end
    else if (uvHani.pvrPattern = 1) then										// 合計リスト
	begin
		PrnSupport.ApRB			:= CmnReportTtlStandard;
	    PrnSupport.pPage		:= CmnReportTtlStandardSysVarPage;			    // 頁
    	PrnSupport.pDate		:= CmnReportTtlStandardSysVarDate;			    // 日付
	    PrnSupport.pCorpCode	:= CmnReportTtlStandardLabelCorpCode;		    // 会社ｺｰﾄﾞ
    	PrnSupport.pCorpName	:= CmnReportTtlStandardLabelCorpName;		    // 会社名称
        strTitle := '合計' + nMasterCaption + '登録リスト';
		CmnReportTtlStandardLabelTitle.Caption := strTitle;
    end
    else if (uvHani.pvrPattern = 2) then										// 加算リスト
	begin
		PrnSupport.ApRB			:= CmnReportSystem;
	    PrnSupport.pPage		:= CmnReportSystemSysVarPage;			    	// 頁
    	PrnSupport.pDate		:= CmnReportSystemSysVarDate;			    	// 日付
	    PrnSupport.pCorpCode	:= CmnReportSystemLabelCorpCode;		    	// 会社ｺｰﾄﾞ
    	PrnSupport.pCorpName	:= CmnReportSystemLabelCorpName;		    	// 会社名称
        strTitle := nMasterCaption + '加算登録リスト';
		CmnReportSystemLabelTitle.Caption := strTitle;
    end
    else if (uvHani.pvrPattern = 3) then										// 加算リスト
	begin
		PrnSupport.ApRB			:= CmnReportSegBun;
	    PrnSupport.pPage		:= ppSystemVariable2;			    	// 頁
    	PrnSupport.pDate		:= ppSystemVariable1;			    	// 日付
	    PrnSupport.pCorpCode	:= ppLabel1;		    	// 会社ｺｰﾄﾞ
    	PrnSupport.pCorpName	:= ppLabel3;		    	// 会社名称
        strTitle := '実在' + nMasterCaption + '登録リスト';
		ppLabel4.Caption := strTitle;
    end;
	PrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';
    PrnSupport.strDocName		:= uvHani.pvrRepTitle;	    //
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<001> start
	PrnSupport.pApRec			:= m_pRec;
//<001> end
	PrnSupport.MdataModule	:=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)

    if (m_cJNTArea.IsExtract = False)  then				// 050822 hirota
	PrnSupport.iDspFileBtn	:= 0 						// 抽出権限なし→ファイル出力非表示
	else
	PrnSupport.iDspFileBtn	:= 1; 						// 抽出権限あり→ファイル出力表示
//	PrnSupport.iReportID		:= uvHani.pvrGrpNO;         // 帳票ｸﾞﾙｰﾌﾟNO


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
{
        // SQLをｾｯﾄ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW,
            PDLG_FILE:
        end;
}
    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, nil);
            PDLG_FILE: ppReport1FileOut;
        end;
	end;
end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP016000L.fnInzPrint();
var
    DmqDTMAIN   :   TMQuery;
    i			:	Integer;
    nSegAttrUseKbn  :   array[1..10] of Integer;
    tmpLabel	:	TppLabel;
    tmpCode		:	TppDBText;
    tmpName		:	TppDBText;
//    m_YearKbn	:	Integer;
begin
    NowCode := '';		// 加算体系用

    tmpCode  := Nil;
    tmpLabel := Nil;
    tmpName  := Nil;

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
//            m_YearKbn := GetFLD('YearKbn').AsInteger;

            //	適用開始・終了の和暦/西暦設定
			case GetFLD('YearKbn').AsInteger of
				0:	//	和暦
				begin
                    //	印刷での適用開始・終了の設定
					case PrintDivision of
						0:														// 実在
						begin
							CmnReportExtStandardGenDBTextAppDateStart.DisplayFormat   := 'ee/mm/dd';					//	適用開始
							CmnReportExtStandardGenDBTextAppDateEnd.DisplayFormat     := 'ee/mm/dd';					//	適用終了
							CmnReportExtStandardGenDBTextUpdateDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
                        end;
						1:														// 合計
						begin
		                    CmnReportTtlStandardDBTextUpdateDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
						end;
						3:														// セグメント・分類
						begin
		                    ppDBText3.DisplayFormat := 'ee/mm/dd';		//	適用開始
		                    ppDBText4.DisplayFormat := 'ee/mm/dd';		//	適用終了
						end;

					end;
				end;
                1:	//	西暦
				begin
                    //	印刷での適用開始・終了の設定
					case PrintDivision of
						0:														// 実在
						begin
							CmnReportExtStandardGenDBTextAppDateStart.DisplayFormat   := 'yy/mm/dd';			//	適用開始
							CmnReportExtStandardGenDBTextAppDateEnd.DisplayFormat     := 'yy/mm/dd';			//	適用終了
							CmnReportExtStandardGenDBTextUpdateDate.DisplayFormat := 'yy/mm/dd hh:mm:ss';	//	最終更新日時
                        end;
						1:														// 合計
						begin
		                    CmnReportTtlStandardDBTextUpdateDate.DisplayFormat := 'yy/mm/dd hh:mm:ss';	//	最終更新日時
						end;
						3:														// セグメント・分類
						begin
		                    ppDBText3.DisplayFormat := 'yy/mm/dd';		//	適用開始
		                    ppDBText4.DisplayFormat := 'yy/mm/dd';		//	適用終了
						end;
					end;
				end;
            end;
        end
        else
        begin
            //	印刷での適用開始・終了の設定
			case PrintDivision of
				0:														// 実在
				begin
					CmnReportExtStandardGenDBTextAppDateStart.DisplayFormat   := 'ee/mm/dd';					//	適用開始
					CmnReportExtStandardGenDBTextAppDateEnd.DisplayFormat     := 'ee/mm/dd';					//	適用終了
					CmnReportExtStandardGenDBTextUpdateDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
                end;
				1:														// 合計
				begin
		            CmnReportTtlStandardDBTextUpdateDate.DisplayFormat := 'ee/mm/dd hh:mm:ss';	//	最終更新日時
                end;
				3:														// セグメント・分類
				begin
                    ppDBText3.DisplayFormat := 'ee/mm/dd';		//	適用開始
                    ppDBText4.DisplayFormat := 'ee/mm/dd';		//	適用終了
				end;
            end;
        end;

        Close();
    end;

    with DmqDTMAIN do
    begin
        Close();
        SQL.Clear();
		SQL.Add('SELECT JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQL.Add ('WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

        Open();

        if ( EOF <> TRUE ) then
		begin
			nMasterCaption   := GetFld ('JHojyoName').AsString;		// 補助名称(実在)
			if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then						// ｺｰﾄﾞ属性: 数字
			begin
				case PrintDivision of
					0:														// 実在
					begin
						CmnReportExtStandardGenDBTextCode.Alignment	:= taRightJustify;
					end;
					1:														// 合計
					begin
    	            	CmnReportTtlStandardDBTextCode.Alignment	:= taRightJustify;
					end;
					2:														// 加算
					begin
	    	            CmnReportSystemppDBTextExCodeDst.Alignment	:= taRightJustify;
    	    	        CmnReportSystemppDBTextExCodeSrc.Alignment	:= taRightJustify;
					end;
					3:														// セグメント・分類
					begin
	    	            ppDBText1.Alignment	:= taRightJustify;
					end;
				end;
			end
			else																// ｺｰﾄﾞ属性: 文字
			begin
				case PrintDivision of
					0:														// 実在
					begin
						CmnReportExtStandardGenDBTextCode.Alignment	:= taLeftJustify;
					end;
					1:														// 合計
					begin
                		CmnReportTtlStandardDBTextCode.Alignment	:= taLeftJustify;
					end;
					2:														// 加算
					begin
		                CmnReportSystemppDBTextExCodeDst.Alignment	:= taLeftJustify;
    		            CmnReportSystemppDBTextExCodeSrc.Alignment	:= taLeftJustify;
					end;
					3:														// セグメント・分類
					begin
	    	            ppDBText1.Alignment	:= taLeftJustify;
					end;
				end;
			end;
	    end;

        // 分類・セグメント
        if PrintDivision = 3 then
        begin
        	// セグメント
	        for i := 1 to 10 do
    	        nSegAttrUseKbn[i]   :=  0;
            Close();
            SQL.Clear();
            SQL.Add('SELECT * FROM SegMA            '
                +   'WHERE  (MasterKbn = :nMasKbn)  ');
            ParamByName('nMasKbn').AsInteger    :=  nMasterDivision;

            Open();

            if ( not EOF ) then
            begin
                nSegAttrUseKbn[1]   :=  GetFld('SegUse1').AsInteger;
                nSegAttrUseKbn[2]   :=  GetFld('SegUse2').AsInteger;
                nSegAttrUseKbn[3]   :=  GetFld('SegUse3').AsInteger;
                nSegAttrUseKbn[4]   :=  GetFld('SegUse4').AsInteger;
                nSegAttrUseKbn[5]   :=  GetFld('SegUse5').AsInteger;
                nSegAttrUseKbn[6]   :=  GetFld('SegUse6').AsInteger;
                nSegAttrUseKbn[7]   :=  GetFld('SegUse7').AsInteger;
                nSegAttrUseKbn[8]   :=  GetFld('SegUse8').AsInteger;
                nSegAttrUseKbn[9]   :=  GetFld('SegUse9').AsInteger;
                nSegAttrUseKbn[10]  :=  GetFld('SegUse10').AsInteger;
            end;

            for i:=1 to 10 do
            begin
				case (i) of
					1:
                    begin
	                    tmpLabel := ppSeg1;
                        tmpCode	 := ppDBSeg1;
                        tmpName	 := ppDBText12;
                    end;
					2:
                    begin
	                    tmpLabel := ppSeg2;
                        tmpCode	 := ppDBSeg2;
                        tmpName	 := ppDBText15;
                    end;
					3:
                    begin
	                    tmpLabel := ppSeg3;
                        tmpCode	 := ppDBSeg3;
                        tmpName	 := ppDBText17;
                    end;
					4:
                    begin
	                    tmpLabel := ppSeg4;
                        tmpCode	 := ppDBSeg4;
                        tmpName	 := ppDBText18;
                    end;
					5:
                    begin
	                    tmpLabel := ppSeg5;
                        tmpCode	 := ppDBSeg5;
                        tmpName	 := ppDBText20;
                    end;
					6:
                    begin
	                    tmpLabel := ppLabel11;
                        tmpCode	 := ppDBText5;
                        tmpName	 := ppDBText6;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel12;
                        tmpCode	 := ppDBText7;
                        tmpName	 := ppDBText8;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel13;
                        tmpCode	 := ppDBText9;
                        tmpName	 := ppDBText10;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel14;
                        tmpCode	 := ppDBText13;
                        tmpName	 := ppDBText21;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel15;
                        tmpCode	 := ppDBText23;
                        tmpName	 := ppDBText24;
                    end;
				end;
		    	tmpLabel.Text := '';											// タイトル削除

            	if nSegAttrUseKbn[i] = 0 then		// 採用なし
                begin
					tmpCode.Visible := False;		// 表示しない
					tmpName.Visible := False;		// 表示しない
					continue;
                end;
		        Close();
    		    SQL.Clear();
				SQL.Add('SELECT JHojyoName, CodeDigit, CodeAttr, UseKbn FROM MasterInfo ');
				SQL.Add ('WHERE MasterKbn = :nMasterDivision');

				ParamByName ('nMasterDivision').AsInteger	:= 100+i;

    	    	Open();

	    	    if ( EOF <> TRUE ) then
				begin
                	if GetFld ('UseKbn'  ).AsInteger = 0 then	// 採用なし
	                begin
						tmpCode.Visible := False;		// 表示しない
						tmpName.Visible := False;		// 表示しない
						continue;
                	end;
					tmpCode.Visible := True;		// 表示
					tmpName.Visible := True;		// 表示
					tmpLabel.Text   := GetFld ('JHojyoName').AsString;		// 補助名称(実在)
					if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then			// ｺｰﾄﾞ属性: 数字
						TmpCode.Alignment	:= taRightJustify
                    else
						TmpCode.Alignment	:= taLeftJustify;
		        end;
	        end;

        	// 分類
            for i:=1 to 10 do
            begin
				case (i) of
					1:
                    begin
	                    tmpLabel := ppBun1;
                        tmpCode	 := ppDBBun1;
                        tmpName	 := ppDBText11;
                    end;
					2:
                    begin
	                    tmpLabel := ppBun2;
                        tmpCode	 := ppDBBun2;
                        tmpName	 := ppDBText14;
                    end;
					3:
                    begin
	                    tmpLabel := ppBun3;
                        tmpCode	 := ppDBBun3;
                        tmpName	 := ppDBText16;
                    end;
					4:
                    begin
	                    tmpLabel := ppBun4;
                        tmpCode	 := ppDBBun4;
                        tmpName	 := ppDBText19;
                    end;
					5:
                    begin
	                    tmpLabel := ppBun5;
                        tmpCode	 := ppDBBun5;
                        tmpName	 := ppDBText22;
                    end;
					6:
                    begin
	                    tmpLabel := ppLabel16;
                        tmpCode	 := ppDBText25;
                        tmpName	 := ppDBText26;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel17;
                        tmpCode	 := ppDBText27;
                        tmpName	 := ppDBText28;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel18;
                        tmpCode	 := ppDBText30;
                        tmpName	 := ppDBText31;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel19;
                        tmpCode	 := ppDBText32;
                        tmpName	 := ppDBText35;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel21;
                        tmpCode	 := ppDBText36;
                        tmpName	 := ppDBText37;
                    end;
				end;
		    	tmpLabel.Text := '';											// タイトル削除

		        Close();
    		    SQL.Clear();
				SQL.Add('SELECT JHojyoName, CodeDigit, CodeAttr, UseKbn FROM MasterInfo ');
				SQL.Add ('WHERE MasterKbn = :nMasterDivision');

				ParamByName ('nMasterDivision').AsInteger	:= i+540+(nMasterDivision - 31) * 10;
    	    	Open();

	    	    if ( EOF <> TRUE ) then
				begin
                	if GetFld ('UseKbn'  ).AsInteger = 0 then	// 採用なし
	                begin
						tmpCode.Visible := False;		// 表示しない
						tmpName.Visible := False;		// 表示しない
						continue;
                	end;
					tmpCode.Visible := True;		// 表示
					tmpName.Visible := True;		// 表示
					tmpLabel.Text   := GetFld ('JHojyoName').AsString;		// 補助名称(実在)
					if	(GetFld ('CodeAttr'  ).AsInteger <= 1) then			// ｺｰﾄﾞ属性: 数字
						TmpCode.Alignment	:= taRightJustify
                    else
						TmpCode.Alignment	:= taLeftJustify;
		        end;
	        end;
        end;

        Close();
    end;

    DmqDTMAIN.Close();
    DmqDTMAIN.Free();

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP016000L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
    i			:	Integer;
    tmpLabel	:	TppLabel;
begin
    tmpLabel := Nil;

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

	case PrintDivision of														// 実在
		0:
		begin
			sTitle.Add	('コード'			    	);
			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);
			sTitle.Add	('適用期間開始'				);
			sTitle.Add	('適用期間終了'				);
			sTitle.Add	('最終更新日時'				);

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);
			sMemFld.Add	('dtAppDateStart'			);
			sMemFld.Add	('dtAppDateEnd'				);
			sMemFld.Add	('dtUpdateDate'				);
		end;

		1:
		begin
			sTitle.Add	('コード'					);
			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);
			sTitle.Add	('最終更新日時'				);

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);
			sMemFld.Add	('dtUpdateDate'				);
		end;

		2:
		begin
			sTitle.Add	('加算先ｺｰﾄﾞ'				);
			sTitle.Add	('加算先名称'				);
			sTitle.Add	('加算元ｺｰﾄﾞ'				);
			sTitle.Add	('加算元名称'				);
			sMemFld.Add	('strExCodeDst'				);
			sMemFld.Add	('strNameSimpleDst'			);
			sMemFld.Add	('strExCodeSrc'				);
			sMemFld.Add	('strNameSimpleSrc'			);
		end;

		3:
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
					1:
                    begin
	                    tmpLabel := ppSeg1;
                    end;
					2:
                    begin
	                    tmpLabel := ppSeg2;
                    end;
					3:
                    begin
	                    tmpLabel := ppSeg3;
                    end;
					4:
                    begin
	                    tmpLabel := ppSeg4;
                    end;
					5:
                    begin
	                    tmpLabel := ppSeg5;
                    end;
					6:
                    begin
	                    tmpLabel := ppLabel11;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel12;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel13;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel14;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel15;
                    end;
				end;

				if tmpLabel.Text <> '' then
                begin
					sTitle.Add	(tmpLabel.Text + 'コード');
					sMemFld.Add	('strSeg' + Format('%.2d', [i]) + 'Code');
					sTitle.Add	(tmpLabel.Text + '名称');
					sMemFld.Add	('strSeg' + Format('%.2d', [i]) + 'Name');
                end;
			end;

            for i:=1 to 10 do
            begin
				case (i) of
					1:
                    begin
	                    tmpLabel := ppBun1;
                    end;
					2:
                    begin
	                    tmpLabel := ppBun2;
                    end;
					3:
                    begin
	                    tmpLabel := ppBun3;
                    end;
					4:
                    begin
	                    tmpLabel := ppBun4;
                    end;
					5:
                    begin
	                    tmpLabel := ppBun5;
                    end;
					6:
                    begin
	                    tmpLabel := ppLabel16;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel17;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel18;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel19;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel21;
                    end;
				end;

				if tmpLabel.Text <> '' then
                begin
					sTitle.Add	(tmpLabel.Text + 'コード');
					sMemFld.Add	('strBun' + Format('%.2d', [i]) + 'Code');
					sTitle.Add	(tmpLabel.Text + '名称');
					sMemFld.Add	('strBun' + Format('%.2d', [i]) + 'Name');
                end;
			end;
		end;
	end;

//    if MjsFileOutMain(qryMain, sMemFld, sTitle, PrnSupport, True ) = -1 then
    if MjsFileOut(dsMain.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 then
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
function  TDmJNTCRP016000L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardGen ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TDmJNTCRP016000L.ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardGen.LastRecord) or
		(ppDetailBand_StandardGen.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardGen.OverFlow = FALSE) then
			ppDetailBand_StandardGen.OverFlow	:=	TRUE;

		if (ppStandardGenUnderLine.ReprintOnOverFlow = FALSE) then
			ppStandardGenUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppStandardGenUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardGenUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TDmJNTCRP016000L.CmnReportSystemEndPage(Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardGen ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TDmJNTCRP016000L.ppDetailBand_TtlStandardBeforeGenerate(
  Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandard.LastRecord) or
		(ppDetailBand_TtlStandard.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_TtlStandard.OverFlow = FALSE) then
			ppDetailBand_TtlStandard.OverFlow	:=	TRUE;

		if (ppTtlStandardUnderLine.ReprintOnOverFlow = FALSE) then
			ppTtlStandardUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppTtlStandardUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardGen ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TDmJNTCRP016000L.ppDetailBand_CmnReportSystemBeforeGenerate(
  Sender: TObject);
begin
	// １行前と同じコードだったら
	if dsMain.DataSet.FieldByName('strExCodeDst').AsString = NowCode then
    begin
    	// 親は表示しない
    	CmnReportSystemppDBTextExCodeDst.Visible := False;
    	CmnReportSystemppDBTextNameSimpleDst.Visible := False;
        // 上の線も表示しない
        CmnReportSystemppLineDetailsTop.Visible := False;
    end
    else
    begin
    	// 親を表示する
    	CmnReportSystemppDBTextExCodeDst.Visible := True;
    	CmnReportSystemppDBTextNameSimpleDst.Visible := True;
        // 上の線も表示する
        CmnReportSystemppLineDetailsTop.Visible := True;
    end;
    NowCode := dsMain.DataSet.FieldByName('strExCodeDst').AsString;

	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_CmnReportSystem.LastRecord) or
		(ppDetailBand_CmnReportSystem.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_CmnReportSystem.OverFlow = FALSE) then
			ppDetailBand_CmnReportSystem.OverFlow	:=	TRUE;

		if (CmnReportSystemppLineDetailsBottom.ReprintOnOverFlow = FALSE) then
			CmnReportSystemppLineDetailsBottom.ReprintOnOverFlow	:=	TRUE;

		CmnReportSystemppLineDetailsBottom.Visible    :=	TRUE;
		CmnReportSystemppLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
        NowCode := '';		// 次のページの頭は必ず親も表示
	end
	else
	begin
		CmnReportSystemppLineDetailsBottom.Visible    :=	FALSE;
		CmnReportSystemppLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TDmJNTCRP016000L.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand1.LastRecord) or
		(ppDetailBand1.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand1.OverFlow = FALSE) then
			ppDetailBand1.OverFlow	:=	TRUE;

		if (ppLine28.ReprintOnOverFlow = FALSE) then
			ppLine28.ReprintOnOverFlow	:=	TRUE;

		ppLine28.Visible    :=	TRUE;
		ppLine28.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppLine28.Visible    :=	TRUE;
		ppLine28.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

end.

