//=============================================================================
//
//      システム名  ：ＭｊｓＬｉｎｋ ＦＸ
//      処理名      ：取引先登録　（親画面）
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上 佳美(LEAD)
//      作成日      ：2005.02.04(FRI)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <   >   茂木 勇次(LEAD) 2005/04/21(THU) FX-STYLE対応("FX_"削除)
//  <   >   茂木 勇次(LEAD) 2005/04/21(THU) JNTﾗｲﾌﾞﾗﾘ対応
//  <100>   井上 佳美(LEAD) 2005/07/27(WED) 権限機能を追加
//  <101>   高橋 功二(LEAD) 2005/08/12(FRI) JNTCommonを子に引き渡すように修正
//  <102>   高橋 功二(LEAD) 2005/08/19(FRI) m_CmpListのｸﾘｱを追加
//  <103>   高橋 功二(LEAD) 2005/08/19(FRI) m_CmpListの破棄をclear→freeへ変更
//  <104>   高橋 功二(LEAD) 2005/08/24(WED) TMJSAppRecordを子に引き渡すように修正
//  <105>   高橋 功二(LEAD) 2005/09/19(MON) 「並び替え」ﾎﾞﾀﾝを一時的に使用不可とする
//  <106>   茂木 勇次(LEAD) 2005/09/28(WED) m_CmpListに指示ｺﾝﾎﾞを追加。
//  <107>   茂木 勇次(LEAD) 2005/09/28(WED) ｷｰの制御見直し。
//  <108>   飯塚 健介(LEAD) 2005/10/13(THU) 終了要求の修正 及び子を呼び出す際の制御
//  <109>
//  <WF>    加藤(PRIME)     2005/10/28(FRI) WF対応 画面とIFに申請書参照ﾎﾞﾀﾝ追加
//  <110>   加藤(PRIME)     2005/11/02(WED) 詳細ﾎﾞﾀﾝが無効なままになる不具合修正
//  <111>   飯塚 健介(LEAD) 2006/01/26(THU) 資産情報対応
//  <112>   高橋 功二(LEAD) 2006/03/13(MON) 資産管理ﾗｲｾﾝｽの制御なし(MJS遠山様より修正依頼)
//	<113>	長谷川耕平		2006/06/20(Thu)	ﾗｲｾﾝｽ考慮の変更
//	<114>	長谷川耕平		2006/08/04(Fri)
//	<115>	長谷川耕平		2006/09/25(Mon)	「並び替え」機能を復活
//	<GS>	藤塚 正人		2007/03/06(Tue)	情報区分に「グループ別セキュリティ」を追加
//  <Vista> 新保一馬	    2007.03.19(Mon) APのフォームのプロパティをClientHeightと、ClientWidthを調整しスクロールバーが出ないように設計。
//                                          スクロールボックスコンポーネント内のパネルの幅を調整します。
//  <Rel>   新保一馬        2007/03/30(Fri) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//	<KSSN>	久保義和        2007/06/28(Thu) 決算更新区分の判定を行う
//  <Rel-2> 新保一馬        2007/08/09(Thu) 処理終了時のマスタ一括配信DLGを呼ぶ条件を追加
//  <MHIS>  新保一馬        2008/01/09(Wed) ﾏｽﾀ更新履歴対応
//	<RCNT>	新保一馬		2008.07.02(Wed) 件数表示対応(Gali1301)
//  <KOJ>   倉持  剛        2009/03/18(Wed) 工事ﾗｲｾﾝｽのみが採用されている場合でも情報区分ﾄﾞﾛｯﾌﾟﾀﾞｳﾝﾘｽﾄから「販売管理」を選択可能とする
//
// =================== ↓Ver 4.00 リリース向け ===================================================
//
//  <WAN>   新保一馬    2010.05.11(Tue) WAN環境におけるBPLキャッシュ対応
//
// =================== ↓Ver 4.01 リリース向け ===================================================
//
//  <CMLS>  新保一馬    2010.09.08(Wed) 情報区分で資産モジュールが採用されていないのに『資産情報』が表示される。
//                                      ついでにWAN速度アップ対応。CheckModuleLicenseの複数取得版。
//
// =================== ↓Ver 4.08 リリース向け ===================================================
//
//  <KSN>   小川(LEAD)  2011.12.15(Thu) 速度改良に伴う加算体系タブの新規対応。
//                                      このモジュールは「設定」ボタンの新規対応のための修正。
//                                      Count(*)→Count(カラム名)に変更
//  <Shift> 小川(LEAD)  2012.02.07(Tue) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//
// =================== ↓Ver 4.09 / NX-Ⅰ5.02 リリース向け ===================================================
//
//  <Authority> 小川(LEAD)  2012.06.22(Fri) サブモジュールの権限管理対応
//	<D10>	鈴木基男	2019.09.13(Fri)	Delphi10対応
//
//
//=============================================================================
unit JNTCRP004000u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, ComCtrls, Buttons, VCL.ExtCtrls, Db, FireDAC.Comp.Client, ToolWin, VCL.ImgList, Menus,
  dxTL, dxDBGrid, dxCntner, dxGrClms, dxmdaset,

  MJSComboBox, MJSFunctionBar, MJSSPFunctionBar, MJSStatusBar, MJSPanel,
  MJSPageControl, MJSEdits, MJSLabel, MJSBitBtn, MJSGroupBox,  MJSTab,
  MJSSpeedButton, MJSRadioGroup, MJSQuery, MJSMemo,

  MJSCommonu, MjsDBModuleu, MjsDateCtrl, MjsDispCtrl, MjsStrCtrl, //CMNExpFuncU,
  MjsMsgStdu, MjsPreviewIFu,  MjsPrnDlgU, MjsPrnSupportU, MJSCheckBox,

  JNTCommonu, JNTMasComu, JNTMasMonth, JNTMasWndIFu, MJSToolBar,FXLicense,
  MJSKeyDataState,  //<Shift> ADD  
  MLBplLoaderU,JNTAuthorityu, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  System.ImageList; //<WAN>



  const
	WM_ONPAINT	= WM_APP + 1;	// OnPaint 時の処理起動Message用

type
{$include ActionInterface.inc}
//↓<Rel>
{$include JNTCRPSyncMasterH.inc}    // ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMAsterIFH.inc}     // 配信ダイアログ用共通ヘッダ部
//↑<Rel>


  ItemInfo = record
    ItemCode        :   Integer;
	ItemName	    :   String;
  end;

  TJNTCRP004000IFunc = record
  	iOpCode			:	Integer;		// 処理ｺｰﾄﾞ
  	sCaption		:	String;			// ｷｬﾌﾟｼｮﾝ(ﾌｧﾝｸｼｮﾝ文字列)
  	sProg			:	String;			// Bpl名（xxxxxxxxx.Bpl）
  	bEnabled		:	Boolean;		// 有効･無効
  	bWndUV			:	Boolean;		// 選択ｳｨﾝﾄﾞｳ不可視化
  	iLevl			:	Integer;		// 指示Lebel (200,300)
  	iNumb			:	Integer;		// 指示順序 (1～)
  	iMamaOpCode		:	Integer;		// 親処理ｺｰﾄﾞ
  	iBrotherCode    :	Integer;		// 他ﾓｰﾄﾞ識別ｺｰﾄﾞ
  	iType			:	Integer;		// 処理ﾓｰﾄﾞ
  	iMode			:	Integer;		// 処理動作
  	iStyl			:	Integer;		// 処理ｽﾀｲﾙ
    iParam          :   String;
  end;

  TJNTCRP004000f = class(TForm)
    B_End: TMSpeedButton;
    B_Change: TMSpeedButton;
    B_Print: TMSpeedButton;
    B_Syousai: TMSpeedButton;
    B_Delete: TMSpeedButton;
    B_Search: TMSpeedButton;
    PPanel_ToolVar: TMPanel;
    PMPanelAp: TMPanel;
    PPanel_Header: TMPanel;
    LLabel_ECombo_Header: TMLabel;
    ECombo_Header: TMComboBox;
    ToolBar: TMToolBar;
    ToolButton: TToolButton;
    PopupMenu2: TPopupMenu;
    R1: TMenuItem;
    B1: TMenuItem;
    G1: TMenuItem;
    O1: TMenuItem;
    MLabel1: TMLabel;
    B_Sort: TMSpeedButton;
    imgFusenD: TImageList;
    imgFusen: TImageList;
    B_ImportWF: TMSpeedButton;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;
    LblRecCntTitleL: TMLabel;
    LblRecCnt: TMLabel;
    LblRecCntTitleR: TMLabel;
    B_SetUp: TMSpeedButton;

	procedure   FormCreate                  (Sender: TObject);
	procedure   FormShow                    (Sender: TObject);
	procedure   FormHide                    (Sender: TObject);
	procedure   FormClose                   (Sender: TObject; var Action: TCloseAction);
	procedure   FormCloseQuery              (Sender: TObject; var CanClose: Boolean);
	procedure   FormActivate                (Sender: TObject);
	procedure   EndProc                     (Sender: TObject);
	procedure   BEndClick                   (Sender: TObject);
	procedure   ECombo_HeaderChange         (Sender: TObject);
	procedure   ECombo_HeaderKeyDown        (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   FormDestroy                 (Sender: TObject);
// <107>    procedure   B_ChangeClick               (Sender: TObject);
    procedure   EnterEvent                  (Sender: TObject);
    procedure   BPrintClick                 (Sender: TObject);
    procedure   F_ToolBtnClick              (Sender: TObject);

  private
	{ Private 宣言 }
    m_Base_pRec				:	^TMjsAppRecord;		//	Bpl管理構造体
    m_Load_pRec				:	^TMjsAppRecord;		//	Bpl管理構造体
    m_cComArea			    :   TJNTMASCom;
    m_cJNTArea              :   TJNTCommon;
    MDataModule		        :   TMDataModulef;
    m_AcControl		        :   TWinControl;
    m_IFunc                 :   TJNTCRP004000IFunc;
    dbCorp_Select	        :   TFDConnection;
    m_MjsMsgRec		        :   TMjsMsgRec;
// <107>    m_bBtnChange	        :   Boolean;            // 切出≪＝≫埋込 ﾌﾗｸﾞ
	m_bFirstFlag        	:   Boolean;			// 初期処理ﾌﾗｸﾞ
    m_bDspFlag	        	:   Boolean;			// 初期表示処理ﾌﾗｸﾞ
	m_bEndFlag	        	:   Boolean;			// 処理終了ﾌﾗｸﾞ
	m_bEndBtnFlag       	:   Boolean;			// 処理終了ボタンﾌﾗｸﾞ
    m_bKousinBtn        	:   Boolean;			// 更新ﾌﾗｸﾞ
	giReferFlag		        :   Integer;			// 参照ﾌﾗｸﾞ
    m_CmpList		        :	TList;
    uvFormClose             :   Boolean;
    m_KEYFLG                :   Boolean;            // <107>

//<111>    urExecBpl               :   array[0..7] of Boolean;
//<111>    urCallBpl               :   array[0..7] of String;
    urExecBpl               :   array[0..9] of Boolean;	//<GS>8→9
    urCallBpl               :   array[0..9] of String;	//<GS>8→9
    urPrgID                 :   array[0..9] of ProgramID;  //<Authority> ADD

    m_CodeDigit             :   Integer;
    m_CodeAttr              :   Integer;

    //--<100>権限St
    m_IsAppend              :   Boolean;
    m_IsDelete              :   Boolean;
    m_IsDisplay             :   Boolean;
    m_IsModify              :   Boolean;
    m_IsPrint               :   Boolean;
    //--<100>権限Ed

    m_UseType               :   Integer;            //<108>
    m_UpDown                :   Boolean;            //<109>

	m_SystemIndex			:	array of Integer;

    m_SyncMaster            : TSyncMaster;          // <Rel> ﾏｽﾀ同期基本ｸﾗｽ

//↓<CMLS>
	uvbKaikei					: Boolean;
    uvbHanbai					: Boolean;
    uvbSiire					: Boolean;
    uvbSaiken					: Boolean;
    uvbSaimu					: Boolean;
    uvbTegata					: Boolean;
    uvbKoji						: Boolean;
    uvbSisanCmn					: Boolean;
    uvbSisan					: Boolean;
    uvbLease					: Boolean;
//↑<CMLS>

    m_JntAuthority:TJNTAuthority;  // <Authority> ADD

	procedure   WMOnPaint                   (var Msg: TMessage); message WM_ONPAINT;
    procedure   fnCallBPL                   (pType : Integer);
    function    SetComponent                (): Pointer;
    procedure   fnGetGrants                 ();
    function    CheckSecMain                (dqQry:TMQuery;pOpeKbn:Integer): Boolean;	//<GS>

	procedure   SessionPractice(iSyori: Integer); // <MHIS> ADD ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加

//<KOJ> Ins-s
    function  fnKojUse(): Boolean;          //建設工事業採用ﾁｪｯｸ
//<KOJ> Ins-e

  public
	{ Public 宣言 }
	constructor CreateForm                  (pRec: Pointer);
	procedure	CMChildKey                  (var Msg: TWMKey); message CM_CHILDKEY;

    function    DoAction                    (rFunc:TJNTCRP004000IFunc):	Boolean;
    function    BplLoad                     (rFunc:TJNTCRP004000IFunc): Pointer;
    function    BplAction                   (iAction: Integer; pRec: Pointer;pParam: Pointer=nil ): Integer;
    procedure   ProcSelect                  ();
    procedure   BplUnLoad                   ();
    procedure   BplListUpdate               ();
    procedure   fnBtnDspChange              ();

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
//↓<Rel>
{$include JNTCRPSyncMasterB.inc}    // ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}     // 配信ダイアログ共通実装部
//↑<Rel>

const
    // -------------------------------------------------------------------------
    // 情報区分
    // -------------------------------------------------------------------------
//<111>    ucSysCNT        =   7;
{ <111>
    ucSysKBN        :   array[0..7] of String  =   ('基本情報',
                                                     '会計情報',
                                                     '販売情報',
                                                     '手形情報',
                                                     '債権情報',
                                                     '債務情報',
                                                     '支払情報',
                                                     '支払情報（項目別）');


    ucCallBpl       :   array[0..7] of String  =   ('JNTCRP004001.bpl',
                                                     'JNTCRP004002.bpl',
                                                     'JNTCRP004004.bpl',
                                                     'JNTCRP004008.bpl',
                                                     'JNTCRP004003.bpl',
                                                     'JNTCRP004005.bpl',
                                                     'JNTCRP004006.bpl',
                                                     'JNTCRP004007.bpl');
}
    //<111>↓
    ucSysCNT        =   9;	//<GS>8→9
    ucSysKBN        :   array[0..9] of String  =   ('基本情報',
                                                     '会計情報',
                                                     '販売情報',
                                                     '手形情報',
                                                     '債権情報',
                                                     '債務情報',
                                                     '支払情報',
                                                     '支払情報（項目別）',
                                                     '資産情報',
                                                     'グループ別セキュリティ');		//<GS>add


    ucCallBpl       :   array[0..9] of String  =   ('JNTCRP004001.bpl',
                                                     'JNTCRP004002.bpl',
                                                     'JNTCRP004004.bpl',
                                                     'JNTCRP004008.bpl',
                                                     'JNTCRP004003.bpl',
                                                     'JNTCRP004005.bpl',
                                                     'JNTCRP004006.bpl',
                                                     'JNTCRP004007.bpl',
                                                     'JNTCRP004009.bpl',
                                                     'JNTCRP004010.bpl');	//<GS>add
    //<111>↑

// <Authority> ADD St
    ucPrgID       :   array[0..9] of ProgramID  =   (ID_004001,
                                                     ID_004002,
                                                     ID_004004,
                                                     ID_004008,
                                                     ID_004003,
                                                     ID_004005,
                                                     ID_004006,
                                                     ID_004007,
                                                     ID_004009,
                                                     ID_004010);
// <Authority> ADD Ed

	// -----<MHIS> Add-St-----
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放
	// -----<MHIS> Add-Ed-----

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pParam: Pointer): Integer;
var
	pMyForm :	^TJNTCRP004000f;
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
				pMyForm^ := TJNTCRP004000f.CreateForm(pRec);
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
				pMyForm^ := TJNTCRP004000f.CreateForm(pRec);
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
constructor TJNTCRP004000f.CreateForm(pRec: Pointer);
var
    POwnerForm  :   ^TControl;
begin

	m_Base_pRec     :=  pRec;								        // 構造体のSave

    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
    m_cJNTArea.setMasAppRecord;                                     // 財務ﾎﾟｲﾝﾀ設定

	MDataModule     :=  TMDataModulef(m_Base_pRec^.m_pDBModule^);	// DBModuleを取得
	m_cComArea		:=  TJNTMASCom(m_Base_pRec^.m_pSystemArea^);	// ｼｽﾃﾑﾒﾓﾘ 取得
    m_CmpList       :=  TList.Create;

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
procedure TJNTCRP004000f.FormCreate(Sender: TObject);
var
	dqMasterInfo    :   TMQuery;
	dqQry    		:   TMQuery;	//<GS>
    iLoop           :   Integer;
    lvCount         :   Integer;
    dqRel:TMQuery;	//<Rel>
//↓<CMLS>
    ACheck: array of TMLicenseInfo;
    AIndex: Integer;
//↑<CMLS>
begin

	m_bDspFlag		:=  FALSE;
	m_bEndFlag 		:=  FALSE;
	m_bEndBtnFlag   :=  FALSE;
	m_bFirstFlag	:=  FALSE;
	m_bKousinBtn	:=  FALSE;
// <107>    m_bBtnChange 	:=  TRUE;
    uvFormClose     :=  FALSE;
    m_KEYFLG        :=  FALSE;  // <107>
    m_UseType       :=  -1;     // <108>
    m_UpDown        :=  FALSE;  // <109>

	Parent  :=  TPanel(m_Base_pRec^.m_pOwnerPanel^);    // 親ﾊﾟﾈﾙをParent
	Align   :=  alClient;								// 全領域を作成

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MjsColorChange(TJNTCRP004000f(Self),
				   m_cComArea.SystemArea.SysColorB,
				   m_cComArea.SystemArea.SysColorD,
				   m_cComArea.SystemArea.SysBaseColorB,
				   m_cComArea.SystemArea.SysBaseColorD,
				   rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysFocusColor
				  );

	MjsFontResize( TJNTCRP004000f(Self), Pointer(m_Base_pRec) );

    // 初期ﾌｫｰｶｽ 設定
	m_AcControl :=  ECombo_Header;
    JNTMasAccelCharCancel(Self);

    // 会社DB Open
	dbCorp_Select   :=  MDataModule.COPDBOpen( 1, m_cComArea.m_iCopNo );							// 会社DBOpne
	if ( dbCorp_Select = nil ) then
	begin
		m_cComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx(Self,
                        m_MjsMsgRec.sMsg,
                        m_MjsMsgRec.sTitle,
                        m_MjsMsgRec.icontype,
                        m_MjsMsgRec.btntype,
                        m_MjsMsgRec.btndef,
                        m_MjsMsgRec.LogType);
		raise Exception.Create('');
		Exit;
	end;

    // MQueryの構築
    dqMasterInfo    :=  TMQuery.Create (Self);
	dqQry    		:=  TMQuery.Create (Self);		//<GS>
    // DBとMQueryの接続
    MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterInfo);
    MDataModule.SetDBInfoToQuery (dbCorp_Select, dqQry);			//<GS>

//↓<RCNT>
    with dqMasterInfo do
	begin
        Close;
        SQL.Clear;
//<KSN> DEL        SQL.Add('select Count(*) as Kensu from MTOKUI '
        SQL.Add('select Count(NCode) as Kensu from MTOKUI '  //<KSN> ADD
        	+	' where  RDelKbn = 0 '
			+	'   and  TemplateKbn = 0 ');
        Open;
        LblRecCnt.Caption := GetFld('Kensu').AsString;

        Close;
	end;
//↑<RCNT>


    with dqMasterInfo do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT CodeDigit, CodeAttr FROM MasterInfo             '
            +   'WHERE MasterKbn = 22 AND UseKbn <> 0 ORDER BY MasterKbn');
		Open();

		if ( not EOF ) then
		begin
            m_CodeDigit :=  GetFld('CodeDigit') .AsInteger; // 桁数
            m_CodeAttr  :=  GetFld('CodeAttr')  .AsInteger; // 属性
        end;

        Close();
    end;

//<GS>↓追加
    with dqQry do
	begin
		Close();
		SQL.Clear();
		// セキュリティ基本情報の読込み
		SQL.Add('select OpeKbn, UseKbn from SecMain ');
		Open();
    end;
//<GS>↑

    dqMasterInfo.Free();

//↓<CMLS>
    SetLength(ACheck, 10);

    ACheck[0].ModuleCode	:= FXLicense.MAS_BSC;
    ACheck[1].ModuleCode	:= FXLicense.SEL_HAN;
    ACheck[2].ModuleCode	:= FXLicense.SEL_SHI;
    ACheck[3].ModuleCode	:= FXLicense.MAS_SKN;
    ACheck[4].ModuleCode	:= FXLicense.MAS_SMU;
    ACheck[5].ModuleCode	:= FXLicense.MAS_TEG;
    ACheck[6].ModuleCode	:= 850000;
    ACheck[7].ModuleCode	:= FXLicense.DEP_CMN;
    ACheck[8].ModuleCode	:= FXLicense.DEP_SIS;
    ACheck[9].ModuleCode	:= FXLicense.DEP_LEA;

    CheckModuleLicenses(m_Base_pRec, ACheck);

    for AIndex := Low(ACheck) to High(ACheck) do
    begin
		case ACheck[AIndex].ModuleCode of
            FXLicense.MAS_BSC:	uvbKaikei	:= ACheck[AIndex].IsLicense;
            FXLicense.SEL_HAN:	uvbHanbai	:= ACheck[AIndex].IsLicense;
            FXLicense.SEL_SHI:	uvbSiire	:= ACheck[AIndex].IsLicense;
            FXLicense.MAS_SKN:	uvbSaiken	:= ACheck[AIndex].IsLicense;
            FXLicense.MAS_SMU:	uvbSaimu	:= ACheck[AIndex].IsLicense;
            FXLicense.MAS_TEG:	uvbTegata	:= ACheck[AIndex].IsLicense;
            850000:				uvbKoji		:= ACheck[AIndex].IsLicense;
            FXLicense.DEP_CMN:	uvbSisanCmn	:= ACheck[AIndex].IsLicense;
            FXLicense.DEP_SIS:	uvbSisan	:= ACheck[AIndex].IsLicense;
            FXLicense.DEP_LEA:	uvbLease	:= ACheck[AIndex].IsLicense;
        end;
    end;

    SetLength(ACheck, 0);
//↑<CMLS>

	SetLength(m_SystemIndex,0);

    // 情報区分Comboの作成(ﾗｲｾﾝｽﾁｪｯｸ)
    for iLoop := 0 to ucSysCNT do
    begin
        urExecBpl[iLoop] := FALSE;

        case iLoop of
            0:
            begin
                ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                urExecBpl[iLoop] := TRUE;
				SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
				m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
            end;
            1:
            begin
                // 会計ﾗｲｾﾝｽﾁｪｯｸ
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_BSC) ) then
                if uvbKaikei then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            2:
            begin
                // 販売ﾗｲｾﾝｽﾁｪｯｸ
//<113>
//                if ( CheckModuleLicense(m_Base_pRec,FXLicense.SEL_HAN) ) then
{↓<CMLS>
				if	( CheckModuleLicense(m_Base_pRec,FXLicense.SEL_HAN) ) or
					( CheckModuleLicense(m_Base_pRec,FXLicense.SEL_SHI) ) or
					( fnKojUse )                                          or   //<KOJ> Ins 建設工事業ﾗｲｾﾝｽが採用されている場合も表示
					( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SKN) ) or
					( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SMU) ) then
↑<CMLS>}
//↓<CMLS>
				if	( uvbHanbai ) or
					( uvbSiire  ) or
					( fnKojUse  ) or   //<KOJ> Ins 建設工事業ﾗｲｾﾝｽが採用されている場合も表示
					( uvbSaiken ) or
					( uvbSaimu  ) then
//↑<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            3:
            begin
                // 手形ﾗｲｾﾝｽﾁｪｯｸ
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_TEG) ) then
                if uvbTegata then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            4:
            begin
                // 債権ﾗｲｾﾝｽﾁｪｯｸ
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SKN) ) then
                if uvbSaiken then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            5:
            begin
                //債務ﾗｲｾﾝｽﾁｪｯｸ
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SMU) ) then
                if uvbSaimu then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            6:
            begin
                //債務ﾗｲｾﾝｽﾁｪｯｸ（債務がOKなら支払もOK）
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SMU) ) then
                if uvbSaimu then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            7:
            begin
                // 債務ﾗｲｾﾝｽﾁｪｯｸ（債務がOKなら支払もOK）
//<CMLS>        if ( CheckModuleLicense(m_Base_pRec,FXLicense.MAS_SMU) ) then
                if uvbSaimu then //<CMLS>
                begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
                end;
            end;
            8:  //<111>
            begin
                // 資産ﾗｲｾﾝｽﾁｪｯｸ(識別子420000)
//↓<CMLS>
				if (uvbSisanCmn) or (uvbSisan) or (uvbLease) then //資産管理共通、固定資産管理、リース資産管理のどれか一つでも採用があれば、コンボに表示します。
				begin
//↑<CMLS>
// <112>                if ( CheckModuleLicense(m_Base_pRec,420000)) then
// <112>               begin
                    ECombo_Header.Items.Add(ucSysKBN[iLoop]);
                    urExecBpl[iLoop] := TRUE;
// <112>               end;
					SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
					m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
				end; //<CMLS>
            end;
//<GS>↓
            9:
            begin
                // ｸﾞﾙｰﾌﾟｾｷｭﾘﾃｨｰﾁｪｯｸ
				if CheckSecMain(dqQry,1) then
				begin
	                ECombo_Header.Items.Add(ucSysKBN[iLoop]);
	                urExecBpl[iLoop] := TRUE;
	                SetLength(m_SystemIndex,Length(m_SystemIndex)+1);
	                m_SystemIndex[Length(m_SystemIndex)-1] := iLoop;
				end;
            end;
//<GS>↑
        end;
    end;

	dqQry.Free();	//<GS>

    // Bpl呼び出し用変数にBpl情報をｾｯﾄ
    lvCount :=  0;
    for iLoop := 0 to ucSysCNT do
    begin
        if urExecBpl[iLoop] then
        begin
            urCallBpl[lvCount] := ucCallBpl[iLoop];
            urPrgID[lvCount] := ucPrgID[iLoop];  //<Authority> ADD
            lvCount := lvCount + 1;
        end;

    end;

    m_JntAuthority := TJNTAuthority.Create(m_Base_pRec,m_cJNTArea);  // <Authority> ADD

    // 権限情報を取得
    fnGetGrants;

    // 権限のボタンの制御<100>
//<Authority> DEL    B_Print.Enabled := m_IsPrint;

    // ↓↓↓<Rel>
    // SyncMasterｸﾗｽの生成
    try
        m_SyncMaster := TSyncMaster.Create (Self, m_Base_pRec, m_cJNTArea, dbCorp_Select);
        m_SyncMaster.InitData();
        m_SyncMaster.m_AOwner := TForm(m_Base_pRec^.m_pOwnerForm^);
    except
        raise;
    end;

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        dqRel := TMQuery.Create(Self);
        try
            MDataModule.SetDBInfoToQuery (dbCorp_Select, dqRel);
            dqRel.Close;
            dqRel.SQL.Clear;
            dqRel.SQL.Add('CALL MP200010(0,:pTanCd)');
            dqRel.SetFld('pTanCd').AsFloat := rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).TantoNCD;
            if not dqRel.ExecSQL then
            begin
        		raise Exception.Create('');
            end;
        finally
            dqRel.Close;
            dqRel.Free;
        end;
    end;

    // ↑↑↑<Rel>

	// -----<MHIS> Add-St-----
//<D10>	SPMsHist.DatabaseName := dbCorp_Select.DatabaseName;
//<D10>	SPMsHist.SessionName  := dbCorp_Select.SessionName;
	MDataModule.SetDBInfoToSProc (dbCorp_Select, SPMsHist);		//<D10>

	// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = 1 then
	begin
//<D10>	SPMsHistParent.DatabaseName	:= m_SyncMaster.m_cPDBSelect.DatabaseName;
//<D10>	SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
		MDataModule.SetDBInfoToSProc (m_SyncMaster.m_cPDBSelect, SPMsHistParent);		//<D10>
	end;
	// -----<MHIS> Add-Ed-----

    // ｲﾍﾞﾝﾄOnCreateの最後に
	PostMessage(Self.Handle, WM_ONPAINT, 0, 0);

end;

//-----------------------------------------------------------------------------
// WMOnPaint()
//      PARAM   : Msg: TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.WMOnPaint(var Msg: TMessage);
begin

    // 初期のみ一回の処理
	if ( m_bFirstFlag = FALSE ) then
	begin
//↓<Rel>
        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理
        //
        //  親子間の採用区分、ｺｰﾄﾞ属性、桁数の整合性ﾁｪｯｸを行う
        // -------------------------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            case m_SyncMaster.fnChkP_MasterInfo(22) of
                // 正常
                JNTSYNC_RET_MASCHK_OK:
                    begin
                    end;
                // 全社では採用なし
                JNTSYNC_RET_MASCHK_NO_USE:
                    begin
                        MjsMessageBoxEx(Self, JNTSYNC_MSG_NO_USE,
                                    'マスタ同期', mjInformation, mjOk, mjDefOk);
                        Close;
                        Exit;
                    end;
                // 属性・桁数違う
                JNTSYNC_RET_MASCHK_DIFF_C:
                    begin
                        MjsMessageBoxEx(Self, JNTSYNC_MSG_DIFF_C,
                                    'マスタ同期', mjInformation, mjOk, mjDefOk);
                        Close;
                        Exit;
                    end;
                // 採用区分違う
                JNTSYNC_RET_MASCHK_DIFF_U:
                    begin
                    end;
                // 異常
                JNTSYNC_RET_MASCHK_ERR:
                    begin   // 例外ｴﾗｰ
                        Close;
                        Exit;
                    end;
            end;

			// -----<MHIS> Add-St-----
			SessionPractice(C_ST_PROCESS);

			try
			// -----<MHIS> Add-Ed-----

            // 未配信ﾏｽﾀの考慮として、同期ﾌﾟﾛｼｼﾞｬの起動。

            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            MDataModule.BeginTran( dbCorp_Select );

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_MAS) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_CRD) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_PAY) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_DEP) = False ) then
            begin
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                MDataModule.Rollback ( dbCorp_Select );
                Close;
                Exit;
            end;

            // 子会社DBに対してｺﾐｯﾄを実行する
            MDataModule.Commit ( dbCorp_Select );

			// -----<MHIS> Add-St-----
			finally
				SessionPractice(C_ED_PROCESS);
			end;
			// -----<MHIS> Add-Ed-----

        end;
//↑<Rel>
		if ( m_AcControl = ECombo_Header ) then
    	begin
// <107>            m_AcControl.SetFocus();
            ECombo_Header.ItemIndex     :=  0;
			ECombo_Header.DroppedDown   :=  TRUE;
			m_bFirstFlag                :=  TRUE;
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
procedure TJNTCRP004000f.FormShow(Sender: TObject);
begin

	JNTMasSetCaption( m_Base_pRec );
	MJSBtnVisible( TJNTCRP004000f(Self), TRUE );
    B_SetUp.Visible := False;  //<KSN> ADD
    m_AcControl.SetFocus(); // <107>

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ハイド処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.FormHide(Sender: TObject);
begin

	MJSBtnVisible( TJNTCRP004000f(Self), FALSE );

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑｸﾛｰｽﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure TJNTCRP004000f.FormDestroy(Sender: TObject);
begin

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
        BplListUpdate();	//	Bplﾘｽﾄの整理
    end;

    m_CmpList.Free;         // <103>

    // ﾏｽﾀ同期ｸﾗｽの破棄<Rel>
    if ( m_SyncMaster <> nil ) then
		m_SyncMaster.Free();

//<Authority> ADD St
    if (Assigned(m_JntAuthority)) then
    begin
        FreeAndNil(m_JntAuthority);
    end;
//<Authority> ADD Ed

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< 終了前処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//↓<Rel>
var
 	Dlg : TJNTSyncMasterIF;
const
	IDs: Array[0..5] of Integer = (12,13,14,15,17,20);
//↑<Rel>
begin

	if ( m_bEndFlag = TRUE ) then
		Exit;


    // 終了可能か問い合わせ送信 <108>
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

//↓<Rel>
    //配信ダイアログの起動（グループ会計採用していたら）
    if  (m_SyncMaster.m_flgGrpCorp <> -1)
    and (m_SyncMaster.m_CEComKbn5  <> 1)              // <Rel-2>決算更新済み以外
    and (m_IsAppend or m_IsModify or m_IsDelete) then // <Rel-2>追加、修正、削除権限のどれかがある場合のみ起動する。
    begin
        m_cJNTArea.setMasAppRecord;                                     // 財務ﾎﾟｲﾝﾀ設定
        Dlg := TJNTSyncMasterIF.Create(Self,m_Base_pRec);

		SessionPractice(C_ST_PROCESS);			// <MHIS> ADD

        try
            Dlg.ShowDlg(IDs);
        finally
            Dlg.Free;
            Dlg := nil;

			SessionPractice(C_ED_PROCESS);			// <MHIS> ADD

        end;
    end;

    // ｸﾗｽの開放
    m_SyncMaster.fnSyncTerm();

    // ｸﾞﾙｰﾌﾟ会社ありの場合
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBのClose
        if ( m_SyncMaster.m_cPDBSelect <> nil ) then
        begin
        	MDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
        end;
    end;
//↑<Rel>

    // 更新直後 or 参照 or 表示しないうちに終了した時 Exit
    if ( m_bKousinBtn = FALSE ) or
       ( giReferFlag  = REFER ) or
       ( m_bDspFlag   = FALSE ) then
    begin
        MDataModule.COPDBClose(dbCorp_Select);
        // 終了ﾌﾗｸﾞON
        m_bEndFlag  :=  TRUE;
        CanClose    :=  TRUE;
        Exit;
    end;

//<108> ここだと遅い
{
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
}

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.FormActivate(Sender: TObject);
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
procedure TJNTCRP004000f.EndProc(Sender: TObject);
begin

	Close();

end;

//-----------------------------------------------------------------------------
// EnterEvent()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : OnEnterの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.EnterEvent(Sender: TObject);
begin

	m_AcControl := Screen.ActiveControl;

    // 切出≪＝≫埋込
// <107>    if ( m_bBtnChange = FALSE ) then
// <107>       	Exit;

end;

//-----------------------------------------------------------------------------
// BEndClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : BSpeed_ToolBar_End ( TMSpeedButton ) OnClick
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.BEndClick(Sender: TObject);
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
	if (m_bDspFlag = FALSE) or (giReferFlag = REFER) then
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
procedure TJNTCRP004000f.ECombo_HeaderChange(Sender: TObject);
//<109>var
//<109>	iSelectInfo	: Integer;
begin

    if ( m_bFirstFlag = FALSE ) then Exit;  // <107>

    if ( m_UpDown = TRUE ) then             // <109>
    begin                                   // <109>
        m_UpDown := FALSE;                  // <109>
        Exit;                               // <109>
    end;                                    // <109>

{
    if ( ECombo_Header.DroppedDown = TRUE ) then
		Exit;
} // <107>

//<109>    if ( iSelectInfo <> ECombo_Header.ItemIndex ) then
//<109>    begin

//<109>    	iSelectInfo := ECombo_Header.ItemIndex;

//<107>        if ( m_bEndBtnFlag = FALSE ) then
        // ﾏｳｽｸﾘｯｸ時の補足<107>
        if ( m_bEndBtnFlag = FALSE ) and ( m_KEYFLG = FALSE) then
        begin
            // 各種BPLを呼び出す
//<108>            fnCallBPL(iSelectInfo);
//<108>--- St ---------------------------------------------------------------------------------------
            // 各種BPLを呼び出す
            if ECombo_Header.ItemIndex <> m_UseType then
            begin
                // 終了可能か問い合わせ送信
                if ( m_Load_pRec <> nil ) then
                begin
                   	if ( m_Load_pRec^.m_hChildBpl <> 0 ) then
            	    begin
            		    // 要求拒否
                		if ( BplAction( ACTID_FORMCANCLOSESTART, m_Load_pRec ) <> ACTID_RET_OK ) then
            	    	begin
                            ECombo_Header.ItemIndex := m_UseType;
                			Abort;
                		end;
            		end;
            	end;

                fnCallBPL(ECombo_Header.ItemIndex);
            end
            else
            begin
           		MjsDispCtrl.MjsNextCtrl (Self);
                abort;
            end;
//<108>--- Ed ---------------------------------------------------------------------------------------
        end;
//<109>    end;

    // ｷｰが押下された場合にm_KEYFLGを初期化する<107>
    if ( m_KEYFLG = TRUE ) then
        m_KEYFLG    :=  FALSE;

    if ( ECombo_Header.Itemindex = 0 ) then
            B_Syousai.Enabled := TRUE
    else    B_Syousai.Enabled := FALSE;

end;

//-----------------------------------------------------------------------------
// fnCallBPL()
//      PARAM   : pType     情報区分
//      RETURN  :
//      MEMO    : BPLの呼出
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.fnCallBPL(pType : Integer);
var
    lvBplName   :   String;
    lvParam     :   String;
begin

    lvBplName   :=  '';
    lvParam     :=  '';

    if ( m_Load_pRec <> nil ) then
    begin
        BplUnLoad;			//	Bpl解放
        BplListUpdate();	//	Bplﾘｽﾄの整理
	end;
    lvBplName       :=  urCallBpl[pType];
    m_UseType := pType; //<108>
    m_IFunc.iOpCode :=  m_Base_pRec^.m_iProgramCode; //<MHIS>「1」→「m_Base_pRec^.m_iProgramCode」に。
    m_IFunc.sProg   :=  lvBplName;
    m_IFunc.iParam  :=  lvParam;
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
procedure TJNTCRP004000f.ECombo_HeaderKeyDown(Sender: TObject; var Key: Word;
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
procedure TJNTCRP004000f.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin

	if ( GetKeyState(VK_MENU) < 0 ) then
		Exit;

//<Shift> DEL	sShift      :=  KeyDataToShiftState(Msg.KeyData);		// Shiftｷｰの取得
	sShift      :=  MJSKeyDataToShiftState(Msg.KeyData);		// Shiftｷｰの取得  <Shift> ADD
	twAcCtrl    :=  Screen.ActiveControl;

	if ( twAcCtrl is TSelectStrGrid ) then		    // TMNumEditのItemsが開いている？
		Exit;

    // 情報区分（ECombo_Header）での Shift+Tab,↑,←処理は禁止
   	if ( twAcCtrl = ECombo_Header ) then
	begin
		// End & Esc
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then
		begin
			Close ();
			Abort;
		end;

		// ↑,↓処理
		if (( Msg.CharCode = VK_UP   ) and ( sShift = [] )) or
		   (( Msg.CharCode = VK_DOWN ) and ( sShift = [] )) then
		begin
            m_UpDown := True;
			Exit;
		end;

		// TAB,Enter,→処理
// <107>		if (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
// <107>		   (( Msg.CharCode = VK_RETURN ) and ( sShift = [] )) or
// <107>        (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then

        if (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
           (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then  Abort;  // <107>

        if (( Msg.CharCode = VK_RETURN ) and ( sShift = [] )) then  // <107>
		begin
            // 各種BPLを呼出す
            if ( m_bEndBtnFlag = FALSE ) then
            begin
//<108>                m_KEYFLG    :=  FALSE;  // <107>
//<108>                fnCallBPL(ECombo_Header.ItemIndex);
//<108>--- St ---------------------------------------------------------------------------------------
                // 各種BPLを呼び出す
                if ECombo_Header.ItemIndex <> m_UseType then
                begin
                    m_KEYFLG    :=  TRUE;

                    // 終了可能か問い合わせ送信
                    if ( m_Load_pRec <> nil ) then
                    begin
                       	if ( m_Load_pRec^.m_hChildBpl <> 0 ) then
                	    begin
            	    	    // 要求拒否
                	    	if ( BplAction( ACTID_FORMCANCLOSESTART, m_Load_pRec ) <> ACTID_RET_OK ) then
                	    	begin
                                ECombo_Header.ItemIndex := m_UseType;
                                m_KEYFLG    :=  FALSE;  // <107>
                    			Abort;
                    		end;
                		end;
            	    end;

                    fnCallBPL(ECombo_Header.ItemIndex);
                end
                else
                begin
               		MjsDispCtrl.MjsNextCtrl (Self);
                    m_KEYFLG    :=  FALSE;              // <107>
                    abort;
                end;

                m_KEYFLG    :=  FALSE;                  // <107>
//<108>--- Ed ---------------------------------------------------------------------------------------
            end;
        end;

		// Shift+Tab,←処理
		if (( Msg.CharCode = VK_TAB  ) and ( sShift = [ssShift] )) or
		   (( Msg.CharCode = VK_LEFT ) and ( sShift = []        )) then Abort;

	end;

end;


//-----------------------------------------------------------------------------
// DoAction()
//      PARAM   : rFunc
//      RETURN  :
//      MEMO    : ﾌﾟﾛｸﾞﾗﾑを呼出
//-----------------------------------------------------------------------------
function TJNTCRP004000f.DoAction(rFunc:TJNTCRP004000IFunc)	:	Boolean;
begin

    Result  :=  FALSE;

    m_JNTAuthority.ChangeAuthority(urPrgID[ECombo_Header.ItemIndex]);  // <Authority> ADD
    B_Print.Enabled := m_JNTAuthority.IsPrint();                       // <Authority> ADD

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
function TJNTCRP004000f.BplLoad(rFunc:TJNTCRP004000IFunc):Pointer;
var
	pRec		:	^TMjsAppRecord;
	sBplPath	:	String;
begin

    m_cJNTArea.setMasAppRecord;                             // 財務ﾎﾟｲﾝﾀ設定 <101>

	// ﾊﾟﾗﾒｰﾀ作成
	new( pRec );
	pRec^					:= m_Base_pRec^;
	pRec^.m_iProgramCode	:= rFunc.iOpCode;				// iApNo;
	pRec^.m_iDelete			:= 0;							// 削除ﾌﾗｸﾞ
    pRec^.m_sParameter      := rFunc.iParam;

	Result  :=  nil;

    // BPLのﾊﾟｽを取得
	sBplPath	:=	rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).SysRoot+'\'+
					TJNTMASCom(m_Base_pRec^.m_pSystemArea^).SystemArea.SysPrefix+'\prg\'+
					rFunc.sProg;

	try
        // ﾊﾟｯｹｰｼﾞのﾛｰﾄﾞ
		pRec^.m_hChildBpl		:= LoadPackageHelper( sBplPath ); //<WAN>LoadPackage → LoadPackageHelper
	except
		Dispose( pRec );
		exit;
	end;

	// Export関数ｱﾄﾞﾚｽの取得
	pRec^.m_pChildEntry	:= GetProcAddress( pRec^.m_hChildBpl, 'AppEntry' );

	if ( @pRec^.m_pChildEntry = nil ) then
	begin
		UnloadPackageHelper( pRec^.m_hChildBpl ); //<WAN>UnloadPackage → UnloadPackageHelper
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
		UnloadPackageHelper( pRec^.m_hChildBpl ); //<WAN>UnloadPackage → UnloadPackageHelper
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
function TJNTCRP004000f.BplAction( iAction : Integer; pRec: Pointer;pParam: Pointer=nil ) : Integer;
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
procedure TJNTCRP004000f.ProcSelect;
begin

	PMPanelAp.Enabled   :=  TRUE;
	BplAction( ACTID_SHOWSTART, m_Load_pRec );

end;

//-----------------------------------------------------------------------------
// BplUnLoad()
//      PARAM   :
//      RETURN  :
//      MEMO    : BplUnLoad処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.BplUnLoad;
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
procedure TJNTCRP004000f.BplListUpdate();
begin

	if ( m_Load_pRec^.m_hChildBpl <> 0 ) and ( m_Load_pRec^.m_iDelete = 1 ) then
	begin
		UnloadPackageHelper( m_Load_pRec^.m_hChildBpl ); //<WAN>UnloadPackage → UnloadPackageHelper
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
procedure TJNTCRP004000f.B_ChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    lvRect  : TRect;
    lvWidth,
    lvHeight: Integer;
begin

    //2005-05-30切込み・埋込み不具合対応済み inoue
    m_bBtnChange := FALSE;

    if ( B_Change.Caption = '埋込(&G)' ) then
    begin
        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGINEND;         // 格納通知
        B_Change.Caption    :=  '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible             :=  FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect              :=  Self.ClientRect;
        lvWidth             :=  lvRect.Right - lvRect.Left;
        lvHeight            :=  lvRect.Bottom - lvRect.Top;

        ClientWidth         :=  lvWidth;
        ClientHeight        :=  lvHeight;
		Visible		        :=	TRUE;

        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGOUTEND;        //  取出通知
        B_Change.Caption    :=  '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    fnBtnDspChange();

    wkParam.pRecord         :=    Pointer(m_Base_pRec);      // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := TRUE;

end;
} // <107>

//-----------------------------------------------------------------------------
// BPrintClick()
//      PARAM   : Sender : TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 印刷ボタンクリック
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.BPrintClick(Sender: TObject);
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
function TJNTCRP004000f.SetComponent : Pointer;
begin

    B_Syousai.Caption := '詳細(&T)';
    m_CmpList.Clear;                                        // ﾘｽﾄのｸﾘｱ　<102>
	m_CmpList.Add(@B_Print);                                // 印刷
	m_CmpList.Add(@B_Syousai);                              // 詳細
	m_CmpList.Add(@B_Delete);                               // 削除
	m_CmpList.Add(@B_Sort);                                 // 並び替え
	m_CmpList.Add(@B_Search);                               // 検索
	m_CmpList.Add(@B_Change);                               // 切出し
	m_CmpList.Add(@ToolButton);                             // 付箋
	m_CmpList.Add(@ToolBar);                                // 付箋バー
	m_CmpList.Add(@m_cJNTArea);                             // JNTCommon <101>
    m_CmpList.Add(@m_Base_pRec);                            // TMJSAppRecord <104>
    m_CmpList.Add(@ECombo_Header);                          // 情報区分ｺﾝﾎﾞ<106>
    m_CmpList.Add(@B_Change);                               // 切出/埋込<107>
    m_CmpList.Add(@B_ImportWF);                             // 申請書参照<WF>
    m_CmpList.Add(@m_SyncMaster);                           // SyncMasterｸﾗｽ<Rel>
    m_CmpList.Add(@LblRecCnt);								// 件数ラベル<RCNT>
    m_CmpList.Add(@B_SetUp);								// 設定(No15) <KSN> Add

    m_CmpList.Add(@m_JntAuthority);                         // 権限管理クラス  <Authority> ADD

    fnBtnDspChange();

    //権限のボタンの制御<100>
//    B_Print.enabled := m_IsPrint;

	Result := Pointer( @m_CmpList );

end;

//-----------------------------------------------------------------------------
// fnBtnDspChange()
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.fnBtnDspChange();
begin

    // ﾎﾞﾀﾝの使用不可設定
    B_Syousai   .Visible    :=  FALSE;                      // 詳細
    B_Delete    .Visible    :=  FALSE;                      // 削除
    B_Sort      .Visible    :=  FALSE;                      // 並び替え
    B_Search    .Visible    :=  FALSE;                      // 検索
    ToolBar     .Visible    :=  FALSE;                      // 付箋
    B_Change    .Enabled    :=  TRUE;                       // 切出/埋込<106>
    B_ImportWF  .Visible    :=  FALSE;                      // 申請書参照<WF>
    B_SetUp     .Visible    :=  FALSE;                      // 設定 <KSN> ADD

//    case ECombo_Header.ItemIndex of
    case m_SystemIndex[ECombo_Header.ItemIndex] of
        // 基本情報
        0:
        begin
            B_Syousai   .Visible    :=  TRUE;                      // 詳細
            B_Syousai   .Enabled    :=  TRUE;                      // <110>
            B_Delete    .Visible    :=  TRUE;                      // 削除
            B_Sort      .Visible    :=  TRUE;                      // 並び替え
//            B_Sort      .Enabled    :=  FALSE;                     // <105>
            B_Search    .Visible    :=  TRUE;                      // 検索
            B_ImportWF  .Visible    :=  TRUE;                      // 申請書参照<WF>
            ToolBar     .Visible    :=  TRUE;                      // 付箋

            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left      +   B_End.Width     +1;
            B_Change.Left       :=  B_Print.Left    +   B_Print.Width   +1;
            B_Syousai.Left      :=  B_Change.Left   +   B_Change.Width  +1;
            B_Delete.Left       :=  B_Syousai.Left  +   B_Syousai.Width +1;
            B_Sort.Left         :=  B_Delete.Left   +   B_Delete.Width  +1;
            B_Search.Left       :=  B_Sort.Left     +   B_Sort.Width    +1;
            B_ImportWF.Left     :=  B_Search.Left   +   B_Search.Width  +1;     // <WF>追加
//            ToolBar.Left        :=  B_Search.Left   +   B_Search.Width  +2;   // <WF>削除
            ToolBar.Left        :=  B_ImportWF.Left   +   B_ImportWF.Width  +2; // <WF>追加
            B_SetUp.Left        :=  ToolBar.Left   +   ToolBar.Width  +1;       // <KSN> ADD
        end;
        // 会計,販売,手形情報
        1..3,6..7:
        begin
            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left      +   B_End.Width     +1;
            B_Change.Left       :=  B_Print.Left    +   B_Print.Width   +1;
        end;
        // 債権,債務情報
        4,5:
        begin
            B_Delete    .Visible    :=  TRUE;                      // 削除

            B_End.Left          :=  1;
            B_Print.Left        :=  B_End.Left      +   B_End.Width     +1;
            B_Change.Left       :=  B_Print.Left    +   B_Print.Width   +1;
            B_Delete.Left       :=  B_Change.Left   +   B_Change.Width  +1;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// F_ToolBtnClick()
//      PARAM   : Sender : TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 印刷ボタンクリック
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.F_ToolBtnClick(Sender: TObject);
begin

	ToolButton.ImageIndex := (Sender as TMenuItem).Tag;

end;

//-----------------------------------------------------------------------------
// fnGetGrants()
//      PARAM   :
//      RETURN  :
//      MEMO    : 権限取得
//-----------------------------------------------------------------------------
procedure TJNTCRP004000f.fnGetGrants();
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
//<Authority> DEL	m_cJNTArea.IsKessan(True);		//<KSSN>
	m_JntAuthority.KessanKbn := m_cJNTArea.IsKessan(True);		// <Authority> ADD

    m_IsAppend  := m_cJNTArea.IsAppend;
    m_IsDelete  := m_cJNTArea.IsDelete;
    m_IsDisplay := m_cJNTArea.IsDisplay;
    m_IsModify  := m_cJNTArea.IsModify;
    m_IsPrint   := m_cJNTArea.IsPrint;



end;

//-----------------------------------------------------------------------------
// CheckSecMain()
//      PARAM   :	dqQry	:TMQuery
//					pOpeKbn	:使用区分
//      RETURN  :
//      MEMO    : ｸﾞﾙｰﾌﾟｾｷｭﾘﾃｨｰの採用ﾁｪｯｸ
//-----------------------------------------------------------------------------
function TJNTCRP004000f.CheckSecMain(dqQry:TMQuery;pOpeKbn:Integer): Boolean;	//<GS>
begin
	Result := False;

	dqQry.first;
	while not dqQry.Eof do
	begin
		if (dqQry.GetFld('OpeKbn').AsInteger = pOpeKbn) and
			(dqQry.GetFld('UseKbn').AsInteger = 1) then
		begin
			Result := True;
			break;
		end;
		dqQry.next;
	end;

end;

//↓<MHIS>
//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name		:	T.Seki
//	Date		:	2007/12/21
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004000f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsByte			:= 1;	//<D10>AsInteger → AsByte
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsLargeInt		:= rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).TantoNCD;		//<D10>AsCurrency → AsLargeInt
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_Base_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_Base_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_Base_pRec^.m_iProgramCode;

    SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = 1 then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsByte		:= 1;	//<D10>AsInteger → AsByte
												// 担当者内部ｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pTanNCode').AsLargeInt		:= rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).TantoNCD;		//<D10>AsCurrency → AsLargeInt
												// 担当者名称
    	SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_Base_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_Base_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_Base_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_Base_pRec^.m_iProgramCode;

    	SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    	SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
		SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
	end;
end;
//↑<MHIS>

//<KOJ> Ins-s
// *********************************************************************
//	Proccess	:	建設工事業採用チェック
//	Name		:	倉持 剛
//	Date		:	2009/03/16
//	Parameter	:   なし
//	Return		:	True:採用、False：未採用
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP004000f.fnKojUse() : Boolean;
var
    Query       : TMQuery;
begin
    Result := False;

    // 工事ライセンスチェック
//<CMLS>    if CheckModuleLicense(m_Base_pRec, 850000) = False then
    if uvbKoji = False then //<CMLS>
        Exit;

    // 工事採用区分チェック
	Query := TMQuery.Create( Self );
	with Query do
	begin
    	try
//<D10>     DatabaseName  := dbCorp_Select.DatabaseName;
//<D10>     SessionName   := dbCorp_Select.SessionName;
			MDataModule.SetDBInfoToQuery (dbCorp_Select, Query);		//<D10>

			Close;
			SQL.Clear;
//<KSN> DEL			SQL.Add('Select count(*) Cnt');
			SQL.Add('Select count(MasterKbn) Cnt');  //<KSN> ADD
			SQL.Add('From MasterInfo ');
            SQL.Add('Where (MasterKbn Between 201 and 299) and (UseKbn = 1) and (KojUseKbn Between 1 and 3)');

			Open;

			Result := (FieldByName('Cnt').AsInteger >= 1);
		finally
			Close;
		end;
	end;
end;
//<KOJ> Ins-e
end.


