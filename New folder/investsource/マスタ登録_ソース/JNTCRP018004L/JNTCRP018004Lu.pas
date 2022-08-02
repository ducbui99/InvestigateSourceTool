//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：工事/プロジェクト
//                    工種登録(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：（株）ミロク情報サービス
//
//      作成者      ：広田 茂雄(PRIME)
//      作成日      ：2005.10.26(TUE)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   広田(PRIME) 2005.12.13(TUE) ページ指定対応、帳票タイトルフォーマット
//  <   >   加藤(PRIME) 2006.02.23(THU) TextのLayoutをほぼtlTop→tlCenterに修正
//  <   >   加藤(PRIME) 2006.02.23(THU) ｺｰﾄﾞの文字数を6→10byteに修正
//  <002>   加藤(PRIME) 2006.02.23(THU) ﾚｲｱｳﾄの微調整、余分なLine削除
//  <003>   加藤(PRIME) 2006.02.23(THU) ｺｰﾄﾞのAlignment設定
//  <   >   鈴木(PRIME) 2007/07/12(THU) ｺｰﾄﾞ16桁対応
//  <004>	鈴木(PRIME) 2008/05/15(THU) J-SOX印刷履歴対応
//=============================================================================
unit JNTCRP018004Lu;

interface
                 
uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,
  ppStrtch, ppSubRpt, ppModule,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MjsDispCtrl,
  MJSQuery,  MjsDateCtrl, MjsStrCtrl,

  JNTMasComu, JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst,
  JNTSelCorpSys, JNTExpGlobal, daDatMod, ppDBJIT, ppDesignLayer, ppParameter;

type
// --------------------------------
//  査印情報項目管理用構造体
// --------------------------------
    Printing_Rec = record
        nItemName   :   String;
        nPepoNo     :   Integer;
        nLayOutNo   :   Integer;
    end;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP018004L = class(TDataModule)
    bdeplMain: TppDBPipeline;
    dsMain: TDataSource;
    DDBPipelinePrintKousyu: TppDBPipeline;
    ppJITPipeline1: TppJITPipeline;
    DDBPipelinePrintKousyuPtn: TppDBPipeline;
    DDBPipelinePrintKousyuPtnppField1: TppField;
    DDBPipelinePrintKousyuPtnppField2: TppField;
    DDBPipelinePrintKousyuPtnppField3: TppField;
    DDBPipelinePrintKousyuPtnppField4: TppField;
    DDBPipelinePrintKousyuPtnppField5: TppField;
    RReportKousyu: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    LineKousyuTitle: TppLine;
    pLKousyuTitle: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppLabel70: TppLabel;
    ppLine20: TppLine;
    ppLabel16: TppLabel;
    ppLine22: TppLine;
    ppLabel17: TppLabel;
    ppLine23: TppLine;
    ppLabel18: TppLabel;
    ppDetailBand3: TppDetailBand;
    ReportkousyuLineDetailsBottom: TppLine;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine24: TppLine;
    ppLine28: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable4: TppSystemVariable;
    LppAccOffice: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    LKousyu_Kensu: TppLabel;
    RReportKousyuPtn: TppReport;
    ppHeaderBand4: TppHeaderBand;
    LppCorpCode2: TppLabel;
    LppCorpName2: TppLabel;
    LineKousyuPtnTitle: TppLine;
    pLKousyuPtnTitle: TppLabel;
    SVppDate2: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine39: TppLine;
    ppDetailBand4: TppDetailBand;
    ReportkousyuPtnLineDetailsBottom: TppLine;
    ppDBTextPtnNo: TppDBText;
    ppDBTextPtnName: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    SVppPage2: TppSystemVariable;
    LppAccOffice2: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDBImage1: TppDBImage;

    constructor CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure   DataModuleCreate    (Sender: TObject);
    procedure   DataModuleDestroy   (Sender: TObject);
    procedure   ppRepBeforePrint    (Sender: TObject);
    procedure RReportKousyuPtnEndPage(Sender: TObject);
    procedure ppDetailBand3BeforeGenerate(Sender: TObject);
    procedure ppDetailBand4BeforeGenerate(Sender: TObject);
    procedure RReportKousyuBeforePrint(Sender: TObject);
  private
    { Private 宣言 }
	m_pRec              :   ^TMjsAppRecord;
	m_pMDataModule      :   ^TMDataModulef;
	m_pCommonArea       :   ^rcCOMMONAREA;          // 共通ｴﾘｱ
    ComArea			    :   TJNTMASCom;
    MJSPrnDlgf	        :	TMJSPrnDlgf;		    // 印刷ﾀﾞｲｱﾛｸﾞ
	PrnSupport          :	TMjsPrnSupport;		    // 印刷設定
    mjspre		        :	TMjsPreviewIF;		    // ﾌﾟﾚﾋﾞｭｰ
    uvSelSys            :   TJNTSelCorpSys;         // 会社ｼｽﾃﾑ情報
    uvHani		        :	TJNTHani;
    Owner               :   TComponent;
    m_cJNTArea          :   TJNTCommon;
	m_strExCodePrint     : String;

	procedure ppReport1FileOut();
    procedure GetMasterInfo (var strHojName: String; var iAttr: Integer; var iDigit: Integer);  // <003>
    procedure fnInzPrint    (strHojName: String; iAttr: Integer; iDigit: Integer);  // <003>

  public
    { Public 宣言 }
	procedure   DoPrint             (Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
	function    fnIsPreview         (): Boolean;

  end;

{ Exports関数宣言 }
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP018004L: TDmJNTCRP018004L;

    giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;

{$R *.DFM}

const
    // 和暦／西暦区分
    sYearKbn    :   array [0..1] of String = ('和暦',
                                              '西暦');

    // 日次入力確定採用区分
    sSaiyoKbn   :   array [0..1] of String = ('未採用',
                                              '採用');

    ucTotalItem     :   array[0..2] of String = ('なし',
                                                 'あり（改頁なし）',
                                                 'あり（改頁あり）'
                                                );


//-----------------------------------------------------------------------------
//  PrintAppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
                        PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
var
    i       :   Integer;            // ArHdlの添え字
	pFrm    :   ^TDmJNTCRP018004L;

begin

	result := ACTID_RET_OK;

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
				pFrm^   :=  TDmJNTCRP018004L.CreateModule( AOwner,pRec );
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
constructor TDmJNTCRP018004L.CreateModule(AOwner:TComponent;pRec:Pointer);
begin

	m_pRec		    :=  pRec;
    ComArea         :=  TJNTMASCom(m_pRec^.m_pSystemArea^);
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create(AOwner);

end;

procedure TDmJNTCRP018004L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP018004L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP018004L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP018004L.DoPrint(Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemData; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i           :   Integer;
    strTitle    :   String;
    m_KousyuName:   String;
    strHojName  :   String;                 // <003>
    iAttr, iDigit   : Integer;              // <003>
begin

	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;

    //DataSourceの設定
    dsMain.DataSet := TargetMD;

	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する

    GetMasterInfo(strHojName, iAttr, iDigit);               // <003>MasterInfoの情報取得

    fnInzPrint(strHojName, iAttr, iDigit);                  // <003>印刷初期化処理

	m_KousyuName := uvHani.pvHojyoName;
	case (uvHani.pvrPattern) of
        0   :
        begin
			PrnSupport.ApRB				:=	RReportKousyu;
            pLKousyuTitle.Caption		:=	m_KousyuName + '登録リスト';
			PrnSupport.strDocName		:=	m_KousyuName + '登録リスト';
			PrnSupport.pPage			:=	ppSystemVariable4;	  		//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	ppSystemVariable3;	  		//	日付
			PrnSupport.pCorpCode		:=	ppLabel14;		//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	ppLabel15;		//	会社名称
//			PrnSupport.pAccountOffice	:=	LppAccOffice;		//	会計事務所名称
//			PrnSupport.strFileName		:=	rcCOMMONAREA ( m_pMyAppRecord^.m_pCommonArea^ ).SysCliRoot +
//											'\tmp\' + m_KousyuName + '登録リスト.csv';
	    	strTitle := m_KousyuName + '登録リスト';
        end;

        1   :
        begin
			PrnSupport.ApRB				:=	RReportKousyuPtn;
			PrnSupport.strDocName		:=	m_KousyuName + 'パターン登録リスト';
            pLKousyuPtnTitle.Caption	:=	m_KousyuName + 'パターン登録リスト';
			PrnSupport.pPage			:=	SVppPage2;	  		//	ﾍﾟｰｼﾞ
			PrnSupport.pDate			:=	SVppDate2;	  		//	日付
			PrnSupport.pCorpCode		:=	LppCorpCode2;		//	会社ｺｰﾄﾞ
			PrnSupport.pCorpName		:=	LppCorpName2;		//	会社名称
//			PrnSupport.pAccountOffice	:=	LppAccOffice2;		//	会計事務所名称
//			PrnSupport.strFileName		:=	rcCOMMONAREA ( m_pMyAppRecord^.m_pCommonArea^ ).SysCliRoot +
//											'\tmp\' + m_KousyuName + 'パターン登録リスト.csv';
	    	strTitle := m_KousyuName + 'パターン登録リスト';

			m_strExCodePrint	:= '';
        end;
    end;

	PrnSupport.pComArea	 	:= m_pRec^.m_pCommonArea;
    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    prnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;
//	PrnSupport.iSysCode		:= m_pRec^.m_iSystemCode;   // システムコード
//	PrnSupport.iReportID    :=	990100;							//	帳票ｸﾞﾙｰﾌﾟNO


    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';
	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                      // 保存ﾎﾞﾀﾝ制御(0:表示する)

    PrnSupport.pApRec 			:=  m_pRec;		// <004> ADD

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

//	PrnSupport.iReportID		:=  990100;                 // 帳票ｸﾞﾙｰﾌﾟNO


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
            PDLG_FILE:    if fnSetSQL(TargetQry, TargetMD, Para) = FALSE then Exit;
        end;

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE:      ppReport1FileOut;
        end;
}
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
procedure TDmJNTCRP018004L.ppReport1FileOut();
var
    sTitle  :   TStringList;
    sMemFld :   TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

	case uvHani.pvrPattern of
		0:
		begin
			sTitle.Add('コード'	 );
			sTitle.Add('連想'    );
            sTitle.Add('正式名称');
            sTitle.Add('簡略名称');

			sMemFld.Add	('GCode'	 );
			sMemFld.Add	('Renso'	 );
			sMemFld.Add	('LongName'	 );
			sMemFld.Add	('SimpleName');
        end;

        1:
        begin
			sTitle.Add('パターンNo'	 );
			sTitle.Add('パターン名称');
            sTitle.Add('コード'      );
            sTitle.Add('作業内訳名称'    );

			sMemFld.Add	('PtnNo'   );
			sMemFld.Add	('PtnName' );
			sMemFld.Add	('GCode'   );
			sMemFld.Add	('LongName');
        end;
    end;

    if ( MjsFileOut(dsMain.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free();
    sMemFld.Free();

end;

//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP018004L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

procedure TDmJNTCRP018004L.RReportKousyuPtnEndPage(Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;

procedure TDmJNTCRP018004L.ppDetailBand3BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand3.LastRecord) or
		(ppDetailBand3.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand3.OverFlow = False) then
			ppDetailBand3.OverFlow	:=	True;

		if (ReportkousyuLineDetailsBottom.ReprintOnOverFlow = False) then
			ReportkousyuLineDetailsBottom.ReprintOnOverFlow	:=	True;

		ReportkousyuLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ReportkousyuLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TDmJNTCRP018004L.ppDetailBand4BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand4.LastRecord) or
		(ppDetailBand4.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand4.OverFlow = False) then
			ppDetailBand4.OverFlow	:=	True;

		if (ReportkousyuPtnLineDetailsBottom.ReprintOnOverFlow = False) then
			ReportkousyuPtnLineDetailsBottom.ReprintOnOverFlow	:=	True;

//		ReportkousyuPtnLineDetailsBottom.Visible    :=	True;   // <002>
		ReportkousyuPtnLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
//		ReportkousyuPtnLineDetailsBottom.Visible    :=	False;  // <002>
		ReportkousyuPtnLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

procedure TDmJNTCRP018004L.RReportKousyuBeforePrint(Sender: TObject);
begin
	// <001>
    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

// <003>↓Alignment設定
    if Sender = RReportKousyu then
    begin

    end
    else if Sender = RReportKousyuPtn then
    begin
    end;
// <003>↑
end;

//------------------------------------------------------------------------------
//  MasterInfoの情報取得  <003>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP018004L.GetMasterInfo(var strHojName: String; var iAttr: Integer;
                        var iDigit: Integer);
var
    DmqData : TMQuery;
begin

    // MQueryの構築
    DmqData  := TMQuery.Create(Self);
    // DBとMQueryの接続
    m_pMDataModule.SetDBInfoToQuery(uvHani.UseDb, DmqData);

    with DmqData do
    begin
        Close();
        Sql.Clear();
        Sql.Add('Select JHojyoName,UseKbn,CodeDigit,CodeAttr    '
            +   'FROM MasterInfo                                '
            +   'WHERE  (MasterKBN = :pKBN)                     ');
        ParamByName('pKBN').AsInteger := uvHani.pvMasterKbn;
        Open();

        if not Eof then
        begin
                                            // 補助名称
            strHojName := GetFld('JHojyoName').AsString;
                                            // ｺｰﾄﾞ属性
            iAttr := GetFld('CodeAttr').AsInteger;
                                            // ｺｰﾄﾞ桁数
            iDigit := GetFld('CodeDigit').AsInteger;
        end;

        Close();
        Free();
    end;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理  <003>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP018004L.fnInzPrint(strHojName: String; iAttr: Integer; iDigit: Integer);
begin
	case uvHani.pvrPattern of
		0:                                  // 工種登録ﾘｽﾄ
		begin
            // 工種/作業内訳ｺｰﾄﾞ属性
            if iAttr = 2 then               // 文字
                ppDBText12.Alignment := taLeftJustify
            else                            // 数字・0つき数字
                ppDBText12.Alignment := taRightJustify;
        end;
        1:                                  // 工種ﾊﾟﾀｰﾝ登録ﾘｽﾄ
        begin
            // 工種/作業内訳ｺｰﾄﾞ属性
            if iAttr = 2 then               // 文字
                ppDBText16.Alignment := taLeftJustify
            else                            // 数字・0つき数字
                ppDBText16.Alignment := taRightJustify;
        end;
    end;

end;

end.

