//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>          <修正内容>
//  <>      T.Ogawa(LEAD)   2012/06/05(TUE)   新規作成
//=============================================================================
unit JNTCRP018001MsgDlgu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, MJSBitBtn, VCL.StdCtrls, MJSEdits, VCL.ExtCtrls, MJSPanel, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl,
  MjsStrCtrl, MJSMsgStdu, JNTMasComu, MJSCommonu,
  MetaSpt,
  JNTCommonU, MJSLabel, MJSMemo, MJSCheckBox;

const
	WM_ONPAINT = WM_APP + 1;			// OnPaint時の処理起動ﾒｯｾｰｼﾞ用
    DLG_START = 1;
    DLG_SORT = 2;

type

  TJNTCRP018001MsgDlgf = class(TForm)
    Panel_Button: TMPanel;
    Btn_OK: TMBitBtn;
    Btn_NO: TMBitBtn;
    Btn_Yes: TMBitBtn;
    Btn_Cancel: TMBitBtn;
    Panel_Base: TMPanel;
    chkDLGInfo: TMCheckBox;
    MMessage: TMMemo;
    Image1: TImage;
	procedure fnJNTCRP018001MsgDlgfOnCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
	{ Private 宣言 }
	m_pMyAppRecord	 : ^TMjsAppRecord;

	m_pSystemArea	:	^rcSYSTEMAREA;	// MJSｼｽﾃﾑｴﾘｱ

	ComArea			 : TJNTMASCom;

    m_Mode : Integer;

	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;

  public
	{ Public 宣言 }
	constructor	fnCreateDialog	(AOwner: TComponent;pRec: Pointer;Mode:Integer);
  end;

implementation

{$R *.DFM}

constructor	TJNTCRP018001MsgDlgf.fnCreateDialog (AOwner: TComponent;pRec: Pointer;Mode:Integer);
begin
	m_pMyAppRecord		:= pRec;								// 構造体のSave
	ComArea  	    := TJNTMASCom   (m_pMyAppRecord^.m_pSystemArea^);
	m_pSystemArea  := m_pMyAppRecord^.m_pSystemArea;	    	// ｼｽﾃﾑﾒﾓﾘ  取得

    m_Mode := Mode;    // 起動モード

	inherited	Create (AOwner);
end;


procedure	TJNTCRP018001MsgDlgf.fnJNTCRP018001MsgDlgfOnCreate (Sender: TObject);
begin

	MJSColorChange (TJNTCRP018001MsgDlgf (Self), ComArea.SystemArea.SysColorB,
                                           ComArea.SystemArea.SysColorD,
									       ComArea.SystemArea.SysBaseColorB,
                                           ComArea.SystemArea.SysBaseColorD,
										  	rcCOMMONAREA (m_pMyAppRecord^.m_pCommonArea^).SysFocusColor);

end;


//**************************************************************************
//  Component : TJNTCRP018001MsgDlgf
//  Event     : CMChildKey
//**************************************************************************
procedure TJNTCRP018001MsgDlgf.CMChildKey(var Msg: TWMKey);
begin
	if GetKeyState(VK_MENU) < 0 then				// Altｷｰを拾う
		Exit;

end;


//**************************************************************************
//  Component : TJNTCRP018001MsgDlgf
//  Event     : FormShow
//**************************************************************************
procedure TJNTCRP018001MsgDlgf.FormShow(Sender: TObject);
begin
    // 起動確認のダイアログ
    if m_Mode = DLG_START then
    begin
        Self.Caption := '起動確認';
        Btn_OK.Visible := True;
        Btn_NO.Visible := True;
        Btn_Yes.Visible := False;
        Btn_Cancel.Visible := False;
        chkDLGInfo.Visible := True;

        // フォームの高さ調整
        Self.Height := Self.Height - 20;

        Btn_OK.SetFocus;

        // ボタンの位置を調整
        Btn_OK.Left := (Panel_Button.Width Div 2) - ((Btn_OK.Width + Btn_No.Width+5) Div 2);
        Btn_NO.Left := Btn_OK.Left + Btn_OK.Width + 5;
    end;

    // 並び替えのダイアログ
    if m_Mode = DLG_SORT then
    begin
        Self.Caption := '並び替え';
        Btn_OK.Visible := False;
        Btn_NO.Visible := True;
        Btn_Yes.Visible := True;
        Btn_Cancel.Visible := True;
        chkDLGInfo.Visible := False;

        Btn_Yes.Caption := '全て(&Y)';
        Btn_No.Caption  := '選択内(&N)';

        MMessage.Height := MMessage.Parent.Height-20;

        Btn_Yes.SetFocus;

        // ボタンの位置を調整
        Btn_Yes.Left := (Panel_Button.Width Div 2) - ((Btn_Yes.Width + 5 + Btn_No.Width + 5 + Btn_Cancel.Width) Div 2);
        Btn_NO.Left := Btn_Yes.Left + Btn_Yes.Width + 5;
        Btn_Cancel.Left := Btn_NO.Left + Btn_NO.Width + 5;
    end;

    MMessage.Color := (MMessage.Parent as TMPanel).Color;  

    // システムアイコンを取得する
    Image1.Picture.Icon.Handle := LoadICon(0,IDI_INFORMATION);
end;

end.
//***************************************************************************************************/
//*                                                                                                 */
//*	End of Specifications																			*/
//*																									*/
//***************************************************************************************************/


