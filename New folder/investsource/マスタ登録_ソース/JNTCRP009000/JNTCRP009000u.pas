//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：勘定科目登録（共通-親）
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
//  <001>   高橋 功二(LEAD) 2005.04.08(FRI) FX-STYLE対応
//  <   >   高橋 功二(LEAD) 2005.04.18(MON) FX-STYLEﾗｲﾌﾞﾗﾘ対応
//  <002>   茂木 勇次(LEAD) 2005.07.11(MON) ﾗｲｾﾝｽﾁｪｯｸ機能の追加
//  <003>   茂木 勇次(LEAD) 2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <004>   井上 佳美(LEAD) 2005.07.27(WED) 権限機能を追加（印刷）
//  <005>   高橋 功二(LEAD) 2005.08.12(FRI) JNTCommonを子に引き渡すように修正
//  <006>   高橋 功二(LEAD) 2005.08.19(FRI) m_CmpListのｸﾘｱを追加
//  <007>   高橋 功二(LEAD) 2005.08.19(FRI) m_CmpListの破棄をclear→freeへ変更
//  <   >   茂木 勇次(LEAD) 2005.09.08(THU) 切出/埋込における不具合対応。
//  <008>   加藤 香織(PRIME)2005.10.14(FRI) DeskTopの×で終了しようとしてｷｬﾝｾﾙするとｴﾗｰとなっていた不具合修正
//  <009>   加藤 香織(PRIME)2005.10.14(FRI) ｷｰ動作追加
//  <ESC>   加藤 香織(PRIME)2005.10.20(THU) 子のEscｷｰ動作対応のためにIFに第1ｺﾝﾎﾞ追加
//  <   >   加藤 香織(PRIME)2005.10.20(THU) 第1ｺﾝﾎﾞのOnExitｲﾍﾞﾝﾄにEnterEventが設定されているのをOnEnterに移動した
//  <010>   青木 由香(PRIME)2006.03.16(THU) 分類ｺﾝﾎﾞでのTab動作不具合対応
//	<011>	加藤 香織(PRIME)2007.04.04(WED)	ｷｰで第1ｺﾝﾎﾞ操作時に子を2度Createする不具合修正
//	<012>	渡邊 慎太郎(Lab)2007.07.02(MON)	共通マスタの決算確定対応
//	<013>	関　 隆宏(PRIME)2008.02.18(MON)	ﾏｽﾀ更新履歴対応
//	<014>	黒田 祐生       2010.05.21(FRI) MLBplLoader対応(LoadPackageの置換)
//	<015>	黒田 祐生       2011.03.09(WED)	出力順序登録対応
//	<016>	黒田 祐生		2012.02.13(MON) ShiftState対応
//	<017>	黒田 祐生		2012.04.04(WED)	切出後、ﾌｫｰｶｽが処理科目ｺﾝﾎﾞに戻ってしまう不具合修正
//=============================================================================
unit JNTCRP009000u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.ExtCtrls, ComCtrls, VCL.ImgList, VCL.StdCtrls, dxGrClms, dxTL, dxDBGrid,
  dxCntner, Db, dxmdaset, FireDAC.Comp.Client, CommCtrl, Menus, ToolWin, Grids, ActnList,

  MJSFunctionBar, MJSSPFunctionBar, MJSPanel, MJSLabel, MJSPageControl,
  MJSEdits, MJSTab, MJSQuery, MJSComboBox, MJSGroupBox, MJSSpeedButton, MJSBitBtn,
  MJSRadioButton, MJSRadioGroup, MJSCheckBox, MJSStatusBar, MJSToolBar, MJSMemo,

  MJSCommonu, MjsDBModuleu, MjsDispCtrl, MjsDateCtrl, MjsStrCtrl,
  JNTCommonu, JNTMasComu, FXLicense{<002>},
  MLBplLoaderU{<014>}
  ,MJSKeyDataState	// <016>ADD
  ;

  const
	WM_ONPAINT	= WM_APP + 1;	//OnPaint 時の処理起動Message用

type
  {$include ActionInterface.inc}

	TJNTCRP009000IFunc = record
		iOpCode			:	Integer;		// 処理コード
		sCaption		:	String;			// キャプション(ファンクション文字列)
		sProg			:	String;			// Bpl名（xxxxxxxxx.Bpl）
		bEnabled		:	Boolean;		// 有効･無効
		bWndUV			:	Boolean;		// 選択ウィンドウ不可視化
		iLevl			:	Integer;		// 指示Lebel（２００、３００）
		iNumb			:	Integer;		// 指示順序（１～）
		iMamaOpCode		:	Integer;		// 親処理コード
		iBrotherCode	:	Integer;		// 他モード識別コード
		iType			:	Integer;		// 処理モード
		iMode			:	Integer;		// 処理動作
		iStyl			:	Integer;		// 処理スタイル
        iParam          :   Integer;
	end;

  TJNTCRP009000f = class(TForm)
	PPanel_ToolVar: TMPanel;
    PMPanelAp: TMPanel;
    PPanel_Header: TMPanel;
    LComboBox1: TMLabel;
    MComboBox1: TMComboBox;
    FusenImageList: TImageList;
    PopupMenu2: TPopupMenu;
    R1: TMenuItem;
    B1: TMenuItem;
    G1: TMenuItem;
    O1: TMenuItem;
    MComboBox2: TMComboBox;
    LComboBox2: TMLabel;
    imgFusenD: TImageList;
    B_End: TMSpeedButton;
    B_Print: TMSpeedButton;
    B_Change: TMSpeedButton;
    B_Delete: TMSpeedButton;
    B_Syousai: TMSpeedButton;
    B_KmkCopy: TMSpeedButton;
    ToolBar: TMToolBar;
    ToolButton: TToolButton;
    B_Search: TMSpeedButton;
    B_Order: TMSpeedButton;

	procedure FormCreate                (Sender: TObject);
	procedure FormShow                  (Sender: TObject);
	procedure FormHide                  (Sender: TObject);
	procedure FormClose                 (Sender: TObject; var Action: TCloseAction);
	procedure FormCloseQuery            (Sender: TObject; var CanClose: Boolean);
	procedure FormActivate              (Sender: TObject);
	procedure EndProc                   (Sender: TObject);
	procedure BEndClick                 (Sender: TObject);
	procedure MComboBox1Change          (Sender: TObject);
	procedure MComboBox1KeyDown         (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy               (Sender: TObject);
    procedure B_ChangeClick             (Sender: TObject);
    procedure EnterEvent                (Sender: TObject);
    procedure F_ToolBtnClick            (Sender: TObject);

  private
	{ Private 宣言 }
    m_cJNTArea              :   TJNTCommon;
    m_Base_pRec				:	^TMjsAppRecord;		//	Bpl管理構造体
    m_Load_pRec				:	^TMjsAppRecord;		//	Bpl管理構造体
    m_IFunc                 :   TJNTCRP009000IFunc;
	m_AcControl		        :   TWinControl;
	MDataModule		        :   TMDataModulef;
	ComArea			        :   TJNTMASCom;
    m_bBtnChange	        :   Boolean;            // 切出<<=>>埋込ﾌﾗｸﾞ
	m_bFirstFlag        	:   Boolean;			// 初期処理ﾌﾗｸﾞ
	m_bDspFlag	        	:   Boolean;			// 初期表示処理ﾌﾗｸﾞ
	m_bEndFlag	        	:   Boolean;			// 処理終了ﾌﾗｸﾞ
	m_bEndBtnFlag       	:   Boolean;			// 処理終了ﾎﾞﾀﾝﾌﾗｸﾞ
	m_bKousinBtn        	:   Boolean;			// 更新ﾌﾗｸﾞ
	giReferFlag		        :   Integer;			// 参照ﾌﾗｸﾞ
    m_CmpList		        :	TList;
    m_FormClose             :   Boolean;
    m_iSelectInfo			:	Integer;			// 選択中のﾘｽﾄindex<011> ADD

    //--<004>権限St
    m_IsAppend  : Boolean;
    m_IsDelete  : Boolean;
    m_IsDisplay : Boolean;
    m_IsModify  : Boolean;
    m_IsPrint   : Boolean;
    //--<004>権限Ed

	procedure   WMOnPaint               (var Msg: TMessage); message WM_ONPAINT;
    procedure   fnCallBPL               (pType : Integer);
    function    SetComponent            (): Pointer;
    procedure   fnBtnDspChange          ();
    procedure   fnCheckLicense          ();
    procedure   fnGetGrants             (); // <002>

  public
	{ Public 宣言 }
	constructor CreateForm              (pRec: Pointer);
	procedure	CMChildKey              (var Msg: TWMKey); message CM_CHILDKEY;
    function    DoAction                (rFunc:TJNTCRP009000IFunc)	:	Boolean;
    function    BplLoad                 (rFunc:TJNTCRP009000IFunc):Pointer;
    function    BplAction               ( iAction : Integer; pRec: Pointer;pParam: Pointer=nil ) : Integer;
    procedure   ProcSelect              ();
    procedure   BplUnLoad               ();
    procedure   BplListUpdate           ();
  end;

  const
    // 参照ﾌﾗｸﾞ時に使用
	NORMAL				=	1;		//	通常処理
	REFER				=	3;		//	参照

function AppEntry(pParam:Pointer) : Integer;

exports
	AppEntry;

implementation

{$R *.DFM}
{$include JNTMasCommonFuncB.inc}

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pParam: Pointer): Integer;
var
	pMyForm :	^TJNTCRP009000f;
	pRec    :	^TMjsAppRecord;
begin
	Result	:= ACTID_RET_OK;
	pRec	:= Pointer(TAppParam(pParam^).pRecord);

	case TAppParam(pParam^).iAction of
        // ---------------------------------
        //	Form Create要求
        // ---------------------------------
		ACTID_FORMCREATESTART:
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP009000f.CreateForm(pRec);
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;
        // ---------------------------------
        //	Form Create&Show要求
        // ---------------------------------
		ACTID_FORMCREATESHOWSTART:
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP009000f.CreateForm(pRec);
				pMyForm^.Show;
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;
        // ---------------------------------
        //	Form Close要求
        // ---------------------------------
		ACTID_FORMCLOSESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Close;
			pMyForm^.Free;
			Dispose(pMyForm);
		end;
        // ---------------------------------
        //	Form CanClose要求
        // ---------------------------------
		ACTID_FORMCANCLOSESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			if ( pMyForm^.CloseQuery = FALSE ) then
				Result := ACTID_RET_NG;
		end;
        // ---------------------------------
        //	Show要求
        // ---------------------------------
		ACTID_SHOWSTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Show;
		end;
        // ---------------------------------
        //	Hide要求
        // ---------------------------------
		ACTID_HIDESTART:
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );

			if ( pMyForm^.Parent <> nil ) then
			begin
				pMyForm^.Hide;
			end;
		end;
	end;

end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TJNTCRP009000f.CreateForm(pRec: Pointer);
var
    POwnerForm  :   ^TControl;
begin

	m_Base_pRec     :=  pRec;								        // 構造体のSave

    m_cJNTArea      := TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
    m_cJNTArea.setMasAppRecord;

	MDataModule     :=  TMDataModulef(m_Base_pRec^.m_pDBModule^);	// DBModuleを取得
	ComArea		    :=  TJNTMASCom(m_Base_pRec^.m_pSystemArea^);  	// ｼｽﾃﾑﾒﾓﾘ 取得
    m_CmpList       :=  TList.Create;
    m_iSelectInfo	:=	99;					// 初期化<011> ADD

    POwnerForm := m_Base_pRec^.m_pOwnerForm;

    inherited Create(POwnerForm^);

end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormCreate(Sender: TObject);
begin

	m_bDspFlag		:=  FALSE;
	m_bEndFlag 		:=  FALSE;
	m_bEndBtnFlag 	:=  FALSE;
	m_bFirstFlag	:=  FALSE;
	m_bKousinBtn	:=  FALSE;
    m_bBtnChange 	:=  TRUE;
    m_FormClose     :=  FALSE;

	Parent  :=  TPanel(m_Base_pRec^.m_pOwnerPanel^);
	Align   :=  alClient;

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MjsColorChange(TJNTCRP009000f(Self),
				   ComArea.SystemArea.SysColorB,
				   ComArea.SystemArea.SysColorD,
				   ComArea.SystemArea.SysBaseColorB,
				   ComArea.SystemArea.SysBaseColorD,
				   rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysFocusColor
				  );

	MjsFontResize( TJNTCRP009000f(Self), Pointer(m_Base_pRec) );

    // 初期ﾌｫｰｶｽ 設定
	m_AcControl := MComboBox1;
    MComboBox1.ItemIndex    :=  0;

	JNTMasAccelCharCancel(Self);

    // ﾗｲｾﾝｽﾁｪｯｸ処理
    fnCheckLicense();

    //権限情報を取得<004>
    fnGetGrants;
    // 権限のﾎﾞﾀﾝの制御<004>
    B_Print.Enabled := m_IsPrint;

    // 初期表示時は「印刷」「削除」「挿入」ﾎﾞﾀﾝは使用不可にする。
    MjsDispCtrl.MjsSetEnabled(Self, 'B_Print',   FALSE);
    MjsDispCtrl.MjsSetEnabled(Self, 'B_Delete',  FALSE);
    MjsDispCtrl.MjsSetEnabled(Self, 'B_Syousai', FALSE);
    MjsDispCtrl.MjsSetEnabled(Self, 'B_KmkCopy', FALSE);
    MjsDispCtrl.MjsSetEnabled(Self, 'B_Search',  FALSE);
    MjsDispCtrl.MjsSetEnabled(Self, 'B_Order',	 FALSE);	// <015>

    // ｲﾍﾞﾝﾄOnCreateの最後に
	PostMessage(Self.Handle, WM_ONPAINT, 0, 0);

end;

//-----------------------------------------------------------------------------
// WMOnPaint()
//      PARAM   : Msg: TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.WMOnPaint(var Msg: TMessage);
begin

    // 初期のみ一回の処理
	if ( m_bFirstFlag = FALSE ) then
	begin
		if ( m_AcControl = MComboBox1 ) then
    	begin
            // 情報区分(MComboBox1)を開く
			MComboBox1.DroppedDown  :=  TRUE;
			m_bFirstFlag            :=  TRUE;
	    end;
    end;

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< 表示処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormShow(Sender: TObject);
begin

	JNTMasSetCaption( m_Base_pRec );
	MJSBtnVisible( TJNTCRP009000f(Self), TRUE );

    // ﾎﾞﾀﾝの使用可設定
    case MComboBox1.ItemIndex of
        // ---------------------------------------------------------------------
        //  勘定科目
        // ---------------------------------------------------------------------
        0:
        begin
        end;
        // ---------------------------------------------------------------------
        //  資金繰科目、タイトル科目
        // ---------------------------------------------------------------------
        1,2:
        begin
            B_Syousai.Visible  := FALSE;                    // 詳細
            B_KmkCopy.Visible  := FALSE;                    // 科目ｺﾋﾟｰ
            B_Search.Visible   := FALSE;                    // 検索
			B_Order.Visible	   := FALSE;					// 出力順序登録 <015>
            MComboBox2.Visible := FALSE;                    // 科目別ｺﾝﾎﾞ
            LComboBox2.Visible := FALSE;
        end;
        // ---------------------------------------------------------------------
        // 要約B/S科目、要約P/L科目、固定変動科目、C/F科目
        // ---------------------------------------------------------------------
        3,4,5:
        begin
            B_Syousai.Visible  := FALSE;                    // 詳細
            B_Delete.Visible   := FALSE;                    // 削除
            B_KmkCopy.Visible  := FALSE;                    // 科目ｺﾋﾟｰ
            B_Search.Visible   := FALSE;                    // 検索
			B_Order.Visible	   := FALSE;					// 出力順序登録 <015>
            ToolBar.Visible    := FALSE;                    // 付箋
            MComboBox2.Visible := FALSE;                    // 科目別ｺﾝﾎﾞ
            LComboBox2.Visible := FALSE;
        end;
        // ---------------------------------------------------------------------
        // 要約B/S科目、要約P/L科目、固定変動科目、C/F科目
        // ---------------------------------------------------------------------
        6:
        begin
            B_Syousai.Visible  := FALSE;                    // 詳細
            B_KmkCopy.Visible  := FALSE;                    // 科目ｺﾋﾟｰ
            B_Search.Visible   := FALSE;                    // 検索
			B_Order.Visible	   := FALSE;					// 出力順序登録 <015>
            ToolBar.Visible    := FALSE;                    // 付箋
        end;
        else Exit;
    end;

	if not Assigned(m_Load_pRec) then	// 子のBPLをロードする前の初回のみSetFocusする<017>ADD
	begin								// <017>ADD
		m_AcControl.SetFocus;
	end;								// <017>ADD
end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑ非表示処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormHide(Sender: TObject);
begin

	MJSBtnVisible( TJNTCRP009000f(Self), FALSE );

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑｸﾛｰｽﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam			:	TAppParam;
begin

    // 呼び出しBPLがある場合、終了命令を送信
    if ( m_Load_pRec <> nil ) then
    begin
       	if ( m_Load_pRec^.m_hChildBpl <> 0 )	then
	    begin
		    BplAction( ACTID_FORMCLOSESTART, m_Load_pRec );
            BplListUpdate();
    	end;
	end;

    m_cJNTArea.Free;

	m_Base_pRec^.m_iDelete  :=  1;
	wkParam.iAction		    :=  ACTID_FORMCLOSEEND;			    // 呼び出し区分 設定
	wkParam.pRecord			:=  Pointer(m_Base_pRec);		    // 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	:=  nil;							// 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);		// 親を呼び出す!!

	Action := caFree;

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//	< 破棄処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormDestroy(Sender: TObject);
begin

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
        BplListUpdate();	//	Bplﾘｽﾄの整理
    end;

    m_CmpList.Free;         // <007>

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< 終了前処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

	if ( m_bEndFlag = TRUE ) then
		Exit;

    // <008> BplActionの下に移動
    // 更新直後 or 参照 or 表示しないうちに終了した時 Exit
{	if ( m_bKousinBtn = FALSE ) or
       ( giReferFlag  = REFER ) or
       ( m_bDspFlag   = FALSE ) then
	begin
        m_bEndFlag  :=  TRUE;
        CanClose    :=  TRUE;
        Exit;
	end;
}
    // 終了可能か問い合わせ送信
    if ( m_Load_pRec <> nil ) then
    begin
       	if	( m_Load_pRec^.m_hChildBpl <> 0 ) then
	    begin
		    // 要求拒否
    		if ( BplAction( ACTID_FORMCANCLOSESTART, m_Load_pRec ) <> ACTID_RET_OK ) then
	    	begin
		    	// 以降処理しない
                CanClose    := FALSE;
    			Exit;
    		end;
		end;
	end;

    // <008> ここに移動
    // 更新直後 or 参照 or 表示しないうちに終了した時 Exit
	if ( m_bKousinBtn = FALSE ) or
       ( giReferFlag  = REFER ) or
       ( m_bDspFlag   = FALSE ) then
	begin
        m_bEndFlag  :=  TRUE;
        CanClose    :=  TRUE;
        Exit;
	end;

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.FormActivate(Sender: TObject);
var
	wkParam : TAppParam;
begin

	wkParam.iAction         :=  ACTID_ACTIVEEND;
	wkParam.pRecord         :=  Pointer( m_Base_pRec );
	wkParam.pActionParam    :=  nil;

	TMjsAppRecord( m_Base_pRec^ ).m_pOwnerEntry( @wkParam );

end;

//-----------------------------------------------------------------------------
// EndProc()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 終了の共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.EndProc(Sender: TObject);
begin

	Close();

end;

//-----------------------------------------------------------------------------
// EnterEvent()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : OnEnterの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.EnterEvent(Sender: TObject);
begin

	m_AcControl := Screen.ActiveControl;

    // 切出≪＝≫埋込
    if ( m_bBtnChange = FALSE ) then
       	Exit;

end;

//-----------------------------------------------------------------------------
// BEndClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : BSpeed_ToolBar_End ( TMSpeedButton ) OnClick
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.BEndClick(Sender: TObject);
begin

    // 終了確認ﾌﾗｸﾞを初期化する
    m_FormClose :=  FALSE;

    // 子BPLが起動中の場合、子のCloseを起動する
    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放

        // 子BPLのClose命令が拒否された場合はExitする
        if ( m_FormClose = FALSE ) then Exit;

        BplListUpdate();	//	Bplﾘｽﾄの整理
    end;

	// 表示しないうちに終了した時 or 参照ﾓｰﾄﾞ
	if ( m_bDspFlag = FALSE ) or ( giReferFlag = REFER ) then
    begin
		EndProc(Sender);
    	Exit;
    end;

	m_bEndBtnFlag := TRUE;

    // Close命令を呼出
	EndProc(Sender);

end;

//-----------------------------------------------------------------------------
// MComboBox1Change()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : MComboBox1 OnChange
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.MComboBox1Change(Sender: TObject);
//var
//	iSelectInfo	: Integer;					// <011> DEL
begin

    if ( MComboBox1.DroppedDown = TRUE ) then
		Exit;
// <011> MOD start
(*    if ( iSelectInfo <> MComboBox1.ItemIndex ) then
    begin
    	iSelectInfo := MComboBox1.ItemIndex;

        if ( m_bEndBtnFlag = FALSE ) then
            // 各種BPLを呼び出す
            fnCallBPL(iSelectInfo);
    end;
*)
    if ( m_iSelectInfo <> MComboBox1.ItemIndex ) then
    begin
    	m_iSelectInfo := MComboBox1.ItemIndex;

        if ( m_bEndBtnFlag = FALSE ) then
            // 各種BPLを呼び出す
            fnCallBPL(m_iSelectInfo);
    end;
// <011> MOD end
end;

//-----------------------------------------------------------------------------
// fnCallBPL()
//      PARAM   : pType     情報区分
//      RETURN  :
//      MEMO    : BPLの呼出
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.fnCallBPL(pType : Integer);
var
    lvBplName   :   String;
    lvParam     :   Integer;
begin

    lvBplName   :=  '';
    lvParam     :=  -1;

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
        BplListUpdate();	//	Bplﾘｽﾄの整理
	end;

    case pType of
        0:      lvBplName   :=  'JNTCRP009001.bpl';    // 勘定科目
        1:  begin
                lvBplName   :=  'JNTCRP009002.bpl';    // 資金繰科目
                lvParam     :=  0;
            end;
        2:  begin
                lvBplName   :=  'JNTCRP009002.bpl';    // タイトル科目
                lvParam     :=  1;
            end;
        3:  begin
                lvBplName   :=  'JNTCRP009002.bpl';    // 要約B/S科目
                lvParam     :=  2;
            end;
        4:  begin
                lvBplName   :=  'JNTCRP009002.bpl';    // 要約P/L科目
                lvParam     :=  3;
            end;
        5:  begin
                lvBplName   :=  'JNTCRP009002.bpl';    // 固定変動科目
                lvParam     :=  4;
            end;
        6:      lvBplName   :=  'JNTCRP009003.bpl';    // C/F科目
        else exit;
    end;

    m_IFunc.iOpCode := 1;
    m_IFunc.sProg   := lvBplName;
    m_IFunc.iParam  := lvParam;
    DoAction(m_IFunc);

end;

//-----------------------------------------------------------------------------
// MComboBox1KeyDown()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//                Key   : key情報
//                Shift : Shift情報
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.MComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
    //	リスト内でEnter,Tabの場合は次へ移動
	if (( Key=VK_TAB    ) and ( Shift=[] )) or
	   (( Key=VK_RETURN ) and ( Shift=[] )) then
	begin
        // 各種BPLを呼出す
        if ( m_bEndBtnFlag = FALSE ) then
            fnCallBPL(MComboBox1.ItemIndex);
		Abort;
	end;
}
end;

//-----------------------------------------------------------------------------
// CMChildKey()
//      PARAM   : Msg	: TWMKey
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin

	if ( GetKeyState(VK_MENU) < 0 ) then
		Exit;

    // Shiftｷｰの取得
	sShift      :=  MJSKeyDataToShiftState(Msg.KeyData);	// <016>MOD
	twAcCtrl    :=  Screen.ActiveControl;

    // TMNumEditのItemsが開いている
	if ( twAcCtrl is TSelectStrGrid ) then
		Exit;

    // 情報区分（MComboBox1）での Shift+Tab,↑,←処理は禁止
   	if ( twAcCtrl = MComboBox1 ) then
	begin
		// ↑,↓処理
		if (( Msg.CharCode = VK_UP   ) and ( sShift = [] )) or
		   (( Msg.CharCode = VK_DOWN ) and ( sShift = [] )) then
		begin
			Exit;
		end;
		// TAB,Enter,→処理
		if (( Msg.CharCode = VK_TAB    ) and ( sShift = [])) or
		   (( Msg.CharCode = VK_RETURN ) and ( sShift = [])) or
		   (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [])) then
		begin
            // 各種BPLを呼出す
// <011> MOD start
(*
            if ( m_bEndBtnFlag = FALSE ) then
                fnCallBPL(MComboBox1.ItemIndex);
            Abort;                          // <009>
*)
            if ( m_bEndBtnFlag = FALSE ) then
            begin
            	if m_iSelectInfo <> MComboBox1.ItemIndex then
                begin
                							// 呼び出すBPLを保存
					m_iSelectInfo := MComboBox1.ItemIndex;
											// BPL呼出
	                fnCallBPL(MComboBox1.ItemIndex);
                end
                else
                begin
                	MjsNextCtrl(Self);
                end;
				Abort;
            end;
// <011> MOD start
        end;
		// Shift&Tab,←処理
		if (( Msg.CharCode = VK_TAB  ) and ( sShift = [ssShift] )) or
		   (( Msg.CharCode = VK_LEFT ) and ( sShift = []        )) then
			Abort;

        // Esc <009>
        if ((Msg.CharCode = VK_ESCAPE) and (sShift = [])) then
        begin
            if MComboBox1.DroppedDown then
                Exit
            else
                Close;
        end;
	end;
    // <009>↓
    // 第2ｺﾝﾎﾞでのｷｰ動作
    if (twAcCtrl = MComboBox2) then
    begin
        if ((Msg.CharCode = VK_ESCAPE) and (sShift = [])) then
        begin
            if MComboBox2.DroppedDown then
            begin
                Exit;
            end
            else
            begin
                MComboBox1.SetFocus;
                Abort;
            end;
        end;
        if ((Msg.CharCode = VK_TAB) and (sShift = [ssShift])) then
        begin
            MjsPrevCtrl(Self);
            Abort;
        end;
        //<010> ↓
        // Tabは子供のKeyDown、ChildKeyで拾えないのでRETURNにする
        if (( Msg.CharCode = VK_TAB  ) and ( sShift = [] )) then
        begin
            keybd_event(VK_RETURN, 0, 0, 0);
            Abort;
        end;
        //<010> ↑
    end;
    // <009>↑

end;

//-----------------------------------------------------------------------------
// DoAction()
//      PARAM   : rFunc
//      RETURN  :
//      MEMO    : ﾌﾟﾛｸﾞﾗﾑを呼出
//-----------------------------------------------------------------------------
function TJNTCRP009000f.DoAction(rFunc:TJNTCRP009000IFunc)	:	Boolean;
begin

    Result  :=  FALSE;

    // BPLのﾛｰﾄﾞ
    m_Load_pRec:=BplLoad(rFunc);


    if	( m_Load_pRec = nil ) then Exit;

    ProcSelect;

	Result  :=  TRUE;

end;

//-----------------------------------------------------------------------------
// BplLoad()
//      PARAM   : rFunc : TJNTCRP001000IFunc
//      RETURN  :
//      MEMO    : BplLoad処理
//-----------------------------------------------------------------------------
function TJNTCRP009000f.BplLoad(rFunc:TJNTCRP009000IFunc):Pointer;
var
	pRec		:	^TMjsAppRecord;
	sBplPath	:	String;
begin

	// ﾊﾟﾗﾒｰﾀ作成
	new( pRec );
	pRec^					:= m_Base_pRec^;
//	pRec^.m_iProgramCode	:= rFunc.iOpCode;				// iApNo;	// <013> del
	pRec^.m_iDelete			:= 0;							// 削除ﾌﾗｸﾞ
    pRec^.m_sParameter      := IntToStr(rFunc.iParam);

	Result  :=  nil;

    // BPLのﾊﾟｽを取得
	sBplPath	:=	rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysRoot+'\'+
					TJNTMASCom(m_Base_pRec^.m_pSystemArea^).SystemArea.SysPrefix+'\prg\'+
					rFunc.sProg;

	try
        // ﾊﾟｯｹｰｼﾞのﾛｰﾄﾞ
	 // pRec^.m_hChildBpl		:= LoadPackage( sBplPath );         // <014>DEL
        pRec^.m_hChildBpl		:= LoadPackageHelper( sBplPath );   // <014>ADD
	except
		Dispose( pRec );
		exit;
	end;

	// Export関数ｱﾄﾞﾚｽの取得
	pRec^.m_pChildEntry	:= GetProcAddress( pRec^.m_hChildBpl, 'AppEntry' );

	if ( @pRec^.m_pChildEntry = nil ) then
	begin
	 // UnLoadPackage( pRec^.m_hChildBpl );         // <014>DEL
        UnLoadPackageHelper( pRec^.m_hChildBpl );   // <014>ADD
		Dispose( pRec );
		Exit;
	end;

	pRec^.m_pChildForm		:= nil;							// 子BplFormのﾎﾟｲﾝﾀ
	pRec^.m_pOwnerEntry		:= @AppEntry;					// 親BplのAppEntry
	pRec^.m_pOwnerForm		:= m_Base_pRec^.m_pChildForm;	// 親bplFormのﾎﾟｲﾝﾀ
	pRec^.m_pOwnerPanel		:= @PMPanelAp;					// 親BplのPanelﾎﾟｲﾝﾀ

    // Create処理
	if ( BplAction( ACTID_FORMCREATESTART, pRec, SetComponent) <> ACTID_RET_OK ) then
	begin
	 // UnLoadPackage( pRec^.m_hChildBpl );         // <014>DEL
        UnLoadPackageHelper( pRec^.m_hChildBpl );   // <014>ADD
		Dispose( pRec );
		Exit;
	end;

	Result  :=  pRec;

end;

//-----------------------------------------------------------------------------
// BplAction()
//      PARAM   : iAction
//              : pRec
//              : pParam
//      RETURN  :
//      MEMO    : BplLoad処理
//-----------------------------------------------------------------------------
function TJNTCRP009000f.BplAction( iAction : Integer; pRec: Pointer;pParam: Pointer=nil ) : Integer;
var
	AppPrm	: TAppParam;
begin

	AppPrm.iAction		:= iAction;					//	呼び出し区分設定
	AppPrm.pRecord		:= Pointer( pRec );			//	管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam	:= pParam;					//	個別パラメータ設定

	result := TMjsAppRecord( pRec^ ).m_pChildEntry( @AppPrm );

end;

//-----------------------------------------------------------------------------
// ProcSelect()
//      PARAM   :
//      RETURN  :
//      MEMO    : 処理リスト選択
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.ProcSelect;
begin

	PMPanelAp.Enabled:=TRUE;
	BplAction( ACTID_SHOWSTART, m_Load_pRec );

end;

//-----------------------------------------------------------------------------
// BplUnLoad()
//      PARAM   :
//      RETURN  :
//      MEMO    : BplUnLoad処理
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.BplUnLoad;
begin

    // 子BPLが起動していた場合
   	if ( m_Load_pRec^.m_hChildBpl <> 0 )	then
	begin
		// 子BPLのCloseQueryActionを起動する
		if ( BplAction( ACTID_FORMCANCLOSESTART, m_Load_pRec ) <> ACTID_RET_OK ) then
		begin
            // 終了ﾌﾗｸﾞをOFFにする
            m_FormClose :=  FALSE;
			//	以降処理しない
			Exit;
		end;

        // 終了ﾌﾗｸﾞをONにする
        m_FormClose :=  TRUE;

        // 子BPLのCloseActionを起動する
		BplAction( ACTID_FORMCLOSESTART, m_Load_pRec );
	end;

end;

//-----------------------------------------------------------------------------
// BplListUpdate()
//      PARAM   :
//      RETURN  :
//      MEMO    : Bplリストの整理（削除指定されているBplをFree）
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.BplListUpdate();
begin

	if ( m_Load_pRec^.m_hChildBpl <> 0 ) and ( m_Load_pRec^.m_iDelete = 1 ) then
	begin
	 // UnloadPackage( m_Load_pRec^.m_hChildBpl );          // <014>DEL
        UnloadPackageHelper( m_Load_pRec^.m_hChildBpl );    // <014>ADD
		Dispose( m_Load_pRec );
        m_Load_pRec :=  nil;
	end;

end;

//-----------------------------------------------------------------------------
// BSpeed_ToolBar_ChangeClick()
//      PARAM   : Sender : TObject
//      RETURN  :
//      MEMO    : 切り出し・埋め込み
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.B_ChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    lvRect  : TRect;
    lvWidth,
    lvHeight: Integer;
begin

    m_bBtnChange := FALSE;

    if ( B_Change.Caption = '埋込(&G)' ) then
    begin
        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGINEND;         //  格納通知
        B_Change.Caption    := '切出(&G)';                  // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible     :=	FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect      := Self.ClientRect;
        lvWidth     := lvRect.Right - lvRect.Left;
        lvHeight    := lvRect.Bottom - lvRect.Top;

        ClientWidth  :=  lvWidth;
        ClientHeight :=  lvHeight;
		Visible		 :=	TRUE;

        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGOUTEND;        //  取出通知
        B_Change.Caption    := '埋込(&G)';                  // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=    Pointer(m_Base_pRec);      // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := TRUE;

end;

//-----------------------------------------------------------------------------
// SetComponent()
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009000f.SetComponent() : Pointer;
begin

    // ﾎﾞﾀﾝのﾎﾟｲﾝﾀ設定
    m_CmpList.Clear;                                        // ﾘｽﾄのｸﾘｱ　<006>
	m_CmpList.Add(@B_Print);// 印刷
    m_CmpList.Add(@B_Syousai);                              // 詳細
    m_CmpList.Add(@B_Delete);                               // 削除
    m_CmpList.Add(@B_KmkCopy);                              // 科目ｺﾋﾟｰ
    m_CmpList.Add(@B_Search);                               // 検索
    m_CmpList.Add(@ToolButton);                             // 付箋
    m_CmpList.Add(@MComboBox1);                             // 1つ目のｺﾝﾎﾞ<ESC>
    m_CmpList.Add(@MComboBox2);                             // 科目別ｺﾝﾎﾞ
	m_CmpList.Add(@m_cJNTArea);                             // JNTCommon <005>
    m_CmpList.Add(@m_Base_pRec);                            // TMJSAppRecord <005>
	m_CmpList.Add(@B_Order);	                            // 出力順序登録 <015>

    fnBtnDspChange();

    Result := Pointer( @m_CmpList );

end;

//-----------------------------------------------------------------------------
// fnBtnDspChange()
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.fnBtnDspChange();
begin

    // ﾎﾞﾀﾝの使用不可設定
    B_Syousai.Visible  := FALSE;                            // 詳細
    B_Delete.Visible   := FALSE;                            // 削除
    B_KmkCopy.Visible  := FALSE;                            // 科目ｺﾋﾟｰ
    B_Search.Visible   := FALSE;                            // 検索
    B_Order.Visible    := FALSE;                            // 出力順序登録	(ToolBarの後だとVisivleが正しく制御できない) <015>
    ToolBar.Visible    := FALSE;                            // 付箋
    MComboBox2.Visible := FALSE;                            // 科目別ｺﾝﾎﾞ
    MComboBox2.Clear;
    LComboBox2.Visible := FALSE;



    // ﾎﾞﾀﾝの使用可設定
    case MComboBox1.ItemIndex of
        // 勘定科目
        0:
        begin
            B_Syousai.Visible  := TRUE;                     // 詳細
            B_Delete.Visible   := TRUE;                     // 削除
            B_KmkCopy.Visible  := TRUE;                     // 科目ｺﾋﾟｰ
            B_Search.Visible   := TRUE;                     // 検索
            B_Order.Visible	   := TRUE;						// 出力順序登録	<015>
            ToolBar.Visible    := TRUE;                     // 付箋
            MComboBox2.Visible := TRUE;                     // 科目別ｺﾝﾎﾞ
            LComboBox2.Caption := '科目分類';
            LComboBox2.Visible := TRUE;

            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left+B_End.Width+1;
            B_Change.Left       :=  B_Print.Left+B_Print.Width+1;
            B_Syousai.Left      :=  B_Change.Left+B_Change.Width+1;
            B_Delete.Left       :=  B_Syousai.Left+B_Syousai.Width+1;
            B_KmkCopy.Left      :=  B_Delete.Left+B_Delete.Width+1;
            B_Search.Left       :=  B_KmkCopy.Left+B_KmkCopy.Width+1;
            ToolBar.Left        :=  B_Search.Left+B_Search.Width+2;
            B_Order.Left        :=  ToolBar.Left+ToolBar.Width;			// <015>
        end;
        // 資金繰科目、タイトル科目
        1,2:
        begin
            B_Delete.Visible   := TRUE;                     // 削除
            ToolBar.Visible    := TRUE;                     // 付箋

            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left+B_End.Width+1;
            B_Change.Left       :=  B_Print.Left+B_Print.Width+1;
            B_Delete.Left       :=  B_Change.Left+B_Change.Width+1;
            ToolBar.Left        :=  B_Delete.Left+B_Delete.Width+2;
        end;
        3:  begin                                           // 要約B/S科目
            end;
        4:  begin                                           // 要約P/L科目
            end;
        5:  begin                                           // 固定変動科目
            end;
        6:  begin                                           // C/F科目
            B_Delete.Visible   := TRUE;                     // 削除
            MComboBox2.Visible := TRUE;                     // 種類ｺﾝﾎﾞ
            LComboBox2.Caption := '種類';
            LComboBox2.Visible := TRUE;

            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left+B_End.Width+1;
            B_Change.Left       :=  B_Print.Left+B_Print.Width+1;
            B_Delete.Left       :=  B_Change.Left+B_Change.Width+1;
            end;
        else exit;
    end;

end;

//-----------------------------------------------------------------------------
// F_ToolBtnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 付箋
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.F_ToolBtnClick(Sender: TObject);
begin

	ToolButton.ImageIndex := (Sender as TMenuItem).Tag;

end;

//-----------------------------------------------------------------------------
// fnCheckLicense() <002>
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.fnCheckLicense();
begin

    with MComboBox1 do
    begin
{
        Items.Clear();
        Items.Add('勘定科目');
        Items.Add('資金繰科目');
        Items.Add('タイトル科目');
        Items.Add('要約B/S科目');
        Items.Add('要約P/L科目');
        Items.Add('固定変動科目');
}
        // C/F科目についてはﾗｲｾﾝｽ情報を参照する
        if ( CheckModuleLicense ( m_Base_pRec, FXLicense.MAS_SHI ) ) then
            Items.Add('C/F科目');
    end;

end;

//-----------------------------------------------------------------------------
// fnGetGrants()
//      PARAM   :
//      RETURN  :
//      MEMO    : 権限取得<004>
//-----------------------------------------------------------------------------
procedure TJNTCRP009000f.fnGetGrants();
begin

    // 権限取得
    if not m_cJNTArea.FxPermission() then
    begin
		MjsMessageBox(Self,'権限の取得に失敗しました。', mjError, mjDefOk);
    end;

	//** 決算確定チェック*****************************************************
	//決算確定済みの場合、ﾒｯｾｰｼﾞが表示される                                 *
	//また、引数をTrueにしてﾒｿｯﾄﾞ内部で追加・変更・削除の各権限をFalseにする *
	//************************************************************************
	m_cJNTArea.IsKessan(True);		//<012>

    m_IsAppend  := m_cJNTArea.IsAppend;
    m_IsDelete  := m_cJNTArea.IsDelete;
    m_IsDisplay := m_cJNTArea.IsDisplay;
    m_IsModify  := m_cJNTArea.IsModify;
    m_IsPrint   := m_cJNTArea.IsPrint;

end;

end.


