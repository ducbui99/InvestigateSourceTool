//************************************************************************
//	System		:	Galileopt / Galileopt NX-I
//	Program		:	科目別補助登録(簡易)
//	ProgramID	:	JNTCRP009010
//	Name		:	M.Makino
//	Create		:	2012 / 07 / 01
//	Comment		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//*************************************************************************
unit JNTCRP009010Controlu;

interface

uses
  Windows, SysUtils, Classes, VCL.Dialogs, MJSCommonDialogs, DBCtrls, Db, FireDAC.Comp.Client, dxmdaset,
  MJSDBModuleu, MjsPreviewIFu, JNTCommonu, JNTMasComu, JNTPDlg, JNTExpGlobal,
  JNTCRP009010Modelu, MJSStrctrl;

type
  {$I ActionInterface.inc}

  {状態定義}
  TMyStatus = (msNone, msInitializing, msInitialized, msRefer, msRead, msCleared,
  			   msSKCDlg, msErrKmkNotExist, msErrSMKNotAdopt, msErrKmkNoDsp,
               msErrSameSubCodeExist, msErrSubCodeNoDelete,
               msErrExistSameCode, msErrNoUseChar, msErrNoDataPrn);

  {ビジネスロジッククラス}
  TMyControl = Class
  private
	m_pMyAppRecord		: ^TMjsAppRecord;
    m_eOnStatusChanged	: TNotifyEvent;		// 状態変更イベント
	m_Status			: TMyStatus;		// 状態
    m_Status_Save		: TMyStatus;
    m_DataHelper			: TDataHelper;		// MODELユニット

    {状態を更新する}
    procedure SetStatus(aStatus: TMyStatus);
  public
    procedure Initialize();
	procedure finalize();
	procedure SetDataSource(aDataSource: TDataSource);
    procedure Read_Dsp(aKmkGCode: Integer);
    procedure Delete();
    procedure Clear();
    procedure Print();
    procedure AddRecord(aSubCode, aRenso, aLongName, aSimpleName: String);
    procedure SaveKmkInfo(aKmkGCode: Integer);
	procedure PrepareUpdate();
    function IsCanDspSaimoku(aKmkGCode: Integer): Boolean;
	function IsShowSKCDlg(aKmkGCode: Integer): Boolean;
	function IsCanDeleteSubCode(): Boolean;
	function IsDataChanged(aColIndex: Integer): Boolean;
    function IsCanPostSubCode(aSubCode: String): Boolean;
    function IsCanUseChar(aCode: String): Boolean;
    function IsCanUseDeleteBtn(): Boolean;
	function IsCanSetSimpleName(): Boolean;
	function IsCanSetExpRet_KNZ(var aKmkGCode: Integer;var aKmkSimpleName: String): Boolean;
    function GetJNTMASCom(): TJNTMASCom;
	function GetMjsPre(): TMjsPreviewIF;
	function GetMem(aSelect: Integer): TdxMemData;
	function GetKmkGCode(): Integer;
	function GetKmkSimpleName(): String;
	function GetCodeDigit(): Integer;
	function GetCodeAttr(): Integer;
    function GetRecNo(): Integer;
	function GetRecCount(): Integer;
	function GetRecCountPrn(): Integer;    
	function GetPermsUpdate(): Boolean;
	function GetPermsPrn(): Boolean;
	function GetPermsDelete(): Boolean;
	function GetYearKbn(): Integer;
	function GetCNCode(): Extended;
	function GetSubCode(): String;
    function GetSubCode_Save(): String;
	function GetLongName(): String;
	function GetSimpleName(): String;
	function GetSyokuchiKbn(): Integer;
	function GetChangedSubCode(aType: Integer; aSubCode: String): String;
	function GetMemState(): TDataSetState;
	procedure SetMemCancel();
	procedure SetReadOnly_SubCode(aFlg: Boolean);
	procedure SetSubCode();
	procedure SetSimpleName(aColIndex: Integer);

	// コンストラクタ
    constructor Create(aOwner: TComponent; aRec: Pointer);
    // デストラクタ
    destructor Destroy; override;
    // 状態プロパティ
    property Status: TMyStatus read m_Status write SetStatus;
    // 状態変更イベント
    property OnStatusChanged: TNotifyEvent read m_eOnStatusChanged write m_eOnStatusChanged;
    // MainユニットからDataHelperクラスのDataクラスを参照できるよう公開
	property DataHelper: TDataHelper read m_DataHelper;

  end;

const
    // 諸口区分
    NOT_SYOKUCHI	= 0;
    SYOKUCHI		= 1;

    // コード属性
    INT_ZERO_NASI	= 0;
    INT_ZERO_ARI	= 1;
    STR_FREE		= 2;

	// コード変換タイプ
    FOR_DISPLAY		= 0;
    FOR_DBTABLE		= 1;

    // 関数返り値
    RET_NG			= -1;
    RET_OK			= 0;
	RET_NULL		= 1;
    RET_EXIST	    = 2;

	// 処理区分
	SYORI_START		= 0;
    SYORI_END		= 1;

    // 販売・財務区分
	KBN_SEL			= 0;
	KBN_MAS			= 1;

    // Mem選択
    SAIMOKU_DSP		= 0;
    SAIMOKU_PRN		= 1;

    // 科目別補助グリッドのカラムインデックス
    GRIDSMK_COL_ALL			= -1;
    GRIDSMK_COL_SUBCODE		= 0;
    GRIDSMK_COL_RENSO		= 1;
    GRIDSMK_COL_LONGNAME	= 2;
    GRIDSMK_COL_SIMPLENAME	= 3;

implementation
  {$I JNTMASERRORCODECHECK.inc}

{ TMyControl }

//**************************************************************************
//	Proccess  :	ｺﾝｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aPec	: ^TMjsAppRecord
//**************************************************************************
constructor TMyControl.Create(aOwner: TComponent; aRec: Pointer);
begin
	inherited Create;

    m_Status := msNone;
	m_Status_Save :=msNone;    

    // 渡されたパラメータを格納
	m_pMyAppRecord := aRec;

    // モデルクラスを生成
    m_DataHelper := TDataHelper.CreateForm(aOwner, m_pMyAppRecord);
end;

//**************************************************************************
//	Proccess  :	ﾃﾞｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
destructor TMyControl.Destroy;
begin
	if Assigned(m_DataHelper) then
    begin
        m_DataHelper.Free;
        m_DataHelper := Nil;
    end;

	inherited;
end;

//**************************************************************************
//	Proccess  :	初期化する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.Initialize();
begin
	SetStatus(msInitializing);

    m_DataHelper.GetReferData();

    if (m_DataHelper.ReferData.ReferFlag = REFER) then
    	SetStatus(msRefer)
	else
		SetStatus(msInitialized);
end;

//**************************************************************************
//	Proccess  :	初期化する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.finalize();
begin
	m_DataHelper.DestructInstance();
end;

//**************************************************************************
//	Proccess  :	DataSourceにDataSetをセット
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aDataSource	: TDataSource
//**************************************************************************
procedure TMyControl.SetDataSource(aDataSource: TDataSource);
begin
	if (m_Status = msNone) then
		aDataSource.DataSet := m_DataHelper.MemSaimoku_Dsp;
end;

//**************************************************************************
//	Proccess  :	表示用に引数科目の科目別補助情報を取得する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aKmkGCode	: Integer
//**************************************************************************
procedure TMyControl.Read_Dsp(aKmkGCode: Integer);
begin
    // 科目別補助データ取得
    m_DataHelper.GetSaimokuData(m_DataHelper.MemSaimoku_Dsp, aKmkGCode, aKmkGCode, CODEORDER);

    // 参照モードなら参照状態を維持
    if (m_DataHelper.ReferData.ReferFlag = REFER) then
    	SetStatus(msRefer)
    else
		SetStatus(msRead);
end;

//**************************************************************************
//	Proccess  :	新規行を追加する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSubCode, aRenso, aLongName, aSimpleName : String	ﾚｺｰﾄﾞﾊﾟﾗﾒｰﾀ
//**************************************************************************
procedure TMyControl.AddRecord(aSubCode, aRenso, aLongName, aSimpleName: String);
var
	iSyokuchiKbn : Integer;
begin
	iSyokuchiKbn := NOT_SYOKUCHI;

	// 諸口登録
	if (m_Status = msSKCDlg) then
    	iSyokuchiKbn := SYOKUCHI;

    m_DataHelper.AppendRecord(aSubCode, aRenso, aLongName, aSimpleName, iSyokuchiKbn);
end;

//**************************************************************************
//	Proccess  :	現在行を削除する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.Delete();
begin
	// 削除処理
    m_DataHelper.DeleteSaimoku_KmkMA();

    if (GetRecCount() = 0) then
        SetStatus(msInitialized)
    else
        SetStatus(msRead);
end;

//**************************************************************************
//	Proccess  :	グリッド表示を全てｸﾘｱする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.Clear();
begin
	m_DataHelper.ClearMemData();
    m_DataHelper.ClearReferDataDsp();

    if (m_DataHelper.ReferData.ReferFlag = REFER) then
    	SetStatus(msRefer)
    else
	    SetStatus(msCleared);
end;

//**************************************************************************
//	Proccess  :	印刷する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.Print();
begin
    // 販売ポインタ設定
    m_DataHelper.SetAppRec(KBN_SEL);

    try
		m_DataHelper.DoPrint();
    finally
        // 財務ポインタ設定
        m_DataHelper.SetAppRec(KBN_MAS);
    end;
end;

//**************************************************************************
//	Proccess  :	表示チェックOK後科目情報を取得し保存する。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.SaveKmkInfo(aKmkGCode: Integer);
begin
    m_DataHelper.GetKmkInfo(aKmkGCode);
end;

//**************************************************************************
//	Proccess  :	DMemSaimoku_Dspの更新準備する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.PrepareUpdate();
begin
	if (Trunc(GetCNCode()) = 0) then
    begin
        m_DataHelper.SetInvisibleData();
    end;
end;

//**************************************************************************
//	Proccess  :	引数の科目ｺｰﾄﾞを表示できるかﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aKmkGCode	: Integer	ﾁｪｯｸ対象科目別補助外部ｺｰﾄﾞ
//	Retrun	  :	True = 表示可, False = 表示不可
//**************************************************************************
function TMyControl.IsCanDspSaimoku(aKmkGCode: Integer): Boolean;
begin
    Result := True;

    // グループ別権限チェック
    if (m_DataHelper.ReferData.SecSaiyo = SAIYOARI) then
    begin
        if (m_DataHelper.IsSecKmkNoDsp(aKmkGCode)) then
        begin
            Result := False;
            SetStatus(msErrKmkNoDsp);
            if (m_DataHelper.ReferData.ReferFlag = REFER) then
            	SetStatus(msRefer)
            else
            	SetStatus(msCleared);
            Exit;
        end;
    end;    

	// 存在チェック
    case m_DataHelper.CheckKmkGCode(aKmkGCode) of
    RET_NOTEXIST:
        begin
            Result := False;
            SetStatus(msErrKmkNotExist);
            if (m_DataHelper.ReferData.ReferFlag = REFER) then
            	SetStatus(msRefer)
            else
	            SetStatus(msCleared);
            Exit;
        end;
    RET_NOTADOPT:
    	begin
            Result := False;
            SetStatus(msErrSMKNotAdopt);
            if (m_DataHelper.ReferData.ReferFlag = REFER) then
            	SetStatus(msRefer)
            else
	            SetStatus(msInitialized);
            Exit;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数の科目ｺｰﾄﾞの諸口登録ﾀﾞｲｱﾛｸﾞを表示する必要があるかﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aKmkGCode	: Integer	ﾁｪｯｸ対象科目別補助外部ｺｰﾄﾞ
//	Retrun	  :	True = 表示する, False = 表示しない
//**************************************************************************
function TMyControl.IsShowSKCDlg(aKmkGCode: Integer): Boolean;
begin
	Result := False;

    // 参照モードならチェックなし
    if (m_DataHelper.ReferData.ReferFlag = REFER) then
    	Exit;

    // 諸口の存在チェック
    if (m_DataHelper.IsExistSKC(aKmkGCode) = False) then
	begin
		Result := True;
		SetStatus(msSKCDlg);

        // 諸口登録されたかをRecordCountで判断して状態セット
        if (GetRecCount() = 0) then
            SetStatus(msInitialized)
        else
            SetStatus(msRead);

        Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	現在行の科目ｺｰﾄﾞ削除可能かﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  :	True = 削除可, False = 削除不可
//**************************************************************************
function TMyControl.IsCanDeleteSubCode(): Boolean;
begin
	Result := True;
	m_Status_Save := m_Status;

    // 削除前の仕訳入力チェック
    if (m_DataHelper.IsExistSwk()) then
    begin
        Result := False;
		SetStatus(msErrSubCodeNoDelete);
        SetStatus(m_Status_Save);
        Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	現在行に変更の有無をﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aColIndex	: Integer	ﾁｪｯｸ対象ｶﾗﾑｲﾝﾃﾞｯｸｽ
//	Retrun	  :	True = 変更あり, False = 変更なし
//**************************************************************************
function TMyControl.IsDataChanged(aColIndex: Integer): Boolean;
begin
	Result := True;

    case aColIndex of
    GRIDSMK_COL_SUBCODE:
    	begin
        	if NOT (GetMemState() IN [dsInsert]) then
            begin
                if (GetSubCode() = GetSubCode_Save()) then
                begin
                    Result := False;
                    Exit;
                end;
            end;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	引数の科目別補助ｺｰﾄﾞが登録可能かﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSubCode	: String	ﾁｪｯｸ対象
//	Retrun	  :	True = 登録可, False = 登録不可
//**************************************************************************
function TMyControl.IsCanPostSubCode(aSubCode: String): Boolean;
begin
	Result := True;
	m_Status_Save := m_Status;

    // 使用可能コードチェック
    if (IsCanUseChar(aSubCode) = False) then
    begin
		Result := False;
        Exit;
    end;

    // 重複チェック
    if (m_DataHelper.IsExistSameSubCode(aSubCode)) then
	begin
        Result := False;
        SetStatus(msErrExistSameCode);
        SetStatus(m_Status_Save);
        Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	引数のｺｰﾄﾞが使用可能文字かﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aCode	: String	ﾁｪｯｸ対象
//	Retrun	  :	True = 使用可, False = 使用不可
//**************************************************************************
function TMyControl.IsCanUseChar(aCode: String): Boolean;
begin
	Result := True;
	m_Status_Save := m_Status;

    if (m_DataHelper.ReferData.DspCodeAttr = STR_FREE) then
    begin
        if (JNTMASERRORCODECHECK(aCode, m_DataHelper.ReferData.ValidChar) = False) then
        begin
        	if (m_Status <> msSKCDlg) then
            begin
                SetStatus(msErrNoUseChar);
                SetStatus(m_Status_Save);
            end;
            Result := False;
            Exit;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	削除ﾎﾞﾀﾝが使用可能かﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  :	True = 使用可, False = 使用不可
//**************************************************************************
function TMyControl.IsCanUseDeleteBtn(): Boolean;
begin
	Result := True;

    // 参照モードならチェックなしでNG
    if (m_DataHelper.ReferData.ReferFlag = REFER) then
    begin
    	Result := False;
    	Exit;
	end;

    // 新規行であれば使用不可
    if (GetMemState() IN [dsInsert]) then
    begin
		Result := False;
        Exit;
    end;

    // 空白チェック,権限チェック
    if (Trim(GetSubCode()) = '') or
       (GetPermsDelete() = False) or
       (m_Status = msRefer) then
    begin
		Result := False;
        Exit;
    end;

    // 諸口区分と諸口以外の登録有無をチェック
	if (GetSyokuchiKbn() = SYOKUCHI) then
    begin
		if (m_DataHelper.IsExistSmkNoSKC()) then
        begin
			Result := False;
            Exit;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	簡略名称に正式名称をｾｯﾄして良いかﾁｪｯｸする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  :	True = 使用可, False = 使用不可
//**************************************************************************
function TMyControl.IsCanSetSimpleName(): Boolean;
begin
    Result := True;

    if ((GetLongName() = '') or (GetSimpleName() <> '')) then
    begin
        Result := False;
        Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	検索Expを起動し、参照型引数に値がｾｯﾄされたかを返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aKmkGCode		: Integer   科目別補助外部ｺｰﾄﾞ
//			　:	aKmkSimpleName	: String    科目別補助簡略名称
//	Retrun	  :	True = ｾｯﾄされた, False = ｾｯﾄされなかった
//**************************************************************************
function TMyControl.IsCanSetExpRet_KNZ(var aKmkGCode: Integer;
									   var aKmkSimpleName: String): Boolean;
begin
	Result := False;

	if (m_DataHelper.IsGetExpRet(MST_KANZYO)) then
    begin
		aKmkGCode		:= GetKmkGCode();
        aKmkSimpleName	:= GetKmkSimpleName();
        Result := True;
    end;
end;

//**************************************************************************
//	Proccess  :	システムメモリを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : TJNTMASCom
//**************************************************************************
function TMyControl.GetJNTMASCom(): TJNTMASCom;
begin
	Result := m_DataHelper.JNTMASCom;
end;

//**************************************************************************
//	Proccess  :	TMjsPreviewIFｲﾝｽﾀﾝｽを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : TJNTHani
//**************************************************************************
function TMyControl.GetMjsPre(): TMjsPreviewIF;
begin
	Result := m_DataHelper.JNTHani.mjspre;
end;

//**************************************************************************
//	Proccess  :	TdxMemDataを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSelect		: Integer   対象MemDataを指定
//	Retrun	  : TdxMemData
//**************************************************************************
function TMyControl.GetMem(aSelect: Integer): TdxMemData;
begin
	Result := Nil;
	case aSelect of
    SAIMOKU_DSP: Result := m_DataHelper.MemSaimoku_Dsp;
    SAIMOKU_PRN: Result := m_DataHelper.MemSaimoku_Prn;
    end;
end;

//**************************************************************************
//	Proccess  :	科目外部ｺｰﾄﾞを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetKmkGCode(): Integer;
begin
	Result := m_DataHelper.ReferData.DspKmkGCode;
end;

//**************************************************************************
//	Proccess  :	科目簡略名称を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetKmkSimpleName(): String;
begin
	Result := m_DataHelper.ReferData.DspKmkSimpleName;
end;

//**************************************************************************
//	Proccess  :	表示科目に採用されている科目別補助の桁数を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetCodeDigit(): Integer;
begin
	Result := m_DataHelper.ReferData.DspCodeDigit;
end;

//**************************************************************************
//	Proccess  :	表示科目に採用されている科目別補助の属性を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetCodeAttr(): Integer;
begin
	Result := m_DataHelper.ReferData.DspCodeAttr;
end;

//**************************************************************************
//	Proccess  :	現在行Noを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetRecNo(): Integer;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.RecNo;
end;

//**************************************************************************
//	Proccess  :	科目別補助ｸﾞﾘｯﾄﾞの総行数を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetRecCount(): Integer;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.RecordCount;
end;

//**************************************************************************
//	Proccess  :	印刷MemDataの総行数を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetRecCountPrn(): Integer;
begin
	Result := m_DataHelper.MemSaimoku_Prn.RecordCount;
end;

//**************************************************************************
//	Proccess  :	更新権限をを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : True = 更新権限あり, False = 更新権限なし
//**************************************************************************
function TMyControl.GetPermsUpdate(): Boolean;
begin
	Result := m_DataHelper.ReferData.PermsUpdate;
end;

//**************************************************************************
//	Proccess  :	印刷権限をを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : True = 印刷権限あり, False = 印刷権限なし
//**************************************************************************
function TMyControl.GetPermsPrn(): Boolean;
begin
	Result := m_DataHelper.ReferData.PermsPrn;
end;

//**************************************************************************
//	Proccess  :	削除権限をを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : True = 削除権限あり, False = 削除権限なし
//**************************************************************************
function TMyControl.GetPermsDelete(): Boolean;
begin
	Result := m_DataHelper.ReferData.PermsDelete;
end;

//**************************************************************************
//	Proccess  :	出力権限をを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer		YEARKBN_WAREKI, YEARKBN_SEIREKI
//**************************************************************************
function TMyControl.GetYearKbn(): Integer;
begin
	Result := m_DataHelper.ReferData.YearKbn;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助内部コードを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Extended
//**************************************************************************
function TMyControl.GetCNCode(): Extended;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.FieldByName('CNCode').AsFloat;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助外部コードを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetSubCode(): String;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.FieldByName('SubCode').AsString;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助外部コードの保存データを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetSubCode_Save(): String;
begin
	m_DataHelper.MemSaimoku_Save.First;
    m_DataHelper.MemSaimoku_Save.MoveBy(GetRecNo() -1);
	Result := m_DataHelper.MemSaimoku_Save.FieldByName('SubCode').AsString;
	m_DataHelper.MemSaimoku_Save.First;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助正式名称を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetLongName(): String;
begin
    Result := m_DataHelper.MemSaimoku_Dsp.FieldByName('LongName').AsString;
end;

//**************************************************************************
//	Proccess  :	現在行の科目別補助簡略名称を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetSimpleName(): String;
begin
    Result := m_DataHelper.MemSaimoku_Dsp.FieldByName('SimpleName').AsString;
end;

//**************************************************************************
//	Proccess  :	現在行の諸口区分を取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : Integer
//**************************************************************************
function TMyControl.GetSyokuchiKbn(): Integer;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.FieldByName('SyokuchiKbn').AsInteger;
end;

//**************************************************************************
//	Proccess  :	引数の科目別補助外部コードを表示用に変換して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aType		: Integer   変換ﾀｲﾌﾟ
//			  :	aSubCode	: Integer   変換対象科目別補助外部ｺｰﾄﾞ
//	Retrun	  : String
//**************************************************************************
function TMyControl.GetChangedSubCode(aType: Integer; aSubCode: String): String;
begin
	Result := m_DataHelper.ChangeCode(aType, aSubCode);
end;

//**************************************************************************
//	Proccess  :	MemSaimoku_DspのStateプロパティを取得して返す
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Retrun	  : TDataSetState
//**************************************************************************
function TMyControl.GetMemState(): TDataSetState;
begin
	Result := m_DataHelper.MemSaimoku_Dsp.State;
end;

//**************************************************************************
//	Proccess  :	MemSaimoku_DspのCancelを実行する
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.SetMemCancel();
begin
	m_DataHelper.MemSaimoku_Dsp.Cancel;
end;

//**************************************************************************
//	Proccess  :	MemSaimoku_DspのReadOnlyプロパティをセットする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aFlg		: Boolean   ｾｯﾄする値
//**************************************************************************
procedure TMyControl.SetReadOnly_SubCode(aFlg: Boolean);
begin
	m_DataHelper.MemSaimoku_Dsp.FieldByName('SubCode').ReadOnly := aFlg;
end;

//**************************************************************************
//	Proccess  :	現在行の外部コードを表示用に変換してセットする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.SetSubCode();
begin
	m_DataHelper.SetChangedSubCode();
end;

//**************************************************************************
//	Proccess  :	現在行の正式名称を簡略名称へセットする
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.SetSimpleName(aColIndex: Integer);
begin
	m_DataHelper.SetSimpleNameFromLongNmae(aColIndex);
end;

//**************************************************************************
//	Proccess  :	ステータスをセットしてOnStatusChangedイベントを起こす
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TMyControl.SetStatus(aStatus: TMyStatus);
begin
	m_Status := aStatus;

    m_eOnStatusChanged(Nil);
end;

end.
