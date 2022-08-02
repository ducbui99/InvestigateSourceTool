//==============================================================================
// 電子債権管理定義ユニット
//==============================================================================
unit JNTCRP004003_DensaiInfou;

interface
uses
  Windows, Messages, SysUtils, Classes,  VCL.Controls,
  FireDAC.Comp.Client, Db, CommCtrl, MJSQuery,MJSDispCtrl, JNTCRP004003_Commonu;
//<DENSHI> ADD St

const
    DenshiNames : array[0..1] of CodeList =(
        (iCode : 1; sName : 'でんさい'),
        (iCode : 2; sName : 'ＪＥＭＣＯ電手'));

    AccNames_Densai : array[0..2] of CodeList =(
        (iCode : 1; sName : '普通'),
        (iCode : 2; sName : '当座'),
        (iCode : 9; sName : 'その他'));

    MSG_DENINFO = '%sが変更されていますが、更新されていません。'+#13#10+
                    '更新しますか？'+#13#10+
                    '※電子債権データ種別を切り替えると変更が反映されません。';

type


  // 電子債権取引先情報クラス
  TDensaiInfo = class
    private
      FCSNCode          : Extended;
      FDenDataKbn       : Integer;
      FDenUserID1       : string;
      FDenUserID2       : string;
      FDenUserName      : string;
      FDenCSKanaName    : string;
      FAllBkCode        : Integer;
      FAllBraCode       : Integer;
      FBankName         : string;
      FAccKbn           : Integer;
      FAccNo            : string;
      FMatchingKey      : string;
      FUpdDateTM        : TDateTime;
      FInsDateTM        : TDateTime;
      FUpdLoginID       : string;
      moReference       : TReference;
      procedure CreateMatchingKey();
    public
      class function SelectSQL():string;
      class function SelectSQLList():string;
      class function CreateObject(qry : TMQuery;pCSNCode : Extended; pDenDataKbn : Integer; pDenUserID1 : string) : TDensaiInfo;
      class function GetAccName(Index : Integer) : String;
      procedure SetReference(var oReference : TReference);
      //function Equals(oDensaiInfo : TDensaiInfo; pDenDataKbn : Integer): Boolean;
      function Equals1(oDensaiInfo : TDensaiInfo; pDenDataKbn : Integer): Boolean;

      property AccName[Index:Integer] : String  read GetAccName;
      function Update(qry : TMQuery):Boolean;
      function Delete(qry : TMQuery):Boolean;
      property CSNCode : Extended read FCSNCode write FCSNCode;
      property DenDataKbn : Integer read FDenDataKbn write FDenDataKbn;
      property DenUserID1 : string read FDenUserID1 write FDenUserID1;
      property DenUserID2 : string read FDenUserID2 write FDenUserID2;
      property DenUserName : string read FDenUserName write FDenUserName;
      property DenCSKanaName : string read FDenCSKanaName write FDenCSKanaName;
      property AllBkCode : Integer read FAllBkCode write FAllBkCode;
      property AllBraCode : Integer read FAllBraCode write FAllBraCode;
      property BankName : string read FBankName write FBankName;
      property AccKbn : Integer read FAccKbn write FAccKbn;
      property AccNo : string read FAccNo write FAccNo;
      property MatchingKey : string read FMatchingKey write FMatchingKey;
      property UpdDateTM : TDateTime read FUpdDateTM write FUpdDateTM;
      property InsDateTM : TDateTime read FInsDateTM write FInsDateTM;
      property UpdLoginID : string read FUpdLoginID write FUpdLoginID;
  end;
//<DENSHI> ADD Ed

implementation

//========================================
// SQL文取得(1レコード)
//========================================
class function TDensaiInfo.SelectSQL():string;
begin
    result :=   ' Select CSNCode ' +
                '        ,DenDataKbn ' +
                '        ,DenUserID1 ' +
                '        ,ISNULL(DenUserID2,' + QuotedStr('') + ') AS DenUserID2 ' +
                '        ,ISNULL(DenUserName,' + QuotedStr('') + ') AS DenUserName ' +
                '        ,ISNULL(DenCSKanaName,' + QuotedStr('') + ') AS DenCSKanaName ' +
                '        ,ISNULL(AllBkCode,' + QuotedStr('') + ') AS AllBkCode ' +
                '        ,ISNULL(AllBraCode,' + QuotedStr('') + ') AS AllBraCode ' +
                '        ,ISNULL(BankName,' + QuotedStr('') + ') AS BankName' +
                '        ,ISNULL(AccKbn,0) AS AccKbn' +
                '        ,ISNULL(AccNo,' + QuotedStr('') + ') AS AccNo' +
                '        ,ISNULL(MatchingKey,' + QuotedStr('') + ') AS MatchingKey' +
                '        ,UpdDateTM ' +
                '        ,InsDateTM ' +
                '        ,ISNULL(UpdLoginID,' + QuotedStr('') + ') AS UpdLoginID' +
                ' From CRD_DENSHISAIKEN_CSINFO ' +
                ' Where CSNCode = :CSNCode ' +
                '       AND DenDataKbn = :DenDataKbn ';
end;

//========================================
// SQL文取得(印刷用)
//========================================
class function TDensaiInfo.SelectSQLList():string;
begin
    result :=   ' SELECT ' +
                '            MA.GCode, ' +
                '            MA.Nm As LongName, ' +
                '            INFO.DenDataKbn, ' +
                '            INFO.DenUserID1, ' +
                '            ISNULL(INFO.DenUserID2,' + QuotedStr('') + ') AS DenUserID2, ' +
                '            ISNULL(INFO.DenUserName,' + QuotedStr('') + ') AS DenUserName, ' +
                '            ISNULL(INFO.DenCSKanaName,' + QuotedStr('') + ') AS DenCSKanaName, ' +
                '            ISNULL(INFO.AllBkCode,' + QuotedStr('') + ') AS AllBkCode, ' +
                '            ISNULL(INFO.AllBraCode,' + QuotedStr('') + ') AS AllBraCode, ' +
                '            ISNULL(INFO.BankName,' + QuotedStr('') + ') AS BankName, ' +
                '            ISNULL(INFO.AccKbn,0) AS AccKbn, ' +
                '            ISNULL(INFO.AccNo,' + QuotedStr('') + ') AS AccNo, ' +
                '            ISNULL(INFO.MatchingKey,' + QuotedStr('') + ') AS MatchingKey ' +
                '        FROM ' +
                '            CRD_DENSHISAIKEN_CSINFO INFO ' +
                '            Inner JOIN ' +
                '            MTokui MA ON ' +
                '            INFO.CSNCode = MA.NCode ' +
                '        WHERE ' +
                '            MA.SumKbn = 0 And MA.RDelKbn = 0 ' +
                '            And MA.TemplateKbn = 0           ';
end;

//========================================
// 電子記録債権情報のインスタンス取得
//========================================
class function TDensaiInfo.CreateObject(qry : TMQuery;pCSNCode : Extended; pDenDataKbn : Integer; pDenUserID1 : string) : TDensaiInfo;
var
    densaiInfo : TDensaiInfo;
begin
    densaiInfo := nil;
    try
        densaiInfo := TDensaiInfo.Create();

        densaiInfo.CSNCode := pCSNCode;
        densaiInfo.DenDataKbn := pDenDataKbn;
        densaiInfo.DenUserID1 := pDenUserID1;

        qry.SQL.Clear();
        qry.SQL.Add(SelectSQL());

        if (pDenUserID1 <> '') then
        begin
            qry.SQL.Add(' AND DenUserID1 = :DenUserID1');
            qry.SetFld('DenUserID1').AsString := pDenUserID1;
        end;

        qry.SetFld('CSNCode').AsString := FormatFloat('0',pCSNCode);
        qry.SetFld('DenDataKbn').AsInteger := pDenDataKbn;

        qry.Open();

        if (qry.EOF = false) then
        begin
            with qry, densaiInfo do
            begin
                DenUserID2      := GetFld('DenUserID2').AsString;
                DenUserName     := GetFld('DenUserName').AsString;
                DenCSKanaName   := GetFld('DenCSKanaName').AsString;
                AllBkCode       := StrToIntDef(GetFld('AllBkCode').AsString, 0);
                AllBraCode      := StrToIntDef(GetFld('AllBraCode').AsString, 0);
                BankName        := GetFld('BankName').AsString;
                AccKbn          := GetFld('AccKbn').AsInteger;
                AccNo           := GetFld('AccNo').AsString;
                MatchingKey     := GetFld('MatchingKey').AsString;
                UpdDateTM       := GetFld('UpdDateTM').AsDateTime;
                InsDateTM       := GetFld('InsDateTM').AsDateTime;
                UpdLoginID      := GetFld('UpdLoginID').AsString;
            end;
        end;
    finally
        qry.Close();

        result := densaiInfo;
    end;
end;

//========================================
// 更新処理
//========================================
function TDensaiInfo.Update(qry : TMQuery):Boolean;
var
    bNewFlg : Boolean;
    bRet : Boolean;
begin
    bRet := False;

    try
        // マッチングキー生成
        CreateMatchingKey();

        qry.SQL.Clear();
        qry.SQL.Add(SelectSQL());

        if (DenUserID1 <> '') then
        begin
            qry.SQL.Add(' AND DenUserID1 = :DenUserID1');
            qry.SetFld('DenUserID1').AsString := DenUserID1;
        end;

        qry.SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);
        qry.SetFld('DenDataKbn').AsInteger := DenDataKbn;
        qry.SetFld('DenUserID1').AsString := DenUserID1;

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
                SQL.Add(' Insert Into  CRD_DENSHISAIKEN_CSINFO (CSNCode ');
                SQL.Add(' ,DenDataKbn');
                SQL.Add(' ,DenUserID1');
                SQL.Add(' ,DenUserID2');
                SQL.Add(' ,DenUserName');
                SQL.Add(' ,DenCSKanaName');
                SQL.Add(' ,AllBkCode');
                SQL.Add(' ,AllBraCode');
                SQL.Add(' ,BankName');
                SQL.Add(' ,AccKbn');
                SQL.Add(' ,AccNo');
                SQL.Add(' ,MatchingKey');
                SQL.Add(' ,UpdDateTM');
                SQL.Add(' ,UpdLoginID');
                SQL.Add(' ) Values( :CSNCode');
                SQL.Add(' ,:DenDataKbn');
                SQL.Add(' ,:DenUserID1');
                SQL.Add(' ,:DenUserID2');
                SQL.Add(' ,:DenUserName');
                SQL.Add(' ,:DenCSKanaName');
                SQL.Add(' ,:AllBkCode');
                SQL.Add(' ,:AllBraCode');
                SQL.Add(' ,:BankName');
                SQL.Add(' ,:AccKbn');
                SQL.Add(' ,:AccNo');
                SQL.Add(' ,:MatchingKey');
                SQL.Add(' ,:UpdDateTM');
                SQL.Add(' ,:UpdLoginID');
                SQL.Add(' )');
            end
            else
            begin
                SQL.Add(' Update CRD_DENSHISAIKEN_CSINFO ');
                SQL.Add(' SET DenUserID2 = :DenUserID2 ');
                SQL.Add('    ,DenUserName = :DenUserName ');
                SQL.Add('    ,DenCSKanaName = :DenCSKanaName ');
                SQL.Add('    ,AllBkCode = :AllBkCode ');
                SQL.Add('    ,AllBraCode = :AllBraCode ');
                SQL.Add('    ,BankName = :BankName ');
                SQL.Add('    ,AccKbn = :AccKbn ');
                SQL.Add('    ,AccNo = :AccNo ');
                SQL.Add('    ,MatchingKey = :MatchingKey ');
                SQL.Add('    ,UpdDateTM = :UpdDateTM ');
                SQL.Add('    ,UpdLoginID = :UpdLoginID ');
                SQL.Add(' WHERE CSNCode = :CSNCode ');
                SQL.Add('       AND DenDataKbn = :DenDataKbn ');
                SQL.Add('       AND DenUserID1 = :DenUserID1 ');
            end;

            SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);
            SetFld('DenDataKbn').AsInteger := DenDataKbn;
            SetFld('DenUserID1').AsString := DenUserID1;
            SetFld('DenUserID2').AsString := DenUserID2;
            SetFld('DenUserName').AsString := DenUserName;
            SetFld('DenCSKanaName').AsString := DenCSKanaName;
            SetFld('AllBkCode').AsString := IfThen(DenDataKbn = DENKBN_DENSAI, Format('%.4d',[AllBkCode]), '');
            SetFld('AllBraCode').AsString := IfThen(DenDataKbn = DENKBN_DENSAI, Format('%.3d',[AllBraCode]), '');
            SetFld('BankName').AsString := BankName;
//<187> MOD St
//            SetFld('AccKbn').AsString := IntToStr(AccKbn);
            SetFld('AccKbn').AsString := IfThen(DenDataKbn = DENKBN_DENSAI, IntToStr(AccKbn), '');
//<187> MOD Ed
            SetFld('AccNo').AsString := AccNo;
            SetFld('MatchingKey').AsString := MatchingKey;
            SetFld('UpdDateTM').AsDateTime := UpdDateTM;
            SetFld('UpdLoginID').AsString := UpdLoginID;

            bRet := ExecSQL();

            if (bRet = false) then
            begin
                moReference.PrsShowMessage('更新に失敗しました。','更新エラー',mjError,mjOK,mjDefOK);
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
function TDensaiInfo.Delete(qry : TMQuery):Boolean;
var
    bRet : Boolean;
begin
    bRet := true;
    try
        with qry do
        begin
            SQL.Clear();
            SQL.Add(' DELETE CRD_DENSHISAIKEN_CSINFO ');
            SQL.Add(' WHERE CSNCode = :CSNCode');

            SetFld('CSNCode').AsString := FormatFloat('0',CSNCode);

            if (DenDataKbn <> -1) then
            begin
                SQL.Add(' AND DenDataKbn = :DenDataKbn');
                SetFld('DenDataKbn').AsInteger := DenDataKbn;
            end;

            if (DenUserID1 <> '') then
            begin
                SQL.Add(' AND DenUserID1 = :DenUserID1');
                SetFld('DenUserID1').AsString := DenUserID1;
            end;

            bRet := ExecSQL();

            if (bRet = false) then
            begin
                moReference.PrsShowMessage('削除に失敗しました。','電子記録債権情報削除',
                    mjError,mjOk,mjDefOk);
            end;
        end;
    finally
        qry.Close();
        result := bRet;
    end;
end;

//============================
// マッチングキーの作成
//============================
procedure TDensaiInfo.CreateMatchingKey();
var
    iAllBkCode : Integer;
    iAllBraCode : Integer;
begin
    case DenDataKbn of
        // でんさいネット
        DENKBN_DENSAI   :
        begin
            iAllBkCode  := AllBkCode;
            iAllBraCode := AllBraCode;

            MatchingKey :=  Format('%.4d',[iAllBkCode]) + '-' +     // 全銀ｺｰﾄﾞ
                            Format('%.3d',[iAllBraCode]) + '-' +    // 支店ｺｰﾄﾞ
                            IntToStr(Acckbn) + '-' +                // 預金種目ｺｰﾄﾞ
                            AccNo;                                  // 口座番号
        end;
        // JEMCO
        DENKBN_JEMCO    :
        begin
            MatchingKey := DenUserID1;                              // お客様番号(4桁)
        end;
    end;
end;

//========================================
//  預金種目名取得
//========================================
class function TDensaiInfo.GetAccName(Index : Integer) : String;
var
    idx : Integer;
begin
    result := '';

    for idx := Low(AccNames_Densai) to High(AccNames_Densai) do
    begin
        if (Index = AccNames_Densai[idx].iCode) then
        begin
            result := AccNames_Densai[idx].sName;
            break;
        end;
    end;
end;

//========================================
//  参照用オブジェクトを保持
//========================================
procedure TDensaiInfo.SetReference(var oReference : TReference);
begin
    moReference := oReference;
end;

//========================================
//  比較判定
//========================================
//function TDensaiInfo.Equals(oDensaiInfo : TDensaiInfo; pDenDataKbn : Integer): Boolean;
function TDensaiInfo.Equals1(oDensaiInfo : TDensaiInfo; pDenDataKbn : Integer): Boolean;
begin
    result := true;

    case pDenDataKbn of
        DENKBN_DENSAI   :
        begin
            result :=
                ((FDenUserID1 = oDensaiInfo.DenUserID1) and
                (FDenUserName = oDensaiInfo.DenUserName) and
                (FDenCSKanaName = oDensaiInfo.DenCSKanaName) and
                (FAllBkCode = oDensaiInfo.AllBkCode) and
                (FAllBraCode = oDensaiInfo.AllBraCode) and
                (FAccKbn = oDensaiInfo.AccKbn) and
                (FAccNo = oDensaiInfo.AccNo));
        end;
        DENKBN_JEMCO    :
        begin
            result :=
                ((FDenUserID1 = oDensaiInfo.DenUserID1) and
                (FDenUserID2 = oDensaiInfo.DenUserID2));
        end;
    end
end;

end.
