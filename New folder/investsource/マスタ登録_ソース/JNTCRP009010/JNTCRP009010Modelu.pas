//************************************************************************
//	System		:	Galileopt / Galileopt NX-I
//	Program		:	科目別補助登録(簡易)
//	ProgramID	:	JNTCRP009010
//	Name		:	M.Makino
//	Create		:	2012 / 07 / 01
//	Comment		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//	HISNO-00001	2018/05/15	M.Kashima(ALPHA)科目別補助データ取得処理で「グループ別権限採用あり」の際の「SecHojyoDispInfo」との結合KEYを追加する
//********* Ver5.04 *******************************************************
//	<001>		:	2012 / 09 / 20	M.Makino
//					印刷条件設定DLGでページ範囲指定通りに出力されない点を修正。
//	<002>		:	2018 / 09 / 14	T.Komatsu
//					Edgetracker連携を行っている場合、科目別補助を削除した後にマスタを見直すメッセージを出力する。
//	<003>		:	2019 / 09 / 14	T.Hosaka(SIG)
//					グリッド入力データの改行コードを取り除く処理を追加
//*************************************************************************
unit JNTCRP009010Modelu;

interface

uses
  Windows, SysUtils, VCL.Dialogs, MJSCommonDialogs, VCL.Forms, Contnrs, FireDAC.Comp.Client, Db, VCL.Controls, dxmdaset,
  Classes, MjsMsgStdu, MjsDispCtrl, MJSStrCtrl, MJSDBModuleu, MJSQuery,
  MjsPrnSupportu, MjsPrnDlgu, MjsPreviewIFu, MJSCommonu, JNTCommonu,
  JNTFuncU, JNTPDlg, JNTSelCorpSys, JNTMasComu, JNTMasWndIFu, JNTExpGlobal,
  ppDB, ppDBPipe, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer,
  ppParameter, FireDAC.Comp.DataSet;

const
  {$I MASDef.inc}
type
  {$I ActionInterface.inc}

  {参照データ}
  TReferData = class
  private
  	// 担当者情報
	m_fTantoNCode	: Extended;     // 担当者内部コード
    m_iTantoFixFlg	: Integer;		// 担当者の削除・変更・参照フラグ
  	// グループ別権限情報
    m_iSecSaiyo		: Integer;      // グループ別権限採用区分
    m_iSecMasterKbn	: Integer;      // マスタ区分
    m_fSecSegNCode	: Extended;		// セグメント内部コード
    m_iSecSuperGKbn	: Integer;		// スーパーグループ区分※SuperGは非表示制約を受けない
    m_iSecHojyoDefKbn: Integer;     // 補助表示マスタ初期値(0:デフォルト表示不可,1:デフォルト表示可)
  	// 権限情報
    m_bPermsUpdate	: Boolean;		// 追加・修正権限
    m_bPermsDelete	: Boolean;      // 削除権限
    m_bPermsPrn		: Boolean;      // 印刷権限
    m_bPermsFileOut	: Boolean;      // 抽出権限

    m_iKakuteiKbn	: Integer;		// 決算確定区分
    m_iYearKbn		: Integer;		// 和暦西暦区分
    m_sValidChar	: String;		// 使用可能コード
    m_iReferFlag	: Integer;		// 参照モードフラグ
    m_fDspKmkNCode	: Extended;		// 表示対象の科目内部コード
    m_iDspKmkGCode	: Integer;		// 表示対象の科目外部コード
    m_sDspKmkSimpleName	: String;	// 表示対象の科目簡略名称
    m_iDspCodeDigit	: Integer;		// 表示対象の科目別補助コード桁数
    m_iDspCodeAttr	: Integer;		// 表示対象の科目別補助コード属性
  public
  	constructor Create();
    property TantoNCode:	Extended	read m_fTantoNCode		write m_fTantoNCode;
    property TantoFixFlg:	Integer		read m_iTantoFixFlg		write m_iTantoFixFlg;
    property SecSaiyo:		Integer		read m_iSecSaiyo   		write m_iSecSaiyo;
    property SecMasterKbn:	Integer		read m_iSecMasterKbn	write m_iSecMasterKbn;
    property SecSegNCode:	Extended    read m_fSecSegNCode		write m_fSecSegNCode;
    property SecSuperGKbn:	Integer     read m_iSecSuperGKbn	write m_iSecSuperGKbn;
    property SecHojyoDefKbn: Integer    read m_iSecHojyoDefKbn	write m_iSecHojyoDefKbn;
    property PermsUpdate:	Boolean		read m_bPermsUpdate		write m_bPermsUpdate;
    property PermsDelete:	Boolean		read m_bPermsDelete		write m_bPermsDelete;
    property PermsPrn:		Boolean		read m_bPermsPrn		write m_bPermsPrn;
    property PermsFileOut:	Boolean		read m_bPermsFileOut	write m_bPermsFileOut;
    property KakuteiKbn:	Integer		read m_iKakuteiKbn		write m_iKakuteiKbn;
    property YearKbn:		Integer		read m_iYearKbn			write m_iYearKbn;
    property ValidChar:		String		read m_sValidChar		write m_sValidChar;
    property ReferFlag:		Integer		read m_iReferFlag		write m_iReferFlag;
    property DspKmkNCode:	Extended	read m_fDspKmkNCode		write m_fDspKmkNCode;
	property DspKmkGCode:	Integer		read m_iDspKmkGCode		write m_iDspKmkGCode;
    property DspKmkSimpleName:String	read m_sDspKmkSimpleName write m_sDspKmkSimpleName;
	property DspCodeDigit:	Integer		read m_iDspCodeDigit	write m_iDspCodeDigit;
    property DspCodeAttr:	Integer		read m_iDspCodeAttr		write m_iDspCodeAttr;
  end;

  {データ操作クラス}
  TDataHelper = class(TDataModule)
    SPMasKmk: TFDStoredProc;
    SPPayKmk: TFDStoredProc;
    SPCrdKmk: TFDStoredProc;
    SPMsHist: TFDStoredProc;
    DMemSaimoku_Dsp: TdxMemData;
    DMemSaimoku_Prn: TdxMemData;
    DMemSaimoku_Save: TdxMemData;
    DMemSaimoku_DspCNCode: TFloatField;
    DMemSaimoku_DspSubCode: TStringField;
    DMemSaimoku_DspRenso: TStringField;
    DMemSaimoku_DspLongName: TStringField;
    DMemSaimoku_DspSimpleName: TStringField;
    DMemSaimoku_DspSyokuchiKbn: TIntegerField;
    DMemSaimoku_PrnKmkGCode: TIntegerField;
    DMemSaimoku_PrnSubCode: TStringField;
    DMemSaimoku_PrnRenso: TStringField;
    DMemSaimoku_PrnLongName: TStringField;
    DMemSaimoku_PrnCodeAttr: TIntegerField;
    DMemSaimoku_DspKmkNCode: TFloatField;
    DMemSaimoku_SaveCNCode: TFloatField;
    DMemSaimoku_SaveSubCode: TStringField;
    DMemSaimoku_SaveRenso: TStringField;
    DMemSaimoku_SaveLongName: TStringField;
    DMemSaimoku_SaveSimpleName: TStringField;
    DMemSaimoku_SaveSyokuchiKbn: TIntegerField;
    DMemSaimoku_SaveKmkNCode: TFloatField;
    DMemSaimoku_PrnSimpleName: TStringField;
    DMemSaimoku_PrnKmkSimpleName: TStringField;
    DMemSaimoku_PrnSortStr: TStringField;
    RSaimoku: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppLineBootom: TppLine;
    ppLineLeft: TppLine;
    ppLineTop: TppLine;
    ppLine15: TppLine;
    ppLabel50: TppLabel;
    R_SDate: TppSystemVariable;
    R_SCorpNo: TppLabel;
    R_SCorpName: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLabel53: TppLabel;
    ppLabel18: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel55: TppLabel;
    ppLineRight: TppLine;
    ppLabel1: TppLabel;
    ppDetailBand_Saimoku: TppDetailBand;
    ppUnderLineS: TppLine;
    R_KmkCode: TppDBText;
    R_KmkName: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    R_SubCode: TppDBText;
    ppLine30: TppLine;
    ppDBText49: TppDBText;
    ppLine32: TppLine;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    R_CodeAttr: TppDBText;
    ppFooterBand1: TppFooterBand;
    R_SPage: TppSystemVariable;
    R_SKaikeiName: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    RPipeline_Saimoku: TppDBPipeline;
    DataSource_Saimoku_Prn: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DMemSaimoku_DspAfterPost(DataSet: TDataSet);
    procedure R_KmkCodePrint(Sender: TObject);
    procedure R_SubCodePrint(Sender: TObject);
    procedure RSaimokuEndPage(Sender: TObject);
    procedure ppDetailBand_SaimokuBeforeGenerate(Sender: TObject);
    procedure OnCommonBeforePrint(Sender: TObject);	//<001> ADD
    // <002> add↓
    procedure   ErrorMessageDsp(DmQuery: TMQuery);
    procedure   fnEdgeTrackerKeihiSeisanMsg();
    // <002> add↑
  private
	m_pMyAppRecord	: ^TMjsAppRecord;
   	m_Owner			: TComponent;
	m_JNTCommon		: TJNTCommon;
    m_JNTMASCom		: TJNTMASCom;
	m_MjsMsgRec		: TMjsMsgRec;
	m_CorpDB		: TFDConnection;
	m_DBModule		: TMDataModulef;
	m_Query			: TMQuery;
    m_JNTSelSys     : TJNTSelCorpSys;	// 会社ｼｽﾃﾑ情報
    m_JNTHani       : TJNTHani;			// 範囲DLF用パラメータ
    m_PrnSupport	: TMJSPrnSupport;
    m_MjsPrnDlg     : TMJSPrnDlgf;      // 印刷条件設定DLG
    m_ReferData		: TReferData;       // 初期データ

    m_wkKmkGCode	: String;    

    procedure SetTantoInfo();
    procedure SetSecInfo();
    procedure SetKakuteiKbn();
    procedure SetDataDTMain();
    procedure SetPerms();
    procedure SetReferFlag();
	procedure SetSPParam(var aSP: TFDStoredProc);
	procedure SetSPDB(var aSP: TFDStoredProc);
	procedure SetFileOut(aSelectPtn: Integer;var aTitle, aMemFld: TStringList);
	procedure SessionPractice(aSyori: Integer);
	function CallStoredProc(aSyoriKbn: Integer): Boolean;
	procedure CopyMemData(var fromMemdata,toMemdata :TdxMemData);
	procedure WriteSaimoku_KmkMA();
	function IsInsertSaimoku_KmkMB(): Boolean;
    function IsInsertSaimoku_SecHojyoDispInfo(): Boolean;
    function IsDeleteSaimoku_SecHojyoDispInfo(): Boolean;
    function CRLFCut(sName: String): String; // <003> add
  public

	// コンストラクタ
    constructor CreateForm(aOwner: TComponent; aRec: Pointer);
    // デストラクタ
    destructor Destroy; override;
	procedure DestructInstance();

	procedure GetReferData();
    function GetMaxCNCode(): Extended;
	procedure GetSaimokuData(aMem: TdxMemData; aStKmkGCode, aEdKmkGCode, aOrder: Integer);
    procedure GetKmkInfo(aKmkGCode: Integer);
    procedure DeleteSaimoku_KmkMA();
	procedure AppendRecord(aSubCode, aRenso, aLongName, aSimpleName: String; aSyokuchiKbn: Integer);
	procedure ClearMemData();
	procedure ClearReferDataDsp();
    procedure SetInvisibleData();
	procedure SetChangedSubCode();
    procedure SetSimpleNameFromLongNmae(aColIndex: Integer);
    procedure SetAppRec(aKbn: Integer);
    function CheckKmkGCode(aKmkGCode: Integer): Integer;
	function IsExistSKC(aKmkGCode: Integer): Boolean;
	function IsExistSmkNoSKC(): Boolean;
	function IsSecKmkNoDsp(aKmkGCode: Integer): Boolean;
    function IsExistSameSubCode(aSubCode: String): Boolean;
    function IsExistSwk(): Boolean;
	function ISGetExpRet(aMasterKbn: Integer): Boolean;
	procedure DoPrint();
	function ChangeCode(aType: Integer; aSubCode: String): String; overload;
	function ChangeCode(aSubCode: String; aCodeDigit, aCodeAttr: Integer): String; overload;


    // MainユニットからDataHelperクラスのDataを参照できるよう公開
    property ReferData:			TReferData	read m_ReferData;
	property JNTMASCom:			TJNTMASCom	read m_JNTMASCom;
    property JNTHani:			TJNTHani	read m_JNTHani			write m_JNTHani;
    property MemSaimoku_Dsp:	TdxMemData	read DMemSaimoku_Dsp	write DMemSaimoku_Dsp;
    property MemSaimoku_Prn:	TdxMemData	read DMemSaimoku_Prn	write DMemSaimoku_Prn;
    property MemSaimoku_Save:	TdxMemData	read DMemSaimoku_Save	write DMemSaimoku_Save;
  end;

const
	C_ST_PROCESS	= 0;			// 設定
	C_ED_PROCESS	= 1;			// 開放

	// 参照モードフラグ
	NORMAL			= 1;			// 通常処理
	REFER			= 3;			// 参照

    // 決算確定区分
	KAKUTEIZUMI		= 1;			// 確定済

    // 諸口区分
    NOT_SYOKUCHI	= 0;
    SYOKUCHI		= 1;

    // 採用区分
    SAIYONASI		= 0;
	SAIYOARI		= 1;

    // 関数返り値
    RET_NG			= -1;
    RET_OK			= 0;
	RET_NOTEXIST	= 1;
    RET_NOTADOPT    = 2;

    // コード属性
    INT_ZERO_NASI	= 0;
    INT_ZERO_ARI	= 1;
    STR_FREE		= 2;

	// 処理区分
	SYORI_START		= 0;
    SYORI_END		= 1;

    // 販売・財務区分
	KBN_SEL			= 0;
	KBN_MAS			= 1;

    // 和暦西暦区分
    YEARKBN_WAREKI	= 0;	//和暦
    YEARKBN_SEIREKI	= 1;	//西暦        

	// コード変換タイプ
    FOR_DISPLAY		= 0;
    FOR_DBTABLE		= 1;

    // テーブル最高桁数
    MAX_DIGIT_SUBCODE		= 16;	// 科目別補助外部コード
    MAX_DIGIT_KMKNCODE_PLUS1= 11;	// 科目内部コード
    MAX_DIGIT_RENSO			= 10;	// 連想
    MAX_DIGIT_SIMPLENAME	= 14;	// 科目別補助簡略名称コード

    // 出力順序
	CODEORDER		    = 0;		//	科目コード順
	RENSOORDER		    = 1;		//	連想順

    // 印刷パターン
    PTN_SAIMOKU			= 0;

    // 科目別補助グリッドのカラムインデックス
    GRIDSMK_COL_ALL			= -1;
    GRIDSMK_COL_SUBCODE		= 0;
    GRIDSMK_COL_RENSO		= 1;
    GRIDSMK_COL_LONGNAME	= 2;
    GRIDSMK_COL_SIMPLENAME	= 3;
var
  DataHelper: TDataHelper;

implementation

{ TReferData }

//**************************************************************************
//	Proccess  :	TReferDataのｺﾝｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
constructor TReferData.Create();
begin
	m_fTantoNCode	:= 0;
    m_iTantoFixFlg	:= 0;
    m_iSecSaiyo		:= 0;
    m_iSecMasterKbn	:= 0;
    m_fSecSegNCode	:= 0;
    m_iSecSuperGKbn	:= 0;
    m_iSecHojyoDefKbn:= 0;
    m_bPermsUpdate   := False;
    m_bPermsDelete   := False;
    m_bPermsPrn      := False;
    m_bPermsFileOut  := False;
    m_iKakuteiKbn   := 0;
	m_iYearKbn		:= 0;
    m_sValidChar	:= '';
    m_iReferFlag    := 0;
    m_fDspKmkNCode	:= 0;
    m_iDspKmkGCode	:= 0;
    m_sDspKmkSimpleName	:= '';
    m_iDspCodeDigit	:= 0;
    m_iDspCodeAttr	:= 0;
end;

{$R *.DFM}

//**************************************************************************
//	Proccess  :	TDataHelperのｺﾝｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aPec	: ^TMjsAppRecord
//**************************************************************************
constructor TDataHelper.CreateForm(aOwner: TComponent; aRec: Pointer);
begin
    // 渡されたパラメータを格納
	m_pMyAppRecord := aRec;
    m_Owner := aOwner;

    // 共通情報クラスを作成
    m_JNTCommon	:=  TJNTCommon.Create(m_Owner);
    m_JNTCommon.Init(m_pMyAppRecord);
	m_JNTCommon.setMasAppRecord;

    // システムメモリを取得
	m_JNTMASCom	:= TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);

	// 初期データクラス生成
    m_ReferData := TReferData.Create;

    // 呼び出し元より渡された値をもとに必要な情報を取得
	m_DBModule 		:= TMDataModulef(m_pMyAppRecord^.m_pDBModule^);

    // 会社DBを更新型でオープン
    m_CorpDB 		:= m_DBModule.COPDBOpen(1, m_JNTMASCom.m_iCopNo);

    // 会社DBのオープンが出来ない場合はエラー
    if not Assigned(m_CorpDB) then
    begin
        m_JNTMASCom.m_MsgStd.GetMsg(m_MjsMsgRec, 10000, m_DBModule.GetStatus);
        raise Exception.Create(m_MjsMsgRec.sMsg);
    end;

    // クエリを生成とDB関連付け
    m_Query := TMQuery.Create(m_Owner);
    m_DBModule.SetDBInfoToQuery(m_CorpDB, m_Query);

	inherited Create(m_Owner);
end;

//**************************************************************************
//	Component	:	DataHelper ( TDataHelper )
//	Event	    :	OnCreate
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.DataModuleCreate(Sender: TObject);
begin
	m_wkKmkGCode := '';

    // ストアド初期化
    SetSPDB(SPMsHist);
    SetSPDB(SPMasKmk);
    SetSPDB(SPPayKmk);
    SetSPDB(SPCrdKmk);

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        m_JNTSelSys := nil;
	    m_JNTSelSys := TJNTSelCorpSys.Create(m_Owner);
        if m_JNTSelSys = nil then
            Abort;

    	if m_JNTSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
            Abort;
    except
		MjsMessageBox(m_Owner,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if m_JNTSelSys.CreateSysInfo(m_CorpDB) <> 0 then
            Abort;
    except
        m_JNTSelSys.MsgDlg(1001,20);
        raise;
    end;

    // 印刷条件設定Dlg初期化
    gfnHaniInit(m_Owner,
                 m_pMyAppRecord,
                 m_DBModule,
                 m_JNTMASCom,
                 m_CorpDB,
                 'JNTCRP009010',
                 m_JNTHani,
                 m_JNTSelSys);

    // 検索Exp初期化
    if fnJNTExpInit(m_Owner, m_pMyAppRecord) <> RET_OK then
    begin
		MjsMessageBox(m_Owner,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);
    end;

    // 開始処理ストアド呼出(MP200010)
	if (CallStoredProc(SYORI_START) = False) then
    begin
		raise Exception.Create('');
    end;

	DMemSaimoku_Dsp.Open;
	DMemSaimoku_Save.Open;
end;

//**************************************************************************
//	Proccess  	:	TDataHelperのインスタンス破棄
//	Component	:	DataHelper ( TDataHelper )
//	Event	    :	OnDestroy
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.DestructInstance();
begin
	// 終了処理ストアド呼出(MP200010)
	CallStoredProc(SYORI_END);

    // 検索Exp終了処理
    fnJNTExpFree;

    // 会社別ｼｽﾃﾑ情報の破棄
    if Assigned(m_JNTSelSys) then
    begin
        m_JNTSelSys.Free;
        m_JNTSelSys := Nil;
    end;

	// クエリを破棄
    if Assigned(m_Query) then
    begin
        m_Query.Free;
        m_Query := Nil;
    end;

    // 会社DBをクローズ
    if Assigned(m_CorpDB) then
    begin
    	m_DBModule.COPDBClose(m_CorpDB);
        m_CorpDB := Nil;
    end;

    // 参照データクラスを破棄
    if Assigned(m_ReferData) then
    begin
        m_ReferData.Free;
        m_ReferData := Nil;
    end;

    // 共通情報クラスを破棄
    if Assigned(m_JNTCommon) then
    begin
        m_JNTCommon.Free;
        m_JNTCommon := Nil;
    end;
end;

//**************************************************************************
//	Proccess  	:	TDataHelperのﾃﾞｽﾄﾗｸﾀ
//	Component	:	DataHelper ( TDataHelper )
//	Name	    :	M.Makino
//**************************************************************************
destructor TDataHelper.Destroy();
begin
    // 印刷条件設定Dlg終了処理
	gfnHaniTerm(m_JNTHani);

	inherited;
end;

//**************************************************************************
//	Proccess  :	科目別補助データ取得
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aMem		: TdxMemData   ｾｯﾄ対象DataSet
//			　:	aStKmkGCode	: Integer	   ｾｯﾄ範囲開始科目ｺｰﾄﾞ
//			　:	aEdKmkGCode	: Integer	   ｾｯﾄ範囲終了科目ｺｰﾄﾞ
//			　:	aOrder		: Integer	   指定出力順序
//**************************************************************************
procedure TDataHelper.GetSaimokuData(aMem: TdxMemData;
								   aStKmkGCode, aEdKmkGCode, aOrder: Integer);
var
    sSubCode	: String;
    iCodeDigit	: Integer;
    iCodeAttr	: Integer;
    iKmkGCode	: Integer;
    iwk			: Integer;
    fwk			: Extended;
begin
	iKmkGCode	:= 0;
    iwk			:= 0;
	fwk	    	:= 0;
    if ((aMem = DMemSaimoku_Prn) and (aOrder = RENSOORDER)) then
    	DMemSaimoku_Prn.SortedField := '';
	with m_Query do
    begin
        if (aMem.RecordCount > 0) then
            aMem.Close;
        aMem.Open;
        aMem.DisableControls;

    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SMK.CNCode		as CNCode');
            SQL.Add(',SMK.SubCode		as SubCode');
            SQL.Add(',SMK.Renso			as Renso');
            SQL.Add(',SMK.LongName		as LongName');
            SQL.Add(',SMK.SimpleName	as SimpleName');
            SQL.Add(',SMK.SyokuchiKbn	as SyokuchiKbn');
            SQL.Add(',KNZ.NCode			as KmkNCode');
            SQL.Add(',KNZ.GCode			as KmkGCode');
            SQL.Add(',KNZ.SimpleName	as KmkSimpleName');
            SQL.Add(',KNZ.CodeDigit		as CodeDigit');
            SQL.Add(',KNZ.CodeAttr		as CodeAttr');
            SQL.Add(',KNZ.SubKmkUse		as SubKmkUse');

            // グループ別権限_表示マスタ設定による制限
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            begin
                SQL.Add(',CASE');
                SQL.Add('	WHEN (:iSuperGKbn = 1)');
                SQL.Add('	  OR (:iFixFlg = 2)');
                SQL.Add('	  THEN 1');
                SQL.Add('	ELSE');
                SQL.Add('	  CASE');
                SQL.Add('		WHEN (IsNull(HDI.DispKbn,0) = 0)');
                SQL.Add('	  	  THEN');
                SQL.Add('	  		CASE');
                SQL.Add('			  WHEN (:iSecHojyoDefKbn = 1) THEN 1');
                SQL.Add('			  WHEN (:iSecHojyoDefKbn = 0) THEN 2');
                SQL.Add('			END');
                SQL.Add('		ELSE HDI.DispKbn');
                SQL.Add('	  END');
                SQL.Add(' END DispKbn');
			end;

            SQL.Add('FROM');
            SQL.Add(' KmkMA SMK');
            SQL.Add('INNER JOIN KmkMA KNZ');
            SQL.Add(' ON  SMK.NCode		= KNZ.NCode');
            SQL.Add(' AND KNZ.MasterKbn = ' + IntToStr(MST_KANZYO));
            SQL.Add(' AND KNZ.SumKbn	= 0');
            SQL.Add(' AND KNZ.CNCode	= 0');
            SQL.Add(' AND KNZ.SubKmkUse	= 1');
            SQL.Add(' AND KNZ.RDelKbn 	= 0');

            // グループ別権限採用あり
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            begin
                SQL.Add('LEFT OUTER JOIN SecHojyoDispInfo HDI');
//HISNO-00001 Str
                //SQL.Add(' ON  SMK.CNCode 	= HDI.NCode');
                SQL.Add(' ON  (SMK.CNCode 	= HDI.NCode)  and (SMK.NCode 	= HDI.kmkNCode) ');
//HISNO-00001 Ed
                SQL.Add(' AND HDI.OpeKbn 	= 1');
                SQL.Add(' AND HDI.NoDispMasterKbn = ' + IntToStr(MST_SAIMOKU));
                SQL.Add(' AND HDI.MasterKbn = :iSecSegMasterKbn');
                SQL.Add(' AND HDI.PlaceNCode = :sSecSegNCode');
            end;

            SQL.Add('WHERE');
            SQL.Add(' SMK.MasterKbn		= ' + IntToStr(MST_SAIMOKU));
            SQL.Add(' AND SMK.SumKbn	= 0');
            SQL.Add(' AND SMK.RDelKbn	= 0');

            // グループ別権限採用あり
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            begin
                SQL.Add('AND KNZ.GCode IN');
                SQL.Add('	 (');
                SQL.Add('	 SELECT KmkGCode FROM MV_MAS_SecKmkNoDispInfo');
                SQL.Add('	 WHERE DispKbn <> 2 AND MainKbn = 1 AND TantoNCode = :sTantoNCode');
                SQL.Add('	 )');
            end;

            // 科目範囲
            if (aEdKmkGCode <> 0) then
            	SQL.Add(' AND KNZ.GCode	BETWEEN :iStGCode AND :iEdGCode')
            else if ((aStKmkGCode <> 0) and (aEdKmkGCode = 0)) then
            	SQL.Add(' AND KNZ.GCode >= :iStGCode');

            // グループ別権限採用あり
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            	SQL.Add('AND DispKbn <> 2');

            // 出力順序
            if (aOrder = CODEORDER) then
	            SQL.Add('ORDER BY KmkGCode, SubCode')
            else if (aOrder = RENSOORDER) then
            	SQL.Add('ORDER BY KmkGCode, Renso, SubCode');

            // グループ別権限採用あり
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            begin
                SetFld('iSuperGKbn').AsInteger 		:= m_ReferData.SecSuperGKbn;
                SetFld('iFixFlg').AsInteger			:= m_ReferData.TantoFixFlg;
                SetFld('iSecHojyoDefKbn').AsInteger	:= m_ReferData.SecHojyoDefKbn;
                SetFld('iSecSegMasterKbn').AsInteger:= m_ReferData.SecMasterKbn;
                SetFld('sSecSegNCode').AsString		:= FloatToStr(Trunc(m_ReferData.SecSegNCode));
                SetFld('sTantoNCode').AsString		:= FloatToStr(Trunc(m_ReferData.TantoNCode));
            end;

            // 科目範囲
            if (aEdKmkGCode <> 0) then
			begin
                SetFld('iStGCode').AsInteger := aStKmkGCode;
                SetFld('iEdGCode').AsInteger := aEdKmkGCode;
            end
            else if ((aStKmkGCode <> 0) and (aEdKmkGCode = 0)) then
	            SetFld('iStGCode').AsInteger := aStKmkGCode;

            Open(True);

            while (EOF = False) do
            begin
                sSubCode := GetFld('SubCode').AsString;

                aMem.Append;
                if (aMem = DMemSaimoku_Dsp) then
                begin
                    aMem.FieldByName('KmkNCode').AsFloat	:= GetFld('KmkNCode').AsFloat;
                    aMem.FieldByName('SubCode').AsString	:= ChangeCode(FOR_DISPLAY, sSubCode);
                    aMem.FieldByName('Renso').AsString		:= GetFld('Renso').AsString;
                    aMem.FieldByName('LongName').AsString	:= GetFld('LongName').AsString;
                    aMem.FieldByName('SimpleName').AsString	:= GetFld('SimpleName').AsString;
                    aMem.FieldByName('CNCode').AsFloat		:= GetFld('CNCode').AsFloat;
                    aMem.FieldByName('SyokuchiKbn').AsInteger:= GetFld('SyokuchiKbn').AsInteger;
                end
                else if (aMem = DMemSaimoku_Prn) then
                begin
                	if (iKmkGCode <> GetFld('KmkGCode').AsInteger) then
                    begin
                    	Inc(iwk);
                        fwk := 0;
                    end;
	                fwk := (Trunc(fwk)) + 1;

                    iKmkGCode	:= GetFld('KmkGCode').AsInteger;
                	iCodeDigit	:= GetFld('CodeDigit').AsInteger;
                    iCodeAttr	:= GetFld('CodeAttr').AsInteger;
                    aMem.FieldByName('KmkGCode').AsInteger	:= GetFld('KmkGCode').AsInteger;
                    aMem.FieldByName('KmkSimpleName').AsString:= GetFld('KmkSimpleName').AsString;
                    aMem.FieldByName('SubCode').AsString	:= ChangeCode(sSubCode, iCodeDigit, iCodeAttr);
                    aMem.FieldByName('Renso').AsString		:= GetFld('Renso').AsString;
                    aMem.FieldByName('LongName').AsString	:= GetFld('LongName').AsString;
                    aMem.FieldByName('SimpleName').AsString	:= GetFld('SimpleName').AsString;
                    aMem.FieldByName('CodeAttr').AsInteger	:= iCodeAttr;
                    if ((aOrder = RENSOORDER) and (GetFld('Renso').AsString = '')) then
                    begin
	                    aMem.FieldByName('SortStr').AsString:=
                        				ChangeCode(IntToStr(iwk * 10 + 9), MAX_DIGIT_KMKNCODE_PLUS1, INT_ZERO_ARI)
                    					+ ChangeCode(FloatToStr(Trunc(fwk)), MAX_DIGIT_SUBCODE, INT_ZERO_ARI)
                    end
                    else if ((aOrder = RENSOORDER) and (GetFld('Renso').AsString <> '')) then
                    begin
	                    aMem.FieldByName('SortStr').AsString:=
                        				ChangeCode(IntToStr(iwk * 10), MAX_DIGIT_KMKNCODE_PLUS1, INT_ZERO_ARI)
                    					+ ChangeCode(FloatToStr(Trunc(fwk)), MAX_DIGIT_SUBCODE, INT_ZERO_ARI)
                    end;
                end;

                // 取得の際はPostイベントを止める
                if (aMem = DMemSaimoku_Dsp) then
                	aMem.AfterPost := Nil;
                aMem.Post;
                if (aMem = DMemSaimoku_Dsp) then
                	aMem.AfterPost := DMemSaimoku_DspAfterPost;

                Next;
            end;
        finally
        	Close;
            if ((aMem = DMemSaimoku_Prn) and (aOrder = RENSOORDER)) then
            	DMemSaimoku_Prn.SortedField := 'SortStr';
            aMem.First;
            aMem.EnableControls;
        end;
    end;

    // データ保存
    if (aMem = DMemSaimoku_Dsp) then
    begin
    	CopyMemData(DMemSaimoku_Dsp, DMemSaimoku_Save);
        DMemSaimoku_Save.First;
    end;
end;

//**************************************************************************
//	Proccess  :	表示科目情報を取得する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aKmkGCode	: Integer   表示対象科目ｺｰﾄﾞ
//**************************************************************************
procedure TDataHelper.GetKmkInfo(aKmkGCode: Integer);
begin
    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' GCode');
            SQL.Add(',NCode');
            SQL.Add(',SimpleName');
            SQL.Add(',CodeDigit');
            SQL.Add(',CodeAttr');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn		= ' + IntToStr(MST_KANZYO));
            SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn	= 0');
            SQL.Add(' AND GCode		= :iGCode');

            SetFld('iGCode').AsInteger := aKmkGCode;

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
                m_ReferData.DspKmkNCode		:= GetFld('NCode').AsFloat;
                m_ReferData.DspKmkGCode		:= GetFld('GCode').AsInteger;
                m_ReferData.DspKmkSimpleName:= GetFld('SimpleName').AsString;
                m_ReferData.DspCodeDigit	:= GetFld('CodeDigit').AsInteger;
                m_ReferData.DspCodeAttr		:= GetFld('CodeAttr').AsInteger;
            end;
        finally
            Close;
        end;
    end;
end;


//**************************************************************************
//	Proccess  :	ReferDataのプロパティを取得する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.GetReferData();
begin
	// 担当者情報
    SetTantoInfo();
    // グループ別権限情報
    SetSecInfo();
    // 決算確定区分
    SetKakuteiKbn();
    // 和暦西暦区分, 使用可能コード
    SetDataDTMain();
    // 権限情報
	m_JNTCommon.FxPermission();
    SetPerms();
    // 参照フラグ
	SetReferFlag();
end;

//**************************************************************************
//	Proccess  :	KmkMA.CNCodeの最高値を取得して呼び元に返す。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Return	  : Extended
//**************************************************************************
function TDataHelper.GetMaxCNCode(): Extended;
begin
	Result := 0;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' MAX(CNCode) as CNCode');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn	= ' + IntToStr(MST_SAIMOKU));

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
            	Result := GetFld('CNCode').AsFloat;
            end;
        finally
            Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	現在行を削除する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.DeleteSaimoku_KmkMA();
var
	bSuccessFlg : Boolean;
begin
	bSuccessFlg := False;
	SessionPractice(C_ST_PROCESS);

	DMemSaimoku_Dsp.DisableControls;

	m_DBModule.BeginTran(m_CorpDB);

    with m_Query do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Add('UPDATE KmkMA');
            SQL.Add('SET');
            SQL.Add(' RDelKbn = 1');
            SQL.Add(',UpdTantoNCode = :sTantoNCode');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn		= ' + IntToStr(MST_SAIMOKU));
			SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn	= 0');
            SQL.Add(' AND NCode		= :sNCode');
            SQL.Add(' AND CNCode	= :sCNCode');

            SetFld('sNCode').AsString	:= FloatToStr(Trunc(m_ReferData.DspKmkNCode));
            SetFld('sCNCode').AsString	:= FloatToStr(Trunc(DMemSaimoku_DspCNCode.AsFloat));
            SetFld('sTantoNCode').AsString := FloatToStr(Trunc(m_ReferData.TantoNCode));

			if (ExecSQL) then
            begin
            	if (m_ReferData.SecSaiyo = SAIYOARI) then
                begin
                    if (IsDeleteSaimoku_SecHojyoDispInfo()) then
                    begin
                        bSuccessFlg := True;
                    end;
                end
                else
                	bSuccessFlg := True;
            end;
        finally
        	if (bSuccessFlg = True) then
            begin
                m_DBModule.Commit(m_CorpDB);
                DMemSaimoku_Dsp.Delete;
                // データ保存
                CopyMemData(DMemSaimoku_Dsp, DMemSaimoku_Save);
                DMemSaimoku_Save.First;
				fnEdgeTrackerKeihiSeisanMsg();  // <002> add
            end
            else
            begin
				m_DBModule.Rollback(m_CorpDB);
            	// データ復元
                DMemSaimoku_Save.First;
                CopyMemData(DMemSaimoku_Save, DMemSaimoku_Dsp);

				m_JNTMASCom.m_MsgStd.GetMsgDB(m_MjsMsgRec,m_Query);
				MjsMessageBoxEx(m_Owner, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
    							m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MJsMsgRec.LogType);
            end;
        	Close;
			DMemSaimoku_Dsp.EnableControls;
            SessionPractice(C_ED_PROCESS);
        end;

    end;
end;

//**************************************************************************
//	Proccess  :	SecHojyoDispInfoに科目別補助登録して成否を返す。
//				(DeleteSaimoku_KmkMAでまとめて更新確定)
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Return	  : True = ExecSQL成功, False = ExecSQL失敗
//**************************************************************************
function TDataHelper.IsDeleteSaimoku_SecHojyoDispInfo(): Boolean;
begin
	Result := False;
    with m_Query do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Add('DELETE SecHojyoDispInfo');
            SQL.Add('WHERE');
            SQL.Add(' OpeKbn = 1');
            SQL.Add(' AND MasterKbn = :iMasterKbn');
// マスタ削除なので全部署の設定を削除する            SQL.Add(' AND PlaceNCode = :sPlaceNCode');
            SQL.Add(' AND NoDispMasterKbn = ' + IntToStr(MST_SAIMOKU));
            SQL.Add(' AND NCode = :sCNCode');
            SQL.Add(' AND KmkNCode = :sKmkNCode');

            SetFld('iMasterKbn').AsInteger	:= m_ReferData.SecMasterKbn;
// マスタ削除なので全部署の設定を削除する            SetFld('sPlaceNCode').AsString	:= FloatToStr(Trunc(m_ReferData.SecSegNCode));
            SetFld('sCNCode').AsString		:= FloatToStr(Trunc(DMemSaimoku_DspCNCode.AsFloat));
            SetFld('sKmkNCode').AsString	:= FloatToStr(Trunc(DMemSaimoku_DspKmkNCode.AsFloat));

            if (ExecSQL) then
            begin
            	Result := True;
            end;
        finally
            Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	科目別補助登録する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.WriteSaimoku_KmkMA();
var
	bSuccessFlg	: Boolean;

const
	// 処理区分(TJNTCommon.getDefDate)
    STARTDATE   = 1;
    ENDDATE		= 2;
begin
	bSuccessFlg := False;
	SessionPractice(C_ST_PROCESS);

    DMemSaimoku_Dsp.DisableControls;

	m_DBModule.BeginTran(m_CorpDB);

    with m_Query do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SubCode');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn = ' + IntToStr(MST_SAIMOKU));
			SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn = 0');
            SQL.Add(' AND NCode = :sNCode');
            SQL.Add(' AND CNCode = :sCNCode');

            SetFld('sCNCode').AsString	:= FloatToStr(Trunc(DMemSaimoku_DspCNCode.AsFloat));
            SetFld('sNCode').AsString	:= FloatToStr(Trunc(m_ReferData.DspKmkNCode));

            Open(True);

            // 登録あり
            if (EOF = False) then
            begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE KmkMA');
                SQL.Add('SET');
                SQL.Add(' Renso			= :sRenso');
                SQL.Add(',LongName		= :sLongName');
                SQL.Add(',SimpleName	= :sSimpleName');
                SQL.Add(',UpdTantoNCode	= :sTantoNCode');
                SQL.Add('WHERE');
                SQL.Add(' MasterKbn		= ' + IntToStr(MST_SAIMOKU));
				SQL.Add(' AND SumKbn	= 0');
                SQL.Add(' AND RDelKbn	= 0');
                SQL.Add(' AND NCode		= :sNCode');
                SQL.Add(' AND CNCode	= :sCNCode');
// <003> mod start
//                SetFld('sRenso').AsString		:= DMemSaimoku_DspRenso.AsString;
//                SetFld('sLongName').AsString	:= DMemSaimoku_DspLongName.AsString;
//                SetFld('sSimpleName').AsString	:= DMemSaimoku_DspSimpleName.AsString;
                SetFld('sRenso').AsString		:= CRLFCut(DMemSaimoku_DspRenso.AsString);
                SetFld('sLongName').AsString	:= CRLFCut(DMemSaimoku_DspLongName.AsString);
                SetFld('sSimpleName').AsString	:= CRLFCut(DMemSaimoku_DspSimpleName.AsString);
// <003> mod end
                SetFld('sTantoNCode').AsString	:= FloatToStr(Trunc(m_ReferData.TantoNCode));
                SetFld('sNCode').AsString		:= FloatToStr(Trunc(m_ReferData.DspKmkNCode));
                SetFld('sCNCode').AsString		:= FloatToStr(DMemSaimoku_DspCNCode.AsFloat);

                if (ExecSQL) then
                begin
                    bSuccessFlg := True;
                end;
            end
            else
            begin
                Close;
                SQL.Clear;
                SQL.Add('INSERT KmkMA');
                SQL.Add('(');
                SQL.Add('MasterKbn');
                SQL.Add(',SumKbn');
                SQL.Add(',NCode');
                SQL.Add(',CNCode');
                SQL.Add(',GCode');
                SQL.Add(',SubCode');
                SQL.Add(',Renso');
                SQL.Add(',LongName');
                SQL.Add(',SimpleName');
                SQL.Add(',TStartDate');
                SQL.Add(',TEndDate');
                SQL.Add(',SyokuchiKbn');
                SQL.Add(',AnalyzeCode');
                SQL.Add(',SumAnaCode');
                SQL.Add(',CharCode');
                SQL.Add(',ECharCode1');
                SQL.Add(',ECharCode2');
                SQL.Add(',ECharCode3');
                SQL.Add(',DCKbn');
                SQL.Add(',BPKbn');
                SQL.Add(',KisyuKbn');
                SQL.Add(',NonDspKbn');
                SQL.Add(',PerKmkKbn');
                SQL.Add(',KmkKbn1');
                SQL.Add(',KmkKbn2');
                SQL.Add(',KmkKbn3');
                SQL.Add(',KmkKbn4');
                SQL.Add(',KmkKbn5');
                SQL.Add(',KmkKbn6');
                SQL.Add(',KmkKbn7');
                SQL.Add(',KmkKbn8');
                SQL.Add(',UseKbn');
                SQL.Add(',KoteiKbn');
                SQL.Add(',DebitCash');
                SQL.Add(',CreditCash');
                SQL.Add(',TaxKbn');
                SQL.Add(',STaxCode');
                SQL.Add(',STaxRate');
                SQL.Add(',BTaxCode');
                SQL.Add(',BTaxRate');
                SQL.Add(',TypeCode');
                SQL.Add(',TaxKbn2');
                SQL.Add(',TaxKbn3');
                SQL.Add(',TaxKbn4');
                SQL.Add(',TaxKbn5');
                SQL.Add(',TaxKbn6');
                SQL.Add(',CodeDigit');
                SQL.Add(',CodeAttr');
                SQL.Add(',KUseKbn1');
                SQL.Add(',KUseKbn2');
                SQL.Add(',KUseKbn3');
                SQL.Add(',KUseKbn4');
                SQL.Add(',KUseKbn5');
                SQL.Add(',KUseKbn6');
                SQL.Add(',BHSumKbn1');
                SQL.Add(',BHSumKbn2');
                SQL.Add(',InputKbn');
                SQL.Add(',DInputKbn');
                SQL.Add(',DInputAlw');
                SQL.Add(',TInputKbn');
                SQL.Add(',TInputAlw');
                SQL.Add(',TMInputKbn');
                SQL.Add(',TMInputAlw');
                SQL.Add(',NoInputKbn1');
                SQL.Add(',NoInputAlw1');
                SQL.Add(',NoInputKbn2');
                SQL.Add(',NoInputAlw2');
                SQL.Add(',EInputKbn1');
                SQL.Add(',EInputAlw1');
                SQL.Add(',EInputKbn2');
                SQL.Add(',EInputAlw2');
                SQL.Add(',TkInputKbn');
                SQL.Add(',TkClassCode');
                SQL.Add(',DPointNum');
                SQL.Add(',CashCodeKbn');
                SQL.Add(',EInpKbn1');
                SQL.Add(',EInpKbn2');
                SQL.Add(',EInpKbn3');
                SQL.Add(',EInpKbn4');
                SQL.Add(',EInpKbn5');
                SQL.Add(',DupCodeN4');
                SQL.Add(',DupCode4');
                SQL.Add(',DupCode3');
                SQL.Add(',BankNCode');
                SQL.Add(',SectionNCode');
                SQL.Add(',NoName1');
                SQL.Add(',NoName2');
                SQL.Add(',NoInputKbn3');
                SQL.Add(',NoInputAlw3');
                SQL.Add(',BunruiNCode1');
                SQL.Add(',BunruiNCode2');
                SQL.Add(',BunruiNCode3');
                SQL.Add(',BunruiNCode4');
                SQL.Add(',BunruiNCode5');
                SQL.Add(',BunruiNCode6');
                SQL.Add(',BunruiNCode7');
                SQL.Add(',BunruiNCode8');
                SQL.Add(',BunruiNCode9');
                SQL.Add(',BunruiNCode10');
                SQL.Add(',VFree1');
                SQL.Add(',VFree2');
                SQL.Add(',VFree3');
                SQL.Add(',VFree4');
                SQL.Add(',VFree5');
                SQL.Add(',VFree6');
                SQL.Add(',VFree7');
                SQL.Add(',VFree8');
                SQL.Add(',VFree9');
                SQL.Add(',VFree10');
                SQL.Add(',NFree1');
                SQL.Add(',NFree2');
                SQL.Add(',NFree3');
                SQL.Add(',NFree4');
                SQL.Add(',NFree5');
                SQL.Add(',NFree6');
                SQL.Add(',NFree7');
                SQL.Add(',NFree8');
                SQL.Add(',NFree9');
                SQL.Add(',NFree10');
                SQL.Add(',UpdTantoNCode');
                SQL.Add(')');

                SQL.Add('VALUES');
                SQL.Add('(');
                SQL.Add(IntToStr(MST_SAIMOKU));
                SQL.Add(',0');
                SQL.Add(',:sNCode');
                SQL.Add(',:sCNCode');
                SQL.Add(',:iGCode');
                SQL.Add(',:sSubCode');
                SQL.Add(',:sRenso');
                SQL.Add(',:sLongName');
                SQL.Add(',:sSimpleName');
                SQL.Add(',:dTStartDate');
                SQL.Add(',:dTEndDate');
                SQL.Add(',:iSyokuchiKbn');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',:iCodeDigit');
                SQL.Add(',:iCodeAttr');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(','''' ');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',0');
                SQL.Add(',:sTantoNCode');
                SQL.Add(')');

                SetFld('sNCode').AsString		:= FloatToStr(Trunc(DMemSaimoku_DspKmkNCode.AsFloat));
                SetFld('sCNCode').AsString		:= FloatToStr(DMemSaimoku_DspCNCode.AsFloat);
                SetFld('iGCode').AsInteger		:= m_ReferData.DspKmkGCode;
                SetFld('sSubCode').AsString		:= ChangeCode(FOR_DBTABLE, DMemSaimoku_DspSubCode.AsString);
// <003> mod start
//                SetFld('sRenso').AsString		:= DMemSaimoku_DspRenso.AsString;
//                SetFld('sLongName').AsString	:= DMemSaimoku_DspLongName.AsString;
//                SetFld('sSimpleName').AsString	:= DMemSaimoku_DspSimpleName.AsString;
                SetFld('sRenso').AsString		:= CRLFCut(DMemSaimoku_DspRenso.AsString);
                SetFld('sLongName').AsString	:= CRLFCut(DMemSaimoku_DspLongName.AsString);
                SetFld('sSimpleName').AsString	:= CRLFCut(DMemSaimoku_DspSimpleName.AsString);
// <003> mod end
                SetFld('iSyokuchiKbn').AsInteger:= DMemSaimoku_DspSyokuchiKbn.AsInteger;
                SetFld('dTStartDate').AsDateTime:= m_JNTCommon.getDefDate(STARTDATE);
                SetFld('dTEndDate').AsDateTime	:= m_JNTCommon.getDefDate(ENDDATE);
                SetFld('iCodeDigit').AsInteger	:= m_ReferData.DspCodeDigit;
                SetFld('iCodeAttr').AsInteger	:= m_ReferData.DspCodeAttr;
                SetFld('sTantoNCode').AsString	:= FloatToStr(Trunc(m_ReferData.TantoNCode));

                if (ExecSQL) then
                begin
                    if (IsInsertSaimoku_KmkMB()) then
                    begin
                    	if (m_ReferData.SecSaiyo = SAIYOARI) then
                        begin
                        	if (IsInsertSaimoku_SecHojyoDispInfo()) then
                            begin
                    			bSuccessFlg := True;
                            end;
                        end
                        else
                        	bSuccessFlg := True;
                    end;
                end;
            end;
        finally
        	if (bSuccessFlg = True) then
            begin
            	m_DBModule.Commit(m_CorpDB);
                // データ保存
                CopyMemData(DMemSaimoku_Dsp, DMemSaimoku_Save);
                DMemSaimoku_Save.First;
            end
            else
            begin
                m_DBModule.Rollback(m_CorpDB);
            	// データ復元
                DMemSaimoku_Save.First;
                CopyMemData(DMemSaimoku_Save, DMemSaimoku_Dsp);

                m_JNTMASCom.m_MsgStd.GetMsgDB(m_MjsMsgRec,m_Query);
                MjsMessageBoxEx(m_Owner, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
                                m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MJsMsgRec.LogType);
            end;
            Close;
            DMemSaimoku_Dsp.EnableControls;
			SessionPractice(C_ED_PROCESS);
    	end;
    end;
end;

//**************************************************************************
//	Proccess  :	KmkMBに科目別補助登録して成否を返す。
//				(WriteSaimoku_KmkMAでまとめて更新確定)
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Return	  : True = ExecSQL成功, False = ExecSQL失敗
//**************************************************************************
function TDataHelper.IsInsertSaimoku_KmkMB(): Boolean;
begin
	Result := False;
    with m_Query do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Add('INSERT KmkMB');
            SQL.Add('(');
            SQL.Add(' NCode          ');
            SQL.Add(',CNCode         ');
            SQL.Add(',MasterKbn      ');
            SQL.Add(',SumKbn         ');
            SQL.Add(',UpdTantoNCode  ');
            SQL.Add(')');

            SQL.Add('VALUES');
            SQL.Add('(');
            SQL.Add(' :sNCode');
            SQL.Add(',:sCNCode');
            SQL.Add(',' + IntToStr(MST_SAIMOKU));
            SQL.Add(',0');
            SQL.Add(',:sTantoNCode');
            SQL.Add(')');

            SetFld('sNCode').AsString		:= FloatToStr(Trunc(DMemSaimoku_DspKmkNCode.AsFloat));
            SetFld('sCNCode').AsString		:= FloatToStr(Trunc(DMemSaimoku_DspCNCode.AsFloat));
            SetFld('sTantoNCode').AsString	:= FloatToStr(Trunc(m_ReferData.TantoNCode));

            if (ExecSQL) then
            begin
            	Result := True;
            end;
        finally
            Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	SecHojyoDispInfoにグループ別権限登録して成否を返す。
//				(WriteSaimoku_KmkMAでまとめて更新確定)
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Return	  : True = ExecSQL成功, False = ExecSQL失敗
//**************************************************************************
function TDataHelper.IsInsertSaimoku_SecHojyoDispInfo(): Boolean;
begin
	Result := False;
    with m_Query do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Add('INSERT SecHojyoDispInfo');
            SQL.Add('(');
            SQL.Add(' OpeKbn         	');
            SQL.Add(',MasterKbn     	');
            SQL.Add(',PlaceNCode     	');
            SQL.Add(',NoDispMasterKbn	');
            SQL.Add(',NCode          	');
            SQL.Add(',DispKbn			');
            SQL.Add(',KmkNCode  		');
            SQL.Add(')');

            SQL.Add('VALUES');
            SQL.Add('(');
            SQL.Add(' 1');
            SQL.Add(',:iMasterKbn');
            SQL.Add(',:sPlaceNCode');
            SQL.Add(',' + IntToStr(MST_SAIMOKU));
            SQL.Add(',:sCNCode');
            SQL.Add(',1');
            SQL.Add(',:sKmkNCode');
            SQL.Add(')');

            SetFld('iMasterKbn').AsInteger	:= m_ReferData.SecMasterKbn;
            SetFld('sPlaceNCode').AsString	:= FloatToStr(Trunc(m_ReferData.SecSegNCode));
            SetFld('sCNCode').AsString		:= FloatToStr(Trunc(DMemSaimoku_DspCNCode.AsFloat));
            SetFld('sKmkNCode').AsString	:= FloatToStr(Trunc(DMemSaimoku_DspKmkNCode.AsFloat));

            if (ExecSQL) then
            begin
            	Result := True;
            end;
        finally
            Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	新規行をDMemSaimoku_Dspに追加する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSubCode, aRenso, aLongName, aSimpleName, aSyokuchiKbn	ｾｯﾄﾊﾟﾗﾒｰﾀ
//**************************************************************************
procedure TDataHelper.AppendRecord(aSubCode, aRenso, aLongName, aSimpleName: String;
					   aSyokuchiKbn: Integer);
begin
    DMemSaimoku_Dsp.DisableControls;
    try
    	DMemSaimoku_Dsp.AppendRecord([
        	DMemSaimoku_Dsp.RecordCount + 1,// (Index = 0)RecNo
            GetMaxCNCode() + 1,				// (Index = 1)CNCode
            aSubCode,                       // (Index = 2)SubCode
            aRenso,                         // (Index = 3)Renso
            aLongName,                      // (Index = 4)LongName
            aSimpleName,                    // (Index = 5)SimpleName
            aSyokuchiKbn,                   // (Index = 6)SyokuchiKbn
            m_ReferData.DspKmkNCode       // (Index = 7)KmkNCode
            ]);
    finally
        // データ保存
        CopyMemData(DMemSaimoku_Dsp, DMemSaimoku_Save);
        DMemSaimoku_Save.First;

    	DMemSaimoku_Dsp.EnableControls;
    end;
end;

//**************************************************************************
//	Proccess  :	グリッド表示を全てクリアする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.ClearMemData();
begin
	if (DMemSaimoku_Dsp.RecordCount > 0) then
		DMemSaimoku_Dsp.Close;
	DMemSaimoku_Dsp.Open;
	if (DMemSaimoku_Save.RecordCount > 0) then
		DMemSaimoku_Save.Close;
	DMemSaimoku_Save.Open;
end;

//**************************************************************************
//	Proccess  :	RefeferDataの表示情報を全てクリアする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.ClearReferDataDsp();
begin
	m_ReferData.DspCodeAttr		:= 0;
	m_ReferData.DspCodeDigit	:= 0;
    m_ReferData.DspKmkGCode		:= 0;
    m_ReferData.DspKmkNCode		:= 0;
    m_ReferData.DspKmkSimpleName:= '';
end;

//**************************************************************************
//	Proccess  :	グリッド非表示データをDMemSaimoku_Dspにセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetInvisibleData();
begin
    DMemSaimoku_Dsp.AfterPost			:= Nil;
    DMemSaimoku_DspCNCode.AsFloat		:= GetMaxCNCode() + 1;
    DMemSaimoku_DspSyokuchiKbn.AsInteger:= NOT_SYOKUCHI;
    DMemSaimoku_DspKmkNCode.AsFloat 	:= m_ReferData.DspKmkNCode;
    DMemSaimoku_Dsp.AfterPost 			:= DMemSaimoku_DspAfterPost;
end;

//**************************************************************************
//	Proccess  :	m_JNTCommonにAppRecordをセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aKbn	KBN_SEL = 販売区分, KBN_MAS = 財務区分
//**************************************************************************
procedure TDataHelper.SetAppRec(aKbn: Integer);
begin
	case aKbn of
    KBN_SEL	: m_JNTCommon.setSelAppRecord;
    KBN_MAS	: m_JNTCommon.setMasAppRecord;
	end;
end;

//**************************************************************************
//	Proccess  :	現在行の外部コードを表示用に変換してセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetChangedSubCode();
begin
	DMemSaimoku_DspSubCode.AsString := ChangeCode(FOR_DISPLAY, DMemSaimoku_DspSubCode.AsString)
end;

//**************************************************************************
//	Proccess  :	現在行の正式名称を簡略名称へ桁数合わせてセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetSimpleNameFromLongNmae(aColIndex: Integer);
begin
    if NOT (DMemSaimoku_Dsp.State IN [dsEdit, dsInsert]) then
        DMemSaimoku_Dsp.Edit;
    DMemSaimoku_DspSimpleName.AsString := MJSCopy(DMemSaimoku_DspLongName.AsString, MAX_DIGIT_SIMPLENAME);
    if (aColIndex = GRIDSMK_COL_SIMPLENAME) then
    	DMemSaimoku_Dsp.Post;
end;

//**************************************************************************
//	Proccess  :	担当者情報を取得する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetTantoInfo();
begin
	m_ReferData.TantoNCode := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

	with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' FixFlg');
            SQL.Add('FROM');
            SQL.Add(' MOS_OFFICE_STAFF');
            SQL.Add('WHERE');
            SQL.Add(' NCode	= :sTantoNCode');

            SetFld('sTantoNCode').AsString := FloatToStr(Trunc(m_ReferData.TantoNCode));

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
            	m_ReferData.TantoFixFlg		:= GetFld('FixFlg').AsInteger;
            end
            else
            	Exit;
        finally
            Close;
    	end;
    end;
end;

//**************************************************************************
//	Proccess  :	グループ別権限情報を取得する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetSecInfo();
begin
	with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SM.UseKbn			as UseKbn');
            SQL.Add(',SM.SecMasterKbn	as SecMasterKbn');
            SQL.Add(',SM.HojyoDefKbn	as HojyoDefKbn');
            SQL.Add(',MGI.SecNCode		as SecNCode');
            SQL.Add(',SPI.SuperGKbn		as SuperGKbn');
            SQL.Add('FROM');
            SQL.Add(' MV_MAS_MAINGROUPINFO MGI');
            SQL.Add('LEFT OUTER JOIN SecPlaceInfo SPI');
            SQL.Add(' ON MGI.SecNCode = SPI.PlaceNCode');
            SQL.Add('LEFT OUTER JOIN SecMain SM');
            SQL.Add(' ON SPI.OpeKbn = SM.OpeKbn');
            SQL.Add(' AND SPI.MasterKbn = SM.SecMasterKbn');
            SQL.Add('WHERE');
            SQL.Add(' SPI.OpeKbn		= 1');
            SQL.Add(' AND MGI.MainKbn	= 1');
            SQL.Add(' AND MGI.TantoNCode = :sTantoNCode');

            SetFld('sTantoNCode').AsString := FloatToStr(Trunc(m_ReferData.TantoNCode));

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
            	if (GetFld('UseKbn').AsInteger = SAIYONASI) then
                	Exit;

            	m_ReferData.SecSaiyo 		:= GetFld('UseKbn').AsInteger;
                m_ReferData.SecMasterKbn 	:= GetFld('SecMasterKbn').AsInteger;
                m_ReferData.SecHojyoDefKbn 	:= GetFld('HojyoDefKbn').AsInteger;
                m_ReferData.SecSegNCode 	:= GetFld('SecNCode').AsFloat;
                m_ReferData.SecSuperGKbn	:= GetFld('SuperGKbn').AsInteger;
            end
            else
                Exit;
        finally
            Close;
    	end;
    end;
end;

//**************************************************************************
//	Proccess  :	決算確定区分を取得し格納する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetKakuteiKbn();
begin
	m_ReferData.KakuteiKbn := m_JNTCommon.IsKessan(True);
end;

//**************************************************************************
//	Proccess  :	和暦西暦区分を取得し格納する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetDataDTMain();
begin
    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' YearKbn, DTName7');
            SQL.Add('FROM');
            SQL.Add(' DTMain');

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
                m_ReferData.YearKbn		:= GetFld('YearKbn').AsInteger;
                m_ReferData.ValidChar	:= GetFld('DTName7').AsString;
            end
            else
            	Exit;
        finally
        	Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	ロールを取得し格納する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetPerms();
begin
	if (m_JNTCommon.IsAppend() = True) or (m_JNTCommon.IsModify() = True) then
		m_ReferData.PermsUpdate	:= m_JNTCommon.IsModify();
    m_ReferData.PermsDelete		:= m_JNTCommon.IsDelete();
    m_ReferData.PermsPrn		:= m_JNTCommon.IsPrint();
    m_ReferData.PermsFileOut	:= m_JNTCommon.IsExtract();
end;

//**************************************************************************
//	Proccess  :	権限と決算確定区分を見て参照モードフラグをセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TDataHelper.SetReferFlag();
begin
	if (m_ReferData.PermsUpdate = False) or (m_ReferData.m_iKakuteiKbn = KAKUTEIZUMI) then
    	m_ReferData.ReferFlag := REFER
    else
        m_ReferData.ReferFlag := NORMAL;
end;

//**************************************************************************
//	Proccess  :	引数の存在と科目別補助採用をチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aKmkGCode : Integer
//	Result	  : 0 = RET_OK, 1 = RET_NOTEXIST, 2 = RET_NOTADOPT
//**************************************************************************
function TDataHelper.CheckKmkGCode(aKmkGCode: Integer): Integer;
begin
	Result := RET_OK;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SubKmkUse, SimpleName');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn		= ' + IntToStr(MST_KANZYO));
            SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn	= 0');
            SQL.Add(' AND GCode		= :iGCode');

            SetFld('iGCode').AsInteger := aKmkGCode;

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
                if (GetFld('SubKmkUse').AsInteger = SAIYONASI) then
                begin
//                	m_ReferData.DspKmkSimpleName := GetFld('SimpleName').AsString;
                    Result := RET_NOTADOPT;
                end;
            end
            else
                Result := RET_NOTEXIST;
        finally
            Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数科目が非表示科目かチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aKmkGCode : Integer
//	Result	  : True = 非表示科目, False = 表示可能科目
//**************************************************************************
function TDataHelper.IsSecKmkNoDsp(aKmkGCode: Integer): Boolean;
begin
	Result := False;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' KmkNCode');
            SQL.Add('FROM');
            SQL.Add(' MV_MAS_SecKmkNoDispInfo');
            SQL.Add('WHERE');
            SQL.Add(' DispKbn		= 2');
            SQL.Add(' AND MainKbn	= 1');
            SQL.Add(' AND TantoNCode	= ' + FloatToStr(Trunc(m_ReferData.m_fTantoNCode)));
            SQL.Add(' AND KmkNCode	= (SELECT NCode FROM KmkMA WHERE MasterKbn = 1');
            SQL.Add('				   AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :iKmkGCode)');

			SetFld('iKmkGCode').AsInteger := aKmkGCode;

            Open(True);

            // 非表示科目の場合
            if (EOF = False) then
            begin
            	m_ReferData.DspKmkSimpleName := '';
                Result := True;
            end;
        finally
        	Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数科目の科目別補助に諸口登録されているかチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aKmkGCode : Integer
//	Result	  : True = 諸口登録あり, False = 諸口登録なし
//**************************************************************************
function TDataHelper.IsExistSKC(aKmkGCode: Integer): Boolean;
begin
	Result := False;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SyokuchiKbn');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn		= ' + IntToStr(MST_SAIMOKU));
			SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn	= 0');
            SQL.Add(' AND SyokuchiKbn = ' + IntToStr(SYOKUCHI));
            SQL.Add(' AND GCode		= :iKmkGCode');

			SetFld('iKmkGCode').AsInteger := aKmkGCode;

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
                Result := True;
            end;
        finally
        	Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	表示の科目別補助に諸口以外登録されているかチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Result	  : True = 諸口以外の登録あり, False = 諸口以外の登録なし
//**************************************************************************
function TDataHelper.IsExistSmkNoSKC(): Boolean;
begin
	Result := False;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' TOP 1 SubCode');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn		= ' + IntToStr(MST_SAIMOKU));
			SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn	= 0');
            SQL.Add(' AND SyokuchiKbn	= ' + IntToStr(NOT_SYOKUCHI));
            SQL.Add(' AND NCode		= :sKmkNCode');

			SetFld('sKmkNCode').AsString := FloatToStr(Trunc(m_ReferData.DspKmkNCode));

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
               	Result := True;
            end;
        finally
        	Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数科目別補助コードと同一コードが登録されているかチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aSubCode : String
//	Result	  : True = 同一ｺｰﾄﾞあり, False = 同一ｺｰﾄﾞなし
//**************************************************************************
function TDataHelper.IsExistSameSubCode(aSubCode: String): Boolean;
begin
	Result := False;

    with m_Query do
    begin
    	try
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add(' SubCode');
            SQL.Add('FROM');
            SQL.Add(' KmkMA');
            SQL.Add('WHERE');
            SQL.Add(' MasterKbn = ' + IntToStr(MST_SAIMOKU));
			SQL.Add(' AND SumKbn	= 0');
            SQL.Add(' AND RDelKbn = 0');
            SQL.Add(' AND NCode = :sKmkNCode');
            SQL.Add(' AND SubCode = :sSubCode');

            SetFld('sKmkNCode').AsString	:= FloatToStr(Trunc(m_ReferData.DspKmkNCode));
            SetFld('sSubCode').AsString		:= ChangeCode(FOR_DBTABLE, aSubCode);

            Open(True);

            // レコードあり
            if (EOF = False) then
            begin
                Result := True;
            end;
        finally
        	Close;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助の仕訳が入力されているかチェックする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Result	  : True = 仕訳入力あり, False = 仕訳入力なし
//**************************************************************************
function TDataHelper.IsExistSwk(): Boolean;
begin
	Result := False;

    // 【会計】MP_MAS_CHK_KMKMA
    SetSPParam(SPMasKmk);
	SPMasKmk.FetchOptions.Items := SPMasKmk.FetchOptions.Items - [fiMeta];
    SPMasKmk.ExecProc;              // ｽﾄｱﾄﾞ実行
                                    // 結果
    if (SPMasKmk.ParamByName('@RetCd').AsInteger = 1) then
    begin
        Result := True;
        Exit;
    end;

    // 【債】MP_PAY_CHK_KMKMA
    SetSPParam(SPPayKmk);
	SPPayKmk.FetchOptions.Items := SPPayKmk.FetchOptions.Items - [fiMeta];
    SPPayKmk.ExecProc;				// ｽﾄｱﾄﾞ実行
                                    // 結果
    if (SPPayKmk.ParamByName('@RetCd').AsInteger = 1) then
    begin
        Result := True;
        Exit;
    end;

    // 【債権】MP_CRD_CHK_KMKMA
    SetSPParam(SPCrdKmk);
	SPCrdKmk.FetchOptions.Items := SPCrdKmk.FetchOptions.Items - [fiMeta];
    SPCrdKmk.ExecProc;              // ｽﾄｱﾄﾞ実行
                                    // 結果
    if (SPCrdKmk.ParamByName('@RetCd').AsInteger = 1 ) then
    begin
        Result := True;
        Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	検索Expの結果を取得し格納する。また、成否を返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Result	  : True = 格納あり, False = 格納なし
//**************************************************************************
function TDataHelper.ISGetExpRet(aMasterKbn: Integer): Boolean;
var
	lvExpSend	: rcJNTExpSend;
	lvExpRecv	: rcJNTExpRecv;
	iRetExp		: Integer;
    sSQL		: String;
begin
    Result := True;

	// パラメータ初期設定
	fnJNTExpMakeParam(@lvExpSend);

	// パラメータ設定
	lvExpSend.pMjsAppRec	:= m_pMyAppRecord;
	lvExpSend.pCopDB		:= @m_CorpDB;
	lvExpSend.ColorB		:= m_JNTMASCom.SystemArea.SysColorB;
	lvExpSend.ColorD		:= m_JNTMASCom.SystemArea.SysColorD;

    case aMasterKbn of
    MST_KANZYO:
    	begin
            lvExpSend.MasterKbn		:= MST_KANZYO;
            lvExpSend.ModulKbn		:= 0;
            lvExpSend.PatternNo		:= 1;
            lvExpSend.TBarNM		:= '検索ｴｸｽﾌﾟﾛｰﾗ';
            lvExpSend.TableName		:= 'KmkMA';
            sSQL		:= ' MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND SubKmkUse = 1';
            if (m_ReferData.SecSaiyo = SAIYOARI) then
            begin
            	sSQL	:= sSQL	+ ' AND GCode IN '
                				+ '  (SELECT KmkGCode FROM MV_MAS_SecKmkNoDispInfo '
                                + '   WHERE DispKbn <> 2 AND MainKbn = 1 AND TantoNCode = '
								+ 	   FloatToStr(Trunc(m_ReferData.TantoNCode))
                                + '  )';
        	end;
            lvExpSend.WhereStr		:= sSQL;
            lvExpSend.SortStr		:= 'ORDER BY GCode';
        end;
    end;

    // 共通検索エクスプローラのセット
	iRetExp :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
	if (iRetExp <> 1) then
    begin
    	Result := False;
		Exit;
    end;

    if Length(Trim(lvExpRecv.GCode))>0 then
	begin
		m_ReferData.DspKmkGCode := StrToInt(lvExpRecv.GCode);	// 選択された外部コード
        m_ReferData.DspKmkNCode := lvExpRecv.NCode;				// 選択された内部コード
		m_ReferData.DspKmkSimpleName := lvExpRecv.NMK;			// 選択された簡略名称
    end;
end;

//**************************************************************************
//	Proccess  :	印刷範囲ﾀﾞｲｱﾛｸﾞと印刷条件ﾀﾞｲｱﾛｸﾞを起動し、印刷を行う。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Result	  : True = 格納あり, False = 格納なし
//**************************************************************************
procedure TDataHelper.DoPrint();
var
	oJNTPDlg	: TFrmJNTPDialog;
    iRet_Hani	: Integer;
	iSelectPtn	: Integer;
    iRet_Prn	: Integer;
	iStKmkGCode : Integer;
    iEdKmkGCode : Integer;
    iOrder		: Integer;
    sTitle		: TStringList;
    sMemFld		: TStringList;    
begin
	iSelectPtn	:= 0;
	iStKmkGCode := 0;
    iEdKmkGCode := 0;
    iOrder		:= 0;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    oJNTPDlg	:= TFrmJNTPDialog.Create(m_Owner, @m_JNTHani);
    try
	    iRet_Hani	:= oJNTPDlg.ShowModal;
    finally
		oJNTPDlg.Free;
    end;
//<Del10-VerUp001><D10_OwnMapRules> ST
	m_CorpDB.FormatOptions.MapRules.Clear;
	m_CorpDB.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    case iRet_Hani of
    mrCancel:	//ｷｬﾝｾﾙ
        begin
            Exit;
        end;
    mrOK:		//通常
        begin
            iStKmkGCode := StrToIntDef(m_JNTHani.pvrStCode[0],0);
            iEdKmkGCode := StrToIntDef(m_JNTHani.pvrEdCode[0],0);
            iOrder		:= m_JNTHani.pvrOrder;

            m_MjsPrnDlg		:=  m_JNTHani.MJSPrnDlgf;
            m_PrnSupport	:=  m_JNTHani.PrnSupport;
            gfnSelSetPrnInfo(m_PrnSupport, m_JNTSelSys);
            iSelectPtn		:= m_JNTHani.pvrPattern;

            case iSelectPtn of
            PTN_SAIMOKU:
                begin
                    m_PrnSupport.ApRB			:=	RSaimoku;
                    m_PrnSupport.strDocName		:=	('科目別補助登録リスト');
                    m_PrnSupport.pPage			:=	R_SPage;
                    m_PrnSupport.pDate			:=	R_SDate;
                    m_PrnSupport.pCorpCode		:=	R_SCorpNo;
                    m_PrnSupport.pCorpName		:=	R_SCorpName;
                    m_PrnSupport.pAccountOffice	:=	R_SKaikeiName;
                end;
            end;

            m_PrnSupport.strFileName    :=	rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysCliRoot + '\tmp\' + m_PrnSupport.strDocName + '.csv';
            m_PrnSupport.pComArea 		:=  m_pMyAppRecord^.m_pCommonArea;
            m_PrnSupport.pApRec			:=  m_pMyAppRecord;
            m_PrnSupport.MdataModule    :=	m_DBModule;
            m_PrnSupport.iDspWriteBtn   :=  0;              // 保存ﾎﾞﾀﾝ制御(0:表示する)
            m_PrnSupport.iDspFileBtn    :=	1;              // ﾌｧｲﾙ出力表示

            // 抽出権限なし→ﾌｧｲﾙ出力非表示
            if ( m_ReferData.PermsFileOut = FALSE )  then
                m_PrnSupport.iDspFileBtn	:= 0
            else
                m_PrnSupport.iDspFileBtn	:= 1;

            // 暦区分
            if ( m_ReferData.YearKbn = YEARKBN_WAREKI ) then
                m_PrnSupport.iCalendarKbn	:=  1	//　和暦
            else
                m_PrnSupport.iCalendarKbn	:=  2;	//　西暦
        end;
    end;

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
    iRet_Prn := m_MjsPrnDlg.DoDLG(m_PrnSupport);

    if ( iRet_Prn > 0 ) then
    begin
        // 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
        if (m_JNTHani.mjspre.IsExistPreview) and
           (m_PrnSupport.iCommand = PDLG_PREVIEW) then
        begin
            MessageBeep(MB_OK);
            MjsMessageBox(m_Owner, '他の処理でプレビューが起動しています。'+#13#10+
                                '他のプレビューを終了してください。',
                        mjInformation, mjDefOk);
            Exit;
        end;

        // 集計処理
        case iSelectPtn of
        PTN_SAIMOKU:
            begin
            	// 科目別補助データ取得
            	GetSaimokuData(DMemSaimoku_Prn, iStKmkGCode, iEdKmkGCode, iOrder);

                if (DMemSaimoku_Prn.RecordCount = 0) then
                begin
                    Beep;
                    m_JNTSelSys.MsgDlg(2010,10);
                    Exit;
                end;

                case m_PrnSupport.iCommand of
                PDLG_PRINT,
                PDLG_PREVIEW:
                    begin
                        m_JNTHani.mjspre.Exec(m_PrnSupport, m_MjsPrnDlg, Nil);
                    end;
                PDLG_FILE   :
                    begin
                        sTitle	:= TStringList.Create;
                        sMemFld := TStringList.Create;

                        try
                            SetFileOut(PTN_SAIMOKU,sTitle,sMemFld);
                            if (MjsFileOut(DMemSaimoku_Prn, sMemFld, sTitle,
                                           m_PrnSupport, m_pMyAppRecord ) = RET_NG) then
                            begin
                               MessageBeep(MB_OK);
                               MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
                            end;
                        finally
                            sTitle.Free;
                            sMemFld.Free;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数にﾌｧｲﾙ出力情報をセット
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSelectPrn	: Integer	指定された印刷ﾊﾟﾀｰﾝ
//	Parameter :	aTitle	: TStringList	タイトルリスト
//	Parameter : aMemFld	: TStringList   参照フィールドリスト
//**************************************************************************
procedure TDataHelper.SetFileOut(aSelectPtn: Integer;var aTitle, aMemFld: TStringList);
begin
	case aSelectPtn of
    PTN_SAIMOKU:
        begin
        	aTitle.Add('科目ｺｰﾄﾞ');
        	aTitle.Add('科目名称');
        	aTitle.Add('科目別補助ｺｰﾄﾞ');
        	aTitle.Add('連想');
        	aTitle.Add('正式科目別補助名称');
        	aTitle.Add('簡略科目別補助名称');

            aMemFld.Add('KmkGCode');
            aMemFld.Add('KmkSimpleName');
            aMemFld.Add('SubCode');
            aMemFld.Add('Renso');
            aMemFld.Add('LongName');
            aMemFld.Add('SimpleName');
        end;
	end;
end;

//**************************************************************************
//	Proccess  :	TStoredProcへ必要なパラメータをセットする。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aSP	: TStoredProc	ｾｯﾄ対象ｽﾄｱﾄﾞ
//**************************************************************************
procedure TDataHelper.SetSPParam(var aSP: TFDStoredProc);
begin
    aSP.ParamByName('@NCode').AsFloat	:= m_ReferData.DspKmkNCode;
    aSP.ParamByName('@CNCode').AsFloat	:= DMemSaimoku_DspCNCode.AsFloat;
end;

//**************************************************************************
//	Proccess  :	TStoredProcへDBを関連付ける。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter : aSP	: TStoredProc	ｾｯﾄ対象ｽﾄｱﾄﾞ
//**************************************************************************
procedure TDataHelper.SetSPDB(var aSP: TFDStoredProc);
begin
	aSP.Connection := m_CorpDB;
	//aSP.SessionName	 := m_CorpDB.SessionName;
end;

//**************************************************************************
//	Proccess  :	科目別補助外部コードを属性と桁数を表示科目に設定された桁数と属性に合わせて変換
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//  Parameter :	aType  FOR_DISPLAY = 表示用, FOR_UPDATE = DB登録用
//			  :	aSubCode 変換対象コード
//**************************************************************************
function TDataHelper.ChangeCode(aType: Integer; aSubCode: String): String;
begin
	Result := '';

	case aType of
    FOR_DISPLAY:
	    begin
    		Result :=	m_JNTMASCom.SetDspCodeAttr(aSubCode,
            				m_ReferData.DspCodeDigit, m_ReferData.DspCodeAttr);
	    end;
    FOR_DBTABLE:
    	begin
        	case m_ReferData.DspCodeAttr of
            INT_ZERO_NASI,INT_ZERO_ARI:			// 数字
                begin
                    Result := 	m_JNTMASCom.SetDspCodeAttr(aSubCode,
                                    MAX_DIGIT_SUBCODE, INT_ZERO_ARI);
                end;
            STR_FREE:							// フリー
            	begin
					Result := 	TrimRight(aSubCode);
                end;
            end;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	科目別補助外部コードの桁数と属性を直接指定して変換
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//  Parameter :   aSubCode 変換対象コード
//			  :   aCodeDigit 指定桁数, aCodeAttr 指定属性
//**************************************************************************
function TDataHelper.ChangeCode(aSubCode: String; aCodeDigit, aCodeAttr: Integer): String;
begin
    Result := m_JNTMASCom.SetDspCodeAttr(aSubCode, aCodeDigit, aCodeAttr);
end;

//**************************************************************************
//	Proccess  :	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀｾｯﾄ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	iSyori  0 = 設定,  1 =開放
//**************************************************************************
procedure TDataHelper.SessionPractice(aSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= aSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//    SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

//**************************************************************************
//	Proccess  :	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSyoriKbn  SYORI_START=初期処理, SYORI_END=終了処理
//**************************************************************************
function TDataHelper.CallStoredProc(aSyoriKbn: Integer): Boolean;
begin
    Result := False;

    with m_Query do
    begin
    	try
        	// MP200010
            Close;
            SQL.Clear;

        	case aSyoriKbn of
            SYORI_START:			// 初期処理
                begin
                    SQL.Add('CALL MP200010(:parSyoriKbn, :parTANCD)');
                    SetFld('parTANCD').asFloat := m_ReferData.TantoNCode;
                end;
            SYORI_END:				// 終了処理
            	begin
	                SQL.Add('CALL MP200010(:parSyoriKbn)');
                end;
			end;

   	        SetFld('parSyoriKbn').AsInteger := aSyoriKbn;

			if (ExecSQL() = False) then
			begin
	            Exit;
			end;

	        Result := True;
        finally
            Close;
        end;
   	end;
end;

//**************************************************************************
//	Proccess  :	MemDataをコピーする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	fromMemdata	: TdxMemData	コピー元
//			  :	toMemdata  	: TdxMemData    コピー先
//**************************************************************************
procedure TDataHelper.CopyMemData(var fromMemdata,toMemdata :TdxMemData);
var
  	fMem : TMemoryStream;
begin
    fMem := TMemoryStream.Create;
	try
        fromMemdata.SaveToStream(fMem);
        fMem.Position := 0;
        toMemdata.LoadFromStream(fMem);
    finally
    	if Assigned(fMem) then
            fMem.Free;
    end;
end;

//**************************************************************************
//	Component	:	DMemSaimoku_Dsp ( TdxMemData )
//	Event	    :	OnAfterPost
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.DMemSaimoku_DspAfterPost(DataSet: TDataSet);
begin
    if (DMemSaimoku_DspCNCode.AsFloat <> 0 ) or
       (DMemSaimoku_DspSubCode.AsString <> '' ) then
    begin
		WriteSaimoku_KmkMA();
    end;
end;

//**************************************************************************
//	Component	:	R_KmkCode ( TppDBText )
//	Event	    :	OnPrint
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.R_KmkCodePrint(Sender: TObject);
var
	sCode	: String;
begin
    sCode	:=	R_KmkCode.Text;

	if (m_wkKmkGCode <> sCode) then
	begin
		R_KmkCode.Visible	:=	TRUE;
		R_KmkName.Visible	:=	TRUE;
		m_wkKmkGCode		:=	sCode;
	end
	else
	begin
		R_KmkCode.Visible	:=	FALSE;
		R_KmkName.Visible	:=	FALSE;
	end;
end;

//**************************************************************************
//	Component	:	R_SubCode ( TppDBText )
//	Event	    :	OnPrint
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.R_SubCodePrint(Sender: TObject);
var
	iAttr	: Integer;
begin
	iAttr := StrToInt(R_CodeAttr.Text);

    if (iAttr = STR_FREE) then
		R_SubCode.Alignment := taLeftJustify
    else
		R_SubCode.Alignment := taRightJustify;
end;

//**************************************************************************
//	Component	:	RSaimoku ( TppReport )
//	Event	    :	OnEndPage
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.RSaimokuEndPage(Sender: TObject);
begin
	m_wkKmkGCode := '';
end;

//**************************************************************************
//	Component	:	ppDetailBand_Saimoku ( TppDetailBand )
//	Event	    :	OnBeforeGenerate
//	Name	    :	M.Makino
//**************************************************************************
procedure TDataHelper.ppDetailBand_SaimokuBeforeGenerate(
  Sender: TObject);
begin
    // 最終ﾚｺｰﾄﾞ、頁の最下行を判定
	if ( ppDetailBand_Saimoku.LastRecord            ) or
       ( ppDetailBand_Saimoku.PageOutOfSpace = TRUE ) Then
	begin
		if ( ppDetailBand_Saimoku.OverFlow = FALSE ) then
			ppDetailBand_Saimoku.OverFlow   :=  TRUE;

		if ( ppUnderLineS.ReprintOnOverFlow = FALSE ) then
			ppUnderLineS.ReprintOnOverFlow  :=  TRUE;

        // ﾗｲﾝの太さを太くしている
		ppUnderLineS.Weight     :=  0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
		ppUnderLineS.Weight     :=  0.25;
	end;
end;

//**************************************************************************
//	Component	:	OnBeforePrint共通ｲﾍﾞﾝﾄ ( TppReport )
//	Event	    :	OnBeforePrint
//	Name	    :	M.Makino	<001> ADD
//**************************************************************************
procedure TDataHelper.OnCommonBeforePrint(Sender: TObject);
begin
	m_PrnSupport.BeforePrint(Sender);
end;

// <002> Start
//**************************************************************************
//	Proccess	:   ErrorMessageDsp
//	Name		:	T.Komatsu
//	Date		:	2018/09/18
//	Parameter	:
//	Return		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TDataHelper.ErrorMessageDsp(DmQuery: TMQuery);
begin
	case m_JNTMASCom.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
			//	最大登録件数をｵｰﾊﾞｰしました
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 0,1);
			MjsMessageBoxEx(Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		2:
		begin
			//	･･･のため削除できません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,5);
			MjsMessageBoxEx(Self,'固定体系区分が固定' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		3:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'子供が存在する為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		4:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'仕訳が存在する為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		5:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'諸口、総合計を削除する時にその他のマスタが登録済みの為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		6:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'支払予定データが存在する為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		7:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'部署情報が存在する為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;
		8:
		begin
			//	･･･することができません
			m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
			MjsMessageBoxEx(Self,'未連結仕訳(部署or分散)が存在する為削除' + m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType);
		end;

        -193, -196:
        begin
            // 重複ｴﾗｰ
            m_JNTMASCom.m_MsgStd.GetMsg ( m_MjsMsgRec, 10000, 10017 );
			MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype, m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, FALSE );
        end;
        -210:
        begin
            // ﾛｯｸｴﾗｰ
            m_JNTMASCom.m_MsgStd.GetMsg ( m_MjsMsgRec, 10000, 10016 );
			MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype, m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, FALSE );
        end;

		else
		begin
			m_JNTMASCom.m_MsgStd.GetMsgDB( m_MjsMsgRec, DmQuery );
			MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype, m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, FALSE );
		end;
	end;
end;
// <002> End

// <002> Start
//**********************************************************************
//*		Proccess	:	EdgeTracker経費精算連携用メッセージ表示(コード削除した時にメッセージを出力)
//*		Name		:	T.Komatsu
//*		Date		:	2018.09.13
//*		Parameter	:	なし
//*		Return		:	なし
//**********************************************************************
procedure TDataHelper.fnEdgeTrackerKeihiSeisanMsg();
var
	DmqData			: TMQuery;
    iCnt			: Integer;

begin

	DmqData := TMQuery.Create( Self );					        //	MQueryの構築
	m_DBModule.SetDBInfoToQuery( m_CorpDB, DmqData );		//	DBとMQueryの接続
	iCnt := 0 ;

	//	区分情報から経費精算連携採用の有無を取得
	with DmqData do
	begin
		Close();
		SQL.Clear;
        // RecKbn=54(経費精算)、GnPuKbn1（Edge Tracker 経費精算連携採用区分）
		SQL.ADD('SELECT count(*) as cnt FROM KbnInfo WHERE RecKbn=54 and GnPuKbn1 = 1');
		if Open = False then
		begin
			ErrorMessageDsp(DmqData);
			Close;
			Free;
			Exit;
		end;
        iCnt := GetFld('cnt').AsInteger;
		Close;
		Free;
	end;

    // 「Edge Tracker 経費精算連携」があるときにメッセージを表示する
	if (iCnt > 0) then
    begin
        MjsMessageBoxEx(Self, '科目別補助が削除されました。' + #13#10 + 'Edge Tracker でマスタを見直してください。', '確認', mjInformation, mjOk, mjDefOk);
    end
end;
// <002> End

// <003> add start
//**********************************************************************
//*		Proccess	:   CRLFCut
//*                     改行コード除去
//*		Name		:	T.Hosaka(SIG)
//*		Date		:	2019/09/09
//*		Parameter	:	String：処理対象文字列
//**********************************************************************
function TDataHelper.CRLFCut(sName: String): String;
var
	sWork	:	String;
begin
	// 行区切り文字を CR/LF に標準化
	sWork := AdjustLineBreaks(sName);
	// 改行コードを''に変換
	sWork := StringReplace(sWork, #13#10, '',[rfReplaceAll,rfIgnoreCase]);

	Result := sWork;
end;
// <003> add end

end.

