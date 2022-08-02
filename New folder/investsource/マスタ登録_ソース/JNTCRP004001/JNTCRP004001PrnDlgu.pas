//************************************************************************
//*
//*     Systeme         :   工事情報登録
//*     Program         :   印刷選択ダイアログ
//*     ProgramID       :   MAS230100DLG
//*     Name            :   N.Nabe
//*     Create          :   2000/09/25
//*     Comment         :   XXXXXXXXXXXXXXXXXXXXXX
//*     History         :   XXXX/XX/XX  XX修正者XX（所属）
//*                         XXXXXXXXXX更新内容XXXXXXXXXX
//*                         2005/01/13  T.Shimada
//*                         高解像度対応。
//*                         Form修正：コンボのParentFontをTrueに設定。
//*
//************************************************************************
unit JNTCRP004001PrnDlgu;

interface
  {$I MasCommonFuncH.inc}

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, MJSEdits, MJSLabel, Buttons, MJSBitBtn, MJSGroupBox, VCL.ExtCtrls,
  MJSPanel, MJSComboBox, JNTMasWndIFu, JNTMasComu, MjsDBModuleu,
  Db, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl, MJSRadioButton, MJSCommonu;

type
  TJNTCRP004001PrnDlgf = class(TForm)
	P_Panel		:	TMPanel;
	PHani		:	TMGroupBox;
	LStart		:	TMLabel;
	LEnd		:	TMLabel;
	LStartDsp	: TMLabel;
	LEndDsp		:	TMLabel;
	LKara		:	TMLabel;
	LMade		:	TMLabel;
	GOutPutOrder: TMGroupBox;
	BR_Code: TMRadioButton;
	BR_Rensou: TMRadioButton;
	EStartTxt: TMTxtEdit;
	EEndTxt: TMTxtEdit;
	LKeishiki: TMLabel;
	EChouhyou: TMComboBox;
	EStartNum: TMNumEdit;
	EEndNum: TMNumEdit;
	BOK: TMBitBtn;
	BCancel: TMBitBtn;
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
	procedure FormKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure EStartTxtArrowClick(Sender: TObject);
	procedure EEndTxtArrowClick(Sender: TObject);
	procedure EStartTxtExit(Sender: TObject);
	procedure EEndTxtExit(Sender: TObject);
	procedure BOKClick(Sender: TObject);
	procedure EChouhyouChange(Sender: TObject);
	procedure EEndNumArrowClick(Sender: TObject);
	procedure EStartNumArrowClick(Sender: TObject);
	procedure EStartNumExit(Sender: TObject);
	procedure EEndNumExit(Sender: TObject);
	procedure ComboSet();

  private
	{ Private 宣言 }
	giOrder			:	Integer;	//	選択された順序(ｺｰﾄﾞ順:CODEORDER、連想順:RENSOUORDER)
	giWorkCombo		:	Integer;	//	Comboの選択されているIndexを退避
	giDigit			:	Integer;
	giAttr			:	Integer;
	gsNameJ			:	String;
	gsNameG			:	String;
  public
	{ Public 宣言 }
	MDataModule		:	TMDataModulef;
	dbCorp_Select	:	TFDConnection;
	pComArea		:	^TMjsAppRecord;
	ComArea			:	TJNTMASCom;
	m_pSystemArea	:	^rcSYSTEMAREA;	// MJSｼｽﾃﾑｴﾘｱ

	function DLG(var StartCode: String; var EndCode: String;
			  	 var Select: Integer; m_pRec: pointer; var Order: Integer;
				 Digit : Integer; Attr : Integer; NameJ: String; NameG: String):Integer;
	function GetName(Code: String; var RCode: String; var SimpName: String; Flg : Integer): Boolean;

  end;

implementation
  {$I MasCommonFuncB.inc}

const
	JITUZAIKANI		=	1;		//	実在簡易
	JITUZAISHOSAI	=	2;		//	実在詳細
	GOUKEIKANI		=	3;		//	合計簡易
	GOUKEISHOSAI	=	4;		//	合計詳細

	CODEORDER		=	1;		//	ｺｰﾄﾞ順
	RENSOUORDER		=	2;		//	連想順

{$R *.DFM}

//**************************************************************************
//	Proccess  	:  	アプリケーションからのパラメータセット
//	Name	  	:  	H.Endo（企業ｼｽﾃﾑ企画設計）
//	Date		:  	2000/05/01
//	Parameter  	:	StartCode	:	開始ｺｰﾄﾞ
//					EndCode		:	終了ｺｰﾄﾞ
//					Select		:	帳票選択
//					SelectJitsu	:	細目科目時の実在ｺｰﾄﾞ
//					m_pRec		:	TMjsAppRecordのﾎﾟﾝﾀ
//					Order		:	順序
//	Retrun	  	:	正常（１）／ｷｬﾝｾﾙ（２）
//	History	　	:
//**************************************************************************
function TJNTCRP004001PrnDlgf.DLG(var StartCode: String; var EndCode: String;
								var Select: Integer; m_pRec: pointer; var Order: Integer;
								 Digit : Integer; Attr : Integer; NameJ: String; NameG: String):Integer;
var
	iReturn		:	Integer;
	strFormat	:	String;
begin
	pComArea	:=	m_pRec;
	ComArea		:=	TJNTMASCom( pComArea^.m_pSystemArea^ );

	MjsColorChange(	TJNTCRP004001PrnDlgf ( Self ),
					TJNTMASCom ( pComArea^.m_pSystemArea^ ).SystemArea.SysColorB,
					TJNTMASCom ( pComArea^.m_pSystemArea^ ).SystemArea.SysColorD,
					TJNTMASCom ( pComArea^.m_pSystemArea^ ).SystemArea.SysBaseColorB,
					TJNTMASCom ( pComArea^.m_pSystemArea^ ).SystemArea.SysBaseColorD,
					rcCOMMONAREA(pComArea^.m_pCommonArea^).SysFocusColor	);
//↓2005/01/13 T.Shimada
    MjsFontResize(TJNTCRP004001PrnDlgf(Self), Pointer(m_pRec));
//↑

	MasAccelCharCancel(Self);

	giOrder		:=	0;
	giWorkCombo	:=	99;		//	ComboのIndexに存在しない番号を初期値設定
	giDigit		:=	Digit;
	giAttr		:=	Attr;
	gsNameJ		:=	NameJ;
	gsNameG		:=	NameG;
	
	ComboSet();

	if	(giAttr <= 1) then												// ｺｰﾄﾞ属性: 数字
	begin
		EStartTxt.Visible	:= False;
		EStartNum.Visible	:= True;
		EEndTxt.Visible		:= False;
		EEndNum.Visible		:= True;

		if	(giAttr = 1) then
			strFormat	:= StringOfChar ('0', giDigit)
		else
			strFormat	:= '';

		EStartNum.TabOrder	:= 0;
		EEndNum.TabOrder	:= 1;

		EStartNum.Digits	:= giDigit;
		EStartNum.FormatStr	:= strFormat;
		EStartNum.Value		:= 0;
		EEndNum.Digits		:= giDigit;
		EEndNum.FormatStr	:= strFormat;
		EEndNum.Value		:= 0;
	end
	else																			// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		EStartTxt.Visible	:= True;
		EStartNum.Visible	:= False;
		EEndTxt.Visible		:= True;
		EEndNum.Visible		:= False;

		EStartTxt.MaxLength := giDigit;
		EStartTxt.Text		:= '';
		EEndTxt.MaxLength 	:= giDigit;
		EEndTxt.Text		:= '';
	end;

	EChouhyou.ItemIndex	:=	0;	//	初期表示

	//  出力順序のCheckBoxのﾃﾞﾌｫﾙﾄ
	BR_Code.Checked	:=	True;	//	ｺｰﾄﾞ順

	iReturn := ShowModal;

	if (iReturn = idOK)then
	begin
		if	(giAttr <= 1) then												// ｺｰﾄﾞ属性: 数字
		begin
			if EStartNum.Value <> 0 then
				StartCode	:= Format ('%.10d', [Trunc (EStartNum.Value)])
			else
				StartCode	:= '';

			if EEndNum.Value <> 0 then
				EndCode	:= Format ('%.10d', [Trunc (EEndNum.Value)])
			else
				EndCode	:= '';
		end
		else
		begin
			StartCode	:=	EStartTxt.Text;
			EndCode		:=	EEndTxt.Text;
		end;

		case EChouhyou.ItemIndex of
			0:	Select	:=	JITUZAIKANI;	//	実在(簡略)
			1:	Select	:=	JITUZAISHOSAI;	//	実在(詳細)
			2:	Select	:=	GOUKEIKANI;		//	合計(簡略)
			3:	Select	:=	GOUKEISHOSAI;	//	合計(詳細)
		end;
		Order	:=	giOrder;						//	出力順序
	end;

	Result := iReturn;

end;

//************************************************************************
//*     Component       :   CMChildKey
//*
//*     Event           :
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.CMChildKey(var Msg: TWMKey);
begin
	if (Screen.Activecontrol is TMBitBtn) then
	begin
		if (Msg.CharCode = VK_LEFT) or (Msg.CharCode = VK_UP)then
		begin
			MjsDispCtrl.MjsPrevCtrl(Self);
			abort;
			Exit;
		end;

		if (Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_DOWN) then
		begin
			MjsDispCtrl.MjsNextCtrl(Self);
			abort;
			Exit;
		end;
	end;

	inherited;

end;

//************************************************************************
//*     Component       :   EStart ( TMNumEdit )
//*							検索エクスプローラを呼び出す(開始)
//*     Event           :   OnArrowClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EStartNumArrowClick(Sender: TObject);
var
	MasWndParam	:	TJNTMasWndParam;
	Wnd			:	TJNTMasWndIF;
	sCode		:	String;
	sWhere		:	String;
begin
   	Wnd := TJNTMasWndIF.Create();
//	Wnd.Init( pointer ( pComArea ) );

	if (EChouhyou.ItemIndex = 0) or (EChouhyou.ItemIndex = 1) then
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 0'
	else
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 1';

	MasWndParam					:=	TJNTMasWndParam.CreateParam();
	MasWndParam.m_iParamType	:=	0;
	MasWndParam.m_pApRec		:=	pointer( pComArea );
	MasWndParam.m_GcodeFD		:=	'GCode';
	MasWndParam.m_RenCharFD		:=	'RenChar';
	MasWndParam.m_SimpleNameFD	:=	'SimpleName';
	MasWndParam.m_TableName		:=	'HojyoMA';
	MasWndParam.m_SQL_Where		:=	sWhere;
	MasWndParam.m_iCodeLength	:=	giDigit;
	MasWndParam.m_iCodeAttr		:=	giAttr;
//   	MasWndParam.AttrSetMasterInfo( 51 );//　属性セット関数のコールm_iCodeLength, m_iCodeAttrの自動セット
   	MasWndParam.m_db			:=	dbCorp_Select;

//	Wnd := TMasWndIF.CreateDlgIF(rcCOMMONAREA(pComArea^.m_pCommonArea^).SysRoot + '\' + ComArea.SystemArea.SysPrefix + '\prg');
	if (Wnd.DoDlg(MasWndParam)) = mrOk then
	begin
		sCode				:=	MasWndParam.m_ExpRetCode;		//	ｺｰﾄﾞ
		if (sCode = '') then
			EStartNum.Value		:=	0
		else
			EStartNum.Value		:=	StrToInt64 (Trim (sCode));
		LStartDsp.Caption	:=	MasWndParam.m_ExpRetText;				//	名称
	end;

	Wnd.Free();
	MasWndParam.Free();

end;

//************************************************************************
//*     Component       :   EStart ( TMTxtEdit )
//*							検索エクスプローラを呼び出す(開始)
//*     Event           :   OnArrowClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EStartTxtArrowClick(Sender: TObject);
var
	MasWndParam	:	TJNTMasWndParam;
	Wnd			:	TJNTMasWndIF;
	sCode		:	String;
	sWhere		:	String;
begin
   	Wnd := TJNTMasWndIF.Create();
//	Wnd.Init( pointer ( pComArea ) );

	if (EChouhyou.ItemIndex = 0) or (EChouhyou.ItemIndex = 1) then
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 0'
	else
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 1';

	MasWndParam					:=	TJNTMasWndParam.CreateParam();
	MasWndParam.m_iParamType	:=	0;
	MasWndParam.m_pApRec		:=	pointer( pComArea );
	MasWndParam.m_GcodeFD		:=	'GCode';
	MasWndParam.m_RenCharFD		:=	'RenChar';
	MasWndParam.m_SimpleNameFD	:=	'SimpleName';
	MasWndParam.m_TableName		:=	'HojyoMA';
	MasWndParam.m_SQL_Where		:=	sWhere;
	MasWndParam.m_iCodeLength	:=	giDigit;
	MasWndParam.m_iCodeAttr		:=	giAttr;
//   	MasWndParam.AttrSetMasterInfo( 51 );//　属性セット関数のコールm_iCodeLength, m_iCodeAttrの自動セット
   	MasWndParam.m_db			:=	dbCorp_Select;

//	Wnd := TMasWndIF.CreateDlgIF(rcCOMMONAREA(pComArea^.m_pCommonArea^).SysRoot + '\' + ComArea.SystemArea.SysPrefix + '\prg');
	if (Wnd.DoDlg(MasWndParam)) = mrOk then
	begin
		sCode				:=	MasWndParam.m_ExpRetCode;		//	ｺｰﾄﾞ
		if (sCode = '') then
			EStartTxt.Text		:=	''
		else
			EStartTxt.Text		:=	sCode;
		LStartDsp.Caption	:=	MasWndParam.m_ExpRetText;				//	名称
	end;

	Wnd.Free();
	MasWndParam.Free();

end;

//************************************************************************
//*     Component       :   EEnd ( TMNumEdit )
//*							検索エクスプローラを呼び出す(開始)
//*     Event           :   OnArrowClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EEndNumArrowClick(Sender: TObject);
var
	MasWndParam	:	TJNTMasWndParam;
	Wnd			:	TJNTMasWndIF;
	sCode		:	String;
	sWhere		:	String;
begin
   	Wnd := TJNTMasWndIF.Create();
//	Wnd.Init( pointer ( pComArea ) );

	if (EChouhyou.ItemIndex = 0) or (EChouhyou.ItemIndex = 1) then
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 0'
	else
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 1';

	MasWndParam					:=	TJNTMasWndParam.CreateParam();
	MasWndParam.m_iParamType	:=	0;
	MasWndParam.m_pApRec		:=	pointer( pComArea );
	MasWndParam.m_GcodeFD		:=	'GCode';
	MasWndParam.m_RenCharFD		:=	'RenChar';
	MasWndParam.m_SimpleNameFD	:=	'SimpleName';
	MasWndParam.m_TableName		:=	'HojyoMA';
	MasWndParam.m_SQL_Where		:=	sWhere;
	MasWndParam.m_iCodeLength	:=	giDigit;
	MasWndParam.m_iCodeAttr		:=	giAttr;
//   	MasWndParam.AttrSetMasterInfo( 51 );//　属性セット関数のコールm_iCodeLength, m_iCodeAttrの自動セット
   	MasWndParam.m_db			:=	dbCorp_Select;

//	Wnd := TMasWndIF.CreateDlgIF(rcCOMMONAREA(pComArea^.m_pCommonArea^).SysRoot + '\' + ComArea.SystemArea.SysPrefix + '\prg');
	if (Wnd.DoDlg(MasWndParam)) = mrOk then
	begin
		sCode				:=	MasWndParam.m_ExpRetCode;		//	ｺｰﾄﾞ
		if (sCode = '') then
			EEndNum.Value		:=	0
		else
			EEndNum.Value		:=	StrToInt64 (Trim (sCode));
		LEndDsp.Caption	:=	MasWndParam.m_ExpRetText;				//	名称
	end;

	Wnd.Free();
	MasWndParam.Free();

end;


//************************************************************************
//*     Component       :   EEnd ( TMNumEdit )
//*							検索エクスプローラを呼び出す(終了)
//*     Event           :   OnArrowClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EEndTxtArrowClick(Sender: TObject);
var
	MasWndParam	:	TJNTMasWndParam;
	Wnd			:	TJNTMasWndIF;
	sCode		:	String;
	sWhere		:	String;
begin
   	Wnd := TJNTMasWndIF.Create();
//	Wnd.Init( pointer ( pComArea ) );

	if (EChouhyou.ItemIndex = 0) or (EChouhyou.ItemIndex = 1) then
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 0'
	else
		sWhere := 'MasterKbn = 51 and RecordKbn = 0 and SumKbn = 1';

	MasWndParam					:=	TJNTMasWndParam.CreateParam();
	MasWndParam.m_iParamType	:=	0;
	MasWndParam.m_pApRec		:=	pointer( pComArea );
	MasWndParam.m_GcodeFD		:=	'GCode';
	MasWndParam.m_RenCharFD		:=	'RenChar';
	MasWndParam.m_SimpleNameFD	:=	'SimpleName';
	MasWndParam.m_TableName		:=	'HojyoMA';
	MasWndParam.m_SQL_Where		:=	sWhere;
	MasWndParam.m_iCodeLength	:=	giDigit;
	MasWndParam.m_iCodeAttr		:=	giAttr;
//   	MasWndParam.AttrSetMasterInfo( 51 );//　属性セット関数のコールm_iCodeLength, m_iCodeAttrの自動セット
   	MasWndParam.m_db			:=	dbCorp_Select;

//	Wnd := TMasWndIF.CreateDlgIF(rcCOMMONAREA(pComArea^.m_pCommonArea^).SysRoot + '\' + ComArea.SystemArea.SysPrefix + '\prg');
	if (Wnd.DoDlg(MasWndParam)) = mrOk then
	begin
		sCode				:=	MasWndParam.m_ExpRetCode;		//	ｺｰﾄﾞ
		if (sCode = '') then
			EEndTxt.Text		:=	''
		else
			EEndTxt.Text		:=	sCode;
		LEndDsp.Caption		:=	MasWndParam.m_ExpRetText;				//	名称
	end;

	Wnd.Free();
	MasWndParam.Free();

end;

//************************************************************************
//*     Component       :   JNTCRP004001PrnDlgf ( TJNTCRP004001PrnDlgf )
//*							キーが押された時
//*     Event           :   OnKeyDown
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	sPartsName	:	String;
	bFlag		:	Boolean;
begin
	bFlag := False;

	//	ENTERｷｰが押された時
	if (Key = VK_RETURN) then
	begin
		sPartsName := Screen.ActiveControl.Name;
		if (sPartsName <> 'BOK') and (sPartsName <> 'BCancel')then
		begin
			MjsDispCtrl.MjsNextCtrl(Self)
		end;
	end;

	//	ESCAPEｷｰが押された時
	if (Key = VK_ESCAPE) then
	begin
		ModalResult := 2;
	end;

	//	範囲開始でｷｰを押された時
	if ((Screen.ActiveControl.Name = 'EStartNum') or
		(Screen.ActiveControl.Name = 'EStartTxt')) then
	begin
		if (ssAlt in Shift) then		//	Altが押されている時
			EXIT;

		if (Key = VK_Left) or (Key = VK_UP) then		//	左・上を押された時
			MjsDispCtrl.MjsPrevCtrl(Self);				//	前のｶﾗﾑに移動

		if (Key = VK_Right) or (Key = VK_DOWN) then		//	右・下を押された時
		begin
			MjsDispCtrl.MjsNextCtrl(Self);				//	次のｶﾗﾑに移動
			bFlag := True;
		end;
	end;

	//	範囲終了でｷｰを押された時
	if ((Screen.ActiveControl.Name = 'EEndNum') or
		(Screen.ActiveControl.Name = 'EEndTxt')) then
	begin
		if (ssAlt in Shift) then		//	Altが押されている時
			EXIT;

		if (Key = VK_Left) or (Key = VK_UP) then		//	左・上を押された時
			MjsDispCtrl.MjsPrevCtrl(Self);		//	前のｶﾗﾑに移動

		if ((Key = VK_Right) or (Key = VK_DOWN)) and (bFlag = False) then	//	右・下を押された時
			MjsDispCtrl.MjsNextCtrl(Self);		//	次のｶﾗﾑに移動
	end;
end;

//************************************************************************
//*     Component       :   EStartExit ( TMNumEdit )
//*
//*     Event           :   OnExit
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EStartTxtExit(Sender: TObject);
var
	iCode	:	String;
	iName	:	String;
begin
	iName	:=	'';
	if EStartTxt.Text <> '' then
	begin
		if (GetName(EStartTxt.Text,iCode,iName, 0)) then
		begin
			EStartTxt.Text		:=	iCode;
			LStartDsp.Caption	:=	iName;
		end
		else
		begin
			EStartTxt.SetFocus;
			abort;
		end;
	end
	else
	begin
		if (GetName(EStartTxt.Text,iCode,iName, 0)) then
		begin
			EStartTxt.Text		:=	iCode;
			LStartDsp.Caption	:=	iName;
		end
	end;
end;

//************************************************************************
//*     Component       :   EStartExit ( TMNumEdit )
//*
//*     Event           :   OnExit
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EStartNumExit(Sender: TObject);
var
	iCode	:	String;
	iName	:	String;
begin
	iName	:=	'';
	if EStartNum.Value <> 0 then
	begin
		if (GetName(Format ('%.10d', [Trunc (EStartNum.Value)]),iCode,iName, 0)) then
		begin
			EStartNum.Value		:=	StrToInt64(iCode);
			LStartDsp.Caption	:=	iName;
		end
		else
		begin
			EStartNum.SetFocus;
			abort;
		end;
	end
	else
	begin
		if EStartNum.InputFlag = False then
		begin
			if (GetName(Format ('%.10d', [Trunc (EStartNum.Value)]),iCode,iName, 0)) then
			begin
				EStartNum.Value		:=	StrToInt64(iCode);
				LStartDsp.Caption	:=	iName;
			end;
		end
		else
		begin
			if (GetName('',iCode,iName, 0)) then
			begin
				EStartNum.InputFlag	:=	False;
				EStartNum.Value		:=	StrToInt64(iCode);
				LStartDsp.Caption	:=	iName;
			end;
		end;
	end;
end;


//************************************************************************
//*     Component       :   EEnd ( TMNumEdit )
//*
//*     Event           :   OnExit
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EEndTxtExit(Sender: TObject);
var
	iCode	:	String;
	iName	:	String;
begin
	iName	:=	'';
	if EEndTxt.Text <> '' then									//	範囲終了に入力されていなかったら
	begin
		if EStartTxt.Text <> '' then							//	範囲開始に入力されていなかったら
		begin
			if (EEndTxt.Text) >= (EStartTxt.Text) then	//	開始より終了の方が多きかCheck
			begin
				if (GetName(EEndTxt.Text,iCode,iName, 1)) then
				begin
					EEndTxt.Text	:=	iCode;
					LEndDsp.Caption	:=	iName;
				end
				else
				begin
					EEndTxt.SetFocus;
					abort;
				end;
			end
			else
			begin
				EEndTxt.SetFocus;
				abort;
			end;
		end
		else
		begin
			if (GetName(EStartTxt.Text,iCode,iName, 0)) then
			begin
				EStartTxt.Text	:=	iCode;
				LStartDsp.Caption	:=	iName;
			end;

			if (GetName(EEndTxt.Text,iCode,iName, 1)) then
			begin
				EEndTxt.Text	:=	iCode;
				LEndDsp.Caption	:=	iName;
			end
			else
			begin
				EEndTxt.SetFocus;
				abort;
			end;
		end;
	end
	else
	begin
		if EStartTxt.Text = '' then							//	範囲開始に入力されていなかったら
		begin
			if (GetName(EStartTxt.Text,iCode,iName, 0)) then
			begin
				EStartTxt.Text	:=	iCode;
				LStartDsp.Caption	:=	iName;
			end;
		end;

		if (GetName(EEndTxt.Text,iCode,iName, 1)) then
		begin
			EEndTxt.Text	:=	iCode;
			LEndDsp.Caption	:=	iName;
		end;
	end;
end;

//************************************************************************
//*     Component       :   EEnd ( TMNumEdit )
//*
//*     Event           :   OnExit
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.EEndNumExit(Sender: TObject);
var
	iCode	:	String;
	iName	:	String;
begin
	iName	:=	'';
	if EEndNum.Value <> 0 then									//	範囲終了に入力されていなかったら
	begin
		if EStartNum.Value <> 0 then							//	範囲開始に入力されていなかったら
		begin
			if (EEndNum.Value) >= (EStartNum.Value) then		//	開始より終了の方が多きかCheck
			begin
				if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
				begin
					EEndNum.Value	:=	StrToInt64(iCode);
					LEndDsp.Caption	:=	iName;
				end
				else
				begin
					EEndNum.SetFocus;
					abort;
				end;
			end
			else
			begin
				EEndNum.SetFocus;
				abort;
			end;
		end
		else
		begin
			if EStartNum.InputFlag = False then
			begin
				if (GetName(Format ('%.10d', [Trunc (EStartNum.Value)]),iCode,iName, 0)) then
				begin
					EStartNum.Value	:=	StrToInt64(iCode);
					LStartDsp.Caption	:=	iName;
				end;
			end
			else
			begin
				if (GetName('',iCode,iName, 0)) then
				begin
					EStartNum.InputFlag	:=	False;
					EStartNum.Value	:=	StrToInt64(iCode);
					LStartDsp.Caption	:=	iName;
				end;
			end;

			if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
			begin
				EEndNum.Value	:=	StrToInt64(iCode);
				LEndDsp.Caption	:=	iName;
			end
			else
			begin
				EEndNum.SetFocus;
				abort;
			end;
		end;
	end
	else
	begin
		if (EStartNum.Value = 0) and (EStartNum.InputFlag = True) then	//	範囲開始に入力されていなかったら
		begin
			if (GetName('',iCode,iName, 0)) then
			begin
				EStartNum.InputFlag	:=	False;
				EStartNum.Value	:=	StrToInt64(iCode);
				LStartDsp.Caption	:=	iName;
			end;
		end;

		if EEndNum.InputFlag = False then
		begin
			if (EEndNum.Value) >= (EStartNum.Value) then		//	開始より終了の方が多きかCheck
			begin
				if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
				begin
					EEndNum.Value	:=	StrToInt64(iCode);
					LEndDsp.Caption	:=	iName;
				end
				else
				begin
					EEndNum.SetFocus;
					abort;
				end;
			end
			else
			begin
				EEndNum.SetFocus;
				abort;
			end;
		end
		else
		begin
			if (GetName('',iCode,iName, 1)) then
			begin
				EEndNum.InputFlag	:=	False;
				EEndNum.Value	:=	StrToInt64(iCode);
				LEndDsp.Caption	:=	iName;
			end;
		end;
	end;
end;


//**********************************************************************
//*		Proccess	:	名称取得
//*		Name		:	H.Endo
//*		Date		:	2000/10/23
//*		Parameter	:	Code		:	入力されたｺｰﾄﾞ
//*					:	Name		:	名称
//*		Return		:	ﾚｺｰﾄﾞがあるかないか(TRUE/FALSE)
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004001PrnDlgf.GetName(Code: String; var RCode: String; var SimpName: String; Flg : Integer): Boolean;
var
	DmqData		:	TMQuery;
	bRecord		:	Boolean;		//	ﾚｺｰﾄﾞあり/なし
begin
	//	初期化
	bRecord	:=	False;

	DmqData := TMQuery.Create( Self );							//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );		//	DBとMQueryの接続

	if Code <> '' then
	begin
		with DmqData do
		begin
			Close;
			SQL.Clear;
			SQL.ADD('SELECT '						);
			SQL.ADD(	'GCode, '					);	//	外部コード
			SQL.ADD(	'SimpleName '				);	//	簡略名称
			SQL.ADD('FROM '							);
			SQL.ADD(	'HojyoMA '					);
			SQL.ADD('WHERE '						);
			SQL.ADD(	'MasterKbn = 51 AND '		);
			SQL.ADD(	'RecordKbn = 0 AND '		);
			if (EChouhyou.ItemIndex	= 0) or
				(EChouhyou.ItemIndex = 1) then
				SQL.ADD(	'SumKbn = 0 AND'		)
			else
				SQL.ADD(	'SumKbn = 1 AND'		);
			SQL.ADD(	'GCode = :Code'				);
			ParamByName('Code'		).AsString	:=	Code;		//	外部ｺｰﾄﾞ
			Open;
			if ( EOF <> True ) then
			begin
				bRecord		:=	True;
				RCode		:=	GetFLD('GCode').AsString;
				SimpName	:=	GetFLD('SimpleName').AsString;
			end;
		end;
	end
	else
	begin
		with DmqData do
		begin
			Close;
			SQL.Clear;
			SQL.ADD('SELECT '						);
			SQL.ADD(	'GCode, '					);	//	外部コード
			SQL.ADD(	'SimpleName '				);	//	簡略名称
			SQL.ADD('FROM '							);
			SQL.ADD(	'HojyoMA '					);
			SQL.ADD('WHERE '						);
			SQL.ADD(	'MasterKbn = 51 AND '		);
			SQL.ADD(	'RecordKbn = 0 AND '		);
			if (EChouhyou.ItemIndex	= 0) or
				(EChouhyou.ItemIndex = 1) then
				SQL.ADD(	'SumKbn = 0'			)
			else
				SQL.ADD(	'SumKbn = 1'			);
			if Flg = 0 then
				SQL.ADD('Order by GCode ASC '		)
			else
				SQL.ADD('Order by GCode DESC '		);
			Open;
			if ( EOF <> True ) then
			begin
				bRecord		:=	True;
				RCode		:=	GetFLD('GCode').AsString;
				SimpName	:=	GetFLD('SimpleName').AsString;
			end;
		end;
	end;

	DmqData.Close;
	DmqData.Free;

	Result	:=	bRecord;
end;

//************************************************************************
//*     Component       :	BOK ( TMBitBtn )
//*							OKﾎﾞﾀﾝを押された時
//*     Event           :   OnClick
//*     Name            :   H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP004001PrnDlgf.BOKClick(Sender: TObject);
var
	iCode	:	String;
	iName	:	String;
begin
	if	(giAttr <= 1) then												// ｺｰﾄﾞ属性: 数字
	begin
		iName	:=	'';
		if EEndNum.Value <> 0 then									//	範囲終了に入力されていなかったら
		begin
			if EStartNum.Value <> 0 then							//	範囲開始に入力されていなかったら
			begin
				if (EEndNum.Value) >= (EStartNum.Value) then		//	開始より終了の方が多きかCheck
				begin
					if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
					begin
						EEndNum.Value	:=	StrToInt64(iCode);
						LEndDsp.Caption	:=	iName;
					end
					else
					begin
						EEndNum.SetFocus;
						abort;
					end;
				end
				else
				begin
					EEndNum.SetFocus;
					abort;
				end;
			end
			else
			begin
				if EStartNum.InputFlag = False then
				begin
					if (GetName(Format ('%.10d', [Trunc (EStartNum.Value)]),iCode,iName, 0)) then
					begin
						EStartNum.Value	:=	StrToInt64(iCode);
						LStartDsp.Caption	:=	iName;
					end;
				end
				else
				begin
					if (GetName('',iCode,iName, 0)) then
					begin
						EStartNum.InputFlag	:=	False;
						EStartNum.Value	:=	StrToInt64(iCode);
						LStartDsp.Caption	:=	iName;
					end;
				end;
	
				if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
				begin
					EEndNum.Value	:=	StrToInt64(iCode);
					LEndDsp.Caption	:=	iName;
				end
				else
				begin
					EEndNum.SetFocus;
					abort;
				end;
			end;
		end
		else
		begin
			if (EStartNum.Value = 0) and (EStartNum.InputFlag = True) then	//	範囲開始に入力されていなかったら
			begin
				if (GetName('',iCode,iName, 0)) then
				begin
					EStartNum.InputFlag	:=	False;
					EStartNum.Value	:=	StrToInt64(iCode);
					LStartDsp.Caption	:=	iName;
				end;
			end;
	
			if EEndNum.InputFlag = False then
			begin
				if (EEndNum.Value) >= (EStartNum.Value) then		//	開始より終了の方が多きかCheck
				begin
					if (GetName(Format ('%.10d', [Trunc (EEndNum.Value)]),iCode,iName, 1)) then
					begin
						EEndNum.Value	:=	StrToInt64(iCode);
						LEndDsp.Caption	:=	iName;
					end
					else
					begin
						EEndNum.SetFocus;
						abort;
					end;
				end
				else
				begin
					EEndNum.SetFocus;
					abort;
				end;
			end
			else
			begin
				if (GetName('',iCode,iName, 1)) then
				begin
					EEndNum.InputFlag	:=	False;
					EEndNum.Value	:=	StrToInt64(iCode);
					LEndDsp.Caption	:=	iName;
				end;
			end;
		end;
	end
	else
	begin
		iName	:=	'';
		if EEndTxt.Text <> '' then									//	範囲終了に入力されていなかったら
		begin
			if EStartTxt.Text <> '' then							//	範囲開始に入力されていなかったら
			begin
				if (EEndTxt.Text) >= (EStartTxt.Text) then	//	開始より終了の方が多きかCheck
				begin
					if (GetName(EEndTxt.Text,iCode,iName, 1)) then
					begin
						EEndTxt.Text	:=	iCode;
						LEndDsp.Caption	:=	iName;
					end
					else
					begin
						EEndTxt.SetFocus;
						abort;
					end;
				end
				else
				begin
					EEndTxt.SetFocus;
					abort;
				end;
			end
			else
			begin
				if (GetName(EStartTxt.Text,iCode,iName, 0)) then
				begin
					EStartTxt.Text	:=	iCode;
					LStartDsp.Caption	:=	iName;
				end;
	
				if (GetName(EEndTxt.Text,iCode,iName, 1)) then
				begin
					EEndTxt.Text	:=	iCode;
					LEndDsp.Caption	:=	iName;
				end
				else
				begin
					EEndTxt.SetFocus;
					abort;
				end;
			end;
		end
		else
		begin
			if EStartTxt.Text = '' then							//	範囲開始に入力されていなかったら
			begin
				if (GetName(EStartTxt.Text,iCode,iName, 0)) then
				begin
					EStartTxt.Text	:=	iCode;
					LStartDsp.Caption	:=	iName;
				end;
			end;
	
			if (GetName(EEndTxt.Text,iCode,iName, 1)) then
			begin
				EEndTxt.Text	:=	iCode;
				LEndDsp.Caption	:=	iName;
			end;
		end;
	end;

	if (BR_Code.Checked = True) then
		giOrder	:=	CODEORDER
	else
		giOrder	:=	RENSOUORDER;

	ModalResult := mrOk;
end;

procedure TJNTCRP004001PrnDlgf.EChouhyouChange(Sender: TObject);
begin
	if (giWorkCombo <> EChouhyou.ItemIndex) then	//	退避しているComboIndexNoと違ったら
	begin
		if (EChouhyou.ItemIndex = 4) then			//	Comboが科目体系を選択された時
		begin
			GOutPutOrder.Enabled	:=	False;
			BR_Code.Enabled			:=	False;
			BR_Rensou.Enabled		:=	False;
		end
		else
		begin
			GOutPutOrder.Enabled	:=	True;
			BR_Code.Enabled			:=	True;
			BR_Rensou.Enabled		:=	True;
		end;
		EStartTxt.Text		:=	'';
		EStartNum.Value		:=	0;
		EStartNum.InputFlag	:=	True;
		LStartDsp.Caption	:=	'';
		EEndTxt.Text		:=	'';
		EEndNum.Value		:=	0;
		EEndNum.InputFlag	:=	True;
		LEndDsp.Caption		:=	'';

	end;
end;

procedure TJNTCRP004001PrnDlgf.ComboSet();
begin
	EChouhyou.Items.Add (gsNameJ+'登録リスト(簡略)');
	EChouhyou.Items.Add (gsNameJ+'登録リスト(詳細)');
	EChouhyou.Items.Add (gsNameG+'登録リスト(簡略)');
	EChouhyou.Items.Add (gsNameG+'登録リスト(詳細)');
end;

end.
