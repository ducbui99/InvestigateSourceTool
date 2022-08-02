//******************************************************************************
//	System		: Galileopt
//	Program		: 取引先登録　グループ別セキュリティ　印刷処理
//	ProgramID	: JNTCRP004010L
//	Name		: E.Nanba(Lab)
//	Create		: 2007/03/05
//	Comment		:
//	History		:
//----Ver4.09 / NX-Ⅰ5.02
//  <Authority> 小川 哲央   2012/07/13(FRI) サブモジュールの権限管理対応
//******************************************************************************
unit JNTCRP004010Lu;

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
  ,JNTAuthorityu, ppDesignLayer, ppParameter,  // <Authority> ADD
  MjsStrCtrl;

type
{$include JNTSelPrtIF.inc}

	TRptParam = Record
		iMasterKbn1		:	Integer;
		iCodeAttr1		:   Integer;
		iCodeDigit1		:   Integer;
		sMasterName1	:	String;
		iMasterKbn2		:	Integer;
		iCodeAttr2		:   Integer;
		iCodeDigit2		:   Integer;
		sMasterName2	:	String;
		sRetStCode		:	String;		//開始コード    (戻り値)
		sRetEdCode		:	String;		//終了コード    (戻り値)
	end;


  TDmJNTCRP004010L = class(TDataModule)
    dsSecJ: TDataSource;
    PipelineSecJ: TppDBPipeline;
    ppReportSecJ: TppReport;
    ppHeaderBand11: TppHeaderBand;
    LppCorpCode1: TppLabel;
    LppCorpName1: TppLabel;
    LppTitle: TppLabel;
    LppUnderLine: TppLine;
    SVppDate1: TppSystemVariable;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppLine68: TppLine;
    ppRep_Koumoku1: TppLabel;
    ppRep_Koumoku2: TppLabel;
    ppLine69: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine119: TppLine;
    ppDetailBand1: TppDetailBand;
    DBTxt_GCode1: TppDBText;
    DBTxt_Nm1: TppDBText;
    DBTxt_GCode2: TppDBText;
    DBTxt_Nm2: TppDBText;
    ppLine72: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppStandardUnderLine1: TppLine;
    CmnReportSystemLineDetailsTop: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand11: TppFooterBand;
    SVppPage1: TppSystemVariable;

	constructor CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure   DataModuleCreate    (Sender: TObject);
    procedure   DataModuleDestroy   (Sender: TObject);

    procedure   ppReportBeforePrint (Sender: TObject);
    procedure   ppReportSecJEndPage (Sender: TObject);
    procedure   ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure   DBTxt_GCode1Print   (Sender: TObject);

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
	m_RptParam		:	TRptParam;			// 印刷条件パラメータ

	procedure ppReport1FileOut();

  public
    { Public 宣言 }
    JntAuthority : TJNTAuthority;  // <Authority> ADD
	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon; pRptParam: Pointer);
	procedure fnInzPrint    ();
	function  fnIsPreview   (): Boolean;

  end;

// { Exports関数宣言 } <PRN>
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
						pRptParam	:	Pointer;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP004010L: TDmJNTCRP004010L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
  m_strExCodePrint  :   String;

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
						pRptParam	:	Pointer;
                        var ArHdl   :   Array of Pointer) : Integer;
var
    i       :   Integer;                // ArHdlの添え字。
	pFrm    :   ^TDmJNTCRP004010L;
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
				pFrm^   :=  TDmJNTCRP004010L.CreateModule( AOwner,pRec );
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
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea, pRptParam);
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
constructor TDmJNTCRP004010L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004010L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP004010L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
// レポート　印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.ppReportBeforePrint(Sender: TObject);
begin
	// ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);
end;

//------------------------------------------------------------------------------
// レポート　ページ印刷後処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.ppReportSecJEndPage(Sender: TObject);
begin
    m_strExCodePrint    :=  '';
end;

//------------------------------------------------------------------------------
// ディテイルバンド　印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand1.LastRecord) or
		(ppDetailBand1.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand1.OverFlow = False) then
			ppDetailBand1.OverFlow	:=	True;

		if (ppStandardUnderLine1.ReprintOnOverFlow = False) then
			ppStandardUnderLine1.ReprintOnOverFlow	:=	True;

		ppStandardUnderLine1.Visible	:= True;
		ppStandardUnderLine1.Weight		:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardUnderLine1.Visible	:= False;
		ppStandardUnderLine1.Weight		:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//------------------------------------------------------------------------------
// GCode1　印刷時処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.DBTxt_GCode1Print(Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;
begin

	cDBTextExCode   :=  Sender as TppDBText;
	strExCode		:=  cDBTextExCode.Text;

	if ( CompareStr (strExCode,m_strExCodePrint) = 0) then
	begin
		cDBTextExCode                   .Visible    :=  FALSE;
		DBTxt_Nm1		                .Visible    :=  FALSE;
		CmnReportSystemLineDetailsTop   .Visible	:=  FALSE;
	end
	else
	begin
		cDBTextExCode                   .Visible    :=  TRUE;
		DBTxt_Nm1		                .Visible	:=  TRUE;

		if ( m_strExCodePrint = '') then
			    CmnReportSystemLineDetailsTop.Visible	:= FALSE
		else    CmnReportSystemLineDetailsTop.Visible	:= TRUE;

		m_strExCodePrint	:= strExCode;
	end;
end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon; pRptParam: Pointer);
var
	i   :   Integer;
begin
	uvHani      := Para;
	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport	:= uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);					// fnSelSetPrnInfoは削除する

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

	m_RptParam := TRptParam(pRptParam^);

    // 印刷初期化処理
    fnInzPrint;

	// DataSourceの設定
	dsSecJ.DataSet := TargetMD;
	PrnSupport.ApRB				:=  ppReportSecJ;
	PrnSupport.strDocName		:=  '使用可能部署リスト[' + m_RptParam.sMasterName1 + '別]';
	PrnSupport.pPage			:=  SVppPage1;					// 頁
	PrnSupport.pDate			:=  SVppDate1;					// 日付
	PrnSupport.pCorpCode		:=  LppCorpCode1;				// 会社ｺｰﾄﾞ
	PrnSupport.pCorpName		:=  LppCorpName1;				// 会社名称
	PrnSupport.strFileName		:=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot +
									'tmp\' + PrnSupport.strDocName + '.csv';

	PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
	PrnSupport.MdataModule		:=  m_pMDataModule^;			// 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
	PrnSupport.iDspWriteBtn		:=  0;							// 保存ﾎﾞﾀﾝ制御(0:表示する)

	// 抽出権限なし⇒ﾌｧｲﾙ出力非表示
//<Authority> DEL	if ( m_cJNTArea.IsExtract = FALSE )  then
	if ( JntAuthority.IsExtract = FALSE )  then  //<Authority> ADD
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
			PDLG_FILE:		ppReport1FileOut;
		end;
	end;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.fnInzPrint();
begin
	LppTitle.Caption := '使用可能部署リスト[' + m_RptParam.sMasterName1 + '別]';
	ppRep_Koumoku1.Caption := m_RptParam.sMasterName1;
	ppRep_Koumoku2.Caption := m_RptParam.sMasterName2;

	// 帳票タイトルのアンダーラインの設定
	LppUnderLine.Width	:= MjsHanLength( LppTitle.Caption ) * ( 0.063 * 2 ) + 0.063 * 2;
	LppUnderLine.Left	:= ( LppTitle.Width - LppUnderLine.Width ) / 2;

	if m_RptParam.iCodeAttr1 = 2 then
		DBTxt_GCode1.Alignment := taLeftJustify
	else
		DBTxt_GCode1.Alignment := taRightJustify;

	if m_RptParam.iCodeAttr2 = 2 then
		DBTxt_GCode2.Alignment := taLeftJustify
	else
		DBTxt_GCode2.Alignment := taRightJustify;
end;

//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004010L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004010L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin
    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    sTitle.Add(m_RptParam.sMasterName1 + 'コード');
    sTitle.Add('簡略名称');
    sTitle.Add(m_RptParam.sMasterName2 + 'コード');
    sTitle.Add('簡略名称');

    sMemFld.Add('GCode1');
    sMemFld.Add('Nm1');
    sMemFld.Add('GCode2');
    sMemFld.Add('Nm2');

    if ( MjsFileOut(dsSecJ.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free;
    sMemFld.Free;
end;

end.

