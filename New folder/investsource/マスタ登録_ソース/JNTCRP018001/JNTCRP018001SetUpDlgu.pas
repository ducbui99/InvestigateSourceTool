//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>          <修正内容>
//  <>      T.Ogawa(LEAD)   2012/06/05(TUE)   新規作成
//=============================================================================
unit JNTCRP018001SetUpDlgu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, MJSBitBtn, VCL.StdCtrls, MJSEdits, VCL.ExtCtrls, MJSPanel, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MjsStrCtrl, MJSMsgStdu, JNTMasComu, MJSCommonu,
  MetaSpt,
  JNTSelGlobal,  
  JNTCommonU, MJSLabel, MJSMemo, MJSCheckBox;

const
	WM_ONPAINT = WM_APP + 1;			// OnPaint時の処理起動ﾒｯｾｰｼﾞ用

type

  TJNTCRP018001SetUpDlgf = class(TForm)
    MPanel1: TMPanel;
    MPanel2: TMPanel;
    DialogButtonRegistration: TMBitBtn;
    MBitBtn2: TMBitBtn;
    chb_Syosai: TMCheckBox;
    pnlSetting: TMPanel;
	procedure fnJNTCRP018001SetUpDlgfOnCreate(Sender: TObject);
  private
	{ Private 宣言 }
	m_pMyAppRecord	 : ^TMjsAppRecord;

	m_pSystemArea	:	^rcSYSTEMAREA;	// MJSｼｽﾃﾑｴﾘｱ

	ComArea			 : TJNTMASCom;
  public

	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;

  public
	{ Public 宣言 }
	constructor	fnCreateDialog	(AOwner: TComponent;pRec: Pointer);
  end;

implementation

{$R *.DFM}

constructor	TJNTCRP018001SetUpDlgf.fnCreateDialog (AOwner: TComponent;pRec: Pointer);
begin
	m_pMyAppRecord		:= pRec;								// 構造体のSave

	ComArea  	    := TJNTMASCom   (m_pMyAppRecord^.m_pSystemArea^);

	m_pSystemArea  := m_pMyAppRecord^.m_pSystemArea;	    	// ｼｽﾃﾑﾒﾓﾘ  取得

	inherited	Create (AOwner);
end;


procedure	TJNTCRP018001SetUpDlgf.fnJNTCRP018001SetUpDlgfOnCreate (Sender: TObject);
begin
	MJSColorChange (TJNTCRP018001SetUpDlgf (Self), ComArea.SystemArea.SysColorB,
                                           ComArea.SystemArea.SysColorD,
									       ComArea.SystemArea.SysBaseColorB,
                                           ComArea.SystemArea.SysBaseColorD,
										  	rcCOMMONAREA (m_pMyAppRecord^.m_pCommonArea^).SysFocusColor);

end;


//**************************************************************************
//  Component : TJNTCRP018001SetUpDlgf
//  Event     : CMChildKey
//**************************************************************************
procedure TJNTCRP018001SetUpDlgf.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then				// Altｷｰを拾う
		Exit;

	sShift := JNTSELXKeyDataToShiftState(Msg.KeyData);		        // Shiftｷｰの取得

    // TAB,Enter, RIGHT, DOWN処理
    if ((Msg.CharCode = VK_TAB) and (sShift=[]))        or
       ((Msg.CharCode = VK_RETURN) and (sShift=[]))     or
        (Msg.CharCode = VK_RIGHT)                       or
        (Msg.CharCode = VK_DOWN)                        then
    begin
        MjsNextCtrl(Self);
        abort;
    end;

    // Shift+TAB, LEFT, UP処理
    if ((Msg.CharCode = VK_TAB) and (sShift=[ssShift])) or
        (Msg.CharCode = VK_LEFT)                        or
        (Msg.CharCode = VK_UP)                          then
    begin
        // 一つ前のｺﾝﾄﾛｰﾙへﾌｫｰｶｽを移動
        MjsPrevCtrl(Self);
        Abort;
    end;
end;

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*																									*/
//***************************************************************************************************/


