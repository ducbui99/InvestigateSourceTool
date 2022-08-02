//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>          <修正内容>
//  <>      T.Ogawa(LEAD)   2011/07/28(THU)   新規作成
//=============================================================================
unit JNTCRP004001APGu;

interface

uses
  SysUtils,IniFiles;

type
    TSection = (DLG_INFO,DEFMODE);

    TDLG_INFO = (INFO);

    TDEFMODE = (DSPTYPE);

    TSectionRecord = record
        Section : string;
        Key : string;
        Value : string;
    end;

    TJNTCRP004001APG = Class
    private
        m_APGPath : String;
        m_DLG_INFO : array[TDLG_INFO] of TSectionRecord;
        m_DEFMODE : array[TDEFMODE] of TSectionRecord;
        m_ErrMSG : string;
    	m_IniFile : TIniFile;
        procedure ReadInfo;
        procedure Update(Section:string;Key:string;Value:string);
    public
        constructor Create(sPath : String);
        destructor Destroy;override;
        procedure SetValue(Key:TDLG_INFO;Value:String);overload;
        procedure SetValue(Key:TDEFMODE;Value:String);overload;
        function GetValue(Key:TDLG_INFO):string;overload;
        function GetValue(Key:TDEFMODE):string;overload;
        function ErrMSG():string;
    end;

implementation


// -----------------------------------------------------------------------------
//  コンストラクタ
// -----------------------------------------------------------------------------
constructor TJNTCRP004001APG.Create(sPath:String);
begin
    inherited Create();
    m_APGPath := sPath;

    // 配列にデフォルト値をセット
    // DLG_INFO
    m_DLG_INFO[INFO].Section := 'DLG_INFO';
    m_DLG_INFO[INFO].Key := 'INFO';
    m_DLG_INFO[INFO].Value := '0';
    // DEFMODE
    m_DEFMODE[DSPTYPE].Section := 'DEFMODE';
    m_DEFMODE[DSPTYPE].Key := 'DSPTYPE';
    m_DEFMODE[DSPTYPE].Value := '0';

    ReadInfo();
end;

// -----------------------------------------------------------------------------
//  デストラクタ
// -----------------------------------------------------------------------------
destructor TJNTCRP004001APG.Destroy();
begin
    if Assigned(m_IniFile) then FreeAndNil(m_IniFile);
    inherited;
end;

// -----------------------------------------------------------------------------
//  APGファイルの読み込み
// -----------------------------------------------------------------------------
procedure TJNTCRP004001APG.ReadInfo;
begin
	m_IniFile := nil;
    try
        m_IniFile := TIniFile.Create(m_APGPath);

        // DLG_INFO
        with m_DLG_INFO[INFO] do
        begin
            Value := m_IniFile.ReadString(Section,Key,'0');
        end;

        // DEFMODE
        with m_DEFMODE[DSPTYPE] do
        begin
            Value := m_IniFile.ReadString(Section,Key,'0');
        end;
    except
        on e : exception do
        begin
            m_ErrMSG := '構成ファイルの読み出しエラー：'+e.Message;
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  APGファイルの更新
// -----------------------------------------------------------------------------
procedure TJNTCRP004001APG.Update(Section:string;Key:string;Value:string);
begin
    m_ErrMSG := '';
    try
        m_IniFile.WriteString(Section,Key,Value);
    except
        on e : exception do
        begin
            m_ErrMSG := '構成ファイルの書き込みエラー：'+e.Message;
        end;
    end;
end;

// -----------------------------------------------------------------------------
//  DLG_INFO更新
// -----------------------------------------------------------------------------
procedure TJNTCRP004001APG.SetValue(Key:TDLG_INFO;Value:string);
begin
    m_DLG_INFO[Key].Value := Value;
    Update(m_DLG_INFO[Key].Section,m_DLG_INFO[Key].Key,m_DLG_INFO[Key].Value);
end;

// -----------------------------------------------------------------------------
//  DEFMODE更新
// -----------------------------------------------------------------------------
procedure TJNTCRP004001APG.SetValue(Key:TDEFMODE;Value:string);
begin
    m_DEFMODE[Key].Value := Value;
    Update(m_DEFMODE[Key].Section,m_DEFMODE[Key].Key,m_DEFMODE[Key].Value);
end;

// -----------------------------------------------------------------------------
//  DLG_INFO取得
// -----------------------------------------------------------------------------
function TJNTCRP004001APG.GetValue(Key:TDLG_INFO):string;
begin
    result := m_DLG_INFO[Key].Value;
end;

// -----------------------------------------------------------------------------
//  DEFMODE取得
// -----------------------------------------------------------------------------
function TJNTCRP004001APG.GetValue(Key:TDEFMODE):string;
begin
    result := m_DEFMODE[Key].Value;
end;

// -----------------------------------------------------------------------------
//  エラーメッセージ
// -----------------------------------------------------------------------------
function TJNTCRP004001APG.ErrMsg():string;
begin
    result := m_ErrMSG;
end;

end.
