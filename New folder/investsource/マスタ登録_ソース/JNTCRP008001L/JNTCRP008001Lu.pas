//=============================================================================
//
//      システム名  ：ＭＪＳＬＩＮＫ　ＦＸ
//      処理名      ：銀行補助登録(印刷処理)
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
//	<MLXDEP>岩田(NTC)2013/01/15		MLX固定資産・リース対応
//	<MLXDEP2>岩田(NTC)2013/06/13	更新日付を編集した日付を表示する。
//
//=============================================================================
unit JNTCRP008001Lu;
       
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

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP008001L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    CmnReportExtStandardBnk: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    ppLabel69: TppLabel;
    ppLine110: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppDetailBand0: TppDetailBand;
    ppStandardUnderLine0: TppLine;
    CmnReportExtStandardBnkDBTextCode: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    CmnReportExtStandardBnkDBTextAppDateStart: TppDBText;
    CmnReportExtStandardBnkDBTextAppDateEnd: TppDBText;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLine109: TppLine;
    CmnReportExtStandardBnkDBTextUpdateDate: TppDBText;
    ppFooterBand4: TppFooterBand;
    SVppPage0: TppSystemVariable;
    AccOffice0: TppLabel;
    CmnReportTtlStandardBnk: TppReport;
    ppHeaderBand8: TppHeaderBand;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    SVppDate1: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLine106: TppLine;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel110: TppLabel;
    ppLabel116: TppLabel;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    ppLine135: TppLine;
    ppDetailBand1: TppDetailBand;
    ppStandardUnderLine1: TppLine;
    CmnReportTtlStandardBnkDBTextCode: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppLine140: TppLine;
    ppLine143: TppLine;
    ppLine145: TppLine;
    ppLine146: TppLine;
    ppLine147: TppLine;
    ppLine158: TppLine;
    CmnReportTtlStandardBnkDBTextUpdateDate: TppDBText;
    ppDBImage4: TppDBImage;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand8: TppFooterBand;
    SVppPage1: TppSystemVariable;
    AccOffice1: TppLabel;
    CmnReportSystem: TppReport;
    ppHeaderBand11: TppHeaderBand;
    CorpCode2: TppLabel;
    CorpName2: TppLabel;
    LabelTitle2: TppLabel;
    LineTitle2: TppLine;
    SVppDate2: TppSystemVariable;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppLine19: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine18: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine119: TppLine;
    ppDetailBand2: TppDetailBand;
    CmnReportSystemDBTextCodeDst: TppDBText;
    CmnReportSystemDBTextNameSimpleDst: TppDBText;
    CmnReportSystemDBTextCodeSrc: TppDBText;
    ppDBText18: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppStandardUnderLine2: TppLine;
    CmnReportSystemLineDetailsTop: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand11: TppFooterBand;
    SVppPage2: TppSystemVariable;
    AccOffice2: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    CmnReportSegBun: TppReport;
    ppHeaderBand1: TppHeaderBand;
    CorpCode3: TppLabel;
    CorpName3: TppLabel;
    LabelTitle3: TppLabel;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLine6: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel9: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel10: TppLabel;
    ppLine14: TppLine;
    ppBun1: TppLabel;
    ppSeg1: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppBun2: TppLabel;
    ppSeg2: TppLabel;
    ppLine17: TppLine;
    ppBun3: TppLabel;
    ppSeg3: TppLabel;
    ppBun4: TppLabel;
    ppSeg4: TppLabel;
    ppLine23: TppLine;
    ppBun5: TppLabel;
    ppSeg5: TppLabel;
    ppLine24: TppLine;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine43: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
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
    ppDBText7: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppLine49: TppLine;
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
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine50: TppLine;
    ppFooterBand1: TppFooterBand;
    SVppPage3: TppSystemVariable;
    AccOffice3: TppLabel;
    CmnReportExtStandardBnk_DEP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    CorpCode0_DEP: TppLabel;
    CorpName0_DEP: TppLabel;
    LabelTitle0_DEP: TppLabel;
    LineTitle0_DEP: TppLine;
    SVppDate0_DEP: TppSystemVariable;
    ppDetailBand0_DEP: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    SVppPage0_DEP: TppSystemVariable;
    AccOffice0_DEP: TppLabel;
    ppLine5: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel23: TppLabel;
    ppLabel26: TppLabel;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLabel27: TppLabel;
    ppLine60: TppLine;
    ppLabel28: TppLabel;
    ppLine61: TppLine;
    ppStandardUnderLine0_DEP: TppLine;
    CmnReportExtStandardBnkDBTextCode_DEP: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine69: TppLine;
    CmnReportExtStandardBnkDBTextUpdateDate_DEP: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText45: TppDBText;
    ppLine71: TppLine;
    ppDBText46: TppDBText;
    ppLine72: TppLine;

	constructor     CreateModule                (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate            (Sender: TObject);
    procedure       DataModuleDestroy           (Sender: TObject);
    procedure       ppRepBeforePrint            (Sender: TObject);
    procedure       fnCmnReportSystemOnEndPage  (Sender: TObject);
    procedure       fnCmnReportSystemppDBTextExCodeDstOnPrint (Sender: TObject);
    procedure       fnCmnBeforeGenerate         (Sender: TObject);
    procedure ppDetailBand3BeforeGenerate(Sender: TObject);

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
    m_strExCodePrint:   String;
    sDEPHani	    :	String;             //<MLXDEP>

	procedure ppReport1FileOut          ();
    procedure fnInzPrint                ();

  public
    { Public 宣言 }
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
  DmJNTCRP008001L: TDmJNTCRP008001L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;

const
    Rep_Jituzai = 0;
    Rep_Goukei  = 1;
    Rep_Kasan   = 2;

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
	pFrm    :   ^TDmJNTCRP008001L;
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
				pFrm^   :=  TDmJNTCRP008001L.CreateModule( AOwner,pRec );
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
constructor TDmJNTCRP008001L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP008001L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP008001L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP008001L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP008001L.DoPrint(Para: TJNTHani; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys;JNTArea:TJNTCommon);
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

	sDEPHani := '';											//<MLXDEP>
    wRep := nil;
    case uvHani.pvrPattern of
//<MLXDEP>↓
//*     Rep_Jituzai : wRep := CmnReportExtStandardBnk;
	    Rep_Jituzai:
		begin
			if (TMSeries.IsMjsLink3) then
			begin
				wRep := CmnReportExtStandardBnk_DEP;
                sDEPHani := '_DEP';
			end
			else
				wRep := CmnReportExtStandardBnk;
		end;
//<MLXDEP>↑
        Rep_Goukei  : wRep := CmnReportTtlStandardBnk;
        Rep_Kasan   : wRep := CmnReportSystem;
        3		    : wRep := CmnReportSegBun;
    end;

	PrnSupport.ApRB				:= wRep;
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule	    := m_pMDataModule^;         // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)
//<001> start
	PrnSupport.pApRec			:= m_pRec;
//<001> end
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
            PDLG_FILE: ppReport1FileOut;
        end;
	end;

end;
//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP008001L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
    i		: Integer;
    tmpLabel	:	TppLabel;
begin
    tmpLabel := Nil;

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    case uvHani.pvrPattern of
        Rep_Jituzai:      //実在
        begin
            sTitle.Add('ｺｰﾄﾞ');
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');
            sTitle.Add('連想');
			sTitle.Add('全銀協コード');
			sTitle.Add('全銀協名');
			if not (TMSeries.IsMjsLink3) then	//<MLXDEP>
			begin                   	//<MLXDEP>
        	    sTitle.Add('適用開始');
	            sTitle.Add('適用終了');
			end;                    	//<MLXDEP>
            sTitle.Add('最終更新日時');

            sMemFld.Add('strExCode');
            sMemFld.Add('strName');
            sMemFld.Add('strNameSimple');
            sMemFld.Add('strAssociation');
            sMemFld.Add('AllBkCd');
   	        sMemFld.Add('AllBkNm');

			if not (TMSeries.IsMjsLink3) then	//<MLXDEP>
			begin                   	//<MLXDEP>
        	    sMemFld.Add('dtAppDateStart');
            	sMemFld.Add('dtAppDateEnd');
			end;						//<MLXDEP>
//<XXX>
			if not (TMSeries.IsMjsLink3) then
	            sMemFld.Add('dtUpdateDate')
			else
	            sMemFld.Add('dtUpdateDateDisp');
//<XXX>
        end;
        Rep_Goukei:       //合計
        begin
            sTitle.Add('ｺｰﾄﾞ');
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');
            sTitle.Add('連想');
            sTitle.Add('最終更新日時');

            sMemFld.Add('strExCode');
            sMemFld.Add('strName');
            sMemFld.Add('strNameSimple');
            sMemFld.Add('strAssociation');
            sMemFld.Add('dtUpdateDate');
        end;
        Rep_Kasan:        //加算体系
        begin
            sTitle.Add('加算先ｺｰﾄﾞ');
            sTitle.Add('加算先名称');
            sTitle.Add('加算元ｺｰﾄﾞ');
            sTitle.Add('加算元名称');

            sMemFld.Add('strExCodeDst');
            sMemFld.Add('strNameSimpleDst');
            sMemFld.Add('strExCodeSrc');
            sMemFld.Add('strNameSimpleSrc');
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
	                    tmpLabel := ppLabel14;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel15;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel16;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel17;
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
	                    tmpLabel := ppLabel18;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel19;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel20;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel21;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel22;
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
function  TDmJNTCRP008001L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;
//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure  TDmJNTCRP008001L.fnInzPrint();
var
	strFormatDate		:   String;
	strFormatDateTime	:   String;

    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;

    dqMasterInfo        : TMQuery;
    strCaption          : String;

    i			:	Integer;
    nSegAttrUseKbn  :   array[1..10] of Integer;
    tmpLabel	:	TppLabel;
    tmpCode		:	TppDBText;
    tmpName		:	TppDBText;
    
begin
    tmpCode  := Nil;
    tmpLabel := Nil;
    tmpName  := Nil;

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
//<MLXDEP>↓
                        if (TMSeries.IsMjsLink3) then
	                        strCaption := GetFld ('JHojyoName').AsString + '登録リスト'
						else
	                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
                        //strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
//<MLXDEP>↑
    					CmnReportExtStandardBnkDBTextCode.Alignment	:= taRightJustify;
    					CmnReportExtStandardBnkDBTextCode_DEP.Alignment	:= taRightJustify;	//<MLXDEP>
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
//<MLXDEP>↓
                        if (TMSeries.IsMjsLink3) then
	                        strCaption := GetFld ('JHojyoName').AsString + '登録リスト'
						else
	                        strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
                        //strCaption := '実在' + GetFld ('JHojyoName').AsString + '登録リスト';
//<MLXDEP>↑
	    				CmnReportExtStandardBnkDBTextCode.Alignment	:= taLeftJustify;
    					CmnReportExtStandardBnkDBTextCode_DEP.Alignment	:= taLeftJustify;	//<MLXDEP>
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

        // 分類・セグメント
        if uvHani.pvrPattern = 3 then
        begin
        	// セグメント
	        for i := 1 to 10 do
    	        nSegAttrUseKbn[i]   :=  0;
            Close();
            SQL.Clear();
            SQL.Add('SELECT * FROM SegMA            '
                +   'WHERE  (MasterKbn = :nMasKbn)  ');
            ParamByName('nMasKbn').AsInteger    :=  21;

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
                        tmpName	 := ppDBText7;
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
                        tmpCode	 := ppDBText8;
                        tmpName	 := ppDBText9;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel14;
                        tmpCode	 := ppDBText10;
                        tmpName	 := ppDBText13;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel15;
                        tmpCode	 := ppDBText21;
                        tmpName	 := ppDBText23;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel16;
                        tmpCode	 := ppDBText24;
                        tmpName	 := ppDBText25;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel17;
                        tmpCode	 := ppDBText26;
                        tmpName	 := ppDBText27;
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
	                    tmpLabel := ppLabel18;
                        tmpCode	 := ppDBText28;
                        tmpName	 := ppDBText29;
                    end;
					7:
                    begin
	                    tmpLabel := ppLabel19;
                        tmpCode	 := ppDBText30;
                        tmpName	 := ppDBText31;
                    end;
					8:
                    begin
	                    tmpLabel := ppLabel20;
                        tmpCode	 := ppDBText32;
                        tmpName	 := ppDBText33;
                    end;
					9:
                    begin
	                    tmpLabel := ppLabel21;
                        tmpCode	 := ppDBText34;
                        tmpName	 := ppDBText35;
                    end;
					10:
                    begin
	                    tmpLabel := ppLabel22;
                        tmpCode	 := ppDBText36;
                        tmpName	 := ppDBText37;
                    end;
				end;
		    	tmpLabel.Text := '';											// タイトル削除

		        Close();
    		    SQL.Clear();
				SQL.Add('SELECT JHojyoName, CodeDigit, CodeAttr, UseKbn FROM MasterInfo ');
				SQL.Add ('WHERE MasterKbn = :nMasterDivision');

				ParamByName ('nMasterDivision').AsInteger	:= i+520;
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

	sDEPHani := '';		//<MLXDEP>
    case uvHani.pvrPattern of
        Rep_Jituzai:
        begin
            CmnReportExtStandardBnkDBTextAppDateStart.DisplayFormat	:= strFormatDate;
           	CmnReportExtStandardBnkDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
	        CmnReportExtStandardBnkDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;
//<MLXDEP>↓
            if (TMSeries.IsMjsLink3) then
			begin
            	sDEPHani := '_DEP';
			end;
//<MLXDEP>↑
        end;
        Rep_Goukei :  CmnReportTtlStandardBnkDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;
    end;


    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
//<MLXDEP>↓
//* wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
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
//* wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
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
//* wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
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
//* wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
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
//* wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
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
//* wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
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
//* wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern])));
	wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('AccOffice%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑
    wTppLabel.Visible := False;

    // ﾌｧｲﾙ名
    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + strCaption + '.csv';

end;
//***************************************************************************************************/
//*																									*/
//*	目的	: 体系ﾘｽﾄ OnPrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//***************************************************************************************************/
procedure	TDmJNTCRP008001L.fnCmnReportSystemppDBTextExCodeDstOnPrint (Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;

begin
	cDBTextExCode	:= Sender as TppDBText;
	strExCode		:= cDBTextExCode.Text;

	if	(CompareStr (strExCode, m_strExCodePrint) = 0) then
	begin
		cDBTextExCode.Visible	:= False;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= False;
		CmnReportSystemLineDetailsTop     .Visible	:= False;
	end
	else
    begin
		cDBTextExCode.Visible	:= True;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= True;

		if	(m_strExCodePrint = '') then
			CmnReportSystemLineDetailsTop.Visible	:= False
		else
			CmnReportSystemLineDetailsTop.Visible	:= True;

		m_strExCodePrint	:= strExCode;
	end;
end;


procedure	TDmJNTCRP008001L.fnCmnReportSystemOnEndPage (Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;
//************************************************************************
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//************************************************************************
procedure TDmJNTCRP008001L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
begin

//<MLXDEP>↓
//* DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [uvHani.pvrPattern])));
//* DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvHani.pvrPattern])));
	DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [uvHani.pvrPattern]) + sDEPHani));
	DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvHani.pvrPattern]) + sDEPHani));
//<MLXDEP>↑

	// 最終レコード、頁の最下行を判定する関数の追加
	if (DtlBand.LastRecord) or
		(DtlBand.PageOutOfSpace = True) Then
	begin
		if (DtlBand.OverFlow = False) then
			DtlBand.OverFlow	:=	True;

		if (DtlBottomLine.ReprintOnOverFlow = False) then
			DtlBottomLine.ReprintOnOverFlow	:=	True;

        if uvHani.pvrPattern = Rep_Kasan then
    		DtlBottomLine.Visible    :=	True;

		DtlBottomLine.Weight	 :=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
        if uvHani.pvrPattern = Rep_Kasan then
    		DtlBottomLine.Visible    :=	False;

		DtlBottomLine.Weight     :=	0.25;	// ラインの太さを元にもどす
	end;
end;



procedure TDmJNTCRP008001L.ppDetailBand3BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand3.LastRecord) or
		(ppDetailBand3.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand3.OverFlow = FALSE) then
			ppDetailBand3.OverFlow	:=	TRUE;

		if (ppLine36.ReprintOnOverFlow = FALSE) then
			ppLine36.ReprintOnOverFlow	:=	TRUE;

		ppLine36.Visible    :=	TRUE;
		ppLine36.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppLine36.Visible    :=	TRUE;
		ppLine36.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

end.

