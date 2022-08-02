unit JNTCRP004007_D4u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSComboBox, MJSLabel, MJSEdits, VCL.ExtCtrls, MJSPanel, Buttons,
  MJSBitBtn, MJSRadioButton, MJSDispCtrl, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery,
  JNTMasWndIFu,
  MJSGroupBox, MJSCommonu;

type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  TJNTCRP004007_D4f = class(TForm)
    MPanel1: TMPanel;
    DlgButtonOk: TMBitBtn;
    DlgEditCreateTimeStr01: TMTxtEdit;
    DlgEditCreateTimeEnd01: TMTxtEdit;
    DlgEditPassTime01: TMTxtEdit;
    DlgEditCreateTimeStr02: TMTxtEdit;
    DlgEditCreateTimeEnd02: TMTxtEdit;
    DlgEditPassTime02: TMTxtEdit;
    MTxtEdit1: TMTxtEdit;
    MTxtEdit2: TMTxtEdit;
    MTxtEdit3: TMTxtEdit;
    MTxtEdit4: TMTxtEdit;
    MTxtEdit5: TMTxtEdit;
    DlgEditCreateTimeStr00: TMTxtEdit;
    MTxtEdit6: TMTxtEdit;
    MTxtEdit7: TMTxtEdit;
    DlgEditCreateTimeStr10: TMTxtEdit;
    DlgEditCreateTimeEnd10: TMTxtEdit;
    DlgEditPassTime10: TMTxtEdit;
    MTxtEdit8: TMTxtEdit;
    MTxtEdit9: TMTxtEdit;
    MTxtEdit10: TMTxtEdit;
    MTxtEdit11: TMTxtEdit;
    MNumEdit1: TMNumEdit;
    MNumEdit2: TMNumEdit;
    MNumEdit3: TMNumEdit;
    MNumEdit4: TMNumEdit;
    DlgEditReadRecords01: TMNumEdit;
    MNumEdit6: TMNumEdit;
    DlgEditReadRecords02: TMNumEdit;
    MTxtEdit12: TMTxtEdit;
    DlgEditCreateTimeStr11: TMTxtEdit;
    MTxtEdit14: TMTxtEdit;
    MNumEdit5: TMNumEdit;
    DlgEditReadRecords11: TMNumEdit;
    DlgEditPassTime11: TMTxtEdit;
    DlgEditCreateTimeEnd11: TMTxtEdit;
    MTxtEdit17: TMTxtEdit;
    MTxtEdit18: TMTxtEdit;
    MTxtEdit19: TMTxtEdit;
    DlgEditCreateTimeStr12: TMTxtEdit;
    DlgEditCreateTimeEnd12: TMTxtEdit;
    DlgEditPassTime12: TMTxtEdit;
    DlgEditReadRecords12: TMNumEdit;
    MTxtEdit23: TMTxtEdit;
    MNumEdit9: TMNumEdit;
    MTxtEdit13: TMTxtEdit;
    DlgEditInfoGetTimeStr: TMTxtEdit;
    MTxtEdit16: TMTxtEdit;
    MNumEdit7: TMNumEdit;
    DlgEditPassTime13: TMTxtEdit;
    DlgEditInfoGetTimeEnd: TMTxtEdit;
    MTxtEdit22: TMTxtEdit;
    MNumEdit8: TMNumEdit;

	procedure	fnPay210199fOnCreate	(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			  : ^TMjsAppRecord;													// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cCreateTimeStr00: TDateTime;														// Create Form
	m_cCreateTimeStr01: TDateTime;														// 作成開始 TreeView
	m_cCreateTimeEnd01: TDateTime;														// 作成終了 TreeView
	m_cCreateTimeStr02: TDateTime;														// 作成開始 DBGrid
	m_cCreateTimeEnd02: TDateTime;														// 作成終了 DBGrid
	m_cCreateTimeStr10: TDateTime;														// OnCreate ｲﾍﾞﾝﾄ開始
	m_cCreateTimeEnd10: TDateTime;														// OnCreate ｲﾍﾞﾝﾄ終了
	m_cCreateTimeStr11: TDateTime;														// 作成開始 TreeView ①
	m_cCreateTimeEnd11: TDateTime;														// 作成終了 TreeView ①
	m_cCreateTimeStr12: TDateTime;														// 作成開始 TreeView ②
	m_cCreateTimeEnd12: TDateTime;														// 作成終了 TreeView ②
	m_cInfoGetTimeStr : TDatetime;
	m_cInfogetTimeEnd : TDateTime;
	m_nReadRecords02  : Extended;
	m_nReadRecords11  : Extended;
	m_nReadRecords12  : Extended;

  public
    { Public 宣言 }

	constructor	fnCreateDialog	(pRec: Pointer; AOwner: TComponent;
													cDateTimeStr00: TDateTime;
													cDateTimeStr01: TDateTime; cDateTimeEnd01: TDateTime;
													cDateTimeStr02: TDateTime; cDateTimeEnd02: TDateTime;
													cDateTimeStr10: TDateTime; cDateTimeEnd10: TDateTime;
													cDateTimeStr11: TDateTime; cDateTimeEnd11: TDateTime;
													cDateTimeStr12: TDateTime; cDateTimeEnd12: TDateTime;
													cDateTimeStr13: TDateTime; cDateTimeEnd13: TDateTime;
													nReadRecords02: Extended;
													nReadRecords11: Extended; nReadRecords12: Extended);

	procedure	CMChildkey		(var Msg: TWMKey); message CM_CHILDKEY;
  end;

var
	JNTCRP004007_D4f: TJNTCRP004007_D4f;

implementation

{$R *.DFM}


//***********************************************************************************************************/
//***********************************************************************************************************/
constructor	TJNTCRP004007_D4f.fnCreateDialog (pRec: Pointer; AOwner: TComponent;
										cDateTimeStr00: TDateTime;
										cDateTimeStr01: TDateTime; cDateTimeEnd01: TDateTime;
										cDateTimeStr02: TDateTime; cDateTimeEnd02: TDateTime;
										cDateTimeStr10: TDateTime; cDateTimeEnd10: TDateTime;
										cDateTimeStr11: TDateTime; cDateTimeEnd11: TDateTime;
										cDateTimeStr12: TDateTime; cDateTimeEnd12: TDateTime;
										cDateTimeStr13: TDateTime; cDateTimeEnd13: TDateTime;
										nReadRecords02: Extended;
										nReadRecords11: Extended; nReadRecords12: Extended);
begin
	m_pRec				:= pRec;
	m_cCreateTimeStr00	:= cDateTimeStr00;
	m_cCreateTimeStr01	:= cDateTimeStr01;
	m_cCreateTimeEnd01	:= cDateTimeEnd01;
	m_cCreateTimeStr02	:= cDateTimeStr02;
	m_cCreateTimeEnd02	:= cDateTimeEnd02;
	m_cCreateTimeStr10	:= cDateTimeStr10;
	m_cCreateTimeEnd10	:= cDateTimeEnd10;
	m_cCreateTimeStr11	:= cDateTimeStr11;
	m_cCreateTimeEnd11	:= cDateTimeEnd11;
	m_cCreateTimeStr12	:= cDateTimeStr12;
	m_cCreateTimeEnd12	:= cDateTimeEnd12;
	m_cInfoGetTimeStr	:= cDateTimeStr13;
	m_cInfoGetTimeEnd	:= cDateTimeEnd13;
	m_nReadRecords02	:= nReadRecords02;
	m_nReadRecords11	:= nReadRecords11;
	m_nReadRecords12	:= nReadRecords12;

	inherited	Create (AOwner);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D4f.CMChildkey (var Msg: TWMKey);
begin
	if (Msg.CharCode = VK_ESCAPE) then
		ModalResult	:= mrOk;

	inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP004007_D4f.fnPay210199fOnCreate (Sender: TObject);
var
	strDateTime	 : String;
	strDateFormat: String;

begin
	MJSColorChange (TJNTCRP004007_D4f (Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	strDateFormat	:= 'yyyy/mm/dd hh:mm:ss.zz';

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr00);
	DlgEditCreateTimeStr00.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr01);
	DlgEditCreateTimeStr01.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeEnd01);
	DlgEditCreateTimeEnd01.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr02);
	DlgEditCreateTimeStr02.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeEnd02);
	DlgEditCreateTimeEnd02.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr10);
	DlgEditCreateTimeStr10.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeEnd10);
	DlgEditCreateTimeEnd10.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr11);
	DlgEditCreateTimeStr11.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeEnd11);
	DlgEditCreateTimeEnd11.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeStr12);
	DlgEditCreateTimeStr12.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cCreateTimeEnd12);
	DlgEditCreateTimeEnd12.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cInfoGetTimeStr);
	DlgEditInfoGetTimeStr.Text	:= strDateTime;

	DateTimeToString (strDateTime, strDateFormat, m_cInfoGetTimeEnd);
	DlgEditInfoGetTimeEnd.Text	:= strDateTime;

	FormatSettings.LongTimeFormat	:= 'hh:mm:ss.zz';

	DlgEditPassTime01.Text	:= TimeToStr (m_cCreateTimeStr01 - m_cCreateTimeEnd01);
	DlgEditPassTime02.Text	:= TimeToStr (m_cCreateTimeStr02 - m_cCreateTimeEnd02);
	DlgEditPassTime10.Text	:= TimeToStr (m_cCreateTimeStr10 - m_cCreateTimeEnd10);
	DlgEditPassTime11.Text	:= TimeToStr (m_cCreateTimeStr11 - m_cCreateTimeEnd11);
	DlgEditPassTime12.Text	:= TimeToStr (m_cCreateTimeStr12 - m_cCreateTimeEnd12);
	DlgEditPassTime13.Text	:= TimeToStr (m_cInfoGetTimeStr  - m_cInfoGetTimeEnd );

	DlgEditReadRecords01.Value	:= m_nReadRecords11 + m_nReadRecords12;
	DlgEditReadRecords02.Value	:= m_nReadRecords02;
	DlgEditReadRecords11.Value	:= m_nReadRecords11;
	DlgEditReadRecords12.Value	:= m_nReadRecords12;
end;

end.
//***********************************************************************************************************/
//*																											*/
//*	End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/

