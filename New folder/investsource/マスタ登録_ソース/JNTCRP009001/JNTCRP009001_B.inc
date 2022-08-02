//*************************************************************************
//  System      :   科目登録
//  Program     :	JNTCRP009001専用リスト
//  ProgramID   :	JNTCRP009001_B.inc
//  Name        :   H.Endo
//  Create      :	2003/11/10
//  Comment     :   XXXX注意事項等XXXXXXXXXXXXX
//              :   XXXXXXXXXXXXXXXXXXXXXXXXX
//  History     :   2000/99/99  X.Xxxxxx
//              :   XXXXXXXX更新内容XXXXXXX
//*************************************************************************

//**************************************************************************
//  Proccess    :   TCollectionの最大Index取得
//				:	（動的配列のHighにあたる処理）
//  Name        :   H.ADACHI
//  Date        :	2002/10/02
//  Parameter   :	Collection	TCollectionｸﾗｽのｵﾌﾞｼﾞｪｸﾄ
//  Return      :	最大Index
//  History     :   2000/99/99  X.Xxxxxx
//              :   XXXXXXXX修正内容
//**************************************************************************
function GetHigh(Collection: TCollection): Integer;
begin
	Result := Collection.Count - 1;
end;


{名称}

constructor TNameList.Create;
begin
	inherited Create(TNameItem);
end;

function TNameList.GetItem(Index: Integer): TNameItem;
begin
	Result := TNameItem(inherited GetItem(Index));
end;

procedure TNameList.SetItem(Index: Integer; const Value: TNameItem);
begin
	inherited SetItem(Index, Value);
end;

