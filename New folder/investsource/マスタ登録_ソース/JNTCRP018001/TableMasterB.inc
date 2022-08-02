//******************************************************************************
//  System      : Galileopt
//  Program     : 
//  ProgramID   : 
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <   >   小川(LEAD)   2012/06/21      新規作成
//
//******************************************************************************

{$IFNDEF __TableMasterB_INC__}
{$DEFINE __TableMasterB_INC__}

// -----------------------------------------------------------------------------
//  FusenInfoのファクトリメソッド
// -----------------------------------------------------------------------------
class function TMFusenInfo.CreateFusenInfo() : TMFusenInfo;
begin
    result := TMFusenInfo.Create();
end;

// -----------------------------------------------------------------------------
//  FusenInfoのファクトリメソッド
// -----------------------------------------------------------------------------
class function TMFusenInfo.CreateFusenInfo(Qry : TMQuery; pMasterKbn : integer; pNCode : Extended; pSubNCode : Extended; pFusenKbn : integer) : TMFusenInfo;
var
	wkFusenInfo : TMFusenInfo;
begin

	result := nil;
	
	try

		with Qry do
		begin
			Close();
			SQL.Clear();
			SQL.ADD('Select Top 1 FusenCmnt From MFusenInfo Where ');
			SQL.ADD(' MasterKbn = :MasterKbn AND ');
			SQL.ADD(' NCode = :NCode AND ');
			SQL.ADD(' SubNCode = :SubNCode ');
			
			if (pFusenKbn <> 0) then
				SQL.ADD(' AND FusenKbn = :FusenKbn ');
			
			SetFld('MasterKbn').AsInteger := pMasterkbn;
			SetFld('NCode').AsString := FormatFloat('0',pNCode);
			SetFld('SubNCode').AsString := FormatFloat('0',pSubNCode);
			
			if (pFusenKbn <> 0) then
				SetFld('FusenKbn').AsInteger := pFusenKbn;
			
			if Open() = false then
			begin
				Exit;
			end;

			if (EOF = false) then
			begin
				wkFusenInfo := CreateFusenInfo();
				wkFusenInfo.MasterKbn := pMasterKbn;
				wkFusenInfo.NCode := pNCode;
				wkFusenInfo.SubNCode := pSubNCode;
				wkFusenInfo.FusenKbn := pFusenKbn;
				wkFusenInfo.FusenCmnt := GetFld('FusenCmnt').AsString;
			end
			else
				Exit;
		end;
	
	finally
		Qry.Close();
	end;

    result := wkFusenInfo;
end;

{$ENDIF}	// __TableMasterB_INC__
