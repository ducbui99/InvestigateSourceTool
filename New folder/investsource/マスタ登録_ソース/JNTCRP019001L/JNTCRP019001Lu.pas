//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：分類登録(印刷処理)
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
//  <001>   加藤(PRIME) 2006/01/20(FRI) 帳票対応
//	<002>	長谷川耕平	2006/07/13(THU)	拡張分類対応
//	<PLOG>	久保義和	2008/07/14(Mon) 印刷履歴対応
//	<D10>	鈴木基男	2019.12.24(Tue)	Delphi10対応
//=============================================================================
unit JNTCRP019001Lu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, Db,
  FireDAC.Comp.Client, IniFiles, dxmdaset,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, {<D10>ppDBBDE,}

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTCommonu, JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP019001L = class(TDataModule)
    dsMain: TDataSource;
    bdeplMain: TppDBPipeline;
    ppRep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    Repdt: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppMasterKbn: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    LppCorpCode: TppLabel;
    LppCorpName: TppLabel;
    ppTitle: TppLabel;
    ppTitleLine: TppLine;
    SVppDate: TppSystemVariable;
    SVppPage: TppSystemVariable;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppBottomLine: TppLine;
    ppCode: TppDBText;
    ppName: TppDBText;
    ppRenso: TppDBText;
    ppType: TppLabel;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate    (Sender: TObject);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       ppRepBeforePrint    (Sender: TObject);
    procedure RepdtBeforeGenerate(Sender: TObject);

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
	procedure DoPrint       (Para: TJNTHani; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
    function  fnSetSQL      (TargetQry: TFDQuery; Para: TJNTHani; MsgFlg: Boolean = TRUE): Boolean;
	function  fnIsPreview   (): Boolean;
    procedure GetMasterInfo (var strHojName: String; var iAttr: Integer; var iDigit: Integer);  // <001>
    procedure fnInzPrint    (strHojName: String; iAttr: Integer; iDigit: Integer);  // <001>

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
  DmJNTCRP019001L: TDmJNTCRP019001L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation

uses
    JNTSelError;
    {<D10>Calendar;}

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
	pFrm    :   ^TDmJNTCRP019001L;
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
				pFrm^   :=  TDmJNTCRP019001L.CreateModule( AOwner,pRec );
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
			pFrm^.DoPrint( PrtParam.Para,
                           PrtParam.TargetMD,
                           PrtParam.CorpSys,
                           PrtParam.JNTArea );
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
constructor TDmJNTCRP019001L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP019001L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP019001L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP019001L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);


end;


//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP019001L.DoPrint(Para: TJNTHani; TargetMD: TdxMemdata;
                            CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i           :   Integer;
    strTitle    :   String;
    strHojName  :   String;                 // <001>
    iAttr, iDigit   : Integer;              // <001>
begin
	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する

    GetMasterInfo(strHojName, iAttr, iDigit);               // <001>MasterInfoの情報取得

	PrnSupport.ApRB				:= ppRep;                   // ﾚﾎﾟｰﾄﾋﾞﾙﾀﾞｰ
    PrnSupport.strDocName		:= uvHani.pvrRepTitle;	    // 帳票ﾀｲﾄﾙ
    PrnSupport.pPage			:= SVppPage;			    // 頁
    PrnSupport.pDate			:= SVppDate;			    // 日付
    PrnSupport.pCorpCode		:= LppCorpCode;		        // 会社ｺｰﾄﾞ
    PrnSupport.pCorpName        := LppCorpName;             // 会社名称
    PrnSupport.pApRec			:=  m_pRec;						//<PLOG>
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002>
//    strTitle                    := '分類登録リスト' + '[' + strHojName + ']';
    strTitle                    := strHojName + '登録リスト';

    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + strTitle + '.csv';
	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                      // 保存ﾎﾞﾀﾝ制御(0:表示する)

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
{
        // SQLをｾｯﾄ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW,
            PDLG_FILE:    if fnSetSQL(TargetQry, Para) = FALSE then Exit;
        end;
}
        //DataSourceの設定
        dsMain.DataSet := TargetMD;         // <001>
                                            // <001>印刷初期化処理
        fnInzPrint(strHojName, iAttr, iDigit);

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE: ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
//ＳＱＬ文の設定
//------------------------------------------------------------------------------
Function TDmJNTCRP019001L.fnSetSQL(TargetQry: TFDQuery; Para: TJNTHani; MsgFlg: Boolean): Boolean;
//var
//    lvSQL,
//    lvSCODE, lvECODE: String;
begin
    Result  :=  TRUE;
{
    lvSQL   :=  '';

    // 範囲用の変数を初期化
    lvSCODE := JNTSelXRightAddch('', 16, ' ');
    lvECODE := JNTSelXRightAddch('', 16, #255);

    // ﾒｲﾝのSELECT文の読み込み
    lvSQL   :=      'SELECT Sf.GCODE, Sf.Renso,   Sf.NM,      Sf.NMK,   Sf.BMNM,    '
                +   '       Sf.TNNM,  Sf.POSTNO1, Sf.POSTNO2, Sf.ADS1,  Sf.ADS2,    '
                +   '       Sf.TEL,   Sf.FAX,     Sf.MEMO1,   Sf.MEMO2, Sf.SOFOPFM  '
                +   'FROM MSOFU Sf                                                  '
                +   'where (Sf.GCODE between :pSCODE and :pECODE)                   ';


    // 範囲用の変数に画面上のコードの値をセット
    // この判定がないと、全件を指定したときにも範囲が絞られてしまう
    if ( Para.pvrRgType[0] = 1 ) then
    begin
        lvSCODE := JNTSelXRightAddch(Para.pvrStCode[0], 16, #0);
        lvECODE := JNTSelXRightAddch(Para.pvrEdCode[0], 16, #255);
    end;

    // Order句に値をセット
    // 印刷順コンボボックスのアイテムの順番で判定
    if ( Para.pvrOrder = 0 ) then
        lvSQL   :=  lvSQL   +   'order by Sf.GCODE  '
    else
        lvSQL   :=  lvSQL   +   'order by Sf.Renso,Sf.GCODE ';

    // where句のﾊﾞｲﾝﾄﾞ変数に値をｾｯﾄ
    with TargetQry do
    begin
        Close();
        SQL.Clear();
        SQL.Add(lvSQL);
        ParamByName('pSCODE').AsString := lvSCODE;
        ParamByName('pECODE').AsString := lvECODE;
        Open();
    end;

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetQry.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Result := FALSE;
    end;
}
end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP019001L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

{          ※※※ 保留 ※※※  2001.01.18
    sTitle.Add('仕入先分類ｺｰﾄﾞ');
    sTitle.Add('仕入先分類名');
    sTitle.Add('検索名');

    sMemFld.Add('CODE');
    sMemFld.Add('NM');
    sMemFld.Add('FKEY');

    if MjsFileOutMain(qryMain, sMemFld, sTitle, PrnSupport, True ) = -1 then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;
}
// <001>↓
    sTitle.Add('コード');
    sTitle.Add('名称');
    sTitle.Add('連想');

    sMemFld.Add('GCODE');
    sMemFld.Add('NMK');
    sMemFld.Add('RENSO');

    if ( MjsFileOut(dsMain.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

// <001>↑

    sTitle.Free;
    sMemFld.Free;

end;
//------------------------------------------------------------------------------
// ﾌﾟﾚﾋﾞｭｰの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP019001L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
//  MasterInfoの情報取得  <001>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP019001L.GetMasterInfo(var strHojName: String; var iAttr: Integer;
                        var iDigit: Integer);
var
    DmqData : TMQuery;
begin

    // MQueryの構築
    DmqData  := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_pMDataModule.SetDBInfoToQuery( uvHani.UseDb, DmqData );

    with DmqData do
    begin
        Close();
        Sql.Clear();
        Sql.Add('Select JHojyoName,UseKbn,CodeDigit,CodeAttr    '
            +   'FROM MasterInfo                                '
            +   'WHERE  (MasterKBN = :pKBN)                     ');
//        ParamByName('pKBN').AsInteger := uvHani.pvMasterKbn + uvHani.pvrPattern;
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
//  印刷初期化処理  <001>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP019001L.fnInzPrint(strHojName: String; iAttr: Integer; iDigit: Integer);
begin
//<002>
	ppTitle.Caption	:= strHojName + '登録リスト';

    // 下線の調節
    ppTitleLine.Left := ppTitle.Left - 0.063;
    ppTitleLine.Width := ppTitle.Width + 0.126;

    // 分類名
    ppType.Caption := '【' + strHojName + '】';

    // ｺｰﾄﾞ属性
    if iAttr = 2 then
        ppCode.Alignment := taLeftJustify
    else
        ppCode.Alignment := taRightJustify;

end;

//------------------------------------------------------------------------------
// DetailBandのBeforeGenerateｲﾍﾞﾝﾄ <001>
//------------------------------------------------------------------------------
procedure TDmJNTCRP019001L.RepdtBeforeGenerate(Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定
    if (Repdt.LastRecord) or
        (Repdt.PageOutOfSpace) then
    begin
        if (Repdt.OverFlow = False) then
            Repdt.OverFlow := True;

        if (ppBottomLine.ReprintOnOverFlow = False) then
            ppBottomLine.ReprintOnOverFlow := True;

        ppBottomLine.Weight := 0.75;            // 最後のﾗｲﾝを太く
    end
    else
    begin
        ppBottomLine.Weight := 0.25;            // 最後のﾗｲﾝを元に戻す
    end;

end;
end.

