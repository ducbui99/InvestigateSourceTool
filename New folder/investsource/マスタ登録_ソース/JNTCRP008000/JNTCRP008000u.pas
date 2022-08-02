//*****************************************************************************************************
//*
//*		Systeme			:   ＦＸ共通マスタ
//*		Program			:   銀行 (親画面)
//*		ProgramID		:	JNTCRP018000
//*		Name			:	飯塚健介(LEAD)
//*		Create			:   2005.03.24
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*
//*     History
//*     <ﾏｰｸ>       <修正者>        <修正日>        <修正内容>
//*     <FX00000>   M.Katsunuma     2005/03/16
//*     <FX00001>   M.Katsunuma     2005/03/17
//*     <FX00020>   M.Katsunuma     2005/04/21
//*     <FX00030>   飯塚健介(LEAD)  2005/05/31
//*     <001>       高橋功二(LEAD)  2005/08/19(FRI) JNTCommonを子に引き渡すように修正
//*     <002>       高橋功二(LEAD)  2005/08/19(FRI) m_CmpListのｸﾘｱを追加
//*     <003>       高橋功二(LEAD)  2005/08/19(FRI) m_CmpListの破棄をclear→freeへ変更
//*     <004>       茂木勇次(LEAD)  2005/09/28(WED) ｷｰの見直し。
//*     <005>   	広田(PRIME)     2005/10/17(MON) 終了処理対応
//*     <006>       加藤(PRIME)     2006/03/22(WED) <005>の不具合修正
//*     <007>       茂木勇次(LEAD)  2007/04/05(THU) ﾏｽﾀ同期で権限を強制的に無効にしている為
//*                                                 別処理でその権限が継承されるので、BPLをCall時に権限の再取得を行う
//*     <008>		渡邊 慎太郎(Lab)2007/07/02(MON)	共通マスタの決算確定対応
//*     <009>       鈴木(PRIME)     2007/08/02(THU) 銀行区分コンボを切り替えたときは、決算確定のメッセージを表示しないように修正
//*     <010>       鈴木(PRIME)     2007/08/03(FRI) 銀行区分コンボをキー操作で変更した際、エラーが発生しないように修正
//*		<011>       鈴木(PRIME)     2007/08/09(THU) 採用がなしの場合はメッセージを表示し、終了するようにする
//*		<012>		関(PRIME)		2008/02/18(MON)	ﾏｽﾀ更新履歴対応
//*     <LPH>       T.SATOH(IDC)    2010.05.21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//*     <013>       T.Ogawa(RIT)    2010/06/09(WED) 終了時に会社DBがクローズされていない不具合対応
//==============================Ver4.08/NX-Ⅰ5.01 修正 Start ==========================================
//      <Shift>     T.Ogawa(LEAD)   2012/02/08(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//==============================MLX 対応 Start ====================================================
//*		<MLXDEP>	岩田(NTC)		2013/01/15(TUE) MLX固定資産・リース対応
//*		<MLXHAP>	新保一馬		2013/01/25(Fri) MLX給与対応
//*		<MLXDEP2>	岩田(NTC)		2013/06/11(TUE) MLX固定資産・リース対応 ESCｷｰ 終了対応
//==============================↓H25.09 (Gali 4.11 / Gali NX-I 1.04 / MLX 1.02) ======================
//*     <TX26>      T.SATOH(GSOL)   2013/08/01(THU) H26消費税改正対応
//*		<CDCHG>	    新保一馬		2013/08/14(Wed) コード変更統合対応
//*****************************************************************************************************
unit JNTCRP008000u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, ComCtrls, VCL.ExtCtrls, Buttons, Db, FireDAC.Comp.Client, ToolWin, VCL.ImgList, Menus,
  dxTL, dxDBGrid, dxCntner, dxGrClms, dxmdaset,

  MJSLabel, MJSBitBtn, MJSPanel, MJSEdits, MJSSpeedButton, MJSRadioButton,
  MJSComboBox, MJSGroupBox, MJSCheckBox, MJSTab, MJSRadioGroup, MJSQuery,
  MJSFunctionBar, MJSSPFunctionBar, MJSStatusBar, MJSPageControl, MJSMemo,
  MJSToolBar,

  MJSCommonu, MjsDBModuleu, MjsDispCtrl, MjsStrCtrl, MjsDateCtrl, MJSPostCtrl,
  MjsMsgStdu, //CMNExpFuncU,
  MLBplLoaderU, // <LPH> ADD
  MJSKeyDataState,  //<Shift> ADD
  SeriesCheckU,//<MLXDEP>
  JNTMASComu, JNTCommonu, System.ImageList{<FX00000>};

  const
	WM_ONPAINT = WM_APP + 1;    // OnPaint 時の処理起動Message用
	WM_CANCEL  = WM_APP + 2;    //<MLXDEP2>

type
{$include ActionInterface.inc}

  ItemInfo = record
    ItemCode	    :   Integer;
	ItemName	    :   String;
  end;

  TJNTCRP008000IFunc = record
  	iOpCode			:	Integer;		// 処理ｺｰﾄﾞ
  	sCaption		:	String;			// ｷｬﾌﾟｼｮﾝ(ﾌｧﾝｸｼｮﾝ文字列)
  	sProg			:	String;			// Bpl名(xxxxxxxxx.Bpl)
  	bEnabled		:	Boolean;		// 有効･無効
  	bWndUV			:	Boolean;		// 選択ｳｨﾝﾄﾞｳ不可視化
  	iLevl			:	Integer;		// 指示Lebel(200,300)
  	iNumb			:	Integer;		// 指示順序(1～)
  	iMamaOpCode		:	Integer;		// 親処理コード
  	iBrotherCode	:	Integer;		// 他ﾓｰﾄﾞ識別ｺｰﾄﾞ
  	iType			:	Integer;		// 処理ﾓｰﾄﾞ
  	iMode			:	Integer;		// 処理動作
  	iStyl			:	Integer;		// 処理ｽﾀｲﾙ
    iParam          :   String;
  end;

  TJNTCRP008000f = class(TForm)
    BEnd: TMSpeedButton;
    BPrint: TMSpeedButton;
    BChange: TMSpeedButton;
    BIns: TMSpeedButton;
    BDelete: TMSpeedButton;
    BRowChange: TMSpeedButton;
    BDetails: TMSpeedButton;
    BSearch: TMSpeedButton;
	PPanel_ToolVar: TMPanel;
    PPanel_Header: TMPanel;
    PMPanelAp: TMPanel;
    LLabel_ECombo_Header: TMLabel;
    ECombo_Header: TMComboBox;
    FusenImageList: TImageList;
    imgFusenD: TImageList;
    FusenBar: TMToolBar;
    FusenButton: TToolButton;
    PopupMenu2: TPopupMenu;
    R1: TMenuItem;
    B1: TMenuItem;
    G1: TMenuItem;
    O1: TMenuItem;
    BTesuryo: TMSpeedButton;
    ImLst: TImageList;
    popNewFee: TPopupMenu;
    popitmStdFee: TMenuItem;
    popitmBankFee: TMenuItem;
    popitmFeeImp: TMenuItem;
    imgMenu: TImageList;
    tbNewFee: TMToolBar;
    BNewFee: TToolButton;
    BCodeChange: TMSpeedButton;

	procedure   FormCreate          (Sender: TObject);
	procedure   FormShow            (Sender: TObject);
	procedure   FormHide            (Sender: TObject);
	procedure   FormClose           (Sender: TObject; var Action: TCloseAction);
	procedure   FormCloseQuery      (Sender: TObject; var CanClose: Boolean);
	procedure   FormActivate        (Sender: TObject);
	procedure   EndProc             (Sender: TObject);
	procedure   BEndClick           (Sender: TObject);
	procedure   ECombo_HeaderChange (Sender: TObject);
	procedure   ECombo_HeaderKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   FormDestroy         (Sender: TObject);
// <004>    procedure BChangeClick  (Sender: TObject);
    procedure   EnterEvent          (Sender: TObject);
    procedure   BPrintClick         (Sender: TObject);
    procedure   fnChangeFusen       (Sender: TObject);

  private
	{ Private 宣言 }
    m_Base_pRec				:	^TMjsAppRecord;		// Bpl管理構造体
    m_Load_pRec				:	^TMjsAppRecord;		// Bpl管理構造体
    m_cJNTArea              :   TJNTCommon;         // FX00000
    ComArea			        :   TJNTMASCom;
    MDataModule		        :   TMDataModulef;
	m_AcControl		        :   TWinControl;
    m_IFunc                 :   TJNTCRP008000IFunc;
	m_bFirstFlag        	:   Boolean;			// 初期処理ﾌﾗｸﾞ
	m_bDspFlag	        	:   Boolean;			// 初期表示処理ﾌﾗｸﾞ
	m_bEndFlag	        	:   Boolean;			// 処理終了ﾌﾗｸﾞ
	m_bEndBtnFlag       	:   Boolean;			// 処理終了ﾎﾞﾀﾝﾌﾗｸﾞ
	m_bKousinBtn        	:   Boolean;			// 更新ﾌﾗｸﾞ
	giReferFlag		        :   Integer;			// 参照ﾌﾗｸﾞ
    m_CmpList		        :	TList;
    uvFormClose             :   Boolean;
    m_OpenForm              :   Integer;
    m_KEYFLG                :   Boolean;            // <004>

    m_IsAppend              :   Boolean;
    m_IsDelete              :   Boolean;
    m_IsDisplay             :   Boolean;
    m_IsModify              :   Boolean;
    m_IsPrint               :   Boolean;

    m_UseType               :   Integer;

    m_bKeyChangeFlg         :   Boolean;			// <010> ADD True = ｺﾝﾎﾞのChangeｲﾍﾞﾝﾄを回避
    												//			 False = ｺﾝﾎﾞのChangeｲﾍﾞﾝﾄ実行可能
// <011> ADD start
	m_cDBSelect			    : TFDConnection;
    m_bUseFlg				: Boolean;
    m_MjsMsgRec		        : TMJSMsgRec;
// <011> ADD end

	m_LEAflg		:	Boolean;	// <MLXDEP>True:リース資産管理
	m_HAPflg		:	Boolean;	// <MLXHAP>True:人事給与

	m_iRatio		:	Integer;	//<CDCHG>

	procedure   WMOnPaint           (var Msg: TMessage); message WM_ONPAINT;
    function    fnCallBPL           (pType : Integer): Boolean;		// <005>
    function    SetComponent        (): Pointer;
// <004>    procedure   fnChgBtnAction;                 // FX00030

	procedure   WMOnCancel           (var Msg: TMessage); message WM_CANCEL;

  public
	{ Public 宣言 }
	constructor CreateForm          (pRec: Pointer);
	procedure	CMChildKey          (var Msg: TWMKey); message CM_CHILDKEY;

    function    DoAction            (rFunc:TJNTCRP008000IFunc)	:	Boolean;
    function    BplLoad             (rFunc:TJNTCRP008000IFunc):Pointer;
    function    BplAction           (iAction : Integer; pRec: Pointer;pParam: Pointer=nil ) : Integer;
    procedure   ProcSelect          ();
    procedure   BplUnLoad           ();
    procedure   BplListUpdate       ();
    procedure   fnBtnMove           ();
    Procedure   fnBtnVisible        ();
    procedure   fnGetGrants         ();

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
{$include JNTConst.inc}

const
    // -------------------------------------------------------------------------
    // 情報区分
    // -------------------------------------------------------------------------
    ucSysCNT        =   2;
    ucSysKBN        :   array[0..2] of String  =   ('銀行補助',
                                                    '依頼先銀行',
                                                    '振込先銀行');
//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pParam: Pointer): Integer;
var
	pMyForm :	^TJNTCRP008000f;
	pRec    :	^TMjsAppRecord;
begin

	Result	:= ACTID_RET_OK;
	pRec	:= Pointer(TAppParam(pParam^).pRecord);

	case TAppParam(pParam^).iAction of
        // ---------------------------
        //	Form Create要求
        // ---------------------------
		ACTID_FORMCREATESTART:
		begin
			new (pMyForm);

			try
				pMyForm^ := TJNTCRP008000f.CreateForm(pRec);
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;

        // ---------------------------
        //	Form Create&Show要求
        // ---------------------------
		ACTID_FORMCREATESHOWSTART:
		begin
			new (pMyForm);
			try
				pMyForm^ := TJNTCRP008000f.CreateForm(pRec);
				pMyForm^.Show;
				pRec^.m_pChildForm := pMyForm;
			except
				Dispose(pMyForm);
				Result := ACTID_RET_NG;
			end;
		end;

        // ---------------------------
        //	Form Close要求
        // ---------------------------
		ACTID_FORMCLOSESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Close;
			pMyForm^.Free;
			Dispose(pMyForm);
		end;

        // ---------------------------
        //	Form CanClose要求
        // ---------------------------
		ACTID_FORMCANCLOSESTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			if ( pMyForm^.CloseQuery = FALSE ) then
				Result := ACTID_RET_NG;
		end;

        // ---------------------------
        //	Show要求
        // ---------------------------
		ACTID_SHOWSTART:
		begin
			pMyForm := Pointer(pRec^.m_pChildForm);
			pMyForm^.Show;
		end;

        // ---------------------------
        //	Hide要求
        // ---------------------------
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
constructor TJNTCRP008000f.CreateForm(pRec: Pointer);
var
    POwnerForm  :   ^TControl;
begin

	m_Base_pRec     :=  pRec;								        // 構造体のSave

    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
    m_cJNTArea.setMasAppRecord;                                     // 財務ﾎﾟｲﾝﾀ設定

//    fnGetGrants();  												// <011> DEL 採用がなしの場合にメッセージが出てしまうので
                                                                    //       決算確定メッセージをCreateイベントで呼ぶ

	MDataModule     :=  TMDataModulef(m_Base_pRec^.m_pDBModule^);	// DBModuleを取得
	ComArea		    :=  TJNTMASCom(m_Base_pRec^.m_pSystemArea^);	// ｼｽﾃﾑﾒﾓﾘ 取得
    m_CmpList       :=  TList.Create;
    uvFormClose     :=  FALSE;

    m_cDBSelect		:=  MDataModule.COPDBOpen (1, ComArea.m_iCopNo);// <011> ADD

	POwnerForm      :=  m_Base_pRec^.m_pOwnerForm;
    inherited Create( POwnerForm^ );

end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormCreate(Sender: TObject);
var
    iLoop   : Integer;
    dQuery : TMQuery;   					// <011> ADD
    iSysCNT: Integer;						//<MLXDEP>
begin

	m_bDspFlag		:=  FALSE;
	m_bEndFlag 		:=  FALSE;
	m_bEndBtnFlag 	:=  FALSE;
	m_bFirstFlag	:=  FALSE;
	m_bKousinBtn	:=  FALSE;
    m_KEYFLG        :=  FALSE;  // <004>
    m_UseType       :=  -1;     // <005>

    m_bKeyChangeFlg :=  FALSE;  // <010> ADD ｺﾝﾎﾞのChangeｲﾍﾞﾝﾄ実行可能

	Parent  :=  TPanel(m_Base_pRec^.m_pOwnerPanel^);    // 親ﾊﾟﾈﾙをParent
	Align   :=  alClient;								// 全領域を作成

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MjsColorChange(TJNTCRP008000f(Self),
				   ComArea.SystemArea.SysColorB,
				   ComArea.SystemArea.SysColorD,
				   ComArea.SystemArea.SysBaseColorB,
				   ComArea.SystemArea.SysBaseColorD,
				   rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysFocusColor
				  );

//<CDCHG>	MjsFontResize( TJNTCRP008000f(Self), Pointer(m_Base_pRec) );
	m_iRatio := MjsFontResize( TJNTCRP008000f(Self), Pointer(m_Base_pRec) ); //<CDCHG>

    // 初期ﾌｫｰｶｽ 設定
	m_AcControl := ECombo_Header;

	JNTMasAccelCharCancel(Self);

//↓<MLXDEP>
	//初期化
	m_LEAflg	:= False;
	m_HAPflg	:= False; //<MLXHAP>

	//リース資産
	if	0 <> MjsHanPos('LEA', m_Base_pRec^.m_sParameter) then
	begin
		m_LEAflg := True;
	end
//<MLXHAP>↓
	//給与大将
	else if	0 <> MjsHanPos('HAP', m_Base_pRec^.m_sParameter) then
	begin
		m_HAPflg := True;
	end;
//<MLXHAP>↑

	iSysCNT := ucSysCNT;
//<MLXHAP>	m_bFirstFlag := True;
//↓<MLXHAP>
	// MLXリースではFormShowのECombo_HeaderChangeで銀行補助の画面を表示するために、m_bFirstFlag=Trueにする。
	// MLX給与ではここでTrueにしてしまうと、WMOnPaintで、コンボが開いた状態にならない。
	if m_LEAflg then
	begin
		m_bFirstFlag := True;
	end;
//↑<MLXHAP>

	if (m_LEAflg) then
		iSysCNT := 0;
//↑<MLXDEP>

    // 情報区分Comboの作成
//  for iLoop := 0 to ucSysCNT do	//<MLXDEP>
{↓<MLXHAP>
  	for iLoop := 0 to iSysCNT do	//<MLXDEP>
        ECombo_Header.Items.Add(ucSysKBN[iLoop]);
↑<MLXHAP>}
//↓<MLXHAP>
	if m_HAPflg then
	begin
		// MLX給与は1からiSysCNTまでを生成。
		for iLoop := 1 to iSysCNT do
			ECombo_Header.Items.Add(ucSysKBN[iLoop]);
	end
	else
	begin
		// MLX給与以外は先頭からiSysCNTまでを生成。
		for iLoop := 0 to iSysCNT do	//<MLXDEP>
			ECombo_Header.Items.Add(ucSysKBN[iLoop]);
	end;
//↑<MLXHAP>

    ECombo_Header.ItemIndex :=  0;

//↓<MLXDEP>
	if (m_LEAflg) then
	    ECombo_Header.Enabled := False;
//↑<MLXDEP>

// <011> ADD start
	m_bUseFlg := True;

   	dQuery := TMQuery.Create(Self);
 	MDataModule.SetDBInfoToQuery(m_cDBSelect, dQuery);

    with dQuery do   						// MasterInfoから銀行の採用情報を取得
    begin
    	Close;
   		SQL.Clear;
       	SQL.Add('Select UseKbn'				+
   				' From MasterInfo'			+
           	 	' Where MasterKbn = 21');
        if not Open() then
        begin

        	ComArea.m_MsgStd.GetMsgDB(m_MjsMsgRec,dQuery);
        	MjsMessageBoxEx(Self, m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,	m_MjsMsgRec.icontype,
 							m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MJsMsgRec.LogType);
          	dQuery.Close();
            dQuery.Free();

           	Exit;
        end;
                                           	// 採用なしの場合
        if GetFld('UseKbn').AsInteger = 0 then
        begin
           	m_bUseFlg := False;
        end;

        dQuery.Close();
        dQuery.Free();
    end;

    if m_bUseFlg then						// 採用ありの場合は決算確定のチェックをしメッセージを表示する
    begin
    	fnGetGrants();
    end;
// <011> ADD end

    // ｲﾍﾞﾝﾄOnCreateの最後に
	PostMessage(Self.Handle, WM_ONPAINT, 0, 0);

end;

//-----------------------------------------------------------------------------
// WMOnPaint()
//      PARAM   : Msg: TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.WMOnPaint(var Msg: TMessage);
var
	strMsg : String;  						// <011> ADD
begin
// <011> ADD start
	if not m_bUseFlg then   				// 採用なしの場合はメッセージを表示し、終了する
    begin
     	ComArea.m_MsgStd.GetMsg(m_MjsMsgRec, 30, 10);

		strMsg := ComArea.m_MsgStd.MsgChange(m_MjsMsgRec.sMsg,'@_@','銀行');

		MJSMessageBoxEx(Self, strMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
						m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		Self.Close();
    end;
// <011> ADD end


    // 初期のみ一回の処理
//<MLXDEP>
//	if ( m_bFirstFlag = false )  then
	if ( m_bFirstFlag = false ) and ( m_LEAflg = False) then
//<MLXDEP>
	begin
		if ( m_AcControl = ECombo_Header ) then
    	begin
            // 情報区分(ECombo_Header)を開く
// <004>            m_AcControl.SetFocus();
			ECombo_Header.DroppedDown   :=  TRUE;
			m_bFirstFlag                :=  TRUE;
	    end;
    end;

end;


//-----------------------------------------------------------------------------
// WMOnPaint()
//      PARAM   : Msg: TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.WMOnCancel(var Msg: TMessage);
begin

	Close;
    Abort;

end;


//-----------------------------------------------------------------------------
// FormShow()
//	< 表示処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormShow(Sender: TObject);
begin
//↓<MLXDEP>
	if m_bUseFlg = False then
	begin
		Exit;
	end;
//↑<MLXDEP>

	JNTMasSetCaption( m_Base_pRec );
	MJSBtnVisible( TJNTCRP008000f(Self), TRUE );
    fnBtnVisible();

//↓<MLXDEP>
	if (m_LEAflg) then
	begin

		LLabel_ECombo_Header.Visible := False;
//<MLXDEP2>
//		LLabel_ECombo_Header.Visible := False;
//      ECombo_Header.Visible := False;

        ECombo_Header.Visible := True;	//<MLXDEP2>
        ECombo_Header.Enabled := True;  //<MLXDEP2>
	    ECombo_Header.Left 	  := -2000;	//画面外へ移動	//<MLXDEP2>

//<MLXDEP2>
    	ECombo_HeaderChange(Sender)
	end
	else
	    m_AcControl.SetFocus(); // <004>

    //m_AcControl.SetFocus(); // <004>
//↑<MLXDEP>

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ハイド処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormHide(Sender: TObject);
begin

	MJSBtnVisible( TJNTCRP008000f(Self), FALSE );

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑｸﾛｰｽﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam :   TAppParam;
begin

    // 呼び出しBPLがある場合、終了命令を送信
    if ( m_Load_pRec <> nil ) then
    begin
       	if ( m_Load_pRec^.m_hChildBpl <> 0 ) then
	    begin
		    BplAction( ACTID_FORMCLOSESTART, m_Load_pRec );
            BplListUpdate();
    	end;
	end;

    m_cJNTArea.Free;

	m_Base_pRec^.m_iDelete      :=  1;
	wkParam.iAction			    :=  ACTID_FORMCLOSEEND;	        // 呼び出し区分 設定
	wkParam.pRecord			    :=  Pointer(m_Base_pRec);		// 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	    :=  nil;					    // 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);	    // 親を呼び出す!!

	Action := caFree;

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//	< 破棄処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormDestroy(Sender: TObject);
begin

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
        BplListUpdate();	//	Bplﾘｽﾄの整理
    end;

    m_CmpList.Free;         // <003>

//<013> ADD St
    // DBをクローズ
    if m_cDBSelect <> nil then
    begin
        MDataModule.COPDBClose(m_cDBSelect);
    end;
//<013> ADD Ed

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< 終了前処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

	if ( m_bEndFlag = TRUE ) then
		Exit;

	// <005> -->
    // 終了可能か問い合わせ送信
    if ( m_Load_pRec <> nil ) then
    begin
       	if ( m_Load_pRec^.m_hChildBpl <> 0 ) then
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

    // 更新直後 or 参照 or 表示しないうちに終了した時 Exit
    if ( m_bKousinBtn = FALSE ) or
       ( giReferFlag  = REFER ) or
       ( m_bDspFlag   = FALSE ) then
    begin
//        MDataModule.COPDBClose(m_cDBSelect);  //<013> ADD
        // 終了ﾌﾗｸﾞON
        m_bEndFlag  :=  TRUE;
        CanClose    :=  TRUE;
        Exit;
    end;
	// <005> <--

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.FormActivate(Sender: TObject);
var
    wkParam :   TAppParam;
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
procedure TJNTCRP008000f.EndProc(Sender: TObject);
begin

	Close();

end;

//-----------------------------------------------------------------------------
// EnterEvent()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : OnEnterの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.EnterEvent(Sender: TObject);
begin

	m_AcControl := Screen.ActiveControl;

//<MLXDEP2>
	if (m_LEAflg) and (m_AcControl = ECombo_Header) then
		PostMessage(Self.Handle, WM_CANCEL, 0, 0);
//<MLXDEP2>

    // 切出≪＝≫埋込
//    if ( m_bBtnChange = FALSE ) then
//       	Exit;

end;

//-----------------------------------------------------------------------------
// BEndClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : BSpeed_ToolBar_End ( TMSpeedButton ) OnClick
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.BEndClick(Sender: TObject);
begin

    // 終了確認ﾌﾗｸﾞを初期化する
    uvFormClose :=  FALSE;

    // 子BPLが起動中の場合、子のCloseを起動する
    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放

        // 子BPLのClose命令が拒否された場合はExitする
        if ( uvFormClose = FALSE ) then Exit;

        BplListUpdate();	//	Bplﾘｽﾄの整理
    end;

	// 表示しないうちに終了した時 or 参照ﾓｰﾄﾞ
	if ( m_bDspFlag = FALSE ) or ( giReferFlag = REFER ) then
    begin
		EndProc(Sender);
    	Exit;
    end;

	m_bEndBtnFlag := TRUE;

	EndProc(Sender);

end;

//-----------------------------------------------------------------------------
// ECombo_HeaderChange()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ECombo_Heade OnChange
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.ECombo_HeaderChange(Sender: TObject);
//var
//	iSelectInfo :   Integer;
begin

// <010> ADD start
	if m_bKeyChangeFlg then   				// ｷｰ操作でｺﾝﾎﾞを変更した場合はExitする
    begin
    	Exit;
    end;
// <010> ADD end

    if ( m_bFirstFlag = FALSE ) then Exit;

// <004>    if ( ECombo_Header.DroppedDown = TRUE ) then Exit;

// <005>    if ( iSelectInfo <> ECombo_Header.ItemIndex ) then
// <005>    begin

// <005>    	iSelectInfo := ECombo_Header.ItemIndex;

// <004>        if ( m_bEndBtnFlag = FALSE ) then
        // ﾏｳｽｸﾘｯｸ時の補足<004>
        if ( m_bEndBtnFlag = FALSE ) and ( m_KEYFLG = FALSE) then
        begin
            // 各種BPLを呼び出す
            if ECombo_Header.ItemIndex <> m_UseType then
			// <005> -->
			begin
                if (not fnCallBPL(ECombo_Header.ItemIndex)) then	// 終了拒否
                begin
	                if m_UseType <> -1 then
    	            begin
                    	// 元に戻す
	    	            ECombo_Header.ItemIndex := m_UseType;
	        	        ECombo_Header.Text := ECombo_Header.ColumnText(m_UseType);
					end;
                end;
            end
			// <005> -->
            else
            begin
           		MjsDispCtrl.MjsNextCtrl (Self);
                abort;
            end;
        end;
// <005>    end;

    // ｷｰが押下された場合にm_KEYFLGを初期化する<004>
    if ( m_KEYFLG = TRUE ) then
        m_KEYFLG    :=  FALSE;

end;

//-----------------------------------------------------------------------------
// fnCallBPL()
//      PARAM   : pType     情報区分
//      RETURN  :
//      MEMO    : BPLの呼出
//-----------------------------------------------------------------------------
function TJNTCRP008000f.fnCallBPL(pType : Integer): Boolean;                    // <005>
var
    lvBplName   :   String;
    lvParam     :   String;
begin
	Result := True;																// <005>

    lvBplName   :=  '';
    lvParam     :=  '';

    // 終了確認ﾌﾗｸﾞを初期化する													// <005>
    uvFormClose :=  FALSE;														// <005>

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
		// <005> -->
        // 子BPLのClose命令が拒否された場合はExitする
        if ( uvFormClose = FALSE ) then
        begin
			Result := False;
	        Exit;
        end;
		// <005> <--
        BplListUpdate();	//	Bplﾘｽﾄの整理
	end;
{↓<MLXHAP>
    case pType of
        0:  lvBplName   :=  'JNTCRP008001.bpl';    // 銀行補助
        1:  lvBplName   :=  'JNTCRP008002.bpl';    // 依頼先銀行
        2:  lvBplName   :=  'JNTCRP008003.bpl';    // 振込先銀行
    end;
↑<MLXHAP>}
//↓<MLXHAP>
	if not m_HAPflg then
	begin
		// MLX給与でないとき。
	    case pType of
	        0:  lvBplName   :=  'JNTCRP008001.bpl';    // 銀行補助
	        1:  lvBplName   :=  'JNTCRP008002.bpl';    // 依頼先銀行
	        2:  lvBplName   :=  'JNTCRP008003.bpl';    // 振込先銀行
	    end;
	end
	else
	begin
		// MLX給与のときは、先頭コンボの銀行補助がなく、上に詰まっているので、変換。
	    case pType of
	        0:  lvBplName   :=  'JNTCRP008002.bpl';    // 依頼先銀行
	        1:  lvBplName   :=  'JNTCRP008003.bpl';    // 振込先銀行
	    end;
	end;
//↑<MLXHAP>
    m_UseType := pType;

// <009> DEL start
//    fnGetGrants();  // 権限の再取得<007>
// <009> DEL end

    m_IFunc.iOpCode := 1;
    m_IFunc.sProg   := lvBplName;
    m_IFunc.iParam  := lvParam;
    DoAction(m_IFunc);

end;

//-----------------------------------------------------------------------------
// ECombo_HeaderKeyDown()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//                Key   : key情報
//                Shift : Shift情報
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.ECombo_HeaderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{

    // ﾘｽﾄ内でEnter,Tabの場合は次へ移動
	if (( Key=VK_TAB    ) and ( Shift=[] )) or
	   (( Key=VK_RETURN ) and ( Shift=[] )) then
	begin
        // 各種BPLを呼出す
        if ( m_bEndBtnFlag = FALSE ) then
            fnCallBPL(ECombo_Header.ItemIndex);
		Abort;
	end;

} // CM_Childkeyで呼ばれる為、KeyDownは不要
end;

//-----------------------------------------------------------------------------
// CMChildKey()
//      PARAM   : Msg	: TWMKey
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin

	if ( GetKeyState(VK_MENU) < 0 ) then
		Exit;

//<Shift> DEL	sShift      :=  KeyDataToShiftState(Msg.KeyData);		// Shiftｷｰの取得
	sShift      :=  MJSKeyDataToShiftState(Msg.KeyData);		// Shiftｷｰの取得  <Shift> ADD
	twAcCtrl    :=  Screen.ActiveControl;
	// 051021 hirota >>
    if twAcCtrl.Name = 'ECombo_Header' then
	    m_KEYFLG    :=  TRUE;
	// 051021 hirota <<

	if ( twAcCtrl is TSelectStrGrid ) then				// TMNumEditのItemsが開いている？
		Exit;

    // 情報区分（ECombo_Header）での Shift+Tab,↑,←処理は禁止
   	if (twAcCtrl = ECombo_Header) then
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then 		// End & Esc
		begin
        	if (not ECombo_Header.DroppedDown) then				// 051124 >>
            begin
				Close ();
				Abort;
// <006>↓
{            end
            else
            begin
               	// 元に戻す
				ECombo_Header.DroppedDown := False;
   	            ECombo_Header.ItemIndex := m_UseType;

       	        ECombo_Header.Text := ECombo_Header.ColumnText(m_UseType);

				Abort;
}// <006>↑
            end;												// 051124 <<
		end;

		// ↑,↓処理
		if (( Msg.CharCode = VK_UP   ) and ( sShift = [] )) or
		   (( Msg.CharCode = VK_DOWN ) and ( sShift = [] )) then
		begin
			Exit;
		end;

		// TAB,Enter,→処理
// <004>		if (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
// <004>		   (( Msg.CharCode = VK_RETURN ) and ( sShift = [] )) or
// <004>		   (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then

//        if (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
//           (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then  Abort;  // <004>


        // <005>    ----- ←→ -----
        if (( Msg.CharCode = VK_RIGHT ) and ( sShift = [] )) or
           (( Msg.CharCode = VK_LEFT  ) and ( sShift = [] )) then       Abort;

		// <005>    ----- Shift+Tab -----
		if (( Msg.CharCode = VK_TAB  ) and ( sShift =[ssShift] )) then  Abort;

        // <005>    ----- Return Or Tab -----
        if (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
           (( Msg.CharCode = VK_RETURN ) and ( sShift = [] )) then // <004>
		begin
            // 各種BPLを呼出す
            if ( m_bEndBtnFlag = FALSE ) then
            begin
                m_KEYFLG        :=  FALSE;  // <004>
                // 各種BPLを呼び出す
                if ECombo_Header.ItemIndex <> m_UseType then
				// <005> -->
				begin

                	m_bKeyChangeFlg := True; // <010> ADD ｺﾝﾎﾞのChangeｲﾍﾞﾝﾄ回避

        	        if (not fnCallBPL(ECombo_Header.ItemIndex)) then	// 終了拒否
            	    begin
	              	    if m_UseType <> -1 then
    	            	begin
                  		// 元に戻す
		    	            ECombo_Header.ItemIndex := m_UseType;
		          	        ECombo_Header.Text := ECombo_Header.ColumnText(m_UseType);
				  		end;
            	    end;
                    m_bKeyChangeFlg := False;// <010> ADD ｺﾝﾎﾞのChangeｲﾍﾞﾝﾄ実行可能
	            end
				// <005> -->
                else
                begin
               		MjsDispCtrl.MjsNextCtrl (Self);
                    abort;
                end;
            end;
        end;

	end;

	inherited;

end;

//-----------------------------------------------------------------------------
// DoAction()
//      PARAM   : rFunc
//      RETURN  :
//      MEMO    : ﾌﾟﾛｸﾞﾗﾑを呼出
//-----------------------------------------------------------------------------
function TJNTCRP008000f.DoAction(rFunc:TJNTCRP008000IFunc)	:	Boolean;
begin

    Result  :=  FALSE;

    // BPLのﾛｰﾄﾞ
    m_Load_pRec := BplLoad(rFunc);

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
function TJNTCRP008000f.BplLoad(rFunc:TJNTCRP008000IFunc):Pointer;
var
	pRec		:	^TMjsAppRecord;
	sBplPath	:	String;
begin

	// ﾊﾟﾗﾒｰﾀ作成
	new( pRec );
	pRec^					:= m_Base_pRec^;
//	pRec^.m_iProgramCode	:= rFunc.iOpCode;				// iApNo;	// <012> del
	pRec^.m_iDelete			:= 0;							// 削除ﾌﾗｸﾞ
    pRec^.m_sParameter      := rFunc.iParam;

	Result  :=  nil;

    // BPLのﾊﾟｽを取得
	sBplPath	:=	rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysRoot+'\'+
					TJNTMASCom(m_Base_pRec^.m_pSystemArea^).SystemArea.SysPrefix+'\prg\'+
					rFunc.sProg;

	try
        // ﾊﾟｯｹｰｼﾞのﾛｰﾄﾞ
// <LPH> MOD-STR
//		pRec^.m_hChildBpl		:= LoadPackage( sBplPath );
		pRec^.m_hChildBpl		:= LoadPackageHelper( sBplPath );
// <LPH> MOD-END
	except
		Dispose( pRec );
		exit;
	end;

	// Export関数ｱﾄﾞﾚｽの取得
	pRec^.m_pChildEntry	:= GetProcAddress( pRec^.m_hChildBpl, 'AppEntry' );

	if ( @pRec^.m_pChildEntry = nil ) then
	begin
// <LPH> MOD-STR
//		UnLoadPackage( pRec^.m_hChildBpl );
		UnLoadPackageHelper( pRec^.m_hChildBpl );
// <LPH> MOD-END
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
// <LPH> MOD-STR
//		UnLoadPackage( pRec^.m_hChildBpl );
		UnLoadPackageHelper( pRec^.m_hChildBpl );
// <LPH> MOD-END
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
//      MEMO    : BplAction処理
//-----------------------------------------------------------------------------
function TJNTCRP008000f.BplAction( iAction : Integer; pRec: Pointer;pParam: Pointer=nil ) : Integer;
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
procedure TJNTCRP008000f.ProcSelect;
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
procedure TJNTCRP008000f.BplUnLoad;
begin

   	if ( m_Load_pRec^.m_hChildBpl <> 0 ) then
	begin
		// 要求拒否
		if ( BplAction( ACTID_FORMCANCLOSESTART, m_Load_pRec ) <> ACTID_RET_OK ) then
		begin
            // 終了ﾌﾗｸﾞをOFFにする
            uvFormClose :=  FALSE;
			//	以降処理しない
			Exit;
		end;

        // 終了ﾌﾗｸﾞをONにする
        uvFormClose :=  TRUE;

		BplAction( ACTID_FORMCLOSESTART, m_Load_pRec );
	end;

end;

//-----------------------------------------------------------------------------
// BplListUpdate()
//      PARAM   :
//      RETURN  :
//      MEMO    : Bplリストの整理（削除指定されているBplをFree）
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.BplListUpdate();
begin

	if ( m_Load_pRec^.m_hChildBpl <> 0 ) and ( m_Load_pRec^.m_iDelete = 1 ) then
	begin
// <LPH> MOD-STR
//		UnloadPackage( m_Load_pRec^.m_hChildBpl );
		UnloadPackageHelper( m_Load_pRec^.m_hChildBpl );
// <LPH> MOD-END
		Dispose( m_Load_pRec );
        m_Load_pRec :=  nil;
	end;

end;
{
//-----------------------------------------------------------------------------
// BSpeed_ToolBar_ChangeClick()
//      PARAM   : Sender : TObject
//      RETURN  :
//      MEMO    : 切り出し・埋め込み
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    iAction : Integer;

    lvRect: TRect;
    lvWidth, lvHeight: Integer;
begin

    //2005-05-30切込み・埋込み不具合対応済み inoue
    m_bBtnChange := FALSE;
    if  (BChange.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGINEND;            //  格納通知
        BChange.Caption := '切出(&G)';                          // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
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
        wkParam.iAction      :=  ACTID_DOCKINGOUTEND;           //  取出通知
        BChange.Caption := '埋込(&G)';                          // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=    Pointer(m_Base_pRec);         // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                          // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := TRUE;

end;
}

//-----------------------------------------------------------------------------
// BPrintClick()
//      PARAM   : Sender : TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 印刷ボタンクリック
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.BPrintClick(Sender: TObject);
begin

    if ( m_Load_pRec <> nil ) then
        BplAction( ACTID_FREESTART + 1, m_Load_pRec );

end;

//-----------------------------------------------------------------------------
// SetComponent()
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP008000f.SetComponent : Pointer;
begin

    // ﾎﾞﾀﾝの使用不可設定
    BIns.Visible        :=  FALSE;  //  挿入
    BDelete.Visible     :=  FALSE;  //  削除
    BDetails.Visible    :=  FALSE;  //  詳細
    BRowChange.Visible  :=  FALSE;  //  並び替え
    BSearch.Visible     :=  FALSE;  //  検索
    BTesuryo.Visible    :=  FALSE;  //  標準手数料
    tbNewFee.Visible    :=  FALSE;  //  新手数料 <TX26> ADD
    FusenBar.Visible    :=  FALSE;  //  付箋
    BCodeChange.Visible	:=  FALSE;  //  ｺｰﾄﾞ変更 <CDCHG>

    // ﾎﾞﾀﾝのﾎﾟｲﾝﾀ設定
    m_CmpList.Clear;                // ﾘｽﾄのｸﾘｱ　<003>
	m_CmpList.Add(@BPrint);         // 印刷         (0)
    m_CmpList.Add(@BIns);           // 挿入         (1)
    m_CmpList.Add(@BDelete);        // 削除         (2)
    m_CmpList.Add(@BDetails);       // 詳細         (3)
    m_CmpList.Add(@BRowChange);     // 並び替え     (4)
    m_CmpList.Add(@BSearch);        // 検索         (5)
    m_CmpList.Add(@BTesuryo);       // 標準手数料   (6)
    m_CmpList.Add(@FusenButton);    // 付箋         (7)
    m_CmpList.Add(@ECombo_Header);  // 処理選択     (8)
	m_CmpList.Add(@m_cJNTArea);     // JNTCommon    (9) <001>
    m_CmpList.Add(@m_Base_pRec);    //              (10)
    m_CmpList.Add(@BChange);        // 切り埋め     (11)
// <TX26> ADD-STR
    m_CmpList.Add(@popitmStdFee);   // 新手数料標準 (12)
    m_CmpList.Add(@popitmBankFee);  // 新手数料登録 (13)
    m_CmpList.Add(@popitmFeeImp);   // 新手数料取込 (14)
// <TX26> ADD-END
    m_CmpList.Add(@BCodeChange);	// ｺｰﾄﾞ変更     (15) <CDCHG>

    // ﾎﾞﾀﾝの使用可設定
{↓<MLXHAP>
    case ECombo_Header.ItemIndex of
        0:m_OpenForm := 1;
        1:m_OpenForm := 2;
        2:m_OpenForm := 3;
    end;
↑<MLXHAP>}
//↓<MLXHAP>
	if not m_HAPflg then
	begin
		// MLX給与でないとき。
	    case ECombo_Header.ItemIndex of
	        0:m_OpenForm := 1;
	        1:m_OpenForm := 2;
	        2:m_OpenForm := 3;
	    end;
	end
	else
	begin
		// MLX給与のときは、先頭コンボの銀行補助がなく、上に詰まっているので、変換。
	    case ECombo_Header.ItemIndex of
	        0:m_OpenForm := 2; // 依頼先銀行
	        1:m_OpenForm := 3; // 振込先銀行
	    end;
	end;
//↑<MLXHAP>
    fnBtnVisible();
    fnBtnMove();
	Result := Pointer( @m_CmpList );

end;

{
//-----------------------------------------------------------------------------
// fnChgBtnAction() <11>
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.fnChgBtnAction;
var
    AppPrm              : TAppParam;
    lvRect              : TRect;
    lvWidth, lvHeight   : Integer;
    lvBit               : TBitMap;
begin
    m_bBtnChange := FALSE;
//    lvBit       :=  TBitMap.Create;

    if  (BChange.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        AppPrm.iAction      :=  ACTID_DOCKINGINEND;         //  格納通知
        // 画面を埋込む

        BChange.Caption := '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
//        ImLst.GetBitmap(0,lvBit);
    end
    else
    begin
		Visible     :=	FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect      := Self.ClientRect;
        lvWidth     := lvRect.Right - lvRect.Left;
        lvHeight    := lvRect.Bottom - lvRect.Top;

        // 画面を切出す
        ClientWidth  :=  lvWidth;
        ClientHeight :=  lvHeight;
		Visible		 :=	TRUE;

        // 親画面への設定
        AppPrm.iAction      :=  ACTID_DOCKINGOUTEND;        //  取出通知
        BChange.Caption := '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
//        ImLst.GetBitmap(1,lvBit);
    end;
//    BChange.Glyph  :=  lvBit;

    AppPrm.pRecord         :=    Pointer(m_Base_pRec);        // 管理構造体ﾎﾟｲﾝﾀ設定
    AppPrm.pActionParam    :=    nil;                         // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@AppPrm);
    m_bBtnChange := TRUE;
end;
} //<004>

//-----------------------------------------------------------------------------
// fnBtnVisible
//      Show時のMJSBtnVisibleで表示されたﾎﾞﾀﾝを再度非表示にする
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.fnBtnVisible;
begin

    BIns.Visible        :=  FALSE;  //  挿入
    BDelete.Visible     :=  FALSE;  //  削除
    BDetails.Visible    :=  FALSE;  //  詳細
    BRowChange.Visible  :=  FALSE;  //  並び替え
    BSearch.Visible     :=  FALSE;  //  検索
    BTesuryo.Visible    :=  FALSE;  //  標準手数料
    tbNewFee.Visible    :=  FALSE;  //  新手数料 <TX26> ADD
    FusenBar.Visible    :=  FALSE;  //  付箋
    BCodeChange.Visible	:=  FALSE;  //  ｺｰﾄﾞ変更<CDCHG>

    case m_OpenForm of
        1:
        begin

			if (m_LEAflg) then 			//<MLXDEP>
			begin
	            BDelete.Visible     :=  TRUE;   //  削除
	            FusenBar.Visible    :=  TRUE;   //  付箋
			end else begin                  //<MLXDEP>
            	BDelete.Visible     :=  TRUE;   //  削除
	            BDetails.Visible    :=  TRUE;   //  詳細
    	        BRowChange.Visible  :=  TRUE;   //  並び替え
        	    BSearch.Visible     :=  TRUE;   //  検索
            	FusenBar.Visible    :=  TRUE;   //  付箋
			end;                            //<MLXDEP>
        end;
        //  依頼先
        2:
        begin
            BDelete.Visible     :=  TRUE;   //  削除
            BDetails.Visible    :=  TRUE;   //  詳細
//<MLXHAP>  BTesuryo.Visible    :=  TRUE;   //  標準手数料
//↓<MLXHAP>
			// 標準手数料
			if m_HAPflg then
			begin
				BTesuryo.Visible	:= False; // MLX給与は非表示
                tbNewFee.Visible    := False; //  新手数料 <TX26> ADD
			end
			else
			begin
				BTesuryo.Visible	:= True; // MLX給与以外は表示
                tbNewFee.Visible    := True; // 新手数料 <TX26> ADD
			end;
//↑<MLXHAP>
//↓<CDCHG>
		    BCodeChange.Visible	:=  True;  	//  ｺｰﾄﾞ変更
            BCodeChange.Caption	:= '銀行ｺｰﾄﾞ変更(&M)';
            BCodeChange.Width	:= Trunc(127 * m_iRatio / 100);
//↑<CDCHG>
        end;
        //  振込先銀行
        3:
        begin
            BIns.Visible        :=  TRUE;   //  挿入
            BDelete.Visible     :=  TRUE;   //  削除
//↓<CDCHG>
		    BCodeChange.Visible	:=  True;  	//  ｺｰﾄﾞ変更
            BCodeChange.Caption	:= 'ｺｰﾄﾞ変更(&M)';
            BCodeChange.Width	:= Trunc(100 * m_iRatio / 100);
//↑<CDCHG>
        end;

    end;

end;

//-----------------------------------------------------------------------------
// fnBtnMove
//      TMSpeedBtnを←に寄せる
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.fnBtnMove;
var
    lvBtnCount  :   Integer;
    lvSpdBtnName:   String;
    lvSpdBtn    :   TMSpeedButton;
    i           :   Integer;
    iLeft       :   Integer;
begin

// <TX26> MOD-STR
//  lvBtnCount := 9;
//<CDCHG>lvBtnCount := 10;
    lvBtnCount := 11; //<CDCHG>
// <TX26> MOD-END
    iLeft      := 0;

    for i := 1 to lvBtnCount do
    begin
        lvSpdBtn := nil;
        case i of
            1: lvSpdBtnName := 'BEnd';
            2: lvSpdBtnName := 'BPrint';
            3: lvSpdBtnName := 'BChange';
            4: lvSpdBtnName := 'BIns';
            5: lvSpdBtnName := 'BDelete';
            6: lvSpdBtnName := 'BDetails';
            7: lvSpdBtnName := 'BRowChange';
            8: lvSpdBtnName := 'BSearch';
            9: lvSpdBtnName := 'BTesuryo';
           10: lvSpdBtnName := 'tbNewFee';  // 新手数料 <TX26> ADD
           11: lvSpdBtnName := 'BCodeChange';	// ｺｰﾄﾞ変更 <CDCHG>
        end;

        lvSpdBtn  := TMSpeedButton(MJSFindCtrl (Self, lvSpdBtnName));

        if ( lvSpdBtn <> nil ) then
        begin
            if ( i = 1 ) then
                iLeft   := lvSpdBtn.Left;

            if ( lvSpdBtn.Visible = TRUE ) then
            begin
                lvSpdBtn.Left       :=  iLeft;
                iLeft               :=  iLeft + lvSpdBtn.Width;
                // 子のEnabledを引き継ぐのを回避
                lvSpdBtn.Enabled    :=  TRUE;
            end;
        end;
    end;

    FusenBar.Left := iLeft;

end;

//-----------------------------------------------------------------------------
// fnChangeFusen
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.fnChangeFusen(Sender: TObject);
begin

	FusenButton.ImageIndex := (Sender as TMenuItem).Tag;

end;

//-----------------------------------------------------------------------------
// fnGetGrants()
//      PARAM   :
//      RETURN  :
//      MEMO    : 権限取得
//-----------------------------------------------------------------------------
procedure TJNTCRP008000f.fnGetGrants();
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
	m_cJNTArea.IsKessan(True);		//<008>

    m_IsAppend  := m_cJNTArea.IsAppend;
    m_IsDelete  := m_cJNTArea.IsDelete;
    m_IsDisplay := m_cJNTArea.IsDisplay;
    m_IsModify  := m_cJNTArea.IsModify;
    m_IsPrint   := m_cJNTArea.IsPrint;

end;

end.


