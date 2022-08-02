//************************************************************************
//	System		:	Galileopt / Galileopt NX-I
//	Program		:	諸口登録ダイアログ
//	Name		:	M.Makino
//	Create		:	2012 / 07 / 01
//	Comment		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//*************************************************************************

unit JNTCRP009010SKCDlgu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, Buttons, MJSBitBtn, MJSEdits, MJSLabel, VCL.ExtCtrls, MJSPanel,
  MJSMsgStdu, ComCtrls, MJSStatusBar, JNTMasComu, MJSCommonu, MJSCommon3u,
  MjsDispCtrl, MJSStrCtrl, MJSKeyDataState,
  JNTCRP009010Controlu;

type
  {$I ActionInterface.inc}

  TJNTCRP009010SKCDlgf = class(TForm)
    Panel_Base: TMPanel;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    TxtEdit_Renso: TMTxtEdit;
    TxtEdit_LongName: TMTxtEdit;
    TxtEdit_SimpleName: TMTxtEdit;
    BBtn_OK: TMBitBtn;
    BBtn_Cancel: TMBitBtn;
    TxtEdit_SubCode: TMTxtEdit;
    NumEdit_SubCode: TMNumEdit;
    Panel_Message: TMPanel;
    procedure FormCreate(Sender: TObject);
    procedure BBtn_OKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBtn_CancelClick(Sender: TObject);
    procedure OnExitSubCode(Sender: TObject);
  private
    { Private 宣言 }
    m_pMyAppRecord	: ^TMjsAppRecord;
    m_Control		: TMyControl;
    m_iCodeDigit	: Integer;
    m_iCodeAttr		: Integer;
	procedure InitControl();
	procedure SetFocus_SubCode();
	function GetSubCode(): String;
  public
    { Public 宣言 }
    constructor CreateForm(aOwner: TComponent; aRec: Pointer; aControl: Pointer);
	function DoDlg(var aSubCode, aRenso, aLongName, aSimpleName: String): Integer;
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
  end;

const
    // 諸口
    STR_SYOKUCHI	= '諸口';

    // StatusBar文言
    INITIALIZE_TXT	= '諸口を登録してください。登録しない場合は"キャンセル"を押してください。';
    ERR_CORRECTCODE = 'コードを正しく入力してください。';
    ERR_NOUSECHAR	= '登録できない文字があります。';

    // テーブル最高桁数
    MAX_DIGIT_SIMPLENAME	= 14;	// 科目別補助簡略名称コード

var
  JNTCRP009010SKCDlgf: TJNTCRP009010SKCDlgf;

implementation

{$R *.DFM}

//**************************************************************************
//	Proccess  :	ｺﾝｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aOwner	: TComponent
//			  :	aPec	: ^TMjsAppRecordaControl
//			  :	aControl: ^TMyControl
//**************************************************************************
constructor TJNTCRP009010SKCDlgf.CreateForm(aOwner: TComponent; aRec: Pointer; aControl: Pointer);
begin
	m_pMyAppRecord := aRec;

    m_Control := TMyControl(aControl^);

	Inherited Create(aOwner);
end;

//**************************************************************************
//	Component	:	TJNTCRP009010SKCDlgf ( TForm )
//	Event	    :	OnCreate
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.FormCreate(Sender: TObject);
var
	cJNTMASCom : TJNTMASCom;
begin
    cJNTMASCom := m_Control.GetJNTMASCom();

	// Color設定
    MjsColorChange(TJNTCRP009010SKCDlgf(Self),
                  cJNTMASCom.SystemArea.SysColorB,
                  cJNTMASCom.SystemArea.SysColorD,
                  cJNTMASCom.SystemArea.SysBaseColorB,
                  cJNTMASCom.SystemArea.SysBaseColorD,
                  rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor);

    m_iCodeDigit := m_Control.GetCodeDigit();
    m_iCodeAttr := m_Control.GetCodeAttr();

    InitControl();
end;

//**************************************************************************
//	Proccess  :	コントロールの初期化
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.InitControl();
begin
	case m_iCodeAttr of
    INT_ZERO_NASI, INT_ZERO_ARI:	// 数字属性
        begin
            TxtEdit_SubCode.Visible		:= False;
            NumEdit_SubCode.Visible		:= True;
            NumEdit_SubCode.Enabled		:= True;
            NumEdit_SubCode.Digits		:= m_iCodeDigit;
            if (m_iCodeAttr = 1) then
                NumEdit_SubCode.FormatStr := StringOfChar('0', m_iCodeDigit);
            NumEdit_SubCode.Value := 0;
        end;
    STR_FREE:		   			    // フリー属性
        begin
            NumEdit_SubCode.Visible		:= False;
            TxtEdit_SubCode.Visible		:= True;
            TxtEdit_SubCode.Enabled		:= True;
            TxtEdit_SubCode.MaxLength	:= m_iCodeDigit;
            TxtEdit_SubCode.Text		:= '';
        end;
    end;

    TxtEdit_Renso.Text		:= '';
    TxtEdit_LongName.Text	:= STR_SYOKUCHI;
    TxtEdit_SimpleName.Text	:= STR_SYOKUCHI;
    Panel_Message.Caption	:= INITIALIZE_TXT;
end;

//**************************************************************************
//	Component	:	TJNTCRP009010SKCDlgf ( TForm )
//	Event	    :	OnShow
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.FormShow(Sender: TObject);
begin
	SetFocus_SubCode();
end;

//**************************************************************************
//	Component	:	TJNTCRP009010SKCDlgf ( TForm )
//	Event	    :	OnDestroy
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.FormDestroy(Sender: TObject);
begin
	Inherited;
end;

//**************************************************************************
//	Proccess  :	ﾀﾞｲｱﾛｸﾞ起動
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aSubCode, aRenso, aLongName, aSimpleName: String	参照型入力ﾊﾟﾗﾒｰﾀ
//	Result	  :	ModalResult
//**************************************************************************
function TJNTCRP009010SKCDlgf.DoDlg(var aSubCode, aRenso, aLongName, aSimpleName: String): Integer;
begin
    Result := ShowModal;

    if (Result = mrOK) then
    begin
		aSubCode	:= m_Control.GetChangedSubCode(FOR_DISPLAY, GetSubCode());
        aRenso		:= TxtEdit_Renso.Text;
        aLongName	:= TxtEdit_LongName.Text;
        aSimpleName	:= TxtEdit_SimpleName.Text;
    end;
end;

//**************************************************************************
//	Proccess  :	CMChildKey
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	Msg	: TWMKey
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.CMChildKey(var Msg: TWMKey);
var
	sShift 		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin
    // Altキーを拾う
	if GetKeyState(VK_MENU) < 0 then
		Exit;

    //Shiftキーの状態取得
	sShift := MJSKeyDataToShiftState(Msg.KeyData);

	twAcCtrl := Screen.ActiveControl;

    // Escキーで閉じる
	if ( (Msg.CharCode=VK_ESCAPE) and (sShift=[]) ) then
    begin
    	Msg.CharCode := 0;
        ModalResult := mrCancel;
        Exit;
    end;

	// Home処理
	if ( (Msg.CharCode=VK_HOME) and (sShift=[]) ) then
	begin
    	SetFocus_SubCode();
		abort;
	end;

    // ENDボタン押下でOKボタンへフォーカス移動
    if ( (Msg.CharCode = VK_END) and (sShift=[]) ) then
    begin
    	BBtn_OK.SetFocus;
        abort;
    end;

    // ファンクションキー
    case Msg.CharCode of
    VK_F8:
    	begin
		    if (twAcCtrl = TxtEdit_SimpleName) and
           	   (TxtEdit_LongName.Text <> '') then
            	TxtEdit_SimpleName.Text := MJSCopy(TxtEdit_LongName.Text, MAX_DIGIT_SIMPLENAME);
    	end;
    end;

    // TMTxtEdit
	if twAcCtrl is TMTxtEdit then
	begin
		// 文字列末尾にキャレットがある場合（→）
		if ( (Msg.CharCode = VK_RIGHT) and (sShift=[]) ) then
		begin
			if MjsChkCurEnd(TMTxtEdit(Screen.ActiveControl)) then
			begin
				MjsNextCtrl(Self);
				Abort;
			end
			else
				Exit;
		end;
		// 文字列頭にキャレットがある場合（←）
		if ( (Msg.CharCode = VK_LEFT) and (sShift=[]) ) then
		begin
			if MjsChkCurTop(TMTxtEdit(Screen.ActiveControl)) then
			begin
				MjsPrevCtrl(Self);
				Abort;
			end
			else
				Exit;
		end;
	end;

    if ( ( (Msg.CharCode = VK_Return) and (sShift = []) ) and ( not(twAcCtrl is TMBitBtn) ) ) or
       ( (Msg.CharCode = VK_Right) and (sShift = []) ) or
       ( (Msg.CharCode = VK_Down) and (sShift = []) ) or
       ( (Msg.CharCode = VK_Tab) and (sShift = []) ) then
    begin
        MjsNextCtrl(Self);
        abort;
    end;

    if ( (Msg.CharCode = VK_Left) and (sShift = []) ) or
       ( (Msg.CharCode = VK_Up) and (sShift = []) ) or
       ( (Msg.CharCode = VK_Tab) and (sShift = [ssShift]) ) then
    begin
        MjsPrevCtrl(Self);
        abort;
    end;
end;

//**************************************************************************
//	Component	:	BBtn_OK ( TMBitBtn )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.BBtn_OKClick(Sender: TObject);
begin
	// 科目別補助外部コードの入力有無チェック
    if (Trim(GetSubCode()) = '') then
    begin
        Beep;
		SetFocus_SubCode();
        Panel_Message.Caption := ERR_CORRECTCODE;
        Exit;
    end;

    // 科目別補助外部コードの入力文字チェック
    if (m_Control.IsCanUseChar(GetSubCode()) = False) then
    begin
        Beep;
		SetFocus_SubCode();
        Panel_Message.Caption := ERR_NOUSECHAR;
        Exit;
    end;

	ModalResult := mrOK;
end;

//**************************************************************************
//	Component	:	BBtn_Cancel ( TMBitBtn )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.BBtn_CancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

//**************************************************************************
//	Proccess  	:	科目別補助ｺｰﾄﾞｺﾝﾄﾛｰﾙの共通OnExitｲﾍﾞﾝﾄ
//	Component	:	NumEdit_SubCode, TxtEdit_SubCode ( TMNumEdit, TMTxtEdit )
//	Event	    :	OnExit
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.OnExitSubCode(Sender: TObject);
begin
	if (Screen.ActiveControl = BBtn_Cancel) then
    	Exit;

	// 科目別補助外部コードの入力文字チェック
    if (m_Control.IsCanUseChar(GetSubCode()) = False) then
    begin
        Beep;
		SetFocus_SubCode();
        Panel_Message.Caption := ERR_NOUSECHAR;
        Exit;
    end;

    if (Panel_Message.Caption <> INITIALIZE_TXT) then
        Panel_Message.Caption := INITIALIZE_TXT;
end;

//**************************************************************************
//	Proccess  :	外部コードへSetFocus
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010SKCDlgf.SetFocus_SubCode();
begin
	case m_iCodeAttr of
    INT_ZERO_NASI, INT_ZERO_ARI:    // 数字属性
       	NumEdit_SubCode.SetFocus;
    STR_FREE:		   			    // フリー属性
       	TxtEdit_SubCode.SetFocus;
    end;
end;

//**************************************************************************
//	Proccess  :	入力された外部コードを取得して返す。
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Return	  : String
//**************************************************************************
function TJNTCRP009010SKCDlgf.GetSubCode(): String;
begin
    case m_iCodeAttr of
    INT_ZERO_NASI, INT_ZERO_ARI:
        Result := NumEdit_SubCode.Text;
    STR_FREE:
        Result := TxtEdit_SubCode.Text;
    end;
end;

end.
