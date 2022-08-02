//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登録　会計情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上 佳美(LEAD)
//      作成日      ：2005.02.03(THU)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <100>   井上 佳美   2005/07/01(FRI) ﾃﾝﾌﾟﾚｰﾄ機能を追加。
//  <101>   井上 佳美   2005/08/01(MON) 権限機能を追加。
//  <102>   井上 佳美   2005/08/12(FRI) JNTCommonを親から引き継ぐように修正。
//  <103>   高橋 功二   2005/08/24(WED) TMJSAppRecordを親から引き継ぐように修正。
//  <104>   高橋 功二   2005/08/25(THU) ﾃﾝﾌﾟﾚｰﾄ区分(TemplateKbn)の考慮。
//  <PRN>   茂木 勇次   2008/08/26(FRI) 印刷機能の追加。
//  <105>   高橋 功二   2005/09/06(TUE) 印刷機能の正式実装まで印刷ﾎﾞﾀﾝをDiableする。
//  <106>   高橋 功二   2005/09/13(TUE) 細目科目がﾌﾘｰ属性の場合、禁則文字入力を考慮する。
//  <107>   茂木 勇次   2005.09.28(WED) 切出/埋込ﾎﾞﾀﾝを継承し、子側で処理を行う。
//  <108>   飯塚 健介   2005.10.12(WED) ﾃﾞｰﾀ読み込み時に資金繰り情報の名称を取得。
//  <109>   飯塚 健介   2005.10.12(WED) BitBtnでのｷｰ制御一部見直し。
//  <110>   茂木 勇次   2005.10.18(WED) ｷｰの修正。
//  <122>   飯塚 健介   2005/10/21(FRI) ０ｺｰﾄﾞ入力可能。
//  <111>   加藤(PRIME) 2005/10/26(WED) 終了確認機能追加。
//  <112>   加藤(PRIME) 2005/11/07(MON) 終了をｷｬﾝｾﾙしてもSelCorpSysを解放する不具合修正。
//	<HAN>   広田(PRIME) 2005/12/08(THU) 印刷時の範囲指定修正。
//  <113>   加藤(PRIME) 2005/12/13(TUE) 〒Expのinitを2度呼んでいるのを修正。
//  <   >   加藤(PRIME) 2005/12/13(TUE) 住所上段ﾌｫｰｶｽ時にﾎﾞﾀﾝを表示。
//  <114>   飯塚 健介   2006/01/27(FRI) 更新後に変更ﾌﾗｸﾞがTrueになってしまう不具合を修正。
//  <115>   kobayaashi  2006/12/13(MON) 更新すると郵便番号枝番に０が残る不具合を修正。
//  <Rel>   高橋 功二   2007/05/22(TUE) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <   >   高橋 功二   2007/05/22(TUE) 送付先部署の入力桁数(MaxLength)を20から40へ変更
//	<116>	渡邊 慎太郎 2007/07/02(MON) 決算確定の判定は親側で行うため子でメッセージを出さない
//	<117>	関(PRIME)	2008/01/29(TUE)	ﾏｽﾀ更新履歴対応
//	<118>	大竹 文顕   2008/02/21(THU)	ﾘｽｸ区分追加
//  <119>   黒田 祐生   2010/05/27(THU) MLBplLoader対応(LoadPackageの置換)
//  <120>   大田原(MSI) 2010/10/29(FRI) ﾌｫｰｶｽ移動先を修正(取引先ｺｰﾄﾞ→取引先分類)。
//  <121>   大田原(MSI) 2011/05/13(FRI) 印刷モジュールをUnLoadしていなかった点を修正
//================== Ver4.08/NX-Ⅰ5.01 修正 Start =============================
//  <Shift> 小川(LEAD)  2012/02/10(FRI) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//  <Gali2258> 小川(LEAD) 2012/02/10 起動時エラーの回避(Gali2258)
//
//================== Ver4.08/NX-Ⅰ5.01 修正 Start =============================
//  <Authority> 小川(LEAD) 2012.06.22(Fri) サブモジュールの権限管理対応

//================== Ver4.11/NX-Ⅰ5.04 修正 Start =============================
//  <123> 	槇野 誠		2013.07.12(Fri) H26消費税率改正対応
//  <124> 	槇野 誠		2014.01.20(Mon) 取引先16桁対応。f0CODE(Width)とfNAME(Left)プロパティのみ修正。
//  <125> 	大下(3A)    2014.06.11(WED) 有価証券の消費税コード名称変更
//================== Ver4.13/NX-Ⅰ5.07 修正 Start =============================
//  <   >   張  亜新    2015.03.10(TUE) 住所欄でF4押しても郵便番号検索エクスプローラが表示されない(属性F4Arrow：False→True)
//================== Ver4.13/NX-Ⅰ5.08 修正 Start =============================
//  <126>   張  亜新    2015.06.22(Mon) リバースチャージ対応　特定課税仕入の消費税コード(80番台)を設定出来るように対応
//  <127>   張　亜新    2015.07.09(THU) 売上消費税コードのコンボには、売上の80番台の消費税コードは表示されないが、
//                                      手入力で売上の80番台の消費税コードを設定すると、設定できてしまう。
//================== Ver5.15/MLX 1.21 修正 Start =============================
//  <#TAX10>見竹(LEAD)  2019 / 04 / 15  消費税10%改正対応
//================== Ver5.15/MLX 1.23 修正 Start =============================
//	<128>	蔦　光洋	2020.05.12(TUE)	グループ会社管理対応
//=============================================================================
{$DEFINE TaxRateInfo_JNT}                                                       //<#TAX10>


unit JNTCRP004002U;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
    VCL.StdCtrls, ComCtrls, Buttons, VCL.ExtCtrls, FileCtrl,

	MJSStatusBar, MJSBitBtn, MJSFunctionBar, MJSSPFunctionBar, MJSLabel, MJSPanel,
    MJSCheckBox, MJSSpeedButton, MJSEdits, MJSQuery, MJSRadioButton, MJSGroupBox,
    MJSComboBox,

    MJSCommonu, MjsDBModuleu, MjsDateCtrl, MjsDispCtrl, MjsMsgStdU, {MjsFolderU,}
    CMNExpFuncU, MjsStrCtrl, MJSPostCtrl,
	DB, FireDAC.Comp.Client, DBCtrls, dxmdaset, dxTL, dxDBGrid, dxCntner, dxGrClms,
    //myChkBox,
    daDatMod,JNTCommonU,

    JNTSelGlobal,
    JNTMasComu,        //<LEAD> 財務に統一
    JNTMasWndIFu,
    JNTSelCorpSys,
    MJSKeyDataState,  //<Shift> ADD
// <PRN>    MjsPreviewIFu,  //<LEAD>
    MjsPrnDlgU,
// <PRN>    MjsPrnSupportU,
    JNTMasMonth, MJSTab, MJSMemo, ActnList,
    JNTFuncU,
    JNTExpGlobal,
    JNTPDlg,                                                // <PRN>
    MLBplLoaderU,   //<119>
    SeriesCheck2U, //<128>
    JNTAuthorityu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;// <Authority> ADD

  const
	WM_ONPAINT	= WM_APP + 1;	                            // OnPaint 時の処理起動メッセージ用

	// -----<117> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<117> Add-Ed-----

type
  {$include ActionInterface.inc}
  {$include MasCommonFuncH.inc}
  {$include JNTSelPrtIF.inc}                                // <PRN>
  {$include JNTCRPSyncMasterH.inc}                          // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
  {$include MASTaxRateInfoH.inc}							// <123> 消費税率情報クラス

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

   structSDTSave	= Record//<128>add
   iDataCode	:	Integer;//会社コード//<128>add
   sSubName     :   String;//簡略名称//<128>add
   end;

  TJNTCRP004002F = class(TForm)
	DSrcTanka: TDataSource;
	DMemRitu: TdxMemData;
	DMemRituRitu: TStringField;
	DMemRituTaxRitu: TFloatField;
	DSrcRitu: TDataSource;
	lStatusMessage: TMLabel;
	KanaAdd1: TMFurigana;
	KanaAdd2: TMFurigana;
	DMemRituFieldName: TStringField;
	DMemRituTableName: TStringField;
    DtlCmnClientPanel: TMPanel;
    ScrollBox2: TScrollBox;
    PTop: TScrollBox;
    PSousa: TScrollBox;
    DtlCs1LabelGroupCommentSales: TMLabel;
    DtlCs1LabelDescTaxCodeSales: TMLabel;
    URLabel: TMLabel;
    f1URTaxNM: TMLabel;
    DtlCs1LabelGroupCommentStock: TMLabel;
    DtlCs1LabelDescTaxCodeStock: TMLabel;
    SILabel: TMLabel;
    f1SITaxNM: TMLabel;
    f1URTaxCD: TMNumEdit;
    f1URTaxCDNM: TMPanel;
    f1URTax: TMNumEdit;
    f1SITaxCD: TMNumEdit;
    f1SITax: TMNumEdit;
    f1SITaxCDNM: TMPanel;
    f0CODE: TMTxtEdit;
    LabTRNM: TMLabel;
    MLabel3: TMLabel;
    MLabel25: TMLabel;
    MLabel18: TMLabel;
    f1T_KRSKCD: TMNumEdit;
    f1T_KSSKCD: TMNumEdit;
    f1T_KRSKNM: TMPanel;
    f1T_KSSKNM: TMPanel;
    fNAME: TMTxtEdit;
    MLabel4: TMLabel;
    MLabel5: TMLabel;
    MLabel6: TMLabel;
    f1S_KRSKCD: TMNumEdit;
    f1S_KSSKCD: TMNumEdit;
    f1S_KRSKNM: TMPanel;
    f1S_KSSKNM: TMPanel;
    MLabel2: TMLabel;
    MLabel8: TMLabel;
    MLabel9: TMLabel;
    MLabel10: TMLabel;
    MLabel11: TMLabel;
    MLabel12: TMLabel;
    MLabel13: TMLabel;
    Jituzai_PPanel_Card_2: TMPanel;
    BUpdate_Sousa: TMBitBtn;
    BCancel_Sousa: TMBitBtn;
    MPanel3: TMPanel;
    SStatusBar: TMStatusBar;
    AddPanel: TScrollBox;
    LblYUBIN: TMLabel;
    LblJUSHO1: TMLabel;
    LblTEL: TMLabel;
    Label1: TMLabel;
    MLabel1: TMLabel;
    Label2: TMLabel;
    Label48: TMLabel;
    MLabel16: TMLabel;
    f1POSTNO1: TMNumEdit;
    f1POSTNO2: TMNumEdit;
    f1ADS1: TMTxtEdit;
    f1ADS2: TMTxtEdit;
    f1TEL1: TMTxtEdit;
    f1SOFUB: TMTxtEdit;
    f1KEISYO: TMTxtEdit;
    f1MailAd: TMTxtEdit;
    f1TANM: TMTxtEdit;
    MSPFunctionBar: TMSPFunctionBar;
    BRCDLab: TMLabel;
    f1BRCD: TMNumEdit;
    f1BRNM: TMLabel;
    MDPrint: TdxMemData;
    MDPrintGCode: TStringField;
    MDPrintRenso: TStringField;
    MDPrintNmk: TStringField;
    MDPrintNm: TStringField;
    MDPrintPostNo1: TStringField;
    MDPrintPostNo2: TStringField;
    MDPrintTStartDate: TStringField;
    MDPrintTEndDate: TStringField;
	//@ ↓12.02　TDateTimeFieldから変更
    MDPrintUpdDateTM: TStringField;
	//@ ↑12.02
    MDPrintAds1: TStringField;
    MDPrintAds2: TStringField;
    MDPrintTel1: TStringField;
    MDPrintSectNm: TStringField;
    MDPrintTanNm: TStringField;
    MDPrintKeisyo: TStringField;
    MDPrintMail: TStringField;
    MDPrintBunCode: TStringField;
    MDPrintTDebitCashCd: TIntegerField;
    MDPrintTDebitCashNm: TStringField;
    MDPrintTCreditCashCd: TIntegerField;
    MDPrintTCreditCashNm: TStringField;
    MDPrintSDebitCashCd: TIntegerField;
    MDPrintSDebitCashNm: TStringField;
    MDPrintSCreditCashCd: TIntegerField;
    MDPrintSCreditCashNm: TStringField;
    MDPrintSTaxCode: TIntegerField;
    MDPrintSTaxName: TStringField;
    MDPrintBTaxCode: TIntegerField;
    MDPrintBTaxName: TStringField;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;
    LblRiskKbn: TMLabel;
    LblKawase: TMLabel;
    f1RISKKBN: TMNumEdit;
    f1RISKKBNNM: TMPanel;
    MDPrintRiskKbn: TSmallintField;
    MDPrintRiskKbnNm: TStringField;
    
//<128>add st
    GroupLabel: TMLabel;
    f1KName: TMTxtEdit;
    f1GurpCode: TMNumEdit;
    MDPrintKName: TStringField;
    MDPrintGrpCode: TIntegerField;
//<128>add end

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormDestroy(Sender: TObject);

    procedure fnWCtlEnter(Sender: TObject);
	procedure fnWCtlExit(Sender:TObject);

	procedure BUpdate(Sender: TObject);
	procedure BCancel(Sender: TObject);
	procedure BPrintClick(Sender: TObject);
    procedure fnPostArrowClick(Sender: TObject);
    procedure fnAdsArrowClick(Sender: TObject);
    procedure fnCompCDChange(Sender: TObject);
    procedure SKCDChange(Sender: TObject);
    procedure ArrowClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);                // <107>
    procedure evtOnChange(Sender: TObject);                 // <111>
    procedure f1GurpCodeArrowClick(Sender: TObject);        //<128>add        

  private
	{ Private 宣言 }
	m_pMyAppRecord	:   ^TMjsAppRecord;
	m_Base_pRec		:   ^TMjsAppRecord;                     // <103>
	MDataModule		:   TMDataModulef;
    ComArea			:   TJNTMASCom;
    dbCorp_Select	:   TFDConnection;
    m_dbMjsCmn		:   TFDConnection;
    m_dbMasCmn		:   TFDConnection;
    m_AcControl		:   TWinControl;
    m_cJNTArea      :   TJNTCommon;

    m_MjsMsgRec		:   TMjsMsgRec;
	m_Month			:   TJNTMASMonth;

    m_CmpList	    :   TList;
    B_Print 	    :   TMSpeedButton;                      // 印刷ﾎﾞﾀﾝ
    B_Change        :   TMSpeedButton;                      // 切出/埋込ﾎﾞﾀﾝ<107>
    m_bBtnChange	:   Boolean;                            // 切出≪=≫埋込ﾌﾗｸﾞ<107>

	m_bFirstFlag	:   array [0..1] of Boolean;

	rcMsg2			:   MjsMsgStdU.TMjsMsgRec;
	m_MsgStd		:   TMjsMsgStd;

    m_iSysColor		:   Integer;
	m_iSysCode		:   Integer;
    m_iOptCode		:   Integer;
	m_iCorpCode		:   Integer;
	m_iCorpSubCode	:   Integer;
	m_iSysCodeNo 	:   Integer;
    m_nTaxInfoAccDivision   : Integer;
    MComboBox       :   TMComboBox;

    nCompDivision	:   Integer;	    				    // 公益法人区分
    CloseFlg	    :   Boolean;
    m_EdtSw         :   Boolean;                            // <111>編集ｽｲｯﾁ

    uvPostExpOpenSW :   Boolean;                            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
    uvAttr,uvDigit  :   Integer;                            // 桁数属性
    uvExpOpenSW     :   Boolean;                            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
	uvSelSys        :   TJNTSelCorpSys;			            // 会社ｼｽﾃﾑ情報
    uvDispFlg       :   Integer;                            // 決算フラグ（ 0:未確定、1:確定済）
    uvTmpBRCD       :   Integer;                            // ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀ
    uvTmpURTaxCD,uvTmpURTax,uvTmpSITaxCD,uvTmpSITax :  Integer;         //ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀ
    uvTmpT_KRSKCD,uvTmpT_KSSKCD,uvTmpS_KRSKCD,uvTmpS_KSSKCD:  Integer;  //ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀ

    uvHani          :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   :	TPrintAppEntry;                     // <PRN>
    ArrHdl          :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		:	rcPrtParam;                         // <PRN>
    DmqPrint        :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ
	m_iRekiKbn		:   Integer;						    // 051115

    m_SyncMaster    :   TSyncMaster;                        // <Rel> ﾏｽﾀ同期基本ｸﾗｽ

    m_RepHandle		:   THandle;                            // 印刷モジュールハンドル <121>

    m_JNTAuthority  : TJNTAuthority;  //<Authority> ADD

    m_TaxRateInfo	: 	TMASTaxRateInfo;					// <123>税率情報クラス

    m_strSDT          :   array of StructSDTSave;             //SDT情報保存<128>add
    m_GCBaseFlag		:	Boolean;							//グループ会社の採用フラグ<128>add

    procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
	function  fnGetList(cmpEdit: TObject): Boolean;
	procedure fnSetProperty(iKbn:integer;eEdit:TMTxtEdit ;lLabel:TMLabel);overload;
	procedure fnSetProperty(iKbn:integer;eEdit:TMNumEdit ;lLabel:TMLabel);overload;
	function  fnSousa_Select:Boolean;
	function  fnSousa_Update:Boolean;
    procedure fnKbnStrSet;
    function  fnMkbnGet_ExLb(Sender, SenderNM: TObject; TblType, KbnType: String; bDsp: Boolean): Boolean;
    function  fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
    function  fnKBNNameGet(TBL, TYP: string; Code: integer; var rNm: string): Boolean;
    Procedure fnCompEnabled(pBol:Boolean);
    Procedure fnCompClear;
    procedure fnCallPostExplorer(pvKeyWord: String; pvPostEdit1, pvPostEdit2: TMNumEdit; pvAdsEdit1, pvAdsEdit2: TMTxtEdit);
    function  NspSepStr(const sSrc: String; iLen: integer; var sDst1, sDst2: string): boolean;
    function  fnFldChk_TbMkbn1(Sender, SenderNM: TObject; PiSBoxNo: Integer; TblNm: String; ChkBol, DspBol: Boolean): Boolean;
    function  fnGetTaxName(nDivision, nTaxCode: Integer): String;
    function  fnGetDspData(sCode: String): String;
    function  fnGetGCODE(pCODE: Extended): Integer;
    function  fnGetNCODE(pCODE: Integer): Extended;
//    function fnChkTRCODE: Boolean;                                            // <Rel>
    function  fnChkTRCODE: Integer;                                             // <Rel>
    function  fnCancel: Boolean;
    function  fnGetNameSimple(nExCode: Integer): String;
	procedure fnPrnSET();		                                                // 051115
	procedure SessionPractice(iSyori: Integer);	// <117> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
    procedure fnRiskSet;
    function  GetTextOfTaxCDsAndTaxCDNames(aTaxKbn: Integer): String;	//<123> ADD
    
//<128>add st
    Procedure SDT_Save();//SDT_DB情報取得
    function  GrpNameGet(iGrpCode: Integer; var sKName : string):Boolean; //グループ会社名取得
    function  GrpCodeFlag(iGrpCode: Integer):Boolean; //グループ会社登録有無
	function  GCBaseFlagGet:Boolean; //グループ会社採用有無
//<128>add end

  protected
	procedure CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;

  public
	{ Public 宣言 }
	constructor CreateForm(pRec:pointer);					                    // ｺﾝｽﾄﾗｸﾀ

end;

function AppEntry(pParam : Pointer)	:	Integer;

exports
	AppEntry;

//<123> ADD st
const
	// 売上／仕入区分定義
    TAXKBN_NASI		= 0;
	TAXKBN_URI		= 1;
    TAXKBN_SII		= 2;
//<123> ADD ed

implementation


{$R *.DFM}
var
	Qry : TMQuery;
    uvClearFlg : Boolean;
    uvNCODE     : Extended;
    uvInsFlg : Boolean;

	_TaxItems: array [0..18] of String		= (
											   ' 0: 科目に従う',
											   '10: 課税売上(内税)',
											   '12: 課税売上控除(内税)',
											   '13: 課税貸倒償却(内税)',
											   '15: 課税貸倒回収(内税)',
											   '20: 課税売上(外税)',
											   '22: 課税売上控除(外税)',
											   '23: 課税貸倒償却(外税)',
											   '25: 課税貸倒回収(外税)',
											   '30: 非課税売上',
//											   '34: 有価証券売上高(非課税)',    // <125>MOD
											   '34: 有価証券売上等(非課税)',    // <125>MOD
											   '40: 不課税売上(精算取引)',
											   '60: 輸出売上',
											   '64: 非課税輸出売上',
											   '80: 課税仕入対応特定収入',
											   '81: 共通仕入対応特定収入',
											   '84: 非課税仕入対応特定収入',
											   '89: 使途不特定の特定収入',
											   '99: 不明'
											  );

{$include JNTCRPSyncMasterB.inc}                            // <Rel> ﾏｽﾀ同期共通実装部
{$include JNTMTOKUI_Sync.INC}                               // <Rel>
{$include MASTaxRateInfoB.inc}                              // <123> 税率情報クラス


//******************************************************************************
//		Proccess	: AppEntry
//		Name		: Y.Sato
//		Date		: 2000/07/24
//		Parameter	: pPar
//		Return		: Integer
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function AppEntry(pParam: Pointer):	Integer;
var
	pMyForm	:	^TJNTCRP004002f;
	pRec	:	^TMjsAppRecord;
begin
	result	:=	ACTID_RET_OK;
	pRec	:=	Pointer(TAppParam(pParam^).pRecord);

	case TAppParam(pParam^).iAction of
        // ----------------------
        //	Form Create要求
        // ----------------------
		ACTID_FORMCREATESTART		:
		begin
			new(pMyForm);
			try
				pMyForm^ := TJNTCRP004002f.CreateForm(pParam);
				pRec^.m_pChildForm	:=	pMyForm;
			except
				Dispose(pMyForm);
				Result	:=	ACTID_RET_NG;
			end;
		end;
        // ----------------------
        //	Form Create&Show要求
        // ----------------------
		ACTID_FORMCREATESHOWSTART	:
		begin
			new(pMyForm);
			try
				pMyForm^	:=	TJNTCRP004002f.CreateForm(pRec);
				pMyForm^.Show();
				pRec^.m_pChildForm	:=	pMyForm;
			except
				Dispose(pMyForm);
				Result	:=	ACTID_RET_NG;
			end;
		end;
        // ----------------------
        //	Form Close要求
        // ----------------------
		ACTID_FORMCLOSESTART		:
		begin
			pMyForm	:=	Pointer(pRec^.m_pChildForm);
			pMyForm^.Close();
			pMyForm^.Free();
			Dispose(pMyForm);
		end;
        // ----------------------
        //	Form CanClose要求
        // ----------------------
		ACTID_FORMCANCLOSESTART		:
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			if pMyForm^.CloseQuery = False then
				Result	:=	ACTID_RET_NG;
		end;
        // ----------------------
        //	Show要求
        // ----------------------
		ACTID_SHOWSTART				:
		begin
			pMyForm	:=	Pointer(pRec^.m_pChildForm);
			pMyForm^.Show();
		end;
        // ----------------------
        // Hide要求
        // ----------------------
		ACTID_HIDESTART :
		begin
			pMyForm := Pointer( pRec^.m_pChildForm );
			if pMyForm^.Parent <> nil then
				pMyForm^.Hide();
		end;

	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:Y.Sato
//**********************************************************************
constructor TJNTCRP004002F.CreateForm(pRec: pointer);
begin

    m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);	// MJS共通DBﾓｼﾞｭｰﾙ
    ComArea		    :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得

    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

    m_iSysColor	    :=  ComArea.SystemArea.SysColorB;		            // ｼｽﾃﾑｶﾗｰ(淡) 取得
	m_iSysCode	    :=  m_pMyAppRecord^.m_iSystemCode;		            // ｼｽﾃﾑｺｰﾄﾞ 取得

    m_iCorpCode	    :=  m_pMyAppRecord^.m_iCorpCode;			        // 会社ｺｰﾄﾞ 取得
    m_iCorpSubCode	:=  m_pMyAppRecord^.m_iCorpSubCode;	                // ｼｽﾃﾑDBｺｰﾄﾞ 取得 (決算開始年月日)
	m_iSysCodeNo    :=  (m_iSysCode * 100) + m_iOptCode;	            // ｼｽﾃﾑｺｰﾄﾞ+ｵﾌﾟｼｮﾝｺｰﾄﾞ 取得

	if fnCMNPostInit(m_pMyAppRecord) <> 0 then			                // 郵便番号辞書 初期化
	begin
		raise EMathError.Create('郵便番号辞書の初期化に失敗しました｡');
		Exit;
	end;

// <Gali2258> ADD St
// FormCreateから移動
    m_cJNTArea           := TJNTCommon   ( m_CmpList.Items[8]^ );
    m_Base_pRec          := Pointer      ( m_CmpList.Items[9]^ );
// <Gali2258> ADD Ed

	m_cJNTArea.setSelAppRecord; //<Gali2258> ADD

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

//<Gali2258> DEL    	if uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 then
    	if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then //<Gali2258> ADD
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    m_cJNTArea.setMasAppRecord; //<Gali2258> ADD

//(*//<128>mod st
    // 共通DB Open
    //m_dbMasCmn := MDataModule.CTLDBOpen;//<128>del									// 共通DBOpne
	m_dbMjsCmn := MDataModule.CTLDBOpen;//<128>add										// 共通DBOpne
	if m_dbMjsCmn = nil then
	begin
		raise EMathError.Create('共通DBのオープンに失敗しました｡');
		Exit;																	// 例外生成
	end;

    // MASCOMMON.DBのOPEN
    m_dbMasCmn := MDataModule.COPDBOpen(1,ComArea.m_iMasCommonNo);		        // Tran使用
    if m_dbMasCmn = nil then
    begin
        ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx (Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		raise EMathError.Create('MASCOMMON.DBのOPENに失敗しました。');
		MDataModule.CTLDBClose(m_dbMjsCmn);
		Exit;
    end;
//*)//<128>mod end

    // 会社DB Open
	dbCorp_Select := MDataModule.COPDBOpen( 1, ComArea.m_iCopNo );				// 会社DBOpne
	if dbCorp_Select = nil then
	begin
		ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,MDataModule.GetStatus);
		MJSMessageBoxEx (Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle, m_MjsMsgRec.icontype,
  						 m_MjsMsgRec.btntype, m_MjsMsgRec.btndef, m_MjsMsgRec.LogType);
		raise Exception.Create('');
		MDataModule.CTLDBClose(m_dbMjsCmn);
		Exit;																// 例外生成
	end;

	// 051115 >>
    // 会社別ｼｽﾃﾑ情報読み込み<PRN>
    try
    	if (uvSelSys.CreateSysInfo(dbCorp_Select) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;
	// 051115 <<

    // FormCreate
    inherited Create(TForm(m_pMyAppRecord^.m_pOwnerForm^));
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Name		:洪英傑(上海未来)
//		Date		:??/??/??
//		Parameter	:
//		Return		:
//		History		:04/07/20(T.Aoki)
//					:<040720>
//					:文字pt=10に変更したら切れるので9ptに戻す
//					:所定労働日数ｸﾞﾞﾘｯﾄﾞは10ptで高さ取っているので10ptのまま
//**********************************************************************
procedure TJNTCRP004002F.FormCreate(Sender: TObject);
var
	DMQuery		:   TMQuery;
    nCount      :   Integer;
    i,
    iRet        :   Integer;                                                    // <PRN>
    lvHandle    :   THandle;                                                    // <PRN>
begin
	CloseFlg         :=  False;
    m_bFirstFlag[0]	 :=  False;
	m_bFirstFlag[1]	 :=  False;
    m_bBtnChange 	 :=  TRUE;                                                  // <107>

    m_RepHandle	:= 0;                                                           // 印刷モジュールハンドル <121>

    // <PRN>ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    B_Print 	     := TMSpeedButton( m_CmpList.Items[0]^ );                   // 印刷
//<Gali2258> DEL St  CreateFormへ移動
{
    m_cJNTArea       := TJNTCommon   ( m_CmpList.Items[8]^ );                   // <102>
    m_Base_pRec      := Pointer      ( m_CmpList.Items[9]^ );                   // <103>
}
//<Gali2258> DEL Ed
    MComboBox        := TMComboBox   ( m_CmpList.Items[10]^ );
    B_Change         := TMSpeedButton( m_CmpList.Items[11]^ );                  // <107>

    B_Print.OnClick  := BPrintClick;
    B_Change.OnClick := BChangeClick;                                           // <107>
//051115    B_Print     .Enabled    :=  False;                                  // <105>
	m_SyncMaster     := TSyncMaster  ( m_CmpList.Items[13]^ );                  // <Rel>

    m_JNTAuthority := TJNTAuthority(m_CmpList.Items[16]^);  //<Authority> ADD


    //--------------------------------------------------------------------------

	// -----<117> Add-St-----
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<117> Add-Ed-----

	Parent      :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^);                     // 親のﾊﾟﾈﾙに埋込む
	Align       :=  alClient;

// <PRN>    m_cPreview	:= TMJSPreviewIF.Create ();
// <PRN>	m_cPreview.Init (m_pMyAppRecord);

    MjsColorChange(				                                                // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP004002F(Self),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor
				  );

    MjsFontResize( TJNTCRP004002F(Self), Pointer(m_pMyAppRecord) );

	// 郵便番号辞書 初期化
// <113>ｺﾝｽﾄﾗｸﾀで呼んでいるのでｺﾒﾝﾄｱｳﾄ
{    uvPostExpOpenSW := FALSE;
	if fnCMNPostInit(m_pMyAppRecord) = 0 then
        uvPostExpOpenSW := TRUE
    else
		MjsMessageBox(self,'郵便番号辞書の初期化に失敗しました。'#13#10#13#10
					+ '郵便番号辞書は使用できません。', mjError, mjDefOk);
}
    // Enabledの制御
    uvClearFlg := False;
    fnCompClear;
    fnCompEnabled(False);

    uvClearFlg := True;

//<128>add st

    m_GCBaseFlag := False;


    if TMSeries2.IsGalileopt3 then
    begin
        m_GCBaseFlag:= GCBaseFlagGet;
    end;

    if(m_GCBaseFlag = true)then
    begin
    	SDT_Save;
    end
    else
    begin
        GroupLabel.Visible  := False;
        f1GurpCode.Visible    := False;
        f1KName.Visible       := False;
    end;
//<128>add end

	m_nTaxInfoAccDivision	:= 0;								                // 消費税基本情報: 会計処理区分 (0:免税業者)

	DMQuery := TMQuery.Create(self);							                // MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);		                // DBとの接続
    Try
        with DMQuery do
        begin
            Close ();

            SQL.Clear;
            SQL.ADD ('SELECT AccProKbn FROM TaxInfo');

            Open ();

            if	(not EOF) then
                m_nTaxInfoAccDivision	:= GetFld ('AccProKbn').AsInteger;		// 会計処理区分 (0:免税, 1:税込, 2:税抜)
            Close ();
            nCompDivision			:= 0;					                    // 公益法人区分
            LabTRNM.Caption := '';
            BRCDLab.Caption := '';

            Close;
            Sql.Clear;
            Sql.add(' Select CodeDigit,CodeAttr,JHojyoName From MasterInfo '+
                    ' Where (MasterKBN = 22)');
            Open;
            if not Eof then
            begin
                uvDigit := GetFld('CodeDigit') .AsInteger;                      // 桁数
                uvAttr  := GetFld('CodeAttr').asInteger;                        // 属性
                LabTRNM.Caption := GetFld('JHojyoName').asString + 'コード';
                BRCDLab.Caption := GetFld('JHojyoName').asString + '分類';
            end;

            Close ();
            SQL.Clear;
            SQL.Add ('SELECT ComKbn4 FROM DTMAIN_MAS ');	                    //HIS0036
            Open ();
            if not Eof then
                nCompDivision			:= FieldByName ('ComKbn4').AsInteger;	// 公益法人区分

            Close ();
            SQL.Clear;
            SQL.Add ('SELECT ComKbn2, YearKbn FROM DTMAIN');	// 051115
            Open ();
            if not Eof then
	        begin
                uvDispFlg := FieldByName ('ComKbn2').AsInteger;	                // 決算確定
				m_iRekiKbn:= GetFld('YearKbn').AsInteger;		// 051115
    	    end;

            Close ();
{            //ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀを求める
            SQL.Clear;
            SQL.Add ('SELECT *  FROM MTOKUI_MAS Where TemplateKbn = 1');
            Open ();
            if not Eof then
            begin
                uvTmpBRCD         := GetFld('BunCode')    .AsInteger;
                uvTmpURTaxCD      := GetFld('STaxCode')    .AsInteger;
                uvTmpURTax        := GetFld('STaxRate')    .AsInteger;
                uvTmpSITaxCD      := GetFld('BTaxCode')    .AsInteger;
                uvTmpSITax        := GetFld('BTaxRate')    .AsInteger;
                uvTmpT_KRSKCD     := fnGetGCODE(GetFld('TDebitCash').AsInteger);
                uvTmpT_KSSKCD     := fnGetGCODE(GetFld('TCreditCash').AsInteger);
                uvTmpS_KRSKCD     := fnGetGCODE(GetFld('SDebitCash').AsInteger);
                uvTmpS_KSSKCD     := fnGetGCODE(GetFld('SCreditCash').AsInteger);
            end;
            Close ();
}
        end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

    //権限情報を取得<101>
//    m_cJNTArea.FxPermission;<102>
//<Authority> DEL    if (m_cJNTArea.IsModify = False) then
    if (m_JNTAuthority.IsModify = False) then  //<Authority> ADD
    begin
//<Authority> DEL        if (m_cJNTArea.IsAppend = False ) then
        if (m_JNTAuthority.IsAppend = False ) then  //<Authority> ADD
        begin
            uvDispFlg := 1;//決算確定と同様の処理
        end;
    end;

//↓<Rel>
	// この時点で、参照ﾓｰﾄﾞ以外のときのみ、以下の論理を行う。
	if (uvDispFlg <> 1) then
	begin
        // 全社の過年度DBを選択している場合
        if ( m_SyncMaster.m_flgGrpCorp = 0 ) then
        begin
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin
                if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
                                        'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
                begin
                    // 通常のﾏｽﾀ登録として起動する。
                    // 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
                    // 通常ﾓｰﾄﾞ
                end
                else
                begin
                    // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                    // ﾏｽﾀをUpdata、Insertすることはできない。
                    m_cJNTArea.Invalidity;

                    // 参照ﾓｰﾄﾞ
                    uvDispFlg := 1;
                end;
            end;
        end
        // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
        else if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 子会社が過年度DBの場合
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;

                // 参照ﾓｰﾄﾞ
                uvDispFlg := 1;
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;

                // 参照ﾓｰﾄﾞ
                uvDispFlg := 1;
            end;
        end;
	end;
//↑<Rel>

//<123> ADD st
	if (m_nTaxInfoAccDivision <> 0) then
    begin
		m_TaxRateInfo := TMASTaxRateInfo.Create(m_pMyAppRecord, dbCorp_Select);
        m_TaxRateInfo.SortType 	 := 0;			                                // ソート順=降順    //<#TAX10> ADD
		m_TaxRateInfo.IntInpKbn	 := 0;
        m_TaxRateInfo.FAddReducedExpress := REDUCEDEXPRESS_REAR;
        m_TaxRateInfo.Initialize();
        f1URTax.SelectItems.Text := m_TaxRateInfo.GetTextOfRateCDsAndTaxNames();
        f1SITax.SelectItems.Text := m_TaxRateInfo.GetTextOfRateCDsAndTaxNames();
    end
    else
        m_TaxRateInfo := Nil;
//<123> ADD ed

    f1URTaxCD.SelectItems.Clear;
	for nCount := 0 to 18 do
	begin
		if	((nCompDivision <> 1) and											// 公益法人区分: 1=公益法人
			((nCount >= 14) and (nCount <= 17))) then							// 消費税ｺｰﾄﾞ80番台は除く
			Continue;

		f1URTaxCD.SelectItems.Add (_TaxItems [nCount]);
	end;

    f1SITaxCD.SelectItems.Text := GetTextOfTaxCDsAndTaxCDNames(TAXKBN_SII);	//<123> ADD

    // 文字列ｵﾌﾞｼﾞｪｸﾄを作成する
    fnKbnStrSet;

    m_AcControl :=  f0CODE;

// ↓↓↓<PRN>
    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 }
	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004002L.BPL');           // <119>DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004002L.BPL');     // <119>ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
	 // MjsMessageBox(Self, 'JNTCRP004002LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        // <119>DEL
        MjsMessageBox(Self, 'JNTCRP004002LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  // <119>ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     // UnloadPackage( lvHandle );          // <119>DEL
        UnloadPackageHelper( lvHandle );    // <119>ADD
    end;

    m_RepHandle	:= lvHandle;                // 印刷モジュールハンドル <121>

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
            Para		    :=  uvHani;
			TargetQry	    :=  nil;
            TargetMD        :=  nil;
			CorpSys		    :=  uvSelSys;
            // *** 汎用変数 *** //
            TargetParam	    :=  nil;
	    	TargetStr	    :=  '';
    		TargetInt	    :=  0;
            // *** 汎用変数 *** //
            iAPP_HDL_REC    :=  100;
		end;
        ArrHdl[0] := @m_JntAuthority;  //<Authority> ADD
		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(Self,
                m_Base_pRec,
                MDataModule,
                ComArea,
                dbCorp_Select,
                'JNTCRP004002',
                uvHani,
                uvSelSys);

// ↑↑↑<PRN>

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pMyAppRecord) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);


    m_EdtSw := False;                       // <111>編集状態ｽｲｯﾁを初期化する

    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);		//イベントOnCreateの最後に

    fnRiskSet;
end;

//************************************************************************
//*		Proccess		:	WMOnPaint関数
//*		Name			:	S.Ogawa
//************************************************************************
procedure TJNTCRP004002F.WMOnPaint(var Msg: TMessage);
begin

	// 初期のみ一回の処理
	if m_bFirstFlag[0] = False then
	begin
        m_bFirstFlag[0] := True;

        // 得意先ｺｰﾄﾞの属性対応
        case uvAttr of
            0:  f0CODE.InputAttr    :=  iaZeroSup;
            1:  f0CODE.InputAttr    :=  iaZeroPad;
// <106>            2:  f0CODE.InputAttr    :=  iaFree;
            2:  f0CODE.InputAttr    :=  iaNone;
        end;

        f0CODE.MaxLength    :=  uvDigit;

        // 得意先ｺｰﾄﾞにﾌｫｰｶｽを設定する
        m_AcControl.SetFocus;
    end;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.FormShow(Sender: TObject);
begin

    JNTMasSetCaption( m_pMyAppRecord );
	MjsBtnVisible( TJNTCRP004002F(Self), TRUE );

// ↓↓↓<PRN>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Show
    else
    begin
        PSousa.Visible  :=  True;
	    FormActivate( Sender );
        m_AcControl.SetFocus(); // <107>
    end;
// ↑↑↑<PRN>

end;

//**********************************************************************
//		Component	:Form
//		Event		:Hide
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.FormHide(Sender: TObject);
begin

    MJSBtnVisible( TJNTCRP004002F(Self), False );

    // <PRN>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Hide;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Close
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
begin

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if ( uvExpOpenSW = TRUE ) then
        fnJNTExpFree;

    // 販売ｼｽﾃﾑ情報の解放
    uvSelSys.Free;                          // <112>

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	// 税率情報クラス破棄<123> ADD
    if Assigned(m_TaxRateInfo) then
    begin
		m_TaxRateInfo.Free();
        m_TaxRateInfo := Nil;
    end;

    // 会社DBｸﾛｰｽﾞ処理
    if ( dbCorp_Select <> nil ) then
        MDataModule.COPDBClose(dbCorp_Select);
        
//<128>add st
    if ( m_dbMasCmn <> nil ) then
        MDataModule.COPDBClose(m_dbMasCmn);

    if ( m_dbMjsCmn <> nil ) then
        MDataModule.CTLDBClose(m_dbMjsCmn);
//<128>add end

    // 郵便番号辞書 終了
	fnCMNPostFree;

    Action                      :=  caFree;
	m_pMyAppRecord^.m_iDelete   :=  1;
	wkParam.iAction	            :=	ACTID_FORMCLOSEEND;
	wkParam.pRecord	            :=	Pointer(m_pMyAppRecord);
	wkParam.pActionParam	    :=	nil;
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);

end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.FormDestroy(Sender: TObject);
begin

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  uvSelSys;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

// <PRN>    m_cPreview.Term ();
// <PRN>	m_cPreview.Free ();

// <121>↓↓
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
// <121>↑↑

end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
var
	iRtn : Word;
    iRet : Integer;                         // <111>
begin

    // 終了ﾌﾗｸﾞをONに設定する
    if ( CloseFlg = False ) then CloseFlg := True;

    // 販売ｼｽﾃﾑ情報の開放
//	uvSelSys.Free;                          // <112>FormCloseに移動

// <PRN>    if m_cPreview.IsPreView then
    if ( uvHani.mjspre.IsPreView = TRUE ) then  // <PRN>
   	begin
		ComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self,m_MjsMsgRec.sMsg, m_MjsMsgRec.sTitle,m_MjsMsgRec.icontype , m_MjsMsgRec.btntype , m_MjsMsgRec.btndef,m_MjsMsgRec.LogType );
	   	CanClose := FALSE;
        Exit;	// 051115
	end
    else
    	CanClose := TRUE;


(*
	if not CloseFlg then
	begin
		m_MsgStd.GetMsg(rcMsg2,10020,2);
		with rcMsg2 do
		begin
			iRtn := MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
		end;

		case iRtn of
			mrYes:
			begin
				if fnValueChk then
				begin
					BUpdate(Sender);
					CanClose := True;
					CloseFlg := True;
				end
				else
					CanClose := False;
			end;
			mrNo:
			begin
				CanClose := True;
				CloseFlg := True;
			end;
			mrCancel:
			begin
				CanClose := False;
			end;
		end;
	end;
*)
// <111> St --------------------------------------------------------------------
    	if (m_EdtSw) then                   // 変更あり
	    begin
            // 変更を保存します。よろしいですか？
            ComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10020,2);
            with m_MjsMsgRec do
            begin
                iRet := MjsMessageBoxEx(Self, sMsg, sTitle, icontype,
                                    btntype, btndef, LogType );
            end;

            if iRet = mrYes then            // 「はい」
            begin
                                            // 入力ﾁｪｯｸ
                if fnFldChk(Self, True) = False then
                begin
                    CanClose := False;
                end
                else
                begin
                	fnSousa_Update;         // 更新処理
                    m_EdtSw := False;
                end;
            end
            else if iRet = mrCancel then    // 「ｷｬﾝｾﾙ」
            begin
                CanClose := False;
            end
            else                            // 「いいえ」
            begin
                m_EdtSw := False;
            end;
        end;

// <111> Ed --------------------------------------------------------------------


//051115    B_Print     .Enabled    :=  True; // <105>
end;

//**********************************************************************
//		Component	:Form
//		Event		:Activate
//		Name		:KOS.HORI
//		Histry		:
//**********************************************************************
procedure TJNTCRP004002F.FormActivate(Sender: TObject);
var
	wkParam :	TAppParam;
begin

	wkParam.iAction         :=  ACTID_ACTIVEEND;
	wkParam.pRecord         :=  Pointer(m_pMyAppRecord);
	wkParam.pActionParam    :=  nil;
	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);

end;

//**********************************************************************
//		Component	:Form
//		Event		:CMChildKey
//		Name		:洪英傑(上海未来)
//		修正履歴	:2001/01/30 hori 修正
//					:2004/08/18(T.Aoki)
//					:総括表判定区分の制御 追加<040818A>
//**********************************************************************
procedure TJNTCRP004002F.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	SName	:	string;
    sKName  :  string;//<128>add
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	SName		:= Screen.ActiveControl.Name;
//<Shift> DEL	sShift		:= KeyDataToShiftState(Msg.KeyData);
	sShift		:= MJSKeyDataToShiftState(Msg.KeyData);  //<Shift> ADD
	m_ACControl	:= Screen.ActiveControl;

    // ENTER / TABｷｰの補足
    if  ( Msg.CharCode = VK_RETURN ) or
       (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) then
    begin

        // ENTERｷｰの場合だけ何も行わない<110>
        if ( Msg.CharCode = VK_RETURN ) then
        begin
            if ( m_ACControl is TMBitBtn )  then Exit;
        end;

        // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸを行う
        if ( fnFldChk(TComponent(Screen.ActiveControl), True) = False ) then
            Abort;

        // 先頭ｺﾝﾎﾟｰﾈﾝﾄの場合
    	if ( m_ACControl = f0CODE ) then
        begin
            // ﾃﾞｰﾀの読込
            fnSousa_Select;

            // ↓↓↓<110>
//<120>     MjsNextCtrl(Self);
            Abort;
            // ↑↑↑<110>

//<120>     Exit;
        end;

//<128>add st
        if(m_ACControl = f1BRCD) then
        begin
            if f1BRCD.AsInteger = 0 then
            begin
                f1GurpCode.Enabled := false;
                f1GurpCode.Value := 0;
                f1KName.text := '';
            end
            else
                f1GurpCode.Enabled := True;

            MjsNextCtrl(Self);
            Abort;
        end;

        if(m_ACControl = f1GurpCode) then       //グループコードフォーカス抜けキー操作　チェック
        begin
            if (f1GurpCode.ASInteger <> 0) then
            begin
				if(GrpCodeFlag(f1GurpCode.ASInteger))then
    	    	begin
		    	    if(GrpNameGet(f1GurpCode.ASInteger,sKName))then
    			    begin
	    			    f1KName.text := sKName;
                        MjsNextCtrl(Self);
						Abort;
   			    	end
    			    else
                   	begin
                        f1KName.text := '';
		        		MjsMessageBoxEx(Self,'グループ会社コードに該当する会社データが存在しません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
						f1GurpCode.SetFocus;
						Abort;
			        end;
       			end
        		else
               	begin
                    f1KName.text := '';
	  	    	    MjsMessageBoxEx(Self,'グループ会社登録－グループ会社設定に登録されていない会社のため登録できません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
					f1GurpCode.SetFocus;
					Abort;
       			end;
            end
            else
                f1KName.text := '';
                MjsNextCtrl(Self);
   		    Abort;
//<128>add end
        end;
    end;


	{文字入力コンポーネント}
	if m_ACControl is TMTxtEdit then
	begin
		case Msg.CharCode of
			VK_TAB:					//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RETURN, VK_DOWN:		//Return、↓
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_RIGHT:				//→
			begin
				if MjsChkCurEnd(m_ACControl) then
				begin
					if sShift = [] then
					begin
						MjsNextCtrl(Self);
						Abort;
					end;
				end;
			end;
			VK_LEFT:				//←
			begin
				if MjsChkCurTop(m_ACControl) and (sShift = []) then
				begin
					if sShift = [] then
					begin
						MjsPrevCtrl(Self);
						Abort;
					end;
				end;
			end;
			VK_UP:					//↑
			begin
				if sShift = [] then
				begin
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;
			VK_END:					//END
			begin
				if MjsChkCurEnd(m_ACControl) = False then
					exit;
			end;
		end;
	end;

	{チェックボックス・数値入力・日付入力コンポーネント}
	if (m_ACControl is TMCheckBox) or (m_ACControl is TMNumEdit) or
		(m_ACControl is TMDateEdit) then
	begin
		case Msg.CharCode of
			VK_TAB:							//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RETURN, VK_RIGHT, VK_DOWN:	//Enter、→、↓
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_LEFT, VK_UP:					//←、↑
			begin
				if sShift = [] then
				begin
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;
		end;
	end;

	{更新・削除ボタン}
	if (m_ACControl is TMBitBtn) then
	begin
		case Msg.CharCode of
			VK_TAB:							//タブ
			begin
				if (sShift = []) then
					MjsNextCtrl(Self);
				if (sShift = [ssShift]) then
					MjsPrevCtrl(Self);
				Abort;
			end;
			VK_RIGHT, VK_DOWN:
			begin
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;
			end;
			VK_LEFT, VK_UP:
			if sShift = [] then
			begin
				MjsPrevCtrl(Self);
				Abort;
			end;
			//更新・キャンセルボタン上でのESCは何もなし 2001/02/27
			VK_ESCAPE:
				Exit;
			//VK_ESCAPE,VK_END:													//2001/01/30 ADD KOS
			VK_END:
			begin
//<109>				self.bCancel(m_ACControl);										//キャンセルボタンクリックイベント
//<109>				abort;
                Exit;   //<109>
			end;
		end;
	end;

 	case Msg.CharCode of
		VK_ESCAPE,VK_END:
		begin
			//先頭項目ならば終了
			if (SName = 'f0CODE') then
			begin
    			MComboBox.SetFocus ();
				exit;
			end;

            MjsSetFocus(Self,'BUpdate_Sousa');
            Abort;
		end;
	end;

end;

//**********************************************************************
//		Component	:BUpdate_XXX  更新処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.BUpdate(Sender: TObject);
begin


    //フィールド入力値のチェックをする
    if fnFldChk(Self, True) = False then
        Exit;
//<115>
   	f1POSTNO2.Zero := False;
//<115>
	fnSousa_Update;

    fnCompClear;
    fnCompEnabled(False);

    m_EdtSw := False;   //<114>

    f0CODE.SetFocus;


    FormActivate(nil);

end;

//**********************************************************************
//		Component	:BCancel_XXX    取消処理
//		Event		:Click
//		Name		:洪英傑(上海未来)
//**********************************************************************
procedure TJNTCRP004002F.BCancel(Sender: TObject);
var
	iRtn : Word;
begin
	//「編集中のデータを破棄してよろしいですか？」
//<LEAD>	GetMsg(rcMsg,110,1);
//<LEAD>	with rcMsg do
//<LEAD>	begin
//<LEAD>		iRtn := MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
//<LEAD>	end;
    // 入力破棄・再読込
{
	if iRtn = mrYes then
	begin
		fnSousa_Select;
	end
    // 更新
	else if iRtn=mrNo then
	begin
    //フィールド入力値のチェックをする
        if fnFldChk(Self, True) = False then     //<30>
            Exit;

		fnSousa_Update;
	end
    // キャンセル
	else
}
		fnCancel;

    m_EdtSw := False;                       // <111>変更ｽｲｯﾁOFF

end;

//**********************************************************************
//		Proccess	:ｺﾝﾎﾟｰﾈﾝﾄﾌｫｰｶｽ取得
//		Name		:丘 嶸(上海未来)
//		Date		:2001/01/06
//		Parameter	:なし
//		Return		:なし
//		History		:2001/04/13 KOS.HORI
//					:ステータスメッセージを非表示
//**********************************************************************
procedure TJNTCRP004002F.fnWCtlEnter(Sender: TObject);
begin

	m_ACControl:=Sender as TWinControl;

end;

//**********************************************************************
//		Proccess	:ｺﾝﾎﾟｰﾈﾝﾄﾌｫｰｶｽ消失
//		Name		:丘 嶸(上海未来)
//		Date		:2001/01/06
//		Parameter	:なし
//		Return		:なし
//		History		:2001/02/02 KOS ADD 郵便番号編集
//					:2001/04/20 KOS ADD デフォルトセット条件追加
//					:2004/06/21(T.Aoki)
//					:月指定時の補完月 追加<040621>
//					:2004/07/15(T.Aoki)
//					:労災保険料の制御 修正<040715>
//					:2004/08/18(T.Aoki)
//					:総括表判定区分の制御 追加<040818A>
//**********************************************************************
procedure TJNTCRP004002F.fnWCtlExit(Sender: TObject);
var
	SActCtl : TwinControl;
	i		: integer;
	Rtn		: Word;
    bRtn    : Boolean;
begin

	//------------------------------------------
	//自フォームがACTIVEでない場合は処理を抜ける
	for i:=0 to ComponentCount-1 do
	begin
		if Components[i]=Screen.activecontrol then
			break;
	end;
	if i>=ComponentCount then
		Exit;
	//------------------------------------------

    if(Sender is TMnumEdit)then
	begin
		//リスト名称表示
		bRtn:=fnGetList(Sender);
		if bRtn = False then
		begin
			MjsSetFocus(Self,TMNumEdit(Sender).Name);
			Beep;
			Abort;
		end;
    end;


end;

//******************************************************************************
//		Proccess	: SelectItemから名称を取得する
//		Name		: 丘 嶸(上海未来)
//		Date		: 2001/01/06
//		Parameter	: cmpEdit	:
//		Return		: True		: OK
//					: False		: NG
//		History		: 9999/99/99	X.Xxxx
//									XXXXXXXXXXXXXXXXXX
//******************************************************************************
function TJNTCRP004002F.fnGetList(cmpEdit: TObject): Boolean;
var
	i		: Integer;
	iPos	: Integer;
	iLen	: Integer;
	sName	: String;
	cmpLabel: TMLabel;
	ParentCtrl:TWinControl;
begin
	Result	:= False;

	//名称ｾｯﾄなし
	if TMNumEdit(cmpEdit).SelectItems.Count = 0 then
	begin
		Result				:= True;
		Exit;
	end;

	cmpLabel:=nil;

	ParentCtrl:=TMNumEdit(cmpEdit).Parent;
	if ParentCtrl <> nil then
	begin
		for i := 0 to ParentCtrl.ControlCount - 1 do
		begin
			if (ParentCtrl.Controls[i] is TMLabel) then
			begin
				if (ParentCtrl.Controls[i].Tag = TMNumEdit(cmpEdit).Tag)
					and (TMNumEdit(cmpEdit).Tag<>0) then
				begin
					cmpLabel:=TMLabel(ParentCtrl.Controls[i]);
					break;
				end;
			end;
		end;
	end;

	if cmpLabel=nil then
		exit;

	iPos	:= 0;
	for i:=1 to TMNumEdit(cmpEdit).SelectItems.Count do
	begin
		iPos	:= MjsHanPos(':', TMNumEdit(cmpEdit).SelectItems.Strings[i-1]);
		if iPos = 0 then
			continue;

		sName	:= MjsHanCopy(TMNumEdit(cmpEdit).SelectItems.Strings[i-1], 1, iPos-1);

		if TMNumEdit(cmpEdit).Value = StrToInt(sName) then						//No一致?
			break;
	end;
	//一致しなかった
	if i > TMNumEdit(cmpEdit).SelectItems.Count then
	begin
		result := false;	// 01/04/27 Kondo Add
		cmpLabel.Caption	:= '';
		Exit;
	end;

	iLen			:= MjsHanLength(TMNumEdit(cmpEdit).SelectItems.Strings[i-1]);
	sName			:= MjsHanCopy(TMNumEdit(cmpEdit).SelectItems.Strings[i-1], iPos+1, iLen-iPos);
	cmpLabel.Caption:= sName;
	Result			:= True;
end;

//************************************************************************
//	Component		:	BPrint
//	Event			:	Click
//	Name			:	丘	嶸(上海未来)
//************************************************************************
procedure TJNTCRP004002F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;            // <PRN>
    JNTPDlg     :   TFrmJNTPDialog;     // <PRN>
begin

    // 販売ポインタ設定
    m_cJNTArea.setSelAppRecord;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<PRN>
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<Del10-VerUp001><D10_OwnMapRules> ST
	dbCorp_Select.FormatOptions.MapRules.Clear;
	dbCorp_Select.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
			// 051115 >>
            // 実在取引先リスト
            if ( uvHani.pvrPattern = 0 ) then
            begin
                fnPrnSET();
				PrtParam.TargetMD   :=  MDPrint;
		    end;
			// 051115 <<
            // <PRN>
            with PrtParam do
			begin
				Para		    :=  uvHani;
				TargetQry	    :=  DmqPrint;
                // 051115	TargetMD        :=  nil;
				CorpSys		    :=  uvSelSys;
                JNTArea         :=  m_cJNTArea;	// 051115
                // *** 汎用変数 *** //
                TargetParam	    :=  nil;
	    	    TargetStr	    :=  '';
//    		    TargetInt	    :=  0;//<128>del

//<128>add st
                if m_GCBaseFlag = True then
            		TargetInt	:=  1
                else
        	    	TargetInt	:=  0;
//<128>add end

                // *** 汎用変数 *** //
			end;

            //印刷する<PRN>
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else Exit;		//ｴﾗｰ
    end;

    // 財務ポインタ設定
    m_cJNTArea.setMasAppRecord;

{inoue
    PrnForm := TJNTCRP001030PrintF.Create( Self ); // <LEAD>

	if Assigned(PrnForm) <> True then
	begin

//<LEAD>		GetMsg(rcMsg,30,2);
//<LEAD>		with rcMsg do
//<LEAD>		begin
//<LEAD>			MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
//<LEAD>		end;
		Abort;
	end;
}
(*
	try
		try
			PrnForm.NSPDB	:= dbNSPCorp;										// 会社DB
			PrnForm.dbNSPCom:= DBNSPCommon;									    // 給与DB
			PrnForm.DBCTL	:= dbCtlDb;											// 共通DB
			PrnForm.iCopNo	:= m_pRec.m_iCorpCode;								// 会社コード
			PrnForm.DBMod	:= DBMod;											// DBモジュール
			PrnForm.giKeta	:= 4;												// 桁数

			PrnForm.fnPrint(m_pRec);											// 印刷処理

		except
//<LEAD>			GetMsg(rcMsg,30,2);
//<LEAD>			with rcMsg do
//<LEAD>			begin
//<LEAD>				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
//<LEAD>			end;
			Abort;
		end;
	finally
		PrnForm.Free;
		PrnForm := Nil;
	end;
*)
end;


// 051115 >>
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】
// -----------------------------------------------------------------------------
procedure TJNTCRP004002F.fnPrnSET();
var
	dqMasterData    :   TMQuery;
    sCode           :   String;
    sKName          :   String;//<128>add
begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);

    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
//<128>del st 
{      Close ();
		SQL.Clear();
        SQL.Add('select ma.*,                           '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        '   // 与信限度額     (mtokui)
            +   '   ,mt.TStartDate      m_StDate        '   // 適用日（自）   (mtokui)
            +   '   ,mt.TEndDate        m_EnDate        '   // 適用日（至）   (mtokui)
            +   '   ,mt.UpdDateTM       m_UpDate        '   // 最終更新日時   (mtokui)

            +   'from MTOKUI_MAS ma           			'
            +   'left outer join MTOKUI mt ON       	'
            +   '   (ma.BaseNCode = mt.NCode)           '
            +   'where (mt.RDelKbn = 0)                 '
            +   '  and (mt.SumKbn = 0)                  '
            +   '  and (mt.TemplateKbn = 0)             ');
}//<128>del end

//<128>add st
		Close ();
		SQL.Clear();
        SQL.Add('select ma.*,                           '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        '   // 与信限度額     (mtokui)
            +   '   ,mt.TStartDate      m_StDate        '   // 適用日（自）   (mtokui)
            +   '   ,mt.TEndDate        m_EnDate        '   // 適用日（至）   (mtokui)
            +   '   ,mt.UpdDateTM       m_UpDate        ');   // 最終更新日時   (mtokui)
            if(m_GCBaseFlag = true)then
            begin
                SQL.Add('   ,gc.GrpComCode      g_GrpCode       ');   // グループ会社コード
            end;

            SQL.Add('from MTOKUI_MAS ma           			'
            +   'left outer join MTOKUI mt ON       	'
            +   '   (ma.BaseNCode = mt.NCode)           ');
            if(m_GCBaseFlag = true)then
            begin
               SQL.Add('left outer join GCCostmerCom gc  ON    '
                +   '   (ma.BaseNCode = gc.CostmerCode)     ');
            end;

            SQL.Add('where (mt.RDelKbn = 0)                 '
            +   '  and (mt.SumKbn = 0)                  '
            +   '  and (mt.TemplateKbn = 0)             ');
//<128>add end

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
(* <HAN>
            if ( uvHani.pvrStCode[0] <> '' ) and
               ( uvHani.pvrEdCode[0] =  '' ) then
            begin
//@　↓12.02
{
                SQL.Add('  AND  (mt.GCode >= :ExCode)   ');
                if ( uvAttr <= 1 ) then
    			    ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrStCode[0];
            end
            else if ( uvHani.pvrStCode[0] =  '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
                SQL.Add('  AND  (mt.GCode <= :ExCode)   ');
                if ( uvAttr <= 1 ) then
        			ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrEdCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrEdCode[0];
            end
            else if ( uvHani.pvrStCode[0] <> '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
            }
 //@ ↑
                SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
			    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
                if ( uvAttr <= 1 ) then
                begin
        			ParamByName('ExStCode').AsString   :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))]);
        			ParamByName('ExEdCode').AsString   :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrEdCode[0]))]);
                end
                else
                begin
                    ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
        			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
                end;
            end;
*)
			// <HAN> >>
            SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
			// <HAN> <<
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY mt.GCode         ')
        else    SQL.Add('ORDER BY mt.Renso, mt.GCode  ');

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
//			ErrorMessageDsp(dqMasterData);
			dqMasterData.Close();
			dqMasterData.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MDPrint.Append();
			//------------------------------------------------------------------
            // 取引先情報
			//------------------------------------------------------------------
            // 外部ｺｰﾄﾞ
            // 数値属性
            if ( uvAttr = 0 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( uvAttr = 1 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 2);
			MDPrint.FieldByName('GCode'	).AsString	    :=  sCode;
			// 取引先分類
			if GetFld('BunCode'	).AsInteger = 0 then
            	MDPrint.FieldByName('BunCode'	).AsString := 'その他一般'
            else if GetFld('BunCode'	).AsInteger = 1 then
            	MDPrint.FieldByName('BunCode'	).AsString := '連結子(親会社)'
            else if GetFld('BunCode'	).AsInteger = 2 then
            	MDPrint.FieldByName('BunCode'	).AsString := '非連結子会社'
            else if GetFld('BunCode'	).AsInteger = 3 then
            	MDPrint.FieldByName('BunCode'	).AsString := '関連会社';
            // 連想
			MDPrint.FieldByName('Renso'	).AsString	    :=  GetFld('m_Renso'	).AsString;
            // 簡略名称
			MDPrint.FieldByName('Nmk'	).AsString	    :=  GetFld('m_Nmk'		).AsString;
            // 正式名称
			MDPrint.FieldByName('Nm'	).AsString	    :=  GetFld('m_Nm'		).AsString;
            // 郵便番号(基番)
            if ( not GetFld('POSTNO1').IsNull      ) and
               ( GetFld('POSTNO1').AsString <> '0' ) then
               //@　↓12.02 書式変換追加
               MDPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('POSTNO1').AsInteger]);
                //MDPrint.FieldByName('PostNo1').AsString	        :=	GetFld('POSTNO1').AsString;
                //@ ↑
            // 郵便番号(枝番)
            if ( not GetFld('POSTNO2').IsNull      ) and
               ( GetFld('POSTNO2').AsString <> '0' ) then
                //@　↓12.02 書式変換追加
                MDPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('POSTNO2').AsInteger]);
                //MDPrint.FieldByName('PostNo2').AsString	        :=	GetFld('POSTNO2').AsString;
                //@ ↑
			//------------------------------------------------------------------
            // 基本情報
			//------------------------------------------------------------------
            // 住所
			MDPrint.FieldByName('Ads1'	).AsString	    :=  GetFld('Ads1'		).AsString;
			MDPrint.FieldByName('Ads2'	).AsString	    :=  GetFld('Ads2'		).AsString;
            // 電話番号
			MDPrint.FieldByName('Tel1'	).AsString	    :=  GetFld('Tel1'		).AsString;
            // 送付先部署名
			MDPrint.FieldByName('SectNm').AsString	    :=  GetFld('SectionName'	).AsString;
            // 担当者名
			MDPrint.FieldByName('TanNm'	).AsString	    :=  GetFld('TanNm'		).AsString;
            // 敬称
			MDPrint.FieldByName('Keisyo').AsString	    :=  GetFld('KeisyoKbn'	).AsString;
            // メアド
			MDPrint.FieldByName('Mail'	).AsString	    :=  GetFld('MailAddress'	).AsString;

			//------------------------------------------------------------------
            // 資金繰
			//------------------------------------------------------------------
			// 得意先借方資金繰コード
			MDPrint.FieldByName('TDebitCashCd'	).AsInteger	:=  fnGetGCODE(GetFld('TDebitCash').AsInteger);
            MDPrint.FieldByName('TDebitCashNm'	).AsString  :=  fnGetNameSimple(MDPrint.FieldByName('TDebitCashCd'	).AsInteger);
			// 得意先貸方資金繰コード
            MDPrint.FieldByName('TCreditCashCd'	).AsInteger	:=  fnGetGCODE(GetFld('TCreditCash').AsInteger);
            MDPrint.FieldByName('TCreditCashNm'	).AsString  :=  fnGetNameSimple(MDPrint.FieldByName('TCreditCashCd'	).AsInteger);
			// 仕入先借方資金繰コード
            MDPrint.FieldByName('SDebitCashCd'	).AsInteger	:=  fnGetGCODE(GetFld('SDebitCash').AsInteger);
            MDPrint.FieldByName('SDebitCashNm'	).AsString  :=  fnGetNameSimple(MDPrint.FieldByName('SDebitCashCd'	).AsInteger);
			// 仕入先貸方資金繰コード
            MDPrint.FieldByName('SCreditCashCd'	).AsInteger	:=  fnGetGCODE(GetFld('SCreditCash').AsInteger);
            MDPrint.FieldByName('SCreditCashNm'	).AsString  :=  fnGetNameSimple(MDPrint.FieldByName('SCreditCashCd'	).AsInteger);

			// 売上消費税コード
            MDPrint.FieldByName('STaxCode'	).AsInteger  := GetFld('STaxCode')    .AsInteger;
            MDPrint.FieldByName('STaxName'	).AsString   := fnGetTaxName (0, GetFld('STaxCode')    .AsInteger);		// 名称ｾｯﾄ
			//仕入消費税コード
            MDPrint.FieldByName('BTaxCode'	).AsInteger  := GetFld('BTaxCode')    .AsInteger;
            MDPrint.FieldByName('BTaxName'	).AsString   := fnGetTaxName (1, GetFld('BTaxCode')    .AsInteger);		// 名称ｾｯﾄ

            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  MjsGetGengou( GetFld('m_StDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:= MjsGetGengou( GetFld('m_EnDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.02 書式変換追加
                 // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                begin
                    MDPrint.FieldByName('UpdDateTM').AsString	:= MjsGetGengou(GetFld('m_UpDate').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('m_UpDate').AsDateTime);
                end;
                 //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  FormatDateTime( 'yyyy/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.01  書式変換追加
                 // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                begin
                    MDPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('m_UpDate').AsDateTime);
                end;
                //@ ↑
            end;

			// リスク区分<118>
            if f1RISKKBN.Visible then
            begin
                MDPrint.FieldByName('RiskKbn').AsInteger  := GetFld('RiskKbn').AsInteger;
                MDPrint.FieldByName('RiskKbnNm').AsString := MjsHanCopy(f1RISKKBN.SelectItems.Strings[GetFld('RiskKbn').AsInteger], 4, 16);
            end;
            
//<128>add st
			if(m_GCBaseFlag = true)then
            begin
                if ( not GetFld('g_GrpCode').IsNull ) and (GetFld('g_GrpCode').AsInteger <> 0 ) then
                begin
					if(GrpCodeFlag(GetFld('g_GrpCode').AsInteger)) and  (GrpNameGet(GetFld('g_GrpCode').AsInteger,sKName))then//<128>add
					begin
                    	MDPrint.FieldByName('GrpCode').AsInteger  := GetFld('g_GrpCode').AsInteger;
                        MDPrint.FieldByName('KName').AsString  := sKName;
                    end;
                end;
            end;
//<128>add end
            MDPrint.Post();
            Next;
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();
end;
// 051115 <<

//******************************************************************************
//		procedure	:
//		Name		: 華 震名(上海未来)
//		Date		: 2001/03/27
//		Parameter	: なし
//		Return		:
//		History		: 9999/99/99	X.Xxxx
//******************************************************************************
procedure TJNTCRP004002F.fnSetProperty(iKbn: integer; eEdit: TMTxtEdit ;
  lLabel: TMLabel);
begin

	Case iKbn of
        // 通常
		0:
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
		end;
        // 入力不可・非表示
		1:;
		2:
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled:=False;
			eEdit.Text :='';
			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;

end;
procedure TJNTCRP004002F.fnSetProperty(iKbn: integer; eEdit: TMNumEdit;
  lLabel: TMLabel);
begin

	Case iKbn of
        // 通常
		0:
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
        // 入力不可・表示
		1:
		begin
			eEdit.ParentColor:=True;
		end;
        // 入力不可・非表示
		2:
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled	:=False;
			eEdit.Value		:=0;
			eEdit.Zero		:=False;
			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;

end;

//-----------------------------------------------------------------------------
{private function記述 START位置}
//=============================================================================
//-----------------------------------------------------------------------------
// フィールド入力値のチェックをする
//-----------------------------------------------------------------------------
function TJNTCRP004002F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompoName : string;
    lvRowNo     : Integer;
    lvCode,
    lvNm,
    lvNmk       : String;
    lvNo        : Integer;
    lvDFM       : Integer;
    i           : Integer;
    Bol         : Boolean;
    iSeiKbn     : Integer;
    iOyakoFL    : Integer;
    lvErrCod    : Integer;
    sKName      : String;//<128>add
begin

    Result := True;

    lvCompoName := TComponent(Sender).Name;

    //===================================================================
    //取引先コード
    //===================================================================
    with f0CODE do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            //<122> --- St ---
            if uvAttr <> 2 then
            begin
                if f0CODE.InputFlag = False then
                    f0CODE.Zero := True
                else
                    f0CODE.Zero := False;
            end
            else
                f0CODE.Zero := False;
            //<122> --- Ed ---

            if Trim(Text) = '' then
            begin
                uvSelSys.MsgDlg(1010,10);                   // 必須入力です。
                SetFocus;
                Result := False;
                Exit;
            end;
            if JNTSelXKanjiCheck(Text) = True then
            begin
                uvSelSys.MsgDlg(1010,20);                   // 入力値に漢字もしくは特殊文字が含まれています。
                SetFocus;
                Result := False;
                Exit;
            end;
{↓<Rel>
            if fnChkTRCODE = False then
            begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
            end;
 ↑<Rel>}
// ↓<Rel>
            lvErrCod := fnChkTRCODE;
            if lvErrCod <> 0 then
            begin
                case lvErrCod of
                    -1:
                    begin
                        uvSelSys.MsgDlg(1010,50);
                    end;
                    -98:
                    begin
                        // 親に存在(同期ｷｬﾝｾﾙ) は何もしない。
                    end;
                    -99:
                    begin
                        MjsMessageBoxEx (Self,'登録が異常終了しました。', 'マスタ同期', mjError, mjOk, mjDefOk);
                    end;
                end;
                SelectAll; // コード欄を全選択する。
                SetFocus;
                Result := False;
                Exit;
            end;
// ↑<Rel>

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //取引先分類
    //===================================================================
    with f1BRCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if (AsInteger < 0) or (AsInteger > 3) then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    
    //===================================================================
    //グループ会社コード
    //===================================================================
//<128>add st
    with  f1GurpCode do
    begin
    	if (AllChkMode) or (lvCompoName = Name) then
    	begin
        	if (f1BRCD.AsInteger >0) AND (f1BRCD.AsInteger <=3) and (f1GurpCode.AsInteger <> 0) then
			begin
           		if(GrpCodeFlag(ASInteger) = False)then
		   		begin
                    f1KName.text := '';
					MjsMessageBoxEx(Self,'グループ会社登録－グループ会社設定に登録されていない会社のため登録できません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
					SetFocus;
                	Result := False;
                	Exit;
		   		end;

		   		if(GrpNameGet(f1GurpCode.ASInteger,sKName) = False)then
		   		begin
                    f1KName.text := '';
					MjsMessageBoxEx(Self,'グループ会社コードに該当する会社データが存在しません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
					SetFocus;
                	Result := False;
                	Exit;
		   		end;
			end;
        	if AllChkMode = False then Exit;
        end;
    end;
//<128>add end
    //===================================================================
    //郵便番号１
    //===================================================================
    with f1POSTNO1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //郵便番号２
    //===================================================================
    with f1POSTNO2 do
    begin

        if (lvCompoName = Name) then
        begin
	        fnCallPostExplorer('郵便2',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

   			//ゼロ表示
            if f1POSTNO1.Value <> 0 then
               	f1POSTNO2.Zero := True
            else
               	f1POSTNO2.Zero := False;

            if AllChkMode = False then Exit;
        end;


    end;
    //===================================================================
    //住所１
    //===================================================================
    with f1ADS1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //住所２
    //===================================================================
    with f1ADS2 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //電話番号１
    //===================================================================
    with f1TEL1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            //漢字のチェック
            if JNTSelXKanjiCheck(Text) = True then
            begin
				uvSelSys.MsgDlg(1010,20);
                SetFocus;
                Result := False;
                exit;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //売上消費税コード
    //===================================================================
    with f1URTaxCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetTaxName (0,f1URTaxCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //売上消費税率コード
    //===================================================================
    with f1URTax do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
//<123> MOD st
//  			if (f1URTax.AsInteger < 0) or (f1URTax.AsInteger > 2) then
			if (m_TaxRateInfo.IsExistRateCD(f1URTax.AsInteger) = False) then
//<123> MOD ed
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //仕入消費税コード
    //===================================================================
    with f1SITaxCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetTaxName (1,f1SITaxCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;

    //===================================================================
    //仕入消費税率コード
    //===================================================================
    with f1SITax do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
//<123> MOD st
//  			if (f1SITax.AsInteger < 0) or (f1SITax.AsInteger > 2) then
			if (m_TaxRateInfo.IsExistRateCD(f1SITax.AsInteger) = False) then
//<123> MOD ed
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            //<126> -St 特定課税仕入消費税コードと消費税率のチェック
            if ((f1SITaxCD.AsInteger in [80,81,82,84,85,86]) and (f1SITax.AsInteger in [1,2])) then
            begin
                MjsMessageBoxEx(Self, '選択した消費税コードでは設定できない消費税率です。', '確認', mjInformation, mjOK, mjDefOK);
                SetFocus;
                Result := False;
                Exit;
            end;
            //<126> -Ed
            if AllChkMode = False then Exit;
        end;

    end;
    //===================================================================
    //得意先借方資金繰りコード
    //===================================================================
    with f1T_KRSKCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetNameSimple (f1T_KRSKCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //得意先貸方資金繰りコード
    //===================================================================
    with f1T_KSSKCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetNameSimple (f1T_KSSKCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //仕入先借方資金繰りコード
    //===================================================================
    with f1S_KRSKCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetNameSimple (f1S_KRSKCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //仕入先貸方資金繰りコード
    //===================================================================
    with f1S_KSSKCD do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
			if fnGetNameSimple (f1S_KSSKCD.AsInteger) = '' then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //リスク区分<118>
    //===================================================================
    with f1RiskKbn do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
  			if (f1RiskKbn.AsInteger < 0) or (f1RiskKbn.AsInteger > 2) then
			begin
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Exit;
			end;
            if AllChkMode = False then Exit;
        end;
    end;


end;
//-----------------------------------------------------------------------------
// フィールド入力値のチェックをする
//	共通：MKBNﾃｰﾌﾞﾙ用（TBL列='ALL'のみ）
//-----------------------------------------------------------------------------
function TJNTCRP004002F.fnFldChk_TbMkbn1(Sender: TObject; SenderNM: TObject; PiSBoxNo: Integer; TblNm: String; ChkBol:Boolean; DspBol:Boolean ): Boolean;
{   引数
	1.Sender: 	TObject;	TNumREditｵﾌﾞｼﾞｪｸﾄ
   	2.SenderNM: TObject;    TLabelｵﾌﾞｼﾞｪｸﾄ
    3.PiSBoxNo: Integer;    ﾀﾌﾞﾊﾟﾈﾙ番号
    4.KbnType: 	String      MKBNﾃｰﾌﾞﾙのTYPE列
    5.ChkBol:	Boolean:    強制ﾁｪｯｸﾌﾗｼﾞ( True:あり False:なし )
    6.DspBol: 	Boolean		Label表示( True:あり / False:なし )
}
var
   CompoName: 	String;
   wi_Name: 	String;
begin

    Result := True;

     // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    CompoName := '';
    if Screen.ActiveControl <> nil then
        CompoName := TComponent(Screen.ActiveControl).Name
    else
    begin
        Result := False;
    	Exit;
    end;

    with TMNumEdit(Sender) do
    begin

       	wi_Name := Name;	// ﾃﾞﾊﾞｯｸにて視認するため。

        if (ChkBol = True) or (CompoName = wi_Name) then
        begin	// 強制ﾁｪｯｸがTrueか、ｺﾝﾎﾟｰﾈﾝﾄ名称が位置の場合に処理

			if fnMkbnGet_ExLb(TMNumEdit(Sender), TMLabel(SenderNM), 'ALL', TblNm, DspBol) = False then
            begin
        		uvSelSys.MsgDlg(1010,40);
//				MTab1.Items.Selected := PiSBoxNo;
                SetFocus;
                Result := False;
//                Abort;    //<30>
            end;

{   //<30>
		end else
        begin

			Result := False;
}

        end;

    end;

end;	{fnFldChk_TbMkbn}
//-----------------------------------------------------------------------------
//  選択文字列を作成する
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.fnKbnStrSet;
var
    lvStr: TStringList;
    lvMax: Integer;
    ix: Integer;
    Qry : TFDQuery;

//--------------------------------------------
// [区分名コード]文字列オブジェクトを作成する
//--------------------------------------------
function lfnKbnStrSet(Qry: TFDQuery; TBL, TYP: String; var Str: TStringList):Integer;
var
    lvSelectCount: Integer;

begin

    lvSelectCount := 0;

    //[区分]テーブルよりレコードを取得する
    with Qry do
    begin
        Str.Clear;
        SQL.Clear;
        SQL.Add('select CODE, NM from MKBN ');
        SQL.Add('where (TBL = :pTBL) and (TYPE = :pTYPE) order by CODE');
        ParamByName('pTBL') .AsString  := TBL;
        ParamByName('pTYPE').AsString  := TYP;

        Open;
        while not  EOF  do
        begin
            Inc(lvSelectCount);
            //取得結果を文字列オブジェクトにセットする
            Str.Add(FieldByName('NM').AsString);
            Next;
        end;
        Close;
    end;

    Result := lvSelectCount;

end;



begin

    //文字列オブジェクトを作成する
    try
        Qry := TMQuery.Create(Self);											// MQueryの構築
        if Assigned(Qry) <> True then
        begin
            Exit;
        end;

        MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);						// DBとの接続

        lvStr := TStringList.Create;

        //[敬称区分]を作成する
        lfnKbnStrSet(Qry, 'ALL', '敬称区分',lvStr);
        f1KEISYO.SelectItems := lvStr;

    finally
        lvStr.Free;
        //Qry.Close;
        //Qry.Free;
    end;


end;	{fnKbnStrSet}
//-----------------------------------------------------------------------------
// 各種名称取得処理
// 	fnMkbnGet_ExLb	: Edit & Label
//-----------------------------------------------------------------------------
function TJNTCRP004002F.fnMkbnGet_ExLb(Sender: TObject; SenderNM: TObject; TblType: String; KbnType: String; bDsp: Boolean): Boolean;
{   引数
	1.Sender: 	TObject;	TNumREditｵﾌﾞｼﾞｪｸﾄ
   	2.SenderNM: TObject;    TLabelｵﾌﾞｼﾞｪｸﾄ
    3.TblType: 	String;     MKBNﾃｰﾌﾞﾙのTBL列
    4.KbnType: 	String      MKBNﾃｰﾌﾞﾙのTYPE列
    5.bDsp: 	Boolean		Label表示( True:あり / False:なし )
}
var
    lvNm : string;
begin

    Result := True;

    //　MKBNﾃｰﾌﾞﾙより名称取得
    if fnKBNNameGet(TblType, KbnType, TMNumEdit(Sender).AsInteger, lvNm) = True then
	begin
    	if bDsp = True then
	    	TMLabel(SenderNM).Caption := lvNm
	end else
    begin
//ﾃｽﾄ用    	TMLabel(SenderNM).Caption := '設定値異常';
	    Result := False;
    end;

end;	{fnMkbnGet_ExLb}

//-----------------------------------------------------------------------------
//  gfnKBNNameGet()
//      区分名称ﾏｽﾀの名称を取得する
//      PARA      Qry   : 使用するTQuery
//                TBL   : テーブル識別
//                TYPE  : 区分タイプ
//                Code  : CODE
//      VARPARA   NM    : 正式名称
//      RETURN  : Boolean(True or False)
//-----------------------------------------------------------------------------
//  修正履歴
//  <修正者>    <修正日>    <修正内容>
//  xxxxxx      yyyy.mm.dd  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//
//-----------------------------------------------------------------------------
function  TJNTCRP004002F.fnKBNNameGet(TBL, TYP: string; Code: integer; var rNm: string): Boolean;
begin

    // ｺｰﾄﾞ入力なしの場合はｴﾗｰ
    if (Code = 0) then
    begin
        rNm := '';
        Result := False;
        Exit;
    end;

    Qry := TMQuery.Create(Self);											// MQueryの構築
    if Assigned(Qry) <> True then
    begin
        Result := False;
        Exit;
    end;

    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);						// DBとの接続

    with Qry do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select NM from MKBN ');
        SQL.Add('where (TBL = :pTBL) and (TYPE = :pTYP) and (CODE = :pCODE) ');
        ParamByName('pTBL')  .AsString  := TBL;
        ParamByName('pTYP')  .AsString  := TYP;
        ParamByName('pCODE') .AsInteger := Code;
        Open;

        if EOF = True then
        begin
            rNm := '';
            Result := False;                                // 該当ﾃﾞｰﾀなし
        end
        else begin
            rNm    := FieldByName('NM').AsString;
            Result := True;
        end;
        Close;
    end;

    Qry.Free;

end;


//******************************************************************************
//		function	: fnSousa_Select 関数
//		Name		: 沈暁輝（上海未来）
//		Date		: 2001/01/04
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//		History		: 2002/11/22	Y.Kondo	<K021122>
//									年間所定労働時間追加
//					: 2004/08/18	T.Aoki
//					:	納付書氏名
//					:	総括表判定区分
//					:	を追加<040818>
//					: 2004/09/14	T.Aoki
//					:	総括表判定区分=1区分判定で,
//					:	退職者集計区分の内容が表示される不具合修正<040914>
//******************************************************************************
function TJNTCRP004002F.fnSousa_Select: Boolean;
var
	DMQuery		:TMQuery;
    GCQuery		:TMQuery;	//<128>add
    sKName		:String;	//<128>add
begin

//<128>add st
    f1GurpCode.value :=0;
    sKName   := '';
//<128>add end

	Result := False;
	DMQuery  := TMQuery.Create(Self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続
	try

        with DMQuery do
        begin
            fnCompClear;

            if uvDispFlg = 0 then
                fnCompEnabled(True)
            else
            begin
                fnCompEnabled(False);
//<116>↓
//親画面でメッセージ出力するため、
//ここでは表示しない
{
                if m_cJNTArea.IsModify = True then
            		MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
}
//<116>↑
            end;

            Close;
            //MTOKUIを呼び出す
            SQL.Clear;
            Sql.Add('Select ma.*,m.TemplateKbn from MTOKUI_MAS ma '+
			        'Left Outer Join MTOKUI m On ma.BaseNCode = m.NCode'+
                    ' Where (ma.BaseNCode = :pCODE)');
            ParamByName('pCODE').asFloat := uvNCODE;
            Open(True);
            if not Eof then
            begin
                fnCompCDChange(f1BRCD);				// 名称ｾｯﾄ
                f1BRCD.value     := GetFld('BunCode')    .AsInteger;
                f1POSTNO1.value  := GetFld('POSTNO1')    .AsInteger;
                f1POSTNO2.value  := GetFld('POSTNO2')    .AsInteger;  // <06>
                f1ADS1.Text      := GetFld('ADS1')       .AsString;
                f1ADS2.Text      := GetFld('ADS2')       .AsString;
                f1TEL1.Text      := GetFld('TEL1')       .AsString;
                f1SOFUB.Text     := GetFld('SectionName').AsString;
                f1TANM.Text      := GetFld('TanNm')      .AsString;
                f1KEISYO.text    := GetFld('KeisyoKbn')  .AsString;
                f1MailAd.text    := GetFld('MailAddress')  .AsString;
                f1URTaxCD.value  := GetFld('STaxCode')    .AsInteger;
                fnCompCDChange(f1URTaxCD);				// 名称ｾｯﾄ
                f1URTax.value    := GetFld('STaxRate')    .AsInteger;
                fnCompCDChange(f1URTax);				// 名称ｾｯﾄ
                f1SITaxCD.value  := GetFld('BTaxCode')    .AsInteger;
                fnCompCDChange(f1SITaxCD);				// 名称ｾｯﾄ
                f1SITax.value    := GetFld('BTaxRate')    .AsInteger;
                fnCompCDChange(f1SITax);				// 名称ｾｯﾄ
                f1T_KRSKCD.Value   := fnGetGCODE(GetFld('TDebitCash').AsInteger);
                f1T_KSSKCD.Value   := fnGetGCODE(GetFld('TCreditCash').AsInteger);
                f1S_KRSKCD.Value   := fnGetGCODE(GetFld('SDebitCash').AsInteger);
                f1S_KSSKCD.Value   := fnGetGCODE(GetFld('SCreditCash').AsInteger);
                f1RISKKBN.Value    := GetFld('RISKKBN').AsInteger; //<118>

                f1T_KRSKNM.Caption :=  fnGetNameSimple(f1T_KRSKCD.AsInteger);   //<108>
                f1T_KSSKNM.Caption :=  fnGetNameSimple(f1T_KSSKCD.AsInteger);   //<108>
                f1S_KRSKNM.Caption :=  fnGetNameSimple(f1S_KRSKCD.AsInteger);   //<108>
                f1S_KSSKNM.Caption :=  fnGetNameSimple(f1S_KSSKCD.AsInteger);   //<108>
                if f1RISKKBN.Visible then
                    f1RISKKBNNM.caption := MjsHanCopy(f1RISKKBN.SelectItems.Strings[f1RISKKBN.AsInteger], 4, 16); //<118>

                if GetFld('TemplateKbn').asInteger = 1 then
                begin
                    AddPanel.Enabled := False;
                    if uvDispFlg = 0 then
                    begin
                        f1BRCD.SetFocus;
                    end
                    else
                    begin
                        f0CODE.Enabled := True;
                        f0CODE.SetFocus;
                        BCancel_Sousa.Enabled := True;
                    end;
                end
                else
                begin
                    if uvDispFlg = 0 then
                    begin
                        f1BRCD.SetFocus;
                    end
                    else
                    begin
                        f0CODE.Enabled := True;
                        f0CODE.SetFocus;
                        BCancel_Sousa.Enabled := True;
                    end;
                end;

                uvInsFlg    := False;    //更新
            end
            else
                uvInsFlg    := True ;    //新規

        end;
//<128>del      Result := True;

//<128>del      m_EdtSw := False;                       // <111>変更ﾌﾗｸﾞOFF

	finally
		DMQuery.Close ;
		DMQuery.Free ;
	end;

//<128>add st
	GCQuery  := TMQuery.Create(Self);
	if Assigned(GCQuery) <> True then
	begin
		Exit;
	end;

	try
    	if (m_GCBaseFlag = True) and (f1BRCD.value <> 0) and (f1BRCD.AsString <>'') then
    	begin
    		MDataModule.SetDBInfoToQuery(dbCorp_Select, GCQuery);

       		f1GurpCode.Enabled := True;

        	with GCQuery do
       	 	begin
            	SQL.Clear;
        		SQL.Add('select GrpComCode from GCCostmerCom ');
        		SQL.Add('where (CostmerCode =:pCODE)');
        		ParamByName('pCODE').asFloat := uvNCODE;

           		if Open = False then
	    		begin
	    	    	GCQuery.Close;
	    			GCQuery.Free;
        		end;

            	if Eof <> True then
            	begin
               		f1GurpCode.value:= GetFld('GrpComCode').AsInteger;
        		end;

            	if (f1GurpCode.value <> 0 ) then
            	begin
	    			if(GrpCodeFlag(f1GurpCode.ASInteger) = True)then
    	    		begin
    					if(GrpNameGet(f1GurpCode.ASInteger,sKName) = True)then
	    				begin
		    				f1KName.text := sKName;
    			    	end
	    				else
                		begin
			    			MjsMessageBoxEx(Self,'グループ会社コードに該当する会社データが存在しません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
							f1GurpCode.SetFocus;
							Exit;
    			    	end;
	    			end
    		    	else
            		begin
		      			MjsMessageBoxEx(Self,'グループ会社登録－グループ会社設定に登録されていない会社のため登録できません。', 'グループ会社', mjInformation, mjOk, mjDefOk );
						f1GurpCode.SetFocus;
						Exit;
			    	end;
            	end;
    		end;
    	end;

    	if (m_GCBaseFlag = True) and ((f1BRCD.value = 0) or (f1BRCD.AsString ='' ))then
		begin
        	f1GurpCode.Enabled    := False;
    	end;

    	Result := True;

    	m_EdtSw := False;                       // <111>変更ﾌﾗｸﾞOFF

	finally
        GCQuery.Close;
        GCQuery.Free;
	end;
//<128>add end

end;

//******************************************************************************
//		function	: fnSousa_Update 関数
//		Name		: 沈暁輝（上海未来）
//		Date		: 2001/01/04
//		Parameter	: なし
//		Return		: True	成功
//					  False	失敗
//		History		: 2002/11/22	Y.Kondo	<K021122>
//									年間所定労働時間追加
//					: 2004/08/18	T.Aoki
//					:	納付書氏名
//					:	総括表判定区分
//					:	を追加<040818>
//******************************************************************************
function TJNTCRP004002F.fnSousa_Update: Boolean;
var
	DMQuery		:TMQuery;
	GCQuery		:TMQuery;//<128>add

//-------------------------------------------
//  パラメータをセット
//-------------------------------------------
Procedure lfnParamSet;
begin

    with DMQuery do
    begin
        ParamByName('BunCode').asInteger     :=  f1BRCD.AsInteger;
        ParamByName('PostNo1').asInteger     :=  f1POSTNO1.AsInteger;
        ParamByName('PostNo2').asInteger     :=  f1POSTNO2.AsInteger;
        ParamByName('ADS1').asString         :=  f1ADS1.Text;
        ParamByName('ADS2').asString         :=  f1ADS2.Text;
        ParamByName('TEL1').asString         :=  f1TEL1.Text;
        ParamByName('SectionName').asString  :=  f1SOFUB.Text;
        ParamByName('TanNm').asString        :=  f1TANM.Text;
        ParamByName('KeisyoKbn').asString    :=  f1KEISYO.text;
        ParamByName('BaseNCode').AsFloat     :=  uvNCODE;
        ParamByName('MailAddress').AsString  :=  f1MailAd.Text;
        ParamByName('MailAddress').asString  :=  f1MailAd.Text;
        ParamByName('STaxCode').asInteger    :=  f1URTaxCD.AsInteger;
        ParamByName('STaxRate').asInteger    :=  f1URTax.AsInteger;
        ParamByName('BTaxCode').asInteger    :=  f1SITaxCD.AsInteger;
        ParamByName('BTaxRate').asInteger    :=  f1SITax.AsInteger;
        ParamByName('TDebitCash').asFloat    :=  fnGetNCODE(f1T_KRSKCD.asInteger);
        ParamByName('TCreditCash').asFloat   :=  fnGetNCODE(f1T_KSSKCD.asInteger);
        ParamByName('SDebitCash').asFloat    :=  fnGetNCODE(f1S_KRSKCD.asInteger);
        ParamByName('SCreditCash').asFloat   :=  fnGetNCODE(f1S_KSSKCD.asInteger);
        //<118> ↓
        if f1RISKKBN.Visible then
            ParamByName('RISKKBN').asInteger :=  f1RISKKBN.AsInteger; //<118>
        //<118> ↑

    end;


end;
begin
	Result := False;
	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

// <Rel>	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);						// DBとの接続



//↓<Rel>
    // -------------------------------------------------------------------------
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        // 親会社DBとTStoredProcの接続
    	MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, DMQuery)		// DBとの接続
    else
    	MDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);					// DBとの接続
//↑<Rel>

	SessionPractice(C_ST_PROCESS);				// <117>

	try
        with DMQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add(' Update MTOKUI_MAS SET ' +
                    ' BunCode   = :BunCode  , '+
                    ' PostNo1   = :PostNo1  , '+
                    ' PostNo2   = :PostNo2  , '+
                    ' ADS1      = :ADS1     , '+
                    ' ADS2      = :ADS2     , '+
                    ' TEL1      = :TEL1     , '+
                    ' SectionName = :SectionName, '+
                    ' TanNm       = :TanNm,      '+
                    ' KeisyoKbn   = :KeisyoKbn,   '+
                    ' MailAddress = :MailAddress,     '+
                    ' STaxCode  = :STaxCode , '+
                    ' STaxRate  = :STaxRate , '+
                    ' BTaxCode  = :BTaxCode , '+
                    ' BTaxRate  = :BTaxRate , '+
                    ' TDebitCash  = :TDebitCash,     '+
                    ' TCreditCash = :TCreditCash,     '+
                    ' SDebitCash  = :SDebitCash,     '+
                    ' SCreditCash = :SCreditCash     ');
                    //<118> ↓
                    if f1RISKKBN.Visible then
                        SQL.Add(', RiskKbn = :RiskKbn     ');
                    //<118> ↑
            SQL.Add(' Where  BaseNCode = :BaseNCode    ');

            lfnParamSet;
            EXECSQL(true);
//<114>            m_EdtSw := False;               // <111>変更ﾌﾗｸﾞOFF
        end;


//↓<Rel>
        // ﾄﾘｶﾞで子取引先ﾚｺｰﾄﾞの_Relが更新されるので、同期ﾌﾟﾛｼｼﾞｬを実行して配信してあげる。
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_MAS) = false ) then
            begin
                Result := false;
                Exit;
            end;
        end;
//↑<Rel>


	finally
		SessionPractice(C_ED_PROCESS);			// <117>
		DMQuery.Close;
		DMQuery.Free;
	end;

//<128>add st
	GCQuery  := TMQuery.Create(Self);

	if Assigned(GCQuery) <> True then
	begin
		Exit;
	end;

    if (m_GCBaseFlag = True)then
    begin
        try

        	MDataModule.SetDBInfoToQuery(dbCorp_Select, GCQuery);

            with GCQuery do
          	begin
                if(f1GurpCode.AsInteger=0)then
                begin

                    SQL.Clear;
           		    SQL.Add('Delete from GCCostmerCom ');
        		    SQL.Add('Where  CostmerCode = :BaseNCode    ');
				    ParamByName('BaseNCode').AsFloat     	:= uvNCODE;
				    ExecSQL(True);
                end
                else
                begin
                    SQL.Clear;
           		    SQL.Add('Insert Into GCCostmerCom (CostmerCode,GrpComCode) ');
                    SQL.Add('ON EXISTING ');
                    SQL.Add('Update Values (:BaseNCode, :GrpComCode)');
				    ParamByName('BaseNCode').AsFloat     	:= uvNCODE;
                    ParamByName('GrpComCode').asInteger     := f1GurpCode.AsInteger;
				    ExecSQL(True);
                end;
            end;

        finally
            GCQuery.Close;
            GCQuery.Free
        end;
    end;
//<128>add end
end;
//============================================================================
//  コンポーネントの使用可・不可の制御
//============================================================================
Procedure TJNTCRP004002F.fnCompEnabled(pBol:Boolean);
begin

    // [f1]項目を使用不可にする
{    MjsDispCtrl.MjsSetEnableds(Self,'f0',not(pBol));
    MjsDispCtrl.MjsSetEnableds(Self,'f1',pBol);
}
    PTop.enabled   := not(pBol);
    PSousa.enabled := pBol;

    BUpdate_Sousa.Enabled := pBol;
    BCancel_Sousa.Enabled := pBol;

end;
//============================================================================
//  コンポーネントのクリア
//============================================================================
Procedure TJNTCRP004002F.fnCompClear;
begin

    JNTSelXClrCtrls(Self, 'f1');

end;
//-----------------------------------------------------------------------------
// fnPostArrowClick()   <15>
//	< 入力ｺﾝﾎﾟｰﾈﾝﾄ ｸﾘｯｸ ｲﾍﾞﾝﾄ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.fnPostArrowClick(Sender: TObject);
begin
    //エクスプローラ表示 <05>
    fnCallPostExplorer('郵便1',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

end;
//-----------------------------------------------------------------------------
// fnAdsArrowClick()   <15>
//	< 入力ｺﾝﾎﾟｰﾈﾝﾄ ｸﾘｯｸ ｲﾍﾞﾝﾄ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.fnAdsArrowClick(Sender: TObject);
begin
    //エクスプローラ表示 <05>
    fnCallPostExplorer('住所',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);

end;
//-----------------------------------------------------------------------------
// fnPostArrowClick()   <15>で追加
//	< 郵便番号入力のOnArrowClickの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.fnCallPostExplorer(pvKeyWord:String; pvPostEdit1,pvPostEdit2:TMNumEdit; pvAdsEdit1,pvAdsEdit2:TMTxtEdit);
var
	sAdr1  :	String;
	sAdr2  :	String;
	sZip   :	String;
	iZip1  :	Integer;
	iZip2  :	Integer;
	iValue :	Integer;
	s1     :	String;		//<229>
	s2     :	String;		//<229>
begin

    // 基番ゼロは終了
//	if Trunc(pvPostEdit1.Value) = 0 then Exit;      //<52> del

	if  ( pvKeyWord = '郵便1' ) or      		   	// 郵便番号枝番入力
	    ( pvKeyWord = '郵便2' ) then
	begin
		iZip1 := Trunc(pvPostEdit1.Value);			// 基番 取得
		iZip2 := Trunc(pvPostEdit2.Value);			// 枝番 取得
		sZip  := MjsEditNum(iZip1,'0000',3);				// 基番文字列変換
		sZip  := sZip + '-' + MjsEditNum(iZip2,'0000',4);   // 枝番文字列変換

		sAdr1 := '';
		sAdr2 := '';
	end
	else begin  									// 住所上段入力
		sZip  := '';
		sAdr1 := pvAdsEdit1.Text;					// 住所上段 取得
		sAdr2 := pvAdsEdit2.Text;					// 住所下段 取得
	end;

	if  ( pvKeyWord = '郵便1' ) or      				// 郵便番号枝番入力
	    ( pvKeyWord = '住所' ) then
    begin
    	iValue := fnCMNPostShow(sZip,sAdr1,sAdr2,0);     // 郵便番号辞書Exp 起動
    end
    else begin

        if ( pvAdsEdit1.Text = '' ) and
           ( pvAdsEdit2.Text = '' ) then  //<28>
    		iValue := fnCMNPostGet(sZip,sAdr1,sAdr2,0)  // 郵便番号から直接検索
        else
            Exit;
    end;

	if iValue = 1 then
	begin
		iZip1 := StrToInt(MjsCopy(sZip,3));				// 基番 取り出し
		iZip2 := StrToInt(Copy(sZip,5,4));				// 枝番 取り出し

    	if  ( pvKeyWord = '郵便1' ) or      		   	// 郵便番号枝番入力
	        ( pvKeyWord = '郵便2' ) then
		begin
			if ((pvAdsEdit1.Text <> '') and (pvAdsEdit1.Text <> sAdr1)) or
			   ((pvAdsEdit2.Text <> '') and (pvAdsEdit2.Text <> sAdr2)) then
			begin
            	iValue := uvSelSys.MsgDlg(1010, 800);
				if iValue <> mrYes then
					Exit;
			end;
		end;

		pvPostEdit1.Value := iZip1;						// 基番 SET
		pvPostEdit2.Value := iZip2;						// 枝番 SET

//<229>--↓
		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr1)>40 then
		begin
			if not NspSepStr(sAdr1,40,s1,s2)then
				Exit;

			sAdr1:=s1;
			sAdr2:=s2+sAdr2;
		end;
		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr2)>40 then
		begin
			if not NspSepStr(sAdr2,40,s1,s2)then
				Exit;

			sAdr2:=s1;
		end;
//<229>--↑
		pvAdsEdit1.Text  := sAdr1;						// 住所上段 SET
		pvAdsEdit2.Text  := sAdr2;						// 住所下段 SET

        //次ﾌｨｰﾙﾄﾞへ
        if  ( pvKeyWord = '郵便1' ) or
            ( pvKeyWord = '住所' ) then
	        SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, True);

	end
	else if iValue < 0 then
	begin
//<DSP>		MessageDlg(	Self,'郵便番号辞書の呼び出しに失敗しました。', mtError, [mbOk], 0);
		MjsMessageBox(	Self,'郵便番号辞書の呼び出しに失敗しました。', mjError, mjDefOk);
		Exit;
	end;
end;
//-----------------------------------------------------------------------------
//  NspSepStr()	<229>
//      郵便番号辞書からの住所桁数調節
//
//-----------------------------------------------------------------------------
function TJNTCRP004002F.NspSepStr(const sSrc:String;iLen:integer;var sDst1,sDst2:string):boolean;
var
	i,iCopy:integer;
	sRet:String;
	bFlg:boolean;	//True:全角前半/False:他
begin
	sDst1:='';
	sDst2:='';

//Byte比較し分割長以下ならそのまま返す
	if MjsHanLength(sSrc)<=iLen then
	begin
		sDst1:=sSrc;
		Result:=true;
		Exit;
	end;

//文字数分Loopしﾁｪｯｸ後分割

	sRet	:='';
	bFlg	:=False;
	iCopy	:=0;

	for i:=1 to MjsHanlength(sSrc) do
	begin
		if i>iLen then
			break;

		case MjsHanByteType(sSrc,i)of
			//半角
			mbSingleByte:
			begin
				if bFlg then	//全前+半角?
				begin
					Result:=False;
					Exit;
				end;
				sRet	:=sRet+MjsHanCopy(sSrc,i,1);
				iCopy	:=iCopy+1;
			end;
			//全角前半
			mbLeadByte:
			begin
				if bFlg then	//全前+全前?
				begin
					Result:=False;
					Exit;
				end;
				bFlg:=True;
			end;
			//全角後半
			mbTrailByte:
			begin
				if not bFlg then	//(全後or半角)+全後?
				begin
					Result:=False;
					Exit;
				end;
				//2byte分まとめてCopy
				sRet	:=sRet+MjsHanCopy(sSrc,i-1,2);
				bFlg	:=False;
				iCopy	:=iCopy+2;
			end;
		end;
	end;

	//前半
	sDst1:=sRet;
	//後半(残)
	sDst2:=MjsHanCopy(sSrc,iCopy+1,MjsHanLength(sSrc)-iCopy);

	Result:=True;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP004002F.fnGetTaxName (Integer; Integer)											*/
//*																									*/
//*	目的	: 消費税簡略名称取得処理													*/
//*																									*/
//*	戻り値	: String, (消費税簡略名称)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 性格区分 (0:売上, 1:仕入)													*/
//*			  nTaxCode	= 消費税ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP004002F.fnGetTaxName (nDivision: Integer; nTaxCode: Integer): String;
var
	strTaxName: String;

begin
	strTaxName	:= '';

	if	(nDivision = 0) then													// 性格区分: 0=売上
	begin
		case (nTaxCode) of
			 0:	strTaxName	:= '科目に従う';
			10:	strTaxName	:= '課税売上(内税)';
			12:	strTaxName	:= '課税売上控除(内税)';
			13:	strTaxName	:= '課税貸倒償却(内税)';
			15:	strTaxName	:= '課税貸倒回収(内税)';
			20:	strTaxName	:= '課税売上(外税)';
			22:	strTaxName	:= '課税売上控除(外税)';
			23:	strTaxName	:= '課税貸倒償却(外税)';
			25:	strTaxName	:= '課税貸倒回収(外税)';
			30:	strTaxName	:= '非課税売上';
//			34:	strTaxName	:= '有価証券売上高(非課税)';                        // <125>MOD
			34:	strTaxName	:= '有価証券売上等(非課税)';                        // <125>MOD
			40:	strTaxName	:= '不課税売上(精算取引)';
			60:	strTaxName	:= '輸出売上';
			64:	strTaxName	:= '非課税輸出売上';
// <127> -St
{
			80:	strTaxName	:= '課税仕入対応特定収入';
			81:	strTaxName	:= '共通仕入対応特定収入';
			84:	strTaxName	:= '非課税仕入対応特定収入';
			89:	strTaxName	:= '使途不特定の特定収入';
}
// <127> -Ed
			99:	strTaxName	:= '不明';
		end;
	end
	else if	(nDivision = 1) then												// 性格区分: 1=仕入
	begin
		case (nTaxCode) of
			 0:	strTaxName	:= '科目に従う';
			10:	strTaxName	:= '課税仕入(内税)';
			11:	strTaxName	:= '共通仕入(内税)';
			12:	strTaxName	:= '課税仕入控除(内税)';
			14:	strTaxName	:= '非課税売上対応仕入(内税)';
			15:	strTaxName	:= '共通仕入控除(内税)';			//<123> ADD
			16:	strTaxName	:= '非課税売上対応仕入控除(内税)';  //<123> ADD
			20:	strTaxName	:= '課税仕入(外税)';
			21:	strTaxName	:= '共通仕入(外税)';
			22:	strTaxName	:= '課税仕入控除(外税)';
			24:	strTaxName	:= '非課税売上対応仕入(外税)';
			25:	strTaxName	:= '共通仕入控除(外税)';			//<123> ADD
			26:	strTaxName	:= '非課税売上対応仕入控除(外税)';	//<123> ADD
			30:	strTaxName	:= '非課税仕入';
			40:	strTaxName	:= '不課税仕入(精算取引)';
			50:	strTaxName	:= '棚卸調整消費税(課税)';
			51:	strTaxName	:= '棚卸調整消費税(共通)';
			54:	strTaxName	:= '棚卸調整消費税(非課税)';
			60:	strTaxName	:= '輸入仕入(外税)';
			61:	strTaxName	:= '輸入共通仕入(外税)';
			64:	strTaxName	:= '非課税売上対応輸入(外税)';
			65:	strTaxName	:= '輸入仕入(地方消費税)';
			66:	strTaxName	:= '輸入共通仕入(地方消費税)';
			69:	strTaxName	:= '非課税売上対応輸入(地方)';
			70:	strTaxName	:= '輸入仕入(内税)';
			71:	strTaxName	:= '輸入共通仕入(内税)';
			74:	strTaxName	:= '非課税売上対応輸入(内税)';
            //<126> -St            
            80:	strTaxName	:= '課税売上対応特定課税仕入';
            81:	strTaxName	:= '共通売上対応特定課税仕入';
            82:	strTaxName	:= '課税売上対応特定課税仕入控除';
            84:	strTaxName	:= '非課税売上対応特定課税仕入';
            85:	strTaxName	:= '共通売上対応特定課税仕入控除';
            86:	strTaxName	:= '非課税売上対応特定課税仕入控';
            //<126> -Ed
			99:	strTaxName	:= '不明';
		end
    end
    else if	(nDivision = 2) then												// 性格区分: 1=仕入
    begin
//<123> MOD st
//        case (nTaxCode) of
//            0:	strTaxName	:= '標準税率';
//            1:	strTaxName  := '３％';
//            2:	strTaxName	:= '５％';
//        end;
		if (m_TaxRateInfo.IsExistRateCD(nTaxCode) = True) then
			strTaxName := m_TaxRateInfo.GetTaxNameByRateCD(nTaxCode);
//<123> MOD ed
	end;

	result	:= strTaxName;
end;
//=============================================================================
//    コンポーネント（消費税系）のチェンジイベント
//=============================================================================
procedure TJNTCRP004002F.fnCompCDChange(Sender: TObject);
var
	nCode: Integer;
const
    lvBRNM : Array[0..3] of String = ('その他一般','連結子（親）会社','非連結子会社','関連会社');
begin
    if uvClearFlg = False then Exit;

	nCode	:= TMNumEdit(Sender).AsInteger;

    if sender = f1BRCD then                                 // 取引先分類
    begin
        if (f1BRCD.asInteger >= 0) and (f1BRCD.asInteger <= 3) then
        begin
            f1BRNM.caption := '';
            f1BRNM.caption := lvBRNM[f1BRCD.asInteger];
        end;
    end
    else if Sender = f1URTaxCD then                         // 売上消費税率コード
    begin
    	f1URTaxCDNM.Caption	:= fnGetTaxName (0, nCode);		// 名称ｾｯﾄ
        if	(nCode = 0) then								// 消費税ｺｰﾄﾞ=0: 科目に従う
        begin
            URLabel.Visible	  := False;
            f1URTax.Visible	  := False;
            f1URTaxNM.Visible := False;
        end
        else
        begin
            if	(m_nTaxInfoAccDivision <> 0) then
            begin
                URLabel.Visible	  := True;
                f1URTax.Visible	  := True;
                f1URTaxNM.Visible := True;
            end;
        end

    end
    else if Sender = f1URTax then                           // 売上消費税率
    begin
        f1URTaxNM.Caption  := fnGetTaxName (2, nCode);	    // 名称ｾｯﾄ
    end
    else if Sender = f1SITaxCD then                         // 仕入消費コード
    begin
    	f1SITaxCDNM.Caption	:= fnGetTaxName (1, nCode);		// 名称ｾｯﾄ
        if	(nCode = 0) then								// 消費税ｺｰﾄﾞ=0: 科目に従う
        begin
            SILabel.Visible  	:= False;
            f1SITax.Visible	    := False;
            f1SITaxNM.Visible	:= False;
        end
        else
        begin
            if	(m_nTaxInfoAccDivision <> 0) then
            begin
                SILabel.Visible  	:= True;
                f1SITax.Visible	    := True;
                f1SITaxNM.Visible	:= True;
            end;
        end;

    end
    else if Sender = f1SITax then                           // 仕入消費税率
    begin
        f1SITaxNM.Caption  := fnGetTaxName (2, nCode);	    // 名称ｾｯﾄ
    end
    // <118> ↓
    else if sender = f1RISKKBN then                            // ﾘｽｸ区分
    begin
        if (f1RISKKBN.asInteger >= 0) and (f1RISKKBN.asInteger <= 2) then
        begin
            if f1RISKKBN.Visible then
            begin
                f1RISKKBNNM.caption := '';
                f1RISKKBNNM.caption := MjsHanCopy(f1RISKKBN.SelectItems.Strings[f1RISKKBN.AsInteger], 4, 16);
            end;
        end;
    end;


    m_EdtSw := True;                        // <111>変更ﾌﾗｸﾞON

end;
//-----------------------------------------------------------------------------
//     コード属性・桁数を考慮した表示用コードを生成する
//
// 引数
//     sCode   変換前コード
//
// 戻り値
//     変換後コード
//
//-----------------------------------------------------------------------------
function TJNTCRP004002F.fnGetDspData(sCode: String): String;
var
    lvPara: Double;
    lvStr:  String;
    iType,      // コード属性（1:ﾌﾘｰ、2:数値[前ゼロあり])
    iLen        // コード桁数
    :   Integer;
    lvDigit : Integer;
begin
    Result := '';

    lvDigit := 16;

    try
        //文字属性なら
        if uvAttr = 2 then
        begin
            if Length(sCode) > lvDigit then
                Result := Copy(sCode, 1, lvDigit)
            else
                Result := sCode;

            Exit;
        end;

        //数値属性なら
        if (uvAttr = 0) or (uvAttr = 1) then
        begin
            lvPara := JNTSelXStrToFloat(sCode);
            lvStr  := FormatFloat('#', lvPara);

            //前ゼロをつける
            lvStr := JNTSelXLeftAddCh(lvStr, lvDigit, '0');

            Result := lvStr;
            Exit;
        end;

    except
    end;

end;
//-----------------------------------------------------------------------------
//  内部コード取得
//-----------------------------------------------------------------------------
Function TJNTCRP004002f.fnGetNCODE(pCODE:Integer):Extended;
var
    Qry :TMQuery;
begin

    Result := 0;

    Qry := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);


    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            SQL.Add('select NCODE from SKmkMA ');
            SQL.Add('where  MasterKbn = 3 AND RdelKbn = 0 AND SumKbn = 0');
            SQL.Add('       AND GCODE =:GCODE');
            SetFld('GCode').AsInteger := pCODE;
            Open;						// ｸｴﾘの開始

            if EOF = False then
                Result := FieldByName('NCODE').asFloat;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  外部コード取得
//-----------------------------------------------------------------------------
Function TJNTCRP004002f.fnGetGCODE(pCODE:Extended):Integer;
var
    Qry :TMQuery;
begin

    Result := 0;


    Qry := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            SQL.Add   ('SELECT GCODE FROM SKmkMA  ');
            SQL.Add   ('WHERE  MasterKbn = 3 AND NCode = :pCode');
			ParamByName ('pCode').AsFloat  := pCODE;
            Open;						// ｸｴﾘの開始

            if EOF = False then
                Result := FieldByName('GCODE').asInteger;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  取引先コードのチェック
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// fnChkTRCODE()
//      RETURN  : Integer         0:正常終了,
//                               -1:存在しない。
//                              ※↓以下はグループ会計の子社のみ返る可能性がある値。
//                              -98:親に存在(同期ｷｬﾝｾﾙ),
//                              -99:異常終了
//      MEMO    : 取引先コードのチェック
//-----------------------------------------------------------------------------
//Function TJNTCRP004002f.fnChkTRCODE:Boolean;
Function TJNTCRP004002f.fnChkTRCODE: Integer;
var
    Qry :TMQuery;
//↓<Rel>
	PQe     : TMQuery;                                      // 全社DB用ｸｴﾘ
	Qe      : TMQuery;                                      // 子社DB用ｸｴﾘ
	strNmk  : string;
	nPNCode : Extended;
//↑<Rel>
begin

// <Rel>    Result := False;
    Result := 0;
    fNAME.text := '';

//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
	begin
        // 親会社用ｸｴﾘの作成
		PQe := TMQuery.Create(Self);
		MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, PQe);

        // 子会社用ｸｴﾘの作成
		Qe  := TMQuery.Create(Self);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

		try
			// 子社DBにあるか？
			Qe.Close;
			Qe.SQL.Clear;
			Qe.SQL.Add('select NCODE from MTOKUI '
				+   ' where (GCODE = :pCODE) and (RDelKbn = 0)');

            if f0CODE.text = '' then
                Qe.ParamByName('pCODE').asString := ''
            else
                Qe.ParamByName('pCODE').asString := fnGetDspData(f0CODE.text);

			if not Qe.Open then
			begin
				Result := -99;
				Exit;
			end;

			if Qe.EOF then
			begin
				// 子社DBに存在しないときは全社DBにあるか？
				PQe.Close;
				PQe.SQL.Clear;
				PQe.SQL.Add('select NCODE,NMK from MTOKUI '
					+   ' where (GCODE = :pCODE) and (RDelKbn = 0)');

                if f0CODE.text = '' then
                    PQe.ParamByName('pCODE').asString := ''
                else
                    PQe.ParamByName('pCODE').asString := fnGetDspData(f0CODE.text);


				if not PQe.Open then
				begin
					Result := -99;
					Exit;
				end;

				if not PQe.EOF then
				begin
                    // 親に存在した。
					strNmk  := PQe.FieldByName('NMK').AsString;
					nPNCode := PQe.FieldByName('NCODE').AsFloat;

			        if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC + #13#10#13#10
			                           + strNmk,
			                             '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
			        begin
                        // 同期確認ﾀﾞｲｱﾛｸﾞの結果→「同期する」論理

			            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            MDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
			            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            MDataModule.BeginTran( dbCorp_Select );

				        try
                            if not fnMTOKUI_Sync(m_SyncMaster,nPNCode,PQe) then
                            begin
                                MjsMessageBoxEx (Self,
                                                     '自社への関連付けに失敗しました。',
                                                     'マスタ同期', mjError, mjOk, mjDefOk);
                                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                MDataModule.Rollback( dbCorp_Select );
				                Result := -99;
				                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,nPNCode,PQe) then
                            begin
                                Result := -99;
                                Exit;
                            end;

			            except
			                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                MDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
			                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                MDataModule.Rollback( dbCorp_Select );
			                Result := -99;
			                Exit;
			            end;

			            // 親会社DBに対してｺﾐｯﾄを実行する
			            MDataModule.Commit( m_SyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してｺﾐｯﾄを実行する
	                    MDataModule.Commit( dbCorp_Select );
					end
                    else
                    begin
                        // 同期確認ﾀﾞｲｱﾛｸﾞの結果→「同期ｷｬﾝｾﾙ」論理
						Result := -98;
		                Exit;
                    end;
				end;
			end;
		finally
			PQe.Close;
			PQe.Free;
			Qe.Close;
			Qe.Free;
		end;
	end;
//↑<Rel>


    Qry := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							                                // ｸｴﾘの初期化
            Sql.Add('Select NCODE,NM from MTOKUI '+
                    ' Where (GCODE = :pCODE) and (RDelKbn <> 1)');
            if f0CODE.text = '' then
                ParamByName('pCODE').asString := ''
            else
                ParamByName('pCODE').asString := fnGetDspData(f0CODE.text);
            Open;						                                        // ｸｴﾘの開始

            if EOF = False then
            begin
//                Result := True;                                               // <Rel>
                Result := 0;                                                    // <Rel>
                fNAME.text  := FieldByName('NM').asString;
                uvNCODE     := FieldByName('NCODE').asFloat;
            end
            else
//                Result := False;                                              // <Rel>
                Result := -1;                                                   // <Rel>
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  編集をキャンセルする
//-----------------------------------------------------------------------------
function TJNTCRP004002f.fnCancel: Boolean;
begin

    Result := False;
    //編集結果を確認する
{    if uvEdtSw then
    begin
    	//<29>
//		if uvSelSys.MsgDlg(1010,100) = mrNo then    //<47>
		if uvSelSys.MsgDlg(1010,103) = mrNo then    //<47>
        begin
            Result := True;
            MjsSetFocus(Self, 'BCancel_Sousa');             //<47>
            Exit;
        end;
    end;
}

//    f0CODE         .InputFlag := True;  //<122>
//    f0CODE         .Zero := False;      //<122>

    fnCompClear;
    fnCompEnabled(False);

    MjsSetFocus(Self, 'f0CODE');


end;
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TMas220100f.fnGetNameSimple (Integer)													*/
//*																									*/
//*	目的	: 補助登録処理 資金繰科目簡略名称取得処理												*/
//*																									*/
//*	戻り値	: String, (資金繰科目簡略名称)										                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 資金繰科目外部ｺｰﾄﾞ 														*/
//*                                                                                                 */
//***************************************************************************************************/
function   TJNTCRP004002f.fnGetNameSimple (nExCode: Integer): String;
var
	dqMasterData : TMQuery;
	strNameSimple: String;

begin


	dqMasterData    := TMQuery.Create (Application);

    MDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);					// DBとMQueryの接続

	strNameSimple	:= '';

	if	(nExCode = 0) then
	begin
		Result	:= '科目に従う';

		dqMasterData.Free ();
		Exit;
	end;

    with (dqMasterData) do
    begin
    	Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SimpleName FROM SKmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 3 AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :nExCode');

		ParamByName ('nExCode').AsInteger	:= nExCode;

		Open ();

		if  (not EOF) then
			strNameSimple	:= FIeldByName ('SimpleName').AsString
		else
			strNameSimple	:= '';

		Close ();
	end;

	dqMasterData.Free ();

	Result	:= strNameSimple;
end;
//-----------------------------------------------------------------------------
//  資金繰り名称のセット
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.SKCDChange(Sender: TObject);
begin

	TMLabel(MJSFindCtrl(Self, Copy(TmNumEdit(Sender).Name,1,8) + 'NM')).Caption
        	:= fnGetNameSimple (TmNumEdit(Sender).AsInteger);

    m_EdtSw := True;                        // <111>変更ﾌﾗｸﾞON
    
end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004002F.ArrowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    CompName:   String;         //
    i : Integer;
begin

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pMyAppRecord;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;

    if Sender = f0CODE then   //得意先
    begin
        lvExpSend.MasterKbn     :=  22;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TBarNM        :=  LabTRNM.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
        lvExpSend.TableName     :=  'MTOKUI';           //
        lvExpSend.TrRootCaption :=  LabTRNM.Caption;
        lvExpSend.WhereStr      :=  ' RDelKBN = 0 '
                                    + ' and TemplateKbn = 0';          // <104>
    end
    else if (Sender = f1T_KRSKCD)
            or (Sender = f1T_KSSKCD)
            or (Sender = f1S_KRSKCD)
            or (Sender = f1S_KSSKCD) then   //資金繰り
    begin
        lvExpSend.MasterKbn     :=  3;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TBarNM        :=  '資金繰検索ｴｸｽﾌﾟﾛｰﾗ'; //
        lvExpSend.TableName     :=  'SkmkMA';           //
        lvExpSend.TrRootCaption :=  '資金繰';
    	lvExpSend.WhereStr   	:= 'MasterKbn = 3 AND RdelKbn = 0 AND SumKbn = 0';			// Where句の条件
    end;

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin

        if Sender is TMNumEdit then
        begin
           TMNumEdit(MJSFindCtrl(Self,CompName )).value := StrToFloat(lvExpRecv.GCode);
        	TMLabel(MJSFindCtrl(Self, Copy(TmNumEdit(Sender).Name,1,8) + 'NM')).Caption := lvExpRecv.NMK;
        end
        else if Sender is TMTxtEdit then
        begin
           TMTxtEdit(MJSFindCtrl(Self,CompName )).Text := lvExpRecv.GCode;
        end;

        //<122> --- St ---
        if Sender = f0CODE then
            f0CODE.InputFlag := False;
        //<122> --- Ed ---

        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
		abort;
    end;

end;

//-----------------------------------------------------------------------------
// BChangeClick()   <107>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004002F.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    lvRect  : TRect;
    lvWidth,
    lvHeight: Integer;
begin

    // ここでActiveControlをｾｯﾄする。
    m_ACControl :=  Screen.ActiveControl;

    m_bBtnChange := FALSE;

    if ( B_Change.Caption = '埋込(&G)' ) then
    begin
        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGINEND;         // 格納通知
        B_Change.Caption    := '切出(&G)';                  // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible             :=	FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect              :=  Self.ClientRect;
        lvWidth             :=  lvRect.Right - lvRect.Left;
        lvHeight            :=  lvRect.Bottom - lvRect.Top;

        ClientWidth         :=  lvWidth;
        ClientHeight        :=  lvHeight;
		Visible		        :=	TRUE;

        // 親画面への設定
        wkParam.iAction     :=  ACTID_DOCKINGOUTEND;        // 取出通知
        B_Change.Caption    :=  '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=  Pointer(m_Base_pRec);       // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=  nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := TRUE;

end;

// <111>
//**************************************************************************
//	Component	:	入力ﾌｨｰﾙﾄﾞ
//		    			入力ｺﾝﾄﾛｰﾙ共通Changeｲﾍﾞﾝﾄ
//	Event		:	OnChange
//	Name		:	unknown
//**************************************************************************
procedure TJNTCRP004002F.evtOnChange(Sender: TObject);
begin
    if not m_EdtSw then

        m_EdtSw := True;                    // 変更ﾌﾗｸﾞON

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<117>
//	Name		:	T.Seki
//	Date		:	2008/01/29
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004002F.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//  SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//		SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
		SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
// Delphi10 ED
	end;
end;
//**********************************************************************
//	Proccess	:	ﾘｽｸ区分の可視制御<118>
//	Parameter	:	Bol true=可視 false=不可視
//	Return		:	なし
//**********************************************************************
procedure TJNTCRP004002F.fnRiskSet;
var
    Qry :TMQuery;
    VisiBol: Boolean;
begin

    Qry := TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);


    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            SQL.Add('select GnPuKbn1, GnPuKbn4 from CurrencyInfo ');
            SQL.Add('where  InfoKbn = 1 ');
            Open;

            if EOF = False then
            begin
                if FieldByName('GnPuKbn1').AsInteger = 1 then
                    VisiBol := True
                else
                    VisiBol := False;
            end
            else
                VisiBol := False;

            f1RISKKBN.SelectItems.Clear;
            if VisiBol then
            begin
                if FieldByName('GnPuKbn4').AsInteger = 0 then
                    f1RISKKBN.SelectItems.Add('0: 標準(自社リスク)')
                else if FieldByName('GnPuKbn4').AsInteger = 1 then
                    f1RISKKBN.SelectItems.Add('0: 標準(他社リスク)')
                else if FieldByName('GnPuKbn4').AsInteger = 2 then
                    f1RISKKBN.SelectItems.Add('0: 標準(為替予約)');
                f1RISKKBN.SelectItems.Add('1: 自社リスク');
                f1RISKKBN.SelectItems.Add('2: 他社リスク');
            end;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

    LblKawase.Visible   := VisiBol; // 外国為替管理情報のﾗﾍﾞﾙ
    LblRiskKbn.Visible  := VisiBol; // ﾘｽｸ区分のﾗﾍﾞﾙ
    f1RISKKBN.Visible   := VisiBol; // ﾘｽｸ区分
    f1RISKKBNNM.Visible := VisiBol; // ﾘｽｸ区分名


end;

//**********************************************************************
//	Proccess	:	仕入消費税ｺｰﾄﾞｺﾝﾄﾛｰﾙのSelectItems用Textを取得<123>
//	Parameter	:	Integer		0=売上・仕入指定なし 1=売上 2=仕入
//	Return		:	String		SelectItems用Text
//**********************************************************************
function TJNTCRP004002F.GetTextOfTaxCDsAndTaxCDNames(aTaxKbn: Integer): String;
var
    oQuery 		: TMQuery;
    oStrList	: TStringList;
begin
    Result	:= '';

    // 引数検査
    if not (aTaxKbn IN [0..2]) then
    	Exit;

    // 初期化
    oQuery		:= TMQuery.Create (Self);
    MDataModule.SetDBInfoToQuery(dbCorp_Select, oQuery);
    oStrList	:= TStringList.Create();

    // TaxCodeMAに無い消費税CDを設定する
    oStrList.Add(' 0: 科目に従う');
    try
        with oQuery do
        begin
            // TaxCodeMA
            Close;
            SQL.Clear;
            SQL.Add('SELECT TaxCode, DispName1');
            SQL.Add('FROM TaxCodeMA');
            SQL.Add('WHERE TaxKbn = ' + IntToStr(aTaxKbn));
            SQL.Add('ORDER BY TaxCode');
            Open(True);

            while EOF = False do
            begin
            	if (GetFld('TaxCode').AsInteger = 99) then	// 消費税CD=99の名称はDB上の名称は使用しない。
	                oStrList.Add(GetFld('TaxCode').AsString + ': 不明')
                else
	                oStrList.Add(GetFld('TaxCode').AsString + ': ' + GetFld('DispName1').AsString);
                Next;
            end;
        end;

        Result := oStrList.Text;
    finally
        if Assigned(oQuery) then
        	oQuery.Free;
        if Assigned(oStrList) then
        	oStrList.Free;
    end;
end;

//**********************************************************************
//	Proccess	:	SDTの会社コードと簡略名称を取得<128>
//**********************************************************************
procedure TJNTCRP004002F.SDT_Save;
var
	SQLSDT				:	TMQuery;
	iCnt				:	Integer;
begin
    SQLSDT := TMQuery.Create(Self);					 // MQueryの構築
	MDataModule.SetDBInfoToQuery(m_dbMjsCmn, SQLSDT);	// DBとMQueryの接続

	m_strSDT := nil;
	iCnt := 0;

    try
    	with SQLSDT do
        begin
            Close;
    	    SQL.Clear;
	    	SQL.ADD('SELECT ');
		    SQL.ADD('DTCD,SubDTName ');
    		SQL.ADD('FROM	SDT_DCTL ');
	    	SQL.ADD('WHERE	OptCD = 0 AND SysCD = 1 ');
		    SQL.ADD('ORDER BY DTCD');

    		if Open = False then
	    	begin
	            //ErrorMessageDsp(SQLSDT);
	    	    Close;
    	    	Free;
                EXIT;
            end;

            While EOF <> True do
            begin
	    		Setlength(m_strSDT,High(m_strSDT)+2);
		    	m_strSDT[iCnt].iDataCode	:= GETFLD('DTCD').AsInteger;
			    m_strSDT[iCnt].sSubName 	:= GETFLD('SubDTName').AsString;
	    		iCnt := iCnt + 1;
              NEXT;
            end;
        end;

    finally
        SQLSDT.Close;
        SQLSDT.Free;
    end;
end;

//**********************************************************************
//	Proccess	:	グループ会社に登録があるか確認<128>
//	Parameter	:	Integer	グループ会社コード
//	Return		:	Boolean		採用　不採用
//**********************************************************************
function TJNTCRP004002F.GrpCodeFlag(iGrpCode: Integer):Boolean;
var

    GrpFlgQry : TMQuery;
    bGrpFlag :  Boolean;
begin
    bGrpFlag := False;

    GrpFlgQry := TMQuery.Create(Self);					 // MQueryの構築
    MDataModule.SetDBInfoToQuery(m_dbMasCmn, GrpFlgQry);

    try
        with GrpFlgQry do
        begin
            SQL.Clear;
            SQL.Add('select GrpComCode from GCComInfo ');
            SQL.Add('where GrpCode = 1 and GrpComCode = '+Inttostr(iGrpCode));

            if Open = False then
    		begin
    			Result   := bGrpFlag;
	        	Close;
	        	Free;
                EXIT;
            end;

            if Eof <> True then
            begin
        	    bGrpFlag := True;
            end;
        end;

    Result   := bGrpFlag;

    finally
        GrpFlgQry.Close;
        GrpFlgQry.Free;
    end;
end;

//**********************************************************************
//	Proccess	:	入力グループ会社コードからSDTの簡略名取得<128>
//	Parameter	:	Integer	グループ会社コード；string 会社簡略名称
//	Return		:	Boolean		採用　不採用
//**********************************************************************
Function TJNTCRP004002F.GrpNameGet(iGrpCode:Integer; var sKName : string):Boolean;
var
    iLoop		:	Integer;
    iMaxCnt		:	Integer;
    bSDTFlag		:	Boolean;
    iGrupCode		:	Integer;
begin
	iGrupCode := iGrpCode;
	bSDTFlag	:= False;
	iMaxCnt := High(m_strSDT);
    sKName := '';

    for iLoop := 0 to iMaxCnt do
    begin
		if 	(m_strSDT[iLoop].iDataCode = iGrupCode) then
		begin
            sKName := m_strSDT[iLoop].sSubName;
            bSDTFlag := True;
            break;
		end;
    end;

    Result := bSDTFlag;
end;

//**********************************************************************
//	Proccess	:	グループ会社の採用有無<128>
//	Return		:	Boolean		採用　不採用
//**********************************************************************
function TJNTCRP004002F.GCBaseFlagGet:Boolean;
var

    GCBaseFlgQry : TMQuery;
    bGCBaseFlag :  Boolean;
begin
    bGCBaseFlag := False;

    GCBaseFlgQry := TMQuery.Create(Self);					 // MQueryの構築
    MDataModule.SetDBInfoToQuery(m_dbMasCmn, GCBaseFlgQry);//MASkCmn

    try
        with GCBaseFlgQry do
        begin
            SQL.Clear;
            SQL.Add('select * from GCBaseInfo ');
            SQL.Add('where Kbn1 = 1 and InfoKbn = 1');

            if Open = False then
	    	begin
	    		Result   := bGCBaseFlag;
	        	Close;
	    	    Free;
                EXIT;
            end;

            if Eof <> True then
            begin
            	bGCBaseFlag := True;
            end;
        end;

    Result   := bGCBaseFlag;

    finally
        GCBaseFlgQry.Close;
        GCBaseFlgQry.Free;
    end;
end;

//**********************************************************************
//	Proccess	:	グループ会社検索EXP<128>
//**********************************************************************
procedure TJNTCRP004002F.f1GurpCodeArrowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    CompName:   String;         //
begin

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pMyAppRecord;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @dbCorp_Select;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  ComArea.SystemArea.SysColorD;


    lvExpSend.MasterKbn     :=  9270;         //マスタ区分＝
    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
    lvExpSend.TBarNM        :=  '会社検索ｴｸｽﾌﾟﾛｰﾗ'; //
    lvExpSend.TableName     :=  'SDT_DCTL';           //
    lvExpSend.TrRootCaption :=  '会社';
    lvExpSend.WhereStr      :=  ' SysCD = 1 and  OptCD = 0';


    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        f1GurpCode.value := StrToInt(lvExpRecv.GCode);
        f1KName.text := lvExpRecv.NMK;

        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
		abort;
    end;
end;

end.
