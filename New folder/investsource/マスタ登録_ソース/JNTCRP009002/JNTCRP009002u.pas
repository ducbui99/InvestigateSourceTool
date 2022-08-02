//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：各科目登録
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：高橋 功二(LEAD)
//      作成日      ：2005.01.25(TUE)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <!!!>   高橋 功二(LEAD) 2005.04.08(FRI) 仕様確認後修正予定
//  <   >   高橋 功二(LEAD) 2005.04.22(FRI) FX-STYLEﾗｲﾌﾞﾗﾘ対応
//
//=============================================================================
unit JNTCRP009002u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  JNTMasComu, MjsDBModuleu, MjsDispCtrl,

  JNTCRP009002_1u,  // 資金繰科目
  JNTCRP009002_2u,  // ﾀｲﾄﾙ科目
  JNTCRP009002_3u,  // 要約BS科目
  JNTCRP009002_4u,  // 要約PL科目
  JNTCRP009002_5u;  // 固定変動科目

type
{$include ActionInterface.inc}


  TJNTCRP009002f = class(TForm)
  private
	{ Private 宣言 }
  public
	{ Public 宣言 }
  end;

var
  JNTCRP009002f: TJNTCRP009002f;

function AppEntry(pParam:Pointer) : Integer;

exports
	AppEntry;

implementation

{$R *.DFM}

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pParam: Pointer): Integer;
var
	pMyForm1    :	^TJNTCRP009002_1f;
	pMyForm2    :	^TJNTCRP009002_2f;
	pMyForm3    :	^TJNTCRP009002_3f;
	pMyForm4    :	^TJNTCRP009002_4f;
	pMyForm5    :	^TJNTCRP009002_5f;
	pRec        :	^TMjsAppRecord;
	giPara	    :	Integer;
    stPara	    :   String;
begin

	Result  :=  ACTID_RET_OK;
	pRec	:=  Pointer(TAppParam(pParam^).pRecord);
    stPara	:=  pRec.m_sParameter;

    if ( stPara = '' ) then
		stPara  :=  '0';

	giPara	:=  StrToInt(stPara);

	case TAppParam(pParam^).iAction of
        // ﾌｫｰﾑの作成要求（作成のみ）
		ACTID_FORMCREATESTART:
		begin
			pMyForm1 := nil;
			pMyForm2 := nil;
			pMyForm3 := nil;
			pMyForm4 := nil;
			pMyForm5 := nil;

			case giPara of
			0:	new (pMyForm1);
			1:	new (pMyForm2);
			2:	new (pMyForm3);
			3:	new (pMyForm4);
			4:	new (pMyForm5);
            end;

			try
				case giPara of
    				0:	pMyForm1^ := TJNTCRP009002_1f.CreateForm(pParam);
    				1:	pMyForm2^ := TJNTCRP009002_2f.CreateForm(pParam);
    				2:	pMyForm3^ := TJNTCRP009002_3f.CreateForm(pParam);
    				3:	pMyForm4^ := TJNTCRP009002_4f.CreateForm(pParam);
    				4:	pMyForm5^ := TJNTCRP009002_5f.CreateForm(pParam);
                end;

				case giPara of
    				0:	pRec^.m_pChildForm := pMyForm1;
    				1:	pRec^.m_pChildForm := pMyForm2;
    				2:	pRec^.m_pChildForm := pMyForm3;
    				3:	pRec^.m_pChildForm := pMyForm4;
    				4:	pRec^.m_pChildForm := pMyForm5;
				end;
			except
				case giPara of
    				0:	Dispose(pMyForm1);
    				1:	Dispose(pMyForm2);
    				2:	Dispose(pMyForm3);
    				3:	Dispose(pMyForm4);
    				4:	Dispose(pMyForm5);
                end;

				Result := ACTID_RET_NG;
			end;
		end;
        // ﾌｫｰﾑの作成要求（作成&表示）
		ACTID_FORMCREATESHOWSTART:
		begin
			pMyForm1 := nil;
			pMyForm2 := nil;
			pMyForm3 := nil;
			pMyForm4 := nil;
			pMyForm5 := nil;

			case giPara of
			    0:	new (pMyForm1);
    			1:	new (pMyForm2);
    			2:	new (pMyForm3);
    			3:	new (pMyForm4);
    			4:	new (pMyForm5);
            end;

			try
				case giPara of
					0:
					begin
						pMyForm1^ := TJNTCRP009002_1f.CreateForm(pRec);
						pMyForm1^.Show;
						pRec^.m_pChildForm := pMyForm1;
					end;
					1:
					begin
						pMyForm2^ := TJNTCRP009002_2f.CreateForm(pRec);
						pMyForm2^.Show;
						pRec^.m_pChildForm := pMyForm2;
					end;
					2:
					begin
						pMyForm3^ := TJNTCRP009002_3f.CreateForm(pRec);
						pMyForm3^.Show;
						pRec^.m_pChildForm := pMyForm3;
					end;
					3:
					begin
						pMyForm4^ := TJNTCRP009002_4f.CreateForm(pRec);
						pMyForm4^.Show;
						pRec^.m_pChildForm := pMyForm4;
					end;
					4:
					begin
						pMyForm5^ := TJNTCRP009002_5f.CreateForm(pRec);
						pMyForm5^.Show;
						pRec^.m_pChildForm := pMyForm5;
					end;
				end;
			except
				case giPara of
				    0:	Dispose(pMyForm1);
    				1:	Dispose(pMyForm2);
    				2:	Dispose(pMyForm3);
    				3:	Dispose(pMyForm4);
    				4:	Dispose(pMyForm5);
                end;

				Result := ACTID_RET_NG;
			end;
		end;
        // ﾌｫｰﾑの解放要求
		ACTID_FORMCLOSESTART:
		begin
			pMyForm1 := nil;
			pMyForm2 := nil;
			pMyForm3 := nil;
			pMyForm4 := nil;
			pMyForm5 := nil;

			case giPara of
				0:
				begin
					pMyForm1 := Pointer(pRec^.m_pChildForm);
					pMyForm1^.Close;
					pMyForm1^.Free;
				end;
				1:
				begin
					pMyForm2 := Pointer(pRec^.m_pChildForm);
					pMyForm2^.Close;
					pMyForm2^.Free;
				end;
				2:
				begin
					pMyForm3 := Pointer(pRec^.m_pChildForm);
					pMyForm3^.Close;
					pMyForm3^.Free;
				end;
				3:
				begin
					pMyForm4 := Pointer(pRec^.m_pChildForm);
					pMyForm4^.Close;
					pMyForm4^.Free;
				end;
				4:
				begin
					pMyForm5 := Pointer(pRec^.m_pChildForm);
					pMyForm5^.Close;
					pMyForm5^.Free;
				end;
			end;

			case giPara of
    			0:	Dispose(pMyForm1);
    			1:	Dispose(pMyForm2);
    			2:	Dispose(pMyForm3);
    			3:	Dispose(pMyForm4);
    			4:	Dispose(pMyForm5);
            end;
		end;
        // ﾌｫｰﾑの解放直前要求
		ACTID_FORMCANCLOSESTART:
		begin
			case giPara of
				0:
				begin
					pMyForm1 := Pointer(pRec^.m_pChildForm);
					if ( pMyForm1^.CloseQuery = False ) then
						result := ACTID_RET_NG;
				end;
				1:
				begin
					pMyForm2 := Pointer(pRec^.m_pChildForm);
					if ( pMyForm2^.CloseQuery = False ) then
						result := ACTID_RET_NG;
				end;
				2:
				begin
					pMyForm3 := Pointer(pRec^.m_pChildForm);
					if ( pMyForm3^.CloseQuery = False ) then
						result := ACTID_RET_NG;
				end;
				3:
				begin
					pMyForm4 := Pointer(pRec^.m_pChildForm);
					if ( pMyForm4^.CloseQuery = False ) then
						result := ACTID_RET_NG;
				end;
				4:
				begin
					pMyForm5 := Pointer(pRec^.m_pChildForm);
					if ( pMyForm5^.CloseQuery = False ) then
						result := ACTID_RET_NG;
				end;
			end;
		end;
        // ﾌｫｰﾑの表示要求
		ACTID_SHOWSTART:
		begin
			case giPara of
				0:
				begin
					pMyForm1 := Pointer(pRec^.m_pChildForm);
					pMyForm1^.Show;
				end;
				1:
				begin
					pMyForm2 := Pointer(pRec^.m_pChildForm);
					pMyForm2^.Show;
				end;
				2:
				begin
					pMyForm3 := Pointer(pRec^.m_pChildForm);
					pMyForm3^.Show;
				end;
				3:
				begin
					pMyForm4 := Pointer(pRec^.m_pChildForm);
					pMyForm4^.Show;
				end;
				4:
				begin
					pMyForm5 := Pointer(pRec^.m_pChildForm);
					pMyForm5^.Show;
				end;
			end;
		end;

		ACTID_HIDESTART:
		begin
			case giPara of
				0:
				begin
					pMyForm1 := Pointer( pRec^.m_pChildForm );
					if ( pMyForm1^.Parent <> nil ) then
					begin
						pMyForm1^.Hide;
					end;
				end;
				1:
				begin
					pMyForm2 := Pointer( pRec^.m_pChildForm );
					if ( pMyForm2^.Parent <> nil ) then
					begin
						pMyForm2^.Hide;
					end;
				end;
				2:
				begin
					pMyForm3 := Pointer( pRec^.m_pChildForm );
					if ( pMyForm3^.Parent <> nil ) then
					begin
						pMyForm3^.Hide;
					end;
				end;
				3:
				begin
					pMyForm4 := Pointer( pRec^.m_pChildForm );
					if ( pMyForm4^.Parent <> nil ) then
					begin
						pMyForm4^.Hide;
					end;
				end;
				4:
				begin
					pMyForm5 := Pointer( pRec^.m_pChildForm );
					if ( pMyForm5^.Parent <> nil ) then
					begin
						pMyForm5^.Hide;
					end;
				end;
			end;
		end;
	end;

end;

end.

