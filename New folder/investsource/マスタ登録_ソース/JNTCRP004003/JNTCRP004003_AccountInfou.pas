//==============================================================================
// 口座振替関連定義ユニット
//==============================================================================
unit JNTCRP004003_AccountInfou;

interface
uses
  Windows, Messages, SysUtils, Classes,  VCL.Controls,contnrs,
  FireDAC.Comp.Client, Db, CommCtrl, MJSQuery,MJSDispCtrl, JNTCRP004003_Commonu;

const
    FREEFLD_COUNT = 5;

    TABLENAME_ACCCSINFO = 'CRD_KOUZAFURIKAE_CSINFO';

    AccNames_Account : array[0..3] of CodeList =(
      (iCode : 1; sName : '普通'),     // <Account_1> MOD
      (iCode : 2; sName : '当座'),     // <Account_1> MOD
      (iCode : 4; sName : '貯蓄'),     // <Account_1> MOD
      (iCode : 9; sName : 'その他'));

    CsAccNames_Account : array[0..3] of CodeList =(
      (iCode : 1; sName : '普通'),
      (iCode : 2; sName : '当座'),
      (iCode : 3; sName : '納税準備'), // <Account_1> MOD
      (iCode : 9; sName : 'その他'));

    MSG_ACCINFO = '口座振替NOは２件以上の登録は出来ません。'+#13#10+
        '口座振替NO %s の情報を破棄して、口座振替NO %s の情報を登録しますか？';

type
  // 口座振替情報クラス
  TAccountInfo = class
    private
      FKoufuriNo       : Integer;
      FKoufuriName       : string;
      FAllBkCode        : Integer;
      FAllBraCode       : Integer;
      FBankName         : string;
      FBranchName    : string;
      FAccKbn           : Integer;
      FAccNo            : string;
    public
      class function SelectSQL():string;
      class function GetAccName(iAccKbn : Integer) : String;
      property KoufuriNo : Integer read FKoufuriNo write FKoufuriNo;
      property KoufuriName : string read FKoufuriName write FKoufuriName;
      property AllBkCode : Integer read FAllBkCode write FAllBkCode;
      property AllBraCode : Integer read FAllBraCode write FAllBraCode;
      property BankName : string read FBankName write FBankName;
      property BranchName : string read FBranchName write FBranchName;
      property AccKbn : Integer read FAccKbn write FAccKbn;
      property AccNo : string read FAccNo write FAccNo;
  end;

  // 口座振替情報リストクラス
  TAccountInfoList = class(TObjectList)
    private
      function Get(Index : Integer): TAccountInfo;
      procedure Put(Index : Integer; const Value : TAccountInfo);
    public
      constructor Create(); overload;
      constructor Create(qry : TMQuery); overload;
      property Items[Index : integer] : TAccountInfo read Get write Put; default;
      function GetAccountInfo(koufuriNo : Integer): TAccountInfo;
  end;

  // 口座振替取引先情報クラス
  TAccountCustomerInfo = class
    private
      FCSNCode          : Extended;
      FKoufuriNo       : Integer;
      FUserCode       : string;
      FUserName      : string;
      FAllBkCode        : Integer;
      FAllBraCode       : Integer;
      FBankName         : string;
      FBranchName    : string;
      FAccKbn           : Integer;
      FAccNo            : string;
      FFreeFlds         : array[0..9] of string;
      FUpdDateTM        : TDateTime;
      FInsDateTM        : TDateTime;
      FUpdLoginID       : string;
      moReference     : TReference;
      function GetFreeFlds(index: Integer): String;
      procedure SetFreeFlds(index: Integer; value : String);
    public
      class function SelectSQL():string;
      class function SelectSQLList():string;
      class function GetData(
          qry : TMQuery;
          pCSNCode : Extended;
          pKoufuriNo : Integer = -1) : TAccountCustomerInfo;
      class function GetAccName(iAccKbn : Integer) : String;
      constructor Create();
      procedure SetReference(var oReference : TReference);
      //function Equals(oAccCsInfo : TAccountCustomerInfo): Boolean;
      function Equals2(oAccCsInfo : TAccountCustomerInfo): Boolean;

      property AccName[Index:Integer] : String  read GetAccName;
      function Update(qry : TMQuery):Boolean;
      function Delete(qry : TMQuery):Boolean;
      property CSNCode : Extended read FCSNCode write FCSNCode;
      property KoufuriNo : Integer read FKoufuriNo write FKoufuriNo;
      property UserCode : string read FUserCode write FUserCode;
      property UserName : string read FUserName write FUserName;
      property AllBkCode : Integer read FAllBkCode write FAllBkCode;
      property AllBraCode : Integer read FAllBraCode write FAllBraCode;
      property BankName : string read FBankName write FBankName;
      property BranchName : string read FBranchName write FBranchName;
      property AccKbn : Integer read FAccKbn write FAccKbn;
      property AccNo : string read FAccNo write FAccNo;
      property FreeFlds[index : Integer] : String
          read GetFreeFlds write SetFreeFlds;
      property UpdDateTM : TDateTime read FUpdDateTM write FUpdDateTM;
      property InsDateTM : TDateTime read FInsDateTM write FInsDateTM;
      property UpdLoginID : string read FUpdLoginID write FUpdLoginID;
  end;


implementation

//========================================
// SQL文取得
//========================================
class function TAccountInfo.SelectSQL():string;
begin
    result := ' Select KoufuriNo ' +
        Format(' ,ISNULL(KoufuriName, %s) AS KoufuriName ', [QuotedStr('')]) +
        ' ,AllBkCode ' +
        ' ,AllBraCode ' +
        ' ,BankName ' +
        ' ,BranchName ' +
        ' ,AccKbn ' +
        ' ,AccNo ' +
        ' From CRD_KOUZAFURIKAEM ' +
        ' Order by KoufuriNo';
end;

//========================================
//  預金種目名取得
//========================================
class function TAccountInfo.GetAccName(iAcckbn : Integer) : String;
var
    idx : Integer;
begin
    result := '';

    for idx := Low(AccNames_Account) to High(AccNames_Account) do
    begin
        if (iAcckbn = AccNames_Account[idx].iCode) then
        begin
            result := AccNames_Account[idx].sName;
            break;
        end;
    end;
end;

//========================================
// オブジェクトリストのコンストラクタ
//========================================
constructor TAccountInfoList.Create();
begin
    inherited Create();
end;
//========================================
// オブジェクトリストのコンストラクタ
//========================================
constructor TAccountInfoList.Create(qry : TMQuery);
var
    oAccInfo : TAccountInfo;
begin
    inherited Create();
    try
        qry.SQL.Clear();
        qry.SQL.Add(TAccountInfo.SelectSQL());

        qry.Open();

        while (qry.EOF = false) do
        begin
            oAccInfo := TAccountInfo.Create();
            with qry, oAccInfo do
            begin
                KoufuriNo   := GetFld('KoufuriNo').AsInteger;
                KoufuriName := GetFld('KoufuriName').AsString;
                AllBkCode   := StrToIntDef(GetFld('AllBkCode').AsString, 0);
                AllBraCode  := StrToIntDef(GetFld('AllBraCode').AsString, 0);
                BankName    := GetFld('BankName').AsString;
                BranchName  := GetFld('BranchName').AsString;
                AccKbn      := GetFld('AccKbn').AsInteger;
                AccNo       := GetFld('AccNo').AsString;
            end;
            Self.Add(oAccInfo);
            qry.Next();
        end;
    finally
        qry.Close();
    end;
end;
//
// キャストして返却
//
function TAccountInfoList.GetAccountInfo(koufuriNo : integer) : TAccountInfo;
var
    idx : Integer;
    oAccInfo : TAccountInfo;
begin
    result := nil;
    for idx := 0 to Self.Count -1 do
    begin
        oAccInfo := TAccountInfo(inherited Get(idx));
        if oAccInfo.KoufuriNo = koufuriNo then
        begin
            result := oAccInfo;
            break;
        end;
    end;
end;

// キャストして返却
//
function TAccountInfoList.Get(Index : integer) : TAccountInfo;
begin
    result := TAccountInfo(inherited Get(Index));
end;

//
// 該当インデックスへセット
//
procedure TAccountInfoList.Put(Index : integer; const Value : TAccountInfo);
begin
    inherited Put(Index, Value);
end;

//========================================
// 口座振替取引先情報クラスののコンストラクタ
//========================================
constructor TAccountCustomerInfo.Create();
begin
    inherited Create();
end;

function TAccountCustomerInfo.GetFreeFlds(index : integer) : String;
begin
    result := FFreeFlds[index];
end;

procedure TAccountCustomerInfo.SetFreeFlds(index: Integer; value : String);
begin
    FFreeFlds[index] := value;
end;

//========================================
// SQL文取得(1レコード)
//========================================
class function TAccountCustomerInfo.SelectSQL():string;
begin
    result :=
        ' Select CSNCode ' +
        '        ,KoufuriNo ' +
        '        ,UserCode ' +
        Format(' ,ISNULL(UserName, %s) AS UserName ', [QuotedStr('')]) +
        Format(' ,ISNULL(AllBkCode, %s) AS AllBkCode ', [QuotedStr('')]) +
        Format(' ,ISNULL(AllBraCode, %s) AS AllBraCode ', [QuotedStr('')]) +
        Format(' ,ISNULL(BankName, %s) AS BankName ', [QuotedStr('')]) +
        Format(' ,ISNULL(BranchName, %s) AS BranchName ', [QuotedStr('')]) +
        '        ,ISNULL(AccKbn,0) AS AccKbn' +
        Format(' ,ISNULL(AccNo, %s) AS AccNo ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld1, %s) AS FreeFld1 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld2, %s) AS FreeFld2 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld3, %s) AS FreeFld3 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld4, %s) AS FreeFld4 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld5, %s) AS FreeFld5 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld6, %s) AS FreeFld6 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld7, %s) AS FreeFld7 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld8, %s) AS FreeFld8 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld9, %s) AS FreeFld9 ', [QuotedStr('')]) +
        Format(' ,ISNULL(FreeFld10, %s) AS FreeFld10 ', [QuotedStr('')]) +
        '        ,UpdDateTM ' +
        '        ,InsDateTM ' +
        Format(' ,ISNULL(UpdLoginID, %s) AS UpdLoginID ', [QuotedStr('')]) +
        Format(' From %s ', [TABLENAME_ACCCSINFO]) +
        ' Where CSNCode = :CSNCode ';

end;

//========================================
// SQL文取得(印刷用)
//========================================
class function TAccountCustomerInfo.SelectSQLList():string;
begin
    result :=
        ' SELECT ' +
        '     MA.GCode, ' +
        '     MA.Nm AS LongName, ' +
        '     ACC.KoufuriNo, ' +
        '     ACC.KoufuriName, ' +
        '     ACC.AccKbn, ' +
        '     ACC.BankName, ' +
        '     ACC.BranchName, ' +
        '     ACC.AccNo, ' +
        '     CS.UserCode, ' +
        '     CS.UserName, ' +
        '     CS.AllBkCode, ' +
        '     CS.AllBraCode, ' +
        '     CS.AccKbn AS CsAccKbn, ' +
        '     CS.AccNo AS CsAccNo, ' +
        '     CS.BankName AS CsBankName, ' +
        '     CS.BranchName AS CsBranchName, ' +
        '     CS.FreeFld1, ' +
        '     CS.FreeFld2, ' +
        '     CS.FreeFld3, ' +
        '     CS.FreeFld4, ' +
        '     CS.FreeFld5, ' +
        '     CS.FreeFld6, ' +
        '     CS.FreeFld7, ' +
        '     CS.FreeFld8, ' +
        '     CS.FreeFld9, ' +
        '     CS.FreeFld10 ' +
        ' FROM ' +
        '     CRD_KOUZAFURIKAE_CSINFO AS CS ' +
        '     INNER JOIN ' +
        '     CRD_KOUZAFURIKAEM AS ACC ON ' +
        '     CS.KoufuriNo = ACC.KoufuriNo ' +
        '     INNER JOIN ' +
        '     MTokui AS MA ON ' +
        '     CS.CSNCode = MA.NCode ' +
        ' WHERE ' +
        '     MA.RDelKbn = 0 ';
end;

//========================================
// 口座振替情報のインスタンス取得
//========================================
class function TAccountCustomerInfo.GetData(
    qry : TMQuery;
    pCSNCode : Extended;
    pKoufuriNo : Integer = -1
    ) : TAccountCustomerInfo;
var
    oAccCsInfo : TAccountCustomerInfo;
    idx : Integer;
begin
    result := nil;
    oAccCsInfo := TAccountCustomerInfo.Create();
    try
        oAccCsInfo.CSNCode := pCSNCode;
        oAccCsInfo.KoufuriNo := pKoufuriNo;

        qry.SQL.Clear();
        qry.SQL.Add(SelectSQL());

        qry.SetFld('CSNCode').AsString := FormatFloat('0',pCSNCode);

        if pKoufuriNo <> -1 then
        begin
            qry.SQL.Add(' And KoufuriNo = :KoufuriNo');
            qry.SetFld('KoufuriNo').AsInteger := pKoufuriNo;
        end;

        qry.Open();

        if (qry.EOF = false) then
        begin
            with qry, oAccCsInfo do
            begin
                KoufuriNo   := GetFld('KoufuriNo').AsInteger;
                UserCode    := GetFld('UserCode').AsString;
                UserName    := GetFld('UserName').AsString;
                AllBkCode   := StrToIntDef(GetFld('AllBkCode').AsString, 0);
                AllBraCode  := StrToIntDef(GetFld('AllBraCode').AsString, 0);
                BankName    := GetFld('BankName').AsString;
                BranchName  := GetFld('BranchName').AsString;
                AccKbn      := GetFld('AccKbn').AsInteger;
                AccNo       := GetFld('AccNo').AsString;

                for idx := 0 to 9 do
                begin
                    FreeFlds[idx] := GetFld(
                        Format('FreeFld%s', [IntToStr(idx + 1)])).AsString;
                end;

                UpdDateTM       := GetFld('UpdDateTM').AsDateTime;
                InsDateTM       := GetFld('InsDateTM').AsDateTime;
                UpdLoginID      := GetFld('UpdLoginID').AsString;
            end;

            result := oAccCsInfo;
        end;
    finally
        qry.Close();
    end;
end;

//========================================
// 更新処理
//========================================
function TAccountCustomerInfo.Update(qry : TMQuery):Boolean;
var
    bNewFlg : Boolean;
    bRet : Boolean;
    idx : Integer;
begin
    bRet := False;

    try
        qry.SQL.Clear();
        qry.SQL.Add(Format(SelectSQL(), [TABLENAME_ACCCSINFO]));
        qry.SQL.Add(' And KoufuriNo = :KoufuriNo');

        qry.SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);
        qry.SetFld('KoufuriNo').AsInteger := KoufuriNo;

        bRet := qry.Open();

        if (bRet = false) then
        begin
            result := bRet;
            Exit;
        end;

        bNewFlg := qry.EOF;

        qry.Close();
        qry.SQL.Clear();

        with qry do
        begin
            if bNewFlg then
            begin
                SQL.Add(Format(' Insert Into  %s (CSNCode ', [TABLENAME_ACCCSINFO]));
                SQL.Add(' ,KoufuriNo');
                SQL.Add(' ,UserCode');
                SQL.Add(' ,UserName');
                SQL.Add(' ,AllBkCode');
                SQL.Add(' ,AllBraCode');
                SQL.Add(' ,BankName');
                SQL.Add(' ,BranchName');
                SQL.Add(' ,AccKbn');
                SQL.Add(' ,AccNo');
                for idx := 1 to 10 do
                begin
                    SQL.Add(Format(' ,FreeFld%s', [IntToStr(idx)]));
                end;
                SQL.Add(' ,UpdDateTM');
                SQL.Add(' ,UpdLoginID');
                SQL.Add(' ) Values( :CSNCode');
                SQL.Add(' ,:KoufuriNo');
                SQL.Add(' ,:UserCode');
                SQL.Add(' ,:UserName');
                SQL.Add(' ,:AllBkCode');
                SQL.Add(' ,:AllBraCode');
                SQL.Add(' ,:BankName');
                SQL.Add(' ,:BranchName');
                SQL.Add(' ,:AccKbn');
                SQL.Add(' ,:AccNo');
                for idx := 1 to 10 do
                begin
                    SQL.Add(Format(' ,:FreeFld%s', [IntToStr(idx)]));
                end;
                SQL.Add(' ,:UpdDateTM');
                SQL.Add(' ,:UpdLoginID');
                SQL.Add(' )');
            end
            else
            begin
                SQL.Add(Format(' Update %s ', [TABLENAME_ACCCSINFO]));
                SQL.Add(' SET UserCode = :UserCode ');
                SQL.Add('    ,UserName = :UserName ');
                SQL.Add('    ,AllBkCode = :AllBkCode ');
                SQL.Add('    ,AllBraCode = :AllBraCode ');
                SQL.Add('    ,BankName = :BankName ');
                SQL.Add('    ,BranchName = :BranchName ');
                SQL.Add('    ,AccKbn = :AccKbn ');
                SQL.Add('    ,AccNo = :AccNo ');
                for idx := 1 to 10 do
                begin
                    SQL.Add(Format(' ,FreeFld%s = :FreeFld%s',
                        [IntToStr(idx), IntToStr(idx)]));
                end;
                SQL.Add('    ,UpdDateTM = :UpdDateTM ');
                SQL.Add('    ,UpdLoginID = :UpdLoginID ');
                SQL.Add(' WHERE CSNCode = :CSNCode ');
                SQL.Add('       AND KoufuriNo = :KoufuriNo ');
            end;

            SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);
            SetFld('KoufuriNo').AsInteger := KoufuriNo;
            SetFld('UserCode').AsString := UserCode;
            SetFld('UserName').AsString := UserName;
            SetFld('AllBkCode').AsString := Format('%.4d',[AllBkCode]);
            SetFld('AllBraCode').AsString := Format('%.3d',[AllBraCode]);
            SetFld('BankName').AsString := BankName;
            SetFld('BranchName').AsString := BranchName;
            SetFld('AccKbn').AsString := IntToStr(AccKbn);
            SetFld('AccNo').AsString := AccNo;
            for idx := 1 to 10 do
            begin
                SetFld(Format('FreeFld%s', [IntToStr(idx)])).AsString := FreeFlds[idx -1];
            end;
            SetFld('UpdDateTM').AsDateTime := UpdDateTM;
            SetFld('UpdLoginID').AsString := UpdLoginID;

            bRet := ExecSQL();

            if (bRet = false) then
            begin
                result := bRet;
                Exit;
            end;
        end;
    finally
        qry.Close();
        result := bRet;
    end;
end;

//========================================
// 削除処理
//========================================
function TAccountCustomerInfo.Delete(qry : TMQuery):Boolean;
var
    bRet : Boolean;
begin
    bRet := true;
    try
        with qry do
        begin
            SQL.Clear();
            SQL.Add(Format(' DELETE %s ', [TABLENAME_ACCCSINFO]));
            SQL.Add(' WHERE CSNCode = :CSNCode');

            SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);

            if (KoufuriNo <> -1) then
            begin
                SQL.Add(' AND KoufuriNo = :KoufuriNo');
                SetFld('KoufuriNo').AsInteger := KoufuriNo;
            end;

            bRet := ExecSQL();
            if (bRet = false) then
            begin
                moReference.PrsShowMessage(
                    '口座振替情報の削除に失敗しました。',
                    '口座振替情報',
                    mjError, mjOk, mjDefOk);
            end;
        end;
    finally
        qry.Close();
        result := bRet;
    end;
end;

//========================================
//  預金種目名取得
//========================================
class function TAccountCustomerInfo.GetAccName(iAcckbn : Integer) : String;
var
    idx : Integer;
begin
    result := '';

    for idx := Low(CsAccNames_Account) to High(CsAccNames_Account) do
    begin
        if (iAcckbn = CsAccNames_Account[idx].iCode) then
        begin
            result := CsAccNames_Account[idx].sName;
            break;
        end;
    end;
end;

//========================================
//  参照用オブジェクトを保持
//========================================
procedure TAccountCustomerInfo.SetReference(var oReference : TReference);
begin
    moReference := oReference;
end;

//========================================
//  比較判定
//========================================
//function TAccountCustomerInfo.Equals(oAccCsInfo : TAccountCustomerInfo): Boolean;
function TAccountCustomerInfo.Equals2(oAccCsInfo : TAccountCustomerInfo): Boolean;
begin
    result :=
        ((FKoufuriNo = oAccCsInfo.KoufuriNo) and
        (FBankName = oAccCsInfo.BankName) and
        (FBranchName = oAccCsInfo.BranchName) and
        (FUserCode = oAccCsInfo.UserCode) and
        (FUserName = oAccCsInfo.UserName) and
        (FAllBkCode = oAccCsInfo.AllBkCode) and
        (FAllBraCode = oAccCsInfo.AllBraCode) and
        (FAccNo = oAccCsInfo.AccNo));
end;

end.
