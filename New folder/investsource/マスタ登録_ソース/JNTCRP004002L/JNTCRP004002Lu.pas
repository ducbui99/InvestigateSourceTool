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
//  <002>   飯塚 健介   2006/01/12(THU) 【CSV出力】ﾀｲﾄﾙ：電話番号１→電話番号に修正。
//  <003>   飯塚 健介   2006/01/12(THU) 【CSV出力】項目：適用期間を出力しないように修正。
//  <004>   大竹 文顕   2008/02/21(THU) リスク区分の追加
//  <005>   大竹 文顕   2008.06.06(FRI) 印刷履歴更新対応。
//----Ver4.09 / NX-Ⅰ5.02
//  <Authority> 小川 哲央   2012/07/13(FRI) サブモジュールの権限管理対応
//----Ver4.11 / NX-Ⅰ5.04
//  <006> 	槇野 誠		2013/07/22(MON) H26消費税率改正対応。プロパティのみの変更。
//  <007> 	槇野 誠		2014/01/20(MON) 取引先16桁対応。プロパティのみの変更。
//----NX-Ⅰ5.17
//  <008>	蔦 光洋		2020/05/13(THU) グループ会社管理＿取引先登録対応
//=============================================================================
unit JNTCRP004002Lu;
                   
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
  dxmdaset, JNTCommonu
  ,JNTAuthorityu, ppDesignLayer, ppParameter;  // <Authority> ADD

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004002L = class(TDataModule)
    ppReportShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLine73: TppLine;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
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
    ppReportShosaiJDBTextCode: TppDBText;
    ppDBText92: TppDBText;
    ppDBText108: TppDBText;
    ppDBText115: TppDBText;
    ppLine93: TppLine;
    ppLine97: TppLine;
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppDBText24: TppDBText;
    ppLine6: TppLine;
    DataSourceShosaiJ: TDataSource;
    ppBDEPipelineShosaiJ: TppDBPipeline;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText40: TppDBText;
    ppLine12: TppLine;
    ppLabel3: TppLabel;
    ppLabel12: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText32: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
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
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLine7: TppLine;
    ppLabel35: TppLabel;
    ppLabel38: TppLabel;
    ppLabel1: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText20: TppDBText;
    ppDBText14: TppDBText;
    ppLabel4: TppLabel;
    ppDBText15: TppDBText;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLine4: TppLine;
    ppLine8: TppLine;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText22: TppDBText;
    LblLiskKbn1: TppLabel;
    LblLiskKbn2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel20: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;

	constructor     CreateModule                            (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy                       (Sender: TObject);
    procedure       CmnReportExtStandardGenBeforePrint      (Sender: TObject);
    procedure       ppReportShosaiJBeforePrint              (Sender: TObject);
    procedure       ppDetailBand_StandardGenBeforeGenerate  (Sender: TObject);

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
    m_bFlag         :   Boolean;//<008>add

	procedure ppReport1FileOut();

  public
    { Public 宣言 }
    JntAuthority : TJNTAuthority;  // <Authority> ADD
//	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);//<008>del
	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon; iTarget:Integer);//<008>add
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
  DmJNTCRP004002L: TDmJNTCRP004002L;

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
	pFrm    :   ^TDmJNTCRP004002L;
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
				pFrm^   :=  TDmJNTCRP004002L.CreateModule( AOwner,pRec );
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
//			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea);
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea, PrtParam.TargetInt);//<008>add
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
constructor TDmJNTCRP004002L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004002L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004002L.CmnReportExtStandardGenBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
//procedure TDmJNTCRP004002L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
//                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);//<008>dell
procedure TDmJNTCRP004002L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon; iTarget:Integer);//<008>add
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
    
//<008>add st
    if iTarget = 0 then
        m_bFlag := false
    else
        m_bFlag := True;
//<008>add end

    if ( uvHani.pvrPattern = 0 ) then
    begin
        // DataSourceの設定
        DataSourceShosaiJ.DataSet := TargetMD;
        
//<008>add st
        if (m_bFlag = False) then
        begin
            ppLabel10.Visible := False;
            ppLabel20.Visible := False;
        end;
//<008>add end

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
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
//<Authority> DEL    if ( m_cJNTArea.IsExtract = FALSE )  then
    if ( JntAuthority.IsExtract = FALSE )  then  //<Authority> ADD
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

    PrnSupport.pApRec           := m_pRec;                       // <005>

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
procedure TDmJNTCRP004002L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    sTitle.Add('取引先コード');
    sTitle.Add('取引先分類');
    sTitle.Add('連想');
    sTitle.Add('簡略名称');
    sTitle.Add('正式名称');
    sTitle.Add('郵便番号（基番）');
    sTitle.Add('郵便番号（枝番）');
    sTitle.Add('住所上段');
    sTitle.Add('住所下段');
//<001>    sTitle.Add('電話番号１');
    sTitle.Add('電話番号');             //<001>
    sTitle.Add('送付先部署名');
    sTitle.Add('担当者名');
    sTitle.Add('敬称');
    sTitle.Add('担当者メールアドレス');
    sTitle.Add('得意先借方資金繰コード');
    sTitle.Add('得意先借方資金繰名称');
    sTitle.Add('得意先貸方資金繰コード');
    sTitle.Add('得意先貸方資金繰名称');
    sTitle.Add('仕入先借方資金繰コード');
    sTitle.Add('仕入先借方資金繰名称');
    sTitle.Add('仕入先貸方資金繰コード');
    sTitle.Add('仕入先貸方資金繰名称');
    sTitle.Add('売上消費税コード');
    sTitle.Add('売上消費税名称');
    sTitle.Add('仕入消費税コード');
    sTitle.Add('仕入消費税名称');
//<004>
    if (not DataSourceShosaiJ.DataSet.FieldByName ('RiskKbn').IsNull ) then
    begin
        sTitle.Add('リスク区分');
        sTitle.Add('リスク区分名称');
    end;
//<002>    sTitle.Add('適用期間（開始）');
//<002>    sTitle.Add('適用期間（終了）');
    sTitle.Add('更新日');

//<008>add st
    if (m_bFlag = True) then
    begin
        sTitle.Add('グループ会社コード');
        sTitle.Add('会社簡略名称');
    end;
//<008>add end

    sMemFld.Add('GCode');		    //取引先コード
    sMemFld.Add('BunCode');		    //取引先分類
    sMemFld.Add('Renso');		    //連想
    sMemFld.Add('Nmk');	                    //簡略名称
    sMemFld.Add('Nm');		            //正式名称
    sMemFld.Add('PostNo1');		    //郵便番号（基番）
    sMemFld.Add('PostNo2');		    //郵便番号（枝番）
    sMemFld.Add('Ads1');		    //住所上段
    sMemFld.Add('Ads2');		    //住所下段
    sMemFld.Add('Tel1');		    //電話番号１
    sMemFld.Add('SectNm');		    //送付先部署名
    sMemFld.Add('TanNm');		    //担当者名
    sMemFld.Add('Keisyo');		    //敬称
    sMemFld.Add('Mail');		    //担当者メールアドレス
    sMemFld.Add('TDebitCashCd');    //得意先借方資金繰コード
    sMemFld.Add('TDebitCashNm');    //得意先借方資金繰名称
    sMemFld.Add('TCreditCashCd');   //得意先貸方資金繰コード
    sMemFld.Add('TCreditCashNm');   //得意先貸方資金繰名称
    sMemFld.Add('SDebitCashCd');    //仕入先借方資金繰コード
    sMemFld.Add('SDebitCashNm');    //仕入先借方資金繰名称
    sMemFld.Add('SCreditCashCd');   //仕入先貸方資金繰コード
    sMemFld.Add('SCreditCashNm');   //仕入先貸方資金繰名称
    sMemFld.Add('STaxCode');        //売上消費税コード
    sMemFld.Add('STaxName');        //売上消費税名称
    sMemFld.Add('BTaxCode');        //仕入消費税コード
    sMemFld.Add('BTaxName');        //仕入消費税名称
//<004>
    if (not DataSourceShosaiJ.DataSet.FieldByName ('RiskKbn').IsNull ) then
    begin
        sMemFld.Add('RiskKbn');         //リスク区分
        sMemFld.Add('RiskKbnNm');       //リスク区分名称
    end;
//    sMemFld.Add('TStartDate');	//適用期間（開始）
//    sMemFld.Add('TEndDate');		//適用期間（終了）
    sMemFld.Add('UpdDateTm');		//更新日

//<008>add st
    if (m_bFlag = True) then
    begin
        sMemFld.Add('GrpCode');         //グループ会社コード
        sMemFld.Add('KName');           //会社簡略名称
    end;
//<008>add end

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
function  TDmJNTCRP004002L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

procedure TDmJNTCRP004002L.ppReportShosaiJBeforePrint(Sender: TObject);
begin
	// <001>
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

    if (not DataSourceShosaiJ.DataSet.FieldByName ('RiskKbn').IsNull ) then
    begin
        LblLiskKbn1.Visible := True;
        LblLiskKbn2.Visible := True;
    end
    else
    begin
        LblLiskKbn1.Visible := False;
        LblLiskKbn2.Visible := False;
    end;

end;

procedure TDmJNTCRP004002L.ppDetailBand_StandardGenBeforeGenerate(
  Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardGen.LastRecord) or
		(ppDetailBand_StandardGen.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardGen.OverFlow = False) then
			ppDetailBand_StandardGen.OverFlow	:=	True;

		if (ppStandardGenUnderLine.ReprintOnOverFlow = False) then
			ppStandardGenUnderLine.ReprintOnOverFlow	:=	True;

		ppStandardGenUnderLine.Weight	 :=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardGenUnderLine.Weight     :=	0.25;	// ラインの太さを元にもどす
	end;

    // 郵便番号の「－」
    if (not DataSourceShosaiJ.DataSet.FieldByName ('PostNo1').IsNull )
    and (DataSourceShosaiJ.DataSet.FieldByName ('PostNo1').AsString <> '0' ) then
		ppLabel2.Visible := True
    else
		ppLabel2.Visible := False;

end;

end.

