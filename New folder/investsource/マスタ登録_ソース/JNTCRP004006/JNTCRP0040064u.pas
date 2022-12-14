//******************************************************************************
//  System      :   Ｇａｌｉｌｅｏｐｔ
//  Program     :   支払先情報登録（詳細情報設定）
//  ProgramID   :   JNTCRP0040064
//  Name        :   H.Kawato (MSI)
//  Create      :   2006/10/11
//  Comment		:   優先支払方法について詳細情報を設定するダイアログ
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//                  <#001>  2007/02/06 H.Kawato (MSI)
//                          入力済みのダイアログを再呼び出し時に、最終行の
//                          基準金額が入力可となる不具合を修正
//                  <#002>  2007/02/06 H.Kawato (MSI)
//                          初期表示時、基準金額にフォーカスをセット
//                  <#003>  2007/02/13 H.Kawato (MSI)
//                          分解方法によりダイアログを切り替える
//                  <#004>  2009/09/28 Y.Naganuma (MSI)
//                          分解方法を詳細情報に表示
//                  <#005>  2010/01/13 Y.Naganuma (MSI)
//                          端数処理額が０円の場合、端数処理方法を入力・表示しないよう修正
//******************************************************************************
unit JNTCRP0040064u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, Buttons, MJSBitBtn, MJSEdits,
  //QuickRpt, Qrctrls,
  MJSLabel,

  MJSCommonu, MJSMsgStdu, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,        // 2006/10/11 H.Kawato Add
  MJSKeyDataState,		// <KDS> ADD
  VCL.ExtCtrls, MJSPanel, System.AnsiStrings, MjsStrCtrl;

type

	SyousaiData		= Record	nEdaban          : Integer;                     // 枝番
								nBaseKingaku     : Extended;					// 基準金額
								nBaseHiritu      : Extended;					// 基準比率
								nHasuuKingaku	 : Extended;					// 端数処理額
								nHasuuHou        : Extended;                    // 端数処理方法
								nSite            : Extended;                    // サイト
	end;

  TJNTCRP0040064f = class(TForm)
    CmnPanelInformation01: TMPanel;
    lbPayInfoDisp: TMLabel;
    CmnPanelPaymentBase: TMPanel;
    CmnPanelPayment: TMPanel;
    MPanel2: TMPanel;
    MPanel3: TMPanel;
    MPanel4: TMPanel;
    MPanel5: TMPanel;
    MPanel6: TMPanel;
    MPanel7: TMPanel;
    MPanel8: TMPanel;
    MPanel9: TMPanel;
    MPanel10: TMPanel;
    QRShape1: TMPanel;
    CmnButtonUpdate: TMBitBtn;
    CmnButtonCancel: TMBitBtn;
    MLabel16: TMLabel;
    MLabel17: TMLabel;
    MLabel18: TMLabel;
    MLabel19: TMLabel;
    MLabel20: TMLabel;
    MLabel21: TMLabel;
    MLabel12: TMLabel;
    CmnEdit01001PaymentColumnBasedMinPrice: TMNumEdit;
    CmnEdit02001PaymentColumnBasedMinPrice: TMNumEdit;
    CmnEdit03001PaymentColumnBasedMinPrice: TMNumEdit;
    CmnEdit04001PaymentColumnBasedMinPrice: TMNumEdit;
    CmnEdit05001PaymentColumnBasedMinPrice: TMNumEdit;
    CmnLabelPaymentColumnBasedMinPrice01Unit: TMLabel;
    CmnLabelPaymentColumnBasedMinPrice02Unit: TMLabel;
    CmnLabelPaymentColumnBasedMinPrice03Unit: TMLabel;
    CmnLabelPaymentColumnBasedMinPrice04Unit: TMLabel;
    CmnLabelPaymentColumnBasedMinPrice05Unit: TMLabel;
    CmnEdit01002PaymentColumnBasedMaxPrice: TMNumEdit;
    CmnEdit02002PaymentColumnBasedMaxPrice: TMNumEdit;
    CmnEdit03002PaymentColumnBasedMaxPrice: TMNumEdit;
    CmnEdit04002PaymentColumnBasedMaxPrice: TMNumEdit;
    CmnEdit05002PaymentColumnBasedMaxPrice: TMNumEdit;
    CmnLabelPaymentColumnBasedMaxPrice05Unit: TMLabel;
    CmnLabelPaymentColumnBasedMaxPrice04Unit: TMLabel;
    CmnLabelPaymentColumnBasedMaxPrice03Unit: TMLabel;
    CmnLabelPaymentColumnBasedMaxPrice02Unit: TMLabel;
    CmnLabelPaymentColumnBasedMaxPrice01Unit: TMLabel;
    MPanel11: TMPanel;
    MPanel12: TMPanel;
    MPanel13: TMPanel;
    MLabel14: TMLabel;
    CmnEdit01003PaymentColumnBasedValue: TMNumEdit;
    CmnEdit02003PaymentColumnBasedValue: TMNumEdit;
    CmnEdit03003PaymentColumnBasedValue: TMNumEdit;
    CmnEdit04003PaymentColumnBasedValue: TMNumEdit;
    CmnEdit05003PaymentColumnBasedValue: TMNumEdit;
    CmnLabelPaymentColumnBasedValue05Unit: TMLabel;
    CmnLabelPaymentColumnBasedValue04Unit: TMLabel;
    CmnLabelPaymentColumnBasedValue03Unit: TMLabel;
    CmnLabelPaymentColumnBasedValue02Unit: TMLabel;
    CmnLabelPaymentColumnBasedValue01Unit: TMLabel;
    MLabel6: TMLabel;
    CmnEdit01004PaymentColumnFractionPrice: TMNumEdit;
    CmnEdit02004PaymentColumnFractionPrice: TMNumEdit;
    CmnEdit03004PaymentColumnFractionPrice: TMNumEdit;
    CmnEdit04004PaymentColumnFractionPrice: TMNumEdit;
    CmnEdit05004PaymentColumnFractionPrice: TMNumEdit;
    CmnEdit05005PaymentColumnFraction: TMNumEdit;
    CmnEdit04005PaymentColumnFraction: TMNumEdit;
    CmnEdit03005PaymentColumnFraction: TMNumEdit;
    CmnEdit02005PaymentColumnFraction: TMNumEdit;
    CmnEdit01005PaymentColumnFraction: TMNumEdit;
    MLabel11: TMLabel;
    CmnLabel01005PaymentColumnFractionDesc: TMLabel;
    CmnLabel02005PaymentColumnFractionDesc: TMLabel;
    CmnLabel03005PaymentColumnFractionDesc: TMLabel;
    CmnLabel04005PaymentColumnFractionDesc: TMLabel;
    CmnLabel05005PaymentColumnFractionDesc: TMLabel;
    MLabel7: TMLabel;
    CmnEdit01006PaymentColumnSite: TMNumEdit;
    CmnEdit02006PaymentColumnSite: TMNumEdit;
    CmnEdit03006PaymentColumnSite: TMNumEdit;
    CmnEdit04006PaymentColumnSite: TMNumEdit;
    CmnEdit05006PaymentColumnSite: TMNumEdit;
    MPanel1: TMPanel;
    procedure CmnButtonCancelClick(Sender: TObject);
    procedure CmnButtonUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fnDialogCommonFunctionOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure CmnEditPaymentColumnBasedMaxPriceExit(Sender: TObject);
    procedure CmnEditPaymentColumnBasedValueExit(Sender: TObject);
    procedure CmnEditPaymentColumnFractionPriceExit(Sender: TObject);
    procedure CmnEditPaymentColumnFractionExit(Sender: TObject);
    procedure CmnEditColumnChange(Sender: TObject);
  private
    { Private 宣言 }
	m_pRec				: ^TMjsAppRecord;										// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cDataModule   	: TMDataModulef;
	m_cDBSelect     	: TFDConnection;

  public
    { Public 宣言 }

	m_arSyousaiData     : array [1..5] of SyousaiData;                          // 詳細ﾃﾞｰﾀ 格納配列
    m_bProgRendoFlg     : Boolean;                                              // 詳細情報変更ﾌﾗｸﾞ
    m_cDecDivision      : Extended;                                             // 分解方法 <#003> 2007/02/13 H.Kawato Add
	m_ZoomRatio         : Integer;                                              // 拡大率	<#003> 2007/02/13 H.Kawato Add
	m_iPayWayLow		: Integer;												// 支払方法 <#004> Add

  	constructor	fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);

	procedure	CMChildKey (var Msg: TWMKey); message CM_CHILDKEY;

    function	fnGetDescriptionSelectedItem (cNumEdit: TMNumEdit; var strDescription: String): Boolean;
    function	fnGetIndexSelectItem (cNumEdit: TMNumEdit): Integer;
    procedure	fnSetPaymentColumnFraction (Sender: TObject);					// 端数処理方法設定 <#005> Add
  end;

var
  JNTCRP0040064f: TJNTCRP0040064f;

	_PayCol		: array [1..6] of String    =  ('CmnEdit0%.4dPaymentColumnBasedMinPrice',
												'CmnEdit0%.4dPaymentColumnBasedMaxPrice',
												'CmnEdit0%.4dPaymentColumnBasedValue',
												'CmnEdit0%.4dPaymentColumnFractionPrice',
												'CmnEdit0%.4dPaymentColumnFraction',
  												'CmnEdit0%.4dPaymentColumnSite'
											   );

// <#004> Add ↓↓↓
const
	LBL_DETAILINFO_DEF	= '詳細情報';
// <#004> Add ↑↑↑


implementation

{$R *.DFM}

//***********************************************************************************************************/
//***********************************************************************************************************/
//constructor	TJNTCRP0040064f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TDataBase; pSyousaiInfo: m_pSyousaiInfo);
constructor	TJNTCRP0040064f.fnCreateDialog (pRec: Pointer; AOwner: TComponent; cDBSelect: TFDConnection);
begin
	m_pRec					:= pRec;
	m_cDataModule			:= TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect				:= cDBSelect;

	inherited	Create (AOwner);
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0040064f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;

begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrCancel;

	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = CmnButtonUpdate.Name) then                 // ﾎﾞﾀﾝ [OK]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or				// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

	if	(Screen.ActiveControl.Name = CmnButtonCancel.Name) then                 // ﾎﾞﾀﾝ [ｷｬﾝｾﾙ]
	begin
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or				// →
			 ((Msg.CharCode = VK_DOWN ) and (cShiftState = []))) then
		begin
			CmnEdit01002PaymentColumnBasedMaxPrice   .SetFocus ();
			Abort ();
		end;
	end;

	inherited;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.fnDialogCommonFunctionOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	fnSetPaymentColumnFraction(Sender);			// <#005> Add

	if	(Key = VK_RETURN) then
		MJSDispCtrl.MJSNextCtrl (Self)
	else if	(Key = VK_END) then
	begin
	    CmnButtonUpdate.SetFocus ();
		Abort ();
	end
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MJSPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MJSNextCtrl (Self);
		end
		else
			MJSDispCtrl.MJSNextCtrl (Self);
	end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnButtonUpdateClick(Sender: TObject);
var
    nRow    : Integer;

begin
    // 詳細データ格納
	for	nRow := 1 to 5 do
    begin
        m_arSyousaiData[nRow].nEdaban       := nRow + 10;
        m_arSyousaiData[nRow].nBaseKingaku  := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [2], [nRow * 1000 + 2]))).Value;
        m_arSyousaiData[nRow].nBaseHiritu   := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Value;
        m_arSyousaiData[nRow].nHasuuKingaku := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Value;
        m_arSyousaiData[nRow].nHasuuHou     := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Value;
        m_arSyousaiData[nRow].nSite         := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Value;
    end;

    ModalResult	:= mrOK;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnButtonCancelClick(Sender: TObject);
begin
    ModalResult	:= mrCancel;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.FormCreate(Sender: TObject);
var
	cNumEdit	  : TMNumEdit;
	nRow		  : Integer;
	nColumn		  : Integer;

begin
	MJSColorChange (TJNTCRP0040064f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MjsFontResize( TJNTCRP0040064f(Self), Pointer(m_pRec) );

    // 詳細データ格納用配列の初期化
	for	nRow := 1 to 5 do
    begin
        m_arSyousaiData[nRow].nEdaban       := 0;
        m_arSyousaiData[nRow].nBaseKingaku  := 0;
        m_arSyousaiData[nRow].nBaseHiritu   := 0;
        m_arSyousaiData[nRow].nHasuuKingaku := 0;
        m_arSyousaiData[nRow].nHasuuHou     := 0;
        m_arSyousaiData[nRow].nSite         := 0;
    end;

    // 画面の初期化
	for	nRow := 1 to 5 do
	begin
		for	nColumn := 1 to 6 do
		begin
			cNumEdit		:= TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [nColumn], [nRow * 1000 + nColumn])));
			cNumEdit.Value	:= 0;

			if	(nRow = 1) then
				cNumEdit.Enabled    := TRUE
            else
                cNumEdit.Enabled    := FALSE;

			if	(nColumn = 1) then
                cNumEdit.ReadOnly   := TRUE
            else
                cNumEdit.ReadOnly   := FALSE;

			if	(nRow <> 1) or (nColumn <> 1) then
				cNumEdit.InputFlag	:= TRUE
            else
                cNumEdit.InputFlag	:= FALSE;

			if	(nColumn = 5) then
				TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= '';
		end;

        if (nRow <> 1) then
    		TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMinPrice%.2dUnit', [nRow]))).Caption	:= '';

		TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMaxPrice%.2dUnit', [nRow]))).Caption	:= '';
		TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedValue%.2dUnit', [nRow]))).Caption	:= '';
	end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.FormShow(Sender: TObject);
var
	cNumEdit	    : TMNumEdit;
    strDescription  : String;
    nRow            : Integer;
    nRowMax         : Integer;
	nColumn		    : Integer;
	fStatic         : Boolean;          // <#003> 2007/02/13 H.Kawato Add
	sDispLbl		: String;			// <#004> Add

begin
// <#003> 2007/02/13 H.Kawato Add Start
	if	(m_cDecDivision = 0) then       // 分解方法: 0=比率
	begin
		Self.Width					:= 720;			// <#004> Add
		CmnPanelPaymentBase.Width	:= 698;
        CmnButtonUpdate.Left        := 485;
        CmnButtonCancel.Left        := 596;
// <#004> Add
		MLabel7.Left				:= 647;
		MLabel6.Visible				:= True;
		MLabel11.Visible			:= True;
// <#004> Add

		for	nRow := 1 to 5 do
		begin
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).FormatStr	:= '##0.00';
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Width		:= 98;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Digits		:= 5;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Decimals	:= 2;

			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).TabStop	    := True;
// <#004> Add ↓↓↓
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Visible	    := True;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Enabled	    := True;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).TabStop	    := True;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Visible	    := True;
// <#005> Mod ↓↓↓
//			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Enabled	    := True;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Enabled	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Zero	    := False;
// <#005> Mod ↑↑↑
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Left	    := 647;
			if m_iPayWayLow in [1, 4, 5] then
			begin
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).TabStop	:= False;
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Visible	:= False;
			end
            else
// <#004> Add ↑↑↑
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).TabStop	:= True;
		end;

		fStatic	:= FALSE;
	end
	else if	(m_cDecDivision = 1) then   // 分解方法: 1=定額
	begin
// <#004> Mod ↓↓↓
//		CmnPanelPaymentBase.Width	:= 441;
//      CmnButtonUpdate.Left        := 228;
//      CmnButtonCancel.Left        := 339;
		Self.Width					:= 517;
		CmnPanelPaymentBase.Width	:= 490;
		CmnButtonUpdate.Left        := 287;
		CmnButtonCancel.Left        := 388;
		MLabel7.Left				:= MLabel6.Left;
		MLabel6.Visible				:= False;
		MLabel11.Visible			:= False;
// <#004> Mod ↑↑↑

		for	nRow := 1 to 5 do
		begin
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).FormatStr	:= '#,##0';
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Width		:= 110;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Digits		:= 11;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Decimals	:= 0;

			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).TabStop	    := False;
// <#004> Mod ↓↓↓
//			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).TabStop	    := False;
//			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).TabStop	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Visible	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Enabled	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).TabStop	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Visible	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5]))).Enabled	    := False;
			TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Left	    := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Left;
			if m_iPayWayLow in [1, 4, 5] then
			begin
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Visible	:= False;
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).TabStop	:= False;
            end
            else
				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).TabStop	:= True;
// <#004> Mod ↑↑↑
		end;

		fStatic	:= TRUE;
	end
	else
		Exit;
// <#003> 2007/02/13 H.Kawato Add End

    nRowMax  := 1;

    for	nRow := 1 to 5 do
    begin
        if (m_arSyousaiData[nRow].nBaseKingaku = 0) then
        begin
            nRowMax := nRow;
            break;
        end;
    end;

    if (nRowMax > 1) then
    begin
        for	nRow := 1 to nRowMax do
        begin
            if (m_arSyousaiData[nRow].nBaseKingaku <> 0) then
            begin
                for	nColumn := 1 to 6 do
                begin
                	cNumEdit            := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [nColumn], [(nRow + 1) * 1000 + nColumn])));

                    if (nRow < 4) or (nColumn <> 2) then    // <#001> Add   if文の追加
                    	cNumEdit.Enabled    := TRUE;

// <#003> 2007/02/13 H.Kawato Add Start
        			if	((nColumn >= 4) and (nColumn <= 6) and (nRow <> 6)) then
        				TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [nColumn], [(nRow + 1) * 1000 + nColumn]))).Static	:= fStatic;
// <#003> 2007/02/13 H.Kawato Add End
                end;

                TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [2], [nRow * 1000 + 2]))).Value           := m_arSyousaiData[nRow].nBaseKingaku;
                TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [2], [nRow * 1000 + 2]))).InputFlag       := FALSE;
                TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [1], [(nRow + 1) * 1000 + 1]))).Value     := m_arSyousaiData[nRow].nBaseKingaku;
                TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [1], [(nRow + 1) * 1000 + 1]))).InputFlag := FALSE;
                TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMaxPrice%.2dUnit', [nRow]))).Caption	:= '円未満';
            end;

            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).Value		:= m_arSyousaiData[nRow].nBaseHiritu;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRow * 1000 + 3]))).InputFlag	:= FALSE;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Value		:= m_arSyousaiData[nRow].nHasuuKingaku;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).InputFlag	:= FALSE;
            cNumEdit	:= TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5])));

// <#005> Add ↓↓↓
			// 端数処理額が入っていたら端数方法を設定
			if TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Value > 0 then
			begin
// <#005> Add ↑↑↑
	            cNumEdit.Value		:= m_arSyousaiData[nRow].nHasuuHou;
    	        cNumEdit.Zero		:= TRUE;						// <#005> Add
    	        cNumEdit.InputFlag	:= FALSE;
        	    cNumEdit.Enabled	:= TRUE;
            	fnGetDescriptionSelectedItem (cNumEdit, strDescription);
	            TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= strDescription;
// <#005> Add ↓↓↓
			end
			else
			begin
				cNumEdit.Value		:= 0;
    	        cNumEdit.Zero		:= FALSE;
    	        cNumEdit.InputFlag	:= FALSE;
        	    cNumEdit.Enabled	:= FALSE;
	            TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= '';
			end;
// <#005> Add ↑↑↑

            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).Value		:= m_arSyousaiData[nRow].nSite;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRow * 1000 + 6]))).InputFlag	:= FALSE;

            TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMinPrice%.2dUnit', [nRow]))).Caption	:= '円以上';
            TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedValue%.2dUnit', [nRow]))).Caption	:= '%';
        end;
    end;
// <#004> Add ↓↓↓
	case m_iPayWayLow of														// 支払方法
		1:		sDispLbl := ' :振込';
		2:		sDispLbl := ' :期日指定振込';
		3:		sDispLbl := ' :手形';
		4:		sDispLbl := ' :小切手';
		5:		sDispLbl := ' :現金';
		else	sDispLbl := '';
	end;

	lbPayInfoDisp.Caption	:= LBL_DETAILINFO_DEF + sDispLbl;
// <#004> Add ↑↑↑

    m_bProgRendoFlg := False;                                                   // ﾌﾗｸﾞの初期化

// <#002> 2007/02/07 H.Kawato Add Start
    CmnEdit01002PaymentColumnBasedMaxPrice.SetFocus ();
//	Abort ();																	// <#004> Del
// <#002> 2007/02/07 H.Kawato Add End
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040064f.fnGetDescriptionSelectedItem (cNumEdit: TMNumEdit; var strDescription: String): Boolean;
var
	nPosition: Integer;

begin
	strDescription	:= '';

	nPosition	:= fnGetIndexSelectItem (cNumEdit);

	if	(nPosition = -1) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	strDescription	:= cNumEdit.SelectItems.Strings [nPosition];

	for	nPosition := 1 to StrLen (PChar (strDescription)) do
	begin
		if	(Copy (strDescription, nPosition, 1) = ':') then
		begin
			strDescription	:= Copy (strDescription, nPosition + 2, 256);
			Break;
		end;
	end;

	Result	:= TRUE;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0040064f.fnGetIndexSelectItem (cNumEdit: TMNumEdit): Integer;
var
	nPickNo	 : Integer;
	nCount	 : Integer;
	nPosition: Integer;

begin
	for	nPosition := 0 to cNumEdit.SelectItems.Count - 1 do
	begin
		nPickNo	:= -1;

		for	nCount := 1 to StrLen (PChar (cNumEdit.SelectItems.Strings [nPosition])) do
		begin
			if	(Copy (cNumEdit.SelectItems.Strings [nPosition], nCount, 1) = ':') then
			begin
				nPickNo	:= StrToInt (Trim (Copy (cNumEdit.SelectItems.Strings [nPosition], 1, nCount - 1)));
				Break;
			end;
		end;

		if	(cNumEdit.AsInteger = nPickNo) then
		begin
			Result	:= nPosition;
			Exit;
		end;
	end;

	Result	:= -1;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnEditPaymentColumnBasedMaxPriceExit(Sender: TObject);
var
    cNumEdit        : TMNumEdit;
    cNextEdit       : TMNumEdit;
    nColumn         : Integer;
    nRow            : Integer;
    nRowNo          : Integer;
    strDescription  : String;

begin
	// キャンセルボタン押下 → 終了
	if Screen.ActiveControl.Name = 'CmnButtonCancel' then
		exit;

	cNumEdit	:= Sender as TMNumEdit;
    nRowNo      := StrToInt(Copy (cNumEdit.Name, 8, 2));    // 当該行番号

    if  (cNumEdit.Value = 0) then       // 0円の時
    begin
        cNumEdit.InputFlag  := TRUE;
       	TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMaxPrice%.2dUnit', [nRowNo]))).Caption   := '';

        if (nRowNo = 1) then
        begin
{
            if (cNumEdit.Value <= 0) then
            begin
                cNumEdit.SetFocus;
                Beep;
                Abort;
            end
            else    nRowNo := 0;        // 1行目の場合、当該行からクリアする
}
            nRowNo := 0;
        end;

	    for	nRow := nRowNo + 1 to 5 do  // 次行から最終行まで値をクリアし、入力不可とする
        begin
        	for	nColumn := 1 to 6 do
        	begin
        		cNextEdit   := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [nColumn], [nRow * 1000 + nColumn])));

                if (nRow <> 1) or ((nColumn <> 1) and (nColumn <> 2)) then
                begin
               		cNextEdit.Value     := 0;
                    cNextEdit.InputFlag	:= TRUE;
                end;

                if (nRow <> 1) then
                    cNextEdit.Enabled   := FALSE;

        		if	(nColumn = 5) then
        			TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNextEdit.Name, 8, 64) + 'Desc')).Caption    := '';
        	end;

            if (nRow <> 1) then
           		TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMinPrice%.2dUnit', [nRow]))).Caption := '';

        	TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMaxPrice%.2dUnit', [nRow]))).Caption := '';
        	TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedValue%.2dUnit', [nRow]))).Caption    := '';
        end;
    end
    else if (cNumEdit.Value > 0) then   // 0円以上の入力の時
    begin
        if (nRowNo > 1) then            // 2行目以降の場合、前の行より値が大きいかチェック
        begin
            if (cNumEdit.Value <= TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [2], [(nRowNo - 1) * 1000 + 2]))).Value) then
            begin
                cNumEdit.SetFocus;
                Beep;
                Abort;
            end;
        end;

        if (nRowNo < 5) then            // 最終行でない場合、当該行「円未満」金額を次行「円以上」金額にセット
        begin
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [1], [(nRowNo + 1) * 1000 + 1]))).Value       := cNumEdit.Value;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [1], [(nRowNo + 1) * 1000 + 1]))).InputFlag   := FALSE;
        end;

        // 当該行設定
        TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [nRowNo * 1000 + 3]))).InputFlag := FALSE;
        TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRowNo * 1000 + 4]))).InputFlag := FALSE;
        TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRowNo * 1000 + 5]))).InputFlag := FALSE;

        cNumEdit    := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRowNo * 1000 + 5])));           // 端数処理方法区分
        cNumEdit.InputFlag  := FALSE;

// <#005> Add ↓↓↓
		// 端数処理額が入っていたら端数方法を設定
		if TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRowNo * 1000 + 4]))).Value > 0 then
		begin
	        cNumEdit.Zero	:= TRUE;
// <#005> Add ↑↑↑
	     	fnGetDescriptionSelectedItem (TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRowNo * 1000 + 5]))), strDescription);
    	    TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= strDescription;
// <#005> Add ↓↓↓
		end
		else
		begin
	        cNumEdit.Zero	:= FALSE;
    	    TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= '';
		end;
// <#005> Add ↑↑↑

        TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [nRowNo * 1000 + 6]))).InputFlag := FALSE;

        TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMaxPrice%.2dUnit', [nRowNo]))).Caption   := '円未満';
        TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedValue%.2dUnit', [nRowNo]))).Caption      := '%';

        if (nRowNo < 5) then            // 最終行でない場合
        begin
            for	nColumn := 1 to 6 do    // 次行を入力可とする
            begin
                if (nRowNo <> 4) or (nColumn <> 2) then     // 最終行の基準金額は入力不可
                begin
                    cNextEdit   := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [nColumn], [(nRowNo + 1) * 1000 + nColumn])));
                	cNextEdit.Enabled   := TRUE;
                end;
            end;

            // 次行設定
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [3], [(nRowNo + 1) * 1000 + 3]))).InputFlag   := FALSE;
            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [(nRowNo + 1) * 1000 + 4]))).InputFlag	:= FALSE;

            cNextEdit   := TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [(nRowNo + 1) * 1000 + 5]))); // 端数処理方法区分
            cNextEdit.InputFlag := FALSE;

// <#005> Add ↓↓↓
			// 端数処理額が入っていたら端数方法を設定
			if TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [(nRowNo + 1) * 1000 + 4]))).Value > 0 then
			begin
		        cNextEdit.Zero	:= TRUE;
// <#005> Add ↑↑↑
	         	fnGetDescriptionSelectedItem (TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [(nRowNo + 1) * 1000 + 5]))), strDescription);
    	        TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNextEdit.Name, 8, 64) + 'Desc')).Caption    := strDescription;
// <#005> Add ↓↓↓
			end
			else
			begin
		        cNextEdit.Zero	:= FALSE;
    		    TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNextEdit.Name, 8, 64) + 'Desc')).Caption	:= '';
			end;
// <#005> Add ↑↑↑

            TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [6], [(nRowNo + 1) * 1000 + 6]))).InputFlag   := FALSE;

            TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedMinPrice%.2dUnit', [nRowNo + 1]))).Caption	:= '円以上';
            TMLabel (MJSFindCtrl (Self, Format ('CmnLabelPaymentColumnBasedValue%.2dUnit', [nRowNo + 1]))).Caption      := '%';
        end;
    end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnEditPaymentColumnBasedValueExit(Sender: TObject);
var
    cNumEdit    : TMNumEdit;

begin
	// キャンセルボタン押下 → 終了
	if Screen.ActiveControl.Name = 'CmnButtonCancel' then
		exit;

	cNumEdit	:= Sender as TMNumEdit;

// <#003> 2007/02/13 H.Kawato Add
    if (m_cDecDivision = 0) then        // 分解方法「0: 比率」
    begin
// <#003> 2007/02/13 H.Kawato Add
        if (cNumEdit.Value > 100) then
        begin
            cNumEdit.SetFocus;
            Beep;
            Abort;
        end;
    end;    // <#003> Add
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnEditPaymentColumnFractionPriceExit(Sender: TObject);
var
    cNumEdit    : TMNumEdit;
	nFigure     : Int64;
	nCount      : Integer;

begin
	// キャンセルボタン押下 → 終了
	if Screen.ActiveControl.Name = 'CmnButtonCancel' then
		exit;

	fnSetPaymentColumnFraction(Sender);			// <#005> Add

	cNumEdit	:= Sender as TMNumEdit;
    nFigure	    := 10;

    for	nCount := 2 to StrLen (PChar (IntToStr (Trunc (cNumEdit.Value)))) - 1 do
    	nFigure	:= nFigure * 10;

    if	((Trunc (cNumEdit.Value) mod nFigure) <> 0) then
    begin
        cNumEdit.SetFocus;
        Beep;
        Abort;
    end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnEditPaymentColumnFractionExit(Sender: TObject);
var
    cNumEdit        : TMNumEdit;
    strDescription  : String;

begin
	// キャンセルボタン押下 → 終了
	if Screen.ActiveControl.Name = 'CmnButtonCancel' then
		exit;

	cNumEdit	:= Sender as TMNumEdit;

   	if not fnGetDescriptionSelectedItem (cNumEdit, strDescription) then
    begin
        cNumEdit.SetFocus;
        Beep;
        Abort;
    end;

    if (cNumEdit.InputFlag = FALSE) then
        TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= strDescription;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure TJNTCRP0040064f.CmnEditColumnChange(Sender: TObject);
begin
    m_bProgRendoFlg := True;
end;

// <#005> Add ↓↓↓
// 端数処理方法設定
procedure	TJNTCRP0040064f.fnSetPaymentColumnFraction (Sender: TObject);
var
    cNumEdit    	: TMNumEdit;
    cHouEdit    	: TMNumEdit;
	nRow			: Integer;
    strDescription  : String;
begin
	cNumEdit	:= Sender as TMNumEdit;

	for nRow := 1 to 5 do
	begin
		// 端数処理額だったら
		if	(TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [4], [nRow * 1000 + 4]))).Name = cNumEdit.Name) then
		begin
			cHouEdit	:= TMNumEdit (MJSFindCtrl (Self, Format (_PayCol [5], [nRow * 1000 + 5])));
			// 端数処理額が入っていたら端数方法を入力出来るよう設定
			if	(cNumEdit.Value > 0) then
			begin
				cHouEdit.Enabled	:= True;
				cHouEdit.Zero		:= True;
	         	fnGetDescriptionSelectedItem (cHouEdit, strDescription);
    	        TMLabel   (MJSFindCtrl (Self, 'CmnLabel' + Copy (cHouEdit.Name, 8, 64) + 'Desc')).Caption	:= strDescription;
			end
			else
			begin
				cHouEdit.Value		:= 0;             
				cHouEdit.Enabled	:= False;
				cHouEdit.Zero		:= False;
    	        TMLabel   (MJSFindCtrl (Self, 'CmnLabel' + Copy (cHouEdit.Name, 8, 64) + 'Desc')).Caption	:= '';
            end;
			break;
		end;
	end;
end;
// <#005> Add ↑↑↑

end.
