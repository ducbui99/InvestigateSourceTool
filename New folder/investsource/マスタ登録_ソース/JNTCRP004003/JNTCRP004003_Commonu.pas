//==============================================================================
// 共通定義ユニット
//==============================================================================
unit JNTCRP004003_Commonu;

interface

uses
 windows, classes, messages, ActnList,VCL.Dialogs, MJSCommonDialogs, MJSDispCtrl, VCL.Controls, VCL.StdCtrls,
 MJSLabel, MJSEdits, SysUtils, contnrs{180};

const
    // OnPaint 時の処理起動Message用
	WM_ONPAINT	= WM_APP + 1;

	// -----<155> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<155> Add-Ed-----
//<DENSHI> ADD St
    DENKBN_DENSAI = 1;   // でんさいネット
    DENKBN_JEMCO = 2;    // JEMCO

    DENNAME_DENSAI = 'でんさい';
    DENNAME_JEMCO = 'ＪＥＭＣＯ電手';

    DTLTAB_KIHON   = 0;    // 基本情報タブ
    DTLTAB_NYUKIN  = 1;    // 入金情報
    DTLTAB_DENSHI  = 2;    // 電子記録債権情報タブ
    DTLTAB_ACCOUNT = 3;    // 口座振替情報タブ  <Account> ADD
    DTLTAB_GAIKA   = 4;    // 外貨情報タブ  <GAIKA> ADD
//<Account> ADD St
    DTLTAB_FIRST = DTLTAB_KIHON;   // タブを追加したらここも変更する   <Account> ADD
    DTLTAB_LAST = DTLTAB_GAIKA;    // タブを追加したらここも変更する   <GAIKA> MOD

    DTLTABS : array[DTLTAB_FIRST..DTLTAB_LAST] of String =
        ('Kihon', 'Nyukin', 'Denshi', 'Account', 'Gaika');  //<GAIKA> MOD
//<Account> ADD Ed
    MSG_DELETE2 = '%sの削除を行います。'+#13#10+'よろしいですか？';    //1はJNTConstで使用済み
//<DENSHI> ADD Ed

type
//{$I Log_Writer_1.inc}  //*Log*
    ArrayNotifyEvent = array of TNotifyEvent;  //<180> ADD
    // ｺｰﾄﾞﾘｽﾄ(数値ｺｰﾄﾞ)
	CodeList		= Record
    	iCode	   	:	Integer;
        sName		:	String;
    end;

    AfterSaveRec	= Record
        sNknCD	    :   String;     // 入金先ｺｰﾄﾞ
        sOyaCD		:   String;		// 名寄せ親入金先ｺｰﾄﾞ
	end;

    // ﾌｧﾝｸｼｮﾝ制御用<100>
    urFncInfo = record
        Caption: array[0..7] of String;
        Action:  array[0..7] of TAction;
    end;

    //権限管理テスト
    rcMTokuiGrant   = Record

        IsAppend  : boolean;
        IsDelete  : boolean;
        IsDisplay : boolean;
        IsModify  : boolean;
        IsPrint   : boolean;

     end;

//<Account> ADD St
    ZeroOption = (zoZeroPad);

    TFuncAccName = function(Index : Integer): String of Object;
    TPrsShowMessage = procedure(
        sMsg : string;
        sCaption : string;
        msgBoxType : TMjsMsgBoxType;
        msgBoxBtns : TMjsMsgBoxButtons;
        msgBoxDefBtn : TMjsMsgBoxDefBtn) of Object;

    TReference = Class
        private
            moPrsShowMessage : TPrsShowMessage;
        public
            property PrsShowMessage : TPrsShowMessage read moPrsShowMessage write moPrsShowMessage;
    end;

    //========================================================================//
    // 概要： コントローラークラス                                            //
    //        NumEditに入力された値に基づいて、ラベルに名称をセットする       //
    //        機能を提供する。                                                //
    //========================================================================//
    TComponentController = class
    private
        moLbl       : TMLabel;
        moNumEdit   : TMNumEdit;
        moCodeLists  : array of CodeList;       // チェックする項目の配列
//<180> ADD St
        moChangeEvents : array of TNotifyEvent;
//        moChangeEvents : ArrayNotifyEvent;
        moExitEvents   : ArrayNotifyEvent;
        procedure ComChange(Sender: TObject);
        procedure ComExit(Sender: TObject);
//<180> ADD Ed
    public
        constructor Create(
            oLbl: TMLabel;
            oNumEdit: TMNumEdit;
            oCodeLists: array of CodeList;
            iValue: Extended);
        procedure Change();
        procedure Exit();
//<180> ADD St
        procedure SetChangeEvent(pEvents: array of TNotifyEvent);
        procedure SetExitEvent(pEvents: ArrayNotifyEvent);
//<180> ADD Ed
    end;
//<GAIKA> ADD St
//<GAIKA_1> ADD St
	// 債権基本情報
    TCrdSysInfo	=	class(TObject)
    private
    	m_iBaseNCode	:	Int64;			// 会社基本内部コード
        m_iItemID		:	Integer;		// 項目ＩＤ
        m_iItemType		:	Integer;		// 項目属性
        m_iSysKbn		:	Int64;			// 数値項目
        m_sSysName		:	String;			// 文字項目
        m_dSysDate		:	TDate;			// 日付項目
	public
    	property	BaseNCode	:	Int64		read	m_iBaseNCode	write	m_iBaseNCode;
        property	ItemID		:	Integer		read	m_iItemID		write	m_iItemID;
        property	ItemType	:	Integer		read	m_iItemType		write	m_iItemType;
        property	SysKbn		:	Int64		read	m_iSysKbn		write	m_iSysKbn;
        property	SysName		:	String		read	m_sSysName		write	m_sSysName;
        property	SysDate		:	TDate		read	m_dSysDate		write	m_dSysDate;
    end;
//<GAIKA_1> ADD Ed
const
    SaiyoNames_Gaika : array[0..2] of CodeList = (
        (iCode : 0; sName : 'なし'),
        (iCode : 1; sName : 'あり'),
        (iCode : 2; sName : 'あり(外貨入金のみ)'));

//<GAIKA> ADD Ed
{ グローバル関数定義エリア }
function IfThen(Cond: Boolean; Str_1,Str_2 :String): String;overload;
function IfThen(Cond: Boolean; Int_1,Int_2 :Integer): Integer;overload;
function IfThen(Cond: Boolean; Obj_1,Obj_2 :TObject): TObject; overload;
procedure CustomSetFocus(oComs : array of TWinControl; index: Integer=0);
function IsNumeric(value: String): Boolean;
function IsZero(value: String): Boolean;
function ToZeroExclude(value: String; option: ZeroOption = zoZeroPad): String;
function GetCodeListByName(code: Integer; list: array of CodeList): String;  //<GAIKA> ADD
procedure CustomSetEnabled(pControl : TWinControl; value : Boolean);  // <180> ADD

//var
//    m_Log           : TLog_Writer;  //*Log*
implementation
//{$I Log_Writer_2.inc}  //*Log*
//=========================================================
// String型の三項演算子
//=========================================================
function IfThen(Cond: Boolean; Str_1,Str_2 :String):String;
begin
     if Cond then  Result := Str_1
     else  Result := Str_2;
end;

//=========================================================
// Integer型の三項演算子
//=========================================================
function IfThen(Cond: Boolean; Int_1,Int_2 :Integer):Integer;
begin
     if Cond then  Result := Int_1
     else  Result := Int_2;
end;

//=========================================================
// Object型の三項演算子
//=========================================================
function IfThen(Cond: Boolean; Obj_1,Obj_2 :TObject): TObject;
begin
    if Cond then  Result := Obj_1
    else  Result := Obj_2;
end;

//=========================================================
// 安全にフォーカスを当てる
//=========================================================
procedure CustomSetFocus(oComs : array of TWinControl; index: Integer=0);
begin
    if index >= Length(oComs) then
    begin
        Exit;
    end;

    if oComs[index].CanFocus then
    begin
        oComs[index].SetFocus();
    end
    else
    begin
        CustomSetFocus(oComs, index + 1);
    end;
end;

//=========================================================
// 数字チェック
//=========================================================
function IsNumeric(value: String): Boolean;
var
    c : char;
    i : Integer;
begin
    result := false;

    if (value = '') then
    begin
        Exit;
    end;

    for i := 1 to Length(value) do
    begin
        c := value[i];
        if not CharInSet(c,['0'..'9']) then
        begin
            Exit;
        end;
    end;
    result := true;
end;

//=========================================================
// 「0」チェック
//=========================================================
function IsZero(value: String): Boolean;
var
    c : char;
    i,j : Integer;
begin
    result := false;

    if (value = '') then
    begin
        Exit;
    end;

    j := 0;
    for i := 1 to Length(value) do
    begin
        c := value[i];
        if (c = '0') then
        begin
            Inc(j);
        end;
    end;

    result := j = Length(value);
end;

//=========================================================
// 「0」除外
//=========================================================
function ToZeroExclude(value: String; option: ZeroOption = zoZeroPad): String;
var
    c : char;
    i,j : Integer;
begin
    if (value = '') then
    begin
        result := value;
        Exit;
    end;

    j := 0;
    for i := 1 to Length(value) do
    begin
        c := value[i];
        if (c <> '0') then
        begin
            j := i;
            break;
        end;
    end;

    if (j <> 0) then
    begin
        result := Copy(value, j, Length(value));
    end
    else
    begin
        result := value;
    end;
end;

//<180> ADD St
//=========================================================
// 引数のコンポーネント(子も含む)のEnabledに一括でセットする
//=========================================================
procedure CustomSetEnabled(pControl : TWinControl; value : Boolean);
var
    i       : Integer;
    oCon    : TControl;
begin

    if (Assigned(pControl)) then
    begin
        pControl.Enabled := value;
    end
    else
    begin
        Exit;
    end;
    // 子コントロールの処理
    for i := 0 to pControl.ControlCount -1 do
    begin
        oCon := pControl.Controls[i];
        if oCon is TWinControl then
        begin
            CustomSetEnabled(TWinControl(oCon), value);
        end
        else
        begin
            oCon.Enabled := value;
        end;
    end;
end;
//<180> ADD Ed

//<GAIKA> ADD St
//===============================================
// 概要：CodeListに存在する名称を返値
//===============================================
function GetCodeListByName(code: Integer; list: array of CodeList): String;
var
    i : Integer;
begin
    result := '';

    for i := Low(list) to High(list) do
    begin
        if (code = list[i].iCode) then
        begin
            result := list[i].sName;
            break;
        end;
    end;
end;
//<GAIKA> ADD Ed

//===============================================
// 概要：コンストラクタ
//===============================================
constructor TComponentController.Create(
    oLbl: TMLabel;
    oNumEdit: TMNumEdit;
    oCodeLists: array of CodeList;
    iValue: Extended);
var
    idx : Integer;
begin
    inherited Create();

    moLbl       := oLbl;
    moNumEdit   := oNumEdit;

    // 定数配列のセット
    SetLength(moCodeLists, Length(oCodeLists));
    moNumEdit.SelectItems.Clear();
    for idx := Low(moCodeLists) to High(moCodeLists) do
    begin
        moCodeLists[idx].iCode := oCodeLists[idx].iCode;
        moCodeLists[idx].sName := oCodeLists[idx].sName;
        moNumEdit.SelectItems.Add(
            IntToStr(moCodeLists[idx].iCode) + ':' + moCodeLists[idx].sName);
    end;

    // イベントと関連付ける
    moNumEdit.OnChange  := ComChange;
    moNumEdit.OnExit    := ComExit;

    // 初期化
    moNumEdit.Value := iValue;
    moNumEdit.OnChange(moNumEdit);
end;

//===============================================
// 概要：Changeイベント
//===============================================
procedure TComponentController.ComChange(Sender: TObject);
var
	i	:	Integer;
//    oEvent : TNotifyEvent;  //<180> ADD
begin

	// 入力値に応じて名称を変更
    moLbl.Caption	:=	'';
	for i := Low(moCodeLists) to High(moCodeLists) do
    begin
		if moNumEdit.Value = moCodeLists[i].iCode then
        begin
        	moLbl.Caption	:=	moCodeLists[i].sName;
            Exit;
        end;
    end;

//<180> ADD St
    for i := Low(moChangeEvents) to High(moChangeEvents) do
    begin
        moChangeEvents[i](moNumEdit);
{
        oEvent := moChangeEvents[i];
        oEvent(moNumEdit);
}
    end;
//<180> ADD Ed
end;

//===============================================
// 概要：Exitイベント
//===============================================
procedure TComponentController.ComExit(Sender: TObject);
begin

end;

//<Account> ADD Ed

procedure TComponentController.SetChangeEvent(
  pEvents: array of TNotifyEvent);
var
    i : integer;
begin
    SetLength(moChangeEvents, Length(pEvents));
    for i := Low(pEvents) to High(pEvents) do
    begin
        moChangeEvents[i] := pEvents[i];
    end;
end;

procedure TComponentController.SetExitEvent(
  pEvents: ArrayNotifyEvent);
begin
    moExitEvents := pEvents;
end;

procedure TComponentController.Change;
begin
    ComChange(moNumEdit);
end;

procedure TComponentController.Exit;
begin
    ComExit(moNumEdit);
end;

end.
