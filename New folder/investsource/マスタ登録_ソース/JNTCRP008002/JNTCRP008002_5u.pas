//******************************************************************************
//  System      :   新会計システム 支払管理システム
//  Program     :   銀行情報登録（標準手数料設定）
//  ProgramID   :   Pay210100
//  Name        :   ？？？
//  Create      :   ？？？
//  Comment		:
//	History		:	  2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//					2005/01/17	H.Endo ( MJS )
//					<#1>  解像度対応
//
//  <001> 飯塚健介   2005.08.30(Thu) 全金融機関を更新でｴﾗｰが発生するのを回避
//  <002> 飯塚健介   2005/09/02(FRI) 休日ﾀﾞｲｱﾛｸﾞの色修正
//  <KDS> SATOH(GSOL)2012/02/07(TUE) ShiftState対応
//******************************************************************************
unit JNTCRP008002_5u;

interface

uses
  JNTMasComu,
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSLabel, VCL.ExtCtrls, Buttons, MJSBitBtn, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MJSPanel, MJSRadioButton, MJSEdits, MJSGroupBox, MJSCommonu, MJSComboBox,
  MJSKeyDataState,	// <KDS> ADD
  MJSRadioGroup;

type
  TJNTCRP008002_5f = class(TForm)
    DlgButtonOK: TMBitBtn;
    DlgButtonCancel: TMBitBtn;
    DlgPanelFeeList: TMPanel;
    fHliKBN: TMRadioGroup;
    fBkComb: TMComboBox;

	procedure	fnJNTCRP008002_5fOnCreate		(Sender: TObject);
	procedure	fnDlgButtonOKOnClick		(Sender: TObject);
	procedure	fnDlgButtonCancelOnClick	(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			: ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule	: TMDataModulef;
	m_cDBSelect		: TFDConnection;

    m_cComArea		: TJNTMASCom;
	TantoNCode      : Int64;

	m_arStandardFee	: array of String;
    Function fnHolidayUpd:Boolean;

  public
    { Public 宣言 }
	m_nCodeDigit	: Integer;															// ｺｰﾄﾞ桁数
	m_nCodeAttribute: Integer;															// ｺｰﾄﾞ属性

	constructor	fnCreateDialog					(pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer;pBKCODE:Integer);

	procedure	CMChildKey						(var Msg: TWMKey); message CM_CHILDKEY;

  end;

var
  JNTCRP008002_5f: TJNTCRP008002_5f;

implementation


const
	MASTER_BANK		= 21;																// 銀行

var
	Holiday_List : TStringList;
    uvBKCODE     : Integer;

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP008002_5f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection; pStandardFee: Pointer;pBKCODE:Integer);
begin
	m_pRec			:= pRec;
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect		:= cDBSelect;
	m_cComArea		:= TJNTMASCom    (m_pRec^.m_pSystemArea^);

    //m_arStandardFee	:= pStandardFee;
	Pointer(m_arStandardFee)	:= pStandardFee;

    uvBKCODE     := 0;
    uvBKCODE     := pBKCODE;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_5f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = DlgButtonOK.Name) then								// ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = DlgButtonCancel.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or						// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			fBkComb.SetFocus ();
			Abort ();
		end;
	end;

	if	(Self.ActiveControl.Parent.Name = fHliKBN.Name) then							// ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
    	if	(Msg.CharCode = VK_RETURN) then
        begin
            fBkComb.SetFocus;
            Abort;
        end
        else
            Exit;
	end;

	if	(Msg.CharCode = VK_RETURN) then
		MJSDispCtrl.MJSNextCtrl (Self)
	else if	((Msg.CharCode = VK_LEFT) or (Msg.CharCode = VK_UP)) then
		MJSDispCtrl.MjsPrevCtrl (Self)
	else if	((Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_DOWN)) then
		MJSDispCtrl.MJSNextCtrl (Self);

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_5f.fnJNTCRP008002_5fOnCreate (Sender: TObject);
var
    Qry : TMQuery;
begin

//<002>	MJSColorChange (TJNTCRP008002_5f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

    //<002>
	MJSColorChange (TJNTCRP008002_5f (Self), m_cComArea.SystemArea.SysColorB, m_cComArea.SystemArea.SysColorD,
									m_cComArea.SystemArea.SysBaseColorB, m_cComArea.SystemArea.SysBaseColorD,
															rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);


	MjsFontResize( TJNTCRP008002_5f(Self), Pointer(m_pRec) );						//<#1>

    //コンボボックスに名称を入れる

	Qry	:= TMQuery.Create (Application);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

    fBkComb.Items.Clear;

	Holiday_List	:= TStringList.Create ();
	TantoNCode := rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;

	with (Qry) do
	begin
		Close ();

		SQL.Clear ();
    	SQL.Add   ('SELECT * from OffDayName ');
		Open ();

        While not Eof do
        begin
            fBkComb.Items.add(FieldbyName('OffdayName').asString);
    		Holiday_List.Add (FloatToStr(FieldbyName('NCODE').asFloat));
            Next;
        end;
	end;

	Qry.Close ();
	Qry.Free  ();

    fBkComb.ItemIndex := 0;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_5f.fnDlgButtonOKOnClick (Sender: TObject);
begin

    if fBkComb.ItemIndex < 0 then Exit;

	if not fnHolidayUpd then
		Abort ()
    else
    begin
        Holiday_List.Free;
    	ModalResult	:= mrOK;
    end;



end;
//******************************************************************************
//  Function    :   fnHolidayUpd
//  Memo        :   銀行休日設定
//  Parameters  :   nProc	:処理方法	0=金融機関単位	1=全金融機関
//				:	nNo		:設定休日内部コード
//  Return      :   なし
//  History		:
//
//******************************************************************************
Function TJNTCRP008002_5f.fnHolidayUpd:Boolean;
var
	Qry:	TMQuery ;
    bRet:	Boolean ;
begin

    Result := True;

	Qry	:=	TMQuery.Create(Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);	// DBとMQueryの接続
    m_cDataModule.BeginTran(m_cDBSelect);      			//トランザクションの開始

    with Qry do
    begin
    	SQL.Clear ;
		if fHliKBN.ItemIndex = 0 then
        begin
    		SQL.Add(' UPDATE BankInfo SET OffDNCode = :pHol ');
    		SQL.Add(' ,UpdTantoNCode = :nUpdTantoNCode ');
    		SQL.Add(' WHERE  MasterKbn = :nMasKBN AND RdelKbn = 0 ');
            SQL.Add('   AND AllBkCode = :nBKCD ');
    		ParamByName ('nBKCD'   ).AsInteger  := uvBKCODE;
        end
        else
        begin
    		SQL.Add(' UPDATE BankInfo SET OffDNCode = :pHol ');
    		SQL.Add(' ,UpdTantoNCode = :nUpdTantoNCode ');
    		SQL.Add(' WHERE  MasterKbn = :nMasKBN AND RdelKbn = 0 ');
//<001>            SQL.Add('   AND AllBkCode = :nBKCD ');
        end;
        ParamByName ('nMasKBN').AsInteger	:= MASTER_BANK;
        ParamByName ('pHol'   ).AsFloat     := StrToFloat(Holiday_List.Strings[fBkComb.ItemIndex]);
        ParamByName ('nUpdTantoNCode').AsFloat := TantoNCode;
        bRet	:= ExecSQL ;
    end ;
    if bRet = True then
    begin
    	m_cDataModule.Commit(m_cDBSelect);
    end
    else
    begin
        m_cDataModule.Rollback(m_cDBSelect);
        Result := False;
    end ;
    Qry.Close ;
    Qry.Free ;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002_5f.fnDlgButtonCancelOnClick (Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;

end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

