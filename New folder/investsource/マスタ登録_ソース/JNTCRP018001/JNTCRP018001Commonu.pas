//*****************************************************************************************************
//*
//*		Systeme			:   ＦＸ共通マスター
//*		Program			:   工事/プロジェクト登録
//*		ProgramID		:	JNTCRP018001Commonu.pas
//*		Name			:	小川 哲央(LEAD)
//*		Create			:
//*		Comment			:	各ユニットから共通で使用する定数やクラスを定義する。
//*						:	修正履歴は「JNTCRP018001u.pas」に記載
//*****************************************************************************************************
unit JNTCRP018001Commonu;

interface
uses
    // Delphi標準
    Windows, Messages, SysUtils, Classes, VCL.Controls, Db, FireDAC.Comp.Client, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
    Contnrs,VCL.Graphics,
    // MJS関連
    MJSQuery, MLBplLoaderU, MjsDBModuleu, MJSMsgStdu, MjsStrCtrl, MjsDispCtrl,

    // JNT関連
    JNTCommonU, JNTMasMonth, JNTMasComu, JNTSelGlobal, JNTFuncU;
//  {$include JNTConst.inc}

const
    m_ArrayBool : array [boolean] of string=('False','True');

	// ﾍﾟｰｼﾞﾃﾞﾌｧｲﾝ
	PAGE_JITUZAI	= 0;    // 実在ﾀﾌﾞ
	PAGE_GOKEI		= 1;    // 合計ﾀﾌﾞ
	PAGE_KASAN		= 2;    //<KSN> ADD

	PAGE_KIHON		= 0;    // 基本情報ﾀﾌﾞ
	PAGE_KOJI		= 1;    // 工事ﾀﾌﾞ
	PAGE_KFURI		= 2;    // 工事完成振替ﾀﾌﾞ
// <211> MOD start
{
	PAGE_NYUKIN		= 3;    // 契約・入金情報ﾀﾌﾞ
// <205> MOD start
//	PAGE_SONOTA		= 4;    // その他ﾀﾌﾞ
	PAGE_BIKOU		= 4;    // 備考・概要ﾀﾌﾞ
   	PAGE_SONOTA		= 5;    // その他ﾀﾌﾞ
}
// <205> MOD end
    PAGE_KEIYAKU	= 3;    // 契約情報ﾀﾌﾞ
	PAGE_NYUKIN		= 4;    // 入金情報ﾀﾌﾞ
    PAGE_SEIKYU		= 5;	// 請求・入金予定ﾀﾌﾞ <SEI> ADD
//<SEI> MOD St
{
	PAGE_BIKOU		= 5;    // 備考・概要ﾀﾌﾞ
   	PAGE_SONOTA		= 6;    // その他ﾀﾌﾞ
}
	PAGE_BIKOU		= 6;    // 備考・概要ﾀﾌﾞ
   	PAGE_SONOTA		= 7;    // その他ﾀﾌﾞ

	// 合計ﾀﾌﾞは契約情報～のﾀﾌﾞindexが違う
    // 合計ﾀﾌﾞのindex
    PAGE_GOUKEI_KEIYAKU	= 2;// 契約情報ﾀﾌﾞ
    PAGE_GOUKEI_NYUKIN = 3;	// 入金情報ﾀﾌﾞ
    PAGE_GOUKEI_SEIKYU = 4;	// 請求・入金予定ﾀﾌﾞ
    PAGE_GOUKEI_BIKOU  = 5;	// 概要・備考ﾀﾌﾞ
//<SEI> MOD Ed
// <211> MOD end

	// ｶﾗﾑﾃﾞﾌｧｲﾝ
	COL_FUSEN		= 0;    // 付箋
	COL_GCODE		= 1;    // 外部ｺｰﾄﾞ
	COL_REN			= 2;    // 連想
	COL_L_NAME		= 3;    // 正式名称
	COL_S_NAME		= 4;    // 簡略名称

// <212> MOD start
{
	COL_KEINEN		= 0;    // 契約年月日
	COL_KEINO		= 1;    // 契約書No
	COL_KEIKIN		= 2;    // 契約金額
	COL_ZEIRITU		= 3;    // 税率
	COL_ZEIRITUNAME	= 4;    // 税率(名称)
	COL_ZEIGAKU		= 5;    // 消費税額

	COL_YOTEIBI		= 0;    // 入金予定日
	COL_YOTEIGAKU	= 1;    // 入金予定額
}
	COL_KEINEN		= 0;    // 契約年月日
	COL_KEINO		= 1;    // 契約書No
	COL_KEIKIN		= 2;    // 契約金額
	COL_ZEIRITU		= 3;    // 税率
	COL_ZEIRITUNAME	= 4;    // 税率(名称)
	COL_ZEIRITUNAME2 = 5;   // 税率表記名  <TAX> ADD
	COL_ZEIGAKU		= 6;    // 消費税額
	COL_COSTCODE	= 7;    // 取引先コード
	COL_COSTNAME	= 8;    // 取引先名称

	COL_YOTEIBI		= 0;    // 入金予定日
	COL_YOTEIGAKU	= 1;    // 入金予定額
	COL_NCOSTCODE	= 2;    // 取引先コード
	COL_NCOSTNAME	= 3;    // 取引先名称

// <212> MOD end
// <SEI> ADD start
	// 請求情報ｸﾞﾘｯﾄﾞのｶﾗﾑﾃﾞﾌｧｲﾝ
	COL_SEIKYU_NO				= 0;	// NO
	COL_SEIKYU_SEIKYUYOTEIBI	= 1;	// 請求予定日
	COL_SEIKYU_SEIKYUMEIMOKU	= 2;	// 請求名目
	COL_SEIKYU_SEIKYUSAKICODE	= 3;	// 請求先コード
	COL_SEIKYU_SEIKYUSAKINAME	= 4;	// 請求先名称
	COL_SEIKYU_SEIKYUGAKU		= 5;	// 請求額
	COL_SEIKYU_ZEIRITU			= 6;	// 税率
	COL_SEIKYU_ZEIRIUNAME 		= 7;	// 税率(名称)
	COL_SEIKYU_ZEIGAKU 			= 8;	// 消費税額
	COL_SEIKYU_SEIKYUHAKKOUBI	= 9;	// 請求書発行年月日
	COL_SEIKYU_SEIKYUBI			= 10;	// 請求日
	COL_SEIKYU_NYUKINYOTEIBI	= 11;	// 入金予定日
// <SEI> ADD end
	// ﾌｾﾝﾃﾞﾌｧｲﾝ
	RED				= 1;    // 付箋(赤)
	GREEN			= 2;    // 付箋(緑)
	BLUE			= 3;    // 付箋(青)
	ORANGE			= 4;    // 付箋(橙)
	NOCOLOR			= 99;   // 付箋(灰)
//<TAX> ADD St
    FONTCOLOR_WINDOWTEXT    = 0;
    FONTCOLOR_RED           = 1;
    FONTCOLOR_BLUE          = 2;
    FONTCOLOR_WINDOWTEXT2   = 99;
//<TAX> ADD Ed
	// ﾂﾘｰｱｲｺﾝﾃﾞﾌｧｲﾝ
	IC_JCLOSE		= 0;    // 実在Close
	IC_JOPEN		= 1;    // 実在Open
	IC_GMCLOSE		= 2;    // 合計Close
	IC_GMOPEN		= 3;    // 合計Open

	// 印刷用
    (*
	JITUZAIKANI		= 1;	// 実在簡略
	JITUZAISHOSAI	= 2;	// 実在詳細
	GOUKEIKANI		= 3;    // 合計簡略
	GOUKEISHOSAI	= 4;    // 合計詳細
    *) // <PRN2>
    // <142>↓
    (*
	JITUZAIKANI		= 2;	// 実在簡略(２次ではなし)
	JITUZAISHOSAI	= 0;	// 実在詳細
	GOUKEIKANI		= 3;    // 合計簡略(２次ではなし)
	GOUKEISHOSAI	= 1;    // 合計詳細
    *) // <PRN2>
    // <158> - ST
    (*
	JITUZAIKANI		= 0;	// 実在簡略
	JITUZAISHOSAI	= 1;	// 実在詳細
	GOUKEIKANI		= 2;    // 合計簡略
	GOUKEISHOSAI	= 3;    // 合計詳細
    *)
// <212> MOD start
{
	JITUZAIKANI		= 0;	// 実在簡略
	JITUZAISHOSAI	= 1;	// 実在詳細
	JITUZAIBUNRUI	= 2;	// 実在分類
	GOUKEIKANI		= 3;    // 合計簡略
	GOUKEISHOSAI	= 4;    // 合計詳細
}
	JITUZAIKANI		    = 0;	// 実在簡略
	JITUZAISHOSAI	    = 1;	// 実在詳細
	JITUZAIKEIYAKU	    = 2;	// 実在契約情報
	JITUZAIKEIYAKUDTL	= 3;	// 実在契約情報詳細*
	JITUZAINYUUKIN     	= 4;	// 実在入金情報*
	JITUZAIBUNRUI	    = 5;	// 実在分類
	GOUKEIKANI		    = 6;    // 合計簡略
	GOUKEISHOSAI	    = 7;    // 合計詳細
	GOUKEIKEIYAKU	    = 8;    // 合計契約情報
	GOUKEIKEIYAKUDTL    = 9;	// 合計契約情報詳細*
	GOUKEINYUUKIN     	= 10;	// 合計入金情報*
	KASANTOROKU			= 11;	// 加算登録 <263> ADD
// <212> MOD end
    // <158> - ED
    // <142>↑

	CODEORDER		= 0;    // ｺｰﾄﾞ順
	RENSOUORDER		= 1;    // 連想順

	NORMAL			= 1;    // 権限管理 通常処理ﾓｰﾄﾞ
	BASICONLY		= 2;    // 権限管理 基本のみ設定可能(詳細ﾎﾞﾀﾝ使用不可)
	REFER			= 3;    // 権限管理 参照ﾓｰﾄﾞ

    // <155> - ST
    // <WF>申請書の仕訳入力形式
    SWKFORM_KOJI    = 4001; // 工事登録申請書
    SWKFORM_PRJ     = 4002; // ﾌﾟﾛｼﾞｪｸﾄ登録申請書
    // <WF>取込時のｴﾗｰﾒｯｾｰｼﾞ
    MSG_WF_INPUTERR = '申請書情報に誤りがある為登録できません。';
	// W/Fに渡すﾏｽﾀ区分
	WF_MKBN_PROJECT	= 201;	// ﾌﾟﾛｼﾞｪｸﾄ
	WF_MKBN_KOJI	= 202;	// 工事
	// W/Fの戻りの内部ｺｰﾄﾞから外部、名称を取得時に使用
	KBN_TANTOSYA	= 0;
	KBN_JUTYUSAKI	= 1;
	KBN_BMN			= 2;

	DEF_S_DATE      = 2;		// 1900/01/01
	DEF_E_DATE      = 73050;	// 2099/12/31
    // <158> - ED

    // <208> ADD start
	WF_MKBN_KOJIOP	= 203;	// 工事（建設工事業OP申請書）
	KBN_SESHU		= 3;
    // <208> ADD end

    // <172> - ST
    STATE_NONE      = 0;
    STATE_INSERT    = 1;
    STATE_EDIT      = 2;
    // <172> - ED

    OPE_SEC         = 1;        // <184>使用区分(ｾｷｭﾘﾃｨ)
    OPE_GROUP       = 2;        // <184>使用区分(ｸﾞﾙｰﾌﾟ管理)
    DISP_ON         = 1;        // <184>表示区分(表示)
    DISP_OFF        = 2;        // <184>表示区分(非表示)

// <SEI> ADD start
	// 実在/合計区分
    SUMKBN_JITUZAI	= 0;		// 実在
    SUMKBN_GOUKEI	= 1;		// 合計

	// ﾌｧﾝｸｼｮﾝの定義
    FUNC_DEL_OUTPUTDATE		= 2;
    FUNC_DELSEIKYU			= 4;

	FUNC_CAP_DEL_OUTPUTDATE	= 'F3 発行日削除';
	FUNC_CAP_DELSEIKYU 		= 'F5 削除';

    // ﾒｯｾｰｼﾞ
    MSG_DELETE_SEIKYU		= '該当請求予定情報を削除しますか？';
    MSG_DELETE_SEIKYUOUTPUTDATE	= '請求書発行年月日を削除しますか？';
    MSG_DELETE_SEIKYUOUTPUTDATE_ALERT	= '削除後に登録し直すことはできませんがよろしいですか？';

	// 関数の引数
    OPT_KOUJI_IKKATUSEIKYU	= 1;			// 一括請求先工事用
    // 個別採用のRecKbn
    RECKBN_SEIKYU = 19;
// <SEI> ADD end
// <291> MOD st 
// 収益認識基準対応。「原価回収基準」を追加
//	sSales	    : array[0..1] of String = ('工事完成基準',
//                                           '工事進行基準');
	sSales	    : array[0..2] of String = ('工事完成基準',
                                           '工事進行基準',
                                           '原価回収基準');
// <291> MOD ed
	sHaifu	    : array[0..1] of String = ('配賦対象',
                                           '配賦対象外');
	sRoot	    : array[0..1] of String = ('通常',
                                           '名寄せ親');
	sBun	    : array[0..2] of String = ('入力可',
                                           '原価科目は不可',
                                           '入力不可');
	sMove	    : array[0..1] of String = ('する',
                                           'しない');
//<TAX> DEL St
{
	sTax	    : array[0..4] of String = ('標準税率',
										   '3%',
										   '5%',
										   '不課税',	// <201>
										   '非課税');
}                                           
//<TAX> DEL Ed
	sDetail1	: array[0..4] of String = ('完成振替コードA',
                                           '完成振替コードB',
                                           '完成振替コードC',
                                           '完成振替コードD',
                                           '完成振替コードE');
// <211> ADD start
    sKojKbn2    : array[0..1] of String = ('あり',
                                           'なし');
// <211> ADD end

// <205> ADD start
	sUkeoi	    : array[0..1] of String = ('元請',
                                           '下請');
    PM_PMKEINYUKIN  = '契約・入金情報';
    LBL_PMKEINYUKIN = '契約情報';
    PM_JYUNYUKIN    = '受注・入金情報';
    LBL_JYUNYUKIN   = '受注情報';
// <205> ADD end

// <203> ADD start
	C_ST_PROCESS		= 0;					// 設定
	C_ED_PROCESS		= 1;					// 開放
// <203> ADD end

// <235> ADD start
	MSG_KEIYAKU  	    = '契約月が変更されています。変更前の月と、変更後の月で、'#13#10 +
// <291> MOD st
//                          'マスタ更新を行い、工事完成自動仕訳を再度実行する必要があります。'#13#10#13#10 +
                          'マスター更新を行い、工事完成自動仕訳を再度実行する必要があります。'#13#10#13#10 +
// <291> MOD ed
                          '契約日を変更してもよろしいですか？';
// <235> ADD end
//<KSN> ADD St
    GCODE_LENGTH = 16;
    LIMIT_COUNT = 10000;
    LIMIT_TREE_COUNT = 65535;  // TreeViewの限界  (65535 + 1(トップノード))

    INFO_MSG = '%sが、%s件以上登録されています。' +
                #13#10 +
               '集計に時間がかかるため、一覧表示の集計は行わず、' +
                #13#10 +
               '詳細画面での起動をしますか？';


    KBN_MIN = 0;
    KBN_MAX = 1;
// <291> MOD st
//    INFO_SORTMSG = '全てのマスタの並び替えを行います。' +
    INFO_SORTMSG = '全てのマスターの並び替えを行います。' +
// <291> MOD ed
                    #13#10 +
                    'よろしいですか？'+
                    #13#10 +
                    #13#10 +
// <291> MOD st
//                    '全て…　　　　 全てのマスタの並び替えを行います。' +
                    '全て…　　　　 全てのマスターの並び替えを行います。' +
// <291> MOD ed
                    #13#10 +
                    #13#10 +
                    '選択内…　　　今選択されている、%s内で' +
                    #13#10 +
                    '　　　　　　　　　並び替えを行います。' +
                    #13#10 +
                    #13#10 +
                    'キャンセル… 並び替えを行いません。';
//<KSN> ADD Ed
// <272> ADD START
	MODULECODE_KOJI = 850000;

    TOPDISTANCE_1KBN = 22;
// <272> ADD END

// <277> ADD st APGファイル取得区分
	GETKBN_SORTKEY		= 0;
    GETKBN_DISPLAYINFO	= 1;
// <277> ADD ed
//<TAX> ADD St
    TAX_TYPENAME : array[0..1] of String = ('税込', '税抜');
    SALES_COMPLETE      = 0;  // 完成基準
    SALES_PROGRESS      = 1;  // 進行基準
// <291> ADD st
	SALES_CostRecovery  = 2;  // 原価回収基準
// <291> ADD ed
    // 契約情報チェックで使用する戻り値一覧
    CONT_SUCCESS                        = 0;   // 成功
    CONT_MIXRATE                        = 1;   // 税率混在(「標準税率・不課税・非課税」と「３％～」)
    CONT_SPMIXRATE                      = 2;   // 税率混在(「標準税率」と「不課税」と「非課税」)
    CONT_ERRRATE                        = 3;   // 不正税率
    CONT_CHANGERATE                     = 4;   // 標準税率変更
    CONT_DIFFTAX                        = 5;   // 税額不一致
    CONT_NOTEXISTS                      = 6;   // 契約情報消失
    CONT_NOTCHANGEFINISH                = 7;   // 完成基準変更不可
    CONT_EXISTSCONTACCOUNT              = 8;   // 契約別残高存在  //<TAX_1> ADD
    CONT_EXISTSCONTACCOUNT_SALES        = 9;   // 契約別残高存在(売上計上基準変更時)  //<TAX_1> ADD

    MSG_DISABLETAXRATE =
        '入力できない消費税率です。'#13#10 +
        '「契約年月日」および「予定工期（終了）」に適した消費税率を入力してください。';

    MSG_CHANGETAXRATE =
        '契約情報の標準税率が、%sから%sに変更になりますが、よろしいですか？';

    MSG_FINISHCHANGE =
        '完成している%sです。この%sを更新しますか？'#13#10#13#10+
        '【注意】'#10+
        '　契約・入金情報を変更した場合、マスター更新を実行すると'#10+
        '　金額が変更される場合があります。';

    MSG_MIXRATE =
        '工事進行基準採用の%sでは税率指定と「標準税率」「不課税」「非課税」を組み合わせることができません。'#13#10+
        '税率区分は、すべて同じにするか、税率指定の混在のみにしてください。';

    MSG_SPMIXRATE =
        '工事進行基準採用の%sでは「%s」とその他の税率区分を組み合わせることができません。'#13#10+
        '税率区分は、すべて同じにするか、税率指定の混在のみにしてください。';

    MSG_CHANGETAXIN =
        '契約情報を税込に変更します。'#13+
        '契約金額を自動で計算しますか？'#13#10+
        '　「はい」・・・「(変更前）契約金額 + 消費税額 = （変更後）契約金額」で計算します。'#13+
        '　「いいえ」・・・自動で計算しません。'#13+
        '　「キャンセル」・・・契約金額入力方法を元に戻します。';

    MSG_CHANGETAXOUT =
        '契約情報を税抜に変更します。'#13+
        '契約金額を自動で計算しますか？'#13#10+
        '　「はい」・・・「(変更前）契約金額 - 消費税額 = （変更後）契約金額」で計算します。'#13+
        '　「いいえ」・・・自動で計算しません。'#13+
        '　「キャンセル」・・・契約金額入力方法を元に戻します。';

    MSG_CHANGECOMPLETE =
        '「契約金額入力方法」が税抜に設定されているため、工事完成基準には変更できません。';

    MSG_CONTAINSERRRATE =
        '「契約年月日」、「完成予定日」、「税率」の適用期間の組み合わせが一致していない契約情報があります。'+
        '登録を見直してください。';

    MSG_DIFFSALESTAX =
        '消費税額が、自動計算した額と一致していない契約情報があります。'#13+
        '契約情報を確認してください。';
//<TAX> ADD Ed
//<TAX_1> ADD St
    MSG_EXISTSCONTACCOUNT =
        '契約別残高があるため、契約情報を削除できません。'#13#10 +
        '契約別残高を確認してください。';

    MSG_EXISTSCONTACCOUNT_SALES =
        '契約別残高があるため、売上計上基準を変更できません。'#13#10 +
        '契約別残高を確認してください。';
//<ConInfo> ADD St
    MSG_CONTAINSDIFFRATE =
        '「契約年月日」、「完成予定日」、「税率」の適用期間の組み合わせが一致していない契約情報がありますが、' +
        '登録してよろしいですか？';
//<ConInfo> ADD Ed
    ContMaxCount = 999;  // 契約情報最大値
//<TAX_1> ADD Ed
//<288> ADD St
    MSG_CONTAINSKANJI =
        '入力値に全角文字もしくは特殊文字が含まれています。';
//<288> ADD Ed
  {$include JNTCRP018001CONST.inc}            // <240> ADD

type
  {$include ActionInterface.inc}
  {$include TableMasterH.inc}
  {$include JNTCommonOfProjectH.inc}  //<TAX> ADD
//{$I Log_Writer_1.inc}  //*Log*

  PFusenCmntRec = ^FusenCmntRec;
  // 付箋情報 //
  FusenCmntRec = record
  	Code	        :	String;         // 付箋ｺｰﾄﾞ
  	Cmnt	        :	String;         // 付箋ｺﾒﾝﾄ
  end;

//<271> ADD St
  // 付箋コメント専用リスト
  TFusenCmntList = class(TList)
    private
      function Get(Index : Integer): PFusenCmntRec;
      procedure Put(Index : Integer; const Value : PFusenCmntRec);
    public
      property Items[Index : integer] : PFusenCmntRec read Get write Put; default;
      destructor Destroy(); override;
      procedure Clear(); override;
  end;
//<271> ADD Ed

//<TAX> ADD St
  //======================
  // KojiInfoクラス
  //======================
  TKojiInfo = class
  private
    miSalesBase : Integer;
    miPartPattern : Integer;
    mdYoteiDateST : TDate;
    mdYoteiDateED : TDate;
  public
    property SalesBase : Integer read miSalesBase write miSalesBase;
    property PartPattern : Integer read miPartPattern write miPartPattern;
    property YoteiDateST : TDate read mdYoteiDateST write mdYoteiDateST;
    property YoteiDateED : TDate read mdYoteiDateED write mdYoteiDateED;
  end;

  //======================
  // KojiInfo構造体
  //======================
  TKojiInfoParam = record
    SalesBase : Integer;
    PartPattern : Integer;
    YoteiDateST : TDate;
    YoteiDateED : TDate;
  end;

  //======================
  // KojiInfo2クラス
  //======================
  TKojiInfo2 = class
  private
    miMasterKbn : Integer;  //<TAX_1> ADD
    miNCode : Extended;  //<TAX_1> ADD
    mdContDate : TDate;
    msContNo : String;
    mcContMoney : Currency;
    miTax_Rate : Integer;
    mcSales_Tax : Currency;
    miDspOrder : Integer;
    miDspOrder2 : Integer;  //<TAX_1> ADD
  public
    property MasterKbn : Integer read miMasterKbn write miMasterKbn;  //<TAX_1> ADD
    property NCode : Extended read miNCode write miNCode;  //<TAX_1> ADD
    property ContDate : TDate read mdContDate write mdContDate;
    property ContNo : String read msContNo write msContNo;
    property ContMoney : Currency read mcContMoney write mcContMoney;
    property Tax_Rate : Integer read miTax_Rate write miTax_Rate;
    property Sales_Tax : Currency read mcSales_Tax write mcSales_Tax;
    property DspOrder : Integer read miDspOrder write miDspOrder;
    property DspOrder2 : Integer read miDspOrder2 write miDspOrder2;  //<TAX_1> ADD
  end;

  //======================
  // KojiInfo2構造体
  //======================
  TKojiInfo2Param = record
    MasterKbn : Integer;  //<TAX_1> ADD
    NCode : Extended;  //<TAX_1> ADD
    ContDate : TDate;
    ContNo : String;
    ContMoney : Currency;
    Tax_Rate : Integer;
    Sales_Tax : Currency;
    DspOrder : Integer;
  end;

  //=============================
  // 工事詳細情報管理クラス
  //=============================
  TKojiInfoManager = class
  private
    moBusiness              : TBusinessObject;
    moKojiInfo              : TKojiInfo;
    moContList              : TObjectList;     // 契約情報を保持
    moContErrList           : TObjectList;     // 契約情報のエラーデータを保持
    mbContChanged           : Boolean;         // 契約情報変更判定を保持
    mSaveKojiInfoParam      : TKojiInfoParam;
    mSaveKojiInfo2Param     : TKojiInfo2Param;

    procedure setKojiInfo(param : TKojiInfoParam);
    procedure setKojiInfo2(param : TKojiInfo2Param; obj: TKojiInfo2);
    function getItemsIndex(index : Integer): TKojiInfo2;
    function getItemsDspOrder(dspOrder : Integer): TKojiInfo2;
    function getItemsDspOrder2(dspOrder2 : Integer): TKojiInfo2;  //<TAX> ADD
    procedure addKojiInfo2(param: TKojiInfo2Param);
    function checkKojiInfo2(
        param: TKojiInfo2Param;
        errorCheck : Boolean;
        var returnCode: Integer): Boolean;overload;
    function isMixRate(param: TKojiInfo2Param): Boolean;
    function isSpMixRate(param: TKojiInfo2Param): Boolean;
    function isChangeRate(param : TKojiInfoParam): Boolean;overload;
    function isChangeRate(param : TKojiInfo2Param): Boolean;overload;
    function isChangeRate(contDate, contDate2, finishDate, finishDate2: TDate): Boolean;overload;
    function isDiffTax(param: TKojiInfo2Param): Boolean;
    function isErrRate(): Boolean;overload;
    function isErrRate(rateCode: Integer; contDate, finishDate: TDate): Boolean;overload;
    function isChangeContData(param: TKojiInfo2Param): Boolean;
    function isExistsContAccount(obj: TKojiInfo2): Boolean;overload;  //<TAX_1> ADD
    function isExistsContAccount(): Boolean;overload;                 //<TAX_1> ADD
    function getContCount(): Integer;
    property itemsIndex[index: Integer] : TKojiInfo2 read getItemsIndex;
    property itemsDspOrder[dspOrder: Integer] : TKojiInfo2 read getItemsDspOrder;
    property itemsDspOrder2[dspOrder2: Integer] : TKojiInfo2 read getItemsDspOrder2;  //<TAX_1> ADD
    function getNewDspOrder(): Integer;  //<TAX_1> ADD
  public
    constructor Create(business: TBusinessObject);
    destructor Destroy();override;
    procedure Initialize();
    procedure CreateKojiInfo(param: TKojiInfoParam);
    function ChangeKojiInfo(param: TKojiInfoParam; errorCheck : Boolean = true): Integer;
    procedure ReChangeKojiInfo();
    function ChangeKojiInfo2(param: TKojiInfo2Param; errorCheck : Boolean = true): Integer;
    procedure ReChangeKojiInfo2();
//<TAX_1> DEL    function EntryKojiInfo2(param: TKojiInfo2Param; errorCheck : Boolean = true): Integer;
//<TAX_1> ADD St
    function EntryKojiInfo2(param: TKojiInfo2Param;
        errorCheck : Boolean = true;
        dspOrder2: Integer = 0): Integer;
//<TAX_1> ADD Ed
//<TAX_1> DEL    procedure DeleteKojiInfo2(param: TKojiInfo2Param);
    function DeleteKojiInfo2(param: TKojiInfo2Param): Integer;  //<TAX_1> ADD
    function CheckKojiInfo2(param: TKojiInfo2Param): Integer;overload;
    function ContainsErrRate(): Boolean;
    function GetKojiInfoParam(): TKojiInfoParam;
    function GetKojiInfo2(dspOrder : Integer): TKojiInfo2;
    function GetKojiInfo2Param(dspOrder : Integer): TKojiInfo2Param;
    function GetContErrList(): TObjectList;
    property ContCount : Integer read getContCount;
    property ContChanged : Boolean read mbContChanged;
    property NewDspOrder : Integer read getNewDspOrder;  //<TAX_1> ADD
  end;

  //=============================
  // 変換クラス(クラス⇔構造体)
  //=============================
  TConverter = class
  public
    class function ToKojiInfoParam(obj: TKojiInfo): TKojiInfoParam;
    class function ToKojiInfo2Param(obj: TKojiInfo2): TKojiInfo2Param;
    class function ToKojiInfoObj(param: TKojiInfoParam): TKojiInfo;
    class function ToKojiInfo2Obj(param: TKojiInfo2Param): TKojiInfo2;
  end;
//<TAX> ADD Ed

  FunctionAction = procedure() of Object;

  //=== グローバル関数定義エリア ===//

  function fnMakeSQL(nType: Integer): String;
//<TAX> ADD St
  function IfThen(Cond: Boolean; Str_1,Str_2 :String): String;overload;
  //function IfThen(Cond: Boolean; Int_1,Int_2 :Integer): Integer;overload;
  function IfThen(Cond: Boolean; Ext_1,Ext_2 :Extended): Extended;overload;
  function IfThen(Cond: Boolean; Date_1,Date_2 :TDate): TDate;overload;
  function IfThen(Cond: Boolean; Bol_1,Bol_2 :Boolean): Boolean;overload;
  function IfThen(Cond: Boolean; Obj_1,Obj_2 :TObject): TObject; overload;
  function GetFontColor(colorNumber: Integer): TColor;
  function GetContMessage(value: Integer): String;
  function IsZeroDate(date: TDate): Boolean;
  function IsContains(list : array of String; value: String): Boolean;
  function IsNonTax(rateCode: Integer): Boolean;
//<TAX> ADD Ed
//var
//    m_Log           : TLog_Writer;  //*Log*
implementation
function fnMakeSQL(nType: Integer): String;
var
	sSQL : String;
begin

    sSQL := '';
	case nType of
        1:  sSQL := 'CALL MP200010(0, :TANCD)';     // 履歴ｽﾄｱﾄﾞの開始
 	    2:	sSQL :=	'CALL MP200010(1)';             // 履歴ｽﾄｱﾄﾞの終了
        10: sSQL := 'CALL MP200011(0, :SEGCD)';     // ｸﾞﾙｰﾌﾟ管理ｽﾄｱﾄﾞの開始
	    20:	sSQL :=	'CALL MP200011(1)';             // ｸﾞﾙｰﾌﾟ管理ｽﾄｱﾄﾞの終了
    end;

	Result := sSQL;

end;

//<TAX> ADD St
//==============================================================================
// 概要：String型の三項演算子
//==============================================================================
function IfThen(Cond: Boolean; Str_1,Str_2 :String):String;
begin
     if Cond then  Result := Str_1
     else  Result := Str_2;
end;

//==============================================================================
// 概要：Integer型の三項演算子
//==============================================================================
//function IfThen(Cond: Boolean; Int_1,Int_2 :Integer):Integer;
//begin
//     if Cond then  Result := Int_1
//     else  Result := Int_2;
//end;

//==============================================================================
// 概要：Extended型の三項演算子
//==============================================================================
function IfThen(Cond: Boolean; Ext_1,Ext_2 :Extended): Extended;
begin
     if Cond then  Result := Ext_1
     else  Result := Ext_2;
end;

//==============================================================================
// 概要：Boolean型の三項演算子
//==============================================================================
function IfThen(Cond: Boolean; Bol_1,Bol_2 :Boolean): Boolean;overload;
begin
     if Cond then  Result := Bol_1
     else  Result := Bol_2;
end;

//==============================================================================
// 概要：TDate型の三項演算子
//==============================================================================
function IfThen(Cond: Boolean; Date_1,Date_2 :TDate): TDate;overload;
begin
     if Cond then  Result := Date_1
     else  Result := Date_2;
end;
//==============================================================================
// 概要：Object型の三項演算子
//==============================================================================
function IfThen(Cond: Boolean; Obj_1,Obj_2 :TObject): TObject;
begin
    if Cond then  Result := Obj_1
    else  Result := Obj_2;
end;

//==============================================================================
// 概要：引数のカラーNoに従い、フォントカラーを返値
//==============================================================================
function GetFontColor(colorNumber: Integer): TColor;
begin
    case colorNumber of
        FONTCOLOR_RED           :    result := clRed;
        FONTCOLOR_BLUE          :    result := clBlue;
        FONTCOLOR_WINDOWTEXT2   :    result := clWindowText;
        else                         result := clWindowText;
    end;
end;

//==============================================================================
// 概要：契約情報に関するメッセージ取得
//==============================================================================
function GetContMessage(value: Integer): String;
begin
    result := '';
    case value of
        CONT_MIXRATE                    :   result := MSG_MIXRATE;
        CONT_SPMIXRATE                  :   result := MSG_SPMIXRATE;
        CONT_ERRRATE                    :   result := MSG_DISABLETAXRATE;
        CONT_CHANGERATE                 :   result := MSG_CHANGETAXRATE;
        CONT_NOTCHANGEFINISH            :   result := MSG_CHANGECOMPLETE;       // (旧)MSG_FINISHCHANGE <TAX_1> MOD
        CONT_EXISTSCONTACCOUNT          :   result := MSG_EXISTSCONTACCOUNT;    //<TAX_1> ADD
        CONT_EXISTSCONTACCOUNT_SALES    :   result := MSG_EXISTSCONTACCOUNT_SALES;    //<TAX_1> ADD
    end;
end;

//==============================================================================
// 概要：コレクション(配列)に引数の値が含まれているかの判定を返値
//==============================================================================
function IsContains(list : array of String; value: String): Boolean;
var
    idx: Integer;
begin
    result := false;
    for idx := 0 to Length(list) -1 do
    begin
        if value = list[idx] then
        begin
            result := true;
            Exit;
        end;
    end;
end;

//==============================================================================
// 概要：日付が未入力(0)であればTrueを返す
// 戻り値：【True】未入力 【False】入力された日付
//==============================================================================
function IsZeroDate(date: TDate): Boolean;
var
    wY, wM, wD: WORD;
begin
	DecodeDate(date, wY, wM, wD);
    result := ((wY + wM + wD) = 0) or (date = 0);
end;

//==============================================================================
// 概要：不課税・非課税の判定
// 戻り値：【True】不課税・非課税である 【False】不課税・非課税ではない
//==============================================================================
function IsNonTax(rateCode: Integer): Boolean;
begin
    result := (rateCode in [8, 9]);
end;

//<TAX> ADD Ed

  {$include TableMasterB.inc}
  {$include JNTCommonOfProjectB.inc}  //<TAX> ADD
//  {$I Log_Writer_2.inc}  //*Log*
//<271> ADD St
// -----------------------------------------------------------------------------
//   付箋コメントにキャストして返却
// -----------------------------------------------------------------------------
function TFusenCmntList.Get(Index : integer) : PFusenCmntRec;
begin
    result := PFusenCmntRec(inherited Get(Index));
end;

// -----------------------------------------------------------------------------
//   付箋コメントを該当インデックスへセット
// -----------------------------------------------------------------------------
procedure TFusenCmntList.Put(Index : integer; const Value : PFusenCmntRec);
begin
    inherited Put(Index, Value);
end;

// -----------------------------------------------------------------------------
//   デストラクタ
// -----------------------------------------------------------------------------
destructor TFusenCmntList.Destroy();
begin
    try
        Clear();
    finally
        inherited Destroy();
    end;
end;

// -----------------------------------------------------------------------------
//   リストクリア
// -----------------------------------------------------------------------------
procedure TFusenCmntList.Clear();
var
    i : integer;
    pFusenCmnt : PFusenCmntRec;
begin
    try
        for i := 0 to Self.Count - 1 do
        begin
            pFusenCmnt := Self.Items[i];
            Dispose(pFusenCmnt);
        end;
    finally
        inherited Clear();
    end;
end;
//<271> ADD Ed

//<TAX> ADD St
//==============================================================================
// 概要：KojiInfo管理クラスのコンストラクタ
//==============================================================================
constructor TKojiInfoManager.Create(business: TBusinessObject);
begin
    inherited Create();
    moBusiness := business;
    moKojiInfo := nil;
    moContList := TObjectList.Create();
    moContErrList := TObjectList.Create();
    moContList.OwnsObjects      := true;    // クリア時に開放も行う
    moContErrList.OwnsObjects   := false;   // クリアするだけ
end;

//==============================================================================
// 概要：KojiInfo管理クラスのデストラクタ
//==============================================================================
destructor TKojiInfoManager.Destroy();
begin
    moKojiInfo.Free();
    moContList.Free();
    moContErrList.Free();
    inherited;
end;

//==============================================================================
// 概要：KojiInfo2をコレクションへ格納
//==============================================================================
procedure TKojiInfoManager.addKojiInfo2(param: TKojiInfo2Param);
var
    oCont: TKojiInfo2;
begin
    // コレクションへ追加・更新
    oCont := itemsDspOrder[param.DspOrder];
    if (oCont = nil) then
    begin
        oCont := TConverter.ToKojiInfo2Obj(param);
        moContList.Add(oCont);
    end
    else
    begin
        setKojiInfo2(param, oCont);
    end;
end;

//==============================================================================
// 概要：初期化
//==============================================================================
procedure TKojiInfoManager.Initialize();
begin
    if (moKojiInfo <> nil) then
    begin
        moKojiInfo.Free;
    end;

    moKojiInfo := TKojiInfo.Create();

    mbContChanged := false;
    moContErrList.Clear();
    moContList.Clear();
end;

//==============================================================================
// 概要：KojiInfo新規作成
//==============================================================================
procedure TKojiInfoManager.CreateKojiInfo(param: TKojiInfoParam);
begin
    Initialize();
    setKojiInfo(param);
end;

//==============================================================================
// 概要：KojiInfo変更
//==============================================================================
function TKojiInfoManager.ChangeKojiInfo(
    param: TKojiInfoParam;
    errorCheck : Boolean = true): Integer;
begin
    result := CONT_SUCCESS;

    // 完成予定日変更時のチェック
    if (errorCheck) and (moKojiInfo.YoteiDateED <> param.YoteiDateED) then
    begin
        // 標準税率変更チェック
        if isChangeRate(param) then
        begin
            result := CONT_CHANGERATE;
            mSaveKojiInfoParam := param;
            Exit;
        end;
    end;

    // 進行基準→完成基準
    if  (errorCheck) and
// <291> MOD st
//        ((moKojiInfo.SalesBase = 1) and (param.SalesBase = 0) and
        (((moKojiInfo.SalesBase = 1) or (moKojiInfo.SalesBase = 2)) and (param.SalesBase = 0) and
// <291> MOD ed
        (moContList.Count > 0) and   //<TAX_1> ADD
        (moKojiInfo.PartPattern = KBN_TAXOUT)) then
    begin
        result := CONT_NOTCHANGEFINISH;
        Exit;
    end;
//<TAX_1> ADD St
    // 契約別仮受消費税登録チェック
    if (errorCheck) and (isExistsContAccount()) then
    begin
        result := CONT_EXISTSCONTACCOUNT_SALES;
        Exit;
    end;
//<TAX_1> ADD Ed
    setKojiInfo(param);
end;

//==============================================================================
// 概要：契約情報追加
//==============================================================================
//<TAX_1> DEL function TKojiInfoManager.EntryKojiInfo2(param: TKojiInfo2Param; errorCheck : Boolean = true): Integer;
//<TAX_1> ADD St
function TKojiInfoManager.EntryKojiInfo2(param: TKojiInfo2Param;
    errorCheck : Boolean = true;
    dspOrder2: Integer = 0): Integer;
var
    oCont : TKojiInfo2;
//<TAX_1> ADD Ed
begin
    if checkKojiInfo2(param, errorCheck, result) then
    begin
        addKojiInfo2(param);
//<TAX_1> ADD St
        oCont := itemsDspOrder[param.DspOrder];
        if ((oCont <> nil) and (dspOrder2 <> 0)) then
        begin
            oCont.DspOrder2 := dspOrder2;
        end;
//<TAX_1> ADD Ed
    end;
end;

//==============================================================================
// 概要：契約情報変更
//==============================================================================
function TKojiInfoManager.ChangeKojiInfo2(param: TKojiInfo2Param; errorCheck : Boolean = true): Integer;
begin
    // 日付未入力時は保持しているコレクションから削除
    if IsZeroDate(param.ContDate) then
    begin
        DeleteKojiInfo2(param);
        result := CONT_SUCCESS;
        Exit;
    end;

    if checkKojiInfo2(param, errorCheck, result) then
    begin
        // 変更フラグを更新
        if (not mbContChanged) then
        begin
            mbContChanged := isChangeContData(param);
        end;

        addKojiInfo2(param);
    end;
end;

//==============================================================================
// 概要：契約情報削除
//==============================================================================
//<TAX_1> DEL procedure TKojiInfoManager.DeleteKojiInfo2(param: TKojiInfo2Param);
function TKojiInfoManager.DeleteKojiInfo2(param: TKojiInfo2Param): Integer;  //<TAX_1> ADD
var
    oCont : TKojiInfo2;
begin
//<TAX_1> ADD St
    result := CONT_SUCCESS;

    oCont := iTemsDspOrder[param.DspOrder];

    if oCont = nil then
    begin
        Exit;
    end;

    if (isExistsContAccount(oCont)) then
    begin
        result := CONT_EXISTSCONTACCOUNT;
        Exit;
    end;
//<TAX_1> ADD Ed
    if (not mbContChanged) then
    begin
        mbContChanged := true;
    end;

    moContList.Remove(oCont);
end;

//==============================================================================
// 概要：KojiInfo2(契約情報のチェック処理)
//==============================================================================
function TKojiInfoManager.CheckKojiInfo2(param: TKojiInfo2Param): Integer;
begin
    checkKojiInfo2(param, true, result);
end;

//==============================================================================
// 概要：KojiInfo2(契約情報のチェック処理)
//==============================================================================
function TKojiInfoManager.checkKojiInfo2(
    param: TKojiInfo2Param;
    errorCheck : Boolean;
    var returnCode: Integer): Boolean;
begin
    returnCode := CONT_SUCCESS;
    result := false;

    // 契約日未入力はエラーチェック対象外
    if IsZeroDate(param.ContDate) then
    begin
        Exit;
    end;

    // 混在チェック１(「標準・不課税・非課税」と「３％～１０％」)
    if errorCheck and (isMixRate(param)) then
    begin
        returnCode := CONT_MIXRATE;
        Exit;
    end;

    // 混在チェック２(「標準」と「不課税」と「非課税」)
    if errorCheck and (isSpMixRate(param)) then
    begin
        returnCode := CONT_SPMIXRATE;
        Exit;
    end;

    // 標準税率の消費税率不一致チェック
    if errorCheck and (isChangeRate(param)) then
    begin
        mSaveKojiInfo2Param := param;   // 退避
        returnCode := CONT_CHANGERATE;
        Exit;
    end;

    // 消費税額不一致チェック
    if isDiffTax(param) then
    begin
        returnCode := CONT_DIFFTAX;
    end;

    result := true;
end;

//==============================================================================
// 概要：保持している契約情報に不正税率が存在していればTrueを返値
//==============================================================================
function TKojiInfoManager.ContainsErrRate(): Boolean;
begin
    result := isErrRate();
end;

//==============================================================================
// 概要：KojiInfoを退避したパラメーターで変更
//==============================================================================
procedure TKojiInfoManager.ReChangeKojiInfo();
begin
    setKojiInfo(mSaveKojiInfoParam);
end;

//==============================================================================
// 概要：KojiInfo2を退避したパラメーターで変更
//==============================================================================
procedure TKojiInfoManager.ReChangeKojiInfo2();
begin
    // 変更フラグを更新
    if (not mbContChanged) then
    begin
        mbContChanged := isChangeContData(mSaveKojiInfo2Param);
    end;

    addKojiInfo2(mSaveKojiInfo2Param);
end;

//==============================================================================
// 概要：KojiInfoセット
//==============================================================================
procedure TKojiInfoManager.setKojiInfo(param : TKojiInfoParam);
begin
    moKojiInfo.SalesBase    := param.SalesBase;
    moKojiInfo.PartPattern  := param.PartPattern;
    moKojiInfo.YoteiDateST  := param.YoteiDateST;
    moKojiInfo.YoteiDateED  := param.YoteiDateED;
end;

//==============================================================================
// 概要：KojiInfo2セット
//==============================================================================
procedure TKojiInfoManager.setKojiInfo2(param : TKojiInfo2Param; obj: TKojiInfo2);
begin
//<TAX_1> ADD St
    obj.MasterKbn   := param.MasterKbn;
    obj.NCode       := param.NCode;
//<TAX_1> ADD Ed
    obj.ContDate    := param.ContDate;
    obj.ContNo      := param.ContNo;
    obj.ContMoney   := param.ContMoney;
    obj.Tax_Rate    := param.Tax_Rate;
    obj.Sales_Tax   := param.Sales_Tax;
    obj.DspOrder    := param.DspOrder;
end;

//==============================================================================
// 概要：コレクションからKojiInfo2オブジェクト取得(インデックス検索)
//==============================================================================
function TKojiInfoManager.getItemsIndex(index : Integer): TKojiInfo2;
begin
    result := TKojiInfo2(moContList[index]);
end;

//==============================================================================
// 概要：コレクションからKojiInfo2オブジェクト取得(表示順序)
//==============================================================================
function TKojiInfoManager.getItemsDspOrder(dspOrder : Integer): TKojiInfo2;
var
    idx : Integer;
    oCont : TKojiInfo2;
begin
    result := nil;
    for idx := 0 to moContList.Count -1 do
    begin
        oCont := itemsIndex[idx];
        if oCont.DspOrder = dspOrder then
        begin
            result := oCont;
            Exit;
        end;
    end;
end;

//<TAX_1> ADD St
//==============================================================================
// 概要：コレクションからKojiInfo2オブジェクト取得(表示順序)
//==============================================================================
function TKojiInfoManager.getItemsDspOrder2(dspOrder2 : Integer): TKojiInfo2;
var
    idx : Integer;
    oCont : TKojiInfo2;
begin
    result := nil;
    for idx := 0 to moContList.Count -1 do
    begin
        oCont := itemsIndex[idx];
        if oCont.DspOrder2 = dspOrder2 then
        begin
            result := oCont;
            Exit;
        end;
    end;
end;
//<TAX_1> ADD Ed

//==============================================================================
// 概要：消費税額不一致チェック
//==============================================================================
function TKojiInfoManager.isDiffTax(param: TKojiInfo2Param): Boolean;
var
    oDic: TDIC_COTXRATE;
begin
    result := false;

    if (param.Tax_Rate = RATECODESTANDARD) then
    begin
        oDic := moBusiness.GetStandardTaxRate(param.ContDate, moKojiInfo.YoteiDateED);
    end
    else if (moBusiness.TaxRates.ItemsCode[param.Tax_Rate].NCode <> -1 ) then
    begin
        oDic := mobusiness.TaxRates.ItemsCode[param.Tax_Rate];
    end
    else
    begin
        Exit;
    end;

    result := (param.Sales_Tax <>
        moBusiness.GetTaxAmount(
            oDic, moKojiInfo.PartPattern, param.ContMoney));
end;

//==============================================================================
// 概要：契約情報税率混在チェック(「税率指定」と「標準税率・不課税・非課税」)
//==============================================================================
function TKojiInfoManager.isMixRate(param: TKojiInfo2Param): Boolean;
var
    idx     : Integer;
    oCont   : TKojiInfo2;
    oDic,
    oDic2   : TDIC_COTXRATE;
begin
    result := false;
    // 進行基準の場合
// <291> MOD st
//    if (moKojiInfo.SalesBase = 1) then
    if ((moKojiInfo.SalesBase = 1) or (moKojiInfo.SalesBase = 2)) then
// <291> MOD ed
    begin
        oDic := moBusiness.TaxRates.ItemsCode[param.Tax_Rate];
        // 混在チェック
        for idx := 0 to moContList.Count -1 do
        begin
            oCont := itemsIndex[idx];
            // 自分自身の場合は比較対象外
            if param.DspOrder = oCont.DspOrder then
            begin
                continue;
            end;

            oDic2 := moBusiness.TaxRates.ItemsCode[oCont.Tax_Rate];

            if ((oDic.NCode <> -1) and (oDic2.NCode = -1)) then
            begin
                result := true;
                Exit;
            end;
        end;
    end;
end;

//==============================================================================
// 概要：契約情報税率混在チェック(「標準税率」と「不課税」と「非課税」)
//==============================================================================
function TKojiInfoManager.isSpMixRate(param: TKojiInfo2Param): Boolean;
var
    idx     : Integer;
    oCont   : TKojiInfo2;
    oDic,
    oDic2   : TDIC_COTXRATE;
begin
    result := false;
    // 進行基準の場合
// <291> MOD st
//    if (moKojiInfo.SalesBase = 1) then
    if ((moKojiInfo.SalesBase = 1) or (moKojiInfo.SalesBase = 2)) then
// <291> MOD ed
    begin
        oDic := moBusiness.TaxRates.ItemsCode[param.Tax_Rate];
        // 混在チェック
        for idx := 0 to moContList.Count -1 do
        begin
            oCont := itemsIndex[idx];
            // 自分自身の場合は比較対象外
            if param.DspOrder = oCont.DspOrder then
            begin
                continue;
            end;

            oDic2 := moBusiness.TaxRates.ItemsCode[oCont.Tax_Rate];

            if ((oDic.NCode = -1) and (oDic.RateCD <> oDic2.RateCD)) then
            begin
                result := true;
                Exit;
            end;
        end;
    end;
end;

//==============================================================================
// 概要：契約情報標準税率変更チェック(全契約情報のチェック)
//==============================================================================
function TKojiInfoManager.isChangeRate(param : TKojiInfoParam): Boolean;
var
    oCont: TKojiInfo2;
    idx : Integer;
begin
    result := false;
    moContErrList.Clear();
    for idx := 0 to moContList.Count -1 do
    begin
        oCont := itemsIndex[idx];
        if (oCont.Tax_Rate = RATECODESTANDARD) then
        begin

            if isChangeRate(
                oCont.ContDate,
                oCont.ContDate,
                moKojiInfo.YoteiDateED,
                param.YoteiDateED) then
            begin
                moContErrList.Add(oCont);
                result := true;
            end;
        end;
    end;
end;

//==============================================================================
// 概要：契約情報標準税率変更チェック(契約情報1件のチェック)
//==============================================================================
function TKojiInfoManager.isChangeRate(param : TKojiInfo2Param): Boolean;
var
    oCont: TKojiInfo2;
begin
    result := false;
    moContErrList.Clear();
    oCont := itemsDspOrder[param.DspOrder];
    if (oCont <> nil) and (oCont.Tax_Rate = RATECODESTANDARD) and
        (oCont.Tax_Rate = param.Tax_Rate) then
    begin
        if isChangeRate(
            oCont.ContDate,
            param.ContDate,
            moKojiInfo.YoteiDateED,
            moKojiInfo.YoteiDateED) then
        begin
            moContErrList.Add(oCont);
            result := true;
        end;
    end;
end;

//==============================================================================
// 概要：契約情報標準税率変更チェック(実際のチェック)
//==============================================================================
function TKojiInfoManager.isChangeRate(
    contDate, contDate2, finishDate, finishDate2: TDate): Boolean;
var
    oDic,
    oDic2 : TDIC_COTXRATE;
begin
    oDic  := moBusiness.GetStandardTaxRate(contDate, finishDate);
    oDic2 := moBusiness.GetStandardTaxRate(contDate2, finishDate2);
    result := (oDic.RateCD <> oDic2.RateCD);
end;

//==============================================================================
// 概要：契約情報不正税率チェック(全契約情報のチェック)
//==============================================================================
function TKojiInfoManager.isErrRate(): Boolean;
var
    oCont: TKojiInfo2;
    idx : Integer;
begin
    result := false;
    moContErrList.Clear();
    for idx := 0 to moContList.Count -1 do
    begin
        oCont := itemsIndex[idx];
//<TAX_2> ADD St
        if (oCont.ContMoney < 0) then
        begin
            continue;
        end;
//<TAX_2> ADD Ed
        if isErrRate(
            oCont.Tax_Rate,
            oCont.ContDate,
            moKojiInfo.YoteiDateED) then
        begin
            moContErrList.Add(oCont);
            result := true;
            Exit;
        end;
    end;
end;

//==============================================================================
// 概要：契約情報不正税率チェック(1件単位のチェック)
//==============================================================================
function TKojiInfoManager.isErrRate(rateCode: Integer; contDate, finishDate: TDate): Boolean;
begin
    result := not moBusiness.CanUseTaxRate(rateCode, contDate, finishDate);
end;

//==============================================================================
// 概要：契約情報が変更されたか調べる
//==============================================================================
function TKojiInfoManager.isChangeContData(param: TKojiInfo2Param): Boolean;
var
    oCont: TKojiInfo2;
begin
    result := false;
    oCont := itemsDspOrder[param.DspOrder];
    if oCont <> nil then
    begin
        result :=
            (param.ContMoney <> oCont.ContMoney) or
            (param.ContDate <> oCont.ContDate) or
            (param.ContNo <> oCont.ContNo) or
            (param.Tax_Rate <> oCont.Tax_Rate) or
            (param.Sales_Tax <> oCont.Sales_Tax);
    end;
end;

//<TAX_1> ADD St
//==============================================================================
// 概要：契約情報に契約別残高が存在している場合はTrue
//==============================================================================
function TKojiInfoManager.isExistsContAccount(obj: TKojiInfo2): Boolean;
var
    oQry : TMQuery;
begin
    result := false;

// <291> MOD st 進行基準または原価回収基準の場合
//    if (moKojiInfo.SalesBase <> SALES_PROGRESS) then
    if (moKojiInfo.SalesBase = SALES_COMPLETE) then
// <291> MOD ed
    begin
        Exit;
    end;

    oQry := moBusiness.NewCompanyQuery;
    if (oQry = nil) then
    begin
        Exit;
    end;

    try

        with oQry do
        begin
            Close();
            SQL.Clear();
            SQL.Add(' SELECT');
            SQL.Add('     TOP 1 1');
            SQL.Add(' FROM');
            SQL.Add('     SumKOSM');
            SQL.Add(' WHERE');
            SQL.Add('     MasterKbn = 0 AND');
            SQL.Add('     NMonth = 0 AND');
            SQL.Add('     YearKbn = 1 AND');
            SQL.Add('     BaseNCode = 0 AND');
            SQL.Add('     HojyoKbn = 1 AND');
            SQL.Add('     DataType = 0 AND');
            SQL.Add('     SumKbn Between 12 And 14 AND');
            SQL.Add('     (DebitSum <> 0 OR CreditSum <> 0) AND');
            SQL.Add('     PrjKbn = :PrjKbn AND');
            SQL.Add('     PrjNCode = :PrjNCode AND');
            SQL.Add('     TekiNCode = :TekiNCode');

            ParamByName('PrjKbn').AsInteger  := obj.MasterKbn;
            ParamByName('PrjNCode').AsString := FormatFloat('0', obj.NCode);
            ParamByName('TekiNCode').AsString := FormatFloat('0', obj.DspOrder2);

            Open();

            result := not EOF;
        end;

    finally
        oQry.Close();
        oQry.Free();
    end;
end;

//==============================================================================
// 概要：契約情報に契約別残高が存在している場合はTrue(全契約情報)
//==============================================================================
function TKojiInfoManager.isExistsContAccount(): Boolean;
var
    idx : Integer;
    oCont : TKojiInfo2;
begin
    result := false;
// <291> MOD st 進行基準または原価回収基準の場合
//    if moKojiInfo.SalesBase = SALES_PROGRESS then
    if moKojiInfo.SalesBase <> SALES_COMPLETE then
// <291> MOD ed
    begin
        for idx := 0 to moContList.Count -1 do
        begin
            oCont := itemsIndex[idx];
            if isExistsContAccount(oCont) then
            begin
                result := true;
                Exit;
            end;
        end;
    end;
end;
//<TAX_1> ADD Ed

//==============================================================================
// 概要：工事詳細情報取得(外部向け)
//==============================================================================
function TKojiInfoManager.GetKojiInfoParam(): TKojiInfoParam;
begin
    result := TConverter.ToKojiInfoParam(moKojiInfo);
end;

//==============================================================================
// 概要：契約情報取得(外部向け)
//==============================================================================
function TKojiInfoManager.GetKojiInfo2(dspOrder : Integer): TKojiInfo2;
begin
    result := itemsDspOrder[dspOrder];
end;

//==============================================================================
// 概要：契約情報取得(外部向け)
//==============================================================================
function TKojiInfoManager.GetKojiInfo2Param(dspOrder : Integer): TKojiInfo2Param;
var
    oCont: TKojiInfo2;
begin
    oCont := itemsDspOrder[dspOrder];
    if (oCont <> nil) then
    begin
        result := TConverTer.ToKojiInfo2Param(oCont);
    end;
end;

//==============================================================================
// 概要：契約情報の件数を返値
//==============================================================================
function TKojiInfoManager.getContCount(): Integer;
begin
    result := moContList.Count;
end;

//==============================================================================
// 概要：エラーになった契約情報コレクションを返値
//==============================================================================
function TKojiInfoManager.GetContErrList(): TObjectList;
begin
    result := moContErrList;
end;

//<TAX_1> ADD St
//==============================================================================
// 概要：空番のDspOrderを返値
//==============================================================================
function TKojiInfoManager.getNewDspOrder(): Integer;
var
    i : Integer;
    oCont : TKojiInfo2;
begin
    result := 0;
    for i := 1 to ContMaxCount do
    begin
        oCont := itemsDspOrder2[i];
        if (oCont = nil) then
        begin
            result := i;
            Exit;
        end;
    end;
end;
//<TAX_1> ADD Ed

//==============================================================================
// 概要：構造体へ変換(TKojiInfoParam)
//==============================================================================
class function TConverter.ToKojiInfoParam(obj: TKojiInfo): TKojiInfoParam;
begin
    result.SalesBase     := obj.SalesBase;
    result.PartPattern   := obj.PartPattern;
    result.YoteiDateST   := obj.YoteiDateST;
    result.YoteiDateED   := obj.YoteiDateED;
end;

//==============================================================================
// 概要：構造体へ変換(TKojiInfo2Param)
//==============================================================================
class function TConverter.ToKojiInfo2Param(obj: TKojiInfo2): TKojiInfo2Param;
begin
    result.MasterKbn    := obj.MasterKbn;       //<TAX_1> ADD
    result.NCode        := obj.NCode;           //<TAX_1> ADD
    result.ContDate     := obj.ContDate;
    result.ContNo       := obj.ContNo;
    result.ContMoney    := obj.ContMoney;
    result.Tax_Rate     := obj.Tax_Rate;
    result.Sales_Tax    := obj.Sales_Tax;
    result.DspOrder     := obj.DspOrder;
end;

//==============================================================================
// 概要：オブジェクトへ変換(TKojiInfo)
//==============================================================================
class function TConverter.ToKojiInfoObj(param: TKojiInfoParam): TKojiInfo;
begin
    result := TKojiInfo.Create();
    result.SalesBase     := param.SalesBase;
    result.PartPattern   := param.PartPattern;
    result.YoteiDateST   := param.YoteiDateST;
    result.YoteiDateED   := param.YoteiDateED;
end;

//==============================================================================
// 概要：オブジェクトへ変換(TKojiInfo2)
//==============================================================================
class function TConverter.ToKojiInfo2Obj(param: TKojiInfo2Param): TKojiInfo2;
begin
    result := TKojiInfo2.Create();
    result.MasterKbn    := param.MasterKbn;     //<TAX_1> ADD
    result.NCode        := param.NCode;         //<TAX_1> ADD
    result.ContDate     := param.ContDate;
    result.ContNo       := param.ContNo;
    result.ContMoney    := param.ContMoney;
    result.Tax_Rate     := param.Tax_Rate;
    result.Sales_Tax    := param.Sales_Tax;
    result.DspOrder     := param.DspOrder;
end;
//<TAX> ADD Ed

end.


