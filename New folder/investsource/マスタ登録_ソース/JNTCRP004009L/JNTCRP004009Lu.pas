//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    資産情報(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：飯塚 健介(LEAD)
//      作成日      ：2006.01.25(WED)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ> <修正者>	  	<修正日>        <修正内容>
//  <001> 荒井秀士		2006/07/04	   	消費税端数処理区分追加
//  <002> 倉持　剛(NTC)	2014/03/26(Wed)	取引先コード欄に長体を設定
//  <003> 倉持　剛(NTC)	2014/03/27(Fri)	ファイル出力されない件を修正
//
//=============================================================================
unit JNTCRP004009Lu;
                   
interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  dxmdaset, JNTCommonu, ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004009L = class(TDataModule)
    ppReportShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
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
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    ppLine6: TppLine;
    DataSourceShosaiJ: TDataSource;
    ppBDEPipelineShosaiJ: TppDBPipeline;
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
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLabel1: TppLabel;
    ppDBText16: TppDBText;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;

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
	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
	function  fnIsPreview   (): Boolean;

  end;

// { Exports関数宣言 }
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP004009L: TDmJNTCRP004009L;

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
	pFrm    :   ^TDmJNTCRP004009L;
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
				pFrm^   :=  TDmJNTCRP004009L.CreateModule( AOwner,pRec );
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
constructor TDmJNTCRP004009L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004009L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP004009L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP004009L.CmnReportExtStandardGenBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004009L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
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
    if ( m_cJNTArea.IsExtract = FALSE )  then
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
procedure TDmJNTCRP004009L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    sTitle.Add('取引先コード');
    sTitle.Add('連想');
    sTitle.Add('簡略名称');
    sTitle.Add('正式名称');
    sTitle.Add('郵便番号（基番）');
    sTitle.Add('郵便番号（枝番）');
    sTitle.Add('住所上段');
    sTitle.Add('住所下段');
    sTitle.Add('電話番号');
    sTitle.Add('送付先部署名');
    sTitle.Add('担当者名');
    sTitle.Add('敬称');
    sTitle.Add('担当者メールアドレス');
    sTitle.Add('更新日');
	sTitle.Add('リース消費税端数処理区分');		//<001>

    sMemFld.Add('GCode');		    //取引先コード
    sMemFld.Add('Renso');		    //連想
    sMemFld.Add('Nmk');	            //簡略名称
    sMemFld.Add('Nm');	            //正式名称
    sMemFld.Add('PostNo1');		    //郵便番号（基番）
    sMemFld.Add('PostNo2');		    //郵便番号（枝番）
    sMemFld.Add('Ads1');		    //住所上段
    sMemFld.Add('Ads2');		    //住所下段
    sMemFld.Add('Tel1');		    //電話番号１
    sMemFld.Add('SectNm');		    //送付先部署名
    sMemFld.Add('TanNm');		    //担当者名
    sMemFld.Add('Keisyo');		    //敬称
    sMemFld.Add('Mail');		    //担当者メールアドレス
    sMemFld.Add('UpdDateTm');		//更新日
//	sMemFld.Add('SyozeiHasuKbn');	//<001> <003> Del
	sMemFld.Add('SyozeiHasu');		//<003>       Ins


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
function  TDmJNTCRP004009L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

procedure TDmJNTCRP004009L.ppReportShosaiJBeforePrint(Sender: TObject);
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

procedure TDmJNTCRP004009L.ppDetailBand_StandardGenBeforeGenerate(
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

