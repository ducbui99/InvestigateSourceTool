//=============================================================================
//
//      システム名  ：ＭＪＳ ＦＸ（共通マスター）
//      処理名      ：出力範囲指定ダイアログ
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）
//
//      作成者      ：茂木 勇次
//      作成日      ：2005.08.09(TUE)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>    <修正内容>
//  <  >    XXXXXXXXXX      9999.99.99(XXX) XXXXXXXXXXXXXXXXXXX
//
//  2005.08.09時点では、複数選択、検索ｴｸｽﾌﾟﾛｰﾗには対応していません。
//
//  <001>   飯塚健介        2005/08/24  呼び出し元のFormを終了するとConstが取得出来なくなるのを回避
//  <002>   飯塚健介        2005/08/24  FXｴｸｽﾌﾟﾛｰﾗｰ実装
//  <003>   飯塚健介        2005/08/24  ﾌｫｰｶｽ取得ｴﾗｰ回避
//  <004>   飯塚健介        2005/08/24  iniﾌｧｲﾙ参照内容変更
//  <005>   飯塚健介        2005/08/31  TableName,WhereStrの文字列長任意変更
//  <hirota>ﾌﾟﾗｲﾑ広田様     2005/09/01  商品対応及び日付未入力対応
//  <006>   飯塚健介        2005/09/01  範囲指定項目の未入力時に最大値及び最小値をﾊﾟﾗﾒｰﾀとしてｾｯﾄするように修正
//  <007>   飯塚健介        2005/09/13  ｺｰﾄﾞ属性対応
//  <008>   飯塚健介        2005/10/11  MasterInfoの名称を利用出来るように修正
//  <009>   飯塚健介        2005/10/11  呼び元プログラムからMasterKbnを取得出来るように修正
//  <010>   飯塚健介        2005/10/11  出力順序が一旦使用不可になると使用可にならないのを修正
//  <011>   ﾌﾟﾗｲﾑ加藤       2006/01/24  検索Expの条件修正
//  <012>   ﾌﾟﾗｲﾑ加藤       2006/01/25  検索Expの初期処理・終了処理追加
//  <013>   ﾌﾟﾗｲﾑ加藤       2006/01/25  分類登録の場合はﾊﾟﾀｰﾝでﾏｽﾀ区分を変える
//  <014>   ﾌﾟﾗｲﾑ加藤       2006/03/06  ｷｰ動作修正
//  <015>   ﾌﾟﾗｲﾑ加藤       2006/03/08  資産対応
//	<016>	ﾌﾟﾗｲﾑ加藤   	2006/03/08	区分のExp呼出に必要な条件追加(TranChar)
//                                      fnMakeWhereStrの処理を入力ﾁｪｯｸ/Expで区別
//  <017>   ﾌﾟﾗｲﾑ加藤       2006/03/10  ｺｰﾄﾞ属性が正しく反映されない不具合修正
//  <   >   ﾌﾟﾗｲﾑ加藤       2006/03/10  名寄せ親を除く～採用なしﾁｪｯｸﾎﾞｯｸｽは未対応のため非表示とする
//	<020>	長谷川耕平		2006/07/13	拡張分類対応
//	<021>	高橋功二(LEAD)  2006/09/20  工事分類の場合のwhere句で「MasterKbn」が重複してしまう不具合修正
//	<   >	長谷川耕平		2006/10/20	商品コード40桁対応（プロパティのみ変更）
//	<022>	長谷川耕平		2006/12/15	選択する項目がない場合は印刷ダイアログを直接呼び出す。
//	<HOU>	新保一馬		2008/03/07  ホウエイ対応。売上区分登録の「出荷指示伝票区分登録リスト」仕入区分登録の「入荷予定伝票区分登録リスト」はホウエイのときだけ出す。
//                                      ※非汎用的なコーディングになっています。
//                                        例「[売上区分登録]で、[出荷指示伝票区分登録リスト]はホウエイじゃなかったら出さない。」
//                                        また、最下尾のコンボの内容をカットしています。途中の内容をカットの考慮はしていません。
//	<HOU2>	藤塚正人		2008.05.30(Fri) ホウエイ区分の参照を止める。
//	<SES>	大塚匡平(LEAD)  2008.08.26(Tue) 施主ﾏｽﾀ登録から呼ばれた場合(Iniﾌｧｲﾙ = JNTCRP0070001Dlg.iniの時)は、
//                                          ｺﾝﾎﾞのItemIndexによらず、検索ｴｸｽﾌﾟﾛｰﾗにlvExpSend.DelivKbn = 4 を送る(施主ﾏｽﾀを表示するため)
//  <023>   難波江里子(Lab) 2008.09.02(Tue) 終了コード検索EXPの絞込み条件に、「開始コード以上」を追加 SRBNo.GWY-0138
//  <024>   T.Miyagi(RIT)   2008.10.31(Fri) 工事登録から呼ばれた場合、契約連動区分の採用/不採用で出力パターンを分ける
//	<BLNO>	倉持  剛		2009.05.22(Fri) ﾏｽﾀ区分が85の場合は簡略名称をｾｯﾄしない
//	<1815>  倉持  剛		2009.08.07(Fri) MEMの「EDCODE」の桁数を「STCODE」と同じ桁数に修正いたしました。20→40(Gali1815)
//	<    >  新保一馬		2010.03.29(Mon) 範囲指定グループパネルの下線が見えなかった件を修正
//											グリッドの見た目を標準規約に従った。(裏にあるパネルのプロパティを調整)
//  <025>   K.Katou(PRIME)	2011.06.15(Wed)	<024>で選択したパターンの抽出条件が反映されなくなっていた
//
//  =========================== ↓Ver4.05差分 アディスミューズ対応 ============
//
//	<2255>	吉田 健吾		2011.11.17(Thu) アディスミューズ対応、印刷レイアウトにＭＬ型を追加する。
//
//=============================================================================
unit JNTPDlgPrj;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, VCL.ExtCtrls, Db, FireDAC.Comp.Client, Buttons, Calendar, DBCGrids, Mask, DBCtrls,
  Spin, Grids, DBGrids, ComCtrls,
  dxGrClms, dxTL, dxDBGrid, dxCntner, dxmdaset, dxGrClEx,
  MJSLabel, MJSDBCtrlGrid, MJSCheckBox, MJSPageControl, MJSEdits, MjsPrnSupportu,
  MjsQuery, MJSBitBtn, MJSSpeedButton, MJSPanel,

  MjsDBModuleu, MjsPrnDlgu, MjsPreviewIFu, MjsCommonu, MjsDispCtrl,

  JNTCommonu,JNTFuncU,  //<002>

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobalPrj,
  MJSComboBox,JNTCRP018001Commonu, MJSStrctrl, System.AnsiStrings;

const//<022>
	WM_AUTO	= WM_APP + 10;
    CompNmCount = 12;  //<TAX> ADD
type
{$include JNTSelSubInterface.inc}

//<TAX> DEL  TCompNm = array[0..9] of String;
  TCompNm = array[0..CompNmCount-1] of String;   //<TAX> ADD

  TFrmJNTPDialog = class(TForm)
    PnlHrader           : TMPanel;
    PnlDetail           : TMPanel;
    PnlFooter           : TMPanel;
    DatePnl1            : TMPanel;
    PnlGrid             : TMPanel;
    fPatternCap         : TMLabel;
    fOrderCap1          : TMLabel;
    fDateCap1           : TMLabel;
    KARA1               : TMLabel;
    fSDATE1             : TMDateEdit;
    fEDATE1             : TMDateEdit;
    fPattern            : TMComboBox;
    fORDER1             : TMComboBox;
    cbShokei            : TMCheckBox;
    cbTemplate          : TMCheckBox;
    GroupBox1           : TGroupBox;
    GroupBox3           : TGroupBox;
    Bevel1              : TBevel;
    DS                  : TDataSource;
    dxMdMain            : TdxMemData;
    dxMdMainRGNAME      : TStringField;
    dxMdMainRGCODE      : TIntegerField;
    dxMdMaindmyRgCode   : TIntegerField;
    dxMdMainCAPTION     : TStringField;
    dxMdMainSTCODE      : TStringField;
    dxMdMainSTNAME      : TStringField;
    dxMdMainEDCODE      : TStringField;
    dxMdMainEDNAME      : TStringField;
    dxMdMainTABLENAME   : TStringField;
    dxMdMainKARA        : TStringField;
    dxMdMainShortName   : TStringField;
    dxMdMainMasterKbn   : TSmallintField;
    dxMdMainModulKbn    : TSmallintField;
    dxMdMainPatternNo   : TSmallintField;
    dxMdMainCodeAttr    : TSmallintField;
    dxMdMainCodeDigit   : TSmallintField;
    dxMdMainWhereStr    : TStringField;
    dxMdRange           : TdxMemData;
    dxGridHani          : TdxDBGrid;
    colCaption          : TdxDBGridMaskColumn;
    colRGCODE           : TdxDBGridLookupColumn;
    colRGNAME           : TdxDBGridMaskColumn;
    colSTCODE           : TdxDBGridButtonColumn;
    colSTNAME           : TdxDBGridMaskColumn;
    colKARA             : TdxDBGridMaskColumn;
    colEDCODE           : TdxDBGridButtonColumn;
    colEDNAME           : TdxDBGridMaskColumn;
    sbOk                : TMBitBtn;
    sbCancel            : TMBitBtn;
    SpnBtnfSDATE1       : TSpinButton;
    SpnBtnfEDATE1       : TSpinButton;
    cbNayoseOya: TMCheckBox;
    cbNayoseKo: TMCheckBox;
    cbUseTokui: TMCheckBox;
    cbUseSiire: TMCheckBox;
    cbUseNashi: TMCheckBox;
    dxMdMainTranChar: TStringField;
    fDateCap2: TMLabel;
    fSDATE2: TMDateEdit;
    KARA2: TMLabel;
    fEDATE2: TMDateEdit;
    SpnBtnfSDATE2: TSpinButton;
    SpnBtnfEDATE2: TSpinButton;

    procedure   FormCreate                  (Sender: TObject);
    procedure   FormClose                   (Sender: TObject; var Action: TCloseAction);
    procedure   FormCloseQuery              (Sender: TObject; var CanClose: Boolean);
    procedure   FormKeyDown                 (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   FormActivate                (Sender: TObject);
    procedure   FormShow                    (Sender: TObject);
    procedure   sbOkClick                   (Sender: TObject);
    procedure   sbCancelClick               (Sender: TObject);
    procedure   dxMdMainBeforeScroll        (DataSet: TDataSet);
    procedure   dxMdMainCalcFields          (DataSet: TDataSet);
    procedure   dxGridHaniChangeNode        (Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure   dxGridHaniEnter             (Sender: TObject);
    procedure   dxGridCODEEditButtonClick   (Sender: TObject);
    procedure   dxGridHaniExit              (Sender: TObject);
    procedure   dxMdMainBeforePost          (DataSet: TDataSet);
    procedure   dxGridHaniMouseDown         (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure   OnEnterGridHani             (Sender: TObject);
    procedure   OnKeyDownGridHani           (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   colRGCODECloseUp            (Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure   fPatternChange              (Sender: TObject);
    procedure   dxGridHaniKeyPress          (Sender: TObject; var Key: Char);   //<007>
//  procedure   fnSpnBtnUp                  (Sender: TObject);
//  procedure   fnSpnBtnDown                (Sender: TObject);
  private

    { Private 宣言 }
    uvDtFldNm       :   String;		                // 範囲指定する項目（日付用）
    uvIndInput      :   Boolean;		            // 必須入力区分	　（日付用）
    Qry             : 	TFDQuery;		                // Query
    DmqMasterInfo   :   TMQuery;
    MQCstmChk       :   TMQuery;                    // <HOU>
    uvExpOpenSW     :   Boolean;                    // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(TRUE:OPEN FALSE:CLOSE)
    uvInitFlg       :   Boolean;                    // ﾌｫｰﾑ初期設定ﾌﾗｸﾞ
    m_Hani          :   TJNTHani;
    m_pHani         :   Pointer;
	m_pSystemArea   :   ^rcSYSTEMAREA;
    m_pCommonArea   :   ^rcCommonArea;
	m_MDataModule   :   TMDataModulef;
//    m_eJobNo        :   Extended;                   // ｼﾞｮﾌﾞNO
    m_bIsGrdFocus   :   Boolean;
    m_iHaniGen      :   Integer;                    // 前回変更時の範囲
    m_iHaniZen      :   Integer;                    // 現在の範囲
	uvDataFormat    :	Integer;                    // 日付ﾌｫｰﾏｯﾄ
//	uvJuniMin,
//	uvJuniMax       :   Extended;                   //入力ﾁｪｯｸ用
	ucMoveComp      :   TCompNm;
    AOwner          :   TComponent;

    m_FirstFlg      :   Boolean;        //<003>     // 初回IniLoad時:True
	m_FirstCtl  	:   TWinControl;	//<003>	    // 先頭ｺﾝﾄﾛｰﾙSetFocus用

    m_IsHOUEI       :   Boolean;        //<HOU>True:ホウエイです。 False:ホウエイでない。
// <024> ADD start
    m_KojiFlg       :   Boolean;
    m_iKbn17        :   Integer;
// <024> ADD end
	m_aryPtnNo		:	array of Integer;			// <025>パターンNOのリスト(コンボindexとNOが一致しないケース用）
    m_arySyosai : array of Integer;                 // 詳細リストのインデックスを保持  <TAX> ADD

//    procedure AppMessage        (var Msg: TMsg; var Handled: Boolean);
    function    fnDateFldChk            (Sender: TObject; AllChkMode: Boolean): Boolean;
    function    fnCodeFldChk            (Sender: TObject; AllChkMode: Boolean): Boolean;
	function    fnMakeDlgFields         (): Boolean;
	procedure   fnSetPara               ();
	procedure   fnMoveNextColumn        ();
	procedure   fnMoveBeforeColumn      ();
	procedure   fnCallExplorer          (Sender: TObject);
    function    fnCheckInputGridField   (Sender: TObject): Boolean;
    procedure   fnMoveColumn            (Key: Word; Shift: TShiftState);
	procedure   fnChangeNode            ();
    function    fnGetMastrInfo          (nMasterKBN: Integer; var nCodeAttr, nCodeDigit: Integer): Boolean;
//<002>    function    fnJNTNameGet            (TNM, SNM, Code: String; MasKbn,Attr: Integer; var rNmk: String): Boolean;
    function    fnJNTNameGet            (TNM, SNM, Code,WhereStr: String; MasKbn,Attr: Integer; var rNmk: String): Boolean;
    function    fnGetRangeTable         (i:Integer):String;              //<001>
//    function    fnMakeWhereStr          (cMem : TdxMemData) :String;              //<002><016>
    function    fnMakeWhereStr          (cMem : TdxMemData; bExp: Boolean) :String; //<016>引数追加
//<022>
	procedure	WM_AutoClose                 (var Msg: TMessage); message WM_AUTO;

    function    fnGetKeiRenKbn(nMasterKBN: Integer; var nKojKbn: Integer): Boolean;    // <024>

	function    IsCustomSel(KBN:String):Boolean; 	//<2255>
	function    fnSelCostmCheck(S:String;SELCSTM:String):Boolean; 	//<2255>
  public
    { Public 宣言 }
    function    Main                    (): Integer;
	procedure   CMChildKey              (var Msg: TWMKey); message CM_CHILDKEY;
    constructor Create                  (Owner:TComponent; pHani: Pointer); reintroduce; overload;

  end;

var
	FrmJNTPDialog: TFrmJNTPDialog;

const
//<001>    RangeTable: array[0..1] of String = (' 全件', ' 範囲');

    ucDlg   = 1;            //<002>
    ucExp   = 2;            //<002>
    ucReplaceNM = 'NAME';   //<008> *** 問題があれば名称を変更して下さい ***

//<020>
	//拡張分類のある分類の基本ｺｰﾄﾞ
	ucKakucho : Array[0..2] of Integer = (401,411,421);
    {商品分類}
    ucShKbn : Array[0..6] of Integer = (401,402,403,404,405,801,802);
    {得意先分類}
    ucTkKbn : Array[0..6] of Integer = (411,412,413,414,415,811,812);
    {仕入先分類}
    ucSiKbn : Array[0..6] of Integer = (421,422,423,424,425,821,822);

//↓<HOU>
    ucHOUKBN       = 'HE01';
    ucKBNTOROKU_U  = 'JNTCRP027000UDlg.ini';
    ucKBNTOROKU_S  = 'JNTCRP027000SDlg.ini';
    ucSJ_LIST      = '出荷指示伝票区分登録リスト';
    ucNJ_LIST      = '入荷予定伝票区分登録リスト';
//↑<HOU>

    ucSESYU_INI    = 'JNTCRP0070001Dlg.ini';    //<SES>

    ucKOJI_INI     = 'JNTCRP018001Dlg.ini';    //<024>

    DateCount = 2;  // <TAX> ADD

    implementation

{$R *.DFM}
uses
    JNTSelError, IniFiles;

var
    //内部的に使用する項目
    uvOK_Flg    :	Boolean;

//=============================================================================
//  Create:         範囲選択ﾀﾞｲｱﾛｸﾞの作成
//
//    ParamPARAM    pHani   範囲ﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
//				    bPrint  [直接印刷する]を有効にする（TRUE:印刷用, FALSE:表示用）
//    Return        結果    TRUE or FALSE
//=============================================================================
constructor TFrmJNTPDialog.Create(Owner:TComponent; pHani: Pointer);
begin

    m_Hani          :=  TJNTHani(pHani^);
    m_pHani         :=  pHani;
	m_pSystemArea   :=  m_Hani.pMjsAppRec^.m_pSystemArea;
 	m_pCommonArea   :=  m_Hani.pMjsAppRec^.m_pCommonArea;
    m_MDataModule   :=  TMDataModulef(m_Hani.pMjsAppRec^.m_pDBModule^);
    m_bIsGrdFocus   :=  FALSE;
    AOwner          :=  Owner;

    m_FirstFlg      :=  True;  //<003>

    inherited Create( AOwner );

end;

//-----------------------------------------------------------------------------
//  Main()
//      ﾒｲﾝ処理
//      PARA    : TuvHani   : ﾊﾟﾗﾒｰﾀ受け渡し用構造体
//				  bPrint	: [直接印刷する]を有効にする（TRUE:印刷用、FALSE:表示用）
//      RETURN  : -1        : ｴﾗｰ
//                 0        : ｷｬﾝｾﾙ
//                 1        : 通常OK
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.Main(): Integer;
var
	lvStr   :   String;
begin

	uvOK_Flg    :=  FALSE;

    // iniﾌｧｲﾙの存在をﾁｪｯｸする
    if ( FileExists(m_Hani.pvDlgIniFile) = FALSE ) then
    begin
        // 存在しないのでｴﾗｰ
	    lvStr   :=  '範囲指定用情報ﾌｧｲﾙが存在しません。' + #13 + #10
                +   'ｼｽﾃﾑ管理者に連絡してください。';
        MessageBeep(MB_OK);
		MjsMessageBox(AOwner, lvStr, mjError, mjDefOk);
        Result  :=  -1;
        Exit;
    end;

    // === 範囲指定後([OK]or[ｷｬﾝｾﾙ]) ===//
    // [ｷｬﾝｾﾙ]
    if ( uvOK_Flg <> TRUE ) then
    begin
	    Result  :=  0;
        Exit;
    end;

    Result  :=  1;	//通常処理

end;
{
//-----------------------------------------------------------------------------
//  メッセージの捕捉処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
    CompoName: string;
begin
    if Screen.ActiveForm.Name <> Self.Name Then Exit;

    CompoName := TComponent(ActiveControl).Name;

    if Msg.message = wm_KEYDOWN then
    begin
        case Msg.wParam of

        //Returnキーを捕捉する
        VK_RETURN: begin

                //Shiftキー等が押されている場合は無視する
                if JNTSelXShiftKeyChk2 then Exit;

        	end;

        //Tabキーを捕捉する
        VK_TAB: begin

                //Shiftキー等が押されている場合は無視する
                if JNTSelXShiftKeyChk2 then Exit;

				//Returnｷｰ扱い
                if not(TComponent(ActiveControl) is TMBitBtn     ) and
                   not(TComponent(ActiveControl) is TMCheckBox   ) and
                   not(TComponent(ActiveControl) is TMPageControl) then
	                Msg.wParam := VK_RETURN;

        	end;
        end;
    end;
end;
}
//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ <BPL>
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.CMChildKey(var Msg: TWMKey);
var
//    lvCompoName :   String;               // <014>ｺﾒﾝﾄｱｳﾄ
	cShiftState	  : TShiftState;            // <014>
begin
// <014>↓追加
					                        // Shiftｷｰの取得
	cShiftState	:= KeyDataToShiftState (Msg.KeyData);

// <014>↓ｺﾒﾝﾄｱｳﾄ
{
    // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
	lvCompoName :=  '';

    if ( Screen.ActiveControl <> nil ) then
        lvCompoName := TComponent(Screen.ActiveControl).Name;

    // O.K.ﾎﾞﾀﾝ
    if ( lvCompoName = 'sbOk' ) then
    begin
        //  Shiftキー等が押されていない場合は無視する
        // (この処理後のVK_TAB をﾊﾞｯｸﾀﾌﾞとして使用するため)
        if ( Msg.CharCode = VK_TAB ) and ( JNTSelXShiftKeyChk2 = FALSE ) then
            Exit;

        case Msg.CharCode of
            VK_LEFT,
            VK_UP,
            VK_TAB:
            begin
                // 前ﾌｨｰﾙﾄﾞへ移動
                fnMoveBeforeColumn;
                Abort;
            end;
        end;

        case Msg.CharCode of
            VK_RIGHT,
            VK_DOWN:
            begin
                // 次ﾌｨｰﾙﾄﾞへ移動
                fnMoveNextColumn;
                Abort;
            end;
        end;
    end;
}// <014>↑
{
    // ﾀﾌﾞ
    if ( lvCompoName = 'TagCtrl') then
    begin
        // <02>
        if ((Msg.CharCode = VK_TAB) and (JNTSelXShiftKeyChk2 = FALSE) or
            (Msg.CharCode = VK_RETURN)                        ) then
        begin
            if (TagCtrl.ActivePage = tbHani) then
            begin
                // 次ﾌｨｰﾙﾄﾞへ移動  他の処理等の絡みにより順番がおかしい？？
                dxGridHani.SetFocus;
                dxMdMain.First;
                dxGridHani.Columns[1].Field.FocusControl;
                // 出力範囲ｺｰﾄﾞ取得
                m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;
                m_iHaniZen := m_iHaniGen;
                Abort;
            end;
        end
        else
        begin
            if (Msg.CharCode = VK_TAB) then
            begin
                // 前ﾌｨｰﾙﾄﾞへ移動
                fnMoveBeforeColumn;
                Abort;
            end;
        end;
    end;
}
// <014>↓ｺﾒﾝﾄｱｳﾄ
{
    // ｷｬﾝｾﾙﾎﾞﾀﾝ
    if ( lvCompoName = 'sbCancel' ) then
    begin
        //  Shiftキー等が押されていない場合は無視する
        // (VK_TAB をﾊﾞｯｸﾀﾌﾞとして使用するため)
        if ( Msg.CharCode = VK_TAB ) and ( JNTSelXShiftKeyChk2 = FALSE ) then
        begin
            // 印刷ﾊﾟﾀｰﾝが使用不可であればﾀﾌﾞへﾌｫｰｶｽを移す
(*
            if ( fPattern.Enabled = FALSE ) then
                fORDER1.SetFocus
            else
                fPattern.SetFocus;
*)
            m_FirstCtl.SetFocus;        // 先頭ｺﾝﾄﾛｰﾙへ
            Abort;
        end
        else
        begin
            if ( Msg.CharCode = VK_TAB ) then
            begin
                // 前ﾌｨｰﾙﾄﾞへ移動
                sbOk.SetFocus;
                Abort;
            end;
        end;

        case Msg.CharCode of
            VK_RIGHT,
            VK_DOWN:
            begin
                // 印刷ﾊﾟﾀｰﾝが使用不可であればｸﾞﾘｯﾄﾞへﾌｫｰｶｽを移す
                if ( fPattern.Enabled = FALSE ) then
                begin
                    Abort;
                end
                else
                    fPattern.SetFocus;

                Abort;

            end;
        end;

        case Msg.CharCode of
            VK_LEFT,
            VK_UP,
            VK_TAB:
            begin
                // 前ﾌｨｰﾙﾄﾞへ移動
                fnMoveBeforeColumn;
                Abort;
            end;
        end;
    end;

    // 印刷ﾊﾟﾀｰﾝ
    if ( lvCompoName = 'fPattern' ) then
    begin
        if ( Msg.CharCode = VK_TAB ) and ( JNTSelXShiftKeyChk2 = FALSE ) then
            Exit
        else

        if ( Msg.CharCode = VK_TAB ) then
        begin
            sbCancel.SetFocus;
            Abort;
        end;
    end;
}// <014>↑
// <014>↓追加
                                            // ｸﾞﾘｯﾄﾞでの動きはFormKeyDownに任せる
    if Screen.ActiveControl is TdxDBGrid then
        Exit;

    // ｸﾞﾘｯﾄﾞ以外のｷｰ動作はここでまとめて制御
    case Msg.CharCode of
      VK_LEFT:                          // ←ｷｰ
        begin
            MjsPrevCtrl(Self);
            Abort;
        end;
      VK_RIGHT:                         // →ｷｰ
        begin
            MjsNextCtrl(Self);
            Abort;
        end;
      VK_UP:                            // ↑ｷｰ
        begin
            if not (Screen.ActiveControl is TMComboBox) then
            begin
                MjsPrevCtrl(Self);
                Abort;
            end;
        end;
      VK_DOWN:                          // ↓ｷｰ
        begin
            if not (Screen.ActiveControl is TMComboBox) then
            begin
                MjsNextCtrl(Self);
                Abort;
            end;
        end;
      VK_RETURN:                		// Enterｷｰ
        begin
                                        // ﾎﾞﾀﾝではｺﾝﾄﾛｰﾙに任せる
                                        // DateEditはFormKeyDownに任せる
		   	if (not (Screen.ActiveControl is TMBitBtn)) and
                (not (Screen.ActiveControl is TMDateEdit)) then
    		begin
	    		MjsNextCtrl(Self);
		   		Abort;
    		end;
	    end;
      VK_TAB:                			// Tabｷｰ
	   	begin
           	if (cShiftState = []) then
            begin
	  			MjsNextCtrl(Self);
                Abort;
            end
            else if (cShiftState = [ssShift]) then
            begin
               	MjsPrevCtrl(Self);     	// Shift + Tab
	      		Abort;
            end;
	   	end;
      VK_END:                           // ENDｷｰ
	   	begin
	      	sbOK.SetFocus;              // OKﾎﾞﾀﾝへ移動
      		Abort;
	   	end;
      //VK_ESCAPE:                      // ESCｷｰ→これだけFormKeyDown

    end;
// <014>↑
end;

//-----------------------------------------------------------------------------
//  FormCreate()
//      ﾌｫｰﾑ構築処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormCreate(Sender: TObject);
//var
//	Ret :   Boolean;
begin

    Main();

	// ｶｰｿﾙ移動用
	ucMoveComp[0]   := 'fPattern';
    ucMoveComp[1]   := 'fORDER1';
    ucMoveComp[2]   := 'fSDATE1';
    ucMoveComp[3]   := 'fEDATE1';
//<TAX> MOD St
    ucMoveComp[4]   := 'fSDATE2';
    ucMoveComp[5]   := 'fEDATE2';
    ucMoveComp[6]   := 'cbShokei';
    ucMoveComp[7]   := 'cbDelete';
    ucMoveComp[8]   := 'cbTemplate';
    ucMoveComp[9]   := 'dxGridHani';
    ucMoveComp[10]   := 'sbOk';
    ucMoveComp[11]   := 'sbCancel';
{
    ucMoveComp[4]   := 'cbShokei';
    ucMoveComp[5]   := 'cbDelete';
    ucMoveComp[6]   := 'cbTemplate';
    ucMoveComp[7]   := 'dxGridHani';
    ucMoveComp[8]   := 'sbOk';
    ucMoveComp[9]   := 'sbCancel';
}
//<TAX> MOD Ed
	//Queryの設定
    Qry :=  TFDQuery.Create( Self );
    DmqMasterInfo   :=  TMQuery.Create( Self );
    gfnJNTSelSetDbName( Qry, m_Hani.UseDb );
    gfnJNTSelSetDbName(DmqMasterInfo, m_Hani.UseDb);
//<Del10-VerUp001><D10_OwnMapRules> ST
	m_Hani.UseDb.FormatOptions.MapRules.Clear;
	m_Hani.UseDb.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

{<HOU2>↓
    //↓<HOU>
    MQCstmChk   :=  TMQuery.Create( Self );
    gfnJNTSelSetDbName(MQCstmChk, m_Hani.UseDb);

    m_IsHOUEI := False;

   	with MQCstmChk do
	begin
		try
			Close;
			SQL.Clear;
			SQL.Add('select count(*) Cnt from SELCSTM_TBL where Kbn = :pKbn');

			ParamByName('pKbn').AsString := ucHOUKBN;

			Open;

			m_IsHOUEI := (FieldByName('Cnt').AsInteger >= 1);
		finally
			Close;
		end;
	end;
    //↑<HOU>
<HOU2>↑}

//    Application.OnMessage := AppMessage;

    // ﾌｫｰﾑの初期設定を行う
    m_Hani.SelSys.gfnInzForm(self);
    fPattern.Items.Clear;
    fORDER1.Items.Clear;

//    JNTSelXClrCtrls(Self, 'f');
	uvInitFlg   :=  TRUE;

    // 各項目を設定する
    fnMakeDlgFields;

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
    MjsColorChange(
					TFrmJNTPDialog(Self),
					m_pSystemArea.SysColorB,
					m_pSystemArea.SysColorD,
					m_pSystemArea.SysBaseColorB,
					m_pSystemArea.SysBaseColorD,
					rcCOMMONAREA(m_Hani.pMjsAppRec^.m_pCommonArea^).SysFocusColor
				  );

    // ﾌｫﾝﾄをﾕｰｻﾞｰｶｽﾀﾏｲｽﾞされたﾌｫﾝﾄに変更
    MjsFontResize(TFrmJNTPDialog(Self), Pointer( m_Hani.pMjsAppRec ));

    //<003> ---St---
    if fPattern.Enabled then
        m_FirstCtl := fPattern
    else
    begin
        if fORDER1.Enabled then
            m_FirstCtl := fORDER1
        else
        begin
            if dxGridHani.Enabled then
                m_FirstCtl := dxGridHani
            else
                m_FirstCtl := sbOk;
        end;
    end;
    //<003> ---Ed---

// <012>↓
    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_Hani.pMjsAppRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);
// <012>↑

	uvInitFlg := FALSE;

end;

//-----------------------------------------------------------------------------
//  FormActivate()
//      ﾌｫｰﾑ ﾌｫｰｶｽ取得ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormActivate(Sender: TObject);
begin

    fSDATE1.Enabled := TRUE;
    fEDATE1.Enabled := TRUE;

end;

//-----------------------------------------------------------------------------
//  FormCloseQuery()
//      ﾌｫｰﾑ終了処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

    // IMEを閉じる
    Self.ImeMode := imClose;
    Self.SetIme;

    // 範囲対象ﾃｰﾌﾞﾙを閉じる
    dxMdRange.Close;
    dxMdMain.Close;

// <012>↓
    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;
// <012>↑

end;

//-----------------------------------------------------------------------------
//  FormClose()
//      ﾌｫｰﾑ終了処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    fSDATE1.Enabled := FALSE;
    fEDATE1.Enabled := FALSE;

	//Queryを開放
    if Qry <> nil then
    	Qry.Free;

    if ( DmqMasterInfo <> nil ) then
        DmqMasterInfo.Free();

{<HOU2>↓
    //↓<HOU>
    if ( MQCstmChk <> nil ) then
    begin
        MQCstmChk.Free();
    end;
    //↑<HOU>
<HOU2>↑}

    // ﾌｫｰﾑのﾒﾓﾘを解放する
    Action := caFree;
    Release;
    FrmJNTPDialog := nil;

end;

//-----------------------------------------------------------------------------
//  sbOkClick()
//      OKﾎﾞﾀﾝｸﾘｯｸ処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.sbOkClick(Sender: TObject);
begin

    // 未更新のものは更新する
    if ( dxMdMain.State = dsEdit ) then dxMdMain.Post;

	//ｴﾗｰﾁｪｯｸ
    if ( fnDateFldChk(Self, TRUE) = FALSE ) then Exit;	// 日付ﾁｪｯｸ

	// ﾘﾀｰﾝ用ﾊﾟﾗﾒｰﾀを設定する
	fnSetPara;
    TJNTHani(m_pHani^) := m_Hani;

    // [OK]が押されたﾌﾗｸﾞ
	uvOK_Flg := TRUE;

    // 選択値をｾｯﾄしてﾌｫｰﾑを閉じる
    ModalResult := mrOk;

end;

//-----------------------------------------------------------------------------
//  sbCancelClick()
//      ｷｬﾝｾﾙﾎﾞﾀﾝｸﾘｯｸ処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.sbCancelClick(Sender: TObject);
begin

    Close;

end;

//-----------------------------------------------------------------------------
//  dxMdMainBeforePost()
//      更新前処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxMdMainBeforePost(DataSet: TDataSet);
begin

	if ( uvInitFlg = TRUE ) then Exit;

    // ﾒﾓﾃﾞｰﾀのBeforePostでもこの関数を実行
    if not fnCheckInputGridField(TComponent(Screen.ActiveControl)) then
    begin
        Beep;
        Abort;
    end;

	if ( fnCodeFldChk(Self, TRUE) = FALSE ) then
	begin
        Beep;
		Abort;
	end;

end;

//-----------------------------------------------------------------------------
//  dxMdMainBeforeScroll()
//      ｽｸﾛｰｽ前処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxMdMainBeforeScroll(DataSet: TDataSet);
begin

    // ﾃﾞｰﾀｾｯﾄがEditﾓｰﾄﾞならPost
	with DataSet do
    begin
		if ( State = dsEdit ) then Post;
    end;

end;

//-----------------------------------------------------------------------------
//  FormKeyDown()
//      ﾌｫｰﾑのｷｰｲﾍﾞﾝﾄ
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    lvCompName  :   String;
    lvColName   :   String;
//    iRet        :   Integer;
begin

    // ｱｸﾃｨﾌﾞｺﾝﾎﾟｰﾈﾝﾄの名称を取得する
    lvCompName := TComponent(ActiveControl).Name;

    // ESCｷｰが押下された場合は終了
    if  Key = VK_ESCAPE  then
    begin
        Close;                                              // 終了
        Exit;
    end;

    // F1ｷｰの場合
    if ( Key        = VK_F1        ) and
       ( lvCompName = 'dxGridHani' ) then
    begin
        OnKeyDownGridHani(Sender,Key,Shift);
    end;

    // ｸﾞﾘｯﾄﾞ内での移動
    if ( Key = VK_RETURN) or   // [TAB] [RETURN]
       ((Key = VK_RETURN) and (JNTSelXShiftKeyChk2 = FALSE)) or  // [ﾊﾞｯｸTAB]
       ( Key = VK_RIGHT ) or   // [RIGHT   ]
       ( Key = VK_LEFT  ) or   // [LEFT    ]
       ( Key = VK_UP    ) or   // [UP      ]
       ( Key = VK_DOWN  ) or   // [DOWN    ]
       ( Key = VK_PRIOR ) or   // [PageUp  ]
       ( Key = VK_NEXT  ) then // [PageDown]
    begin
        if ( lvCompName = 'dxGridHani' ) then
        begin
            //ｱｸﾃｨﾌﾞなｶﾗﾑを取得する
            lvColName := dxGridHani.Columns[dxGridHani.FocusedColumn].Name;
            if ( lvColName  = 'colRGCODE' ) then
            begin
                m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;

                if ( m_iHaniZen <> m_iHaniGen ) then
                begin
                	case m_iHaniGen of
                		0: // 全件
                		begin
                    		// 表示されているｺｰﾄﾞと名称をｸﾘｱ
		                    dxGridHani.CloseEditor;
							dxMdMain.Edit;
		                    dxMdMain.FieldByName('STCODE').AsString := '';
		                    dxMdMain.FieldByName('STNAME').AsString := '';
		                    dxMdMain.FieldByName('EDCODE').AsString := '';
		                    dxMdMain.FieldByName('EDNAME').AsString := '';
		                    dxGridHani.Columns[1].Field.FocusControl;
                		end;
                		1: // 範囲
                		begin

                		end;
                	end;
                end;

                m_iHaniZen := m_iHaniGen;
            end;

			if	( lvColName  = 'colSTCODE' ) or			    // 開始ｺｰﾄﾞ
				( lvColName  = 'colEDCODE' ) then			// 終了ｺｰﾄﾞ
			begin
				// ﾌﾘｰｺｰﾄﾞで編集中の時は、動きを捕捉しない。
				if	((Key = VK_RIGHT) or (Key = VK_LEFT)) and
					(dxMdMain.FieldByName('CodeAttr').AsInteger = 2) and		// ｺｰﾄﾞ属性 = ﾌﾘｰ？
					(dxGridHani.State = tsEditing) then
				begin
					Exit;
				end;
			end;
        end;
    end;

    // 範囲Grid内でENDｷｰが押下された場合はOKﾎﾞﾀﾝへﾌｫｰｶｽを移動する
    if ( lvCompName = 'dxGridHani' ) and ( Key = VK_END ) then
    begin
        sbOk.SetFocus;
        Abort;
    end;

    // ***** RETURNｷｰの補足 *****
    if (Key         = VK_RETURN   ) or
       ((lvCompName = 'dxGridHani') and (Key = VK_TAB) and (Shift = [])) or  // <014>
       ((lvCompName = 'dxGridHani') and (Key = VK_RIGHT)) then
    begin

		if Copy(lvCompName, 1, 1) = 'f' then
        begin
            // 入力内容のﾁｪｯｸ
            if ( fnDateFldChk(ActiveControl, FALSE) = FALSE ) then
                Exit;
        end
        else if ( lvCompName = 'dxGridHani' ) then
        begin
            // ｺｰﾄﾞの桁数を取得する
            colSTCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;
            colEDCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;

(*
           //<007> ----- St -----
            if dxMdMain.FieldByName('CodeAttr').AsInteger <= 1 then
            begin
                colSTCODE.Alignment := taRightJustify;
                colEDCODE.Alignment := taRightJustify;
            end else
            begin
                colSTCODE.Alignment := taLeftJustify;
                colEDCODE.Alignment := taLeftJustify;
            end;
           //<007> ----- Ed -----
*)
            // ｴﾗｰﾁｪｯｸ
            if ( fnCodeFldChk(TComponent(Screen.ActiveControl), FALSE) = FALSE ) then
	            Abort;
        end;

        // 次ﾌｨｰﾙﾄﾞへ移動
        fnMoveNextColumn;
        Abort;
    end;

// <014>↓
//    if (Shift = [ssShift] ) and (Key = VK_TAB ) then
    if ((Shift = [ssShift] ) and (Key = VK_TAB )) or
        (Key = VK_LEFT ) then
// <014>↑
    begin
        //前ﾌｨｰﾙﾄﾞへ移動
		fnMoveBeforeColumn;
        Abort;
    end;

    //***** その他ｷｰの補足 *****
    case Key of
        VK_UP:  JNTSelXKbdHndl(Sender, Key, Shift);               // 前ﾉｰﾄﾞへ移動
    end;

end;

//-----------------------------------------------------------------------------
//  fnDateFldChk()
//      ﾍｯﾀﾞｰ入力項目のﾁｪｯｸ
//      PARAM   : Sender        :
//                AllChkMode    : TRUE  全ﾍｯﾀﾞｰﾌｨｰﾙﾄﾞﾁｪｯｸ
//                                FALSE ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙのﾁｪｯｸ
//      RETURN  :
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnDateFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompName  :   String;
    lvTDEdt,
    lvTDEdt2    :   TMDateEdit;
    {lvLp,} lvInt :   Integer;
//    lvErrFlg    :   Boolean;

//    St_YMD	    :	TDateTime; // 開始年月日
//    Ed_YMD	    :	TDateTime; // 終了年月日
//    St_YM	    :	Integer;   // 開始年月
//    Ed_YM	    :	Integer;   // 終了年月
begin

    Result  :=  TRUE;

    // 全件ﾁｪｯｸの時はｺﾝﾎﾟｰﾈﾝﾄの数だけ再帰する
    if ( AllChkMode = TRUE ) then
    begin
        // 該当ﾊﾟﾈﾙが非表示ならﾊﾟｽ
        if ( DatePnl1.Visible = FALSE ) then Exit;

        // 開始ｺｰﾄﾞをﾁｪｯｸする
        lvTDEdt := TMDateEdit(JNTSelXFindCtrl(Self, 'fSDATE1'));
        if ( fnDateFldChk(lvTDEdt, FALSE) = FALSE ) then
        begin
            Result := FALSE;
            Exit;
        end;

        // 終了ｺｰﾄﾞをﾁｪｯｸする
        lvTDEdt := TMDateEdit(JNTSelXFindCtrl(Self, 'fEDATE1'));
        if ( fnDateFldChk(lvTDEdt, FALSE) = FALSE ) then
        begin
            Result := FALSE;
            Exit;
        end;

        // ｴﾗｰﾃﾞｰﾀ無し
       	Result  :=  TRUE;
    	Exit;
    end;

    // 初期ﾁｪｯｸ (日付のﾁｪｯｸ以外)
    if ( (TComponent(Sender) is TMDateEdit) = FALSE ) then Exit;

    // ｺﾝﾄﾛｰﾙを設定する
    lvTDEdt := TMDateEdit(Sender);

    // 非表示ならｽﾙｰ
    if ( lvTDEdt.Visible = FALSE ) then Exit;

    // ｴﾗｰﾁｪｯｸ
    with lvTDEdt do
    begin
    	// 未入力ならOK(必須入力を除く)
	    lvInt := StrToInt(Copy(Name, Length(Name), 1));
        if Value = 0 then
        begin
			//050901 hirota >>
			// 未入力の場合はデフォルト(1900/01/01-2099/12/31)がいいなぁ
			{
        	// 入力必須の時はｴﾗｰ処理
	        if ( uvIndInput = TRUE ) then
            begin
                Result  :=  FALSE;
                //「入力必須です」
                gfnJNTSelErrDlgx(Self, 52001);
                SetFocus;
            end;
			//050901 hirota <<
			}
            Exit;
        end;

    	// ﾌｫｰﾏｯﾄごとにﾁｪｯｸ
    	if ( DateInputType = diYMD ) then
        begin
        	// 年月日
            if ( AsDateTime = xcoZeroDate ) then
            begin
                Result  :=  FALSE;
                //「日付に誤りがあります」
                gfnJNTSelErrDlgx(Self, 52501);
                SetFocus;
                Exit;
            end;

            // 範囲
            if ( Copy(Name, 2, 1) <> 'S' ) then
            begin
            	//終了日ﾁｪｯｸ

            	//大小ﾁｪｯｸ（開始日付を取得）
	            lvCompName  :=  'fS' + Copy(Name, 3, Length(Name) - 2);
                lvTDEdt2    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvCompName));
                // ﾁｪｯｸ
                if ( lvTDEdt2.Value <> 0 ) and
                   ( AsDateTime < lvTDEdt2.AsDateTime ) then
                begin
                    Result := FALSE;
                    //「日付に誤りがあります」
	                gfnJNTSelErrDlgx(Self, 52501);
                    SetFocus;
                    Exit;
                end;
            end;
        end
        else if ( DateInputType = diYM ) then
        begin
        	// 年月
            if ( gfnJNTSelYMChk(AsIntYM) = FALSE ) then
            begin
                Result := FALSE;
                SetFocus;
                Exit;
            end;

            // 範囲
            if ( Copy(Name, 2, 1) <> 'S' ) then
            begin
            	// 終了日ﾁｪｯｸ

            	// 大小ﾁｪｯｸ（開始日付を取得）
	            lvCompName  :=  'fS' + Copy(Name, 3, Length(Name) - 2);
                lvTDEdt2    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvCompName));
                //ﾁｪｯｸ
                if ( lvTDEdt2.Value <> 0 ) and
                   ( AsIntYM < lvTDEdt2.AsIntYM ) then
                begin
                    Result := FALSE;
                    gfnJNTSelErrDlgx(Self, 52004);
                    SetFocus;
                    Exit;
                end;
            end;
        end
        else if ( DateInputType = diY ) then
        begin
        end
        else
        begin
        	//ｴﾗｰ（原因不明）
            Result := FALSE;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  fnCodeFldChk()
//      ｺｰﾄﾞ入力項目のﾁｪｯｸ
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnCodeFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompName, lvEdit : String;
    strCode            : String;            // <017>
begin

    Result  :=  TRUE;

    // 入力ｶﾗﾑの名称を取得
    lvCompName  :=  dxGridHani.Columns[dxGridHani.FocusedColumn].Name;

    // 入力した値を取得
    lvEdit  :=  '';
    if ( AllChkMode = FALSE ) then
    begin
        lvEdit  :=  dxGridHani.EditingText;

        if ( dxGridHani.State <> tsEditing ) then
            lvEdit := dxGridHani.Columns[dxGridHani.FocusedColumn].Field.AsString;
    end;

    dxMdMain.Edit;

    // 開始ｺｰﾄﾞ
    if ( AllChkMode = TRUE ) or ( lvCompName = 'colSTCODE' ) then
    begin
        if ( AllChkMode = TRUE ) then
            lvEdit  :=  colSTCODE.Field.AsString;

        // 数値ﾌｨｰﾙﾄﾞの時
        if ( dxMdMain.FieldByName('CodeAttr').AsInteger = 0 ) or
           ( dxMdMain.FieldByName('CodeAttr').AsInteger = 1 ) then
        begin
            if ( Trim(lvEdit) <> '' ) then
            begin
                // 数値ﾁｪｯｸ
                if ( JNTSelXIsNum(Trim(lvEdit)) = FALSE ) then
                begin
                    // 文字が混入している時はｴﾗｰ
                    Beep;
                    Result := FALSE;
                    Abort;
                    Exit;
                end;

                // 前ｾﾞﾛ有に設定する
                if ( dxMdMain.FieldByName('CodeAttr').AsInteger = 1 ) then  // <017>
                    colSTCODE.Field.AsString    :=
                        FormatFloat(StringOfChar('0', dxMdMain.FieldByName('CodeDigit').AsInteger),
                            StrToFloat(Trim(lvEdit)));

            end;
        end;

        if ( AllChkMode = FALSE ) then Exit;

    end;

    // 終了ｺｰﾄﾞ
    if ( AllChkMode = TRUE ) or ( lvCompName = 'colEDCODE' ) then
    begin
        if ( AllChkMode = TRUE ) then
            lvEdit  :=  colEDCODE.Field.AsString;

        // 数値ﾌｨｰﾙﾄﾞの時
        if ( dxMdMain.FieldByName('CodeAttr').AsInteger = 0 ) or
           ( dxMdMain.FieldByName('CodeAttr').AsInteger = 1 ) then
        begin
            if ( Trim(lvEdit) <> '' ) then
            begin
                // 数値ﾁｪｯｸ
                if ( JNTSelXIsNum(Trim(lvEdit)) = FALSE ) then
                begin
                    // 文字が混入している時はｴﾗｰ
                    Beep;
                    Result := FALSE;
                    Abort;
                    Exit;
                end;

	            // 前ゼロありに設定する
                if ( dxMdMain.FieldByName('CodeAttr').AsInteger = 1 ) then  // <017>
                    colEDCODE.Field.AsString    :=
                        FormatFloat(StringOfChar('0', dxMdMain.FieldByName('CodeDigit').AsInteger),
                            StrToFloat(Trim(lvEdit)));

                // 大小ﾁｪｯｸ
                if ( JNTSelXStrToFloat(lvEdit) < JNTSelXStrToFloat(colSTCODE.Field.AsString) ) then
                begin
                    gfnJNTSelErrDlgx(Self, 52004);
                    Result  :=  FALSE;
                    dxGridHani.SetFocus;
                    dxGridHani.Columns[1].Field.FocusControl;
                    Exit;
                end;
            end;
        end else
        begin
        	// ﾌﾘｰの場合
            if ( Trim(lvEdit) <> '' ) then
            begin
                // 大小ﾁｪｯｸ
                if ( lvEdit < colSTCODE.Field.AsString ) then
                begin
                    gfnJNTSelErrDlgx(Self, 52004);
                    Result  :=  FALSE;
                    dxGridHani.SetFocus;
                    dxGridHani.Columns[1].Field.FocusControl;
                    Exit;
                end;
            end;
        end;

        if ( AllChkMode = FALSE ) then  Exit;
    end;

end;

{
//=============================================================================
//  [年月用スピンボタン]アップクリック処理
//=============================================================================
procedure TFrmJNTPDialog.fnSpnBtnUp(Sender: TObject);
var
    lvCompNM    :   String;
    lvYMCmp     :   TMDateEdit;
begin

	// ｽﾋﾟﾝﾎﾞﾀﾝの処理の対象となるｺﾝﾎﾟｰﾈﾝﾄを取得
    lvCompNM    :=  Copy(TSpinButton(Sender).Name, 7,
                            Length(TSpinButton(Sender).Name)-6);
    lvYMCmp     :=  TMDateEdit(JNTSelXFindCtrl(Self, lvCompNM));

    // 表示ﾓｰﾄﾞより、ﾃﾞｰﾀを編集
    if ( lvYMCmp.DateInputType = diYM ) then
	    lvYMCmp.AsIntYM := gfnJNTSelYMUpDown(lvYMCmp.AsIntYM, 0)
    else if	( lvYMCmp.DateInputType = diY ) then
	    lvYMCmp.AsIntYM := lvYMCmp.AsIntYM + 1;

end;
}
{
//=============================================================================
//  [年月用スピンボタン]ダウンクリック処理
//=============================================================================
procedure TFrmJNTPDialog.fnSpnBtnDown(Sender: TObject);
var
    lvCompNM    :   String;
    lvYMCmp     :   TMDateEdit;
begin

	// ｽﾋﾟﾝﾎﾞﾀﾝの処理の対象となるｺﾝﾎﾟｰﾈﾝﾄを取得
    lvCompNM    :=  Copy(TSpinButton(Sender).Name, 7,
                            Length(TSpinButton(Sender).Name)-6);
    lvYMCmp     :=  TMDateEdit(JNTSelXFindCtrl(Self, lvCompNM));

    //表示ﾓｰﾄﾞより、ﾃﾞｰﾀを編集
    if ( lvYMCmp.DateInputType = diYM ) then
	    lvYMCmp.AsIntYM := gfnJNTSelYMUpDown(lvYMCmp.AsIntYM, 1)
    else if	( lvYMCmp.DateInputType = diY ) then
	    lvYMCmp.AsIntYM := lvYMCmp.AsIntYM - 1;

end;
}


//-----------------------------------------------------------------------------
//  fnSetPara()
//      ﾘﾀｰﾝ用ﾊﾟﾗﾒｰﾀを設定する
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnSetPara;
var
    {lvLp,} lvCnt :   Integer;
    lvStr       :   String;
    lvTDtEdtS,
    lvTDtEdtE   :   TMDateEdit;
    i           :   Integer;
    DBDigit		:	Integer;					// DB上の桁数				// 050901 hirota
//<TAX> ADD St
    procedure setPrvStDate(index : Integer; value: Integer);
    begin
        case i of
            1   : m_Hani.pvrStDate  := value;
            2   : m_Hani.pvrStDate2 := value;
        end;
    end;

    procedure setPrvEdDate(index : Integer; value: Integer);
    begin
        case i of
            1   : m_Hani.pvrEdDate  := value;
            2   : m_Hani.pvrEdDate2 := value;
        end;
    end;
//<TAX> ADD Ed
begin

	// 初期化
    with m_Hani do
    begin
    	// 保存用領域が確保されているか？
    	if ( Length(pvrStCode) = 0 ) then
        begin
		    // 範囲指定保存用項目を生成する
            lvCnt   :=  dxMdMain.RecordCount ;
            begin
                SetLength(pvrRgType, lvCnt);
                SetLength(pvrStCode, lvCnt);	//開始ｺｰﾄﾞ
                SetLength(pvrStName, lvCnt);	//開始名称
                SetLength(pvrEdCode, lvCnt);	//終了ｺｰﾄﾞ
                SetLength(pvrEdName, lvCnt);	//終了名称
                SetLength(pvrWhere , lvCnt);	//Where
            end;

            // 範囲項目を取得する
            with dxMdMain do
            begin
                DisableControls;

                i := 0;
                First;
                while not Eof do
                begin
                    pvrRgType[i] := FieldByName('RGCODE').AsInteger;
                    pvrStCode[i] := FieldByName('STCODE').AsString;
                    pvrStName[i] := FieldByName('STNAME').AsString;
                    pvrEdCode[i] := FieldByName('EDCODE').AsString;
                    pvrEdName[i] := FieldByName('EDNAME').AsString;
                    pvrWhere [i] := FieldByName('WhereStr').AsString;
                    i := i + 1;
                    Next;
                end;
            end;
        end;
    end;

    // 日付の範囲指定
    lvStr   :=  'DatePnl1';
    if ( TPanel(JNTSelXFindCtrl(Self, lvStr)).Visible = TRUE ) then
    begin
//<TAX> ADD St
        for i := 1 to DateCount do
        begin
//<TAX> ADD Ed
            // 範囲指定のｺﾝﾎﾟｰﾈﾝﾄを取得する
//<TAX> DEL            lvStr       :=  'fSDATE1';
            lvStr       :=  Format('fSDATE%s', [IntToStr(i)]);  //<TAX> ADD
            lvTDtEdtS   :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
//<TAX> DEL            lvStr       :=  'fEDATE1';
            lvStr       :=  Format('fEDATE%s', [IntToStr(i)]);  //<TAX> ADD
            lvTDtEdtE   :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));

            // 保存する
            with lvTDtEdtS do
            begin
//<TAX> MOD St
                if ( DateInputType = diYMD ) then	    // 開始年月日
                begin
                    if Value = 0 then
                        setPrvStDate(i, 0)
                    else
                        setPrvStDate(i, JNTSelXDateToInt8(AsDateTime));
                end
                else if ( DateInputType = diYM ) or	    // 開始年月
                        ( DateInputType = diY  ) then	// 開始年
                begin
                    setPrvStDate(i, AsIntYM);
                end;
{
                if ( DateInputType = diYMD ) then	    // 開始年月日
                begin
                    // 050901 hirota >>
                    if Value = 0 then
                        m_Hani.pvrStDate    :=  19000101
                    else
                        m_Hani.pvrStDate    :=  JNTSelXDateToInt8(AsDateTime);
                    // 050901 hirota <<
                end
                else if ( DateInputType = diYM ) or	    // 開始年月
                        ( DateInputType = diY  ) then	// 開始年
                begin
                    m_Hani.pvrStDate    :=  AsIntYM;
                end;
}
//<TAX> MOD Ed
            end;

            with lvTDtEdtE do
            begin
//<TAX> MOD St
                if ( DateInputType = diYMD ) then	    // 終了年月日
                begin
                    if Value = 0 then
                        setPrvEdDate(i, 0)
                    else
                        setPrvEdDate(i, JNTSelXDateToInt8(AsDateTime));
                end
                else if ( DateInputType = diYM ) or	    // 終了年月
                        ( DateInputType = diY  ) then	// 終了年
                begin
                    setPrvEdDate(i, AsIntYM);
                end;
{
                if ( DateInputType = diYMD ) then	    // 終了年月日
                begin
                    // 050901 hirota >>
                    if Value = 0 then
                        m_Hani.pvrEdDate    :=  20991231
                    else
                        m_Hani.pvrEdDate    :=  JNTSelXDateToInt8(AsDateTime);
                    // 050901 hirota <<
                end
                else if ( DateInputType = diYM ) or	    // 終了年月
                        ( DateInputType = diY  ) then	// 終了年
                begin
                    m_Hani.pvrEdDate    :=  AsIntYM;
                end;
}
//<TAX> MOD Ed
            end;
        end;  //<TAX> ADD
    end;

    with m_Hani do
    begin
        //=== 印刷ﾊﾟﾀｰﾝ ===//
        //<SES>↓
        // 施主ﾏｽﾀ登録から呼ばれた場合は特殊
        if ExtractFileName(m_Hani.pvDlgIniFile) <> ucSESYU_INI then
        //<SES>↑
            pvrPattern  := fPattern.ItemIndex
        //<SES>↓
        else
            // 施主ﾏｽﾀ登録から呼ばれた場合、Patternには3を送る
            pvrPattern  := 3;
        //<SES>↑
        pvrRepTitle := fPattern.Items[fPattern.ItemIndex];

(* <001>Del
        //=== 日付関連ﾊﾟﾀｰﾝ ===//
        if ( uvDataFormat <> 1 ) then
        begin
            pvrSYM  := pvrStDate;
            pvrEYM  := pvrEdDate;
        end
        else
        begin
            pvrSYMD := JNTSelXIntToDate(pvrStDate,#0);
            pvrEYMD := JNTSelXIntToDate(pvrEdDate,#0);
        end;
*)

        //=== 出力順序 ===//
	    pvrOrder    := fORDER1.ItemIndex;
//<001>Del        pvrOrderNM  := fORDER1.Items[fORDER1.ItemIndex];
        pvrOrderNM  := fORDER1.Items[fORDER1.ItemIndex];

        //=== 小計毎に改頁 ===//
        pvrShokei   := cbShokei.Checked;

        //=== 削除されたものを出力する ===//
//<001>Del        pvrDelete   := cbDelete.Checked;

        //=== ﾃﾝﾌﾟﾚｰﾄを出力する ===//
        pvrTemplate := cbTemplate.Checked;

        // 範囲領域を確保する
    	if ( Length(pvrRgType) = 0 ) then
        begin
            pvrCodeCnt := dxMdMain.RecordCount;
            SetLength(pvrRgType, pvrCodeCnt);
            SetLength(pvrStCode, pvrCodeCnt);
            SetLength(pvrStName, pvrCodeCnt);
            SetLength(pvrEdCode, pvrCodeCnt);
            SetLength(pvrEdName, pvrCodeCnt);
            SetLength(pvrWhere , pvrCodeCnt);
        end;

        // 範囲項目を取得する
        with dxMdMain do
        begin
            DisableControls;

            i := 0;
            First;
            while not Eof do
            begin
				// 050901 hirota 商品マスター対応 >>
				DBDigit := 16;
                if FieldByName('MasterKbn').AsInteger = 81 then					// 商品
					DBDigit := 20;												// 20桁
				// 050901 hirota 商品マスター対応 <<

                if FieldByName('MasterKbn').AsInteger = 9000 then				// 単位
					DBDigit := 2;												// 2桁

                pvrRgType[i] := FieldByName('RGCODE').AsInteger;

                // 外部ｺｰﾄﾞはﾌﾙ桁で落とす
                if ( FieldByName('CodeAttr').AsInteger in [0,1] ) then
                begin
                    if ( Trim(FieldByName('STCODE').AsString) = '' ) then
                        pvrStCode[i] := JNTSelXRightAddch('', DBDigit, ' ')     //<006>
                    else
                        pvrStCode[i] := FormatFloat(StringOfChar('0', DBDigit), StrToFloat(Trim(FieldByName('STCODE').AsString)));	// 050901 hirota 商品マスター対応
                    pvrStName[i] := FieldByName('STNAME').AsString;

                    if ( Trim(FieldByName('EDCODE').AsString) = '' ) then
                        pvrEdCode[i] := JNTSelXRightAddch('', DBDigit, #255)    //<006>
                    else
                        pvrEdCode[i] := FormatFloat(StringOfChar('0', DBDigit), StrToFloat(Trim(FieldByName('EDCODE').AsString)));	// 050901 hirota 商品マスター対応

                    pvrEdName[i] := FieldByName('EDNAME').AsString;
                end
                else
                begin
                    pvrStCode[i] := FieldByName('STCODE').AsString;
                    pvrStName[i] := FieldByName('STNAME').AsString;
                    pvrEdCode[i] := FieldByName('EDCODE').AsString;
                    pvrEdName[i] := FieldByName('EDNAME').AsString;
                end;

                pvrWhere[i] := FieldByName('WhereStr').AsString;
                i := i + 1;
                Next;
            end;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  fnMoveNextColumn()
//      次入力項目へ移動する（[ｺｰﾄﾞ]の中で）
//      PARAM   : なし
//      RETURN  : なし
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnMoveNextColumn;
var
    lvCompName  :   String;

    // 次項目を取得する
    function fnGetNext(Fld: String): Boolean;
    var
        lvLp    :   Integer;
        lvChk   :   Boolean;
        lvCmp   :   TComponent;
    begin

        lvChk   :=  FALSE;
        Result  :=  FALSE;

    //<TAX> DEL	for lvLp := 0 to 9 do
        for lvLp := 0 to CompNmCount -1 do  //<TAX> ADD
        begin
            if ( lvChk = FALSE ) then
            begin
                // 現在の項目を取得する
                if ( ucMoveComp[lvLp] = Fld ) then
                begin
                    lvChk   :=  TRUE;
                    Continue;
                end;
            end;

            if ( lvChk = TRUE ) then
            begin
                // ﾌｫｰｶｽがｾｯﾄ可能か
                if ( ucMoveComp[lvLp] = 'fSDATE1' ) or
                   ( ucMoveComp[lvLp] = 'fEDATE1' ) or
    //<TAX> ADD St
                   ( ucMoveComp[lvLp] = 'fSDATE2' ) or
                   ( ucMoveComp[lvLp] = 'fEDATE2' )
    //<TAX> ADD Ed
                   then
                begin
                    if ( DatePnl1.Visible = FALSE ) then Continue;
                end;

                lvCmp   :=  JNTSelXFindCtrl(Self, ucMoveComp[lvLp]);
                if ( lvCmp is TMComboBox ) then	// TMComboBox用
                begin
                    if ( TMComboBox(lvCmp).Visible = TRUE ) and
                       ( TMComboBox(lvCmp).Enabled = TRUE ) then
                    begin
                        TMComboBox(lvCmp).SetFocus;
                        Result := TRUE;
                        Exit;
                    end;
                end;

                if ( lvCmp is TMCheckBox ) then // TMCheckBox用
                begin
                    if ( TMCheckBox(lvCmp).Visible = TRUE ) and
                       ( TMCheckBox(lvCmp).Enabled = TRUE ) then
                    begin
                        TMCheckBox(lvCmp).SetFocus;
                        Result := TRUE;
                        Exit;
                    end;
                end;

                if ( lvCmp is TMDateEdit ) then	// TMDateEdit用
                begin
                    if ( TMDateEdit(lvCmp).Visible = TRUE ) and
                       ( TMDateEdit(lvCmp).Enabled = TRUE ) then
                    begin
                        TMDateEdit(lvCmp).SetFocus;
                        Result := TRUE;
                        Exit;
                    end;
                end;

                if ( lvCmp is TMNumEdit ) then // TMNumEdit用
                begin
                    if ( TMNumEdit(lvCmp).Visible = TRUE ) and
                       ( TMNumEdit(lvCmp).Enabled = TRUE ) then
                    begin
                        TMNumEdit(lvCmp).SetFocus;
                        Result := TRUE;
                        Exit;
                    end;
                end;
                // <014>↓
                if ( lvCmp is TdxDBGrid ) then // TdxDBGrid用
                begin
                    if ( TdxDBGrid(lvCmp).Visible = TRUE ) and
                       ( TdxDBGrid(lvCmp).Enabled = TRUE ) then
                    begin
                        TdxDBGrid(lvCmp).SetFocus;
                        Result := TRUE;
                        Exit;
                    end;
                end;
                // <014>↑
            end;
        end;

    end;

begin

	// ｱｸﾃｨﾌﾞなｺﾝﾎﾟｰﾈﾝﾄ名を取得する
    lvCompName := TComponent(ActiveControl).Name;

    // 印刷ﾊﾟﾀｰﾝ
    if ( lvCompName = 'fPattern' ) then
    begin
        if ( fnGetNext(lvCompName) = FALSE ) then
            sbOk.SetFocus;	// 最終の項目へ
{
        if (lvCompName = 'fPattern') or
           (lvCompName = 'fZeiKbn' ) then // <SOU>
        begin
            dxGridHani.SetFocus;
            dxGridHani.FocusedColumn := 1;	// 範囲選択へ
            dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
            Exit;
        end;
}
    end
    // ｺｰﾄﾞ範囲
    else if ( lvCompName = 'dxGridHani' ) then
    begin
        // ｱｸﾃｨﾌﾞなｶﾗﾑを取得する
        lvCompName  :=  dxGridHani.Columns[dxGridHani.FocusedColumn].Name;

        // 次項目へ移動する
        if ( lvCompName = 'colRGCODE' ) then
        begin
            if (dxMdMain.FieldByName('RGCODE').AsInteger = 1) then
            begin
                // 開始ｺｰﾄﾞへ移動
                dxGridHani.FocusedColumn := 3;		// 開始ｺｰﾄﾞ
                dxGridHani.ShowEditor;          	// 編集ﾓｰﾄﾞにする
                Exit;
            end
            else if ( dxMdMain.RecordCount = dxMdMain.RecNo ) then
            begin
                // 最終項目ならOKﾎﾞﾀﾝへ
                sbOk.SetFocus;
                Exit;
            end
            else
            begin
                // 1行下の範囲選択へ移動
                dxMdMain.Next;                  // 1行下へ
                dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                Exit;
            end;

        end
        else if ( lvCompName = 'colSTCODE' ) then
        begin
            // 範囲指定の場合は開始ｺｰﾄﾞへ
            if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
            begin
                // 終了ｺｰﾄﾞへ移動
                dxGridHani.FocusedColumn := 6;		// 終了ｺｰﾄﾞへ
                dxGridHani.ShowEditor;          	// 編集ﾓｰﾄﾞにする
                Exit;
            end
            else
            begin
                // 最終項目であればOKﾎﾞﾀﾝへ移動
                if ( dxMdMain.RecordCount = dxMdMain.RecNo ) then
                begin
                    sbOk.SetFocus;
                    Exit;
                end
                else
                begin
                    // 最終項目でなければ1行下の選択範囲へ
                    dxMdMain.Next;                  // 1行下へ
                    dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                    dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                    Exit;
                end;
            end;
        end
        else if ( lvCompName = 'colEDCODE' ) then
        begin
            // 最終項目であればOKﾎﾞﾀﾝへ移動
            if ( dxMdMain.RecordCount = dxMdMain.RecNo ) then
            begin
                sbOk.SetFocus;
                Exit;
            end
            else
            begin
                // 1行下の選択範囲へ
                dxMdMain.Next;                  // 1行下へ
                dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;
                m_iHaniZen := m_iHaniGen;
                Exit;
            end;
        end
        else
        begin
            // 項目の場合
            if ( lvCompName = 'colCaption' ) then
            begin
                dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                Exit;
            end;

            // 項目、選択範囲、開始ｺｰﾄﾞ、終了ｺｰﾄﾞ以外の場合
            // 最終項目であればOKボタンへ移動
            if ( dxMdMain.RecordCount = dxMdMain.RecNo ) then
            begin
                sbOk.SetFocus;
                Exit;
            end
            else
            begin
                dxMdMain.Next;                  // 1行下へ
                dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                Exit;
            end;
        end;
    end

    // Okﾎﾞﾀﾝの場合
    else
        if ( lvCompName = 'sbOk' ) then
        begin
            // ｷｬﾝｾﾙﾎﾞﾀﾝへ移動
      	    sbCancel.SetFocus;
            Exit;
        end
        // ｷｬﾝｾﾙﾎﾞﾀﾝの場合
        else if ( lvCompName = 'sbCancel' ) then
        begin
            // 先頭項目へ
    (* <003>
            if ( fPattern.Enabled = FALSE ) then
                fORDER1.SetFocus
            else
                fPattern.SetFocus;
    *)
            m_FirstCtl.SetFocus;        // 先頭ｺﾝﾄﾛｰﾙへ<003>
            Exit;
        end

        // 印刷ﾊﾟﾀｰﾝの場合
        else if ( lvCompName = 'fPattern' ) then
        begin
    //<003>       	fORDER1.SetFocus;
            if fORDER1.Enabled then
                fORDER1.SetFocus
            else
            begin
                if dxGridHani.Enabled then
                    dxGridHani.SetFocus
                else
                    sbOk.SetFocus;
            end;

            Exit;
        end
        else
        begin
            // 次項目へ
            if ( fnGetNext(lvCompName) = FALSE ) then
                sbOk.SetFocus;	// 最終の項目へ
        end;

end;

//-----------------------------------------------------------------------------
//  fnMoveBeforeColumn()
//      前入力項目へ移動する（[ｺｰﾄﾞ]の中で）
//      PARAM   : なし
//      RETURN  : なし
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnMoveBeforeColumn;
var
	lvCompName  :   String;

// 前項目を取得する
function fnGetBefore(Fld: String): Boolean;
var
	lvLp    :   Integer;
    lvChk   :   Boolean;
    lvCmp   :   TComponent;
begin

	lvChk   :=  FALSE;
    Result  :=  FALSE;

//<TAX> DEL	for lvLp := 9 downto 0 do
	for lvLp := CompNmCount-1 downto 0 do  //<TAX> ADD
    begin
	    if ( lvChk = FALSE ) then
        begin
        	// 現在の項目を取得する
            if ( ucMoveComp[lvLp] = Fld ) then
            begin
                lvChk := TRUE;
                Continue;
            end;
        end;

	    if ( lvChk = TRUE ) then
        begin
        	// ﾌｫｰｶｽがｾｯﾄ可能か
            if ( ucMoveComp[lvLp] = 'fSDATE1' ) or
               ( ucMoveComp[lvLp] = 'fEDATE1' ) or
//<TAX> ADD St
               ( ucMoveComp[lvLp] = 'fSDATE2' ) or
               ( ucMoveComp[lvLp] = 'fEDATE2' ) 
//<TAX> ADD Ed
               then
            begin
            	if ( DatePnl1.Visible = FALSE ) then Continue;
            end;

            lvCmp   :=  JNTSelXFindCtrl(Self, ucMoveComp[lvLp]);

            if ( lvCmp is TMComboBox ) then	// TMComboBox用
            begin
	            if ( TMComboBox(lvCmp).Visible = TRUE ) and
                   ( TMComboBox(lvCmp).Enabled = TRUE ) then
                begin
	                TMComboBox(lvCmp).SetFocus;
				    Result := TRUE;
		            Exit;
                end;
            end;

            if ( lvCmp is TMCheckBox ) then	// TMCheckBox用
            begin
	            if ( TMCheckBox(lvCmp).Visible = TRUE ) and
		           ( TMCheckBox(lvCmp).Enabled = TRUE ) then
                begin
	                TMCheckBox(lvCmp).SetFocus;
				    Result := TRUE;
		            Exit;
                end;
            end;

            if ( lvCmp is TMDateEdit ) then	// TMDateEdit用
            begin
	            if ( TMDateEdit(lvCmp).Visible = TRUE ) and
		           ( TMDateEdit(lvCmp).Enabled = TRUE ) then
                begin
	                TMDateEdit(lvCmp).SetFocus;
				    Result := TRUE;
		            Exit;
                end;
            end;

            if ( lvCmp is TMNumEdit ) then // TMNumEdit用
            begin
                if ( TMNumEdit(lvCmp).Visible = TRUE ) and
                   ( TMNumEdit(lvCmp).Enabled = TRUE ) then
                begin
                    TMNumEdit(lvCmp).SetFocus;
                    Result := TRUE;
                    Exit;
                end;
            end;
        end;
    end;

end;

begin

	// ｱｸﾃｨﾌﾞなｺﾝﾎﾟｰﾈﾝﾄ名を取得する
    lvCompName := TComponent(ActiveControl).Name;

    if ( lvCompName = 'sbOk'     ) or		// 印刷ﾊﾟﾀｰﾝ
       ( lvCompName = 'sbCancel' ) then		// ﾀｸﾞ
    begin
        if ( lvCompName = 'sbCancel' ) then
        begin
            sbOk.SetFocus;
            Exit;
        end;

        if ( fnGetBefore(lvCompName) = FALSE ) then
        begin
(* <003>
            if ( fPattern.Enabled = TRUE ) and ( fPattern.Visible = TRUE ) then
            begin
                fPattern.SetFocus;
            end
            else
            begin
                fORDER1.SetFocus;
            end;
*)
            m_FirstCtl.SetFocus;        // 先頭ｺﾝﾄﾛｰﾙへ<003>
            Exit;
        end;

        if (dxGridHani.Enabled = TRUE      ) and
           (lvCompName         = 'sbCancel') then
        begin
            sbOk.SetFocus;
            Exit;
        end;

        if ( dxGridHani.Enabled = TRUE   ) and
           ( lvCompName         = 'sbOk' ) then
        begin
            dxGridHani.SetFocus;

            // 最後の行へ
            dxMdMain.Last;

            // 出力範囲ｺｰﾄﾞ取得
            m_iHaniZen := dxGridHani.Columns[1].Field.AsInteger;
            m_iHaniGen := dxGridHani.Columns[1].Field.AsInteger;

            if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
            begin
                dxGridHani.FocusedColumn := 6;		// 終了ｺｰﾄﾞ
                dxGridHani.ShowEditor;          	// 編集ﾓｰﾄﾞにする
            end
            else
            begin
                dxGridHani.FocusedColumn := 1;		// 範囲
                dxGridHani.ShowEditor;          	// 編集ﾓｰﾄﾞにする
            end;
            Exit;
        end;

        if ( fPattern.Enabled = TRUE ) and ( fPattern.Visible = TRUE ) then
        begin
			fPattern.SetFocus;
            Exit;
        end
        else
        begin
//<003>        	fORDER1.SetFocus;
            if fORDER1.Enabled then
               	fORDER1.SetFocus
            else
            begin
                if dxGridHani.Enabled then
                    dxGridHani.SetFocus
                else
                    sbOk.SetFocus;
            end;

            Exit;
        end;
    end
    else if ( lvCompName = 'fPattern' ) then
    begin
        sbCancel.SetFocus;
        Exit;
    end
    else if ( lvCompName = 'dxGridHani' ) then	// ｺｰﾄﾞ範囲
    begin
        // ｱｸﾃｨﾌﾞなｶﾗﾑを取得する
        lvCompName := dxGridHani.Columns[dxGridHani.FocusedColumn].Name;

        // 前項目へ移動する
        if ( lvCompName = 'colSTCODE' ) then
        begin
            // 範囲選択へ移動
            dxGridHani.FocusedColumn := 1;	// 終了ｺｰﾄﾞへ
            dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
            Exit;
        end
        else if ( lvCompName = 'colEDCODE' ) then
        begin
            // 範囲指定の場合は開始ｺｰﾄﾞへ
            // それ以外は範囲選択へ
            if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
            begin
                // 開始ｺｰﾄﾞへ移動
                dxGridHani.FocusedColumn := 3;	// 開始ｺｰﾄﾞへ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                Exit;
            end
            else
            begin
                // 範囲選択へ移動
                dxGridHani.FocusedColumn := 1;	// 終了ｺｰﾄﾞへ
                dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                Exit;
            end;
        end
        else if ( lvCompName = 'colRGCODE' ) then
        begin
            // 先頭ﾚｺｰﾄﾞ以外ならば１行上の行へﾌｫｰｶｽを移動
        	if ( dxMdMain.RecNo <> 1 ) then
            begin
                // 1行上へ
                dxMdMain.Prior;

                if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
                begin
                    // 1行上の終了ｺｰﾄﾞへ移動
                    dxGridHani.FocusedColumn := 6;	// 終了ｺｰﾄﾞへ
                    dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                end
                else
                begin
                    // 1行上の範囲選択へ移動
                    dxGridHani.FocusedColumn := 1;	// 範囲選択へ
                    dxGridHani.ShowEditor;          // 編集ﾓｰﾄﾞにする
                end;

                m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;
                m_iHaniZen := m_iHaniGen;
            end
            else
// <014>↓
//                cbTemplate.SetFocus;
            begin
                if (fnGetBefore('dxGridHani') = FALSE) then
                    sbCancel.SetFocus;
            end;
// <014>↑

            Exit;
        end;

    	//次項目へ
        if ( fnGetBefore(lvCompName) = FALSE ) then
		begin
            if ( fPattern.Enabled = TRUE ) and ( fPattern.Visible = TRUE ) then
            begin
                fPattern.SetFocus;
                Exit;
            end
            else
            begin
//<003>                fORDER1.SetFocus;
                if fORDER1.Enabled then
                   	fORDER1.SetFocus
                else
                begin
                    if dxGridHani.Enabled then
                        dxGridHani.SetFocus
                    else
                        sbOk.SetFocus;
                end;

                Exit;
            end;
		end;
    end;

end;

//-----------------------------------------------------------------------------
//  dxMdMainCalcFields()
//      MemData集計ﾌｨｰﾙﾄﾞ
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxMdMainCalcFields(DataSet: TDataSet);
var
    rNmk, lvCd      :   String;
    lvType          :   Integer;
    lvAcCtrlNm	    :   String;
    lvTableName,
    lvShortName     :   String;
    lvCodeAttr      :   Integer;
    lvWhereStr      :   String;
begin

	// ﾌｫｰｶｽのあるｺﾝﾄﾛｰﾙを取得
    lvAcCtrlNm  :=  '';

    if ( Screen.ActiveControl <> nil ) then
    begin
        lvAcCtrlNm := Screen.ActiveControl.Name;
    end;

	with DataSet do
    begin
	    // ﾃｰﾌﾞﾙ名取得する
        lvTableName :=  FieldByName('TABLENAME').AsString;
        lvShortName :=  FieldByName('ShortName').AsString;
        lvCodeAttr  :=  FieldByName('CodeAttr') .AsInteger;

        if ( lvTableName = '' ) or ( lvShortName = '' ) then Exit;

        // 現在の範囲情報を取得
        m_iHaniGen := dxGridHani.Columns[1].Field.AsInteger;

        // 範囲ｺｰﾄﾞ取得
        lvType := FieldByName('RGCODE').AsInteger;

        // 範囲の種類によりｸﾞﾘｯﾄﾞ内のTabStopを設定
        if ( lvType = 1 ) then
        begin // 範囲選択時
            colStCode.TabStop       :=  TRUE;
            colStCode.DisableEditor :=  FALSE;
            colEdCode.TabStop       :=  TRUE;
            colEdCode.DisableEditor :=  FALSE;
        end
        else
        begin // 全件選択時
            colStCode.TabStop       :=  FALSE;
            colStCode.DisableEditor :=  TRUE;
            colEdCode.TabStop       :=  FALSE;
            colEdCode.DisableEditor :=  TRUE;
        end;

        // 範囲により名称を変更
//<001> rNmk    :=  RangeTable[lvType];
        rNmk    :=  fnGetRangeTable(lvType);
        // ﾃﾞｰﾀを設定する
        FieldByName('RGNAME').AsString  :=  rNmk;

        // 開始ｺｰﾄﾞの名称を取得する
        lvCd    :=  FieldByName('STCODE').AsString;

        if ( lvCd = '' ) then
           if ( FieldByName('RGCODE').AsInteger = 1 ) then
               rNmk := '最初から'
           else
               rNmk := ''
        else
		begin
//            lvWhereStr := fnMakeWhereStr(dxMdMain);     //<002><016>
            lvWhereStr := fnMakeWhereStr(dxMdMain, False);//<016>引数追加
            // ﾏｽﾀより取得する
            fnJNTNameGet(lvTableName,
                         lvShortName,
                         lvCd,
                         lvWhereStr,
                         FieldByName('MasterKbn').AsInteger,
                         lvCodeAttr,
                         rNmk);
		end;

//<BLNO> Ins-s
		//ﾏｽﾀ区分が85の場合は名称をｾｯﾄしない
		if (FieldByName('MasterKbn').AsInteger <> 85) or (rNmk = '最初から') then
		begin
            // ﾃﾞｰﾀを設定する
            FieldByName('STNAME').AsString  :=  rNmk;
		end;
//<BLNO> Ins-e

        // 終了ｺｰﾄﾞの名称を取得する
        lvCd    :=  FieldByName('EDCODE').AsString;

        if ( lvCd = '' ) then
            if ( FieldByName('RGCODE').AsInteger = 1 ) then
                rNmk    :=  '最後まで'
            else
                rNmk    :=  ''
        else
		begin
//            lvWhereStr := fnMakeWhereStr(dxMdMain);     //<002><016>
            lvWhereStr := fnMakeWhereStr(dxMdMain, False);//<016>引数追加
            // ﾏｽﾀより取得する
            fnJNTNameGet(lvTableName,
                         lvShortName,
                         lvCd,
                         lvWhereStr,
                         FieldByName('MasterKbn').AsInteger,
                         lvCodeAttr,
                         rNmk);
		end;

//<BLNO> Ins-s
		//ﾏｽﾀ区分が85の場合は名称をｾｯﾄしない
		if (FieldByName('MasterKbn').AsInteger <> 85) or (rNmk = '最後まで') then
		begin
            // ﾃﾞｰﾀを設定する
            FieldByName('EDNAME').AsString  :=  rNmk;
		end;
//<BLNO> Ins-e

//<007>?
        dxGridHani.Columns[3].Alignment := taLeftJustify;
        dxGridHani.Columns[6].Alignment := taLeftJustify;

    end;

end;

//-----------------------------------------------------------------------------
//  dxGridHaniChangeNode()
//      ﾉｰﾄﾞ移動時処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxGridHaniChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin

	fnChangeNode;

end;

//-----------------------------------------------------------------------------
//  dxGridHaniEnter()
//      DBGridﾌｫｰｶｽ取得時処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxGridHaniEnter(Sender: TObject);
begin

    // ｺｰﾄﾞの桁数を取得する
    colSTCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;
    colEDCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;
{
    // ｸﾞﾘｯﾄﾞにﾌｫｰｶｽがあり複数指定であればｽﾋﾟｰﾄﾞﾎﾞﾀﾝ表示
    if ( dxGridHani.Columns[1].Field.AsInteger = 2 ) then
    begin
        // ﾌｫｰｶｽ位置を設定
        dxGridHani.Columns[1].Field.FocusControl;
    end;
}
end;

//-----------------------------------------------------------------------------
//  dxGridCODEEditButtonClick()
//      ｺｰﾄﾞ ｴｸｽﾌﾟﾛｰﾗ表示処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxGridCODEEditButtonClick(Sender: TObject);
begin

    // ｴｸｽﾌﾟﾛｰﾗ表示
    fnCallExplorer(Sender);

end;

//-----------------------------------------------------------------------------
//  fnCallExplorer()    //<002>
//      検索ｴｸｽﾌﾟﾛｰﾗを表示する
//      PARA    : CompName  : ｱｸﾃｨﾌﾞｺﾝﾎﾟｰﾈﾝﾄの名称
//      RETURN  : なし
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnCallExplorer(Sender: TObject);
var
    lvExpSend   :   rcJNTExpSend;
    lvExpRecv   :   rcJNTExpRecv;
    CompName    :   String;
    ExpConTBL   :   String;
    iExpRtn     :   Integer;
    lvFld       :	String;

    cMem        :   TdxMemData;

    sWhere,
    sCode       :   String;
    DBDigit     :   Integer;
begin

    ExpConTbl   :=  '';

    cMem        :=  dxMdMain;

    CompName    :=  TComponent(Sender).Name;

    // ｶﾗﾑを判断する
	if      ( CompName = 'colSTCODE' ) then lvFld := 'STCODE'
	else if ( CompName = 'colEDCODE' ) then lvFld := 'EDCODE'
    else Exit;

    //ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_Hani.pMjsAppRec;  // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @(m_Hani.UseDb);    // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_pSystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_pSystemArea.SysColorD;

    lvExpSend.MasterKbn     :=  cMem.FieldByName('Masterkbn').AsInteger;        //マスター区分＝
    lvExpSend.ModulKbn      :=  cMem.FieldByName('ModulKbn' ).AsInteger;        //モジュール区分
    lvExpSend.PatternNo     :=  cMem.FieldByName('PatternNo').AsInteger;        //マスター区分＝
    lvExpSend.TableName     :=  cMem.FieldByName('TABLENAME').AsString;
//<023> mod St
{
//    lvExpSend.WhereStr      :=  fnMakeWhereStr(cMem);     // <016>
    lvExpSend.WhereStr      :=  fnMakeWhereStr(cMem, True); // <016>引数追加
}
		sWhere := fnMakeWhereStr(cMem, True);

	// 開始コード入力ありのとき、終了コード検索EXPの絞込条件に追加
	if (lvFld = 'EDCODE') and (cMem.FieldByName('STCODE').AsString <> '') then
	begin
		if (sWhere <> '') then
			sWhere := sWhere + ' AND ';

		sCode := cMem.FieldByName('STCODE').AsString;

		DBDigit := 16;
		if cMem.FieldByName('Masterkbn').AsInteger = 81 then			// 商品
			DBDigit := 20;												// 20桁
		if cMem.FieldByName('Masterkbn').AsInteger = 9000 then			// 単位
			DBDigit := 2;												// 2桁

//<BLNO> Ins-s
		if (cMem.FieldByName('Masterkbn').AsInteger = 85) and
 		   (cMem.FieldByName('ModulKbn').AsInteger  = 6)  and
           (cMem.FieldByName('PatternNo').AsInteger = 5)  then			// BLNO
        begin
   			DBDigit := 20;												// 20桁
		end;
//<BLNO> Ins-e

		// 属性対応
		if ( cMem.FieldByName('CodeAttr').AsInteger in [0,1] ) then
			sCode  :=  FormatFloat(StringOfChar('0', DBDigit), StrToFloat(Trim(sCode)))
		else
			sCode  :=  TrimRight(sCode);

		sWhere := sWhere + ' GCODE !< ' + QuotedStr(sCode);
	end;

    lvExpSend.WhereStr      := sWhere;

//<BLNO> Ins-s
		if (cMem.FieldByName('Masterkbn').AsInteger = 85) and
 		   (cMem.FieldByName('ModulKbn').AsInteger  = 6)  and
           (cMem.FieldByName('PatternNo').AsInteger = 5)  then			// BLNO
        begin
		    lvExpSend.GroupStr := 'GCode,InvoiceNo,ShipNm ';
		end;
//<BLNO> Ins-e


//<023> mod Ed

    // ﾓｼﾞｭｰﾙ特定動作(納品先)
    //<SES>↓
    // 施主ﾏｽﾀ登録から呼ばれた場合は特殊
    if ExtractFileName(m_Hani.pvDlgIniFile) <> ucSESYU_INI then
    begin
    //<SES>↑
        if cMem.FieldByName('Masterkbn').AsInteger = 26 then
            lvExpSend.DelivKbn := fPattern.ItemIndex + 1;
    //<SES>↓
    end
    else
    begin
        // 施主ﾏｽﾀ登録から呼ばれた場合、DelivKbnには4を送る
        if cMem.FieldByName('Masterkbn').AsInteger = 26 then
            lvExpSend.DelivKbn := 4;
    end;
    //<SES>↑

    // ﾓｼﾞｭｰﾙ特定動作(取引区分)
    if cMem.FieldByName('MasterKbn').AsInteger = 9030 then
        lvExpSend.TranChar := cMem.FieldByName('TranChar').AsString;            // 取引区分


    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin

    	with dxMdMain do
        begin
        	Edit;
            FieldByName(lvFld).AsString := lvExpRecv.GCode;
        end;

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
    end;


end;

//-----------------------------------------------------------------------------
//  OnEnterGridHani()
//      [範囲]ｸﾞﾘｯﾄﾞにﾌｫｰｶｽが当たった
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.OnEnterGridHani(Sender: TObject);
begin

    // ｺｰﾄﾞの桁数を取得する
    colSTCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;
    colEDCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;

    // 範囲の種類によりｸﾞﾘｯﾄﾞ内のTabStopを設定
    if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
    begin // 範囲選択時
        colStCode.TabStop       := TRUE;
        colStCode.DisableEditor := FALSE;
        colEdCode.TabStop       := TRUE;
        colEdCode.DisableEditor := FALSE;
    end
    else
    begin // 全件選択時
        colStCode.TabStop       := FALSE;
        colStCode.DisableEditor := TRUE;
        colEdCode.TabStop       := FALSE;
        colEdCode.DisableEditor := TRUE;
    end;

end;

//-----------------------------------------------------------------------------
//  OnKeyDownGridHani
//      [範囲]ｸﾞﾘｯﾄﾞでｷｰｲﾍﾞﾝﾄが発生
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.OnKeyDownGridHani(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
//    iCol        :   Integer;
//    iType       :   Integer;
//    rNmk        :   String;
    lvColName   :   String;
begin

    if ( Key = VK_ESCAPE ) then
    begin
        Close;
        Exit;
    end;

    if ( Key = VK_END ) then
    begin
        sbOk.SetFocus;
        Abort;
    end;

    if ( Key = VK_TAB ) then
        Exit;

    if ( Key = VK_RETURN ) or                             // [RETURN]
       ( Key = VK_RIGHT  ) or                             // [RIGHT ]
       ( Key = VK_LEFT   ) or                             // [LEFT  ]
       ( Key = VK_UP     ) or                             // [UP    ]
       ( Key = VK_DOWN   ) then                           // [DOWN  ]
    begin
        if ( Key = VK_RETURN ) then
        begin
            if ( not fnCheckInputGridField(TComponent(Screen.ActiveControl)) ) then
            begin
                // 入力値の誤り
                Beep;
                Abort;
            end;
        end;

		lvColName   :=  dxGridHani.Columns[dxGridHani.FocusedColumn].Name;

		if	( lvColName  = 'colSTCODE' ) or			    // 開始ｺｰﾄﾞ
			( lvColName  = 'colEDCODE' ) then			// 終了ｺｰﾄﾞ
		begin
			// ﾌﾘｰｺｰﾄﾞで編集中の時は、動きを捕捉しない。
			if	(( Key = VK_RIGHT ) or ( Key = VK_LEFT )) and
//				( dxMdMain.FieldByName('DATAFORMAT').AsInteger = 1 ) and
				( dxGridHani.State = tsEditing ) then
			begin
				Exit;
			end;
		end;

        // ｸﾞﾘｯﾄﾞ･ｶﾗﾑを移動する
        fnMoveColumn(Key, Shift);
        if ( Key = VK_RETURN ) and
           ( dxMdMain.FieldByName('RGCODE').AsInteger = 0 ) and
           ( dxMdMain.RecNo = dxMdMain.RecordCount ) then
        begin
            dxGridHani.ShowEditor;
            // ｷｰｲﾍﾞﾝﾄを発生させる(次の項目へ進む)
            sbOk.SetFocus;
            Exit;
        end;

        Abort;
    end;

end;

//-----------------------------------------------------------------------------
//  fnCheckInputGridField
//      範囲ｸﾞﾘｯﾄﾞの入力値をﾁｪｯｸする
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnCheckInputGridField(Sender: TObject): Boolean;
var
    iRange      :   Integer;
    stTable     :   String;
    stCompName  :   String;
    wCode       :   String;
    wName       :   String;
    wDumy       :   String;
begin

    Result := FALSE;

    stCompName := dxGridHani.Columns[dxGridHani.FocusedColumn].Name;
    dxMdMain.Edit;

    { 出力範囲のﾁｪｯｸ }
    if ( stCompName = 'colRGCODE' ) then
    begin
        if ( dxGridHani.State = tsEditing ) then
            iRange := StrToInt(dxGridHani.EditingText)
        else
            iRange := colRgCode.Field.AsInteger;

        m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;

        if ( m_iHaniZen <> m_iHaniGen ) or
           ( iRange     <> 1          ) then
        begin
            dxMdMain.FieldByName('RGCODE').AsInteger := iRange;
            dxMdMain.FieldByName('STCODE').AsString  := '';
            dxMdMain.FieldByName('EDCODE').AsString  := '';
            dxMdMain.FieldByName('STNAME').AsString  := '';
            dxMdMain.FieldByName('EDNAME').AsString  := '';

            if ( iRange = 1 ) then
            begin
                dxMdMain.FieldByName('STNAME').AsString  :=  '最初から';
                dxMdMain.FieldByName('EDNAME').AsString  :=  '最後まで';
            end;
        end;
    end;

    { 開始ｺｰﾄﾞのﾁｪｯｸ }
    if ( stCompName = 'colStCode' ) then
    begin
        if ( dxGridHani.State = tsEditing ) then
            wCode := dxGridHani.EditingText
        else
            wCode := colStCode.Field.AsString;

        if ( Trim(wCode) = '' ) then
            wName := '' // '最初から'
        else
        begin
            if ( dxMdMain.FieldByName('infDataFormat').AsInteger = 2 ) then
            begin
                if not JNTSelXIsNum(Trim(wCode)) then
                begin
                    Beep;
                    Exit;
                end;

                wCode := FormatFloat(StringOfChar('0', colStCode.MaxLength), StrToFloat(Trim(wCode)));
            end;
            stTable := dxMdMain.FieldByName('infTableName').AsString;
            if not gfnJNTSelNameGet(Qry, stTable, wCode, wDumy, wName) then
            begin
                Beep;
                Exit;
            end;
            dxMdMain.FieldByName('STCODE').AsString  := wCode;
        end;

        dxMdMain.FieldByName('STNAME').AsString := wName;
    end;

    { 終了ｺｰﾄﾞのﾁｪｯｸ }
    if ( stCompName = 'colEdCode' ) then
    begin
        if ( dxGridHani.State = tsEditing ) then
            wCode := dxGridHani.EditingText
        else
            wCode := colEdCode.Field.AsString;

        if ( Trim(wCode) = '' ) then
            wName := '' // '最後まで'
        else
        begin
            if ( dxMdMain.FieldByName('infDataFormat').AsInteger = 2 ) then
            begin
                if not JNTSelXIsNum(Trim(wCode)) then
                begin
                    Beep;
                    Exit;
                end;

                wCode := FormatFloat(StringOfChar('0', colEdCode.MaxLength), StrToFloat(Trim(wCode)));

                if ( JNTSelXStrToFloat(wCode) < JNTSelXStrToFloat(colStCode.Field.AsString) ) then
                begin
                    gfnJNTSelErrDlgx(Self, 52005);
                    dxGridHani.SetFocus;
                    dxGridHani.Columns[3].Field.FocusControl;
                    Exit;
                end;
            end else
            begin
                if ( wCode < colStCode.Field.AsString ) then
                begin
                    gfnJNTSelErrDlgx(Self, 52005);
                    dxGridHani.SetFocus;
                    dxGridHani.Columns[3].Field.FocusControl;
                    Exit;
                end;
            end;
            stTable := dxMdMain.FieldByName('infTableName').AsString;
            if not gfnJNTSelNameGet(Qry, stTable, wCode, wDumy, wName) then
            begin
                Beep;
                Exit;
            end;
            dxMdMain.FieldByName('EDCODE').AsString := wCode;
        end;

        dxMdMain.FieldByName('EDNAME').AsString := wName;
    end;

    Result := TRUE;

end;

//-----------------------------------------------------------------------------
//  fnMoveColumn
//      範囲ｸﾞﾘｯﾄﾞｶｰｿﾙを移動する
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnMoveColumn(Key: Word; Shift: TShiftState);
var
    iType       :   Integer;
    iCol, wCol  :   Integer;
    iRow, wRow  :   Integer;
begin

    iCol    :=  dxGridHani.FocusedColumn;
    iRow    :=  dxMdMain.RecNo;
    wCol    :=  iCol;
    wRow    :=  iRow;
    iType   :=  dxMdMain.FieldByName('RGCODE').AsInteger;

    case Key of
        VK_RETURN,                                      // [RETUEN]
        VK_RIGHT:                                       // [RIGHT ]
        begin
            if ( iCol = 1 ) then
            begin
                // 最終行でなければ次の行へ
                if ( ( iRow + 1 ) <= dxMdMain.RecordCount ) then
                    if ( iType = 0 ) or ( iType = 2 ) then
                        Inc(iRow)
                    else
                        iCol := 3
                else
                begin
                    if ( iType <> 1 ) then
                    begin
                        if ( Key = VK_RETURN ) then
                        begin
                            dxMdMain.Last;
                        end
                        else
                            dxMdMain.Last;
                    end
                    else
                        iCol := 3
                end;

            end else
            begin
                if ( iCol >= 3 ) then
                    iCol := 6
                else
                begin
                    iCol := 1;
                    Inc(iRow);
                end;
            end;
        end;
        VK_LEFT:                                        // [LEFT  ]
        begin
            if ( iCol = 1 ) then
            begin
                if ( iRow > 1 ) then
                begin
                    dxMdMain.Prior;
                    iType := dxMdMain.FieldByName('RGCODE').AsInteger;
                    dxMdMain.Next;
                    if ( iType = 1 ) then iCol := 6
                    else                  iCol := 1;
                    Dec(iRow);
                end;
            end else
            begin
                if ( iCol <= 3 ) then iCol := 1
                else
                if ( iCol <= 6 ) then iCol := 3
                else                  iCol := 6;
            end;
        end;
        VK_UP:                                          // [UP    ]
        begin
            if ( iRow > 1 ) then
            begin
                dxMdMain.Prior;
                iType := dxMdMain.FieldByName('RGCODE').AsInteger;
                dxMdMain.Next;
                if ( iType = 0 ) or ( iType = 2 ) then
                    iCol := 1;

            end;
            Dec(iRow);
        end;
        VK_DOWN:                                        // [DOWN  ]
        begin
            if ( ( iRow + 1 ) <= dxMdMain.RecordCount ) then
            begin
                dxMdMain.Next;
                iType := dxMdMain.FieldByName('RGCODE').AsInteger;
                dxMdMain.Prior;
                if ( iType = 0 ) or ( iType = 2 ) then
                    iCol := 1
            end;
            Inc(iRow);
        end;
    end;

    dxGridHani.Columns[iCol].Field.FocusControl;

    if ( iRow > dxMdMain.RecordCount ) then
        dxMdMain.Last;

    if ( iRow = 0 ) then
        dxMdMain.First;

    if ( iRow <> wRow ) then
    begin
        dxMdMain.RecNo := iRow;
        dxGridHani.SetFocus;
    end;

    if ( iCol <> wCol ) then
        dxGridHani.FocusedColumn := iCol;

    dxGridHani.ShowEditor;

    m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;
    m_iHaniZen := m_iHaniGen;

	// 2行目から1行目に←で移動すると、dxGridHaniChangeNodeもdxGridHaniChangeNodeExのｲﾍﾞﾝﾄが起きないのでここで行う
	// (↑ｷｰではdxGridHaniChangeNodeのｲﾍﾞﾝﾄが起きない)
	if ( iCol = 1 ) then
		fnChangeNode;

end;

//-----------------------------------------------------------------------------
//  dxGridHaniExit
//      ｸﾞﾘｯﾄﾞからﾌｫｰｶｽが抜けたとき
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxGridHaniExit(Sender: TObject);
begin

    // ﾌｫｰｶｽの色を背景と同色に
    dxGridHani.HideSelectionColor       := clWindow;
    dxGridHani.HideSelectionTextColor   := clWindowText;

end;

//-----------------------------------------------------------------------------
//  colRGCODECloseUp
//      ﾏｳｽでの範囲選択時の処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.colRGCODECloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
var
    rNmk    :   String;
    iType   :   Integer;
//    iRet    :   Integer;
begin

    dxMdMain.Edit;
    iType   :=  dxMdRange.FieldByName('RGCODE').AsInteger;

    // 範囲により名称を変更
//<001>    rNmk    :=  RangeTable[iType];
    rNmk    :=  fnGetRangeTable(iType);
    dxMdMain.FieldByName('RGCODE').AsInteger := iType; // ｺｰﾄﾞを設定
    dxMdMain.FieldByName('RGNAME').AsString := rNmk;   // 範囲名を設定

    // 現在の範囲を保存
    m_iHaniGen  :=  dxMdMain.FieldByName('RGCODE').AsInteger;
    m_iHaniZen  :=  m_iHaniGen;

    // [1:範囲]の場合
    if ( dxMdRange.FieldByName('RGCODE').AsInteger = 1 ) then
    begin
        dxMdMain.FieldByName('STCODE').AsString := '';
        dxMdMain.FieldByName('STNAME').AsString := '最初から';
        dxMdMain.FieldByName('EDCODE').AsString := '';
        dxMdMain.FieldByName('EDNAME').AsString := '最後まで';
    end;

    // [0:全件]または[2:複数]の場合
    if (dxMdRange.FieldByName('RGCODE').AsInteger = 0) or
       (dxMdRange.FieldByName('RGCODE').AsInteger = 2) then
    begin
        dxMdMain.Edit;
        dxMdMain.FieldByName('STCODE').AsString := '';
        dxMdMain.FieldByName('STNAME').AsString := '';
        dxMdMain.FieldByName('EDCODE').AsString := '';
        dxMdMain.FieldByName('EDNAME').AsString := '';
        dxGridHani.SetFocus;

        // 最終行ならばOKﾎﾞﾀﾝへ。
        if ( dxMdMain.RecordCount = dxMdMain.RecNo ) then
        begin
            sbOk.SetFocus;
            Exit;
        end;
    end;

    // ｷｰｲﾍﾞﾝﾄを発生させる(次の項目へ進む)
    keybd_event(VK_RETURN, 0, 0, 0);

end;

//-----------------------------------------------------------------------------
//  fnChangeNode()
//      ﾉｰﾄﾞ移動時処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.fnChangeNode;
begin

    // 範囲の種類によりｸﾞﾘｯﾄﾞ内のTabStopを設定
    if ( dxMdMain.FieldByName('RGCODE').AsInteger = 1 ) then
    begin // 範囲選択時
        colStCode.TabStop       := TRUE;
        colStCode.DisableEditor := FALSE;
        colEdCode.TabStop       := TRUE;
        colEdCode.DisableEditor := FALSE;
    end
    else
    begin // 全件、複数選択時
        colStCode.TabStop       := FALSE;
        colStCode.DisableEditor := TRUE;
        colEdCode.TabStop       := FALSE;
        colEdCode.DisableEditor := TRUE;
    end;

    m_iHaniGen := dxMdMain.FieldByName('RGCODE').AsInteger;
    m_iHaniZen := m_iHaniGen;

    // ｺｰﾄﾞの桁数を取得する
    colSTCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;
    colEDCODE.MaxLength :=  ds.DataSet.FieldbyName('CodeDigit').AsInteger;

end;

//-----------------------------------------------------------------------------
//	MouseDown(dxGridHani)
//      ﾏｳｽ押下時の処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.dxGridHaniMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	iFocus	:	Integer;
    i		:	Integer;
begin

    iFocus  :=  dxGridHani.FocusedColumn;
//<2255>
	//グリッドが複数行で２行目でエンターを押下後に１行目のレコードにフォーカスを当てた際に
	//チェンジノードが流れていなかったため追加しました。
	if dxMdMain.RecNo = 1 then
	begin
    fnChangeNode;
	end;
//<2255>
    // 入力不可ﾌｨｰﾙﾄﾞをｸﾘｯｸした場合、手前の入力可能ﾌｨｰﾙﾄﾞへ移動
	// ただし先頭ﾌｨｰﾙﾄﾞの場合は次ﾌｨｰﾙﾄﾞへ。
	if ( iFocus = 0 ) then
    begin
  		dxGridHani.FocusedColumn := 1;
   		MJSSetFocus(Self,dxGridHani.Name);
		exit;
    end
    else
    begin
		if ( dxGridHani.columns[iFocus].TabStop = FALSE ) then
	   	begin
	        for i := iFocus - 1 downto 0 do
	    	begin
	            if ( dxGridHani.columns[i].TabStop = TRUE ) then
	            begin
	        		dxGridHani.FocusedColumn := i;
	        		MJSSetFocus(Self,dxGridHani.Name);
					Exit;
	            end;
	        end;
		end;
    end;

end;

//-----------------------------------------------------------------------------
//	FormShow
//	    フォーム表示時処理
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.FormShow(Sender: TObject);
begin

{<003>
	if fPattern.Enabled = FALSE then
    begin
        fORDER1.SetFocus;
//    	fnMoveNextColumn;
    end;
}
    //<003> 初期ﾌｫｰｶｽがColumns[0]残る現象を回避
    if dxGridHani.Enabled then
    begin
        dxGridHani.SetFocus;
        dxGridHani.Columns[1].Field.FocusControl;
    end;

    m_FirstCtl.SetFocus;    //<003>

	if m_FirstCtl = sbOk then
	begin
		PostMessage(Self.Handle, WM_AUTO, 0, 0);
	end;

end;

//-----------------------------------------------------------------------------
// WM_AutoClose()
//      PARAM   : Msg: TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTPDialog.WM_AutoClose(var Msg: TMessage);
begin
	sbOkClick(sbOk);
end;

//------------------------------------------------------------------------------
//  fnGetMastrInfo()
//      マスター基本情報テーブルよりコード属性・桁数の取得
//------------------------------------------------------------------------------
function TFrmJNTPDialog.fnGetMastrInfo(nMasterKBN: Integer; var nCodeAttr, nCodeDigit: Integer): Boolean;
begin

    with DmqMasterInfo do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT CodeAttr, CodeDigit FROM MasterInfo '
            +   'WHERE  (MasterKbn = :pMasterKbn)           ');
        ParamByName('pMasterKbn').AsInteger :=  nMasterKbn;
        Open();

        if not EOF then
        begin
            nCodeAttr   :=  GetFld('CodeAttr')  .AsInteger;
            nCodeDigit  :=  GetFld('CodeDigit') .AsInteger;
            Result      :=  TRUE;
        end
        else
        begin
            nCodeAttr   :=  0;
            nCodeDigit  :=  0;
            Result      :=  FALSE;
        end;

        Close();
    end;

end;
{
//------------------------------------------------------------------------------
//  fnJNTNameGet()
//      各種マスターコード、簡略名称を取得する
//------------------------------------------------------------------------------
function TFrmJNTPDialog.fnJNTNameGet(TNM, SNM, Code : String; MasKbn, Attr: Integer;  var rNmk: String): Boolean;
var
    lvWhere, lvSQL, lvCode  :   String;
begin

    // ｺｰﾄﾞ入力なしの場合はｴﾗｰ
    if Trim(Code) = '' then
    begin
        rNmk   := '';
        Result := False;
        Exit;
    end;

    // 属性対応
    if ( Attr in [0,1] ) then
        lvCode  :=  FormatFloat(StringOfChar('0', 16), StrToFloat(Trim(Code)))
    else
        lvCode  :=  TrimRight(Code);


    case MasKbn of
        // 科目
        1:
        begin
            lvWhere :=      ' WHERE GCODE = ' + '''' + lvCode + '''' + ' AND (SubCode = 0) '
                        +   '   AND (MasterKbn = :MasKbn) AND (RDelKbn = 0) ';
        end;
        // 銀行,汎用補助1～5,部門
        21,31..35,41:
        begin
            lvWhere :=      ' WHERE GCODE = ' + '''' + lvCode + ''''
                        +   '   AND (MasterKbn = :MasKbn) AND (RDelKbn = 0)  ';
        end
        else
        begin
            lvWhere :=      ' WHERE GCODE = ' + '''' + lvCode + '''' + ' AND (RDelKbn = 0) ';
        end;
    end;

    with Qry do
    begin
        Close();
        SQL.Clear();
        // ｺｰﾄﾞ, 簡略名称を返す
        lvSQL := 'SELECT ' + SNM + ' as NMK ' +
                 ' FROM '  + TNM +
                 lvWhere;
        SQL.Add(lvSQL);

        if ( MasKbn in [1,21,31,32,33,34,35,41] ) then
            ParamByName('MasKbn').AsInteger :=  MasKbn;

        Open();

        // 該当ﾃﾞｰﾀなし
        if ( EOF = TRUE ) then
        begin
            rNmk   := '';
            Result := False;
        end
        else
        begin
            rNmk   := FieldByName('Nmk').AsString;
            Result := True;
        end;
        Close();
    end;

end;
}
//------------------------------------------------------------------------------
//  fnJNTNameGet()  <002>
//      各種マスターコード、簡略名称を取得する
//------------------------------------------------------------------------------
function TFrmJNTPDialog.fnJNTNameGet(TNM, SNM, Code, WhereStr: String; MasKbn, Attr: Integer;  var rNmk: String): Boolean;
var
    lvWhere, lvSQL, lvCode  :   String;
    DBDigit					:	Integer;			// DB上の桁数				// 050901 hirota
begin

    // ｺｰﾄﾞ入力なしの場合はｴﾗｰ
    if Trim(Code) = '' then
    begin
        rNmk   := '';
        Result := False;
        Exit;
    end;

	// 050901 hirota 商品マスター対応 >>
	DBDigit := 16;
    if MasKbn = 81 then												// 商品
		DBDigit := 20;												// 20桁
	// 050901 hirota 商品マスター対応 <<

    if MasKbn = 9000 then											// 単位
		DBDigit := 2;												// 2桁

    // 属性対応
    if ( Attr in [0,1] ) then
        lvCode  :=  FormatFloat(StringOfChar('0', DBDigit), StrToFloat(Trim(Code)))	// 050901 hirota 商品マスター対応
    else
        lvCode  :=  TrimRight(Code);


    lvWhere := ' WHERE GCODE = ' + '''' + lvCode + '''' + ' ' ;

    if WhereStr <>'' then
        lvWhere := lvWhere + ' AND ' + WhereStr;

    with Qry do
    begin
        Close();
        SQL.Clear();
        // ｺｰﾄﾞ, 簡略名称を返す
        lvSQL := 'SELECT ' + SNM + ' as NMK ' +
                 ' FROM '  + TNM +
                 lvWhere;
        SQL.Add(lvSQL);

        Open();

        // 該当ﾃﾞｰﾀなし
        if ( EOF = TRUE ) then
        begin
            rNmk   := '';
            Result := False;
        end
        else
        begin
            rNmk   := FieldByName('Nmk').AsString;
            Result := True;
        end;
        Close();
    end;

end;


{
//-----------------------------------------------------------------------------
//  fnMakeDlgFields()   //<004>Del
//
//      範囲指定のﾌｨｰﾙﾄﾞを設定(Default用)
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnMakeDlgFields: Boolean;
var
    lvIniFile   :   TIniFile;
    lvStr,
    lvSection,
    lvField     :   String;
    lvCnt       :   Integer;
    lvTDtEdt    :   TMDateEdit;
    lvTSpnBtn   :   TSpinButton;

    //---各日付情報---//
    lvType      :	Integer;	// 使用ﾀｲﾌﾟ(1:開始日付～終了日付、2:日付)
    lvCaption   : 	String;		// ﾀｲﾄﾙ
    lvDataFormat:   Integer;	// ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)
	lvIndInput  :	Boolean;	// 入力必須(TRUE:入力必須、FALSE:未入力可)

    //---各ｺｰﾄﾞ情報---//
    lvTableName : 	String;		// ﾃｰﾌﾞﾙ名      (名称取得用)
    lvShortName :   String;     // 簡略名称     (名称取得用)
    lvMasterKbn :   Integer;    // ﾏｽﾀ区分      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvModulKbn  :   Integer;    // ﾓｼﾞｭｰﾙ区分   (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvPatternNo :   Integer;    // ﾊﾟﾀｰﾝNO      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvCodeDigit :   Integer;    // ｺｰﾄﾞ桁数
    lvCodeAttr  :   Integer;    // ｺｰﾄﾞ属性     (0:数値1:数値(前ｾﾞﾛ有)2:ﾌﾘｰ)

    // 保存ﾃﾞｰﾀ表示用
	lvStCode,              		// 開始ｺｰﾄﾞ
	lvStName,                   // 開始名称
	lvEdCode,                   // 終了ｺｰﾄﾞ
	lvEdName    :   String;     // 終了名称
    lvRgCode    :   Integer;    // 範囲ｺｰﾄﾞ

    i,j         :   Integer;
begin

	// 初期化
    Result  :=  TRUE;

	// ﾌｨｰﾙﾄﾞをｸﾘｱする
    DatePnl1.Visible    :=  FALSE;
    dxMdMain.Active     :=  FALSE;
    uvDtFldNm           :=  '';
    uvIndInput          :=  FALSE;
    fPattern.Items.Clear;

	// 項目設定用iniﾌｧｲﾙを読み込む
    lvIniFile   :=  TIniFile.Create(m_Hani.pvDlgIniFile);
    try
        with lvIniFile, m_Hani do
        begin

// ---------------------------
//      印刷パターン
// ---------------------------
            lvCnt := 0;
            while TRUE do
            begin
            	// 項目名の作成
	            lvField :=  'Text'+ IntToStr(lvCnt);
    	        // 情報取得 印刷ﾊﾟﾀｰﾝ
	            lvStr   :=  ReadString('PrnPatternInf', lvField, '');

                // 終了の判断
                if ( lvStr = '' ) then Break;

                // 印刷ﾊﾟﾀｰﾝに追加する
                fPattern.Items.Add(lvStr);
				Inc(lvCnt);
            end;

            // 1件しかなかったら選択不可にする
            if ( lvCnt = 1 ) then
            begin
                fPattern.Enabled := FALSE;
                fPattern.TabStop := FALSE;
            end;

            with fPattern do
            begin
                if ( Items.Count <= 0 ) then
                begin
                	// 使用しない
                    ItemIndex   :=  -1;
                    Enabled     :=  FALSE;
                end
                else
                begin
                	// ﾃﾞﾌｫﾙﾄ値、及び保存値を設定する
                    if ( pvrPattern >= 0 ) then
                            ItemIndex   :=  pvrPattern	// 保存ﾃﾞｰﾀを表示する
                    else    ItemIndex   :=  0;			// ﾃﾞﾌｫﾙﾄ表示
                end;
            end;

// ---------------------------
//          日付
// ---------------------------
            //ｾｸｼｮﾝを作成する
            lvSection := 'DateInf_0';

            // 情報取得
            // 使用ﾀｲﾌﾟ(1:開始日付～終了日付、2:日付)　※ FXでは1しか対応しません
            lvType          :=  ReadInteger(lvSection, 'Type', -1);
            // ﾀｲﾄﾙ名称
            lvCaption       :=  ReadString (lvSection, 'Caption',    '');
            // 日付ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)      ※ FXでは1しか対応しません
            lvDataFormat    :=  ReadInteger(lvSection, 'DataFormat', -1);
            uvDataFormat    :=  lvDataFormat;
            lvIndInput      :=  TRUE;

            if ( not ( lvType = -1 ) or not ( lvDataFormat = -1 )) then
            begin
                //=== ｷｬﾌﾟｼｮﾝの設定 ===//
                lvStr   :=  'fDateCap1';
                TLabel(JNTSelXFindCtrl(Self, lvStr)).Caption := lvCaption;

                //=== 必須入寮区分の設定 ===//
                uvIndInput  :=  lvIndInput;

                //=== 開始日付の制御 ===//
                // 各ｺﾝﾎﾟｰﾈﾝﾄを取得する
                lvStr       :=  'fSDATE1';
                lvTDtEdt    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
                lvStr       :=  'SpnBtn' + lvStr;
                lvTSpnBtn   :=  TSpinButton(JNTSelXFindCtrl(Self, lvStr));

                lvTDtEdt.DateInputType  :=  diYMD;	        // ﾌｫｰﾏｯﾄ
                lvTDtEdt.SepChar        :=  '/';			// ｾﾊﾟﾚｰﾀ
                lvTDtEdt.ArrowDisp      :=  adFocused;	    // ↓を表示
                lvTDtEdt.Calendar       :=  TRUE;			// ｶﾚﾝﾀﾞｰを表示
                lvTSpnBtn.Visible       :=  FALSE;		    // ｽﾋﾟﾝﾎﾞﾀﾝで表示不可

                lvTDtEdt.AsDateTime     :=  JNTSelXIntToDate(pvrStDate, #0);

                //=== 終了日付の制御 ===//
                // 各ｺﾝﾎﾟｰﾈﾝﾄを取得する
                lvStr       :=  'fEDATE1';
                lvTDtEdt    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
                lvStr       :=  'SpnBtn' + lvStr;
                lvTSpnBtn   :=  TSpinButton(JNTSelXFindCtrl(Self, lvStr));

                // 使用ﾀｲﾌﾟに対応する
                if ( lvType = 1 ) then
                begin
                    //「xxxx/xx/xx ～ xxxx/xx/xx」の範囲指定の時
                    lvTDtEdt.Visible := TRUE;

                    lvTDtEdt.DateInputType  :=  diYMD;	        // ﾌｫｰﾏｯﾄ
                    lvTDtEdt.SepChar        :=  '/';			// ｾﾊﾟﾚｰﾀ
                    lvTDtEdt.ArrowDisp      :=  adFocused;      // ↓を表示
                    lvTDtEdt.Calendar       :=  TRUE;			// ｶﾚﾝﾀﾞｰを表示
                    lvTSpnBtn.Visible       :=  FALSE;		    // ｽﾋﾟﾝﾎﾞﾀﾝで表示不可

                    lvTDtEdt.AsDateTime     :=  JNTSelXIntToDate(pvrEdDate, #0);
                                                                            // 保存ﾃﾞｰﾀを表示
                end
                else
                begin
                    //「xxxx/xx/xx」の範囲指定の時

                    // 終了日付を非表示
                    lvTDtEdt.Visible    :=  FALSE;
                    lvTSpnBtn.Visible   :=  FALSE;

                    //「～」非表示
                    lvStr   :=  'KARA1';
                    TLabel(JNTSelXFindCtrl(Self, lvStr)).Visible := FALSE;
                end;

                //日付パネル表示
                lvStr   :=  'DatePnl1';
                TPanel(JNTSelXFindCtrl(Self, lvStr)).Visible := TRUE;

            end;

// ---------------------------
//          各種ｺｰﾄﾞ
// ---------------------------
            lvCnt       :=  0;
            dxMdRange.Open;         // 範囲対象ﾃｰﾌﾞﾙを開く
            dxMdMain.Open;

            while TRUE do
            begin
            	// ｾｸｼｮﾝを作成する
	            lvSection       :=  'CodeInf_' + IntToStr(lvCnt);

                // 情報取得
                lvCaption       :=  ReadString (lvSection,  'Caption',   '');	// ﾀｲﾄﾙ
                lvTableName	    :=  ReadString (lvSection,  'TableName', '');	// ﾃｰﾌﾞﾙ名(名称取得用)
                lvShortName     :=  ReadString (lvSection,  'ShortName', '');   // 簡略名称のﾌｨｰﾙﾄﾞ名(名称取得用)
                lvMasterKbn     :=  ReadInteger(lvSection,  'MasterKbn', -1);   // ﾏｽﾀ区分(桁数認識、検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvModulKbn      :=  ReadInteger(lvSection,  'ModulKbn',  0 );   // ﾓｼﾞｭｰﾙｺｰﾄﾞ(検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvPatternNo     :=  ReadInteger(lvSection,  'PatternNo', 0 );   // ﾊﾟﾀｰﾝNO(検索ｴｸｽﾌﾟﾛｰﾗ用)

                // ｺｰﾄﾞ属性・桁数
                fnGetMastrInfo(lvMasterKbn,lvCodeAttr,lvCodeDigit);


                // 終了
                if ( lvMasterKbn = -1 ) then Break;

                // ==== 範囲の各項目を設定する ====
                if ( dxMdRange.RecordCount = 0 ) then
                begin
                    for i := 0 to 1 do
                    begin
                        dxMdRange.Append;
                        dxMdRange.FieldByName('RgCode').AsInteger   :=  i;
                        dxMdRange.FieldByName('RgName').AsString    :=  RangeTable[i];
                        dxMdRange.Post;
                    end;
                end;

                if Length(pvrRgType) >= 1 then
                begin
                	// 保存ﾃﾞｰﾀを表示する 1
                    lvRgCode    :=  pvrRgType[lvCnt];
                    lvStCode    :=  pvrStCode[lvCnt];
                    lvStName    :=  pvrStName[lvCnt];
                    lvEdCode    :=  pvrEdCode[lvCnt];
                    lvEdName    :=  pvrEdName[lvCnt];
                end
                else
                begin
                    // ﾃﾞﾌｫﾙﾄ情報を表示する
                    lvStCode    :=  '';
                    lvStName    :=  ''; // '最初から';
                    lvEdCode    :=  '';
                    lvEdName    :=  ''; // '最後まで';
                end;

                // 範囲指定項目を追加
                with dxMdMain do
                begin
                	Append;
                    FieldByName('Caption')      .AsString   :=  lvCaption;      // 名称
                    FieldByName('dmyRgCode')    .AsInteger  :=  lvRgCode;       // 出力範囲


                    if ( lvRgCode = 0 ) then
                    begin
                        FieldByName('STCODE')       .AsString   :=  '';       // 開始ｺｰﾄﾞ
                        FieldByName('EDCODE')       .AsString   :=  '';       // 終了ｺｰﾄﾞ
                    end
                    else
                    begin
                        if ( lvCodeAttr in [0,1] ) then
                        begin
                            // 開始ｺｰﾄﾞ
                            if ( lvStCode = '0000000000000000' ) or ( lvStCode = '' ) then
                                FieldByName('STCODE').AsString   :=  ''
                            else
                            begin
                                lvStCode    :=  IntToStr(StrToIntDef(lvStCode,0));
                                FieldByName('STCODE').AsString   :=
                                    FormatFloat(StringOfChar('0', lvCodeDigit), StrToFloat(lvStCode));
                            end;

                            // 終了ｺｰﾄﾞ
                            if ( lvEdCode = '0000000000000000' ) or ( lvEdCode = '' ) then
                                FieldByName('EDCODE').AsString   :=  ''
                            else
                            begin
                                lvEdCode    :=  IntToStr(StrToIntDef(lvEdCode,0));
                                FieldByName('EDCODE').AsString   :=
                                    FormatFloat(StringOfChar('0', lvCodeDigit), StrToFloat(lvEdCode));
                            end;
                        end
                        else if ( lvCodeAttr = 2 ) then
                        begin
                            FieldByName('STCODE')       .AsString   :=  lvStCode;       // 開始ｺｰﾄﾞ
                            FieldByName('EDCODE')       .AsString   :=  lvEdCode;       // 終了ｺｰﾄﾞ
                        end;
                    end;

                    FieldByName('TABLENAME')    .AsString   :=  lvTableName;    // ﾃｰﾌﾞﾙ名
                    FieldByName('ShortName')    .AsString   :=  lvShortName;    // 簡略名称
                    FieldByName('CodeAttr')     .AsInteger  :=  lvCodeAttr;     // ｺｰﾄﾞ属性
                    FieldByName('CodeDigit')    .AsInteger  :=  lvCodeDigit;    // ｺｰﾄﾞ桁数
                    FieldByName('KARA')         .AsString   :=  '～';
                    FieldByName('MasterKbn')    .AsInteger  :=  lvMasterKbn;    // ﾏｽﾀ区分
                    FieldByName('ModulKbn')     .AsInteger  :=  lvModulKbn;     // ﾓｼﾞｭｰﾙ区分
                    FieldByName('PatternNo')    .AsInteger  :=  lvPatternNo;    // ﾊﾟﾀｰﾝNO
                    Post;
                end;

                // 次ﾚｺｰﾄﾞ
                Inc(lvCnt);
            end;

// ---------------------------
//          出力指示
// ---------------------------
            // 小計毎に改頁
            cbShokei.Enabled    :=  (ReadInteger('DisplayInf', 'Shokei', 0) = 1);
            cbShokei.Checked    :=  pvrShokei;

            // 削除されたものを出力する
            cbDelete.Enabled    :=  (ReadInteger('DisplayInf', 'Delete', 0) = 1);
            cbDelete.Checked    :=  pvrDelete;

            // ﾃﾝﾌﾟﾚｰﾄを出力する
            cbTemplate.Enabled  :=  (ReadInteger('DisplayInf', 'Template', 0) = 1);
            cbTemplate.Checked  :=  pvrTemplate;

			//〓〓〓　出力順を設定する　〓〓〓//
            lvCnt := 0;
            while TRUE do
            begin
            	// 項目名の作成
	            lvField :=  'Text'+ IntToStr(lvCnt);

    	        // 情報取得
	            lvStr   :=  ReadString('OrderInf_0', lvField, '');

                // 終了の判断
                if ( lvStr = '' ) then Break;

                // 出力順序に追加する
                fORDER1.Items.Add(lvStr);

				Inc(lvCnt);
            end;

            // 1件しかなかったら選択不可にする
            if ( lvCnt = 1 ) then
            begin
                fORDER1.Enabled := FALSE;
                fORDER1.TabStop := FALSE;
            end;

            with fORDER1 do
            begin
                if ( Items.Count <= 0 ) then
                begin
                	// 使用しない
                    ItemIndex   :=  -1;
                    Enabled     :=  FALSE;
                end
                else
                begin
                	// ﾃﾞﾌｫﾙﾄ値、及び保存値を設定する
                    if ( pvrOrder >= 0 ) then
                            ItemIndex   :=  pvrOrder	// 保存ﾃﾞｰﾀを表示する
                    else    ItemIndex   :=  0;			// ﾃﾞﾌｫﾙﾄ表示
                end;
            end;

            fORDER1.DropDownCount := fORDER1.Items.Count;
        end;

    finally
		lvIniFile.Free;
    end;

end;
}
//-----------------------------------------------------------------------------
//  fnMakeDlgFields()  <004>
//
//      範囲指定のﾌｨｰﾙﾄﾞを設定
//      印刷ﾊﾟﾀｰﾝの変更に伴い内容を変化させる
//      既存のﾊﾟﾗﾒｰﾀは既定値として設定されDLG作成時にｾｯﾄさせる
//
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnMakeDlgFields: Boolean;
var
    lvIniFile   :   TIniFile;
    lvStr,
    lvSection,
    lvField     :   String;
    lvCnt       :   Integer;
    lvTDtEdt    :   TMDateEdit;
    lvTSpnBtn   :   TSpinButton;

    //---各日付情報---//
    lvType      :	Integer;	// 使用ﾀｲﾌﾟ(1:開始日付～終了日付、2:日付)
    lvCaption   : 	String;		// ﾀｲﾄﾙ
    lvDataFormat:   Integer;	// ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)
	lvIndInput  :	Boolean;	// 入力必須(TRUE:入力必須、FALSE:未入力可)

    //---各ｺｰﾄﾞ情報---//
    lvTableName : 	String;		// ﾃｰﾌﾞﾙ名      (名称取得用)
    lvShortName :   String;     // 簡略名称     (名称取得用)
    lvMasterKbn :   Integer;    // ﾏｽﾀ区分      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvModulKbn  :   Integer;    // ﾓｼﾞｭｰﾙ区分   (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvPatternNo :   Integer;    // ﾊﾟﾀｰﾝNO      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvCodeDigit :   Integer;    // ｺｰﾄﾞ桁数
    lvCodeAttr  :   Integer;    // ｺｰﾄﾞ属性     (0:数値1:数値(前ｾﾞﾛ有)2:ﾌﾘｰ)

    // 保存ﾃﾞｰﾀ表示用
	lvStCode,              		// 開始ｺｰﾄﾞ
	lvStName,                   // 開始名称
	lvEdCode,                   // 終了ｺｰﾄﾞ
	lvEdName    :   String;     // 終了名称
    lvRgCode    :   Integer;    // 範囲ｺｰﾄﾞ

    i,j         :   Integer;

    //--<004>St ----------------------------------------------------------------
    lvStrPtn    :   String;     // 印刷ﾊﾟﾀｰﾝItemIndex
    lvWhereStr  :   String;     // Exp用その他Where句

    lvDefSection   :   String;
    //---各日付情報ﾃﾞﾌｫﾙﾄ---//
    lvDefType      :   Integer;	    // 使用ﾀｲﾌﾟ(1:開始日付～終了日付、2:日付)
    lvDefCaption   :   String;		// ﾀｲﾄﾙ
    lvDefDataFormat:   Integer;	    // ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)
	lvDefIndInput  :   Boolean;	    // 入力必須(TRUE:入力必須、FALSE:未入力可)

    //---各ｺｰﾄﾞ情報ﾃﾞﾌｫﾙﾄ---//
    lvDefTableName :   String;		// ﾃｰﾌﾞﾙ名      (名称取得用)
    lvDefShortName :   String;      // 簡略名称     (名称取得用)
    lvDefMasterKbn :   Integer;     // ﾏｽﾀ区分      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvDefModulKbn  :   Integer;     // ﾓｼﾞｭｰﾙ区分   (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvDefPatternNo :   Integer;     // ﾊﾟﾀｰﾝNO      (検索ｴｸｽﾌﾟﾛｰﾗ用)
    lvDefCodeDigit :   Integer;     // ｺｰﾄﾞ桁数
    lvDefCodeAttr  :   Integer;     // ｺｰﾄﾞ属性     (0:数値1:数値(前ｾﾞﾛ有)2:ﾌﾘｰ)
    lvDefWhereStr  :   String;

    lvDefShokei    :   Integer;     // 小計
    lvDefDelete    :   Integer;     // 削除
    lvDefTemplate  :   Integer;     // ﾃﾝﾌﾟﾚｰﾄ

    lvDefPNayose   :   Integer;     // 名寄せ親     <002>
    lvDefCNayose   :   Integer;     // 名寄せ子     <002>

    lvDefTSaiyou   :   Integer;     // 得意先採用   <002>
    lvDefSSaiyou   :   Integer;     // 仕入先採用   <002>
    lvDefNSaiyou   :   Integer;     // 採用なし     <002>
    //--<004>ED ----------------------------------------------------------------

    lvHojyoNM      :   String;
	lvTranChar	   :   String;		// 取引区分		<016>

	lvKakucho		:	Boolean;
	iKbn			:	Integer;

	lvSELCSTM		:	string;		//販売個別処理情報 <2255>

//<HOU2>    lvIniFileNm    :   string;      // <HOU>dlg.iniファイル名のみ
//<TAX> ADD St

    function containsSyosaiIndex(index: Integer): Boolean;
    var
        i: Integer;
    begin
        result := false;
        for i := 0 to Length(m_arySyosai) -1 do
        begin
            if index = m_arySyosai[i] then
            begin
                result := true;
                Exit;
            end;
        end;
    end;
//<TAX> ADD Ed
begin

	// 初期化
    Result  :=  TRUE;

    lvRgCode := 0;

    dxMdRange.Close;        //<004>
    dxMdMain.Close;         //<004>

    fORDER1.Items.Clear;    //<004>

	// ﾌｨｰﾙﾄﾞをｸﾘｱする
    DatePnl1.Visible    :=  FALSE;
    dxMdMain.Active     :=  FALSE;
    uvDtFldNm           :=  '';
    uvIndInput          :=  FALSE;

    // 初回は印刷ﾊﾟﾀｰﾝのｸﾘｱを行う
    if m_FirstFlg then
        fPattern.Items.Clear;

	// 項目設定用iniﾌｧｲﾙを読み込む
//<020> ↓
	lvKakucho := False;
	for i:=0 to Length(ucKakucho)-1 do
	begin
		if m_Hani.pvMasterKbn = ucKakucho[i] then
		begin
			lvKakucho := True;
			break;
		end;
	end;

	if lvKakucho then
	begin
		lvStr		:=	Copy(m_Hani.pvDlgIniFile,0,Length(m_Hani.pvDlgIniFile)-7);
		lvStr		:=	lvStr + '_1Dlg.ini';
	    lvIniFile   :=  TIniFile.Create(lvStr);

//<HOU2>        lvIniFileNm :=  ExtractFileName(lvStr); //<HOU>
	end
	else
	begin
	    lvIniFile   :=  TIniFile.Create(m_Hani.pvDlgIniFile);

//<HOU2>        lvIniFileNm :=  ExtractFileName(m_Hani.pvDlgIniFile); //<HOU>
	end;
//<020> ↑

// <024> ADD start
    if ucKOJI_INI = ExtractFileName(m_Hani.pvDlgIniFile) then
    begin
        fnGetKeiRenKbn(m_Hani.pvMasterKbn,m_iKbn17);
        m_KojiFlg   := true;
    end
    else
        m_KojiFlg   := false;
// <024> ADD end

    try
        with lvIniFile, m_Hani do
        begin

// ---------------------------
//      印刷パターン
// ---------------------------
            if m_FirstFlg then      //<004>

            begin
                lvCnt := 0;
                while TRUE do
                begin

// <024> ADD start
                    if m_KojiFlg = true then
                    begin
                        if (m_iKbn17 = 0) and
                            ((lvCnt = 3) or (lvCnt = 4 ) or
                            (lvCnt = 9) or (lvCnt = 10)) then
                        begin
		    		        Inc(lvCnt);
                            Continue;
                        end;
// <025> ADD start
						// コンボのindex <> PatternNoになってしまうのでとっておく
						SetLength(m_aryPtnNo, Length(m_aryPtnNo) + 1);
						m_aryPtnNo[High(m_aryPtnNo)] := lvCnt;
// <025> ADD end
                    end;
// <024> ADD end

                	// 項目名の作成
	                lvField :=  'Text'+ IntToStr(lvCnt);
    	            // 情報取得 印刷ﾊﾟﾀｰﾝ
	    	        lvStr   :=  ReadString('PrnPatternInf', lvField, '');
					lvSELCSTM:= ReadString('PrnPatternInf', 'SELCSTM'+ IntToStr(lvCnt), '');	//<2255>

                    // 終了の判断
                    if ( lvStr = '' ) then Break;
//<2255>↓
                    if fnSelCostmCheck(lvStr,lvSELCSTM) then
                    begin
                        Inc(lvCnt);
                        continue;
                    end;

//<2255>↑
{<HOU2>↓
                    //↓<HOU>
                    if (AnsiSameText(lvIniFileNm,ucKBNTOROKU_U) and (lvStr = ucSJ_LIST))
                    or (AnsiSameText(lvIniFileNm,ucKBNTOROKU_S) and (lvStr = ucNJ_LIST))
                    then
                    begin
                        if not (m_IsHOUEI) then
                        begin
        		    		Inc(lvCnt);
                            Continue;
                        end;
                    end;
                    //↑<HOU>
<HOU2>↑}

                    // 印刷ﾊﾟﾀｰﾝに追加する
//<008>                    fPattern.Items.Add(lvStr);
//<008> --- Add --------

                    lvHojyoNM := StringReplace(lvStr,ucReplaceNM, m_Hani.pvHojyoName,[rfReplaceAll]);

                    if (m_Hani.pvHojyoName ='') or (lvHojyoNM = '') then
                        i := fPattern.Items.Add(lvStr)  //<TAX> ADD
//<TAX> DEL                        fPattern.Items.Add(lvStr)
                    else
                    begin
                        i := fPattern.Items.Add(lvHojyoNM);  //<TAX> ADD
//<TAX> DEL                        fPattern.Items.Add(lvHojyoNM);
                    end;
//<008> --- Add --------
//<TAX> ADD St
                    // 詳細リストのインデックスを保持
                    if (MJSHanPos('[詳細型]', lvStr) >= 1) then
                    begin
                        SetLength(m_arySyosai, Length(m_arySyosai) +1);
                        m_arySyosai[High(m_arySyosai)] := i;
                    end;
//<TAX> ADD Ed
		    		Inc(lvCnt);
                end;

                // 1件しかなかったら選択不可にする
                if ( lvCnt = 1 ) then
                begin
                    fPattern.Enabled := FALSE;
                    fPattern.TabStop := FALSE;
                end;

                with fPattern do
                begin
                    if ( Items.Count <= 0 ) then
                    begin
                    	// 使用しない
                        ItemIndex   :=  -1;
                        Enabled     :=  FALSE;
                    end
                    else
                    begin
                    	// ﾃﾞﾌｫﾙﾄ値、及び保存値を設定する
                        if ( pvrPattern >= 0 ) then
                                ItemIndex   :=  pvrPattern	// 保存ﾃﾞｰﾀを表示する
                        else    ItemIndex   :=  0;			// ﾃﾞﾌｫﾙﾄ表示
                    end;
                end;

                m_FirstFlg := False;        //<004>
                fPattern.ItemIndex := 0;    //<先頭項目>
				fPattern.DropDownCount	:= fPattern.Items.Count;
            end;

            lvStrPtn := IntToStr(fPattern.ItemIndex);       // 印刷ﾊﾟﾀｰﾝ文字列作成

// <025> ADD start
			if m_KojiFlg then
			begin
            	lvStrPtn := IntToStr(m_aryPtnNo[fPattern.ItemIndex]);
            end;
// <025> ADD end

// ---------------------------
//          日付
// ---------------------------
            //ｾｸｼｮﾝを作成する
            lvSection       := 'DateInf_' + lvStrPtn;       // 通常Section
            lvDefSection    := 'DateInf';                   // ﾃﾞﾌｫﾙﾄ取得用Section

            //###### ﾃﾞﾌｫﾙﾄ情報取得 #####
            lvDefType          :=  ReadInteger(lvDefSection, 'Type', -1);
            // ﾀｲﾄﾙ名称
            lvDefCaption       :=  ReadString (lvDefSection, 'Caption',    '');
            // 日付ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)      ※ FXでは1しか対応しません
            lvDefDataFormat    :=  ReadInteger(lvDefSection, 'DataFormat', -1);


            //##### 情報取得 #####
            // 使用ﾀｲﾌﾟ(1:開始日付～終了日付、2:日付)　※ FXでは1しか対応しません
            lvType          :=  ReadInteger(lvSection, 'Type', lvDefType);
            // ﾀｲﾄﾙ名称
            lvCaption       :=  ReadString (lvSection, 'Caption',lvDefCaption);
            // 日付ﾌｫｰﾏｯﾄ(1:YYMMDD、2:YYMM、3:YY)      ※ FXでは1しか対応しません
            lvDataFormat    :=  ReadInteger(lvSection, 'DataFormat', lvDefDataFormat);


            uvDataFormat    :=  lvDataFormat;
            lvIndInput      :=  TRUE;

//<TAX> DEL            if ( not ( lvType = -1 ) or not ( lvDataFormat = -1 )) then
//<TAX> DEL            begin
//<TAX> ADD St
            for i := 1 to DateCount do
            begin
                // 実在詳細・合計詳細以外は非表示
                if not (containsSyosaiIndex(fPattern.ItemIndex)) then
                begin
                    //日付パネル非表示
                    lvStr   :=  'DatePnl1';
                    TPanel(JNTSelXFindCtrl(Self, lvStr)).Visible := False;
                    break;
                end;
//<TAX> ADD Ed
                //=== ｷｬﾌﾟｼｮﾝの設定 ===//
//<TAX> DEL                lvStr   :=  'fDateCap1';
                lvStr   :=  Format('fDateCap%s', [IntToStr(i)]);  //<TAX> ADD
//<TAX> DEL                TLabel(JNTSelXFindCtrl(Self, lvStr)).Caption := lvCaption;

                //=== 必須入寮区分の設定 ===//
                uvIndInput  :=  lvIndInput;

                //=== 開始日付の制御 ===//
                // 各ｺﾝﾎﾟｰﾈﾝﾄを取得する
//<TAX> DEL                lvStr       :=  'fSDATE1';
                lvStr       :=  Format('fSDATE%s', [IntToStr(i)]);  //<TAX> ADD
                lvTDtEdt    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
                lvStr       :=  'SpnBtn' + lvStr;
                lvTSpnBtn   :=  TSpinButton(JNTSelXFindCtrl(Self, lvStr));

                lvTDtEdt.DateInputType  :=  diYMD;	        // ﾌｫｰﾏｯﾄ
                lvTDtEdt.SepChar        :=  '/';			// ｾﾊﾟﾚｰﾀ
                lvTDtEdt.ArrowDisp      :=  adFocused;	    // ↓を表示
                lvTDtEdt.Calendar       :=  TRUE;			// ｶﾚﾝﾀﾞｰを表示
                lvTSpnBtn.Visible       :=  FALSE;		    // ｽﾋﾟﾝﾎﾞﾀﾝで表示不可

				// 050901 hirota >>
                if pvrStDate <> 19000101 then
	                lvTDtEdt.AsDateTime     :=  JNTSelXIntToDate(pvrStDate, #0);
				// 050901 hirota <<

                //=== 終了日付の制御 ===//
                // 各ｺﾝﾎﾟｰﾈﾝﾄを取得する
//<TAX> DEL                lvStr       :=  'fEDATE1';
                lvStr       :=  Format('fEDATE%s', [IntToStr(i)]);  //<TAX> ADD
//<TAX> MOD St
                lvTDtEdt    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
                lvStr       :=  'SpnBtn' + lvStr;
                lvTSpnBtn   :=  TSpinButton(JNTSelXFindCtrl(Self, lvStr));
                lvTDtEdt.DateInputType  :=  diYMD;	        // ﾌｫｰﾏｯﾄ
                lvTDtEdt.SepChar        :=  '/';			// ｾﾊﾟﾚｰﾀ
                lvTDtEdt.ArrowDisp      :=  adFocused;	    // ↓を表示
                lvTDtEdt.Calendar       :=  TRUE;			// ｶﾚﾝﾀﾞｰを表示
                lvTSpnBtn.Visible       :=  FALSE;		    // ｽﾋﾟﾝﾎﾞﾀﾝで表示不可
{
                lvTDtEdt    :=  TMDateEdit(JNTSelXFindCtrl(Self, lvStr));
                lvStr       :=  'SpnBtn' + lvStr;
                lvTSpnBtn   :=  TSpinButton(JNTSelXFindCtrl(Self, lvStr));

                // 使用ﾀｲﾌﾟに対応する
                if ( lvType = 1 ) then
                begin
                    //「xxxx/xx/xx ～ xxxx/xx/xx」の範囲指定の時
                    lvTDtEdt.Visible := TRUE;

                    lvTDtEdt.DateInputType  :=  diYMD;	        // ﾌｫｰﾏｯﾄ
                    lvTDtEdt.SepChar        :=  '/';			// ｾﾊﾟﾚｰﾀ
                    lvTDtEdt.ArrowDisp      :=  adFocused;      // ↓を表示
                    lvTDtEdt.Calendar       :=  TRUE;			// ｶﾚﾝﾀﾞｰを表示
                    lvTSpnBtn.Visible       :=  FALSE;		    // ｽﾋﾟﾝﾎﾞﾀﾝで表示不可

					// 050901 hirota >>
    	            if pvrEdDate <> 20991231 then
        	            lvTDtEdt.AsDateTime     :=  JNTSelXIntToDate(pvrEdDate, #0);
                                                                            // 保存ﾃﾞｰﾀを表示
					// 050901 hirota <<
                                                                            // 保存ﾃﾞｰﾀを表示
                end
                else
                begin
                    //「xxxx/xx/xx」の範囲指定の時

                    // 終了日付を非表示
                    lvTDtEdt.Visible    :=  FALSE;
                    lvTSpnBtn.Visible   :=  FALSE;

                    //「～」非表示
                    lvStr   :=  'KARA1';
                    TLabel(JNTSelXFindCtrl(Self, lvStr)).Visible := FALSE;
                end;
}

//<TAX> MOD Ed
                //日付パネル表示
                lvStr   :=  'DatePnl1';
                TPanel(JNTSelXFindCtrl(Self, lvStr)).Visible := TRUE;

            end;

// ---------------------------
//          各種ｺｰﾄﾞ
// ---------------------------

            // --<005>--St------------------------------------------------------
            // ****** TableName ******
            lvCnt       :=  0;
            while TRUE do
            begin
            	// ｾｸｼｮﾝを作成する
	            lvSection       :=  'CodeInf_'  + IntToStr(lvCnt) + '_' + lvStrPtn ;
                lvDefSection    :=  'CodeInf_'  + IntToStr(lvCnt);

                //##### ﾃﾞﾌｫﾙﾄ情報取得 #####
                lvDefTableName	    :=  ReadString (lvDefSection, 'TableName', '');   // ﾃｰﾌﾞﾙ名(名称取得用)
                //##### 情報取得 #####
                lvTableName	    :=  ReadString (lvSection,  'TableName', lvDefTableName);	// ﾃｰﾌﾞﾙ名(名称取得用)

                // 終了の判断
                if ( lvTableName = '' ) then Break;


                // TABLENAME Size
                if dxMdMainTABLENAME.Size < Length(lvTableName) then
                    dxMdMainTABLENAME.Size := Length(lvTableName);

                // 次ﾚｺｰﾄﾞ
                Inc(lvCnt);
            end;

            // ****** WhereStr ******
            lvCnt       :=  0;
            while TRUE do
            begin
            	// ｾｸｼｮﾝを作成する
	            lvSection       :=  'CodeInf_'  + IntToStr(lvCnt) + '_' + lvStrPtn ;
                lvDefSection    :=  'CodeInf_'  + IntToStr(lvCnt);

                //##### ﾃﾞﾌｫﾙﾄ情報取得 #####
                lvDefWhereStr      :=  ReadString (lvDefSection,  'WhereStr', 'END' );      // Where句(検索ｴｸｽﾌﾟﾛｰﾗ用) <002>

                //##### 情報取得 #####
                lvWhereStr      :=  ReadString (lvSection,  'WhereStr',  lvDefWhereStr );   // Where句(検索ｴｸｽﾌﾟﾛｰﾗ用) <002>

                // 終了の判断
                if ( lvWhereStr = 'END' ) then Break;

                // WhereStr  Size
                if dxMdMainWhereStr.Size  < Length(lvWhereStr) then
                    dxMdMainWhereStr.Size  := Length(lvWhereStr);

                // 次ﾚｺｰﾄﾞ
                Inc(lvCnt);
            end;

            // --<005>--Ed------------------------------------------------------

            dxMdRange.Open;         // 範囲対象ﾃｰﾌﾞﾙを開く
            dxMdMain.Open;

            lvCnt       :=  0;
            while TRUE do
            begin
            	// ｾｸｼｮﾝを作成する
	            lvSection       :=  'CodeInf_'  + IntToStr(lvCnt) + '_' + lvStrPtn ;
                lvDefSection    :=  'CodeInf_'  + IntToStr(lvCnt);

                //##### ﾃﾞﾌｫﾙﾄ情報取得 #####
                lvDefCaption       :=  ReadString (lvDefSection,  'Caption',   '');   // ﾀｲﾄﾙ
                lvDefTableName	    :=  ReadString (lvDefSection, 'TableName', '');   // ﾃｰﾌﾞﾙ名(名称取得用)
                lvDefShortName     :=  ReadString (lvDefSection,  'ShortName', '');   // 簡略名称のﾌｨｰﾙﾄﾞ名(名称取得用)
                lvDefMasterKbn     :=  ReadInteger(lvDefSection,  'MasterKbn', -1);   // ﾏｽﾀ区分(桁数認識、検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvDefModulKbn      :=  ReadInteger(lvDefSection,  'ModulKbn',  0 );   // ﾓｼﾞｭｰﾙｺｰﾄﾞ(検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvDefPatternNo     :=  ReadInteger(lvDefSection,  'PatternNo', 0 );   // ﾊﾟﾀｰﾝNO(検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvDefWhereStr      :=  ReadString (lvDefSection,  'WhereStr', '' );   // Where句(検索ｴｸｽﾌﾟﾛｰﾗ用) <002>


                //##### 情報取得 #####
                lvCaption       :=  ReadString (lvSection,  'Caption',   lvDefCaption);	    // ﾀｲﾄﾙ
                lvTableName	    :=  ReadString (lvSection,  'TableName', lvDefTableName);	// ﾃｰﾌﾞﾙ名(名称取得用)
                lvShortName     :=  ReadString (lvSection,  'ShortName', lvDefShortName);   // 簡略名称のﾌｨｰﾙﾄﾞ名(名称取得用)
                lvMasterKbn     :=  ReadInteger(lvSection,  'MasterKbn', lvDefMasterKbn);   // ﾏｽﾀ区分(桁数認識、検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvModulKbn      :=  ReadInteger(lvSection,  'ModulKbn',  lvDefModulKbn );   // ﾓｼﾞｭｰﾙｺｰﾄﾞ(検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvPatternNo     :=  ReadInteger(lvSection,  'PatternNo', lvDefPatternNo );  // ﾊﾟﾀｰﾝNO(検索ｴｸｽﾌﾟﾛｰﾗ用)
                lvWhereStr      :=  ReadString (lvSection,  'WhereStr',  lvDefWhereStr );   // Where句(検索ｴｸｽﾌﾟﾛｰﾗ用) <002>
                lvTranChar      :=  ReadString (lvSection,  'TranChar',  '');               // 取引区分(検索ｴｸｽﾌﾟﾛｰﾗ用)<016>

                // ｺｰﾄﾞ属性・桁数
                // 051025 hirota	fnGetMastrInfo(lvMasterKbn,lvCodeAttr,lvCodeDigit);

                // 終了
                if ( lvMasterKbn = -1 ) then
                    Break
                else
                begin                                           //<009>
                    if m_Hani.pvMasterKbn <> 0 then             //<009>
                        lvMasterKbn := m_Hani.pvMasterKbn;      //<009>
                end;                                            //<009>
// <013>↓
                if m_Hani.pvPrgID = 'JNTCRP019001' then         // 分類登録だけはﾊﾟﾀｰﾝによってﾏｽﾀ区分が異なる
				begin
					if lvKakucho then
					begin
						case lvMasterKbn of
							401:	iKbn := ucShKbn[fPattern.ItemIndex];
							411:	iKbn := ucTkKbn[fPattern.ItemIndex];
							421:	iKbn := ucSiKbn[fPattern.ItemIndex];
						end;
						lvMasterKbn := iKbn;
					end
					else
	                    lvMasterKbn  :=  lvMasterKbn + fPattern.ItemIndex;    // ﾏｽﾀ区分

					m_Hani.pvMasterKbn := lvMasterKbn;
				end;
// <013>↑

                // ｺｰﾄﾞ属性・桁数
                fnGetMastrInfo(lvMasterKbn,lvCodeAttr,lvCodeDigit);		// 051025 hirota

                // ==== 範囲の各項目を設定する ====
                if ( dxMdRange.RecordCount = 0 ) then
                begin
                    for i := 0 to 1 do
                    begin
                        dxMdRange.Append;
                        dxMdRange.FieldByName('RgCode').AsInteger   :=  i;
                        dxMdRange.FieldByName('RgName').AsString    :=  fnGetRangeTable(i);
                        dxMdRange.Post;
                    end;
                end;

                // ﾃﾞﾌｫﾙﾄ情報を表示する
                lvStCode    :=  '';
                lvStName    :=  ''; // '最初から';
                lvEdCode    :=  '';
                lvEdName    :=  ''; // '最後まで';


                // 範囲指定項目を追加
                with dxMdMain do
                begin
                	Append;
                    FieldByName('Caption')      .AsString   :=  lvCaption;      // 名称
                    FieldByName('dmyRgCode')    .AsInteger  :=  lvRgCode;       // 出力範囲


                    if ( lvRgCode = 0 ) then
                    begin
                        FieldByName('STCODE')       .AsString   :=  '';       // 開始ｺｰﾄﾞ
                        FieldByName('EDCODE')       .AsString   :=  '';       // 終了ｺｰﾄﾞ
                    end
                    else
                    begin
                        if ( lvCodeAttr in [0,1] ) then
                        begin
                            // 開始ｺｰﾄﾞ
                            if ( lvStCode = '0000000000000000' ) or ( lvStCode = '' ) then
                                FieldByName('STCODE').AsString   :=  ''
                            else
                            begin
                                lvStCode    :=  IntToStr(StrToIntDef(lvStCode,0));
                                FieldByName('STCODE').AsString   :=
                                    FormatFloat(StringOfChar('0', lvCodeDigit), StrToFloat(lvStCode));
                            end;

                            // 終了ｺｰﾄﾞ
                            if ( lvEdCode = '0000000000000000' ) or ( lvEdCode = '' ) then
                                FieldByName('EDCODE').AsString   :=  ''
                            else
                            begin
                                lvEdCode    :=  IntToStr(StrToIntDef(lvEdCode,0));
                                FieldByName('EDCODE').AsString   :=
                                    FormatFloat(StringOfChar('0', lvCodeDigit), StrToFloat(lvEdCode));
                            end;
                        end
                        else if ( lvCodeAttr = 2 ) then
                        begin
                            FieldByName('STCODE')       .AsString   :=  lvStCode;       // 開始ｺｰﾄﾞ
                            FieldByName('EDCODE')       .AsString   :=  lvEdCode;       // 終了ｺｰﾄﾞ
                        end;
                    end;

                    FieldByName('TABLENAME')    .AsString   :=  lvTableName;    // ﾃｰﾌﾞﾙ名
                    FieldByName('ShortName')    .AsString   :=  lvShortName;    // 簡略名称
                    FieldByName('CodeAttr')     .AsInteger  :=  lvCodeAttr;     // ｺｰﾄﾞ属性
                    FieldByName('CodeDigit')    .AsInteger  :=  lvCodeDigit;    // ｺｰﾄﾞ桁数
                    FieldByName('KARA')         .AsString   :=  '～';
                    FieldByName('MasterKbn')    .AsInteger  :=  lvMasterKbn;    // ﾏｽﾀ区分
                    FieldByName('ModulKbn')     .AsInteger  :=  lvModulKbn;     // ﾓｼﾞｭｰﾙ区分
                    FieldByName('PatternNo')    .AsInteger  :=  lvPatternNo;    // ﾊﾟﾀｰﾝNO
                    FieldByName('WhereStr')     .AsString   :=  lvWhereStr;     // その他Where句<002>
                    FieldByName('TranChar')     .AsString   :=  lvTranChar;     // 取引区分<016>
                    Post;
                end;

                // 次ﾚｺｰﾄﾞ
                Inc(lvCnt);
            end;
// <014>↓復帰
//(*
            // 該当無しの場合使用不可にする
            if ( lvCnt = 0 ) then
            begin
                dxGridHani.Enabled := FALSE;
                dxGridHani.TabStop := FALSE;
            end
//*)
            else                            // <014>追加
            begin
                dxGridHani.Enabled := TRUE;
                dxGridHani.TabStop := TRUE;
                                            // 初期は範囲選択へ
                dxGridHani.FocusedColumn := 1;
            end;


// ---------------------------
//          出力指示
// ---------------------------

            // 小計毎に改頁
            lvDefShokei         :=  ReadInteger('DisplayInf', 'Shokei', 0);
            cbShokei.Enabled    :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'Shokei', lvDefShokei) = 1);
            cbShokei.Checked    :=  pvrShokei;

            // ﾃﾝﾌﾟﾚｰﾄを出力する
            lvDefTemplate       :=  ReadInteger('DisplayInf', 'Template', 0);
            cbTemplate.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'Template', lvDefTemplate) = 1);
            cbTemplate.Checked  :=  pvrTemplate;


            // 名寄せ親を除く
            lvDefPNayose         :=  ReadInteger('DisplayInf', 'PNayose', 0);
            cbNayoseOya.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'PNayose', lvDefPNayose) = 1);
            cbNayoseOya.Checked  :=  pvrNayoseOya;

            // 名寄せ子を除く
            lvDefCNayose         :=  ReadInteger('DisplayInf', 'CNayose', 0);
            cbNayoseKo.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'CNayose', lvDefCNayose) = 1);
            cbNayoseKo.Checked  :=  pvrNayoseKo;

            // 得意先採用
            lvDefTSaiyou        :=  ReadInteger('DisplayInf', 'TSaiyou', 0);
            cbUseTokui.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'TSaiyou', lvDefTSaiyou) = 1);
            cbUseTokui.Checked  :=  UseTokui;

            // 仕入先採用
            lvDefSSaiyou        :=  ReadInteger('DisplayInf', 'SSaiyou', 0);
            cbUseSiire.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'SSaiyou', lvDefSSaiyou) = 1);
            cbUseSiire.Checked  :=  UseSiire;

            // 採用無し
            lvDefNSaiyou        :=  ReadInteger('DisplayInf', 'NSaiyou', 0);
            cbUseNashi.Enabled  :=  (ReadInteger('DisplayInf_' + lvStrPtn, 'NSaiyou', lvDefNSaiyou) = 1);
            cbUseNashi.Checked  :=  UseNashi;


			//〓〓〓　出力順を設定する　〓〓〓//
            lvCnt := 0;
            while TRUE do
            begin
            	// 項目名の作成
	            lvField :=  'Text'+ IntToStr(lvCnt);

    	        // 情報取得
                lvStr   :=  ReadString('OrderInf', lvField, '');
                lvStr   :=  ReadString('OrderInf_' + lvStrPtn, lvField, lvStr);

                // 終了の判断
                if ( lvStr = '' ) then Break;

                // 出力順序に追加する
                fORDER1.Items.Add(lvStr);

				Inc(lvCnt);
            end;

            // 1件しかなかったら選択不可にする
            if ( lvCnt = 1 ) then
            begin
                fORDER1.Enabled := FALSE;
                fORDER1.TabStop := FALSE;
            end
            else
            begin
                fORDER1.Enabled := True;    //<010>
                fORDER1.TabStop := True;    //<010>
            end;

            with fORDER1 do
            begin
                if ( Items.Count <= 0 ) then
                begin
                	// 使用しない
                    ItemIndex   :=  -1;
                    Enabled     :=  FALSE;
                end
                else
                begin
                	// ﾃﾞﾌｫﾙﾄ値、及び保存値を設定する
                    if ( pvrOrder >= 0 ) then
                            ItemIndex   :=  pvrOrder	// 保存ﾃﾞｰﾀを表示する
                    else    ItemIndex   :=  0;			// ﾃﾞﾌｫﾙﾄ表示
                end;
            end;

            fORDER1.DropDownCount := fORDER1.Items.Count;
        end;

    finally
		lvIniFile.Free;
    end;

end;
//*****************************************************************************
//*****************************************************************************
procedure TFrmJNTPDialog.fPatternChange(Sender: TObject);
begin

    fnMakeDlgFields;

end;
//*****************************************************************************
//  <001>
//*****************************************************************************
function TFrmJNTPDialog.fnGetRangeTable(i:Integer):String;
begin

    case i of
        0:Result := '全件';
        1:Result := '範囲';
    end;

end;
//*****************************************************************************
//  <002>
//      PARAM   :   cMem
//                  bExp    : True:  検索Expに追加するWhere条件作成
//                            False: 入力ﾁｪｯｸのSQLに追加するWhere条件作成
//      RETURN  :   String
//      MEMO    : <016>引数追加(bExp)
//*****************************************************************************
//function TFrmJNTPDialog.fnMakeWhereStr(cMem : TdxMemData) :String;                //<002><016>
function TFrmJNTPDialog.fnMakeWhereStr(cMem : TdxMemData; bExp: Boolean) :String;   //<016>引数追加
var

    StrMK       : String;
    lvWhere     : String;
//    lvRDelKbn   : String;

begin

    lvWhere := '';
    StrMK   := IntToStr(cMem.FieldByName('Masterkbn').AsInteger);

    case cMem.FieldByName('Masterkbn').AsInteger of
        // 科目
        1:
        begin
            lvWhere := '  (MasterKbn = ' + StrMK + ') '
                        + ' AND (SubCode = 0) '
                        + ' AND (RDelKbn = 0) ';

            // 追加条件
            if (cMem.FieldByName('WhereStr').AsString <> '') then
                lvWhere := lvWhere + ' AND ' + cMem.FieldByName('WhereStr').AsString;

        end;
        // 銀行,汎用補助1～5,部門,職種～職位,セグメント1～10	// 社員系、セグ追加　051025 hirota
        21,31..35,41,86..89,101..110,201..210,301..310:			// 社員系、セグ追加　051025 hirota
        begin
// <011>Exp側が追加するため不要
//            lvWhere := ' (MasterKbn = ' + StrMK + ') '
//                        + ' AND (RDelKbn = 0) ';
// <016>↓
            if not bExp then                // 入力ﾁｪｯｸの場合
            begin
// <021>               lvWhere := ' (MasterKbn = ' + StrMK + ') '
// <021>                       + ' AND (RDelKbn = 0) ';
                lvWhere := ' (HojyoMA.MasterKbn = ' + StrMK + ') '
                        + ' AND (RDelKbn = 0) ';

                // 追加条件
                if (cMem.FieldByName('WhereStr').AsString <> '') then
                    lvWhere := lvWhere + ' AND ' + cMem.FieldByName('WhereStr').AsString;
            end
            else
            begin
// <016>↑
                // 追加条件
                if (cMem.FieldByName('WhereStr').AsString <> '') then
                    lvWhere := {lvWhere + ' AND ' +} cMem.FieldByName('WhereStr').AsString; // <011>
            end;                            // <016>
        end;
// <013>↓
//        401..590:							// <015>
        401..600:							// <015>
        begin
            StrMK := IntToStr(cMem.FieldByName('Masterkbn').AsInteger + m_Hani.pvrPattern);
            lvWhere := '(SetNm = ' + StrMK + ') ';
        end
// <013>↑
        else
        begin
// <001>Exp側が追加するため不要
//            lvWhere := ' (RDelKbn = 0) ';
// <016>↓
            if not bExp then                // 入力ﾁｪｯｸの場合
            begin
                lvWhere := ' (RDelKbn = 0) ';
                                            // 取引区分のみ
                if cMem.FieldByName('Masterkbn').AsInteger = 9030 then
                begin                       // Expのﾊﾟﾗﾒｰﾀを追加
                    lvWhere := lvWhere + 'AND DKbn = ''' + cMem.FieldByName('TranChar').AsString + '''';
                end;

                // 追加条件
                if (cMem.FieldByName('WhereStr').AsString <> '') then
                    lvWhere := lvWhere + ' AND ' + cMem.FieldByName('WhereStr').AsString;
            end
            else
            begin
// <016>↑
              // 追加条件
                if (cMem.FieldByName('WhereStr').AsString <> '') then
                    lvWhere := {lvWhere + ' AND ' +} cMem.FieldByName('WhereStr').AsString; // <011>

            end;                            // <016>

        end;
    end;

    Result := lvWhere;

end;
//*****************************************************************************
//<007>
//*****************************************************************************
procedure TFrmJNTPDialog.dxGridHaniKeyPress(Sender: TObject; var Key: Char);
begin

	if	(dxMdMainCodeAttr.AsInteger <= 1) then
	begin
		if	(((Key < '0') or (Key > '9')) and
			  (Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
		begin
			Beep ();
			Abort;
		end;
	end;

end;

//------------------------------------------------------------------------------
//      マスター基本情報テーブルよりKojKbn17の取得    <024> ADD
//------------------------------------------------------------------------------
function TFrmJNTPDialog.fnGetKeiRenKbn(nMasterKBN: Integer; var nKojKbn: Integer): Boolean;
begin

    with DmqMasterInfo do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT KojKbn17 FROM MasterInfo '
            +   'WHERE  (MasterKbn = :pMasterKbn)           ');
        ParamByName('pMasterKbn').AsInteger :=  nMasterKbn;
        Open();

        if not EOF then
        begin
            nKojKbn := GetFld('KojKbn17')  .AsInteger;
            Result  :=  true;
        end
        else
        begin
            nKojKbn    :=  0;
            Result  :=  false;
        end;

        Close();
    end;

end;
//<2255>↓
//-----------------------------------------------------------------------------
//  IsCustomSel
//      販売の個別処理情報がセットされているかをチェック
//      PARA    :   KBN		: カスタマイズ区分('HE01'･･･)
//
//      RETURN  :	True:個別情報あり false:個別情報なし
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.IsCustomSel(KBN:String):Boolean;
begin
	with Qry do
	begin
		try
			Close;
			SQL.Clear;
			SQL.Add('select 1 where exists (select * from SELCSTM_TBL where kbn =  :pKbn )');

			ParamByName('pKbn').AsString := KBN;

			Open;

			Result := not EOF;
		finally
			Close;
		end;
	end;
end;

//-----------------------------------------------------------------------------
//  fnSelCostmCheck
//      文字列に販売の個別処理情報の文字列が含まれているかのチェック
//      PARAM   : S : ﾁｪｯｸする文字列
//      RETURN  : True  : 文字が含まれていない
//				  False : 含まれている
//-----------------------------------------------------------------------------
function TFrmJNTPDialog.fnSelCostmCheck(S:String;SELCSTM:String):Boolean;
begin
	Result := True;
	if (SELCSTM <> '') then
    begin
		Result := not IsCustomSel(SELCSTM);	//selcstmに何も入っていない時はチェックでfalseなのでnotをつけtrueに
	end
	else
	begin
		result := False;					//selcstmが空ならfalse
	end;
end;

//<2255>↑

end.
