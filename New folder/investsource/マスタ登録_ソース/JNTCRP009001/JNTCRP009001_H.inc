//*************************************************************************
//  System      :   科目登録
//  Program     :	JNTCRP009001専用リスト
//  ProgramID   :	JNTCRP009001_H.inc
//  Name        :   H.Endo
//  Create      :	2003/11/10
//  Comment     :   XXXX注意事項等XXXXXXXXXXXXX
//              :   XXXXXXXXXXXXXXXXXXXXXXXXX
//  History     :   2000/99/99  X.Xxxxxx
//              :   XXXXXXXX更新内容XXXXXXX
//*************************************************************************

function GetHigh(Collection: TCollection): Integer;

type
  // 名称ﾘｽﾄ
  TNameItem = class(TCollectionItem)
  public
	IndexNo		: Integer;
	No			: Integer;
	Name		: String;
  end;

  TNameList = class(TCollection)
  private
	function GetItem(Index: Integer): TNameItem;
	procedure SetItem(Index: Integer; const Value: TNameItem);
  public
	constructor Create;
	property Items[Index: Integer]: TNameItem read GetItem write SetItem; default;
  end;
