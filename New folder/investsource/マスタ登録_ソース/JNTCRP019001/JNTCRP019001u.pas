//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：分類登録
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上 佳美(LEAD)
//      作成日      ：
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <001>   高橋 功二　 2005.03.30(WED) FX-STYLE対応
//  <   >   高橋 功二　 2005.05.12(THU) 外部ｺｰﾄﾞ属性、桁数対応
//  <002>   井上 佳美　 2005.07.27(WED) 権限機能追加。
//  <PRN>   茂木 勇次   2005.09.09(FRI) 印刷機能の追加。
//  <   >   茂木 勇次   2005.09.09(FRI) ﾌﾟﾛｸﾞﾗﾑの構造を販売系⇒財務系に変更(統一化)
//  <003>   茂木 勇次   2005.09.09(FRI) 担当者分類はｺﾝﾎﾞﾘｽﾄに表示しない。
//  <004>   茂木 勇次   2005.09.09(FRI) 未採用の分類はｺﾝﾎﾞﾘｽﾄに表示しない。評価より。
//  <005>   茂木 勇次   2005.09.09(FRI) 削除ﾎﾞﾀﾝの使用可/不可設定の制御を変更。
//  <006>   茂木 勇次   2005.09.09(FRI) ｺｰﾄﾞ属性表示上、TTableだと厳しいのでTdxMemdataに変更。
//  <PRN>   茂木 勇次   2005.09.19(MON) 印刷機能が実装できていない為、一時印刷ﾎﾞﾀﾝを使用不可に。
//  <007>   茂木 勇次   2005.09.21(WED) TMTabとSETNMの連動不具合対応。
//  <008>   茂木 勇次   2005.09.25(SUN) MMEISHOのNMKにNMの先頭から30ﾊﾞｲﾄをWriteする。
//  <009>   茂木 勇次   2005.09.27(TUE) ﾌﾘｰ属性時の禁則文字制御対応。
//  <010>   広田(PRIME) 2005.10.18(TUE) ESCキーで終了できるように修正
//  <011>   加藤(PRIME) 2006.01.24(TUE) 印刷機能実装
//  <   >   加藤(PRIME) 2006.01.26(THU) 連想を半角4文字→10文字に変更
//  <CHK>   青木(PRIME) 2006.02.14(TUE) 削除ﾁｪｯｸ追加
//  <012>   青木(PRIME) 2006.02.21(TUE) 資産分類対応
//  <013>   青木(PRIME) 2006.02.21(TUE) 分類ｺｰﾄﾞ0つき数字の表示不具合対応
//  <014>   青木(PRIME) 2006.02.23(THU) ｸﾞﾘｯﾄﾞの表示順の設定
//  <015>   青木(PRIME) 2006.03.01(WED) 資産分類削除ﾁｪｯｸ不要の為削除
//	<016>	長谷川		2006.07.13(THU)	拡張分類対応　　販売の分類のみ　分類6～10は未使用なので、9,10のエリアを拡張分類として使用します。
//  <DOJI>  新保一馬    2007.01.30(TUE) データ交換同時実行対応。エラー表示。
//	<017>	高橋 功二	2007.03.08(THU)	分類1～10、拡張分類1,2が全て採用なしの場合にｺﾝﾎﾞへ表示しないように修正
//	<018>	高橋 功二	2007.03.08(THU)	ｸﾞﾙｰﾌﾟ会社管理対応(子会社の場合は表示のみとする)
//
// =================== ↓Ver 4.00 リリース向け ================================
//
//  <WAN>   新保一馬    2010.05.11(Tue) WAN環境におけるBPLキャッシュ対応
//
// =================== ↓NX-I 5.00 リリース向け ==============
//
//  <2269>  倉持  剛    2011.01.20(Fri) 分類種別ｺﾝﾎﾞのOnChangeｲﾍﾞﾝ処理においてｸｴﾘの解放/破棄がないためｴﾗｰになる。
//
// =================== ↓Ver 4.08(NX-I 5.01) リリース向け ==============
//
//	<2278>	吉田健吾	2012.02.03(Fri) ENTERキーで移動しなくなる現象が発生する。
//	<2271>	吉田健吾	2012.02.21(Tue)	ｸﾞﾘｯﾄﾞの新規の「ｺｰﾄﾞ欄」にﾌｫｰｶｽが存在するときに印刷処理を押下すると
//										警告ﾒｯｾｰｼﾞが表示されて印刷処理ができない。
//										デザイナ上のmemPrintのAfterPost・BeforeDelete・BeforePostに
//										割りあたっていたイベントをを割り当て無いようにしました。
//
//=============================================================================
//	<MLXDEP>吉田 健吾	2013.01.11(FRI) MLX固定資産・リース資産対応
//
// =================== ↓Ver NX-I 5.11 リリース向け ==============
//
//	<2562>	中尾  晃	2016.07.22(Fri) 伝票分類の削除チェック処理を追加
//
// =================== ↓Ver NX-I 5.13 リリース向け ==============
//
//	<2706>	柄松克弥	2019.04.12(Fri) メニュータブの×で終了すると、モジュール違反エラーが発生するのを修正。
//	<D10>	鈴木基男	2019.12.24(Tue)	Delphi10対応
//
//=============================================================================
unit JNTCRP019001u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  DBCtrls, Buttons, VCL.ExtCtrls, DB, FireDAC.Comp.Client, DBGrids, Grids, VCL.StdCtrls, ComCtrls,
  ToolWin, ActnList,
  dxDBGrid, dxCntner,  dxGrClms, dxTL, dxmdaset,

  MJSFunctionBar, MJSSPFunctionBar, MJSTab, MJSPanel, MJSStatusBar, MJSMemo,
  MJSLabel, MJSComboBox, MJSQuery, MJSSpeedButton,


  MJSCommonu, MjsDBModuleu, MjsDispCtrl, MjsStrCtrl, MjsMsgStdU,
  JNTCommonu, JNTMasComu, JNTSelCorpSys, JNTExpGlobal{<PRN>}, JNTSelGlobal,
  JNTPDlg{<011>},
  SeriesCheckU,//<MLXDEP>
  FXLicense,    // <012>
  MLBplLoaderU, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet; //<WAN>

const
  // OnPaint 時の処理起動Message用
  WM_ONPAINT = WM_APP + 1;

{$I JNTConst.inc}                           //<CHK>
type
{$include ActionInterface.inc} 			// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加  <BPL>
{$include JNTSelPrtIF.inc}              // <PRN>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TFrmJNTCRP019001f = class(TForm)
    ds: TDataSource;
    TitlePanel: TMPanel;
    UpSBtnEnd: TMSpeedButton;
    UpSBtnPrint: TMSpeedButton;
    UpSBtnChange: TMSpeedButton;
    UpSBtnDelete: TMSpeedButton;
    ScrollBox1: TScrollBox;
    MPanel3: TMPanel;
    dxdbGrid1: TdxDBGrid;
    colNM: TdxDBGridMaskColumn;
    colRENSO: TdxDBGridMaskColumn;
    MTab1: TMTab;
    ScrollBox8: TScrollBox;
    ECombo_Header: TMComboBox;
    Label1: TMLabel;
    MStatusBar1: TMStatusBar;
    MFunctionBar1: TMFunctionBar;
    dxMD: TdxMemData;
    dxMDSETNM: TIntegerField;
    dxMDGCODE: TStringField;
    dxMDRENSO: TStringField;
    dxMDNM: TStringField;
    dxMDNMK: TStringField;
    colGCODE: TdxDBGridColumn;
    MemPrint: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    SPHAPMEI: TFDStoredProc;
    SPDEPMEI: TFDStoredProc;
    SPSelHoj: TFDStoredProc;


    procedure   FormCreate                      (Sender: TObject);
    procedure   FormActivate                    (Sender: TObject);
    procedure   FormDestroy                     (Sender: TObject);
    procedure   FormClose                       (Sender: TObject; var Action: TCloseAction);
    procedure   FormCloseQuery                  (Sender: TObject; var CanClose: Boolean);
    procedure   FormShow                        (Sender: TObject);
    procedure   FormHide                        (Sender: TObject);
    procedure   ECombo_HeaderChange             (Sender: TObject);
    procedure   MTab1Change                     (Sender: TObject);
    procedure   pgcMainChanging                 (Sender: TObject; var AllowChange: Boolean);
// <006>    procedure   TblBeforePost                   (DataSet: TDataSet);
// <006>    procedure   TblBeforeDelete                 (DataSet: TDataSet);
    procedure   dsStateChange                   (Sender: TObject);
    procedure   dxdbGrid1ChangeColumn           (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure   dxdbGridAllKeyPress             (Sender: TObject; var Key: Char);
    procedure   BtnClick                        (Sender: TObject);
    procedure   dxdbGrid1Enter                  (Sender: TObject);
    procedure   dxdbGrid1Exit                   (Sender: TObject);
    procedure   dxMDBeforeDelete                (DataSet: TDataSet);
    procedure   dxMDBeforePost                  (DataSet: TDataSet);
    procedure   dxMDAfterPost                   (DataSet: TDataSet);
    procedure   dxdbGrid1ChangeNodeEx           (Sender: TObject);    // <006>

  private
    { Private 宣言 }
    m_pRec 	        :	^TMjsAppRecord;	                    // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ(ｾｰﾌﾞ用)<BPL>
    m_cDataModule	:	TMDataModulef;	                    // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
    m_cComArea      :   TJNTMASCom;		                    // ｼｽﾃﾑ共通ﾒﾓﾘ
    m_cDBSelect		:   TFDConnection;                          // 会社DB
    m_cJNTArea      :   TJNTCommon;                         // 共通ﾏｽﾀﾒﾓﾘ<001>
    m_cACControl 	:	TWinControl;	                    // Delphi標準 ｳｨﾝﾄﾞｳｺﾝﾄﾛｰﾙ基本ｸﾗｽ <BPL>
    m_MjsMsgRec		:   TMjsMsgRec;                         // ﾒｯｾｰｼﾞ
    m_Close         :   Boolean;                            // 終了ﾌﾗｸﾞ  <001>
    m_bFirstFlag    :   Boolean;                            // 初回表示ﾌﾗｸﾞ
    m_TabFlg	    :   Boolean;		                    // TABのｷｰ、ﾏｳｽ判定
    m_MasterKBN     :   Integer;                            // 分類種別識別子
    AOwner          :   TComponent;
    m_ComboList     :   TStringList;                        // ｺﾝﾎﾞの状態を保持<004>
    m_CodeAttr      :   array [0..9] of Integer;            // ｺｰﾄﾞ属性
    m_CodeDigit     :   array [0..9] of Integer;            // ｺｰﾄﾞ桁数
    m_ReadFlg       :   Boolean;                            // ﾃﾞｰﾀ表示ﾌﾗｸﾞ
    m_MTabSETNM     :   array [0..9] of Integer;            // 選択ｺﾝﾎﾞ時のSETNM保持配列<007>
    m_FocuseTab     :   Integer;                            // ﾌｫｰｶｽﾀﾌﾞNO<007>
    m_Characters    :   String;                             // 特殊文字<009>

	m_BaseMasterNo	:	Integer;
    //--<002>権限St
    giReferFlag		:	Integer;
    m_IsAppend      :   Boolean;
    m_IsDelete      :   Boolean;
    m_IsDisplay     :   Boolean;
    m_IsModify      :   Boolean;
    m_IsPrint       :   Boolean;
    //--<002>権限Ed

    uvSelSys        :   TJNTSelCorpSys; 	                // <PRN> 会社ｼｽﾃﾑ情報
    uvHani          :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   :	TPrintAppEntry;                     // <PRN>
    ArrHdl          :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		:	rcPrtParam;                         // <PRN>
    DmqPrint        :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ

    procedure   WMOnPaint                       (var Msg: TMessage);    message WM_ONPAINT;
// <007>    procedure   fnSetMasterKbn                  (pKBN: Integer);
// <006>    procedure   fnTblOpen                       ();
//    function    fnAllowDelChk                   (CODE: String): Boolean;
    procedure   fnBtnEnbChg                     ();
    procedure   fnRecIns                        ();
    procedure   fnRecDel                        ();
//    procedure   fnIMEChg                        (Column: Integer);
    function    fnTblFieldCheck                 (): Boolean;
    procedure   fnPrintBtn                      ();
    procedure   fnChgBtnAction                  ();
    procedure   fnGetGrants                     (); // <002>
    procedure   fnPrepareComboList              (); // <004>
    procedure   fnGetData                       (nItemNo: Integer); // <006><007>
    function    PrnSet(iMasterKbn: Integer; iOrder: Integer; stStart: String; stEnd: String): Boolean;    // <011>
    procedure   DataDsp_Print(Query : TMQuery);                     // <011>
    function    GetDspGCode(iAttr, iDigit: Integer; strGCode: String): String;  // <011>

    function    fnDelHAPCheck(exNCode: Extended; var strErr: String): Boolean; //<CHK>
    //function    fnDelDEPCheck(exNCode: Extended; var strErr: String): Boolean; //<CHK>    //<015> Del
    function    fnDelSELCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean; //<2562>Add
    function    fnGetNCode(): Extended;            //<CHK>
    function    fnChkGroupKbn(): Boolean;

  protected
    { protected 宣言 }
    procedure	CMChildKey                      (var Msg: TWMKey); 		message	CM_CHILDKEY;

  public
    { Public 宣言 }
    constructor	CreateForm                      (pRec : Pointer);

  end;

{MJS共通仕様のpublic区を宣言}
function AppEntry(pPar: Pointer) : Integer;
exports
	AppEntry;

type
  TExDBGrid = Class(TDBGrid);
var
  FrmJNTCRP019001f: TFrmJNTCRP019001f;

implementation

{$R *.DFM}
//{$include JNTMASERRORCODECHECK.inc} // <009>

const
// ++++++++++++++++++++
//  分類種別識別定数
// ++++++++++++++++++++
    {商品分類}
//<016>
//    uaSetSO : Array[0..9] of Integer = (401,402,403,404,405,406,407,408,409,410);
    uaSetSO : Array[0..9] of Integer = (401,402,403,404,405,406,407,408,801,802);
    {得意先分類}
//<016>
//    uaSetTR : Array[0..9] of Integer = (411,412,413,414,415,416,417,418,419,420);
    uaSetTR : Array[0..9] of Integer = (411,412,413,414,415,416,417,418,811,812);
    {仕入先分類}
//<016>
//    uaSetSI : Array[0..9] of Integer = (421,422,423,424,425,426,427,428,429,430);
    uaSetSI : Array[0..9] of Integer = (421,422,423,424,425,426,427,428,821,822);
    {部門分類}
    uaSetBM : Array[0..9] of Integer = (431,432,433,434,435,436,437,438,439,440);
(*
    {担当者分類}
    uaSetTN : Array[0..9] of Integer = (441,442,443,444,445,446,447,448,449,450);
*) // <003>
    {売上系伝票分類}
    uaSetUR : Array[0..9] of Integer = (451,452,453,454,455,456,457,458,459,460);
    {仕入系伝票分類}
    uaSetSR : Array[0..9] of Integer = (461,462,463,464,465,466,467,468,469,470);
    {倉庫分類}
    uaSetSK : Array[0..9] of Integer = (471,472,473,474,475,476,477,478,479,480);
    {科目分類}
    uaSetKM : Array[0..9] of Integer = (481,482,483,484,485,486,487,488,489,490);
    {科目補助分類}
    uaSetKH : Array[0..9] of Integer = (491,492,493,494,495,496,497,498,499,500);
    {ｾｸﾞﾒﾝﾄ分類}
    uaSetSG : Array[0..9] of Integer = (501,502,503,504,505,506,507,508,509,510);
    {ﾌﾟﾛｼﾞｪｸﾄ分類}
    uaSetPJ : Array[0..9] of Integer = (511,512,513,514,515,516,517,518,519,520);
    {銀行分類}
    uaSetBk : Array[0..9] of Integer = (521,522,523,524,525,526,527,528,529,530);
    {社員分類}
    uaSetSY : Array[0..9] of Integer = (531,532,533,534,535,536,537,538,539,540);
    {汎用補助分類1}
    uaSetF1 : Array[0..9] of Integer = (541,542,543,544,545,546,547,548,549,550);
    {汎用補助分類2}
    uaSetF2 : Array[0..9] of Integer = (551,552,553,554,555,556,557,558,559,560);
    {汎用補助分類3}
    uaSetF3 : Array[0..9] of Integer = (561,562,563,564,565,566,567,568,569,570);
    {汎用補助分類4}
    uaSetF4 : Array[0..9] of Integer = (571,572,573,574,575,576,577,578,579,580);
    {汎用補助分類5}
    uaSetF5 : Array[0..9] of Integer = (581,582,583,584,585,586,587,588,589,590);

    //<012> ↓
    {資産分類}
    uaSetDP : Array[0..9] of Integer = (591,592,593,594,595,596,597,598,599,600);
    //<012> ↑

// +++++++++++++++++++++++++
//  分類種別ｺﾝﾎﾞ名称<004>
// +++++++++++++++++++++++++
    ucSOBUN =   '商品分類';
    ucTKBUN =   '得意先分類';
    ucSSBUN =   '仕入先分類';
    ucBMBUN =   '部門分類';
// <003>    ucTNBUN =   '担当者分類';
    ucURBUN =   '売上系伝票分類';
    ucSRBUN =   '仕入系伝票分類';
    ucSKBUN =   '倉庫分類';
    ucKMBUN =   '科目分類';
    ucKHBUN =   '科目別補助分類';
    ucSGBUN =   'セグメント分類';
    ucPJBUN =   'プロジェクト分類';
    ucBKBUN =   '銀行分類';
    ucSNBUN =   '社員分類';
    ucH1BUN =   '汎用補助１分類';
    ucH2BUN =   '汎用補助２分類';
    ucH3BUN =   '汎用補助３分類';
    ucH4BUN =   '汎用補助４分類';
    ucH5BUN =   '汎用補助５分類';
    ucDPBUN =   '資産分類';     // <012>
    
// +++++++++++++++++++++++++
//     参照ﾌﾗｸﾞ時に使用
// +++++++++++++++++++++++++
	NORMAL	=	1;      //	通常処理
	REFER	=	3;		//	参照

    ucDefCode   =   '0000000000000000';

// <011>↓
    // ｺｰﾄﾞ属性
    CODE_ATTR_NUM   = 0;                    // 数字
    CODE_ATTR_0NUM  = 1;                    // 0つき数字
    CODE_ATTR_FREE  = 2;                    // 文字
// <011>↑

    C_DEL_ERROR   = '削除に失敗しました。';   //<CHK>


//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pPar: Pointer): Integer;
var
	pFrm: ^TFrmJNTCRP019001f;
	pRec: ^TMjsAppRecord;
begin

	result := ACTID_RET_OK;
	pRec   := Pointer(TAppParam(pPar^).pRecord);

	case TAppParam(pPar^).iAction of
        // ----------------------
        //	Form Create要求
        // ----------------------
        ACTID_FORMCREATESTART       :
        begin
            new(pFrm);
            try
                pFrm^ := TFrmJNTCRP019001f.CreateForm(pRec);
                pRec^.m_pChildForm := pFrm;
            except
                Dispose(pFrm);
                result := ACTID_RET_NG;
            end;
        end;
        // ----------------------
        //	Form Create&Show要求
        // ----------------------
        ACTID_FORMCREATESHOWSTART   :
        begin
            new(pFrm);
            try
                pFrm^ := TFrmJNTCRP019001f.CreateForm(pRec);
                pFrm^.Show();
                pRec^.m_pChildForm := pFrm;
            except
                Dispose(pFrm);
                result := ACTID_RET_NG;
            end;
        end;
        // ----------------------
        //	Form Close要求
        // ----------------------
        ACTID_FORMCLOSESTART        :
        begin
            pFrm := Pointer(pRec^.m_pChildForm);
            pFrm^.Close();
            pFrm^.Free();
            Dispose(pFrm);
        end;
        // ----------------------
        //	Form CanClose要求
        // ----------------------
        ACTID_FORMCANCLOSESTART     :
        begin
            pFrm := Pointer(pRec^.m_pChildForm);
            if ( pFrm^.CloseQuery = FALSE ) then
                result := ACTID_RET_NG;
        end;
        // ----------------------
        //	Show要求
        // ----------------------
        ACTID_SHOWSTART             :
        begin
            pFrm := Pointer(pRec^.m_pChildForm);
            pFrm^.Show();
        end;
        // ----------------------
        // Hide要求
        // ----------------------
        ACTID_HIDESTART             :
        begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			if ( pFrm^.Parent <> nil ) then
            	pFrm^.Hide();
        end;
	end;

end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TFrmJNTCRP019001f.CreateForm(pRec: Pointer);
begin

    // ↓↓↓<001>
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
	m_cJNTArea.setMasAppRecord;
    // ↑↑↑<001>

    // MJS情報の保存
    m_pRec          :=  pRec;
    m_cDataModule   :=  TMDataModulef ( m_pRec^.m_pDBModule^  );
    m_cComArea      :=  TJNTMASCom    ( m_pRec^.m_pSystemArea^);
    m_cDBSelect     :=  m_cDataModule.COPDBOpen (1, m_pRec.m_iCorpID);
    AOwner          :=  TForm(m_pRec^.m_pOwnerForm^);

    if ( m_cDBSelect = nil ) then
	begin
		m_cComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,m_cDataModule.GetStatus);
		MJSMessageBoxEx (AOwner,
                         m_MjsMsgRec.sMsg,
                         m_MjsMsgRec.sTitle,
                         m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype,
                         m_MjsMsgRec.btndef,
                         m_MjsMsgRec.LogType
                        );
		raise Exception.Create('');
		Exit;
	end;

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if ( uvSelSys = nil ) then
            Abort;

    	if ( uvSelSys.CreateSysMsg(m_pRec) <> 0 ) then
            Abort;
    except
		MjsMessageBox(AOwner,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if ( uvSelSys.CreateSysInfo(m_cDBSelect) <> 0 ) then
            Abort;
    except
        uvSelSys.MsgDlg(1001,20);
        raise;
    end;

    inherited   Create( AOwner );

end;

//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ <BPL>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.CMChildKey(var Msg: TWMKey);
var
    sShift    : 	TShiftState;
    lvCompName,
    lvFldKbn,
    lvCode    :     String;
    lvFld     :     TField;
    lvColIdx  :     Integer;
    lvGrdFcs  :     boolean;
begin

    // ｱｸﾃｨﾌﾞｺﾝﾎﾟｰﾈﾝﾄの名称を取得する
    lvCompName  :=  TComponent(Screen.ActiveControl).Name;
    lvFldKbn    :=  Copy(lvCompName, 1, 2);

    // ｼﾌﾄｷｰの状態を取得する
//<2278>    sShift      :=  KeyDataToShiftState (Msg.KeyData);
    sShift      :=  JNTSELXKeyDataToShiftState (Msg.KeyData);	//<2278>

    if ( lvCompName = 'dxdbGrid1' ) then
            lvGrdFcs    :=  TRUE
    else    lvGrdFcs    :=  FALSE;

    if ( sShift = [] ) then
    begin
	    // ESCキーの捕捉
    	if ( Msg.CharCode = VK_ESCAPE ) then
	    begin
	        // ｸﾞﾘｯﾄﾞﾌｫｰｶｽ時
    	    if lvGrdFcs then
        	begin
            	// どこにいても編集状態でなければｸﾞﾘｯﾄﾞから抜ける（上位ﾊﾟｰﾂないので処理終了）
// <006>	            if ( not (Tbl.State in [dsInsert, dsEdit]) ) then
                if ( not (dxMD.State in [dsInsert, dsEdit]) ) then
    	        begin
{ <010> -->
        	        // 終了確認のﾒｯｾｰｼﾞ
                    if ( MJSMessageBoxEx (AOwner,
                                          '処理を終了します。よろしいですか？',
                                          '終了',
                                          mjQuestion,
      						              mjYesNo,
                                          mjDefYes,
                                          FALSE
                                         ) = mrYes ) then
                	begin
                    	Close;
	                    Exit;
    	            end;
}
//<MLXDEP>					ECombo_Header.SetFocus();
//<MLXDEP>                    Abort;
//↓<MLXDEP>
					if (TMSeries.IsMjsLink3 <> True) Then
					begin
						ECombo_Header.SetFocus();
	                    Abort;
					end
					else
					begin
                        Close;
                        Exit;
					end;
//↑<MLXDEP>
// <010> <--
            	end
                else if ( dxMD.State in [dsInsert] ) then
                begin
                    dxMD.Cancel();
                    fnBtnEnbChg();		// 051206 hirota
                end;


        	end
			// <010> -->
            else
            begin
       	        // 終了確認のﾒｯｾｰｼﾞ
                if ( MJSMessageBoxEx (AOwner,
                                      '処理を終了します。よろしいですか？',
                                      '終了',
                                      mjQuestion,
  						              mjYesNo,
                                      mjDefYes,
                                      FALSE
                                     ) = mrYes ) then
            	begin
                  	Close;
                    Exit;
   	            end;
            end;
			// <010> <--
	    end;

    	// ENDキーの捕捉
	    if ( Msg.CharCode = VK_END  ) then
	    begin
    	    // ｸﾞﾘｯﾄﾞﾌｫｰｶｽ時
        	if lvGrdFcs then
	        begin
    	        // 編集状態でないときのみ(編集状態の時はそのｶﾗﾑ内の標準の挙動)
        	    if ( TdxDBGrid(Screen.ActiveControl).State <> tsEditing ) then
            	begin
                	// ｸﾞﾘｯﾄﾞの先頭項目だったらｸﾞﾘｯﾄﾞから抜ける（上位ﾊﾟｰﾂないので処理終了）
	                if ( TdxDBGrid(Screen.ActiveControl).FocusedAbsoluteIndex = 0 ) then
    	            begin
        	            // 終了確認のﾒｯｾｰｼﾞ
                        if ( MJSMessageBoxEx (AOwner,
                                              '処理を終了します。よろしいですか？',
                                              '終了',
                                              mjQuestion,
                                              mjYesNo,
                                              mjDefYes,
                                              FALSE
                                             ) = mrYes ) then Close;

                        // ｸﾞﾘｯﾄﾞのENDｷｰを抑止する
                        Abort;
                    end;
                end;
            end;
        end;
    end;

    // Shift+TABｷｰの捕捉
    if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
    begin
        // ｸﾞﾘｯﾄﾞﾌｫｰｶｽ時
        if lvGrdFcs then
        begin
            // ｸﾞﾘｯﾄﾞの先頭ﾚｺｰﾄﾞ先頭項目だったらｸﾞﾘｯﾄﾞから抜ける（上位ﾊﾟｰﾂないので処理終了）
            if ( TdxDBGrid(Screen.ActiveControl).FocusedAbsoluteIndex = 0   ) and
               ( TdxDBGrid(Screen.ActiveControl).FocusedNode.GetPrev  = nil ) then
            begin
                MjsDispCtrl.MjsSetFocus(Self,'MTab1');
                Abort;
            end;
        end;
        // MTabﾌｫｰｶｽ時
	    if ( lvCompName = 'MTab1' ) then Abort;
    end;

    // MTabでの Right,Left ｷｰの補足
    if ( Msg.CharCode=VK_RIGHT ) or ( Msg.CharCode=VK_LEFT ) then
    begin
        if ( lvCompName = 'MTab1' ) then m_TabFlg := FALSE;
    end;

    // MTabでのReturn,Tab,↓ｷｰの補足
    if (( Msg.CharCode = VK_RETURN )  or
        ( Msg.CharCode = VK_TAB    )  or
        ( Msg.CharCode = VK_DOWN   )) and
        ( sShift       = []        )  then
    begin
        if ( Screen.ActiveControl = nil ) then Exit;

        if ( lvCompName = 'ECombo_Header' ) AND (Msg.CharCode <> VK_DOWN) then	// 051021 hirota
        begin
            if ( m_IsDisplay = TRUE ) and ( ScrollBox1.Visible ) then
                MjsDispCtrl.MjsSetFocus(Self,'dxdbGrid1');

            Abort;
        end;

        // Tabﾌｫｰｶｽ時
	    if ( lvCompName = 'MTab1' ) then
		begin
            // ｸﾞﾘｯﾄﾞ先頭ﾌｨｰﾙﾄﾞへ
            MjsDispCtrl.MjsSetFocus(Self,'dxdbGrid1');
            dxdbGrid1.FocusedColumn := 0;
            Abort;
        end;
	end;

    // 入力値のﾁｪｯｸ
    if ( lvCompName = 'dxdbGrid1' ) then
    begin
        lvColIdx    :=  TdxDBGrid(Screen.ActiveControl).FocusedAbsoluteIndex;
        lvCompName  :=  TdxDBGrid(Screen.ActiveControl).Columns[lvColIdx].Name;

        if (( Msg.CharCode = VK_RETURN )  or
            ( Msg.CharCode = VK_RIGHT  )  or
            ( Msg.CharCode = VK_TAB    )) and ( sShift = [] ) then
        begin
            // 分類ｺｰﾄﾞ
            if ( lvCompName = 'colGCODE' ) then
            begin
                with DS.DataSet do
                begin
                    // ｺｰﾄﾞのﾁｪｯｸ
                    lvFld := FieldByName('GCODE');
                    if ( TdxDBGrid(Screen.ActiveControl).State = tsEditing ) then
                        lvCode := TdxDBGrid(Screen.ActiveControl).EditingText
                    else
                        lvCode := lvFld.AsString;
{
                    // 未入力ﾁｪｯｸ
                    if ( Trim(lvCode) = '' ) then
                    begin
                        MJSMessageBoxEx (AOwner,'必須入力です。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
                        TdxDBGrid(Screen.ActiveControl).FocusedField := lvFld;
                        Abort;
                    end;

                    // 0入力は不可
                    if ( Format ('%.16d', [StrToInt64(Trim(lvCode))]) = ucDefCode ) then
//                    if ( lvCode = '0' ) or ( lvCode = '00' ) or ( lvCode = '000' ) then
                    begin
                        MJSMessageBoxEx (AOwner,'必須入力です。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
                        TdxDBGrid(Screen.ActiveControl).FocusedField := lvFld;
                        Abort;
                    end;
}
{ <MAS 364> --> }   //<013> ↓　復活
                    // 属性対応
                    if ( dxMD.State in [dsInsert] ) then
                    begin
                        case m_CodeAttr[MTab1.Items.Selected] of
                            // 数値属性
                            0:  begin
                                    lvFld.AsString  :=
                                        m_cComArea.SetDspCodeAttr(lvCode, m_CodeDigit[MTab1.Items.Selected], 0);
                                    dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                                    dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
                                end;
                            // 数値(前ｾﾞﾛ有)属性
                            1:  begin
                                    lvFld.AsString  :=
                                        m_cComArea.SetDspCodeAttr(lvCode, m_CodeDigit[MTab1.Items.Selected], 1);
                                    dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                                    dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
                                end;
                            // ﾌﾘｰ属性
                            2:  begin
                                    lvFld.AsString  :=
                                        m_cComArea.SetDspCodeAttr(lvCode, m_CodeDigit[MTab1.Items.Selected], 2);
                                    dxdbGrid1.Columns[0].Alignment      :=  taLeftJustify;
                                    dxdbGrid1.Columns[0].EditAlignment  :=  taLeftJustify;
                                end;
                        end;
                    end;
// <MAS 364> <-- }
                    //<013> ↑
                end;
            end;
        end;
    end;

    // Tabｷｰ(+ Shift含む)の補足
    // ...ExitしないとｸﾞﾘｯﾄﾞのTab、Shift+Tabで次ｺﾝﾄﾛｰﾙに移動してしまう
    // ...（Inheritedしなくても回避できる）
    if ( Msg.CharCode = VK_TAB ) then
    begin
        if ( Screen.ActiveControl = nil ) then Exit;
        //ｸﾞﾘｯﾄﾞﾌｫｰｶｽ時
        if lvGrdFcs then Exit;
	end;

	Inherited;

end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormCreate(Sender: TObject);
var
    iRet            :   Integer;        // <PRN>
    i               :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
    DmqData         :   TMQuery;        // <009>
begin

    // 切替処理時の情報をｾｯﾄ
	Parent          :=  TPanel(m_pRec^.m_pOwnerPanel^);  	// 親ﾌｫｰﾑの子ﾌｫｰﾑはめ込みﾊﾟﾈﾙをParentとする
	Align           :=  alClient;							// Alignはｸﾗｲｱﾝﾄ領域とする
	m_cACControl    :=  ECombo_Header;						// 最初のﾌｫｰｶｽを受けるｺﾝﾄﾛｰﾙ

{
    // TTableの接続
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Tbl);
    with Tbl do
    begin
        TableName   :=  'MMEISHO';
        Close();
    end;
} // <006>

// ↓↓↓<006>
    if ( dxMD.Active ) then dxMD.Close();

    for i := 0 to 9 do
    begin
        m_CodeAttr [i]  :=  0;
        m_CodeDigit[i]  :=  0;
        m_MTabSETNM[i]  :=  0;  // <007>
    end;
    m_FocuseTab :=  0;  // <007>
	m_BaseMasterNo := 0;
// ↑↑↑<006>

// <004>    ECombo_Header.ItemIndex     :=  0;
// <004>    fnSetMasterKbn(0);
// <004>    ECombo_HeaderChange(ECombo_Header);

	// ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
   	MjsColorChange(	TFrmJNTCRP019001f(Self),
					m_cComArea.SystemArea.SysColorB,
                    m_cComArea.SystemArea.SysColorD,
                    m_cComArea.SystemArea.SysBaseColorB,
                    m_cComArea.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

    // ﾌｫﾝﾄ変更
	MjsFontResize(TFrmJNTCRP019001f(Self),Pointer(m_pRec));

    // 初期設定
    MTab1.Items.Selected    :=  0;
    m_MasterKBN             :=  0;
    m_bFirstFlag            :=  FALSE;
    m_Close                 :=  FALSE;  // <001>
    m_TabFlg   			    :=  TRUE;
    m_ReadFlg               :=  FALSE;
    MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnDelete', FALSE); // <005>

    m_ComboList :=  TStringList.Create; // <004>

    // 決算確定・権限取得<002>
    fnGetGrants();

    // ｸﾞﾙｰﾌﾟ管理の確認
    fnChkGroupKbn();


    // 参照ﾓｰﾄﾞの場合
    if ( giReferFlag = REFER ) then
    begin
        dxdbGrid1.Options := dxdbGrid1.Options - [egoCanAppend] + [egoRowSelect];

        colGCODE.ReadOnly := TRUE;
        colNM   .ReadOnly := TRUE;
        colRENSO.ReadOnly := TRUE;
    end;

    // 分類種別ｺﾝﾎﾞの作成
    fnPrepareComboList();

// ↓↓↓<PRN>

    // ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

// ↓↓↓<009>
    DmqData :=  TMQuery.Create (Self);
//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
	gfnJNTSelSetDbName(DmqData, m_cDBSelect);		//<D10>

    with DmqData do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT DTName7 FROM DTMAIN ');
        Open();

        m_Characters    :=  GetFld('DTName7').AsString;
    end;
    DmqData.Close();
    DmqData.Free();
// ↑↑↑<009>

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続
//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqPrint );
	gfnJNTSelSetDbName(DmqPrint, m_cDBSelect);		//<D10>

    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
	try
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP019001L.BPL'); //<WAN>LoadPackage → LoadPackageHelper

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(AOwner, 'JNTCRP019001LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
    	UnloadPackageHelper( lvHandle ); //<WAN>UnloadPackage → UnloadPackageHelper
    end;

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
            Para		    :=  uvHani;
			TargetQry	    :=  nil;
            TargetMD        :=  nil;
			CorpSys		    :=  uvSelSys;
            JNTArea         :=  m_cJNTArea;
            // *** 汎用変数 *** //
            TargetParam	    :=  nil;
	    	TargetStr	    :=  '';
    		TargetInt	    :=  0;
            // *** 汎用変数 *** //
            iAPP_HDL_REC    :=  100;
		end;

		iRet := PrintAppEntry(AOwner,m_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

// <011>↓
{    gfnHaniInit2(AOwner,
                 m_pRec,
                 m_cDataModule,
                 m_cComArea,
                 m_cDBSelect,
                 uvHani,
                 uvSelSys);
}
    gfnHaniInit(AOwner,
                 m_pRec,
                 m_cDataModule,
                 m_cComArea,
                 m_cDBSelect,
                 'JNTCRP019001',
                 uvHani,
                 uvSelSys);
// <011>↑
// ↑↑↑<PRN>
//↓<MLXDEP>
	if TMSeries.IsMjsLink3 = True then
	begin
		// 分類種別ｺﾝﾎﾞﾘｽﾄが0件の場合は処理を終了する
		if ( ECombo_Header.Items.Count = 0 ) then
		begin
			MJSMessageBoxEx(Self, '資産分類が採用されていないため、この処理は行えません。','分類登録',
				mjInformation, mjOk, mjDefOk, FALSE);
			Close();
			Exit;
		end;
	end;
//↑<MLXDEP>

    // ｲﾍﾞﾝﾄOnCreateの最後に
    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);

end;

//-----------------------------------------------------------------------------
// WMOnPaint()
//
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.WMOnPaint(var Msg: TMessage);
begin

    // 初期のみ一回の処理
	if ( m_bFirstFlag = FALSE ) then
	begin
		if ( m_cACControl = ECombo_Header ) then
    	begin
			if TMSeries.IsMjsLink3 = false then		//<MLXDEP>
			begin							//<MLXDEP>begin,end内を一段字下げ
                m_bFirstFlag                :=  TRUE;

                // 分類種別ｺﾝﾎﾞﾘｽﾄが0件の場合は処理を終了する
                if ( ECombo_Header.Items.Count = 0 ) then
                begin

                    Close();
                    Exit;
                end;

                // 情報区分(ECombo_Header)を開く
                ECombo_Header.SetFocus ();	// 051021 hirota
                ECombo_Header.ItemIndex     :=  0;
                ECombo_Header.DroppedDown   :=  TRUE;

    // <007>    fnSetMasterKbn(0);                      // <004>
                ECombo_HeaderChange(ECombo_Header);     // <004>
//↓<MLXDEP>
			end
			else
			begin
				//MLX資産の時はこの前に分類種別ｺﾝﾎﾞﾘｽﾄが0件かのチェックはしてある。

                m_bFirstFlag                :=  TRUE;

                // 情報区分(ECombo_Header)を開く
                dxdbGrid1.SetFocus ();
                ECombo_Header.ItemIndex     := 0;
                ECombo_HeaderChange(ECombo_Header);
                ECombo_Header.Enabled		:= False;
				Label1.Visible				:= False;
				ECombo_Header.Visible		:= False;
			end;
//↑<MLXDEP>
	    end;
    end;

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑ終了処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action    :   TCloseActionｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	AppPrm	: TAppParam;
begin

    m_Close :=  TRUE; // <001>

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	// 会社DBのｸﾛｰｽﾞ
	if ( m_cDBSelect <> nil ) then
	    m_cDataModule.COPDBClose (m_cDBSelect);

//<2706>↓
    // 共通ｼｽﾃﾑ開放 <001>
    if ( m_cJNTArea <> nil ) then
        m_cJNTArea.Free();
//<2706>↑

    // 販売ｼｽﾃﾑ情報の開放
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

    // ﾌｫｰﾑ終了処理
	Action              :=  caFree;
	m_pRec^.m_iDelete   :=  1;
	AppPrm.iAction		:=  ACTID_FORMCLOSEEND;		// 呼び出し区分 設定
	AppPrm.pRecord		:=  Pointer(m_pRec);	    // 管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam	:=  nil;					// 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);	// 親を呼び出す!!

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< ﾌｫｰﾑ終了前処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose  :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

	// ﾌﾟﾚﾋﾞｭｰの状態をチェックする
    if ( uvHani.mjspre.IsPreView = TRUE ) then
    begin
        m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 10040, 2);
		MJSMessageBoxEx (AOwner,        // <009>
                         m_MjsMsgRec.sMsg,
                         m_MjsMsgRec.sTitle,
                         m_MjsMsgRec.icontype,
                         m_MjsMsgRec.btntype,
                         m_MjsMsgRec.btndef,
                         m_MjsMsgRec.LogType
                        );
		CanClose    :=  FALSE;
        Exit;
    end;

//<2706>↓
{
    // 共通ｼｽﾃﾑ開放 <001>
    if ( m_cJNTArea <> nil ) then
        m_cJNTArea.Free();
}
//<2706>↑

    // ﾃｰﾌﾞﾙの編集状態をﾁｪｯｸする
(*
    if ( Tbl.State in [dsEdit, dsInsert] ) then
    begin
	    with Tbl do
        begin
            if ( Trim(FieldByName('GCODE').AsString) = '' ) then
            begin
                if ( State in [dsInsert] ) then
                    Cancel;
            end;
        end;
    end;
*) // <006>

// ↓↓↓<006>
    if ( dxMD.State in [dsEdit, dsInsert] ) then
    begin
	    with dxMD do
        begin
            if ( Trim(FieldByName('GCODE').AsString) = '' ) then
            begin
                if ( State in [dsInsert] ) then
                    Cancel;
            end;
        end;
    end;
// ↑↑↑<006>

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< 表示処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormShow(Sender: TObject);
begin

    JNTMasSetCaption (m_pRec);
	MJSBtnVisible (Self, TRUE);

    if ( uvHani.mjspre.IsPreView = TRUE ) then
		uvHani.mjspre.Show()
	else
    begin
//        if ( m_cACControl.Enabled ) then
//    		m_cACControl.SetFocus();
    end;

    FormActivate(Sender);

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑ非表示処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormHide(Sender: TObject);
begin

    // ｱｸｾﾗﾚｰﾀｷｰの制御
    MjsBtnVisible(Self, FALSE);

    if ( uvHani.mjspre.IsPreView = TRUE  ) then
		uvHani.mjspre.Hide();

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormActivate(Sender: TObject);
var
    AppPrm  :   TAppParam;
begin

    // ﾎﾞﾀﾝの状態を制御する
// <005>    fnBtnEnbChg();

    AppPrm.iAction      :=  ACTID_ACTIVEEND;
    AppPrm.pRecord      :=  Pointer(m_pRec);
    AppPrm.pActionParam :=  nil;
    TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//  < ﾌｫｰﾑ破棄処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.FormDestroy(Sender: TObject);
begin

    m_ComboList.Free(); // <004>

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  nil;
        JNTArea     :=  nil;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//  < [ﾎﾞﾀﾝ]ｸﾘｯｸ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.BtnClick(Sender: TObject);
begin

   case TSpeedButton(Sender).Tag of
        //印刷
        1:  fnPrintBtn();			//<PRN>
        //新規
        3:  fnRecIns();
        //削除
        4:  fnRecDel();
        // 切替
        98: fnChgBtnAction();
        //閉じる
        99: Close;
   end;

end;

//-----------------------------------------------------------------------------
// fnPrintBtn()     <PRN><011>復帰
//	< 印刷処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnPrintBtn;
var
    lvRet       :   Integer;            // <PRN>
    JNTPDlg     :   TFrmJNTPDialog;     // <PRN>
// <011>↓
    iMstKbn         : INteger;              // ﾏｽﾀ区分
    iOrder          : Integer;              // 出力順序
    strStart        : String;               // 開始ｺｰﾄﾞ
    strEnd          : String;               // 終了ｺｰﾄﾞ
// <011>↑
begin

    // ↓↓↓<PRN>

    // 販売ｼｽﾃﾑｴﾘｱに設定
    m_cJNTArea.setSelAppRecord;
// <011>↓

                                            // 範囲ﾀﾞｲｱﾛｸﾞにﾏｽﾀ区分、補助名称を渡す
//<016>
    uvHani.pvMasterKbn := m_BaseMasterNo;
//    uvHani.pvMasterKbn := m_MTabSETNM[0];
    uvHani.pvHojyoName := ECombo_Header.SelectedText;
// <011>↑

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free();

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
        end;
     1:	//通常
     	begin
// <011>↓
//            iMstKbn     := m_MTabSETNM[0] + uvHani.pvrPattern;
//<016>
            iMstKbn     := uvHani.pvMasterKbn;
           	iOrder	    := uvHani.pvrOrder;         // 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
           	strStart	:= uvHani.pvrStCode[0];     // 開始外部ｺｰﾄﾞ
           	strEnd      := uvHani.pvrEdCode[0];		// 終了外部ｺｰﾄﾞ

                                            // 印刷ﾃﾞｰﾀをMemDataにｾｯﾄ
        	if PrnSet(iMstKbn, iOrder, strStart, strEnd) = False then
            begin
                m_cJNTArea.setMasAppRecord; // 財務ｼｽﾃﾑｴﾘｱに設定し直し
                Exit;
            end;

            with PrtParam do
          	begin
            	Para		:=  uvHani;
                TargetMD    :=  MemPrint;
               	CorpSys		:=  uvSelSys;
           	end;
// <011>↑
        //印刷する
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else
    end;

    // 財務ｼｽﾃﾑｴﾘｱに設定し直し
    m_cJNTArea.setMasAppRecord;

// ↑↑↑<PRN>

end;

//-----------------------------------------------------------------------------
// fnRecIns()
//	< ﾚｺｰﾄﾞ追加処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnRecIns;
begin

    with dxdbGrid1 do
    begin
// <006>        Tbl.Insert();
        dxMD.Insert();  // <006>
        // 先頭項目にﾌｫｰｶｽをｾｯﾄする
        FocusedField := DataSource.Dataset.FieldByName('GCODE');
    end;

end;

//-----------------------------------------------------------------------------
// dxMDBeforeDelete()
//	< [ﾚｺｰﾄ]ﾞ削除前処理 >
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxMDBeforeDelete(DataSet: TDataSet);
begin
{
    // 関連ﾃﾞｰﾀのﾁｪｯｸ
    if ( fnAllowDelChk(Tbl.Fieldbyname('GCODE').AsString) = TRUE ) then
    begin
        if ( MJSMessageBoxEx (AOwner,
                              '関連するデータが存在します。削除しますか？',
                              '警告',
                              mjWarning,
      					      mjYesNo,
                              mjDefNo,
                              FALSE
                             ) = mrNo ) then Abort;
    end;
}
end;

(*
procedure TFrmJNTCRP019001f.TblBeforeDelete(DataSet: TDataSet);
begin
{
    // 関連ﾃﾞｰﾀのﾁｪｯｸ
    if ( fnAllowDelChk(Tbl.Fieldbyname('GCODE').AsString) = TRUE ) then
    begin
        if ( MJSMessageBoxEx (AOwner,
                              '関連するデータが存在します。削除しますか？',
                              '警告',
                              mjWarning,
      					      mjYesNo,
                              mjDefNo,
                              FALSE
                             ) = mrNo ) then Abort;
    end;
}
end;
*) // <006>

//-----------------------------------------------------------------------------
// fnAllowDelChk()
//	< 関連ﾃﾞｰﾀのﾁｪｯｸ >
//      PARAM   : CODE  :   分類外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : TRUE : 関連ﾃﾞｰﾀ有 FALSE : 関連ﾃﾞｰﾀ無
//      MEMO    :
//-----------------------------------------------------------------------------
{
function TFrmJNTCRP019001f.fnAllowDelChk(CODE: String): Boolean;
begin

    Result  :=  TRUE;
}{
    with StdProc do
    begin
        //<02>
//        StoredProcName := 'PRC_JNTCRP019001_010';
//        ParamByName('@pcSETNM').AsString := uvSETNM;
        ParamByName('@pcCODE') .AsString := CODE;
        ExecProc;
        if ParamByName('@RETURN_VALUE').AsInteger = 0 then
            //関連データなし
            Result := FALSE
        else
            //関連データあり
            Result := TRUE;
    end;
}
//end;

//-----------------------------------------------------------------------------
// fnRecDel()
//	< ﾚｺｰﾄﾞ削除処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnRecDel;
var
    DmqDel  :   TMQuery;
    exNCode :   Extended;                       //<CHK>
    strGCode, strMsg, strName,strErr :String;   //<CHK>
    iType:Integer;                              //<CHK>
    bRet    :Boolean;                           //<CHK>
begin

    if ( MJSMessageBoxEx (AOwner,
                          'レコードを削除します。よろしいですか？',
                          '確認',
                          mjQuestion,
      					  mjYesNo,
                          mjDefNo,
                          FALSE
                         ) = mrYes ) then
    begin

        //<CHK> ↓

        // 分類取得
        iType       :=  StrToIntDef(m_ComboList.Strings[ECombo_Header.ItemIndex],0);

        // 内部ｺｰﾄﾞ取得
        //if  (iType = uaSetSY[0]) or (iType = uaSetDP[0] ) then
        if  (iType = uaSetSY[0]) then //<015>
        begin
            exNCode := fnGetNCode();

            if  (exNCode = -1) then
            begin
                MjsMessageBox(AOwner, C_DEL_ERROR, mjError, mjDefOk);
                Exit;
            end;
        end;

        bRet := True;
        exNCode := 0;

        //【人給】社員分類のときのみﾁｪｯｸ
        if  (iType = uaSetSY[0]) then
        begin      // 削除ﾁｪｯｸ
            bRet := fnDelHAPCheck(exNCode, strErr)
        end;

        //<015>　Del↓
        {
        //【資産】資産分類のときのみﾁｪｯｸ
        else if (iType = uaSetDP[0] ) then
        begin
            bRet := fnDelDEPCheck(exNCode, strErr);
        end;
        }
        //<015>　↑

//<2562>ST
        // 内部ｺｰﾄﾞ取得
        if  (iType = uaSetUR[0]) or (iType = uaSetSR[0] ) then
        begin
            exNCode := fnGetNCode();

            if  (exNCode = -1) then
            begin
                MjsMessageBox(AOwner, C_DEL_ERROR, mjError, mjDefOk);
                Exit;
            end;
        end;

        //【販売】売上/仕入伝票分類のときのみﾁｪｯｸ
        if ((iType = uaSetUR[0]) or (iType = uaSetSR[0])) then
        begin      // 削除ﾁｪｯｸ
            bRet := fnDelSELCheck(exNCode, m_MasterKBN, strErr);
        end;
//<2562>ED

        // 削除ﾁｪｯｸｴﾗｰ
        if  bRet = False then
        begin              // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strGCode:= dxMD.FieldByName('GCODE').AsString;
            strName := dxMD.FieldByName('NMK').AsString;

            strMsg  := strGCode + ' ' + strName + ' ' + strErr ;
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <CHK>↑

        // MQueryの構築
    	DmqDel  := TMQuery.Create( Self );
        // DBとMQueryの接続
//<D10>	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqDel );
		gfnJNTSelSetDbName(DmqDel, m_cDBSelect);		//<D10>

        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
		m_cDataModule.BeginTran(m_cDBSelect);

        try
            with DmqDel do
            begin
                Close();
                Sql.Clear();
                SQL.Add('Update MMEISHO SET         '
                    +   '   RDelKbn     = 1         '
                    +   'WHERE  (GCODE   = :CODE)   '
                    +   '  AND  (SETNM   = :SETNM)  '
                    +   '  AND  (RDelKbn = 0)       ');
// <006>                ParambyName('CODE').AsString := TblGCode.AsString;

// ↓↓↓<006>
                if ( m_CodeAttr[MTab1.Items.Selected] in [0,1] ) then
                    ParamByName('CODE').AsString   :=
                        Format ('%.16d', [StrToInt64(Trim(dxMD.FieldByName('GCODE').AsString))])
                else
                    ParamByName('CODE').AsString   :=
                        Trim(dxMD.FieldByName('GCODE').AsString);
// ↑↑↑<006>
                ParamByName('SETNM').AsInteger  :=  m_MasterKBN;

                if ( ExecSQL() = FALSE ) then
                begin
                    m_cDataModule.Rollback(m_cDBSelect);
                    Close();
			        Free();
    			    Exit;
    		    end;
            end;

            // ｺﾐｯﾄ
            m_cDataModule.Commit(m_cDBSelect);
        finally
            // 再読込
// <006>            Tbl.Close();
// <006>            Tbl.Open();
            fnGetData(m_FocuseTab);    // <006>

            DmqDel.Close();
            DmqDel.Free();
        end;

{
        if ( Tbl.Active ) then
        begin
            if ( dxdbGrid1.Datasource.DataSet.RecordCount = 0 ) then
            begin
                // 再読込
                Tbl.Close();
                Tbl.Open();
            end;
        end;
} // <006>

// ↓↓↓<006>
        if ( dxMD.Active ) then
        begin
            // 再読込
            if ( dxdbGrid1.Datasource.DataSet.RecordCount = 0 ) then
                fnGetData(m_FocuseTab); // <007>
        end;
// ↑↑↑<006>

    end;

end;

//-----------------------------------------------------------------------------
// fnChgBtnAction()
//	< 切出,埋込処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnChgBtnAction;
var
	AppPrm  :	TAppParam;
    lvRect  :   TRect;
    lvWidth,
    lvHeight:   Integer;
begin

    if ( UpSBtnChange.Caption = '埋込(&G)' ) then
    begin
        // 親画面への設定
        AppPrm.iAction          :=  ACTID_DOCKINGINEND;         //  格納通知
        UpSBtnChange.Caption    :=  '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible         :=	FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect          :=  Self.ClientRect;
        lvWidth         :=  lvRect.Right - lvRect.Left;
        lvHeight        :=  lvRect.Bottom - lvRect.Top;

        ClientWidth     :=  lvWidth;
        ClientHeight    :=  lvHeight;
		Visible		    :=	TRUE;

        // 親画面への設定
        AppPrm.iAction          :=  ACTID_DOCKINGOUTEND;        //  取出通知
        UpSBtnChange.Caption    := '埋込(&G)';                  // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    AppPrm.pRecord         :=    Pointer(m_pRec);               // 管理構造体ﾎﾟｲﾝﾀ設定
    AppPrm.pActionParam    :=    nil;                           // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);

end;

//-----------------------------------------------------------------------------
// ECombo_HeaderChange()
//	< 分類種別変更処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾀﾌﾞの名称を取得
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.ECombo_HeaderChange(Sender: TObject);
var
    iLoop       :   Integer;
    iType       :   Integer;    // <004>
//    iZokuAtr    :   Integer;    // <004>
// <004>    lvVisFlg    :   Boolean;
    DmqData     :   TMQuery;
    lvParam     :   Integer;    // <007>
    lvFirstTab  :   Integer;    // <007>
    lvFristBol  :   Boolean;    // <007>
begin

// <004>    lvVisFlg := FALSE;

    if ( m_bFirstFlag = FALSE ) then Exit;  // <004>

// ↓↓↓<006>
//    iZokuAtr    :=  0;
    lvFirstTab  :=  0;      // <007>
    lvFristBol  :=  FALSE;  // <007>

    for iLoop := 0 to 9 do
    begin
        m_CodeAttr [iLoop]  :=  0;
        m_CodeDigit[iLoop]  :=  0;
        m_MTabSETNM[iLoop]  :=  0;  // <007>
    end;
// ↑↑↑<006>
	m_BaseMasterNo := 0;

    // MQueryの構築
    DmqData  := TMQuery.Create( Self );
    // DBとMQueryの接続
//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
	gfnJNTSelSetDbName(DmqData, m_cDBSelect);		//<D10>

	try		//<2269> Ins

        for iLoop := 0 to 9 do
        begin
            MTab1.Items[iLoop].Caption  :=  '';
            with DmqData do
            begin
                Close();
                Sql.Clear();
                Sql.Add('Select JHojyoName,UseKbn,CodeDigit,CodeAttr    '
                    +   'FROM MasterInfo                                '
                    +   'WHERE  (MasterKBN = :pKBN)                     ');


    // ↓↓↓ｺﾝﾎﾞが動的に切替るので、case文ではﾀﾞﾒ <004><007>

                iType       :=  StrToIntDef(m_ComboList.Strings[ECombo_Header.ItemIndex],0);
                lvParam     :=  0;  // <007>

                if      ( iType = uaSetSO[0] ) then lvParam := uaSetSO[iLoop]    // 商品分類
                else if ( iType = uaSetSO[8] ) then lvParam := uaSetSO[iLoop]    // 商品拡張分類   <017>
                else if ( iType = uaSetTR[0] ) then lvParam := uaSetTR[iLoop]    // 得意先分類
                else if ( iType = uaSetTR[8] ) then lvParam := uaSetTR[iLoop]    // 得意先拡張分類 <017>
                else if ( iType = uaSetSI[0] ) then lvParam := uaSetSI[iLoop]    // 仕入先分類
                else if ( iType = uaSetSI[8] ) then lvParam := uaSetSI[iLoop]    // 仕入先拡張分類 <017>
                else if ( iType = uaSetBM[0] ) then lvParam := uaSetBM[iLoop]    // 部門分類
    // <003>            else if ( iType = uaSetTN[0] ) then lvParam := uaSetTN[iLoop]    // 担当者分類
                else if ( iType = uaSetUR[0] ) then lvParam := uaSetUR[iLoop]    // 売上系伝票分類
                else if ( iType = uaSetSR[0] ) then lvParam := uaSetSR[iLoop]    // 仕入系伝票分類
                else if ( iType = uaSetSK[0] ) then lvParam := uaSetSK[iLoop]    // 倉庫分類
                else if ( iType = uaSetKM[0] ) then lvParam := uaSetKM[iLoop]    // 科目分類
                else if ( iType = uaSetKH[0] ) then lvParam := uaSetKH[iLoop]    // 科目別補助分類
                else if ( iType = uaSetSG[0] ) then lvParam := uaSetSG[iLoop]    // ｾｸﾞﾒﾝﾄ分類
                else if ( iType = uaSetPJ[0] ) then lvParam := uaSetPJ[iLoop]    // ﾌﾟﾛｼﾞｪｸﾄ分類
                else if ( iType = uaSetBK[0] ) then lvParam := uaSetBK[iLoop]    // 銀行分類
                else if ( iType = uaSetSY[0] ) then lvParam := uaSetSY[iLoop]    // 社員分類
                else if ( iType = uaSetF1[0] ) then lvParam := uaSetF1[iLoop]    // 汎用補助1分類
                else if ( iType = uaSetF2[0] ) then lvParam := uaSetF2[iLoop]    // 汎用補助2分類
                else if ( iType = uaSetF3[0] ) then lvParam := uaSetF3[iLoop]    // 汎用補助3分類
                else if ( iType = uaSetF4[0] ) then lvParam := uaSetF4[iLoop]    // 汎用補助4分類
                else if ( iType = uaSetF5[0] ) then lvParam := uaSetF5[iLoop]    // 汎用補助5分類
                else if ( iType = uaSetDP[0] ) then lvParam := uaSetDP[iLoop];   // 資産分類        //<012>

                ParamByName('pKBN').AsInteger :=    lvParam;    // <007>
    //<016>
                if iLoop = 0 then
                    m_BaseMasterNo := lvParam;
    // ↑↑↑<004>

    (*
                case ECombo_Header.ItemIndex of
                     0:  ParamByName('pKBN').asInteger := uaSetSO[i]; // 商品分類
                     1:  ParamByName('pKBN').asInteger := uaSetTR[i]; // 得意先分類
                     2:  ParamByName('pKBN').asInteger := uaSetSI[i]; // 仕入先分類
                     3:  ParamByName('pKBN').asInteger := uaSetBM[i]; // 部門分類
                     4:  ParamByName('pKBN').asInteger := uaSetTN[i]; // 担当者分類
                     5:  ParamByName('pKBN').asInteger := uaSetUR[i]; // 売上系分類
                     6:  ParamByName('pKBN').asInteger := uaSetSR[i]; // 仕入系分類
                     7:  ParamByName('pKBN').asInteger := uaSetSK[i]; // 倉庫分類
                     8:  ParamByName('pKBN').asInteger := uaSetKM[i]; // 科目分類
                     9:  ParamByName('pKBN').asInteger := uaSetKH[i]; // 科目別補助分類
                    10:  ParamByName('pKBN').asInteger := uaSetSG[i]; // ｾｸﾞﾒﾝﾄ分類
                    11:  ParamByName('pKBN').asInteger := uaSetPJ[i]; // ﾌﾟﾛｼﾞｪｸﾄ分類
                    12:  ParamByName('pKBN').asInteger := uaSetBK[i]; // 銀行分類
                    13:  ParamByName('pKBN').asInteger := uaSetSY[i]; // 社員分類
                    14:  ParamByName('pKBN').asInteger := uaSetF1[i]; // 汎用補助1分類
                    15:  ParamByName('pKBN').asInteger := uaSetF2[i]; // 汎用補助2分類
                    16:  ParamByName('pKBN').asInteger := uaSetF3[i]; // 汎用補助3分類
                    17:  ParamByName('pKBN').asInteger := uaSetF4[i]; // 汎用補助4分類
                    18:  ParamByName('pKBN').asInteger := uaSetF5[i]; // 汎用補助5分類
                end;
    *) // <004>

                Open();

                if not Eof then
                begin
                    MTab1.Items[iLoop].Caption	:= GetFld('JHojyoName').AsString;
                    if ( GetFld('UseKbn').AsInteger = 1 ) then
                    begin
                        // ↓↓↓<007>
                        if ( lvFristBol = FALSE ) then
                        begin
                            lvFirstTab  :=  iLoop;
                            lvFristBol  :=  TRUE;
                        end;
                        // ↑↑↑<007>
                        MTab1.Items[iLoop].Visible  := TRUE;
                        m_CodeAttr [iLoop]      :=  GetFld('CodeAttr')  .AsInteger;  // ｺｰﾄﾞ属性<006>
                        m_CodeDigit[iLoop]      :=  GetFld('CodeDigit') .AsInteger;  // ｺｰﾄﾞ桁数<006>
                        m_MTabSETNM[iLoop]      :=  lvParam;                         // SETNM値<007>
    //                  inc(iZokuAtr);                                               // <006>
    // <004>            lvVisFlg := TRUE;
                    end
                    else
                        MTab1.Items[iLoop].Visible  := FALSE;
                end
                else
                    MTab1.Items[iLoop].Visible  := FALSE;
            end;
        end;
    {
        // 一つもVisible=TRUEのTabが無かったらパネル毎非表示
        if lvVisFlg then
             ScrollBox1.Visible := TRUE
        else
             ScrollBox1.Visible := FALSE;
    } // <004>

        // ﾍﾟｰｼﾞｺﾝﾄﾛｰﾙのｱｸﾃｨﾌﾞﾍﾟｰｼﾞを設定する
        MTab1.Items.Selected    :=  lvFirstTab; // <007>
    // <007>    MTab1.Items.Selected    :=  0;
        m_MasterKBN :=  m_MTabSETNM[lvFirstTab];  // <007>

    // <007>    fnSetMasterKbn(0);

        // ﾃﾞｰﾀ表示処理<006><007>
        fnGetData(lvFirstTab);

    // <006>    fnTblOpen();
        DSStateChange(ds);

//<2269> Ins-s
    finally
		// ｸｴﾘの解放・破棄
        if DmqData <> nil then
		begin
			DmqData.Close;
			DmqData.Free;
		end;
	end;
//<2269> Ins-e

end;

{
//-----------------------------------------------------------------------------
// fnSetMasterKbn()
//	< ﾏｽﾀ区分取得処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnSetMasterKbn(pKBN:Integer);
var
    iType   :   Integer;    // <004>
begin

// ↓↓↓ｺﾝﾎﾞが動的に切替るので、case文ではﾀﾞﾒ <004>

    iType    :=  StrToIntDef(m_ComboList.Strings[ECombo_Header.ItemIndex],0);

    if      ( iType = uaSetSO[0] ) then m_MasterKBN := uaSetSO[pKBN]    // 商品分類
    else if ( iType = uaSetTR[0] ) then m_MasterKBN := uaSetTR[pKBN]    // 得意先分類
    else if ( iType = uaSetSI[0] ) then m_MasterKBN := uaSetSI[pKBN]    // 仕入先分類
    else if ( iType = uaSetBM[0] ) then m_MasterKBN := uaSetBM[pKBN]    // 部門分類
// <003>    else if ( iType = uaSetTN[0] ) then m_MasterKBN := uaSetTN[pKBN]    // 担当者分類
    else if ( iType = uaSetUR[0] ) then m_MasterKBN := uaSetUR[pKBN]    // 売上系伝票分類
    else if ( iType = uaSetSR[0] ) then m_MasterKBN := uaSetSR[pKBN]    // 仕入系伝票分類
    else if ( iType = uaSetSK[0] ) then m_MasterKBN := uaSetSK[pKBN]    // 倉庫分類
    else if ( iType = uaSetKM[0] ) then m_MasterKBN := uaSetKM[pKBN]    // 科目分類
    else if ( iType = uaSetKH[0] ) then m_MasterKBN := uaSetKH[pKBN]    // 科目別補助分類
    else if ( iType = uaSetSG[0] ) then m_MasterKBN := uaSetSG[pKBN]    // ｾｸﾞﾒﾝﾄ分類
    else if ( iType = uaSetPJ[0] ) then m_MasterKBN := uaSetPJ[pKBN]    // ﾌﾟﾛｼﾞｪｸﾄ分類
    else if ( iType = uaSetBK[0] ) then m_MasterKBN := uaSetBK[pKBN]    // 銀行分類
    else if ( iType = uaSetSY[0] ) then m_MasterKBN := uaSetSY[pKBN]    // 社員分類
    else if ( iType = uaSetF1[0] ) then m_MasterKBN := uaSetF1[pKBN]    // 汎用補助1分類
    else if ( iType = uaSetF2[0] ) then m_MasterKBN := uaSetF2[pKBN]    // 汎用補助2分類
    else if ( iType = uaSetF3[0] ) then m_MasterKBN := uaSetF3[pKBN]    // 汎用補助3分類
    else if ( iType = uaSetF4[0] ) then m_MasterKBN := uaSetF4[pKBN]    // 汎用補助4分類
    else if ( iType = uaSetF5[0] ) then m_MasterKBN := uaSetF5[pKBN];   // 汎用補助5分類

// ↑↑↑<004>

(*
    case ECombo_Header.ItemIndex of
         0:  m_MasterKBN := ucSetSO[pKBN]; // 商品分類
         1:  m_MasterKBN := uaSetTR[pKBN]; // 得意先分類
         2:  m_MasterKBN := uaSetSI[pKBN]; // 仕入先分類
         3:  m_MasterKBN := uaSetBM[pKBN]; // 部門分類
         4:  m_MasterKBN := uaSetTN[pKBN]; // 担当者分類
         5:  m_MasterKBN := uaSetUR[pKBN]; // 売上系分類
         6:  m_MasterKBN := uaSetSR[pKBN]; // 仕入系分類
         7:  m_MasterKBN := uaSetSK[pKBN]; // 倉庫分類
         8:  m_MasterKBN := uaSetKM[pKBN]; // 科目分類
         9:  m_MasterKBN := uaSetKH[pKBN]; // 科目別補助分類
        10:  m_MasterKBN := uaSetSG[pKBN]; // ｾｸﾞﾒﾝﾄ分類
        11:  m_MasterKBN := uaSetPJ[pKBN]; // ﾌﾟﾛｼﾞｪｸﾄ分類
        12:  m_MasterKBN := uaSetBK[pKBN]; // 銀行分類
        13:  m_MasterKBN := uaSetSY[pKBN]; // 社員分類
        14:  m_MasterKBN := uaSetF1[pKBN]; // 汎用補助1分類
        15:  m_MasterKBN := uaSetF2[pKBN]; // 汎用補助2分類
        16:  m_MasterKBN := uaSetF3[pKBN]; // 汎用補助3分類
        17:  m_MasterKBN := uaSetF4[pKBN]; // 汎用補助4分類
        18:  m_MasterKBN := uaSetF5[pKBN]; // 汎用補助5分類
    end;
*) // <004>

end;
} // <007>

(*
//-----------------------------------------------------------------------------
// fnTblOpen()
//	< ﾃｰﾌﾞﾙｵｰﾌﾟﾝ処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnTblOpen;
var
    lvSETNM : Integer;
begin

    // ｸﾞﾘｯﾄﾞの制御
    colGCODE.Tag   :=  m_MasterKBN;

    m_cJNTArea.inzGrid(dxdbGrid1);

    with Tbl do
    begin
        //　名称ﾃｰﾌﾞﾙの識別子を設定する
        Filtered    :=  TRUE;
        lvSETNM     :=  m_MasterKBN;
        Filter      :=  '(SETNM = ' + intToStr(lvSETNM) + ') and RDelKbn <> 1';
        Open;
        First;
    end;

end;
*) // <006>

//-----------------------------------------------------------------------------
// fnTblFieldCheck()
//	< ﾌｨｰﾙﾄﾞﾁｪｯｸ処理 >
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE : 正常終了 FALSE : 異常終了
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP019001f.fnTblFieldCheck: Boolean;
var
    Fld     :   TField;
//    lvEdit  :   String;

    function lfnExistCODE: Boolean;
    var
        DmqChk  :   TMQuery;
    begin
        Result  :=  TRUE;

        // MQueryの構築
        DmqChk  := TMQuery.Create( Self );
        // DBとMQueryの接続
//<D10>	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqChk );
		gfnJNTSelSetDbName(DmqChk, m_cDBSelect);		//<D10>

        with DmqChk do
        begin
            Close();
            Sql.Clear();
            Sql.Add('SELECT NCODE from MMEISHO  '
                +   ' WHERE (GCODE   = :CODE)   '
                +   '   AND (SETNM   = :SETNM)  '
                +   '   AND (RDelKbn = 0)       ');

// <006>            ParambyName('CODE') .AsString   :=  TblGCode.asString;

// ↓↓↓<006>
            if ( m_CodeAttr[MTab1.Items.Selected] in [0,1] ) then
                    ParamByName('CODE').AsString   :=
                        Format ('%.16d', [StrToInt64(Trim(dxMD.FieldByName('GCODE').AsString))])
                else
                    ParamByName('CODE').AsString   :=
                        Trim(dxMD.FieldByName('GCODE').AsString);
// ↑↑↑<006>
            ParambyName('SetNM').AsString   :=  IntToStr(m_MasterKBN);
            Open();

            if not Eof then
                Result := FALSE;
        end;

        DmqChk.Close();
        DmqChk.Free();

    end;

begin

    Result  :=  TRUE;

// <006>    with Tbl ,dxdbGrid1  do
    with dxMD ,dxdbGrid1  do    // <006>
    begin
        // ｺｰﾄﾞのﾁｪｯｸ
        FLd     :=  FieldByName('GCODE');
        // ｺｰﾄﾞ属性対応
//        lvEdit  :=  colGCODE.Field.AsString;
//        Fld.tag :=  m_MasterKBN;
//        m_cJNTArea.setColAttr(lvEdit, colGCODE);

        if ( Trim(FLd.AsString) = '' ) then
        begin
            MJSMessageBoxEx (AOwner,'必須入力です。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
            FocusedField    :=  FLD;
            Result          :=  FALSE;
            Exit;
        end;

        // ↓↓↓ここで有効文字ﾁｪｯｸを行っている
        if ( uvSelSys.XKanjiCheck(Fld.AsString) = TRUE ) then
        begin
            MJSMessageBoxEx (AOwner,'入力値に漢字もしくは特殊文字が含まれています。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
            FocusedField    :=  FLD;
            Result          :=  FALSE;
            Exit;
        end;

//        Fld.Tag :=  m_MasterKBN;
        // ｺｰﾄﾞ属性対応
//        m_cJNTArea.setAttr(FLd);

        // 0入力は不可
//        if ( FLd.AsString = ucDefCode ) then

        if ( m_CodeAttr[m_FocuseTab] <= 1 ) then
        begin
            if ( Format ('%.16d', [StrToInt64(Trim(FLd.AsString))]) = ucDefCode ) then
            begin
    			MJSMessageBoxEx (AOwner,'必須入力です。','警告',
                                 mjWarning,mjOk,mjDefOk,FALSE);
                FocusedField    :=  FLD;
                Result          :=  FALSE;
                Exit;
            end;
        end;

// <006>        if ( Tbl.State in [dsInsert] ) then
        if ( dxMD.State in [dsInsert] ) then    // <006>
        begin
            // ｺｰﾄﾞの存在ﾁｪｯｸ
            if not lfnExistCODE then
            begin
                MJSMessageBoxEx (AOwner,'指定されたコード（値）は既に登録済みです。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
                FocusedField    :=  FLD;
                Result          :=  FALSE;
                Exit;
            end;
        end;
{
        // 有効文字のﾁｪｯｸ(ﾌﾘｰ属性時) <009>
        if ( m_CodeAttr[m_FocuseTab] = 2 ) then
        begin
            if ( dxMD.State in [dsInsert] ) then
            begin
                if	( not JNTMASERRORCODECHECK (ds.DataSet.FieldByName('GCODE').AsString, m_Characters) ) then
                begin
                    MJSMessageBoxEx (AOwner,'登録できない文字があります。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
                    FocusedField    :=  FLD;
                    Result          :=  FALSE;
                    Exit;
                end;
            end;
 		end;
}
        //名称の空値ﾁｪｯｸ
        FLd :=  FieldByName('NM');
        if ( Trim(FLd.AsString) = '' ) then
        begin
			MJSMessageBoxEx (AOwner,'必須入力です。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
            FocusedField    :=  FLD;
            Result          :=  FALSE;
            Exit;
        end;

        // 漢字のﾁｪｯｸ
        FLd := FieldByName('RENSO');
        if ( JNTSelXKanjiCheck(Fld.AsString) = TRUE ) then
        begin
			MJSMessageBoxEx (AOwner,'入力値に漢字もしくは特殊文字が含まれています。','警告',
                             mjWarning,mjOk,mjDefOk,FALSE);
            FocusedField    :=  FLD;
            Result          :=  FALSE;
            Exit;
        end;
    end;

end;

procedure TFrmJNTCRP019001f.dxMDAfterPost(DataSet: TDataSet);
begin

end;

//-----------------------------------------------------------------------------
// dxMDBeforePost()
//	< [ﾚｺｰﾄﾞ]確定前処理 >
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxMDBeforePost(DataSet: TDataSet);
var
    DmqUpd  :   TMQuery;
//↓<DOJI>
    iLoop:Integer;
    EngineErr: TEngineErr;
    iErrCode: integer;
//↑<DOJI>
begin

    // 初期ﾃﾞｰﾀ読込時は以下の処理は行わない
    if ( m_ReadFlg = FALSE ) then
    begin

        // 入力値をﾁｪｯｸする
        if ( not fnTblFieldCheck ) then Abort;

        // MQueryの構築
        DmqUpd  := TMQuery.Create( Self );
        // DBとMQueryの接続
//<D10>	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqUpd );
		gfnJNTSelSetDbName(DmqUpd, m_cDBSelect);		//<D10>

        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
        m_cDataModule.BeginTran(m_cDBSelect);

        try

            with DmqUpd do
            begin
                Close();
                SQL.Clear();
                SQL.Add('SELECT * FROM MMEISHO      '
                    +   'WHERE  (SETNM   = :SETNM)  '
                    +   '  AND  (GCODE   = :GCODE)  '
                    +   '  AND  (RDelKBN = 0)       ');
                ParamByName('SETNM').AsInteger  :=  m_MasterKBN;
                // 外部ｺｰﾄﾞ
                if ( m_CodeAttr[MTab1.Items.Selected] in [0,1] ) then
                    ParamByName('GCODE').AsString   :=
                        Format ('%.16d', [StrToInt64(Trim(dxMD.FieldByName('GCODE').AsString))])
                else
                    ParamByName('GCODE').AsString   :=
                        Trim(dxMD.FieldByName('GCODE').AsString);
                Open();

                // 新規
                if ( EOF ) then
                begin
                    Close();
                    SQL.Clear();
                    SQL.Add('Insert into MMEISHO (                  '
                        +   ' SETNM, GCODE, RENSO, NM, NMK )        '
                        +   'Values (                               '
                        +   ' :SETNM, :GCODE, :RENSO, :NM, :NMK)    ');
                end
                // 更新
                else
                begin
                    Close();
                    SQL.Clear();
                    SQL.Add('Update MMEISHO set         '
                        +   '    RENSO = :RENSO         '
                        +   '   ,NM    = :NM            '
                        +   '   ,NMK   = :NMK           '
                        +   'WHERE  (SETNM   = :SETNM)  '
                        +   '  AND  (GCODE   = :GCODE)  '
                        +   '  AND  (RDelKBN = 0)       ');
                end;

                // 識別名
                ParamByName('SETNM').AsInteger      :=  m_MasterKBN;
                // 外部ｺｰﾄﾞ
                if ( m_CodeAttr[MTab1.Items.Selected] in [0,1] ) then
                    ParamByName('GCODE').AsString   :=
                        Format ('%.16d', [StrToInt64(Trim(dxMD.FieldByName('GCODE').AsString))])
                else
                    ParamByName('GCODE').AsString   :=
                        Trim(dxMD.FieldByName('GCODE').AsString);
                // 連想
                ParamByName('RENSO').AsString       :=  ds.DataSet.FieldByName('RENSO').AsString;
                // 正式名称
                ParamByName('NM').AsString          :=  ds.DataSet.FieldByName('NM').AsString;
                // 簡略名称(正式名称を簡略名称へｺﾋﾟｰする)
// <008>                ParamByName('NMK').AsString         :=  ds.DataSet.FieldByName('NMK').AsString;
                ParamByName('NMK').AsString         :=  MjsCopy(ds.DataSet.FieldByName('NM').AsString,30);
//<DOJI>        ExecSQL();
//↓<DOJI>
	            if ExecSQL = False then
	            begin
	                iErrCode := 0;
					if DmqUpd.EngineErrCount >= 1 then
					begin
						for iLoop := 1 to DmqUpd.EngineErrCount do
						begin
							EngineErr := DmqUpd.EngineErrs[iLoop - 1];
							if EngineErr.NativeError <> 0 then
							begin
								iErrCode := EngineErr.NativeError;
								break;
							end;
						end;
					end;
					case iErrCode of
		                -193,-196: uvSelSys.MsgDlg(10000, 10017); // 重複ｴﾗｰ。共通ﾒｯｾｰｼﾞ
		                -210:      uvSelSys.MsgDlg(10000, 10016); // ﾛｯｸｴﾗｰ。共通ﾒｯｾｰｼﾞ
		                else       uvSelSys.MsgDlg( 1030,   110); // それ以外のｴﾗｰ。販売ﾒｯｾｰｼﾞ
				    end;
					Abort;
				end;
//↑<DOJI>
                // ｺﾐｯﾄ
                m_cDataModule.Commit(m_cDBSelect);

            end;
        except
            m_cDataModule.Rollback(m_cDBSelect);
            DmqUpd.Close();
            DmqUpd.Free();
            raise; //<DOJI>
            Exit;
        end;

        DmqUpd.Close();
        DmqUpd.Free();

    end;

end;

(*
procedure TFrmJNTCRP019001f.TblBeforePost(DataSet: TDataSet);
var
    Fld     :   TField;
begin

    // 入力値をﾁｪｯｸする
    if ( not fnTblFieldCheck ) then Abort;

    // ﾚｺｰﾄﾞの項目に値を設定する
    with DS.DataSet do
    begin
        FieldByName('SETNM').AsInteger := m_MasterKBN;

		FLd     :=  FieldByName('GCODE');
        FLd.Tag :=  m_MasterKBN;
        //　ｺｰﾄﾞ属性対応
        m_cJNTArea.setAttr(FLd);
        FieldByName('GCODE')    .AsString   :=  Fld.AsString;
        FieldByName('NMK')      .AsString   :=  FieldByName('NM').AsString;
        FieldByName('RDelKbn')  .AsInteger  :=  0;
    end;

end;
*) // <006>

//-----------------------------------------------------------------------------
// dsStateChange()
//	< [ﾃﾞｰﾀｾｯﾄ]変更時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dsStateChange(Sender: TObject);
begin

    // [ｺｰﾄﾞ]の入力不可を切り替える
    with dxdbGrid1 do
    begin
// <006>        if ( Tbl.State in [dsInsert] ) then
        if ( dxMD.State in [dsInsert] ) then    // <006>
        begin
            Columns[0].ReadOnly      := FALSE;
            Columns[0].DisableEditor := FALSE;
        end
        else
        begin
            Columns[0].ReadOnly      := TRUE;
            Columns[0].DisableEditor := TRUE;

        end;

// <006>        if Tbl.Active then
        if dxMD.Active then // <006>
        begin
// <006>            if ( Tbl.RecordCount = 0 ) then
            if ( dxMD.RecordCount = 0 ) then // <006>
            begin
                Columns[0].ReadOnly      := FALSE;
                Columns[0].DisableEditor := FALSE;
            end;
        end;
    end;

   // ﾎﾞﾀﾝの状態を制御する
// <005>   fnBtnEnbChg();

end;

//-----------------------------------------------------------------------------
// fnBtnEnbChg()
//	< ﾎﾞﾀﾝの状態を制御する >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnBtnEnbChg;
var
   Bol  :   Boolean;
begin

// <006>    if ( Tbl.State = dsInactive ) then Exit;
    if ( dxMD.State = dsInactive ) then Exit;   // <006>

    // ﾎﾞﾀﾝの状態を制御する
    if ( m_IsDisplay = TRUE ) then
    begin
// <006>        if ( Tbl.RecordCount > 0 ) then
// <MAS 343>    if ( dxMD.RecordCount > 0 ) then // <006>
		if (dxdbGrid1.FocusedNode.Strings [1] <> '') then	// <MAS 343>
            Bol := m_cJNTArea.IsDelete
        else
            Bol := FALSE;

        MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnDelete', Bol);
    end
    else
        MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnDelete', FALSE);

// <006>    if ( Tbl.State = dsInsert ) then
    if ( dxMD.State = dsInsert ) then    // <006>
        MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnDelete', FALSE);

end;

//-----------------------------------------------------------------------------
// dxdbGrid1ChangeColumn()
//	< ｸﾞﾘｯﾄﾞﾌｫｰｶｽ変更時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node      :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                Column    :   Integer
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxdbGrid1ChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin

    // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙを保存する
    m_cACControl := Screen.ActiveControl;

    // IMEﾓｰﾄﾞを制御する
//<MAS 342>    fnIMEChg(Column);

end;

//-----------------------------------------------------------------------------
// fnIMEChg()
//	< IMEﾓｰﾄﾞを制御する >
//      PARAM   : Column    :   Integer
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
{
procedure TFrmJNTCRP019001f.fnIMEChg(Column: Integer);
var
    lvFieldName :   String;
begin

    lvFieldName :=  dxdbGrid1.Columns[Column].FieldName;

    if ( lvFieldName = 'NM' ) then
       gfnJNTSelIMECtrl(imHira)
    else if ( lvFieldName = 'FKEY' ) then
       gfnJNTSelIMECtrl(imSKata)
    else
       gfnJNTSelIMECtrl(imClose);

end;
}
//-----------------------------------------------------------------------------
// dxdbGridAllKeyPress()
//	< ｸﾞﾘｯﾄﾞｷｰ入力時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key       :   Char
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxdbGridAllKeyPress(Sender: TObject; var Key: Char);
begin
	// <MAS 364> -->
	if	(dxdbGrid1.FocusedColumn = 0) then
	begin
		if	(m_CodeAttr[m_FocuseTab] <= 1) then
		begin
			if	(((Key < '0') or (Key > '9')) and
				  (Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
			begin
				Beep ();
				Abort;
			end;
		end;
	end;
	{
    // ｺｰﾄﾞﾁｪｯｸ
    if ( uvSelSys.KeyChk(TComponent(Sender),Key) = FALSE ) then
        Abort;
    }
	// <MAS 364> <--
end;

//-----------------------------------------------------------------------------
// dxdbGridAllKeyPress()
//	< ﾍﾟｰｼﾞｺﾝﾄﾛｰﾙ変更時処理 >
//      PARAM   : Sender        :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : AllowChange   :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.pgcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin

    AllowChange := TRUE;

// <006>    if ( Tbl.State in [dsEdit, dsInsert] ) then
    if ( dxMD.State in [dsEdit, dsInsert] ) then // <006>
    begin
       if ( not fnTblFieldCheck ) then
         AllowChange := FALSE;

    end;

end;

//-----------------------------------------------------------------------------
// MTab1Change()
//	< ﾍﾟｰｼﾞ変更時処理 >
//      PARAM   : Sender        :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.MTab1Change(Sender: TObject);
// <007>var
// <007>    Item: TMTabItems;
begin

    // 初期表示の時はExit
    if ( m_MasterKBN = 0 ) then Exit;

    if ( m_bFirstFlag = FALSE ) then Exit;

    m_FocuseTab :=  MTab1.Items.Selected;   // <007>

// <007>    Item := MTab1.Items;
// <007>    fnSetMasterKbn(Item.Selected);

    m_MasterKBN :=  m_MTabSETNM[m_FocuseTab];  // <007>

    // ﾃﾞｰﾀ表示処理<006><007>
    fnGetData(m_FocuseTab);

// <006>    fnTblOpen();
    DSStateChange(ds);

	fnBtnEnbChg();		// <MAS 343>

    // 先頭ﾌｨｰﾙﾄﾞへﾌｫｰｶｽ設定
    if ( m_TabFlg = FALSE ) then
    begin
        m_TabFlg := TRUE;
        Exit;
    end
    else
    begin
        if ( ScrollBox1.Visible ) then
            // 先頭項目にﾌｫｰｶｽをｾｯﾄする
            MjsDispCtrl.MjsSetFocus(Self,'dxdbGrid1');
    end;

end;


//-----------------------------------------------------------------------------
// fnGetGrants()    <002>
//	< 決算確定・権限取得 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnGetGrants();
begin

    // 権限の取得
    m_cJNTArea.FxPermission;

    m_IsAppend      :=  m_cJNTArea.IsAppend;        // 追加権限
    m_IsModify      :=  m_cJNTArea.IsModify;		// 更新権限
    m_IsDelete      :=  m_cJNTArea.IsDelete;        // 削除権限
//    m_IsDisplay     :=  m_cJNTArea.IsDisplay;       // 表示権限
    m_IsDisplay     :=  True;       				// 表示権限
    m_IsPrint       :=  m_cJNTArea.IsPrint;			// 印刷権限

    // 印刷ﾎﾞﾀﾝ
    MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnPrint', m_IsPrint);
//    UpSBtnPrint.Enabled :=  FALSE;  // <PRN>→<011>

    // 決算確定
    if ( m_cJNTArea.IsKessan(FALSE) = 1 ) then
        // 決算確定の為参照のみ
	    giReferFlag	:= REFER
	else
    begin
        if ( giReferFlag <> REFER ) then
	    begin
	        if ( m_IsModify and m_IsAppend ) then
                // 通常ﾓｰﾄﾞ
		        giReferFlag	:= NORMAL
		    else
                // 参照ﾓｰﾄﾞ
		        giReferFlag	:= REFER;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnPrepareComboList()    <004>
//	< 分類種別ｺﾝﾎﾞの作成 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : MasterInfoの採用情報により作成
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnPrepareComboList();

    // MasterInfoから採用区分件数を取得
    function fnCheakUseKbn(nStCODE, nEdCODE: Integer): Integer;
    var
        DmqMastrInfo    :   TMQuery;
    begin

        // MQueryの構築
        DmqMastrInfo    :=  TMQuery.Create (Self);
        // DBとMQueryの接続
//<D10>	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqMastrInfo );
		gfnJNTSelSetDbName(DmqMastrInfo, m_cDBSelect);		//<D10>

        with DmqMastrInfo do
        begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT Count(*) CNT FROM MasterInfo            '
                +   'WHERE  (MasterKbn between :STCODE AND :EDCODE) '
                +   '  AND  (UseKbn = 1)                            ');

            ParamByName('STCODE').AsInteger :=  nStCODE;
            ParamByName('EDCODE').AsInteger :=  nEdCODE;

            Open();
            Result  :=  GetFLD('CNT').AsInteger;

            if ( Result <> 0 ) then
                // 採用の場合、分類1のﾏｽﾀ区分をTStringListへ保持
                m_ComboList.Add(IntToStr(nStCODE));

        end;

        DmqMastrInfo.Close();
        DmqMastrInfo.Free();
    end;

begin

    // ﾘｽﾄのｸﾘｱ
    ECombo_Header.Items.Clear();
    m_ComboList.Clear();

    // 分類1～10の全てが未採用の場合は分類種別ｺﾝﾎﾞに追加しない

    // 商品分類
    if ( fnCheakUseKbn(uaSetSO[0],uaSetSO[7]) <> 0 ) or
       ( fnCheakUseKbn(uaSetSO[8],uaSetSO[9]) <> 0 ) then                       // <017>
        ECombo_Header.Items.Add(ucSOBUN);
    // 得意先分類
    if ( fnCheakUseKbn(uaSetTR[0],uaSetTR[7]) <> 0 ) or
       ( fnCheakUseKbn(uaSetTR[8],uaSetTR[9]) <> 0 ) then                       // <017>
        ECombo_Header.Items.Add(ucTKBUN);
    // 仕入先分類
    if ( fnCheakUseKbn(uaSetSI[0],uaSetSI[7]) <> 0 ) or
       ( fnCheakUseKbn(uaSetSI[8],uaSetSI[9]) <> 0 ) then                       // <017>
        ECombo_Header.Items.Add(ucSSBUN);
    // 部門分類
    if ( fnCheakUseKbn(uaSetBM[0],uaSetBM[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucBMBUN);
(*
    // 担当者分類
    if ( fnCheakUseKbn(uaSetTN[0],uaSetTN[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucTNBUN);
*) // <003>
    // 売上系伝票分類
    if ( fnCheakUseKbn(uaSetUR[0],uaSetUR[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucURBUN);
    // 仕入系伝票分類
    if ( fnCheakUseKbn(uaSetSR[0],uaSetSR[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucSRBUN);
    // 倉庫分類
    if ( fnCheakUseKbn(uaSetSK[0],uaSetSK[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucSKBUN);
    // 科目分類
    if ( fnCheakUseKbn(uaSetKM[0],uaSetKM[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucKMBUN);
    // 科目別補助分類
    if ( fnCheakUseKbn(uaSetKH[0],uaSetKH[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucKHBUN);
    // ｾｸﾞﾒﾝﾄ分類
    if ( fnCheakUseKbn(uaSetSG[0],uaSetSG[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucSGBUN);
    // ﾌﾟﾛｼﾞｪｸﾄ分類
    if ( fnCheakUseKbn(uaSetPJ[0],uaSetPJ[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucPJBUN);
    // 銀行分類
    if ( fnCheakUseKbn(uaSetBk[0],uaSetBk[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucBKBUN);
    // 社員分類
    if ( fnCheakUseKbn(uaSetSY[0],uaSetSY[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucSNBUN);
    // 汎用補助1分類
    if ( fnCheakUseKbn(uaSetF1[0],uaSetF1[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucH1BUN);
    // 汎用補助2分類
    if ( fnCheakUseKbn(uaSetF2[0],uaSetF2[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucH2BUN);
    // 汎用補助3分類
    if ( fnCheakUseKbn(uaSetF3[0],uaSetF3[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucH3BUN);
    // 汎用補助4分類
    if ( fnCheakUseKbn(uaSetF4[0],uaSetF4[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucH4BUN);
    // 汎用補助5分類
    if ( fnCheakUseKbn(uaSetF5[0],uaSetF5[9]) <> 0 ) then
        ECombo_Header.Items.Add(ucH5BUN);

    //<012>　↓
    // 資産分類
    if ( fnCheakUseKbn(uaSetDP[0],uaSetDP[9]) <> 0 ) then
    begin
        ECombo_Header.Items.Add(ucDPBUN);
    end;
    //<012>　↑
end;

//-----------------------------------------------------------------------------
// dxdbGrid1Enter()    <005>
//	< ｸﾞﾘｯﾄﾞﾌｫｰｶｽ取得時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxdbGrid1Enter(Sender: TObject);
begin

    // 削除権限がある場合はﾎﾞﾀﾝを使用可にする
    fnBtnEnbChg();

end;

//-----------------------------------------------------------------------------
// dxdbGrid1Exit()    <005>
//	< ｸﾞﾘｯﾄﾞﾌｫｰｶｽ消失時処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.dxdbGrid1Exit(Sender: TObject);
begin

    // ｸﾞﾘｯﾄﾞからﾌｫｰｶｽを消失した時は削除ﾎﾞﾀﾝは使用不可にする
    MjsDispCtrl.MjsSetEnabled(Self, 'UpSBtnDelete', FALSE);

end;

//-----------------------------------------------------------------------------
// fnGetData()    <006>
//	< ﾃﾞｰﾀ表示処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP019001f.fnGetData(nItemNo: Integer);
var
    DmqData  :   TMQuery;
begin

    m_ReadFlg   :=  TRUE;

    if ( dxMD.Active ) then dxMD.Close();
    dxMD.Open();
    ds.DataSet  :=  dxMD;

    // ｸﾞﾘｯﾄﾞ桁数設定
//    colGCODE.MaxLength  :=  m_CodeDigit[MTab1.Items.Selected];
    colGCODE.MaxLength  :=  m_CodeDigit[nItemNo];   // <007>
//    colGCODE.Tag        :=  m_MasterKBN;			
//    m_cJNTArea.inzGrid(dxdbGrid1);

	// <MAS 364> -->
    // 外部ｺｰﾄﾞ属性対応
    case m_CodeAttr[nItemNo] of // <007>
        // 数値属性
        0:  begin
                dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
				dxdbGrid1.Columns[0].ImeMode		:= imDisable;
				dxdbGrid1.Columns[0].Hankaku		:= FALSE;
            end;
        // 数値(前ｾﾞﾛ有)属性
        1:  begin
                dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
				dxdbGrid1.Columns[0].ImeMode		:= imDisable;
				dxdbGrid1.Columns[0].Hankaku		:= FALSE;
            end;
        // ﾌﾘｰ属性
        2:  begin
                dxdbGrid1.Columns[0].Alignment      :=  taLeftJustify;
                dxdbGrid1.Columns[0].EditAlignment  :=  taLeftJustify;
				dxdbGrid1.Columns[0].ImeMode		:= imClose;
				dxdbGrid1.Columns[0].Hankaku		:= TRUE;
            end;
    end;
	// <MAS 364> <--

    dxMD.DisableControls();

    // MQueryの構築
    DmqData    :=  TMQuery.Create (Self);
    // DBとMQueryの接続
//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
	gfnJNTSelSetDbName(DmqData, m_cDBSelect);		//<D10>

    with DmqData do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT * FROM MMEISHO      '
            +   'WHERE  (SETNM   = :SETNM)  '
            +   '  AND  (RDelKBN = 0)       ');
        SQL.Add(' ORDER BY GCode ');            //<014>
        ParamByName('SETNM').AsInteger  :=  m_MasterKBN;
        Open();

        while not EOF do
        begin
            dxMD.Append();
            dxMD.FieldByName('SETNM').AsInteger :=  m_MasterKBN;

            // 外部ｺｰﾄﾞ属性対応
// <007>            case m_CodeAttr[MTab1.Items.Selected] of
            case m_CodeAttr[nItemNo] of // <007>
                // 数値属性
                0:  begin
                        dxMD.FieldByName('GCODE').AsString  :=
// <007>                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[MTab1.Items.Selected], 0);
                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[nItemNo], 0);  // <007>
                        dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                        dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
						// <MAS 364> -->
						dxdbGrid1.Columns[0].ImeMode		:= imDisable;
						dxdbGrid1.Columns[0].Hankaku		:= FALSE;
						// <MAS 364> <--
                    end;
                // 数値(前ｾﾞﾛ有)属性
                1:  begin
                        dxMD.FieldByName('GCODE').AsString  :=
// <007>                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[MTab1.Items.Selected], 1);
                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[nItemNo], 1);  // <007>
                        dxdbGrid1.Columns[0].Alignment      :=  taRightJustify;
                        dxdbGrid1.Columns[0].EditAlignment  :=  taRightJustify;
						// <MAS 364> -->
						dxdbGrid1.Columns[0].ImeMode		:= imDisable;
						dxdbGrid1.Columns[0].Hankaku		:= FALSE;
						// <MAS 364> <--
                    end;
                // ﾌﾘｰ属性
                2:  begin
                        dxMD.FieldByName('GCODE').AsString  :=
// <007>                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[MTab1.Items.Selected], 2);
                        m_cComArea.SetDspCodeAttr(GetFld('GCODE').AsString, m_CodeDigit[nItemNo], 2);  // <007>
                        dxdbGrid1.Columns[0].Alignment      :=  taLeftJustify;
                        dxdbGrid1.Columns[0].EditAlignment  :=  taLeftJustify;
						// <MAS 364> -->
						dxdbGrid1.Columns[0].ImeMode		:= imClose;
						dxdbGrid1.Columns[0].Hankaku		:= TRUE;
						// <MAS 364> <--
                    end;
            end;

            dxMD.FieldByName('RENSO').AsString  :=  GetFld('RENSO').AsString;
            dxMD.FieldByName('NM')   .AsString  :=  GetFld('NM')   .AsString;
            dxMD.FieldByName('NMK')  .AsString  :=  GetFld('NMK')  .AsString;
            dxMD.Post();

            Next;
        end;

        if ( dxMD.RecordCount <> 0 ) then dxMD.First();
    end;

    DmqData.Close();
    DmqData.Free();
    dxMD.EnableControls();
    m_ReadFlg   :=  FALSE;

end;




// <MAS 343> -->
procedure TFrmJNTCRP019001f.dxdbGrid1ChangeNodeEx(Sender: TObject);
begin
    fnBtnEnbChg();
end;
// <MAS 343> <--

// <011>
//**********************************************************************
//*		Proccess	:	印刷情報SET
//*		Name		:	K.Katou
//*		Date		:	2006/01/24
//*		Return		:	True: 結果あり False: 結果なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TFrmJNTCRP019001f.PrnSet(iMasterKbn: Integer; iOrder: Integer; stStart: String; stEnd: String): Boolean;
var
	QueryRead	:	TMQuery;
begin
    Result := True;
	QueryRead := TMQuery.Create( Self );					    //  MQueryの構築

//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QueryRead );   //	DBとMQueryの接続
	gfnJNTSelSetDbName(QueryRead, m_cDBSelect);		//<D10>

	// DataSet
    MemPrint.Close;
	MemPrint.Open;
	MemPrint.First;
	with QueryRead do
	begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT * FROM MMEISHO      '
            +   'WHERE  (SETNM   = :SETNM)  '
            +   '  AND  (RDelKBN = 0)       ');

        ParamByName('SETNM').AsInteger  := iMasterKbn;
        Open();

        // 出力範囲指定
        if (stStart <> '') and (stEnd = '') then
		begin
			SQL.ADD(' AND GCode >= :StartGCode');
			ParamByName('StartGCode').AsString	:=	stStart;
		end
		else if (stStart = '') and (stEnd <> '') then
		begin
		    SQL.ADD(' AND GCode <= :EndGCode');
			ParamByName('EndGCode').AsString	:=	stEnd;
		end
		else if (stStart <> '') and (stEnd <> '') then
		begin
			SQL.ADD(' AND GCode >= :StartGCode');
			SQL.ADD(' AND GCode <= :EndGCode');
			ParamByName('StartGCode').AsString	:=	stStart;
			ParamByName('EndGCode').AsString	:=	stEnd;
		end;

        // 出力順序
        if iOrder = 0 then                  // ｺｰﾄﾞ順
    		SQL.Add(' order by GCode')
        else                                // 連想順
            SQL.Add(' order by Renso, GCode ');

		if (Open = False) then
		begin
			QueryRead.Close;
			Exit;
		end;
        // ﾃﾞｰﾀの存在ﾁｪｯｸ
        if ( RecordCount = 0 ) then
        begin
	    	uvSelSys.MsgDlg(2010,10);
            Result := False;
    		Close;
        	Free;
            Exit;
        end;

		DataDsp_Print(QueryRead);

		Close;
	end;

	MemPrint.First;

	QueryRead.Free;

end;
// <011>
//**************************************************************************
//	Proccess  :	読み込んだﾃﾞｰﾀをMemDataにSET ***印刷***
//	Name	  :	K.Katou
//	Date	  :	2006/01/24
//	Parameter :
//	Return	  :
//	History	　:	2001/99/99  X.Xxxxxx
//				XXXXXXXX修正内容
//**************************************************************************
procedure TFrmJNTCRP019001f.DataDsp_Print(Query : TMQuery);
var
    iAttr   : Integer;
    iDigit  : Integer;
    DmqData : TMQuery;
begin
    iAttr := 0;
    iDigit := 0;
    DmqData := TMQuery.Create( Self );					    //  MQueryの構築

//<D10>m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );   //	DBとMQueryの接続
	gfnJNTSelSetDbName(DmqData, m_cDBSelect);		//<D10>

    with DmqData do
    begin
        Close();
        Sql.Clear();
        Sql.Add('Select JHojyoName,UseKbn,CodeDigit,CodeAttr    '
            +   'FROM MasterInfo                                '
            +   'WHERE  (MasterKBN = :pKBN)                     ');
//<016>
//        ParamByName('pKBN').AsInteger := uvHani.pvMasterKbn + uvHani.pvrPattern;
        ParamByName('pKBN').AsInteger := uvHani.pvMasterKbn;
        Open();

        if not Eof then
        begin
            iAttr := GetFld('CodeAttr').AsInteger;
            iDigit := GetFld('CodeDigit').AsInteger;
        end;
        Close();
        Free();
    end;

	with Query do
	begin
		while EOF = False do			    // 登録あり
		begin
			MemPrint.Append;
                                            // ﾌｫｰﾏｯﾄ後の外部ｺｰﾄﾞをｾｯﾄ
            MemPrint.FieldByName('GCODE').AsString := GetDspGCode(iAttr, iDigit, GetFld('GCode').AsString);
			MemPrint.FieldByName('NMK').AsString := GetFld('Nmk').AsString;
			MemPrint.FieldByName('RENSO').AsString := GetFld('Renso').AsString;
			MemPrint.FieldByName('SETNM').AsInteger := GetFld('SetNm').AsInteger;

			MemPrint.Post;
			Next;
		end;
	end;

end;

//------------------------------------------------------------------------------
//  外部ｺｰﾄﾞをﾌｫｰﾏｯﾄして返す<011>
//------------------------------------------------------------------------------
function TFrmJNTCRP019001f.GetDspGCode(iAttr, iDigit: Integer; strGCode: String): String;
var
    strFormat   : String;
    strTmp   : String;
begin
    if strGCode = '' then
    begin
        Result := '';
        Exit;
    end;

	if iAttr = CODE_ATTR_FREE then
		strTmp := TrimRight(strGCode)
	else
		strTmp := Trim(strGCode);

    // 数値属性の処理
    if iAttr <> CODE_ATTR_FREE then
    begin
        if iAttr = CODE_ATTR_NUM then
            strFormat := '%d'
        else
            strFormat := '%.' + IntToStr(iDigit) + 'd';

        strTmp := Format(strFormat, [StrToInt64(Trim(strTmp))]);
	end
    else
    begin
        strTmp := strGCode;
    end;

    Result := strTmp;

end;

//<CHK> ↓
//**********************************************************************
//*		Proccess	:	人給の削除ﾁｪｯｸ <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/13
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TFrmJNTCRP019001f.fnDelHAPCheck(exNCode: Extended; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;

    try
//<D10>	SPHAPMEI.DatabaseName := m_cDBSelect.DatabaseName;
//<D10>	SPHAPMEI.SessionName  := m_cDBSelect.SessionName;
		gfnJNTSelSetDbName(SPHAPMEI, m_cDBSelect);		//<D10>

        // 【人給】MP_HAP_CHK_MMEISHO
        with SPHAPMEI do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_HAP_CHK_MMEISHO)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 削除可

end;
//<015>  Del↓
//**********************************************************************
//*		Proccess	:	資産の削除ﾁｪｯｸ <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/13
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
{
function    TFrmJNTCRP019001f.fnDelDEPCheck(exNCode: Extended; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result  :=False;
    try
        SPDEPMEI.DatabaseName := m_cDBSelect.DatabaseName;
        SPDEPMEI.SessionName  := m_cDBSelect.SessionName;

        // 【資産】MP_DEP_CHK_MMEISHO
        with SPDEPMEI do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_DEP_CHK_MMEISHO)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 削除可
end;
}
//<015>　↑

//<2562>ST
//**********************************************************************
//*		Proccess	:	販売の削除ﾁｪｯｸ <2562>
//*		Name		:	中尾 晃(LEAD)
//*		Date		:	2016/07/22
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     iMKbn   : ﾏｽﾀ区分
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TFrmJNTCRP019001f.fnDelSELCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;

    try
//<D10>	SPSelHoj.DatabaseName := m_cDBSelect.DatabaseName;
//<D10>	SPSelHoj.SessionName  := m_cDBSelect.SessionName;
		gfnJNTSelSetDbName(SPSelHoj, m_cDBSelect);		//<D10>

        // 【販売】MP_SEL_CHK_HOJYOMA
        with SPSelHoj do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
            ParamByName('@MasterKbn').AsInteger := iMKbn;

            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_SEL_CHK_HOJYOMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 削除可

end;
//<2562>ED

//**********************************************************************
//*		Proccess	:	内部ｺｰﾄﾞ取得 <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/13
//*		Return		:	内部ｺｰﾄﾞ(0:ﾃﾞｰﾀなし・-1:ｴﾗｰ・その他:内部ｺｰﾄﾞ)
//**********************************************************************
function TFrmJNTCRP019001f.fnGetNCode(): Extended;
var
     dqMasterData :TMQuery;
     nInCode:Extended;
begin

	dqMasterData	:= TMQuery.Create (Self);

    try
//<D10>	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	// DBとMQueryの接続
		gfnJNTSelSetDbName(dqMasterData, m_cDBSelect);		//<D10>

	    with (dqMasterData) do
	    begin
		    Close ();
		    SQL.Clear ();

            SQL.Add   ('SELECT NCode FROM MMEISHO ');
            SQL.Add   ('WHERE (GCODE   = :CODE)   ');
            SQL.Add   (' AND (SETNM   = :SETNM)   ');
            SQL.Add   (' AND (RDelKbn = 0)        ');

		    if ( m_CodeAttr[MTab1.Items.Selected] in [0,1] ) then
                    ParamByName('CODE').AsString   :=
                        Format ('%.16d', [StrToInt64(Trim(dxMD.FieldByName('GCODE').AsString))])
                else
                    ParamByName('CODE').AsString   :=
                        Trim(dxMD.FieldByName('GCODE').AsString);

            ParambyName('SetNM').AsString       :=  IntToStr(m_MasterKBN);

		    Open ();

		    if	(EOF) then      // ﾃﾞｰﾀ無
		    begin
                dqMasterData.Close;
			    dqMasterData.Free ();
                Result  := 0;
                Exit;
            end;
                               // 取得した内部ｺｰﾄﾞ
            nInCode   :=  FieldByName('NCode').AsFloat;
        end;
    except                     // ｴﾗｰ
            dqMasterData.Close;
	        dqMasterData.Free ();
            Result  := -1;
		    Exit;
    end;

    dqMasterData.Close;
    dqMasterData.Free ();

    Result :=  nInCode;

end;
// <CHK> ↑

//**********************************************************************
//	Proccess	:	ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ <018>
//	Name		:	K.Takahashi
//	Date		:	2007/03/08
//	Parameter	:
//	Return		:	True: 正常 False: 異常
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TFrmJNTCRP019001f.fnChkGroupKbn(): Boolean;
var
    mqCtrlDb : TMQuery;

begin

    Result      := True;

    mqCtrlDb := TMQuery.Create(Self);

    try
        m_cDataModule.SetDBInfoToQuery(m_cDBSelect, mqCtrlDb);

        with mqCtrlDb do
        begin
            Close();
            SQL.Clear();
            SQL.Add('select * from SecMain');
            // ｸﾞﾙｰﾌﾟ管理、採用有、受信会社
            SQL.Add('where (OpeKbn = 2) and (UseKbn = 1) and (GrpTransKbn = 1)');

            // ｴﾗｰの判定
            if (Open = False) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB(m_MjsMsgRec, mqCtrlDb);
                MjsMessageBoxEx(Self,
                                m_MjsMsgRec.sMsg,
                                m_MjsMsgRec.sTitle,
                                m_MjsMsgRec.icontype,
                                m_MjsMsgRec.btntype,
                                m_MjsMsgRec.btndef,
                                False
                               );


		        giReferFlag	:= REFER;                                           // 参照ﾓｰﾄﾞ

                Result := False;
                Exit;
            end;

            // ﾚｺｰﾄﾞが存在する場合は、子会社としてｸﾞﾙｰﾌﾟ管理されている
            if (not Eof) then
            begin
                MJSMessageBoxEx(Self, 'ｸﾞﾙｰﾌﾟ管理が採用されている為、追加、修正、削除は'
                                    + '配信会社で行ってください。','分類登録',
                                    mjInformation, mjOk, mjDefOk, FALSE);

		        giReferFlag	:= REFER;                                           // 参照ﾓｰﾄﾞ
            end;
        end;
    finally
        mqCtrlDb.Close();
        mqCtrlDb.Free();
    end;

end;

end.
