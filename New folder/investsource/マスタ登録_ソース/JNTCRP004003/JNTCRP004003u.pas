//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登録　債権情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.03.22(TUE)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <   >   茂木 勇次   2005/04/21(THU) FX-STYLE対応("FX_"削除)
//  <   >   茂木 勇次   2005/04/21(THU) JNTﾗｲﾌﾞﾗﾘ対応
//  <   >   茂木 勇次   2005/05/09(MON) FX-STYLEのDESIGN対応
//  <100>   井上 佳美   2005/07/15(FRI) ﾃﾝﾌﾟﾚｰﾄ機能を追加
//  <101>   井上 佳美   2005/07/25(MON) 販売ｽﾄｱﾄﾞﾌﾟﾛｼｼﾞｬ系を追加
//  <102>   井上 佳美   2005/08/01(MON) 権限を追加
//  <103>   井上 佳美   2005/08/02(THU) ﾗｲｾﾝｽの制御を追加（販売のﾗｲｾﾝｽありの場合は、管理情報を非表示）
//  <104>   井上 佳美   2005/08/12(FRI) JNTCommonを親から引き継ぐように修正
//  <105>   高橋 功二   2005/08/24(WED) TMJSAppRecordを親から引き継ぐように修正
//  <106>   高橋 功二   2005/08/25(THU) 請求書ﾌｫｰﾑは常に入力可
//  <107>   高橋 功二   2005.08.25(THU) ﾃﾝﾌﾟﾚｰﾄ区分(TemplateKbn)の考慮
//  <PRN>   茂木 勇次   2008.08.26(FRI) 印刷機能の追加。
//  <108>   高橋 功二   2005/08/31(WED) 郵便番号DLGを住所上段からも使用可能にする
//  <109>   高橋 功二   2005/09/06(TUE) 印刷機能の正式実装まで印刷ﾎﾞﾀﾝをDiableする
//  <110>   高橋 功二   2005/09/13(TUE) 細目科目がﾌﾘｰ属性の場合、禁則文字入力を考慮する。
//  <111>   高橋 功二   2005/09/18(SUN) 代替得意先の存在ﾁｪｯｸを修正
//  <112>   高橋 功二   2005/09/18(SUN) 代替得意先の設定、解除を行ったときの不具合修正
//  <113>   高橋 功二   2005/09/21(WED) 名寄せの締日ﾁｪｯｸ、請求区分ﾁｪｯｸ等追加
//  <114>   高橋 功二   2005/09/22(THU) 親得意先の締日情報をｾｯﾄ、実績ﾏｽﾀの作成処理追加
//  <115>   高橋 功二   2005/09/22(THU) 親子ﾌﾗｸﾞ変更処理追加
//  <116>   高橋 功二   2005/09/22(THU) 他の合計得意先の代替になっている場合は指定できない
//  <117>   高橋 功二   2005/09/24(SAT) 名寄せの子に設定しようとした得意先に実績が存在している場合は
//                                      名寄せ設定不可とする
//                                      (親の実績を作成する場合に_103を実行するがその時に子の実績も
//                                       再作成されてしまう為）
//  <118>   高橋 功二   2005/09/25(SUN) 登録済の代替得意先に入金が発生した場合は変更不可とする
//  <119>   高橋 功二   2005/09/25(SUN) 合計取引先の子に入金が発生しているかﾁｪｯｸ
//  <120>   茂木 勇次   2005/09/28(WED) 切出/埋込ﾎﾞﾀﾝを継承し、子側で処理を行う。
//  <121>   飯塚 健介   2005/10/12(WED) mtokui_sel.Oyakoflgに関する更新条件及び更新方法の修正
//  <122>   飯塚 健介   2005/10/21(FRI) 0ｺｰﾄﾞ入力可能
//  <123>   飯塚 健介   2005/10/21(FRI) 各種ﾌｨｰﾙﾄﾞﾁｪｯｸ対応
//  <124>   加藤(PRIME) 2005/10/27(THU) 削除ﾒｯｾｰｼﾞ変更
//  <125>   加藤(PRIME) 2005/11/04(FRI) 名寄せｸﾞﾘｯﾄﾞで数値属性でも文字が入力できた
//  <126>   加藤(PRIME) 2005/11/22(TUE) EDIﾗﾍﾞﾙ名称の変更、選択肢の変更
//  <127>   加藤(PRIME) 2005/11/22(TUE) 合計得意先のﾏｯﾁﾝｸﾞ情報は非表示にする
//  <128>   加藤(PRIME) 2005/11/28(MON) 履歴用ｽﾄｱﾄﾞ呼び出し
//	<HAN>   広田(PRIME) 2005/12/08(THU) 印刷時の範囲指定修正
//  <129>   加藤(PRIME) 2005/12/21(WED) 登録・更新権限がないときに更新ﾎﾞﾀﾝを無効、ｸﾞﾘｯﾄﾞ初期表示をRowSelectに
//  <130>   加藤(PRIME) 2005/12/21(WED) 登録・更新権限がないときにF7ﾃﾝﾌﾟﾚｰﾄ押下でｱｸｾｽｴﾗｰになる不具合修正
//  <131>   青木(PRIME) 2005/12/22(THU) 同一名寄せ親の時、2番目以降出力しないよう対応
//  <132>   飯塚 健介   2006/01/20(FRI) 休日区分の異なる取引先で名寄せの登録が行えてしまう件について対応
//  <133>   茂木 勇次   2006/02/07(TUE) 未対応帳票の作成。
//  <134>   茂木 勇次   2006/02/08(WED) 評価ﾚﾎﾟｰﾄ(SHH14-020)対応。
//  <135>   茂木 勇次   2006/02/08(WED) 別のﾀﾌﾞに入力ｴﾗｰがある状態で、更新ﾎﾞﾀﾝを押下すると「無効/非表示ｳｨﾝﾄﾞｳには
//                                      ﾌｫｰｶｽを設定できません」のｴﾗｰが発生する不具合対応。
//  <136>   茂木 勇次   2006/02/08(WED) 評価ﾚﾎﾟｰﾄ(SHK03-046)対応。
//  <137>   茂木 勇次   2006/02/08(WED) 評価ﾚﾎﾟｰﾄ(SHK03-047)対応。
//  <138>   川畑@MSI    2006/06/14(WED) 債権管理5次対応
//  <139>   川畑@MSI    2006/07/31(MON) 債権管理5次対応(追加分)
//  <140>   川畑@MSI    2006/08/18(FRI) 債権管理5次対応(追加分)
//  <141>   川畑@MSI    2006/09/01(FRI) 債権管理5次対応(追加分)
//  <142>   吉澤(MJS)	2006/11/22(WED) 神鋼物流要望対応
//  <143>   吉澤(MJS)   2006/11/22(WED) 販売伝票が存在する場合の名寄せ親変更ガード
//  <144>   吉澤(MJS)　 2007/02/16(FRI) 部門・担当者の登録
//  <145>	吉澤(MJS)　 2007/04/20(FRI)	コンバートデータ等でMTOKUI_CRDが存在しない場合の対応
//										MTOKUI_CRDが存在しない場合はINSERTする。
//  <146>   吉澤(MJS)　 2007/05/18(FRI) 得意先・担当者の検索エクスプローラの修正
//  <Rel>   吉澤(MJS)   2007/05/25(FRI) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <147>   吉澤(MJS)　 2007/06/01(FRI)  決算確定済みの場合の制御（次へ・前へ・削除ボタンの使用不可）
//  <148>   吉澤(MJS)　 2007/06/27(WED)  回収方法入力の債権・債務共通化対応
//  <149>   吉澤(MJS)　 2007/08/01(THU)  テンプレート追加対応
//  <150>   吉澤(MJS)　 2007/08/24(FRI)  削除権限があっても修正権限がないと削除できなかった不具合の対応
//  <151>   吉澤(MJS)　 2007/08/30(THU)  名寄せを削除するとグリッドの先頭にフォーカスが移動しないように対応
//  <152>   吉澤(MJS)　 2007/11/19(MON) テンプレートの時に「前へ(L)」ボタンからSHIFT+TABでキー移動できない点の修正
//  <153>   吉澤(MJS)　 2007/11/19(MON) テンプレートで非対象項目は、グレー表示
//  <154>   佐藤(IDC)　 2008/01/08(TUE) テンプレート登録時にＤＢのデフォルト値も更新
//	<155>	佐藤(IDC)	2008/02/06(WED)	マスタ更新履歴対応
//  <156>   吉澤(MJS)　 2008/04/17(THU) カナ2・3の対応
//  <157>   吉澤(MJS)　 2008/04/17(THU) 締日制限の対応
//  ver206
//  <158>   吉澤(MJS)　                 複数同一部門コードの対応
//  VER301------------------------
//  <159>   吉澤(MJS)   2009/01/16      個別<142>に、実績存在していても名寄せ可を追加
//  <160>   吉澤(MJS)   2009/01/29      回収予定データが存在する場合は、名寄せ解除不可
//  Ver400------------------------
//  <161>   吉澤(MJS)   2010/04/09      回収予定データ・入金データが存在する場合は、名寄せ登録・名寄せ解除不可
//  <162>   吉澤(MJS)   2010/04/19      fnDeleteNknNayoseInfoの終了時にクエリのCLOSEとFREEを追加
//  <163>   吉澤(MJS)   2010/05/21      名寄せ得意先で絞込み ***正式リリースは401***
//  <164>   吉澤(MJS)   2010/05/21      MLBplLoader対応(LoadPackageの置き換え)
//  <165>   吉澤(MJS)   2010/06/02      名寄せ得意先の分類登録コピー不具合修正
//  Ver403------------------------
//  <166>   吉澤(MJS)   2010/10/13      名寄せ得意先の検索EXPで外部コード0の取得時の問題修正（INPUTFLAGをFALSEに設定）
//  <167>   吉澤(MJS)   2010/11/13      回収予定が存在する得意先を代替得意先に選択した場合、EXIT時点でエラーを表示するように修正
//  Ver405------------------------
//  <168>   吉澤(MJS)   2011/04/14      同一外部コードの部門がある場合は、適用期間の新しいマスタを取得する。
//  Ver406------------------------
//  <169>   吉澤(MJS)   2011/06/13      名寄せ追加・削除の回収予定データ、入金データのチェックSQLの修正
//  <170>   吉澤(MJS)   2011/08/03      グリッドで名寄せ変更時に回収予定データ、入金データのチェック

//  Ver408------------------------
//  <171>   吉澤(MJS)   2012/02/06      敬称区分がなしの場合に空白に置き換えていた箇所をコメント化 <RGF-0037>
//  <KST>   吉澤(MJS)   2012/02/06      MJSKeyDataToShiftState対応
//  <Gali2258> 吉澤(MJS)2012/02/06   　起動時エラー修正対応（取引先マスタ共通の修正）
//  <172>   吉澤(MJS)   2012/02/13     名寄せ登録チェックのタイミング見直し＆スピードアップ
//  Ver409------------------------
//  <Authority> 吉澤  2012.06.22(Fri) サブモジュールの権限管理対応
//  <DENSHI> 小川(LEAD) 2012.07.11(WED) 電子記録債権対応
//  Ver505------------------------
//  <173>   小川(LEAD)  2012.10.17(WED) 入金情報タブの回収方法パネルから電子記録債権情報タブにクリックするとフォーカスエラーが発生する不具合対応
//  <Account> 小川(LEAD)2012.11.16(FRI) 口座振替情報対応
//  <KEY>                               CMChildKeyでカーソルキーの場合は、Tabコンポーネントの制御は行わない対応。(コンポーネントに任せる)
//  <174>   小川(LEAD)  2013.02.26(TUE) テンプレート時、入金情報タブのコンポーネントは一部登録可能とする。
//                                      【対象のコンポーネント】
//                                      手数料負担区分、EDI・仮想口座区分、EDI・仮想口座情報
//  <175>   吉澤(MJS)   2013/04/30     保健科学対応（各店別請求一括入金）
//                                      ・親一括請求一括入金の文言を各店別請求一括入金に変更する（印刷・CSVも）
//  <176>   吉澤(MJS)   2013/04/30     債権の名寄せ可否チェックをストアド化
//  <177>   吉澤(MJS)   2013/08/06     <174>の修正（テンプレートがDB更新されない件）
//  <178>   小川(LEAD)  2013/10/21     テンプレート時、入金情報タブで「次へ」ボタンが有効になっている不具合対応
//  <GAIKA> 小川(LEAD)  2013/12/13     外貨債権対応
//  Ver506------------------------
//  <179>   吉澤(MJS)   2014/04/04      取引先16ケタ対応
//                                      ・MemDataのGCODEのサイズ10→20
//                                      ・長体設定
//                                       f0CODE（得意先コード）
//                                       f1NayoseOyaCode（代替親）
//                                       f2OyaCode（名寄せ登録親）
//  Ver507------------------------
//  <GFB>   小川(LEAD)  2014/12/04     外貨FB対応
//                                     ついでに口座振替情報の登録がないときの制御を変更
//  <180>                              共通クラスに関する修正
//  <181>                              口座振替グループNoが不正な場合の挙動がおかしい点の修正
//  <GFB2>  小川(LEAD)  2015/07/13     外貨FB対応(送金依頼人名称登録リスト)
//  <182>                              「採用なし」に変更しても送金依頼人名称は消さないようにする
//  Ver510------------------------
//  <183>   小田(MJS)   2015/10/14		利用者番号とお客様番号のドロップダウンリストが昇順にソートされていない点の修正
//  <184>   小田(MJS)   2015/10/21      Jemcoのお客様番号に数字以外が入る点の修正
//                                      ・f1NumNameKeyイベントを追加
//                                      ・MTJemcoUserID1のOnKeyPressイベントをf1NumNameKeyに変更
//                                      ・MTJemcoUserID2のOnKeyPressイベントをf1NumNameKeyに変更
//                                      ・お客様番号4桁および7桁の数値以外が入力されている場合の考慮追加
//  ------------------------------
//  <185>   川畑(MSI)   2018/10/04      カナ名称の利用可能文字種にアスタリスクを追加(全銀協EDI対応)
//  <186>   川畑(MSI)   2018/12/19      支店コードに000が指定できない不具合を修正
//
//  <PASS>  星野(MJS)   2021/12/08      PDF分割出力対応 パスワード合成に関する考慮を追加
//  <187>   川畑(MSI)   2021/12/21      複数口座対応
//  <188>   川畑(MSI)   2022/03/30      終了時の変更確認のチェックで複数口座対応の考慮もれを修正
//=============================================================================


unit JNTCRP004003U;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.ExtCtrls,  ComCtrls, VCL.ImgList, VCL.StdCtrls,  dxGrClms, dxTL, dxDBGrid,
  dxCntner, FireDAC.Comp.Client, Db, dxmdaset, Menus, ToolWin, CommCtrl,contnrs,
  Variants,

  { MJS専用ｺﾝﾎﾟｰﾈﾝﾄ }
  MJSLabel,
  MJSEdits,
  MJSMemo,
  MJSPanel,
  MJSPageControl,
  MJSTab,
  MJSGroupBox,
  MJSComboBox,
  MJSCheckBox,
  MJSQuery,
  MJSBitBtn,
  MJSSpeedButton,   // <120>

  { MJS専用ﾓｼﾞｭｰﾙ }
  MJSDBModuleu,
  MJSCommonu,
  MjsCommon2u,
  MJSMsgStdu,
  MJSDispCtrl,
  MJSDateCtrl,
  MJSPreviewIFu,
  MjsPrnSupportu,
  MjsPrnDlgu,
  CMNExpFuncU,
  MjsStrCtrl,
  MJSKeyDataState, //<KST>
  FXPerms,


  { LEAD-SEL_TEAM専用}
  JNTSelDModul,
  JNTSelGlobal,
  JNTSelGlobalConst,
  JNTSelCorpSys,


  { 共通ﾏｽﾀﾓｼﾞｭｰﾙ }
  JNTCommonu,
  JNTMasComu,
  JNTMasWndIFu,
  JNTMasTreee2Dlgu,
  JNTFuncU, ActnList, MJSStatusBar, MJSFunctionBar, MJSSPFunctionBar,
  FXLicense,
  JNTExpGlobal,
  MLBplLoaderU, //<164> ADD
  JNTAuthorityu,// <Authority> ADD
  JNTPDlg,IniFiles, // <PRN>

  { Myユニット}
  JNTCRP004003_Commonu,
  JNTCRP004003_DensaiInfou,
  JNTCRP004003_AccountInfou, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  SeriesCheck3u,//<PASS>
  System.Actions;


type
  {$include ActionInterface.inc}
  {$include MasCommonFuncH.inc}
  {$include JNTSelPrtIF.inc}              // <PRN>
  {$include JNTCRPSyncMasterH.inc}        // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP004003F = class(TForm)
    ScrollBox_Main: TScrollBox;
	DSrcTanka: TDataSource;
	DMemRitu: TdxMemData;
	DMemRituRitu: TStringField;
	DMemRituTaxRitu: TFloatField;
	DSrcRitu: TDataSource;
	KanaAdd1: TMFurigana;
	KanaAdd2: TMFurigana;
	DMemRituFieldName: TStringField;
	DMemRituTableName: TStringField;
    DtlCsMainPanel: TMPanel;
    PnlButton: TMPanel;
    MBitBtnUpd: TMBitBtn;
    MBitBtnCancel: TMBitBtn;
    HedCsTab: TMTab;
    HedPanel: TMPanel;
    LblTRCODE: TMLabel;
    f0CODE: TMTxtEdit;
    f1NAME: TMTxtEdit;
    DtlCsSub01Panel: TMPanel;
    DtlCsTab: TMTab;
    tbsKihon: TMPanel;
    tbsNyukin: TMPanel;
    MLabel4: TMLabel;
    DSNayose: TDataSource;
    MemNayose: TdxMemData;
    MemNayoseHojCode: TStringField;
    MemNayoseBaseHojCode: TStringField;
    MemNayoseSName: TStringField;
    MemNayoseOyaHojCD: TStringField;
    MemNayoseOyaBaseHojCD: TStringField;
    MemNayoseOyaName: TStringField;
    MemNayoseOyaNCode: TFloatField;
    MLabel2: TMLabel;
    MLabel8: TMLabel;
    MLabel18: TMLabel;
    MLabel1: TMLabel;
    f1Bunkai: TMNumEdit;
    f1BunkaiNM: TMLabel;
    MemNayoseNknNCode: TFloatField;
    DtlCsSub02Panel: TMPanel;
    GridNayose: TdxDBGrid;
    GridNayoseOyaCode: TdxDBGridButtonColumn;
    GridNayoseOyaName: TdxDBGridColumn;
    GridNayoseCode: TdxDBGridButtonColumn;
    GridNayoseName: TdxDBGridColumn;
    MPanel3: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    CmnStatusBar: TMStatusBar;
    aclExec: TActionList;
    AcTemplate: TAction;


    TempMode: TPanel;
    AddPanel: TScrollBox;
    MLabel15: TMLabel;
    LblYUBIN: TMLabel;
    DtlCs1LabelTelephoneNoTitle: TMLabel;
    DtlCs1LabelPostNameTitle: TMLabel;
    DtlCs1LabelChargeNameTitle: TMLabel;
    MLabel16: TMLabel;
    LblJUSHO1: TMLabel;
    Label2: TMLabel;
    f1ADS1: TMTxtEdit;
    f1ADS2: TMTxtEdit;
    f1TEL1: TMTxtEdit;
    f1SectionName: TMTxtEdit;
    f1TanNm: TMTxtEdit;
    f1POSTNO1: TMNumEdit;
    f1POSTNO2: TMNumEdit;
    f1MailAd: TMTxtEdit;
    f1KEISYO: TMTxtEdit;
    SKPanel: TMPanel;
    StdProc3: TFDStoredProc;
    MemNayoseUsKinKbn: TIntegerField;
    StdProc6: TFDStoredProc;
    StdProc5: TFDStoredProc;
    PnlKanri: TMPanel;
    PnlUri: TMPanel;
    PnlRyosyu: TMPanel;
    MLabel25: TMLabel;
    MLabel30: TMLabel;
    f1RYOPFM: TMNumEdit;
    f1RYOPFMNM: TLabel;
    MLabel31: TMLabel;
    f1RYOTEKI: TMNumEdit;
    f1RYOTEKINM: TLabel;
    MLabel32: TMLabel;
    f1SYURYOKBN: TMNumEdit;
    f1SYURYOKBNNM: TLabel;
    MLabel22: TMLabel;
    StdProc4: TFDStoredProc;
    PMatching: TMPanel;
    MLabel5: TMLabel;
    MLf1KanaName1: TMLabel;
    f1KanaName1: TMTxtEdit;
    MLf1TesuryoFutan: TMLabel;
    f1TesuryoFutan: TMNumEdit;
    f1TesuryoFutanNm: TMLabel;
    MLf1Ku: TMLabel;
    f1Ku: TMNumEdit;
    f1KuNm: TMLabel;
    LblDefoltEDI: TMLabel;
    f1DefoltEDI: TMTxtEdit;
    MLabel6: TMLabel;
    Image_Fusen_Red: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Glay: TImage;
    MBitBtnBefor: TMBitBtn;
    MBitBtnAfter: TMBitBtn;
    MLabel17: TMLabel;
    MLabel20: TMLabel;
    PnlNayoseInfo: TMPanel;
    NayoseOyaLabel: TMLabel;
    f1NayoseNM: TMLabel;
    cbNykRootKbn: TMCheckBox;
    f1NayoseOyaCode: TMTxtEdit;
    SeikyuKbnLabel: TLabel;
    f1SKYKBNNM: TMLabel;
    MLabel35: TMLabel;
    MLabel23: TMLabel;
    MLabel36: TMLabel;
    f1SKYKBN: TMNumEdit;
    KAIJY1Label: TMLabel;
    StdProc7: TFDStoredProc;
    MemNayoseCngNCode: TFloatField;
    MemNayoseNDCode: TStringField;
    MemNayoseNDNAME: TStringField;
    SeikyuKbnLabel2: TLabel;
    SKYKBN2: TMNumEdit;
    SKYKBNNM2: TMLabel;
    NayoseOyaLabel2: TMLabel;
    NayoseOyaCode2: TMTxtEdit;
    NayoseNM2: TMLabel;
    GridNayoseNknNCode: TdxDBGridCurrencyColumn;
    GridNayoseCngNCode: TdxDBGridCurrencyColumn;
    MDPrint: TdxMemData;
    MDPrintFusen: TGraphicField;
    MDPrintGCode: TStringField;
    MDPrintRenso: TStringField;
    MDPrintNmk: TStringField;
    MDPrintNm: TStringField;
    MDPrintPostNo1: TStringField;
    MDPrintPostNo2: TStringField;
    MDPrintTStartDate: TStringField;
    MDPrintTEndDate: TStringField;
    MDPrintUpdDateTM: TStringField;
    MDPrintAds1: TStringField;
    MDPrintAds2: TStringField;
    MDPrintTel1: TStringField;
    MDPrintSectNm: TStringField;
    MDPrintTanNm: TStringField;
    MDPrintKeisyo: TStringField;
    MDPrintMail: TStringField;
    MDPrintMail1: TStringField;
    MDPrintMail2: TStringField;
    MDPrintMail3: TStringField;
    MDPrintBmNCd: TStringField;
    MDPrintBmNm: TStringField;
    MDPrintTnNCd: TStringField;
    MDPrintTnNm: TStringField;
    MDPrintYsGKin: TFloatField;
    MDPrintSite: TFloatField;
    MDPrintUSDenPfm: TIntegerField;
    MDPrintUSDenPfmNm: TStringField;
    MDPrintUSGKei: TIntegerField;
    MDPrintUSGKeiNm: TStringField;
    MDPrintBunkaiKbn: TIntegerField;
    MDPrintBunkaiNm: TStringField;
    MDPrintStdRitu: TFloatField;
    MDPrintStdKin: TFloatField;
    MDPrintJouken1: TIntegerField;
    MDPrintJouken2: TIntegerField;
    MDPrintJouken1Nm: TStringField;
    MDPrintJouken2Nm: TStringField;
    MDPrintKanaName: TStringField;
    MDPrintTesuryoFutan: TIntegerField;
    MDPrintTesuryoNm: TStringField;
    MDPrintEDIKbn: TIntegerField;
    MDPrintEDINm: TStringField;
    MDPrintDefoltEDI: TStringField;
    MDPrintOyaNCd: TStringField;
    MDPrintOyaNm: TStringField;
    MDPrintnSSsyoPfm: TIntegerField;
    MDPrintnSSsyoPfmNm: TStringField;
    MDPrintnSSsyoKgm: TIntegerField;
    MDPrintnSSsyoKgmNm: TStringField;
    MDPrintnRyoPfm: TIntegerField;
    MDPrintnRyoPfmNm: TStringField;
    MDPrintnRyoTeki: TIntegerField;
    MDPrintnRyoTekiNm: TStringField;
    MDPrintnSyuRyoKbn: TIntegerField;
    MDPrintnSyuRyoKbnNm: TStringField;
    MDPrintnHasuuHou: TIntegerField;
    MDPrintnHasuuHouNm: TStringField;
    MDPrintSeikyuKbn: TIntegerField;
    MDPrintSeikyuKbnNm: TStringField;
    MDPrintNYKRootKbn: TIntegerField;
    MemPtnNayose: TdxMemData;
    MemPtnNayoseHojCode: TStringField;
    MemPtnNayoseBaseHojCode: TStringField;
    MemPtnNayoseSName: TStringField;
    MemPtnNayoseOyaHojCD: TStringField;
    MemPtnNayoseOyaBaseHojCD: TStringField;
    MemPtnNayoseOyaName: TStringField;
    MemPtnNayoseNknNCode: TFloatField;
    MemPtnNayoseOyaNCode: TFloatField;
    MemPtnNayoseCngNCode: TIntegerField;
    MemPtnNayoseSeikyuKbnNm: TStringField;
    MemPtnNayoseREndKaisu: TIntegerField;
    MemPtnNayoseRCloseDay1: TIntegerField;
    MemPtnNayoseRCloseDay1Nm: TStringField;
    MemPtnNayoseRCloseDay2: TIntegerField;
    MemPtnNayoseRCloseDay2Nm: TStringField;
    MemPtnNayoseRCloseDay3: TIntegerField;
    MemPtnNayoseRCloseDay3Nm: TStringField;
    MemPtnNayoseRcvMonth1: TIntegerField;
    MemPtnNayoseRcvMonth1Nm: TStringField;
    MemPtnNayoseRcvMonth2: TIntegerField;
    MemPtnNayoseRcvMonth2Nm: TStringField;
    MemPtnNayoseRcvMonth3: TIntegerField;
    MemPtnNayoseRcvMonth3Nm: TStringField;
    MemPtnNayoseRcvDay1: TIntegerField;
    MemPtnNayoseRcvDay1Nm: TStringField;
    MemPtnNayoseRcvDay2: TIntegerField;
    MemPtnNayoseRcvDay2Nm: TStringField;
    MemPtnNayoseRcvDay3: TIntegerField;
    MemPtnNayoseRcvDay3Nm: TStringField;
    MemPtnNayoseRHolidayKbn1: TIntegerField;
    MemPtnNayoseRHolidayKbn1Nm: TStringField;
    MemPtnNayoseRHolidayKbn2: TIntegerField;
    MemPtnNayoseRHolidayKbn2Nm: TStringField;
    MemPtnNayoseRHolidayKbn3: TIntegerField;
    MemPtnNayoseRHolidayKbn3Nm: TStringField;
    MemPtnNayoseDaitaiMark: TStringField;
    MemPtnNayosePageEnd: TIntegerField;
    MGroupBox1: TMGroupBox;
    LblUSDENPFM: TMLabel;
    f1USDENPFM: TMNumEdit;
    f1USDENPFMNM: TMLabel;
    LblUSGKEI: TMLabel;
    f1USGKEI: TMNumEdit;
    f1USGKEINM: TMLabel;
    Label1: TLabel;
    f1SSDENPFM: TMNumEdit;
    f1SSDENPFMNM: TMLabel;
    f1SSGKEINM: TMLabel;
    f1SSGKEI: TMNumEdit;
    MLabel29: TMLabel;
    KJPanel: TMPanel;
    MLabel39: TMLabel;
    MLabel40: TMLabel;
    LblBMCODE: TMLabel;
    f1BMCODE: TMTxtEdit;
    f1BMNAME: TMLabel;
    f1TNNAME: TMLabel;
    f1TNCODE: TMTxtEdit;
    LblTNCODE: TMLabel;
    MLabel34: TMLabel;
    MLabel21: TMLabel;
    MLabel14: TMLabel;
    PkaisyuHouhou: TMPanel;
    MLabel37: TMLabel;
    MLabel33: TMLabel;
    MLabel38: TMLabel;
    MLabel41: TMLabel;
    f1KAIJY1: TMNumEdit;
    f1KAIJY2: TMNumEdit;
    f1KAIJYNM1: TMLabel;
    f1KAIJYNM2: TMLabel;
    MLabel42: TMLabel;
    MLabel43: TMLabel;
    f1KAIHasu: TMNumEdit;
    f1KAIHasuNM: TMLabel;
    f1KAISYWKIN: TMNumEdit;
    MLabel7: TMLabel;
    f1KAIRITU: TMNumEdit;
    kijyun1Label: TMLabel;
    kijyun2Label: TMLabel;
    KAIJY2Label: TMLabel;
    YSNPanel: TMPanel;
    MLabel19: TMLabel;
    f1YSGKIN: TMNumEdit;
    MLabel3: TMLabel;
    Label4: TLabel;
    f1TGSITE: TMNumEdit;
    Label11: TLabel;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;
    f1KanaName2: TMTxtEdit;
    f1KanaName3: TMTxtEdit;
    MLf1KanaName2: TMLabel;
    MLf1KanaName3: TMLabel;
    AcCloseDay: TAction;
    MDPrintKanaName2: TStringField;
    MDPrintKanaName3: TStringField;
    f2OyaCode: TMTxtEdit;
    MLabel24: TMLabel;
    f2OyaName: TMLabel;
    f2KoCode: TMTxtEdit;
    MLabel27: TMLabel;
    f2KoName: TMLabel;
    MLabel26: TMLabel;
    MLabel28: TMLabel;
    tbsDenshiSaiken: TMPanel;
    Memo1: TMemo;
    MPDensaiKirokukikanInfo: TMPanel;
    MLabel47: TMLabel;
    MLDenDataKbn: TMLabel;
    MNDenDataKbn: TMNumEdit;
    MLDenDataKbnName: TMLabel;
    MLabel45: TMLabel;
    MPDensaiCsInfo: TMPanel;
    MLDensaiCsInfo: TMLabel;
    lblAccKbnName_Denshi: TMLabel;
    MPJemcoCsInfo: TMPanel;
    MLJEMCOCsInfo: TMLabel;
    MLJemcoUserID1: TMLabel;
    MTJemcoUserID1: TMTxtEdit;
    MLJemcoUserID2: TMLabel;
    MTJemcoUserID2: TMTxtEdit;
    MLComment_4keta: TMLabel;
    MLabel11: TMLabel;
    MLabel9: TMLabel;
    MemPtnDensai: TdxMemData;
    MemPtnDensaiGCode: TStringField;
    MemPtnDensaiLongName: TStringField;
    MemPtnDensaiDenUserID1: TStringField;
    MemPtnDensaiDenUserID2: TStringField;
    MemPtnDensaiDenUserName: TStringField;
    MemPtnDensaiDenCSKanaName: TStringField;
    MemPtnDensaiAllBkCode: TStringField;
    MemPtnDensaiAllBraCode: TStringField;
    MemPtnDensaiBankName: TStringField;
    MemPtnDensaiAccKbn: TIntegerField;
    MemPtnDensaiAccName: TStringField;
    MemPtnDensaiAccNo: TStringField;
    MemPtnDensaiMatchingKey: TStringField;
    tbsAccountInfo: TMPanel;
    pnlAccountHeader: TMPanel;
    MLabel10: TMLabel;
    MLabel12: TMLabel;
    lblKoufuriNo1_Account: TMLabel;
    numKoufuriNo_Account: TMNumEdit;
    pnlAccountDetail: TMPanel;
    MLabel48: TMLabel;
    MLabel49: TMLabel;
    MLabel51: TMLabel;
    numAllBkCode_Account: TMNumEdit;
    numAllBraCode_Account: TMNumEdit;
    MLabel13: TMLabel;
    txtBankName_Account: TMTxtEdit;
    MLabel44: TMLabel;
    txtBranchName_Account: TMTxtEdit;
    MLabel52: TMLabel;
    numAccKbn_Account: TMNumEdit;
    lblAccKbnName_Account: TMLabel;
    MLabel54: TMLabel;
    txtAccNo_Account: TMTxtEdit;
    MLabel46: TMLabel;
    txtUserName_Account: TMTxtEdit;
    MLabel50: TMLabel;
    MLabel53: TMLabel;
    txtFreeFld1_Account: TMTxtEdit;
    MLabel55: TMLabel;
    txtFreeFld2_Account: TMTxtEdit;
    MLabel56: TMLabel;
    txtFreeFld3_Account: TMTxtEdit;
    MLabel57: TMLabel;
    txtFreeFld4_Account: TMTxtEdit;
    MLabel58: TMLabel;
    txtFreeFld5_Account: TMTxtEdit;
    lblKoufuriNo2_Account: TMLabel;
    MemPtnAccount: TdxMemData;
    MemPtnAccountGCode: TStringField;
    MemPtnAccountLongName: TStringField;
    MemPtnAccountKoufuriName: TStringField;
    MemPtnAccountBranchName: TStringField;
    MemPtnAccountUserCode: TStringField;
    MemPtnAccountAllBkCode: TStringField;
    MemPtnAccountAllBraCode: TStringField;
    MemPtnAccountBankName: TStringField;
    MemPtnAccountAccKbn: TIntegerField;
    MemPtnAccountAccName: TStringField;
    MemPtnAccountAccNo: TStringField;
    MemPtnAccountUserName: TStringField;
    MemPtnAccountKoufuriNo: TIntegerField;
    MemPtnAccountCsAccKbn: TIntegerField;
    MemPtnAccountCsAccName: TStringField;
    MemPtnAccountCsAccNo: TStringField;
    MemPtnAccountCsBankName: TStringField;
    MemPtnAccountCsBranchName: TStringField;
    MemPtnAccountFreeFld1: TStringField;
    MemPtnAccountFreeFld2: TStringField;
    MemPtnAccountFreeFld3: TStringField;
    MemPtnAccountFreeFld4: TStringField;
    MemPtnAccountFreeFld5: TStringField;
    MemPtnAccountFreeFld6: TStringField;
    MemPtnAccountFreeFld7: TStringField;
    MemPtnAccountFreeFld8: TStringField;
    MemPtnAccountFreeFld9: TStringField;
    MemPtnAccountFreeFld10: TStringField;
    MLabel59: TMLabel;
    MLabel60: TMLabel;
    txtUserCode_Account: TMTxtEdit;
    StdProcCRD_CHK_NAYOSE: TFDStoredProc;
    StdProcCRD_CHK_NAYOSE2: TFDStoredProc;
    tbsGaikaInfo: TMPanel;
    pnlGaikaHeader: TMPanel;
    MLabel61: TMLabel;
    MLabel62: TMLabel;
    lblSaiyoKbn_Gaika: TMLabel;
    MLabel64: TMLabel;
    numSaiyoKbn_Gaika: TMNumEdit;
    StdProc_Gaika: TFDStoredProc;
    MDPrintGaikaSaiyoKbn: TIntegerField;
    MDPrintGaikaSaiyoKbnNm: TStringField;
    MDPrintGaikaSoukinName1: TStringField;
    MDPrintGaikaSoukinName2: TStringField;
    MDPrintGaikaSoukinName3: TStringField;
    pnlGaikaDetail: TMPanel;
    MLabel69: TMLabel;
    MLabel63: TMLabel;
    MLabel66: TMLabel;
    txtSoukinName1_Gaika: TMTxtEdit;
    MLabel67: TMLabel;
    txtSoukinName2_Gaika: TMTxtEdit;
    MLabel68: TMLabel;
    txtSoukinName3_Gaika: TMTxtEdit;
    MemPtnGaika: TdxMemData;
    MemPtnGaikaGCode: TStringField;
    MemPtnGaikaLongName: TStringField;
    MemPtnGaikaGaikaSoukinName1: TStringField;
    MemPtnGaikaGaikaSoukinName2: TStringField;
    MemPtnGaikaGaikaSoukinName3: TStringField;
    MemPtnGaikaGaikaSaiyoKbn: TIntegerField;
    MemPtnGaikaGaikaSaiyoKbnNm: TStringField;
    PGridDensai1: TMPanel;
    DGridDensai1: TdxDBGrid;
    DGridDensai1UserID: TdxDBGridColumn;
    DGridDensai1KanaName: TdxDBGridColumn;
    DGridDensai1BankCode: TdxDBGridColumn;
    DGridDensai1BranchCode: TdxDBGridColumn;
    DGridDensai1AccKbn: TdxDBGridLookupColumn;
    DGridDensai1AccKbnName: TdxDBGridMaskColumn;
    DGridDensai1AccNo: TdxDBGridColumn;
    DDataSourceDensai1: TDataSource;
    DMemDensai1: TdxMemData;
    DMemDensai1UserID: TStringField;
    DMemDensai1KanaName: TStringField;
    DMemDensai1BankCode: TIntegerField;
    DMemDensai1BranchCode: TIntegerField;
    DMemDensai1AccKbn: TIntegerField;
    DMemDensai1AccKbnName: TStringField;
    DMemDensai1AccNo: TIntegerField;
    DMemDensai1AccKbnCode: TIntegerField;
    DMemDensaiAccKbn: TdxMemData;
    DMemDensaiAccKbnCode: TIntegerField;
    DMemDensaiAccKbnName: TStringField;
    DMemDensai1Sv: TdxMemData;
    DMemDensai1SvUserID: TStringField;
    DMemDensai1SvKanaName: TStringField;
    DMemDensai1SvBankCode: TIntegerField;
    DMemDensai1SvBranchCode: TIntegerField;
    DMemDensai1SvAccKbn: TIntegerField;
    DMemDensai1SvAccNo: TIntegerField;

    procedure   FormCreate                          (Sender: TObject);
    procedure   FormShow                            (Sender: TObject);
    procedure   FormActivate                        (Sender: TObject);
    procedure   FormHide                            (Sender: TObject);
	procedure   FormClose                           (Sender: TObject; var Action: TCloseAction);
	procedure   FormCloseQuery                      (Sender: TObject; var CanClose: Boolean);
    procedure   FormDestroy                         (Sender: TObject);  // <PRN>
    procedure   fnEnter                             (Sender: TObject);
    procedure   fnFldOnChg                          (Sender: TObject);
    procedure   f1POSTNO1Exit                       (Sender: TObject);
    procedure   fnZipOnArrowClick     (Sender: TObject);
    procedure   f1Exit                       (Sender: TObject);
    procedure   fnDtlCs1EditZipCodeOnKeyDown        (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   BtnClick                            (Sender: TObject);
    procedure   f1KanaName1Exit                     (Sender: TObject);
    procedure   f1KanaName1KeyPress                 (Sender: TObject; var Key: Char);
    procedure   f1NumNameKeyPress                   (Sender: TObject; var Key: Char);   //<184>追加：数字入力監視用
    procedure   f1TesuryoFutanArrowClick            (Sender: TObject);
    procedure   f1TesuryoFutanChange                (Sender: TObject);
    procedure   f1ItemsCheak                        (Sender: TObject);
    procedure   TMNum_KnjkmkEnter                   (Sender: TObject);
    procedure   TMNum_KnjkmkChange                  (Sender: TObject);
    procedure   HedCsTabChange                      (Sender: TObject);
    procedure   GridNayoseBeforeChangeColumn        (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                     NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure   GridNayoseChangeColumn              (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure   GridNayoseChangeNodeEx              (Sender: TObject);
    procedure   CmnGridKeyDown                      (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   DSNayoseStateChange                 (Sender: TObject);
    procedure   MemNayoseBeforePost                 (DataSet: TDataSet);
    procedure   BDeleteClick                        (Sender: TObject);
    procedure   BPrintClick                         (Sender: TObject);
    procedure   f1BunkaiChange                      (Sender: TObject);
    procedure   cbNykRootKbnClick                   (Sender: TObject);
    procedure   ArrowClick                          (Sender: TObject);
    procedure   GridClmBtnClick                     (Sender: TObject);


    procedure   MSPFunctionBarFunctionClick         (Sender: TObject; FuncNo: Integer);
    procedure   AcTemplateExecute                   (Sender: TObject);
    procedure   AcCloseDayExecute                   (Sender: TObject); //<157>
    procedure   f0CODEExit                          (Sender: TObject);
    procedure   BChangeClick                        (Sender: TObject); // <120>
    procedure   evtGridNayoseKeyPress               (Sender: TObject; var Key: Char);
    procedure 	DtlCsTabChange(Sender: TObject);
    procedure 	f1KAIRITUChange(Sender: TObject);
    procedure 	f1SKYKBNChange(Sender: TObject);
    procedure 	f1KAISYWKINChange(Sender: TObject);
    procedure 	GridNayoseCustomDraw(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure PkaisyuHouhouExit(Sender: TObject);
    procedure f1BMCODEKeyPress(Sender: TObject; var Key: Char);
    procedure GridNayoseEnter(Sender: TObject);
    procedure CODEExit(Sender: TObject);
    procedure MNDenDataKbnChange(Sender: TObject);
    procedure MTDensaiUserIDExit(Sender: TObject);
   // procedure PkaisyuHouhouExit(Sender: TObject);
    procedure   BDenshiDeleteClick(Sender: TObject);
    procedure MNDenDataKbnExit(Sender: TObject);
    procedure MTAccNoExit(Sender: TObject);
    procedure MTAccNoKeyPress(Sender: TObject; var Key: Char);
//<Account> ADD St
    procedure   BAccountDeleteClick(Sender: TObject);
    procedure numKoufuriNo_AccountChange(Sender: TObject);
    procedure txtUserCode_AccountKeyPress(Sender: TObject; var Key: Char);
    procedure txtUserCode_AccountExit(Sender: TObject);
    procedure numSaiyoKbn_GaikaChange(Sender: TObject);
//<Account> ADD Ed
    procedure DGridDensai1Enter(Sender: TObject);
    procedure DGridDensai1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DGridDensai1KeyPress(Sender: TObject; var Key: Char);
    procedure DGridDensai1BeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure DMemDensai1BeforePost(DataSet: TDataSet);
    procedure   BDenshi2DeleteClick(Sender: TObject);
    procedure DGridDensai1Exit(Sender: TObject);



  private
	{ Private 宣言 }

    m_SeikyuKbnItems : Array [ 0..1 ] of CodeList;         //<175>  請求区分の選択肢は定数から変数に変更

    m_pRec			        : ^TMjsAppRecord;		        // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ(ｾｰﾌﾞ用)<BPL>
	m_Base_pRec		        : ^TMjsAppRecord;               // <105>
    m_cDataModule	        : TMDataModulef;                // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
    m_cComArea		        : TJNTMASCom;                   // ｼｽﾃﾑﾒﾓﾘ構造体ﾎﾟｲﾝﾀ<BPL>
    m_cDBSelect		        : TFDConnection;                    // 会社DB
    m_cErrorMsgRec		    : TMJSMsgRec;                   // MJS専用ﾒｯｾｰｼﾞ
    m_cJNTArea              : TJNTCommon;

    m_CmpList	            : TList;
    B_Print 	            : TSpeedButton;                 // 印刷
    B_Syousai 	            : TSpeedButton;                 // 詳細
    B_Delete                : TSpeedButton;                 // 削除
    B_Change                : TMSpeedButton;                // 切出/埋込ﾎﾞﾀﾝ<120>
    m_bBtnChange	        : Boolean;                      // 切出≪=≫埋込ﾌﾗｸﾞ<120>

    m_AcControl		        : TWinControl;                  // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
    m_bFirstFlag	        : Boolean;                      // 表示ﾌﾗｸﾞ
    m_CloseFlg	            : Boolean;                      // 終了ﾌﾗｸﾞ
    m_nProcDivision		    : Integer;
    m_ZoomRatio			    : Integer;                      // 拡大率

    m_TRCodeDigit           : Integer;                      // 取引先コード桁数
    m_TRCodeAttr            : Integer;                      // 取引先コード属性
    m_TRJHojyoName          : String;                       // 取引先補助名称(実在)
    m_BMCodeDigit           : Integer;                      // 部門コード桁数
    m_BMCodeAttr            : Integer;                      // 部門コード属性
    m_BMJHojyoName          : String;                       // 部門補助名称(実在)
    m_TNCodeDigit           : Integer;                      // 社員コード桁数
    m_TNCodeAttr            : Integer;                      // 社員コード属性
    m_TNJHojyoName          : String;                       // 社員補助名称(実在)
    m_EdtSw                 : Boolean;                      // 編集ｽｲｯﾁ
    m_RecGetSw              : Boolean;
    m_BtUpdFlg              : Boolean;
    m_FormCreateSw          : Boolean;
    m_VK_KeyKilSw           : Boolean;
    m_TRNCode               : Extended;
    m_TantoNCode        	: Extended;

    m_BumonNCodeEx        	: Extended;                    //<158>エクスプローラまたはDBから取得した部門内部コード（同じ外部コードがあるため）
    m_BumonNMKEx            : String;                      //<158>エクスプローラから取得した部門簡略名

    m_PostExpOpenSW         : Boolean;                      // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(TRUE:OPEN FALSE:CLOSE)
//    m_ComputerName          :   String;                   // ｺﾝﾋﾟｭｰﾀ名格納用変数

	m_nDBErrorCode		    : Integer;                      // ｴﾗｰ時の取引先ｺｰﾄﾞ(ﾒｯｾｰｼﾞ表示用)
    m_ErrObjNm			    : String;		                // ｴﾗｰのｺﾝﾄﾛｰﾙ名
    m_AfterSave			    : AfterSaveRec;
    m_bEndFlg			    : Boolean;				        // 終了ﾎﾞﾀﾝ押下判断ﾌﾗｸﾞ
    m_bReadFlg              : Boolean;

    m_Savef2OyaCode         : String;                       // 直前の検索キー（親得意先）<172>
    m_Savef2KoCode          : String;                       // 直前の検索キー（子得意先）<172>

    m_JNTAuthority          : TJNTAuthority;  //<Authority> ADD

	uvSelSys                : TJNTSelCorpSys;
    uvExpOpenSW             : Boolean;                      // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(TRUE:OPEN FALSE:CLOSE)
    uvDispFlg               : Integer;                      // 決算フラグ（ 0:未確定、1:確定済）
    uvFncInfo               : urFncInfo;                    // <100>

    uvTempFlg               : Boolean;                      // <100>

    // ﾃﾝﾌﾟﾚｰﾄ情報保存用
    uvTmpUSDENPFM           : Integer;                      // 納品書ﾌｫｰﾑ
    uvTmpSSDENPFM           : Integer;                      // 請求書ﾌｫｰﾑ
    uvTmpUSGKEI             : Integer;                      // 売上合計欄税印字
    uvTmpSSGKEI             : Integer;                      // 鏡欄税印字
    uvTmpBMCODE             : String;                       // 部門ｺｰﾄﾞ
    uvTmpTNCODE             : String;                       // 担当者ｺｰﾄﾞ
    uvTmpRYOPFM             : Integer;                      // 領収証ﾌｫｰﾑ
    uvTmpRYOTEKI            : Integer;                      // 領収証の但し書き
    uvTmpSYURYOKBN          : Integer;                      // 集金用領収証

    //<149> テンプレート債権入金情報用
    uvTmpJouken1           : Integer;                      // 回収条件1
    uvTmpJouken2           : Integer;                      // 回収条件2
    uvTmpBunkaiKbn         : Integer;                      // 分解区分
    uvTmpStdRitu	       : Double;                       // 分解基準値
    uvTmpHasuuHou          : Integer;                      // 端数方法
    //<177>
    uvTmpTesuryoFutan      : Integer;                      // 手数料負担区分
    uvTmpKu			       : Integer;                      // EDI・仮想口座区分
    uvTmpGaikaSaiyoKbn     : Integer;                      // 外貨採用区分 <GAIKA> ADD

    uvDaiKbn                : Boolean;
    uvDaiGaeCode            : String;

    uvSvOyaHojCD            : String;

    uvHani                  : TJNTHani;		                // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry           : TPrintAppEntry;               // <PRN>
    ArrHdl                  : Array[0..100] of Pointer;		// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        : rcPrtParam;                   // <PRN>
    DmqPrint                : TMQuery;                      // <PRN> 印刷用ｸｴﾘｰ

    MComboBox               : TMComboBox;
	m_iRekiKbn				: Integer;						// 051114
    m_RepHandle				: THandle;

    m_SimeChkFlg              : Integer;                      // <142>   0:チェックあり、1:チェックなし）
    m_SyncMaster        	: TSyncMaster;      			// <Rel> ﾏｽﾀ同期基本ｸﾗｽ
//<DENSHI> ADD St
    m_DensaiInfo            : TDensaiInfo;
//<DENSHI> ADD Ed
//<Account> ADD St
    moReference           : TReference;
    moAccCsInfo           : TAccountCustomerInfo;
    moAccInfos            : TAccountInfoList;
    moComCtrls            : TObjectList;
//<Account> ADD Ed

    m_bCustomSeikyuKbn      : Boolean;                      //T:請求区分カスタマイズあり F:請求区分カスタマイズなし
    m_bKaitoteiConfirm      : Boolean;

    m_CrdSysInfo_Gai        : TObjectList;  //<GAIKA_1> ADD

//<187> ADD St
	m_CanClose				: Boolean;
	m_OnExitDGridDensai1	: Boolean;
//<187> ADD Ed

    function fnGetNCODE(pCODE: String; pMKBN, pAttr: Integer): Extended;
    function fnGetGCODE(pCODE: Extended; pMKBN: Integer): String;
    function fnGetKaiBunNm(iCd: Integer): String;
    function fnGetKaiHasNm(iCd: Integer): String;
    function fnCheckDaigae(CD: String; var DainCD: Extended): Boolean;
    function fnChkTRCODE: Integer;
    procedure fnSetDaigaiData(pNCD,pDaiNCD:Extended);
	procedure fnPrnSETSyousai(pPtn:Integer);		// 051114
	procedure fnPrnSETNayose(pPtn:Integer);
	procedure MakeNayoseInfo(sOyaCD: String; sNknCD: String;
		nOyaCD: Extended; nNknCD: Extended);
	function fnGetMTOKUI_Info(sNCode: Extended): Integer;
    function fnChkInvalidFBChar(const aText: String): Boolean;
    function fnSimeChk(): Boolean; //<142>  iniファイル版
    function fnSimeChk2(): Boolean; //<157> CRDSYSINFO版
    function fnNayoseExist(): Boolean; //<157>
    function fnUpdCrdSysInfo(iKbn: Integer): Boolean; //<157>

//    function fnDenChk(iFlg: Integer): Boolean; //<143>
    function fnDenChk(): Boolean;              //<172>  引数不要

    function fnChkSeikyuKbn(): Boolean; //<175> 請求区分カスタマイズチェック

//    procedure FieldsDefaultValueSet_MTOKUI_CRD(pRec: Pointer; pDBCorp: TDatabase;
//                                               TmpJouken1, TmpJouken2, TmpBunkaiKbn: Integer;
//                                               TmpStdRitu: Double;
//                                               TmpHasuuHou: Integer);   //<154>

    procedure FieldsDefaultValueSet_MTOKUI_CRD(pRec: Pointer; pDBCorp: TFDConnection;
                                               TmpJouken1, TmpJouken2, TmpBunkaiKbn: Integer;
                                               TmpStdRitu: Double;
                                               TmpHasuuHou: Integer;
                                               TmpTesuryoFutan :Integer;
                                               TmpKu :Integer;
                                               TmpGaikaSaiyoKbn : Integer  //<GAIKA> ADD
                                               );   //<177>



	procedure SessionPractice(iSyori: Integer);	// <155> セッション管理ストアドのパラメータ追加
//<DENSHI> ADD St
    procedure fnInzFormDenshi();
    function fnFldChk_DENSAI(): Boolean;
    function fnFldChk_JEMCO(): Boolean;
    procedure ObjSetDensaiInfo(oDensaiInfo : TDensaiInfo; iDataKbn:Integer);
	procedure fnPrnSETDensai(pPtn:Integer);
    function fnEditAccountNo(pAccountNo : String):string;
//<DENSHI> ADD Ed
//<Account> ADD St
    procedure fnInzFormAccount();
    procedure fnShowMessage(
        sMsg : string;
        sCaption : string;
        msgBoxType : TMjsMsgBoxType;
        msgBoxBtns : TMjsMsgBoxButtons;
        msgBoxDefBtn : TMjsMsgBoxDefBtn);
    procedure FormSetAccInfo(oAccInfos : TAccountInfoList; iKoufuriNo : Integer = 0);
    procedure FormSetAccCsInfo(oAccCsInfo: TAccountCustomerInfo);
    procedure ObjSetAccCsInfo(oAccCsInfo : TAccountCustomerInfo);
	procedure fnPrnSETAccount(pPtn:Integer);
//<Account> ADD Ed
//<GAIKA_1> ADD St
    procedure CreateCrdSysInfo();
    function  GetGaikaBaseUseKbn(): Integer;
    property GaikaBaseUseKbn : Integer read GetGaikaBaseUseKbn;
//<GAIKA_1> ADD Ed
	procedure fnPrnSETGaika(pPtn:Integer);  //<GFB2> ADD
//<187> ADD St
	procedure ControlDeleteButton;
	function CheckChangeDensai1: Boolean;
	procedure UpdateDensai1(aQuery: TMQuery);
//<187> ADD Ed
  public
    { Public 宣言 }
    constructor CreateForm                      (pRec:pointer);
    function	fnMakeSQL						(FLAG,StratEndFlag: Boolean):String;

    procedure   WMOnPaint                       (var Msg: TMessage); message WM_ONPAINT;
	procedure	CMChildKey                      (var Msg : TWMKey); message CM_CHILDKEY;
    procedure   fnDtlCsTabNextSetFcous          ();
    function    fnBtnNextFocus                  (): Boolean;
    procedure   fnEndKeyBtnFcous                ();

    procedure   fnGetMasterInfo                 ();
    procedure   fnKbnStrSet                     ();
    procedure   fnSetKAISHAItems                ();
    procedure   fnInzForm                       ();
    procedure   fnInzFormf1                     ();
    procedure   fnBtnEnbChg                     ();

    function    fnBtnOnChange                   (pName: String): Boolean;
    function    fnRecUpd                        (): Boolean;
    function    fnCancel                        (FcsChg: Boolean): Boolean;
    function    fnCloseConfirm                  (): Boolean;
    function    fnESCConfirm                    (): Boolean;
    function    fnFldChk                        (Sender: TObject; AllChkMode: Boolean): Boolean;
    function    fnRecGet                        (CODE: String): Boolean;

    function    fnGetKeisyoNm                   (sCd: String): String;
    function    fnGetUsgKeiNm                   (sCd: String): String;
    function    fnGetKaiJyNm                    (sCd: String): String;
    function    fnGetTsryoFtnNm                 (sCd: String): String;
    function    fnGetEDISiyoNm                  (sCd: String): String;
    function    fnGetSkyKbnNm                   (sCd: String): String;
	function	fnOutputConfirmationMessage		(nDivision: Integer): Integer;
    procedure	fnOutputDBErrorMessage			();
    Function    fnGetNAME(pCODE:String;pMKBN,pAttr:Integer; var RName:String ):Boolean;

    // 名寄せ
    procedure 	fnGetNayoseInfo				();

    function 	fnNknCodeCheck					(sHojCode: String; var sRet: String; var sNknNCD:Extended; Mode: Integer;
                                                 var sUsKinKbn: Integer; var sCngNCode: Extended;
                                                 var sNDGCode: String; var sNDNAME: String): Boolean;
	function 	fnCheckNknNayoseInfo			(CD: String; KBN: Integer): Boolean;
	function	fnUpDateNknNayoseInfo			(NknNCD,OyaNCD: Extended; KBN,MODE: Integer;
	    TranMode: Boolean): Boolean;
    function    fnUpDateMTokui_SelInfo          (NknNCD,SeiNCD: Extended; OyakoFlg,UsKin: Integer;
    	aGoukei: Boolean; TranMode: Boolean): Boolean;
	function 	fnDeleteNknNayoseInfo			(NknNCD,OyaNCD: Extended; MODE: Integer): Boolean;
	function 	fnRecordCheck					(const bGoukei: Boolean = False): Boolean;
    procedure   fnSetFncType                    (pKBN:Integer);

    procedure   fnPrnSETKanryaku                (const pPtn: Integer);     // <133>
    procedure   SetDenshiNoItems(csNCode : Extended; denKbn : Integer; txtEdit : TMTxtEdit);    //<DENSHI> ADD

    function    fnUpdCRD_KAIYOTEIT(CSNCode,SeikyuNCode: Extended; UPDMODE: Integer): Boolean;   //名寄せ変更後の回収予定データの請求先コード変更

	function	fnPWITEMChkEnt(): Boolean;//<PASS>郵便番号/電話番号未入力チェック(基本情報登録)
end;

function AppEntry(pPar : Pointer)	:	Integer;

exports
	AppEntry;

implementation

const
    ucBtnBEFOR			= 	'MBitBtnBefor';	    		// 前ﾍﾟｰｼﾞ移動ﾎﾞﾀﾝ
    ucBtnAFTER			= 	'MBitBtnAfter';	    		// 後ﾍﾟｰｼﾞ移動ﾎﾞﾀﾝ
    ucBtnOK             =   'MBitBtnUpd';
    ucBtnNG             =   'MBitBtnCancel';
    ucZeroCODE          =   '0000000000000000';         //<122>


    CONFIRM_EDITCODE		= 0;						// ｺｰﾄﾞ欄編集
	CONFIRM_CANCEL			= 1;						// 取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			= 2;						// 終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			= 0;
	CONFIRM_RETFOCUSED		= 1;						// 元の位置にﾌｫｰｶｽを戻す
	CONFIRM_EXITWRITE		= 2;						// ﾃﾞｰﾀを保存して処理を終了

	DISPOSE_REAL			= 0;						// 実在
	DISPOSE_TOTAL			= 1;						// 合計
	DISPOSE_NAYOSEOYA		= 2;						// 名寄せ親
	DISPOSE_ALL				= 99;						// 実在、合計

    NAYOSE_CHILD			= 1;						// 名寄せ子
	NAYOSE_PARENT			= 2;						// 名寄せ親
	NAYOSE_ALL				= 99;						// 名寄せ親以下

    MODE_INSERT				= 1;						// 新規
	MODE_EDIT				= 2;						// 編集
	MODE_DELETE				= 3;                        // 削除

    CASE_CODEINPUT			= 0;						//コード入力
    CASE_BTNCLICK			= 1;						//ボタンクリック

    NAYOSE_SET              = 1;						// 名寄せ設定
	NAYOSE_DELETE		    = 2;						// 名寄せ解除

    NG_BY_KAIYOTEIDATA      = 1;                        //消込済データ存在により不可
    NG_BY_NYUKINDATA        = 2;                        //入金データに存在より不可
    NG_BY_KOUFURIDATA       = 3;                        //口振データに存在より不可

    CONFIRM_BY_KAIYOTEIDATA = 99;                       //未消込データに存在より確認

    IKKATSU_SEIKYU          = 1;                        //親一括請求
    KAKUTEN_SEIKYU          = 2;                        //各店別請求





var
    // ﾘｽﾄ情報
    _KeisyoItems    : array [0..3] of CodeList
        = ((iCode : 1; sName : 'なし'),
           (iCode : 2; sName : '様'),
           (iCode : 3; sName : '御中'),
           (iCode : 4; sName : '殿'));

    _UsgKeiItems     : array [0..2] of CodeList
        = ((iCode : 1; sName : '税抜き'),
           (iCode : 2; sName : '税込み'),
           (iCode : 9; sName : '税表示なし'));


    _KaiBunItems     : array [0..1] of CodeList
        = ((iCode : 0; sName : '比率'),
           (iCode : 1; sName : '定額'));

    _KaiJyItems     : array [0..4] of CodeList   //<Account> MOD  3 → 4
        = ((iCode : 1; sName : '現金'),
           (iCode : 2; sName : '振込'),
           (iCode : 3; sName : '手形'),
           (iCode : 4; sName : '相殺'),
           (iCode : 5; sName : '口振'));  //<Account> ADD

    _KaiHasItems     : array [0..2] of CodeList
        = ((iCode : 0; sName : '切り捨て'),
           (iCode : 1; sName : '切り上げ'),
           (iCode : 2; sName : '四捨五入'));


    _TsryFtnItems   : array[0..1] of CodeList
        = ((iCode : 0; sName : '他社負担'),
           (iCode : 1; sName : '自社負担'));

// <126>↓
//    _EDIKuItems     : array[0..1] of CodeList
//        = ((iCode : 0; sName : '採用なし'),
//           (iCode : 1; sName : '採用あり'));
    _EDIKuItems     : array[0..2] of CodeList
        = ((iCode : 0; sName : '採用なし'),
            (iCode : 1; sName : 'ＥＤＩ採用'),
            (iCode : 2; sName : '仮想口座採用'));
// <126>↑


// <175>↓
//定数から変数に変更
//    _SeikyuKbnItems   : array[0..1] of CodeList
//        = ((iCode : 1; sName : '親一括請求一括入金'),
//           (iCode : 2; sName : '各店別請求各店別入金'));
// <175>↑


    _strhalfkana	:	String = 'ｧｨｩｪｫｬｭｮｯ';
	_strkana		:	String = 'ｱｲｳｴｵﾔﾕﾖﾂ';

	_ExpectItems : array [0..9] of String	= ('当月', '翌月', '翌々月',
											   '3ヶ月後', '4ヶ月後', '5ヶ月後',
											   '6ヶ月後', '7ヶ月後', '8ヶ月後', '9ヶ月後');

	_HolidayItems: array [0..2] of String	= ('翌営業日', '前営業日', '当日');

{$I JNTConst.inc}                           // <124>

{$include JNTCRPSyncMasterB.inc}    // <Rel> ﾏｽﾀ同期共通実装部
{$include JNTMTOKUI_Sync.INC} // <Rel>

{$R *.DFM}

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pPar: Pointer):	Integer;
var
	pForm	:	^TJNTCRP004003F;
	pRec	:	^TMjsAppRecord;
begin
	result	:=	ACTID_RET_OK;
	pRec	:=	Pointer(TAppParam(pPar^).pRecord);

	case (TAppParam (pPar^).iAction) of
        // ----------------------------
        //  Form Create要求
        // ----------------------------
		ACTID_FORMCREATESTART:
			begin
				New (pForm);

				try
					pForm^	:= TJNTCRP004003F.CreateForm (pPar);
					pRec^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

        // ----------------------------
        //  Form Create&Show要求
        // ----------------------------
		ACTID_FORMCREATESHOWSTART:
			begin
				New (pForm);

				try
					pForm^	:= TJNTCRP004003F.CreateForm (pRec);
					pForm^.Show ();
					pRec^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

        // ----------------------------
        //  Form Close要求
        // ----------------------------
		ACTID_FORMCLOSESTART:
			begin
				pForm	:= Pointer (pRec^.m_pChildForm);
				pForm^.Close ();
				pForm^.Free  ();
				Dispose (pForm);
			end;

        // ----------------------------
        //  Form CanClose要求
        // ----------------------------
		ACTID_FORMCANCLOSESTART:
			begin
				pForm	:= Pointer (pRec^.m_pChildForm);

				if	(pForm^.CloseQuery () = FALSE) then
					Result	:= ACTID_RET_NG;
			end;

        // ----------------------------
        //  Show要求
        // ----------------------------
		ACTID_SHOWSTART:
			begin
				pForm	:= Pointer (pRec^.m_pChildForm);
				pForm^.Show ();
			end;

        // ----------------------------
        //  Hide要求
        // ----------------------------
		ACTID_HIDESTART:
			begin
				pForm	:= Pointer (pRec^.m_pChildForm);

				if	(pForm^.Parent <> nil) then
	            	pForm^.Hide ();
	        end;
	end;
end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ <BPL>
//-----------------------------------------------------------------------------
constructor TJNTCRP004003F.CreateForm(pRec: pointer);
var
    CTRL_DB		    :	TFDConnection;
    DmqData		    :	TMQuery;
    DmqCtrlDb	    :	TMQuery;
    strParameter    :   String;
    nParameter	    :   Integer;
//    iTanCD		    :	Integer;
	sTanName	    :	String;
    bFlag		    :	Boolean;
    sMessage	    :	String;
begin
    m_CloseFlg      :=  FALSE;
    m_bFirstFlag	:=  FALSE;
    m_nDBErrorCode	:=  0;
    m_TRNCode		:=	0;

    m_pRec	        :=  Pointer( TAppParam( pRec^ ).pRecord );      // 構造体のSave
	m_cDataModule   :=  TMDataModulef( m_pRec^.m_pDBModule^   );    // MJS共通DBﾓｼﾞｭｰﾙ
    m_cComArea		:=  TJNTMASCom( m_pRec^.m_pSystemArea^ );       // ｼｽﾃﾑﾒﾓﾘ 取得
//m_Log := TLog_Writer.Init(0,rcCOMMONAREA ( m_pRec^.m_pCommonArea^ ).SysCliRoot);  //*Log*
    m_TantoNCode    :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;

    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList   := TList(TAppParam( pRec^ ).pActionParam^);

    m_bKaitoteiConfirm := True;

    // 処理区分: 0=通常処理
	if	(m_pRec^.m_sParameter = '') then
		m_nProcDivision	:= 0
	else
	begin
		strParameter	:= Copy (m_pRec^.m_sParameter, 0, 2);
		nParameter		:= StrToInt64(Trim (strParameter));

		if	((nParameter = 21) or (nParameter = 25)) then
			m_nProcDivision	:= nParameter
		else
            // 処理区分: 0=通常処理
			m_nProcDivision	:= 0;
	end;

    // 共通DB Open
    m_cDBSelect     := m_cDataModule.COPDBOpen (1, m_cComArea.m_iCopNo);

	if	(m_cDBSelect = nil) then
	begin
        ShowMessage ('エラー');
        raise   EMathError.Create ('エラー');
    end;

    // ｽﾄｱﾄﾞの初期処理
	DmqData := TMQuery.Create( Self );					//	MQueryの構築
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );		//	DBとMQueryの接続

	// 共通ﾒﾓﾘﾎﾟｲﾝﾀの担当者内部ｺｰﾄﾞ
	if (rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD <> -1) then
	begin
		// CTLDBOpen
		CTRL_DB	:=	m_cDataModule.CTLDBOpen(0);
		if CTRL_DB = nil then
		begin
			ShowMessage('エラー');
			raise EMathError.Create('エラー');
		end;

		DmqCtrlDb	:=	TMQuery.Create( Self );		 		//	MQueryの構築
		m_cDataModule.SetDBInfoToQuery( CTRL_DB, DmqCtrlDb );		//	DBとMQueryの接続

(*
		DmqCtrlDb.Close;
		DmqCtrlDb.SQL.Clear;
		DmqCtrlDb.SQL.Add('SELECT                   ');
		DmqCtrlDb.SQL.Add('  Name                   ');		//	担当者名
		DmqCtrlDb.SQL.Add(' ,TantoGCD               ');		//	担当者ｺｰﾄﾞ
		DmqCtrlDb.SQL.Add('FROM MOS_OFFICE_STAFF    ');
		DmqCtrlDb.SQL.Add('WHERE TantoNCD = :NCode  ');     //	担当者内部ｺｰﾄﾞ
*)

		DmqCtrlDb.Close;
		DmqCtrlDb.SQL.Clear;
		DmqCtrlDb.SQL.Add('SELECT                   ');
		DmqCtrlDb.SQL.Add('  Name                   ');		//	担当者名
//		DmqCtrlDb.SQL.Add(' ,TantoGCD               ');		//	担当者ｺｰﾄﾞ
		DmqCtrlDb.SQL.Add('FROM MOS_OFFICE_STAFF    ');
		DmqCtrlDb.SQL.Add('WHERE NCode = :NCode     ');     //	担当者内部ｺｰﾄﾞ

//		DmqCtrlDb.ParamByName('NCode').AsInteger	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
		DmqCtrlDb.ParamByName('NCode').AsFloat	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;  // <128>
		DmqCtrlDb.Open;

		if (DmqCtrlDb.Eof <> TRUE) then
		begin
//			iTanCD		:=	DmqCtrlDb.GetFLD('TantoGCD').AsInteger;
			sTanName	:=	DmqCtrlDb.GetFLD('Name'	   ).AsString;
		end;
//		bFlag	:=	TRUE;

		DmqCtrlDb.Close;
		DmqCtrlDb.Free;
		m_cDataModule.CTLDBClose(CTRL_DB);
	end;

// <128>↓復帰
//(*
    bFlag := TRUE;                          // <128>追加
	DmqData.Close;
	DmqData.SQL.Clear;
	DmqData.SQL.Add(fnMakeSQL(bFlag, TRUE));

	if bFlag = TRUE then
	begin                                   // <128>ﾊﾟﾗﾒｰﾀは内部ｺｰﾄﾞだけ                    
//		DmqData.ParamByName('TANCD'  ).AsInteger := iTanCD;
//		DmqData.ParamByName('TANNAME').AsString  := sTanName;
		DmqData.ParamByName('TANCD'  ).AsFloat := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
	end;

	if (DmqData.ExecSQL  = FALSE) then
	begin
		sMessage	:=	IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
	end;
//*) // <♪ 後で確認して下さい。>
// <128>

	DmqData.Close;
	DmqData.Free;

	m_FormCreateSw := False;

//<187> ADD St
	m_CanClose := False;
	m_OnExitDGridDensai1 := False;
//<187> ADD Ed

    inherited Create(TForm(m_pRec^.m_pOwnerForm^))

end;

//-----------------------------------------------------------------------------
// CMChildKey()
//  < ｷｰの制御 >
//      PARAM   :
//      VAR     : Msg   TWMkeyｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : ｷｰの制御
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.CMChildKey(var Msg: TWMKey);
var
	sShift	            :   TShiftState;
    lvNextKeyPressed,
    lvNextBtnPressed,
    lvPrevBtnPressed,
    lvBitBtnFocused,
    lvBitBtnMTabFocused :   Boolean;
	SName	            :	String;
    //各ﾍﾟｰｼﾞの最終ﾌｨｰﾙﾄﾞへ
    procedure fnMBitBtnBeforSetFcous;
    begin
        case HedCsTab.Items.Selected of
            0:
            begin
                case DtlCsTab.Items.Selected of
                    0:
                    begin
                        MjsSetFocus(Self, 'f1SYURYOKBN');
                    end;
                    1:
                    begin
                        //<152>st
                        //if (f1DefoltEDI.Enabled) then
                        //    MjsSetFocus(Self,'f1DefoltEDI')
                        //else
                        //    MjsSetFocus(Self,'f1Ku');

                        if PMatching.Enabled then  //通常データ
                        begin
                            if (f1DefoltEDI.Enabled) then
                                MjsSetFocus(Self,'f1DefoltEDI')
                            else
                                MjsSetFocus(Self,'f1Ku');
                        end  else  //テンプレートデータ
                        begin
                            if (f1KAIJY2.Enabled) then
                                MjsSetFocus(Self,'f1KAIJY2')
                            else if  (f1KAIHasu.Enabled) then
                                MjsSetFocus(Self,'f1KAIHasu')
                            else
                                MjsSetFocus(Self,'f1KAIRITU');
                        end;
                        //<152>en
                    end;
//<DENSHI> ADD St
                    DTLTAB_DENSHI:
                    begin
//<187> MOD St
//                        CustomSetFocus([MTAccNo, MTJemcoUserID2, MNDenDataKbn]);
                        CustomSetFocus([DGridDensai1, MTJemcoUserID2, MNDenDataKbn]);
//<187> MOD Ed
                    end;
//<DENSHI> ADD Ed
//<Account> ADD St
                    DTLTAB_ACCOUNT:
                    begin
                        CustomSetFocus([txtFreeFld5_Account, numKoufuriNo_Account]);
                    end;
//<Account> ADD Ed
//<GAIKA> ADD St
                    DTLTAB_GAIKA:
                    begin
                        CustomSetFocus([txtSoukinName3_Gaika, numSaiyoKbn_Gaika]);   //<GFB> MOD
                    end;
//<GAIKA> ADD Ed
                end;
            end;
            1:
            begin
                case DtlCsTab.Items.Selected of
                    0:
                    begin
                        MjsSetFocus(Self, 'f1SYURYOKBN');
                    end;
                    1:
                    begin
                        if (f1KAIJY2.Enabled) then
                            MjsSetFocus(Self,'f1KAIJY2')
                        else
                            MjsSetFocus(Self,'f1KAIHasu');
                    end;
//<Account> ADD St
                    DTLTAB_ACCOUNT:
                    begin
                        CustomSetFocus([txtFreeFld5_Account, numKoufuriNo_Account]);
                    end;
//<Account> ADD Ed
//<GAIKA> ADD St
                    DTLTAB_GAIKA:
                    begin
                        CustomSetFocus([txtSoukinName3_Gaika, numSaiyoKbn_Gaika]);  //<GFB> MOD
                    end;
//<GAIKA> ADD Ed
                end;
            end;
            2:
            begin
            	//
            end;
        end;
    end;
begin

	if ( GetKeyState(VK_MENU) < 0 ) then Exit;

	SName		:=  Screen.ActiveControl.Name;
	sShift		:=  MJSKeyDataToShiftState(Msg.KeyData);  //<KST>
	m_ACControl :=  Screen.ActiveControl;

    // 次へ進めｷｰかを判定する
    lvNextKeyPressed := ( ( Msg.CharCode = VK_RETURN )                      or
                         (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_DOWN   ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] ))
                        );

    // ﾎﾞﾀﾝ制御用変数↓
    // 次へ進めｷｰかを判定する
    lvNextBtnPressed := (
                         (( Msg.CharCode = VK_RIGHT ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_TAB   ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_DOWN  ) and ( sShift = [] ))
                        );

    // 前へ戻れｷｰかを判定する
    lvPrevBtnPressed := (
                         (( Msg.CharCode = VK_LEFT ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_TAB  ) and ( sShift = [ssShift] )) or
                         (( Msg.CharCode = VK_UP   ) and ( sShift = [] ))
                        );

    // ﾎﾞﾀﾝ制御用変数↑
    lvBitBtnFocused := (( SName = ucBtnOK )    or
                        ( SName = ucBtnNG )    or
                        ( SName = ucBtnBEFOR)  or
                        ( SName = ucBtnAFTER));

    lvBitBtnMTabFocused := (( SName = ucBtnOK )    or
                            ( SName = ucBtnNG )    or
                        	( SName = ucBtnBEFOR)  or
                        	( SName = ucBtnAFTER)  or
                            ( SName = 'DtlCsTab'));


//<187> ADD St
	//でんさいネット取引先情報グリッド
	if Screen.ActiveControl.Name = DGridDensai1.Name then
	begin
		with DGridDensai1 do
		begin
            if ((Msg.CharCode = VK_ESCAPE) and (sShift = [])) then
            begin
                if DataSource.DataSet.State in [dsInsert, dsEdit] then
				begin
	                if State = tsEditing then CloseEditor;
	                DataSource.DataSet.Cancel;
                    Abort;
                end;

	            fnESCConfirm;
	            Abort;
            end;

            if ((Msg.CharCode = VK_HOME) and (sShift <> [ssCtrl])) then
            begin
                if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
                begin
                    FocusedColumn := DGridDensai1UserID.Index;
                    DataSource.DataSet.First;
                    ShowEditor;
                    Abort;
                end;

				Exit;
            end;

            if ((Msg.CharCode = VK_END) and (sShift <> [ssCtrl])) then
            begin
                if DataSource.DataSet.State in [dsInsert, dsEdit] then
				begin
	                if State = tsEditing then CloseEditor;
	                DataSource.DataSet.Cancel;
                end;

                if not fnBtnNextFocus then Exit;
                SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, TRUE);
                Abort;

				Exit;
            end;

            if ((Msg.CharCode = VK_TAB) and (sShift = [])) or
               (Msg.CharCode = VK_RETURN) then
			begin
                if DataSource.DataSet.State in [dsInsert, dsEdit] then
				begin
	                if State = tsEditing then CloseEditor;

                    if FocusedColumn = DGridDensai1AccNo.Index then
                    begin
						DataSource.DataSet.Post;

                        if FocusedNode.GetNext = Nil then
                        begin
                            FocusedColumn := DGridDensai1UserID.Index;
		    	    		DataSource.DataSet.Append;
                            ShowEditor;
                            Abort;
                        end
                        else
                        begin
                            FocusedColumn := DGridDensai1UserID.Index;
                            DataSource.DataSet.MoveBy(1);
                            ShowEditor;
                            Abort;
                        end;
                    end
                    else
                    begin
                        if FocusedColumn = DGridDensai1AccKbn.Index then
                            FocusedColumn := DGridDensai1AccNo.Index
                        else
                            FocusedColumn := FocusedColumn + 1;
                        ShowEditor;
                        Abort;
                    end;
				end
				else
				begin
                    if FocusedColumn = DGridDensai1AccNo.Index then
                    begin
                        if FocusedNode.GetNext = Nil then
                        begin
                            FocusedColumn := DGridDensai1UserID.Index;
		    	    		DataSource.DataSet.Append;
                            ShowEditor;
                            Abort;
                        end
                        else
                        begin
                            FocusedColumn := DGridDensai1UserID.Index;
                            DataSource.DataSet.MoveBy(1);
                            ShowEditor;
                            Abort;
                        end;
                    end
                    else
                    begin
                        if FocusedColumn = DGridDensai1AccKbn.Index then
                            FocusedColumn := DGridDensai1AccNo.Index
                        else
                            FocusedColumn := FocusedColumn + 1;
                        ShowEditor;
                        Abort;
                    end;
                end;
            end;

            if (Msg.CharCode = VK_DOWN) then
			begin
                if DataSource.DataSet.State in [dsInsert, dsEdit] then
				begin
	                if State = tsEditing then CloseEditor;
                    DataSource.DataSet.Post;

                    if FocusedNode.GetNext = Nil then
                    begin
                        FocusedColumn := DGridDensai1UserID.Index;
                        DataSource.DataSet.Append;
                        ShowEditor;
                        Abort;
                    end
                    else
                    begin
                        DataSource.DataSet.MoveBy(1);
                        ShowEditor;
                        Abort;
                    end;
				end
				else
				begin
                    if FocusedNode.GetNext = Nil then
                    begin
                        FocusedColumn := DGridDensai1UserID.Index;
                        DataSource.DataSet.Append;
                        ShowEditor;
                        Abort;
                    end
                    else
                    begin
                        DataSource.DataSet.MoveBy(1);
                        ShowEditor;
                        Abort;
                    end;
                end;
            end;

            if ((Msg.CharCode = VK_TAB) and (sShift = [ssShift])) then
			begin
                if DataSource.DataSet.State in [dsInsert, dsEdit] then
				begin
	                if State = tsEditing then CloseEditor;

                    if FocusedColumn = DGridDensai1UserID.Index then
                    begin
						DataSource.DataSet.Post;

                        if FocusedNode.GetPrev = Nil then
                        begin
                            MjsPrevCtrl(Self);
                            Abort;
                        end
                        else
                        begin
                            FocusedColumn := DGridDensai1AccNo.Index;
                            DataSource.DataSet.MoveBy(-1);
                            ShowEditor;
                            Abort;
                        end;
                    end
                    else
                    begin
                        if FocusedColumn = DGridDensai1AccNo.Index then
                            FocusedColumn := DGridDensai1AccKbn.Index
                        else
                            FocusedColumn := FocusedColumn - 1;
                        ShowEditor;
                        Abort;
                    end;
				end
				else
				begin
                    if FocusedColumn = DGridDensai1UserID.Index then
                    begin
                        if FocusedNode.GetPrev = Nil then
                        begin
                            MjsPrevCtrl(Self);
                            Abort;
                        end
                        else
                        begin
                            FocusedColumn := DGridDensai1AccNo.Index;
                            DataSource.DataSet.MoveBy(-1);
                            ShowEditor;
                            Abort;
                        end;
                    end
                    else
                    begin
                        if FocusedColumn = DGridDensai1AccNo.Index then
                            FocusedColumn := DGridDensai1AccKbn.Index
                        else
                            FocusedColumn := FocusedColumn - 1;
                        ShowEditor;
                        Abort;
                    end;
                end;
            end;
		end;

		Exit;
	end;
//<187> ADD Ed

//<010>↓T.Kawa 06/07/04
	if (Screen.ActiveControl is TDxDBGrid) then
//       (lvCompoName = 'GridNayose') then
    begin
	    // Homeキーの処理
		if (Msg.CharCode = VK_HOME)  then
	    begin
	        with (Screen.ActiveControl as TDxDBGrid) do begin
 	            FocusedColumn := 1;
	            DataSource.DataSet.First;
	   	        ShowEditor;
	            Abort;
	        end;
	    end;

		//	Returnキーの処理
		if (Msg.CharCode  = VK_RETURN) or						// Enter
	       ((Msg.CharCode = VK_TAB)    and (sShift=[])) or		// メイン画面以外にフォーカスをあたえない！
	       ((Msg.CharCode = VK_RIGHT)  and (sShift=[])) or		// →
	       ((Msg.CharCode = VK_DOWN)   and (sShift=[])) then	// ↓
		begin
        	// 入力内容の確認
			// 入力内容が該当しないコードの場合
		end;

		if ((Msg.CharCode = VK_TAB)  and (sShift=[ssShift])) or
	       ((Msg.CharCode = VK_UP)   and (sShift=[]))        or
		   ((Msg.CharCode = VK_LEFT) and (sShift=[]))        then
        begin
            //if GridNayose.FocusedNode.GetPrev = nil then
            if (GridNayose.FocusedAbsoluteIndex = 0) and (GridNayose.FocusedNode.GetPrev = nil) then
            begin
                MJSPrevCtrl(self);
                Abort;
            end;
        end;
    end;
//<010>↑T.Kawa 06/07/04


	// ｷｬﾚｯﾄが入力ﾌｨｰﾙﾄﾞの途中にある場合、LEFT, RIGHTｷｰでのﾌｫｰｶｽ移動は禁止する
   	if (m_AcControl is TMTxtEdit) then
	begin
        // LEFT
		if Msg.CharCode = VK_LEFT then
		begin
			if not MjsChkCurTop(m_AcControl) then
			    Exit;
		end;

        // RIGHT
		if Msg.CharCode = VK_RIGHT then
		begin
			if not MjsChkCurEnd(m_AcControl) then
			    Exit;
		end;
	end;

    // ﾎﾞﾀﾝでの各ｷｰの補足
    if ( lvBitBtnFocused ) then
    begin
        // 処理実行
        if ( Msg.CharCode = VK_RETURN ) then Exit;

        // 次へｷｰ
        if ( lvNextBtnPressed ) then
        begin
            if ( SName = ucBtnBEFOR ) then
            begin
            	if MBitBtnAfter.enabled then
                begin
	                MjsSetFocus(Self,ucBtnAFTER);
                end
                else
                begin
	                MjsSetFocus(Self,ucBtnOK);
                end;
                Abort;
            end
            else if ( SName = ucBtnAFTER ) then
            begin
                MjsSetFocus(Self,ucBtnOK);
                Abort;
            end
            else if ( SName = ucBtnOK ) then
            begin
                MjsSetFocus(Self,ucBtnNG);
                Abort;
            end
            else if ( SName = ucBtnNG ) then
                Abort;
        end;

        // 前へｷｰ
        if ( lvPrevBtnPressed ) then
        begin
            if ( SName = ucBtnBEFOR ) then
            begin
            	fnMBitBtnBeforSetFcous;
                Abort;
            end
            else if ( SName = ucBtnAFTER ) then
            begin
            	if MBitBtnBefor.enabled then
                begin
	                MjsSetFocus(Self,ucBtnBEFOR);
                end
                else
                begin
	                fnMBitBtnBeforSetFcous;
                end;
                Abort;
            end
            else if ( SName = ucBtnOK ) then
            begin
            	if MBitBtnAfter.enabled then
                begin
	                MjsSetFocus(Self,ucBtnAFTER);
                end
                else if MBitBtnBefor.enabled then
                begin
	                MjsSetFocus(Self,ucBtnBEFOR);
                end
                else
                begin
		            fnMBitBtnBeforSetFcous;
                end;
                Abort;
            end
            else if ( SName = ucBtnNG ) then
            begin
                MjsSetFocus(Self,ucBtnOK);
                Abort;
            end;
        end;

        // Retｷｰ(BtnClick用)とｱｸｾﾗﾚｰﾀ用ｷｰ以外
        if (( Msg.CharCode <> VK_RETURN ) and not ( sShift = [ssAlt] )) then Abort;

    end;

    // 各種頁の先頭ﾌｨｰﾙﾄﾞ時
    if ( sName = 'f1POSTNO1' ) or
       (( sName = 'f1SSDENPFM' ) and (f1POSTNO1.Enabled = False)) or
    // <137>       ( sName = 'f1KAISYWKIN'  ) then
       ( sName = 'f1Bunkai'     ) or  // <137>
       ( sName = 'MNDenDataKbn') or  //<DENSHI> ADD
       ( sName = 'numKoufuriNo_Account') or  //<Account> ADD
       ( sName = 'numSaiyoKbn_Gaika') then  //<GAIKA> ADD
    begin
        if ( lvPrevBtnPressed ) then
        begin
            MjsSetFocus(Self,'DtlCsTab');
            Abort;
        end;
    end;

    if ( sName = 'DtlCsTab' ) then
    begin
//<KEY> DEL St
{
        if (( Msg.CharCode = VK_LEFT   ) and ( sShift = [] )) then
        begin
            if      ( DtlCsTab.Items[0].Selected ) then  Abort
            else if ( DtlCsTab.Items[1].Selected ) then
            begin
                DtlCsTab.Items[0].Selected  :=  TRUE;
                DtlCsTab.Items[1].Selected  :=  FALSE;
                DtlCsTab.Items[DTLTAB_DENSHI].Selected  :=  FALSE;  //<DENSHI> ADD
            end
//<DENSHI> ADD St
            else if (DtlCsTab.Items[DTLTAB_DENSHI].Selected) then
            begin
                DtlCsTab.Items[DTLTAB_KIHON].Selected  :=  FALSE;
                DtlCsTab.Items[DTLTAB_NYUKIN].Selected  :=  TRUE;
                DtlCsTab.Items[DTLTAB_DENSHI].Selected  :=  FALSE;
            end;
//<DENSHI> ADD Ed

            Abort;
        end
        else if (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then
        begin
            if      ( DtlCsTab.Items[0].Selected ) then
            begin
                DtlCsTab.Items[0].Selected  :=  FALSE;
                DtlCsTab.Items[1].Selected  :=  TRUE;
                DtlCsTab.Items[DTLTAB_DENSHI].Selected  :=  FALSE;  //<DENSHI> ADD
            end
//<DENSHI> MOD St
//            else if ( DtlCsTab.Items[1].Selected ) then  Abort;
            else if ( DtlCsTab.Items[DTLTAB_NYUKIN].Selected ) and (DtlCsTab.Items[DTLTAB_DENSHI].Visible) then
            begin
                DtlCsTab.Items[DTLTAB_KIHON].Selected  :=  FALSE;
                DtlCsTab.Items[DTLTAB_NYUKIN].Selected  :=  FALSE;
                DtlCsTab.Items[DTLTAB_DENSHI].Selected  :=  TRUE;
            end
            else if (DtlCsTab.Items[DTLTAB_DENSHI].Selected) then Abort;
//<DENSHI> MOD Ed
            Abort;
        end
}
//<KEY> DEL Ed
//<KEY> DEL        else if  ( Msg.CharCode = VK_RETURN )                      or
        if  ( Msg.CharCode = VK_RETURN )                      or   //<KEY> ADD
                (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
                (( Msg.CharCode = VK_DOWN   ) and ( sShift = [] )) then
        begin

            //if f1POSTNO1.enabled = FALSE then Exit; <153>

            if (f1SSDENPFM.enabled = FALSE) then Exit; //<153>

            if uvDispFlg = 0 then
            begin
                if DtlCsTab.items.selected = 0 then
                begin
                    if f1POSTNO1.Enabled then
                        MjsSetFocus(Self, 'f1POSTNO1')    //通常データ
                    else
                       MjsSetFocus(Self, 'f1SSDENPFM');   //テンプレートデータ
                end
//<DENSHI> MOD St
{
                else
                    MjsSetFocus(Self, 'f1Bunkai');
}
                else if DtlCsTab.items.selected = DTLTAB_NYUKIN then
                    MjsSetFocus(Self, 'f1Bunkai')
                else if DtlCsTab.items.selected = DTLTAB_DENSHI then
                begin
                    MjsSetFocus(Self, 'MNDenDataKbn');
                end
//<Account> ADD St
                else if DtlCsTab.items.selected = DTLTAB_ACCOUNT then
                begin
                    CustomSetFocus([numKoufuriNo_Account]);
                end
//<Account> ADD Ed
//<GAIKA> ADD St
                else if DtlCsTab.items.selected = DTLTAB_GAIKA then
                begin
                    CustomSetFocus([numSaiyoKbn_Gaika]);
                end;
//<GAIKA> ADD Ed
//<DENSHI> MOD Ed
            end;
            Abort;
        end
//<KEY> DEL        else    Abort;
        else    Exit;   //<KEY> ADD
    end;


    // Return,Downｷｰの補足
    if lvNextKeyPressed then
    begin
        if ( Screen.ActiveControl = nil ) then Exit;

        // Tabﾌｫｰｶｽ時のｶｰｿﾙ制御
        if ( sName = 'DtlCsTab' ) then
        begin
            fnDtlCsTabNextSetFcous;
            Abort;
        end;

        if ( sName = 'GridNayose' ) then Exit;

        if	( Msg.CharCode = VK_RETURN ) or
            ( Msg.CharCode = VK_TAB    ) then

        begin
            if ( lvBitBtnFocused )  then Exit;

            // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
            if ( fnFldChk(Screen.ActiveControl, FALSE) ) then
            begin
                // 対象ﾃﾞｰﾀを取得する
                if ( sName = 'f0CODE' ) then
                begin
					f0CODE.Text :=  TrimRight(f0CODE.Text);
                 	if ( fnRecGet(f0CODE.Text) = FALSE ) then Abort;

                    if f1POSTNO1.enabled = FALSE then Exit;

                    if uvDispFlg = 1 then
                    begin
                        MjsSetFocus(Self, 'f0CODE');
                    end
                    else
                    begin
                        if DtlCsTab.items.selected = 0 then
                           MjsSetFocus(Self, 'f1POSTNO1')
//<DENSHI> MOD St
{
                        else
                            MjsSetFocus(Self, 'f1Bunkai');
}
                        else if DtlCsTab.items.selected = DTLTAB_NYUKIN then
                            CustomSetFocus([f1Bunkai])
                        else if DtlCsTab.items.selected = DTLTAB_DENSHI then
                            CustomSetFocus([MNDenDataKbn])
//<Account> ADD St
                        else if DtlCsTab.items.selected = DTLTAB_ACCOUNT then
                            CustomSetFocus([numKoufuriNo_Account])
//<Account> ADD Ed
//<DENSHI> MOD Ed
//<GAIKA> ADD St
                        else if DtlCsTab.items.selected = DTLTAB_GAIKA then
                            CustomSetFocus([numSaiyoKbn_Gaika]);
//<GAIKA> ADD Ed
                    end;

         	        if Msg.CharCode = VK_TAB then Abort;

                    Exit;
                end;

            end
            else Abort;
        end;

        // 次の強制ﾌｫｰｶｽ位置
        if ( fnBtnNextFocus() <> TRUE ) then Exit;

        SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, TRUE);
        Abort;
    end;

    // Return,Downｷｰの補足
    if lvPrevBtnPressed then
    begin
        if ( sName = 'f0CODE' ) then Exit;
        if ( sName = 'GridNayose' ) then Exit;

        SelectNext(Screen.ActiveControl, FALSE, TRUE);
        Abort;
    end;

    // ESCキーの捕捉
    if ( Msg.CharCode = VK_ESCAPE ) and ( sShift = [] ) then
    begin
        //先頭項目だった場合
		if ( sName = 'f0CODE' ) then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        else if ( sName = 'GridNayose' ) then
        begin
            if ( MemNayose.State = dsInsert ) then
            begin
                MemNayose.Cancel;
                Abort;
            end;
        end
        else
        begin
            // 終了確認
            if ( lvBitBtnMTabFocused = FALSE ) then fnESCConfirm;
            Abort;
        end;
    end;

    // ENDキーの捕捉
    if ( Msg.CharCode = VK_END ) and ( sShift = [] ) then
    begin
        // 先頭項目だった場合
        if ( sName = 'f0CODE' ) then
        begin
            MComboBox.SetFocus;
            Exit;
      	end
        // 先頭項目以外場合
        else
        begin
        	// ﾋﾞｯﾄﾎﾞﾀﾝへ
            if ( lvBitBtnMTabFocused = FALSE ) then fnEndKeyBtnFcous;
         	Abort;
        end;
    end;

    // Upキーの捕捉
    if ( Msg.CharCode = VK_UP  ) and ( sShift = [] ) or
       ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
    begin
        if ( sName = 'f0CODE' ) then
            Abort;

        SelectNext(Screen.ActiveControl, FALSE, TRUE);
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

    //暫定対応(2006/06/21 T.Kawa)
    //TMTxtEditを数値タイプで使用した場合にBSキーで全削除しても
    //Textプロパティが''にならずに'0～0'となってしまうのでここで対応する
    if (m_ACControl is TMTxtEdit) and
       (Msg.CharCode = VK_BACK) then
    begin
    	with TMTxtEdit(m_ACControl) do begin
			if (InputAttr <> iaFree) then
            begin
            	if ((SelStart = 0) and (SelLength = Length(Text))) or
                   ((SelStart = 1) and (SelLength = 0) and (Length(Text) = 1)) then
	            begin
					InputFlag := True;
                end;
            end;
        end;
    end;
end;

//-----------------------------------------------------------------------------
// fnMakeSQL()
//      PARAM   : TAN_CD	:	担当者ｺｰﾄﾞ
//				  TAN_NAME	:	担当者名
//				  FLAG		:	担当者選択なし(-1以外:TRUE/-1:FALSE)
//      RETURN  : 作成したSQL文
//      MEMO    : ｽﾄｱﾄﾞのSQL文作成
//-----------------------------------------------------------------------------
function	TJNTCRP004003F.fnMakeSQL (FLAG,StratEndFlag: Boolean) : String;
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
// <128>↓
//		sSQL	:=	sSQL + ',:TANCD,:TANNAME'
		sSQL	:=	sSQL + ',:TANCD';
// <128>↑        '
	end;
	sSQL	:=	sSQL + ')';

	Result	:=	sSQL;

end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormCreate(Sender: TObject);
var
//    ComputerName    :   String;
	Qry		    : TMQuery;
    i           : Integer;
    iRet        : Integer;                                  // <PRN>
    iGaikaKbn   : ^Integer;  //<GAIKA_2> ADD
begin
    m_bBtnChange 	:=  TRUE;   // <120>
    m_DensaiInfo    := nil;  //<DENSHI> ADD
//<Account> ADD St
    moAccCsInfo     := nil;
    moComCtrls      := TObjectList.Create();
//<Account> ADD Ed
    // <PRN>ArrHdlの初期化。
    for i := 0 to 100 do
        ArrHdl[i] := nil;

	// 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得
    B_Print 		:= TMSpeedButton( m_CmpList.Items[0]^ );    // 印刷
    B_Syousai 		:= TMSpeedButton( m_CmpList.Items[1]^ );    // 詳細
    B_Delete 		:= TMSpeedButton( m_CmpList.Items[2]^ );    // 削除
//    B_Copy      	:= TMSpeedButton( m_CmpList.Items[3]^ );    // 科目ｺﾋﾟｰ
//    B_Search    	:= TMSpeedButton( m_CmpList.Items[4]^ );    // 検索
//    ToolButton 	:= TToolButton  ( m_CmpList.Items[6]^ );    // 付箋
    m_cJNTArea  	:= TJNTCommon   ( m_CmpList.Items[8]^ );    // <104>
    m_Base_pRec   	:= Pointer      ( m_CmpList.Items[9]^ );    // <105>
    MComboBox       := TMComboBox   ( m_CmpList.Items[10]^ );
    B_Change        := TMSpeedButton( m_CmpList.Items[11]^ );	// <120>

    m_SyncMaster         := TSyncMaster  ( m_CmpList.Items[13]^ );  // <Rel>

    m_JNTAuthority := TJNTAuthority(m_CmpList.Items[16]^);  //<Authority> ADD

    B_Print.OnClick      := BPrintClick;
    B_Delete.OnClick     := BDeleteClick;
    B_Delete.OnMouseDown := nil;
    B_Change.OnClick     := BChangeClick;   // <120>
    B_Delete.Enabled     := FALSE;

	// -----<155> Add-St-----
	SPMsHist.Connection	:= m_cDBSelect;
	//SPMsHist.SessionName	:= m_cDBSelect.SessionName;

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// グループ会計の子会社の場合
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<155> Add-Ed-----

	Parent	    := TPanel (m_pRec^.m_pOwnerPanel^);         // 親ﾌｫｰﾑの子ﾌｫｰﾑはめ込みﾊﾟﾈﾙをParentとする
	Align	    := alClient;                                // Alignはｸﾗｲｱﾝﾄ領域とする
    m_AcControl := f0CODE;

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MJSColorChange (TJNTCRP004003F(Self),
                    m_cComArea.SystemArea.SysColorB,
                    m_cComArea.SystemArea.SysColorD,
                    m_cComArea.SystemArea.SysBaseColorB,
                    m_cComArea.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor
                   );

	m_ZoomRatio := MJSFontResize (TJNTCRP004003F (Self), Pointer (m_pRec));

	if ( m_ZoomRatio <= 0 ) then
		m_ZoomRatio := 100;
//<104>
//    m_cJNTArea      :=  TJNTCommon.Create(Self);
//    m_cJNTArea.Init(m_pRec);
	m_cJNTArea.setMasAppRecord;						        // 財務ﾎﾟｲﾝﾀ設定


    if fnChkSeikyuKbn() then   //<175>
    begin
        m_bCustomSeikyuKbn := True;
        m_SeikyuKbnItems[0].iCode := 1;
        m_SeikyuKbnItems[0].sName := '各店別請求親一括入金';
        m_SeikyuKbnItems[1].iCode := 2;
        m_SeikyuKbnItems[1].sName := '各店別請求各店別入金';
    end else
    begin
        m_bCustomSeikyuKbn := False;
        m_SeikyuKbnItems[0].iCode := 1;
        m_SeikyuKbnItems[0].sName := '親一括請求一括入金';
        m_SeikyuKbnItems[1].iCode := 2;
        m_SeikyuKbnItems[1].sName := '各店別請求各店別入金';
    end;

    fnGetMasterInfo();                                      // MasterInfoから桁数/属性を取得
    fnKbnStrSet();                                          // 文字列ｵﾌﾞｼﾞｪｸﾄを作成する
    fnSetKAISHAItems();                                     // ﾗﾍﾞﾙ項目を設定する
    CreateCrdSysInfo();                                     // 債権システム情報構築  <GAIKA> ADD

    // 初期値をｾｯﾄする
	m_FormCreateSw := TRUE;                                 // FormCreta動作ｽｲｯﾁ(TRUE:起動 FALSE:未起動)
	m_VK_KeyKilSw  := TRUE;                                 // VK_xxxｷｰ有効無効ｽｲｯﾁ(TRUE:有効 FALSE:無効)

    // [f0]項目の初期化
    MjsDispCtrl.MjsClrCtrls(Self,'f0');

    fnInzForm;

    // 郵便番号辞書 初期化
    m_PostExpOpenSW := FALSE;
	if ( fnCMNPostInit(m_pRec) = 0 ) then
        m_PostExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'郵便番号辞書の初期化に失敗しました。'#13#10#13#10
					+ '郵便番号辞書は使用できません。', mjError, mjDefOk);


	m_cJNTArea.setSelAppRecord; //<Gali2258>

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

//	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then  <Gali2258>
    	if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then //<Gali2258>
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

	// 051114 >>
    // 会社別ｼｽﾃﾑ情報読み込み<PRN>
    try
    	if (uvSelSys.CreateSysInfo(m_cDBSelect) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;

	m_cJNTArea.setMasAppRecord; //<Gali2258>

	// 051114 <<

    // 編集状態ｽｲｯﾁを初期化する
    m_EdtSw := FALSE;

{
    // ﾛｰｶﾙｺﾝﾋﾟｭｰﾀ名の取得
    GetClientName(ComputerName);
    m_ComputerName  :=  ComputerName;
}

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);

    // MQueryの構築
    Qry    := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    with Qry do
    begin
        Close ();
        SQL.Clear;
        SQL.Add ('select ComKbn2, YearKbn from DTMAIN');	// 051114
        Open ();
        if not Eof then
        begin
            uvDispFlg := FieldByName ('ComKbn2').AsInteger; // 決算確定
			m_iRekiKbn:= GetFld('YearKbn').AsInteger;		// 051114
        end;
        Close;

        // ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀを求める
        SQL.Clear;
        Sql.Add('select se.* from MTOKUI_SEL se ' +
                'left outer join MTOKUI m On se.BaseNCode = m.NCode ' +
                'where (m.TemplateKbn = 1) ' +
                'and (se.RecKbn = 1) ');
        Open ();
        if not Eof then
        begin
            uvTmpUSDENPFM  := GetFld('USDenPfm').AsInteger;             // 納品書ﾌｫｰﾑ
            uvTmpSSDENPFM  := GetFld('SSsyoPfm').AsInteger;             // 請求書ﾌｫｰﾑ
            uvTmpUSGKEI    := GetFld('USGKei').AsInteger;               // 売上合計欄印字
            uvTmpSSGKEI    := GetFld('SSsyoKgm').AsInteger;             // 請求書鏡欄税印字
            uvTmpBMCODE    := fnGetGCODE(GetFld('BmNCode').AsFloat,41); // 部門ｺｰﾄﾞ
            uvTmpTNCODE    := fnGetGCODE(GetFld('TnNCode').AsFloat,25); // 担当者ｺｰﾄﾞ
            uvTmpRYOPFM    := GetFld('RyoPfm').AsInteger;               // 領収証ﾌｫｰﾑ
            uvTmpRYOTEKI   := GetFld('RyoTeki').AsInteger;              // 領収証の但し書き
            uvTmpSYURYOKBN := GetFld('SyuRyoKbn').AsInteger;            // 集金用領収証
        end;
        Close ();


        // <149>St　債権用ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀを求める
        SQL.Clear;
        Sql.Add('select cr.* from MTOKUI_CRD cr ' +
                'left outer join MTOKUI m On cr.BaseNCode = m.NCode ' +
                'where (m.TemplateKbn = 1) ');
        Open ();
        if not Eof then
        begin
            uvTmpJouken1   		:= GetFld('Jouken1').AsInteger;              // 条件1
            uvTmpJouken2   		:= GetFld('Jouken2').AsInteger;              // 条件2
            uvTmpBunkaiKbn 		:= GetFld('BunkaiKbn').AsInteger;            // 分解区分
            uvTmpStdRitu   		:= GetFld('StdRitu').AsFloat;                // 分解基準
            uvTmpHasuuHou  		:= GetFld('HasuuHou').AsInteger;             // 端数方法
            uvTmpTesuryoFutan 	:= GetFld('TesuryoFutan').AsInteger;         // 手数料負担 <177>
            uvTmpKu			 	:= GetFld('Ku').AsInteger;                   // EDI・仮想口座区分<177>　
            uvTmpGaikaSaiyoKbn  := GetFld('GaikaKbn').AsInteger;             // 外貨採用区分 <GAIKA> ADD
        end;
        Close ();
        //<149>Ed

    end;
//<Account> ADD St
    moAccInfos := TAccountInfoList.Create(Qry);
    moReference := TReference.Create();
    moReference.PrsShowMessage := fnShowMessage;
//<Account> ADD Ed

    Qry.Free;

    //権限情報を取得<102>
//    m_cJNTArea.FxPermission;<104>


    if uvDispFlg = 1 then   //<147>
       GridNayose.Options	:=	GridNayose.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];

//    if (m_cJNTArea.IsModify = FALSE) then
    if (m_JNTAuthority.IsModify = FALSE) then  //<Authority>
    begin
        //<Authority>↓
        //if (m_cJNTArea.IsAppend = FALSE ) then
        if (m_JNTAuthority.IsAppend = FALSE ) then
        //<Authority>↑
        begin
            uvDispFlg := 1;                               // 決算確定と同様の処理
                                                  		  // <129>
        	GridNayose.Options	:=	GridNayose.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
        end;
    end;

{##
    // ﾗｲｾﾝｽの制御<103>
    if CheckModuleLicense(m_pRec,FXLicense.SEL_HAN) then    // 販売ﾗｲｾﾝｽﾁｪｯｸ
        PnlKanri.Visible  := FALSE;
##}

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

// ↓↓↓<PRN>
    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 }
	try
		//m_RepHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004003L.BPL');   <164>
		m_RepHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004003L.BPL');

        if ( m_RepHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP004003LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(m_RepHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
    	//<164>UnloadPackage( m_RepHandle );
        UnloadPackageHelper( m_RepHandle );
    end;

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
//<GAIKA_2> ADD St
        new(iGaikaKbn);
        iGaikaKbn^ := GaikaBaseUseKbn;
        ArrHdl[1] := iGaikaKbn;
//<GAIKA_2> ADD Ed
		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
                'JNTCRP004003',
                uvHani,
                uvSelSys);

// ↑↑↑<PRN>

	//<157>
    if fnSimeChk() then
	   m_SimeChkFlg := 1
    else
    if fnSimeChk2() then
	   m_SimeChkFlg := 1
    else m_SimeChkFlg := 0;    //1の場合、名寄せ登録の締め日チェックしない。
                             //iniファイル版とCrdSysInfo版の両方参照


    // ｲﾍﾞﾝﾄOnCreateの最後に
    PostMessage(Self.Handle, WM_ONPAINT, 0, 0);

end;


//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑｸﾛｰｽﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
//<GAIKA_2> ADD St
    //============================
    // 汎用のポインタ配列開放処理
    //============================
    procedure ArrHdlFree();
    type
        PInteger = ^Integer;
    var
        pInt : PInteger;
    begin
        pInt := PInteger(ArrHdl[1]);
        Dispose(pInt);
    end;
//<GAIKA_2> ADD Ed
begin
    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if ( uvExpOpenSW = TRUE ) then
        fnJNTExpFree;

    // 郵便番号辞書 終了
    if ( m_PostExpOpenSW = TRUE ) then
    	fnCMNPostFree ();

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 会社DBｸﾛｰｽﾞ処理
    if ( m_cDBSelect <> nil ) then
	    m_cDataModule.COPDBClose (m_cDBSelect);

    // 販売ｼｽﾃﾑ情報の開放
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

//<DENSHI> ADD St
    if Assigned(m_DensaiInfo) then
    begin
        FreeAndNil(m_DensaiInfo);
    end;
//<DENSHI> ADD Ed
//<Account> ADD St
    // 口座振替取引先情報オブジェクト
    if Assigned(moAccCsInfo) then
    begin
        FreeAndNil(moAccCsInfo);
    end;
    // 口座振替情報リスト
    if Assigned(moAccInfos) then
    begin
        FreeAndNil(moAccInfos);
    end;
    // 参照用オブジェクト
    if Assigned(moReference) then
    begin
        FreeAndNil(moReference);
    end;
    // コントロールリスト
    if Assigned(moComCtrls) then
    begin
        FreeAndNil(moComCtrls);
    end;
//<Account> ADD Ed
//<GAIKA_1> ADD St
    // 外貨債権システム情報
    if Assigned(m_CrdSysInfo_Gai) then
    begin
        FreeAndNil(m_CrdSysInfo_Gai);
    end;

    ArrHdlFree();
//<GAIKA_1> ADD Ed
    Action                      :=  caFree;
	m_pRec^.m_iDelete           :=  1;
	wkParam.iAction	            :=	ACTID_FORMCLOSEEND;
	wkParam.pRecord	            :=	Pointer(m_pRec);
	wkParam.pActionParam	    :=	nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@wkParam);

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< ﾌｫｰﾑ終了前処理 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
//<Account> ADD St
var
    oDensaiInfo : TDensaiInfo;
    oAccCsInfo : TAccountCustomerInfo;
    bEdit   : Boolean;
//<Account> ADD Ed
begin
    m_bEndFlg   :=  TRUE;
//<Account> ADD St
    oDensaiInfo := nil;
    oAccCsInfo := nil;
//<Account> ADD Ed
    // 終了ﾌﾗｸﾞをONに設定する
    if ( m_CloseFlg = FALSE ) then m_CloseFlg := TRUE;

    if ( m_BtUpdFlg = FALSE ) then
	begin
		m_EdtSw := FALSE;;
    end;

	// 051114 >>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 10040,2);
		Beep;
   		MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,
        				m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype ,
                        m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType );
	   	CanClose := FALSE;
        Exit;
	end;
	// 051114 <<

    // 編集結果を確認する
//<Account> MOD St
{
    if ( m_EdtSw ) then
    begin
        //終了確認
        if ( fnCloseConfirm = FALSE ) then
        begin
            CanClose := FALSE;
            Exit;
        end;
    end;
}
    try
        bEdit := m_EdtSw;
        if (bEdit = false) then
        begin
            // 電子記録債権
            if (Assigned(m_DensaiInfo)) then
            begin
                oDensaiInfo := TDensaiInfo.Create();
                ObjSetDensaiInfo(oDensaiInfo, m_DensaiInfo.DenDataKbn);
                //bEdit := m_DensaiInfo.Equals(
                bEdit := m_DensaiInfo.Equals1(
                    oDensaiInfo,
                    m_DensaiInfo.DenDataKbn) = false;
            end;
//<187> ADD St
            // 電子記録債権(でんさいネット)
            if (not m_CanClose) and (bEdit = false) then
            begin
				bEdit := CheckChangeDensai1;
            end;
//<187> ADD Ed
            // 口座振替情報
            if (Assigned(moAccCsInfo) and (bEdit = false)) then
            begin
                oAccCsInfo := TAccountCustomerInfo.Create();
                ObjSetAccCsInfo(oAccCsInfo);
                //bEdit := moAccCsInfo.Equals(oAccCsInfo) = false;
                bEdit := moAccCsInfo.Equals2(oAccCsInfo) = false;
            end;
        end;

        if ( bEdit ) then
        begin
            //終了確認
            if ( fnCloseConfirm = FALSE ) then
            begin
                CanClose := FALSE;
                Exit;
            end;
//<187> ADD St
            //2回来ても処理させないためのスイッチ
            m_CanClose := True;
//<187> ADD Ed
        end;

        // ２回来てしまうための対策
        if (Assigned(oDensaiInfo) and Assigned(m_DensaiInfo)) then
        begin
            m_DensaiInfo.Free();
            m_DensaiInfo := oDensaiInfo;
        end;

        if (Assigned(oAccCsInfo) and Assigned(moAccCsInfo)) then
        begin
            moAccCsInfo.Free();
            moAccCsInfo := oAccCsInfo;
        end;
    finally

        if (Assigned(oDensaiInfo)) and (m_DensaiInfo <> oDensaiInfo) then
        begin
            oDensaiInfo.Free();
        end;

        if (Assigned(oAccCsInfo)) and (moAccCsInfo <> oAccCsInfo) then
        begin
            oAccCsInfo.Free();
        end;
    end;
//<Account> MOD Ed

    //ＩＭＥを閉じる
    Self.ImeMode := imClose;
    Self.SetIme;

    //  共通システム開放
//    m_cJNTArea.Free;<104>

// 051114    B_Print     .Enabled    :=  TRUE; // <109>

end;

//-----------------------------------------------------------------------------
// FormDestroy()    <PRN>
//	< ﾌｫｰﾑ破棄 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormDestroy(Sender: TObject);
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
	if ( m_RepHandle <> 0 ) then
	begin
    	//<164>UnloadPackage( m_RepHandle );
        UnloadPackageHelper( m_RepHandle );
	end;

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< ﾌｫｰﾑ表示 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormShow(Sender: TObject);
begin

    // <100>
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

    JNTMasSetCaption (m_pRec);
	MJSBtnVisible (TJNTCRP004003F (Self), TRUE);

    // <PRN>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Show
    else
    begin
	    FormActivate( Sender );
        m_AcControl.SetFocus(); // <120>
    end;

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑﾊｲﾄﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormHide(Sender: TObject);
begin

    MJSBtnVisible (TJNTCRP004003f (Self), FALSE);

    // <PRN>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
        uvHani.mjspre.Hide;

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.FormActivate(Sender: TObject);
var
	cAppParam   :   TAppParam;
begin

	cAppParam.iAction		:= ACTID_ACTIVEEND;
	cAppParam.pRecord		:= Pointer (m_pRec);
	cAppParam.pActionParam	:= nil;

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppParam);

end;


//-----------------------------------------------------------------------------
// WMOnPaint()
//      PARAM   :
//      VAR     : Msg       TMessageｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.WMOnPaint(var Msg: TMessage);
begin

	if ( m_bFirstFlag = FALSE ) then
	begin
        m_bFirstFlag := TRUE;

        // 得意先ｺｰﾄﾞにﾌｫｰｶｽを設定する
        m_AcControl.SetFocus;

// 051114        B_Print     .Enabled    :=  FALSE; // <109>
{
        // 親のﾂｰﾙﾊﾞｰﾎﾞﾀﾝの制御
        B_Print     .Enabled    :=  FALSE;
        B_Syousai   .Visible    :=  FALSE;
        B_Delete    .Enabled    :=  FALSE;
        B_Copy      .Visible    :=  FALSE;
        B_Search    .Visible    :=  FALSE;
        ToolButton  .Visible    :=  FALSE;

        B_Delete    .Left       :=  215;
}
    end;

end;

//-----------------------------------------------------------------------------
// fnGetMasterInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : MasterInfoより取引先情報を取得
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnGetMasterInfo();
var
    dqMasterInfo : TMQuery;
begin

    // MQueryの構築
    dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

    with dqMasterInfo do
    begin

        Close();
		SQL.Clear();
		SQL.Add('SELECT                         '
            +   '    MasterKbn                  '
            +   '   ,UseKbn                     '
            +   '   ,JHojyoName                 '
            +   '   ,CodeDigit                  '
            +   '   ,CodeAttr                   '
            +   'FROM MasterInfo                '
            +   'WHERE MasterKbn in (22,25,41)  '
            +   'ORDER BY MasterKbn             ');

		Open();

        First;
        while not EOF do
        begin
            case GetFld('MasterKbn').AsInteger of
                // 取引先
                22: begin
                        m_TRJHojyoName  :=  GetFld('JHojyoName').AsString;  // 補助名称(実在)
                        m_TRCodeDigit   :=  GetFld('CodeDigit') .AsInteger; // 桁数
                        m_TRCodeAttr    :=  GetFld('CodeAttr')  .AsInteger; // 属性
                    end;
                // 社員
                25: begin
                        m_TNJHojyoName  :=  GetFld('JHojyoName').AsString;  // 補助名称(実在)
                        m_TNCodeDigit   :=  GetFld('CodeDigit') .AsInteger; // 桁数
                        m_TNCodeAttr    :=  GetFld('CodeAttr')  .AsInteger; // 属性
                    end;
                // 部門
                41: begin
                        m_BMJHojyoName  :=  GetFld('JHojyoName').AsString;  // 補助名称(実在)
                        m_BMCodeDigit   :=  GetFld('CodeDigit') .AsInteger; // 桁数
                        m_BMCodeAttr    :=  GetFld('CodeAttr')  .AsInteger; // 属性
                    end;
            end;

            Next;
        end;
    end;

    dqMasterInfo.Close();
    dqMasterInfo.Free();

end;

//-----------------------------------------------------------------------------
// fnKbnStrSet()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 文字列ﾘｽﾄの設定
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.fnKbnStrSet ();
var
	i 		: integer;
    sTmp	: String;
    iMax	: integer;
    Qry : TFDQuery;
    lvStr: TStringList;
    oCom : TComponentController;  //<GFB> ADD
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

    // 敬称区分の設定
    //文字列オブジェクトを作成する
    Qry := Nil;
    try

        Qry := TMQuery.Create(Self);											// MQueryの構築
        if Assigned(Qry) <> TRUE then
        begin
            Exit;
        end;

        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        lvStr := TStringList.Create;

        //[敬称区分]を作成する
        lfnKbnStrSet(Qry, 'ALL', '敬称区分',lvStr);
        f1KEISYO.SelectItems := lvStr;

        //[領収証の但し書き区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', 'ALL2', lvStr);
        f1RYOTEKI.SelectItems := lvStr;

        //[集金用領収証区分名]を作成する
        gfnJNTSELKbnStrSet(Qry, 'ALL', '集金用領収書', lvStr);
        f1SYURYOKBN.SelectItems := lvStr;

    finally
        lvStr.Free;
        Qry.Close;
        Qry.Free;
    end;

    // 売上合計欄税印字区分の設定
    f1USGKEI.SelectItems.Clear;
	f1USGKEI.Value          :=  0;
    f1USGKEINM.Caption      :=  '';

	for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
    begin
    	iMax    :=  _UsgKeiItems[i].iCode;
		sTmp    :=  IntToStr(_UsgKeiItems[i].iCode) + ':' + _UsgKeiItems[i].sName;
		f1USGKEI.SelectItems.Add(sTMp);
    end;
    f1USGKEI.maxvalue  :=  iMax;

    // 請求合計欄税印字区分の設定
    f1SSGKEI.SelectItems.Clear;
	f1SSGKEI.Value          :=  0;
    f1SSGKEINM.Caption      :=  '';

	for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
    begin
    	iMax    :=  _UsgKeiItems[i].iCode;
		sTmp    :=  IntToStr(_UsgKeiItems[i].iCode) + ':' + _UsgKeiItems[i].sName;
		f1SSGKEI.SelectItems.Add(sTMp);
    end;
    f1SSGKEI.maxvalue  :=  iMax;

    // 分解方法の設定
    f1Bunkai.SelectItems.Clear;
	f1Bunkai.Value        :=  0;
    f1BunkaiNM.Caption    :=  '';

	for i := Low(_KaiBunItems) to High(_KaiBunItems) do
    begin
    	iMax    :=  _KaiBunItems[i].iCode;
		sTmp    :=  IntToStr(_KaiBunItems[i].iCode) + ':' + _KaiBunItems[i].sName;
		f1Bunkai.SelectItems.Add(sTMp);
    end;
    f1Bunkai.maxvalue  :=  iMax;

    // 回収種別 未満/以上の設定
    f1KAIJY1.SelectItems.Clear;
	f1KAIJY1.Value        :=  0;
    f1KAIJYNM1.Caption    :=  '';

    f1KAIJY2.SelectItems.Clear;
	f1KAIJY2.Value        :=  0;
    f1KAIJYNM2.Caption    :=  '';

	for i := Low(_KaiJyItems) to High(_KaiJyItems) do
    begin
    	iMax    :=  _KaiJyItems[i].iCode;
		sTmp    :=  IntToStr(_KaiJyItems[i].iCode) + ':' + _KaiJyItems[i].sName;
		f1KAIJY1.SelectItems.Add(sTMp);
        f1KAIJY2.SelectItems.Add(sTMp);
    end;
    f1KAIJY1.maxvalue  :=  iMax;
    f1KAIJY2.maxvalue  :=  iMax;

    // 端数処理方法の設定
    f1KAIHasu.SelectItems.Clear;
	f1KAIHasu.Value        :=  0;
    f1KAIHasuNM.Caption    :=  '';

	for i := Low(_KaiHasItems) to High(_KaiHasItems) do
    begin
    	iMax    :=  _KaiHasItems[i].iCode;
		sTmp    :=  IntToStr(_KaiHasItems[i].iCode) + ':' + _KaiHasItems[i].sName;
		f1KAIHasu.SelectItems.Add(sTMp);
    end;
    f1KAIHasu.maxvalue  :=  iMax;

	// 手数料負担区分の設定
    f1TesuryoFutan.SelectItems.Clear;
	f1TesuryoFutan.Value        :=  0;
    f1TesuryoFutanNm.Caption    :=  '';

	for i := Low(_TsryFtnItems) to High(_TsryFtnItems) do
    begin
    	iMax    :=  _TsryFtnItems[i].iCode;
		sTmp    :=  IntToStr(_TsryFtnItems[i].iCode) + ':' + _TsryFtnItems[i].sName;
		f1TesuryoFutan.SelectItems.Add(sTMp);
    end;
    f1TesuryoFutan.maxvalue  :=  iMax;

	// EDI採用区分の設定
    f1Ku.SelectItems.Clear;
	f1Ku.Value          :=  0;
    f1KuNm.Caption      :=  '';

	for i := Low(_EDIKuItems) to High(_EDIKuItems) do
    begin
    	iMax    :=  _EDIKuItems[i].iCode;
		sTmp    :=  IntToStr(_EDIKuItems[i].iCode) + ':' + _EDIKuItems[i].sName;
		f1Ku.SelectItems.Add(sTMp);
    end;
	f1Ku.MaxValue  :=  iMax;

	// 請求区分の設定
    f1SKYKBN.SelectItems.Clear;
	f1SKYKBN.Value      :=  0;
    f1SKYKBNNM.Caption  :=  '';

//<175>↓
    for i := Low(m_SeikyuKbnItems) to High(m_SeikyuKbnItems) do
    begin
        iMax    :=  m_SeikyuKbnItems[i].iCode;
        sTmp    :=  IntToStr(m_SeikyuKbnItems[i].iCode) + ':' + m_SeikyuKbnItems[i].sName;
        f1SKYKBN.SelectItems.Add(sTMp);
    end;
//<175>↑
    f1SKYKBN.maxvalue  :=  iMax;
//<Denshi> ADD St
    // 電子債権データ種別
    MNDenDataKbn.SelectItems.Clear;
    for i := Low(DenshiNames) to High(DenshiNames) do
    begin
        iMax    := DenshiNames[i].iCode;
        sTmp    := IntToStr(DenshiNames[i].iCode) + ':' + DenshiNames[i].sName;
        MNDenDataKbn.SelectItems.Add(sTMp);
    end;
    MNDenDataKbn.MaxValue := iMax;

//<187> MOD St
    // 預金種目
//    moComCtrls.Add(TComponentController.Create(
//        lblAccKbnName_Denshi, MNAccKbn_Denshi, AccNames_Densai, -1));
	DMemDensaiAccKbn.Open;
	for i := Low(AccNames_Densai) to High(AccNames_Densai) do
	begin
	    DMemDensaiAccKbn.Append;
	    DMemDensaiAccKbnCode.AsInteger	:= AccNames_Densai[i].iCode;
	    DMemDensaiAccKbnName.AsString	:= AccNames_Densai[i].sName;
	    DMemDensaiAccKbn.Post;
	end;
//<187> MOD Ed
//<Denshi> ADD Ed
//<Account> ADD St
    // 預金種目
    moComCtrls.Add(TComponentController.Create(
        lblAccKbnName_Account, numAccKbn_Account, CsAccNames_Account, -1));
//<Account> ADD Ed
//<GAIKA> ADD St
    i := moComCtrls.Add(TComponentController.Create(                    // 戻り値取得 <GFB> MOD
        lblSaiyoKbn_Gaika, numSaiyoKbn_Gaika, SaiyoNames_Gaika, -1));
//<GAIKA> ADD Ed
//<GFB> ADD St
    oCom := TComponentController(moComCtrls[i]);
    oCom.SetChangeEvent([numSaiyoKbn_GaikaChange]);
    oCom.Change();
//<GFB> ADD Ed
end;

//-----------------------------------------------------------------------------
// fnSetKAISHAItems()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ｺｰﾄﾞの桁数/属性対応
//                自由管理項目を設定する
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnSetKAISHAItems();
begin

    // 取引先ｺｰﾄﾞの属性/桁数対応
    case m_TRCodeAttr of
        // 数値属性
        0:  begin
                f0CODE          .InputAttr      :=  iaZeroSup;
	        	f0CODE			.InputFlagEnabled:=	True;
                f1NayoseOyaCode .InputAttr      :=  iaZeroSup;
	        	f1NayoseOyaCode	.InputFlagEnabled:=	True;
                GridNayoseCode  .Alignment      :=  taRightJustify;
                GridNayoseOyaCode.Alignment     :=  taRightJustify;
                GridNayoseCode  .EditAlignment  :=  taRightJustify;
                GridNayoseOyaCode.EditAlignment :=  taRightJustify;
                GridNayoseCode  .imeMode        :=  imDisable;  // <125>
                GridNayoseOyaCode.imeMode       :=  imDisable;  // <125>
                GridNayoseCode  .Hankaku        :=  FALSE;      // <125>
                GridNayoseOyaCode.Hankaku       :=  FALSE;      // <125>
                NayoseOyaCode2	.InputAttr      :=  iaZeroSup;
	        	NayoseOyaCode2  .InputFlagEnabled:=	True;

                f2OyaCode	.InputAttr      :=  iaZeroSup;     //<163>
	        	f2OyaCode   .InputFlagEnabled:=	True;          //<163>
                f2KoCode	.InputAttr      :=  iaZeroSup;     //<163>
	        	f2KoCode    .InputFlagEnabled:=	True;          //<163>

            end;
        // 数値(前ｾﾞﾛ有)属性
        1:  begin
                f0CODE          .InputAttr      :=  iaZeroPad;
	        	f0CODE			.InputFlagEnabled:=	True;
                f1NayoseOyaCode .InputAttr      :=  iaZeroPad;
	        	f1NayoseOyaCode	.InputFlagEnabled:=	True;
                GridNayoseCode  .Alignment      :=  taRightJustify;
                GridNayoseOyaCode.Alignment     :=  taRightJustify;
                GridNayoseCode  .EditAlignment  :=  taRightJustify;
                GridNayoseOyaCode.EditAlignment :=  taRightJustify;
                GridNayoseCode  .imeMode        :=  imDisable;  // <125>
                GridNayoseOyaCode.imeMode       :=  imDisable;  // <125>
                GridNayoseCode  .Hankaku        :=  FALSE;      // <125>
                GridNayoseOyaCode.Hankaku       :=  FALSE;      // <125>
                NayoseOyaCode2  .InputAttr      :=  iaZeroPad;
	        	NayoseOyaCode2	.InputFlagEnabled:=	True;

                f2OyaCode	.InputAttr      :=  iaZeroPad;      //<163>
	        	f2OyaCode   .InputFlagEnabled:=	True;           //<163>
                f2KoCode	.InputAttr      :=  iaZeroPad;      //<163>
	        	f2KoCode    .InputFlagEnabled:=	True;           //<163>

            end;
        // ﾌﾘｰ属性
        2:  begin
// <110>                f0CODE          .InputAttr      :=  iaFree;
// <110>               f1NayoseOyaCode .InputAttr      :=  iaFree;
                f0CODE          .InputAttr      :=  iaNone;
                f1NayoseOyaCode .InputAttr      :=  iaNone;
                GridNayoseCode  .Alignment      :=  taLeftJustify;
                GridNayoseOyaCode.Alignment     :=  taLeftJustify;
                GridNayoseCode  .EditAlignment  :=  taLeftJustify;
                GridNayoseOyaCode.EditAlignment :=  taLeftJustify;
                GridNayoseCode  .imeMode        :=  imClose;    // <125>
                GridNayoseOyaCode.imeMode       :=  imClose;    // <125>
                GridNayoseCode  .Hankaku        :=  TRUE;       // <125>
                GridNayoseOyaCode.Hankaku       :=  TRUE;       // <125>
                NayoseOyaCode2  .InputAttr      :=  iaNone;

                f2OyaCode	.InputAttr      :=  iaNone;   //<163>
                f2KoCode	.InputAttr      :=  iaNone;   //<163>

            end;
    end;

    f0CODE          .MaxLength    :=  m_TRCodeDigit;
    f1NayoseOyaCode .MaxLength    :=  m_TRCodeDigit;
    GridNayoseCode.MaxLength      :=  m_TRCodeDigit;
    GridNayoseOyaCode.MaxLength   :=  m_TRCodeDigit;
    NayoseOyaCode2  .MaxLength    :=  m_TRCodeDigit;
    f2OyaCode      .MaxLength     :=  m_TRCodeDigit; //<163>
    f2KoCode      .MaxLength      :=  m_TRCodeDigit; //<163>

    LblTRCODE.Caption   :=  '得意先コード';
    if ( Trim(m_TRJHojyoName) <> '' ) then
    begin
        LblTRCODE.Caption   :=  m_TRJHojyoName + 'コード';
    end;


    // 部門ｺｰﾄﾞの属性/桁数対応
    case m_BMCodeAttr of
        // 数値属性
        0:  f1BMCODE    .InputAttr    :=  iaZeroSup;
        // 数値(前ｾﾞﾛ有)属性
        1:  f1BMCODE    .InputAttr    :=  iaZeroPad;
        // ﾌﾘｰ属性
        2:  f1BMCODE    .InputAttr    :=  iaNone;
    end;
    f1BMCODE    .MaxLength    :=  m_BMCodeDigit;

    LblBMCODE.Caption   :=  '部門ｺｰﾄﾞ';
    if ( Trim(m_BMJHojyoName) <> '' ) then
    begin
        LblBMCODE.Caption   :=  m_BMJHojyoName + 'ｺｰﾄﾞ';
    end;

    // 社員ｺｰﾄﾞの属性/桁数対応
    case m_TNCodeAttr of
        // 数値属性
        0:  f1TNCODE    .InputAttr    :=  iaZeroSup;
        // 数値(前ｾﾞﾛ有)属性
        1:  f1TNCODE    .InputAttr    :=  iaZeroPad;
        // ﾌﾘｰ属性
        2:  f1TNCODE    .InputAttr    :=  iaNone;
    end;

    f1TNCODE    .MaxLength    :=  m_TNCodeDigit;

    LblTNCODE.Caption   :=  '担当者ｺｰﾄﾞ';
    if ( Trim(m_TNJHojyoName) <> '' ) then
    begin
        LblTNCODE.Caption   :=  m_TNJHojyoName + 'ｺｰﾄﾞ';
    end;

end;

//-----------------------------------------------------------------------------
// fnInzForm()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｫｰﾑ初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnInzForm();
//<Account> ADD St
var
    idx : Integer;
//<Account> ADD Ed
begin

    m_TRNCode   :=  0;

    f0CODE         .Zero := FALSE;      //<122>
    f0CODE         .InputFlag := TRUE;  //<122>

    f1NayoseOyaCode.Zero := FALSE;      //<122>
    NayoseOyaCode2 .Zero := FALSE;      //<122>
    f1TNCODE       .Zero := FALSE;      //<122>
    f1BMCODE       .Zero := FALSE;      //<122>

    f1NayoseOyaCode.InputFlag := TRUE;  //<122>
    NayoseOyaCode2 .InputFlag := TRUE;  //<122>
    f1TNCODE       .InputFlag := TRUE;  //<122>
    f1BMCODE       .InputFlag := TRUE;  //<122>

    f2OyaCode      .Zero := FALSE;      //<163>
    f2OyaCode      .InputFlag := TRUE;  //<163>

    f2KoCode       .Zero := FALSE;      //<163>
    f2KoCode       .InputFlag := TRUE;  //<163>

    // [f1]項目の初期化
    fnInzFormf1;

    // 初期化
	m_BtUpdFlg  :=  TRUE;

    // ﾎﾞﾀﾝの状態を制御する
    fnBtnEnbChg;

    // 編集状態ｽｲｯﾁを初期化する
//<DENSHI> DEL    m_EdtSw := FALSE;

    DtlCsTab.Items[0].Selected	:= TRUE;
//<Account> MOD St
{
    DtlCsTab.Items[1].Selected	:= FALSE;
    DtlCsTab.Items[DTLTAB_DENSHI].Selected	:= FALSE;  //<DENSHI> ADD
}
    for idx := 1 to DTLTAB_LAST do
    begin
        DtlCsTab.Items[idx].Selected := false;
    end;
//<Account> MOD Ed
//    HedCsTab.Items.Selected	:= 0;
    if HedCsTab.Items.Selected = 1 then
	    PnlNayoseInfo.Visible   :=  TRUE
    else
	    PnlNayoseInfo.Visible   :=  FALSE;
    PnlUri.Visible          :=  TRUE;

    SeikyuKbnLabel.Enabled  := FALSE;
    f1SKYKBN.Enabled      	:= FALSE;
    f1SKYKBNNM.Enabled 		:= FALSE;
    NayoseOyaLabel.Enabled  := FALSE;
    f1NayoseNM.Enabled      := FALSE;
    f1NayoseOyaCode.Enabled := FALSE;

    //<163>
    f2OyaName.Caption  := '';
    f2KoName.Caption  := '';

    //<100>
    TempMode.visible := FALSE;
    uvTempFlg        := FALSE;
//<DENSHI> ADD St
    MNDenDataKbn.Value := 0;
    fnInzFormDenshi();
    if Assigned(m_DensaiInfo) then
    begin
        FreeAndNil(m_DensaiInfo);
    end;
//<Account> ADD St

//<187> ADD St
    DMemDensai1.BeforePost := Nil;
    DMemDensai1.Active := False;
    DMemDensai1.Active := True;

    DMemDensai1Sv.Active := False;
    DMemDensai1Sv.Active := True;

	if DMemDensai1.RecordCount > 0 then
	    DMemDensai1.First;
    DMemDensai1.BeforePost := DMemDensai1BeforePost;
//<187> ADD Ed

    fnInzFormAccount();
    if Assigned(moAccCsInfo) then
    begin
        FreeAndNil(moAccCsInfo);
    end;
//<Account> ADD Ed
//<GAIKA> ADD St
    numSaiyoKbn_Gaika.InputFlag := True;
    numSaiyoKbn_Gaika.Value     := 0;
    lblSaiyoKbn_Gaika.Caption   := '';
    numSaiyoKbn_Gaika.Tag       := 0;
//<GAIKA> ADD Ed
//<GFB> ADD St
    txtSoukinName1_Gaika.Text := '';
    txtSoukinName2_Gaika.Text := '';
    txtSoukinName3_Gaika.Text := '';
//<GFB> ADD Ed
    m_EdtSw := FALSE;
//<DENSHI> ADD Ed
//<187> ADD St
    //削除ボタンの制御
    ControlDeleteButton
//<187> ADD Ed

end;

//-----------------------------------------------------------------------------
// fnInzFormf1()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｫｰﾑ初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnInzFormf1();
begin

    // [f1]項目の初期化
    MjsDispCtrl.MjsClrCtrls(Self,'f1');

    // [f1]項目を使用不可にする
    tbsKihon.Enabled  := FALSE;
    tbsNyukin.Enabled := FALSE;
    tbsDenshiSaiken.Enabled := False;  //<DENSHI> ADD
    tbsAccountInfo.Enabled := False;   //<Account> ADD
    tbsGaikaInfo.Enabled := False;     //<GAIKA> ADD

    m_EdtSw         := FALSE;
    m_RecGetSw      := FALSE;

    // 郵便番号枝番
  	//f1POSTNO2.Zero  := FALSE;
  	f1POSTNO2.InputFlag  := TRUE;

    cbNykRootKbn.Checked := FALSE;
end;

//-----------------------------------------------------------------------------
// fnBtnEnbChg()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾞﾀﾝの状態を制御する
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnBtnEnbChg();
//<178> ADD St
var
    nextTabVisible : Boolean;
    i,
    iSelect : Integer;
//<178> ADD Ed
begin

    MjsDispCtrl.MjsSetEnabled(Self,ucBtnBEFOR,FALSE);
    MjsDispCtrl.MjsSetEnabled(Self,ucBtnAfter,FALSE);
	MjsDispCtrl.MjsSetEnabled(Self,ucBtnOK,FALSE);
	MjsDispCtrl.MjsSetEnabled(Self,ucBtnNG,FALSE);

    // f0CODEが表示されている時はExit
//    if ( HedPanel.Enabled = TRUE ) then Exit;
//<178> ADD St
    nextTabVisible := false;
    iSelect := DtlCsTab.Items.Selected;

    for i := iSelect + 1 to DTLTAB_LAST do
    begin
        if DtlCsTab.Items[i].Visible then
        begin
            nextTabVisible := true;
            break;
        end;
    end;
//<178> ADD Ed
    if ( m_RecGetSw ) then
    begin
        //MjsSetEnabled(Self,ucBtnOK,m_BtUpdFlg); <147>
        if uvDispFlg = 0 then MjsSetEnabled(Self,ucBtnOK,m_BtUpdFlg);
        MjsSetEnabled(Self,ucBtnNG,TRUE);
    	//if not uvTempFlg then  <149>
        begin
            if DtlCsTab.Items.Selected = 0 then
            begin
                MjsSetEnabled(Self,ucBtnBEFOR,False);
                //MjsSetEnabled(Self,ucBtnAFTER,True);  <147>
                if uvDispFlg = 0 then MjsSetEnabled(Self,ucBtnAFTER,True);

            end
//<DENSHI> MOD st
{
            else
            begin
                //MjsSetEnabled(Self,ucBtnBEFOR,True);  <147>
                if uvDispFlg = 0 then MjsSetEnabled(Self,ucBtnBEFOR,True);
                MjsSetEnabled(Self,ucBtnAFTER,False);
            end;
}
//<Account> MOD St
{
            else if DtlCsTab.Items.Selected = DTLTAB_NYUKIN then
            begin
                if uvDispFlg = 0 then
                begin
                    MjsSetEnabled(Self,ucBtnBEFOR,True);
                    MjsSetEnabled(Self,ucBtnAFTER,(DtlCsTab.Items[DTLTAB_DENSHI].Visible));
                end;
            end
            else
            begin
                if uvDispFlg = 0 then MjsSetEnabled(Self,ucBtnBEFOR,True);

                MjsSetEnabled(Self,ucBtnAFTER,False);
            end;
}
            else if DtlCsTab.Items.Selected = DTLTAB_LAST then
            begin
                MjsSetEnabled(Self,ucBtnBEFOR, (uvDispFlg = 0));
                MjsSetEnabled(Self,ucBtnAFTER,False);
            end
            else
            begin
                MjsSetEnabled(Self,ucBtnBEFOR, (uvDispFlg = 0));
//<178> DEL                MjsSetEnabled(Self,ucBtnAFTER, (uvDispFlg = 0));
                MjsSetEnabled(Self,ucBtnAFTER, (uvDispFlg = 0) and nextTabVisible);  //<178> ADD
            end;
//<Account> MOD Ed
//<DENSIH> MOD Ed
        end;
    end;

end;

//-----------------------------------------------------------------------------
// BtnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾞﾀﾝｸﾘｯｸ処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.BtnClick(Sender: TObject);
begin

    fnBtnOnChange(TComponent(Sender).Name);

end;

//-----------------------------------------------------------------------------
// fnBtnOnChange()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾞﾀﾝOnChange処理
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnBtnOnChange(pName: String): Boolean;
var
    lvCompName		:	string;
	lvTabSelect		:	Integer;
    idx             :   Integer;  //<Account> ADD
begin

    Result := FALSE;

     // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    if ( pName = '' ) then
    begin
        lvCompName := '';
        if ( Screen.ActiveControl <> nil ) then
            lvCompName := TComponent(Screen.ActiveControl).Name
        else
    		Exit;
    end
    else
        lvCompName := pName;

	//登録ﾎﾞﾀﾝ
    if	    ( lvCompName = ucBtnOK )		then
    begin
        fnRecUpd;
        Exit;
    end;

    //ｷｬﾝｾﾙﾎﾞﾀﾝ
	if		( lvCompName = ucBtnNG )      	then
    begin
        fnCancel(TRUE);
        Exit;
    end;

    // ﾀﾌﾞIndec取得
	lvTabSelect := DtlCsTab.Items.Selected;

	{前移動ﾎﾞﾀﾝ}
    if		lvCompName = ucBtnBEFOR	    then
	begin
		if lvTabSelect > 0 then
        begin
//<Account> MOD St
//			DtlCsTab.Items.Selected := lvTabSelect - 1;
            for idx := lvTabSelect - 1 downto DTLTAB_FIRST do
            begin
                if DtlCsTab.Items[idx].Visible then
                begin
                    DtlCsTab.Items.Selected := idx;
                    break;
                end;
            end;
//<Account> MOD Ed
            fnDtlCsTabNextSetFcous;
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

		if DtlCsTab.Items.Selected < (DtlCsTab.Items.count - 1) then
        begin
//<Account> MOD St
//			DtlCsTab.Items.Selected := lvTabSelect + 1;
            for idx := lvTabSelect + 1 to DTLTAB_LAST do
            begin
                if DtlCsTab.Items[idx].Visible then
                begin
                    DtlCsTab.Items.Selected := idx;
                    break;
                end;
            end;
//<Account> MOD Ed
            fnDtlCsTabNextSetFcous;
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
// fnRecUpd()
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE : 正常終了　FALSE : 異常終了
//      MEMO    : 更新処理
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnRecUpd(): Boolean;
var
    dqMasterData    : TMQuery;
    lvDaigaeNCD     : Extended;
    nUsKinKbn		: Integer;
    cKeisyoKbn		: String;
    Qry				: TMQuery;

    m_cDBSelect_Rel	: TFDConnection;   //<Rel>

    UpdDefaultValue : Boolean;     //<154>

{$I JNTSProcUtil.inc}
    function ChkSelLicense: String;
    begin
    	Result := '';

	    if CheckModuleLicense(m_pRec,FXLicense.SEL_HAN) then    // 販売ﾗｲｾﾝｽﾁｪｯｸ
			Exit;

        //販売未導入の場合は住所を設定
    	Result := '   ,PostNo1        =   :nPostNo1       '   // 郵便番号(基番)
               +  '   ,PostNo2        =   :nPostNo2       '   // 郵便番号(枝番)
               +  '   ,Ads1           =   :nAds1          '   // 住所(上段)
               +  '   ,Ads2           =   :nAds2          '   // 住所(下段)
               +  '   ,Tel1           =   :nTel1          '   // 電話番号
               +  '   ,SectionName    =   :nSectionName   '   // 送付先部署
               +  '   ,TanNm          =   :nTanNm         '   // 送付先担当者
               +  '   ,MailAddress    =   :nMailAddress   '   // メールアドレス
               +  '   ,KeisyoKbn      =   :nKeisyoKbn     ';  // 送付先担当者敬称
    end;

begin
    Result := FALSE;


    // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
    if ( fnFldChk(Self, TRUE) = FALSE ) then
    begin
        Result := FALSE;
        Exit;
    end;

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;

    	// ﾄﾗﾝｻﾞｸｼｮﾝの開始
	    //m_cDataModule.BeginTran (m_cDBSelect);
	    m_cDataModule.BeginTran (m_cDBSelect_Rel);

    	// MQueryの構築
		dqMasterData := TMQuery.Create (Self);
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, dqMasterData);
//↑<Rel>

	SessionPractice(C_ST_PROCESS);				// <155>

    try
        try
            with (dqMasterData) do
            begin
                Close();
                SQL.Clear();
                SQL.Add('update MTOKUI SET              '
                    +   '    YsGKin     = :nYsGkin      '   // 与信限度額
                    +   '   ,NYKRootKbn = :nNYKRootKbn  '   // 債権名寄せ区分
                    +   'where (NCode   = :nNCode)      ');

                ParamByName('nNCode').AsFloat  := m_TRNCode;

                // 与信限度額
                ParamByName('nYsGkin').AsFloat := Trunc(f1YSGKIN.Value);

                // 債権名寄せ区分
                if (cbNykRootKbn.Checked) then
                    ParamByName('nNYKRootKbn').AsInteger := 1
                else
                    ParamByName('nNYKRootKbn').AsInteger := 0;

                ExecSQL();

                Close();
                SQL.Clear();
                SQL.Add('update MTOKUI_SEL SET          '
                    +   '    USDenPfm     = :nUSDenPfm  '   // 納品書ﾌｫｰﾑ
                    +   '   ,USGKei       = :nUSGKei    '   // 売上合計欄税印字
                    +   '   ,SSsyoPfm     = :nSSsyoPfm  '   // 請求書ﾌｫｰﾑ
                    +   '   ,SSsyoKgm     = :nSSsyoKgm  '   // 合計欄税印字
                    +   '   ,TnNCode      = :nTnNCode   '   // 担当者コード
                    +   '   ,BmNCode      = :nBmNCode   '   // 部門コード
                    +   '   ,RyoPfm       = :nRyoPfm    '   // 領収証ﾌｫｰﾑ
                    +   '   ,RyoTeki      = :nRyoTeki   '   // 領収証の但し書き
                    +   '   ,SyuRyoKbn    = :nSyuRyoKbn '   // 集金用領収証
		            +   '   ,UsKinKbn     = :nUsKinKbn  '	// 請求区分
                    +	ChkSelLicense()						// 販売未導入の場合は住所を設定
                    +   'where (BaseNCode = :nNCode)    '
                    +   '  and (RecKbn    = 1)    ');

                ParamByName('nNCode').AsFloat   :=  m_TRNCode;
                // 納品書ﾌｫｰﾑ
                ParamByName('nUSDenPfm')    .AsInteger  := Trunc(f1USDENPFM.Value);
                // 売上合計欄税印字
                ParamByName('nUSGKei')      .AsInteger  := Trunc(f1USGKEI.Value);
                // 担当者コード
                ParamByName('nTnNCode')     .AsFloat    := fnGetNCODE(f1TNCODE.text, 25, m_TnCodeAttr);
                // 部門コード
                ParamByName('nBmNCode')     .AsFloat    := fnGetNCODE(f1BMCODE.text, 41, m_BmCodeAttr);
                // 請求書ﾌｫｰﾑ
                ParamByName('nSSsyoPfm')    .AsInteger  := Trunc(f1SSDENPFM.Value);
                // 合計欄税印字
                ParamByName('nSSsyoKgm')    .AsInteger  := Trunc(f1SSGKEI.Value);
                // 領収証ﾌｫｰﾑ
                ParamByName('nRyoPfm')      .AsInteger  := Trunc(f1RYOPFM.Value);
                // 領収証の但し書き
                ParamByName('nRyoTeki')     .AsInteger  := Trunc(f1RYOTEKI.Value);
                // 集金用領収証
                ParamByName('nSyuRyoKbn')   .AsInteger  := Trunc(f1SYURYOKBN.Value);
                // 請求区分
                nUsKinKbn := Trunc(f1SKYKBN.Value);
                if nUsKinKbn = 0 then
	                nUsKinKbn := 1;
                ParamByName('nUsKinKbn')    .AsInteger  := nUsKinKbn;

                if ChkSelLicense() <> '' then
                begin
                    if	( Trunc (f1POSTNO1.Value) = 0 ) then
                    begin
                        // 郵便番号(基番)
                        ParamByName ('nPostNo1').Clear ();
                        ParamByName ('nPostNo1').DataType	:= ftInteger;
                        // 郵便番号(枝番)
                        ParamByName ('nPostNo2').Clear ();
                        ParamByName ('nPostNo2').DataType	:= ftInteger;
                    end
                    else
                    begin
                        // 郵便番号(基番)
                        ParamByName ('nPostNo1').AsInteger	:= Trunc (f1POSTNO1.Value);
	                    if	( f1POSTNO2.Text = '' ) then
	                    begin
	                        // 郵便番号(枝番)
	                        ParamByName ('nPostNo2').Clear ();
	                        ParamByName ('nPostNo2').DataType	:= ftInteger;
                        end
                        else
                        begin
	                        // 郵便番号(枝番)
	                        ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
                        end;
                    end;

                    // 住所(上段)
                    ParamByName('nAds1')        .AsString	:= f1ADS1       .Text;
                    // 住所(下段)
                    ParamByName('nAds2')        .AsString	:= f1ADS2       .Text;
                    // 電話番号
                    ParamByName('nTel1')        .AsString	:= f1TEL1       .Text;
                    // 送付先部署名称
                    ParamByName('nSectionName') .AsString	:= f1SectionName.Text;
                    // 担当者名称
                    ParamByName('nTanNm')       .AsString	:= f1TanNm      .Text;

                    // 敬称区分
                    cKeisyoKbn := f1KEISYO.text;
                    //if Trim(cKeisyoKbn) = 'なし' then  <171>  敬称の「なし」を空欄に置き換える処理はやめる
                    //    cKeisyoKbn := '';              <171>
                    ParamByName('nKeisyoKbn')   .AsString	:= cKeisyoKbn;
                    // メールアドレス
                    ParamByName('nMailAddress') .AsString	:= f1MailAd     .Text;
				end;

                ExecSQL();


// <145>  START
//MTOKUI_CRDが存在しない場合は、INSERTする。
                   //===== 取引先(債権)にInsert =====
                    Close();
                    SQL.Clear;
                    SQL.Add(' insert into MTOKUI_CRD '+
                        ' (BaseNCode    , ' +
                        ' Ku            , ' +
                        ' TesuryoFutan    ');

                    {
                    // 詳細からの場合
                    if bSw = True then
                    begin
                        SQL.Add('       , ' +
                        ' PostNo1       , ' +
                        ' PostNo2       , ' +
                        ' ADS1          , ' +
                        ' ADS2          , ' +
                        ' TEL1          , ' +
                        ' TEL2          , ' +
                        ' FAX1            ');
                    end;
                    }
                    SQL.Add(
                        ' ) SELECT         ' +
                        ' NCode 	     , ' +
                        ' 0              , ' +
                        ' 0                ' +
                        ' FROM MTOKUI      ' +
                        ' WHERE (NCode   = :nNCode)            ' +
                        '  AND              ' +
                        ' NOT EXISTS (SELECT BaseNCode FROM  MTOKUI_CRD WHERE  ' +
                        ' BaseNCode   = :nNCode ) '
                        );

                	ParamByName('nNCode').AsFloat   :=  m_TRNCode;

                    ExecSQL();
//<145>  END

                Close();
                SQL.Clear();
                SQL.Add('update MTOKUI_CRD SET                  '
                    +   '    PostNo1        =   :nPostNo1       '   // 郵便番号(基番)
                    +   '   ,PostNo2        =   :nPostNo2       '   // 郵便番号(枝番)
                    +   '   ,Ads1           =   :nAds1          '   // 住所(上段)
                    +   '   ,Ads2           =   :nAds2          '   // 住所(下段)
                    +   '   ,Tel1           =   :nTel1          '   // 電話番号
                    +   '   ,SectionName    =   :nSectionName   '   // 送付先部署
                    +   '   ,TanNm          =   :nTanNm         '   // 送付先担当者
                    +   '   ,MailAddress    =   :nMailAddress   '   // メールアドレス
                    +   '   ,KeisyoKbn      =   :nKeisyoKbn     '   // 送付先担当者敬称
                    +   '   ,KanaName1      =   :nKanaName1     '   // ｶﾅ名称
                    +   '   ,KanaName2      =   :nKanaName2     '   // ｶﾅ名称 //<156>
                    +   '   ,KanaName3      =   :nKanaName3     '   // ｶﾅ名称 //<156>
                    +   '   ,TesuryoFutan   =   :nTesuryoFutan  '   // 手数料負担区分
                    +   '   ,Ku             =   :nKu            '   // EDI採用区分
                    +   '   ,DefoltEDI      =   :nDefoltEDI     '   // EDI情報
                    +   '   ,Site           =   :nSite          '   // 手形サイト
                    +   '   ,BunkaiKbn      =   :nBunkaiKbn     '   // 分解方法　
                    +   '   ,StdRitu        =   :nStdRitu       '   // 入金方法の基準値
                    +   '   ,Jouken1        =   :nJouken1       '   // 回収種別　
                    +   '   ,Jouken2        =   :nJouken2       '   // 回収種別　
                    +   '   ,HasuuHou       =   :nHasuuHou      '   // 端数処理方法
                    +   '   ,CngNCode       =   :nCngNCode      '   // 名寄せ親代替取引先
                    +   '   ,UpdTantoNCode  =   :nUpdTantoNCode '   //
                    +   '   ,GaikaKbn       =   :nGaikaKbn      '   // 外貨採用区分  <GAIKA> ADD
//<GFB> ADD St
                    +   '   ,GaikaSoukinName1   =   :nGaikaSoukinName1     '   // 外貨送金人名称１
                    +   '   ,GaikaSoukinName2   =   :nGaikaSoukinName2     '   // 外貨送金人名称２
                    +   '   ,GaikaSoukinName3   =   :nGaikaSoukinName3     '   // 外貨送金人名称３
//<GFB> ADD Ed
                    +   'WHERE (BaseNCode   = :nNCode)          ');

                ParamByName('nNCode').AsFloat   :=  m_TRNCode;

                if	( Trunc (f1POSTNO1.Value) = 0 ) then
        		begin
                    // 郵便番号(基番)
        			ParamByName ('nPostNo1').Clear ();
        			ParamByName ('nPostNo1').DataType	:= ftInteger;
                    // 郵便番号(枝番)
        			ParamByName ('nPostNo2').Clear ();
        			ParamByName ('nPostNo2').DataType	:= ftInteger;
        		end
        		else
        		begin
                    // 郵便番号(基番)
        			ParamByName ('nPostNo1').AsInteger	:= Trunc (f1POSTNO1.Value);
                    if	( f1POSTNO2.Text = '' ) then
                    begin
	                    // 郵便番号(枝番)
	        			ParamByName ('nPostNo2').Clear ();
	        			ParamByName ('nPostNo2').DataType	:= ftInteger;
                    end
                    else
                    begin
	                    // 郵便番号(枝番)
	        			ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
                    end;
        		end;

                // 住所(上段)
                ParamByName('nAds1')        .AsString	:= f1ADS1       .Text;
                // 住所(下段)
        		ParamByName('nAds2')        .AsString	:= f1ADS2       .Text;
                // 電話番号
        		ParamByName('nTel1')        .AsString	:= f1TEL1       .Text;
                // 送付先部署名称
        		ParamByName('nSectionName') .AsString	:= f1SectionName.Text;
                // 担当者名称
        		ParamByName('nTanNm')       .AsString	:= f1TanNm      .Text;
                // 敬称区分
                cKeisyoKbn := f1KEISYO.text;
                //if Trim(cKeisyoKbn) = 'なし' then  <171>
	            //    cKeisyoKbn := '';
        		ParamByName('nKeisyoKbn')   .AsString	:= cKeisyoKbn;
                // メールアドレス
        		ParamByName('nMailAddress') .AsString	:= f1MailAd     .Text;
                // ｶﾅ名称
                ParamByName('nKanaName1')   .AsString   := f1KanaName1  .Text;
                ParamByName('nKanaName2')   .AsString   := f1KanaName2  .Text;  //<156>
                ParamByName('nKanaName3')   .AsString   := f1KanaName3  .Text;  //<156>

                // 手数料負担区分
                ParamByName('nTesuryoFutan').AsInteger  := Trunc (f1TesuryoFutan.Value );
                // EDI採用区分
                ParamByName('nKu')          .AsInteger  := Trunc (f1Ku.Value );
                // EDI情報
                ParamByName('nDefoltEDI')   .AsString   := f1DefoltEDI  .Text;
                // 手形サイト
                ParamByName('nSite')        .AsInteger  := Trunc (f1TGSITE.Value );

                // 入金情報 : 分解方法
                ParamByName('nBunkaiKbn').AsInteger     := f1Bunkai.AsInteger;

                if f1Bunkai.value = 0 then // 入金情報 : 回収割合 (率)
                    ParamByName('nStdRitu').AsFloat     := f1KAIRITU.value
                else // 入金情報 : 回収割合 (金額)
                    ParamByName('nStdRitu').AsFloat     := f1KAISYWKIN.value;

                // 入金情報 : 回収種別 未満
                ParamByName('nJouken1').AsInteger       :=  f1KAIJY1.AsInteger;
                // 入金情報 : 回収種別 以上
                ParamByName('nJouken2').AsInteger       :=  f1KAIJY2.AsInteger;
                // 入金情報 : 端数処理方法
                ParamByName('nHasuuHou').AsInteger      :=  f1KAIHasu.AsInteger;
                // 入金情報 : 名寄親代替取引先
                lvDaigaeNCD := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                ParamByName('nCngNCode').AsFloat        :=  lvDaigaeNCD;
                //
                ParamByName('nUpdTantoNCode').AsFloat   :=  m_TantoNCode;
//<GAIKA> ADD St
                // 外貨採用区分
                ParamByName('nGaikaKbn').AsInteger   :=  numSaiyoKbn_Gaika.AsInteger;
//<GAIKA> ADD Ed
//<GFB> ADD St
                // 外貨送金人名称
//<182> MOD St
{
                if (numSaiyoKbn_Gaika.AsInteger <> 0) then
                begin
                    ParamByName('nGaikaSoukinName1').AsString   := txtSoukinName1_Gaika.Text;
                    ParamByName('nGaikaSoukinName2').AsString   := txtSoukinName2_Gaika.Text;
                    ParamByName('nGaikaSoukinName3').AsString   := txtSoukinName3_Gaika.Text;
                end
                else
                begin
                    ParamByName('nGaikaSoukinName1').AsString   := '';
                    ParamByName('nGaikaSoukinName2').AsString   := '';
                    ParamByName('nGaikaSoukinName3').AsString   := '';
                end;
}
                ParamByName('nGaikaSoukinName1').AsString   := txtSoukinName1_Gaika.Text;
                ParamByName('nGaikaSoukinName2').AsString   := txtSoukinName2_Gaika.Text;
                ParamByName('nGaikaSoukinName3').AsString   := txtSoukinName3_Gaika.Text;
//<182> MOD Ed
//<GFB> ADD Ed
                ExecSQL();

//<DENSHI> ADD St
                // 電子記録債権情報の更新
                if Assigned(m_DensaiInfo) then
                begin
                    // 画面パーツの内容をオブジェクトへセット
                    ObjSetDensaiInfo(m_DensaiInfo, m_DensaiInfo.DenDatakbn);

                    if (m_DensaiInfo.Update(dqMasterData) = false) then
                    begin
                        raise Exception.Create('');
                    end;
                end;
//<DENSHI> ADD Ed
//<187> ADD St
                // 電子記録債権情報(でんさいネット)の更新
				UpdateDensai1(dqMasterData);
//<187> ADD Ed
//<Account> ADD St
                // 口座振替取引先情報の更新
                if Assigned(moAccCsInfo) then
                begin
                    // 画面パーツの内容をオブジェクトへセット
                    ObjSetAccCsInfo(moAccCsInfo);

                    if (moAccCsInfo.Update(dqMasterData) = false) then
                    begin
                        raise Exception.Create('');
                    end;
                end;
//<Account> ADD Ed
            end;

            // 代替コードを変更時には代替情報を更新する（親子フラグ、請求区分、請求先内部コード）<101>
            // コードを入れているか、空にしているか？   ×
            // 変更がある場合                           ○  //<121>
//<121>            if ((uvDaiGaeCode =  '') and (f1NayoseOyaCode.text <> '')) or
//<121>               ((uvDaiGaeCode <> '') and (f1NayoseOyaCode.text =  '')) then
            if (uvDaiGaeCode <> f1NayoseOyaCode.text) then
                fnSetDaigaiData(m_TRNCode, lvDaigaeNCD);

            //名寄せ代替コードが設定されている場合は名寄せ情報に登録する
            if (f1NayoseOyaCode.text <> '') then
            begin
                // 名寄せデータが存在しているか
                Qry := TMQuery.Create (Self);
                //m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry); <Rel>
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, Qry);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select count(NKNNCode) as CNT from CRDNayoseInfo '
                        +   'where (MasterKbn = 22 ) '
                        +   '  and (NayoseSyu = 1  ) '
                        +   '  and (NayoseKbn = 1  ) '
                        +   '  and (NayoseOyaNCode = :pOyaCode) '
                        +   '  and (NknNCode       = :pKoCode) ');
                    ParamByName('pOyaCode').AsFloat := m_TRNCode;
                    ParamByName('pKoCode' ).AsFloat := lvDaigaeNCD;

                    Open;

                    if GetFld('CNT').AsInteger = 0 then
	        			MakeNayoseInfo(f0CODE.Text, f1NayoseOyaCode.text, m_TRNCode, lvDaigaeNCD);
                end;
                Qry.Close;
                Qry.Free;

//名寄せ代替親の分類を親の分類へコピーする。 //<165>
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, Qry);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update MTOKUI_SEL set '
                        +   'BUNRUINCODE1 = BUNRUINCODE1_K, '
                        +   'BUNRUINCODE2 = BUNRUINCODE2_K, '
                        +   'BUNRUINCODE3 = BUNRUINCODE3_K, '
                        +   'BUNRUINCODE4 = BUNRUINCODE4_K, '
                        +   'BUNRUINCODE5 = BUNRUINCODE5_K '

                        +   '  from MTOKUI_SEL join '
                        +   '  (select CRD.BASENCODE as CRDNCODE,SEL.BASENCODE as SELNCODE, CRD.CNGNCODE as CNGNCODE, '
                        +   '  SEL.BUNRUINCODE1 as BUNRUINCODE1_K, '
                        +   '  SEL.BUNRUINCODE2 as BUNRUINCODE2_K, '
                        +   '  SEL.BUNRUINCODE3 as BUNRUINCODE3_K, '
                        +   '  SEL.BUNRUINCODE4 as BUNRUINCODE4_K, '
                        +   '  SEL.BUNRUINCODE5 as BUNRUINCODE5_K  '
                        +   '  from MTOKUI_SEL SEL join MTOKUI_CRD CRD on SELNCODE = CNGNCODE and SEL.RECKBN = 1 '
                        +   '  ) MTOKUI_SEL_CRD '
                        +   '  on MTOKUI_SEL.BASENCODE = MTOKUI_SEL_CRD.CRDNCODE '
                        +   '  and  MTOKUI_SEL.RECKBN = 1 '
                        +   '  and  MTOKUI_SEL.BASENCODE   = :pOyaCode ');     //<165>

                        //+   '  and  NknNCode   = :pKoCode ');     //<165>

                    ParamByName('pOyaCode').AsFloat := m_TRNCode;
                    //ParamByName('pKoCode' ).AsFloat := lvDaigaeNCD;    //<165>

                    ExecSql;

                end;
                Qry.Close;
                Qry.Free;

            end;


            // ｺﾐｯﾄ(反映)
//<Rel>     m_cDataModule.Commit (m_cDBSelect);
            m_cDataModule.Commit (m_cDBSelect_Rel);

            // 正常終了
        	Result	:= TRUE;

            if uvTempFlg then
            begin
                uvTmpUSDENPFM  := f1USDENPFM.AsInteger;
                uvTmpSSDENPFM  := f1SSDENPFM.AsInteger;
                uvTmpUSGKEI    := f1USGKEI.AsInteger;
                uvTmpSSGKEI    := f1SSGKEI.AsInteger;
                uvTmpBMCODE    := f1BMCODE.Text;
                uvTmpTNCODE    := f1TNCODE.Text;
                uvTmpRYOPFM    := f1RYOPFM.AsInteger;
                uvTmpRYOTEKI   := f1RYOTEKI.AsInteger;
                uvTmpSYURYOKBN := f1SYURYOKBN.AsInteger;

// <154> ADD-STR
                UpdDefaultValue := False;
                if ((uvTmpJouken1 <> f1KAIJY1.AsInteger) or
                    (uvTmpJouken2 <> f1KAIJY2.AsInteger) or
                    (uvTmpBunkaiKbn <> f1Bunkai.AsInteger) or
                    ((f1Bunkai.AsInteger = 0) and (uvTmpStdRitu <> f1KAIRITU.AsDouble)) or
                    ((f1Bunkai.AsInteger <> 0) and (uvTmpStdRitu <> f1KAISYWKIN.AsDouble)) or

                    (uvTmpTesuryoFutan <> f1TesuryoFutan.AsInteger) or   //<177>
                    (uvTmpKu <> f1Ku.AsInteger) or                       //<177>
                    (uvTmpGaikaSaiyoKbn <> numSaiyoKbn_Gaika.AsInteger) or //<GAIKA> ADD

                    (uvTmpHasuuHou = f1KAIHasu.AsInteger)) then
                begin
                    // テンプレート値に変更があった場合、ＤＢのデフォルト値も更新する
                    UpdDefaultValue := True;
                end;
// <154> ADD-END

                //<149>st
                uvTmpJouken1 	:= f1KAIJY1.AsInteger;
                uvTmpJouken2  	:= f1KAIJY2.AsInteger;
                uvTmpBunkaiKbn  := f1Bunkai.AsInteger;
                if f1Bunkai.AsInteger = 0 then
                	uvTmpStdRitu  	:= f1KAIRITU.AsDouble
                else
                	uvTmpStdRitu     := f1KAISYWKIN.AsDouble;
                uvTmpHasuuHou   := f1KAIHasu.AsInteger;
                //<149>ed

                uvTmpTesuryoFutan :=  f1TesuryoFutan.AsInteger; //<177>
                uvTmpKu           :=  f1Ku.AsInteger; //<177>
                uvTmpGaikaSaiyoKbn := numSaiyoKbn_Gaika.AsInteger;  //<GAIKA> ADD
// <154> ADD-STR
                if UpdDefaultValue then
                begin
                    //FieldsDefaultValueSet_MTOKUI_CRD(m_pRec, m_cDBSelect_Rel, uvTmpJouken1, uvTmpJouken2, uvTmpBunkaiKbn, uvTmpStdRitu, uvTmpHasuuHou);
                    FieldsDefaultValueSet_MTOKUI_CRD(m_pRec, m_cDBSelect_Rel,
                        uvTmpJouken1, uvTmpJouken2, uvTmpBunkaiKbn,
                        uvTmpStdRitu, uvTmpHasuuHou,uvTmpTesuryoFutan,
                        uvTmpKu, uvTmpGaikaSaiyoKbn); //<GAIKA> MOD
                end;
// <154> ADD-END
            end;
//↓<Rel>
    		if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    		begin
        		// 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        		if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_CRD) = false ) or
                   ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) or
                   //CRDNayoseInfo
                   ( m_SyncMaster.fnCall_SYNC(71,JNTSYNC_DELETE)  = false ) or
        		   ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = false ) then
        		begin
            		Result := false;
            		Exit;
        		end;

        		// 更新されたときはSecHojyoDispInfoのメンテを行う。
        		if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,m_TRNCode,dqMasterData) then
        		begin
            		Result := false;
            		Exit;
        		end;

                //子社の実績を作成するため、ストアドを実行 （2007/08/07 add)
                // 実績ﾏｽﾀの作成
                m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc4); //子社

                // PRC_MA0130_103

                if f1SKYKBN.Value = 1 then  //一括請求の場合
                begin
                	with StdProc4 do
                	begin
						BeginExecProc(StdProc4, False);
						try
	                	ParamByName('@pTRNCD')   .AsFloat   := m_TRNCode;   // 得意先ｺｰﾄﾞ
                    	ParamByName('@pSEIKBN_B').AsInteger := 0;           // 変更前請求区分
                    	ParamByName('@pSEIKBN_A').AsInteger := 0;           // 変更後請求区分
                    	ExecProc;
                        finally
                        EndExecProc(StdProc4);
                        end;
                    	if ParamByName('@RETURN_VALUE').AsInteger <> 0 then
      	              		Abort;
                	end;
	            	// ｺﾐｯﾄ(反映)
	            	m_cDataModule.Commit(m_cDBSelect);
                end;
    		end;
//↑<Rel>
        except
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
            m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            Beep;
            // ﾒｯｾｰｼﾞ
    		fnOutputDBErrorMessage;

            // ﾛｰﾙﾊﾞｯｸ(破棄)
// <Rel>   m_cDataModule.Rollback (m_cDBSelect);
			m_cDataModule.Rollback (m_cDBSelect_Rel);
            // 異常終了
    		Result := FALSE;
    		Exit;
        end;
    finally
		SessionPractice(C_ED_PROCESS);			// <155>
        dqMasterData.Close ();
	    dqMasterData.Free  ();
    end;

    // ﾌｫｰﾑの初期化
    fnInzForm;

    // 主ｷｰ項目へﾌｫｰｶｽを移動する
	f0CODE.Text      := '';
	HedPanel.Enabled := TRUE;
    m_AcControl	     := f0CODE;
	m_AcControl.SetFocus;
end;

//-----------------------------------------------------------------------------
// fnCancel()
//      PARAM   : FcsChg    Boolean
//      VAR     :
//      RETURN  :
//      MEMO    : 編集をｷｬﾝｾﾙする
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnCancel(FcsChg: Boolean): Boolean;
var
    nReturn :   Integer;
begin

    Result := FALSE;

    // 編集結果を確認する
    if ( m_EdtSw ) then
    begin
		nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	    if	( nReturn = CONFIRM_RETFOCUSED ) then
    	begin
            Result := TRUE;

            case HedCsTab.Items.Selected of
                0,1:    MjsSetFocus(Self, ucBtnNG);
                  2:    begin
                            if HedCsTab.Items[0].Enabled then
                                HedCsTab.Items.Selected := 0
                            else if HedCsTab.Items[1].Enabled then
                                HedCsTab.Items.Selected := 1;

                            MjsSetFocus(Self, ucBtnOK);
                        end;
            end;

            Exit;
        end;
    end;

    if FcsChg then
    begin
        // ﾌｫｰﾑの初期化
        fnInzForm;
    end;

    // 編集ｽｲｯﾁを初期化
    m_EdtSw := FALSE;

    case HedCsTab.Items.Selected of
        0,1:    begin
                    // 主ｷｰ項目へﾌｫｰｶｽを移動する
                    if ( FcsChg ) then
                    begin
                		f0CODE.Text     :=  '';
                		HedPanel.Enabled  :=  TRUE;
                        m_AcControl	    :=  f0CODE;
                    	m_AcControl.SetFocus();
                    end;
                end;
        2:  begin
                fnInzFormf1;
                f0CODE.Text     :=  '';
                HedPanel.Enabled  :=  TRUE;
                fnBtnEnbChg;
                m_AcControl	    :=  GridNayose;
                m_AcControl.SetFocus();
            end;
    end;

end;

//-----------------------------------------------------------------------------
// fnCloseConfirm
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE:処理続行、FALSE:処理中止
//      MEMO    : 終了ﾒｯｾｰｼﾞ確認
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnCloseConfirm(): Boolean;
var
	iRtn : Word;
begin

    Result  :=  TRUE;
{
    // <PRN>
    if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 10040,2);
		Beep;
		MjsMessageBoxEx(Self,
                        m_cErrorMsgRec.sMsg,
                        m_cErrorMsgRec.sTitle,
                        m_cErrorMsgRec.icontype,
                        m_cErrorMsgRec.btntype,
                        m_cErrorMsgRec.btndef,
                        m_cErrorMsgRec.LogType );
	   	Result  :=  FALSE;
	end
    else
    begin
}
        m_cComArea.m_MsgStd.GetMsg(m_cErrorMsgRec,10020,2);
        with m_cErrorMsgRec do
        begin
            iRtn := MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg,
                                    m_cErrorMsgRec.sTitle,
                                    icontype,
                                    m_cErrorMsgRec.btntype,
                                    m_cErrorMsgRec.btndef,
                                    m_cErrorMsgRec.LogType );
        end;

        //終了確認
        case iRtn of
            //はい
            mrYes:
            begin
                if ( fnRecUpd = FALSE ) then
                begin
                    Result := FALSE;
                    Exit;
                end;
            end;
            //いいえ
            mrNo:
            begin
                //編集ｽｲｯﾁを初期化（FormClose要求が2回くるための対応）
                m_EdtSw := FALSE;;
            end;
            //ｷｬﾝｾﾙ
            mrCancel:
            begin
                Result := FALSE;
                Exit;
            end;
        end;
//    end;

end;

//-----------------------------------------------------------------------------
// fnESCConfirm()
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE:処理続行、FALSE:処理中止
//      MEMO    : ESC操作時ﾒｯｾｰｼﾞ確認
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnESCConfirm(): Boolean;
var
	iRtn : Word;
begin

    Result  :=  TRUE;

    if ( m_BtUpdFlg = FALSE ) then
    begin
        m_EdtSw := FALSE;;
        // 編集をｷｬﾝｾﾙする
        fnCancel(TRUE);
        Exit;
    end;

    // 編集ｽｲｯﾁを判定
    if ( m_EdtSw = FALSE ) then
    begin
        // 編集をｷｬﾝｾﾙする
        fnCancel(TRUE);
        Exit;
    end;

    // 終了確認
    m_cComArea.m_MsgStd.GetMsg(m_cErrorMsgRec,10020,2);
    with m_cErrorMsgRec do
    begin
        iRtn := MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg,
                                m_cErrorMsgRec.sTitle,
                                icontype,
                                m_cErrorMsgRec.btntype,
                                m_cErrorMsgRec.btndef,
                                m_cErrorMsgRec.LogType );
    end;

    //終了確認
    case iRtn of
        // はい
        mrYes:
        begin
            if ( fnRecUpd = FALSE ) then
            begin
                Result := FALSE;
                Exit;
            end;
        end;
        // いいえ
        mrNo:
        begin
            m_EdtSw := FALSE;;
            fnCancel(TRUE);
        end;
        // ｷｬﾝｾﾙ
        mrCancel:
        begin
            Result := FALSE;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnFldChk()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//                AllChkMode    Boolean
//      VAR     :
//      RETURN  : TRUE : 正常 FALSE : 異常
//      MEMO    : ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompoName : string;
    lvRowNo     : Integer;
    lvCode,
    lvNm,
    lvNmk       : String;
    Qry         : TFDQuery;
    lvNCODE     : Extended;
    lvNCODE2    : Extended;
    Bol         : Boolean;
    lvErrCod    : Integer;
    lvRet		: Integer;
    iRetCd      : Integer;

    iValue      : Integer;

{$I JNTSProcUtil.inc}
begin

    Result      :=  TRUE;
    lvCompoName :=  TComponent(Sender).Name;

    // ----------------------------
    //          取引先ｺｰﾄﾞ
    // ----------------------------
    if ( uvTempFlg = FALSE ) then
    begin
        with f0CODE do
        begin
            if ( AllChkMode ) or ( lvCompoName = Name ) then
            begin
                // <122> --- St ---
                if ( m_TRCodeAttr <> 2 ) then
                begin
                    if ( f0CODE.InputFlag = FALSE ) then
                            f0CODE.Zero := TRUE
                    else    f0CODE.Zero := FALSE;
                end
                else
                    f0CODE.Zero := FALSE;
                //<122> --- Ed ---

                if ( Trim(Text) = '' ) then
                begin
                    uvSelSys.MsgDlg(1010,10);   //必須入力です。
                    SetFocus;
                    Result := FALSE;
                    Exit;
                end;
                if ( JNTSelXKanjiCheck(Text) = TRUE ) then
                begin
                    uvSelSys.MsgDlg(1010,20);   // <226>入力値に漢字もしくは特殊文字が含まれています。
                    SetFocus;
                    Result := FALSE;
                    Exit;
                end;

                lvErrCod := fnChkTRCODE;
                if ( lvErrCod <> 0 ) then
                begin
{↓<Rel>
                    if ( lvErrCod = 1 ) then
                		MjsMessageBox(Self, '得意先が採用されていない取引先です。', mjInformation, mjDefOk)
                    else
                        uvSelSys.MsgDlg(1010,50);
↑<Rel>}
//↓<Rel>
                    case lvErrCod of
                        1:
                        begin
                    		MjsMessageBox(Self, '得意先が採用されていない取引先です。', mjInformation, mjDefOk)
                        end;

                        -1:
                        begin
                            uvSelSys.MsgDlg(1010,50);
                        end;
                        -97:
                        begin
                            // 名寄せ登録済みのため何もしない。
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
                    Result := FALSE;
                    Exit;
                end;

                if AllChkMode = FALSE then Exit;
            end;
        end;
    end;

    // ----------------------------
    //         名寄せ親取引先ｺｰﾄﾞ  <163>
    // ----------------------------
    with f2OyaCode do
    begin
        if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
        begin
            if ( m_TrCodeAttr <> 2 ) then
            begin
                if ( f2OyaCode.InputFlag = FALSE ) then
                        f2OyaCode.Zero   :=  TRUE
                else    f2OyaCode.Zero   :=  FALSE;
            end
            else
                f2OyaCode.Zero := FALSE;

            f2OyaName.Caption   := '';

            Text := TrimRight(Text);
            if ( Trim(Text) <> '' ) then
            begin
                //合計得意先
                if ( fnGetNAME(Text,221,m_TrCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f2OyaName.Caption   := '';
                    //他のタブを選択した場合はタブを戻す。
                    if  HedCsTab.Items.Selected <> 2 then
                    begin
                        HedCsTab.Items.Selected := 2;
                    end;
                    //コードが間違っています。
                    uvSelSys.MsgDlg(1010,50);
                    Result := FALSE;
                    Exit;
                end
                else
                begin
                    f2OyaName.Caption   := lvNmk;
                end;
            end;

            //if AllChkMode = FALSE then Exit;
        end;
    end;

    // ----------------------------
    //         名寄せ子取引先ｺｰﾄﾞ  <163>
    // ----------------------------
    with f2KoCode do
    begin
        if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
        begin
            if ( m_TrCodeAttr <> 2 ) then
            begin
                if ( f2KoCode.InputFlag = FALSE ) then
                        f2KoCode.Zero   :=  TRUE
                else    f2KoCode.Zero   :=  FALSE;
            end
            else
                f2KoCode.Zero := FALSE;

            f2KoName.Caption   := '';

            Text := TrimRight(Text);
            if ( Trim(Text) <> '' ) then
            begin
                //実在得意先
                if ( fnGetNAME(Text,22,m_TrCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f2KoName.Caption   := '';
                    //他のタブを選択した場合はタブを戻す。
                    if  HedCsTab.Items.Selected <> 2 then
                    begin
                        HedCsTab.Items.Selected := 2;
                    end;
                    //コードが間違っています。
                    uvSelSys.MsgDlg(1010,50);
                    Result := FALSE;
                    Exit;
                end
                else
                begin
                    f2KoName.Caption   := lvNmk;
                end;
            end;

        end;
    end;

    // ----------------------------
    //          部門ｺｰﾄﾞ
    // ----------------------------
    with f1BMCODE do
    begin

        if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
        begin
            // <122> --- St ---
            if ( m_BMCodeAttr <> 2 ) then
            begin
                if ( f1BMCODE.InputFlag = FALSE ) then
                        f1BMCODE.Zero   :=  TRUE
                else    f1BMCODE.Zero   :=  FALSE;
            end
            else
                f1BMCODE.Zero := FALSE;
            //<122> --- Ed ---

            f1BMNAME.Caption   := '';
            if ( Trim(Text) = '' ) then
                Text    := uvTmpBMCODE; // 未入力時処理

            Text := TrimRight(Text);	// <233>
            if ( Trim(Text) <> '' ) then
            begin
                if ( fnGetNAME(Text,41,m_BMCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f1BMNAME.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected := 0;
                    SetFocus;
                    Result := FALSE;
                    Exit;
                end
                else
                    //f1BMNAME.Caption   := lvNmk;  //<158>
                    //部門検索EXPから取得した名称をセット
                    if m_BumonNcodeEx > 0 then  f1BMNAME.Caption   := m_BumonNMkEX
                        else  f1BMNAME.Caption   := lvNmk
            end;

            if AllChkMode = FALSE then Exit;
        end;
    end;

    // ----------------------------
    //          担当者ｺｰﾄﾞ
    // ----------------------------
    with f1TNCODE do
    begin
        if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
        begin
            // <122> --- St ---
            if ( m_TNCodeAttr <> 2 ) then
            begin
                if ( f1TNCODE.InputFlag = FALSE ) then
                        f1TNCODE.Zero   :=  TRUE
                else    f1TNCODE.Zero   :=  FALSE;
            end
            else
                f1TNCODE.Zero := FALSE;
            // <122> --- Ed ---

            f1TNNAME.Caption   := '';
            if ( Trim(Text) = '' ) then
                Text := uvTmpTNCODE;    // 未入力時処理<102>

            Text := TrimRight(Text);	// <233>
            if ( Trim(Text) <> '' ) then
            begin
                if ( fnGetNAME(Text,25,m_TNCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f1TNNAME.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected := 0;
                    SetFocus;
                    Result := FALSE;
                    Exit;
                end
                else
                    f1TNNAME.Caption   := lvNmk;
            end;

            if AllChkMode = FALSE then Exit;
        end;
    end;

    // ----------------------------
    //          納品書ﾌｫｰﾑ
    // ----------------------------
    with f1USDENPFM do
    begin
        if ( PnlKanri.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                if ( Value = 0 ) then
                    Value := uvTmpUSDENPFM;

                lvCode  :=  IntToStr(AsInteger);
                Qry     :=  TMQuery.Create(Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if ( gfnJNTSELRptNameGet(Qry, 'ur00', lvCode, lvNm, lvNmk) = FALSE ) then
                begin
                    f1USDENPFMNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected := 0;   // <135>
                    SetFocus;
                    Result := FALSE;
                    Qry.Free;
                    Exit;
                end
                else
                begin
                    Qry.Free;
                    f1USDENPFMNM.Caption    := lvNmk;
                    // 納品書ﾌｫｰﾑの取得
//                  fnDFMGET;
                end;

                if AllChkMode = FALSE then Exit;
            end;
        end;
    end;

    // ----------------------------
    //          請求書ﾌｫｰﾑ
    // ----------------------------
    with f1SSDENPFM do
    begin
//      if ( Enabled ) then
// <106>if ( PnlKanri.Visible ) then
// <106>begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                if ( Value = 0 ) then
                    Value := uvTmpSSDENPFM;

                lvCode  :=  IntToStr(AsInteger);
                Qry     :=  TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if ( gfnJNTSELRptNameGet(Qry, 'se00', lvCode, lvNm, lvNmk) = FALSE ) then
                begin
                    f1USDENPFMNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected := 0;   // <135>
                    SetFocus;
                    Result := FALSE;
                    Qry.Free;
                    Exit;
                end
                else
                begin
                    Qry.Free;
                    f1SSDENPFMNM.Caption    := lvNmk;
                    // 請求書ﾌｫｰﾑの取得
//                  fnDFMGET;
                end;

                if AllChkMode = FALSE then Exit;
            end;
// <106>end;
    end;

    // ----------------------------
    //          領収証ﾌｫｰﾑ
    // ----------------------------
    with f1RYOPFM do
    begin
        if ( PnlRyosyu.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                if ( Value = 0 ) then
                    Value := uvTmpRYOPFM;

                lvCode  :=  IntToStr(AsInteger);
                Qry     :=  TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if ( gfnJNTSELRptNameGet(Qry, 'ry00', lvCode, lvNm, lvNmk) = FALSE ) then
                begin
                    f1RYOPFMNM.Caption      :=  '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected :=  0;
                    SetFocus;
                    Result := FALSE;
                    Qry.Free;
                    Exit;
                end
                else
                    f1RYOPFMNM.Caption    := lvNmk;

                Qry.Free;

                if AllChkMode = FALSE then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      領収証の但し書
    // ----------------------------
    with f1RYOTEKI do
    begin
        if ( PnlRyosyu.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                if ( Value = 0 ) then
                    Value := uvTmpRYOTEKI;

                Qry :=  TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if ( gfnJNTSELKBNNameGet(Qry, 'ALL', 'ALL2', AsInteger, lvNm) = FALSE ) then
                begin
                    f1RYOTEKINM.Caption     :=  '';
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  0;
                    SetFocus;
                    Result := FALSE;
                    Qry.Free;
                    Exit;
                end
                else
                    f1RYOTEKINM.Caption    := lvNm;

                 Qry.Free;

                if AllChkMode = FALSE then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      集金用領収証
    // ----------------------------
    with f1SYURYOKBN do
    begin
        if ( PnlRyosyu.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                if ( Value = 0 ) then
                    Value := uvTmpSYURYOKBN;

                Qry :=  TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if ( gfnJNTSelKBNNameGet(Qry, 'ALL', '集金用領収書', AsInteger, lvNm) = FALSE ) then
                begin
                    f1SYURYOKBNNM.Caption := '';
                    uvSelSys.MsgDlg(1010, 40);
                    DtlCsTab.Items.Selected := 0;
                    SetFocus;
                    Qry.Free;
                    Result := FALSE;
                    Exit;
                end
                else
                    f1SYURYOKBNNM.Caption    := lvNm;

                Qry.Free();

                if AllChkMode = FALSE then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      請求区分
    // ----------------------------
    if ( uvTempFlg = FALSE ) and (PnlNayoseInfo.Visible = TRUE) then
    begin
        with f1SKYKBN do
        begin
            if ( Visible ) and ( cbNykRootKbn.Checked = TRUE ) then
            begin
                if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
                begin
                    m_ErrObjNm := '';

                    f1ItemsCheak(f1SKYKBN);

                    if ( m_ErrObjNm <> '' ) then
                    begin
                    	if f1SKYKBN.Text = '' then
	                        uvSelSys.MsgDlg(1010,10)
                        else
	                        uvSelSys.MsgDlg(1010,40);
                        DtlCsTab.Items.Selected :=  0;
                        MjsSetFocus(Self, m_ErrObjNm);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
            end;
        end;
    end;

    // ----------------------------
    //      名寄せ親代替ｺｰﾄﾞ
    // ----------------------------
    with f1NayoseOyaCode do
    begin
        if ( Visible ) and ( cbNykRootKbn.Checked = TRUE ) and ( f1SKYKBN.Value = 1 ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                // <122> --- St ---
                if ( m_TRCodeAttr <> 2 ) then
                begin
                    if ( f1NayoseOyaCode.InputFlag = FALSE ) then
                            f1NayoseOyaCode.Zero    :=  TRUE
                    else    f1NayoseOyaCode.Zero    :=  FALSE;
                end
                else
                    f1NayoseOyaCode.Zero := FALSE;
                // <122> --- Ed ---

                f1NayoseNM.Caption := '';
                if ( Trim(Text) = '' ) then
                begin
                    // 未入力時処理
                    uvSelSys.MsgDlg(1010,10);
                    DtlCsTab.Items.Selected :=  0;
                    MjsSetFocus(Self, f1NayoseOyaCode.Name);
                    Result := FALSE;
                    Exit;
                end
                else
                begin
                    Text := TrimRight(Text);
                    if ( fnGetNAME(Text, 22, m_TrCodeAttr, lvNMK) = FALSE ) then
                    begin
                        f1NayoseNM.Caption      :=  '';
                        uvSelSys.MsgDlg(1010,50);
                        DtlCsTab.Items.Selected :=  0;
                        SetFocus;
                        Result := FALSE;
                        Exit;
                    end
                    else begin
                        f1NayoseNM.Caption := lvNmk;
                    end;

                    Qry := TMQuery.Create (Self);
                    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
                    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);

                    with Qry do
                    begin
                        // -----------------------------------------------------------
                        // 伝票の発生がある単独得意先は、請求先に指定できない<100>
                        // -----------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('SELECT OYAKOFLG from MTOKUI_SEL where BaseNCode = :pCODE and RecKbn = 1');

                        lvNCODE := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                        ParamByName('pCODE').AsFloat    :=  lvNCODE;
                        Open();

                        if ( FieldByName('OYAKOFLG').AsInteger = 0 ) then
                        begin
                            if ( f0CODE.Text <> f1NayoseOyaCode.Text ) then
                            begin
                                // PRC_MA0130_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
                                with StdProc3 do
                                begin
									BeginExecProc(StdProc3, False);
									try
                                    ParamByName('@pTRNCD')  .AsFloat    :=  lvNCODE;
                                    ParamByName('@pSDYMD')  .AsDateTime :=  uvSelSys.GetOKstDymd;
                                    ParamByName('@pEDYMD')  .AsDateTime :=  uvSelSys.GetOKedDymd;
                                    ParamByName('@pSNYM')   .AsInteger  :=  uvSelSys.GetOKstNym;
                                    ParamByName('@pENYM')   .Asinteger  :=  uvSelSys.GetOKedNym;
                                    ExecProc();
                                    finally
                                    EndExecProc(StdProc3);
                                    end;
                                    Bol :=  (ParamByName('@RETURN_VALUE').AsInteger = 0);
                                end;

                                //if ( not Bol ) then  <159>
                                if ( not Bol ) and (m_SimeChkFlg <> 1) then//<159>
                                begin
                           		    MjsMessageBox(Self, 'この得意先は伝票が入力済みなので'#13#10
                                                    + '代替得意先として登録できません。', mjInformation, mjDefOk);
                                    DtlCsTab.Items.Selected := 0;
									f1NayoseOyaCode.SetFocus;
                                    Result := FALSE;
                                    Close();
                                    Free();
                                    Exit;
                                end;
                            end;
                        end;

                        // -----------------------------------------------------------
                        // 他の合計得意先の代替になっている場合は指定できない <116>
                        // 但し削除されたものは除く
                        // -----------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('select TOKC.BaseNCode from MTOKUI_CRD as TOKC');
                        SQL.Add('inner join MTOKUI as TOK on TOKC.BaseNCode = TOK.NCode and TOK.RDelKbn=0');
                        SQL.Add('where TOKC.CngNCode = :pCODE');

                        lvNCODE :=  fnGetNCODE(f1NayoseOyaCode.Text, 22, m_TrCodeAttr);
                        ParamByName('pCODE').AsFloat := lvNCODE;
                        Open();

                        // 選択している合計得意先の内部ｺｰﾄﾞを取得
                        lvNCODE :=  fnGetNCODE(f0CODE.Text, 22, m_TrCodeAttr);

                        if ( not EOF )                                     and
                           ( FieldByName('BaseNCode').AsFloat <> lvNCode ) then
                        begin
                       		MjsMessageBox(Self, 'この得意先は他の得意先の代替得意先に'#13#10
                                            + '指定されている為登録できません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := FALSE;
                            Close();
                            Free();
                            Exit;
                        end;

                        // -----------------------------------------------------------
                        // 他の名寄せに登録されている場合は指定できない
                        // 但し削除されたものは除く
                        // -----------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('select NI.NayoseOyaNCode from CRDNayoseInfo as NI');
                        SQL.Add('inner join MTOKUI as TOK1 on NI.NknNCode = TOK1.NCode and TOK1.RDelKbn=0');
                        SQL.Add('inner join MTOKUI as TOK2 on NI.NayoseOyaNCode = TOK2.NCode and TOK2.RDelKbn=0');
                        SQL.Add('where NI.NknNCode = :pCODE');
                        SQL.Add('and NI.MasterKbn = 22 and NI.NayoseSyu = 1 and NI.NayoseKbn = 1');

                        lvNCODE :=  fnGetNCODE(f1NayoseOyaCode.Text, 22, m_TrCodeAttr);
                        ParamByName('pCODE'   ).AsFloat := lvNCODE;
                        Open();

                        // 選択している合計得意先の内部ｺｰﾄﾞを取得
                        lvNCODE :=  fnGetNCODE(f0CODE.Text, 22, m_TrCodeAttr);

                        if ( not EOF )                                     and
                           ( FieldByName('NayoseOyaNCode').AsFloat <> lvNCode ) then
                        begin
                       		MjsMessageBox(Self, '既に他の得意先の名寄せに'#13#10
                                            + '指定されている為登録できません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := FALSE;
                            Close();
                            Free();
                            Exit;
                        end;

                        Close();
                        Free();
                    end;
{<176> ↓
//<167>↓

                    // 得意先に回収予定データが存在している場合は名寄せ不可
                    Qry := TMQuery.Create(Self);
                    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
                    //名寄せ親の内部コード
                    lvNCODE  := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                    //合計得意先の内部コード
                    lvNCODE2 := fnGetNCODE(f0CODE.text, 22, m_TrCodeAttr);
                    try
                        with Qry do
                        begin
                            Close;
                            SQL.Clear;
                            //<169>↓
                            //SQL.Add('select TOP 1 SeiKYuNCode from CRD_KAIYOTEIT '	  		    );
                            //SQL.Add('    where SeiKYuNCode = :pCSNCode and RDelKbn = 0 '	);
                            SQL.Add('select TOP 1 CSNCode from CRD_KAIYOTEIT '	  		    );
                            SQL.Add('    where CSNCode = :pCSNCode and SeiKyuNCode <> :pSeiKyuNCode and RDelKbn = 0 ' );
                            //<169>↑

                            ParamByName('pCSNCode').AsString     :=   FloatToStr(lvNCODE);
                            ParamByName('pSeiKyuNCode').AsString :=   FloatToStr(lvNCODE2);

                            Open;

                            if not (EOF) then
                            begin
                            MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ設定はできません。'#13#10
                                + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態にしてください。', mjInformation, mjDefOk);
                                DtlCsTab.Items.Selected := 0;
                                f1NayoseOyaCode.SetFocus;
                                Result := FALSE;
                                Exit;
                            end;
                        end;
                    finally
                        Qry.Close;
                        Qry.Free();
                    end;

                    // 得意先に入金データが存在している場合は名寄せ不可

                    Qry := TMQuery.Create(Self);
                    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);

                    try
                        with Qry do
                        begin
                            Close;
                            SQL.Clear;
                            //<169>↓
                            //SQL.Add('select TOP 1 OyaCSNCode from CRD_NYUKINT '	  		);
                            //SQL.Add('    where OyaCSNCode = :pCSNCode and RDelKbn = 0 '	);
                            SQL.Add('select TOP 1 CSNCode from CRD_NYUKINT '	  		);
                            SQL.Add('    where (CSNCode = :pCSNCode and OyaCsNCode <> :pOyaCsNCode) and RDelKbn = 0 '	);
                            //<169>↑
                            ParamByName('pCSNCode').AsString :=   FloatToStr(lvNCODE);
                            ParamByName('pOyaCsNCode').AsString :=   FloatToStr(lvNCODE2);

                            Open;

                            if not (EOF) then
                            begin
                            MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ設定はできません。'#13#10
                                + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態に変更してください。', mjInformation, mjDefOk);

                                DtlCsTab.Items.Selected := 0;
                                f1NayoseOyaCode.SetFocus;
                                Result := FALSE;
                                Exit;
                            end;
                        end;
                    finally
                        Qry.Close;
                        Qry.Free();
                    end;
//<167>↑
}
//↓<176> ストアド化

                    // 得意先に回収予定データが存在している場合は、名寄せ親代替親にはセット不可
                    //Qry := TMQuery.Create(Self);
                    //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
                    //名寄せ親の内部コード
                    lvNCODE  := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                    //合計得意先の内部コード
                    lvNCODE2 := fnGetNCODE(f0CODE.text, 22, m_TrCodeAttr);

                    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProcCRD_CHK_NAYOSE2);  //全社でチェック
                    try
                        // StdProcCRD_CHK_NAYOSE
                        with  StdProcCRD_CHK_NAYOSE2 do
                        begin
							BeginExecProc(StdProcCRD_CHK_NAYOSE2, False);
							try
                            ParamByName('@pCSNCode').AsFloat    := lvNCODE;
                            ParamByName('@pOyaCSNCode').AsFloat := lvNCODE2;
                            ExecProc;
                            finally
                            EndExecProc(StdProcCRD_CHK_NAYOSE2);
                            end;
                            iRetCd := ParamByName('@RetCd').AsInteger;
                        end;

                        if (iRetCd = NG_BY_KAIYOTEIDATA) then
                        begin
                            MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ親代替得意先に設定できません。'#13#10
                                + #13#10
                                + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                            Result := FALSE;
                            Exit;
                        end;

                        if (iRetCd = NG_BY_NYUKINDATA) then
                        begin
                            MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ親代替得意先に設定できません。'#13#10
                                + #13#10
                                + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                            Result := FALSE;
                            Exit;
                        end;

                        if (iRetCd = NG_BY_KOUFURIDATA) then
                        begin
                            MjsMessageBox(Self, 'この得意先には処理中の口座振替データが存在するため名寄せ親代替得意先に設定できません。'#13#10
                                + #13#10
                                + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                + '口座処理中データをクリアしてください。', mjInformation, mjDefOk);
                            Result := FALSE;
                            Exit;
                        end;

                        //名寄せ親代替得意先の変更
                        if (iRetCd = CONFIRM_BY_KAIYOTEIDATA) then
                        begin
                            if not (AllChkMode) then
                            begin
                                iValue := MjsMessageBoxEX(Self,'この得意先には回収予定データが存在しますが、名寄せ登録を行ってもよろしいですか？'#13#10
                                                             + '名寄せ登録を行うと回収予定データは名寄せ親得意先に集計されます。','名寄せ登録',mjQuestion,mjYesNo,mjDefNo);

                                if iValue <> mrYes then
                                begin
                                    Result := FALSE;
                                    m_bKaitoteiConfirm := False;
                                    exit;
                                end else
                                begin
                                    m_bKaitoteiConfirm := True;
                                end;

                            end else
                            begin
                                if not m_bKaitoteiConfirm then
                                begin
                                    Result := FALSE;
                                    DtlCsTab.Items.Selected := 0;
                                    f1NayoseOyaCode.SetFocus;
                                    MjsMessageBox(Self, 'この得意先には回収予定データが存在するため名寄せ親代替得意先に設定できません。', mjInformation, mjDefOk);
                                    exit;
                                end;
                                fnUpdCRD_KAIYOTEIT(lvNCODE,lvNCODE2,NAYOSE_SET);
                            end;
                        end;

                    finally
                        //Qry.Close;
                        //Qry.Free();
                    end;
//<176>ストアド化↑

                end;

                lvNCODE := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                lvRet	:= fnGetMTOKUI_Info(lvNCODE);
                case lvRet of
                -2:
                    begin
                        MjsMessageBox(Self, '通常請求以外は、名寄せ設定はできません。', mjInformation, mjDefOk);
                        DtlCsTab.Items.Selected := 0;
                        f1NayoseOyaCode.SetFocus;
                        Result := FALSE;
                        Exit;
                    end;
                -3:
                    begin
                        MjsMessageBox(Self, '締日情報の異なる名寄せ設定はできません。', mjInformation, mjDefOk);
                        DtlCsTab.Items.Selected := 0;
                        f1NayoseOyaCode.SetFocus;
                        Result := FALSE;
                        Exit;
                    end;
                end;

                if ( AllChkMode = FALSE ) then  Exit;
            end;
        end;
    end;

// ↓↓↓<123>

    // ----------------------------
    //      売上合計欄税印字
    // ----------------------------
    with f1USGKEI do
    begin
//      if ( f1USGKEI.Visible ) then									// 051117 hirota
        if  (f1USGKEI.Visible ) and ( PnlKanri.Visible ) then			// 051117 hirota
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1USGKEI);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  0;  // <135>
                    MjsSetFocus(Self,m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      鏡欄税印字
    // ----------------------------
    with f1SSGKEI do
    begin
        if ( f1SSGKEI.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1SSGKEI);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  0;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      分解方法
    // ----------------------------
    with f1Bunkai do
    begin
        if ( f1Bunkai.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1Bunkai);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      回収種別　未満
    // ----------------------------
    with f1KAIJY1 do
    begin
        if ( f1KAIJY1.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1KAIJY1);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      回収種別　以上
    // ----------------------------
    with f1KAIJY2 do
    begin
        if ( f1KAIJY2.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';
                f1ItemsCheak(f1KAIJY2);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      端数処理方法
    // ----------------------------
    with f1KAIHasu do
    begin
        if ( f1KAIHasu.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1KAIHasu);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      カナ名称
    // ----------------------------
    with f1KanaName1 do
    begin
        if ( f1KanaName1.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
	            if JNTSelXKanjiCheck(f1KanaName1.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName1.Name);
                    Result := FALSE;
                    Exit;
                end;
	            if fnChkInvalidFBChar(f1KanaName1.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName1.Name);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;
    // ----------------------------
    //      カナ名称2   //<156>
    // ----------------------------
    with f1KanaName2 do
    begin
        if ( f1KanaName2.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
	            if JNTSelXKanjiCheck(f1KanaName2.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName2.Name);
                    Result := FALSE;
                    Exit;
                end;
	            if fnChkInvalidFBChar(f1KanaName2.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName2.Name);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;
    // ----------------------------
    //      カナ名称3   //<156>
    // ----------------------------
    with f1KanaName3 do
    begin
        if ( f1KanaName3.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
	            if JNTSelXKanjiCheck(f1KanaName3.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName3.Name);
                    Result := FALSE;
                    Exit;
                end;
	            if fnChkInvalidFBChar(f1KanaName3.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1KanaName3.Name);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;


    // ----------------------------
    //      手数料負担区分
    // ----------------------------
    with f1TesuryoFutan do
    begin
        if ( f1TesuryoFutan.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1TesuryoFutan);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //    ＥＤＩ・仮想口座区分
    // ----------------------------
    with f1Ku do
    begin
        if ( f1Ku.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1Ku);

                if ( m_ErrObjNm <> '' ) then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, m_ErrObjNm);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

    // ----------------------------
    //      ＥＤＩ・仮想口座情報
    // ----------------------------
    with f1DefoltEDI do
    begin
        if ( f1DefoltEDI.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
	            if JNTSelXKanjiCheck(f1DefoltEDI.Text) = True then
                begin
                    DtlCsTab.Items.Selected :=  1;  // <135>
                    MjsSetFocus(Self, f1DefoltEDI.Name);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;

// ↑↑↑<123>
//<DENSHI> ADD St
    if (Assigned(m_DensaiInfo)) then
    begin
        case m_DensaiInfo.DenDataKbn of
            // でんさいネット
            DENKBN_DENSAI   :
            begin
//<187> DEL St
{
                // ---------------------------
                // 利用者番号
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MTDensaiUserID.Name) then
                begin
                    if MTDensaiUserID.Text = '' then
                    begin
                        DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
                        MNDenDataKbn.Value := DENKBN_DENSAI;
                        CustomSetFocus([MTDensaiUserID]);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
                // ---------------------------
                // カナ名称
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MTDenCSKanaName.Name) then
                begin
                    if JNTSelXKanjiCheck(MTDenCSKanaName.Text) then
                    begin
                        uvSelSys.MsgDlg(1010,20);   // 入力値に漢字もしくは特殊文字が含まれています。
                        DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
                        MNDenDataKbn.Value := DENKBN_DENSAI;
                        CustomSetFocus([MTDenCSKanaName]);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
                // ---------------------------
                // 預金種目
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MNAccKbn_Denshi.Name) then
                begin
                    if (TDensaiInfo.GetAccName(MNAccKbn_Denshi.AsInteger) = '') then
                    begin
                        DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
                        MNDenDataKbn.Value := DENKBN_DENSAI;
                        CustomSetFocus([MNAccKbn_Denshi]);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
                // ---------------------------
                // 口座番号
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MTAccNo.Name) then
                begin
                    if (MTAccNo.Text <> '') then
                    begin
                        // 自動編集
                        MTAccNo.Text := fnEditAccountNo(MTAccNo.Text);
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
}
//<187> DEL Ed
            end;
            // JEMCO
            DENKBN_JEMCO   :
            begin
                // ---------------------------
                // お客様番号(4桁)
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MTJemcoUserID1.Name) then
                begin
//                  if MTJemcoUserID1.Text = '' then                                              <184>変更：お客様番号が数字でない場合
                    if (MTJemcoUserID1.Text = '') or (not IsNumeric(MTJemcoUserID1.Text)) then  //<184>変更：ガードをかける処理
                    begin
                        DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
                        MNDenDataKbn.Value := DENKBN_JEMCO;
                        CustomSetFocus([MTJemcoUserID1]);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
                //<184>追加：お客様番号（7桁）についても数字以外ガードをかけるため
                // ---------------------------
                // お客様番号(7桁)
                // ---------------------------
                if ( AllChkMode = TRUE ) or (lvCompoName = MTJemcoUserID2.Name) then
                begin
                    if (MTJemcoUserID2.Text = '') or (not IsNumeric(MTJemcoUserID2.Text)) then
                    begin
                        DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
                        MNDenDataKbn.Value := DENKBN_JEMCO;
                        CustomSetFocus([MTJemcoUserID2]);
                        Result := FALSE;
                        Exit;
                    end;

                    if ( AllChkMode = FALSE ) then Exit;
                end;
                //<184>追加：ここまでxxxxxxxxxxxxxxxxxxxxxx
            end;
        end;
    end;
//<DENSHI> ADD Ed
//<Account> ADD St
//<181> ADD St
    with numKoufuriNo_Account do
    begin
        if ( numKoufuriNo_Account.Visible ) then
        begin
            if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
            begin
	            if ((numKoufuriNo_Account.AsInteger <> 0) and
                    (moAccInfos.GetAccountInfo(numKoufuriNo_Account.AsInteger) = nil)) then
                begin
                    DtlCsTab.Items.Selected :=  DTLTAB_ACCOUNT;
                    CustomSetFocus([numKoufuriNo_Account]);
                    Result := FALSE;
                    Exit;
                end;

                if ( AllChkMode = FALSE ) then Exit;
            end;
        end;
    end;
//<181> ADD Ed
    if Assigned(moAccCsInfo) then
    begin
        // ---------------------------
        // 預金種目
        // ---------------------------
        if ( AllChkMode = TRUE ) or (lvCompoName = numAccKbn_Account.Name) then
        begin
            if (TAccountCustomerInfo.GetAccName(numAccKbn_Account.AsInteger) = '') then
            begin
                DtlCsTab.Items.Selected :=  DTLTAB_ACCOUNT;
                CustomSetFocus([numAccKbn_Account]);
                Result := FALSE;
                Exit;
            end;

            if ( AllChkMode = FALSE ) then Exit;
        end;
        // ---------------------------
        // 口座番号
        // ---------------------------
        if ( AllChkMode = TRUE ) or (lvCompoName = txtAccNo_Account.Name) then
        begin
            if (txtAccNo_Account.Text <> '') then
            begin
                // 自動編集
                txtAccNo_Account.Text := fnEditAccountNo(txtAccNo_Account.Text);
            end;

            if ( AllChkMode = FALSE ) then Exit;
        end;
        // ---------------------------
        // 顧客番号
        // ---------------------------
        if ( AllChkMode = TRUE ) or (lvCompoName = txtUserCode_Account.Name) then
        begin
            if (txtUserCode_Account.Text <> '') and
                ((not IsNumeric(txtUserCode_Account.Text)) or
                IsZero(txtUserCode_Account.Text)) then
            begin
                DtlCsTab.Items.Selected :=  DTLTAB_ACCOUNT;
                CustomSetFocus([txtUserCode_Account]);
                Result := FALSE;
                Exit;
            end;

            txtUserCode_Account.Text := ToZeroExclude(txtUserCode_Account.Text);

            if ( AllChkMode = FALSE ) then Exit;
        end;
    end;
//<Account> ADD Ed
//<GAIKA> ADD St
    // ----------------------------
    //      外貨入金採用区分
    // ----------------------------
    with numSaiyoKbn_Gaika do
    begin
        if ( AllChkMode = TRUE ) or ( lvCompoName = Name ) then
        begin
            m_ErrObjNm := '';

            f1ItemsCheak(numSaiyoKbn_Gaika);

            if ( m_ErrObjNm <> '' ) then
            begin
                uvSelSys.MsgDlg(1010,40);
                DtlCsTab.Items.Selected := DTLTAB_GAIKA;
                MjsSetFocus(Self, m_ErrObjNm);
                Result := FALSE;
                Exit;
            end;

            // 採用変更可否チェック
            if (numSaiyoKbn_Gaika.Tag <> numSaiyoKbn_Gaika.AsInteger) then
            begin
                iValue := IfThen(HedCsTab.Items.Selected = 0, 1, 2);

                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc_Gaika);

                with StdProc_Gaika do
                begin
					BeginExecProc(StdProc_Gaika, False);
					try
                    ParamByName('@DataKbn').AsInteger   := iValue;    // 1 : 実在得意先 2 : 合計得意先
                    ParamByName('@NCode').AsFloat       := m_TRNCode;
                    ParamByName('@GaikaKbn').AsInteger  := numSaiyoKbn_Gaika.AsInteger;
                    ExecProc();
                    finally
                    EndExecProc(StdProc_Gaika);
                    end;

                    if (ParamByName('@RetCd').AsInteger <> 0) then
                    begin
                        numSaiyoKbn_Gaika.Value := numSaiyoKbn_Gaika.Tag;
                        DtlCsTab.Items.Selected := DTLTAB_GAIKA;
                        CustomSetFocus([numSaiyoKbn_Gaika]);
                        MjsMessageBoxEx (Self,ParamByName('@errMsg').AsString,
                            '確認', mjWarning, mjOk, mjDefOk);
                        Result := False;
                        Exit;
                    end;
                end;
            end;

            if ( AllChkMode = FALSE ) then Exit;
        end;
    end;
//<GAIKA> ADD Ed

//<PASS>
	if TMSeries3.isGalileopt4 then
	begin
        if ( AllChkMode = TRUE ) then
        begin
            if fnPWITEMChkEnt() then
            begin
                Result := False;
                Exit;
            end;
        end
    end;
//<PASS>
end;

//-----------------------------------------------------------------------------
// fnRecGet()
//      PARAM   : CODE  取引先ｺｰﾄﾞ（外部）
//      VAR     :
//      RETURN  : TRUE : 正常 FALSE ; 異常
//      MEMO    : 対象ﾚｺｰﾄﾞを取得する
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnRecGet(CODE: String): Boolean;
var
	dqMasterData    : TMQuery;
    Qry             : TMQuery;
    Qry2            : TMQuery;
    sSumKbn         : Integer;
    sTmp            : String;
    lvNMK           : String;
    lvCode          : String;
    lvNm            : String;
    nCngNCode       : Extended;
    bDaiKbn         : Boolean;
    bSkyKbn         : Boolean;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>
    iKoufuriNo      : Integer; //<Account> ADD
{$I JNTSProcUtil.inc}
begin

    Result  :=  TRUE;

    sSumKbn	:=	0;

    iKoufuriNo := 0;  //<Account> ADD

    fnInzFormf1;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= FALSE;
		Exit;
	end;

    if uvDispFlg = 0 then
    begin
        HedPanel.Enabled        := FALSE;
        tbsKihon.Enabled        := TRUE;
        tbsNyukin.Enabled       := TRUE;
        tbsDenshiSaiken.Enabled := TRUE;   //<DENSHI> ADD
        tbsAccountInfo.Enabled  := TRUE;   //<Account> ADD
        tbsGaikaInfo.Enabled    := TRUE;   //<Gaika> ADD
        f1DefoltEDI.Enabled     := FALSE;                       // EDI情報は初期は使用不可
        f1NAME.Enabled          := FALSE;
    end
    else
    begin
        HedPanel.Enabled        := TRUE;
        tbsKihon.Enabled        := FALSE;
        tbsNyukin.Enabled       := FALSE;
        tbsDenshiSaiken.Enabled := FALSE;   //<DENSHI> ADD
        tbsAccountInfo.Enabled  := FALSE;   //<Account> ADD
        tbsGaikaInfo.Enabled    := FALSE;   //<Gaika> ADD
//<Authority> DEL St
    //呼び出し元で表示しているため削除
//        if m_cJNTArea.IsModify = TRUE then
//            MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,FALSE);
//<Authority> DEL Ed
                                            // <129>Createに移動
//    	GridNayose.Options	:=	GridNayose.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
    end;

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    with (dqMasterData) do
	begin
        Close();
  		SQL.Clear();
        SQL.Add('select                                 '
            +   '    mt.TemplateKbn     m_TemplateKbn   '   // ﾃﾝﾌﾟﾚｰﾄ区分    (mtokui)
            +   '   ,mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.SumKbn          m_SumKbn        '   // 実在/合計区分  (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Fkana           m_Fkana         '   // ﾌﾘｶﾞﾅ　        (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.PostNo1         m_PostNo1       '   // 郵便番号(基番) (mtokui)
            +   '   ,mt.PostNo2         m_PostNo2       '   // 郵便番号(枝番) (mtokui)
            +   '   ,mt.Ads1            m_Ads1          '   // 住所上段       (mtokui)
            +   '   ,mt.Ads2            m_Ads2          '   // 住所下段       (mtokui)
            +   '   ,mt.Tel1            m_Tel1          '   // 電話番号1      (mtokui)
            +   '   ,mt.SectionName     m_SectionName   '   // 送付先部署名   (mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        '   // 与信限度額     (mtokui)
            +   '   ,mt.NYKRootKbn      m_NYKRootKbn    '   // 債権名寄せ区分 (mtokui)
            +   '   ,cs.PostNo1         cs_PostNo1      '   // 郵便番号(基番) (MTOKUI_CRD)
            +   '   ,cs.PostNo2         cs_PostNo2      '   // 郵便番号(枝番) (MTOKUI_CRD)
            +   '   ,cs.Ads1            cs_Ads1         '   // 住所上段       (MTOKUI_CRD)
            +   '   ,cs.Ads2            cs_Ads2         '   // 住所下段       (MTOKUI_CRD)
            +   '   ,cs.Tel1            cs_Tel1         '   // 電話番号1      (MTOKUI_CRD)
            +   '   ,cs.SectionName     cs_SectionName  '   // 送付先部署名   (MTOKUI_CRD)
            +   '   ,cs.TanNm           cs_TanNm        '   // 担当者名       (MTOKUI_CRD)
            +   '   ,cs.MailAddress     cs_MailAddress  '   // メールアドレス (MTOKUI_CRD)
            +   '   ,cs.KeisyoKbn       cs_KeisyoKbn    '   // 担当者敬称     (MTOKUI_CRD)
            +   '   ,cs.KanaName1       cs_KanaName1    '   // ｶﾅ名称1        (MTOKUI_CRD)
            +   '   ,cs.KanaName2       cs_KanaName2    '   // ｶﾅ名称2        (MTOKUI_CRD) //<156>
            +   '   ,cs.KanaName3       cs_KanaName3    '   // ｶﾅ名称3        (MTOKUI_CRD) //<156>
            +   '   ,cs.TesuryoFutan    cs_TesuryoFutan '   // 手数料負担     (MTOKUI_CRD)
            +   '   ,cs.Ku              cs_Ku           '   // EDI採用区分    (MTOKUI_CRD)
            +   '   ,cs.DefoltEDI       cs_DefoltEDI    '   // EDI情報        (MTOKUI_CRD)
            +   '   ,cs.Site            cs_Site         '   // 手形サイト     (MTOKUI_CRD)
            +   '   ,cs.BunkaiKbn       cs_BunkaiKbn    '   // 分解方法　     (MTOKUI_CRD)
            +   '   ,cs.StdRitu         cs_StdRitu      '   // 入金方法の基準値　     (MTOKUI_CRD)
            +   '   ,cs.Jouken1         cs_Jouken1      '   // 回収種別　     (MTOKUI_CRD)
            +   '   ,cs.Jouken2         cs_Jouken2      '   // 回収種別　     (MTOKUI_CRD)
            +   '   ,cs.HasuuHou        cs_HasuuHou     '   // 端数処理方法   (MTOKUI_CRD)
            +   '   ,cs.CngNCode        cs_CngNCode     '   // 親代替取引先   (MTOKUI_CRD)
            +   '   ,cs.GaikaKbn        cs_GaikaKbn     '   // 外貨採用区分   (MTOKUI_CRD)  <GAIKA> ADD
//<GFB> ADD St
            +   '   ,cs.GaikaSoukinName1 cs_GaikaSoukinName1    '   // 外貨送金人名称1 (MTOKUI_CRD)
            +   '   ,cs.GaikaSoukinName2 cs_GaikaSoukinName2    '   // 外貨送金人名称2 (MTOKUI_CRD)
            +   '   ,cs.GaikaSoukinName3 cs_GaikaSoukinName3    '   // 外貨送金人名称3 (MTOKUI_CRD)
//<GFB> ADD Ed
            +   '   ,se.USDenPfm        se_USDenPfm     '   // 納品書ﾌｫｰﾑ   　(mtokui_sel)
            +   '   ,se.USGKei          se_USGKei       '   // 売上合計欄印字 (mtokui_sel)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 請求書ﾌｫｰﾑ   　(mtokui_sel)
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 請求合計欄印字   　(mtokui_sel)
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード (mtokui_sel)
            +   '   ,se.RyoPfm          se_RyoPfm       '   // 領収証ﾌｫｰﾑ (mtokui_sel)
            +   '   ,se.RyoTeki         se_RyoTeki      '   // 領収証但し書き (mtokui_sel)
            +   '   ,se.SyuRyoKbn       se_SyuRyoKbn    '   // 集金用領収証 (mtokui_sel)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分       (mtokui_sel)
            +   'from MTOKUI mt                         '
            +   'left outer join MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'left outer join MTOKUI_CRD cs ON       '
            +   '   (cs.BaseNCode = mt.NCode)           '
            +   'where (mt.RDelKbn = 0)                 '
            +   '  and (mt.NCode = :nNCode)             '
            +   '  and (se.RecKbn = 1)                  ');

        ParamByName('nNCODE').AsFloat := m_TRNCode;

        Open();

        if ( not EOF ) then
        begin
            // 名称
			f1NAME.Text	:= GetFld('m_Nm').AsString;
            sSumKbn     := GetFld('m_SumKbn').AsInteger;    // 実在/合計区分

            // 債権名寄せ区分
            if ( FieldByName('m_NYKRootKbn').AsInteger = 1 ) then
                cbNykRootKbn.Checked := TRUE
            else
                cbNykRootKbn.Checked := FALSE;
            cbNykRootKbnClick(cbNykRootKbn);

            // 基本情報　：請求区分
            f1SKYKBN.Value          :=  0;
            f1SKYKBNNM.Caption		:=	'';
            if cbNykRootKbn.Checked then
            begin
	            f1SKYKBN.Value          :=  GetFld('se_UsKinKbn').AsInteger;
	            f1SKYKBNChange(f1SKYKBN);
            end;

            uvDaiKbn := TRUE;
            bDaiKbn  := cbNykRootKbn.Checked;

            // 基本情報 : 郵便番号
            if	( (FieldByName ('cs_PostNo1').IsNull       )   or
                  (FieldByName ('cs_PostNo1').AsInteger = 0) ) then
			begin
				f1POSTNO1.Clear ();
				f1POSTNO2.Clear ();
			end
			else
			begin
				f1POSTNO1.Value	:= FieldByName ('cs_PostNo1').AsInteger;

                // 基本情報 : 郵便番号
				if	(FieldByName ('cs_PostNo2').IsNull) then
					f1POSTNO2.Clear ()
				else
				begin
					if ( FieldByName ('cs_PostNo2').AsInteger = 0 ) then
					begin
					  	f1POSTNO2.InputFlag := False;
					end;

					f1POSTNO2.Value    := FieldByName ('cs_PostNo2').AsInteger;
				end;
			end;

            // 基本情報 : 住所(上段)
			f1ADS1.Text	            := GetFld('cs_Ads1').AsString;
            // 基本情報 : 住所(下段)
			f1ADS2.Text	            := GetFld('cs_Ads2').AsString;
            // 基本情報 : 電話番号
			f1TEL1.Text	            := GetFld('cs_Tel1').AsString;
            // 基本情報 : 送付先部署名称
			f1SectionName.Text	    := GetFld('cs_SectionName').AsString;
            // 基本情報 : 担当者名称
			f1TanNm.Text	        := GetFld('cs_TanNm').AsString;
            // 基本情報 : メールアドレス
			f1MailAd.Text	        := GetFld('cs_MailAddress').AsString;
            // 基本情報：担当者敬称
            f1KEISYO.Text := GetFld('cs_KeisyoKbn').AsString;
            // 基本情報：納品書ﾌｫｰﾑ
            f1USDENPFM.Value        :=  GetFld('se_USDenPfm').AsInteger;

            // 基本情報：納品書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

            lvCode := IntToStr(f1USDENPFM.AsInteger);

            if gfnJNTSELRptNameGet(Qry, 'ur00', lvCode, lvNm, lvNmk) = TRUE then
                f1USDENPFMNM.Caption := lvNmk;

            Qry.Free;

            // 基本情報　：請求書ﾌｫｰﾑ
            f1SSDENPFM.Value        :=  GetFld('se_SSsyoPfm').AsInteger;

            // 基本情報　：請求書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            lvCode := IntToStr(f1SSDENPFM.AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'se00', lvCode, lvNm, lvNmk) = TRUE then
                f1SSDENPFMNM.Caption := lvNmk;
            Qry.Free;

            // 基本情報　：領収証
            f1RYOPFM.Value        :=  GetFld('se_RyoPfm').AsInteger;

            // 基本情報　：領収証ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            lvCode := IntToStr(f1RYOPFM.AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'ry00', lvCode, lvNm, lvNmk) = TRUE then
                f1RYOPFMNM.Caption := lvNmk;
            Qry.Free;

            // 基本情報　：領収証但し書き
            f1RYOTEKI.Value          :=  GetFld('se_RyoTeki').AsInteger;

            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            if gfnJNTSELKBNNameGet(Qry, 'ALL', 'ALL2', f1RYOTEKI.asInteger, lvNm) = TRUE then
                f1RYOTEKINM.Caption := lvNm;
            Qry.Free;

            // 基本情報　：集金用領収証
            f1SYURYOKBN.Value          :=  GetFld('se_SyuRyoKbn').AsInteger;
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            lvCode := IntToStr(f1SYURYOKBN.AsInteger);
            if gfnJNTSelKBNNameGet(Qry, 'ALL', '集金用領収書', f1SYURYOKBN.AsInteger, lvNm) = TRUE then
                f1SYURYOKBNNM.Caption := lvNm;
            Qry.Free;

            // 基本情報　：売上合計欄印字
            f1USGKEI.Value          :=  GetFld('se_USGKei').AsInteger;
            // 基本情報　：売上合計欄印字
            f1SSGKEI.Value          :=  GetFld('se_SSsyoKgm').AsInteger;
            // 基本情報　：与信限度額
            f1YSGKIN.Value          :=  GetFld('m_YsGKin').AsFloat;

            // 基本情報　：与信限度額
            f1YSGKIN.Value          :=  GetFld('m_YsGKin').AsFloat;
            // 基本情報　：手形サイト
            f1TGSITE.Value          :=  GetFld('cs_Site').AsFloat;
            // 基本情報　：部門コード
            lvCODE := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);      //<122>
            if (m_BMCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then      //<122>
            begin                                                       //<122>
                f1BMCODE.Zero := TRUE;                                  //<122>
                f1BMCODE.InputFlag := FALSE;                            //<122>
            end;                                                        //<122>
            f1BMCODE.text := lvCODE;                                    //<122>

//<122>     f1BMCODE.text          :=  fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
            fnGetNAME(f1BMCODE.Text,41,m_BMCodeAttr,lvNMK );
            f1BMNAME.caption        := lvNMK;
            // 基本情報　：担当者コード
            lvCODE := fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);      //<122>
            if (m_TNCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then      //<122>
            begin                                                       //<122>
                f1TNCODE.Zero := TRUE;                                  //<122>
                f1TNCODE.InputFlag := FALSE;                            //<122>
            end;                                                        //<122>
            f1TNCODE.text := lvCODE;                                    //<122>

//<122>            f1TNCODE.text          :=  fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);
            fnGetNAME(f1TNCODE.Text,25,m_TnCodeAttr,lvNMK );
            f1TNNAME.caption        := lvNMK;
            // 入金情報 : 分解方法
            f1Bunkai.value          := GetFld('cs_BunkaiKbn').AsInteger;

            if f1Bunkai.value = 0 then // 入金情報 : 回収割合 (率)
                f1KAIRITU.value     := GetFld('cs_StdRitu').AsFloat
            else // 入金情報 : 回収割合 (金額)
                f1KAISYWKIN.value     := GetFld('cs_StdRitu').AsFloat;

            // 入金情報 : 回収種別 未満
            f1KAIJY1.Value          :=  GetFld('cs_Jouken1').AsInteger;
            // 入金情報 : 回収種別 以上
            f1KAIJY2.Value          :=  GetFld('cs_Jouken2').AsInteger;
            // 入金情報 : 端数処理方法
            f1KAIHasu.Value         :=  GetFld('cs_HasuuHou').AsInteger;

//<149>st
//未登録はテンプレートからセット
            //回収条件1が0（未登録）であれば、入金条件は未登録
            if  f1KAIJY1.Value 	= 0 then
            begin
                f1Bunkai.value := uvTmpBunkaiKbn;
            	f1KAIJY1.Value := uvTmpJouken1;
                f1KAIJY2.Value := uvTmpJouken2;
            	f1KAIHasu.Value := uvTmpHasuuHou;

            	if  f1Bunkai.value 	= 0 then // 入金情報 : 回収割合 (率)
            		f1KAIRITU.value := uvTmpStdRitu
            	else 						// 入金情報 : 回収割合 (金額)
            		f1KAISYWKIN.value := uvTmpStdRitu;
            end;
//<149>ed

            // 入金情報 : ｶﾅ名称
            f1KanaName1.Text        :=  GetFld('cs_KanaName1').AsString;
            // 入金情報 : ｶﾅ名称 //<156>
            f1KanaName2.Text        :=  GetFld('cs_KanaName2').AsString;
            // 入金情報 : ｶﾅ名称 //<156>
            f1KanaName3.Text        :=  GetFld('cs_KanaName3').AsString;

            // 入金情報 : 手数料負担区分
            f1TesuryoFutan.Value    :=  GetFld('cs_TesuryoFutan').AsInteger;

            // 入金情報 : EDI採用区分
            f1Ku.Value              :=  GetFld('cs_Ku').AsInteger;
            // 入金情報  EDI情報
            f1DefoltEDI.Text        :=  GetFld('cs_DefoltEDI').AsString;
            // 入金情報  親代替取引先
            nCngNCode               :=  GetFld('cs_CngNCode').AsFloat;

            lvCODE := fnGetGCODE(nCngNCode, 22);                                //<122>
            if (m_TRCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then              //<122>
            begin                                                               //<122>
                f1NayoseOyaCode.Zero := TRUE;                                   //<122>
                f1NayoseOyaCode.InputFlag := FALSE;                             //<122>
            end;                                                                //<122>
            f1NayoseOyaCode.text := lvCODE;                                     //<122>

//<122>            f1NayoseOyaCode.Text    :=  fnGetGCODE(nCngNCode, 22);
            fnGetNAME(f1NayoseOyaCode.Text, 22, m_TrCodeAttr, lvNMK);
            f1NayoseNM.Caption      := lvNMK;


            // 「名寄せの親として採用」の使用可/不可チェック
            bSkyKbn := True;
            if sSumKbn = 1 then
            begin
	            cbNykRootKbn.Enabled := True;

//<Rel>↓
			    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    				m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    			else
        			m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社


                // 名寄せデータが存在しているか(子社の場合は、親でチェック）
                Qry := TMQuery.Create (Self);

				//m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, Qry);
//<Rel>↑
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select count(NKNNCode) as CNT from CRDNayoseInfo '
                        +   'where (MasterKbn = 22 ) '
                        +   '  and (NayoseSyu = 1  ) '
                        +   '  and (NayoseKbn = 1  ) '
                        +   '  and (NayoseOyaNCode = :pOyaCode) ');
                    ParamByName('pOyaCode').AsFloat := m_TRNCode;

                    Open;

		            // 「名寄せの親として採用」の使用可/不可設定
                    if GetFld('CNT').AsInteger > 0 then
			            cbNykRootKbn.Enabled := False;
                end;
                Qry.Close;
                Qry.Free;

                //<176>下記の処理は、ストアド化未対応（親請求先でチェックするためStdProcCRD_CHK_NAYOSEは使用不可）
                // 回収予定データが存在しているか
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    //この処理は請求先でチェックする
                    SQL.Add('select top 1 SeikyuNCode from CRD_KAIYOTEIT where SeikyuNCode = :pSeikyuNCode and RDelKbn = 0' );
                    ParamByName('pSeikyuNCode').AsFloat := m_TRNCode;
                    Open;

		            // 「名寄せの親として採用」の使用可/不可設定
                    if not (eof)  then
                    begin
			            cbNykRootKbn.Enabled := False;
			            bSkyKbn := False;                  
                    end;
                end;
                Qry.Close;
                Qry.Free;

                // 入金データが存在しているか（常に子社でチェック）
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    //この処理は請求先でチェックする
                    SQL.Add('select top 1 OyaCSNCode from CRD_NYUKINT where OyaCSNCode = :pOyaCSNCode and RDelKbn = 0' );
                    ParamByName('pOyaCSNCode').AsFloat := m_TRNCode;
                    Open;

		            // 「名寄せの親として採用」の使用可/不可設定
                    if not (eof)  then
                    begin
			            cbNykRootKbn.Enabled := False;
			            bSkyKbn := False;
                    end;
                end;
                Qry.Close;
                Qry.Free;

                //=====================================================
                //PRC_MA0130_013(得意先「通常/特殊/随時」変更可能ﾁｪｯｸ)
                //=====================================================
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, StdProc7); //<Rel>
                with StdProc7 do
                begin
					BeginExecProc(StdProc7, False);
					try
                    ParamByName('@pTRNCD').AsFloat := m_TRNCode;
                    ExecProc;
                    finally
                    EndExecProc(StdProc7);
                    end;
                    if ParamByName('@RET_ZANHAS').AsInteger = -1 then // 残高または発生
                    begin
			            cbNykRootKbn.Enabled := False;
			            bSkyKbn := False;
                    end;
                end;
            end;

            // 「請求区分」の使用可/不可チェック

            if not cbNykRootKbn.Checked then
            	bSkyKbn := False;

            // 「請求区分」の使用可/不可設定
            f1SKYKBN.Enabled      	:= bSkyKbn;//伝票・残高があれば使用不可
            SeikyuKbnLabel.Enabled  := f1SKYKBN.Enabled;
            f1SKYKBNNM.Enabled 		:= f1SKYKBN.Enabled;
            f1SKYKBNChange(f1SKYKBN);

            // 「名寄せ親代替得意先」の使用可/不可チェック
            if f1NayoseOyaCode.Text = '' then
            begin
                // 合計取引先の子に入金が発生しているかﾁｪｯｸ <119>
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);   //子社でチェック

                Qry2 := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry2);  //子社でチェック

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select NKNNCode from CRDNayoseInfo '
                        +   'where (MasterKbn = 22 ) '
                        +   '  and (NayoseSyu = 1  ) '
                        +   '  and (NayoseKbn = 1  ) '
                        +   '  and (NayoseOyaNCode = :pOyaCode) ');
                    ParamByName('pOyaCode').AsFloat := m_TRNCode;

                    Open;

                    while not EOF do
                    begin
                        with Qry2 do
                        begin
                            Close;
                            SQL.Clear;
                            SQL.Add('select TRNCD from MTOKUI_S where ' +
                                    '(TRNCD        = :pTRNCD) and ' +
                                    '(ENDDYMD     >= :pSDYMD) and ' +
                                    '((USnGenGku  <> 0) or ' +
                                    ' (USnFriGku  <> 0) or ' +
                                    ' (USnTsryGku <> 0) or ' +
                                    ' (USnTegaGku <> 0) or ' +
                                    ' (USnSosaGku <> 0) or ' +
                                    ' (USnNebiGku <> 0) or ' +
                                    ' (USnEtcGku  <> 0))   ');
                            ParamByName('pTRNCD').AsFloat    := Qry.FieldByName('NKNNCode').Asfloat;
                            ParamByName('pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;

                            Open;

                            if (not EOF) then
                            begin
                                bDaiKbn  := FALSE;
                                uvDaiKbn := FALSE;
                                break;
                            end;
                        end;
                        Next;
                    end;
                end;
                Qry.Close;
                Qry.Free;

                Qry2.Close;
                Qry2.Free;
            end
            else
            begin
                // 親代替取引先に入金が発生しているかﾁｪｯｸ <118>　＃実際は親に入金が設定されます
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);   //子社でチェック
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select TRNCD from MTOKUI_S where ' +
                            '(TRNCD        = :pTRNCD) and ' +
                            '(ENDDYMD     >= :pSDYMD) and ' +
                            '((USnGenGku  <> 0) or ' +
                            ' (USnFriGku  <> 0) or ' +
                            ' (USnTsryGku <> 0) or ' +
                            ' (USnTegaGku <> 0) or ' +
                            ' (USnSosaGku <> 0) or ' +
                            ' (USnNebiGku <> 0) or ' +
                            ' (USnEtcGku  <> 0))   ');
                    ParamByName('pTRNCD').AsFloat    := m_TRNCode;
                    ParamByName('pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;

                    Open;

                    if (not EOF) then
                    begin
                        bDaiKbn  := FALSE;
                        uvDaiKbn := FALSE;
                    end;

                    Close;
                    Free;
                end;
            end;

            if f1SKYKBN.Value = 2 then
            	bDaiKbn := False;

            // 名寄せ代替得意先の使用可/不可設定
            NayoseOyaLabel.Enabled  := bDaiKbn;
            f1NayoseNM.Enabled      := bDaiKbn;
            f1NayoseOyaCode.Enabled := bDaiKbn;

            // 代替得意先の保存
            uvDaiGaeCode  := f1NayoseOyaCode.Text;

            // ﾘｽﾄ名称の表示
            sTmp    :=  '';
            sTmp    :=fnGetKaiBunNm    (f1Bunkai.asInteger);
            f1BunkaiNM          .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetUsgKeiNm   (f1USGKEI.Text);
            f1USGKEINM          .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetUsgKeiNm   (f1SSGKEI.Text);
            f1SSGKEINM          .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetKaiJyNm    (f1KAIJY1.Text);
            f1KAIJYNM1          .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetKaiJyNm    (f1KAIJY2.Text);
            f1KAIJYNM2          .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetKaiHasNm    (f1KAIHasu.AsInteger);
            f1KAIHasuNM       .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetTsryoFtnNm (f1TesuryoFutan.Text);
            f1TesuryoFutanNm    .Caption      :=  sTmp;
            sTmp    :=  '';
            sTmp    :=fnGetEDISiyoNm  (f1Ku.Text);
            f1KuNm              .Caption      :=  sTmp;

            sTmp    :=  '';
            sTmp    :=fnGetSkyKbnNm    (f1SKYKBN.Text);
            f1SKYKBNNM        	.Caption      :=  sTmp;

            // ﾃﾝﾌﾟﾚｰﾄの時 入力項目のコントロール
            if GetFld('m_TemplateKbn').asInteger = 1 then
            begin
                AddPanel.Enabled          := FALSE;
                //SKPanel.Enabled         := FALSE; <149>   請求書パネル
                YSNPanel.Enabled          := FALSE; //<149> 与信パネル
                //KJPanel.Enabled           := FALSE; //<149> 回収情報パネル
                HedCsTab.Items.Selected   := 0;
                DtlCsTab.Items.Selected   := 0;
                //DtlCsTab.Items[1].Enabled := FALSE; <149>
                sSumKbn                   := 0;
//<174> DEL                PMatching.Enabled         := FALSE; //<149> マッチング情報

                //<153>
                f1POSTNO1.Enabled         := FALSE;
                f1POSTNO2.Enabled         := FALSE;
                f1ADS1.Enabled            := FALSE;
                f1ADS2.Enabled            := FALSE;
                f1TEL1.Enabled            := FALSE;
                f1SectionName.Enabled     := FALSE;
                f1MailAd.Enabled          := FALSE;
                f1YSGKIN.Enabled          := FALSE;
                f1TGSITE.Enabled          := FALSE;
                f1TanNm.Enabled           := FALSE;
                f1KEISYO.Enabled          := FALSE;

                f1KanaName1.Enabled       := FALSE;
                f1KanaName2.Enabled       := FALSE; //<156>
                f1KanaName3.Enabled       := FALSE; //<156>

//<174> DEL                f1TesuryoFutan.Enabled    := FALSE;
//<174> DEL                f1TesuryoFutanNm.Enabled    := FALSE;
//<174> DEL                f1Ku.Enabled              := FALSE;
//<174> DEL                f1KuNm.Enabled              := FALSE;
                //<153>

            end
            else
            begin
                AddPanel.Enabled          := TRUE;
                //SKPanel.Enabled         := TRUE;  <149>  請求書パネル
                DtlCsTab.Items[1].Enabled := TRUE;
                YSNPanel.Enabled          := TRUE; //<149> 与信パネル
                //KJPanel.Enabled           := TRUE; //<149> 回収情報パネル
                PMatching.Enabled         := TRUE; //<149> マッチング情報

                //<153>
                f1POSTNO1.Enabled         := TRUE;
                f1POSTNO2.Enabled         := TRUE;
                f1ADS1.Enabled            := TRUE;
                f1ADS2.Enabled            := TRUE;
                f1TEL1.Enabled            := TRUE;
                f1SectionName.Enabled     := TRUE;
                f1MailAd.Enabled          := TRUE;
                f1YSGKIN.Enabled          := TRUE;
                f1TGSITE.Enabled          := TRUE;
                f1TanNm.Enabled           := TRUE;
                f1KEISYO.Enabled          := TRUE;

                f1KanaName1.Enabled       := TRUE;
                f1KanaName2.Enabled       := TRUE; //<156>
                f1KanaName3.Enabled       := TRUE; //<156>

                f1TesuryoFutan.Enabled    := TRUE;
                f1TesuryoFutanNm.Enabled  := TRUE;
                f1Ku.Enabled              := TRUE;
                f1KuNm.Enabled            := TRUE;

                //<153>

            end;
//<GAIKA> ADD St
            numSaiyoKbn_Gaika.InputFlag := False;
            numSaiyoKbn_Gaika.Value := GetFld('cs_GaikaKbn').AsInteger;  // 外貨採用区分
            numSaiyoKbn_Gaika.Tag   := numSaiyoKbn_Gaika.AsInteger;      // DB値を保持
//<GAIKA> ADD Ed
//<GFB> ADD St
            // 送金依頼人名称
            txtSoukinName1_Gaika.Text :=  GetFld('cs_GaikaSoukinName1').AsString;
            txtSoukinName2_Gaika.Text :=  GetFld('cs_GaikaSoukinName2').AsString;
            txtSoukinName3_Gaika.Text :=  GetFld('cs_GaikaSoukinName3').AsString;
//<GFB> ADD Ed
        end;

        Close();
    end;

//<187> ADD St
	//でんさいネット取引先情報のデータ取得
    with dqMasterData do
	begin
		DMemDensai1.BeforePost := Nil;
        DMemDensai1.Active := False;
        DMemDensai1.Active := True;

        DMemDensai1Sv.Active := False;
        DMemDensai1Sv.Active := True;

        Close();
  		SQL.Clear();
        SQL.Add(TDensaiInfo.SelectSQL());
		SQL.Add('ORDER BY DenUserID1,'+		//①利用者番号
						 'DenCSKanaName, '+	//②カナ名称
						 'AllBkCode,'+		//③銀行コード
						 'AllBraCode,'+		//④支店コード
						 'AccKbn,'+			//⑤預金種目
						 'AccNo');			//⑥口座番号

        SetFld('CSNCode').AsString := FormatFloat('0',m_TRNCode);
        SetFld('DenDataKbn').AsInteger := DENKBN_DENSAI;

        Open();

        while not EOF do
        begin
            DMemDensai1.Append;
            DMemDensai1UserID.AsString				:= GetFld('DenUserID1').AsString;
            DMemDensai1KanaName.AsString			:= GetFld('DenCSKanaName').AsString;
			if GetFld('AllBkCode').AsString <> '' then
	            DMemDensai1BankCode.AsInteger		:= StrToIntDef(GetFld('AllBkCode').AsString, 0);
			if GetFld('AllBraCode').AsString <> '' then
	            DMemDensai1BranchCode.AsInteger		:= StrToIntDef(GetFld('AllBraCode').AsString, 0);
			if GetFld('AccKbn').AsString <> '' then
	            DMemDensai1AccKbn.AsInteger			:= StrToIntDef(GetFld('AccKbn').AsString, 0);
            DMemDensai1AccNo.AsString				:= GetFld('AccNo').AsString;
			if GetFld('AccKbn').AsString <> '' then
	            DMemDensai1AccKbnCode.AsInteger		:= StrToIntDef(GetFld('AccKbn').AsString, 0);
            DMemDensai1.Post;

            DMemDensai1Sv.Append;
            DMemDensai1SvUserID.AsString			:= GetFld('DenUserID1').AsString;
            DMemDensai1SvKanaName.AsString			:= GetFld('DenCSKanaName').AsString;
			if GetFld('AllBkCode').AsString <> '' then
	            DMemDensai1SvBankCode.AsInteger		:= StrToIntDef(GetFld('AllBkCode').AsString, 0);
			if GetFld('AllBraCode').AsString <> '' then
	            DMemDensai1SvBranchCode.AsInteger	:= StrToIntDef(GetFld('AllBraCode').AsString, 0);
			if GetFld('AccKbn').AsString <> '' then
	            DMemDensai1SvAccKbn.AsInteger		:= StrToIntDef(GetFld('AccKbn').AsString, 0);
            DMemDensai1SvAccNo.AsString				:= GetFld('AccNo').AsString;
            DMemDensai1Sv.Post;

            Next;
		end;

        Close();

		if DMemDensai1.RecordCount > 0 then
			DMemDensai1.First;
		DMemDensai1.BeforePost := DMemDensai1BeforePost;
    end;
//<187> ADD Ed

//<Account> ADD St
    if Assigned(moAccCsInfo) then
    begin
        FreeAndNil(moAccCsInfo);
    end;
    // 口座振替情報登録済みのときインスタンス生成
    if (Assigned(moAccInfos) and (moAccInfos.Count > 0)) then
    begin
        moAccCsInfo := TAccountCustomerInfo.GetData(dqMasterData, m_TRNCode);
    end;

    if (Assigned(moAccCsInfo)) then
    begin
        iKoufuriNo := moAccCsInfo.KoufuriNo;
        moAccCsInfo.SetReference(moReference);
    end;

    FormSetAccInfo(moAccInfos, iKoufuriNo);    // 口座振替情報をフォームへセットする
    FormSetAccCsInfo(moAccCsInfo);             // 口座振替取引先情報をフォームへセットする
//<Account> ADD Ed
    dqMasterData.Free();

    case sSumKbn of
        0:  begin
                HedCsTab.Items.Selected   := 0;
                HedCsTab.Items[0].Enabled := TRUE;
                HedCsTab.Items[1].Enabled := FALSE;
                HedCsTab.Items[2].Enabled := FALSE;

                f1USDENPFM.Enabled        := TRUE;
                f1USGKEI.Enabled          := TRUE;
                PnlNayoseInfo.Visible     := FALSE;
                PnlUri.Visible            := TRUE;
            end;
        1:  begin
                HedCsTab.Items.Selected   := 1;
                HedCsTab.Items[0].Enabled := FALSE;
                HedCsTab.Items[1].Enabled := TRUE;
                HedCsTab.Items[2].Enabled := FALSE;

                f1USDENPFM.Enabled        := FALSE;
                f1USGKEI.Enabled          := FALSE;
                PnlNayoseInfo.Visible     := TRUE;
                PnlUri.Visible            := FALSE;
            end;
    end;

    f1BunkaiChange(f1Bunkai);

    m_BtUpdFlg := TRUE;
    m_RecGetSw := TRUE;

    // ﾎﾞﾀﾝの状態を制御する
    fnBtnEnbChg;

    // 決算確定の時取消ﾎﾞﾀﾝのみ使用可
    if uvDispFlg = 1 then
    begin
        MBitBtnUpd.Enabled := FALSE;        // <129>
        MBitBtnCancel.enabled := TRUE;
        MBitBtnBefor.enabled := FALSE;
        MBitBtnAfter.enabled := FALSE;      //<147>
    end;

    // 編集状態を解除する
    m_EdtSw := FALSE;

end;

//-----------------------------------------------------------------------------
// fnDtlCsTabNextSetFcous()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾀﾌﾞの移動処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnDtlCsTabNextSetFcous();
begin

    // 入力中でなけば無視
    if (( MBitBtnUpd.Enabled <> TRUE ) and ( m_BtUpdFlg )) then
        Exit;

    //<152>
    //if f1POSTNO1.enabled = FALSE then Exit;
    if (f1POSTNO1.enabled = FALSE) and (f1SSDENPFM.enabled = FALSE) then Exit;

    //<149>
    {
    if DtlCsTab.items.selected = 0 then
        MjsSetFocus(Self, 'f1POSTNO1')
    else
        MjsSetFocus(Self, 'f1Bunkai');
    }
    if DtlCsTab.items.selected = 0 then
    begin
    	if  uvTempFlg then
        	MjsSetFocus(Self, 'f1SSDENPFM') //テンプレートの時は請求書フォーム
        else
        	MjsSetFocus(Self, 'f1POSTNO1'); //テンプレートでなければ、郵便番号
    end
//<DENSHI> MOD St
{
    else
    begin
        MjsSetFocus(Self, 'f1Bunkai');      //どちらでも分解区分
    end;
}
    else if DtlCsTab.items.selected = DTLTAB_NYUKIN then
        CustomSetFocus([f1Bunkai])                //どちらでも分解区分
    else if DtlCsTab.items.selected = DTLTAB_DENSHI then
        CustomSetFocus([MNDenDataKbn])            // データ区分
//<Account> ADD St
    else if DtlCsTab.items.selected = DTLTAB_ACCOUNT then
        CustomSetFocus([numKoufuriNo_Account])   // 口座振替NO
//<Account> ADD Ed
//<DENSHI> MOD Ed
//<GAIKA> ADD St
    else if DtlCsTab.items.selected = DTLTAB_GAIKA then
        CustomSetFocus([numSaiyoKbn_Gaika])   // 外貨採用区分
//<GAIKA> ADD Ed
end;

//-----------------------------------------------------------------------------
// fnBtnNextFocus()
//      PARAM   :
//      VAR     :
//      RETURN  : Boolean
//      MEMO    : 次の強制ﾌｫｰｶｽ位置
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnBtnNextFocus(): Boolean;
var
    lvCompName  :   String;
begin

    Result := TRUE;

     // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    lvCompName := '';
    if ( Screen.ActiveControl <> nil ) then
        lvCompName := TComponent(Screen.ActiveControl).Name
    else
		Exit;

    if (lvCompName = 'f0CODE' ) then
	begin
        fnDtlCsTabNextSetFcous;
   	    Abort;
        // 注意：この後、TmTabのOnChangeｲﾍﾞﾝﾄが発生します。
	end;

    if (( f1SYURYOKBN.Enabled = TRUE  ) and ( lvCompName = 'f1SYURYOKBN' )) or
       (( f1SYURYOKBN.Enabled = FALSE ) and ( lvCompName = 'f1TNCODE'    )) or
       (( f1DefoltEDI.Enabled = TRUE  ) and ( lvCompName = 'f1DefoltEDI' )) or
       (( f1DefoltEDI.Enabled = FALSE ) and ( lvCompName = 'f1Ku'        )) or
       (( PMatching.Visible   = FALSE ) and ( lvCompName = 'f1KAIJY2'    )) or   // <149>
       (( PMatching.Enabled   = FALSE ) and ( lvCompName = 'f1KAIJY2'    )) or   // <149>
       (( PMatching.Enabled = FALSE ) and ( f1KAIJY2.Enabled   = FALSE ) and ( lvCompName = 'f1KAIHasu')) or   // <149>
       (( PMatching.Visible = FALSE ) and ( f1KAIJY2.Enabled   = FALSE ) and ( lvCompName = 'f1KAIHasu')) or   // <149>
//       (( PMatching.Visible = FALSE ) and ( lvCompName = 'f1KAIHasu'   )) then // <134>
//<Account> ADD St
//<187> MOD St
//        (( MTAccNo.Visible = TRUE  ) and ( lvCompName = 'MTAccNo' )) or
        (( MPDensaiCsInfo.Visible = TRUE  ) and ( lvCompName = 'DGridDensai1' )) or
//<187> MOD Ed
        (( MTJemcoUserID2.Visible = TRUE  ) and ( lvCompName = 'MTJemcoUserID2' )) or
        (( MNDenDataKbn.Visible = TRUE  ) and ( lvCompName = 'MNDenDataKbn' ) and
            (MPDensaiCsInfo.Visible = false) and
            (MPJemcoCsInfo.Visible = false)) or
//<Account> ADD Ed
//<GAIKA> ADD St
        ((pnlAccountDetail.Enabled = False) and ( lvCompName = 'numKoufuriNo_Account' )) or
        (( txtFreeFld5_Account.Enabled = TRUE) and ( lvCompName = 'txtFreeFld5_Account' )) or
//<GFB> MOD St
//        (( numSaiyoKbn_Gaika.Enabled = TRUE) and ( lvCompName = 'numSaiyoKbn_Gaika' ))
        (( pnlGaikaDetail.Enabled = False) and ( lvCompName = 'numSaiyoKbn_Gaika' )) or
        (( txtSoukinName3_Gaika.Enabled = TRUE) and ( lvCompName = 'txtSoukinName3_Gaika' ))
//<GFB> MOD Ed
//<GAIKA> ADD Ed
    then
    begin
        if ( MBitBtnAfter.Enabled ) then
    		MjsSetFocus(Self,ucBtnAFTER)
        else if ( MBitBtnUpd.Enabled ) then
    		MjsSetFocus(Self,ucBtnOK)
        else
            MjsSetFocus(Self,ucBtnNG);
   	    Result := FALSE;
   	    Abort;
    end;

end;

//-----------------------------------------------------------------------------
// fnEndKeyBtnFcous()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : EndKey押下時のﾋﾞｯﾄﾎﾞﾀﾝへの移動
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnEndKeyBtnFcous();
begin

	// 基本情報表示中で次へﾎﾞﾀﾝが有効だったら次へﾎﾞﾀﾝへ
//<Account> MOD St
{
    if (DtlCsTab.Items.Selected = 0) and
	   ( MBitBtnAfter.Enabled = TRUE ) then
}
    // ↑ページ判定は不要？
    if MBitBtnAfter.Enabled then
//<Account> MOD Ed
    begin
   	    MjsSetFocus(Self, ucBtnAFTER);
        Exit;
    end;

	// 更新ﾎﾞﾀﾝが有効だったら更新ﾎﾞﾀﾝへ
	if ( MBitBtnUpd.Enabled = TRUE ) then
    begin
   	    MjsSetFocus(Self, ucBtnOK);
        Exit;
    end;

	// 取消ﾎﾞﾀﾝが有効だったら取消ﾎﾞﾀﾝへ
	if ( MBitBtnCancel.Enabled = TRUE ) then
    begin
   	    MjsSetFocus(Self, ucBtnNG);
        Exit;
    end;

end;

//-----------------------------------------------------------------------------
// fnEnter()
//      PARAM   : Sender    TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : OnEnterｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.fnEnter(Sender: TObject);
var
	lvCompName  :   String;
begin

    // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙを保存する
    m_ACControl :=  Screen.ActiveControl;
	lvCompName  :=  m_ACControl.Name;

    if ( lvCompName = 'f0CODE' ) then
  	begin
        HedCsTab.Items[0].Enabled	:= TRUE;
        HedCsTab.Items[1].Enabled	:= TRUE;
        HedCsTab.Items[2].Enabled	:= TRUE;
        DtlCsTab.Items[1].Enabled   := TRUE;
        //ファンクションボタンの表示・非表示<100>
        fnSetFncType(1);
        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
//<DENSHI> ADD St
        DtlCsTab.Items[DTLTAB_DENSHI].Visible := HedCsTab.Items[0].Selected and
                                                 (uvTempFlg = False);
//<DENSHI> ADD Ed
        DtlCsTab.Items[DTLTAB_ACCOUNT].Visible := True;  //<Account> ADD
//<Gaika_1> DEL        DtlCsTab.Items[DTLTAB_GAIKA].Visible := True;    //<GAIKA> ADD
        DtlCsTab.Items[DTLTAB_GAIKA].Visible := GaikaBaseUseKbn > 0;    //<GAIKA_1> ADD
    end;
end;

//-----------------------------------------------------------------------------
// fnCheckDtlEditClosingDay()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 共通 OnChange ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.fnFldOnChg(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

    // 編集ｽｲｯﾁを設定する
    if ( m_EdtSw = FALSE ) then m_EdtSw := TRUE;

    if ( m_pRec^.m_pChildForm = nil ) then Exit;
end;

//-----------------------------------------------------------------------------
// DtlCs1EditZipCodeUpperExit()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 郵便番号の初期化
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f1POSTNO1Exit(Sender: TObject);
begin
	//
end;

//-----------------------------------------------------------------------------
// fnZipOnArrowClick() <108>
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 郵便番号検索ﾀﾞｲｱﾛｸﾞの表示
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.fnZipOnArrowClick(Sender: TObject);
var
	nReturn			    :   Integer;    // 関数戻り値
	strSearchZipCode    :   String;		// 検索郵便番号
	strAddressUpper	    :   String;		// 住所(上段)
	strAddressLower	    :   String;		// 住所(下段)
	strZipCodeWork	    :   String;
	iValue              :	Integer;
begin

	if Sender is TMNumEdit then							    // 郵便番号枝番入力
	begin
        strSearchZipCode :=
            Format('%.3d', [Trunc (f1POSTNO1.Value)])       // 郵便番号: 基番
            + '-' +
            Format('%.4d', [Trunc (f1POSTNO2.Value)]);		// 郵便番号: 枝番
        strAddressUpper	 := '';
        strAddressLower	 := '';
	end
	else												    // 住所上段入力
	begin
		strSearchZipCode := '';
        strAddressUpper  := f1ADS1.Text;				    // 住所上段 取得
        strAddressLower  := f1ADS2.Text;				    // 住所下段 取得
	end;

	nReturn	:= fnCMNPostShow (strSearchZipCode, strAddressUpper, strAddressLower, 0);

	if	( nReturn = 1 ) then
	begin
		strZipCodeWork					:= Copy (strSearchZipCode, 1, 3);
		f1POSTNO1.Value	                := StrToInt64 (strZipCodeWork);

		strZipCodeWork					:= Copy (strSearchZipCode, 5, 4);
		f1POSTNO2.Value	                := StrToInt64 (strZipCodeWork);
	  	f1POSTNO2.InputFlag				:= False;

		if	( f1ADS1.Text <> '' ) then
		begin
            iValue := MjsMessageBoxEX(Self,'住所を上書きしてもよろしいですか？','郵便番号検索',
                                      mjQuestion,mjYesNo,mjDefYes);
            if iValue <> mrYes then
                Exit;

			f1ADS1.Text	:= strAddressUpper;
		end
		else
			f1ADS1.Text	:= strAddressUpper;

		f1ADS1.SetFocus ();
	end;

end;

//-----------------------------------------------------------------------------
// DtlCs1EditZipCodeUpperExit()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 郵便番号の初期化
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1Exit(Sender: TObject);
var
	sAdr1		: String;
	sAdr2		: String;
	sZip		: String;
	iZip1		: Integer;
	iZip2		: Integer;
	iValue		: Int64;

begin
{
    if ( f1POSTNO1.AsInteger <> 0 ) then
	begin
		if ( f1POSTNO2.AsInteger	= 0 ) then
        begin
			f1POSTNO2.FormatStr	:= '0000';
			f1POSTNO2.Value		:= 1;
			f1POSTNO2.Value		:= 0;
		end;
	end
	else
	begin
		f1POSTNO2.Clear;
	end;
}
    //　実在郵便番号
	if (Sender = f1POSTNO2)   and
       ((f1POSTNO1.Value <> 0) or
        (f1POSTNO2.Value <> 0)) and
       ((f1POSTNO1.Text <> '') and
        (f1POSTNO2.Text <> '')) then
    begin
        if (f1ADS1.Text = '') and		// 住所上段下段 未入力？
           (f1ADS2.Text = '') then
        begin
            iZip1 := Trunc(f1POSTNO1.Value);		// 基番 取得
            iZip2 := Trunc(f1POSTNO2.Value);		// 枝番 取得
            sZip  := MjsEditNum(iZip1,'0000',3) + '-' + MjsEditNum(iZip2,'0000',4);		// 郵便番号 文字列変換
            sAdr1 := '';
            sAdr2 := '';

            iValue := fnCMNPostGet(sZip,sAdr1,sAdr2,0);			// 郵便番号から直接検索
            if iValue = 1 then
            begin
                f1ADS1.Text := sAdr1;			// 住所上段 SET
                f1ADS2.Text := sAdr2;			// 住所下段 SET
            end
            else if iValue < 0 then
            begin
                Beep;
                MjsSetFocus(Self,(Sender as TMNumEdit).Name);	// 元の場所に戻す
                Abort;
            end;
        end;
    end;

    // 実在住所上段
    if Sender = f1ADS1 then					// 住所上段入力
    begin
        if (f1POSTNO1.Value = 0) and				// 基番,枝番 未入力？
           (f1POSTNO2.Value = 0) then
        begin
            sZip  := '';
            sAdr1 := f1ADS1.Text;
            sAdr2 := f1ADS2.Text;

            iValue := fnCMNPostGet(sZip,sAdr1,sAdr2,0);			// 住所から直接検索
            if iValue = 1 then
            begin
                iZip1 := StrToInt(MjsCopy(sZip,3));				// 基番 取り出し
                iZip2 := StrToInt(Copy(sZip,5,4));				// 枝番 取り出し
                f1POSTNO1.Value := iZip1;			// 基番 SET
                f1POSTNO2.Value := iZip2;			// 枝番 SET
            end;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnDtlCs1EditZipCodeOnKeyDown()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key,Shift
//      RETURN  :
//      MEMO    : 郵便番号(枝番) OnKeyDown ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.fnDtlCs1EditZipCodeOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	nReturn		    :   Integer;
	strPostCode	    :   String;
	strAddressUpper :   String;
	strAddresslower :   String;
begin

    if	(( GetKeyState (VK_MENU) < 0       )  and
         ( Key                   = VK_DOWN )) then Exit;

	if	(( Key = VK_RETURN )  or
         ( Key = VK_RIGHT  )  or
         ( Key = VK_DOWN   )) then
	begin
		strPostCode	:= Format ('%.3d-%.4d', [f1POSTNO1.AsInteger, f1POSTNO2.AsInteger]);

		if ( strPostCode = '000-0000' ) then
		begin
//			MjsDispCtrl.MjsNextCtrl(Self);
			Abort;
		end;

		nReturn	:= fnCMNPostGet (strPostCode, strAddressUpper, strAddressLower, 0);

		if	( nReturn = 1 ) then
		begin
			if	( f1ADS1.Text = '' ) then
				f1ADS1.Text	:= strAddressUpper;
        end
		else
		begin
			Beep ();

			m_AcControl	:= TMNumEdit (Sender);
			m_AcControl.SetFocus ();

			Abort ();
		end;
	end;

end;

//-----------------------------------------------------------------------------
// fnOutputDBErrorMessage()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : DBｴﾗｰﾒｯｾｰｼﾞ出力処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP004003F.fnOutputDBErrorMessage ();
begin
	if	(m_nDBErrorCode <> 0) then
	begin
		case (m_nDBErrorCode) of
			1:	m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 0, 1);
			2:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 5);
					m_cErrorMsgRec.sMsg	:= '固定体系区分が固定' + m_cErrorMsgRec.sMsg;
				end;
			3:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '子供が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			4:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '仕訳が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			5:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '諸口以外のレコードが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			6:	begin
                    m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
                    m_cErrorMsgRec.sMsg	:= '削除できません。（支払予定データが存在するため削除' + m_cErrorMsgRec.sMsg + '）';
				end;
			7:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
   					m_cErrorMsgRec.sMsg	:= '部署情報が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			8:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
   					m_cErrorMsgRec.sMsg	:= '未連結仕訳(部署or分散)が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
		end;
	end;

	MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
											m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;

//-----------------------------------------------------------------------------
// TMTxt_KanaName1Exit()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ｶﾅ名称1変換
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1KanaName1Exit(Sender: TObject);
Var
    widx		:   Integer;
    wlen		:   Integer;
    kanamem		:   String;
begin

    // 半音文字変換処理実施
    //kanamem := Trim(f1KanaName1.Text);
    if Sender =  f1KanaName1 then kanamem := Trim(f1KanaName1.Text);
    if Sender =  f1KanaName2 then kanamem := Trim(f1KanaName2.Text);
    if Sender =  f1KanaName3 then kanamem := Trim(f1KanaName3.Text);

    if ( kanamem <> '' ) then
    begin
    	for widx := 0 to length(_strhalfkana) do
        begin
        	for wlen := 0 to length(kanamem) do
            begin
            	if ( kanamem[wlen] = _strhalfkana[widx] ) then
                begin
                	kanamem[wlen] := _strkana[widx];
                end;
            end;
        end;
        // 変換後のｶﾅ名称をｾｯﾄ
		//f1KanaName1.Text := kanamem;
        if Sender =  f1KanaName1 then f1KanaName1.Text := kanamem;
        if Sender =  f1KanaName2 then f1KanaName2.Text := kanamem; //<156>
        if Sender =  f1KanaName3 then f1KanaName3.Text := kanamem; //<156>
    end;

end;

//-----------------------------------------------------------------------------
// TMTxt_KanaName1KeyPress()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key
//      RETURN  :
//      MEMO    : ｶﾅ名称1変換
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1KanaName1KeyPress(Sender: TObject;
  var Key: Char);
begin

    // 名称ｶﾅ入力時半音ｶﾅ文字の変換を行なう
    case Key of
        	char(VK_BACK),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')','*' :  //<185>
        begin
        end;
        'ｧ': key := 'ｱ';
        'ｨ': key := 'ｲ';
        'ｩ': key := 'ｳ';
        'ｪ': key := 'ｴ';
        'ｫ': key := 'ｵ';
        'ｬ': key := 'ﾔ';
        'ｭ': key := 'ﾕ';
        'ｮ': key := 'ﾖ';
        'ｯ': key := 'ﾂ';
        '{': key := '(';
        '[': key := '(';
        '}': key := ')';
        ']': key := ')';
        'ｰ': key := '-';
        '､': key := ',';
        '｡': key := '.';
		' ': key := ' ';
        'a'..'z': key := Chr(Ord(key) - 32);
		else
		begin
            Key := char(nil);
		end;
	end;

end;

//-----------------------------------------------------------------------------
// TMNum_TsryFtnArrowClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1TesuryoFutanArrowClick(Sender: TObject);
begin

    // InputFlgを立てる0値表示のため
    if ( Sender = f1TesuryoFutan ) then
		f1TesuryoFutan.inputFlag := FALSE;

    if ( Sender = f1Ku ) then
		f1Ku.inputFlag := FALSE;

end;

//-----------------------------------------------------------------------------
// TMNum_TsryFtnChange()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 入力文字列ﾘｽﾄからの名称ｾｯﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1TesuryoFutanChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

	fnFldOnChg(Sender);

	if ( m_bFirstFlag = FALSE ) then Exit;

	m_ErrObjNm  :=  '';

	// 名称のｾｯﾄ
    // 手数料負担区分
    if ( Sender = f1TesuryoFutan ) then
    begin
    	f1TesuryoFutanNm.caption := '';
	end
    // EDI採用区分
    else if ( Sender = f1Ku ) then
    begin
    	f1KuNm.caption := '';
        if ( f1Ku.Text  = '' ) or
           ( f1Ku.Value = 0  ) then
        begin
			// EDI情報の使用可不可制御
			f1DefoltEDI.Enabled     :=  FALSE;
            LblDefoltEDI.Enabled    :=  FALSE;
        end
        // EDI情報の使用可不可制御
//        else if ( f1Ku.AsInteger <> 1 ) then  // <126>EDI採用、仮想口座採用いずれも有効とする
        else if ( f1Ku.AsInteger = 0 ) then
        begin
        	// EDI採用なし:0の場合=>EDI情報使用不可
            f1DefoltEDI.Enabled     :=  FALSE;
            LblDefoltEDI.Enabled    :=  FALSE;
        end
        else
        begin
//<174> DEL            if not uvTempFlg then //テンプレートでなければ  //<149>
//<174> DEL            begin
        		// EDI採用あり:1の場合=>EDI情報使用可
            	f1DefoltEDI.Enabled     :=  TRUE;
            	LblDefoltEDI.Enabled    :=  TRUE;
//<174> DEL            end;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// f1ItemsCheak()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 文字列ﾘｽﾄ入力欄の名称ﾁｪｯｸ処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.f1ItemsCheak(Sender: TObject);
var
    sTmp	:	String;
begin

	if ( m_bFirstFlag = FALSE ) then Exit;

    sTmp := '';

    // 売上合計欄印字
    if ( Sender = f1USGKEI ) then
    begin
        f1USGKEINM.caption := '';
        if ( f1USGKEI.text = '' ) then
        	f1USGKEI.Value := uvTmpUSGKEI;

        sTmp := fnGetUsgKeiNm(f1USGKEI.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1USGKEI';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1USGKEINM.caption := sTmp;
        Exit;

    end
    // 請求合計欄印字
    else if ( Sender = f1SSGKEI ) then
    begin
        f1SSGKEINM.caption := '';
        if ( f1SSGKEI.text = '' ) then
            f1SSGKEI.Value := uvTmpSSGKEI;

        sTmp := fnGetUsgKeiNm(f1SSGKEI.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1SSGKEI';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1SSGKEINM.caption := sTmp;
        Exit;
    end
    // 分解方法
    else if ( Sender = f1Bunkai ) then
    begin
        sTmp := fnGetKaiBunNm(f1Bunkai.asInteger);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1Bunkai';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1BunkaiNM.caption := sTmp;
        Exit;
    end
    // 回収種別 未満
    else if ( Sender = f1KAIJY1 ) then
    begin
        if ( f1KAIJY1.text = '' ) then
        begin
            f1KAIJYNM1.caption := '';
            if f1KAIRITU.value = 100 then begin
                //回収種別　未満に値が設定されていれば反映させる
                f1KAIJY2.Value := f1KAIJY1.Value;
                f1ItemsCheak(f1KAIJY2);
            end;
        	Exit;
        end
        else
        begin
        	sTmp := fnGetKaiJyNm(f1KAIJY1.Text);
        	if  ( sTmp = '' ) then
            begin
				m_ErrObjNm := 'f1KAIJY1';
				Beep;
//<123>                Abort;
                Exit;
            end;
            f1KAIJYNM1.caption := sTmp;
            if f1KAIRITU.value = 100 then begin
                //回収種別　未満に値が設定されていれば反映させる
                f1KAIJY2.Value := f1KAIJY1.Value;
                f1ItemsCheak(f1KAIJY2);
            end;
			Exit;
        end;
        Exit;
    end
    // 回収種別 以上
    else if ( Sender = f1KAIJY2 ) then
    begin
        if ( f1KAIJY2.text = '' ) then
        begin
            f1KAIJYNM2.caption := '';
        	Exit;
        end
        else
        begin
        	sTmp := fnGetKaiJyNm(f1KAIJY2.Text);
        	if  ( sTmp = '' ) then
            begin
				m_ErrObjNm := 'f1KAIJY2';
				Beep;
//<123>                Abort;
                Exit;
            end;
            f1KAIJYNM2.caption := sTmp;
			Exit;
        end;
        Exit;
    end
    // 端数処理方法
    else if ( Sender = f1KAIHasu ) then
    begin
        sTmp := fnGetKaiHasNm(f1KAIHasu.AsInteger);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1KAIHasu';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1KAIHasuNM.caption := sTmp;
        Exit;
    end
    // 手数料負担区分
    else if ( Sender = f1TesuryoFutan ) then
    begin
    	if ( f1TesuryoFutan.text = '' ) then
        begin
            f1TesuryoFutanNm.caption := '';
			Exit;
        end
        else
        begin
        	sTmp := fnGetTsryoFtnNm(f1TesuryoFutan.Text);
        	if  ( sTmp = '' ) then
            begin
				m_ErrObjNm := 'f1TesuryoFutan';
				Beep;
//<123>                Abort;
                Exit;
            end;
            f1TesuryoFutanNm.caption := sTmp;
            Exit;
        end;
        Exit;
    end;

    // EDI採用区分の名称セット
    if ( Sender = f1Ku ) then
    begin
    	if ( f1Ku.text = '' ) then
        begin
            f1KuNm.caption := '';
        	Exit;
        end
        else
        begin
        	sTmp := fnGetEDISiyoNm(f1Ku.Text);
        	if  ( sTmp = '' ) then
            begin
				m_ErrObjNm := 'f1Ku';
				Beep;
//<123>                Abort;
                Exit;
            end;
            f1KuNm.caption := sTmp;
			Exit;
        end;
        Exit;
    end
    else if ( Sender = f1SKYKBN ) then
    begin
        f1SKYKBNNM.caption := '';

        sTmp := fnGetSkyKbnNm(f1SKYKBN.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1SKYKBN';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1SKYKBNNM.caption := sTmp;
        Exit;
    end
    else if ( Sender = f1NayoseOyaCode ) then
    begin
        f1NayoseNM.caption := '';

        if ( fnGetNAME(f1NayoseOyaCode.Text, 22, m_TrCodeAttr, sTmp) = FALSE ) then
        begin
            m_ErrObjNm := 'f1NayoseOyaCode';
            Beep;
//<123>            Abort;
            Exit;
        end;

        f1NayoseNM.caption := sTmp;
        Exit;
    end
//<GAIKA> ADD St
    else if ( Sender = numSaiyoKbn_Gaika ) then
    begin
        if ( numSaiyoKbn_Gaika.Text = '' ) then
        	numSaiyoKbn_Gaika.Value := uvTmpGaikaSaiyoKbn;

        if (GetCodeListByName(
            numSaiyoKbn_Gaika.AsInteger, SaiyoNames_Gaika) = '') then
        begin
            m_ErrObjNm := 'numSaiyoKbn_Gaika';
            Beep;
        end;

        Exit;
    end
//<GAIKA> ADD Ed
end;

//-----------------------------------------------------------------------------
// fnGetKeisyoNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 敬称の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnGetKeisyoNm(sCd: String): String;
var
    i   :   Integer;
begin

    Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_KeisyoItems) to High(_KeisyoItems) do
    begin
    	if ( _KeisyoItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _KeisyoItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetUsgKeiNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 売上合計欄税印字の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnGetUsgKeiNm(sCd: String): String;
var
    i   :   Integer;
begin

    Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
    begin
    	if ( _UsgKeiItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _UsgKeiItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetKaiJyNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 回収種別 未満/以上の名称を取得
//-----------------------------------------------------------------------------
function        TJNTCRP004003F.fnGetKaiJyNm(sCd: String): String;
var
    i   :   Integer;
begin

    Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_KaiJyItems) to High(_KaiJyItems) do
    begin
    	if ( _KaiJyItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _KaiJyItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetKaiBunNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 分解方法の名称を取得
//-----------------------------------------------------------------------------
function        TJNTCRP004003F.fnGetKaiBunNm(iCd: Integer): String;
var
    i   :   Integer;
begin

    Result := '';

	for i := Low(_KaiBunItems) to High(_KaiBunItems) do
    begin
    	if ( _KaiBunItems[i].iCode = iCd ) then
        begin
        	Result := _KaiBunItems[i].sName;
            Exit;
        end;
    end;

end;
//-----------------------------------------------------------------------------
// fnGetKaiHasNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 端数処理方法の名称を取得
//-----------------------------------------------------------------------------
function        TJNTCRP004003F.fnGetKaiHasNm(iCd: Integer): String;
var
    i   :   Integer;
begin

    Result := '';

	for i := Low(_KaiHasItems) to High(_KaiHasItems) do
    begin
    	if ( _KaiHasItems[i].iCode = iCd ) then
        begin
        	Result := _KaiHasItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetTsryoFtnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 手数料負担の名称を取得
//-----------------------------------------------------------------------------
Function    TJNTCRP004003F.fnGetTsryoFtnNm(sCd : String): String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_TsryFtnItems) to High(_TsryFtnItems) do
    begin
    	if ( _TsryFtnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _TsryFtnItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetEDISiyoNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : EDI採用区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnGetEDISiyoNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_EDIKuItems) to High(_EDIKuItems) do
    begin
    	if ( _EDIKuItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _EDIKuItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetSkyKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 請求区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnGetSkyKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

//<175>  _SeikyuKbnItems → m_SeikyuKbnItems (定数から変数に変更）
	for i := Low(m_SeikyuKbnItems) to High(m_SeikyuKbnItems) do
    begin
    	if ( m_SeikyuKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := m_SeikyuKbnItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// TMNum_KnjkmkEnter()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : EDI情報 OnEnter ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004003F.TMNum_KnjkmkEnter(Sender: TObject);
begin

    m_ACControl := Screen.ActiveControl;

	if ( m_ErrObjNm <> '' ) then
    begin
		if ( m_ErrObjNm <> 'TMTxt_EDIInfo' ) then
        begin
            // 元の場所に戻す
	    	MjsSetFocus(Self, m_ErrObjNm);
   			Abort;
            Exit;
		end;
    end;

end;


//-----------------------------------------------------------------------------
// TMNum_KnjkmkChange()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 勘定科目 OnChange ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.TMNum_KnjkmkChange(Sender: TObject);
begin

    m_ErrObjNm := '';

end;

//-----------------------------------------------------------------------------
// fnOutputConfirmationMessage()
//      PARAM   : nDivision : 処理区分
//      VAR     :
//      RETURN  : Integer
//      MEMO    : 終了･取消時, 確認ﾒｯｾｰｼﾞ出力処理
//-----------------------------------------------------------------------------
function	TJNTCRP004003F.fnOutputConfirmationMessage (nDivision: Integer): Integer;
var
	stMessageRec: TMJSMsgRec;
	nMessageID	: Integer;
	nReturn		: Integer;
begin

	nMessageID	:= 1;

	if	( nDivision = CONFIRM_EXIT ) then
	begin
		if	(Trim (f0CODE.Text) = '') then
		begin
			Result	:= CONFIRM_THROUGH;
			Exit;
		end;

		nMessageID	:= 2;
	end;

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10020, nMessageID);

	nReturn	:= MJSMessageBoxEx (Self,stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

	if	( nReturn = mrYes ) then
	begin
		if	( nDivision = CONFIRM_EXIT ) then
			nReturn	:= CONFIRM_EXITWRITE
		else
			nReturn	:= CONFIRM_THROUGH;
	end
	else if	( nReturn = mrNo ) then
	begin
		if	( nDivision = CONFIRM_EXIT ) then
			nReturn	:= CONFIRM_THROUGH
		else
			nReturn	:= CONFIRM_RETFOCUSED;
	end
	else if	( nReturn = mrCancel ) then
		nReturn	:= CONFIRM_RETFOCUSED
	else
		nReturn	:= CONFIRM_THROUGH;

	Result	:= nReturn;

end;

//-----------------------------------------------------------------------------
// HedCsTabChange()
//      PARAM   : Sender : TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.HedCsTabChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

    if ( m_bFirstFlag = FALSE ) then Exit;

    case HedCsTab.Items.Selected of
        // 実在
        0:  begin
                DtlCsSub01Panel.Visible :=  TRUE;
                HedPanel.Visible        :=  TRUE;
                PnlButton.Visible       :=  TRUE;
                DtlCsTab.Items[DTLTAB_DENSHI].Visible   := (uvTempFlg = False);     //<DENSHI> ADD
                DtlCsTab.Items[DTLTAB_ACCOUNT].Visible  := (uvTempFlg = False);     //<Account> MOD
                DtlCsTab.Items[DTLTAB_GAIKA].Visible    := (GaikaBaseUseKbn > 0);   //<GAIKA_1> ADD
//<187> DEL St
{
//<DENSHI> DEL                B_Delete.Enabled        :=  FALSE;
//<DENSHI> ADD St
                if (DtlCsTab.Items.Selected = DTLTAB_DENSHI) then
                begin
                    B_Delete.Enabled :=  m_JNTAuthority.IsDelete;
                end
                else
                begin
                    B_Delete.Enabled :=  FALSE;
                end;

                // 削除ボタンの制御
                if (DtlCsTab.Items.Selected = DTLTAB_DENSHI) then
                begin
                    B_Delete.OnClick := BDenshiDeleteClick;
                end
//<Account> ADD St
                else if (DtlCsTab.Items.Selected = DTLTAB_ACCOUNT) then
                begin
                    B_Delete.OnClick := BAccountDeleteClick;
                end
//<Account> ADD Ed
                else
                begin
                    B_Delete.OnClick := BDeleteClick;
                end;
//<DENSHI> ADD Ed
}
//<187> DEL Ed
//<GAIKA> ADD St
                // ヘッダータブ切り替え時は詳細タブを先頭に戻す
                if (DtlCsTab.Items.Selected in
                    [DTLTAB_FIRST + 1..DTLTAB_LAST]) then
                begin
                    DtlCsTab.Items.Selected := DTLTAB_FIRST;
                end;
//<GAIKA> ADD Ed
                MemNayose.Close;

                if ( HedPanel.Enabled ) then
                    MjsSetFocus(Self,'f0CODE');
                PnlNayoseInfo.Visible   :=  FALSE;
                PnlUri.Visible          :=  TRUE;
                PMatching.Visible       := TRUE;    // <127>
			    fnSetFncType(1);
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
            end;
        // 合計
        1:  begin
//                if ( f0CODE.Enabled = FALSE ) then
//                    f0CODE.Enabled      :=  TRUE;

                DtlCsSub01Panel.Visible :=  TRUE;
                HedPanel.Visible        :=  TRUE;
                PnlButton.Visible       :=  TRUE;
                DtlCsTab.Items[DTLTAB_DENSHI].Visible   := FALSE;   //<DENSHI> ADD
                DtlCsTab.Items[DTLTAB_ACCOUNT].Visible  := TRUE;   //<Account> ADD
                DtlCsTab.Items[DTLTAB_GAIKA].Visible    := (GaikaBaseUseKbn > 0);   //<GAIKA_1> ADD
//<187> DEL St
{
                B_Delete.Enabled        :=  FALSE;
//<Account> DEL                B_Delete.OnClick        := BDeleteClick;          //<DENSHI> ADD
//<Account> ADD St
                if (DtlCsTab.Items.Selected = DTLTAB_ACCOUNT) then
                begin
                    B_Delete.OnClick := BAccountDeleteClick;
                end
                else
                begin
                    B_Delete.OnClick := BDeleteClick;
                end;
//<Account> ADD Ed
}
//<187> DEL Ed
//<DENSHI> ADD St
                if (DtlCsTab.Items.Selected in
//<GAIKA> DEL                    [DTLTAB_DENSHI, DTLTAB_ACCOUNT]) then   //<Account> MOD 口座振替情報追加
                    [DTLTAB_FIRST + 1..DTLTAB_LAST]) then   //<GAIKA> ADD
                begin
                    DtlCsTab.Items.Selected := DTLTAB_FIRST;
                end;
//<DENSHI> ADD Ed

                MemNayose.Close;

                if  HedPanel.Enabled  then
                    MjsSetFocus(Self,'f0CODE');
                PnlNayoseInfo.Visible   :=  TRUE;
                PnlUri.Visible          :=  FALSE;
                PMatching.Visible       := FALSE;    // <127>
			    fnSetFncType(1);
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
            end;
        // 名寄せ
        2:  begin
                HedPanel.Visible        :=  FALSE;
                // 編集結果を確認する
                if ( m_EdtSw ) then
                begin
                    if fnCancel(FALSE) then
                    begin
                        Abort;
                        Exit;
                    end;
                end
                else
                begin
                    fnInzFormf1;
                    f0CODE.Text    := '';
                    HedPanel.Enabled := TRUE;
                    fnBtnEnbChg;
                end;

                PnlButton.Visible       :=  FALSE;

                //権限と決算確定区分を参照
               	//B_Delete.Enabled        :=  (m_cJNTArea.IsDelete) and (uvDispFlg <>1 );

//<187> DEL St
{
                //<Authority>↓
                //B_Delete.Enabled        :=  m_cJNTArea.IsDelete; //<150>
                B_Delete.Enabled        :=  m_JNTAuthority.IsDelete; //<150>
                //<Authority>↑

                B_Delete.OnClick        := BDeleteClick;          //<DENSHI> ADD
}
//<187> DEL Ed

                fnGetNayoseInfo();
			    fnSetFncType(0);
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

                //<163>
                MjsSetFocus(Self,'f2OyaCode');

        end;
    end;

//<187> ADD St
	//削除ボタンの制御
	ControlDeleteButton
//<187> ADD Ed
end;

//-----------------------------------------------------------------------------
// fnGetNayoseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ情報の取得
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnGetNayoseInfo();
var
	sHojCD		:   String;
	sOyaCD		:   String;
	strFormat	:   String;
    DmqData     :   TMQuery;
begin
    SKYKBN2.Value       := 0;
    SKYKBNNM2.Caption	:= '';
    NayoseOyaCode2.text := '';
    NayoseNM2.Caption   := '';

    uvSvOyaHojCD := '';

    m_bReadFlg  :=  TRUE;

	DSNayose.DataSet    :=  nil;

	MemNayose.Close;
	MemNayose.Open;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

	with (DmqData) do
	begin
		Close;
		SQL.Clear;
		SQL.Add('select                                 '
            +   '    NI.NKNNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode  as SGCode                '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode as OYAGCode              '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NMK    as SNAME                 '   // 子取引先名称
		    +   '   ,MTO.NMK   as OYANAME               '   // 親取引先名称
		    +   '   ,se.UsKinKbn  as UsKinKbn           '   // 請求区分
		    +   '   ,cr.CngNCode  as CngNCode           '   // 名寄せ親代替取引先内部コード
            +   '   ,MTN.GCode as NDGCode               '   // 名寄せ取引先外部ｺｰﾄﾞ
		    +   '   ,MTN.NMK   as NDNAME                '   // 名寄せ取引先名称
		    +   'from CrdNayoseInfo NI                  '
            +   'left outer join MTOKUI MT              '
            +   '   on (NI.NknNCode = MT.NCode)         '
            +   'left outer join MTOKUI MTO             '
            +   '   on (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'LEFT OUTER JOIN MTOKUI_SEL se          '
            +   '   ON (se.BaseNCode = NI.NayoseOyaNCode and se.RecKBN = 1) '
            +   'LEFT OUTER JOIN MTOKUI_CRD cr            '
            +   '   ON (cr.BaseNCode = NI.NayoseOyaNCode) '
            +   'LEFT OUTER join MTOKUI MTN             '
            +   '   on (cr.CngNCode = MTN.NCode)        '
            +   'where (NI.MasterKbn = 22 )             '
            +   '  and (NI.NayoseSyu = 1  )             '
            +   '  and (NI.NayoseKbn = 1  )             ');

//<0163>↓
            //親得意先コード選択ありの場合
            if f2OyaCode.Text <> '' then
            begin
                SQL.Add('  and (NI.NayoseOyaNCode = :pOYANCode )');
            end;
            //子得意先コード選択ありの場合
            if f2KoCode.Text <> '' then
            begin
                SQL.Add('  and (NI.NKNNCode = :pKoNCode )');
            end;

            SQL.Add('order by MTO.GCode,MT.GCode');

            //親得意先コード選択ありの場合
            if f2OyaCode.Text <> '' then
            begin
                ParamByName('pOYANCode' ).AsFloat	 := fnGetNCODE(f2OyaCode.text, 22, m_TrCodeAttr);
            end;
            //子得意先コード選択ありの場合
            if f2KoCode.Text <> '' then
            begin
                ParamByName('pKoNCode' ).AsFloat	 := fnGetNCODE(f2KoCode.text, 22, m_TrCodeAttr);
            end;

            m_Savef2OyaCode := f2OyaCode.text;  //<172> 直前の検索キーをセーブ
            m_Savef2KoCode  := f2KoCode.text;   //<172>


//<0163>↑


		//	ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            DmqData.Close();
            DmqData.Free();
            Exit;
		end;

        try

            // ﾃﾞｰﾀの表示を無効にする
            MemNayose.DisableControls;

            while ( not EOF ) do
            begin
                // 名寄せ子
                sHojCD := FieldByName('SGCode').AsString;
                if ( m_TRCodeAttr <= 1 ) then
                begin
                    case ( m_TRCodeAttr ) of
                        0: strFormat := '%'  + IntToStr (m_TRCodeDigit) + 'd';
                        1: strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    end;

                    sHojCD := Format(strFormat,[StrToInt64(Trim(sHojCD))]);
                end;

                // 名寄せ親
                sOyaCD := FieldByName('OyaGCode').AsString;
                if ( m_TRCodeAttr <= 1 ) then
                begin
                    case ( m_TRCodeAttr ) of
                        0: strFormat := '%'  + IntToStr (m_TRCodeDigit) + 'd';
                        1: strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    end;

                    sOyaCD := Format(strFormat,[StrToInt64(Trim(sOyaCD))]);
                end;

                MemNayose.Append;
                MemNayose.FieldByName('HojCode'     ).AsString  := Trim(sHojCD);                     // 名寄せ子外部ｺｰﾄﾞ(DB用)
                MemNayose.FieldByName('BaseHojCode' ).AsString  := GetFld('SGCode'   ).AsString;	 // 名寄せ子外部ｺｰﾄﾞ(表示用)
                MemNayose.FieldByName('SName'       ).AsString  := GetFld('SNAME'    ).AsString;	 // 名寄せ子名称
                MemNayose.FieldByName('OyaHojCD'    ).AsString  := Trim(sOyaCD);                     // 名寄せ親外部ｺｰﾄﾞ(DB用)
                MemNayose.FieldByName('OyaBaseHojCD').AsString  := GetFld('OyaGCode' ).AsString;	 // 名寄せ親外部ｺｰﾄﾞ(表示用)
                MemNayose.FieldByName('OyaName'     ).AsString  := GetFld('OYANAME'  ).AsString;	 // 名寄せ親名称
                MemNayose.FieldByName('NknNCode'    ).AsFloat   := GetFld('NknNCode' ).AsFloat;      // 名寄せ子内部ｺｰﾄﾞ
                MemNayose.FieldByName('OyaNCode'    ).AsFloat   := GetFld('NayoseOyaNCode').AsFloat; // 名寄せ親内部ｺｰﾄﾞ
                MemNayose.FieldByName('UsKinKbn'    ).AsInteger := GetFld('UsKinKbn').AsInteger;       // 請求区分
                MemNayose.FieldByName('CngNCode'    ).AsFloat   := GetFld('CngNCode').AsFloat;       // 請求区分
                MemNayose.FieldByName('NDCode'      ).AsString  := GetFld('NDGCode' ).AsString;	 	 //
                MemNayose.FieldByName('NDName'      ).AsString  := GetFld('NDName'  ).AsString;	 	 //
                MemNayose.Post;

				// 最後の親コードを退避(上段コピーに使用)
				uvSvOyaHojCD := Trim(sOyaCD);
                next;
            end;
		finally
            // ﾃﾞｰﾀの表示を有効にする
            MemNayose.EnableControls;
        end;
	end;

    DSNayose.DataSet := MemNayose;

    if ( MemNayose.RecordCount > 0 ) then
    	MemNayose.First;

    m_bReadFlg  :=  FALSE;

    DmqData.Close();
    DmqData.Free();

    if ( MemNayose.RecordCount = 0 ) then
    begin
    	GridNayoseOyaCode.DisableEditor := False;
    	GridNayoseOyaCode.ReadOnly      := False;
    	GridNayoseCode.DisableEditor    := False;
    	GridNayoseCode.ReadOnly         := False;
    end
    else
		GridNayoseChangeNodeEx(GridNayose);

end;

//-----------------------------------------------------------------------------
// MemNayoseBeforePost()
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.MemNayoseBeforePost(DataSet: TDataSet);
var
	sNknCD      : String;
	sOyaCD	    : String;
    nNknCD      : Extended;
    nOyaCD      : Extended;
    nDaiCD      : Extended;
    Bol         : Boolean;
    lvDaigae    : Boolean;

    nOyaNCode   : Extended;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>

{$I JNTSProcUtil.inc}
begin
//<Rel>↓
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
		m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
	else
		m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//<Rel>↑



//    切出/埋込ﾎﾞﾀﾝ押下時は処理を中断
//    if ( m_bChange ) then   Exit;

    if (m_bReadFlg = TRUE) then
        Exit;

    if (DataSet.FieldByName('HojCode') .IsNull       ) or
       (DataSet.FieldByName('HojCode') .AsString = '') or
       (DataSet.FieldByName('OyaHojCD').IsNull       ) or
       (DataSet.FieldByName('OyaHojCD').AsString = '') then
    begin
        if (m_bEndFlg = TRUE) then
            Exit;

        Abort;
    end;

    // 入力値ﾁｪｯｸ、親得意先の実績ﾏｽﾀ作成
	if (fnRecordCheck() = FALSE) then
        Abort;

	// -----<155> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<155> Add-Ed-----

	with (DataSet) do
	begin
		sNknCD := FieldByName('HojCode' ).AsString;	        // 子得意先ｺｰﾄﾞ
		sOyaCD := FieldByName('OyaHojCD').AsString;	        // 名寄せ親得意先ｺｰﾄﾞ
		nNknCD := FieldByName('NknNCode').AsFloat;	        // 子得意先内部ｺｰﾄﾞ
		nOyaCD := FieldByName('OyaNCOde').AsFloat;	        // 名寄せ親得意先内部ｺｰﾄﾞ
		nDaiCD := 0;	                                    // 名寄せ親代替内部ｺｰﾄﾞ

        // ---------------------------
        //  新規登録時
        // ---------------------------
		if (State in [dsInsert]) then
		begin
            // 名寄せ親代替得意先の存在ﾁｪｯｸ
            lvDaigae := fnCheckDaigae(sOyaCD, nDaiCD);

			// 名寄せ親得意先ｺｰﾄﾞが存在するかCheck
			if (fnCheckNknNayoseInfo(sOyaCD, NAYOSE_PARENT) = FALSE) then
            begin
				// 名寄せ親が存在しない時、名寄せ親情報追加
				if (fnUpDateNknNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, True) = FALSE) then
                    Abort;

       			// 名寄せ親代替コードが登録されているかCheck
                // 請求情報の更新(親)
    			if lvDaigae then
                begin                                       // 請求情報の更新(一括請求)
                    if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, True, True) = FALSE) then
                        Abort;
                end
                else
                begin                                       // 請求情報の更新(各店別請求)
                    if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2, True, True) = FALSE) then
                        Abort;
                end;
            end;

			// 名寄せ情報を追加
			if (fnUpDateNknNayoseInfo(nNknCD, nOyaCD, NAYOSE_CHILD, MODE_INSERT, True) = FALSE) then
                Abort;

			// 登録した親コードを退避(上段コピーに使用)
			uvSvOyaHojCD := Trim(sOyaCD);

  			// 名寄せ親代替コードが登録されているかCheck

            // 請求情報の更新(子・代替)
   			if lvDaigae then
            begin                                           // 請求情報の更新(一括請求)
                // 子
                if (fnUpDateMTokui_SelInfo(nNknCD, nOyaCD,  2, 1, False, True) = FALSE) then
                    Abort;

                // 代替
                if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1, False, True) = FALSE) then
                    Abort;
            end
            else
            begin                                           // 請求情報の更新(各店別請求)
                if (fnUpDateMTokui_SelInfo(nNknCD, nOyaCD, 12, 2, False, True) = FALSE ) then
                    Abort;
            end;

		end;

        // ---------------------------
        //  更新処理時
        // ---------------------------
		if (State in [dsEdit]) then
		begin
			if (m_AfterSave.sOyaCD <> sOyaCD) then
			begin
                lvDaigae := fnCheckDaigae(sOyaCD, nDaiCD);

				// 名寄せ親入金先ｺｰﾄﾞが存在するかCheck
				if (fnCheckNknNayoseInfo(sOyaCD, NAYOSE_PARENT) = FALSE) then
                begin
                    // 名寄せ親が存在しない時,名寄せ親情報追加
					if (fnUpDateNknNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, True) = FALSE) then
                        Abort;

          			// 名寄せ親代替ｺｰﾄﾞが登録されているかCheck
                    // 請求情報の更新(親)
           			if  lvDaigae then
                    begin
                        if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, True, True) = FALSE) then
                            Abort;
                    end
                    else
                    begin
                        if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2, True, True) = FALSE) then
                            Abort;
                    end
                end;

				// 名寄せ情報を更新(名寄せ 子)
				if (fnUpDateNknNayoseInfo(nNknCD, nOyaCD, NAYOSE_CHILD, MODE_EDIT, True) = FALSE) then
                    Abort;

      			// 名寄せ親代替ｺｰﾄﾞが登録されているかCheck
                // 請求情報の更新(子・代替)
       			if lvDaigae then
                begin                                       // 請求情報の更新(一括請求)
                    if (fnUpDateMTokui_SelInfo(nNknCD, nOyaCD,  2, 1, False, True) = FALSE) then
                        Abort;

                    if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1, False, True) = FALSE) then
                        Abort;
                end
                else
                begin                                       // 請求情報の更新(各店別請求)
                    if (fnUpDateMTokui_SelInfo(nNknCD, nOyaCD, 12, 2, False, True) = FALSE) then
                        Abort;
                end;


//<Rel>↓
                // 和暦西暦区分・代表社名の印字変更時<101>
                //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc6);
            	//m_cDataModule.BeginTran(m_cDBSelect);
                m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, StdProc6);
            	m_cDataModule.BeginTran(m_cDBSelect_Rel);
//<Rel>

                // PRC_MA0130_106
                with StdProc6 do
                begin
					BeginExecProc(StdProc6, False);
					try
                    ParamByName('@pTRNCD').AsFloat := nOyaCD;
                    ExecProc;
                    finally
                    EndExecProc(StdProc6);
                    end;
                    Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
                end;

                // ERROR
                if not Bol then
                begin
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					//m_cDataModule.Rollback(m_cDBSelect);   <Rel>
					m_cDataModule.Rollback(m_cDBSelect_Rel);
                    Exit;
                end;
                //m_cDataModule.Commit(m_cDBSelect);   <Rel>
            	m_cDataModule.Commit(m_cDBSelect_Rel);
			end;
		end;
	end;

    //=======================================================
    // 親子ﾌﾗｸﾞ変更 <115>
    //=======================================================
    // 変更前の親得意先内部ｺｰﾄﾞを取得
    nOyaNCode := fnGetNCODE(m_AfterSave.sOyaCD, 22, m_TrCodeAttr);

//<Rel>↓
    //cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc5);
    //cDataModule.BeginTran(m_cDBSelect);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, StdProc5);
    m_cDataModule.BeginTran(m_cDBSelect_Rel);
//<Rel>↑

    // PRC_MA0130_104
    with StdProc5 do
    begin
		BeginExecProc(StdProc5, False);
		try
        ParamByName('@pTRNCD')    .AsFloat := nNknCD;
        ParamByName('@pOLDSEINCD').AsFloat := nOyaNCode;
        ExecProc;
        finally
        EndExecProc(StdProc5);
        end;
        Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
    end;

    if not Bol then
    begin
        // ﾛｰﾙﾊﾞｯｸ(破棄)
        //m_cDataModule.Rollback(m_cDBSelect); //<Rel>
        m_cDataModule.Rollback(m_cDBSelect_Rel); //<Rel>
        Exit;
    end;

    //m_cDataModule.Commit(m_cDBSelect); <Rel>
    m_cDataModule.Commit(m_cDBSelect_Rel);   //<Rel>

    SKYKBN2.Value       := 0;
    SKYKBNNM2.Caption	:= '';
    NayoseOyaCode2.text := '';
    NayoseNM2.Caption   := '';

	// -----<155> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<155> Add-Ed-----
end;

//-----------------------------------------------------------------------------
// MakeNayoseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ作成処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.MakeNayoseInfo(sOyaCD: String; sNknCD: String;
	nOyaCD: Extended; nNknCD: Extended);
begin

    // 入力値ﾁｪｯｸ、親得意先の実績ﾏｽﾀ作成
	if (fnRecordCheck(True) = FALSE) then
        Abort;

    // ---------------------------
    //  新規登録時
    // ---------------------------

	// 名寄せ親得意先ｺｰﾄﾞが存在するかCheck
	if (fnCheckNknNayoseInfo(sOyaCD, NAYOSE_PARENT) = FALSE) then
    begin
        // 名寄せ親が存在しない時、名寄せ親情報追加
        if (fnUpDateNknNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, False) = FALSE) then
            Abort;

        // 請求情報の更新(一括請求)
        if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, False, False) = FALSE) then
            Abort;
	end;

    // 名寄せ情報を追加
    if (fnUpDateNknNayoseInfo(nNknCD, nOyaCD, NAYOSE_CHILD, MODE_INSERT, False) = FALSE) then
        Abort;
end;

//-----------------------------------------------------------------------------
// fnCheckNknNayoseInfo()
//      PARAM   : CD    名寄せ外部ｺｰﾄﾞ
//                KBN   名寄せ区分(1:子 2:親)
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnCheckNknNayoseInfo(CD: String; KBN: Integer): Boolean;
var
    DmqData : TMQuery;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>


begin

    // 外部ｺｰﾄﾞを前0ありにする(DB用)
	if (m_TRCodeAttr <= 1) then
		CD := Format ('%.16d',[StrToInt64(Trim(CD))]);

	Result := FALSE;


//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//↑<Rel>

    // MQueryの構築
    DmqData := TMQuery.Create(Self);
    //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, DmqData);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, DmqData);  

    try
    	with (DmqData) do
    	begin
    		Close;
    		SQL.Clear;
    		SQL.Add('select MT.GCode                        '
                +   'from CrdNayoseInfo PI                  '
                +   'left outer join MTOKUI MT              '
                +   ' on (MT.NCode   = PI.NknNCode)         '
                +   '     and (MT.RDelKbn = 0)              '
    		    +   'where (MasterKbn = 22)                 '
                +   '  and (NayoseSyu = 1)                  '
                +   '  and (GCode     = :CD)                '
                +   '  and (NayoseKbn = :KBN)               ');

    		ParamByName('CD' ).AsString	 := CD;					// 名寄せ親入金先ｺｰﾄﾞ
    		ParamByName('KBN').AsInteger := KBN;				// 名寄せ区分

    		if ( not Open () ) then
    		begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
                m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                DmqData.Close();
                DmqData.Free();

    			Result := FALSE;
    			Exit;
    		end;

    		if ( EOF <> TRUE ) then
    			Result := TRUE;
    	end;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

end;
//-----------------------------------------------------------------------------
// fnCheckDaigae()
//      PARAM   : CD    名寄せ親外部ｺｰﾄﾞ
//                DaeCD 名寄せ親代替外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnCheckDaigae(CD: String; var DainCD:Extended): Boolean;
var
    DmqData : TMQuery;

begin

    // 初期設定
	Result := FALSE;
    DainCD := 0;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add('select CngNCode from MTOKUI_CRD where (BaseNCode = :CD)');

			// 名寄せ親入金先ｺｰﾄﾞ
    		ParamByName('CD').AsFloat := fnGetNCODE(CD, 22, m_TrCodeAttr);

            Open;

    		if not EOF then
    		begin
                DaiNCD := FieldByName('CngNCode').asFloat;

                // 代替得意先の存在ﾁｪｯｸ <111>
                if DaiNCD = 0 then
           			Result := FALSE                         // 代替得意先の設定なし
                else
           			Result := TRUE;                         // 代替得意先の設定あり
    		end;
    	end;
    finally
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnUpDateNknNayoseInfo()
//      PARAM   : NknNCD    名寄せ子内部ｺｰﾄﾞ
//                OyaNCD    名寄せ親内部ｺｰﾄﾞ
//                KBN       名寄せ区分(1:子 2:親)
//                MODE
//      VAR     :
//      RETURN  : T : 正常終了 F:異常終了
//      MEMO    : 名寄せ更新処理
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnUpDateNknNayoseInfo(NknNCD,OyaNCD:Extended; KBN,MODE: Integer;
	TranMode: Boolean): Boolean;
var
    DmqData 		: TMQuery;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>
begin

//↓<Rel>

	    //DmqData := TMQuery.Create( Self );
    	//m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

	    // -------------------------------------------------------------------------
    	//  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    	//  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    	// -------------------------------------------------------------------------

    	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    		m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    	else
        	m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//↑<Rel>

    // MQueryの構築
    DmqData := TMQuery.Create(Self);
    //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, DmqData);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, DmqData);



    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	    if TranMode then
			//m_cDataModule.BeginTran( m_cDBSelect);
			m_cDataModule.BeginTran( m_cDBSelect_Rel);

		with ( DmqData ) do
		begin
        	// ----------
			//  新規
        	// ----------
			if ( MODE = MODE_INSERT ) then
			begin
				Close();
				SQL.Clear();
				SQL.Add('insert into CrdNayoseInfo (    '
                	+   '    MasterKbn                  '
                	+   '   ,NayoseSyu                  '
                	+   '   ,NknNCode                   '
                	+   '   ,NayoseKbn                  '
                	+   '   ,NayoseOyaNCode             '
                	+   '   ,UpdTantoNCode              '
                	+   ') values (                     '
                	+   '    22                         '
                	+   '   ,1                          '
                	+   '   ,:PNC                       '
                	+   '   ,:NK                        ');

				if ( KBN = NAYOSE_CHILD ) then
					    SQL.Add('   ,:NO   ')
				else    SQL.Add('   ,0     ');
					SQL.Add('   ,:UPDTANTO   )  ');
			end
        	// ----------
        	//  更新
        	// ----------
			else
			begin
				Close();
				SQL.Clear();
				SQL.Add('update CrdNayoseInfo SET   '
                	+   '       NayoseOyaNCode = :NO '
                	+   '      ,UpdTantoNCode  = :UPDTANTO '
			    	+   'where (MasterKbn = 22)     '
                	+   '  and (NknNCode  = :PNC)   '
                	+   '  and (NayoseKbn = :NK)    '
                	+   '  and (NayoseSyu = 1)      ');
			end;

        	// 入金先ｺｰﾄﾞ
			ParamByName('PNC')  .AsFloat    :=  NknNCD;
        	// 名寄せ区分
			ParamByName('NK')   .AsInteger  :=  KBN;

			if ( KBN = NAYOSE_CHILD ) then
            	// 名寄せ親入金先ｺｰﾄﾞ
				ParamByName('NO').AsFloat := OyaNCD;

        	//
				ParamByName('UPDTANTO').AsFloat := m_TantoNCode;

			if ( not ExecSQL() ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            	m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);
            	// ﾛｰﾙﾊﾞｯｸ(破棄)
            	if TranMode then
                begin
					//m_cDataModule.Rollback(m_cDBSelect);  //<Rel>
					m_cDataModule.Rollback(m_cDBSelect_Rel);
                end;
            	DmqData.Close();
            	DmqData.Free();

				Result := FALSE;
				Exit;
			end;
		end;

       // 親会社のCrdNayoseInfo_Relを更新
       with ( DmqData ) do
       begin
       		Close();
       		SQL.Clear();
       		SQL.Add('update CrdNayoseInfo_Rel            ');
       		SQL.Add('set RDelKbn_Rel = 0,                ');
       		SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
       		SQL.Add('where MasterKbn   = 22        ');
       		SQL.Add(' and  NayoseSyu   = 1     ');
       		SQL.Add(' and  NknNCode  = :GC      ');
       		SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

	   		// 入金先ｺｰﾄﾞ
	   		ParamByName('GC').AsFloat   := NknNCD;
       		ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

       		if ( ExecSQL = False ) then
       		begin
       	   		m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
           		m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

           		Result := False;
           		Exit;
       		end;
       end;

    // ｺﾐｯﾄ(反映)
    if (TranMode)  then
		//m_cDataModule.Commit (m_cDBSelect);
		m_cDataModule.Commit (m_cDBSelect_Rel);


//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
   		begin
   		// 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
	   		if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_CRD) = false ) or
               ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) or
               //CRDNayoseInfo
               ( m_SyncMaster.fnCall_SYNC(71,JNTSYNC_DELETE)  = false ) or
      		   ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = false ) then
        	begin
            	Result := false;
            	Exit;
        	end;

        		// 更新されたときはSecHojyoDispInfoのメンテを行う。
        	if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,NknNCD,DmqData) then
        	begin
            	Result := false;
            	Exit;
        	end;
    	end;
//↑<Rel>

    DmqData.Close();
    DmqData.Free();

    // 正常終了
	Result := TRUE;

end;

//-----------------------------------------------------------------------------
// fnUpDateMTokui_SelInfo()
//      PARAM   : NknNCD        入金先内部ｺｰﾄﾞ
//                SeiNCD        請求先内部ｺｰﾄﾞ
//                OyakokFlg     親子ﾌﾗｸﾞ
//      VAR     :
//      RETURN  : Integer
//      MEMO    : Mtokui_Selへ請求先情報を書き込む
//-----------------------------------------------------------------------------
function  TJNTCRP004003F.fnUpDateMTokui_SelInfo(NknNCD, SeiNCD: Extended; OyakoFlg, UsKin: Integer;
	aGoukei: Boolean; TranMode: Boolean): Boolean;
var
    DmqData : TMQuery;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>


begin

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社

//↑<Rel>

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    //m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData ); <Rel>
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData ); //<Rel>

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
    if TranMode then
		//m_cDataModule.BeginTran (m_cDBSelect);  <Rel>
		m_cDataModule.BeginTran (m_cDBSelect_Rel); //<Rel>


	with ( DmqData ) do
	begin
        Close();
        SQL.Clear();
        SQL.Add('update MTOKUI_SEL set          '
            +   '    OyakoFlg   =   :nOyakoFlg  ');

		if not aGoukei then
	        SQL.Add('   ,UsKinKbn   =   :nUsKinKbn  ');

        SQL.Add('   ,SeiNCode   =   :nSeiNCode  '
            +   'where (BaseNCode = :nNCode)    '
            +   '  and (RecKbn = 1)    ');

        ParamByName('nOyakoFlg').AsInteger := OyakoFlg;
		if not aGoukei then
	        ParamByName('nUsKinKbn').AsInteger := UsKin;
        ParamByName('nSeiNCode').AsFloat   := SeiNCD;
        ParamByName('nNCode')   .AsFloat   := NknNCD;

        if ( not ExecSQL() ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB(m_cErrorMsgRec, DmqData);
            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            // ﾛｰﾙﾊﾞｯｸ(破棄)
		    if TranMode then
				//m_cDataModule.Rollback(m_cDBSelect);  <Rel>
				m_cDataModule.Rollback(m_cDBSelect_Rel); //<Rel>

            DmqData.Close();
            DmqData.Free();
			Result := FALSE;
			Exit;
		end;
	end;

    // ｺﾐｯﾄ(反映)
    if TranMode then
		//m_cDataModule.Commit(m_cDBSelect); //<Rel>
   		m_cDataModule.Commit(m_cDBSelect_Rel);  //<Rel>

    DmqData.Close();
    DmqData.Free();

    // 正常終了
	Result := TRUE;
end;

//-----------------------------------------------------------------------------
// GridNayoseBeforeChangeColumn()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node
//                Column
//                NewNode
//                TdxTreeListNode
//                NewColum
//      VAR     : CanChange
//      RETURN  :
//      MEMO    : ｶﾗﾑ移動前処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.GridNayoseBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
    sNknCD		: String;
    sName		: String;
	strFormat	: String;
    sNknNCode   : Extended;
    sUsKinKbn	: Integer;
    sCngNCode	: Extended;
    sNDGCode	: String;
    sNDNAME		: String;
    osNknCD		: String;
begin

    // 名寄せﾀﾌﾞにﾌｫｰｶｽがない場合は終了<136>
    if ( HedCsTab.Items.Selected <> 2 ) then Exit;

    if NewColumn in [1,3] then
	begin
       	CanChange :=  FALSE;
		Exit;
	end;

	case Column of
        // -----------------------------------
        // 名寄せ親入金先ｺｰﾄﾞ
        // -----------------------------------
		0:  begin
			    sNknCD := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('OyaHojCD').AsString;	// 名寄せ親入金先ｺｰﾄﾞ
                osNknCD := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('OyaHojCD').AsString;
				//上段コピー
			    if ( sNknCD = '' ) and ( uvSvOyaHojCD <> '' ) then
			    begin
				    with TdxDBGrid(Sender).DataSource.DataSet do
                    begin
                    	Edit;
						FieldByName('OyaHojCD').AsString := uvSvOyaHojCD;
                        sNknCD := uvSvOyaHojCD;
                    end;
			    end;

			    if ( sNknCD = '' ) then
			    begin
				    CanChange := FALSE;
				    Exit;
			    end
                else
    			begin
	    			// 名寄せ親入金先ｺｰﾄﾞの存在Check
		    		if ( fnNknCodeCheck(sNknCD,sName,sNknNCode,DISPOSE_NAYOSEOYA,
                         sUsKinKbn, sCngNCode, sNDGCode, sNDNAME) = FALSE ) then
    				begin
	    				CanChange := FALSE;
		    			Abort;
    				end
                   //<172>  //入力時にチェックしてここでのチェックは不要とした。
                   {
                   //<143> 販売伝票の存在チェック。名寄せ親が変更されたら名寄せ子の伝票発生有無をチェック
                    else
                    if 	(GridNayose.DataSource.DataSet.State in [dsEdit]) then
                    begin
                    	if m_AfterSave.sOyaCD <> GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString  then
                    	begin
                    		if fnDenChk(CASE_CODEINPUT) = False then
                    		begin
                        		CanChange := FALSE;
                            	Abort;
                    		end;
                    	end;
                    end
                   //<143>
                   }
    				else
    				begin
    					MemNayose.Edit;
    					MemNayose.FieldByName('OyaNCode').AsFloat := sNknNCode;
    					MemNayose.FieldByName('OyaName').AsString := sName;			// 名寄せ親入金先名称
    					if ( m_TRCodeAttr <= 1 ) then
    						sNknCD := Format ('%.16d',[StrToInt64(Trim(sNknCD))]);
    					MemNayose.FieldByName('OyaBaseHojCD').AsString := sNknCD;	// 名寄せ親入金先ｺｰﾄﾞ(編集前)
    					// 数値(前0あり)
    					if ( m_TRCodeAttr = 1 ) then
    					begin
    						strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
    						sNknCD    := Format(strFormat,[StrToInt64(Trim(sNknCD))]);
      						MemNayose.FieldByName('OyaHojCD').AsString := sNknCD;	// 名寄せ親入金先ｺｰﾄﾞ(前0あり)
    					end;
                        MemNayose.FieldByName('UsKinKbn'    ).AsInteger := sUsKinKbn;       // 請求区分
                        MemNayose.FieldByName('CngNCode'    ).AsFloat   := sCngNCode;       // 請求区分
                        MemNayose.FieldByName('NDCode'      ).AsString  := sNDGCode;	 	 //
                        MemNayose.FieldByName('NDName'      ).AsString  := sNDNAME;	 	 //

                        SKYKBN2.Value       := sUsKinKbn;
                        SKYKBNNM2.Caption	:= fnGetSkyKbnNm(SKYKBN2.Text);

                        if (m_TRCodeAttr <> 2) and (sNDGCode = ucZeroCODE ) then
                        begin
                            NayoseOyaCode2.Zero := TRUE;
                            NayoseOyaCode2.InputFlag := FALSE;
                        end;
                        NayoseOyaCode2.text := sNDGCode;
                        NayoseNM2.Caption   := sNDNAME;
    				end;
    			end;
    		end;
        // -----------------------------------
        //  入金先ｺｰﾄﾞ
        // -----------------------------------
		2:  begin
			    sNknCD := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('HojCode').AsString;	// 入金先ｺｰﾄﾞ
			    if ( sNknCD <> '' ) then
			    begin
				    if not ( MemNayose.State in [dsInsert] ) then Exit;

				    // 入金先ｺｰﾄﾞの存在Check
				    if ( fnNknCodeCheck(sNknCD,sName,sNknNCode,DISPOSE_REAL,
                         sUsKinKbn, sCngNCode, sNDGCode, sNDNAME) = FALSE ) then
				    begin
    					CanChange := FALSE;
	    				Abort;
    				end
	    			else
		    		begin
			    		// 名寄せ子の存在Check
				    	if ( fnCheckNknNayoseInfo(sNknCD,NAYOSE_CHILD) = TRUE ) then
    					begin
                       		MjsMessageBox(Self, '他の名寄せ設定で登録済です。', mjInformation, mjDefOk);
    						CanChange := FALSE;
	    					Abort;
    					end
    					else
    					begin
    						MemNayose.Edit;
    						MemNayose.FieldByName('NknNCode').AsFloat   := sNknNCode;
    						MemNayose.FieldByName('SName').AsString     := sName;		// 入金先名称
    						if ( m_TRCodeAttr <= 1 ) then
    							sNknCD := Format ('%.16d',[StrToInt64(Trim(sNknCD))]);
    						MemNayose.FieldByName('BaseHojCode').AsString := sNknCD;	// 入金先ｺｰﾄﾞ(編集前)
    						// 数値(前0あり)
    						if ( m_TRCodeAttr = 1 ) then
    						begin
    							strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
    							sNknCD    := Format(strFormat,[StrToInt64(Trim(sNknCD))]);
    							MemNayose.FieldByName('HojCode').AsString := sNknCD;	// 入金先ｺｰﾄﾞ(前0あり)
    						end;
    					end;
    				end;
    			end;
    		end;
	end;

end;

//-----------------------------------------------------------------------------
// GridNayoseChangeColumn()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node
//                Column
//
//      VAR     :
//      RETURN  :
//      MEMO    : ｶﾗﾑ移動後処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.GridNayoseChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin

    CmnStatusBar.SimpleText	:= '';

end;

//-----------------------------------------------------------------------------
// GridNayoseChangeNodeEx()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾉｰﾄﾞ移動前処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.GridNayoseChangeNodeEx(Sender: TObject);
var
	lvCODE : String;
begin

	m_AfterSave.sOyaCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;

    SKYKBN2.Value       := GridNayose.DataSource.DataSet.FieldByName('UsKinKbn').AsInteger;
    SKYKBNNM2.Caption	:= fnGetSkyKbnNm(SKYKBN2.Text);

    lvCODE := GridNayose.DataSource.DataSet.FieldByName('NDCode'  ).AsString;
    if (m_TRCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then
    begin
        NayoseOyaCode2.Zero := TRUE;
        NayoseOyaCode2.InputFlag := FALSE;
    end;
    NayoseOyaCode2.text := lvCODE;
    NayoseNM2.Caption   := GridNayose.DataSource.DataSet.FieldByName('NDName'  ).AsString;

    if (GridNayose.DataSource.DataSet.FieldByName('CngNCode').AsCurrency <> 0) and
       (GridNayose.DataSource.DataSet.FieldByName('NknNCode').AsCurrency =
        GridNayose.DataSource.DataSet.FieldByName('CngNCode').AsCurrency) then
    begin
    	GridNayoseOyaCode.DisableEditor := True;
    	GridNayoseOyaCode.ReadOnly      := True;
    	GridNayoseCode.DisableEditor    := True;
    	GridNayoseCode.ReadOnly         := True;
    end
    else
    begin
    	GridNayoseOyaCode.DisableEditor := False;
    	GridNayoseOyaCode.ReadOnly      := False;
        //子得意先は更新データでは変更不可
        if ( MemNayose.State in [dsInsert] ) then
        begin
            GridNayoseCode.DisableEditor    := False;
            GridNayoseCode.ReadOnly         := False;
        end
        else
        begin
            GridNayoseCode.DisableEditor    := True;
            GridNayoseCode.ReadOnly         := True;
        end;
    end;
    if ( m_AfterSave.sOyaCD = '' ) and (GridNayose.FocusedColumn = 2) then
        GridNayose.FocusedColumn := 0;
end;

//-----------------------------------------------------------------------------
// CmnGridKeyDown()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.CmnGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    //  ↑ｶｰｿﾙ or PageUp
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then
	begin
		if ( TdxDBGrid(Sender).DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	//	INSERTを押しても挿入不可にしている
	if ( Key = VK_INSERT ) then
		Abort;

end;

//<187> ADD St
//-----------------------------------------------------------------------------
// DGridDensai1Enter
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DGridDensai1BeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
    sUserID, sKanaName, sBankCode, sBranchCode, sAccKbn, sAccNo: String;

	function GetVarToStr(aIndex: Integer): String;
	begin
		if Node.Values[aIndex] = Null then
			Result := ''
		else
	        Result := String(Node.Values[aIndex]);
    end;
begin
    with DGridDensai1.DataSource.DataSet do
    begin
		if m_OnExitDGridDensai1 then Exit;

		//変更がない場合は何もしない
		if Assigned(Node) and
           Assigned(NewNode) and
           (Node.AbsoluteIndex = NewNode.AbsoluteIndex) and
           (Column = NewColumn) then Exit;

        sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
        sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
        sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index);
        sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index);
        sAccKbn		:= GetVarToStr(DGridDensai1AccKbn.Index);
        sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index);

        if (Column = DGridDensai1UserID.Index) then			//利用者番号
        begin
            //利用者番号の入力チェック
            if sUserID = '' then
            begin
                MjsMessageBox(Self, '利用者番号を入力してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end;
        end
		else
        if (Column = DGridDensai1KanaName.Index) then		//カナ名称
        begin
            //カナ名称の入力チェック
            if sKanaName = '' then
            begin
                MjsMessageBox(Self, 'カナ名称を入力してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end
			else
            if JNTSelXKanjiCheck(sKanaName) then
            begin
                MjsSetFocus(Self, 'DGridDensai1');
                uvSelSys.MsgDlg(1010,20);		//入力値に漢字もしくは特殊文字が含まれています。
                Abort;
            end;
        end
		else
        if (Column = DGridDensai1BankCode.Index) then		//銀行コード
        begin
            //銀行コードの入力チェック
            if sBankCode = '' then
            begin
                MjsMessageBox(Self, '銀行コードを入力してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end;
        end
		else
        if (Column = DGridDensai1BranchCode.Index) then		//支店コード
        begin
            //支店コードの入力チェック
            if sBranchCode = '' then
            begin
                MjsMessageBox(Self, '支店コードを入力してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end;
        end
		else
        if (Column = DGridDensai1AccKbn.Index) then			//預金種目
        begin
            //預金種目の入力チェック
            if sAccKbn = '' then
            begin
                MjsMessageBox(Self, '預金種目を選択してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end
			else
            if TAccountCustomerInfo.GetAccName(StrToIntDef(sAccKbn, -1)) = '' then
            begin
                MjsMessageBox(Self, '預金種目が正しくありません。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end;
        end
		else
        if (Column = DGridDensai1AccNo.Index) then			//口座番号
        begin
            //口座番号の入力チェック
            if sAccNo = '' then
            begin
                MjsMessageBox(Self, '口座番号を入力してください。', mjInformation, mjDefOk);
                MjsSetFocus(Self, 'DGridDensai1');
                Abort;
            end;
        end;
    end;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// DGridDensai1Enter
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DGridDensai1Enter(Sender: TObject);
begin
	with Sender as TDxDBGrid do
	begin
        FocusedColumn := DGridDensai1UserID.Index;	//利用者番号
    end;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// DGridDensai1Exit
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DGridDensai1Exit(Sender: TObject);
begin
	try
        with DGridDensai1 do
        begin
            if DataSource.DataSet.State in [dsInsert, dsEdit] then
            begin
				m_OnExitDGridDensai1 := True;

                if State = tsEditing then CloseEditor;

                DataSource.DataSet.Post;
            end;
        end;
    finally
		m_OnExitDGridDensai1 := False;
    end;
 end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// DGridDensai1KeyPress
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DGridDensai1KeyPress(Sender: TObject; var Key: Char);
var
	nFocusedColumn : Integer;
begin
	with Sender as TDxDBGrid do
	begin
        nFocusedColumn := FocusedColumn;

        //入力不可文字の制御
        if (nFocusedColumn = DGridDensai1UserID.Index) or		//利用者番号
           (nFocusedColumn = DGridDensai1KanaName.Index) then	//カナ名称
		begin
            case Key of
				Chr(VK_BACK),
				'0'..'9',
				'A'..'Z',
				'ｱ'..'ﾝ',
				'ｦ', 'ﾞ', 'ﾟ', '｢', '｣', '\', '/', ',', '.', '-', '(', ')', '*':
                begin
					//入力可能文字
                end;
				//以下の入力不可文字は入力可能文字に変換
                'ｧ': Key := 'ｱ';
                'ｨ': Key := 'ｲ';
                'ｩ': Key := 'ｳ';
                'ｪ': Key := 'ｴ';
                'ｫ': Key := 'ｵ';
                'ｬ': Key := 'ﾔ';
                'ｭ': Key := 'ﾕ';
                'ｮ': Key := 'ﾖ';
                'ｯ': Key := 'ﾂ';
                '{': Key := '(';
                '[': Key := '(';
                '}': Key := ')';
                ']': Key := ')';
                'ｰ': Key := '-';
                '､': Key := ',';
                '｡': Key := '.';
                ' ': Key := ' ';
                'a'..'z': Key := Chr(Ord(Key) - 32);
				//上記以外は入力不可文字
                else
                begin
                    Key := Char(Nil);
                end;
            end;
        end;
    end;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// DGridDensai1MouseDown
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DGridDensai1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	nFocusedColumn : Integer;
begin
	with Sender as TDxDBGrid do
	begin
        nFocusedColumn := FocusedColumn;

        //入力不可カラムの場合は直前の入力可能カラムを選択する
        if nFocusedColumn = DGridDensai1AccKbnName.Index then	//預金種目名称
		begin
	        FocusedColumn := DGridDensai1AccKbn.Index;		//預金種目
            Exit;
        end;
    end;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// DMemDensai1BeforePost
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DMemDensai1BeforePost(DataSet: TDataSet);
var
    oUserID, oKanaName, oBankCode, oBranchCode, oAccKbn, oAccNo: TField;
	bFindFlg: Boolean;
	iAbsoluteIndex, iIndex: Integer;
	oNode: TdxTreeListNode;
    sUserID, sKanaName, sBankCode, sBranchCode, sAccKbn, sAccNo: String;

	function GetVarToStr(aIndex: Integer): String;
	begin
		if oNode.Values[aIndex] = Null then
			Result := ''
		else
	        Result := String(oNode.Values[aIndex]);
    end;
begin
    with DataSet do
    begin
		iAbsoluteIndex	:= DGridDensai1.FocusedNode.AbsoluteIndex;
        oUserID			:= FieldByName('UserID');
        oKanaName		:= FieldByName('KanaName');
        oBankCode		:= FieldByName('BankCode');
        oBranchCode		:= FieldByName('BranchCode');
        oAccKbn			:= FieldByName('AccKbn');
        oAccNo			:= FieldByName('AccNo');

		//利用者番号の入力チェック
        if oUserID.AsString = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '利用者番号を入力してください。', mjInformation, mjDefOk);
            oUserID.FocusControl;
            Abort;
        end;

		//カナ名称の入力チェック
        if oKanaName.AsString = '' then
        begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, 'カナ名称を入力してください。', mjInformation, mjDefOk);
            oKanaName.FocusControl;
            Abort;
        end
        else
        if JNTSelXKanjiCheck(oKanaName.AsString) then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            uvSelSys.MsgDlg(1010,20);		//入力値に漢字もしくは特殊文字が含まれています。
            oKanaName.FocusControl;
            Abort;
        end;

		//銀行コードの入力チェック
        if oBankCode.AsString = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '銀行コードを入力してください。', mjInformation, mjDefOk);
            oBankCode.FocusControl;
            Abort;
        end;

		//支店コードの入力チェック
        if oBranchCode.AsString = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '支店コードを入力してください。', mjInformation, mjDefOk);
            oBranchCode.FocusControl;
            Abort;
        end;

		//預金種目の入力チェック
        if oAccKbn.AsString = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '預金種目が正しくありません。', mjInformation, mjDefOk);
            oAccKbn.FocusControl;
            Abort;
        end
		else
        if TAccountCustomerInfo.GetAccName(StrToIntDef(oAccKbn.AsString, -1)) = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '預金種目を入力してください。', mjInformation, mjDefOk);
            oAccKbn.FocusControl;
            Abort;
        end;

		//口座番号の入力チェック
        if oAccNo.AsString = '' then
		begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '口座番号を入力してください。', mjInformation, mjDefOk);
            oAccNo.FocusControl;
            Abort;
        end;

		//同一データの存在チェック
		bFindFlg := False;

		for iIndex := 0 to (DGridDensai1.Count - 1) do
		begin
        	oNode 		:= DGridDensai1.Items[iIndex];
            sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
            sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
            sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index);
            sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index);
            sAccKbn		:= GetVarToStr(DGridDensai1AccKbn.Index);
            sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index);

            if (iAbsoluteIndex <> iIndex) and
               (oUserID.AsString = sUserID) and
               (oKanaName.AsString = sKanaName) and
               (oBankCode.AsString = sBankCode) and
               (oBranchCode.AsString = sBranchCode) and
               (oAccKbn.AsString = sAccKbn) and
               (oAccNo.AsString = sAccNo) then
			begin
				bFindFlg := True;
				Break;
            end;
        end;

		if bFindFlg then
        begin
            DtlCsTab.Items.Selected :=  DTLTAB_DENSHI;
            MNDenDataKbn.Value := DENKBN_DENSAI;
            CustomSetFocus([DGridDensai1]);
            MjsMessageBox(Self, '同一のでんさいネット取引先情報が登録済みです。', mjInformation, mjDefOk);
            oUserID.FocusControl;
            Abort;
        end;
    end;
end;
//<187> ADD Ed

//-----------------------------------------------------------------------------
// DSNayoseStateChange()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 状態変更時処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DSNayoseStateChange(Sender: TObject);
begin

    if ( MemNayose.State in [dsInsert] ) then
		MemNayoseHojCode.ReadOnly := FALSE
	else
		MemNayoseHojCode.ReadOnly := TRUE;

	if ( MemNayose.Active ) then
	begin
		if ( MemNayose.RecordCount = 0 ) then
			MemNayoseHojCode.ReadOnly := FALSE;
	end;

end;

//-----------------------------------------------------------------------------
// fnNknCodeCheck()
//      PARAM   : sHojCode  入金先外部ｺｰﾄﾞ
//      VAR     : sRet      入金先名称
//                sNknNCD   入金先内部ｺｰﾄﾞ
//                Mode      実在/合計/名寄せ 区分
//      RETURN  : TRUE : 存在する FALSE : 存在しない
//      MEMO    : 入金先ｺｰﾄﾞの存在Check
//-----------------------------------------------------------------------------
function  TJNTCRP004003F.fnNknCodeCheck(sHojCode: String; var sRet: String;
	var sNknNCD: Extended; Mode: Integer; var sUsKinKbn: Integer; var sCngNCode: Extended;
    var sNDGCode: String; var sNDNAME: String): Boolean;
var
    DmqData :   TMQuery;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>
begin

	sRet    :=  '';

	if ( Trim(sHojCode) = '' ) then
	begin
		Result := FALSE;
		Exit;
	end;

	if (m_TRCodeAttr <= 1) then
		sHojCode := Format ('%.16d',[StrToInt64(Trim(sHojCode))]);



//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社


    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続


    //Gridでの得意先コード存在チェックは常に自社で行う
    m_ACControl :=  Screen.ActiveControl;
    if  m_ACControl = GridNayose then
    begin
		m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
    end else
    begin
    	m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );
    end;
//↑<Rel>

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add('SELECT                 '
                +   '    MT.NCode              '
                +   '   ,MT.GCode              '
                +   '   ,MT.NMK                '
                +   '   ,MTS.UsKinKbn          '
                +   '   ,MTC.CngNCode          '
                +   '   ,MTN.GCode as NDGCode  '   // 名寄せ取引先外部ｺｰﾄﾞ
                +   '   ,MTN.NMK   as NDNAME   '   // 名寄せ取引先名称
                +   'FROM MTOKUI as MT         '
                +   'LEFT OUTER JOIN MTOKUI_SEL MTS   '
                +   '   ON (MTS.BaseNCode = MT.NCode and MTS.RecKBN = 1) '
                +   'LEFT OUTER JOIN MTOKUI_CRD MTC   '
                +   '   ON (MTC.BaseNCode = MT.NCode) '
                +   'LEFT OUTER join MTOKUI MTN       '
                +   '   on (MTC.CngNCode = MTN.NCode) '
    		    +   'WHERE (MT.RDelKbn = 0   ) '
                +   '  AND (MT.GCode   = :HC ) '
                +   '  AND (MT.SumKbn <> 9   ) ');

    		case Mode of
                // 合計/実在
    			DISPOSE_ALL
                    :   SQL.Add('  AND ((MT.SumKbn = 0 and MT.HojyoKbn1 = 1) or MT.SumKbn = 1) ');
                // 実在
    			DISPOSE_REAL
                    :   SQL.Add('  AND (MT.SumKbn = 0 and MT.HojyoKbn1 = 1) ');
                // 名寄せ親
    			DISPOSE_NAYOSEOYA
                    :   SQL.Add('  AND MT.SumKbn = 1 AND MT.NYKRootKbn = 1 ');
    		end;

    		ParamByName('HC').AsString	:= sHojCode;

    		Open ();

    		if ( EOF <> TRUE ) then
    		begin
    			sRet    :=  FieldByName('NMK').AsString;
                sNknNCD :=  FieldByName('NCODE').AsFloat;
    			sUsKinKbn:= FieldByName('UsKinKbn').AsInteger;
    			sCngNCode:= FieldByName('CngNCode').AsFloat;
                sNDGCode:=  FieldByName('NDGCode').AsString;
    			sNDNAME :=  FieldByName('NDNAME').AsString;
    			Result  :=  TRUE;
    		end
    		else
    			Result := FALSE;
            Close;
        end;
    finally
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnDeleteNknNayoseInfo()
//      PARAM   : NknNCD    入金先内部ｺｰﾄﾞ
//      VAR     : OyaNCD    名寄せ親内部ｺｰﾄﾞ
//                Mode      実在/合計/名寄せ 区分
//      RETURN  : TRUE : 正常 FALSE : 異常
//      MEMO    : 名寄せ削除処理
//-----------------------------------------------------------------------------
function  TJNTCRP004003F.fnDeleteNknNayoseInfo(NknNCD,OyaNCD:Extended; MODE: Integer): Boolean;
var
	nNayoKbn    : Integer;
    DmqData     : TMQuery;
    //PDmqData     : TMQuery; //<Rel>
    sCNT        : Integer;
    nUsKinKbn	: Integer;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>


begin

    // 初期化
    nNayoKbn := 0;

    // 選択ﾚｺｰﾄﾞの削除が可能かﾁｪｯｸ


	case MODE of
		NAYOSE_CHILD    :   nNayoKbn := 1;
		NAYOSE_PARENT   :   nNayoKbn := 2;
		NAYOSE_ALL      :   nNayoKbn := 1;
	end;


//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//↑<Rel>


    // MQueryの構築
    DmqData     :=  TMQuery.Create( Self );
    // DBとMQueryの接続
    //m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );  <Rel>
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	//m_cDataModule.BeginTran (m_cDBSelect); <Rel>
	m_cDataModule.BeginTran (m_cDBSelect_Rel);

	// -----<155> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<155> Add-Ed-----

	with ( DmqData ) do
	begin

        // 選択ﾚｺｰﾄﾞを削除
		Close();
		SQL.Clear();
		SQL.Add('delete from CrdNayoseInfo      '
		    +   'where (MasterKbn = 22)         '
            +   '  and (NayoseSyu = 1)          '
            +   '  and (NayoseKbn = :NK)        '
			+   '  and (NknNCode  = :GC)        '
			+   '  and (NayoseOyaNCode = :NO)   ');

        // 名寄せ区分
		ParamByName('NK').AsInteger := nNayoKbn;
        // 入金先ｺｰﾄﾞ
        ParamByName('GC').AsFloat   := NknNCD;
        // 名寄せ親入金先ｺｰﾄﾞ
        ParamByName('NO').AsFloat   := OyaNCD;

		if ( not ExecSQL() ) then
		begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            // ﾛｰﾙﾊﾞｯｸ(破棄)
			//m_cDataModule.Rollback(m_cDBSelect);   //<Rel>
			m_cDataModule.Rollback(m_cDBSelect_Rel);

            DmqData.Close();
            DmqData.Free();
			Result := FALSE;
			Exit;
		end;

        // 親ﾚｺｰﾄﾞの削除ﾁｪｯｸ
        Close();
        SQL.Clear();
        SQL.Add('select COUNT(MasterKbn) CNT        '
            +   'from CrdNayoseInfo                 '
            +   'where (NayoseOyaNCode = :ONCode)   '
            +   '  and (NayoseKbn      = 1)         '
            +   '  and (MasterKbn      = 22)        ');

        ParamByName('ONCode').AsFloat   :=  OyaNCD;

        Open();

        sCNT    :=  FieldByName('CNT').AsInteger;

        // 存在しない場合は親のﾚｺｰﾄﾞを削除
        if ( sCNT = 0 ) then
        begin
            Close();
            SQL.Clear();
            SQL.Add('delete from CrdNayoseInfo      '
    		    +   'where (MasterKbn = 22)         '
                +   '  and (NayoseSyu = 1)          '
                +   '  and (NayoseKbn = 2)          '
    			+   '  and (NknNCode  = :ONCode)    ');

            ParamByName('ONCode').AsFloat   :=  OyaNCD;

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                // ﾛｰﾙﾊﾞｯｸ(破棄)
            	//m_cDataModule.Rollback(m_cDBSelect);   <Rel>
            	m_cDataModule.Rollback(m_cDBSelect_Rel);

                DmqData.Close();
                DmqData.Free();
            	Result := FALSE;
            	Exit;
            end;
        end;


       // 親会社のCrdNayoseInfo_Relを削除
       Close();
       SQL.Clear();
       SQL.Add('update CrdNayoseInfo_Rel            ');
       SQL.Add('set RDelKbn_Rel = 1,                ');
       SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
       SQL.Add('where MasterKbn   = 22        ');
       SQL.Add(' and  NayoseSyu   = 1     ');
       SQL.Add(' and  NknNCode  = :GC      ');
       SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

	   // 入金先ｺｰﾄﾞ
	   ParamByName('GC').AsFloat   := NknNCD;
       ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

       if ( ExecSQL = False ) then
       begin
       	   m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
           m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

           Result := False;
           Exit;
       end;

        // MTokui_SELの請求情報の変更（名寄せ構成から外す）
        // 名寄せ子の場合   親子ﾌﾗｸﾞ        （12:各店別子⇒0:単独）
        //                  請求区分        （2:各店別請求各店別入金⇒1:親一括請求一括入金）
        //                  請求先内部ｺｰﾄﾞ  （親内部ｺｰﾄﾞ⇒自身の内部ｺｰﾄﾞ）
        // 名寄せ親の場合   親子ﾌﾗｸﾞ        （11:各店別親⇒0:単独）
        //                  請求区分        （2:各店別請求各店別入金⇒1:親一括請求一括入金）

        Close();
        SQL.Clear();
        SQL.Add('UPDATE MTokui_SEL SET          '
            +   '    OyakoFLg   =   :OyakoFLg   '
            +   '   ,UsKinKbn   =   :UsKinKbn   '
            +   '   ,SeiNCode   =   :NCode      '
            +   'WHERE (BaseNCode = :NCode)     '
            +   '  and (RecKBN = 1)             ');

        ParamByName('OyakoFLg').AsInteger   :=  0;
        ParamByName('UsKinKbn').AsInteger   :=  1;
        ParamByName('NCode').AsFloat        :=  NknNCD;

        if ( not ExecSQL() ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            // ﾛｰﾙﾊﾞｯｸ(破棄)
        	//m_cDataModule.Rollback(m_cDBSelect); <Rel>
        	m_cDataModule.Rollback(m_cDBSelect_Rel);

            DmqData.Close();
            DmqData.Free();
        	Result := FALSE;
        	Exit;
        end;

        // 請求区分ﾁｪｯｸ
        Close();
        SQL.Clear();
        SQL.Add('select                                 '
            +   '    mt.NYKRootKbn      m_NYKRootKbn    '   // 債権名寄せ区分 (mtokui)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分       (mtokui_sel)
            +   'from MTOKUI mt                         '
            +   'left outer join MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'where (mt.RDelKbn = 0)                 '
            +   '  and (mt.NCode = :ONCode)             '
            +   '  and (se.RecKbn = 1)                  ');

        ParamByName('ONCode').AsFloat   :=  OyaNCD;

        Open();

        nUsKinKbn    :=  FieldByName('se_UsKinKbn').AsInteger;

        if ( sCNT = 0 ) then
        begin
            Close();
            SQL.Clear();
            SQL.Add('UPDATE MTOKUI_SEL SET      '
            +   '    OyakoFLg   =   :OyakoFLg   '
            +   '   ,SeiNCode   =   :NCode      '
            +   'WHERE (BaseNCode = :NCode)     '
            +   '  and (RecKBN = 1)             ');

            ParamByName('OyakoFLg').AsInteger   :=  0;
            ParamByName('NCode').AsFloat        :=  OyaNCD;

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                // ﾛｰﾙﾊﾞｯｸ(破棄)
                //m_cDataModule.Rollback(m_cDBSelect);    <Rel>
                m_cDataModule.Rollback(m_cDBSelect_Rel);

                DmqData.Close();
                DmqData.Free();
                Result := FALSE;
                Exit;
            end;

            Close();
            SQL.Clear();
            SQL.Add('UPDATE MTOKUI SET          '
            +   '    NYKRootKbn =   :NYKRootKbn '
            +   '   ,REndKaisu  =   0           '
            +   '   ,RCloseDay1 =   0           '
            +   '   ,RCloseDay2 =   0           '
            +   '   ,RCloseDay3 =   0           '
            +   '   ,RcvMonth1  =   0           '
            +   '   ,RcvMonth2  =   0           '
            +   '   ,RcvMonth3  =   0           '
            +   '   ,RHolidayKbn1 = 0           '
            +   '   ,RHolidayKbn2 = 0           '
            +   '   ,RHolidayKbn3 = 0           '
            +   '   ,RcvDay1    =   0           '
            +   '   ,RcvDay2    =   0           '
            +   '   ,RcvDay3    =   0           '
            +   'WHERE (NCode = :NCode)         ');

            ParamByName('NCode').AsFloat        :=  OyaNCD;

            if ( nUsKinKbn = 1 ) then
	            ParamByName('NYKRootKbn').AsInteger	:=  0
            else
	            ParamByName('NYKRootKbn').AsInteger	:=  1;

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                // ﾛｰﾙﾊﾞｯｸ(破棄)
                //m_cDataModule.Rollback(m_cDBSelect);   <Rel>
                m_cDataModule.Rollback(m_cDBSelect_Rel);

                DmqData.Close();
                DmqData.Free();
                Result := FALSE;
                Exit;
            end;

            Close();
            SQL.Clear();
            SQL.Add('UPDATE MTOKUI_CRD SET      '
            +   '    CngNCode   =   0           '
            +   'WHERE (BaseNCode = :NCode)     ');

            ParamByName('NCode').AsFloat        :=  OyaNCD;

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                // ﾛｰﾙﾊﾞｯｸ(破棄)
                //m_cDataModule.Rollback(m_cDBSelect);  <Rel>
                m_cDataModule.Rollback(m_cDBSelect_Rel);

                DmqData.Close();
                DmqData.Free();
                Result := FALSE;
                Exit;
            end;
        end;
        Close;
	end;

  	// MQueryの構築
   	DmqData     :=  TMQuery.Create( Self );
   	// DBとMQueryの接続
   	//m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
   	m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );  //<Rel>

   	// ﾄﾗﾝｻﾞｸｼｮﾝの開始
	//m_cDataModule.BeginTran (m_cDBSelect);
	m_cDataModule.BeginTran (m_cDBSelect_Rel);

	with ( DmqData ) do
	begin

       	// 選択ﾚｺｰﾄﾞを削除
		Close();
		SQL.Clear();
		SQL.Add('delete from CrdNayoseInfo      '
	    	+   'where (MasterKbn = 22)         '
           	+   '  and (NayoseSyu = 1)          '
           	+   '  and (NayoseKbn = :NK)        '
			+   '  and (NknNCode  = :GC)        '
			+   '  and (NayoseOyaNCode = :NO)   ');

       	// 名寄せ区分
		ParamByName('NK').AsInteger := nNayoKbn;
       	// 入金先ｺｰﾄﾞ
       	ParamByName('GC').AsFloat   := NknNCD;
       	// 名寄せ親入金先ｺｰﾄﾞ
       	ParamByName('NO').AsFloat   := OyaNCD;

		if ( not ExecSQL() ) then
		begin
           	m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

           	m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

           	// ﾛｰﾙﾊﾞｯｸ(破棄)
			//m_cDataModule.Rollback(m_cDBSelect);   //<Rel>
			m_cDataModule.Rollback(m_cDBSelect_Rel);
           	DmqData.Close();
           	DmqData.Free();
			Result := FALSE;
			Exit;
		end;

       	// 親ﾚｺｰﾄﾞの削除ﾁｪｯｸ
       	Close();
       	SQL.Clear();
       	SQL.Add('select COUNT(MasterKbn) CNT        '
           	+   'from CrdNayoseInfo                 '
           	+   'where (NayoseOyaNCode = :ONCode)   '
           	+   '  and (NayoseKbn      = 1)         '
           	+   '  and (MasterKbn      = 22)        ');

       	ParamByName('ONCode').AsFloat   :=  OyaNCD;

       	Open();

       	sCNT    :=  FieldByName('CNT').AsInteger;

       	// 存在しない場合は親のﾚｺｰﾄﾞを削除
       	if ( sCNT = 0 ) then
       	begin
           	Close();
           	SQL.Clear();
           	SQL.Add('delete from CrdNayoseInfo      '
   		    	+   'where (MasterKbn = 22)         '
               	+   '  and (NayoseSyu = 1)          '
               	+   '  and (NayoseKbn = 2)          '
   				+   '  and (NknNCode  = :ONCode)    ');

           	ParamByName('ONCode').AsFloat   :=  OyaNCD;

           	if ( not ExecSQL() ) then
           	begin
               	m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

               	m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

               	// ﾛｰﾙﾊﾞｯｸ(破棄)
           		//m_cDataModule.Rollback(m_cDBSelect);   //<Rel>
           		m_cDataModule.Rollback(m_cDBSelect_Rel);

               	DmqData.Close();
               	DmqData.Free();
           		Result := FALSE;
           		Exit;
           	end;
       	end;
        Close;
	end;

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        m_cDBSelect_Rel :=  m_cDBSelect;         //子会社

    // MQueryの構築
    DmqData     :=  TMQuery.Create( Self );
    // DBとMQueryの接続
    //m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );  <Rel>
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	//m_cDataModule.BeginTran (m_cDBSelect); <Rel>
	m_cDataModule.BeginTran (m_cDBSelect_Rel);


//↑<Rel>


	with ( DmqData ) do
	begin

        // 選択ﾚｺｰﾄﾞを削除
		Close();
		SQL.Clear();
		SQL.Add('delete from CrdNayoseInfo      '
		    +   'where (MasterKbn = 22)         '
            +   '  and (NayoseSyu = 1)          '
            +   '  and (NayoseKbn = :NK)        '
			+   '  and (NknNCode  = :GC)        '
			+   '  and (NayoseOyaNCode = :NO)   ');

        // 名寄せ区分
		ParamByName('NK').AsInteger := nNayoKbn;
        // 入金先ｺｰﾄﾞ
        ParamByName('GC').AsFloat   := NknNCD;
        // 名寄せ親入金先ｺｰﾄﾞ
        ParamByName('NO').AsFloat   := OyaNCD;

		if ( not ExecSQL() ) then
		begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            // ﾛｰﾙﾊﾞｯｸ(破棄)
			//m_cDataModule.Rollback(m_cDBSelect);   //<Rel>
			m_cDataModule.Rollback(m_cDBSelect_Rel);

            DmqData.Close();
            DmqData.Free();
			Result := FALSE;
			Exit;
		end;

        // 親ﾚｺｰﾄﾞの削除ﾁｪｯｸ
        Close();
        SQL.Clear();
        SQL.Add('select COUNT(MasterKbn) CNT        '
            +   'from CrdNayoseInfo                 '
            +   'where (NayoseOyaNCode = :ONCode)   '
            +   '  and (NayoseKbn      = 1)         '
            +   '  and (MasterKbn      = 22)        ');

        ParamByName('ONCode').AsFloat   :=  OyaNCD;

        Open();

        sCNT    :=  FieldByName('CNT').AsInteger;

        // 存在しない場合は親のﾚｺｰﾄﾞを削除
        if ( sCNT = 0 ) then
        begin
            Close();
            SQL.Clear();
            SQL.Add('delete from CrdNayoseInfo      '
    		    +   'where (MasterKbn = 22)         '
                +   '  and (NayoseSyu = 1)          '
                +   '  and (NayoseKbn = 2)          '
    			+   '  and (NknNCode  = :ONCode)    ');

            ParamByName('ONCode').AsFloat   :=  OyaNCD;

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                // ﾛｰﾙﾊﾞｯｸ(破棄)
            	//m_cDataModule.Rollback(m_cDBSelect);   <Rel>
            	m_cDataModule.Rollback(m_cDBSelect_Rel);

                DmqData.Close();
                DmqData.Free();
            	Result := FALSE;
            	Exit;
            end;
        end;
        Close;
    end;

    // ｺﾐｯﾄ(反映)
	m_cDataModule.Commit (m_cDBSelect_Rel);

    //<0162>↓
    DmqData.Close();
    DmqData.Free();
    //<0162>↑

    //↓<Rel>  <0717>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
   		begin
   		// 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
	   		if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_CRD) = false ) or
               ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = false ) or
               //CRDNayoseInfo
               ( m_SyncMaster.fnCall_SYNC(71,JNTSYNC_DELETE)  = false ) or
      		   ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = false ) then
        		begin
	           		Result := false;
            		Exit;
        		end;

        		// 更新されたときはSecHojyoDispInfoのメンテを行う。
        	if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,NknNCD,DmqData) then
        	begin
            	Result := false;
            	Exit;
        	end;
    	end;
//↑<Rel>

	// -----<155> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<155> Add-Ed-----

    // 正常終了
	Result := TRUE;

end;

//-----------------------------------------------------------------------------
// fnRecordCheck()
//      PARAM   :
//      VAR     :
//      RETURN  : TRUE : 正常 FALSE : 異常
//      MEMO    : 名寄せ入力値ﾁｪｯｸ
//-----------------------------------------------------------------------------
function    TJNTCRP004003F.fnRecordCheck(const bGoukei: Boolean = False): Boolean;
var
	sNknCD		: String;
	sName		: String;
	strFormat	: String;
    nNknNCode   : Extended;
    nNknOyaNCode   : Extended;


    Qry         : TMQuery;

    iKaisu      : Integer;                                  // 締日回数
    iSime1      : Integer;                                  // 締日1
    iSime2      : Integer;                                  // 締日2
    iSime3      : Integer;                                  // 締日3
    iCycle1     : Integer;                                  // ｻｲｸﾙ1
    iCycle2     : Integer;                                  // ｻｲｸﾙ2
    iCycle3     : Integer;                                  // ｻｲｸﾙ3
    iKaisyu1    : Integer;                                  // 回収日1
    iKaisyu2    : Integer;                                  // 回収日2
    iKaisyu3    : Integer;                                  // 回収日3

    iHolKbn1    : Integer;                                  //<132> 休日区分1
    iHolKbn2    : Integer;                                  //<132> 休日区分2
    iHolKbn3    : Integer;                                  //<132> 休日区分3

    iRet        : Integer;

    sUsKinKbn : Integer;
    sCngNCode : Extended;
    sNDGCode  : String;
    sNDNAME   : String;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>

    iRetCd    : Integer;

    iValue    : Integer;

{$I JNTSProcUtil.inc}
    //-----------------------------------------------------------------------------
    // 得意先の存在ﾁｪｯｸ、締日のﾁｪｯｸ <113>
    //
    // PARAM    : sCd   : Md=0の場合 外部ｺｰﾄﾞ、Md=1の場合 内部ｺｰﾄﾞ
    //          : sNm   : 取得した得意先の簡略名称
    //          : sNCd  : 取得した得意先の内部ｺｰﾄﾞ
    //          : Md    : 0.存在ﾁｪｯｸ 1.締日ﾁｪｯｸ
    // RETURN
    // <Md = 0>
    // Result =  0 : 正常
    //          -1 : 外部ｺｰﾄﾞが空白
    //          -2 : 請求区分が「0.通常以外」
    // <Md = 1>
    //          -3 : 締日設定違い
    // <Md = 0 or 1>
    //          -9 : SQLｴﾗｰ
    //-----------------------------------------------------------------------------
    function lfnGetMTOKUI_Info(sCd: String; var sNm: String; var nNCd: Extended; Md: Integer): Integer;
    var
        lvQry : TMQuery;
    begin

        sNm := '';

        if (Trim(sCd) = '') then
        begin
            Result := -1;
            Exit;
        end;

        if (m_TRCodeAttr <= 1) then
            sCd := Format ('%.16d',[StrToInt64(Trim(sCd))]);

        // MQueryの構築
        lvQry := TMQuery.Create(Self);
        m_cDataModule.SetDBInfoToQuery(m_cDBSelect, lvQry);

        try
            with (lvQry) do
            begin
                Close;
                SQL.Clear;
                SQL.Add('select                    '
                    +   '    NCode                 '
                    +   '   ,GCode                 '
                    +   '   ,NMK                   '
                    +   '   ,REndKaisu             '	        // 締日回数
                    +   '   ,RCloseDay1            '	        // 締日1
                    +   '   ,RCloseDay2            '	        // 締日2
                    +   '   ,RCloseDay3            '            // 締日3
                    +   '   ,RcvMonth1             '            // ｻｲｸﾙ1
                    +   '   ,RcvMonth2             '            // ｻｲｸﾙ2
                    +   '   ,RcvMonth3             '            // ｻｲｸﾙ3
                    +   '   ,RcvDay1               '            // 回収日1
                    +   '   ,RcvDay2               '            // 回収日2
                    +   '   ,RcvDay3               '            // 回収日3
                    +   '   ,Isnull(RHolidayKbn1,0) as HolKbn1' //<132> 休日区分1
                    +   '   ,Isnull(RHolidayKbn2,0) as HolKbn2' //<132> 休日区分2
                    +   '   ,Isnull(RHolidayKbn3,0) as HolKbn3' //<132> 休日区分3
                    +   '   ,TrSeiKbn              '            // 取引先請求区分
                    +   'from MTOKUI               '
                    +   '     left outer join MTOKUI_SEL se         '
                    +   '     on (BaseNCode = NCode and RecKBN = 1) '
                    +   'where (RDelKbn   = 0)     '
                    +   '  and (SumKbn    = 0)     '
                    +   '  and (HojyoKbn1 = 1)     ');

                if Md = 0 then
                begin
                    SQL.Add('and (GCode = :GCd)');
                    ParamByName('GCd').AsString	:= sCd;
                end
                else begin
                    SQL.Add('and (NCode = :NCd)');
                    ParamByName('NCd').AsFloat	:= StrToFloat(sCd);
                end;

                Open;

                if (not EOF) then
                begin
                    // 存在ﾁｪｯｸ&情報取得
                    if md = 0 then
                    begin
                        //if FieldByName('TrSeiKbn').AsInteger <> 0 then
                        if (FieldByName('TrSeiKbn').AsInteger <> 0) and (m_SimeChkFlg <> 1) then   //<142> 締日チェック不要の場合は、エラーとしない。
                        begin
                            // 通常請求以外の場合はｴﾗｰとする
                            Result := -2;
                        end
                        else begin
                            nNCd     := FieldByName('NCODE').AsFloat;           // 内部ｺｰﾄﾞ
                            sNm      := FieldByName('NMK').AsString;            // 簡略名称
                            iKaisu   := FieldByName('REndKaisu').AsInteger;     // 締日回数
                            iSime1   := FieldByName('RCloseDay1').AsInteger;    // 締日1
                            iSime2   := FieldByName('RCloseDay2').AsInteger;    // 締日2
                            iSime3   := FieldByName('RCloseDay3').AsInteger;    // 締日3
                            iCycle1  := FieldByName('RcvMonth1').AsInteger;	    // ｻｲｸﾙ1
                            iCycle2  := FieldByName('RcvMonth2').AsInteger;	    // ｻｲｸﾙ2
                            iCycle3  := FieldByName('RcvMonth3').AsInteger;	    // ｻｲｸﾙ3
                            iKaisyu1 := FieldByName('RcvDay1').AsInteger;	    // 回収日1
                            iKaisyu2 := FieldByName('RcvDay2').AsInteger;	    // 回収日2
                            iKaisyu3 := FieldByName('RcvDay3').AsInteger;	    // 回収日3

                            iHolKbn1 := FieldByName('HolKbn1').AsInteger;	    //<132> 休日区分1
                            iHolKbn2 := FieldByName('HolKbn2').AsInteger;	    //<132> 休日区分2
                            iHolKbn3 := FieldByName('HolKbn3').AsInteger;	    //<132> 休日区分3

                            Result := 0;
                        end;
                    end
                    // 同一締日ﾁｪｯｸ
                    else begin
                        if (iSime1   = FieldByName('RCloseDay1').AsInteger) and
                           (iSime2   = FieldByName('RCloseDay2').AsInteger) and
                           (iSime3   = FieldByName('RCloseDay3').AsInteger) and
                           (iCycle1  = FieldByName('RcvMonth1').AsInteger)  and
                           (iCycle2  = FieldByName('RcvMonth2').AsInteger)  and
                           (iCycle3  = FieldByName('RcvMonth3').AsInteger)  and

                           (iHolKbn1 = FieldByName('HolKbn1').AsInteger)  and   //<132>条件追加 休日区分1
                           (iHolKbn2 = FieldByName('HolKbn2').AsInteger)  and   //<132>条件追加 休日区分2
                           (iHolKbn3 = FieldByName('HolKbn3').AsInteger)  and   //<132>条件追加 休日区分3

                           (iKaisyu1 = FieldByName('RcvDay1').AsInteger)    and
                           (iKaisyu2 = FieldByName('RcvDay2').AsInteger)    and
                           (iKaisyu3 = FieldByName('RcvDay3').AsInteger)    then
                            Result :=  0
                        else
                            Result := -3;
                            if  (m_SimeChkFlg =1 ) then Result := 0;   //142
                    end;
                end
                else begin
                    Result := -9;
                end;
            end;
        finally
        	lvQry.Close;
            lvQry.Free();
        end;

    end;
begin

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

     if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
     	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
     else
     	m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//↑<Rel>

	Result := TRUE;

    // 子得意先ｺｰﾄﾞを取得
    if bGoukei then
    	sNknCD := f1NayoseOyaCode.Text
    else
	    sNknCD := GridNayose.DataSource.DataSet.FieldByName('HojCode').AsString;

    // 子得意先ｺｰﾄﾞの存在Check
//    if (fnNknCodeCheck(sNknCD, sName, nNknNCode, DISPOSE_REAL) = FALSE) then
    iRet := lfnGetMTOKUI_Info(sNknCD, sName, nNknNCode, 0);
    if (iRet <> 0) then
    begin
        if iRet = -2 then
    		MjsMessageBox(Self, '通常請求以外は、名寄せ設定はできません。', mjInformation, mjDefOk);

        Result := FALSE;
        Exit;
    end;

    // 名寄せ入力が新規ﾚｺｰﾄﾞの場合
    if bGoukei or (MemNayose.State in [dsInsert]) then
    begin
        // 名寄せ子の存在Check(既に名寄せ情報に存在していたらｴﾗｰ)
        if (fnCheckNknNayoseInfo(sNknCD, NAYOSE_CHILD) = TRUE) then
        begin
    		MjsMessageBox(Self, '既に名寄せ設定で登録済です。', mjInformation, mjDefOk);
            Result := FALSE;
            Exit;
        end
        else
        begin
            // 名寄せ子の実績存在ﾁｪｯｸ　<117>
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3); //常に子社でチェック
            //m_cDataModule.SetDBInfoToQuery (m_cDBSelect_Rel, StdProc3);
            // PRC_MA0130_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
            with StdProc3 do
            begin
				BeginExecProc(StdProc3, False);
				try
                ParamByName('@pTRNCD').AsFloat    := nNknNCode;
                ParamByName('@pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;
                ParamByName('@pEDYMD').AsDateTime := uvSelSys.GetOKedDymd;
                ParamByName('@pSNYM').AsInteger   := uvSelSys.GetOKstNym;
                ParamByName('@pENYM').Asinteger   := uvSelSys.GetOKedNym;
                ExecProc;
                finally
                EndExecProc(StdProc3);
                end;

                //if ParamByName('@RETURN_VALUE').AsInteger <> 0 then  //<159>
                if (ParamByName('@RETURN_VALUE').AsInteger <> 0) and (m_SimeChkFlg <> 1) then
                begin
                	Close;
                    MjsMessageBox(Self, 'この得意先は伝票が入力済みなので'#13#10
                                    + '名寄せ設定はできません。', mjInformation, mjDefOk);
                    Result := FALSE;
                    Exit;
                end;
              	Close;
            end;

		    if not bGoukei then
            begin
                MemNayose.Edit;
                MemNayose.FieldByName('NknNCode').AsFloat := nNknNCode;     // 子得意先内部ｺｰﾄﾞ
                MemNayose.FieldByName('SName').AsString   := sName;			// 子得意先名称

                if (m_TRCodeAttr <= 1) then
                    sNknCD := Format ('%.16d',[StrToInt64(Trim(sNknCD))]);

                MemNayose.FieldByName('BaseHojCode').AsString := sNknCD;	// 子得意先ｺｰﾄﾞ(編集前)

                // 数値(前0あり)
                if (m_TRCodeAttr  = 1) then
                begin
                    strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    sNknCD    := Format(strFormat,[StrToInt64(Trim(sNknCD))]);
                    MemNayose.FieldByName('HojCode').AsString := sNknCD;	// 子得意先ｺｰﾄﾞ(前0あり)
                end;
            end;


{<0176>  ストアドに変更

            // 得意先に回収予定データが存在している場合は名寄せ不可  <161>
            Qry := TMQuery.Create(Self);
            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, Qry);  //全社でチェック
            try
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    //<0169>↓
                    //SQL.Add('select TOP 1 SeiKYuNCode from CRD_KAIYOTEIT '	  		);
	                //SQL.Add('    where SeiKYuNCode = :pCSNCode and RDelKbn = 0 '	);
                    SQL.Add('select TOP 1 CSNCode from CRD_KAIYOTEIT '	  		);
	                SQL.Add('    where CSNCode = :pCSNCode and RDelKbn = 0 '	);
                    //<0169>↑

	                ParamByName('pCSNCode').AsFloat :=   nNknNCode;

                    Open;

                    if not (EOF) then
                    begin
                        MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ設定はできません。'#13#10
                            + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態にしてください。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;
                end;
            finally
                Qry.Close;
                Qry.Free();
            end;

            // 得意先に入金データが存在している場合は名寄せ不可   <161>

            Qry := TMQuery.Create(Self);
            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, Qry);  //全社でチェック

            try
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select TOP 1 OyaCSNCode from CRD_NYUKINT '	  		);
	                SQL.Add('    where OyaCSNCode = :pCSNCode and RDelKbn = 0 '	);
	                ParamByName('pCSNCode').AsFloat :=   nNknNCode;
                    Open;

                    if not (EOF) then
                    begin
                        MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ設定はできません。'#13#10
                            + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態にしてください。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;
                end;
            finally
                Qry.Close;
                Qry.Free();
            end;


}
//↓<176> ストアド化

            // 得意先に回収予定データが存在している場合は名寄せ不可（グリッドでの登録）
            //Qry := TMQuery.Create(Self);
            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);

            if GridNayose.DataSource.DataSet.FieldByName('UsKinKbn') .AsInteger = IKKATSU_SEIKYU then
            begin

                m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, StdProcCRD_CHK_NAYOSE);  //全社でチェック
                try
                    // StdProcCRD_CHK_NAYOSE
                    with StdProcCRD_CHK_NAYOSE do
                    begin
						BeginExecProc(StdProcCRD_CHK_NAYOSE, False);
						try
                        ParamByName('@pCSNCode').AsFloat := nNknNCode;
                        ExecProc;
                        finally
                        EndExecProc(StdProcCRD_CHK_NAYOSE);
                        end;
                        iRetCd := ParamByName('@RetCd').AsInteger;
                    end;

                    if (iRetCd = NG_BY_KAIYOTEIDATA) then
                    begin
                                MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ設定はできません。'#13#10
                                    + #13#10
                                    + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                    + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;

                    if (iRetCd = NG_BY_NYUKINDATA) then
                    begin
                                MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ設定はできません。'#13#10
                                    + #13#10
                                    + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                    + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;
                    
                    if (iRetCd = NG_BY_KOUFURIDATA) then
                    begin
                                MjsMessageBox(Self, 'この得意先には処理中の口座振替データが存在するため名寄せ設定はできません。'#13#10
                                    + #13#10
                                    + '名寄せ設定を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                                    + '処理中データをクリアしてください。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;



                    if (iRetCd = CONFIRM_BY_KAIYOTEIDATA) then
                    begin

                        iValue := MjsMessageBoxEX(Self,'この得意先には回収予定データが存在しますが、名寄せ登録を行ってもよろしいですか？'#13#10
                                                     + '名寄せ登録を行うと回収予定データは名寄せ親得意先に集計されます。','名寄せ登録',mjQuestion,mjYesNo,mjDefNo);

                        if iValue <> mrYes then
                        begin
                            Result := FALSE;
                            exit;
                        end else
                        begin
                            nNknOyaNCode := GridNayose.DataSource.DataSet.FieldByName('OyaNCode') .AsFloat;
                            fnUpdCRD_KAIYOTEIT(nNknNCode,nNknOyaNCode,NAYOSE_SET);
                        end;
                   end;

                finally
                    //Qry.Close;
                    //Qry.Free();
                end;
                //<176>ストアド化↑
            end;
        end;
    end
    else
    begin
        if (m_AfterSave.sOyaCD <> GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString) then
        begin

            // 得意先を名寄せ親代替得意先に指定している親の存在チェック
            Qry := TMQuery.Create(Self);
            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, Qry);  //全社でチェック

            try
                with Qry do
                begin
                    Close;
                    SQL.Clear;
	                SQL.Add('SELECT '								);
	                SQL.Add('    TOK.GCode '						);
	                SQL.Add('FROM '									);
	                SQL.Add('    MTOKUI_CRD AS TOC '				);
	                SQL.Add('    INNER JOIN MTOKUI AS TOK '			);
	                SQL.Add('        ON  TOK.NCode = TOC.BaseNCode ');
	                SQL.Add('        AND TOK.RDelKbn = 0 '			);
	                SQL.Add('    INNER JOIN MTOKUI AS TOK2 '		);
	                SQL.Add('        ON  TOK2.NCode = TOC.CngNCode ');
	                SQL.Add('WHERE '								);
	                SQL.Add('    TOK2.GCode = :pCODE '				);

					if (m_TRCodeAttr <= 1) then
		                ParamByName('pCODE').AsString := Format ('%.16d',[StrToInt64(Trim(sNknCD))])
                    else
		                ParamByName('pCODE').AsString := Trim(sNknCD);

                    Open;

                    if not (EOF) then
                    begin
                   		MjsMessageBox(Self, 'この得意先は他の得意先の代替得意先に指定されている為'#13#10
                                        + '名寄せ親を変更できません。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;
                end;
            finally
                Qry.Close;
                Qry.Free();
            end;
        end;
    end;

	// 名寄せ親得意先ｺｰﾄﾞの取得
    if bGoukei then
    	sNknCD := f0CODE.Text
    else
		sNknCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;

	if (sNknCD <> '') then
	begin
		// 名寄せ親得意先ｺｰﾄﾞの存在Check
		if (fnNknCodeCheck(sNknCD, sName, nNknNCode, DISPOSE_NAYOSEOYA,
            sUsKinKbn, sCngNCode, sNDGCode, sNDNAME) = FALSE) then
		begin
			Result := FALSE;
			Exit;
		end

		else
		begin

		    if not bGoukei then
            begin
                MemNayose.Edit;
                MemNayose.FieldByName('OyaNCode').AsFloat := nNknNCode;         // 親得意先内部ｺｰﾄﾞ
                MemNayose.FieldByName('OyaName').AsString := sName;			    // 名寄せ親得意先名称

                if (m_TRCodeAttr <= 1) then
                    sNknCD := Format ('%.16d',[StrToInt64(Trim(sNknCD))]);
                MemNayose.FieldByName('OyaBaseHojCD').AsString := sNknCD;	    // 名寄せ親得意先ｺｰﾄﾞ(編集前)

                // 数値(前0あり)
                if (m_TRCodeAttr  = 1) then
                begin
                    strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    sNknCD    := Format(strFormat,[StrToInt64(Trim(sNknCD))]);
                    MemNayose.FieldByName('OyaHojCD').AsString := sNknCD;	    // 名寄せ親得意先ｺｰﾄﾞ(前0あり)
                end;
            end;

            // 子得意先の締日ﾁｪｯｸ
            Qry := TMQuery.Create(Self);
            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);  <Rel>
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, Qry);

            try
                // この親を持つ子を取得
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select NknNCode from CRDNayoseInfo  ' +
                            'where (RDelKbn        = 0)      and ' +
                            '      (NayoseKbn      = 1)      and ' +        // 名寄せ子
                            '      (NayoseOyaNCode = :PrtCd)     ');        // 名寄せ親

                    ParamByName('PrtCd').AsFloat := nNknNCode;

                    Open;
                    // 親得意先の締日情報をｾｯﾄ、実績ﾏｽﾀの作成 <114>
                    if (EOF) then
                    begin
                        if not bGoukei then
	                        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	                        //m_cDataModule.BeginTran(m_cDBSelect); <Rel>
	                        m_cDataModule.BeginTran(m_cDBSelect_Rel);

                        try
                            // 締日情報のｾｯﾄ
                            Close;
                            SQL.Clear;
                            SQL.Add('update MTOKUI set         ' +
                                    'REndKaisu  = :REndKaisu,  ' +          // 締日回数
                                    'RCloseDay1 = :RCloseDay1, ' +          // 締日1
                                    'RCloseDay2 = :RCloseDay2, ' +          // 締日2
                                    'RCloseDay3 = :RCloseDay3, ' +          // 締日3
                                    'RcvMonth1  = :RcvMonth1,  ' +          // ｻｲｸﾙ1
                                    'RcvMonth2  = :RcvMonth2,  ' +          // ｻｲｸﾙ2
                                    'RcvMonth3  = :RcvMonth3,  ' +          // ｻｲｸﾙ3
                                    'RHolidayKbn1 = :HolKbn1,  ' +          //<132> 休日区分1
                                    'RHolidayKbn2 = :HolKbn2,  ' +          //<132> 休日区分2
                                    'RHolidayKbn3 = :HolKbn3,  ' +          //<132> 休日区分3
                                    'RcvDay1    = :RcvDay1,    ' +          // 回収日1
                                    'RcvDay2    = :RcvDay2,    ' +          // 回収日2
                                    'RcvDay3    = :RcvDay3     ' +          // 回収日3
                                    'where NCode = :NCode      ');

                            // 子の締日情報をｾｯﾄ
                            ParamByName('REndKaisu').AsInteger  := iKaisu;
                            ParamByName('RCloseDay1').AsInteger := iSime1;
                            ParamByName('RCloseDay2').AsInteger := iSime2;
                            ParamByName('RCloseDay3').AsInteger := iSime3;
                            ParamByName('RcvMonth1').AsInteger  := iCycle1;
                            ParamByName('RcvMonth2').AsInteger  := iCycle2;
                            ParamByName('RcvMonth3').AsInteger  := iCycle3;
                            ParamByName('HolKbn1').AsInteger    := iHolKbn1;    //<132> 休日区分1
                            ParamByName('HolKbn2').AsInteger    := iHolKbn2;    //<132> 休日区分2
                            ParamByName('HolKbn3').AsInteger    := iHolKbn3;    //<132> 休日区分3
                            ParamByName('RcvDay1').AsInteger    := iKaisyu1;
                            ParamByName('RcvDay2').AsInteger    := iKaisyu2;
                            ParamByName('RcvDay3').AsInteger    := iKaisyu3;
                            ParamByName('NCode').AsFloat        := nNknNCode;

                            ExecSQL;
                            Close;

                            // 実績ﾏｽﾀの作成
                            //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc4); //<Rel>
                            m_cDataModule.SetDBInfoToQuery(m_cDBSelect_Rel, StdProc4);

                            // PRC_MA0130_103
                            with StdProc4 do
                            begin
								BeginExecProc(StdProc4, False);
								try
                                ParamByName('@pTRNCD')   .AsFloat   := nNknNCode;   // 得意先ｺｰﾄﾞ
                                ParamByName('@pSEIKBN_B').AsInteger := 0;           // 変更前請求区分
                                ParamByName('@pSEIKBN_A').AsInteger := 0;           // 変更後請求区分
                                ExecProc;
                                finally
                                EndExecProc(StdProc4);
                                end;
                                if ParamByName('@RETURN_VALUE').AsInteger <> 0 then
                                begin
                                	Close;
                                    Abort;
                                end;
                                Close;
                            end;

	                        if not bGoukei then
	                            // ｺﾐｯﾄ(反映)
	                            //m_cDataModule.Commit(m_cDBSelect); <Rel>
	                            m_cDataModule.Commit(m_cDBSelect_Rel);

                        except
                            MjsMessageBox(Self, '親得意先の更新に失敗しました。', mjError, mjDefOk);
	                        if not bGoukei then
	                            // ﾛｰﾙﾊﾞｯｸ(破棄)
	                            //m_cDataModule.Rollback(m_cDBSelect); <Rel>
	                            m_cDataModule.Rollback(m_cDBSelect_Rel);
                            Result := FALSE;
                            Exit;
                        end;
                    end
                    else
                    // 子得意先の締日ﾁｪｯｸ
                    begin
                        sNknCD := FloatToStr(FieldByName('NknNCode').AsFloat);
                        if (lfnGetMTOKUI_Info(sNknCD, sName, nNknNCode, 1) = -3) then
                        begin
                            MjsMessageBox(Self, '締日情報の異なる名寄せ設定はできません。', mjInformation, mjDefOk);
                            Result := FALSE;
                            Exit;
                        end;
                    end;
                end;
            finally
            	Qry.Close;
                Qry.Free();
            end;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// BPrintClick()    <PRN>
//      PARAM   : Sender    TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 印刷ﾎﾞﾀﾝｸﾘｯｸ時処理(親のﾎﾞﾀﾝ継承)
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.BPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
    JNTPDlg     :   TFrmJNTPDialog;
begin
    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
                'JNTCRP004003',
                uvHani,
                uvSelSys);

    // 販売ポインタ設定
    m_cJNTArea.setSelAppRecord;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<Del10-VerUp001><D10_OwnMapRules> ST
	m_cDBSelect.FormatOptions.MapRules.Clear;
	m_cDBSelect.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    //結果を判断する
    case lvRet of
     0: //ｷｬﾝｾﾙ
     	begin
	     	Exit;
        end;
     1:	//通常
     	begin
			// ↓↓↓<133>
            case uvHani.pvrPattern of
             // 実在/合計取引先債権情報登録ﾘｽﾄ(簡略型)
             0,2:
                begin
                    fnPrnSETKanryaku(uvHani.pvrPattern);
                    PrtParam.TargetMD   :=  MDPrint;
                end;
             // 実在/合計取引先債権情報登録ﾘｽﾄ(詳細型)
             1,3:
             	begin
        	        fnPrnSETSyousai(uvHani.pvrPattern);
	                PrtParam.TargetMD   :=  MDPrint;
    	        end;
             // 一括請求登録リスト
             4:
             	begin
                    fnPrnSETNayose(uvHani.pvrPattern);
                    PrtParam.TargetMD	:= MemPtnNayose;
                end;
//<DENSHI> ADD St
             // 電子記録債権情報登録リスト
             5,6:
                begin
                    fnPrnSETDensai(uvHani.pvrPattern);
                    PrtParam.TargetMD	:= MemPtnDensai;
                end;
//<DENSHI> ADD Ed
//<Account> ADD St
             // 口座振替情報登録リスト
             7:
                begin
                    fnPrnSETAccount(uvHani.pvrPattern);
                    PrtParam.TargetMD	:= MemPtnAccount;
                end;
//<Account> ADD Ed
//<GFB2> ADD St
             // 送金依頼人名称登録リスト
             8:
                begin
                    fnPrnSETGaika(uvHani.pvrPattern);
                    PrtParam.TargetMD	:= MemPtnGaika;
                end;
//<GFB2> ADD Ed
            end;
            // ↑↑↑<133>


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

    // 財務ポインタ設定
    m_cJNTArea.setMasAppRecord;

end;

// -----------------------------------------------------------------------------
//  印刷処理【実在/合計取引先登録リスト(簡略型)　債権情報】  <133>
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETKanryaku(const pPtn: Integer);
var
    dqMasterData    :   TMQuery;
    sCode           :   String;
begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();

    with dqMasterData do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT m.GCode,m.Nm,m.Nmk,m.Renso,c.PostNo1,c.PostNo2,c.Ads1,  '
            +   '       c.Ads2,c.Tel1,c.Tel2,c.Fax1,f.FusenKbn                  '
            +   'FROM MTOKUI_CRD c, MTOKUI m                                    '
            +   'LEFT OUTER JOIN MTOKUI_SEL s ON (s.BaseNCode = m.NCode)        '
            +   'LEFT OUTER JOIN MFusenInfo f ON (f.NCode = m.NCode)            '
            +   '                            AND (f.MasterKbn = 22)             ');
        if ( pPtn = 0 ) then
        begin
            SQL.Add('WHERE  (m.SumKbn = 0) AND (m.RDelKbn = 0)                  '
                +   '   AND (m.TemplateKbn =0) AND (s.RecKbn=1)                 '
                +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn1=1)         ');
        end
        else
        begin
            SQL.Add('WHERE  (m.SumKbn <> 0) AND (m.RDelKbn = 0)                 '
                +   '   AND (m.TemplateKbn =0) AND (s.RecKbn=1)                 '
                +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn1=1)         ');
        end;

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
            SQL.Add('  AND  (m.GCode >= :ExStCode)      ');
		    SQL.Add('  AND  (m.GCode <= :ExEdCode)      ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY m.GCode           ')
        else    SQL.Add('ORDER BY m.Renso, m.GCode  ');

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
			dqMasterData.Close();
			dqMasterData.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MDPrint.Append();

            // 付箋区分
			case GetFld('FusenKbn').AsInteger of
				0:	TGraphicField(MDPrint.FieldByName('Fusen')).Clear;
				1:	TGraphicField(MDPrint.FieldByName('Fusen')).Assign(Image_Fusen_Red.Picture.Bitmap);
				2:	TGraphicField(MDPrint.FieldByName('Fusen')).Assign(Image_Fusen_Green.Picture.Bitmap);
				3:	TGraphicField(MDPrint.FieldByName('Fusen')).Assign(Image_Fusen_Blue.Picture.Bitmap);
				4:	TGraphicField(MDPrint.FieldByName('Fusen')).Assign(Image_Fusen_Orange.Picture.Bitmap);
			end;

            if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
            else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
            else    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);
			MDPrint.FieldByName('GCode').AsString    :=  sCode;

            MDPrint.FieldByName('Renso') .AsString   :=  GetFld('Renso') .AsString;
            MDPrint.FieldByName('Nm')    .AsString   :=  GetFld('Nm')    .AsString;
            MDPrint.FieldByName('Nmk')   .AsString   :=  GetFld('Nmk')   .AsString;

            MDPrint.Post();
            Next;
        end;
    end;

    MDPrint.First();

    dqMasterData.Close();
    dqMasterData.Free();

end;

// 051114 >>
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト　債権情報】
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETSyousai(pPtn:Integer);
var
	dqMasterData    :   TMQuery;
    Qry             : TMQuery;
    i               :   Integer;
    sCode           :   String;

	strExCode	: String;
	sName		: String;
	lName		: String;
    nCngNCode   : Extended;

begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
        SQL.Add('select                                 '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ       (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　       (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称       (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称       (mtokui)
            +   '   ,mt.YsGKin          m_YsGKin        '   // 与信限度額     (mtokui)
            +   '   ,mt.TStartDate      m_StDate        '   // 適用日（自）   (mtokui)
            +   '   ,mt.TEndDate        m_EnDate        '   // 適用日（至）   (mtokui)
            +   '   ,mt.UpdDateTM       m_UpDate        '   // 最終更新日時   (mtokui)
            +   '   ,cs.PostNo1         cs_PostNo1      '   // 郵便番号(基番) (MTOKUI_CRD)
            +   '   ,cs.PostNo2         cs_PostNo2      '   // 郵便番号(枝番) (MTOKUI_CRD)
            +   '   ,cs.Ads1            cs_Ads1         '   // 住所上段       (MTOKUI_CRD)
            +   '   ,cs.Ads2            cs_Ads2         '   // 住所下段       (MTOKUI_CRD)
            +   '   ,cs.Tel1            cs_Tel1         '   // 電話番号1      (MTOKUI_CRD)
            +   '   ,cs.SectionName     cs_SectionName  '   // 送付先部署名   (MTOKUI_CRD)
            +   '   ,cs.TanNm           cs_TanNm        '   // 担当者名       (MTOKUI_CRD)
            +   '   ,cs.MailAddress     cs_MailAddress  '   // メールアドレス (MTOKUI_CRD)
            +   '   ,cs.KeisyoKbn       cs_KeisyoKbn    '   // 担当者敬称     (MTOKUI_CRD)
            +   '   ,cs.KanaName1       cs_KanaName1    '   // ｶﾅ名称1        (MTOKUI_CRD)
            +   '   ,cs.KanaName2       cs_KanaName2    '   // ｶﾅ名称1        (MTOKUI_CRD) //<156>
            +   '   ,cs.KanaName3       cs_KanaName3    '   // ｶﾅ名称1        (MTOKUI_CRD) //<156>
            +   '   ,cs.TesuryoFutan    cs_TesuryoFutan '   // 手数料負担     (MTOKUI_CRD)
            +   '   ,cs.Ku              cs_Ku           '   // EDI採用区分    (MTOKUI_CRD)
            +   '   ,cs.DefoltEDI       cs_DefoltEDI    '   // EDI情報        (MTOKUI_CRD)
            +   '   ,cs.Site            cs_Site         '   // 手形サイト     (MTOKUI_CRD)
            +   '   ,cs.BunkaiKbn       cs_BunkaiKbn    '   // 分解方法　     (MTOKUI_CRD)
            +   '   ,cs.StdRitu         cs_StdRitu      '   // 入金方法の基準値　     (MTOKUI_CRD)
            +   '   ,cs.Jouken1         cs_Jouken1      '   // 回収種別　     (MTOKUI_CRD)
            +   '   ,cs.Jouken2         cs_Jouken2      '   // 回収種別　     (MTOKUI_CRD)
            +   '   ,cs.CngNCode        cs_CngNCode     '   // 親代替取引先   (MTOKUI_CRD)
            +   '   ,se.USDenPfm        se_USDenPfm     '   // 納品書ﾌｫｰﾑ   　(mtokui_sel)
            +   '   ,se.USGKei          se_USGKei       '   // 売上合計欄印字 (mtokui_sel)
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード (mtokui_sel)
			// 051112 追加 >>
            +   '   ,se.SSsyoPfm       se_nSSsyoPfm     '   // 請求書ﾌｫｰﾑ
            +   '   ,se.SSsyoKgm       se_nSSsyoKgm     '   // 合計欄税印字
            +   '   ,se.RyoPfm         se_nRyoPfm       '   // 領収証ﾌｫｰﾑ
            +   '   ,se.RyoTeki        se_nRyoTeki      '   // 領収証の但し書き
            +   '   ,se.SyuRyoKbn      se_nSyuRyoKbn    '   // 集金用領収証
            +   '   ,cs.HasuuHou       cs_nHasuuHou     '   // 端数処理方法
			// 051112 追加 <<
            +   '   ,mt.NYKRootKbn     m_NYKRootKbn     '   // 債権名寄せ区分 (mtokui)
            +   '   ,se.UsKinKbn       se_UsKinKbn      '   // 請求区分       (mtokui_sel)
            +   '   ,cs.GaikaKbn       cs_GaikaKbn      '   // 外貨採用区分(MTOKUI_CRD)  <GAIKA_2> ADD
//<GFB> ADD St
            +   '   ,cs.GaikaSoukinName1       cs_GaikaSoukinName1    '   // 外貨送金人名称1 (MTOKUI_CRD)
            +   '   ,cs.GaikaSoukinName2       cs_GaikaSoukinName2    '   // 外貨送金人名称2 (MTOKUI_CRD)
            +   '   ,cs.GaikaSoukinName3       cs_GaikaSoukinName3    '   // 外貨送金人名称3 (MTOKUI_CRD)
//<GFB> ADD Ed
            +   'from MTOKUI_CRD cs, MTOKUI mt          '
            +   'left outer join MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'WHERE  (mt.RDelKbn = 0)                '
            +   '   AND (mt.TemplateKbn = 0)            '
            +   '   AND (cs.BaseNCode = mt.NCode)       '
            +   '   AND (mt.HojyoKbn1=1)                '
            +   '   AND (se.RecKbn = 1)                 ');
        if ( pPtn = 1 ) then
        begin
            SQL.Add('   AND (mt.SumKbn = 0)             ');
        end
        else
        begin
            SQL.Add('   AND (mt.SumKbn <> 0)            ');
        end;

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
(* <HAN>
            if ( uvHani.pvrStCode[0] <> '' ) and
               ( uvHani.pvrEdCode[0] =  '' ) then
            begin
//@　↓12.02
{
                SQL.Add('  AND  (mt.GCode >= :ExCode)   ');
                if ( m_TRCodeAttr <= 1 ) then
    			    ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrStCode[0];
            end
            else if ( uvHani.pvrStCode[0] =  '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
                SQL.Add('  AND  (mt.GCode <= :ExCode)   ');
                if ( m_TRCodeAttr <= 1 ) then
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
                if ( m_TRCodeAttr <= 1 ) then
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
            if ( m_TRCodeAttr = 0 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( m_TRCodeAttr = 1 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 2);
			MDPrint.FieldByName('GCode'	).AsString	    :=  sCode;

            // 連想
			MDPrint.FieldByName('Renso'	).AsString	    :=  GetFld('m_Renso'	).AsString;
            // 簡略名称
			MDPrint.FieldByName('Nmk'	).AsString	    :=  GetFld('m_Nmk'		).AsString;
            // 正式名称
			MDPrint.FieldByName('Nm'	).AsString	    :=  GetFld('m_Nm'		).AsString;
            // 郵便番号
			MDPrint.FieldByName('PostNo1').AsString	    :=  GetFld('cs_PostNo1'	).AsString;
            // 郵便番号(基番)
            if ( not GetFld('cs_PostNo1').IsNull      ) and
               ( GetFld('cs_PostNo1').AsString <> '0' ) then
               //@　↓12.02 書式変換追加
               MDPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('cs_PostNo1').AsInteger]);
               // MDPrint.FieldByName('PostNo1').AsString	        :=	GetFld('cs_PostNo1').AsString;
               //@ ↑
            // 郵便番号(枝番)
            if ( not GetFld('cs_PostNo2').IsNull      ) and
               ( GetFld('cs_PostNo2').AsString <> '0' ) then
                //@　↓12.02 書式変換追加
                MDPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('cs_PostNo2').AsInteger]);
                //MDPrint.FieldByName('PostNo2').AsString	        :=	GetFld('cs_PostNo2').AsString;
                //@ ↑
            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  MjsGetGengou( GetFld('m_StDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:=	MjsGetGengou( GetFld('m_EnDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                    MDPrint.FieldByName('UpdDateTM').AsString	:=	MjsGetGengou(GetFld('m_UpDate').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('m_UpDate').AsDateTime);
                //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString   :=  FormatDateTime( 'yyyy/mm/dd', GetFld('m_StDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('m_EnDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('m_UpDate').IsNull ) then
                    MDPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('m_UpDate').AsDateTime);
                //@ ↑
            end;


			//------------------------------------------------------------------
            // 基本情報
			//------------------------------------------------------------------
            // 住所
			MDPrint.FieldByName('Ads1'	).AsString	    :=  GetFld('cs_Ads1'		).AsString;
			MDPrint.FieldByName('Ads2'	).AsString	    :=  GetFld('cs_Ads2'		).AsString;
            // 電話番号
			MDPrint.FieldByName('Tel1'	).AsString	    :=  GetFld('cs_Tel1'		).AsString;
            // 送付先部署名
			MDPrint.FieldByName('SectNm').AsString	    :=  GetFld('cs_SectionName'	).AsString;
            // 担当者名
			MDPrint.FieldByName('TanNm'	).AsString	    :=  GetFld('cs_TanNm'		).AsString;
            // 敬称
			MDPrint.FieldByName('Keisyo').AsString	    :=  GetFld('cs_KeisyoKbn'	).AsString;
            // メアド
            // 051121 >>
            sName :=  GetFld('cs_MailAddress'	).AsString;

            MDPrint.FieldByName('Mail'	).AsString := sName;
            MDPrint.FieldByName('Mail1'	).AsString := MjsHanCopy(sName, 1, 40);
            MDPrint.FieldByName('Mail2'	).AsString := MjsHanCopy(sName, 41, 40);
            MDPrint.FieldByName('Mail3'	).AsString := MjsHanCopy(sName, 81, 20);

            // 051121 <<
            // 部門コード・名称
            strExCode := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
            if (m_BMCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MDPrint.FieldByName('BmNCd'	).AsString := '';
				MDPrint.FieldByName('BmNm'	).AsString := '';
            end
            else
            begin
	            // 数値属性
            	if ( m_BMCodeAttr = 0 ) then
        	        sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_BMCodeDigit, 0)
    	        // 数値属性前ｾﾞﾛ有
	            else if ( m_BMCodeAttr = 1 ) then
            	    sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_BMCodeDigit, 1)
        	    // ﾌﾘｰ属性
    	        else
	                sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_BMCodeDigit, 2);
				MDPrint.FieldByName('BmNCd'	).AsString := sCode;
				// 名称取得
	            fnGetNAME(strExCode,41,m_BMCodeAttr,sName );
				MDPrint.FieldByName('BmNm'	).AsString := sName;
            end;
            // 担当者コード・名称
            strExCode := fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);
            if (m_TNCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MDPrint.FieldByName('TnNCd'	).AsString := '';
				MDPrint.FieldByName('TnNm'	).AsString := '';
            end
            else
            begin
	            // 数値属性
            	if ( m_TNCodeAttr = 0 ) then
        	        sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TNCodeDigit, 0)
    	        // 数値属性前ｾﾞﾛ有
	            else if ( m_TNCodeAttr = 1 ) then
            	    sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TNCodeDigit, 1)
        	    // ﾌﾘｰ属性
    	        else
	                sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TNCodeDigit, 2);
				MDPrint.FieldByName('TnNCd'	).AsString := sCode;
				// 名称取得
	            fnGetNAME(strExCode,25,m_TnCodeAttr,sName );
				MDPrint.FieldByName('TnNm'	).AsString := sName;
            end;

			//------------------------------------------------------------------
            // 債権情報
			//------------------------------------------------------------------
            // 与信限度額
            if ( GetFld('m_YsGKin').AsFloat <> 0 ) then
            begin
	            MDPrint.FieldByName('YsGKin'	).AsFloat	:=  GetFld('m_YsGKin').AsFloat;
            end;
            // 手形サイト
            if ( GetFld('cs_Site').AsFloat <> 0 ) then
            begin
	            MDPrint.FieldByName('Site'		).AsFloat   :=  GetFld('cs_Site').AsFloat;
            end;

            // 納品書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            strExCode := IntToStr(GetFld('se_USDenPfm').AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'ur00', strExCode, lName, sName) = TRUE then
                MDPrint.FieldByName('USDenPfmNm'	).AsString := sName;
            Qry.Free;
            // 納品書ﾌｫｰﾑ
            if ( GetFld('se_USDenPfm').AsInteger <> 0) or
               ( MDPrint.FieldByName('USDenPfmNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('USDenPfm'	).AsInteger :=  GetFld('se_USDenPfm').AsInteger;
            end;

			// 区分名称取得
			for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
		    begin
            	if GetFld('se_USGKei').AsInteger = _UsgKeiItems[i].iCode then
		            MDPrint.FieldByName('USGKeiNm'	).AsString	:=  _UsgKeiItems[i].sName;
		    end;
            // 売上合計欄印字
            if ( GetFld('se_USGKei').AsInteger <> 0) or
               ( MDPrint.FieldByName('USGKeiNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('USGKei'	).AsInteger	:=  GetFld('se_USGKei').AsInteger;
            end;

			//------------------------------------------------------------------
            // 回収方法
			//------------------------------------------------------------------
            // 分解方法
            MDPrint.FieldByName('BunkaiKbn'	).AsInteger	:= GetFld('cs_BunkaiKbn').AsInteger;
            if GetFld('cs_BunkaiKbn').AsInteger = 0 then
	            MDPrint.FieldByName('BunkaiNm'	).AsString	:= '比率'
            else if GetFld('cs_BunkaiKbn').AsInteger = 1 then
	            MDPrint.FieldByName('BunkaiNm'	).AsString	:= '定額';
			// 回収割合 (率)
            if GetFld('cs_BunkaiKbn').AsInteger = 0 then
            begin
            	if ( GetFld('cs_StdRitu').AsFloat <> 0 ) then
                begin
	                MDPrint.FieldByName('StdRitu').AsFloat := GetFld('cs_StdRitu').AsFloat;
                end;
            end
			// 回収割合 (金額)
            else
            begin
            	if ( GetFld('cs_StdRitu').AsFloat <> 0 ) then
                begin
	                MDPrint.FieldByName('StdKin').AsFloat := GetFld('cs_StdRitu').AsFloat;
                end;
            end;
			// 区分名称取得
			for i := Low(_KaiJyItems) to High(_KaiJyItems) do
		    begin
            	if GetFld('cs_Jouken1').AsInteger = _KaiJyItems[i].iCode then
		            MDPrint.FieldByName('Jouken1Nm'	).AsString	:=  _KaiJyItems[i].sName;
		    end;
            // 回収種別 未満
            if ( GetFld('cs_Jouken1').AsInteger <> 0) or
               ( MDPrint.FieldByName('Jouken1Nm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('Jouken1'	).AsInteger :=  GetFld('cs_Jouken1').AsInteger;
            end;

			// 区分名称取得
			for i := Low(_KaiJyItems) to High(_KaiJyItems) do
		    begin
            	if GetFld('cs_Jouken2').AsInteger = _KaiJyItems[i].iCode then
		            MDPrint.FieldByName('Jouken2Nm'	).AsString	:=  _KaiJyItems[i].sName;
		    end;
            // 回収種別 以上
            if ( GetFld('cs_Jouken2').AsInteger <> 0) or
               ( MDPrint.FieldByName('Jouken2Nm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('Jouken2'	).AsInteger :=  GetFld('cs_Jouken2').AsInteger;
            end;

			//------------------------------------------------------------------
            // マッチング情報
			//------------------------------------------------------------------
            // カナ名称
			MDPrint.FieldByName('KanaName'	).AsString	    :=  GetFld('cs_KanaName1'	).AsString;
			MDPrint.FieldByName('KanaName2'	).AsString	    :=  GetFld('cs_KanaName2'	).AsString;  //<156>
			MDPrint.FieldByName('KanaName3'	).AsString	    :=  GetFld('cs_KanaName3'	).AsString;  //<156>
            // 手数料負担区分
            MDPrint.FieldByName('TesuryoFutan'	).AsInteger :=  GetFld('cs_TesuryoFutan').AsInteger;
			// 区分名称取得
			for i := Low(_TsryFtnItems) to High(_TsryFtnItems) do
		    begin
            	if GetFld('cs_TesuryoFutan').AsInteger = _TsryFtnItems[i].iCode then
		            MDPrint.FieldByName('TesuryoNm'	).AsString	:=  _TsryFtnItems[i].sName;
		    end;
            // EDI採用区分
            MDPrint.FieldByName('EDIKbn'	).AsInteger :=  GetFld('cs_Ku').AsInteger;
			// 区分名称取得
			for i := Low(_EDIKuItems) to High(_EDIKuItems) do
		    begin
            	if GetFld('cs_Ku').AsInteger = _EDIKuItems[i].iCode then
		            MDPrint.FieldByName('EDINm'	).AsString	:=  _EDIKuItems[i].sName;
		    end;
            // EDI情報
            MDPrint.FieldByName('DefoltEDI'	).AsString	:=  GetFld('cs_DefoltEDI').AsString;
            // 親代替取引先
            nCngNCode               :=  GetFld('cs_CngNCode').AsFloat;

            strExCode := fnGetGCODE(nCngNCode, 22);
            if (m_TRCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MDPrint.FieldByName('OyaNCd'	).AsString := '';
				MDPrint.FieldByName('OyaNm'	).AsString := '';
            end
            else
            begin
	            // 数値属性
            	if ( m_TRCodeAttr = 0 ) then
        	        sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TRCodeDigit, 0)
    	        // 数値属性前ｾﾞﾛ有
	            else if ( m_TRCodeAttr = 1 ) then
            	    sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TRCodeDigit, 1)
        	    // ﾌﾘｰ属性
    	        else
	                sCode   := m_cComArea.SetDspCodeAttr(strExCode, m_TRCodeDigit, 2);
				MDPrint.FieldByName('OyaNCd'	).AsString := sCode;
				// 名称取得
	            fnGetNAME(strExCode, 22, m_TrCodeAttr, sName);
				MDPrint.FieldByName('OyaNm'	).AsString := sName;
            end;
			// 請求区分名称取得
            if ( GetFld('m_NYKRootKbn').AsInteger = 1 ) then
            begin
                //<175>  _SeikyuKbnItems → m_SeikyuKbnItems (定数から変数に変更）
                for i := Low(m_SeikyuKbnItems) to High(m_SeikyuKbnItems) do
                begin
                    if GetFld('se_UsKinKbn').AsInteger = m_SeikyuKbnItems[i].iCode then
                        MDPrint.FieldByName('SeikyuKbnNm'	).AsString	:=  m_SeikyuKbnItems[i].sName;
                end;
                // 請求区分
	            if ( GetFld('se_UsKinKbn').AsInteger <> 0 ) or
                   ( MDPrint.FieldByName('SeikyuKbnNm'	).AsString <> '' )then
	            begin
                    MDPrint.FieldByName('SeikyuKbn'	).AsInteger :=  GetFld('se_UsKinKbn').AsInteger;
                end;
            end;
            // 名寄せ区分
            MDPrint.FieldByName('NYKRootKbn'	).AsInteger :=  GetFld('m_NYKRootKbn').AsInteger;

			// 051112 追加 >>
            // 請求書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            strExCode := IntToStr(GetFld('se_nSSsyoPfm').AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'se00', strExCode, lName, sName) = TRUE then
                MDPrint.FieldByName('nSSsyoPfmNm'	).AsString := sName;
            Qry.Free;
            // 請求書ﾌｫｰﾑ
            if ( GetFld('se_nSSsyoPfm').AsInteger <> 0) or
               ( MDPrint.FieldByName('nSSsyoPfmNm'	).AsString <> '' ) then
            begin
            	MDPrint.FieldByName('nSSsyoPfm'	).AsInteger :=  GetFld('se_nSSsyoPfm').AsInteger;
            end;
			// 区分名称取得
            MDPrint.FieldByName('nSSsyoKgmNm'	).AsString	:=  fnGetUsgKeiNm   (GetFld('se_nSSsyoKgm').AsString);
            // 鏡欄税印字
            if ( GetFld('se_nSSsyoKgm').AsInteger <> 0) or
               ( MDPrint.FieldByName('nSSsyoKgmNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('nSSsyoKgm'	).AsInteger	:=  GetFld('se_nSSsyoKgm').AsInteger;
            end;

            // 領収証ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            strExCode := IntToStr(GetFld('se_nRyoPfm').AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'ry00', strExCode, lName, sName) = TRUE then
                MDPrint.FieldByName('nRyoPfmNm'	).AsString := sName;
            Qry.Free;
            // 領収証ﾌｫｰﾑ
            if ( GetFld('se_nRyoPfm').AsInteger <> 0) or
               ( MDPrint.FieldByName('nRyoPfmNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('nRyoPfm'	).AsInteger :=  GetFld('se_nRyoPfm').AsInteger;
            end;

            // 領収証の但し書き名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            if gfnJNTSELKBNNameGet(Qry, 'ALL', 'ALL2', GetFld('se_nRyoTeki').AsInteger, sName) = TRUE then
                MDPrint.FieldByName('nRyoTekiNm'	).AsString := sName;
            Qry.Free;
            // 領収証の但し書き
            if ( GetFld('se_nRyoTeki').AsInteger <> 0) or
               ( MDPrint.FieldByName('nRyoTekiNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('nRyoTeki'	).AsInteger :=  GetFld('se_nRyoTeki').AsInteger;
            end;

            // 集金用領収証
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            if gfnJNTSELKBNNameGet(Qry, 'ALL', '集金用領収書', GetFld('se_nSyuRyoKbn').AsInteger, sName) = TRUE then
                MDPrint.FieldByName('nSyuRyoKbnNm'	).AsString := sName;
            Qry.Free;
            // 集金用領収証
            if ( GetFld('se_nSyuRyoKbn').AsInteger <> 0) or
               ( MDPrint.FieldByName('nSyuRyoKbnNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('nSyuRyoKbn'	).AsInteger :=  GetFld('se_nSyuRyoKbn').AsInteger;
            end;

			// 区分名称取得
            MDPrint.FieldByName('nHasuuHouNm'	).AsString	:=  fnGetKaiHasNm   (GetFld('cs_nHasuuHou').AsInteger);
            // 端数処理方法
            if ( GetFld('cs_nHasuuHou').AsInteger <> 0) or
               ( MDPrint.FieldByName('nHasuuHouNm'	).AsString <> '' ) then
            begin
	            MDPrint.FieldByName('nHasuuHou'	).AsInteger	:=  GetFld('cs_nHasuuHou').AsInteger;
            end;
			// 051112 追加 <<
//<GAIKA_2> ADD St
			//------------------------------------------------------------------
            // 外貨情報
			//------------------------------------------------------------------

            // 外貨採用区分
            MDPrint.FieldByName('GaikaSaiyoKbn'	).AsInteger :=
                GetFld('cs_GaikaKbn').AsInteger;
            MDPrint.FieldByName('GaikaSaiyoKbnNm'	).AsString :=
                GetCodeListByName(GetFld('cs_GaikaKbn').AsInteger, SaiyoNames_Gaika);
//<GAIKA_2> ADD Ed
//<GFB> ADD St
            // 外貨送金人名称
			MDPrint.FieldByName('GaikaSoukinName1'	).AsString	    :=  GetFld('cs_GaikaSoukinName1'	).AsString;
			MDPrint.FieldByName('GaikaSoukinName2'	).AsString	    :=  GetFld('cs_GaikaSoukinName2'	).AsString;
			MDPrint.FieldByName('GaikaSoukinName3'	).AsString	    :=  GetFld('cs_GaikaSoukinName3'	).AsString;
//<GFB> ADD Ed
            MDPrint.Post();
            Next;
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();

end;

// -----------------------------------------------------------------------------
//  印刷処理【一括請求登録リスト(簡略型/詳細型)　債権情報　名寄せ】
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETNayose(pPtn:Integer);
var
	dqMasterData    :   TMQuery;
	sHojCD		:   String;
	sOyaCD		:   String;
	strFormat	:   String;
    sPreOyaCD   :   String;
    nKaisu		:	Integer;
    nRCloseDay	:	Integer;
    nRcvMonth	:	Integer;
    nRcvDay		:	Integer;
    nRHolidayKbn:	Integer;
    cRCloseDayNm:	String;
    cRcvMonthNm	:	String;
    cRcvDayNm	:	String;
    cRHolidayKbnNm:	String;
    i           :   Integer;
    nLineCount	:	Integer;
    nPageEnd	:	Integer;
begin
    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    if ( MemPtnNayose.Active ) then MemPtnNayose.Close();
    MemPtnNayose.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
		SQL.Add('select                                 '
            +   '    NI.NKNNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode         as SGCode         '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode        as OYAGCode       '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NM            as SNAME          '   // 子取引先名称
		    +   '   ,MTO.NM           as OYANAME        '   // 親取引先名称
            +   '   ,SE.UsKinKbn      as UsKinKbn       '
            +   '   ,CR.CngNCode      as CngNCode       '
            +   '   ,MTO.REndKaisu                      '
            +   '   ,MTO.RCloseDay1                     '
            +   '   ,MTO.RCloseDay2                     '
            +   '   ,MTO.RCloseDay3                     '
            +   '   ,MTO.RcvMonth1                      '
            +   '   ,MTO.RcvMonth2                      '
            +   '   ,MTO.RcvMonth3                      '
            +   '   ,MTO.RcvDay1                        '
            +   '   ,MTO.RcvDay2                        '
            +   '   ,MTO.RcvDay3                        '
            +   '   ,MTO.RHolidayKbn1                   '
            +   '   ,MTO.RHolidayKbn2                   '
            +   '   ,MTO.RHolidayKbn3                   '
            +   '   ,SE.TrSeiKbn                        '
            +   'from CrdNayoseInfo NI                  '
            +   'left outer join MTOKUI MT              '
            +   '   on (NI.NknNCode = MT.NCode)         '
            +   'left outer join MTOKUI MTO             '
            +   '   on (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'left outer join MTOKUI_SEL SE          '
            +   '   ON (se.BaseNCode = NI.NayoseOyaNCode and se.RecKBN = 1) '
            +   'left outer join MTOKUI_CRD CR          '
            +   '   ON (cr.BaseNCode = NI.NayoseOyaNCode) '
            +   'where (NI.MasterKbn = 22 )             '
            +   '  and (NI.NayoseSyu = 1  )             '
            +   '  and (NI.NayoseKbn = 1  )             ');

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
            SQL.Add('  AND  (MTO.GCode >= :ExStCodeO)    ');
		    SQL.Add('  AND  (MTO.GCode <= :ExEdCodeO)    ');
            ParamByName('ExStCodeO').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCodeO').AsString   :=  uvHani.pvrEdCode[0];
        end;

        if ( uvHani.pvrRgType[1] = 1 ) then
        begin
            SQL.Add('  AND  (MT.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (MT.GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[1];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[1];
        end;

        // 出力順序
        case uvHani.pvrOrder of
            0:   SQL.Add('ORDER BY MTO.GCode, MT.GCode ');
        	1:   SQL.Add('ORDER BY MTO.Renso, MTO.GCode, MT.Renso, MT.GCode ');
        	2:   SQL.Add('ORDER BY MT.GCode, MTO.GCode ');
        	else SQL.Add('ORDER BY MT.Renso, MT.GCode, MTO.Renso, MTO.GCode ');
        end;

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
//			ErrorMessageDsp(dqMasterData);
			dqMasterData.Close();
			dqMasterData.Free();
			Exit;
		end;

        nLineCount := 0;
        while ( EOF <> TRUE ) do
		begin
			// 名寄せ子
    		sHojCD := FieldByName('SGCode').AsString;
			if ( m_TRCodeAttr <= 1 ) then
			begin
				case ( m_TRCodeAttr ) of
					0: strFormat := '%'  + IntToStr (m_TRCodeDigit) + 'd';
					1: strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
				end;

				sHojCD := Format(strFormat,[StrToInt64(Trim(sHojCD))]);
			end;

			// 名寄せ親
            sOyaCD:= FieldByName('OyaGCode').AsString;
            if ( m_TRCodeAttr <= 1 ) then
            begin
                case ( m_TRCodeAttr ) of
                    0: strFormat := '%'  + IntToStr (m_TRCodeDigit) + 'd';
                    1: strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                end;

                sOyaCD := Format(strFormat,[StrToInt64(Trim(sOyaCD))]);
            end;

			MemPtnNayose.Append;
			MemPtnNayose.FieldByName('HojCode'     ).AsString  := sHojCD;                           // 名寄せ子外部ｺｰﾄﾞ(DB用)
			MemPtnNayose.FieldByName('BaseHojCode' ).AsString  := GetFld('SGCode'   ).AsString;	 // 名寄せ子外部ｺｰﾄﾞ(表示用)
			MemPtnNayose.FieldByName('SName'       ).AsString  := GetFld('SNAME'    ).AsString;	 // 名寄せ子名称
			MemPtnNayose.FieldByName('OyaHojCD'    ).AsString  := sOyaCD;                           // 名寄せ親外部ｺｰﾄﾞ(DB用)
			MemPtnNayose.FieldByName('OyaBaseHojCD').AsString  := GetFld('OyaGCode' ).AsString;	 // 名寄せ親外部ｺｰﾄﾞ(表示用)
		    MemPtnNayose.FieldByName('OyaName'     ).AsString  := GetFld('OYANAME'  ).AsString;	 // 名寄せ親名称
			MemPtnNayose.FieldByName('NknNCode'    ).AsFloat   := GetFld('NknNCode' ).AsFloat;      // 名寄せ子内部ｺｰﾄﾞ
			MemPtnNayose.FieldByName('OyaNCode'    ).AsFloat   := GetFld('NayoseOyaNCode').AsFloat; // 名寄せ親内部ｺｰﾄﾞ

			// 請求区分名称取得
            //<175>  _SeikyuKbnItems → m_SeikyuKbnItems (定数から変数に変更）
			for i := Low(m_SeikyuKbnItems) to High(m_SeikyuKbnItems) do
		    begin
            	if GetFld('UsKinKbn').AsInteger = m_SeikyuKbnItems[i].iCode then
		            MemPtnNayose.FieldByName('SeikyuKbnNm'	).AsString	:=  m_SeikyuKbnItems[i].sName;
		    end;

            // 入金締日情報1～3
            for nKaisu := 1 to GetFld('REndKaisu'   ).AsInteger do
            begin
                nRCloseDay	 	:= GetFld('RCloseDay'  +IntToStr(nKaisu)).AsInteger;   	// 締日
                nRcvMonth	 	:= GetFld('RcvMonth'   +IntToStr(nKaisu)).AsInteger;   	// ｻｲｸﾙ
	            nRcvDay      	:= GetFld('RcvDay'	   +IntToStr(nKaisu)).AsInteger;	// 回収日
	            nRHolidayKbn    := GetFld('RHolidayKbn'+IntToStr(nKaisu)).AsInteger;	// 休日区分

	            cRCloseDayNm 	:= Format('%d日締'  , [ nRCloseDay ]);				   	// 締日名称
	            cRcvMonthNm  	:= MjsHanFormat('%-7s'    , [ _ExpectItems [nRcvMonth] ]);   	// ｻｲｸﾙ名称
	            cRcvDayNm    	:= Format('%d日回収', [ nRcvDay ]);						// 回収日名称
                cRHolidayKbnNm	:= MjsHanFormat('%-8s'    , [ _HolidayItems[nRHolidayKbn] ]);	// 休日区分名称

			    MemPtnNayose.FieldByName('RCloseDay'  +IntToStr(nKaisu)).AsInteger 		:= nRCloseDay;	   	// 締日名称
			    MemPtnNayose.FieldByName('RcvMonth'   +IntToStr(nKaisu)).AsInteger 		:= nRcvMonth;	   	// ｻｲｸﾙ名称
			    MemPtnNayose.FieldByName('RcvDay'     +IntToStr(nKaisu)).AsInteger 		:= nRcvDay;	 		// 回収日名称
			    MemPtnNayose.FieldByName('RHolidayKbn'+IntToStr(nKaisu)).AsInteger 		:= nRHolidayKbn;	// 休日区分名称

			    MemPtnNayose.FieldByName('RCloseDay'  +IntToStr(nKaisu)+'Nm').AsString  := cRCloseDayNm;	// 締日名称
			    MemPtnNayose.FieldByName('RcvMonth'   +IntToStr(nKaisu)+'Nm').AsString  := cRcvMonthNm;	 	// ｻｲｸﾙ名称
			    MemPtnNayose.FieldByName('RcvDay'     +IntToStr(nKaisu)+'Nm').AsString  := cRcvDayNm;	 	// 回収日名称
			    MemPtnNayose.FieldByName('RHolidayKbn'+IntToStr(nKaisu)+'Nm').AsString  := cRHolidayKbnNm;	// 休日区分名称
        	end;

			// 代替記号
            if GetFld('NKNNCode').AsFloat = GetFld('CngNCode').AsFloat then
	            MemPtnNayose.FieldByName('DaitaiMark'   ).AsString := '○'
            else
	            MemPtnNayose.FieldByName('DaitaiMark'   ).AsString := '';

            nPageEnd := 0;

            //以降 下線の種別を取得する

            if ( sPreOyaCD <> FieldByName('OyaGCode').AsString ) then
            begin
	            sPreOyaCD := FieldByName('OyaGCode').AsString;

       			Inc(nLineCount, 2);
               	if ( nLineCount = 46 ) then	//名寄せ親を印字するとページ最終行
               	begin
	            	nPageEnd := 2;			//名寄せ親情報の下線を太実線
        			nLineCount := 0;
                end;
            end;

            Inc(nLineCount, 1);
            if ( nLineCount >= 46 ) then	//子を印字するとページ最終行
            begin
                nPageEnd := 1;				//子情報の下線を太実線
                nLineCount := 0;
            end;

			//次レコードの情報で編集したいのでここでNextの後にPost
            Next;

            if ( not EOF ) and ( sPreOyaCD <> FieldByName('OyaGCode').AsString ) then
            begin
               	if ( nLineCount = 45 ) then	//名寄せ親が次ページに印字される
               	begin
	            	nPageEnd := 1;			//子情報の下線を太実線
        			nLineCount := 0;
                end;
            end;

            MemPtnNayose.FieldByName('PageEnd').AsInteger := nPageEnd;

			//次レコードの情報で編集したいのでここでNextの後にPost
            MemPtnNayose.Post();
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();

end;
// 051114 <<

//-----------------------------------------------------------------------------
// BDeleteClick()
//      PARAM   : Sender    TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 削除ﾎﾞﾀﾝｸﾘｯｸ時処理(親のﾎﾞﾀﾝ継承)
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.BDeleteClick(Sender: TObject);
var
	cMessageRec :   TMJSMsgRec;
	strHojCode  :   String;
	strMessage  :   String;
	sHojCD		:   String;
    sNknNCode   :   Extended;
    sOyaNCode   :   Extended;
    sCngNCode   :   Extended;
    Bol			:	Boolean;
    Qry         :	TMQuery;
    nCount		:	Integer;
    nCount2		:	Integer;
    sRecNO		:   Integer; //<151>
    iRetCd      :	Integer;

    iValue      :	Integer;

{$I JNTSProcUtil.inc}
begin
    strHojCode  :=  '';
    strMessage  :=  '';
    sNknNCode   :=  0;
    sOyaNCode   :=  0;
    sCngNCode   :=  0;

    sRecNo := MemNayose.RecNo;    //<151>

	if ( Screen.ActiveControl.Name = GridNayose.Name ) then
	begin
		strHojCode  :=  GridNayose.DataSource.DataSet.FieldByName('HojCode')  .AsString;
		strMessage  :=  GridNayose.DataSource.DataSet.FieldByName('SName')    .AsString;
        sNknNCode   :=  GridNayose.DataSource.DataSet.FieldByName('NknNCode') .AsFloat;
        sOyaNCode   :=  GridNayose.DataSource.DataSet.FieldByName('OyaNCode') .AsFloat;
        sCngNCode   :=  GridNayose.DataSource.DataSet.FieldByName('CngNCode') .AsFloat;
	end;

    if ( Trim (strHojCode) = '' ) then Exit;

    sHojCD := strHojCode;
	if ( m_TRCodeAttr <= 1 ) then
		strHojCode := Format ('%.16d', [StrToInt64 (Trim (strHojCode))]);

    if sNknNCode <> 0 then
    begin
        // 名寄せページで名寄せ代替親得意先に指定されている行は削除不可にする
        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select count(TOKC.BaseNCode) as CNT from MTOKUI_CRD as TOKC');
            SQL.Add('inner join MTOKUI as TOK on TOKC.BaseNCode = TOK.NCode and TOK.RDelKbn=0');
            SQL.Add('where TOKC.CngNCode = :pCODE');
            ParamByName('pCODE').AsFloat := sNknNCode;

            Open;

            nCount := GetFld('CNT').AsInteger;
        end;
        Qry.Close;

        // 名寄せ代替親得意先以外の名寄せを取得する
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select count(NKNNCode) as CNT from CRDNayoseInfo');
            SQL.Add('where MasterKbn = 22 and NayoseSyu = 1 and NayoseKbn = 1');
            SQL.Add('  and NayoseOyaNCode = :pOYACODE and NknNCode <> :pCODE');
            ParamByName('pOYACODE').AsFloat := sOyaNCode;
            ParamByName('pCODE'   ).AsFloat := sNknNCode;
            Open;
            nCount2 := GetFld('CNT').AsInteger;
        end;
        Qry.Close;
        Qry.Free;

        if (nCount > 0) and (nCount2 > 0) then
        begin
            MjsMessageBox(Self, '名寄せ親代替得意先に指定されている名寄せ情報を削除する場合は'#13#10
                            + '他の子得意先の名寄せ情報を先に削除してください。', mjInformation, mjDefOk);
            Exit;
        end;
    end;

    //<Rel>ST
    if ( m_SyncMaster.m_flgGrpCorp = 0 ) then
    begin
        // 子社に配信済みの名寄せ情報は削除不可とする
        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select Count(NknNCode) CNT from CRDNayoseInfo_Rel');
            SQL.Add('where NknNCode = :pCODE');
            SQL.Add(' And RDelKbn_REL = 0 ');
            ParamByName('pCODE').AsFloat := sNknNCode;
            Open;
            nCount := GetFld('CNT').AsInteger;
        end;
        Qry.Close;
        Qry.Free;


        if (nCount > 0)  then
        begin
        	MjsMessageBox(Self, 'この得意先は子会社で使用しているため'#13#10
                        + '名寄せ情報を削除できません。', mjInformation, mjDefOk);
        	Exit;
        end;
    end;
    //<Rel>ED

    // 選択ﾚｺｰﾄﾞの削除が可能かﾁｪｯｸ
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);

	// 得意先
    // PRC_MA0130_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
    with StdProc3 do
    begin
		BeginExecProc(StdProc3, False);
		try
        //得意先が名寄せ親代替得意先の場合は名寄せ親でチェックする
    	if sNknNCode = sCngNCode then
	        ParamByName('@pTRNCD')  .AsFloat:=  sOyaNCode
        else
	        ParamByName('@pTRNCD')  .AsFloat    :=  sNknNCode;
        	ParamByName('@pSDYMD')  .AsDateTime :=  uvSelSys.GetOKstDymd;
        	ParamByName('@pEDYMD')  .AsDateTime :=  uvSelSys.GetOKedDymd;
        	ParamByName('@pSNYM')   .AsInteger  :=  uvSelSys.GetOKstNym;
        	ParamByName('@pENYM')   .Asinteger  :=  uvSelSys.GetOKedNym;
        	ExecProc();
        finally
        EndExecProc(StdProc3);
        end;
        	Bol :=  (ParamByName('@RETURN_VALUE').AsInteger = 0);
            Close;
    	end;

    //if ( not Bol ) then
    if ( not Bol ) and (m_SimeChkFlg <> 1) then //<159>
    begin
        MjsMessageBox(Self, 'この得意先は伝票が入力済みなので'#13#10
                        + '名寄せ情報を削除できません。', mjInformation, mjDefOk);
        Exit;
    end;

	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 4);


{  <176> ↓
    // 回収予定データが存在しているか <160>
    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);


    with Qry do
    begin
        Close;
        SQL.Clear;
        //<169>↓
        //SQL.Add('select top 1 SeiKYuNCode from CRD_KAIYOTEIT where SeiKYuNCode = :pCSNCode and RDelKbn = 0' );
        SQL.Add('select top 1 CSNCode from CRD_KAIYOTEIT where CSNCode = :pCSNCode and RDelKbn = 0' );
        //<169>↑
        ParamByName('pCSNCode').AsFloat := sNknNCode;;

        Open;

        // 名寄せの解除不可
        if not (eof) then
        begin
            MjsMessageBox(Self, 'この子得意先には消込中の回収予定データが存在します。'#13#10
                + '名寄せ解除する場合は、あらかじめ回収予定データを削除してください。', mjInformation, mjDefOk);
            Close;
            Free;
            Exit;
        end;
    end;
    //下に移動
    //Qry.Close;
    //Qry.Free;

    // 入金データが存在しているか <161>
    with Qry do
    begin
        Close;
        SQL.Clear;
        //<169>↓
        //SQL.Add('select top 1 OyaCSNCode from CRD_NYUKINT where OyaCSNCode = :pCSNCode and RDelKbn = 0' );
        SQL.Add('select top 1 CSNCode from CRD_NYUKINT where CSNCode = :pCSNCode and RDelKbn = 0' );
        //<169>↑
        ParamByName('pCSNCode').AsFloat := sNknNCode;;

        Open;

        // 名寄せの解除不可
        if not (eof) then
        begin
            MjsMessageBox(Self, 'この子得意先には消込中の入金データが存在します。'#13#10
                + '名寄せ解除する場合は、あらかじめ入金データを削除してください。', mjInformation, mjDefOk);
            Close;
            Free;
            Exit;
        end;
    end;
    Qry.Close;
    Qry.Free;
}

//↓ ストアド化

    // 得意先に回収予定データが存在している場合は名寄せ解除不可  <161>
    //Qry := TMQuery.Create(Self);
    //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);

    if GridNayose.DataSource.DataSet.FieldByName('UsKinKbn') .AsInteger = IKKATSU_SEIKYU then
    begin
        m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProcCRD_CHK_NAYOSE);  //全社でチェック
        try
            // StdProcCRD_CHK_NAYOSE
            with StdProcCRD_CHK_NAYOSE do
            begin
				BeginExecProc(StdProcCRD_CHK_NAYOSE, False);
				try
                ParamByName('@pCSNCode').AsFloat := sNknNCode;
                ExecProc;
                finally
                EndExecProc(StdProcCRD_CHK_NAYOSE);
                end;
                iRetCd := ParamByName('@RetCd').AsInteger;
            end;

            if (iRetCd = NG_BY_KAIYOTEIDATA) then
            begin
                MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ解除できません。'#13#10
                            + #13#10
                            + '名寄せ解除を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                            + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                Exit;
            end;

            if (iRetCd = NG_BY_NYUKINDATA) then
            begin
                MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ解除できません。'#13#10
                            + #13#10
                            + '名寄せ解除を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                            + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
                Exit;
            end;

            if (iRetCd = NG_BY_KOUFURIDATA) then
            begin
                MjsMessageBox(Self, 'この得意先には処理中の口座振替データが存在するため名寄せ解除できません。'#13#10
                            + #13#10
                            + '名寄せ解除を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                            + '処理中データをクリアしてください。', mjInformation, mjDefOk);
                Exit;
            end;

            if (iRetCd = CONFIRM_BY_KAIYOTEIDATA) then
            begin

                iValue := MjsMessageBoxEX(Self,'この得意先には回収予定データが存在しますが、名寄せ情報を解除してもよろしいですか？'#13#10
                                             + '名寄せ解除を行うと回収予定データは単独得意先のデータに更新されます。','名寄せ登録',mjQuestion,mjYesNo,mjDefNo);

                if iValue <> mrYes then
                begin
                    exit;
                end else
                begin
                    fnUpdCRD_KAIYOTEIT(sNknNCode,-1,NAYOSE_DELETE);
                end;
            end;

        finally
            //Qry.Close;
            //Qry.Free();
        end;
    end;
//<176>ストアド化↑


// <124>↓
//	strMessage	:= '"' + strMessage + '"のレコードを' + cMessageRec.sMsg;
    strMessage := MSG_DELETE;
// <124>↑

	if	(MJSMessageBoxEx (Self,strMessage,
                          cMessageRec.sTitle,
                          cMessageRec.icontype,
                          cMessageRec.btntype,
                          cMessageRec.btndef,
                          cMessageRec.LogType) = mrYes ) then
	begin
        if ( fnDeleteNknNayoseInfo(sNknNCode,sOyaNCode,NAYOSE_CHILD) = FALSE ) then Abort;

        fnGetNayoseInfo();
        MemNayose.Refresh;
    end;

    //MjsSetFocus(Self, GridNayose.Name);
    //保存行の位置にセット     //<151>
     MemNayose.RecNo := (sRecNo - 1);

end;
//-----------------------------------------------------------------------------
//  取引先コードのチェック
//-----------------------------------------------------------------------------
Function TJNTCRP004003f.fnChkTRCODE:Integer;
var
    Qry     : TMQuery;
    sCode   : String;
//↓<Rel>
	PQe     : TMQuery; //全社DB用クエリ
	Qe      : TMQuery; //子社DB用クエリ
	strNmk  : string;
	nPNCode : Extended;
//↑<Rel>
begin

    Result      := 0;
    f1NAME.Text := '';

    if uvTempFlg then
        sCode := ''
    else
    begin
        if m_TRCodeAttr = 2 then
            sCode:= f0CODE.Text
        else
        begin
            if f0CODE.Text <> '' then
                sCODE := Format ('%.16d', [StrToInt64 (Trim(f0CODE.text))])
            else
                sCODE := '';
        end;
    end;

//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
	begin
		PQe := TMQuery.Create(Self);
//		m_pMDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, PQe);
		m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, PQe);

		Qe  := TMQuery.Create(Self);
		m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qe);
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

                //名寄せ情報に登録されているか？
				PQe.Close;
				PQe.SQL.Clear;
				PQe.SQL.Add('select Nayose.NknNCode, tokui.Nmk NMK from CRDNayoseInfo Nayose'
                    +   ' ,Mtokui tokui '
					+   ' where (nayose.NknNCode = tokui.NCODE) and (Nayose.RDelKbn = 0)'
                    +   ' and   (tokui.GCODE = :pCODE)');

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

                    //名寄せ情報が存在するため単独で同期しない。全社一括配信で同期。
                    strNmk  := PQe.FieldByName('NMK').AsString;
                    MjsMessageBox(Self, '該当マスタは全社または他の子会社により名寄せ登録済みです。'#13#10
                    + '全社一括配信により関連付けを行ってください。'#13#10
                    + strNmk, mjInformation, mjDefOk);
                    Result := -97;
					Exit;
                end;


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
			            m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
			            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
			            m_cDataModule.BeginTran( m_cDBSelect );

				        try
                            if not fnMTOKUI_Sync(m_SyncMaster,nPNCode,PQe) then
                            begin
                                MjsMessageBoxEx (Self,
                                                     '自社への関連付けに失敗しました。',
                                                     'マスタ同期', mjError, mjOk, mjDefOk);
                                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
                                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                                m_cDataModule.Rollback( m_cDBSelect );
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
			                m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
			                // 子会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
			                m_cDataModule.Rollback( m_cDBSelect );
			                Result := -99;
			                Exit;
			            end;

			            // 親会社DBに対してｺﾐｯﾄを実行する
			            m_cDataModule.Commit( m_SyncMaster.m_cPDBSelect );
	                    // 子会社DBに対してｺﾐｯﾄを実行する
	                    m_cDataModule.Commit( m_cDBSelect );
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
		end;
	end;
//↑<Rel>

    Qry := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            Sql.Add('select NCODE, NM, HojyoKbn1 from MTOKUI '
                +   ' where (GCODE = :pCODE) and (RDelKbn = 0)');

            if f0CODE.Text = '' then
                ParamByName('pCODE').asString := ''
            else
                ParamByName('pCODE').asString := sCode;
            Open;

            if EOF = FALSE then
            begin
                f1NAME.text := FieldByName('NM').asString;
                m_TRNCode   := FieldByName('NCODE').asFloat;

                // 得意先採用区分取得
                if GetFld('HojyoKbn1').AsInteger = 0 then
                    Result := 1;
            end
            else
                Result := -1;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  名称を取得
//-----------------------------------------------------------------------------
Function TJNTCRP004003F.fnGetNAME(pCODE:String;pMKBN,pAttr:Integer; var RName:String ):Boolean;
var
    Qry :TMQuery;
    lvCode : String;
begin

    Result := FALSE;
    RName  := '';
    lvCODE := '';

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
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;

            if pMKBN      = 22 then                         // 取引先(実在)
            begin
                SQL.Add('select NMK from MTOKUI  ');
                SQL.Add('where   RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode=:strGCode ');
                SQL.Add(' and TemplateKbn = 0');            // <107>
                SQL.Add(' and HojyoKbn1 = 1');
            end

            else if pMKBN      = 221 then                    // 取引先(合計）
            begin
                SQL.Add('select NMK from MTOKUI  ');
                SQL.Add('where   RDelKbn=0 ');
                SQL.Add(' and SumKbn = 1 AND GCode=:strGCode ');
                SQL.Add(' and TemplateKbn = 0');            // <107>
                SQL.Add(' and HojyoKbn1 = 1');
                SQL.Add(' and NykRootKbn = 1');
            end

            else if pMKBN = 25 then                         // 担当者
            begin
                SQL.Add('select  M.SimpleName NMK  from HAPSC H   ');
                SQL.Add('left outer join MOS_OFFICE_STAFF M  on (M.NCODE = H.NCODE)');
                SQL.Add('where (H.GCODE = :strGCode) AND (M.RDelKBN = 0) AND (H.kbn in (1, 3))');
            end
            else if pMKBN = 41 then                         // 部門
            begin
                //SQL.Add('select  SimpleName NMK from HOJYOMA  ');   //<168>
                SQL.Add('select TOP 1 SimpleName NMK from HOJYOMA  ');
                SQL.Add('where  MasterKbn = :MKBN and RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 and GCode=:strGCode ');

                SetFld('MKBN').AsInteger	:= 41;

                //検索エクスプローラから選択した場合およびDBから取得した場合は、内部コードも検索条件とする。
                if m_BumonNcodeEx > 0 then
                begin
                    SQL.Add(' and NCode=:pNCode ');   //<158>
                    SetFld('pNCode').AsFloat := m_BumonNcodeEx;   //<158>
                end else
                //手入力した場合は、適用期間の最新を取得
                begin
                    SQL.Add(' Order By TStartDate Desc ');  //<168>
                end;

            end;
            SetFld('strGCode').AsString	:= lvCODE;

            Open;

            if EOF = FALSE then
            begin
                Result := TRUE;
                RName  := FieldByName('NMK').asString;
            end;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;
end;
//-----------------------------------------------------------------------------
//  内部コードを取得
//-----------------------------------------------------------------------------
Function TJNTCRP004003F.fnGetNCODE(pCODE:String;pMKBN,pAttr:Integer):Extended;
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
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化

            if pMKBN = 22 then  //取引先
            begin
                SQL.Add('SELECT NCODE FROM MTOKUI  ');
                SQL.Add('where  RDelKbn=0 ');
                SQL.Add('  AND  GCode=:strGCode ');
            end
            else if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  M.NCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (H.GCODE = :strGCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then  //部門
            begin
                //SQL.Add('SELECT NCODE FROM HOJYOMA  ');  <168>
                SQL.Add('SELECT TOP 1 NCODE FROM HOJYOMA  ');    //<168>
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode=:strGCode ');
                SQL.Add('ORDER BY TStartDate DESC ');   //<168>
                SetFld('MKBN').AsInteger	:= 41;
            end;
            SetFld('strGCode').AsString	:= lvCODE;

            Open;						// ｸｴﾘの開始

            if EOF = FALSE then
                Result  := FieldByName('NCode').asFloat;

            //<158>部門の場合で、検索EXPを使用した場合は、検索EXPから取得した内部コードを返す
            if (pMKBN = 41) and (m_BumonNcodeEx > 0) then  Result := m_BumonNcodeEx;

        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  外部コード取得
//-----------------------------------------------------------------------------
Function TJNTCRP004003f.fnGetGCODE(pCODE:Extended;pMKBN:Integer):String;
var
    Qry :TMQuery;
begin

    Result := '';


    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;							// ｸｴﾘの初期化
            if pMKBN = 22 then  //取引先
            begin
                SQL.Add('SELECT GCODE FROM MTOKUI ');
                SQL.Add('where  RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
            end
            else if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  H.GCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (M.NCODE = :pCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then   //部門
            begin
                //SQL.Add('SELECT GCODE FROM HOJYOMA  ');  <158>
                SQL.Add('SELECT GCODE,SimpleName FROM HOJYOMA  ');
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= 41;
                m_BumonNcodeEx := pCode;    //<158> DBから取得した部門内部コードを記憶する。(部門名称を正しく取得するため）
            end;
			ParamByName ('pCode').AsFloat  := pCODE;
            Open;						// ｸｴﾘの開始

            if EOF = FALSE then
            begin
                Result := FieldByName('GCODE').asString;
                if  pMKBN = 41   then m_BumonNMkEX :=  FieldByName('SimpleName').asString;   //<158>
            end;

        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
procedure TJNTCRP004003F.f1BunkaiChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

	fnFldOnChg(Sender);

//<148>↓
    if f1Bunkai.value = 0 then  //比率
    begin
        f1KAISYWKIN.Value   := 0;
        f1KAIRITU.enabled   := TRUE;
        f1KAIRITU.Visible   := TRUE;
        f1KAISYWKIN.enabled := FALSE;
        f1KAISYWKIN.Visible := FALSE;

        //KAIJY1Label.Width	:= 100;
        //KAIJY2Label.Width	:= 100;
        KAIJY2Label.Width	:= 124;
        kijyun1Label.Caption := '％';
        kijyun2Label.Caption := '％';
        f1KAIHasu.Enabled := TRUE;
        f1KAIHasuNM.Enabled := TRUE;
        MLabel43.Enabled    := TRUE; //端数処理方法のラベル
        f1KAIRITUChange(f1KAIRITU);
    end
    else
    begin
        f1KAIRITU.Value     := 0;
        f1KAIRITU.enabled   := FALSE;
        f1KAIRITU.Visible   := FALSE;
        f1KAISYWKIN.enabled := TRUE;
        f1KAISYWKIN.Visible  := TRUE;

        //KAIJY1Label.Width	:= 134;
        //KAIJY2Label.Width	:= 134;
        KAIJY2Label.Width	:= 124;
        kijyun1Label.Caption := '未満';
        kijyun2Label.Caption := '以上';
        f1KAIHasu.Enabled := FALSE;
        f1KAIHasuNM.Enabled := FALSE;
        MLabel43.Enabled    := FALSE; //端数処理方法のラベル
        f1KAISYWKINChange(f1KAISYWKIN);
    end
//<148>↑
end;
//=============================================================================
//  名寄せ親代替得意先コードの制御
//=============================================================================
procedure TJNTCRP004003F.cbNykRootKbnClick(Sender: TObject);
begin
    f1SKYKBN.Value		    := 0;
    f1SKYKBNNM.Caption      := '';

    if (uvDaiKbn = TRUE)             and
       (cbNykRootKbn.Checked = TRUE) then
    begin
        SeikyuKbnLabel.Enabled  := TRUE;
        f1SKYKBN.Enabled      	:= TRUE;
        f1SKYKBNNM.Enabled 		:= TRUE;
        f1SKYKBNChange(f1SKYKBN);
    end
    else
    begin
        SeikyuKbnLabel.Enabled  := FALSE;
        f1SKYKBN.Enabled      	:= FALSE;
        f1SKYKBNNM.Enabled 		:= FALSE;
        f1SKYKBNChange(f1SKYKBN);
    end;

end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004003F.ArrowClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;
begin


    CompName := TComponent(Sender).Name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := m_pRec;                         // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @m_cDBSelect;                   // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     := m_cComArea.SystemArea.SysColorD;

    // 得意先
    if (Sender = f0CODE) or (Sender = f1NayoseOyaCode) or (Sender = f2OyaCode) or (Sender = f2KoCode)  then    //<0163>
    begin
        lvExpSend.MasterKbn     := 22;                      // ﾏｽﾀ区分  23から22へ
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO

        if (Sender = f1NayoseOyaCode) then
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 0'
                                 + ' and MTOKUI.TemplateKbn = 0'   // <107>
                                 + ' and MTOKUI.Hojyokbn1 = 1'   // <144>

        else if (Sender = f2OyaCode) then
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 1'
                                 + ' and MTOKUI.TemplateKbn = 0'   // <107>
                                 + ' and MTOKUI.Hojyokbn1 = 1'   // <144>
                                 + ' and NYKRootKbn = 1 '


        else if (Sender = f2KoCode) then
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 0'
                                 + ' and MTOKUI.TemplateKbn = 0'
                                 + ' and MTOKUI.Hojyokbn1 = 1'

        else
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = ' + IntToStr(HedCsTab.Items.Selected)
                                 + ' and MTOKUI.TemplateKbn = 0'  // <107>
                                 + ' and MTOKUI.Hojyokbn1 = 1';   // <144>


        //<146>S 検索はMTOKUI_CRDの住所・電話を対象とする
        lvExpSend.TableName := 'MTOKUI join MTOKUI_CRD on (MTOKUI.NCode = MTOKUI_CRD.BaseNCode)';
        lvExpSend.SearchSection[4].S_Disp := 1;
        lvExpSend.SearchSection[4].S_FieldName := 'MTOKUI_CRD.Tel1';
        lvExpSend.SearchSection[4].S_Caption := '電話番号';

        lvExpSend.SearchSection[5].S_Disp := 0;

        lvExpSend.SearchSection[6].S_Disp := 0;

        lvExpSend.SearchSection[7].S_Disp := 1;
        lvExpSend.SearchSection[7].S_FieldName := 'MTOKUI_CRD.Ads1';
        lvExpSend.SearchSection[7].S_Caption := '住所(上段)';

        lvExpSend.SearchSection[8].S_Disp := 1;
        lvExpSend.SearchSection[8].S_FieldName := 'MTOKUI_CRD.Ads2';
        lvExpSend.SearchSection[8].S_Caption := '住所(下段)';
        //<146>E

    end

    // 部門
    else if Sender = f1BMCODE then
    begin
        lvExpSend.MasterKbn     := 41;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := ' HojyoMA.SumKbn = 0 and HojyoMA.RDelKBN = 0';
    end
    // 担当者
    else if Sender = f1TNCODE then
    begin
        lvExpSend.MasterKbn     := 25;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
//        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
//<146>　担当者が属する部門検索のためPatternNoを3に変更
        lvExpSend.PatternNo     := 3;                       // ﾊﾟﾀｰﾝNO

//        lvExpSend.TBarNM        := LblTNCODE.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//        lvExpSend.TableName     := 'HAPSC';
//        lvExpSend.TrRootCaption := LblTNCODE.Caption;

        // 得意先担当者
        lvExpSend.WhereStr      := ' (kbn in (1, 3)) ';
    end
    // 納品書ﾌｫｰﾑ
    else if Sender = f1USDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ur00''';
    end
    // 請求書ﾌｫｰﾑ
    else if Sender = f1SSDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''se00''';
    end
    // 領収証ﾌｫｰﾑ
    else if Sender = f1RYOPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''ry00''';
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn := fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then
        Exit;

    // 中身あり?
    if Length(Trim(lvExpRecv.GCode))>0 then
    begin
        if      Sender is TMNumEdit then
           TMNumEdit(MJSFindCtrl(Self, CompName)).Value := StrToFloat(lvExpRecv.GCode)
        else if Sender is TMTxtEdit then
           TMTxtEdit(MJSFindCtrl(Self, CompName)).Text  := lvExpRecv.GCode;


        //<122> --- St ---
        if Sender = f0CODE then
            f0CODE.InputFlag := FALSE;


        if Sender = f1NayoseOyaCode then
            f1NayoseOyaCode.InputFlag := FALSE;

        if Sender = f1TNCODE then
            f1TNCODE.InputFlag := FALSE;

        if Sender = f1BMCODE then
        begin
            f1BMCODE.InputFlag := FALSE;
            m_BumonNcodeEx := lvExpRecv.Ncode;  //<158>
            m_BumonNMKEx   := lvExpRecv.Nmk;    //<158>
        end;

        if Sender =  f2OyaCode then           //<0166>
            f2OyaCode.InputFlag := FALSE;

        if Sender =  f2KoCode then           //<0166>
            f2KoCode.InputFlag := FALSE;




        //<122> --- Ed ---

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
		Abort;
    end;
end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ(グリッド用)
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004003F.GridClmBtnClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;

begin
//<143>
//エクスプローラボタンクリックで、名寄せ子に伝票が存在しないかチェック
//存在する場合は、エラーメッセージを出してエクスプローラは軌道しない。
    if  ( MemNayose.State <> dsInsert ) then
    begin
    	//if  fnDenChk(CASE_BTNCLICK) = false  then  <172>
        if  fnDenChk() = false  then
    	begin
        	GridNayose.CloseEditor;
        	MjsSetFocus(Self, GridNayose.Name);
        	Exit;
    	end;
    end;
// <143>		　↑

    if ( GridNayose.FocusedColumn = 2 ) and ( MemNayose.State <> dsInsert ) then
    begin
        Exit;
    end;

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);                          // ﾊﾟﾗﾒｰﾀ初期設定

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    := m_pRec;                      // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        := @m_cDBSelect;                // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        := m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        := m_cComArea.SystemArea.SysColorD;
//  lvExpSend.MasterKbn     := 23;                          // ﾏｽﾀ区分
    lvExpSend.MasterKbn     := 22;                          // ﾏｽﾀ区分

    lvExpSend.ModulKbn      := 0;                           // ﾓｼﾞｭｰﾙ区分
    lvExpSend.PatternNo     := 1;                           // ﾊﾟﾀｰﾝNO
//    lvExpSend.TBarNM        := LblTRCODE.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//    lvExpSend.TableName     := 'MTOKUI';
//    lvExpSend.TrRootCaption := LblTRCODE.Caption;

    case GridNayose.FocusedColumn of
        0:                                                  // 名寄せ親
            lvExpSend.WhereStr := 'Hojyokbn1 = 1 and RDelKBN = 0 and SumKbn = 1 and NYKRootKbn = 1 and TemplateKbn = 0';

        2:                                                  // 名寄せ子
            lvExpSend.WhereStr := 'Hojyokbn1 = 1 and RDelKBN = 0 and SumKbn = 0 and TemplateKbn = 0';
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then
        Exit;

    // 中身あり?
    if Length(Trim(lvExpRecv.GCode))>0 then
    begin
        if lvExpRecv.GCode <> '' then
        begin
            MemNayose.Edit;
            case GridNayose.FocusedColumn of
                0:                                          // 名寄せ親
                begin
                    MemNayoseOyaHojCD.AsString := lvExpRecv.GCode;
                    MemNayoseOyaName.AsString  := lvExpRecv.NMK;
                end;
                2:                                          // 名寄せ子
                begin
                    MemNayoseHojCode.AsString  := lvExpRecv.GCode;
                    MemNayoseSName.AsString	   := lvExpRecv.NMK;
                end
            end
        end;

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
		Abort;
    end;

end;
//-----------------------------------------------------------------------------
//     <100>fnSetFncType
//-----------------------------------------------------------------------------
procedure TJNTCRP004003f.fnSetFncType(pKBN:Integer);
begin

    uvFncInfo.Caption[0] := '';
    uvFncInfo.Caption[1] := '';
    uvFncInfo.Caption[2] := '';
    uvFncInfo.Caption[3] := '';
    uvFncInfo.Caption[4] := '';
    uvFncInfo.Caption[5] := '';

    if (pKBN = 1) and (HedCsTab.Items.Selected = 0) then
        // ｸﾘｱ
        uvFncInfo.Caption[6] := 'F7 ﾃﾝﾌﾟﾚｰﾄ'
    else
        uvFncInfo.Caption[6] := '';

    //uvFncInfo.Caption[7] := '';


    if (HedCsTab.Items.Selected = 1) and
       (not CheckModuleLicense(m_pRec,FXLicense.SEL_HAN)) then  // 正式
       begin
       if m_SimeChkFlg = 0 then
         uvFncInfo.Caption[7] := 'F8 締日制限解除' else uvFncInfo.Caption[7] := 'F8 締日制限';
       end
    else
        uvFncInfo.Caption[7] := '';

    uvFncInfo.Action[0]  := nil;
    uvFncInfo.Action[1]  := nil;
    uvFncInfo.Action[2]  := nil;
    uvFncInfo.Action[3]  := nil;
    uvFncInfo.Action[4]  := nil;
    uvFncInfo.Action[5]  := nil;
// <130>↓ｺﾒﾝﾄｱｳﾄ
{    if uvDispFlg = 1 then
        uvFncInfo.Action[6]  := nil
    else
}
// <130>
    uvFncInfo.Action[6]  := AcTemplate;
    uvFncInfo.Action[7]  := AcCloseDay;   //<157>

end;



//-----------------------------------------------------------------------------
//     ファンクションでの処理　<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin

    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
        uvFncInfo.Action[FuncNo-1].Execute;

end;

//-----------------------------------------------------------------------------
//     ファンクションの処理実行　<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.AcTemplateExecute(Sender: TObject);
begin

    if uvTempFlg then
    begin
       uvTempFlg := FALSE
    end
    else
    begin
        uvTempFlg   := TRUE;
        f0CODE.Text := '';
        f1NAME.Text := '';

        fnChkTRCODE;
        fnRecGet(f0CODE.text);

        //if f1POSTNO1.Enabled = FALSE then  <153>
            //Exit;
// <130>↓
        //MjsSetFocus(Self, 'f1SSDENPFM');
        //MjsSetFocus(Self, 'f1RYOPFM');

        if f1SSDENPFM.CanFocus then
            MjsSetFocus(Self, 'f1SSDENPFM')
        else                                // 権限で入力できない場合は取消ﾎﾞﾀﾝへ
            MjsSetFocus(Self, 'MBitBtnCancel');
// <130>↑
    end;

    TempMode.Visible := uvTempFlg;
//<Account> ADD St
    DtlCsTab.Items[DTLTAB_DENSHI].Visible := (uvTempFlg = False);
    DtlCsTab.Items[DTLTAB_ACCOUNT].Visible := (uvTempFlg = False);
//<Account> ADD Ed
    DtlCsTab.Items[DTLTAB_GAIKA].Visible := (GaikaBaseUseKbn > 0);  //<GAIKA_1> ADD
end;
//-----------------------------------------------------------------------------
//     ファンクションの処理実行　<157>
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.AcCloseDayExecute(Sender: TObject);
var
    iValue  : Integer;
begin
    if (uvFncInfo.Caption[7] = 'F8 締日制限') then
    begin
        if fnNayoseExist() then
        begin
            MjsMessageBox(Self,'名寄せデータが存在するため設定できません。',mjInformation,mjDefOK);
            Exit;
        end;

        //TODO　 メッセージを変更する
        MjsMessageBox(Self,'締日の一致した取引先同士でのみ名寄せ設定が可能となります。'#13#10
                        + '今後、売上伝票データを処理することが可能となります。'
                        ,mjInformation,mjDefOK);
        fnUpdCrdSysInfo(0);
    end
    else
    begin
        iValue := MjsMessageBoxEX(Self,'締日の整合性に関わらず名寄せの設定を行うことができるようになります。'#13#10
                                    + '今後、売上伝票データを処理することができなくなりますが、よろしいですか？',
                                    '確認',mjQuestion,mjYesNo,mjDefNo);
        if iValue = mrYes then
        begin
            MjsMessageBoxEX(Self,'この設定により、売上伝票関係の処理を行えなくなります。','警告',mjWarning,mjOK,mjDefOK);
            fnUpdCrdSysInfo(1);
        end;
    end;
    fnSetFncType(0);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
end;


//-----------------------------------------------------------------------------
//     ファンクションボタンの表示・非表示<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f0CODEExit(Sender: TObject);
begin

    fnSetFncType(0);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

end;

//-----------------------------------------------------------------------------
//  代替コードを変更時には代替情報を更新する（親子フラグ、請求区分、請求先内部コード）<101>
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnSetDaigaiData(pNCD, pDaiNCD: Extended);
var
    DmqData     : TMQuery;
    lvOldDaiNCD : Extended;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>


begin

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社
//↑<Rel>

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    //m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData ); <Rel>
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );

    try
    	with DmqData do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add('select NknNCode                '
                +   'from CrdNayoseInfo             '
    		    +   'where (MasterKbn      = 22)    '
                +   '  and (NayoseSyu      = 1)     '
                +   '  and (NayoseKbn      = 1)     '
                +   '  and (NayoseOyaNCode = :pNCD) ');
// <112>               +   'where (MasterKbn = 22)    '
// <112>               +   '  and (NayoseSyu = 1)     '
// <112>               +   '  and (NayoseKbn = 2)     '
// <112>               +   '  and (NknNCode  = :pNCD) ');

    		ParamByName('pNCD').AsFloat := pNCD;	        // 名寄せ親入金先内部ｺｰﾄﾞ
            Open;

            // 一括請求⇒各店別請求へ（代替コードを未入力にした場合）
            if f1NayoseOyaCode.text = '' then
            begin
                // 各店別請求　親
                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 11, 2, False, False) = FALSE) then
                    Abort;

//<121>                lvOldDaiNCD := fnGetNCODE(uvDaiGaeCode, 22, m_TrCodeAttr);
//<121>                // 各店別請求　代替
//<121>                if (fnUpDateMTokui_SelInfo(lvOldDaiNCD, lvOldDaiNCD, 0, 1) = FALSE) then
//<121>                    Abort;

            end
            else
            begin
                // 一括請求　親
                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 1, 1, False, False) = FALSE) then
                    Abort;

                // 一括請求　代替
                if (fnUpDateMTokui_SelInfo(pDaiNCD, pNCD, 3, 1, False, False) = FALSE) then
                    Abort;
            end;

            lvOldDaiNCD := fnGetNCODE(uvDaiGaeCode, 22, m_TrCodeAttr);
            // 各店別請求　代替
            if (fnUpDateMTokui_SelInfo(lvOldDaiNCD, lvOldDaiNCD, 0, 1, False, False) = FALSE) then
                Abort;


            // 内容が変更された親の子供分ﾙｰﾌﾟ
    		while not Eof do
    		begin
                // 一括請求⇒各店別請求へ（代替コードを未入力にした場合）
                if f1NayoseOyaCode.text = '' then
                begin
                    // 各店別請求　子
                    if (fnUpDateMTokui_SelInfo(FieldByName('NknNCode').AsFloat, pNCD, 12, 2, False, False) = FALSE) then
                        Abort;
                end
                else
                begin
                    // 一括請求　子
                    if (fnUpDateMTokui_SelInfo(FieldByName('NknNCode').AsFloat, pNCD,  2, 1, False, False) = FALSE) then
                        Abort;
                end;

                Next;
    		end;

            Close;
    	end;
    finally
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// BChangeClick()   <120>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.BChangeClick(Sender: TObject);
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

//-----------------------------------------------------------------------------
// evtGridNayoseKeyPress <125>
//  < 名寄せｸﾞﾘｯﾄﾞのKeyPressｲﾍﾞﾝﾄ >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.evtGridNayoseKeyPress(Sender: TObject;
  var Key: Char);
begin
                                            // ｺｰﾄﾞｶﾗﾑ


	if (TdxDBGrid(Sender).FocusedColumn = 0) or (TdxDBGrid(Sender).FocusedColumn = 2) then
	begin
		if m_TRCodeAttr <= 1 then
		begin
			if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) and (Key <> #13) then
			begin                          // #8=BackSpace   #27=Esc  #9=Tab #13=Enter
				Beep ();
				Abort;
			end else
            begin
                if  ((Key <> #27) and (Key <> #9) and (Key <> #13)) then //<0172>
                begin
                    if fnDenChk() = False then
                    begin
                        Abort;
                    end;
                end;
            end;
		end;
	end;


end;

//-----------------------------------------------------------------------------
// DtlCsTabChange <136>
//  < 基本情報／入金情報タブ変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.DtlCsTabChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

    if ( m_bFirstFlag = FALSE ) then Exit;

    DtlCsTab.SetFocus;
//<KEY> DEL St
{
    if ( DtlCsTab.Items.Selected = 0 ) then
            DtlCsTab.Items.Selected := 0
    else    DtlCsTab.Items.Selected := 1;

    if ( DtlCsTab.Items.Selected = 0 ) then
            DtlCsTab.Items.Selected := 0
    else if ( DtlCsTab.Items.Selected = 1 ) then
            DtlCsTab.Items.Selected := 1
    else if ( DtlCsTab.Items.Selected = 2 ) then
            DtlCsTab.Items.Selected := 2
    else    DtlCsTab.Items.Selected := 3;
}
//<KEY> DEL Ed
	// ﾎﾞﾀﾝEnabled制御処理
    fnBtnEnbChg;

//<DENSHI> ADD St
    // 削除ボタンの制御
    if (DtlCsTab.Items.Selected = DTLTAB_DENSHI) then
    begin
//<187> DEL St
{
        B_Delete.OnClick := BDenshiDeleteClick;
}
//<187> DEL Ed

        // 取引先が読み込まれていない場合は画面初期化
        if m_TRNCode = 0 then
        begin
            fnInzformDenshi();
        end;
    end
//<Account> ADD St
    else if (DtlCsTab.Items.Selected = DTLTAB_ACCOUNT) then
    begin
//<187> DEL St
{
        B_Delete.Enabled :=
            Assigned(moAccCsInfo) and m_JNTAuthority.IsDelete();
        B_Delete.OnClick := BAccountDeleteClick;
}
//<187> DEL Ed

        // 取引先が読み込まれていない場合は画面初期化
        if m_TRNCode = 0 then
        begin
            fnInzformAccount();
        end;
        // 口座振替NOが入っている場合編集可能にする
        pnlAccountDetail.Enabled := (numKoufuriNo_Account.AsInteger <> 0);
    end
//<Account> ADD Ed
    else
    begin
//<187> DEL St
{
        B_Delete.Enabled := false;
        B_Delete.OnClick := BDeleteClick;
}
//<187> DEL Ed
    end;
//<DENSHI> ADD Ed

//<187> ADD St
	//削除ボタンの制御
	ControlDeleteButton
//<187> ADD Ed
end;

//-----------------------------------------------------------------------------
// f1KAIRITUChange
//  < 基本情報／回収割合（率）変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f1KAIRITUChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

	fnFldOnChg(Sender);

    if f1KAIRITU.value = 100 then  //比率
    begin
        f1KAIJY2.enabled := FALSE;
        f1KAIJYNM2.enabled := FALSE;
        //回収種別　未満に値が設定されていれば反映させる
        f1KAIJY2.Value := f1KAIJY1.Value;
        f1ItemsCheak(f1KAIJY2);

        KAIJY1Label.Caption := FormatFloat('##0.00', f1KAIRITU.Value) + ' ％';
        KAIJY2Label.Caption := '';
    end
    else
    begin
        f1KAIJY2.enabled := TRUE;
        f1KAIJYNM2.enabled := TRUE;
		if f1KAIRITU.Value = 0 then
        begin
	        KAIJY1Label.Caption := '％';
	        //KAIJY2Label.Caption := '％';
	        KAIJY2Label.Caption := '';      //<0626>
        end
        else
        begin
	        KAIJY1Label.Caption := FormatFloat('##0.00', f1KAIRITU.Value) + ' ％';
	        //KAIJY2Label.Caption := FormatFloat('##0.00', 100 - f1KAIRITU.Value) + ' ％';
	        KAIJY2Label.Caption := FormatFloat('##0.00', 100 - f1KAIRITU.Value) + '';
        end;
    end
end;

//-----------------------------------------------------------------------------
// f1SKYKBNChange
//  < 基本情報／請求区分変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f1SKYKBNChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

    fnFldOnChg(Sender);

    if f1SKYKBN.value = 1 then  //親一括請求一括入金
    begin
        NayoseOyaLabel.Enabled  := TRUE;
        f1NayoseOyaCode.enabled	:= TRUE;
        f1NayoseNM.enabled 		:= TRUE;
    end
    else
    begin
        if ( m_TRCodeAttr <> 2 ) then
        begin
            if ( f1NayoseOyaCode.InputFlag = FALSE ) then
                    f1NayoseOyaCode.Zero    :=  TRUE
            else    f1NayoseOyaCode.Zero    :=  FALSE;
        end
        else
            f1NayoseOyaCode.Zero := FALSE;
        f1NayoseOyaCode.InputFlag	:= True;
        f1NayoseOyaCode.Text		:= '';

        f1NayoseNM.Caption			:= '';

        NayoseOyaLabel.Enabled  := FALSE;
        f1NayoseOyaCode.enabled	:= FALSE;
        f1NayoseNM.enabled		:= FALSE;
    end
end;

//-----------------------------------------------------------------------------
// f1KAISYWKINChange
//  < 基本情報／回収割合（金額）変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f1KAISYWKINChange(Sender: TObject);
begin
	if not m_FormCreateSw then Exit;

	fnFldOnChg(Sender);
    if f1KAISYWKIN.Value = 0 then  KAIJY2Label.Caption := ''
    else
    begin
    	KAIJY1Label.Caption := FormatFloat('##,###,###,##0', f1KAISYWKIN.Value) + '円 未満';
    	//KAIJY2Label.Caption := FormatFloat('##,###,###,##0', f1KAISYWKIN.Value) + '円 以上'; //<0626>
    	KAIJY2Label.Caption := FormatFloat('##,###,###,##0', f1KAISYWKIN.Value) ;
    end;
end;


//-----------------------------------------------------------------------------
// fnGetMTOKUI_Info
//
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnGetMTOKUI_Info(sNCode: Extended): Integer;
type
    RSimeInfo = record
        REndKaisu		:	Integer;
        RCloseDay1		:	Integer;
        RCloseDay2		:	Integer;
        RCloseDay3		:	Integer;
        RcvMonth1		:	Integer;
        RcvMonth2		:	Integer;
        RcvMonth3		:	Integer;
        RcvDay1			:	Integer;
        RcvDay2			:	Integer;
        RcvDay3			:	Integer;
        RHolidayKbn1	:	Integer;
        RHolidayKbn2	:	Integer;
        RHolidayKbn3	:	Integer;
        TrSeiKbn		:	Integer;
    end;
var
//<Rel>
    Qry : TMQuery;
    Daitai, Goukei : RSimeInfo;
    nCount : Integer;

    function GetSimeInfo(sNCode: Extended):RSimeInfo;
	var
	    Qry : TMQuery;
    begin
        Result.REndKaisu    := 0;	// 締日回数
        Result.RCloseDay1  	:= 0;   // 締日1
        Result.RCloseDay2  	:= 0;   // 締日2
        Result.RCloseDay3  	:= 0;   // 締日3
        Result.RcvMonth1  	:= 0;	// ｻｲｸﾙ1
        Result.RcvMonth2  	:= 0;	// ｻｲｸﾙ2
        Result.RcvMonth3  	:= 0;	// ｻｲｸﾙ3
        Result.RcvDay1 		:= 0;	// 回収日1
        Result.RcvDay2 		:= 0;	// 回収日2
        Result.RcvDay3 		:= 0;	// 回収日3
        Result.RHolidayKbn1	:= 0;	// 休日区分1
        Result.RHolidayKbn2	:= 0;	// 休日区分2
        Result.RHolidayKbn3	:= 0;	// 休日区分3
        Result.TrSeiKbn		:= 0;

        // 親の〆情報と同じか
        Qry := Nil;
        try

            Qry := TMQuery.Create(Self);
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);

            with (Qry) do
            begin
                Close;
                SQL.Clear;
                SQL.Add('select                    '
                    +   '    REndKaisu             '	        		// 締日回数
                    +   '   ,RCloseDay1            '	        		// 締日1
                    +   '   ,RCloseDay2            '	        		// 締日2
                    +   '   ,RCloseDay3            '            		// 締日3
                    +   '   ,RcvMonth1             '            		// ｻｲｸﾙ1
                    +   '   ,RcvMonth2             '            		// ｻｲｸﾙ2
                    +   '   ,RcvMonth3             '            		// ｻｲｸﾙ3
                    +   '   ,RcvDay1               '            		// 回収日1
                    +   '   ,RcvDay2               '            		// 回収日2
                    +   '   ,RcvDay3               '            		// 回収日3
                    +   '   ,Isnull(RHolidayKbn1,0) as RHolidayKbn1 ' 	// 休日区分1
                    +   '   ,Isnull(RHolidayKbn2,0) as RHolidayKbn2 ' 	// 休日区分2
                    +   '   ,Isnull(RHolidayKbn3,0) as RHolidayKbn3 ' 	// 休日区分3
                    +   '   ,TrSeiKbn              '            		// 取引先請求区分
                    +   'from MTOKUI               '
                    +   '     left outer join MTOKUI_SEL se         '
                    +   '     on (BaseNCode = NCode and RecKBN = 1) '
                    +   'where RDelKbn   = 0     '
                    +   '  and HojyoKbn1 = 1     '
                    +   '  and NCode = :NCode    ');
                ParamByName('NCode').AsFloat := sNCode;

                Open;

                Result.REndKaisu  	:= FieldByName('REndKaisu'	 ).AsInteger;	// 締日回数
                Result.RCloseDay1  	:= FieldByName('RCloseDay1'	 ).AsInteger;   // 締日1
                Result.RCloseDay2  	:= FieldByName('RCloseDay2'	 ).AsInteger;   // 締日2
                Result.RCloseDay3  	:= FieldByName('RCloseDay3'	 ).AsInteger;   // 締日3
                Result.RcvMonth1  	:= FieldByName('RcvMonth1'	 ).AsInteger;	// ｻｲｸﾙ1
                Result.RcvMonth2  	:= FieldByName('RcvMonth2'	 ).AsInteger;	// ｻｲｸﾙ2
                Result.RcvMonth3  	:= FieldByName('RcvMonth3'	 ).AsInteger;	// ｻｲｸﾙ3
                Result.RcvDay1 		:= FieldByName('RcvDay1'	 ).AsInteger;	// 回収日1
                Result.RcvDay2 		:= FieldByName('RcvDay2'	 ).AsInteger;	// 回収日2
                Result.RcvDay3 		:= FieldByName('RcvDay3'	 ).AsInteger;	// 回収日3
                Result.RHolidayKbn1 := FieldByName('RHolidayKbn1').AsInteger;	// 休日区分1
                Result.RHolidayKbn2 := FieldByName('RHolidayKbn2').AsInteger;	// 休日区分2
                Result.RHolidayKbn3	:= FieldByName('RHolidayKbn3').AsInteger;	// 休日区分3
            	Result.TrSeiKbn		:= FieldByName('TrSeiKbn'	 ).AsInteger;
            end;
        finally
            Qry.Close;
            Qry.Free;
        end;
    end;
begin
	Result := 0;

    // 名寄せデータが存在しているか
    Qry := Nil;
    try
        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select count(*) as CNT '
                +	'from  CRDNayoseInfo '
                +   'where (MasterKbn = 22 ) '
                +   '  and (NayoseSyu = 1  ) '
                +   '  and (NayoseKbn = 1  ) '
                +   '  and (NayoseOyaNCode = :NCode) ');
            ParamByName('NCode').AsFloat := m_TRNCode;

            Open;

            nCount := GetFld('CNT').AsInteger;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

    // 親の〆情報と同じか
    Daitai := GetSimeInfo(sNCode);
	Goukei := GetSimeInfo(m_TRNCode);

    if Daitai.TrSeiKbn <> 0 then
    begin
        // 通常請求以外の場合はｴﾗｰとする
        Result := -2;
        if m_SimeChkFlg = 1 then Result := 0; //<142> 締日チェック不要の場合は、エラーとしない。
        Exit;
    end;

    // 名寄せが存在しない場合は取得しない
    if nCount = 0 then
    	Exit;

    if ( Daitai.REndKaisu    <> Goukei.REndKaisu    ) or
       ( Daitai.RCloseDay1   <> Goukei.RCloseDay1   ) or
       ( Daitai.RCloseDay2   <> Goukei.RCloseDay2   ) or
       ( Daitai.RCloseDay3   <> Goukei.RCloseDay3   ) or
       ( Daitai.RcvMonth1  	 <> Goukei.RcvMonth1    ) or
       ( Daitai.RcvMonth2  	 <> Goukei.RcvMonth2    ) or
       ( Daitai.RcvMonth3  	 <> Goukei.RcvMonth3    ) or
       ( Daitai.RcvDay1 	 <> Goukei.RcvDay1      ) or
       ( Daitai.RcvDay2 	 <> Goukei.RcvDay2      ) or
       ( Daitai.RcvDay3 	 <> Goukei.RcvDay3      ) or
       ( Daitai.RHolidayKbn1 <> Goukei.RHolidayKbn1 ) or
       ( Daitai.RHolidayKbn2 <> Goukei.RHolidayKbn2 ) or
       ( Daitai.RHolidayKbn3 <> Goukei.RHolidayKbn3 ) then
    begin
        Result := -3;
        if m_SimeChkFlg = 1 then Result := 0; //<142> 締日チェック不要の場合は、エラーとしない。
        Exit;
    end;
end;

//-----------------------------------------------------------------------------
// GridNayoseCustomDraw()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.GridNayoseCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
var
	nCol1, nCol2: Integer;
	nCode1, nCode2: Extended;
begin
	if not MemNayose.Active then Exit;
    if MemNayose.RecordCount = 0 then Exit;
	if ANode.HasChildren then Exit;
    if AFocused then Exit;

	with Sender as TdxDBGrid do
    begin
	    nCol1 := ColumnByFieldName('NknNCode').Index;
	    nCol2 := ColumnByFieldName('CngNCode').Index;
	end;

	if not VarIsNull(ANode.Values[nCol1]) then
    begin
	    nCode1 := Extended(ANode.Values[nCol1]);
	    nCode2 := Extended(ANode.Values[nCol2]);

	    if nCode1 = nCode2 then
	        AColor := $00F2F2F2;
    end;
end;

//-----------------------------------------------------------------------------
//  FBデータ使用可能文字チェック
//		True :無効文字あり
//		False:無効文字なし
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnChkInvalidFBChar(const aText: String): Boolean;
var
	nLoc : Integer;
	cText : String;
    cChar : Char;
begin
	Result := True;

	cText := aText;
	for nLoc := 1 to Length(cText) do
    begin
    	cChar := cText[nLoc];

    	case cChar of
        	'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')','*' :    //<185>
	        begin
	        end;
            'ｧ': cChar := 'ｱ';
            'ｨ': cChar := 'ｲ';
            'ｩ': cChar := 'ｳ';
            'ｪ': cChar := 'ｴ';
            'ｫ': cChar := 'ｵ';
            'ｬ': cChar := 'ﾔ';
            'ｭ': cChar := 'ﾕ';
            'ｮ': cChar := 'ﾖ';
            'ｯ': cChar := 'ﾂ';
            '{': cChar := '(';
            '[': cChar := '(';
            '}': cChar := ')';
            ']': cChar := ')';
            'ｰ': cChar := '-';
            '､': cChar := ',';
            '｡': cChar := '.';
            ' ': cChar := ' ';
            'a'..'z': cChar := Chr(Ord(cChar) - 32);
            else
            begin
                Exit;
            end;
        end;

    	cText[nLoc] := cChar;
    end;

	Result := False;
end;


//**********************************************************************
//*     Proccess	:fnSimeNoChk関数　<142>
//*　　 True :締め日チェックなし（神鋼対応）　 iniファイル版
//* 	False:締め日チェックあり（標準モード）
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004003F.fnSimeChk(): Boolean;

const
    CRD_FileName			= 'JNT\PRG\JNTCRP004003.ini';
var
    cPath, cFileName, cText : String;
    oIniFile : TIniFile;
    nKBN : Integer;

begin
    Result := False; //デフォルト


    //実行ファイルのパス取得(Iniファイルも同じフォルダに必要)
    cPath := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot;
    if not IsPathDelimiter(cPath, Length(cPath)) then cPath := cPath + '\';

    cFileName := cPath + CRD_FileName;

    //個別用Iniファイルが存在しなければ、標準のモード。
    if  not FileExists(cFileName) then
        Result := False

        else
        begin
        	oIniFile := Nil;
			try
            	oIniFile := TIniFile.Create(cFileName);
            	cText := oIniFile.ReadString('NAME_Section', 'LABEL_NAME', '締日チェック不要版');
            	nKBN := oIniFile.ReadInteger('CRD_Section', 'NOCHECK', 0);
                //INIファイルが存在してかつ区分が1の場合は、名寄せ時の締め日チェックをしないモードに変更。
            	if  nKBN = 1 then
                 begin
                 	Result := true;
                    CmnStatusBar.SimpleText := cText;
                 end;
            finally
            	if Assigned(oIniFile) then oIniFile.Free;
    		end;
        end;
end;

//**********************************************************************
//*     Proccess	:fnSimeNoChk関数　<157>
//*　　 True :締め日チェックなし（）　  //CRDSYSINFO版
//* 	False:締め日チェックあり（標準モード）
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004003F.fnSimeChk2(): Boolean;

var
    Qry         :	TMQuery;
    nCount		:	Integer;

begin

    Result := False;
    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            //SQL.Add('select Count(*) CNT from CrdSysinfo WHERE ItemID = 400301 AND SysKbn = 1');
            //1は、プログラムからの標準での登録。2は個別対応用
            SQL.Add('select Count(*) CNT from CrdSysinfo WHERE ItemID = 400301 AND SysKbn >= 1');
            Open;
            nCount := GetFld('CNT').AsInteger;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;
        
    if (nCount = 1)  then
    begin
       Result := True;
       CmnStatusBar.SimpleText := CmnStatusBar.SimpleText + '締日制限解除モード ';
    end;
end;

//**********************************************************************
//*     Proccess	:請求区分カスタマイズチェック関数　<175>
//*　　 True :カスタマイズあり
//* 	False:カスタマイズなし（標準モード）
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004003F.fnChkSeikyuKbn(): Boolean;

var
    Qry         :	TMQuery;
    nCount		:	Integer;

begin

    Result := False;
    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    Try
        with Qry do
        begin
            Close;
            SQL.Clear;
            //400302はカスタマイズ対応（各店別請求親一括入金とする）
            SQL.Add('select Count(*) CNT from CrdSysinfo WHERE ItemID = 400302 AND SysKbn >= 1');
            Open;
            nCount := GetFld('CNT').AsInteger;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

    if (nCount = 1)  then
    begin
       Result := True;
       CmnStatusBar.SimpleText := '各店別請求親一括入金モード/';
    end;
end;

//**********************************************************************
//*     Proccess	:fnNayoseExist関数　<157>
//*　　 True :名寄せあり
//* 	False:名寄せなし
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004003F.fnNayoseExist(): Boolean;

var
    Qry         :	TMQuery;
    nCount		:	Integer;

begin

    Result := False;
    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    with Qry do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select Count(*) CNT from CRDNayoseInfo WHERE RDelKbn = 0');
        Open;
        nCount := GetFld('CNT').AsInteger;
    end;
    Qry.Close;
    if (nCount >= 1)  then
    begin
       Result := True;
    end;
end;



//-----------------------------------------------------------------------------
// fnUpdCRDSysInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ締日制限解除区分 CRDSysInfo(ItemID: 400301)の更新
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnUpdCrdSysInfo(iKbn: Integer): Boolean;
var
    dqMasterInfo : TMQuery;
    strSQL       : String;

begin
    Result  := True;
    // MQueryの構築
    dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

	//SessionPractice(C_ST_PROCESS);				// <158>

    try
        with dqMasterInfo do
        begin
            Close();
            SQL.Clear();

            //削除
            strSQL := ' Delete From CrdSysInfo '
                    + ' WHERE ItemID = 400301 ';

            SQL.Add(strSQL);

            if ( not ExecSQL() ) then
            begin
                Result  := False;
            end;

                        Close();
            //追加
            SQL.Clear();
            strSQL := ' Insert Into CrdSysInfo(BaseNcode,ItemID,ItemType,SysKbn) '
                    //+ ' DataNum = ' + IntToStr(iKbn)
                      + ' Values (0,400301,0, '  + IntToStr(iKbn)  + ')';

            SQL.Add(strSQL);

            if ( not ExecSQL() ) then
            begin
                Result  := False;
            end;

            m_SimeChkFlg :=  iKbn;
        end;
    finally
		//SessionPractice(C_ED_PROCESS);			// <158>
        dqMasterInfo.Close();
        dqMasterInfo.Free();
    end;
end;




//**********************************************************************
//*		Proccess	:	子得意先の名寄せ変更チェック <143>
//*		Date		:	2006/11/21
//*		Return		:	TRUE 　変更可
//*　                   FALSE  変更不可
//*		History		:
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
//function TJNTCRP004003F.fnDenChk(iFlg: Integer): Boolean;
function TJNTCRP004003F.fnDenChk(): Boolean;
var
	strHojCode  :   String;
	strMessage  :   String;
    sNknNCode   :   Extended;
    sOyaNCode   :   Extended;
    sCngNCode   :   Extended;
    Bol			:	Boolean;
    //<Rel>
    Qry         :	TMQuery;
    nCount		:	Integer;
    //nCount2		:	Integer;
    iRetCd      :	Integer;


{$I JNTSProcUtil.inc}
begin
    Result := True;
    strHojCode  :=  '';
    strMessage  :=  '';
    sNknNCode   :=  0;
    sOyaNCode   :=  0;
    sCngNCode   :=  0;

    // CASE_CODEINPUT(定数0）：コードを直接入力した場合
    // CASE_BTN_CLICK(定数1）：エクスプローラボタンをクリックした場合
{
<172>
    if iflg = CASE_CODEINPUT then
    begin
        //同じコードの場合（元に戻した場合）は、チェックしない。
    	if m_AfterSave.sOyaCD = GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString then
    	begin
        	exit;
    	end;
    end;
<172>
}    

	if ( Screen.ActiveControl.Name = GridNayose.Name ) then
	begin
		strHojCode  :=  GridNayose.DataSource.DataSet.FieldByName('HojCode')  .AsString;
		strMessage  :=  GridNayose.DataSource.DataSet.FieldByName('SName')    .AsString;
        sNknNCode   :=  GridNayose.DataSource.DataSet.FieldByName('NknNCode') .AsFloat;
        sOyaNCode   :=  GridNayose.DataSource.DataSet.FieldByName('OyaNCode') .AsFloat;
        sCngNCode   :=  GridNayose.DataSource.DataSet.FieldByName('CngNCode') .AsFloat;
	end;

    // 選択ﾚｺｰﾄﾞの変更が可能かﾁｪｯｸ
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);

	// 得意先
    // PRC_MA0130_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
    if  (sOyaNCode = 0) or (sNknNCode = 0) then exit;  //コードが0の場合は不要
    with StdProc3 do
    begin
		BeginExecProc(StdProc3, False);
		try
        //得意先が名寄せ親代替得意先の場合は名寄せ親でチェックする
    	if  sNknNCode = sCngNCode then
	        ParamByName('@pTRNCD')  .AsFloat:=  sOyaNCode
        else
	        ParamByName('@pTRNCD')  .AsFloat:=  sNknNCode;
        	ParamByName('@pSDYMD')  .AsDateTime :=  uvSelSys.GetOKstDymd;
        	ParamByName('@pEDYMD')  .AsDateTime :=  uvSelSys.GetOKedDymd;
        	ParamByName('@pSNYM')   .AsInteger  :=  uvSelSys.GetOKstNym;
        	ParamByName('@pENYM')   .Asinteger  :=  uvSelSys.GetOKedNym;
        	ExecProc();
        finally
        EndExecProc(StdProc3);
        end;
        	Bol :=  (ParamByName('@RETURN_VALUE').AsInteger = 0);
            Close;
    end;
    //if ( not Bol ) <159>
    if ( not Bol ) and (m_SimeChkFlg <> 1) then  //<159>
    begin
        MjsMessageBox(Self, 'この得意先は伝票が入力済みなので'#13#10
                        + '名寄せ情報を変更できません。', mjInformation, mjDefOk);
        Result := False;

    end;

{<176> ストアド化
    // 得意先に回収予定データが存在している場合は変更不可 <170>
    Qry := TMQuery.Create(Self);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select TOP 1 CSNCode from CRD_KAIYOTEIT '	  		    );
            SQL.Add('    where CSNCode = :pCSNCode and RDelKbn = 0 '	);
            ParamByName('pCSNCode').AsFloat :=   sNknNCode;

            Open;

            if not (EOF) then
            begin
                MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ設定はできません。'#13#10
                    + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態にしてください。', mjInformation, mjDefOk);
                Result := FALSE;
                Exit;
            end;
        end;
    finally
        Qry.Close;
        Qry.Free();
    end;

    // 得意先に入金データが存在している場合は名寄せ変更不可  <170>
    Qry := TMQuery.Create(Self);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);

    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select TOP 1 CSNCode from CRD_NYUKINT '	  		);
            SQL.Add('    where CSNCode = :pCSNCode and RDelKbn = 0 '	);
            ParamByName('pCSNCode').AsFloat :=   sNknNCode;

            Open;
            if not (EOF) then
            begin
                MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ設定はできません。'#13#10
                    + '名寄せ設定を行うには消込中のデータを削除または未抽出の状態にしてください。', mjInformation, mjDefOk);
            end;
        end;
    finally
        Qry.Close;
        Qry.Free();
    end;
<176>}

//↓ ストアド化

    // 得意先に回収予定データが存在している場合は名寄せ変更不可（名寄せグリッドで親請求先の変更）
    //Qry := TMQuery.Create(Self);
    //m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProcCRD_CHK_NAYOSE);  //全社でチェック
    try
        // StdProcCRD_CHK_NAYOSE
        with StdProcCRD_CHK_NAYOSE do
        begin
			BeginExecProc(StdProcCRD_CHK_NAYOSE, False);
			try
            ParamByName('@pCSNCode').AsFloat := sNknNCode;
            ExecProc;
            finally
            EndExecProc(StdProcCRD_CHK_NAYOSE);
            end;
            iRetCd := ParamByName('@RetCd').AsInteger;
        end;

        if (iRetCd = NG_BY_KAIYOTEIDATA) then
        begin
            MjsMessageBox(Self, 'この得意先には消込中の回収予定データが存在するため名寄せ変更できません。'#13#10
                        + #13#10
                        + '名寄せ変更を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                        + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
            Result := FALSE;
            Exit;
        end;

        if (iRetCd = NG_BY_NYUKINDATA) then
        begin
            MjsMessageBox(Self, 'この得意先には消込中の入金データが存在するため名寄せ変更できません。'#13#10
                        + #13#10
                        + '名寄せ変更を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                        + '処理中データを削除して名寄せ変更後に再抽出・再入力してください。', mjInformation, mjDefOk);
            Result := FALSE;
            Exit;
        end;

        if (iRetCd = NG_BY_KOUFURIDATA) then
        begin
            MjsMessageBox(Self, 'この得意先には処理中の口座振替データが存在するため名寄せ変更できません。'#13#10
                        + #13#10
                        + '名寄せ変更を行うには、処理を完了して自動仕訳作成・次回更新を行うか'#13#10
                        + '処理中データをクリアしてください。', mjInformation, mjDefOk);
            Result := FALSE;
            Exit;
        end;

        if (iRetCd = CONFIRM_BY_KAIYOTEIDATA) then
        begin
            MjsMessageBox(Self, 'この得意先には回収予定データが存在するため名寄せ変更できません。'#13#10
                        + #13#10
                        + '名寄せ変更を行うには、名寄せを削除して新しい名寄せ親で再登録してください。', mjInformation, mjDefOk);
            Result := FALSE;
            Exit;
        end;

    finally
        //
    end;
//<176>ストアド化↑


//<Rel>ST
    if ( m_SyncMaster.m_flgGrpCorp = 0 ) then
    begin
        // 子社に配信済みの名寄せ情報は変更不可とする
        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select Count(NknNCode) CNT from CRDNayoseInfo_Rel');
            SQL.Add('where NknNCode = :pCODE');
            SQL.Add(' And RDelKbn_REL = 0 ');
            ParamByName('pCODE').AsFloat := sNknNCode;
            Open;
            nCount := GetFld('CNT').AsInteger;
        end;
        Qry.Close;


        if (nCount > 0)  then
        begin
        MjsMessageBox(Self, 'この得意先は子会社で使用しているため'#13#10
                        + '名寄せ情報を変更できません。', mjInformation, mjDefOk);
           Result := False;
        end;
    end;
//<Rel>ED

end;




//**********************************************************************
//*		Proccess	:	回収方法の登録チェック <148>
//*		Date		:	2007/07
//*		Return		:	なし
//*　
//*		History		:
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004003F.PkaisyuHouhouExit(Sender: TObject);
var
	Sname		:	String;

begin


//<173> DEL    if DtlCsTab.items.selected = 0 then
//<173> DEL       DtlCsTab.Items.Selected := 1;

	SName		:=  Screen.ActiveControl.Name;

    if m_bEndFlg   =  TRUE then Exit;

    if  SName =  'MBitBtnCancel' then Exit;

    if  SName =  '' then Exit;


    if f1Bunkai.Value = 0 then //率の場合のチェック
    begin
    	//回収種別1が入力済みなのに、分解基準値が0
		if (f1KAIJY1.Value <> 0) and (f1KAIRITU.Value = 0)  then
    	begin
        	MjsMessageBox(Self, '分解基準値１が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIRITU.SetFocus;
    	end;

    	//回収種別2が入力済みなのに、回収種別1が0　
		if (f1KAIJY2.Value <> 0) and (f1KAIJY1.Value = 0) then
    	begin
        	MjsMessageBox(Self, '回収方法１が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIJY1.SetFocus;
    	end;

    	//回収種別1が0で、分解基準値1が入力済み
		if (f1KAIJY1.Value = 0) and (f1KAIRITU.Value <> 0)  then
    	begin
        	MjsMessageBox(Self, '回収方法１が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIJY1.SetFocus;
    	end;

    	//回収種別2が0で、分解基準値2が入力済み
		if (f1KAIJY2.Value = 0) and (KAIJY2Label.Caption <> '')  then
    	begin
        	MjsMessageBox(Self, '回収方法２が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIJY2.SetFocus;
    	end;
        {
    	//回収種別1・2が同じで、分解基準値2が0以外
		if (f1KAIJY1.Value = f1KAIJY2.Value) and (KAIJY2Label.Caption <> '')  then
    	begin
        	MjsMessageBox(Self, '回収方法１・２が同じ値です。', mjInformation, mjDefOk);
       		f1KAIJY2.SetFocus;
    	end;
        }
    end;

    if f1Bunkai.Value = 1 then //定額の場合のチェック
    begin
    	//回収種別1が入力済みなのに、分解基準値が0
		if (f1KAIJY1.Value <> 0) and (f1KAISYWKIN.Value = 0)  then
    	begin
        	MjsMessageBox(Self, '分解基準値１が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAISYWKIN.SetFocus;
    	end;

    	//回収種別1が0で、分解基準値1が入力済み
		if (f1KAIJY1.Value = 0) and (f1KAISYWKIN.Value <> 0)  then
    	begin
        	MjsMessageBox(Self, '回収方法１が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIJY1.SetFocus;
    	end;

    	//回収種別2が0で、分解基準値2が入力済み
		if (f1KAIJY2.Value = 0) and (KAIJY2Label.Caption <> '')  then
    	begin
        	MjsMessageBox(Self, '回収方法２が入力されていません。', mjInformation, mjDefOk);
            DtlCsTab.Items.Selected := DTLTAB_NYUKIN;  //<173> ADD
       		f1KAIJY2.SetFocus;
    	end;

        {  不要
    	//回収種別1・2が同じ
		if (f1KAIJY1.Value = f1KAIJY2.Value)   then
    	begin
       		f1KAIJY2.SetFocus;
    	end;
        }
    end;
end;

// <154> ADD-STR
//**********************************************************************
//*		Proccess	    :	テンプレート値からＤＢのデフォルト値を更新
//*		Name		    :	T.Satoh(IDC)
//*		Parameter	    :	pRec                :   Pointer
//*                         pDBCorp             :   TDatabase
//*                         TmpJouken1          :   入金方法１
//*                         TmpJouken2          :   入金方法２
//*                         TmpBunkaiKbn        :   分解方法
//*                         TmpStdRitu          :   入金方法１の基準値
//*                         TmpHasuuHou         :   入金方法１の端数処理方法
//*		Return		    :
//**********************************************************************
procedure TJNTCRP004003F.FieldsDefaultValueSet_MTOKUI_CRD(pRec: Pointer; pDBCorp: TFDConnection;
                                                          TmpJouken1, TmpJouken2, TmpBunkaiKbn: Integer;
                                                          TmpStdRitu: Double;
                                                          TmpHasuuHou: Integer;
                                                          TmpTesuryoFutan : Integer; //<177>
                                                          TmpKu : Integer;            //<177>
                                                          TmpGaikaSaiyoKbn : Integer  //<GAIKA> ADD
                                                          );
const
    SQL_STM = 'ALTER TABLE MTOKUI_CRD MODIFY ';
var
	Rec	        : ^TMjsAppRecord;	//Bpl管理構造体
	DataModule  : TMDataModulef;    //DB接続
	Query 	    : TMQuery;

    procedure TintIntFieldDefaultValueSet(FiledName: String; DefaultValue: Integer);
    begin
        with Query do
        begin
            Close;
            SQL.Clear;
            SQL.Add(SQL_STM + FiledName + ' TINYINT DEFAULT ' + IntToStr(DefaultValue));
            ExecSQL;
        end;
    end;

    procedure Numeric13_2FieldDefaultValueSet(FiledName: String; DefaultValue: Double);
    begin
        with Query do
        begin
            Close;
            SQL.Clear;
            SQL.Add(SQL_STM + FiledName + ' NUMERIC(13,2) DEFAULT ' + FloatToStr(DefaultValue));
            ExecSQL;
        end;
    end;
begin
	Rec        := pRec;
	DataModule := TMDataModulef(Rec^.m_pDBModule^); //データモジュールのコピー

    Query := Nil;
    try
        Query := TMQuery.Create(Nil);
		DataModule.SetDBInfoToQuery(pDBCorp, Query);

        TintIntFieldDefaultValueSet('Jouken1', TmpJouken1);
        TintIntFieldDefaultValueSet('Jouken2', TmpJouken2);
        TintIntFieldDefaultValueSet('BunkaiKbn', TmpBunkaiKbn);
        Numeric13_2FieldDefaultValueSet('StdRitu', TmpStdRitu);
        TintIntFieldDefaultValueSet('HasuuHou', TmpHasuuHou);

        TintIntFieldDefaultValueSet('TesuryoFutan', TmpTesuryoFutan);  //<177>
        TintIntFieldDefaultValueSet('Ku', TmpKu);  //<177>
        TintIntFieldDefaultValueSet('GaikaKbn', TmpGaikaSaiyoKbn);  //<GAIKA> ADD

    finally
    	if Assigned(Query) then Query.Free;
    end;
end;
// <154> ADD-END

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<155>
//	Name		:	T.Satoh(IDC)
//	Date		:	2008/02/06
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004003F.SessionPractice(iSyori: Integer);
var
{$I JNTSProcUtil.inc}
begin
	BeginExecProc(SPMsHist);
	try
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsByte			:= 1;
												// 担当者内部ｺｰﾄﾞ
    SPMsHist.ParamByName('@pTanNCode').AsLargeInt		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
    SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
    SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
    SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pRec^.m_iProgramCode;

    //SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
    SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
	//SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
    finally
    EndExecProc(SPMsHist);
	end;

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
		BeginExecProc(SPMsHistParent);
		try
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsByte		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsLargeInt		:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

		//SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
		SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
		//SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
        finally
        EndExecProc(SPMsHistParent);
        end;
	end;
end;



//**********************************************************************
//	Proccess	:	部門コードキー入力	<158>
//	Name		:	Y.Yoshizawa
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004003F.f1BMCODEKeyPress(Sender: TObject; var Key: Char);
begin
    //<158>エクスプローラから取得した内部コードをクリア（外部コードから内部コードを再取得）
    m_BumonNcodeEx := 0;
end;


//**********************************************************************
//	Proccess	:	名寄グリッドENTERイベント	<163>
//	Name		:	Y.Yoshizawa
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004003F.GridNayoseEnter(Sender: TObject);

var  iValue : Integer;
begin
    if ((m_Savef2OyaCode <> f2OyaCode.Text) or (m_Savef2KoCode <> f2KoCode.Text)) then  //<172>
    begin
        fnGetNayoseInfo();
    end;
    if (MemNayose.RecordCount = 0) and ((f2OyaCode.Text <> '') or (f2KoCode.Text <> ''))    then
    begin
        iValue := MjsMessageBoxEX(Self,'該当のデータがありません。新規登録を行いますか？','確認',mjQuestion,mjYesNo,mjDefYes);
        if iValue <> mrYes then
           f2OyaCode.SetFocus;
    end;
end;

//**********************************************************************
//	Proccess	:	コード欄EXITイベント<163>
//	Name		:	Y.Yoshizawa
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004003F.CODEExit(Sender: TObject);
begin
    //終了ボタンクリック時はチェックしない。
    if m_bEndFlg then Exit;
    //不正のコードを入力したまま移動した場合は元に戻す。
    if fnFldChk(Sender, FALSE) = False  then
    begin
        MjsSetFocus(Self,(Sender as TMTxtEdit).Name);	// 元の場所に戻す
        Abort;
    end;
end;

//<DENSHI> ADD St
//===============================
// データ区分のOnChangeイベント
//===============================
procedure TJNTCRP004003F.MNDenDataKbnChange(Sender: TObject);
var
    iDataKbn : Integer;
begin
	if not m_FormCreateSw then Exit;

    iDataKbn := MNDenDataKbn.AsInteger;

    MLDenDataKbnName.Caption    :='';
    MPDensaiCsInfo.visible      :=False;
    MPJemcoCsInfo.Visible       :=False;

    case iDataKbn of
        DENKBN_DENSAI   :
        begin
            MLDenDataKbnName.Caption    := DENNAME_DENSAI;
            MPDensaiCsInfo.Visible      :=  True;
            MPDensaiCsInfo.Top          := 70;
            MPDensaiCsInfo.Left         := 5
        end;
        DENKBN_JEMCO    :
        begin
            MLDenDataKbnName.Caption    := DENNAME_JEMCO;
            MPJemcoCsInfo.Visible       :=  True;
            MPJemcoCsInfo.Top           := 70;
            MPJemcoCsInfo.Left          := 5
        end;
    end;

end;

//========================================
// 電子記録債権 利用者番号Exitイベント
//========================================
procedure TJNTCRP004003F.MTDensaiUserIDExit(Sender: TObject);
var
    iCSNCode : Extended;
    iDenDataKbn : Integer;
    sDenUserID1 : String;
    qry : TMQuery;
    NextControl : TWinControl;

    //=========================================================
    // 電子記録債権情報オブジェクトを生成
    //=========================================================
    procedure CreateDensaiInfo();
    begin
        m_DensaiInfo :=
            TDensaiInfo.CreateObject(qry,iCSNCode,iDenDataKbn,sDenUserID1);
        m_DensaiInfo.SetReference(moReference);
    end;
    //==============
    //  でんさいネット
    //==============
    procedure SetDensai();
    begin
//<187> DEL St
{
        MTDenCSKanaName.Text    := m_DensaiInfo.DenCSKanaName;
        MNAllBkCode.Value       := Trunc(m_DensaiInfo.AllBkCode);
        //<186>↓
        //MNAllBraCode.Value      := Trunc(m_DensaiInfo.AllBraCode);
        if (m_DensaiInfo.AllBkCode <> 0) or
           (m_DensaiInfo.AllBraCode <> 0) then
        begin
            //銀行コードまたは支店コードが0以外の場合は支店コードを設定
            //※支店コード000対応
            MNAllBraCode.Value      := Trunc(m_DensaiInfo.AllBraCode);
            MNAllBraCode.InputFlag  := False;
        end
        else
        begin
            //銀行コードまたは支店コードがどちらも0の場合は支店コードを設定
            //※ただし0なので空欄
            MNAllBraCode.InputFlag  := True;
            MNAllBraCode.Value      := Trunc(m_DensaiInfo.AllBraCode);
        end;
        //<186>↑
        MNAccKbn_Denshi.Value   := Trunc(m_DensaiInfo.AccKbn);
        MTAccNo.Text            := m_DensaiInfo.AccNo;
}
//<187> DEL Ed
    end;

    //==============
    //  JEMCO
    //==============
    procedure SetJEMCO();
    begin
        MTJemcoUserID2.Text := m_DensaiInfo.DenUserID2;
    end;
begin
    // 終了時
    if (m_bEndFlg = TRUE) then
        Exit;

    NextControl := Screen.ActiveControl;

    if (NextControl.Name = 'MNDenDataKbn') or (NextControl.Name = '') then
    begin
        Exit;
    end;

    qry := nil;
//<187> MOD St
{
    // でんさいネット
    if (Sender = MTDensaiUserID) then
    begin
        iDenDataKbn := DENKBN_DENSAI;
        sDenUserID1 := MTDensaiUserID.Text;
    end
    // JEMCO
    else
    begin
        iDenDataKbn := DENKBN_JEMCO;
        sDenUserID1 := MTJemcoUserID1.Text;
    end;
}
    // JEMCO
    iDenDataKbn := DENKBN_JEMCO;
    sDenUserID1 := MTJemcoUserID1.Text;
//<187> MOD Ed

    if (Trim(sDenUserID1) = '') then
    begin
        if TMTxtEdit(Sender).CanFocus() then TMTxtEdit(Sender).SetFocus;
        Exit;
    end;

    if (Assigned(m_DensaiInfo)) then
    begin
        if ((m_DensaiInfo.DenDataKbn = iDenDataKbn) and
            (m_DensaiInfo.DenUserID1 = sDenUserID1)) then
        begin
            Exit;
        end;

        FreeAndNil(m_DensaiInfo);
    end;

    try

        // MQueryの構築
        qry    := TMQuery.Create (Self);
        // DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, qry);

        iCSNCode := m_TRNCode;

        CreateDensaiInfo();

        // 電子記録債権情報を各パーツへセット
        case iDenDataKbn of
            DENKBN_DENSAI   :
            begin
//<187> DEL St
//                SetDensai();
//<187> DEL Ed
            end;
            DENKBN_JEMCO   :
            begin
                SetJEMCO();
            end;
        end;

//<187> DEL St
{
        B_Delete.Enabled := m_JntAuthority.IsDelete;
}
//<187> DEL Ed

    finally
        if (Assigned(qry)) then
        begin
            qry.Close();
            qry.Free();
        end;
    end;
end;

//========================================
// 電子記録債権 データ区分Exitイベント
//========================================
procedure TJNTCRP004003F.MNDenDataKbnExit(Sender: TObject);
var
    iDataKbn : Integer;
    sMSG : String;
    sFMT : String;
    qry  : TMQuery;
    oDensaiInfo : TDensaiInfo;
begin
    qry := nil;

    iDataKbn := MNDenDataKbn.AsInteger;
    oDensaiInfo := nil;
    sFMT := '';

    try
        if (Assigned(m_DensaiInfo) and (m_DensaiInfo.DenUserID1 <> '') and
            (m_DensaiInfo.DenDataKbn <> iDataKbn)) then
        begin
            oDensaiInfo := TDensaiInfo.Create();
            ObjSetDensaiInfo(oDensaiInfo, m_DensaiInfo.DenDataKbn);

            //if (m_DensaiInfo.Equals(
            if (m_DensaiInfo.Equals1(
                oDensaiInfo, m_DensaiInfo.DenDataKbn) = false) then
            begin
                sMSG := MSG_DENINFO;
                case m_DensaiInfo.DenDataKbn of
                    DENKBN_DENSAI   :
                    begin
                        sFMT := DENNAME_DENSAI;
                    end;
                    DENKBN_JEMCO   :
                    begin
                        sFMT := DENNAME_JEMCO;
                    end;
                end;

                sFMT := sFMT + '取引先情報';
                sMSG := Format(sMSG,[sFMT]);

                // 「%s取引先情報が変更されていますが、更新されていません。更新しますか？」
                if (MjsMessageBoxEx(
                    Self,sMSG,'確認',mjQuestion,mjYesNo,mjDefNo) = mrYes) then
                begin
                    with m_DensaiInfo do
                    begin
                        case DenDataKbn of
                            DENKBN_DENSAI   :
                            begin
                                if fnFldChk_DENSAI() = false then
                                    Exit;
                            end;
                            DENKBN_JEMCO   :
                            begin
                                if fnFldChk_JEMCO() = false then
                                    Exit;
                            end;
                        end;

                        // MQueryの構築
                        qry :=  TMQuery.Create( Self );
                        // DBとMQueryの接続
                        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, qry );

                        ObjSetDensaiInfo(m_DensaiInfo, DenDataKbn);

                        if (Update(qry) = False) then
                        begin
                            MNDenDataKbn.Value := m_DensaiInfo.DenDataKbn;
                            Exit;
                        end;
                    end;
                end;
            end;

            fnInzFormDenshi();

            FreeAndNil(m_DensaiInfo);
        end;

        // SelectItemsへAdd
        if (iDataKbn = DENKBN_DENSAI) then
        begin
//<187> DEL St
//            SetDenshiNoItems(m_TRNCode, iDataKbn, MTDensaiUserID);
//<187> DEL Ed
        end
        else if (iDataKbn = DENKBN_JEMCO) then
        begin
            SetDenshiNoItems(m_TRNCode, iDataKbn, MTJemcoUserID1);
        end;

    finally
        if (Assigned(qry)) then
        begin
            qry.Close();
            qry.Free();
        end;

        if (Assigned(oDensaiInfo)) then
        begin
            FreeAndNil(oDensaiInfo);
        end;
//<187> ADD St
	    //削除ボタンの制御
	    ControlDeleteButton
//<187> ADD Ed
    end;
end;

//=======================================
// 電子記録債権削除のイベントハンドラー
//=======================================
procedure TJNTCRP004003F.BDenshiDeleteClick(Sender: TObject);
var
    sCd  : String;
    sMsg : String;
    sFmt : String;
    qry  : TMQuery;
begin
    qry := nil;
    sMsg := MSG_DELETE2;

    if MNDenDataKbn.AsInteger <> 0 then
    begin
        sCd  := '';
        sFmt := '';
        case MNDenDataKbn.AsInteger of
            DENKBN_DENSAI   :
            begin
//<187> DEL St
//                sCd  := MTDensaiUserID.Text;
//                sFmt := MLDensaiUserID.Caption;
//<187> DEL Ed
            end;
            DENKBN_JEMCO    :
            begin
                sCd  := MTJemcoUserID1.Text;
                sFmt := MLJemcoUserID1.Caption;
            end;
        end;

        if Trim(sCd) = '' then Exit;
        if not Assigned(m_DensaiInfo) then Exit;
        if m_DensaiInfo.DenUserID1 <> Trim(sCd) then Exit;

        sFmt := sFmt + '：' + m_DensaiInfo.DenUserID1;

        // 「sFmtの削除を行います。よろしいですか？」
        if  MjsMessageBoxEX(Self,Format(sMsg,[sFmt]) ,DtlCsTab.Items[DTLTAB_DENSHI].Caption + '削除',
                                      mjQuestion,mjYesNo,mjDefYes) = mrYes then
        begin
            try
                qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, qry);

                if (m_DensaiInfo.Delete(qry) = false) then
                begin
                    Exit;
                end;

                fnInzFormDenshi();
                MNDenDataKbn.SetFocus();
                m_DensaiInfo.DenUserID1 := '';
            finally
                if Assigned(qry) then
                begin
                    qry.Close();
                    qry.Free();
                end;
            end;
        end;
    end;
end;

//===========================================
// 電子記録債権情報パネルの各パーツの初期化
//===========================================
procedure TJNTCRP004003F.fnInzFormDenshi();
begin
//<187> DEL St
{
    MTDensaiUserID.Text := '';          // 利用者番号
    MTDenCSKanaName.Text := '';         // カナ名称
    MNAllBkCode.Value := 0;             // 全銀協コード
    MNAllBraCode.InputFlag := True;     // 支店コード<186>
    MNAllBraCode.Value := 0;            // 支店コード
    MNAccKbn_Denshi.Value := 0;         // 預金種目
    MTAccNo.Text := '';                 // 口座番号
}
//<187> DEL Ed

    MTJemcoUserID1.Text := '';          // お客様番号(4桁)
    MTJemcoUserID2.Text := '';          // お客様番号(7桁)
end;
//<Account> ADD St
//===========================================
// 口座振替情報パネルの各パーツの初期化
//===========================================
procedure TJNTCRP004003F.fnInzFormAccount();
var
    idx : Integer;
    oTxtEdit : TMTxtEdit;
begin
    numKoufuriNo_Account.Value  := 0;   // 口座振替No
    txtUserCode_Account.Text   := '';  // 顧客番号
    txtBankName_Account.Text    := '';  // 銀行ｶﾅ
    txtBranchName_Account.Text  := '';  // 支店ｶﾅ
    numAllBkCode_Account.Value  := 0;   // 全銀協コード
    numAllBraCode_Account.InputFlag := True;    // 支店コード<186>
    numAllBraCode_Account.Value := 0;   // 支店コード
    numAccKbn_Account.Value     := 0;   // 預金種目
    txtAccNo_Account.Text       := '';  // 口座番号
    txtUserName_Account.Text    := '';  // 預金者名
    // フリー項目
    for idx := 0 to FREEFLD_COUNT -1 do
    begin
        oTxtEdit := TMTxtEdit(FindComponent(
            Format('txtFreeFld%s_Account', [IntToStr(idx + 1)])));
        if (Assigned(oTxtEdit)) then
        begin
            oTxtEdit.Text := '';
        end;
    end;

    CustomSetEnabled(pnlAccountDetail, false);  //<181> ADD
end;
//<Account> ADD Ed

//===========================================
// でんさいネットのフィールドチェック
//===========================================
function TJNTCRP004003F.fnFldChk_DENSAI(): Boolean;
var
    bRet : Boolean;
begin
    bRet := True;
//<187> DEL St
{
    // 利用者番号
    if bRet then bRet := fnFldChk(MTDensaiUserID,False);
    // カナ名称
    if bRet then bRet := fnFldChk(MTDenCSKanaName,False);
    // 預金種目
    if bRet then bRet := fnFldChk(MNAccKbn_Denshi,False);
    // 口座番号
    if bRet then bRet := fnFldChk(MTAccNo,False);
}
//<187> DEL Ed

    result := bRet;
end;

//===========================================
// JEMCOのフィールドチェック
//===========================================
function TJNTCRP004003F.fnFldChk_JEMCO(): Boolean;
var
    bRet : Boolean;
begin
    bRet := True;
    // お客様番号(4桁)
    if bRet then bRet := fnFldChk(MTJemcoUserID1,False);

    // お客様番号(7桁)
    if bRet then bRet := fnFldChk(MTJemcoUserID2,False);    //<184>追加：お客様番号(7桁)考慮

    result := bRet;
end;

//========================================================
// 電子記録債権情報セット(コンポーネント ⇒ オブジェクト)
//========================================================
procedure TJNTCRP004003F.ObjSetDensaiInfo(oDensaiInfo : TDensaiInfo; iDataKbn:Integer);
begin
    with oDensaiInfo do
    begin
        case iDataKbn of
            DENKBN_DENSAI   :
            begin
//<187> DEL St
{
                DenUserID1      := MTDensaiUserID.Text;
                DenCSKanaName   := MTDenCSKanaName.Text;
                AllBkCode       := MNAllBkCode.AsInteger;
                AllBraCode      := MNAllBraCode.AsInteger;
                AccKbn          := MNAccKbn_Denshi.AsInteger;
                AccNo           := MTAccNo.Text;
}
//<187> DEL Ed
            end;
            DENKBN_JEMCO    :
            begin
                DenUserID1  := MTJemcoUserID1.Text;
                DenUserID2  := MTJemcoUserID2.Text;
            end;
        end;

        UpdLoginID := FormatFloat('0',(rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD));   // 担当者コード
        UpdDateTM := now;                                                                 // 更新時間
    end;
end;

// -----------------------------------------------------------------------------
//  印刷処理【電子記録債権情報登録リスト】
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETDensai(pPtn:Integer);
var
	dqMasterData    :   TMQuery;
    sCode        :   String;
    iDataKbn    :   Integer;
    iAccKbn     :   Integer;
begin
    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    try

        if pPtn = 5 then
            iDataKbn := DENKBN_DENSAI
        else
            iDataKbn := DENKBN_JEMCO;

        if ( MemPtnDensai.Active ) then MemPtnDensai.Close();

        MemPtnDensai.Open();

        with (dqMasterData) do
        begin
            // -------------------------------------
            //  取引先マスタ MTOKUI
            // -------------------------------------
            Close ();
            SQL.Clear();
            SQL.Add(TDensaiInfo.SelectSQLList());

            // 開始・終了
            if (uvHani.pvrRgType[0] = 1) then
            begin
                SQL.Add(' AND MA.GCode >= :StartGCode ');
                SQL.Add(' AND MA.GCode <= :EndGCode ');
                SetFld('StartGCode').AsString := uvHani.pvrStCode[0];
                SetFld('EndGCode').AsString := uvHani.pvrEdCode[0];
            end;

            // データ区分
            SQL.Add(' AND DenDataKbn = :DenDatakbn ');
            SetFld('DenDataKbn').AsInteger := iDataKbn;

            // 出力順序
//<187> MOD St
//            case uvHani.pvrOrder of
//                0:   SQL.Add('ORDER BY MA.GCode');
//                1:   SQL.Add('ORDER BY INFO.DenUserID1 ');
//                else SQL.Add('ORDER BY MA.GCode ');
//            end;
			if iDataKbn = DENKBN_DENSAI then
			begin
                case uvHani.pvrOrder of
                    0:   SQL.Add('ORDER BY MA.GCode,'+			//①取引先コード
                                          'INFO.DenUserID1,'+	//②利用者番号
                                          'DenCSKanaName, '+	//③カナ名称
                                          'AllBkCode,'+			//④銀行コード
                                          'AllBraCode,'+		//⑤支店コード
                                          'AccKbn,'+			//⑥預金種目
                                          'AccNo');				//⑦口座番号
                    1:   SQL.Add('ORDER BY INFO.DenUserID1,'+	//①利用者番号
                                          'DenCSKanaName,'+		//②カナ名称
                                          'AllBkCode,'+			//③銀行コード
                                          'AllBraCode,'+		//④支店コード
                                          'AccKbn,'+			//⑤預金種目
                                          'AccNo,'+				//⑥口座番号
                                          'MA.GCode ');			//⑦取引先コード
                    else SQL.Add('ORDER BY MA.GCode,'+			//①取引先コード
                                          'INFO.DenUserID1,'+	//②利用者番号
                                          'DenCSKanaName, '+	//③カナ名称
                                          'AllBkCode,'+			//④銀行コード
                                          'AllBraCode,'+		//⑤支店コード
                                          'AccKbn,'+			//⑥預金種目
                                          'AccNo');				//⑦口座番号
	            end;
			end
			else
			begin
                case uvHani.pvrOrder of
                    0:   SQL.Add('ORDER BY MA.GCode,'+				//①取引先コード
                                          'INFO.DenUserID1,'+		//②お客様番号(4桁)
                                          'INFO.DenUserID2 ');		//③お客様番号(7桁)
                    1:   SQL.Add('ORDER BY INFO.DenUserID1,'+		//①お客様番号(4桁)
                                          'INFO.DenUserID2,'+		//②お客様番号(7桁)
                                          'MA.GCode ');				//③取引先コード
                    else SQL.Add('ORDER BY MA.GCode,'+				//①取引先コード
                                          'INFO.DenUserID1,'+		//②お客様番号(4桁)
                                          'INFO.DenUserID2 ');		//③お客様番号(7桁)
                end;
            end;
//<187> MOD Ed

            // ｴﾗｰの判定
            if ( Open = FALSE ) then
            begin
                dqMasterData.Close();
                dqMasterData.Free();
                Exit;
            end;

            while ( EOF <> TRUE ) do
            begin

                MemPtnDensai.Append;

                if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
                else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
                else
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);

                MemPtnDensai.FieldByName('GCode').AsString  := sCode;
                MemPtnDensai.FieldByName('LongName').AsString  := FieldByName('LongName').AsString;
                MemPtnDensai.FieldByName('DenUserID1').AsString  := FieldByName('DenUserID1').AsString;
                MemPtnDensai.FieldByName('DenUserID2').AsString  := FieldByName('DenUserID2').AsString;
                MemPtnDensai.FieldByName('DenUserName').AsString  := FieldByName('DenUserName').AsString;
                MemPtnDensai.FieldByName('DenCSKanaName').AsString  := FieldByName('DenCSKanaName').AsString;
                MemPtnDensai.FieldByName('AllBkCode').AsString  := FieldByName('AllBkCode').AsString;
                MemPtnDensai.FieldByName('AllBraCode').AsString  := FieldByName('AllBraCode').AsString;
                MemPtnDensai.FieldByName('BankName').AsString  := FieldByName('BankName').AsString;

                iAccKbn  := FieldByName('AccKbn').AsInteger;
                MemPtnDensai.FieldByName('AccKbn').AsInteger  := iAccKbn;

                MemPtnDensai.FieldByName('AccName').AsString  := TDensaiInfo.GetAccName(iAccKbn);

                MemPtnDensai.FieldByName('AccNo').AsString  := FieldByName('AccNo').AsString;
                MemPtnDensai.FieldByName('MatchingKey').AsString  := FieldByName('MatchingKey').AsString;

                MemPtnDensai.Post();

                Next();
            end;
        end;

    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;
end;

//============================
// 口座番号Exitイベント
//============================
procedure TJNTCRP004003F.MTAccNoExit(Sender: TObject);
var
    oTxtEdit : TMTxtEdit;
begin
    oTxtEdit := TMTxtEdit(Sender);
    // 終了時
    if (m_bEndFlg = TRUE) then
        Exit;
    oTxtEdit.Text := fnEditAccountNo(oTxtEdit.Text);
end;

//============================
// 口座番号自動編集
//============================
function TJNTCRP004003F.fnEditAccountNo(pAccountNo : String):string;
var
    iAccountNo : Integer;
begin
    if (pAccountNo = '') then
    begin
        result := '';
        Exit;
    end;

    iAccountNo := Trunc(StrToIntDef(pAccountNo,0));

	if Length(Trim (pAccountNo)) < 8 then
		result := Format ('%.7d', [iAccountNo])
    else
        result := pAccountNo;
end;

//============================
// 口座番号KeyPressイベント
//============================
procedure TJNTCRP004003F.MTAccNoKeyPress(Sender: TObject; var Key: Char);
begin
    if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) and (Key <> #13) then
    begin                          // #8=BackSpace   #27=Esc  #9=Tab #13=Enter
        Beep ();
        Abort;
    end;
end;

//=========================================================
// 電子番号をTxtEditのSelectItemsへAddする
//=========================================================
procedure TJNTCRP004003F.SetDenshiNoItems(csNCode : Extended; denKbn : Integer; txtEdit : TMTxtEdit);
var
    qry : TMQuery;
    userID : String;
begin
    txtEdit.SelectItems.Clear();

    // MQueryの構築
    qry :=  TMQuery.Create( Self );

    try
        // DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, qry );

        with qry do
        begin
            SQL.Clear();
            SQL.Add(TDensaiInfo.SelectSQL());

            SQL.Add('Order By DenUserID1');     //<183>追加：ドロップダウンリストの昇順表示

            SetFld('CSNCode').AsString := FormatFloat('0',csNCode);
            SetFld('DenDataKbn').AsInteger := denKbn;

            Open();

            while (EOF = false) do
            begin
                userID := GetFld('DenUserID1').AsString;
                txtEdit.SelectItems.Add(userID);

                Next();
            end;
        end;

    finally
        qry.Close();
        qry.Free();
    end;
end;

//<DENSHI> ADD Ed
//<Account> ADD St
//=======================================
// 口座振替情報削除のイベントハンドラー
//=======================================
procedure TJNTCRP004003F.BAccountDeleteClick(Sender: TObject);
var
    sMsg : String;
    sFmt : String;
    qry  : TMQuery;
begin
    qry := nil;
    sMsg := MSG_DELETE2;

    if (numKoufuriNo_Account.AsInteger <> 0) and (Assigned(moAccCsInfo)) then
    begin
        sFmt :=
            Format('口座振替NO %s ',
            [IntToStr(numKoufuriNo_Account.AsInteger)]);

        // 「sFmtの削除を行います。よろしいですか？」
        if  MjsMessageBoxEX(
            Self, Format(sMsg,[sFmt]) ,
            DtlCsTab.Items[DTLTAB_ACCOUNT].Caption + '削除',
            mjQuestion,mjYesNo,mjDefYes) = mrYes then
        begin
            try
                qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, qry);

                if (moAccCsInfo.Delete(qry) = false) then
                begin
                    Exit;
                end;

                fnInzFormAccount();
                FormSetAccInfo(moAccInfos);      // 口座振替NOの再セット
                numKoufuriNo_Account.SetFocus();
                FreeAndNil(moAccCsInfo);
//<187> DEL St
{
                B_Delete.Enabled := false;
}
//<187> DEL Ed
            finally
                if Assigned(qry) then
                begin
                    qry.Close();
                    qry.Free();
                end;
            end;
        end;
    end;
end;

//=========================================================
// 自前のshowmessageメソッド
//=========================================================
procedure TJNTCRP004003F.fnShowMessage(
    sMsg : string;
    sCaption : string;
    msgBoxType : TMjsMsgBoxType;
    msgBoxBtns : TMjsMsgBoxButtons;
    msgBoxDefBtn : TMjsMsgBoxDefBtn);
begin
    MjsMessageBoxEx(
        Self, sMSG, sCaption, msgBoxType, msgBoxBtns, msgBoxDefBtn);
end;

//=========================================================
// 口座振替情報リストを画面へセットする
//=========================================================
procedure TJNTCRP004003F.FormSetAccInfo(oAccInfos : TAccountInfoList; iKoufuriNo : Integer = 0);
var
    idx : Integer;
    oAccInfo : TAccountInfo;
    //=========================================================
    // 追加処理
    //=========================================================
    procedure DoSet();
    begin
        if (Assigned(oAccInfo)) then
        begin
            numKoufuriNo_Account.SelectItems.Add(
                Format('%s:%s',
                [IntToStr(oAccInfo.KoufuriNo), oAccInfo.KoufuriName]));
        end;
    end;
begin
    numKoufuriNo_Account.SelectItems.Clear();

    if ((Assigned(oAccInfos) = false) or (oAccInfos.Count <= 0)) then
    begin
        Exit;
    end;

    if (iKoufuriNo <> 0) then
    begin
        oAccInfo := oAccInfos.GetAccountInfo(iKoufuriNo);
        DoSet();
        numKoufuriNo_Account.Value := iKoufuriNo;
        numKoufuriNo_Account.ReadOnly := true;
    end
    else
    begin
        for idx := 0 to oAccInfos.Count -1 do
        begin
            oAccInfo := oAccInfos[idx];
            DoSet();
        end;
        numKoufuriNo_Account.Value := 0;
        numKoufuriNo_Account.ReadOnly := false;
    end;
end;

//=========================================================
// 口座振替取引先情報を画面へセットする
//=========================================================
procedure TJNTCRP004003F.FormSetAccCsInfo(oAccCsInfo: TAccountCustomerInfo);
var
    idx : Integer;
    oTxtEdit : TMTxtEdit;
begin
    if (Assigned(oAccCsInfo) = false) or (moAccInfos.Count <= 0) then
    begin
        Exit;
    end;

    with oAccCsInfo do
    begin
        if KoufuriNo <> 0 then
        begin
            txtUserCode_Account.Text := UserCode;
            numAllBkCode_Account.Value := Trunc(AllBkCode);
            //<186>↓
            //numAllBraCode_Account.Value := Trunc(AllBraCode);
            if (AllBkCode <> 0) or
               (AllBraCode <> 0) then
            begin
                //銀行コードまたは支店コードが0以外の場合は支店コードを設定
                //※支店コード000対応
                numAllBraCode_Account.Value      := Trunc(AllBraCode);
                numAllBraCode_Account.InputFlag  := False;
            end
            else
            begin
                //銀行コードまたは支店コードがどちらも0の場合は支店コードを設定
                //※ただし0なので空欄
                numAllBraCode_Account.InputFlag  := True;
                numAllBraCode_Account.Value      := Trunc(AllBraCode);
            end;
            //<186>↑
            txtBankName_Account.Text := BankName;
            txtBranchName_Account.Text := BranchName;
            numAccKbn_Account.Value := Trunc(AccKbn);
            txtAccNo_Account.Text := AccNo;
            txtUserName_Account.Text := UserName;

            // フリー項目
            for idx := 0 to FREEFLD_COUNT -1 do
            begin
                oTxtEdit := TMTxtEdit(FindComponent(
                    Format('txtFreeFld%s_Account', [IntToStr(idx + 1)])));
                if (Assigned(oTxtEdit)) then
                begin
                    oTxtEdit.Text := FreeFlds[idx];
                end;
            end;
        end;
    end;
end;

//========================================================
// 口座振替取引先情報セット(コンポーネント ⇒ オブジェクト)
//========================================================
procedure TJNTCRP004003F.ObjSetAccCsInfo(oAccCsInfo : TAccountCustomerInfo);
var
    idx : Integer;
    oTxtEdit : TMTxtEdit;
begin
    with oAccCsInfo do
    begin
        CSNCode := m_TRNCode;
        KoufuriNo := numKoufuriNo_Account.AsInteger;
        UserCode := txtUserCode_Account.Text;
        AllBkCode := numAllBkCode_Account.AsInteger;
        AllBraCode := numAllBraCode_Account.AsInteger;
        BankName := txtBankName_Account.Text;
        BranchName := txtBranchName_Account.Text;
        AccKbn := numAccKbn_Account.AsInteger;
        AccNo := txtAccNo_Account.Text;
        UserName := txtUserName_Account.Text;

        // フリー項目
        for idx := 0 to FREEFLD_COUNT -1 do
        begin
            oTxtEdit := TMTxtEdit(FindComponent(
                Format('txtFreeFld%s_Account', [IntToStr(idx + 1)])));
            if (Assigned(oTxtEdit)) then
            begin
                FreeFlds[idx] := oTxtEdit.Text;
            end;
        end;

        UpdLoginID := FormatFloat('0',(rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD));   // 担当者コード
        UpdDateTM := now;                                                                 // 更新時間
    end;
end;

//========================================================
// 口座振替NOのChangeイベント
//========================================================
procedure TJNTCRP004003F.numKoufuriNo_AccountChange(Sender: TObject);
var
    iKoufuriNo : Integer;
    oAccInfo : TAccountInfo;
begin
	if not m_FormCreateSw then Exit;

    iKoufuriNo := numKoufuriNo_Account.AsInteger;

    lblKoufuriNo1_Account.Caption := '';
    lblKoufuriNo2_Account.Caption := '';

    if ((Assigned(moAccInfos) = false) or (moAccInfos.Count <= 0)) then
    begin
        Exit;
    end;
//<181> DEL St
{
    // 口座振替取引先オブジェクト未生成の場合はここで生成する。
    if (Assigned(moAccCsInfo) = false) then
    begin
        moAccCsInfo := TAccountCustomerInfo.Create();
        moAccCsInfo.SetReference(moReference);
    end;
}
//<181> DEL Ed
    oAccInfo := moAccInfos.GetAccountInfo(iKoufuriNo);
    // 口座振替情報が取得できない場合は修正不可
    if (Assigned(oAccInfo) = false) then
    begin
//<GFB> DEL        pnlAccountDetail.Enabled := false;
        CustomSetEnabled(pnlAccountDetail, false);  //<GFB> ADD
        FreeAndNil(moAccCsInfo);  //<181> ADD
        Exit;
    end;

//<181> ADD St
    // 口座振替取引先オブジェクト未生成の場合はここで生成する。
    if (Assigned(moAccCsInfo) = false) then
    begin
        moAccCsInfo := TAccountCustomerInfo.Create();
        moAccCsInfo.SetReference(moReference);
    end;
//<181> ADD Ed

//<GFB> DEL    pnlAccountDetail.Enabled := true;
    CustomSetEnabled(pnlAccountDetail, true);  //<GFB> ADD
    lblKoufuriNo1_Account.Caption := oAccInfo.KoufuriName;
    lblKoufuriNo2_Account.Caption := Format('%s ／ %s %s %s',[
        oAccInfo.BankName,
        oAccInfo.BranchName,
        TAccountInfo.GetAccName(oAccInfo.AccKbn),
        oAccInfo.AccNo]);
end;

// -----------------------------------------------------------------------------
//  印刷処理【口座振替情報登録リスト】
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETAccount(pPtn:Integer);
var
	dqMasterData    :   TMQuery;
    sCode        :   String;
    iAccKbn     :   Integer;
begin
    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    try

        if ( MemPtnAccount.Active ) then MemPtnAccount.Close();

        MemPtnAccount.Open();

        with (dqMasterData) do
        begin
            // -------------------------------------
            //  取引先マスタ MTOKUI
            // -------------------------------------
            Close ();
            SQL.Clear();
            SQL.Add(TAccountCustomerInfo.SelectSQLList());

            // 開始・終了
            if (uvHani.pvrRgType[0] = 1) then
            begin
                SQL.Add(' AND MA.GCode >= :StartGCode ');
                SQL.Add(' AND MA.GCode <= :EndGCode ');
                SetFld('StartGCode').AsString := uvHani.pvrStCode[0];
                SetFld('EndGCode').AsString := uvHani.pvrEdCode[0];
            end;

            // 出力順序
            case uvHani.pvrOrder of
                0:   SQL.Add('ORDER BY MA.GCode');
                1:   SQL.Add('ORDER BY ACC.KoufuriNo ');
                else SQL.Add('ORDER BY MA.GCode ');
            end;

            // ｴﾗｰの判定
            if ( Open = FALSE ) then
            begin
                dqMasterData.Close();
                dqMasterData.Free();
                Exit;
            end;

            while ( EOF <> TRUE ) do
            begin

                MemPtnAccount.Append;

                if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
                else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
                else
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);

                MemPtnAccount.FieldByName('GCode').AsString  := sCode;
                MemPtnAccount.FieldByName('LongName').AsString  := FieldByName('LongName').AsString;
                MemPtnAccount.FieldByName('KoufuriNo').AsInteger  := FieldByName('KoufuriNo').AsInteger;
                MemPtnAccount.FieldByName('KoufuriName').AsString  := FieldByName('KoufuriName').AsString;
                iAccKbn  := FieldByName('AccKbn').AsInteger;
                MemPtnAccount.FieldByName('AccKbn').AsInteger  := iAccKbn;
                MemPtnAccount.FieldByName('AccName').AsString  := TAccountInfo.GetAccName(iAccKbn);
                MemPtnAccount.FieldByName('BankName').AsString  := FieldByName('BankName').AsString;
                MemPtnAccount.FieldByName('BranchName').AsString  := FieldByName('BranchName').AsString;
                MemPtnAccount.FieldByName('AccNo').AsString  := FieldByName('AccNo').AsString;

                MemPtnAccount.FieldByName('UserCode').AsString  := FieldByName('UserCode').AsString;
                MemPtnAccount.FieldByName('UserName').AsString  := FieldByName('UserName').AsString;
                MemPtnAccount.FieldByName('AllBkCode').AsString  := FieldByName('AllBkCode').AsString;
                MemPtnAccount.FieldByName('AllBraCode').AsString  := FieldByName('AllBraCode').AsString;
                MemPtnAccount.FieldByName('CsBankName').AsString  := FieldByName('CsBankName').AsString;
                MemPtnAccount.FieldByName('CsBranchName').AsString  := FieldByName('CsBranchName').AsString;
                iAccKbn  := FieldByName('CsAccKbn').AsInteger;
                MemPtnAccount.FieldByName('CsAccKbn').AsInteger  := iAccKbn;
                MemPtnAccount.FieldByName('CsAccName').AsString  := TAccountCustomerInfo.GetAccName(iAccKbn);
                MemPtnAccount.FieldByName('CsAccNo').AsString  := FieldByName('CsAccNo').AsString;
                MemPtnAccount.FieldByName('CsBankName').AsString  := FieldByName('CsBankName').AsString;
                MemPtnAccount.FieldByName('CsBranchName').AsString  := FieldByName('CsBranchName').AsString;

                MemPtnAccount.FieldByName('FreeFld1').AsString  := FieldByName('FreeFld1').AsString;
                MemPtnAccount.FieldByName('FreeFld2').AsString  := FieldByName('FreeFld2').AsString;
                MemPtnAccount.FieldByName('FreeFld3').AsString  := FieldByName('FreeFld3').AsString;
                MemPtnAccount.FieldByName('FreeFld4').AsString  := FieldByName('FreeFld4').AsString;
                MemPtnAccount.FieldByName('FreeFld5').AsString  := FieldByName('FreeFld5').AsString;
                MemPtnAccount.FieldByName('FreeFld6').AsString  := FieldByName('FreeFld6').AsString;
                MemPtnAccount.FieldByName('FreeFld7').AsString  := FieldByName('FreeFld7').AsString;
                MemPtnAccount.FieldByName('FreeFld8').AsString  := FieldByName('FreeFld8').AsString;
                MemPtnAccount.FieldByName('FreeFld9').AsString  := FieldByName('FreeFld9').AsString;
                MemPtnAccount.FieldByName('FreeFld10').AsString  := FieldByName('FreeFld10').AsString;

                MemPtnAccount.Post();

                Next();
            end;
        end;

    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;
end;

//<GFB2> ADD St
// -----------------------------------------------------------------------------
//  印刷処理【送金依頼人名称登録リスト】
// -----------------------------------------------------------------------------
procedure TJNTCRP004003F.fnPrnSETGaika(pPtn:Integer);
var
	dqMasterData    :   TMQuery;
    sCode        :   String;
begin
    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    try

        if ( MemPtnGaika.Active ) then MemPtnGaika.Close();

        MemPtnGaika.Open();

        with (dqMasterData) do
        begin
            // -------------------------------------
            //  取引先マスタ MTOKUI
            // -------------------------------------
            Close ();
            SQL.Clear();
            SQL.Add(' SELECT ');
            SQL.Add('     MT.GCode, ');
            SQL.Add('     MT.Nm AS LongName, ');
            SQL.Add('     MC.GaikaKbn, ');
            SQL.Add('     MC.GaikaSoukinName1, ');
            SQL.Add('     MC.GaikaSoukinName2, ');
            SQL.Add('     MC.GaikaSoukinName3 ');
            SQL.Add(' FROM ');
            SQL.Add('     MTokui MT ');
            SQL.Add('     INNER JOIN ');
            SQL.Add('     MTokui_CRD MC ON ');
            SQL.Add('     MT.NCode = MC.BaseNCode ');
            SQL.Add('     AND MC.GaikaKbn IN (1, 2) ');
            SQL.Add(' WHERE ');
            SQL.Add('     MT.RDelKbn = 0 ');
            SQL.Add('     AND MT.TemplateKbn = 0 ');

            // 開始・終了
            if (uvHani.pvrRgType[0] = 1) then
            begin

                SQL.Add('     AND MT.GCode >= :StartGCode ');
                SQL.Add('     AND MT.GCode <= :EndGCode ');

                SetFld('StartGCode').AsString := uvHani.pvrStCode[0];
                SetFld('EndGCode').AsString := uvHani.pvrEdCode[0];
            end;

            // 出力順序
            case uvHani.pvrOrder of
                0:   SQL.Add('ORDER BY MT.GCode');
                1:   SQL.Add('ORDER BY MT.Renso ');
                else SQL.Add('ORDER BY MT.GCode ');
            end;

            // ｴﾗｰの判定
            if ( Open = FALSE ) then
            begin
                dqMasterData.Close();
                dqMasterData.Free();
                Exit;
            end;

            while ( EOF <> TRUE ) do
            begin

                MemPtnGaika.Append;

                if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
                else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
                else
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);

                MemPtnGaika.FieldByName('GCode').AsString  := sCode;
                MemPtnGaika.FieldByName('LongName').AsString  := FieldByName('LongName').AsString;
                MemPtnGaika.FieldByName('GaikaSaiyoKbn').AsInteger  := FieldByName('GaikaKbn').AsInteger;
                MemPtnGaika.FieldByName('GaikaSaiyoKbnNm').AsString  :=
                    GetCodeListByName(GetFld('GaikaKbn').AsInteger, SaiyoNames_Gaika);
                MemPtnGaika.FieldByName('GaikaSoukinName1').AsString  := FieldByName('GaikaSoukinName1').AsString;
                MemPtnGaika.FieldByName('GaikaSoukinName2').AsString  := FieldByName('GaikaSoukinName2').AsString;
                MemPtnGaika.FieldByName('GaikaSoukinName3').AsString  := FieldByName('GaikaSoukinName3').AsString;

                MemPtnGaika.Post();

                Next();
            end;
        end;

    finally
        dqMasterData.Close();
        dqMasterData.Free();
    end;
end;
//<GFB2> ADD Ed

//==============================================================================
// 概要：顧客番号のKeyPressイベント
//==============================================================================
procedure TJNTCRP004003F.txtUserCode_AccountKeyPress(Sender: TObject;
  var Key: Char);
begin
    // 数字以外は許可しない
    case Key of
        char(VK_BACK),'0'..'9':
        begin
        end
		else
		begin
            abort;
		end;
	end;
end;
//==============================================================================
// 概要：顧客番号のExitイベント
//==============================================================================
procedure TJNTCRP004003F.txtUserCode_AccountExit(Sender: TObject);
var
    oTxtEdit : TMTxtEdit;
begin
    oTxtEdit := TMTxtEdit(Sender);
    if (oTxtEdit.Text <> '') then
    begin
        if (not (IsNumeric(oTxtEdit.Text))) or
            (IsZero(oTxtEdit.Text)) then
        begin
            CustomSetFocus([oTxtEdit]);
            abort;
        end;
        oTxtEdit.Text := ToZeroExclude(oTxtEdit.Text);
    end;
end;
//<Account> ADD Ed



//-----------------------------------------------------------------------------
// fnUpdCRD_KAIYOTEIT()
//      PARAM   : CSNCode        入金先内部ｺｰﾄﾞ
//                SeikyuNCode    請求先内部ｺｰﾄﾞ
//                UPDMODE        1:名寄せ登録　2:名寄せ解除
//-----------------------------------------------------------------------------
function  TJNTCRP004003F.fnUpdCRD_KAIYOTEIT(CSNCode,SeikyuNCode: Extended; UPDMODE: Integer): Boolean;

var
    DmqData : TMQuery;
    m_cDBSelect_Rel	: TFDConnection;   //<Rel>
begin

//↓<Rel>
    // -------------------------------------------------------------------------
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    // -------------------------------------------------------------------------

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then    //子会社
    	m_cDBSelect_Rel :=  m_SyncMaster.m_cPDBSelect
    else
        m_cDBSelect_Rel :=  m_cDBSelect;         //通常の会社

//↑<Rel>

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect_Rel, DmqData );

    if UPDMODE = NAYOSE_SET then //名寄せ登録
    begin
        try
            with ( DmqData ) do
            begin
                Close();
                SQL.Clear();
                //請求先を名寄せ親に変更（名寄せ登録）
                SQL.Add('update CRD_KAIYOTEIT set               '
                    +   '    SeikyuNCode   =   :pSeikyuNCode    '
                    +   'where (CSNCode = :pCSNCode)            ');

                ParamByName('pSeikyuNCode').AsFloat   := SeikyuNCode;
                ParamByName('pCSNCode')   .AsFloat   := CSNCode;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB(m_cErrorMsgRec, DmqData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);
                    Result := FALSE;
                    Exit;
                end;
            end;
        finally
            DmqData.Close();
            DmqData.Free();
        end;
        // 正常終了
        Result := TRUE;
    end else
    begin
        try
            with ( DmqData ) do
            begin
                Close();
                SQL.Clear();
                //請求先を名寄せ子に変更（名寄せ解除）
                SQL.Add('update CRD_KAIYOTEIT set         '
                    +   '    SeikyuNCode   =   :pCSNCode  '
                    +   'where (CSNCode = :pCSNCode)      ');

                ParamByName('pCSNCode')   .AsFloat   := CSNCode;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB(m_cErrorMsgRec, DmqData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);
                    Result := FALSE;
                    Exit;
                end;
            end;
        finally
            DmqData.Close();
            DmqData.Free();
        end;
        // 正常終了
        Result := TRUE;
    end;

end;

//<GAIKA_1> ADD St
//==============================================================================
// 概要：債権システム情報オブジェクト構築
//==============================================================================
procedure TJNTCRP004003F.CreateCrdSysInfo();
var
    tblName : String;
    itemID : String;
    objList : TObjectList;

    procedure DoCreate();
    var
        qry: TMQuery;
        idx : Integer;
    begin
        // MQueryの構築
        qry := TMQuery.Create( Self );

        try

            m_cDataModule.SetDBInfoToQuery( m_cDBSelect, qry );

            with qry do
            begin
                Close();
                SQL.Clear();
                SQL.Add(' Select * From ' + tblName);
                SQL.Add(' Where ItemID in ' + itemID);

                if (Open()) then
                begin
                    while (not EOF) do
                    begin
                        idx := objList.Add(TCrdSysInfo.Create());

                        TCrdSysInfo(objList.Items[idx]).BaseNCode	:=	FieldByName('BaseNCode').AsInteger;
                        TCrdSysInfo(objList.Items[idx]).ItemID		:=	FieldByName('ItemID').AsInteger;
                        TCrdSysInfo(objList.Items[idx]).ItemType	:=	FieldByName('ItemType').AsInteger;
                        TCrdSysInfo(objList.Items[idx]).SysKbn		:=	FieldByName('SysKbn').AsInteger;
                        TCrdSysInfo(objList.Items[idx]).SysName		:=	FieldByName('SysName').AsString;
                        TCrdSysInfo(objList.Items[idx]).SysDate		:=	FieldByName('SysDate').AsDateTime;

                        Next();
                    end;
                end;
            end;

        finally
            qry.Close();
            qry.Free();
        end;
    end;
begin

    tblName := 'CRDSYSINFO_GAI';
    itemID  := '(1001)';
    m_CrdSysInfo_Gai := TObjectList.Create();
    objList := m_CrdSysInfo_Gai;
    DoCreate();

end;

//==============================================================================
// 概要：外貨入金採用区分取得
//==============================================================================
function  TJNTCRP004003F.GetGaikaBaseUseKbn(): Integer;
var
    idx : integer;
    obj : TCrdSysInfo;
begin
    result := 0;

    for idx := 0 to m_CrdSysInfo_Gai.Count -1 do
    begin
        obj := TCrdSysInfo(m_CrdSysInfo_Gai[idx]);

        if obj.ItemID = 1001 then
        begin
            result := obj.SysKbn;
            break;
        end;
    end;
end;
//<GAIKA_1> ADD Ed
//<GFB> ADD St
//==============================================================================
// 概要：外貨入金採用区分のOnChangeイベント
//==============================================================================
procedure TJNTCRP004003F.numSaiyoKbn_GaikaChange(Sender: TObject);
var
    bEnabled : Boolean;
begin
	if not m_FormCreateSw then Exit;

    bEnabled := numSaiyoKbn_Gaika.AsInteger <> 0;
    CustomSetEnabled(pnlGaikaDetail, bEnabled);
end;
//<GFB> ADD Ed

//<184>追加：ここからxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------------------------------------------------------------
// TMTxt_NumNameKeyPress()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key
//      RETURN  :
//      MEMO    : 数字入力制限
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.f1NumNameKeyPress(Sender: TObject; var Key: Char);
begin

    // お客様番号入力時半角数字文字のみに制限をする。
    case Key of
        	char(VK_BACK),'0'..'9':
        begin
        end;
		else
		begin
            Key := char(nil);
		end;
	end;
end;
//<184>追加：ここまでxxxxxxxxxxxxxxxxxxxxxxxx

//<PASS>add S
//-----------------------------------------------------------------------------
//		fnPWITEMChkEnt()
//      PARAM   :
//      RETURN  :True:未入力あり False:未入力なし
//      MEMO    :パスワード合成区分で郵便番号、電話番号が選択されていた場合の制御
//              :DXでのみ使用する。
//-----------------------------------------------------------------------------
function TJNTCRP004003F.fnPWITEMChkEnt(): Boolean;
var
	lvMsg,
    lvMsg2,
	lvNm		: String;
    lvBolZip,
    lvBolTel		: Boolean;

    NCode,
    PassKbn,
	PassItem1,
    PassItem2,
    PostNo1,
	PostNo2		: Integer;
    Tel1		: String;

    lvSQL		: String;

	Qry			: TMQuery;

begin
	Result 	:= False;

	lvBolZip 	:= False;
	lvBolTel 	:= False;

	lvMsg	:=  'パスワードに必要な情報が登録されていません。'#13#10'基本情報登録の内容を未入力項目にセットしますか？'#13#10''#13#10'●未入力項目'#13#10;
    lvMsg2	:=  'パスワードに必要な情報が登録されていません。'#13#10'基本情報の郵便番号と電話番号(1)を登録してください。';

	//合計取引先が選択されている場合のみ、メッセージを変更
	//（合計取引先は、基本情報から郵便番号と電話番号を登録できない）
	if HedCsTab.Items.Selected = 1 then
	begin
		lvMsg2	:=  'パスワードに必要な情報が登録されていません。'#13#10'郵便番号と電話番号を登録してください。';
    end;

	Qry := TMQuery.Create(self);
	try
    	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
        with Qry do
        begin
            Close;
            Sql.Clear;

            lvSQL := ' Select sel.PassKbn, sel.PassItemKbn1, sel.PassItemKbn2, ISNULL(tk.PostNo1,0) as PostNo1, ISNULL(tk.PostNo2,0) as PostNo2, ISNULL(tk.Tel1,'''') as Tel1 '+
                     ' From MTOKUI_SEL sel Left Outer Join MTOKUI tk On (sel.BaseNCode = tk.NCode) '+
                     ' WHERE BaseNCode = :NCODE And sel.RecKbn = 1 ';

            Sql.add(lvSQL);
            ParamByName('NCODE').AsFloat := m_TRNCode;
            Open();

            PassKbn		:= GetFld('PASSKBN').AsInteger;
            PassItem1	:= GetFld('PASSITEMKBN1').AsInteger;
            PassItem2	:= GetFld('PASSITEMKBN2').AsInteger;
            PostNo1		:= GetFld('POSTNO1').AsInteger;
            PostNo2		:= GetFld('POSTNO2').AsInteger;
            Tel1		:= GetFld('TEL1').AsString;
        end;
	finally
    	Qry.Close;
    	Qry.Free;
    end;

    if Passkbn <> 2 then
    begin
        Exit;
    end;

	// 郵便番号チェック（パスワード合成に郵便番号が選択されている場合のみ）
    // iItemkbn 6:郵便番号(下4桁) 7:郵便番号(フル桁)
	if (PassItem1 in [6,7]) or (PassItem2 in[6,7]) then
    begin
        lvBolZip :=  ((f1POSTNO1.Text = '') or (StrToIntDef(f1POSTNO2.Text, 0) = 0));

		if lvBolZip then
		begin
			lvMsg	:= lvMsg + '郵便番号';
		end;

    end;

	// 電話番号チェック（パスワード合成に電話番号が選択されている場合のみ）
    // iItemkbn 8:電話番号(下4桁) 9:電話番号(フル桁)
    if (PassItem1 in [8,9]) or (PassItem2 in[8,9]) then
    begin
        lvBolTel := (Trim(f1TEL1.Text) = '');

		if lvBolTel then
		begin
			if lvBolZip then
            begin
				lvMsg	:= lvMsg + ''#13#10'';		// 郵便番号も未入力だったら改行
            end;
			lvMsg	:= lvMsg + '電話番号(1)';
		end;

    end;

	// 未入力ありの場合はメッセージ表示
	if (lvBolZip) or (lvBolTel) then
	begin
        if (lvBolZip and ((PostNo1 = 0) or (PostNo2 = 0))) or (lvBolTel and (Tel1 = '')) then
        begin
            MjsMessageBoxEx(Self, lvMsg2, '警告', mjWarning, mjOK, mjDefOK);
            Result := True;
            Exit;
        end
        else
        begin
            if MjsMessageBoxEx(Self, lvMsg, '確認', mjInformation, mjYesNo, mjDefYes) <> mrYes then
            //「はい」以外を選択
            begin
                if lvBolZip then
                begin
                    DtlCsTab.Items.Selected := 0;
                    MjsSetFocus(Self, f1POSTNO1.Name);
                    Result := True;
                    Exit;
                end
                else if lvBolTel then
                begin
                    DtlCsTab.Items.Selected := 0;
                    MjsSetFocus(Self, f1TEL1.Name);
                    Result := True;
                    Exit;
                end;
				Result := True;
            	Exit;
            end
            else
            //「はい」選択時
            begin
                if lvBolZip then
                begin
                    f1POSTNO1.Value := PostNo1;
                    f1POSTNO2.Value := PostNo2;
                end;

                if lvBolTel then
                begin
                   f1TEL1.Text		:= Tel1;
                end;
            end;
        end;
	end;

end;
//<PASS>add E

//<187> ADD St
//-----------------------------------------------------------------------------
// ControlDeleteButton
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.ControlDeleteButton;
begin
    // 削除ボタンの動作と使用可不可の制御
    B_Delete.OnClick := Nil;
	B_Delete.Enabled := False;

    case HedCsTab.Items.Selected of
        0:		// 実在
		begin
            case DtlCsTab.Items.Selected of
                DTLTAB_DENSHI:
                begin
                    case MNDenDataKbn.AsInteger of
                        DENKBN_DENSAI:
                        begin
                            if m_JNTAuthority.IsDelete then
							begin
			                    B_Delete.OnClick := BDenshi2DeleteClick;
                                B_Delete.Enabled := True;
                            end;
                        end;
                        DENKBN_JEMCO:
                        begin
                            if m_JNTAuthority.IsDelete then
							begin
			                    B_Delete.OnClick := BDenshiDeleteClick;
                                B_Delete.Enabled := True;
                            end;
                        end;
                    end;
                end;
                DTLTAB_ACCOUNT:
                begin
					if Assigned(moAccCsInfo) and m_JNTAuthority.IsDelete then
					begin
	                    B_Delete.OnClick := BAccountDeleteClick;
	                    B_Delete.Enabled := True;
                    end;
                end;
            end;
        end;
        1:		// 合計
  		begin
			case DtlCsTab.Items.Selected of
				DTLTAB_ACCOUNT:
                begin
					if Assigned(moAccCsInfo) and m_JNTAuthority.IsDelete then
					begin
	                    B_Delete.OnClick := BAccountDeleteClick;
	                    B_Delete.Enabled := True;
                    end;
                end;
            end;
        end;
        2:		// 名寄せ
  		begin
            if m_JNTAuthority.IsDelete then
			begin
	            B_Delete.OnClick := BDeleteClick;
                B_Delete.Enabled := True;
            end;
        end;
    end;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// BDenshi2DeleteClick
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.BDenshi2DeleteClick(Sender: TObject);
var
    sUserID, sKanaName, sBankCode, sBranchCode, sAccKbnName, sAccNo: String;
    sMsg: String;

	function EditValue(aValue: String; aFormat: String = ''): String;
	begin
		Result := aValue;

		if Result = '' then Exit;
		if aFormat = '' then Exit;

		Result := FormatFloat(aFormat, StrToInt64Def(Result, 0));
    end;

	function GetVarToStr(aIndex: Integer; aFormat: String = ''): String;
	begin
		if DGridDensai1.FocusedNode.Values[aIndex] = Null then
			Result := ''
		else
	        Result := String(DGridDensai1.FocusedNode.Values[aIndex]);

		Result := EditValue(Result, aFormat);
    end;
begin
    if MNDenDataKbn.AsInteger = 0 then Exit;
	if DGridDensai1.DataSource.DataSet.State in [dsInsert] then Exit;

    sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
    sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
    sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index, DMemDensai1BankCode.DisplayFormat);
    sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index, DMemDensai1BranchCode.DisplayFormat);
	sAccKbnName	:= GetVarToStr(DGridDensai1AccKbnName.Index);
    sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index, DMemDensai1AccNo.DisplayFormat);

    sMsg := Format(MSG_DELETE2, ['選択した利用者番号・口座情報'])+#13#10+
			'　利用者番号：'+sUserID+#13#10+
			'　カナ名称：'+sKanaName+#13#10+
			'　銀行コード：'+sBankCode+#13#10+
			'　支店コード：'+sBranchCode+#13#10+
			'　預金種目：'+sAccKbnName+ #13#10+
			'　口座番号：'+sAccNo;

    if MjsMessageBoxEX(Self, sMsg, DtlCsTab.Items[DTLTAB_DENSHI].Caption + '削除',
		mjQuestion,mjYesNo,mjDefYes) <> mrYes then Exit;

   	DMemDensai1.Delete;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// CheckChangeDensai1
//-----------------------------------------------------------------------------
function TJNTCRP004003F.CheckChangeDensai1: Boolean;
var
	bFindFlg: Boolean;
	iIndex: Integer;
	oNode: TdxTreeListNode;
    sUserID, sKanaName, sBankCode, sBranchCode, sAccKbn, sAccNo: String;

	function GetVarToStr(aIndex: Integer): String;
	begin
		if oNode.Values[aIndex] = Null then
			Result := ''
		else
	        Result := String(oNode.Values[aIndex]);
    end;
begin
	//編集中の場合は取り消しする
	with DGridDensai1 do
	begin
        if DataSource.DataSet.State in [dsInsert, dsEdit] then
        begin
            if State = tsEditing then CloseEditor;
            DataSource.DataSet.Cancel;
        end;
	end;

	Result := True;

	//保存時の行数が異なる場合は変更あり
    if DMemDensai1.RecordCount <> DMemDensai1Sv.RecordCount then Exit;

    for iIndex := 0 to (DGridDensai1.Count - 1) do
    begin
        oNode 		:= DGridDensai1.Items[iIndex];
        sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
        sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
        sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index);
        sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index);
        sAccKbn		:= GetVarToStr(DGridDensai1AccKbn.Index);
        sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index);

//<188> ADD St
		//全ての項目が未設定の行(新規登録用の行)はチェックしない
        if (sUserID = '') and
           (sKanaName = '') and
           (sBankCode = '') and
           (sBranchCode = '') and
           (StrToIntDef(sAccKbn, 0) = 0) and
           (sAccNo = '') then
        begin
            Continue;
        end;
//<188> ADD Ed

		bFindFlg := False;

		//同一のデータが存在する場合はフラグをセット
		if DMemDensai1Sv.RecordCount > 0 then
			DMemDensai1Sv.First;
		while not DMemDensai1Sv.Eof do
		begin
            if (DMemDensai1SvUserID.AsString = sUserID) and
               (DMemDensai1SvKanaName.AsString = sKanaName) and
               (DMemDensai1SvBankCode.AsString = sBankCode) and
               (DMemDensai1SvBranchCode.AsString = sBranchCode) and
               (DMemDensai1SvAccKbn.AsString = sAccKbn) and
               (DMemDensai1SvAccNo.AsString = sAccNo) then
            begin
				bFindFlg := True;
				Break;
            end;

			DMemDensai1Sv.Next;
	    end;

		//同一のデータが存在しない場合は変更あり
		if not bFindFlg then Exit;
    end;

	Result := False;
end;
//<187> ADD Ed

//<187> ADD St
//-----------------------------------------------------------------------------
// UpdateDensai1
//-----------------------------------------------------------------------------
procedure TJNTCRP004003F.UpdateDensai1(aQuery: TMQuery);
var
	bFindFlg: Boolean;
	iIndex: Integer;
	oNode: TdxTreeListNode;
    sUserID, sKanaName, sBankCode, sBranchCode, sAccKbn, sAccNo, sMatchingKey: String;

	function EditValue(aValue: String; aFormat: String = ''): String;
	begin
		Result := aValue;

		if Result = '' then Exit;
		if aFormat = '' then Exit;

		Result := FormatFloat(aFormat, StrToInt64Def(Result, 0));
    end;

	function GetVarToStr(aIndex: Integer; aFormat: String = ''): String;
	begin
		if oNode.Values[aIndex] = Null then
			Result := ''
		else
	        Result := String(oNode.Values[aIndex]);
    end;
begin
	//グリッドにある新規・変更データは登録・更新する
    for iIndex := 0 to (DGridDensai1.Count - 1) do
    begin
        oNode 		:= DGridDensai1.Items[iIndex];
        sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
        sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
        sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index);
        sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index);
        sAccKbn		:= GetVarToStr(DGridDensai1AccKbn.Index);
        sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index);

		bFindFlg := False;

        if (sUserID = '') and
           (sKanaName = '') and
           (sBankCode = '') and
           (sBranchCode = '') and
           (StrToIntDef(sAccKbn, 0) = 0) and
           (sAccNo = '') then
        begin
            Continue;
        end;

		//同一のデータが存在する場合はフラグをセット
		if DMemDensai1Sv.RecordCount > 0 then
			DMemDensai1Sv.First;
		while not DMemDensai1Sv.Eof do
		begin
            if (DMemDensai1SvUserID.AsString = sUserID) and
               (DMemDensai1SvKanaName.AsString = sKanaName) and
               (DMemDensai1SvBankCode.AsString = sBankCode) and
               (DMemDensai1SvBranchCode.AsString = sBranchCode) and
               (DMemDensai1SvAccKbn.AsString = sAccKbn) and
               (DMemDensai1SvAccNo.AsString = sAccNo) then
            begin
				bFindFlg := True;
				Break;
            end;

			DMemDensai1Sv.Next;
	    end;

		//同一のデータが存在しない場合は登録・更新する
		if not bFindFlg then
		begin
			with aQuery do
			begin
                Close;
                SQL.Clear;
                SQL.Add(' INSERT INTO CRD_DENSHISAIKEN_CSINFO '+
	                    ' ( ' +
    	                ' CSNCode, '+
	                    ' DenDataKbn, '+
	                    ' DenUserID1, '+
	                    ' DenUserID2, '+
	                    ' DenUserName, '+
	                    ' DenCSKanaName, '+
	                    ' AllBkCode, '+
	                    ' AllBraCode, '+
	                    ' BankName, '+
	                    ' AccKbn, '+
	                    ' AccNo, '+
	                    ' MatchingKey, '+
	                    ' UpdLoginID '+
        	            ' ) ' +
        	            ' ON EXISTING UPDATE ' +
        	            ' VALUES '+
	                    ' ( ' +
    	                ' :CSNCode, '+
	                    ' :DenDataKbn, '+
	                    ' :DenUserID1, '+
	                    ' :DenUserID2, '+
	                    ' :DenUserName, '+
	                    ' :DenCSKanaName, '+
	                    ' :AllBkCode, '+
	                    ' :AllBraCode, '+
	                    ' :BankName, '+
	                    ' :AccKbn, '+
	                    ' :AccNo, '+
	                    ' :MatchingKey, '+
	                    ' :UpdLoginID '+
        	            ' ) ');

				//銀行コード・支店コード・口座番号の加工
			    sBankCode	:= EditValue(sBankCode, DMemDensai1BankCode.DisplayFormat);
			    sBranchCode	:= EditValue(sBranchCode, DMemDensai1BranchCode.DisplayFormat);
			    sAccNo		:= EditValue(sAccNo, DMemDensai1AccNo.DisplayFormat);

				//マッチングキーの編集
            	sMatchingKey := sBankCode+'-'+		//銀行コード
                            	sBranchCode+'-'+    //支店コード
                            	sAccKbn+ '-'+       //預金種目
                            	sAccNo;             //口座番号

                ParamByName('CSNCode'		).AsString	:= FormatFloat('0', m_TRNCode);	//AsFloatは使わない
                ParamByName('DenDataKbn'	).AsInteger	:= DENKBN_DENSAI;
                ParamByName('DenUserID1'	).AsString	:= sUserID;
                ParamByName('DenUserID2'	).AsString	:= '';
                ParamByName('DenUserName'	).AsString	:= '';
                ParamByName('DenCSKanaName'	).AsString	:= sKanaName;
                ParamByName('AllBkCode'		).AsString	:= sBankCode;
                ParamByName('AllBraCode'	).AsString	:= sBranchCode;
                ParamByName('BankName'		).AsString	:= '';
                ParamByName('AccKbn'		).AsString	:= sAccKbn;
                ParamByName('AccNo'			).AsString	:= sAccNo;
                ParamByName('MatchingKey'	).AsString	:= sMatchingKey;
                ParamByName('UpdLoginID'	).AsString	:= FormatFloat('0', rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD);

                ExecSQL();
			end;
		end;
    end;

	//保存用MemDataにある削除データは削除する
	if DMemDensai1Sv.RecordCount > 0 then
	    DMemDensai1Sv.First;
    while not DMemDensai1Sv.Eof do
    begin
		bFindFlg := False;

        for iIndex := 0 to (DGridDensai1.Count - 1) do
        begin
            oNode 		:= DGridDensai1.Items[iIndex];
            sUserID		:= GetVarToStr(DGridDensai1UserID.Index);
            sKanaName	:= GetVarToStr(DGridDensai1KanaName.Index);
            sBankCode	:= GetVarToStr(DGridDensai1BankCode.Index);
            sBranchCode	:= GetVarToStr(DGridDensai1BranchCode.Index);
            sAccKbn		:= GetVarToStr(DGridDensai1AccKbn.Index);
            sAccNo		:= GetVarToStr(DGridDensai1AccNo.Index);

            //同一のデータが存在する場合はフラグをセット
           	if (DMemDensai1SvUserID.AsString = sUserID) and
               (DMemDensai1SvKanaName.AsString = sKanaName) and
               (DMemDensai1SvBankCode.AsString = sBankCode) and
               (DMemDensai1SvBranchCode.AsString = sBranchCode) and
               (DMemDensai1SvAccKbn.AsString = sAccKbn) and
               (DMemDensai1SvAccNo.AsString = sAccNo) then
            begin
                bFindFlg := True;
                Break;
            end;
		end;

		//同一のデータが存在しない場合は削除する
		if not bFindFlg then
		begin
			with aQuery do
			begin
                Close;
                SQL.Clear;
                SQL.Add(' DELETE FROM CRD_DENSHISAIKEN_CSINFO '+
        	            ' WHERE '+
    	                '     CSNCode = :CSNCode '+
	                    ' AND DenDataKbn = :DenDataKbn '+
	                    ' AND DenUserID1 = :DenUserID1 '+
	                    ' AND DenCSKanaName = :DenCSKanaName '+
	                    ' AND AllBkCode = :AllBkCode '+
	                    ' AND AllBraCode = :AllBraCode '+
	                    ' AND AccKbn = :AccKbn '+
	                    ' AND AccNo = :AccNo '+
        	            ' ');

               	sUserID		:= DMemDensai1SvUserID.AsString;
                sKanaName	:= DMemDensai1SvKanaName.AsString;
                sBankCode	:= DMemDensai1SvBankCode.AsString;
                sBranchCode	:= DMemDensai1SvBranchCode.AsString;
                sAccKbn		:= DMemDensai1SvAccKbn.AsString;
                sAccNo		:= DMemDensai1SvAccNo.AsString;

				//銀行コード・支店コード・口座番号の加工
			    sBankCode	:= EditValue(sBankCode, DMemDensai1BankCode.DisplayFormat);
			    sBranchCode	:= EditValue(sBranchCode, DMemDensai1BranchCode.DisplayFormat);
			    sAccNo		:= EditValue(sAccNo, DMemDensai1AccNo.DisplayFormat);

                ParamByName('CSNCode'		).AsString	:= FormatFloat('0', m_TRNCode);	//AsFloatは使わない
                ParamByName('DenDataKbn'	).AsInteger	:= DENKBN_DENSAI;
                ParamByName('DenUserID1'	).AsString	:= sUserID;
                ParamByName('DenCSKanaName'	).AsString	:= sKanaName;
                ParamByName('AllBkCode'		).AsString	:= sBankCode;
                ParamByName('AllBraCode'	).AsString	:= sBranchCode;
                ParamByName('AccKbn'		).AsString	:= sAccKbn;
                ParamByName('AccNo'			).AsString	:= sAccNo;

                ExecSQL();
			end;
		end;

        DMemDensai1Sv.Next;
    end;
end;
//<187> ADD Ed

end.

