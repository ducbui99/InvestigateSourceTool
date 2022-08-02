//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    手形情報(印刷処理)
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
//  <001>   大竹 文顕   2008.06.06(FRI) 印刷履歴更新対応。
//  <002>   PRIME加藤   2012.08.03(FRI) モジュール別ロール対応
//  <003>   PRIME加藤   2014.01.15(WED) 取引先コード16桁対応(Formのみ) コードを広げて基本情報のパーツを右にずらした
//  <004>   Y.Icihashi  2014.08.26      印刷のタイトルを「実在取引先登録リスト」を「取引先登録リスト」に変更
//
//=============================================================================
unit JNTCRP004008Lu;
                   
interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTAuthorityu,						   	// <002>
  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  dxmdaset, JNTCommonu, ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004008L = class(TDataModule)
    ppReportShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
    LppCorpCode1: TppLabel;
    LppCorpName1: TppLabel;
    ppReportShosaiJLabelTitle: TppLabel;
    ppReportShosaiJLineTitle: TppLine;
    SVppDate1: TppSystemVariable;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppDetailBand_StandardGen: TppDetailBand;
    ppReportShosaiJDBTextCode: TppDBText;
    ppDBText92: TppDBText;
    ppDBText108: TppDBText;
    ppDBText115: TppDBText;
    ppLine93: TppLine;
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    DataSourceShosaiJ: TDataSource;
    ppBDEPipelineShosaiJ: TppDBPipeline;
    ppLine12: TppLine;
    ppLabel12: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine3: TppLine;
    ppDBText16: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine4: TppLine;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText10: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       CmnReportExtStandardGenBeforePrint    (Sender: TObject);
    procedure ppReportShosaiJBeforePrint(Sender: TObject);
    procedure ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);

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
    JNTAuthority	:	TJNTAuthority;		// <002> ADD

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
  DmJNTCRP004008L: TDmJNTCRP004008L;

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
	pFrm    :   ^TDmJNTCRP004008L;
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
				pFrm^   :=  TDmJNTCRP004008L.CreateModule( AOwner,pRec );
                pFrm^.JNTAuthority := TJNTAuthority(ArHdl[0]^);	// <002> ADD
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
constructor TDmJNTCRP004008L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004008L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP004008L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004008L.CmnReportExtStandardGenBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004008L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i   :   Integer;
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

    if ( uvHani.pvrPattern = 0 ) then
    begin
        // DataSourceの設定
        DataSourceShosaiJ.DataSet := TargetMD;

	    PrnSupport.ApRB				:=  ppReportShosaiJ;
        PrnSupport.strDocName		:=  uvHani.pvrRepTitle;	        //
        PrnSupport.pPage			:=  SVppPage1;			        // 頁
        PrnSupport.pDate			:=  SVppDate1;			        // 日付
        PrnSupport.pCorpCode		:=  LppCorpCode1;		        // 会社ｺｰﾄﾞ
        PrnSupport.pCorpName		:=  LppCorpName1;		        // 会社名称
        PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot +
                                        'tmp\' + uvHani.pvrRepTitle + '.csv';
    end;

    PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
    PrnSupport.MdataModule	    :=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
// <002> MOD start
//    if ( m_cJNTArea.IsExtract = FALSE )  then
	if ( JNTAuthority.IsExtract = FALSE )  then
// <002> MOD end
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
   	    PrnSupport.iDspFileBtn	:=  1;

    PrnSupport.pApRec           := m_pRec;                      // <001>

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
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE:      ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004008L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin
    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    if ( uvHani.pvrPattern = 0 ) then
    begin
        sTitle.Add('取引先コード');
        sTitle.Add('連想');
        sTitle.Add('正式名称');
        sTitle.Add('簡略名称');
        sTitle.Add('手形ランク');
        sTitle.Add('適用期間（自）');
        sTitle.Add('適用期間（至）');
        sTitle.Add('更新日時');
        sTitle.Add('支払場所１');
        sTitle.Add('支払場所２');
        sTitle.Add('支払場所３');
        sTitle.Add('振出人１');
        sTitle.Add('振出人２');
        sTitle.Add('振出人３');
        sTitle.Add('振出人４');
        sTitle.Add('振出人５');

        sMemFld.Add('GCode');		//取引先コード
        sMemFld.Add('Renso');		//連想
        sMemFld.Add('Nm');		    //正式名称
        sMemFld.Add('Nmk');		    //簡略名称
        sMemFld.Add('TgtRnk');		//手形ランク
        sMemFld.Add('TStartDate');	//適用期間（自）
        sMemFld.Add('TEndDate');	//適用期間（至）
        sMemFld.Add('UpdDateTm');	//更新日時
        sMemFld.Add('Paybash1');	//支払場所１
        sMemFld.Add('Paybash2');	//支払場所２
        sMemFld.Add('Paybash3');	//支払場所３
        sMemFld.Add('Furi1');   	//振出人１
        sMemFld.Add('Furi2');   	//振出人２
        sMemFld.Add('Furi3');   	//振出人３
        sMemFld.Add('Furi4');   	//振出人４
        sMemFld.Add('Furi5');   	//振出人５
    end;


    if ( MjsFileOut(DataSourceShosaiJ.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
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
function  TDmJNTCRP004008L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

procedure TDmJNTCRP004008L.ppReportShosaiJBeforePrint(Sender: TObject);
begin
    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

	// 得意先コード属性
	if uvSelSys.GetTkCdZs = 2 then								// 文字の場合は左
    begin
    	ppReportShosaiJDBTextCode.Alignment := taLeftJustify;	// 得意先
	end
    else														// 数字の場合は右
    begin
    	ppReportShosaiJDBTextCode.Alignment := taRightJustify;	// 得意先
    end;

end;

procedure TDmJNTCRP004008L.ppDetailBand_StandardGenBeforeGenerate(
  Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardGen.LastRecord) or
		(ppDetailBand_StandardGen.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardGen.OverFlow = False) then
			ppDetailBand_StandardGen.OverFlow	:=	True;

		if (ppLine5.ReprintOnOverFlow = False) then
			ppLine5.ReprintOnOverFlow	:=	True;

		ppLine5.Weight	 :=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppLine5.Weight     :=	0.25;	// ラインの太さを元にもどす
	end;
end;

end.

