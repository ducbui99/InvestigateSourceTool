//************************************************************************
//	System		:	Galileopt / Galileopt NX-I
//	Program		:	科目別補助登録(簡易)
//	ProgramID	:	JNTCRP009010
//	Name		:	M.Makino
//	Create		:	2012 / 07 / 01
//	Comment		:
//	History		:	2000 / 99 / 99	X.Xxxxxx
//					XXXXXXXX更新内容XXXXXXX
//*************************************************************************
unit JNTCRP009010u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  dxTL, dxDBGrid, Db, dxCntner, dxmdaset, VCL.ExtCtrls, MJSPanel, VCL.StdCtrls,
  MJSEdits, MJSLabel, Buttons, MJSSpeedButton, MJSFunctionBar, MjsDispCtrl,
  MJSSPFunctionBar, ComCtrls, MJSStatusBar, MJSCommonu, MJSCommon3u, MJSDBModuleu,
  MjsPreviewIFu, MjsPrnDlgu, MjsPrnSupportu, MJSKeyDataState, MJSMsgStdu,
  JNTPDlg, JNTCommonu, JNTSelCorpSys, JNTMasComu, JNTMasWndIFu, JNTExpGlobal,

  JNTCRP009010Controlu, JNTCRP009010SKCDlgu;

  {$I JNTConst.inc}  
type
  {$I ActionInterface.inc}

  TJNTCRP009010f = class(TForm)
    Panel_Main: TMPanel;
    Panel_FunctionBar: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    DataSource_Saimoku_Dsp: TDataSource;
    Panel_SpeedButton: TMPanel;
    BEnd: TMSpeedButton;
    BPrint: TMSpeedButton;
    BChange: TMSpeedButton;
    BDelete: TMSpeedButton;
    MStatusBar: TMStatusBar;
    ScrollBox_Saimoku_Kani: TScrollBox;
    Label_KmkSimpleName: TMLabel;
    NumEdit_KmkGCode: TMNumEdit;
    Label_KmkGCode: TMLabel;
    Panel_Saimoku_Grid: TMPanel;
    DBGrid_Saimoku: TdxDBGrid;
    DBGrid_SaimokuSubCode: TdxDBGridColumn;
    DBGrid_SaimokuRenso: TdxDBGridColumn;
    DBGrid_SaimokuLongName: TdxDBGridColumn;
    DBGrid_SaimokuSimpleName: TdxDBGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);    
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NumEdit_KmkGCodeArrowClick(Sender: TObject);
    procedure BEndClick(Sender: TObject);
    procedure NumEdit_KmkGCodeExit(Sender: TObject);
    procedure DBGrid_SaimokuBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure BDeleteClick(Sender: TObject);
    procedure MSPFunctionBarFunctionClick(Sender: TObject;
      FuncNo: Integer);
    procedure DBGrid_SaimokuMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BChangeClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure DBGrid_SaimokuBeforeChangeNode(Sender: TObject; Node,
      NewNode: TdxTreeListNode; var CanChange: Boolean);
    procedure DBGrid_SaimokuKeyPress(Sender: TObject; var Key: Char);
    procedure NumEdit_KmkGCodeChange(Sender: TObject);
    procedure DBGrid_SaimokuChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure DBGrid_SaimokuChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure DBGrid_SaimokuChangeNodeEx(Sender: TObject);      
    procedure DataSource_Saimoku_DspStateChange(Sender: TObject);
    procedure DBGrid_SaimokuContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
	procedure OnCommonEnter(Sender: TObject);
	procedure OnCommonExit(Sender: TObject);

  private
    { Private 宣言 }
	m_pMyAppRecord	: ^TMjsAppRecord;
	m_Param			: TAppParam;
	m_MjsMsgRec		: TMjsMsgRec;
    m_Control		: TMyControl;
    m_JNTMASCom		: TJNTMASCom;
    m_MjsPre		: TMjsPreviewIF;    
    m_arFuncData	: array [0..7] of String;
	m_AcControl		: TWinControl;

    m_IsCanClose	: Boolean;

    {状態変更イベントのイベントハンドラ}
    procedure StatusChanged(Sender: TObject);

    procedure ChangeEnabled();
	procedure ChangeAlignDigit();
	procedure ChangeCaption();
    procedure SoundBeep();
    procedure ChangeFocus();
	procedure DspMsg();
	procedure ChangeForm();
	procedure SetFunctionName(aFuncNo: Integer; aStr: String);
    procedure DoSKCDlg();
  public
    { Public 宣言 }
	constructor CreateForm(aRec: Pointer);
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
  end;

const
    // ファンクションバー用定義
    STR_NULL			= '';

    // 印刷パターン
    PTN_SAIMOKU			= 0;

    // 和暦西暦区分
    YEARKBN_WAREKI		= 0;	//和暦
    YEARKBN_SEIREKI		= 1;	//西暦

    // Tagの値の定義
    EXP_NOTUSED			= 0;
    EXP_USED			= 9;

    // 画面トップのコントロール
    NAME_CONTROL_TOP	= 'NumEdit_KmkGCode';
var
  JNTCRP009010f: TJNTCRP009010f;

function AppEntry(aParam:Pointer) : Integer;

exports
	AppEntry;

implementation

{$R *.DFM}

//**************************************************************************
//	Proccess  :	親ﾌｫｰﾑから呼ばれる関数
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aParam	: ^TParam
//	Retrun	  :	Result
//**************************************************************************
function AppEntry(aParam: Pointer): Integer;
var
	pMyForm :	^TJNTCRP009010f;
	pRec    :	^TMjsAppRecord;
begin
	Result	:= ACTID_RET_OK;
	pRec	:= Pointer(TAppParam(aParam^).pRecord);

	case TAppParam(aParam^).iAction of

		// Form Create要求
		ACTID_FORMCREATESTART:
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP009010f.CreateForm(pRec);
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;

		// Form Create&Show要求
		ACTID_FORMCREATESHOWSTART:
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP009010f.CreateForm(pRec);
				pMyForm^.Show;
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;

		// Form Close要求
		ACTID_FORMCLOSESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Close;
			pMyForm^.Free;
			Dispose(pMyForm);
		end;

        // CloseQuery要求
		ACTID_FORMCANCLOSESTART:
		begin
			pMyForm :=	Pointer(pRec^.m_pChildForm);
			if (pMyForm^.CloseQuery() = FALSE) then
				Result := ACTID_RET_NG;
		end;

		// Show要求
		ACTID_SHOWSTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Show;
		end;

		// Hide要求
		ACTID_HIDESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			if (pMyForm^.Parent <> nil) then
			begin
				pMyForm^.Hide;
			end;
		end;
	end;
end;

//**************************************************************************
//	Proccess  :	ｺﾝｽﾄﾗｸﾀ
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aPec	: ^TMjsAppRecord
//**************************************************************************
constructor TJNTCRP009010f.CreateForm(aRec: Pointer);
var
    pOwnerForm  :   ^TControl;
begin
	// 呼び出し元より渡されたパラメータを保存
	m_pMyAppRecord := aRec;

	// ビジネスロジッククラスを生成
    m_Control := TMyControl.Create(Self, m_pMyAppRecord);

    // 状態変更イベントとイベントハンドラの関連付け
    m_Control.OnStatusChanged := StatusChanged;

    m_JNTMASCom := m_Control.GetJNTMASCom();

	pOwnerForm := m_pMyAppRecord^.m_pOwnerForm;
    Inherited Create(pOwnerForm^);
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnCreate
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormCreate(Sender: TObject);
begin
	Parent	:= TPanel(m_pMyAppRecord^.m_pOwnerPanel^);	// 親ﾊﾟﾈﾙをParent
	Align	:= alClient;								// 全領域を作成

	// Color設定
    MjsCompoColorSet(TJNTCRP009010f(Self),
                  m_JNTMASCom.SystemArea.SysBaseColorB,
                  m_JNTMASCom.SystemArea.SysBaseColorD);
    MjsColorChange(TJNTCRP009010f(Self),
                  m_JNTMASCom.SystemArea.SysColorB,
                  m_JNTMASCom.SystemArea.SysColorD,
                  m_JNTMASCom.SystemArea.SysBaseColorB,
                  m_JNTMASCom.SystemArea.SysBaseColorD,
                  rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor);

    // 表示用MemDataと関連付け
    m_Control.SetDataSource(DataSource_Saimoku_Dsp);

    m_MjsPre	:= m_Control.GetMjsPre();

    // 初期化
    m_AcControl		:= TWinControl(NumEdit_KmkGCode);
    m_IsCanClose	:= False;
	SetFunctionName(0, STR_NULL);
    NumEdit_KmkGCode.Tag := EXP_NOTUSED;
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnShow
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormShow(Sender: TObject);
begin
    if (m_MjsPre.IsPreView()) then
    	m_MjsPre.Show();

	// 初回のみ初期化
	if (m_Control.Status = msNone) then
		m_Control.Initialize()
    else
       	m_AcControl.SetFocus;
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnHide
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormHide(Sender: TObject);
begin
    if (m_MjsPre.IsPreView()) then
    	m_MjsPre.Hide();
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnActivate
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormActivate(Sender: TObject);
begin
	m_Param.iAction := ACTID_ACTIVEEND;
	m_Param.pRecord := Pointer(m_pMyAppRecord );
	m_Param.pActionParam := nil;
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@m_Param);
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnCloseQuery
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	if (m_IsCanClose) then
    	Exit;

    CanClose := True;

	if m_MjsPre.IsPreView then
	begin
		m_JNTMASCom.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype, m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);		// 2005/08/12 第1引数にOwnerForm追加。
		CanClose := FALSE;
	end;

    m_IsCanClose := CanClose;
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnClose
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam	: TAppParam;
begin
	m_Control.Finalize();

	m_pMyAppRecord^.m_iDelete := 1;
	wkParam.iAction			  := ACTID_FORMCLOSEEND;			// 呼び出し区分 設定
	wkParam.pRecord			  := Pointer(m_pMyAppRecord);		// 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	  := nil;							// 予備ﾎﾟｲﾝﾀ 設定
    TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);		// 親を呼び出す

    Action := caFree;
end;

//**************************************************************************
//	Component	:	JNTCRP009010f ( TForm )
//	Event	    :	OnDestroy
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.FormDestroy(Sender: TObject);
begin
	if Assigned(m_Control) then
    begin
        m_Control.Free;
        m_Control := Nil;
    end;

    inherited;
end;

//**************************************************************************
//	Proccess  :	CMChildKey
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	Msg	: TWMKey
//**************************************************************************
procedure TJNTCRP009010f.CMChildKey(var Msg: TWMKey);
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

    // Escキー
	if ( (Msg.CharCode=VK_ESCAPE) and (sShift=[]) ) then
    begin
    	if (twAcCtrl.Name = NAME_CONTROL_TOP) then
			Close
        else if (twAcCtrl = DBGrid_Saimoku) and
        		(m_Control.GetMemState() IN [dsInsert]) then
        	Exit
        else
        	MJSSetFocus(Self, NAME_CONTROL_TOP);
    end;

    // 科目別補助グリッド
    if (twAcCtrl = DBGrid_Saimoku) then
    begin
    	// INSERTキー使用不可
        if ( (Msg.CharCode = VK_INSERT) and (sShift = []) ) then
        begin
            Abort;
        end;

        // 参照モード時
        if (m_Control.Status = msRefer) then
        begin
            if (DBGrid_Saimoku.FocusedNode.Index = 0) then
            begin
                if ( (Msg.CharCode = VK_Tab) and (sShift = [ssShift]) ) then
                begin
                    NumEdit_KmkGCode.SetFocus;
                    Abort;
                end;
            end;
        end;

        // 先頭行
        if (m_Control.GetRecNo() = 1) then
        begin
            if ( (Msg.CharCode=VK_ESCAPE) and (sShift = []) ) then
            begin
                DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
                m_Control.SetMemCancel();
            end;

            if (DBGrid_Saimoku.FocusedColumn = GRIDSMK_COL_SUBCODE) then
            begin
                if ( (Msg.CharCode = VK_Tab) and (sShift = [ssShift]) ) then
                begin
                    NumEdit_KmkGCode.SetFocus;
                    Abort;
                end;
                if ( (Msg.CharCode = VK_LEFT) and (sShift = []) ) then
                begin
                    Abort;
                end;
                // 新規行のみの状態
                if (m_Control.GetMemState() IN [dsInsert]) then
                begin
                    if ( (Msg.CharCode = VK_DOWN) and (sShift = []) ) then
                    begin
                        Abort;
                    end;
                end;
            end;
        end
        else if (m_Control.GetMemState() IN [dsInsert]) then
        begin
            if ( (Msg.CharCode = VK_DOWN) and (sShift = []) ) then
            begin
                Abort;
            end;
        end;
    end;

    // ファンクションキー処理
    case Msg.CharCode of
        VK_F1:  MSPFunctionBarFunctionClick(MSPFunctionBar, 1);
        VK_F2:  MSPFunctionBarFunctionClick(MSPFunctionBar, 2);
        VK_F3:  MSPFunctionBarFunctionClick(MSPFunctionBar, 3);
        VK_F4:  MSPFunctionBarFunctionClick(MSPFunctionBar, 4);
        VK_F5:  MSPFunctionBarFunctionClick(MSPFunctionBar, 5);
        VK_F6:  MSPFunctionBarFunctionClick(MSPFunctionBar, 6);
        VK_F7:  MSPFunctionBarFunctionClick(MSPFunctionBar, 7);
        VK_F8:  MSPFunctionBarFunctionClick(MSPFunctionBar, 8);
    end;

    // 下記コンポーネント以外は共通制御しない
    if NOT (twAcCtrl is TMNumEdit) then
    	Exit;


    // 共通制御
    if ( (Msg.CharCode = VK_RETURN) and (sShift = []) ) or
       ( (Msg.CharCode = VK_RIGHT) and (sShift = []) ) or
       ( (Msg.CharCode = VK_DOWN) and (sShift = []) ) or
       ( (Msg.CharCode = VK_TAB) and (sShift = []) ) then
    begin
        MjsNextCtrl(Self);
        Abort;
    end;

	if ( (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) ) or
       ( (Msg.CharCode = VK_LEFT) and (sShift = []) ) or
       ( (Msg.CharCode = VK_UP) and (sShift = []) ) then
    begin
        MjsPrevCtrl(Self);
        Abort;
    end;
end;

//**************************************************************************
//	Component	:	m_Control ( TMyControl )
//	Event	    :	OnStatusChanged
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.StatusChanged(Sender: TObject);
begin
	ChangeEnabled();
	ChangeAlignDigit();
    ChangeCaption();
	SoundBeep();
	ChangeFocus();
    DspMsg();
	ChangeForm();
end;

//**************************************************************************
//	Proccess  :	状態別にEnabled更新
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.ChangeEnabled();
begin
	case m_Control.Status of
    msInitializing:
        begin
            DBGrid_Saimoku.Enabled		:= False;
            DBGrid_Saimoku.Options		:= DBGrid_Saimoku.Options - [egoRowSelect];
            BPrint.Enabled				:= False;
            BChange.Enabled				:= False;
            BDelete.Enabled				:= False;
            NumEdit_KmkGCode.Enabled	:= False;
            Panel_Saimoku_Grid.Realign;            
        end;
   	msInitialized, msCleared:
        begin
            if (m_Control.GetPermsUpdate()) then
            begin
	            DBGrid_Saimoku.Enabled	:= True;
	            DBGrid_Saimoku.Options	:= DBGrid_Saimoku.Options - [egoRowSelect];
            end;
            BPrint.Enabled		  		:= m_Control.GetPermsPrn();
            BDelete.Enabled		  		:= False;
            BChange.Enabled				:= True;
            NumEdit_KmkGCode.Enabled	:= True;
        end;
    msRefer:
        begin
            DBGrid_Saimoku.Enabled		:= True;
            DBGrid_Saimoku.Options		:= DBGrid_Saimoku.Options + [egoRowSelect];
            DBGrid_Saimoku.Options		:= DBGrid_Saimoku.Options - [egoCanAppend];
            BPrint.Enabled			  	:= m_Control.GetPermsPrn();
            BChange.Enabled				:= True;
            BDelete.Enabled				:= False;
            NumEdit_KmkGCode.Enabled	:= True;
        end;
    msRead:
        begin
            BDelete.Enabled			  	:= m_Control.IsCanUseDeleteBtn();
            DBGrid_Saimoku.Enabled		:= True;
            DBGrid_Saimoku.Options		:= DBGrid_Saimoku.Options - [egoRowSelect];
        end;
    else
       	Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にAlignとDigitを更新
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.ChangeAlignDigit();
    //******************************************************************************
    //  SetAlignment
    //      Alignmentをセット
    //******************************************************************************
    procedure SetAlignment();
    begin
        if (m_Control.GetCodeAttr() <> STR_FREE) then	// 数値属性
        begin
            DBGrid_SaimokuSubCode.Alignment 	:= taRightJustify;
            DBGrid_SaimokuSubCode.EditAlignment	:= taRightJustify;
        end
        else                                        	// フリー属性
        begin
            DBGrid_SaimokuSubCode.Alignment 	:= taLeftJustify;
            DBGrid_SaimokuSubCode.EditAlignment	:= taLeftJustify;
        end;
    end;
begin
	case m_Control.Status of
    msRefer, msRead, msSKCDlg:
        begin
            SetAlignment();
            DBGrid_SaimokuSubCode.MaxLength := m_Control.GetCodeDigit();
        end;
    else
    	Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にCaption更新
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.ChangeCaption();
begin
	case m_Control.Status of
    msRefer, msRead, msSKCDlg:
        begin
            Label_KmkSimpleName.Caption := m_Control.GetKmkSimpleName();
            NumEdit_KmkGCode.Tag := EXP_NOTUSED;
        end;
    msCleared, msErrSMKNotAdopt, msErrKmkNoDsp:
    	begin
            Label_KmkSimpleName.Caption := '';
            NumEdit_KmkGCode.Tag := EXP_NOTUSED;
        end;
    else
       	Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にBeep
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.SoundBeep();
begin
	case m_Control.Status of
	msErrKmkNotExist, 	msErrSMKNotAdopt,
    msErrKmkNoDsp,		msErrExistSameCode,
    msErrNoUseChar:
        begin
        	Beep;
        end;
    else
    	Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にﾌｫｰｶｽをセット
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.ChangeFocus();
var
	twAcCtrl	: TWinControl;
begin
	twAcCtrl	:= Screen.ActiveControl;
	case m_Control.Status of
    msInitialized, msErrKmkNotExist, msErrSMKNotAdopt, msErrKmkNoDsp:
    	begin
        	if (twAcCtrl <> NumEdit_KmkGCode) then
            	NumEdit_KmkGCode.SetFocus;
        end;
    msRefer:
    	begin
			if (m_Control.GetRecCount() = 0) then
            begin
            	if (twAcCtrl <> NumEdit_KmkGCode) then
                	NumEdit_KmkGCode.SetFocus;
            end
            else
            begin
            	if (twAcCtrl <> DBGrid_Saimoku) then
                	DBGrid_Saimoku.SetFocus;
            end;
        end;
    msRead:
    	begin
        	if (twAcCtrl <> DBGrid_Saimoku) then
        		DBGrid_Saimoku.SetFocus;
            if (DBGrid_Saimoku.FocusedColumn <> GRIDSMK_COL_SUBCODE) then
	            DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
        end;
    else
    	Exit;
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にメッセージ表示
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.DspMsg();
var
	sMsg	: String;
begin
	case m_Control.Status of
    msErrSubCodeNoDelete:
    	begin
			sMsg := m_Control.GetSubCode + ' ' + m_Control.GetSimpleName
            	  + ' は仕訳入力済みのため削除できません。';
	        MjsMessageBoxEx(Self, sMsg, '確認', mjInformation, mjOk, mjDefOk);
        end;
	msErrNoUseChar:
    	begin
        	// 登録できない文字があります
            m_JNTMASCom.m_MsgStd.GetMsg(m_MjsMsgRec, 30,21);
            MJSMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_pMyAppRecord^.m_ProgramName, m_MjsMsgRec.icontype,
                            m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
        end;
	msErrExistSameCode:
    	begin
            // 既に同一コードが登録済です。
            m_JNTMASCom.m_MsgStd.GetMsg(m_MjsMsgRec, 30,8);
            m_MjsMsgRec.sMsg := m_JNTMASCom.m_MsgStd.MsgChange(m_MjsMsgRec.sMsg, '@', 'コード' );
            MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
            				m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
        end;
    else
       	MStatusBar.SimpleText := '';
    end;
end;

//**************************************************************************
//	Proccess  :	状態別にダイアログなどのフォームを表示
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.ChangeForm();
begin
	case m_Control.Status of
    msSKCDlg: DoSKCDlg();
    else
    	Exit;
    end;
end;

//**************************************************************************
//	Component	:	BEnd ( TMSpeedButton )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.BEndClick(Sender: TObject);
begin
	Close;
end;

//**************************************************************************
//	Component	:	BPrint ( TMSpeedButton )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.BPrintClick(Sender: TObject);
begin
	NumEdit_KmkGCode.OnExit := Nil;
	m_Control.Print();
    NumEdit_KmkGCode.OnExit := NumEdit_KmkGCodeExit;
end;

//**************************************************************************
//	Component	:	BChange ( TMSpeedButton )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
	lvRect  : TRect;
	lvWidth,
	lvHeight: Integer;
begin
	if ( BChange.Caption = '埋込(&G)' ) then
	begin
		// 親画面への設定
		wkParam.iAction		:=  ACTID_DOCKINGINEND;			// 格納通知
		BChange.Caption		:= '切出(&G)';					// ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
	end
	else
	begin
		Visible			:=	FALSE;

		// 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
		lvRect			:=  Self.ClientRect;
		lvWidth			:=  lvRect.Right - lvRect.Left;
		lvHeight		:=  lvRect.Bottom - lvRect.Top;

		ClientWidth		:=  lvWidth;
		ClientHeight	:=  lvHeight;
		Visible			:=  TRUE;

		// 親画面への設定
		wkParam.iAction		:=  ACTID_DOCKINGOUTEND;		// 取出通知
		BChange.Caption		:=  '埋込(&G)';					// ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
	end;

	wkParam.pRecord			:=  Pointer(m_pMyAppRecord);		// 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	:=  nil;						// 予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);
end;

//**************************************************************************
//	Component	:	BDelete ( TMSpeedButton )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.BDeleteClick(Sender: TObject);
var
	iRet : Integer;
begin
    m_JNTMASCom.m_MsgStd.GetMsg(m_MjsMsgRec, 30,4);
    iRet := MjsMessageBoxEx(Self, MSG_DELETE, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype ,
                    m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
    if (iRet <> mrYes) then
        Exit;

    if (m_Control.IsCanDeleteSubCode()) then
    begin
        m_Control.Delete();
    end;
end;

//**************************************************************************
//	Component	:	NumEdit_KmkGCode ( TMNumEdit )
//	Event	    :	OnArrowClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.NumEdit_KmkGCodeArrowClick(Sender: TObject);
var
	iKmkGCode		: Integer;
    sKmkSimpleName	: String;
begin
	if (m_Control.IsCanSetExpRet_KNZ(iKmkGCode, sKmkSimpleName)) then
    begin
        NumEdit_KmkGCode.Value := iKmkGCode;
        Label_KmkSimpleName.Caption := sKmkSimpleName;
        NumEdit_KmkGCode.Tag := EXP_USED;
    end;
end;

//**************************************************************************
//	Component	:	NumEdit_KmkGCode ( TMNumEdit )
//	Event	    :	OnChange
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.NumEdit_KmkGCodeChange(Sender: TObject);
begin
	if (m_Control.GetRecCount() <> 0) then
    begin
    	m_Control.Clear();
        NumEdit_KmkGCode.Tag := EXP_NOTUSED;
    end;
end;

//**************************************************************************
//	Component	:	NumEdit_KmkGCode ( TMNumEdit )
//	Event	    :	OnExit
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.NumEdit_KmkGCodeExit(Sender: TObject);
begin
	if (m_Control.IsCanDspSaimoku(Trunc(NumEdit_KmkGCode.Value))) then
    begin
    	m_Control.SaveKmkInfo(Trunc(NumEdit_KmkGCode.Value));

    	if (m_Control.IsShowSKCDlg(Trunc(NumEdit_KmkGCode.Value)) = False) then
        begin
	    	m_Control.Read_Dsp(Trunc(NumEdit_KmkGCode.Value));
        end;
    end;
end;

//**************************************************************************
//	Component	:	MSPFunctionBar ( TMSPFunctionBar )
//	Event	    :	OnClick
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin
    // 範囲外はExit
    if not ( FuncNo in[1..8] ) then
        Exit;

	case FuncNo of
    8:
    	begin
        	if (Screen.ActiveControl <> DBGrid_Saimoku) then
                Exit;
            m_Control.SetSimpleName(GRIDSMK_COL_SIMPLENAME);
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	ﾌｧﾝｸｼｮﾝﾊﾞｰに名称をセット
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//	Parameter :	aFuncNo	: Integer	指定されたﾌｧﾝｸｼｮﾝNo
//			  :	aStr	: String	指定された名称
//**************************************************************************
procedure TJNTCRP009010f.SetFunctionName(aFuncNo: Integer; aStr: String);
begin
    case aFuncNo of
    0: FillChar(m_arFuncData, SizeOf(m_arFuncData), #0);
    8: m_arFuncData[7] := aStr;
    end;

    // FunctionBarにItemセット
    MSPFunctionBar.CopyFuncData(m_arFuncData);
end;

//**************************************************************************
//	Proccess  :	諸口登録ﾀﾞｲｱﾛｸﾞ起動
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.DoSKCDlg();
var
	cDlgForm	: TJNTCRP009010SKCDlgf;
    iRet		: Integer;
    sSubCode	: String;
    sRenso		: String;
    sLongName	: String;
    sSimpleName	: String;
begin
    sSubCode	:= '';
    sRenso		:= '';
    sLongName	:= '';
    sSimpleName	:= '';

	cDlgForm := TJNTCRP009010SKCDlgf.CreateForm(Self, m_pMyAppRecord, @m_Control);

    try
    	iRet := cDlgForm.DoDlg(sSubCode, sRenso, sLongName, sSimpleName);

        if (iRet = mrOK) then
		begin
        	m_Control.AddRecord(sSubCode, sRenso, sLongName, sSimpleName);
        end;
    finally
    	if Assigned(cDlgForm) then
        begin
            cDlgForm.Free;
        end;
    end;
end;

//**************************************************************************
//	Proccess  :	共通OnEnterEvent
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.OnCommonEnter(Sender: TObject);
begin
	m_AcControl := Screen.ActiveControl;
end;

//**************************************************************************
//	Proccess  :	共通OnExitEvent
//	Name	  :	M.Makino
//	Date	  :	2012/ 07 / 01
//**************************************************************************
procedure TJNTCRP009010f.OnCommonExit(Sender: TObject);
begin
	if (m_AcControl = DBGrid_Saimoku) then
	begin
		SetFunctionName(8, STR_NULL);
        if (m_Control.GetMemState() IN [dsInsert]) then
            m_Control.SetMemCancel();
    end;
end;

//**************************************************************************
//	Component	:	DataSource_Saimoku_Dsp ( TDataSource )
//	Event	    :	OnStateChange
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DataSource_Saimoku_DspStateChange(
  Sender: TObject);
begin
	if (DBGrid_Saimoku.FocusedColumn = GRIDSMK_COL_SUBCODE) then
    begin
        if (m_Control.GetMemState() in [dsEdit]) then
            m_Control.SetReadOnly_SubCode(True)
        else
            m_Control.SetReadOnly_SubCode(False)
    end;
end;

// ↓↓以下グリッドイベント↓↓

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnBeforeChangeColumn
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
begin
    CanChange := True;

	case Column of
    GRIDSMK_COL_SUBCODE:
        begin
            // 空白チェック
            if (Trim(m_Control.GetSubCode()) = '') then
            begin
            	m_Control.SetMemCancel;
                CanChange := False;
                Abort;
            end;

            // 変更なしなら抜ける
            if (m_Control.IsDataChanged(GRIDSMK_COL_SUBCODE) = False) then
            begin
                Exit;
            end;

            // 登録できる値かチェック
            if (m_Control.IsCanPostSubCode(TrimRight(m_Control.GetSubCode())) = False) then
            begin
            	DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
                CanChange := False;
                Abort;
            end;

            // 新規行入力中なら表示用の値をセット
        	if (m_Control.GetMemState() IN [dsInsert]) then
				m_Control.SetSubCode();

            // 登録準備
            m_Control.PrepareUpdate();
        end;
	GRIDSMK_COL_LONGNAME:
		begin
            if (m_Control.IsCanSetSimpleName() = True) then
            begin
                // 正式名称を簡略名称へコピー
                m_Control.SetSimpleName(GRIDSMK_COL_LONGNAME);
            end;
        end;
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnBeforeChangeNode
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuBeforeChangeNode(Sender: TObject;
  Node, NewNode: TdxTreeListNode; var CanChange: Boolean);
begin
	CanChange := True;

    // 空白チェック
    if (Trim(m_Control.GetSubCode()) = '') then
    begin
       	m_Control.SetMemCancel;
        CanChange := False;
        Abort;
    end;

    // 変更なしなら抜ける
    if (m_Control.IsDataChanged(GRIDSMK_COL_SUBCODE) = False) then
    begin
        Exit;
    end;

    // 登録できる値かチェック
    if (m_Control.IsCanPostSubCode(TrimRight(m_Control.GetSubCode())) = False) then
    begin
        DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
        CanChange := False;
        Abort;
    end;

    // 新規行入力中なら表示用の値をセット
    if (m_Control.GetMemState() IN [dsInsert]) then
        m_Control.SetSubCode();

    // 登録準備
    m_Control.PrepareUpdate();
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnChangeColumn
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin
	case Column of
    GRIDSMK_COL_SIMPLENAME:
        begin
        	m_JNTMASCom.m_MsgStd.GetMsg(m_MjsMsgRec, 30, 19);
	    	SetFunctionName(8, m_MjsMsgRec.sMsg);
        end;
    else
    	begin
	    	SetFunctionName(8, STR_NULL);
        end;
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnChangeNode
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
    // 新規行への移動はコードカラムへフォーカスセット
	if (Node.SelectedIndex <> GRIDSMK_COL_SUBCODE) and
       (Trim(m_Control.GetSubCode) = '') then
    begin
		DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnChangeNodeEx
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuChangeNodeEx(Sender: TObject);
begin
	// 削除ボタン表示制御
    if (m_Control.GetRecCount() > 0) then
    begin
		BDelete.Enabled := m_Control.IsCanUseDeleteBtn();
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnKeyPress
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuKeyPress(Sender: TObject;
  var Key: Char);
begin
	// 有効文字Check
	if (DBGrid_Saimoku.FocusedColumn = GRIDSMK_COL_SUBCODE) then
	begin
        if (m_Control.GetCodeAttr() <> STR_FREE ) then
        begin
    		if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) then
    		begin                          // #8=BackSpace   #27=Esc  #9=Tab
    			Beep();
    			Abort;
    		end;
        end;
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnMouseDown
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	case DBGrid_Saimoku.FocusedColumn of
    GRIDSMK_COL_SUBCODE:
    	begin
        end;
    else
        begin
            if (Trim(m_Control.GetSubCode) = '') then
                DBGrid_Saimoku.FocusedColumn := GRIDSMK_COL_SUBCODE;
        end;
    end;
end;

//**************************************************************************
//	Component	:	DBGrid_Saimoku ( TdxDBGrid )
//	Event	    :	OnContextPopup
//	Name	    :	M.Makino
//**************************************************************************
procedure TJNTCRP009010f.DBGrid_SaimokuContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
	// ポップアップメニュー非表示
	Handled := True;
end;



end.
