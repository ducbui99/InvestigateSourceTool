//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>          <修正内容>
//  <>      T.Ogawa(LEAD)   2012/06/05(TUE)   新規作成
//=============================================================================
unit JNTCRP018001APGu;

interface

uses
  SysUtils,IniFiles,contnrs;

type
    // Keyクラス
    KeyData = class
    public
        KeyName : String;
        Value : String;
        DefaultValue : String;
    end;

    APGFileController = Class;   // 前方参照

    //======================================
    // セクションの基本クラス
    //======================================
    BaseSection = Class
    private
        moCtrl          : APGFileController;
        mbReadComplete  : Boolean;
        miPosition       : Integer;
        function GetItem(keyName : String): String;
        procedure SetItem(KeyName : String; value : String);
    protected
        moKeyDatas      : TObjectList;
        msSectionName   : String;
        procedure AddKey(keyName: string; value: string; defaultValue: string);
    public
        constructor Create(oCtrl : APGFileController);
        destructor Destroy();override;
        function GetSectionName(): String;
        property SectionName : String read GetSectionName;
        function GetKeyValue(): TObjectList;
        property Item[keyName : String] : String read GetItem write SetItem; default;
    end;

    //==========================================================================
    // セクションクラスのコレクションクラス
    //==========================================================================
    SectionList = Class(TObjectList)
    private
        function GetItem(pSectionName: String): BaseSection;
    public
        property Items[pSectionName: String] : BaseSection read GetItem; default;
    end;

    //==========================================================================
    // 起動確認ダイアログの表示有無を管理するセクションクラス
    //==========================================================================
    DlgInfoSection = Class(BaseSection)
    public
        constructor Create(oCtrl : APGFileController);
    end;

    //==========================================================================
    // 起動モードを管理するセクションクラス
    //==========================================================================
    DefModeSection = Class(BaseSection)
    public
        constructor Create(oCtrl : APGFileController);
    end;

    //==========================================================================
    // 検索EXPの対象条件設定値を管理するセクションクラス
    //==========================================================================
    ExpValueSection = Class(BaseSection)
    public
        constructor Create(oCtrl : APGFileController);
    end;
//<ConInfo> ADD St
    //==========================================================================
    // 契約情報の設定値を管理するセクションクラス
    //==========================================================================
    ConstractInfoSection = Class(BaseSection)
    public
        constructor Create(oCtrl : APGFileController);
    end;
//<ConInfo> ADD Ed
    //======================================
    // APGファイル操作クラス
    //======================================
    APGFileController = Class
    private
        msAPGPath : String;
        msErrMSG : string;
        moSections : array of BaseSection;
        procedure Read(position : Integer);
        procedure Update(Section:string;Key:string;Value:string);
    public
        constructor Create(sPath : String);
        destructor Destroy;override;
        function SetSection(oSection : BaseSection): Integer;
        function ErrMSG():string;
    end;

implementation

// -----------------------------------------------------------------------------
//  セクション基本クラスコンストラクタ
// -----------------------------------------------------------------------------
constructor BaseSection.Create(oCtrl : APGFileController);
begin
    inherited Create();
    moCtrl := oCtrl;
    miPosition := moCtrl.SetSection(self);
    moKeyDatas := TObjectList.Create();
end;

// -----------------------------------------------------------------------------
//  デストラクタ
// -----------------------------------------------------------------------------
destructor BaseSection.Destroy();
begin
    if Assigned(moKeyDatas) then
    begin
        moKeyDatas.Free();
    end;
    inherited;
end;
// -----------------------------------------------------------------------------
//  セクション名取得
// -----------------------------------------------------------------------------
function BaseSection.GetSectionName(): String;
begin
    result := msSectionName;
end;
// -----------------------------------------------------------------------------
//  セクションに属するKeyデータ取得
// -----------------------------------------------------------------------------
function BaseSection.GetKeyValue(): TObjectList;
begin
    result := moKeyDatas;
end;

// -----------------------------------------------------------------------------
//  セクションに属するKeyデータをコレクションに追加
// -----------------------------------------------------------------------------
procedure BaseSection.AddKey(keyName: string; value: string; defaultValue: string);
var
    oKeyData : KeyData;
begin
    oKeyData := KeyData.Create();
    oKeyData.KeyName := keyName;
    oKeyData.Value := value;
    oKeyData.DefaultValue := defaultValue;
    moKeyDatas.Add(oKeyData);
end;

// -----------------------------------------------------------------------------
//  Key名から値を取得
// -----------------------------------------------------------------------------
function BaseSection.GetItem(keyName : String): String;
var
    idx : Integer;
    oKeyData : KeyData;
begin
    result := '';
    if (mbReadComplete = false) then
    begin
        moCtrl.Read(miPosition);
        mbReadComplete := true;
    end;

    for idx := 0 to (moKeyDatas.Count -1) do
    begin
        oKeyData := KeyData(moKeyDatas[idx]);
        if (oKeyData.KeyName = keyName) then
        begin
            result := oKeyData.Value;
        end;
    end;
end;
// -----------------------------------------------------------------------------
//  Keyへ値をセットしてAPGファイルにも更新する
// -----------------------------------------------------------------------------
procedure BaseSection.SetItem(KeyName : String; value : String);
var
    idx : Integer;
    oKeyData : KeyData;
begin
    for idx := 0 to moKeyDatas.Count -1 do
    begin
        oKeyData := KeyData(moKeyDatas[idx]);
        if (oKeyData.KeyName = keyName) then
        begin
            oKeyData.Value := value;
            moCtrl.Update(SectionName, oKeyData.KeyName, oKeyData.Value);
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  BaseSectionの取得
// -----------------------------------------------------------------------------
function SectionList.GetItem(pSectionName: String): BaseSection;
var
    idx : Integer;
    oSection : BaseSection;
begin
    result := nil;
    for idx := 0 to Self.Count -1 do
    begin
        oSection := BaseSection(inherited Get(idx));
        if oSection.SectionName = pSectionName then
        begin
            result := oSection;
            break;
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  起動確認セクションクラスコンストラクタ
// -----------------------------------------------------------------------------
constructor DlgInfoSection.Create(oCtrl : APGFileController);
begin
    inherited Create(oCtrl);

    msSectionName := 'DLG_INFO';
    AddKey('INFO_KOUJI', '', '0');
    AddKey('INFO_PROJECT', '', '0');
end;

// -----------------------------------------------------------------------------
//  起動モードセクションクラスコンストラクタ
// -----------------------------------------------------------------------------
constructor DefModeSection.Create(oCtrl : APGFileController);
begin
    inherited Create(oCtrl);

    msSectionName := 'DEFMODE';
    AddKey('DSPTYPE_KOUJI', '', '0');
    AddKey('DSPTYPE_PROJECT', '', '0');
end;
//<EXP> ADD St
// -----------------------------------------------------------------------------
//  検索EXP対象条件セクションクラスコンストラクタ
// -----------------------------------------------------------------------------
constructor ExpValueSection.Create(oCtrl : APGFileController);
begin
    inherited Create(oCtrl);

    msSectionName := 'EXP_VALUE';
    AddKey('DIVISION_PROJECT', '', '-1');
    AddKey('DIVISION_KOUJI', '', '-1');
    AddKey('EMPLOYEE_PROJECT', '', '-1');
    AddKey('EMPLOYEE_KOUJI', '', '-1');
end;
//<EXP> ADD Ed
//<ConInfo> ADD St
// -----------------------------------------------------------------------------
//  契約情報設定値セクションクラスコンストラクタ
// -----------------------------------------------------------------------------
constructor ConstractInfoSection.Create(oCtrl : APGFileController);
begin
    inherited Create(oCtrl);

    msSectionName := 'ConstractInfo';
    AddKey('ErrorTaxRateCheck', '', '0');
end;
//<ConInfo> ADD Ed
// -----------------------------------------------------------------------------
//  APGファイルコントローラーコンストラクタ
// -----------------------------------------------------------------------------
constructor APGFileController.Create(sPath:String);
begin
    inherited Create();
    msAPGPath := sPath;
end;

// -----------------------------------------------------------------------------
//  デストラクタ
// -----------------------------------------------------------------------------
destructor APGFileController.Destroy();
begin
    inherited;
end;
// -----------------------------------------------------------------------------
//  セクションをセットする
// -----------------------------------------------------------------------------
function APGFileController.SetSection(oSection : BaseSection): Integer;
begin

    SetLength(moSections, Length(moSections) + 1);
    moSections[High(moSections)] := oSection;
    result := High(moSections);
end;

// -----------------------------------------------------------------------------
//  APGファイルの読み込み
// -----------------------------------------------------------------------------
procedure APGFileController.Read(position : Integer);
var
    idx : Integer;
    sectionName : String;
    keyName,
    defaultValue : String;
    oIniFile : TIniFile;
    keyDatas : TObjectList;
    oKeyData : KeyData;
    oSection : BaseSection;
begin
    msErrMSG := '';
	oIniFile := nil;

    try
        oSection := moSections[position];
        keyDatas := oSection.GetKeyValue();
        sectionName := oSection.SectionName;
        oIniFile := TIniFile.Create(msAPGPath);
        try
            for idx := 0 to keyDatas.Count -1 do
            begin
                oKeyData := KeyData(keyDatas[idx]);
                keyName := oKeyData.KeyName;
                defaultValue := oKeyData.DefaultValue;

                oKeyData.Value :=
                    oIniFile.ReadString(sectionName, keyName, defaultValue);
            end;

        finally
            FreeAndNil(oIniFile);
        end;
    except
        on e : exception do
        begin
            msErrMSG := '構成ファイルの読み出しエラー：'+e.Message;
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  APGファイルの更新
// -----------------------------------------------------------------------------
procedure APGFileController.Update(Section:string;Key:string;Value:string);
var
    oIniFile : TIniFile;
begin
    msErrMSG := '';
    try
        oIniFile := TIniFile.Create(msAPGPath);
        try
            oIniFile.WriteString(Section,Key,Value);
        finally
            FreeAndNil(oIniFile);
        end;
    except
        on e : exception do
        begin
            msErrMSG := '構成ファイルの書き込みエラー：'+e.Message;
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  エラーメッセージ
// -----------------------------------------------------------------------------
function APGFileController.ErrMsg():string;
begin
    result := msErrMSG;
end;
//<EXP> MOD Ed
end.

