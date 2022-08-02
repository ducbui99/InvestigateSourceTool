//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登録　販売情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上 佳美(LEAD)
//      作成日      ：
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <100>   井上 佳美   2005/07/15(Fri) ﾃﾝﾌﾟﾚｰﾄ機能を追加。
//  <101>   井上 佳美   2005/07/25(Mon) 販売系のｽﾄｱﾄﾞﾌﾟﾛｼｼﾞｬ機能を追加（PRC_MA0130_106）。
//  <102>   井上 佳美   2005/08/01(Mon) 権限の参照制御を追加。
//  <103>   井上 佳美   2005/08/12(FRI) JNTCommonを親から引き継ぐように修正。
//  <104>   高橋 功二   2005/08/24(Wed) TMJSAppRecordを親から引き継ぐように修正。
//  <105>   高橋 功二   2005/08/25(Thu) ﾃﾝﾌﾟﾚｰﾄ区分(TemplateKbn)の考慮。
//  <PRN>   茂木 勇次   2008/08/26(FRI) 印刷機能の追加。
//  <106>   高橋 功二   2005/09/06(Tue) 印刷機能の正式実装まで印刷ﾎﾞﾀﾝをDisableする。
//  <107>   高橋 功二   2005/09/13(TUE) 細目科目がﾌﾘｰ属性の場合、禁則文字入力を考慮する。
//  <108>   茂木 勇次   2005/09/28(WED) 担当者ｺｰﾄﾞを得意先,仕入先(HAPSC.KBN)で分ける。
//  <109>   茂木 勇次   2005/09/28(WED) 切出/埋込ﾎﾞﾀﾝを継承し、子側で処理を行う。
//  <122>   飯塚 健介   2005/10/21(FRI) ０ｺｰﾄﾞ入力可能。
//  <123>   飯塚 健介   2005/10/21(FRI) <107>補足。
//  <124>   加藤(PRIME) 2005/10/26(WED) 終了確認機能追加。
//  <125>   加藤(PRIME) 2005/11/07(MON) ExpFreeが複数回呼ばれる不具合修正。
//  <126>   加藤(PRIME) 2005/12/07(WED) 得意先のExpに抽出条件追加。
//  <127>   加藤(PRIME) 2005/12/08(TUE) MasKbn=2のﾃﾞｰﾀがある時に印刷を実行したときの不具合修正。
//	<HAN>   広田(PRIME)	2005/12/08(THU)	印刷時の範囲指定修正。
//  <128>   加藤(PRIME) 2005/12/16(FRI) 取引先Expは実在/合計。
//  <129>   飯塚 健介   2006/01/20(FRI) Endｷｰで次頁ﾎﾞﾀﾝへ。使用不可なら更新ﾎﾞﾀﾝへ。
//  <130>   茂木 勇次   2006/02/01(WED) 得意先・仕入先簡略ﾘｽﾄ対応。
//                                      ※帳票(詳細型/簡略型)で合計得意先・仕入先も出力する。
//  <131>   茂木 勇次   2006/02/08(WED) 評価ﾚﾎﾟｰﾄ(SHM19-024)対応。
//	<132>	長谷川耕平	2006/04/25(Tue)	販売評価ﾚﾎﾟｰﾄ【Gali0285】
//	<133>	長谷川耕平	2006/06/19(Mon)	ﾗｲｾﾝｽ考慮
//	<134>	長谷川耕平	2006/07/20(Thu)	拡張分類対応
//	<135>	藤塚正人	2007/01/24(Wed) 指定商品コードの属性が「数字」のとき、桁数は1～14桁の範囲でガードする。
//	<136>	藤塚正人	2007/01/29(Mon)	テンプレートに登録したコメントを削除できない。
//	<137>	藤塚正人	2007/02/02(Fri)	設定不可の桁数が入力された時のメッセージを添付のように変更してください。
//  <Vista> 新保一馬	2007.03.19(Mon) APのフォームのプロパティをClientHeightと、ClientWidthを調整しスクロールバーが出ないように設計。
//                                      スクロールボックスコンポーネント内のパネルの幅を調整します。
//  <138>   新保一馬	2007.04.16(Mon) _SELを更新時、常にupdateしている論理をやめて、なければinsertの論理も入れる。
//  <Rel>   新保一馬    2007/03/30(Fri) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <139>   新保一馬    2007/05/16(Wed) テンプレートに単価ランク、単価掛率を設定していても、新規登録したマスタにセットされない。(Gali0698)
//  <140>   新保一馬    2007/06/12(Tue) 参照ﾓｰﾄﾞのときは「F7 ﾃﾝﾌﾟﾚｰﾄ」の機能は無効にする。
//                                      イベントだけnilにしていただけで、ｷｬﾌﾟｼｮﾝが表示されていて、ﾌｧﾝｸｼｮﾝ押下でｴﾗｰになっていた。
//  <MHIS>  新保一馬    2008/01/09(Wed) ﾏｽﾀ更新履歴対応
//  <141>   LEAD M.Yamashita 2008/02/18 ホウエイ対応
//  <1133>  倉持  剛    2008/06/02(Mon) テンプレートで担当者の「敬称」を設定可能にする。(Gali1133)
//  <1120>  倉持  剛    2008/06/02(Mon) 国外仕入先の消費税端数単位・消費税端数処理を入力不可(グレー表示)対応(Gali1120)
//
//  ================== ↓Ver 3.00 リリース向け ===================================================
//
//  <142>   新保一馬    2008/12/03(Wed) 仕入先の消費税支払区分でNGのコードだったときのフォーカス復帰のパネルが間違っていた(得意先のパネルに戻ろうとしていた)(Gali1494)
//  <143>   新保一馬    2008/12/04(Thu) 仕入先のみの採用のとき、[仕入先入力・集計情報]タブでNGのコードを入力したまま更新ボタンが押せてしまう。
//  <PST2>  新保一馬	2008/12/15(MON) 郵便番号-枝番を0000を入力&表示させる対応。ただし、郵便番号-基番が000以外のときのみ。
//
//  <KOJ>   倉持  剛    2009/03/16(Mon) 工事ﾓｼﾞｭｰﾙが採用されている場合、得意先･仕入先印刷情報から各工事伝票情報を登録出来るように修正
//  <KOJ2>  倉持  剛    2009/04/28(Tue) 工事原価のPrgId修正 kg00 ⇒ gn00
//
// =================== ↓Ver 4.00 リリース向け ===================================================
//
//  <WAN>   新保一馬    2010.05.11(Tue) WAN環境におけるBPLキャッシュ対応
//
// =================== ↓Ver 4.01 リリース向け ===================================================
//
//  <KOJ3>  新保一馬    2010.09.03(Fri) 売上と仕入伝票フォームのEnbaled制御が、一緒になっていたのでわける。
//
// =================== ↓Ver 4.01差分 クイック様向け ===================================================
//
//  <MJUP>	新保一馬	2010.07.28(Wed)	名称文字数UP対応
//
// =================== ↓Ver 4.02 リリース向け ===================================================
//
//  <KOJ4>  新保一馬    2010.10.04(Mon) 販売ｼｽﾃﾑ＝なし、工事ｼｽﾃﾑ＝あり　の環境で、プロジェクトに工事の設定を行っていない場合
//										取引先登録の販売情報の入力が行なえなくなる項目がある。
//
// =================== ↓Ver 4.06 リリース向け ===================================================
//  <144>   大田原(MSI) 2011/05/13(Fri) 印刷モジュールをUnLoadしていなかった点を修正
//
//
//==================== ↓Ver4.05差分 アディスミューズ対応===============================
//
//  <2255>	吉田健吾	2011.11.18(Fri) アディスミューズ対応、印刷レイアウトにML型を追加する。
//										MemPrintにMLようのカラムを追加しました。
//==================== ↓Ver 4.08(NX-I5.01) リリース向け ===================================================
//
//	<2278>	吉田健吾	2012.02.03(Fri) ENTERキーで移動しなくなる現象が発生する。
//  <Gali2258>新保一馬  2011.12.16(Fri) 起動時エラーの回避(Gali2258)
//  <145>   新保一馬    2012.03.19(Mon) 検索Expからダブルクリックなどで、次フィールドにフォーカスが動かないことがある件を修正。
//
// =================== ↓Ver 4.09(NX-I5.02) リリース向け ===================================================
//
//  <2302>  中尾  晃    2012.05.02(Wed) 仕入先先頭項目からShift + Tab キーで得意先最終項目(採用していれば)に移動するように修正
//  <Authority>高橋功二 2012.07.24(TUE) サブモジュールの権限管理対応
//	<146>	高橋功二    2012.07.25(WED) 決算確定の判定は親側で行うため子でメッセージを出さない
//  ================== ↓Ver 4.13(NX-I 5.07) リリース向け ===================================================
//
//	<CD16>	柄松克弥	2014/01/17(Fri)	取引先コード16桁対応。パネル位置の変更
//
//	<147>	小川(NTC)   2015.04.01(Wed) 「情報区分：販売情報」の下記項目を入力不可にする条件追加。現在は販売/仕入管理の採用のみだが、債権/債務管理の採用も追加する。
//										・「得意先印刷情報」タブ…納品書ﾌｫｰﾑ、売上合計欄印字、上代合計欄印字、送り状ﾌｫｰﾑ
//										・「仕入先印刷情報」タブ…仕入伝票ﾌｫｰﾑ、仕入合計欄印字
//										基本情報、入力・集計情報はライセンス条件なしにする。（パネル、タブでの条件があるため）
//
//  <2466>   NTC新保    2015/04/30(Thu)	複数同一部門コードの対応
//                                     	同一外部コードの部門がある場合は、適用期間の新しいマスタを取得する。
//	<D10>	鈴木基男	2019.09.13(Fri)	Delphi10対応
//	<D10-U>	鈴木基男	2019.12.25(Wed)	Delphi10対応(UNICODE対応)
//	<PASS>	星野瑠惟	2021.12.08(Wed) PDF分割出力対応 パスワード項目の追加
//
//================================================================================
unit JNTCRP004004u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.ExtCtrls, DBCtrls, Buttons, VCL.StdCtrls, Db, FireDAC.Comp.Client, VCL.ImgList, Menus,  ComCtrls,
  ActnList, dxmdaset,

  MJSQuery, MJSTab, MJSBitBtn, MJSEdits, MJSPanel, MJSLabel, MJSFunctionBar,
  MJSSPFunctionBar, MJSSpeedButton, MJSComboBox, MJSStatusBar,

  MJSCommonu, MJSDateCtrl, MjsDBModuleu, MjsStrCtrl, MjsDispCtrl, CMNExpFuncU,
  MetaSpt, FXLicense,

  MjsMsgStdu,   // <Rel>

  JNTCommonu, JNTSelGlobal, JNTSelCorpSys, JNTMasComu, JNTFuncU, JNTExpGlobal,
  JNTPDlg,
  MLBplLoaderU, // <WAN>
  JNTAuthorityu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, FireDAC.Comp.DataSet,
  MJSRadioButton, MJSRadioGroup,// <Authority> ADD
  RegularExpressions,SeriesCheck3U;//<PASS>
  const
	WM_ONPAINT	= WM_APP + 1;	// OnPaint 時の処理起動ﾒｯｾｰｼﾞ用
//<141> ↓
    ucCL_UnEnableCtrl = $00F2F2F2;          //使用不可カラー
//<141> ↑

type
    // ﾌｧﾝｸｼｮﾝ制御用<100>
    urFncInfo = record
        Caption     :   array[0..7] of String;
        Action      :   array[0..7] of TAction;
    end;

    type TuvData_Load = record
        pvrYYKbn    :   Integer;      //和暦西暦区分
        pvrDaiNMKbn :   Integer;      //代表社名の印字
    end;

//↓<MJUP>
	// 個別ｶｽﾀﾏｲｽﾞ情報(識別が増えたらここに増やして使用してください)
	TSELCSTM_TBLRec = record
		GL06		: Boolean;
	end;
//↑<MJUP>

type
  {$include ActionInterface.inc} 		  // ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
  {$include JNTSELSystemArea.inc}         // 販売ｼｽﾃﾑ共通情報
  {$include JNTSelSubInterface.inc}       //
  {$include JNTSelPrtIF.inc}              // <PRN>
  {$include JNTCRPSyncMasterH.inc}        // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;


  TFrmJNTCRP004004F = class(TForm)
    Qry             : TFDQuery;
    Query_Chk: TFDQuery;
    QryMain         : TMQuery;
    MTab1           : TMTab;
    DtlPanel        : TMPanel;
    ScrollBox1      : TScrollBox;
    Query_MstCopy: TMQuery;
    tbsInput: TMPanel;
    Label9: TMLabel;
    Label29: TMLabel;
    Label32: TMLabel;
    Label46: TMLabel;
    f1TRIHIKIKBNNM: TMLabel;
    f1NMKBNNM: TMLabel;
    f1SSHCDKBNNM: TMLabel;
    Label57: TMLabel;
    MLabel13: TMLabel;
    f1TRIHIKIKBN: TMNumEdit;
    f1NMKBN: TMNumEdit;
    f1SSHCDKBN: TMNumEdit;
    f1SSHCDKET: TMNumEdit;
    tbsKihon: TMPanel;
    tbsPrint: TMPanel;
    Label1: TMLabel;
    f1YYKBNNM: TMLabel;
    Label38: TMLabel;
    f1DAINMKBNNM: TMLabel;
    Label3: TMLabel;
    f1USDENPFMNM: TMLabel;
    lbl_JHDENPFM: TMLabel;
    f1JHDENPFMNM: TMLabel;
    f1MITPFMNM: TMLabel;
    lbl_SNDENPFM: TMLabel;
    f1SNDENPFMNM: TMLabel;
    lbl_JYGKEI: TMLabel;
    f1JYGKEINM: TMLabel;
    lbl_USGKEI: TMLabel;
    f1USGKEINM: TMLabel;
    lbl_MITPFM: TMLabel;
    lab_SOFOPFM: TMLabel;
    f1SOFOPFMNM: TMLabel;
    MLabel1: TMLabel;
    MLabel3: TMLabel;
    MLabel11: TMLabel;
    f1YYKBN: TMNumEdit;
    f1DAINMKBN: TMNumEdit;
    f1USDENPFM: TMNumEdit;
    f1MITPFM: TMNumEdit;
    f1JHDENPFM: TMNumEdit;
    f1SNDENPFM: TMNumEdit;
    f1USGKEI: TMNumEdit;
    f1JYGKEI: TMNumEdit;
    f1SOFOPFM: TMNumEdit;
    Label15: TMLabel;
    f1URKINHSUKBNNM: TMLabel;
    Label18: TMLabel;
    f1ZHSUKBNNM: TMLabel;
    Label23: TMLabel;
    f1ZHSUTNIKBNNM: TMLabel;
    Label27: TMLabel;
    f1ZSEIKBNNM: TMLabel;
    Label33: TMLabel;
    f1GRUZSEIKBNNM: TMLabel;
    MLabel25: TMLabel;
    f1URKINHSUKBN: TMNumEdit;
    f1GRUZSEIKBN: TMNumEdit;
    f1ZSEIKBN: TMNumEdit;
    f1ZHSUKBN: TMNumEdit;
    f1ZHSUTNIKBN: TMNumEdit;
    tbsOther: TMPanel;
    tbsInputS: TMPanel;
    Label35: TMLabel;
    Label36: TMLabel;
    Label39: TMLabel;
    Label40: TMLabel;
    f1TRIHIKIKBNNM_Si: TMLabel;
    f1NMKBNNM_Si: TMLabel;
    f1SSHCDKBNNM_Si: TMLabel;
    Label45: TMLabel;
    MLabel17: TMLabel;
    Label50: TMLabel;
    f1URKINHSUKBNNM_Si: TMLabel;
    Label52: TMLabel;
    f1ZHSUKBNNM_Si: TMLabel;
    Label54: TMLabel;
    f1ZHSUTNIKBNNM_Si: TMLabel;
    Label56: TMLabel;
    f1ZSEIKBNNM_Si: TMLabel;
    Label59: TMLabel;
    f1GRUZSEIKBNNM_Si: TMLabel;
    MLabel19: TMLabel;
    f1TRIHIKIKBN_Si: TMNumEdit;
    f1NMKBN_Si: TMNumEdit;
    f1SSHCDKBN_Si: TMNumEdit;
    f1SSHCDKET_Si: TMNumEdit;
    f1URKINHSUKBN_Si: TMNumEdit;
    f1GRUZSEIKBN_Si: TMNumEdit;
    f1ZSEIKBN_Si: TMNumEdit;
    f1ZHSUKBN_Si: TMNumEdit;
    f1ZHSUTNIKBN_Si: TMNumEdit;
    tbsPrintS: TMPanel;
    Label41: TMLabel;
    f1YYKBNNM_Si: TMLabel;
    Label43: TMLabel;
    f1DAINMKBNNM_Si: TMLabel;
    Label53: TMLabel;
    f1USDENPFMNM_Si: TMLabel;
    Label58: TMLabel;
    f1JHDENPFMNM_Si: TMLabel;
    Label62: TMLabel;
    f1SNDENPFMNM_Si: TMLabel;
    Label66: TMLabel;
    f1USGKEINM_Si: TMLabel;
    MLabel23: TMLabel;
    MLabel27: TMLabel;
    f1YYKBN_Si: TMNumEdit;
    f1DAINMKBN_Si: TMNumEdit;
    f1USDENPFM_Si: TMNumEdit;
    f1JHDENPFM_Si: TMNumEdit;
    f1SNDENPFM_Si: TMNumEdit;
    f1USGKEI_Si: TMNumEdit;
    Blind_TK: TMPanel;
    Blind_SI: TMPanel;
    MPnlTop: TMPanel;
    LblTRCODE: TMLabel;
    f0CODE: TMTxtEdit;
    f0NM: TMTxtEdit;
    MLabel30: TMLabel;
    MLabel24: TMLabel;
    MLabel28: TMLabel;
    MLabel2: TMLabel;
    MLabel4: TMLabel;
    MLabel14: TMLabel;
    MLabel15: TMLabel;
    MLabel18: TMLabel;
    MLabel20: TMLabel;
    LblYUBIN: TMLabel;
    LblJUSHO1: TMLabel;
    LblJUSHO2: TMLabel;
    LblTEL: TMLabel;
    LblFAX: TMLabel;
    Label47: TMLabel;
    Label48: TMLabel;
    Label25: TMLabel;
    Label14: TMLabel;
    MLabel10: TMLabel;
    MLabel9: TMLabel;
    f1ADS1: TMTxtEdit;
    f1ADS2: TMTxtEdit;
    f1TEL1: TMTxtEdit;
    f1TEL2: TMTxtEdit;
    f1FAX1: TMTxtEdit;
    f1SectionName: TMTxtEdit;
    f1TanNM: TMTxtEdit;
    f1POSTNO1: TMNumEdit;
    f1POSTNO2: TMNumEdit;
    f1KeisyoKbn: TMTxtEdit;
    MLabel16: TMLabel;
    Label17: TMLabel;
    Label19: TMLabel;
    Label20: TMLabel;
    Label21: TMLabel;
    Label22: TMLabel;
    Label24: TMLabel;
    Label26: TMLabel;
    Label28: TMLabel;
    Label34: TMLabel;
    MLabel12: TMLabel;
    f1ADS1_Si: TMTxtEdit;
    f1ADS2_Si: TMTxtEdit;
    f1TEL1_Si: TMTxtEdit;
    f1TEL2_Si: TMTxtEdit;
    f1FAX1_Si: TMTxtEdit;
    f1SectionName_Si: TMTxtEdit;
    f1TanNM_Si: TMTxtEdit;
    f1POSTNO1_Si: TMNumEdit;
    f1POSTNO2_Si: TMNumEdit;
    f1KeisyoKbn_Si: TMTxtEdit;
    Blind_Othr_TK: TMPanel;
    MLabel26: TMLabel;
    Label77: TMLabel;
    Label81: TMLabel;
    f1MEMO1: TMTxtEdit;
    f1MEMO2: TMTxtEdit;
    MLabel40: TMLabel;
    Blind_Othr_Si: TMPanel;
    MLabel21: TMLabel;
    MLabel22: TMLabel;
    MLabel31: TMLabel;
    MLabel32: TMLabel;
    f1MEMO1_Si: TMTxtEdit;
    f1MEMO2_Si: TMTxtEdit;
    f1MailAd: TMTxtEdit;
    MLabel5: TMLabel;
    MLabel6: TMLabel;
    f1MailAd_Si: TMTxtEdit;
    MLabel33: TMLabel;
    MLabel34: TMLabel;
    MLabel35: TMLabel;
    MLabel36: TMLabel;
    MLabel37: TMLabel;
    MLabel38: TMLabel;
    MLabel39: TMLabel;
    MLabel41: TMLabel;
    MLabel42: TMLabel;
    MLabel43: TMLabel;
    MLabel44: TMLabel;
    MPanel3: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    stbStatusBar: TMStatusBar;
    aclExec: TActionList;
    AcTemplate: TAction;
    TempMode: TPanel;
    MPnlUr: TMPanel;
    MLabel57: TMLabel;
    Label2: TMLabel;
    Label31: TMLabel;
    f1TNKRNK: TMNumEdit;
    f1KAKERT: TMNumEdit;
    Label30: TMLabel;
    MPnlSi: TMPanel;
    MLabel45: TMLabel;
    MLabel46: TMLabel;
    MLabel47: TMLabel;
    MLabel48: TMLabel;
    f1TNKRNK_Si: TMNumEdit;
    f1KAKERT_Si: TMNumEdit;
    StdProc6: TFDStoredProc;
    StdProc6_S: TFDStoredProc;
    f1BMCODE: TMTxtEdit;
    f1TNCODE: TMTxtEdit;
    f1BMNAME: TMLabel;
    f1TNNAME: TMLabel;
    LblBMCODE: TMLabel;
    LblTNCODE: TMLabel;
    LblBMCODE_Si: TMLabel;
    LblTNCODE_Si: TMLabel;
    f1BMCODE_Si: TMTxtEdit;
    f1TNCODE_Si: TMTxtEdit;
    f1BMNAME_Si: TMLabel;
    f1TNNAME_Si: TMLabel;
    MemPrint: TdxMemData;
    MemPrintGCode: TStringField;
    MemPrintRenso: TStringField;
    MemPrintNmk: TStringField;
    MemPrintNm: TStringField;
    MemPrintPostNo1: TStringField;
    MemPrintPostNo2: TStringField;
    MemPrintAds1: TStringField;
    MemPrintAds2: TStringField;
    MemPrintTel1: TStringField;
    MemPrintSectNm: TStringField;
    MemPrintTanNm: TStringField;
    MemPrintTStartDate: TStringField;
    MemPrintTEndDate: TStringField;
    MemPrintUpdDateTM: TStringField;
    MemPrintMasKbn: TIntegerField;
    MemPrintMasKbnNm: TStringField;
    MemPrintTel2: TStringField;
    MemPrintFAX: TStringField;
    MemPrintBmNm: TStringField;
    MemPrintBmNCd: TStringField;
    MemPrintTnNCd: TStringField;
    MemPrintTnNm: TStringField;
    MemPrintUrKinHsuKbn: TIntegerField;
    MemPrintUrKinHsuKbnNm: TStringField;
    MemPrintGRuZSeiKbn: TIntegerField;
    MemPrintGRuZSeiKbnNm: TStringField;
    MemPrintZSeiKbn: TIntegerField;
    MemPrintZSeiKbnNm: TStringField;
    MemPrintZHsuTniKbn: TIntegerField;
    MemPrintZHsuTniKbnNm: TStringField;
    MemPrintZHsuKbn: TIntegerField;
    MemPrintZHsuKbnNm: TStringField;
    MemPrintTrihikiKbn: TIntegerField;
    MemPrintTrihikiKbnNm: TStringField;
    MemPrintNmKbn: TIntegerField;
    MemPrintNmKbnNm: TStringField;
    MemPrintTnkRnk: TIntegerField;
    MemPrintKakeRt: TFloatField;
    MemPrintSShCdKbn: TIntegerField;
    MemPrintSShCdKbnNm: TStringField;
    MemPrintSShCdKet: TIntegerField;
    MemPrintYYKbn: TIntegerField;
    MemPrintYYKbnNm: TStringField;
    MemPrintDaiNmKbn: TIntegerField;
    MemPrintDaiNmKbnNm: TStringField;
    MemPrintUSDENPFM: TIntegerField;
    MemPrintUSDENPFMNm: TStringField;
    MemPrintUSGKEI: TIntegerField;
    MemPrintUSGKEINm: TStringField;
    MemPrintJYGKEI: TIntegerField;
    MemPrintJYGKEINm: TStringField;
    MemPrintMITPFM: TIntegerField;
    MemPrintMITPFMNm: TStringField;
    MemPrintJHDENPFM: TIntegerField;
    MemPrintJHDENPFMNm: TStringField;
    MemPrintSNDENPFM: TIntegerField;
    MemPrintSNDENPFMNm: TStringField;
    MemPrintSOFOPFM: TIntegerField;
    MemPrintSOFOPFMNm: TStringField;
    MemPrintMemo1: TStringField;
    MemPrintMemo2: TStringField;
    MemPrintSumKbnNm: TStringField;
    MemPrintSumKbn: TSmallintField;
    MemPrintFkana: TStringField;
    MemPrintKeisyoKbn: TStringField;
    MemPrintgrTag: TGraphicField;
    H_MemPrintMailAddress: TStringField;
    MemPrintH_KeisyoKbn: TStringField;
    lblLineKKTK: TMLabel;
    lblTitleKKTK: TMLabel;
    fKKTKBRNM1: TMLabel;
    fKKTKBRNM2: TMLabel;
    f1KKTKBRCD1: TMTxtEdit;
    f1KKTKBRCD2: TMTxtEdit;
    f1KKTKBRNM1: TMLabel;
    f1KKTKBRNM2: TMLabel;
    lblLineKKSI: TMLabel;
    lblTitleKKSI: TMLabel;
    fKKSIBRNM1: TMLabel;
    fKKSIBRNM2: TMLabel;
    f1KKSIBRCD1: TMTxtEdit;
    f1KKSIBRCD2: TMTxtEdit;
    f1KKSIBRNM1: TMLabel;
    f1KKSIBRNM2: TMLabel;
    MemPrintKKBNCD1: TStringField;
    MemPrintKKBNNM1: TStringField;
    MemPrintKKBNCD2: TStringField;
    MemPrintKKBNNM2: TStringField;
    Image_Fusen_Glay: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Red: TImage;
    MBitBtnBefor: TMBitBtn;
    MBitBtnAfter: TMBitBtn;
    BtnUpd: TMBitBtn;
    BtnCan: TMBitBtn;
    SPMsHistParent: TFDStoredProc;
    SPMsHist: TFDStoredProc;
    MemPrintCountryKbn: TIntegerField;
    MemPrintCountryNm: TStringField;
    MemPrintCurrencyNm: TStringField;
    MemPrintCurrencyCd: TStringField;
    MLabel7: TMLabel;
    MLabel8: TMLabel;
    lbl_KOJDEN_Si: TMLabel;
    lbl_KUSDENPFM_Si: TMLabel;
    lbl_KJHDENPFM_Si: TMLabel;
    lbl_KUSGKEI_Si: TMLabel;
    f1KUSDENPFM_Si: TMNumEdit;
    f1KJHDENPFM_Si: TMNumEdit;
    f1KUSGKEI_Si: TMNumEdit;
    f1KUSDENPFMNM_Si: TMLabel;
    f1KJHDENPFMNM_Si: TMLabel;
    f1KUSGKEINM_Si: TMLabel;
    MLabel29: TMLabel;
    lbl_KUSDENPFM_Tk: TMLabel;
    lbl_KOJDEN_Tk: TMLabel;
    lbl_KMITPFM_Tk: TMLabel;
    lbl_KJHDENPFM_Tk: TMLabel;
    lbl_KUSGKEI_Tk: TMLabel;
    f1KUSDENPFM_Tk: TMNumEdit;
    f1KMITPFM_Tk: TMNumEdit;
    f1KJHDENPFM_Tk: TMNumEdit;
    f1KUSGKEI_Tk: TMNumEdit;
    f1KUSDENPFMNM_Tk: TMLabel;
    f1KMITPFMNM_Tk: TMLabel;
    f1KJHDENPFMNM_Tk: TMLabel;
    f1KUSGKEINM_Tk: TMLabel;
    MemPrintKUSDENPFM: TIntegerField;
    MemPrintKUSDENPFMNm: TStringField;
    MemPrintKMITPFM: TIntegerField;
    MemPrintKMITPFMNm: TStringField;
    MemPrintKJHDENPFM: TIntegerField;
    MemPrintKJHDENPFMNm: TStringField;
    MemPrintKUSGKEI: TIntegerField;
    MemPrintKUSGKEINm: TStringField;
    MemPrintSeiGCode: TStringField;
    MemPrintUsKinKbn: TIntegerField;
    MemPrintUsKinNM: TStringField;
    MemPrintRZuiSSite: TStringField;
    MemPrintRTSEINO: TStringField;
    MemPrintDHyoNm2: TStringField;
    MemPrintRHolidayKbnNM: TStringField;
    MemPrintSeiNMK: TStringField;
    MemPrintENDDD1: TStringField;
    MemPrintENDDD2: TStringField;
    MemPrintENDDD3: TStringField;
    MemPrintCYCLE1: TStringField;
    MemPrintCYCLE2: TStringField;
    MemPrintCYCLE3: TStringField;
    MemPrintKAISYUDD1: TStringField;
    MemPrintKAISYUDD2: TStringField;
    MemPrintKAISYUDD3: TStringField;
    lblPASS_H: TMLabel;
    lblPASSKBN: TMLabel;
    lblPASSITEMKBN: TMLabel;
    lblPLUS: TMLabel;
    f1PASSITEMKBN2: TMNumEdit;
    lblPASSWORD: TMLabel;
    f1PASSWORD: TMTxtEdit;
    btnMask: TMSpeedButton;
    lblAPIKBN: TMLabel;
    f1APIKBN: TMNumEdit;
    f1APIKBNNM: TMLabel;
    lblAPIKBN_Si: TMLabel;
    f1APIKBN_Si: TMNumEdit;
    f1APIKBNNM_Si: TMLabel;
    lblPASS_H_Si: TMLabel;
    lblPASSKBN_Si: TMLabel;
    lblPASSITEMKBN_Si: TMLabel;
    f1PASSITEMKBN1_Si: TMNumEdit;
    lblPLUS_Si: TMLabel;
    f1PASSITEMKBN2_Si: TMNumEdit;
    lblPASSWORD_Si: TMLabel;
    f1PASSWORD_Si: TMTxtEdit;
    btnMask_Si: TMSpeedButton;
    f1PASSKBN: TMNumEdit;
    f1PASSKBNNM: TMLabel;
    f1PASSKBNNM_Si: TMLabel;
    f1PASSKBN_Si: TMNumEdit;
    lblAPIKBN_H: TMLabel;
    lblAPIKBN_H_Si: TMLabel;
    f1PASSITEMKBN1: TMNumEdit;
    f1PASSITEMKBN1NM: TMLabel;
    f1PASSITEMKBN2NM: TMLabel;
    f1PASSITEMKBN2NM_Si: TMLabel;
    f1PASSITEMKBN1NM_Si: TMLabel;
    lblBAR1: TMLabel;
    lblBAR2: TMLabel;
    lblBAR1_Si: TMLabel;
    lblBAR2_Si: TMLabel;
    MemPrintPassKbn: TStringField;
    MemPrintPassItemKbn1: TStringField;
    MemPrintPassItemKbn2: TStringField;
    MemPrintPassKbnNm: TStringField;
    MemPrintPassItemKbn1Nm: TStringField;
    MemPrintPassItemKbn2Nm: TStringField;


    procedure WMOnPaint                     (var Msg: TMessage); message WM_ONPAINT;
    procedure FormCreate                    (Sender: TObject);
    procedure FormDestroy                   (Sender: TObject);
    procedure FormClose                     (Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery                (Sender: TObject; var CanClose: Boolean);
    procedure BtnClick                      (Sender: TObject);
    procedure fnFldOnChg                    (Sender: TObject);
    procedure MTab1Change                   (Sender: TObject);
    procedure FormShow                      (Sender: TObject);
    procedure FormHide                      (Sender: TObject);
    procedure fnAdsArrowClick               (Sender: TObject);
    procedure fnPostArrowClick              (Sender: TObject);
    procedure FormActivate                  (Sender: TObject);
    procedure f1POSTNO2_SiArrowClick        (Sender: TObject);
    procedure f1ADS1_SiArrowClick           (Sender: TObject);
    procedure CODEArrowClick                (Sender: TObject);
    procedure f0CODEEnter                   (Sender: TObject);
    procedure MSPFunctionBarFunctionClick   (Sender: TObject; FuncNo: Integer);
    procedure AcTemplateExecute             (Sender: TObject);
    procedure f0CODEExit                    (Sender: TObject);
    procedure BPrintClick                   (Sender: TObject);                  // <PRN>
    procedure BChangeClick                  (Sender: TObject);                  // <109>
    procedure f1BMCODEKeyPress(Sender: TObject; var Key: Char);                 // <2466>
    procedure f1BMCODE_SiKeyPress(Sender: TObject; var Key: Char);				// <2466>
	procedure btnMaskClick					(Sender: TObject);					// <PASS>add

  private
    //-----------------------------------------------------
  	//MJS共通仕様のprivate区を宣言
    //-----------------------------------------------------
	m_pMjsAppRec	    : ^TMjsAppRecord;	                // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ(ｾｰﾌﾞ用)
	m_Base_pRec	        : ^TMjsAppRecord;                   // <104>
    m_pMDataModule	    : TMDataModulef;	                // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
    ComArea			    : TJNTMASCom;                       // MJS共通ｴﾘｱ
	ACControl 		    : TWinControl;	                    // Delphi標準 ｳｨﾝﾄﾞｳｺﾝﾄﾛｰﾙ基本ｸﾗｽ <BPL>
    m_cJNTArea          : TJNTCommon;
    //-----------------------------------------------------
    //親BPLからの継承
    //-----------------------------------------------------
    m_CmpList	        : TList;                            // 親ﾌｫｰﾑのObjectを継承<LEAD>
    B_Print 	        : TMSpeedButton;                    // 印刷ﾎﾞﾀﾝ
    B_Change            : TMSpeedButton;                    // 切出/埋込ﾎﾞﾀﾝ<109>
    m_bBtnChange	    : Boolean;                          // 切出≪=≫埋込ﾌﾗｸﾞ<109>
//    E_TRCODE          :   TMTxtEdit;                      // 得意先ｺｰﾄﾞ
//    E_TRNAME          :   TMTxtEdit;                      // 得意先名称

    //-----------------------------------------------------
    //新DB対応
    //-----------------------------------------------------
    dbCorp_Select	    : TFDConnection;
//    m_dbMjsCmn		    : TDatabase;
//    m_dbMasCmn		    : TDatabase;
    uvTranDB            : TFDConnection;

    //-----------------------------------------------------
    //販売共通情報
    //-----------------------------------------------------
	uvSelSys            : TJNTSelCorpSys; 		            // 会社ｼｽﾃﾑ情報
    uvPostExpOpenSW     : Boolean;                          // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)

    //-----------------------------------------------------
    //その他
    //-----------------------------------------------------
    uvEdtSw             : Boolean;                          // 編集ｽｲｯﾁ		       (True:編集 False:未編集)
    uvRecGetSw          : Boolean;                          // ﾚｺｰﾄﾞ取得ｽｲｯﾁ       (True:取得 False:未取得)
	uvFormCreateSw      : Boolean;	                        // FormCreta動作ｽｲｯﾁ   (True:起動 False:未起動)
    uvVK_KeyKilSw       : Boolean;	                        // VK_xxxｷｰ有効無効ｽｲｯﾁ(True:有効 False:無効)
    uvUSDENDFM          : Integer;	                        // 納品書Dfm
    uvDispFlg           : Integer;                          // 決算ﾌﾗｸﾞ（ 0:未確定、1:確定済）
    uvComputerName      : String;                           // ｺﾝﾋﾟｭｰﾀ名格納用変数
//  uvLogin             : String;                           // ﾛｸﾞｲﾝ
	uvBtUpdFlg		    : Boolean;				            // 更新判定ﾌﾗｸﾞ(T:更新ﾎﾞﾀﾝON F:更新ﾎﾞﾀﾝOFF)<HGA>
    uvRecTF             : Boolean;                          // ﾚｺｰﾄﾞ存在ﾌﾗｸﾞ
    uvNCODE             : Extended;                         // 内部ｺｰﾄﾞ保管用
    uvHoj1Flg           : Integer;                          // 得意先採用ﾌﾗｸﾞ
    uvHoj2Flg           : Integer;                          // 仕入先採用ﾌﾗｸﾞ
    uvAttr              : Integer;
    uvDigit             : Integer;
    uvHojyoNm           : String;
    uvTNAttr            : Integer;
    uvTNDigit           : Integer;
    uvTNHojyoNm         : String;
    uvBMAttr            : Integer;
    uvBMDigit           : Integer;
    uvBMHojyoNm         : String;
    uvBMUseKbn          : Integer;
    uvClose             : Boolean;                          // <100>
	m_bFirstFlag        : Boolean;			                // 初期処理ﾌﾗｸﾞ
    uvExpOpenSW         : Boolean;                          // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
    uvFncInfo           : urFncInfo;                        // <100>
    uvTempFlg           : Boolean;                          // <100>
    uvData_Load         : TuvData_Load;                     // <101>読み込み時の各ﾃﾞｰﾀ
    uvData_Load_S       : TuvData_Load;                     // <101>読み込み時の各ﾃﾞｰﾀ
//<PASS>Add S
	uvOyakoFL_Tk		: integer;							// 得意先親子フラグ
	uvOyakoFL_Si		: integer;							// 仕入先親子フラグ
//<PASS>Add E

    // ﾃﾝﾌﾟﾚｰﾄ情報保存用(得意先)
    uvTmpURKINHSUKBN    : Integer;                          // 売上端数区分
    uvTmpGRUZSEIKBN     : Integer;                          // 現売税請求区分
    uvTmpZSEIKBN        : Integer;                          // 消費税請求区分
    uvTmpZHSUKBN        : Integer;                          // 消費税端数単位
    uvTmpZHSUTNIKBN     : Integer;                          // 消費税端数処理
    uvTmpTRIHIKIKBN     : Integer;                          // 取引区分
    uvTmpNMKBN          : Integer;                          // 名称変更区分
    uvTmpSSHCDKBN       : Integer;                          // 指定商品ｺｰﾄﾞ区分
    uvTmpSSHCDKET       : Integer;                          // 指定商品ｺｰﾄﾞ桁数
    uvTmpYYKBN          : Integer;                          // 和暦西暦区分
    uvTmpDAINMKBN       : Integer;                          // 代表者名の印字
    uvTmpUSDENPFM       : Integer;                          // 納品書ﾌｫｰﾑ
    uvTmpMITPFM         : Integer;                          // 見積書ﾌｫｰﾑ
    uvTmpJHDENPFM       : Integer;                          // 受注伝票ﾌｫｰﾑ
    uvTmpSNDENPFM       : Integer;                          // 出荷伝票ﾌｫｰﾑ
    uvTmpUSGKEI         : Integer;                          // 売上合計欄税印字
    uvTmpJYGKEI         : Integer;                          // 上代合計欄税印字
    uvTmpSOFOPFM        : Integer;                          // 送り状ﾌｫｰﾑ
//<KOJ> Ins-s
    uvTmpKUSGKEI        : Integer;                          // 工事合計欄税印字
    uvTmpKUSDENPFM      : Integer;                          // 工事売上伝票ﾌｫｰﾑ
    uvTmpKMITPFM        : Integer;                          // 工事見積書ﾌｫｰﾑ
    uvTmpKJHDENPFM      : Integer;                          // 工事受注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

//<PASS>Add S
    uvTmpAPIKBN    		: Integer;							// 外部連携区分
    uvTmpPASSKBN    	: Integer;							// パスワード設定
    uvTmpPASSITEMKBN1  	: Integer;							// パスワード合成項目1
    uvTmpPASSITEMKBN2  	: Integer;							// パスワード合成項目2
//<PASS>Add E

    // ﾃﾝﾌﾟﾚｰﾄ情報保存用(仕入先)
    uvTmpURKINHSUKBN_Si : Integer;
    uvTmpGRUZSEIKBN_Si  : Integer;
    uvTmpZSEIKBN_Si     : Integer;
    uvTmpZHSUKBN_Si     : Integer;
    uvTmpZHSUTNIKBN_Si  : Integer;
    uvTmpTRIHIKIKBN_Si  : Integer;
    uvTmpNMKBN_Si       : Integer;
    uvTmpSSHCDKBN_Si    : Integer;
    uvTmpSSHCDKET_Si    : Integer;
    uvTmpYYKBN_Si       : Integer;
    uvTmpDAINMKBN_Si    : Integer;
    uvTmpUSDENPFM_Si    : Integer;
    uvTmpJHDENPFM_Si    : Integer;
    uvTmpSNDENPFM_Si    : Integer;
    uvTmpUSGKEI_Si      : Integer;
//<KOJ> Ins-s
    uvTmpKUSGKEI_Si     : Integer;                          // 工事合計欄税印字
    uvTmpKUSDENPFM_Si   : Integer;                          // 工事原価伝票ﾌｫｰﾑ
    uvTmpKJHDENPFM_Si   : Integer;                          // 工事発注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

//<PASS>Add S
    uvTmpAPIKBN_Si    	: Integer;							// 外部連携区分
    uvTmpPASSKBN_Si    	: Integer;							// パスワード設定
    uvTmpPASSITEMKBN1_Si: Integer;							// パスワード合成項目1
    uvTmpPASSITEMKBN2_Si: Integer;							// パスワード合成項目2
//<PASS>Add E


//<134>
    uvTmpKTKBN1			: Int64;
    uvTmpKTKBN2			: Int64;
    uvTmpKSIBN1			: Int64;
    uvTmpKSIBN2			: Int64;

    uvTmpTKBM			: Int64;
    uvTmpTKTN			: Int64;
    uvTmpSIBM			: Int64;
    uvTmpSITN			: Int64;
	uvTmpTKCM1			: String;
	uvTmpTKCM2			: String;
	uvTmpSICM1			: String;
	uvTmpSICM2			: String;

    uvSeiKbn            : Integer;
    uvSeiKbn_S          : Integer;

    uvHani              : TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry       : TPrintAppEntry;                   // <PRN>
    ArrHdl              : Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    : rcPrtParam;                       // <PRN>
    DmqPrint            : TMQuery;                          // <PRN> 印刷用ｸｴﾘｰ
    MComboBox           : TMComboBox;
	m_iRekiKbn			: Integer;						    // 051114

//<134>
	uvKTKBN1Attr		: Integer;
	uvKTKBN1Digit		: Integer;
	uvKTKBN1HojyoNm		: String;
	uvKTKBN1UseKbn		: Integer;
	uvKTKBN2Attr		: Integer;
	uvKTKBN2Digit		: Integer;
	uvKTKBN2HojyoNm		: String;
	uvKTKBN2UseKbn		: Integer;

	uvKSIBN1Attr		: Integer;
	uvKSIBN1Digit		: Integer;
	uvKSIBN1HojyoNm		: String;
	uvKSIBN1UseKbn		: Integer;
	uvKSIBN2Attr		: Integer;
	uvKSIBN2Digit		: Integer;
	uvKSIBN2HojyoNm		: String;
	uvKSIBN2UseKbn		: Integer;

    m_SyncMaster        : TSyncMaster;      // <Rel> ﾏｽﾀ同期基本ｸﾗｽ

//↓<139>
	uvTmpTnkRnk			: Integer;
	uvTmpTnkRnk_Si		: Integer;
	uvTmpKakeRt			: Extended;
	uvTmpKakeRt_Si		: Extended;
//↑<139>

//<KOJ> Ins-s
    uvKojUseFlg         : Boolean;          // 工事採用ﾌﾗｸﾞ True:採用あり False:採用なし
//<KOJ> Ins-e

    m_SELCSTM_TBL		: TSELCSTM_TBLRec;  //<MJUP>

    m_RepHandle			: THandle;          // 印刷モジュールハンドル <144>

    m_JNTAuthority      : TJNTAuthority;    // <Authority> ADD

    m_BumonNCodeEx        	: Extended;                    //<2466>エクスプローラまたはDBから取得した部門内部コード（同じ外部コードがあるため）
    m_BumonNMKEx            : String;                      //<2466>エクスプローラから取得した部門簡略名
    m_BumonNCodeEx_Si      	: Extended;                    //<2466>エクスプローラまたはDBから取得した仕入先用部門内部コード（同じ外部コードがあるため）
    m_BumonNMKEx_Si         : String;                      //<2466>エクスプローラから取得した仕入先用部門簡略名

    procedure   fnInzForm                   ();
    procedure   fnInzFormf1                 ();
    procedure   fnKbnStrSet                 ();
    procedure   fnBtnEnbChg                 ();
	procedure   fnFldSet                    (pvQry: TMQuery);
    procedure   fnFldNameSet                ();
	procedure   fnDfmGet                    ();
    procedure   MTab1NextSetFcous           ();
    procedure   MBitBtnBeforSetFcous        (AcFldName: String);
    procedure   MBitBtnAfterSetFcous        (AcFldName: String);
    procedure   fnEndKeyBtnFcous            ();
    procedure   fnCallPostExplorer          (pvKeyWord: String; pvPostEdit1,pvPostEdit2: TMNumEdit;
                                             pvAdsEdit1,pvAdsEdit2: TMTxtEdit);
    function    fnFldChk                    (Sender: TObject; AllChkMode: Boolean): Boolean;
    function    fnRecGet                    (CODE: String): Boolean;
    function    fnESCConfirm                (): Boolean;
    function    fnCloseConfirm              (): Boolean;
    function    fnRecUpd                    (): Boolean;
    function    fnCancel                    (FcsChg: Boolean): Boolean;
    function    fnBtnNextFocus              (): Boolean;
    function    fnBtnEnabled                (): Boolean;
    function    fnBtnOnChange               (pName: String): Boolean;
    function    fnZeiKbnChange              (pCompoName: String): Boolean;
    function    fnRecUpd_FX                 (pRecKbn: Integer): Boolean;
    function    fnGetDspData                (sCode: String): String;
	function    NspSepStr                   (const sSrc:String; iLen: Integer;
                                             var sDst1,sDst2:string):boolean;
    procedure   fnSetFncType                (pKBN: Integer);                    //<100>
    Function    fnChkTRCODE                 (): Integer;
// <108> function   fnGetNAME               (pCODE: String; pMKBN,pAttr: Integer;
// <108>                                     var RName: String): Boolean;
    function    fnGetNAME                   (Sender: TObject; pCODE: String; pMKBN,pAttr: Integer;
                                             var RName: String): Boolean;       // <108>
	function	fnGetNAME_PrnBmn			(pCODE: Extended; var RName: String ):Boolean;		//<2466>
    function    fnGetGCODE                  (pCODE: Extended; pMKBN: Integer): String;
    function    fnGetNCODE                  (pCODE: String; pMKBN,pAttr: Integer): Extended;
    function    fnGetGCODE_Si               (pCODE: Extended; pMKBN: Integer): String;          //<2466>
    function    fnGetNCODE_Si               (pCODE: String; pMKBN,pAttr: Integer): Extended;	//<2466>
	procedure   fnPrnSET                    ();		                            // 051115
    function    fnGetBitmapSelectedTag      (nSelectedTag: Integer): TBitmap;   // <130>

	procedure	fnLicenseCheck;				//<133>

	procedure   SessionPractice(iSyori: Integer);
    procedure   fnChgCmpEna(pEna: Boolean; pCMP: TObject;
                    pSub1: TObject = nil; pSub2: TObject = nil);

//<KOJ> Ins-s
    function  fnKojUse(): Boolean;          //建設工事業採用ﾁｪｯｸ
//<KOJ> Ins-e

	procedure fnGetAllKbn(); //<MJUP>

	function fnShimeStrGet(Text: String): String;		//<2255>締日を表示用に編集
	function fnCyclesStrGet(Text: String): String;		//<2255>ｻｲｸﾙを表示用に編集
	function fnCollectStrGet(Text: String): String;		//<2255>回収日を表示用に編集

	function fnPWITEMChkUpd(pTkSiKbn:Integer; iItemKbn1: Integer; iItemKbn2: Integer): Boolean;//<PASS>郵便番号・電話番号未入力チェック
	function fnPWITEMChkCode(pTkSiKbn:Integer; iItemKbn1: Integer; iItemKbn2: Integer): Boolean;//<PASS>請求先・取引先コード半角チェック
	function gfnHasHankKana(ChkText:String):Boolean;//<PASS>半角文字の有無判定
  public	{MJS共通仕様のpublic区を宣言}
    constructor	CreateForm                  (pRec: Pointer);
	procedure	WMSetFocus                  (var Msg: TWMSetFocus);	message	WM_SETFOCUS;
	procedure	CMChildKey                  (var Msg: TWMKey); 		message	CM_CHILDKEY;
  end;

{MJS共通仕様のpublic区を宣言}
function AppEntry(pPar: Pointer) : Integer;
exports
	AppEntry;

var
  FrmJNTCRP004004F: TFrmJNTCRP004004F;

{$include JNTConst.inc} // <108>

implementation

{$R *.DFM}

uses
	{ﾘｰﾄﾞ専用ﾕﾆｯﾄﾗｲﾌﾞﾗﾘ}
	JNTSelError;			                // ｴﾗｰ処理ﾓｼﾞｭｰﾙ

const
    {ﾌｫｰｶｽ移動用}
    ucKeyFld        = 'f0CODE';             // 主ｷｰ項目
    ucFirstFld      = 'f1POSTNO1';          // 画面先頭項目
    ucLastFld       = 'f1Memo2';            // 画面最終項目

    //各頁の先頭項目
    ucP1FirstFldU   = 'f1POSTNO1';
    ucP1FirstFldS   = 'f1POSTNO1_Si';

    ucP2FirstFld    = 'f1URKINHSUKBN';
    ucP3FirstFld    = 'f1URKINHSUKBN_Si';
    ucP4FirstFld    = 'f1YYKBN';
    ucP5FirstFld    = 'f1YYKBN_Si';
    ucP6FirstFld    = 'f1MEMO1';
//  ucP3NextFld     = 'f1USDENPFM';

    //各頁の最終項目
    ucP1LastFldU    = 'f1TNCODE';
    ucP1LastFldS    = 'f1TNCODE_Si';
    ucP2LastFld     = 'f1SSHCDKET';
    ucP3LastFld     = 'f1SSHCDKET_Si';
    ucP4LastFld     = 'f1SOFOPFM';
    ucP5LastFld     = 'f1SNDENPFM_Si';
    ucP6LastFld     = 'f1MEMO2_Si';

    {区分ﾃｰﾌﾞﾙ参照用}
    ucMKBN_TBLNAME  = 'ALL';

    {ﾎﾞﾀﾝ用}
    ucBtnOK			= 'BtnUpd'; 		    // 登録ﾎﾞﾀﾝ
    ucBtnNG			= 'BtnCan';	            // ｷｬﾝｾﾙﾎﾞﾀﾝ
    ucBtnBEFOR		= 'MBitBtnBefor';	    // 前ﾍﾟｰｼﾞ移動ﾎﾞﾀﾝ
    ucBtnAFTER		= 'MBitBtnAfter';	    // 後ﾍﾟｰｼﾞ移動ﾎﾞﾀﾝ
    ucBtnDelete     = 'UpSBtnDelete';       // 削除ﾎﾞﾀﾝ
    ucBrnPrint      = 'UpSBtnPrint';	    // 印刷ﾎﾞﾀﾝ
    ucBtnDisp       = 'UpSBtnChange';	    // 切出ﾎﾞﾀﾝ
    ucBtnEnd        = 'UpSBtnEnd';	        // 終了ﾎﾞﾀﾝ

    {ﾊﾟﾈﾙ番号用}
    ucScrollBox1 	= 0;				    //「基本情報」ﾊﾟﾈﾙ
    ucScrollBox2 	= 1;				    //「入力・集計情報」ﾊﾟﾈﾙ(売上)
    ucScrollBox3 	= 2;				    //「入力・集計情報」ﾊﾟﾈﾙ(仕入)
    ucScrollBox4 	= 3;				    //「印刷情報」ﾊﾟﾈﾙ(売上)
    ucScrollBox5 	= 4;				    //「印刷情報」ﾊﾟﾈﾙ(仕入)
    ucScrollBox6 	= 5;				    //「その他」ﾊﾟﾈﾙ

    ucTabFld 		= 'MTab1';			    // ﾀﾌﾞｺﾝﾄﾛｰﾙ
    ucZeroCODE      = '0000000000000000';   // <122>

	// -----<MHIS> Add-St-----
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放
	// -----<MHIS> Add-Ed-----

{$include JNTCRPSyncMasterB.inc}    // <Rel> ﾏｽﾀ同期共通実装部
{$include JNTMTOKUI_Sync.INC} // <Rel>

var
    uvCstM_CTR: array [1..2] of String = ('国内','国外');       //<141>

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pPar: Pointer): Integer;
var
	{注意：自ｸﾗｽのﾎﾟｲﾝﾀを記述}
	pFrm: ^TFrmJNTCRP004004F;

	{注意：お約束ごと}
	pRec: ^TMjsAppRecord;
begin

	result := ACTID_RET_OK;
	pRec   := Pointer(TAppParam(pPar^).pRecord);            // BPL管理構造体ﾎﾟｲﾝﾀの取得

    // 各ｱｸｼｮﾝIDについて処理する
	case TAppParam(pPar^).iAction of

    ACTID_FORMCREATESTART:					                // Form Create要求
        begin
            new(pFrm);                                      // TFrmJNTCRP0040040ｲﾝｽﾀﾝｽ作成
            try 								            // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
                pFrm^ := TFrmJNTCRP004004F.CreateForm(pPar);
                pRec^.m_pChildForm := pFrm;                 // BPL管理構造体へ子BPLﾌｫｰﾑのﾎﾟｲﾝﾀをｾｯﾄ
            except
                Dispose(pFrm);
                result := ACTID_RET_NG;
            end;
        end;

    ACTID_FORMCREATESHOWSTART:			                    // Form Create&Show要求
        begin
            new(pFrm);                                      // TFrmJNTCRP0040040ｲﾝｽﾀﾝｽ作成
            try  								            // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
                pFrm^ := TFrmJNTCRP004004F.CreateForm(pRec);
                pFrm^.Show();                               // 子ﾌｫｰﾑの表示
                pRec^.m_pChildForm := pFrm;                 // BPL管理構造体へ子BPLﾌｫｰﾑのﾎﾟｲﾝﾀをｾｯﾄ
            except
                Dispose(pFrm);
                result := ACTID_RET_NG;
            end;
        end;

    ACTID_FORMCLOSESTART:					                // Form Close要求
        begin
            pFrm := Pointer(pRec^.m_pChildForm);            // 子ﾌｫｰﾑのﾎﾟｲﾝﾀを取得
            pFrm^.Close();                                  // 子ﾌｫｰﾑを閉じる
            pFrm^.Free();                                   // 子ﾌｫｰﾑのｲﾝｽﾀﾝｽを破棄する
            Dispose(pFrm);
        end;

    ACTID_FORMCANCLOSESTART:				                // Form CanClose要求
        begin
            pFrm := Pointer(pRec^.m_pChildForm);
            if (pFrm^.CloseQuery = False) then
                result := ACTID_RET_NG;
        end;

    ACTID_SHOWSTART:						                // Show要求
        begin
            pFrm := Pointer(pRec^.m_pChildForm);
            pFrm^.Show();
        end;

    ACTID_HIDESTART:		                                //	Hide要求<16>
        begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			if pFrm^.Parent <> nil then
            	pFrm^.Hide();
        end;
	end;

end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TFrmJNTCRP004004F.CreateForm(pRec: Pointer);
begin
    // MJS情報の保存
    m_pMjsAppRec    :=  Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave
	m_pMDataModule  :=  TMDataModulef(m_pMjsAppRec^.m_pDBModule^);	    // MJS共通DBﾓｼﾞｭｰﾙ
    ComArea		    :=  TJNTMASCom(m_pMjsAppRec^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得(とりあえず財務を参照)
    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

//↓<Gali2258>FormCreateから移動
    m_cJNTArea      :=  TJNTCommon   ( m_CmpList.Items[8]^ );       // <103>
    m_Base_pRec     :=  Pointer      ( m_CmpList.Items[9]^ );       // <104>

	m_cJNTArea.setSelAppRecord;						            // 販売ポインタ設定
//↑<Gali2258>

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

//<Gali2258>if uvSelSys.CreateSysMsg(m_pMjsAppRec) <> 0 then
    	if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then //<Gali2258>
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // ﾄﾗﾝｻﾞｸｼｮﾝ用ﾃﾞｰﾀﾍﾞｰｽの取得
    try
        uvTranDB := nil;
        uvTranDB := m_pMDataModule.COPDBOpen(1, m_pMjsAppRec^.m_iCorpID);
        if uvTranDB = nil then
            Abort;
    except
		MjsMessageBox(Self,'ﾄﾗﾝｻﾞｸｼｮﾝ用会社DBの接続に失敗しました。'#13#10#13#10
					+ '[' + IntToStr(m_pMDataModule.GetStatus) + ']'#09
					+ m_pMDataModule.GetError[0], mjError, mjDefOk);
        raise;
    end;

    // 会社DB Open
	dbCorp_Select := m_pMDataModule.COPDBOpen( 1, ComArea.m_iCopNo );
	if dbCorp_Select = nil then
	begin
		raise Exception.Create('');
		Exit;   // 例外生成
	end;

	// 051114 >>
    // 会社別ｼｽﾃﾑ情報読み込み<PRN>
    try
    	if (uvSelSys.CreateSysInfo(dbCorp_Select) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;
	// 051114 <<

	gfnJNTSetConnection_FormatOptions(uvTranDB);		//<D10>
	gfnJNTSetConnection_FormatOptions(dbCorp_Select);	//<D10>

    inherited Create(TForm(m_pMjsAppRec^.m_pOwnerForm^))

end;

//-----------------------------------------------------------------------------
//  WMSetFocus
//      Focusの格納 <BPL>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.WMSetFocus(var Msg: TWMSetFocus);
begin

    if uvClose then Exit; // <100>

   	if Parent = nil then
		ACControl := Screen.ActiveControl;

	ACControl.SetFocus;                                     // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙへﾌｫｰｶｽを移動
	Inherited;

end;

//-----------------------------------------------------------------------------
//  CMChildKey
//      ｷｰのﾁｪｯｸ
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.CMChildKey(var Msg: TWMKey);
var
    sShift              : TShiftState;
    lvCompoName         : string;
    lvNextKeyPressed    : Boolean;
    lvNextBtnPressed    : Boolean;
    lvPrevBtnPressed    : Boolean;
    lvBitBtnFocused     : Boolean;
    lvBitBtnMTabFocused : Boolean;

begin

    // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    lvCompoName := '';
    if Screen.ActiveControl <> nil then
        lvCompoName := TComponent(Screen.ActiveControl).Name;

    // ｼﾌﾄｷｰの状態を取得する
//<2278>    sShift := KeyDataToShiftState(Msg.KeyData);
    sShift := JNTSELXKeyDataToShiftState(Msg.KeyData);	//<2278>

    //<105>･････････････････････････････････････････↓↓↓
    if Screen.ActiveControl is TMTab then
	begin
		//Right(→)
		if (Msg.CharCode=VK_RIGHT) then
		begin
			uvVK_KeyKilSw	:=	False;
		end
		//Left(←)
		else if (Msg.CharCode=VK_LEFT) then
		begin
			uvVK_KeyKilSw	:=	False;
		end;
	end;
    //<105>･････････････････････････････････････････↑↑↑

    // ←ｷｰの文字TOP時は前の入力項目へ移動
    if MjsChkCurTop(Screen.ActiveControl) and
       ((Msg.CharCode = VK_LEFT) and (sShift = [])) then
        Msg.CharCode := VK_UP;

    // →ｷｰの文字END時は後の入力項目へ移動
    if MjsChkCurEnd(Screen.ActiveControl) and
       ((Msg.CharCode = VK_RIGHT) and (sShift = [])) then
        Msg.CharCode := VK_DOWN;

    // 数値ﾌｨｰﾙﾄﾞの対応↓
    if Screen.ActiveControl is TMNumEdit then
    begin
        if ((Msg.CharCode = VK_LEFT)  and (sShift = [])) then Msg.CharCode := VK_UP;
        if ((Msg.CharCode = VK_RIGHT) and (sShift = [])) then Msg.CharCode := VK_DOWN;
    end;
    // 数値ﾌｨｰﾙﾄﾞの対応↑


    // 次へ進めｷｰかを判定する
    lvNextKeyPressed := (
                         (Msg.CharCode = VK_RETURN)                     or
                         ((Msg.CharCode = VK_TAB)  and (sShift = []))   or
                         ((Msg.CharCode = VK_DOWN) and (sShift = []))
                        );

    // ﾎﾞﾀﾝ制御用変数↓
    // 次へ進めｷｰかを判定する
    lvNextBtnPressed := (
                         ((Msg.CharCode = VK_RIGHT) and (sShift = []))  or
                         ((Msg.CharCode = VK_TAB)   and (sShift = []))  or
                         ((Msg.CharCode = VK_DOWN)  and (sShift = []))
                        );

    // 前へ戻れｷｰかを判定する
    lvPrevBtnPressed := (
                         ((Msg.CharCode = VK_LEFT) and (sShift = []))        or
                         ((Msg.CharCode = VK_TAB)  and (sShift = [ssShift])) or
                         ((Msg.CharCode = VK_UP)   and (sShift = []))
                        );
    // ﾎﾞﾀﾝ制御用変数↑

    // ﾋﾞｯﾄﾎﾞﾀﾝがﾌｫｰｶｽを受けているかを判定する
    lvBitBtnFocused :=  ((lvCompoName = ucBtnOK)    or
                        (lvCompoName = ucBtnNG)     or
                        (lvCompoName = ucBtnBEFOR)  or
                        (lvCompoName = ucBtnAFTER));


    // ﾋﾞｯﾄﾎﾞﾀﾝかMTabがﾌｫｰｶｽを受けているかを判定する
    lvBitBtnMTabFocused :=  ((lvCompoName = ucBtnOK)    or
                             (lvCompoName = ucBtnNG)    or
                             (lvCompoName = ucBtnBEFOR) or
                             (lvCompoName = ucBtnAFTER) or
                             (lvCompoName = ucTabFld));


    // ﾎﾞﾀﾝでの各ｷｰの補足
    if lvBitBtnFocused then
    begin
        // 次へｷｰ
        if lvNextBtnPressed then
        begin
            MBitBtnAfterSetFcous(lvCompoName);
        end;
        // 前へｷｰ
        if lvPrevBtnPressed then
        begin
            MBitBtnBeforSetFcous(lvCompoName);
        end;
        // Retｷｰ(BtnClick用)とｱｸｾﾗﾚｰﾀ用ｷｰ以外
        if	( (Msg.CharCode <> VK_RETURN) and not (sShift = [ssAlt])) then Abort;
    end;

    // 各ﾍﾟｰｼﾞの先頭入力時の・・Shift+TABｷｰの捕捉
    if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
    begin
        if  (lvCompoName = ucP1FirstFldU) or
//<2302>Del            (lvCompoName = ucP1FirstFldS) or
            (lvCompoName = ucP2FirstFld)  or
            (lvCompoName = ucP3FirstFld)  or
            (lvCompoName = ucP4FirstFld)  or
            (lvCompoName = ucP5FirstFld)  then
        begin
   			MjsSetFocus(Self,ucTabFld);
            Abort;
        end;

//<2302>ST
        //基本情報タブの仕入先先頭項目にフォーカスがあれば得意先の採用を見て
        //移動先を判断する。
        if (lvCompoName = ucP1FirstFldS) then
        begin
            //得意先採用フラグ
            if (uvHoj1Flg = 1) then
            begin
                //得意先基本情報最終項目に移動
                SelectNext(Screen.ActiveControl, False, True);
                Abort;
            end
            else
            begin
                //タブに移動
                MjsSetFocus(Self,ucTabFld);
                Abort;
            end;
        end;
//<2302>ED

        if ((Blind_Othr_TK.Visible) and (lvCompoName = ucP6FirstFld)) or
           ((Blind_Othr_TK.Visible = False) and
            (Blind_Othr_Si.Visible) and (lvCompoName = 'f1MEMO1_Si')) then
        begin
            MjsSetFocus(Self,ucTabFld);
            Abort;
        end;
    end;

    // Return,Downｷｰの補足
    if lvNextKeyPressed then
    begin
        if Screen.ActiveControl = nil then Exit;

        // Tabﾌｫｰｶｽ時のｶｰｿﾙ制御
        if lvCompoName = ucTabFld then
        begin
//            MTab1NextSetFcous;
			MjsNextCtrl( Self );
            Abort;
        end;

	    if	(Msg.CharCode = VK_RETURN) 	or (Msg.CharCode = VK_TAB) then
        begin

            if lvBitBtnFocused  then
            begin
                Exit;
            end;

            //フィールド入力値のチェックをする
            if fnFldChk(Screen.ActiveControl, False) then
            begin
                // 対象ﾃﾞｰﾀを取得する
                if ( lvCompoName = 'f0CODE' ) then
                begin
					f0CODE.Text :=  TrimRight(f0CODE.Text);

                 	if  fnRecGet(f0CODE.Text) = False then
                    begin
                        Abort;
                        Exit;
                    end;

                    MTab1.Items.Selected := 0;
                    if Blind_TK.visible then
                    begin
                        if uvDispFlg = 0 then
//<133>
//             				MjsSetFocus(Self, 'f1POSTNO1')
							MjsNextCtrl( Self )
                        else
             				MjsSetFocus(Self, 'f0CODE');
                    end
                    else
                    begin
//<133>
                        if uvDispFlg = 0 then
//             				MjsSetFocus(Self, 'f1POSTNO1_Si')
							MjsNextCtrl( Self )
                        else
             				MjsSetFocus(Self, 'f0CODE');
                    end;

         	        if Msg.CharCode = VK_TAB then Abort;

                    Exit;
                end;
            end
            else abort;
        end;

{
//<2302>ST
        if  (lvCompoName = ucP2LastFld) or
            (lvCompoName = ucP3LastFld) or
            (lvCompoName = ucP4LastFld) or
            (lvCompoName = ucP5LastFld) or
            (lvCompoName = ucP6LastFld) then
        begin
            //
            MjsSetFocus(Self, ucBtnBEFOR);
            Abort;
        end;
//<2302>ED
}

        // 次の強制ﾌｫｰｶｽ位置
//        if fnBtnNextFocus() <> True then Exit;

        //ﾎﾞﾀﾝの・・↓制御抑止
		MjsNextCtrl( Self );
//        SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, True);
        Abort;
    end;

    //ESCキーの捕捉
    if (Msg.CharCode = VK_ESCAPE) and (sShift = []) then
    begin
        //先頭項目だった場合
		if lvCompoName = ucKeyFld then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        else
        begin
            //終了確認
            if lvBitBtnMTabFocused = False then fnESCConfirm;
            Abort;
        end;
    end;

    //ENDキーの捕捉
    if (Msg.CharCode = VK_END) and (sShift = []) then
    begin
        //先頭項目だった場合
        if lvCompoName = ucKeyFld then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        else
        begin
        	//ﾋﾞｯﾄﾎﾞﾀﾝへ
            if lvBitBtnMTabFocused = False then fnEndKeyBtnFcous;
         	Abort;
        end;
    end;

    //Upキーの捕捉
    if (Msg.CharCode = VK_UP) and (sShift = []) then
    begin

        //ｺｰﾄﾞ・正式名称・Tab入力時は無視する
        //Tab内先頭ﾌｨｰﾙﾄﾞの場合はMTab.TabStop=Falseにつきｺｰﾄﾞで補足の必要なし
        if  (lvCompoName = ucTabFld)     then
            Abort;

        SelectNext(Screen.ActiveControl, False, True);
        abort;
    end;

    // Upキーの捕捉
    if ( Msg.CharCode = VK_UP  ) and ( sShift = [] ) or
       ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
    begin
        if ( lvCompoName = 'f0CODE' ) then
            Abort;

        SelectNext(Screen.ActiveControl, False, True);
        Abort;
    end;

    // <100>*** ﾌｧﾝｸｼｮﾝ ***
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

	Inherited;

end;

//=============================================================================
//  開始処理
//=============================================================================
procedure TFrmJNTCRP004004F.FormCreate(Sender: TObject);
var
	ComputerName: String;
    DMQuery     : TMQuery;
    i,
    iRet        :   Integer;        // <PRN>
    lvHandle    :   THandle;        // <PRN>
    StrText : string;	//<debug>
begin

    // 切替処理時の情報をｾｯﾄ
	Parent          :=  TPanel(m_pMjsAppRec^.m_pOwnerPanel^);	    // 親ﾌｫｰﾑの子ﾌｫｰﾑはめ込みﾊﾟﾈﾙをParentとする
	Align           :=  alClient;								    // Alignはｸﾗｲｱﾝﾄ領域とする
    uvClose         :=  False;  // <100>
    m_bFirstFlag    :=  False;
    m_bBtnChange 	:=  TRUE;   // <109>

    m_RepHandle     :=  0;      // 印刷モジュールハンドル <144>

    // <PRN>ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    B_Print 	    :=  TMSpeedButton( m_CmpList.Items[0]^ );       // 印刷ボタン
{↓<Gali2258>CreateFormへ移動
    m_cJNTArea      :=  TJNTCommon   ( m_CmpList.Items[8]^ );       // <103>
    m_Base_pRec     :=  Pointer      ( m_CmpList.Items[9]^ );       // <104>
↑<Gali2258>}
    MComboBox       :=  TMComboBox   ( m_CmpList.Items[10]^ );
    B_Change        :=  TMSpeedButton( m_CmpList.Items[11]^ );      // <109>

	m_SyncMaster    :=  TSyncMaster  ( m_CmpList.Items[13]^ );      // <Rel>

    m_JNTAuthority  :=  TJNTAuthority( m_CmpList.Items[16]^ );      // <Authority> ADD

	if m_SyncMaster.m_flgGrpCorp = 1 then				//<D10>
		gfnJNTSetConnection_FormatOptions(m_SyncMaster.m_cPDBSelect);	//<D10>

    B_Print.OnClick     :=  BPrintClick;
    B_Change.OnClick    :=  BChangeClick;   // <109>

//  B_Print.Enabled     :=  False; // <106>

//↓<MJUP>
    fnGetAllKbn(); //画面表示に必要な情報があれば、ここでまとめて取得します

    //サイズ等の変更。念のためMjsFontResizeより前に行います。
    // その他、設計上で変えたもの
    //     MemPrint.FieldByName('MemPrintNm')
    //         DisplayWidth、Size 60 → 80
    if m_SELCSTM_TBL.GL06 then
    begin
        LblTRCODE.Width	:= 89;
        f0CODE.Left		:= 106;
        f0NM.Left		:= 230;
        f0NM.Width		:= 591;
        TempMode.Left	:= 828;
    end
    else
    begin
        LblTRCODE.Width	:= 129;
        f0CODE.Left		:= 152;
        f0NM.Width		:= 430;
        f0NM.Left		:= 278;
        TempMode.Left	:= 723;
   	end;
//↑<MJUP>

    MjsColorChange(				                            // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TFrmJNTCRP004004F(Self),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).SysFocusColor
				  );

    // ﾌｫﾝﾄ変更
	MjsFontResize(TFrmJNTCRP004004F(Self),Pointer(m_pMjsAppRec));

//<104>
//    m_cJNTArea      :=  TJNTCommon.Create(Self);
//    m_cJNTArea.Init(m_pMjsAppRec);
{↓<Gali2258>CreateFormで行うので、コメントアウト。
	m_cJNTArea.setSelAppRecord;						            // 販売ポインタ設定
↑<Gali2258>}

    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    // 各設定
    fnKbnStrSet;                    // 文字列ｵﾌﾞｼﾞｪｸﾄを作成する

    // 初期値をｾｯﾄする
	uvFormCreateSw  := True;        // FormCreta動作ｽｲｯﾁ(True:起動 False:未起動)
	uvVK_KeyKilSw   := True;        // VK_xxxｷｰ有効無効ｽｲｯﾁ(True:有効 False:無効)

    MTab1.Items.Selected := 0;      // ﾍﾟｰｼﾞｺﾝﾄﾛｰﾙのﾃﾞﾌｫﾙﾄﾍﾟｰｼﾞを設定する

    //↓<Vista>
    // ScrollBox1にボタンを乗せたため、後ろに隠れてしまうので前面にする。
    MBitBtnBefor.BringToFront;
    MBitBtnAfter.BringToFront;
    BtnUpd.BringToFront;
    BtnCan.BringToFront;
    //↑<Vista>

    fnInzForm;

	// 郵便番号辞書 初期化
    uvPostExpOpenSW := FALSE;
	if fnCMNPostInit(m_pMjsAppRec) = 0 then
        uvPostExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'郵便番号辞書の初期化に失敗しました。'#13#10#13#10
					+ '郵便番号辞書は使用できません。', mjError, mjDefOk);

    // 編集状態ｽｲｯﾁを初期化する
    uvEdtSw := False;

    // ﾛｰｶﾙｺﾝﾋﾟｭｰﾀ名の取得
    GetClientName(ComputerName);
    uvComputerName := ComputerName;


    // 外部ｺｰﾄﾞ桁数調整
	DMQuery := TMQuery.Create(self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
        m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, DMQuery);
	try

        with DMQuery do
        begin
            Close;
            Sql.Clear;
            Sql.add(' Select MasterKbn,UseKBN,CodeDigit,CodeAttr,JHojyoName '+
                    ' From MasterInfo '+
//<134>
//                    ' WHERE MasterKbn in (22,25,41)  '+
                    ' WHERE MasterKbn in (22,25,41,811,812,821,822)  '+
                    ' ORDER BY MasterKbn             ');
            Open;
            First;
            while not EOF do
            begin
                case GetFld('MasterKbn').AsInteger of
                    // 取引先
                    22: begin
                            uvHojyoNm := GetFld('JHojyoName').AsString;  // 補助名称(実在)
                            uvDigit   := GetFld('CodeDigit') .AsInteger; // 桁数
                            uvAttr    := GetFld('CodeAttr').asInteger;
                        end;
                    // 社員
                    25: begin
                            uvTNHojyoNm := GetFld('JHojyoName').AsString;  // 補助名称(実在)
                            uvTNDigit   := GetFld('CodeDigit') .AsInteger; // 桁数
                            uvTNAttr    := GetFld('CodeAttr').asInteger;
                        end;
                    // 部門
                    41: begin
                            uvBMHojyoNm := GetFld('JHojyoName').AsString;  // 補助名称(実在)
                            uvBMDigit   := GetFld('CodeDigit') .AsInteger; // 桁数
                            uvBMAttr    := GetFld('CodeAttr').asInteger;
                            uvBMUseKbn  := GetFld('UseKbn').asInteger;
                        end;
//<134>↓
					// 拡張得意先分類１
					811: begin
							uvKTKBN1HojyoNm	:= GetFld('JHojyoName').AsString;  // 補助名称(実在)
							uvKTKBN1Digit	:= GetFld('CodeDigit') .AsInteger; // 桁数
							uvKTKBN1Attr	:= GetFld('CodeAttr').asInteger;
							uvKTKBN1UseKbn	:= GetFld('UseKbn').asInteger;
						end;

					// 拡張得意先分類２
					812: begin
							uvKTKBN2HojyoNm	:= GetFld('JHojyoName').AsString;  // 補助名称(実在)
							uvKTKBN2Digit	:= GetFld('CodeDigit') .AsInteger; // 桁数
							uvKTKBN2Attr	:= GetFld('CodeAttr').asInteger;
							uvKTKBN2UseKbn	:= GetFld('UseKbn').asInteger;
						end;

					// 拡張仕入先分類１
					821: begin
							uvKSIBN1HojyoNm	:= GetFld('JHojyoName').AsString;  // 補助名称(実在)
							uvKSIBN1Digit	:= GetFld('CodeDigit') .AsInteger; // 桁数
							uvKSIBN1Attr	:= GetFld('CodeAttr').asInteger;
							uvKSIBN1UseKbn	:= GetFld('UseKbn').asInteger;
						end;

					// 拡張仕入先分類２
					822: begin
							uvKSIBN2HojyoNm	:= GetFld('JHojyoName').AsString;  // 補助名称(実在)
							uvKSIBN2Digit	:= GetFld('CodeDigit') .AsInteger; // 桁数
							uvKSIBN2Attr	:= GetFld('CodeAttr').asInteger;
							uvKSIBN2UseKbn	:= GetFld('UseKbn').asInteger;
						end;
//<134>↑
                end;

                Next;
            end;

            Close ();
            SQL.Clear;
            SQL.Add ('select ComKbn2, YearKbn from DTMAIN');
            Open ();
            if not Eof then
            begin
                uvDispFlg := GetFld('ComKbn2').AsInteger;	// 決算確定
				m_iRekiKbn:= GetFld('YearKbn').AsInteger;	// 051114
	        end;
            Close;

            // ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀ(得意先)を求める
            SQL.Clear;
            Sql.Add('select se.* from MTOKUI_SEL se '+
                    'left Outer Join MTOKUI m on se.BaseNCode = m.NCode '+
                    'where (m.TemplateKbn = 1) '+
                    'and (se.RecKbn = 1)');
            Open ();

            if not Eof then
            begin
                uvTmpURKINHSUKBN    := GetFld('URKINHSUKBN').AsInteger; // 売上端数区分
                uvTmpGRUZSEIKBN     := GetFld('GRUZSEIKBN') .AsInteger; // 現売税請求区分
                uvTmpZSEIKBN        := GetFld('ZSEIKBN')    .AsInteger; // 消費税請求区分
                uvTmpZHSUKBN        := GetFld('ZHSUKBN')    .AsInteger; // 消費税端数単位
                uvTmpZHSUTNIKBN     := GetFld('ZHSUTNIKBN') .AsInteger; // 消費税端数処理
                uvTmpTRIHIKIKBN     := GetFld('TRIHIKIKBN') .AsInteger; // 取引区分
                uvTmpNMKBN          := GetFld('NMKBN')      .AsInteger; // 名称変更区分
                uvTmpSSHCDKBN       := GetFld('SSHCDKBN')   .AsInteger; // 指定商品ｺｰﾄﾞ区分
                uvTmpSSHCDKET       := GetFld('SSHCDKET')   .AsInteger; // 指定商品ｺｰﾄﾞ桁数
                uvTmpYYKBN          := GetFld('YYKBN')      .AsInteger; // 和暦西暦区分
                uvTmpDAINMKBN       := GetFld('DAINMKBN')   .AsInteger; // 代表者名の印字
                uvTmpUSDENPFM       := GetFld('USDENPFM')   .AsInteger; // 納品書ﾌｫｰﾑ
                uvTmpMITPFM         := GetFld('MITPFM')     .AsInteger; // 見積書ﾌｫｰﾑ
                uvTmpJHDENPFM       := GetFld('JHDENPFM')   .AsInteger; // 受注伝票ﾌｫｰﾑ
                uvTmpSNDENPFM       := GetFld('SNDENPFM')   .AsInteger; // 出荷伝票ﾌｫｰﾑ
                uvTmpUSGKEI         := GetFld('USGKEI')     .AsInteger; // 売上合計欄税印字
                uvTmpJYGKEI         := GetFld('JYGKEI')     .AsInteger; // 上代合計欄税印字
                uvTmpSOFOPFM        := GetFld('SOFOPFM')    .AsInteger; // 送り状ﾌｫｰﾑ
//<KOJ> Ins-s
                uvTmpKUSGKEI        := GetFld('KUSGKEI')    .AsInteger; // 工事合計欄税印字
                uvTmpKUSDENPFM      := GetFld('KUSDENPFM')  .AsInteger; // 工事売上伝票ﾌｫｰﾑ
                uvTmpKMITPFM        := GetFld('KMITPFM')    .AsInteger; // 工事見積書ﾌｫｰﾑ
                uvTmpKJHDENPFM      := GetFld('KJHDENPFM')  .AsInteger; // 工事受注伝票ﾌｫｰﾑ
//<KOJ> Ins-e
//<134>
				uvTmpKTKBN1			:= Trunc(GetFld('HBunNCode1').AsFloat);
				uvTmpKTKBN2			:= Trunc(GetFld('HBunNCode2').AsFloat);

				uvTmpTKBM			:= Trunc(GetFld('BmNCode').AsFloat);
				uvTmpTKTN			:= Trunc(GetFld('TnNCode').AsFloat);
				uvTmpTKCM1			:= GetFld('Memo1')      .AsString;
				uvTmpTKCM2			:= GetFld('Memo2')      .AsString;
//↓<139>
				uvTmpTnkRnk			:= GetFld('TnkRnk').AsInteger;
				uvTmpKakeRt			:= GetFld('KakeRt').AsFloat;
//↑<139>

//<PASS>Add S
                uvTmpAPIKBN			:= GetFld('LINKAGEKBN')		.AsInteger; // 外部連携区分
                uvTmpPASSKBN		:= GetFld('PASSKBN')		.AsInteger; // パスワード区分
                uvTmpPASSITEMKBN1	:= GetFld('PASSITEMKBN1')	.AsInteger; // パスワード合成項目１
                uvTmpPASSITEMKBN2	:= GetFld('PASSITEMKBN2')	.AsInteger; // パスワード合成項目２
//<PASS>Add E
            end;
            Close ();

            // ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀ(仕入先)を求める
            SQL.Clear;
            Sql.Add('select se.* from MTOKUI_SEL se '+
                    'left outer Join MTOKUI m on se.BaseNCode = m.NCode '+
                    'where (m.TemplateKbn = 1) '+
                    'and (se.RecKbn = 2)');
            Open ();

            if not Eof then
            begin
                uvTmpURKINHSUKBN_Si := GetFld('URKINHSUKBN').AsInteger; // 売上端数区分
                uvTmpGRUZSEIKBN_Si  := GetFld('GRUZSEIKBN') .AsInteger; // 現売税請求区分
                uvTmpZSEIKBN_Si     := GetFld('ZSEIKBN')    .AsInteger; // 消費税請求区分
                uvTmpZHSUKBN_Si     := GetFld('ZHSUKBN')    .AsInteger; // 消費税端数単位
                uvTmpZHSUTNIKBN_Si  := GetFld('ZHSUTNIKBN') .AsInteger; // 消費税端数処理
                uvTmpTRIHIKIKBN_Si  := GetFld('TRIHIKIKBN') .AsInteger; // 取引区分
                uvTmpNMKBN_Si       := GetFld('NMKBN')      .AsInteger; // 名称変更区分
                uvTmpSSHCDKBN_Si    := GetFld('SSHCDKBN')   .AsInteger; // 指定商品ｺｰﾄﾞ区分
                uvTmpSSHCDKET_Si    := GetFld('SSHCDKET')   .AsInteger; // 指定商品ｺｰﾄﾞ桁数
                uvTmpYYKBN_Si       := GetFld('YYKBN')      .AsInteger; // 和暦西暦区分
                uvTmpDAINMKBN_Si    := GetFld('DAINMKBN')   .AsInteger; // 代表者名の印字
                uvTmpUSDENPFM_Si    := GetFld('USDENPFM')   .AsInteger; // 納品書ﾌｫｰﾑ
                uvTmpJHDENPFM_Si    := GetFld('JHDENPFM')   .AsInteger; // 受注伝票ﾌｫｰﾑ
                uvTmpSNDENPFM_Si    := GetFld('SNDENPFM')   .AsInteger; // 出荷伝票ﾌｫｰﾑ
                uvTmpUSGKEI_Si      := GetFld('USGKEI')     .AsInteger; // 売上合計欄税印字
//<KOJ> Ins-s
                uvTmpKUSGKEI_Si     := GetFld('KUSGKEI')    .AsInteger; // 工事合計欄税印字
                uvTmpKUSDENPFM_Si   := GetFld('KUSDENPFM')  .AsInteger; // 工事原価伝票ﾌｫｰﾑ
                uvTmpKJHDENPFM_Si   := GetFld('KJHDENPFM')  .AsInteger; // 工事発注伝票ﾌｫｰﾑ
//<KOJ> Ins-e
//<134>
				uvTmpKSIBN1			:= Trunc(GetFld('HBunNCode1').AsFloat);
				uvTmpKSIBN2			:= Trunc(GetFld('HBunNCode2').AsFloat);

				uvTmpSIBM			:= Trunc(GetFld('BmNCode').AsFloat);
				uvTmpSITN			:= Trunc(GetFld('TnNCode').AsFloat);
				uvTmpSICM1			:= GetFld('Memo1')      .AsString;
				uvTmpSICM2			:= GetFld('Memo2')      .AsString;
//↓<139>
				uvTmpTnkRnk_Si		:= GetFld('TnkRnk').AsInteger;
				uvTmpKakeRt_Si		:= GetFld('KakeRt').AsFloat;
//↑<139>

//<PASS>Add S
                uvTmpAPIKBN_Si		:= GetFld('LINKAGEKBN')		.AsInteger; // 外部連携区分
                uvTmpPASSKBN_Si		:= GetFld('PASSKBN')		.AsInteger; // パスワード区分
                uvTmpPASSITEMKBN1_Si:= GetFld('PASSITEMKBN1')	.AsInteger; // パスワード合成項目１
                uvTmpPASSITEMKBN2_Si:= GetFld('PASSITEMKBN2')	.AsInteger; // パスワード合成項目２
//<PASS>Add E

            end;
            Close ();

        end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

    //権限情報を取得<102>
//    m_cJNTArea.FxPermission;
{  <Authority> DEL ↓
    if (m_cJNTArea.IsModify = False) then
    begin
        if (m_cJNTArea.IsAppend = False ) then
        begin
            uvDispFlg := 1;//決算確定と同様の処理
        end;
    end;
   <Authority> DEL ↑}
// <Authority> ADD ↓
    if (m_JNTAuthority.IsModify = False) then
    begin
        if (m_JNTAuthority.IsAppend = False) then
        begin
            uvDispFlg := 1;//決算確定と同様の処理
        end;
    end;
// <Authority> ADD ↑

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
                    uvDispFlg	:= 1;	// 参照ﾓｰﾄﾞ
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
                uvDispFlg	:= 1;	// 参照ﾓｰﾄﾞ
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    'グループ会計', mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                uvDispFlg	:= 1;	// 参照ﾓｰﾄﾞ
            end;
        end;
	end;
//↑<Rel>

    // 得意先ｺｰﾄﾞの属性対応
    case uvAttr of
        0:  f0CODE.InputAttr    :=  iaZeroSup;
        1:  f0CODE.InputAttr    :=  iaZeroPad;
// <107>       2:  f0CODE.InputAttr    :=  iaFree;
        2:  f0CODE.InputAttr    :=  iaNone;
    end;

    f0CODE.MaxLength    :=  uvDigit;
    ACControl := f0CODE;

//<CD16>↓
	if uvDigit > 10 then
	begin
		f0CODE.width	:= 106+70;
        f0NM.Left		:= 278+70;
        TempMode.Left	:= 723+70;
	end;
//<CD16>↑

    LblTRCODE.Caption   :=  '得意先コード';
    if ( Trim(uvHojyoNm) <> '' ) then
    begin
        LblTRCODE.Caption   :=  uvHojyoNm + 'コード';
    end;

    // 社員ｺｰﾄﾞの属性/桁数対応
    case uvTNAttr of
        // 数値属性
        0:  begin
                f1TNCODE    .InputAttr    :=  iaZeroSup;
                f1TNCODE_Si .InputAttr    :=  iaZeroSup;
            end;
        // 数値(前ｾﾞﾛ有)属性
        1:  begin
                f1TNCODE    .InputAttr    :=  iaZeroPad;
                f1TNCODE_Si .InputAttr    :=  iaZeroPad;
            end;
        // ﾌﾘｰ属性
        2:  begin
//<123>                f1TNCODE    .InputAttr    :=  iaFree;
//<123>                f1TNCODE_Si .InputAttr    :=  iaFree;
                f1TNCODE    .InputAttr    :=  iaNone;
                f1TNCODE_Si .InputAttr    :=  iaNone;
            end;
    end;

    f1TNCODE    .MaxLength    :=  uvTNDigit;
    f1TNCODE_Si .MaxLength    :=  uvTNDigit;

    LblTNCODE.Caption      :=  '担当者ｺｰﾄﾞ';
    LblTNCODE_Si.Caption   :=  '担当者ｺｰﾄﾞ';
    if ( Trim(uvTNHojyoNm) <> '' ) then
    begin
        LblTNCODE.Caption    :=  uvTNHojyoNm + 'ｺｰﾄﾞ';
        LblTNCODE_Si.Caption :=  uvTNHojyoNm + 'ｺｰﾄﾞ';
    end;

    // 部門ｺｰﾄﾞの属性/桁数対応
    case uvBMAttr of
        // 数値属性
        0:  begin
                f1BMCODE    .InputAttr    :=  iaZeroSup;
                f1BMCODE_Si .InputAttr    :=  iaZeroSup;
            end;
        // 数値(前ｾﾞﾛ有)属性
        1:  begin
                f1BMCODE    .InputAttr    :=  iaZeroPad;
                f1BMCODE_Si .InputAttr    :=  iaZeroPad;
            end;
        // ﾌﾘｰ属性
        2:  begin
//<123>                f1BMCODE    .InputAttr    :=  iaFree;
//<123>                f1BMCODE_Si .InputAttr    :=  iaFree;
                f1BMCODE    .InputAttr    :=  iaNone;
                f1BMCODE_Si .InputAttr    :=  iaNone;
            end;
    end;

    f1BMCODE    .MaxLength    :=  uvBMDigit;
    f1BMCODE_Si .MaxLength    :=  uvBMDigit;

    LblBMCODE.Caption      :=  '部門ｺｰﾄﾞ';
    LblBMCODE_Si.Caption   :=  '部門ｺｰﾄﾞ';
    if ( Trim(uvBMHojyoNm) <> '' ) then
    begin
        LblBMCODE.Caption     :=  uvBMHojyoNm + 'ｺｰﾄﾞ';
        LblBMCODE_Si.Caption  :=  uvBMHojyoNm + 'ｺｰﾄﾞ';
    end;

//<134>↓
// 拡張分類の属性/桁数対応
	case uvKTKBN1Attr of
		// 数値属性
		0:	f1KKTKBRCD1.InputAttr	:=	iaZeroSup;
		// 数値(前ｾﾞﾛ有)属性
		1:	f1KKTKBRCD1.InputAttr	:=	iaZeroPad;
		// ﾌﾘｰ属性
		2:	f1KKTKBRCD1.InputAttr	:=	iaNone;
	end;

	f1KKTKBRCD1.MaxLength			:=  uvKTKBN1Digit;
	fKKTKBRNM1.Caption				:=	uvKTKBN1HojyoNm;

	if uvKTKBN1UseKbn = 0 then
	begin
		fKKTKBRNM1.Visible			:= False;
		f1KKTKBRCD1.Visible			:= False;
		f1KKTKBRNM1.Visible			:= False;
	end;

	case uvKTKBN2Attr of
		// 数値属性
		0:	f1KKTKBRCD2.InputAttr	:=	iaZeroSup;
		// 数値(前ｾﾞﾛ有)属性
		1:	f1KKTKBRCD2.InputAttr	:=	iaZeroPad;
		// ﾌﾘｰ属性
		2:	f1KKTKBRCD2.InputAttr	:=	iaNone;
	end;

	f1KKTKBRCD2.MaxLength			:=  uvKTKBN2Digit;
	fKKTKBRNM2.Caption				:=	uvKTKBN2HojyoNm;

	if uvKTKBN2UseKbn = 0 then
	begin
		fKKTKBRNM2.Visible			:= False;
		f1KKTKBRCD2.Visible			:= False;
		f1KKTKBRNM2.Visible			:= False;
	end;

	if (uvKTKBN1UseKbn = 0) and (uvKTKBN2UseKbn = 1) then
	begin
		fKKTKBRNM2.Top				:= fKKTKBRNM1.Top;
		f1KKTKBRCD2.Top				:= f1KKTKBRCD1.Top;
		f1KKTKBRNM2.Top				:= f1KKTKBRNM1.Top;
	end;

	if (uvKTKBN1UseKbn = 0) and (uvKTKBN2UseKbn = 0) then
	begin
		lblLineKKTK.Visible			:= False;
		lblTitleKKTK.Visible		:= False;
	end;


	case uvKSIBN1Attr of
		// 数値属性
		0:	f1KKSIBRCD1.InputAttr	:=	iaZeroSup;
		// 数値(前ｾﾞﾛ有)属性
		1:	f1KKSIBRCD1.InputAttr	:=	iaZeroPad;
		// ﾌﾘｰ属性
		2:	f1KKSIBRCD1.InputAttr	:=	iaNone;
	end;

	f1KKSIBRCD1.MaxLength			:=  uvKSIBN1Digit;
	fKKSIBRNM1.Caption				:=	uvKSIBN1HojyoNm;

	if uvKSIBN1UseKbn = 0 then
	begin
		fKKSIBRNM1.Visible			:= False;
		f1KKSIBRCD1.Visible			:= False;
		f1KKSIBRNM1.Visible			:= False;
	end;

	case uvKSIBN2Attr of
		// 数値属性
		0:	f1KKSIBRCD2.InputAttr	:=	iaZeroSup;
		// 数値(前ｾﾞﾛ有)属性
		1:	f1KKSIBRCD2.InputAttr	:=	iaZeroPad;
		// ﾌﾘｰ属性
		2:	f1KKSIBRCD2.InputAttr	:=	iaNone;
	end;

	f1KKSIBRCD2.MaxLength			:=  uvKSIBN2Digit;
	fKKSIBRNM2.Caption				:=	uvKSIBN2HojyoNm;

	if uvKSIBN2UseKbn = 0 then
	begin
		fKKSIBRNM2.Visible			:= False;
		f1KKSIBRCD2.Visible			:= False;
		f1KKSIBRNM2.Visible			:= False;
	end;

	if (uvKSIBN1UseKbn = 0) and (uvKSIBN2UseKbn = 1) then
	begin
		fKKSIBRNM2.Top				:= fKKSIBRNM1.Top;
		f1KKSIBRCD2.Top				:= f1KKSIBRCD1.Top;
		f1KKSIBRNM2.Top				:= f1KKSIBRNM1.Top;
	end;

	if (uvKSIBN1UseKbn = 0) and (uvKSIBN2UseKbn = 0) then
	begin
		lblLineKKSI.Visible			:= False;
		lblTitleKKSI.Visible		:= False;
	end;
//<134>↑

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pMjsAppRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);

// ↓↓↓<PRN>
    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    // DBとMQueryの接続
    m_pMDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 }
	try
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004004L.BPL'); //<WAN>LoadPackage → LoadPackageHelper

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP004004LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
    	UnloadPackageHelper( lvHandle ); //<WAN>UnloadPackage → UnloadPackageHelper
    end;

    m_RepHandle	:= lvHandle;                // 印刷モジュールハンドル <144>

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

        ArrHdl[0] := @m_JntAuthority;   // <Authority> ADD

		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(Self,
                m_Base_pRec,
                m_pMDataModule,
                ComArea,
                dbCorp_Select,
                'JNTCRP004004',
                uvHani,
                uvSelSys);

// ↑↑↑<PRN>

	// -----<MHIS> Add-St-----
//<D10>	SPMsHist.DatabaseName := dbCorp_Select.DatabaseName;
//<D10>	SPMsHist.SessionName  := dbCorp_Select.SessionName;
    m_pMDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );


	SPMsHist.Connection	:= dbCorp_Select;		//<D10>

	// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = 1 then
	begin
//<D10>	SPMsHistParent.DatabaseName	:= m_SyncMaster.m_cPDBSelect.DatabaseName;
//<D10>	SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	    m_pMDataModule.SetDBInfoToSProc( m_SyncMaster.m_cPDBSelect, SPMsHistParent );	//<D10>
	end;
	// -----<MHIS> Add-Ed-----

    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);		// ｲﾍﾞﾝﾄOnCreateの最後に

end;

//=============================================================================
//  フォーム廃棄時処理
//=============================================================================
procedure TFrmJNTCRP004004F.FormDestroy(Sender: TObject);
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

// <144>↓↓
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
// <144>↑↑

end;

//=============================================================================
//  終了前処理
//=============================================================================
procedure TFrmJNTCRP004004F.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
// <125> FormCloseに移動
{    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;
}
//    m_cJNTArea.Free;

	// ﾌﾟﾚﾋﾞｭｰの状態をﾁｪｯｸする
    if ( uvHani.mjspre <> nil ) then
    begin
	    if ( uvHani.mjspre.IsPreView = True ) then
        begin
			uvSelSys.MsgDlg(10040,2);
            CanClose := False;
            Exit;
        end;
    end;

	//<HGA3>↓
    if (uvBtUpdFlg = False) then
	begin
		uvEdtSw := False;;
    end;
	//<HGA3>↑

    //編集結果を確認する
    if uvEdtSw then
    begin

        //<47> Add ↓
        //終了確認
        if fnCloseConfirm = False then
        begin
            CanClose := False;
            Exit;
        end;
    end;

    // IMEを閉じる
    Self.ImeMode := imClose;
    Self.SetIme;

//  B_Print.Enabled :=  True; // <106>

end;

//=============================================================================
//  終了処理
//=============================================================================
procedure TFrmJNTCRP004004F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	AppPrm	: TAppParam;
begin

    uvClose     :=  True; // <100>
    B_Print     :=  nil;
    m_CmpList   :=  nil;

// <125> CloseQueryから移動
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;                       // 検索EXP解放

    // 販売ｼｽﾃﾑ情報の開放
    if ( uvSelSys <> nil ) then
	uvSelSys.Free;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();


    // 会社DBｸﾛｰｽﾞ処理
    if ( dbCorp_Select <> nil ) then
        m_pMDataModule.COPDBClose(dbCorp_Select);
    // ﾄﾗﾝｻﾞｸｼｮﾝDBｸﾛｰｽﾞ処理
    if ( uvTranDB <> nil ) then
        m_pMDataModule.COPDBClose(uvTranDB);

	// TFDConnectionのマッピングをクリア<D10>
	if m_SyncMaster.m_flgGrpCorp = 1 then
	begin
		m_SyncMaster.m_cPDBSelect.FormatOptions.MapRules.Clear;
		m_SyncMaster.m_cPDBSelect.FormatOptions.OwnMapRules := False;
	end;

    // ﾌｫｰﾑ終了処理
	Action := caFree;

    // 郵便番号辞書 終了
    if uvPostExpOpenSW = TRUE then
    	fnCMNPostFree;

	{MJS共通仕様	START}
	m_pMjsAppRec^.m_iDelete   := 1;
	AppPrm.iAction		:= ACTID_FORMCLOSEEND;				// 呼び出し区分設定
	AppPrm.pRecord		:= Pointer(m_pMjsAppRec);		    // 管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam	:= nil;				  				// 予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord(m_pMjsAppRec^).m_pOwnerEntry(@AppPrm);

	{MJS共通仕様	END}

    // ﾌｫｰﾑのﾒﾓﾘを解放する
    FrmJNTCRP004004F := nil;

end;

//=============================================================================
//  ボタンクリック処理
//=============================================================================
procedure TFrmJNTCRP004004F.BtnClick(Sender: TObject);
begin

    fnBtnOnChange(TComponent(Sender).Name);

end;

//<PASS>add S
//=============================================================================
//  パスワード表示ボタン（目ボタン）クリック処理
//=============================================================================
procedure TFrmJNTCRP004004F.btnMaskClick(Sender: TObject);
begin
	if (Sender = btnMask) then
	begin
        if f1PASSWORD.PasswordChar = #0 then
            f1PASSWORD.PasswordChar := '*'
        else
            f1PASSWORD.PasswordChar := #0;
    end
	else if (Sender = btnMask_si) then
	begin
        if f1PASSWORD_Si.PasswordChar = #0 then
            f1PASSWORD_Si.PasswordChar := '*'
        else
            f1PASSWORD_Si.PasswordChar := #0;
    end;
end;
//<PASS>add E

//=============================================================================
//  各ｺﾝﾄﾛｰﾙON Changeｲﾍﾞﾝﾄ処理
//=============================================================================
procedure TFrmJNTCRP004004F.fnFldOnChg(Sender: TObject);
begin

    // 編集ｽｲｯﾁを設定する
    if uvEdtSw = False then uvEdtSw := True;

//<PASS>Add S
	// パスワード設定（得意先）
	if (Sender = f1PASSKBN) then
	begin
		case f1PASSKBN.AsInteger of
		1,4:	// パスワード不要、請求先参照
			begin
				// パスワード合成項目
				f1PASSITEMKBN1.Enabled		:= False;
				f1PASSITEMKBN2.Enabled		:= False;
				f1PASSITEMKBN1.Value		:= 0;
				f1PASSITEMKBN2.Value		:= 0;
				f1PASSITEMKBN1NM.Caption	:= '';
				f1PASSITEMKBN2NM.Caption	:= '';
				// パスワード入力
				f1PASSWORD.Enabled	:= False;
				f1PASSWORD.Text		:= '';
				btnMask.Enabled		:= False;
			end;
		2:		// パスワード合成
			begin
				// パスワード合成項目
				f1PASSITEMKBN1.Enabled 		:= True;
				f1PASSITEMKBN2.Enabled 		:= True;

				// パスワード入力
				f1PASSWORD.Enabled	:= False;
				f1PASSWORD.Text		:= '';
				btnMask.Enabled		:= False;
				end;
		3:		// 直接入力
			begin
				// パスワード合成項目
				f1PASSITEMKBN1.Enabled		:= False;
				f1PASSITEMKBN2.Enabled		:= False;
				f1PASSITEMKBN1.Value		:= 0;
				f1PASSITEMKBN2.Value		:= 0;
				f1PASSITEMKBN1NM.Caption	:= '';
				f1PASSITEMKBN2NM.Caption	:= '';

				// パスワード入力
				// テンプレートモードの時、直接入力欄は使用不可
				if not uvTempFlg then
				begin
					f1PASSWORD.Enabled	:= True;
					btnMask.Enabled		:= True;
                end
				else
				begin
					f1PASSWORD.Enabled	:= False;
					btnMask.Enabled		:= False;
                end;

			end;
		end;
	end;

	// パスワード設定（仕入先）
	if (Sender = f1PASSKBN_Si) then
	begin
		case f1PASSKBN_Si.AsInteger of
		1,4:	// パスワード不要、請求先参照
			begin
				// パスワード合成項目
				f1PASSITEMKBN1_Si.Enabled		:= False;
				f1PASSITEMKBN2_Si.Enabled		:= False;
				f1PASSITEMKBN1_Si.Value		:= 0;
				f1PASSITEMKBN2_Si.Value		:= 0;
				f1PASSITEMKBN1NM_Si.Caption	:= '';
				f1PASSITEMKBN2NM_Si.Caption	:= '';

				// パスワード入力
				f1PASSWORD_Si.Enabled	:= False;
				f1PASSWORD_Si.Text		:= '';
				btnMask_Si.Enabled		:= False;
			end;
		2:		// パスワード合成
			begin
				// パスワード合成項目
				f1PASSITEMKBN1_Si.Enabled 		:= True;
				f1PASSITEMKBN2_Si.Enabled 		:= True;

				// パスワード入力
				f1PASSWORD_Si.Enabled	:= False;
				f1PASSWORD_Si.Text		:= '';
				btnMask_Si.Enabled		:= False;
				end;
		3:		// 直接入力
			begin
				// パスワード合成項目
				f1PASSITEMKBN1_Si.Enabled		:= False;
				f1PASSITEMKBN2_Si.Enabled		:= False;
				f1PASSITEMKBN1_Si.Value		:= 0;
				f1PASSITEMKBN2_Si.Value		:= 0;
				f1PASSITEMKBN1NM_Si.Caption	:= '';
				f1PASSITEMKBN2NM_Si.Caption	:= '';

				// パスワード入力
				// テンプレートモードの時、直接入力欄は使用不可
				if not uvTempFlg then
				begin
					f1PASSWORD_Si.Enabled	:= True;
					btnMask_Si.Enabled		:= True;
                end
				else
				begin
					f1PASSWORD_Si.Enabled	:= False;
					btnMask_Si.Enabled		:= False;
                end;

			end;
		end;
	end;
//<PASS>Add E
end;

//-----------------------------------------------------------------------------
//  フォームの初期化
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnInzForm;
begin

    f0CODE         .Zero := False;     //<122>
    f0CODE         .InputFlag := True; //<122>
    f1BMCODE       .Zero := False;     //<122>
    f1BMCODE       .InputFlag := True; //<122>
    f1BMCODE_Si    .Zero := False;     //<122>
    f1BMCODE_Si    .InputFlag := True; //<122>
    f1TNCODE       .Zero := False;     //<122>
    f1TNCODE       .InputFlag := True; //<122>
    f1TNCODE_Si    .Zero := False;     //<122>
    f1TNCODE_Si    .InputFlag := True; //<122>

    //フォームの初期化[f1]
    fnInzFormf1;

	//初期化
	uvBtUpdFlg := true;

    //ボタンの状態を制御する
    fnBtnEnbChg;

    // 編集状態ｽｲｯﾁを初期化する
    uvEdtSw := False;

    //Tabを元に戻す
    MTab1.Items.Selected := 0;

    f0CODE.Text :='';
    f0NM.Text :='';

    //<100>
    TempMode.visible := False;
    uvTempFlg        := False;

//<133>↓
	Blind_TK.Visible      := True;
	Blind_SI.Visible      := True;

	Blind_Othr_TK.Visible := True;
	Blind_Othr_Si.Visible := True;
//<133>↑

    Mtab1.Items[0].Visible := True;
    Mtab1.Items[1].Visible := True;
    Mtab1.Items[2].Visible := True;
    Mtab1.Items[3].Visible := True;
    Mtab1.Items[4].Visible := True;
    Mtab1.Items[5].Visible := True;

    MPnlUr.Enabled := True;
    MPnlSi.Enabled := True;

    //<101>･･････････････････････････････････････↓↓↓
    with uvData_Load do
    begin
        pvrYYKbn    := 0;       //和暦西暦区分
        pvrDaiNMKbn := 0;       //代表社名の印字
    end;
    //<101>･･････････････････････････････････････↓↓↓
    with uvData_Load_S do
    begin
        pvrYYKbn    := 0;       //和暦西暦区分
        pvrDaiNMKbn := 0;       //代表社名の印字
    end;

//<133>
	fnLicenseCheck;

//<PASS>Add S
//↓外部連携区分は2022年4月リリースでは未対応　外部連携対応時に記載を削除してください
    lblBAR1.Visible				:= False;
    f1APIKBN.Visible			:= False;
    f1APIKBNNM.Visible			:= False;
    lblAPIKBN.Visible			:= False;
    lblAPIKBN_H.Visible			:= False;

    lblBAR1_Si.Visible				:= False;
    f1APIKBN_Si.Visible				:= False;
    f1APIKBNNM_Si.Visible			:= False;
    lblAPIKBN_Si.Visible			:= False;
    lblAPIKBN_H_Si.Visible			:= False;
//↑外部連携区分は2022年4月リリースでは未対応　外部連携対応時に記載を削除してください

//外部連携区分、パスワード関連項目はDXのみ使用可
//外部連携区分は2022年4月リリースでは未対応 外部連携対応時にコメントアウトを解除してください。
    if TMSeries3.isGalileopt4 then
    begin
//        lblBAR1.Visible				:= True;
//        lblBAR2.Visible				:= True;
//        f1APIKBN.Visible			:= True;
//        f1APIKBNNM.Visible			:= True;
//        lblAPIKBN.Visible			:= True;
//        lblAPIKBN_H.Visible			:= True;
        lblBAR2.Visible				:= True;
        lblPASS_H.Visible			:= True;
        lblPASSKBN.Visible			:= True;
        lblPASSITEMKBN.Visible		:= True;
        lblPLUS.Visible				:= True;
        lblPASSWORD.Visible			:= True;
        f1PASSKBN.Visible			:= True;
        f1PASSKBNNM.Visible			:= True;
        f1PASSITEMKBN1.Visible		:= True;
        f1PASSITEMKBN1NM.Visible	:= True;
        f1PASSITEMKBN2.Visible		:= True;
        f1PASSITEMKBN2NM.Visible	:= True;
        f1PASSWORD.Visible			:= True;
        btnMask.Visible				:= True;

//        lblBAR1_Si.Visible				:= True;
//        f1APIKBN_Si.Visible				:= True;
//        f1APIKBNNM_Si.Visible			:= True;
//        lblAPIKBN_Si.Visible			:= True;
//        lblAPIKBN_H_Si.Visible			:= True;
//        lblBAR2_Si.Visible				:= True;
        lblPASS_H_Si.Visible			:= True;
        lblPASSKBN_Si.Visible			:= True;
        lblPASSITEMKBN_Si.Visible		:= True;
        lblPLUS_Si.Visible				:= True;
        lblPASSWORD_Si.Visible			:= True;
        f1PASSKBN_Si.Visible			:= True;
        f1PASSKBNNM_Si.Visible			:= True;
        f1PASSITEMKBN1_Si.Visible		:= True;
        f1PASSITEMKBN1NM_Si.Visible		:= True;
        f1PASSITEMKBN2_Si.Visible		:= True;
        f1PASSITEMKBN2NM_Si.Visible		:= True;
        f1PASSWORD_Si.Visible			:= True;
        btnMask_Si.Visible				:= True;
    end
    else
    begin
        lblBAR1.Visible				:= False;
        f1APIKBN.Visible			:= False;
        f1APIKBNNM.Visible			:= False;
        lblAPIKBN.Visible			:= False;
      	lblAPIKBN_H.Visible			:= False;
        lblBAR2.Visible				:= False;
        lblPASS_H.Visible			:= False;
        lblPASSKBN.Visible			:= False;
        lblPASSITEMKBN.Visible		:= False;
        lblPLUS.Visible				:= False;
        lblPASSWORD.Visible			:= False;
        f1PASSKBN.Visible			:= False;
        f1PASSKBNNM.Visible			:= False;
        f1PASSITEMKBN1.Visible		:= False;
        f1PASSITEMKBN1NM.Visible	:= False;
        f1PASSITEMKBN2.Visible		:= False;
        f1PASSITEMKBN2NM.Visible	:= False;
        f1PASSWORD.Visible			:= False;
        btnMask.Visible				:= False;

        lblBAR1_Si.Visible				:= False;
        f1APIKBN_Si.Visible				:= False;
        f1APIKBNNM_Si.Visible			:= False;
        lblAPIKBN_Si.Visible			:= False;
        lblAPIKBN_H_Si.Visible			:= False;
        lblBAR2_Si.Visible				:= False;
        lblPASS_H_Si.Visible			:= False;
        lblPASSKBN_Si.Visible			:= False;
        lblPASSITEMKBN_Si.Visible		:= False;
        lblPLUS_Si.Visible				:= False;
        lblPASSWORD_Si.Visible			:= False;
        f1PASSKBN_Si.Visible			:= False;
        f1PASSKBNNM_Si.Visible			:= False;
        f1PASSITEMKBN1_Si.Visible		:= False;
        f1PASSITEMKBN1NM_Si.Visible		:= False;
        f1PASSITEMKBN2_Si.Visible		:= False;
        f1PASSITEMKBN2NM_Si.Visible		:= False;
        f1PASSWORD_Si.Visible			:= False;
        btnMask_Si.Visible				:= False;
    end;

    if TMSeries3.isGalileopt4 then
	begin
	//フォーム起動時、編集キャンセル時はパスワードの表示用ボタンを未使用、マスク処理を行う。
	btnMask.Enabled 		:= false;
	f1PASSWORD.PasswordChar := '*';

	btnMask_Si.Enabled			:= false;
	f1PASSWORD_Si.PasswordChar	:= '*';

	end;
//<PASS>add E
end;

//-----------------------------------------------------------------------------
//  フォームの初期化[f1]
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnInzFormf1;
begin

    //項目のクリア
    JNTSelXClrCtrls(Self, 'f1');
    // [f1]項目を使用不可にする
    MPnlTop.Enabled   := True;
    tbsKihon.Enabled  := False;
    tbsInput.Enabled  := False;
    tbsInputS.Enabled := False;
    tbsPrint.Enabled  := False;
    tbsPrintS.Enabled := False;
    tbsOther.Enabled  := False;

    //変数の初期化
    uvEdtSw         := False;
    uvRecGetSw      := False;

    //郵便番号２
  	f1POSTNO2.Zero  := False;
  	f1POSTNO2_Si.Zero  := False; //<PST2>

    //送り状
    f1SOFOPFM.Zero  := False;
end;

//-----------------------------------------------------------------------------
//  選択文字列を作成する
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnKbnStrSet;
var
    Str: TStringList;
begin

    //文字列オブジェクトを作成する
    try
        Str := TStringList.Create;

        //
        //[基本情報]ページ
        //

        //敬称区分（得意先）
        gfnJNTSELKeiKbnStrSet(Qry, 'ALL', '敬称区分', Str);
        f1KeisyoKbn.SelectItems := Str;

        //敬称区分（仕入先）
        gfnJNTSELKeiKbnStrSet(Qry, 'ALL', '敬称区分', Str);
        f1KeisyoKbn_Si.SelectItems := Str;

        //
        //[入力・集計情報]ページ
        //

    //【売上・仕入共通】
        //[売上端数区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '端数区分', Str);
        f1URKINHSUKBN.SelectItems := Str;
        f1URKINHSUKBN_Si.SelectItems := Str;

        //[現売税請求区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '現税請求区分', Str);
        f1GRUZSEIKBN.SelectItems := Str;
        f1GRUZSEIKBN_SI.SelectItems := Str;

        //[消費税請求区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '掛税請求区分', Str);
        f1ZSEIKBN.SelectItems := Str;
        f1ZSEIKBN_SI.SelectItems := Str;

        //[消費税端数処理区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '端数区分', Str);
        f1ZHSUKBN.SelectItems := Str;
        f1ZHSUKBN_Si.SelectItems := Str;

        //[消費税端数単位区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '税端数単位', Str);
        f1ZHSUTNIKBN.SelectItems := Str;
        f1ZHSUTNIKBN_Si.SelectItems := Str;

        //[取引区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, ucMKBN_TBLNAME, '伝票取引区分',  Str);
        f1TRIHIKIKBN.SelectItems    := Str;
        gfnJNTSELKbnStrSet(Qry, ucMKBN_TBLNAME, '伝票取引区分2', Str);
        f1TRIHIKIKBN_Si.SelectItems := Str;

        //[名称変更区分名]を作成する
        //gfnJNTSELKbnStrSet(Qry, 'ALL', '名称変更', Str);      //<141>
        gfnJNTSELKbnStrSet(Qry, 'ALL', '有無区分６', Str);
        f1NMKBN.SelectItems := Str;
        f1NMKBN_Si.SelectItems := Str;

        //[指定商品コード区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, ucMKBN_TBLNAME, '指定商品', Str);
        f1SSHCDKBN.SelectItems := Str;
        f1SSHCDKBN_Si.SelectItems := Str;

        //
        //[印刷情報]ページ
        //
    //【売上・仕入共通】
        //[和暦西暦区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '和暦西暦区分', Str);
        f1YYKBN.SelectItems := Str;
        f1YYKBN_Si.SelectItems:= Str;

        //[代表者名の印字区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, ucMKBN_TBLNAME, '有無区分２', Str);
        f1DAINMKBN.SelectItems := Str;
        f1DAINMKBN_Si.SelectItems := Str;

        //[売上合計欄税の印字区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '税金額区分', Str);
        f1USGKEI.SelectItems := Str;
        f1USGKEI_Si.SelectItems := Str;

        //[上代合計欄税の印字区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '税金額区分', Str);
        f1JYGKEI.SelectItems := Str;

//<KOJ> Ins-s
        //[工事合計欄税の印字区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '税金額区分', Str);
        f1KUSGKEI_Tk.SelectItems := Str;
        f1KUSGKEI_Si.SelectItems := Str;
//<KOJ> Ins-e

//<PASS>Add S
        gfnJNTSELKbnStrSet(Qry, 'ALL', '外部連携区分', Str);
        f1APIKBN.SelectItems := Str;
        f1APIKBN_Si.SelectItems := Str;

        gfnJNTSELKbnStrSet(Qry, 'ALL', 'パスワード区分', Str);
        f1PASSKBN.SelectItems := Str;
        f1PASSKBN_Si.SelectItems := Str;
//<PASS>Add E

    finally
        Str.Free;
    end;

end;

//-----------------------------------------------------------------------------
//  ボタンの状態を制御する
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnBtnEnbChg;
begin

    //ボタンの状態を制御する
    MjsSetEnabled(Self,ucBtnOK,uvRecGetSw);
    MjsSetEnabled(Self,ucBtnNG,uvRecGetSw);
    MjsSetEnabled(Self,ucBtnBEFOR,uvRecGetSw);
    MjsSetEnabled(Self,ucBtnAfter,uvRecGetSw);

    fnBtnEnabled;

end;

//-----------------------------------------------------------------------------
//  編集をキャンセルする
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnCancel(FcsChg: Boolean): Boolean;
begin

    Result := False;

    //編集結果を確認する
    if uvEdtSw then
    begin
		if uvSelSys.MsgDlg(1010,103) = mrNo then
        begin
            Result := True;
            MjsSetFocus(Self, ucBtnNG);
            Exit;
        end;
    end;

    //フォームの初期化
    fnInzForm;

    //編集ｽｲｯﾁを初期化
    uvEdtSw := False;

    //主キー項目へフォーカスを移動する
    if FcsChg then
    begin
        MjsSetFocus(Self, ucKeyFld);
    end;
end;

//-----------------------------------------------------------------------------
//  フィールド入力値のチェックをする
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
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
    iSeiKbn     : Integer;  //<100>請求区分
    iOyakoFL    : Integer;  //<100>親子フラグ
    lvErrCod    : Integer;  //<100>エラーコード

begin

    Result := True;

    lvCompoName := TComponent(Sender).Name;

//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//
// [基本情報]ページ
//
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

    //===================================================================
    //得意先関係
    //===================================================================

    //===================================================================
    //取引先コード
    //===================================================================
    if uvTempFlg = False then
    begin
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
                    uvSelSys.MsgDlg(1010,10);   //必須入力です。
                    SetFocus;
                    Result := False;
                    Exit;
                end;
                if JNTSelXKanjiCheck(Text) = True then
                begin
                    uvSelSys.MsgDlg(1010,20);   // <226>入力値に漢字もしくは特殊文字が含まれています。
                    SetFocus;
                    Result := False;
                    Exit;
                end;
                lvErrCod := fnChkTRCODE;
                if lvErrCod <> 0 then
                begin
{↓<Rel>
                    if lvErrCod = 1 then
                		MjsMessageBox(Self, '得意先又は仕入先が採用されていない取引先です。', mjInformation, mjDefOk)
                    else
                        uvSelSys.MsgDlg(1010,50);
↑<Rel>}
//↓<Rel>
                    case lvErrCod of
                        1:
                        begin
                    		MjsMessageBox(Self, '得意先又は仕入先が採用されていない取引先です。', mjInformation, mjDefOk)
                        end;
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
//↑<Rel>
                    SetFocus;
                    Result := False;
                    Exit;
                end;
                if AllChkMode = False then Exit;
            end;
        end;
    end;

    //郵便番号1
    with f1POSTNO1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //郵便番号2
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
    //住所１
    with f1ADS1 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //住所２
    with f1ADS2 do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //電話番号1
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
    //電話番号2
    with f1TEL2 do
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
    //ＦＡＸ番号
    with f1FAX1 do
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
    //送付部署
    with f1SectionName do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理

            if AllChkMode = False then Exit;
        end;
    end;
    //担当者名
    with f1TanNM do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理

            if AllChkMode = False then Exit;
        end;
    end;

    //敬称
    with f1KeisyoKbn do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理
                Text := f1KEISYOKBN.SelectItems[0];
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //部門コード
    //===================================================================
    with f1BMCODE do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            //<122> --- St ---
            if uvBMAttr <> 2 then
            begin
                if f1BMCODE.InputFlag = False then
                    f1BMCODE.Zero := True
                else
                    f1BMCODE.Zero := False;
            end
            else
                f1BMCODE.Zero := False;
            //<122> --- Ed ---

            f1BMNAME.Caption   := '';
			Text := TrimRight(Text);	//<233>

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpTKBM,41);

            if Trim(Text) <> '' then
            begin
// <108>                if fnGetNAME(Text,41,uvBMAttr,lvNMK ) = False then
                if fnGetNAME(f1BMCODE,f1BMCODE.Text,41,uvBMAttr,lvNMK ) = False then    // <108>
                begin
                    f1BMNAME.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 0;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    //f1BMNAME.Caption   := lvNmk;	//<2466>
                    //<2466>部門検索EXPから取得した名称をセット
                    if m_BumonNcodeEx > 0 then  f1BMNAME.Caption   := m_BumonNMkEX
                        else  f1BMNAME.Caption   := lvNmk
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //担当者コード
    //===================================================================
    with f1TNCODE do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            //<122> --- St ---
            if uvTNAttr <> 2 then
            begin
                if f1TNCODE.InputFlag = False then
                    f1TNCODE.Zero := True
                else
                    f1TNCODE.Zero := False;
            end
            else
                f1TNCODE.Zero := False;
            //<122> --- Ed ---

            f1TNNAME.Caption   := '';
			Text := TrimRight(Text);	//<233>

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpTKTN,25);

            if Trim(Text) <> '' then
            begin
// <108>                if fnGetNAME(Text,25,uvTNAttr,lvNMK ) = False then
                if fnGetNAME(f1TNCODE,f1TNCODE.Text,25,uvTNAttr,lvNMK ) = False then    // <108>
                begin
                    f1TNNAME.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 0;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1TNNAME.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //仕入先関係
    //===================================================================

    //郵便番号１(仕入先)
    with f1POSTNO1_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //郵便番号２(仕入先)
    with f1POSTNO2_Si do
    begin
        if (lvCompoName = Name) then
        begin
	        fnCallPostExplorer('郵便2',f1POSTNO1_Si,f1POSTNO2_Si,f1ADS1_Si,f1ADS2_Si);

   			//ゼロ表示
            if f1POSTNO1_Si.Value <> 0 then
               	f1POSTNO2_Si.Zero := True
            else
               	f1POSTNO2_Si.Zero := False;

            if AllChkMode = False then Exit;
        end;
    end;
    //住所１(仕入先)
    with f1ADS1_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //住所２(仕入先)
    with f1ADS2_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin

            if AllChkMode = False then Exit;
        end;
    end;
    //電話番号１(仕入先)
    with f1TEL1_Si do
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
    //電話番号２(仕入先)
    with f1TEL2_Si do
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
    //ＦＡＸ番号(仕入先)
    with f1FAX1_Si do
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
    //送付部署(仕入先)
    with f1SectionName_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理

            if AllChkMode = False then Exit;
        end;
    end;
    //担当者名(仕入先)
    with f1TanNM_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理

            if AllChkMode = False then Exit;
        end;
    end;
    //敬称(仕入先)
    with f1KeisyoKbn_Si do
    begin
        if (AllChkMode) or (lvCompoName = Name) then
        begin
            if Trim(Text) = '' then
                //未入力時処理
                Text := f1KEISYOKBN_Si.SelectItems[0];
            if AllChkMode = False then Exit;
        end;
    end;

    //===================================================================
    //部門コード
    //===================================================================
    with f1BMCODE_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            //<122> --- St ---
            if uvBMAttr <> 2 then
            begin
                if f1BMCODE_Si.InputFlag = False then
                    f1BMCODE_Si.Zero := True
                else
                    f1BMCODE_Si.Zero := False;
            end
            else
                f1BMCODE_Si.Zero := False;
            //<122> --- Ed ---

            f1BMNAME_Si.Caption   := '';

			Text := TrimRight(Text);	//<233>

			if (Text = '') and (not uvTempFlg) then
				//Text := fnGetGCODE(uvTmpSIBM,41);	//<2466>
				Text := fnGetGCODE_Si(uvTmpSIBM,41);	//<2466>

            if Trim(Text) <> '' then
            begin
// <108>                if fnGetNAME(Text,41,uvBMAttr,lvNMK ) = False then
                if fnGetNAME(f1BMCODE_Si,f1BMCODE_Si.Text,41,uvBMAttr,lvNMK ) = False then  // <108>
                begin
                    f1BMNAME_Si.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 0;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    //f1BMNAME_Si.Caption   := lvNmk;	//<2466>
                    //部門検索EXPから取得した名称をセット
                    if m_BumonNCodeEx_Si > 0 then  f1BMNAME_Si.Caption   := m_BumonNMKEx_Si
                        else  f1BMNAME_Si.Caption   := lvNmk
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //===================================================================
    //担当者コード
    //===================================================================
    with f1TNCODE_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

            //<122> --- St ---
            if uvTNAttr <> 2 then
            begin
                if f1TNCODE_Si.InputFlag = False then
                    f1TNCODE_Si.Zero := True
                else
                    f1TNCODE_Si.Zero := False;
            end
            else
                f1TNCODE_Si.Zero := False;
            //<122> --- Ed ---

            f1TNNAME_Si.Caption   := '';

			Text := TrimRight(Text);	//<233>

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpSITN,25);

            if Trim(Text) <> '' then
            begin
// <108>                if fnGetNAME(Text,25,uvTNAttr,lvNMK ) = False then
                if fnGetNAME(f1TNCODE_Si,f1TNCODE_Si.Text,25,uvTNAttr,lvNMK ) = False then  // <108>
                begin
                    f1TNNAME_Si.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 0;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1TNNAME_Si.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//
// [入力・集計情報]ページ
//
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

    //===================================================================
    //得意先関係
    //===================================================================

    //売上端数区分
    with f1URKINHSUKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

            if Value = 0 then
                Value := uvTmpURKINHSUKBN;

            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', AsInteger, lvNm) = False then
                begin
                    f1URKINHSUKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1URKINHSUKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //現売税請求区分
    with f1GRUZSEIKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpGRUZSEIKBN;

            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', AsInteger, lvNm, 0) = False then
                begin
                    f1GRUZSEIKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1GRUZSEIKBNNM.Caption    := lvNm;

                if (AllChkMode) then
                begin
                    //「9:請求しない」で消費税請求区分が「9:請求しない」以外ならエラー
                    if ((AsInteger = 9) and (f1ZSEIKBN.AsInteger <> 9)) then
                    begin
                        uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                        MTab1.Items.Selected := 1;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;
                fnZeiKbnChange(Name);

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税請求区分
    with f1ZSEIKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpZSEIKBN;

            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', AsInteger, lvNm, 0) = False then
                begin
                    f1ZSEIKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZSEIKBNNM.Caption    := lvNm;

                //--------------------------------------------
                // 通常以外は請求書単位はエラー
                //--------------------------------------------
                if (uvSeiKbn <> 0) and (Value = 2) then
                begin
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if (AllChkMode) then
                begin
                    //「9:請求しない」で現売税請求区分が「9:請求しない」以外ならエラー
                    if ((AsInteger = 9) and (f1GRUZSEIKBN.AsInteger <> 9)) then
                    begin
                        uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                        MTab1.Items.Selected := 1;
                        f1GRUZSEIKBN.SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;
                fnZeiKbnChange(Name);

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税端数処理
    with f1ZHSUKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpZHSUKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', AsInteger, lvNm) = False then
                begin
                    f1ZHSUKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZHSUKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税端数単位
    with f1ZHSUTNIKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvtmpZHSUTNIKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税端数単位', AsInteger, lvNm) = False then
                begin
                    f1ZHSUTNIKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZHSUTNIKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
//<134>↓
    //===================================================================
    //得意先拡張分類１
    //===================================================================
    with f1KKTKBRCD1 do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpKTKBN1,811);

{
            if uvKTKBN1Attr <> 2 then
            begin
//                if f1KKTKBRCD1.InputFlag = False then
                if f1KKTKBRCD1.Text <> '' then
                    f1KKTKBRCD1.Zero := True
                else
                    f1KKTKBRCD1.Zero := False;
            end
            else
                f1KKTKBRCD1.Zero := False;
}

            f1KKTKBRNM1.Caption   := '';
			Text := TrimRight(Text);	//<233>
            if Trim(Text) <> '' then
            begin
                if fnGetNAME(f1KKTKBRCD1,f1KKTKBRCD1.Text,811,uvKTKBN1Attr,lvNMK ) = False then    // <108>
                begin
                    f1KKTKBRNM1.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1KKTKBRNM1.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;

    //===================================================================
    //得意先拡張分類２
    //===================================================================
    with f1KKTKBRCD2 do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpKTKBN2,812);

{
            if uvKTKBN2Attr <> 2 then
            begin
//                if f1KKTKBRCD2.InputFlag = False then
                if f1KKTKBRCD2.Text <> '' then
                    f1KKTKBRCD2.Zero := True
                else
                    f1KKTKBRCD2.Zero := False;
            end
            else
                f1KKTKBRCD2.Zero := False;
}

            f1KKTKBRNM2.Caption   := '';
			Text := TrimRight(Text);	//<233>
            if Trim(Text) <> '' then
            begin
                if fnGetNAME(f1KKTKBRCD2,f1KKTKBRCD2.Text,812,uvKTKBN2Attr,lvNMK ) = False then    // <108>
                begin
                    f1KKTKBRNM2.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1KKTKBRNM2.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
//<134>↑
    //取引区分
    with f1TRIHIKIKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpTRIHIKIKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分', AsInteger, lvNm) = False then
                begin
                    f1TRIHIKIKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1TRIHIKIKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //名称変更区分
    with f1NMKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpNMKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                //if gfnJNTSELKBNNameGet(Qry, 'ALL', '名称変更', AsInteger, lvNm) = False then      //<141>
                if gfnJNTSELKBNNameGet(Qry, 'ALL', '有無区分６', AsInteger, lvNm) = False then
                begin
                    f1NMKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1NMKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //単価ランク
    with f1TNKRNK do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
//↓<139>
            if (Value = 0) and (not uvTempFlg) then
                Value := uvTmpTnkRnk;
//↑<139>
            if AllChkMode = False then Exit;
        end;
    end;
    //単価掛率
    with f1KAKERT do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
//↓<139>
            if (Value = 0) and (not uvTempFlg) then
                Value := uvTmpKakeRt;
//↑<139>
            if AllChkMode = False then Exit;
        end;
    end;
    //指定商品コード区分
    with f1SSHCDKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpSSHCDKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '指定商品', AsInteger, lvNm) = False then
                begin
                    f1SSHCDKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1SSHCDKBNNM.Caption    := lvNm;

                if Value = 1 then
                begin
                    f1SSHCDKET.Value := 0;
                    fnChgCmpEna(False, f1SSHCDKET);
                end
                else
                    fnChgCmpEna(True, f1SSHCDKET);

            end; //<143>
        end;
    end;
    //指定商品コード桁数
    with f1SSHCDKET do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Value = 0) and (f1SSHCDKBN.Value <> 1) then
                Value := uvTmpSSHCDKET;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                //<135>            if ((Value = 0) or (Value > 20)) and (f1SSHCDKBN.Value <> 1) then
                //<135>↓
                // 属性が数値の時は14桁まで
                if (((Value = 0) or (Value > 20)) and (f1SSHCDKBN.Value = 2))
                    or (((Value = 0) or (Value > 14)) and (f1SSHCDKBN.Value = 3))  then
                //<135>↑
                begin
    //<137>				uvSelSys.MsgDlg(1010,40);
    //<137>↓
                    // ﾌﾘｰ
                    if f1SSHCDKBN.Value = 2 then
                    begin
                        MjsMessageBox(Self, '1～20桁の範囲で設定してください。', mjWarning, mjDefOk);
                    end
                    // 数値
                    else if f1SSHCDKBN.Value = 3 then
                    begin
                        MjsMessageBox(Self, '1～14桁の範囲で設定してください。', mjWarning, mjDefOk);
                    end;
    //<137>↑
                    MTab1.Items.Selected := 1;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

            end; //<143>
        end;
    end;
    //===================================================================
    //仕入先関係
    //===================================================================

    //仕入端数区分
    with f1URKINHSUKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpURKINHSUKBN_Si;

            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', AsInteger, lvNm) = False then
                begin
                    f1URKINHSUKBNNM_Si.Caption    := '';
			    	uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1URKINHSUKBNNM_Si.Caption    := lvNm;

			end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //現仕税支払区分
    with f1GRUZSEIKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpGRUZSEIKBN_Si;

            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', AsInteger, lvNm, 0) = False then
                begin
                    f1GRUZSEIKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1GRUZSEIKBNNM_Si.Caption    := lvNm;

                if (AllChkMode) then
                begin
                    //「9:請求しない」で消費税請求区分が「9:請求しない」以外ならエラー
                    if ((AsInteger = 9) and (f1ZSEIKBN_Si.AsInteger <> 9)) then
                    begin
                        uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                        MTab1.Items.Selected := 2;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;
                fnZeiKbnChange(Name);

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税支払区分
    with f1ZSEIKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpZSEIKBN_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', AsInteger, lvNm, 0) = False then
                begin
                    f1ZSEIKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZSEIKBNNM_Si.Caption    := lvNm;

                //--------------------------------------------
                // 通常以外は請求書単位はエラー
                //--------------------------------------------
                if (uvSeiKbn_S <> 0) and (Value = 2) then
                begin
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 2; //<142>1→2
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if (AllChkMode) then
                begin
                    //「9:請求しない」で現売税請求区分が「9:請求しない」以外ならエラー
                    if ((AsInteger = 9) and (f1GRUZSEIKBN_Si.AsInteger <> 9)) then
                    begin
                        uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                        MTab1.Items.Selected := 2;
                        f1GRUZSEIKBN_Si.SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;
                fnZeiKbnChange(Name);

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税端数処理
    with f1ZHSUKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpZHSUKBN_Si;

            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', AsInteger, lvNm) = False then
                begin
                    f1ZHSUKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZHSUKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //消費税端数単位
    with f1ZHSUTNIKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpZHSUTNIKBN_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税端数単位', AsInteger, lvNm) = False then
                begin
                    f1ZHSUTNIKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);       //指定された区分は選択できません。
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1ZHSUTNIKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
//<134>↓
    //===================================================================
    //仕入先拡張分類１
    //===================================================================
    with f1KKSIBRCD1 do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpKSIBN1,821);

{
            if uvKSIBN1Attr <> 2 then
            begin
//                if f1KKSIBRCD1.InputFlag = False then
                if f1KKSIBRCD1.Text <> '' then
                    f1KKSIBRCD1.Zero := True
                else
                    f1KKSIBRCD1.Zero := False;
            end
            else
                f1KKSIBRCD1.Zero := False;
}

            f1KKSIBRNM1.Caption   := '';
			Text := TrimRight(Text);	//<233>
            if Trim(Text) <> '' then
            begin
                if fnGetNAME(f1KKSIBRCD1,f1KKSIBRCD1.Text,821,uvKSIBN1Attr,lvNMK ) = False then    // <108>
                begin
                    f1KKSIBRNM1.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1KKSIBRNM1.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;

    //===================================================================
    //仕入先拡張分類２
    //===================================================================
    with f1KKSIBRCD2 do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

			if (Text = '') and (not uvTempFlg) then
				Text := fnGetGCODE(uvTmpKSIBN2,822);

{
            if uvKSIBN2Attr <> 2 then
            begin
//                if f1KKSIBRCD2.InputFlag = False then
                if f1KKSIBRCD2.Text <> '' then
                    f1KKSIBRCD2.Zero := True
                else
                    f1KKSIBRCD2.Zero := False;
            end
            else
                f1KKSIBRCD2.Zero := False;
}

            f1KKSIBRNM2.Caption   := '';
			Text := TrimRight(Text);	//<233>
            if Trim(Text) <> '' then
            begin
                if fnGetNAME(f1KKSIBRCD2,f1KKSIBRCD2.Text,822,uvKSIBN2Attr,lvNMK ) = False then    // <108>
                begin
                    f1KKSIBRNM2.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    f1KKSIBRNM2.Caption   := lvNmk;
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
//<134>↑
    //取引区分
    with f1TRIHIKIKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpTRIHIKIKBN_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分2', AsInteger, lvNm) = False then
                begin
                    f1TRIHIKIKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1TRIHIKIKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //名称変更区分
    with f1NMKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpNMKBN_Si;

            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                //if gfnJNTSELKBNNameGet(Qry, 'ALL', '名称変更', AsInteger, lvNm) = False then      //<141>
                if gfnJNTSELKBNNameGet(Qry, 'ALL', '有無区分６', AsInteger, lvNm) = False then
                begin
                    f1NMKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 2;
                    SetFocus;

                    Result := False;
                    Exit;
                end
                else
                    f1NMKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //単価ランク
    with f1TNKRNK_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
//↓<139>
            if (Value = 0) and (not uvTempFlg) then
                Value := uvTmpTnkRnk_Si;
//↑<139>
            if AllChkMode = False then Exit;
        end;
    end;
    //単価掛率
    with f1KAKERT_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
//↓<139>
            if (Value = 0) and (not uvTempFlg) then
                Value := uvTmpKakeRt_Si;
//↑<139>
            if AllChkMode = False then Exit;
        end;
    end;
    //指定商品コード区分
    with f1SSHCDKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin

            if Value = 0 then
                Value := uvTmpSSHCDKBN_Si;

            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

			if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '指定商品', AsInteger, lvNm) = False then
                begin
                    f1SSHCDKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1SSHCDKBNNM_Si.Caption    := lvNm;

                if Value = 1 then
                begin
                    f1SSHCDKET_Si.Value := 0;
                    fnChgCmpEna(False, f1SSHCDKET_Si);
                end
                else
                    fnChgCmpEna(True, f1SSHCDKET_Si);

			end; //<143>

        end;
    end;
    //指定商品コード桁数
    with f1SSHCDKET_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Value = 0) and (f1SSHCDKBN_Si.Value <> 1) then
                Value := uvTmpSSHCDKET_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

            if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

    //<135>            if ((Value = 0) or (Value > 20)) and (f1SSHCDKBN_Si.Value <> 1)  then
    //<135>↓
                if (((Value = 0) or (Value > 20)) and (f1SSHCDKBN_Si.Value = 2))
                    or ((Value = 0) or (Value > 14)) and (f1SSHCDKBN_Si.Value = 3)  then
    //<135>↑
                begin
    //<137>				uvSelSys.MsgDlg(1010,40);
    //<137>↓
                    // ﾌﾘｰ
                    if f1SSHCDKBN_Si.Value = 2 then
                    begin
                        MjsMessageBox(Self, '1～20桁の範囲で設定してください。', mjWarning, mjDefOk);
                    end
                    // 数値
                    else if f1SSHCDKBN_Si.Value = 3 then
                    begin
                        MjsMessageBox(Self, '1～14桁の範囲で設定してください。', mjWarning, mjDefOk);
                    end;
    //<137>↑

                    MTab1.Items.Selected := 2;
                    SetFocus;
                    Result := False;
                    Exit;
                end;
            end; //<143>
        end;
    end;


//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//
// [印刷情報]ページ
//
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

    //===================================================================
    //得意先関係
    //===================================================================
    //和暦西暦区分
    with f1YYKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpYYKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '和暦西暦区分', AsInteger, lvNm) = False then
                begin
                    f1YYKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 3;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1YYKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //代表者名の印字
    with f1DAINMKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpDAINMKBN;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '有無区分２', AsInteger, lvNm) = False then
                begin
                    f1DAINMKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 3;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1DAINMKBNNM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //納品書ﾌｫｰﾑ
    with f1USDENPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpUSDENPFM;

            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'ur00', lvCode, lvNm, lvNmk) = False then
            begin
                f1USDENPFMNM.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
            begin
                f1USDENPFMNM.Caption    := lvNmk;
                // 納品書ﾌｫｰﾑの取得
                fnDFMGET;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    //見積書ﾌｫｰﾑ
    with f1MITPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpMITPFM;

            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'mi00', lvCode, lvNm, lvNmk) = False then
            begin
                f1MITPFMNM.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1MITPFMNM.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //受注伝票ﾌｫｰﾑ
    with f1JHDENPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpJHDENPFM;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'jy00', lvCode, lvNm, lvNmk) = False then
            begin
                f1JHDENPFMNM.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1JHDENPFMNM.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //出荷伝票ﾌｫｰﾑ
    with f1SNDENPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpSNDENPFM;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'sy00', lvCode, lvNm, lvNmk) = False then
            begin
                f1SNDENPFMNM.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1SNDENPFMNM.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //売上合計欄税印字
    with f1USGKEI do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpUSGKEI;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', AsInteger, lvNm) = False then  //<35>
                begin
                    f1USGKEINM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 3;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1USGKEINM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //上代合計欄税印字
    with f1JYGKEI do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpJYGKEI;
            //得意先採用以外はｽﾙｰ
//<143>     if uvHoj1Flg <>1 then
//<143>         Exit;

			if uvHoj1Flg = 1 then //<143>得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', AsInteger, lvNm) = False then   //<35>
                begin
                    f1JYGKEINM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 3;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1JYGKEINM.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //送り状ﾌｫｰﾑ
    with f1SOFOPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpSOFOPFM;

//            f1SOFOPFM.Zero := True;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'ok00', lvCode, lvNm, lvNmk) = False then
            begin
                f1SOFOPFMNM.Caption   := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
            begin
                f1SOFOPFMNM.Caption   := lvNmk;
            end;
            if AllChkMode = False then Exit;
        end;
    end;

//<KOJ> Ins-s
    //工事合計欄税印字
    with f1KUSGKEI_Tk do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKUSGKEI;

            //得意先採用以外はｽﾙｰ
			if uvHoj1Flg = 1 then //得意先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', AsInteger, lvNm) = False then
                begin
                    f1KUSGKEINM_Tk.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 3;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1KUSGKEINM_Tk.Caption    := lvNm;

            end;

            if AllChkMode = False then Exit;
        end;
    end;

    //工事売上伝票ﾌｫｰﾑ
    with f1KUSDENPFM_Tk do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKUSDENPFM;

            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'ku00', lvCode, lvNm, lvNmk) = False then
            begin
                f1KUSDENPFMNM_Tk.Caption := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
            begin
                f1KUSDENPFMNM_Tk.Caption := lvNmk;
            end;
            if AllChkMode = False then Exit;
        end;
    end;

    //工事見積書ﾌｫｰﾑ
    with f1KMITPFM_Tk do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKMITPFM;

            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'km00', lvCode, lvNm, lvNmk) = False then
            begin
                f1KMITPFMNM_Tk.Caption := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1KMITPFMNM_Tk.Caption := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;

    //工事受注伝票ﾌｫｰﾑ
    with f1KJHDENPFM_Tk do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKJHDENPFM;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'kj00', lvCode, lvNm, lvNmk) = False then
            begin
                f1KJHDENPFMNM_Tk.Caption := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 3;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1KJHDENPFMNM_Tk.Caption := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
//<KOJ> Ins-e

    //===================================================================
    //仕入先関係
    //===================================================================
    //和暦西暦区分
    with f1YYKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpYYKBN_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

            if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '和暦西暦区分', AsInteger, lvNm) = False then
                begin
                    f1YYKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 4;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1YYKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //代表者名の印字
    with f1DAINMKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpDAINMKBN_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

            if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin
                if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '有無区分２', AsInteger, lvNm) = False then
                begin
                    f1DAINMKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 4;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1DAINMKBNNM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;
    //仕入伝票ﾌｫｰﾑ
    with f1USDENPFM_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpUSDENPFM_Si;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'sr00', lvCode, lvNm, lvNmk) = False then
            begin
                f1USDENPFMNM_Si.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 4;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1USDENPFMNM_Si.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //発注伝票ﾌｫｰﾑ
    with f1JHDENPFM_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpJHDENPFM_Si;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'ha00', lvCode, lvNm, lvNmk) = False then
            begin
                f1JHDENPFMNM_Si.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 4;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1JHDENPFMNM_Si.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //入荷伝票ﾌｫｰﾑ
    with f1SNDENPFM_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpSNDENPFM_Si;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'ny00', lvCode, lvNm, lvNmk) = False then
            begin
                f1SNDENPFMNM_Si.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 4;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1SNDENPFMNM_Si.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
    //仕入合計欄税印字
    with f1USGKEI_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpUSGKEI_Si;
            //仕入先採用以外はｽﾙｰ
//<143>     if uvHoj2Flg <>1 then
//<143>         Exit;

            if uvHoj2Flg = 1 then //<143>仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin
                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', AsInteger, lvNm) = False then  //<35>
                begin
                    f1USGKEINM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 4;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1USGKEINM_Si.Caption    := lvNm;

            end; //<143>

            if AllChkMode = False then Exit;
        end;
    end;

//<KOJ> Ins-s
    //工事合計欄税印字
    with f1KUSGKEI_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKUSGKEI_Si;

            //仕入先採用以外はｽﾙｰ
            if uvHoj2Flg = 1 then //仕入先の採用があるときのみチェックする。上記のようにExitで抜けてしまうと、AllChkMode=Trueのときは以降もチェックしたいのにチェックできなかった。
            begin
                if gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', AsInteger, lvNm) = False then  //<35>
                begin
                    f1KUSGKEINM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);
                    MTab1.Items.Selected := 4;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1KUSGKEINM_Si.Caption    := lvNm;
            end;

            if AllChkMode = False then Exit;
        end;
    end;

    //工事原価伝票ﾌｫｰﾑ
    with f1KUSDENPFM_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKUSDENPFM_Si;
            lvCode := IntToStr(AsInteger);
//<KOJ2> Upd-s
//            if gfnJNTSelRptNameGet(Qry, 'kg00', lvCode, lvNm, lvNmk) = False then
            if gfnJNTSelRptNameGet(Qry, 'gn00', lvCode, lvNm, lvNmk) = False then
//<KOJ2> Upd-s
            begin
                f1KUSDENPFMNM_Si.Caption := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 4;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1KUSDENPFMNM_Si.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;

    //工事発注伝票ﾌｫｰﾑ
    with f1KJHDENPFM_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpKJHDENPFM_Si;
            lvCode := IntToStr(AsInteger);
            if gfnJNTSelRptNameGet(Qry, 'kh00', lvCode, lvNm, lvNmk) = False then
            begin
                f1KJHDENPFMNM_Si.Caption    := '';
				uvSelSys.MsgDlg(1010,50);
                MTab1.Items.Selected := 4;
                SetFocus;
                Result := False;
                Exit;
            end
            else
                f1KJHDENPFMNM_Si.Caption    := lvNmk;
            if AllChkMode = False then Exit;
        end;
    end;
//<KOJ> Ins-e

	with f1MEMO1 do
	begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Text = '') and (not uvTempFlg) then			//<136>
                Text := uvTmpTKCM1;
		end;
	end;

	with f1MEMO2 do
	begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Text = '') and (not uvTempFlg) then			//<136>
                Text := uvTmpTKCM2;
		end;
	end;

	with f1MEMO1_Si do
	begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Text = '') and (not uvTempFlg) then			//<136>
                Text := uvTmpSICM1;
		end;
	end;

	with f1MEMO2_Si do
	begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if (Text = '') and (not uvTempFlg) then			//<136>
                Text := uvTmpSICM2;
		end;
	end;

//<PASS>add S
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//
// [その他]ページ
//
//ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

    //===================================================================
    //得意先関係
    //===================================================================
//2022年4月リリース時点では外部連携区分は未使用　対応時に必ずコメントアウトを解除してください
{
	// 外部連携区分
    with f1APIKBN do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpAPIKBN;	//未入力時はテンプレートの値をセットする


			if uvHoj1Flg = 1 then //得意先の採用があるときのみチェックする。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '外部連携区分', AsInteger, lvNm) = False then
                begin
                    f1APIKBNNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1APIKBNNM.Caption    := lvNm;
            end;

            if AllChkMode = False then Exit;
        end;
    end;
}
    if TMSeries3.isGalileopt4 then
    begin
        // パスワード区分
        with f1PASSKBN do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                if (Value = 0) and (not uvTempFlg) then
                    Value := uvTmpPASSKBN;	//未入力時はテンプレートの値をセットする


                if uvHoj1Flg = 1 then //得意先の採用があるときのみチェックする。
                begin

                    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード区分', AsInteger, lvNm) = False then
                    begin
                        f1PASSKBNNM.Caption    := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else
                        f1PASSKBNNM.Caption    := lvNm;

                    // 「4:請求先参照」は一括子のみ選択可能
                    if (f1PASSKBN.AsInteger = 4) and (not uvTempFlg) then
                     begin
                            if (uvOyakoFL_Tk = 2) then  //得意先採用ありかつ一括子→OK
                            begin
                                Exit;
                            end
                            else
                            begin
                                MjsMessageBoxEx(Self, '一括請求の子会社のみ選択が可能です。', '警告', mjWarning, mjOK, mjDefOK);
                                MTab1.Items.Selected := 5;
                                SetFocus;
                                Result := False;
                                Exit;
                            end;
                     end;
                end;

                if AllChkMode = False then Exit;
            end;
        end;

        // パスワード合成項目1
        with f1PassItemKbn1 do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin

                f1PASSITEMKBN1NM.Caption   := '';

                if (f1PassKbn.Value = 2) and (Value = 0) then
				begin
                	//パスワード設定が2且つパスワード合成の値が0の場合はテンプレートの値をセットする。
                    if not uvTempflg then
                    begin
						Value := uvTmpPASSITEMKBN1;
                        //テンプレートの値も0だった場合はエラーとする。
						if Value = 0 then
                        begin
                            f1PASSITEMKBN1NM.Caption   := '';
                            uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                            MTab1.Items.Selected := 5;
                            SetFocus;
                            Result := False;
                            Exit;
                        end;
                    end
					//テンプレートモードでパスワード設定が2且つパスワード合成の値が0の場合はエラーとする。
                    else if uvTempflg then
                    begin
                        f1PASSITEMKBN1NM.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;

                if Value <> 0 then
                begin
                    if fnGetNAME(f1PassItemKbn1,inttostr(Trunc(f1PassItemKbn1.Value)),9600,0,lvNMK ) = False then    // <108>
                    begin
                        f1PASSITEMKBN1NM.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else
                    begin
                        f1PASSITEMKBN1NM.Caption   := lvNmk
                    end;
                end;

                if AllChkMode = False then Exit;
            end;
        end;

        // パスワード合成項目2
        with f1PassItemKbn2 do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin

                f1PASSITEMKBN2NM.Caption   := '';

                if (f1PassKbn.Value = 2) and (Value = 0) then
				begin
                	//パスワード設定が2且つパスワード合成の値が0の場合はテンプレートの値をセットする。
                    if not uvTempflg then
                    begin
						Value := uvTmpPASSITEMKBN2;
                        //テンプレートの値も0だった場合はエラーとする。
						if Value = 0 then
                        begin
                            f1PASSITEMKBN2NM.Caption   := '';
                            uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                            MTab1.Items.Selected := 5;
                            SetFocus;
                            Result := False;
                            Exit;
                        end;

                    end
					//テンプレートモードでパスワード設定が2且つパスワード合成の値が0の場合はエラーとする
                    else if uvTempflg then
                    begin
                        f1PASSITEMKBN2NM.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;

                if Value <> 0 then
                begin
                    if fnGetNAME(f1PassItemKbn2,inttostr(Trunc(f1PassItemKbn2.Value)),9601,0,lvNMK ) = False then    // <108>
                    begin
                        f1PASSITEMKBN2NM.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else
                    begin
                        f1PASSITEMKBN2NM.Caption   := lvNmk
                    end;
                end;

                if not uvTempFlg then
                begin
                    // 取引先/請求先コード半角カナチェック
                    if fnPWITEMChkCODE(1, f1PASSITEMKBN1.AsInteger, f1PASSITEMKBN2.AsInteger) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 郵便・電話番号未入力チェック
                    if fnPWITEMChkUpd(1, f1PASSITEMKBN1.AsInteger, f1PASSITEMKBN2.AsInteger) then
                    begin
                        Result := False;
                        Exit;
                    end;

                end;

                if AllChkMode = False then Exit;
            end;
        end;

        // パスワード（直接入力）
        with f1PASSWORD do
        begin
            // パスワード区分が「3:直接入力」時のみ確認
            if ((AllChkMode = True) or (lvCompoName = Name)) and (f1PASSKBN.Value = 3) and (not uvTempflg)then
            begin
                if Trim(Text) = '' then
                begin
                    uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if (JNTSelXKanjiCheck(Text) = True) or (gfnHasHankKana(Text) = True) then
                begin
                    MjsMessageBoxEx(Self, 'パスワードに全角文字、半角カタカナは設定できません。'#13#10'半角英数字で入力してください。', '警告', mjWarning, mjOK, mjDefOK);
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;
    //===================================================================
    //仕入先関係
    //===================================================================
//2022年4月リリース時点では外部連携区分は未使用　対応時に必ずコメントアウトを解除してください
	// 外部連携区分
{    with f1APIKBN_Si do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpAPIKBN_Si;	//未入力時はテンプレートの値をセットする


            if uvHoj2Flg = 1 then //仕入先の採用があるときのみチェックする。
            begin

                if gfnJNTSELKBNNameGet(Qry, 'ALL', '外部連携区分', AsInteger, lvNm) = False then
                begin
                    f1APIKBNNM_Si.Caption    := '';
                    uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else
                    f1APIKBNNM_Si.Caption    := lvNm;
            end;

            if AllChkMode = False then Exit;
        end;
	end;
}
    if TMSeries3.isGalileopt4 then
    begin
        // パスワード区分
        with f1PASSKBN_Si do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                if (Value = 0) and (not uvTempFlg) then
                    Value := uvTmpPASSKBN_Si;  //未入力時はテンプレートの値をセットする

                if uvHoj2Flg = 1 then //仕入先の採用があるときのみチェックする。
                begin

                    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード区分', AsInteger, lvNm) = False then
                    begin
                        f1PASSKBNNM_Si.Caption    := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else
                        f1PASSKBNNM_Si.Caption    := lvNm;

                    // 「4:請求先参照」は一括子のみ選択可能
                    if (f1PASSKBN_Si.AsInteger = 4) and (not uvTempFlg) then
                     begin
                            if (uvOyakoFL_Si = 2) then //仕入先採用ありかつ一括子→OK
                            begin
                                Exit;
                            end
                            else
                            begin
                                MjsMessageBoxEx(Self, '一括請求の子会社のみ選択が可能です。', '警告', mjWarning, mjOK, mjDefOK);
                                MTab1.Items.Selected := 5;
                                SetFocus;
                                Result := False;
                                Exit;
                            end;
                     end;
                end;

                if AllChkMode = False then Exit;
            end;
        end;

        //パスワード合成項目1
        with f1PassItemKbn1_Si do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin

                f1PASSITEMKBN1NM_Si.Caption   := '';

                if (f1PassKbn_Si.Value = 2) and (Value = 0) then
				begin
                	//パスワード設定が2且つパスワード合成の値が0の場合はテンプレートの値をセットする。
                    if not uvTempflg then
                    begin
						Value := uvTmpPASSITEMKBN1_Si;
						if Value = 0 then //テンプレートの値も0だった場合はエラーとする。
                        begin
                            f1PASSITEMKBN1NM_Si.Caption   := '';
                            uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                            MTab1.Items.Selected := 5;
                            SetFocus;
                            Result := False;
                            Exit;
                        end;
                    end
					//テンプレートモードでパスワード設定が2且つパスワード合成の値が0の場合はエラーとする。
                    else if uvTempflg then
                    begin
                        f1PASSITEMKBN1NM_Si.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;

                if Value <> 0 then
                begin
                    if fnGetNAME(f1PassItemKbn1_Si,inttostr(Trunc(f1PassItemKbn1_Si.Value)),9600,0,lvNMK ) = False then    // <108>
                    begin
                        f1PASSITEMKBN1NM_Si.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else begin
                        f1PASSITEMKBN1NM_Si.Caption   := lvNmk
                    end;
                end;

                if AllChkMode = False then Exit;
            end;
        end;

        //パスワード合成項目2
        with f1PassItemKbn2_Si do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin

                f1PASSITEMKBN2NM_Si.Caption   := '';

                if (f1PassKbn_Si.Value = 2) and (Value = 0) then
				begin
                	//パスワード設定が2且つパスワード合成の値が0の場合はテンプレートの値をセットする。
                    if not uvTempflg then
                    begin
						Value := uvTmpPASSITEMKBN2_Si;
						if Value = 0 then //テンプレートの値も0だった場合はエラーとする。
                        begin
                            f1PASSITEMKBN2NM_Si.Caption   := '';
                            uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                            MTab1.Items.Selected := 5;
                            SetFocus;
                            Result := False;
                            Exit;
                        end;
                    end
					//テンプレートモードでパスワード設定が2且つパスワード合成の値が0の場合はエラーとする。
                    else if uvTempflg then
                    begin
                        f1PASSITEMKBN2NM_Si.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
                end;

                if Value <> 0 then
                begin
                    if fnGetNAME(f1PassItemKbn2_Si,inttostr(Trunc(f1PassItemKbn2_Si.Value)),9601,0,lvNMK ) = False then    // <108>
                    begin
                        f1PASSITEMKBN2NM_Si.Caption   := '';
                        uvSelSys.MsgDlg(1010,40);   //指定された区分は選択できません。
                        MTab1.Items.Selected := 5;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else begin
                        f1PASSITEMKBN2NM_Si.Caption   := lvNmk
                    end;
                end;

                if not uvTempFlg then
                begin
                    // 取引先/請求先コード半角カナチェック
                    if fnPWITEMChkCODE(2, f1PASSITEMKBN1_Si.AsInteger, f1PASSITEMKBN2_Si.AsInteger) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 郵便・電話番号未入力チェック
                    if fnPWITEMChkUpd(2, f1PASSITEMKBN1_Si.AsInteger, f1PASSITEMKBN2_Si.AsInteger) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                if AllChkMode = False then Exit;
            end;
        end;


        // パスワード（直接入力）
        with f1PASSWORD_Si do
        begin
            // パスワード区分が「3:直接入力」時のみ確認
            if ((AllChkMode = True) or (lvCompoName = Name)) and (f1PASSKBN_Si.Value = 3) and (not uvTempflg) then
            begin
                if Trim(Text) = '' then
                begin
                    uvSelSys.MsgDlg(1010,11);   //入力値に誤りがあります。
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if (JNTSelXKanjiCheck(Text) = True) or (gfnHasHankKana(Text) = True) then
                begin
                    MjsMessageBoxEx(Self, 'パスワードに全角文字、半角カタカナは設定できません。'#13#10'半角英数字で入力してください。', '警告', mjWarning, mjOK, mjDefOK);
                    MTab1.Items.Selected := 5;
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
	end;
//<PASS>add E
end;

//-----------------------------------------------------------------------------
//  対象レコードを取得する
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnRecGet(CODE: string): Boolean;
var
//    iSeiKbn     : Integer;                                  // <100>未使用だが参照渡しの為
//    iOyakoFL    : Integer;                                  // <100>未使用だが参照渡しの為
    Qe          : TMQuery;
    lvCode      : String;
	bEnable		: boolean;
begin

    Result      := True;
    lvCode      := fnGetDspData(CODE);
    f0CODE.Text := lvCode;

    //====================================================
    // ﾌｫｰﾑの初期化[f1]
    //====================================================
    fnInzFormf1;

    if uvDispFlg = 0 then
    begin
        MPnlTop.Enabled   := False;
        tbsKihon.Enabled  := True;
        tbsInput.Enabled  := True;
        tbsInputS.Enabled := True;
        tbsPrint.Enabled  := True;
        tbsPrintS.Enabled := True;
        tbsOther.Enabled  := True;
        if uvBmUsekbn = 0 then
        begin
            fnChgCmpEna(False, f1BMCODE);
            fnChgCmpEna(False, f1BMCODE_Si);
        end;
    end
    else
    begin
        MPnlTop.Enabled   := True;
        tbsKihon.Enabled  := False;
        tbsInput.Enabled  := False;
        tbsInputS.Enabled := False;
        tbsPrint.Enabled  := False;
        tbsPrintS.Enabled := False;
        tbsOther.Enabled  := False;
//<146>↓
//親画面でメッセージ出力するため、
//ここでは表示しない
{
        if m_cJNTArea.IsModify = True then
            MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
}
//<146>↑
    end;

    Qe := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

    with Qe do
    begin
		Close ();
		SQL.Clear ();
//<141> ↓
        //SQL.Add('select * from MTOKUI_SEL ');
        SQL.Add('select s.*, m.COUNTRYKBN from MTOKUI_SEL s '
              + 'left outer join MTOKUI m on (s.BaseNCode = m.NCode) ');
//<141> ↑
        SQL.Add('where s.BaseNCode = :CODE  ');
        SQL.Add('order by s.RecKbn          ');
        ParamByName('CODE').AsFloat := uvNCODE;
        Open;
		if	(not Open ()) then
		begin
			Result := FALSE;
            Qe.Free;
            Exit;
        end;

        if ( Eof ) then uvRecTF  :=  False
        else            uvRecTF  :=  True;
    end;

    // 採用区分による使用制御
//  JNTSelXSetEnableds(Self, 'f1', True);                 // 全ての使用制御
    Mtab1.Enabled          := True;
    Mtab1.Items[1].Visible := False;
    Mtab1.Items[2].Visible := False;
    Mtab1.Items[3].Visible := False;
    Mtab1.Items[4].Visible := False;

    // ﾃﾝﾌﾟﾚｰﾄﾓｰﾄﾞの場合
    if uvTempFlg then
    begin
//        Mtab1.Items[0].Visible := False;
//        Mtab1.Items[5].Visible := False;
//        MPnlUr.Enabled         := False;
//        MPnlSi.Enabled         := False;
    end;

	bEnable := not( uvTempFlg);
	fnChgCmpEna(bEnable, f1POSTNO1);
	fnChgCmpEna(bEnable, f1POSTNO2);
	fnChgCmpEna(bEnable, f1ADS1);
	fnChgCmpEna(bEnable, f1ADS2);
	fnChgCmpEna(bEnable, f1TEL1);
	fnChgCmpEna(bEnable, f1TEL2);
	fnChgCmpEna(bEnable, f1FAX1);
	fnChgCmpEna(bEnable, f1SectionName);
	fnChgCmpEna(bEnable, f1TanNM);
//	fnChgCmpEna(bEnable, f1KeisyoKbn);  Del <1133>
	fnChgCmpEna(bEnable, f1MailAd);

	fnChgCmpEna(bEnable, f1POSTNO1_Si);
	fnChgCmpEna(bEnable, f1POSTNO2_Si);
	fnChgCmpEna(bEnable, f1ADS1_Si);
	fnChgCmpEna(bEnable, f1ADS2_Si);
	fnChgCmpEna(bEnable, f1TEL1_Si);
	fnChgCmpEna(bEnable, f1TEL2_Si);
	fnChgCmpEna(bEnable, f1FAX1_Si);
	fnChgCmpEna(bEnable, f1SectionName_Si);
	fnChgCmpEna(bEnable, f1TanNM_Si);
//	fnChgCmpEna(bEnable, f1KeisyoKbn_Si);  Del <1133>
	fnChgCmpEna(bEnable, f1MailAd_Si);

    // 基本情報ﾌﾞﾗｲﾝﾄﾞ
    Blind_TK.Visible      := False;
    Blind_SI.Visible      := False;
    Blind_TK.Enabled      := False;
    Blind_SI.Enabled      := False;

    Blind_Othr_TK.Visible := False;
    Blind_Othr_TK.Enabled := False;
    Blind_Othr_Si.Visible := False;
    Blind_Othr_Si.Enabled := False;

    if uvHoj1Flg = 1 then
    begin
        Mtab1.Items[1].Visible := True;                     // 入力・集計情報Tab(得意先)
        Mtab1.Items[3].Visible := True;                     // 印刷情報Tab      (得意先)
        Blind_TK.Visible       := True;
        Blind_TK.Enabled       := True;
        Blind_Othr_TK.Visible  := True;
        Blind_Othr_TK.Enabled  := True;

    end;

    if uvHoj2Flg = 1 then
    begin
        Mtab1.Items[2].Visible := True;                     // 入力・集計情報Tab(仕入先)
        Mtab1.Items[4].Visible := True;                     // 印刷情報Tab      (仕入先)
        Blind_SI.Visible       := True;
        Blind_SI.Enabled       := True;
        Blind_Othr_Si.Visible  := True;
        Blind_Othr_Si.Enabled  := True;

    end;

    //====================================================
    // 更新と参照は項目をｾｯﾄする
    //====================================================
    if ( uvRecTF ) then
        fnFldSet(Qe);

    Qe.Close;
    Qe.Free;

    // ﾚｺｰﾄﾞ取得ｽｲｯﾁを設定する
    uvRecGetSw := True;

    // ﾎﾞﾀﾝの状態を制御する
    fnBtnEnbChg;

    // 決算確定の時取消ﾎﾞﾀﾝのみ使用可
    if uvDispFlg = 1 then
    begin
        BtnCan.enabled       := True;
        BtnUpd.Enabled       := False;
        MBitBtnBefor.Enabled := False;
        MBitBtnAfter.Enabled := False;
    end;

//<133>
	fnLicenseCheck;

    // 編集状態を解除する
    uvEdtSw := False;

end;

//-----------------------------------------------------------------------------
//  項目をセットする
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnFldSet(pvQry: TMQuery);
var
//  lvStr : String;     //<100>
    lvNMK : String;
    lvCODE : String;    //<122>
begin
    //項目をセットする
	with pvQry do
    begin
        First;
        while Not Eof do
        begin
            if GetFld('RecKbn').AsInteger = 1 then
            begin
            //------------------------------------------------------------------
            //基本情報ページ
            //------------------------------------------------------------------
{↓<PST2>
                if	( (GetFld ('POSTNO1').IsNull       )   or
                      (GetFld ('POSTNO1').AsInteger = 0) ) then
                begin
                    f1POSTNO1.Clear ();
                    f1POSTNO2.Clear ();
                end
                else
                begin
                    f1POSTNO1.Value	:= GetFld ('POSTNO1').AsInteger;

                    // 基本情報  : 郵便番号
                    if	(GetFld ('POSTNO2').IsNull) then
                        f1POSTNO2.Clear ()
                    else
                    begin
                        if ( GetFld ('POSTNO2').AsInteger = 0 ) then
                        begin
                            f1POSTNO2.FormatStr	:= '0000';
                            f1POSTNO2.Value		:= 1;
                        end;

                        f1POSTNO2.Value    := GetFld ('POSTNO2').AsInteger;
                    end;
                end;
↑<PST2>}
//↓<PST2>
				// 基本情報  : 郵便番号(基番)
				f1POSTNO1.Value	:= GetFld('POSTNO1').AsInteger;
				// 基本情報  : 郵便番号(枝番)
                f1POSTNO2.Value	:= GetFld('POSTNO2').AsInteger;

                if GetFld('POSTNO1').AsInteger <> 0 then
                begin
                	f1POSTNO2.Zero := True;
                end
                else
                begin
                	f1POSTNO2.Zero := False;
                end;
//↑<PST2>
                f1ADS1      .Text       := GetFld('ADS1')       .AsString;
                f1ADS2      .Text       := GetFld('ADS2')       .AsString;
                f1TEL1      .Text       := GetFld('TEL1')       .AsString;
                f1TEL2      .Text       := GetFld('TEL2')       .AsString;
                f1FAX1      .Text       := GetFld('FAX1')       .AsString;
                f1SectionName.Text      := GetFld('SectionName').AsString;
                f1TanNM      .Text      := GetFld('TanNM')      .AsString;
                f1KeisyoKbn  .Text      := GetFld('KeisyoKbn')  .AsString;
    			f1MailAd.Text	        := GetFld('MailAddress').AsString;
                // 基本情報　：部門コード
                lvCODE := fnGetGCODE(GetFld('BmNCode').AsFloat,41);         //<122>
                if (uvBMAttr <> 2) and (lvCODE = ucZeroCODE ) then          //<122>
                begin                                                       //<122>
                    f1BMCODE.Zero := True;                                  //<122>
                    f1BMCODE.InputFlag := False;                            //<122>
                end;                                                        //<122>
                f1BMCODE.text := lvCODE;                                    //<122>

// <122>                f1BMCODE.text          :=  fnGetGCODE(GetFld('BmNCode').AsFloat,41);
// <108>                fnGetNAME(f1BMCODE.Text,41,uvBMAttr,lvNMK );
                fnGetNAME(f1BMCODE,f1BMCODE.Text,41,uvBMAttr,lvNMK );   // <108>
                f1BMNAME.caption        := lvNMK;

                // 基本情報　：担当者コード
                lvCODE := fnGetGCODE(GetFld('TnNCode').AsFloat,25);         //<122>
                if (uvTNAttr <> 2) and (lvCODE = ucZeroCODE ) then          //<122>
                begin                                                       //<122>
                    f1TNCODE.Zero := True;                                  //<122>
                    f1TNCODE.InputFlag := False                             //<122>
                end;                                                        //<122>
                f1TNCODE.text := lvCODE;                                    //<122>

// <122>                f1TNCODE.text          :=  fnGetGCODE(GetFld('TnNCode').AsFloat,25);
// <108>                fnGetNAME(f1TNCODE.Text,25,uvTnAttr,lvNMK );
                fnGetNAME(f1TNCODE,f1TNCODE.Text,25,uvTnAttr,lvNMK );   // <108>
                f1TNNAME.caption        := lvNMK;

            //------------------------------------------------------------------
            //入力・集計ページ
            //------------------------------------------------------------------
                f1URKINHSUKBN.Value     := GetFld('URKINHSUKBN').AsInteger; //売上端数区分
                f1GRUZSEIKBN.Value      := GetFld('GRUZSEIKBN') .AsInteger; //現売税請求区分
                f1ZSEIKBN   .Value      := GetFld('ZSEIKBN')    .AsInteger; //消費税請求区分
                f1ZHSUKBN   .Value      := GetFld('ZHSUKBN')    .AsInteger; //消費税端数単位
                f1ZHSUTNIKBN.Value      := GetFld('ZHSUTNIKBN') .AsInteger; //消費税端数処理
//<134>↓
                // 拡張分類
                lvCODE := fnGetGCODE(GetFld('HBunNCode1').AsFloat,811);
                f1KKTKBRCD1.text := lvCODE;
                fnGetNAME(f1KKTKBRCD1,f1KKTKBRCD1.Text,811,uvKTKBN1Attr,lvNMK );
                f1KKTKBRNM1.caption     := lvNMK;

                lvCODE := fnGetGCODE(GetFld('HBunNCode2').AsFloat,812);
                f1KKTKBRCD2.text := lvCODE;
                fnGetNAME(f1KKTKBRCD2,f1KKTKBRCD2.Text,812,uvKTKBN2Attr,lvNMK );
                f1KKTKBRNM2.caption     := lvNMK;
//<134>↑

                //売上伝票入力
                f1TRIHIKIKBN.Value      := GetFld('TRIHIKIKBN') .AsInteger; //取引区分
                f1NMKBN     .Value      := GetFld('NMKBN')      .AsInteger; //名称変更区分
                f1TNKRNK    .Value      := GetFld('TNKRNK')     .AsInteger; //単価ﾗﾝｸ
                f1KAKERT    .Value      := GetFld('KAKERT')     .AsFloat;   //単価掛率
                f1SSHCDKBN  .Value      := GetFld('SSHCDKBN')   .AsInteger; //指定商品ｺｰﾄﾞ区分

//<KOJ> Ins-s
                // 指定商品ｺｰﾄﾞ区分の設定値が「1:なし」の場合、指定商品ｺｰﾄﾞ桁数を入力不可とする。
                if (f1SSHCDKBN.Value = 1) then
                begin
                    f1SSHCDKET.Value := 0;
                    fnChgCmpEna(False, f1SSHCDKET);
                end else
                begin
                    f1SSHCDKET.Value := GetFld('SSHCDKET').AsInteger; //指定商品ｺｰﾄﾞ桁数
                    fnChgCmpEna(True, f1SSHCDKET);
                end;
//<KOJ> Ins-e

            //------------------------------------------------------------------
            //印刷情報ページ
            //------------------------------------------------------------------
                f1YYKBN     .Value      := GetFld('YYKBN')      .AsInteger;
                f1DAINMKBN  .Value      := GetFld('DAINMKBN')   .AsInteger;
                f1USDENPFM  .Value      := GetFld('USDENPFM')   .AsInteger;
                f1MITPFM    .Value      := GetFld('MITPFM')     .AsInteger;
                f1JHDENPFM  .Value      := GetFld('JHDENPFM')   .AsInteger;
                f1SNDENPFM  .Value      := GetFld('SNDENPFM')   .AsInteger;
                f1USGKEI    .Value      := GetFld('USGKEI')     .AsInteger;
                f1JYGKEI    .Value      := GetFld('JYGKEI')     .AsInteger;
                //送り状
                f1SOFOPFM.Value         := GetFld('SOFOPFM')    .AsInteger;

//<KOJ> Ins-s
                //工事伝票
                f1KUSGKEI_Tk   .Value   := GetFld('KUSGKEI')    .AsInteger; //工事合計欄税印字
                f1KUSDENPFM_Tk .Value   := GetFld('KUSDENPFM')  .AsInteger; //工事売上伝票ﾌｫｰﾑ
                f1KMITPFM_Tk   .Value   := GetFld('KMITPFM')    .AsInteger; //工事見積書ﾌｫｰﾑ
                f1KJHDENPFM_Tk .Value   := GetFld('KJHDENPFM')  .AsInteger; //工事受注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

            //------------------------------------------------------------------
            //その他ページ
            //------------------------------------------------------------------
                f1Memo1     .Text       := GetFld('Memo1')      .AsString;
                f1Memo2     .Text       := GetFld('Memo2')      .AsString;
                uvData_Load.pvrYYKbn    := GetFld('YYKBN').AsInteger;		//<101>和暦西暦区分
                uvData_Load.pvrDaiNMKbn := GetFld('DAINMKBN').AsInteger;	//<101>代表者印字区分
//<PASS>Add S
				f1APIKBN		.Value      := GetFld('LINKAGEKBN')		.AsInteger;		//外部連携区分
				f1PASSKBN		.Value      := GetFld('PASSKBN')		.AsInteger;		//パスワード設定
				f1PASSITEMKBN1	.Value      := GetFld('PASSITEMKBN1')	.AsInteger;		//パスワード合成項目１
				f1PASSITEMKBN2	.Value      := GetFld('PASSITEMKBN2')	.AsInteger;		//パスワード合成項目２
                f1PASSWORD		.Text       := GetFld('MANUALPASSWORD')	.AsString;		//パスワード（直接入力）
//<PASS>Add E
            //------------------------------------------------------------------
            //制御用
            //------------------------------------------------------------------
                uvSeiKbn := GetFld('TRSEIKBN').AsInteger;
				uvOyakoFL_Tk := GetFld('OYAKOFLG').AsInteger;					//<PASS>得意先親子フラグ
            end
            else
            begin
{↓<PST2>
                if	( (GetFld ('POSTNO1').IsNull       )   or
                      (GetFld ('POSTNO1').AsInteger = 0) ) then
                begin
                    f1POSTNO1_Si.Clear ();
                    f1POSTNO2_Si.Clear ();
                end
                else
                begin
                    f1POSTNO1_Si.Value	:= GetFld ('POSTNO1').AsInteger;

                    // 基本情報  : 郵便番号
                    if	(GetFld ('POSTNO2').IsNull) then
                        f1POSTNO2_Si.Clear ()
                    else
                    begin
                        if ( GetFld ('POSTNO2').AsInteger = 0 ) then
                        begin
                            f1POSTNO2_Si.FormatStr	:= '0000';
                            f1POSTNO2_Si.Value		:= 1;
                        end;

                        f1POSTNO2_Si.Value    := GetFld ('POSTNO2').AsInteger;
                    end;
                end;
↑<PST2>}
//↓<PST2>
				// 基本情報  : 郵便番号(基番)
				f1POSTNO1_Si.Value	:= GetFld('POSTNO1').AsInteger;
				// 基本情報  : 郵便番号(枝番)
                f1POSTNO2_Si.Value	:= GetFld('POSTNO2').AsInteger;

                if GetFld('POSTNO1').AsInteger <> 0 then
                begin
                	f1POSTNO2_Si.Zero := True;
                end
                else
                begin
                	f1POSTNO2_Si.Zero := False;
                end;
//↑<PST2>
                f1ADS1_Si       .Text       := GetFld('ADS1')       .AsString;
                f1ADS2_Si       .Text       := GetFld('ADS2')       .AsString;
                f1TEL1_Si       .Text       := GetFld('TEL1')       .AsString;
                f1TEL2_Si       .Text       := GetFld('TEL2')       .AsString;
                f1FAX1_Si       .Text       := GetFld('FAX1')       .AsString;
                f1SectionName_Si.Text       := GetFld('SectionName').AsString;
                f1TanNM_Si      .Text       := GetFld('TanNM')      .AsString;
                f1KeisyoKbn_Si  .Text       := GetFld('KeisyoKbn')  .AsString;
    			f1MailAd_Si.Text	        := GetFld('MailAddress').AsString;
                // 基本情報　：部門コード
                //lvCODE := fnGetGCODE(GetFld('BmNCode').AsFloat,41);         //<122>	//<2466>
                lvCODE := fnGetGCODE_Si(GetFld('BmNCode').AsFloat,41);         //<122>	//<2466>
                if (uvBMAttr <> 2) and (lvCODE = ucZeroCODE ) then          //<122>
                begin                                                       //<122>
                    f1BMCODE_Si.Zero := True;                               //<122>
                    f1BMCODE_Si.InputFlag := False                          //<122>
                end;                                                        //<122>
                f1BMCODE_Si.text := lvCODE;                                 //<122>

// <122>                f1BMCODE_Si.text          :=  fnGetGCODE(GetFld('BmNCode').AsFloat,41);
// <108>                fnGetNAME(f1BMCODE_Si.Text,41,uvBMAttr,lvNMK );


                fnGetNAME(f1BMCODE_Si,f1BMCODE_Si.Text,41,uvBMAttr,lvNMK ); // <108>
                f1BMNAME_Si.caption        := lvNMK;

                // 基本情報　：担当者コード
                lvCODE := fnGetGCODE(GetFld('TnNCode').AsFloat,25);         //<122>
                if (uvTNAttr <> 2) and (lvCODE = ucZeroCODE ) then          //<122>
                begin                                                       //<122>
                        f1TNCODE_Si.Zero := True;                           //<122>
                        f1TNCODE_Si.InputFlag := False;                     //<122>
                end;                                                        //<122>
                f1TNCODE_Si.text := lvCODE;                                 //<122>

// <122>                f1TNCODE_Si.text          :=  fnGetGCODE(GetFld('TnNCode').AsFloat,25);
// <108>                fnGetNAME(f1TNCODE_Si.Text,25,uvTnAttr,lvNMK );
                fnGetNAME(f1TNCODE_Si,f1TNCODE_Si.Text,25,uvTnAttr,lvNMK ); // <108>
                f1TNNAME_Si.caption        := lvNMK;
            //------------------------------------------------------------------
            //入力・集計ページ
            //------------------------------------------------------------------
                f1URKINHSUKBN_Si.Value      := GetFld('URKINHSUKBN').AsInteger; //売上端数区分
                f1GRUZSEIKBN_Si .Value      := GetFld('GRUZSEIKBN') .AsInteger; //現売税請求区分
                f1ZSEIKBN_Si    .Value      := GetFld('ZSEIKBN')    .AsInteger; //消費税請求区分
//<141> ↓
                //海外取引先の場合使用不可
                fnChgCmpEna((GetFld('COUNTRYKBN').AsInteger = 1), f1GRUZSEIKBN_Si);
                fnChgCmpEna((GetFld('COUNTRYKBN').AsInteger = 1), f1ZSEIKBN_Si);
//<141> ↑
// Ins-s <1120>
                //海外取引先の場合使用不可
                fnChgCmpEna((GetFld('COUNTRYKBN').AsInteger = 1), f1ZHSUTNIKBN_Si);
                fnChgCmpEna((GetFld('COUNTRYKBN').AsInteger = 1), f1ZHSUKBN_Si);
// Ins-e <1120>

                f1ZHSUKBN_Si    .Value      := GetFld('ZHSUKBN')    .AsInteger; //消費税端数単位
                f1ZHSUTNIKBN_Si .Value      := GetFld('ZHSUTNIKBN') .AsInteger; //消費税端数処理
//<134>↓
                // 拡張分類
                lvCODE := fnGetGCODE(GetFld('HBunNCode1').AsFloat,821);
                f1KKSIBRCD1.text := lvCODE;
                fnGetNAME(f1KKSIBRCD1,f1KKSIBRCD1.Text,821,uvKSIBN1Attr,lvNMK );
                f1KKSIBRNM1.caption     := lvNMK;

                lvCODE := fnGetGCODE(GetFld('HBunNCode2').AsFloat,822);
                f1KKSIBRCD2.text := lvCODE;
                fnGetNAME(f1KKSIBRCD2,f1KKSIBRCD2.Text,822,uvKSIBN2Attr,lvNMK );
                f1KKSIBRNM2.caption     := lvNMK;
//<134>↑

                //売上伝票入力
                f1TRIHIKIKBN_Si.Value      := GetFld('TRIHIKIKBN') .AsInteger; //取引区分
                f1NMKBN_Si     .Value      := GetFld('NMKBN')      .AsInteger; //名称変更区分
                f1TNKRNK_Si    .Value      := GetFld('TNKRNK')     .AsInteger; //単価ﾗﾝｸ
                f1KAKERT_Si    .Value      := GetFld('KAKERT')     .AsFloat;   //単価掛率
                f1SSHCDKBN_Si  .Value      := GetFld('SSHCDKBN')   .AsInteger; //指定商品ｺｰﾄﾞ区分
//<KOJ> Ins-s
                // 指定商品ｺｰﾄﾞ区分の設定値が「1:なし」の場合、指定商品ｺｰﾄﾞ桁数を入力不可とする。
                if (f1SSHCDKBN_Si.Value = 1) then
                begin
                    f1SSHCDKET_Si.Value := 0;
                    fnChgCmpEna(False, f1SSHCDKET_Si);
                end else
                begin
                    f1SSHCDKET_Si.Value := GetFld('SSHCDKET').AsInteger; //指定商品ｺｰﾄﾞ桁数
                    fnChgCmpEna(True, f1SSHCDKET_Si);
                end;
//<KOJ> Ins-e

            //------------------------------------------------------------------
            //印刷情報ページ
            //------------------------------------------------------------------
                f1YYKBN_Si     .Value      := GetFld('YYKBN')      .AsInteger;
                f1DAINMKBN_Si  .Value      := GetFld('DAINMKBN')   .AsInteger;
                f1USDENPFM_Si  .Value      := GetFld('USDENPFM')   .AsInteger;
                f1JHDENPFM_Si  .Value      := GetFld('JHDENPFM')   .AsInteger;
                f1SNDENPFM_Si  .Value      := GetFld('SNDENPFM')   .AsInteger;
                f1USGKEI_Si    .Value      := GetFld('USGKEI')     .AsInteger;
//<KOJ> Ins-s
                //工事伝票
                f1KUSGKEI_Si   .Value      := GetFld('KUSGKEI')    .AsInteger; //工事合計欄税印字
                f1KUSDENPFM_Si .Value      := GetFld('KUSDENPFM')  .AsInteger; //工事原価伝票ﾌｫｰﾑ
                f1KJHDENPFM_Si .Value      := GetFld('KJHDENPFM')  .AsInteger; //工事発注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

            //------------------------------------------------------------------
            //その他ページ
            //------------------------------------------------------------------
                f1Memo1_Si  .Text         := GetFld('Memo1')      .AsString;
                f1Memo2_Si  .Text         := GetFld('Memo2')      .AsString;
                uvData_Load_S.pvrYYKbn    := GetFld('YYKBN').AsInteger;		//<101>和暦西暦区分
                uvData_Load_S.pvrDaiNMKbn := GetFld('DAINMKBN').AsInteger;	//<101>代表者印字区分
//<PASS>Add S
				f1APIKBN_Si			.Value	:= GetFld('LINKAGEKBN')		.AsInteger;
				f1PASSKBN_Si		.Value	:= GetFld('PASSKBN')		.AsInteger;
				f1PASSITEMKBN1_Si	.Value	:= GetFld('PASSITEMKBN1')	.AsInteger;		//パスワード合成項目１
				f1PASSITEMKBN2_Si	.Value	:= GetFld('PASSITEMKBN2')	.AsInteger;		//パスワード合成項目２
                f1PASSWORD_Si		.Text 	:= GetFld('MANUALPASSWORD')	.AsString;		//パスワード（直接入力）
//<PASS>Add E
            //------------------------------------------------------------------
            //制御用
            //------------------------------------------------------------------
                uvSeiKbn_S := GetFld('TRSEIKBN').AsInteger;
				uvOyakoFL_Si := GetFld('OYAKOFLG').AsInteger;					//<PASS>仕入先親子フラグ
            end;


            Next;
        end;
    end;

    //参照項目の情報を取得する
    fnFldNameSet;

end;

//-----------------------------------------------------------------------------
//  項目をセットする
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnFldNameSet;
var
    lvCode, lvNm, lvNmk: String;
begin
//入力・集計（得意先）
    //-------------------------------------------------
    //売上端数区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', f1URKINHSUKBN.AsInteger, lvNm) = True then
        f1URKINHSUKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //現売税請求区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', f1GRUZSEIKBN.AsInteger, lvNm, 0) = True then  //<102>
        f1GRUZSEIKBNNM.Caption := lvNm;
    fnZeiKbnChange('f1GRUZSEIKBN');
    //-------------------------------------------------
    //消費税請求区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', f1ZSEIKBN.AsInteger, lvNm, 0) = True then //<102>
        f1ZSEIKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //消費税端数処理
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', f1ZHSUKBN.AsInteger, lvNm) = True then
        f1ZHSUKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //消費税端数単位
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '税端数単位', f1ZHSUTNIKBN.AsInteger, lvNm) = True then
        f1ZHSUTNIKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //取引区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分', f1TRIHIKIKBN.AsInteger, lvNm) = True then
        f1TRIHIKIKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //名称変更区分
    //-------------------------------------------------
    //if gfnJNTSELKBNNameGet(Qry, 'ALL', '名称変更', f1NMKBN.AsInteger, lvNm) = True then       //<141>
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '有無区分６', f1NMKBN.AsInteger, lvNm) = True then
        f1NMKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //指定商品ｺｰﾄﾞ区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '指定商品', f1SSHCDKBN.AsInteger, lvNm) = True then
        f1SSHCDKBNNM.Caption := lvNm;

//入力・集計（仕入先）
    //-------------------------------------------------
    //売上端数区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', f1URKINHSUKBN_Si.AsInteger, lvNm) = True then
        f1URKINHSUKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //現売税請求区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', f1GRUZSEIKBN_Si.AsInteger, lvNm, 0) = True then  //<102>
        f1GRUZSEIKBNNM_Si.Caption := lvNm;
    fnZeiKbnChange('f1GRUZSEIKBN_Si');
    //-------------------------------------------------
    //消費税請求区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', f1ZSEIKBN_Si.AsInteger, lvNm, 0) = True then //<102>
        f1ZSEIKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //消費税端数処理
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分', f1ZHSUKBN_Si.AsInteger, lvNm) = True then
        f1ZHSUKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //消費税端数単位
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '税端数単位', f1ZHSUTNIKBN_Si.AsInteger, lvNm) = True then
        f1ZHSUTNIKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //取引区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分2', f1TRIHIKIKBN_Si.AsInteger, lvNm) = True then
        f1TRIHIKIKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //名称変更区分
    //-------------------------------------------------
    //if gfnJNTSELKBNNameGet(Qry, 'ALL', '名称変更', f1NMKBN_Si.AsInteger, lvNm) = True then        //<141>
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '有無区分６', f1NMKBN_Si.AsInteger, lvNm) = True then
        f1NMKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //指定商品ｺｰﾄﾞ区分
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '指定商品', f1SSHCDKBN_Si.AsInteger, lvNm) = True then
        f1SSHCDKBNNM_Si.Caption := lvNm;


//印刷情報（得意先）
    //-------------------------------------------------
    //和暦西暦
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '和暦西暦区分', f1YYKBN.AsInteger, lvNm) = True then
        f1YYKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //代表者名の印字
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '有無区分２', f1DAINMKBN.AsInteger, lvNm) = True then
        f1DAINMKBNNM.Caption := lvNm;
    //-------------------------------------------------
    //売上合計欄
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1USGKEI.AsInteger, lvNm) = True then
        f1USGKEINM.Caption := lvNm;
    //-------------------------------------------------
    //上代合計欄税
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1JYGKEI.AsInteger, lvNm) = True then
        f1JYGKEINM.Caption := lvNm;
//<KOJ> Ins-s
    //-------------------------------------------------
    //工事合計欄
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1KUSGKEI_Tk.AsInteger, lvNm) = True then
        f1KUSGKEINM_Tk.Caption := lvNm;
//<KOJ> Ins-e


//印刷情報（仕入先）
    //-------------------------------------------------
    //和暦西暦
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '和暦西暦区分', f1YYKBN_Si.AsInteger, lvNm) = True then
        f1YYKBNNM_Si.Caption := lvNm;
    //-------------------------------------------------
    //代表者名の印字
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '有無区分２', f1DAINMKBN_Si.AsInteger, lvNm) = True then
        f1DAINMKBNNM_Si.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1USGKEI.AsInteger, lvNm) = True then
        f1USGKEINM.Caption := lvNm;
    //-------------------------------------------------
    //仕入合計欄
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1USGKEI_Si.AsInteger, lvNm) = True then
        f1USGKEINM_Si.Caption := lvNm;
//<KOJ> Ins-s
    //-------------------------------------------------
    //工事合計欄
    //-------------------------------------------------
    if gfnJNTSELKBNNameGet(Qry,'ALL','税金額区分',f1KUSGKEI_Si.AsInteger, lvNm) = True then
        f1KUSGKEINM_Si.Caption := lvNm;
//<KOJ> Ins-e

    //-------------------------------------------------
    //納品書ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1USDENPFM.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'ur00', lvCode, lvNm, lvNmk) = True then
        f1USDENPFMNM.Caption := lvNmk;
    //-------------------------------------------------
    //見積書ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1MITPFM.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'mi00', lvCode, lvNm, lvNmk) = True then
        f1MITPFMNM.Caption := lvNmk;
    //-------------------------------------------------
    //受注伝票のﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1JHDENPFM.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'jy00', lvCode, lvNm, lvNmk) = True then
        f1JHDENPFMNM.Caption := lvNmk;
    //-------------------------------------------------
    //出荷伝票のﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1SNDENPFM.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'sy00', lvCode, lvNm, lvNmk) = True then
        f1SNDENPFMNM.Caption := lvNmk;
    //-------------------------------------------------
    //送り状ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1SOFOPFM.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'ok00', lvCode, lvNm, lvNmk) = True then
    begin
        f1SOFOPFMNM.Caption := lvNmk;
        f1SOFOPFM.Zero := True;
    end;

//<KOJ> Ins-s
    //-------------------------------------------------
    //工事売上伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1KUSDENPFM_Tk.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'ku00', lvCode, lvNm, lvNmk) = True then
        f1KUSDENPFMNM_Tk.Caption := lvNmk;

    //-------------------------------------------------
    //工事見積書ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1KMITPFM_Tk.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'km00', lvCode, lvNm, lvNmk) = True then
        f1KMITPFMNM_Tk.Caption := lvNmk;

    //-------------------------------------------------
    //工事受注伝票のﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1KJHDENPFM_Tk.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'kj00', lvCode, lvNm, lvNmk) = True then
        f1KJHDENPFMNM_Tk.Caption := lvNmk;
//<KOJ> Ins-e

    //-------------------------------------------------
    //仕入伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1USDENPFM_Si.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'sr00', lvCode, lvNm, lvNmk) = True then
        f1USDENPFMNM_Si.Caption := lvNmk;

    //-------------------------------------------------
    //発注伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1JHDENPFM_Si.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'ha00', lvCode, lvNm, lvNmk) = True then
        f1JHDENPFMNM_Si.Caption := lvNmk;

    //-------------------------------------------------
    //入荷伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1SNDENPFM_Si.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'ny00', lvCode, lvNm, lvNmk) = True then
        f1SNDENPFMNM_Si.Caption := lvNmk;

//<KOJ> Ins-s
    //-------------------------------------------------
    //工事原価伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1KUSDENPFM_Si.AsInteger);
//<KOJ2> Upd-s
//    if gfnJNTSelRptNameGet(Qry, 'kg00', lvCode, lvNm, lvNmk) = True then
    if gfnJNTSelRptNameGet(Qry, 'gn00', lvCode, lvNm, lvNmk) = True then
//<KOJ2> Upd-e
        f1KUSDENPFMNM_Si.Caption := lvNmk;

    //-------------------------------------------------
    //工事発注伝票ﾌｫｰﾑ
    //-------------------------------------------------
    lvCode := IntToStr(f1KJHDENPFM_Si.AsInteger);
    if gfnJNTSelRptNameGet(Qry, 'kh00', lvCode, lvNm, lvNmk) = True then
        f1KJHDENPFMNM_Si.Caption := lvNmk;
//<KOJ> Ins-e

//<PASS>Add S
    if gfnJNTSELKBNNameGet(Qry, 'ALL', '外部連携区分', f1APIKBN.AsInteger, lvNm) = True then
        f1APIKBNNM.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード区分', f1PASSKBN.AsInteger, lvNm) = True then
        f1PASSKBNNM.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', '外部連携区分', f1APIKBN_Si.AsInteger, lvNm) = True then
        f1APIKBNNM_Si.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード区分', f1PASSKBN_Si.AsInteger, lvNm) = True then
        f1PASSKBNNM_Si.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分1', f1PASSITEMKBN1.AsInteger, lvNm) = True then
        f1PASSITEMKBN1NM.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分2', f1PASSITEMKBN2.AsInteger, lvNm) = True then
        f1PASSITEMKBN2NM.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分1', f1PASSITEMKBN1_Si.AsInteger, lvNm) = True then
        f1PASSITEMKBN1NM_Si.Caption := lvNm;

    if gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分2', f1PASSITEMKBN2_Si.AsInteger, lvNm) = True then
        f1PASSITEMKBN2NM_Si.Caption := lvNm;

//<PASS>Add E

end;


//-----------------------------------------------------------------------------
// fnESCConfirm
//	< ESC操作時ﾒｯｾｰｼﾞ確認 >
//      PARAM   :
//      RETURN  : True:処理続行、False:処理中止
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnESCConfirm: Boolean;
begin

    Result := True;

	//<HGA3>↓
    if uvBtUpdFlg = False then
    begin
        uvEdtSw := False;;
        //編集をｷｬﾝｾﾙする
        fnCancel(True);
        Exit;
    end;
	//<HGA3>↑

    //編集ｽｲｯﾁを判定
    if uvEdtSw = False then
    begin
        //編集をｷｬﾝｾﾙする
        fnCancel(True);
        Exit;
    end;

    //終了確認
    case uvSelSys.MsgDlg(1010,102) of
        //はい
        mrYes:
        begin
            if fnRecUpd = False then
            begin
                Result := False;
                Exit;
            end;
        end;
        //いいえ
        mrNo:
        begin
            uvEdtSw := False;;
            fnCancel(True);
        end;
        //ｷｬﾝｾﾙ
        mrCancel:
        begin
            Result := False;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnCloseConfirm
//	< 終了ﾒｯｾｰｼﾞ確認 >  // <47>
//      PARAM   :
//      RETURN  : True:処理続行、False:処理中止
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnCloseConfirm: Boolean;
begin

    Result := True;
// <124>↓ｺﾒﾝﾄｱｳﾄだったのを戻す
//(*
    //終了確認
    case uvSelSys.MsgDlg(1010,102) of
        //はい
        mrYes:
        begin
            if fnRecUpd = False then
            begin
                Result := False;
                Exit;
            end;
        end;
        //いいえ
        mrNo:
        begin
            //編集ｽｲｯﾁを初期化（FormClose要求が2回くるための対応）
            uvEdtSw := False;;
        end;
        //ｷｬﾝｾﾙ
        mrCancel:
        begin
            Result := False;
            Exit;
        end;
    end;
//*)//<LEAD>
end;

//-----------------------------------------------------------------------------
//  対象レコードを確定する
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnRecUpd: Boolean;
var
    Bol : Boolean;

begin
    Result  :=  True;
    Bol     :=  TRUE;

    if uvHoj1Flg = 1 then
    begin
        if fnRecUpd_FX(1) = False then
        begin
            Result := False;
            Exit;
        end;

        //和暦西暦区分・代表社名の印字変更時<101>
        //<101>･･････････････････････････････････････↓↓↓
        if Bol then Bol := (uvData_Load.pvrYYKbn    = f1YYKBN.AsInteger);       // 和暦西暦区分
        if Bol then Bol := (uvData_Load.pvrDaiNMKbn = f1DAINMKBN.AsInteger);    // 代表者名の印字
        //<101>･･････････････････････････････････････↑↑↑

        if not Bol then
        begin
//<Rel>     m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, StdProc6);
//↓<Rel>
		    // -------------------------------------------------------------------------
		    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
		    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
		    // -------------------------------------------------------------------------
		    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
		    begin
		        // 親会社DBとTStoredProcの接続
		        m_pMDataModule.SetDBInfoToSProc ( m_SyncMaster.m_cPDBSelect, StdProc6 );
		    end
			else
			begin
				m_pMDataModule.SetDBInfoToSProc(dbCorp_Select, StdProc6);
			end;
//↑<Rel>

			// -----<MHIS> Add-St-----
			SessionPractice(C_ST_PROCESS);

			try
			// -----<MHIS> Add-Ed-----

            // PRC_JNTCRP0040040_106
            with StdProc6 do
            begin
                ParamByName('@pTRNCD').AsFloat := uvNCODE;
                ExecProc;
                Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
            end;

            if not Bol then
            begin
                Exit;
            end;
//↓<Rel>
			// ストアド内で子取引先の和暦西暦区分・代表者名の印字区分をupdateしている。
			// トリガで子取引先レコードの_Relが更新されるので、同期プロシジャを実行して配信してあげる。
		    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
		    begin
		        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
		        if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) then
		        begin
		            Result := false;
		            Exit;
		        end;
		    end;
//↑<Rel>

			// -----<MHIS> Add-St-----
			finally
				SessionPractice(C_ED_PROCESS);
			end;
			// -----<MHIS> Add-Ed-----

        end;

		if uvTempFlg then
		begin
	        // ﾃﾝﾌﾟﾚｰﾄ情報(得意先)を保存
	        uvTmpURKINHSUKBN := f1URKINHSUKBN.AsInteger;        // 売上端数区分
	        uvTmpGRUZSEIKBN  := f1GRUZSEIKBN.asInteger;         // 現売税請求区分
	        uvTmpZSEIKBN     := f1ZSEIKBN.asInteger;            // 消費税請求区分
	        uvTmpZHSUKBN     := f1ZHSUKBN.asInteger;            // 消費税端数単位
	        uvTmpZHSUTNIKBN  := f1ZHSUTNIKBN.asInteger;         // 消費税端数処理
	        uvTmpTRIHIKIKBN  := f1TRIHIKIKBN.asInteger;         // 取引区分
	        uvTmpNMKBN       := f1NMKBN.asInteger;              // 名称変更区分
	        uvTmpSSHCDKBN    := f1SSHCDKBN.asInteger;           // 指定商品ｺｰﾄﾞ区分
	        uvTmpSSHCDKET    := f1SSHCDKET.asInteger;           // 指定商品ｺｰﾄﾞ桁数
	        uvTmpYYKBN       := f1YYKBN.asInteger;              // 和暦西暦区分
	        uvTmpDAINMKBN    := f1DAINMKBN.asInteger;           // 代表者名の印字
	        uvTmpUSDENPFM    := f1USDENPFM.asInteger;           // 納品書ﾌｫｰﾑ
	        uvTmpMITPFM      := f1MITPFM.asInteger;             // 見積書ﾌｫｰﾑ
	        uvTmpJHDENPFM    := f1JHDENPFM.asInteger;           // 受注伝票ﾌｫｰﾑ
	        uvTmpSNDENPFM    := f1SNDENPFM.asInteger;           // 出荷伝票ﾌｫｰﾑ
	        uvTmpUSGKEI      := f1USGKEI.asInteger;             // 売上合計欄税印字
	        uvTmpJYGKEI      := f1JYGKEI.asInteger;             // 上代合計欄税印字
	        uvTmpSOFOPFM     := f1SOFOPFM.asInteger;            // 送り状ﾌｫｰﾑ

//<KOJ> Ins-s
	        uvTmpKUSGKEI     := f1KUSGKEI_Tk.asInteger;         // 工事合計欄税印字
	        uvTmpKUSDENPFM   := f1KUSDENPFM_Tk.asInteger;       // 工事売上伝票ﾌｫｰﾑ
	        uvTmpKMITPFM     := f1KMITPFM_Tk.asInteger;         // 工事見積書ﾌｫｰﾑ
	        uvTmpKJHDENPFM   := f1KJHDENPFM_Tk.asInteger;       // 工事受注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

//<134>
			uvTmpKTKBN1		 := Trunc(fnGetNCODE(f1KKTKBRCD1.text,811,uvKTKBN1Attr));
			uvTmpKTKBN2		 := Trunc(fnGetNCODE(f1KKTKBRCD2.text,812,uvKTKBN2Attr));

			uvTmpTKCM1		 := f1MEMO1.Text;		//<136>
			uvTmpTKCM2		 := f1MEMO2.Text;		//<136>
//↓<139>
			uvTmpTnkRnk		:= f1TNKRNK.AsInteger;
			uvTmpKakeRt		:= f1KAKERT.AsDouble;
//↑<139>

//<PASS>Add S
			uvTmpAPIKBN			:= f1APIKBN.asInteger;				//外部連携区分
			uvTmpPASSKBN		:= f1PASSKBN.asInteger;				//パスワード区分
			uvTmpPASSITEMKBN1	:= f1PASSITEMKBN1.asInteger;		//パスワード合成項目１
			uvTmpPASSITEMKBN2	:= f1PASSITEMKBN2.asInteger;		//パスワード合成項目２
//<PASS>Add E

		end;
    end;

    if uvHoj2Flg = 1 then
    begin
        if fnRecUpd_FX(2) = False then
        begin
            Result := False;
            Exit;
        end;

        // 和暦西暦区分・代表社名の印字変更時<101>
        //<101>･･････････････････････････････････････↓↓↓
        if Bol then Bol := (uvData_Load_S.pvrYYKbn    = f1YYKBN_SI.AsInteger);      // 和暦西暦区分
        if Bol then Bol := (uvData_Load_S.pvrDaiNMKbn = f1DAINMKBN_SI.AsInteger);   // 代表者名の印字
        //<101>･･････････････････････････････････････↑↑↑

        if not Bol then
        begin
//<Rel>     m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, StdProc6_S);
//↓<Rel>
		    // -------------------------------------------------------------------------
		    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
		    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
		    // -------------------------------------------------------------------------
		    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
		    begin
		        // 親会社DBとTStoredProcの接続
		        m_pMDataModule.SetDBInfoToSProc ( m_SyncMaster.m_cPDBSelect, StdProc6_S );
		    end
			else
			begin
				m_pMDataModule.SetDBInfoToSProc(dbCorp_Select, StdProc6_S);
			end;
//↑<Rel>

			// -----<MHIS> Add-St-----
			SessionPractice(C_ST_PROCESS);

			try
			// -----<MHIS> Add-Ed-----

            // PRC_JNTCRP0040040_106
            with StdProc6_S do
            begin
                ParamByName('@pTRNCD').AsFloat := uvNCODE;
                ExecProc;
                Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
            end;

            if not Bol then
            begin
                Exit;
            end;
//↓<Rel>
			// ストアド内で子取引先の和暦西暦区分・代表者名の印字区分をupdateしている。
			// トリガで子取引先レコードの_Relが更新されるので、同期プロシジャを実行して配信してあげる。
		    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
		    begin
		        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
		        if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) then
		        begin
		            Result := false;
		            Exit;
		        end;
		    end;
//↑<Rel>

			// -----<MHIS> Add-St-----
			finally
				SessionPractice(C_ED_PROCESS);
			end;
			// -----<MHIS> Add-Ed-----

        end;

		if uvTempFlg then
		begin
	        // ﾃﾝﾌﾟﾚｰﾄ情報(仕入先)を保存
	        uvTmpURKINHSUKBN_Si := f1URKINHSUKBN_Si.AsInteger;  // 売上端数区分
	        uvTmpGRUZSEIKBN_Si  := f1GRUZSEIKBN_Si .AsInteger;  // 現売税請求区分
	        uvTmpZSEIKBN_Si     := f1ZSEIKBN_Si    .AsInteger;  // 消費税請求区分
	        uvTmpZHSUKBN_Si     := f1ZHSUKBN_Si    .AsInteger;  // 消費税端数単位
	        uvTmpZHSUTNIKBN_Si  := f1ZHSUTNIKBN_Si .AsInteger;  // 消費税端数処理
	        uvTmpTRIHIKIKBN_Si  := f1TRIHIKIKBN_Si .AsInteger;  // 取引区分
	        uvTmpNMKBN_Si       := f1NMKBN_Si      .AsInteger;  // 名称変更区分
	        uvTmpSSHCDKBN_Si    := f1SSHCDKBN_Si   .AsInteger;  // 指定商品ｺｰﾄﾞ区分
	        uvTmpSSHCDKET_Si    := f1SSHCDKET_Si   .AsInteger;  // 指定商品ｺｰﾄﾞ桁数
	        uvTmpYYKBN_Si       := f1YYKBN_Si      .AsInteger;  // 和暦西暦区分
	        uvTmpDAINMKBN_Si    := f1DAINMKBN_Si   .AsInteger;  // 代表者名の印字
	        uvTmpUSDENPFM_Si    := f1USDENPFM_Si   .AsInteger;  // 納品書ﾌｫｰﾑ
	        uvTmpJHDENPFM_Si    := f1JHDENPFM_Si   .AsInteger;  // 受注伝票ﾌｫｰﾑ
	        uvTmpSNDENPFM_Si    := f1SNDENPFM_Si   .AsInteger;  // 出荷伝票ﾌｫｰﾑ
	        uvTmpUSGKEI_Si      := f1USGKEI_Si     .AsInteger;  // 売上合計欄税印字

//<KOJ> Ins-s
	        uvTmpKUSGKEI_Si     := f1KUSGKEI_Si    .AsInteger;  // 工事合計欄税印字
	        uvTmpKUSDENPFM_Si   := f1KUSDENPFM_Si  .AsInteger;  // 工事原価伝票ﾌｫｰﾑ
	        uvTmpKJHDENPFM_Si   := f1KJHDENPFM_Si  .AsInteger;  // 工事発注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

//<134>
			uvTmpKSIBN1			:= Trunc(fnGetNCODE(f1KKSIBRCD1.text,821,uvKSIBN1Attr));
			uvTmpKSIBN2			:= Trunc(fnGetNCODE(f1KKSIBRCD2.text,822,uvKSIBN2Attr));

            uvTmpSICM1			:= f1MEMO1_Si.text;		//<136>
            uvTmpSICM2			:= f1MEMO2_Si.text;		//<136>
//↓<139>
			uvTmpTnkRnk_Si		:= f1TNKRNK_Si.AsInteger;
			uvTmpKakeRt_Si		:= f1KAKERT_Si.AsDouble;
//↑<139>

//<PASS>Add S
			uvTmpAPIKBN_Si		:= f1APIKBN_Si.asInteger;			//外部連携区分
			uvTmpPASSKBN_Si		:= f1PASSKBN_Si.asInteger;			//パスワード区分
			uvTmpPASSITEMKBN1_Si:= f1PASSITEMKBN1_Si.asInteger;		//パスワード合成項目１
			uvTmpPASSITEMKBN2_Si:= f1PASSITEMKBN2_Si.asInteger;		//パスワード合成項目２
//<PASS>Add E
		end;
    end;

    // ﾌｫｰﾑの初期化
    fnInzForm;

    f0CODE.Text    := '';
    f0CODE.Enabled := True;
    f0CODE.SetFocus;
end;

//-----------------------------------------------------------------------------
//  タブ変更時処理
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.MTab1Change(Sender: TObject);
begin
    //↓<Vista>
    // ScrollBox1にボタンを乗せたため、後ろに隠れてしまうので前面にする。
    MBitBtnBefor.BringToFront;
    MBitBtnAfter.BringToFront;
    BtnUpd.BringToFront;
    BtnCan.BringToFront;
    //↑<Vista>

	// FormCreat後のOnChangeｲﾍﾞﾝﾄの発生か？
	if uvFormCreateSw <> True then
    	Exit;

	// ﾎﾞﾀﾝEnabled制御処理
	fnBtnEnabled;

    // VK_xxxｷｰ有効無効ｽｲｯﾁ(True:有効 False:無効)
    if uvVK_KeyKilSw = False then
    begin
		uvVK_KeyKilSw := True;
    	Exit;	// 以降処理を中止
    end;

	MjsSetFocus(Self,ucTabFld);

    MjsNextCtrl(Self);

end;

//=============================================================================
// フォーム表示時処理	<2001.01.30> -Add Part2
//=============================================================================
procedure TFrmJNTCRP004004F.FormShow(Sender: TObject);
begin

    //<100>
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

    JNTMasSetCaption( m_pMjsAppRec );

    FormActivate(Sender);

    // ｱｸｾﾗﾚｰﾀｷｰの制御<33>
    MjsBtnVisible(Self, True);

    //<PASS>Add S
    //MjsBtnVisibleで再度表示されてしまうため、再度シリーズチェックを行う
    if TMSeries3.IsGalileopt4  then
    begin
        btnMask.Visible    := True;
        btnMask_Si.Visible := True;
    end
    else
    begin
        btnMask.Visible    := False;
        btnMask_Si.Visible := False;
    end;

    //<PASS>Add E

    // <PRN>
	if ( uvHani.mjspre.IsPreView = TRUE ) then
    begin
	    uvHani.mjspre.Show
    end
    else
    begin
        if ( ACControl.Enabled = True ) then
        begin
        	ACControl.SetFocus();
        end;
    end;

end;

//=============================================================================
// フォーム非表示時処理	<2001.01.30> -Add Part2
//=============================================================================
procedure TFrmJNTCRP004004F.FormHide(Sender: TObject);
begin

    // <PRN>
	if ( uvHani.mjspre.IsPreView = TRUE ) then
	    uvHani.mjspre.Hide;

    // ｱｸｾﾗﾚｰﾀｷｰの制御
    MjsBtnVisible(Self, False);

end;

//-----------------------------------------------------------------------------
// fnPostArrowClick()
//	< 入力ｺﾝﾎﾟｰﾈﾝﾄ ｸﾘｯｸ ｲﾍﾞﾝﾄ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnPostArrowClick(Sender: TObject);
begin
    //エクスプローラ表示
    fnCallPostExplorer('郵便1',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);
end;



procedure TFrmJNTCRP004004F.fnAdsArrowClick(Sender: TObject);
begin
    //エクスプローラ表示
    fnCallPostExplorer('住所',f1POSTNO1,f1POSTNO2,f1ADS1,f1ADS2);
end;


//-----------------------------------------------------------------------------
// fnPostArrowClick()   <15>で追加
//	< 郵便番号入力のOnArrowClickの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender: 		TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnCallPostExplorer(pvKeyWord:String; pvPostEdit1,pvPostEdit2:TMNumEdit; pvAdsEdit1,pvAdsEdit2:TMTxtEdit);
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
//<LEAD>            	iValue := uvSelSys.MsgDlg(1010, 800);
//<LEAD>				if iValue <> mrYes then
//<LEAD>					Exit;
			end;
		end;

		pvPostEdit1.Value := iZip1;						// 基番 SET
		pvPostEdit2.Value := iZip2;						// 枝番 SET
        //↓<PST2>
        if iZip1 <> 0 then
        begin
        	pvPostEdit2.Zero := True;
        end
        else
        begin
        	pvPostEdit2.Zero := False;
        end;
        //↑<PST2>

//<229>--↓
		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr1)>40 then					//<D10-U>Length → MjsHanLength
		begin
			if not NspSepStr(sAdr1,40,s1,s2)then
				Exit;

			sAdr1:=s1;
			sAdr2:=s2+sAdr2;
		end;
		//ﾏｽﾀ長超?
		if MjsHanLength(sAdr2)>40 then					//<D10-U>Length → MjsHanLength
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
// fnBtnNextFocus()
//	< 次の強制ﾌｫｰｶｽ位置 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnBtnNextFocus: Boolean;
var
    lvCompName	: String;
//	lvTabCountd : Integer;
//	lvTabSelect : Integer;
    lvP1LastFld : String;
    lvP2LastFld : String;
    lvP3LastFld : String;

begin

    Result := True;

     // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    lvCompName := '';
    if Screen.ActiveControl <> nil then
        lvCompName := TComponent(Screen.ActiveControl).Name
    else
		Exit;

    //ﾀﾌﾞCount取得
    //lvTabCountd := MTab1.Items.count;
    //ﾀﾌﾞIndec取得
    //lvTabSelect := MTab1.Items.Selected;

	if (lvCompName = ucLastFld) then
	begin
        MTab1NextSetFcous;
   	    Abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;

    lvP1LastFld := ucP1LastFldU;
    if uvHoj2Flg <> 0 then
        lvP1LastFld := ucP1LastFldS;

    lvP2LastFld := 'f1SSHCDKET';
    if f1SSHCDKBN.Value = 1 then
        lvP2LastFld := 'f1SSHCDKBN';

    lvP3LastFld := 'f1SSHCDKET_Si';
    if f1SSHCDKBN_Si.Value = 1 then
        lvP3LastFld := 'f1SSHCDKBN_Si';


   	if (uvTempFlg = False)          and
       ((lvCompName = lvP1LastFld) or
   	    (lvCompName = lvP2LastFld) or
   	    (lvCompName = lvP3LastFld) or
   	    (lvCompName = ucP4LastFld) or
   	    (lvCompName = ucP5LastFld)) then
    begin
		MjsSetFocus(Self,ucBtnAFTER);       // 次へﾎﾞﾀﾝ
   	    Result := False;
   	    abort;
    end;

    // ﾃﾝﾌﾟﾚｰﾄの時
  	if (uvTempFlg)                  and
       ((lvCompName = lvP1LastFld) or
        (lvCompName = lvP2LastFld) or
   	    (lvCompName = lvP3LastFld) or
   	    (lvCompName = ucP4LastFld)) then
    begin
		MjsSetFocus(Self,ucBtnAFTER);       // 次へﾎﾞﾀﾝ
   	    Result := False;
   	    Abort;
    end;

   	if (uvTempFlg = False)                  and
       ((lvCompName = ucP6LastFld) or
        ((Blind_Othr_Si.Visible = False) and
         (lvCompName = 'f1MEMO2')))         then
    begin
		if BtnUpd.Enabled then
			MjsSetFocus(Self,ucBtnOK)
		else
			MjsSetFocus(Self,ucBtnNG);

   	    Result := False;
   	    Abort;
    end;

    // ﾃﾝﾌﾟﾚｰﾄの時
   	if (uvTempFlg)                          and
       ((lvCompName = ucP5LastFld ) or
        ((Blind_Othr_Si.Visible = False) and
         (lvCompName = 'f1MEMO2')))         then
    begin
		if BtnUpd.Enabled then
			MjsSetFocus(Self,ucBtnOK)
		else
			MjsSetFocus(Self,ucBtnNG);

   	    Result := False;
   	    Abort;
    end;

{
	if (lvCompName = ucLastFld) then
	begin
        GoInputTop;
   	    abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;


	if (lvCompName = ucP1LastFld) then
	begin
   		MTab1.Items.Selected := 1;
   	    Result := False;
   	    abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;

	if (lvCompName = ucP2LastFld) then
	begin
   		MTab1.Items.Selected := 2;
   	    Result := False;
   	    abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;

	if (lvCompName = ucP3LastFld) then
	begin
   		MTab1.Items.Selected := 3;
   	    Result := False;
   	    abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;

	if (lvCompName = ucP4LastFld) then
	begin
		BtnUpd.SetFocus();
	    Result := False;
		abort;
	end;
}
end;


//-----------------------------------------------------------------------------
// 納品書ﾌｫｰﾑのDFM取得
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnDfmGet;

begin
    // 納品書ﾌｫｰﾑのDFM取得
    with Qry do
    begin
        Close;
        SQL.Clear;
        // ｺｰﾄﾞ, 正式名称, 簡略名称を返す
		SQL.Add('SELECT ');
		SQL.Add('DFM FROM MPRINT ');
		SQL.Add('WHERE ');
		SQL.Add('PRGID = :PrgID ');			//<D10>@カット
		SQL.Add('AND CODE = :CODE ');		//<D10>@カット

    	ParamByName('PrgID').AsString := 'ur00';				//<D10>@カット
    	ParamByName('CODE').AsInteger  := f1USDENPFM.AsInteger;	//<D10>@カット
        Open;

		if Eof = False then // ﾃﾞｰﾀ:あり
		begin
        	uvUSDENDFM := FieldByname('DFM').AsInteger;
        end;
        Close;
    end;
end;

//-----------------------------------------------------------------------------
//  FormActivate()
//      ﾌｫｰﾑﾌｫｰｶｽ取得処理
//      PARAM   :
//      RETURN  :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.FormActivate(Sender: TObject);
var
    AppPrm: TAppParam;

begin

    AppPrm.iAction      :=  ACTID_ACTIVEEND;
    AppPrm.pRecord      :=  Pointer(m_pMjsAppRec);
    AppPrm.pActionParam :=  nil;
    TMjsAppRecord(m_pMjsAppRec^).m_pOwnerEntry(@AppPrm);

end;

//-----------------------------------------------------------------------------
// fnBtnEnabled()
//	< ﾎﾞﾀﾝEnabled制御処理 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnBtnEnabled: Boolean;
var
	LastPnl	:	Integer;
	i		:	Integer;
begin

    Result := True;

    // 入力中でなけば無視
	//<HGA>if BtnUpd.Enabled <> True then
    if ((BtnUpd.Enabled <> True) and (uvBtUpdFlg)) then	//<HGA>
        Exit;

	for i:=0 to 5 do
	begin
		if Mtab1.Items[i].Visible then
			LastPnl := i;
	end;

    //ﾃﾝﾌﾟﾚｰﾄﾓｰﾄﾞの時
{
    if uvTempFlg then
    begin
        if ucScrollBox2 = MTab1.Items.Selected then
        begin
            MjsSetEnabled(Self,ucBtnBEFOR,False);
            MjsSetEnabled(Self,ucBtnAFTER,True);
        end
        else if ucScrollBox5 = MTab1.Items.Selected then
        begin
            MjsSetEnabled(Self,ucBtnBEFOR,True);
            MjsSetEnabled(Self,ucBtnAFTER,False);
        end
        else begin
            MjsSetEnabled(Self,ucBtnBEFOR,True);
            MjsSetEnabled(Self,ucBtnAFTER,True);
        end;
    end
    else  //通常
    begin
}
        if ucScrollBox1 = MTab1.Items.Selected then
        begin
            MjsSetEnabled(Self,ucBtnBEFOR,False);
            MjsSetEnabled(Self,ucBtnAFTER,True);
        end
//        else if ucScrollBox6 = MTab1.Items.Selected then
        else if LastPnl = MTab1.Items.Selected then
        begin
            MjsSetEnabled(Self,ucBtnBEFOR,True);
            MjsSetEnabled(Self,ucBtnAFTER,False);
        end
        else begin
            MjsSetEnabled(Self,ucBtnBEFOR,True);
            MjsSetEnabled(Self,ucBtnAFTER,True);
        end;

//    end;
end;

//-----------------------------------------------------------------------------
// fnBtnOnChange()
//	< ﾎﾞﾀﾝOnChange処理 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnBtnOnChange(pName:String): Boolean;
var
    lvCompName		:	string;
	lvTabSelect		:	Integer;
//    lvTabCountd		:	Integer;
begin

    Result := False;

    // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    if pName = '' then
    begin
        lvCompName := '';
        if Screen.ActiveControl <> nil then
            lvCompName := TComponent(Screen.ActiveControl).Name
        else
    		Exit;
    end
    else
        lvCompName := pName;

	// 登録ﾎﾞﾀﾝ
    if	    lvCompName = ucBtnOK		then
    begin
        fnRecUpd;
        Exit;
    end;

	// ｷｬﾝｾﾙﾎﾞﾀﾝ
	if		lvCompName = ucBtnNG      	then
    begin
        fnCancel(True);
        Exit;
    end;

	// 終了ﾎﾞﾀﾝ
    if	    lvCompName = ucBtnEnd		then
    begin
        Close;
        Exit;
    end;

    // ﾀﾌﾞCount取得
//	lvTabCountd := MTab1.Items.count;   //<47>
    // ﾀﾌﾞIndec取得
	lvTabSelect := MTab1.Items.Selected;

	{前移動ﾎﾞﾀﾝ}
    if		lvCompName = ucBtnBEFOR	    then
	begin
		if lvTabSelect > 0 then
        begin
            //得意先採用のみ
            if (uvHoj1Flg = 1) And (uvHoj2Flg <> 1) then
            begin
                if (lvTabSelect = 3) Or (lvTabSelect = 5) then
                    lvTabSelect := lvTabSelect -1;
            end;

            //仕入先採用のみ
            if (uvHoj1Flg <> 1) And (uvHoj2Flg = 1) then
            begin
                if (lvTabSelect = 2) Or (lvTabSelect = 4) then
                    lvTabSelect := lvTabSelect -1;
            end;

			MTab1.Items.Selected := lvTabSelect - 1;
            MTab1NextSetFcous;
            //ｼｮｰﾄｶｯﾄｷｰのBeep音抑止
            if pName = '' then
                abort
            else
                Exit;
            // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
        end;

	end;

	{後移動ﾎﾞﾀﾝ}
    if		lvCompName = ucBtnAFTER 	then
    begin

		if MTab1.Items.Selected < (MTab1.Items.count - 1) then
        begin

            //得意先採用のみ
            if (uvHoj1Flg = 1) And (uvHoj2Flg <> 1) then
            begin
                if (lvTabSelect = 1) Or (lvTabSelect = 3) then
                    lvTabSelect := lvTabSelect +1;
            end;

            //仕入先採用のみ
            if (uvHoj1Flg <> 1) And (uvHoj2Flg = 1) then
            begin
                if (lvTabSelect = 0) Or (lvTabSelect = 2) then
                    lvTabSelect := lvTabSelect +1;
            end;

			MTab1.Items.Selected := lvTabSelect + 1;
            MTab1NextSetFcous;
            //ｼｮｰﾄｶｯﾄｷｰのBeep音抑止
            if pName = '' then
                abort
            else
                Exit;
            // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
        end;

    end;


end;

//-----------------------------------------------------------------------------
// MTab1NextSetFcous()  <27>
//	< ﾀﾌﾞの移動処理 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.MTab1NextSetFcous;
begin

    // 入力中でなけば無視
	//<HGA>if BtnUpd.Enabled <> True then
    if ((BtnUpd.Enabled <> True) and (uvBtUpdFlg)) then	//<HGA>
        Exit;

    if uvDispFlg = 1 then Exit;

	// 入力位置に移動
	case MTab1.Items.Selected of


        //「基本情報」ﾊﾟﾈﾙ
		//---------------------------------------------------
        //売上・仕入ともに採用のない場合にはTab自体が非表示
        //---------------------------------------------------
	    ucScrollBox1:
        begin
            if (uvHoj1Flg = 0) and (uvHoj2Flg = 0) then
                exit
            else
            begin
                if uvHoj1Flg = 1 then
				begin

					if uvTempFlg then
					begin
						f1BMCODE.SetFocus;
						Exit;
					end;

//           			MjsSetFocus(Self,ucP1FirstFldU);
					if f1POSTNO1.Enabled then
						f1POSTNO1.SetFocus
					else
						f1TEL2.SetFocus;
				end
                else if uvHoj2Flg = 1 then
				begin

					if uvTempFlg then
					begin
						f1BMCODE_Si.SetFocus;
						Exit;
					end;

//       		    	MjsSetFocus(Self,ucP1FirstFldS);
					if f1POSTNO1_Si.Enabled then
						f1POSTNO1_Si.SetFocus
					else
						f1TEL2_Si.SetFocus;
				end;
            end;
        End;

		//「得意先入力・集計情報」ﾊﾟﾈﾙ
    	ucScrollBox2:
   			MjsSetFocus(Self,ucP2FirstFld);

		//「仕入先入力・集計情報」ﾊﾟﾈﾙ
	    ucScrollBox3:
   			MjsSetFocus(Self,ucP3FirstFld);

		//「得意先印刷情報」ﾊﾟﾈﾙ
	    ucScrollBox4:
   			MjsSetFocus(Self,ucP4FirstFld);

		//「仕入先印刷情報」ﾊﾟﾈﾙ
	    ucScrollBox5:
   			MjsSetFocus(Self,ucP5FirstFld);

		//「仕入先印刷情報」ﾊﾟﾈﾙ
	    ucScrollBox6:
            begin
                if Blind_Othr_TK.Visible then
           			MjsSetFocus(Self,ucP6FirstFld)
                else
           			MjsSetFocus(Self,'f1MEMO1_Si');
            end;

    end;

end;

//-----------------------------------------------------------------------------
// MBitBtnBeforSetFcous()
//	< ﾋﾞｯﾄﾎﾞﾀﾝ ↑移動 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.MBitBtnBeforSetFcous(AcFldName: String);
var
    lvFldName: string;

    //各ﾍﾟｰｼﾞの最終ﾌｨｰﾙﾄﾞへ
    procedure fnMBitBtnBeforSetFcous;
    begin
        case MTab1.Items.Selected of
            ucScrollBox1:                                   //「基本情報」ﾊﾟﾈﾙ
            begin
                if (uvHoj1Flg = 0) and (uvHoj2Flg = 0) then
                    Exit
                else
                begin
                    if uvHoj2Flg = 1 then
           		    	MjsSetFocus(Self, ucP1LastFldS)
                    else
       		    	    MjsSetFocus(Self, ucP1LastFldU);
                end;
            End;
            ucScrollBox2:                                   //「得意先入力・集計情報」ﾊﾟﾈﾙ
            begin
                if f1SSHCDKET.Enabled then
                    MjsSetFocus(Self, ucP2LastFld)
                else
                    MjsSetFocus(Self, 'f1SSHCDKBN');
            end;
            ucScrollBox3:                                   //「仕入先入力・集計情報」ﾊﾟﾈﾙ
            begin
                if f1SSHCDKET_Si.Enabled then
                    MjsSetFocus(Self, ucP3LastFld)
                else
                    MjsSetFocus(Self, 'f1SSHCDKBN_Si');
            end;
            ucScrollBox4:                                   //「得意先印刷情報」ﾊﾟﾈﾙ
                MjsSetFocus(Self, ucP4LastFld);

            ucScrollBox5:                                   //「仕入先印刷情報」ﾊﾟﾈﾙ
                MjsSetFocus(Self, ucP5LastFld);

            ucScrollBox6:                                   //「その他」ﾊﾟﾈﾙ
            begin
                if Blind_Othr_Si.Visible then
                    MjsSetFocus(Self,ucP6LastFld)
                else
                    MjsSetFocus(Self,'f1MEMO2')
            end;

        end;
    end;

begin

    if AcFldName = '' then
        Exit;

    lvFldName := '';

    //「戻る」ﾎﾞﾀﾝ
    if AcFldName = ucBtnBEFOR then
    begin
//        fnMBitBtnBeforSetFcous;
		MBitBtnAfter.TabStop	:= False;
		BtnUpd.TabStop			:= False;
		MjsPrevCtrl( Self );
		MBitBtnAfter.TabStop	:= True;
		BtnUpd.TabStop			:= True;
        Exit;
    end;

    //「次へ」ﾎﾞﾀﾝ
    if AcFldName = ucBtnAFTER then
    begin
        if MBitBtnBefor.Enabled then
        begin
    	    lvFldName := ucBtnBEFOR
        end
        else
        begin
//            fnMBitBtnBeforSetFcous;
			MjsPrevCtrl( Self );
            Exit;
        end;
    end;

    //「取消」ﾎﾞﾀﾝ
    if AcFldName = ucBtnNG then
	begin
    	if BtnUpd.Enabled then
		    lvFldName := ucBtnOK;
	end;

	//「更新」ﾎﾞﾀﾝ
    if AcFldName = ucBtnOK then
    begin
        if MBitBtnAfter.Enabled then
            lvFldName := ucBtnAFTER
        else
            lvFldName := ucBtnBEFOR;
    end;

    if lvFldName <> '' then
        MjsSetFocus(Self, lvFldName);

end;

//-----------------------------------------------------------------------------
// MBitBtnAfterSetFcous()
//	< ﾋﾞｯﾄﾎﾞﾀﾝ ↓移動 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.MBitBtnAfterSetFcous(AcFldName: String);
var
    lvFldName: string;

begin

    if AcFldName = '' then
        Exit;

    lvFldName := '';

    //「戻る」ﾎﾞﾀﾝ
    if AcFldName = ucBtnBEFOR then
	begin
		if MBitBtnAfter.Enabled then
		    lvFldName := ucBtnAFTER
		else
		    lvFldName := ucBtnOK;
	end;

    //「次へ」ﾎﾞﾀﾝ
    if AcFldName = ucBtnAFTER then
	    lvFldName := ucBtnOK;

	//「更新」ﾎﾞﾀﾝ
    if AcFldName = ucBtnOK then
	    lvFldName := ucBtnNG;

    //「取消」ﾎﾞﾀﾝ
    if AcFldName = ucBtnNG then
	    lvFldName := '';

    if lvFldName <> '' then
        MjsSetFocus(Self, lvFldName);

end;

//-----------------------------------------------------------------------------
// fnEndKeyBtnFcous()
//	< EndKey押下時のﾋﾞｯﾄﾎﾞﾀﾝへの移動 >
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnEndKeyBtnFcous;
begin
    // <129>ST---
    if (MBitBtnAfter.Enabled) then
    begin
   	    MjsSetFocus(Self, 'MBitBtnAfter');
        Exit;
    end;
    // <129>ED---

	// 更新ﾎﾞﾀﾝが有効だったら更新ﾎﾞﾀﾝへ
	if BtnUpd.Enabled = True then
    begin
   	    MjsSetFocus(Self, ucBtnOK);
        Exit;
    end;

    // <HGA>↓
	// 取消ﾎﾞﾀﾝが有効だったら取消ﾎﾞﾀﾝへ
	if BtnCan.Enabled = True then
    begin
   	    MjsSetFocus(Self, ucBtnNG);
        Exit;
    end;

end;

//-----------------------------------------------------------------------------
// fnZeiKbnChange()     <57>
//	現売税請求区分or消費税請求区分のどちかが「9:請求しない」の場合は入力制限をする。
//      PARAM   :pCompoName:String　ｺﾝﾎﾟｰﾈﾝﾄ名
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnZeiKbnChange(pCompoName:String): Boolean;
var
    lvNm    :   String;
begin

    Result := True;

    // <20> 現売税請求区分or消費税請求区分のどちかが「9:請求しない」の場合は強制
    if ( f1GRUZSEIKBN.AsInteger = 9 ) and ( pCompoName = 'f1GRUZSEIKBN') then
    begin

        gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', 9, lvNm);
        f1ZSEIKBN.value         := 9;
        f1ZSEIKBNNM.Caption     := lvNm;

        gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', 9, lvNm);
        f1GRUZSEIKBN.value      := 9;
        f1GRUZSEIKBNNM.Caption  := lvNm;

        f1ZSEIKBN.Static    := True;
        f1ZHSUTNIKBN.Static := True;
        f1ZHSUKBN.Static    := True;
    end
    else if ( f1ZSEIKBN.AsInteger = 9 ) and ( pCompoName = 'f1ZSEIKBN') then
    begin

        gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', 9, lvNm);
        f1ZSEIKBN.value         := 9;
        f1ZSEIKBNNM.Caption     := lvNm;

        gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', 9, lvNm);
        f1GRUZSEIKBN.value      := 9;
        f1GRUZSEIKBNNM.Caption  := lvNm;

        f1ZSEIKBN.Static    := True;
        f1ZHSUTNIKBN.Static := True;
        f1ZHSUKBN.Static    := True;
    end
    else begin
        f1ZSEIKBN.Static    := False;
        f1ZHSUTNIKBN.Static := False;
        f1ZHSUKBN.Static    := False;
    end;

    // <20> 現仕税請求区分or消費税請求区分のどちかが「9:請求しない」の場合は強制
    if ( f1GRUZSEIKBN_SI.AsInteger = 9 ) and ( pCompoName = 'f1GRUZSEIKBN_Si') then
    begin
        gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', 9, lvNm);
        f1ZSEIKBN_SI.value         := 9;
        f1ZSEIKBNNM_SI.Caption     := lvNm;

        gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', 9, lvNm);
        f1GRUZSEIKBN_SI.value      := 9;
        f1GRUZSEIKBNNM_SI.Caption  := lvNm;

        f1ZSEIKBN_SI.Static    := True;
        f1ZHSUTNIKBN_SI.Static := True;
        f1ZHSUKBN_SI.Static    := True;
    end
    else if ( f1ZSEIKBN_SI.AsInteger = 9 ) and ( pCompoName = 'f1ZSEIKBN_Si') then
    begin

        gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分', 9, lvNm);
        f1ZSEIKBN_SI.value         := 9;
        f1ZSEIKBNNM_SI.Caption     := lvNm;

        gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分', 9, lvNm);
        f1GRUZSEIKBN_SI.value      := 9;
        f1GRUZSEIKBNNM_SI.Caption  := lvNm;

        f1ZSEIKBN_SI.Static    := True;
        f1ZHSUTNIKBN_SI.Static := True;
        f1ZHSUKBN_SI.Static    := True;
    end
    else begin
        f1ZSEIKBN_SI.Static    := False;
        f1ZHSUTNIKBN_SI.Static := False;
        f1ZHSUKBN_SI.Static    := False;
    end;

end;

//-----------------------------------------------------------------------------
//  NspSepStr()	<229>
//      郵便番号辞書からの住所桁数調節
//
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.NspSepStr(const sSrc:String;iLen:integer;var sDst1,sDst2:string):boolean;
var
	i,iCopy:integer;
	sRet:String;
	bFlg:boolean;	//True:全角前半/False:他
begin
	sDst1:='';
	sDst2:='';

//Byte比較し分割長以下ならそのまま返す
	if MjsHanLength(sSrc)<=iLen then			//<D10-U>Length → MjsHanLength
	begin
		sDst1:=sSrc;
		Result:=true;
		Exit;
	end;

//文字数分Loopしﾁｪｯｸ後分割

	sRet	:='';
	bFlg	:=False;
	iCopy	:=0;

	for i:=1 to MjsHanLength(sSrc) do			//<D10-U>Length → MjsHanLength
	begin
		if i>iLen then
			break;

		case MjsHanByteType(sSrc,i)of			//<D10-U>ByteType → MjsHanByteType
			//半角
			mbSingleByte:
			begin
				if bFlg then	//全前+半角?
				begin
					Result:=False;
					Exit;
				end;
				sRet	:=sRet+MjsHanCopy(sSrc,i,1);	//<D10-U>Copy → MjsHanCopy
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
				sRet	:=sRet+MjsHanCopy(sSrc,i-1,2);	//<D10-U>Copy → MjsHanCopy
				bFlg	:=False;
				iCopy	:=iCopy+2;
			end;
		end;
	end;

	//前半
	sDst1:=sRet;
	//後半(残)
	sDst2:=MjsHanCopy(sSrc,iCopy+1,MjsHanLength(sSrc)-iCopy);		//<D10-U>Copy → MjsHanCopy、Length → MjsHanLength

	Result:=True;
end;

//-----------------------------------------------------------------------------
//  印刷処理<PRN>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
    JNTPDlg     :   TFrmJNTPDialog;
begin

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
        	// 0.得意先 OR 1.仕入先
//<130>            if ( uvHani.pvrPattern < 2 ) then
//<2255>            if ( uvHani.pvrPattern < 4 ) then
			if ( uvHani.pvrPattern < 6 ) then	//<2255>ML型はpvrPatternが4,5になるので
            begin
                fnPrnSET ();
                PrtParam.TargetMD  := MemPrint;
		    end;

            with PrtParam do
			begin
				Para		    :=  uvHani;
				TargetQry	    :=  DmqPrint;
				CorpSys		    :=  uvSelSys;
                JNTArea         :=  m_cJNTArea;
                // *** 汎用変数 *** //
                TargetParam	    :=  nil;
	    	    TargetStr	    :=  '';
    		    TargetInt	    :=  0;
                // *** 汎用変数 *** //
			end;

            // 印刷する
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
    else Exit;		//ｴﾗｰ
    end;

end;

// 051115 >>
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】
// -----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnPrnSET();
var
	dqMasterData    :   TMQuery;
    sCode           :   String;
	strExCode		:	String;
	sName			:	String;
	lName			:	String;

	iUseKbn1,iUseKbn2:	Integer;
	iMst1,iMst2		:	Integer;
	iAttr1,iAttr2	:	Integer;
	iDigit1,iDigit2	:	Integer;
    lvFld: TField;
	lvStr			:	String;	//<2255>
	lvInt			:	integer;//<2255>

begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_pMDataModule.SetDBInfoToQuery (dbCorp_Select, dqMasterData);

    if ( MemPrint.Active ) then MemPrint.Close();
    MemPrint.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close;
		SQL.Clear;
        SQL.Add('select SEL.*,                          '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        '   // 与信限度額     (mtokui)
            +   '   ,mt.TStartDate      m_StDate        '   // 適用日（自）   (mtokui)
            +   '   ,mt.TEndDate        m_EnDate        '   // 適用日（至）   (mtokui)
            +   '   ,mt.UpdDateTM       m_UpDate        '   // 最終更新日時   (mtokui)
            +   '   ,mt.SumKbn          m_SumKbn        '   // 実在/合計区分  (mtokui)  <130>
            +   '   ,mt.Fkana           m_Fkana         '   // ﾌﾘｶﾞﾅ          (mtokui)  <130>
            +   '   ,mt.KeisyoKbn       m_KeisyoKbn     '   // 敬称区分       (mtokui)  <130>
            +   '   ,mf.FusenKbn        m_FusenKbn      '   // 付箋区分                 <130>
// <141> ↓
            +   '   ,mt.CountryKbn                      '   // 国内外区分
            +   '   ,mt.CurrencyNCode                   '   // 通貨内部コード
            +   '   ,mc.GCODE           CurrencyCd      '   // 通貨外部コード
//<2255>↓
			+	'	,mt.DHyoNm2							'	//代表者名		  (mtokui)
        	+	'	,mt.PCloseday1						'	//締日1			  (mtokui)
        	+	'	,mt.PCloseday2						'	//締日2			  (mtokui)
        	+	'	,mt.PCloseday3						'	//締日3			  (mtokui)
        	+	'	,mt.RCloseday1						'	//締日1			  (mtokui)
        	+	'	,mt.RCloseday2						'	//締日2			  (mtokui)
        	+	'	,mt.RCloseday3						'	//締日3			  (mtokui)
        	+	'	,mt.PayMonth1						'	//ｻｲｸﾙ1			  (mtokui)
        	+	'	,mt.PayMonth2						'	//ｻｲｸﾙ2			  (mtokui)
        	+	'	,mt.PayMonth3						'	//ｻｲｸﾙ3			  (mtokui)
        	+	'	,mt.RcvMonth1						'	//ｻｲｸﾙ1			  (mtokui)
        	+	'	,mt.RcvMonth2						'	//ｻｲｸﾙ2			  (mtokui)
        	+	'	,mt.RcvMonth3						'	//ｻｲｸﾙ3			  (mtokui)
        	+	'	,mt.PayDay1							'	//回収1			  (mtokui)
        	+	'	,mt.PayDay2							'	//回収2			  (mtokui)
        	+	'	,mt.PayDay3							'	//回収3			  (mtokui)
        	+	'	,mt.RcvDay1							'	//回収1			  (mtokui)
        	+	'	,mt.RcvDay2							'	//回収2			  (mtokui)
        	+	'	,mt.RcvDay3							'	//回収3			  (mtokui)
			+	'	,seikyu.GCode		SeiGCode		'	//請求先外部ｺｰﾄﾞ  (mtokui)
			+	'	,seikyu.NmK			SeiNMK			'	//請求先名		  (mtokui)
			+	'	,hj.gcode							'	//部門外部ｺｰﾄﾞ	  (HojyoMA)
//<2255>↑
            +   '   ,IF (mc.GCODE is null) then '''' else RTRIM(mc.NM) + ''(''+ RTRIM(mc.MnSymbol) + '')'' endif CurrencyNm '   // 通貨名
// <141> ↑
            +   'from MTOKUI mt 		                '
// <130>            +   'from MTOKUI mt, MTOKUI_SEL SEL         '
            +   'left outer join MTOKUI_SEL SEL on (SEL.BaseNCode=mt.NCode) '
			+	'left outer join HojyoMA    hj  on (SEL.BmNCode = hj.Ncode )'	//<2255>出力順所部門順に対応するため。
            +	'left outer join mtokui seikyu  on (sel.seincode=seikyu.ncode) '	//<2255>
            +   'left outer join MFusenInfo mf  on (mt.NCode=mf.NCode) and (mf.MasterKbn=22) '
            +   'left outer join GAIMONEY mc    on (mt.CurrencyNCode = mc.NCode) and (mc.RDELKBN = 0) '
            +   'where (mt.RDelKbn = 0)                 '
// <130>            +   '  and (mt.SumKbn = 0)                  '
            +   '  and (mt.TemplateKbn = 0)             ');
// <130>            +   '  and (mt.NCode = SEL.BaseNCode)       '
//            +   '  and (SEL.RecKbn = :Param)            '

//<2255>        if      ( uvHani.pvrPattern in [0,1] ) then
			if      ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
            SQL.Add('   AND (SEL.RecKbn=1) AND (mt.HojyoKbn1=1) ')
//<2255>        else if ( uvHani.pvrPattern in [2,3] ) then
			else if ( uvHani.pvrPattern in [2,3,5] ) then	//<2255>
            SQL.Add('   AND (SEL.RecKbn=2) AND (mt.HojyoKbn2=1) ');

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
//<2255>↓
		if ( (uvHani.pvrPattern in [4,5]) and (uvHani.pvrRgType[1] = 1 )) then	//ML型で部門ｺｰﾄﾞが範囲の時
		begin
            SQL.Add('  AND  (hj.GCode >= :Bm_ExStCode)     ');
		    SQL.Add('  AND  (hj.GCode <= :Bm_ExEdCode)     ');
            ParamByName('Bm_ExStCode').AsString   :=  uvHani.pvrStCode[1];
   			ParamByName('Bm_ExEdCode').AsString   :=  uvHani.pvrEdCode[1];
		end;
//<2255>↑

        // 出力順序
{↓<2255>出力順序が増えたのでコーディングしなおし。
        if ( uvHani.pvrOrder = 0 ) then
            SQL.Add('ORDER BY mt.GCode         ');
        else    SQL.Add('ORDER BY mt.Renso, mt.GCode  ');
↑<2255>}
//<2255>↓
        if ( uvHani.pvrOrder = 0 ) then
		begin
			// 得意先コード順
            SQL.Add('ORDER BY mt.GCode         ');
		end
		else if ( uvHani.pvrOrder = 1 ) then
		begin
			// 連想順
			SQL.Add('ORDER BY mt.Renso, mt.GCode  ');
		end
		else if ( uvHani.pvrOrder = 2 ) then
		begin
			// 部門コード順
			SQL.Add('ORDER BY hj.Gcode, mt.GCode  ');
		end;
//<2255>↑

		// 得意先 OR 仕入先
// <130>	    ParamByName('Param').AsInteger :=  uvHani.pvrPattern + 1;
(*
        if      ( uvHani.pvrPattern in [0,1] ) then
            ParamByName('Param').AsInteger :=  1
        else if ( uvHani.pvrPattern in [2,3] ) then
            ParamByName('Param').AsInteger :=  2;
*)

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
			MemPrint.Append();

            // <130>付箋Bitmap
            MemPrint.FieldByName('grTag').Assign(fnGetBitmapSelectedTag(GetFld('m_FusenKbn').AsInteger));

			//------------------------------------------------------------------
            // １列目
			//------------------------------------------------------------------
            // ■外部ｺｰﾄﾞ
            // 数値属性
            if ( uvAttr = 0 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( uvAttr = 1 ) then
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := ComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, uvDigit, 2);
			MemPrint.FieldByName('GCode'	).AsString	    :=  sCode;

			// ■得意先区分
			MemPrint.FieldByName('MasKbn'	).AsInteger := GetFld('MasKbn'	).AsInteger;
			if GetFld('MasKbn'	).AsInteger = 1 then
            begin
            	MemPrint.FieldByName('MasKbnNm'	).AsString := '通常';
//<2255>                if ( uvHani.pvrPattern in [0,1] ) then
				if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
                	MemPrint.FieldByName('MasKbnNm'	).AsString :=
                    	MemPrint.FieldByName('MasKbnNm'	).AsString + '得意先'
                else
                	MemPrint.FieldByName('MasKbnNm'	).AsString :=
                    	MemPrint.FieldByName('MasKbnNm'	).AsString + '仕入先';

            end
			else if GetFld('MasKbn'	).AsInteger = 2 then
            begin
// <127>↓
//            	MemPrint.FieldByName('BunCode'	).AsString := '社内';
            	MemPrint.FieldByName('MasKbnNm'	).AsString := '社内';
// <127>↑
//<2255>                if ( uvHani.pvrPattern in [0,1] ) then
				if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
                	MemPrint.FieldByName('MasKbnNm'	).AsString :=
                    	MemPrint.FieldByName('MasKbnNm'	).AsString + '得意先'
                else
                	MemPrint.FieldByName('MasKbnNm'	).AsString :=
                    	MemPrint.FieldByName('MasKbnNm'	).AsString + '仕入先';
			end;

            // ■連想
			MemPrint.FieldByName('Renso'	).AsString	    :=  GetFld('m_Renso'	).AsString;
            // ■簡略名称
			MemPrint.FieldByName('Nmk'	).AsString	    :=  GetFld('m_Nmk'		).AsString;
            // ■正式名称
			MemPrint.FieldByName('Nm'	).AsString	    :=  GetFld('m_Nm'		).AsString;
            // ■郵便番号(基番)
            if ( not GetFld('POSTNO1').IsNull      ) and
               ( GetFld('POSTNO1').AsString <> '0' ) then
               //@　↓12.02 書式変換追加
               MemPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('POSTNO1').AsInteger]);
                //MemPrint.FieldByName('PostNo1').AsString	        :=	GetFld('POSTNO1').AsString;
                //@ ↑
            // ■郵便番号(枝番)
{↓<PST2>
            if ( not GetFld('POSTNO2').IsNull      ) and
               ( GetFld('POSTNO2').AsString <> '0' ) then
                //@　↓12.02 書式変換追加
                MemPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('POSTNO2').AsInteger]);
                //MemPrint.FieldByName('PostNo2').AsString	        :=	GetFld('POSTNO2').AsString;
                //@ ↑
↑<PST2>}
//↓<PST2>
			// 郵便番号(枝番)は000-0000以外は出すことにする。
            // 例：000-0001、001-0000 → 枝番は出力する。
            if  ((GetFld('POSTNO1').IsNull) or (GetFld('POSTNO1').AsString = '0'))
            and ((GetFld('POSTNO2').IsNull) or (GetFld('POSTNO2').AsString = '0')) then
            begin
                MemPrint.FieldByName('PostNo2').AsString	        :=	'';
            end
            else
            begin
                MemPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('POSTNO2').AsInteger]);
            end;
//↑<PST2>
            // ■住所
			MemPrint.FieldByName('Ads1'	).AsString	    :=  GetFld('Ads1'		).AsString;
			MemPrint.FieldByName('Ads2'	).AsString	    :=  GetFld('Ads2'		).AsString;
            // ■送付先部署名
			MemPrint.FieldByName('SectNm').AsString	    :=  GetFld('SectionName'	).AsString;
            // ■担当者名
			MemPrint.FieldByName('TanNm'	).AsString	    :=  GetFld('TanNm'		).AsString;
            // ■適用期間
            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MemPrint.FieldByName('TStartDate').AsString   :=  MjsGetGengou( GetFld('m_StDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MemPrint.FieldByName('TEndDate').AsString		:=	MjsGetGengou( GetFld('m_EnDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // ■更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString :=	MjsGetGengou(GetFld('m_UpDate').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('m_UpDate').AsDateTime);
                //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MemPrint.FieldByName('TStartDate').AsString   :=  FormatDateTime( 'yyyy/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MemPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // ■更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('m_UpDate').AsDateTime);
                //@ ↑
            end;

            // 実在/合計区分<130>
            MemPrint.FieldByName('SumKbn').AsInteger  :=  GetFld('m_SumKbn').AsInteger;
            if ( GetFld('m_SumKbn').AsInteger = 0 ) then
                    MemPrint.FieldByName('SumKbnNm').AsString   :=  '実在'
            else    MemPrint.FieldByName('SumKbnNm').AsString   :=  '合計';

			//------------------------------------------------------------------
            // ２列目
			//------------------------------------------------------------------
            // ■電話番号
			MemPrint.FieldByName('Tel1'	).AsString	    :=  GetFld('Tel1'		).AsString;
			MemPrint.FieldByName('Tel2'	).AsString	    :=  GetFld('Tel2'		).AsString;
            // ■FAX番号
			MemPrint.FieldByName('FAX'	).AsString	    :=  GetFld('FAX1'		).AsString;
            // ■部門コード・名称
            strExCode := fnGetGCODE(GetFld('BmNCode').AsFloat,41);
            if (uvBMAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MemPrint.FieldByName('BmNCd'	).AsString := '';
				MemPrint.FieldByName('BmNm'	).AsString := '';
            end
            else
            begin
	            // 数値属性
            	if ( uvBMAttr = 0 ) then
        	        sCode   := ComArea.SetDspCodeAttr(strExCode, uvBMDigit, 0)
    	        // 数値属性前ｾﾞﾛ有
	            else if ( uvBMAttr = 1 ) then
            	    sCode   := ComArea.SetDspCodeAttr(strExCode, uvBMDigit, 1)
        	    // ﾌﾘｰ属性
    	        else
	                sCode   := ComArea.SetDspCodeAttr(strExCode, uvBMDigit, 2);
				MemPrint.FieldByName('BmNCd'	).AsString := sCode;
				// 名称取得
	            //fnGetNAME(FrmJNTCRP004004F, strExCode,41,uvBMAttr,sName );	// 第１引き数は何でもいい	//<2466>
				fnGetNAME_PrnBmn(GetFld('BmNCode').AsFloat,sName );		//<2466>
				MemPrint.FieldByName('BmNm'	).AsString := sName;
            end;
            // ■担当者コード・名称
            strExCode := fnGetGCODE(GetFld('TnNCode').AsFloat,25);
            if (uvTNAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MemPrint.FieldByName('TnNCd'	).AsString := '';
				MemPrint.FieldByName('TnNm'	).AsString := '';
            end
            else
            begin
	            // 数値属性
            	if ( uvTNAttr = 0 ) then
        	        sCode   := ComArea.SetDspCodeAttr(strExCode, uvTNDigit, 0)
    	        // 数値属性前ｾﾞﾛ有
	            else if ( uvTNAttr = 1 ) then
            	    sCode   := ComArea.SetDspCodeAttr(strExCode, uvTNDigit, 1)
        	    // ﾌﾘｰ属性
    	        else
	                sCode   := ComArea.SetDspCodeAttr(strExCode, uvTNDigit, 2);
				MemPrint.FieldByName('TnNCd'	).AsString := sCode;
				// 名称取得
                // 得意先担当者<108>
//<2255>                if ( uvHani.pvrPattern in [0,1] ) then
				if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
		            fnGetNAME(f1TNCODE, strExCode,25,uvTNAttr,sName )
                // 仕入先担当者
                else
		            fnGetNAME(f1TNCODE_Si, strExCode,25,uvTNAttr,sName );
				MemPrint.FieldByName('TnNm'	).AsString := sName;
            end;
			// ■売上端数区分／仕入端数区分
			MemPrint.FieldByName('UrKinHsuKbn'	).AsInteger
   	         := GetFld('UrKinHsuKbn'	).AsInteger;
       	    gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分',
           		MemPrint.FieldByName('UrKinHsuKbn'	).AsInteger,
                sName);
            MemPrint.FieldByName('UrKinHsuKbnNm').AsString := sName;
			// ■現売税請求区分／現仕税支払区分
			MemPrint.FieldByName('GRuZSeiKbn'	).AsInteger
           	 := GetFld('GRuZSeiKbn'	).AsInteger;
            gfnJNTSELKBNNameGet(Qry, 'ALL', '現税請求区分',
   	        	MemPrint.FieldByName('GRuZSeiKbn'	).AsInteger,
                sName);
   	        MemPrint.FieldByName('GRuZSeiKbnNm'	).AsString := sName;
			// ■消費税請求区分／消費税支払区分
			MemPrint.FieldByName('ZSeiKbn'	).AsInteger
    	     := GetFld('ZSeiKbn'	).AsInteger;
   	    	gfnJNTSELKBNNameGet(Qry, 'ALL', '掛税請求区分',
       			MemPrint.FieldByName('ZSeiKbn'	).AsInteger,
                sName);
           	MemPrint.FieldByName('ZSeiKbnNm'	).AsString := sName;
			// ■消費税端数単位
			MemPrint.FieldByName('ZHsuTniKbn'	).AsInteger
       	     := GetFld('ZHsuTniKbn'	).AsInteger;
           	gfnJNTSELKBNNameGet(Qry, 'ALL', '税端数単位',
	           	MemPrint.FieldByName('ZHsuTniKbn'	).AsInteger,
                sName);
   	        MemPrint.FieldByName('ZHsuTniKbnNm'	).AsString := sName;
			// ■消費税端数区分
			MemPrint.FieldByName('ZHsuKbn'	).AsInteger
             := GetFld('ZHsuKbn'	).AsInteger;
            gfnJNTSELKBNNameGet(Qry, 'ALL', '端数区分',
            	MemPrint.FieldByName('ZHsuKbn'	).AsInteger,
                sName);
            MemPrint.FieldByName('ZHsuKbnNm'	).AsString := sName;

//<141>↓
			//国内外区分
			MemPrint.FieldByName('CountryKbn').AsInteger := GetFld('CountryKbn').AsInteger;
            MemPrint.FieldByName('CountryNm').AsString   := '';
            if (GetFld('CountryKbn').AsInteger <= length(uvCstM_CTR)) and
               (GetFld('CountryKbn').AsInteger > 0) then
                MemPrint.FieldByName('CountryNm').AsString := uvCstM_CTR[GetFld('CountryKbn').AsInteger];
			//通貨区分
    	    MemPrint.FieldByName('CurrencyCd').AsString := GetFld('CurrencyCd').AsString;
            MemPrint.FieldByName('CurrencyNm').AsString := GetFld('CurrencyNm').AsString;
            //項目スタイルにより、値再セット
            lvFld := MemPrint.FieldByName('CurrencyCd');
            uvSelSys.gfnSetAttr(lvFLd);
//<141>↑
//<134>↓
			// ■拡張分類コード・名称
//<2255>			if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
			begin
				iUseKbn1	:= uvKTKBN1UseKbn;
				iUseKbn2	:= uvKTKBN2UseKbn;
				iMst1		:= 811;
				iMst2		:= 812;
				iAttr1		:= uvKTKBN1Attr;
				iAttr2		:= uvKTKBN2Attr;
				iDigit1		:= uvKTKBN1Digit;
				iDigit2		:= uvKTKBN2Digit;
			end
			else
			begin
				iUseKbn1	:= uvKSIBN1UseKbn;
				iUseKbn2	:= uvKSIBN2UseKbn;
				iMst1		:= 821;
				iMst2		:= 822;
				iAttr1		:= uvKSIBN1Attr;
				iAttr2		:= uvKSIBN2Attr;
				iDigit1		:= uvKSIBN1Digit;
				iDigit2		:= uvKSIBN2Digit;
			end;

			if iUseKbn1 <> 0 then
			begin
				strExCode	:= fnGetGCODE(GetFld('HBunNCode1').AsFloat,iMst1);
				sCode		:= ComArea.SetDspCodeAttr(strExCode, iDigit1, iAttr1);
				MemPrint.FieldByName('KKBNCD1').AsString := sCode;
				// 名称取得
				fnGetNAME(FrmJNTCRP004004F, strExCode,iMst1,iAttr1,sName );
				MemPrint.FieldByName('KKBNNM1'	).AsString := sName;
            end;

			if iUseKbn2 <> 0 then
			begin
				strExCode	:= fnGetGCODE(GetFld('HBunNCode2').AsFloat,iMst2);
				sCode		:= ComArea.SetDspCodeAttr(strExCode, iDigit2, iAttr2);
				MemPrint.FieldByName('KKBNCD2').AsString := sCode;
				// 名称取得
				fnGetNAME(FrmJNTCRP004004F, strExCode,iMst2,iAttr2,sName );
				MemPrint.FieldByName('KKBNNM2'	).AsString := sName;
            end;
//<134>↑

			//------------------------------------------------------------------
            // ３列目
			//------------------------------------------------------------------
			// ■取引区分
			MemPrint.FieldByName('TrihikiKbn').AsInteger := GetFld('TrihikiKbn').AsInteger;
//<2255>            if (uvHani.pvrPattern in [0,1] ) then
				if (uvHani.pvrPattern in [0,1,4] ) then		//<2255>
	            gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分', MemPrint.FieldByName('TrihikiKbn').AsInteger, sName)
            else
	            gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '伝票取引区分2', MemPrint.FieldByName('TrihikiKbn').AsInteger, sName);
   	        MemPrint.FieldByName('TrihikiKbnNm'	).AsString := sName;

			// ■名称変更区分
			MemPrint.FieldByName('NmKbn').AsInteger := GetFld('NmKbn').AsInteger;
            //gfnJNTSELKBNNameGet(Qry, 'ALL', '名称変更',	MemPrint.FieldByName('NmKbn').AsInteger, sName);        //<141>
            gfnJNTSELKBNNameGet(Qry, 'ALL', '有無区分６',	MemPrint.FieldByName('NmKbn').AsInteger, sName);
            MemPrint.FieldByName('NmKbnNm').AsString := sName;

			// ■単価ランク
			MemPrint.FieldByName('TnkRnk').AsInteger := GetFld('TnkRnk').AsInteger;

            // ■単価掛率
			MemPrint.FieldByName('KakeRt').AsFloat := GetFld('KakeRt').AsFloat;

            // ■指定商品コード区分
			MemPrint.FieldByName('SShCdKbn').AsInteger := GetFld('SShCdKbn').AsInteger;
            gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '指定商品', MemPrint.FieldByName('SShCdKbn').AsInteger, sName);
            MemPrint.FieldByName('SShCdKbnNm').AsString := sName;

			// ■指定商品コード桁数
			MemPrint.FieldByName('SShCdKet').AsInteger := GetFld('SShCdKet').AsInteger;

            // ■和暦西暦
			MemPrint.FieldByName('YYKbn').AsInteger := GetFld('YYKbn').AsInteger;
            gfnJNTSELKBNNameGet(Qry, 'ALL', '和暦西暦区分', MemPrint.FieldByName('YYKbn').AsInteger, sName);
            MemPrint.FieldByName('YYKbnNm').AsString := sName;

            // ■代表者名
			MemPrint.FieldByName('DaiNmKbn').AsInteger := GetFld('DaiNmKbn').AsInteger;
            gfnJNTSELKBNNameGet(Qry, ucMKBN_TBLNAME, '有無区分２', MemPrint.FieldByName('DaiNmKbn').AsInteger, sName);
            MemPrint.FieldByName('DaiNmKbnNm').AsString := sName;

            // ■納品書フォーム／仕入伝票フォーム
			MemPrint.FieldByName('USDENPFM').AsInteger := GetFld('USDENPFM').AsInteger;
//<2255>            if (uvHani.pvrPattern in [0,1] ) then
			if (uvHani.pvrPattern in [0,1,4] ) then		//<2255>
				gfnJNTSelRptNameGet(Qry, 'ur00', MemPrint.FieldByName('USDENPFM').AsString, lName, sName)
			else
				gfnJNTSelRptNameGet(Qry, 'sr00', MemPrint.FieldByName('USDENPFM').AsString, lName, sName);
            MemPrint.FieldByName('USDENPFMNm').AsString := sName;

            // ■売上合計欄税印字／仕入合計欄税印字
			MemPrint.FieldByName('USGKEI').AsInteger := GetFld('USGKEI'	).AsInteger;
            gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', MemPrint.FieldByName('USGKEI').AsInteger, sName);
            MemPrint.FieldByName('USGKEINm'	).AsString := sName;

            // ■上代合計欄税印字
//<2255>            if (uvHani.pvrPattern in [0,1] ) then
			if (uvHani.pvrPattern in [0,1,4] ) then		//<2255>
			begin
				MemPrint.FieldByName('JYGKEI').AsInteger  := GetFld('JYGKEI').AsInteger;
        	    gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', MemPrint.FieldByName('JYGKEI').AsInteger, sName);
               	MemPrint.FieldByName('JYGKEINm').AsString := sName;
            end;


			//------------------------------------------------------------------
            // ４列目
			//------------------------------------------------------------------
            // ■見積書フォーム
//<2255>            if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
			begin
				MemPrint.FieldByName('MITPFM'	).AsInteger
    	         := GetFld('MITPFM'	).AsInteger;
				gfnJNTSelRptNameGet(Qry, 'mi00',
                	MemPrint.FieldByName('MITPFM'	).AsString,
                    lName,
	                sName);
                MemPrint.FieldByName('MITPFMNm'	).AsString := sName;
            end;
            // ■受注伝票フォーム／発注伝票フォーム
			MemPrint.FieldByName('JHDENPFM'	).AsInteger
             := GetFld('JHDENPFM'	).AsInteger;
//<2255>            if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
				gfnJNTSelRptNameGet(Qry, 'jy00',
                	MemPrint.FieldByName('JHDENPFM'	).AsString,
                    lName,
	                sName)
			else
				gfnJNTSelRptNameGet(Qry, 'ha00',
                	MemPrint.FieldByName('JHDENPFM'	).AsString,
                    lName,
	                sName);
            MemPrint.FieldByName('JHDENPFMNm'	).AsString := sName;
            // ■出荷伝票フォーム／入荷伝票フォーム
			MemPrint.FieldByName('SNDENPFM'	).AsInteger
             := GetFld('SNDENPFM'	).AsInteger;
//<2255>            if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then		//<2255>
				gfnJNTSelRptNameGet(Qry, 'sy00',
                	MemPrint.FieldByName('SNDENPFM'	).AsString,
                    lName,
	                sName)
			else
				gfnJNTSelRptNameGet(Qry, 'ny00',
                	MemPrint.FieldByName('SNDENPFM'	).AsString,
                    lName,
	                sName);
            MemPrint.FieldByName('SNDENPFMNm'	).AsString := sName;

//<KOJ> Ins-s
            // ■工事売上伝票フォーム／工事原価伝票フォーム
			MemPrint.FieldByName('KUSDENPFM').AsInteger := GetFld('KUSDENPFM').AsInteger;
//<2255>            if (uvHani.pvrPattern in [0,1]) then
			if (uvHani.pvrPattern in [0,1,4]) then	//<2255>
				gfnJNTSelRptNameGet(Qry, 'ku00', MemPrint.FieldByName('KUSDENPFM').AsString, lName, sName)
			else
//<KOJ2> Upd-s
//				gfnJNTSelRptNameGet(Qry, 'kg00', MemPrint.FieldByName('KUSDENPFM').AsString, lName, sName);
				gfnJNTSelRptNameGet(Qry, 'gn00', MemPrint.FieldByName('KUSDENPFM').AsString, lName, sName);
//<KOJ2> Upd-e
            MemPrint.FieldByName('KUSDENPFMNm').AsString := sName;

            // ■工事見積書フォーム
//<2255>            if (uvHani.pvrPattern in [0,1]) then
			if (uvHani.pvrPattern in [0,1,4]) then	//<2255>
			begin
				MemPrint.FieldByName('KMITPFM').AsInteger := GetFld('KMITPFM').AsInteger;
				gfnJNTSelRptNameGet(Qry, 'km00', MemPrint.FieldByName('KMITPFM').AsString, lName, sName);
                MemPrint.FieldByName('KMITPFMNm').AsString := sName;
            end;

            // ■工事受注伝票フォーム／工事発注伝票フォーム
			MemPrint.FieldByName('KJHDENPFM').AsInteger := GetFld('KJHDENPFM').AsInteger;
//<2255>            if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
				gfnJNTSelRptNameGet(Qry, 'kj00', MemPrint.FieldByName('KJHDENPFM').AsString, lName, sName)
			else
				gfnJNTSelRptNameGet(Qry, 'kh00', MemPrint.FieldByName('KJHDENPFM').AsString, lName, sName);
            MemPrint.FieldByName('KJHDENPFMNm').AsString := sName;

            // ■工事合計欄税印字
			MemPrint.FieldByName('KUSGKEI').AsInteger := GetFld('KUSGKEI').AsInteger;
            gfnJNTSELKBNNameGet(Qry, 'ALL', '税金額区分', MemPrint.FieldByName('KUSGKEI').AsInteger, sName);
            MemPrint.FieldByName('KUSGKEINm'	).AsString := sName;
//<KOJ> Ins-e

            // ■送り状フォーム
//<2255>            if ( uvHani.pvrPattern in [0,1] ) then
			if ( uvHani.pvrPattern in [0,1,4] ) then	//<2255>
			begin
				MemPrint.FieldByName('SOFOPFM'	).AsInteger
    	         := GetFld('SOFOPFM'	).AsInteger;
				gfnJNTSelRptNameGet(Qry, 'ok00',
                	MemPrint.FieldByName('SOFOPFM'	).AsString,
                    lName,
	                sName);
                MemPrint.FieldByName('SOFOPFMNm'	).AsString := sName;
            end;

			//------------------------------------------------------------------
            // ５列目
			//------------------------------------------------------------------
            // ■コメント
			MemPrint.FieldByName('Memo1'	).AsString
             := GetFld('Memo1'	).AsString;
			MemPrint.FieldByName('Memo2'	).AsString
             := GetFld('Memo2'	).AsString;
//<PASS>Add S
//			MemPrint.FieldByName('LinkageKbn'	).AsString
//             := GetFld('LinkageKbn'	).AsString;
			MemPrint.FieldByName('PassKbn'		).AsInteger
             := GetFld('PassKbn'	).AsInteger;
			gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード区分', MemPrint.FieldByName('PassKbn').AsInteger, sName);
			MemPrint.FieldByName('PassKbnNm'		).AsString := sName;

			MemPrint.FieldByName('PassItemKbn1'		).AsString
			 := GetFld('PassItemKbn1'	).AsString;
			if MemPrint.FieldByName('PassItemKbn1').AsString = '0' then
			begin
            	MemPrint.FieldByName('PassItemKbn1').AsString := '';
				sName := '';
            end
            else
			begin
				gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分1', MemPrint.FieldByName('PassItemKbn1').AsInteger, sName);
            end;
			MemPrint.FieldByName('PassItemKbn1Nm'		).AsString := sName;

			MemPrint.FieldByName('PassItemKbn2'		).AsString
             := GetFld('PassItemKbn2'	).AsString;
			if MemPrint.FieldByName('PassItemKbn2').AsString = '0' then
			begin
            	MemPrint.FieldByName('PassItemKbn2').AsString := '';
				sName := '';
            end
			else
			begin
				gfnJNTSELKBNNameGet(Qry, 'ALL', 'パスワード合成区分2', MemPrint.FieldByName('PassItemKbn2').AsInteger, sName);
            end;
			MemPrint.FieldByName('PassItemKbn2Nm'		).AsString := sName;
//<PASS>Add E
            //------------------------------------------------------------------
            // 簡略型で使用<130>
			//------------------------------------------------------------------
            MemPrint.FieldByName('Fkana')    .AsString  :=  GetFld('m_Fkana')    .AsString;
            MemPrint.FieldByName('KeisyoKbn').AsString  :=  GetFld('m_KeisyoKbn').AsString;

//<132> ↓
            MemPrint.FieldByName('H_MailAddress').AsString  :=  GetFld('MailAddress').AsString;
            MemPrint.FieldByName('H_KeisyoKbn').AsString  	:=  GetFld('KeisyoKbn').AsString;
//<132> ↑
//<2255>↓
			//------------------------------------------------------------------
			// ML型で使用
			//------------------------------------------------------------------
			if ( uvHani.pvrPattern in [4] ) then	//【ML型（得意先）】の時
			begin
				MemPrint.FieldByName('DHyoNm2')	    	.AsString  :=  GetFld('DHyoNm2')   .AsString;		//代表者名

				lvInt	:=  GetFld('UsKinKbn')   .Asinteger;												//請求区分
				Case lvInt	of		//請求区分ごとに表示する名称を変更する。
					1:	MemPrint.FieldByName('UsKinNM').AsString	:=	'親一括請求一括入金';
					2:	MemPrint.FieldByName('UsKinNM').AsString	:=	'各店別請求各店別入金';
				end;

				//締日１が空の場合は随時回収ｻｲﾄと特殊請求NOにデータをセット
				lvStr	:=  GetFld('RCloseday1').AsString;
				if lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('RZuiSSite')    	.AsString  :=  GetFld('RZuiSSite')   .AsString+'日';		//随時回収サイト
					MemPrint.FieldByName('RTSEINO')    		.AsString  :=  GetFld('RTSEINO')   .AsString;				//特殊請求Ｎｏ
                    lvInt   :=  GetFld('RHolidayKbn')   .Asinteger;	//特殊・随時休日区分
                    Case lvInt	of		//休日区分ごとに表示する名称を変更する。
                        0:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'翌営業日';
                        1:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'前営業日';
                        2:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'当日';
                    end;
				end
				//締日１に登録がある場合は随時回収ｻｲﾄと特殊請求NOに空をセット
				else
				begin
					MemPrint.FieldByName('RZuiSSite')    	.AsString  :=  '';		//随時回収サイト
					MemPrint.FieldByName('RHolidayKbnNM')   .AsString  :=  '';		//休日区分名
					MemPrint.FieldByName('RTSEINO')    		.AsString  :=  '';		//特殊請求Ｎｏ
				end;

                //------------------------------------------
                //締日
                //------------------------------------------
				lvStr    	  									   :=  GetFld('RCloseday1')	    .AsString;
                MemPrint.FieldByName('ENDDD1')		.AsString  :=  fnShimeStrGet(lvStr);
				lvStr    	  									   :=  GetFld('RCloseday2')	    .AsString;
                MemPrint.FieldByName('ENDDD2') 		.AsString  :=  fnShimeStrGet(lvStr);
				lvStr    	  									   :=  GetFld('RCloseday3')	    .AsString;
                MemPrint.FieldByName('ENDDD3') 		.AsString  :=  fnShimeStrGet(lvStr);
                //------------------------------------------
                //サイクル	対応する締日が空の時はｻｲｸﾙも空にする。
                //------------------------------------------
				lvStr	:=  GetFld('RCloseday1').AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE1').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('RcvMonth1')   .AsString;
					MemPrint.FieldByName('CYCLE1').AsString  :=  fnCyclesStrGet(lvStr);
				end;

				lvStr	:=  GetFld('RCloseday2').AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE2').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('RcvMonth2')   .AsString;
					MemPrint.FieldByName('CYCLE2').AsString  :=  fnCyclesStrGet(lvStr);
				end;

				lvStr	:=  GetFld('RCloseday3').AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE3').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('RcvMonth3')   .AsString;
					MemPrint.FieldByName('CYCLE3').AsString  :=  fnCyclesStrGet(lvStr);
				end;
                //------------------------------------------
                //回収日	対応する締日が空の時は回収日も空にする。
				//			空でない時は表示用の編集を行う。
                //------------------------------------------
				lvStr	:=  GetFld('RCloseday1').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD1').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('RcvDay1').AsString;
					MemPrint.FieldByName('KAISYUDD1').AsString	:= fnCollectStrGet(lvStr);
				end;

				lvStr	:=  GetFld('RCloseday2').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD2').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('RcvDay2').AsString;
					MemPrint.FieldByName('KAISYUDD2').AsString	:= fnCollectStrGet(lvStr);
				end;

				lvStr	:=  GetFld('RCloseday3').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD3').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('RcvDay3').AsString;
					MemPrint.FieldByName('KAISYUDD3').AsString	:= fnCollectStrGet(lvStr);
				end;

                // ■請求先外部ｺｰﾄﾞ
                // 数値属性
                if ( uvAttr = 0 ) then
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 0);
				end
                // 数値属性前ｾﾞﾛ有
                else if ( uvAttr = 1 ) then
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 1);
				end
                // ﾌﾘｰ属性
                else
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 2);
				end;
                MemPrint.FieldByName('SeiGCode'	).AsString	    :=  sCode;
				MemPrint.FieldByName('SeiNMK')    		.AsString  :=  GetFld('SeiNMK')    		.AsString;
			end;
			if ( uvHani.pvrPattern in [5] ) then	//【ML型（仕入先）】の時
			begin
				MemPrint.FieldByName('DHyoNm2')	    	.AsString  :=  GetFld('DHyoNm2')   .AsString;

				lvInt	:=  GetFld('UsKinKbn')   .Asinteger;												//請求区分
				Case lvInt	of		//請求区分ごとに表示する名称を変更する。
					1:	MemPrint.FieldByName('UsKinNM').AsString	:=	'親一括請求一括支払';
					2:	MemPrint.FieldByName('UsKinNM').AsString	:=	'各店別請求各店別支払';
				end;

				//締日１が空の場合は随時回収ｻｲﾄと特殊請求NOにデータをセット
				lvStr	:=  GetFld('PCloseday1').AsString;
				if lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('RZuiSSite')    	.AsString  :=  GetFld('RZuiSSite')   .AsString+'日';		//随時回収サイト
					MemPrint.FieldByName('RTSEINO')    		.AsString  :=  GetFld('RTSEINO')   .AsString;				//特殊請求Ｎｏ

                    lvInt   :=  GetFld('RHolidayKbn')   .Asinteger;	//特殊・随時休日区分
                    Case lvInt	of		//休日区分ごとに表示する名称を変更する。
                        0:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'翌営業日';
                        1:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'前営業日';
                        2:	MemPrint.FieldByName('RHolidayKbnNM').AsString	:=	'当日';
                    end;
				end
				//締日１に登録がある場合は随時回収ｻｲﾄと特殊請求NOに空をセット
				else
				begin
					MemPrint.FieldByName('RZuiSSite')    	.AsString  :=  '';		//随時回収サイト
					MemPrint.FieldByName('RHolidayKbnNM')   .AsString  :=  '';		//休日区分名
					MemPrint.FieldByName('RTSEINO')    		.AsString  :=  '';		//特殊請求Ｎｏ
				end;
                //------------------------------------------
                //締日
                //------------------------------------------
				lvStr    	  									   :=  GetFld('PCloseday1')	    .AsString;
                MemPrint.FieldByName('ENDDD1')		.AsString  :=  fnShimeStrGet(lvStr);
				lvStr    	  									   :=  GetFld('PCloseday2')	    .AsString;
                MemPrint.FieldByName('ENDDD2') 		.AsString  :=  fnShimeStrGet(lvStr);
				lvStr    	  									   :=  GetFld('PCloseday3')	    .AsString;
                MemPrint.FieldByName('ENDDD3') 		.AsString  :=  fnShimeStrGet(lvStr);
                //------------------------------------------
                //サイクル	対応する締日が空の時はｻｲｸﾙも空にする
                //------------------------------------------
				lvStr	:=  GetFld('PCloseday1')	    .AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE1').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('PayMonth1')   .AsString;
					MemPrint.FieldByName('CYCLE1').AsString  :=  fnCyclesStrGet(lvStr);
				end;

				lvStr	:=  GetFld('PCloseday2')	    .AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE2').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('PayMonth2')   .AsString;
					MemPrint.FieldByName('CYCLE2').AsString  :=  fnCyclesStrGet(lvStr);
				end;

				lvStr	:=  GetFld('PCloseday3')	    .AsString;
				if	lvStr	=	'0'	then
				begin
					MemPrint.FieldByName('CYCLE3').AsString	:=  '';
				end
				else
				begin
					lvStr:=  GetFld('PayMonth3')   .AsString;
					MemPrint.FieldByName('CYCLE3').AsString  :=  fnCyclesStrGet(lvStr);
				end;
                //------------------------------------------
                //回収日	対応する締日が空の時は回収日も空にする。
				//			空でない時は表示用の編集を行う。
                //------------------------------------------
				lvStr	:=  GetFld('PCloseday1').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD1').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('PayDay1').AsString;
					MemPrint.FieldByName('KAISYUDD1').AsString	:= fnCollectStrGet(lvStr);
				end;

				lvStr	:=  GetFld('PCloseday2').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD2').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('PayDay2').AsString;
					MemPrint.FieldByName('KAISYUDD2').AsString	:= fnCollectStrGet(lvStr);
				end;

				lvStr	:=  GetFld('PCloseday3').AsString;
                if lvStr = '0' then
				begin
					MemPrint.FieldByName('KAISYUDD3').AsString	:=  '';
				end
                else
				begin
					lvStr	:=  GetFld('PayDay3').AsString;
					MemPrint.FieldByName('KAISYUDD3').AsString	:= fnCollectStrGet(lvStr);
				end;
                // ■請求先外部ｺｰﾄﾞ
                // 数値属性
                if ( uvAttr = 0 ) then
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 0);
				end
                // 数値属性前ｾﾞﾛ有
                else if ( uvAttr = 1 ) then
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 1);
				end
                // ﾌﾘｰ属性
                else
				begin
                sCode   := ComArea.SetDspCodeAttr(GetFld('SeiGCode').AsString, uvDigit, 2);
				end;
                MemPrint.FieldByName('SeiGCode'	).AsString	    :=  sCode;
				MemPrint.FieldByName('SeiNMK')    		.AsString  :=  GetFld('SeiNMK')    		.AsString;
			end;
//<2255>↑
            MemPrint.Post();
            Next;
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();

end;

//-----------------------------------------------------------------------------
//  選択されたBitmap情報取得<130>
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnGetBitmapSelectedTag (nSelectedTag: Integer): TBitmap;
var
	bmpTag	: TBitmap;
begin
	bmpTag := nil;

	case (nSelectedTag) of
		1: bmpTag := Image_Fusen_Red.Picture.Bitmap;       // 赤
   		2: bmpTag := Image_Fusen_Green.Picture.Bitmap;     // 緑
        3: bmpTag := Image_Fusen_Blue.Picture.Bitmap;      // 青
		4: bmpTag := Image_Fusen_Orange.Picture.Bitmap;    // 橙
	end;
	Result := bmpTag;
end;

// 051115 <<

//-----------------------------------------------------------------------------
//  対象レコードを確定する
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnRecUpd_FX(pRecKbn : Integer): Boolean;
var
//    Ret		: TDbRetCode;
    iZip1  	: Integer;  	                                // 郵便番号1
	iZip2   : Integer;  	                                // 郵便番号2
    lvSQL   : String;
    Qe      : TMQuery;
    InsFlg  : Boolean;

begin
    Result := True;

    // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
    if fnFldChk(Self, True) = False then
    begin
        Result := False;
        Exit;
    end;

	Qe	:= TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

//↓<Rel>
    // -------------------------------------------------------------------------
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        Qe.Close();

        // 親会社DBとMQueryの接続
        m_pMDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe );
    end;
//↑<Rel>
	// -----<MHIS> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<MHIS> Add-Ed-----

    //=======================================================
    // 対象ﾚｺｰﾄﾞを確定する
    //=======================================================
    with Qe do
    begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from MTOKUI_SEL ');
        SQL.Add('Where  BaseNCode = :CODE ');
        SQL.Add('And    RecKbn    = :KBN  ');
        ParamByName('CODE').AsFloat   := uvNCODE;
        ParamByName('KBN' ).AsInteger := pRecKbn;

        if Not Open then
        begin
			Result := FALSE;
            Qe.Free;
            Exit;
        end;

        if Not Eof then
            InsFlg := False
        else
            InsFLg := True;

        Close;
        SQL.Clear;

        // 更新時
        if not InsFLg then
        begin
            lvSQL   :=      'update MTOKUI_SEL set              '
                        // ---------------------------------------
                        //  基本情報
                        // ---------------------------------------
                        +   '    PostNo1     =   :hPostNo1      '
                        +   '   ,PostNo2     =   :hPostNo2      '
                        +   '   ,Ads1        =   :hAds1         '
                        +   '   ,Ads2        =   :hAds2         '
                        +   '   ,Tel1        =   :hTel1         '
                        +   '   ,Tel2        =   :hTel2         '
                        +   '   ,Fax1        =   :hFax1         '
                        +   '   ,SectionName =   :hSectionName  '
                        +   '   ,TanNM       =   :hTanNM        '
                        +   '   ,KeisyoKbn   =   :hKeisyoKbn    '
                        +   '   ,MailAddress =   :hMailAddress  '
                        +   '   ,TnNCode     =   :hTnNCode      '   // 担当者ｺｰﾄﾞ
                        +   '   ,BmNCode     =   :hBmNCode      '   // 部門ｺｰﾄﾞ
                        // ---------------------------------------
                        //  得意先入力・集計情報
                        // ---------------------------------------
                        +   '   ,UrKinHsuKbn =  :hUrKinHsuKbn   '   // 売上端数区分
                        +   '   ,GRuZSeiKbn  =  :hGRuZSeiKbn    '   // 現売税請求区分
                        +   '   ,ZSeiKbn     =  :hZSeiKbn       '   // 消費税請求区分
                        +   '   ,ZHsuTniKbn  =  :hZHsuTniKbn    '   // 消費税端数単位
                        +   '   ,ZHsuKbn     =  :hZHsuKbn       '   // 消費税端数処理
                        +   '   ,TrihikiKbn  =  :hTrihikiKbn    '
                        +   '   ,NmKbn       =  :hNmKbn         '
                        +   '   ,TnkRnk      =  :hTnkRnk        '
                        +   '   ,KakeRt      =  :hKakeRt        '
                        +   '   ,SShCdKbn    =  :hSShCdKbn      '
                        +   '   ,SShCdKet    =  :hSShCdKet      '
//<134>
                        +   '   ,HBunNCode1  =  :hHBunNCode1    '
                        +   '   ,HBunNCode2  =  :hHBunNCode2    '
                        // ---------------------------------------
                        //  得意先印刷情報
                        // ---------------------------------------
                        +   '   ,YYKbn       =  :hYYKbn         '
                        +   '   ,DaiNmKbn    =  :hDaiNmKbn      '
                        +   '   ,USDenPfm    =  :hUSDenPfm      '
                        +   '   ,MitPfm      =  :hMitPfm        '
                        +   '   ,JHDenPfm    =  :hJHDenPfm      '
                        +   '   ,SNDenPfm    =  :hSNDenPfm      '
                        +   '   ,USGKei      =  :hUSGKei        '
                        +   '   ,JyGKei      =  :hJyGKei        '
//<KOJ> Ins-s
                        +   '   ,KUSDenPfm   =  :hKUSDenPfm     '   // 工事売上伝票ﾌｫｰﾑ(工事原価)
                        +   '   ,KMitPfm     =  :hKMitPfm       '   // 工事見積書ﾌｫｰﾑ
                        +   '   ,KJHDenPfm   =  :hKJHDenPfm     '   // 工事受注伝票ﾌｫｰﾑ(工事発注)
                        +   '   ,KUSGKei     =  :hKUSGKei       '   // 工事合計欄税印字
//<KOJ> Ins-e
                        +   '   ,SofoPfm     =  :hSofoPfm       '
                        +   '   ,Memo1       =  :hMemo1         '
                        +   '   ,Memo2       =  :hMemo2         '
//<PASS>Add S
                        +   '   ,LinkageKbn     =  :hLinkageKbn     '
                        +   '   ,PassKbn        =  :hPassKbn        '
                        +   '   ,PassItemKbn1   =  :hPassItemKbn1   '
                        +   '   ,PassItemKbn2   =  :hPassItemKbn2   '
                        +   '   ,ManualPassword =  :hManualPassword '
//<PASS>Add E
                        // ---------------------------------------
                        //  Where条件
                        // ---------------------------------------
                        +   'where (BaseNCode = :hNCODE)        '
                        +   'and   (RecKbn    = :hRecKbn)       ';

        end
//↓<138>
		else
		begin
            lvSQL   :=      'insert into MTOKUI_SEL (           '
                        // ---------------------------------------
                        //  基本情報
                        // ---------------------------------------
                        +   '    PostNo1     '
                        +   '   ,PostNo2     '
                        +   '   ,Ads1        '
                        +   '   ,Ads2        '
                        +   '   ,Tel1        '
                        +   '   ,Tel2        '
                        +   '   ,Fax1        '
                        +   '   ,SectionName '
                        +   '   ,TanNM       '
                        +   '   ,KeisyoKbn   '
                        +   '   ,MailAddress '
                        +   '   ,TnNCode     '   // 担当者ｺｰﾄﾞ
                        +   '   ,BmNCode     '   // 部門ｺｰﾄﾞ
                        // ---------------------------------------
                        //  得意先入力・集計情報
                        // ---------------------------------------
                        +   '   ,UrKinHsuKbn '   // 売上端数区分
                        +   '   ,GRuZSeiKbn  '   // 現売税請求区分
                        +   '   ,ZSeiKbn     '   // 消費税請求区分
                        +   '   ,ZHsuTniKbn  '   // 消費税端数単位
                        +   '   ,ZHsuKbn     '   // 消費税端数処理
                        +   '   ,TrihikiKbn  '
                        +   '   ,NmKbn       '
                        +   '   ,TnkRnk      '
                        +   '   ,KakeRt      '
                        +   '   ,SShCdKbn    '
                        +   '   ,SShCdKet    '
                        +   '   ,HBunNCode1  '
                        +   '   ,HBunNCode2  '
                        // ---------------------------------------
                        //  得意先印刷情報
                        // ---------------------------------------
                        +   '   ,YYKbn       '
                        +   '   ,DaiNmKbn    '
                        +   '   ,USDenPfm    '
                        +   '   ,MitPfm      '
                        +   '   ,JHDenPfm    '
                        +   '   ,SNDenPfm    '
                        +   '   ,USGKei      '
                        +   '   ,JyGKei      '
                        +   '   ,SofoPfm     '
//<KOJ> Ins-s
                        +   '   ,KUSDenPfm   '   // 工事売上伝票ﾌｫｰﾑ(工事原価)
                        +   '   ,KMitPfm     '   // 工事見積書ﾌｫｰﾑ
                        +   '   ,KJHDenPfm   '   // 工事受注伝票ﾌｫｰﾑ(工事発注)
                        +   '   ,KUSGKei     '   // 工事合計欄税印字
//<KOJ> Ins-e
                        +   '   ,Memo1       '
                        +   '   ,Memo2       '
//<PASS>Add S
                        +   '   ,LinkageKbn      '
                        +   '   ,PassKbn         '
                        +   '   ,PassItemKbn1    '
                        +   '   ,PassItemKbn2    '
                        +   '   ,ManualPassword  '
//<PASS>Add E
                        // ---------------------------------------
                        //  ｷｰ情報
                        // ---------------------------------------
                        +   '   ,BaseNCode   '
                        +   '   ,RecKbn      '
                        +   '   ) values (   '
                        // ---------------------------------------
                        //  基本情報
                        // ---------------------------------------
                        +   '    :hPostNo1      '
                        +   '   ,:hPostNo2      '
                        +   '   ,:hAds1         '
                        +   '   ,:hAds2         '
                        +   '   ,:hTel1         '
                        +   '   ,:hTel2         '
                        +   '   ,:hFax1         '
                        +   '   ,:hSectionName  '
                        +   '   ,:hTanNM        '
                        +   '   ,:hKeisyoKbn    '
                        +   '   ,:hMailAddress  '
                        +   '   ,:hTnNCode      '   // 担当者ｺｰﾄﾞ
                        +   '   ,:hBmNCode      '   // 部門ｺｰﾄﾞ
                        // ---------------------------------------
                        //  得意先入力・集計情報
                        // ---------------------------------------
                        +   '   ,:hUrKinHsuKbn   '   // 売上端数区分
                        +   '   ,:hGRuZSeiKbn    '   // 現売税請求区分
                        +   '   ,:hZSeiKbn       '   // 消費税請求区分
                        +   '   ,:hZHsuTniKbn    '   // 消費税端数単位
                        +   '   ,:hZHsuKbn       '   // 消費税端数処理
                        +   '   ,:hTrihikiKbn    '
                        +   '   ,:hNmKbn         '
                        +   '   ,:hTnkRnk        '
                        +   '   ,:hKakeRt        '
                        +   '   ,:hSShCdKbn      '
                        +   '   ,:hSShCdKet      '
                        +   '   ,:hHBunNCode1    '
                        +   '   ,:hHBunNCode2    '
                        // ---------------------------------------
                        //  得意先印刷情報
                        // ---------------------------------------
                        +   '   ,:hYYKbn         '
                        +   '   ,:hDaiNmKbn      '
                        +   '   ,:hUSDenPfm      '
                        +   '   ,:hMitPfm        '
                        +   '   ,:hJHDenPfm      '
                        +   '   ,:hSNDenPfm      '
                        +   '   ,:hUSGKei        '
                        +   '   ,:hJyGKei        '
                        +   '   ,:hSofoPfm       '
//<KOJ> Ins-s
                        +   '   ,:hKUSDenPfm     '   // 工事売上伝票ﾌｫｰﾑ(工事原価)
                        +   '   ,:hKMitPfm       '   // 工事見積書ﾌｫｰﾑ
                        +   '   ,:hKJHDenPfm     '   // 工事受注伝票ﾌｫｰﾑ(工事発注)
                        +   '   ,:hKUSGKei       '   // 工事合計欄税印字
//<KOJ> Ins-e
                        +   '   ,:hMemo1         '
                        +   '   ,:hMemo2         '
//<PASS>Add S
                        +   '   ,:hLinkageKbn      '
                        +   '   ,:hPassKbn         '
                        +   '   ,:hPassItemKbn1    '
                        +   '   ,:hPassItemKbn2    '
                        +   '   ,:hManualPassword  '
//<PASS>Add E
                        // ---------------------------------------
                        //  ｷｰ情報
                        // ---------------------------------------
                        +   '   ,:hNCODE         '
                        +   '   ,:hRecKbn        '
                        +   '   ) ';
		end;
//↑<138>

        SQL.Add(lvSQL);

        //============================================================
        //Primaryページ
        //============================================================
        SetFld('hNCODE')        .AsFloat    := uvNCODE;
        SetFld('hRecKbn')       .AsInteger  := pRecKbn;

        //============================================================
        //基本情報ページ
        //============================================================
        if pRecKbn = 1 then
        begin
		    iZip1 := Trunc(f1POSTNO1.Value);
		    iZip2 := Trunc(f1POSTNO2.Value);

    		SetFld('hPostNo1')    .AsString  := MjsEditNum(iZip1, '0000', 3);   // 〒・前
	    	SetFld('hPostNo2')    .AsString  := MjsEditNum(iZip2, '0000', 4);   // 〒・後
            SetFld('hAds1')       .AsString  := f1ADS1       .Text;             // 住所・上
            SetFld('hAds2')       .AsString  := f1ADS2       .Text;             // 住所・下
            SetFld('hTel1')       .AsString  := f1TEL1       .Text;             // TEL1
            SetFld('hTel2')       .AsString  := f1TEL2       .Text;             // TEL2
            SetFld('hFax1')       .AsString  := f1FAX1       .Text;             // FAX
            SetFld('hSectionName').AsString  := f1SectionName.Text;             // 送付部署名
            SetFld('hTanNM')      .AsString  := f1TANNM      .Text;             // 担当者名
            SetFld('hKeisyoKbn')  .AsString  := f1KeisyoKbn  .Text;             // 敬称区分
            SetFld('hMailAddress').AsString  := f1MailAd.Text;                  // ﾒｰﾙｱﾄﾞﾚｽ
            // 担当者ｺｰﾄﾞ
            SetFld('hTnNCode')    .AsFloat   := fnGetNCODE(f1TNCODE.text,25,uvTNAttr);
            // 部門ｺｰﾄﾞ
            SetFld('hBmNCode')    .AsFloat   := fnGetNCODE(f1BMCODE.text,41,uvBmAttr);
//<134>
            SetFld('hHBunNCode1') .AsFloat   := fnGetNCODE(f1KKTKBRCD1.text,811,uvKTKBN1Attr);
            SetFld('hHBunNCode2') .AsFloat   := fnGetNCODE(f1KKTKBRCD2.text,812,uvKTKBN2Attr);
        end;

        if pRecKbn = 2 then
        begin
            SetFld('hNCODE')      .AsFloat   := uvNCODE;
            SetFld('hRecKbn')     .AsInteger := pRecKbn;

		    iZip1 := Trunc(f1POSTNO1_Si.Value);
		    iZip2 := Trunc(f1POSTNO2_Si.Value);

    		SetFld('hPostNo1')    .AsString  := MjsEditNum(iZip1, '0000', 3);   // 〒・前
	    	SetFld('hPostNo2')    .AsString  := MjsEditNum(iZip2, '0000', 4);   // 〒・後
            SetFld('hAds1')       .AsString  := f1ADS1_Si       .Text;          // 住所・上
            SetFld('hAds2')       .AsString  := f1ADS2_Si       .Text;          // 住所・下
            SetFld('hTel1')       .AsString  := f1TEL1_Si       .Text;          // TEL1
            SetFld('hTel2')       .AsString  := f1TEL2_Si       .Text;          // TEL2
            SetFld('hFax1')       .AsString  := f1FAX1_Si       .Text;          // FAX
            SetFld('hSectionName').AsString  := f1SectionName_Si.Text;          // 送付部署名
            SetFld('hTanNM')      .AsString  := f1TANNM_Si      .Text;          // 担当者名
            SetFld('hKeisyoKbn')  .AsString  := f1KeisyoKbn_Si  .Text;          // 敬称区分
            SetFld('hMailAddress').AsString  := f1MailAd_Si.Text;               // ﾒｰﾙｱﾄﾞﾚｽ
            // 担当者ｺｰﾄﾞ
            SetFld('hTnNCode')    .AsFloat   := fnGetNCODE(f1TNCODE_Si.text,25,uvTNAttr);
            // 部門ｺｰﾄﾞ
            //SetFld('hBmNCode')    .AsFloat   := fnGetNCODE(f1BMCODE_Si.text,41,uvBmAttr);	//<2466>
            SetFld('hBmNCode')    .AsFloat   := fnGetNCODE_Si(f1BMCODE_Si.text,41,uvBmAttr);	//<2466>
//<134>
            SetFld('hHBunNCode1') .AsFloat   := fnGetNCODE(f1KKSIBRCD1.text,821,uvKSIBN1Attr);
            SetFld('hHBunNCode2') .AsFloat   := fnGetNCODE(f1KKSIBRCD2.text,822,uvKSIBN2Attr);
        end;

        //============================================================
        //入力集計情報
        //============================================================
        if pRecKbn = 1 then
        begin
            //←
            SetFld('hUrKinHsuKbn').AsInteger := f1URKINHSUKBN.AsInteger;     //売上端数区分
            SetFld('hGRuZSeiKbn') .AsInteger := f1GRUZSEIKBN .AsInteger;     //現金税請求区分
            SetFld('hZSeiKbn')    .AsInteger := f1ZSEIKBN    .AsInteger;     //消費税請求区分
            SetFld('hZHsuKbn')    .AsInteger := f1ZHSUKBN    .AsInteger;     //消費税端数単位区分
            SetFld('hZHsuTniKbn') .AsInteger := f1ZHSUTNIKBN .AsInteger;     //消費税端数区分
            //→
            SetFld('hTrihikiKbn') .AsInteger := f1TRIHIKIKBN .AsInteger;     //取引区分
            SetFld('hNmKbn')      .AsInteger := f1NMKBN      .AsInteger;     //名称変更区分
            SetFld('hTnkRnk')     .AsInteger := f1TNKRNK     .AsInteger;     //単価ﾗﾝｸ
            SetFld('hKakeRt')     .AsFloat   := f1KAKERT     .AsDouble;      //単価掛け率
            SetFld('hSShCdKbn')   .AsInteger := f1SSHCDKBN   .AsInteger;     //指定商品ｺｰﾄﾞ区分
            SetFld('hSShCdKet')   .AsInteger := f1SSHCDKET   .AsInteger;     //指令商品指定区分
        end;

        if pRecKbn = 2 then
        begin
            //←
            SetFld('hUrKinHsuKbn').AsInteger := f1URKINHSUKBN_Si.AsInteger;     //売上端数区分
            SetFld('hGRuZSeiKbn') .AsInteger := f1GRUZSEIKBN_Si .AsInteger;     //現金税請求区分
            SetFld('hZSeiKbn')    .AsInteger := f1ZSEIKBN_Si    .AsInteger;     //消費税請求区分
            SetFld('hZHsuKbn')    .AsInteger := f1ZHSUKBN_Si    .AsInteger;     //消費税端数単位区分
            SetFld('hZHsuTniKbn') .AsInteger := f1ZHSUTNIKBN_Si .AsInteger;     //消費税端数区分
            //→
            SetFld('hTrihikiKbn') .AsInteger := f1TRIHIKIKBN_Si .AsInteger;     //取引区分
            SetFld('hNmKbn')      .AsInteger := f1NMKBN_Si      .AsInteger;     //名称変更区分
            SetFld('hTnkRnk')     .AsInteger := f1TNKRNK_Si     .AsInteger;     //単価ﾗﾝｸ
            SetFld('hKakeRt')     .AsFloat   := f1KAKERT_Si     .AsDouble;      //単価掛け率
            SetFld('hSShCdKbn')   .AsInteger := f1SSHCDKBN_Si   .AsInteger;     //指定商品ｺｰﾄﾞ区分
            SetFld('hSShCdKet')   .AsInteger := f1SSHCDKET_Si   .AsInteger;     //指令商品指定区分
        end;

        //============================================================
        //印刷情報
        //============================================================
        if pRecKbn = 1 then
        begin
            //宛名欄
            SetFld('hYYKbn')     .AsInteger  := f1YYKBN   .AsInteger;           // 和暦西暦区分
            SetFld('hDaiNmKbn')  .AsInteger  := f1DAINMKBN.AsInteger;           // 代表社名の印字

            //伝票
            SetFld('hUSDenPfm')  .AsInteger  := f1USDENPFM.AsInteger;           // 納品書ﾌｫｰﾑ
            SetFld('hUSGKei')    .AsInteger  := f1USGKEI  .AsInteger;           // 売上合計欄税印字
            SetFld('hJyGKei')    .AsInteger  := f1JYGKEI  .AsInteger;           // 上代合計欄税印字
            SetFld('hMitPfm')    .AsInteger  := f1MITPFM  .AsInteger;           // 見積書ﾌｫｰﾑ
            SetFld('hJHDenPfm')  .AsInteger  := f1JHDENPFM.AsInteger;           // 受注伝票ﾌｫｰﾑ
            SetFld('hSNDenPfm')  .AsInteger  := f1SNDENPFM.AsInteger;           // 出荷伝票ﾌｫｰﾑ

//<KOJ> Ins-s
            //工事伝票
            SetFld('hKUSDenPfm') .AsInteger  := f1KUSDENPFM_Tk.AsInteger;       // 納品書ﾌｫｰﾑ
            SetFld('hKUSGKei')   .AsInteger  := f1KUSGKEI_Tk  .AsInteger;       // 売上合計欄税印字
            SetFld('hKMitPfm')   .AsInteger  := f1KMITPFM_Tk  .AsInteger;       // 見積書ﾌｫｰﾑ
            SetFld('hKJHDenPfm') .AsInteger  := f1KJHDENPFM_Tk.AsInteger;       // 受注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

            //送り状
            SetFld('hSofoPfm')   .AsString   := f1SOFOPFM .Text;                // 送り状ﾌｫｰﾑ
        end;

        if pRecKbn = 2 then
        begin
            //宛名欄
            SetFld('hYYKbn')     .AsInteger  := f1YYKBN_Si   .AsInteger;        // 和暦西暦区分
            SetFld('hDaiNmKbn')  .AsInteger  := f1DAINMKBN_Si.AsInteger;        // 代表社名の印字

            //伝票
            SetFld('hUSDenPfm')  .AsInteger  := f1USDENPFM_Si.AsInteger;        // 仕入伝票ﾌｫｰﾑ
            SetFld('hUSGKei')    .AsInteger  := f1USGKEI_Si  .AsInteger;        // 仕入合計欄税印字
            SetFld('hJyGKei')    .AsInteger  := 0;
            SetFld('hMitPfm')    .AsInteger  := 0;
            SetFld('hJHDenPfm')  .AsInteger  := f1JHDENPFM_Si.AsInteger;        // 発注伝票ﾌｫｰﾑ
            SetFld('hSNDenPfm')  .AsInteger  := f1SNDENPFM_Si.AsInteger;        // 入荷伝票ﾌｫｰﾑ

//<KOJ> Ins-s
            //工事伝票
            SetFld('hKUSDenPfm') .AsInteger  := f1KUSDENPFM_Si.AsInteger;       // 工事原価伝票ﾌｫｰﾑ
            SetFld('hKUSGKei')   .AsInteger  := f1KUSGKEI_Si  .AsInteger;       // 売上合計欄税印字
            SetFld('hKMitPfm')   .AsInteger  := 0;
            SetFld('hKJHDenPfm') .AsInteger  := f1KJHDENPFM_Si.AsInteger;       // 工事発注伝票ﾌｫｰﾑ
//<KOJ> Ins-e

            //送り状
            SetFld('hSofoPfm')   .AsString   := '';
        end;


        //============================================================
        //その他
        //============================================================
        if pRecKbn = 1 then
        begin
            SetFld('hMemo1').AsString     := f1Memo1    .Text;        //コメント1
            SetFld('hMemo2').AsString     := f1Memo2    .Text;        //コメント2
//<PASS>Add S
            SetFld('hLinkageKbn')		.AsInteger:= f1APIKBN		.AsInteger;	//外部連携区分
            SetFld('hPassKbn')			.AsInteger:= f1PASSKBN		.AsInteger;	//パスワード区分
            SetFld('hPassItemKbn1')		.AsInteger:= f1PASSITEMKBN1	.AsInteger;	//パスワード合成項目１
            SetFld('hPassItemKbn2')		.AsInteger:= f1PASSITEMKBN2	.AsInteger;	//パスワード合成項目２
            SetFld('hManualPassword')	.AsString := f1PASSWORD		.text;		//パスワード（直接入力）
//<PASS>Add E
        end
        else
        begin
            SetFld('hMemo1').AsString     := f1Memo1_Si .Text;        //コメント1
            SetFld('hMemo2').AsString     := f1Memo2_Si .Text;        //コメント2
//<PASS>Add S
            SetFld('hLinkageKbn')		.AsInteger:= f1APIKBN_Si 		.AsInteger;	//外部連携区分
            SetFld('hPassKbn')			.AsInteger:= f1PASSKBN_Si		.AsInteger;	//パスワード区分
            SetFld('hPassItemKbn1')		.AsInteger:= f1PASSITEMKBN1_Si	.AsInteger;	//パスワード合成項目１
            SetFld('hPassItemKbn2')		.AsInteger:= f1PASSITEMKBN2_Si	.AsInteger;	//パスワード合成項目２
            SetFld('hManualPassword')	.AsString := f1PASSWORD_Si		.text;		//パスワード（直接入力）
//<PASS>Add E
        end;
        ExecSQL;
    end;

//↓<Rel>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) then
        begin
            Result := false;
            Exit;
        end;

        // 更新されたときはSecHojyoDispInfoのメンテを行う。
        if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,uvNCode,Qe) then
        begin
            Result := false;
            Exit;
        end;
    end;
//↑<Rel>

	// -----<MHIS> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<MHIS> Add-Ed-----

    Qe.Free;

end;
//-----------------------------------------------------------------------------
//  PostExpLorer    (仕入先)
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.f1POSTNO2_SiArrowClick(Sender: TObject);
begin
    //エクスプローラ表示 <05>
    fnCallPostExplorer('郵便1',f1POSTNO1_Si,f1POSTNO2_Si,f1ADS1_Si,f1ADS2_Si);
end;
//-----------------------------------------------------------------------------
//  PostExpLorer    (仕入先)
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.f1ADS1_SiArrowClick(Sender: TObject);
begin
    fnCallPostExplorer('住所',f1POSTNO1_Si,f1POSTNO2_Si,f1ADS1_SI,f1ADS2_Si);
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
function TFrmJNTCRP004004F.fnGetDspData(sCode: String): String;
var
    lvPara: Double;
    lvStr:  String;
//    iType,      // コード属性（1:ﾌﾘｰ、2:数値[前ゼロあり])
//    iLen        // コード桁数
//    :   Integer;
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
//*****************************************************************************
//*		Proccess		:	WMOnPaint関数
//*		Name			:	S.Ogawa
//*****************************************************************************
procedure TFrmJNTCRP004004F.WMOnPaint(var Msg: TMessage);
begin
    // 初期のみ一回の処理
	if m_bFirstFlag = False then
	begin
		if (ACControl = f0CODE) then
    	begin
            f0CODE.SetFocus;
			m_bFirstFlag := True;
	    end;
    end;
end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Name		:	N.Nabe
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************

procedure TFrmJNTCRP004004F.CODEArrowClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;
//    i           : Integer;
//<133>
//<KOJ> Ins-s
//	bHanbai, bSiire, bSaimu, bSaiken : Boolean;
	bHanbai, bSiire, bSaimu, bSaiken, bKoj : Boolean;
//<KOJ> Ins-e
begin

    CompName    :=  TComponent(Sender).name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec :=  m_pMjsAppRec;                  // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     :=  @dbCorp_Select;                // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     :=  ComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     :=  ComArea.SystemArea.SysColorD;

    // 取引先
    if Sender = f0CODE then
    begin
        lvExpSend.MasterKbn     := 22;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
{
        lvExpSend.WhereStr      := ' MTOKUI.RDelKBN = 0'
                                 + ' and MTOKUI.TemplateKbn = 0'  // <105>
                                 + ' and (HojyoKbn1 = 1 or HojyoKbn2 = 1)'; // <126>得意先か仕入先採用
//        lvExpSend.SumKbn        := 0;                       // <126>実在のみ→<128>削除(実在/合計)
}

//<133>↓
		bHanbai	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_HAN);
		bSiire	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_SHI);
		bSaimu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SMU);
		bSaiken	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SKN);
//<KOJ> Ins-s
        // 建設工事業ﾗｲｾﾝｽ採用ﾁｪｯｸ
        bKoj    := fnKojUse;
//<KOJ> Ins-e

//<KOJ> Upd-s
//		if (not bHanbai) and (not bSaiken) then
		if (not bHanbai) and (not bSaiken) and (not bKoj) then
//<KOJ> Upd-e
		begin
            // 販売管理、債権管理、工事ﾗｲｾﾝｽの採用が無い場合
			lvExpSend.WhereStr		:= ' MTOKUI.RDelKBN = 0'
									+  ' and MTOKUI.TemplateKbn = 0'  // <105>
									+  ' and (HojyoKbn2 = 1)'; // 仕入先採用
		end
//<KOJ> Upd-s
//		else if (not bSiire) and (not bSaimu) then
		else if (not bSiire) and (not bSaimu) and (not bKoj) then
//<KOJ> Upd-e
		begin
            // 仕入管理、債務管理、工事ﾗｲｾﾝｽの採用が無い場合
			lvExpSend.WhereStr		:= ' MTOKUI.RDelKBN = 0'
									+  ' and MTOKUI.TemplateKbn = 0'  // <105>
									+  ' and (HojyoKbn1 = 1)'; // 得意先採用
		end
		else
		begin
			lvExpSend.WhereStr		:= ' MTOKUI.RDelKBN = 0'
									+  ' and MTOKUI.TemplateKbn = 0'  // <105>
									+  ' and (HojyoKbn1 = 1 or HojyoKbn2 = 1)'; // <126>得意先か仕入先採用
		end;
//<133>↑

    end
    // 部門
    else if (Sender = f1BMCODE) or (Sender = f1BMCODE_Si) then
    begin
        lvExpSend.MasterKbn     := 41;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'HojyoMA.SumKbn = 0 and HojyoMA.RDelKBN = 0';
    end
    // 担当者
    else if (Sender = f1TNCODE) or (Sender = f1TNCODE_Si) then
    begin
        lvExpSend.MasterKbn     := 25;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
// <131>        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO

        // 得意先担当者<108>
        if ( Sender = f1TNCODE ) then
// <131>                lvExpSend.WhereStr  :=  ' (kbn in (1,3)) '
                lvExpSend.PatternNo     := 3   // <131>
        // 仕入先担当者
// <131>        else    lvExpSend.WhereStr  :=  ' (kbn in (2,3)) ';
        else    lvExpSend.PatternNo     := 2;   // <131>

    end
    // 納品書ﾌｫｰﾑ
    else if Sender = f1USDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ur00''';
    end
    // 見積書ﾌｫｰﾑ
    else if Sender = f1MITPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''mi00''';
    end
    // 受注伝票ﾌｫｰﾑ
    else if Sender = f1JHDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''jy00''';
    end
    // 出荷伝票ﾌｫｰﾑ
    else if Sender = f1SNDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''sy00''';
    end
    // 送り状ﾌｫｰﾑ
    else if Sender = f1SOFOPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ok00''';
    end
    // 仕入伝票ﾌｫｰﾑ
    else if Sender = f1USDENPFM_Si then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''sr00''';
    end
    // 発注伝票ﾌｫｰﾑ
    else if Sender = f1JHDENPFM_Si then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ha00''';
    end
    // 入荷伝票ﾌｫｰﾑ
    else if Sender = f1SNDENPFM_Si then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ny00''';
    end

//<KOJ> Ins-s
    // 工事売上伝票ﾌｫｰﾑ
    else if Sender = f1KUSDENPFM_Tk then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ku00''';
    end
    // 工事見積書ﾌｫｰﾑ
    else if Sender = f1KMITPFM_Tk then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''km00''';
    end
    // 工事受注伝票ﾌｫｰﾑ
    else if Sender = f1KJHDENPFM_Tk then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''kj00''';
    end
    // 工事原価伝票ﾌｫｰﾑ
    else if Sender = f1KUSDENPFM_Si then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
//<KOJ2> Upd-s
//        lvExpSend.WhereStr      := 'PrgId = ''kg00''';
        lvExpSend.WhereStr      := 'PrgId = ''gn00''';
//<KOJ2> Upd-e
    end
    // 工事発注伝票ﾌｫｰﾑ
    else if Sender = f1KJHDENPFM_Si then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''kh00''';
    end
//<KOJ> Ins-e

//<134>↓
	// 得意先拡張分類１
    else if Sender = f1KKTKBRCD1 then
    begin
        lvExpSend.MasterKbn     := 811;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'RDelKbn = 0 ';
    end
	// 得意先拡張分類２
    else if Sender = f1KKTKBRCD2 then
    begin
        lvExpSend.MasterKbn     := 812;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'RDelKbn = 0 ';
    end
	// 仕入先拡張分類１
    else if Sender = f1KKSIBRCD1 then
    begin
        lvExpSend.MasterKbn     := 821;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'RDelKbn = 0 ';
    end
	// 仕入先拡張分類２
    else if Sender = f1KKSIBRCD2 then
    begin
        lvExpSend.MasterKbn     := 822;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'RDelKbn = 0 ';
//    end; //<PASS>Upd
//<134>↑
//<PASS>ins-s
	end

	//パスワード合成項目1
    else if (Sender = f1PASSITEMKBN1) or (Sender = f1PASSITEMKBN1_Si) then
    begin
        lvExpSend.MasterKbn     := 9600;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO

        lvExpSend.WhereStr      := 'tbl = ''ALL'' and type = ''パスワード合成区分1'' ';
    end

	//パスワード合成項目2
    else if (Sender = f1PASSITEMKBN2) or (Sender = f1PASSITEMKBN2_Si) then
    begin
        lvExpSend.MasterKbn     := 9600;                     // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO

        lvExpSend.WhereStr      := 'tbl = ''ALL'' and type = ''パスワード合成区分2'' ';
    end;

//<PASS>ins-e

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);

    // ｷｬﾝｾﾙ
    if iExpRtn <> 1 then
        Exit;

    // 中身あり?
    if Length(Trim(lvExpRecv.GCode)) > 0 then
    begin
        if      Sender is TMNumEdit then
           TMNumEdit(MJSFindCtrl(Self, CompName)).Value := StrToFloat(lvExpRecv.GCode)
        else if Sender is TMTxtEdit then
           TMTxtEdit(MJSFindCtrl(Self, CompName)).Text  := lvExpRecv.GCode;


        //<122> --- St ---
        if Sender = f0CODE then
            f0CODE.InputFlag := False;

        if Sender = f1BMCODE then
		begin
            f1BMCODE.InputFlag := False;
            m_BumonNcodeEx := lvExpRecv.Ncode;  //<2466>
            m_BumonNMKEx   := lvExpRecv.Nmk;    //<2466>
        end;

        if Sender = f1BMCODE_Si then
		begin
            f1BMCODE_Si.InputFlag := False;
            m_BumonNCodeEx_Si := lvExpRecv.Ncode;  //<2466>
            m_BumonNMKEx_Si   := lvExpRecv.Nmk;    //<2466>
        end;

        if Sender = f1TNCODE then
            f1TNCODE.InputFlag := False;

        if Sender = f1TNCODE_Si then
            f1TNCODE_Si.InputFlag := False;

        //<122> --- Ed ---

		MjsDispCtrl.MjsSetFocus(Self, CompName); //<145>

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
		Abort;
    end;

end;
//-----------------------------------------------------------------------------
// fnEnter()
//      PARAM   : Sender    TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : OnEnterｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.f0CODEEnter(Sender: TObject);
begin
    //ファンクションボタンの表示・非表示<100>
    fnSetFncType(1);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

end;
//-----------------------------------------------------------------------------
//     <100>fnSetFncType
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnSetFncType(pKBN:Integer);
begin

    uvFncInfo.Caption[0] := '';
    uvFncInfo.Caption[1] := '';
    uvFncInfo.Caption[2] := '';
    uvFncInfo.Caption[3] := '';
    uvFncInfo.Caption[4] := '';
    uvFncInfo.Caption[5] := '';

    if (pKBN = 1) and (uvDispFlg = 0) then //<140>uvDispFlg=0の条件を追加
        // 表示
        uvFncInfo.Caption[6] := 'F7 ﾃﾝﾌﾟﾚｰﾄ'
    else
        // ｸﾘｱ
        uvFncInfo.Caption[6] := '';

    uvFncInfo.Caption[7] := '';

    uvFncInfo.Action[0]  := nil;
    uvFncInfo.Action[1]  := nil;
    uvFncInfo.Action[2]  := nil;
    uvFncInfo.Action[3]  := nil;
    uvFncInfo.Action[4]  := nil;
    uvFncInfo.Action[5]  := nil;
    if uvDispFlg = 1 then
        uvFncInfo.Action[6]  := nil
    else
        uvFncInfo.Action[6]  := AcTemplate;
    uvFncInfo.Action[7]  := nil;

end;
//-----------------------------------------------------------------------------
//     ファンクションでの処理　<100>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin

    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
        uvFncInfo.Action[FuncNo-1].Execute;

end;
//-----------------------------------------------------------------------------
//     ファンクションの処理実行　<100>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.AcTemplateExecute(Sender: TObject);
begin

    if uvTempFlg then
    begin                                                   // 通常ﾓｰﾄﾞ
       uvTempFlg := False
    end
    else
    begin                                                   // ﾃﾝﾌﾟﾚｰﾄﾓｰﾄﾞ
        uvTempFlg   := True;
        f0CODE.Text := '';
        f0NM.Text   := '';

        fnChkTRCODE;
        fnRecGet(f0CODE.Text);

//        if f1POSTNO1.Enabled = False then
//            Exit;

//        MTab1.Items.Selected := 1;
//        MjsSetFocus(Self, 'f1URKINHSUKBN')
        MTab1.Items.Selected := 0;
        MjsSetFocus(Self, 'f1BMCODE')
    end;

    // 「テンプレート」ｷｬﾌﾟｼｮﾝを表示/非表示する
    TempMode.Visible := uvTempFlg;

end;
//-----------------------------------------------------------------------------
//     ファンクションボタンの表示・非表示<100>
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.f0CODEExit(Sender: TObject);
begin

    fnSetFncType(0);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

end;
//-----------------------------------------------------------------------------
//  取引先コードのチェック
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// fnChkTRCODE()
//      RETURN  : Integer         0:正常終了,
//                                1:得意先又は仕入先が採用されていない取引先
//                               -1:存在しない。
//                              ※↓以下はグループ会計の子社のみ返る可能性がある値。
//                              -98:親に存在(同期ｷｬﾝｾﾙ),
//                              -99:異常終了
//      MEMO    : 取引先コードのチェック
//-----------------------------------------------------------------------------
Function TFrmJNTCRP004004F.fnChkTRCODE:Integer;
var
    QryW  : TMQuery;
    sCode : String;

//<133>
//<KOJ> Upd-s
//	bHanbai, bSiire, bSaimu, bSaiken : Boolean;
	bHanbai, bSiire, bSaimu, bSaiken, bKoj: Boolean;
//<KOJ> Upd-e


//↓<Rel>
	PQe     : TMQuery; //全社DB用クエリ
	Qe      : TMQuery; //子社DB用クエリ
	strNmk  : string;
	nPNCode : Extended;
//↑<Rel>
begin

    Result    := 0;
    f0NM.Text := '';

//<133>↓
	bHanbai	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_HAN);
	bSiire	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_SHI);
	bSaimu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SMU);
	bSaiken	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SKN);
//<133>↑

//<KOJ> Ins-s
    // 建設工事業ﾗｲｾﾝｽ採用ﾁｪｯｸ
    bKoj := fnKojUse;
//<KOJ> Ins-e


    // ﾃﾝﾌﾟﾚｰﾄﾌﾗｸﾞ
    if  uvTempFlg then
        sCode := ''
    else
        sCode := fnGetDspData(f0CODE.text);

//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
	begin
		PQe := TMQuery.Create(Self);
		m_pMDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, PQe);
		Qe  := TMQuery.Create(Self);
		m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qe);

		SessionPractice(C_ST_PROCESS); // <MHIS> ADD

		try
			// 子社DBにあるか？
			Qe.Close;
			Qe.SQL.Clear;
			Qe.SQL.Add('select NCODE from MTOKUI '
				+   ' where (GCODE = :pCODE) and (RDelKbn = 0)');
			if f0CODE.text = '' then
			begin
				Qe.ParamByName('pCODE').asString := '';
			end
			else
			begin
				Qe.ParamByName('pCODE').asString := sCode;
			end;
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
				begin
					PQe.ParamByName('pCODE').asString := '';
				end
				else
				begin
					PQe.ParamByName('pCODE').asString := sCode;
				end;
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
                        // 同期確認ダイアログの結果→「同期する」論理

			            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            m_pMDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
			            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            m_pMDataModule.BeginTran( dbCorp_Select );

				        try
                            if not fnMTOKUI_Sync(m_SyncMaster,nPNCode,PQe) then
                            begin
                                MjsMessageBoxEx (Self,
                                                     '自社への関連付けに失敗しました。',
                                                     'マスタ同期', mjError, mjOk, mjDefOk);
                                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                m_pMDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                m_pMDataModule.Rollback( dbCorp_Select );
				                Result := -99;
				                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのメンテを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,nPNCode,PQe) then
                            begin
                                Result := -99;
                                Exit;
                            end;

			            except
			                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                m_pMDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
			                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                m_pMDataModule.Rollback( dbCorp_Select );
			                Result := -99;
			                Exit;
			            end;

			            // 親会社DBに対してｺﾐｯﾄを実行する
			            m_pMDataModule.Commit( m_SyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してｺﾐｯﾄを実行する
	                    m_pMDataModule.Commit( dbCorp_Select );
					end
                    else
                    begin
                        // 同期確認ダイアログの結果→「同期ｷｬﾝｾﾙ」論理
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

			SessionPractice(C_ED_PROCESS); // <MHIS> Add

		end;
	end;
//↑<Rel>

    // Queryの構築
    QryW := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, QryW);

    try
        with QryW do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select NCODE, NM, HojyoKbn1, HojyoKbn2 from MTOKUI '
                +   ' where (GCODE = :pCODE) and (RDelKbn = 0)');

//<133>↓
//<KOJ> Upd-s
//			if (not bHanbai) and (not bSaiken) then
            // 販売管理、債権管理、工事ﾗｲｾﾝｽが採用されていない場合
			if (not bHanbai) and (not bSaiken) and (not bKoj) then
				SQL.Add('and (HojyoKbn2 <> 0)');  // 仕入先採用
//<KOJ> Upd-e

//<KOJ> Upd-s
//			if (not bSiire) and (not bSaimu) then
            // 仕入管理、債務管理、工事ﾗｲｾﾝｽが採用されていない場合
			if (not bSiire) and (not bSaimu) and (not bKoj) then
				SQL.Add('and (HojyoKbn1 <> 0)');  // 得意先採用
//<KOJ> Upd-e
//<133>↑

            if f0CODE.text = '' then
                ParamByName('pCODE').asString := ''
            else
                ParamByName('pCODE').asString := sCode;
            Open;

            if EOF = False then
            begin
                f0NM.text := GetFld('NM').AsString;
                uvNCODE   := GetFld('NCode').AsFloat;       // 内部コードの取得
                uvHoj1Flg := GetFld('HojyoKbn1').AsInteger; // 得意先採用区分取得
                uvHoj2Flg := GetFld('HojyoKbn2').AsInteger; // 仕入先採用区分取得

//<133>↓
//<KOJ> Upd-s
//			if (not bHanbai) and (not bSaiken) then
                // 販売管理、債権管理、工事ﾗｲｾﾝｽが採用されていない場合
                if (not bHanbai) and (not bSaiken) and (not bKoj) then
                    uvHoj1Flg := 0;
//<KOJ> Upd-e

//<KOJ> Upd-s
//			if (not bSiire) and (not bSaimu) then
                // 仕入管理、債務管理、工事ﾗｲｾﾝｽが採用されていない場合
                if (not bSiire) and (not bSaimu) and (not bKoj) then
                    uvHoj2Flg := 0;
//<KOJ> Upd-e
//<133>↑

                if (uvHoj1Flg = 0) and (uvHoj2Flg = 0) then
                    Result := 1;

            end
            else
                Result := -1;
        end;
    finally
        QryW.Close;
        QryW.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  名称を取得
//-----------------------------------------------------------------------------
// <108>function TFrmJNTCRP004004F.fnGetNAME(pCODE:String;pMKBN,pAttr:Integer; var RName:String ):Boolean;
function TFrmJNTCRP004004F.fnGetNAME(Sender: TObject; pCODE: String; pMKBN, pAttr: Integer;
                                     var RName: String ):Boolean;   // <108>
var
    Qry     :   TMQuery;
    lvCode  :   String;
begin

    Result  :=  FALSE;
    RName   :=  '';
    lvCODE  :=  '';

	if ( pAttr = 2 ) then   lvCODE  :=  pCODE
	else
	begin
		if ( pCODE <> '' ) then
			    lvCODE	:=  Format ('%.16d', [StrToInt64 (Trim(pCODE))])
		else    lvCODE  :=  '';
	end;

    Qry :=  TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close();
            SQL.Clear();

            // ------------------
            //      担当者
            // ------------------
            if ( pMKBN = MKBN_SYAIN ) then
            begin
                SQL.Add('SELECT M.SimpleName NMK  FROM HAPSC H  '
                    +   'LEFT OUTER JOIN MOS_OFFICE_STAFF M     '
                    +   '   ON  (M.NCODE    = H.NCODE)          '
                    +   'WHERE  (H.GCODE    = :strGCode)        '
                    +   '  AND  (M.RDelKBN  = 0)                ');

                // 得意先担当者<108>
                if ( Sender = f1TNCODE ) then
                    SQL.Add('  AND  (KBN in (1,3))              ')
                // 仕入先担当者
                else if (Sender = f1TNCODE_Si ) then
                    SQL.Add('  AND  (KBN in (2,3))              ');

            end
            // ------------------
            //      部 門
            // ------------------
            else if ( pMKBN = MKBN_BUMON ) then
            begin
                //SQL.Add('SELECT SimpleName NMK FROM HOJYOMA '	//<2466>
                SQL.Add('select TOP 1 SimpleName NMK from HOJYOMA  '
                    +   'WHERE  (MasterKbn  = :MKBN)        '
                    +   '  AND  (RDelKbn    = 0)            '
                    +   '  AND  (SumKbn     = 0)            '
                    +   '  AND  (GCode      =:strGCode)     ');

                SetFld('MKBN').AsInteger	:=  MKBN_BUMON;

                //検索エクスプローラから選択した場合およびDBから取得した場合は、内部コードも検索条件とする。
				if Sender = f1BMCODE then
				begin
                	if m_BumonNcodeEx > 0 then
                	begin
                	    SQL.Add(' and NCode=:pNCode ');   //<2466>
                	    SetFld('pNCode').AsFloat := m_BumonNCodeEx;   //<2466>
					end else
                	//手入力した場合は、適用期間の最新を取得
	                begin
	                    SQL.Add(' Order By TStartDate Desc ');  //<2466>
	                end;
				end;
				if Sender = f1BMCODE_Si then
				begin
                	if m_BumonNCodeEx_Si > 0 then
                	begin
                	    SQL.Add(' and NCode=:pNCode ');   //<2466>
                	    SetFld('pNCode').AsFloat := m_BumonNCodeEx_Si;   //<2466>
					end else
	                //手入力した場合は、適用期間の最新を取得
	                begin
	                    SQL.Add(' Order By TStartDate Desc ');  //<2466>
	                end;
				end;

            end
//<PASS>↓
            // ------------------
            // パスワード合成項目1
            // ------------------
            else if ( pMKBN = 9600 ) then
            begin
                SQL.Add('SELECT NM NMK  FROM MKBN  '
                    +   'WHERE  (TBL    = ''ALL'')     '
                    +   '  AND  (type = ''パスワード合成区分1'') '
					+   '  AND  (Code      =:strGCode) ');
            end

            // ------------------
            // パスワード合成項目2
            // ------------------
            else if ( pMKBN = 9601 ) then
            begin
                SQL.Add('SELECT NM NMK  FROM MKBN  '
                    +   'WHERE  (TBL    = ''ALL'')     '
                    +   '  AND  (type = ''パスワード合成区分2'') '
					+   '  AND  (Code      =:strGCode) ');
            end
//<PASS>↑
//<134>↓
			else if (pMKBN > 810) and (pMKBN < 830) then
			begin
                SQL.Add('SELECT NMK FROM MMEISHO '
                    +   'WHERE  (SetNm      = :MKBN)        '
                    +   '  AND  (RDelKbn    = 0)            '
                    +   '  AND  (GCode      =:strGCode)     ');

                SetFld('MKBN').AsInteger	:=  pMKBN;

			end;
//<134>↑

            SetFld('strGCode').AsString	    :=  lvCODE;
            Open();

            if ( EOF = FALSE ) then
            begin
                Result  :=  TRUE;
                RName   :=  GetFld('NMK').AsString;
            end;
        end;
    finally
        Qry.Close();
        Qry.Free();
    end;

end;

//-----------------------------------------------------------------------------
//  <2466>印刷用部門名称を取得
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnGetNAME_PrnBmn(pCODE: Extended; var RName: String ):Boolean;
var
    Qry     :   TMQuery;
    lvCode  :   String;
begin

    Result  :=  FALSE;
    RName   :=  '';

    Qry :=  TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close();
            SQL.Clear();

            // ------------------
            //      部 門
            // ------------------
            SQL.Add('select TOP 1 SimpleName NMK from HOJYOMA  '
                +   'WHERE  (MasterKbn  = :MKBN)        '
                +   '  AND  (RDelKbn    = 0)            '
                +   '  AND  (SumKbn     = 0)            '
                +   '  AND  (NCode      =:strNCode)     ');

            SetFld('MKBN').AsInteger	:=  MKBN_BUMON;
            SetFld('strNCode').AsFloat	    :=  pCODE;
            Open();

            if ( EOF = FALSE ) then
            begin
                Result  :=  TRUE;
                RName   :=  GetFld('NMK').AsString;
            end;
        end;
    finally
        Qry.Close();
        Qry.Free();
    end;

end;

//-----------------------------------------------------------------------------
//  内部コードを取得
//-----------------------------------------------------------------------------
Function TFrmJNTCRP004004F.fnGetNCODE(pCODE:String;pMKBN,pAttr:Integer):Extended;
var
    Qry :TMQuery;
    lvCode : String;
begin

    Result := 0;
    lvCODE := '';

    if pCODE = '' then Exit;

	if pAttr = 2 then
		lvCODE:= pCODE
	else
	begin
		if pCODE <> '' then
			lvCODE	:= Format ('%.16d', [StrToInt64 (Trim(pCODE))])
		else
			lvCODE := '';
	end;

    Qry := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化

            if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  M.NCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (H.GCODE = :strGCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
                //SQL.Add('SELECT NCODE FROM HOJYOMA  ');	<2466>
                SQL.Add('SELECT TOP 1 NCODE FROM HOJYOMA  ');    //<2466>
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode=:strGCode ');
                SQL.Add('ORDER BY TStartDate DESC ');   //<2466>
                SetFld('MKBN').AsInteger	:= 41;
            end

//<134>↓
            else if (pMKBN > 810) and (pMKBN < 830) then
            begin
                SQL.Add('SELECT NCODE FROM MMEISHO  ');
                SQL.Add('where  SetNm = :MKBN AND RDelKbn=0 ');
                SQL.Add('AND GCode=:strGCode ');
                SetFld('MKBN').AsInteger	:= pMKBN;
            end;
//<134>↑

            SetFld('strGCode').AsString	:= lvCODE;

            Open;						// ｸｴﾘの開始

            if EOF = False then
                Result  := GetFld('NCode').asFloat;

            //<2466>部門の場合で、検索EXPを使用した場合は、検索EXPから取得した内部コードを返す
            if (pMKBN = 41) and (m_BumonNcodeEx > 0) then  Result := m_BumonNcodeEx;

        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  内部コードを取得	<2466>仕入先用
//-----------------------------------------------------------------------------
Function TFrmJNTCRP004004F.fnGetNCODE_Si(pCODE:String;pMKBN,pAttr:Integer):Extended;
var
    Qry :TMQuery;
    lvCode : String;
begin

    Result := 0;
    lvCODE := '';

    if pCODE = '' then Exit;

	if pAttr = 2 then
		lvCODE:= pCODE
	else
	begin
		if pCODE <> '' then
			lvCODE	:= Format ('%.16d', [StrToInt64 (Trim(pCODE))])
		else
			lvCODE := '';
	end;

    Qry := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化

            if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  M.NCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (H.GCODE = :strGCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
                //SQL.Add('SELECT NCODE FROM HOJYOMA  ');	<2466>
                SQL.Add('SELECT TOP 1 NCODE FROM HOJYOMA  ');    //<2466>
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode=:strGCode ');
                SQL.Add('ORDER BY TStartDate DESC ');   //<2466>
                SetFld('MKBN').AsInteger	:= 41;
            end

//<134>↓
            else if (pMKBN > 810) and (pMKBN < 830) then
            begin
                SQL.Add('SELECT NCODE FROM MMEISHO  ');
                SQL.Add('where  SetNm = :MKBN AND RDelKbn=0 ');
                SQL.Add('AND GCode=:strGCode ');
                SetFld('MKBN').AsInteger	:= pMKBN;
            end;
//<134>↑

            SetFld('strGCode').AsString	:= lvCODE;

            Open;						// ｸｴﾘの開始

            if EOF = False then
                Result  := GetFld('NCode').asFloat;

            //<2466>部門の場合で、検索EXPを使用した場合は、検索EXPから取得した内部コードを返す
            if (pMKBN = 41) and (m_BumonNCodeEx_Si > 0) then  Result := m_BumonNCodeEx_Si;

        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  外部コード取得
//-----------------------------------------------------------------------------
Function TFrmJNTCRP004004F.fnGetGCODE(pCODE:Extended;pMKBN:Integer):String;
var
    Qry :TMQuery;
begin

    Result := '';


    Qry := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  H.GCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (M.NCODE = :pCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
                //SQL.Add('SELECT GCODE FROM HOJYOMA  ');	<2466>
                SQL.Add('SELECT GCODE,SimpleName FROM HOJYOMA  ');	//<2466>
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= 41;
				m_BumonNcodeEx := pCode;    //<2466> DBから取得した部門内部コードを記憶する。(部門名称を正しく取得するため）
            end
//<134>↓
            else if (pMKBN > 810) and (pMKBN < 830) then
            begin
                SQL.Add('SELECT GCODE FROM MMEISHO  ');
                SQL.Add('where  SetNm = :MKBN AND RDelKbn=0 ');
                SQL.Add('AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= pMKBN;
            end;
//<134>↑
			ParamByName ('pCode').AsFloat  := pCODE;
            Open;						// ｸｴﾘの開始

            if EOF = False then
			begin
                Result := GetFld('GCODE').asString;
                if  pMKBN = 41   then m_BumonNMkEX :=  FieldByName('SimpleName').asString;   //<2466>
			end;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  外部コード取得	<2466>仕入先用
//-----------------------------------------------------------------------------
Function TFrmJNTCRP004004F.fnGetGCODE_Si(pCODE:Extended;pMKBN:Integer):String;
var
    Qry :TMQuery;
begin

    Result := '';


    Qry := TMQuery.Create (Self);
    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  H.GCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (M.NCODE = :pCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
                //SQL.Add('SELECT GCODE FROM HOJYOMA  ');	<2466>
                SQL.Add('SELECT GCODE,SimpleName FROM HOJYOMA  ');	//<2466>
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= 41;
				m_BumonNCodeEx_Si := pCode;    //<2466> DBから取得した部門内部コードを記憶する。(部門名称を正しく取得するため）
            end
//<134>↓
            else if (pMKBN > 810) and (pMKBN < 830) then
            begin
                SQL.Add('SELECT GCODE FROM MMEISHO  ');
                SQL.Add('where  SetNm = :MKBN AND RDelKbn=0 ');
                SQL.Add('AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= pMKBN;
            end;
//<134>↑
			ParamByName ('pCode').AsFloat  := pCODE;
            Open;						// ｸｴﾘの開始

            if EOF = False then
			begin
                Result := GetFld('GCODE').asString;
                if  pMKBN = 41   then m_BumonNMKEx_Si :=  FieldByName('SimpleName').asString;   //<2466>
			end;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;

//-----------------------------------------------------------------------------
// BChangeClick()   <109>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
    lvRect  : TRect;
    lvWidth,
    lvHeight: Integer;
begin

    // ここでActiveControlをｾｯﾄする。
    ACControl   :=  Screen.ActiveControl;

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


//<133>
//-----------------------------------------------------------------------------
// fnLicenseCheck()
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnLicenseCheck;
var
//<KOJ> Upd-s
//	bHanbai, bSiire, bMitu, bJuchu, bHachu, bSaimu, bSaiken : Boolean;
	bKoj, bHanbai, bSiire, bMitu, bJuchu, bHachu, bSaimu, bSaiken : Boolean;
//<KOJ> Upd-e
begin
	bHanbai	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_HAN);
	bSiire	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_SHI);
	bMitu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_MIT);
	bJuchu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_TYU);
	bHachu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.SEL_HAT);
	bSaimu	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SMU);
	bSaiken	:= CheckModuleLicense(m_pMjsAppRec,FXLicense.MAS_SKN);
//<KOJ> Upd-s
    // 建設工事業ﾓｼﾞｭｰﾙ採用ﾁｪｯｸ
    bKoj    := fnKojUse;
//<KOJ> Upd-e

//    Mtab1.Items[0].Visible := True;

//<KOJ> Upd-s
//	if (not bHanbai) and (not bSaiken) then
    // 販売管理･債権管理･工事ﾗｲｾﾝｽが採用されていない場合
	if (not bHanbai) and (not bSaiken) and (not bKoj) then
//<KOJ> Upd-e
	begin
		Mtab1.Items[1].Visible := False;
		Mtab1.Items[3].Visible := False;

		Blind_TK.Visible := False;
		Blind_Othr_TK.Visible	:= False;
	end;

//<KOJ> Upd-s
//	if (not bSiire) and (not bSaimu) then
    // 仕入管理･債務管理･工事ﾗｲｾﾝｽが採用されていない場合
	if (not bSiire) and (not bSaimu) and (not bKoj) then
//<KOJ> Upd-e
	begin
		Mtab1.Items[2].Visible := False;
		Mtab1.Items[4].Visible := False;

		Blind_SI.Visible := False;
		Blind_Othr_Si.Visible	:= False;
	end;

//    Mtab1.Items[5].Visible := True;

// <147> del -s 基本情報、入力・集計情報はライセンス条件なしにする。（パネル、タブでの条件があるため）
{
//<KOJ> Upd-s
//	if not bHanbai then
    // 販売管理･工事ﾗｲｾﾝｽが共に採用されていない場合は入力不可にする
	if (not bHanbai) and (not bKoj) then
//<KOJ> Upd-e
	begin
		// 基本情報
		//LblYUBIN.Enabled		:= False;
		fnChgCmpEna(False, f1POSTNO1);
		//Label14.Enabled			:= False;
		fnChgCmpEna(False, f1POSTNO2);
		//LblJUSHO1.Enabled		:= False;
		fnChgCmpEna(False, f1ADS1);
		//LblJUSHO2.Enabled		:= False;
		fnChgCmpEna(False, f1ADS2);
		//LblTEL.Enabled			:= False;
		fnChgCmpEna(False, f1TEL1);
		//Label47.Enabled			:= False;
		fnChgCmpEna(False, f1SectionName);
		//Label48.Enabled			:= False;
		fnChgCmpEna(False, f1TanNM);
		fnChgCmpEna(False, f1KeisyoKbn);
		//MLabel5.Enabled			:= False;
		fnChgCmpEna(False, f1MailAd);

		// 入力・集計情報
		//Label2.Enabled			:= False;
		fnChgCmpEna(False, f1TNKRNK);
		//Label31.Enabled			:= False;
		fnChgCmpEna(False, f1KAKERT);
		//Label30.Enabled			:= False;
		//Label32.Enabled			:= False;
		fnChgCmpEna(False, f1SSHCDKBN);
		fnChgCmpEna(False, f1SSHCDKBNNM);
		//Label46.Enabled			:= False;
		fnChgCmpEna(False, f1SSHCDKET);
		//Label57.Enabled			:= False;
}
// <147> del -e

//<Del> Del-s
{       // ↓販売管理の採用有無のみで判定を行う項目の為移動しました。
		// 印刷情報
		//lbl_JYGKEI.Enabled		:= False;
		fnChgCmpEna(False, f1JYGKEI);
		fnChgCmpEna(False, f1JYGKEINM);
		//lbl_MITPFM.Enabled		:= False;
		fnChgCmpEna(False, f1MITPFM);
		fnChgCmpEna(False, f1MITPFMNM);
		//lbl_JHDENPFM.Enabled	:= False;
		fnChgCmpEna(False, f1JHDENPFM);
		fnChgCmpEna(False, f1JHDENPFMNM);
		//lbl_SNDENPFM.Enabled	:= False;
		fnChgCmpEna(False, f1SNDENPFM);
		fnChgCmpEna(False, f1SNDENPFMNM);
		//lab_SOFOPFM.Enabled		:= False;
		fnChgCmpEna(False, f1SOFOPFM);
		fnChgCmpEna(False, f1SOFOPFMNM);
}
//<Del> Del-e
//<147>	end;

//<KOJ> Ins-s
    // 販売管理が採用されていない場合は入力不可にする
	if (not bHanbai) then
    begin
		// 印刷情報
//<147>		fnChgCmpEna(False, f1JYGKEI);
//<147>		fnChgCmpEna(False, f1JYGKEINM);
		fnChgCmpEna(False, f1MITPFM);
		fnChgCmpEna(False, f1MITPFMNM);
		fnChgCmpEna(False, f1JHDENPFM);
		fnChgCmpEna(False, f1JHDENPFMNM);
		fnChgCmpEna(False, f1SNDENPFM);
		fnChgCmpEna(False, f1SNDENPFMNM);
//<147>		fnChgCmpEna(False, f1SOFOPFM);
//<147>		fnChgCmpEna(False, f1SOFOPFMNM);
    end;
//<KOJ> Ins-e

// <147> ins -s
    // 販売管理、債権管理が採用されていない場合は入力不可にする
	if ((not bHanbai) and (not bSaiken)) then
    begin
		// 上代合計欄税印字
		fnChgCmpEna(False, f1JYGKEI);
		fnChgCmpEna(False, f1JYGKEINM);
        // 送り状ﾌｫｰﾑ
		fnChgCmpEna(False, f1SOFOPFM);
		fnChgCmpEna(False, f1SOFOPFMNM);
	end;
// <147> ins -e

// <147> del -s 基本情報、入力・集計情報はライセンス条件なしにする。（パネル、タブでの条件があるため）
{
//<KOJ> Upd-s
//	if not bSiire then
    // 仕入管理･工事ﾗｲｾﾝｽが採用されていない場合は入力不可にする
	if (not bSiire) and (not bKoj) then
//<KOJ> Upd-s
	begin
		// 基本情報
		//Label17.Enabled			:= False;
		fnChgCmpEna(False, f1POSTNO1_Si);
		//Label34.Enabled			:= False;
		fnChgCmpEna(False, f1POSTNO2_Si);
		//Label19.Enabled			:= False;
		fnChgCmpEna(False, f1ADS1_Si);
		//Label20.Enabled			:= False;
		fnChgCmpEna(False, f1ADS2_Si);
		//Label21.Enabled			:= False;
		fnChgCmpEna(False, f1TEL1_Si);
		//Label24.Enabled			:= False;
		fnChgCmpEna(False, f1SectionName_Si);
		//Label26.Enabled			:= False;
		fnChgCmpEna(False, f1TanNM_Si);
		fnChgCmpEna(False, f1KeisyoKbn_Si);
		//MLabel6.Enabled			:= False;
		fnChgCmpEna(False, f1MailAd_Si);

		// 入力・集計情報
		//MLabel46.Enabled		:= False;
		fnChgCmpEna(False, f1TNKRNK_Si);
		//MLabel47.Enabled		:= False;
		fnChgCmpEna(False, f1KAKERT_Si);
		//MLabel48.Enabled		:= False;
		//Label39.Enabled			:= False;
		fnChgCmpEna(False, f1SSHCDKBN_Si);
		fnChgCmpEna(False, f1SSHCDKBNNM_Si);
		//Label40.Enabled			:= False;
		fnChgCmpEna(False, f1SSHCDKET_Si);
		//Label45.Enabled			:= False;
}
// <147> del -e

//<Del> Del-s
{
		// 印刷情報
		//Label58.Enabled			:= False;
		fnChgCmpEna(False, f1JHDENPFM_Si);
		fnChgCmpEna(False, f1JHDENPFMNM_Si);
		//Label62.Enabled			:= False;
		fnChgCmpEna(False, f1SNDENPFM_Si);
		fnChgCmpEna(False, f1SNDENPFMNM_Si);
}
//<Del> Del-e
//<147>	end;

//<KOJ> Ins-s
    // 仕入管理が採用されていない場合は入力不可にする
	if (not bSiire) then
    begin
		// 印刷情報
		fnChgCmpEna(False, f1JHDENPFM_Si);
		fnChgCmpEna(False, f1JHDENPFMNM_Si);
		fnChgCmpEna(False, f1SNDENPFM_Si);
		fnChgCmpEna(False, f1SNDENPFMNM_Si);
    end;
//<KOJ> Ins-e

	if not bMitu then
	begin
		//lbl_MITPFM.Enabled		:= False;
		fnChgCmpEna(False, f1MITPFM);
		//f1MITPFMNM.Enabled		:= False;
	end;

	if not bJuchu then
	begin
		//lbl_JHDENPFM.Enabled	:= False;
		fnChgCmpEna(False, f1JHDENPFM);
		//f1JHDENPFMNM.Enabled	:= False;
	end;

	if not bHachu then
	begin
		//Label58.Enabled			:= False;
		fnChgCmpEna(False, f1JHDENPFM_Si);
		//f1JHDENPFMNM_Si.Enabled	:= False;
	end;

//<KOJ> Upd-s
    // 建設工事業が採用されていない場合は工事伝票項目を入力不可にする
	if not bKoj then
	begin
        // 得意先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1KUSDENPFM_Tk);
        fnChgCmpEna(False, f1KUSDENPFMNM_Tk);
        fnChgCmpEna(False, f1KMITPFM_Tk);
        fnChgCmpEna(False, f1KMITPFMNM_Tk);
        fnChgCmpEna(False, f1KJHDENPFM_Tk);
        fnChgCmpEna(False, f1KJHDENPFMNM_Tk);
        fnChgCmpEna(False, f1KUSGKEI_Tk);
        fnChgCmpEna(False, f1KUSGKEINM_Tk);

        // 仕入先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1KUSDENPFM_Si);
        fnChgCmpEna(False, f1KUSDENPFMNM_Si);
        fnChgCmpEna(False, f1KJHDENPFM_Si);
        fnChgCmpEna(False, f1KJHDENPFMNM_Si);
        fnChgCmpEna(False, f1KUSGKEI_Si);
        fnChgCmpEna(False, f1KUSGKEINM_Si);
    end;
//<KOJ> Upd-e

{↓<KOJ3>
//<KOJ> Ins-s
    // 建設工事業のみ採用されている場合は納品書ﾌｫｰﾑ･売上合計欄税印字を入力不可にする
	if ((not bHanbai) and (not bMitu) and (not bJuchu) and (bKoj))  or
       ((not bSiire)  and (not bHachu) and (bKoj))then
	begin
        // 得意先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1USGKEI);
        fnChgCmpEna(False, f1USGKEINM);
        fnChgCmpEna(False, f1USDENPFM);
        fnChgCmpEna(False, f1USDENPFMNM);

        // 仕入先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1USGKEI_Si);
        fnChgCmpEna(False, f1USGKEINM_Si);
        fnChgCmpEna(False, f1USDENPFM_Si);
        fnChgCmpEna(False, f1USDENPFMNM_Si);
    end;
//<KOJ> Ins-e
↑<KOJ3>}
//↓<KOJ3>
    // 建設工事業のみ採用されている場合は納品書ﾌｫｰﾑ･売上合計欄税印字を入力不可にする
// <147> upd -s 債権管理を追加
//	if ((not bHanbai) and (not bMitu) and (not bJuchu) and (bKoj)) then
	if ((not bHanbai) and (not bMitu) and (not bJuchu) and (not bSaiken) and (bKoj)) then
// <147> upd -e
	begin
        // 得意先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1USGKEI);
        fnChgCmpEna(False, f1USGKEINM);
        fnChgCmpEna(False, f1USDENPFM);
        fnChgCmpEna(False, f1USDENPFMNM);
    end;

// <147> upd -s 債務管理を追加
//    if ((not bSiire)  and (not bHachu) and (bKoj)) then
    if ((not bSiire)  and (not bHachu) and (not bSaimu) and (bKoj)) then
// <147> upd -e
    begin
        // 仕入先印刷情報ﾀﾌﾞ
        fnChgCmpEna(False, f1USGKEI_Si);
        fnChgCmpEna(False, f1USGKEINM_Si);
        fnChgCmpEna(False, f1USDENPFM_Si);
        fnChgCmpEna(False, f1USDENPFMNM_Si);
    end;
//↑<KOJ3>

	if	(not Blind_Othr_TK.Visible) and
		(not Blind_Othr_Si.Visible) then
		Mtab1.Items[5].Visible := False
	else
		Mtab1.Items[5].Visible := True;
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
procedure TFrmJNTCRP004004F.SessionPractice(iSyori: Integer);
begin
try
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsFloat			:= rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).TantoNCD;		//<D10>AsCurrency → AsFloat
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMjsAppRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMjsAppRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMjsAppRec^.m_iProgramCode;

//<D10>SPMsHist.Prepare;						// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
//<D10>SPMsHist.UnPrepare;						// ﾘｿｰｽを解放する

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = 1 then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsFloat		:= rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).TantoNCD;		//<D10>AsCurrency → AsFloat
												// 担当者名称
    	SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMjsAppRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pMjsAppRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pMjsAppRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    	SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pMjsAppRec^.m_iProgramCode;

//<D10>	SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    	SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
//<D10>	SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
	end;
except
	on e:Exception do
	begin
		ShowMessage(e.Message);
		raise;
	end
end;
end;

//↑<MHIS>
//↓<141>
//-----------------------------------------------------------------------------
//	指定コンポーネントの使用制御
//-----------------------------------------------------------------------------
procedure TFrmJNTCRP004004F.fnChgCmpEna(pEna: Boolean; pCMP: TObject;
    pSub1: TObject = nil; pSub2: TObject = nil);
var
    lvCOL: TColor;
begin
    //使用制御
    TControl(pCMP).Enabled := pEna;
    //補助コンポーネントの指定があったら
    if pSub1 <> nil then TControl(pSub1).Enabled := pEna;
    if pSub2 <> nil then TControl(pSub2).Enabled := pEna;

    //色
    lvCOL := clWindow;
    if pEna = False then
        lvCOL := ucCL_UnEnableCtrl;

    //色セット(コンポーネントごとに切分 ※TControlだとColorプロはパティがプロテクトされているため)
    if (pCMP is TMNumEdit)  then TMNumEdit(pCMP).Color  := lvCOL;
    if (pCMP is TMTxtEdit)  then TMTxtEdit(pCMP).Color  := lvCOL;
    if (pCMP is TMComboBox) then TMComboBox(pCMP).Color := lvCOL;
    if (pCMP is TEdit)      then TEdit(pCMP).Color      := lvCOL;
end;
//↑<141>

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
function TFrmJNTCRP004004F.fnKojUse() : Boolean;
{↓<KOJ4>
var
    Query       : TMQuery;
begin
    Result := False;

    // 工事ライセンスチェック
    if CheckModuleLicense(m_pMjsAppRec, 850000) = False then
        Exit;

    // 工事採用区分チェック
	Query := TMQuery.Create( Self );
	with Query do
	begin
    	try
            DatabaseName  := dbCorp_Select.DatabaseName;
            SessionName   := dbCorp_Select.SessionName;

			Close;
			SQL.Clear;
			SQL.Add('Select count(*) Cnt');
			SQL.Add('From MasterInfo ');
            SQL.Add('Where (MasterKbn Between 201 and 299) and (UseKbn = 1) and (KojUseKbn Between 1 and 3)');

			Open;

			Result := (FieldByName('Cnt').AsInteger >= 1);
		finally
			Close;
		end;
	end;
end;
↑<KOJ4>}
//↓<KOJ4>工事のライセンスの状態のみ返すようにする。（プロジェクト１～１０のうち工事採用の有無は問わない。）
begin
	Result := CheckModuleLicense(m_pMjsAppRec, 850000);
end;
//↑<KOJ4>
//<KOJ> Ins-e

//<MJUP>↓
// *********************************************************************
//	Proccess	:	全ての必要な区分を取得します
//	Parameter	:   なし
//	Return		:	なし
//**********************************************************************
procedure TFrmJNTCRP004004F.fnGetAllKbn();
var
	qryAllKbn		: TMQuery;
begin
	// 今はまだ一つですが、画面初期表示時に必要な情報はここでまとめて取得してください。

	m_SELCSTM_TBL.GL06	:= False;

    qryAllKbn	:= TMQuery.Create(Self);

    try
	    m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, qryAllKbn);

        with qryAllKbn do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select '
                +   '  isnull((select count(1) Cnt from SELCSTM_TBL where Kbn = ''GL06''),0) as GL06'
                );
            Open;
            if not EOF then
            begin
                m_SELCSTM_TBL.GL06	:= (GetFld('GL06').AsInteger >= 1);
            end;
        end;
    finally
		qryAllKbn.Close;
		qryAllKbn.Free;
    end;
end;
//<MJUP>↑

//<2255>↓
//-----------------------------------------------------------------------------
//  締日を表示用に編集する
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnShimeStrGet(Text: String): String;
var
    lvStr: String;
begin
    if 	    Text = '31' then lvStr := '末締'
    else if Text = '0'  then lvStr := ''
    else                     lvStr := Text + '日締';
    Result := lvStr;
end;

//-----------------------------------------------------------------------------
//  サイクルを表示用に編集する
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnCyclesStrGet(Text: String): String;
var
    lvStr: String;
begin
    if 		Text = '0' then lvStr := '同月'
    else if Text = '1' then lvStr := '翌月'
    else if Text = '2' then lvStr := '翌々月'
    else         			lvStr := Text + 'ヶ月';
    Result := lvStr;
end;

//-----------------------------------------------------------------------------
//  回収日を表示用に編集する
//		得意側か仕入側かで表示する文字列を変更する。
//-----------------------------------------------------------------------------
function TFrmJNTCRP004004F.fnCollectStrGet(Text: String): String;
var
    lvStr: String;
begin
	if uvHani.pvrPattern = 4 then
	begin
        if 		Text = '31' then lvStr := '末日回収'
        else if Text = '0'  then lvStr := ''
        else                     lvStr := Text + '日回収';
        Result := lvStr;
	end
	else
	begin
        if 		Text = '31' then lvStr := '末日支払'
        else if Text = '0'  then lvStr := ''
        else                     lvStr := Text + '日支払';
        Result := lvStr;
	end;
end;
//<2255>↑

//**********************************************************************
//	Proccess	:	部門コードキー入力	<2466>
//	Name		:	NTC新保
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TFrmJNTCRP004004F.f1BMCODEKeyPress(Sender: TObject;
  var Key: Char);
begin
    //<2466>エクスプローラから取得した内部コードをクリア（外部コードから内部コードを再取得）
    m_BumonNcodeEx := 0;
end;

//**********************************************************************
//	Proccess	:	部門コードキー入力	<2466>
//	Name		:	NTC新保
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TFrmJNTCRP004004F.f1BMCODE_SiKeyPress(Sender: TObject;
  var Key: Char);
begin
    //<2466>エクスプローラから取得した内部コードをクリア（外部コードから内部コードを再取得）
    m_BumonNCodeEx_Si := 0;
end;

//<PASS>add S
// *********************************************************************
//	Proccess	:	郵便・電話番号未入力チェック（販売情報、債権/債務情報）
//	Name		:	星野 瑠惟
//	Date		:	2021/12/06
//	Parameter	:   pTkSiKbn: 1 得意先、2 仕入先
//              :   iItmKbn1: パスワード合成項目1の区分値
//              :   iItmKbn2: パスワード合成項目2の区分値
//	Return		:	True:未入力あり、False：未入力なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TFrmJNTCRP004004F.fnPWITEMChkUpd(pTkSiKbn:Integer; iItemKbn1: Integer; iItemKbn2: Integer): Boolean;
var
	lvMsg,
    lvMsg2,
	lvWork,
    lvWorkSK,
	lvNm		: String;
    lvBolZip,                   //販売情報 郵便番号未入力/入力済
    lvBolTel		: Boolean;  //販売情報 電話番号未入力/入力済
    lvBolZip_CRDPAY,            //債権/債務情報 郵便番号未入力/入力済
    lvBolTel_CRDPAY	: Boolean;  //債権/債務情報 電話番号未入力/入力済

    NCode,
	SumKbn,					//MTOKUI SumKbn(実在/合計区分)
    PassKbn,
    PostNo1,                //MTOKUI PostNo1
	PostNo2		: Integer;  //MTOKUI PostNo2

    Tel1		: String;   //MTOKUI Tel1

	PostNo1_CRDPAY,             //MTOKUI_CRD or MTOKUI_PAY  PostNo1
    PostNo2_CRDPAY	: Integer;  //MTOKUI_CRD or MTOKUI_PAY  PostNo2
	Tel1_CRDPAY		: String;   //MTOKUI_CRD or MTOKUI_PAY  Tel1

    lvSQL		: String;

	Qry			: TMQuery;

begin
	Result 	:= False;

	lvBolZip 	:= False;
	lvBolTel 	:= False;

	lvBolZip_CRDPAY 	:= False;
	lvBolTel_CRDPAY 	:= False;

	lvMsg	:=  'パスワードに必要な情報が登録されていません。'#13#10'基本情報登録の内容を未入力項目にセットしますか？'#13#10'●未入力項目'#13#10;
    lvMsg2	:=  'パスワードに必要な情報が登録されていません。'#13#10'情報区分-基本情報の郵便番号と電話番号(1)を登録してください。';

	Qry := TMQuery.Create(self);
	try
    	m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);;
        with Qry do
        begin
            Close;
            Sql.Clear;

            lvSQL := ' Select tk.SumKbn, ISNULL(tk.PostNo1,0) as PostNo1, ISNULL(tk.PostNo2,0) as PostNo2, ISNULL(tk.Tel1,'''') as Tel1 '+
                     ' From MTOKUI_SEL sel Left Outer Join MTOKUI tk On (sel.BaseNCode = tk.NCode) '+
                     ' WHERE BaseNCode = :NCODE ';

            if	(pTkSiKbn = 1) then
            begin
                lvSQL := lvSQL + 'And sel.RecKbn = 1';
            end
            else
            begin
                lvSQL := lvSQL + 'And sel.RecKbn = 2';
            end;

            Sql.add(lvSQL);
            ParamByName('NCODE').AsFloat := uvNCODE;
            Open();

            SumKbn		:= GetFld('SUMKBN').AsInteger;
            PostNo1		:= GetFld('POSTNO1').AsInteger;
            PostNo2		:= GetFld('POSTNO2').AsInteger;
            Tel1		:= GetFld('TEL1').AsString;
        end;
	finally
    	Qry.Close;
    	Qry.Free;
    end;

    if	(pTkSiKbn =1) then //得意先
    begin
		PassKbn		:= Trunc(f1PASSKBN.Value);
    end
    else //仕入先
    begin
		PassKbn		:= Trunc(f1PASSKBN_Si.Value);
    end;

    // パスワード設定にパスワード合成項目が使用されていない場合は処理から抜ける
    if Passkbn <> 2 then
    begin
        Exit;
    end;

    lvWork := '';

	//合計取引先が選択されている場合のみ、メッセージを変更
	//（合計取引先は、基本情報から郵便番号と電話番号を登録できない）
	if SumKbn <> 0 then
	begin
		lvMsg2	:=  'パスワードに必要な情報が登録されていません。'+
					''#13#10'情報区分-債権情報、債務情報、販売情報-基本情報タブの'+
					''#13#10'郵便番号と電話番号(1)を登録してください。';

    end;


	// 郵便番号チェック（パスワード合成に郵便番号が選択されている場合のみ）
    // iItemkbn 6:郵便番号(下4桁) 7:郵便番号(フル桁)
	if (iItemKbn1 in [6,7]) or (iItemKbn2 in [6,7]) then
    begin
        if	(pTkSiKbn =1) then //得意先
        begin
        	lvBolZip :=  ((f1POSTNO1.Text = '') or (StrToIntDef(f1POSTNO2.Text, 0) = 0));
        end
        else //仕入先
        begin
            lvBolZip :=  ((f1POSTNO1_Si.Text = '') or (StrToIntDef(f1POSTNO2_Si.Text, 0) = 0));
	    end;

		if lvBolZip then
		begin

			lvWork	:= lvWork + '郵便番号';
		end;
    end;

	// 電話番号チェック（パスワード合成に電話番号が選択されている場合のみ）
    // iItemkbn 8:電話番号(下4桁) 9:電話番号(フル桁)
    if (iItemKbn1 in [8,9]) or (iItemKbn2 in [8,9]) then
    begin
        if	(pTkSiKbn =1) then //得意先
        begin
        	lvBolTel := (Trim(f1TEL1.Text) = '');
        end
        else //仕入先
        begin
            lvBolTel := (Trim(f1TEL1_Si.Text) = '');
	    end;

		if lvBolTel then
		begin
			if lvBolZip then
            begin
				lvWork	:= lvWork + ',';		// 郵便番号も未入力だったらカンマ付与
            end;
			lvWork	:= lvWork + '電話番号(1)';
		end;
    end;

    if lvWork <> '' then
    begin
        if	(pTkSiKbn =1) then //得意先
        begin
        	lvWork :='販売情報（得意先）:' + lvWork;
        end
        else //仕入先
        begin
            lvWork :='販売情報（仕入先）:' + lvWork;
	    end;
    end;

    lvMsg := lvMsg + lvWork;

	Qry := TMQuery.Create(self);
	try
    	m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);
        with Qry do
        begin
            Close;
            Sql.Clear;
            if	(pTkSiKbn = 1) then //得意先
            begin
                lvSQL := ' Select BaseNCode, ISNULL(PostNo1,0) as PostNo1, ISNULL(PostNo2,0) as PostNo2, ISNULL(Tel1,'''') as Tel1 '+
                         ' From MTOKUI_CRD '+
                         ' WHERE BaseNCode = :NCODE  ';
            end
            else //仕入先
            begin
                lvSQL := ' Select BaseNCode, ISNULL(PostNo1,0) as PostNo1, ISNULL(PostNo2,0) as PostNo2, ISNULL(Tel1,'''') as Tel1 '+
                         ' From MTOKUI_PAY '+
                         ' WHERE BaseNCode = :NCODE  ';
            end;
            Sql.add(lvSQL);

            ParamByName('NCODE').AsFloat := uvNCODE;
            Open();
            PostNo1_CRDPAY	:= GetFld('POSTNO1').AsInteger;
            PostNo2_CRDPAY	:= GetFld('POSTNO2').AsInteger;
            Tel1_CRDPAY	:= GetFld('TEL1').AsString;
        end;
	finally
    	Qry.Close;
    	Qry.Free;
    end;

    lvWorkSK := '';

	// 郵便番号チェック（パスワード合成に郵便番号が選択されている場合のみ）
    // iItemkbn 6:郵便番号(下4桁) 7:郵便番号(フル桁)
    if (iItemKbn1 in [6,7]) or (iItemKbn2 in [6,7]) then
    begin
        lvBolZip_CRDPAY :=  ((PostNo1_CRDPAY = 0) or (PostNo2_CRDPAY = 0));

		if lvBolZip_CRDPAY then
		begin
			lvWorkSK	:= lvWorkSK + '郵便番号';
		end;
    end;

	// 電話番号チェック（パスワード合成に電話番号が選択されている場合のみ）
    // iItemkbn 8:電話番号(下4桁) 9:電話番号(フル桁)
    if (iItemKbn1 in [8,9]) or (iItemKbn2 in [8,9]) then
    begin
        lvBolTel_CRDPAY := (Tel1_CRDPAY = '');

		if lvBolTel_CRDPAY then
		begin
			if lvBolZip_CRDPAY then
            begin
				lvWorkSK	:= lvWorkSK + ','		// 郵便番号も未入力だったらカンマ付与
            end;
			lvWorkSK	:= lvWorkSK + '電話番号';
		end;
    end;

    if lvWorkSK <> '' then
    begin
        if	(pTkSiKbn =1) then
        begin
            lvWorkSK :='債権情報　　　　　:' + lvWorkSK;
        end
        else
        begin
            lvWorkSK :='債務情報　　　　　:' + lvWorkSK;
        end;

        if lvWork <> '' then
        begin
            lvWorkSK := #13#10 + lvWorkSK;
        end;
    end;

    lvMsg := lvMsg + lvWorkSK;

	// 販売情報、債権情報、債務情報に未入力ありの場合はメッセージを表示
	if (lvBolZip) or (lvBolTel) or (lvBolZip_CRDPAY) or (lvBolTel_CRDPAY) then
	begin
        if (PostNo1 = 0) or (PostNo2 = 0) or (Tel1 = '') then   //取引先基本情報:郵便番号、電話番号未入力
        begin
            MjsMessageBoxEx(Self, lvMsg2, '警告', mjWarning, mjOK, mjDefOK);
            Result := True;
            Exit;
        end
        else
        begin
            if MjsMessageBoxEx(Self, lvMsg, '確認', mjInformation, mjYesNo, mjDefYes) <> mrYes then
            begin
                if lvBolZip then
                begin
                    MTab1.Items.Selected := 0;
				    if	(pTkSiKbn =1) then //得意先
				    begin
						MjsSetFocus(Self, f1POSTNO1.Name);
				    end
				    else //仕入先
				    begin
						MjsSetFocus(Self, f1POSTNO1_Si.Name);
				    end;
                    Result := True;
                    Exit;
                end
                else if lvBolTel then
                begin
                    MTab1.Items.Selected := 0;
				    if	(pTkSiKbn =1) then //得意先
				    begin
						MjsSetFocus(Self, f1TEL1.Name);
				    end
				    else //仕入先
				    begin
						MjsSetFocus(Self, f1TEL1_Si.Name);
				    end;
                    Result := True;
                    Exit;
                end;
				Result := True;
            	Exit;
            end
            else
            begin
                if lvBolZip then
                begin
                    if	(pTkSiKbn =1) then //得意先
                    begin
                        f1POSTNO1.Value := PostNo1;
                        f1POSTNO2.Value := PostNo2;
                    end
                    else //仕入先
                    begin
                        f1POSTNO1_Si.Value := PostNo1;
                        f1POSTNO2_Si.Value := PostNo2;
                    end;
                end;

                if lvBolTel then
                begin
                    if	(pTkSiKbn =1) then //得意先
                    begin
						f1TEL1.Text		:= Tel1;
                    end
                    else //仕入先
                    begin
						f1TEL1_Si.Text	:= Tel1;
                    end;
                end;

               if (lvBolZip_CRDPAY) or (lvBolTel_CRDPAY) then  //債権・債務情報　郵便番号or電話番号未入力
               begin
                    Qry := TMQuery.Create(self);
                    try
                        m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);
                        try
                            with Qry do
                            begin
                                Close;
                                Sql.Clear;
                                if	(pTkSiKbn =1) then
                                begin
                                    lvSQL := 'Update MTOKUI_CRD Set ';
                                end
                                else
                                begin
                                    lvSQL := 'Update MTOKUI_PAY Set ';
                                end;

                                if lvBolZip_CRDPAY then
                                begin
                                    lvSQL := lvSQL + 'PostNo1 = :PostNo1, PostNo2 = :PostNo2 ';
                                end;

                                if lvBolTel_CRDPAY then
                                begin
                                    if lvBolZip_CRDPAY then
                                    begin
                                        lvSQL := lvSQL + ',';
                                    end;
                                    lvSQL := lvSQL + 'Tel1 = :Tel1 ';
                                end;
                                lvSQL := lvSQL + 'WHERE BaseNCode = :NCODE';

                                Sql.add(lvSQL);

                                ParamByName('NCODE').AsFloat := uvNCODE;

                                if lvBolZip_CRDPAY then
                                begin
                                    SetFld('PostNo1').AsInteger  := PostNo1;  // MTOKUI 〒・前
                                    SetFld('PostNo2').AsInteger  := PostNo2;  // MTOKUI 〒・後
                                end;

                                if lvBolTel_CRDPAY then
                                begin
                                    SetFld('Tel1').AsString  := Tel1;  // MTOKUI 電話番号(1)
                                end;

                                ExecSQL();
                        	end;
                        except
                            if	(pTkSiKbn = 1) then
                            begin
                                showmessage('DBの更新に失敗しました。'#13#10'取引先登録 - 債権情報から郵便番号と電話番号を登録してください。');
                            end
                            else
                            begin
                                showmessage('DBの更新に失敗しました。'#13#10'取引先登録 - 債務情報から郵便番号と電話番号を登録してください。');
                            end;
                        end;
                    finally
                        Qry.Close;
                        Qry.Free;
                    end;
               end;
               Result := False; //取引先基本情報の内容をコピー後はFalseを返す（False:郵便番号と電話番号が入力されている状態）
            end;
        end;
	end;
end;


//******************************************************************************
// Process : 請求先/取引先コード半角カナチェック
// Param : ChkText : 対象文字列
// Result : True(半角カタカナあり） or False（なし）
// Author : 星野 瑠惟
// Date : 2021/12/08(Wed)
// Note : MLのSelCommonより流用
//
//******************************************************************************
function TFrmJNTCRP004004F.fnPWITEMChkCode(pTkSiKbn:Integer; iItemKbn1: Integer; iItemKbn2: Integer): Boolean;

var
	lvMsg		: String;
    lvBolSeiCode,
    lvBolGCode		: Boolean;
	lvSQL		: String;
	Qry			: TMQuery;
	GCode		: String;

begin
	Result 	:= False;

	lvBolSeiCode 	:= False;
	lvBolGCode 	:= False;

	lvMsg	:=  'コードに半角カタカナが含まれているため、'#13#10'パスワードとして登録できません';

	// 請求先コードチェック（パスワード合成に請求先コードが選択されている場合のみ）
    // iItemkbn 2:請求先コード(下4桁) 3:請求先コード(フル桁)
    if (iItemKbn1 in [2,3]) or (iItemKbn2 in [2,3]) then
    begin
        Qry := TMQuery.Create(self);
        try
            m_pMDataModule.SetDBInfoToQuery(dbCorp_Select, Qry);
            with Qry do
            begin
                Close;
                Sql.Clear;

                lvSQL := ' Select seikyu.GCode as GCode, sel.SeiNCode as SeiNCode, sel.BaseNCode as BaseNCode, sel.RecKbn as RecKbn '+
                         ' From MTOKUI_SEL sel '+
                         ' left Outer Join MTOKUI seikyu on (sel.SeiNCode = seikyu.NCode) '+
                         ' WHERE BaseNCode = :NCODE ';

                if	(pTkSiKbn =1) then
                begin
                    lvSQL := lvSQL + 'And sel.RecKbn = 1';
                end
                else
                begin
                    lvSQL := lvSQL + 'And sel.RecKbn = 2';
                end;
                Sql.add(lvSQL);

                ParamByName('NCODE').AsFloat := uvNCODE;
                Open();

                GCode := GetFld('GCode').AsString;
            end;
        finally
            Qry.Close;
            Qry.Free;
    	end;

        if gfnHasHankKana(GCode) then
        begin
            lvBolSeiCode 	:= True;
            lvMsg	:= '請求先' + lvMsg;

        end;

    end;

	// 取引先コードチェック（パスワード合成に取引先コードが選択されている場合のみ）
    // iItemkbn 4:取引先コード(下4桁) 5:取引先コード(フル桁)
    if (iItemKbn1 in [4,5]) or (iItemKbn2 in [4,5]) then
    begin
        GCode := f0CODE.Text;

        if gfnHasHankKana(GCode) then
        begin
            if lvBolSeiCode then
            begin
                lvMsg	:= ',' + lvMsg;
            end;
            lvBolGCode 	:= True;
            lvMsg	:= '取引先' + lvMsg;
        end;

    end;

	// 半角カナありの場合はメッセージ表示
	if (lvBolSeiCode) or (lvBolGCode) then
	begin
    	MjsMessageBoxEx(Self, lvMsg, '警告', mjWarning, mjOK, mjDefOK);
        Result := True;
	end;

end;


//******************************************************************************
// Process : 対象文字列に半角カタカナを含んでいるかチェックする
// Param : ChkText : 対象文字列
// Result : True(半角カタカナあり） or False（なし）
// Author : 星野 瑠惟
// Date : 2021/12/08(Wed)
// Note : MLのSelCommonより流用
//
//******************************************************************************

function TFrmJNTCRP004004F.gfnHasHankKana(ChkText:String):Boolean;
var
	matches: TMatchCollection;
begin
	//正規表現によるマッチコレクションを取得し、そのカウントで判定
	//コレクションの各要素を確認するにはTMatce変数で受け取る。
	matches := TRegEx.matches(ChkText, '[ｦ-ﾟ]');
	Result := (matches.Count > 0);
end;
//<PASS>add E

end.


