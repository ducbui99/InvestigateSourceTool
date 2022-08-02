//=============================================================================
//
//      システム名  ：ＭＪＳ ＦＸ
//      処理名      ：範囲ダイアログ用グローバル宣言モジュール
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）
//
//      作成者      ：茂木 勇次
//      作成日      ：2005.07.20(WED)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//	<DSP>	長谷川耕平	    2004.12.15(WED) 高解像度対応
//  <001>   茂木勇次(LEAD)  2005.08.26(FRI) 帳票ﾍｯﾀﾞ会社ｺｰﾄﾞ情報が出力されるように修正
//	<002>	広田茂雄		2005.12.10(SAT)	PrnSupportの和暦/西暦区分は0/1ではなく1/2
//
//=============================================================================
unit JNTExpGlobalPrj;

interface

uses
    Windows, Classes, SysUtils, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, IniFiles, Menus, DBGrids,
    VCL.Controls,VCL.ExtCtrls, DB, FireDAC.Comp.Client, Math, Messages, VCL.StdCtrls, VCL.Graphics,
    Gauges, ComCtrls, dxGrClms, dxDBGrid,

    MjsDBModuleu, MjsPrnSupportu, MjsPreviewIFu, MjsPrnDlgu, MjsQuery,
    MjsDispCtrl,

	JNTSelGlobalConst, JNTSelGlobal, JNTSelCorpSys;

type
  TJNTHani = record
    // Iniﾌｧｲﾙ名
    pvDlgIniFile    :   String;						// ﾀﾞｲｱﾛｸﾞ用Iniﾌｧｲﾙ名
    pvPrgID         :   String;                     // ﾌﾟﾛｸﾞﾗﾑID       <001>

    pvMasterKbn     :   Integer;
    pvHojyoName     :   String;

//<001>Del    pvSqlIniFile    :	String;				// SQL用Iniﾌｧｲﾙ名

    // Return用兼表示ﾃﾞｰﾀ保存用
    pvrRepTitle     :   String;                     // 帳票ﾀｲﾄﾙ
    pvrStDate       :	Integer;			        // 開始日付
    pvrEdDate       :	Integer;			        // 終了日付
//<TAX> ADD St
    pvrStDate2       :	Integer;			        // 開始日付(予定終了日)
    pvrEdDate2       :	Integer;			        // 終了日付(予定終了日)
//<TAX> ADD Ed
//<001>Del    pvrSYMD	        :	TDateTime;                  // 開始日付(Date)
//<001>Del    pvrEYMD	        :	TDateTime;                  // 終了日付(Date)
//<001>Del    pvrSYM	        :	integer;                    // 開始日付(Int)
//<001>Del    pvrEYM	        :	integer;                    // 終了日付(Int)
    pvrPattern      :	Integer;					// 印刷ﾊﾟﾀｰﾝ
    pvrOrder        :	Integer;					// 出力順序1
    pvrOrderNM      :	String;					    // 出力順序1名      <001>
//<001>Del    pvrYMDFmt       :   String;                     // 日付書式文字

    pvrYearKbn      :   Integer;                    // 和暦/西暦区分    <001>

    pvrRgType       :   array of Integer;           // 範囲指定の種類（0-2）
    pvrStCode       :	array of String;			// 開始ｺｰﾄﾞ
    pvrStName       :	array of String;			// 開始名称
    pvrEdCode       :	array of String;			// 終了ｺｰﾄﾞ
    pvrEdName       :	array of String;			// 終了名称

    pvrWhere        :	array of String;			// Where条件        <001>

    pvrCodeCnt      :	Integer;					// ｺｰﾄﾞ個数

    pvrShokei       :	Boolean;					// 小計毎に改頁
//<001>Del    pvrDelete       :	Boolean;					// 発生分のみ
    pvrTemplate     :	Boolean;					// 直接印刷する
    pvrNayoseOya    :   Boolean;                    // 名寄せ親を除く   <001>
    pvrNayoseKo     :   Boolean;                    // 名寄せ子を除く   <001>
    UseTokui        :   Boolean;                    // 得意先採用       <001>
    UseSiire        :   Boolean;                    // 仕入先採用       <001>
    UseNashi        :   Boolean;                    // 採用無し         <001>


    // 内部的に使用する項目
    SelSys           :	TJNTSelCorpSys;				// 会社ｼｽﾃﾑ情報
    UseDb           :	TFDConnection;					// ﾃﾞｰﾀﾍﾞｰｽ
    pMjsAppRec      :   ^TMjsAppRecord;             // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ

    // 帳票に使用する項目
    MJSPrnDlgf	    :	TMJSPrnDlgf;				// 印刷ﾀﾞｲｱﾛｸﾞ
    PrnSupport      :	TMjsPrnSupport;				// 印刷設定
    mjspre		    :	TMjsPreviewIF;				// ﾌﾟﾚﾋﾞｭｰ
  end;

//	procedure   gfnDlg_SetCodeLen   (STCODE, EDCODE: TdxDBGridButtonColumn;
//    							     DataSet: TDataSet; SelSys: TJNTSelCorpSys);
//  function    gfnDlg_SetCodeZk    (const lcTag: Integer; SelSys: TJNTSelCorpSys): Integer;
//	procedure   gfnGrdSetFmt        (QryFld: TField; Tag: Integer; Width: Integer; SelSys: TJNTSelCorpSys);
//	function    gfnGetFldFmt        (Tag: Integer; SelSys: TJNTSelCorpSys): String;
    function    gfnSelSetPrnInfo    (_PrnSupport: TMjsPrnSupport; CorpSys: TJNTSelCorpSys):boolean;
    function    gfnGetIniFilePath   (m_pMjsAppRec: Pointer): String;

// ----------------------------------------
//
//  印刷初期処理(範囲指定ﾀﾞｲｱﾛｸﾞ有)
//
// ----------------------------------------
    function  gfnHaniInit(  SrcForm         :   TComponent;		    // Self
					    	m_pMjsAppRec, 					        // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
                            m_pMDataModule,					        // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
                            m_pCommonArea   :	Pointer;		    // MJS共通ｴﾘｱ
                            dbCorp          :   TFDConnection;          // 会社DB
                            PgID            :   String;             // ﾌﾟﾛｸﾞﾗﾑID
                            var HaniPara    :   TJNTHani;           // ﾘﾀｰﾝ用
                            dCorpSys        :   TJNTSelCorpSys)	    // 会社情報
                            : Boolean;

// ----------------------------------------
//
//  印刷初期処理(範囲指定ﾀﾞｲｱﾛｸﾞ無)
//
// ----------------------------------------
    function  gfnHaniInit2( SrcForm         :   TComponent;			// Self
							m_pMjsAppRec, 					        // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
                            m_pMDataModule,					        // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
                            m_pCommonArea   :   Pointer;		    // MJS共通ｴﾘｱ
                            dbCorp          :   TFDConnection;          // 会社DB
                            var HaniPara    :   TJNTHani;           // ﾘﾀｰﾝ用
                            dCorpSys        :   TJNTSelCorpSys)		// 会社情報
                            : Boolean;


    // 印刷終了処理(共通)
	function gfnHaniTerm(HaniPara: TJNTHani): Boolean;


    function gfnPrnInit(    SrcForm         :   TComponent;     // Self
							m_pMjsAppRec, 					    // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
                            m_pMDataModule,					    // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
                            m_pCommonArea   :	Pointer;		// MJS共通ｴﾘｱ
                            dbCorp          :   TFDConnection;      // 会社DB
                            var HaniPara    :   TJNTHani;       // ﾘﾀｰﾝ用
                            dCorpSys        :   TJNTSelCorpSys)	// 会社情報
                            : Boolean;

    function gfnPIniName(   m_pMjsAppRec    :	Pointer;	    // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
                            var HaniPara    :   TJNTHani;       // ﾘﾀｰﾝ用
                            dCorpSys        :   TJNTSelCorpSys;	// 会社情報
                            PgID            :   String)         // ﾌﾟﾛｸﾞﾗﾑID
                            : Boolean;

    function gfnGetDateDefault
                        (   DefType         :   integer;        // DefaultType
                            SelSys          :   TJNTSelCorpSys) // SelSys
                            : integer;

    procedure gfnSetDefaultDate
                        (   DlgIniFile      :   TIniFile;       // xxDlg.ini
                            var HaniPara    :   TJNTHani);      // SelSys


    //＊＊＊ 印刷処理(共通) ＊＊＊//
//	procedure gfnVarNameSet         ( var srcStr: string; SelSys: TJNTSelCorpSys);
//	procedure gfnVarNameSetTag      (TagNo: integer; var srcStr: string; SelSys: TJNTSelCorpSys);
//	function  gfnGetPerStr          (AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
//	function  gfnGetAraPerStr       (AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
//	function  gfnGetKaiPerStr       (AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
//	function  gfnGetHTnkStr         (Gku, Sry: Extended; SelSys: TJNTSelCorpSys): String;
//	procedure gfnNonStdGrdFmt       (srcGrid: TdxDBGrid; SelSys: TJNTSelCorpSys);
//	procedure gfnSetSummaryItemAttr (srcGrid: TdxDBGrid; qryDsp: TQuery; FldNm: string; Tag: integer);
//  function  gfnGetYMStr           (YYMM: Integer; Flg:Integer; SelSys: TJNTSelCorpSys): String;
//  function  gfnGetKessanSTNYM     (Para: TJNTHani): Integer;
//  function  gfnGetPassMonth       (STNYM: Integer; EDNYM: Integer): Integer;
//  function  gfnGetPrnGrpNo        (const lcGrpNo: Integer; PtnNo: integer): Integer;

implementation


//-----------------------------------------------------------------------------
//  gfnHaniInit()
//      範囲ダイアログ初期処理
//-----------------------------------------------------------------------------
function gfnHaniInit(SrcForm: TComponent; m_pMjsAppRec, m_pMDataModule, m_pCommonArea: Pointer;
                     dbCorp: TFDConnection; PgID: String; var HaniPara: TJNTHani; dCorpSys: TJNTSelCorpSys): Boolean;
var
	lvStr       :   String;
    lvIniFile   :   TIniFile;
begin

	Result := TRUE;

    // Iniﾌｧｲﾙ名を取得する
    gfnPIniName( m_pMjsAppRec, HaniPara, dCorpSys, PgID );

    // 印刷用ｵﾌﾞｼﾞｪｸﾄ等を構築する
	gfnPrnInit(SrcForm, m_pMjsAppRec, m_pMDataModule,
               m_pCommonArea, dbCorp, HaniPara, dCorpSys );

    // iniﾌｧｲﾙの存在をﾁｪｯｸする
    if ( FileExists( HaniPara.pvDlgIniFile ) = FALSE ) then
    begin
        //存在しないのでｴﾗｰ
	    lvStr := '範囲指定用情報ﾌｧｲﾙが存在しません。' + #13 + #10
               + 'ｼｽﾃﾑ管理者に連絡してください。';

		MjsMessageBox( SrcForm, lvStr, mjError, mjDefOk );
		Result := FALSE;
        Exit;
    end;

    // Iniﾌｧｲﾙ名ｾｯﾄ
    lvIniFile   :=  TIniFile.Create( HaniPara.pvDlgIniFile );

  	with HaniPara, lvIniFile do
    begin
        // 日付書式を設定する
(* <001>Del
        if ( dCorpSys.GetYYKbn = 1 ) then
            pvrYMDFmt := 'ee''年''mm''月''dd''日'''	    // 和暦
        else
            pvrYMDFmt := 'yyyy''年''mm''月''dd''日''';	// 西暦
*)

        // Return用兼表示ﾃﾞｰﾀ保存用
        // SetLength(pvrStDate, 3);			// 開始日付
        // SetLength(pvrEdDate, 3);			// 終了日付


        pvrYearKbn := dCorpSys.GetYYKbn;    // <001> 1:和暦

        // 日付初期値を設定する
        gfnSetDefaultDate( lvIniFile, HaniPara );

        SetLength(pvrRgType, 0);
        SetLength(pvrStCode, 0);
        SetLength(pvrStName, 0);
        SetLength(pvrEdCode, 0);
        SetLength(pvrEdName, 0);
        SetLength(pvrWhere , 0);

        pvPrgID     :=   PgID;                                                  // PGID<001>
        pvrPattern  :=   ReadInteger('DefaultInf', 'DefPrnPtn', 0);		        // 印刷ﾊﾟﾀｰﾝ
	    pvrRepTitle :=                                                          // 印刷ﾊﾟﾀｰﾝ名
                ReadString('PrnPatternInf', 'Text'+ IntToStr(pvrPattern), '');

        pvrOrder    :=   ReadInteger('DefaultInf', 'DefOrder',  -1);		    // 印刷順1
        pvrShokei 	:=  (ReadInteger('DefaultInf', 'DefShokei',   0) = 1);	    // 小計毎改頁
        pvrTemplate :=  (ReadInteger('DefaultInf', 'DefTemplate', 0) = 1);	    // ﾃﾝﾌﾟﾚｰﾄを出力する

        //<002> ---St---
        pvrNayoseOya :=  (ReadInteger('DefaultInf', 'DefPNayose', 0) = 1);	    // 名寄せ親を除く
        pvrNayoseKo  :=  (ReadInteger('DefaultInf', 'DefCNayose', 0) = 1);	    // 名寄せ子を除く

        UseTokui  :=  (ReadInteger('DefaultInf', 'DefTSaiyou', 0) = 1);	    // 得意先採用
        UseSiire  :=  (ReadInteger('DefaultInf', 'DefSSaiyou', 0) = 1);	    // 仕入先採用
        UseNashi  :=  (ReadInteger('DefaultInf', 'DefNSaiyou', 0) = 1);	    // 採用なし
        //<002> ---Ed---

        pvrOrderNM  :=                                                          // 印刷順1名
                ReadString('OrderInf_0',
                                    'Text' + IntToStr(pvrOrder), '');


//<001>Del        pvrDelete 	:=  (ReadInteger('DefaultInf', 'DefDelete',   0) = 1);	    // 削除されたものも出力する

        // ～分類の文字列の置換処理
        // gfnVarNameSet(pvrOrderNM, SelSys);

    end;

end;

//-----------------------------------------------------------------------------
//  gfnHaniInit2()
//      範囲ダイアログ初期処理(範囲指定なし版)
//-----------------------------------------------------------------------------
function gfnHaniInit2(SrcForm: TComponent; m_pMjsAppRec, m_pMDataModule, m_pCommonArea:	Pointer;
                      dbCorp: TFDConnection; var HaniPara: TJNTHani; dCorpSys: TJNTSelCorpSys): Boolean;
begin

	Result := TRUE;

    // 印刷用ｵﾌﾞｼﾞｪｸﾄ等を構築する
	gfnPrnInit(SrcForm, m_pMjsAppRec, m_pMDataModule,
               m_pCommonArea, dbCorp, HaniPara, dCorpSys );

end;

//-----------------------------------------------------------------------------
//  gfnGetIniFilePath()
//      IniFileのPathを取得する
//-----------------------------------------------------------------------------
function gfnGetIniFilePath(m_pMjsAppRec: Pointer): String;
var
    m_pRec      :   ^TMjsAppRecord;
begin

    m_pRec := m_pMjsAppRec;
	Result := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\INIPRN\';

end;

//-----------------------------------------------------------------------------
//  gfnPIniName()
//      Iniﾌｧｲﾙの名称取得
//-----------------------------------------------------------------------------
function gfnPIniName(m_pMjsAppRec: Pointer; var HaniPara: TJNTHani; dCorpSys: TJNTSelCorpSys;
                     PgID: String) : Boolean;
var
	lvStr   :   String;
begin

	Result := TRUE;

    try
        lvStr   :=  gfnGetIniFilePath(m_pMjsAppRec) + PgID;
        // ﾀﾞｲｱﾛｸﾞ設定用Iniﾌｧｲﾙ名作成
        HaniPara.pvDlgIniFile := lvStr + 'Dlg.ini';
        // SQL設定用Iniﾌｧｲﾙ名作成
//<001>Del        HaniPara.pvSqlIniFile := lvStr + 'Sql.ini';
    except
		Result := FALSE;
    end;

end;

//-----------------------------------------------------------------------------
//  gfnPrnInit()
//      印刷処理構築
//-----------------------------------------------------------------------------
function gfnPrnInit(SrcForm: TComponent; m_pMjsAppRec, m_pMDataModule, m_pCommonArea: Pointer;
                    dbCorp: TFDConnection; var HaniPara: TJNTHani; dCorpSys: TJNTSelCorpSys): Boolean;
begin

    Result  :=  TRUE;

  	with HaniPara do
    begin
        // 内部的に使用する項目

        SelSys          :=  dCorpSys;	                // 会社ｼｽﾃﾑ情報<001>
        UseDb		    :=  dbCorp;				        // 会社DB
        pMjsAppRec      :=  m_pMjsAppRec;               // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ

        // 帳票に使用する項目
        PrnSupport  :=  nil;
        PrnSupport  :=  TMJSPrnSupport.Create;

        if ( PrnSupport = nil ) then
        begin
            raise Exception.Create('MJS印刷Class作成失敗');
            Result  :=  FALSE;
            Exit;
        end;

        MJSPrnDlgf  :=  nil;
        MJSPrnDlgf  :=  TMJSPrnDlgf.Create(SrcForm);

        if ( MJSPrnDlgf = nil ) then
        begin
            raise Exception.Create('MJS印刷ﾀﾞｲｱﾛｸﾞ作成失敗');
            Result:=FALSE;
            Exit;
        end;

        mjspre  :=  nil;
        mjspre  :=  TMjsPreviewIF.Create;

        if ( mjspre = nil ) then
        begin
            raise Exception.Create('MJSﾌﾟﾚﾋﾞｭｰ作成失敗');
            Result  :=  FALSE;
            Exit;
        end;

        mjspre.Init( m_pMjsAppRec );
    end;

end;

//-----------------------------------------------------------------------------
//  gfnHaniTerm()
//      範囲ダイアログ終了処理
//-----------------------------------------------------------------------------
function gfnHaniTerm(HaniPara: TJNTHani): Boolean;
begin

	Result  :=  TRUE;

    try

    	with HaniPara do
        begin
            // 印刷ﾌﾟﾚﾋﾞｭｰ
            mjspre.Term();
            mjspre.Free;
            mjspre  :=  nil;

            // 印刷ﾀﾞｲｱﾛｸﾞ
            MJSPrnDlgf.Free;
            MJSPrnDlgf  :=  nil;

            // 印刷設定
            PrnSupport.Free;
            PrnSupport  :=  nil;
        end;
    except
    	Result := FALSE;
    end;

end;

//-----------------------------------------------------------------------------
//  gfnSelSetPrnInfo()
//      MjsPenSupportに共通パラメーターをセット
//-----------------------------------------------------------------------------
function gfnSelSetPrnInfo( _PrnSupport : TMjsPrnSupport; CorpSys : TJNTSelCorpSys):boolean;
begin

    with _PrnSupport do
    begin

        iSysCode        := CorpSys.GetSysCode;
        // <002>
        //iCalendarKbn    := CorpSys.GetYYKbn;
        iCalendarKbn    := CorpSys.GetYYKbn + 1;
        // <002>
        strCorpCode     := IntToStr(CorpSys.GetKAISHAHcode);    // <001>
// <001>       strCorpCode     := CorpSys.GetHCode2;
        strCorpName     := CorpSys.GetNm;
        iDate		    := 1;
        iPage		    := 1;

        lstCorpCode.Clear();
        lstCorpCode.Add('出力しない');
        lstCorpCode.Add('会社コード');

        // 会社ｺｰﾄﾞﾘｽﾄの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
        iarCorpCodeValue.Clear();
        iarCorpCodeValue.Add(0);
        iarCorpCodeValue.Add(1);

        lstCorpName.Clear();
        lstCorpName.Add('出力しない');
        lstCorpName.Add('会社名');

        // 会社名ﾘｽﾄの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
        iarCorpNameValue.Clear();
        iarCorpNameValue.Add(0);
        iarCorpNameValue.Add(3);

        iKaishaCode 	:= 1;
        iKaishaName		:= 1;

		iDspOfficeBtn	:= 1;	//会計事務所ﾁｪｯｸﾎﾞｯｸｽ表示制御
    end;

	Result := TRUE;

end;

{
//-----------------------------------------------------------------------------
//  gfnDlg_SetCodeLen()
//      ｺｰﾄﾞ桁数設定処理(範囲Dlg)
//-----------------------------------------------------------------------------
procedure gfnDlg_SetCodeLen(STCODE, EDCODE: TdxDBGridButtonColumn;
							DataSet: TDataSet; SelSys: TJNTSelCorpSys);
var
	lvTag, lvCdKs, lvCdZs, lvCdDp: Integer;
begin

	lvTag   :=  DataSet.FieldByName('Tag').AsInteger;
    lvCdZs  :=  DataSet.FieldByName('DATAFORMAT').AsInteger;

    // 属性・桁数を取得する
	if ( SelSys.gfnGetAttr(lvTag, lvCdKs, lvCdZs, lvCdDp) = FALSE ) then
    begin
    	//ｴﾗｰ時のﾃﾞﾌｫﾙﾄ設定
        lvCdKs := 16;
        lvCdZs := 2;
    end;

    //桁数を設定する
    STCODE.MaxLength    :=  lvCdKs;
    EDCODE.MaxLength    :=  lvCdKs;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGrdSetFmt()
//      TQueryのTFieldのDisplayFormat設定処理(帳票表示画面のGridの書式設定)
//-----------------------------------------------------------------------------
procedure gfnGrdSetFmt(QryFld: TField; Tag: Integer; Width: Integer; SelSys: TJNTSelCorpSys);
var
	lvLen       :   Integer;
    lvFmt       :   String;
	lurInzRec   :	grJNTSelInzRec;
begin

    // 初期化
    lvlen := 0;
    lvFmt := '';

    // 日付型のﾌｨｰﾙﾄﾞ
    if ( QryFld is TDateTimeField ) then
    begin
        if ( SelSys.GetYYKbn = 1 ) then
            lvFmt   :=  'ee/mm/dd'
        else
            lvFmt   :=  'yyyy/mm/dd';
        TDateTimeField(QryFld).DisplayFormat := lvFmt;

        if ( Width <> 0 ) then
            lvLen := Width;
        TNumericField(QryFld).DisplayWidth  := lvLen;

        Exit;
    end;

    if ( Tag <> 0 ) then
    begin
		// 桁数を取得する
    	with SelSys do
	    begin
    	    lurInzRec := GetInzRec;
        	case Tag of
	             1500:
    	            begin
        	            lvFmt := lurInzRec.IRI_MASK;	// 入数
            	        lvLen := 9;
                	end;
	             1600:
    	            begin
        	            lvFmt := lurInzRec.KOS_MASK;	// 個数
            	        lvLen := 9;
                	end;
	             1700:
                    begin
                        lvFmt := lurInzRec.KES_MASK;	// 係数
                        lvLen := 9;
                    end;
                 1800:
                    begin
                        lvFmt := lurInzRec.SRY_MASK;	// 数量
                        lvLen := 9;  // (9,999,999)
                    end;
                 1900:
                    begin
                        lvFmt := lurInzRec.TNK_MASK;	// 単価
                        lvLen := 11; // (999,999,999)
                    end;
                 8000:
                    begin
                        lvFmt := '#,##0';		        // 金額
                        lvLen := 13; //(9,999,999,999)
                    end;
                 8100:
                    begin
                        lvFmt := lurInzRec.RT_MASK;		// 率
                        lvLen := 7;
                    end;
                 8200:
                    begin
                        lvFmt := '#,##0';		        // 消費税
                        lvLen := 11; //(999,999,999)
                    end;
                 9501:
                    begin
                        lvLen := 15;                    // 特殊：伝票番号合成
                    end;
                 9511:
                    begin
                        lvFmt := '#,###';		        // 特殊：伝票消費税
                        lvLen := 11; //(999,999,999)
                    end;

            else
                    begin
                        lvFmt := '';			        // 該当なし
                        lvLen := 7;
                    end;
            end;

        end;
	end;

    // iniファイルのwidthの値が0でなければ、その値を設定する
    if ( Width <> 0 ) then
        lvLen   :=  Width;

    // 書式を設定する
    if ( QryFld is TNumericField ) then
    begin
        TNumericField(QryFld).DisplayFormat := lvFmt;
        TNumericField(QryFld).DisplayWidth  := lvLen;
    end;

    if ( QryFld is TStringField ) then
    begin
        TStringField(QryFld).DisplayWidth   := lvLen;
    end;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetFldFmt()
//      Tagから書式文字列を取得する
//-----------------------------------------------------------------------------
function gfnGetFldFmt(Tag: Integer; SelSys: TJNTSelCorpSys): String;
var
    lvFmt       :   String;
	lurInzRec   :	grJNTSelInzRec;
begin

	Result := '';

    // 指定Tagを判断する
    if ( Tag = 0 ) then Exit;

	//桁数を取得する
    with SelSys do
    begin
        lurInzRec   :=  GetInzRec;
        case Tag of
             1500:	lvFmt := lurInzRec.IRI_MASK;	// 入数
             1600:	lvFmt := lurInzRec.KOS_MASK;	// 個数
             1700:	lvFmt := lurInzRec.KES_MASK;	// 係数
             1800:	lvFmt := lurInzRec.SRY_MASK;	// 数量
             1900:	lvFmt := lurInzRec.TNK_MASK;	// 単価
             8000:	lvFmt := '#,##0';		        // 金額
             8100:	lvFmt := lurInzRec.RT_MASK;		// 率
             8200:	lvFmt := '#,##0';		        // 消費税
             8501:                                  // 日付
                begin
                    if ( Selsys.GetYYKbn = 1 ) then
                        lvFmt := 'ee/mm/dd'
                    else
                        lvFmt := 'yyyy/mm/dd';
                end;
             8502:                                  // 年月
                begin
                    if ( Selsys.GetYYKbn = 1 ) then
                        lvFmt := 'ee/mm'
                    else
                        lvFmt := 'yyyy/mm';
                end;
             8503:                                  // 年
                begin
                    if ( Selsys.GetYYKbn = 1 ) then
                        lvFmt := 'ee'
                    else
                        lvFmt := 'yyyy';
                    end;

             9511:  lvFmt := '#,###';		        // 特殊：伝票表示用消費税
        else        lvFmt := '';			        // 該当なし
        end;

    end;

    Result := lvFmt;

end;
}

//-----------------------------------------------------------------------------
//  gfnGetDateDefault
//      ﾀｲﾌﾟに応じた日付値を取得する
//      （SelBasePDialog.fnMakeDlgFieldsで割り返されるのでﾀｲﾌﾟによらず
//      　数値日付型で設定しています）
//-----------------------------------------------------------------------------
function gfnGetDateDefault(DefType: integer; SelSys: TJNTSelCorpSys): Integer;
var
    lvDate  :   integer;
begin

    case DefType of
         1: lvDate := JNTSelXDateToInt8(Date);                      // ｼｽﾃﾑ日付
         2: lvDate := SelSys.GetMonNym * 100 + 1;                   // 当月年月
         3: lvDate := SelSys.GetStNymd;                             // 当月開始日付
         4: lvDate := SelSys.GetEdNymd;                             // 当月終了日付
{
        10: lvDate :=
                gfnJNTSELNendo(SelHBDen.GetSvStNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // 伝票保存開始年
        11: lvDate := SelHBDen.GetSvStNym * 100 + 1;                // 伝票保存開始年月
        12: lvDate := JNTSelXDateToInt8(SelHBDen.GetSvStDymd);      // 伝票保存開始日付
        13: lvDate :=
                gfnJNTSELNendo(SelHBDen.GetSvEdNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // 伝票保存終了年
        14: lvDate := SelHBDen.GetSvEdNym * 100 + 1;                // 伝票保存終了年月
        15: lvDate := JNTSelXDateToInt8(SelHBDen.GetSvEdDymd);      // 伝票保存終了日付

        20: lvDate :=
                gfnJNTSELNendo(SelSys.GetMsvStNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // ﾏｽﾀ実績保存開始年
        21: lvDate := SelSys.GetMsvStNym * 100 + 1;                 // ﾏｽﾀ実績保存開始年月
        22: lvDate := JNTSelXDateToInt8(SelSys.GetMsvStDymd);       // ﾏｽﾀ実績保存開始日付
        23: lvDate :=
                gfnJNTSELNendo(SelSys.GetMsvEdNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // ﾏｽﾀ実績保存終了年
        24: lvDate := SelSys.GetMsvEdNym * 100 + 1;                 // ﾏｽﾀ実績保存終了年月
        25: lvDate := JNTSelXDateToInt8(SelSys.GetMsvEdDymd);       // ﾏｽﾀ実績保存終了日付

        30: lvDate :=
                gfnJNTSELNendo(SelSys.GetJsjStNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // ｼﾞｬｰﾅﾙ保存開始年
        31: lvDate := SelSys.GetJsjStNym * 100 + 1;                 // ｼﾞｬｰﾅﾙ保存開始年月
        32: lvDate := JNTSelXDateToInt8(SelSys.GetJsjStDymd);       // ｼﾞｬｰﾅﾙ保存開始日付
        33: lvDate :=
                gfnJNTSELNendo(SelSys.GetJsjEdNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // ｼﾞｬｰﾅﾙ保存終了年
        34: lvDate := SelSys.GetJsjEdNym * 100 + 1;                 // ｼﾞｬｰﾅﾙ保存終了年月
        35: lvDate := JNTSelXDateToInt8(SelSys.GetJsjEdDymd);       // ｼﾞｬｰﾅﾙ保存終了日付

        40: lvDate :=
                gfnJNTSELNendo(SelSys.GetStTokiNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // 当期開始年
        41: lvDate := SelSys.GetStTokiNym * 100 + 1;                // 当期開始年月
        42: lvDate := JNTSelXDateToInt8(SelSys.GetStTokiDymd);      // 当期開始日付
        43: lvDate :=
                gfnJNTSELNendo(SelSys.GetEdTokiNym,
                         SelSys.GetKessanMM) * 10000 + 101;         // 当期終了年
        44: lvDate := SelSys.GetEdTokiNym * 100 + 1;                // 当期終了年月
        45: lvDate := JNTSelXDateToInt8(SelSys.GetEdTokiDymd);      // 当期終了日付
}
    else lvDate := JNTSelXDateToInt8(Date);
    end;

    Result  :=  lvDate;

end;

//-----------------------------------------------------------------------------
//  gfnSetDefaultDate
//      日付初期値を設定する
//-----------------------------------------------------------------------------
procedure gfnSetDefaultDate( DlgIniFile: TIniFile; var HaniPara: TJNTHani );
var
    lvCnt           :   Integer;
    lvSection       :   String;
    lvType,
    lvDefDataType   :   Integer;
begin

    with DlgIniFile, HaniPara do
    begin
        // ｾｸｼｮﾝを作成する
	    lvSection   :=  'DateInf_0';

        // 情報取得：日付ﾀｲﾌﾟ(1:開始～終了、2:単独)
        lvType      :=  ReadInteger(lvSection, 'Type', -1);

		// 開始日付を設定する
// 050901 hirota デフォルトは空白＝1900/01/01～2099/12/31がいいなぁ…>>
        lvDefDataType   :=  ReadInteger(lvSection, 'DefaultDateS', 0);
        if lvDefDataType = 0 then
			pvrStDate       :=  19000101
        else
			pvrStDate       :=  gfnGetDateDefault(lvDefDataType, SelSys);

        //日付type
        if ( lvType = 1 ) then
		begin
			// 終了日付を設定する
        	lvDefDataType   :=  ReadInteger(lvSection, 'DefaultDateE', 0);
	        if lvDefDataType = 0 then
				pvrEdDate       :=  20991231
        	else
				pvrEdDate       :=  gfnGetDateDefault(lvDefDataType, SelSys);
		end;
// 050901 hirota デフォルトは空白＝1900/01/01～2099/12/31がいいなぁ…<<
	end;

end;
{
//-----------------------------------------------------------------------------
//  gfnVarNameSet()
//      ～分類の文字列の置換処理（Tagなしの場合：範囲Dlgの集計単位名、印刷順名等）
//-----------------------------------------------------------------------------
procedure gfnVarNameSet( var srcStr: String; SelSys: TJNTSelCorpSys);
var
	i,
    lvPos   :   Integer;
    lvTgt   :   String;

begin

    for i := 0 to 8 do
    begin
        case i of
            0:  lvTgt := '得意先分類1';
            1:  lvTgt := '得意先分類2';
            2:  lvTgt := '得意先分類3';
            3:  lvTgt := '仕入先分類1';
            4:  lvTgt := '仕入先分類2';
            5:  lvTgt := '仕入先分類3';
            6:  lvTgt := '商品分類1';
            7:  lvTgt := '商品分類2';
            8:  lvTgt := '商品分類3';
        else        lvTgt := '';
        end;

        lvPos := Pos( lvTgt, srcStr );
        if ( lvPos <> 0 ) then
        begin
            break;
        end;
    end;

    if ( lvPos <> 0 ) then

    begin
        case i of
            0:  JNTSelXReplace(srcStr, lvTgt, SelSys.GettkBrNm1);
            1:  JNTSelXReplace(srcStr, lvTgt, SelSys.GettkBrNm2);
            2:  JNTSelXReplace(srcStr, lvTgt, SelSys.GettkBrNm3);
            3:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetsiBrNm1);
            4:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetsiBrNm2);
            5:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetsiBrNm3);
            6:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetshBrNm1);
            7:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetshBrNm2);
            8:  JNTSelXReplace(srcStr, lvTgt, SelSys.GetshBrNm3);
        end;
    end;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnVarNameSet()
//      ～分類の文字列の置換処理（Tagありの場合：範囲Dlgの範囲条件等）
//-----------------------------------------------------------------------------
procedure gfnVarNameSetTag(TagNo: integer; var srcStr: string; SelSys: TJNTSelCorpSys);
var
    lvSrc, lvTgt    :   String;
begin

    if ( TagNo = 0 ) then exit;

    lvTgt   :=  '';
    case TagNo of
        1011:  lvTgt := '得意先分類1';
        1012:  lvTgt := '得意先分類2';
        1013:  lvTgt := '得意先分類3';
        1021:  lvTgt := '仕入先分類1';
        1022:  lvTgt := '仕入先分類2';
        1023:  lvTgt := '仕入先分類3';
        1031:  lvTgt := '商品分類1';
        1032:  lvTgt := '商品分類2';
        1033:  lvTgt := '商品分類3';
    end;

    if ( lvTgt = '' ) then exit;

    case TagNo of
        1011:  lvSrc := SelSys.GettkBrNm1;
        1012:  lvSrc := SelSys.GettkBrNm2;
        1013:  lvSrc := SelSys.GettkBrNm3;
        1021:  lvSrc := SelSys.GetsiBrNm1;
        1022:  lvSrc := SelSys.GetsiBrNm2;
        1023:  lvSrc := SelSys.GetsiBrNm3;
        1031:  lvSrc := SelSys.GetshBrNm1;
        1032:  lvSrc := SelSys.GetshBrNm2;
        1033:  lvSrc := SelSys.GetshBrNm3;
    end;

    JNTSelXReplace( srcStr, lvTgt, lvSrc );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetPerStr()
//      率を算出・書式化した文字列を取得する
//-----------------------------------------------------------------------------
function gfnGetPerStr(AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
var
    lvFmt   :   String;
	lvPer   :   Extended;
begin

	Result  :=  '';

    // 率の書式文字を取得する
    lvFmt   :=  gfnGetFldFmt(8100, Selsys);

    // 率を算出する（少数第3位を四捨五入）
    if ( UGku = 0 ) then
        lvPer   :=  0
    else
        lvPer   :=  gfnJNTSELNumRnd( (AGku * 100 / UGku), 1, -2 );

    // 率を書式文字列化
    Result  :=  FormatFloat( lvFmt, lvPer );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetAraPerStr()
//      粗利率を算出・書式化した文字列を取得する
//-----------------------------------------------------------------------------
function gfnGetAraPerStr(AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
var
    lvFmt   :   String;
	lvPer   :   Extended;
begin

	Result  :=  '';

    // 粗利率の書式文字を取得する
    lvFmt   :=  gfnGetFldFmt( 8100, Selsys );

    // 粗利率を算出する（少数第3位を四捨五入）
    if ( UGku = 0 ) then
        lvPer   :=  0
    else
        lvPer   :=  gfnJNTSELNumRnd( (AGku * 100 / UGku), 1, -2 );

    // 粗利率を書式文字列化
    Result  :=  FormatFloat( lvFmt, lvPer );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetKaiPerStr()
//      回収率を算出・書式化した文字列を取得する
//-----------------------------------------------------------------------------
function gfnGetKaiPerStr(AGku, UGku: Extended; SelSys: TJNTSelCorpSys): String;
var
    lvFmt   :   String;
	lvPer   :   Extended;
begin

	Result  :=  '';

    // 回収率の書式文字を取得する
    lvFmt   :=  gfnGetFldFmt( 8100, Selsys );

    // 回収率を算出する（少数第3位を四捨五入）
    if ( UGku = 0 ) then
        lvPer   :=  0
    else
        lvPer   :=  gfnJNTSELNumRnd( (AGku * 100 / UGku), 1, -2 );

    // 回収率を書式文字列化
    Result  :=  FormatFloat( lvFmt, lvPer );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetHTnkStr()
//      平均単価を算出・書式化した文字列を取得する
//-----------------------------------------------------------------------------
function gfnGetHTnkStr(Gku, Sry: Extended; SelSys: TJNTSelCorpSys): String;
var
    lvFmt   :   String;
	lvHTnk  :   Extended;
begin

	Result  :=  '';

    // 単価の書式文字を取得する
    lvFmt   :=  gfnGetFldFmt( 1900, Selsys );

    // 平均単価を算出する（四捨五入）
    if ( Sry = 0 ) then
        lvHTnk  :=  0
    else
        lvHTnk  :=  gfnJNTSELNumRnd( (Gku / Sry), 1, (Selsys.GetTnkSSet-1) * -1 );

    // 平均単価を書式文字列化
    Result  :=  FormatFloat( lvFmt, lvHTnk );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnNonStdGrdFmt()
//      非標準ﾀｲﾌﾟｸﾞﾘｯﾄﾞの書式化
//-----------------------------------------------------------------------------
procedure gfnNonStdGrdFmt(srcGrid: TdxDBGrid; SelSys: TJNTSelCorpSys);
var
	lvCNm, lvFNm,  lvFmt:   String;
    lvInt, lvInt2, lvTag:   Integer;
begin

    with srcGrid do
    begin

	    for lvInt := 0 to ColumnCount - 1 do
	    begin
	        // Columnの設定を取得する
	        lvFNm   :=  Columns[lvInt].FieldName;
	        lvCNm   :=  Columns[lvInt].Name;
	        lvTag   :=  Columns[lvInt].Tag;
	        lvFmt   :=  gfnGetFldFmt(lvTag, SelSys);

	        // Columnの属性を設定する
	        if ( lvTag <> 0 ) then
	            gfnGrdSetFmt( DataSource.DataSet.FieldByName(lvFNm), lvTag, 0, SelSys );

	        // SummaryFooterの設定
	        if ( TdxDBGridColumn(Columns[lvInt]).SummaryFooterType = cstSum ) then
	        begin
	            TdxDBGridColumn(Columns[lvInt]).SummaryFooterFormat:= lvFmt;

	            // SummaryItemsの設定
	            for lvInt2 := 0 to SummaryGroups[0].SummaryItems.Count - 1 do
	            begin
	                if ( SummaryGroups[0].SummaryItems[lvInt2].ColumnName = lvCNm ) then
	                begin
	                    if ( SummaryGroups[0].SummaryItems[lvInt2].SummaryType = cstSum ) then
                            SummaryGroups[0].SummaryItems[lvInt2].SummaryFormat := lvFmt;
	                    break;
	                end;
	            end;
	        end;
    	end;
    end;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnSetSummaryItemAttr()
//      集計項目の属性を設定する
//-----------------------------------------------------------------------------
procedure gfnSetSummaryItemAttr(srcGrid: TdxDBGrid; qryDsp: TQuery; FldNm: string; Tag: integer);
var
	lvCNm, lvFNm,  lvFmt    :   String;
    lvInt, lvInt2, lvInt3   :   Integer;
begin

    with srcGrid do
    begin

	    for lvInt := 0 to ColumnCount - 1 do
	    begin
	        // Columnの設定を取得する
	        lvFNm   :=  Columns[lvInt].FieldName;
	        lvCNm   :=  Columns[lvInt].Name;

            if ( FldNM = Copy(lvFNm, 1, length(FldNM)) ) then
            begin
                // 書式文字列を取得する
                lvFmt   :=  TNumericField(qryDsp.FindField(lvFNm)).DisplayFormat;

                // SummaryFooterの設定
                if ( TdxDBGridMaskColumn(Columns[lvInt]).SummaryFooterType = cstSum ) then
                begin
                    TdxDBGridMaskColumn(Columns[lvInt]).SummaryFooterFormat:= lvFmt;

                    for lvInt3 := 0 to SummaryGroups.Count - 1 do
        			begin
	                    // SummaryItemsの設定
	                    for lvInt2 := 0 to SummaryGroups[lvInt3].SummaryItems.Count - 1 do
	                    begin
	                        if ( SummaryGroups[lvInt3].SummaryItems[lvInt2].ColumnName = lvCNm ) then
	                        begin
	                            if ( SummaryGroups[lvInt3].SummaryItems[lvInt2].SummaryType = cstSum ) then
	                                SummaryGroups[lvInt3].SummaryItems[lvInt2].SummaryFormat := lvFmt;
	                            break;
	                        end;
    	                end;
	                end;
                end;
            end;
    	end;
    end;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetYMStr()
//      年月型の年月の書式化
//-----------------------------------------------------------------------------
function gfnGetYMStr(YYMM: Integer; Flg:Integer; SelSys: TJNTSelCorpSys): String;
var
    lvY, lvM:   Integer;
    lvDate  :   TDateTime;
    lvFmt   :   String;
begin

    lvY :=  JNTSelXYmYear(YYMM);
    lvM :=  JNTSelXYmMonth(YYMM);

    lvDate  :=  EnCodeDate(lvY, lvM, 1);

    if ( SelSys.GetYYKbn = 1 ) then
    begin
        if  ( Flg = 1 )  then
            lvFmt := 'ee''年''mm''月'''
        else
            lvFmt := 'ee''年''mm''月度''';
    end
    else
    begin
        if  ( Flg = 1 )  then
            lvFmt := 'yyyy''年''mm''月'''
        else
            lvFmt := 'yyyy''年''mm''月度''';
    end;

    Result  :=  FormatDateTime( lvFmt, lvDate );

end;
}
{
//-----------------------------------------------------------------------------
//  gfnDlg_SetCodeZk()
//      ｺｰﾄﾞ属性取得処理(範囲Dlg)
//-----------------------------------------------------------------------------
function gfnDlg_SetCodeZk(const lcTag: Integer; SelSys: TJNTSelCorpSys): Integer;
var
	lvCdKs, lvCdZs, lvCdDp: Integer;
begin

    // 属性・桁数を取得する
	if ( SelSys.gfnGetAttr(lcTag, lvCdKs, lvCdZs, lvCdDp) = FALSE ) then
    begin
    	// ｴﾗｰ時のﾃﾞﾌｫﾙﾄ設定
        lvCdKs  :=  16;
        lvCdZs  :=  2;
    end;

    Result  :=  lvCdZs;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetKessanSTNYM()
//      入力された年月の決算開始年月を取得する
//-----------------------------------------------------------------------------
function gfnGetKessanSTNYM(Para: TJNTHani): Integer;
var
	lvMM, lvYY, lvNYM: Integer;
begin

    // 決算月の取得
    lvMM    :=  Para.Selsys.GetKessanMM;

    // 入力年月の年度の取得
    lvYY    :=  gfnJNTSELNendo( Para.pvrSYM, lvMM );

    // 決算開始年月の取得
    lvNYM   :=  lvYY * 100 + Para.Selsys.GetKessanSTMM;

    Result  :=  lvNYM;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetPassMonth()
//	開始月から終了月までの月数を取得する
//
//	開始月が含まれているため、経過月数ではないのに注意
// 	(開始月＝終了月のとき,戻り値は１になる)
//	経過月数は取得した値を-1すれば求められる
//-----------------------------------------------------------------------------
function gfnGetPassMonth(STNYM: Integer; EDNYM: Integer): Integer;
var
	lvSTYY, lvEDYY,
	lvSTMM, lvEDMM,
	lvPassYear, lvPassMonth: Integer;
begin

    // 入力された年月の年を求める
	lvSTYY  :=  Trunc(STNYM / 100);
	lvEDYY  :=  Trunc(EDNYM / 100);

    // 入力された年月の月を求める
    lvSTMM  :=  STNYM mod 100;
    lvEDMM  :=  EDNYM mod 100;

    // 終了年から開始年までの年数を求める
    lvPassYear  := lvEDYY - lvSTYY;

    // 終了月から開始月までの月数を求める
    lvPassMonth := lvEDMM - lvSTMM;

	// 月数を計算する
    lvPassMonth := (lvPassYear * 12) + 1 + lvPassMonth;

    Result := lvPassMonth;

end;
}
{
//-----------------------------------------------------------------------------
//  gfnGetPrnGrpNo
//      特殊帳票用ｸﾞﾙｰﾌﾟNO取得処理
//-----------------------------------------------------------------------------
function  gfnGetPrnGrpNo(const lcGrpNo: Integer; PtnNo: integer): Integer;
var
	lvGrpNo :   String;
    lvPtn   :   String;
begin

    // 引数を所定の文字数に変換する
    lvGrpNo := Format('%.6d', [lcGrpNo]);
    lvPtn   := Format('%.2d', [PtnNo]);

    // lcGrpNo の3,4桁を PtnNo で置き換える
    Delete(lvGrpNo, 3, 2);
    Insert(lvPtn, lvGrpNo, 3);

    Result := StrToInt(lvGrpNo);

end;
}

end.







