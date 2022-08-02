//*****************************************************************************************************
//*
//*		Systeme			:   ＦＸ共通マスタ
//*		Program			:   汎用補助登録
//*		ProgramID		:	JNTCRP016000
//*		Name			:	茂木 勇次(LEAD)
//*		Create			:   2005.02.28
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*
//*     History
//*     <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//*     <   >   茂木勇次(LEAD)  2005/05/10(TUE) FX-STYLE対応("FX_"削除)
//*     <   >   茂木勇次(LEAD)  2005/05/10(TUE) JNTﾗｲﾌﾞﾗﾘ対応
//*     <001>   茂木勇次(LEAD)  2005/07/01(FRI) 詳細画面上でPopupMenuを表示し付箋及び付箋備考の設定機能の追加。
//*     <002>   茂木勇次(LEAD)  2005/07/01(FRI) ﾌﾘｰ項目ﾌｧﾝｸｼｮﾝ呼出機能の追加。
//*     <003>   茂木勇次(LEAD)  2005/07/02(SAT) 分類,ｾｸﾞﾒﾝﾄ機能の追加。
//*     <004>   茂木勇次(LEAD)  2005/07/12(TUE) 採用ﾀﾞｲｱﾛｸﾞの表示を無効に変更。
//*     <005>   茂木勇次(LEAD)  2005/07/12(TUE) ﾌﾘｰ項目最新版対応。
//*     <006>   茂木勇次(LEAD)  2005/07/14(THU) 付箋備考の第１引数にAOwnerを追加。
//*     <007>   井上佳美(LEAD)  2005/07/14(THU) 検索ｴｸｽﾌﾟﾛｰﾗを追加。
//*     <008>   茂木勇次(LEAD)  2005/07/15(FRI) 決算確定機能の追加。
//*     <009>   茂木勇次(LEAD)  2005/07/15(FRI) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//*     <010>   茂木勇次(LEAD)  2005/07/22(FRI) 検索ﾀﾞｲｱﾛｸﾞを廃止⇒検索ｴｸｽﾌﾟﾛｰﾗを呼出す
//*     <011>   井上佳美(LEAD)  2005/07/27(WED) 権限機能を追加（印刷）
//*     <012>   飯塚健介(LEAD)  2005/08/04(WED) 権限機能を追加（印刷以外）
//*     <013>   茂木勇次(LEAD)  2005/08/09(TUE) 実在/合計の切替時にｾｸﾞﾒﾝﾄ/分類の表示/非表示処理が怪しいので修正。
//*     <PRN>   茂木勇次(LEAD)  2005/08/23(TUE) 印刷機能の実装。
//*     <014>   飯塚健介(LEAD)  2005/08/31(WED) 並べ替えを外部ｺｰﾄﾞ順に修正
//*     <015>　 飯塚健介(LEAD)  2005/08/31(WED) 同親時に加算体系の貼り付けが出来ないように修正
//*     <016>   飯塚健介(LEAD)  2005/08/31(WED) 貼り付け時ｴﾗｰ回避
//*     <017>   飯塚健介(LEAD)  2005/09/01(THU) ﾌｧﾝｸｼｮﾝ機能修正(F8追加 and F1表示方法)
//*     <018>   飯塚健介(LEAD)  2005/09/02(FRI) 部門ｾｸﾞﾒﾝﾄのﾊﾟﾈﾙが消えてしまう現象を回避
//*     <KEY>   飯塚健介(LEAD)  2005/09/02(FRI) 強制ｷｰｲﾍﾞﾝﾄ
//*     <PEF>   飯塚健介(LEAD)  2005/09/13(TUE) ﾌﾟﾘﾝﾀｰ使用不可
//*     <019>   飯塚健介(LEAD)  2005/09/13(TUE) 属性桁数変更時不具合修正
//*     <020>   飯塚健介(LEAD)  2005/09/14(WED) 切出/埋込を行うとフォーカスが補助分類に移動する。
//*     <021>   飯塚健介(LEAD)  2005/09/14(WED) 一覧→詳細切り替え時にｾｸﾞﾒﾝﾄや分類ﾊﾟﾈﾙが表示されない現象を修正
//*     <022>   茂木勇次(LEAD)  2005/09/29(THU) ｸﾞﾘｯﾄﾞの付箋Bitmapを変更。TImageを追加。
//*     <023>   広田茂雄(PRIME) 2005/10/13(TUE) ESCキーで終了できるように修正
//*     <024>   加藤(PRIME)     2005/11/30(WED) 履歴用ｽﾄｱﾄﾞ呼び出し
//*     <025>   広田茂雄(PRIME) 2005/12/14(WED) 帳票不具合対応
//*     <026>   青木(PRIME)     2005/12/16(Fri) 諸口ﾀﾞｲｱﾛｸﾞｷｬﾝｾﾙ時の対応
//*     <027>   青木(PRIME)     2005/12/16(Fri) 初期表示時のﾎﾞﾀﾝ制御追加（印刷・検索）
//*     <028>   青木(PRIME)     2005/12/19(Mon) ﾎﾞﾀﾝ制御追加（印刷・検索）
//*     <029>   青木(PRIME)     2005/12/19(Mon) 登録・更新権限ない場合に付箋ボタン無効に修正
//*     <030>   青木(PRIME)     2005/12/19(Mon) 実在詳細画面表示時、ｾｸﾞﾒﾝﾄ・分類情報を表示するように修正
//*     <031>   青木(PRIME)     2005/12/19(Mon) 更新権限有無の判別条件変更
//*     <032>   青木(PRIME)     2005/12/20(Tue) 詳細の実在/合計ﾀﾌﾞ切り替え時の表示対応
//*                                             ※実在・合計どちらかの汎用ｺｰﾄﾞが未入力の時、ﾀﾌﾞを切り替えると
//*                                               勝手に一覧画面に戻ってしまうため
//*     <033>   青木(PRIME)     2005/12/20(Tue) ｺｰﾄﾞ入力・検索ｴｸｽﾌﾟﾛｰﾗEnter時のKey操作対応
//*     <034>   青木(PRIME)     2005/12/21(Wed) ﾂﾘｰのSiftTab操作追加
//*     <035>   青木(PRIME)     2005/12/21(Wed) ﾋﾞｯﾄﾎﾞﾀﾝにﾌｫｰｶｽがある場合のﾎﾞﾀﾝ制御追加
//*     <   >   青木(PRIME)     2005/12/29(Thu) 実在ｸﾞﾘｯﾄﾞのﾍｯﾀﾞｰのﾌｫﾝﾄを10に変更
//*     <   >   青木(PRIME)     2006/01/06(Fri) ｸﾞﾘｯﾄﾞ内のTab移動できるようにOptionのegoTabsをTrueに変更
//*     <CHK>   加藤(PRIME)     2006/02/07(MON) 削除ﾁｪｯｸ対応
//*     <036>   加藤(PRIME)     2006/03/09(THU) HojyoTreeのEntNo再採番不具合修正
//*     <037>   青木(PRIME)     2006/03/09(THU) 印刷範囲指定の不具合修正
//*     <038>   青木(PRIME)     2006/03/17(Fri) ｺｰﾄﾞ未入力時のﾌﾘｰﾀﾞｲｱﾛｸﾞ非表示条件修正
//*     <039>   茂木勇次(LEAD)  2006/06/02(FRI) 1.04VerUP評価_不具合一覧No.046対応。
//*     <040>   高橋功二(LEAD)  2007/01/23(Tue) ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一) Ver1.07正式版(2007/2)にてﾘﾘｰｽ
//*     <041>   茂木勇次(LEAD)  2007/03/12(MON) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//*     <042>   茂木勇次(LEAD)  2007/03/27(WED) 同一会社を同時起動した場合に、A端末から削除した後、B端末から
//*                                             同一補助ｺｰﾄﾞを削除すると、DBMSｴﾗｰが発生する不具合対応。
//*     <043>   茂木勇次(LEAD)  2007/03/27(WED) 仕訳等で既に使用済みの場合、ﾁｪｯｸｽﾄｱﾄﾞでｶﾞｰﾄﾞを掛けていますが
//*                                             ﾂﾘｰから削除を行った場合にﾁｪｯｸがなされていない為、削除できてしまう不具合対応。
//*     <044>   茂木勇次(LEAD)  2007/04/10(TUE) 汎用補助の採用が全て未採用の場合は画面を閉じる。
//*     <045>   茂木勇次(LEAD)  2007/04/11(WED) <033>の修正で詳細画面時に正式名称ｺﾋﾟｰ機能が無効になっている不具合対応。
//*     <046>   茂木勇次(LEAD)  2007/04/13(FRI) 詳細画面で「並び替え」ｷｬﾝｾﾙ時に、詳細内容を破棄しない。
//*     <047>   茂木勇次(LEAD)  2007/04/17(TUE) <030>の修正の補足。TMTreeViewにFocusがある時に、一覧/詳細ﾎﾞﾀﾝを押下すると
//*                                             ｾｸﾞﾒﾝﾄ・分類情報が初回時表示されない不具合対応。
//*     <048>   茂木勇次(LEAD)  2007/04/17(TUE) 詳細画面で付箋を設定した後、更新ﾎﾞﾀﾝを押下すると付箋が剥れてしまう不具合対応。
//*     <049>   茂木勇次(LEAD)  2007/04/17(TUE) 詳細画面で並び替えを行った場合に、外部ｺｰﾄﾞｺﾝﾄﾛｰﾙの入力値を初期化する。
//*     <050>   茂木勇次(LEAD)  2007/05/02(WED) 処理終了時に、ｸﾞﾙｰﾌﾟ会計を行っている場合は、一括配信DLGを呼出。
//*     <051>   茂木勇次(LEAD)  2007/05/06(SUN) ｸﾞﾙｰﾌﾟ会計採用時に、追加・更新・削除を行った後、SecHojyoDispInfoのﾒﾝﾃを行う。
//*     <052>   茂木勇次(LEAD)  2007/06/06(WED) 諸口登録時の場合に、SecHojyoDispInfoのﾒﾝﾃを行うように修正。
//*     <053>   茂木勇次(LEAD)  2007/06/06(WED) 全社でも一括配信DLGを呼出。
//* 	<054>   鈴木(PRIME)     2007/08/07(TUE) 過年度DBを選択し、終了した場合は、配信ﾀﾞｲｱﾛｸﾞを呼び出さないように修正
//*		<055>   鈴木(PRIME)     2007/08/09(THE) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//*     <056>   鈴木(PRIME)     2007/08/28(TUE) 追加権限なしおよび修正権限なしの場合、ﾎﾟｯﾌﾟｱｯﾌﾟで付箋削除、備考修正をできないように修正。
//*		<057>	関(PRIME)		2008/02/08(FRI)	ﾏｽﾀ更新履歴対応
//*     <DKAI>  難波(LAB)       2008/08/27(WED) 名称に改行が入らないようにする
//*     <058>   小川(RIT)       2010/05/21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//============================ ver4.04 修正内容 ================================
//*     <059>   小川(RIT)       2010/10/14(THU) 詳細画面でフォーカスがTreeView以外のとき、削除時に内部コードをセットしていない不具合修正
//                                              また、詳細画面で削除したあとの情報が残っているため、クリアする。
//*		<060>	張　亜新		2011/06/09(THU)	登録されていた全ての補助を削除した後、削除ボタン、詳細ボタンを制御(使用不可)。
//*		<061>	張　亜新		2011/06/09(THU) コンパイル時ヒント57件発生したので、その内30件が使われていない変数などをコメントアウトした。
//
//============================ ver4.08 修正内容 ================================
//*     <062>   小川(LEAD)      2012/01/20(FRI) 合計タブ内で実在マスタのコードを入力してEnterキーを押下しても、実在タブに切り替わらない不具合対応。
//*     <063>   小川(LEAD)      2012/01/24(TUE) 並び替えでHojyoTreeのプライマリーキーエラーになる不具合対応。
//*     <064>   小川(LEAD)      2012/01/24(TUE) フリー項目ダイアログにて入力した内容が再度呼び出したときにクリアされてしまう不具合対応。
//*     <065>   小川(LEAD)      2012/01/24(TUE) 詳細画面で並び替えを行った後、外部コードが入っている状態でEnterキーを押下しても詳細情報がセットされない不具合対応。
//*     <066>   小川(LEAD)      2012/01/25(WED) HojyoMAで更新した内部コードとHojyoTree.BasedNCodeの値が不一致になる場合がある対策。
//*     <Shift> 小川(LEAD)      2012/02/01(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//
//============================ ver5.04 修正内容 ================================
//*     <067>   小川(LEAD)      2012/10/18(THU) 新規登録時に別のマスタで登録した分類情報が登録されてしまう不具合対応
//
//============================ ver4.15/ 5.10 修正内容 ================================
//      <FREEINIT>   小川(LEAD)   2016.01.18(MON) 複数画面起動時にフリー項目ダイアログの起動制御が正しく行われていない不具合対応
//                                                     
//============================ ver4.16/ 5.11 修正内容 ================================
//*     <068>   小田            2016/09/15(THU) 並び替え時初期EntNoが重複してしまい、並び替えに失敗するエラーの修正
//*     <069>   小田            2016/09/29(THU) 並び替え時にトランザクション開始を宣言していなかった点を修正
//*     <070>   小田            2016/09/29(THU) 並び替え時に以前までのプログラムで作成されてしまったごみーデータの削除を行う処理の追加
//                                                     
//============================ ver4.17/ NX-Ⅰ5.12/ NX-Plus 1.01 修正内容 ================================
//*     <071>   M.Tamura(ALPHA) 2018/09/19(WED) EdgeTracker連携（メッセージ対応）：コードを削除した時にメッセージを出す。（連携時のみ）
//
//*		<#NGEN>	小室(Admax)		2018/11/13(TUE) 新元号対応
//*		<DEL10>	小柳(ﾈｵﾃｯｸｽ)	2020/10/15(TUE) 並べ替え処理内FetchAllの処理位置変更
//
//*****************************************************************************************************
unit JNTCRP016000u;

interface

uses
  Windows, Messages, SysUtils, Classes,  VCL.Graphics, VCL.Controls, VCL.Forms,    VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.ExtCtrls, ComCtrls, VCL.ImgList,  VCL.StdCtrls, FireDAC.Comp.Client, Db,       Menus,
  ToolWin, dxGrClms, dxTL,     dxDBGrid, dxCntner, dxmdaset, daDatMod, CommCtrl,
  ppDB,    ppBands,  ppCache,  ppDBPipe, ppComm,   ppPrnabl, ppClass,  ppCtrls,
  ppModule,ppProd,   ppReport, ppVar,    ppRelatv,

  MJSPageControl, MJSComboBox, MJSPanel, MJSGroupBox, MJSLabel, MJSEdits,
  MJSFunctionBar, MJSQuery,    MJSSPFunctionBar, MJSTab, MJSCheckBox, MJSBitBtn,
  MJSSpeedButton,

  MJSMsgStdu, MJSDispCtrl, MJSDateCtrl, MJSPreviewIFu, MjsPrnDlgu, MjsPrnSupportu,
  MJSCommonu, MJSDBModuleu, JNTMasWndIFu, CMNExpFuncU, JNTMasComu, JNTMasTreee2Dlgu,
  JNTCommonU, MjsStrCtrl, MJSCommon3u, JNTFuncU,
  JNTSelCorpSys, JNTExPGlobal, JNTPDlg,{<PRN>}
  MasDateCtrl,		// <#NGEN>

  JNTCRP016001u, JNTCRP016002u, JNTCRP016003u, MJSTreeView, MJSStatusBar, ActnList
  ,MJSKeyDataState  //<Shift> ADD
  {<058> ADD St},MLBplLoaderU, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer,
  ppParameter, System.Actions, FireDAC.Comp.DataSet, System.ImageList,{<058> ADD Ed}
  Variants, System.AnsiStrings;


// ---------------------------
//  補助分類ｺﾝﾎﾞ情報構造体
// ---------------------------
type
	SelectValidItem = record
        nMasterDivision :   Integer;		    // ﾏｽﾀ区分  (21:銀行, 22:取引先, 25:社員...)
		strItemCaption  :   String;			    // 補助名称 (実在)
		nCodeDigit      :   Integer;		    // ｺｰﾄﾞ桁数 (3～10桁)
		nCodeAttribute  :   Integer;		    // ｺｰﾄﾞ属性 (0:数字, 1:数字(前ｾﾞﾛあり), 2:ﾌﾘｰ)
		nAdoptDivision  :   Integer;		    // 採用区分 (0:なし, 1:あり)
end;

// ---------------------------
//  TMTreeView情報構造体
// ---------------------------
type
    TreeViewRec  = record
        nDivision   :   Byte;                   // 実在/合計区分
        strExCode   :   String;                 // 補助外部ｺｰﾄﾞ
        strExNCode  :   Extended;               // 補助内部ｺｰﾄﾞ
        strName     :   String;                 // 名称
end;

PTreeViewRec = ^TreeViewRec;

// ---------------------------
//  付箋ｺﾒﾝﾄ情報構造体
// ---------------------------
type
	TagInfo	= record
        fChecked    :   Boolean;
        strComment  :   String;                 // 付箋ｺﾒﾝﾄ
end;

// ---------------------------
//  補助ﾃﾞｰﾀ保管用構造体
// ---------------------------
type
    MasterData	= record
        nDivision	        : Integer;			// 実在/合計区分
		strExCodeParent     : String;			// 補助外部ｺｰﾄﾞ(親)
        strExNCodeParent    : Extended;         // 補助内部ｺｰﾄﾞ(親)
        strExNCode          : Extended;         // 補助内部ｺｰﾄﾞ
		strExCode	        : String;			// 補助外部ｺｰﾄﾞ
		strAssociation      : String;			// 連想
		strName		        : String;			// 正式名称
		strNameSimple       : String;			// 簡略名称
		nAssDivision01      : Integer;			// 得意先区分
		nAssDivision02      : Integer;			// 仕入先区分
		fDetails	        : Boolean;			// 詳細更新区分
		nAppDateStart       : Integer;			// 適用開始年月日
		nAppDateEnd         : Integer;			// 適用終了年月日
		nAssDivision03      : Integer;			// 名寄せ区分
		nClassCode          : Integer;			// 取引先分類
		nLimitPrice	        : Currency;			// 手形割引(与信)限度額
		nTaxCodeSales       : Integer;			// 売上消費税ｺｰﾄﾞ
		nTaxRateSales       : Integer;			// 売上消費税率
		nTaxCodeStock       : Integer;			// 仕入消費税ｺｰﾄﾞ
		nTaxRateStock       : Integer;			// 仕入消費税率
		nFundCodeDeb01      : Integer;			// (得意先)借方資金繰ｺｰﾄﾞ
		nFundCodeCre01      : Integer;			// (得意先)貸方資金繰ｺｰﾄﾞ
		nFundCodeDeb02      : Integer;			// (仕入先)借方資金繰ｺｰﾄﾞ
		nFundCodeCre02      : Integer;			// (仕入先)貸方資金繰ｺｰﾄﾞ
end;

// ---------------------------
//
// ---------------------------
type
    SaveTreeRec	= Record
        strSumNCode		:   Extended;		    // 加算先内部ｺｰﾄﾞ
        strBasedNCode	:   Extended;		    // 加算元内部ｺｰﾄﾞ
end;


// ---------------------------
//
// ---------------------------
type
    PrintDstData = record
        strExCode       :   String;			    // 補助外部ｺｰﾄﾞ
        strExNCode      :   Extended;           // 補助内部ｺｰﾄﾞ
		strAssociation  :   String;			    // 連想
		strName         :   String;			    // 正式名称
		strNameSimple   :   String;			    // 簡略名称
end;

// ---------------------------
//  検索情報構造体
// ---------------------------
type
	SearchInfoRec = Record
        sHojCD  :   String;		                // 検索部門
    	iItem	:   Integer;		            // 検索するItemの位置
    	iStItem	:   Integer;		            // 最初に一致したItemNo
    	bFstFlg	:   Boolean;		            // 初回判定ﾌﾗｸﾞ
end;

// ---------------------------
//  ﾌｧﾝｸｼｮﾝ制御情報構造体<002>
// ---------------------------
type
    urFncInfo = record
        Caption :   array[0..7] of String;      // ﾌｧﾝｸｼｮﾝ名
        Action  :   array[0..7] of TAction;     // ﾌｧﾝｸｼｮﾝｱｸｼｮﾝ
end;

// --------------------------------
//  ｾｸﾞﾒﾝﾄ,分類制御情報構造体<003>
// --------------------------------
type
	AdoptInfo = record
        nMasterDivision :   Integer;	    	// ﾏｽﾀ区分
		nAdoption	    :   Integer;		    // 採用区分
		nCodeDigit	    :   Integer;		    // ｺｰﾄﾞ桁数
		nCodeAttribute  :   Integer;		    // ｺｰﾄﾞ属性
		strDescription  :   String;			    // 名称
end;

const
	WM_ONPAINT	= WM_APP + 1;	                //OnPaint 時の処理起動ﾒｯｾｰｼﾞ用


type
{$include ActionInterface.inc} 			 		// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
{$include JNTMASFUSENBIKODLGIFH.inc}
{$include JNTMASExceptIFI.inc}
{$include JNTMASExceptIFH.inc}
{$include JNTMASSEARCHDLGIFH.inc}
{$include JNTSelPrtIF.inc}                      // <PRN>
{$include JNTCRPSyncMasterH.inc}                // <041> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMAsterIFH.inc}                 // <050> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   iMasterKbn   :   Integer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP016000f = class(TForm)
    CmnToolBar: TMPanel;
    CmnButtonToolbarExit: TMSpeedButton;
    CmnToolbarButtonPrint: TMSpeedButton;
    CmnToolbarButtonChange: TMSpeedButton;
    CmnToolbarButtonDelete: TMSpeedButton;
    CmnInstructionBar: TMPanel;
    CmnInstructionCombo: TMComboBox;
    CmnTreeView: TMTreeView;
    CmnSplitter: TSplitter;
    StdCmnClientPanel: TMPanel;
    CmnTreeViewImage: TImageList;
    StdCmnClientPanelExist: TMPanel;
    StdCmnGridExist: TdxDBGrid;
    StdCmnGridExistName: TdxDBGridColumn;
    StdCmnGridExistNameSimple: TdxDBGridColumn;
    StdCmnGridExistAssociation: TdxDBGridColumn;
    DtlCmnClientPanel: TMPanel;
    DtlCmnScrollBox: TScrollBox;
    StdCmnClientPanelTotal: TMPanel;
    StdCmnGridTotal: TdxDBGrid;
    StdCmnGridTotalName: TdxDBGridColumn;
    StdCmnGridTotalNameSimple: TdxDBGridColumn;
    StdCmnGridTotalAssociation: TdxDBGridColumn;
    StdCmnTab: TMTab;
    StdCmnMemDataExist: TdxMemData;
    StdCmnMemDataExistExCode: TStringField;
    StdCmnMemDataExistName: TStringField;
    StdCmnMemDataExistAssociation: TStringField;
    StdCmnDataSourceExist: TDataSource;
    StdCmnQueryExist: TMQuery;
    StdCmnQueryTotal: TMQuery;
    StdCmnDataSourceTotal: TDataSource;
    StdCmnMemDataTotal: TdxMemData;
    StdCmnMemDataTotalExCode: TStringField;
    StdCmnMemDataTotalName: TStringField;
    StdCmnMemDataTotalNameSimple: TStringField;
    StdCmnMemDataTotalAssociation: TStringField;
    StdCmnMemDataExistNameSimple: TStringField;
    StdCmnMemDataExistAppDateStart: TDateField;
    StdCmnMemDataExistAppDateEnd: TDateField;
    CmnTreeViewPopupMenu: TPopupMenu;
    CmnTreeViewPopupMenuCopy: TMenuItem;
    CmnTreeViewPopupMenuPaste: TMenuItem;
    CmnTreeViewPopupMenuDelete: TMenuItem;
    CmnTreeViewPopupMenuBreak01: TMenuItem;
    CmnTreeViewPopupMenuBreak02: TMenuItem;
    CmnTreeViewPopupMenuErase: TMenuItem;
    CmnTreeViewPopupMenuBreak03: TMenuItem;
    CmnTreeViewPopupMenuTag01: TMenuItem;
    CmnTreeViewPopupMenuTag03: TMenuItem;
    CmnTreeViewPopupMenuTag02: TMenuItem;
    CmnTreeViewPopupMenuTag04: TMenuItem;
    StdCmnGridExistTag: TdxDBGridGraphicColumn;
    StdCmnMemDataExistgrTag: TGraphicField;
    StdCmnMemDataTotalgrTag: TGraphicField;
    StdCmnGridTotalTag: TdxDBGridGraphicColumn;
    StdCmnGridPopupMenu: TPopupMenu;
    StdCmnGridPopupMenuTag01: TMenuItem;
    StdCmnGridPopupMenuTag03: TMenuItem;
    StdCmnGridPopupMenuTag02: TMenuItem;
    StdCmnGridPopupMenuTag04: TMenuItem;
    StdCmnGridTotalCode: TdxDBGridMaskColumn;
    StdCmnGridExistCode: TdxDBGridMaskColumn;
    CmnToolbarButtonDetail: TMSpeedButton;
    MPanel2: TMPanel;
    CmnTreeViewPopupMenuDetail: TMenuItem;
    DtlCmnButtonUpdate: TMBitBtn;
    DtlCmnButtonCancel: TMBitBtn;
    MLabel50: TMLabel;
    StdCmnMemDataExistnAdoptDivision01: TIntegerField;
    StdCmnMemDataExistnAdoptDivision02: TIntegerField;
    StdCmnMemDataExiststrAdoptComment01: TStringField;
    StdCmnMemDataExiststrAdoptComment02: TStringField;
    StdCmnGridExistAdoptDivision01: TdxDBGridLookupColumn;
    StdCmnGridExistAdoptDivision02: TdxDBGridLookupColumn;
    StdCmnGridExistAdoptComment01: TdxDBGridMaskColumn;
    StdCmnGridExistAdoptComment02: TdxDBGridMaskColumn;
    StdCmnMemDataExistnAdoptData01: TSmallintField;
    StdCmnMemDataExistnAdoptData02: TSmallintField;
    StdCmnMemDataCustomer: TdxMemData;
    StdCmnMemDataCustomerDivision: TIntegerField;
    StdCmnMemDataCustomerDescription: TStringField;
    StdCmnMemDataSupplier: TdxMemData;
    StdCmnMemDataSupplierDivision: TIntegerField;
    StdCmnMemDataSupplierDescription: TStringField;
    CmnMemDataPrintExtStandard: TdxMemData;
    CmnPipelinePrintExtStandard: TppDBPipeline;
    CmnDataSourcePrintExtStandard: TDataSource;
    CmnMemDataPrintExtStandardstrExCode: TStringField;
    CmnMemDataPrintExtStandardstrAssociation: TStringField;
    CmnMemDataPrintExtStandardstrName: TStringField;
    CmnMemDataPrintExtStandardstrNameSimple: TStringField;
    CmnMemDataPrintExtStandarddtAppDateStart: TDateField;
    CmnMemDataPrintExtStandarddtAppDateEnd: TDateField;
    CmnReportExtStandardCst: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine50: TppLine;
    ppLine52: TppLine;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    CmnReportExtStandardCstLabelCorpCode: TppLabel;
    CmnReportExtStandardCstLabelCorpName: TppLabel;
    CmnReportExtStandardCstLabelTitle: TppLabel;
    CmnReportExtStandardCstLineTitle: TppLine;
    CmnReportExtStandardCstSysVarDate: TppSystemVariable;
    ppDetailBand_StandardCst: TppDetailBand;
    ppLine57: TppLine;
    CmnReportExtStandardCstDBTextCode: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppFooterBand3: TppFooterBand;
    CmnReportExtStandardCstSysVarPage: TppSystemVariable;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppLabel64: TppLabel;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppLine67: TppLine;
    ppLine70: TppLine;
    ppLine72: TppLine;
    CmnMemDataPrintExtStandardstrClassDesc: TStringField;
    CmnReportExtStandardBnk: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    CmnReportExtStandardBnkLabelCorpCode: TppLabel;
    CmnReportExtStandardBnkLabelCorpName: TppLabel;
    CmnReportExtStandardBnkLabelTitle: TppLabel;
    CmnReportExtStandardBnkLineTitle: TppLine;
    CmnReportExtStandardBnkSysVarDate: TppSystemVariable;
    ppDetailBand_StandardBnk: TppDetailBand;
    ppStandardBnkUnderLine: TppLine;
    CmnReportExtStandardBnkDBTextCode: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    CmnReportExtStandardBnkDBTextAppDateStart: TppDBText;
    CmnReportExtStandardBnkDBTextAppDateEnd: TppDBText;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppFooterBand4: TppFooterBand;
    CmnReportExtStandardBnkSysVarPage: TppSystemVariable;
    ppLabel69: TppLabel;
    ppLine109: TppLine;
    ppLine110: TppLine;
    DtlCmnTab: TMTab;
    ppStandardCstUnderLine: TppLine;
    ppDBText93: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppDBText105: TppDBText;
    ppDBText133: TppDBText;
    ppLabel87: TppLabel;
    ppLine49: TppLine;
    ppLine51: TppLine;
    ppLine53: TppLine;
    ppLine137: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine68: TppLine;
    ppLabel50: TppLabel;
    ppLine69: TppLine;
    ppLabel51: TppLabel;
    ppLabel88: TppLabel;
    CmnReportTtlStandardCst: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLine71: TppLine;
    ppLine138: TppLine;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    CmnReportTtlStandardCstLabelCorpCode: TppLabel;
    CmnReportTtlStandardCstLabelCorpName: TppLabel;
    CmnReportTtlStandardCstLineTitle: TppLine;
    CmnReportTtlStandardCstSysVarDate: TppSystemVariable;
    ppLabel103: TppLabel;
    ppLine141: TppLine;
    ppLine142: TppLine;
    ppLine144: TppLine;
    ppLine148: TppLine;
    ppLabel108: TppLabel;
    ppDetailBand_TtlStandardCst: TppDetailBand;
    ppLine149: TppLine;
    CmnReportTtlStandardCstDBTextCode: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppLine150: TppLine;
    ppLine151: TppLine;
    ppLine152: TppLine;
    ppLine153: TppLine;
    ppLine154: TppLine;
    ppLine156: TppLine;
    ppDBText146: TppDBText;
    ppLine157: TppLine;
    ppTtlStandardCstUnderLine: TppLine;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppLine161: TppLine;
    CmnReportTtlStandardCstDBTextUpdateDate: TppDBText;
    ppFooterBand7: TppFooterBand;
    CmnReportTtlStandardCstSysVarPage: TppSystemVariable;
    ppLabel98: TppLabel;
    ppLabel109: TppLabel;
    CmnReportExtStandardStf: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    CmnReportExtStandardStfLabelCorpCode: TppLabel;
    CmnReportExtStandardStfLabelCorpName: TppLabel;
    CmnReportExtStandardStfLabelTitle: TppLabel;
    CmnReportExtStandardStfLineTitle: TppLine;
    CmnReportExtStandardStfSysVarDate: TppSystemVariable;
    ppLabel59: TppLabel;
    ppLine37: TppLine;
    ppDetailBand_StandardStf: TppDetailBand;
    ppStandardStfUnderLine: TppLine;
    CmnReportExtStandardStfDBTextCode: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    CmnReportExtStandardStfDBTextAppDateStart: TppDBText;
    CmnReportExtStandardStfDBTextAppDateEnd: TppDBText;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    CmnReportExtStandardStfDBTextUpdateDate: TppDBText;
    ppLine46: TppLine;
    ppFooterBand2: TppFooterBand;
    CmnReportExtStandardStfSysVarPage: TppSystemVariable;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    CmnReportExtStandardGen: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine89: TppLine;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    CmnReportExtStandardGenLabelCorpCode: TppLabel;
    CmnReportExtStandardGenLabelCorpName: TppLabel;
    CmnReportExtStandardGenLabelTitle: TppLabel;
    CmnReportExtStandardGenLineTitle: TppLine;
    CmnReportExtStandardGenSysVarDate: TppSystemVariable;
    ppLabel102: TppLabel;
    ppLine91: TppLine;
    ppDetailBand_StandardGen: TppDetailBand;
    ppStandardGenUnderLine: TppLine;
    CmnReportExtStandardGenDBTextCode: TppDBText;
    ppDBText92: TppDBText;
    ppDBText108: TppDBText;
    ppDBText115: TppDBText;
    CmnReportExtStandardGenDBTextAppDateStart: TppDBText;
    CmnReportExtStandardGenDBTextAppDateEnd: TppDBText;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine99: TppLine;
    CmnReportExtStandardGenDBTextUpdateDate: TppDBText;
    ppLine100: TppLine;
    ppFooterBand5: TppFooterBand;
    CmnReportExtStandardGenSysVarPage: TppSystemVariable;
    ppDBText119: TppDBText;
    ppLine101: TppLine;
    ppLine102: TppLine;
    ppLabel104: TppLabel;
    CmnReportTtlStandardBnk: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLine106: TppLine;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel110: TppLabel;
    CmnReportTtlStandardBnkLabelCorpCode: TppLabel;
    CmnReportTtlStandardBnkLabelCorpName: TppLabel;
    CmnReportTtlStandardBnkLabelTitle: TppLabel;
    CmnReportTtlStandardBnkLineTitle: TppLine;
    CmnReportTtlStandardBnkSysVarDate: TppSystemVariable;
    ppLabel116: TppLabel;
    ppDetailBand_TtlStandardBnk: TppDetailBand;
    ppTtlStandardBnkUnderLine: TppLine;
    CmnReportTtlStandardBnkDBTextCode: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppLine140: TppLine;
    ppLine143: TppLine;
    ppLine145: TppLine;
    ppLine146: TppLine;
    ppLine147: TppLine;
    ppLine158: TppLine;
    CmnReportTtlStandardBnkDBTextUpdateDate: TppDBText;
    ppFooterBand8: TppFooterBand;
    CmnReportTtlStandardBnkSysVarPage: TppSystemVariable;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppColumnFooterBand2: TppColumnFooterBand;
    CmnReportTtlStandardStf: TppReport;
    ppHeaderBand9: TppHeaderBand;
    CmnReportTtlStandardStfLabelCorpCode: TppLabel;
    CmnReportTtlStandardStfLabelCorpName: TppLabel;
    CmnReportTtlStandardStfLabelTitle: TppLabel;
    CmnReportTtlStandardStfLineTitle: TppLine;
    CmnReportTtlStandardStfSysVarDate: TppSystemVariable;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppLine111: TppLine;
    ppLine155: TppLine;
    ppLine159: TppLine;
    ppLine162: TppLine;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel124: TppLabel;
    ppDetailBand_TtlStandardStf: TppDetailBand;
    ppTtlStandardStfUnderLine: TppLine;
    CmnReportTtlStandardStfDBTextCode: TppDBText;
    ppDBText125: TppDBText;
    ppDBText128: TppDBText;
    ppDBText143: TppDBText;
    ppLine166: TppLine;
    ppLine167: TppLine;
    ppLine168: TppLine;
    ppLine169: TppLine;
    ppLine170: TppLine;
    ppLine172: TppLine;
    CmnReportTtlStandardStfDBTextUpdateDate: TppDBText;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand9: TppFooterBand;
    CmnReportTtlStandardStfSysVarPage: TppSystemVariable;
    CmnReportTtlStandardGen: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLine163: TppLine;
    ppLine164: TppLine;
    ppLine171: TppLine;
    ppLine173: TppLine;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    CmnReportTtlStandardGenLabelCorpCode: TppLabel;
    CmnReportTtlStandardGenLabelCorpName: TppLabel;
    CmnReportTtlStandardGenLabelTitle: TppLabel;
    CmnReportTtlStandardGenLineTitle: TppLine;
    CmnReportTtlStandardGenSysVarDate: TppSystemVariable;
    ppLabel132: TppLabel;
    ppDetailBand_TtlStandardGen: TppDetailBand;
    ppTtlStandardGenUnderLine: TppLine;
    CmnReportTtlStandardGenDBTextCode: TppDBText;
    ppDBText145: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppLine179: TppLine;
    ppLine180: TppLine;
    ppLine181: TppLine;
    ppLine182: TppLine;
    ppLine183: TppLine;
    ppLine185: TppLine;
    CmnReportTtlStandardGenDBTextUpdateDate: TppDBText;
    ppFooterBand10: TppFooterBand;
    CmnReportTtlStandardGenSysVarPage: TppSystemVariable;
    DataSource1: TDataSource;
    CmnMemDataPrintSystem: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    ppDBPipeline1: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    CmnReportSystem: TppReport;
    ppHeaderBand11: TppHeaderBand;
    CmnReportSystemLabelCorpCode: TppLabel;
    CmnReportSystemLabelCorpName: TppLabel;
    CmnReportSystemLabelTitle: TppLabel;
    CmnReportSystemLineTitle: TppLine;
    CmnReportSystemSysVarDate: TppSystemVariable;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppLine19: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand_System: TppDetailBand;
    CmnReportSystemDBTextCodeDst: TppDBText;
    CmnReportSystemDBTextNameSimpleDst: TppDBText;
    CmnReportSystemDBTextCodeSrc: TppDBText;
    ppDBText18: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    CmnReportSystemLineDetailsBottom: TppLine;
    CmnReportSystemLineDetailsTop: TppLine;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand11: TppFooterBand;
    CmnReportSystemSysVarPage: TppSystemVariable;
    CmnDataSourcePrintCsDetails: TDataSource;
    CmnMemDataPrintExtDetailsCst: TdxMemData;
    CmnMemDataPrintExtDetailsCstExCode: TStringField;
    CmnMemDataPrintExtDetailsCstAssociation: TStringField;
    CmnMemDataPrintExtDetailsCstName: TStringField;
    CmnMemDataPrintExtDetailsCststrNameSimple: TStringField;
    CmnMemDataPrintExtDetailsCststrAdoptDesc: TStringField;
    CmnMemDataPrintExtDetailsCstdtAppDateStart: TDateField;
    CmnMemDataPrintExtDetailsCstnTaxCodeSales: TIntegerField;
    CmnMemDataPrintExtDetailsCststrTaxDescSales: TStringField;
    CmnMemDataPrintExtDetailsCstnTaxCodeStock: TIntegerField;
    CmnMemDataPrintExtDetailsCststrTaxDescStock: TStringField;
    CmnMemDataPrintExtDetailsCstnExCodeDebCustomer: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExCodeCreCustomer: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExCodeDebSupplier: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExCodeCreSupplier: TIntegerField;
    CmnMemDataPrintExtDetailsCststrFundDescDebCustomer: TStringField;
    CmnMemDataPrintExtDetailsCststrFundDescCreCustomer: TStringField;
    CmnMemDataPrintExtDetailsCststrFundDescDebSupplier: TStringField;
    CmnMemDataPrintExtDetailsCststrFundDescCreSupplier: TStringField;
    CmnMemDataPrintExtDetailsCststrAddressUpper: TStringField;
    CmnMemDataPrintExtDetailsCststrAddressLower: TStringField;
    CmnMemDataPrintExtDetailsCststrTelephoneNo: TStringField;
    CmnMemDataPrintExtDetailsCststrPostName: TStringField;
    CmnMemDataPrintExtDetailsCststrChargeName: TStringField;
    CmnMemDataPrintExtDetailsCststrRespectDesc: TStringField;
    CmnMemDataPrintExtDetailsCststrDraftRank: TStringField;
    CmnMemDataPrintExtDetailsCststrClearHouse01: TStringField;
    CmnMemDataPrintExtDetailsCststrClearHouse02: TStringField;
    CmnMemDataPrintExtDetailsCststrClearHouse03: TStringField;
    CmnMemDataPrintExtDetailsCststrDrawerDraft01: TStringField;
    CmnMemDataPrintExtDetailsCststrDrawerDraft02: TStringField;
    CmnMemDataPrintExtDetailsCststrDrawerDraft03: TStringField;
    CmnMemDataPrintExtDetailsCststrDrawerDraft04: TStringField;
    CmnMemDataPrintExtDetailsCststrDrawerDraft05: TStringField;
    CmnMemDataPrintExtDetailsCstnZipCodeUpper: TIntegerField;
    CmnMemDataPrintExtDetailsCstnZipCodeLower: TIntegerField;
    CmnMemDataPrintExtDetailsCstnClosingDay01Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCstnClosingDay02Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCstnClosingDay03Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay01Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay02Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay03Pay: TIntegerField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc01Pay: TStringField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc02Pay: TStringField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc03Pay: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc01Pay: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc02Pay: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc03Pay: TStringField;
    CmnMemDataPrintExtDetailsCstnClosingDay01Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCstnClosingDay02Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCstnClosingDay03Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay01Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay02Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCstnExpectDay03Rec: TIntegerField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc01Rec: TStringField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc02Rec: TStringField;
    CmnMemDataPrintExtDetailsCststrExpectMonthDesc03Rec: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc01Rec: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc02Rec: TStringField;
    CmnMemDataPrintExtDetailsCststrHolidayDesc03Rec: TStringField;
    CmnPipelinePrintCsDetails: TppDBPipeline;
    CmnReportExtDetailsCst: TppReport;
    ppHeaderBand1: TppHeaderBand;
    CmnReportExtDetailsCstLabelCorpName: TppLabel;
    CmnReportExtDetailsCstLabelCorpCode: TppLabel;
    CmnReportExtDetailsCstSysVarDate: TppSystemVariable;
    CmnReportExtDetailsCstLineTitle: TppLine;
    CmnReportExtDetailsCstLabelTitle: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine8: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDetailBand_ExtDetailsCst: TppDetailBand;
    CmnReportExtDetailsCstDBTextCode: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLine23: TppLine;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine1: TppLine;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel28: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppLabel26: TppLabel;
    ppDBText44: TppDBText;
    ppLabel27: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel29: TppLabel;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBText51: TppDBText;
    ppDBText53: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppLabel33: TppLabel;
    ppDBText57: TppDBText;
    ppLabel34: TppLabel;
    ppDBText58: TppDBText;
    ppLabel35: TppLabel;
    ppDBText60: TppDBText;
    ppDBText62: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppLabel36: TppLabel;
	ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppExtDetailsCstUnderLine: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    CmnReportExtDetailsCstDBTextUpdateDate: TppDBText;
    CmnReportExtDetailsCstDBTextAppDateStart: TppDBText;
    ppLabel8: TppLabel;
    CmnReportExtDetailsCstDBTextAppDateEnd: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppFooterBand1: TppFooterBand;
    CmnReportExtDetailsCstSysVarPage: TppSystemVariable;
    CmnMemDataPrintExtStandardgrTag: TGraphicField;
    CmnMemDataPrintExtStandardstrCustomerDesc: TStringField;
    CmnMemDataPrintExtStandardstrSupplierDesc: TStringField;
    CmnMemDataPrintExtStandardnExCodeCustDeb: TIntegerField;
    CmnMemDataPrintExtStandardnExCodeSuppDeb: TIntegerField;
    CmnMemDataPrintExtStandardstrCustDebDesc: TStringField;
    CmnMemDataPrintExtStandardstrSuppDebDesc: TStringField;
    CmnMemDataPrintExtStandardnExCodeCustCre: TIntegerField;
    CmnMemDataPrintExtStandardstrCustCreDesc: TStringField;
    CmnMemDataPrintExtStandardnExCodeSuppCre: TIntegerField;
    CmnMemDataPrintExtStandardstrSuppCreDesc: TStringField;
    CmnMemDataPrintExtStandardnTaxCodeSales: TIntegerField;
    CmnMemDataPrintExtStandardnTaxCodeStock: TIntegerField;
    CmnMemDataPrintExtStandardstrTaxSalesDesc: TStringField;
    CmnMemDataPrintExtStandardstrTaxStockDesc: TStringField;
    ppDBImage1: TppDBImage;
    CmnMemDataPrintExtStandarddtUpdateDate: TDateTimeField;
    CmnDataSourcePrintTtlStandard: TDataSource;
    CmnMemDataPrintTtlStandard: TdxMemData;
    GraphicField1: TGraphicField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    DateTimeField1: TDateTimeField;
    CmnPipelinePrintTtlStandard: TppDBPipeline;
    CmnMemDataPrintTtlStandardstrAdoptDesc: TStringField;
    CmnMemDataPrintTtlStandardstrAddress: TStringField;
    CmnMemDataPrintTtlStandardnZipCodeUpper: TIntegerField;
    CmnMemDataPrintTtlStandardnZipCodeLower: TIntegerField;
    ppDBImage2: TppDBImage;
    ppDBImage3: TppDBImage;
    ppDBImage4: TppDBImage;
    CmnMemDataPrintExtDetailsCstgrTag: TGraphicField;
    CmnMemDataPrintExtDetailsCststrClassDesc: TStringField;
    CmnMemDataPrintExtDetailsCstdtUpdateDate: TDateTimeField;
    ppDBImage5: TppDBImage;
    CmnMemDataPrintExtDetailsCstdtAppDateEnd: TDateField;
    ppDBText9: TppDBText;
    CmnReportExtStandardBnkAccOffice: TppLabel;
    CmnReportExtStandardCstAccOffice: TppLabel;
    CmnReportExtStandardStfAccOffice: TppLabel;
    CmnReportExtStandardGenAccOffice: TppLabel;
    CmnReportTtlStandardBnkAccOffice: TppLabel;
    CmnReportTtlStandardCstAccOffice: TppLabel;
    CmnReportTtlStandardStfAccOffice: TppLabel;
    CmnReportTtlStandardGenAccOffice: TppLabel;
    CmnReportExtDetailsCstAccOffice: TppLabel;
    CmnReportSystemAccOffice: TppLabel;
    N1: TMenuItem;
    CmnTreeViewPopupMenuTagOff: TMenuItem;
    N2: TMenuItem;
    StdCmnGridPopupMenuTagOff: TMenuItem;
    DtlCmnPopupMenu: TPopupMenu;
    DtlCmnPopupMenuTagOff: TMenuItem;
    MenuItem2: TMenuItem;
    DtlCmnPopupMenuTag01: TMenuItem;
    DtlCmnPopupMenuTag02: TMenuItem;
    DtlCmnPopupMenuTag03: TMenuItem;
    DtlCmnPopupMenuTag04: TMenuItem;
    CmnReportExtStandardBnkDBTextUpdateDate: TppDBText;
    CmnToolbarDropDownMenu: TPopupMenu;
    CmnToolbarDropDownMenuTag01: TMenuItem;
    CmnToolbarDropDownMenuTag02: TMenuItem;
    CmnToolbarDropDownMenuTag03: TMenuItem;
    CmnToolbarDropDownMenuTag04: TMenuItem;
    CmnToolbarImage: TImageList;
    DtlCmnPopupMenuItemTag01: TMenuItem;
    DtlCmnPopupMenuItemTag01Ex: TMenuItem;
    DtlCmnPopupMenuItemTag02: TMenuItem;
    DtlCmnPopupMenuItemTag03: TMenuItem;
    DtlCmnPopupMenuItemTag04: TMenuItem;
    DtlCmnPopupMenuItemTag02Ex: TMenuItem;
    DtlCmnPopupMenuItemTag03Ex: TMenuItem;
    DtlCmnPopupMenuItemTag04Ex: TMenuItem;
    DtlCmnPopupMenuTagComment: TMenuItem;
    StdCmnGridPopupMenuTagComment: TMenuItem;
    StdCmnGridPopupMenuItemTag01: TMenuItem;
    StdCmnGridPopupMenuItemTag01Ex: TMenuItem;
    StdCmnGridPopupMenuItemTag02: TMenuItem;
    StdCmnGridPopupMenuItemTag02Ex: TMenuItem;
    StdCmnGridPopupMenuItemTag03: TMenuItem;
    StdCmnGridPopupMenuItemTag03Ex: TMenuItem;
    StdCmnGridPopupMenuItemTag04: TMenuItem;
    StdCmnGridPopupMenuItemTag04Ex: TMenuItem;
    CmnTreeViewPopupMenuTagComment: TMenuItem;
    CmnTreeViewPopupMenuItemTag01: TMenuItem;
    CmnTreeViewPopupMenuItemTag02: TMenuItem;
    CmnTreeViewPopupMenuItemTag03: TMenuItem;
    CmnTreeViewPopupMenuItemTag04: TMenuItem;
    CmnTreeViewPopupMenuItemTag01Ex: TMenuItem;
    CmnTreeViewPopupMenuItemTag02Ex: TMenuItem;
    CmnTreeViewPopupMenuItemTag03Ex: TMenuItem;
    CmnTreeViewPopupMenuItemTag04Ex: TMenuItem;
    StdCmnMemDataExiststrComment: TStringField;
    StdCmnMemDataTotalstrComment: TStringField;
    StdCmnGridExistComment: TdxDBGridColumn;
    StdCmnGridTotalComment: TdxDBGridColumn;
    ppLine24: TppLine;
    CmnReportTtlStandardCstLabelTitle: TppLabel;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine38: TppLine;
    ppLine81: TppLine;
    ppLine92: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppLine36: TppLine;
    ppLine56: TppLine;
    ppLine80: TppLine;
    ppLine90: TppLine;
    ppLine18: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine119: TppLine;
    ppLine120: TppLine;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine123: TppLine;
    ppLine124: TppLine;
    ppLine125: TppLine;
    ppLine126: TppLine;
    ppLine127: TppLine;
    ppLine128: TppLine;
    ppLine129: TppLine;
    ppLine130: TppLine;
    ppLine131: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    ppLine135: TppLine;
    CmnMemDataPrintExtStandardSectionCode: TStringField;
    CmnMemDataPrintExtStandardSectionName: TStringField;
    ProgPanel: TMPanel;
    CmnStatusBar: TMStatusBar;
    Prog1: TProgressBar;
    BSpeedButtonSort: TMSpeedButton;
    ppLSaiyouName: TppLabel;
    ppLSaiyouName2: TppLabel;
    CmnMemDataPrintExtDetailsCstnLimitPrice: TCurrencyField;
    B_Search: TMSpeedButton;
    StdCmnMemDataExiststrExNCode: TFloatField;
    StdCmnMemDataTotalstrExNCode: TFloatField;
    CmnReportExtStandardStf2: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLine177: TppLine;
    ppLine178: TppLine;
    CmnReportExtStandardStfLabelCorpCode2: TppLabel;
    CmnReportExtStandardStfLabelCorpName2: TppLabel;
    CmnReportExtStandardStfLabelTitle2: TppLabel;
    CmnReportExtStandardStfLineTitle2: TppLine;
    CmnReportExtStandardStfSysVarDate2: TppSystemVariable;
    ppLine184: TppLine;
    ppLabel17: TppLabel;
    ppLine139: TppLine;
    ppLabel18: TppLabel;
    ppLine160: TppLine;
    ppLabel19: TppLabel;
    ppLine165: TppLine;
    ppLabel20: TppLabel;
    ppLine174: TppLine;
    ppLabel48: TppLabel;
    ppLine175: TppLine;
    ppLabel49: TppLabel;
    ppLine176: TppLine;
    ppLabel58: TppLabel;
    ppLine196: TppLine;
    ppLine198: TppLine;
    ppLine200: TppLine;
    ppLabel72: TppLabel;
    ppLBSectionName: TppLabel;
    ppDetailBand_StandardStf2: TppDetailBand;
    ppStandardStfUnderLine2: TppLine;
    ppLine188: TppLine;
    ppLine194: TppLine;
    ppDBText10: TppDBText;
    ppLine190: TppLine;
    ppDBText11: TppDBText;
    ppLine191: TppLine;
    ppDBText12: TppDBText;
    ppLine192: TppLine;
    CmnReportExtStandardStfDBTextAppDateStart2: TppDBText;
    ppLine193: TppLine;
    CmnReportExtStandardStfDBTextAppDateEnd2: TppDBText;
    ppLine195: TppLine;
    CmnReportExtStandardStfDBTextUpdateDate2: TppDBText;
    CmnReportExtStandardStfDBTextCode3: TppDBText;
    ppDBText26: TppDBText;
    ppLine199: TppLine;
    CmnReportExtStandardStfDBTextCode2: TppDBText;
    ppLine136: TppLine;
    ppLine186: TppLine;
    ppFooterBand6: TppFooterBand;
    CmnReportExtStandardStfSysVarPage2: TppSystemVariable;
    CmnReportExtStandardStfAccOffice2: TppLabel;
    CmnToolbarImageD: TImageList;
    ToolBarFusen: TToolBar;
    CmnToolbarButtonTag: TToolButton;
    MSPFunctionBar: TMSPFunctionBar;
    aclExec: TActionList;
    FreeSetHojyo: TAction;
    MPnlHead: TMPanel;
    DtlCmnLabelExCodeTitle: TMLabel;
    DtlCmnImgFusen: TImage;
    DtlCmnEditExCodeFree: TMTxtEdit;
    DtlCmnEditExCodeNumeric: TMNumEdit;
    Pnl_SegBunInfo: TMPanel;
    MLabel49: TMLabel;
    Jituzai_LLabel_SegTitl1: TMLabel;
    Jituzai_LLabel_SegTitl2: TMLabel;
    Jituzai_LLabel_SegTitl3: TMLabel;
    Jituzai_LLabel_SegTitl4: TMLabel;
    Jituzai_LLabel_SegTitl5: TMLabel;
    Jituzai_LLabel_SegTitl6: TMLabel;
    Jituzai_LLabel_SegTitl7: TMLabel;
    Jituzai_LLabel_SegTitl8: TMLabel;
    Jituzai_LLabel_SegTitl9: TMLabel;
    Jituzai_LLabel_SegTitl10: TMLabel;
    Jituzai_LLabel_SegNm1: TMLabel;
    Jituzai_LLabel_SegNm2: TMLabel;
    Jituzai_LLabel_SegNm3: TMLabel;
    Jituzai_LLabel_SegNm4: TMLabel;
    Jituzai_LLabel_SegNm5: TMLabel;
    Jituzai_LLabel_SegNm6: TMLabel;
    Jituzai_LLabel_SegNm7: TMLabel;
    Jituzai_LLabel_SegNm8: TMLabel;
    Jituzai_LLabel_SegNm9: TMLabel;
    Jituzai_LLabel_SegNm10: TMLabel;
    MLabel35: TMLabel;
    MLabel33: TMLabel;
    MLabel37: TMLabel;
    MLabel34: TMLabel;
    MLabel53: TMLabel;
    Jituzai_LLabel_BunTitl1: TMLabel;
    Jituzai_LLabel_BunTitl2: TMLabel;
    Jituzai_LLabel_BunTitl3: TMLabel;
    Jituzai_LLabel_BunTitl4: TMLabel;
    Jituzai_LLabel_BunTitl5: TMLabel;
    Jituzai_LLabel_BunTitl6: TMLabel;
    Jituzai_LLabel_BunTitl7: TMLabel;
    Jituzai_LLabel_BunTitl8: TMLabel;
    Jituzai_LLabel_BunTitl9: TMLabel;
    Jituzai_LLabel_BunTitl10: TMLabel;
    Jituzai_LLabel_BunNm1: TMLabel;
    Jituzai_LLabel_BunNm2: TMLabel;
    Jituzai_LLabel_BunNm3: TMLabel;
    Jituzai_LLabel_BunNm4: TMLabel;
    Jituzai_LLabel_BunNm5: TMLabel;
    Jituzai_LLabel_BunNm6: TMLabel;
    Jituzai_LLabel_BunNm7: TMLabel;
    Jituzai_LLabel_BunNm8: TMLabel;
    Jituzai_LLabel_BunNm9: TMLabel;
    Jituzai_LLabel_BunNm10: TMLabel;
    Jituzai_ETEdit_SegCd1: TMTxtEdit;
    Jituzai_ETEdit_SegCd2: TMTxtEdit;
    Jituzai_ETEdit_SegCd3: TMTxtEdit;
    Jituzai_ETEdit_SegCd4: TMTxtEdit;
    Jituzai_ETEdit_SegCd5: TMTxtEdit;
    Jituzai_ETEdit_SegCd6: TMTxtEdit;
    Jituzai_ETEdit_SegCd7: TMTxtEdit;
    Jituzai_ETEdit_SegCd8: TMTxtEdit;
    Jituzai_ETEdit_SegCd9: TMTxtEdit;
    Jituzai_ETEdit_SegCd10: TMTxtEdit;
    Jituzai_ETEdit_BunCd1: TMTxtEdit;
    Jituzai_ETEdit_BunCd2: TMTxtEdit;
    Jituzai_ETEdit_BunCd3: TMTxtEdit;
    Jituzai_ETEdit_BunCd4: TMTxtEdit;
    Jituzai_ETEdit_BunCd5: TMTxtEdit;
    Jituzai_ETEdit_BunCd6: TMTxtEdit;
    Jituzai_ETEdit_BunCd7: TMTxtEdit;
    Jituzai_ETEdit_BunCd8: TMTxtEdit;
    Jituzai_ETEdit_BunCd9: TMTxtEdit;
    Jituzai_ETEdit_BunCd10: TMTxtEdit;
    PnlH2: TMPanel;
    DtlCmnLabelAppDateAddtion: TMLabel;
    DtlCmnLabelName: TMLabel;
    DtlCmnLabelNameSimple: TMLabel;
    DtlCmnLabelAppDateTitle: TMLabel;
    DtlCmnEditName: TMTxtEdit;
    DtlCmnEditNameSimple: TMTxtEdit;
    DtlCmnEditAppDateEnd: TMDateEdit;
    DtlCmnEditAppDateStart: TMDateEdit;
    PnlH1: TMPanel;
    DtlCmnLabelAssociation: TMLabel;
    DtlCmnLabelDescSumDivision: TMLabel;
    DtlCmnEditAssociation: TMTxtEdit;
    DtlCmnEditSumDivision: TMNumEdit;
    Image_Fusen_Red: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Glay: TImage;
    CmnMemDataPrintSegBun: TdxMemData;
    CmnMemDataPrintSystemstrExCode: TStringField;
    CmnMemDataPrintSystemstrName: TStringField;
    CmnMemDataPrintSystemdtStart: TDateTimeField;
    CmnMemDataPrintSystemdtEnd: TDateTimeField;
    CmnMemDataPrintSystemstrSeg01Code: TStringField;
    CmnMemDataPrintSystemstrSeg02Code: TStringField;
    CmnMemDataPrintSystemstrSeg03Code: TStringField;
    CmnMemDataPrintSystemstrSeg04Code: TStringField;
    CmnMemDataPrintSystemstrSeg05Code: TStringField;
    CmnMemDataPrintSystemstrSeg01Name: TStringField;
    CmnMemDataPrintSystemstrSeg02Name: TStringField;
    CmnMemDataPrintSystemstrSeg03Name: TStringField;
    CmnMemDataPrintSystemstrSeg04Name: TStringField;
    CmnMemDataPrintSystemstrSeg05Name: TStringField;
    CmnMemDataPrintSystemstrBun01Code: TStringField;
    CmnMemDataPrintSystemstrBun02Code: TStringField;
    CmnMemDataPrintSystemstrBun03Code: TStringField;
    CmnMemDataPrintSystemstrBun04Code: TStringField;
    CmnMemDataPrintSystemstrBun05Code: TStringField;
    CmnMemDataPrintSystemstrBun01Name: TStringField;
    CmnMemDataPrintSystemstrBun02Name: TStringField;
    CmnMemDataPrintSystemstrBun03Name: TStringField;
    CmnMemDataPrintSystemstrBun04Name: TStringField;
    CmnMemDataPrintSystemstrBun05Name: TStringField;
    CmnMemDataPrintSegBunstrSeg06Code: TStringField;
    CmnMemDataPrintSegBunstrSeg07Code: TStringField;
    CmnMemDataPrintSegBunstrSeg08Code: TStringField;
    CmnMemDataPrintSegBunstrSeg09Code: TStringField;
    CmnMemDataPrintSegBunstrSeg10Code: TStringField;
    CmnMemDataPrintSegBunstrSeg06Name: TStringField;
    CmnMemDataPrintSegBunstrSeg07Name: TStringField;
    CmnMemDataPrintSegBunstrSeg08Name: TStringField;
    CmnMemDataPrintSegBunstrSeg09Name: TStringField;
    CmnMemDataPrintSegBunstrSeg10Name: TStringField;
    CmnMemDataPrintSegBunstrBun06Code: TStringField;
    CmnMemDataPrintSegBunstrBun07Code: TStringField;
    CmnMemDataPrintSegBunstrBun08Code: TStringField;
    CmnMemDataPrintSegBunstrBun09Code: TStringField;
    CmnMemDataPrintSegBunstrBun10Code: TStringField;
    CmnMemDataPrintSegBunstrBun06Name: TStringField;
    CmnMemDataPrintSegBunstrBun07Name: TStringField;
    CmnMemDataPrintSegBunstrBun08Name: TStringField;
    CmnMemDataPrintSegBunstrBun09Name: TStringField;
    CmnMemDataPrintSegBunstrBun10Name: TStringField;
    SPMasHoj: TFDStoredProc;
    SPPayHoj: TFDStoredProc;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

    procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
    procedure fnOnCreate(Sender: TObject);
    procedure fnOnClose(Sender: TObject; var Action: TCloseAction);
    procedure fnCmnInstructionComboOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnCmnButtonToolbarExitOnClick(Sender: TObject);
    procedure fnCmnToolbarButtonChangeOnClick(Sender: TObject);
	procedure fnCommonFunctionOnEnter01(Sender: TObject);
	procedure fnCommonFunctionOnEnter02(Sender: TObject);
	procedure fnCommonFunctionOnKeyDown01(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnBeforePrint(Sender: TObject);
    procedure fnStdCmnGridExistOnEnter(Sender: TObject);
    procedure fnStdCmnGridExistOnChangeNodeEx(Sender: TObject);
    procedure fnStdCmnGridTotalOnChangeNodeEx(Sender: TObject);
    procedure fnStdCmnGridExistOnBeforeChangeColumn(Sender: TObject;
                    Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure fnStdCmnGridTotalOnBeforeChangeColumn(Sender: TObject;
                    Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure fnStdCmnMemDataExistBeforePost(DataSet: TDataSet);
    procedure fnStdCmnMemDataTotalBeforePost(DataSet: TDataSet);
    procedure fnStdCmnGridTotalOnEnter(Sender: TObject);
    procedure fnStdCmnDataSourceExistOnStateChange(Sender: TObject);
    procedure fnStdCmnDataSourceTotalOnStateChange(Sender: TObject);
    procedure fnCmnTreeViewOnDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure fnCmnTreeViewOnDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure fnCmnTreeViewPopupMenuOnPopup(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuCutOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuPasteOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuCopyOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuDeleteOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuEraseOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagRedOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagGreenOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagBlueOnClick(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagOrangeOnClick(Sender: TObject);
    procedure fnStdCmnClientPanelExistOnResize(Sender: TObject);
    procedure fnStdCmnClientPanelTotalOnResize(Sender: TObject);
    procedure fnCmnInstructionComboOnChange(Sender: TObject);
    procedure fnStdCmnGridExistCodeOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnStdCmnGridExistOnEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure fnStdCmnGridTotalOnEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure fnStdCmnGridTotalCodeOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnStdCmnGridExistOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnCmnToolbarButtonDeleteOnClick(Sender: TObject);
    procedure fnCmnToolbarButtonDetailOnClick(Sender: TObject);
    procedure fnCmnTreeViewOnChange(Sender: TObject; Node: TTreeNode);
    procedure fnCmnTreeViewPopupMenuDetailOnClick(Sender: TObject);
    procedure fnDtlCmnButtonUpdateOnClick(Sender: TObject);
    procedure fnDtlCmnButtonCancelOnClick(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnEnter		(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnChange	(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnExit		(Sender: TObject);
    procedure fnDtlCmnEditNameSimpleOnEnter(Sender: TObject);
    procedure fnCmnToolbarButtonPrintOnClick(Sender: TObject);
    procedure fnCmnReportSystemppDBTextExCodeDstOnPrint(Sender: TObject);
    procedure fnCmnReportSystemOnEndPage(Sender: TObject);
    procedure fnDtlCmnEditAppDateStartOnExit(Sender: TObject);
    procedure fnDtlCmnEditAppDateEndOnExit(Sender: TObject);
    procedure fnStdCmnTabOnEnter(Sender: TObject);
    procedure fnCmnTreeViewOnEnter(Sender: TObject);
    procedure fnDtlCmnTabOnChange(Sender: TObject);
    procedure fnStdCmnGridPopupMenuOnPopup(Sender: TObject);
    procedure fnOnShow(Sender: TObject);
    procedure fnJNTCRP016000fOnHide(Sender: TObject);
    procedure fnJNTCRP016000fOnActivate(Sender: TObject);
    procedure fnDtlCmnTabOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnJNTCRP016000fOnPaint(Sender: TObject);
	procedure fnStdCmnTabOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnJNTCRP016000fOnCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ppDetailBand_StandardBnkBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_StandardCstBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_StandardStfBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_TtlStandardBnkBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_TtlStandardCstBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_TtlStandardStfBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_TtlStandardGenBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_ExtDetailsCstBeforeGenerate(Sender: TObject);
    procedure ppDetailBand_SystemBeforeGenerate(Sender: TObject);
    procedure fnStdCmnTabOnChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
	procedure fnDtlCmnEditNameOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnCommonFunctionDetailsOnChange(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagOnClick(Sender: TObject);
    procedure fnStdCmnGridPopupMenuTagOnClick(Sender: TObject);
    procedure fnDtlCmnPopupMenuOnPopup(Sender: TObject);
    procedure fnDtlCmnPopupMenuTagOnClick(Sender: TObject);
    procedure fnStdCmnGridTotalOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnStdCmnGridExistOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnStdCmnGridTotalOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnCmnEditDayOnExit(Sender: TObject);
    procedure fnDtlCmnEditNameSimpleOnExit(Sender: TObject);
    procedure fnStdCmnGridTotaOnlChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure fnStdCmnGridExistOnChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure fnCmnToolbarDropDownMenuItemOnClick(Sender: TObject);
    procedure fnCmnToolbarButtonTagOnClick(Sender: TObject);
    procedure fnDtlCmnPopupMenuTagOnClickEx(Sender: TObject);
    procedure fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);
    procedure fnCmnTreeViewPopupMenuTagOnClickEx(Sender: TObject);
    procedure fnStdCmnGridExistOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnStdCmnGridTotalOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DtlCmnButtonUpdateEnter(Sender: TObject);
    procedure ppDetailBand_StandardStf2BeforeGenerate(Sender: TObject);
    procedure DtlCmnEditExCodeNumericArrowClick(Sender: TObject);
    procedure BSpeedButtonSortClick(Sender: TObject);
    procedure CmnTreeViewExit(Sender: TObject);
    procedure B_SearchClick(Sender: TObject);
    procedure CmnToolbarButtonDeleteMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
	procedure fnCommonFunctionOnKeyDown02(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnDtlCommonFunctionOnEnter(Sender: TObject);
    procedure MSPFunctionBarFunctionClick(Sender: TObject;
      FuncNo: Integer);
    procedure FreeSetHojyoExecute(Sender: TObject);
    procedure Jituzai_ETEdit_FldChk(Sender: TObject);
    procedure DtlCmnEditExCodeExit(Sender: TObject);
    procedure ArrowClick(Sender: TObject);
    procedure CmnInstructionComboExit(Sender: TObject);

  private
    { Private 宣言 }
    m_cJNTArea              : TJNTCommon;                           //
	m_pRec				    : ^TMjsAppRecord;			            // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
    m_cDataModule		    : TMDataModulef;                        //
    m_cComArea			    : TJNTMASCom;                           //
    m_cDBSelect			    : TFDConnection;                            // 子社DB
	m_cACControl		    : TWinControl;				            // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
	m_cPrnSupport		    : TMjsPrnSupport;                       //
//<061>		m_cAppPrm			    : TAppParam;                            //
    m_MjsMsgRec 	        : TMjsMsgRec;                           //
    m_nCurrentMasterDiv     : Integer;                              // ﾏｽﾀ区分 (31～35)
    m_nCurrentCodeDigit     : Integer;                              // 汎用補助ｺｰﾄﾞ桁数
    m_nCurrentCodeAttr      : Integer;                              // 汎用補助ｺｰﾄﾞ属性
	m_nProcDivision		    : Integer;								// 処理区分 (0:通常, 21:銀行のみ, 25:社員のみ)
	m_nSelectTagKind	    : Integer;                              // 付箋区分
	m_nDateFormatDivision   : Integer;                              // 和暦西暦区分(0:和暦 1:西暦)
	m_nMailAdoption		    : Integer;                              // ﾒｰﾙ会計処理区分
	m_nDBErrorCode		    : Integer;                              // DBｴﾗｰｺｰﾄﾞ
	m_nSaveTreeRecCount	    : Integer;                              //
	m_nSaveTreeRecMax	    : Integer;                              //
	m_nHintPosition		    : Extended;                             //
	m_strHintPosition	    : String;                               //
	m_stSelectItem          : array [1.. 5] of SelectValidItem;     //
	m_stSaveTreeRec		    : array of SaveTreeRec;                 //
	m_bHojyoTreeDelete	    : array [0..14] of Byte;                //
	m_bHojyoTree2		    : array [0..14] of Byte;                //
	m_strExCodeCurrent      : String;                               //
    m_strExNCodeCurrent     : Extended;                             //
	m_strExCodePrint        : String;                               //
	m_strValidCharacters    : String;                               //
	m_stWorkRecPaste        : TreeViewRec;                          //
	m_stMasterData	        : MasterData;                           //
	m_stPrintDstData        : PrintDstData;                         //
    m_fAccessTab            : Boolean;                              // ﾀﾌﾞｱｸｾｽ可能ﾌﾗｸﾞ
	m_fIgnoreProc		    : Boolean;                              //
    m_fUpdateRecord         : Boolean;                              // 更新ﾚｺｰﾄﾞ有無ﾌﾗｸﾞ
	m_fUpDeleteRecord	    : Boolean;                              //
	m_fDtlChangeExCode      : Boolean;                              // 詳細画面補助ｺｰﾄﾞ変更時ﾌﾗｸﾞ
	m_fDtlNewRecord	        : Boolean;                              // 詳細画面新規登録ﾌﾗｸﾞ
	m_fUnderConstruction    : Boolean;                              // 処理作業中ﾌﾗｸﾞ
	m_fComboBoxListDraw	    : Boolean;                              // 補助分類ｺﾝﾎﾞDrawﾌﾗｸﾞ
//	m_fDeleteCSInfo		    : Boolean;                              //
	m_fChangeDetails	    : Boolean;                              // 詳細画面入力値変更ﾌﾗｸﾞ
	m_cNodePrevSelect	    : TTreeNode;                            //
    m_cNodeRightClick       : TTreeNode;                            //
	m_nGridExistRecords     : Integer;                              //
	m_nGridTotalRecords     : Integer;                              //
	m_nOrderDivision	    : Integer;								// 印刷範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr	    : String;								// 印刷開始部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd	    : String;								// 印刷終了部門外部ｺｰﾄﾞ
	giReferFlag			    : Integer;							    // 参照ﾌﾗｸﾞ
	m_DeleteCheck		    : Boolean;                              //
	m_Close				    : Boolean;                              //
	m_BumonUseKbn		    : Integer;							    // 部門採用区分
//<061>		m_BumonCodeDigit	    : Integer;							    // 部門ｺｰﾄﾞ桁数
//<061>		m_BumonCodeAttr		    : Integer;							    // 部門ｺｰﾄﾞ属性
//<061>		m_BumonName			    : String;								// 部門名
	m_DataKbn			    : Integer;							    // ﾃﾞｰﾀ区分
	m_NewRecord			    : Boolean;							    // ﾚｺｰﾄﾞ新規追加ﾌﾗｸﾞ
    m_TokuisakiCheck        : Boolean;                              // 得意先ﾁｪｯｸ<印刷時>
    m_SiiresakiCheck        : Boolean;                              // 仕入先ﾁｪｯｸ<印刷時>
    m_NoCheck               : Boolean;                              // HIS0042
  	m_SearchInfo	        : SearchInfoRec;                        // 検索対象分類情報
	m_fSystemClear          : Boolean;                              // 2004/09/02
    m_DoDspKeyDown          : Boolean;                              //
    m_FncInfo               : urFncInfo;                            // <002> ﾌﾘｰ項目ﾌｧﾝｸｼｮﾝ
	m_arAdoptInfo_Seg	    : array [1..10] of AdoptInfo;           // <003> ｾｸﾞﾒﾝﾄ分類
	m_arAdoptInfo_HBr	    : array [1..10] of AdoptInfo;           // <003> 汎用補助分類
    m_FusenColorIdx         : Integer;                              // <001> ToolButtonの付箋ｶﾗｰを保存
    m_UpdFreeFlg			: Boolean;                              // <005> ﾌﾘｰ項目登録ﾌﾗｸﾞ
    m_freeItem			    : TJNTFreeRec;                          // <005>
    m_freeItemNull		    : TJNTFreeRec;                          // <005>
    m_ExpOpenSW             : Boolean;                              // <007> ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
    m_DspFlg                : Boolean;                              // <008> OnShowﾌﾗｸﾞ
    AOwner                  : TComponent;                           // <009>
    uvSelSys                : TJNTSelCorpSys; 	                    // <PRN> 会社ｼｽﾃﾑ情報
    uvHani                  : TJNTHani;		                        // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	    : TPrintAppEntry;                       // <PRN>
    ArrHdl                  : Array[0..100] of Pointer;			    // <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        : rcPrtParam;                           // <PRN>
    DmqPrint                : TMQuery;                              // <PRN> 印刷用ｸｴﾘｰ
    m_IsUpdate              : Boolean;                              // <012> 権限
    m_TantoNCode            : Currency;                             // <041> ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
    m_SyncMaster            : TSyncMaster;                          // <041> ﾏｽﾀ同期基本ｸﾗｽ
    m_RowState              : Integer;                              // <041> 詳細画面行ｽﾃｰﾀｽ
    m_HojyoUseFlg           : Boolean;                              // 汎用補助採用ﾌﾗｸﾞ

    procedure   fnGetGrants                     ();                 // <012> 権限
    function    fnCorpRelation                  (pExCode: String; pSumKbn: Integer): Integer;     // <041>
	procedure	SessionPractice(iSyori: Integer);					// <057> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
    function    fnDelCRLF                       (sData: String): String;	// <DKAI> 改行削除

  public
    { Public 宣言 }
    constructor fnCreateForm                    ( pRec : Pointer);
    procedure   fnRebuildTreeViewItems			();
    procedure   fnCreateTreeViewItems			(cSrcNode: TTreeNode; iKbn: Integer);
    procedure   fnCreateTreeViewItem			(dqMasterData: TMQuery; cNodeSrc: TTreeNode);
	procedure	fnCleanupTreeViewNewItem		(fSelected: Boolean);
	procedure	fnCleanupTreeViewNewItemEx		();
	function	fnChangeSelectionScreen			(): Boolean;
	procedure	fnChangeToolbarButtonsCondition	(cNodeTarget: TTreeNode);
	procedure	fnChangeComponentState			(nSumDivision: Integer);
	procedure	fnChangeComponentStateCmn		(fEnabled: Boolean);
	procedure	fnChangeComponentStateInd		(nSumDivision: Integer);
//<061>		procedure	fnCHangeConditionGridExist		(strExCode: String);
	procedure	fnAddTreeViewUnconnectedItems	();
    procedure   fnUpdateTreeViewItems           (nDivision: Integer; strExCode: String; strExNCode : Extended; strNameSimple: String; nAccessMethod: Integer);
    procedure   fnUpdateTreeViewItemsEx         (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent: TTreeNode);
    procedure   fnUpdateTreeViewItemsEx2		(cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
	procedure	fnDeleteTreeViewItems			(strExCode: String);
	procedure	fnDeleteTreeViewUselessItems	();
	procedure	fnEraseTreeViewItems			(cNodeTarget: TTreeNode);
	procedure	fnEnableToolbarButtonTag		(fEnabled: Boolean);
    procedure   fnInsertTreeViewItemsEx         (cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
	procedure	fnInitializeDetailScreen		(fClearExCode: Boolean);
	procedure	fnOutputDBErrorMessage			();
	procedure	fnPrintCheckListExtStandard		();
	procedure	fnPrintCheckListTtlStandard		();
	procedure	fnPrintCheckListExtDetails		();
	procedure	fnPrintCheckListSystem			();
	procedure	fnPrintCheckListSegBun			();								// 051104 hirota
	procedure	fnMoveGridRecordSelecter		(nDivision: Integer; strExCode: String);
    procedure   fnSetParentItemsInfo			();
    procedure	fnSetParentItemsInfoEx			(nDivision: Integer; strExCode : String; strExNCode : Extended; strExCodeParent: String; strExNCodeParent: Extended; strName: String);
	procedure	fnSetGridMemData				(dqMasterData: TMQuery);
	function	fnSetDetailScreenInfo			(strExCode: String; var nSumDivision: Integer): Boolean;
	procedure	fnSetSystemRecords				();
	procedure	fnSetSystemRecord				(dqMasterData: TMQuery);
	procedure	fnSetGridTagInfo				(nTagKind: Integer);
	procedure	fnShowDetailScreen				();
	function	fnUpdateDetailsScreenRecord		(): Boolean;
    function	fnUpdateMasterRecord			(nStrExNCode:Extended): Boolean;
	procedure	fnUpdateDetailIndInfo			();
    function	fnUpdateMasterDataTagInfo       (strExNCode: Extended; var nTagKind: Integer): Boolean;
    procedure   fnUpdateMasterDataTagInfoEx		(strExNCode: Extended; var nTagKind: Integer; strTagComment: String);
    procedure	fnUpdateGridMemDataRecord		(nDivision: Integer; strExCode: String; nTagKind: Integer);
	procedure	fnUpdateParentItemsInfoCaption	(strExCode: String; strNameSimple: String);
    procedure   fnInsertMasterTreeRecord		(strExNCodeSrc: Extended; strExNCodeSrcParent: Extended;
                                                 strExNCodeDst: Extended; strExNCodeDstParent: Extended; nDivisionDst: Integer; nAccessMethod: Integer);
    procedure   fnDeleteMasterRecord            (nDivision: Integer; strExCode: String);
    procedure   fnEraseMasterTreeRecord         (strExNCode: Extended; strExNCodeParent: Extended);
    procedure   fnResetParentItemsInfo			();
    procedure   fnRewriteMasterTreeRecords		(strExNCodeParent: Extended);
	function	fnCheckExCodeValidCharacter		(strExCode: String): Boolean;
	function	fnCheckFreeCodeValidCharacter	(strFreeCode: String): Boolean;
    procedure   fnCheckMasterDataTagInfo        (strExNCode: Extended; var pTagInfo: array of TagInfo);
    function    fnCheckMasterDataRecordValid	(strExCode: String): Boolean;
    function	fnCheckMasterTreePasteValid		(strExNCodeSrc: Extended; cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValid	(strExNCodeSrc, strExNCodeDst: Extended): Boolean;
    function    fnCheckMasterTreeInsertValid3	(cNodeSrc, cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValid2	(cNodeSrc, cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValidEx	(nDivision: Integer; strExNCodeCmp1, strExNCodeCmp2: Extended): Boolean;
	function	fnCheckCommonDetailScreenValue	(nDivision: Integer): Boolean;
	function	fnCheckRequisiteItem			(nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer): Integer;
	function	fnCheckPermitGeneralRecDelete	(): Boolean;
	function	fnCheckDtlExCodeValid			(): Boolean;
    function    fnGetMasterTreeEntryNo			(dqMasterTree: TMQuery; strExNCode: Extended; strExNCodeParent: Extended): Integer;
    function    fnGetMasterTreeEntryNoFinal		(dqMasterTree: TMQuery; strDstExNCode: Extended): Integer;
    function	fnGetMasterDataTagInfo			(strExNCode: Extended): Integer;
    function    fnGetTagColorBitmap				(nTagColor: Integer): TBitmap;
	function	fnGetNameSimple					(nExCode: Integer): String;
	function	fnGetClassDescription			(nClassCode: Integer): String;
	function	fnGetRespectDescription			(nRespectDivision: Integer): String;
	function	fnGetTaxRateDescription			(nTaxRateCode: Integer): String;
	function	fnOutputConfirmationMessage		(nDivision: Integer): Integer;
	function	fnResetDetailScreen				(): Boolean;
    function    fnUpdateMasterTreeRecord		(strExNCode:Extended): Boolean;
    function    fnUpdateMasterDataRecord		(strExNCode:Extended): Boolean;
    function    fnDeleteMasterTreeRecord        (nDivision: Integer; strExNCode: Extended): Boolean;
    function    fnDeleteMasterDataRecord        (nDivision: Integer; strExNCode: Extended): Boolean;
    function    fnDeleteMasterDataAddition		(strExNCode: Extended): Boolean;
	procedure	fnSetDeleteButtonCondition		();
	function	fnMakeSQLConstructionFunds		(): String;
	procedure	fnPartsControl					(Select: Integer);
	procedure	fnSetFileOutTF					(PrintDivision: Integer; var sTitle: TStringList; var sMemFld: TStringList);
// <041>	function	fnMakeSQL						(FLAG,StratEndFlag: Boolean):String;
	function	fnMakeSQL						(nType: Integer): String;   // <041>
    function	fnCheckTreeViewDropItem			(cNodeDst: TTreeNode; strExNCode: Extended; nDivisionSrc: Integer): Boolean;
    function	fnHojyoTreeDelete               (strPreExCode, strExCode: Extended): Integer;
	procedure	fnDeleteCheck					();
	function    MakeDspString                   (CODE: String; NAME: String):String;
	procedure   fnSearch		                ();
	function    fnDownSearch	                ():Boolean;
	function	fnClearAllSystems			    (): Boolean;
    procedure   gfnGetExNCode                   (nTblName:String; var nExNCode : Extended);         // 内部ｺｰﾄﾞを取得(新規)
    procedure   gfnSetExNCode                   (nTblName,nGCode:String; var nExNCode : Extended);  // 該当ﾚｺｰﾄﾞの内部ｺｰﾄﾞを取得
    procedure   fnCheckTekiDate                 (nDmqDataQry: TMQuery);

    procedure   gfnGetNCode                     (nMasKbn: Integer; nExCode: String; var nExNCode: Extended; var nSumKbn: Integer);
    function    gfnGetSegBunGCode               (nMasKbn: Integer; nExNCode: Extended): String;
    function    gfnGetSegBunNCode               (nMasKbn: Integer; nExCode: String; nAttr: Integer): Extended;
//<017>    procedure   fnSetFncType                    (nDspType: Integer);    // <002>
    procedure   fnSetFncType                    (nDspType: Boolean ;ifuncNo : Integer);
    procedure   fnFreeDlg                       (nFunc: Integer);       // <002>
    procedure   fnSegBumInzForm                 ();                     // <003>
    function    fnGetNAME                       (pCODE: String; pMKBN,pAttr: Integer; var RName: String): Boolean;  // <003>
    function    fnCheckMasterTreeInsertValidStr (strExCodeSrc, strExCodeDst: String): Boolean; //<015>
    function    fnDelCheck                      (exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;   // <CHK>

  Protected
    { Protected 宣言 }
	procedure	CMChildkey                      (var Msg : TWMKey);     message CM_CHILDKEY;
    procedure   CMShowingChanged                (var Msg : TMessage);   message CM_SHOWINGCHANGED;

  end;

function    AppEntry (pPar: Pointer) : Integer;
exports
	AppEntry;
implementation

var
	_SystemClear    :   String	= '加算情報を消去します。'#13#10'再登録後はマスタ更新処理を行って下さい。';     //2004/09/02

	_CodeError      :   String	= 'コードには次の文字は使用できません。'' " : ? \ *';

const
    ACCESS_COPY             = 1;
    ACCESS_PASTE            = 2;
    ACCESS_CUTANDPASTE      = 3;

    ACCESS_TREE_ADD         = 1;
    ACCESS_TREE_INSERT      = 2;
    ACCESS_TREE_UPDATE      = 3;
    ACCESS_TREE_DELETE      = 4;

    WIDTH_E_TAG             = 21;
    WIDTH_E_EXCODE          = 74;
    WIDTH_E_NAME            = 284;
    WIDTH_E_NAMESIMPLE      = 102;
    WIDTH_E_ASSOCIATION     = 88;
    WIDTH_E_APPDATESTART    = 74;
    WIDTH_E_APPDATEEND      = 74;
    WIDTH_E_MINIMUM         = 717;

    WIDTH_T_TAG             = 21;
    WIDTH_T_EXCODE          = 74;
    WIDTH_T_NAME            = 284;
    WIDTH_T_NAMESIMPLE      = 102;
    WIDTH_T_ASSOCIATION     = 88;
    WIDTH_T_MINIMUM         = 569;

    CODE_ATTRIBUTE_EXCHANGE = 0;
    CODE_ATTRIBUTE_RESTORE  = 1;

	UNIT_GRID_E_RECORDS		= 50;
	UNIT_GRID_T_RECORDS		= 50;
	UNIT_ALLOC_RECORDS		= 64;

	DIVISION_GENERAL		= 11;
	DIVISION_NEWRECORD		= 99;

	MASTER_GENERAL01		= 31;						// 汎用補助①
	MASTER_GENERAL02		= 32;						// 汎用補助②
	MASTER_GENERAL03		= 33;						// 汎用補助③
	MASTER_GENERAL04		= 34;						// 汎用補助④
	MASTER_GENERAL05		= 35;						// 汎用補助⑤

    MASTER_STSEG            = 101;                      // 開始ｾｸﾞﾒﾝﾄ<003>
    MASTER_EDSEG            = 110;                      // 終了ｾｸﾞﾒﾝﾄ<003>
    MASTER_STHHJ1BN         = 541;                      // 開始汎用補助1分類<003>
    MASTER_EDHHJ1BN         = 550;                      // 終了汎用補助1分類<003>
    MASTER_STHHJ2BN         = 551;                      // 開始汎用補助2分類<003>
    MASTER_EDHHJ2BN         = 560;                      // 終了汎用補助2分類<003>
    MASTER_STHHJ3BN         = 561;                      // 開始汎用補助3分類<003>
    MASTER_EDHHJ3BN         = 570;                      // 終了汎用補助3分類<003>
    MASTER_STHHJ4BN         = 571;                      // 開始汎用補助4分類<003>
    MASTER_EDHHJ4BN         = 580;                      // 終了汎用補助4分類<003>
    MASTER_STHHJ5BN         = 581;                      // 開始汎用補助5分類<003>
    MASTER_EDHHJ5BN         = 590;                      // 終了汎用補助5分類<003>


	LENGTH_NAME_BANK		= 40;						// 銀行		(全角20文字)
	LENGTH_NAME_CUSTOMER	= 60;						// 取引先	(全角30文字)
	LENGTH_NAME_STAFF		= 20;						// 社員		(全角10文字)
	LENGTH_NAME_GENERAL		= 60;						// 汎用補助 (全角30文字)

	CONFIRM_EDITCODE		= 0;						// ｺｰﾄﾞ欄編集
	CONFIRM_CANCEL			= 1;						// 取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			= 2;						// 終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			= 0;
	CONFIRM_RETFOCUSED		= 1;						// 元の位置にﾌｫｰｶｽを戻す
	CONFIRM_EXITWRITE		= 2;						// ﾃﾞｰﾀを保存して処理を終了

	CHECKLIST				=	990100;					//	帳票ｸﾞﾙｰﾌﾟNo(ﾁｪｯｸﾘｽﾄ系)		HIS0003
	//	参照フラグ時に使用
	NORMAL					=	1;						//	通常処理
	BASICONLY				=	2;						//	基本のみ設定可能(詳細ボタン使用不可)
	REFER					=	3;						//	参照

	TABLE_HOJYOMA			= 111;						// 補助基本ﾏｽﾀ
	TABLE_CSINFO			= 113;						// 取引先詳細情報
	TABLE_HOJYOTREE			= 199;						// 補助加算体系ﾏｽﾀ
	TABLE_HOJYOTREE2		= 299;						// 補助加算体系ﾏｽﾀ2

	REQUISITE_OK			= 0;
	REQUISITE_CANCEL		= 1;
	REQUISITE_EXIT			= 9;

    // ↓↓↓<041>
    STATE_NONE              = 0;
    STATE_INSERT            = 1;
    STATE_EDIT              = 2;
    // ↑↑↑<041>

    OPE_SEC                 = 1;                        // <051>使用区分(ｾｷｭﾘﾃｨ)
    OPE_GROUP               = 2;                        // <051>使用区分(ｸﾞﾙｰﾌﾟ管理)
    DISP_ON                 = 1;                        // <051>表示区分(表示)
    DISP_OFF                = 2;                        // <051>表示区分(非表示)

	// -----<057> Add-St-----
	GRP_SYNC_CHILD			= 1;						// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	C_ST_PROCESS			= 0;						// 設定
	C_ED_PROCESS			= 1;						// 開放
	// -----<057> Add-Ed-----

{$R *.DFM}
{$include JNTMASFUSENBIKODLGIFB.inc}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTMASExceptIFB.inc}
{$include JNTMASSEARCHDLGIFB.inc}
{$include JNTConst.inc}
{$include JNTCRPSyncMasterB.inc}    // <041> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}     // <050> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部


//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function	AppEntry (pPar :Pointer): Integer;
var
	pForm   :   ^TJNTCRP016000f;
	pRecord :   ^TMjsAppRecord;
begin

	Result	:= ACTID_RET_OK;
	pRecord	:= Pointer (TAppParam (pPar^).pRecord);

	case (TAppParam (pPar^).iAction) of

		ACTID_FORMCREATESTART:													// Form Create要求
			begin
				New (pForm);

				try																// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
					pForm^	:= TJNTCRP016000f.fnCreateForm (pRecord);
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;


		ACTID_FORMCREATESHOWSTART:												// Form Create&Show要求
			begin
				New (pForm);

				try																// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
					pForm^	:= TJNTCRP016000f.fnCreateForm (pRecord);
					pForm^.Show ();
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

		ACTID_FORMCLOSESTART:													// Form Close要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Close ();
				pForm^.Free  ();
				Dispose (pForm);
			end;

		ACTID_FORMCANCLOSESTART:												// Form CanClose要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.CloseQuery () = FALSE) then
					Result	:= ACTID_RET_NG;
			end;

		ACTID_SHOWSTART:														// Show要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Show ();
			end;

		ACTID_HIDESTART:														// Hide要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.Parent <> nil) then
	            	pForm^.Hide ();
	        end;
	end;
end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor	TJNTCRP016000f.fnCreateForm (pRec: Pointer);
var
	sMessage	:	String;
    DmqData		:	TMQuery;
//<061>		nParameter	:   Integer;
	strParameter:   String;
begin

	//	初期処理
	m_DeleteCheck	:=	TRUE;
	m_Close			:=  TRUE;
    m_NewRecord		:=  FALSE;
	m_fAccessTab    :=  FALSE;
    m_cDBSelect     :=  nil;

    // -----------------------------------
    //  財務ポインタの取得
    // -----------------------------------
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
    m_cJNTArea.setMasAppRecord;
    m_pRec          :=  pRec;

	if	( m_pRec^.m_sParameter = '' ) then
        // 処理区分: 0=通常処理
		m_nProcDivision	:=  0
	else
	begin
		strParameter	:=  Copy (m_pRec^.m_sParameter, 0, 2);
//<061>		nParameter		:=  StrToInt64(Trim (strParameter));
        m_nProcDivision :=  0;
	end;

    AOwner          := TForm(m_pRec^.m_pOwnerForm^);               // <009>
    m_cDataModule   := TMDataModulef (m_pRec^.m_pDBModule^  );
    m_cComArea      := TJNTMASCom    (m_pRec^.m_pSystemArea^);
    m_TantoNCode    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;

    // 子会社DBのOpen
    m_cDBSelect     :=  m_cDataModule.COPDBOpen (1, m_pRec.m_iCorpID);

	if	( m_cDBSelect = nil ) then
	begin
        m_cComArea.m_MsgStd.GetMsg(m_MjsMsgRec,10000,m_cDataModule.GetStatus);
		MjsMessageBoxEx(AOwner,             // <009>
                        m_MjsMsgRec.sMsg,
						m_MjsMsgRec.sTitle,
						m_MjsMsgRec.icontype,
						m_MjsMsgRec.btntype,
						m_MjsMsgRec.btndef,
						m_MjsMsgRec.LogType);

        ShowMessage ('エラー');
        raise   EMathError.Create ('エラー');
    end;


    // MQueryの構築
	DmqData := TMQuery.Create( Self );

    try

// <024>↓一部復帰
//{
        // 履歴用ｽﾄｱﾄﾞの初期処理
        // 子会社DBとMQueryの接続
    	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

        // ﾏｽﾀ履歴用のｽﾄｱﾄﾞ(開始)を実行(子会社用)
    	DmqData.Close;
    	DmqData.SQL.Clear;
//	    DmqData.SQL.Add(fnMakeSQL(bFlag, TRUE));    // <024>削除
// <041>DmqData.SQL.Add(fnMakeSQL(TRUE, TRUE));     // <024>追加
        DmqData.SQL.Add(fnMakeSQL(1));              // <024>追加 <041>

        // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ<024>追加
    	DmqData.ParamByName('TANCD').AsFloat := m_TantoNCode;

        // ｽﾄｱﾄﾞの実行
    	if ( DmqData.ExecSQL = FALSE ) then
    	begin
    		sMessage := IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
    		// <041>showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
            showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ﾏｽﾀ履歴ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりました。');   // <041>
            raise Exception.Create( '' );   // <041>
    	end;
// <024>↑

        // ↓↓↓<041>
        // SyncMasterｸﾗｽの生成
        try
            m_SyncMaster := TSyncMaster.Create (Self, m_pRec, m_cJNTArea, m_cDBSelect);
            m_SyncMaster.InitData();
            m_SyncMaster.m_AOwner := TForm(m_pRec^.m_pOwnerForm^);
        except
            raise;
        end;
        // ↑↑↑<041>
    finally
        DmqData.Close();
	    DmqData.Free();
    end;

// ↓↓↓<PRN>

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then
            Abort;
    except
		MjsMessageBox(AOwner, 'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if uvSelSys.CreateSysInfo(m_cDBSelect) <> 0 then
            Abort;
    except
        uvSelSys.MsgDlg(1001,20);
        raise;
    end;

// ↑↑↑<PRN>
//	fnCMNPostInit (m_pRec);

    inherited   Create( AOwner );               // <009>

// <009>	inherited   Create ( TForm(m_pRec^.m_pOwnerForm^) );

end;

//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ <BPL>
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.CMChildkey (var Msg: TWMKey);
var
	cShiftState :   TShiftState;
	strNameWork :   String;
//<061>	    i           :   Integer;
begin

    // Shiftｷｰの取得
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);  //<Shift> ADD


// -----------------------------------------
//  指示コンボボックス
// -----------------------------------------
	if ( Screen.ActiveControl.Name = CmnInstructionCombo.Name ) then
	begin
        // ESC / ENDｷｰの補足
		if	(( Msg.CharCode = VK_ESCAPE )  or
             ( Msg.CharCode = VK_END    )) then
		begin
			Close();
			Abort;
		end;

        // RETURN / TAB / RIGHT ｷｰの補足
		if	((  Msg.CharCode = VK_RETURN )  or
             (( Msg.CharCode = VK_TAB    )  and ( cShiftState = [] )) or
  			  ( Msg.CharCode = VK_RIGHT  )) then
		begin
            m_DoDspKeyDown  :=  TRUE;

			if	( fnChangeSelectionScreen() ) then
			begin
            	if ( CmnTreeView.Items.Count > 0 ) then
					CmnTreeView.SetFocus();
                m_DoDspKeyDown  :=  FALSE
    		end;

			Abort;
		end;

        // LEFT / Shift+TAB ｷｰの補足
		if	((( Msg.CharCode = VK_TAB  )  and ( cShiftState = [ssShift] )) or
              ( Msg.CharCode = VK_LEFT )) then
			Abort;

		Exit;
	end;

{
    // F3ｷｰの補足 検索機能
	if ( Msg.CharCode = VK_F3 ) and ( cShiftState=[] ) then
	begin
        if ( m_SearchInfo.sHojCD = '' ) then
            B_SearchClick(Self)
        else
            fnSearch();
    end;
} // <039>

// ↓↓↓<039>
	// F3ｷｰの補足 検索機能
	if ( Msg.CharCode = VK_F3 ) and ( cShiftState=[] ) then
	begin
        // 汎用補助ｺｰﾄﾞ
        if ( Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name ) or
           ( Screen.ActiveControl.Name = DtlCmnEditExCodeFree.Name    ) then
        begin
            if ( m_SearchInfo.sHojCD = '' ) then
                B_SearchClick(Self)
            else
                fnSearch();
        end
        // ｾｸﾞﾒﾝﾄ1～10,汎用補助分類1～10
        else if ( MJSHanPos('Jituzai_ETEdit_BunCd',Screen.ActiveControl.Name) <> 0 ) or
                ( MJSHanPos('Jituzai_ETEdit_SegCd',Screen.ActiveControl.Name) <> 0 ) then
        begin
            ArrowClick(Screen.ActiveControl);
        end;
    end;
// ↑↑↑<039>

// -----------------------------------------
//  ツリー
// -----------------------------------------
	if	( CmnTreeView.Focused ) then
	begin
        // RETUEN / TAB ｷｰの補足
		if	( Msg.CharCode = VK_RETURN ) or
        //<034>
        //    (( Msg.CharCode = VK_TAB    )) then
        (( Msg.CharCode = VK_TAB    )and ( cShiftState = [] )) then
        //<034>

		begin
            // 詳細画面
			if ( DtlCmnClientPanel.Visible ) then
			begin
                // 属性対応
				if ( m_nCurrentCodeAttr <= 1 ) then
                    // 数値属性
					m_cACControl	:= DtlCmnEditExCodeNumeric
				else
                    // ﾌﾘｰ属性
					m_cACControl	:= DtlCmnEditExCodeFree;

				m_cACControl.SetFocus();
				Abort;
			end
			else if	( StdCmnClientPanelExist.Visible ) then
			begin
				m_cACControl	:= StdCmnGridExist;
				m_cACControl.SetFocus ();
				Abort;
			end
            // 一覧画面
			else if	(StdCmnClientPanelTotal.Visible) then
			begin
				m_cACControl	:= StdCmnGridTotal;
				m_cACControl.SetFocus();
				Abort;
			end;
		end

        //<034>
        else if  (( Msg.CharCode = VK_TAB) and ( cShiftState = [ssShift] )) then
        begin
            CmnInstructionCombo.SetFocus();
			Abort;
        end;
        //<034>
	end;

// -----------------------------------------
//  実在用グリッド
// -----------------------------------------
	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
	begin
        // Ctrl+HOMEｷｰの補足
		if (( Msg.CharCode = VK_HOME ) and ( cShiftState <> [ssCtrl] )) then
		begin
			if ( StdCmnGridExist.EditingText = '' ) then
			begin
				StdCmnGridExist.FocusedColumn	:= 1;
				Abort;
			end;
		end;

        // Ctrl+ENDｷｰの補足
		if (( Msg.CharCode = VK_END ) and ( cShiftState <> [ssCtrl] )) then
		begin
	 		if ( StdCmnGridExist.EditingText = '' ) then
			begin
				if ( StdCmnGridExist.FocusedColumn = 1 ) then
				begin
					CmnInstructionCombo.SetFocus();
					Abort
				end
				else
				begin
                    StdCmnGridExist.FocusedColumn	:= 4;
					Abort;
				end;
			end;
		end;

        // ESCｷｰの補足
		if (( Msg.CharCode = VK_ESCAPE ) and ( cShiftState = [] )) then
		begin
			if (( StdCmnDataSourceExist.DataSet.State in [dsEdit, dsInsert] ) or
                ( StdCmnGridExist.EditingText <> '' )) then
				Exit;

			CmnInstructionCombo.SetFocus();
			Abort;
		end;

        // Shift+TABｷｰの補足
		if (( Msg.CharCode = VK_TAB ) and ( cShiftState = [ssShift] )) then
		begin
			if ( StdCmnGridExist.FocusedColumn = 1 ) then
			begin
				m_cACControl	:= StdCmnTab;
				m_cACControl.SetFocus();
				Abort;
			end;
		end;

        // 簡略名称でF8ｷｰ⇒正式名称のｺﾋﾟｰ
		if (( StdCmnGridExist.FocusedColumn = 4 ) and
           (( Msg.CharCode = VK_F8 ) and ( cShiftState = [] ))) then
		begin
            // 正式名称
			strNameWork	:= StdCmnMemDataExist.FieldByName ('strName').AsString;

			if ( strNameWork <> '' ) then
			begin
				StdCmnMemDataExist.Edit();
				StdCmnMemDataExist.FieldByName ('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
				StdCmnMemDataExist.Post();
			end;

			Abort;
		end;
        
        Exit;
	end;

// -----------------------------------------
//  合計用グリッド
// -----------------------------------------
	if ( Screen.ActiveControl.Name = StdCmnGridTotal.Name ) then
	begin
        // Ctrl+HOMEｷｰの補足
		if (( Msg.CharCode = VK_HOME ) and ( cShiftState <> [ssCtrl] )) then
		begin
			if ( StdCmnGridTotal.EditingText = '' ) then
			begin
				StdCmnGridTotal.FocusedColumn	:= 1;
				Abort;
			end;
		end;

        // Ctrl+ENDｷｰの補足
		if (( Msg.CharCode = VK_END ) and ( cShiftState <> [ssCtrl] )) then
		begin
	 		if ( StdCmnGridTotal.EditingText = '' ) then
			begin
				if ( StdCmnGridTotal.FocusedColumn = 1 ) then
				begin
					CmnInstructionCombo.SetFocus();
					Abort;
				end
				else
				begin
					StdCmnGridTotal.FocusedColumn	:= 4;
					Abort;
				end;
			end;
		end;

        // ESCｷｰの補足
		if	(( Msg.CharCode = VK_ESCAPE ) and ( cShiftState = [] )) then
		begin
			if (( StdCmnDataSourceTotal.DataSet.State in [dsEdit, dsInsert] ) or
                ( StdCmnGridTotal.EditingText <> '' )) then
				Exit;

			CmnInstructionCombo.SetFocus();
			Abort;
		end;

        // Shift+TABｷｰの補足
		if	(( Msg.CharCode = VK_TAB ) and ( cShiftState = [ssShift] )) then
		begin
			if	(StdCmnGridTotal.FocusedColumn = 1) then
			begin
				m_cACControl	:= StdCmnTab;
				m_cACControl.SetFocus ();
				Abort;
			end;
		end;
       
        // 簡略名称でF8ｷｰ⇒正式名称のｺﾋﾟｰ
		if	(( StdCmnGridTotal.FocusedColumn = 4 ) and
            (( Msg.CharCode = VK_F8 ) and ( cShiftState = [] ))) then
		begin
            // 正式名称
			strNameWork	:= StdCmnMemDataTotal.FieldByName ('strName').AsString;

			if	( strNameWork <> '' ) then
			begin
				StdCmnMemDataTotal.Edit ();
				StdCmnMemDataTotal.FieldByName ('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
				StdCmnMemDataTotal.Post ();
			end;

			Abort;
		end;

		Exit;
	end;

// -----------------------------------------
//  一覧／詳細タブ
// -----------------------------------------
	if (( StdCmnTab.Focused ) or ( DtlCmnTab.Focused )) then
	begin
        // Shift+TABｷｰの補足
		if	(( Msg.CharCode = VK_TAB ) and ( cShiftState = [ssShift] )) then
		begin
			m_cACControl	:= CmnInstructionCombo;
			m_cACControl.SetFocus();
			Abort;
		end
        // 一覧 and RETUEN / TABｷｰの補足
		else if (StdCmnTab.Focused and (( Msg.CharCode = VK_TAB    )   or
                                        ( Msg.CharCode = VK_RETURN ))) then
		begin
            // 実在Grid
			if ( StdCmnTab.Items [0].Selected ) then
				m_cACControl	:= StdCmnGridExist
            // 合計Grid
			else
				m_cACControl	:= StdCmnGridTotal;

			m_cACControl.SetFocus();
			Abort;
		end
        // 詳細 and RETURN / TABｷｰの補足
		else if	( DtlCmnTab.Focused and (( Msg.CharCode = VK_TAB    )   or
                                         ( Msg.CharCode = VK_RETURN ))) then
        begin
			if ( m_nCurrentCodeAttr <= 1 ) then
                // 数値属性
				DtlCmnEditExCodeNumeric.SetFocus()
			else
                // ﾌﾘｰ属性
				DtlCmnEditExCodeFree.SetFocus();

			Abort;
		end;
	end;


// -----------------------------------------
//  詳細画面 汎用補助コード
// -----------------------------------------
	if ( DtlCmnEditExCodeNumeric.Focused   or
		 DtlCmnEditExCodeFree   .Focused ) then
	begin
        // Shift+TABｷｰの補足
		if (( Msg.CharCode = VK_TAB ) and ( cShiftState = [ssShift] )) then
		begin
			m_cACControl    :=  DtlCmnTab;
			m_cACControl.SetFocus();
			Abort;
		end;
	end;

// -----------------------------------------
//  詳細画面
// -----------------------------------------
	if ( DtlCmnEditAssociation.Focused ) then
	begin
        // Shift+TABｷｰの補足
		if	(( Msg.CharCode = VK_TAB ) and ( cShiftState = [ssShift] )) then
		begin
            // 属性対応
			if	( m_nCurrentCodeAttr <= 1 ) then
           		DtlCmnEditExCodeNumeric.SetFocus
			else
             	DtlCmnEditExCodeFree.SetFocus;

			Abort;
		end;
	end;
{
    if ( Pnl_SegBunInfo.Visible ) then
    begin
        for i := 1 to 10 do
        begin
            if ( TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).Visible ) then
            begin
                MjsDispCtrl.MjsSetFocus(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i));
                Abort;
                Exit;
            end;
        end;
        for i := 1 to 10 do
        begin
            if ( TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).Visible ) then
            begin
                MjsDispCtrl.MjsSetFocus(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i));
                Abort;
                Exit;
            end;
        end;

        MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnButtonUpdate');
        Abort;
        Exit;
    end;
}
//<035>
{
// -----------------------------------------
//  詳細画面 更新ボタン
// -----------------------------------------
	if ( DtlCmnButtonUpdate.Focused ) then
	begin
        // LEFT / UPｷｰの補足
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl(Self);
			Abort;
		end
	end;
}
//<035>

// -----------------------------------------
//  詳細画面 簡略名称
// -----------------------------------------
	if ( Screen.ActiveControl.Name = DtlCmnEditNameSimple.Name ) then
	begin
        // F8ｷｰの補足
		if (( Msg.CharCode = VK_F8 ) and ( cShiftState = [] )) then
		begin
            // 正式名称
			strNameWork :=  DtlCmnEditName.Text;

			if ( strNameWork <> '' ) then
				DtlCmnEditNameSimple.Text	:= MJSKabuCut (strNameWork, 14);

			Abort;
		end;
	end;

// -----------------------------------------
//  ﾌｧﾝｸｼｮﾝｷｰの補足（ﾌﾘｰ項目）<002>
// -----------------------------------------
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


    // <KEY> St-----------------------------------------------------------------
    if DtlCmnClientPanel.Visible then
    begin
        if (Screen.ActiveControl is  TMBitBtn) = False then
        begin
            // [Return] [Tab] [↓] [→]

            if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
            begin
            	// <023> -->
            	if (Msg.CharCode = VK_RIGHT) And (Screen.ActiveControl is  TMTxtEdit) then
                begin
					if	(not MJSChkCurEnd (Screen.ActiveControl)) then
                    	exit;
                end;
            	// <023> <--

                //<033>
                if ((Msg.CharCode = VK_RETURN) and (Screen.ActiveControl = DtlCmnEditExCodeNumeric)) or
                   ((Msg.CharCode = VK_RETURN) and (Screen.ActiveControl = DtlCmnEditExCodeFree)) then
                begin
                    MjsDispCtrl.MjsNextCtrl (Self);
                    Exit;
                end;

                // <045> - ST
                if (Screen.ActiveControl = DtlCmnEditName) then
                begin
                    // OnKeyDownだとTabｷｰを拾えないので、VK_RETURNに置き換える
                    if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
                        Msg.CharCode := VK_RETURN;

                    // Abortを行っている為、OnKeyDownが呼ばれない
                    fnDtlCmnEditNameOnKeyDown ( Self, Msg.CharCode, cShiftState );
                    Abort;
                end;
                // <045> - ED

                MjsDispCtrl.MjsNextCtrl (Self);
                abort;
                //<033>
            end;

            // [Shift + Tab]  [←][↑]
    		if	 ((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
	    		 ((Msg.CharCode = VK_UP  ) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
            begin
            	// <023> -->
            	if (Msg.CharCode = VK_LEFT) And (Screen.ActiveControl is  TMTxtEdit) then
                begin
					if	(not MJSChkCurTop (Screen.ActiveControl)) then
                    	exit;
                end;
            	// <023> <--
                MJSDispCtrl.MjsPrevCtrl (Self);
                abort;
            end;
        end
        //<035>
        else
        begin
            if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) then
            begin

                if ( DtlCmnButtonUpdate.Focused ) then
                begin
                    MjsDispCtrl.MjsNextCtrl (Self);
                    abort;
                end;

            end;

            if	 ((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
	    		 ((Msg.CharCode = VK_UP  ) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
            begin
                MJSDispCtrl.MjsPrevCtrl (Self);
                abort;
            end;
        end;
        //<035>
    end;
    // <KEY> Ed-----------------------------------------------------------------

	inherited;

end;

//-----------------------------------------------------------------------------
//  CMShowingChanged()  <008>
//  < 画面表示後処理 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.CMShowingChanged(var Msg : TMessage);
begin

    {通常のCMShowingChangedを継承}
    inherited;

    if ( m_DspFlg = FALSE ) then
    begin

{<012> Del
        // 決算確定
        if ( m_cJNTArea.IsKessan(FALSE) = 1 ) then
        begin
            // 参照ﾓｰﾄﾞ
            fnPartsControl(REFER);
        end
        else
        begin
            // 通常ﾓｰﾄﾞ
            fnPartsControl(giReferFlag);
        end;
}

        m_DspFlg := TRUE;

{
        // OnPaintより移植<008>
        if ( m_fComboBoxListDraw ) then
    	begin
    		m_fComboBoxListDraw	:= FALSE;

    		if ( CmnInstructionCombo.Items.Count = 1 ) then
    		begin

	    		if (fnChangeSelectionScreen() ) then
    			begin
    				m_cACControl	:= CmnTreeView;
    				m_cACControl.SetFocus();
    			end;
    		end
    		else
    			CmnInstructionCombo.DroppedDown :=  TRUE;
    	end;
}
    end;

end;

//-----------------------------------------------------------------------------
// fnOnCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnOnCreate (Sender: TObject);
var
    dqMasterInfo    :   TMQuery;
//<061>		nCompDivision   :   Integer;
    nItemPosition   :   Integer;
    nCount          :   Integer;

    iRet            :   Integer;        // <PRN>
    i               :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
begin
	// -----<057> Add-St-----
	SPMsHist.Connection	:= m_cDBSelect;
	//SPMsHist.SessionName	:= m_cDBSelect.SessionName;

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<057> Add-Ed-----

	Parent          := TPanel (m_pRec^.m_pOwnerPanel^);
	Align           := alClient;

    fnGetGrants();                      // <012>Add
    fnPartsControl(giReferFlag);        // <012>Add

    // <PRN>ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

    // MQueryの構築
	dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo    );
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdCmnQueryExist);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdCmnQueryTotal);

	with dqMasterInfo do
	begin
		Close();
		SQL.Clear;
        SQL.Add('SELECT YearKbn,DTName7 FROM DTMAIN');
		Open();

        // 和暦/西暦区分
		m_nDateFormatDivision	:= FieldByName ('YearKbn').AsInteger;
        // 使用可能ｺｰﾄﾞ
		m_strValidCharacters	:= FieldbyName ('DTName7').AsString;

        Close();
        SQL.Clear();
        SQL.Add('SELECT ComKbn3, ComKbn4, DataKbn FROM DTMAIN_MAS');
        Open();

        // ﾒｰﾙ会計処理区分
		m_nMailAdoption			:= FieldByName ('ComKbn3').AsInteger;
        // 公益法人区分
//<061>		nCompDivision			:= FieldByName ('ComKbn4').AsInteger;
        // ﾃﾞｰﾀ区分
		m_DataKbn				:= FieldByName ('DataKbn').AsInteger;

		Close();
	end;

    // 和暦/西暦区分: 0=和暦
	if	( m_nDateFormatDivision = 0 ) then
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfEMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfEMD;
//		DtlCmnEditAppDateStart.Gengou		:=	'H';								// <#NGEN>
		DtlCmnEditAppDateStart.Gengou		:=	MasDateCtrl.MasGetNowGengo();		// <#NGEN>
//		DtlCmnEditAppDateEnd  .Gengou		:=	'H';								// <#NGEN>
		DtlCmnEditAppDateEnd  .Gengou		:=	MasDateCtrl.MasGetNowGengo();;		// <#NGEN>
	end
    // 和暦/西暦区分: 1=西暦
	else
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfYMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfYMD;
		DtlCmnEditAppDateStart.Gengou		:=	#0;
		DtlCmnEditAppDateEnd  .Gengou		:=	#0;
	end;

{
	if	(m_nMailAdoption = 1) then
	begin
		CmnToolbarButtonDelete    .Visible	:= FALSE;
		CmnTreeViewPopupMenuDelete.Visible	:= FALSE;
	end;
}

	for nCount := 1 to 5 do
    begin
        m_stSelectItem[nCount].nMasterDivision  :=  0;
        m_stSelectItem[nCount].strItemCaption   :=  '';
    end;

	m_nSaveTreeRecMax	:= 0;
	m_nSaveTreeRecCount	:= 0;

	for	nCount := 0 to 14 do
	begin
		m_bHojyoTreeDelete[nCount]  :=  0;
		m_bHojyoTree2     [nCount]	:=  0;
	end;

    nItemPosition   := 1;
    m_HojyoUseFlg   := false;

	StdCmnMemDataCustomer.Open;
	StdCmnMemDataSupplier.Open;

    StdCmnMemDataCustomer.Append;
	StdCmnMemDataSupplier.Append;
	StdCmnMemDataCustomer.FieldByName ('nDivision'     ).AsInteger	:= 0;
	StdCmnMemDataSupplier.FieldByName ('nDivision'     ).AsInteger	:= 0;
	StdCmnMemDataCustomer.FieldByName ('strDescription').AsString	:= 'なし';
	StdCmnMemDataSupplier.FieldByName ('strDescription').AsString	:= 'なし';
	StdCmnMemDataCustomer.Post;
	StdCmnMemDataSupplier.Post;

    StdCmnMemDataCustomer.Append;
	StdCmnMemDataSupplier.Append;
	StdCmnMemDataCustomer.FieldByName ('nDivision'     ).AsInteger	:= 1;
	StdCmnMemDataSupplier.FieldByName ('nDivision'     ).AsInteger	:= 1;
	StdCmnMemDataCustomer.FieldByName ('strDescription').AsString	:= '採用';
	StdCmnMemDataSupplier.FieldByName ('strDescription').AsString	:= '採用';
	StdCmnMemDataCustomer.Post;
	StdCmnMemDataSupplier.Post;

    // 指示ｺﾝﾎﾞﾎﾞｯｸｽの作成
	with dqMasterInfo do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');

		if ( m_nProcDivision = 0 ) then
			SQL.Add ('WHERE MasterKbn >= 31 AND MasterKbn <= 35 AND UseKbn <> 0 ORDER BY MasterKbn')
		else
		begin
			SQL.Add ('WHERE MasterKbn = :nMasterDivision AND UseKbn <> 0 ORDER BY MasterKbn');

			ParamByName ('nMasterDivision').AsInteger	:= m_nProcDivision;
		end;

		Open();

		while (not EOF) do
		begin
			m_stSelectItem [nItemPosition].nMasterDivision  := GetFld ('MasterKbn' ).AsInteger;		// ﾏｽﾀ区分
			m_stSelectItem [nItemPosition].strItemCaption   := GetFld ('JHojyoName').AsString;		// 補助名称(実在)
			m_stSelectItem [nItemPosition].nCodeDigit       := GetFld ('CodeDigit' ).AsInteger;		// ｺｰﾄﾞ桁数
			m_stSelectItem [nItemPosition].nCodeAttribute   := GetFld ('CodeAttr'  ).AsInteger;		// ｺｰﾄﾞ属性
			m_stSelectItem [nItemPosition].nAdoptDivision	:= GetFld ('UseKbn'    ).AsInteger;		// 採用区分 (0:なし, 1:あり)

			if	(m_stSelectItem [nItemPosition].strItemCaption = '') then							// 省略時はﾏｽﾀ区分名称と同一
			begin
				case (m_stSelectItem [nItemPosition].nMasterDivision) of
					MASTER_GENERAL01: m_stSelectItem [nItemPosition].strItemCaption   := '汎用補助1';
					MASTER_GENERAL02: m_stSelectItem [nItemPosition].strItemCaption   := '汎用補助2';
					MASTER_GENERAL03: m_stSelectItem [nItemPosition].strItemCaption   := '汎用補助3';
					MASTER_GENERAL04: m_stSelectItem [nItemPosition].strItemCaption   := '汎用補助4';
					MASTER_GENERAL05: m_stSelectItem [nItemPosition].strItemCaption   := '汎用補助5';
				end;
			end;

			CmnInstructionCombo.Items.Add (m_stSelectItem [nItemPosition].strItemCaption);

			nItemPosition	:= nItemPosition + 1;
            m_HojyoUseFlg   := true;
			Next;
		end;

		Close();
    end;

    // 採用なしの場合
	if ( nItemPosition = 1 ) then
	begin
        PostMessage(Self.Handle, WM_ONPAINT, 0, 0);
	end;

    m_nCurrentMasterDiv             :=  0;
    m_nCurrentCodeDigit             :=  10;
    m_nCurrentCodeAttr              :=  0;
	m_nSelectTagKind	            :=  0;
	m_nDBErrorCode		            :=  0;
    m_strExCodeCurrent              :=  '          ';
    m_strExNCodeCurrent             :=  0;
	m_cNodePrevSelect	            :=  nil;
    m_fUpdateRecord                 :=  FALSE;
	m_fDtlNewRecord		            :=  FALSE;
	m_fIgnoreProc		            :=  FALSE;
    m_DoDspKeyDown                  :=  FALSE;
	m_fComboBoxListDraw	            :=  TRUE;
//	m_fDeleteCSInfo		            :=  FALSE;
	m_fChangeDetails	            :=  FALSE;
    m_stWorkRecPaste.nDivision	    :=  9;
    m_stWorkRecPaste.strExCode	    :=  '';
    m_stWorkRecPaste.strExNCode     :=  0;
    m_stWorkRecPaste.strName	    :=  '';
   	m_SearchInfo.sHojCD             :=  '';
	CmnInstructionCombo.ItemIndex   :=  0;
    CmnTreeView           .Enabled	:=  FALSE;
    CmnSplitter           .Enabled	:=  FALSE;
//<011>	CmnToolbarButtonPrint .Enabled	:=  FALSE;

//<027>
    CmnToolbarButtonPrint .Enabled	:=  FALSE;
    B_Search.Enabled                :=  FALSE;
//<027>

	CmnToolbarButtonDetail.Enabled	:=  FALSE;
	CmnToolbarButtonDelete.Enabled	:=  FALSE;
//<001>	CmnToolbarButtonTag   .Enabled	:=  FALSE;

//<029>
    CmnToolbarButtonTag   .Enabled	:=  m_cJNTArea.IsFusen(); 
//<029>

    CmnToolbarButtonTag.ImageIndex	:=  4;          // <001>
    ToolBarFusen              .Enabled	:=  FALSE;  // <001>
    Pnl_SegBunInfo        .Visible  :=  TRUE;       // <003>
    m_FusenColorIdx                 :=  -1;         // <001>
    StdCmnClientPanel     .Enabled	:=  FALSE;
    DtlCmnClientPanel     .Enabled	:=  FALSE;
    BSpeedButtonSort      .Enabled	:=  FALSE;
    DtlCmnClientPanel.Visible       :=  FALSE;
	StdCmnGridExist.FocusedColumn   :=  1;
	StdCmnGridTotal.FocusedColumn   :=  1;
    m_cACControl	                :=  CmnInstructionCombo;
    m_fAccessTab	                :=  TRUE;
    m_DspFlg                        :=  FALSE;      // <008>
    m_RowState                      :=  STATE_NONE; // <041>

	MJSColorChange (TJNTCRP016000f (Self),
                    m_cComArea.SystemArea.SysColorB,
                    m_cComArea.SystemArea.SysColorD,
                    m_cComArea.SystemArea.SysBaseColorB,
                    m_cComArea.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP016000f (Self), Pointer (m_pRec));

    dqMasterInfo.Close();
	dqMasterInfo.Free();

    // MQueryの構築<PRN>
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続<PRN>
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 <PRN>}
	try
//<058> DEL		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP016000L.BPL');
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP016000L.BPL');  //<058> ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(AOwner, 'JNTCRP016000LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
//<058> DEL    	UnloadPackage( lvHandle );
    	UnloadPackageHelper( lvHandle );  //<058> ADD
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

		iRet := PrintAppEntry(AOwner,m_pRec,m_nCurrentMasterDiv,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(AOwner,
                m_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
                'JNTCRP016000',
                uvHani,
                uvSelSys);

// ↑↑↑<PRN>

    // ﾌｧﾝｸｼｮﾝ設定<002>
//<017>    fnSetFncType(0);
    fnSetFncType(False,0);
    fnSetFncType(False,7);

    // ﾌﾘｰ項目設定ﾀﾞｲｱﾛｸﾞ初期化<002>
    fnJNTFreeDlgLoad( m_pRec );
    fnJNTFreeDlgInit( m_pRec, @m_cComArea, @m_cDBSelect );

//<012>	giReferFlag :=  NORMAL;

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化<007>
    m_ExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pRec) = 0 then
        m_ExpOpenSW := TRUE
    else
		MjsMessageBox(AOwner,               // <009>
                      'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					  + 'ｴｸｽﾌﾟﾛｰﾗは使用できません。'
                      , mjError, mjDefOk);


end;

//-----------------------------------------------------------------------------
// fnOnClose()
//	< ﾌｫｰﾑ終了処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action    :   TCloseActionｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.fnOnClose (Sender: TObject; var Action: TCloseAction);
var
    cDlgMasTree2	    :   TJNTMasTreee2Dlgf;
    arMasterDIvision    :   array of Integer;
    stItemRec		    :   ^TreeViewRec;
    dqWork			    :   TMQuery;
    nCount			    :   Integer;
    DmqData             :	TMQuery;    // <041>
	sMessage            :	String;     // <041>
	AppPrm              :   TAppParam;
    Dlg                 :   TJNTSyncMasterIF;       // <050>
    IDs                 :   Array[0..0] of integer; // <050>
begin

	m_Close := FALSE;


	// 加算体系2更新
    for nCount := 0 to 14 do
	begin
		if ( m_bHojyoTree2[nCount] = 1 ) then
		begin
			SetLength (arMasterDivision, Length (arMasterDivision) + 1);

			arMasterDivision [Length (arMasterDivision) - 1]	:= 21 + nCount;
		end;

//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOMA  , MASTER_BANK + nCount, 0, 0);
//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE, MASTER_BANK + nCount, 0, 0);

//		if ( m_bHojyoTreeDelete [nCount] = 1) then
//		    MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE, MASTER_BANK + nCount, 0, 1);
	end;

//	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_CSINFO, MASTER_CUSTOMER, 0, 0);

//	if ( m_fDeleteCSInfo) then
//      MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_CSINFO, MASTER_CUSTOMER, 0, 1);

	if ( Length (arMasterDivision) > 0 ) then
	begin
		cDlgMasTree2 := TJNTMasTreee2Dlgf.Create (Self);

		if ( cDlgMasTree2.ExecTree2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
             m_cDataModule, m_cComArea.m_iCopNo, arMasterDivision, dqWork) < 0 ) then
		begin
			if ( dqWork <> nil ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqWork);
				MjsMessageBoxEx (AOwner,            // <009>
                                 m_MjsMsgRec.sMsg,
                                 m_MjsMsgRec.sTitle,
                                 m_MjsMsgRec.icontype,
                                 m_MjsMsgRec.btntype,
                                 m_MjsMsgRec.btndef,
                                 FALSE
                                );
				dqWork.Free();
			end
			else
            begin
				MjsMessageBoxEx (AOwner,            // <009>
                                 m_MjsMsgRec.sMsg,
                                 m_MjsMsgRec.sTitle,
                                 m_MjsMsgRec.icontype,
                                 m_MjsMsgRec.btntype,
                                 m_MjsMsgRec.btndef,
                                 FALSE
                                );
            end;
       	end;

		cDlgMasTree2.Close();
		cDlgMasTree2.Free ();
	end;


	if ( m_NewRecord = TRUE ) then
	begin
		// ﾏｽﾀが新規登録されました。出力順序などの設定の見直しが必要と思われます。
		m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,30 );
		MjsMessageBoxEx(AOwner,         // <009>
                        m_MjsMsgRec.sMsg,
                        m_MjsMsgRec.sTitle,
                        m_MjsMsgRec.icontype,
                        m_MjsMsgRec.btntype,
                        m_MjsMsgRec.btndef,
                        m_MjsMsgRec.LogType
                       );
	end;

	m_fUnderConstruction := TRUE;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec	:= CmnTreeView.Items [nCount - 1].Data;
		Dispose (stItemRec);
	end;

	m_fUnderConstruction := TRUE;

    // DBとMQueryの接続(子会社用)
    DmqData := TMQuery.Create( Self );

    try
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

        // ﾏｽﾀ履歴用のｽﾄｱﾄﾞ(終了)を実行(子会社用)
        DmqData.Close;
        DmqData.SQL.Clear;
        DmqData.SQL.Add(fnMakeSQL(2));

        if (DmqData.ExecSQL = False) then
        begin
            sMessage :=	IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
            showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage);
        end;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

// <054> MOD start
(*
    // <050> - ST
    // ｸﾞﾙｰﾌﾟ会社ありの場合
    // <053>if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    if ( m_SyncMaster.m_flgGrpCorp in [0,1] ) then  // <053>
*)

// <055> MOD start
(*
	if (m_SyncMaster.m_flgGrpCorp in [0,1]) and     // ｸﾞﾙｰﾌﾟ会社あり
       (m_SyncMaster.m_CEComKbn5 = 0) and			// 翌期更新済みでない
	   (m_SyncMaster.m_PEComKbn5 = 0) then

// <054> MOD end


    begin
        IDs[0] := JNTSYNC_HojyoMA;
        Dlg := TJNTSyncMasterIF.Create (Self, m_pRec);

        try
            Dlg.ShowDlg(IDs);
    	finally
    		Dlg.Free;
    		Dlg:=nil;
    	end;
    end;
*)
	if (m_SyncMaster.m_flgGrpCorp in [0,1]) then
    begin
    	if ((m_cJNTArea.IsAppend) or        		// 追加権限あり
           (m_cJNTArea.IsModify) or         		// 修正権限あり
           (m_cJNTArea.IsDelete)) and       		// 削除権限あり
           (m_HojyoUseFlg) and						// 採用あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then		// 表示のみでなくて翌期更新済みでもない場合
        begin
          	IDs[0] := JNTSYNC_HojyoMA;
        	Dlg := TJNTSyncMasterIF.Create (Self, m_pRec);

        	try
            	Dlg.ShowDlg(IDs);
    		finally
    			Dlg.Free;
    			Dlg:=nil;
    		end;
        end;
    end;
// <055> MOD end

    // <050> - ED

    // ｸﾗｽの開放<041>
    m_SyncMaster.fnSyncTerm();

    // 共通ｼｽﾃﾑ開放
    m_cJNTArea.Free;

//	fnCMNPostFree();

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 子会社DBのClose
	if ( m_cDBSelect <> nil ) then
	    m_cDataModule.COPDBClose (m_cDBSelect);

    // ｸﾞﾙｰﾌﾟ会社ありの場合<041>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBのClose
        if ( m_SyncMaster.m_cPDBSelect <> nil ) then
        	m_cDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;

    // 販売ｼｽﾃﾑ情報の開放   // <PRN>
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

	m_pRec^.m_iDelete   :=  1;
	AppPrm.iAction		:=  ACTID_FORMCLOSEEND;         // 呼び出し区分設定
	AppPrm.pRecord		:=  Pointer (m_pRec);		    // 管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam	:=  nil;				  	    // 予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@AppPrm);
    Action              :=  caFree;

end;

//-----------------------------------------------------------------------------
// fnJNTCRP016000fOnCloseQuery()
//	< ﾌｫｰﾑ終了前処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose  :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnJNTCRP016000fOnCloseQuery (Sender: TObject; var CanClose: Boolean);
var
	nReturn : Integer;
begin

	m_Close := FALSE;

    // 共通ｼｽﾃﾑ開放
    //m_cJNTArea.Free;

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放<007>
    if m_ExpOpenSW = TRUE then
        fnJNTExpFree;

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
	end;

	nReturn := fnOutputConfirmationMessage (CONFIRM_EXIT);

	if	( nReturn = CONFIRM_RETFOCUSED ) then
	begin
		CanClose := FALSE;
		Exit;
	end
	else if	( nReturn = CONFIRM_EXITWRITE ) then
	// -----<057> Add-St-----
	begin
		SessionPractice(C_ST_PROCESS);

		try
	// -----<057> Add-Ed-----
        // 更新処理
		fnUpdateDetailsScreenRecord();
	// -----<057> Add-St-----
		finally
			SessionPractice(C_ED_PROCESS);
		end;
	end;
	// -----<057> Add-Ed-----

	m_fChangeDetails := FALSE;

end;

//-----------------------------------------------------------------------------
// fnOnShow()
//	< 表示処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnOnShow (Sender: TObject);
begin

	JNTMasSetCaption (m_pRec);
	MJSBtnVisible (TJNTCRP016000f (Self), TRUE);

    // ﾌｧﾝｸｼｮﾝｷｰの設定<002>
    MSPFunctionBar.CopyFuncData(m_FncInfo.Caption);

//<020>    CmnInstructionCombo.SetFocus();

{
	if (m_nMailAdoption = 1 ) then
	begin
		CmnToolbarButtonDelete    .Visible	:= FALSE;
		CmnTreeViewPopupMenuDelete.Visible	:= FALSE;
	end;
}

	if ( uvHani.mjspre.IsPreView = TRUE ) then
		uvHani.mjspre.Show()
	else
		m_cACControl.SetFocus();


end;

//-----------------------------------------------------------------------------
// fnJNTCRP016000fOnHide()
//	< ハイド処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnJNTCRP016000fOnHide (Sender: TObject);
begin

	MJSBtnVisible (TJNTCRP016000f (Self), FALSE);

	if ( uvHani.mjspre.IsPreView = TRUE  ) then
		uvHani.mjspre.Hide();

end;

//-----------------------------------------------------------------------------
// fnJNTCRP016000fOnActivate()
//	< アクティブ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnJNTCRP016000fOnActivate (Sender: TObject);
var
	cAppParam   :   TAppParam;
begin

	cAppParam.iAction		:= ACTID_ACTIVEEND;
	cAppParam.pRecord		:= Pointer (m_pRec);
	cAppParam.pActionParam	:= nil;
	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppParam);

end;

//-----------------------------------------------------------------------------
// fnJNTCRP016000fOnPaint()
//	< 描画処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnJNTCRP016000fOnPaint (Sender: TObject);
begin

    // <008>
    if ( m_DspFlg = FALSE ) then Exit;

    if ( m_HojyoUseFlg = false ) then Exit;

	if ( m_fComboBoxListDraw ) then
	begin
		m_fComboBoxListDraw	:= FALSE;

		if ( CmnInstructionCombo.Items.Count = 1 ) then
		begin

			if (fnChangeSelectionScreen() ) then
			begin
				m_cACControl	:= CmnTreeView;
				m_cACControl.SetFocus();
			end;
		end
		else
			CmnInstructionCombo.DroppedDown :=  TRUE;
	end;

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//  < 破棄処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.FormDestroy(Sender: TObject);
begin

    // ﾌﾘｰﾀﾞｲｱﾛｸﾞ開放<002>
    fnJNTFreeDlgFree();

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
    PrintAppEntry(nil,nil,m_nCurrentMasterDiv,3,PrtParam,ArrHdl);

    // ﾏｽﾀ同期ｸﾗｽの破棄<041>
    if ( m_SyncMaster <> nil ) then
		m_SyncMaster.Free();

end;

//-----------------------------------------------------------------------------
// fnCmnButtonToolbarExitOnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 終了ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnButtonToolbarExitOnClick (Sender: TObject);
begin

	m_Close :=  FALSE;
	Close();

end;

//-----------------------------------------------------------------------------
// fnCmnToolbarButtonPrintOnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 印刷ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnToolbarButtonPrintOnClick (Sender: TObject);
var
{
	dqPrintWork	 	 : TMQuery;
	cDlgCondition	 : TJNTCRP016001f;
	cDlgPrint		 : TMJSPrnDlgf;
	cMemDataWork	 : TdxMemData;
	nReturn			 : Integer;
	nCount			 : Integer;
	strCaption		 : String;
	strTmpFileName	 : String;
	strFormatDate	 : String;
	strFormatDateTime: String;
	sTitle			 : TStringList;
	sMemFld			 : TStringList;
}
	nCount			 : Integer;			// 	051025 hirota
	strCaption		 : String;			// 	051025 hirota

    lvRet       :   Integer;            // <PRN>
    JNTPDlg     :   TFrmJNTPDialog;     // <PRN>
begin

// ↓↓↓<PRN>

    // 販売ｼｽﾃﾑｴﾘｱに設定
    m_cJNTArea.setSelAppRecord;

	// 	051025 hirota >>
    uvHani.pvMasterKbn := m_nCurrentMasterDiv;				// マスタ区分を渡す
	for nCount := 1 to 8 do
	begin
		if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
		begin
			strCaption	:= m_stSelectItem [nCount].strItemCaption;
			Break;
		end;
	end;
    uvHani.pvHojyoName := strCaption;						// マスタ名称を渡す
   	// 	051025 hirota <<

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free();
//<Del10-VerUp001><D10_OwnMapRules> ST
	m_cDBSelect.FormatOptions.MapRules.Clear;
	m_cDBSelect.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	//Exit;																// 050823 hirota
        end;
     1:	//通常
     	begin
			// 050823 hirota >>
		    PrtParam.Para := uvHani;

			m_nOrderDivision	:= uvHani.pvrOrder;									// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
			// 加算リストのときはダメ
            if (uvHani.pvrPattern <> 2) then
            begin
				m_strExCodeScopeStr	:= uvHani.pvrStCode[0];								// 開始実在部門外部ｺｰﾄﾞ
				m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];								// 終了実在部門外部ｺｰﾄﾞ
            end;

			// 実在リスト
		   if (uvHani.pvrPattern = 0) then
			begin
				fnPrintCheckListExtStandard ();
				PrtParam.TargetMD := CmnMemDataPrintExtStandard;
		    end

			// 合計リスト
		    else if (uvHani.pvrPattern = 1) then
			begin
				fnPrintCheckListTtlStandard ();
				PrtParam.TargetMD := CmnMemDataPrintTtlStandard;
		    end

			// 加算リスト
		    else if (uvHani.pvrPattern = 2) then
			begin
				fnPrintCheckListSystem ();
				PrtParam.TargetMD := CmnMemDataPrintSystem;
		    end
			// 050823 hirota <<

			// 051104 hirota >>
			// セグメント/分類リスト
		    else if (uvHani.pvrPattern = 3) then
			begin
				if (m_arAdoptInfo_Seg [1].nAdoption = 0) AND (m_arAdoptInfo_HBr [1].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [2].nAdoption = 0) AND (m_arAdoptInfo_HBr [2].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [3].nAdoption = 0) AND (m_arAdoptInfo_HBr [3].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [4].nAdoption = 0) AND (m_arAdoptInfo_HBr [4].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [5].nAdoption = 0) AND (m_arAdoptInfo_HBr [5].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [6].nAdoption = 0) AND (m_arAdoptInfo_HBr [6].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [7].nAdoption = 0) AND (m_arAdoptInfo_HBr [7].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [8].nAdoption = 0) AND (m_arAdoptInfo_HBr [8].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [9].nAdoption = 0) AND (m_arAdoptInfo_HBr [9].nAdoption = 0)
				AND(m_arAdoptInfo_Seg [10].nAdoption = 0) AND (m_arAdoptInfo_HBr [10].nAdoption = 0) then
                begin
					// 一つも採用がない場合
				    MjsMessageBox(Self,'分類とセグメントが採用されていません。', mjError, mjDefOk);
				    // 財務ｼｽﾃﾑｴﾘｱに設定し直し
				    m_cJNTArea.setMasAppRecord;
                    // 終了
                    Exit;
                end;
				fnPrintCheckListSegBun ();
				PrtParam.TargetMD := CmnMemDataPrintSegBun;
		    end;
			// 051104 hirota <<

		    // ﾃﾞｰﾀの存在ﾁｪｯｸ
		    if ( PrtParam.TargetMD.RecordCount = 0 ) then
            	PrtParam.CorpSys.MsgDlg(2010,10)
		    else
    	        //印刷する
	            PrintAppEntry(nil,nil,m_nCurrentMasterDiv,1,PrtParam,ArrHdl);
        end;
    else //Exit;		//ｴﾗｰ													// 050823 hirota
    end;

    // 財務ｼｽﾃﾑｴﾘｱに設定し直し
    m_cJNTArea.setMasAppRecord;

// ↑↑↑<PRN>

{
	cMemDataWork    :=  nil;

	for nCount := 1 to 8 do
	begin
		if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
		begin
			strCaption	:= m_stSelectItem [nCount].strItemCaption;
			Break;
		end;
	end;

	cDlgCondition	:= TJNTCRP016001f.fnCreateDialog (Pointer (m_pRec), Self, m_cDataModule, m_cDBSelect,
											 m_nCurrentMasterDiv, m_nCurrentCodeDigit, m_nCurrentCodeAttr, strCaption);

	if ( cDlgCondition.ShowModal () = mrCancel ) then
        Exit;

    sTitle	:=	TStringList.Create;
	sMemFld	:=	TStringList.Create;

	m_nOrderDivision	:= cDlgCondition.m_nOrderDivision;											// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr	:= cDlgCondition.m_strExCodeScopeStr;										// 開始実在部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd	:= cDlgCondition.m_strExCodeScopeEnd;										// 終了実在部門外部ｺｰﾄﾞ

    m_TokuisakiCheck    := cDlgCondition.m_TokuisakiCheck;                                          // 取引先採用有無
    m_SiiresakiCheck    := cDlgCondition.m_SiiresakiCheck;                                          // 仕入先採用有無
    m_NoCheck           := cDlgCondition.m_NoCheck;                                                 // チェックなし

	dqPrintWork	:= TMQuery.Create (Self);													// MQueryの構築
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqPrintWork);										// DBとMQueryの接続

	cDlgPrint		:= TMJSPrnDlgf.Create (Self);
	m_cPrnSupport	:= TMjsPrnSupport.Create ();

	gfnJNTMasSetPrnInfo (m_cPrnSupport, dqPrintWork);

	case (cDlgCondition.m_nPrintDivision) of
		0:	begin																					// 実在xxxx登録ﾘｽﾄ
				m_cPrnSupport.strDocName	:= '実在' + strCaption + '登録リスト';

				case (m_nCurrentMasterDiv) of
					MASTER_GENERAL01..MASTER_GENERAL05:											// 汎用補助1～5
						begin
							m_cPrnSupport.ApRB			 := CmnReportExtStandardGen;
							m_cPrnSupport.pPage			 := CmnReportExtStandardGenSysVarPage;		// 頁
							m_cPrnSupport.pDate			 := CmnReportExtStandardGenSysVarDate;		// 日付
							m_cPrnSupport.pCorpCode		 := CmnReportExtStandardGenLabelCorpCode;	// 会社ｺｰﾄﾞ
							m_cPrnSupport.pCorpName		 := CmnReportExtStandardGenLabelCorpName;	// 会社名称
							m_cPrnSupport.pAccountOffice :=	CmnReportExtStandardGenAccOffice;		// 会計事務所名称
						end;
				end;

				strTmpFileName	:= '\tmp\実在' + strCaption + '登録リスト.csv';
        	end;

		1:	begin																					// 22:実在xxxx登録ﾘｽﾄ(詳細)
				m_cPrnSupport.strDocName	:= '実在' +  strCaption + '登録リスト';
				m_cPrnSupport.ApRB			 := CmnReportExtDetailsCst;
				m_cPrnSupport.pPage			 := CmnReportExtDetailsCstSysVarPage;					// 頁
				m_cPrnSupport.pDate			 := CmnReportExtDetailsCstSysVarDate;					// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportExtDetailsCstLabelCorpCode;				// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportExtDetailsCstLabelCorpName;				// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportExtDetailsCstAccOffice;					// 会計事務所名称

				strTmpFileName	:= '\tmp\実在' + strCaption + '登録リスト.csv';
			end;


		2:	begin																					// 合計xxxx登録ﾘｽﾄ
				m_cPrnSupport.strDocName	:= '合計' +  strCaption + '登録リスト';

				case (m_nCurrentMasterDiv) of
					MASTER_GENERAL01..MASTER_GENERAL05:											// 汎用補助1～5
						begin
							m_cPrnSupport.ApRB			 := CmnReportTtlStandardGen;
							m_cPrnSupport.pPage			 := CmnReportTtlStandardGenSysVarPage;		// 頁
							m_cPrnSupport.pDate			 := CmnReportTtlStandardGenSysVarDate;		// 日付
							m_cPrnSupport.pCorpCode		 := CmnReportTtlStandardGenLabelCorpCode;	// 会社ｺｰﾄﾞ
							m_cPrnSupport.pCorpName		 := CmnReportTtlStandardGenLabelCorpName;	// 会社名称
							m_cPrnSupport.pAccountOffice :=	CmnReportTtlStandardGenAccOffice;		// 会計事務所名称
						end;
				end;

				strTmpFileName	:= '\tmp\合計' + strCaption + '登録リスト.csv';
			end;

		3:	begin																					// xxxx体系登録ﾘｽﾄ
				m_cPrnSupport.strDocName	 := strCaption + '加算登録リスト';
				m_cPrnSupport.ApRB			 := CmnReportSystem;
				m_cPrnSupport.pPage			 := CmnReportSystemSysVarPage;							// 頁
				m_cPrnSupport.pDate			 := CmnReportSystemSysVarDate;							// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportSystemLabelCorpCode;						// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportSystemLabelCorpName;						// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportSystemAccOffice;							// 会計事務所名称

				strTmpFileName	:= '\tmp\' + strCaption + '加算登録リスト.csv';
			end;
	end;

	m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + strTmpFileName;
	m_cPrnSupport.pComArea	 	:= m_pRec^.m_pCommonArea;
	m_cPrnSupport.iDspFileBtn	:= 1; 								// ﾌｧｲﾙ出力表示
	m_cPrnSupport.iSysCode		:= m_pRec^.m_iSystemCode;			// ｼｽﾃﾑｺｰﾄﾞ
	m_cPrnSupport.iReportID		:= CHECKLIST;						// 帳票ｸﾞﾙｰﾌﾟNO
	m_cPrnSupport.MdataModule	:= m_cDataModule;
	m_cPrnSupport.iCalendarKbn	:= m_nDateFormatDivision + 1;

	nReturn	:= cDlgPrint.DoDLG (m_cPrnSupport);

	if	(nReturn > 0) then
	begin
		if	((uvHani.mjspre.IsExistPreview ()) and (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
		begin
			m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 10040, 1);

			MJSMessageBoxEx (AOwner,        // <009>
                             m_MjsMsgRec.sMsg,
                             m_MjsMsgRec.sTitle,
                             m_MjsMsgRec.icontype,
                             m_MjsMsgRec.btntype,
                             m_MjsMsgRec.btndef,
                             m_MjsMsgRec.LogType
                            );

			cDlgPrint  .Free ();
			dqPrintWork.Free ();

			Exit;
		end;

		if	(m_nDateFormatDivision = 0) then														// 和暦/西暦区分: 0=和暦
		begin
			strFormatDate		:= 'ee/mm/dd';
			strFormatDateTime	:= 'ee/mm/dd hh:mm:ss';
		end
		else																						// 和暦/西暦区分: 1=西暦
        begin
			strFormatDate		:= 'yy/mm/dd';
			strFormatDateTime	:= 'yy/mm/dd hh:mm:ss';
		end;

		case (cDlgCondition.m_nPrintDivision) of
			0:	begin
					case (m_nCurrentMasterDiv) of
						MASTER_GENERAL01..MASTER_GENERAL05:
							begin
								CmnReportExtStandardGenLabelTitle        .Caption		:= '実在' + strCaption + '登録リスト';
								CmnReportExtStandardGenDBTextAppDateStart.DisplayFormat	:= strFormatDate;
								CmnReportExtStandardGenDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
								CmnReportExtStandardGenDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;

								CmnReportExtStandardGenLineTitle.Left	:= CmnReportExtStandardGenLabelTitle.Left;
								CmnReportExtStandardGenLineTitle.Width	:= CmnReportExtStandardGenLabelTitle.Width;
							end;
					end;

					fnPrintCheckListExtStandard ();

					cMemDataWork	:= CmnMemDataPrintExtStandard;
				end;
			1:	begin
					CmnReportExtDetailsCstLabelTitle        .Caption		:= '実在' + strCaption + '登録リスト';
					CmnReportExtDetailsCstDBTextAppDateStart.DisplayFormat	:= strFormatDate;
					CmnReportExtDetailsCstDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
					CmnReportExtDetailsCstDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;

					CmnReportExtDetailsCstLineTitle.Left	:= CmnReportExtDetailsCstLabelTitle.Left;
					CmnReportExtDetailsCstLineTitle.Width	:= CmnReportExtDetailsCstLabelTitle.Width;

                    //--- HIS0042 St ------
                    ppLSaiyouName2.Caption                  := '';

                    if (m_TokuisakiCheck = TRUE) and (m_SiiresakiCheck = FALSE) and (m_NoCheck = FALSE) then
                        ppLSaiyouName2.Caption              := '得意先採用'
                    else
                    if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE) and (m_NoCheck = FALSE) then
                        ppLSaiyouName2.Caption              := '仕入先採用'
                    else
                    if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE) then
                        ppLSaiyouName2.Caption              := '得意先/仕入先採用なし'
                    else
                    if (m_TokuisakiCheck = TRUE) and (m_SiiresakiCheck = TRUE) and (m_NoCheck = FALSE) then
                        ppLSaiyouName2.Caption              := '得意先、仕入先採用'
                    else
                    if (m_TokuisakiCheck = TRUE) and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE) then
                        ppLSaiyouName2.Caption              := '得意先採用、得意先/仕入先採用なし'
                    else
                    if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE) and (m_NoCheck = TRUE) then
                        ppLSaiyouName2.Caption              := '仕入先採用、得意先/仕入先採用なし';
                    //--- HIS0042 Ed -------

					fnPrintCheckListExtDetails ();

					cMemDataWork	:= CmnMemDataPrintExtDetailsCst;
				end;
			2:	begin
					case (m_nCurrentMasterDiv) of
						MASTER_GENERAL01..MASTER_GENERAL05:
							begin
								CmnReportTtlStandardGenLabelTitle      .Caption			:= '合計' + strCaption + '登録リスト';
								CmnReportTtlStandardGenDBTextUpdateDate.DisplayFormat	:= strFormatDateTime;

								CmnReportTtlStandardGenLineTitle.Left	:= CmnReportTtlStandardGenLabelTitle.Left;
								CmnReportTtlStandardGenLineTitle.Width	:= CmnReportTtlStandardGenLabelTitle.Width;
							end;
					end;

					fnPrintCheckListTtlStandard ();

					cMemDataWork	:= CmnMemDataPrintTtlStandard;
				end;
			3:	begin
					m_strExCodePrint	:= '';

					CmnReportSystemLabelTitle.Caption	:= strCaption + '加算登録リスト';

    				CmnReportSystemLineTitle.Left	:= CmnReportSystemLabelTitle.Left;
    				CmnReportSystemLineTitle.Width	:= CmnReportSystemLabelTitle.Width;

					fnPrintCheckListSystem ();

					cMemDataWork	:= CmnMemDataPrintSystem;
				end;
		end;

		if	((m_cPrnSupport.iCommand = PDLG_PRINT) or (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
			uvHani.mjspre.Exec (m_cPrnSupport, cDlgPrint, nil)
		else if	(m_cPrnSupport.iCommand = PDLG_FILE) then
		begin
			//	HIS0007
			fnSetFileOutTF(cDlgCondition.m_nPrintDivision,sTitle,sMemFld);
			if ( MjsFileOut(cMemDataWork, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 ) then
			begin
				//	ファイル出力大失敗
				m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 10040,3);
		    	MjsMessageBoxEx(AOwner,         // <009>
                                m_MjsMsgRec.sMsg,
                                m_MjsMsgRec.sTitle,
                                m_MjsMsgRec.icontype,
                                m_MjsMsgRec.btntype,
                                m_MjsMsgRec.btndef,
                                m_MjsMsgRec.LogType
                               );
			end;
		end;
	end;

	cDlgPrint  .Free ();
	dqPrintWork.Free ();
}
end;

//-----------------------------------------------------------------------------
// fnCmnToolbarButtonChangeOnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 切出/埋込ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnToolbarButtonChangeOnClick (Sender: TObject);
var
	wkParam     :   TAppParam;
//<061>    iAction     :   Integer;
    lvRect      :   TRect;
    lvWidth,
    lvHeight    :   Integer;
begin

    m_fUnderConstruction    :=  FALSE;

    if (CmnToolbarButtonChange.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        wkParam.iAction                 :=  ACTID_DOCKINGINEND;         // 格納通知
        CmnToolbarButtonChange.Caption  :=  '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible         :=  FALSE;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect          :=  Self.ClientRect;
        lvWidth         :=  lvRect.Right  - lvRect.Left;
        lvHeight        :=  lvRect.Bottom - lvRect.Top;

        ClientWidth     :=  lvWidth;
        ClientHeight    :=  lvHeight;
		Visible		    :=	TRUE;

        // 親画面への設定
        wkParam.iAction                 :=  ACTID_DOCKINGOUTEND;        // 取出通知
        CmnToolbarButtonChange.Caption  :=  '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=  Pointer(m_pRec);              // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=  nil;                          // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_pRec^).m_pOwnerEntry(@wkParam);

    m_fUnderConstruction    :=  TRUE;

end;

//-----------------------------------------------------------------------------
// fnCmnToolbarButtonDetailOnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 一覧/詳細ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnToolbarButtonDetailOnClick (Sender: TObject);
var
	cNode	            :   TTreeNode;
	stSelectRec         :   ^TreeViewRec;
	stParentRec	        :   ^TreeViewRec;
	strExCodeParent     :   String;
    strExNCodeParent    :   Extended;
	strName		        :   String;
    nStrExNCode         :   Extended;
begin

    // -----------------------------
    //  一覧画面時
    // -----------------------------
	if ( DtlCmnClientPanel.Visible ) then
	begin
		DtlCmnClientPanel.Visible	:= FALSE;
		StdCmnClientPanel.Visible	:= TRUE;

		cNode		:= CmnTreeView.Selected;
		stSelectRec := cNode.Data;

		if (( stSelectRec^.nDivision = 0 ) or
            (stSelectRec^.nDivision  = DIVISION_GENERAL )) then
		begin
			stParentRec	        :=  cNode.Parent.Data;
			strExCodeParent	    :=  stParentRec^.strExCode;
            gfnSetExNCode('HOJYOMA',strExCodeParent,nStrExNCode);
            strExNCodeParent    :=  nStrExNCode;
			strName			    :=  stParentRec^.strName;
		end
		else
		begin
			strExCodeParent	    :=  stSelectRec^.strExCode;
            gfnSetExNCode('HOJYOMA',strExCodeParent,nStrExNCode);
            strExNCodeParent    :=  nStrExNCode;
			strName			    :=  stSelectRec^.strName;
		end;

        fnSetParentItemsInfoEx   (stSelectRec^.nDivision, stSelectRec^.strExCode, stSelectRec^.strExNCode, strExCodeParent, strExNCodeParent, strName);
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.strExCode);

		m_cACControl	:= CmnTreeView;
		m_cACControl.SetFocus();

		CmnToolbarButtonDetail.Caption	:= '詳細(&T)';

        fnSetFncType(False,0);     //<017>
		m_fChangeDetails    := FALSE;
	end
    // -----------------------------
    //  詳細画面時
    // -----------------------------
	else
	begin
        //<030>
        Pnl_SegBunInfo.Visible  :=  FALSE;
        //<030>
//<017>        fnSetFncType(0);    //<005>
        fnSetFncType(True,0);      //<017>
		fnShowDetailScreen();

		CmnToolbarButtonDetail.Caption	:= '一覧(&T)';
//<001>		CmnToolbarButtonTag   .Enabled	:= FALSE;
//<001>     ToolBarFusen          .Enabled	:= FALSE;
        ToolBarFusen          .Enabled	:= TRUE;

		DtlCmnButtonUpdate.Enabled	:=	TRUE;			// 更新ﾎﾞﾀﾝ
		DtlCmnButtonCancel.Enabled	:=	TRUE;			// 取消ﾎﾞﾀﾝ

		if ( giReferFlag	= REFER ) then			    // 参照の時
		begin
			DtlCmnButtonUpdate.Enabled	:=	FALSE;		// 更新ﾎﾞﾀﾝ
			DtlCmnButtonCancel.Enabled	:=	FALSE;		// 取消ﾎﾞﾀﾝ
			CmnTreeView.SetFocus;
			Exit;
		end;

        // 属性対応
		if ( m_nCurrentCodeAttr <= 1 ) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

        fnCheckDtlExCodeValid;      //<021>
		m_cACControl.SetFocus();
		fnSetDeleteButtonCondition();
	end;

end;

//-----------------------------------------------------------------------------
// fnCmnToolbarButtonDeleteOnClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 削除ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnToolbarButtonDeleteOnClick (Sender: TObject);
var
	cNode           :   TTreeNode;
	stWorkRec       :   ^TreeViewRec;
	strExCode       :   String;
	strMessage	    :   String;
	nSumDivision    :   Integer;
    strExNCode      :   Extended;
//<061>	    dqMasterData    :   TMQuery;
//<061>	    exNCode         :   Extended;           // <CHK>
    strErr          :   String;             // <CHK>
    strMsg          :   String;             // <CHK>
    strCode, strName    :   String;         // <CHK>

begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    strExNCode := 0;

	if ( m_fSystemClear ) then
	begin
		m_fSystemClear  :=  FALSE;

		if ( MJSMessageBoxEx (AOwner,   // <009>
                              _SystemClear,
                              '警告',
                              mjWarning,
                              mjOkCancel,
                              mjDefCancel,
                              FALSE ) = mrCancel ) then
			Exit;

		if	( not fnClearAllSystems() ) then
			Exit;

		fnRebuildTreeViewItems();
		fnSetParentItemsInfo();
		Exit;
	end;

    // ----------------------------
    //  フォーカス：ツリー
    // ----------------------------
	if ( CmnTreeView.Focused) then
	begin
		cNode		:=  CmnTreeView.Selected;
		stWorkRec	:=  cNode.Data;
		strExCode	:=  stWorkRec^.strExCode;
        strExNCode  :=  stWorkRec^.strExNCode;

		if ( stWorkRec^.nDivision = DIVISION_GENERAL ) then
			nSumDivision    :=  0
		else
			nSumDivision	:= stWorkRec^.nDivision;

		strMessage	:= '"' + stWorkRec^.strName;
        strName     := stWorkRec^.strName;  // <CHK>
	end
    // ----------------------------
    //  フォーカス：実在グリッド
    // ----------------------------
	else if	( Screen.ActiveControl.Name = StdCmnGridExist.Name ) then
	begin
		strExCode		:=  StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString;
		nSumDivision    :=  0;
		strMessage		:=  '"' + StdCmnGridExist.DataSource.DataSet.FieldByName('strNameSimple').AsString;
        strExNCode      :=  StdCmnGridExist.DataSource.DataSet.FieldByName('strExNCode').AsFloat;
        strName         :=  StdCmnGridExist.DataSource.DataSet.FieldByName('strNameSimple').AsString;   // <CHK>
	end
    // ----------------------------
    //  フォーカス：合計グリッド
    // ----------------------------
	else if	( Screen.ActiveControl.Name = StdCmnGridTotal.Name ) then
	begin
		strExCode		:= StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString;
		nSumDivision	:= 1;
		strMessage		:= '"' + StdCmnGridTotal.DataSource.DataSet.FieldByName('strNameSimple').AsString;
        strExNCode      := StdCmnGridTotal.DataSource.DataSet.FieldByName('strExNCode').AsFloat;
        strName         := StdCmnGridTotal.DataSource.DataSet.FieldByName('strNameSimple').AsString;    // <CHK>
	end
    // ----------------------------
    //  フォーカス：詳細画面
    // ----------------------------
	else
	begin
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		else
        // ﾌﾘｰ属性
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
			strExCode	:= DtlCmnEditExCodeFree.Text;
        end;

		nSumDivision	:= DtlCmnEditSumDivision.AsInteger;
		strMessage		:= '"' + DtlCmnEditNameSimple.Text;
        strName         := DtlCmnEditNameSimple.Text;   // <CHK>
//<059> ADD St
        // 内部コード取得
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
        begin
            gfnGetNCode(m_nCurrentMasterDiv,
                    Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]),
                    strExNCode,
                    nSumDivision)
        end
        else
        // ﾌﾘｰ属性
        begin
            gfnGetNCode(m_nCurrentMasterDiv,
                        DtlCmnEditExCodeFree.Text,
                        strExNCode,
                        nSumDivision);
        end;
//<059> ADD Ed
	end;

	if ( Trim (strExCode) = '' ) then
		Exit;

    strCode := Trim(strExCode);
	if ( m_nCurrentCodeAttr <= 1 ) then
		strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 4);

	strMessage	:= strMessage + '"のレコードを' + m_MjsMsgRec.sMsg;

	if ( MJSMessageBoxEx (AOwner,   // <009>
                          strMessage,
                          m_MjsMsgRec.sTitle,
                          m_MjsMsgRec.icontype,
                          m_MjsMsgRec.btntype,
                          m_MjsMsgRec.btndef,
                          m_MjsMsgRec.LogType) = mrYes) then
	begin
        // <CHK>↓
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if not fnDelCheck(strExNCode, m_nCurrentMasterDiv, strErr) then
        begin
            strCode := m_cComArea.SetDspCodeAttr(strCode, m_nCurrentCodeDigit, m_nCurrentCodeAttr);
                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strMsg := strCode + ' ' + strName + ' ' + strErr;
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <CHK>↑
//<059> ADD St
        if (CmnToolbarButtonDetail.Caption <> '詳細(&T)') then
            // 詳細画面情報をクリア
            fnInitializeDetailScreen(True);
//<059> ADD Ed
        // 削除処理
		fnDeleteMasterRecord (nSumDivision, strExCode);
		fnResetParentItemsInfo();

        //<060>-Add st 合計/実在補助ｸﾞﾘｯﾄﾞにレコードがない場合
        if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then		// 実在補助ｸﾞﾘｯﾄﾞ
        begin
        	if (StdCmnGridExist.FocusedNode.Strings[1] = '') then
            begin
            	CmnToolbarButtonDetail.Enabled := False;
                CmnToolbarButtonDelete.Enabled := False;
                CmnToolbarButtonTag.Enabled := False;
            end;
        end
        else if (Screen.ActiveControl.Name = StdCmnGridTotal.Name) then // 合計補助ｸﾞﾘｯﾄﾞ
        begin
			if (StdCmnGridTotal.FocusedNode.Strings[1] = '') then
            begin
               	CmnToolbarButtonDetail.Enabled := False;
                CmnToolbarButtonDelete.Enabled := False;
                CmnToolbarButtonTag.Enabled := False;
            end;
        end;
		//<060>-Add end
	end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// BSpeedButtonSortClick()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 並び替えﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.BSpeedButtonSortClick(Sender: TObject);
var
	QueryRead  : TMQuery;
    QueryWrite : TMQuery;
	iRet	   : Integer;
	iEntNo	   : Integer;
    sSvSumCode : Extended;
	iCount	   : Integer;
	stName	   : String;
    QueryDelete : TMQuery;     //<063> ADD
    sList      : TStringList;  //<063> ADD
begin
	QueryRead	:= TMQuery.Create ( Self );
    QueryWrite	:= TMQuery.Create ( Self );
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, QueryRead  );
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, QueryWrite );
    sList := TStringList.Create();  //<063> ADD

    iEntNo     := 100;                          // <068>修正
    sSvSumCode := 0;

	SessionPractice(C_ST_PROCESS);				// <057>

    try
        // ﾏｽﾀ基本情報からﾏｽﾀ区分名称を取得
        with QueryRead do
        begin
            Close();
            SQL.Clear();
            SQL.Add('select JHojyoName from MasterInfo ');
            SQL.Add('where MasterKbn = :MKbn           ');

            ParamByName('MKbn').AsInteger := m_nCurrentMasterDiv;

            if ( Open() = false ) then
            begin
                Close();
                Free();
                Exit;
            end;

            if not Eof then
                    stName := Trim(QueryRead.GetFld('JHojyoName').AsString)
            else    stName := '';

    		iRet := MjsMessageBoxEX(AOwner, // <009>
                    stName + 'コード昇順で並び替えを行います。よろしいですか？'
                    ,'並び替え',mjQuestion,mjYesNo,mjDefYes);

    		if ( iRet = mrYes ) then
    		begin
    			Prog1.Visible := true;

                //加算体系の件数を取得
                Close();
                SQL.Clear();
                SQL.Add('select Count(*) as Count from HojyoTree ');
                SQL.Add('where MasterKbn = :MKbn                 ');
                ParamByName('MKbn').AsInteger := m_nCurrentMasterDiv;

                if ( Open() = false ) then
                begin
                    Close();
                    Free();
                    Exit;
                end;

                if not Eof then
                begin
                    Prog1.Max       := QueryRead.GetFld('Count').AsInteger * 2;
                    Prog1.Position  := 0;
                    iCount          := 0;
                end
                else
                    Exit;

                Close();
                SQL.Clear();
                SQL.Add('select HT.MasterKbn,HT.SumNCode,HT.BasedNCode,HT.EntNo,    ');
                SQL.Add('  MA.GCode as BasedGCode,OYAMA.GCode as SumGCode           '); // <014>
                SQL.Add('from HojyoTree HT                                          ');
                SQL.Add('left outer join HojyoMA MA    on MA.NCode = HT.BasedNCode  '); // <014>
                SQL.Add('left outer join HojyoMA OYAMA on OYAMA.NCode = HT.SumNCode '); // <014>
                SQL.Add('where HT.MasterKbn = :Mkbn                                 ');
                SQL.Add('order by OYAMA.GCode,MA.SumKbn,MA.GCode, HT.EntNo          '); // <014>

                ParamByName('MKbn').AsInteger := m_nCurrentMasterDiv;

                if ( Open() = false ) then
                begin
                    Close();
                    Free();
                    Exit;
                end;

                m_cDataModule.BeginTran( m_cDBSelect);      //<069>追加 トランザクション開始

                //<070>追加↓
                // これまでの不具合で発生していたゴミデータの削除
                with QueryWrite do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Delete HojyoTree where EntNo < 1 and MasterKbn = :MKbn');
                    ParamByName('MKbn').AsInteger := m_nCurrentMasterDiv;
                    if ( QueryWrite.ExecSQL = false ) then
                    begin
                        // ﾛｰﾙﾊﾞｯｸ(破棄)
                		m_cDataModule.Rollback ( m_cDBSelect );
                        QueryWrite.Close();
                        QueryWrite.Free();
                        Exit;
                    end;
                end;
                //<070>追加↑

                while not Eof do
                begin
//<063> ADD St
                    // 外部コードNullをListに保管
                    if (GetFld('BasedGCode').AsString = '') then
                    begin
                        sList.Add(GetFld('BasedNCode').AsString);
                        Next();
                        continue;
                    end;
//<063> ADD Ed
                    // EntNoを「-(ﾏｲﾅｽ)」表示でDBに書き込む
                    QueryWrite.Close();
                    QueryWrite.SQL.Clear();
                    QueryWrite.SQL.Add('update HojyoTree set                ');
                    QueryWrite.SQL.Add('     EntNo         = :EntNo         ');
                    QueryWrite.SQL.Add('    ,UpdTantoNCode = :UpdTantoNCode ');
                    QueryWrite.SQL.Add('where MasterKbn  = :MKbn            ');
                    QueryWrite.SQL.Add('  and SumNCode   = :SCode           ');
                    QueryWrite.SQL.Add('  and BasedNCode = :BCode           ');

                    QueryWrite.ParamByName('MKbn'         ).AsInteger  := m_nCurrentMasterDiv;
                    QueryWrite.ParamByName('EntNo'        ).AsInteger  := QueryRead.GetFld('EntNo'     ).AsInteger * -1;
                    QueryWrite.ParamByName('SCode'        ).AsFloat    := QueryRead.GetFld('SumNCode'  ).AsFloat;
                    QueryWrite.ParamByName('BCode'        ).AsFloat    := QueryRead.GetFld('BasedNCode').AsFloat;
                    QueryWrite.ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode;

                    if ( QueryWrite.ExecSQL = false ) then
                    begin
                        // ﾛｰﾙﾊﾞｯｸ(破棄)
                		m_cDataModule.Rollback ( m_cDBSelect );
                        QueryWrite.Close();
                        QueryWrite.Free();
                        Exit;
                    end;

                    Next;
                    Inc(iCount);
                    Prog1.Position := iCount;
                end;

//<063> ADD St
                // 削除対象がある場合はDeleteする
                if (sList.Count > 0) then
                begin
                    QueryDelete := nil;

                    try
                        QueryDelete	:= TMQuery.Create ( Self );
                        m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, QueryDelete  );

                        QueryDelete.SQL.Clear();
                        QueryDelete.SQL.Add(' Delete HojyoTree Where MasterKbn = :MasterKbn And BasedNCode IN ('+sList.CommaText+')');

                        QueryDelete.ParamByName('MasterKbn').AsInteger := m_nCurrentMasterDiv;

                        if ( QueryDelete.ExecSQL = false ) then
                        begin
                            // ﾛｰﾙﾊﾞｯｸ(破棄)
                            m_cDataModule.Rollback ( m_cDBSelect );
                            Exit;
                        end;

                    finally
                        if Assigned(QueryDelete) then
                        begin
                            QueryDelete.Close();
                            QueryDelete.Free();
                        end;
                    end;
                end;
//<063> ADD Ed

                Close();
                SQL.Clear();
                SQL.Add('select HT.MasterKbn,HT.SumNCode,HT.BasedNCode,HT.EntNo,    ');
                SQL.Add('  MA.GCode as BasedGCode,OYAMA.GCode as SumGCode           '); // <014>
                SQL.Add('from HojyoTree HT                                          ');
                SQL.Add('left outer join HojyoMA MA    on MA.NCode = HT.BasedNCode  '); // <014>
                SQL.Add('left outer join HojyoMA OYAMA on OYAMA.NCode = HT.SumNCode '); // <014>
                SQL.Add('where HT.MasterKbn = :Mkbn                                 ');
                SQL.Add('order by OYAMA.GCode,MA.SumKbn,MA.GCode, HT.EntNo          '); // <014>
                ParamByName('MKbn').AsInteger := m_nCurrentMasterDiv;

//DEL10 DEL St 処理位置移動
                //FetchAll;
//DEL10 DEL Ed
                if ( Open() = false ) then
                begin
                    Close();
                    Free();
                    Exit;
                end;

//DEL10 DEL St 処理位置移動
                FetchAll;
//DEL10 DEL Ed
                while not Eof do
                begin
                    if ( sSvSumCode <> QueryRead.GetFld('SumNCode').AsFloat ) then
                        iEntNo  := 100;

                    QueryWrite.Close();
                    QueryWrite.SQL.Clear();
                    QueryWrite.SQL.Add('update HojyoTree set                ');
                    QueryWrite.SQL.Add('     EntNo         = :NewEntNo      ');
                    QueryWrite.SQL.Add('    ,UpdTantoNCode = :UpdTantoNCode ');
                    QueryWrite.SQL.Add('where MasterKbn  = :MKbn            ');
                    QueryWrite.SQL.Add('  and EntNo      = :EntNo           ');
                    QueryWrite.SQL.Add('  and SumNCode   = :SCode           ');
                    QueryWrite.SQL.Add('  and BasedNCode = :BCode           ');

                    QueryWrite.ParamByName('MKbn'         ).AsInteger  := m_nCurrentMasterDiv;
                    QueryWrite.ParamByName('NewEntNo'     ).AsInteger  := iEntNo;
                    QueryWrite.ParamByName('SCode'        ).AsFloat    := QueryRead.GetFld('SumNCode'  ).AsFloat;
                    QueryWrite.ParamByName('BCode'        ).AsFloat    := QueryRead.GetFld('BasedNCode').AsFloat;
                    QueryWrite.ParamByName('EntNo'        ).AsInteger  := QueryRead.GetFld('EntNo'     ).AsInteger;
                    QueryWrite.ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode;

                    if ( QueryWrite.ExecSQL() = false ) then
                    begin
                        // ﾛｰﾙﾊﾞｯｸ(破棄)
                		m_cDataModule.Rollback (m_cDBSelect);
                        QueryWrite.Close();
                        QueryWrite.Free();
                        Exit;
                    end;

                    sSvsumCode := QueryRead.GetFld('SumNCode').AsFloat;
                    iEntNo     := iEntNo + 100;

                    Next;
                    Inc(iCount);
                    Prog1.Position := iCount;
                end;
            end
            else
            begin
                Abort;
            end;

            Prog1.Visible := false;

            // ｺﾐｯﾄ(反映)
			m_cDataModule.Commit ( m_cDBSelect );

            fnRebuildTreeViewItems();
            fnSetParentItemsInfo;

            if ( CmnToolbarButtonDetail.Caption <> '詳細(&T)' ) then
            begin
                // <049> - ST
                //fnInitializeDetailScreen ( true );
                // <049> - ED

                // ﾌﾘｰ属性
                if ( m_nCurrentCodeAttr = 2 ) then
                    MjsDispCtrl.MjsSetFocus ( Self, 'DtlCmnEditExCodeFree' )
                // 数値属性
                else
                    MjsDispCtrl.MjsSetFocus ( Self, 'DtlCmnEditExCodeNumeric' );

                fnSetFncType(True,0);
            end
            else
            begin
                // 実在
                if ( StdCmnTab.Items[0].Selected = TRUE ) then
                    MjsDispCtrl.MjsSetFocus ( Self, 'StdCmnGridExist' )
                // 合計
                else
                    MjsDispCtrl.MjsSetFocus ( Self, 'StdCmnGridTotal' );

                fnSetFncType(False,0);
            end;

        end;

    finally
		SessionPractice(C_ED_PROCESS);			// <057>
        QueryRead.Close();
        QueryRead.Free();
        QueryWrite.Close();
        QueryWrite.Free();
        Prog1.Visible := false;  //<063> ADD
        FreeAndNil(sList);       //<063> ADD
    end;

end;

//-----------------------------------------------------------------------------
// B_SearchClick()  <010>
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 検索ﾎﾞﾀﾝ OnClickｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.B_SearchClick(Sender: TObject);
var
{
	DLGParam	:	TJNTDLGParam;
	DLG			:	TJNTMASSEARCHDLGIF;
}
    lvExpSend   :   rcJNTExpSend;   // 親BPL送信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    lvExpRecv   :   rcJNTExpRecv;   // 親BPL受信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    iExpRtn     :   Integer;        // 戻り値
    sCode       :   String;         // 外部ｺｰﾄﾞ(属性対応用)
begin
{
	// 付箋ﾀﾞｲｱﾛｸﾞ表示
	DLG := TJNTMASSEARCHDLGIF.Create();
	DLG.Init( pointer ( m_pRec ) );
	DLGParam			:= TJNTDLGParam.CreateParam();
	DLGParam.pApRec	    := pointer( m_pRec );		// ApRecのﾎﾟｲﾝﾀ
	DLGParam.iMasterkbn := m_nCurrentMasterDiv;     // ﾏｽﾀ区分
	DLGParam.iAttr		:= m_nCurrentCodeAttr;      // 属性
	DLGParam.iDigit		:= m_nCurrentCodeDigit;     // 桁数

	if DLG.DoDlg(DLGParam) = mrOk then				// ↑検索、↓検索
	begin
		m_SearchInfo.sHojCD     := DLGParam.sSearchCD;
		m_SearchInfo.iItem      := 0;
		m_SearchInfo.bFstFlg    := FALSE;
		CmnTreeView.SetFocus;
		fnSearch();
	end;

	DLGParam.Free();
	DLG.Term();
	DLG.Free();
}

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;                             // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;                       // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    lvExpSend.MasterKbn     :=  m_nCurrentMasterDiv;
    lvExpSend.ModulKbn      :=  0;
    lvExpSend.PatternNo     :=  1;
    lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';
    lvExpSend.TableName     :=  'HOJYOMA';
    lvExpSend.WhereStr      :=  ' HojyoMA.MasterKbn = ' + intTostr(m_nCurrentMasterDiv) +
                                ' AND HojyoMA.RDelKbn = 0 ';
    lvExpSend.SortStr       :=  'Order By HojyoMA.GCode';
    lvExpSend.TrRootCaption :=  '';

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin
        // 数値属性(前ｾﾞﾛ有)
        if ( m_nCurrentCodeAttr <= 1 ) then
            sCode   := Format ('%.16d', [StrToInt64 (Trim (lvExpRecv.GCode))])
        // ﾌﾘｰ属性
        else
            sCode   := m_cComArea.SetDspCodeAttr(lvExpRecv.GCode, m_nCurrentCodeDigit, 2);

		m_SearchInfo.sHojCD     := sCode;
		m_SearchInfo.iItem      := 0;
		m_SearchInfo.bFstFlg    := FALSE;
		CmnTreeView.SetFocus;
		fnSearch();
    end;

end;

//-----------------------------------------------------------------------------
// fnCommonFunctionDetailsOnChange()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 共通 OnChangeｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCommonFunctionDetailsOnChange (Sender: TObject);
begin

	if ( m_pRec^.m_pChildForm = nil ) then
		Exit;

	if (( not m_fChangeDetails     )  and
        ( not m_fUnderConstruction )  and
        ( giReferFlag = NORMAL     )) then
		m_fChangeDetails	:= TRUE;

end;

//-----------------------------------------------------------------------------
// fnCmnInstructionComboOnChange()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 指示ｺﾝﾎﾞﾎﾞｯｸｽ OnChangeｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnInstructionComboOnChange (Sender: TObject);
//<061>	var
//<061>	    bSyokuti: Boolean;
begin

    if ( m_DspFlg = FALSE ) then Exit;  // <008>

	if ( m_fIgnoreProc ) then
	begin
		m_fIgnoreProc	:= FALSE;
		Exit;
	end;

    if ( not CmnInstructionCombo.DroppedDown )then
    begin
        if ( m_DoDspKeyDown = FALSE ) then
        begin
            fnChangeSelectionScreen();
        end;
    end;

     //<028>
     if  m_nCurrentMasterDiv <> 0 then
     begin
        CmnToolbarButtonPrint.Enabled   := m_cJNTArea.IsPrint;
        B_Search.Enabled                := TRUE;
     end
     else
     begin
        CmnToolbarButtonPrint.Enabled   := FALSE;
        B_Search.Enabled                := FALSE;
     end;
     //<028>

end;

//-----------------------------------------------------------------------------
// fnCommonFunctionOnEnter01()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 共通 OnEnterｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCommonFunctionOnEnter01 (Sender: TObject);
begin

	CmnToolbarButtonDetail.Enabled	:= FALSE;
	CmnToolbarButtonDelete.Enabled	:= FALSE;
//<001>	CmnToolbarButtonTag   .Enabled	:= FALSE;
    CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
    ToolBarFusen          .Enabled	:= FALSE;   // <001>
    BSpeedButtonSort      .Enabled	:= FALSE;

    m_cACControl    := Screen.ActiveControl;
	m_fIgnoreProc	:= FALSE;

end;

//-----------------------------------------------------------------------------
// fnCmnInstructionComboOnKeyDown()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 指示ｺﾝﾎﾞﾎﾞｯｸｽ OnKeyDownｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnInstructionComboOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    // Esc / ENDｷｰの補足
	if (( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
		Close;
		Abort;
	end;

    // Shift + TABｷｰの補足
	if (( Key = VK_TAB ) and ( Shift = [ssShift] )) then
		Abort;

    if  (Key = VK_Up) or (Key = VK_Down) then
    begin
		m_fIgnoreProc   :=  TRUE;
        m_DoDspKeyDown  :=  FALSE;
    end;

    //  RETUEN / TABｷｰの補足
	if (( Key = VK_RETURN ) or ( Key = VK_TAB )) then
	begin
        m_fIgnoreProc   :=  FALSE;
        m_DoDspKeyDown  :=  TRUE;

		if ( fnChangeSelectionScreen() ) then
        begin
            CmnTreeView.SetFocus();
        end;

        m_DoDspKeyDown  :=  FALSE;

		Abort;
	end;

end;

//-----------------------------------------------------------------------------
// fnChangeSelectionScreen()
//      PARAM   :
//      VAR     :
//      RETURN  : Boolan    :   TRUE:正常   FALSE:異常
//      MEMO    : 画面表示初期処理
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnChangeSelectionScreen (): Boolean;
var
	dqMasterData    :   TMQuery;
//	cDialogAdopt    :   TJNTCRP016003f;
   	stItemRec	    :   ^TreeViewRec;
	nMasterDivision :   Integer;
	nCodeDigit      :   Integer;
	nCodeAttribute  :   Integer;
	nNameLength	    :   Integer;
	nCount		    :   Integer;
	nReturn		    :   Integer;
	strFormat	    :   String;
	strItemName	    :   String;
    fDialogAdopt    :   Boolean;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <041>
    //
    //  親子間の採用区分、ｺｰﾄﾞ属性、桁数の整合性ﾁｪｯｸを行う
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin

        case m_SyncMaster.fnChkP_MasterInfo
                    ( m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision ) of
            // 正常
            JNTSYNC_RET_MASCHK_OK:
                begin
                end;
            // 全社では採用なし
            JNTSYNC_RET_MASCHK_NO_USE:
                begin
                    MjsMessageBoxEx(Self, JNTSYNC_MSG_NO_USE,
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Result := false;
                    Abort;
                    Exit;
                end;
            // 属性・桁数違う
            JNTSYNC_RET_MASCHK_DIFF_C:
                begin
                    MjsMessageBoxEx(Self, JNTSYNC_MSG_DIFF_C,
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Result := false;
                    Abort;
                    Exit;
                end;
            // 採用区分違う
            JNTSYNC_RET_MASCHK_DIFF_U:
                begin
                end;
            // 異常
            JNTSYNC_RET_MASCHK_ERR:
                begin   // 例外ｴﾗｰ
                    Result := false;
                    Abort;
                    Exit;
                end;
        end;

        // 未配信ﾏｽﾀの考慮として、同期ﾌﾟﾛｼｼﾞｬの起動。

        // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran( m_cDBSelect );

        if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = False ) then
        begin
            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
            m_cDataModule.Rollback ( m_cDBSelect );
            Result := false;
            Abort;
            Exit;
        end;

        // 子会社DBに対してｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_cDBSelect );
    end;
    // ↑↑↑<041>
    // -------------------------------------------------------------------------

	if ( m_stSelectItem[CmnInstructionCombo.ItemIndex + 1].nMasterDivision = m_nCurrentMasterDiv ) then
	begin
        // 部署の時
		if ( m_DataKbn = 3 ) then
		begin
			if ( CmnTreeView.Items.Count = 0 ) then
			begin
				m_MjsMsgRec.sMsg	:= '経理側で「諸口マスタ」が未登録のため部署側でのマスタ登録は行えません。';
          		m_MjsMsgRec.sTitle	:= '登録';

           		MjsMessageBoxEx (AOwner,    // <009>
                                 m_MjsMsgRec.sMsg,
                                 m_MjsMsgRec.sTitle,
                                 m_MjsMsgRec.icontype,
                                 mjOk,
                                 m_MjsMsgRec.btndef,
                                 FALSE
                                );
             	CmnInstructionCombo.SetFocus();
			end;
		end;

		Result  :=  TRUE;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);


	// 部署の時
	if ( m_DataKbn = 3 ) then
	begin
		with dqMasterData do
		begin
			// 諸口が存在するかﾁｪｯｸ
        	Close();
			SQL.Clear();
            SQL.Add('SELECT * FROM HojyoMA                  '
                +   'WHERE (MasterKbn   = :nMasterDivision) '
                +   '  AND (Syokuchikbn = 1)                '
                +   '  AND (RDelKbn     = 0)                ');

			ParamByName('nMasterDivision').AsInteger	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision;

			if ( Open() = FALSE ) then
			begin
				Close();
				Free();
                Result  :=  FALSE;
				Exit;
			end;

			// 諸口が存在しない場合はﾒｯｾｰｼﾞを表示してﾌｫｰｶｽをｺﾝﾎﾞﾎﾞｯｸｽに戻す
			if Eof then
			begin
              	m_MjsMsgRec.sMsg	:= '経理側で「諸口マスタ」が未登録のため部署側でのマスタ登録は行えません。';
          		m_MjsMsgRec.sTitle	:= '登録';

           		MjsMessageBoxEx (AOwner,    // <009>
                                 m_MjsMsgRec.sMsg,
                                 m_MjsMsgRec.sTitle,
                                 m_MjsMsgRec.icontype,
                                 mjOk,
                                 m_MjsMsgRec.btndef,
                                 FALSE
                                );

				StdCmnMemDataExist.Close();
              	StdCmnMemDataTotal.Close();

				for nCount := 1 to CmnTreeView.Items.Count do
				begin
					stItemRec	:= CmnTreeView.Items [CmnTreeView.Items.Count - 1].Data;

					Dispose (stItemRec);
               		CmnTreeView.Items [CmnTreeView.Items.Count - 1].Delete;
				end;

				m_nCurrentMasterDiv	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision;
             	CmnInstructionCombo.SetFocus();
                Result  :=  FALSE;
				Exit;
			end;
		end;
	end;

	nMasterDivision	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision;
	fDialogAdopt	:= TRUE;

	with dqMasterData do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT MasterKbn FROM HojyoMA          '
            +   'WHERE (MasterKbn = :nMasterDivision)   '
            +   '  AND (RDelKbn   = 0)                  ');
		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
		Open();

		if ( not EOF ) then
			fDialogAdopt	:= FALSE;
	end;

// ﾒｰﾙ会計によって通常処理・基本のみ設定・参照を切り替える
// (NORMAL:通常処理,BASICONLY:基本のみ設定可能,REFER:参照のみ)
(*
	nRetID	:=	MailEntCheck (m_cDBSelect, m_cDataModule, m_cComArea, nMasterDivision, 1);

	case (nRetID) of
		DISPOSE_SETTLE    :	giReferFlag	:= REFER;		//	決算確定の為参照のみ
		DISPOSE_MAILNOTUSE:	giReferFlag	:= NORMAL;		//	ﾒｰﾙ未採用の為通常処理
		DISPOSE_USUALLY   :	giReferFlag	:= NORMAL;		//	通常処理
		DISPOSE_BASIC     :	giReferFlag	:= BASICONLY;	//	基本のみ設定可能
		DISPOSE_REFER     :	giReferFlag	:= REFER;		//	参照のみ
	end;
*)
//    giReferFlag :=  NORMAL;

{
	if ( fDialogAdopt = TRUE ) then
	begin
		if ( giReferFlag = REFER ) then
		begin
			if ( m_nCurrentMasterDiv <> 0 ) then
			begin
				for nCount := 1 to 8 do
				begin
					if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
						Break;
				end;

				CmnInstructionCombo.ItemIndex	:= nCount - 1;
			end
			else
				CmnInstructionCombo.ItemIndex	:= 0;

			dqMasterData.Close();
			dqMasterData.Free();

			Result	:= FALSE;
			Exit;
		end;

        // -----------------------------------
        //  採用情報ダイアログの表示
        // -----------------------------------
		cDialogAdopt    :=  TJNTCRP016003f.fnCreateDialog (Pointer(m_pRec),
															Self,
                                                            m_cDataModule,
                                                            m_cDBSelect,
                                                            nMasterDivision
                                                           );

        // ｷｬﾝｾﾙ時
		if ( cDialogAdopt.ShowModal() = mrCancel ) then
		begin
			Result  :=  FALSE;

			if ( m_nCurrentMasterDiv <> 0 ) then
			begin
				for nCount := 1 to 8 do
				begin
					if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
						Break;
				end;

				CmnInstructionCombo.ItemIndex	:= nCount - 1;
			end
			else
				CmnInstructionCombo.ItemIndex	:= 0;

			dqMasterData.Free();
			Exit;
		end;

        // 桁数,属性の取得
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nAdoptDivision	:= 1;
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeDigit		:= cDialogAdopt.m_nCodeDigit;
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeAttribute	:= cDialogAdopt.m_nCodeAttribute;
	end;
} // <004>


    // <004>
    with dqMasterData do
	begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT CodeDigit,CodeAttr FROM MasterInfo  '
            +   'WHERE  Masterkbn = :MasKbn                 ');
//<019>        ParamByName('MasKbn').AsInteger :=  m_nCurrentMasterDiv;
        ParamByName('MasKbn').AsInteger :=  nMasterDivision;
        Open();

        if not EOF then
        begin
            // 桁数,属性の取得
    		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nAdoptDivision	:= 1;
    		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeDigit		:= GetFld('CodeDigit').AsInteger;
    		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeAttribute	:= GetFld('CodeAttr').AsInteger;
        end;

        Close();
    end;

	nCodeDigit		:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeDigit;
	nCodeAttribute	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeAttribute;

    if ( giReferFlag <> REFER ) then        // <012>
    begin

        // 諸口ﾃﾞｰﾀの存在ﾁｪｯｸ
	    nReturn := fnCheckRequisiteItem (nMasterDivision, nCodeDigit, nCodeAttribute);

    	if (( nReturn = REQUISITE_CANCEL )  or
            ( nReturn = REQUISITE_EXIT   )) then
    	begin
	    	dqMasterData.Close();
		    dqMasterData.Free();

    		Result := FALSE;

            for nCount := 1 to CmnInstructionCombo.Items.Count do
            begin
            	if m_stSelectItem[nCount].nMasterDivision = m_nCurrentMasterDiv then
                begin
					CmnInstructionCombo.ItemIndex := nCount-1;
					CmnInstructionCombo.Text := m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].strItemCaption;
					break;
				end;
			end;

	    	Exit;
    	end;
    end;

	m_nCurrentMasterDiv	:= nMasterDivision;
	m_nCurrentCodeDigit	:= nCodeDigit;
	m_nCurrentCodeAttr	:= nCodeAttribute;

    // 実在,合計用ﾒﾑﾃﾞｰﾀをOpenする
	StdCmnMemDataExist.Close();
	StdCmnMemDataTotal.Close();
	StdCmnMemDataExist.Open();
	StdCmnMemDataTotal.Open();

	StdCmnGridExistCode.MaxLength	:= m_nCurrentCodeDigit;
	StdCmnGridTotalCode.MaxLength	:= m_nCurrentCodeDigit;

    // 属性対応
    if ( m_nCurrentCodeAttr = 2 ) then
    begin
		StdCmnGridExistCode.Alignment		:= taLeftJustify;
		StdCmnGridExistCode.EditAlignment	:= taLeftJustify;
		StdCmnGridExistCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridExistCode.ImeMode			:= imClose;
		StdCmnGridExistCode.Hankaku			:= TRUE;

		StdCmnGridTotalCode.Alignment		:= taLeftJustify;
		StdCmnGridTotalCode.EditAlignment	:= taLeftjustify;
		StdCmnGridTotalCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridTotalCode.ImeMode			:= imClose;
		StdCmnGridTotalCode.Hankaku			:= TRUE;
    end
    else
    begin
		StdCmnGridExistCode.Alignment		:= taRightJustify;
		StdCmnGridExistCode.EditAlignment	:= taRightjustify;
		StdCmnGridExistCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridExistCode.ImeMode			:= imDisable;
		StdCmnGridExistCode.Hankaku			:= FALSE;

		StdCmnGridTotalCode.Alignment		:= taRightJustify;
		StdCmnGridTotalCode.EditAlignment	:= taRightJustify;
		StdCmnGridTotalCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridTotalCode.ImeMode			:= imDisable;
		StdCmnGridTotalCode.Hankaku			:= FALSE;
    end;

	nNameLength	:= 20;

    // 汎用補助①～⑤
	case ( m_nCurrentMasterDiv ) of
		MASTER_GENERAL01:	nNameLength	:= LENGTH_NAME_GENERAL;
		MASTER_GENERAL02:	nNameLength	:= LENGTH_NAME_GENERAL;
		MASTER_GENERAL03:	nNameLength	:= LENGTH_NAME_GENERAL;
		MASTER_GENERAL04:	nNameLength	:= LENGTH_NAME_GENERAL;
		MASTER_GENERAL05:	nNameLength	:= LENGTH_NAME_GENERAL;
	end;

	StdCmnGridExistName   .MaxLength	:= nNameLength;
	StdCmnGridTotalName   .MaxLength	:= nNameLength;
	DtlCmnEditName        .MaxLength	:= nNameLength;
	StdCmnMemDataExistName.DisplayWidth	:= nNameLength;
	StdCmnMemDataExistName.DisplayWidth	:= nNameLength;

    StdCmnGridExist.Bands [5].Visible	:= FALSE;
    StdCmnGridExist.Bands [6].Visible	:= FALSE;

    // 数値属性
	if ( m_nCurrentCodeAttr <= 1 ) then
	begin
		DtlCmnEditExCodeFree   .Visible		:= FALSE;
		DtlCmnEditExCodeNumeric.Visible		:= TRUE;

        // 数値前ｾﾞﾛ有
		if ( m_nCurrentCodeAttr = 1 ) then
			strFormat	:= StringOfChar ('0', m_nCurrentCodeDigit)
        // 数値
		else
			strFormat	:= '';

		DtlCmnEditExCodeNumeric.FormatStr	:= strFormat;
		DtlCmnEditExCodeNumeric.Digits		:= m_nCurrentCodeDigit;
		DtlCmnEditExCodeNumeric.MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCurrentCodeDigit));
	end
    // ﾌﾘｰ属性
	else
	begin
		DtlCmnEditExCodeNumeric.Visible		:= FALSE;
		DtlCmnEditExCodeFree   .Visible		:= TRUE;
		DtlCmnEditExCodeFree   .MaxLength	:= m_nCurrentCodeDigit
	end;

	for nCount := 1 to 5 do
	begin
		if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
		begin
			strItemName := m_stSelectItem [nCount].strItemCaption;
			Break;
		end;
	end;

	DtlCmnLabelExCodeTitle      .Caption	:= strItemName + 'コード';

    CmnTreeView           .Enabled	:=  TRUE;
    CmnSplitter           .Enabled	:=  TRUE;
//<011>	CmnToolbarButtonPrint .Enabled	:=  TRUE;
    StdCmnClientPanel     .Enabled	:=  TRUE;
    DtlCmnClientPanel     .Enabled	:=  TRUE;

	StdCmnTab.Items [0].Selected	:=  TRUE;
	StdCmnTab.Items [1].Selected	:=  FALSE;

	DtlCmnClientPanel.Visible		:=  FALSE;
	StdCmnClientPanel.Visible		:=  TRUE;

	CmnToolbarButtonDetail.Caption	:=  '詳細(&T)';

	Prog1.Visible		            :=  TRUE;

	fnRebuildTreeViewItems();
	fnSetParentItemsInfo();

    // ｾｸﾞﾒﾝﾄ,分類初期設定
    fnSegBumInzForm();

	dqMasterData.Free();

// <008>	fnPartsControl(giReferFlag);

	Prog1.Visible		            :=  FALSE;
	Result	                        :=  TRUE;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// fnCheckRequisiteItem()
//      PARAM   : nMasterDivision   :   ﾏｽﾀ区分
//                nCodeDigit        :   ｺｰﾄﾞ桁数
//                nCodeAttribute    :   ｺｰﾄﾞ属性
//      VAR     :
//      RETURN  : Integer
//      MEMO    : 諸口ﾁｪｯｸ処理
//-----------------------------------------------------------------------------
function TJNTCRP016000f.fnCheckRequisiteItem (nMasterDivision: Integer; nCodeDigit: Integer;
                                              nCodeAttribute: Integer): Integer;
var
	cDlgRequisite   : TJNTCRP016002f;   // 諸口ﾀﾞｲｱﾛｸﾞ
	dqMasterData    : TMQuery;
//<061>	    dqMasterData_P  : TMQuery;          // <041>
	nReturn		    : Integer;
	fNoRecord       : Boolean;
//<061>	    iMastKbn        : Integer;          // <041>
    nPNCode         : Extended;         // <041>
    bRet            : Boolean;          // <041>
begin

	fNoRecord := TRUE;
	nReturn	  := REQUISITE_OK;


	dqMasterData := TMQuery.Create ( Self );
    m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );



	with dqMasterData do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT * FROM HojyoMA          ');
        SQL.Add('WHERE MasterKbn   = :pMstKbn   ');
        SQL.Add('  AND Syokuchikbn = 1          ');
        SQL.Add('  AND RDelKbn     = 0          ');
		ParamByName('pMstKbn').AsInteger := nMasterDivision;

        if ( Open() = false ) then
        begin
            // SQLｴﾗｰ
            m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, dqMasterData );
            with m_MjsMsgRec do
                MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
            Result := REQUISITE_EXIT;
            Exit;
        end;


        // 既に諸口ﾃﾞｰﾀが登録済みの場合、諸口登録DLGは表示しない
		if	( not EOF ) then
        begin
			fNoRecord := FALSE;
        end;

		Close();
    end;

	if ( fNoRecord = TRUE ) then
	begin
		if ( giReferFlag = REFER ) then
		begin
			dqMasterData.Close();
			dqMasterData.Free();

			Result := REQUISITE_EXIT;
			Exit;
		end;

        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理 <041>
        //
        //  諸口登録時の制御
        // -------------------------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // TMQueryをCloseする
            dqMasterData.Close();
            // 親会社DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, dqMasterData );

            dqMasterData.Close();
            dqMasterData.SQL.Clear();
            dqMasterData.SQL.Add('select * from HojyoMA        ');
            dqMasterData.SQL.Add('where MasterKbn = :pMstKbn   ');
            dqMasterData.SQL.Add(' and  Syokuchikbn = 1        ');
            dqMasterData.SQL.Add(' and  RDelKbn     = 0        ');
            dqMasterData.ParamByName('pMstKbn').AsInteger := nMasterDivision;

            if ( dqMasterData.Open() = false ) then
            begin
                // SQLｴﾗｰ
                m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, dqMasterData );
                with m_MjsMsgRec do
                    MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
                Result := REQUISITE_EXIT;
                Abort;
            end;

            // 親会社DBに「諸口」が存在していた場合は、諸口ﾏｽﾀ同期処理を行う
            if ( not dqMasterData.Eof ) then
            begin
//<061>               iMastKbn := dqMasterData.GetFld('MasterKbn').AsInteger;
                nPNCode  := dqMasterData.GetFld('NCode'    ).AsFloat;

                dqMasterData.Close();
                dqMasterData.SQL.Clear();
                dqMasterData.SQL.Add('select * from HojyoMA_Rel           ');
                dqMasterData.SQL.Add('where MasterKbn   = :pMstKbn        ');
                dqMasterData.SQL.Add(' and  NCode       = :pNCode         ');
                dqMasterData.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');
                dqMasterData.ParamByName('pMstKbn'     ).AsInteger := nMasterDivision;
                dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( dqMasterData.Open() = false ) then
                begin
                    // SQLｴﾗｰ
                    m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, dqMasterData );
                    with m_MjsMsgRec do
                        MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
                    Result := REQUISITE_EXIT;
                    Abort;
                end;

                if ( dqMasterData.Eof ) then
                        bRet := True
                else    bRet := False;

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                m_cDataModule.BeginTran( m_cDBSelect );

                try
                    // 親会社のHojyoMA_Relの更新
                    if ( bRet ) then    // 新規挿入
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('insert into HojyoMA_Rel (                ');
                        dqMasterData.SQL.Add(' MasterKbn,NCode,GrpSegNCode,RDelKbn_REL ');
                        dqMasterData.SQL.Add(') values (                               ');
                        dqMasterData.SQL.Add(' :pMstKbn,:pNCode,:pGrpSegNCode,0)       ');
                    end
                    else                // 更新
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('update HojyoMA_Rel set                    ');
                        dqMasterData.SQL.Add('    RDelKbn_REL = 0                       ');
                        dqMasterData.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP       ');
                        dqMasterData.SQL.Add('where  MasterKbn   = :pMstKbn             ');
                        dqMasterData.SQL.Add('  and  NCode       = :pNCode              ');
                        dqMasterData.SQL.Add('  and  GrpSegNCode = :pGrpSegNCode        ');
                    end;

                    dqMasterData.ParamByName('pMstKbn'     ).AsInteger := nMasterDivision;
                    dqMasterData.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                    dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    if ( dqMasterData.ExecSQL = false ) then
                    begin
                        MjsMessageBoxEx (Self,
                                         '自社への関連付けに失敗しました。',
                                         'マスタ同期', mjError, mjOk, mjDefOk);
                        Result := REQUISITE_EXIT;
                        Abort;
                    end;

                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = False ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback ( m_cDBSelect );
                        Result := REQUISITE_EXIT;
                        Abort;
                    end;

                    // <052> - ST
                    // 親社のSecHojyoDispInfoのﾒﾝﾃを行う

                    dqMasterData.Close();
                    dqMasterData.SQL.Clear();
                    dqMasterData.SQL.Add('select * from SecHojyoDispInfo   ');
                    dqMasterData.SQL.Add('where Opekbn          = :Opekbn  ');  // 使用区分
                    dqMasterData.SQL.Add('  and Masterkbn       = :Mstkbn  ');  // ﾏｽﾀ区分(101～110)
                    dqMasterData.SQL.Add('  and PlaceNCode      = :PNCode  ');  // ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
                    dqMasterData.SQL.Add('  and NoDispMasterkbn = :NMstKbn ');  // ﾏｽﾀ区分
                    dqMasterData.SQL.Add('  and NCode           = :NCode   ');  // 内部ｺｰﾄﾞ

                    dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                    dqMasterData.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                    dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                    dqMasterData.ParamByName('NMstKbn').AsInteger := nMasterDivision;
                    dqMasterData.ParamByName('NCode'  ).AsFloat   := nPNCode;

                    //  ｴﾗｰの判定
                    if	( not dqMasterData.Open() ) then
                    begin
                        m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, dqMasterData );
                        with m_MjsMsgRec do
                            MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
                        Result := REQUISITE_EXIT;
                        Abort;
                    end;

                    // 該当ﾚｺｰﾄﾞが存在していない場合は、表示ﾚｺｰﾄを生成する。
                    if	( dqMasterData.Eof ) then
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('insert into SecHojyoDispInfo  ( ');
                        dqMasterData.SQL.Add(' Opekbn,Masterkbn,PlaceNCode,   ');
                        dqMasterData.SQL.Add(' NoDispMasterKbn,NCode,DispKbn, ');
                        dqMasterData.SQL.Add(' UpdateTime ) values (          ');
                        dqMasterData.SQL.Add(' :Opekbn,:Mstkbn,:PNCode,       ');
                        dqMasterData.SQL.Add(' :NMstKbn,:NCode,:DispKbn,      ');
                        dqMasterData.SQL.Add(' CURRENT_TIMESTAMP )            ');

                        dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                        dqMasterData.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                        dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                        dqMasterData.ParamByName('NMstKbn').AsInteger := nMasterDivision;
                        dqMasterData.ParamByName('NCode'  ).AsFloat   := nPNCode;
                        dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                        if	( not dqMasterData.ExecSQL() ) then
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback( m_cDBSelect );
                            Result := REQUISITE_EXIT;
                            Abort;
                        end;
                    end
                    else
                    begin
                        dqMasterData.Close();
                        dqMasterData.SQL.Clear();
                        dqMasterData.SQL.Add('update SecHojyoDispInfo set      ');
                        dqMasterData.SQL.Add(' DispKbn    = :DispKbn,          ');
                        dqMasterData.SQL.Add(' UpdateTime = CURRENT_TIMESTAMP  ');
                        dqMasterData.SQL.Add('where Opekbn          = :Opekbn  ');
                        dqMasterData.SQL.Add('  and Masterkbn       = :MstKbn  ');
                        dqMasterData.SQL.Add('  and PlaceNCode      = :PNCode  ');
                        dqMasterData.SQL.Add('  and NoDispMasterKbn = :NMstKbn ');
                        dqMasterData.SQL.Add('  and NCode           = :NCode   ');

                        dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                        dqMasterData.ParamByName('MstKbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                        dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                        dqMasterData.ParamByName('NMstKbn').AsInteger := nMasterDivision;
                        dqMasterData.ParamByName('NCode'  ).AsFloat   := nPNCode;
                        dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                        if	( not dqMasterData.ExecSQL() ) then
                        begin
                            // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                            // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                            m_cDataModule.Rollback( m_cDBSelect );
                            Result := REQUISITE_EXIT;
                            Abort;
                        end;
                    end;
                    // <052> - ED
                except
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback ( m_cDBSelect );
                    Result := REQUISITE_EXIT;
                    Abort;
                end;

                // 親会社DBに対してｺﾐｯﾄを実行する
                m_cDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してｺﾐｯﾄを実行する
                m_cDataModule.Commit ( m_cDBSelect );
                Result := REQUISITE_OK;
                Exit;
            end;
        end;
        // ↑↑↑<041>
        // -------------------------------------------------------------------------


        // -------------------------------------------------------------------------
        //      諸口ﾀﾞｲｱﾛｸﾞの表示
        // -------------------------------------------------------------------------
		cDlgRequisite := TJNTCRP016002f.fnCreateDialog (Pointer (m_pRec),
                                                        Self,
                                                        m_cDBSelect,
                                                        nMasterDivision,
                                                        nCodeDigit,
                                                        nCodeAttribute,
                                                        m_strValidCharacters,
                                                        @m_SyncMaster); // <041>

        // <026>
        if ( cDlgRequisite.ShowModal () = mrCancel ) then
        begin
            nReturn := REQUISITE_CANCEL
        end
		else
        begin
			m_bHojyoTree2 [nMasterDivision - 21] := 1;
            m_NewRecord := TRUE;
        end;
        // <026>

		cDlgRequisite.Close();
		cDlgRequisite.Free();
	end;

	dqMasterData.Close();
	dqMasterData.Free();

	Result := nReturn;

end;

//-----------------------------------------------------------------------------
// fnRebuildTreeViewItems()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾂﾘｰﾋﾞｭｰ再作成処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnRebuildTreeViewItems ();
var
    stWorkRec   :   ^TreeViewRec;
    cNode       :   TTreeNode;
    nCount      :   Integer;
    strItemName :   String;
begin
	m_fUnderConstruction    :=  TRUE;

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;
        Dispose (stWorkRec);
    end;

    for nCount := 1 to 5 do
    begin
        if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
        begin
            strItemName := m_stSelectItem [nCount].strItemCaption + '体系';
            Break;
        end;
    end;

	if ( CmnTreeView.Items.Count > 0 ) then
		CmnTreeView.Items [0].Delete();

    New (stWorkRec);
    stWorkRec^.nDivision    :=  9;
    stWorkRec^.strExCode    :=  '          ';
    stWorkRec^.strExNCode   :=  0;
    stWorkRec^.strName      :=  strItemName;

    cNode                   :=  CmnTreeView.Items.AddChildObject (nil, strItemName, stWorkRec);
    cNode.ImageIndex        :=  0;
	cNode.SelectedIndex     :=  2;

	CmnTreeView.Items.BeginUpdate;

    fnCreateTreeViewItems (cNode, 0);

	CmnTreeView.Items.EndUpdate;

	fnDeleteCheck();

	if ( m_nSaveTreeRecCount > 0 ) then
		fnDeleteTreeViewUselessItems();

	fnAddTreeViewUnconnectedItems();

	Prog1.Position  :=  50;

	m_fUnderConstruction    :=  FALSE;
    m_strExCodeCurrent      :=  stWorkRec^.strExCode;
    m_strExNCodeCurrent     :=  stWorkRec^.strExNCode;
    cNode.Selected  	    :=  TRUE;

    CmnTreeView.FullExpand();

end;

//-----------------------------------------------------------------------------
// fnCreateTreeViewItems()
//      PARAM   : cSrcNode  :   ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)
//                iKbn      :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCreateTreeViewItems (cSrcNode: TTreeNode; iKbn: Integer);
var
	dqMasterData    :   TMQuery;
    stWorkRec       :   ^TreeViewRec;
	iCount		    :   Integer;
	iCount2		    :   Integer;
begin

    stWorkRec		:= cSrcNode.Data;
    dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	iCount  :=  0;
	iCount2	:=  0;

    with dqMasterData do
    begin
		if ( iKbn = 0 ) then
		begin
			Close();
			SQL.Clear();
            SQL.Add('SELECT Count(ht.BasedNCode) as Count FROM HojyoTree ht, HojyoMA hm  '
                +   'WHERE   ht.MasterKbn = :nMasterKbn  AND ht.SumNCode = :strSumCode   '
                +   '    AND hm.Masterkbn = ht.MasterKbn AND hm.RDelKbn  = 0             '
                +   '    AND hm.NCode     = ht.BasedNCode                                ');
	        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
            ParamByName ('strSumCode').AsFloat      := stWorkRec^.strExNCode;
			Open();

			if ( not EOF ) then
				iCount	:= GetFld('Count').AsInteger
			else
				iCount 	:= 0;
		end;

		Close();
		SQL.Clear();
        SQL.Add('SELECT                                     '
            +   '   ht.SumNCode, ht.BasedNCode, hm.SumKbn,  '
            +   '   hm.SimpleName, hm.NCode, hm.GCode,      '
            +   '   hm.SyokuchiKbn                          '
            +   'FROM HojyoTree ht, HojyoMA hm              '
            +   'WHERE ht.MasterKbn = :nMasterKbn           '
            +   '  AND ht.SumNCode  = :strSumCode           '
            +   '  AND hm.Masterkbn = ht.MasterKbn          '
            +   '  AND hm.RDelKbn   = 0                     '
            +   '  AND hm.NCode     = ht.BasedNCode         '
            +   'ORDER BY EntNo DESC                        ');
        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
        ParamByName ('strSumCode').AsFloat      := stWorkRec^.strExNCode;
		Open();

		if ( iKbn = 0 ) then
			iCount2	:= 1;

		while ( not EOF ) do
		begin
            fnCreateTreeViewItem (dqMasterData, cSrcNode);

			if ( iKbn = 0 ) then
			begin
				if ( iCount <> 0 ) then
				begin
					Prog1.Position	:= iCount2 * 40 div iCount;
					inc(iCount2);
				end;
			end;

			Next;
		end;

		Close();
    end;

	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// fnCreateTreeViewItem()
//      PARAM   : dqMasterData  :   読込ｸｴﾘｰ
//                cSrcNode      :   ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)
//      VAR     :
//      RETURN  :
//      MEMO    : ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCreateTreeViewItem (dqMasterData: TMQuery; cNodeSrc: TTreeNode);
var
	cNode       :   TTreeNode;
	cNodeCheck  :	TTreeNode;
	stChildRec  :   ^TreeViewRec;
	stRecCheck  :   ^TreeViewRec;
	stRecCheck2 :   ^TreeViewRec;
	nCount	    :   Integer;
	fCheckNG    :   Boolean;
    sCode       :   String;
	strExCode   :   String;
    strExNCode  :   Extended;
begin

	New (stChildRec);

    with dqMasterData do
    begin
        strExCode	:= FieldByName ('GCode').AsString;
        strExNCode  := FieldByName ('NCode').AsFloat;

		if ( m_nCurrentCodeAttr <= 1 ) then
			strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

		stChildRec^.strExCode	:= strExCode;                                   // 外部ｺｰﾄﾞ
        stChildRec^.strExNCode  := strExNCode;                                  // 内部ｺｰﾄﾞ
		stChildRec^.nDivision	:= FieldByName ('SumKbn'    ).AsInteger;        // 実在/合計区分
		stChildRec^.strName		:= FieldByName ('SimpleName').AsString;         // 簡略名称

        if ( FieldByName('SyokuchiKbn').AsInteger = 1 ) then
			stChildRec^.nDivision	:= DIVISION_GENERAL;

		fCheckNG	:= FALSE;

		if (( stChildRec^.nDivision <> 0 ) and ( stChildRec^.nDivision <> DIVISION_GENERAL )) then
		begin
			cNodeCheck	:= cNodeSrc;
			stRecCheck2	:= cNodeCheck.Data;

			while TRUE do
			begin
				stRecCheck	:= cNodeCheck.Data;

				if ( CompareStr (strExCode, stRecCheck^.strExCode) = 0 ) then
				begin
                    if ( fnHojyoTreeDelete(strExNCode, stRecCheck2^.strExNCode) = 0 ) then
						m_DeleteCheck	:= FALSE;

					fCheckNG	:= TRUE;
					Break;
				end;

				cNodeCheck	:= cNodeCheck.Parent;

				if	( cNodeCheck = nil ) then
					Break;
			end;
		end;

		if ( fCheckNG = TRUE ) then
		begin
			if ( m_nSaveTreeRecCount >= m_nSaveTreeRecMax ) then
			begin
				SetLength (m_stSaveTreeRec, m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS);

				for	nCount := m_nSaveTreeRecMax to m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS - 1 do
				begin
                    m_stSaveTreeRec [nCount].strSumNCode    := 0;
					m_stSaveTreeRec [nCount].strBasedNCode	:= 0;
				end;

				m_nSaveTreeRecMax	:= m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS;
			end;

            m_stSaveTreeRec [m_nSaveTreeRecCount].strSumNCode	:= FieldByName ('SumNCode'  ).AsFloat;
            m_stSaveTreeRec [m_nSaveTreeRecCount].strBasedNCode := FieldByName ('BasedNCode').AsFloat;
			m_nSaveTreeRecCount	:= m_nSaveTreeRecCount + 1;
			Exit;
		end;

        // 数値属性
        if ( m_nCurrentCodeAttr = 0 ) then
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 0)
        // 数値属性前ｾﾞﾛ有
        else if ( m_nCurrentCodeAttr = 1 ) then
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 1)
        // ﾌﾘｰ属性
        else
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 2);

        // ﾉｰﾄﾞの作成
        cNode	:= CmnTreeView.Items.AddChildObjectFirst (cNodeSrc, MakeDspString(sCode, stChildRec^.strName), stChildRec);

        if (( stChildRec^.nDivision = 0 ) or ( stChildRec^.nDivision = DIVISION_GENERAL )) then
        begin
        	cNode.ImageIndex    := 1;
            cNode.SelectedIndex := 3;
        end
        else
        begin
        	cNode.ImageIndex    := 0;
            cNode.SelectedIndex := 2;

            fnCreateTreeViewItems (cNode, 1);
		end;
	end;

end;

//-----------------------------------------------------------------------------
// fnHojyoTreeDelete()
//      PARAM   : strPreExCode  :   親内部ｺｰﾄﾞ
//                strExCode     :   内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Integer       :   0:正常 -1:異常
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP016000f.fnHojyoTreeDelete(strPreExCode, strExCode: Extended): Integer;
var
	DmqData :   TMQuery;
begin

    Result  :=  -1;
	DmqData	:=  TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqData);

	// ﾒｰﾙ会計未採用、通常処理のときだけ削除可能。それ以外はｺｰﾄﾞが同じでも削除不可。
//<012>	if ( giReferFlag	= NORMAL ) then
    if ( m_cJNTArea.IsDelete ) then             // <012>
	begin
        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
		m_cDataModule.BeginTran(m_cDBSelect);

        with DmqData do
        begin
		    Close();
            SQL.Clear();
            SQL.Add('DELETE FROM HojyoTree      '
		        +  'WHERE SumNCode   = :SCode   '
		        +  '  AND BasedNCode = :BCode   '
		        +  '  AND MasterKbn  = :MKbn    ');

		    ParamByName('SCode').AsFloat 	:= strExCode;
		    ParamByName('BCode').AsFloat 	:= strPreExCode;
		    ParamByName('MKbn').AsInteger	:= m_nCurrentMasterDiv;

    		if ( ExecSQL() = FALSE ) then
    		begin
                // ﾛｰﾙﾊﾞｯｸ
     			m_cDataModule.Rollback(m_cDBSelect);
    			Close();
			    Free();
    			Exit;
    		end;
        end;

        // ｺﾐｯﾄ
        m_cDataModule.Commit(m_cDBSelect);
    end;

	Result  :=  0;

	DmqData.Close();
	DmqData.Free();

end;

//-----------------------------------------------------------------------------
// fnDeleteCheck()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.fnDeleteCheck();
var
	stCap   :   String;
begin

	if ( m_DeleteCheck = FALSE ) then
	begin
		stCap   :=  '共通補助登録';

		if ( giReferFlag = NORMAL ) then
			MjsMessageBoxEx( AOwner,    // <009>
                        '加算情報の不整合がありました。不整合部分を削除しましたので、再度加算情報を見直して下さい。'
                        ,stCap,mjInformation,mjOK,mjDefOK )
		else
			MjsMessageBoxEx( AOwner,    // <009>
                        '加算情報の不整合がありました。登録権利がありませんので、復旧は行いませんでした。'
                        ,stCap,mjInformation,mjOK,mjDefOK );

		m_DeleteCheck   :=  TRUE;
	end;

end;

//-----------------------------------------------------------------------------
// fnDeleteTreeViewUselessItems()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 補助登録処理 ﾂﾘｰﾋﾞｭｰ不要ｱｲﾃﾑ 削除処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnDeleteTreeViewUselessItems ();
var
	dqMasterTree    :   TMQuery;
	nCount		    :   Integer;
begin


	dqMasterTree	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);

	with dqMasterTree do
	begin
		for	nCount := 0 to m_nSaveTreeRecCount - 1 do
		begin
			Close();
			SQL.Clear();
            SQL.Add('SELECT MasterKbn FROM HojyoTree        '
			    +   'WHERE MasterKbn  = :nMasterDivision    '
			    +   '  AND SumCode    = :strSumCode         '
                +   '  AND BasedNCode = :strBasedCode       ');
			Open();

            if EOF then
				Continue;

			Close();
			SQL.Clear();
            SQL.Add('DELETE FROM HojyoTree                  '
			    +   'WHERE MasterKbn  = :nMasterDivision    '
			    +   '  AND SumNCode   = :strSumNCode        '
                +   '  AND BasedNCode = :strBasedNCode      ');
			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strSumNCode'    ).AsFloat 	:= m_stSaveTreeRec [nCount].strSumNCode;
			ParamByName ('strBasedNCode'  ).AsFloat 	:= m_stSaveTreeRec [nCount].strBasedNCode;

			if	( not ExecSQL() ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

				fnOutputDBErrorMessage();
				dqMasterTree.Close();
				dqMasterTree.Free();
				Exit;
			end;

			m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
		end;
    end;

	dqMasterTree.Close();
	dqMasterTree.Free();

end;

//-----------------------------------------------------------------------------
// fnOutputDBErrorMessage()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : DBｴﾗｰﾒｯｾｰｼﾞ出力処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnOutputDBErrorMessage ();
begin

	if ( m_nDBErrorCode <> 0 ) then
	begin
		case ( m_nDBErrorCode ) of
			1:	m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 0, 1);
			2:	begin
					m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 5);
					m_MjsMsgRec.sMsg	:= '固定体系区分が固定' + m_MjsMsgRec.sMsg;
				end;
			3:	begin
					m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 18);
					m_MjsMsgRec.sMsg	:= '子供が存在するため削除' + m_MjsMsgRec.sMsg;
				end;
			4:	begin
					m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 18);
					m_MjsMsgRec.sMsg	:= '仕訳が存在するため削除' + m_MjsMsgRec.sMsg;
				end;
			5:	begin
					m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 18);
					m_MjsMsgRec.sMsg	:= '諸口以外のレコードが存在するため削除' + m_MjsMsgRec.sMsg;
				end;
			6:	begin
                	if ( m_nCurrentMasterDiv = 22 ) then
					begin
                    	m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
	   					m_MjsMsgRec.sMsg	:= '削除できません。（支払予定データが存在するため削除' + m_MjsMsgRec.sMsg + '）';
					end
					else if ( m_nCurrentMasterDiv = 25 ) then
					begin
						m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
	   					m_MjsMsgRec.sMsg	:= '削除できません。（経費精算データが存在するため削除' + m_MjsMsgRec.sMsg + '）';
					end;
				end;
			7:	begin
					m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
   					m_MjsMsgRec.sMsg	:= '部署情報が存在するため削除' + m_MjsMsgRec.sMsg;
				end;
			8:	begin
					m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,18);
   					m_MjsMsgRec.sMsg	:= '未連結仕訳(部署or分散)が存在するため削除' + m_MjsMsgRec.sMsg;
				end;
// <040> ↓
            -193, -196:             // 重複ｴﾗｰ
			    m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 10000, 10017);
            -210:                   // ﾛｯｸｴﾗｰ
			    m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 10000, 10016);
// <040> ↑
		end;
	end;

    MJSMessageBoxEx (AOwner,    // <009>
                     m_MjsMsgRec.sMsg,
                     m_MjsMsgRec.sTitle,
// <040>                     m_pRec^.m_ProgramName,
                     m_MjsMsgRec.icontype,
                     m_MjsMsgRec.btntype,
                     m_MjsMsgRec.btndef,
                     m_MjsMsgRec.LogType
                    );

    m_nDBErrorCode	:= 0;

end;

//-----------------------------------------------------------------------------
// fnAddTreeViewUnconnectedItems()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾂﾘｰﾋﾞｭｰ未接続ｱｲﾃﾑ追加処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnAddTreeViewUnconnectedItems ();
var
	dqMasterData    :   TMQuery;
	dqMasterTree    :   TMQuery;
	cNodeTarget	    :   TTreeNode;
	stRecTarget	    :   ^TreeViewRec;
	nEntryNo	    :   Integer;
	iCount		    :   Integer;
	iCount2		    :   Integer;
    iTreeCnt        :   Integer;
    sCode           :   String;
begin

	dqMasterData	:= TMQuery.Create (Self);
	dqMasterTree	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);


	with dqMasterData do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT Count(GCode) as Count FROM HojyoMA  '
            +   'WHERE MasterKbn = :nMasterDivision         '
            +   '  AND RDelKbn   = 0                        ');
		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		Open();

		if not EOF then
			iCount	:= GetFld('Count').AsInteger
		else
			iCount	:= 0;

        // HojyoTreeにﾚｺｰﾄﾞが存在するか確認
        Close();
        SQL.Clear();
        SQL.Add('SELECT Count(BasedNCode) as Count FROM HojyoTree   '
            +   'WHERE MasterKbn = :nMasterDivision                 ');
        ParamByName('nMasterDivision').AsInteger    := m_nCurrentMasterDiv;
        Open();

        if not EOF then
            iTreeCnt    := GetFld('Count').AsInteger
        else
            iTreeCnt    := 0;


        // HojyoTreeにﾚｺｰﾄﾞが1件もなかったときは未接続ｱｲﾃﾑすべてを呼び出す
        if ( iTreeCnt = 0 ) then
        begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT GCode, SumKbn, SimpleName, NCode FROM HojyoMA   '
                +   'WHERE MasterKbn = :nMasterDivision                     '
                +   '  AND RDelKbn   = 0                                    ');
        end
        // HojyoTreeに1件でもﾚｺｰﾄﾞがあるときはどのｺｰﾄﾞが未接続が検索
        else
        begin
	    	Close();
            SQL.Clear();
            SQL.Add('SELECT DISTINCT hm.SumKbn, hm.GCode, hm.SimpleName, hm.NCode   '
                +   'FROM HojyoMA hm INNER JOIN HojyoTree                           '
                +   '  ON NOT EXISTS (SELECT ht.SumNCode FROM HojyoTree ht          '
                +   '      WHERE   hm.MasterKbn = ht.MasterKbn                      '
                +   '          AND hm.NCode     = ht.BasedNCode)                    '
                +   'WHERE hm.MasterKbn = :nMasterDivision AND hm.RDelKbn = 0       '
                +   'ORDER BY hm.SumKbn, hm.GCode                                   ');
        end;

	    ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		Open();

		iCount2	:= 1;

		while not EOF do
		begin
            nEntryNo	:= fnGetMasterTreeEntryNoFinal (dqMasterTree, 0);

			with dqMasterTree do
			begin
				Close();
				SQL.Clear();
                SQL.Add('INSERT INTO HojyoTree (    '
                    +   '    MasterKbn              '
                    +   '   ,PatternNo              '
                    +   '   ,SumNCode               '
                    +   '   ,EntNo                  '
                    +   '   ,BasedNCode             '
                    +   '   ,UpdTantoNCode          '
                    +   ') VALUES (                 '
                    +   '    :nMasterDivision       '
                    +   '   ,0                      '
                    +   '   ,:strSumCode            '
                    +   '   ,:nEntryNo              '
                    +   '   ,:strBasedCode          '
                    +   '   ,:UpdTantoNCode         '
                    +   ')                          ');

                ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				ParamByName ('strSumCode'     ).AsFloat 	:= 0;
				ParamByName ('nEntryNo'       ).AsInteger	:= nEntryNo;
                ParamByName ('strBasedCode'   ).AsFloat 	:= dqMasterData.FieldByName ('NCode').AsFloat;
                ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;
				ExecSQL();

                // ｴﾗｰ
				if	( Status <> 0 ) then  Break;

				m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
			end;

			New (stRecTarget);

			stRecTarget^.nDivision	:= FieldByName ('SumKbn'    ).AsInteger;
			stRecTarget^.strExCode	:= FieldByName ('GCode'     ).AsString;
            stRecTarget^.strExNCode := FieldbyName ('NCode'     ).AsFloat;
			stRecTarget^.strName	:= FieldByName ('SimpleName').AsString;

			cNodeTarget	:= CmnTreeView.Items [0];

            // 数値属性
            if m_nCurrentCodeAttr = 0 then
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 0)
            // 数値前ｾﾞﾛ有
            else if m_nCurrentCodeAttr = 1 then
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 2);

            // ﾉｰﾄﾞの追加
            cNodeTarget	:= CmnTreeView.Items.AddChildObject (cNodeTarget, MakeDspString(sCode, stRecTarget^.strName), stRecTarget);

            // 実在
			if ( stRecTarget^.nDivision = 0 ) then
			begin
				cNodeTarget.ImageIndex		:= 1;
				cNodeTarget.SelectedIndex	:= 3;
			end
            // 合計
			else
			begin
				cNodeTarget.ImageIndex		:= 0;
				cNodeTarget.SelectedIndex	:= 2;
			end;

			if ( stRecTarget^.nDivision = 1 ) then
				fnCreateTreeViewItems (cNodeTarget, 1);

			if ( iCount <> 0 ) then
			begin
				Prog1.Position	:= (iCount2 * 10 div iCount) + 40;
				inc(iCount2);
			end;

			Next;
		end;
	end;

	dqMasterData.Free();
	dqMasterTree.Free();

end;

//-----------------------------------------------------------------------------
// fnSetParentItemsInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 現在選択されている親に対する子情報をｾｯﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnSetParentItemsInfo ();
var
    dqMasterData    :   TMQuery;
    stWorkRec       :   ^TreeViewRec;
    cNode           :   TTreeNode;
	strFormat	    :   String;
	strCaption	    :   String;
	iCount		    :   Integer;
	iCount2		    :   Integer;
begin

	cNode		:= CmnTreeView.Selected;
	stWorkRec   := cNode.Data;

    if ( stWorkRec^.strExCode = '' ) then
		Exit;

	m_strExCodeCurrent  := stWorkRec^.strExCode;
    m_strExNCodeCurrent := stWorkRec^.strExNCode;

	strCaption	:= '';

	if ( stWorkRec^.nDivision <> 9 ) then
	begin
    	if ( m_nCurrentCodeAttr <= 1 ) then
		begin
        	case ( m_nCurrentCodeAttr ) of
            	0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            	1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        	end;

        	strCaption	:= Format (strFormat, [StrToInt64 (Trim (stWorkRec^.strExCode))]);
			strCaption	:= strCaption + ' ';
    	end
		else
			strCaption	:= stWorkRec^.strExCode + ' ';
	end;

    strCaption				:= strCaption + stWorkRec^.strName;
	StdCmnTab.BorderCaption := strCaption;
	DtlCmnTab.BorderCaption := strCaption;


    dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	StdCmnMemDataExist.Active	:= FALSE;
	StdCmnMemDataTotal.Active	:= FALSE;
	StdCmnMemDataExist.Active	:= TRUE;
	StdCmnMemDataTotal.Active	:= TRUE;

	StdCmnMemDataCustomer.Open;
	StdCmnMemDataSupplier.Open;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

	StdCmnGridExist.BeginUpdate;
	StdCmnGridTotal.BeginUpdate;

    with (dqMasterData) do
    begin
		Close();
    	SQL.Clear();
        SQL.Add('SELECT Count(ht.BasedNCode) as Count FROM HojyoTree ht, HojyoMA hm '
            +   'LEFT OUTER JOIN MFusenInfo fi ON                                   '
            +   '  (fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode)            '
		    +   'WHERE ht.MasterKbn  = :nMasterDivision                             '
            +   '  AND ht.SumNCode   = :strExCode                                   '
            +   '  AND ht.MasterKbn  = hm.MasterKbn                                 '
            +   '  AND hm.RDelKbn    = 0                                            '
            +   '  AND ht.BasedNCode = hm.NCode                                     ');

		ParamByName('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName('strExCode').AsFloat			:= m_strExNCodeCurrent;
		Open();

		if ( not EOF ) then
			    iCount	:= GetFld('Count').AsInteger
		else    iCount	:= 0;

		Close();
		SQL.Clear();
        SQL.Add('SELECT ht.BasedNCode, hm.SumKbn, hm.Renso, hm.LongName, hm.SimpleName, '
		    +   '       hm.HojyoKbn1, hm.HojyoKbn2, fi.FusenKbn, fi.FusenCmnt, hm.GCode '
            +   'FROM HojyoTree ht, HojyoMA hm                                          '
            +   'LEFT OUTER JOIN MFusenInfo fi ON                                       '
		    +   '      fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode              '
		    +   'WHERE ht.MasterKbn  = :nMasterDivision AND ht.SumNCode = :strExCode    '
		    +   '  AND ht.MasterKbn  = hm.MasterKbn     AND hm.RDelKbn  = 0             '
		    +   '  AND ht.BasedNCode = hm.NCode    ORDER BY ht.EntNo                    ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat 	:= m_strExNCodeCurrent;
		Open();

		iCount2	:= 1;

		while not EOF do
		begin
			fnSetGridMemData (dqMasterData);

			if ( iCount <> 0 ) then
			begin
				Prog1.Position	:= (iCount2 * 100 div iCount) + 50;
				inc(iCount2);
			end;

			Next;
		end;

        Close();
    end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
    StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

    if ( m_nGridExistRecords <> 0 ) then
        StdCmnMemDataExist.First();
    if ( m_nGridTotalRecords <> 0 ) then
        StdCmnMemDataTotal.First();

    StdCmnGridExist.EndUpdate;
	StdCmnGridTotal.EndUpdate;

	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// fnSetGridMemData()
//      PARAM   : dqMasterData  :   読込ｸｴﾘｰ
//      VAR     :
//      RETURN  :
//      MEMO    : 実在/合計補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnSetGridMemData (dqMasterData: TMQuery);
var
	strFormat   : String;
	strExCode   : String;
    strExNCode  : Extended;
begin

	m_fUpdateRecord	:= FALSE;

	with dqMasterData do
	begin
        strExCode	:= FieldByName('GCode')     .AsString;
        strExNCode	:= FieldByName('BasedNCode').AsFloat;

		if ( m_nCurrentCodeAttr <= 1 ) then
		begin
			case (m_nCurrentCodeAttr) of
				0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
				1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
			end;

			strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
		end;

		if ( FieldByName ('SumKbn').AsInteger = 0 ) then
		begin
			StdCmnMemDataExist.Append();
			StdCmnMemDataExist.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			StdCmnMemDataExist.FieldByName('strExCode'     ).AsString	:= strExCode;
            StdCmnMemDataExist.FieldByName('strAssociation').AsString	:= FieldByName ('Renso'   ).AsString;
			StdCmnMemDataExist.FieldByName('strName'       ).AsString	:= FieldByName ('LongName'  ).AsString;
			StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString	:= FieldByName ('SimpleName').AsString;
			StdCmnMemDataExist.FieldByName('strComment'    ).AsString	:= FieldByName ('FusenCmnt' ).AsString;
            StdCmnMemDataExist.FieldByName('strExNCode'    ).AsFloat	:= strExNCode;
			StdCmnMemDataExist.Post();

			m_nGridExistRecords	:= m_nGridExistRecords + 1;
		end
		else
		begin
			StdCmnMemDataTotal.Append();
			StdCmnMemDataTotal.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			StdCmnMemDataTotal.FieldByName('strExCode'     ).AsString   := strExCode;
            StdCmnMemDataTotal.FieldByName('strAssociation').AsString   := FieldByName ('Renso'   ).AsString;
			StdCmnMemDataTotal.FieldByName('strName'       ).AsString   := FieldByName ('LongName'  ).AsString;
			StdCmnMemDataTotal.FieldByName('strNameSimple' ).AsString   := FieldByName ('SimpleName').AsString;
			StdCmnMemDataTotal.FieldByName('strComment'    ).AsString	:= FieldByName ('FusenCmnt' ).AsString;
            StdCmnMemDataTotal.FieldByName('strExNCode'    ).AsFloat	:= strExNCode;
			StdCmnMemDataTotal.Post();

			m_nGridTotalRecords	:= m_nGridTotalRecords + 1;
		end;
	end;

	m_fUpdateRecord	:= TRUE;

end;

//-----------------------------------------------------------------------------
// fnStdCmnMemDataExistBeforePost()
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 実在補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnStdCmnMemDataExistBeforePost (DataSet: TDataSet);
var
    cFieldWork  :   TField;
    fValueCheck :   Boolean;
    strExNCode  :   Extended;
    strExCode   :   String;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

	fValueCheck :=  TRUE;

    if ( m_fUpdateRecord ) then
    begin
        with DataSet do
        begin
            cFieldWork	:= FieldByName ('strExCode');

			if ( not fnCheckExCodeValidCharacter (cFieldWork.AsString) ) then
			begin
				cFieldWork.FocusControl();
				Abort;
			end;

			if ( fValueCheck and ( StdCmnMemDataExist.State in [dsInsert] )) then
			begin
				if ( m_nCurrentCodeAttr <= 1 ) then
				begin
	                if ( StrToInt64 (Trim (cFieldWork.AsString)) = 0 ) then
						fValueCheck	:= FALSE;
				end
				else
				begin
					if ( Trim (cFieldWork.AsString) = '0' ) then
						fValueCheck	:= FALSE;
				end;
			end;

			if ( fValueCheck and (StdCmnMemDataExist.State in [dsInsert] )) then
			begin
				if ( not fnCheckMasterDataRecordValid (cFieldWork.AsString) ) then
					fValueCheck	:= FALSE;
			end;

			if ( fValueCheck = TRUE ) then
			begin
				m_stMasterData.nDivision		:= 0;
                m_stMasterData.strExNCodeParent	:= m_strExNCodeCurrent;
				m_stMasterData.strExCode		:= StdCmnMemDataExist.FieldByName ('strExCode'     ).AsString;
				m_stMasterData.strAssociation	:= StdCmnMemDataExist.FieldByName ('strAssociation').AsString;
				m_stMasterData.strName			:= StdCmnMemDataExist.FieldByName ('strName'       ).AsString;
				m_stMasterData.strNameSimple	:= StdCmnMemDataExist.FieldByName ('strNameSimple' ).AsString;

                if ( DataSet.State = dsInsert ) then
                begin
                    // 内部ｺｰﾄﾞを取得する
                    gfnGetExNCode('HojyoMA',strExNCode);
                    // 内部ｺｰﾄﾞをCmnMemdataExistにPostする
                    StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat := strExNCode;
                    m_stMasterData.strExNCode       := strExNCode;
                end
                else
                    m_stMasterData.strExNCode       := StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat;

                m_stMasterData.nAssDivision01	:=  0;
                m_stMasterData.nAssDivision02	:=  0;
				m_stMasterData.fDetails	        :=  FALSE;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <041>
                //
                //  親子同時に同一ｺｰﾄﾞを指定し、一覧(実在)画面でPostした場合の処理
                //  通常ならば、ｺｰﾄﾞ指定時で同期関連付を行うが、同時同一ｺｰﾄﾞの場合
                //  の考慮が必要。
                // -------------------------------------------------------------------------
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( StdCmnMemDataExist.State in [dsInsert] ) then
                begin
                    if ( m_nCurrentCodeAttr <= 1 ) then
                            strExCode := Format ('%.16d', [StrToInt64 (Trim (cFieldWork.AsString))])    // 数値属性
                    else    strExCode := TrimRight (cFieldWork.AsString);                               // 文字属性

                    case fnCorpRelation ( strExCode, 0 ) of
                        0:  begin
                                // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                            end;
                        1:  begin
                                // 正常に関連付が行えた場合は、画面の再描画を行う
                                fnSetParentItemsInfo();
                                cFieldWork.FocusControl();
                                Abort;
                            end;
                        2:  begin
                                // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                                cFieldWork.FocusControl();
                                Abort;
                            end;
                        -1, -9: begin
                                // 実在合計不一致、例外ｴﾗｰ
                                Abort;
                            end;
                    end;
                end;
                // ↑↑↑<041>
                // -------------------------------------------------------------------------

                // 更新処理
                if ( not fnUpdateMasterRecord (strExNCode) ) then
				begin
					StdCmnMemDataExist.Cancel ();
					StdCmnGridExist.FocusedColumn := 1;
					Abort;
				end;

                // ↓↓↓<041>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( DataSet.State = dsInsert ) then
                begin
                    // 内部ｺｰﾄﾞをCmnMemdataExistにPostする
                    StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat := m_stMasterData.strExNCode;
                end;
                // ↑↑↑<041>
			end
            else
			begin
				Beep;
				Abort;
			end;
        end;
    end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----

end;

//-----------------------------------------------------------------------------
// fnStdCmnMemDataTotalBeforePost()
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 合計補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnStdCmnMemDataTotalBeforePost (DataSet: TDataSet);
var
	cFieldWork  : TField;
    fValueCheck : Boolean;
    strExNCode  : Extended;
    strExCode   : String;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

	fValueCheck	:= TRUE;

    if ( m_fUpdateRecord ) then
    begin
        with DataSet do
        begin
			cFieldWork	:= FieldByName ('strExCode');

			if ( not fnCheckExCodeValidCharacter (cFieldWork.AsString) ) then
			begin
				cFieldWork.FocusControl();
				Abort;
			end;

			if ( fValueCheck and (StdCmnMemDataTotal.State in [dsInsert]) ) then
			begin
				if ( m_nCurrentCodeAttr <= 1 ) then
				begin
	                if ( StrToInt64 (Trim (cFieldWork.AsString)) = 0 ) then
						fValueCheck	:= FALSE;
				end
				else
				begin
					if ( Trim (cFieldWork.AsString) = '0' ) then
						fValueCheck	:= FALSE;
				end;
			end;

			if ( fValueCheck and (StdCmnMemDataTotal.State in [dsInsert]) ) then
			begin
				if ( not fnCheckMasterDataRecordValid (cFieldWork.AsString) ) then
					fValueCheck	:= FALSE;
			end;

			if ( fValueCheck = TRUE ) then
			begin
				m_stMasterData.nDivision		:= 1;
                m_stMasterData.strExNCodeParent	:= m_strExNCodeCurrent;
				m_stMasterData.strExCode		:= StdCmnMemDataTotal.FieldByName ('strExCode'     ).AsString;
				m_stMasterData.strAssociation	:= StdCmnMemDataTotal.FieldByName ('strAssociation').AsString;
				m_stMasterData.strName			:= StdCmnMemDataTotal.FieldByName ('strName'       ).AsString;
				m_stMasterData.strNameSimple	:= StdCmnMemDataTotal.FieldByName ('strNameSimple' ).AsString;
				m_stMasterData.nAssDivision01	:= 0;
				m_stMasterData.nAssDivision02	:= 0;
				m_stMasterData.fDetails			:= FALSE;

                if ( DataSet.State = dsInsert ) then
                begin
                    // 内部ｺｰﾄﾞを取得する
                    gfnGetExNCode('HojyoMA',strExNCode);
                    // 内部ｺｰﾄﾞをStdCmnMemDataTotalにPostする
                    StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat := strExNCode;
                    m_stMasterData.strExNCode   := strExNCode;
                end
                else
                    m_stMasterData.strExNCode   :=  StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <041>
                //
                //  親子同時に同一ｺｰﾄﾞを指定し、一覧(合計)画面でPostした場合の処理
                //  通常ならば、ｺｰﾄﾞ指定時で同期関連付を行うが、同時同一ｺｰﾄﾞの場合
                //  の考慮が必要。
                // -------------------------------------------------------------------------
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( StdCmnMemDataTotal.State in [dsInsert] ) then
                begin
                    if ( m_nCurrentCodeAttr <= 1 ) then
                            strExCode := Format ('%.16d', [StrToInt64 (Trim (cFieldWork.AsString))])    // 数値属性
                    else    strExCode := TrimRight (cFieldWork.AsString);                               // 文字属性

                    case fnCorpRelation ( strExCode, 1 ) of
                        0:  begin
                                // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                            end;
                        1:  begin
                                // 正常に関連付が行えた場合は、画面の再描画を行う
                                fnSetParentItemsInfo();
                                cFieldWork.FocusControl();
                                Abort;
                            end;
                        2:  begin
                                // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                                cFieldWork.FocusControl();
                                Abort;
                            end;
                        -1, -9: begin
                                // 実在合計不一致、例外ｴﾗｰ
                                Abort;
                            end;
                    end;
                end;
                // ↑↑↑<041>
                // -------------------------------------------------------------------------

                // 更新処理
                if ( not fnUpdateMasterRecord (strExNCode) ) then
				begin
					StdCmnMemDataTotal.Cancel ();
					StdCmnGridTotal.FocusedColumn := 1;
					Abort;
				end;

                // ↓↓↓<041>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( DataSet.State = dsInsert ) then
                begin
                    // 内部ｺｰﾄﾞをStdCmnMemDataTotalにPostする
                    StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat := m_stMasterData.strExNCode;
                end;
                // ↑↑↑<041>
			end
            else
			begin
				Beep;
				Abort;
			end;
        end;
    end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----

end;

//-----------------------------------------------------------------------------
// fnCheckExCodeValidCharacter()
//      PARAM   : strExCode :   外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE:正常 FALSE:異常
//      MEMO    : 外部ｺｰﾄﾞ入力値ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnCheckExCodeValidCharacter (strExCode: String): Boolean;
begin

	if ( Trim (strExCode) = '' ) then
	begin
		Beep();
		Result	:= FALSE;
		Exit;
	end;

    // ｺｰﾄﾞ属性: 数字
	if ( m_nCurrentCodeAttr <= 1 ) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if ( not fnCheckFreeCodeValidCharacter (strExCode) ) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;

end;

//-----------------------------------------------------------------------------
// fnCheckFreeCodeValidCharacter()
//      PARAM   : strExCode :   外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE:正常 FALSE:異常
//      MEMO    : ﾌﾘｰ属性時の外部ｺｰﾄﾞ入力値ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnCheckFreeCodeValidCharacter (strFreeCode: String): Boolean;
begin

	if ( Trim (strFreeCode) = '' ) then
	begin
		Result	:= TRUE;
		Exit;
	end;

    // 有効文字ﾁｪｯｸ
	if ( not JNTMASERRORCODECHECK (strFreeCode, m_strValidCharacters) ) then
	begin
		Beep;
		m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 21);
		MJSMessageBoxEx (AOwner,    // <009>
                         m_MjsMsgRec.sMsg,
                         m_pRec^.m_ProgramName,
                         m_MjsMsgRec.icontype,
                         m_MjsMsgRec.btntype,
                         m_MjsMsgRec.btndef,
                         m_MjsMsgRec.LogType
                        );
		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;

end;

//-----------------------------------------------------------------------------
// fnCheckMasterDataRecordValid()
//      PARAM   : strExCode :   外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE:正常 FALSE:異常
//      MEMO    : 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ
//-----------------------------------------------------------------------------
function    TJNTCRP016000f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
    dqMasterData    :   TMQuery;
begin

	if ( Trim (strExCode) = '' ) then
	begin
		Result	:= FALSE;
		Exit;
	end;

    if ( m_nCurrentCodeAttr <= 1 ) then
        strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

    dqMasterData    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    with dqMasterData do
    begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT * FROM HojyoMA                  '
            +   'WHERE MasterKbn = :nMasterDivision     '
            +   '  AND RDelKbn   = 0                    '
            +   '  AND GCode     = :strExCode           ');
		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;
		Open();

		if not EOF then
			Result	:= FALSE
        else
			Result	:= TRUE;

		Close();
    end;

	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterRecord()
//      PARAM   : nStrExNCode   :   内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE:正常 FALSE:異常
//      MEMO    : 汎用補助ﾏｽﾀ更新処理
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnUpdateMasterRecord (nStrExNCode:Extended): Boolean;
var
    fReturn	    :   Boolean;
	DmqData	    :   TMQuery;
//<061>	    nWorkNCode  :   Integer;
    strExCode:String;  //<066> ADD
begin
//<066> ADD St
	if	( m_nCurrentCodeAttr <= 1 ) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (m_stMasterData.strExCode))])
    else
        strExCode   := m_stMasterData.strExCode;
//<066> ADD Ed

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
    m_cDataModule.BeginTran ( m_cDBSelect );

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <041>
    //
    //  ｸﾞﾙｰﾌﾟ管理を行っている場合は、親会社ﾃﾞｰﾀﾍﾞｰｽに対してﾄﾗﾝｻﾞｸｼｮﾝを掛ける
    //  ｴﾗｰ時は、親会社ﾃﾞｰﾀﾍﾞｰｽに対してﾛｰﾙﾊﾞｯｸを行う
    //  正常時は、親会社ﾃﾞｰﾀﾍﾞｰｽに対してｺﾐｯﾄを行う
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始
        m_cDataModule.BeginTran ( m_SyncMaster.m_cPDBSelect ) ;
    end;

	//<DKAI>↓
	// 名称の改行コード削除
	m_stMasterData.strAssociation	:= fnDelCRLF(m_stMasterData.strAssociation);	// 連想
	m_stMasterData.strName			:= fnDelCRLF(m_stMasterData.strName);			// 正式名称
	m_stMasterData.strNameSimple	:= fnDelCRLF(m_stMasterData.strNameSimple);		// 簡略名称
	//<DKAI>↑

(*
    // MQueryの構築
	DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    // 親の外部ｺｰﾄﾞと子の外部ｺｰﾄﾞが同一の場合
	if ( m_stMasterData.strExCodeParent = m_stMasterData.strExCode ) then
	begin
        with DmqData do
        begin
            Close();
		    SQL.Clear();
            SQL.Add('SELECT GCode FROM HojyoMA  '
    		    +   'WHERE MasterKbn = :MKbn    '
    		    +   '  AND RDelKbn   = 0        '
    		    +   '  AND GCode     = :GCode   ');
    		ParamByName('MKbn' ).AsInteger := m_nCurrentMasterDiv;
    		ParamByName('GCode').AsString  := m_stMasterData.strExCode;

    		if ( Open() = FALSE ) then
            begin
    			DmqData.Close();
    			DmqData.Free();
    			Result := false;
    			exit;
    		end;

    		if not EOF then fReturn	:= true
    		else
            begin
                // 補助基本ﾏｽﾀ更新
                fReturn	:= fnUpdateMasterTreeRecord ( nStrExNCode );
            end;
        end;
    end
    else
    begin
        // 補助加算体系ﾏｽﾀ更新
        fReturn := fnUpdateMasterTreeRecord ( nStrExNCode );
    end;

    // ｴﾗｰ
    if not fReturn then
    begin
		Beep();
		fnOutputDBErrorMessage();

        // ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback ( m_cDBSelect );

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <041>
        begin
            // 親会社DBのﾛｰﾙﾊﾞｯｸ
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;

        // 異常終了
		Result	:= false;
		exit;
    end;
*) // HojyoMa更新後に移動<041>

    // 補助基本ﾏｽﾀ更新
    fReturn := fnUpdateMasterDataRecord ( nStrExNCode );

    // ｴﾗｰ
    if not fReturn then
    begin
		Beep();
		fnOutputDBErrorMessage();

        // ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback ( m_cDBSelect );

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <041>
        begin
            // 親会社DBのﾛｰﾙﾊﾞｯｸ
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;

        // 異常終了
		Result	:= false;
		exit;
	end;

//<066> ADD St
    // 内部コードの再取得
    gfnSetExNCode('HOJYOMA',strExCode,m_stMasterData.strExNCode);
//<066> ADD Ed

    // ↓↓↓<041>
    // 同期処理で、子会社で登録した補助が、親会社に存在しない場合に、
    // 親の内部ｺｰﾄﾞのidentity値を補助体系に書き込まなければならない為
    // (子会社が複数社存在していた場合に、自社のMAX(NCODE)ではﾀﾞﾒ）
    // 補助ﾏｽﾀを更新後、補助体系を更新する
    // その際、ｸﾞﾙｰﾌﾟ管理採用時は、親の補助ﾏｽﾀに書き込んだ際に@@identity
    // で更新内部ｺｰﾄﾞを保管するようにする。

    // MQueryの構築
	DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    // 親の外部ｺｰﾄﾞと子の外部ｺｰﾄﾞが同一の場合
	if ( m_stMasterData.strExCodeParent = m_stMasterData.strExCode ) then
	begin
        with DmqData do
        begin
            Close();
		    SQL.Clear();
            SQL.Add('SELECT GCode FROM HojyoMA  '
    		    +   'WHERE MasterKbn = :MKbn    '
    		    +   '  AND RDelKbn   = 0        '
    		    +   '  AND GCode     = :GCode   ');
    		ParamByName('MKbn' ).AsInteger := m_nCurrentMasterDiv;
    		ParamByName('GCode').AsString  := m_stMasterData.strExCode;

    		if ( Open() = FALSE ) then
            begin
    			DmqData.Close();
    			DmqData.Free();
    			Result := false;
    			exit;
    		end;

    		if not EOF then fReturn	:= true
    		else
            begin
                // 補助基本ﾏｽﾀ更新
// <041>                fReturn	:= fnUpdateMasterTreeRecord ( nStrExNCode );
                fReturn	:= fnUpdateMasterTreeRecord ( m_stMasterData.strExNCode );  // <041>
            end;
        end;
    end
    else
    begin
        // 補助加算体系ﾏｽﾀ更新
// <041>        fReturn := fnUpdateMasterTreeRecord ( nStrExNCode );
        fReturn := fnUpdateMasterTreeRecord ( m_stMasterData.strExNCode );  // <041>
    end;

    // ｴﾗｰ
    if not fReturn then
    begin
		Beep();
		fnOutputDBErrorMessage();

        // ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback ( m_cDBSelect );

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <041>
        begin
            // 親会社DBのﾛｰﾙﾊﾞｯｸ
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;

        // 異常終了
		Result	:= false;
		exit;
    end;
    // ↑↑↑<041>

    // ｺﾐｯﾄ(反映)
    m_cDataModule.Commit ( m_cDBSelect );

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <041>
    begin
        // 親会社DBのｺﾐｯﾄ
        m_cDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
    end;

    // 正常終了
	Result	:= true;

	DmqData.Close();
	DmqData.Free();

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterTreeRecord()
//      PARAM   : strExNCode    :   内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Boolean   :   TRUE:正常 FALSE:異常
//      MEMO    : 補助加算体系ﾏｽﾀ更新処理
//-----------------------------------------------------------------------------
function    TJNTCRP016000f.fnUpdateMasterTreeRecord (strExNCode:Extended): Boolean;
var
    dqMasterTree : TMQuery;
	strExCode	 : String;
    fNewRecord   : Boolean;
    nEntryNo     : Integer;
begin

    dqMasterTree := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterTree );

	strExCode := m_stMasterData.strExCode;

    if ( m_nCurrentCodeAttr <= 1 ) then
        strExCode := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

    // 補助体系の存在ﾁｪｯｸ
    with dqMasterTree do
    begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT * FROM HojyoTree                ');
		SQL.Add('WHERE MasterKbn  = :nMasterDivision    ');
        SQL.Add('  AND SumNCode   = :strDstCode         ');
        SQL.Add('  AND BasedNCode = :strSrcCode         ');
        ParamByName('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
        ParamByName('strDstCode'     ).AsFloat   := m_stMasterData.strExNCodeParent;
        ParamByName('strSrcCode'     ).AsFloat   := strExNCode;

		if ( not Open () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
			m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);
			dqMasterTree.Close();
			dqMasterTree.Free();
			Result := false;
            exit;
        end;

		if not Eof then
			    fNewRecord	:= false    // 存在する
        else    fNewRecord	:= true;    // 存在しない

		Close();
    end;

	m_fUpdateRecord	:= true;

    if not fNewRecord then
    begin
		Result := true;
		dqMasterTree.Free();
        exit;
    end;

    with dqMasterTree do
    begin
        // 登録No.の取得
        nEntryNo := fnGetMasterTreeEntryNoFinal ( dqMasterTree, m_stMasterData.strExNCodeParent );

        Close();
        SQL.Clear();
		SQL.Add('INSERT INTO HojyoTree (    ');
        SQL.Add('    MasterKbn              '); // ﾏｽﾀ区分
        SQL.Add('   ,PatternNo              '); // ﾊﾟﾀｰﾝNo.
        SQL.Add('   ,SumNCode               '); // 加算先内部ｺｰﾄﾞ
        SQL.Add('   ,EntNo                  '); // 登録No.
        SQL.Add('   ,BasedNCode             '); // 加算元内部ｺｰﾄﾞ
        SQL.Add('   ,UpdTantoNCode          '); // 担当者内部ｺｰﾄﾞ
        SQL.Add(') VALUES (                 ');
        SQL.Add('    :nMasterDivision       ');
        SQL.Add('   ,0                      ');
        SQL.Add('   ,:strSumCode            ');
        SQL.Add('   ,:nEntryNo              ');
        SQL.Add('   ,:strBasedCode          ');
        SQL.Add('   ,:UpdTantoNCode         ');
        SQL.Add(')                          ');
        ParamByName ('nMasterDivision').AsInteger  := m_nCurrentMasterDiv;
        ParamByName ('strSumCode'     ).AsFloat    := m_stMasterData.strExNCodeParent;
        ParamByName ('nEntryNo'       ).AsInteger  := nEntryNo;
        ParamByName ('strBasedCode'   ).AsFloat    := strExNCode;
        ParamByName ('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;

		if	( not ExecSQL() ) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
			m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);
			dqMasterTree.Close();
			dqMasterTree.Free();
			Result := false;
            exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - 21] := 1;
    end;

	dqMasterTree.Free();

    // 正常終了
	Result	:= true;

end;

//-----------------------------------------------------------------------------
// fnGetMasterTreeEntryNoFinal()
//      PARAM   : dqMasterTree  :   読込ｸｴﾘｰ
//                strDstExNCode :   内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Integer       :   最終登録番号
//      MEMO    : 補助加算体系ﾏｽﾀ 最終登録№取得処理
//-----------------------------------------------------------------------------
function    TJNTCRP016000f.fnGetMasterTreeEntryNoFinal (dqMasterTree: TMQuery; strDstExNCode: Extended): Integer;
var
    nWorkEntryNo : Integer;
begin

    with dqMasterTree do
    begin
        Close();
		SQL.Clear();
        SQL.Add('SELECT EntNo FROM HojyoTree            ');
		SQL.Add('WHERE MasterKbn = :nMasterDivision     ');
        SQL.Add('  AND SumNCode  = :strDstExCode        ');
		SQL.Add('ORDER BY EntNo DESC                    ');
        ParamByName ('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
        ParamByName ('strDstExCode'   ).AsFloat   := strDstExNCode;
        Open();

		if not EOF then
            nWorkEntryNo := dqMasterTree.FieldByName ('EntNo').AsInteger
        else
            nWorkEntryNo := 0;

		Close();
    end;

	Result := ( nWorkEntryNo + 100 ) div 100 * 100;

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterDataRecord()
//      PARAM   : strExNCode    :   内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Integer       :   最終登録番号
//      MEMO    : 補助基本ﾏｽﾀ更新処理
//-----------------------------------------------------------------------------
function    TJNTCRP016000f.fnUpdateMasterDataRecord (strExNCode:Extended): Boolean;
var
	dqMasterData : TMQuery;
	strExCode	 : String;
	bRet	     : Boolean;
	strDateStart : String;
	strDateEnd	 : String;
//<061> 	sCode		 : String;
    i            : Integer;
begin

	strExCode   := m_stMasterData.strExCode;

	if	( m_nCurrentCodeAttr <= 1 ) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

    dqMasterData := TMQuery.Create ( Self );

    try
        //----------------------------------------
        //  子会社の存在ﾁｪｯｸ [重複ﾁｪｯｸ]
        //----------------------------------------

        // 子会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );

        with dqMasterData do
        begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT GCode FROM HojyoMA              ');
            SQL.Add('WHERE  MasterKbn = :nMasterDivision    ');
            SQL.Add('  AND  SumKbn    = :nSumDivision       ');
            SQL.Add('  AND  RDelKbn   = 0                   ');
            SQL.Add('  AND  GCode     = :strExCode          ');

            ParamByName ('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
            ParamByName ('nSumDivision'   ).AsInteger := m_stMasterData.nDivision;
            ParamByName ('strExCode'      ).AsString  := strExCode;

            if	( not Open() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                dqMasterData.Close ();
                dqMasterData.Free  ();
                Result := false;
                Exit;
            end;

            if	( not EOF ) then
                    bRet	:= false		// 既存ﾚｺｰﾄﾞ (update)
            else    bRet	:= true;        // 新規ﾚｺｰﾄﾞ (insert)

            Close();
        end;

	    m_fUpdateRecord	:= true;

        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理 <041>
        //
        //  ｸﾞﾙｰﾌﾟ管理を行っている場合は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
        //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
        // -------------------------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            dqMasterData.Close();

            // 親会社DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, dqMasterData );
        end;
        // ↑↑↑<041>
        // -------------------------------------------------------------------------

        if ( bRet ) then    // 新規ﾚｺｰﾄﾞ (insert)
        begin
    		with dqMasterData do
    		begin
    			Close();
    			SQL.Clear();
                SQL.Add('INSERT INTO HojyoMA (  ');
			    SQL.Add('    MasterKbn          ');                             // ﾏｽﾀ区分
			    SQL.Add('   ,SumKbn             ');                             // 実在/合計区分
                SQL.Add('   ,RDelKbn            ');                             // ﾚｺｰﾄﾞ区分: 0=正規ﾚｺｰﾄﾞ
			    SQL.Add('   ,GCode              ');							   	// 外部ｺｰﾄﾞ
                SQL.Add('   ,Renso              ');                             // 連想ｼﾝﾎﾞﾙ
                SQL.Add('   ,LongName           ');                             // 正式名称
                SQL.Add('   ,SimpleName         ');                             // 簡略名称
                SQL.Add('   ,UpdTantoNCode      ');                             // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
                SQL.Add('   ,TStartDate         ');								// 適用開始年月日
                SQL.Add('   ,TEndDate           ');								// 適用終了年月日

                // 実在時<003>
//<067> DEL                if	( m_stMasterData.nDivision = 0 ) then
                if	( m_stMasterData.nDivision = 0 ) and m_stMasterData.fDetails then  //<067> ADD
                begin

                    SQL.Add('   ,BunruiNCode1       ');                         // 分類1内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode2       ');                         // 分類2内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode3       ');                         // 分類3内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode4       ');                         // 分類4内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode5       ');                         // 分類5内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode6       ');                         // 分類6内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode7       ');                         // 分類7内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode8       ');                         // 分類8内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode9       ');                         // 分類9内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode10      ');                         // 分類10内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode1          ');                         // ｾｸﾞﾒﾝﾄ1ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode2          ');                         // ｾｸﾞﾒﾝﾄ2ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode3          ');                         // ｾｸﾞﾒﾝﾄ3ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode4          ');                         // ｾｸﾞﾒﾝﾄ4ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode5          ');                         // ｾｸﾞﾒﾝﾄ5ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode6          ');                         // ｾｸﾞﾒﾝﾄ6ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode7          ');                         // ｾｸﾞﾒﾝﾄ7ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode8          ');                         // ｾｸﾞﾒﾝﾄ8ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode9          ');                         // ｾｸﾞﾒﾝﾄ9ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode10         ');                         // ｾｸﾞﾒﾝﾄ10ｺｰﾄﾞ<003>
                end;

                // ﾌﾘｰ項目↓↓↓<005>
                if ( m_UpdFreeFlg ) then
                begin
                    SQL.Add('   ,VFree1             ');
                    SQL.Add('   ,VFree2             ');
                    SQL.Add('   ,VFree3             ');
                    SQL.Add('   ,VFree4             ');
                    SQL.Add('   ,VFree5             ');
                    SQL.Add('   ,VFree6             ');
                    SQL.Add('   ,VFree7             ');
                    SQL.Add('   ,VFree8             ');
                    SQL.Add('   ,VFree9             ');
                    SQL.Add('   ,VFree10            ');
                    SQL.Add('   ,NFree1             ');
                    SQL.Add('   ,NFree2             ');
                    SQL.Add('   ,NFree3             ');
                    SQL.Add('   ,NFree4             ');
                    SQL.Add('   ,NFree5             ');
                    SQL.Add('   ,NFree6             ');
                    SQL.Add('   ,NFree7             ');
                    SQL.Add('   ,NFree8             ');
                    SQL.Add('   ,NFree9             ');
                    SQL.Add('   ,NFree10            ');

                    if ( m_freeItem.DFree1 > 0 ) then
                        SQL.Add('   ,DFree1         ');
                    if ( m_freeItem.DFree2 > 0 ) then
                        SQL.Add('   ,DFree2         ');
                    if ( m_freeItem.DFree3 > 0 ) then
                        SQL.Add('   ,DFree3         ');
                end;
                // ↑↑↑<005>
{
                if	( m_stMasterData.fDetails ) then
                begin
                    case ( m_nCurrentMasterDiv ) of
                        31..35: SQL.Add('   ,BunCode        ');					    // 手形割引限度額
                    end;
                end;
}
                SQL.Add(') Values (             ');
                SQL.Add('    :MasterKbn         ');
                SQL.Add('   ,:SumKbn            ');
                SQL.Add('   ,:RecordKbn         ');
                SQL.Add('   ,:GCode             ');
                SQL.Add('   ,:RenChar           ');
                SQL.Add('   ,:LongName          ');
                SQL.Add('   ,:SimpleName        ');
                SQL.Add('   ,:UpdTantoNCode     ');

                if	( m_stMasterData.nAppDateStart > 0 ) then
                        strDateStart := IntToStr(m_stMasterData.nAppDateStart)
                else    strDateStart := FormatDateTime('yyyymmdd',m_cJNTArea.GetDEFDATE(1));

                if	( m_stMasterData.nAppDateEnd > 0 ) then
                        strDateEnd	 := IntToStr(m_stMasterData.nAppDateEnd)
                else    strDateEnd	 := FormatDateTime('yyyymmdd',m_cJNTArea.GetDEFDATE(2));

                SQL.Add(',' + strDateStart +  ' ');
                SQL.Add(',' + strDateEnd   +  ' ');

                // 実在時<003>
//<067> DEL                if	( m_stMasterData.nDivision = 0 ) then
                if	( m_stMasterData.nDivision = 0 ) and m_stMasterData.fDetails then  //<067> ADD
                begin
                    SQL.Add('   ,:BunruiNCode1      ');     // <003>
                    SQL.Add('   ,:BunruiNCode2      ');     // <003>
                    SQL.Add('   ,:BunruiNCode3      ');     // <003>
                    SQL.Add('   ,:BunruiNCode4      ');     // <003>
                    SQL.Add('   ,:BunruiNCode5      ');     // <003>
                    SQL.Add('   ,:BunruiNCode6      ');     // <003>
                    SQL.Add('   ,:BunruiNCode7      ');     // <003>
                    SQL.Add('   ,:BunruiNCode8      ');     // <003>
                    SQL.Add('   ,:BunruiNCode9      ');     // <003>
                    SQL.Add('   ,:BunruiNCode10     ');     // <003>
                    SQL.Add('   ,:SegNCode1         ');     // <003>
                    SQL.Add('   ,:SegNCode2         ');     // <003>
                    SQL.Add('   ,:SegNCode3         ');     // <003>
                    SQL.Add('   ,:SegNCode4         ');     // <003>
                    SQL.Add('   ,:SegNCode5         ');     // <003>
                    SQL.Add('   ,:SegNCode6         ');     // <003>
                    SQL.Add('   ,:SegNCode7         ');     // <003>
                    SQL.Add('   ,:SegNCode8         ');     // <003>
                    SQL.Add('   ,:SegNCode9         ');     // <003>
                    SQL.Add('   ,:SegNCode10        ');     // <003>
                end;

                // ﾌﾘｰ項目↓↓↓<005>
                if ( m_UpdFreeFlg ) then
                begin
                    SQL.Add('   ,:VFree1            ');
                    SQL.Add('   ,:VFree2            ');
                    SQL.Add('   ,:VFree3            ');
                    SQL.Add('   ,:VFree4            ');
                    SQL.Add('   ,:VFree5            ');
                    SQL.Add('   ,:VFree6            ');
                    SQL.Add('   ,:VFree7            ');
                    SQL.Add('   ,:VFree8            ');
                    SQL.Add('   ,:VFree9            ');
                    SQL.Add('   ,:VFree10           ');
                    SQL.Add('   ,:NFree1            ');
                    SQL.Add('   ,:NFree2            ');
                    SQL.Add('   ,:NFree3            ');
                    SQL.Add('   ,:NFree4            ');
                    SQL.Add('   ,:NFree5            ');
                    SQL.Add('   ,:NFree6            ');
                    SQL.Add('   ,:NFree7            ');
                    SQL.Add('   ,:NFree8            ');
                    SQL.Add('   ,:NFree9            ');
                    SQL.Add('   ,:NFree10           ');

                    if ( m_freeItem.DFree1 > 0 ) then
                        SQL.Add('   ,:DFree1        ');
                    if ( m_freeItem.DFree2 > 0 ) then
                        SQL.Add('   ,:DFree2        ');
                    if ( m_freeItem.DFree3 > 0 ) then
                        SQL.Add('   ,:DFree3        ');
                end;
                // ↑↑↑<005>

{
                if	( m_stMasterData.fDetails ) then
                begin
                    case ( m_nCurrentMasterDiv ) of
                        31..35: SQL.Add('   ,:BunCode           ');
                    end;
                end;
}
                SQL.Add(')                      ');

                ParamByName('MasterKbn')    .AsInteger  := m_nCurrentMasterDiv;
                ParamByName('SumKbn')       .AsInteger	:= m_stMasterData.nDivision;
                ParamByName('RecordKbn')    .AsInteger	:= 0;
                ParamByName('GCode')        .AsString	:= TrimRight(strExCode);
                ParamByName('RenChar')      .AsString	:= m_stMasterData.strAssociation;
                ParamByName('LongName')     .AsString	:= m_stMasterData.strName;
                ParamByName('SimpleName')   .AsString	:= m_stMasterData.strNameSimple;
                ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode;

                // 実在時<003>
//<067> DEL                if	( m_stMasterData.nDivision = 0 ) then
                if	( m_stMasterData.nDivision = 0 ) and m_stMasterData.fDetails then   //<067> ADD
                begin
                    for i := 1 to  10 do
                    begin
                        // 汎用補助分類情報
                        ParamByName('BunruiNCode' + IntToStr(i)).AsFloat
                        :=  gfnGetSegBunNCode(m_arAdoptInfo_HBr [i].nMasterDivision,
                            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).Text,
                            m_arAdoptInfo_HBr [i].nCodeAttribute);

                        // ｾｸﾞﾒﾝﾄ情報
                        ParamByName('SegNCode' + IntToStr(i)).AsFloat
                        :=  gfnGetSegBunNCode(m_arAdoptInfo_Seg [i].nMasterDivision,
                            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).Text,
                            m_arAdoptInfo_Seg [i].nCodeAttribute);
                    end;
                end;

                // ﾌﾘｰ項目↓↓↓<005>
                if ( m_UpdFreeFlg ) then
                begin
                    ParamByName('VFree1' ).AsString		:= m_freeItem.VFree1;
                    ParamByName('VFree2' ).AsString		:= m_freeItem.VFree2;
                    ParamByName('VFree3' ).AsString		:= m_freeItem.VFree3;
                    ParamByName('VFree4' ).AsString		:= m_freeItem.VFree4;
                    ParamByName('VFree5' ).AsString		:= m_freeItem.VFree5;
                    ParamByName('VFree6' ).AsString		:= m_freeItem.VFree6;
                    ParamByName('VFree7' ).AsString		:= m_freeItem.VFree7;
                    ParamByName('VFree8' ).AsString		:= m_freeItem.VFree8;
                    ParamByName('VFree9' ).AsString		:= m_freeItem.VFree9;
                    ParamByName('VFree10').AsString		:= m_freeItem.VFree10;
                    ParamByName('NFree1' ).AsCurrency	:= m_freeItem.NFree1;
                    ParamByName('NFree2' ).AsCurrency	:= m_freeItem.NFree2;
                    ParamByName('NFree3' ).AsCurrency	:= m_freeItem.NFree3;
                    ParamByName('NFree4' ).AsCurrency	:= m_freeItem.NFree4;
                    ParamByName('NFree5' ).AsCurrency	:= m_freeItem.NFree5;
                    ParamByName('NFree6' ).AsCurrency	:= m_freeItem.NFree6;
                    ParamByName('NFree7' ).AsCurrency	:= m_freeItem.NFree7;
                    ParamByName('NFree8' ).AsCurrency	:= m_freeItem.NFree8;
                    ParamByName('NFree9' ).AsCurrency	:= m_freeItem.NFree9;
                    ParamByName('NFree10').AsCurrency	:= m_freeItem.NFree10;

                    if ( m_freeItem.DFree1 > 0 ) then
                        ParamByName('DFree1').AsDateTime	:= m_freeItem.DFree1;
                    if ( m_freeItem.DFree2 > 0 ) then
                        ParamByName('DFree2').AsDateTime	:= m_freeItem.DFree2;
                    if ( m_freeItem.DFree3 > 0 ) then
                        ParamByName('DFree3').AsDateTime	:= m_freeItem.DFree3;
                end;
                // ↑↑↑<005>
{
                if	( m_stMasterData.fDetails ) then
                begin
                    case (m_nCurrentMasterDiv) of
                        31..35:
                            ParamByName('BunCode').AsInteger	:= m_stMasterData.nClassCode;
                    end;
                end;
}
                if	( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

                    dqMasterData.Close ();
                    dqMasterData.Free  ();

                    Result	:= FALSE;
                    Exit;
                end;

                m_NewRecord := true;

            end;

            // -------------------------------------------------------------------------
            //  ｸﾞﾙｰﾌﾟ管理処理 <041>
            //
            //  ｸﾞﾙｰﾌﾟ管理を採用している場合は、親の内部ｺｰﾄﾞを取得しなければならない。
            //  補助ﾏｽﾀは同期ｽﾄｱﾄﾞでOKだが、補助体系についても親会社の内部ｺｰﾄﾞでないと
            //  不整合(はぐれで生成はされるが･･･）なﾃﾞｰﾀが生成されてしまう。
            // -------------------------------------------------------------------------
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( bRet ) then  // ｸﾞﾙｰﾌﾟ管理 & 新規
            begin
                with dqMasterData do
                begin
                    Close();
                    SQL.Clear();
                    SQL.Add('select @@identity NCode from HojyoMA ');
                    Open;

                    if Not Eof then
                    begin
                        strExNCode := FieldByName('NCode').AsFloat;
                        m_stMasterData.strExNCode := strExNCode;
                    end;

                    Close();
                end;
            end;
            // ↑↑↑<041>
            // -------------------------------------------------------------------------

            // ﾂﾘｰﾋﾞｭｰｱｲﾃﾑの更新
            fnUpdateTreeViewItems (m_stMasterData.nDivision,
                                   strExCode,
                                   strExNCode,
                                   m_stMasterData.strNameSimple,
                                   ACCESS_TREE_ADD);
        end
        // 既存ﾚｺｰﾄﾞ (update)
        else
        begin
            with dqMasterData do
            begin
                Close();
                SQL.Clear();
                SQL.Add('UPDATE HojyoMA SET                 ');
                SQL.Add('    Renso         = :RenChar       ');					// 連想シンボル
                SQL.Add('   ,LongName      = :LongName      ');					// 正式名称
                SQL.Add('   ,SimpleName    = :SimpleName    ');					// 簡略名称
                SQL.Add('   ,UpdTantoNCode = :UpdTantoNCode ');                 // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ

                if	( m_stMasterData.fDetails ) then
                begin
                    if	( m_stMasterData.nAppDateStart > 0 ) then
                            strDateStart := IntToStr(m_stMasterData.nAppDateStart)
                    else    strDateStart := FormatDateTime('yyyymmdd',m_cJNTArea.GetDEFDATE(1));

                    if	( m_stMasterData.nAppDateEnd > 0 ) then
                            strDateEnd	 := IntToStr(m_stMasterData.nAppDateEnd)
                    else    strDateEnd	 := FormatDateTime('yyyymmdd',m_cJNTArea.GetDEFDATE(2));

                    SQL.Add('   ,TStartDate = ' + strDateStart + ' ');			// 適用開始年月日
                    SQL.Add('   ,TEndDate   = ' + strDateEnd   + ' ');			// 適用終了年月日

                    SQL.Add('   ,BunruiNCode1	= :BunruiNCode1     ');         // 分類1内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode2	= :BunruiNCode2     ');         // 分類2内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode3	= :BunruiNCode3     ');         // 分類3内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode4	= :BunruiNCode4     ');         // 分類4内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode5	= :BunruiNCode5     ');         // 分類5内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode6	= :BunruiNCode6     ');         // 分類6内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode7	= :BunruiNCode7     ');         // 分類7内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode8	= :BunruiNCode8     ');         // 分類8内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode9	= :BunruiNCode9     ');         // 分類9内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,BunruiNCode10	= :BunruiNCode10    ');         // 分類10内部ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode1	    = :SegNCode1        ');         // ｾｸﾞﾒﾝﾄ1ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode2	    = :SegNCode2        ');         // ｾｸﾞﾒﾝﾄ2ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode3      = :SegNCode3        ');         // ｾｸﾞﾒﾝﾄ3ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode4	    = :SegNCode4        ');         // ｾｸﾞﾒﾝﾄ4ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode5	    = :SegNCode5        ');         // ｾｸﾞﾒﾝﾄ5ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode6	    = :SegNCode6        ');         // ｾｸﾞﾒﾝﾄ6ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode7	    = :SegNCode7        ');         // ｾｸﾞﾒﾝﾄ7ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode8	    = :SegNCode8        ');         // ｾｸﾞﾒﾝﾄ8ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode9	    = :SegNCode9        ');         // ｾｸﾞﾒﾝﾄ9ｺｰﾄﾞ<003>
                    SQL.Add('   ,SegNCode10     = :SegNCode10       ');         // ｾｸﾞﾒﾝﾄ10ｺｰﾄﾞ<003>

{
                    case ( m_nCurrentMasterDiv ) of
                        31..35: SQL.Add('   ,BunCode     = :BunCode      ');		// 取引先分類
                    end;
}
			    end;

                // ﾌﾘｰ項目↓↓↓<005>
                if ( m_UpdFreeFlg ) then
                begin
                    SQL.Add('   ,VFree1     = :VFree1               ');
                    SQL.Add('   ,VFree2     = :VFree2               ');
                    SQL.Add('   ,VFree3     = :VFree3               ');
                    SQL.Add('   ,VFree4     = :VFree4               ');
                    SQL.Add('   ,VFree5     = :VFree5               ');
                    SQL.Add('   ,VFree6     = :VFree6               ');
                    SQL.Add('   ,VFree7     = :VFree7               ');
                    SQL.Add('   ,VFree8     = :VFree8               ');
                    SQL.Add('   ,VFree9     = :VFree9               ');
                    SQL.Add('   ,VFree10    = :VFree10              ');
                    SQL.Add('   ,NFree1     = :NFree1               ');
                    SQL.Add('   ,NFree2     = :NFree2               ');
                    SQL.Add('   ,NFree3     = :NFree3               ');
                    SQL.Add('   ,NFree4     = :NFree4               ');
                    SQL.Add('   ,NFree5     = :NFree5               ');
                    SQL.Add('   ,NFree6     = :NFree6               ');
                    SQL.Add('   ,NFree7     = :NFree7               ');
                    SQL.Add('   ,NFree8     = :NFree8               ');
                    SQL.Add('   ,NFree9     = :NFree9               ');
                    SQL.Add('   ,NFree10    = :NFree10              ');

                    if ( m_freeItem.DFree1 > 0 ) then
                        SQL.Add('   ,DFree1 = :DFree1               ');
                    if ( m_freeItem.DFree2 > 0 ) then
                        SQL.Add('   ,DFree2 = :DFree2               ');
                    if ( m_freeItem.DFree3 > 0 ) then
                        SQL.Add('   ,DFree3 = :DFree3               ');
                end;
                // ↑↑↑<005>

                SQL.Add('WHERE MasterKbn = :MasterKbn       ');
                SQL.Add('  AND SumKbn    = :SumKbn          ');
                SQL.Add('  AND RDelkbn   = 0			    ');
                SQL.Add('  AND GCode	 = :GCode           ');

                ParamByName('RenChar')      .AsString	:=  m_stMasterData.strAssociation;
                ParamByName('LongName')     .AsString	:=  m_stMasterData.strName;
                ParamByName('SimpleName')   .AsString   :=  m_stMasterData.strNameSImple;
                ParamByName('UpdTantoNCode').AsCurrency :=  m_TantoNCode;
{
                if	( m_stMasterData.fDetails ) then
                begin
                    case ( m_nCurrentMasterDiv ) of
                        31..35: ParamByName('BunCode').AsInteger    :=  m_stMasterData.nClassCode;
                    end;
                end;
}

                // 実在時<003>
                if	( m_stMasterData.fDetails ) then
                begin
                    for i := 1 to  10 do
                    begin
                        // 汎用補助分類情報
                        ParamByName('BunruiNCode' + IntToStr(i)).AsFloat
                        :=  gfnGetSegBunNCode(m_arAdoptInfo_HBr [i].nMasterDivision,
                            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).Text,
                            m_arAdoptInfo_HBr [i].nCodeAttribute);

                        // ｾｸﾞﾒﾝﾄ情報
                        ParamByName('SegNCode' + IntToStr(i)).AsFloat
                        :=  gfnGetSegBunNCode(m_arAdoptInfo_Seg [i].nMasterDivision,
                            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).Text,
                            m_arAdoptInfo_Seg [i].nCodeAttribute);
                    end;
                end;

                // ﾌﾘｰ項目↓↓↓<005>
                if ( m_UpdFreeFlg ) then
                begin
                    ParamByName('VFree1' ).AsString	  := m_freeItem.VFree1;
                    ParamByName('VFree2' ).AsString	  := m_freeItem.VFree2;
                    ParamByName('VFree3' ).AsString	  := m_freeItem.VFree3;
                    ParamByName('VFree4' ).AsString	  := m_freeItem.VFree4;
                    ParamByName('VFree5' ).AsString	  := m_freeItem.VFree5;
                    ParamByName('VFree6' ).AsString	  := m_freeItem.VFree6;
                    ParamByName('VFree7' ).AsString	  := m_freeItem.VFree7;
                    ParamByName('VFree8' ).AsString	  := m_freeItem.VFree8;
                    ParamByName('VFree9' ).AsString	  := m_freeItem.VFree9;
                    ParamByName('VFree10').AsString	  := m_freeItem.VFree10;
                    ParamByName('NFree1' ).AsCurrency := m_freeItem.NFree1;
                    ParamByName('NFree2' ).AsCurrency := m_freeItem.NFree2;
                    ParamByName('NFree3' ).AsCurrency := m_freeItem.NFree3;
                    ParamByName('NFree4' ).AsCurrency := m_freeItem.NFree4;
                    ParamByName('NFree5' ).AsCurrency := m_freeItem.NFree5;
                    ParamByName('NFree6' ).AsCurrency := m_freeItem.NFree6;
                    ParamByName('NFree7' ).AsCurrency := m_freeItem.NFree7;
                    ParamByName('NFree8' ).AsCurrency := m_freeItem.NFree8;
                    ParamByName('NFree9' ).AsCurrency := m_freeItem.NFree9;
                    ParamByName('NFree10').AsCurrency := m_freeItem.NFree10;

                    if ( m_freeItem.DFree1 > 0 ) then
                        ParamByName('DFree1').AsDateTime	:= m_freeItem.DFree1;
                    if ( m_freeItem.DFree2 > 0 ) then
                        ParamByName('DFree2').AsDateTime	:= m_freeItem.DFree2;
                    if ( m_freeItem.DFree3 > 0 ) then
                        ParamByName('DFree3').AsDateTime	:= m_freeItem.DFree3;
                end;
                // ↑↑↑<005>

                ParamByName('MasterKbn'  ).AsInteger  := m_nCurrentMasterDiv;
                ParamByName('SumKbn'     ).AsInteger  := m_stMasterData.nDivision;
                ParamByName('GCode'      ).AsString	  := TrimRight(strExCode);

                if	( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                    Result  := FALSE;
                    Exit;
                end;
            end;

            // ﾂﾘｰﾋﾞｭｰの更新
            fnUpdateTreeViewItems (m_stMasterData.nDivision,
                                   strExCode,
                                   strExNCode,
                                   m_stMasterData.strNameSimple,
                                   ACCESS_TREE_UPDATE);

        end;

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = false ) then
            begin
                Result := false;
                Exit;
            end;

            // <051> - ST
            // SecHojyoDispInfoのﾒﾝﾃを行う

            dqMasterData.Close();
            // 親会社DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, dqMasterData );

            dqMasterData.Close();
            dqMasterData.SQL.Clear();
            dqMasterData.SQL.Add('select * from SecHojyoDispInfo   ');
            dqMasterData.SQL.Add('where Opekbn          = :Opekbn  ');  // 使用区分
            dqMasterData.SQL.Add('  and Masterkbn       = :Mstkbn  ');  // ﾏｽﾀ区分(101～110)
            dqMasterData.SQL.Add('  and PlaceNCode      = :PNCode  ');  // ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
            dqMasterData.SQL.Add('  and NoDispMasterkbn = :NMstKbn ');  // ﾏｽﾀ区分
            dqMasterData.SQL.Add('  and NCode           = :NCode   ');  // 内部ｺｰﾄﾞ

            dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
            dqMasterData.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
            dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
            dqMasterData.ParamByName('NMstKbn').AsInteger := m_nCurrentMasterDiv;
            dqMasterData.ParamByName('NCode'  ).AsFloat   := m_stMasterData.strExNCode;

            //  ｴﾗｰの判定
            if	( not dqMasterData.Open() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                dqMasterData.Close ();
                dqMasterData.Free  ();
                Result := false;
                Exit;
            end;

            // 該当ﾚｺｰﾄﾞが存在していない場合は、表示ﾚｺｰﾄを生成する。
            if	( dqMasterData.Eof ) then
            begin
                dqMasterData.Close();
                dqMasterData.SQL.Clear();
                dqMasterData.SQL.Add('insert into SecHojyoDispInfo  ( ');
                dqMasterData.SQL.Add(' Opekbn,Masterkbn,PlaceNCode,   ');
                dqMasterData.SQL.Add(' NoDispMasterKbn,NCode,DispKbn, ');
                dqMasterData.SQL.Add(' UpdateTime ) values (          ');
                dqMasterData.SQL.Add(' :Opekbn,:Mstkbn,:PNCode,       ');
                dqMasterData.SQL.Add(' :NMstKbn,:NCode,:DispKbn,      ');
                dqMasterData.SQL.Add(' CURRENT_TIMESTAMP )            ');

                dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                dqMasterData.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                dqMasterData.ParamByName('NMstKbn').AsInteger := m_nCurrentMasterDiv;
                dqMasterData.ParamByName('NCode'  ).AsFloat   := m_stMasterData.strExNCode;
                dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                if	( not dqMasterData.ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                    Result := FALSE;
                    Exit;
                end;
            end
            else
            begin
                dqMasterData.Close();
                dqMasterData.SQL.Clear();
                dqMasterData.SQL.Add('update SecHojyoDispInfo set      ');
                dqMasterData.SQL.Add(' DispKbn    = :DispKbn,          ');
                dqMasterData.SQL.Add(' UpdateTime = CURRENT_TIMESTAMP  ');
                dqMasterData.SQL.Add('where Opekbn          = :Opekbn  ');
                dqMasterData.SQL.Add('  and Masterkbn       = :MstKbn  ');
                dqMasterData.SQL.Add('  and PlaceNCode      = :PNCode  ');
                dqMasterData.SQL.Add('  and NoDispMasterKbn = :NMstKbn ');
                dqMasterData.SQL.Add('  and NCode           = :NCode   ');

                dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                dqMasterData.ParamByName('MstKbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                dqMasterData.ParamByName('NMstKbn').AsInteger := m_nCurrentMasterDiv;
                dqMasterData.ParamByName('NCode'  ).AsFloat   := m_stMasterData.strExNCode;
                dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                if	( not dqMasterData.ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                    Result := false;
                    Exit;
                end;
            end;
            // <051> - ED
        end;
    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;

    // 正常終了
	Result	:= true;

end;

//-----------------------------------------------------------------------------
// fnUpdateTreeViewItems()
//      PARAM   : nDivision     :   実在/合計区分 (0:実在, 1:合計)
//                strExCode     :   外部ｺｰﾄﾞ
//                strNameSimple :   簡略名称
//                nAccessMethod :   ｱｸｾｽ方法      (ACCESS_TREE_ADD:追加, ACCESS_TREE_UPDATE:変更...)
//      VAR     :
//      RETURN  :
//      MEMO    : ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnUpdateTreeViewItems (nDivision: Integer; strExCode: String; strExNCode : Extended; strNameSimple: String; nAccessMethod: Integer);
var
    cNode           :   TTreeNode;
    stWorkRec       :   ^TreeViewRec;
    stWorkRecAdd    :   ^TreeViewRec;
    nCount          :   Integer;
    strExCodeCmp    :   String;
    sCode           :   String;
begin

    case (nAccessMethod) of
        ACCESS_TREE_ADD   : strExCodeCmp    := m_strExCodeCurrent;
        ACCESS_TREE_INSERT: strExCodeCmp    := m_strExCodeCurrent;
        ACCESS_TREE_UPDATE: strExCodeCmp    := strExCode;
        ACCESS_TREE_DELETE: strExCodeCmp    := strExCode;
    end;

	nCount	:= 0;

	while TRUE do
    begin
		inc(nCount);

    	if ( CmnTreeView.Items.Count < nCount ) then
			Break;

        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

		if ( CompareStr (stWorkRec^.strExCode, strExCodeCmp) = 0 ) then
        begin
            cNode   := CmnTreeView.Items [nCount - 1];

            // ------------------------------
            //  アイテムの追加
            // ------------------------------
            if ( nAccessMethod = ACCESS_TREE_ADD ) then
            begin
                New (stWorkRecAdd);

				if ( m_nCurrentCodeAttr <= 1 ) then
					strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

				stWorkRecAdd^.nDivision  := nDivision;
				stWorkRecAdd^.strExCode  := strExCode;
				stWorkRecAdd^.strName    := strNameSimple;
                stWorkRecAdd^.strExNCode := strExNCode;

                // 数値属性
                if ( m_nCurrentCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 0)
                // 数値前ｾﾞﾛ有
                else if ( m_nCurrentCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 1)
                // ﾌﾘｰ属性
                else
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 2);

                // ﾉｰﾄﾞの追加
                cNode	:= CmnTreeView.Items.AddChildObject (cNode, MakeDspString(sCode, strNameSimple), stWorkRecAdd);

                if (( nDivision = 0 ) or ( nDivision = DIVISION_GENERAL )) then
                begin
                    cNode.ImageIndex	:= 1;
                    cNode.SelectedIndex	:= 3;
                end
                else
                begin
                    cNode.ImageIndex	:= 0;
                    cNode.SelectedIndex	:= 2;
                end;

				CmnTreeView.Items [nCount - 1].Expanded := TRUE;
            end;

            // ------------------------------
            //  アイテムの更新
            // ------------------------------
            if ( nAccessMethod = ACCESS_TREE_UPDATE ) then
			begin
				stWorkRec	        := cNode.Data;
				stWorkRec^.strName	:= strNameSimple;

                // 数値属性
                if ( m_nCurrentCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 0)
                // 数値前ｾﾞﾛ有
                else if ( m_nCurrentCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 1)
                // ﾌﾘｰ属性
                else
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 2);

                cNode.Text  := MakeDspString(sCode, strNameSimple);

				fnUpdateParentItemsInfoCaption (stWorkRec^.strExCode, strNameSimple);
			end;

            // ------------------------------
            //  アイテムの削除
            // ------------------------------
            if ( nAccessMethod = ACCESS_TREE_DELETE ) then
                cNode.Delete;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnUpdateParentItemsInfoCaption()
//      PARAM   : strExCode     :   外部ｺｰﾄﾞ
//                strNameSimple :   簡略名称
//      VAR     :
//      RETURN  :
//      MEMO    : 現在選択されている親情報を更新
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnUpdateParentItemsInfoCaption (strExCode: String; strNameSimple: String);
var
	strFormat   :   String;
	strCaption	:   String;

begin

	if ( CompareStr (m_strExCodeCurrent, strExCode) <> 0 ) then
		Exit;

	if ( strExCode = '' ) then
		Exit;

	strCaption	:= '';

   	if ( m_nCurrentCodeAttr <= 1 ) then
	begin
       	case (m_nCurrentCodeAttr) of
           	0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
           	1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
       	end;

       	strCaption	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
		strCaption	:= strCaption + ' ';
   	end
	else
		strCaption	:= strExCode + ' ';

    strCaption				:= strCaption + strNameSimple;
	StdCmnTab.BorderCaption := strCaption;
	DtlCmnTab.BorderCaption := strCaption;

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnCmnTreeViewOnEnter (TObject; TTreeNode)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnEnter ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnCmnTreeViewOnEnter (Sender: TObject);
begin
	fnChangeToolbarButtonsCondition (CmnTreeView.Selected);								// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewOnChange (TObject; TTreeNode)								*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnChange ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCmnTreeViewOnChange (Sender: TObject; Node: TTreeNode);
var
    stSelectRec         : ^TreeViewRec;
    stParentRec         : ^TreeViewRec;
	strExCodeParent     : String;
    strExNCodeParent    : Extended;
	strName		        : String;
begin
	if	(m_fUnderConstruction) then
		Exit;

	fnChangeToolbarButtonsCondition (Node);												// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更

	stSelectRec	:= Node.Data;

	if	(stSelectRec^.nDivision = DIVISION_NEWRECORD) then
    begin

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<017>        fnSetFncType(0);
		Exit;
    end;

	fnCleanupTreeViewNewItem (FALSE);

    // ﾌｧﾝｸｼｮﾝ設定<002>
{
    if ( stSelectRec^.nDivision = 9 ) then
            fnSetFncType(0)
    else    fnSetFncType(1);
}//<005>

    // <013>
    if ( stSelectRec^.nDivision = 0 ) then
            Pnl_SegBunInfo.Visible  :=  TRUE
    else    Pnl_SegBunInfo.Visible  :=  FALSE;

    // <005>
    if ( stSelectRec^.nDivision = 9 ) then
//<017>        fnSetFncType(0)
    else
    begin
        if ( DtlCmnClientPanel.Visible ) then
//<017>                fnSetFncType(1)
//<017>        else    fnSetFncType(0);
    end;

    // 実在
	if	((stSelectRec^.nDivision = 0) or (stSelectRec^.nDivision = DIVISION_GENERAL)) then
    begin
		stParentRec		 := Node.Parent.Data;
		strExCodeParent	 := stParentRec^.strExCode;
        strExNCodeParent := stParentRec^.strExNCode;
		strName			 := stParentRec^.strName;
	end
	else
	begin
		strExCodeParent	 := stSelectRec^.strExCode;
        strExNCodeParent := stSelectRec^.strExNCode;
		strName			 := stSelectRec^.strName;
	end;

	if	(CompareStr (m_strExCodeCurrent, strExCodeParent) <> 0) then
            fnSetParentItemsInfoEx (stSelectRec^.nDivision, stSelectRec^.strExCode, stSelectRec^.strExNCode, strExCodeParent, strExNCodeParent, strName);

	if	(DtlCmnClientPanel.Visible) then
	begin {
		if	(stSelectRec^.nDivision = 9) then
		begin
        }
        //<032>
        if  (stSelectRec^.nDivision = 9) and (Node.Focused = True) then
        begin
        //<032>
			DtlCmnClientPanel     .Visible	:= FALSE;
			StdCmnClientPanel     .Visible	:= TRUE;
 			CmnToolbarButtonDetail.Caption	:= '詳細(&T)';
			m_fChangeDetails	:= FALSE;
		end
		else
		begin
			fnShowDetailScreen ();
		end;
	end
	else
    begin
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.strExCode);
    end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnFunctionOnEnter02 (TObject)											*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnEnter ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCommonFunctionOnEnter02 (Sender: TObject);
var
	fDeleteEnabled: Boolean;

begin
	fDeleteEnabled	:= TRUE;

	if (giReferFlag	<> BASICONLY) then								//	基本のみ以外	HIS0005
		CmnToolbarButtonDetail.Enabled	:= TRUE
	else
		CmnToolbarButtonDetail.Enabled	:= FALSE;

	if	((Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name) or
		 (Screen.ActiveControl.Name = DtlCmnEditExCodeFree   .Name)) then
	begin
		fnSetDeleteButtonCondition ();

		if	(not CmnToolbarButtonDelete.Enabled) then
			fDeleteEnabled	:= FALSE;
	end;

	if	(fDeleteEnabled) then
		CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;     // <012>

    BSpeedButtonSort.Enabled    := m_IsUpdate;                      // <012>

	m_cACControl	:= Screen.ActiveControl;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCommonFunctionOnKeyDown01 (TObject; var Word; TShiftState)				*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	(Key = VK_RETURN) then
    begin
        if giReferFlag = REFER then     // <012> Refer時にﾚｺｰﾄﾞを取得できない為
        begin
            if not fnCheckDtlExCodeValid then
                exit;
        end;
        //<033>
        {
        else
    		MjsDispCtrl.MjsNextCtrl (Self);
        }
        //<033>
    end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
		CmnInstructionCombo.SetFocus ()
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		//HIS0032
		if	((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN)) then						// Altｷｰが押された時
			Exit;

		if (Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnTabOnEnter (TObject)									        */
//*																									*/
//*	目的	: 補助登録処理 ﾀﾌﾞ OnEnter ｲﾍﾞﾝﾄ												        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnTabOnEnter (Sender: TObject);
begin

	CmnToolbarButtonDetail.Enabled	:= FALSE;
	CmnToolbarButtonDelete.Enabled	:= FALSE;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnEnter (TObject)										*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
    fnCommonFunctionOnEnter02 (Sender);

	StdCmnGridExist.FocusedColumn	:= 1;

	fValueCheck	:= TRUE;

//<061>		fnChangeConditionGridExist (StdCmnGridExist.FocusedNode.Strings [1]);

	if	((m_nCurrentCodeAttr <= 1) and (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
	begin
		if	((StdCmnMemDataExist.State in [dsInsert]) and
			 (StrToInt64 (Trim (StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if  ((StdCmnGridExist.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		CmnToolbarButtonDelete.Enabled	:= FALSE;
//<001>		CmnToolbarButtonTag   .Enabled	:= FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
        ToolBarFusen          .Enabled	:= FALSE;   // <001>

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<017>        fnSetFncType(0);
	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			CmnToolbarButtonDetail.Enabled	:= TRUE
		else
			CmnToolbarButtonDetail.Enabled	:= FALSE;

		fnEnableToolbarButtonTag (TRUE);
		fnSetDeleteButtonCondition ();

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<005>        fnSetFncType(1);
//<017>        fnSetFncType(0);    //<005>

	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnEnter (TObject)										*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridTotalOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
    fnCommonFunctionOnEnter02 (Sender);

	StdCmnGridTotal.FocusedColumn	:= 1;

	fValueCheck	:= TRUE;

	if	((m_nCurrentCodeAttr <= 1) and (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
	begin
		if	((StdCmnMemDataTotal.State in [dsInsert]) and
			 (StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if  ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		CmnToolbarButtonDelete.Enabled	:= FALSE;
//<001>		CmnToolbarButtonTag   .Enabled	:= FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
        ToolBarFusen          .Enabled	:= FALSE;   // <001>
	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			CmnToolbarButtonDetail.Enabled	:= TRUE
		else
			CmnToolbarButtonDetail.Enabled	:= FALSE;

		fnEnableToolbarButtonTag   (TRUE);
		fnSetDeleteButtonCondition ();

	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnChangeNodeEx (TObject)									    */
//*																											*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistOnChangeNodeEx (Sender: TObject);
var
    fValueCheck: Boolean;

begin
    fValueCheck := TRUE;

//<061>		fnChangeConditionGridExist (StdCmnGridExist.FocusedNode.Strings [1]);

    if  ((m_nCurrentCodeAttr <= 1) and (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
    begin
		if	((StdCmnMemDataExist.State in [dsInsert]) and
			 (StrToInt64 (Trim (StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

    if  ((StdCmnGridExist.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		StdCmnGridExist.FocusedColumn   := 1;

		CmnToolbarButtonDetail.Enabled	:=  FALSE;
		CmnToolbarButtonDelete.Enabled	:=  FALSE;
//<001>		CmnToolbarButtonTag   .Enabled	:= FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
        ToolBarFusen          .Enabled	:=  FALSE;  // <001>

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<017>        fnSetFncType(0);
	end
	else
	begin
// アドレス違反の原因は、以下のScreen.ActivControl.Nameで違反が起きていました>
//		if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
    	if	(Screen.ActiveControl = StdCmnGridExist) then
		begin
			if	(giReferFlag <> BASICONLY) then											// 基本のみ以外	HIS0005
				CmnToolbarButtonDetail.Enabled	:= TRUE
			else
				CmnToolbarButtonDetail.Enabled	:= FALSE;

			fnEnableToolbarButtonTag   (TRUE);
			fnSetDeleteButtonCondition ();
		end;

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<005>        fnSetFncType(1);
//<017>        fnSetFncType(0);    //<005>
	end;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnChangeNodeEx (TObject)								*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridTotalOnChangeNodeEx (Sender: TObject);
var
    fValueCheck: Boolean;

begin
	fValueCheck	:= TRUE;

    if  ((m_nCurrentCodeAttr <= 1) and (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
    begin
		if	((StdCmnMemDataTotal.State in [dsInsert]) and
			 (StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if  ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		StdCmnGridTotal.FocusedColumn   :=  1;

		CmnToolbarButtonDetail.Enabled	:=  FALSE;
		CmnToolbarButtonDelete.Enabled	:=  FALSE;
//<001>		CmnToolbarButtonTag   .Enabled	:= FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
        ToolBarFusen          .Enabled	:=  FALSE;  // <001>

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<017>        fnSetFncType(0);
	end
	else
	begin
//		if ( Screen.ActiveControl.Name = StdCmnGridTotal.Name ) then
        if ( Screen.ActiveControl = StdCmnGridTotal ) then
		begin
			if	(giReferFlag <> BASICONLY) then											// 基本のみ以外	HIS0005
				CmnToolbarButtonDetail.Enabled	:= TRUE
			else
				CmnToolbarButtonDetail.Enabled	:= FALSE;

			fnEnableToolbarButtonTag   (TRUE);
			fnSetDeleteButtonCondition ();
		end;

        // ﾌｧﾝｸｼｮﾝ設定<002>
//<005>        fnSetFncType(1);
//<017>        fnSetFncType(0);    //<005>
	end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: fnCorpRelation    <041>		                                                        */
//*																									*/
//*	目的	: 会社関連付処理(ﾏｽﾀ同期)								                                */
//*																									*/
//*	戻り値	: 0: 対象外 1: 正常 2:ｷｬﾝｾﾙ -1: 実在合計不一致 -9:ｴﾗｰ                                   */
//*																									*/
//***************************************************************************************************/
function    TJNTCRP016000f.fnCorpRelation(pExCode: String; pSumKbn: Integer): Integer;
var
    Qe       : TMQuery;
    iMastKbn : Integer;
    nPNCode  : Extended;
    strNameSimple,
    strGCode : String;
    bRet     : Boolean;
begin

    result := 0;

    Qe := TMQuery.Create( Self );
    // 親会社DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe );

    Qe.Close();
    Qe.SQL.Clear();
    Qe.SQL.Add('select * from HojyoMA       ');
    Qe.SQL.Add('where MasterKbn = :pMstKbn  ');
    Qe.SQL.Add(' and  RDelKbn   = 0         ');
    Qe.SQL.Add(' and  GCode     = :pGCode   ');
    Qe.ParamByName('pMstKbn').Asinteger := m_nCurrentMasterDiv;
    Qe.ParamByName('pGCode' ).AsString  := pExCode;

    if ( Qe.Open = false ) then
    begin
        // SQLｴﾗｰ
        m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, Qe );
        with m_MjsMsgRec do
            MjsMessageBoxEx (AOwner, sMsg, sTitle, icontype, btntype, btndef, False);
        result := -9;
        Exit;
    end;

    // 親会社に既に該当ﾃﾞｰﾀが存在した場合
    if not Qe.Eof then
    begin
        // 全社と子社で実在・合計が合致しない場合はﾒｯｾｰｼﾞを表示し同期は行わない
        if ( Qe.FieldByName('SumKbn').AsInteger <> pSumKbn ) then
        begin
            MjsMessageBoxEx (Self, JNTSYNC_MSG_SUM_ERR + #13#10#13#10
                           + Qe.FieldByName('SimpleName').AsString,
                           '汎用補助登録', mjQuestion, mjOk, mjDefOk);
            result := -1;
            Abort;
        end;

        // HojyoMA_Relｷｰ情報を取得
        iMastKbn      := Qe.FieldByName('MasterKbn' ).AsInteger;
        nPNCode       := Qe.FieldByName('NCode'     ).AsFloat;
        strGCode      := Qe.FieldByName('GCode'     ).AsString;
        strNameSimple := Qe.FieldByName('SimpleName').AsString;

        if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC + #13#10#13#10
                           + strNameSimple,
                             '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
        begin
            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('select * from HojyoMA_Rel           ');
            Qe.SQL.Add('where MasterKbn   = :pMstKbn        ');
            Qe.SQL.Add(' and  NCode       = :pNCode         ');
            Qe.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');
            Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
            Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
            Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

            if ( Qe.Open = false ) then
            begin
                // SQLｴﾗｰ
                m_cComArea.m_MsgStd.GetMsgDB ( m_MjsMsgRec, Qe );
                with m_MjsMsgRec do
                    MjsMessageBoxEx (AOwner, sMsg, sTitle, icontype, btntype, btndef, False);
                result := -9;
                Exit;
            end;

            if ( Qe.Eof ) then  // HojyoMA_Relの存在ﾁｪｯｸ
                    bRet := True
            else    bRet := False;

            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran( m_cDBSelect );

            try
                // 親のHojyoMA_Relの更新
                if ( bRet ) then   // 新規挿入
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('insert into HojyoMA_Rel (                     ');
                    Qe.SQL.Add(' MasterKbn, NCode, GrpSegNCode, RDelKbn_REL)  ');
                    Qe.SQL.Add('values (:pMstKbn, :pNCode, :pGrpSegNCode, 0)  ');
                end
                else                // 更新
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('update HojyoMA_Rel set               ');
                    Qe.SQL.Add('    RDelKbn_REL = 0                  ');
                    Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP  ');
                    Qe.SQL.Add('where MasterKbn   = :pMstKbn         ');
                    Qe.SQL.Add('  and Ncode       = :pNCode          ');
                    Qe.SQL.Add('  and GrpSegNCode = :pGrpSegNCode    ');
                end;

                Qe.ParamByName('pMstKbn'     ).AsInteger := iMastKbn;
                Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( Qe.ExecSQL = false ) then
                begin
                    MjsMessageBoxEx (Self,
                                     '自社への関連付けに失敗しました。',
                                     'マスタ同期', mjError, mjOk, mjDefOk);
                    result := -9;
                    Abort;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC (JNTSYNC_HojyoMA) = False ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback( m_cDBSelect );
                    result := -9;
                    Exit;
                end;

                // <051> - ST
                // SecHojyoDispInfoのﾒﾝﾃを行う

                Qe.Close();
                // 親会社DBとMQueryの接続
                m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe );

                Qe.Close();
                Qe.SQL.Clear();
                Qe.SQL.Add('select * from SecHojyoDispInfo   ');
                Qe.SQL.Add('where Opekbn          = :Opekbn  ');  // 使用区分
                Qe.SQL.Add('  and Masterkbn       = :Mstkbn  ');  // ﾏｽﾀ区分(101～110)
                Qe.SQL.Add('  and PlaceNCode      = :PNCode  ');  // ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
                Qe.SQL.Add('  and NoDispMasterkbn = :NMstKbn ');  // ﾏｽﾀ区分
                Qe.SQL.Add('  and NCode           = :NCode   ');  // 内部ｺｰﾄﾞ

                Qe.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                Qe.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                Qe.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                Qe.ParamByName('NMstKbn').AsInteger := iMastKbn;
                Qe.ParamByName('NCode'  ).AsFloat   := nPNCode;

                //  ｴﾗｰの判定
                if	( not Qe.Open() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, Qe);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (Qe);
                    Qe.Close ();
                    Qe.Free  ();
                    Result := -9;
                    Exit;
                end;

                // 該当ﾚｺｰﾄﾞが存在していない場合は、表示ﾚｺｰﾄを生成する。
                if	( Qe.Eof ) then
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('insert into SecHojyoDispInfo  ( ');
                    Qe.SQL.Add(' Opekbn,Masterkbn,PlaceNCode,   ');
                    Qe.SQL.Add(' NoDispMasterKbn,NCode,DispKbn, ');
                    Qe.SQL.Add(' UpdateTime ) values (          ');
                    Qe.SQL.Add(' :Opekbn,:Mstkbn,:PNCode,       ');
                    Qe.SQL.Add(' :NMstKbn,:NCode,:DispKbn,      ');
                    Qe.SQL.Add(' CURRENT_TIMESTAMP )            ');

                    Qe.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                    Qe.ParamByName('Mstkbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                    Qe.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                    Qe.ParamByName('NMstKbn').AsInteger := iMastKbn;
                    Qe.ParamByName('NCode'  ).AsFloat   := nPNCode;
                    Qe.ParamByName('DispKbn').AsInteger := DISP_ON;

                    if	( not Qe.ExecSQL() ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback( m_cDBSelect );
                        Result := -9;
                        Exit;
                    end;
                end
                else
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('update SecHojyoDispInfo set      ');
                    Qe.SQL.Add(' DispKbn    = :DispKbn,          ');
                    Qe.SQL.Add(' UpdateTime = CURRENT_TIMESTAMP  ');
                    Qe.SQL.Add('where Opekbn          = :Opekbn  ');
                    Qe.SQL.Add('  and Masterkbn       = :MstKbn  ');
                    Qe.SQL.Add('  and PlaceNCode      = :PNCode  ');
                    Qe.SQL.Add('  and NoDispMasterKbn = :NMstKbn ');
                    Qe.SQL.Add('  and NCode           = :NCode   ');

                    Qe.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
                    Qe.ParamByName('MstKbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
                    Qe.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
                    Qe.ParamByName('NMstKbn').AsInteger := iMastKbn;
                    Qe.ParamByName('NCode'  ).AsFloat   := nPNCode;
                    Qe.ParamByName('DispKbn').AsInteger := DISP_ON;

                    if	( not Qe.ExecSQL() ) then
                    begin
                        // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                        // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                        m_cDataModule.Rollback( m_cDBSelect );
                        Result := -9;
                        Exit;
                    end;
                end;
                // <051> - ED

                // 構造体に情報を保存する
                m_stMasterData.nDivision        := pSumKbn;                // 実在、合計区分
                m_stMasterData.strExNCodeParent := m_strExNCodeCurrent;    // 加算先(親)内部ｺｰﾄﾞ
                m_stMasterData.strExCode        := strGCode;               // 加算元外部ｺｰﾄﾞ
                m_stMasterData.strExNCode       := nPNCode;                // 加算元内部ｺｰﾄﾞ
                m_stMasterData.strNameSimple    := strNameSimple;          // 簡略名称

                // 子会社DBの補助体系を更新する
                if ( fnUpdateMasterTreeRecord ( nPNCode ) = false ) then
                begin
                    // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                    // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                    m_cDataModule.Rollback( m_cDBSelect );
                    result := -9;
                    Exit;
                end;
            except
                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback( m_cDBSelect );
                result := -9;
                Exit;
            end;

            // TreeViewの更新
            fnUpdateTreeViewItems (m_stMasterData.nDivision,     // 実在,合計区分
                                   m_stMasterData.strExCode,     // 加算元外部ｺｰﾄﾞ
                                   m_stMasterData.strExNCode,    // 加算元内部ｺｰﾄﾞ
                                   m_stMasterData.strNameSimple, // 簡略名称
                                   ACCESS_TREE_ADD);             // 追加ﾓｰﾄﾞ

            // 親会社DBに対してｺﾐｯﾄを実行する
            m_cDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
            m_cDataModule.Commit( m_cDBSelect );

            // 正常に同期した場合、各種変数の初期化を行う
            if ( m_UpdFreeFlg ) then        // ﾌﾘｰﾀﾞｲｱﾛｸﾞの初期化
            begin
                m_UpdFreeFlg := false;
                m_freeItem   := m_freeItemNull;
            end;

            result := 1;    // 正常
            Exit;
        end
        else
        begin
            // ｷｬﾝｾﾙ
            result := 2;
            Exit;
        end;
    end;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnBeforeChangeColumn (TObject; TdxTreeListNode ...)	*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField        : TField;
	strExCode	  : String;
	strFormat	  : String;
    strName       : String;
    strNameSimple : String;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    // 外部ｺｰﾄﾞ
    if ( Column = 1 ) then
    begin
        with ( StdCmnDataSourceExist.DataSet ) do
        begin
            cField  := FieldByName ('strExCode');

            // 有効ｺｰﾄﾞ
			if	( not fnCheckExCodeValidCharacter (cField.AsString) ) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

			if ( StdCmnMemDataExist.State in [dsInsert] ) then
			begin
				if  ( Trim (cField.AsString) = '0' ) then
				begin
					Beep ();

					// 同一ｺｰﾄﾞが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,8);
					m_MjsMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_MjsMsgRec.sMsg, '@', 'コード' );
	    			MjsMessageBoxEx(AOwner, // <009>
                                    m_MjsMsgRec.sMsg,
                                    m_MjsMsgRec.sTitle,
                                    m_MjsMsgRec.icontype,
                                    m_MjsMsgRec.btntype,
                                    m_MjsMsgRec.btndef,
                                    m_MjsMsgRec.LogType
                                   );
					cField.FocusControl;
					Abort;
				end;

				if  ( m_nCurrentCodeAttr <= 1 ) then
				begin
					if ( StrToInt64 (Trim (cField.AsString)) = 0 ) then
					begin
						Beep ();
						cField.FocusControl;
						Abort;
					end;
				end;
			end;

            if ( not StdCmnGridExist.Columns [1].ReadOnly ) then
            begin
                if ( not fnCheckMasterDataRecordValid (cField.AsString) ) then
                begin
 	 	 	        Beep ();

					// 同一ｺｰﾄﾞが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,8);
					m_MjsMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_MjsMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(AOwner, // <009>
                                    m_MjsMsgRec.sMsg,
                                    m_MjsMsgRec.sTitle,
                                    m_MjsMsgRec.icontype,
                                    m_MjsMsgRec.btntype,
                                    m_MjsMsgRec.btndef,
                                    m_MjsMsgRec.LogType
                                   );

                    cField.FocusControl;
                    Abort;
                end;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <041>
                //
                //  一覧画面（実在）のｺｰﾄﾞ確定時に、ｸﾞﾙｰﾌﾟ管理を行っている場合は同期処理を
                //  実行する。親に既に存在した場合は同期を行う。存在しない場合は、通常処理。
                // -------------------------------------------------------------------------
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    if ( m_nCurrentCodeAttr <= 1 ) then
                            strExCode := Format ('%.16d', [StrToInt64 (Trim (cField.AsString))])    // 数値属性
                    else    strExCode := TrimRight (cField.AsString);                               // 文字属性

                    // 会社関連付処理
                    case fnCorpRelation ( strExCode, 0 ) of
                        0:  begin
                                // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                            end;
                        1:  begin
                                // 正常に関連付が行えた場合は、画面の再描画を行う
                                fnSetParentItemsInfo();
                                cField.FocusControl();
                                Abort;
                            end;
                        2:  begin
                                // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                                cField.FocusControl();
                                Abort;
                            end;
                        -1, -9: begin
                                // 実在合計不一致、例外ｴﾗｰ
                                Abort;
                            end;
                    end;
                end;
                // ↑↑↑<041>
                // -------------------------------------------------------------------------

                strExCode := TrimRight(cField.AsString);

				if ( m_nCurrentCodeAttr <= 1 ) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				StdCmnMemDataExist.FieldByName ('strExCode').AsString	:= strExCode;
            end;
        end;
    end;

    if  (Column = 3) then
    begin
        with (StdCmnGridExist) do
        begin
            strNameSimple   := DataSource.DataSet.FieldByName ('strNameSimple').AsString;

            if  (strNameSimple = '') then
            begin
                strName := DataSource.DataSet.FieldByName ('strName').AsString;

                if  (strName <> '') then
                begin
                    StdCmnGridExist.DataLink.Edit;

					if	(MjsHanLength(strName) <= 14) then
						StdCmnGridExist.Columns [4].Field.AsString  := MJSHanCopy (strName, 1, 14)
					else
						StdCmnGridExist.Columns [4].Field.AsString	:= MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnBeforeChangeColumn (TObject; TdxTreeListNode ...)	*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridTotalOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField        : TField;
	strExCode	  : String;
	strFormat	  : String;
    strName       : String;
    strNameSimple : String;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    // 外部ｺｰﾄﾞ
    if ( Column = 1 ) then
    begin
        with ( StdCmnDataSourceTotal.DataSet ) do
        begin
            cField  := FieldByName ('strExCode');

            // 有効ｺｰﾄﾞﾁｪｯｸ
			if	( not fnCheckExCodeValidCharacter (cField.AsString) ) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

            // '0'はNG
			if  ( Trim (cField.AsString) = '0' ) then
            begin
                Beep ();
                cField.FocusControl;
                Abort;
            end;

            if  ( m_nCurrentCodeAttr <= 1 ) then
            begin
                if  (StrToInt64 (Trim (cField.AsString)) = 0) then
                begin
                    Beep ();
                    cField.FocusControl;
                    Abort;
                end;
            end;

            if ( not StdCmnGridTotal.Columns [1].ReadOnly ) then
            begin
                if ( not fnCheckMasterDataRecordValid (cField.AsString) ) then
                begin
                    Beep ();

					// 同一ｺｰﾄﾞが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,8);
					m_MjsMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_MjsMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(AOwner, // <009>
                                    m_MjsMsgRec.sMsg,
                                    m_MjsMsgRec.sTitle,
                                    m_MjsMsgRec.icontype,
                                    m_MjsMsgRec.btntype,
                                    m_MjsMsgRec.btndef,
                                    m_MjsMsgRec.LogType
                                   );
                    cField.FocusControl;
                    Abort;
                end;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <041>
                //
                //  一覧画面（合計）のｺｰﾄﾞ確定時に、ｸﾞﾙｰﾌﾟ管理を行っている場合は同期処理を
                //  実行する。親に既に存在した場合は同期を行う。存在しない場合は、通常処理。
                // -------------------------------------------------------------------------
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    if ( m_nCurrentCodeAttr <= 1 ) then
                            strExCode := Format ('%.16d', [StrToInt64 (Trim (cField.AsString))])    // 数値属性
                    else    strExCode := TrimRight (cField.AsString);                               // 文字属性

                    // 会社関連付処理
                    case fnCorpRelation ( strExCode, 1 ) of
                        0:  begin
                                // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                            end;
                        1:  begin
                                // 正常に関連付が行えた場合は、画面の再描画を行う
                                fnSetParentItemsInfo();
                                cField.FocusControl();
                                Abort;
                            end;
                        2:  begin
                                // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                                cField.FocusControl();
                                Abort;
                            end;
                        -1, -9: begin
                                // 実在合計不一致、例外ｴﾗｰ
                                Abort;
                            end;
                    end;
                end;
                // ↑↑↑<041>
                // -------------------------------------------------------------------------

                strExCode := TrimRight(cField.AsString);

				if ( m_nCurrentCodeAttr <= 1 ) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode := Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				StdCmnMemDataTotal.FieldByName ('strExCode').AsString	:= strExCode;
            end;
        end;
    end;

    if  (Column = 3) then
    begin
        with (StdCmnGridTotal) do
        begin
            strNameSimple   := DataSource.DataSet.FieldByName ('strNameSimple').AsString;

            if  (strNameSimple = '') then
            begin
                strName := DataSource.DataSet.FieldByName ('strName').AsString;

                if  (strName <> '') then
                begin
                    StdCmnGridTotal.DataLink.Edit;

					if	(MjsHanLength(strName) <= 14) then
						StdCmnGridTotal.Columns [4].Field.AsString  := MJSHanCopy (strName, 1, 14)
					else
						StdCmnGridTotal.Columns [4].Field.AsString	:= MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnMouseDown (TObject; TMouseButton; TShiftState...)			*/
//*																											*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridExistOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;

begin
	if	((StdCmnGridExist.FocusedColumn = 0) or											// ﾌｫｰｶｽ位置: 0=付箋
		 (StdCmnGridExist.FocusedColumn = 6) or											// ﾌｫｰｶｽ位置:
    	 (StdCmnGridExist.FocusedColumn = 8)) then										// ﾌｫｰｶｽ位置:
	begin
		cField	:= StdCmnDataSourceExist.DataSet.FieldByName ('strExCode');
		cField.FocusControl ();

		Abort;
		Exit;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnMouseDown (TObject; TMouseButton; TShiftState...)			*/
//*																											*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridTotalOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;

begin
	if	(StdCmnGridTotal.FocusedColumn = 0) then										// ﾌｫｰｶｽ位置: 0=付箋
	begin
		cField	:= StdCmnDataSourceTotal.DataSet.FieldByName ('strExCode');
		cField.FocusControl ();

		Abort;
		Exit;
	end;
end;





//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnDataSourceExistOnStateChange (TObject)							*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnDataSourceExistOnStateChange (Sender: TObject);
begin
    if  (StdCmnMemDataExist.State in [dsInsert]) then
    	StdCmnGridExist.Columns [1].ReadOnly    := FALSE
    else
		StdCmnGridExist.Columns [1].ReadOnly    := TRUE;

	if  (StdCmnMemDataExist.Active and (StdCmnDataSourceExist.DataSet <> nil)) then
	begin
		if  (StdCmnGridExist.DataSource.DataSet.RecordCount = 0) then
        	StdCmnGridExist.Columns [1].ReadOnly    := FALSE;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnDataSourceTotalOnStateChange (TObject)							*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnDataSourceTotalOnStateChange (Sender: TObject);
begin
    if  (StdCmnMemDataTotal.State in [dsInsert]) then
    	StdCmnGridTotal.Columns [1].ReadOnly    := FALSE
    else
		StdCmnGridTotal.Columns [1].ReadOnly    := TRUE;

	if  (StdCmnMemDataTotal.Active and (StdCmnDataSourceTotal.DataSet <> nil)) then
	begin
		if  (StdCmnGridTotal.DataSource.DataSet.RecordCount = 0) then
        	StdCmnGridTotal.Columns [1].ReadOnly    := FALSE;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewOnDragOver (TObject; TObject; Integer; Integer ...)			*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnDragOver ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewOnDragOver (Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
    cNodeSrc     : TTreeNode;
	cNodeDst     : TTreeNode;
	cNodeTop	 : TTreeNode;
	cNodeTopNext : TTreeNode;
	cNodeLast	 : TTreeNode;
	cNodeLastPrev: TTreeNode;
	cNodeWork	 : TTreeNode;
	cNodeScroll	 : TTreeNode;
    stWorkRecSrc : ^TreeViewRec;
    stWorkRecDst : ^TreeViewRec;
	hNodeID		 : HTreeItem;
	nCountVisible: Integer;
	nCountLoop	 : Integer;
//	cNode		 : TTreeNode;

begin
    cNodeSrc        := CmnTreeView.Selected;
    stWorkRecSrc    := cNodeSrc.Data;
    cNodeDst		:= CmnTreeView.GetNodeAt (X, Y);									// ﾄﾞﾛｯﾌﾟ先ﾉｰﾄﾞ
	cNodeTop		:= CmnTreeView.TopItem;												// 一番上のﾉｰﾄﾞ
	cNodeTopNext	:= CmnTreeView.Items.GetNode (TreeView_GetNextVisible (CMnTreeView.Handle, cNodeTop.ItemId));
	cNodeLast		:= cNodeTop;
	cNodeLastPrev	:= nil;

	nCountVisible	:= TreeView_GetVisibleCount (CmnTreeView.Handle);					// 表示されているﾉｰﾄﾞ数

	for nCountLoop := 1 to nCountVisible do
	begin
		hNodeID	:= TreeView_GetNextVisible (CmnTreeView.Handle, cNodeLast.ItemId);

		if	(hNodeID = nil) then
			Break;

		if	(nCountLoop <= nCountVisible - 1) then
			cNodeLastPrev	:= CmnTreeView.Items.GetNode (hNodeID);

		cNodeLast	:= CmnTreeView.Items.GetNode (hNodeID);
	end;

	if	((cNodeDst = cNodeTop) or (cNodeDst = cNodeTopNext)) then
	begin
		cNodeWork	:= CmnTreeView.Items.GetNode (TreeView_GetPrevVisible (CmnTreeView.Handle, cNodeTop.ItemId));

		if	((cNodeWork <> nil) and (cNodeWork <> CmnTreeView.TopItem)) then
		begin
			CmnTreeView.TopItem	:= cNodeWork;
			CmnTreeView.Invalidate ();
		end;
	end
	else if	((cNodeDst = cNodeLast) or (cNodeDst = cNodeLastPrev)) then
	begin
		cNodeScroll	:= CmnTreeView.Items.GetNode (
										TreeView_GetNextVisible (CmnTreeView.Handle, CmnTreeView.TopItem.ItemId));

		if	(cNodeScroll <> nil) then
		begin
			cNodeWork			:= CmnTreeView.TopItem;
			CmnTreeView.TopItem	:= cNodeScroll;

			if	(cNodeWork <> CmnTreeView.TopItem) then
				CmnTreeView.Invalidate ();
		end;
	end;

	if	(stWorkRecSrc^.nDivision = 9) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	if	(cNodeDst = nil) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	///////////////////////////////////////////////////////////////////////////////////////////////////

	if	(not fnCheckMasterTreeInsertValid3 (cNodeSrc, cNodeDst)) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	if	((PTreeViewRec (cNodeDst.Data)^.nDivision = 0) or
		 (PTreeViewRec (cNodeDst.Data)^.nDivision = DIVISION_GENERAL)) then
		cNodeDst	:= cNodeDst.Parent;

	if	(PTreeViewRec (cNodeSrc.Data)^.nDivision = 1) then
	begin
        if	(not fnCheckMasterTreeInsertValid (
        				PTreeViewRec (cNodeSrc.Data)^.strExNCode, PTreeViewRec (cNodeDst.Data)^.strExNCode)) then
		begin
			Accept	:= FALSE;
			Exit;
		end;
	end;

	Exit;																				// 以下, 未処理

	///////////////////////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------------------HIS0021Start
	stWorkRecDst    := cNodeDst.Data;

	if stWorkRecDst^.nDivision = 0 then
		cNodeDst	:= cNodeDst.Parent;

	if (not fnCheckMasterTreeInsertValid2 (cNodeSrc, cNodeDst)) then
	begin
		Accept	:= FALSE;
		Exit;
	end;
//------------------------------------------------------------------------------HIS0021End
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewOnDragDrop (TObject; TObject; Integer; Integer)				*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnDragDrop ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewOnDragDrop (Sender, Source: TObject; X, Y: Integer);
var
    cNodeSrcParent    : TTreeNode;
    cNodeDstParent    : TTreeNode;
    cNodeSrc          : TTreeNode;
    cNodeDst          : TTreeNode;
    stWorkRecSrcParent: ^TreeViewRec;
    stWorkRecDstParent: ^TreeViewRec;
    stWorkRecSrc      : ^TreeViewRec;
    stWorkRecDst      : ^TreeViewRec;
	stRecWork		  : ^TreeViewRec;		//HIS0014
    strExNCodeDstParent: Extended;

	stWork			  : ^TreeViewRec;		//HIS0018
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    cNodeSrc        := CmnTreeView.Selected;
    cNodeDst        := CmnTreeView.DropTarget;
    cNodeSrcParent  := cNodeSrc.Parent;
//    cNodeDstParent  := cNodeDst.Parent;	//HIS0018



//------------------------------------------------------------------------------HIS0018Start
	stWork			:= cNodeDst.Data;

	//ﾀｰｹﾞｯﾄが実在の時は合計の親ﾃﾞｰﾀを取得
	if (DIVISION_GENERAL = stWork^.nDivision) or (stWork^.nDivision = 0) then
		cNodeDstParent	:= cNodeDst.Parent
	//ﾀｰｹﾞｯﾄが合計の時はﾀｰｹﾞｯﾄの合計ﾃﾞｰﾀを取得
	else
		cNodeDstParent	:= cNodeDst;
//------------------------------------------------------------------------------HIS0018End



    stWorkRecSrcParent  := cNodeSrcParent.Data;                                 // 挿入元親ﾃﾞｰﾀ

    if  (cNodeDstParent <> nil) then
        stWorkRecDstParent  := cNodeDstParent.Data                              // 挿入先親ﾃﾞｰﾀ
    else
        stWorkRecDstParent  := nil;                                             // 挿入先親ﾃﾞｰﾀ

    stWorkRecSrc    := cNodeSrc.Data;                                           // 挿入元ﾃﾞｰﾀ
    stWorkRecDst    := cNodeDst.Data;                                           // 挿入先ﾃﾞｰﾀ

    if  (stWorkRecDstParent = nil) then
        strExNCodeDstParent  := 0
    else
        strExNCodeDstParent  := stWorkRecDstParent^.strExNCode;

//-------------------------------------------------------------------------------------------------HIS0014Start
//	if stWorkRecSrcParent^.strExCode <> stWorkRecDstParent.strExCode then
    if stWorkRecSrcParent^.strExNCode <> strExNCodeDstParent then
	begin
		stRecWork		:= cNodeSrc.Data;

        if	(not fnCheckTreeViewDropItem (cNodeDst, stRecWork^.strExNCode, stRecWork^.nDivision)) then
			Exit;
	end;
//-------------------------------------------------------------------------------------------------HIS0014End

    if (stWorkRecSrc^.strExNCode       = stWorkRecDst^.strExNCode)  and
       (stWorkRecSrcParent^.strExNCode = strExNCodeDstParent     )  then
	begin
		Exit;
	end;

    fnInsertMasterTreeRecord (stWorkRecSrc^.strExNCode, stWorkRecSrcParent^.strExNCode,
                              stWorkRecDst^.strExNCode, strExNCodeDstParent, stWorkRecDst^.nDivision, ACCESS_CUTANDPASTE);

	fnUpdateTreeViewItemsEx (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent);

//	fnDeleteCheck();	//HIS0023

	CmnTreeView.FullExpand ();

	fnResetParentItemsInfo ();

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuOnPopup (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ OnPopup ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuOnPopup (Sender: TObject);
var
	nCount		   : Integer;
	strCaption	   : String;
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
	nTagDivision   : Integer;

begin

// <056> ADD start
											// 追加権限なしまたは修正権限なしの場合、付箋機能は無効にする
    CmnTreeViewPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;
	CmnTreeViewPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;
// <056> ADD end

    CmnTreeViewPopupMenuTagOff    .Visible	:= m_cJNTArea.IsFusen;              // <012>
	CmnTreeViewPopupMenuTagComment.Visible	:= m_cJNTArea.IsFusen;              // <012>


	for nCount := 1 to 8 do
    begin
    	if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
        begin
        	strCaption	:= m_stSelectItem [nCount].strItemCaption;
            break;
        end;
    end;

    cNode               := CmnTreeView.Selected;
    m_cNodeRightClick   := cNode;
    stWorkRec           := cNode.Data;

	m_cNodeRightClick.Selected	:= TRUE;

    if  (m_stWorkRecPaste.strExCode = '') then
		CmnTreeViewPopupMenuPaste.Enabled	:= FALSE
    else
		CmnTreeViewPopupMenuPaste.Enabled	:= TRUE;

    if	(not fnCheckMasterTreePasteValid (m_stWorkRecPaste.strExNCode, cNode)) then
		CmnTreeViewPopupMenuPaste.Enabled	:= FALSE;

	if	(m_stWorkRecPaste.nDivision = 1) then
    begin
//<015>        if  (not fnCheckMasterTreeInsertValid (m_stWorkRecPaste.strExNCode, stWorkRec^.strExNCode)) then
//<015>			CmnTreeViewPopupMenuPaste.Enabled	:= FALSE;
    //<015> --St--
        if  (not fnCheckMasterTreeInsertValidStr (m_stWorkRecPaste.strExCode, stWorkRec^.strExCode)) then
			CmnTreeViewPopupMenuPaste.Enabled	:= FALSE;
    //<015> --Ed--
    end;

    if  (stWorkRec^.nDivision = 9) then
    begin
		CmnTreeViewPopupMenuDetail.Enabled	:= FALSE;
		CmnTreeViewPopupMenuCopy  .Enabled	:= FALSE;
		CmnTreeViewPopupMenuDelete.Enabled	:= FALSE;
		CmnTreeViewPopupMenuTag01 .Enabled	:= FALSE;
		CmnTreeViewPopupMenuTag02 .Enabled	:= FALSE;
		CmnTreeViewPopupMenuTag03 .Enabled	:= FALSE;
		CmnTreeViewPopupMenuTag04 .Enabled	:= FALSE;

		CmnTreeViewPopupMenuTagOff    .Visible	:= FALSE;
		CmnTreeViewPopupMenuTagComment.Visible	:= FALSE;
	end
	else
	begin
		CmnTreeViewPopupMenuDetail.Enabled	:= TRUE;

		CmnTreeViewPopupMenuCopy .Enabled	:= m_IsUpdate;                      // <012>
		CmnTreeViewPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		CmnTreeViewPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		CmnTreeViewPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		CmnTreeViewPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;              // <012>

		if	(stWorkRec^.nDivision = DIVISION_GENERAL) then
		begin
			if	(fnCheckPermitGeneralRecDelete ()) then
				CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete      // <012>
			else
				CmnTreeViewPopupMenuDelete.Enabled	:= FALSE;
		end
		else
		begin
			CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete;         // <012>
		end;

        nTagDivision	:= fnGetMasterDataTagInfo (stWorkRec^.strExNCode);

		if	(nTagDivision > 0) then
		begin
			CmnTreeViewPopupMenuTagOff    .Visible	:= TRUE;
			CmnTreeViewPopupMenuTagComment.Visible	:= TRUE;

			case (nTagDivision) of
				1:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag01.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= FALSE;
						CmnTreeViewPopupMenuTag02 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag03 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag04 .Visible	:= TRUE;
					end;
				2:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag03.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag02 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag03 .Visible	:= FALSE;
						CmnTreeViewPopupMenuTag04 .Visible	:= TRUE;
					end;
				3:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag02.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag02 .Visible	:= FALSE;
						CmnTreeViewPopupMenuTag03 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag04 .Visible	:= TRUE;
					end;
				4:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag04.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag02 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag03 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag04 .Visible	:= FALSE;
					end;
			end;
		end
		else
		begin
			CmnTreeViewPopupMenuTagOff    .Visible	:= FALSE;
			CmnTreeViewPopupMenuTagComment.Visible	:= FALSE;

			CmnTreeViewPopupMenuTag01.Visible	:= TRUE;
			CmnTreeViewPopupMenuTag02.Visible	:= TRUE;
			CmnTreeViewPopupMenuTag03.Visible	:= TRUE;
			CmnTreeViewPopupMenuTag04.Visible	:= TRUE;
		end;
    end;

    cNodeParent := cNode.Parent;

    if  (cNodeParent = nil) then
		CmnTreeViewPopupMenuErase.Enabled	:= FALSE
    else
    begin
        stWorkRecParent := cNodeParent.Data;

        if  (stWorkRecParent^.nDivision = 9) then
			CmnTreeViewPopupMenuErase.Enabled	:= FALSE
        else
		begin
//<012>			if (giReferFlag	<>	REFER) then
			CmnTreeViewPopupMenuErase.Enabled	:= m_IsUpdate                   // <012>
//<012>			else
//<012> 			CmnTreeViewPopupMenuErase.Enabled	:= FALSE;
		end;
    end;

	if	(CmnTreeViewPopupMenuDelete.Enabled) then
	begin
		cNode	:= cNode.GetFirstChild ();

		if	(cNode <> nil) then
			CmnTreeViewPopupMenuDelete.Enabled	:= FALSE;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuAddTotalOnClick (TObject)                           */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[合計補助追加] OnClick ｲﾍﾞﾝﾄ                                */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
{	HIS0001
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuAddTotalOnClick (Sender: TObject);
var
    cNode: TTreeNode;

begin
    cNode           := m_cNodeRightClick;
    cNode.Selected  := TRUE;

    fnSetParentItemsInfo ();

    StdCmnTab.Items [0].Selected    := FALSE;
    StdCmnTab.Items [1].Selected    := TRUE;

    m_cACControl    := StdCmnGridTotal;
    m_cACControl.SetFocus ();
end;
}

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuAddExistOnClick (TObject)                           */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[実在補助追加] OnClick ｲﾍﾞﾝﾄ                                */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
{	HIS0001
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuAddExistOnClick (Sender: TObject);
var
    cNode: TTreeNode;

begin
    cNode           := m_cNodeRightClick;
    cNode.Selected  := TRUE;

    fnSetParentItemsInfo ();

    StdCmnTab.Items [1].Selected    := FALSE;
    StdCmnTab.Items [0].Selected    := TRUE;

    m_cACControl    := StdCmnGridExist;
	m_cACControl.SetFocus ();
end;
}

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuDetailOnClick (TObject)								*/
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細] OnClick ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCmnTreeViewPopupMenuDetailOnClick (Sender: TObject);
var
	cNode: TTreeNode;

begin
    cNode           := m_cNodeRightClick;
    cNode.Selected  := TRUE;

	fnShowDetailScreen ();

	CmnToolbarButtonDetail.Caption:= '一覧(&T)';
    fnSetFncType(True,0);     //<017>

//	HIS0005	*****
	DtlCmnButtonUpdate.Enabled	:=	TRUE;		//	更新ボタン
	DtlCmnButtonCancel.Enabled	:=	TRUE;		//	取消ボタン

	if (giReferFlag	= REFER) then								//	参照時		HIS0002
	begin
		DtlCmnButtonUpdate.Enabled	:=	FALSE;		//	更新ボタン
		DtlCmnButtonCancel.Enabled	:=	FALSE;		//	取消ボタン
		CmnTreeView.SetFocus;
		exit;
	end;
//***************
	if	(m_nCurrentCodeAttr <= 1) then
		m_cACControl	:= DtlCmnEditExCodeNumeric
	else
		m_cACControl	:= DtlCmnEditExCodeFree;

	m_cACControl.SetFocus ();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuCutOnClick (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[切り取り] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuCutOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
    dqMasterTree   : TMQuery;

begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

	m_cDataModule.BeginTran (m_cDBSelect);                                      // ﾄﾗﾝｻﾞｸｼｮﾝの開始

    cNode           := m_cNodeRightClick;
    cNodeParent     := cNode.Parent;
    stWorkRec       := cNode.Data;
    stWorkRecParent := cNodeParent.Data;

    m_stWorkRecPaste.nDivision  := stWorkRec^.nDivision;
    m_stWorkRecPaste.strExNCode := stWorkRec^.strExNCode;
    m_stWorkRecPaste.strExCode  := stWorkRec^.strExCode;
    m_stWorkRecPaste.strName    := stWorkRec^.strName;

    dqMasterTree    := TMQuery.Create (Self);                                   // MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);                 // DBとMQueryの接続

    with (dqMasterTree) do
    begin
		Close ();
		SQL.Clear();
        SQL.Add('DELETE FROM HojyoTree                  '
            +   'WHERE MasterKbn  = :nMasterDivision    '
            +   '  AND SumNCode   = :strDstCode         '
            +   '  AND BasedNCode = :strSrcCode         ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strDstCode'     ).AsFloat     := stWorkRecParent^.strExNCode;
        ParamByName ('strSrcCode'     ).AsFloat     := stWorkRec^      .strExNCode;
		ExecSQL();

        if  (Status <> 0) then                                                  // ｴﾗｰ
        begin
            m_cDataModule.Rollback (m_cDBSelect);                               // ﾛｰﾙﾊﾞｯｸ(破棄)
            Exit;
        end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;
    end;

    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)

    fnResetParentItemsInfo ();
    fnRebuildTreeViewItems ();

	dqMasterTree.Free ();

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuCopyOnClick (TObject)                               */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｺﾋﾟｰ] OnClick ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuCopyOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;

begin
    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

    m_stWorkRecPaste.nDivision  := stWorkRec^.nDivision;
    m_stWorkRecPaste.strExCode  := stWorkRec^.strExCode;
    m_stWorkRecPaste.strName    := stWorkRec^.strName;

    m_stWorkRecPaste.strExNCode := stWorkRec^.strExNCode;

    cNode.Selected  := TRUE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuPasteOnClick (TObject)                              */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[張り付け] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuPasteOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
    strExNCodeParent: Extended;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    cNode           := m_cNodeRightClick;
    cNodeParent     := cNode.Parent;
    stWorkRec       := cNode.Data;

    if  (cNodeParent = nil) then
        stWorkRecParent := nil
    else
        stWorkRecParent := cNodeParent.Data;

    if  (stWorkRecParent = nil) then
        strExNCodeParent := 0
    else
        strExNCodeParent := stWorkRecParent^.strExNCode;

    fnInsertMasterTreeRecord (m_stWorkRecPaste.strExNCode, 0, stWorkRec^.strExNCode,
                              strExNCodeParent, stWorkRec^.nDivision, ACCESS_PASTE);

	fnUpdateTreeViewItemsEx2 (cNode, m_stWorkRecPaste.strExCode, m_stWorkRecPaste.nDivision);

//	fnDeleteCheck();	//HIS0023

	CmnTreeView.FullExpand ();

    fnResetParentItemsInfo ();

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuDeleteOnClick (TObject)                             */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[削除] OnClick ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuDeleteOnClick (Sender: TObject);
var
	cNode		: TTreeNode;
	stWorkRec	: ^TreeViewRec;
	strMessage	: String;
	nDivision	: Integer;
    strErr      : String;
    strMsg      : String;
    strCode     : String;
//<061>	    strName     : String;

begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

	cNode       := m_cNodeRightClick;
	stWorkRec   := cNode.Data;

	m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 4);

	strMessage	:= '"' + stWorkRec^.strName + '"のレコードを' +  m_MjsMsgRec.sMsg;

	if	(MJSMessageBoxEx (AOwner,   // <009>
                          strMessage,
                          m_MjsMsgRec.sTitle,
                          m_MjsMsgRec.icontype,
                          m_MjsMsgRec.btntype,
                          m_MjsMsgRec.btndef,
                          m_MjsMsgRec.LogType) = mrYes) then
	begin
        // <043>↓
        // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if not fnDelCheck(stWorkRec^.strExNCode, m_nCurrentMasterDiv, strErr) then
        begin
            strCode := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, m_nCurrentCodeAttr);
                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strMsg := strCode + ' ' + stWorkRec^.strName + ' ' + strErr;
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <043>↑

		if	(stWorkRec^.nDivision = DIVISION_GENERAL) then
			    nDivision	:= 0
		else    nDivision	:= stWorkRec^.nDivision;

		fnDeleteMasterRecord (nDivision, stWorkRec^.strExCode);
		fnResetParentItemsInfo ();
	end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnTreeViewPopupMenuEraseOnClick (TObject)                              */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[体系消去] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuEraseOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
	cNodeErase	   : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    cNode           := m_cNodeRightClick;
	cNodeErase		:= cNode;
    stWorkRec       := cNode.Data;
    cNode           := cNode.Parent;
    stWorkRecParent := cNode.Data;

    fnEraseMasterTreeRecord (stWorkRec^.strExNCode, stWorkRecParent^.strExNCode);
	fnEraseTreeViewItems    (cNodeErase);
    fnResetParentItemsInfo  ();

	CmnTreeView.FullExpand ();

//	fnRebuildTreeViewItems ();

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;






//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnClientPanelExistOnResize (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnClientPanelExistOnResize (Sender: TObject);
var
    cScrollBar  : TScrollBar;
    nScrollWidth: Integer;
    nPanelWidth : Integer;
    nNameWidth  : Integer;

begin
    cScrollBar      := TScrollBar.Create (self);
    cScrollBar.Kind := sbVertical;
    nScrollWidth    := cScrollBar.Width;

    cScrollBar.Free;

    nPanelWidth := (Sender as TMPanel).ClientWidth - nScrollWidth;

    if  (nPanelWidth <= (WIDTH_E_MINIMUM + StdCmnGridExist.GrIndicatorWidth)) then
        exit;

    nNameWidth  := nPanelWidth - ((WIDTH_E_MINIMUM + StdCmnGridExist.GrIndicatorWidth) - WIDTH_E_NAME);

    StdCmnGridExistName.Width    := nNameWidth;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnClientPanelTotalOnResize (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnClientPanelTotalOnResize (Sender: TObject);
var
    cScrollBar  : TScrollBar;
    nScrollWidth: Integer;
    nPanelWidth : Integer;
    nNameWidth  : Integer;

begin
    cScrollBar      := TScrollBar.Create (self);
    cScrollBar.Kind := sbVertical;
    nScrollWidth    := cScrollBar.Width;

    cScrollBar.Free;

    nPanelWidth := (Sender as TMPanel).ClientWidth - nScrollWidth;

    if  (nPanelWidth <= (WIDTH_T_MINIMUM + StdCmnGridExist.GrIndicatorWidth)) then
        exit;

    nNameWidth  := nPanelWidth - ((WIDTH_T_MINIMUM + StdCmnGridExist.GrIndicatorWidth) - WIDTH_T_NAME);

    StdCmnGridTotalName.Width    := nNameWidth;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnEditing (TObject; TdxTreeListNode; var Boolean)        */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ OnEditing ｲﾍﾞﾝﾄ                                         */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistOnEditing (Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
//	StdCmnGridExist.FocusedField.DataSet.Edit;
//	StdCmnGridExist.FocusedField.AsString   := Node.Strings [StdCmnGridExist.FocusedColumn];
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnEditing (TObject; TdxTreeListNode; var Boolean)        */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ OnEditing ｲﾍﾞﾝﾄ                                         */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridTotalOnEditing (Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
//	StdCmnGridTotal.FocusedField.DataSet.Edit;
//	StdCmnGridTotal.FocusedField.AsString   := Node.Strings [StdCmnGridTotal.FocusedColumn];
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistOnKeyPress (TObject; Char)										*/
//*																											*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(StdCmnGridExist.FocusedColumn = 1) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			if	(((Key < '0') or (Key > '9')) and
				  (Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
			begin
				Beep ();
				Abort;
			end;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalOnKeyPress (TObject; Char)										*/
//*																											*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridTotalOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(StdCmnGridTotal.FocusedColumn = 1) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			if	(((Key < '0') or (Key > '9')) and
				  (Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
			begin
				Beep ();
				Abort;
			end;
		end;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridExistCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridExistCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
var
    strFormat: String;

begin

    if  (m_nCurrentCodeAttr <= 1) then
    begin
        case (m_nCurrentCodeAttr) of
            0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        end;

        if  (AText <> '') then
            AText   := Format (strFormat, [StrToInt64 (Trim (AText))]);
    end

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnGridTotalCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnStdCmnGridTotalCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
var
    strFormat: String;

begin
    if  (m_nCurrentCodeAttr <= 1) then
    begin
        case (m_nCurrentCodeAttr) of
            0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        end;

        if  (AText <> '') then
            AText   := Format (strFormat, [StrToInt64 (Trim (AText))]);
    end
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditExCodeOnEnter (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnEnter ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditExCodeOnEnter (Sender: TObject);
begin
	fnCommonFunctionOnEnter02 (Sender);

	m_fDtlChangeExCode	:= FALSE;
//<017>    fnSetFncType(0);    //<005>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditExCodeOnChange (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditExCodeOnChange (Sender: TObject);
begin
	m_fDtlChangeExCode	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditExCodeOnExit (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditExCodeOnExit (Sender: TObject);
var
	fNewRecord: Boolean;
    stWorkRec : ^TreeViewRec;
    cNode     : TTreeNode;
	strExCode : String;
	nCount    : Integer;
begin

	if ( m_pRec^.m_pChildForm = nil ) then
		Exit;

	if	(not m_fDtlChangeExCode) then
		Exit;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;

	if	(m_fDtlNewRecord) then
	begin
		if	(not fnCheckMasterDataRecordValid (strExCode)) then
		begin
			Beep ();

			m_cACControl	:= DtlCmnEditExCodeNumeric;
			m_cACControl.SetFocus ();

			Abort;
		end;

		Exit;
	end;

	m_fDtlNewRecord	:= FALSE;

	fNewRecord	:= fnResetDetailScreen ();

	if	(fNewRecord) then																// 新規ﾚｺｰﾄﾞ
	begin
		if	(DtlCmnTab.Items [0].Selected) then
			fnChangeComponentState (0)
		else
			fnChangeComponentState (1);

		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
        m_fDtlNewRecord		:= TRUE;
	end
    else
	begin
		for nCount := 1 to CmnTreeView.Items.Count do
		begin
			stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

			if	(CompareStr (stWorkRec^.strExCode, strExCode) = 0) then
			begin
				CmnTreeView.Items [nCount - 1].Selected	:= TRUE;
				Break;
			end;
		end;;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditNameOnKeyDown (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[正式名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditNameOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	strDuplicateDesc: String;
begin
	strDuplicateDesc	:= '';

	if	(DtlCmnEditNameSimple.Text = '') then
	begin
		if	(MjsHanLength(DtlCmnEditName.Text) <= 14) then
			strDuplicateDesc	:= DtlCmnEditName.Text
		else
			strDuplicateDesc	:= MJSKabuCut (DtlCmnEditName.Text, 14);
	end;

	if	(Key = VK_RETURN) then
	begin
		if	(strDuplicateDesc <> '') then
			DtlCmnEditNameSimple.Text	:= strDuplicateDesc;

		MjsDispCtrl.MjsNextCtrl (Self);

		Exit;
	end;

	// <023> -->
	if	(Key = VK_ESCAPE) then
	begin
		if ( m_nCurrentCodeAttr <= 1 ) then
            // 数値属性
			DtlCmnEditExCodeNumeric.SetFocus()
		else
            // ﾌﾘｰ属性
			DtlCmnEditExCodeFree.SetFocus();

		Exit;
	end
	else if	(Key = VK_END) then
	begin
		DtlCmnButtonUpdate.SetFocus ();

		Exit;
    end;
	// <023> <--

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);

		Exit;
	end;

	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
			begin
				if	(strDuplicateDesc <> '') then
					DtlCmnEditNameSimple.Text	:= strDuplicateDesc;

				MJSDispCtrl.MjsNextCtrl (Self);
			end;
		end
		else
		begin
			if	(strDuplicateDesc <> '') then
				DtlCmnEditNameSimple.Text	:= strDuplicateDesc;

			MJSDispCtrl.MjsNextCtrl (Self);
		end;

		Exit;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditNameSimpleOnEnter (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditNameSimpleOnEnter (Sender: TObject);
begin


//<017>	m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 19);
//<017>	CmnStatusBar.SimpleText	:= m_MjsMsgRec.sMsg;
    fnSetFncType(True,7);   //<017>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnEditNameSimpleOnExit (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditNameSimpleOnExit (Sender: TObject);
begin
//<017>	CmnStatusBar.SimpleText	:= '';
    fnSetFncType(False,7);   //<017>
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDtlCmnEditAppDateStartOnExit (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[適用開始年月日] OnExit ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditAppDateStartOnExit (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	(not (fnCheckCommonDetailScreenValue (2))) then
	begin
		Beep ();
		DtlCmnEditAppDateStart.SetFocus ();
		Abort;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDtlCmnEditAppDateEndOnExit (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[適用終了年月日] OnExit ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnEditAppDateEndOnExit (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	(not (fnCheckCommonDetailScreenValue (3))) then
	begin
		Beep ();
		DtlCmnEditAppDateEnd.SetFocus ();
		Abort;
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnButtonUpdateOnClick (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 更新ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnButtonUpdateOnClick (Sender: TObject);
var
//<061>   	fNewRecord  : Boolean;
    iLoop       : Integer;
    stWorkRec   : ^TreeViewRec;
    strExCode   : String;
    bFlg        : Boolean;
    iSumKbn     : Integer;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    // -------------------------------------------------------------------------
    //  会社関連付処理 <041>
    //
    //  親子同時に同一ｺｰﾄﾞを指定し、詳細画面の更新ﾎﾞﾀﾝを押下した場合の処理
    //  通常ならば、ｺｰﾄﾞ指定時で同期関連付を行うが、同時同一ｺｰﾄﾞの場合の
    //  考慮が必要。
    // -------------------------------------------------------------------------
    bFlg := False;  // 同期ﾌﾗｸﾞ
    iSumKbn := 0;
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( m_RowState = STATE_INSERT ) then
    begin
        if ( m_nCurrentCodeAttr <= 1 ) then
                strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])    // 数値属性
        else    strExCode := TrimRight (DtlCmnEditExCodeFree.Text);                       // 文字属性

        // 実在/合計区分
    	if ( DtlCmnTab.Items [0].Selected ) then
        		iSumKbn := 0   // 実在
    	else    iSumKbn := 1;  // 合計

        case fnCorpRelation ( strExCode, iSumKbn ) of
            0:  begin
                    // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                    bFlg := false;  // 通常更新を行う
                end;
            1:  begin
                    // 正常に関連付が行えた場合は、画面の再描画を行う
                    // ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理
            		fnCleanupTreeViewNewItem (false);
                    // 詳細画面表示処理
                    fnShowDetailScreen ();
                    bFlg := true;
                end;
            2:  begin
                    // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                    // ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理
                    fnCleanupTreeViewNewItem (TRUE);
                    // 詳細画面再ｾｯﾄ処理
            		fnResetDetailScreen ();
                    bFlg := true;
                end;
            -1, -9: begin
                    // 実在合計不一致、例外ｴﾗｰ
                    Abort;
                end;
        end;
    end;
    // ↑↑↑<041>
    // -------------------------------------------------------------------------

    if ( not bFlg ) then
    begin
        // 更新処理
        if ( fnUpdateDetailsScreenRecord () ) then  // 正常
        begin
            // ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理
            fnCleanupTreeViewNewItem (false);
            // 詳細画面表示処理
            fnShowDetailScreen ();
        end
        else                                        // 異常
        begin
            // ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理
            fnCleanupTreeViewNewItem (TRUE);
            // 詳細画面再ｾｯﾄ処理
            fnResetDetailScreen ();
    	end;
    end;

 	m_fChangeDetails := FALSE;

    // 外部ｺｰﾄﾞの桁数、属性の設定
   	if  (m_nCurrentCodeAttr <= 1) then
    begin
		strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])  // 数値属性
    end
	else
	begin
		DtlCmnEditExCodeFree.Text := TrimRight (DtlCmnEditExCodeFree.Text);     // ﾌﾘｰ属性
		strExCode := DtlCmnEditExCodeFree.Text;
	end;

    // TreeViewの検索
    for iLoop := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec := CmnTreeView.Items[iLoop - 1].Data;

        // ﾋｯﾄする外侮ｺｰﾄﾞを検索
        if ( CompareStr (stWorkRec^.strExCode, strExCode) = 0 ) then
        begin
            CmnTreeView.Items[iLoop - 1].Selected := true;
            break;
        end;
    end;

    // ﾌｫｰｶｽ設定
	if ( m_nCurrentCodeAttr <= 1 ) then
    		m_cACControl := DtlCmnEditExCodeNumeric     // 数値属性
	else    m_cACControl := DtlCmnEditExCodeFree;       // ﾌﾘｰ属性
	m_cACControl.SetFocus ();

    // ﾌﾘｰﾀﾞｲｱﾛｸﾞの初期化<005>
    if ( m_UpdFreeFlg ) then
    begin
        m_UpdFreeFlg := false;
        m_freeItem   := m_freeItemNull;
    end;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDtlCmnButtonCancelOnClick (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 取消ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnButtonCancelOnClick (Sender: TObject);
var
	nReturn: Integer;

begin
	nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	if	(nReturn = CONFIRM_THROUGH) then
	begin
		fnCleanupTreeViewNewItem (TRUE);
		fnResetDetailScreen		 ();

		m_fChangeDetails	:= FALSE;

        //<018>--St--
        case DtlCmnTab.Items.Selected of
            0:  Pnl_SegBunInfo.Visible  :=  TRUE;
            1:  Pnl_SegBunInfo.Visible  :=  FALSE;
        end;
        //<018>--Ed--

		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();
	end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnSetParentItemsInfoEx (Integer; String; String; String)				*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親に対する子情報をｾｯﾄ									*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision			= 実在/合計区分 (0:実在, 1:合計, 9:総合計)							*/
//*           strExCode         = 補助内部ｺｰﾄﾞ													    */
//*			  strExCodeParent	= 補助内部ｺｰﾄﾞ(親)													*/
//*			  strName			= 名称																*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnSetParentItemsInfoEx (nDivision: Integer; strExCode : String; strExNCode : Extended;
    strExCodeParent: String; strExNCodeParent: Extended; strName: String);
var
    dqMasterData    :   TMQuery;
	strFormat	    :   String;
	strCaption	    :   String;
	iCount		    :   Integer;
	iCount2		    :   Integer;
begin
	Prog1.Position		:= 0;		//HIS0033
	Prog1.Visible		:= TRUE;    //HIS0033

    // 実在
	if	((nDivision = 0) or (nDivision = DIVISION_GENERAL)) then
	begin
        if	(strExCodeParent = '') then
			Exit;

        m_strExNCodeCurrent	:= strExNCodeParent;
        m_strExCodeCurrent	:= strExCodeParent;
	end
	else
	begin
		if	(strExCode = '') then
			Exit;

		m_strExCodeCurrent	:= strExCode;
        m_strExNCodeCurrent	:= strExNCode;
//		m_strExCodeCurrent	:= '          ';
	end;

	strCaption	:= '';

//    m_strExCodeCurrent  :=  strExCode;

	if	(m_strExCodeCurrent <> '          ') then
	begin
    	if  (m_nCurrentCodeAttr <= 1) then
		begin
        	case (m_nCurrentCodeAttr) of
            	0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            	1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        	end;

        	strCaption	:= Format (strFormat, [StrToInt64 (Trim (m_strExCodeCurrent))]);
			strCaption	:= strCaption + ' ';
    	end
		else
			strCaption	:= m_strExCodeCurrent + ' ';
	end;

    strCaption				:= strCaption + strName;
	StdCmnTab.BorderCaption := strCaption;
	DtlCmnTab.BorderCaption := strCaption;


	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	StdCmnMemDataExist.Active	:= FALSE;
	StdCmnMemDataTotal.Active	:= FALSE;
	StdCmnMemDataExist.Active	:= TRUE;
	StdCmnMemDataTotal.Active	:= TRUE;

	StdCmnMemDataCustomer.Open;
	StdCmnMemDataSupplier.Open;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

    with (dqMasterData) do
    begin
	    Close();
		SQL.Clear();
        SQL.Add('SELECT Count(ht.BasedNCode) as Count                                   '
            +   'FROM   HojyoTree ht, HojyoMA hm LEFT OUTER JOIN MFusenInfo fi          '
		    +   'ON     fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode             '
		    +   'WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumNCode = :strExCode    '
		    +   '  AND ht.MasterKbn  = hm.MasterKbn     AND hm.RDelKbn  = 0             '
            +   '  AND ht.BasedNCode = hm.NCode                                         ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat 	:= m_strExNCodeCurrent;
		Open();

		if ( not Eof ) then
			    iCount	:= GetFld('Count').AsInteger
		else    iCount	:= 0;

		Close();
		SQL.Clear();
        SQL.Add('SELECT ht.BasedNCode, hm.SumKbn, hm.Renso, hm.LongName, hm.SimpleName, '
		    +   '       hm.HojyoKbn1, hm.HojyoKbn2, fi.FusenKbn, fi.FusenCmnt, hm.GCode '
            +   'FROM   HojyoTree ht, HojyoMA hm LEFT OUTER JOIN MFusenInfo fi          '
		    +   'ON     fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode             '
		    +   'WHERE  ht.MasterKbn  = :nMasterDivision AND ht.SumNCode = :strExCode   '
		    +   '  AND  ht.MasterKbn  = hm.MasterKbn     AND hm.RDelKbn  = 0            '
            +   '  AND  ht.BasedNCode = hm.NCode                                        '
		    +   'ORDER BY ht.EntNo                                                      ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat 	:= m_strExNCodeCurrent;
		Open();

		iCount2	:= 1;

		while ( not EOF ) do
		begin
			fnSetGridMemData (dqMasterData);

			if ( iCount <> 0 ) then
			begin
				Prog1.Position	:= iCount2 * 100 div iCount;
				inc(iCount2);
			end;

			NEXT;
		end;

		Close();
    end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	Prog1.Visible		:= FALSE;

	dqMasterData.Free ();

end;



//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnInitializeDetailScreen (Boolean)												*/
//*																											*/
//*	目的	: 補助登録処理 詳細画面初期化処理																*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: fClearExCode	= 外部ｺｰﾄﾞ消去 (TRUE:する, FALSE:しない)										*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnInitializeDetailScreen (fClearExCode: Boolean);
var
	nCount  :   Integer;
begin
	if	(fClearExCode) then
	begin
		DtlCmnEditExCodeNumeric.Value		:= 0;
		DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
		DtlCmnEditExCodeFree   .Text		:= '';
	end;

	DtlCmnEditAssociation .Text		:= '';										// 連想ｼﾝﾎﾞﾙ
	DtlCmnEditName        .Text		:= '';										// 正式名称
	DtlCmnEditNameSimple  .Text		:= '';										// 簡略名称
	DtlCmnEditAppDateStart.Value	:= 0;										// 適用開始期間
	DtlCmnEditAppDateStart.Clear ();
	DtlCmnEditAppDateEnd  .Value	:= 0;										// 適用終了期間
	DtlCmnEditAppDateEnd  .Clear ();

    // ｾｸﾞﾒﾝﾄ分類<003>
    for nCount := 1 to  10 do
    begin
        TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(nCount))).Text    :=  '';
        TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(nCount))).Caption :=  '';
    end;

    // 汎用補助分類<003>
    for nCount := 1 to  10 do
    begin
        TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(nCount))).Text    :=  '';
        TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(nCount))).Caption :=  '';
    end;


	m_nSelectTagKind	:= 0;

	DtlCmnImgFusen.Picture	:= nil; // <001>

//<064> ADD St
    m_UpdFreeFlg := FALSE;
    m_freeItem   := m_freeItemNull;
//<064> ADD Ed
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnSetDetailScreenInfo (String; var Integer)									*/
//*																											*/
//*	目的	: 補助登録処理 詳細情報を詳細画面にｾｯﾄ															*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:新規ﾚｺｰﾄﾞ, FALSE:既存ﾚｺｰﾄﾞ)													*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP016000f.fnSetDetailScreenInfo (strExCode: String; var nSumDivision: Integer): Boolean;
var
	dqMasterData    :   TMQuery;
	fNewRecord      :   Boolean;
//<061>		sName		    :   String;
    strExNCode      :   Extended;
    i               :   Integer;
    nName           :   String;
begin

	fNewRecord	:= TRUE;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= fNewRecord;

		Exit;
	end;

	fnInitializeDetailScreen (FALSE);

	dqMasterData    := TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
        // -----------------------------
        //  HojyoMAの内部ｺｰﾄﾞを取得
        // -----------------------------
    	Close ();
		SQL.Clear ();
        SQL.Add('SELECT NCODE FROM HOJYOMA              '
            +   'WHERE  MasterKbn = :nMasterDivision    '
            +   '  AND  RDelKbn   = 0                   '
            +   '  AND  GCode     = :strGCode           ');
        ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strGCode'       ).AsString	:= strExCode;
        Open();

        strExNCode  :=  FieldByName('NCODE').AsFloat;

        Close();
		SQL.Clear();
        SQL.Add('SELECT hm.SumKbn,      hm.GCode,           '
            +   '       hm.Renso,       hm.LongName,        '
            +   '       hm.SimpleName,  hm.NCode,           '
            +   '       hm.HojyoKbn1,   hm.HojyoKbn2,       '
            +   '       hm.BunCode,     hm.BSBumonNCode,    '
            +   '       hm.CostRate,    hm.TStartDate,      '
            +   '       hm.TEndDate,    hm.LimitSum,        '
            +   '       hm.RootKbn,     hm.Syokuchikbn,     '
            +   '       hm.BunruiNCode1,hm.BunruiNCode2,    '
            +   '       hm.BunruiNCode3,hm.BunruiNCode4,    '
            +   '       hm.BunruiNCode5,hm.BunruiNCode6,    '
            +   '       hm.BunruiNCode7,hm.BunruiNCode8,    '
            +   '       hm.BunruiNCode9,hm.BunruiNCode10,   '
            +   '       hm.SegNCode1,   hm.SegNCode2,       '
            +   '       hm.SegNCode3,   hm.SegNCode4,       '
            +   '       hm.SegNCode5,   hm.SegNCode6,       '
            +   '       hm.SegNCode7,   hm.SegNCode8,       '
            +   '       hm.SegNCode9,   hm.SegNCode10,      '
            +   '       fi.FusenKbn,    fi.FusenCmnt        '
            +   'FROM HojyoMA hm                            '
            +   '   LEFT OUTER JOIN MFusenInfo fi ON        '
            +   '       (fi.MasterKbn = hm.MasterKbn)       '
            +   '   AND (fi.NCode     = hm.NCode)           '
            +   'WHERE  hm.MasterKbn = :nMasterDivision     '
            +   '  AND  hm.RDelKbn   = 0                    '
            +   '  AND  hm.NCode     = :strNCode            ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strNCode'       ).AsFloat 	:= strExNCode;

        Open ();

		if ( not dqMasterData.Eof ) then
        begin
			if ( m_nCurrentCodeAttr <= 1 ) then
			begin
				DtlCmnEditExCodeNumeric.Value		:= StrToInt64 (Trim (FieldByName ('GCode').AsString));
				DtlCmnEditExCodeNumeric.InputFlag	:= FALSE;
			end
			else
				DtlCmnEditExCodeFree.Text	:= FieldByName ('GCode').AsString;
			m_fDtlChangeExCode	:= FALSE;	// 051121 広田　変化なしにする

			DtlCmnEditSumDivision.Value	:= FieldByName ('SumKbn')       .AsInteger;
            DtlCmnEditAssociation.Text	:= FieldByName ('Renso')        .AsString;
			DtlCmnEditName       .Text	:= FieldByName ('LongName')     .AsString;
			DtlCmnEditNameSimple .Text	:= FieldByName ('SimpleName')   .AsString;

            // 実在時の場合、適用開始・終了日付,分類,ｾｸﾞﾒﾝﾄを表示する
			if	(FieldByName ('SumKbn').AsInteger = 0) then
            begin
                // 適用開始・終了日付
                fnCheckTekiDate(dqMasterData);

                // ｾｸﾞﾒﾝﾄ・汎用補助分類<003>
                for i := 1 to  10 do
                begin
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).Text
                    :=  gfnGetSegBunGCode(m_arAdoptInfo_Seg [i].nMasterDivision,
                        dqMasterData.FieldByName('SegNCode' + IntToStr(i)).AsFloat);

                    nName   :=  '';
                    fnGetNAME(TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).Text,
                        m_arAdoptInfo_Seg [i].nMasterDivision,m_arAdoptInfo_Seg [i].nCodeAttribute,nName);

                    // ﾗﾍﾞﾙに名称をｾｯﾄ
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(i))).Caption := nName;

                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).Text
                    := gfnGetSegBunGCode(m_arAdoptInfo_HBr [i].nMasterDivision,
                        dqMasterData.FieldByName('BunruiNCode' + IntToStr(i)).AsFloat);

                    nName   :=  '';
                    fnGetNAME(TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).Text,
                        m_arAdoptInfo_Hbr [i].nMasterDivision,m_arAdoptInfo_Hbr [i].nCodeAttribute,nName);

                    // ﾗﾍﾞﾙに名称をｾｯﾄ
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(i))).Caption := nName;
                end;
            end;

            if ( FieldByName('SyokuchiKbn').AsInteger = 1 ) then
			begin
				nSumDivision	:= DIVISION_GENERAL;
				fnChangeComponentState (nSumDivision);
			end
			else
			begin
				nSumDivision	:= FieldByName ('SumKbn').AsInteger;
				fnChangeComponentState (nSumDivision);
			end;

            // 付箋情報
			m_nSelectTagKind	:= FieldByName ('FusenKbn').AsInteger;

			case (m_nSelectTagKind) of
				0:  begin
                        DtlCmnImgFusen.Picture	:= nil;                                     // <001>
                    end;
				1:  begin
                        DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);  // <001>
                        CmnToolbarButtonTag.ImageIndex	:=  m_nSelectTagKind - 1;           // <001>
                    end;
				2:  begin
                        DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);  // <001>
                        CmnToolbarButtonTag.ImageIndex	:=  m_nSelectTagKind;               // <001>
                    end;
				3:  begin
                        DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);  // <001>
                        CmnToolbarButtonTag.ImageIndex	:=  m_nSelectTagKind - 2;           // <001>
                    end;
				4:  begin
                        DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);  // <001>
                        CmnToolbarButtonTag.ImageIndex	:=  m_nSelectTagKind - 1;           // <001>
                    end;
			end;
            DtlCmnImgFusen.Visible  :=  TRUE;   // <001>

			fNewRecord	:= FALSE;

            // ﾌｧﾝｸｼｮﾝ設定<002>
//<005>            fnSetFncType(1);
        end
		else
        begin
			fNewRecord	:= TRUE;

            // ﾌｧﾝｸｼｮﾝ設定<002>
//<005>            fnSetFncType(0);
        end;

		Close ();
    end;

	Result	:= fNewRecord;

	dqMasterData.Free ();

end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnGetNameSimple (Integer)												*/
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
function    TJNTCRP016000f.fnGetNameSimple (nExCode: Integer): String;
var
	dqMasterData : TMQuery;
	strNameSimple: String;

begin
	dqMasterData    := TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

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
		SQL.Add   ('WHERE  MasterKbn = 3 AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :nExCode');

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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnShowDetailScreen ()																*/
//*																											*/
//*	目的	: 補助登録処理 詳細画面表示処理																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnShowDetailScreen ();
var
	cNode       : TTreeNode;
	stWorkRec   : ^TreeViewRec;
	nSumDivision: Integer;
	strExCode	: String;

begin
	m_fUnderConstruction	:= TRUE;

	strExCode	:= '';

	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then							// 実在補助ｸﾞﾘｯﾄﾞ
	begin
		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
		else
            strExCode	:=  StdCmnMemDataExist.FieldByName ('strExCode').AsString;

		nSumDivision	:= 0;
	end
	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then						// 合計補助ｸﾞﾘｯﾄﾞ
	begin
		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
		else
			strExCode	:=  StdCmnMemDataTotal.FieldByName ('strExCode').AsString;

		nSumDivision	:= 1;
	end
	else if (Screen.ActiveControl.Name = DtlCmnButtonUpdate.Name) then			//更新ボタンが押された時
	begin
		if m_nCurrentCodeAttr <= 1 then
 		   	strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		else
			strExCode	:= DtlCmnEditExCodeFree.Text;

        if DtlCmnTab.Items[0].Selected = TRUE then
			nSumDivision	:= 0
		else
			nSumDivision	:= 1;
	end
	else																				// ﾂﾘｰﾋﾞｭｰ
	begin

	    cNode		:= CmnTreeView.Selected;
    	stWorkRec	:= cNode.Data;
		strExCode	:= stWorkRec^.strExCode;

		nSumDivision	:= stWorkRec^.nDivision;
	end;

	if	(strExCode = '') then
	begin
		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		else
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
			strExCode	:= DtlCmnEditExCodeFree.Text;
		end;
	end;

	fnSetDetailScreenInfo (strExCode, nSumDivision);

	case (nSumDivision) of
		0, DIVISION_GENERAL:
			begin
				DtlCmnTab.Items [0].Selected	:= TRUE;
				DtlCmnTab.Items [1].Selected	:= FALSE;
			end;
		1:	begin
				DtlCmnTab.Items [1].Selected	:= TRUE;
				DtlCmnTab.Items [0].Selected	:= FALSE;
			end;
	end;

    StdCmnClientPanel.Visible	:= FALSE;
    DtlCmnClientPanel.Visible	:= TRUE;

     // <030>
    if	(nSumDivision <> DIVISION_GENERAL) then
	begin
        if (Screen.ActiveControl.Name = StdCmnGridExist.Name) then
            Pnl_SegBunInfo.Visible  :=  TRUE;

        // <047> - ST
        if ( Screen.ActiveControl.Name = CmnTreeView.Name ) then
        begin
            if ( nSumDivision = 0 ) then
                    Pnl_SegBunInfo.Visible  := true
            else    Pnl_SegBunInfo.Visible  := false;
        end;
        // <047> - ED
    end;
    // <030>

	m_fUnderConstruction	:= FALSE;
	m_fChangeDetails		:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnResetDetailScreen ()													*/
//*																									*/
//*	目的	: 補助登録処理 詳細画面再ｾｯﾄ処理														*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:新規ﾚｺｰﾄﾞ, FALSE:既存ﾚｺｰﾄﾞ)											*/
//*																									*/
//***************************************************************************************************/
function	TJNTCRP016000f.fnResetDetailScreen (): Boolean;
var
	strExCode   : String;
	fNewRecord	: Boolean;
	nSumDivision: Integer;

begin
	if  (m_nCurrentCodeAttr <= 1) then
	begin
		if	(DtlCmnEditExCodeNumeric.InputFlag and (Trunc (DtlCmnEditExCodeNumeric.Value) = 0)) then
			strExCode	:= ''
		else
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	end
	else
    begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;

	fNewRecord	:= fnSetDetailScreenInfo (strExCode, nSumDivision);

	StdCmnClientPanel.Visible	:= FALSE;
	DtlCmnClientPanel.Visible	:= TRUE;

	Result	:= fNewRecord;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnResetParentItemsInfo ()													*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親に対する子情報を再ｾｯﾄ								*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnResetParentItemsInfo ();
var
    strParentCaption: String;
    nCount          : Integer;
    dqMasterData    : TMQuery;

begin
    dqMasterData    := TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続

    if  (m_strExCodeCurrent = '          ') then
    begin
        for nCount := 1 to 8 do
        begin
            if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
            begin
                strParentCaption    := m_stSelectItem [nCount].strItemCaption + '体系';
                break;
            end;
        end;
    end
    else
    begin
        with (dqMasterData) do
        begin
		    Close ();

			SQL.Clear ();

            SQL.Add ('SELECT SimpleName FROM HojyoMA       ');
        	SQL.Add ('WHERE  MasterKbn = :nMasterDivision  ');
            SQL.Add ('  AND  SumKbn  = 1                   ');
            SQL.Add ('  AND  RDelKbn = 0                   ');
            SQL.Add ('  AND  GCode = :strExCode            ');

            ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
            ParamByName ('strExCode'      ).AsString    := m_strExCodeCurrent;


		    Open ();

            strParentCaption    := dqMasterData.FieldByName ('SimpleName').AsString;

			Close ();
        end;
    end;

    StdCmnTab.BorderCaption := ' ' + strParentCaption;
	DtlCmnTab.BorderCaption	:= ' ' + strParentCaption;

    StdCmnMemDataExist.Active	:= FALSE;
    StdCmnMemDataTotal.Active	:= FALSE;
    StdCmnMemDataExist.Active	:= TRUE;
    StdCmnMemDataTotal.Active	:= TRUE;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT ht.BasedNCode, hm.SumKbn, hm.Renso, hm.LongName, hm.SimpleName,    ');
		SQL.Add ('       hm.HojyoKbn1, hm.HojyoKbn2, fi.FusenKbn, fi.FusenCmnt, hm.GCode    ');
        SQL.Add ('FROM   HojyoTree ht, HojyoMA hm LEFT OUTER JOIN MFusenInfo fi             ');
		SQL.Add ('ON     fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode                ');
		SQL.Add ('WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumNCode = :strExCode       ');
		SQL.Add ('  AND  ht.MasterKbn = hm.MasterKbn     AND hm.RDelKbn  = 0                ');
		SQL.Add ('  AND ht.BasedNCode = hm.NCode    ORDER BY ht.EntNo                       ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsFloat 	:= m_strExNCodeCurrent;

		Open ();

		while (not EOF) do
		begin
			fnSetGridMemData (dqMasterData);
			NEXT;
		end;

		Close ();
    end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	dqMasterData.Free ();
end;










//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnUpdateTreeViewItemsEx (TTreeNode; TTreeNode; TTreeNode; TTreeNode)				*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeSrc			= 挿入(加算)元ﾉｰﾄﾞ															*/
//*			  cNodeSrcParent	= 挿入(加算)元ﾉｰﾄﾞ(親)														*/
//*			  cNodeDst			= 挿入(加算)先ﾉｰﾄﾞ															*/
//*			  cNodeDstParent	= 挿入(加算)先ﾉｰﾄﾞ(親)														*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnUpdateTreeViewItemsEx (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent: TTreeNode);
var
    cNodeWork     : TTreeNode;															// ﾉｰﾄﾞ Work
    cNodeDstWork  : TTreeNode;															// ﾉｰﾄﾞ Work
    cNodeSrcOther : TTreeNode;
    cNodeDstOther : TTreeNode;
    stRecSrc      : ^TreeViewRec;														// 挿入元ﾉｰﾄﾞ･ﾃﾞｰﾀ
    stRecDst      : ^TreeViewRec;														// 挿入先ﾉｰﾄﾞ･ﾃﾞｰﾀ
    stRecSrcParent: ^TreeViewRec;														// 挿入元ﾉｰﾄﾞ･ﾃﾞｰﾀ(親)
    stRecDstParent: ^TreeViewRec;														// 挿入先ﾉｰﾄﾞ･ﾃﾞｰﾀ(親)
    stRecTreeItem : ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
    nCount        : Integer;															// ｶｳﾝﾀｰ
	strExCodeWork : String;																// 補助外部ｺｰﾄﾞ Work

begin
	stRecSrc		:= cNodeSrc.Data;													// 挿入元ﾉｰﾄﾞ     ﾃﾞｰﾀ取得
	stRecDst		:= cNodeDst.Data;													// 挿入先ﾉｰﾄﾞ     ﾃﾞｰﾀ取得
	stRecSrcParent	:= cNodeSrcParent.Data;												// 挿入元ﾉｰﾄﾞ(親) ﾃﾞｰﾀ取得

	if	(cNodeDstParent <> nil) then
		stRecDstParent  := cNodeDstParent.Data											// 挿入先ﾉｰﾄﾞ(親) ﾃﾞｰﾀ取得
	else
		stRecDstParent	:= nil;

	if	((stRecDst^.nDivision = 0) or (stRecDst^.nDivision = DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
	begin
		cNodeSrc.MoveTo (cNodeDst, naInsert);											// 挿入元ﾉｰﾄﾞを挿入先(子)ﾉｰﾄﾞの前に移動

		cNodeDstWork	:= cNodeDstParent;

		if	(stRecDstParent <> nil) then
			strExCodeWork	:= stRecDstParent^.strExCode
		else
			strExCodeWork	:= '';
	end
	else																				// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
	begin
		cNodeSrc.MoveTo (cNodeDst, naAddChild);											// 挿入元ﾉｰﾄﾞを挿入先(親)ﾉｰﾄﾞの子として末尾に移動

		cNodeDstWork	:= cNodeDst;
		strExCodeWork	:= stRecDst^.strExCode;
	end;

	for nCount := 1 to CmnTreeView.Items.Count do										// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ検索
	begin
		if  (CmnTreeView.Items [nCount - 1] = cNodeDstWork) then						// 挿入先(親)ﾉｰﾄﾞと同一は除く
			Continue;

		stRecTreeItem   := CmnTreeView.Items [nCount - 1].Data;							// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if  (CompareStr (stRecTreeItem^.strExCode, strExCodeWork) = 0) then				// 挿入先(親)ｱｲﾃﾑと外部ｺｰﾄﾞが一致
		begin
			cNodeSrcOther   := nil;
			cNodeDstOther   := nil;

			if	((stRecDst^.nDivision <> 0) and (stRecDst^.nDivision <> DIVISION_GENERAL)) then		// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
				cNodeDstOther	:= CmnTreeView.Items [nCount - 1];									// 現在のﾉｰﾄﾞを保存

			cNodeWork       := CmnTreeView.Items [nCount - 1].GetFirstChild ();						// 先頭の子ﾉｰﾄﾞ取得

			while (TRUE) do
			begin
				if  (cNodeWork = nil) then
					Break;

				stRecTreeItem   := cNodeWork.Data;													// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

				if  (CompareStr (stRecTreeItem^.strExCode, stRecSrc^.strExCode) = 0) then			// 挿入元ｱｲﾃﾑと外部ｺｰﾄﾞが一致
                    cNodeSrcOther   := cNodeWork;

				if	((stRecDst^.nDivision <> 0) and (stRecDst^.nDivision <> DIVISION_GENERAL) and (cNodeSrcOther <> nil)) then
					Break;

				if	((stRecDst^.nDivision = 0) or (stRecDst^.nDivision = DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
				begin
					if  (CompareStr (stRecTreeItem^.strExCode, stRecDst^.strExCode) = 0) then		// 挿入先ｱｲﾃﾑと外部ｺｰﾄﾞが一致
						cNodeDstOther   := cNodeWork;
				end;

				cNodeWork   := cNodeWork.GetNextSibling ();											// 次の子ﾉｰﾄﾞ取得
			end;

            if  (cNodeSrcOther <> nil) then															// 挿入元ｱｲﾃﾑと同一のｱｲﾃﾑが存在した場合
			begin
				if	((stRecDst^.nDivision = 0) or (stRecDst^.nDivision = DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
					cNodeSrcOther.MoveTo (cNodeDstOther, naInsert)
				else																	// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
					cNodeSrcOther.MoveTo (cNodeDstOther, naAddChild)
			end
			else
				fnInsertTreeViewItemsEx (cNodeDstOther, stRecSrc^.strExCode, stRecSrc^.nDivision);
		end;
	end;

	if  (CompareStr (stRecSrcParent^.strExCode, strExCodeWork) <> 0) then				// 挿入元と先の(親)ｱｲﾃﾑが違う場合
	begin
		nCount  := 0;

		while (TRUE) do
		begin
			nCount  := nCount + 1;

			if	(CmnTreeView.Items.Count < nCount) then
				Break;

			stRecTreeItem   := CmnTreeView.Items [nCount - 1].Data;						// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

			if  (CompareStr (stRecTreeItem^.strExCode, stRecSrcParent^.strExCode) = 0) then		// 挿入元親ｱｲﾃﾑと外部ｺｰﾄﾞが一致
			begin
				cNodeSrcOther   := nil;
				cNodeWork       := CmnTreeView.Items [nCount - 1].GetFirstChild ();		// 先頭の子ﾉｰﾄﾞ取得

				while (TRUE) do
				begin
					if  (cNodeWork = nil) then
						Break;

					stRecTreeItem	:= cNodeWork.Data;									// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

					if	((cNodeWork <> cNodeSrc) and
						 (CompareStr (stRecTreeItem^.strExCode, stRecSrc^.strExCode) = 0)) then		// 挿入元ｱｲﾃﾑと外部ｺｰﾄﾞが一致
					begin
						cNodeSrcOther   := cNodeWork;									// 削除用にﾉｰﾄﾞを保存
						Break;
					end;

					cNodeWork   := cNodeWork.GetNextSibling ();							// 次の子ﾉｰﾄﾞ取得
				end;

				if  (cNodeSrcOther <> nil) then
					cNodeSrcOther.Delete ();
			end;
		end;
	end;

	nCount  := 0;

	while (TRUE) do
	begin
		nCount  := nCount + 1;

		if  (CmnTreeView.Items.Count < nCount) then
			Break;

		if  (CmnTreeView.Items [nCount - 1] <> cNodeDstWork) then					// 挿入先(親)ﾉｰﾄﾞのみ対象
			Continue;

		stRecTreeItem   := CmnTreeView.Items [nCount - 1].Data;						// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if  (CompareStr (stRecTreeItem^.strExCode, stRecSrcParent^.strExCode) = 0) then		// 挿入元親ｱｲﾃﾑと外部ｺｰﾄﾞが一致
		begin
			cNodeSrcOther   := nil;
			cNodeWork       := CmnTreeView.Items [nCount - 1].GetFirstChild ();		// 先頭の子ﾉｰﾄﾞ取得

			while (TRUE) do
			begin
				if  (cNodeWork = nil) then
					Break;

				stRecTreeItem	:= cNodeWork.Data;									// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

				if	((cNodeWork <> cNodeSrc) and
					 (CompareStr (stRecTreeItem^.strExCode, stRecSrc^.strExCode) = 0)) then		// 挿入元ｱｲﾃﾑと外部ｺｰﾄﾞが一致
				begin
					cNodeSrcOther   := cNodeWork;									// 削除用にﾉｰﾄﾞを保存
					Break;
				end;

				cNodeWork   := cNodeWork.GetNextSibling ();							// 次の子ﾉｰﾄﾞ取得
			end;

			if  (cNodeSrcOther <> nil) then
				cNodeSrcOther.Delete ();
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnUpdateTreeViewItemsEx2 (TTreeNode; String; Integer)								*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget   = ｱｲﾃﾑ挿入ﾉｰﾄﾞ																	*/
//*           strExCode     = 挿入元ｱｲﾃﾑ 補助外部ｺｰﾄﾞ														*/
//*           nDivision     = 挿入元ｱｲﾃﾑ 実在/合計区分 (0:実在, 1:合計)										*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnUpdateTreeViewItemsEx2 (cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
var
	cNodeWork	  : TTreeNode;
	cNodeDstWork  : TTreeNode;
    cNodeDstOther : TTreeNode;
	stRecWork	  : ^TreeViewRec;
	stRecTarget	  : ^TreeViewRec;
	stRecTreeItem : ^TreeViewRec;
	nCount		  : Integer;

begin
	fnInsertTreeViewItemsEx (cNodeTarget, strExCode, nDivision);

	stRecTarget	:= cNodeTarget.Data;

	if	((stRecTarget^.nDivision = 0) or (stRecTarget^.nDivision = DIVISION_GENERAL)) then
	begin
		cNodeDstWork	:= cNodeTarget.Parent;
		stRecWork		:= cNodeTarget.Parent.Data;
	end
	else
	begin
		cNodeDstWork	:= cNodeTarget;
		stRecWork		:= cNodeTarget.Data;
	end;

	for nCount := 1 to CmnTreeView.Items.Count do										// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ検索
	begin
		if  (CmnTreeView.Items [nCount - 1] = cNodeDstWork) then						// 挿入先(親)ﾉｰﾄﾞと同一は除く
			Continue;

		stRecTreeItem   := CmnTreeView.Items [nCount - 1].Data;							// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if  (CompareStr (stRecTreeItem^.strExCode, stRecWork^.strExCode) = 0) then		// 挿入先(親)ｱｲﾃﾑと外部ｺｰﾄﾞが一致
		begin
			cNodeDstOther   := nil;

			if	((stRecTarget^.nDivision <> 0) and (stRecTarget^.nDivision <> DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
				cNodeDstOther	:= CmnTreeView.Items [nCount - 1]										// 現在のﾉｰﾄﾞを保存
			else
			begin
				cNodeWork	:= CmnTreeView.Items [nCount - 1].GetFirstChild ();			// 先頭の子ﾉｰﾄﾞ取得

				while (TRUE) do
				begin
					if  (cNodeWork = nil) then
						Break;

					stRecTreeItem   := cNodeWork.Data;									// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

					if  (CompareStr (stRecTreeItem^.strExCode, stRecTarget^.strExCode) = 0) then	// 挿入先ｱｲﾃﾑと外部ｺｰﾄﾞが一致
					begin
						cNodeDstOther   := cNodeWork;
						Break;
					end;

					cNodeWork   := cNodeWork.GetNextSibling ();							// 次の子ﾉｰﾄﾞ取得
				end;
			end;

            if  (cNodeDstOther <> nil) then												// 挿入元ｱｲﾃﾑと同一のｱｲﾃﾑが存在した場合
				fnInsertTreeViewItemsEx (cNodeDstOther, strExCode, nDivision);
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnDeleteTreeViewItems (String)													*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ削除処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnDeleteTreeViewItems (strExCode: String);
var
	stRecTreeBase: ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	stRecTreeItem: ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	cNodeBase	 : TTreeNode;															// 子ﾉｰﾄﾞ
	cNodeChild	 : TTreeNode;															// 子ﾉｰﾄﾞ
	cNodeTarget	 : TTreeNode;															// 子ﾉｰﾄﾞ
	nCount       : Integer;																// ｶｳﾝﾀｰ
	fMove		 : Boolean;

begin
	nCount	:= 0;

	while (TRUE) do
	begin
    	nCount	:= nCount + 1;

		if  (CmnTreeView.Items.Count < nCount) then
			Break;

		stRecTreeItem	:= CmnTreeView.Items [nCount - 1].Data;							// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if  (CompareStr (stRecTreeItem^.strExCode, strExCode) = 0) then					// 外部ｺｰﾄﾞが一致
		begin
			if	((stRecTreeItem^.nDivision = 1) or (stRecTreeItem^.nDivision = DIVISION_GENERAL)) then
			begin
				cNodeChild	:= CmnTreeView.Items [nCount - 1].GetFirstChild ();

				while (TRUE) do
				begin
					if  (cNodeChild = nil) then
						Break;

					stRecTreeItem	:= cNodeChild.Data;									// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

					fMove	:= TRUE;

					cNodeBase	:= CmnTreeView.Items [0].GetFirstChild ();

					while (TRUE) do
					begin
						if  (cNodeBase = nil) then
							Break;

						stRecTreeBase	:= cNodeBase.Data;

						if	(CompareStr (stRecTreeBase^.strExCode, stRecTreeItem^.strExCode) = 0) then
						begin
							fMove	:= FALSE;
							Break;
						end;

						cNodeBase	:= cNodeBase.GetNextSibling ();						// 次の子ﾉｰﾄﾞ取得
					end;

					cNodeTarget	:= cNodeChild;
					cNodeChild	:= cNodeChild.GetNextSibling ();						// 次の子ﾉｰﾄﾞ取得

					if	(fMove) then
						cNodeTarget.MoveTo (CmnTreeView.Items [0], naAddChild);			// 挿入先ﾉｰﾄﾞの子として末尾に移動
				end;
			end;

			CmnTreeView.Items [nCount - 1].Delete ();
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnEraseTreeViewItems (TTreeNode)													*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ(体系)消去処理														*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget	= 体系消去対象ﾉｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnEraseTreeViewItems (cNodeTarget: TTreeNode);
var
	strExCodeParent: String;															//
	strExCodeTarget: String;															//
	stRecTreeItem  : ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	cNodeChild	   : TTreeNode;															// 子ﾉｰﾄﾞ
	nCount         : Integer;															// ｶｳﾝﾀｰ
	nDivisionTarget: Integer;
	fCreateNode	   : Boolean;

    strExNCodeParent: Extended;
//<061>    strExNCodeTarget: Extended;

begin
	nCount	:= 0;

	stRecTreeItem	    := cNodeTarget.Data;
	strExCodeTarget	    := stRecTreeItem^.strExCode;
//<061>    strExNCodeTarget	:= stRecTreeItem^.strExNCode;
	nDivisionTarget	    := stRecTreeItem^.nDivision;
	stRecTreeItem	    := cNodeTarget.Parent.Data;
	strExCodeParent	    := stRecTreeItem^.strExCode;
    strExNCodeParent    := stRecTreeItem^.strExNCode;

	while (TRUE) do
	begin
		nCount	:= nCount + 1;

		if  (CmnTreeView.Items.Count < nCount) then
			Break;

		stRecTreeItem	:= CmnTreeView.Items [nCount - 1].Data;							// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if	(CompareStr (stRecTreeItem^.strExCode, strExCodeParent) = 0) then			// 親外部ｺｰﾄﾞが一致
		begin
			cNodeChild	:= CmnTreeView.Items [nCount - 1].GetFirstChild ();

			while (TRUE) do
			begin
				if  (cNodeChild = nil) then
					Break;

				stRecTreeItem	:= cNodeChild.Data;										// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

				if	(CompareStr (stRecTreeItem^.strExCode, strExCodeTarget) = 0) then	// 外部ｺｰﾄﾞが一致
				begin
					cNodeChild.Delete ();
					Break;
				end;

				cNodeChild	:= cNodeChild.GetNextSibling ();							// 次の子ﾉｰﾄﾞ取得
			end;
		end;
	end;

	if m_fUpDeleteRecord = FALSE then
		Exit;

	fCreateNode	:= FALSE;

	cNodeChild	:= CmnTreeView.Items [0].GetFirstChild ();

	while (TRUE) do
	begin
		if	(cNodeChild = nil) then
		begin
			fCreateNode	:= TRUE;
			Break;
		end;

		stRecTreeItem	:= cNodeChild.Data;												// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

		if	(CompareStr (stRecTreeItem^.strExCode, strExCodeTarget) = 0) then			// 外部ｺｰﾄﾞが一致
		begin
			fCreateNode	:= FALSE;
			Break;
		end;

		cNodeChild	:= cNodeChild.GetNextSibling ();									// 次の子ﾉｰﾄﾞ取得
	end;

	if	(fCreateNode) then
		fnInsertTreeViewItemsEx (CmnTreeView.Items [0], strExCodeTarget, nDivisionTarget);

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnInsertTreeViewItemsEx (TTreeNode; String; Integer)							*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ挿入処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget   = ｱｲﾃﾑ挿入ﾉｰﾄﾞ																	*/
//*           strExCode     = 挿入元ｱｲﾃﾑ 補助外部ｺｰﾄﾞ														*/
//*           nDivision     = 挿入元ｱｲﾃﾑ 実在/合計区分 (0:実在, 1:合計)										*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP016000f.fnInsertTreeViewItemsEx (cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
var
    dqMasterData: TMQuery;
    dqMasterTree: TMQuery;
	stRecTarget	: ^TreeViewRec;
    stRecInsert : ^TreeViewRec;

    sCode       : String;
begin
    dqMasterData    := TMQuery.Create (Self);
    dqMasterTree    := TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT GCode, NCode, SimpleName FROM HojyoMA   ');
        SQL.Add ('WHERE  MasterKbn = :nMasterKbn                    ');
        SQL.Add ('  AND  RDelKbn   = 0                              ');
        SQL.Add ('  AND  GCode     = :strGCode                      ');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strGCode'  ).AsString     := strExCode;


		Open ();

		if  (EOF) then
		begin
			Close ();

			dqMasterData.Free ();
			dqMasterTree.Free ();

		    Exit;
		end;

		stRecTarget	:= cNodeTarget.Data;

        New (stRecInsert);

        stRecInsert^.nDivision  := nDivision;
        stRecInsert^.strExCode  := strExCode;

        stRecInsert^.strName    := FieldByName ('SimpleName').AsString;

        stRecInsert^.strExNCode := FieldByName ('NCode').AsFloat;

        if m_nCurrentCodeAttr = 0 then
            sCode   := m_cComArea.SetDspCodeAttr(stRecInsert^.strExCode, m_nCurrentCodeDigit, 0)
        else if m_nCurrentCodeAttr = 1 then
            sCode   := m_cComArea.SetDspCodeAttr(stRecInsert^.strExCode, m_nCurrentCodeDigit, 1)
        else
            sCode   := m_cComArea.SetDspCodeAttr(stRecInsert^.strExCode, m_nCurrentCodeDigit, 2);

        if	((stRecTarget^.nDivision = 0) or (stRectarget^.nDivision = DIVISION_GENERAL)) then
        	cNodeTarget := CmnTreeView.Items.InsertObject   (cNodeTarget, MakeDspString(sCode, stRecInsert^.strName), stRecInsert)
		else
			cNodeTarget	:= CmnTreeView.Items.AddChildObject (cNodeTarget, MakeDspString(sCode, stRecInsert^.strName), stRecInsert);

		if	((stRecInsert^.nDivision = 0) or (stRecInsert^.nDivision = DIVISION_GENERAL)) then
		begin
			cNodeTarget.ImageIndex		:= 1;
			cNodeTarget.SelectedIndex	:= 3;
		end
		else
        begin
			cNodeTarget.ImageIndex		:= 0;
			cNodeTarget.SelectedIndex	:= 2;
		end;

		Close ();
    end;

    if  ((nDivision = 0) or (nDivision = DIVISION_GENERAL)) then
	begin
		dqMasterData.Free ();
		dqMasterTree.Free ();
        Exit;
	end;

    with (dqMasterTree) do
    begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT ht.SumNCode, ht.BasedNCode, hm.SumKbn, hm.SimpleName, hm.NCode, hm.Syokuchikbn ');
        SQL.Add (',hm.GCode '); //<016> Add
        SQL.Add ('FROM   HojyoTree ht, HojyoMA hm                                 ');
        SQL.Add ('WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumNCode = :strSumCode  ');
        SQL.Add ('  AND  hm.Masterkbn = ht.Masterkbn     AND hm.RDelKbn  = 0            ');
        SQL.Add ('  AND  hm.NCode     = ht.BasedNCode   ORDER BY EntNo DESC             ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsFloat 	:= stRecInsert^.strExNCode;

		Open ();

		while (not EOF) do
		begin
            fnCreateTreeViewItem (dqMasterTree, cNodeTarget);
			NEXT;
		end;

		Close ();
    end;

	dqMasterData.Free ();
	dqMasterTree.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnInsertMasterTreeRecord (String; String; String;                         */
//*                                                                 String; Integer; Integer)       */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ ﾚｺｰﾄﾞ挿入処理                                		    */
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	     = 挿入(加算)元補助外部ｺｰﾄﾞ                                         */
//*			  strRcCodeSrcParent = 挿入(加算)元補助外部ｺｰﾄﾞ(親)							            */
//*			  strRcCodeDst       = 挿入(加算)先補助外部ｺｰﾄﾞ								            */
//*			  strRcCodeDstParent = 挿入(加算)先補助外部ｺｰﾄﾞ(親)							            */
//*           nDivisionDst       = 挿入(加算)先補助実在/合計区分 (0:実在, 1:合計)                   */
//*           nAccessMethod      = 挿入方法 (ACCESS_PASTE:Paste, ACCESS_CUTANDPASTE:Cut&Paste)      */
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnInsertMasterTreeRecord (strExNCodeSrc: Extended; strExNCodeSrcParent: Extended;
                                                     strExNCodeDst: Extended; strExNCodeDstParent: Extended; nDivisionDst: Integer; nAccessMethod: Integer);
var
	dqMasterTree    :   TMQuery;
	nEntryNo        :   Integer;
	nChangeOrder    :   Integer;
    strExNCodeWork  :   Extended;
begin

    // MQueryの構築
	dqMasterTree	:= TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);

    // 挿入先が実在
	if  (( nDivisionDst = 0 ) or ( nDivisionDst = DIVISION_GENERAL )) then
	begin
        nChangeOrder    := fnGetMasterTreeEntryNo (dqMasterTree, strExNCodeDst, strExNCodeDstParent);

        if  ( nChangeOrder = -1 ) then
            nChangeOrder    := fnGetMasterTreeEntryNo (dqMasterTree, strExNCodeDst, strExNCodeDstParent);
    end
    // 挿入先が合計
    else
        nChangeOrder    := 0;

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
    m_cDataModule.BeginTran (m_cDBSelect);

    if  ( nAccessMethod = ACCESS_CUTANDPASTE ) then
    begin
        with (dqMasterTree) do
        begin
		    Close();
			SQL.Clear();
            SQL.Add('DELETE FROM HojyoTree                  '
			    +   'WHERE  MasterKbn  = :nMasterDivision   '
                +   '  AND  SumNCode   = :strDstCode        '
                +   '  AND  BasedNCode = :strSrcCode        ');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strDstCode'     ).AsFloat 	:= strExNCodeSrcParent;
			ParamByName ('strSrcCode'     ).AsFloat 	:= strExNCodeSrc;
			ExecSQL ();

            // ｴﾗｰ
            if  ( Status <> 0 ) then
            begin
                // ﾛｰﾙﾊﾞｯｸ(破棄)
                m_cDataModule.Rollback (m_cDBSelect);
				dqMasterTree .Free	   ();
                Exit;
            end;

			m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
			m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;
        end;
    end;

    if  ( nChangeOrder = 0 ) then
    begin
        nEntryNo        :=  fnGetMasterTreeEntryNoFinal (dqMasterTree, strExNCodeDst);
        strExNCodeWork  :=  strExNCodeDst;
    end
    else
    begin
        nEntryNo        :=  nChangeOrder;
        strExNCodeWork  :=  strExNCodeDstParent;
    end;

    with (dqMasterTree) do
    begin
		Close();
		SQL.Clear();
        SQL.Add('INSERT INTO HojyoTree (    '
            +   '    MasterKbn              '
            +   '   ,PatternNo              '
            +   '   ,SumNCode               '
            +   '   ,EntNo                  '
            +   '   ,BasedNCode             '
            +   '   ,UpdTantoNCode          '
            +   ') VALUES (                 '
            +   '    :nMasterDivision       '
            +   '   ,0                      '
            +   '   ,:strSumCode            '
            +   '   ,:nEntryNo              '
            +   '   ,:strBasedCode          '
            +   '   ,:UpdTantoNCode         '
            +   ')                          ');

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsFloat     := strExNCodeWork;
		ParamByName ('nEntryNo'       ).AsInteger   := nEntryNo;
		ParamByName ('strBasedCode'   ).AsFloat     := strExNCodeSrc;
        ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;
		ExecSQL();

        // ｴﾗｰ
        if  ( Status <> 0 ) then
        begin
            // ﾛｰﾙﾊﾞｯｸ(破棄)
            m_cDataModule.Rollback (m_cDBSelect);
			dqMasterTree .Free	   ();
            Exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
    end;

    // ｺﾐｯﾄ(反映)
    m_cDataModule.Commit (m_cDBSelect);
	dqMasterTree .Free();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnRewriteMasterTreeRecords (String)										*/
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 登録№再採番												*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeParent	= 再採番を行う補助外部ｺｰﾄﾞ(親)										*/
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnRewriteMasterTreeRecords (strExNCodeParent: Extended);
var
    dqMasterTreeSelect: TMQuery;
    dqMasterTreeUpdate: TMQuery;
    nCount            : Integer;

begin
    m_cDataModule.BeginTran (m_cDBSelect);                                      // tﾗﾝｻﾞｸｼｮﾝの開始

    nCount  := 1;

    dqMasterTreeSelect  := TMQuery.Create (Self);                               // MQueryの構築
    dqMasterTreeUpdate  := TMQuery.Create (Self);                               // MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeSelect);           // DBとMQueryの接続	                                    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeUpdate);           // DBとMQueryの接続	                                    // DBとMQueryの接続

    with (dqMasterTreeSelect) do
    begin
        Close ();

        SQL.Clear ();
        SQL.Add   ('SELECT MasterKbn, SumNCode, BasedNCode FROM HojyoTree        ');
        SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumNCode = :strDstCode  ');
        SQL.Add   ('ORDER BY EntNo                                                  ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strDstCode'     ).AsFloat     := strExNCodeParent;

        Open ();

		while ( not EOF ) do
		begin
            with (dqMasterTreeUpdate) do
            begin
                Close();
	    	    SQL.Clear();
                SQL.Add('UPDATE HojyoTree SET                   '
                    +   '    EntNo         = :nEntryNo          '
                    +   '   ,UpdTantoNCode = :UpdTantoNCode     '
                    +   'WHERE  MasterKbn  = :nMasterDivision   '       // <036>↓
				    +   '  AND  SumNCode   = :strDstExCode      '
                    +   '  AND  BasedNCode = :strSrcExCode      ');
{                    +   'WHERE  (MasterKbn  = :nMasterDivision  '
				    +   '  AND  (SumNCode   = :strDstExCode     '
                    +   '  AND  (BasedNCode = :strSrcExCode     ');     // <036>↑
}

       	        ParamByName ('nMasterDivision').AsInteger  := dqMasterTreeSelect.FieldByName ('MasterKbn' ).AsInteger;
       	        ParamByName ('strDstExCode'   ).AsFloat    := dqMasterTreeSelect.FieldByName ('SumNCode'  ).AsFloat;
      	        ParamByName ('strSrcExCode'   ).AsFloat    := dqMasterTreeSelect.FieldByName ('BasedNCode').AsFloat;
                ParamByName ('nEntryNo'       ).AsInteger  := nCount * -100;
                ParamByName ('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;
        	    ExecSQL();

                // ｴﾗｰ
                if  ( Status <> 0 ) then
                begin
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
                    m_cDataModule.Rollback (m_cDBSelect);
				    dqMasterTreeSelect.Free();
				    dqMasterTreeUpdate.Free();
                    Exit;
                end;

				m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
            end;

            nCount  := nCount + 1;

            NEXT;
        end;

		Close ();
    end;

    with (dqMasterTreeUpdate) do
    begin
        Close();
        SQL.Clear();
        SQL.Add('UPDATE HojyoTree SET                   '
            +   '    EntNo         = EntNo * -1         '
            +   '   ,UpdTantoNCode = :UpdTantoNCode     '
            +   'WHERE MasterKbn = :nMasterDivision     '
            +   '  AND SumNCode  = :strDstExCode        '
		    +   '  AND EntNo     < 0                    ');

        ParamByName ('nMasterDivision').AsInteger  := m_nCurrentMasterDiv;
        ParamByName ('strDstExCode'   ).AsFloat    := strExNCodeParent;
        ParamByName ('UpdTantoNCode'  ).AsCurrency := m_TantoNCode;
        ExecSQL();

        // ｴﾗｰ
        if  ( Status <> 0 ) then
        begin
            // ﾛｰﾙﾊﾞｯｸ(破棄)
            m_cDataModule.Rollback (m_cDBSelect);
		    dqMasterTreeSelect.Free();
		    dqMasterTreeUpdate.Free();
            Exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
    end;

    // ｺﾐｯﾄ(反映)
    m_cDataModule.Commit (m_cDBSelect);
    dqMasterTreeSelect.Free();
    dqMasterTreeUpdate.Free();

end;




//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnGetMasterTreeEntryNo (TMQuery; String; String)							*/
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 登録№取得												*/
//*																									*/
//*	戻り値	: Integer, (最終登録№)										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterTree		= 補助加算体系ﾏｽﾀ用ｸｴﾘｰ												*/
//*			  strExCode			= 挿入(加算)先補助外部ｺｰﾄﾞ							                */
//*			  strExCodeParent	= 挿入(加算)先補助外部ｺｰﾄﾞ(親)						                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnGetMasterTreeEntryNo (dqMasterTree: TMQuery; strExNCode: Extended; strExNCodeParent: Extended): Integer;
var
    nEntryNo   : Integer;
    nEntryNoCur: Integer;
    nEntryNoPre: Integer;

begin
    with (dqMasterTree) do
    begin
		Close ();

		SQL.Clear ();

        SQL.Add ('SELECT EntNo FROM HojyoTree        ');
		SQL.Add ('WHERE  MasterKbn  = :nMasterDivision  ');
        SQL.Add ('  AND  SumNCode   = :strDstCode       ');
        SQL.Add ('  AND  BasedNCode = :strSrcCode       ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strDstCode'     ).AsFloat     := strExNCodeParent;
        ParamByName ('strSrcCode'     ).AsFloat     := strExNCode;

		Open ();

        nEntryNoCur := dqMasterTree.FieldByName ('EntNo').AsInteger;

		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT EntNo FROM HojyoTree        ');
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision   ');
        SQL.Add ('  AND  SumNCode  = :strDstCode        ');
        SQL.Add ('  AND  EntNo     < :nEntryNo          ');
		SQL.Add ('ORDER BY EntNo DESC                   ');

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strDstCode'     ).AsFloat     := strExNCodeParent;
		ParamByName ('nEntryNo'       ).AsInteger   := nEntryNoCur;

		Open ();

		if  (not EOF) then
            nEntryNoPre := dqMasterTree.FieldByName ('EntNo').AsInteger
        else
            nEntryNoPre := 0;

		Close ();
    end;

    nEntryNo    := nEntryNoPre + (nEntryNoCur - nEntryNoPre) div 2;

    if  ((nEntryNo <= nEntryNoPre) or (nEntryNo >= nEntryNoCur)) then
    begin
        fnRewriteMasterTreeRecords (strExNCodeParent);

        nEntryNo    := -1;
    end;

	Result	:= nEntryNo;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCheckMasterTreePasteValid (String; TTreeNode)					    */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 張付ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	= 張付(加算)元補助外部ｺｰﾄﾞ                                  		    */
//*			  cNodeDst		= 張付(加算)先ﾉｰﾄﾞ														*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnCheckMasterTreePasteValid (strExNCodeSrc: Extended; cNodeDst: TTreeNode): Boolean;
var
    dqMasterTree: TMQuery;
    stRecDst	: ^TreeViewRec;

begin
	stRecDst	:= cNodeDst.Data;

	if	((stRecDst^.nDivision = 0) or (stRecDst^.nDivision = DIVISION_GENERAL)) then
		stRecDst	:= cNodeDst.Parent.Data;

	dqMasterTree	:= TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);					// DBとMQueryの接続

    with (dqMasterTree) do
    begin
        Close ();

		SQL.Clear ();
        SQL.Add ('SELECT BasedNCode FROM HojyoTree   ');
        SQL.Add ('WHERE  MasterKbn = :nMasterDivision   ');
        SQL.Add ('  AND  SumNCode  = :strExCodeDst      ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strExCodeDst'   ).AsFloat     := stRecDst^.strExNCode;

        Open ();

		while (not EOF) do
		begin
            if	(CompareStr (FloatToStr(strExNCodeSrc), FloatToStr(FieldByName ('BasedNCode').AsFloat)) = 0) then
			begin
				Result	:= FALSE;

				dqMasterTree.Free ();
				Exit;
			end;

			NEXT;
		end;

		Close ();
    end;

	dqMasterTree.Free ();

	Result	:= TRUE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCheckMasterTreeInsertValid (String; String)	                        */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 挿入ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	= 挿入(加算)元補助外部ｺｰﾄﾞ                                  		    */
//*			  strExCodeDst  = 挿入(加算)先補助外部ｺｰﾄﾞ								                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnCheckMasterTreeInsertValid (strExNCodeSrc, strExNCodeDst: Extended): Boolean;
var
	dqMasterTree: TMQuery;
(* <061>
    nCount   : Integer;
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
*)
begin
(*
    for nCount := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

		if  (CompareStr (stWorkRec^.strExCode, strExCodeDst) = 0) then
        begin
            cNode       := CmnTreeView.Items [nCount - 1];
            stWorkRec   := cNode.Data;

            if  ((stWorkRec^.nDivision = 0) or (stWorkRec^.nDIvision = DIVISION_GENERAL)) then
            begin
                cNode       := cNode.Parent;
                stWorkRec   := cNode.Data;
            end;

			while (TRUE) do
            begin
				if  (CompareStr (stWorkRec^.strExCode, strExCodeSrc) = 0) then
                begin
					Result	:= FALSE;
					Exit;
                end;

                cNode   := cNode.Parent;

                if  (cNode = nil) then
                    break
                else
                    stWorkRec   := cNode.Data;
            end;
        end;
    end;

	Result	:= TRUE;
*)

	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);						// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT ht.SumNCode, ht.BasedNCode, hm.SumKbn FROM HojyoTree ht        ');
		SQL.Add ('LEFT OUTER JOIN HojyoMA hm                                            ');
		SQL.Add ('ON     ht.MasterKbn = hm.MasterKbn AND ht.BasedNCode = hm.NCode       ');
        SQL.Add ('   AND hm.RDelKbn = 0                                                 ');
		SQL.Add ('WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumNCode = :strSumCode  ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsFloat 	:= strExNCodeSrc;

        Open ();

		while (not EOF) do
		begin
            if	(not fnCheckMasterTreeInsertValidEx (FieldByName ('SumKbn'   ).AsInteger,
            										 FieldByName ('BasedNCode').AsFloat, strExNCodeDst)) then
			begin
				dqMasterTree.Close ();
				dqMasterTree.Free  ();

				Result	:= FALSE;
				Exit;
			end;

			Next ();
		end;
    end;

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

	Result	:= TRUE;
end;


//***************************************************************************************************/
//***************************************************************************************************/
function	TJNTCRP016000f.fnCheckMasterTreeInsertValidEx (nDivision: Integer; strExNCodeCmp1, strExNCodeCmp2: Extended): Boolean;
begin
	if	(nDivision = 1) then
	begin
        if	(CompareStr (FloatToStr(strExNCodeCmp1), FloatToStr(strExNCodeCmp2)) = 0) then
		begin
			Result	:= FALSE;
			Exit;
		end;

		if	(not fnCheckMasterTreeInsertValid (strExNCodeCmp1, strExNCodeCmp2)) then
		begin
			Result	:= FALSE;
			Exit;
		end;
	end;

	Result	:= TRUE;
end;


//***************************************************************************************************/
//***************************************************************************************************/
function	TJNTCRP016000f.fnCheckMasterTreeInsertValid3 (cNodeSrc, cNodeDst: TTreeNode): Boolean;
var
	dqMasterTree: TMQuery;
	strExCode	: String;
    strExNCode  : Extended;

begin
	strExCode	:= PTreeViewRec (cNodeDst.Data)^.strExCode;
    strExNCode  := PTreeViewRec (cNodeDst.Data)^.strExNCode;

	if	((PTreeViewRec (cNodeDst.Data)^.nDivision = 0) or
		 (PTreeViewRec (cNodeDst.Data)^.nDivision = DIVISION_GENERAL)) then
		strExCode	:= PTreeViewRec (cNodeDst.Parent.Data)^.strExCode;

	if	(CompareStr (PTreeViewRec (cNodeSrc.Parent.Data)^.strExCode, strExCode) = 0) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(CompareStr (PTreeViewRec (cNodeSrc.Data)^.strExCode, strExCode) = 0) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);						// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT BasedNCode FROM HojyoTree      ');
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision   ');
        SQL.Add ('  AND  SumNCode  = :strSumCode        ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsFloat 	:= strExNCode;

        Open ();

		while (not EOF) do
		begin
            if	(CompareStr (FloatToStr(PTreeViewRec (cNodeSrc.Data)^.strExNCode),
            									FloatToStr(FieldByName ('BasedNCode').AsFloat)) = 0) then
			begin
				dqMasterTree.Close ();
				dqMasterTree.Free  ();

				Result	:= FALSE;
				Exit;
			end;

			Next ();
		end;
    end;

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

	Result	:= TRUE;
end;


//******************************************************************************
//	HIS0021
//******************************************************************************
function TJNTCRP016000f.fnCheckMasterTreeInsertValid2(cNodeSrc, cNodeDst: TTreeNode): Boolean;
var
//    cNode    	: TTreeNode;
    stWorkScr1	: ^TreeViewRec;
    stWorkDst1	: ^TreeViewRec;
    stWorkScr2	: ^TreeViewRec;
    stWorkDst2	: ^TreeViewRec;
	i			: Integer;
	iLoop		: Integer;
begin
	stWorkScr1	:= cNodeSrc.Data;
//	stWorkDst1	:= cNodeDst.Data;

//	stWorkScr2	:= cNodeSrc.Data;
//	stWorkDst2	:= cNodeDst.Data;

	i	:= cNodeDst.Count;

	for iLoop := 0 to i-1 do
	begin
		if	(cNodeSrc.Data = cNodeDst.Item [iLoop].Data) then
			Continue;

		stWorkDst1	:= cNodeDst.Item[iLoop].Data;

		if (cNodeSrc.Data    <> cNodeDst.Item[iLoop].Data) and
		   (stWorkScr1^.strExCode = stWorkDst1^.strExCode) then
		begin
			Result	:= FALSE;
            Exit;
		end;
	end;


//////////////////////////////////////////////////////////////////////////////////////////////////////

	stWorkDst2	:= cNodeDst.Data;

	while (TRUE) do
	begin
       	if cNodeSrc = nil then
			break;

		stWorkScr2	:= cNodeSrc.Data;

		if (cNodeSrc.Data    <> cNodeDst.Data) and
		   (stWorkScr2^.strExCode = stWorkDst2^.strExCode) then
		begin
			Result	:= FALSE;
            Exit;
		end;

		cNodeSrc	:= cNodeSrc.Parent;
	end;


	Result			:= TRUE;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDeleteMasterRecord (Integer; String)                                 */
//*																									*/
//*	目的	: 補助登録処理 補助ﾏｽﾀ削除					                                   		    */
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           strExCode = 補助外部ｺｰﾄﾞ                                                              */
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnDeleteMasterRecord (nDivision: Integer; strExCode: String);
var
    fReturn     : Boolean;
    nStrExNCode : Extended;
	DmqData: TMQuery;                                                           // <071>
    iCnt   : Integer;                                                           // <071>
    strMstr: String;                                                            // <071>
begin
    m_cDataModule.BeginTran (m_cDBSelect);

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <041>
    //
    //  ﾏｽﾀﾃﾞｰﾀを削除する際に、ｸﾞﾙｰﾌﾟ管理を採用している場合は、親会社ﾃﾞｰﾀﾍﾞｰｽに
    //  対してﾄﾗﾝｻﾞｸｼｮﾝを掛ける。。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社ﾃﾞｰﾀﾍﾞｰｽに対してﾄﾗﾝｻﾞｸｼｮﾝを掛ける
        m_cDataModule.BeginTran ( m_SyncMaster.m_cPDBSelect );
    end;
    // <041>
    // -------------------------------------------------------------------------

    // 内部ｺｰﾄﾞの取得
    gfnSetExNCode('HOJYOMA', strExCode, nStrExNCode);

    // HojyoTree
    fReturn := fnDeleteMasterTreeRecord (nDivision, nStrExNCode);               // 補助加算体系ﾏｽﾀ更新

    if ( not fReturn ) then                                                     // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();
        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    // HojyoMA
    fReturn := fnDeleteMasterDataRecord (nDivision, nStrExNCode); 				// 補助基本ﾏｽﾀ更新

    if  (not fReturn) then                                                      // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();

        // <041>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;
        // <041>

        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    // MFusenInfo
    fReturn := fnDeleteMasterDataAddition (nStrExNCode); 							// その他ﾏｽﾀ削除

    if  (not fReturn) then                                                      // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();

        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)

    // <041>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        m_cDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
    end;
    // <041>

    fnDeleteTreeViewItems (strExCode);

    // <071> Start
    // [汎用補助1～5]マスタで実在する時 (nDivision = 0:実在、1:合計)
    if ((m_nCurrentMasterDiv in [MASTER_GENERAL01 .. MASTER_GENERAL05])
    and (nDivision = 0)) then
    begin
        DmqData := TMQuery.Create( Self );                                      //  MQueryの構築
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );                 //  DBとMQueryの接続
        iCnt := 0 ;

        //  区分情報から経費精算連携採用の有無を取得
        with DmqData do
        begin
            Close();
            SQL.Clear;
            // RecKbn=54(経費精算)、GnPuKbn1（Edge Tracker 経費精算連携採用区分）
            SQL.ADD('SELECT count(*) as cnt FROM KbnInfo WHERE RecKbn=54 and GnPuKbn1 = 1');
            if Open = False then
            begin
                Close;
                Free;
                Exit;
            end;
            iCnt := GetFld('cnt').AsInteger;
            Close;
            Free;
        end;

        // 「Edge Tracker 経費精算連携」があるときにメッセージを表示する
        if iCnt > 0 then
        begin
            // 補助名称を設定
            strMstr := '';
            case (m_nCurrentMasterDiv) of
                MASTER_GENERAL01: strMstr := '汎用補助1';
                MASTER_GENERAL02: strMstr := '汎用補助2';
                MASTER_GENERAL03: strMstr := '汎用補助3';
                MASTER_GENERAL04: strMstr := '汎用補助4';
                MASTER_GENERAL05: strMstr := '汎用補助5';
            end;
            MjsMessageBoxEx(Self, strMstr + 'が削除されました。' + #13#10 + 'Edge Tracker でマスタを見直してください。', '確認', mjInformation, mjOk, mjDefOk);
        end;
    end;
    // <071> End
    
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDeleteMasterTreeRecord (Integer; String)			                    */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ削除			                                   		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)                                              */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           strExCode = 補助外部ｺｰﾄﾞ                                                              */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnDeleteMasterTreeRecord (nDivision: Integer; strExNCode: Extended): Boolean;
var
	dqMasterTree       : TMQuery;
	dqMasterTreeUpdate : TMQuery;
	nEntryNo           : Integer;
	fUpdateRecord      : Boolean;
begin
	dqMasterTree		:= TMQuery.Create ( Self );
	dqMasterTreeUpdate	:= TMQuery.Create ( Self );

	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterTree       );
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterTreeUpdate );

	if	( nDivision = 1 ) then
	begin
		with dqMasterTree do
		begin
            nEntryNo := fnGetMasterTreeEntryNoFinal (dqMasterTree, 0);

			Close();
			SQL.Clear();
            SQL.Add('SELECT BasedNCode FROM HojyoTree    ');
			SQL.Add('WHERE  MasterKbn = :nMasterDivision ');
            SQL.Add('  AND  SumNCode  = :strExCodeDst    ');
            SQL.Add('ORDER BY EntNo                      ');

			ParamByName('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
			ParamByName('strExCodeDst'   ).AsFloat 	 := strExNCode;

			if ( not Open () ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);

				m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

				dqMasterTree      .Close();
				dqMasterTreeUpdate.Close();
				dqMasterTree      .Free();
				dqMasterTreeUpdate.Free();
				Result := false;
				Exit;
			end;

			while ( not eof ) do
			begin
				with dqMasterTreeUpdate do
				begin
					Close();
					SQL.Clear();
                    SQL.Add('SELECT BasedNCode FROM HojyoTree     ');
					SQL.Add('WHERE  MasterKbn  = :nMasterDivision ');
					SQL.Add('  AND  SumNCode   = :strExCodeDst    ');
                    SQL.Add('  AND  BasedNCode = :strExCodeSrc    ');

					ParamByName('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
					ParamByName('strExCodeDst'   ).AsFloat 	 := 0;
					ParamByName('strExCodeSrc'   ).AsFloat 	 := dqMasterTree.FieldByName ('BasedNCode').AsFloat;

					if ( not Open () ) then
					begin
						m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTreeUpdate);

						m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

						dqMasterTree      .Close();
						dqMasterTreeUpdate.Close();
						dqMasterTree      .Free();
						dqMasterTreeUpdate.Free();

						Result	:= false;
						Exit;
					end;

					if ( not eof ) then
						    fUpdateRecord	:= FALSE
					else    fUpdateRecord	:= TRUE;

					Close ();
				end;

				if ( fUpdateRecord ) then
				begin
					with dqMasterTreeUpdate do
					begin
						Close();
						SQL.Clear();
                        SQL.Add('UPDATE HojyoTree SET                   '
                            +   '    EntNo         = :nEntryNo          '
                            +   '   ,SumNCode      = :strSumCode        '
                            +   '   ,UpdTantoNCode = :UpdTantoNCode     '
						    +   'WHERE  MasterKbn  = :nMasterDivision   '
						    +   '  AND  SumNCode   = :strExCodeDst      '
                            +   '  AND  BasedNCode = :strExCodeSrc      ');

						ParamByName ('nEntryNo'       ).AsInteger	:= nEntryNo;
						ParamByName ('strSumCode'     ).AsFloat 	:= 0;
                        ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;
						ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
						ParamByName ('strExCodeDst'   ).AsFloat 	:= strExNCode;
						ParamByName ('strExCodeSrc'   ).AsFloat 	:= dqMasterTree.FieldByName ('BasedNCode').AsFloat;

						if	( not ExecSQL() ) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTreeUpdate);
							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= FALSE;
							Exit;
						end;

						m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;
					end;

					nEntryNo	:= nEntryNo + 100;
				end
				else
				begin
					with (dqMasterTreeUpdate) do
					begin
						Close();
						SQL.Clear();
                        SQL.Add('DELETE FROM HojyoTree                  '
						    +   'WHERE MasterKbn  = :nMasterDivision    '
						    +   '  AND SumNCode   = :strExCodeDst       '
                            +   '  AND BasedNCode = :strExCodeSrc       ');

						ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
						ParamByName ('strExCodeDst'   ).AsFloat 	:= strExNCode;
						ParamByName ('strExCodeSrc'   ).AsFloat 	:= dqMasterTree.FieldByName ('BasedNCode').AsFloat;

						if	( not ExecSQL() ) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTreeUpdate);
							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= FALSE;
							Exit;
						end;

						m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
						m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;
					end;
				end;

				NEXT;
			end;

			Close ();
		end;
	end;

	with (dqMasterTree) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('DELETE FROM HojyoTree                  '
		    +   'WHERE MasterKbn  = :nMasterDivision    '
            +   '  AND BasedNCode = :strSrcCode         ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSrcCode'     ).AsFloat 	:= strExNCode;

		if	( not ExecSQL() ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree      .Close ();
			dqMasterTreeUpdate.Close ();
			dqMasterTree      .Free  ();
			dqMasterTreeUpdate.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;
	end;

	dqMasterTree      .Close ();
	dqMasterTreeUpdate.Close ();
	dqMasterTree      .Free  ();
	dqMasterTreeUpdate.Free  ();

	Result	:= TRUE;															// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDeleteMasterDataRecord (Integer; String)                             */
//*																									*/
//*	目的	: 補助登録処理 補助基本ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           strExCode = 補助外部ｺｰﾄﾞ                                                              */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnDeleteMasterDataRecord (nDivision: Integer; strExNCode: Extended): Boolean;
var
	dqMasterData : TMQuery;
//<061>		iNCode2		 : Integer;	//	削除するﾚｺｰﾄﾞの内部ｺｰﾄﾞ
begin
	//	初期処理
//<061>		iNCode2	:=	0;
    dqMasterData := TMQuery.Create ( Self );

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <041>
    //
    //  ｸﾞﾙｰﾌﾟ管理を採用している場合の削除は、親会社との関連性を削除する。
    //  その後同期ｽﾄｱﾄﾞﾌﾟﾛｼｼﾞｬで同期(削除)を行う。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, dqMasterData);

        // 親会社のHojyoMA_Relを削除
        dqMasterData.Close();
        dqMasterData.SQL.Clear();
        dqMasterData.SQL.Add('update HojyoMA_Rel                  ');
        dqMasterData.SQL.Add('set RDelKbn_Rel = 1,                ');
        dqMasterData.SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
        dqMasterData.SQL.Add('where MasterKbn   = :pMstKbn        ');
        dqMasterData.SQL.Add(' and  RDelKbn_Rel = :pRDelKbn       ');
        dqMasterData.SQL.Add(' and  NCode       = :pNCode         ');
        dqMasterData.SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

        dqMasterData.ParamByName('pMstKbn'     ).AsInteger := m_nCurrentMasterDiv;
        dqMasterData.ParamByName('pRDelKbn'    ).AsInteger := 0;
        dqMasterData.ParamByName('pNCode'      ).AsFloat   := strExNCode;
        dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

        if ( dqMasterData.ExecSQL = false ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close();
			dqMasterData.Free();
            result := false;
            Abort;
        end;

        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        if ( m_SyncMaster.fnCall_SYNC ( JNTSYNC_HojyoMA ) = false ) then
        begin
            result := false;
            Abort;
        end;

        // <051> - ST
        // SecHojyoDispInfoのﾒﾝﾃを行う。-> 表示区分を非表示とする。
        dqMasterData.Close();
        dqMasterData.SQL.Clear();
        dqMasterData.SQL.Add('update SecHojyoDispInfo set      ');
        dqMasterData.SQL.Add(' DispKbn    = :DispKbn,          ');
        dqMasterData.SQL.Add(' UpdateTime = CURRENT_TIMESTAMP  ');
        dqMasterData.SQL.Add('where Opekbn          = :Opekbn  ');
        dqMasterData.SQL.Add('  and Masterkbn       = :MstKbn  ');
        dqMasterData.SQL.Add('  and PlaceNCode      = :PNCode  ');
        dqMasterData.SQL.Add('  and NoDispMasterKbn = :NMstKbn ');
        dqMasterData.SQL.Add('  and NCode           = :NCode   ');

        dqMasterData.ParamByName('Opekbn' ).AsInteger := OPE_GROUP;
        dqMasterData.ParamByName('MstKbn' ).AsInteger := m_SyncMaster.m_SecMasterKbn;
        dqMasterData.ParamByName('PNCode' ).AsFloat   := m_SyncMaster.m_nSegNCode;
        dqMasterData.ParamByName('NMstKbn').AsInteger := m_nCurrentMasterDiv;
        dqMasterData.ParamByName('NCode'  ).AsFloat   := strExNCode;
        dqMasterData.ParamByName('DispKbn').AsInteger := DISP_OFF;

        if	( not dqMasterData.ExecSQL() ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
            Result := FALSE;
            Exit;
        end;
        // <051> - ED
    end
    // 通常削除
    else
    begin
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, dqMasterData);

        dqMasterData.Close();
        dqMasterData.SQL.Clear();
        dqMasterData.SQL.Add('select Count(NCode) CNT from HojyoMA_Rel ');
        dqMasterData.SQL.Add('where MasterKbn   = :pMstKbn             ');
        dqMasterData.SQL.Add('  and NCode       = :pNCode              ');
        dqMasterData.SQL.Add('  and RDelKbn_REL = 0                    ');
        dqMasterData.ParamByName('pMstKbn').AsInteger := m_nCurrentMasterDiv;
        dqMasterData.ParamByName('pNCode' ).AsFloat   := strExNCode;

        if ( dqMasterData.Open = False ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close();
			dqMasterData.Free();
            result := false;
            Abort;
        end;

        if ( dqMasterData.FieldByName('CNT').AsInteger <> 0 ) then
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_USE_CHILD,
                        '削除', mjInformation, mjOk, mjDefOk);

            dqMasterData.Close();
			dqMasterData.Free();
            result := false;
            Abort;
        end;

        // 実ﾃﾞｰﾀを削除する
        dqMasterData.Close();
        dqMasterData.SQL.Clear();
        dqMasterData.SQL.Add('update HojyoMA set                ');
        dqMasterData.SQL.Add('   RDelKbn       = 1              ');
        dqMasterData.SQL.Add('  ,UpdTantoNCode = :UpdTantoNCode ');
        dqMasterData.SQL.Add('where  MasterKbn = :pMstkbn       ');
        dqMasterData.SQL.Add('  and  SumKbn    = :nSumDivision  ');
        dqMasterData.SQL.Add('  and  RDelKbn   = 0              ');
        dqMasterData.SQL.Add('  and  NCode     = :strExCode     ');
        dqMasterData.ParamByName('pMstKbn'      ).Asinteger  := m_nCurrentMasterDiv;
        dqMasterData.ParamByName('nSumDivision' ).AsInteger  := nDivision;
        dqMasterData.ParamByName('strExCode'    ).AsFloat    := strExNCode;
        dqMasterData.ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode;

        if ( dqMasterData.ExecSQL = false ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close();
			dqMasterData.Free();
            result := false;
            Abort;
        end;
    end;
    // ↑↑↑<041>
    // -------------------------------------------------------------------------

(*
    dqMasterData := TMQuery.Create ( Self );
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );

	with (dqMasterData) do
	begin
		Close();
        SQL.Clear();
        SQL.Add ('UPDATE HojyoMA SET                    '
            +   '    RDelKbn = 1                        '
		    +   'WHERE (MasterKbn = :nMasterDivision)   '
		    +   '  AND (RDelKbn   = 0)                  '
            +   '  AND (SumKbn    = :nSumDivision)      '
            +   '  AND (NCode     = :strExCode)         ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('nSumDivision'   ).AsInteger	:= nDivision;
		ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;

		if	( not ExecSQL() ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;
	end;
*) // <041>

	dqMasterData.Close ();
	dqMasterData.Free  ();

    // 正常終了
	Result	:= true;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDeleteMasterDataAddition (String)									*/
//*																									*/
//*	目的	: 補助登録処理 その他ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnDeleteMasterDataAddition (strExNCode: Extended): Boolean;
var
	dqMasterData : TMQuery;
begin

	dqMasterData := TMQuery.Create (Self);

    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );

	with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('DELETE FROM MFusenInfo WHERE MasterKbn = :nMasterDivision and NCode = :strExCode');

		ParamByName('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
        ParamByName('strExCode'      ).AsFloat	 := strExNCode;

		if ( not ExecSQL () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
        end;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;															// 正常終了

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnEraseMasterTreeRecord (String; String)	                                */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ消去      	                                   		    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode         = 補助外部ｺｰﾄﾞ                                                      */
//*           strExCodeParent   = 補助外部ｺｰﾄﾞ(親)                                                  */
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnEraseMasterTreeRecord (strExNCode: Extended; strExNCodeParent: Extended);
var
    dqMasterTree      : TMQuery;
    dqMasterTreeUpdate: TMQuery;
    nEntryNo          : Integer;
    fUpdateRecord     : Boolean;

begin
	nEntryNo	:= 0;

    m_cDataModule.BeginTran (m_cDBSelect);                                      // ﾄﾗﾝｻﾞｸｼｮﾝの開始

    dqMasterTree        := TMQuery.Create (Self);
    dqMasterTreeUpdate  := TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree      );	        // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeUpdate);	        // DBとMQueryの接続

    with (dqMasterTree) do
    begin
//------------------------------------------------------------------------------HIS0017Start
		Close;
		SQL.Clear;
        SQL.Add ('SELECT Count(BasedNCode) as Count FROM HojyoTree   ');
		SQL.Add ('WHERE MasterKbn  = :nMasterDivision                   ');
        SQL.Add ('  AND BasedNCode = :strExCodeSrc                      ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strExCodeSrc'   ).AsFloat     := strExNCode;


		Open;

		if FieldByName('Count').AsInteger <= 1 then
		begin
//------------------------------------------------------------------------------HIS0017End

            nEntryNo    := fnGetMasterTreeEntryNoFinal (dqMasterTree, 0);

    	    Close ();

	        SQL.Clear;
            SQL.Add ('SELECT BasedNCode FROM HojyoTree   ');
        	SQL.Add ('WHERE MasterKbn  = :nMasterDivision   ');
            SQL.Add ('  AND SumNCode   = :strExCodeDst      ');
            SQL.Add ('  AND BasedNCode = :strExCodeSrc      ');

	        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
    	    ParamByName ('strExCodeDst'   ).AsFloat     := 0;
        	ParamByName ('strExCodeSrc'   ).AsFloat     := strExNCode;

	        Open ();

    	    if  (not EOF) then
        	    fUpdateRecord   := FALSE
	        else
    	        fUpdateRecord   := TRUE;
		end
//------------------------------------------------------------------------------HIS0017Start
		else
		begin
			fUpdateRecord		:= FALSE;
		end;
//------------------------------------------------------------------------------HIS0017End


		m_fUpDeleteRecord		:= FALSE;


        if  (fUpdateRecord) then
        begin
            with (dqMasterTreeUpdate) do
            begin
                Close();
                SQL.Clear();
                SQL.Add('UPDATE HojyoTree SET                   '
                    +   '    EntNo         = :nEntryNo          '
                    +   '   ,SumNCode      = :strSumCode        '
                    +   '   ,UpdTantoNCode = :UpdTantoNCode     '
				    +   'WHERE MasterKbn  = :nMasterDivision    '
				    +   '  AND SumNCode   = :strExCodeDst       '
                    +   '  AND BasedNCode = :strExCodeSrc       ');

                ParamByName ('nEntryNo'       ).AsInteger   := nEntryNo;
                ParamByName ('strSumCode'     ).AsFloat     := 0;
                ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
                ParamByName ('strExCodeDst'   ).AsFloat     := strExNCodeParent;
                ParamByName ('strExCodeSrc'   ).AsFloat     := strExNCode;
                ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;

				if	( not ExecSQL() ) then
                begin
					m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTreeUpdate);
					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

					fnOutputDBErrorMessage ();

                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					m_cDataModule     .Rollback (m_cDBSelect);
					dqMasterTree      .Close	();
					dqMasterTreeUpdate.Close	();
					dqMasterTree      .Free		();
					dqMasterTreeUpdate.Free		();
                    Exit;
				end;

				m_bHojyoTree2 [m_nCurrentMasterDiv - 21]	:= 1;

				m_fUpDeleteRecord	:= TRUE;
            end;
        end
        else
        begin
            with (dqMasterTreeUpdate) do
            begin
                Close();
				SQL.Clear();
                SQL.Add('DELETE FROM HojyoTree                  '
				    +   'WHERE MasterKbn  = :nMasterDivision    '
				    +   '  AND SumNCode   = :strExCodeDst       '
                    +   '  AND BasedNCode = :strExCodeSrc       ');

                ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
                ParamByName ('strExCodeDst'   ).AsFloat     := strExNCodeParent;
                ParamByName ('strExCodeSrc'   ).AsFloat     := strExNCode;

				if	( not ExecSQL() ) then
                begin
					m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTreeUpdate);
					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

					fnOutputDBErrorMessage();

                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					m_cDataModule.Rollback (m_cDBSelect);
					dqMasterTree      .Close();
					dqMasterTreeUpdate.Close();
					dqMasterTree      .Free();
					dqMasterTreeUpdate.Free();
                    Exit;
                end;

				m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
				m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;

				m_fUpDeleteRecord	:= FALSE;
            end;
        end;

		Close ();
    end;

	m_cDataModule     .Commit (m_cDBSelect);											// ｺﾐｯﾄ(反映)
	dqMasterTree      .Close  ();
	dqMasterTreeUpdate.Close  ();
	dqMasterTree      .Free	  ();
	dqMasterTreeUpdate.Free	  ();
end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnUpdateDetailIndInfo ()													*/
//*																									*/
//*	目的	: 補助登録処理 各種管理情報更新															*/
//*																									*/
//*	戻り値	: なし,                                                 		                        */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnUpdateDetailIndInfo ();
var
	strExCode: String;

begin
	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCleanupTreeViewNewItem (Boolean)										*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理												*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: fSelected	= 区分 (TRUE:以前選択されていたﾉｰﾄﾞに戻す)									*/
//*                                                                                                 */
//***************************************************************************************************/
procedure TJNTCRP016000f.fnCleanupTreeViewNewItem (fSelected: Boolean);
var
	stWorkRec : ^TreeViewRec;
	cNode	  : TTreeNode;
	nCount    : Integer;
begin

	m_fUnderConstruction := TRUE;

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
		cNode	  := CmnTreeView.Items [nCount - 1];
		stWorkRec := cNode.Data;

		if	(stWorkRec^.nDivision = DIVISION_NEWRECORD) then
		begin
			Dispose (stWorkRec);
			cNode.Delete ();

			Break;
		end;
    end;

	m_fUnderConstruction	:= FALSE;

	if	(fSelected and (m_cNodePrevSelect <> nil)) then
		m_cNodePrevSelect.Selected	:= TRUE;

	m_fDtlNewRecord	:= FALSE;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCleanupTreeViewNewItemEx ()												*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理 (ｴｷｽﾄﾗ･ｳﾞｧｰｼﾞｮﾝ)								*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCleanupTreeViewNewItemEx ();
var
	stWorkRec: ^TreeViewRec;
	cNode	 : TTreeNode;
	nCount   : Integer;

begin
	m_fUnderConstruction	:= TRUE;

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
		cNode		:= CmnTreeView.Items [nCount - 1];
		stWorkRec	:= cNode.Data;

		if	(stWorkRec^.nDivision = DIVISION_NEWRECORD) then
		begin
			Dispose (stWorkRec);
			cNode.Delete ();

			Break;
		end;
    end;

	CmnTreeView.Selected	:= nil;

	m_fUnderConstruction	:= FALSE;

	if	(m_cNodePrevSelect <> nil) then
		m_cNodePrevSelect.Selected	:= TRUE;

	m_fDtlNewRecord	:= FALSE;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCheckCommonDetailScreenValue (Integer)							    */
//*																									*/
//*	目的	: 補助登録処理 詳細画面入力値ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 区分	(0:ｺｰﾄﾞ(数字), 1:ｺｰﾄﾞ(ﾌﾘｰ)...)										*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP016000f.fnCheckCommonDetailScreenValue (nDivision: Integer): Boolean;
var
	strErrorMessage: String;
    fReturn		   : Boolean;

begin
	CmnStatusBar.SimpleText	:= '';

	strErrorMessage	:= '';
	fReturn			:= TRUE;

	case (nDivision) of
		0:	begin
				if	(Trunc (DtlCmnEditExCodeNumeric.Value) = 0) then
				begin
					strErrorMessage	:= 'コードを正しく入力してください。';
					fReturn			:= FALSE;
				end;
			end;

		2:	begin
				if	(DtlCmnEditAppDateStart.Value > 0) then
				begin
					try
//						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateStart.Value);		// <#NGEN>
						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateStart.AsIntYM);	// <#NGEN>

						if	(not fReturn) then
							strErrorMessage	:= '日付を正しく入力してください。';

					except
						strErrorMessage	:= '日付を正しく入力してください。';
						fReturn			:= FALSE;
					end;
				end;
			end;

		3:	begin
				if	(DtlCmnEditAppDateEnd.Value > 0) then
				begin
					try
//						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateEnd.Value);		// <#NGEN>
						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateEnd.AsIntYM);		// <#NGEN>

						if	(not fReturn) then
							strErrorMessage	:= '日付を正しく入力してください。';

					except
						strErrorMessage	:= '日付を正しく入力してください。';
						fReturn			:= FALSE;
					end;

					if	(fReturn) then
					begin
//						if	(DtlCmnEditAppDateEnd.Value < DtlCmnEditAppDateStart.Value) then		// <#NGEN>
						if	(DtlCmnEditAppDateEnd.AsIntYM < DtlCmnEditAppDateStart.AsIntYM) then	// <#NGEN>
						begin
							strErrorMessage	:= '適用終了年月日は開始年月日以降でなければなりません。';
							fReturn			:= FALSE;
						end;
					end;
				end;
			end;
	end;

	if	(not fReturn) then
		CmnStatusBar.SimpleText	:= strErrorMessage;

	result	:= fReturn;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnChangeToolbarButtonsCondition (TTreeNode)                                    */
//*																											*/
//*	目的	: 補助登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget	= 対象ﾉｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnChangeToolbarButtonsCondition (cNodeTarget: TTreeNode);
var
	cNodeWork  : TTreeNode;
	stRecTarget: ^TreeViewRec;

begin
	stRecTarget	:= cNodeTarget.Data;

	if	(stRecTarget^.nDivision = 9) then												// 体系
	begin
		CmnToolbarButtonDetail.Enabled	:=  FALSE;
		CmnToolbarButtonDelete.Enabled	:=  FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;      // <001>
        ToolBarFusen          .Enabled	:=  FALSE;  // <001>
	end
	else if	(stRecTarget^.nDivision = DIVISION_GENERAL) then							// 諸口
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			CmnToolbarButtonDetail.Enabled	:= TRUE
		else
			CmnToolbarButtonDetail.Enabled	:= FALSE;

		if	(fnCheckPermitGeneralRecDelete ()) then
		begin
			CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;     // <012>
		end
		else
			CmnToolbarButtonDelete.Enabled	:= FALSE;

		fnEnableToolbarButtonTag (TRUE)

	end
	else if	(stRecTarget^.nDivision = DIVISION_NEWRECORD) then							// 新規作成
	begin
		CmnToolbarButtonDetail.Enabled	:=  FALSE;
		CmnToolbarButtonDelete.Enabled	:=  FALSE;
        CmnToolbarButtonTag.ImageIndex	:=  4;          // <001>
        ToolBarFusen          .Enabled	:=  FALSE;      // <001>
	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			CmnToolbarButtonDetail.Enabled	:= TRUE
		else
			CmnToolbarButtonDetail.Enabled	:= FALSE;

		CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;     // <012>
		fnEnableToolbarButtonTag (TRUE);
	end;

	if	(CmnToolbarButtonDelete.Enabled) then
	begin
		cNodeWork	:= cNodeTarget.GetFirstChild ();

		if	(cNodeWork <> nil) then
			CmnToolbarButtonDelete.Enabled	:= FALSE;
	end;

    BSpeedButtonSort.Enabled    := m_IsUpdate;                      // <012>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnSetDeleteButtonCondition ()														*/
//*																											*/
//*	目的	: 共通補助登録処理																				*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnSetDeleteButtonCondition ();
var
	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;
	strExCode   : String;
//	iLoop		: Integer;
//	stRecTarget : ^TreeViewRec;
    strExNCode  : Extended;

begin
	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
    begin
		strExCode	:= StdCmnGridExist.DataSource.DataSet.FieldByName ('strExCode').AsString;
        strExNCode  := StdCmnGridExist.DataSource.DataSet.FieldByName ('strExNCode').AsFloat;
    end
	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then
    begin
		strExCode	:= StdCmnGridTotal.DataSource.DataSet.FieldByName ('strExCode').AsString;
        strExNCode	:= StdCmnGridTotal.DataSource.DataSet.FieldByName ('strExNCode').AsFloat;
    end
	else if	((Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name) or
			 (Screen.ActiveControl.Name = DtlCmnEditExCodeFree   .Name) or
			 (Screen.ActiveControl.Name = DtlCmnEditAssociation  .Name)) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		else
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
			strExCode	:= DtlCmnEditExCodeFree.Text;
		end;

        // 内部ｺｰﾄﾞの取得
        gfnSetExNCode('HOJYOMA',strExCode,strExNCode);
	end
	else
		Exit;

	if	(Trim (strExCode) = '') then
	begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		Exit;
	end;

	if	(m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	dqMasterTree	:= TMQuery.Create (Self);
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
//		SQL.Add   ('SELECT NCode, SumKbn FROM HojyoMA ');

		//HIS0030
		SQL.Add   ('SELECT ');

		if (m_nCurrentMasterDiv = 25) and (m_BumonUseKbn <> 0) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
            SQL.Add('SectionNCode, ');

        SQL.Add   ('NCode, SumKbn, Syokuchikbn FROM HojyoMA ');
        SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
		begin
//			if	((not (FieldByName ('NCode').IsNull)) and (FieldByName ('NCode').AsInteger = 0)) then
            if ( FieldByName('Syokuchikbn').AsInteger = 1 ) then
			begin
				if	(fnCheckPermitGeneralRecDelete ()) then
					CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete      // <012>
				else
					CmnToolbarButtonDelete.Enabled	:= FALSE;
			end
			else
			begin
				CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;         // <012>
			end;

			if	(CmnToolbarButtonDelete.Enabled and (FieldByName ('SumKbn').AsInteger = 1)) then
			begin
				with (dqMasterTree) do
				begin
					Close ();

					SQL.Clear ();
                    SQL.Add ('SELECT BasedNCode FROM HojyoTree      ');
					SQL.Add ('WHERE  MasterKbn = :nMasterDivision   ');
                    SQL.ADd ('  AND  SumNCode = :strExCode          ');

					ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;
					Open ();

					if	(not EOF) then
						CmnToolbarButtonDelete.Enabled	:= FALSE;

					Close ();
				end;
			end;
		end
		else
			CmnToolbarButtonDelete.Enabled	:= FALSE;

		Close ();

{//--------------------------------------------------------------Y.Ichihashi
		//GridでSelectされているものをTreeでもSelectされるようにする
		for iLoop := 0 to CmnTreeView.Items.Count-1 do
		begin
        	stRecTarget	:= CmnTreeView.Items[iLoop].Data;

			if stRecTarget^.strExCode = strExCode then
            	CmnTreeView.Items[iLoop].Selected	:= TRUE;
		end;
//--------------------------------------------------------------
}
    end;

	dqMasterTree.Close ();
	dqMasterData.Close ();
	dqMasterTree.Free  ();
	dqMasterData.Free  ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 補助登録処理 一覧ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ											        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(not m_fAccessTab) then
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
	begin
		if	(StdCmnTab.Items [0].Selected) then							// 実在Grid
			m_cACControl	:= StdCmnGridExist
		else															// 合計Grid
			m_cACControl	:= StdCmnGridTotal;

		m_cACControl.SetFocus ();
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDtlCmnTabOnChange (TObject)									            */
//*																									*/
//*	目的	: 補助登録処理 詳細画面ﾀﾌﾞ OnChange ｲﾍﾞﾝﾄ										        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnTabOnChange (Sender: TObject);
var
//	stNewRec    : ^TreeViewRec;
	cNode	    : TTreeNode;
	cTabItem    : TMTabItems;
	nSumDivision: Integer;

begin
	cTabItem	:= Sender as TMTabItems;

    if	(not m_fAccessTab) then
		Exit;

    // ｾｸﾞﾒﾝﾄ,分類ﾊﾟﾈﾙの表示/非表示切替<003>
    case cTabItem.Selected of
        0:  Pnl_SegBunInfo.Visible  :=  TRUE;
        1:  Pnl_SegBunInfo.Visible  :=  FALSE;
    end;

	if	(m_fDtlNewRecord) then
	begin
		fnCleanupTreeViewNewItemEx ();

		m_fChangeDetails	:= FALSE;

		Exit;
	end;

	nSumDivision	:= Trunc (DtlCmnEditSumDivision.Value);

	if	(nSumDivision = 0) then
		nSumDivision	:= 1
	else
		nSumDivision	:= 0;

	if	(cTabItem [nSumDivision].Selected) then
	begin
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
//		stNewRec			:= cNode.Data;

//		if	((stNewRec^.nDivision = 0) or (stNewRec^.nDivision = DIVISION_GENERAL)) then
//			cNode	:= cNode.Parent;

//		New (stNewRec);

//		stNewRec^.nDivision	:= DIVISION_NEWRECORD;
//		stNewRec^.strName	:= '新規作成';

//		cNode	:= CmnTreeView.Items.AddChildObject (cNode, stNewRec^.strName, stNewRec);

//		cNode.ImageIndex	:= 4;
//		cNode.SelectedIndex	:= 4;
//		cNode.Selected		:= TRUE;

        m_fDtlNewRecord		:= TRUE;

        fnInitializeDetailScreen (TRUE);

		fnChangeComponentState (nSumDivision);
	end
	else
	begin
		fnCleanupTreeViewNewItem (TRUE);

		m_fChangeDetails	:= FALSE;
	end;

    if  (m_nCurrentCodeAttr <= 1) then
        DtlCmnEditExCodeNumeric.SetFocus
	else
		DtlCmnEditExCodeFree.SetFocus;


end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnDtlCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 補助登録処理 詳細画面ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ										        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnDtlCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(not m_fAccessTab) then
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();
	end;
end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnStdCmnPopupMenuOnPopup (TObject)							            */
//*																									*/
//*	目的	: 補助登録処理 ｸﾞﾘｯﾄﾞ用ﾎﾟｯﾌﾟｱｯﾌﾟ･ﾒﾆｭｰ OnPopup ｲﾍﾞﾝﾄ								        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridPopupMenuOnPopup (Sender: TObject);
var
	strExCode	: String;
	nTagDivision: Integer;
    strExNCode  : Extended;
    nDivision   : Integer;
begin
	strExCode	:= '';

    StdCmnGridPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;              // <012>
	StdCmnGridPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;              // <012>

    // 詳細/グリッド兼用 <001>

    // 詳細画面
    if ( DtlCmnClientPanel.Visible ) then
    begin
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
        begin
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);

            gfnGetNCode(m_nCurrentMasterDiv,
                    Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]),
                    strExNCode,
                    nDivision)
        end
		else
        // ﾌﾘｰ属性
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
			strExCode	:= DtlCmnEditExCodeFree.Text;

            gfnGetNCode(m_nCurrentMasterDiv,
                        DtlCmnEditExCodeFree.Text,
                        strExNCode,
                        nDivision);
        end;
    end
    else
    begin
    	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
    	begin
    		if StdCmnMemDataExist.RecordCount <> 0 then										// HIS0016
    		begin
    			if  (m_nCurrentCodeAttr <= 1) then
    			begin
    				if	(StdCmnMemDataExist.FieldByName ('strExCode').AsString <> '') then
    					strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
    			end
    			else
    				strExCode	:= StdCmnMemDataExist.FieldByName ('strExCode').AsString;

                strExNCode  :=  StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat;
    		end;
    	end
    	else																				// 合計ｸﾞﾘｯﾄﾞ
    	begin
    		if StdCmnMemDataTotal.RecordCount <> 0 then 									// HIS0016
    		begin
    			if  (m_nCurrentCodeAttr <= 1) then
    			begin
    				strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
    			end
    			else
    				strExCode	:= StdCmnMemDataTotal.FieldByName ('strExCode').AsString;

                strExNCode  := StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat;
    		end;
    	end;
    end;

// <001>	if (strExCode <> '') then
    if ( strExNCode <> 0 ) then  // <001>
	begin
		StdCmnGridPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		StdCmnGridPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		StdCmnGridPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;              // <012>
		StdCmnGridPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;              // <012>

        nTagDivision	:= fnGetMasterDataTagInfo (strExNCode);

		if	(nTagDivision > 0) then
		begin
			StdCmnGridPopupMenuTagOff    .Visible	:= TRUE;
			StdCmnGridPopupMenuTagComment.Visible	:= TRUE;

			case (nTagDivision) of
				1:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag01.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				2:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag03.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				3:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag02.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				4:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag04.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= FALSE;
					end;
			end;
		end
		else
		begin
			StdCmnGridPopupMenuTagOff    .Visible	:= FALSE;
			StdCmnGridPopupMenuTagComment.Visible	:= FALSE;

			StdCmnGridPopupMenuTag01.Visible	:= TRUE;
			StdCmnGridPopupMenuTag02.Visible	:= TRUE;
			StdCmnGridPopupMenuTag03.Visible	:= TRUE;
			StdCmnGridPopupMenuTag04.Visible	:= TRUE;
		end;
	end
	else
	begin
		StdCmnGridPopupMenuTagOff    .Visible	:= FALSE;
		StdCmnGridPopupMenuTagComment.Visible	:= FALSE;

        StdCmnGridPopupMenuTag01.Visible	:= TRUE;
		StdCmnGridPopupMenuTag02.Visible	:= TRUE;
		StdCmnGridPopupMenuTag03.Visible	:= TRUE;
		StdCmnGridPopupMenuTag04.Visible	:= TRUE;

		StdCmnGridPopupMenuTag01.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag02.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag03.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag04.Enabled	:= FALSE;
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnSetGridTagInfo (Integer)												*/
//*																									*/
//*	目的	: 補助登録処理									                                 		*/
//*																									*/
//*	戻り値	: なし,                                                 		                        */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)									*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnSetGridTagInfo (nTagKind: Integer);
var
	strExCode	: String;
	nDivision	: Integer;
	nTagKindWork: Integer;
    strExNCode  : Extended;

begin

    // 詳細/グリッド兼用 <001>
    // 詳細画面
    if ( DtlCmnClientPanel.Visible ) then
    begin
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
        begin
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);

            gfnGetNCode(m_nCurrentMasterDiv,
                    Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]),
                    strExNCode,
                    nDivision)
        end
		else
        // ﾌﾘｰ属性
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
			strExCode	:= DtlCmnEditExCodeFree.Text;

            gfnGetNCode(m_nCurrentMasterDiv,
                        DtlCmnEditExCodeFree.Text,
                        strExNCode,
                        nDivision);
        end;
    end
    else
    begin
    	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
    	begin
    		if	(Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString) = '') then
    			Exit;

    		if  (m_nCurrentCodeAttr <= 1) then
    			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
    		else
    			strExCode	:= StdCmnMemDataExist.FieldByName ('strExCode').AsString;

            strExNCode  :=  StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat;

    		nDivision	:= 0;
    	end
    	else
    	begin
    		if	(Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString) = '') then
    			Exit;

    		if  (m_nCurrentCodeAttr <= 1) then
    			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
    		else
    			strExCode	:= StdCmnMemDataTotal.FieldByName ('strExCode').AsString;

            strExNCode  :=  StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat;

    		nDivision	:= 1;
    	end;
    end;

    if	(fnUpdateMasterDataTagInfo (strExNCode, nTagKind)) then
		nTagKindWork	:= nTagKind
	else
		nTagKindWork	:= 0;

	fnUpdateGridMemDataRecord (nDivision, strExCode, nTagKindWork);

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnGetClassDescription (Integer)											*/
//*																									*/
//*	目的	: 補助登録処理 取引先分類記述取得処理													*/
//*																									*/
//*	戻り値	: String, (取引先分類記述)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nClassCode	= 取引先分類ｺｰﾄﾞ														*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP016000f.fnGetClassDescription (nClassCode: Integer): String;
var
	strClassDescription: String;

begin
	strClassDescription	:= '';

	case (nClassCode) of
		0:	strClassDescription	:= 'その他一般';
		1:	strClassDescription	:= '連結子(親)会社';
		2:	strClassDescription	:= '非連結子会社';
		3:	strClassDescription	:= '関連会社';
	end;

	result	:= strClassDescription;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnGetRespectDescription (Integer)											*/
//*																									*/
//*	目的	: 補助登録処理 敬称記述取得処理															*/
//*																									*/
//*	戻り値	: String, (敬称記述)												                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nRespectDivision	= 敬称区分															*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP016000f.fnGetRespectDescription (nRespectDivision: Integer): String;
var
	strRespectDescription: String;

begin
	strRespectDescription	:= '';

	case (nRespectDivision) of
		0:	strRespectDescription	:= 'なし';
		1:	strRespectDescription	:= '様';
		2:	strRespectDescription	:= '殿';
		3:	strRespectDescription	:= '御中';
	end;

	result	:= strRespectDescription;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnGetTaxRateDescription (Integer)											*/
//*																									*/
//*	目的	: 補助登録処理 消費税率記述取得処理														*/
//*																									*/
//*	戻り値	: String, (消費税率記述)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nTaxRateCade	= 消費税率ｺｰﾄﾞ															*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP016000f.fnGetTaxRateDescription (nTaxRateCode: Integer): String;
var
	strTaxRateDescription: String;

begin
	strTaxRateDescription	:= '';

	case (nTaxRateCode) of
		0:	strTaxRateDescription	:= '標準税率';
		1:	strTaxRateDescription	:= '３％';
		2:	strTaxRateDescription	:= '５％';
	end;

	result	:= strTaxRateDescription;
end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnMakeSQLConstructionFunds ()												*/
//*																									*/
//*	目的	: 補助登録処理 条件SQL文取得処理														*/
//*																									*/
//*	戻り値	: String, (条件SQL文)										                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP016000f.fnMakeSQLConstructionFunds (): String;
var
	strSQLConst: String;

begin
	strSQLConst	:= 'MasterKbn = 3 AND RecordKbn = 0 AND SumKbn = 0';

	Result	:= strSQLConst;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCheckPermitGeneralRecDelete ()											*/
//*																									*/
//*	目的	: 補助登録処理 諸口補助ﾚｺｰﾄﾞ削除ﾁｪｯｸ													*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:削除可能, FALSE:削除不可能)				                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP016000f.fnCheckPermitGeneralRecDelete (): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
        SQL.Add ('SELECT GCode FROM HojyoMA          ');
		SQL.Add ('WHERE  MasterKbn = :nMasterDivision   ');
        SQL.Add ('  AND  RDelKbn   = 0                  ');
        SQL.Add ('  AND  SyokuchiKbn <> 1               ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		Open ();

		if  (not EOF) then
			fReturn	:= FALSE
		else
			fReturn	:= TRUE;

		Close ();
	end;

	dqMasterData.Free ();

	Result	:= fReturn;
end;





//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnUpdateGridMemDataRecord (Integer; String; Integer)						*/
//*																									*/
//*	目的	: 補助登録処理 																			*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)											*/
//*			  strExCode	= 部門ｺｰﾄﾞ																	*/
//*			  nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑...)											*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnUpdateGridMemDataRecord (nDivision: Integer; strExCode: String; nTagKind: Integer);
var
	cMemData	 : TdxMemData;
	strExCodeWork: String;
//<061>	    strExNCodeWork: Integer;
	strFormat	 : String;
	nRetRecNo	 : Integer;

begin
	strExCodeWork	:= strExCode;

	if	(m_nCurrentCodeAttr <= 1) then
	begin
		case (m_nCurrentCodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
	end;

	if	((nDivision = 0) or (nDIvision = DIVISION_GENERAL)) then
		cMemData	:= StdCmnMemDataExist
	else
		cMemData	:= StdCmnMemDataTotal;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'strExCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			cMemData.First ()
		else
			cMemData.RecNo	:= nRetRecNo;

		cMemData.Edit ();
		cMemData.FieldByName ('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
	end
    // 詳細画面時<001>
    else
    begin
        if ( DtlCmnScrollBox.Visible ) then
            fnGetTagColorBitmap (nTagKind);
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnMoveGridRecordSelecter (Integer; String)										*/
//*																											*/
//*	目的	: 補助登録処理 																					*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)													*/
//*			  strExCode	= 部門ｺｰﾄﾞ																			*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnMoveGridRecordSelecter (nDivision: Integer; strExCode: String);
var
	cMemData	 : TdxMemData;
	nRetRecNo	 : Integer;
	nRecMax		 : Integer;
	strExCodeWork: String;
	strFormat	 : String;

begin
	if	(Trim (strExCode) = '') then
		Exit;

	strExCodeWork	:= strExCode;

	if	((m_nCurrentCodeAttr <= 1) and (Trim (strExCode) <> '')) then
	begin
		case (m_nCurrentCodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
	end;

	if	((nDivision = 0) or (nDivision = DIVISION_GENERAL)) then
	begin
		cMemData	:= StdCmnMemDataExist;
		nRecMax		:= m_nGridExistRecords;
	end
	else
	begin
		cMemData	:= StdCmnMemDataTotal;
		nRecMax		:= m_nGridTotalRecords;
	end;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'strExCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			cMemData.First ()
		else if	(nRetRecNo = nRecMax) then
			cMemData.Last ()
		else
			cMemData.RecNo	:= nRetRecNo;
	end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnChangeComponentState (Integer)											*/
//*																									*/
//*	目的	: 補助登録処理 詳細画面表示状態変更処理													*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計, DIVISION_GENERAL:諸口)					*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnChangeComponentState (nSumDivision: Integer);
begin
	case (nSumDivision) of
		0:	begin															// 実在/合計区分: 0=実在
				fnChangeComponentStateCmn (TRUE);
			end;

		1:	begin															// 実在/合計区分: 1=合計
				fnChangeComponentStateCmn (FALSE);
			end;

		DIVISION_GENERAL:													// 実在/合計区分: 諸口
			begin
				fnChangeComponentStateCmn (FALSE);
			end;
	end;

	fnChangeComponentStateInd (nSumDivision);
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnChangeComponentStateCmn (Boolean)										*/
//*																									*/
//*	目的	: 補助登録処理 詳細画面共通ｺﾝﾎﾟｰﾈﾝﾄ表示状態変更処理										*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: fEnabled	= 表示状態 (TRUE:ON, FALSE:OFF)												*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnChangeComponentStateCmn (fEnabled: Boolean);
begin
	DtlCmnEditAppDateStart   .Visible	:= fEnabled;
	DtlCmnEditAppDateEnd     .Visible	:= fEnabled;
	DtlCmnLabelAppDateTitle  .Visible	:= fEnabled;
	DtlCmnLabelAppDateAddtion.Visible	:= fEnabled;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnChangeComponentStateInd (Integer)										*/
//*																									*/
//*	目的	: 補助登録処理 詳細画面個別ｺﾝﾎﾟｰﾈﾝﾄ表示状態変更処理										*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計, DIVISION_GENERAL:諸口)					*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnChangeComponentStateInd (nSumDivision: Integer);
//<061>	var
//<061>		fVisible: Boolean;

begin
	//	参照時使用不可		HIS0005
	if (giReferFlag	= REFER) then
	begin
{
		DtlCmnEditExCodeNumeric	.Enabled	:=	FALSE;
		DtlCmnEditExCodeFree	.Enabled	:=	FALSE;
		DtlCmnEditSumDivision	.Enabled	:=	FALSE;
		DtlCmnEditAssociation	.Enabled	:=	FALSE;
		DtlCmnEditName			.Enabled	:=	FALSE;
		DtlCmnEditNameSimple	.Enabled	:=	FALSE;
		DtlCmnEditAppDateStart	.Enabled	:=	FALSE;
		DtlCmnEditAppDateEnd	.Enabled	:=	FALSE;
}
	end;

	if	(nSumDivision = DIVISION_GENERAL) then
		Exit;

end;






//**********************************************************************
//*		Proccess	:	参照・入力時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Name		:	H.Endo
//*		Date		:	2001/1/9
//*		Parameter	:	Select		:	NORMAL(通常処理),BASICONLY(基本のみ設定可能),REFER(参照のみ)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP016000f.fnPartsControl(Select: Integer);	//	HIS0005
begin
	if (Select = REFER) then	//	参照の時
	begin
		//	TreeView
		CmnTreeView.DragMode	:=	dmManual;
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridExistCode				.ReadOnly	:=	TRUE;
		StdCmnGridExistAssociation		.ReadOnly 	:=	TRUE;
		StdCmnGridExistName				.ReadOnly	:=	TRUE;
		StdCmnGridExistNameSimple		.ReadOnly	:=	TRUE;
		StdCmnGridExistAdoptDivision01	.ReadOnly 	:=	TRUE;
		StdCmnGridExistAdoptComment01	.ReadOnly 	:=	TRUE;
		StdCmnGridExistAdoptDivision02	.ReadOnly 	:=	TRUE;
		StdCmnGridExistAdoptComment02	.ReadOnly 	:=	TRUE;
		//	合計情報Grid
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridTotalCode			.ReadOnly	:=	TRUE;
		StdCmnGridTotalAssociation	.ReadOnly	:=	TRUE;
		StdCmnGridTotalName			.ReadOnly	:=	TRUE;
		StdCmnGridTotalNameSimple	.ReadOnly 	:=	TRUE;

		//	GridのPOPUP
//<012>		StdCmnGridExist.PopupMenu	:=	nil;
//<012>		StdCmnGridTotal.PopupMenu	:=	nil;

		StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
		StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;

        PnlH1.Enabled := False;                     //<012>
        PnlH2.Enabled := False;                     //<012>
        Pnl_SegBunInfo.Enabled := False;            //<012>
        DtlCmnButtonUpdate.Enabled := False;        //<012>
        DtlCmnButtonCancel.Enabled := False;        //<012>
	end
	else
	begin
		//	TreeView
		CmnTreeView.DragMode	:=	dmAutomatic;
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		StdCmnGridExistAssociation		.ReadOnly 	:=	FALSE;
		StdCmnGridExistName				.ReadOnly	:=	FALSE;
		StdCmnGridExistNameSimple		.ReadOnly	:=	FALSE;
		StdCmnGridExistAdoptDivision01	.ReadOnly 	:=	FALSE;
		StdCmnGridExistAdoptComment01	.ReadOnly 	:=	FALSE;
		StdCmnGridExistAdoptDivision02	.ReadOnly 	:=	FALSE;
		StdCmnGridExistAdoptComment02	.ReadOnly 	:=	FALSE;
		//	合計情報Grid
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		StdCmnGridTotalAssociation	.ReadOnly	:=	FALSE;
		StdCmnGridTotalName			.ReadOnly	:=	FALSE;
		StdCmnGridTotalNameSimple	.ReadOnly 	:=	FALSE;
		//	GridのPOPUP
		StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
		StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;
	end;
end;

//**********************************************************************
//*		Proccess	:	ﾌｧｲﾙ出力時のﾀｲﾄﾙ･ﾌｨｰﾙﾄﾞ名ｾｯﾄ
//*		Name		:	H.Endo
//*		Date		:	2001/1/11
//*		Parameter	:	PrintDivision	:	帳票種類
//*						sTitle			:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld			:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP016000f.fnSetFileOutTF(PrintDivision: Integer;							//	HIS0007
								var sTitle: TStringList; var sMemFld: TStringList);
begin
	case PrintDivision of
		0:
		begin
			//HIS0030
			//社員
			if (m_nCurrentMasterDiv = 25) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
			begin
				if m_BumonUseKbn = 0 then
					sTitle.Add	('コード'			)
				else
					sTitle.Add  ('工事コード'       );
			end
			else
				sTitle.Add	('コード'			    );

			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);

			//社員	HIS0030
			if (m_BumonUseKbn <> 0) and (m_nCurrentMasterDiv = 25) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
			begin
				sTitle.Add('部門コード'             );
				sTitle.Add('簡略名称'               );
			end;

			//補助	HIS0031
			case m_nCurrentMasterDiv of
				31..35: sTitle.Add('取引先分類'     );
			end;

			sTitle.Add	('適用期間開始'				);
			sTitle.Add	('適用期間終了'				);
			sTitle.Add	('最終更新日時'				);

			//取引先	HIS0031
          	if m_nCurrentMasterDiv = 22 then
			begin
				sTitle.Add	('得意先'				);
				sTitle.Add	('仕入先'				);
				sTitle.Add	('取引先分類'			);
				sTitle.Add	('得意先借方資金繰ｺｰﾄﾞ'	);
				sTitle.Add	('得意先借方資金繰名称'	);
				sTitle.Add	('得意先貸方資金繰ｺｰﾄﾞ'	);
				sTitle.Add	('得意先貸方資金繰名称'	);
				sTitle.Add	('仕入先借方資金繰ｺｰﾄﾞ'	);
				sTitle.Add	('仕入先借方資金繰名称'	);
				sTitle.Add	('仕入先貸方資金繰ｺｰﾄﾞ'	);
				sTitle.Add	('仕入先貸方資金繰名称'	);
				sTitle.Add	('売上消費税ｺｰﾄﾞ'		);
				sTitle.Add	('売上消費税名称'		);
				sTitle.Add	('仕入消費税ｺｰﾄﾞ'		);
				sTitle.Add	('仕入消費税名称'		);
			end;

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);

			//社員	HIS0030
			if (m_BumonUseKbn <> 0) and (m_nCurrentMasterDiv = 25) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
			begin
				sMemFld.Add('SectionCode'           );
				sMemFld.Add('SectionName'           );
			end;

			//補助	HIS0031
			case m_nCurrentMasterDiv of
				31..35: sMemFld.Add('strClassDesc'  );
			end;

			sMemFld.Add	('dtAppDateStart'			);
			sMemFld.Add	('dtAppDateEnd'				);
			sMemFld.Add	('dtUpdateDate'				);

			//取引先	HIS0031
			if (m_nCurrentMasterDiv = 22) then
			begin
				sMemFld.Add	('strCustomerDesc'			);
				sMemFld.Add	('strSupplierDesc'			);
				sMemFld.Add	('strClassDesc'				);
				sMemFld.Add	('nExCodeCustDeb'			);
				sMemFld.Add	('strCustDebDesc'			);
				sMemFld.Add	('nExCodeCustCre'			);
				sMemFld.Add	('strCustCreDesc'			);
				sMemFld.Add	('nExCodeSuppDeb'			);
				sMemFld.Add	('strSuppDebDesc'			);
				sMemFld.Add	('nExCodeSuppCre'			);
				sMemFld.Add	('strSuppCreDesc'			);
				sMemFld.Add	('nTaxCodeSales'			);
				sMemFld.Add	('strTaxSalesDesc'			);
				sMemFld.Add	('nTaxCodeStock'			);
				sMemFld.Add	('strTaxStockDesc'			);
			end;
		end;

		1:
		begin
			sTitle.Add	('コード'					);
			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);
			sTitle.Add	('採用'						);
			sTitle.Add	('郵便番号'					);
			sTitle.Add	(''							);
			sTitle.Add	('住所'						);
			sTitle.Add	(''							);
			sTitle.Add	('部署'						);
			sTitle.Add	('担当'						);
			sTitle.Add	('敬称'						);
			sTitle.Add	('電話'						);
			sTitle.Add	('得意先借方資金繰ｺｰﾄﾞ'		);
			sTitle.Add	('得意先借方資金繰名称'		);
			sTitle.Add	('得意先貸方資金繰ｺｰﾄﾞ'		);
			sTitle.Add	('得意先貸方資金繰名称'		);
			sTitle.Add	('仕入先借方資金繰ｺｰﾄﾞ'		);
			sTitle.Add	('仕入先借方資金繰名称'		);
			sTitle.Add	('仕入先貸方資金繰ｺｰﾄﾞ'		);
			sTitle.Add	('仕入先貸方資金繰名称'		);
			sTitle.Add	('売上消費税ｺｰﾄﾞ'			);
			sTitle.Add	('売上消費税名称'			);
			sTitle.Add	('仕入消費税ｺｰﾄﾞ'			);
			sTitle.Add	('仕入消費税名称'			);
			sTitle.Add	('取引先分類'				);
			sTitle.Add	('与信限度額'				);
			sTitle.Add	('入金日１締日'				);
			sTitle.Add	('入金日１予定月'			);
			sTitle.Add	('入金日１予定日'			);
			sTitle.Add	('入金日１休日区分'			);
			sTitle.Add	('入金日２締日'				);
			sTitle.Add	('入金日２予定月'			);
			sTitle.Add	('入金日２予定日'			);
			sTitle.Add	('入金日２休日区分'			);
			sTitle.Add	('入金日３締日'				);
			sTitle.Add	('入金日３予定月'			);
			sTitle.Add	('入金日３予定日'			);
			sTitle.Add	('入金日３休日区分'			);
			sTitle.Add	('支払日１締日'				);
			sTitle.Add	('支払日１予定月'			);
			sTitle.Add	('支払日１予定日'			);
			sTitle.Add	('支払日１休日区分'			);
			sTitle.Add	('支払日２締日'				);
			sTitle.Add	('支払日２予定月'			);
			sTitle.Add	('支払日２予定日'			);
			sTitle.Add	('支払日２休日区分'			);
			sTitle.Add	('支払日３締日'				);
			sTitle.Add	('支払日３予定月'			);
			sTitle.Add	('支払日３予定日'			);
			sTitle.Add	('支払日３休日区分'			);
			sTitle.Add	('適用期間開始'				);
			sTitle.Add	('適用期間終了'				);
			sTitle.Add	('更新日時'					);
			sTitle.Add	('支払場所１'				);
			sTitle.Add	('支払場所２'				);
			sTitle.Add	('支払場所３'				);
			sTitle.Add	('振出人１'					);
			sTitle.Add	('振出人２'					);
			sTitle.Add	('振出人３'					);
			sTitle.Add	('振出人４'					);
			sTitle.Add	('振出人５'					);
			sTitle.Add	('手形ランク'				);

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);
			sMemFld.Add	('strAdoptDesc'				);
			sMemFld.Add	('nZipCodeUpper'			);
			sMemFld.Add	('nZipCodeLower'			);
			sMemFld.Add	('strAddressUpper'			);
			sMemFld.Add	('strAddressLower'			);
			sMemFld.Add	('strPostName'				);
			sMemFld.Add	('strChargeName'			);
			sMemFld.Add	('strRespectDesc'			);
			sMemFld.Add	('strTelephoneNo'			);
			sMemFld.Add	('nExCodeDebCustomer'		);
			sMemFld.Add	('strFundDescDebCustomer'	);
			sMemFld.Add	('nExCodeCreCustomer'		);
			sMemFld.Add	('strFundDescCreCustomer'	);
			sMemFld.Add	('nExCodeDebSupplier'		);
			sMemFld.Add	('strFundDescDebSupplier'	);
			sMemFld.Add	('nExCodeCreSupplier'		);
			sMemFld.Add	('strFundDescCreSupplier'	);
			sMemFld.Add	('nTaxCodeSales'			);
			sMemFld.Add	('strTaxDescSales'			);
			sMemFld.Add	('nTaxCodeStock'			);
			sMemFld.Add	('strTaxDescStock'			);
			sMemFld.Add	('strClassDesc'				);
			sMemFld.Add	('nLimitPrice'				);
			sMemFld.Add	('nClosingDay01Rec'			);
			sMemFld.Add	('strExpectMonthDesc01Rec'	);
			sMemFld.Add	('nExpectDay01Rec'			);
			sMemFld.Add	('strHolidayDesc01Rec'		);
			sMemFld.Add	('nClosingDay02Rec'			);
			sMemFld.Add	('strExpectMonthDesc02Rec'	);
			sMemFld.Add	('nExpectDay02Rec'			);
			sMemFld.Add	('strHolidayDesc02Rec'		);
			sMemFld.Add	('nClosingDay03Rec'			);
			sMemFld.Add	('strExpectMonthDesc03Rec'	);
			sMemFld.Add	('nExpectDay03Rec'			);
			sMemFld.Add	('strHolidayDesc03Rec'		);
			sMemFld.Add	('nClosingDay01Pay'			);
			sMemFld.Add	('strExpectMonthDesc01Pay'	);
			sMemFld.Add	('nExpectDay01Pay'			);
			sMemFld.Add	('strHolidayDesc01Pay'		);
			sMemFld.Add	('nClosingDay02Pay'			);
			sMemFld.Add	('strExpectMonthDesc02Pay'	);
			sMemFld.Add	('nExpectDay02Pay'			);
			sMemFld.Add	('strHolidayDesc02Pay'		);
			sMemFld.Add	('nClosingDay03Pay'			);
			sMemFld.Add	('strExpectMonthDesc03Pay'	);
			sMemFld.Add	('nExpectDay03Pay'			);
			sMemFld.Add	('strHolidayDesc03Pay'		);
			sMemFld.Add	('dtAppDateStart'			);
			sMemFld.Add	('dtAppDateEnd'				);
			sMemFld.Add	('dtUpdateDate'				);
			sMemFld.Add	('strClearHouse01'			);
			sMemFld.Add	('strClearHouse02'			);
			sMemFld.Add	('strClearHouse03'			);
			sMemFld.Add	('strDrawerDraft01'			);
			sMemFld.Add	('strDrawerDraft02'			);
			sMemFld.Add	('strDrawerDraft03'			);
			sMemFld.Add	('strDrawerDraft04'			);
			sMemFld.Add	('strDrawerDraft05'			);
			sMemFld.Add	('strDraftRank'				);
		end;

		2:
		begin
			sTitle.Add	('コード'					);
			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);
			sTitle.Add	('最終更新日時'				);

			//HIS0031
			if (m_nCurrentMasterDiv = 22) then
			begin
				sTitle.Add	('名寄せ'				);
				sTitle.Add	('郵便番号'				);
				sTitle.Add	(''						);
				sTitle.Add	('住所'					);
			end;

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);
			sMemFld.Add	('dtUpdateDate'				);

			//HIS0031
			if (m_nCurrentMasterDiv = 22) then
			begin
				sMemFld.Add	('strAdoptDesc'			);
				sMemFld.Add	('nZipCodeUpper'		);
				sMemFld.Add	('nZipCodeLower'		);
				sMemFld.Add	('strAddress'			);
			end;
		end;

		3:
		begin
			sTitle.Add	('加算先ｺｰﾄﾞ'				);
			sTitle.Add	('加算先名称'				);
			sTitle.Add	('加算元ｺｰﾄﾞ'				);
			sTitle.Add	('加算元名称'				);
			sMemFld.Add	('strExCodeDst'				);
			sMemFld.Add	('strNameSimpleDst'			);
			sMemFld.Add	('strExCodeSrc'				);
			sMemFld.Add	('strNameSimpleSrc'			);
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	ｽﾄｱﾄﾞのSQL文作成
//*		Name		:	H.Endo
//*		Date		:	2001/1/30
//*		Parameter	:	TAN_CD		:	担当者ｺｰﾄﾞ
//*						TAN_NAME	:	担当者名
//*						FLAG		:	担当者選択なし(-1以外:TRUE/-1:FALSE)
//*		Return		:	作成したSQL文
//*		History		:
//**********************************************************************
{
function TJNTCRP016000f.fnMakeSQL(TAN_CD: Integer; TAN_NAME: String; FLAG: Boolean):String;	//	HIS0008
var
	sSQL		:	String;
	sTanCD		:	String;
begin
	sTanCD		:=	IntToStr(TAN_CD);
	sSQL	:=	'CALL MP200010(0';
	if (FLAG) then		//	担当者選択なし
	begin
		sSQL	:=	sSQL	+ ','
							+ ''+ sTanCD + ','
							+ ''''+ TAN_NAME + '''';
	end;
	sSQL	:=	sSQL + ')';

	Result	:=	sSQL;
end;
}
{
function	TJNTCRP016000f.fnMakeSQL(FLAG,StratEndFlag: Boolean):String;
var
	sSQL	:	String;
begin
	sSQL := '';
	if (StratEndFlag = TRUE) then
		sSQL	:=	'CALL MP200010(0'	//	ｽﾄｱﾄﾞの開始
	else
		sSQL	:=	'CALL MP200010(1';	//	ｽﾄｱﾄﾞの終了
	if (FLAG) then		//	担当者選択なし
	begin
// <024>↓
//		sSQL	:=	sSQL + ',:TANCD,:TANNAME'
		sSQL	:=	sSQL + ',:TANCD'
// <024>↑
	end;
	sSQL	:=	sSQL + ')';

	Result	:=	sSQL;
end;
} // <041>

// ↓↓↓<041>
//**********************************************************************
//*		Proccess	:	ｽﾄｱﾄﾞのSQL文作成
//*		Name		:	Y.Mogi(LEAD)
//*		Date		:	2007/03/03
//*		Parameter	:	nType       : 処理区分
//*                                   1 :履歴用ｽﾄｱﾄﾞの開始
//*						　　　　　　　2 :履歴用ｽﾄｱﾄﾞの終了
//*                                   10:ｸﾞﾙｰﾌﾟ管理用ｽﾄｱﾄﾞの開始
//*                                   11:ｸﾞﾙｰﾌﾟ管理用ｽﾄｱﾄﾞの終了
//*		Return		:	作成したSQL文
//*		History		:
//**********************************************************************
function TJNTCRP016000f.fnMakeSQL(nType: Integer): String;
var
 sSQL :	String;
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
// ↑↑↑<041>

//************************************************************************
//*		Component		:	StdCmnTabChange ( TMTab )
//*							Tabが変わった時
//*		Event			:	OnChange
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure	TJNTCRP016000f.fnStdCmnTabOnChange (Sender: TObject);
begin
	if	(not m_fAccessTab) then
		Exit;

	if	(StdCmnTab.Items.Selected = 0) then
	begin
		if	(not StdCmnTab.Focused) then
			StdCmnGridExist.SetFocus;

        // ﾌｧﾝｸｼｮﾝ設定<002>
        if ( m_nGridExistRecords <> 0 ) then
//<017>            fnSetFncType(1)
//<017>        else    fnSetFncType(0);

	end
	else
	begin
		if	(not StdCmnTab.Focused) then
			StdCmnGridTotal.SetFocus;

        // ﾌｧﾝｸｼｮﾝ設定<002>
        if ( m_nGridTotalRecords <> 0 ) then
//<017>            fnSetFncType(1)
//<017>        else    fnSetFncType(0);
	end;

end;

//**************************************************************************
//	Component  :	Form
//	Event	    :	OnPaint ( ﾕｰｻﾞｰﾒｯｾｰｼﾞ)
//	Name	    :	T.Nobezawa
//**************************************************************************
procedure TJNTCRP016000f.WMOnPaint(var Msg: TMessage);
begin

    m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 10);
    m_MjsMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange (m_MjsMsgRec.sMsg, '@_@', '汎用補助');
	MJSMessageBoxEx (AOwner,    // <009>
                     m_MjsMsgRec.sMsg,
                     m_MjsMsgRec.sTitle,
                     m_MjsMsgRec.icontype,
                     m_MjsMsgRec.btntype,
                     m_MjsMsgRec.btndef,
                     m_MjsMsgRec.LogType
                    );

    // 補助1～5が未採用の場合は、画面を閉じる。
	Close;  // <044>

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnOutputConfirmationMessage (Integer)												*/
//*																											*/
//*	目的	: 補助登録処理 終了･取消時, 確認ﾒｯｾｰｼﾞ出力処理													*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分																			*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP016000f.fnOutputConfirmationMessage (nDivision: Integer): Integer;
var
	nMessageID	: Integer;
	nReturn		: Integer;
	strExCode	: String;

begin
	if	(not m_fChangeDetails) then
	begin
		Result	:= CONFIRM_THROUGH;
		Exit;
	end;

	nMessageID	:= 1;

	if	(nDivision = CONFIRM_EXIT) then													// 終了ﾎﾞﾀﾝ
	begin
		if  (m_nCurrentCodeAttr <= 1) then
		begin
			if	(DtlCmnEditExCodeNumeric.InputFlag) then
				strExCode	:= ''
			else
				strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		end
		else
        begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
			strExCode	:= DtlCmnEditExCodeFree.Text;
		end;

		if	(Trim (strExCode) = '') then
		begin
			Result	:= CONFIRM_THROUGH;
			Exit;
		end;

		nMessageID	:= 2;
	end;

	m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 10020, nMessageID);

	nReturn	:= MJSMessageBoxEx (AOwner, // <009>
                                m_MjsMsgRec.sMsg,
                                m_pRec^.m_ProgramName,
                                m_MjsMsgRec.icontype,
                                m_MjsMsgRec.btntype,
                                m_MjsMsgRec.btndef,
                                m_MjsMsgRec.LogType
                               );

	if	(nReturn = mrYes) then
	begin
		if	(nDivision = CONFIRM_EXIT) then
			nReturn	:= CONFIRM_EXITWRITE
		else
			nReturn	:= CONFIRM_THROUGH;
	end
	else if	(nReturn = mrNo) then
	begin
		if	(nDivision = CONFIRM_EXIT) then
			nReturn	:= CONFIRM_THROUGH
		else
			nReturn	:= CONFIRM_RETFOCUSED;
	end
	else if	(nReturn = mrCancel) then
		nReturn	:= CONFIRM_RETFOCUSED
	else
		nReturn	:= CONFIRM_THROUGH;

	Result	:= nReturn;
end;




//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP016000f.fnUpdateDetailsScreenRecord (): Boolean;
var
	strExCode    : String;
	fReturn	     : Boolean;
    strExNCode   : Extended;
    dqMasterData : TMQuery;
begin

    // 外部ｺｰﾄﾞ属性、桁数対応
	if  ( m_nCurrentCodeAttr <= 1 ) then
        // 数値属性
    	strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
    else
	begin
        // ﾌﾘｰ属性
    	DtlCmnEditExCodeFree.Text := TrimRight(DtlCmnEditExCodeFree.Text);
    	strExCode := DtlCmnEditExCodeFree.Text;
	end;

    // 実在/合計区分
	if ( DtlCmnTab.Items [0].Selected ) then
    		m_stMasterData.nDivision := 0   // 実在
	else    m_stMasterData.nDivision := 1;  // 合計


    dqMasterData := TMQuery.Create ( Self );
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );

    with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT NCODE FROM HOJYOMA           ');
        SQL.Add('WHERE  MasterKbn = :nMasterDivision ');
        SQL.Add('  AND  RDelKbn   = 0                ');
        SQL.Add('  AND  GCODE     = :strExCode       ');

        ParamByName ('nMasterDivision').AsInteger := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString  := strExCode;
        Open;

        if	( not EOF ) then
			    strExNCode := FieldByName ('NCODE').AsFloat
        else    gfnGetExNCode('HojyoMA',strExNCode);
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;                                              // 加算先(親)外侮ｺｰﾄﾞ
    m_stMasterData.strExNCodeParent	:= m_strExNCodeCurrent;                                             // 加算先(親)内部ｺｰﾄﾞ
    m_stMasterData.strExCode		:= strExCode;														// 加算元補助外部ｺｰﾄﾞ
    m_stMasterData.strExNCode       := strExNCode;                                                      // 加算元補助内部ｺｰﾄﾞ
	m_stMasterData.strAssociation	:= DtlCmnEditAssociation.Text;										// 連想
	m_stMasterData.strName			:= DtlCmnEditName.Text;												// 正式名称
	m_stMasterData.strNameSimple	:= DtlCmnEditNameSimple.Text;										// 簡略名称
	m_stMasterData.fDetails			:= TRUE;															// 詳細更新区分: TRUE=あり
	m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8 (DtlCmnEditAppDateStart.AsDateTime);	// 適用開始年月日
	m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8 (DtlCmnEditAppDateEnd  .AsDateTime);	// 適用終了年月日

    // 補助基本ﾏｽﾀ更新
    fReturn := fnUpdateMasterRecord ( strExNCode );

	if ( fReturn ) then
	begin
        // ↓↓↓<041>
        // ｸﾞﾙｰﾌﾟ管理を採用している場合で、親会社が存在しない場合は、親会社の内部ｺｰﾄﾞで
        // 書き込まなければならない為、更新時に再取得した内部ｺｰﾄﾞ(m_stMasterData.strExNCode)
        // を再設定する。
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            strExNCode := m_stMasterData.strExNCode;
        end;
        // ↑↑↑<041>

        // 各種詳細情報更新
		fnUpdateDetailIndInfo();
        // 付箋情報の更新
        // <048>fnUpdateMasterDataTagInfo (strExNCode, m_nSelectTagKind);
	end;

	Result := fReturn;
end;

procedure	TJNTCRP016000f.fnDtlCmnPopupMenuOnPopup (Sender: TObject);
begin
	DtlCmnPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;                      // <012>
	DtlCmnPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;                      // <012>
	DtlCmnPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;                      // <012>
	DtlCmnPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;                      // <012>

	DtlCmnPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;                  // <012>
	DtlCmnPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;                  // <012>

	if	(m_nSelectTagKind > 0) then
	begin
		DtlCmnPopupMenuTagOff    .Visible	:= TRUE;
		DtlCmnPopupMenuTagComment.Visible	:= TRUE;

		case (m_nSelectTagKind) of
			1:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag01.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= FALSE;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			2:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag03.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= TRUE;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= FALSE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			3:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag02.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= TRUE;
					DtlCmnPopupMenuTag02 .Visible	:= FALSE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			4:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag04.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= TRUE;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= FALSE;
				end;
		end;
	end
	else
	begin
		DtlCmnPopupMenuTagOff    .Visible	:= FALSE;
		DtlCmnPopupMenuTagComment.Visible	:= FALSE;

		DtlCmnPopupMenuTag01 .Visible	:= TRUE;
		DtlCmnPopupMenuTag02 .Visible	:= TRUE;
		DtlCmnPopupMenuTag03 .Visible	:= TRUE;
		DtlCmnPopupMenuTag04 .Visible	:= TRUE;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnCmnEditDayOnExit (TObject)														*/
//*																											*/
//*	目的	: 補助登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnCmnEditDayOnExit (Sender: TObject);
begin
	if	((TMNumEdit (Sender).Value < 0) or (TMNumEdit (Sender).Value > 31)) then
	begin
		Beep ();

		TMNumEdit (Sender).SetFocus ();
	end;
end;

procedure	TJNTCRP016000f.fnStdCmnGridExistOnChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);

begin
	if	(Column = 4) then
	begin
//<017>		m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 19);
//<017>		CmnStatusBar.SimpleText	:= m_MjsMsgRec.sMsg;
        fnSetFncType(True,7);   //<017>
	end
	else
//<017>		CmnStatusBar.SimpleText	:= '';
        fnSetFncType(False,7);   //<017>
end;


procedure	TJNTCRP016000f.fnStdCmnGridTotaOnlChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);

begin
	if	(Column = 4) then
	begin
//<017>		m_cComArea.m_MsgStd.GetMsg (m_MjsMsgRec, 30, 19);
//<017>		CmnStatusBar.SimpleText	:= m_MjsMsgRec.sMsg;
        fnSetFncType(True,7);   //<017>
	end
	else
//<017>		CmnStatusBar.SimpleText	:= '';
        fnSetFncType(False,7);   //<017>
end;

procedure	TJNTCRP016000f.fnCmnToolbarDropDownMenuItemOnClick (Sender: TObject);
begin
	CmnToolbarButtonTag.ImageIndex	:= (Sender as TMenuItem).ImageIndex;

    m_FusenColorIdx :=  CmnToolbarButtonTag.ImageIndex;

    abort;		// 051121 広田　なぜだろう？　これをしないとAPツールバーが無効になる？
end;





//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnEnableToolbarButtonTag (Boolean)												*/
//*																											*/
//*	目的	: 補助登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: fEnabled	= 入力(不/可)状態 (TRUE:ON, FALSE:OFF)												*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnEnableToolbarButtonTag (fEnabled: Boolean);
begin

    if m_cJNTArea.IsFusen then                                      // <012>
    begin
    	if	(fEnabled) then
	    begin
		    if	(DtlCmnClientPanel.Visible) then
                ToolBarFusen       .Enabled	:= fEnabled
	    	else
                ToolBarFusen       .Enabled	:= fEnabled;

            if ( m_FusenColorIdx = -1 ) then
                CmnToolbarButtonTag.ImageIndex	:=  0
            else
                CmnToolbarButtonTag.ImageIndex	:=  m_FusenColorIdx;
    	end
	    else
        begin
            CmnToolbarButtonTag.ImageIndex	:=  4;
            ToolBarFusen       .Enabled	:= fEnabled;
        end;
    end else
    begin
        CmnToolbarButtonTag.ImageIndex	:=  4;
        ToolBarFusen       .Enabled	:= fEnabled;
    end;


end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnCheckDtlExCodeValid ()														*/
//*																											*/
//*	目的	: 補助登録処理																					*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP016000f.fnCheckDtlExCodeValid (): Boolean;
var
	stWorkRec : ^TreeViewRec;
	nCount	  : Integer;
	strExCode : String;
    iSumKbn   : Integer;
begin
	// -----<057> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<057> Add-Ed-----

    m_RowState := STATE_NONE;   // <041>

    // 未処理(初回時)
	if ( m_pRec^.m_pChildForm = nil ) then
	begin
		Result	:= TRUE;
		Exit;
	end;

    // 数値属性
	if ( m_nCurrentCodeAttr <= 1 ) then
	begin
		if ( DtlCmnEditExCodeNumeric.InputFlag ) and ( Trunc (DtlCmnEditExCodeNumeric.Value) = 0 ) then
			strExCode	:= ''
		else
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);
	end
    // ﾌﾘｰ属性
	else
	begin
		DtlCmnEditExCodeFree.Text := TrimRight(DtlCmnEditExCodeFree.Text);
		strExCode := DtlCmnEditExCodeFree.Text;

		if ( not fnCheckExCodeValidCharacter (strExCode) ) then
		begin
			DtlCmnEditExCodeFree.SetFocus ();
			Result	:= FALSE;
			Exit;
		end;
	end;

	if ( Trim (strExCode) = '' ) then
	begin
		Beep ();

		if	( m_nCurrentCodeAttr <= 1 ) then
			    m_cACControl	:= DtlCmnEditExCodeNumeric      // 数値属性
		else    m_cACControl	:= DtlCmnEditExCodeFree;		// ﾌﾘｰ属性

		m_cACControl.SetFocus ();
		Result := FALSE;
		Exit;
	end;

    // 外部ｺｰﾄﾞ変更ﾁｪｯｸ
	if ( not m_fDtlChangeExCode ) then
	begin
        // 変更がない場合は終了
        m_RowState := STATE_EDIT;   // <041>
		Result	   := TRUE;
		Exit;
	end;

	m_fDtlNewRecord	:= FALSE;

	if	( fnResetDetailScreen () ) then
	begin
        // 新規ﾚｺｰﾄﾞ
        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理 <041>
        //
        //  ｸﾞﾙｰﾌﾟ管理を採用している場合、詳細画面のｺｰﾄﾞｺﾝﾄﾛｰﾙ確定時に同期を
        //  行う。親会社に既に同一ﾏｽﾀが存在している場合は同期配信を行います。
        //  存在していない場合は、通常処理。
        // -------------------------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) and ( giReferFlag <> REFER ) then
        begin
            if ( DtlCmnTab.Items[0].Selected ) then
                    iSumKbn := 0
            else    iSumKbn := 1;

            // 会社関連付処理
            case fnCorpRelation ( strExCode, iSumKbn ) of
                0:  begin
                        // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
                    end;
                1:  begin
                        fnCleanupTreeViewNewItem ( false );
                        fnSetDetailScreenInfo ( strExCode,  iSumKbn);
                        // 正常に関連付が行えた場合は、画面の再描画を行う
                        if ( m_nCurrentCodeAttr <= 1 ) then
                                MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeNumeric')
                        else    MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeFree');
                        m_fChangeDetails := false;
                        Abort;
                    end;
                2:  begin
                        // 会社関連付をｷｬﾝｾﾙした場合
                        if ( m_nCurrentCodeAttr <= 1 ) then
                                MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeNumeric')
                        else    MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeFree');
                        Abort;
                    end;
                -1, -9: begin
                            // 実在合計不一致、例外ｴﾗｰ
                            Abort;
                        end;
            end;
        end;

        m_RowState := STATE_INSERT;
        // ↑↑↑<041>
        // -------------------------------------------------------------------------

        if ( DtlCmnTab.Items [0].Selected ) then
    			fnChangeComponentState (0)      // 実在
		else    fnChangeComponentState (1);     // 合計

		m_cNodePrevSelect := CmnTreeView.Selected;
		m_fDtlNewRecord	  := TRUE;
	end
	else
	begin
        // 既存ﾚｺｰﾄﾞ
		for nCount := 1 to CmnTreeView.Items.Count do
		begin
			stWorkRec := CmnTreeView.Items [nCount - 1].Data;

			if ( CompareStr (stWorkRec^.strExCode, strExCode) = 0 ) then
			begin
//<062> MOD St
//				CmnTreeView.Items [nCount - 1].Selected	:= TRUE;
                // 既に選択済みであればイベントだけ発生させる
                if (CmnTreeView.Items [nCount - 1].Selected) then
                begin
                    CmnTreeView.OnChange(CmnTreeView,CmnTreeView.Items [nCount - 1]);
                end
                else
                begin
                    CmnTreeView.Items [nCount - 1].Selected	:= TRUE;
                end;
//<062> MOD Ed
				Break;
			end;
		end;

        m_RowState := STATE_EDIT; // <041>
	end;

	m_fDtlChangeExCode	:= FALSE;
	Result				:= TRUE;

	// -----<057> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<057> Add-Ed-----

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TMas210100f.fnStdCmnGridExistOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 実在補助ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridExistOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nExCodeSelect  : Extended;
	strExCodeSelect: String;

begin
	inherited;

	nExCodeSelect	:= 0;
	strExCodeSelect	:= '';

	if	((Y <= StdCmnGridExist.HeaderPanelHeight) or
		 (X <= StdCmnGridExist.GrIndicatorWidth ) or
		 (X >= (StdCmnGridExist.GrIndicatorWidth + StdCmnGridExistTag.Width))) then
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		StdCmnGridExist.Hint		:= '';
		StdCmnGridExist.ShowHint	:= FALSE;

		Exit;
	end;

	if	((StdCmnGridExist.GetNodeAt (X, Y) <> nil) and
		 (not VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1]))) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			nExCodeSelect	:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1]
		else
			strExCodeSelect	:= TdxTreelistNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1];

		if	(((m_nCurrentCodeAttr <= 1) and (nExCodeSelect <> m_nHintPosition)) or
			 ((m_nCurrentCodeAttr  = 2) and (CompareStr (strExCodeSelect, m_strHintPosition) <> 0))) then
		begin
			m_nHintPosition		:= nExCodeSelect;
			m_strHintPosition	:= strExCodeSelect;

			StdCmnGridExist.Hint		:= '';
			StdCmnGridExist.ShowHint	:= FALSE;

			Exit;
		end;

		if	(StdCmnGridExist.ShowHint and
			 (((m_nCurrentCodeAttr <= 1) and (nExCodeSelect = m_nHintPosition)) or
			  ((m_nCurrentCodeAttr  = 2) and (CompareStr (strExCodeSelect, m_strHintPosition) = 0)))) then
			Exit;

		if	(VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [9])) then
			Exit;

		if	(TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [9] <> '') then
		begin
			StdCmnGridExist.Hint		:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [9];
			StdCmnGridExist.ShowHint	:= TRUE;
		end;
	end
	else
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		StdCmnGridExist.Hint		:= '';
		StdCmnGridExist.ShowHint	:= FALSE;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TMas210100f.fnStdCmnGridTotalOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 合計補助ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnStdCmnGridTotalOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nExCodeSelect  : Extended;
	strExCodeSelect: String;

begin
	inherited;

	nExCodeSelect	:= 0;
	strExCodeSelect	:= '';

	if	((Y <= StdCmnGridTotal.HeaderPanelHeight) or
		 (X <= StdCmnGridTotal.GrIndicatorWidth ) or
		 (X >= (StdCmnGridTotal.GrIndicatorWidth + StdCmnGridTotalTag.Width))) then
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		StdCmnGridTotal.Hint		:= '';
		StdCmnGridTotal.ShowHint	:= FALSE;

		Exit;
	end;

	if	((StdCmnGridTotal.GetNodeAt (X, Y) <> nil) and
		 (not VarIsNull (TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1]))) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			nExCodeSelect	:= TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1]
		else
			strExCodeSelect	:= TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1];

		if	(((m_nCurrentCodeAttr <= 1) and (nExCodeSelect <> m_nHintPosition)) or
			 ((m_nCurrentCodeAttr  = 2) and (CompareStr (strExCodeSelect, m_strHintPosition) <> 0))) then
		begin
			m_nHintPosition		:= nExCodeSelect;
			m_strHintPosition	:= strExCodeSelect;

			StdCmnGridTotal.Hint		:= '';
			StdCmnGridTotal.ShowHint	:= FALSE;

			Exit;
		end;

		if	(StdCmnGridTotal.ShowHint and
			 (((m_nCurrentCodeAttr <= 1) and (nExCodeSelect = m_nHintPosition)) or
			  ((m_nCurrentCodeAttr  = 2) and (CompareStr (strExCodeSelect, m_strHintPosition) = 0)))) then
			Exit;

		if	(VarIsNull (TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5])) then
			Exit;

		if	(TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5] <> '') then
		begin
			StdCmnGridTotal.Hint		:= TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5];
			StdCmnGridTotal.ShowHint	:= TRUE;
		end;
	end
	else
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		StdCmnGridTotal.Hint		:= '';
		StdCmnGridTotal.ShowHint	:= FALSE;
	end;
end;





{<061>-st
//***********************************************************************************************************/
//***********************************************************************************************************/


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnChangeConditionGridExist (strExCode: String);
var
		dqMasterData: TMQuery;

begin


end;

<061>-end}
//******************************************************************************
//	チェック処理	//HIS0014
//******************************************************************************
function TJNTCRP016000f.fnCheckTreeViewDropItem(cNodeDst: TTreeNode;
            strExNCode: Extended; nDivisionSrc: Integer): Boolean;
var
	dqMasterData: TMQuery;
	stRecDst	: ^TreeViewRec;
begin
	stRecDst	:= cNodeDst.Data;

//	if (stRecDst^.nDivision = 0) then
	if (DIVISION_GENERAL = stRecDst^.nDivision) or (stRecDst^.nDivision = 0) then	//HIS0018
		stRecDst	:= cNodeDst.Parent.Data;


	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close;

		SQL.Clear;
            SQL.Add ('SELECT MasterKbn FROM HojyoTree    ');
			SQL.Add ('WHERE  MasterKbn  = :nMasterDivision  ');
			SQL.Add ('  AND  SumNCode   = :strSumCode       ');
            SQL.Add ('  AND  BasedNCode = :strBasedCode     ');

			ParamByName('nMasterDivision').AsInteger	:=	m_nCurrentMasterDiv;
			ParamByName('strSumCode').AsFloat 			:= 	stRecDst.strExNCode;
			ParamByName('strBasedCode').AsFloat 		:= 	strExNCode;
		Open;

		if not Eof then
		begin
			Close;
			Free;

			Result	:= FALSE;
			Exit;
		end;
	end;

	dqMasterData.Close;
	dqMasterData.Free;

	Result	:= TRUE;
end;

//******************************************************************************
//	HIS0022
//******************************************************************************


//******************************************************************************
//	HIS0022
//******************************************************************************

procedure TJNTCRP016000f.DtlCmnButtonUpdateEnter(Sender: TObject);
begin
	if	(not fnCheckDtlExCodeValid ()) then
		Abort;
end;


//***********************************************************************************************************
//*
//*	関数	: TJNTCRP016000f.DtlCmnEditExCodeNumericArrowClick														　　
//*
//*	目的	: 共通補助登録処理　詳細画面でのコードを検索エクスプローラで表示　HIS0032
//*
//*	戻り値	: なし,
//*
//***********************************************************************************************************
procedure TJNTCRP016000f.DtlCmnEditExCodeNumericArrowClick(Sender: TObject);
{
var
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
	sSQL		: String;
}
begin
{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init(pointer(m_pRec));


	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';									// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
    cMasWndParam.m_RenCharFD	:= 'Renso';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';							// 簡略名称  ﾌｨｰﾙﾄﾞ名
    cMasWndParam.m_TableName	:= 'HojyoMA';								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_pApRec		:= pointer( m_pRec );						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCurrentCodeDigit;						// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCurrentCodeAttr;						// ｺｰﾄﾞ属性

	sSQL	:= sSQL + 'MasterKbn = ' + IntToStr(m_nCurrentMasterDiv);
    sSQL	:= sSQL + 'and RDelKbn = 0 ';

	if DtlCmnTab.Items[0].Selected then
		sSQL	:= sSQL + 'and SumKbn = 0 '
	else
		sSQL	:= sSQL + 'and SumKbn = 1';

	cMasWndParam.m_SQL_Where	:= sSQL;									// Where句の条件

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			DtlCmnEditExCodeNumeric.Value	:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode))
		else
			DtlCmnEditExCodeFree   .Text	:= cMasWndParam.m_ExpRetCode;

		MjsDispCtrl.MjsNextCtrl (Self);
	end;

	cMasWndParam.Free ();
	cMasWndIF	.Term ();
	cMasWndIF	.Free ();
}
end;


function TJNTCRP016000f.MakeDspString(CODE: String; NAME: String): String;
var
	sWork		:	String;
	sWork2		:	String;
	iCnt		:	Integer;
begin
    //	初期処理
	sWork	:=	'';
	sWork2	:=	'';
//	iCnt	:=	0;

	sWork	:=	CODE;
	iCnt	:=	m_nCurrentCodeDigit - Length(sWork);
	sWork2	:=	StringOfChar(' ', iCnt);

    if m_nCurrentCodeAttr <= 1 then
    	sWork	:=	sWork2 + sWork
    else
       	sWork	:=	sWork  + sWork2;

	Result	:=	sWork + ' ' + NAME;
end;








//**********************************************************************
//*		Proccess	:	検索
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/24
//*		Parameter	:   Nothing
//*		Return		:	Nothing
//**********************************************************************
procedure TJNTCRP016000f.fnSearch;
begin

	if fnDownSearch() = TRUE then
	begin
		if m_SearchInfo.bFstFlg = FALSE then
		begin
			m_SearchInfo.iStItem := CmnInstructionCombo.ItemIndex;
			m_SearchInfo.bFstFlg := TRUE;
		end;
		exit;
	end;

	while TRUE do
	begin
		// 1件も一致しなかった時
		if (m_SearchInfo.bFstFlg = FALSE) then
			break;

		// 最後まで検索した時
		if (m_SearchInfo.bFstFlg = TRUE) then
		begin
    		m_cComArea.m_MsgStd.GetMsg( m_MjsMsgRec, 30,32 );
	    	MjsMessageBoxEx(AOwner, // <009>
                            m_MjsMsgRec.sMsg,
                            m_MjsMsgRec.sTitle,
                            m_MjsMsgRec.icontype,
                            m_MjsMsgRec.btntype,
                            m_MjsMsgRec.btndef,
                            m_MjsMsgRec.LogType
                           );
			break;
		end;
	end;

end;

//**********************************************************************
//*		Proccess	:	検索処理
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/24
//*		Parameter	:	Nothing
//*		Return		:	一致(TRUE)/不一致(FALSE)
//**********************************************************************
function TJNTCRP016000f.fnDownSearch: Boolean;
var
	wkRec	: ^TreeViewRec;
	i		: Integer;
begin
	Result := FALSE;
	for i:=m_SearchInfo.iItem to CmnTreeView.Items.Count-1 do
    begin
        wkRec   := CmnTreeView.Items[i].Data;

		if (wkRec.strExCode = m_SearchInfo.sHojCD) then
		begin
			CmnTreeView.Items[i].Selected := TRUE;
			m_SearchInfo.iItem := i+1;
			Result := TRUE;
			break;
		end
	end;
end;


procedure TJNTCRP016000f.CmnTreeViewExit(Sender: TObject);
begin
	m_SearchInfo.sHojCD := '';													//2004/06/24
end;


//**********************************************************************
//*		Proccess	:   削除ボタンがマウスで押された時
//*		Name		:	Y.Ichihashi
//*		Date		:	2004/09/02
//*		Parameter	:	Nothing
//*		                HIS0046
//**********************************************************************
procedure TJNTCRP016000f.CmnToolbarButtonDeleteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	m_fSystemClear	:= FALSE;

	if	(ssShift in Shift) then
		m_fSystemClear	:= TRUE;
end;

//**********************************************************************
//*		Proccess	:   HojyoTree,HojyoTree2のデータがおかしくなっているのでデータを削除する
//*		Name		:	Y.Ichihashi
//*		Date		:	2004/09/02
//*		Parameter	:	Nothing
//*		                HIS0046
//**********************************************************************
function TJNTCRP016000f.fnClearAllSystems: Boolean;
var
	dqMasterTree: TMQuery;

begin
{
	if	(TMJSExceptDbmF (m_pRec^.m_pExpModule^).SetExcept (ueCop, m_pRec^.m_iSystemCode,
			m_pRec^.m_iOptionCode, m_pRec^.m_iCorpCode, m_pRec^.m_iCorpSubCode, m_pRec^.m_iProgramCode, 0) <> 0) then
	begin
		Beep ();

		MJSMessageBoxEx (AOwner,    // <009>
                         '会社単独処理の設定を行うことができませんでした。',
                         m_pRec^.m_ProgramName,
                         mjError,
                         mjOk,
                         mjDefOk,
                         FALSE
                        );

		Result	:= FALSE;
		Exit;
	end;
}
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterTree	:= TMQuery.Create (Self);									        // MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('DELETE FROM HojyoTree                  '
            +   'WHERE MasterKbn = :nMasterDivision     ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		if	( not ExecSQL () ) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree .Close    ();
			dqMasterTree .Free     ();

			Result	:= FALSE;
			Exit;
    end;

		Close ();
		SQL.Clear();
		SQL.Add  ('DELETE FROM HojyoTree2 WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		if	(not ExecSQL ()) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterTree);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree .Close    ();
			dqMasterTree .Free     ();

			Result	:= FALSE;
            Exit;
		end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - 21]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - 21]	:= 1;

	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

//	TMJSExceptDbmF (m_pRec^.m_pExpModule^).ResetExcept (ueCop, m_pRec^.m_iSystemCode,
//			  	m_pRec^.m_iOptionCode, m_pRec^.m_iCorpCode, m_pRec^.m_iCorpSubCode, m_pRec^.m_iProgramCode, 0);

	Result	:= TRUE;
end;


// -----------------------------------------------------------------------------
//
//  関数：gfnGetExNCode HIS0047
//  内容：各種テーブルの内部コードＭＡＸ値を取得
//
//  PARAM
//      TblName     :   テーブル名
//  VAR
//      ExNCode     :   内部コード
//  RESULT
//      なし
//
//  補足：
// -----------------------------------------------------------------------------
procedure  TJNTCRP016000f.gfnGetExNCode(nTblName:String; var nExNCode : Extended);
var
    dqMasterNCode   : TMQuery;

begin

    dqMasterNCode	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterNCode);				// DBとMQueryの接続

    if ( nTblName = '' ) then Exit;

    with dqMasterNCode do
    begin
        Close ();
        SQL.Clear ();
        SQL.Add ('SELECT NCode FROM ' + nTblName +
                 ' ORDER BY NCode DESC          ');

        Open ();

        if ( not EOF ) then
                nExNCode := FieldByName('NCode').AsFloat + 1
        else    nExNCode := 1;

        Close ();
    end;

    dqMasterNCode.Free ();

end;

// -----------------------------------------------------------------------------
//
//  関数：gfnSetExNCode HIS0047
//  内容：各種テーブルの該当レコードの内部コードを取得
//
//  PARAM
//      nTblName    :   テーブル名
//      nGCode      :   外部コード
//  VAR
//      ExNCode     :   内部コード
//  RESULT
//      なし
//
//  補足：
// -----------------------------------------------------------------------------
procedure  TJNTCRP016000f.gfnSetExNCode(nTblName,nGCode:String; var nExNCode : Extended);
var
    dqMasterNCode   : TMQuery;

begin

    nExNCode := 0;  // 初期値の設定<042>

    dqMasterNCode	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterNCode);				// DBとMQueryの接続

    if ( nTblName = '' ) then Exit;

    with dqMasterNCode do
    begin
        Close ();
        SQL.Clear ();
        SQL.Add ('SELECT NCode FROM '  + nTblName +
                 ' WHERE GCODE = :GCODE ' +
                 '  AND MasterKbn = '  + IntToStr(m_nCurrentMasterDiv) +
                 '  AND RDelKbn   = 0 ');
        ParamByName('GCODE').AsString   :=  nGCode;

        Open ();

        if ( not EOF ) then
                nExNCode := FieldByName('NCode').AsFloat;

        Close ();
    end;

    dqMasterNCode.Free ();

end;

procedure	TJNTCRP016000f.fnDtlCommonFunctionOnEnter (Sender: TObject);
begin
	if	(not fnCheckDtlExCodeValid ()) then
		Abort;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnCommonFunctionOnKeyDown02 (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 補助登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	(Key = VK_RETURN) then
		MjsDispCtrl.MjsNextCtrl (Self)
	// <023> -->
	else if	(Key = VK_ESCAPE) then
	begin
		if ( m_nCurrentCodeAttr <= 1 ) then
            // 数値属性
			DtlCmnEditExCodeNumeric.SetFocus()
		else
            // ﾌﾘｰ属性
			DtlCmnEditExCodeFree.SetFocus();

		Exit;
	end
	else if	(Key = VK_END) then
	begin
		DtlCmnButtonUpdate.SetFocus ();

		Exit;
	end
	// <023> <--

//	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	else if (Key = VK_LEFT) or (Key = VK_UP) or
           ((Key = VK_TAB) and (Shift = [ssShift])) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
//			if	(MJSChkCurTop (Sender as TComponent)) then
//				MJSDispCtrl.MjsPrevCtrl (Self);

            if DtlCmnEditAssociation.Focused = TRUE then
            begin
                if (MJSChkCurTop (Sender as TComponent)) then
                begin
                    if (m_nCurrentCodeAttr <= 1) then
                    	DtlCmnEditExCodeNumeric.SetFocus
		        	else
             	        DtlCmnEditExCodeFree.SetFocus;
                end;
            end
            else
            begin
                if (MJSChkCurTop (Sender as TComponent)) then
    				MJSDispCtrl.MjsPrevCtrl (Self);
            end;
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;

//	abort;		HIS0034
end;





// ************************************************************************** //
//                                                                            //
//      以下は付箋機能に関する処理です。                                      //
//                                                                            //
// ************************************************************************** //


//-----------------------------------------------------------------------------
// fnGetTagColorBitmap()
//	<  >
//      PARAM   : nTagColor
//      VAR     :
//      RETURN  : TBitmap
//      MEMO    : ﾏｽﾀ付箋管理情報取得
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnGetTagColorBitmap (nTagColor: Integer): TBitmap;
var
	bmpTagColor :   TBitmap;
begin

	bmpTagColor := nil;
    DtlCmnImgFusen.Picture  :=  nil;    // <001>

	case (nTagColor) of
		1:
        begin
// <022>            bmpTagColor	:= CmnTreeViewPopupMenuTag01.Bitmap;
            bmpTagColor :=  Image_Fusen_Red.Picture.Bitmap;     // <022>
            DtlCmnImgFusen.Picture	            := TPicture (CmnTreeViewPopupMenuTag01.Bitmap);  // <001>
            DtlCmnImgFusen.Picture	            := TPicture (DtlCmnPopupMenuTag01.Bitmap);       // <001>
        end;
		2:
        begin
// <022>           bmpTagColor	:= CmnTreeViewPopupMenuTag03.Bitmap;
            bmpTagColor :=  Image_Fusen_Green.Picture.Bitmap;   // <022>
            DtlCmnImgFusen.Picture	            := TPicture (CmnTreeViewPopupMenuTag03.Bitmap);  // <001>
            DtlCmnImgFusen.Picture	            := TPicture (DtlCmnPopupMenuTag03.Bitmap);       // <001>
        end;
        3:
        begin
// <022>           bmpTagColor	:= CmnTreeViewPopupMenuTag02.Bitmap;
            bmpTagColor :=  Image_Fusen_Blue.Picture.Bitmap;    // <022>
            DtlCmnImgFusen.Picture	            := TPicture (CmnTreeViewPopupMenuTag02.Bitmap);  // <001>
            DtlCmnImgFusen.Picture	            := TPicture (DtlCmnPopupMenuTag02.Bitmap);       // <001>
        end;
		4:
        begin
// <022>           bmpTagColor	:= CmnTreeViewPopupMenuTag04.Bitmap;
            bmpTagColor :=  Image_Fusen_Orange.Picture.Bitmap;  // <022>
            DtlCmnImgFusen.Picture	            := TPicture (CmnTreeViewPopupMenuTag04.Bitmap);  // <001>
            DtlCmnImgFusen.Picture	            := TPicture (DtlCmnPopupMenuTag04.Bitmap);       // <001>
        end;
	end;

    // <001>
    if ( DtlCmnImgFusen.Picture = nil ) then
        DtlCmnImgFusen.Visible  :=  FALSE
    else
        DtlCmnImgFusen.Visible  :=  TRUE;

	Result	:= bmpTagColor;

end;

//-----------------------------------------------------------------------------
// fnCheckMasterDataTagInfo()
//	<  >
//      PARAM   : strExNCode : 補助内部ｺｰﾄﾞ
//                pTagInfo   : 付箋区分 (array [1..4] of TagInfo)
//      VAR     :
//      RETURN  :
//      MEMO    : ﾏｽﾀ付箋管理情報ﾁｪｯｸ
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCheckMasterDataTagInfo (strExNCode: Extended; var pTagInfo: array of TagInfo);
var
    dqMasterData    :   TMQuery;
    nCount          :   Integer;
begin

    for nCount := 0 to 3 do
	begin
		pTagInfo [nCount].fChecked		:= FALSE;								// 付箋区分初期化
		pTagInfo [nCount].strComment	:= '';									// 付箋ｺﾒﾝﾄ初期化
	end;

	dqMasterData    := TMQuery.Create (Self);

    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
        Close();
		SQL.Clear();
        SQL.Add('SELECT FusenKbn, FusenCmnt FROM MFusenInfo '
            +   'WHERE MasterKbn = :nMasterDivision         '
            +   '  AND NCode = :strExCode                   '
            +   'ORDER BY FusenKbn                          ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat     := strExNCode;
		Open();

		while ( not EOF ) do
		begin
			pTagInfo [FieldByName ('FusenKbn').AsInteger - 1].fChecked		:= TRUE;
			pTagInfo [FieldByName ('FusenKbn').AsInteger - 1].strComment	:= FieldByName ('FusenCmnt').AsString;

            NEXT;
        end;

		Close();
    end;

	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagRedOnClick()
//	< PopupMenuOnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(赤)]
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuTagRedOnClick (Sender: TObject);
var
    cNode       :   TTreeNode;
    stWorkRec   :   ^TreeViewRec;
	nTagKind    :   Integer;
begin

    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

	if	(( stWorkRec^.nDivision = 0 )                 or
         ( stWorkRec^.nDivision = DIVISION_GENERAL )) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 1;

    if	( fnUpdateMasterDataTagInfo (stWorkRec^.strExNCode, nTagKind) ) then
		    nTagKind	:= nTagKind
	else    nTagKind	:= 0;

    fnUpdateGridMemDataRecord (stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagGreenOnClick()
//	< PopupMenuOnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(緑)]
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuTagGreenOnClick (Sender: TObject);
var
    cNode       :   TTreeNode;
    stWorkRec   :   ^TreeViewRec;
	nTagKind    :   Integer;
begin

    cNode       :=  m_cNodeRightClick;
    stWorkRec   :=  cNode.Data;

	if	(( stWorkRec^.nDivision = 0 )                 or
         ( stWorkRec^.nDivision = DIVISION_GENERAL )) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 2;

    if	( fnUpdateMasterDataTagInfo (stWorkRec^.strExNCode, nTagKind) ) then
		    nTagKind	:= nTagKind
	else    nTagKind	:= 0;

	fnUpdateGridMemDataRecord (stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagBlueOnClick()
//	< PopupMenuOnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(青)]
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuTagBlueOnClick (Sender: TObject);
var
    cNode       :   TTreeNode;
    stWorkRec   :   ^TreeViewRec;
	nTagKind    :   Integer;
begin

	cNode       :=  m_cNodeRightClick;
	stWorkRec   :=  cNode.Data;

	if	(( stWorkRec^.nDivision = 0 )                 or
         ( stWorkRec^.nDivision = DIVISION_GENERAL )) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 3;

    if	( fnUpdateMasterDataTagInfo (stWorkRec^.strExNCode, nTagKind) ) then
		    nTagKind	:= nTagKind
	else    nTagKind	:= 0;

	fnUpdateGridMemDataRecord (stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagOrangeOnClick()
//	< PopupMenuOnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(橙)]
//-----------------------------------------------------------------------------
procedure   TJNTCRP016000f.fnCmnTreeViewPopupMenuTagOrangeOnClick (Sender: TObject);
var
    cNode       :   TTreeNode;
    stWorkRec   :   ^TreeViewRec;
	nTagKind    :   Integer;
begin

    cNode       :=  m_cNodeRightClick;
    stWorkRec   :=  cNode.Data;

	if	(( stWorkRec^.nDivision = 0 )                 or
         ( stWorkRec^.nDivision = DIVISION_GENERAL )) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 4;

    if	( fnUpdateMasterDataTagInfo (stWorkRec^.strExNCode, nTagKind) ) then
		    nTagKind	:= nTagKind
	else    nTagKind	:= 0;

	fnUpdateGridMemDataRecord (stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);

end;

//-----------------------------------------------------------------------------
// fnCmnToolbarButtonTagOnClick()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ [付箋] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnToolbarButtonTagOnClick (Sender: TObject);
var
	stItemRec	    :   ^TreeViewRec;
	nTagKindWork    :   Integer;
begin

	nTagKindWork    :=  0;

	case (CmnToolbarButtonTag.ImageIndex) of
		0:	nTagKindWork	:= 1;
		1:	nTagKindWork	:= 3;
		2:	nTagKindWork	:= 2;
		3:	nTagKindWork	:= 4;
	end;

    // 詳細画面表示中
	if	( DtlCmnClientPanel.Visible ) then
	begin
		if	( m_nSelectTagKind = nTagKindWork ) then
			nTagKindWork	:= 0;

		case (nTagKindWork) of
            0:  DtlCmnImgFusen.Picture	:= nil;                                     // <001>
			1:  DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);  // <001>
			2:  DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);  // <001>
			3:  DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);  // <001>
			4:  DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);  // <001>
        end;
        DtlCmnImgFusen.Visible  :=  TRUE;   // <001>

		fnCommonFunctionDetailsOnChange (Sender);

        fnSetGridTagInfo (nTagKindWork);    // <001>

		m_nSelectTagKind	:= nTagKindWork;
	end
	else if	(( Screen.ActiveControl.Name = StdCmnGridExist.Name ) or			// 実在補助ｸﾞﾘｯﾄﾞ
			 ( Screen.ActiveControl.Name = StdCmnGridTotal.Name )) then			// 合計補助ｸﾞﾘｯﾄﾞ
			fnSetGridTagInfo (nTagKindWork)
	else if	 ( Screen.ActiveControl.Name = CmnTreeView.Name ) then				// ﾂﾘｰﾋﾞｭｰ
	begin
		stItemRec	:= CmnTreeView.Selected.Data;

        fnUpdateMasterDataTagInfo (stItemRec^.strExNCode, nTagKindWork);
		fnUpdateGridMemDataRecord (stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);
	end;

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagOnClick()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnTreeViewPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	    :   TMenuItem;
	stItemRec	    :   ^TreeViewRec;
	nTagKindWork    :   Integer;
begin

	stItemRec   :=  m_cNodeRightClick.Data;

	if	(( stItemRec^.nDivision = 0 )                 or
         ( stItemRec^.nDivision = DIVISION_GENERAL )) then
		m_cNodeRightClick.Selected	:= TRUE;

	cMenuItem	:= Sender as TMenuItem;

	if	( cMenuItem.Name = CmnTreeViewPopupMenuTagOff.Name ) then
		nTagKindWork	:= 0
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag01.Name ) then
		nTagKindWork	:= 1
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag02.Name ) then
		nTagKindWork	:= 3
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag03.Name ) then
		nTagKindWork	:= 2
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag04.Name ) then
		nTagKindWork	:= 4
	else
		nTagKindWork	:= 0;

    fnUpdateMasterDataTagInfo (stItemRec^.strExNCode, nTagKindWork);
	fnUpdateGridMemDataRecord (stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);

end;

//-----------------------------------------------------------------------------
// fnCmnTreeViewPopupMenuTagOnClickEx()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnCmnTreeViewPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData    :   TMQuery;
	cMasDlgParam    :   TJNTMasDLGParam;
	cMasDlgIF	    :   TJNTMASFUSENBIKODLGIF;
	cMenuItem	    :   TMenuItem;
	cMemData	    :   TdxMemData;
	stItemRec	    :   ^TreeViewRec;
	nCount		    :   Integer;
	nTagKindWork    :   Integer;
	fIgnore		    :   Boolean;
begin

	cMenuItem		:=  Sender as TMenuItem;
	nTagKindWork	:=  0;
	fIgnore			:=  FALSE;

	if	( cMenuItem.Name = CmnTreeViewPopupMenuTagComment.Name ) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	( not TMenuItem (MJSFindCtrl (Self, Format ('CmnTreeViewPopupMenuTag%.2d', [nCount]))).Visible ) then
			begin
				case (nCount) of
					1:	nTagKindWork	:= 1;
					2:	nTagKindWork	:= 3;
					3:	nTagKindWork	:= 2;
					4:	nTagKindWork	:= 4;
				end;
			end;
		end;

		fIgnore	:= TRUE;
	end
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag01Ex.Name ) then
		nTagKindWork	:= 1
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag02Ex.Name ) then
		nTagKindWork	:= 3
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag03Ex.Name ) then
		nTagKindWork	:= 2
	else if	( cMenuItem.Name = CmnTreeViewPopupMenuItemTag04Ex.Name ) then
		nTagKindWork	:= 4
	else
		Exit;

	stItemRec	:= m_cNodeRightClick.Data;

	if	( not fIgnore ) then
	begin
        fnUpdateMasterDataTagInfo (stItemRec^.strExNCode, nTagKindWork);
		fnUpdateGridMemDataRecord (stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);
	end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (TForm(m_pRec^.m_pOwnerForm^), Pointer (m_pRec));    // <006>

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;							// ﾏｽﾀ区分
	cMasDlgParam.m_iNCode		:= stItemRec^.strExNCode;						// 補助内部ｺｰﾄﾞ
	cMasDlgParam.m_iSubNCode	:= 0;											// 科目別補助内部ｺｰﾄﾞ
	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;								// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);							// TMjsAppRecord

	if	( cMasDlgIF.DoDlg (cMasDlgParam) = mrOK ) then							// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);				// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close();
			SQL.Clear();
            SQL.Add('SELECT FusenCmnt FROM MFusenInfo   '
			    +   'WHERE MasterKbn = :nMasterDivision '
                +   '  AND NCode = :strExCode           ');

			ParamByName ('nMasterDivision').AsInteger	:= cMasDlgParam.m_iMasterkbn;
			ParamByName ('strExCode'      ).AsFloat	    := cMasDlgParam.m_iNCode;

			Open();

			if	(( stItemRec^.nDivision = 0 )                 or
                 ( stItemRec^.nDivision = DIVISION_GENERAL )) then
    				cMemData	:= StdCmnMemDataExist
			else    cMemData	:= StdCmnMemDataTotal;

			if	( not (StdCmnClientPanel.Visible    and
                       StdCmnTab.Items [0].Selected and
                    (( stItemRec^.nDivision = 0 ) or
                     ( stItemRec^.nDivision = DIVISION_GENERAL )))) then
			begin
				cMemData.First ();

				while (not cMemData.Eof) do
				begin
//					if	( CompareStr (cMasDlgParam.m_sHojyoCode,
//									 cMemData.FieldByName ('strExCode').AsString) = 0 ) then
					if	( cMasDlgParam.m_iNCode =
									 cMemData.FieldByName ('strExNCode').AsFloat ) then
						Exit;

					cMemData.Next ();
				end;
			end;

			cMemData.Edit ();

			if	( not EOF ) then
				cMemData.FieldByName ('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				cMemData.FieldByName ('strComment').AsString	:= '';

			cMemData.Post ();
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();

end;

//-----------------------------------------------------------------------------
// fnStdCmnGridPopupMenuTagOnClick()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnStdCmnGridPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem   :   TMenuItem;
	nTagKind    :   Integer;
begin

	cMenuItem	:= Sender as TMenuItem;

	if	( cMenuItem.Name = StdCmnGridPopupMenuTagOff.Name ) then
		nTagKind	:= 0
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag01.Name ) then
		nTagKind	:= 1
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag02.Name ) then
		nTagKind	:= 3
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag03.Name ) then
		nTagKind	:= 2
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag04.Name ) then
		nTagKind	:= 4
	else
		nTagKind	:= 0;

	fnSetGridTagInfo (nTagKind);

    // <001>
    if ( nTagKind = 0 ) then
        DtlCmnImgFusen.Picture	:= nil;

end;

//-----------------------------------------------------------------------------
// fnStdCmnGridPopupMenuTagOnClickEx()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnStdCmnGridPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData    :   TMQuery;
	cMasDlgParam    :   TJNTMasDLGParam;
	cMasDlgIF	    :   TJNTMASFUSENBIKODLGIF;
	cMenuItem	    :   TMenuItem;
	cMemData	    :   TdxMemData;
	nCount		    :   Integer;
	nTagKindWork    :   Integer;
	fIgnore		    :   Boolean;
begin

	cMenuItem		:=  Sender as TMenuItem;
	nTagKindWork	:=  0;
	fIgnore			:=  FALSE;

	if	( cMenuItem.Name = StdCmnGridPopupMenuTagComment.Name ) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	( not TMenuItem (MJSFindCtrl (Self, Format ('StdCmnGridPopupMenuTag%.2d', [nCount]))).Visible ) then
			begin
				case (nCount) of
					1:	nTagKindWork	:= 1;
					2:	nTagKindWork	:= 3;
					3:	nTagKindWork	:= 2;
					4:	nTagKindWork	:= 4;
				end;
			end;
		end;

		fIgnore	:= TRUE;
	end
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag01Ex.Name ) then
		nTagKindWork	:= 1
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag02Ex.Name ) then
		nTagKindWork	:= 3
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag03Ex.Name ) then
		nTagKindWork	:= 2
	else if	( cMenuItem.Name = StdCmnGridPopupMenuItemTag04Ex.Name ) then
		nTagKindWork	:= 4
	else
		Exit;

	if	( not fIgnore ) then
		fnSetGridTagInfo (nTagKindWork);

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (TForm(m_pRec^.m_pOwnerForm^), Pointer (m_pRec));    // <006>

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;							// ﾏｽﾀ区分
	cMasDlgParam.m_iNCode		:= 0;											// 科目ｺｰﾄﾞ

    // 実在ｸﾞﾘｯﾄﾞ
	if	( StdCmnTab.Items [0].Selected ) then
	begin

        cMasDlgParam.m_iNCode   :=  StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat;  // 補助内部ｺｰﾄﾞ
(*
		if  ( m_nCurrentCodeAttr <= 1 ) then
		begin
			if	( StdCmnMemDataExist.FieldByName ('strExCode').AsString <> '' ) then
				cMasDlgParam.m_sHojyoCode	:= Format (
							'%.10d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
		end
		else
			cMasDlgParam.m_sHojyoCode	:= StdCmnMemDataExist.FieldByName ('strExCode').AsString;
*)
	end
    // 合計ｸﾞﾘｯﾄﾞ
	else
	begin
        cMasDlgParam.m_iNCode   :=  StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat;  // 補助内部ｺｰﾄﾞ
(*
		if  ( m_nCurrentCodeAttr <= 1 ) then
		begin
			cMasDlgParam.m_sHojyoCode	:= Format (
							'%.10d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
		end
		else
			cMasDlgParam.m_sHojyoCode	:= StdCmnMemDataTotal.FieldByName ('strExCode').AsString;
*)
	end;

	cMasDlgParam.m_iSubNCode	:= 0;											// 科目別補助内部ｺｰﾄﾞ
	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;								// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);							// TMjsAppRecord

	if	( cMasDlgIF.DoDlg (cMasDlgParam) = mrOK ) then							// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);				// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close();
			SQL.Clear();
            SQL.Add('SELECT FusenCmnt FROM MFusenInfo   '
			    +   'WHERE MasterKbn = :nMasterDivision '
                +   '  AND NCode     = :strExCode       ');

			ParamByName ('nMasterDivision').AsInteger	:= cMasDlgParam.m_iMasterkbn;
			ParamByName ('strExCode'      ).AsFloat  	:= cMasDlgParam.m_iNCode;
			Open();

			if	( StdCmnTab.Items [0].Selected ) then
    				cMemData	:= StdCmnMemDataExist
			else    cMemData	:= StdCmnMemDataTotal;

			cMemData.Edit ();

			if	( not EOF ) then
				cMemData.FieldByName ('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				cMemData.FieldByName ('strComment').AsString	:= '';

			cMemData.Post ();
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();

end;

//-----------------------------------------------------------------------------
// fnDtlCmnPopupMenuTagOnClick()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細画面･付箋] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnDtlCmnPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	    :   TMenuItem;
	nTagKindWork    :   Integer;
begin

	cMenuItem	:= Sender as TMenuItem;

	if	( cMenuItem.Name = DtlCmnPopupMenuTagOff.Name ) then
		nTagKindWork	:= 0
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag01.Name ) then
		nTagKindWork	:= 1
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag02.Name ) then
		nTagKindWork	:= 3
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag03.Name ) then
		nTagKindWork	:= 2
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag04.Name ) then
		nTagKindWork	:= 4
	else
		nTagKindWork	:= 0;

    //<001>
	case (nTagKindWork) of
		0:	DtlCmnImgFusen.Picture	:= nil;
		1:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		2:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
		3:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
		4:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	end;

	if	( nTagKindWork <> m_nSelectTagKind ) then
		fnCommonFunctionDetailsOnChange (Sender);

	m_nSelectTagKind	:= nTagKindWork;

end;

//-----------------------------------------------------------------------------
// fnDtlCmnPopupMenuTagOnClickEx()
//	< OnClick >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細画面･付箋] OnClick
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnDtlCmnPopupMenuTagOnClickEx (Sender: TObject);

var
	cMasDlgParam    :   TJNTMasDLGParam;
	cMasDlgIF	    :   TJNTMASFUSENBIKODLGIF;
	cMenuItem	    :   TMenuItem;
	nTagKindWork    :   Integer;
	fIgnore		    :   Boolean;
    nExNCode        :   Extended;
    nDivision       :   Integer;
begin

	cMenuItem	:=  Sender as TMenuItem;
	fIgnore		:=  FALSE;
    nExNCode    :=  0;

	if	( cMenuItem.Name = DtlCmnPopupMenuTagComment.Name ) then
	begin
		nTagKindWork	:= m_nSelectTagKind;
		fIgnore			:= TRUE;
	end
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag01Ex.Name ) then
		nTagKindWork	:= 1
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag02Ex.Name ) then
		nTagKindWork	:= 3
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag03Ex.Name ) then
		nTagKindWork	:= 2
	else if	( cMenuItem.Name = DtlCmnPopupMenuItemTag04Ex.Name ) then
		nTagKindWork	:= 4
	else
		Exit;

    // <001>
    if	( not fIgnore ) then
	begin
		case (nTagKindWork) of
			0:	DtlCmnImgFusen.Picture	:= nil;
			1:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			2:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
			3:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
			4:	DtlCmnImgFusen.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		end;
	end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (TForm(m_pRec^.m_pOwnerForm^), Pointer (m_pRec));    // <006>

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;							// ﾏｽﾀ区分

	if	( m_nCurrentCodeAttr <= 1 ) then										// ｺｰﾄﾞ属性: 数字
        gfnGetNCode(m_nCurrentMasterDiv,
                    Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]),
                    nExNCode,
                    nDivision)
	else																		// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);

        gfnGetNCode(m_nCurrentMasterDiv,
                    DtlCmnEditExCodeFree.Text,
                    nExNCode,
                    nDivision);
	end;

    cMasDlgParam.m_iNCode       := nExNCode;                                    // 補助内部ｺｰﾄﾞ
	cMasDlgParam.m_iSubNCode	:= 0;											// 科目別補助内部ｺｰﾄﾞ
	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;								// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);							// TMjsAppRecord

	cMasDlgIF.DoDlg (cMasDlgParam);												// 付箋備考ﾀﾞｲｱﾛｸﾞ表示

	if	( not fIgnore ) then
	begin
		if	( nTagKindWork <> m_nSelectTagKind ) then
			fnCommonFunctionDetailsOnChange (Sender);

		m_nSelectTagKind	:= nTagKindWork;
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();

end;

//-----------------------------------------------------------------------------
// fnGetMasterDataTagInfo()
//	< OnClick >
//      PARAM   : strExNCode :  補助内部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : Integer, (付箋№)
//      MEMO    : ﾏｽﾀ付箋管理情報取得
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnGetMasterDataTagInfo (strExNCode: Extended): Integer;
var
	dqMasterData    :   TMQuery;
	nTagDivision    :   Integer;
begin

	dqMasterData    := TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	nTagDivision	:= 0;

	with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT FusenKbn FROM MFusenInfo    '
		    +   'WHERE MasterKbn = :nMasterDivision '
            +   '  AND NCode     = :strExCode       ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;
		Open();

		if	( not EOF ) then
			nTagDivision	:= FieldByName ('FusenKbn').AsInteger;
    end;

	dqMasterData.Close();
	dqMasterData.Free();

	Result	:= nTagDivision;

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterDataTagInfo()
//	< OnClick >
//      PARAM   : strExCode : 補助内部ｺｰﾄﾞ
//                nTagKind  : 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)
//      VAR     :
//      RETURN  : Boolean, (TRUE:正常, FALSE:異常)
//      MEMO    : ﾏｽﾀ付箋管理情報更新
//-----------------------------------------------------------------------------
function	TJNTCRP016000f.fnUpdateMasterDataTagInfo (strExNCode: Extended; var nTagKind: Integer): Boolean;
var
	dqMasterData : TMQuery;
begin

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_cDataModule.BeginTran ( m_cDBSelect );

	dqMasterData := TMQuery.Create ( Self );
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('select FusenKbn from MFusenInfo    ');
		SQL.Add('where MasterKbn = :nMasterDivision ');
        SQL.Add('  and NCode     = :strExCode       ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;
		Open();

		if  ( not EOF ) then
		begin
			if	(( nTagKind = 0 ) or
                 ( FieldByName ('FusenKbn').AsInteger = nTagKind )) then
			begin
				nTagKind	:= 0;

				Close();
				SQL.Clear();
                SQL.Add('delete from MFusenInfo             ');
				SQL.Add('where MasterKbn = :nMasterDivision ');
                SQL.Add('  and NCode     = :strExCode       ');
			end
			else
			begin
				Close();
				SQL.Clear();
                SQL.Add('update MFusenInfo set              ');
                SQL.Add('    FusenKbn      = :nTagDivision  ');
                SQL.Add('   ,FusenCmnt     = ''''           ');
                SQL.Add('   ,UpdTantoNCode = :UpdTantoNCode ');
				SQL.Add('where MasterKbn = :nMasterDivision ');
                SQL.Add('  and NCode     = :strExCode       ');

				ParamByName ('nTagDivision' ).AsInteger	 := nTagKind;
                ParamByName ('UpdTantoNCode').AsCurrency := m_TantoNCode;
			end;

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
            ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;

			if	( not ExecSQL () ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				fnOutputDBErrorMessage ();

                // ﾛｰﾙﾊﾞｯｸ(破棄)
				m_cDataModule.Rollback (m_cDBSelect);
				dqMasterData .Close	   ();
				dqMasterData .Free     ();

				Result	:= FALSE;
				Exit;
			end;

            // ｺﾐｯﾄ(反映)
			m_cDataModule.Commit (m_cDBSelect);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= TRUE;
			Exit;
		end;

		Close ();
	end;

	with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.Add('insert into MFusenInfo (   ');
        SQL.Add('    MasterKbn              ');
        SQL.Add('   ,NCode                  ');
        SQL.Add('   ,SubNCode               ');
        SQL.Add('   ,FusenKbn               ');
        SQL.Add('   ,FusenCmnt              ');
        SQL.Add('   ,UpdTantoNCode          ');
		SQL.Add(') VALUES (                 ');
        SQL.Add('    :nMasterDivision       ');
        SQL.Add('   ,:nNCode                ');
        SQL.Add('   ,0                      ');
        SQL.Add('   ,:nTagDivision          ');
        SQL.Add('   ,''''                   ');
        SQL.Add('   ,:UpdTantoNCode         ');
        SQL.Add(')                          ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('nNCode'         ).AsFloat 	:= strExNCode;
		ParamByName ('nTagDivision'   ).AsInteger	:= nTagKind;
        ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;

		if	( not ExecSQL () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();
            // ﾛｰﾙﾊﾞｯｸ(破棄)
			m_cDataModule.Rollback (m_cDBSelect);
			dqMasterData .Close    ();
			dqMasterData .Free	   ();

			Result	:= FALSE;
			Exit;
		end;
	end;

    // ｺﾐｯﾄ(反映)
	m_cDataModule.Commit (m_cDBSelect);
	dqMasterData .Close  ();
	dqMasterData .Free   ();

	Result	:= TRUE;

end;

//-----------------------------------------------------------------------------
// fnUpdateMasterDataTagInfoEx()
//	< OnClick >
//      PARAM   : strExCode     :   補助内部ｺｰﾄﾞ
//                nTagKind      :   付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)
//                strTagComment :   付箋ｺﾒﾝﾄ
//      VAR     :
//      RETURN  : Integer, (付箋№)
//      MEMO    : ﾏｽﾀ付箋管理情報更新
//-----------------------------------------------------------------------------
procedure	TJNTCRP016000f.fnUpdateMasterDataTagInfoEx (strExNCode: Extended; var nTagKind: Integer; strTagComment: String);
var
	dqMasterData    :   TMQuery;
	fNewRecord	    :   Boolean;
begin

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	m_cDataModule.BeginTran (m_cDBSelect);

	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with ( dqMasterData ) do
	begin
		Close();
		SQL.Clear();
        SQL.ADD('SELECT * FROM MFusenInfo           '
            +   'WHERE MasterKbn = :nMasterDivision '
            +   '  AND NCode     = :strExCode       ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;
		Open();

		if  ( not EOF ) then
        begin
			if	(( nTagKind = 0 ) or
                 ( FieldByName ('FusenKbn').AsInteger = nTagKind) ) then
			begin
				nTagKind	:= 0;

		    	Close();
            	SQL.Clear();
                SQL.Add('DELETE FROM MFusenInfo             '
                    +   'WHERE MasterKbn = :nMasterDivision '
                    +   '  AND NCode     = :strExCode       ');

				ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
                ParamByName ('strExCode'      ).AsFloat 	:= strExNCode;

				if	( not ExecSQL () ) then
				begin
					m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

					fnOutputDBErrorMessage ();

                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					m_cDataModule.Rollback (m_cDBSelect);
				end
            	else
                    // 正常 ｺﾐｯﾄ(反映)
                	m_cDataModule.Commit (m_cDBSelect);

				dqMasterData.Close();
				dqMasterData.Free();
            	Exit;
			end
			else
				fNewRecord	:= FALSE;
        end
		else
			fNewRecord	:= TRUE;

		Close();

		if	( nTagKind = 0 ) then
		begin
			dqMasterData.Free();
			Exit;
		end;

		Close();
		SQL.Clear();

		if	( fNewRecord ) then
		begin
            SQL.ADD('INSERT INTO MFusenInfo (   '
                +   '    MasterKbn              '
                +   '   ,NCode                  '
                +   '   ,Subcode                '
                +   '   ,FusenKbn               '
                +   '   ,FusenCmnt              '
                +   '   ,UpdTantoNCode          '
			    +   ') VALUES (                 '
                +   '    :nMasterDivision       '
                +   '   ,:strExCode             '
                +   '   ,0                      '
                +   '   ,:nTagDivision          '
                +   '   ,:strTagComment         '
                +   '   ,:UpdTantoNCode         '
                +   ')                          ');
		end
		else
		begin
            SQL.ADD('UPDATE MFusenInfo SET              '
                +   '    FusenKbn      = :nTagDivision  '
                +   '   ,FusenCmnt     = :strTagComment '
                +   '   ,UpdTantoNCode = :UpdTantoNCode '
			    +   'WHERE MasterKbn = :nMasterDivision '
                +   '  AND NCode     = :strExCode       ');
		end;

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsFloat     := strExNCode;
		ParamByName ('nTagDivision'   ).AsInteger   := nTagKind;
		ParamByName ('strTagComment'  ).AsString	:= strTagComment;
        ParamByName ('UpdTantoNCode'  ).AsCurrency  := m_TantoNCode;

		if	( not ExecSQL() ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_MjsMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage();
            // ﾛｰﾙﾊﾞｯｸ(破棄)
			m_cDataModule.Rollback (m_cDBSelect);
			dqMasterData .Close();
			dqMasterData .Free();
			Exit;
        end;
    end;

    // ｺﾐｯﾄ(反映)
	m_cDataModule.Commit (m_cDBSelect);
	dqMasterData .Close();
	dqMasterData .Free();

end;

//-----------------------------------------------------------------------------
// gfnGetNCode()
//      PARAM   : nMasKbn       :   ﾏｽﾀ区分
//                nExCode       :   補助外部ｺｰﾄﾞ
//      VAR     : nExNCode      :   補助内部ｺｰﾄﾞ
//                nSumKbn       :   実在/合計区分
//      RETURN  :
//      MEMO    : 外部ｺｰﾄﾞより内部ｺｰﾄﾞ,実在/合計区分の取得
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.gfnGetNCode(nMasKbn: Integer; nExCode: String; var nExNCode: Extended; var nSumKbn: Integer);
var
    DmqData :   TMQuery;
begin

    // MQueryの構築
	DmqData    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqData);

    with DmqData do
    begin
        Close();
        SQL.Clear();
        SQL.Add('SELECT NCode, SumKbn FROM HojyoMA  '
            +   'WHERE  MasterKbn = :nMasKbn        '
            +   '  AND  GCode     = :nExCode        '
            +   '  AND  RDelKbn   = 0               ');
        ParamByName('nMasKbn').AsInteger    :=  nMasKbn;
        ParamByName('nExCode').AsString     :=  nExCode;

        Open();
        if ( not EOF ) then
        begin
            nSumKbn     :=  GetFld('SumKbn').AsInteger;
            nExNCode    :=  GetFld('NCode').AsFloat;
        end;

    end;

    DmqData.Close();
    DmqData.Free();

end;

//-----------------------------------------------------------------------------
// gfnGetSegBunGCode()
//      PARAM   : nMasKbn       :   ﾏｽﾀ区分
//              : nExNCode      :   補助内部ｺｰﾄﾞ
//      VAR
//      RETURN  : 補助外部ｺｰﾄﾞ
//      MEMO    : 内部ｺｰﾄﾞより外部ｺｰﾄﾞの取得
//-----------------------------------------------------------------------------
function TJNTCRP016000f.gfnGetSegBunGCode(nMasKbn: Integer; nExNCode: Extended): String;
var
    DmqData:    TMQuery;
begin

    Result  :=   '';

    // MQueryの構築
	DmqData    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqData);

    with DmqData do
    begin
        Close();
        SQL.Clear();

        case nMasKbn of
            // ｾｸﾞﾒﾝﾄ
            MASTER_STSEG..MASTER_EDSEG:
            begin
                SQL.Add('SELECT GCode FROM HojyoMA      '
                    +   'WHERE  MasterKbn = :nMasKbn    '
                    +   '  AND  NCode     = :nExNCode   '
                    +   '  AND  RDelKbn   = 0           ');
                ParamByName('nMasKbn').AsInteger    :=  nMasKbn;
                ParamByName('nExNCode').AsFloat     :=  nExNCode;
            end;
            // 汎用補助分類
            MASTER_STHHJ1BN..MASTER_EDHHJ5BN:
            begin
                SQL.Add('SELECT GCode FROM MMEISHO      '
                    +   'WHERE  SETNM     = :nMasKbn    '
                    +   '  AND  NCode     = :nExNCode   '
                    +   '  AND  RDelKbn   = 0           ');
                ParamByName('nMasKbn').AsInteger    :=  nMasKbn;
                ParamByName('nExNCode').AsFloat     :=  nExNCode;
            end;
        end;

        Open();
        if ( not EOF ) then
            Result  :=  GetFld('GCode').AsString;

    end;

    DmqData.Close();
    DmqData.Free();

end;

//-----------------------------------------------------------------------------
// gfnGetSegBunNCode()
//      PARAM   : nMasKbn       :   ﾏｽﾀ区分
//              : nExNCode      :   補助内部ｺｰﾄﾞ
//      VAR
//      RETURN  : 補助外部ｺｰﾄﾞ
//      MEMO    : 内部ｺｰﾄﾞより外部ｺｰﾄﾞの取得
//-----------------------------------------------------------------------------
function TJNTCRP016000f.gfnGetSegBunNCode(nMasKbn: Integer; nExCode: String; nAttr: Integer): Extended;
var
    DmqData :   TMQuery;
    nGCode  :   String;
begin

    Result  :=  0;
    nGCODE  :=  '';

    // ﾌﾘｰ属性
	if ( nAttr = 2 ) then
        nGCODE  :=  nExCode
    // 数値属性
	else
	begin
		if ( nExCode <> '' ) then
            nGCODE  :=  Format ('%.16d', [StrToInt64 (Trim(nExCode))])
		else
			nGCODE := '';
	end;

    DmqData :=  TMQuery.Create ( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
        with DmqData do
        begin
            Close();
            SQL.Clear();

            case nMasKbn of
                // ｾｸﾞﾒﾝﾄ
                MASTER_STSEG..MASTER_EDSEG:
                begin
                    SQL.Add('SELECT NCode FROM HojyoMA      '
                        +   'WHERE  MasterKbn = :nMasKbn    '
                        +   '  AND  RDelKbn   = 0           '
                        +   '  AND  GCode     = :stGCode    ');

                end;
                // 汎用補助分類
                MASTER_STHHJ1BN..MASTER_EDHHJ5BN:
                begin
                    SQL.Add('SELECT NCODE FROM MMEISHO      '
                        +   'WHERE  SetNM   = :nMasKbn      '
                        +   '  AND  RDelKbn = 0             '
                        +   '  AND  GCode   = :stGCode      ');
                end;
            end;

            SetFld('nMasKbn').AsInteger :=  nMasKbn;
            SetFld('stGCode').AsString  :=  nGCODE;
            Open();

            if not EOF then
                Result  :=  GetFld('NCODE').AsFloat;
        end;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

end;

// ************************************************************************** //
//                                                                            //
//      以下はフリー項目機能に関する処理です。                                //
//                                                                            //
// ************************************************************************** //

//-----------------------------------------------------------------------------
// MSPFunctionBarFunctionClick()
//      PARAM   : Sender        :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//
//      RETURN  :
//      MEMO    : ﾌｧﾝｸｼｮﾝﾎﾞﾀﾝ押下時処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin

    // <002>

//    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
//        m_FncInfo.Action[FuncNo-1].Execute;

    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
    begin
        case FuncNo of
            1:  m_FncInfo.Action[FuncNo-1].Execute;
            8:  Keybd_Event(VK_F8, 0, 0, 0);
        end;
    end;


end;

//-----------------------------------------------------------------------------
// fnSetFncType()
//      PARAM   : nDspType  :   表示識別子
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｧﾝｸｼｮﾝｷｰ/ｲﾍﾞﾝﾄの設定
//-----------------------------------------------------------------------------
(* //<017>
procedure TJNTCRP016000f.fnSetFncType(nDspType: Integer);
begin

    if ( nDspType = 0 ) then
        m_FncInfo.Caption[0] := ''
    else
        m_FncInfo.Caption[0] := 'F1 ﾌﾘｰ項目登録';
    m_FncInfo.Caption[1] := '';
    m_FncInfo.Caption[2] := '';
    m_FncInfo.Caption[3] := '';
    m_FncInfo.Caption[4] := '';
    m_FncInfo.Caption[5] := '';
    m_FncInfo.Caption[6] := '';
    m_FncInfo.Caption[7] := '';

    if ( nDspType = 0 ) then
        m_FncInfo.Action[0]  := nil
    else
        m_FncInfo.Action[0]  := FreeSetHojyo;
    m_FncInfo.Action[1]  := nil;
    m_FncInfo.Action[2]  := nil;
    m_FncInfo.Action[3]  := nil;
    m_FncInfo.Action[4]  := nil;
    m_FncInfo.Action[5]  := nil;
    m_FncInfo.Action[6]  := nil;
    m_FncInfo.Action[7]  := nil;

    MSPFunctionBar.CopyFuncData(m_FncInfo.Caption);

end;
*)
//<017>
procedure TJNTCRP016000f.fnSetFncType(nDspType: Boolean ;ifuncNo : Integer);
var
	stMessageRec : TMJSMsgRec;
begin

    case iFuncNo of
        0:  //[F1 ]
        begin
            if ( nDspType = False ) then
            begin
                m_FncInfo.Caption[iFuncNo] := '';
                m_FncInfo.Action [iFuncNo] := nil;
            end
            else
            begin
                m_FncInfo.Caption[iFuncNo] := 'F1 ﾌﾘｰ項目登録';
                m_FncInfo.Action [iFuncNo] := FreeSetHojyo;
            end;
        end;
        7:  //[F8 ]
        begin
            if ( nDspType = False ) then
            begin
                m_FncInfo.Caption[iFuncNo] := '';
                m_FncInfo.Action [iFuncNo] := nil;
            end
            else
            begin
                m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);
                m_FncInfo.Caption[iFuncNo] := stMessageRec.sMsg;
                m_FncInfo.Action [iFuncNo] := nil;
            end;
        end;
        else
        begin
            m_FncInfo.Caption[iFuncNo] := '';
            m_FncInfo.Action [iFuncNo]  := nil;
        end;
    end;

    MSPFunctionBar.CopyFuncData(m_FncInfo.Caption);
end;
//-----------------------------------------------------------------------------
// fnFreeDlg()
//      PARAM   : nFunc         :   ﾌｧﾝｸｼｮﾝｷｰ番号
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌﾘｰ項目画面の表示
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.fnFreeDlg(nFunc: Integer);
var
    nExCode     :   String;
    nExNCode    :   Extended;
    nDivision   :   Integer;
    nCaption    :   String;
    nType       :   Integer;
    nTblName    :   String;
begin
    fnJNTFreeDlgInit( m_pRec, @m_cComArea, @m_cDBSelect );  //<FREEINIT> ADD
    // 初期化<005>
//<064> DEL    m_UpdFreeFlg := FALSE;
//<064> DEL    m_freeItem   := m_freeItemNull;
    nType        := 0;

    try
        Case nFunc of
            0:
            begin
                // ---------------------------
                //      内部ｺｰﾄﾞの取得
                // ---------------------------
                // 詳細画面時
                if ( DtlCmnClientPanel.Visible ) then
                begin
                    // 数値属性
            		if ( m_nCurrentCodeAttr <= 1 ) then
                    begin
                        //<038> ↓
                        //if DtlCmnEditExCodeNumeric.Value = 0 then Exit;     // ｺｰﾄﾞ未入力時<017>
                        if (DtlCmnEditExCodeNumeric.InputFlag) and
                            (DtlCmnEditExCodeNumeric.Value = 0)then Exit;
                        //<038> ↑

                        nExCode     :=  Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);
                        gfnGetNCode(m_nCurrentMasterDiv,
                                   nExCode,
                                   nExNCode,nDivision);
                    end
                    // ﾌﾘｰ属性
            		else
                    begin
                        if DtlCmnEditExCodeFree.Text = '' then Exit;        // ｺｰﾄﾞ未入力時<017>

                        nExCode     :=  DtlCmnEditExCodeFree.Text;
                        gfnGetNCode(m_nCurrentMasterDiv,
                        nExCode,
                        nExNCode,
                        nDivision);
                    end;
                end
                // 一覧画面時
                else
                begin
                    // 実在ｸﾞﾘｯﾄﾞ
                	if ( StdCmnTab.Items [0].Selected ) then
                	begin
                		if ( StdCmnMemDataExist.RecordCount <> 0 ) then
                		begin
                            nExCode   :=  StdCmnMemDataExist.FieldByName ('strExCode') .AsString;
                            nExNCode  :=  StdCmnMemDataExist.FieldByName ('strExNCode').AsFloat;
                		end;
                	end
                    // 合計ｸﾞﾘｯﾄﾞ
                    else
                	begin
                		if ( StdCmnMemDataTotal.RecordCount <> 0 ) then
                		begin
                			if ( m_nCurrentCodeAttr <= 1 ) then
                			begin
                                nExCode   := StdCmnMemDataTotal.FieldByName ('strExCode') .AsString;
                                nExNCode  := StdCmnMemDataTotal.FieldByName ('strExNCode').AsFloat;
                    		end;
                    	end;
                    end;
                end;

                case m_nCurrentMasterDiv of
                    31:
                    begin
                        nCaption    :=  '汎用補助1ｺｰﾄﾞ';
                        //nType       :=  MKBN_HHOJYO1;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                        nType       :=  MMEI_HHOJYO1_S;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                    end;
                    32:
                    begin
                        nCaption    :=  '汎用補助2ｺｰﾄﾞ';
                        //nType       :=  MKBN_HHOJYO2;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                        nType       :=  MMEI_HHOJYO2_S;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                    end;
                    33:
                    begin
                        nCaption    :=  '汎用補助3ｺｰﾄﾞ';
                        //nType       :=  MKBN_HHOJYO3;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                        nType       :=  MMEI_HHOJYO3_S;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                    end;
                    34:
                    begin
                        nCaption    :=  '汎用補助4ｺｰﾄﾞ';
                        //nType       :=  MKBN_HHOJYO4;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                        nType       :=  MMEI_HHOJYO4_S;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                    end;
                    35:
                    begin
                        nCaption    :=  '汎用補助5ｺｰﾄﾞ';
                        //nType       :=  MKBN_HHOJYO5;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                        nType       :=  MMEI_HHOJYO5_S;		// 051122 hirota フリーダイアログのパラメータは分類のSetNm
                    end;
                end;

                // 参照TableName
                nTblName    :=  'HojyoMA';

            end;
            1:  ;
            2:  ;
            3:  ;
            4:  ;
            5:  ;
            6:  ;
            7:  ;
        end;

        // ﾌﾘｰ項目ﾀﾞｲｱﾛｸﾞ表示内容変更
        //  第1引数 対象ﾃｰﾌﾞﾙ名
        //  第2引数 内部ｺｰﾄﾞﾌｨｰﾙﾄﾞ識別子
        //  第3引数 外部ｺｰﾄﾞﾌｨｰﾙﾄﾞ識別子
        //  第4引数 簡略名称ﾌｨｰﾙﾄﾞ識別子
        //  第5引数 ｷｬﾌﾟｼｮﾝ名称
        //  第6引数 ﾏｽﾀ区分
        fnJNTFreeDlgInfo(nTblName, 'NCode', 'GCode', 'SimpleName', nCaption, nType);

        // ↓↓↓<005>
        if ( nExNCode <> 0 ) then
        begin
{
            // ﾌﾘｰ項目ﾀﾞｲｱﾛｸﾞ表示
            if ( fnJNTFreeDlgShow( nExNCode ) = mrOK ) then
            begin
                // ﾌﾘｰ項目の更新
                fnJNTFreeDlgUpd;
            end;
}// <005>
            // ﾌﾘｰﾀﾞｲｱﾛｸﾞ初回起動時↓↓↓<005>
            if ( m_UpdFreeFlg = FALSE ) then
            begin
                // ﾀﾞｲｱﾛｸﾞの表示
                if ( fnJNTFreeDlgShow( nExNCode ) = mrOK ) then
                begin
                    // ﾌﾘｰ項目の更新
                    m_freeItem      :=  fnJNTFreeDlgGetItem;
                    m_UpdFreeFlg    :=  TRUE;
                end;
            end
            else
            begin
            	// 表示項目設定
        	    fnJNTFreeDlgSetItem( @m_freeItem, nType );

                // ﾀﾞｲｱﾛｸﾞの表示
                if ( fnJNTFreeDlgShow2() = mrOK ) then
                begin
                    // ﾌﾘｰ項目の更新
                    m_freeItem  :=  fnJNTFreeDlgGetItem;
                end;
            end;
        end
        else
        begin
            m_freeItem.GCode     := nExCode;
			m_freeItem.LCaption  := nCaption;
            m_freeItem.NCode     := nExNCode;

            if ( DtlCmnClientPanel.Visible ) then
            begin
                m_freeItem.Nm        := DtlCmnEditName.Text;
    			m_freeItem.Nmk       := DtlCmnEditNameSimple.Text;
            end
            else
            begin
                m_freeItem.Nm        := StdCmnMemDataTotal.FieldByName ('strName')      .AsString;
    			m_freeItem.Nmk       := StdCmnMemDataTotal.FieldByName ('strNameSimple').AsString;
            end;

        	// 表示項目設定
    	    fnJNTFreeDlgSetItem( @m_freeItem, nType );
        	// ﾀﾞｲｱﾛｸﾞの表示
	        if ( fnJNTFreeDlgShow2() = mrOK ) then
    	    begin
        	    // ﾌﾘｰ項目の更新
	            m_freeItem      :=  fnJNTFreeDlgGetItem;
    	        m_UpdFreeFlg    :=  TRUE;
        	end;

        end;
        // ↑↑↑<005>
    except
    end;

end;

//-----------------------------------------------------------------------------
// FreeSetHojyoExecute()
//      PARAM   : Sender        :   TObjenctｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//
//      RETURN  :
//      MEMO    : F1ｱｸｼｮﾝ処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.FreeSetHojyoExecute(Sender: TObject);
begin

    fnFreeDlg(0);

end;


// ************************************************************************** //
//                                                                            //
//      以下はｾｸﾞﾒﾝﾄ,分類機能に関する処理です。                               //
//                                                                            //
// ************************************************************************** //


//-----------------------------------------------------------------------------
// fnSegBumInzForm()    <003>
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ｾｸﾞﾒﾝﾄ,分類初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.fnSegBumInzForm();
var
    i               :   Integer;
    nMasterDivision :   Integer;
    DmqData         :   TMQuery;
    nSegAttrUseKbn  :   array[1..10] of Integer;

    // ｾｸﾞﾒﾝﾄの採用はMasterInfoでなくSegMAを参照する
    function fnSegUseKbnGet(nMasKbn: Integer): Integer;
    var
        i           :   Integer;
        DmqSegMA    :   TMQuery;
    begin
        result := 0;

        // 配列の初期化
        for i := 1 to 10 do
            nSegAttrUseKbn[i]   :=  0;

        DmqSegMA    :=  TMQuery.Create( Self );
        m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, DmqSegMA );

        with DmqSegMA do
        begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT * FROM SegMA            '
                +   'WHERE  MasterKbn = :nMasKbn    ');
            ParamByName('nMasKbn').AsInteger    :=  nMasKbn;

            Open();

            if ( not EOF ) then
            begin
                nSegAttrUseKbn[1]   :=  GetFld('SegUse1').AsInteger;
                nSegAttrUseKbn[2]   :=  GetFld('SegUse2').AsInteger;
                nSegAttrUseKbn[3]   :=  GetFld('SegUse3').AsInteger;
                nSegAttrUseKbn[4]   :=  GetFld('SegUse4').AsInteger;
                nSegAttrUseKbn[5]   :=  GetFld('SegUse5').AsInteger;
                nSegAttrUseKbn[6]   :=  GetFld('SegUse6').AsInteger;
                nSegAttrUseKbn[7]   :=  GetFld('SegUse7').AsInteger;
                nSegAttrUseKbn[8]   :=  GetFld('SegUse8').AsInteger;
                nSegAttrUseKbn[9]   :=  GetFld('SegUse9').AsInteger;
                nSegAttrUseKbn[10]  :=  GetFld('SegUse10').AsInteger;
            end;

            Close();
        end;

        DmqSegMA.Close();
        DmqSegMA.Free();

    end;


begin

    // MQueryの構築
	DmqData    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqData);

    // ﾏｽﾀ区分
    nMasterDivision :=  m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision;

    // ｾｸﾞﾒﾝﾄ採用情報の取得
    fnSegUseKbnGet(nMasterDivision);

    // 分類,ｾｸﾞﾒﾝﾄの初期設定
    for i := 1 to  10 do
    begin
        TMLabel(MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(i))).Caption := '';
        TMLabel(MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(i))).Caption := '';
    end;

    for i := 1 to  10 do
    begin
        // ｾｸﾞﾒﾝﾄ
        m_arAdoptInfo_Seg [i].nMasterDivision	:= 0;
        m_arAdoptInfo_Seg [i].nAdoption      	:= 0;
        m_arAdoptInfo_Seg [i].nCodeDigit    	:= 0;
        m_arAdoptInfo_Seg [i].nCodeAttribute	:= 0;
        m_arAdoptInfo_Seg [i].strDescription	:= '';

        // 補助分類
        m_arAdoptInfo_HBr [i].nMasterDivision	:= 0;
        m_arAdoptInfo_HBr [i].nAdoption      	:= 0;
        m_arAdoptInfo_HBr [i].nCodeDigit    	:= 0;
        m_arAdoptInfo_HBr [i].nCodeAttribute	:= 0;
        m_arAdoptInfo_HBr [i].strDescription	:= '';
    end;

    with DmqData do
    begin
        // -----------------------------------------------
        //  ｾｸﾞﾒﾝﾄ①～⑩
        // -----------------------------------------------
        i   :=  1;

        Close();
        Sql.Clear();
        Sql.Add('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr From MasterInfo  '
            +   ' Where MasterKBN Between :pSMKBN and :pEMKBN Order By MasterKBN            ');

        ParamByName('pSMKBN').AsInteger := MASTER_STSEG;  // 101
        ParamByName('pEMKBN').AsInteger := MASTER_EDSEG;  // 110
        Open();

        While not EOF do
        begin
            if ( i > 10 ) then Break;

            m_arAdoptInfo_Seg [i].nMasterDivision   :=  GetFld('MasterKBN') .AsInteger;

            if ( GetFld('UseKbn').AsInteger = 0 ) then
                m_arAdoptInfo_Seg [i].nAdoption			:=  GetFld('UseKbn')    .AsInteger
            else
                m_arAdoptInfo_Seg [i].nAdoption			:=  nSegAttrUseKbn[i];

            m_arAdoptInfo_Seg [i].nCodeDigit		:=  GetFld('CodeDigit') .AsInteger;
            m_arAdoptInfo_Seg [i].nCodeAttribute	:=  GetFld('CodeAttr')  .AsInteger;
            m_arAdoptInfo_Seg [i].strDescription	:=  GetFld('JHojyoName').AsString;
            inc(i);
            Next;
        end;

        // ｾｸﾞﾒﾝﾄ名称のｾｯﾄ
        for i := 1 to  10 do
        begin
            // ﾗﾍﾞﾙ名称
            TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegTitl' + IntToStr(i))).Caption    :=  m_arAdoptInfo_Seg [i].strDescription;
            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd'   + IntToStr(i))).MaxLength  :=  m_arAdoptInfo_Seg [i].nCodeDigit;

            // 属性
            case m_arAdoptInfo_Seg [i].nCodeAttribute of
                // 数値属性
                0:
                begin
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).InputAttr := iaZeroSup;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).ImeMode   := imDisable;
                end;
                // 数値前ｾﾞﾛ有属性
                1:
                begin
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).InputAttr := iaZeroPad;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).ImeMode   := imDisable;
                end;
                // ﾌﾘｰ属性
                2:
                begin
//                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).InputAttr := iaFree;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).InputAttr := iaNone;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd' + IntToStr(i))).ImeMode   := imClose;
                end;
            end;

            // 表示・非表示
            case m_arAdoptInfo_Seg [i].nAdoption of
                0:
                begin
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegTitl' + IntToStr(i))).Visible := FALSE;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd'   + IntToStr(i))).Visible := FALSE;
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm'   + IntToStr(i))).Visible := FALSE;
                end;
                1:
                begin
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegTitl' + IntToStr(i))).visible := TRUE;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_SegCd'   + IntToStr(i))).Visible := TRUE;
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm'   + IntToStr(i))).Visible := TRUE;
                end;
            end;
        end;

        // -----------------------------------------------
        //  汎用補助分類①～⑩
        // -----------------------------------------------
        i   :=  1;

        Close();
        Sql.Clear();
        Sql.Add('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr From MasterInfo  '
            +   ' Where MasterKBN Between :pSMKBN and :pEMKBN Order By MasterKBN            ');

        case nMasterDivision of
            MASTER_GENERAL01:
            begin
                ParamByName('pSMKBN').AsInteger :=  MASTER_STHHJ1BN;
                ParamByName('pEMKBN').AsInteger :=  MASTER_EDHHJ1BN;
            end;
            MASTER_GENERAL02:
            begin
                ParamByName('pSMKBN').AsInteger :=  MASTER_STHHJ2BN;
                ParamByName('pEMKBN').AsInteger :=  MASTER_EDHHJ2BN;
            end;
            MASTER_GENERAL03:
            begin
                ParamByName('pSMKBN').AsInteger :=  MASTER_STHHJ3BN;
                ParamByName('pEMKBN').AsInteger :=  MASTER_EDHHJ3BN;
            end;
            MASTER_GENERAL04:
            begin
                ParamByName('pSMKBN').AsInteger :=  MASTER_STHHJ4BN;
                ParamByName('pEMKBN').AsInteger :=  MASTER_EDHHJ4BN;
            end;
            MASTER_GENERAL05:
            begin
                ParamByName('pSMKBN').AsInteger :=  MASTER_STHHJ5BN;
                ParamByName('pEMKBN').AsInteger :=  MASTER_EDHHJ5BN;
            end;
        end;

        Open();
        While not EOF do
        begin
            if ( i > 10 ) then Break;

            m_arAdoptInfo_HBr [i].nMasterDivision   :=  GetFld('MasterKBN') .AsInteger;
            m_arAdoptInfo_HBr [i].nAdoption			:=  GetFld('UseKbn')    .AsInteger;
            m_arAdoptInfo_HBr [i].nCodeDigit		:=  GetFld('CodeDigit') .AsInteger;
            m_arAdoptInfo_HBr [i].nCodeAttribute	:=  GetFld('CodeAttr')  .AsInteger;
            m_arAdoptInfo_HBr [i].strDescription	:=  GetFld('JHojyoName').AsString;
            inc(i);
            Next;
        end;

        // 汎用補助分類名称ｾｯﾄ
        for i := 1 to  10 do
        begin
            // ﾗﾍﾞﾙ名称
            TMLabel(MJSFindCtrl(Self, 'Jituzai_LLabel_BunTitl' + IntToStr(i))).Caption := m_arAdoptInfo_HBr [i].strDescription;

            // 属性
            case m_arAdoptInfo_HBr [i].nCodeAttribute of
                // 数値属性
                0:  TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).InputAttr := iaZeroSup;
                // 数値前ｾﾞﾛ有属性
                1:  TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).InputAttr := iaZeroPad;
                // ﾌﾘｰ属性
//                2:  TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).InputAttr := iaFree;
                2:  TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).InputAttr := iaNone;
            end;

            // 桁数
            TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd' + IntToStr(i))).MaxLength := m_arAdoptInfo_HBr [i].nCodeDigit;

            // 表示・非表示
            case m_arAdoptInfo_HBr [i].nAdoption of
                0:
                begin
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunTitl' + IntToStr(i))).Visible := FALSE;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd'   + IntToStr(i))).Visible := FALSE;
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm'   + IntToStr(i))).Visible := FALSE;
                end;
                1:
                begin
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunTitl' + IntToStr(i))).visible := TRUE;
                    TMTxtEdit(MJSFindCtrl(Self, 'Jituzai_ETEdit_BunCd'   + IntToStr(i))).Visible := TRUE;
                    TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm'   + IntToStr(i))).Visible := TRUE;
                end;
            end;
        end;
    end;

    DmqData.Close();
    DmqData.Free();

end;

//-----------------------------------------------------------------------------
// fnGetNAME()    <003>
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ｾｸﾞﾒﾝﾄ,分類名称の取得
//-----------------------------------------------------------------------------
function TJNTCRP016000f.fnGetNAME(pCODE: String; pMKBN,pAttr: Integer; var RName: String ): Boolean;
var
    DmqData :   TMQuery;
    nGCode  :   String;
begin

    Result  :=  FALSE;
    RName   :=  '';
    nGCODE  :=  '';

    // ﾌﾘｰ属性
	if ( pAttr = 2 ) then
		nGCODE  :=  pCODE
	else
    // 数値属性
	begin
		if ( pCODE <> '' ) then
			nGCODE  :=  Format ('%.16d', [StrToInt64 (Trim(pCODE))])
		else
			nGCODE  :=  '';
	end;

    DmqData :=  TMQuery.Create ( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
        with DmqData do
        begin
            Close();
            SQL.Clear();

            case pMKBN of
                MASTER_STSEG..MASTER_EDSEG:
                begin
                    SQL.Add('SELECT SimpleName NMK FROM HojyoMA '
                        +   'WHERE  MasterKbn = :nMasKbn        '
                        +   '  AND  RDelKbn   = 0               '
                        +   '  AND  GCode     = :stGCode        '
                        +   '  AND  SumKbn    = 0');
                end;
                MASTER_STHHJ1BN..MASTER_EDHHJ5BN:
                begin
                    SQL.Add('SELECT Nmk FROM MMEISHO    '
                        +   'WHERE  SetNM   = :nMasKbn  '
                        +   '  AND  RDelKbn = 0         '
                        +   '  AND  GCode   = :stGCode  ');
                end;
            end;

            SetFld('nMasKbn').AsInteger :=  pMKBN;
            SetFld('stGCode').AsString  :=  nGCODE;
            Open();

            if not EOF then
            begin
                Result  :=  TRUE;
                RName   :=  FieldByName('Nmk').AsString;
            end;
        end;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// Jituzai_ETEdit_FldChk()    <003>
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ｾｸﾞﾒﾝﾄ,分類ﾌｨｰﾙﾄﾞ入力値ﾁｪｯｸ処理
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.Jituzai_ETEdit_FldChk(Sender: TObject);
var
    i       :   Integer;
    nName   :   String;
begin

    // 存在ﾁｪｯｸ及び名称の取得【ｾｸﾞﾒﾝﾄ】
    if ( Copy(TMTxtEdit(Sender).name,1,20) = 'Jituzai_ETEdit_SegCd' ) then
    begin
        i   :=  StrToInt(Copy(TMTxtEdit(Sender).name,21,2));

        TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(i))).Caption  :=  '';

        if ( TMTxtEdit(Sender).text = '' ) then Exit;

        if ( fnGetNAME(TMTxtEdit(Sender).text,
              m_arAdoptInfo_Seg [i].nMasterDivision,m_arAdoptInfo_Seg [i].nCodeAttribute,nName) ) then
            // ﾗﾍﾞﾙに名称をｾｯﾄ
            TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(i))).Caption  :=  nName
        else
		begin
			Beep;
			MjsSetFocus(Self,TMTxtEdit(Sender).name);
			Abort;
		end;
    end;

    // 存在ﾁｪｯｸ及び名称の取得【汎用補助分類】
    if ( Copy(TMTxtEdit(Sender).name,1,20) = 'Jituzai_ETEdit_BunCd' ) then
    begin
        i   :=  StrToInt(Copy(TMTxtEdit(Sender).name,21,2));

        TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(i))).Caption  :=  '';

        if ( TMTxtEdit(Sender).text = '' ) then Exit;

        if ( fnGetNAME(TMTxtEdit(Sender).text,
              m_arAdoptInfo_HBr [i].nMasterDivision,m_arAdoptInfo_HBr [i].nCodeAttribute,nName) ) then
            // ﾗﾍﾞﾙに名称をｾｯﾄ
            TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(i))).Caption := nName
        else
		begin
			Beep;
			MjsSetFocus(Self,TMTxtEdit(Sender).name);
			Abort;
		end;
    end;

end;



// ************************************************************************** //
//                                                                            //
//      以下は印刷機能に関する処理です。                                      //
//                                                                            //
// ************************************************************************** //

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCommonFunctionOnBeforePrint (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnBeforePrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCommonFunctionOnBeforePrint (Sender: TObject);
begin
	m_cPrnSupport.BeforePrint (Sender);
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardBnk ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_StandardBnkBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardBnk.LastRecord) or
		(ppDetailBand_StandardBnk.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardBnk.OverFlow = FALSE) then
			ppDetailBand_StandardBnk.OverFlow	:=	TRUE;

		if (ppStandardBnkUnderLine.ReprintOnOverFlow = FALSE) then
			ppStandardBnkUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppStandardBnkUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardBnkUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardCst ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_StandardCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardCst.LastRecord) or
		(ppDetailBand_StandardCst.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardCst.OverFlow = FALSE) then
			ppDetailBand_StandardCst.OverFlow	:=	TRUE;

		if (ppStandardCstUnderLine.ReprintOnOverFlow = FALSE) then
			ppStandardCstUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppStandardCstUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardCstUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardStf ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_StandardStfBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardStf.LastRecord) or
		(ppDetailBand_StandardStf.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardStf.OverFlow = FALSE) then
			ppDetailBand_StandardStf.OverFlow	:=	TRUE;

		if (ppStandardStfUnderLine.ReprintOnOverFlow = FALSE) then
			ppStandardStfUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppStandardStfUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardStfUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardGen ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardGen.LastRecord) or
		(ppDetailBand_StandardGen.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardGen.OverFlow = FALSE) then
			ppDetailBand_StandardGen.OverFlow	:=	TRUE;

		if (ppStandardGenUnderLine.ReprintOnOverFlow = FALSE) then
			ppStandardGenUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppStandardGenUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardGenUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_TtlStandardBnk ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_TtlStandardBnkBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardBnk.LastRecord) or
		(ppDetailBand_TtlStandardBnk.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_TtlStandardBnk.OverFlow = FALSE) then
			ppDetailBand_TtlStandardBnk.OverFlow	:=	TRUE;

		if (ppTtlStandardBnkUnderLine.ReprintOnOverFlow = FALSE) then
			ppTtlStandardBnkUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppTtlStandardBnkUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardBnkUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_TtlStandardCst ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_TtlStandardCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardCst.LastRecord) or
		(ppDetailBand_TtlStandardCst.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_TtlStandardCst.OverFlow = FALSE) then
			ppDetailBand_TtlStandardCst.OverFlow	:=	TRUE;

		if (ppTtlStandardCstUnderLine.ReprintOnOverFlow = FALSE) then
			ppTtlStandardCstUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppTtlStandardCstUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardCstUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_TtlStandardStf ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_TtlStandardStfBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardStf.LastRecord) or
		(ppDetailBand_TtlStandardStf.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_TtlStandardStf.OverFlow = FALSE) then
			ppDetailBand_TtlStandardStf.OverFlow	:=	TRUE;

		if (ppTtlStandardStfUnderLine.ReprintOnOverFlow = FALSE) then
			ppTtlStandardStfUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppTtlStandardStfUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardStfUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_TtlStandardGen ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_TtlStandardGenBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardGen.LastRecord) or
		(ppDetailBand_TtlStandardGen.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_TtlStandardGen.OverFlow = FALSE) then
			ppDetailBand_TtlStandardGen.OverFlow	:=	TRUE;

		if (ppTtlStandardGenUnderLine.ReprintOnOverFlow = FALSE) then
			ppTtlStandardGenUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppTtlStandardGenUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardGenUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_ExtDetailsCst ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_ExtDetailsCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_ExtDetailsCst.LastRecord) or
		(ppDetailBand_ExtDetailsCst.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_ExtDetailsCst.OverFlow = FALSE) then
			ppDetailBand_ExtDetailsCst.OverFlow	:=	TRUE;

		if (ppExtDetailsCstUnderLine.ReprintOnOverFlow = FALSE) then
			ppExtDetailsCstUnderLine.ReprintOnOverFlow	:=	TRUE;

		ppExtDetailsCstUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppExtDetailsCstUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardStf ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	Y.Ichihashi			HIS0030
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_StandardStf2BeforeGenerate(Sender: TObject);
begin

	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardStf2.LastRecord) or
		(ppDetailBand_StandardStf2.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_StandardStf2.OverFlow = FALSE) then
			ppDetailBand_StandardStf2.OverFlow	:=	TRUE;

		if (ppStandardStfUnderLine2.ReprintOnOverFlow = FALSE) then
			ppStandardStfUnderLine2.ReprintOnOverFlow	:=	TRUE;

		ppStandardStfUnderLine2.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppStandardStfUnderLine2.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;

end;

//************************************************************************
//*		Component		:	ppDetailBand_System ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP016000f.ppDetailBand_SystemBeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_System.LastRecord) or
		(ppDetailBand_System.PageOutOfSpace = TRUE) Then
	begin
		if (ppDetailBand_System.OverFlow = FALSE) then
			ppDetailBand_System.OverFlow	:=	TRUE;

		if (CmnReportSystemLineDetailsBottom.ReprintOnOverFlow = FALSE) then
			CmnReportSystemLineDetailsBottom.ReprintOnOverFlow	:=	TRUE;

		CmnReportSystemLineDetailsBottom.Visible    :=	TRUE;
		CmnReportSystemLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		CmnReportSystemLineDetailsBottom.Visible    :=	FALSE;
		CmnReportSystemLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

// =============================================================================
// 適用期間の開始・終了の判定処理(デフォルト値の場合はブランクとする)
// =============================================================================
procedure TJNTCRP016000f.fnCheckTekiDate(nDmqDataQry: TMQuery);
var
    sDate   :   Integer;
begin

    sDate   :=  0;
    //	適用開始年月日
    sDate   :=  StrToInt(FormatDateTime('yyyymmdd',nDmqDataQry.GetFLD('TStartDate'	).AsDateTime));
    if ( sDate = DEFDATE_START ) then
        DtlCmnEditAppDateStart.AsDateTime   :=  0
    else
        DtlCmnEditAppDateStart.AsDateTime	:=	nDmqDataQry.GetFLD('TStartDate'	).AsDateTime;

    //	適用終了年月日
    sDate   :=  StrToInt(FormatDateTime('yyyymmdd',nDmqDataQry.GetFLD('TEndDate'	).AsDateTime));
    if ( sDate = DEFDATE_END ) then
        DtlCmnEditAppDateEnd.AsDateTime		:=  0
    else
    	DtlCmnEditAppDateEnd.AsDateTime		:=	nDmqDataQry.GetFLD('TEndDate'	).AsDateTime;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnCmnReportSystemppDBTextExCodeDstOnPrint (TObject)						*/
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ OnPrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnCmnReportSystemppDBTextExCodeDstOnPrint (Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;

begin
	cDBTextExCode	:= Sender as TppDBText;
	strExCode		:= cDBTextExCode.Text;

//	CmnReportSystemLineDetailsBottom.Visible	:= FALSE;

//	if	(strExCode = m_strExCodePrint) then
	if	(CompareStr (strExCode, m_strExCodePrint) = 0) then
	begin
		cDBTextExCode.Visible	:= FALSE;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= FALSE;
		CmnReportSystemLineDetailsTop     .Visible	:= FALSE;
	end
	else
    begin
		cDBTextExCode.Visible	:= TRUE;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= TRUE;

		if	(m_strExCodePrint = '') then
			CmnReportSystemLineDetailsTop.Visible	:= FALSE
		else
			CmnReportSystemLineDetailsTop.Visible	:= TRUE;

		m_strExCodePrint	:= strExCode;
	end;
end;


procedure	TJNTCRP016000f.fnCmnReportSystemOnEndPage (Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnPrintCheckListExtStandard ()													*/
//*																											*/
//*	目的	: 補助登録処理 実在xxxx登録ﾘｽﾄ印刷処理															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnPrintCheckListExtStandard ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;
//<061>		sName		: String;

//	b_Start		: Boolean;
//	b_End		: Boolean;
begin
{050823 hirota
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_GENERAL01..MASTER_GENERAL05:	CmnReportExtStandardGenDBTextCode.Alignment	:= taRightJustify;
		end;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_GENERAL01..MASTER_GENERAL05:	CmnReportExtStandardGenDBTextCode.Alignment	:= taLeftJustify;
		end;
	end;
050823 hirota}

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.Add ('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.TStartDate, hm.TEndDate, ');	// 050823 hirota

		//HIS0030
// 050823 hirota		if (m_nCurrentMasterDiv = 25) and (m_BumonUseKbn <> 0) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
// 050823 hirota			SQL.Add	('		 hm.SectionCode, ');

		SQL.Add ('       hm.UpdDateTM, hm.HojyoKbn1, hm.HojyoKbn2, hm.BunCode, fi.FusenKbn  ');				// 050823 hirota
        SQL.Add ('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');

		SQL.Add ('ON     hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
		SQL.Add ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and RDelKbn = 0 ');				// 050823 hirota

        //<037> ↓
        // コードによる範囲指定
        if ( uvHani.pvrRgType[0] <> 0 ) then									// 指定あり
        begin
            if ( uvHani.pvrStCode[0] <> '' ) then								// 開始指定
            begin
                SQL.Add('  AND  (hm.GCode >= :ExStCode)   ');
    			ParamByName('ExStCode').AsString   :=	m_strExCodeScopeStr;
            end;

            if ( uvHani.pvrEdCode[0] <> '' ) then								// 終了のみ指定
            begin
                SQL.Add('  AND  (hm.GCode <= :ExEdCode)   ');
    			ParamByName('ExEdCode').AsString   :=  m_strExCodeScopeEnd;
            end;
        end;
        {
		if (m_strExCodeScopeStr <> m_strExCodeScopeEnd) then												// 050823 hirota 暫定対応
			SQL.Add ('   and hm.NCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');					// 050823 hirota
        }
       //<037> ↑

{050823 hirota
        //--- HIS0042 St ------
        if m_nCurrentMasterDiv = 22 then
        begin
            //得意先のみ採用
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = FALSE) and (m_NoCheck = FALSE) then
                SQL.Add('and hm.HojyoKbn1 = 1 ')
            //仕入先のみ採用
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = FALSE) then
                SQL.Add('and hm.HojyoKbn2 = 1 ')
            //得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE)  then
                SQL.Add('and hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0 ')
            //得意先・仕入先採用
            else
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = FALSE) then
                SQL.Add('and (hm.HojyoKbn1 = 1 or hm.HojyoKbn2 = 1) ')
            //得意先採用又は得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE)  then
                SQL.Add('and (hm.HojyoKbn1 = 1 or (hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0)) ')
            //仕入先採用又は得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = TRUE)  then
                SQL.Add('and (hm.HojyoKbn2 = 1 or (hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0)) ');
        end;
        //--- HIS0042 Ed -------
050823 hirota}

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.Add ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.Add ('ORDER BY hm.Renso, hm.GCode');							//

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

        //<037> ↓
        {
		// 050823 hirota 暫定対応 >>
		if (m_strExCodeScopeStr <> m_strExCodeScopeEnd) then
        begin
			ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
			ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ
        end;
		// 050823 hirota 暫定対応 <<
        }
        //<037> ↑

		Open ();

		CmnMemDataPrintExtStandard.Active	:= FALSE;
		CmnMemDataPrintExtStandard.Active	:= TRUE;

		while  (not EOF) do
		begin
			CmnMemDataPrintExtStandard.Append;

			strExCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			end;

			CmnMemDataPrintExtStandard.FieldByName ('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			CmnMemDataPrintExtStandard.FieldByName ('strExCode'     ).AsString	:= strExCode;
			CmnMemDataPrintExtStandard.FieldByName ('strAssociation').AsString	:= GetFld ('Renso'     ).AsString;	//050823 hirota
			CmnMemDataPrintExtStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintExtStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;

			if	(not GetFld ('TStartDate' ).IsNull)
            AND (GetFld ('TStartDate' ).AsDateTime <> MjsIntToDate(DEFDATE_START, #0)) then														//051129 hirota
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime	//050823 hirota
			else
				CmnMemDataPrintExtStandard.FieldbyName ('dtAppDateStart').Clear;

			if	(not GetFld ('TEndDate'   ).IsNull) 																		//050823 hirota
            AND (GetFld ('TEndDate' ).AsDateTime <> MjsIntToDate(DEFDATE_END, #0)) then															//051129 hirota
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime	//050823 hirota
			else
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).Clear;

			if	(not GetFld ('UpdDateTM').IsNull) then																			//050823 hirota
				CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdDateTM').AsDateTime		//050823 hirota
			else
				CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).Clear;

			case (m_nCurrentMasterDiv) of
				31..35:	begin
							case (GetFld ('BunCode').AsInteger) of
								0:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= 'その他一般';
								1:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '連結子(親)会社';
								2:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '非連結子会社';
								3:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '関連会社';
							end;
						end;
			end;

			CmnMemDataPrintExtStandard.Post;

			NEXT;
		end;


{		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
		begin
			b_Start	:= TRUE;
			b_End	:= TRUE;

			Close ();

			SQL.Clear;

			SQL.Add ('SELECT hm.GCode, hm.RenChar, hm.LongName, hm.SimpleName, hm.StartDate, hm.EndDate, ');

			//HIS0030
			if (m_nCurrentMasterDiv = 25) and (m_BumonUseKbn <> 0) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
				SQL.Add	('		 hm.SectionCode, ');

			SQL.Add ('       hm.UpdateTime, hm.HojyoKbn1, hm.HojyoKbn2, hm.BunCode, fi.FusenKbn  ');
			SQL.Add ('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add ('ON     hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.Add ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and RecordKbn = 0 and ');
			SQL.Add ('       hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');
			SQL.Add ('ORDER BY hm.GCode');
			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
			ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ

			Open ();
		end
		else
		begin
			b_Start	:= FALSE;
			b_End	:= FALSE;

			Close ();

			SQL.Clear;

			SQL.Add ('SELECT hm.GCode, hm.RenChar, hm.LongName, hm.SimpleName, hm.StartDate, hm.EndDate, ');

			//HIS0030
			if (m_nCurrentMasterDiv = 25) and (m_BumonUseKbn <> 0) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
				SQL.Add	('		 hm.SectionCode, ');

			SQL.Add ('       hm.UpdateTime, hm.HojyoKbn1, hm.HojyoKbn2, hm.BunCode, fi.FusenKbn  ');
			SQL.Add ('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add ('ON     hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.Add ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and RecordKbn = 0 ');
			SQL.Add ('ORDER BY hm.RenChar, hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

			Open ();
		end;

		CmnMemDataPrintExtStandard.Active	:= FALSE;
		CmnMemDataPrintExtStandard.Active	:= TRUE;

		CmnMemDataPrintExtStandard.Active	:= FALSE;
		CmnMemDataPrintExtStandard.Active	:= TRUE;

		while  (not EOF) do
		begin
			if GetFld ('GCode').AsString = m_strExCodeScopeStr then
				b_Start	:= TRUE;

			if b_Start = FALSE then
				Next
			else
			begin
				CmnMemDataPrintExtStandard.Append;

				strExCode	:= GetFld ('GCode').AsString;

				if	(m_nCurrentCodeAttr <= 1) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintExtStandard.FieldByName ('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
				CmnMemDataPrintExtStandard.FieldByName ('strExCode'     ).AsString	:= strExCode;
				CmnMemDataPrintExtStandard.FieldByName ('strAssociation').AsString	:= GetFld ('RenChar'   ).AsString;
				CmnMemDataPrintExtStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
				CmnMemDataPrintExtStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;

				if	(not GetFld ('StartDate' ).IsNull) then
					CmnMemDataPrintExtStandard.FieldByName ('dtAppDateStart').AsDateTime	:= GetFld ('StartDate' ).AsDateTime
				else
					CmnMemDataPrintExtStandard.FieldbyName ('dtAppDateStart').Clear;

				if	(not GetFld ('EndDate'   ).IsNull) then
					CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).AsDateTime	:= GetFld ('EndDate'   ).AsDateTime
				else
					CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).Clear;

				if	(not GetFld ('UpdateTime').IsNull) then
					CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdateTime').AsDateTime
				else
					CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).Clear;

				case (m_nCurrentMasterDiv) of
					22:		begin
								if	(GetFld ('HojyoKbn1').AsInteger = 0) then
									CmnMemDataPrintExtStandard.FieldByName ('strCustomerDesc').AsString	:= ''
								else
									CmnMemDataPrintExtStandard.FieldByName ('strCustomerDesc').AsString	:= '○';

								if	(GetFld ('HojyoKbn2').AsInteger = 0) then
									CmnMemDataPrintExtStandard.FieldByName ('strSupplierDesc').AsString	:= ''
								else
									CmnMemDataPrintExtStandard.FieldByName ('strSupplierDesc').AsString	:= '○';

								case (GetFld ('BunCode').AsInteger) of
									0:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= 'その他一般';
									1:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '連結子(親)会社';
									2:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '非連結子会社';
									3:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '関連会社';
								end;
							end;

					//HIS0030
					25:	begin
							if (m_BumonUseKbn <> 0) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
							begin
            	    			strExCode	:= GetFld ('SectionCode').AsString;

								if fnBumonCheck(2, 2, sName, strExCode) <> -1 then
       	            	    		CmnMemDataPrintExtStandard.FieldByName('SectionName').AsString	:= sName
								else
									Exit;

								if strExCode <> '' then
								begin
									if	(m_BumonCodeAttr <= 1) then
									begin
										case (m_BumonCodeAttr) of
											0:	strFormat	:= '%'  + IntToStr (m_BumonCodeDigit) + 'd';
											1:	strFormat	:= '%.' + IntToStr (m_BumonCodeDigit) + 'd';
										end;

										strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);

	                            	   	CmnReportExtStandardStfDBTextCode3.Alignment	:= taRightJustify
									end
									else
       			                    	CmnReportExtStandardStfDBTextCode3.Alignment	:= taLeftJustify;
								end;

								CmnMemDataPrintExtStandard.FieldByName('SectionCode').AsString	:= strExCode;
							end;
						end;

					31..35:	begin
								case (GetFld ('BunCode').AsInteger) of
									0:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= 'その他一般';
									1:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '連結子(親)会社';
									2:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '非連結子会社';
									3:	CmnMemDataPrintExtStandard.FieldByName ('strClassDesc').AsString	:= '関連会社';
								end;
							end;
				end;

				CmnMemDataPrintExtStandard.Post;

				if b_End = FALSE then
				begin
					if GetFld ('GCode').AsString <> m_strExCodeScopeEnd then
						NEXT
					else
						break;
				end
				else
					Next;
			end;

		end;
}
		Close ();
	end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP016000f.fnPrintCheckListTtlStandard ()													*/
//*																											*/
//*	目的	: 補助登録処理 合計xxxx登録ﾘｽﾄ印刷処理															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP016000f.fnPrintCheckListTtlStandard ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;

//	b_Start		: Boolean;
//	b_End		: Boolean;
begin
{050823 hirota
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_GENERAL01..MASTER_GENERAL05:	CmnReportTtlStandardGenDBTextCode.Alignment	:= taRightJustify;
		end;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_GENERAL01..MASTER_GENERAL05:	CmnReportTtlStandardGenDBTextCode.Alignment	:= taLeftJustify;
		end;
	end;
050823 hirota}

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
        SQL.Add ('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.UpdDateTM,              ');		// 050823 hirota
		SQL.Add ('       fi.FusenKbn                                                                ');		// 050823 hirota
		SQL.Add ('FROM   HojyoMA hm                                                                 ');
// 050823 hirota		SQL.Add ('LEFT OUTER JOIN CSInfo ci                                                         ');
// 050823 hirota        SQL.Add ('  ON hm.MasterKbn = ci.MasterKbn and hm.NCode = ci.NCode                          ');
		SQL.Add ('LEFT OUTER JOIN MFusenInfo fi                                                     ');
        SQL.Add ('  ON hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode                          ');
		SQL.Add ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn <> 0 and RDelKbn = 0         ');

        //<037> ↓
        // コードによる範囲指定
        if ( uvHani.pvrRgType[0] <> 0 ) then									// 指定あり
        begin
            if ( uvHani.pvrStCode[0] <> '' ) then								// 開始指定
            begin
                SQL.Add('  AND  (hm.GCode >= :ExStCode)   ');
    			ParamByName('ExStCode').AsString   :=	m_strExCodeScopeStr;
            end;

            if ( uvHani.pvrEdCode[0] <> '' ) then								// 終了のみ指定
            begin
                SQL.Add('  AND  (hm.GCode <= :ExEdCode)   ');
    			ParamByName('ExEdCode').AsString   :=  m_strExCodeScopeEnd;
            end;
        end;
        {
		// 050823 hirota 暫定対応 >>
		if (m_strExCodeScopeStr <> m_strExCodeScopeEnd) then
			SQL.Add ('  and  hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd                 ');
		// 050823 hirota 暫定対応 <<					// 050823 hirota
        }
       //<037> ↑



		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
            SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

        //<037> ↓
		// 050823 hirota 暫定対応 >>
        {
		if (m_strExCodeScopeStr <> m_strExCodeScopeEnd) then
        begin
			ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
			ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ
		end;
        }
		// 050823 hirota 暫定対応 <<
        //<037> ↑

		Open ();

		CmnMemDataPrintTtlStandard.Active	:= FALSE;
		CmnMemDataPrintTtlStandard.Active	:= TRUE;

		while  (not EOF) do
		begin
			CmnMemDataPrintTtlStandard.Append;

			strExCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			end;

			CmnMemDataPrintTtlStandard.FieldByName ('strExCode'     ).AsString	:= strExCode;
			CmnMemDataPrintTtlStandard.FieldByName ('strAssociation').AsString	:= GetFld ('Renso'     ).AsString;		// 050823 hirota
			CmnMemDataPrintTtlStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintTtlStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;
			CmnMemDataPrintTtlStandard.FieldByName ('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));	// 050823 hirota

			if	(not GetFld ('UpdDateTM').IsNull) then							// 050823 hirota
				CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').AsDateTime	:= GetFld ('UpdDateTM').AsDateTime	// 050823 hirota
			else
				CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').Clear;

			{ 050823 hirota
			case (m_nCurrentMasterDiv) of
				22:	begin
						if	((FieldByName ('ZipCode1').AsInteger = 0) and
							 (FieldByName ('ZipCode2').AsInteger = 0)) then
						begin
							CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeUpper').Clear ();
							CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeLower').Clear ();
						end
						else
						begin
							CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeUpper').AsInteger	:= FieldByName ('ZipCode1').AsInteger;
							CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeLower').AsInteger	:= FieldByName ('ZipCode2').AsInteger;
						end;

						CmnMemDataPrintTtlStandard.FieldByName ('strAddress'   ).AsString	:= GetFld ('Address1').AsString;

						if	(GetFld ('RootKbn').AsInteger = 0) then
							CmnMemDataPrintTtlStandard.FieldByName ('strAdoptDesc').AsString	:= '通常'
						else
							CmnMemDataPrintTtlStandard.FieldByName ('strAdoptDesc').AsString	:= '名寄せ親';
					end;
			end;
			050823 hirota }
			CmnMemDataPrintTtlStandard.Post;

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();

{	with (dqMasterData) do
	begin
        if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
		begin
			b_Start	:= TRUE;
			b_End	:= TRUE;

			Close ();

			SQL.Clear;

			SQL.ADD ('SELECT hm.GCode, hm.RenChar, hm.LongName, hm.SimpleName, hm.UpdateTime, hm.RootKbn, ');
			SQL.ADD ('       ci.ZipCode1, ci.ZipCode2, ci.Address1, fi.FusenKbn ');
			SQL.ADD ('FROM   HojyoMA hm ');
			SQL.ADD ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
			SQL.ADD ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.ADD ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn <> 0 and RecordKbn = 0 and ');
			SQL.ADD ('       hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');
			SQL.ADD ('ORDER BY hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
			ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ

			Open ();
		end
		else
		begin
			b_Start	:= FALSE;
			b_End	:= FALSE;

			Close ();

			SQL.Clear;

			SQL.ADD ('SELECT hm.GCode, hm.RenChar, hm.LongName, hm.SimpleName, hm.UpdateTime, hm.RootKbn, ');
			SQL.ADD ('       ci.ZipCode1, ci.ZipCode2, ci.Address1, fi.FusenKbn ');
			SQL.ADD ('FROM   HojyoMA hm ');
			SQL.ADD ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
			SQL.ADD ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.ADD ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn <> 0 and RecordKbn = 0 ');
			SQL.ADD ('ORDER BY hm.RenChar, hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

			Open ();
		end;

		CmnMemDataPrintTtlStandard.Active	:= FALSE;
		CmnMemDataPrintTtlStandard.Active	:= TRUE;

		while  (not EOF) do
		begin
			if GetFld ('GCode').AsString = m_strExCodeScopeStr then
				b_Start	:= TRUE;

			if b_Start = FALSE then
				Next
			else
			begin
				CmnMemDataPrintTtlStandard.Append;

				strExCode	:= GetFld ('GCode').AsString;

				if	(m_nCurrentCodeAttr <= 1) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintTtlStandard.FieldByName ('strExCode'     ).AsString	:= strExCode;
				CmnMemDataPrintTtlStandard.FieldByName ('strAssociation').AsString	:= GetFld ('RenChar'   ).AsString;
				CmnMemDataPrintTtlStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
				CmnMemDataPrintTtlStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;

				if	(not GetFld ('UpdateTime').IsNull) then
					CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').AsDateTime	:= GetFld ('UpdateTime').AsDateTime
				else
					CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').Clear;

				case (m_nCurrentMasterDiv) of
					22:	begin
							if	((FieldByName ('ZipCode1').AsInteger = 0) and
								 (FieldByName ('ZipCode2').AsInteger = 0)) then
							begin
								CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeUpper').Clear ();
								CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeLower').Clear ();
							end
							else
							begin
								CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeUpper').AsInteger	:= FieldByName ('ZipCode1').AsInteger;
								CmnMemDataPrintTtlStandard.FieldByName ('nZipCodeLower').AsInteger	:= FieldByName ('ZipCode2').AsInteger;
							end;

							CmnMemDataPrintTtlStandard.FieldByName ('strAddress'   ).AsString	:= GetFld ('Address1').AsString;

							if	(GetFld ('RootKbn').AsInteger = 0) then
								CmnMemDataPrintTtlStandard.FieldByName ('strAdoptDesc').AsString	:= '通常'
							else
								CmnMemDataPrintTtlStandard.FieldByName ('strAdoptDesc').AsString	:= '名寄せ親';
						end;
				end;

				CmnMemDataPrintTtlStandard.Post;

				if b_End = FALSE then
				begin
					if GetFld ('GCode').AsString = m_strExCodeScopeEnd then
						break
					else
						Next;
				end
				else
					NEXT;
			end;
		end;

		Close ();
	end;

	dqMasterData.Free ();
}
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnPrintCheckListSystem ()					                                */
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ印刷処理															*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnPrintCheckListSystem ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;

begin
{050823 hirota
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		CmnReportSystemDBTextCodeDst.Alignment	:= taRightJustify;
		CmnReportSystemDBTextCodeSrc.Alignment	:= taRightJustify;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
		CmnReportSystemDBTextCodeDst.Alignment	:= taLeftJustify;
		CmnReportSystemDBTextCodeSrc.Alignment	:= taLeftJustify;
	end;
050823 hirota}

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
        SQL.ADD ('SELECT NCode, GCode, Renso, LongName, SimpleName FROM HojyoMA  ');
		SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn = 1 and RDelKbn = 0 ');
		SQL.ADD ('ORDER BY GCode                                                    ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		Open ();

		CmnMemDataPrintSystem.Active	:= FALSE;
		CmnMemDataPrintSystem.Active	:= TRUE;

		while  (not EOF) do
		begin
			strExCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			end;

			m_stPrintDstData.strExCode		:= strExCode;
            m_stPrintDstData.strExNCode     := GetFld ('NCode'     ).AsFloat;
			m_stPrintDstData.strAssociation	:= GetFld ('Renso'   ).AsString;	// 050823 hirota
			m_stPrintDstData.strName		:= GetFld ('LongName'  ).AsString;
			m_stPrintDstData.strNameSimple	:= GetFld ('SimpleName').AsString;

			fnSetSystemRecords ();

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnPrintCheckListSystem ()					                                */
//*																									*/
//*	目的	: 補助登録処理 分類セグメントﾘｽﾄ印刷処理															*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnPrintCheckListSegBun ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;
    i,j			: Integer;
//<061>    tmpLabel	: TppLabel;
//<061>    tmpLabel2	: TppDBText;

begin
{
	// コード
	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
		CmnReportSystemppDBTextExCodeDst.Alignment	:= taRightJustify
	else																				// ｺｰﾄﾞ属性: 文字
		CmnReportSystemppDBTextExCodeDst.Alignment	:= taLeftJustify;

	for i:=1 to 5 do
	begin
		case (i) of
			1:	tmpLabel := ppSeg1;
			2:	tmpLabel := ppSeg2;
			3:	tmpLabel := ppSeg3;
			4:	tmpLabel := ppSeg4;
			5:	tmpLabel := ppSeg5;
		end;
    	tmpLabel.Text := '';													// タイトル削除
		case (i) of
			1:	tmpLabel := ppBun1;
			2:	tmpLabel := ppBun2;
			3:	tmpLabel := ppBun3;
			4:	tmpLabel := ppBun4;
			5:	tmpLabel := ppBun5;
		end;
    	tmpLabel.Text := '';													// タイトル削除
	end;

	// セグメント
	for i:=1 to 10 do
    begin
		j := m_stSelectItem [i].nMasterDivision;
		case (j-100) of															// 101～105
			1:
            begin
            	tmpLabel2 := ppDBSeg1;
            	tmpLabel  := ppSeg1;
            end;
			2:
            begin
            	tmpLabel2 := ppDBSeg2;
            	tmpLabel  := ppSeg2;
            end;
			3:
            begin
            	tmpLabel2 := ppDBSeg3;
            	tmpLabel  := ppSeg3;
            end;
			4:
            begin
            	tmpLabel2 := ppDBSeg4;
            	tmpLabel  := ppSeg4;
            end;
			5:
            begin
            	tmpLabel2 := ppDBSeg5;
            	tmpLabel  := ppSeg5;
            end;
            else
            	continue;
		end;
    	if (m_stSelectItem [i].nAdoptDivision <> 0)
        and (SegMa[j-100] = 1) then						// 採用
		begin
        	tmpLabel.Text := m_stSelectItem [i].strItemCaption;
			if	(m_stSelectItem [i].nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
				tmpLabel2.Alignment	:= taRightJustify
			else																				// ｺｰﾄﾞ属性: 文字
				tmpLabel2.Alignment	:= taLeftJustify;
		end;
	end;

	// 分類
	for i:=1 to 10 do
    begin
		j := m_stBunruiItem [i].nMasterDivision;
		case (j-430) of
			1:
            begin
            	tmpLabel2 := ppDBBun1;
            	tmpLabel  := ppBun1;
            end;
			2:
            begin
            	tmpLabel2 := ppDBBun2;
            	tmpLabel  := ppBun2;
            end;
			3:
            begin
            	tmpLabel2 := ppDBBun3;
            	tmpLabel  := ppBun3;
            end;
			4:
            begin
            	tmpLabel2 := ppDBBun4;
            	tmpLabel  := ppBun4;
            end;
			5:
            begin
            	tmpLabel2 := ppDBBun5;
            	tmpLabel  := ppBun5;
            end;
            else
            	continue;
		end;
    	if  (m_stBunruiItem [i].nAdoptDivision <> 0) then						// 採用
		begin
        	tmpLabel.Text := m_stBunruiItem [i].strItemCaption;
			if	(m_stBunruiItem [i].nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
				tmpLabel2.Alignment	:= taRightJustify
			else																				// ｺｰﾄﾞ属性: 文字
				tmpLabel2.Alignment	:= taLeftJustify;
		end;
	end;
}
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.Add   ('SELECT hm.GCode, hm.LongName, hm.TStartDate, hm.TEndDate, ');
		SQL.Add   ('       seg01.GCode As seg01Code, seg01.SimpleName As seg01Name, bun01.GCode As bun01Code, bun01.Nmk As bun01Name, ');
		SQL.Add   ('       seg02.GCode As seg02Code, seg02.SimpleName As seg02Name, bun02.GCode As bun02Code, bun02.Nmk As bun02Name, ');
		SQL.Add   ('       seg03.GCode As seg03Code, seg03.SimpleName As seg03Name, bun03.GCode As bun03Code, bun03.Nmk As bun03Name, ');
		SQL.Add   ('       seg04.GCode As seg04Code, seg04.SimpleName As seg04Name, bun04.GCode As bun04Code, bun04.Nmk As bun04Name, ');
		SQL.Add   ('       seg05.GCode As seg05Code, seg05.SimpleName As seg05Name, bun05.GCode As bun05Code, bun05.Nmk As bun05Name, ');
		SQL.Add   ('       seg06.GCode As seg06Code, seg06.SimpleName As seg06Name, bun06.GCode As bun06Code, bun06.Nmk As bun06Name, ');
		SQL.Add   ('       seg07.GCode As seg07Code, seg07.SimpleName As seg07Name, bun07.GCode As bun07Code, bun07.Nmk As bun07Name, ');
		SQL.Add   ('       seg08.GCode As seg08Code, seg08.SimpleName As seg08Name, bun08.GCode As bun08Code, bun08.Nmk As bun08Name, ');
		SQL.Add   ('       seg09.GCode As seg09Code, seg09.SimpleName As seg09Name, bun09.GCode As bun09Code, bun09.Nmk As bun09Name, ');
		SQL.Add   ('       seg10.GCode As seg10Code, seg10.SimpleName As seg10Name, bun10.GCode As bun10Code, bun10.Nmk As bun10Name  ');
		SQL.Add   ('FROM HojyoMA hm ');

        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg01 ');
		SQL.Add   ('  ON   seg01.MasterKbn = 101 and hm.SegNCode1 = seg01.NCode and seg01.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg02 ');
		SQL.Add   ('  ON   seg02.MasterKbn = 102 and hm.SegNCode2 = seg02.NCode and seg02.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg03 ');
		SQL.Add   ('  ON   seg03.MasterKbn = 103 and hm.SegNCode3 = seg03.NCode and seg03.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg04 ');
		SQL.Add   ('  ON   seg04.MasterKbn = 104 and hm.SegNCode4 = seg04.NCode and seg04.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg05 ');
		SQL.Add   ('  ON   seg05.MasterKbn = 105 and hm.SegNCode5 = seg05.NCode and seg05.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg06 ');
		SQL.Add   ('  ON   seg06.MasterKbn = 106 and hm.SegNCode6 = seg06.NCode and seg06.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg07 ');
		SQL.Add   ('  ON   seg07.MasterKbn = 107 and hm.SegNCode7 = seg07.NCode and seg07.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg08 ');
		SQL.Add   ('  ON   seg08.MasterKbn = 108 and hm.SegNCode8 = seg08.NCode and seg08.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg09 ');
		SQL.Add   ('  ON   seg09.MasterKbn = 109 and hm.SegNCode9 = seg09.NCode and seg09.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN HojyoMA seg10 ');
		SQL.Add   ('  ON   seg10.MasterKbn = 110 and hm.SegNCode10 = seg10.NCode and seg10.RDelKbn = 0 ');

        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun01 ');
		SQL.Add   ('  ON   bun01.SetNm = :SetNM01 and hm.BunruiNCode1 = bun01.NCode and bun01.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun02 ');
		SQL.Add   ('  ON   bun02.SetNm = :SetNM02 and hm.BunruiNCode2 = bun02.NCode and bun02.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun03 ');
		SQL.Add   ('  ON   bun03.SetNm = :SetNM03 and hm.BunruiNCode3 = bun03.NCode and bun03.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun04 ');
		SQL.Add   ('  ON   bun04.SetNm = :SetNM04 and hm.BunruiNCode4 = bun04.NCode and bun04.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun05 ');
		SQL.Add   ('  ON   bun05.SetNm = :SetNM05 and hm.BunruiNCode5 = bun05.NCode and bun05.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun06 ');
		SQL.Add   ('  ON   bun06.SetNm = :SetNM06 and hm.BunruiNCode6 = bun06.NCode and bun06.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun07 ');
		SQL.Add   ('  ON   bun07.SetNm = :SetNM07 and hm.BunruiNCode7 = bun07.NCode and bun07.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun08 ');
		SQL.Add   ('  ON   bun08.SetNm = :SetNM08 and hm.BunruiNCode8 = bun08.NCode and bun08.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun09 ');
		SQL.Add   ('  ON   bun09.SetNm = :SetNM09 and hm.BunruiNCode9 = bun09.NCode and bun09.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun10 ');
		SQL.Add   ('  ON   bun10.SetNm = :SetNM10 and hm.BunruiNCode10 = bun10.NCode and bun10.RDelKbn = 0 ');

		SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and hm.RDelKbn = 0 ');

        SQL.Add	  ('AND (');
        SQL.Add   (' EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg01, SegMA ');
		SQL.Add   ('  WHERE seg01.MasterKbn = 101 and hm.SegNCode1 = seg01.NCode and seg01.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse1 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg02, SegMA ');
		SQL.Add   ('  WHERE seg02.MasterKbn = 102 and hm.SegNCode2 = seg02.NCode and seg02.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse2 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg03, SegMA ');
		SQL.Add   ('  WHERE seg03.MasterKbn = 103 and hm.SegNCode3 = seg03.NCode and seg03.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse3 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg04, SegMA ');
		SQL.Add   ('  WHERE seg04.MasterKbn = 104 and hm.SegNCode4 = seg04.NCode and seg04.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse4 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg05, SegMA ');
		SQL.Add   ('  WHERE seg05.MasterKbn = 105 and hm.SegNCode5 = seg05.NCode and seg05.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse5 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg06, SegMA ');
		SQL.Add   ('  WHERE seg06.MasterKbn = 106 and hm.SegNCode6 = seg06.NCode and seg06.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse6 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg07, SegMA ');
		SQL.Add   ('  WHERE seg07.MasterKbn = 107 and hm.SegNCode7 = seg07.NCode and seg07.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse7 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg08, SegMA ');
		SQL.Add   ('  WHERE seg08.MasterKbn = 108 and hm.SegNCode8 = seg08.NCode and seg08.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse8 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg09, SegMA ');
		SQL.Add   ('  WHERE seg09.MasterKbn = 109 and hm.SegNCode9 = seg09.NCode and seg09.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse9 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg10, SegMA ');
		SQL.Add   ('  WHERE seg10.MasterKbn = 110 and hm.SegNCode10 = seg10.NCode and seg10.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = :nMasterDivision and SegMA.SegUse10 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');

        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun01, MasterInfo ');
		SQL.Add   ('  WHERE bun01.SetNm = :SetNM01 and hm.BunruiNCode1 = bun01.NCode and bun01.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM01 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun02, MasterInfo ');
		SQL.Add   ('  WHERE bun02.SetNm = :SetNM02 and hm.BunruiNCode2 = bun02.NCode and bun02.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM02 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun03, MasterInfo ');
		SQL.Add   ('  WHERE bun03.SetNm = :SetNM03 and hm.BunruiNCode3 = bun03.NCode and bun03.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM03 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun04, MasterInfo ');
		SQL.Add   ('  WHERE bun04.SetNm = :SetNM04 and hm.BunruiNCode4 = bun04.NCode and bun04.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM04 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun05, MasterInfo ');
		SQL.Add   ('  WHERE bun05.SetNm = :SetNM05 and hm.BunruiNCode5 = bun05.NCode and bun05.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM05 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun06, MasterInfo ');
		SQL.Add   ('  WHERE bun06.SetNm = :SetNM06 and hm.BunruiNCode6 = bun06.NCode and bun06.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM06 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun07, MasterInfo ');
		SQL.Add   ('  WHERE bun07.SetNm = :SetNM07 and hm.BunruiNCode7 = bun07.NCode and bun07.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM07 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun08, MasterInfo ');
		SQL.Add   ('  WHERE bun08.SetNm = :SetNM08 and hm.BunruiNCode8 = bun08.NCode and bun08.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM08 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun09, MasterInfo ');
		SQL.Add   ('  WHERE bun09.SetNm = :SetNM09 and hm.BunruiNCode9 = bun09.NCode and bun09.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM09 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun10, MasterInfo ');
		SQL.Add   ('  WHERE bun10.SetNm = :SetNM10 and hm.BunruiNCode10 = bun10.NCode and bun10.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = :SetNM10 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
		SQL.Add   (') ');

		// コードによる範囲指定 050901 >>
        if ( uvHani.pvrRgType[0] <> 0 ) then									// 指定あり
        begin
            if ( uvHani.pvrStCode[0] <> '' ) then								// 開始指定
            begin
                SQL.Add('  AND  (hm.GCode >= :ExStCode)   ');
    			ParamByName('ExStCode').AsString   :=	uvHani.pvrStCode[0];
            end;

            if ( uvHani.pvrEdCode[0] <> '' ) then								// 終了のみ指定
            begin
                SQL.Add('  AND  (hm.GCode <= :ExEdCode)   ');
    			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
            end;
        end;
		// コードによる範囲指定 050901 <<
{
		// 適用期間による絞込 050901 >>
		SQL.Add   ('and hm.TStartDate <= :EdD ');							// 指定した期間より後に開始していない
		SQL.Add   ('and hm.TEndDate   >= :StD ');							// 指定した期間より前に終了していない
		// 適用期間による絞込 050901 <<
}
		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('SetNM01').AsInteger	:= 541+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM02').AsInteger	:= 542+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM03').AsInteger	:= 543+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM04').AsInteger	:= 544+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM05').AsInteger	:= 545+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM06').AsInteger	:= 546+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM07').AsInteger	:= 547+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM08').AsInteger	:= 548+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM09').AsInteger	:= 549+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('SetNM10').AsInteger	:= 550+(m_nCurrentMasterDiv - 31) * 10;
		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
{
		// 適用期間による絞込 050901 >>
		ParamByName ('EdD'  ).AsInteger	:= uvHani.pvrEdDate;
		ParamByName ('StD'  ).AsInteger	:= uvHani.pvrStDate;
		// 適用期間による絞込 050901 <<
}
		Open ();

		CmnMemDataPrintSegBun.Active	:= False;
		CmnMemDataPrintSegBun.Active	:= True;

		while  (not EOF) do
		begin
			CmnMemDataPrintSegBun.Append();

			strExCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			end;

			CmnMemDataPrintSegBun.FieldByName ('strExCodeDst').AsString		:= strExCode;
			CmnMemDataPrintSegBun.FieldByName ('strNameSimpleDst').AsString	:= GetFld ('LongName').AsString;

			if	(not GetFld ('TStartDate' ).IsNull)
            AND (GetFld ('TStartDate' ).AsDateTime <> MjsIntToDate(DEFDATE_START, #0)) then
				CmnMemDataPrintSegBun.FieldByName ('dtStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintSegBun.FieldByName ('dtStart').Clear;

			if	(not GetFld ('TEndDate'   ).IsNull)
            AND (GetFld ('TEndDate' ).AsDateTime <> MjsIntToDate(DEFDATE_END, #0))then
				CmnMemDataPrintSegBun.FieldByName ('dtEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintSegBun.FieldByName ('dtEnd'  ).Clear;

			// セグメント
            for i:=1 to 10 do
            begin
				strExCode	:= GetFld ('seg' + Format('%.2d',[i]) + 'Code').AsString;
                if strExCode = '' then							// 未設定
                	continue;

	            for j:=1 to 10 do
    	        begin
                	if i+100 = m_arAdoptInfo_Seg [j].nMasterDivision then
                    	break;
                end;

                if (m_arAdoptInfo_Seg [j].nAdoption = 0) then										// 採用なし
                	continue;

				if	(m_arAdoptInfo_Seg [j].nCodeAttribute <= 1) then
				begin
					case (m_arAdoptInfo_Seg [j].nCodeAttribute) of
						0:	strFormat	:= '%'  + IntToStr (m_arAdoptInfo_Seg [j].nCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_arAdoptInfo_Seg [j].nCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintSegBun.FieldByName ('strSeg' + Format('%.2d',[i]) + 'Code').AsString	:= strExCode;
				CmnMemDataPrintSegBun.FieldByName ('strSeg' + Format('%.2d',[i]) + 'Name').AsString	:= GetFld ('seg' + Format('%.2d',[i]) + 'Name').AsString;
			end;

			// 分類
            for i:=1 to 10 do
            begin
				strExCode	:= GetFld ('bun' + Format('%.2d',[i]) + 'Code').AsString;
                if strExCode = '' then							// 未設定
                	continue;

	            for j:=1 to 10 do
    	        begin
                	if i+540+(m_nCurrentMasterDiv - 31) * 10 = m_arAdoptInfo_HBr [j].nMasterDivision then
                    	break;
                end;

                if m_arAdoptInfo_HBr [j].nAdoption = 0 then	// 採用なし
                	continue;

				if	(m_arAdoptInfo_HBr [j].nCodeAttribute <= 1) then
				begin
					case (m_arAdoptInfo_HBr [j].nCodeAttribute) of
						0:	strFormat	:= '%'  + IntToStr (m_arAdoptInfo_HBr [j].nCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_arAdoptInfo_HBr [j].nCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintSegBun.FieldByName ('strBun' + Format('%.2d',[i]) + 'Code').AsString	:= strExCode;
				CmnMemDataPrintSegBun.FieldByName ('strBun' + Format('%.2d',[i]) + 'Name').AsString	:= GetFld ('bun' + Format('%.2d',[i]) + 'Name').AsString;
            end;

			CmnMemDataPrintSegBun.Post();

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnPrintCheckListExtDetails ()				                                */
//*																									*/
//*	目的	: 補助登録処理 実在xxxx登録ﾘｽﾄ(詳細)印刷処理											*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnPrintCheckListExtDetails ();
var
	dqMasterData: TMQuery;
	strHojCode	: String;
	strFormat	: String;

//	b_Start		: Boolean;
//	b_End		: Boolean;
begin
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
		CmnReportExtDetailsCstDBTextCode.Alignment	:= taRightJustify
	else																				// ｺｰﾄﾞ属性: 文字
		CmnReportExtDetailsCstDBTextCode.Alignment	:= taLeftJustify;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT * FROM HojyoMA hm                                  ');
		SQL.Add ('LEFT OUTER JOIN CSInfo ci                                 ');
        SQL.Add ('  ON hm.MasterKbn = ci.MasterKbn and hm.NCode = ci.NCode  ');
		SQL.Add ('LEFT OUTER JOIN MFusenInfo fi                             ');
        SQL.Add ('  ON hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode  ');
		SQL.Add ('WHERE hm.MasterKbn = :nMasterDivision AND hm.SumKbn = 0   ');
        SQL.Add ('  AND hm.RDelKbn   = 0  AND hm.NCode >= :strExCodeStr     ');
		SQL.Add ('  AND hm.NCode <= :strExCodeEnd                           ');

        //--- HIS0042 St ------
        if m_nCurrentMasterDiv = 22 then
        begin
            //得意先のみ採用
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = FALSE) and (m_NoCheck = FALSE) then
                SQL.Add('and hm.HojyoKbn1 = 1 ')
            //仕入先のみ採用
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = FALSE) then
                SQL.Add('and hm.HojyoKbn2 = 1 ')
            //得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE)  then
                SQL.Add('and hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0 ')
            //得意先・仕入先採用
            else
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = FALSE) then
                SQL.Add('and (hm.HojyoKbn1 = 1 or hm.HojyoKbn2 = 1) ')
            //得意先採用又は得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = TRUE)  and (m_SiiresakiCheck = FALSE) and (m_NoCheck = TRUE)  then
                SQL.Add('and (hm.HojyoKbn1 = 1 or (hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0)) ')
            //仕入先採用又は得意先・仕入先の採用なし
            else
            if (m_TokuisakiCheck = FALSE) and (m_SiiresakiCheck = TRUE)  and (m_NoCheck = TRUE)  then
                SQL.Add('and (hm.HojyoKbn2 = 1 or (hm.HojyoKbn1 = 0 and hm.HojyoKbn2 = 0)) ');
        end;
        //--- HIS0042 Ed -------

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
            SQL.ADD ('ORDER BY hm.Renso, hm.GCode');  

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
		ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ

		Open ();

		CmnMemDataPrintExtDetailsCst.Active	:= FALSE;
		CmnMemDataPrintExtDetailsCst.Active	:= TRUE;

		while  (not EOF) do
		begin

			CmnMemDataPrintExtDetailsCst.Append;

			strHojCode	:= FieldByName ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strHojCode	:= Format (strFormat, [StrToInt64 (Trim (strHojCode))]);
			end;

			CmnMemDataPrintExtDetailsCst.FieldByName ('strExCode'             ).AsString	:= strHojCode;
			CmnMemDataPrintExtDetailsCst.FieldByName ('grTag'                 ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			CmnMemDataPrintExtDetailsCst.FieldByName ('strAssociation'        ).AsString	:= GetFld ('RenChar'     ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strNameSimple'         ).AsString	:= GetFld ('SimpleName'  ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strName'               ).AsString	:= GetFld ('LongName'    ).AsString;

			if	((FieldByName ('ZipCode1').AsInteger = 0) and (FieldByName ('ZipCode2').AsInteger = 0)) then
			begin
				CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeUpper').Clear ();
				CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeLower').Clear ();
			end
			else
			begin
				CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeUpper').AsInteger	:= FieldByName ('ZipCode1').AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeLower').AsInteger	:= FieldByName ('ZipCode2').AsInteger;
			end;

			CmnMemDataPrintExtDetailsCst.FieldByName ('strAddressUpper'       ).AsString	:= GetFld ('Address1'    ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strAddressLower'       ).AsString	:= GetFld ('Address2'    ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strPostName'           ).AsString	:= GetFld ('SectionName' ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strChargeName'         ).AsString	:= GetFld ('PersonName'  ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strTelephoneNo'        ).AsString	:= GetFld ('TelNo'       ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeDebCustomer'    ).AsInteger	:= GetFld ('TDebitCash'  ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeCreCustomer'    ).AsInteger	:= GetFld ('TCreditCash' ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescDebCustomer').AsString	:= fnGetNameSimple (GetFld ('TDebitCash' ).AsInteger);
			CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescCreCustomer').AsString	:= fnGetNameSimple (GetFld ('TCreditCash').AsInteger);
			CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeDebSupplier'    ).AsInteger	:= GetFld ('SDebitCash'  ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeCreSupplier'    ).AsInteger	:= GetFld ('SCreditCash' ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescDebSupplier').AsString	:= fnGetNameSimple (GetFld ('SDebitCash' ).AsInteger);
			CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescCreSupplier').AsString	:= fnGetNameSimple (GetFld ('SCreditCash').AsInteger);
			CmnMemDataPrintExtDetailsCst.FieldByName ('nTaxCodeSales'         ).AsInteger	:= GetFld ('STaxCode'    ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('nTaxCodeStock'         ).AsInteger	:= GetFld ('BTaxCode'    ).AsInteger;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strClassDesc'          ).AsString	:= fnGetClassDescription (GetFld ('BunCode').AsInteger);
			CmnMemDataPrintExtDetailsCst.FieldByName ('nLimitPrice'           ).AsCurrency	:= GetFld ('LimitSum'    ).AsCurrency;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDraftRank'          ).AsString	:= GetFld ('BillRank'    ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse01'       ).AsString	:= GetFld ('ClearHouse1' ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse02'       ).AsString	:= GetFld ('ClearHouse2' ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse03'       ).AsString	:= GetFld ('ClearHouse3' ).AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft01'      ).AsString	:= GetFld ('DrawerDraft1').AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft02'      ).AsString	:= GetFld ('DrawerDraft2').AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft03'      ).AsString	:= GetFld ('DrawerDraft3').AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft04'      ).AsString	:= GetFld ('DrawerDraft4').AsString;
			CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft05'      ).AsString	:= GetFld ('DrawerDraft5').AsString;

			if	((GetFld ('HojyoKbn1').AsInteger = 1) and (GetFld ('HojyoKbn2').AsInteger = 1)) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '得意先/仕入先'
			else
			begin
				if	(GetFld ('HojyoKbn1').AsInteger = 1) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '得意先';

				if	(GetFld ('HojyoKbn2').AsInteger = 1) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '仕入先';
			end;

			if	(GetFld ('RCloseDay1').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Rec').AsInteger	:= GetFld ('RCloseDay1').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Rec').Clear;

			if	(GetFld ('RCloseDay2').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Rec').AsInteger	:= GetFld ('RCloseDay2').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Rec').Clear;

			if	(GetFld ('RCloseDay3').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Rec').AsInteger	:= GetFld ('RCloseDay3').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Rec').Clear;

			if	(GetFld ('PCloseDay1').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Pay').AsInteger	:= GetFld ('PCloseDay1').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Pay').Clear;

			if	(GetFld ('PCloseDay2').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Pay').AsInteger	:= GetFld ('PCloseDay2').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Pay').Clear;

			if	(GetFld ('PCloseDay3').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Pay').AsInteger	:= GetFld ('PCloseDay3').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Pay').Clear;

			if	(GetFld ('RcvDay1').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Rec').AsInteger	:= GetFld ('RcvDay1').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Rec').Clear;

			if	(GetFld ('RcvDay2').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Rec').AsInteger	:= GetFld ('RcvDay2').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Rec').Clear;

			if	(GetFld ('RcvDay3').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Rec').AsInteger	:= GetFld ('RcvDay3').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Rec').Clear;

			if	(GetFld ('PayDay1').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Pay').AsInteger	:= GetFld ('PayDay1').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Pay').Clear;

			if	(GetFld ('PayDay2').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Pay').AsInteger	:= GetFld ('PayDay2').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Pay').Clear;

			if	(GetFld ('PayDay3').AsInteger <> 0) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Pay').AsInteger	:= GetFld ('PayDay3').AsInteger
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Pay').Clear;

			if	(not GetFld ('StartDate' ).IsNull) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateStart').AsDateTime	:= GetFld ('StartDate' ).AsDateTime
			else
				CmnMemDataPrintExtDetailsCst.FieldbyName ('dtAppDateStart').Clear;

			if	(not GetFld ('EndDate'   ).IsNull) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateEnd'  ).AsDateTime	:= GetFld ('EndDate'   ).AsDateTime
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateEnd'  ).Clear;

			if	(not GetFld ('UpdateTime').IsNull) then
				CmnMemDataPrintExtDetailsCst.FieldByName ('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdateTime').AsDateTime
			else
				CmnMemDataPrintExtDetailsCst.FieldByName ('dtUpdateDate'  ).Clear;

			case (GetFld ('STaxRate').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '標準税率';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '3％';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '5％';
			end;

			case (GetFld ('BTaxRate').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '標準税率';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '3％';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '5％';
			end;

			case (GetFld ('TitleKbn').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= 'なし';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '様';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '殿';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '御中';
			end;

			case (GetFld ('RcvMonth1').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('RcvMonth2').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('RcvMonth3').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('PayMonth1').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('PayMonth2').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('PayMonth3').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '当月';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '翌月';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '翌々月';
				3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '3ヶ月後';
				4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '4ヶ月後';
				5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '5ヶ月後';
				6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '6ヶ月後';
				7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '7ヶ月後';
				8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '8ヶ月後';
				9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '9ヶ月後';
			end;

			case (GetFld ('RHolidayKbn1').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '当日';
			end;

			case (GetFld ('RHolidayKbn2').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '当日';
			end;

			case (GetFld ('RHolidayKbn3').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '当日';
			end;

			case (GetFld ('PHolidayKbn1').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '当日';
			end;

			case (GetFld ('PHolidayKbn2').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '当日';
			end;

			case (GetFld ('PHolidayKbn3').AsInteger) of
				0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '翌営業日';
				1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '前営業日';
				2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '当日';
			end;

			CmnMemDataPrintExtDetailsCst.Post;

			NEXT;
		end;

		Close ();
	end;


{	with (dqMasterData) do
	begin
		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
		begin
			b_Start	:= TRUE;
			b_End	:= TRUE;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT * FROM HojyoMA hm ');
			SQL.Add   ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
			SQL.Add   ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.Add   ('WHERE hm.MasterKbn = :nMasterDivision AND hm.SumKbn = 0 AND hm.RecordKbn = 0 AND ');
			SQL.Add   ('      hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');
			SQL.ADD   ('ORDER BY hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始補助外部ｺｰﾄﾞ
			ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了補助外部ｺｰﾄﾞ

			Open ();
		end
		else
		begin
			b_Start	:= FALSE;
			b_End	:= FALSE;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT * FROM HojyoMA hm ');
			SQL.Add   ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
			SQL.Add   ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.GCode = fi.HojyoCode ');
			SQL.Add   ('WHERE hm.MasterKbn = :nMasterDivision AND hm.SumKbn = 0 AND hm.RecordKbn = 0 ');
			SQL.ADD   ('ORDER BY hm.RenChar, hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			Open ();
		end;

		CmnMemDataPrintExtDetailsCst.Active	:= FALSE;
		CmnMemDataPrintExtDetailsCst.Active	:= TRUE;

		while  (not EOF) do
		begin
			if FieldByName ('GCode').AsString = m_strExCodeScopeStr then
				b_Start	:= TRUE;

			if b_Start = FALSE then
				Next
			else
			begin
				CmnMemDataPrintExtDetailsCst.Append;

				strHojCode	:= FieldByName ('GCode').AsString;

				if	(m_nCurrentCodeAttr <= 1) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strHojCode	:= Format (strFormat, [StrToInt64 (Trim (strHojCode))]);
				end;

				CmnMemDataPrintExtDetailsCst.FieldByName ('strExCode'             ).AsString	:= strHojCode;
				CmnMemDataPrintExtDetailsCst.FieldByName ('grTag'                 ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
				CmnMemDataPrintExtDetailsCst.FieldByName ('strAssociation'        ).AsString	:= GetFld ('RenChar'     ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strNameSimple'         ).AsString	:= GetFld ('SimpleName'  ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strName'               ).AsString	:= GetFld ('LongName'    ).AsString;

				if	((FieldByName ('ZipCode1').AsInteger = 0) and (FieldByName ('ZipCode2').AsInteger = 0)) then
				begin
					CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeUpper').Clear ();
					CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeLower').Clear ();
				end
				else
				begin
					CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeUpper').AsInteger	:= FieldByName ('ZipCode1').AsInteger;
					CmnMemDataPrintExtDetailsCst.FieldByName ('nZipCodeLower').AsInteger	:= FieldByName ('ZipCode2').AsInteger;
				end;

				CmnMemDataPrintExtDetailsCst.FieldByName ('strAddressUpper'       ).AsString	:= GetFld ('Address1'    ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strAddressLower'       ).AsString	:= GetFld ('Address2'    ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strPostName'           ).AsString	:= GetFld ('SectionName' ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strChargeName'         ).AsString	:= GetFld ('PersonName'  ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strTelephoneNo'        ).AsString	:= GetFld ('TelNo'       ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeDebCustomer'    ).AsInteger	:= GetFld ('TDebitCash'  ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeCreCustomer'    ).AsInteger	:= GetFld ('TCreditCash' ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescDebCustomer').AsString	:= fnGetNameSimple (GetFld ('TDebitCash' ).AsInteger);
				CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescCreCustomer').AsString	:= fnGetNameSimple (GetFld ('TCreditCash').AsInteger);
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeDebSupplier'    ).AsInteger	:= GetFld ('SDebitCash'  ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('nExCodeCreSupplier'    ).AsInteger	:= GetFld ('SCreditCash' ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescDebSupplier').AsString	:= fnGetNameSimple (GetFld ('SDebitCash' ).AsInteger);
				CmnMemDataPrintExtDetailsCst.FieldByName ('strFundDescCreSupplier').AsString	:= fnGetNameSimple (GetFld ('SCreditCash').AsInteger);
				CmnMemDataPrintExtDetailsCst.FieldByName ('nTaxCodeSales'         ).AsInteger	:= GetFld ('STaxCode'    ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('nTaxCodeStock'         ).AsInteger	:= GetFld ('BTaxCode'    ).AsInteger;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strClassDesc'          ).AsString	:= fnGetClassDescription (GetFld ('BunCode').AsInteger);
				CmnMemDataPrintExtDetailsCst.FieldByName ('nLimitPrice'           ).AsCurrency	:= GetFld ('LimitSum'    ).AsCurrency;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDraftRank'          ).AsString	:= GetFld ('BillRank'    ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse01'       ).AsString	:= GetFld ('ClearHouse1' ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse02'       ).AsString	:= GetFld ('ClearHouse2' ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strClearHouse03'       ).AsString	:= GetFld ('ClearHouse3' ).AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft01'      ).AsString	:= GetFld ('DrawerDraft1').AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft02'      ).AsString	:= GetFld ('DrawerDraft2').AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft03'      ).AsString	:= GetFld ('DrawerDraft3').AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft04'      ).AsString	:= GetFld ('DrawerDraft4').AsString;
				CmnMemDataPrintExtDetailsCst.FieldByName ('strDrawerDraft05'      ).AsString	:= GetFld ('DrawerDraft5').AsString;

				if	((GetFld ('HojyoKbn1').AsInteger = 1) and (GetFld ('HojyoKbn2').AsInteger = 1)) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '得意先/仕入先'
				else
				begin
					if	(GetFld ('HojyoKbn1').AsInteger = 1) then
						CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '得意先';

					if	(GetFld ('HojyoKbn2').AsInteger = 1) then
						CmnMemDataPrintExtDetailsCst.FieldByName ('strAdoptDesc').AsString	:= '仕入先';
				end;

				if	(GetFld ('RCloseDay1').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Rec').AsInteger	:= GetFld ('RCloseDay1').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Rec').Clear;

				if	(GetFld ('RCloseDay2').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Rec').AsInteger	:= GetFld ('RCloseDay2').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Rec').Clear;

				if	(GetFld ('RCloseDay3').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Rec').AsInteger	:= GetFld ('RCloseDay3').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Rec').Clear;

				if	(GetFld ('PCloseDay1').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Pay').AsInteger	:= GetFld ('PCloseDay1').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay01Pay').Clear;

				if	(GetFld ('PCloseDay2').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Pay').AsInteger	:= GetFld ('PCloseDay2').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay02Pay').Clear;

				if	(GetFld ('PCloseDay3').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Pay').AsInteger	:= GetFld ('PCloseDay3').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nClosingDay03Pay').Clear;

				if	(GetFld ('RcvDay1').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Rec').AsInteger	:= GetFld ('RcvDay1').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Rec').Clear;

				if	(GetFld ('RcvDay2').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Rec').AsInteger	:= GetFld ('RcvDay2').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Rec').Clear;

				if	(GetFld ('RcvDay3').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Rec').AsInteger	:= GetFld ('RcvDay3').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Rec').Clear;

				if	(GetFld ('PayDay1').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Pay').AsInteger	:= GetFld ('PayDay1').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay01Pay').Clear;

				if	(GetFld ('PayDay2').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Pay').AsInteger	:= GetFld ('PayDay2').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay02Pay').Clear;

				if	(GetFld ('PayDay3').AsInteger <> 0) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Pay').AsInteger	:= GetFld ('PayDay3').AsInteger
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('nExpectDay03Pay').Clear;

				if	(not GetFld ('StartDate' ).IsNull) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateStart').AsDateTime	:= GetFld ('StartDate' ).AsDateTime
				else
					CmnMemDataPrintExtDetailsCst.FieldbyName ('dtAppDateStart').Clear;

				if	(not GetFld ('EndDate'   ).IsNull) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateEnd'  ).AsDateTime	:= GetFld ('EndDate'   ).AsDateTime
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('dtAppDateEnd'  ).Clear;

				if	(not GetFld ('UpdateTime').IsNull) then
					CmnMemDataPrintExtDetailsCst.FieldByName ('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdateTime').AsDateTime
				else
					CmnMemDataPrintExtDetailsCst.FieldByName ('dtUpdateDate'  ).Clear;

				case (GetFld ('STaxRate').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '標準税率';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '3％';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescSales').AsString	:= '5％';
				end;

				case (GetFld ('BTaxRate').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '標準税率';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '3％';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strTaxDescStock').AsString	:= '5％';
				end;

				case (GetFld ('TitleKbn').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= 'なし';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '様';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '殿';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strRespectDesc').AsString	:= '御中';
				end;

				case (GetFld ('RcvMonth1').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Rec').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('RcvMonth2').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Rec').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('RcvMonth3').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Rec').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('PayMonth1').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc01Pay').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('PayMonth2').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc02Pay').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('PayMonth3').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '当月';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '翌月';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '翌々月';
					3:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '3ヶ月後';
					4:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '4ヶ月後';
					5:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '5ヶ月後';
					6:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '6ヶ月後';
					7:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '7ヶ月後';
					8:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '8ヶ月後';
					9:	CmnMemDataPrintExtDetailsCst.FieldByName ('strExpectMonthDesc03Pay').AsString	:= '9ヶ月後';
				end;

				case (GetFld ('RHolidayKbn1').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Rec').AsString	:= '当日';
				end;

				case (GetFld ('RHolidayKbn2').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Rec').AsString	:= '当日';
				end;

				case (GetFld ('RHolidayKbn3').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Rec').AsString	:= '当日';
				end;

				case (GetFld ('PHolidayKbn1').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc01Pay').AsString	:= '当日';
				end;

				case (GetFld ('PHolidayKbn2').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc02Pay').AsString	:= '当日';
				end;

				case (GetFld ('PHolidayKbn3').AsInteger) of
					0:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '翌営業日';
					1:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '前営業日';
					2:	CmnMemDataPrintExtDetailsCst.FieldByName ('strHolidayDesc03Pay').AsString	:= '当日';
				end;

				CmnMemDataPrintExtDetailsCst.Post;

				if b_End = FALSE then
				begin
					if (FieldByName ('GCode').AsString = m_strExCodeScopeEnd) then
    					break
					else
						Next;
				end
				else
					NEXT;
			end;
		end;

		Close ();
	end;
}
	dqMasterData.Free ();
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnSetSystemRecords ()														*/
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ印刷用ﾚｺｰﾄﾞｾｯﾄ処理												*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP016000f.fnSetSystemRecords ();
var
	dqMasterData: TMQuery;
	nRecords	: Integer;
//<061>		strExCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	nRecords	:= 0;

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear;
        SQL.ADD ('SELECT hm.GCode, hm.SimpleName FROM HojyoTree ht, HojyoMA hm        ');
		SQL.ADD ('WHERE  ht.MasterKbn = :nMasterDivision AND hm.Masterkbn = ht.MasterKbn    ');
		SQL.ADD ('  AND  hm.RDelKbn   = 0                AND ht.SumNCode  = :strExCodeDst   ');
        SQL.Add ('  AND  hm.NCode     = ht.BasedNCode                                       ');
		SQL.ADD ('ORDER BY EntNo                                                            ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('strExCodeDst'   ).AsFloat 	:= m_stPrintDstData.strExNCode;

		Open ();

		while (not EOF) do
		begin
			fnSetSystemRecord (dqMasterData);

			nRecords	:= nRecords + 1;

			NEXT;
		end;

		Close ();
    end;

	if	(nRecords = 0) then
	begin
		CmnMemDataPrintSystem.Append;
		CmnMemDataPrintSystem.FieldByName ('strExCodeDst'    ).AsString	:= m_stPrintDstData.strExCode;
		CmnMemDataPrintSystem.FieldByName ('strNameSimpleDst').AsString	:= m_stPrintDstData.strNameSimple;
		CmnMemDataPrintSystem.Post;
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP016000f.fnSetSystemRecord (TMQuery)												*/
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ印刷用ﾚｺｰﾄﾞｾｯﾄ処理												*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterTree  = 補助加算体系ﾏｽﾀ用ｸｴﾘｰ                                                 */
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP016000f.fnSetSystemRecord (dqMasterData: TMQuery);
var
    strExCode: String;
	strFormat: String;

begin
	with (dqMasterData) do
	begin
		strExCode	:= GetFld ('GCode').AsString;

		if	(m_nCurrentCodeAttr <= 1) then
		begin
			case (m_nCurrentCodeAttr) of
				0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
				1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
			end;

			strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
		end;

		CmnMemDataPrintSystem.Append;

		CmnMemDataPrintSystem.FieldByName ('strExCodeDst'    ).AsString	:= m_stPrintDstData.strExCode;
		CmnMemDataPrintSystem.FieldByName ('strNameSimpleDst').AsString	:= m_stPrintDstData.strNameSimple;
		CmnMemDataPrintSystem.FieldByName ('strExCodeSrc'    ).AsString	:= strExCode;
		CmnMemDataPrintSystem.FieldByName ('strNameSimpleSrc').AsString	:= GetFld ('SimpleName').AsString;

		CmnMemDataPrintSystem.Post;
	end;
end;

procedure TJNTCRP016000f.DtlCmnEditExCodeExit(Sender: TObject);
begin

//<017>    fnSetFncType(1);    //<005>
end;

//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ<007>
//*		Name		:
//*		Date		:	2005/07/14
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP016000f.ArrowClick(Sender: TObject);
var
    lvExpSend   :   rcJNTExpSend;
    lvExpRecv   :   rcJNTExpRecv;
    iExpRtn     :   Integer;
    CompName    :   String;
    sSQL        :   String;
    nFieldID    :   Integer;
begin

    CompName    :=  TComponent(Sender).name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;                             // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;                       // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    // 汎用補助
    if ( CompName = 'DtlCmnEditExCodeNumeric' ) or
       ( CompName = 'DtlCmnEditExCodeFree'    ) then
    begin

        lvExpSend.MasterKbn     :=  m_nCurrentMasterDiv;
        lvExpSend.ModulKbn      :=  0;
        lvExpSend.PatternNo     :=  1;
        lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TableName     :=  'HOJYOMA';
        sSQL                    :=  ' HojyoMA.MasterKbn = ' + intTostr(m_nCurrentMasterDiv) +
                                    ' AND HojyoMA.RDelKbn = 0 ';
        if ( DtlCmnTab.Items[0].Selected ) then
    		sSQL	:= sSQL + 'AND HojyoMA.SumKbn = 0 '
    	else
    		sSQL	:= sSQL + 'AND HojyoMA.SumKbn = 1';

        lvExpSend.WhereStr      :=  sSQL;
        lvExpSend.SortStr       :=  'Order By HojyoMA.GCode';
        lvExpSend.TrRootCaption :=  '';

    end
    // ｾｸﾞﾒﾝﾄ
    else if ( Copy(CompName,1,20) =  'Jituzai_ETEdit_SegCd' )  then
    begin

        nFieldID                :=  StrToInt(Copy(CompName,21,2));
        lvExpSend.MasterKbn     :=  m_arAdoptInfo_Seg [nFieldID].nMasterDivision;
        lvExpSend.ModulKbn      :=  0;
        lvExpSend.PatternNo     :=  1;
        lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TableName     :=  'HOJYOMA';
        lvExpSend.WhereStr      :=  ' HojyoMA.MasterKbn = ' + intTostr(m_arAdoptInfo_Seg [nFieldID].nMasterDivision) +
                                    ' AND HojyoMA.RDelKbn = 0 And HojyoMA.SumKbn = 0';
        lvExpSend.SortStr       :=  'Order By HojyoMA.GCode';
        lvExpSend.TrRootCaption :=  '';

    end
    // 汎用補助分類
    else if ( Copy(CompName,1,20) =  'Jituzai_ETEdit_BunCd' )  then
    begin
        nFieldID                :=  StrToInt(Copy(CompName,21,2));
        lvExpSend.MasterKbn     :=  m_arAdoptInfo_HBr [nFieldID].nMasterDivision;
        lvExpSend.ModulKbn      :=  0;
        lvExpSend.PatternNo     :=  1;
        lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TableName     :=  'MMEISHO';
        lvExpSend.WhereStr      :=  ' MMEISHO.SetNm = ' + intTostr(m_arAdoptInfo_HBr [nFieldID].nMasterDivision) +
                                    ' AND MMEISHO.RDelKbn = 0 ';
        lvExpSend.SortStr       :=  'Order By MMEISHO.GCode';
        lvExpSend.TrRootCaption :=  '';
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin

        if ( Sender is TMNumEdit ) then
        begin
           TMNumEdit(MJSFindCtrl(Self,CompName )).value := StrToFloat(lvExpRecv.GCode);
        end
        else if ( Sender is TMTxtEdit ) then
        begin
           TMTxtEdit(MJSFindCtrl(Self,CompName )).Text := lvExpRecv.GCode;
        end;

        if ( Copy(CompName,1,20) =  'Jituzai_ETEdit_SegCd' )  then
        begin
            nFieldID    :=  StrToInt(Copy(CompName,21,2));
            TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_SegNm' + IntToStr(nFieldID))).Caption := lvExpRecv.NMK;
        end
        else if Copy(CompName,1,20) =  'Jituzai_ETEdit_BunCd'  then
        begin
            nFieldID    :=  StrToInt(Copy(CompName,21,2));
            TMLabel  (MJSFindCtrl(Self, 'Jituzai_LLabel_BunNm' + IntToStr(nFieldID))).Caption := lvExpRecv.NMK;
        end;

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);


		Abort;
    end;

end;
//**********************************************************************
//*		Proccess	:	権限取得  <012>
//**********************************************************************
procedure TJNTCRP016000f.fnGetGrants();
begin

    m_cJNTArea.FxPermission;    // 権限取得

	// 051025 hirota >>
    // 印刷復活
    // <PEF> CmnToolbarButtonPrint.enabled := m_cJNTArea.IsPrint;
    // CmnToolbarButtonPrint.enabled := False;         // <PEF>
    CmnToolbarButtonPrint.enabled := m_cJNTArea.IsPrint;
	// 051025 hirota <<

    // 決算確定時
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then
    begin
        giReferFlag	:= REFER;   // 参照ﾓｰﾄﾞ
        m_IsUpdate  := False;
    end
    else
	begin
        // <031> if ( m_cJNTArea.IsAppend and m_cJNTArea.IsModify ) then
        if ( m_cJNTArea.IsAppend or m_cJNTArea.IsModify ) then  // <031>
                m_IsUpdate := True
        else    m_IsUpdate := False;

		if ( m_IsUpdate ) then
	            giReferFlag	:= NORMAL   // 通常処理
		else    giReferFlag	:= REFER;	// 更新権限無

        // ↓<041> ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
        // 参照権限の場合は以下の処理は行わない。
        if ( giReferFlag = REFER ) then Exit;

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
                    giReferFlag	:= NORMAL;  // 通常ﾓｰﾄﾞ
                end
                else
                begin
                    // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                    // ﾏｽﾀをUpdata、Insertすることはできない。
                    m_cJNTArea.Invalidity;
                    giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                    m_IsUpdate  := false;
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
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end;
        end;
        // ↑<041>
	end;

end;
//***************************************************************************************************/
//*<015>                                                                                            */
//*	関数	: TJNTCRP016000f.fnCheckMasterTreeInsertValid (String; String)	                        */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 挿入ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	= 挿入(加算)元補助外部ｺｰﾄﾞ                                  		    */
//*			  strExCodeDst  = 挿入(加算)先補助外部ｺｰﾄﾞ								                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP016000f.fnCheckMasterTreeInsertValidStr (strExCodeSrc, strExCodeDst: String): Boolean;
var
    nCount   : Integer;
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
begin

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

		if  (CompareStr (stWorkRec^.strExCode, strExCodeDst) = 0) then
        begin
            cNode       := CmnTreeView.Items [nCount - 1];
            stWorkRec   := cNode.Data;

            if  ((stWorkRec^.nDivision = 0) or (stWorkRec^.nDIvision = DIVISION_GENERAL)) then
            begin
                cNode       := cNode.Parent;
                stWorkRec   := cNode.Data;
            end;

			while (TRUE) do
            begin
				if  (CompareStr (stWorkRec^.strExCode, strExCodeSrc) = 0) then
                begin
					Result	:= FALSE;
					Exit;
                end;

                cNode   := cNode.Parent;

                if  (cNode = nil) then
                    break
                else
                    stWorkRec   := cNode.Data;
            end;
        end;
    end;

	Result	:= TRUE;

end;

//<028>
//-----------------------------------------------------------------------------
// CmnInstructionComboExit()
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :OnExitｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TJNTCRP016000f.CmnInstructionComboExit(Sender: TObject);
begin

     if  m_nCurrentMasterDiv <> 0 then
     begin
        CmnToolbarButtonPrint.Enabled   := m_cJNTArea.IsPrint;
        B_Search.Enabled                := TRUE;
     end
     else
     begin
        CmnToolbarButtonPrint.Enabled   := FALSE;
        B_Search.Enabled                := FALSE;
     end;

end;
 //<028>

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/07
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     iMKbn   : ﾏｽﾀ区分
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP016000f.fnDelCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;
    try
        SPMasHoj.Connection := m_cDBSelect;
        //SPMasHoj.SessionName := m_cDBSelect.SessionName;

        // 【会計】MP_MAS_CHK_HOJYOMA
        with SPMasHoj do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
            ParamByName('@MasterKbn').AsInteger := iMKbn;
// Delphi10 ST
            FetchOptions.Items := FetchOptions.Items - [fimeta];
// Delphi10 ED
            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_MAS_CHK_HOJYOMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    try
        SPPayHoj.Connection := m_cDBSelect;
        //SPPayHoj.SessionName := m_cDBSelect.SessionName;

        // 【債務】MP_PAY_CHK_HOJYOMA
        with SPPayHoj do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
            ParamByName('@MasterKbn').AsInteger := iMKbn;
// Delphi10 ST
            FetchOptions.Items := FetchOptions.Items - [fimeta];
// Delphi10 ED
            ExecProc;                       // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                            // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_PAY_CHK_HOJYOMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<057>
//	Name		:	T.Seki
//	Date		:	2008/02/08
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP016000f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
	SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
	SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
	SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
	SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pRec^.m_iProgramCode;

// Delphi10 ST
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 SED

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

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

//**************************************************************************
//	Proccess	:	名称から改行コードを削除する  <DKAI>
//	Name		:	E.Nanba
//	Date		:	2008 / 08 / 27
//	Parameter	:	sData
//	Retrun		:	String
//	History		:	2001 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP016000f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.






