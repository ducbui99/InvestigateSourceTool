//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目
//                    ＣＦ科目(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.09.12(MON)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   加藤(PRIME) 2006.01.11(WED) 和暦/西暦を考慮
//	<002>	斎藤		2008/05/22(THU)	JSOX印刷履歴対応
//	<003>	斎藤		2008/06/12(THU)	印刷履歴にてスプール名が出ないバグ修正
//	<004>	黒田 祐生	2011/06/13(MON)	他の処理でプレビュー中にプレビューを起動するとエラーとして表示される点を修正
//
//=============================================================================
unit JNTCRP009003Lu;

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

  TDmJNTCRP009003L = class(TDataModule)
    ppRep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    R_TCorpNo: TppLabel;
    R_TCorpName: TppLabel;
    R_TDate: TppSystemVariable;
    LblTitle: TppLabel;
    LineUnder: TppLine;
    ppRepoName: TppLabel;
    LineHeadLeft: TppLine;
    LineHeadRight1: TppLine;
    LineHeadRight2: TppLine;
    LineHeadRight3: TppLine;
    LineHeadRight4: TppLine;
    LineHeadRight5: TppLine;
    LineHeadTop: TppLine;
    LineHeadBottom: TppLine;
    LblCode: TppLabel;
    LblCFName: TppLabel;
    LblSimpleName: TppLabel;
    LblCharCode: TppLabel;
    LblDCKbn: TppLabel;
    ppDetailBand1: TppDetailBand;
    LineBodyLeft: TppLine;
    LineBodyBottom: TppLine;
    LineBodyRight1: TppLine;
    LineBodyRight2: TppLine;
    LineBodyRight3: TppLine;
    LineBodyRight4: TppLine;
    LineBodyRight5: TppLine;
    LineBodyRight6: TppLine;
    LineBodyRight7: TppLine;
    DBTxtCFCode: TppDBText;
    DBTxtCFName: TppDBText;
    DBTxtSimpleName: TppDBText;
    DBTxtCharCode: TppDBText;
    DBTxtCharCodeName: TppDBText;
    DBTxtDCKbn: TppDBText;
    DBTxtDCKbnName: TppDBText;
    LineBodyBottomH: TppLine;
    ppFooterBand1: TppFooterBand;
    R_TPage: TppSystemVariable;
    R_TKaikeiName: TppLabel;
    dsMain: TDataSource;
    ppBDEPipeline: TppDBPipeline;
    ppBDEPipelineppField1: TppField;
    ppBDEPipelineppField2: TppField;
    ppBDEPipelineppField3: TppField;
    ppBDEPipelineppField4: TppField;
    ppBDEPipelineppField5: TppField;
    ppBDEPipelineppField6: TppField;
    ppBDEPipelineppField7: TppField;
    ppBDEPipelineppField8: TppField;
    DMemPrint: TdxMemData;
    DMemPrintKmkCode: TIntegerField;
    DMemPrintLongName: TStringField;
    DMemPrintSimpleName: TStringField;
    DMemPrintCharCode: TIntegerField;
    DMemPrintOutPutName: TStringField;
    DMemPrintDCKbn: TIntegerField;
    DMemPrintDCKbnName: TStringField;

	constructor     CreateModule                (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleCreate            (Sender: TObject);
    procedure       DataModuleDestroy           (Sender: TObject);
    procedure       ppRepBeforePrint            (Sender: TObject);
    procedure       ppDetailBand1BeforeGenerate (Sender: TObject);

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
    m_iCorpKbn		:   Integer;			// 法人区分
    m_iRekiKbn	    :   Integer;            // 和暦/西暦<001>


	procedure ppReport1FileOut();
    procedure GetYearKbn(TargetQry: TMQuery);   // <001>

  public
    { Public 宣言 }
	procedure DoPrint       (Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata; TargetInt: Integer;
                             CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
	function  fnIsPreview   (): Boolean;
    procedure pCtrlSet      (TargetInt: Integer);
    procedure GetCorpKbn    (TargetQry: TMQuery);

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
  DmJNTCRP009003L: TDmJNTCRP009003L;

  giIndex   :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。

implementation


{$R *.DFM}

const
    SELECT_EIGYOU			= 0;			// 営業活動ｲﾝﾃﾞｯｸｽ
    SELECT_TOUSI			= 1;			// 投資活動ｲﾝﾃﾞｯｸｽ
    SELECT_ZAIMU			= 2;			// 財務活動ｲﾝﾃﾞｯｸｽ
    SELECT_GENKIN			= 3;			// 現金及び現金同等物ｲﾝﾃﾞｯｸｽ

    MEDICALCORP		    	= 2;			// 医療法人


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
	pFrm    :   ^TDmJNTCRP009003L;
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
				pFrm^   :=  TDmJNTCRP009003L.CreateModule( AOwner,pRec );
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
constructor TDmJNTCRP009003L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP009003L.DataModuleCreate(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

procedure TDmJNTCRP009003L.DataModuleDestroy(Sender: TObject);
begin

////////////////////////////////////////////////////////////

end;

//------------------------------------------------------------------------------
//  ppRepのヘッダーBeforePrint
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
//  印刷情報 --活動種別-- ｾｯﾄ
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.pCtrlSet(TargetInt: Integer);
begin

	case TargetInt of
        // 営業活動
    	SELECT_EIGYOU:
        begin
			if ( m_iCorpKbn = MEDICALCORP ) then
				    ppRepoName.Caption := '【業務活動】'
			else    ppRepoName.Caption := '【営業活動】';

		end;
        // 投資活動
    	SELECT_TOUSI:
			ppRepoName.Caption := '【投資活動】';
        // 財務活動
    	SELECT_ZAIMU:
			ppRepoName.Caption := '【財務活動】';
        // 現金及び現金同等物
    	SELECT_GENKIN:
			ppRepoName.Caption := '【現金及び現金同等物】';
	end;

end;

//------------------------------------------------------------------------------
//  法人区分の取得
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.GetCorpKbn(TargetQry: TMQuery);
begin


    with TargetQry do
    begin
	    Close();
        SQL.Clear();
        SQL.Add('SELECT CorpKbn FROM DTMAIN_MAS');
        Open();

        if ( EOF = FALSE ) then
    		m_iCorpKbn  :=  GetFld('CorpKbn').AsInteger;
    end;

    TargetQry.Close();

end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.DoPrint(Para: TJNTHani; TargetQry: TMQuery; TargetMD: TdxMemdata; TargetInt: Integer;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i           :   Integer;
    strTitle    :   String;
begin

	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;                                 // 会社情報取得
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);		            // fnSelSetPrnInfoは削除する

    // 法人区分の取得
    GetCorpKbn(TargetQry);

    // ﾍｯﾀﾞｰ部分の情報をｾｯﾄ(活動種類をｾｯﾄする)
	pCtrlSet(TargetInt);

    // DataSourceの設定
    dsMain.DataSet  :=  TargetMD;

	PrnSupport.ApRB				:= ppRep;
//<003> start
//	PrnSupport.strDocName		:= uvHani.pvrRepTitle;	    //
	PrnSupport.strDocName		:= 'キャッシュ・フロー計算書科目';
//<003> end
    PrnSupport.pPage			:= R_TPage;			        // 頁
    PrnSupport.pDate			:= R_TDate;			        // 日付
    PrnSupport.pCorpCode		:= R_TCorpNo;		        // 会社ｺｰﾄﾞ
    PrnSupport.pCorpName		:= R_TCorpName;		        // 会社名称
	PrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;
//<002> start
	PrnSupport.pApRec			:= m_pRec;
//<002> end
    strTitle                    := 'キャッシュ・フロー計算書科目';
    PrnSupport.strFileName	    :=  rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\' + strTitle + '.csv';

	PrnSupport.MdataModule	    :=	m_pMDataModule^;        // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    := 0;                       // 保存ﾎﾞﾀﾝ制御(0:表示する)

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
    if ( m_cJNTArea.IsExtract = FALSE )  then
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
	    PrnSupport.iDspFileBtn	:=  1;

// <001>↓
    m_iRekiKbn  :=  0;
    GetYearKbn(TargetQry);
    PrnSupport.iCalendarKbn	:=	m_iRekiKbn + 1;	//　暦区分
// <001>↑

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

	if ( i > 0 ) then
	begin
    	// 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
    	if (mjspre.IsExistPreview) and
           (PrnSupport.iCommand = PDLG_PREVIEW) then
        begin
			MessageBeep(MB_OK);
		// <004>MOD↓
		//	MjsMessageBox(Owner,'他のプログラムでプレビューが起動中です。', mjError, mjDefOk);
			MjsMessageBox(Owner,'他の処理でプレビューが起動しています。'+#13#10+
								'他のプレビューを終了してください。',mjInformation, mjDefOk);
		// <004>MOD↑
           Exit;
        end;

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE   :   ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.ppReport1FileOut();
var
    sTitle  : TStringList;
    sMemFld : TStringList;
begin

    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;

    sTitle.Add	('コード');
	sTitle.Add	('キャッシュ・フロー計算書科目');
	sTitle.Add	('簡略名称');
	sTitle.Add	('科目性格区分');
	sTitle.Add	('科目性格名称');
	sTitle.Add	('正残区分');
	sTitle.Add	('正残名称');

	sMemFld.Add	('KmkCode');
	sMemFld.Add	('LongName');
	sMemFld.Add	('SimpleName');
	sMemFld.Add	('CharCode');
	sMemFld.Add	('CharCodeName');
	sMemFld.Add	('DCKbn');
	sMemFld.Add	('DCKbnName');

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
function  TDmJNTCRP009003L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

procedure TDmJNTCRP009003L.ppDetailBand1BeforeGenerate(Sender: TObject);
begin

	if	ppDetailBand1.LastRecord then		// 詳細部の最終ﾚｺｰﾄﾞの時
	begin
		if	ppDetailBand1.OverFlow = FALSE then
		    ppDetailBand1.OverFlow := TRUE;

		if	LineBodyBottomH.ReprintOnOverFlow = FALSE then
		    LineBodyBottomH.ReprintOnOverFlow := TRUE;

    	LineBodyBottomH.Visible := TRUE;	// 太線を有効にする
    	LineBodyBottom.Visible := FALSE;
	end
	else
	begin
		LineBodyBottomH.Visible := FALSE;	// 細線を有効にする
		LineBodyBottom.Visible := TRUE;
	end;
                                            // 頁をまたぐ時の太線
	if	ppDetailBand1.PageOutOfSpace  = TRUE Then
	begin
		if	ppDetailBand1.OverFlow = FALSE then
			ppDetailBand1.OverFlow := TRUE;

		if	LineBodyBottomH.ReprintOnOverFlow = FALSE then
		    LineBodyBottomH.ReprintOnOverFlow := TRUE;

    	LineBodyBottomH.Visible := TRUE;	// 太線を有効にする
    	LineBodyBottom.Visible := FALSE;
	end;

end;

//------------------------------------------------------------------------------
//  和暦/西暦区分の取得<001>
//------------------------------------------------------------------------------
procedure TDmJNTCRP009003L.GetYearKbn(TargetQry: TMQuery);
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

end.

