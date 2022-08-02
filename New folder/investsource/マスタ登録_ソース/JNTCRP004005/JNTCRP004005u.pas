//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先登録　債務情報
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：井上佳美(LEAD)
//      作成日      ：2005.03.22(TUE)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <100>   井上 佳美   2005/07/15(Fri) ﾃﾝﾌﾟﾚｰﾄ機能を追加
//  <101>   井上 佳美   2005/08/02(THU) ﾗｲｾﾝｽの制御を追加（販売のﾗｲｾﾝｽありの場合は、管理情報を非表示）
//  <102>   井上 佳美   2005/08/12(FRI) JNTCommonを親から引き継ぐように修正
//  <103>   高橋 功二   2005/08/24(Wed) TMJSAppRecordを親から引き継ぐように修正
//  <104>   高橋 功二   2005/08/25(Thu) 支払通知書ﾌｫｰﾑ、鏡欄税印字の追加
//  <105>   高橋 功二   2005/08/25(Thu) ﾃﾝﾌﾟﾚｰﾄ区分(TemplateKbn)の考慮
//  <106>   高橋 功二   2005/08/31(Wed) 郵便番号DLGを住所上段からも使用可能にする
//  <107>   高橋 功二   2005/09/06(Tue) 印刷機能の正式実装まで印刷ﾎﾞﾀﾝをDiableする
//  <108>   高橋 功二   2005/09/13(TUE) 細目科目がﾌﾘｰ属性の場合、禁則文字入力を考慮する。
//  <109>   高橋 功二   2005/09/18(Sun) 代替得意先の存在ﾁｪｯｸを修正
//  <110>   高橋 功二   2005/09/18(Sun) 代替得意先の設定、解除を行ったときの不具合修正
//  <111>   高橋 功二   2005/09/22(Thu) 名寄せの締日ﾁｪｯｸ、請求区分ﾁｪｯｸ等追加
//  <112>   高橋 功二   2005/09/22(Thu) 親得意先の締日情報をｾｯﾄ、実績ﾏｽﾀの作成処理追加
//  <113>   高橋 功二   2005/09/22(Thu) 親子ﾌﾗｸﾞ変更処理追加
//  <114>   高橋 功二   2005/09/22(Thu) 他の合計仕入先の代替になっている場合は指定できない
//  <115>   高橋 功二   2005/09/24(Sat) 名寄せの子に設定しようとした仕入先に実績が存在している場合は
//                                      名寄せ設定不可とする
//                                      (親の実績を作成する場合に_103を実行するがその時に子の実績も
//                                      再作成されてしまう為）
//  <116>   高橋 功二   2005/09/25(Sun) 登録済の代替仕入先に支払が発生した場合は変更不可とする
//  <117>   高橋 功二   2005/09/25(Sun) 合計取引先の子に支払が発生しているかﾁｪｯｸ
//  <118>   茂木 勇次   2005/09/28(WED) 切出/埋込ﾎﾞﾀﾝを継承し、子側で処理を行う。
//  <121>   飯塚 健介   2005/10/12(WED) mtokui_sel.Oyakoflgに関する更新条件及び更新方法の修正
//  <122>   飯塚 健介   2005/10/21(FRI) 0ｺｰﾄﾞ入力可能
//  <123>   飯塚 健介   2005/10/21(FRI) 各種ﾌｨｰﾙﾄﾞﾁｪｯｸ対応
//  <124>   加藤(PRIME) 2005/10/27(THU) 削除ﾒｯｾｰｼﾞ変更
//  <125>   加藤(PRIME) 2005/11/07(MON) 名寄せｸﾞﾘｯﾄﾞで数値属性でも文字が入力できた
//  <126>   加藤(PRIME) 2005/11/28(MON) 履歴用ｽﾄｱﾄﾞ呼び出し
//	<HAN>   広田(PRIME) 2005/12/08(THU) 印刷時の範囲指定修正
//	<127>   広田(PRIME) 2005/12/12(MON) 仕入合計欄税印字が帳票に出ない対応
//  <128>   加藤(PRIME) 2005/12/21(WED) 登録・更新権限がないときに更新ﾎﾞﾀﾝを無効、ｸﾞﾘｯﾄﾞ初期表示をRowSelectに
//  <129>   加藤(PRIME) 2005/12/21(WED) 登録・更新権限がないときにF7ﾃﾝﾌﾟﾚｰﾄ押下でｱｸｾｽｴﾗｰになる不具合修正
//  <130>   青木(PRIME) 2005/12/22(Thu) 同一名寄せ親の時、2番目以降出力しないよう対応
//  <131>   茂木 勇次   2006/02/07(TUE) 未対応帳票の作成。
//  <132>   高橋 功二   2006/03/13(MON) 休日区分の異なる取引先で名寄せの登録が行えてしまう件について対応
//  <133>   川戸(MSI)   2006/04/18(TUE) 進捗連動対応
//  <134>   川戸(MSI)   2006/06/21(WED) 進捗連動の初期処理後、必須で終了処理が行われるよう修正
//  <135>   川戸(MSI)   2006/07/20(THU) 販売ﾗｲｾﾝｽに関わらず管理情報を非表示とし、ﾗｲｾﾝｽが無い場合は
//                                      仕入先住所をMTOKUI_SELにセットする
//  <136>   川戸(MSI)   2006/07/24(MON) 販売ライセンス・一括請求対応
//  <137>   川戸(MSI)   2006/08/04(FRI) 進捗連動排他処理対応
//  <138>   川戸(MSI)   2006/08/16(WED) 債務管理５次追加修正
//                                      ・既存行の子仕入先の検索エクスプローラボタンを非表示
//                                      ・名寄せ解除（親にぶらさがる子を全て削除）すると債権の親子フラグも初期化される不具合を修正
//                                      ・帳票用bplが正しくunloadされずにGali終了まで掴まれた状態になる不具合を修正
//                                      ・名寄せ親から子仕入先を全て削除した場合、親の締め日情報を初期化する様に修正
//  <139>   川戸(MSI)   2006/08/31(THU) 債務管理５次追加修正
//  <140>   川戸(MSI)   2006/09/21(THU) 編集内容が取り消された時、確認メッセージを出力する
//  <141>   川戸(MSI)   2006/09/22(FRI) 進捗連動確認メッセージで「いいえ」が選択された時に、入力行をキャンセルする
//  <142>   川戸(MSI)   2006/09/22(FRI) 名寄せタブの入力でｴﾗｰﾒｯｾｰｼﾞ出力後、ﾏｳｽｸﾘｯｸで名寄せ情報の修正ができるようにする
//  <143>   川戸(MSI)   2006/09/26(TUE) 連動得意先の追加
//  <144>   川戸(MSI)   2006/11/08(WED) 名寄せ親代替仕入先更新の不具合修正
//  <145>   川戸(MSI)   2006/11/16(THU) 受取人名称・支払通知書区分の追加
//  <146>   川戸(MSI)   2006/12/12(THU) 不具合修正
//  <147>   川戸(MSI)   2007/02/01(THU) MTOKUI_PAYの修正日付を更新
//  <148>   川戸(MSI)   2007/04/06(FRI) 販売ﾗｲｾﾝｽをﾁｪｯｸして名寄せの制御を行う
//  <149>   川戸(MSI)   2007/04/16(MON) 連動取引先の期日チェックを行わない
//  <150>   川戸(MSI)   2007/05/07(MON) 連動得意先に債権各店別請求の名寄せ子の登録ができず、
//                                      債権各店別請求の名寄せ親の入力が可能な不具合を修正
//  <151>   川戸(MSI)   2007/05/07(MON) 帳票レイアウトの変更
//  <152>   川戸(MSI)   2007/05/15(TUE) 取引先検索Expの検索辞書に部門と社員が表示されないよう修正
//  <153>   川戸(MSI)   2007/05/15(TUE) 基本情報ではなく債務情報の登録内容で検索できるよう修正
//  <Rel>   高橋 功二   2007/05/23(WED) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//  <154>   川戸(MSI)   2007/07/09(MON) 取引先の属性が数値(前ゼロあり)の時、名寄せ親代替仕入先に２桁以上の
//                                      入力ができない不具合を修正
//  <155>   川戸(MSI)   2007/07/10(TUE) 連動得意先の入力可不可制御を修正
//  <156>   川戸(MSI)   2007/08/16(THU) 決算確定後は、取消ボタンとF7:テンプレートも使用不可とする
//  <157>   川戸(MSI)   2007/08/22(WED) 預かり源泉税・支払調書対応
//	<158>	関(PRIME)	2008/01/30(WED)	ﾏｽﾀ更新履歴対応
//	<159>	川戸(MSI)	2008/02/29(FRI) 通知書名寄せ対応
//	<160>	長沼(MSI)	2008/04/10(THU) 締め日制御解除対応漏れ修正
//  <161>   T.SATOH(IDC)2008/05/27(TUE) 名寄せ締日制御解除対応修正
//  <162>   川畑@MSI	2008/06/17(TUE) 連動処理の場所移動
//  <163>   T.SATOH(IDC)2009.01.08(THU) スポット支払対応
//  <164>   T.SATOH(IDC)2009.04.24(FRI) 名寄せ制御全解除(締日・伝票入力)対応
//  <165>   T.SATOH(IDC)2009.05.07(THU) スポット支払対応②
//  <166>   T.SATOH(IDC)2009.07.06(MON) テンプレート修正でも進捗連動などのメッセージが表示される
//  <167>   T.SATOH(IDC)2009.07.06(MON) 債務情報テンプレート更新
//  <168>   T.SATOH(IDC)2009.07.15(WED) テンプレート時、基本情報タブからのEnterが効かない
//  <LPH>   T.SATOH(IDC)2010.05.21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//  <169>   小島(MSI)   2010.07.05(MON) 名寄せ絞り込み対応
//  <169-1> 小島(MSI)   2010.08.20(FRI) 矢印キー押下のとき、エラーメッセージが出ない件を修正
//  <170>   小島(MSI)   2010.10.27(WED) 連動得意先名称に支払通知書フォーム名称が表示される不具合を修正
//                                      (該当しないCD入力時、タブを切り替えるとエラー表示されてしまう)
//  <171>   SATOH(GSOL) 2010.10.27(WED) 名寄せグリッドにフォーカスがあたった場合、フォーカスは先頭カラムとする
//  <172>   SATOH(GSOL) 2010.10.27(WED) 数値前ゼロコードの000000が名寄せコードで検索エクスプローラから選択できない
//  <173>   SATOH(GSOL) 2010.10.27(WED) 源泉関連に不正な値を入力し、基本情報タブで更新するとエラーが発生する
//  <174>   SATOH(GSOL) 2010.10.28(THU) 通知書名寄せの削除で名寄せ種別の考慮が漏れていた不具合を修正
//                                      また、通知書名寄せの場合はMTOKUI/MTOKUI_SELへの更新は行わない
//  <175>   小島(MSI)	2011.03.11(FRI) 部門入力フィールド追加(個別対応)
//  <176>   SATOH(GSOL) 2011.05.12(THU) 支払通知書メール配信対応
//  <177>   SATOH(GSOL) 2011.05.25(WED) 名寄せゴミレコード事前削除対応
//  <178>   SATOH(GSOL) 2011.06.08(WED) 名寄せ親代替仕入先セット時の実在支払先進捗連動漏れを修正
//  <KDS>   SATOH(GSOL) 2012.02.07(TUE) ShiftState対応
//  <179>   SATOH(GSOL) 2012.02.10(FRI) 起動時エラーの回避(販売:Gali2258)
//  <180>   SATOH(GSOL) 2012.02.15(WED) 敬称出力改良
//  <181>   SATOH(GSOL) 2012.08.02(THU) 共通ＤＢクローズ漏れ修正
//  <AUT>   SATOH(GSOL) 2012.08.07(TUE) JNTAuthority対応
//  <#GAI>  SATOH(GSOL) 2014.05.19(MON) 外貨債務管理対応
//  <#C16>  KUMO        2014.06.30(WED) 取引先コード16桁対応(デザインのみ)
//                                      ・取引先登録の取引先選択のコード入力は幅を広げて修正
//                                        また、取引コードに合わせて、右に配置されている各コンポーネントも右に移動
//                                      ・入力系については、長体をかけて修正（文字列は長体がかかったが、数値はかからない（原因不明））
//  <#MYN>  SATOH(GSOL) 2015/11/17(TUE) マイナンバー対応(個人／法人区分は常に入力不可)
//=============================================================================
unit JNTCRP004005U;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.ExtCtrls,  ComCtrls, VCL.ImgList, VCL.StdCtrls,  dxGrClms, dxTL, dxDBGrid,
  dxCntner, FireDAC.Comp.Client, Db, dxmdaset, Menus, ToolWin, CommCtrl,
  Variants,
  //QuickRpt,Qrctrls,

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
  MJSSpeedButton,   // <118>
  IniFiles,         // <164>
  MLBplLoaderU,     // <LPH> ADD
  MJSKeyDataState,	// <KDS> ADD

  { LEAD-SEL_TEAM専用}
  JNTSelDModul,
  JNTSelGlobal,
  JNTSelGlobalConst,
  JNTSelCorpSys,

  JNTExPGlobal, JNTPDlg,{<PRN>}

  { 共通ﾏｽﾀﾓｼﾞｭｰﾙ }
  JNTCommonu,
  JNTAuthorityu,   // <AUT> ADD
  JNTMasComu,
  JNTMasWndIFu,
  JNTMasTreee2Dlgu,
  JNTFuncU, MJSStatusBar, MJSFunctionBar, MJSSPFunctionBar, ActnList,
  FXLicense, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, System.Actions;

const
    // OnPaint 時の処理起動Message用
	WM_ONPAINT	= WM_APP + 1;

  {$I JNTPayProgRendoH.inc}         // <133> 2006/04/18 H.Kawato Add 進捗連動対応
  {$I JNTPayProgRendoGH.inc}        // <#GAI> ADD 外貨進捗連動対応
type
  {$include JNTSelPrtIF.inc}        // <PRN>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;


    // ｺｰﾄﾞﾘｽﾄ(数値ｺｰﾄﾞ)
	CodeList		= Record
    	iCode	   	:	Integer;
        sName		:	String;
    end;

    AfterSaveRec	= Record
        sPayCD	    :   String;     // 支払先ｺｰﾄﾞ
        sOyaCD		:   String;		// 名寄せ親支払先ｺｰﾄﾞ
	end;

    // ﾌｧﾝｸｼｮﾝ制御用<100>
    urFncInfo = record
        Caption: array[0..7] of String;
        Action:  array[0..7] of TAction;
    end;
type
  {$i ActionInterface.inc}
  {$I MasCommonFuncH.inc}
  {$include JNTCRPSyncMasterH.inc}                          // <Rel> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

	TJNTCRP004005F = class(TForm)
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
    HedCsTab: TMTab;
    HedPanel: TMPanel;
    LblTRCODE: TMLabel;
    f0CODE: TMTxtEdit;
    f1NAME: TMTxtEdit;
    DtlCsSub01Panel: TMPanel;
    DtlCsTab: TMTab;
    tbsKihon: TMPanel;
    DtlCsSub02Panel: TMPanel;
    GridNayose: TdxDBGrid;
    GridNayoseCode: TdxDBGridButtonColumn;
    GridNayoseName: TdxDBGridColumn;
    GridNayoseOyaCode: TdxDBGridButtonColumn;
    GridNayoseOyaName: TdxDBGridColumn;
    DSNayose: TDataSource;
    MemNayose: TdxMemData;
    MemNayoseHojCode: TStringField;
    MemNayoseBaseHojCode: TStringField;
    MemNayoseSName: TStringField;
    MemNayoseOyaHojCD: TStringField;
    MemNayoseOyaBaseHojCD: TStringField;
    MemNayoseOyaName: TStringField;
    MemNayosePayNCode: TFloatField;
    MemNayoseOyaNCode: TFloatField;
    PnlSelInfo: TMPanel;
    MLabel14: TMLabel;
    LblBMCODE: TMLabel;
    f1BMCODE: TMTxtEdit;
    LblTNCODE: TMLabel;
    LblUSDENPFM: TMLabel;
    LblUSGKEI: TMLabel;
    f1USDENPFMNM: TMLabel;
    f1USGKEINM: TMLabel;
    f1USDENPFM: TMNumEdit;
    f1USGKEI: TMNumEdit;
    f1TNCODE: TMTxtEdit;
    f1BMNAME: TMLabel;
    f1TNNAME: TMLabel;
    MLabel2: TMLabel;
    MPanel3: TMPanel;
    MSPFunctionBar: TMSPFunctionBar;
    CmnStatusBar: TMStatusBar;
    aclExec: TActionList;
    AcTemplate: TAction;
    AddPanel: TMPanel;
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
    TempMode: TPanel;
    StdProc3: TFDStoredProc;
    StdProc6: TFDStoredProc;
    MLabel18: TMLabel;
    MLabel1: TMLabel;
    MLabel29: TMLabel;
    f1SSGKEI: TMNumEdit;
    f1SSDENPFM: TMNumEdit;
    f1SSDENPFMNM: TMLabel;
    f1SSGKEINM: TMLabel;
    MLabel20: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;
    StdProc5: TFDStoredProc;
    StdProc4: TFDStoredProc;
    MemPrint: TdxMemData;
    MemPrintGCode: TStringField;
    MemPrintRenso: TStringField;
    MemPrintNmk: TStringField;
    MemPrintNm: TStringField;
    MemPrintPostNo1: TStringField;
    MemPrintPostNo2: TStringField;
    MemPrintTStartDate: TStringField;
    MemPrintTEndDate: TStringField;
	//@　↓12.02
    MemPrintUpdDateTM: TStringField;
	//@ ↑
    MemPrintAds1: TStringField;
    MemPrintAds2: TStringField;
    MemPrintTel1: TStringField;
    MemPrintSectNm: TStringField;
    MemPrintTanNm: TStringField;
    MemPrintKeisyo: TStringField;
    MemPrintMail: TStringField;
    MemPrintBmNCd: TStringField;
    MemPrintBmNm: TStringField;
    MemPrintTnNCd: TStringField;
    MemPrintTnNm: TStringField;
    MemPrintUSDenPfm: TIntegerField;
    MemPrintUSDenPfmNm: TStringField;
    MemPrintUSGKei: TIntegerField;
    MemPrintUSGKeiNm: TStringField;
    MemPrintNayose: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    MemPtnJitsuzai: TdxMemData;
    MemPtnJitsuzaiFusen: TGraphicField;
    MemPtnJitsuzaiGCode: TStringField;
    MemPtnJitsuzaiRenso: TStringField;
    MemPtnJitsuzaiNmk: TStringField;
    MemPtnJitsuzaiNm: TStringField;
    MemPtnGoukei: TdxMemData;
    GraphicField1: TGraphicField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    MemPtnGoukeistrAddress: TStringField;
    MemPtnGoukeinZipCodeUpper: TIntegerField;
    MemPtnGoukeinZipCodeLower: TIntegerField;
    PnlNayoseInfo: TMPanel;
    f1SKYKBNNM: TMLabel;
    MLabel35: TMLabel;
    MLabel34: TMLabel;
    f1SKYKBN: TMNumEdit;
    cbPayRootKbn: TMCheckBox;
    NayoseOyaLabel: TMLabel;
    f1NayoseOyaCode: TMTxtEdit;
    f1NayoseNM: TMLabel;
    SeikyuKbnLabel2: TLabel;
    SKYKBN2: TMNumEdit;
    SKYKBNNM2: TMLabel;
    NayoseOyaLabel2: TMLabel;
    NayoseOyaCode2: TMTxtEdit;
    NayoseNM2: TMLabel;
    MemNayoseCngNCode: TFloatField;
    MemNayoseNDCode: TStringField;
    MemNayoseNDNAME: TStringField;
    GridNayosePayNCode: TdxDBGridCurrencyColumn;
    GridNayoseCngNCode: TdxDBGridCurrencyColumn;
    MemNayoseUsKinKbn: TIntegerField;
    StdProc7: TFDStoredProc;
    PnlRendouInfo: TMPanel;
    MLabel6: TMLabel;
    MLabel7: TMLabel;
    LblRendouCode: TMLabel;
    f1RendouNM: TMLabel;
    f1RendouCode: TMTxtEdit;
    MemPrintRendoCode: TStringField;
    MemPrintRendoNmk: TStringField;
    PnlButton: TMPanel;
    Image_Fusen_Red: TImage;
    Image_Fusen_Blue: TImage;
    Image_Fusen_Green: TImage;
    Image_Fusen_Orange: TImage;
    Image_Fusen_Glay: TImage;
    MBitBtnUpd: TMBitBtn;
    MBitBtnCancel: TMBitBtn;
    MPanel1: TMPanel;
    MLabel5: TMLabel;
    MLabel8: TMLabel;
    MLabel9: TMLabel;
    f1LetterKbn: TMNumEdit;
    f1LetterKbnNM: TMLabel;
    MLabel10: TMLabel;
    AcCloseDay: TAction;
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
    MDPrintBmNCd: TStringField;
    MDPrintBmNm: TStringField;
    MDPrintTnNCd: TStringField;
    MDPrintTnNm: TStringField;
    MDPrintUSDenPfm: TIntegerField;
    MDPrintUSDenPfmNm: TStringField;
    MDPrintUSGKei: TIntegerField;
    MDPrintUSGKeiNm: TStringField;
    MDPrintRendoCode: TStringField;
    MDPrintRendoNmk: TStringField;
    MDPrintUketoriName: TStringField;
    MDPrintLetterKbnName: TStringField;
    MDPrintLetterKbn: TStringField;
    MDPrintUsKinKbn: TIntegerField;
    MDPrintUsKinKbnNm: TStringField;
    MDPrintCngGCode: TStringField;
    MDPrintCngName: TStringField;
    MemPtnNayose: TdxMemData;
    MemPtnNayoseHojCode: TStringField;
    MemPtnNayoseBaseHojCode: TStringField;
    MemPtnNayoseSName: TStringField;
    MemPtnNayoseOyaHojCD: TStringField;
    MemPtnNayoseOyaBaseHojCD: TStringField;
    MemPtnNayoseOyaName: TStringField;
    MemPtnNayosePayNCode: TFloatField;
    MemPtnNayoseOyaNCode: TFloatField;
    MemPtnNayoseCngNCode: TIntegerField;
    MemPtnNayoseSeikyuKbnNm: TStringField;
    MemPtnNayoseREndKaisu: TIntegerField;
    MemPtnNayosePCloseDay1: TIntegerField;
    MemPtnNayosePCloseDay1Nm: TStringField;
    MemPtnNayosePCloseDay2: TIntegerField;
    MemPtnNayosePCloseDay2Nm: TStringField;
    MemPtnNayosePCloseDay3: TIntegerField;
    MemPtnNayosePCloseDay3Nm: TStringField;
    MemPtnNayosePayMonth1: TIntegerField;
    MemPtnNayosePayMonth1Nm: TStringField;
    MemPtnNayosePayMonth2: TIntegerField;
    MemPtnNayosePayMonth2Nm: TStringField;
    MemPtnNayosePayMonth3: TIntegerField;
    MemPtnNayosePayMonth3Nm: TStringField;
    MemPtnNayosePayDay1: TIntegerField;
    MemPtnNayosePayDay1Nm: TStringField;
    MemPtnNayosePayDay2: TIntegerField;
    MemPtnNayosePayDay2Nm: TStringField;
    MemPtnNayosePayDay3: TIntegerField;
    MemPtnNayosePayDay3Nm: TStringField;
    MemPtnNayosePHolidayKbn1: TIntegerField;
    MemPtnNayosePHolidayKbn1Nm: TStringField;
    MemPtnNayosePHolidayKbn2: TIntegerField;
    MemPtnNayosePHolidayKbn2Nm: TStringField;
    MemPtnNayosePHolidayKbn3: TIntegerField;
    MemPtnNayosePHolidayKbn3Nm: TStringField;
    MemPtnNayoseDaitaiMark: TStringField;
    MemPtnNayosePageEnd: TIntegerField;
    tbsPay: TMPanel;
    MLabel11: TMLabel;
    PnlGensenInfo: TMPanel;
    f2GensenKbnNM: TMLabel;
    MLabel47: TMLabel;
    lblPersonKbn: TMLabel;
    f2PersonKbnNM: TMLabel;
    f2GensenKbn: TMNumEdit;
    f2PersonKbn: TMNumEdit;
    MDPrintGensenKbn: TStringField;
    MDPrintGensenKbnName: TStringField;
    MDPrintPersonKbn: TStringField;
    MDPrintPersonKbnName: TStringField;
    MDPrintVerData: TIntegerField;
    lblGensenKbn: TMLabel;
    SeikyuKbnLabel: TMLabel;
    MLabel17: TMLabel;
    MLabel19: TMLabel;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;
    PnlReceiverName: TMPanel;
    f1ReceiverName: TMTxtEdit;
    MLabel24: TMLabel;
    f2OyaCode: TMTxtEdit;
    f2OyaName: TMLabel;
    MLabel27: TMLabel;
    f2KoCode: TMTxtEdit;
    f2KoName: TMLabel;
    MLabel28: TMLabel;
    MLabel26: TMLabel;
    DtlCs1LabelBmnNameTitle: TMLabel;
    f1BmnCode: TMTxtEdit;
    f1BmnName: TMLabel;
    MDPrintBmnTitle: TStringField;
    MLabel12: TMLabel;
    PnlMailnfo: TMPanel;
    f2MailKbnNM: TMLabel;
    MLabel21: TMLabel;
    lblPassword: TMLabel;
    lblMailKbn: TMLabel;
    f2MailKbn: TMNumEdit;
    f2Password: TMTxtEdit;
    MDPrintMailKbn: TStringField;
    MDPrintMailKbnName: TStringField;
    MDPrintPassword: TStringField;

    procedure   FormCreate                          (Sender: TObject);
    procedure   FormShow                            (Sender: TObject);
    procedure   FormActivate                        (Sender: TObject);
    procedure   FormHide                            (Sender: TObject);
	procedure   FormClose                           (Sender: TObject; var Action: TCloseAction);
	procedure   FormCloseQuery                      (Sender: TObject; var CanClose: Boolean);
    procedure   fnEnter                             (Sender: TObject);
    procedure   fnFldOnChg                          (Sender: TObject);
    procedure   f1POSTNO1Exit                       (Sender: TObject);
    procedure   fnZipOnArrowClick                   (Sender: TObject);
    procedure   f1Exit                              (Sender: TObject);
    procedure   fnDtlCs1EditZipCodeOnKeyDown        (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   BtnClick                            (Sender: TObject);
    procedure   f1ItemsCheak                        (Sender: TObject);
    procedure   f2ItemsCheak                        (Sender: TObject);  // <157>
    procedure   TMNum_KnjkmkEnter                   (Sender: TObject);
    procedure   TMNum_KnjkmkChange                  (Sender: TObject);
    procedure   HedCsTabChange                      (Sender: TObject);
    procedure   GridNayoseBeforeChangeColumn        (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                     NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure   GridNayoseChangeColumn              (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure   GridNayoseChangeNodeEx              (Sender: TObject);
    procedure   NayoseEnter                         (Sender: TObject);
    procedure   NayoseExit                          (Sender: TObject);
    procedure   CmnGridKeyDown                      (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure   DSNayoseStateChange                 (Sender: TObject);
    procedure   MemNayoseBeforePost                 (DataSet: TDataSet);
    procedure   BDeleteClick                        (Sender: TObject);
    procedure   cbPayRootKbnClick                   (Sender: TObject);
    procedure   ArrowClick                          (Sender: TObject);
    procedure   GridClmBtnClick                     (Sender: TObject);
    procedure   MSPFunctionBarFunctionClick(Sender: TObject;FuncNo: Integer);
    procedure   AcTemplateExecute                   (Sender: TObject);
    procedure   f0CODEExit                          (Sender: TObject);
    procedure   FormDestroy                         (Sender: TObject);
    procedure   fnPrintClick                        (Sender: TObject);
    procedure   BChangeClick                        (Sender: TObject);
    procedure   evtGridNayoseKeyPress(Sender: TObject; var Key: Char);  // <118>

    procedure f1SKYKBNChange(Sender: TObject);
    procedure GridNayoseCustomDraw(Sender: TObject; ACanvas: TCanvas;   // <136>
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure AcCloseDayExecute(Sender: TObject);
    procedure DtlCsTabChange(Sender: TObject);
    procedure f1BmnCodeKeyPress(Sender: TObject; var Key: Char);

  private
	{ Private 宣言 }
    m_pRec			        : ^TMjsAppRecord;		        // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ(ｾｰﾌﾞ用)<BPL>
	m_Base_pRec		        : ^TMjsAppRecord;               // <103>
    m_cDataModule	        : TMDataModulef;                // MJS ﾃﾞｰﾀﾍﾞｰｽ操作ﾓｼﾞｭｰﾙ
    m_cComArea		        : TJNTMASCom;                   // ｼｽﾃﾑﾒﾓﾘ構造体ﾎﾟｲﾝﾀ<BPL>
    m_cDBSelect		        : TFDConnection;                    // 会社DB
    m_cErrorMsgRec		    : TMJSMsgRec;                   // MJS専用ﾒｯｾｰｼﾞ
    m_cJNTArea              : TJNTCommon;

    m_PayProgRendo          : TJNTPayProgRendo;             // <133> 2006/04/18 H.Kawato Add 進捗連動対応
    m_PayProgRendoChild     : TJNTPayProgRendo;             // 名寄せ親代替仕入先チェック用 <178> ADD

    m_CmpList	            : TList;
    B_Print 	            : TMSpeedButton;                // 印刷
    B_Syousai 	            : TMSpeedButton;                // 詳細
    B_Delete                : TMSpeedButton;                // 削除
    B_Copy                  : TMSpeedButton;                // 科目ｺﾋﾟｰ
    B_Search                : TMSpeedButton;                // 検索
    ToolButton 	            : TToolButton;                  // 付箋
    B_Change                : TMSpeedButton;                // 切出/埋込ﾎﾞﾀﾝ<118>
    m_bBtnChange	        : Boolean;                      // 切出≪=≫埋込ﾌﾗｸﾞ<118>

    m_AcControl		        : TWinControl;                  // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
    m_bFirstFlag	        : Boolean;                      // 表示ﾌﾗｸﾞ
    m_CloseFlg	            : Boolean;                      // 終了ﾌﾗｸﾞ
    m_nProcDivision		    : Integer;
    m_ZoomRatio			    : Integer;                      // 拡大率

    m_TRCodeDigit           : Integer;                      // 取引先ｺｰﾄﾞ桁数
    m_TRCodeAttr            : Integer;                      // 取引先ｺｰﾄﾞ属性
    m_TRJHojyoName          : String;                       // 取引先補助名称(実在)
    m_BMCodeDigit           : Integer;                      // 部門ｺｰﾄﾞ桁数
    m_BMCodeAttr            : Integer;                      // 部門ｺｰﾄﾞ属性
    m_BMJHojyoName          : String;                       // 部門補助名称(実在)
    m_TNCodeDigit           : Integer;                      // 社員ｺｰﾄﾞ桁数
    m_TNCodeAttr            : Integer;                      // 社員ｺｰﾄﾞ属性
    m_TNJHojyoName          : String;                       // 社員補助名称(実在)
    m_EdtSw                 : Boolean;                      // 編集ｽｲｯﾁ
    m_RecGetSw              : Boolean;
    m_BtUpdFlg              : Boolean;
    m_FormCreateSw          : Boolean;
    m_VK_KeyKilSw           : Boolean;
    m_TRNCode               : Extended;
    m_TantoNCode        	: Extended;                     // <136> 2006/07/24 H.Kawato Add

    m_PostExpOpenSW         : Boolean;                      // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
//    m_ComputerName          :   String;                   // ｺﾝﾋﾟｭｰﾀ名格納用変数

	m_nDBErrorCode		    : Integer;                      // ｴﾗｰ時の取引先ｺｰﾄﾞ(ﾒｯｾｰｼﾞ表示用)
    m_ErrObjNm			    : String;		                // ｴﾗｰのｺﾝﾄﾛｰﾙ名
    m_AfterSave			    : AfterSaveRec;
    m_bEndFlg			    : Boolean;				        // 終了ﾎﾞﾀﾝ押下判断ﾌﾗｸﾞ
    m_bReadFlg              : Boolean;
	uvSelSys                : TJNTSelCorpSys;
    uvExpOpenSW             : Boolean;                      // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
    uvDispFlg               : Integer;                      // 決算ﾌﾗｸﾞ（ 0:未確定、1:確定済）
    uvFncInfo               : urFncInfo;                    // <100>

    uvTempFlg               : Boolean;                      // <100>

    // ﾃﾝﾌﾟﾚｰﾄ情報保存用
    uvTmpUSDENPFM           : Integer;
    uvTmpSSDENPFM           : Integer;                      // <104>
    uvTmpUSGKEI             : Integer;
    uvTmpSSGKEI             : Integer;                      // <104>
    uvTmpBMCODE             : String;
    uvTmpTNCODE             : String;
// <167> ADD-STR
    uvTmpLetterKbn          : Integer;                      // 支払通知書区分
    uvTmpGensenUseKbn       : Integer;                      // 預かり源泉税採用区分
    uvTmpPersonKbn          : Integer;                      // 個人／法人区分
// <167> ADD-END
// <176> ADD-STR
    uvTmpMailUseKbn         : Integer;
    uvTmpPassword           : String;
// <176> ADD-END

    uvDaiKbn                : Boolean;
    uvDaiGaeCode            : String;

    uvSvOyaHojCD            : String;                       // <136> Add

    uvHani                  : TJNTHani;		                // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	    : TPrintAppEntry;               // <PRN>
    ArrHdl                  : Array[0..100] of Pointer;		// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        : rcPrtParam;                   // <PRN>
    DmqPrint                : TMQuery;                      // <PRN> 印刷用ｸｴﾘｰ
    MComboBox               : TMComboBox;
	m_iRekiKbn				: Integer;						// 051114
    m_RepHandle				: THandle;                      // <138> Add

    m_bErrChkFlag           : Boolean;                      // <142> 入力値ﾁｪｯｸﾌﾗｸﾞ
    m_bSKNLicense           : Boolean;                      // <143> 債権ﾗｲｾﾝｽﾌﾗｸﾞ
//    m_bMankiChkFlg          : Boolean;                      // <143> 期日指定振込満期ﾁｪｯｸﾌﾗｸﾞ // <149> Del
    m_bRendouFlag           : Boolean;                      // <143> 連動取引先変更ﾌﾗｸﾞ <157> 預かり源泉採用区分が変更された時にも使用
    m_bRenAdoptFlg          : Boolean;                      // <143> 連動得意先採用済ﾌﾗｸﾞ
    m_iCloseDayFlg          : Integer;                      // <148> 名寄せ締日制限解除ﾌﾗｸﾞ(0:締日制限あり, 1:締日制限解除)
    m_SyncMaster            : TSyncMaster;                  // <Rel> ﾏｽﾀ同期基本ｸﾗｽ
    m_bRecGet               : Boolean;                      // <156> データ表示中フラグ
    m_iGensenKbn            : Integer;                      // <157> 預かり源泉税採用区分(登録済値)
    m_iSateiKbn             : Integer;                      // <157> 査定区分(登録済値)
    m_iVerData              : Integer;                      // <157> 債務ﾃﾞｰﾀﾊﾞｰｼﾞｮﾝ
    m_iPayGensenKbn         : Integer;                      // <154> 会社基本情報預かり源泉税採用区分
    SimeChkFlg              : Integer;                      // <164> 0:チェックあり、1:チェックなし
    m_FeeBmnFlg				: Integer;                      // <175> 部門使用フラグ
    m_BumonNCodeEx        	: Extended;						// <175>エクスプローラまたはDBから取得した部門内部コード（同じ外部コードがあるため）
    m_BumonNMKEx            : String;						// <175>エクスプローラから取得した部門簡略名

    m_JNTAuthority          : TJNTAuthority;                // <AUT> ADD

// <#GAI> ADD-STR
    m_PayProgRendoG         : TJNTPayProgRendoG;
    ProgRendoParamG         : TJNTPAYProgRendoParamG;
// <#GAI> ADD-END

    function fnGetNAME(pCODE: String; pMKBN, pAttr: Integer;
      var RName: String): Boolean;
    function fnGetNCODE(pCODE: String; pMKBN, pAttr: Integer): Extended;
    function fnGetGCODE(pCODE: Extended; pMKBN: Integer): String;
    function fnCheckDaigae(CD: String; var DainCD: Extended): Boolean;
    function fnChkTRCODE: Integer;
    procedure fnSetFncType(pKBN: Integer);
    procedure fnSetFncEnabled();                            // <148> ファンクションバーEnabled切替
    procedure fnSetDaigaiData(pNCD, pDaiNCD: Extended);     // 会社ｼｽﾃﾑ情報
// <151> 2007/05/07 H.Kawato Mod
//	procedure fnPrnSETShosaiJ();
    procedure fnPrnSETShosaiJ(pPtn:Integer);
	procedure fnPrnSETNayose();
// <136> 2006/07/24 H.Kawato Add Start
	procedure MakeNayoseInfo(sOyaCD: String; sPayCD: String;
		nOyaCD: Extended; nPayCD: Extended);
// <138> 2006/08/16 H.Kawato Mod
//    function fnGetMTOKUI_Info(sNCode: Extended): Boolean;
	function fnGetMTOKUI_Info(sNCode: Extended): Integer;
// <138> 2006/08/16 H.Kawato Mod End
// <136> 2006/07/24 H.Kawato Add End
//    function fnRendoMankiChk(lvCode: Extended): Boolean;    // <143> Add  // <149> Del
    function fnRendoDataCheck(): Boolean;                   // <143> Add
    function fnRendoAdoptChk(lvCode: Extended): Boolean;    // <143> Add
    function fnChkCloseDayKbn(): Boolean;                   // <148> Add
    function fnChkPayNayoseInfo(): Boolean;                 // <148> Add
    function fnUpdPayBaseInfo(iKbn: Integer): Boolean;      // <148> Add
	procedure SessionPractice(iSyori: Integer);				// <158> Add ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ
    function fnSimeChk(): Boolean;                          // <164> ADD

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
    procedure   fnInzFormf2                     (); // <157> Add
    procedure   fnBtnEnbChg                     ();
    procedure   fnInsPayBaseInfo                (); // <148> Add

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
    function    fnGetSkyKbnNm                   (sCd: String): String;          // <136> Add
    function    fnGetLetterKbnNm                (sCd: String): String;          // <145> Add
    function    fnGetGensenKbnNm                (sCd: String): String;          // <157> Add
    function    fnGetPersonKbnNm                (sCd: String): String;          // <157> Add
    function    fnGetMailKbnNm                  (sCd: String): String;          // <176> Add
	function	fnOutputConfirmationMessage		(nDivision: Integer): Integer;
    procedure	fnOutputDBErrorMessage			();

    // 名寄せ
    procedure 	fnGetNayoseInfo					();
// <136> 2006/07/24 H.Kawato Mod Start
//    function 	fnPayCodeCheck					(sHojCode: String; var sRet: String; var sPayNCD:Extended; Mode: Integer): Boolean;
    function 	fnPayCodeCheck					(sHojCode: String; var sRet: String; var nPayNCD:Extended; iMode: Integer;
                                                 var iUsKinKbn: Integer; var nCngNCode: Extended;
                                                 var sNDGCode: String; var sNDNAME: String): Boolean;
// <136> 2006/07/24 H.Kawato Mod End
	function 	fnCheckPayNayoseInfo			(CD: String; KBN: Integer): Boolean;
    function    fnCheckUsKinKbn                 (sOyaCD: String): Boolean;      // <159> Add
    function    fnCheckPayNayoseSyu             (sPayCD: String): Boolean;      // <159> Add
// <136> 2006/07/24 H.Kawato Mod Start
//	function	fnUpDatePayNayoseInfo			(PayNCD,OyaNCD: Extended; KBN,MODE: Integer): Boolean;
//    function    fnUpDateMTokui_SelInfo          (PayNCD,SeiNCD: Extended; OyakoFlg,UsKin: Integer): Boolean;
	function	fnUpDatePayNayoseInfo			(PayNCD,OyaNCD: Extended; KBN,MODE: Integer;
                                                 TranMode: Boolean): Boolean;
    function    fnUpDateMTokui_SelInfo          (PayNCD,SeiNCD: Extended; OyakoFlg,UsKin: Integer;
                                                 aGoukei: Boolean; TranMode: Boolean): Boolean;
// <136> 2006/07/24 H.Kawato Mod End
	function 	fnDeletePayNayoseInfo			(PayNCD,OyaNCD: Extended; MODE: Integer): Boolean;
// <136> 2006/07/24 H.Kawato Mod
//	function 	fnRecordCheck					(): Boolean;
	function 	fnRecordCheck					(const bGoukei: Boolean = False): Boolean;

    procedure   fnMemDeleteNayose               (Kbn: Byte; sCD: String);

// <151> 2007/05/07 H.Kawato Mod Start
//    procedure   fnPrnSETKanryakuJ               ();       // <131>
//    procedure   fnPrintCheckListTtlStandard     ();       // <131>
    procedure   fnPrnSETKanryakuJ               (pPtn:Integer);
    procedure   fnPrintCheckListTtlStandard     (pPtn:Integer);
// <151> 2007/05/07 H.Kawato Mod End

    function    fnGetPayBaseInfoNum             (iItemID: Integer): Integer;    // <157> Add

    function    fnCheckIsSpot                   (sPayCD: String): Boolean;      // <163> ADD
end;

function AppEntry(pPar : Pointer)	:	Integer;

exports
	AppEntry;

implementation

  {$i JNTPayProgRendoB.inc}                                 // <133> 2006/04/18 H.Kawato Add 進捗連動対応
  {$i JNTPayProgRendoGB.inc}                                // <#GAI> ADD 外貨進捗連動対応

const
    ucBtnOK             =   'MBitBtnUpd';
    ucBtnNG             =   'MBitBtnCancel';
    ucZeroCODE          =   '0000000000000000';             // <122>

    CONFIRM_EDITCODE		= 0;						    // ｺｰﾄﾞ欄編集
	CONFIRM_CANCEL			= 1;						    // 取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			= 2;						    // 終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			= 0;
	CONFIRM_RETFOCUSED		= 1;						    // 元の位置にﾌｫｰｶｽを戻す
	CONFIRM_EXITWRITE		= 2;						    // ﾃﾞｰﾀを保存して処理を終了

	DISPOSE_REAL			= 0;						    // 実在
	DISPOSE_TOTAL			= 1;						    // 合計
	DISPOSE_NAYOSEOYA		= 2;						    // 名寄せ親
	DISPOSE_ALL				= 99;						    // 実在、合計

    NAYOSE_CHILD			= 1;						    // 名寄せ子
	NAYOSE_PARENT			= 2;						    // 名寄せ親
	NAYOSE_ALL				= 99;						    // 名寄せ親以下

    MODE_INSERT				= 1;						    // 新規
	MODE_EDIT				= 2;						    // 編集
	MODE_DELETE				= 3;                            // 削除

	// -----<158> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<158> Add-Ed-----

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


    _KaiJyItems     : array [0..3] of CodeList
        = ((iCode : 1; sName : '現金'),
           (iCode : 2; sName : '振込'),
           (iCode : 3; sName : '手形'),
           (iCode : 4; sName : '相殺'));

    _TsryFtnItems   : array[0..1] of CodeList
        = ((iCode : 0; sName : '他社負担'),
           (iCode : 1; sName : '自社負担'));

    _EDIKuItems     : array[0..1] of CodeList
        = ((iCode : 0; sName : '採用なし'),
           (iCode : 1; sName : '採用あり'));

// <136> 2006/07/24 H.Kawato Add
    _SeikyuKbnItems : array[0..1] of CodeList
        = ((iCode : 1; sName : '親一括請求一括支払'),
           (iCode : 2; sName : '各店別請求各店別支払'));
// <136> 2006/07/24 H.Kawato Add

// <145> 2006/11/16 H.Kawato Add
    _LetterKbnItems : array[0..3] of CodeList
        = ((iCode : 0; sName : '標準'),
           (iCode : 1; sName : '送付用'),
           (iCode : 2; sName : '集金用'),
           (iCode : 3; sName : 'その他'));
// <145> 2006/11/16 H.Kawato Add

    _strhalfkana	:	String = 'ｧｨｩｪｫｬｭｮｯ';
	_strkana		:	String = 'ｱｲｳｴｵﾔﾕﾖﾂ';

// <151> 2007/05/07 H.Kawato Add Start
	_ExpectItems : array [0..9] of String	= ('当月', '翌月', '翌々月',
											   '3ヶ月後', '4ヶ月後', '5ヶ月後',
											   '6ヶ月後', '7ヶ月後', '8ヶ月後', '9ヶ月後');

	_HolidayItems: array [0..2] of String	= ('翌営業日', '前営業日', '当日');
// <151> 2007/05/07 H.Kawato Add End

// <157> 2007/08/22 H.Kawato Add Start
    _GensenKbnItems : array[0..1] of CodeList
        = ((iCode : 0; sName : '採用なし'),
           (iCode : 1; sName : '採用あり'));

    _PersonKbnItems : array[0..2] of CodeList
        = ((iCode : 0; sName : '個人'),
           (iCode : 1; sName : '法人'),
           (iCode : 2; sName : 'その他'));
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
    _MailKbnItems : array[0..1] of CodeList
        = ((iCode : 0; sName : '採用なし'),
           (iCode : 1; sName : '採用あり'));
// <176> ADD-END

{$I JNTConst.inc}                                           // <124>

{$R *.DFM}

{$include JNTCRPSyncMasterB.inc}                            // <Rel> ﾏｽﾀ同期共通実装部
{$include JNTMTOKUI_Sync.INC}                               // <Rel>


//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function AppEntry(pPar: Pointer):	Integer;
var
	pForm	:	^TJNTCRP004005F;
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
					pForm^	:= TJNTCRP004005F.CreateForm (pPar);
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
					pForm^	:= TJNTCRP004005F.CreateForm (pRec);
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

				if	(pForm^.CloseQuery () = False) then
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
constructor TJNTCRP004005F.CreateForm(pRec: pointer);
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
    m_CloseFlg      :=  False;
    m_bFirstFlag	:=  False;
    m_nDBErrorCode	:=  0;
    m_TRNCode       :=  0;

    m_pRec	        :=  Pointer( TAppParam( pRec^ ).pRecord );      // 構造体のSave
	m_cDataModule   :=  TMDataModulef( m_pRec^.m_pDBModule^   );    // MJS共通DBﾓｼﾞｭｰﾙ
    m_cComArea		:=  TJNTMASCom( m_pRec^.m_pSystemArea^ );       // ｼｽﾃﾑﾒﾓﾘ 取得

    m_TantoNCode    :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;          // <136> 2006/07/24 H.Kawato Add

    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList   := TList(TAppParam( pRec^ ).pActionParam^);

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
		DmqCtrlDb.ParamByName('NCode').AsFloat	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <126>
		DmqCtrlDb.Open;

		if (DmqCtrlDb.Eof <> True) then
		begin
//			iTanCD		:=	DmqCtrlDb.GetFLD('TantoGCD').AsInteger;
			sTanName	:=	DmqCtrlDb.GetFLD('Name'	   ).AsString;
		end;
//		bFlag	:=	True;

		DmqCtrlDb.Close;
		DmqCtrlDb.Free;
        m_cDataModule.CTLDBClose(CTRL_DB);                  // 共通ＤＢクローズ <181> ADD
	end;

// <126>↓復帰
//(*
    bFlag := True;                          // <126>追加
	DmqData.Close;
	DmqData.SQL.Clear;
	DmqData.SQL.Add(fnMakeSQL(bFlag, TRUE));

	if bFlag = True then
	begin                                   // <126>ﾊﾟﾗﾒｰﾀは内部ｺｰﾄﾞのみ
//		DmqData.ParamByName('TANCD'  ).AsInteger := iTanCD;
//		DmqData.ParamByName('TANNAME').AsString  := sTanName;
		DmqData.ParamByName('TANCD'  ).AsFloat := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
	end;

	if (DmqData.ExecSQL  = False) then
	begin
		sMessage	:=	IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
	end;
//*) // <♪ 後で確認して下さい。>
// <126>

	DmqData.Close;
	DmqData.Free;


{
// <PRN> -----------Add↓-----------------

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;
// <PRN> -----------Add↑-----------------
}

    m_PayProgRendo  := TJNTPayProgRendo.Create;    // <133> 2006/04/18 H.Kawato Add 進捗連動
    m_PayProgRendoChild := TJNTPayProgRendo.Create;// 名寄せ親代替仕入先チェック用 <178> ADD

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
procedure TJNTCRP004005F.CMChildKey(var Msg: TWMKey);
var
	sShift	            :   TShiftState;
    lvNextKeyPressed,
    lvNextBtnPressed,
    lvPrevBtnPressed,
    lvBitBtnFocused,
    lvBitBtnMTabFocused :   Boolean;
	SName	            :	String;

begin

	if ( GetKeyState(VK_MENU) < 0 ) then Exit;

	SName		:=  Screen.ActiveControl.Name;
	sShift		:=  MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD
	m_ACControl :=  Screen.ActiveControl;

    // 次へ進めｷｰかを判定する
    lvNextKeyPressed := ( ( Msg.CharCode = VK_RETURN )                      or
                         (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_DOWN   ) and ( sShift = [] )) or
                         (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] ))
                        );

    // ボタン制御用変数↓
    //次へ進めｷｰかを判定する
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
    lvBitBtnFocused := (( SName = ucBtnOK )  or
                        ( SName = ucBtnNG ));

    lvBitBtnMTabFocused := (( SName = ucBtnOK )  or
                            ( SName = ucBtnNG )  or
                            ( SName = 'DtlCsTab'));

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
            if ( SName = ucBtnOK ) then
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

            if ( SName = ucBtnNG ) then
            begin
                MjsSetFocus(Self,ucBtnOK);
                Abort;
            end
            else if ( SName = ucBtnOK ) then
            begin
// <157> 2007/08/22 H.Kawato Mod Start
(*
// <136> 2006/07/24 H.Kawato Mod Start
{
                if ( PnlSelInfo.Visible ) then
                    MjsSetFocus(Self,'f1USGKEI')
                else
                    MjsSetFocus(Self,'f1SSGKEI');
}
                if HedCsTab.items.selected = 0 then
                begin
                    if ( PnlSelInfo.Visible ) then
                        MjsSetFocus(Self,'f1USGKEI')
                    else
// <143> 2006/09/26 H.Kawato Mod Start
//                        MjsSetFocus(Self,'f1SSGKEI');
                    begin
                        if ( f1RendouCode.Enabled ) then
                            MjsSetFocus(Self,'f1RendouCode')
                        else
// <145> 2006/11/16 H.Kawato Mod
//                            MjsSetFocus(Self,'f1SSGKEI');
                            MjsSetFocus(Self,'f1LetterKbn');
                    end;
// <143> 2006/09/26 H.Kawato Mod End
                end
                else if HedCsTab.items.selected = 1 then
                begin
// <145> 2006/11/16 H.Kawato Mod Start
{
// <143> 2006/09/26 H.Kawato Mod
//                    if ( f1NayoseOyaCode.Enabled ) then
//                        MjsSetFocus(Self,'f1NayoseOyaCode')
                    if ( f1RendouCode.Enabled ) then
                        MjsSetFocus(Self,'f1RendouCode')
                    else if ( f1NayoseOyaCode.Enabled ) then
                        MjsSetFocus(Self,'f1NayoseOyaCode')
// <143> 2006/09/26 H.Kawato Mod
                    else if ( f1SKYKBN.Enabled ) then
                        MjsSetFocus(Self,'f1SKYKBN')
                    else if ( cbPayRootKbn.Enabled ) then
                        MjsSetFocus(Self,'cbPayRootKbn')
                    else
                    begin
                        if ( PnlSelInfo.Visible ) then
                            MjsSetFocus(Self,'f1USGKEI')
                        else
                            MjsSetFocus(Self,'f1SSGKEI');
                    end;
}
                    if ( f1RendouCode.Enabled ) then
                        MjsSetFocus(Self,'f1RendouCode')
                    else
                        MjsSetFocus(Self,'f1LetterKbn');
// <145> 2006/11/16 H.Kawato Mod End
                end;
// <136> 2006/07/24 H.Kawato Mod End
*)
                if HedCsTab.items.selected = 0 then
                begin
                    // 基本情報
                    if DtlCsTab.items.selected = 0 then
                    begin
                        if ( f1RendouCode.Enabled ) then
                            MjsSetFocus(Self,'f1RendouCode')
                        else
                            MjsSetFocus(Self,'f1LetterKbn');
                    end
                    // 支払情報
                    else
                    begin
// <176> ADD-STR
                        if ( f2Password.Enabled ) then
                            MjsSetFocus(Self,'f2Password')
                        else
                        if ( f2MailKbn.Enabled ) then
                            MjsSetFocus(Self,'f2MailKbn')
                        else
// <176> ADD-END
                        if ( f2PersonKbn.Enabled ) then
                            MjsSetFocus(Self,'f2PersonKbn')
                        else
                        if ( f2GensenKbn.Enabled ) then
                            MjsSetFocus(Self,'f2GensenKbn')
                        else
                            MjsSetFocus(Self,'DtlCsTab');
                    end;
                end
                else if HedCsTab.items.selected = 1 then
                begin
                    // 基本情報
                    if DtlCsTab.items.selected = 0 then
                    begin
                        if ( f1RendouCode.Enabled ) then
                            MjsSetFocus(Self,'f1RendouCode')
                        else
                            MjsSetFocus(Self,'f1LetterKbn');
                    end
                    // 支払情報
                    else
                    begin
// <176> ADD-STR
                        if ( f2Password.Enabled ) then
                            MjsSetFocus(Self,'f2Password')
                        else
                        if ( f2MailKbn.Enabled ) then
                            MjsSetFocus(Self,'f2MailKbn')
                        else
// <176> ADD-END
                        if ( f2PersonKbn.Enabled ) then
                            MjsSetFocus(Self,'f2PersonKbn')
                        else
                        if ( f2GensenKbn.Enabled ) then
                            MjsSetFocus(Self,'f2GensenKbn')
                        else
                            MjsSetFocus(Self,'DtlCsTab');
                    end;

                end;

// <157> 2007/08/22 H.Kawato Mod End
                Abort;
// <136> 2006/07/24 H.Kawato Add Start
            end
            else if ( SName = ucBtnNG ) then
            begin
                MjsSetFocus(Self,ucBtnOK);
                Abort;
// <136> 2006/07/24 H.Kawato Add End
            end;
        end;

        // Retｷｰ(BtnClick用)とｱｸｾﾗﾚｰﾀ用ｷｰ以外
        if (( Msg.CharCode <> VK_RETURN ) and not ( sShift = [ssAlt] )) then Abort;

    end;

    // 先頭ﾌｨｰﾙﾄﾞ時
// <157> 2007/08/22 H.Kawato Mod
//// <136> 2006/07/24 H.Kawato Mod
////    if ( sName = 'cbPayRootKbn' ) then
//    if ( sName = 'f1POSTNO1' ) then
    if  ( sName = 'f1POSTNO1'   ) or
        ((sName = 'f2MailKbn'   ) and ((m_iPayGensenKbn = 0) or (HedCsTab.Items.Selected = 1))) or   // <176> ADD
        ( sName = 'f2GensenKbn' ) then
// <157> 2007/08/22 H.Kawato Mod
    begin
        if ( lvPrevBtnPressed ) then
        begin
            MjsSetFocus(Self,'DtlCsTab');
            Abort;
        end;
    end;

    // ﾀﾌﾞ時
    if ( sName = 'DtlCsTab' ) then
    begin
// <157> 2007/08/22 H.Kawato Mod Start  キー操作でタブ移動を可能とする
(*
        if (( Msg.CharCode = VK_LEFT   ) and ( sShift = [] )) then
             Abort
// <136> 2006/07/24 H.Kawato Del Start
{
        else if (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then
        begin
            DtlCsTab.Items[0].Selected  :=  False;
            DtlCsTab.Items[1].Selected  :=  True;
        end
}
// <136> 2006/07/24 H.Kawato Del End
*)
        if  (( Msg.CharCode = VK_LEFT   ) and ( sShift = [] )) or
            (( Msg.CharCode = VK_RIGHT  ) and ( sShift = [] )) then
            Exit
// <157> 2007/08/22 H.Kawato Mod End
        else if  ( Msg.CharCode = VK_RETURN ) or
//                (( Msg.CharCode = VK_LEFT   ) and ( sShift = [] )) or           // <136> Add <157> Del
                (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) or
                (( Msg.CharCode = VK_DOWN   ) and ( sShift = [] )) then
        begin
// <168> DEL    if f1POSTNO1.Enabled = False then Exit;
            if uvDispFlg =  0 then
            begin
// <157> 2007/08/22 H.Kawato Mod Start
{
// <136> 2006/07/24 H.Kawato Mod
//                if HedCsTab.items.selected = 0 then
//                    MjsSetFocus(Self,'f1POSTNO1')
//                else if HedCsTab.items.selected = 1 then
//                    MjsSetFocus(Self,'cbPayRootKbn');
                if (HedCsTab.items.selected = 0) or
                   (HedCsTab.items.selected = 1) then
                    MjsSetFocus(Self,'f1POSTNO1');
// <136> 2006/07/24 H.Kawato Mod
}
                if (HedCsTab.items.selected = 0) or
                   (HedCsTab.items.selected = 1) then
                begin
                    // 基本情報
                    if ( DtlCsTab.Items.Selected = 0 ) then
// <168> MOD-STR
//                      MjsSetFocus(Self,'f1POSTNO1')
                    begin
                        if f1POSTNO1.CanFocus then
                            MjsSetFocus(Self,'f1POSTNO1')
                        else if f1SSDENPFM.CanFocus then
                            MjsSetFocus(Self,'f1SSDENPFM')
                        else
                            MjsSetFocus(Self,'f1LetterKbn');
                    end
// <168> MOD-END
                    else
                    // 支払管理
                    if ( DtlCsTab.Items.Selected = 1 ) then
                    begin
                        if ( f2GensenKbn.Enabled ) then
                            MjsSetFocus(Self,'f2GensenKbn')
// <176> ADD-STR
                        else
                        if ( f2MailKbn.Enabled ) then
                            MjsSetFocus(Self,'f2MailKbn')
// <176> ADD-END
                        else
                            MjsSetFocus(Self,'MBitBtnUpd');
                    end;
                end;
// <157> 2007/08/22 H.Kawato Mod End
            end;
            Abort;
        end
        else    Abort;
    end;

// <143> 2006/09/26 H.Kawato Add Start
    if ( Screen.ActiveControl.Name = f1RendouCode.Name ) then
    begin
        if	( Msg.CharCode = VK_RETURN ) or
            ( Msg.CharCode = VK_LEFT   ) or
            ( Msg.CharCode = VK_UP     ) or
            ( Msg.CharCode = VK_RIGHT  ) or
            ( Msg.CharCode = VK_DOWN   ) or
            ( Msg.CharCode = VK_END    ) or
            ( Msg.CharCode = VK_TAB    ) or
           (( Msg.CharCode = VK_TAB    ) and ( sShift = [] )) then
        begin
            if (not fnRendoDataCheck) then
            begin
                f1RendouCode.SetFocus;
                Beep;
                abort;
            end;
        end;
    end;
// <143> 2006/09/26 H.Kawato Add End

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
            if ( fnFldChk(Screen.ActiveControl, False) ) then
            begin
                // 対象ﾃﾞｰﾀを取得する
                if ( sName = 'f0CODE' ) then
                begin
					f0CODE.Text :=  TrimRight(f0CODE.Text);
                 	if ( fnRecGet(f0CODE.Text) = False ) then Abort;

                    if uvDispFlg = 1 then
                    begin
                        MjsSetFocus(Self, 'f0CODE');
                    end
                    else
                    begin
// <136> 2006/07/24 H.Kawato Mod Start
{
                        if HedCsTab.Items.Selected = 0 then
                        begin
                            if uvDispFlg = 0 then
                                MjsSetFocus(Self,'f1POSTNO1')
                            else
                                MjsSetFocus(Self,'f0CODE');
                        end
                        else
                        begin
                            if uvDispFlg = 0 then
                                MjsSetFocus(Self,'cbPayRootKbn')
                            else
                                MjsSetFocus(Self,'f0CODE');

                        end;
}
// <157> 2007/08/22 H.Kawato Mod Start
{
                    if uvDispFlg = 0 then
                        MjsSetFocus(Self,'f1POSTNO1')
                    else
                        MjsSetFocus(Self,'f0CODE');
}
                    if uvDispFlg = 0 then
                    begin
                        // 基本情報パネルを表示する
                        if ( DtlCsTab.Items.Selected <> 0 ) then
                            DtlCsTab.Items.Selected := 0;

                        MjsSetFocus(Self,'f1POSTNO1');
                    end
                    else
                        MjsSetFocus(Self,'f0CODE');
// <157> 2007/08/22 H.Kawato Mod End
// <136> 2006/07/24 H.Kawato Mod End
                    end;
         	        if Msg.CharCode = VK_TAB then Abort;

                    Exit;
                end;
            end
            else Abort;
        end;

        // 次の強制ﾌｫｰｶｽ位置
        if ( fnBtnNextFocus() <> True ) then Exit;

//        SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, True);
        SelectNext(Screen.ActiveControl, True, True);
        Abort;
    end;

    // Return,Downｷｰの補足
    if lvPrevBtnPressed then
    begin
        // <169> 2010/07/08 G.Kojima Add
        // 名寄せタブ、通知書名寄せタブ時、戻るボタン(↑、←、Shift + Tab)押下で戻り処理を行う
        if (GridNayose.FocusedAbsoluteIndex = 2) and (GridNayose.FocusedNode.GetPrev = nil) then
        begin
            MJSPrevCtrl(self);
            Abort;
        end;

        if ( sName = 'f0CODE' ) then Exit;      // <136> 2006/07/24 H.Kawato Add
        if ( sName = 'GridNayose' ) then Exit;

        SelectNext(Screen.ActiveControl, False, True);
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
            if ( lvBitBtnMTabFocused = False ) then fnESCConfirm;
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
            if ( lvBitBtnMTabFocused = False ) then fnEndKeyBtnFcous;
         	Abort;
        end;
    end;

    // Upキーの捕捉
    if ( Msg.CharCode = VK_UP ) and ( sShift = [] ) then
    begin
        if ( sName = 'f0CODE' ) then
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

// <136> 2006/07/24 H.Kawato Add Start
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
// <136> 2006/07/24 H.Kawato Add End

end;

//-----------------------------------------------------------------------------
// fnMakeSQL()
//      PARAM   : TAN_CD	:	担当者ｺｰﾄﾞ
//				  TAN_NAME	:	担当者名
//				  FLAG		:	担当者選択なし(-1以外:True/-1:False)
//      RETURN  : 作成したSQL文
//      MEMO    : ｽﾄｱﾄﾞのSQL文作成
//-----------------------------------------------------------------------------
function	TJNTCRP004005F.fnMakeSQL (FLAG,StratEndFlag: Boolean) : String;
var
	sSQL	:	String;
begin
	sSQL := '';
	if (StratEndFlag = True) then
		sSQL	:=	'CALL MP200010(0'	//	ｽﾄｱﾄﾞの開始
	else
		sSQL	:=	'CALL MP200010(1';	//	ｽﾄｱﾄﾞの終了
	if (FLAG) then		//	担当者選択なし
	begin
// <126>↓
//		sSQL	:=	sSQL + ',:TANCD,:TANNAME'
		sSQL	:=	sSQL + ',:TANCD';
// <126>↑
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
procedure TJNTCRP004005F.FormCreate(Sender: TObject);
var
//  ComputerName    :   String;
    Qry  : TMQuery;

    iRet        :   Integer;        // <PRN>
//  lvHandle    :   THandle;        // <PRN>  // <138> Del
begin
    m_bBtnChange 	:= TRUE;        // <118>
    m_bErrChkFlag   := False;       // <142> Add
    m_iCloseDayFlg  := 0;           // <148> Add

	// 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得
    B_Print 	 := TMSpeedButton( m_CmpList.Items[0]^ );   // 印刷
    B_Syousai 	 := TMSpeedButton( m_CmpList.Items[1]^ );   // 詳細
    B_Delete 	 := TMSpeedButton( m_CmpList.Items[2]^ );   // 削除
    B_Copy       := TMSpeedButton( m_CmpList.Items[3]^ );   // 科目ｺﾋﾟｰ
    B_Search     := TMSpeedButton( m_CmpList.Items[4]^ );   // 検索
    ToolButton 	 := TToolButton  ( m_CmpList.Items[5]^ );   // 付箋
    m_cJNTArea   := TJNTCommon   ( m_CmpList.Items[8]^ );   // <102>
    m_Base_pRec  := Pointer      ( m_CmpList.Items[9]^ );   // <103>
    MComboBox    := TMComboBox   ( m_CmpList.Items[10]^ );
    B_Change     := TMSpeedButton( m_CmpList.Items[11]^ );	// <118>
	m_SyncMaster := TSyncMaster  ( m_CmpList.Items[13]^ );  // <Rel>
    m_JNTAuthority := TJNTAuthority(m_CmpList.Items[16]^);  // <AUT> ADD

	// -----<158> Add-St-----
	SPMsHist.Connection	:= m_cDBSelect;
	//SPMsHist.SessionName	:= m_cDBSelect.SessionName;

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<158> Add-Ed-----

    B_Print.OnClick      := fnPrintClick;
    B_Delete.OnClick     := BDeleteClick;
    B_Delete.OnMouseDown := nil;
    B_Change.OnClick     := BChangeClick;                   // <118>

    B_Delete.Enabled     := False;

	Parent	    :=  TPanel (m_pRec^.m_pOwnerPanel^);     	// 親ﾌｫｰﾑの子ﾌｫｰﾑはめ込みﾊﾟﾈﾙをParentとする
	Align	    :=  alClient;                            	// Alignはｸﾗｲｱﾝﾄ領域とする
    m_AcControl :=  f0CODE;

    // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
	MJSColorChange (TJNTCRP004005F(Self),
                    m_cComArea.SystemArea.SysColorB,
                    m_cComArea.SystemArea.SysColorD,
                    m_cComArea.SystemArea.SysBaseColorB,
                    m_cComArea.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor
                   );

	m_ZoomRatio := MJSFontResize (TJNTCRP004005F (Self), Pointer (m_pRec));

	if ( m_ZoomRatio <= 0 ) then
		m_ZoomRatio := 100;

//<102>
//    m_cJNTArea      :=  TJNTCommon.Create(Self);
//    m_cJNTArea.Init(m_pRec);
	m_cJNTArea.setMasAppRecord; // 販売ポインタ設定

// <157> 2007/08/22 H.Kawato Add Start
    // 債務ﾃﾞｰﾀﾊﾞｰｼﾞｮﾝの取得
    m_iVerData    := fnGetPayBaseInfoNum(4002);

    // 預かり源泉税採用区分の取得
    m_iPayGensenKbn  := fnGetPayBaseInfoNum(2621);

    // 預かり源泉税採用あり
    if (m_iPayGensenKbn = 1) then
    begin
        lblGensenKbn.Enabled    := True;
        f2GensenKbn.Enabled     := True;
        f2GensenKbnNM.Enabled   := True;
// <#MYN> DEL-STR
//      lblPersonKbn.Enabled    := True;
//      f2PersonKbn.Enabled     := True;
//      f2PersonKbnNM.Enabled   := True;
// <#MYN> DEL-END
    end
    else
    begin
        lblGensenKbn.Enabled    := False;
        f2GensenKbn.Enabled     := False;
        f2GensenKbnNM.Enabled   := False;
// <#MYN> DEL-STR
//      lblPersonKbn.Enabled    := False;
//      f2PersonKbn.Enabled     := False;
//      f2PersonKbnNM.Enabled   := False;
// <#MYN> DEL-END
    end;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
    // 通知書メール配信ライセンスあり
	if CheckModuleLicense(m_pRec, 260020) then  //MAS_STM
    begin
        lblMailKbn.Enabled      := True;
        f2MailKbn.Enabled       := True;
        f2MailKbnNM.Enabled     := True;
        lblPassword.Enabled     := True;
        f2Password.Enabled      := True;
    end
    else
    begin
        lblMailKbn.Enabled      := False;
        f2MailKbn.Enabled       := False;
        f2MailKbnNM.Enabled     := False;
        lblPassword.Enabled     := False;
        f2Password.Enabled      := False;
    end;
// <176> ADD-END

    fnGetMasterInfo();          // MasterInfoから桁数/属性を取得
    fnKbnStrSet();              // 文字列ｵﾌﾞｼﾞｪｸﾄを作成する
    fnSetKAISHAItems();         // ﾗﾍﾞﾙ項目を設定する
    fnInsPayBaseInfo();         // 名寄せ締日制限解除区分の作成 <148> Add

    // 初期値をｾｯﾄする
	m_FormCreateSw  := True;    // FormCreta動作ｽｲｯﾁ(True:起動 False:未起動)
	m_VK_KeyKilSw   := True;    // VK_xxxｷｰ有効無効ｽｲｯﾁ(True:有効 False:無効)

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

	m_cJNTArea.setSelAppRecord;     // <179> ADD

	// 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
//  FX
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

// <179> MOD-STR
//    	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then
    	if uvSelSys.CreateSysMsg(m_Base_pRec) <> 0 then
// <179> MOD-END
            Abort;
    except
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

  	m_cJNTArea.setMasAppRecord;     // <179> ADD

	// 051114 >>
    // 会社別ｼｽﾃﾑ情報読み込み<PRN>
    try
    	if (uvSelSys.CreateSysInfo(m_cDBSelect) <> 0) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;
	// 051114 <<

    // 編集状態ｽｲｯﾁを初期化する
    m_EdtSw := False;
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
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
    with Qry do
    begin
        Close ();
        SQL.Clear;
        SQL.Add ('SELECT ComKbn2, YearKbn FROM DTMAIN');
        Open ();
        if not Eof then
        begin
            uvDispFlg := FieldByName ('ComKbn2').AsInteger;	// 決算確定
			m_iRekiKbn:= GetFld('YearKbn').AsInteger;
        end;
        Close;

        // ﾃﾝﾌﾟﾚｰﾄﾃﾞｰﾀを求める
        SQL.Clear;
        Sql.Add('select se.* from MTOKUI_SEL se ' +
                'left outer Join MTOKUI m on se.BaseNCode = m.NCode ' +
                'where (m.TemplateKbn = 1) '+
                'and (se.RecKbn = 2)');
        Open ();
        if not Eof then
        begin
            uvTmpUSDENPFM := GetFld('USDenPfm').AsInteger;              // 納品書ﾌｫｰﾑ
            uvTmpSSDENPFM := GetFld('SSsyoPfm').AsInteger;              // 請求書ﾌｫｰﾑ <104>
            uvTmpUSGKEI   := GetFld('USGKei').AsInteger;                // 売上合計欄印字
            uvTmpSSGKEI   := GetFld('SSsyoKgm').AsInteger;              // 請求書鏡欄税印字<104>
            uvTmpBMCODE   := fnGetGCODE(GetFld('BmNCode').AsFloat,41);  // 部門コード
            uvTmpTNCODE   := fnGetGCODE(GetFld('TnNCode').AsFloat,25);  // 担当者コード
        end;
        Close ();

// <167> ADD-STR
        SQL.Clear;
        Sql.Add('SELECT MP.LetterKbn, MP.GensenUseKbn, MP.PersonKbn ' +
                '  FROM MTOKUI_PAY MP ' +
                '  LEFT JOIN MTOKUI M ' +
                '    ON MP.BaseNCode = M.NCode ' +
                ' WHERE M.TemplateKbn = 1');
        Open ();
        if not Eof then
        begin
            uvTmpLetterKbn    := GetFld('LetterKbn').AsInteger;         // 支払通知書区分
            uvTmpGensenUseKbn := GetFld('GensenUseKbn').AsInteger;      // 預かり源泉税採用区分
            uvTmpPersonKbn    := GetFld('PersonKbn').AsInteger;         // 個人／法人区分
        end;
        Close ();
// <167> ADD-END
     end;
    Qry.Free;

    //権限情報を取得<102>
//    m_cJNTArea.FxPermission;<102>
// <AUT> MOD-STR
//  if (m_cJNTArea.IsModify = False) then
//  begin
//      if (m_cJNTArea.IsAppend = False ) then
//      begin
    if ((m_JNTAuthority.IsModify = False) and (m_JNTAuthority.IsAppend = False)) then
    begin
// <AUT> MOD-END
            uvDispFlg := 1;//決算確定と同様の処理
                                            // <128>
        	GridNayose.Options	:=	GridNayose.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
// <AUT> DEL    end;
    end;

    //ﾗｲｾﾝｽの制御<101>
//    if CheckModuleLicense(m_pRec,FXLicense.SEL_HAN)  then // 販売ﾗｲｾﾝｽﾁｪｯｸ    // <135> Del
        PnlSelInfo.Visible  := False;

    m_bSKNLicense := CheckModuleLicense(m_pRec, MAS_SKN);   // 債権ﾗｲｾﾝｽﾁｪｯｸ    // <143> Add

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

// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
//    lvHandle := 0;
	try
// <138> 2006/08/16 H.Kawato Mod
//		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004005L.BPL');
// <LPH> MOD-STR
//		m_RepHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004005L.BPL');
		m_RepHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP004005L.BPL');
// <LPH> MOD-END
// <138> 2006/08/16 H.Kawato Mod

// <138> 2006/08/16 H.Kawato Mod
//        if ( lvHandle = 0 ) then
        if ( m_RepHandle = 0 ) then
// <138> 2006/08/16 H.Kawato Mod     
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP004005LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
// <138> 2006/08/16 H.Kawato Mod    
//    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');
    PrintAppEntry := GetProcAddress(m_RepHandle,'PrintAppEntry');
// <138> 2006/08/16 H.Kawato Mod     

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
// <138> 2006/08/16 H.Kawato Mod    
//    	UnloadPackage( lvHandle );
// <LPH> MOD-STR
//    	UnloadPackage( m_RepHandle );
    	UnloadPackageHelper( m_RepHandle );
// <LPH> MOD-END
// <138> 2006/08/16 H.Kawato Mod
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
        ArrHdl[0] := @m_JNTAuthority;   // <AUT> ADD
		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
                'JNTCRP004005',
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------

// <175> Mod start
{// <168> ADD-STR
    if fnSimeChk() then
	   SimeChkFlg := 1
    else SimeChkFlg := 0;    //1の場合、名寄せ登録の締め日チェックしない。
// <168> ADD-END}
    if fnSimeChk() then
    begin
		SimeChkFlg	:= 1;
    end
    else
    begin
    	SimeChkFlg	:= 0;    //1の場合、名寄せ登録の締め日チェックしない。
    end;
    
    if(m_FeeBmnFlg = 1) then
    begin
    	DtlCs1LabelBmnNameTitle.Caption := m_BMJHojyoName;
    end;
// <175> Mod end

    m_PayProgRendoG := TJNTPayProgRendoG.Create;    // <#GAI> ADD 外貨進捗連動

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
procedure TJNTCRP004005F.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam : TAppParam;
begin

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

    // 郵便番号辞書 終了
    if ( m_PostExpOpenSW = TRUE ) then
    	fnCMNPostFree ();

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	m_cDataModule.COPDBClose (m_cDBSelect);

    // 販売ｼｽﾃﾑ情報の開放
	uvSelSys.Free;

    Action := caFree;

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
procedure TJNTCRP004005F.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
begin

    m_bEndFlg   :=  True;

    // 終了ﾌﾗｸﾞをONに設定する
    if ( m_CloseFlg = False ) then m_CloseFlg := True;

    if ( m_BtUpdFlg = False ) then
	begin
		m_EdtSw := False;;
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
    if ( m_EdtSw ) then
    begin
        //終了確認
        if ( fnCloseConfirm = False ) then
        begin
//            m_CloseFlg  := False;       // <143> Add
            CanClose := False;
            Exit;
        end;
    end;

    //ＩＭＥを閉じる
    Self.ImeMode := imClose;
    Self.SetIme;

    //  共通システム開放
//    m_cJNTArea.Free;

//    B_Print     .Enabled    :=  True; // <107>

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< ﾌｫｰﾑ表示 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.FormShow(Sender: TObject);
begin

    //<100>
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

    JNTMasSetCaption (m_pRec);
	MJSBtnVisible (TJNTCRP004005F (Self), TRUE);

    m_AcControl.SetFocus(); // <118>

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑﾊｲﾄﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.FormHide(Sender: TObject);
begin

    MJSBtnVisible (TJNTCRP004005f (Self), FALSE);

end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.FormActivate(Sender: TObject);
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
procedure TJNTCRP004005F.WMOnPaint(var Msg: TMessage);
begin

	if ( m_bFirstFlag = False ) then
	begin
        m_bFirstFlag := True;

        // 仕入先ｺｰﾄﾞにﾌｫｰｶｽを設定する
        m_AcControl.SetFocus;

//        B_Print     .Enabled    :=  False; // <107>
{
        // 親のﾂｰﾙﾊﾞｰﾎﾞﾀﾝの制御
        B_Print     .Enabled    :=  False;
        B_Syousai   .Visible    :=  False;
        B_Delete    .Enabled    :=  False;
        B_Copy      .Visible    :=  False;
        B_Search    .Visible    :=  False;
        ToolButton  .Visible    :=  False;

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
procedure TJNTCRP004005F.fnGetMasterInfo();
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
procedure   TJNTCRP004005F.fnKbnStrSet ();
var
	i 		: integer;
    sTmp	: String;
    iMax	: integer;
    Qry : TFDQuery;
    lvStr: TStringList;
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
    Qry := Nil;                                                                 // <136> 2006/07/24 H.Kawato Add
    try

        Qry := TMQuery.Create(Self);											// MQueryの構築
        if Assigned(Qry) <> True then
        begin
            Exit;
        end;

        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        lvStr := TStringList.Create;

        //[敬称区分]を作成する
        lfnKbnStrSet(Qry, 'ALL', '敬称区分',lvStr);
        f1KEISYO.SelectItems := lvStr;

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
    f1USGKEI.MaxValue  :=  iMax;

    // 鏡欄税印字区分の設定 <104>
    f1SSGKEI.SelectItems.Clear;
	f1SSGKEI.Value          :=  0;
    f1SSGKEINM.Caption      :=  '';

	for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
    begin
    	iMax    :=  _UsgKeiItems[i].iCode;
		sTmp    :=  IntToStr(_UsgKeiItems[i].iCode) + ':' + _UsgKeiItems[i].sName;
		f1SSGKEI.SelectItems.Add(sTMp);
    end;
    f1SSGKEI.MaxValue   :=  iMax;

// <136> 2006/07/24 H.Kawato Add Start
	// 請求区分の設定
    f1SKYKBN.SelectItems.Clear;
	f1SKYKBN.Value      :=  0;
    f1SKYKBNNM.Caption  :=  '';

	for i := Low(_SeikyuKbnItems) to High(_SeikyuKbnItems) do
    begin
    	iMax    :=  _SeikyuKbnItems[i].iCode;
		sTmp    :=  IntToStr(_SeikyuKbnItems[i].iCode) + ':' + _SeikyuKbnItems[i].sName;
		f1SKYKBN.SelectItems.Add(sTMp);
    end;
    f1SKYKBN.MaxValue   :=  iMax;
// <136> 2006/07/24 H.Kawato Add End

// <145> 2006/11/16 H.Kawato Add Start
	// 支払通知書区分の設定
    f1LetterKbn.SelectItems.Clear;
	f1LetterKbn.Value       :=  0;
    f1LetterKbnNM.Caption   :=  '';

	for i := Low(_LetterKbnItems) to High(_LetterKbnItems) do
    begin
    	iMax    :=  _LetterKbnItems[i].iCode;
		sTmp    :=  IntToStr(_LetterKbnItems[i].iCode) + ':' + _LetterKbnItems[i].sName;
		f1LetterKbn.SelectItems.Add(sTMp);
    end;
    f1LetterKbn.MaxValue    :=  iMax;
// <145> 2006/11/16 H.Kawato Add End

// <157> 2007/08/22 H.Kawato Add Start
	// 支払調書・採用区分の設定
    f2GensenKbn.SelectItems.Clear;
	f2GensenKbn.Value      :=  0;
    f2GensenKbnNM.Caption  :=  '';

	for i := Low(_GensenKbnItems) to High(_GensenKbnItems) do
    begin
    	iMax    :=  _GensenKbnItems[i].iCode;
		sTmp    :=  IntToStr(_GensenKbnItems[i].iCode) + ':' + _GensenKbnItems[i].sName;
		f2GensenKbn.SelectItems.Add(sTMp);
    end;
    f2GensenKbn.MaxValue   :=  iMax;

	// 支払調書・個人／法人区分の設定
    f2PersonKbn.SelectItems.Clear;
	f2PersonKbn.Value      :=  0;
    f2PersonKbnNM.Caption  :=  '';

	for i := Low(_PersonKbnItems) to High(_PersonKbnItems) do
    begin
    	iMax    :=  _PersonKbnItems[i].iCode;
		sTmp    :=  IntToStr(_PersonKbnItems[i].iCode) + ':' + _PersonKbnItems[i].sName;
		f2PersonKbn.SelectItems.Add(sTMp);
    end;
    f2PersonKbn.MaxValue   :=  iMax;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
	// 支払通知書メール採用区分の設定
    f2MailKbn.SelectItems.Clear;
	f2MailKbn.Value      :=  0;
    f2MailKbnNM.Caption  :=  '';

	for i := Low(_MailKbnItems) to High(_MailKbnItems) do
    begin
    	iMax    :=  _MailKbnItems[i].iCode;
		sTmp    :=  IntToStr(_MailKbnItems[i].iCode) + ':' + _MailKbnItems[i].sName;
		f2MailKbn.SelectItems.Add(sTMp);
    end;
    f2MailKbn.MaxValue   :=  iMax;
// <176> ADD-END
end;

//-----------------------------------------------------------------------------
// fnSetKAISHAItems()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ｺｰﾄﾞの桁数/属性対応
//                自由管理項目を設定する
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnSetKAISHAItems();
begin

    // 取引先ｺｰﾄﾞの属性/桁数対応
    case m_TRCodeAttr of
        // 数値属性
        0:  begin
                f0CODE          .InputAttr      :=  iaZeroSup;
	        	f0CODE			.InputFlagEnabled:=	True;                       // <136> Add
                f1NayoseOyaCode .InputAttr      :=  iaZeroSup;
	        	f1NayoseOyaCode	.InputFlagEnabled:=	True;                       // <136> Add
                f1RendouCode    .InputAttr      :=  iaZeroSup;                  // <143> Add
                f1RendouCode    .InputFlagEnabled:= True;                       // <143> Add
                GridNayoseCode  .Alignment      :=  taRightJustify;
                GridNayoseOyaCode.Alignment     :=  taRightJustify;
                GridNayoseCode  .EditAlignment  :=  taRightJustify;
                GridNayoseOyaCode.EditAlignment :=  taRightJustify;
                NayoseOyaCode2	.InputAttr      :=  iaZeroSup;                  // <136> Add
	        	NayoseOyaCode2  .InputFlagEnabled:=	True;                       // <136> Add

                // <169> 2010/07/05 G.Kojima Add
                f2OyaCode	.InputAttr          :=  iaZeroSup;
	        	f2OyaCode   .InputFlagEnabled   :=	True;
                f2KoCode	.InputAttr          :=  iaZeroSup;
	        	f2KoCode    .InputFlagEnabled   :=	True;
                // <169> End

            end;
        // 数値(前ｾﾞﾛ有)属性
        1:  begin
                f0CODE          .InputAttr      :=  iaZeroPad;
	        	f0CODE			.InputFlagEnabled:=	True;                       // <136> Add
                f1NayoseOyaCode .InputAttr      :=  iaZeroPad;
	        	f1NayoseOyaCode	.InputFlagEnabled:=	True;                       // <136> Add
                f1RendouCode    .InputAttr      :=  iaZeroPad;                  // <143> Add
	        	f1RendouCode	.InputFlagEnabled:=	True;                       // <143> Add
                GridNayoseCode  .Alignment      :=  taRightJustify;
                GridNayoseOyaCode.Alignment     :=  taRightJustify;
                GridNayoseCode  .EditAlignment  :=  taRightJustify;
                GridNayoseOyaCode.EditAlignment :=  taRightJustify;
                NayoseOyaCode2  .InputAttr      :=  iaZeroPad;                  // <136> Add
	        	NayoseOyaCode2	.InputFlagEnabled:=	True;                       // <136> Add

                // <169> 2010/07/05 G.Kojima Add
                f2OyaCode       .InputAttr      :=  iaZeroPad;
	        	f2OyaCode       .InputFlagEnabled:=	True;
                f2KoCode        .InputAttr      :=  iaZeroPad;
	        	f2KoCode        .InputFlagEnabled:=	True;
                // <169> End

            end;
        // ﾌﾘｰ属性
        2:  begin
// <108>               f0CODE          .InputAttr      :=  iaFree;
// <108>               f1NayoseOyaCode .InputAttr      :=  iaFree;
                f0CODE          .InputAttr      :=  iaNone;
                f1NayoseOyaCode .InputAttr      :=  iaNone;
                f1RendouCode    .InputAttr      :=  iaNone;                     // <143> Add
                GridNayoseCode  .Alignment      :=  taLeftJustify;
                GridNayoseOyaCode.Alignment     :=  taLeftJustify;
                GridNayoseCode  .EditAlignment  :=  taLeftJustify;
                GridNayoseOyaCode.EditAlignment :=  taLeftJustify;
                NayoseOyaCode2  .InputAttr      :=  iaNone;                     // <136> Add

                // <169> 2010/07/05 G.Kojima Add
                f2OyaCode	.InputAttr          :=  iaNone;
                f2KoCode	.InputAttr          :=  iaNone;
                // <169> End
            end;
    end;

    f0CODE          .MaxLength    :=  m_TRCodeDigit;
    f1NayoseOyaCode .MaxLength    :=  m_TRCodeDigit;
    GridNayoseCode  .MaxLength    :=  m_TRCodeDigit;
    GridNayoseOyaCode.MaxLength   :=  m_TRCodeDigit;
    NayoseOyaCode2  .MaxLength    :=  m_TRCodeDigit;                            // <136> Add
    f1RendouCode    .MaxLength    :=  m_TRCodeDigit;                            // <143> Add

    // <169> 2010/07/06 G.Kojima Add
    f2OyaCode       .MaxLength    :=  m_TRCodeDigit;
    f2KoCode        .MaxLength    :=  m_TRCodeDigit;

    LblTRCODE.Caption   :=  '仕入先コード';
    if ( Trim(m_TRJHojyoName) <> '' ) then
    begin
        LblTRCODE.Caption   :=  m_TRJHojyoName + 'コード';
    end;

    // 社員ｺｰﾄﾞの属性/桁数対応
    case m_TNCodeAttr of
        // 数値属性
        0:  f1TNCODE    .InputAttr    :=  iaZeroSup;
        // 数値(前ｾﾞﾛ有)属性
        1:  f1TNCODE    .InputAttr    :=  iaZeroPad;
        // ﾌﾘｰ属性
        2:  f1TNCODE    .InputAttr    :=  iaFree;
    end;

    f1TNCODE    .MaxLength    :=  m_TNCodeDigit;

    LblTNCODE.Caption   :=  '担当者ｺｰﾄﾞ';
    if ( Trim(m_TNJHojyoName) <> '' ) then
    begin
        LblTNCODE.Caption   :=  m_TNJHojyoName + 'ｺｰﾄﾞ';
    end;

    // 部門ｺｰﾄﾞの属性/桁数対応
    case m_BMCodeAttr of
        // 数値属性
        0:  f1BMCODE    .InputAttr    :=  iaZeroSup;
        // 数値(前ｾﾞﾛ有)属性
        1:  f1BMCODE    .InputAttr    :=  iaZeroPad;
        // ﾌﾘｰ属性
        2:  f1BMCODE    .InputAttr    :=  iaFree;
    end;

    f1BMCODE    .MaxLength    :=  m_BMCodeDigit;

    LblBMCODE.Caption   :=  '部門ｺｰﾄﾞ';
    if ( Trim(m_BMJHojyoName) <> '' ) then
    begin
        LblBMCODE.Caption   :=  m_BMJHojyoName + 'ｺｰﾄﾞ';
    end;

    // <175> Add start
    case m_BMCodeAttr of
        // 数値属性
        0:  f1BmnCode    .InputAttr    :=  iaZeroSup;
        // 数値(前ｾﾞﾛ有)属性
        1:  f1BmnCode    .InputAttr    :=  iaZeroPad;
        // ﾌﾘｰ属性
        2:  f1BmnCode    .InputAttr    :=  iaFree;
    end;

    f1BmnCode    .MaxLength    :=  m_BMCodeDigit;
    // <175> Add end

end;

//-----------------------------------------------------------------------------
// fnInzForm()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｫｰﾑ初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnInzForm();
begin

    m_TRNCode   :=  0;

    f0CODE         .InputFlag := True;  //<122>
    f0CODE         .Zero := False;      //<122>

    f1NayoseOyaCode.Zero := False;      //<122>
    NayoseOyaCode2 .Zero := False;      //<136>
    f1RendouCode   .Zero := False;      //<143>
    f1LetterKbn    .Zero := False;      //<145>
    f1TNCODE       .Zero := False;      //<122>
    f1BMCODE       .Zero := False;      //<122>
    f2GensenKbn    .Zero := False;      //<157>
    f2PersonKbn    .Zero := False;      //<157>
    f2MailKbn      .Zero := False;      //<176>

    f1NayoseOyaCode.InputFlag := True;  //<122>
    NayoseOyaCode2 .InputFlag := True;  //<136>
    f1RendouCode   .InputFlag := True;  //<143>
    f1LetterKbn    .InputFlag := True;  //<145>
    f1TNCODE       .InputFlag := True;  //<122>
    f1BMCODE       .InputFlag := True;  //<122>
    f2GensenKbn    .InputFlag := True;  //<157>
    f2PersonKbn    .InputFlag := True;  //<157>
    f2MailKbn      .InputFlag := True;  //<176>

    // <169> 2010/07/05 G.Kojima Add
    f2OyaCode      .Zero        := FALSE;
    f2OyaCode      .InputFlag   := TRUE;

    f2KoCode       .Zero        := FALSE;
    f2KoCode       .InputFlag   := TRUE;
    // <169> End

    // <175> Add start
    f1BmnCode       .Zero        := FALSE;
    f1BmnCode       .InputFlag   := TRUE;
    // <175> Add end

    // [f1]項目の初期化
    fnInzFormf1;

    // [f2]項目の初期化
    fnInzFormf2;    // <157> Add

    // 初期化
	m_BtUpdFlg  :=  True;

    // ﾎﾞﾀﾝの状態を制御する
    fnBtnEnbChg;

    // 編集状態ｽｲｯﾁを初期化する
    m_EdtSw := False;

    DtlCsTab.Items[0].Selected	:= True;
    DtlCsTab.Items[1].Selected	:= False;   // <157> Add

// <157> 2007/08/22 H.Kawato Mod Start
{
//    HedCsTab.Items.Selected	:= 0;
// <136> 2006/07/24 H.Kawato Mod Start
//    PnlNayoseInfo.Visible   :=  False;
    if HedCsTab.Items.Selected = 1 then
	    PnlNayoseInfo.Visible   :=  TRUE
    else
	    PnlNayoseInfo.Visible   :=  FALSE;
// <136> 2006/07/24 H.Kawato Mod End
}
    if HedCsTab.Items.Selected = 1 then
    begin
        // 名寄せ情報パネル
	    PnlNayoseInfo.Visible   :=  TRUE;
// <176> DEL-STR
//      // 合計タブでは、支払情報パネルを非表示とする
//      DtlCsTab.Items[1].Visible := False;
// <176> DEL-END
    end
    else
    begin
        // 名寄せ情報パネル
	    PnlNayoseInfo.Visible   :=  FALSE;

// <176> DEL-STR
{        // 実在タブでは、支払情報パネルを表示する
        // ただし、ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
        if (m_iVerData < 6) then
            DtlCsTab.Items[1].Visible := FALSE
        else
            DtlCsTab.Items[1].Visible := TRUE;}
// <176> DEL-END
    end;
// <157> 2007/08/22 H.Kawato Mod End

// <136> 2006/07/24 H.Kawato Add
    SeikyuKbnLabel.Enabled  := FALSE;
    f1SKYKBN.Enabled      	:= FALSE;
    f1SKYKBNNM.Enabled 		:= FALSE;
// <136> 2006/07/24 H.Kawato Add
    NayoseOyaLabel.Enabled  := False;
    f1NayoseNM.Enabled      := False;
    f1NayoseOyaCode.Enabled := False;

// <155> 2007/07/10 H.Kawato Add
    LblRendouCode.Enabled   := True;
    f1RendouCode.Enabled    := True;
    f1RendouNM.Enabled      := True;
// <155> 2007/07/10 H.Kawato Add

// <169> 2010/07/05 G.Kojima Add
    f2OyaName.Caption   := '';
    f2KoName.Caption    := '';
// <169> End

    //<100>
    TempMode.visible := False;
    uvTempFlg        := False;

    // 連動得意先変更ﾌﾗｸﾞの初期化
    m_bRendouFlag   := False;       // <143> Add
end;

//-----------------------------------------------------------------------------
// fnInzFormf1()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｫｰﾑ初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnInzFormf1();
begin

    // [f1]項目の初期化
    MjsDispCtrl.MjsClrCtrls(Self,'f1');

    // [f1]項目を使用不可にする
    tbsKihon.Enabled := False;

    m_EdtSw         := False;
    m_RecGetSw      := False;

    // 郵便番号枝番
//  	f1POSTNO2.Zero  := False;   // <139> 2006/08/31 H.Kawato Del
  	f1POSTNO2.InputFlag  := TRUE;   // <136> 2006/07/24 H.Kawato Mod

    cbPayRootKbn.Checked := FALSE;  // <136> 2006/07/24 H.Kawato Add
end;

// <157> 2007/08/22 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnInzFormf2()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｫｰﾑ初期化処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnInzFormf2();
begin

    // [f2]項目の初期化
    MjsDispCtrl.MjsClrCtrls(Self,'f2');

// <176> DEL-STR
//  // [f2]項目を使用不可にする
//  tbsPay.Enabled := False;
// <176> DEL-END
end;
// <157> 2007/08/22 H.Kawato Add End

//-----------------------------------------------------------------------------
// fnBtnEnbChg()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾞﾀﾝの状態を制御する
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnBtnEnbChg();
begin
	MjsDispCtrl.MjsSetEnabled(Self,ucBtnOK,False);
	MjsDispCtrl.MjsSetEnabled(Self,ucBtnNG,False);

    // f0CODEが表示されている時はExit
//    if ( f0CODE.Enabled = True ) then Exit;

    // 決算未確定時
    if  ( uvDispFlg = 0 ) then  // <156> Add
    begin
        if  ( m_RecGetSw ) then
        begin
            MjsSetEnabled(Self,ucBtnOK,m_BtUpdFlg);
            MjsSetEnabled(Self,ucBtnNG,True);
        end;
    end;                        // <156> Add
end;

//-----------------------------------------------------------------------------
// BtnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : ﾎﾞﾀﾝｸﾘｯｸ処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.BtnClick(Sender: TObject);
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
function TJNTCRP004005F.fnBtnOnChange(pName: String): Boolean;
var
    lvCompName		:	string;

begin

    Result := False;

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
        fnCancel(True);
        Exit;
    end;

end;

//-----------------------------------------------------------------------------
// fnRecUpd()
//      PARAM   :
//      VAR     :
//      RETURN  : True : 正常終了　False : 異常終了
//      MEMO    : 更新処理
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnRecUpd(): Boolean;
var
    dqMasterData    : TMQuery;
    lvDaigaeNCD     : Extended;
// <133> 2006/04/18 H.Kawato Add
    lvPayNCoDe      : Extended;
    RendoInitRet    : Integer;
    bPayRendoFlg    : Boolean;
    ProgRendoParam  : TJNTPAYProgRendoParam;
// <133> 2006/04/18 H.Kawato Add
// <178> ADD-STR
    // 名寄せ親代替仕入先チェック用
    RendoInitRetChild   : Integer;
    ProgRendoParamChild : TJNTPAYProgRendoParam;
// <178> ADD-END
// <136> 2006/07/24 H.Kawato Add Start
    nUsKinKbn		: Integer;
    cKeisyoKbn		: String;
    Qry				: TMQuery;
//    iValue          : Integer;  // <149> Add
    bUpdSateiKbn    : Boolean;  // <157> Add
    iRet            : Integer;  // <157> Add

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
// <136> 2006/07/24 H.Kawato Add End
begin
    bUpdSateiKbn    := False;  // <157> Add

    // ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
    if ( fnFldChk(Self, True) = False ) then
    begin
        Result := False;
        Exit;
    end;

// <157> 2007/08/23 H.Kawato Add Start
    // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
// <166> MOD-STR
//  if (m_iVerData > 5) then
// <176> MOD-STR
//  if (m_iVerData > 5) and (uvTempFlg = False)then
    if (uvTempFlg = False)then
// <176> MOD-END
// <166> MOD-END
    begin
        // 支払調書・採用区分が変更された時
        if ( m_iGensenKbn <> f2GensenKbn.AsInteger ) then
        begin
            m_bRendouFlag   := True;                // 進捗連動処理を行う

            if ( f2GensenKbn.AsInteger = 1 ) and    // 0 → 1
               ( m_iSateiKbn <> 4 ) then            // 査定区分が「4:明細査定」以外
            begin
                iRet := MjsMessageBoxEX( Self,
                						'預かり源泉税を採用した支払先は、査定方法が'#13#10 +
                						'明細査定のみとなりますが、よろしいですか？',
                						'確認', mjQuestion, mjYesNo, mjDefNo);
                if iRet = mrYes then
                begin
                    bUpdSateiKbn    := True;        // 査定方法更新あり
                end
                else
                begin
                    Result  := False;
                    Exit;
                end;
            end;
        end;
    end;
// <157> 2007/08/23 H.Kawato Add End

// <133> 2006/04/18 H.Kawato Add St
    Result          := False;
    RendoInitRet    := -99;
    RendoInitRetChild := -99;                   // 名寄せ親代替仕入先チェック用 <178> ADD
    bPayRendoFlg    := False;

	SessionPractice(C_ST_PROCESS);				// <158>

// <166> ADD-STR
    if uvTempFlg then
        m_bRendouFlag := False;
// <166> ADD-END

    try     // <134> 2006/06/21 H.Kawato Add

        if ((uvDaiGaeCode =  '') and (f1NayoseOyaCode.text <> '')) or           // 名寄せ親代替仕入先の入力変更あり
           ((uvDaiGaeCode <> '') and (f1NayoseOyaCode.text =  '')) then         // MP_PAY_ProgRendo2 → MP_PAY_ProgRendo4を実行
        begin
            bPayRendoFlg := True;
            lvPayNCoDe  := fnGetNCODE(f0CODE.text, 22, m_TrCodeAttr);

            ProgRendoParam.pAppRecord    := Pointer(m_pRec);
            ProgRendoParam.iOptCd        := 54;                                 // オプションコード・債務処理       //<137> Add
            ProgRendoParam.iPrgCd        := 210100;                             // プログラムコード・支払情報登録   //<137> Add
            ProgRendoParam.dPAYCode      := lvPayNCoDe;
// <157> 2007/08/22 H.Kawato Mod Start
//            ProgRendoParam.iSateiChgKbn  := 0;                                  // 変更無し
            if ( bUpdSateiKbn ) then
                ProgRendoParam.iSateiChgKbn  := 1                               // 変更あり
            else
                ProgRendoParam.iSateiChgKbn  := 0;                              // 変更無し
// <157> 2007/08/22 H.Kawato Mod End
            ProgRendoParam.iNayoseChgKbn := 1;                                  // 変更あり
            ProgRendoParam.iSyoriKbn     := 0;                                  // 支払情報登録系処理
            ProgRendoParam.iSystemCode   := 1;                                  // 債務管理	<162>

            RendoInitRet := m_PayProgRendo.Init(ProgRendoParam);
// <143> 2006/09/26 H.Kawato Add Start
// <178> ADD-STR
            if (RendoInitRet = 0) and ((uvDaiGaeCode =  '') and (f1NayoseOyaCode.text <> '')) then
            begin
                // 名寄せ親代替仕入先チェック
                ProgRendoParamChild := ProgRendoParam;
                ProgRendoParamChild.dPAYCode := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);

                RendoInitRetChild := m_PayProgRendoChild.Init(ProgRendoParamChild);

                if not (RendoInitRetChild in [0, 1]) then
                    RendoInitRet := RendoInitRetChild;
            end;
// <178> ADD-END
        end
        else if ( m_bRendouFlag ) then                                          // 名寄せ親代替仕入先の入力変更なし、かつ連動得意先の変更あり
        begin                                                                   // MP_PAY_ProgRendo1を実行
// <149> 2007/04/16 H.Kawato Add Start
{
            if (m_bMankiChkFlg = False) then
            begin
                iValue := MjsMessageBoxEX(Self,'この支払先には期日指定満期データが存在します。'#13#10
                                            + '満期自動仕訳作成時、振込科目に取引先採用があった場合、'#13#10
                                            + '変更後の得意先がセットされますが、よろしいですか？','確認'
                                            ,mjQuestion,mjYesNo,mjDefNo);
                if iValue <> mrYes then
                    abort;
            end;
}
// <149> 2007/04/16 H.Kawato Add End
            bPayRendoFlg := True;
            lvPayNCoDe  := fnGetNCODE(f0CODE.text, 22, m_TrCodeAttr);

            ProgRendoParam.pAppRecord    := Pointer(m_pRec);
            ProgRendoParam.iOptCd        := 54;                                 // オプションコード・債務処理
            ProgRendoParam.iPrgCd        := 210100;                             // プログラムコード・支払情報登録
            ProgRendoParam.dPAYCode      := lvPayNCoDe;
// <157> 2007/08/22 H.Kawato Mod Start
//            ProgRendoParam.iSateiChgKbn  := 0;                                  // 変更無し
            if ( bUpdSateiKbn ) then
                ProgRendoParam.iSateiChgKbn  := 1                               // 変更あり
            else
                ProgRendoParam.iSateiChgKbn  := 0;                              // 変更無し
// <157> 2007/08/22 H.Kawato Mod End
            ProgRendoParam.iNayoseChgKbn := 0;                                  // 変更無し
            ProgRendoParam.iSyoriKbn     := 0;                                  // 支払情報登録系処理
            ProgRendoParam.iSystemCode   := 1;                                  // 債務管理	<162>

            RendoInitRet := m_PayProgRendo.Init(ProgRendoParam);
// <143> 2006/09/26 H.Kawato Add End
        end;

        if (bPayRendoFlg = False) or
           ((bPayRendoFlg = True) and ((RendoInitRet = 1) or (RendoInitRet = 0))) then
        begin
// <133> 2006/04/18 H.Kawato Add Ed

            // ﾄﾗﾝｻﾞｸｼｮﾝの開始
            m_cDataModule.BeginTran (m_cDBSelect);

            // MQueryの構築
        	dqMasterData	:= TMQuery.Create (Self);

            // DBとMQueryの接続
// <Rel>        	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

// ↓ <Rel>
		    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // DBとMQueryの接続
            	m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);

                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            end
            else
            begin
                // DBとMQueryの接続
            	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);
            end;

            try
                try
                    with (dqMasterData) do
                    begin
                        //------------------------------------------------------
                        // MTOKUIの更新
                        //------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('UPDATE MTOKUI SET             '
                            +   '   PayRootKbn = :nPayRootKbn  '    // 債務名寄せ区分
                            +   '   WHERE (NCode = :nNCode)    ');

                        ParamByName('nNCode').AsFloat   :=  m_TRNCode;

                        // 債務名寄せ区分
                        if ( cbPayRootKbn.Checked ) then
                                ParamByName('nPayRootKbn').AsInteger    :=  1
                        else    ParamByName('nPayRootKbn').AsInteger    :=  0;

                        ExecSQL();

                        //↓<Rel>
                        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        begin
                            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = False ) then
                            begin
                                Result := False;
                                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,m_TRNCode,dqMasterData) then
                            begin
                                Result := False;
                                Exit;
                            end;
                        end;
                        //↑<Rel>


                        //------------------------------------------------------
                        // MTOKUI_SELの更新
                        //------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('UPDATE MTOKUI_SEL SET          '
                            +   '    USDenPfm     = :nUSDenPfm  '   // 納品書ﾌｫｰﾑ
                            +   '   ,USGKei       = :nUSGKei    '   // 売上合計欄税印字
                            +   '   ,SSsyoPfm     = :nSSsyoPfm  '   // 支払通知書ﾌｫｰﾑ <104>
                            +   '   ,SSsyoKgm     = :nSSsyoKgm  '   // 合計欄税印字   <104>
                            +   '   ,TnNCode      = :nTnNCode    '  // 担当者コード
                            +   '   ,BmNCode      = :nBmNCode    '  // 部門コード
        		            +   '   ,UsKinKbn     = :nUsKinKbn  '	// 請求区分                     // <136> 2006/07/24 H.Kawato Add
                            +	ChkSelLicense()						// 販売未導入の場合は住所を設定 // <136> 2006/07/24 H.Kawato Add
                            +   'WHERE (BaseNCode = :nNCode)    '
                            +   '  and (RecKbn    = 2)    ');

                        ParamByName('nNCode').AsFloat   :=  m_TRNCode;

                        // 納品書ﾌｫｰﾑ
                        ParamByName('nUSDenPfm')    .AsInteger  := Trunc(f1USDENPFM.Value);
                        // 売上合計欄税印字
                        ParamByName('nUSGKei')      .AsInteger  := Trunc(f1USGKEI.Value);
                        // 担当者コード
                        ParamByName('nTnNCode')      .AsFloat   := fnGetNCODE(f1TNCODE.text,25,m_TnCodeAttr);
                        // 部門コード
                        ParamByName('nBmNCode')      .AsFloat   := fnGetNCODE(f1BMCODE.text,41,m_BmCodeAttr);
// <175> Add start
                        if(m_FeeBmnFlg = 1) then
                        	ParamByName('nBmNCode')      .AsFloat   := fnGetNCODE(f1BmnCODE.text,41,m_BmCodeAttr);
// <175> Add end
                        // 支払通知書ﾌｫｰﾑ <104>　
                        ParamByName('nSSsyoPfm')    .AsInteger  := Trunc(f1SSDENPFM.Value);
                        // 合計欄税印字   <104>
                        ParamByName('nSSsyoKgm')    .AsInteger  := Trunc(f1SSGKEI.Value);

// <136> 2006/07/24 H.Kawato Add Start
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
                                // 郵便番号(枝番)
                                ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
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
// <180> DEL                if Trim(cKeisyoKbn) = 'なし' then
// <180> DEL                    cKeisyoKbn := '';
                            ParamByName('nKeisyoKbn')   .AsString	:= cKeisyoKbn;
                            // メールアドレス
                            ParamByName('nMailAddress') .AsString	:= f1MailAd     .Text;
                        end;
// <136> 2006/07/24 H.Kawato Add End

                        ExecSQL();

// 2006/07/20 H.Kawato Add Start <135>

                        // 販売ﾗｲｾﾝｽが無い時
                        if not CheckModuleLicense(m_pRec,FXLicense.SEL_HAN) then
                        begin
                            Close();
                            SQL.Clear();
                            SQL.Add('UPDATE MTOKUI_SEL SET                  '
                                +   '    PostNo1        =   :nPostNo1       '   // 郵便番号(基番)
                                +   '   ,PostNo2        =   :nPostNo2       '   // 郵便番号(枝番)
                                +   '   ,Ads1           =   :nAds1          '   // 住所(上段)
                                +   '   ,Ads2           =   :nAds2          '   // 住所(下段)
                                +   '   ,Tel1           =   :nTel1          '   // 電話番号
                                +   '   ,SectionName    =   :nSectionName   '   // 送付先部署
                                +   '   ,TanNm          =   :nTanNm         '   // 送付先担当者
                                +   '   ,KeisyoKbn      =   :nKeisyoKbn     '   // 送付先担当者敬称
                                +   '   ,MailAddress    =   :nMailAddress   '   // メールアドレス
                                +   'WHERE (BaseNCode   =   :nNCode)        '
                                +   '  AND  RecKbn      =   2               ');

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
                                // 郵便番号(枝番)
                            	ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
                            end;

                            // 住所(上段)
                            ParamByName('nAds1')        .AsString	:= f1ADS1.Text;
                            // 住所(下段)
                            ParamByName('nAds2')        .AsString	:= f1ADS2.Text;
                            // 電話番号
                            ParamByName('nTel1')        .AsString	:= f1TEL1.Text;
                            // 送付先部署名称
                            ParamByName('nSectionName') .AsString	:= f1SectionName.Text;
                            // 担当者名称
                            ParamByName('nTanNm')       .AsString	:= f1TanNm.Text;
                            // 敬称区分
                            ParamByName('nKeisyoKbn')   .AsString	:= f1KEISYO.Text;
                            // メールアドレス
                            ParamByName('nMailAddress') .AsString	:= f1MailAd.Text;

                            ExecSQL();
                        end;
// 2006/07/20 H.Kawato Add End   <135>
                        //↓<Rel>
                        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        begin
                            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                            begin
                                Result := False;
                                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,m_TRNCode,dqMasterData) then
                            begin
                                Result := False;
                                Exit;
                            end;
                        end;
                        //↑<Rel>


                        //------------------------------------------------------
                        // MTOKUI_PAYの更新
                        //------------------------------------------------------
                        Close();
                        SQL.Clear();
// <157> 2007/08/24 H.Kawato Mod Start
{
                        SQL.Add('UPDATE MTOKUI_PAY SET                  '
                            +   '    PostNo1        =   :nPostNo1       '   // 郵便番号(基番)
                            +   '   ,PostNo2        =   :nPostNo2       '   // 郵便番号(枝番)
                            +   '   ,Ads1           =   :nAds1          '   // 住所(上段)
                            +   '   ,Ads2           =   :nAds2          '   // 住所(下段)
                            +   '   ,Tel1           =   :nTel1          '   // 電話番号
                            +   '   ,SectionName    =   :nSectionName   '   // 送付先部署
                            +   '   ,TanNm          =   :nTanNm         '   // 送付先担当者
                            +   '   ,KeisyoKbn      =   :nKeisyoKbn     '   // 送付先担当者敬称
                            +   '   ,MailAddress    =   :nMailAddress   '   // メールアドレス
                            +   '   ,UketoriName    =   :nUketoriName   '   // 受取人名称           // <145> Add
                            +   '   ,LetterKbn      =   :nLetterKbn     '   // 支払通知書区分       // <145> Add
                            +   '   ,CngNCode       =   :nCngNCode      '   // 名寄せ代替仕入先
                            +   '   ,UpdDateTM      =   :nUpdDateTM     '   // 修正日付             // <147> Add
                            +   '   ,UpdTantoNCode  =   :nUpdTantoNCode '   // 処理者内部コード     // <136> Add
                            +   '   ,RendoNCode     =   :nRendoNCode    '   // 連動得意先内部コード // <143> Add
                            +   'WHERE (BaseNCode   =   :nNCode)        ');

                        ParamByName('nNCode').AsFloat   :=  m_TRNCode;
}
                        SQL.Add('UPDATE MTOKUI_PAY SET                  '
                            +   '    PostNo1        =   :nPostNo1       '   // 郵便番号(基番)
                            +   '   ,PostNo2        =   :nPostNo2       '   // 郵便番号(枝番)
                            +   '   ,Ads1           =   :nAds1          '   // 住所(上段)
                            +   '   ,Ads2           =   :nAds2          '   // 住所(下段)
                            +   '   ,Tel1           =   :nTel1          '   // 電話番号
                            +   '   ,SectionName    =   :nSectionName   '   // 送付先部署
                            +   '   ,TanNm          =   :nTanNm         '   // 送付先担当者
                            +   '   ,KeisyoKbn      =   :nKeisyoKbn     '   // 送付先担当者敬称
                            +   '   ,MailAddress    =   :nMailAddress   '   // メールアドレス
                            +   '   ,UketoriName    =   :nUketoriName   '   // 受取人名称           // <145> Add
                            +   '   ,LetterKbn      =   :nLetterKbn     '   // 支払通知書区分       // <145> Add
                            +   '   ,CngNCode       =   :nCngNCode      '   // 名寄せ代替仕入先
                            +   '   ,UpdDateTM      =   :nUpdDateTM     '   // 修正日付             // <147> Add
                            +   '   ,UpdTantoNCode  =   :nUpdTantoNCode '   // 処理者内部コード     // <136> Add
                            +   '   ,RendoNCode     =   :nRendoNCode    '); // 連動得意先内部コード // <143> Add

                        // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
// <176> DEL-STR
//                      if (m_iVerData > 5) then
//                      begin
// <176> DEL-STR
                            SQL.Add('   ,GensenUseKbn   =   :nGensenKbn '   // 預かり源泉税採用区分
                                +   '   ,PersonKbn      =   :nPersonKbn '); // 個人／法人区分

                            if ( bUpdSateiKbn ) then
                                SQL.Add('   ,SateiKbn   =   :nSateiKbn  '); // 査定区分
// <176> DEL            end;
// <176> ADD-STR
                        SQL.Add('   ,PayKbn2        =   :nPayKbn2       '   // 通知書メール配信採用区分
                            +   '   ,ZipPass        =   :nZipPass       '); // パスワード
// <176> ADD-END

                        SQL.Add('WHERE (BaseNCode   =   :nNCode)        ');

                        ParamByName('nNCode').AsFloat   :=  m_TRNCode;
// <157> 2007/08/24 H.Kawato Mod End

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
// <139> 2006/08/31 H.Kawato Mod Start
                            // 郵便番号(枝番)
//                			ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
                            // 郵便番号(枝番)
                            if (f1POSTNO2.Text = '') then
                            begin
                    			ParamByName ('nPostNo2').Clear ();
                    			ParamByName ('nPostNo2').DataType	:= ftInteger;
                            end
                            else
                            begin
                			    ParamByName ('nPostNo2').AsInteger	:= Trunc (f1POSTNO2.Value);
                            end;
// <139> 2006/08/31 H.Kawato Mod End
                		end;

                        // 住所(上段)
                        ParamByName('nAds1')        .AsString	:= f1ADS1.Text;
                        // 住所(下段)
                		ParamByName('nAds2')        .AsString	:= f1ADS2.Text;
                        // 電話番号
                		ParamByName('nTel1')        .AsString	:= f1TEL1.Text;
                        // 送付先部署名称
                		ParamByName('nSectionName') .AsString	:= f1SectionName.Text;
                        // 担当者名称
                		ParamByName('nTanNm')       .AsString	:= f1TanNm.Text;
                        // 敬称区分
// <136> 2006/07/24 H.Kawato Mod
//                		ParamByName('nKeisyoKbn')   .AsString	:= f1KEISYO.Text;
                        cKeisyoKbn := f1KEISYO.text;
// <180> DEL            if Trim(cKeisyoKbn) = 'なし' then
// <180> DEL                cKeisyoKbn := '';
                        ParamByName('nKeisyoKbn')   .AsString	:= cKeisyoKbn;
// <136> 2006/07/24 H.Kawato Mod
                        // メールアドレス
                		ParamByName('nMailAddress') .AsString	:= f1MailAd.Text;
// <145> 2006/11/16 H.Kawato Add Start
                        // 受取人名称
                		ParamByName('nUketoriName') .AsString	:= f1ReceiverName.Text;
                        // 支払通知書区分
                		ParamByName('nLetterKbn')   .AsInteger  := Trunc(f1LetterKbn.Value);
// <145> 2006/11/16 H.Kawato Add End
                        // 名寄親代替仕入
                        lvDaigaeNCD := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                        ParamByName('nCngNCode').AsFloat        := lvDaigaeNCD;

                        ParamByName('nUpdDateTM').Value         := Now();           // <147> Add

                        ParamByName('nUpdTantoNCode').AsFloat   := m_TantoNCode;    // <136> Add

                        ParamByName('nRendoNCode').AsFloat      := fnGetNCODE(f1RendouCode.text, 22, m_TrCodeAttr); // <143> Add

// <157> 2007/08/22 H.Kawato Add Start
                        // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
// <176> DEL-STR
//                      if (m_iVerData > 5) then
//                      begin
// <176> DEL-END
                            // 預かり源泉税採用区分
                            ParamByName('nGensenKbn')   .AsInteger  := Trunc(f2GensenKbn.Value);
                            // 個人／法人区分
                            ParamByName('nPersonKbn')   .AsInteger  := Trunc(f2PersonKbn.Value);

                            // 査定区方法
                            if ( bUpdSateiKbn ) then
                            	ParamByName('nSateiKbn').AsInteger  := 4;           // 明細査定固定
// <176> DEL            end;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
                        // 通知書メール配信採用区分
                        ParamByName('nPayKbn2')     .AsInteger  := Trunc(f2MailKbn.Value);
                        // パスワード
                        ParamByName('nZipPass')     .AsString   := f2Password.Text;
// <176> ADD-END

                        ExecSQL();

                        //↓<Rel>
                        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        begin
                            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_PAY) = False ) then
                            begin
                                Result := False;
                                Exit;
                            end;

                            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,m_TRNCode,dqMasterData) then
                            begin
                                Result := False;
                                Exit;
                            end;
                        end;
                        //↑<Rel>
                    end;

                    // 代替コードを変更時には代替情報を更新する（親子フラグ、請求区分、請求先内部コード）
                    // コードを入れているか、空にしているか？   ×
                    // 変更がある場合                           ○  //<121>
//<121>            if ((uvDaiGaeCode =  '') and (f1NayoseOyaCode.text <> '')) or
//<121>               ((uvDaiGaeCode <> '') and (f1NayoseOyaCode.text =  '')) then
                    if (uvDaiGaeCode <> f1NayoseOyaCode.text) then
                        fnSetDaigaiData(m_TRNCode,lvDaigaeNCD);

// <136> 2006/07/24 H.Kawato Add Start
                    //名寄せ代替コードが設定されている場合は名寄せ情報に登録する
                    if (f1NayoseOyaCode.text <> '') then
                    begin
                        // 名寄せデータが存在しているか
                        Qry := TMQuery.Create (Self);
                        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                        with Qry do
                        begin
                            Close;
                            SQL.Clear;
                            SQL.Add('select count(PayNCode) as CNT from PayNayoseInfo '
                                +   'where (MasterKbn = 22 ) '
                                +   '  and (NayoseSyu = 1  ) '
                                +   '  and (NayoseKbn = 1  ) '
                                +   '  and (NayoseOyaNCode = :pOyaCode) '
                                +   '  and (PayNCode       = :pKoCode) ');
                            ParamByName('pOyaCode').AsFloat := m_TRNCode;
                            ParamByName('pKoCode' ).AsFloat := lvDaigaeNCD;

                            Open;

                            if GetFld('CNT').AsInteger = 0 then
                    			MakeNayoseInfo(f0CODE.Text, f1NayoseOyaCode.text, m_TRNCode, lvDaigaeNCD);
                        end;
                        Qry.Close;
                        Qry.Free;
                    end;
// <136> 2006/07/24 H.Kawato Add End

                    // ｺﾐｯﾄ(反映)
                    m_cDataModule.Commit (m_cDBSelect);

// ↓<Rel>
                    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        // 親会社DBに対してｺﾐｯﾄを実行する
                        m_cDataModule.Commit (m_SyncMaster.m_cPDBSelect);
// ↑<Rel>

                    // 正常終了
                	Result	:= TRUE;
                    if uvTempFlg then
                    begin
                        uvTmpUSDENPFM := f1USDENPFM.AsInteger;
                        uvTmpSSDENPFM := f1SSDENPFM.AsInteger;      // <104>
                        uvTmpUSGKEI   := f1USGKEI.AsInteger;
                        uvTmpSSGKEI   := f1SSGKEI.AsInteger;        // <104>
                        uvTmpBMCODE   := f1BMCODE.Text;
                        uvTmpTNCODE   := f1TNCODE.Text;
// <167> ADD-STR
                        uvTmpLetterKbn    := f1LetterKbn.AsInteger;
                        uvTmpGensenUseKbn := f2GensenKbn.AsInteger;
                        uvTmpPersonKbn    := f2PersonKbn.AsInteger;
// <167> ADD-END
// <176> ADD-STR
                        uvTmpMailUseKbn   := f2MailKbn.AsInteger;
                        uvTmpPassword     := f2Password.Text;
// <176> ADD-END
                    end;
                except
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

                    Beep ();
                    // ﾒｯｾｰｼﾞ
            		fnOutputDBErrorMessage ();
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
                    m_cDataModule.Rollback (m_cDBSelect);
                    // 異常終了
            		Result	:= FALSE;
            		Exit;
                end;
            finally
                dqMasterData.Close ();
        	    dqMasterData.Free  ();
            end;

            // ﾌｫｰﾑの初期化
            fnInzForm;

            // 主ｷｰ項目へﾌｫｰｶｽを移動する
        	f0CODE.Text := '';
            HedPanel.Enabled := True;
            m_AcControl	:= f0CODE;
        	m_AcControl.SetFocus();

// <133> 2006/04/18 H.Kawato Add St
        end;

        if RendoInitRet = 1 then
            m_PayProgRendo.Exec;
// <178> ADD-STR
        // 名寄せ親代替仕入先
        if RendoInitRetChild = 1 then
            m_PayProgRendoChild.Exec;
// <178> ADD-END

    finally
		SessionPractice(C_ED_PROCESS);			// <158>
        if RendoInitRet <> -99 then
            m_PayProgRendo.Term;
// <178> ADD-STR
        // 名寄せ親代替仕入先チェック用
        if RendoInitRetChild <> -99 then
            m_PayProgRendoChild.Term;
// <178> ADD-END
    end;
// <133> 2006/04/18 H.Kawato Add Ed
end;

//-----------------------------------------------------------------------------
// fnCancel()
//      PARAM   : FcsChg    Boolean
//      VAR     :
//      RETURN  :
//      MEMO    : 編集をｷｬﾝｾﾙする
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnCancel(FcsChg: Boolean): Boolean;
var
    nReturn :   Integer;
begin

    Result := False;

    // 編集結果を確認する
    if ( m_EdtSw ) then
    begin
		nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	    if	( nReturn = CONFIRM_RETFOCUSED ) then
    	begin
            Result := True;
            case HedCsTab.Items.Selected of
                0,1:    MjsSetFocus(Self, ucBtnNG);
//                  2:    begin
                2,3:    begin   // <159> Mod
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

// <143> 2006/09/26 H.Kwato Add Start
    // 終了ﾌﾗｸﾞをONに設定する
//    if ( m_CloseFlg = False ) then m_CloseFlg := True;
// <143> 2006/09/26 H.Kawato Add End

    if FcsChg then
    begin
        // ﾌｫｰﾑの初期化
        fnInzForm;
    end;

    // 編集ｽｲｯﾁを初期化
    m_EdtSw := False;

    // 主ｷｰ項目へﾌｫｰｶｽを移動する
    case HedCsTab.Items.Selected of
        0,1:    begin
                    // 主ｷｰ項目へﾌｫｰｶｽを移動する
                    if ( FcsChg ) then
                    begin
                		f0CODE.Text     :=  '';
                		HedPanel.Enabled  :=  True;
                        m_AcControl	    :=  f0CODE;
                    	m_AcControl.SetFocus();
                    end;
                end;
//        2:  begin
        2,3:    begin           // <159> Mod
                fnInzFormf1;
                fnInzFormf2;    // <157> Add
                f0CODE.Text     :=  '';
                HedPanel.Enabled  :=  True;
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
//      RETURN  : True:処理続行、False:処理中止
//      MEMO    : 終了ﾒｯｾｰｼﾞ確認
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnCloseConfirm(): Boolean;
var
	iRtn : Word;
begin

    Result  :=  True;

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
            if ( fnRecUpd = False ) then
            begin
                Result := False;
                Exit;
            end;
        end;
        //いいえ
        mrNo:
        begin
            //編集ｽｲｯﾁを初期化（FormClose要求が2回くるための対応）
            m_EdtSw := False;;
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
// fnESCConfirm()
//      PARAM   :
//      VAR     :
//      RETURN  : True:処理続行、False:処理中止
//      MEMO    : ESC操作時ﾒｯｾｰｼﾞ確認
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnESCConfirm(): Boolean;
var
	iRtn : Word;
begin

    Result  :=  True;

    if ( m_BtUpdFlg = False ) then
    begin
        m_EdtSw := False;;
        // 編集をｷｬﾝｾﾙする
        fnCancel(True);
        Exit;
    end;

    // 編集ｽｲｯﾁを判定
    if ( m_EdtSw = False ) then
    begin
        // 編集をｷｬﾝｾﾙする
        fnCancel(True);
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
            if ( fnRecUpd = False ) then
            begin
                Result := False;
                Exit;
            end;
        end;
        // いいえ
        mrNo:
        begin
            m_EdtSw := False;;
            fnCancel(True);
        end;
        // ｷｬﾝｾﾙ
        mrCancel:
        begin
            Result := False;
            Exit;
        end;
    end;
end;

//-----------------------------------------------------------------------------
// fnFldChk()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//                AllChkMode    Boolean
//      VAR     :
//      RETURN  : True : 正常 False : 異常
//      MEMO    : ﾌｨｰﾙﾄﾞ入力値のﾁｪｯｸをする
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnFldChk(Sender: TObject; AllChkMode: Boolean): Boolean;
var
    lvCompoName : string;
//    lvRowNo     : Integer;
    lvCode,
    lvNm,
    lvNmk       : String;
    Qry         : TMQuery;
    lvNCODE     : Extended;
    Bol         : Boolean;
    lvErrCod    : Integer;
    lvRet		: Integer;  // <138> 2006/08/16 H.Kawato Add

begin

    Result  :=  True;

    lvCompoName := TComponent(Sender).Name;

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
                if m_TRCodeAttr <> 2 then
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
                		MjsMessageBox(Self, '仕入先が採用されていない取引先です。', mjInformation, mjDefOk)
                    else
                        uvSelSys.MsgDlg(1010,50);
↑<Rel>}
//↓<Rel>
                    case lvErrCod of
                        1:
                        begin
                		    MjsMessageBox(Self, '仕入先が採用されていない取引先です。', mjInformation, mjDefOk)
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

    // <169> 2010/07/05 G.Kojima Add
    // ----------------------------
    //         名寄せ親取引先ｺｰﾄﾞ
    // ----------------------------
    with f2OyaCode do
    begin
        if ( AllChkMode ) or ( lvCompoName = Name ) then
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

            Text := TrimRight(f2OyaCode.Text);
            if ( Trim(Text) <> '' ) then
            begin
                //合計取引先
                if ( fnGetNAME(Text,221,m_TrCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f2OyaName.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);

                    Result := FALSE;
                    Exit;
                end
                else
                begin
                    f2OyaName.Caption   := lvNmk;
                end;
            end;

            if AllChkMode = FALSE then Exit;
        end;
    end;

    // ----------------------------
    //         名寄せ子取引先ｺｰﾄﾞ
    // ----------------------------
    with f2KoCode do
    begin
        if ( AllChkMode ) or ( lvCompoName = Name ) then
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

            Text := TrimRight(f2KoCode.Text);
            if ( Trim(Text) <> '' ) then
            begin
                //実在取引先
                if ( fnGetNAME(Text,22,m_TrCodeAttr,lvNMK ) = FALSE ) then
                begin
                    f2KoName.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);

                    Result := FALSE;
                    Exit;
                end
                else
                begin
                    f2KoName.Caption   := lvNmk;
                end;
            end;

            if AllChkMode = FALSE then Exit;
        end;
    end;
    // <169> End




(* <123>
    //===================================================================
    // 仕入合計欄税印字
    //===================================================================
    if (uvTempFlg = False) and (PnlSelInfo.Visible) = True then
    begin
        with f1USGKEI do
        begin
            if (AllChkMode) or (lvCompoName = Name) then
            begin
                if Value = 0 then
                    Value := uvTmpUSGKEI;

                if (Value <> 1) and (Value <> 2) and (Value <> 9) then
                begin
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;

    //===================================================================
    // 鏡欄税印字 <104>
    //===================================================================
    if uvTempFlg = False then
    begin
        with f1SSGKEI do
        begin
            if (AllChkMode) or (lvCompoName = Name) then
            begin
                if Value = 0 then
                    Value := uvTmpSSGKEI;

                if (Value <> 1) and (Value <> 2) and (Value <> 9) then
                begin
                    SetFocus;
                    Result := False;
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;
*)
    //===================================================================
    //部門コード
    //===================================================================
    with f1BMCODE do
    begin
        if PnlSelInfo.Visible = True then
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                //<122> --- St ---
                if m_BMCodeAttr <> 2 then
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

                // 未入力時処理
                if Trim(Text) = '' then
                    Text    := uvTmpBMCODE;
                
                Text := TrimRight(Text);	//<233>
                if Trim(Text) <> '' then
                begin
                    if fnGetNAME(Text,41,m_BMCodeAttr,lvNMK ) = False then
                    begin
                        f1BMNAME.Caption   := '';
                        uvSelSys.MsgDlg(1010,50);
                        DtlCsTab.Items.Selected := 0;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else begin
                        f1BMNAME.Caption   := lvNmk;
                    end;
                end;
                if AllChkMode = False then Exit;
            end;
        end;
    end;

    // <175> Add start
    with f1BmnCode do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if m_BMCodeAttr <> 2 then
            begin
                if f1BmnCode.InputFlag = False then
                    f1BmnCode.Zero := True
                else
                    f1BmnCode.Zero := False;
            end
            else
                f1BmnCode.Zero := False;

            f1BmnName.Caption   := '';
            Text := TrimRight(Text);
            if Trim(Text) <> '' then
            begin
                if fnGetNAME(Text,41,m_BMCodeAttr,lvNMK ) = False then
                begin
                    f1BmnName.Caption   := '';
                    uvSelSys.MsgDlg(1010,50);
                    DtlCsTab.Items.Selected := 0;
                    SetFocus;
                    Result := False;
                    Exit;
                end
                else begin
                    //部門検索EXPから取得した名称をセット
                    if m_BumonNcodeEx > 0 then  f1BMNAME.Caption   := m_BumonNMkEX
                        else  f1BMNAME.Caption   := lvNmk
                end;
            end;
            if AllChkMode = False then Exit;
        end;
    end;
    // <175> Add end

    //===================================================================
    //担当者コード
    //===================================================================
    with f1TNCODE do
    begin
        if PnlSelInfo.Visible = True then
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                //<122> --- St ---
                if m_TNCodeAttr <> 2 then
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

                // 未入力時処理
                if Trim(Text) = '' then
                    Text := uvTmpTNCODE;  //<102>

                Text := TrimRight(Text);	//<233>
                if Trim(Text) <> '' then
                begin
                    if fnGetNAME(Text,25,m_TNCodeAttr,lvNMK ) = False then
                    begin
                        f1TNNAME.Caption   := '';
                        uvSelSys.MsgDlg(1010,50);
                        DtlCsTab.Items.Selected := 0;
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
    end;

    //===================================================================
    //仕入伝票ﾌｫｰﾑ
    //===================================================================
    with f1USDENPFM do
    begin
        if PnlSelInfo.Visible = True then
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                if Value = 0 then
                    Value := uvTmpUSDENPFM;

                lvCode := IntToStr(AsInteger);
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                if gfnJNTSELRptNameGet(Qry, 'st00', lvCode, lvNm, lvNmk) = False then
                begin
                    f1USDENPFMNM.Caption    := '';
                    uvSelSys.MsgDlg(1010,50);
                    SetFocus;
                    Result := False;
                    Qry.Free;
                    Exit;
                end
                else
                begin
                    Qry.Free;
                    f1USDENPFMNM.Caption    := lvNmk;
                    // 納品書ﾌｫｰﾑの取得
    //                fnDFMGET;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;

    //===================================================================
    //支払通知書ﾌｫｰﾑ <104>
    //===================================================================
    with f1SSDENPFM do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if Value = 0 then
                Value := uvTmpSSDENPFM;

            lvCode := IntToStr(AsInteger);
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

            if gfnJNTSELRptNameGet(Qry, 'st00', lvCode, lvNm, lvNmk) = False then
            begin
                f1USDENPFMNM.Caption    := '';
                uvSelSys.MsgDlg(1010,50);
                SetFocus;
                Result := False;
                Qry.Free;
                Exit;
            end
            else
            begin
                Qry.Free;
                f1SSDENPFMNM.Caption    := lvNmk;
            end;

            if AllChkMode = False then Exit;
        end;
    end;

// <136> 2006/07/24 H.Kawato Add Start
    //===================================================================
    //      請求区分
    //===================================================================
    if ( uvTempFlg = FALSE ) and (PnlNayoseInfo.Visible = TRUE) then
    begin
        with f1SKYKBN do
        begin
            if ( Visible ) and ( cbPayRootKbn.Checked = TRUE ) then
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
// <136> 2006/07/24 H.Kawato Add End

    //===================================================================
    //名寄せ親代替コード
    //===================================================================
    with f1NayoseOyaCode do
    begin
// <136> 2006/07/24 H.Kawato Mod
//        if Visible then
// <144> 2006/11/08 H.Kawato Mod
//        if ( Visible ) and ( cbPayRootKbn.Checked = TRUE ) and ( f1SKYKBN.Value = 1 ) then
        if ( Visible ) and (Enabled) and ( cbPayRootKbn.Checked = TRUE ) and ( f1SKYKBN.Value = 1 ) then
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                //<122> --- St ---
                if m_TRCodeAttr <> 2 then
                begin
                    if f1NayoseOyaCode.InputFlag = False then
                        f1NayoseOyaCode.Zero := True
                    else
                        f1NayoseOyaCode.Zero := False;
                end
                else
                    f1NayoseOyaCode.Zero := False;
                //<122> --- Ed ---

                f1NayoseNM.Caption := '';
                if Trim(Text) = '' then
                begin
                    //未入力時処理
// <136> 2006/07/24 H.Kawato Mod
//                    Text := '';
                    uvSelSys.MsgDlg(1010,10);
                    DtlCsTab.Items.Selected :=  0;
                    MjsSetFocus(Self, f1NayoseOyaCode.Name);
                    Result := FALSE;
                    Exit;
// <136> 2006/07/24 H.Kawato Mod
                end
                else
                begin
                    Text := TrimRight(Text);
                    if fnGetNAME(Text, 22, m_TrCodeAttr, lvNMK) = False then
                    begin
                        f1NayoseNM.Caption := '';
                        uvSelSys.MsgDlg(1010,50);
                        DtlCsTab.Items.Selected := 0;
                        SetFocus;
                        Result := False;
                        Exit;
                    end
                    else begin
                        f1NayoseNM.Caption   := lvNmk;
                    end;

// <159> 2008/02/29 H.Kawato Add Start
                    // 通知書名寄せに登録されている取引先は代替仕入先設定不可
                    if ( fnCheckPayNayoseSyu(Trim(Text)) = True ) then
                    begin
                    	MjsMessageBox(Self, '通知書名寄せで登録済です。', mjInformation, mjDefOk);
                        DtlCsTab.Items.Selected := 0;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
// <159> 2008/02/29 H.Kawato Add End

// <163> ADD-STR
                    // スポット支払支払先として設定された支払先は名寄せ設定不可。
                    if ( fnCheckIsSpot(Trim(Text)) = True ) then
                    begin
                    	MjsMessageBox(Self, 'スポット支払支払先として設定されています。'+#13#10+'名寄せ親代替仕入先として設定できません。', mjInformation, mjDefOk);
                        DtlCsTab.Items.Selected := 0;
                        SetFocus;
                        Result := False;
                        Exit;
                    end;
// <163> ADD-END

                    Qry := TMQuery.Create (Self);
                    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
                    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);

                    with Qry do
                    begin
                        //-----------------------------------------------------------
                        // 伝票の発生がある単独仕入先は、請求先に指定できない<100>
                        //-----------------------------------------------------------
                        Close;
                        SQL.Clear;
                        SQL.Add('select OYAKOFLG from MTOKUI_SEL where BaseNCode = :pCODE and RecKbn = 2');

                        lvNCODE := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                        ParamByName('pCODE').AsFloat := lvNCODE;
                        Open;

                        if FieldByName('OYAKOFLG').AsInteger = 0 then
                        begin
                            if f0CODE.Text <> f1NayoseOyaCode.Text then
                            begin
                                // PRC_MA0150_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
                                with StdProc3 do
                                begin
                                    ParamByName('@pTRNCD').AsFloat    := lvNCODE;
                                    ParamByName('@pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;
                                    ParamByName('@pEDYMD').AsDateTime := uvSelSys.GetOKedDymd;
                                    ParamByName('@pSNYM').AsInteger   := uvSelSys.GetOKstNym;
                                    ParamByName('@pENYM').Asinteger   := uvSelSys.GetOKedNym;
									FetchOptions.Items := FetchOptions.Items - [fiMeta];
                                    ExecProc;
                                    Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
                                end;

// <164> MOD-STR
//                              if not Bol then
                                if ( not Bol ) and (SimeChkFlg <> 1) then
// <164> MOD-END
                                begin
                           		    MjsMessageBox(Self, 'この仕入先は伝票が入力済みなので'#13#10
                                                    + '代替仕入先として登録できません。', mjInformation, mjDefOk);
                                    DtlCsTab.Items.Selected := 0;
                                    f1NayoseOyaCode.SetFocus;
                                    Result := False;
                                    Close;
                                    Free;
                                    Exit;
                                end;
                            end;
                        end;

                        //-----------------------------------------------------------
                        // 他の合計仕入先の代替になっている場合は指定できない <114>
                        // 但し削除されたものは除く                           <136>
                        //-----------------------------------------------------------
                        Close;
                        SQL.Clear;
// <136> 2006/07/24 H.Kawato Mod Start
//                        SQL.Add('select BaseNCode from MTOKUI_PAY where CngNCode = :pCODE');
                        SQL.Add('select TOKP.BaseNCode from MTOKUI_PAY as TOKP');
                        SQL.Add('inner join MTOKUI as TOK on TOKP.BaseNCode = TOK.NCode and TOK.RDelKbn=0');
                        SQL.Add('where TOKP.CngNCode = :pCODE');
// <136> 2006/07/24 H.Kawato Mod End
                        lvNCODE := fnGetNCODE(f1NayoseOyaCode.Text, 22, m_TrCodeAttr);
                        ParamByName('pCODE').AsFloat := lvNCODE;
                        Open;

                        // 選択している合計仕入先の内部ｺｰﾄﾞを取得
                        lvNCODE := fnGetNCODE(f0CODE.Text, 22, m_TrCodeAttr);

                        if (not EOF)                                     and
                           (FieldByName('BaseNCode').AsFloat <> lvNCode) then
                        begin
                       		MjsMessageBox(Self, 'この仕入先は他の仕入先の代替仕入先に'#13#10
                                            + '指定されている為登録できません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := False;
                            Close;
                            Free;
                            Exit;
                        end;

// <136> 2006/07/24 H.Kawato Add Start 
                        // -----------------------------------------------------------
                        // 他の名寄せに登録されている場合は指定できない
                        // 但し削除されたものは除く
                        // -----------------------------------------------------------
                        Close();
                        SQL.Clear();
                        SQL.Add('select NI.NayoseOyaNCode from PAYNayoseInfo as NI');
                        SQL.Add('inner join MTOKUI as TOK1 on NI.PayNCode = TOK1.NCode and TOK1.RDelKbn=0');
                        SQL.Add('inner join MTOKUI as TOK2 on NI.NayoseOyaNCode = TOK2.NCode and TOK2.RDelKbn=0');
                        SQL.Add('where NI.PayNCode = :pCODE');
                        SQL.Add('and NI.MasterKbn = 22 and NI.NayoseSyu = 1 and NI.NayoseKbn = 1');

                        lvNCODE :=  fnGetNCODE(f1NayoseOyaCode.Text, 22, m_TrCodeAttr);
                        ParamByName('pCODE'   ).AsFloat := lvNCODE;
                        Open();

                        // 選択している合計仕入先の内部ｺｰﾄﾞを取得
                        lvNCODE :=  fnGetNCODE(f0CODE.Text, 22, m_TrCodeAttr);

                        if ( not EOF )                                     and
                           ( FieldByName('NayoseOyaNCode').AsFloat <> lvNCode ) then
                        begin
                       		MjsMessageBox(Self, '既に他の仕入先の名寄せに'#13#10
                                            + '指定されている為登録できません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := FALSE;
                            Close();
                            Free();
                            Exit;
                        end;

                        // -----------------------------------------------------------
                        // 新規代替仕入先ｺｰﾄﾞに残高がある場合は登録できない
                        // -----------------------------------------------------------
                        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc7);
                        with StdProc7 do
                        begin
                            lvNCODE :=  fnGetNCODE(f1NayoseOyaCode.Text, 22, m_TrCodeAttr);
                            ParamByName('@p_PAYNCode').AsFloat := lvNCODE;
							FetchOptions.Items := FetchOptions.Items - [fiMeta];
                            ExecProc;
// <164> MOD-STR
//                              if ParamByName('@p_Status').AsInteger = -1 then // 残高または発生
                                if (ParamByName('@p_Status').AsInteger = -1) and (SimeChkFlg <> 1) then // 残高または発生
// <164> MOD-END
                            begin
                       		    MjsMessageBox(Self, 'この仕入先は伝票が入力済みなので'#13#10
                                                + '代替仕入先として登録できません。', mjInformation, mjDefOk);
                                DtlCsTab.Items.Selected := 0;
                                f1NayoseOyaCode.SetFocus;
                                Result := FALSE;
                                Exit;
                            end;
                        end;
// <136> 2006/07/24 H.Kawato Add End

                        Close;
                        Free;
                    end;
                end;

// <138> 2006/08/16 H.Kawato Mod Start
{
// <136> 2006/07/24 H.Kawato Add Start
                lvNCODE := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                if not fnGetMTOKUI_Info(lvNCODE) then
                begin
                    MjsMessageBox(Self, '締日情報の異なる名寄せ設定はできません。', mjInformation, mjDefOk);
                    DtlCsTab.Items.Selected := 0;
                    f1NayoseOyaCode.SetFocus;
                    Result := FALSE;
                    Exit;
                end;
// <136> 2006/07/24 H.Kawato Add End
}
                lvNCODE := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);
                lvRet	:= fnGetMTOKUI_Info(lvNCODE);
                case lvRet of
                -2:
                    begin
// <160> Add
						// 販売ﾗｲｾﾝｽあり、または締日制限あり
						if (m_iCloseDayFlg = 0) then
						begin
// <160> Add
                            MjsMessageBox(Self, '通常請求以外は、名寄せ設定はできません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := FALSE;
                            Exit;
						end;							// <160> Add
                    end;
                -3:
                    begin
                        // 販売ﾗｲｾﾝｽあり、または締日制限あり
                        if (m_iCloseDayFlg = 0) then    // <148> Add ※if文の追加
                        begin
                            MjsMessageBox(Self, '締日情報の異なる名寄せ設定はできません。', mjInformation, mjDefOk);
                            DtlCsTab.Items.Selected := 0;
                            f1NayoseOyaCode.SetFocus;
                            Result := FALSE;
                            Exit;
                        end;                            // <148> Add
                    end;
                end;
// <138> 2006/08/16 H.Kawato Mod End

                if AllChkMode = False then
                    Exit;
            end;
        end;
    end;

// <145> 2006/11/16 H.Kawato Add Start
    //===================================================================
    //支払通知書区分
    //===================================================================
    with f1LetterKbn do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            m_ErrObjNm := '';

            f1ItemsCheak(f1LetterKbn);

            if (m_ErrObjNm <> '') then
            begin
                uvSelSys.MsgDlg(1010,40);
                Result := False;
                MjsSetFocus(Self, m_ErrObjNm);
                Exit;
            end;

            if AllChkMode = False then Exit;
        end;
    end;
// <145> 2006/11/16 H.Kawato Add End

// <143> 2006/09/26 H.Kawato Add Start
    //===================================================================
    //連動得意先コード
    //===================================================================
    with f1RendouCode do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            if ( Visible ) then
            begin
                if (not fnRendoDataCheck) then
                begin
                    f1RendouCode.SetFocus;
                    Result := FALSE;
                    Exit;
                end;
                // <175> Add start
                m_ErrObjNm := '';

                f1ItemsCheak(f1RendouCode);

                if (m_ErrObjNm <> '') then
                begin
                    uvSelSys.MsgDlg(1010,50);
                    Result := False;
                    MjsSetFocus(Self, m_ErrObjNm);
                    Exit;
                end;

                if AllChkMode = False then Exit;
                // <175> Add end
            end;
        end;
    end;
// <143> 2006/09/26 H.Kawato Add End

    //===================================================================
    //<123> START
    //===================================================================
    with f1USGKEI do
    begin
//      if f1USGKEI.Visible then										// 051117 hirota
        if (f1USGKEI.Visible) AND (PnlSelInfo.Visible) then				// 051117 hirota
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1USGKEI);

                if (m_ErrObjNm <> '') then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    Result := False;
                    MjsSetFocus(Self, m_ErrObjNm);
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;
    //===================================================================
    with f1SSGKEI do
    begin
        if f1SSGKEI.Visible then
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                m_ErrObjNm := '';

                f1ItemsCheak(f1SSGKEI);

                if (m_ErrObjNm <> '') then
                begin
                    uvSelSys.MsgDlg(1010,40);
                    Result := False;
                    MjsSetFocus(Self, m_ErrObjNm);
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
    end;
    //===================================================================
    //<123> End
    //===================================================================

// <157> 2007/08/22 H.Kawato Add Start
// <176> DEL-STR
//  // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//  if (m_iVerData > 5) then
//  begin
// <176> DEL-END
        //===================================================================
        //支払調書・採用区分
        //===================================================================
        with f2GensenKbn do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                m_ErrObjNm := '';

                f2ItemsCheak(f2GensenKbn);

                if (m_ErrObjNm <> '') then
                begin
// <173> ADD-STR
                    if (not DtlCsTab.Items[1].Selected) then
                    begin
                        DtlCsTab.Items[1].Selected	:= True;
                        DtlCsTab.Items[0].Selected	:= False;
                    end;
// <173> ADD-END
                    uvSelSys.MsgDlg(1010,40);
                    Result := False;
                    MjsSetFocus(Self, m_ErrObjNm);
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;

        //===================================================================
        //個人／法人区分
        //===================================================================
        with f2PersonKbn do
        begin
            if (AllChkMode = True) or (lvCompoName = Name) then
            begin
                m_ErrObjNm := '';

                f2ItemsCheak(f2PersonKbn);

                if (m_ErrObjNm <> '') then
                begin
// <173> ADD-STR
                    if (not DtlCsTab.Items[1].Selected) then
                    begin
                        DtlCsTab.Items[1].Selected	:= True;
                        DtlCsTab.Items[0].Selected	:= False;
                    end;
// <173> ADD-END
                    uvSelSys.MsgDlg(1010,40);
                    Result := False;
                    MjsSetFocus(Self, m_ErrObjNm);
                    Exit;
                end;

                if AllChkMode = False then Exit;
            end;
        end;
// <176> DEL    end;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
    //===================================================================
    //支払通知書メール配信採用区分
    //===================================================================
    with f2MailKbn do
    begin
        if (AllChkMode = True) or (lvCompoName = Name) then
        begin
            m_ErrObjNm := '';

            f2ItemsCheak(f2MailKbn);

            if (m_ErrObjNm <> '') then
            begin
                uvSelSys.MsgDlg(1010,40);
                Result := False;
                MjsSetFocus(Self, m_ErrObjNm);
                Exit;
            end;

            if AllChkMode = False then Exit;
        end;
    end;
// <176> ADD-END
end;

//-----------------------------------------------------------------------------
// fnRecGet()
//      PARAM   : CODE  取引先ｺｰﾄﾞ（外部）
//      VAR     :
//      RETURN  : True : 正常 False ; 異常
//      MEMO    : 対象ﾚｺｰﾄﾞを取得する
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnRecGet(CODE: String): Boolean;
var
//    DmqData         : TMQuery;
	dqMasterData    : TMQuery;
    Qry             : TMQuery;
//    Qry2            : TMQuery;    // <136> Del
//    sCode           : String;
    sSumKbn         : Integer;
    sTmp            : String;
    lvNMK           : String;
    lvCode,
    lvNm            : String;
    nCngNCode       : Extended;
//    bDaiKbn         : Boolean;    // <136> Del
    bSkyKbn         : Boolean;      // <136> Add
    nRenNCode       : Extended;     // <143> Add

begin

    Result      := True;
    m_bRecGet   := True;            // <156> データ表示中

    sSumKbn	    := 0;               // <136> Add

//    m_CloseFlg  := False;           // <143> Add

    fnInzFormf1;
    fnInzFormf2;    // <157> Add

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= False;
		Exit;
	end;
    if uvDispFlg = 0 then
    begin
        HedPanel.Enabled := False;
        tbsKihon.Enabled := True;
// <176> DEL-STR
{// <157> 2007/08/22 H.Kawato Add Start
        // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
        if (m_iVerData > 5) then
            tbsPay.Enabled   := True
        else
            tbsPay.Enabled   := False;
// <157> 2007/08/22 H.Kawato Add End}
// <176> DEL-END
        f1NAME.Enabled   := False;
    end
    else
    begin
        HedPanel.Enabled := True;
        tbsKihon.Enabled := False;
        tbsPay.Enabled   := False;  // <157> Add
// <AUT> MOD-STR
//      if m_cJNTArea.IsModify = True then
        if m_JNTAuthority.IsModify = True then
// <AUT> MOD-END
            MjsMessageBoxEX(Self,'決算確定済みの為参照のみです。','確認', mjInformation, mjOK,mjDefOk,False);
                                            // <128>Createに移動
//    	GridNayose.Options	:=	GridNayose.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
    end;

	B_Print.Enabled := m_JNTAuthority.IsPrint; 	        // 印刷権限 <AUT> ADD

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    with (dqMasterData) do
	begin
        Close();
  		SQL.Clear();
// <157> 2007/08/22 H.Kawato Mod Start
{
        SQL.Add('SELECT                                 '
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
            +   '   ,mt.PayRootKbn      m_PayRootKbn    '   // 債権名寄せ区分 (mtokui)
            +   '   ,py.PostNo1         py_PostNo1      '   // 郵便番号(基番) (mtokui_Pay)
            +   '   ,py.PostNo2         py_PostNo2      '   // 郵便番号(枝番) (mtokui_Pay)
            +   '   ,py.Ads1            py_Ads1         '   // 住所上段       (mtokui_Pay)
            +   '   ,py.Ads2            py_Ads2         '   // 住所下段       (mtokui_Pay)
            +   '   ,py.Tel1            py_Tel1         '   // 電話番号1      (mtokui_Pay)
            +   '   ,py.SectionName     py_SectionName  '   // 送付先部署名   (mtokui_Pay)
            +   '   ,py.TanNm           py_TanNm        '   // 担当者名       (mtokui_Pay)
            +   '   ,py.KeisyoKbn       py_KeisyoKbn    '   // 担当者敬称     (mtokui_Pay)
            +   '   ,py.MailAddress     py_MailAddress  '   // メールアドレス (MTOKUI_Pay)
            +   '   ,py.CngNCode        py_CngNCode     '   // 親代替仕入先   (MTOKUI_Pay)
            +   '   ,py.RendoNCode      py_RendoNCode   '   // 連動得意先　   (MTOKUI_Pay)  // <143> Add
            +   '   ,py.UketoriName     py_UketoriName  '   // 受取人名称     (MTOKUI_Pay)  // <145> Add
            +   '   ,py.LetterKbn       py_LetterKbn    '   // 支払通知書区分 (MTOKUI_Pay)  // <145> Add
            +   '   ,se.USDenPfm        se_USDenPfm     '   // 納品書ﾌｫｰﾑ   　(mtokui_sel)
            +   '   ,se.USGKei          se_USGKei       '   // 売上合計欄印字 (mtokui_sel)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 支払通知書ﾌｫｰﾑ (mtokui_sel)<104>
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 鏡欄税印字   　(mtokui_sel)<104>
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード (mtokui_sel)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分       (mtokui_sel)  // <136> Add
            +   'FROM MTOKUI mt                         '
            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI_PAY py ON       '
            +   '   (py.BaseNCode = mt.NCode)               '
            +   'WHERE (mt.RDelKbn = 0)                 '
            +   '  AND (mt.NCode   = :nNCode)           '
            +   '  AND (se.RecKBN  = 2)           ');
}
        SQL.Add('SELECT                                 '
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
            +   '   ,mt.PayRootKbn      m_PayRootKbn    '   // 債務名寄せ区分 (mtokui)
            +   '   ,py.PostNo1         py_PostNo1      '   // 郵便番号(基番) (mtokui_Pay)
            +   '   ,py.PostNo2         py_PostNo2      '   // 郵便番号(枝番) (mtokui_Pay)
            +   '   ,py.Ads1            py_Ads1         '   // 住所上段       (mtokui_Pay)
            +   '   ,py.Ads2            py_Ads2         '   // 住所下段       (mtokui_Pay)
            +   '   ,py.Tel1            py_Tel1         '   // 電話番号1      (mtokui_Pay)
            +   '   ,py.SectionName     py_SectionName  '   // 送付先部署名   (mtokui_Pay)
            +   '   ,py.TanNm           py_TanNm        '   // 担当者名       (mtokui_Pay)
            +   '   ,py.KeisyoKbn       py_KeisyoKbn    '   // 担当者敬称     (mtokui_Pay)
            +   '   ,py.MailAddress     py_MailAddress  '   // メールアドレス (MTOKUI_Pay)
            +   '   ,py.CngNCode        py_CngNCode     '   // 親代替仕入先   (MTOKUI_Pay)
            +   '   ,py.RendoNCode      py_RendoNCode   '   // 連動得意先　   (MTOKUI_Pay)  // <143> Add
            +   '   ,py.UketoriName     py_UketoriName  '   // 受取人名称     (MTOKUI_Pay)  // <145> Add
            +   '   ,py.LetterKbn       py_LetterKbn    '); // 支払通知書区分 (MTOKUI_Pay)  // <145> Add

// <176> DEL-STR
//      // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//      if (m_iVerData > 5) then
//      begin
// <176> DEL-END
            SQL.Add('   ,py.GensenUseKbn    py_GensenKbn  '   // 預かり源泉税採用区分 (MTOKUI_Pay)
                +   '   ,py.PersonKbn       py_PersonKbn  '   // 個人／法人区分 (MTOKUI_Pay)
                +   '   ,py.SateiKbn        py_SateiKbn   '); // 査定区分       (MTOKUI_Pay)
// <176> DEL    end;
// <176> ADD-STR
        SQL.Add('   ,py.PayKbn2         py_PayKbn2      '   // 通知書メール配信区分 (MTOKUI_Pay)
            +   '   ,py.ZipPass         py_ZipPass      '); // パスワード           (MTOKUI_Pay)
// <176> ADD-END

        SQL.Add('   ,se.USDenPfm        se_USDenPfm     '   // 納品書ﾌｫｰﾑ   　(mtokui_sel)
            +   '   ,se.USGKei          se_USGKei       '   // 売上合計欄印字 (mtokui_sel)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 支払通知書ﾌｫｰﾑ (mtokui_sel)<104>
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 鏡欄税印字   　(mtokui_sel)<104>
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード (mtokui_sel)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分       (mtokui_sel)  // <136> Add
            +   'FROM MTOKUI mt                         '
            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI_PAY py ON       '
            +   '   (py.BaseNCode = mt.NCode)           '
            +   'WHERE (mt.RDelKbn = 0)                 '
            +   '  AND (mt.NCode   = :nNCode)           '
            +   '  AND (se.RecKBN  = 2)                 ');
// <157> 2007/08/22 H.Kawato Mod End

        ParamByName('nNCODE').AsFloat   :=  m_TRNCode;

        Open();

        if ( not EOF ) then
        begin
            // 名称
			f1NAME.Text	            := GetFld('m_Nm').AsString;
            sSumKbn     :=  GetFld('m_SumKbn')    .AsInteger;     // 実在/合計区分
            // 債務名寄せ区分
            if ( FieldByName('m_PayRootKbn').AsInteger = 1 ) then
                    cbPayRootKbn.Checked    :=  True
            else    cbPayRootKbn.Checked    :=  False;

// <136> 2006/07/24 H.Kawato Add Start
            if (sSumKbn = 1) then       // <146> Add
            begin
                cbPayRootKbnClick(cbPayRootKbn);

                // 基本情報　：請求区分
                f1SKYKBN.Value          :=  0;
                f1SKYKBNNM.Caption		:=	'';
                if cbPayRootKbn.Checked then
                begin
                    f1SKYKBN.Value      :=  GetFld('se_UsKinKbn').AsInteger;
                    f1SKYKBNChange(f1SKYKBN);
                end;
            end;                        // <146> Add
// <136> 2006/07/24 H.Kawato Add End

            uvDaiKbn := True;
//            bDaiKbn  := cbPayRootKbn.Checked;     // <136> 2006/07/24 H.Kawato Del

            // 基本情報  : 郵便番号
            if	( (FieldByName ('py_PostNo1').IsNull       )   or
                  (FieldByName ('py_PostNo1').AsInteger = 0) ) then
			begin
				f1POSTNO1.Clear ();
				f1POSTNO2.Clear ();
			end
			else
			begin
				f1POSTNO1.Value	:= FieldByName ('py_PostNo1').AsInteger;

                // 基本情報  : 郵便番号
				if	(FieldByName ('py_PostNo2').IsNull) then
					f1POSTNO2.Clear ()
				else
				begin
					if ( FieldByName ('py_PostNo2').AsInteger = 0 ) then
					begin
// <139> 2006/08/31 H.Kawato Mod
//						f1POSTNO2.FormatStr	:= '0000';
//                   		f1POSTNO2.Value		:= 1;
                        f1POSTNO2.InputFlag := False;
// <139> 2006/08/31 H.Kawato Mod
					end;

					f1POSTNO2.Value    := FieldByName ('py_PostNo2').AsInteger;
				end;
			end;

            // 基本情報  : 住所(上段)
			f1ADS1.Text	            := GetFld('py_Ads1').AsString;
            // 基本情報  : 住所(下段)
			f1ADS2.Text	            := GetFld('py_Ads2').AsString;
            // 基本情報  : 電話番号
			f1TEL1.Text	            := GetFld('py_Tel1').AsString;
            // 基本情報  : 送付先部署名称
			f1SectionName.Text	    := GetFld('py_SectionName').AsString;
            // 基本情報  : 担当者名称
			f1TanNm.Text	        := GetFld('py_TanNm').AsString;
            // 基本情報　：担当者敬称
            f1KEISYO.Text           := GetFld('py_KeisyoKbn').AsString;
            // 基本情報  : メールアドレス
			f1MailAd.Text	        := GetFld('py_MailAddress').AsString;
            // 基本情報　：納品書ﾌｫｰﾑ
            f1USDENPFM.Value        :=  GetFld('se_USDenPfm').AsInteger;

            // 基本情報　：納品書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            lvCode := IntToStr(f1USDENPFM.AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'st00', lvCode, lvNm, lvNmk) = True then
                f1USDENPFMNM.Caption := lvNmk;
            Qry.Free;

            // 基本情報　：支払通知書ﾌｫｰﾑ <104>
            f1SSDENPFM.Value        :=  GetFld('se_SSsyoPfm').AsInteger;

            // 基本情報　：支払通知書ﾌｫｰﾑ名 <104>
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            lvCode := IntToStr(f1SSDENPFM.AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'st00', lvCode, lvNm, lvNmk) = True then
                f1SSDENPFMNM.Caption := lvNmk;
            Qry.Free;

            // 基本情報　：売上合計欄印字
            f1USGKEI.Value          :=  GetFld('se_USGKei').AsInteger;
            // 基本情報　：合計欄税印字 <104>
            f1SSGKEI.Value          :=  GetFld('se_SSsyoKgm').AsInteger;

            // 基本情報　：部門コード
            lvCODE := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);      //<122>
            if (m_BMCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then      //<122>
            begin                                                       //<122>
                f1BMCODE.Zero := True;                                  //<122>
                f1BMCODE.InputFlag := False;                            //<122>
            end;                                                        //<122>
            f1BMCODE.text := lvCODE;                                    //<122>

//<122>            f1BMCODE.text           :=  fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
            fnGetNAME(f1BMCODE.Text,41,m_BMCodeAttr,lvNMK );
            f1BMNAME.caption        := lvNMK;

            // <175> Add start
            if(m_FeeBmnFlg = 1) then
            begin
				lvCODE := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
				if (m_BMCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then
				begin
					f1BmnCode.Zero := True;
					f1BmnCode.InputFlag := False;
				end;
				f1BmnCode.text := lvCODE;

				fnGetNAME(f1BmnCode.Text,41,m_BMCodeAttr,lvNMK );
				f1BmnName.caption        := lvNMK;
            end;
            // <175> Add end

            // 基本情報　：担当者コード
            lvCODE := fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);      //<122>
            if (m_TNCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then      //<122>
            begin                                                       //<122>
                f1TNCODE.Zero := True;                                  //<122>
                f1TNCODE.InputFlag := False;                            //<122>
            end;                                                        //<122>
            f1TNCODE.text := lvCODE;                                    //<122>

//<122>            f1TNCODE.text           :=  fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);
            fnGetNAME(f1TNCODE.Text,25,m_TnCodeAttr,lvNMK );
            f1TNNAME.caption        := lvNMK;

            //  親代替仕入先
            nCngNCode               :=  GetFld('py_CngNCode').AsFloat;
            lvCODE := fnGetGCODE(nCngNCode, 22);                                //<122>
            if (m_TRCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then              //<122>
            begin                                                               //<122>
                f1NayoseOyaCode.Zero := True;                                   //<122>
                f1NayoseOyaCode.InputFlag := False;                             //<122>
            end;                                                                //<122>
            f1NayoseOyaCode.text := lvCODE;                                     //<122>

//<122>            f1NayoseOyaCode.Text    :=  fnGetGCODE(nCngNCode, 22);
            fnGetNAME(f1NayoseOyaCode.Text, 22, m_TrCodeAttr, lvNMK);
            f1NayoseNM.Caption      := lvNMK;

// <136> 2006/07/24 H.Kawato Add Start 
            // 「名寄せの親として採用」の使用可/不可チェック                    
            bSkyKbn := True;
            if sSumKbn = 1 then
            begin
	            cbPayRootKbn.Enabled := True;

                // 名寄せデータが存在しているか
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select count(PayNCode) as CNT from PayNayoseInfo '
                        +   'where (MasterKbn = 22 ) '
                        +   '  and (NayoseSyu = 1  ) '
                        +   '  and (NayoseKbn = 1  ) '
                        +   '  and (NayoseOyaNCode = :pOyaCode) ');
                    ParamByName('pOyaCode').AsFloat := m_TRNCode;

                    Open;

		            // 「名寄せの親として採用」の使用可/不可設定
                    if GetFld('CNT').AsInteger > 0 then
			            cbPayRootKbn.Enabled := False;
                end;
                Qry.Close;
                Qry.Free;

                //=====================================================
                //MP_PAY_CHK_DAITAI(代替仕入先の残高・発生ﾁｪｯｸ)
                //=====================================================
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc7);
                with StdProc7 do
                begin
                    ParamByName('@p_PAYNCode').AsFloat := m_TRNCode;
					FetchOptions.Items := FetchOptions.Items - [fiMeta];
                    ExecProc;
                    if ParamByName('@p_Status').AsInteger = -1 then     // 残高または発生
                    begin
			            cbPayRootKbn.Enabled := False;
			            bSkyKbn := False;
                    end;
                end;
//            end;      // <146> Del

                // 「請求区分」の使用可/不可チェック
                if not cbPayRootKbn.Checked then
                	bSkyKbn := False;

                // 「請求区分」の使用可/不可設定
                f1SKYKBN.Enabled      	:= bSkyKbn;//伝票・残高があれば使用不可
                SeikyuKbnLabel.Enabled  := f1SKYKBN.Enabled;
                f1SKYKBNNM.Enabled 		:= f1SKYKBN.Enabled;
                f1SKYKBNChange(f1SKYKBN);

                if f1SKYKBN.Value = 2 then
                	bSkyKbn := False;

                // 名寄せ代替仕入先の使用可/不可設定
                NayoseOyaLabel.Enabled  := bSkyKbn;
                f1NayoseNM.Enabled      := bSkyKbn;
                f1NayoseOyaCode.Enabled := bSkyKbn;
            end;        // <146> Add
// <136> 2006/07/24 H.Kawato Add End

// <136> 2006/07/24 H.Kawato Del Start
{
            // 「名寄せ親代替仕入先」の使用可/不可チェック
            if f1NayoseOyaCode.Text = '' then
            begin
                // 合計取引先の子に支払が発生しているかﾁｪｯｸ <117>
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

                Qry2 := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry2);

                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select PAYNCode from PAYNayoseInfo '
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
                            SQL.Add('select TRNCD from MSIIRE_S where ' +
                                    '(TRNCD        = :pTRNCD) and ' +
                                    '(ENDDYMD     >= :pSDYMD) and ' +
                                    '((USnGenGku  <> 0) or ' +
                                    ' (USnFriGku  <> 0) or ' +
                                    ' (USnTsryGku <> 0) or ' +
                                    ' (USnTegaGku <> 0) or ' +
                                    ' (USnSosaGku <> 0) or ' +
                                    ' (USnNebiGku <> 0) or ' +
                                    ' (USnEtcGku  <> 0))   ');
                            ParamByName('pTRNCD').AsFloat    := Qry.FieldByName('PAYNCode').Asfloat;
                            ParamByName('pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;

                            Open;

                            if (not EOF) then
                            begin
                                bDaiKbn  := False;
                                uvDaiKbn := False;
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
                // 親代替取引先に支払が発生しているかﾁｪｯｸ <116>
                Qry := TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select TRNCD from MSIIRE_S where ' +
                            '(TRNCD        = :pTRNCD) and ' +
                            '(ENDDYMD     >= :pSDYMD) and ' +
                            '((USnGenGku  <> 0) or ' +
                            ' (USnFriGku  <> 0) or ' +
                            ' (USnTsryGku <> 0) or ' +
                            ' (USnTegaGku <> 0) or ' +
                            ' (USnSosaGku <> 0) or ' +
                            ' (USnNebiGku <> 0) or ' +
                            ' (USnEtcGku  <> 0))   ');
                    ParamByName('pTRNCD').AsFloat    := nCngNCode;
                    ParamByName('pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;

                    Open;

                    if (not EOF) then
                    begin
                        bDaiKbn  := False;
                        uvDaiKbn := False;
                    end;

                    Close;
                    Free;
                end;
            end;

            // 名寄せ代替仕入先の使用可/不可設定
            NayoseOyaLabel.Enabled  := bDaiKbn;
            f1NayoseNM.Enabled      := bDaiKbn;
            f1NayoseOyaCode.Enabled := bDaiKbn;
}
// <136> 2006/07/24 H.Kawato Del End

            // 代替仕入先の保存
            uvDaiGaeCode := f1NayoseOyaCode.Text;

// <143> 2006/09/26 H.Kawato Add Start
            //  連動得意先
            nRenNCode               :=  GetFld('py_RendoNCode').AsFloat;
            lvCODE := fnGetGCODE(nRenNCode, 23);
            if (m_TRCodeAttr <> 2) and (lvCODE = ucZeroCODE ) then
            begin
                f1RendouCode.Zero := True;
                f1RendouCode.InputFlag := False;
            end;
            f1RendouCode.text := lvCODE;

            fnGetNAME(f1RendouCode.Text, 23, m_TrCodeAttr, lvNMK);
            f1RendouNM.Caption      := lvNMK;
// <143> 2006/09/26 H.Kawato Add End

            // ﾘｽﾄ名称の表示
            sTmp                    := '';
            sTmp                    := fnGetUsgKeiNm(f1USGKEI.Text);
            f1USGKEINM.Caption      := sTmp;
            sTmp                    := fnGetUsgKeiNm(f1SSGKEI.Text); // <104>
            f1SSGKEINM.Caption      := sTmp;                         // <104>

// <136> 2006/07/24 H.Kawato Add Start
            sTmp    :=  '';
            sTmp    :=fnGetSkyKbnNm(f1SKYKBN.Text);
            f1SKYKBNNM.Caption      :=  sTmp;
// <136> 2006/07/24 H.Kawato Add End

// <143> 2006/09/26 H.Kawato Add Start
//            m_bMankiChkFlg := fnRendoMankiChk(m_TRNCode);   // 期日指定振込満期ﾃﾞｰﾀﾁｪｯｸ   // <149> Del
            m_bRenAdoptFlg := fnRendoAdoptChk(m_TRNCode);   // 期日指定振込満期ﾃﾞｰﾀﾁｪｯｸ 

            //「連動取引先」の使用可/不可チェック
// <155> 2007/07/10 H.Kawato Mod
//            if HedCsTab.items.selected = 0 then
            if sSumKbn = 0 then
            begin
// <149> 2007/04/29 H.Kawato Mod
//                if ( m_bMankiChkFlg ) and                   // 期日指定振込満期ﾃﾞｰﾀなし
                if ( m_bRenAdoptFlg ) and                   // 連動得意先採用済ﾁｪｯｸ
                   ( m_bSKNLicense  ) then                  // 債権ﾗｲｾﾝｽﾁｪｯｸ
                begin
                    LblRendouCode.Enabled := True;
                    f1RendouCode.Enabled  := True;
                    f1RendouNM.Enabled    := True;
                end
                else
                begin
                    LblRendouCode.Enabled := False;
                    f1RendouCode.Enabled  := False;
                    f1RendouNM.Enabled    := False;
                end;
            end
// <155> 2007/07/10 H.Kawato Mod
//            else if HedCsTab.items.selected = 1 then
            else if sSumKbn = 1 then
            begin
                if ( cbPayRootKbn.Checked ) and             // 名寄せ親の採用あり
                   ( f1SKYKBN.Value = 1 )   and             // 親一括請求一括支払
                   ( nCngNCode <> 0 ) and                   // 名寄せ親代替仕入先の登録あり
//                   ( m_bMankiChkFlg ) and                   // 期日指定振込満期ﾃﾞｰﾀなし   // <149> Del
                   ( m_bRenAdoptFlg ) and                   // 連動得意先採用済ﾁｪｯｸ
                   ( m_bSKNLicense  ) then                  // 債権ﾗｲｾﾝｽﾁｪｯｸ
                begin
                    LblRendouCode.Enabled := True;
                    f1RendouCode.Enabled  := True;
                    f1RendouNM.Enabled    := True;
                end
                else
                begin
                    LblRendouCode.Enabled := False;
                    f1RendouCode.Enabled  := False;
                    f1RendouNM.Enabled    := False;
                end;
            end;
// <143> 2006/09/26 H.Kawato Add End

// <145> 2006/11/16 H.Kawato Add Start
            // 受取人名称
			f1ReceiverName.Text     := GetFld('py_UketoriName').AsString;
            // 支払通知書区分
            f1LetterKbn.Zero        := True;
            f1LetterKbn.Value       := GetFld('py_LetterKbn').AsInteger;
            // 支払通知書区分名
            f1LetterKbnNM.Caption   := _LetterKbnItems[Trunc(f1LetterKbn.Value)].sName;
// <145> 2006/11/16 H.Kawato Add End

// <157> 2007/08/22 H.Kawato Add Start
// <176> DEL-STR
//          // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//          if (m_iVerData > 5) then
//          begin
// <176> DEL-END
                // 支払調書・預かり源泉税採用区分
                f2GensenKbn.Zero        := True;
                f2GensenKbn.Value       := GetFld('py_GensenKbn').AsInteger;
                m_iGensenKbn            := GetFld('py_GensenKbn').AsInteger;
                // 支払調書・預かり源泉税採用区分名
                f2GensenKbnNM.Caption   := _GensenKbnItems[Trunc(f2GensenKbn.Value)].sName;
                // 個人／法人区分
                f2PersonKbn.Zero        := True;
                f2PersonKbn.Value       := GetFld('py_PersonKbn').AsInteger;
                // 個人／法人区分名
                f2PersonKbnNM.Caption   := _PersonKbnItems[Trunc(f2PersonKbn.Value)].sName;
                // 査定方法
                m_iSateiKbn             := GetFld('py_SateiKbn').AsInteger;

// <#MYN> DEL-STR
//              if  (m_iPayGensenKbn = 1) and           // 採用あり
//                  (f2GensenKbn.Value = 1) then
//              begin
//                  lblPersonKbn.Enabled    := True;
//                  f2PersonKbn.Enabled     := True;
//                  f2PersonKbnNM.Enabled   := True;
//              end
//              else if (f2GensenKbn.Value = 0) then    // 採用なし
//              begin
//                  lblPersonKbn.Enabled    := False;
//                  f2PersonKbn.Enabled     := False;
//                  f2PersonKbnNM.Enabled   := False;
//              end;
// <#MYN> DEL-END
// <165> ADD-STR
                if (m_iPayGensenKbn = 1) then
                begin
                    // 預かり源泉税採用あり
                    if fnCheckIsSpot(f0CODE.Text) then
                    begin
                        // スポット支払支払先は源泉関連項目変更不可
                        lblGensenKbn.Enabled    := False;
                        f2GensenKbn.Enabled     := False;
                        f2GensenKbnNM.Enabled   := False;
// <#MYN> DEL-STR
//                      lblPersonKbn.Enabled    := False;
//                      f2PersonKbn.Enabled     := False;
//                      f2PersonKbnNM.Enabled   := False;
// <#MYN> DEL-END
                    end;
                end;
// <165> ADD-END
// <176> DEL    end;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
        // 支払通知書メール配信採用区分
        f2MailKbn.Zero        := True;
        f2MailKbn.Value       := GetFld('py_PayKbn2').AsInteger;
        f2MailKbnNM.Caption   := _MailKbnItems[Trunc(f2MailKbn.Value)].sName;

        // パスワード
        f2Password.Text       := GetFld('py_ZipPass').AsString;
        if  (f2MailKbn.Value = 1) then
        begin
            lblPassword.Enabled    := True;
            f2Password.Enabled     := True;
        end
        else
        begin
            lblPassword.Enabled    := False;
            f2Password.Enabled     := False;
        end;
// <176> ADD-END

            // ﾃﾝﾌﾟﾚｰﾄの時
            if GetFld('m_TemplateKbn').asInteger = 1 then
            begin
                AddPanel.Enabled := False;
                HedCsTab.Items.Selected := 0;
                sSumKbn := 0;
// <167> ADD-STR
                f1ReceiverName.Text := '';
                PnlReceiverName.Enabled := False;
                f1RendouCode.Text := '';
                f1RendouNM.Caption := '';
                PnlRendouInfo.Enabled := False;
// <167> ADD-END
            end
            else
            begin
                AddPanel.Enabled := True;
// <167> ADD-STR
                PnlReceiverName.Enabled := True;
                PnlRendouInfo.Enabled := True;
// <167> ADD-END
            end;
        end;

        Close();

    end;

    dqMasterData.Free();


    case sSumKbn of
        0:  begin
                HedCsTab.Items.Selected     := 0;
// <156> 2007/08/16 H.Kawato Add Start
                // 決算確定後でない場合
                if uvDispFlg <> 1 then
                begin
// <156> 2007/08/16 H.Kawato Add End
                    HedCsTab.Items[0].Enabled   :=  True;
                    HedCsTab.Items[1].Enabled	:=  False;
// <139> 2006/08/31 H.Kawato Mod Start
{
                    if uvTempFlg then
                        HedCsTab.Items[2].Enabled	:=  False
                    else
                        HedCsTab.Items[2].Enabled	:=  True;
}
                    HedCsTab.Items[2].Enabled	:=  False;
                    HedCsTab.Items[3].Enabled	:=  False;  // <159> Add
// <139> 2006/08/31 H.Kawato Mod End
                end;    // <156> Add

// 2006/07/20 H.Kawato Mod Start <135>
{
                if CheckModuleLicense(m_pRec,FXLicense.SEL_HAN)  then //販売ﾗｲｾﾝｽﾁｪｯｸ
                    PnlSelInfo.Visible      :=  False
                else
                    PnlSelInfo.Visible      :=  True;
}
                PnlSelInfo.Visible      :=  False;
// 2006/07/20 H.Kawato Mod End   <135>
                // 名寄せ情報パネル
                PnlNayoseInfo.Visible   :=  False;
// <176> DEL-STR
{// <157> 2007/08/22 H.Kawato Add Start
                // 実在タブでは、支払情報パネルを表示する
                // ただし、ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
                if (m_iVerData < 6) then
                    DtlCsTab.Items[1].Visible := False
                else
                    DtlCsTab.Items[1].Visible := True;
// <157> 2007/08/22 H.Kawato Add End}
// <176> DEL-END
            end;
        1:  begin
                HedCsTab.Items.Selected     := 1;
// <156> 2007/08/16 H.Kawato Add Start
                // 決算確定後でない場合
                if uvDispFlg <> 1 then
                begin
// <156> 2007/08/16 H.Kawato Add End
                    HedCsTab.Items[0].Enabled	:=  False;
                    HedCsTab.Items[1].Enabled	:=  True;
// <136> 2006/07/24 H.Kawato Mod
//                  HedCsTab.Items[2].Enabled	:=  True;
                    HedCsTab.Items[2].Enabled	:=  False;
                    HedCsTab.Items[3].Enabled	:=  False;  // <159> Add
                end;    // <156> Add

                PnlSelInfo.Visible      :=  False;
                // 名寄せ情報パネル
                PnlNayoseInfo.Visible   :=  True;
// <176> DEL-STR
//              // 合計タブでは、支払情報パネルを非表示とする
//              DtlCsTab.Items[1].Visible := False;   // <157> Add
// <176> DEL-END
            end;
    end;

    m_BtUpdFlg := True;
    m_RecGetSw := True;

    //ボタンの状態を制御する
    fnBtnEnbChg;

    if uvDispFlg = 1 then
    begin
        MBitBtnUpd.Enabled := False;        // <128>
//        MBitBtnCancel.Enabled := True;
        MBitBtnCancel.Enabled := False;     // <156> Mod
    end;

    // データ表示状態を解除する
    m_bRecGet   := False;                   // <156> Add

    //編集状態を解除する
    m_EdtSw := False;

    //連動取引先変更ﾌﾗｸﾞを初期化
    m_bRendouFlag   := False;               // <143> Add

end;

//-----------------------------------------------------------------------------
// fnDtlCsTabNextSetFcous()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : ﾀﾌﾞの移動処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnDtlCsTabNextSetFcous();
begin

    // 入力中でなけば無視
    if (( MBitBtnUpd.Enabled <> True ) and ( m_BtUpdFlg )) then
        Exit;

	//「基本情報」ﾊﾟﾈﾙ
    MjsSetFocus(Self,'f1POSTNO1');

end;

//-----------------------------------------------------------------------------
// fnBtnNextFocus()
//      PARAM   :
//      VAR     :
//      RETURN  : Boolean
//      MEMO    : 次の強制ﾌｫｰｶｽ位置
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnBtnNextFocus(): Boolean;
var
    lvCompName  :   String;
begin

    Result := True;

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

    if (( PnlSelInfo.Visible  = True  ) and ( lvCompName = 'f1USGKEI' )) or
       (( PnlSelInfo.Visible  = False ) and ( lvCompName = 'f1YSGKIN' )) 
        then
    begin
        if ( MBitBtnUpd.Enabled ) then
    		MjsSetFocus(Self,ucBtnOK)
        else
            MjsSetFocus(Self,ucBtnNG);
   	    Result := False;
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
procedure TJNTCRP004005F.fnEndKeyBtnFcous();
begin

	// 更新ﾎﾞﾀﾝが有効だったら更新ﾎﾞﾀﾝへ
	if ( MBitBtnUpd.Enabled = True ) then
    begin
   	    MjsSetFocus(Self, ucBtnOK);
        Exit;
    end;

	// 取消ﾎﾞﾀﾝが有効だったら取消ﾎﾞﾀﾝへ
	if ( MBitBtnCancel.Enabled = True ) then
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
procedure   TJNTCRP004005F.fnEnter(Sender: TObject);
var
	lvCompName  :   String;
begin

    // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙを保存する
    m_ACControl :=  Screen.ActiveControl;
	lvCompName  :=  m_ACControl.Name;

    if ( lvCompName = 'f0CODE' ) then
	begin
        HedCsTab.Items[0].Enabled	:= True;
        HedCsTab.Items[1].Enabled	:= True;
        HedCsTab.Items[2].Enabled	:= True;
        HedCsTab.Items[3].Enabled	:= True;    // <159> Add
        //ファンクションボタンの表示・非表示<100>
        fnSetFncType(1);
        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
        fnSetFncEnabled();  // <148> Add
    end;

end;

//-----------------------------------------------------------------------------
// fnCheckDtlEditClosingDay()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 共通 OnChange ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.fnFldOnChg(Sender: TObject);
//var
//    nCngNCode   : Extended;                 // <143> Add  // <154> Del
begin

    // 編集ｽｲｯﾁを設定する
    if ( m_EdtSw = False ) then m_EdtSw := True;

    if ( m_pRec^.m_pChildForm = nil ) then Exit;

// <143> 2006/09/26 H.Kawato Add Start
// <154> 2007/07/09 H.Kawato Del Start
{
    nCngNCode   := 0;

    if ( Sender = f1NayoseOyaCode ) then
    begin
        // 名寄せ親代替取引先ﾁｪｯｸ
        if ( Trim(f1NayoseOyaCode.text) <> '' ) then
            nCngNCode := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);

        if ( cbPayRootKbn.Checked ) and     // 名寄せ親の採用あり
           ( f1SKYKBN.Value = 1 )   and     // 親一括請求一括支払
           ( nCngNCode <> 0 ) and           // 名寄せ親代替仕入先の登録あり
//           ( m_bMankiChkFlg ) and           // 期日指定振込満期データなし // <149> Del
           ( m_bRenAdoptFlg ) and           // 連動得意先採用ﾁｪｯｸ
           ( m_bSKNLicense  ) then          // 債権ﾗｲｾﾝｽﾁｪｯｸ
        begin
            LblRendouCode.Enabled := True;
            f1RendouCode.Enabled  := True;
            f1RendouNM.Enabled    := True;
        end
        else
        begin
            if ( m_TRCodeAttr <> 2 ) then
            begin
                if ( f1RendouCode.InputFlag = FALSE ) then
                        f1RendouCode.Zero    :=  TRUE
                else    f1RendouCode.Zero    :=  FALSE;
            end
            else
                f1RendouCode.Zero := FALSE;

            f1RendouCode.InputFlag	:= True;
            f1RendouCode.Text		:= '';
            f1RendouNM.Caption      := '';

            LblRendouCode.Enabled := False;
            f1RendouCode.Enabled  := False;
            f1RendouNM.Enabled    := False;
        end;
    end;
}
// <154> 2007/07/09 H.Kawato Del End

    if ( Sender = f1RendouCode ) then
        m_bRendouFlag := True;
// <143> 2006/09/26 H.Kawato Add End
end;

//-----------------------------------------------------------------------------
// DtlCs1EditZipCodeUpperExit()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 郵便番号の初期化
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.f1POSTNO1Exit(Sender: TObject);
begin
// <136> 2006/07/24 H.Kawato Del Start
{
    if ( f1POSTNo1.AsInteger = 0 ) then
	begin
		f1POSTNO2.Value	:= 0;
		f1POSTNO2.Clear;
		f1ADS1.Text		:= '';
     	f1ADS2.Text		:= '';
	end;
}
// <136> 2006/07/24 H.Kawato Del End
end;

//-----------------------------------------------------------------------------
// fnZipOnArrowClick() <106>
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 郵便番号検索ﾀﾞｲｱﾛｸﾞの表示
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.fnZipOnArrowClick(Sender: TObject);
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

// <139> 2006/08/31 H.Kawato Add
        if (f1POSTNO2.Value = 0) then
            f1POSTNO2.InputFlag     := False;
// <139> 2006/08/31 H.Kawato Add

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
procedure   TJNTCRP004005F.f1Exit(Sender: TObject);
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
// <136> 2006/07/24 H.Kawato Mod Start
//       (f1POSTNO1.Value <> 0) and
//       (f1POSTNO2.Value <> 0) then
       ((f1POSTNO1.Value <> 0) or
        (f1POSTNO2.Value <> 0)) and
       ((f1POSTNO1.Text <> '') and
        (f1POSTNO2.Text <> '')) then
// <136> 2006/07/24 H.Kawato Mod End
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
procedure   TJNTCRP004005F.fnDtlCs1EditZipCodeOnKeyDown(Sender: TObject;
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
procedure	TJNTCRP004005F.fnOutputDBErrorMessage ();
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
// f1ItemsCheak()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 文字列ﾘｽﾄ入力欄の名称ﾁｪｯｸ処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.f1ItemsCheak(Sender: TObject);
var
    sTmp	    : String;
    nCngNCode   : Extended;                 // <154> Add
begin

	if ( m_bFirstFlag = False ) then Exit;

//	if ( m_CloseFlg = True ) then Exit;     // <143> Add

    sTmp := '';

    // 売上合計欄印字
    if ( Sender = f1USGKEI ) then
    begin
        f1USGKEINM.Caption := '';
        if ( f1USGKEI.Text = '' ) then
        	f1USGKEI.Value := uvTmpUSGKEI;

        sTmp := fnGetUsgKeiNm(f1USGKEI.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1USGKEI';
            Beep;
//<123>            Abort;
            Exit;
        end;
        f1USGKEINM.Caption := sTmp;
        Exit;
    end;

    // 鏡欄税印字
    if ( Sender = f1SSGKEI ) then
    begin
        f1SSGKEINM.Caption := '';
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
        f1SSGKEINM.Caption := sTmp;
        Exit;
    end;

// <136> 2006/07/24 H.Kawato Add Start
    // 請求区分
    if ( Sender = f1SKYKBN ) then
    begin
        f1SKYKBNNM.caption := '';

        sTmp := fnGetSkyKbnNm(f1SKYKBN.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1SKYKBN';
            Beep;
            Exit;
        end;
        f1SKYKBNNM.caption := sTmp;
        Exit;
    end
    else if ( Sender = f1NayoseOyaCode ) then
    begin
// <154> 2007/07/09 H.Kawato Add Start
        nCngNCode   := 0;

        // 名寄せ親代替取引先ﾁｪｯｸ
        if ( Trim(f1NayoseOyaCode.text) <> '' ) then
            nCngNCode := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);

        if ( cbPayRootKbn.Checked ) and     // 名寄せ親の採用あり
           ( f1SKYKBN.Value = 1 )   and     // 親一括請求一括支払
           ( nCngNCode <> 0 ) and           // 名寄せ親代替仕入先の登録あり
           ( m_bRenAdoptFlg ) and           // 連動得意先採用ﾁｪｯｸ
           ( m_bSKNLicense  ) then          // 債権ﾗｲｾﾝｽﾁｪｯｸ
        begin
            LblRendouCode.Enabled := True;
            f1RendouCode.Enabled  := True;
            f1RendouNM.Enabled    := True;
        end
        else
        begin
            if ( m_TRCodeAttr <> 2 ) then
            begin
                if ( f1RendouCode.InputFlag = FALSE ) then
                        f1RendouCode.Zero    :=  TRUE
                else    f1RendouCode.Zero    :=  FALSE;
            end
            else
                f1RendouCode.Zero := FALSE;

            f1RendouCode.InputFlag	:= True;
            f1RendouCode.Text		:= '';
            f1RendouNM.Caption      := '';

            LblRendouCode.Enabled := False;
            f1RendouCode.Enabled  := False;
            f1RendouNM.Enabled    := False;
        end;
// <154> 2007/07/09 H.Kawato Add End
        f1NayoseNM.caption := '';

        if ( fnGetNAME(f1NayoseOyaCode.Text, 22, m_TrCodeAttr, sTmp) = FALSE ) then
        begin
            m_ErrObjNm := 'f1NayoseOyaCode';
            Beep;
            Exit;
        end;
        f1NayoseNM.caption := sTmp;
        Exit;
    end;
// <136> 2006/07/24 H.Kawato Add End

// <145> 2006/11/16 H.Kawato Add Start
    // 支払通知書区分
    if ( Sender = f1LetterKbn ) then
    begin
        f1LetterKbnNM.caption := '';

        sTmp := fnGetLetterKbnNm(f1LetterKbn.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f1LetterKbn';
            Beep;
            Exit;
        end;
        f1LetterKbnNM.caption := sTmp;
        Exit;
    end;
// <145> 2006/11/16 H.Kawato Add End

// <143> 2006/09/26 H.Kawato Add Start
    // 連動取引先
    if ( Sender = f1RendouCode ) then
    begin
        f1RendouNM.Caption := '';

        if ( fnGetNAME(f1RendouCode.Text, 23, m_TrCodeAttr, sTmp) = FALSE ) then
        begin
            m_ErrObjNm := 'f1RendouCode';
            Beep;
            Exit;
        end;
        f1RendouNM.Caption := sTmp;
        Exit;
    end;
// <143> 2006/09/26 H.Kawato Add End

// <169> 2010/07/08 G.Kojima Add
// 名寄せ親支払先
    if ( sender = f2OyaCode ) then
    begin
        // <170> Add start
        if ((Screen.ActiveControl.Name = f2OyaCode.Name) or
            (Screen.ActiveControl.Name = f2KoCode.Name) or
            (Screen.ActiveControl.Name = GridNayose.Name)) = False then
        begin
            Exit;
        end;
        // <170> Add end
        if ( fnGetNAME(f2OyaCode.Text, 221, m_TrCodeAttr, sTmp) = FALSE ) then
        begin
            f2OyaName.Caption := '';
            uvSelSys.MsgDlg(1010,50);       // <169-1>
            Beep;
            f2OyaCode.SetFocus;             // <169-1>
            Exit;
        end;
        f2OyaName.Caption := sTmp;
        Exit;
    end;
// 子支払先
    if ( sender = f2KoCode ) then
    begin
        // <170> Add start
        if ((Screen.ActiveControl.Name = f2OyaCode.Name) or
            (Screen.ActiveControl.Name = f2KoCode.Name) or
            (Screen.ActiveControl.Name = GridNayose.Name)) = False then
        begin
            Exit;
        end;
        // <170> Add end
        if ( fnGetNAME(f2KoCode.Text, 22, m_TrCodeAttr, sTmp) = FALSE ) then
        begin
            f2KoName.Caption := '';
            uvSelSys.MsgDlg(1010,50);       // <169-1>
            Beep;
            f2KoCode.SetFocus;              // <169-1>
            Exit;
        end;
        f2KoName.Caption := sTmp;
        Exit;
    end;
// <169> End

// <175> Add Start
    // 部門
    if ( Sender = f1BmnCode ) then
    begin
        f1BmnName.Caption := '';

        if ( fnGetNAME(f1BmnCode.Text, 41, m_BMCodeAttr, sTmp) = FALSE ) then
        begin
            m_ErrObjNm := 'f1BmnCode';
            Beep;
            Exit;
        end;
        f1BmnName.Caption := sTmp;
        Exit;
    end;
// <143> 2006/09/26 H.Kawato Add End
// <175> Add end

end;

// <157> 2007/08/22 H.Kawato Add Start
//-----------------------------------------------------------------------------
// f2ItemsCheak()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 文字列ﾘｽﾄ入力欄の名称ﾁｪｯｸ処理
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.f2ItemsCheak(Sender: TObject);
var
    sTmp	    : String;
begin

	if ( m_bFirstFlag = False ) then Exit;

    sTmp := '';

    // 支払調書・預かり源泉採用区分
    if ( Sender = f2GensenKbn ) then
    begin
        f2GensenKbnNM.Caption := '';

        sTmp := fnGetGensenKbnNm(f2GensenKbn.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f2GensenKbn';
            Beep;
            Exit;
        end;
        f2GensenKbnNM.Caption := sTmp;

// <#MYN> DEL-STR
//      // 個人／法人区分の入力可不可切替
//      if  (m_iPayGensenKbn = 1) and           // 採用あり
//          (f2GensenKbn.Value = 1) then
//      begin
//          lblPersonKbn.Enabled    := True;
//          f2PersonKbn.Enabled     := True;
//          f2PersonKbnNM.Enabled   := True;
//      end
//      else if (f2GensenKbn.Value = 0) then    // 採用なし
//      begin
//          lblPersonKbn.Enabled    := False;
//          f2PersonKbn.Enabled     := False;
//          f2PersonKbnNM.Enabled   := False;
//      end;
// <#MYN> DEL-END

        Exit;
    end;

    // 個人／法人区分
    if ( Sender = f2PersonKbn ) then
    begin
        f2PersonKbnNM.Caption := '';

        sTmp := fnGetPersonKbnNm(f2PersonKbn.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f2PersonKbn';
            Beep;
            Exit;
        end;
        f2PersonKbnNM.Caption := sTmp;
        Exit;
    end;

// <176> ADD-STR
    // 支払通知書メール配信採用区分
    if ( Sender = f2MailKbn ) then
    begin
        f2MailKbnNM.Caption := '';

        sTmp := fnGetMailKbnNm(f2MailKbn.Text);
        if  ( sTmp = '' ) then
        begin
            m_ErrObjNm := 'f2MailKbn';
            Beep;
            Exit;
        end;
        f2MailKbnNM.Caption := sTmp;

        // 個人／法人区分の入力可不可切替
        if  (f2MailKbn.Value = 1) then
        begin
            lblPassword.Enabled    := True;
            f2Password.Enabled     := True;
        end
        else
        begin
            lblPassword.Enabled    := False;
            f2Password.Enabled     := False;
        end;

        Exit;
    end;
// <176> ADD-END
end;
// <157> 2007/08/22 H.Kawato Add End

//-----------------------------------------------------------------------------
// fnGetKeisyoNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 敬称の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetKeisyoNm(sCd: String): String;
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
function    TJNTCRP004005F.fnGetUsgKeiNm(sCd: String): String;
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
function        TJNTCRP004005F.fnGetKaiJyNm(sCd: String): String;
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
// fnGetTsryoFtnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 手数料負担の名称を取得
//-----------------------------------------------------------------------------
Function    TJNTCRP004005F.fnGetTsryoFtnNm(sCd : String): String;
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
function    TJNTCRP004005F.fnGetEDISiyoNm (sCd: String) : String;
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

// <136> 2006/07/24 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnGetSkyKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 請求区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetSkyKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_SeikyuKbnItems) to High(_SeikyuKbnItems) do
    begin
    	if ( _SeikyuKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _SeikyuKbnItems[i].sName;
            Exit;
        end;
    end;

end;
// <136> 2006/07/24 H.Kawato Add End

// <145> 2006/11/16 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnGetLetterKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 請求区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetLetterKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_LetterKbnItems) to High(_LetterKbnItems) do
    begin
    	if ( _LetterKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _LetterKbnItems[i].sName;
            Exit;
        end;
    end;

end;
// <145> 2006/11/16 H.Kawato Add End

// <157> 2007/08/22 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnGetGensenKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 請求区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetGensenKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_GensenKbnItems) to High(_GensenKbnItems) do
    begin
    	if ( _GensenKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _GensenKbnItems[i].sName;
            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
// fnGetPersonKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 請求区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetPersonKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_PersonKbnItems) to High(_PersonKbnItems) do
    begin
    	if ( _PersonKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _PersonKbnItems[i].sName;
            Exit;
        end;
    end;

end;
// <157> 2007/08/22 H.Kawato Add End

// <176> ADD-STR
//-----------------------------------------------------------------------------
// fnGetMailKbnNm()
//      PARAM   : sCd: ｺｰﾄﾞ
//      VAR     :
//      RETURN  : String : ｺｰﾄﾞに対する名称
//      MEMO    : 通知書メール配信採用区分の名称を取得
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnGetMailKbnNm (sCd: String) : String;
var
	i : integer;
begin

	Result := '';

	if ( Trim(sCd) = '' ) then Exit;

	for i := Low(_MailKbnItems) to High(_MailKbnItems) do
    begin
    	if ( _MailKbnItems[i].iCode = StrToInt(sCd) ) then
        begin
        	Result := _MailKbnItems[i].sName;
            Exit;
        end;
    end;

end;
// <176> ADD-END

//-----------------------------------------------------------------------------
// TMNum_KnjkmkEnter()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : EDI情報 OnEnter ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure   TJNTCRP004005F.TMNum_KnjkmkEnter(Sender: TObject);
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
procedure TJNTCRP004005F.TMNum_KnjkmkChange(Sender: TObject);
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
function	TJNTCRP004005F.fnOutputConfirmationMessage (nDivision: Integer): Integer;
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
procedure TJNTCRP004005F.HedCsTabChange(Sender: TObject);
// <176> ADD-STR
    // 支払タブの制御を行う
    procedure PayTabControl();
    var
        bUseGensen : Boolean;
    begin
        bUseGensen := ((m_iPayGensenKbn = 1) and (HedCsTab.Items.Selected = 0));

        // 実在の場合のみ調書関連を表示
        f2GensenKbn.TabStop := bUseGensen;
        f2GensenKbn.Enabled := bUseGensen;
        f2GensenKbn.Visible := bUseGensen;
        PnlGensenInfo.TabStop := bUseGensen;
        PnlGensenInfo.Enabled := bUseGensen;
        PnlGensenInfo.Visible := bUseGensen;

        // 合計の場合はメール配信の場所を移動
        MLabel12.Visible := bUseGensen;
        if bUseGensen then
            PnlMailnfo.Top := PnlGensenInfo.Top + 100
        else
            PnlMailnfo.Top := PnlGensenInfo.Top;
    end;
// <176> ADD-END
begin

    if ( m_bFirstFlag = False ) then Exit;

// <156> 2007/08/16 H.Kawato Add Start
    // 決算確定後かつデータ表示中でない場合、入力内容をクリアする
    if (uvDispFlg = 1) and (m_bRecGet = False) then
    begin
        // ﾌｫｰﾑの初期化
        fnInzForm;
   		f0CODE.Text     :=  '';
    end;
// <156> 2007/08/16 H.Kawato Add End

    case HedCsTab.Items.Selected of
        // 実在
        0:  begin
                DtlCsSub01Panel.Visible :=  True;
                HedPanel.Visible        :=  True;
                PnlButton.Visible       :=  True;
                B_Delete.Enabled        :=  False;
                if HedPanel.Enabled  then
                    MjsSetFocus(Self,'f0CODE');
                // 名寄せ情報パネル
                PnlNayoseInfo.Visible   :=  False;
// <176> DEL-STR
{// <157> 2007/08/22 H.Kawato Add Start
                // 実在タブでは、支払情報パネルを表示する
                // ただし、ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
                if (m_iVerData < 6) then
                    DtlCsTab.Items.Items[1].Visible := False
                else
                    DtlCsTab.Items.Items[1].Visible := True;
// <157> 2007/08/22 H.Kawato Add End}
// <176> DEL-END
                PayTabControl;                                      // <176> ADD
			    fnSetFncType(1);                                    // <136> Add
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);     // <136> Add
                fnSetFncEnabled();                                  // <148> Add
                // <175> Add start
                if(m_FeeBmnFlg = 1) then
                begin
                    DtlCs1LabelBmnNameTitle.Visible := True;
                    f1BmnCode.Visible := True;
                    f1BmnName.Visible := True;
                    DtlCs1LabelBmnNameTitle.Enabled := True;
                    f1BmnCode.Enabled := True;
                    f1BmnName.Enabled := True;
                end;
                // <175> Add end

            end;
        // 合計
        1:  begin
                DtlCsSub01Panel.Visible :=  True;
                HedPanel.Visible        :=  True;
                PnlButton.Visible       :=  True;
                B_Delete.Enabled        :=  False;
                if ( HedPanel.Enabled ) then
                    MjsSetFocus(Self,'f0CODE');
                // 名寄せ情報パネル
                PnlNayoseInfo.Visible   :=  True;
// <176> DEL-STR
//              // 合計タブでは、支払情報パネルを非表示とする
//              DtlCsTab.Items.Items[1].Visible := False;           // <157> Add
// <176> DEL-END
                PayTabControl;                                      // <176> ADD
			    fnSetFncType(1);                                    // <136> Add
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);     // <136> Add
                fnSetFncEnabled();                                  // <148> Add
                // <175> Add start
                if(m_FeeBmnFlg = 1) then
                begin
                    DtlCs1LabelBmnNameTitle.Visible := False;
                    f1BmnCode.Visible := False;
                    f1BmnName.Visible := False;
                    DtlCs1LabelBmnNameTitle.Enabled := False;
                    f1BmnCode.Enabled := False;
                    f1BmnName.Enabled := False;
                end;
                // <175> Add end
            end;
        // 名寄せ
//        2:  begin
        2,3:  begin     // <159> Mod
                DtlCsSub02Panel.Visible :=  True;                   // <159> Add
                HedPanel.Visible        :=  False;

                // 編集結果を確認する
                if ( m_EdtSw ) then
                begin
                    if fnCancel(False) then
                    begin
                        Abort;
                        Exit;
                    end;
                end
                else
                begin
                    fnInzFormf1;
                    fnInzFormf2;    // <157> Add
                    f0CODE.Text     := '';

                    // <169> 2010/07/07 G.Kojima Add
                    f2OyaCode.InputFlag := True;
                    f2OyaCode.Zero      := False;
                    f2KoCode.InputFlag  := True;
                    f2koCode.Zero       := False;
                    // <169> End

                    HedPanel.Enabled := True;
                    fnBtnEnbChg;
                end;

                PnlButton.Visible       :=  False;
// <AUT> MOD-STR
//              B_Delete.Enabled        :=  m_cJNTArea.IsDelete;
                B_Delete.Enabled        :=  m_JNTAuthority.IsDelete;
// <AUT> MOD-END
                fnGetNayoseInfo();
                fnSetFncType(0);                                    // <136> Add
		        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);     // <136> Add
                fnSetFncEnabled();                                  // <148> Add
                MjsSetFocus(Self,'GridNayose');
                GridNayose.FocusedField := GridNayoseOyaCode.Field; // <159> Add
        end;
    end;
end;

//-----------------------------------------------------------------------------
// fnGetNayoseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ情報の取得
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnGetNayoseInfo();
var
	sHojCD		:   String;
	sOyaCD		:   String;
	strFormat	:   String;
    DmqData     :   TMQuery;
    strSQL      :   String;     // <159> Add
begin
// <136> 2006/07/24 H.Kawato Add
    SKYKBN2.Value       := 0;
    SKYKBNNM2.Caption	:= '';
    NayoseOyaCode2.text := '';
    NayoseNM2.Caption   := '';

    uvSvOyaHojCD := '';
// <136> 2006/07/24 H.Kawato Add

    m_bReadFlg  :=  True;

// <159> 2008/02/29 H.Kawato Add Start
    strSQL  := 'SELECT '
             + ' NI.PayNCode '                          // 子取引先内部ｺｰﾄﾞ
             + ',NI.NayoseOyaNCode '                    // 親取引先内部ｺｰﾄﾞ
             + ',MT.GCode  AS SGCode '                  // 子取引先外部ｺｰﾄﾞ
             + ',MTO.GCode AS OYAGCode '                // 親取引先外部ｺｰﾄﾞ
             + ',MT.NMK    AS SNAME '                   // 子取引先名称
             + ',MTO.NMK   AS OYANAME '                 // 親取引先名称
             + ',SE.UsKinKbn  AS UsKinKbn '             // 請求区分
             + ',PA.CngNCode  AS CngNCode '             // 名寄せ親代替取引先内部ｺｰﾄﾞ
             + ',MTN.GCode AS NDGCode '                 // 名寄せ取引先外部ｺｰﾄﾞ
             + ',MTN.NMK   AS NDNAME '                  // 名寄せ取引先名称
             + 'FROM PayNayoseInfo NI '
             + 'LEFT OUTER JOIN MTOKUI MT '
             + 'ON (NI.PayNCode = MT.NCode) '
             + 'LEFT OUTER JOIN MTOKUI MTO '
             + 'ON (NI.NayoseOyaNCode = MTO.NCode) '
             + 'LEFT OUTER JOIN MTOKUI_SEL SE '
             + 'ON (SE.BaseNCode = NI.NayoseOyaNCode AND SE.RecKBN = 2) '
             + 'LEFT OUTER JOIN MTOKUI_PAY PA '
             + 'ON (PA.BaseNCode = NI.NayoseOyaNCode) '
             + 'LEFT OUTER join MTOKUI MTN '
             + 'ON (pa.CngNCode = MTN.NCode) '
             + 'WHERE (NI.MasterKbn = 22 ) ';

    if (HedCsTab.Items.Selected = 3) then
        strSQL  := strSQL + 'AND (NI.NayoseSyu = 2) '   // 通知書名寄せ
    else
        strSQL  := strSQL + 'AND (NI.NayoseSyu = 1) ';  // 名寄せ

// <169> 2010/07/05 G.Kojima Add↓
            //親取引先コード選択ありの場合
            if f2OyaCode.Text <> '' then
            begin
                strSQL  := strSQL + ' AND (NI.NayoseOyaNCode = :pOYANCode) ';
            end;
            //子取引先コード選択ありの場合
            if f2KoCode.Text <> '' then
            begin
                strSQL  := strSQL + ' AND (NI.PayNCode= :pKoNCode) ';
            end;
// <169> 2010/07/06 End

    strSQL  := strSQL + 'AND (NI.NayoseKbn = 1) '
//                      + 'ORDER BY MTO.GCode,MT.GCode ';
                        + 'ORDER BY OYAGCode,SGCode ';
// <159> 2008/02/29 H.Kawato Add End

	DSNayose.DataSet    :=  nil;

	MemNayose.Close;
	MemNayose.Open;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

	with (DmqData) do
	begin
// <177> ADD-STR
		Close();
		SQL.Clear();
		SQL.Add('DELETE PayNayoseInfo' +
                ' WHERE MasterKbn = 22' +
                '   AND PayNCode = 0');
        ExecSQL();
// <177> ADD-END
		Close();
		SQL.Clear();
// <159> 2008/02/29 H.Kawato Mod Start
(*
// <136> 2006/07/24 H.Kawato Mod Start
{
		SQL.Add('SELECT                                 '
            +   '    NI.PayNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode  as SGCode                '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode as OYAGCode              '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NMK    as SNAME                 '   // 子取引先名称
		    +   '   ,MTO.NMK   as OYANAME               '   // 親取引先名称
		    +   'FROM PayNayoseInfo NI                  '
            +   'LEFT OUTER JOIN MTOKUI MT              '
            +   '   ON (NI.PayNCode = MT.NCode)         '
            +   'LEFT OUTER JOIN MTOKUI MTO             '
            +   '   ON (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'WHERE (NI.MasterKbn = 22 )             '
            +   '  AND (NI.NayoseSyu = 1  )             '
            +   '  AND (NI.NayoseKbn = 1  )             '
            +   'ORDER BY MT.GCode                      ');
}
		SQL.Add('select                                 '
            +   '    NI.PayNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode  as SGCode                '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode as OYAGCode              '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NMK    as SNAME                 '   // 子取引先名称
		    +   '   ,MTO.NMK   as OYANAME               '   // 親取引先名称
		    +   '   ,se.UsKinKbn  as UsKinKbn           '   // 請求区分
		    +   '   ,pa.CngNCode  as CngNCode           '   // 名寄せ親代替取引先内部コード
            +   '   ,MTN.GCode as NDGCode               '   // 名寄せ取引先外部ｺｰﾄﾞ
		    +   '   ,MTN.NMK   as NDNAME                '   // 名寄せ取引先名称
		    +   'from PayNayoseInfo NI                  '
            +   'left outer join MTOKUI MT              '
            +   '   on (NI.PayNCode = MT.NCode)         '
            +   'left outer join MTOKUI MTO             '
            +   '   on (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'LEFT OUTER JOIN MTOKUI_SEL se          '
            +   '   ON (se.BaseNCode = NI.NayoseOyaNCode and se.RecKBN = 2) '
            +   'LEFT OUTER JOIN MTOKUI_PAY pa            '
            +   '   ON (pa.BaseNCode = NI.NayoseOyaNCode) '
            +   'LEFT OUTER join MTOKUI MTN             '
            +   '   on (pa.CngNCode = MTN.NCode)        '
            +   'where (NI.MasterKbn = 22 )             '
            +   '  and (NI.NayoseSyu = 1  )             '
            +   '  and (NI.NayoseKbn = 1  )             '
            +   'order by MTO.GCode,MT.GCode            ');
// <136> 2006/07/24 H.Kawato Mod End
*)


		SQL.Add(strSQL);
        // <169> 2010/07/05 G.Kojima Add↓

            //親取引先コード選択ありの場合
            if f2OyaCode.Text <> '' then
            begin
                ParamByName('pOYANCode').AsFloat    := fnGetNCODE(f2OyaCode.text, 22, m_TrCodeAttr);
            end;
            //子取引先コード選択ありの場合
            if f2KoCode.Text <> '' then
            begin
                ParamByName('pKoNCode').AsFloat     := fnGetNCODE(f2KoCode.text, 22, m_TrCodeAttr);
            end;
// <159> 2008/02/29 H.Kawato Mod End

		//	ｴﾗｰの判定
		if ( Open = False ) then
		begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

            DmqData.Close();
            DmqData.Free();
            Exit;
		end;

// <136> 2006/07/24 H.Kawato Add
        try
            // ﾃﾞｰﾀの表示を無効にする
            MemNayose.DisableControls;

// <136> 2006/07/24 H.Kawato Add
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
            	MemNayose.FieldByName('HojCode'     ).AsString := sHojCD;                           // 名寄せ子外部ｺｰﾄﾞ(DB用)
            	MemNayose.FieldByName('BaseHojCode' ).AsString := GetFld('SGCode'   ).AsString;	    // 名寄せ子外部ｺｰﾄﾞ(表示用)
            	MemNayose.FieldByName('SName'       ).AsString := GetFld('SNAME'    ).AsString;	    // 名寄せ子名称
            	MemNayose.FieldByName('OyaHojCD'    ).AsString := sOyaCD;                           // 名寄せ親外部ｺｰﾄﾞ(DB用)
            	MemNayose.FieldByName('OyaBaseHojCD').AsString := GetFld('OyaGCode' ).AsString;	    // 名寄せ親外部ｺｰﾄﾞ(表示用)
            	MemNayose.FieldByName('OyaName'     ).AsString := GetFld('OYANAME'  ).AsString;	    // 名寄せ親名称
            	MemNayose.FieldByName('PayNCode'    ).AsFloat  := GetFld('PayNCode' ).AsFloat;      // 名寄せ子内部ｺｰﾄﾞ
            	MemNayose.FieldByName('OyaNCode'    ).AsFloat  := GetFld('NayoseOyaNCode').AsFloat; // 名寄せ親内部ｺｰﾄﾞ
// <136> 2006/07/24 H.Kawato Add Start
                MemNayose.FieldByName('UsKinKbn'    ).AsInteger := GetFld('UsKinKbn').AsInteger;    // 請求区分
                MemNayose.FieldByName('CngNCode'    ).AsFloat   := GetFld('CngNCode').AsFloat;      // 代替仕入先内部ｺｰﾄﾞ
                MemNayose.FieldByName('NDCode'      ).AsString  := GetFld('NDGCode' ).AsString;     // 代替仕入先外部ｺｰﾄﾞ
                MemNayose.FieldByName('NDName'      ).AsString  := GetFld('NDName'  ).AsString;     // 代替仕入先名称
// <136> 2006/07/24 H.Kawato Add End

            	MemNayose.Post;

				// 最後の親コードを退避(上段コピーに使用)
				uvSvOyaHojCD := Trim(sOyaCD);   // <136> 2006/07/24 H.Kawato Add
            	next;
            end;

// <136> 2006/07/24 H.Kawato Add Start
		finally
            // ﾃﾞｰﾀの表示を有効にする
            MemNayose.EnableControls;
        end;
// <136> 2006/07/24 H.Kawato Add End
	end;

    DSNayose.DataSet := MemNayose;

    if ( MemNayose.RecordCount > 0 ) then
    	MemNayose.First;

    m_bReadFlg  :=  FALSE;

    DmqData.Free();

    GridNayose.FocusedField := GridNayoseOyaCode.Field;     // <171> ADD

// <138> 2006/08/17 H.Kawato Add
    if ( MemNayose.RecordCount = 0 ) then
    begin
    	GridNayoseOyaCode.DisableEditor := False;
    	GridNayoseOyaCode.ReadOnly      := False;
    	GridNayoseCode.DisableEditor    := False;
    	GridNayoseCode.ReadOnly         := False;
    end
    else
		GridNayoseChangeNodeEx(GridNayose);
// <138> 2006/08/17 H.Kawato Add
end;

//-----------------------------------------------------------------------------
// MemNayoseBeforePost()
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.MemNayoseBeforePost(DataSet: TDataSet);
var
	sPayCD          : String;
	sOyaCD	        : String;
    nPayCD          : Extended;
    nOyaCD          : Extended;
    nDaiCD          : Extended;
    Bol             : Boolean;
    lvDaigae        : Boolean;
    nOyaNCode       : Extended;
    RendoInitRet    : Integer;                  // <133> Add
    ProgRendoParam  : TJNTPAYProgRendoParam;    // <133> Add
    sName           : String;                   // <159> Add
    nPayNCode       : Extended;                 // <159> Add
    iUsKinKbn       : Integer;                  // <159> Add
    nCngNCode       : Extended;                 // <159> Add
    sNDGCode        : String;                   // <159> Add
    sNDNAME         : String;                   // <159> Add
    strFormat       : String;                   // <159> Add
    RendoInitRetG   : Integer;                  // <#GAI> ADD
begin
// <134> 2006/06/21 H.Kawato Mod
//  RendoInitRet    := -1;                      // <133> Add
    RendoInitRet    := -99;
// <134> 2006/06/21 H.Kawato Mod
    RendoInitRetG   := -99;                     // <#GAI> ADD
//    切出/埋込ﾎﾞﾀﾝ押下時は処理を中断
//    if ( m_bChange ) then   Exit;

    if (m_bReadFlg = TRUE) then
        Exit;

	if (DataSet.FieldByName('HojCode') .IsNull       ) or
	   (DataSet.FieldByName('HojCode') .AsString = '') or
	   (DataSet.FieldByName('OyaHojCD').IsNull       ) or
	   (DataSet.FieldByName('OyaHojCD').AsString = '') then
	begin
		if (m_bEndFlg = True) then
            Exit;

        Abort;
	end;

// <142> 2006/09/22 H.Kawato Mod Start
{
    // 入力値ﾁｪｯｸ
	if (fnRecordCheck() = False) then
        Abort;
}
    if (m_bErrChkFlag = False) then
    begin
// <159> 2008/02/29 H.Kawato Add Start
        // 通知書名寄せ入力値チェック
        if (HedCsTab.Items.Selected = 3) then
        begin
            sPayCD := DataSet.FieldByName('HojCode').AsString;	// 支払先ｺｰﾄﾞ

            // 名寄せ子入力値チェック
            if ( fnPayCodeCheck(sPayCD,sName,nPayNCode,DISPOSE_REAL,
                 iUsKinKbn, nCngNCode, sNDGCode, sNDNAME) = FALSE ) then
            begin
                m_bErrChkFlag := True;
        	    Abort;
            end
            else
            begin
                // 一括名寄せ子の存在Check
                if ( fnCheckPayNayoseSyu(sPayCD) = True ) then
                begin
                	MjsMessageBox(Self, '一括請求の名寄せで登録済です。', mjInformation, mjDefOk);
                    m_bErrChkFlag := True;                                      // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                	Abort;
                end;

// <163> ADD-STR
                // スポット支払支払先として設定された支払先は不可
                if ( fnCheckIsSpot(sPayCD) = True ) then
                begin
                    	MjsMessageBox(Self, 'スポット支払支払先として設定されています。'+#13#10+'名寄せ子として設定できません。', mjInformation, mjDefOk);
                    m_bErrChkFlag := True;                                      // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                	Abort;
                end;
// <163> ADD-END

                MemNayose.Edit;
                MemNayose.FieldByName('PayNCode').AsFloat   := nPayNCode;
                MemNayose.FieldByName('SName').AsString     := sName;           // 支払先名称
                if ( m_TRCodeAttr <= 1 ) then
                	sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
                MemNayose.FieldByName('BaseHojCode').AsString := sPayCD;	    // 支払先ｺｰﾄﾞ(編集前)
                // 数値(前0あり)
                if ( m_TRCodeAttr = 1 ) then
                begin
                	strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                	sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                	MemNayose.FieldByName('HojCode').AsString := sPayCD;	    // 支払先ｺｰﾄﾞ(前0あり)
                end;
            end;

            sPayCD := DataSet.FieldByName('OyaHojCD').AsString;	// 名寄せ親支払先ｺｰﾄﾞ
            // 名寄せ親入力値チェック
		    if (fnPayCodeCheck(sPayCD, sName, nPayNCode, DISPOSE_NAYOSEOYA,
                iUsKinKbn, nCngNCode, sNDGCode, sNDNAME) = FALSE) then
            begin
                m_bErrChkFlag := True;
        	    Abort;
            end
            else
            begin
                MemNayose.Edit;                    
                MemNayose.FieldByName('OyaNCode').AsFloat := nPayNCode;         // 親仕入先内部ｺｰﾄﾞ
                MemNayose.FieldByName('OyaName').AsString := sName;			    // 名寄せ親仕入先名称

                if (m_TRCodeAttr <= 1) then
                    sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
                MemNayose.FieldByName('OyaBaseHojCD').AsString := sPayCD;	    // 名寄せ親仕入先ｺｰﾄﾞ(編集前)

                // 数値(前0あり)
                if (m_TRCodeAttr  = 1) then
                begin
                    strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                    MemNayose.FieldByName('OyaHojCD').AsString := sPayCD;	    // 名寄せ親仕入先ｺｰﾄﾞ(前0あり)
                end;
            end;
        end
        // 名寄せ入力値チェック
        else
        begin
            sPayCD := DataSet.FieldByName('OyaHojCD').AsString;	    // 名寄せ親ｺｰﾄﾞ

            // 一括請求の場合、通知書名寄せの登録チェックを行う
            if (fnCheckUsKinKbn(sPayCD) = True) then
            begin
                sPayCD := DataSet.FieldByName('HojCode').AsString;	// 支払先ｺｰﾄﾞ

                // 通知書名寄せの存在Check
                if ( fnCheckPayNayoseSyu(sPayCD) = True ) then
                begin
                	MjsMessageBox(Self, '通知書名寄せで登録済です。', mjInformation, mjDefOk);
                    m_bErrChkFlag := True;  // 矢印キー押下後のｸﾞﾘｯﾄﾞの入力を許可
                    Abort;
                end;
// <163> ADD-STR
                // スポット支払支払先として設定された支払先は不可
                if ( fnCheckIsSpot(sPayCD) = True ) then
                begin
                   	MjsMessageBox(Self, 'スポット支払支払先として設定されています。'+#13#10+'名寄せ子として設定できません。', mjInformation, mjDefOk);
                    m_bErrChkFlag := True;  // 矢印キー押下後のｸﾞﾘｯﾄﾞの入力を許可
                    Abort;
                end;
// <163> ADD-END
            end;
// <159> 2008/02/29 H.Kawato Add End
            // 入力値ﾁｪｯｸ
            if (fnRecordCheck() = False) then
            begin
                m_bErrChkFlag := True;  // 矢印キー押下後のｸﾞﾘｯﾄﾞの入力を許可
                Abort;
            end;
        end;    // <159> Add
    end;
// <142> 2006/09/22 H.Kawato Mod End

	// -----<158> Add-St-----
	SessionPractice(C_ST_PROCESS);

	try
	// -----<158> Add-Ed-----

	with (DataSet) do
	begin
		sPayCD := FieldByName('HojCode' ).AsString;	        // 子仕入先ｺｰﾄﾞ
		sOyaCD := FieldByName('OyaHojCD').AsString;	        // 名寄せ親仕入先ｺｰﾄﾞ
		nPayCD := FieldByName('PayNCode').AsFloat;	        // 子仕入先内部ｺｰﾄﾞ
		nOyaCD := FieldByName('OyaNCOde').AsFloat;	        // 名寄せ親仕入先内部ｺｰﾄﾞ
        nDaiCD := 0;                                        // 名寄せ親代替内部ｺｰﾄﾞ

        try     // <134> 2006/06/21 H.Kawato Add

            // ---------------------------
            //  新規登録時
            // ---------------------------
    		if (State in [dsInsert]) then
    		begin
                // 名寄せ親代替仕入先の存在ﾁｪｯｸ
                lvDaigae := fnCheckDaigae(sOyaCD, nDaiCD);

    			// 名寄せ親仕入先ｺｰﾄﾞが存在するかCheck
    			if (fnCheckPayNayoseInfo(sOyaCD, NAYOSE_PARENT) = False) then
                begin
    				// 名寄せ親が存在しない時、名寄せ親情報追加
// <136> 2006/07/24 H.Kawato Mod
//    				if (fnUpDatePayNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT) = False) then
    				if (fnUpDatePayNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, True) = FALSE) then
                        Abort;

// <159> 2008/02/29 H.Kawato Add
                    // 通知書名寄せは販売テーブルの更新はしない
                    if (HedCsTab.Items.Selected <> 3) then
                    begin
// <159> 2008/02/29 H.Kawato Add
               			// 名寄せ親代替コードが登録されているかCheck
                        // 請求情報の更新(親)
            			if lvDaigae then
                        begin                                   // 請求情報の更新(一括請求)
// <136> 2006/07/24 H.Kawato Mod
//                          if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1) = False) then
                            if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, True, True) = FALSE) then
                                Abort;
                        end
                        else
                        begin                                   // 請求情報の更新(各店別請求)
// <136> 2006/07/24 H.Kawato mod
//                          if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2) = False) then
                            if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2, True, True) = FALSE) then
                                Abort;
                        end;
                    end;    // <159> Add
                end;

// <133> 2006/04/18 H.Kawato Add 進捗連動
// <159> 2008/02/29 H.Kawato Add Start
                if (HedCsTab.Items.Selected <> 3) then              // 通知書名寄せは進捗に影響なし
                begin
// <159> 2008/02/29 H.Kawato Add End
                    ProgRendoParam.pAppRecord    := Pointer(m_pRec);
                    ProgRendoParam.iOptCd        := 54;             // オプションコード・債務処理       // <137> Add
                    ProgRendoParam.iPrgCd        := 210100;         // プログラムコード・支払情報登録   // <137> Add
                    ProgRendoParam.dPAYCode      := nPayCD;
                    ProgRendoParam.iSateiChgKbn  := 0;              // 変更無し
                    ProgRendoParam.iNayoseChgKbn := 1;              // 変更あり
                    ProgRendoParam.iSyoriKbn     := 0;              // 支払情報登録系処理
		            ProgRendoParam.iSystemCode   := 1;             	// 債務管理	<162>

                    RendoInitRet := m_PayProgRendo.Init(ProgRendoParam);
                end;    // <159> Add
// <133> 2006/04/18 H.Kawato Add

// <#GAI> ADD-STR
                // 外貨進捗連動
                if (HedCsTab.Items.Selected <> 3) then              // 通知書名寄せは進捗に影響なし
                begin
                    ProgRendoParamG.pAppRecord   := Pointer(m_pRec);
                    ProgRendoParamG.iOptCd       := 61;             // オプションコード・外貨債務処理
                    ProgRendoParamG.iPrgCd       := 210100;         // プログラムコード・支払情報登録
                    ProgRendoParamG.dPAYCode     := nPayCD;
                    ProgRendoParamG.iNayoseChgKbn:= 1;              // 変更あり
                    ProgRendoParamG.iSyoriKbn    := 0;              // 支払情報登録系処理

                    RendoInitRetG := m_PayProgRendoG.Init(ProgRendoParamG);
                end;
// <#GAI> ADD-END

// <159> 2008/02/29 H.Kawato Mod
//                if (RendoInitRet = 1) or (RendoInitRet = 0) then    // <133> 2006/04/18 H.Kawato Add
                // 通知書名寄せは進捗に影響なし
                if (HedCsTab.Items.Selected = 3) or (RendoInitRet = 1) or (RendoInitRet = 0) then
// <159> 2008/02/29 H.Kawato Mod
                begin                                               // <133> 2006/04/18 H.Kawato Add

    			    // 名寄せ情報を追加
// <136> 2006/07/24 H.Kawato Mod
//        			if (fnUpDatePayNayoseInfo(nPayCD, nOyaCD, NAYOSE_CHILD, MODE_INSERT) = False) then
        			if (fnUpDatePayNayoseInfo(nPayCD, nOyaCD, NAYOSE_CHILD, MODE_INSERT, True) = FALSE) then
                        Abort;

        			// 登録した親コードを退避(上段コピーに使用)
        			uvSvOyaHojCD := Trim(sOyaCD);                   // <136> 2006/07/24 H.Kawato Add

          			// 名寄せ親代替コードが登録されているかCheck

// <159> 2008/02/29 H.Kawato Add
                    // 通知書名寄せは販売テーブルの更新はしない
                    if (HedCsTab.Items.Selected <> 3) then
                    begin
// <159> 2008/02/29 H.Kawato Add
                        // 請求情報の更新(子・代替)
               			if lvDaigae then
                        begin                                       // 請求情報の更新(一括請求)
                            // 子
// <136> 2006/07/24 H.Kawato Mod
//                          if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD,  2, 1) = False) then
                            if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD,  2, 1, False, True) = FALSE) then
                                Abort;

                            // 代替
// <136> 2006/07/24 H.Kawato Mod
//                          if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1) = False) then
                            if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1, False, True) = FALSE) then
                                Abort;
                        end
                        else
                        begin                                       // 請求情報の更新(各店別請求)
// <136> 2006/07/24 H.Kawato Mod
//                          if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD, 12, 2) = False ) then
                            if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD, 12, 2, False, True) = FALSE ) then
                                Abort;
                        end;
// <141> 2006/09/22 H.Kawato Add Start
                    end;    // <159> Add
                end
                else if (RendoInitRet = 10) then
                begin
                    MemNayose.Cancel;
                    abort;
// <141> 2006/09/22 H.Kawato Add End
                end;                                                // <133> 2006/04/18 H.Kawato Add
    		end;

            // ---------------------------
            //  更新処理時
            // ---------------------------
    		if (State in [dsEdit]) then
    		begin
    			if (m_AfterSave.sOyaCD <> sOyaCD) then
    			begin
                    lvDaigae := fnCheckDaigae(sOyaCD, nDaiCD);

    				// 名寄せ親支払先ｺｰﾄﾞが存在するかCheck
    				if (fnCheckPayNayoseInfo(sOyaCD, NAYOSE_PARENT) = False) then
                    begin
                        // 名寄せ親が存在しない時,名寄せ親情報追加
// <136> 2006/07/24 H.Kawato Mod
//    					if (fnUpDatePayNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT) = False) then
    					if (fnUpDatePayNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, True) = FALSE) then
                            Abort;

// <159> 2008/02/29 H.Kawato Add
                        // 通知書名寄せは販売テーブルの更新はしない
                        if (HedCsTab.Items.Selected <> 3) then
                        begin
// <159> 2008/02/29 H.Kawato Add
              			    // 名寄せ親代替ｺｰﾄﾞが登録されているかCheck
                            // 請求情報の更新(親)
                   			if  lvDaigae then
                            begin
// <136> 2006/07/24 H.Kawato Mod
//                              if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1) = False) then
                                if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, True, True) = FALSE) then
                                    Abort;
                            end
                            else
                            begin
// <136> 2006/07/24 H.Kawato Mod
//                              if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2) = False) then
                                if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD, 11, 2, True, True) = FALSE) then
                                    Abort;
                            end;
                        end;    // <159> Add
                    end;

// <133> 2006/04/18 H.Kawato Add 進捗連動
// <159> 2008/02/29 H.Kawato Add Start
                    if (HedCsTab.Items.Selected <> 3) then              // 通知書名寄せは進捗に影響なし
                    begin
// <159> 2008/02/29 H.Kawato Add End
                        ProgRendoParam.pAppRecord    := Pointer(m_pRec);
                        ProgRendoParam.iOptCd        := 54;             // オプションコード・債務処理       //<137> Add
                        ProgRendoParam.iPrgCd        := 210100;         // プログラムコード・支払情報登録   //<137> Add
                        ProgRendoParam.dPAYCode      := nPayCD;
                        ProgRendoParam.iSateiChgKbn  := 0;              // 変更無し
                        ProgRendoParam.iNayoseChgKbn := 1;              // 変更あり
                        ProgRendoParam.iSyoriKbn     := 0;              // 支払情報登録系処理
            			ProgRendoParam.iSystemCode   := 1;            	// 債務管理	<162>

                        RendoInitRet := m_PayProgRendo.Init(ProgRendoParam);
                    end;    // <159> Add
// <133> 2006/04/18 H.Kawato Add

// <#GAI> ADD-STR
                    // 外貨進捗連動
                    if (HedCsTab.Items.Selected <> 3) then              // 通知書名寄せは進捗に影響なし
                    begin
                        ProgRendoParamG.pAppRecord   := Pointer(m_pRec);
                        ProgRendoParamG.iOptCd       := 61;             // オプションコード・外貨債務処理
                        ProgRendoParamG.iPrgCd       := 210100;         // プログラムコード・支払情報登録
                        ProgRendoParamG.dPAYCode     := nPayCD;
                        ProgRendoParamG.iNayoseChgKbn:= 1;              // 変更あり
                        ProgRendoParamG.iSyoriKbn    := 0;              // 支払情報登録系処理

                        RendoInitRetG := m_PayProgRendoG.Init(ProgRendoParamG);
                    end;
// <#GAI> ADD-END

// <159> 2008/02/29 H.Kawato Mod
//                    if (RendoInitRet = 1) or (RendoInitRet = 0) then    // <133> Add
                    // 通知書名寄せは進捗に影響なし
                    if (HedCsTab.Items.Selected = 3) or (RendoInitRet = 1) or (RendoInitRet = 0) then
// <159> 2008/02/29 H.Kawato Mod
                    begin                                               // <133> Add

    				    // 名寄せ情報を更新(名寄せ子)
// <136> 200/07/24 H.Kawato Mod
//    				    if (fnUpDatePayNayoseInfo(nPayCD, nOyaCD, NAYOSE_CHILD, MODE_EDIT) = False) then
                        if (fnUpDatePayNayoseInfo(nPayCD, nOyaCD, NAYOSE_CHILD, MODE_EDIT, True) = FALSE) then
                            Abort;

// <159> 2008/02/29 H.Kawato Add
                        // 通知書名寄せは販売テーブルの更新はしない
                        if (HedCsTab.Items.Selected <> 3) then
                        begin
// <159> 2008/02/29 H.Kawato Add
                            // 名寄せ親代替ｺｰﾄﾞが登録されているかCheck
                            // 請求情報の更新(子・代替)
                            if lvDaigae then
                            begin                                       // 請求情報の更新(一括請求)
// <136> 2006/07/24 H.Kawato Mod
//                            if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD,  2, 1) = False) then
                                if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD,  2, 1, False, True) = FALSE) then
                                    Abort;
// <136> 2006/07/24 H.Kawato Mod
//                            if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1) = False) then
                                if (fnUpDateMTokui_SelInfo(nDaiCD, nOyaCD,  3, 1, False, True) = FALSE) then
                                    Abort;
                            end
                            else
                            begin                                       // 請求情報の更新(各店別請求)
// <136> 2006/07/24 H.Kawato Mod
//                            if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD, 12, 2) = False) then
                                if (fnUpDateMTokui_SelInfo(nPayCD, nOyaCD, 12, 2, False, True) = FALSE) then
                                    Abort;
                            end;

                            // 和暦西暦区分・代表社名の印字変更時
// <Rel>                            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc6);
                            m_cDataModule.BeginTran(m_cDBSelect);
// ↓<Rel>
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                            begin
                                // DBとMQueryの接続
                                m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, StdProc6);

                                // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
                                m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
                            end
                            else
                            begin
                                // DBとMQueryの接続
                                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc6);
                            end;
// ↑<Rel>

                            // PRC_MA0150_106
                            with StdProc6 do
                            begin
                                ParamByName('@pTRNCD').AsFloat := nOyaCD;
								FetchOptions.Items := FetchOptions.Items - [fiMeta];
                                ExecProc;
                                Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
                            end;

                            // ERROR
                            if not Bol then
                            begin
                                // ﾛｰﾙﾊﾞｯｸ(破棄)
                            	m_cDataModule.Rollback(m_cDBSelect);
// ↓<Rel>
                                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                                	m_cDataModule.Rollback(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
                                Exit;
                            end;
//↓<Rel>
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                            begin
                                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                                    Exit;

                                // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
//                                if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,PayNCD,DmqData) then
//                                    Exit;
                            end;
//↑<Rel>
                            m_cDataModule.Commit (m_cDBSelect);
// ↓<Rel>
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                                m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
                        end;    // <159> Add

// <141> 2006/09/22 H.Kawato Add Start
                    end
                    else if (RendoInitRet = 10) then
                    begin
                        MemNayose.Cancel;
                        abort;
// <141> 2006/09/22 H.Kawato Add End
                    end;    // <133> Add
                end;
            end;
// <133> 2006/04/18 H.Kawato Add
            if RendoInitRet = 1 then
                m_PayProgRendo.Exec;
// <#GAI> ADD-STR
            if RendoInitRetG = 1 then
                m_PayProgRendoG.Exec;
// <#GAI> ADD-END

// <134> 2006/06/21 H.Kawato Mod
//      m_PayProgRendo.Term;

        finally
            if RendoInitRet <> -99 then
                m_PayProgRendo.Term;
// <#GAI> ADD-STR
            if RendoInitRetG <> -99 then
                m_PayProgRendoG.Term;
// <#GAI> ADD-END
        end;
// <134> 2006/06/21 H.Kawato Mod
// <133> 2006/04/18 H.Kawato Add
	end;

// <159> 2008/02/29 H.Kawato Add Start
    if (HedCsTab.Items.Selected <> 3) then  // 通知書名寄せは進捗に影響なし
    begin
// <159> 2008/02/29 H.Kawato Add End
        //=======================================================
        // 親子ﾌﾗｸﾞ変更 <113>
        //=======================================================
        // 変更前の親仕入先内部ｺｰﾄﾞを取得
        nOyaNCode := fnGetNCODE(m_AfterSave.sOyaCD, 22, m_TrCodeAttr);

//      m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc5);
        m_cDataModule.BeginTran(m_cDBSelect);

// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, StdProc5);

            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
        end
        else
        begin
            // DBとMQueryの接続
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc5);
        end;
// ↑<Rel>

        // PRC_MA0150_104
        with StdProc5 do
        begin
            ParamByName('@pTRNCD')    .AsFloat := nPayCD;
            ParamByName('@pOLDSEINCD').AsFloat := nOyaNCode;
			FetchOptions.Items := FetchOptions.Items - [fiMeta];
            ExecProc;
            Bol := (ParamByName('@RETURN_VALUE').AsInteger = 0);
        end;

        if not Bol then
        begin
            // ﾛｰﾙﾊﾞｯｸ(破棄)
            m_cDataModule.Rollback(m_cDBSelect);
// ↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                m_cDataModule.Rollback(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
            Exit;
        end;

        m_cDataModule.Commit(m_cDBSelect);
// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>

//↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                Exit;

            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
//          if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,nOyaNCode,DmqData) then
//              Exit;
        end;
//↑<Rel>
    end;    // <159> Add

// <136> 2006/07/24 H.Kawato Add
    SKYKBN2.Value       := 0;
    SKYKBNNM2.Caption	:= '';
    NayoseOyaCode2.text := '';
    NayoseNM2.Caption   := '';
// <136> 2006/07/24 H.Kawato Add

	// -----<158> Add-St-----
	finally
		SessionPractice(C_ED_PROCESS);
	end;
	// -----<158> Add-Ed-----

end;

// <136> 2006/07/24 H.Kawato Add Start
//-----------------------------------------------------------------------------
// MakeNayoseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ作成処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.MakeNayoseInfo(sOyaCD: String; sPayCD: String;
	nOyaCD: Extended; nPayCD: Extended);
begin
    // 入力値ﾁｪｯｸ、親仕入先の実績ﾏｽﾀ作成
	if (fnRecordCheck(True) = FALSE) then
        Abort;

    // ---------------------------
    //  新規登録時
    // ---------------------------

	// 名寄せ親仕入先ｺｰﾄﾞが存在するかCheck
	if (fnCheckPayNayoseInfo(sOyaCD, NAYOSE_PARENT) = FALSE) then
    begin
        // 名寄せ親が存在しない時、名寄せ親情報追加
        if (fnUpDatePayNayoseInfo(nOyaCD, 0, NAYOSE_PARENT, MODE_INSERT, False) = FALSE) then
            Abort;

        // 請求情報の更新(一括請求)
        if (fnUpDateMTokui_SelInfo(nOyaCD, nOyaCD,  1, 1, False, False) = FALSE) then
            Abort;
	end;

    // 名寄せ情報を追加
    if (fnUpDatePayNayoseInfo(nPayCD, nOyaCD, NAYOSE_CHILD, MODE_INSERT, False) = FALSE) then
        Abort;
end;
// <136> 2006/07/24 H.Kawato Add End

//-----------------------------------------------------------------------------
// fnCheckPayNayoseInfo()
//      PARAM   : CD    名寄せ外部ｺｰﾄﾞ
//                KBN   名寄せ区分(1:子 2:親)
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnCheckPayNayoseInfo(CD: String; KBN: Integer): Boolean;
var
    DmqData :   TMQuery;
begin

	if ( m_TRCodeAttr <= 1 ) then
		CD := Format ('%.16d',[StrToInt64(Trim(CD))]);

	Result := FALSE;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add('SELECT                                 '
                +   '    MT.GCode                           '
                +   'FROM PayNayoseInfo PI                  '
                +   'LEFT OUTER JOIN MTOKUI MT              '
                +   '   ON    (MT.NCode   = PI.PayNCode)    '
                +   '     And (MT.RDelKbn = 0)              '
    		    +   'WHERE (MasterKbn = 22)                 '
//                +   '  AND (NayoseSyu = 1)                  '
                +   '  AND (NayoseSyu = :SYU)               '   // <159> Mod
                +   '  AND (GCode     = :CD)                '
                +   '  AND (NayoseKbn = :KBN)               ');

// <159> 2008/02/29 H.Kawato Add Start
            if (HedCsTab.Items.Selected = 3) then
        		ParamByName('SYU' ).AsInteger   := 2            // 通知書名寄せ
            else
        		ParamByName('SYU' ).AsInteger   := 1;           // 名寄せ
// <159> 2008/02/29 H.Kawato Add End

    		ParamByName('CD' ).AsString	 := CD;					// 名寄せ親支払先ｺｰﾄﾞ
    		ParamByName('KBN').AsInteger := KBN;				// 名寄せ区分

    		if ( not Open () ) then
    		begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                DmqData.Close();
                DmqData.Free();

    			Result := FALSE;
    			Exit;
    		end;

    		if ( EOF <> True ) then
    		begin
    			Result := True;
    		end;
    	end;
    finally
        DmqData.Free();
    end;
end;

// <159> 2008/02/29 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnCheckUsKinKbn()
//      PARAM   : CD    名寄せ親外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : T : 一括請求の名寄せ親として採用あり F: その他
//      MEMO    : 名寄せ親請求区分チェック
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnCheckUsKinKbn(sOyaCD: String): Boolean;
var
    DmqData :   TMQuery;
    strSQL  :   String;
begin
	Result := FALSE;

	if ( m_TRCodeAttr <= 1 ) then
		sOyaCD := Format ('%.16d',[StrToInt64(Trim(sOyaCD))]);

    // 債務名寄せ区分、請求区分を取得
    strSQL  := 'SELECT '
             + 'MT.PayRootKbn AS PayRootKbn, '
             + 'SE.UsKinKbn AS UsKinKbn '
             + 'FROM MTOKUI AS MT '
             + 'LEFT OUTER JOIN MTOKUI_SEL AS SE '
             + 'ON SE.BaseNCode = MT.NCode '
             + 'WHERE MT.RDelKbn = 0 '
             + 'AND SE.RecKBN  = 2 '
             + 'AND MT.GCode = ' + AnsiQuotedStr(sOyaCD, '''');

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add(strSQL);

    		if ( not Open () ) then
    		begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                DmqData.Close();
                DmqData.Free();

    			Result := FALSE;
    			Exit;
    		end;

    		if ( EOF <> True ) then
    		begin
                if  (GetFld('PayRootKbn').AsInteger = 1) and    // 名寄せ親として採用
                    (GetFld('UsKinKbn').AsInteger = 1) then     // 一括請求一括支払
                begin
        			Result := True;
                end;
    		end;
    	end;
    finally
        DmqData.Free();
    end;
end;

//-----------------------------------------------------------------------------
// fnCheckPayNayoseSyu()
//      PARAM   : CD    名寄せ外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnCheckPayNayoseSyu(sPayCD: String): Boolean;
var
    DmqData :   TMQuery;
    strSQL  :   String;
begin
	Result := FALSE;

	if ( m_TRCodeAttr <= 1 ) then
		sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);

    if (HedCsTab.Items.Selected = 3) then               // 通知書名寄せ
    begin
        // 一括請求名寄せ登録済の支払先は選択不可
        strSQL  := 'SELECT PI.PayNCode '
                 + 'FROM PayNayoseInfo PI '
                 + 'LEFT OUTER JOIN MTOKUI MT '
                 + 'ON MT.NCode = PI.PayNCode '
                 + 'AND MT.RDelKbn = 0 '
                 + 'LEFT OUTER JOIN MTOKUI_PAY MP '
                 + 'ON MP.BaseNCode = PI.NayoseOyaNCode  '
                 + 'WHERE PI.MasterKbn = 22 '
                 + 'AND MT.GCode = ' + AnsiQuotedStr(sPayCD, '''') + ' '
                 + 'AND PI.NayoseSyu = 1 '              // 1:名寄せ情報
                 + 'AND PI.NayoseKbn = 1 '              // 1:名寄せ子
                 + 'AND ISNULL(MP.CngNCode, 0) <> 0 ';  // 名寄せ親に代替仕入先の登録あり(一括名寄せ)
    end
    else                                                // 名寄せ
    begin
        // 通知書名寄せ登録済の支払先は選択不可
        strSQL  := 'SELECT PI.PayNCode '
                 + 'FROM PayNayoseInfo PI '
                 + 'LEFT OUTER JOIN MTOKUI MT '
                 + 'ON MT.NCode = PI.PayNCode '
                 + 'AND MT.RDelKbn = 0 '
                 + 'WHERE PI.MasterKbn = 22 '
                 + 'AND MT.GCode = ' + AnsiQuotedStr(sPayCD, '''') + ' '
                 + 'AND PI.NayoseSyu = 2 '              // 2:通知書名寄せ
                 + 'AND PI.NayoseKbn = 1 ';             // 1:名寄せ子
    end;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add(strSQL);

    		if ( not Open () ) then
    		begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                DmqData.Close();
                DmqData.Free();

    			Result := FALSE;
    			Exit;
    		end;

    		if ( EOF <> True ) then
    		begin
    			Result := True;
    		end;
    	end;
    finally
        DmqData.Free();
    end;
end;
// <159> 2008/02/29 H.Kawato Add End
//-----------------------------------------------------------------------------
// fnCheckDaigae()
//      PARAM   : CD    名寄せ親外部ｺｰﾄﾞ
//                DaeCD 名寄せ親代替外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnCheckDaigae(CD: String; var DainCD: Extended): Boolean;
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
    		SQL.Add('select CngNCode from MTOKUI_PAY where (BaseNCode = :CD)');

            // 名寄せ親支払先ｺｰﾄﾞ
    		ParamByName('CD').AsFloat := fnGetNCODE(CD, 22, m_TrCodeAttr);

            Open;

    		if not EOF then
    		begin
                DaiNCD := FieldByName('CngNCode').asFloat;

                // 代替仕入先の存在ﾁｪｯｸ <109>
                if DaiNCD = 0 then
           			Result := False                         // 代替仕入先の設定なし
                else
           			Result := True;                         // 代替仕入先の設定あり
    		end;
    	end;
    finally
        DmqData.Free();
    end;

end;


//-----------------------------------------------------------------------------
// fnUpDatePayNayoseInfo()
//      PARAM   : PayNCD    名寄せ子内部ｺｰﾄﾞ
//                OyaNCD    名寄せ親内部ｺｰﾄﾞ
//                KBN       名寄せ区分(1:子 2:親)
//                MODE
//      VAR     :
//      RETURN  : T : 正常終了 F:異常終了
//      MEMO    : 名寄せ更新処理
//-----------------------------------------------------------------------------
// <136> 2006/07/24 H.Kawato Mod
//function    TJNTCRP004005F.fnUpDatePayNayoseInfo(PayNCD,OyaNCD:Extended; KBN,MODE: Integer): Boolean;
function    TJNTCRP004005F.fnUpDatePayNayoseInfo(PayNCD,OyaNCD:Extended; KBN,MODE: Integer;
	                                             TranMode: Boolean): Boolean;
// <136> 2006/07/24 H.Kawato Mod
var
    DmqData :   TMQuery;
    
begin

    // MQueryの構築
    DmqData := TMQuery.Create(Self );
    // DBとMQueryの接続
// <Rel>    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );


//↓<Rel>
    // -------------------------------------------------------------------------
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        // 親会社DBとTStoredProcの接続
    	m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, DmqData)		// DBとの接続
    else
    	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, DmqData);					// DBとの接続
//↑<Rel>


    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
// <136> 2006/07/24 H.Kawato Mod
//	m_cDataModule.BeginTran (m_cDBSelect);
    if TranMode then
    begin
		m_cDataModule.BeginTran (m_cDBSelect);
// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    		m_cDataModule.BeginTran (m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
    end;
// <136> 2006/07/24 H.Kawato Mod

    try
        with ( DmqData ) do
        begin
            // ----------
            //  新規
            // ----------
            if ( MODE = MODE_INSERT ) then
            begin
                Close();
                SQL.Clear();
                SQL.Add('INSERT INTO PayNayoseInfo (    '
                    +   '    MasterKbn                  '
                    +   '   ,NayoseSyu                  '
                    +   '   ,PayNCode                   '
                    +   '   ,NayoseKbn                  '
                    +   '   ,NayoseOyaNCode             '
                    +   '   ,UpdTantoNCode              '       // <136> 2006/07/24 H.Kawato Add
                    +   ') VALUES (                     '
                    +   '    22                         '
//                    +   '   ,1                          '
                    +   '   ,:SYU                       '       // <159> Mod
                    +   '   ,:PNC                       '
                    +   '   ,:NK                        ');

// <136> 2006/07/24 H.Kawato Mod Start
{
                if ( KBN = NAYOSE_CHILD ) then
                        SQL.Add('   ,:NO )  ')
                else    SQL.Add('   ,0   )  ');
}
                if ( KBN = NAYOSE_CHILD ) then
                        SQL.Add('   ,:NO   ')
                else    SQL.Add('   ,0     ');
                SQL.Add('   ,:UPDTANTO   )  ');
// <136> 2006/07/24 H.Kawato Mod End
            end
            // ----------
            //  更新
            // ----------
            else
            begin
                Close();
                SQL.Clear();
                SQL.Add('UPDATE PayNayoseInfo SET   '
                    +   '    NayoseOyaNCode = :NO   '
                    +   '      ,UpdTantoNCode  = :UPDTANTO '    // <136> 2006/07/24 H.Kawato Add
                    +   'WHERE (MasterKbn = 22)     '
                    +   '  AND (PayNCode  = :PNC)   '
                    +   '  AND (NayoseKbn = :NK)    '
//                    +   '  AND (NayoseSyu = 1)      ');
                    +   '  AND (NayoseSyu = :SYU)   ');         // <159> Mod
            end;

// <159> 2008/02/29 H.Kawato Add Start
            // 名寄せ種別
            if (HedCsTab.Items.Selected = 3) then
                ParamByName('SYU')  .AsInteger  :=  2           // 通知書名寄せ
            else
                ParamByName('SYU')  .AsInteger  :=  1;          // 名寄せ
// <159> 2008/02/29 H.Kawato Add End

            // 支払先ｺｰﾄﾞ
            ParamByName('PNC')  .AsFloat    :=  PayNCD;
            // 名寄せ区分
            ParamByName('NK')   .AsInteger  :=  KBN;

            if ( KBN = NAYOSE_CHILD ) then
                // 名寄せ親支払先ｺｰﾄﾞ
                ParamByName('NO').AsFloat := OyaNCD;

            ParamByName('UPDTANTO').AsFloat := m_TantoNCode;    // <136> 2006/07/24 H.Kawato Add

            if ( not ExecSQL() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);
                // ﾛｰﾙﾊﾞｯｸ(破棄)
// <136> 2006/07/24 H.Kawato Mod
//  			m_cDataModule.Rollback(m_cDBSelect);
                if TranMode then
                begin
                    m_cDataModule.Rollback(m_cDBSelect);
                    // ↓<Rel>
                    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                        m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);
                    // ↑<Rel>
                end;
// <136> 2006/07/24 H.Kawato Mod
                Result := False;
                Exit;
            end;

//↓<Rel>
            // ﾄﾘｶﾞで子取引先ﾚｺｰﾄﾞの_Relが更新されるので、同期ﾌﾟﾛｼｼﾞｬを実行して配信してあげる。
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(21) = False ) then
                begin
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
                    if TranMode then
                    begin
                        m_cDataModule.Rollback(m_cDBSelect);

                        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                            m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);
                    end;

                    Result := False;
                    Exit;
                end;
            end;
//↑<Rel>

        end;

        // ｺﾐｯﾄ(反映)
// <136> 2006/07/24 H.Kawato Mod
//	m_cDataModule.Commit (m_cDBSelect);
        if TranMode then
        begin
            m_cDataModule.Commit (m_cDBSelect);
            // ↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                m_cDataModule.Commit (m_SyncMaster.m_cPDBSelect);
            // ↑<Rel>
        end;
// <136> 2006/07/24 H.Kawato Mod

        // 正常終了
        Result := True;
    finally
        DmqData.Close();
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnUpDateMTokui_SelInfo()
//      PARAM   : PayNCD        支払先内部ｺｰﾄﾞ
//                SeiNCD        請求先内部ｺｰﾄﾞ
//                OyakokFlg     親子ﾌﾗｸﾞ
//      VAR     :
//      RETURN  : Integer
//      MEMO    : Mtokui_Selへ請求先情報を書き込む
//-----------------------------------------------------------------------------
// <136> 2006/07/24 H.Kawato Mod
//function  TJNTCRP004005F.fnUpDateMTokui_SelInfo(PayNCD,SeiNCD: Extended; OyakoFlg,UsKin: Integer): Boolean;
function  TJNTCRP004005F.fnUpDateMTokui_SelInfo(PayNCD, SeiNCD: Extended; OyakoFlg, UsKin: Integer;
	aGoukei: Boolean; TranMode: Boolean): Boolean;
// <136> 2006/07/24 H.Kawato Mod
var
    DmqData :   TMQuery;
begin

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
// <Rel>    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
// ↓<Rel>
    // -------------------------------------------------------------------------
    //  子会社(ｸﾞﾙｰﾌﾟ会計採用有)は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, DmqData )  // 親会社DBとMQueryの接続
    else
        m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, DmqData );               // 子会社DBとMQueryの接続
// ↑<Rel>


    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
// <136> 2006/07/24 H.Kawato Mod
//	m_cDataModule.BeginTran (m_cDBSelect);
    if TranMode then
    begin
		m_cDataModule.BeginTran (m_cDBSelect);
// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    		m_cDataModule.BeginTran (m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
    end;
// <136> 2006/07/24 H.Kawato mod

	with ( DmqData ) do
	begin
        Close();
        SQL.Clear();
        SQL.Add('UPDATE MTOKUI_SEL SET          '
// <136> 2006/07/24 H.Kawato Mod
//            +   '    OyakoFlg   =   :nOyakoFlg  '
//            +   '   ,UsKinKbn   =   :nUsKinKbn  '
//            +   '   ,SeiNCode   =   :nSeiNCode  '
            +   '    OyakoFlg   =   :nOyakoFlg  ');

		if not aGoukei then
	        SQL.Add('   ,UsKinKbn   =   :nUsKinKbn  ');

        SQL.Add('   ,SeiNCode   =   :nSeiNCode  '
// <136> 2006/07/24 H.Kawato Mod
            +   'WHERE (BaseNCode = :nNCode)    '
            +   '  and (RecKbn = 2)    ');

        ParamByName('nOyakoFlg').AsInteger  :=  OyakoFlg;
// <136> 2006/07/24 H.Kawato Mod
//        ParamByName('nUsKinKbn').AsInteger  :=  UsKin;
		if not aGoukei then
	        ParamByName('nUsKinKbn').AsInteger := UsKin;
// <136> 2006/07/24 H.Kawato Mod
        ParamByName('nSeiNCode').AsFloat    :=  SeiNCD;
        ParamByName('nNCode')   .AsFloat    :=  PayNCD;

        if ( not ExecSQL() ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);
            // ﾛｰﾙﾊﾞｯｸ(破棄)
// <136> 2006/07/24 H.Kawato Mod
//			m_cDataModule.Rollback(m_cDBSelect);
		    if TranMode then
            begin
				m_cDataModule.Rollback(m_cDBSelect);
                // ↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                    m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);
                // ↑<Rel>
            end;
// <136> 2006/07/24 H.Kawato Mod

            DmqData.Close();
            DmqData.Free();
			Result := FALSE;
			Exit;
		end;

        //↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
            if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
            begin
                Result := False;
                Exit;
            end;

            // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
            if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,PayNCD,DmqData) then
            begin
                Result := False;
                Exit;
            end;
        end;
        //↑<Rel>
	end;

    // ｺﾐｯﾄ(反映)
// <136> 2006/07/24 H.Kawato Mod
//	m_cDataModule.Commit (m_cDBSelect);
    if TranMode then
    begin
		m_cDataModule.Commit(m_cDBSelect);
        // ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            m_cDataModule.Commit (m_SyncMaster.m_cPDBSelect);
        // ↑<Rel>
    end;
// <136> 2006/07/24 H.Kawato Mod

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
procedure TJNTCRP004005F.GridNayoseBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
    sPayCD		: String;
	sName		: String;
	strFormat	: String;
    nPayNCode   : Extended;
// <136> 2006/07/24 H.Kawato Add Start
    iUsKinKbn	: Integer;
    nCngNCode	: Extended;
    sNDGCode	: String;
    sNDNAME		: String;
// <136> 2006/07/24 H.Kawato Add End
    sOyaCD      : String;           // <159> Add
begin

    if NewColumn in [1,3] then
	begin
        m_bErrChkFlag := False;     // <142> Add    // 名称ｸﾘｯｸ時は入力値ﾁｪｯｸを行う
       	CanChange :=  False;
		Exit;
	end;

	case Column of
        // -----------------------------------
        // 名寄せ親支払先ｺｰﾄﾞ
        // -----------------------------------
		0:  begin
			    sPayCD := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('OyaHojCD').AsString;	// 名寄せ親支払先ｺｰﾄﾞ

// <136> 2006/07/24 H.Kawato Add Start
				//上段コピー
			    if ( sPayCD = '' ) and ( uvSvOyaHojCD <> '' ) then
			    begin
				    with TdxDBGrid(Sender).DataSource.DataSet do
                    begin
                    	Edit;
						FieldByName('OyaHojCD').AsString := uvSvOyaHojCD;
                        sPayCD := uvSvOyaHojCD;
                    end;
			    end;                                                            
// <136> 2006/07/24 H.Kawato Add End

			    if ( sPayCD = '' ) then
			    begin
				    CanChange := FALSE;
				    Exit;
			    end
                else
    			begin
	    			// 名寄せ親支払先ｺｰﾄﾞの存在Check
// <136> 2006/07/24 H.Kawato Mod Start
//		    		if ( fnPayCodeCheck(sPayCD,sName,nPayNCode,DISPOSE_NAYOSEOYA) = False ) then
		    		if ( fnPayCodeCheck(sPayCD,sName,nPayNCode,DISPOSE_NAYOSEOYA,
                         iUsKinKbn, nCngNCode, sNDGCode, sNDNAME) = FALSE ) then
// <136> 2006/07/24 H.Kawato Mod End
    				begin
	    				CanChange := False;
		    			Abort;
    				end
    				else
    				begin
    					MemNayose.Edit;
    					MemNayose.FieldByName('OyaNCode').AsFloat := nPayNCode;
    					MemNayose.FieldByName('OyaName').AsString := sName;			// 名寄せ親支払先名称
    					if ( m_TRCodeAttr <= 1 ) then
    						sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
    					MemNayose.FieldByName('OyaBaseHojCD').AsString := sPayCD;	// 名寄せ親支払先ｺｰﾄﾞ(編集前)
    					// 数値(前0あり)
    					if ( m_TRCodeAttr = 1 ) then
    					begin
    						strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
    						sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
      						MemNayose.FieldByName('OyaHojCD').AsString := sPayCD;	// 名寄せ親支払先ｺｰﾄﾞ(前0あり)
    					end;
// <136> 2006/07/24 H.Kawato Add Start
                        MemNayose.FieldByName('UsKinKbn'    ).AsInteger := iUsKinKbn;       // 請求区分
                        MemNayose.FieldByName('CngNCode'    ).AsFloat   := nCngNCode;       // 代替仕入先内部コード
                        MemNayose.FieldByName('NDCode'      ).AsString  := sNDGCode;	 	
                        MemNayose.FieldByName('NDName'      ).AsString  := sNDNAME;

                        SKYKBN2.Value       := iUsKinKbn;
                        SKYKBNNM2.Caption	:= fnGetSkyKbnNm(SKYKBN2.Text);

                        if (m_TRCodeAttr <> 2) and (sNDGCode = ucZeroCODE ) then
                        begin
                            NayoseOyaCode2.Zero := TRUE;
                            NayoseOyaCode2.InputFlag := FALSE;
                        end;
                        NayoseOyaCode2.text := sNDGCode;
                        NayoseNM2.Caption   := sNDNAME;
// <136> 2006/07/24 H.Kawato Add End
    				end;
    			end;
    		end;
        // -----------------------------------
        //  支払先ｺｰﾄﾞ
        // -----------------------------------
		2:  begin
			    sPayCD := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('HojCode').AsString;	// 支払先ｺｰﾄﾞ

			    if (sPayCD <> '')  then
			    begin
				    if not ( MemNayose.State in [dsInsert] ) then Exit;

				    // 支払先ｺｰﾄﾞの存在Check
// <136> 2006/07/24 H.Kawato Mod Start
//				    if ( fnPayCodeCheck(sPayCD,sName,nPayNCode,DISPOSE_REAL) = False ) then
				    if ( fnPayCodeCheck(sPayCD,sName,nPayNCode,DISPOSE_REAL,
                         iUsKinKbn, nCngNCode, sNDGCode, sNDNAME) = FALSE ) then
// <136> 2006/07/24 H.Kawato Mod End
				    begin
    					CanChange := False;
	    				Abort;
    				end
	    			else
		    		begin
// <142> 2006/09/22 H.Kawato Add Start
                        if (m_bErrChkFlag = False) then
                        begin
// <142> 2006/09/22 H.Kawato Add End

// <159> 2008/02/29 H.Kawato Add Start
                            // 通知書名寄せ入力値チェック
                            if (HedCsTab.Items.Selected = 3) then
                            begin
                                // 一括名寄せ子の存在Check
                                if ( fnCheckPayNayoseSyu(sPayCD) = True ) then
                                begin
                                	MjsMessageBox(Self, '一括請求の名寄せで登録済です。', mjInformation, mjDefOk);
                                    m_bErrChkFlag := True;                                      // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                                	CanChange := False;
                                	Abort;
                                end;
// <163> ADD-STR
                                // スポット支払支払先として設定された支払先は不可
                                if ( fnCheckIsSpot(sPayCD) = True ) then
                                begin
                                	MjsMessageBox(Self, 'スポット支払支払先として設定されています。'+#13#10+'名寄せ子として設定できません。', mjInformation, mjDefOk);
                                    m_bErrChkFlag := True;                                      // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                                	CanChange := False;
                                	Abort;
                                end;
// <163> ADD-END
                                MemNayose.Edit;
                                MemNayose.FieldByName('PayNCode').AsFloat   := nPayNCode;
                                MemNayose.FieldByName('SName').AsString     := sName;           // 支払先名称
                                if ( m_TRCodeAttr <= 1 ) then
                                	sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
                                MemNayose.FieldByName('BaseHojCode').AsString := sPayCD;	    // 支払先ｺｰﾄﾞ(編集前)
                                // 数値(前0あり)
                                if ( m_TRCodeAttr = 1 ) then
                                begin
                                	strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                                	sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                                	MemNayose.FieldByName('HojCode').AsString := sPayCD;	    // 支払先ｺｰﾄﾞ(前0あり)
                                end;
                            end
                            // 名寄せ入力値チェック
                            else
                            begin
                                sOyaCD  := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('OyaHojCD').AsString;	// 名寄せ親ｺｰﾄﾞ

                                // 一括請求の場合、通知書名寄せの登録チェックを行う
                                if (fnCheckUsKinKbn(sOyaCD) = True) then
                                begin
                                    // 通知書名寄せの存在Check
                                    if ( fnCheckPayNayoseSyu(sPayCD) = True ) then
                                    begin
                                    	MjsMessageBox(Self, '通知書名寄せで登録済です。', mjInformation, mjDefOk);
                                        m_bErrChkFlag := True;                                      // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                                    	CanChange := False;
                                    	Abort;
                                    end;
                                end;
// <159> 2008/02/29 H.Kawato Add End
// <138> 2006/08/16 H.Kawato Add Start ※フォーカス移動前に入力値をチェック
                                // 入力値ﾁｪｯｸ
                                if (fnRecordCheck() = False) then
                                begin
                                    m_bErrChkFlag := True;  // <142> 2006/09/22 H.Kawato Add    // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                                    CanChange     := False;
                                    Abort;
                                end;
// <138> 2006/08/16 H.Kawato Add End

                                // 名寄せ子の存在Check
                                if ( fnCheckPayNayoseInfo(sPayCD, NAYOSE_CHILD) = True ) then
                                begin
                                	MjsMessageBox(Self, '他の名寄せ設定で登録済です。', mjInformation, mjDefOk);
                                    m_bErrChkFlag := True;  // <142> 2006/09/22 H.Kawato Add    // ﾒｯｾｰｼﾞ出力後のｸﾞﾘｯﾄﾞ入力を許可
                                	CanChange := False;
                                	Abort;
                                end
                                else
// <163> ADD-STR
                                // スポット支払支払先として設定された支払先は不可
                                if ( fnCheckIsSpot(sPayCD) = True ) then
                                begin
                                	MjsMessageBox(Self, 'スポット支払支払先として設定されています。'+#13#10+'名寄せ子として設定できません。', mjInformation, mjDefOk);
                                    m_bErrChkFlag := True;
                                	CanChange := False;
                                	Abort;
                                end
                                else
// <163> ADD-END
                                begin
                                	MemNayose.Edit;
                                	MemNayose.FieldByName('PayNCode').AsFloat   := nPayNCode;
                                	MemNayose.FieldByName('SName').AsString     := sName;       // 支払先名称
                                	if ( m_TRCodeAttr <= 1 ) then
                                		sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
                                	MemNayose.FieldByName('BaseHojCode').AsString := sPayCD;	// 支払先ｺｰﾄﾞ(編集前)
                                	// 数値(前0あり)
                                	if ( m_TRCodeAttr = 1 ) then
                                	begin
                                		strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                                		sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                                		MemNayose.FieldByName('HojCode').AsString := sPayCD;	// 支払先ｺｰﾄﾞ(前0あり)
                                	end;
                                end;
                            end;    // <159> Add
                        end;        // <142> Add
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
procedure TJNTCRP004005F.GridNayoseChangeColumn(Sender: TObject;
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
procedure TJNTCRP004005F.GridNayoseChangeNodeEx(Sender: TObject);
var
	lvCODE : String;    // <136> 2006/07/24 H.Kawato Add
begin
{
    // 支払先ｺｰﾄﾞがNullの時
	if ( GridNayose.DataSource.DataSet.FieldByName('HojCode').IsNull ) then
	begin
		CmnStatusBar.SimpleText	 := '';
		GridNayose.FocusedColumn :=	0;			//	ﾌｫｰｶｽのｶﾗﾑ位置を指定
		Exit;
	end;

	if ( m_AcControl = GridNayose ) then
		CmnStatusBar.SimpleText	:= 'F1 名寄せ情報から外す'
	else
		CmnStatusBar.SimpleText := '';
	m_AfterSave.sOyaCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;
}
// <133> 2006/04/18 H.Kawato Add
	m_AfterSave.sOyaCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;

// <138> 2006/08/16 H.Kawato Add Start
    //移動先カラムが名寄せ子かつ名寄せ親が空の時、フォーカスを名寄せ親に移動する
    if ( m_AfterSave.sOyaCD = '' ) and (GridNayose.FocusedColumn = 2) then
        GridNayose.FocusedColumn := 0;
// <138> 2006/08/16 H.Kawato Add End

// <136> 2006/07/24 H.Kawato Add Start
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
       (GridNayose.DataSource.DataSet.FieldByName('PayNCode').AsCurrency =
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
// <138> 2006/08/16 H.Kawato Mod 
//    	GridNayoseCode.DisableEditor    := False;
//    	GridNayoseCode.ReadOnly         := False;
        //子仕入先は更新データでは変更不可
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
// <138> 2006/08/16 H.Kawato Mod 
    end;
// <136> 2006/07/24 H.Kawato Add End

end;

//-----------------------------------------------------------------------------
// NayoseEnter()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : OnEnter
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.NayoseEnter(Sender: TObject);
//begin
{
    m_AcControl := Screen.ActiveControl;

	// 名寄せ一覧
	if ( m_AcControl = GridNayose ) then
	begin
		if ( MemNayose.RecordCount <> 0 ) then
			CmnStatusBar.SimpleText	:= 'F1 名寄せ情報から外す';
	end

	// 名寄せTree
	else if ( m_cACControl = TreeViewNayose ) then
		TreeViewNayoseChange(Sender, TreeViewNayose.Selected);
}
// <169> 2010/07/05 G.Kojima Add
var  iValue : Integer;
begin
    fnGetNayoseInfo();
    if (MemNayose.RecordCount = 0) and ((f2OyaCode.Text <> '') or (f2KoCode.Text <> ''))    then
    begin
        iValue := MjsMessageBoxEX(Self,'該当のデータがありません。新規登録を行いますか？','確認',mjQuestion,mjYesNo,mjDefYes);
        if iValue <> mrYes then
           f2OyaCode.SetFocus;
    end;
end;

// <169> 2010/07/05 G.Kojima Add

//end;

//-----------------------------------------------------------------------------
// NayoseExit()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : OnExit
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.NayoseExit(Sender: TObject);
begin
    CmnStatusBar.SimpleText	:= '';
end;

//-----------------------------------------------------------------------------
// CmnGridKeyDown()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.CmnGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    m_bErrChkFlag := False;     // <142> 2006/09/22 H.Kawato Add    // キー入力時は値のﾁｪｯｸを行う

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

//-----------------------------------------------------------------------------
// DSNayoseStateChange()
//      PARAM   : Sender        TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 状態変更時処理
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.DSNayoseStateChange(Sender: TObject);
begin

    if ( MemNayose.State in [dsInsert] ) then
		MemNayoseHojCode.ReadOnly := False
	else
		MemNayoseHojCode.ReadOnly := True;

	if ( MemNayose.Active ) then
	begin
		if ( MemNayose.RecordCount = 0 ) then
			MemNayoseHojCode.ReadOnly := False;
	end;

end;

//-----------------------------------------------------------------------------
// fnPayCodeCheck()
//      PARAM   : sHojCode  支払先外部ｺｰﾄﾞ
//      VAR     : sRet      支払先名称
//                sPayNCD   支払先内部ｺｰﾄﾞ
//                Mode      実在/合計/名寄せ 区分
//      RETURN  : True : 存在する False : 存在しない
//      MEMO    : 支払先ｺｰﾄﾞの存在Check
//-----------------------------------------------------------------------------
// <136> 2006/07/24 H.Kawato Mod Start
//function  TJNTCRP004005F.fnPayCodeCheck(sHojCode: String; var sRet: String;
//                                 var sPayNCD: Extended; Mode: Integer): Boolean;
function  TJNTCRP004005F.fnPayCodeCheck(sHojCode: String; var sRet: String;
	var nPayNCD: Extended; iMode: Integer; var iUsKinKbn: Integer; var nCngNCode: Extended;
    var sNDGCode: String; var sNDNAME: String): Boolean;
// <136> 2006/07/24 H.Kawato Mod End
var
    DmqData :   TMQuery;
begin

	sRet    :=  '';

	if ( Trim(sHojCode) = '' ) then
	begin
		Result := FALSE;
		Exit;
	end;

	if (m_TRCodeAttr <= 1) then
		sHojCode := Format ('%.16d',[StrToInt64(Trim(sHojCode))]);

    // MQueryの構築
    DmqData := TMQuery.Create(Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
// <136> 2006/07/24 H.Kawato Mod Start 
{
    		SQL.Add('SELECT                 '
                +   '    NCode              '
                +   '   ,GCode              '
                +   '   ,NMK                '
                +   'FROM MTOKUI            '
    		    +   'WHERE (RDelKbn = 0   ) '
                +   '  AND (GCode   = :HC ) '
                +   '  AND (SumKbn <> 9   ) ');
}
    		SQL.Add('SELECT                 '
                +   '    MT.NCode              '
                +   '   ,MT.GCode              '
                +   '   ,MT.NMK                '
                +   '   ,MTS.UsKinKbn          '
                +   '   ,MTP.CngNCode          '
                +   '   ,MTN.GCode as NDGCode  '   // 名寄せ取引先外部ｺｰﾄﾞ
                +   '   ,MTN.NMK   as NDNAME   '   // 名寄せ取引先名称
                +   'FROM MTOKUI as MT         '
                +   'LEFT OUTER JOIN MTOKUI_SEL MTS   '
                +   '   ON (MTS.BaseNCode = MT.NCode and MTS.RecKBN = 2) '
                +   'LEFT OUTER JOIN MTOKUI_PAY MTP   '
                +   '   ON (MTP.BaseNCode = MT.NCode) '
                +   'LEFT OUTER join MTOKUI MTN       '
                +   '   on (MTP.CngNCode = MTN.NCode) '
    		    +   'WHERE (MT.RDelKbn = 0   ) '
                +   '  AND (MT.GCode   = :HC ) '
                +   '  AND (MT.SumKbn <> 9   ) ');
// <136> 2006/07/24 H.Kawato Mod End

    		case iMode of
                // 合計/実在
    			DISPOSE_ALL
// <136> 2006/07/24 H.Kawato Mod
//                    :   SQL.Add('  AND ((SumKbn = 0 and HojyoKbn2 = 1) or SumKbn = 1) ');
                    :   SQL.Add('  AND ((MT.SumKbn = 0 and MT.HojyoKbn2 = 1) or MT.SumKbn = 1) ');
                // 実在
    			DISPOSE_REAL
// <136> 2006/07/24 H.Kawato Mod
//                    :   SQL.Add('  AND (SumKbn = 0 and HojyoKbn2 = 1) ');
                    :   SQL.Add('  AND (MT.SumKbn = 0 and MT.HojyoKbn2 = 1) ');
                // 名寄せ親
    			DISPOSE_NAYOSEOYA
// <136> 2006/07/24 H.Kawato Mod
//                    :   SQL.Add('  AND SumKbn = 1 AND PayRootKbn = 1 ');
                    :   SQL.Add('  AND MT.SumKbn = 1 AND MT.PayRootKbn = 1 ');
    		end;

    		ParamByName('HC').AsString	:= sHojCode;

    		Open ();

    		if ( EOF <> True ) then
    		begin
    			sRet    :=  FieldByName('NMK').AsString;
                nPayNCD :=  FieldByName('NCODE').AsFloat;
// <136> 2006/07/24 H.Kawato Add Start
    			iUsKinKbn:= FieldByName('UsKinKbn').AsInteger;
    			nCngNCode:= FieldByName('CngNCode').AsFloat;
                sNDGCode:=  FieldByName('NDGCode').AsString;
    			sNDNAME :=  FieldByName('NDNAME').AsString;                     
// <136> 2006/07/24 H.Kawato Add End
    			Result  :=  True;
    		end
    		else
    			Result := False;
        end;
    finally
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnDeletePayNayoseInfo()
//      PARAM   : PayNCD    支払先内部ｺｰﾄﾞ
//      VAR     : OyaNCD    名寄せ親内部ｺｰﾄﾞ
//                Mode      実在/合計/名寄せ 区分
//      RETURN  : True : 正常 False : 異常
//      MEMO    : 名寄せ削除処理
//-----------------------------------------------------------------------------
function  TJNTCRP004005F.fnDeletePayNayoseInfo(PayNCD,OyaNCD:Extended; MODE: Integer): Boolean;
var
	nNayoKbn    : Integer;
    DmqData     : TMQuery;
    sCNT        : Integer;
    nUsKinKbn	: Integer;  // <139> Add
    iNayoseCnt  : Integer;  // <159> Add

begin
    Result := FALSE;        // <154> Add

    nNayoKbn := 0;

	case MODE of
		NAYOSE_CHILD    :   nNayoKbn := 1;
		NAYOSE_PARENT   :   nNayoKbn := 2;
		NAYOSE_ALL      :   nNayoKbn := 1;
	end;

    // MQueryの構築
    DmqData := TMQuery.Create( Self );

// ↓<Rel>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, DmqData );

        // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
        // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
        m_cDataModule.BeginTran( m_cDBSelect );
    end
    else
    begin
        // DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
        m_cDataModule.BeginTran (m_cDBSelect);
    end;
// ↑<Rel>

	SessionPractice(C_ST_PROCESS);				// <158>

    try
// ↓<Rel>
        //------------------------------------------------------
        // PayNayoseInfoの削除
        //------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            with ( DmqData ) do
            begin
                // 親会社のHojyoMA_Relを削除
                Close();
                SQL.Clear();
                SQL.Add('update PayNayoseInfo_Rel            ');
                SQL.Add('set RDelKbn_Rel = 1,                ');
                SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
                SQL.Add('where MasterKbn   = :pMstKbn        ');
                SQL.Add(' and  NayoseSyu   = :pNayoseSyu     ');
                SQL.Add(' and  PayNCode    = :pPayNCode      ');
                SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

                ParamByName('pMstKbn'     ).AsInteger := 22;
                ParamByName('pNayoseSyu'  ).AsFloat   := 1;
                ParamByName('pPayNCode'   ).AsFloat   := PayNCD;
                ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( ExecSQL = False ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
                    m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := False;
                    Exit;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(21, JNTSYNC_DELETE) = False ) then
                begin
                    Result := False;
                    Exit;
                end;
            end;
        end
        else
        begin
            with ( DmqData ) do
            begin
                // 選択ﾚｺｰﾄﾞを削除
                Close();
                SQL.Clear();
                SQL.Add('DELETE FROM PayNayoseInfo      '
                    +   'WHERE (MasterKbn = 22)         '
//                    +   '  AND (NayoseSyu = 1)          '
                    +   '  AND (NayoseSyu = :SYU)       '   // <159> Mod
                    +   '  AND (NayoseKbn = :NK)        '
                    +   '  AND (PayNCode  = :GC)        '
                    +   '  AND (NayoseOyaNCode = :NO)   ');

// <159> 2008/02/29 H.Kawato Mod Start
                // 名寄せ種別
                if (HedCsTab.Items.Selected = 3) then       // 通知書名寄せ
                    ParamByName('SYU').AsInteger := 2
                else                                        // 名寄せ
                    ParamByName('SYU').AsInteger := 1;
// <159> 2008/02/29 H.Kawato Mod End

                // 名寄せ区分
                ParamByName('NK').AsInteger := nNayoKbn;
                // 支払先ｺｰﾄﾞ
                ParamByName('GC').AsFloat   := PayNCD;
                // 名寄せ親支払先ｺｰﾄﾞ
                ParamByName('NO').AsFloat   := OyaNCD;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
                    m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := False;
                    Exit;
                end;
            end;
        end;


// ↓<Rel>
        // 親ﾚｺｰﾄﾞのﾁｪｯｸは子DB側で行う(全社のﾚｺｰﾄﾞは子社から削除されない為)
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            DmqData.Close;
            m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );
        end;
// ↑<Rel>
        with ( DmqData ) do
        begin
            // 親ﾚｺｰﾄﾞの削除ﾁｪｯｸ
            Close();
            SQL.Clear();
            SQL.Add('SELECT COUNT(MasterKbn) CNT        '
                +   'FROM PayNayoseInfo                 '
                +   'WHERE (NayoseOyaNCode = :ONCode)   '
                +   '  AND (NayoseSyu      = :pNayoseSyu)'  // <174> ADD
                +   '  AND (NayoseKbn      = 1)         '
                +   '  AND (MasterKbn      = 22)        ');

            ParamByName('ONCode').AsFloat := OyaNCD;
// <174> ADD-STR
            if (HedCsTab.Items.Selected = 3) then           // 通知書名寄せ
                ParamByName('pNayoseSyu').AsInteger := 2
            else                                            // 名寄せ
                ParamByName('pNayoseSyu').AsInteger := 1;
// <174> ADD-END

            Open();

            sCNT := FieldByName('CNT').AsInteger;
        end;

// <159> 2008/02/29 H.Kawato Add Start
        // 名寄せ種別「1:名寄せ情報」の該当ﾚｺｰﾄﾞ件数取得
        with ( DmqData ) do
        begin
            // 親ﾚｺｰﾄﾞの削除ﾁｪｯｸ
            Close();
            SQL.Clear();
            SQL.Add('SELECT COUNT(MasterKbn) CNT        '
                +   'FROM PayNayoseInfo                 '
                +   'WHERE (NayoseOyaNCode = :ONCode)   '
                +   '  AND (NayoseSyu      = 1)         '
                +   '  AND (NayoseKbn      = 1)         '
                +   '  AND (MasterKbn      = 22)        ');

            ParamByName('ONCode').AsFloat := OyaNCD;

            Open();

            iNayoseCnt := FieldByName('CNT').AsInteger;
        end;
// <159> 2008/02/29 H.Kawato Add End

// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            DmqData.Close;
            m_cDataModule.SetDBInfoToQuery( m_SyncMaster.m_cPDBSelect, DmqData );
        end;
// ↑<Rel>


        // 存在しない場合は親のﾚｺｰﾄﾞを削除
        if ( sCNT = 0 ) then
        begin
            //------------------------------------------------------
            // PayNayoseInfoの削除
            //------------------------------------------------------
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                with ( DmqData ) do
                begin
                    // 親会社のHojyoMA_Relを削除
                    Close();
                    SQL.Clear();
                    SQL.Add('update PayNayoseInfo_Rel            ');
                    SQL.Add('set RDelKbn_Rel = 1,                ');
                    SQL.Add('    UpdDateTM   = CURRENT_TIMESTAMP ');
                    SQL.Add('where MasterKbn   = :pMstKbn        ');
                    SQL.Add(' and  NayoseSyu   = :pNayoseSyu     ');
                    SQL.Add(' and  PayNCode    = :pPayNCode      ');
                    SQL.Add(' and  GrpSegNCode = :pGrpSegNCode   ');

                    ParamByName('pMstKbn'     ).AsInteger := 22;
// <159> 2008/02/29 H.Kawato Mod
//                    ParamByName('pNayoseSyu'   ).AsFloat  := 1;
                    if (HedCsTab.Items.Selected = 3) then           // 通知書名寄せ
                        ParamByName('pNayoseSyu').AsInteger := 2
                    else                                            // 名寄せ
                        ParamByName('pNayoseSyu').AsInteger := 1;
// <159> 2008/02/29 H.Kawato Mod
                    ParamByName('pPayNCode'   ).AsFloat   := OyaNCD;
                    ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                    if ( ExecSQL = False ) then
                    begin
                        m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
                        m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                        Result := False;
                        Exit;
                    end;

                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(21, JNTSYNC_DELETE) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
            end
            else
            begin
                with ( DmqData ) do
                begin
                    Close();
                    SQL.Clear();
                    SQL.Add('DELETE FROM PayNayoseInfo      '
                        +   'WHERE (MasterKbn = 22)         '
//                        +   '  AND (NayoseSyu = 1)          '
                        +   '  AND (NayoseSyu = :SYU)       '   // <159> Mod
                        +   '  AND (NayoseKbn = 2)          '
                        +   '  AND (PayNCode  = :ONCode)    ');

// <159> 2008/02/29 H.Kawato Add Start
                    if (HedCsTab.Items.Selected = 3) then       // 通知書名寄せ
                        ParamByName('SYU').AsInteger := 2
                    else                                        // 名寄せ
                        ParamByName('SYU').AsInteger := 1;
// <159> 2008/02/29 H.Kawato Add End
                    ParamByName('ONCode').AsFloat := OyaNCD;

                    if ( not ExecSQL() ) then
                    begin
                        m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);
                        m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                        Result := False;
                        Exit;
                    end;
                end;
            end;

            //------------------------------------------------------
            // MTOKUI_PAYの更新
            //------------------------------------------------------
            with ( DmqData ) do
            begin
// <143> 2006/09/26 H.Kawato Add Start
                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI_PAY SET '
                    +   'RendoNCode = 0 '
                    +   ',UpdDateTM = :nUpdDateTM '                     // <147> Add
                    +   ',UpdTantoNCode = :nUpdTantoNCode '             // <147> Add
                    +   'WHERE (BaseNCode = :ONCode)');

                ParamByName('ONCode').AsFloat         := OyaNCD;
                ParamByName('nUpdDateTM').Value       := Now();         // <147> Add
                ParamByName('nUpdTantoNCode').AsFloat := m_TantoNCode;  // <147> Add

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := FALSE;
                    Exit;
                end;
// <143> 2006/09/26 H.Kawato Add End
            end;

            //↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            begin
                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_PAY) = False ) then
                begin
                    Result := False;
                    Exit;
                end;

                // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,OyaNCD,DmqData) then
                begin
                    Result := False;
                    Exit;
                end;
            end;
            //↑<Rel>
        end;

// <159> 2008/02/29 H.Kawato Add Start
        // 通知書名寄せは販売テーブルは更新しない
        if (HedCsTab.Items.Selected <> 3) then
        begin
// <159> 2008/02/29 H.Kawato Add End
            with ( DmqData ) do
            begin
                //------------------------------------------------------
                // MTOKUI_SELの更新
                //------------------------------------------------------


                // MTokui_SELの請求情報の変更（名寄せ構成から外す）
                // 名寄せ子の場合   親子ﾌﾗｸﾞ        （12:各店別子⇒0:単独）
                //                  請求区分        （2:各店別請求各店別支払⇒1:親一括請求一括支払）
                //                  請求先内部ｺｰﾄﾞ  （親内部ｺｰﾄﾞ⇒自身の内部ｺｰﾄﾞ）
                // 名寄せ親の場合   親子ﾌﾗｸﾞ        （11:各店別親⇒0:単独）
                //                  請求区分        （2:各店別請求各店別支払⇒1:親一括請求一括支払）

                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI_SEL SET          '
                    +   '    OyakoFLg   =   :OyakoFLg   '
//                  +   '   ,UsKinKbn   =   :UsKinKbn   '               // <136> 2006/07/24 H.Kawato Del
                    +   '   ,SeiNCode   =   :NCode      '
// <138> 2006/08/16 H.Kawato Mod
//                  +   'WHERE (BaseNCode = :NCode)     ');
                    +   'WHERE (BaseNCode = :NCode)     '
                    +   '  and (RecKBN = 2)             ');             // 2:仕入先情報
// <138> 2006/08/16 H.Kawato Mod
            
                ParamByName('OyakoFLg').AsInteger   :=  0;
//              ParamByName('UsKinKbn').AsInteger   :=  1;              // <136> 2006/07/24 H.Kawato Del
                ParamByName('NCode').AsFloat        :=  PayNCD;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := False;
                    Exit;
                end;

                //↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,PayNCD,DmqData) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                //↑<Rel>
            end;
        end;    // <159> Add

        with ( DmqData ) do
        begin
            // <139> 2006/08/31 H.Kawato Add St
            // 請求区分ﾁｪｯｸ
            Close();
            SQL.Clear();
            SQL.Add('select                                 '
                +   '    mt.PayRootKbn      m_PAYRootKbn    '   // 債務名寄せ区分 (mtokui)
                +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分       (mtokui_sel)
                +   'from MTOKUI mt                         '
                +   'left outer join MTOKUI_SEL se ON       '
                +   '   (se.BaseNCode = mt.NCode)           '
                +   'where (mt.RDelKbn = 0)                 '
                +   '  and (mt.NCode = :ONCode)             '
                +   '  and (se.RecKbn = 2)                  ');

            ParamByName('ONCode').AsFloat := OyaNCD;

            Open();

            nUsKinKbn := FieldByName('se_UsKinKbn').AsInteger;
            // <139> 2006/08/31 H.Kawato Add Ed

// <159> 2008/02/29 H.Kawato Add Start
            // 名寄せ種別「1:名寄せ情報」ﾚｺｰﾄﾞがない場合、MTOKUI_SELの更新を行う
// <174> MOD-STR
//          if (iNayoseCnt = 0) then
            if (iNayoseCnt = 0) and (HedCsTab.Items.Selected <> 3) then
// <174> MOD-END
            begin
                //------------------------------------------------------
                // MTOKUI_SELの更新
                //------------------------------------------------------
                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI_SEL SET      '
                +   '    OyakoFLg   =   :OyakoFLg   '
                +   '   ,SeiNCode   =   :NCode      '
                +   'WHERE (BaseNCode = :NCode)     '
                +   '  and (RecKBN = 2)             ');         // 2:仕入先情報

                ParamByName('OyakoFLg').AsInteger   :=  0;
                ParamByName('NCode').AsFloat        :=  OyaNCD;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := FALSE;
                    Exit;
                end;

                //↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,OyaNCD,DmqData) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                //↑<Rel>
            end;
// <159> 2008/02/29 H.Kawato Add End

// <174> MOD-STR
//          if ( sCNT = 0 ) then
            if ( sCNT = 0 ) and (HedCsTab.Items.Selected <> 3) then
// <174> MOD-END
            begin
// <159> 2008/02/29 H.Kawato Del Start  // 名寄せ情報ﾚｺｰﾄﾞがない場合(上記)へ移動
{
                //------------------------------------------------------
                // MTOKUI_SELの更新
                //------------------------------------------------------
                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI_SEL SET      '
                +   '    OyakoFLg   =   :OyakoFLg   '
//              +   '   ,UsKinKbn   =   :UsKinKbn   '           // <136> 2006/07/24 H.Kawato Del
                +   '   ,SeiNCode   =   :NCode      '
// <138> 2006/08/16 H.Kawato Mod
//              +   'WHERE (BaseNCode = :NCode)     ');
                +   'WHERE (BaseNCode = :NCode)     '
                +   '  and (RecKBN = 2)             ');         // 2:仕入先情報
// <138> 2006/08/16 H.Kawato Mod

                ParamByName('OyakoFLg').AsInteger   :=  0;
//              ParamByName('UsKinKbn').AsInteger   :=  1;      // <136> 2006/07/24 H.Kawato Del
                ParamByName('NCode').AsFloat        :=  OyaNCD;

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := FALSE;
                    Exit;
                end;

                //↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_SEL) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,OyaNCD,DmqData) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                //↑<Rel>
}
// <159> 2008/02/29 H.Kawato Del End

                //------------------------------------------------------
                // MTOKUIの更新
                //------------------------------------------------------
                // <138> 2006/08/16 H.Kawato Add Start
                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI SET          '
// <139> 2006/08/31 H.Kawato Mod
//              +   '    PayRootKbn =   0           '       // 債務名寄せ区分
                +   '    PayRootKbn =   :PayRootKbn '       // 債務名寄せ区分
                +   '   ,PEndKaisu  =   0           '       // 締日回数
                +   '   ,PCloseDay1 =   0           '       // 締日１
                +   '   ,PCloseDay2 =   0           '       // 締日２
                +   '   ,PCloseDay3 =   0           '       // 締日３
                +   '   ,PayMonth1  =   0           '       // サイクル１
                +   '   ,PayMonth2  =   0           '       // サイクル２
                +   '   ,PayMonth3  =   0           '       // サイクル３
                +   '   ,PHolidayKbn1 = 0           '       // 休日区分１
                +   '   ,PHolidayKbn2 = 0           '       // 休日区分２
                +   '   ,PHolidayKbn3 = 0           '       // 休日区分３
                +   '   ,PayDay1    =   0           '       // 支払日１
                +   '   ,PayDay2    =   0           '       // 支払日２
                +   '   ,PayDay3    =   0           '       // 支払日３
                +   'WHERE (NCode = :NCode)         ');

                ParamByName('NCode').AsFloat        :=  OyaNCD;

                // <139> 2006/08/31 H.Kawato Add
                if ( nUsKinKbn = 1 ) then
                    ParamByName('PayRootKbn').AsInteger	:=  0
                else
                    ParamByName('PayRootKbn').AsInteger	:=  1;
                // <139> 2006/08/31 H.Kawato Add

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := False;
                    Exit;
                end;

                //↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,OyaNCD,DmqData) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                //↑<Rel>


                //------------------------------------------------------
                // MTOKUI_PAYの更新
                //------------------------------------------------------
                Close();
                SQL.Clear();
                SQL.Add('UPDATE MTOKUI_PAY SET      '
                +   '    CngNCode   =   0           '
                +   ',   UpdDateTM  = :nUpdDateTM '                     // <147> Add
                +   ',   UpdTantoNCode = :nUpdTantoNCode '              // <147> Add
                +   'WHERE (BaseNCode = :NCode)     ');

                ParamByName('NCode').AsFloat          := OyaNCD;
                ParamByName('nUpdDateTM').Value       := Now();         // <147> Add
                ParamByName('nUpdTantoNCode').AsFloat := m_TantoNCode;  // <147> Add

                if ( not ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                    Result := False;
                    Exit;
                end;

                //↓<Rel>
                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                begin
                    // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                    if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_MTOKUI_PAY) = False ) then
                    begin
                        Result := False;
                        Exit;
                    end;

                    // 更新されたときはSecHojyoDispInfoのﾒﾝﾃを行う。
                    if not fnUpdSecHojyoDispInfo(1,Self,m_SyncMaster,OyaNCD,DmqData) then
                    begin
                        Result := False;
                        Exit;
                    end;
                end;
                //↑<Rel>

                // <138> 2006/08/16 H.Kawato Add End
            end;
        end;

        // ｺﾐｯﾄ(反映)
        m_cDataModule.Commit (m_cDBSelect);
        //↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            // 親会社DBに対してｺﾐｯﾄを実行する
            m_cDataModule.Commit( m_SyncMaster.m_cPDBSelect );
        //↑<Rel>

        // 正常終了
        Result := TRUE;
    finally
		SessionPractice(C_ED_PROCESS);			// <158>

        if Result = False then
        begin
            // ﾛｰﾙﾊﾞｯｸ(破棄)
            m_cDataModule.Rollback(m_cDBSelect);
            //↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                // 親会社DBに対してﾛｰﾙﾊﾞｯｸを実行する
                m_cDataModule.Rollback( m_SyncMaster.m_cPDBSelect );
            //↑<Rel>
        end;

        DmqData.Close();
        DmqData.Free();
    end;

end;

//-----------------------------------------------------------------------------
// fnRecordCheck()
//      PARAM   :
//      VAR     :
//      RETURN  : True : 正常 False : 異常
//      MEMO    : 名寄せ入力値ﾁｪｯｸ
//-----------------------------------------------------------------------------
// <136> 2006/07/24 H.Kawato Mod
//function    TJNTCRP004005F.fnRecordCheck(): Boolean;
function    TJNTCRP004005F.fnRecordCheck(const bGoukei: Boolean = False): Boolean;
var
	sPayCD		: String;
	sName		: String;
	strFormat	: String;
    nPayNCode   : Extended;

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

// <136> 2006/07/24 H.Kawato Add Start
    iUsKinKbn : Integer;
    nCngNCode : Extended;
    sNDGCode  : String;
    sNDNAME   : String;
// <136> 2006/07/24 H.Kawato Add End

    //-----------------------------------------------------------------------------
    // 仕入先の存在ﾁｪｯｸ、締日のﾁｪｯｸ <111>
    //
    // PARAM    : sCd   : Md=0の場合 外部ｺｰﾄﾞ、Md=1の場合 内部ｺｰﾄﾞ
    //          : sNm   : 取得した仕入先の簡略名称
    //          : sNCd  : 取得した仕入先の内部ｺｰﾄﾞ
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


// <Rel>        m_cDataModule.SetDBInfoToQuery(m_cDBSelect, lvQry);
// ↓<Rel>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
            m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, lvQry)
        else
            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, lvQry);
// ↑<Rel>

        try
        	with (lvQry) do
        	begin
        		Close;
        		SQL.Clear;
        		SQL.Add('select                    '
                    +   '    NCode                 '
                    +   '   ,GCode                 '
                    +   '   ,NMK                   '
                    +   '   ,PEndKaisu             '	        // 締日回数
                    +   '   ,PCloseDay1            '	        // 締日1
                    +   '   ,PCloseDay2            '	        // 締日2
                    +   '   ,PCloseDay3            '            // 締日3
                    +   '   ,PayMonth1             '            // ｻｲｸﾙ1
                    +   '   ,PayMonth2             '            // ｻｲｸﾙ2
                    +   '   ,PayMonth3             '            // ｻｲｸﾙ3
                    +   '   ,PayDay1               '            // 支払日1
                    +   '   ,PayDay2               '            // 支払日2
                    +   '   ,PayDay3               '            // 支払日3
                    +   '   ,Isnull(PHolidayKbn1,0) as HolKbn1' //<132> 休日区分1
                    +   '   ,Isnull(PHolidayKbn2,0) as HolKbn2' //<132> 休日区分2
                    +   '   ,Isnull(PHolidayKbn3,0) as HolKbn3' //<132> 休日区分3
                    +   '   ,TrSeiKbn              '            // 取引先請求区分
                    +   'from MTOKUI               '
                    +   '     left outer join MTOKUI_SEL se         '
                    +   '     on (BaseNCode = NCode and RecKBN = 2) '
        		    +   'where (RDelKbn   = 0)     '
                    +   '  and (SumKbn    = 0)     '
                    +   '  and (HojyoKbn2 = 1)     ');

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
// <160> Mod
{                        if FieldByName('TrSeiKbn').AsInteger <> 0 then
                        begin
                            // 通常請求以外の場合はｴﾗｰとする
                            Result := -2;
                        end
                        else begin
                            nNCd     := FieldByName('NCODE').AsFloat;           // 内部ｺｰﾄﾞ
                            sNm      := FieldByName('NMK').AsString;            // 簡略名称
                            iKaisu   := FieldByName('PEndKaisu').AsInteger;     // 締日回数
                            iSime1   := FieldByName('PCloseDay1').AsInteger;    // 締日1
                            iSime2   := FieldByName('PCloseDay2').AsInteger;    // 締日2
                            iSime3   := FieldByName('PCloseDay3').AsInteger;    // 締日3
                            iCycle1  := FieldByName('PayMonth1').AsInteger;	    // ｻｲｸﾙ1
                            iCycle2  := FieldByName('PayMonth2').AsInteger;	    // ｻｲｸﾙ2
                            iCycle3  := FieldByName('PayMonth3').AsInteger;	    // ｻｲｸﾙ3
                            iKaisyu1 := FieldByName('PayDay1').AsInteger;	    // 支払日1
                            iKaisyu2 := FieldByName('PayDay2').AsInteger;	    // 支払日2
                            iKaisyu3 := FieldByName('PayDay3').AsInteger;	    // 支払日3

                            iHolKbn1 := FieldByName('HolKbn1').AsInteger;	    //<132> 休日区分1
                            iHolKbn2 := FieldByName('HolKbn2').AsInteger;	    //<132> 休日区分2
                            iHolKbn3 := FieldByName('HolKbn3').AsInteger;	    //<132> 休日区分3

                            Result := 0;
                        end;
}
                        nNCd     := FieldByName('NCODE').AsFloat;           // 内部ｺｰﾄﾞ
						sNm      := FieldByName('NMK').AsString;            // 簡略名称
						iKaisu   := FieldByName('PEndKaisu').AsInteger;     // 締日回数
						iSime1   := FieldByName('PCloseDay1').AsInteger;    // 締日1
						iSime2   := FieldByName('PCloseDay2').AsInteger;    // 締日2
						iSime3   := FieldByName('PCloseDay3').AsInteger;    // 締日3
						iCycle1  := FieldByName('PayMonth1').AsInteger;	    // ｻｲｸﾙ1
						iCycle2  := FieldByName('PayMonth2').AsInteger;	    // ｻｲｸﾙ2
						iCycle3  := FieldByName('PayMonth3').AsInteger;	    // ｻｲｸﾙ3
						iKaisyu1 := FieldByName('PayDay1').AsInteger;	    // 支払日1
						iKaisyu2 := FieldByName('PayDay2').AsInteger;	    // 支払日2
						iKaisyu3 := FieldByName('PayDay3').AsInteger;	    // 支払日3

						iHolKbn1 := FieldByName('HolKbn1').AsInteger;	    // 休日区分1
                        iHolKbn2 := FieldByName('HolKbn2').AsInteger;	    // 休日区分2
						iHolKbn3 := FieldByName('HolKbn3').AsInteger;	    // 休日区分3

						// 販売ﾗｲｾﾝｽあり、または締日制限あり かつ
						if	(m_iCloseDayFlg = 0) and
							(FieldByName('TrSeiKbn').AsInteger <> 0) then
                            // 通常請求以外の場合はｴﾗｰとする
                            Result := -2
						else
                            Result := 0;
// <160> Mod
                        if  (SimeChkFlg =1 ) then Result := 0;   // <164> ADD
                    end
                    // 同一締日ﾁｪｯｸ
                    else begin
                        if (iSime1   = FieldByName('PCloseDay1').AsInteger) and
                           (iSime2   = FieldByName('PCloseDay2').AsInteger) and
                           (iSime3   = FieldByName('PCloseDay3').AsInteger) and
                           (iCycle1  = FieldByName('PayMonth1').AsInteger)  and
                           (iCycle2  = FieldByName('PayMonth2').AsInteger)  and
                           (iCycle3  = FieldByName('PayMonth3').AsInteger)  and

                           (iHolKbn1 = FieldByName('HolKbn1').AsInteger)  and   //<132>条件追加 休日区分1
                           (iHolKbn2 = FieldByName('HolKbn2').AsInteger)  and   //<132>条件追加 休日区分2
                           (iHolKbn3 = FieldByName('HolKbn3').AsInteger)  and   //<132>条件追加 休日区分3

                           (iKaisyu1 = FieldByName('PayDay1').AsInteger)    and
                           (iKaisyu2 = FieldByName('PayDay2').AsInteger)    and
                           (iKaisyu3 = FieldByName('PayDay3').AsInteger)    then
                			Result :=  0
                        else
// <160> Mod
//                			Result := -3;
							// 販売ﾗｲｾﾝｽあり、または締日制限あり
							if	(m_iCloseDayFlg = 0) then
    	                        Result := -3
							else
            	                Result := 0;
// <160> Mod
                        if  (SimeChkFlg =1 ) then Result := 0;   // <164> ADD
                    end;
        		end
        		else begin
        			Result := -9;
                end;
            end;
        finally
            lvQry.Free();
        end;

    end;

begin

	Result := True;

    // 子仕入先ｺｰﾄﾞを取得
// <136> 2006/07/24 H.Kawato Mod
//    sPayCD := GridNayose.DataSource.DataSet.FieldByName('HojCode').AsString;
    if bGoukei then
    	sPayCD := f1NayoseOyaCode.Text
    else
	    sPayCD := GridNayose.DataSource.DataSet.FieldByName('HojCode').AsString;
// <136> 2006/07/24 H.Kawato Mod

    // 子仕入先ｺｰﾄﾞの存在Check
//    if ( fnPayCodeCheck(sPayCD,sName,sPayNCode,DISPOSE_REAL) = False ) then
    iRet := lfnGetMTOKUI_Info(sPayCD, sName, nPayNCode, 0);
    if (iRet <> 0) then
    begin
        if iRet = -2 then
    		MjsMessageBox(Self, '通常請求以外は、名寄せ設定はできません。', mjInformation, mjDefOk);

        Result := False;
        Exit;
    end;

    // 名寄せ入力が新規ﾚｺｰﾄﾞの場合
// <136> 2006/07/24 H.Kawato Mod
//	if (MemNayose.State in [dsInsert]) then
    if bGoukei or (MemNayose.State in [dsInsert]) then
	begin
        // 名寄せ子の存在Check(既に名寄せ情報に存在していたらｴﾗｰ)
        if (fnCheckPayNayoseInfo(sPayCD, NAYOSE_CHILD) = True) then
        begin
// <136> 2006/07/24 H.Kawato Mod
//    		MjsMessageBox(Self, '他の名寄せ設定で登録済です。', mjInformation, mjDefOk);
    		MjsMessageBox(Self, '既に名寄せ設定で登録済です。', mjInformation, mjDefOk);
            Result := False;
            Exit;
        end
        else
        begin
            // 名寄せ子の実績存在ﾁｪｯｸ　<115>
// <Rel>            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);
// ↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, StdProc3)
            else
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);
// ↑<Rel>

            // PRC_MA0150_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
            with StdProc3 do
            begin
                ParamByName('@pTRNCD').AsFloat    := nPayNCode;
                ParamByName('@pSDYMD').AsDateTime := uvSelSys.GetOKstDymd;
                ParamByName('@pEDYMD').AsDateTime := uvSelSys.GetOKedDymd;
                ParamByName('@pSNYM').AsInteger   := uvSelSys.GetOKstNym;
                ParamByName('@pENYM').Asinteger   := uvSelSys.GetOKedNym;
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
                ExecProc;

// <164> MOD-STR
//              if ParamByName('@RETURN_VALUE').AsInteger <> 0 then
                if (ParamByName('@RETURN_VALUE').AsInteger <> 0) and (SimeChkFlg <> 1) then
// <164> MOD-END
                begin
                    MjsMessageBox(Self, 'この仕入先は伝票が入力済みなので'#13#10
                                    + '名寄せ設定はできません。', mjInformation, mjDefOk);
                    Result := False;
                    Exit;
                end;
            end;

// <136> 2006/07/24 H.Kawato Mod Start
{
            MemNayose.Edit;
            MemNayose.FieldByName('PayNCode').AsFloat := nPayNCode;     // 子仕入先内部ｺｰﾄﾞ
            MemNayose.FieldByName('SName').AsString   := sName;			// 子仕入先名称

            if (m_TRCodeAttr <= 1) then
                sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);

            MemNayose.FieldByName('BaseHojCode').AsString := sPayCD;	// 子仕入先ｺｰﾄﾞ(編集前)

            // 数値(前0あり)
            if (m_TRCodeAttr  = 1) then
            begin
                strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                MemNayose.FieldByName('HojCode').AsString := sPayCD;	// 子仕入先ｺｰﾄﾞ(前0あり)
            end;
}
		    if not bGoukei then
            begin
                MemNayose.Edit;
                MemNayose.FieldByName('PayNCode').AsFloat := nPayNCode;     // 子仕入先内部ｺｰﾄﾞ
                MemNayose.FieldByName('SName').AsString   := sName;			// 子仕入先名称

                if (m_TRCodeAttr <= 1) then
                    sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);

                MemNayose.FieldByName('BaseHojCode').AsString := sPayCD;	// 子仕入先ｺｰﾄﾞ(編集前)

                // 数値(前0あり)
                if (m_TRCodeAttr  = 1) then
                begin
                    strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                    MemNayose.FieldByName('HojCode').AsString := sPayCD;	// 子仕入先ｺｰﾄﾞ(前0あり)
                end;
            end;
        end;
    end
    else
    begin
        if (m_AfterSave.sOyaCD <> GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString) then
        begin

            // 仕入先を名寄せ親代替仕入先に指定している親の存在チェック
            Qry := TMQuery.Create(Self);
// <Rel>            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
// ↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qry)
            else
                m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
// ↑<Rel>
            try
                with Qry do
                begin
                    Close;
                    SQL.Clear;
	                SQL.Add('SELECT '								);
	                SQL.Add('    TOK.GCode '						);
	                SQL.Add('FROM '									);
	                SQL.Add('    MTOKUI_PAY AS MP '                 );
	                SQL.Add('    INNER JOIN MTOKUI AS TOK '			);
	                SQL.Add('        ON  TOK.NCode = MP.BaseNCode ' );
	                SQL.Add('        AND TOK.RDelKbn = 0 '			);
	                SQL.Add('    INNER JOIN MTOKUI AS TOK2 '		);
	                SQL.Add('        ON  TOK2.NCode = MP.CngNCode ' );
	                SQL.Add('WHERE '								);
	                SQL.Add('    TOK2.GCode = :pCODE '				);

					if (m_TRCodeAttr <= 1) then
		                ParamByName('pCODE').AsString := Format ('%.16d',[StrToInt64(Trim(sPayCD))])
                    else
		                ParamByName('pCODE').AsString := Trim(sPayCD);

                    Open;

                    if not (EOF) then
                    begin
                   		MjsMessageBox(Self, 'この仕入先は他の仕入先の代替仕入先に指定されている為'#13#10
                                        + '名寄せ親を変更できません。', mjInformation, mjDefOk);
                        Result := FALSE;
                        Exit;
                    end;
                end;
            finally
                Qry.Free();
            end;
// <136> 2006/07/24 H.Kawato Mod End
        end;
	end;

	// 名寄せ親仕入先ｺｰﾄﾞの取得
// <136> 2006/07/24 H.Kawato Mod
//	sPayCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;
    if bGoukei then
    	sPayCD := f0CODE.Text
    else
		sPayCD := GridNayose.DataSource.DataSet.FieldByName('OyaHojCD').AsString;
// <136> 2006/07/24 H.Kawato Mod

	if (sPayCD <> '') then
	begin
		// 名寄せ親仕入先ｺｰﾄﾞの存在Check
// <136> 2006/07/24 H.Kawato Mod
//		if (fnPayCodeCheck(sPayCD, sName, nPayNCode, DISPOSE_NAYOSEOYA) = False) then
		if (fnPayCodeCheck(sPayCD, sName, nPayNCode, DISPOSE_NAYOSEOYA,
            iUsKinKbn, nCngNCode, sNDGCode, sNDNAME) = FALSE) then
// <136> 2006/07/24 H.Kawato Mod
		begin
			Result := False;
			Exit;
		end
		else
		begin
// <136> 2006/07/24 H.Kawato Mod Start
{
			MemNayose.Edit;
			MemNayose.FieldByName('OyaNCode').AsFloat := nPayNCode;             // 親仕入先内部ｺｰﾄﾞ
			MemNayose.FieldByName('OyaName').AsString := sName;			        // 名寄せ親仕入先名称

			if (m_TRCodeAttr <= 1) then
				sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
			MemNayose.FieldByName('OyaBaseHojCD').AsString := sPayCD;	        // 名寄せ親仕入先ｺｰﾄﾞ(編集前)

			// 数値(前0あり)
			if (m_TRCodeAttr  = 1) then
			begin
				strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
				sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
				MemNayose.FieldByName('OyaHojCD').AsString := sPayCD;	        // 名寄せ親仕入先ｺｰﾄﾞ(前0あり)
			end;
}
		    if not bGoukei then
            begin
                MemNayose.Edit;
                MemNayose.FieldByName('OyaNCode').AsFloat := nPayNCode;         // 親仕入先内部ｺｰﾄﾞ
                MemNayose.FieldByName('OyaName').AsString := sName;			    // 名寄せ親仕入先名称

                if (m_TRCodeAttr <= 1) then
                    sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);
                MemNayose.FieldByName('OyaBaseHojCD').AsString := sPayCD;	    // 名寄せ親仕入先ｺｰﾄﾞ(編集前)

                // 数値(前0あり)
                if (m_TRCodeAttr  = 1) then
                begin
                    strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
                    sPayCD    := Format(strFormat,[StrToInt64(Trim(sPayCD))]);
                    MemNayose.FieldByName('OyaHojCD').AsString := sPayCD;	    // 名寄せ親仕入先ｺｰﾄﾞ(前0あり)
                end;
            end;
// <136> 2006/07/24 H.Kawato Mod End

            // 子仕入先の締日ﾁｪｯｸ
            Qry := TMQuery.Create(Self);
// <Rel>            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
// ↓<Rel>
            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qry)
            else
                m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qry);
// ↑<Rel>
            try
                // この親を持つ子を取得
                with Qry do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select PayNCode from PAYNayoseInfo  ' +
                            'where (RDelKbn        = 0)      and ' +
                            '      (NayoseSyu      = 1)      and ' +        // 名寄せ情報 <159> Add
                            '      (NayoseKbn      = 1)      and ' +        // 名寄せ子
                            '      (NayoseOyaNCode = :PrtCd)     ');        // 名寄せ親

                    ParamByName('PrtCd').AsFloat := nPayNCode;

                    Open;

                    // 親仕入先の締日情報をｾｯﾄ、実績ﾏｽﾀの作成 <112>
                    if (EOF) then
                    begin
                        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
// <136> 2006/07/24 H.Kawato Mod Start
//                        m_cDataModule.BeginTran(m_cDBSelect);
                        if not bGoukei then
                        begin
	                        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
	                        m_cDataModule.BeginTran(m_cDBSelect);
// ↓<Rel>
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                                m_cDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
                        end;
// <136> 2006/07/24 H.Kawato Mod End

                        try
                            // 締日情報のｾｯﾄ
                            Close;
                            SQL.Clear;
                            SQL.Add('update MTOKUI set         ' +
                                    'PEndKaisu  = :PEndKaisu,  ' +          // 締日回数
                                    'PCloseDay1 = :PCloseDay1, ' +          // 締日1
                                    'PCloseDay2 = :PCloseDay2, ' +          // 締日2
                                    'PCloseDay3 = :PCloseDay3, ' +          // 締日3
                                    'PayMonth1  = :PayMonth1,  ' +          // ｻｲｸﾙ1
                                    'PayMonth2  = :PayMonth2,  ' +          // ｻｲｸﾙ2
                                    'PayMonth3  = :PayMonth3,  ' +          // ｻｲｸﾙ3
                                    'PHolidayKbn1 = :HolKbn1,  ' +          //<132> 休日区分1
                                    'PHolidayKbn2 = :HolKbn2,  ' +          //<132> 休日区分2
                                    'PHolidayKbn3 = :HolKbn3,  ' +          //<132> 休日区分3
                                    'PayDay1    = :PayDay1,    ' +          // 支払日1
                                    'PayDay2    = :PayDay2,    ' +          // 支払日2
                                    'PayDay3    = :PayDay3     ' +          // 支払日3
                                    'where NCode = :NCode      ');

                            // 子の締日情報をｾｯﾄ
                            ParamByName('PEndKaisu').AsInteger  := iKaisu;
                            ParamByName('PCloseDay1').AsInteger := iSime1;
                            ParamByName('PCloseDay2').AsInteger := iSime2;
                            ParamByName('PCloseDay3').AsInteger := iSime3;
                            ParamByName('PayMonth1').AsInteger  := iCycle1;
                            ParamByName('PayMonth2').AsInteger  := iCycle2;
                            ParamByName('PayMonth3').AsInteger  := iCycle3;
                            ParamByName('HolKbn1').AsInteger    := iHolKbn1;    //<132> 休日区分1
                            ParamByName('HolKbn2').AsInteger    := iHolKbn2;    //<132> 休日区分2
                            ParamByName('HolKbn3').AsInteger    := iHolKbn3;    //<132> 休日区分3
                            ParamByName('PayDay1').AsInteger    := iKaisyu1;
                            ParamByName('PayDay2').AsInteger    := iKaisyu2;
                            ParamByName('PayDay3').AsInteger    := iKaisyu3;
                            ParamByName('NCode').AsFloat        := nPayNCode;

                            ExecSQL;

                            // 実績ﾏｽﾀの作成
// <Rel>                            m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc 4);
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                            begin
                                // 子社にて_SELのﾄﾘｶﾞを起動する為にMTOKUI_SELを更新する
                                Close;
                                SQL.Clear;
                                SQL.Add('update MTOKUI_SEL set         ' +
                                        'UpdDateTM = CURRENT_TIMESTAMP ' +
                                        'where BaseNCode = :NCode');
                                ParamByName('NCode').AsFloat := nPayNCode;

                                ExecSQL;

                                m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, StdProc4)
                            end
                            else
                            begin
                                m_cDataModule.SetDBInfoToQuery(m_cDBSelect, StdProc4);
                            end;

                            // PRC_MA0150_103
                            with StdProc4 do
                            begin
                                ParamByName('@pTRNCD')   .AsFloat   := nPayNCode;   // 仕入先ｺｰﾄﾞ
                                ParamByName('@pSEIKBN_B').AsInteger := 0;           // 変更前請求区分
                                ParamByName('@pSEIKBN_A').AsInteger := 0;           // 変更後請求区分
								FetchOptions.Items := FetchOptions.Items - [fiMeta];
                                ExecProc;

                                if ParamByName('@RETURN_VALUE').AsInteger <> 0 then
                                    Abort;
                            end;

                            // ｺﾐｯﾄ(反映)
// <136> 2006/07/24 H.Kawato Mod
//                            m_cDataModule.Commit(m_cDBSelect);
	                        if not bGoukei then
                            begin
	                            // ｺﾐｯﾄ(反映)
	                            m_cDataModule.Commit(m_cDBSelect);
// ↓<Rel>
                                if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                                    m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
                            end;
// <136> 2006/07/24 H.Kawato Mod
                        except
                            MjsMessageBox(Self, '親仕入先の更新に失敗しました。', mjError, mjDefOk);
                            // ﾛｰﾙﾊﾞｯｸ(破棄)
// <136> 2006/07/24 H.Kawato Mod
//                            m_cDataModule.Rollback(m_cDBSelect);
	                        if not bGoukei then
                            begin
	                            // ﾛｰﾙﾊﾞｯｸ(破棄)
	                            m_cDataModule.Rollback(m_cDBSelect);
// ↓<Rel>
                            if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
                                m_cDataModule.Rollback(m_SyncMaster.m_cPDBSelect);
// ↑<Rel>
                            end;
// <136> 2006/07/24 H.Kawato Mod
                            Result := False;
                            Exit;
                        end;
                    end
                    else
                    // 子仕入先の締日ﾁｪｯｸ
                    begin
                        // 販売ﾗｲｾﾝｽあり、または締日制限あり
                        if (m_iCloseDayFlg = 0) then    // <148> Add ※if文の追加
                        begin
                            sPayCD := FloatToStr(FieldByName('PayNCode').AsFloat);
                            if (lfnGetMTOKUI_Info(sPayCD, sName, nPayNCode, 1) = -3) then
                            begin
                                MjsMessageBox(Self, '締日情報の異なる名寄せ設定はできません。', mjInformation, mjDefOk);
                                Result := False;
                                Exit;
                            end;
                        end;                            // <148> Add
                    end;
                end;
            finally
                Qry.Free();
            end;
		end;
	end;
end;

//-----------------------------------------------------------------------------
// BDeleteClick()
//      PARAM   : Sender    TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    : 削除ﾎﾞﾀﾝｸﾘｯｸ時処理(親のﾎﾞﾀﾝ継承)
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.BDeleteClick(Sender: TObject);
var
	cMessageRec     :   TMJSMsgRec;
	strHojCode      :   String;
	strMessage      :   String;
//	sHojCD		    :   String;                 // <159> Del
//	iSelect		    :   Integer;
    sPayNCode       :   Extended;
    sOyaNCode       :   Extended;
    RendoInitRet    :   Integer;                // <133> Add
    ProgRendoParam  :   TJNTPAYProgRendoParam;  // <133> Add
// <136> 2006/07/24 H.Kawato Add Start
    nCngNCode       :   Extended;
    Bol			    :	Boolean;
    Qry             :	TMQuery;
    nCount		    :	Integer;
// <136> 2006/07/24 H.Kawato Add End
    nCount2		    :	Integer;                // <138> Add
    RendoInitRetG   :   Integer;                // <#GAI> ADD
begin

//    iSelect         :=  0;
// <136> 2006/07/24 H.Kawato Add Start
    strHojCode  :=  '';
    strMessage  :=  '';
    nCngNCode   :=  0;
// <136> 2006/07/24 H.Kawato Add End

    sPayNCode       :=  0;                      // <133> Add
    sOyaNCode       :=  0;                      // <133> Add

	if ( Screen.ActiveControl.Name = GridNayose.Name ) then
	begin
		strHojCode  :=  GridNayose.DataSource.DataSet.FieldByName('HojCode')  .AsString;
		strMessage  :=  GridNayose.DataSource.DataSet.FieldByName('SName')    .AsString;
        sPayNCode   :=  GridNayose.DataSource.DataSet.FieldByName('PayNCode') .AsFloat;
        sOyaNCode   :=  GridNayose.DataSource.DataSet.FieldByName('OyaNCode') .AsFloat;
        nCngNCode   :=  GridNayose.DataSource.DataSet.FieldByName('CngNCode') .AsFloat; // <136> Add
//		iSelect	    :=  0;
	end;

    if ( Trim (strHojCode) = '' ) then Exit;

// <159> 2008/02/29 H.Kawato Del Start  以降使用していない為コメントとする
//    sHojCD := strHojCode;
//	if ( m_TRCodeAttr <= 1 ) then
//		strHojCode := Format ('%.16d', [StrToInt64 (Trim (strHojCode))]);
// <159> 2008/02/09 H.Kawato Del End

// <159> 2008/02/29 H.Kawato Add Start
    // 通知書名寄せの場合、削除前チェックは行わない
    if (HedCsTab.Items.Selected = 3) then
    begin
        if ( fnDeletePayNayoseInfo(sPayNCode,sOyaNCode,NAYOSE_CHILD) = False ) then Abort;                

        // 再読込み
        fnGetNayoseInfo();
        MemNayose.Refresh;
        MjsSetFocus(Self, GridNayose.Name);
        Exit;
    end;
// <159> 2008/02/29 H.Kawato Add End

// <136> 2006/07/24 H.Kawato Add Start 
    if sPayNCode <> 0 then
    begin
        // 名寄せページで名寄せ代替親仕入先に指定されている行は削除不可にする
        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select count(TOKP.BaseNCode) as CNT from MTOKUI_PAY as TOKP');
            SQL.Add('inner join MTOKUI as TOK on TOKP.BaseNCode = TOK.NCode and TOK.RDelKbn=0');
            SQL.Add('where TOKP.CngNCode = :pCODE');
            ParamByName('pCODE').AsFloat := sPayNCode;

            Open;

            nCount := GetFld('CNT').AsInteger;
        end;
        Qry.Close;

// <138> 2006/08/16 H.Kawato Add Start  
        // 名寄せ代替親仕入先以外の名寄せを取得する
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select count(PayNCode) as CNT from PayNayoseInfo');
            SQL.Add('where MasterKbn = 22 and NayoseSyu = 1 and NayoseKbn = 1');
            SQL.Add('  and NayoseOyaNCode = :pOYACODE and PayNCode <> :pCODE');
            ParamByName('pOYACODE').AsFloat := sOyaNCode;
            ParamByName('pCODE'   ).AsFloat := sPayNCode;

            Open;

            nCount2 := GetFld('CNT').AsInteger;
        end;
        Qry.Close;
// <138> 2006/08/16 H.Kawato Add End
        Qry.Free;

// <138> 2006/08/16 H.Kawato Mod Start
{
        if nCount > 0 then
        begin
            MjsMessageBox(Self, 'この仕入先は名寄せ親代替仕入先に指定されているので'#13#10
                            + '名寄せ情報を削除できません。', mjInformation, mjDefOk);
            Exit;
        end;
}
        if (nCount > 0) and (nCount2 > 0) then
        begin
            MjsMessageBox(Self, '名寄せ親代替仕入先に指定されている名寄せ情報を削除する場合は'#13#10
                            + '他の子仕入先の名寄せ情報を先に削除してください。', mjInformation, mjDefOk);
            Exit;
        end;
// <138> 2006/08/16 H.Kawato Mod End
    end;

    // 選択ﾚｺｰﾄﾞの削除が可能かﾁｪｯｸ
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdProc3);

	// 仕入先
    // PRC_MA0150_011(関連ﾚｺｰﾄﾞ有無ﾁｪｯｸ)
    with StdProc3 do
    begin
        //仕入先が名寄せ親代替仕入先の場合は名寄せ親でチェックする
    	if sPayNCode = nCngNCode then
	        ParamByName('@pTRNCD')  .AsFloat:=  sOyaNCode
        else
	        ParamByName('@pTRNCD')  .AsFloat:=  sPayNCode;

        ParamByName('@pSDYMD')  .AsDateTime :=  uvSelSys.GetOKstDymd;
        ParamByName('@pEDYMD')  .AsDateTime :=  uvSelSys.GetOKedDymd;
        ParamByName('@pSNYM')   .AsInteger  :=  uvSelSys.GetOKstNym;
        ParamByName('@pENYM')   .AsInteger  :=  uvSelSys.GetOKedNym;
		FetchOptions.Items := FetchOptions.Items - [fiMeta];
        ExecProc();
        Bol :=  (ParamByName('@RETURN_VALUE').AsInteger = 0);
    end;

// <164> MOD-STR
//  if ( not Bol ) then
    if ( not Bol ) and (SimeChkFlg <> 1) then 
// <164> MOD-END
    begin
        MjsMessageBox(Self, 'この仕入先は伝票が入力済みなので'#13#10
                        + '名寄せ情報を削除できません。', mjInformation, mjDefOk);
        Exit;
    end;
// <136> 2006/07/24 H.Kawato Add End

	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 4);

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
// <133> 2006/04/18 H.Kawato Add 進捗連動
        ProgRendoParam.pAppRecord    := Pointer(m_pRec);
        ProgRendoParam.iOptCd        := 54;             // オプションコード・債務処理       //<137> Add
        ProgRendoParam.iPrgCd        := 210100;         // プログラムコード・支払情報登録   //<137> Add
        ProgRendoParam.dPAYCode      := sPayNCode;
        ProgRendoParam.iSateiChgKbn  := 0;      // 変更無し
        ProgRendoParam.iNayoseChgKbn := 1;      // 変更あり
        ProgRendoParam.iSyoriKbn     := 0;      // 支払情報登録系処理
        ProgRendoParam.iSystemCode   := 1; 		// 債務管理	<162>

// <#GAI> ADD-STR
        // 外貨進捗連動
        ProgRendoParamG.pAppRecord   := Pointer(m_pRec);
        ProgRendoParamG.iOptCd       := 61;             // オプションコード・外貨債務処理
        ProgRendoParamG.iPrgCd       := 210100;         // プログラムコード・支払情報登録
        ProgRendoParamG.dPAYCode     := sPayNCode;
        ProgRendoParamG.iNayoseChgKbn:= 1;              // 変更あり
        ProgRendoParamG.iSyoriKbn    := 0;              // 支払情報登録系処理
// <#GAI> ADD-END

        try         // <134> Add

            RendoInitRet := m_PayProgRendo.Init(ProgRendoParam);
// <133> 2006/04/18 H.Kawato Add
            RendoInitRetG := m_PayProgRendoG.Init(ProgRendoParamG);     // <#GAI> ADD

// <133> 2006/04/18 H.Kawato Mod 進捗連動
{
        if ( fnDeletePayNayoseInfo(sPayNCode,sOyaNCode,NAYOSE_CHILD) = False ) then Abort;

        // 再読込み
        fnGetNayoseInfo();
        MemNayose.Refresh;
}
            if (RendoInitRet = 1) or (RendoInitRet = 0) then
            begin
                if ( fnDeletePayNayoseInfo(sPayNCode,sOyaNCode,NAYOSE_CHILD) = False ) then Abort;

                // 再読込み
                fnGetNayoseInfo();
                MemNayose.Refresh;
            end;
// <133> 2006/04/18 H.Kawato Mod

// <133> 2006/04/18 H.Kawato Add
            if RendoInitRet = 1 then
                m_PayProgRendo.Exec;
// <#GAI> ADD-STR
            if RendoInitRetG = 1 then
                m_PayProgRendoG.Exec;
// <#GAI> ADD-END

        finally     // <134> Add
    		m_PayProgRendo.Term;
            m_PayProgRendoG.Term;       // <#GAI> ADD
        end;        // <134> Add
// <133> 2006/04/18 H.Kawato Add
    end;
    MjsSetFocus(Self, GridNayose.Name);         // <136> Add
end;

//-----------------------------------------------------------------------------
// fnMemDeleteNayose()
//      PARAM   : Kbn
//                sCD
//      VAR     :
//      RETURN  :
//      MEMO    : Memdata上の削除
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnMemDeleteNayose(Kbn: Byte; sCD: String);
var
	bFlg	:   Boolean;
begin

	if ( MemNayose.RecordCount = 0 ) then Exit;

	bFlg := False;
	MemNayose.First;

	while Not( MemNayose.Eof ) do
	begin

		if ( Kbn = DISPOSE_REAL ) then	// 実在
		begin
			if ( MemNayose.FieldByName('BaseHojCode').AsString = sCD ) then
			begin
				MemNayose.Delete;
				break;
			end;
		end
		else						// 合計
		begin
			if ( MemNayose.FieldByName('OyaBaseHojCD').AsString = sCD ) then
			begin
				MemNayose.Delete;
				bFlg := True;
				break;
			end;
		end;
		MemNayose.Next;
	end;

	if ( bFlg = True ) then
		fnMemDeleteNayose(Kbn,sCD);

end;
//-----------------------------------------------------------------------------
//  名称を取得
//-----------------------------------------------------------------------------
Function TJNTCRP004005F.fnGetNAME(pCODE: String; pMKBN, pAttr: Integer; var RName: String ): Boolean;
var
    Qry     : TMQuery;
    lvCode  : String;
begin
    RName  := '';		// <170> Add
// <169-1> Add-STR
    if (Trim(pCODE) = '') then
    begin
        Result := True;
        Exit;
    end;
// <170> Del start
{
    if ((Screen.ActiveControl.Name = f2OyaCode.Name) or
        (Screen.ActiveControl.Name = f2KoCode.Name) or
        (Screen.ActiveControl.Name = GridNayose.Name)) = False then
    begin
        Result := True;
        Exit;
    end;
}
// <170> Del end
// <169-1> Add-END

    Result := False;
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

            if      pMKBN = 22 then                         // 取引先
            begin
                SQL.Add('select NMK from MTOKUI  ');
                SQL.Add('where RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode = :strGCode ');
                SQL.Add(' and TemplateKbn = 0');            // <105>
                SQL.Add(' and HojyoKbn2 = 1');
            end
            // <169> 2010/07/06 G.Kojima Add
            else if      pMKBN = 221 then                   // 取引先(合計)
            begin
                SQL.Add('select NMK from MTOKUI  ');
                SQL.Add('where RDelKbn=0 ');
                SQL.Add(' and SumKbn = 1 AND GCode = :strGCode ');
                SQL.Add(' and TemplateKbn = 0');
                SQL.Add(' and HojyoKbn2 = 1');
                SQL.Add(' and PayRootKbn = 1');
            end
// <143> 2006/09/26 H.Kawato Add Start
            else if pMKBN = 23 then                         // 連動得意先
            begin
                SQL.Add('select NMK from MTOKUI  ');
                SQL.Add('where RDelKbn=0 ');
                SQL.Add(' and (SumKbn = 0 or SumKbn = 1)');
                SQL.Add(' and GCode = :strGCode ');
                SQL.Add(' and TemplateKbn = 0');            // <105>
                SQL.Add(' and HojyoKbn1 = 1');
            end
// <143> 2006/09/26 H.Kawato Add End
            else if pMKBN = 25 then                         // 担当者
            begin
                SQL.Add('select M.SimpleName NMK from HAPSC H   ');
                SQL.Add('left outer join MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('where (H.GCODE = :strGCode) AND (M.RDelKBN = 0)  AND (H.kbn in (2, 3))');
            end
            else if pMKBN = 41 then                         // 部門
            begin
                SQL.Add('select SimpleName NMK from HOJYOMA  ');
                SQL.Add('where MasterKbn = :MKBN AND RDelKbn = 0 ');
                SQL.Add(' and SumKbn = 0 AND GCode = :strGCode ');
                SetFld('MKBN').AsInteger := 41;

                // <175> Add start
				//検索エクスプローラから選択した場合およびDBから取得した場合は、内部コードも検索条件とする。
                if m_BumonNcodeEx > 0 then
                begin
                    SQL.Add(' and NCode=:pNCode ');
                    SetFld('pNCode').AsFloat := m_BumonNcodeEx;
                end;
				SQL.Add(' ORDER BY TEndDate DESC ');
                // <175> Add end
            end;
            SetFld('strGCode').AsString	:= lvCODE;

            Open;

            if EOF = False then
            begin
                Result := True;
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
Function TJNTCRP004005F.fnGetNCODE(pCODE:String;pMKBN,pAttr:Integer):Extended;
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
                SQL.Add(' and   GCode=:strGCode ');
            end
            else if pMKBN = 25 then  //担当者
            begin
                SQL.Add('SELECT  M.NCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (H.GCODE = :strGCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
                SQL.Add('SELECT NCODE FROM HOJYOMA  ');
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND GCode=:strGCode ');
                SQL.Add(' ORDER BY TEndDate DESC');					// <175> Add
                SetFld('MKBN').AsInteger	:= 41;
            end;
            SetFld('strGCode').AsString	:= lvCODE;

            Open;						// ｸｴﾘの開始

            if EOF = False then
                Result  := FieldByName('NCode').asFloat;

            // <175> Add start
            // 部門の場合で、検索EXPを使用した場合は、検索EXPから取得した内部コードを返す
            if (pMKBN = 41) and (m_BumonNcodeEx > 0) then  Result := m_BumonNcodeEx;
            // <175> Add end

        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//-----------------------------------------------------------------------------
//  外部コード取得
//-----------------------------------------------------------------------------
Function TJNTCRP004005f.fnGetGCODE(pCODE:Extended;pMKBN:Integer):String;
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
            if pMKBN = 22 then                  //取引先
            begin
                SQL.Add('SELECT GCODE FROM MTOKUI ');
                SQL.Add('where  RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
            end
// <143> 2006/09/26 H.Kawato Add Start
            else if pMKBN = 23 then             //連動得意先
            begin
                SQL.Add('SELECT GCODE FROM MTOKUI ');
                SQL.Add('where  RDelKbn=0 ');
                SQL.Add(' and (SumKbn = 0 OR SumKbn = 1) AND NCode=:pCode ');
            end
// <143> 2006/09/26 H.Kawato Add End
            else if pMKBN = 25 then             //担当者
            begin
                SQL.Add('SELECT  H.GCODE  FROM HAPSC H   ');
                SQL.Add('LEFT OUTER JOIN MOS_OFFICE_STAFF M  ON (M.NCODE = H.NCODE)');
                SQL.Add('WHERE (M.NCODE = :pCode) AND (M.RDelKBN = 0)          ');
            end
            else if pMKBN = 41 then
            begin
            	// <175> Mod start
                //SQL.Add('SELECT GCODE FROM HOJYOMA  ');
                SQL.Add('SELECT GCODE,SimpleName FROM HOJYOMA  ');
                // <175> Mod end
                SQL.Add('where  MasterKbn = :MKBN AND RDelKbn=0 ');
                SQL.Add(' and SumKbn = 0 AND NCode=:pCode ');
                SetFld('MKBN').AsInteger	:= 41;
                m_BumonNcodeEx := pCode;    //<175> Add DBから取得した部門内部コードを記憶する。(部門名称を正しく取得するため）
            end;
			ParamByName ('pCode').AsFloat  := pCODE;
            Open;						        // ｸｴﾘの開始

            if EOF = False then
                Result := FieldByName('GCODE').asString;
            if  pMKBN = 41   then m_BumonNMkEX :=  FieldByName('SimpleName').asString;   // <175> Add
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;

end;
//=============================================================================
//  名寄せ親代替仕入先コードの制御
//=============================================================================
procedure TJNTCRP004005F.cbPayRootKbnClick(Sender: TObject);
var
    nCngNCode   : Extended;             // <143> Add
begin
    nCngNCode   := 0;                   // <143> Add
// <136> 2006/07/24 H.Kawato Mod 
//    f1NayoseOyaCode.Text    := '';
//    f1NayoseNM.Caption      := '';
    f1SKYKBN.Value		    := 0;
    f1SKYKBNNM.Caption      := '';
// <136> 2006/07/24 H.Kawato Mod

    if (uvDaiKbn = True)             and
       (cbPayRootKbn.Checked = True) then
    begin
// <136> 2006/07/24 H.Kawato Mod
//        NayoseOyaLabel.Enabled  := True;
//        f1NayoseNM.Enabled      := True;
//        f1NayoseOyaCode.Enabled := True;
        SeikyuKbnLabel.Enabled  := TRUE;
        f1SKYKBN.Enabled      	:= TRUE;
        f1SKYKBNNM.Enabled 		:= TRUE;
        f1SKYKBNChange(f1SKYKBN);
// <136> 2006/07/24 H.Kawato Mod
// <143> 2006/09/26 H.Kawato Add Start
        //「連動取引先」の使用可/不可チェック
        if ( Trim(f1NayoseOyaCode.text) <> '' ) then
            nCngNCode   := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);

        if ( f1SKYKBN.Value = 1 ) and   // 親一括請求一括支払
           ( nCngNCode <> 0 ) and       // 名寄せ親代替仕入先の登録あり
//           ( m_bMankiChkFlg ) and       // 期日指定振込満期データなし // <149> Del
           ( m_bRenAdoptFlg ) and       // 連動得意先採用済チェック
           ( m_bSKNLicense  ) then      // 債権ﾗｲｾﾝｽﾁｪｯｸ
        begin
            LblRendouCode.Enabled := True;
            f1RendouCode.Enabled  := True;
            f1RendouNM.Enabled    := True;
        end
        else
        begin
            LblRendouCode.Enabled := False;
            f1RendouCode.Enabled  := False;
            f1RendouNM.Enabled    := False;
        end;
// <143> 2006/09/26 H.Kawato Add End
    end
    else
    begin
// <136> 2006/07/24 H.Kawato Mod
//        NayoseOyaLabel.Enabled  := False;
//        f1NayoseNM.Enabled      := False;
//        f1NayoseOyaCode.Enabled := False;
        SeikyuKbnLabel.Enabled  := FALSE;
        f1SKYKBN.Enabled      	:= FALSE;
        f1SKYKBNNM.Enabled 		:= FALSE;
        f1SKYKBNChange(f1SKYKBN);
// <136> 2006/07/24 H.Kawato Mod
// <143> 2006/09/26 H.Kawato Add Start
        LblRendouCode.Enabled   := False;
        f1RendouCode.Enabled    := False;
        f1RendouNM.Enabled      := False;
// <143> 2006/09/26 H.Kawato Add End
    end;

// <143> 2006/09/26 H.Kawato Add Start
    if (f1RendouCode.Enabled = False) then
    begin
        if ( m_TRCodeAttr <> 2 ) then
        begin
            if ( f1RendouCode.InputFlag = FALSE ) then
                    f1RendouCode.Zero    :=  TRUE
            else    f1RendouCode.Zero    :=  FALSE;
        end
        else
            f1RendouCode.Zero := FALSE;

        f1RendouCode.InputFlag	:= True;
        f1RendouCode.Text		:= '';
        f1RendouNM.Caption      := '';
    end;
// <143> 2006/09/26 H.Kawato Add End

end;
//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004005F.ArrowClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;
//    i           : Integer;

begin

    CompName := TComponent(Sender).Name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := m_pRec;                         // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @m_cDBSelect;                   // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     := m_cComArea.SystemArea.SysColorD;

    // 仕入先
     if (Sender = f0CODE) or (Sender = f1NayoseOyaCode) then
    begin
// <152> 2007/05/15 H.Kawato Mod
//        lvExpSend.MasterKbn     := 24;                      // ﾏｽﾀ区分
        lvExpSend.MasterKbn     := 22;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
//        lvExpSend.TBarNM        := LblTRCODE.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//        lvExpSend.TableName     := 'MTOKUI';
//        lvExpSend.TrRootCaption := LblTRCODE.Caption;

// <152> 2007/05/15 H.Kawato Mod Start
{
        if (Sender = f1NayoseOyaCode) then
            lvExpSend.WhereStr  := 'RDelKBN = 0 and SumKBN = 0'
                                 + ' and TemplateKbn = 0'   // <105>
        else
            lvExpSend.WhereStr  := 'RDelKBN = 0 and SumKBN = ' + IntToStr(HedCsTab.Items.Selected)
                                 + ' and TemplateKbn = 0';  // <105>
}
        if (Sender = f1NayoseOyaCode) then
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 0'
                                 + ' and MTOKUI.Hojyokbn2 = 1'
                                 + ' and MTOKUI.TemplateKbn = 0'   // <105>
        else
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = ' + IntToStr(HedCsTab.Items.Selected)
                                 + ' and MTOKUI.Hojyokbn2 = 1'
                                 + ' and MTOKUI.TemplateKbn = 0';  // <105>
// <152> 2007/05/15 H.Kawato Mod End

// <153> 2007/05/15 H.Kawato Add Start
        lvExpSend.TableName := 'MTOKUI join MTOKUI_PAY on (MTOKUI.NCode = MTOKUI_PAY.BaseNCode)';
        lvExpSend.SearchSection[4].S_Disp := 1;
        lvExpSend.SearchSection[4].S_FieldName := 'MTOKUI_PAY.Tel1';
        lvExpSend.SearchSection[4].S_Caption := '電話番号';

        lvExpSend.SearchSection[5].S_Disp := 0;

        lvExpSend.SearchSection[6].S_Disp := 0;

        lvExpSend.SearchSection[7].S_Disp := 1;
        lvExpSend.SearchSection[7].S_FieldName := 'MTOKUI_PAY.Ads1';
        lvExpSend.SearchSection[7].S_Caption := '住所(上段)';

        lvExpSend.SearchSection[8].S_Disp := 1;
        lvExpSend.SearchSection[8].S_FieldName := 'MTOKUI_PAY.Ads2';
        lvExpSend.SearchSection[8].S_Caption := '住所(下段)';
// <153> 2007/05/15 H.Kawato Add End
    end

// <169> 2010/07/06 G.Kojima Add
    else if (Sender = f2OyaCode) or (Sender = f2koCode) then
    begin

        lvExpSend.MasterKbn := 22;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn  := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo := 1;                       // ﾊﾟﾀｰﾝNO

        // 名寄せ親仕入先アイテムの検索exp起動時引数のセット
        if Sender = f2OyaCode then
        begin
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 1'
                                + ' and MTOKUI.Hojyokbn2 = 1'
                                + ' and MTOKUI.TemplateKbn = 0'
                                + ' and MTOKUI.PayRootKbn = 1 ';
        end

        // 名寄せ子仕入先アイテムの検索exp起動時引数のセット
        else if Sender = f2koCode then
        begin
            lvExpSend.WhereStr  := 'MTOKUI.RDelKBN = 0 and MTOKUI.SumKBN = 0'
                                + ' and MTOKUI.Hojyokbn2 = 1'
                                + ' and MTOKUI.TemplateKbn = 0';
        end;

        lvExpSend.TableName := 'MTOKUI join MTOKUI_PAY on (MTOKUI.NCode = MTOKUI_PAY.BaseNCode)';
        lvExpSend.SearchSection[4].S_Disp := 1;
        lvExpSend.SearchSection[4].S_FieldName := 'MTOKUI_PAY.Tel1';
        lvExpSend.SearchSection[4].S_Caption := '電話番号';

        lvExpSend.SearchSection[5].S_Disp := 0;

        lvExpSend.SearchSection[6].S_Disp := 0;

        lvExpSend.SearchSection[7].S_Disp := 1;
        lvExpSend.SearchSection[7].S_FieldName := 'MTOKUI_PAY.Ads1';
        lvExpSend.SearchSection[7].S_Caption := '住所(上段)';

        lvExpSend.SearchSection[8].S_Disp := 1;
        lvExpSend.SearchSection[8].S_FieldName := 'MTOKUI_PAY.Ads2';
        lvExpSend.SearchSection[8].S_Caption := '住所(下段)';
    end
// <169> End

// <143> 2006/09/26 H.Kawato Add Start
    // 連動得意先
    else if Sender = f1RendouCode then
    begin
// <152> 2007/05/15 H.Kawato Mod
//        lvExpSend.MasterKbn     := 23;                      // ﾏｽﾀ区分
        lvExpSend.MasterKbn     := 22;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'MTOKUI.RDelKBN = 0 '
                                    + 'and MTOKUI.TemplateKbn = 0 '
                                    + 'and MTOKUI.NYKRootKbn in (0, 1) '
                                    + 'and MTOKUI.HojyoKbn1 = 1 '
// <150> 2007/05/07 H.Kawato Mod Start
{
                                    + 'and not EXISTS( '                        // 債権で名寄せ子に登録されている取引先は入力不可
                                    + 'select * from CRDNayoseInfo AS CRD '
                                    + 'where CRD.NknNCode = MTOKUI.NCode '
                                    + 'and MTOKUI.NykRootKbn = 0 '
                                    + 'and CRD.NayoseSyu = 1 '
                                    + 'and CRD.MasterKbn = 22 )'
}
                                    + 'and not EXISTS( '                        // 債権一括請求の名寄せ子、債権各店別請求の名寄せ親は入力不可
                                    + 'select * from CRDNayoseInfo as CRD '
                                    + 'inner join MTOKUI_SEL as SEL '
                                    + 'on  SEL.BaseNCode = CRD.NknNCode '
                                    + 'and SEL.RecKbn = 1 '
                                    + 'and (SEL.OyakoFlg = 2 or SEL.OyakoFlg = 3 or SEL.OyakoFlg = 11) '
                                    + 'where CRD.NknNCode = MTOKUI.NCode '
                                    + 'and CRD.NayoseSyu = 1 '
                                    + 'and CRD.MasterKbn = 22)'
// <150> 2007/05/07 H.Kawato Mod End
                                    + 'and not EXISTS( '                        // 既に連動得意先が登録されている取引先は入力不可
                                    + 'select * from MTOKUI_PAY AS MP '
                                    + 'where MP.BaseNCode = MTOKUI.NCode '
                                    + 'and MP.RendoNCode <> 0 )'
                                    + 'and MTOKUI.NCode <> ' + FloatToStr(m_TRNCode);

// <153> 2007/05/15 H.Kawato Add Start
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
// <153> 2007/05/15 H.Kawato Add End
    end
// <143> 2006/09/26 H.Kawato Add End
    // 部門
    // <175> Mod start
    //else if Sender = f1BMCODE then
    else if (Sender = f1BMCODE) or (Sender = f1BmnCode) then
    // <175> Mod end
    begin
        lvExpSend.MasterKbn     := 41;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
//        lvExpSend.TBarNM        := LblBMCODE.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//        lvExpSend.TableName     := 'HOJYOMA';
//        lvExpSend.TrRootCaption := LblBMCODE.Caption;
        lvExpSend.WhereStr      := 'SumKbn = 0 and RDelKBN = 0';
    end
    // 担当者
    else if Sender = f1TNCODE then
    begin
        lvExpSend.MasterKbn     := 25;                      // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
//        lvExpSend.TBarNM        := LblTNCODE.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//        lvExpSend.TableName     := 'HAPSC';
//        lvExpSend.TrRootCaption := LblTNCODE.Caption;

        // 仕入先担当者
        lvExpSend.WhereStr      := ' (kbn in (2, 3)) ';
    end
    // 仕入伝票ﾌｫｰﾑ
    else if Sender = f1USDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''sr00''';
    end
    // 支払通知書ﾌｫｰﾑ
    else if Sender = f1SSDENPFM then
    begin
        lvExpSend.MasterKbn     := 9140;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 6;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        lvExpSend.WhereStr      := 'PrgId = ''st00''';
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);

    // ｷｬﾝｾﾙ
    if iExpRtn <>1 then
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

        if Sender = f1NayoseOyaCode then
            f1NayoseOyaCode.InputFlag := False;

        if Sender = f1TNCODE then
            f1TNCODE.InputFlag := False;

        if Sender = f1BMCODE then
            f1BMCODE.InputFlag := False;
        //<122> --- Ed ---

// <143> 2006/09/26 H.Kawato Add
        if Sender = f1RendouCode then
            f1RendouCode.InputFlag := False;
// <143> 2006/09/26 H.Kawato Add

// <172> ADD-END
        if Sender = f2OyaCode then
            f2OyaCode.InputFlag := False;

        if Sender = f2KoCode then
            f2KoCode.InputFlag := False;
// <172> ADD-STR

// <175> Add start
        if Sender = f1BmnCode then
        begin
            f1BmnCode.InputFlag := False;
            m_BumonNcodeEx := lvExpRecv.Ncode;
            m_BumonNMKEx   := lvExpRecv.Nmk;
        end;
// <175> Add end

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
procedure TJNTCRP004005F.GridClmBtnClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;

begin
// <136> 2006/07/24 H.Kawato Add Start
    if ( GridNayose.FocusedColumn = 2 ) and ( MemNayose.State <> dsInsert ) then
    begin
        Exit;
    end;
// <136> 2006/07/24 H.Kawato Add End

    CompName := TComponent(Sender).Name;

    fnJNTExpMakeParam(@lvExpSend);                          // ﾊﾟﾗﾒｰﾀ初期設定

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := m_pRec;                         // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @m_cDBSelect;                   // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     := m_cComArea.SystemArea.SysColorD;
    lvExpSend.MasterKbn  := 24;                             // ﾏｽﾀ区分
    lvExpSend.ModulKbn   := 0;                              // ﾓｼﾞｭｰﾙ区分
    lvExpSend.PatternNo  := 1;                              // ﾊﾟﾀｰﾝNO
    case GridNayose.FocusedColumn of
        0:
            lvExpSend.WhereStr := 'MTOKUI.Hojyokbn2 = 1 and MTOKUI.RDelKBN = 0 and MTOKUI.SumKbn = 1 and MTOKUI.PayRootKbn = 1 and MTOKUI.TemplateKbn = 0';
        2:
            lvExpSend.WhereStr := 'MTOKUI.Hojyokbn2 = 1 and MTOKUI.RDelKBN = 0 and MTOKUI.SumKbn = 0 and MTOKUI.TemplateKbn = 0';
    end;
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        if lvExpRecv.GCode <> '' then
        begin
            MemNayose.Edit;
            case GridNayose.FocusedColumn of
                0:								//
                begin
                    MemNayoseOyaHojCD.AsString	:=  lvExpRecv.GCode;
                    MemNayoseOyaName.AsString	:=	lvExpRecv.NMK;				//	名称
                end;
                2:								//
                begin
                    MemNayoseHojCode.AsString	:=  lvExpRecv.GCode;
                    MemNayoseSName.AsString	    :=	lvExpRecv.NMK;				//	名称
                end
            end
        end;
        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
		abort;
    end;

end;
//-----------------------------------------------------------------------------
//     <100>fnSetFncType
//-----------------------------------------------------------------------------
procedure TJNTCRP004005f.fnSetFncType(pKBN:Integer);
begin
    uvFncInfo.Caption[0] := '';
    uvFncInfo.Caption[1] := '';
    uvFncInfo.Caption[2] := '';
    uvFncInfo.Caption[3] := '';
    uvFncInfo.Caption[4] := '';
    uvFncInfo.Caption[5] := '';

// <136> 2006/07/24 H.Kawato Mod
//    if pKBN = 1 then
    if (pKBN = 1) and (HedCsTab.Items.Selected = 0) then
        // ｸﾘｱ
        uvFncInfo.Caption[6] := 'F7 ﾃﾝﾌﾟﾚｰﾄ'
    else
        uvFncInfo.Caption[6] := '';

    uvFncInfo.Caption[7] := '';

// <148> 2007/04/06 H.Kawato Add Start
    // 名寄せタブ、かつ販売ライセンスなし
    if (HedCsTab.Items.Selected = 1) and
// <161> MOD-STR
//     (not CheckModuleLicense(m_pRec,FXLicense.SEL_HAN)) then
       (not CheckModuleLicense(m_pRec,FXLicense.SEL_SHI)) then  // 仕入先ライセンスに変更
// <161> MOD-END
    begin
        // 名寄せ締日制限解除区分チェック
        if fnChkCloseDayKbn() then
        begin
            if (m_iCloseDayFlg = 0) then
                uvFncInfo.Caption[7] := 'F8 締日制限解除'
            else
                uvFncInfo.Caption[7] := 'F8 締日制限';
        end;
    end;
// <148> 2007/04/06 H.Kawato Add End

    uvFncInfo.Action[0]  := nil;
    uvFncInfo.Action[1]  := nil;
    uvFncInfo.Action[2]  := nil;
    uvFncInfo.Action[3]  := nil;
    uvFncInfo.Action[4]  := nil;
    uvFncInfo.Action[5]  := nil;
// <129>↓ｺﾒﾝﾄｱｳﾄ
{    if uvDispFlg = 1 then
        uvFncInfo.Action[6]  := nil
    else
}
// <129>↑
    uvFncInfo.Action[6]  := AcTemplate;
// <148> 2007/04/06 H.Kawato Mod
//    uvFncInfo.Action[7]  := nil;
    uvFncInfo.Action[7]  := AcCloseDay;

end;
//-----------------------------------------------------------------------------
//     <148>fnSetFncEnabled
//-----------------------------------------------------------------------------
procedure TJNTCRP004005f.fnSetFncEnabled();
begin
    // 名寄せタブ、かつ販売ライセンスなし
    if (HedCsTab.Items.Selected = 1) and
// <161> MOD-STR
//     (not CheckModuleLicense(m_pRec,FXLicense.SEL_HAN)) then
       (not CheckModuleLicense(m_pRec,FXLicense.SEL_SHI)) then  // 仕入先ライセンスに変更
// <161> MOD-END
    begin
        MSPFunctionBar.SetFuncEnabled(8, True);

// <161> DEL-STR
//        if (m_iCloseDayFlg = 1) then            // F8:「締日制限」
//        begin
//            if not fnChkPayNayoseInfo() then    // 名寄せあり
//                MSPFunctionBar.SetFuncEnabled(8, False);
//        end;
// <161> DEL-END
    end;
// <156> 2007/08/16 H.Kawato Add Start
    // 実在タブ、かつ決算確定後
    if (HedCsTab.Items.Selected = 0) and (uvDispFlg = 1) then
        MSPFunctionBar.SetFuncEnabled(7, False)
    else if (HedCsTab.Items.Selected = 0) then
        MSPFunctionBar.SetFuncEnabled(7, True);
// <156> 2007/08/16 H.Kawato Add End
end;
//-----------------------------------------------------------------------------
//     ファンクションでの処理　<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin
    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
        uvFncInfo.Action[FuncNo-1].Execute;
end;
//-----------------------------------------------------------------------------
//     ファンクションの処理実行　<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.AcTemplateExecute(Sender: TObject);
begin

    if uvTempFlg then
       uvTempFlg := False
    else
    begin
        uvTempFlg   := True;
        f0CODE.Text := '';
        f1NAME.Text := '';

        fnChkTRCODE;
        fnRecGet(f0CODE.text);

        if f1POSTNO1.Enabled = False then
            Exit;

// <129>↓
        // 支払通知書ﾌｫｰﾑへ移動
//        MjsSetFocus(Self, 'f1SSDENPFM')
        if f1SSDENPFM.CanFocus then
            MjsSetFocus(Self, 'f1SSDENPFM')
        else
            MjsSetFocus(Self, 'MBitBtnCancel');
// <129>↑
    end;

    TempMode.Visible := uvTempFlg;

end;
//-----------------------------------------------------------------------------
//     ファンクションボタンの表示・非表示<100>
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.f0CODEExit(Sender: TObject);
begin

    fnSetFncType(0);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
    fnSetFncEnabled();  // <148> Add

end;
//-----------------------------------------------------------------------------
//  取引先コードのチェック
//-----------------------------------------------------------------------------
Function TJNTCRP004005f.fnChkTRCODE:Integer;
var
    Qry     : TMQuery;
    sCode   : String;
//↓<Rel>
	PQe     : TMQuery;                                      // 全社DB用ｸｴﾘ
	Qe      : TMQuery;                                      // 子社DB用ｸｴﾘ
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
            if f0CODE.text <> '' then
                sCODE := Format ('%.16d', [StrToInt64 (Trim(f0CODE.text))])
            else
                sCODE := '';
        end;
    end;

//↓<Rel>
	if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
	begin
		PQe := TMQuery.Create(Self);
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
            Sql.Add('select NCODE, NM, HojyoKbn2 from MTOKUI '
                +   ' where (GCODE = :pCODE) and (RDelKbn <> 1)');

            if f0CODE.text = '' then
                ParamByName('pCODE').asString := ''
            else
                ParamByName('pCODE').asString := sCode;
            Open;

            if EOF = False then
            begin
                f1NAME.text := FieldByName('NM').asString;
                m_TRNCode   := FieldByName('NCODE').asFloat;

                // 仕入先採用区分取得
                if GetFld('HojyoKbn2').AsInteger = 0 then
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
//  代替コードを変更時には代替情報を更新する（親子フラグ、請求区分、請求先内部コード）
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnSetDaigaiData(pNCD, pDaiNCD: Extended);
var
    DmqData     : TMQuery;
    lvOldDaiNCD : Extended;

begin

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with DmqData do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add('select PayNCode                '
                +   'from PayNayoseInfo             '
    		    +   'where (MasterKbn      = 22)    '
                +   '  and (NayoseSyu      = 1)     '
                +   '  and (NayoseKbn      = 1)     '
                +   '  and (NayoseOyaNCode = :pNCD) ');
// <110>               +   'where (MasterKbn = 22)    '
// <110>               +   '  and (NayoseSyu = 1)     '
// <110>               +   '  and (NayoseKbn = 2)     '
// <110>               +   '  and (PayNCode  = :pNCD) ');

    		ParamByName('pNCD').AsFloat      := pNCD;				// 名寄せ親支払先内部ｺｰﾄﾞ
            Open;

            // 一括請求⇒各店別請求へ（代替コードを未入力にした場合）
            if f1NayoseOyaCode.text = '' then
            begin
                // 各店別請求　親
// <136> 2006/07/24 H.Kawato Mod
//                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 11, 2) = False) then
                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 11, 2, False, False) = FALSE) then
                    Abort;

//<121>                lvOldDaiNCD := fnGetNCODE(uvDaiGaeCode, 22, m_TrCodeAttr);
//<121>
//<121>                // 各店別請求　代替
//<121>                if (fnUpDateMTokui_SelInfo(lvOldDaiNCD, lvOldDaiNCD, 0, 1) = False) then
//<121>                    Abort;
            end
            else
            begin
                // 一括請求　親
// <136> 2006/07/24 H.Kawato Mod
//                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 1, 1) = False) then
                if (fnUpDateMTokui_SelInfo(pNCD, pNCD, 1, 1, False, False) = FALSE) then
                    Abort;

                // 一括請求　代替
// <136> 2006/07/24 H.Kawato Mod
//                if (fnUpDateMTokui_SelInfo(pDaiNCD, pNCD, 3, 1) = False) then
                if (fnUpDateMTokui_SelInfo(pDaiNCD, pNCD, 3, 1, False, False) = FALSE) then
                    Abort;
            end;

            lvOldDaiNCD := fnGetNCODE(uvDaiGaeCode, 22, m_TrCodeAttr);

            // 各店別請求　代替
// <136> 2006/07/24 H.Kawato Mod
//            if (fnUpDateMTokui_SelInfo(lvOldDaiNCD, lvOldDaiNCD, 0, 1) = False) then
            if (fnUpDateMTokui_SelInfo(lvOldDaiNCD, lvOldDaiNCD, 0, 1, False, False) = FALSE) then
                Abort;

            // 内容が変更された親の子供分ﾙｰﾌﾟ
    		while not Eof do
    		begin
                // 一括請求⇒各店別請求へ（代替コードを未入力にした場合）
                if f1NayoseOyaCode.text = '' then
                begin
                    // 各店別請求　子
// <136> 2006/07/24 H.Kawato Mod
//                    if (fnUpDateMTokui_SelInfo(FieldByName('PayNCode').AsFloat, pNCD, 12, 2) = False) then
                    if (fnUpDateMTokui_SelInfo(FieldByName('PayNCode').AsFloat, pNCD, 12, 2, False, False) = FALSE) then
                        Abort;
                end
                else
                begin
                    // 一括請求　子
// <159> 2008/02/29 H.Kawato Mod Start
{
// <136> 2006/07/24 H.Kawato Mod
//                    if (fnUpDateMTokui_SelInfo(FieldByName('PayNCode').AsFloat, pNCD,  2, 1) = False) then
                    if (fnUpDateMTokui_SelInfo(FieldByName('PayNCode').AsFloat, pNCD,  2, 1, False, False) = FALSE) then
                        Abort;
}
                    // 代替仕入先は更新済の為
                    if (pDaiNCD <> FieldByName('PayNCode').AsFloat) then
                    begin
                        if (fnUpDateMTokui_SelInfo(FieldByName('PayNCode').AsFloat, pNCD,  2, 1, False, False) = FALSE) then
                            Abort;
                    end;
// <159> 2008/02/29 H.Kawato Mod End
                end;

                Next;
    		end;

            Close;
    	end;
    finally
        DmqData.Free();
    end;

end;

//------------------------------------------------------------------------------
procedure TJNTCRP004005F.FormDestroy(Sender: TObject);
begin
// <133> 2006/04/18 H.Kawato Add 進捗連動
	if m_PayProgRendo <> nil then
	begin
		m_PayProgRendo.Free;
		m_PayProgRendo := nil;
	end;
// <133> 2006/04/18 H.Kawato Add
// <#GAI> ADD-STR
	if m_PayProgRendoG <> nil then
	begin
		m_PayProgRendoG.Free;
		m_PayProgRendoG := nil;
	end;
// <#GAI> ADD-END
// <178> ADD-STR
    // 名寄せ親代替仕入先チェック用
	if m_PayProgRendoChild <> nil then
	begin
		m_PayProgRendoChild.Free;
		m_PayProgRendoChild := nil;
	end;
// <178> ADD-END

    // 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <PRN>
    with PrtParam do
	begin
		Para		:=  uvHani;
		TargetQry   :=  nil;
		CorpSys		:=  uvSelSys;
	end;

    // 開放<PRN>
// <138> 2006/08/16 H.Kawato Mod Start
//    PrintAppEntry(nil,nil,6,PrtParam,ArrHdl);
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);

	if ( m_RepHandle <> 0 ) then
	begin
// <LPH> MOD-STR
//    	UnloadPackage( m_RepHandle );
    	UnloadPackageHelper( m_RepHandle );
// <LPH> MOD-END
	end;
// <138> 2006/08/16 H.Kawato Mod End

end;
//------------------------------------------------------------------------------
//  印刷DLG
//------------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrintClick(Sender: TObject);
var
    lvRet       :   Integer;
    JNTPDlg     :   TFrmJNTPDialog;
begin
// <138> 2006/08/16 H.Kawato Add
    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
                'JNTCRP004005',
                uvHani,
                uvSelSys);
// <138> 2006/08/16 H.Kawato Add

	m_cJNTArea.setSelAppRecord;	 // 販売ポインタ設定

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<PRN>
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
// <151> 2007/05/07 H.Kawato Mod Start
{
            // ↓↓↓<131>
            case uvHani.pvrPattern of
                // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
                0:
                begin
                    fnPrnSETKanryakuJ();
                    PrtParam.TargetMD   :=  MemPtnJitsuzai;
                end;
                // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
                1:
                begin
                    fnPrnSETShosaiJ();
				    PrtParam.TargetMD   :=  MemPrint;
                end;
                // 合計取引先債務情報登録ﾘｽﾄ
                2:
                begin
                    fnPrintCheckListTtlStandard();
                    PrtParam.TargetMD	:=  MemPtnGoukei;
                end;
                // 取引先債務情報 名寄せ登録ﾘｽﾄ
                3:
                begin
                    fnPrnSETNayose();
				    PrtParam.TargetMD   :=  MemPrintNayose;
                end;
            end;
            // ↑↑↑<131>
}
            // ↓↓↓<131>
            case uvHani.pvrPattern of
                // 実在/合計取引先債務情報登録ﾘｽﾄ(簡略型)
                0, 2:
                begin
                    fnPrnSETKanryakuJ(uvHani.pvrPattern);
                    PrtParam.TargetMD   :=  MDPrint;
                end;
                // 実在/合計取引先債務情報登録ﾘｽﾄ(詳細型)
                1, 3:
                begin
                    fnPrnSETShosaiJ(uvHani.pvrPattern);
				    PrtParam.TargetMD   :=  MDPrint;
                end;
                // 取引先債務情報 名寄せ登録ﾘｽﾄ
//                4:
                4, 5:   // <159> Mod
                begin
                    fnPrnSETNayose();
				    PrtParam.TargetMD   :=  MemPtnNayose;
                end;
            end;
            // ↑↑↑<131>
// <151> 2007/05/07 H.Kawato Mod End

            // <PRN>
            with PrtParam do
			begin
				Para		:=  uvHani;
				TargetQry	:=  DmqPrint;
				CorpSys		:=  uvSelSys;
                JNTArea         :=  m_cJNTArea;
                // *** 汎用変数 *** //
                TargetParam	    :=  nil;
	    	    TargetStr	    :=  '';
    		    TargetInt	    :=  0;
                // *** 汎用変数 *** //
			end;

            //印刷する<PRN>
            PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
        end;
//    else Exit;		//ｴﾗｰ
    end;

	m_cJNTArea.setMasAppRecord;	 // 財務ポインタ設定

end;

// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト(簡略型)　債務情報】     <131>
// -----------------------------------------------------------------------------
// <151> 2007/05/07 H.Kawato Mod
//procedure TJNTCRP004005F.fnPrnSETKanryakuJ();
procedure TJNTCRP004005F.fnPrnSETKanryakuJ(pPtn:Integer);
var
    dqMasterData    :   TMQuery;
    sCode           :   String;
begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

// <151> 2007/05/07 H.Kawato Mod Start
//    if ( MemPtnJitsuzai.Active ) then MemPtnJitsuzai.Close();
//    MemPtnJitsuzai.Open();
    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();
// <151> 2007/05/07 H.Kawato Mod End

    with dqMasterData do
	begin
		Close();
		SQL.Clear();
// <151> 2007/05/07 H.Kawato Mod Start
{
        SQL.Add('SELECT m.GCode,m.Nm,m.Nmk,m.Renso,c.PostNo1,c.PostNo2,c.Ads1,  '
            +   '       c.Ads2,c.Tel1,c.Tel2,c.Fax1,f.FusenKbn                  '
            +   'FROM MTOKUI_PAY c, MTOKUI m                                    '
            +   'LEFT OUTER JOIN MTOKUI_SEL s ON (s.BaseNCode = m.NCode)        '
            +   'LEFT OUTER JOIN MFusenInfo f ON (f.NCode = m.NCode)            '
            +   '                            AND (f.MasterKbn = 22)             '
            +   'WHERE  (m.SumKbn = 0) AND (m.RDelKbn = 0)                      '
            +   '   AND (m.TemplateKbn =0) AND (s.RecKbn=2)                     '
            +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn2=1)             ');
}
        SQL.Add('SELECT m.GCode,m.Nm,m.Nmk,m.Renso,c.PostNo1,c.PostNo2,c.Ads1,  '
            +   '       c.Ads2,c.Tel1,c.Tel2,c.Fax1,f.FusenKbn                  '
            +   'FROM MTOKUI_PAY c, MTOKUI m                                    '
            +   'LEFT OUTER JOIN MTOKUI_SEL s ON (s.BaseNCode = m.NCode)        '
            +   'LEFT OUTER JOIN MFusenInfo f ON (f.NCode = m.NCode)            '
            +   '                            AND (f.MasterKbn = 22)             ');

        if (pPtn = 0) then  // 実在
        begin
        SQL.Add('WHERE  (m.SumKbn = 0) AND (m.RDelKbn = 0)                      '
            +   '   AND (m.TemplateKbn =0) AND (s.RecKbn=2)                     '
            +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn2=1)             ');
        end
        else                // 合計
        begin
        SQL.Add('WHERE  (m.SumKbn <> 0) AND (m.RDelKbn = 0)                     '
            +   '   AND (m.TemplateKbn =0) AND (s.RecKbn=2)                     '
            +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn2=1)             ');
        end;
// <151> 2007/05/07 H.Kawato Mod End

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

// <151> 2007/05/07 H.Kawato Mod Start
{
        while ( EOF <> TRUE ) do
		begin
			MemPtnJitsuzai.Append();

            // 付箋区分
			case GetFld('FusenKbn').AsInteger of
				0:	TGraphicField(MemPtnJitsuzai.FieldByName('Fusen')).Clear;
				1:	TGraphicField(MemPtnJitsuzai.FieldByName('Fusen')).Assign(Image_Fusen_Red.Picture.Bitmap);
				2:	TGraphicField(MemPtnJitsuzai.FieldByName('Fusen')).Assign(Image_Fusen_Green.Picture.Bitmap);
				3:	TGraphicField(MemPtnJitsuzai.FieldByName('Fusen')).Assign(Image_Fusen_Blue.Picture.Bitmap);
				4:	TGraphicField(MemPtnJitsuzai.FieldByName('Fusen')).Assign(Image_Fusen_Orange.Picture.Bitmap);
			end;

            if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
            else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
            else    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);

			MemPtnJitsuzai.FieldByName('GCode').AsString    :=  sCode;

            MemPtnJitsuzai.FieldByName('Renso') .AsString   :=  GetFld('Renso') .AsString;
            MemPtnJitsuzai.FieldByName('Nm')    .AsString   :=  GetFld('Nm')    .AsString;
            MemPtnJitsuzai.FieldByName('Nmk')   .AsString   :=  GetFld('Nmk')   .AsString;

            MemPtnJitsuzai.Post();
            Next;
        end;
}
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
// <151> 2007/05/07 H.Kawato Mod End
    end;

//    MemPtnJitsuzai.First();
    MDPrint.First();    // <151> Mod

    dqMasterData.Close();
    dqMasterData.Free();

end;

// -----------------------------------------------------------------------------
//  印刷処理【合計取引先登録リスト　債務情報】  <131>
// -----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrintCheckListTtlStandard(pPtn:Integer);
var
    dqMasterData    :   TMQuery;
    sCode           :   String;
begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    if ( MemPtnGoukei.Active ) then MemPtnGoukei.Close();
    MemPtnGoukei.Open();

    with dqMasterData do
	begin
		Close();
		SQL.Clear();
        SQL.Add('SELECT m.GCode,m.Nm,m.Nmk,m.Renso,c.PostNo1,c.PostNo2,c.Ads1,  '
            +   '       c.Ads2,c.Tel1,c.Tel2,c.Fax1,f.FusenKbn                  '
            +   'FROM MTOKUI_PAY c, MTOKUI m                                    '
            +   'LEFT OUTER JOIN MTOKUI_SEL s ON (s.BaseNCode = m.NCode)        '
            +   'LEFT OUTER JOIN MFusenInfo f ON (f.NCode = m.NCode)            '
            +   '                            AND (f.MasterKbn = 22)             '
            +   'WHERE  (m.SumKbn <> 0) AND (m.RDelKbn = 0)                     '
            +   '   AND (s.RecKbn = 2) AND (m.TemplateKbn = 0)                  '
            +   '   AND (c.BaseNCode = m.NCode) AND (m.HojyoKbn2=1)             ');

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
			MemPtnGoukei.Append();

            // 付箋区分
			case GetFld('FusenKbn').AsInteger of
				0:	TGraphicField(MemPtnGoukei.FieldByName('grTag')).Clear;
				1:	TGraphicField(MemPtnGoukei.FieldByName('grTag')).Assign(Image_Fusen_Red.Picture.Bitmap);
				2:	TGraphicField(MemPtnGoukei.FieldByName('grTag')).Assign(Image_Fusen_Green.Picture.Bitmap);
				3:	TGraphicField(MemPtnGoukei.FieldByName('grTag')).Assign(Image_Fusen_Blue.Picture.Bitmap);
				4:	TGraphicField(MemPtnGoukei.FieldByName('grTag')).Assign(Image_Fusen_Orange.Picture.Bitmap);
			end;

            if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 0)
            else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 1)
            else    sCode   := m_cComArea.SetDspCodeAttr(GetFld('GCode').AsString, m_TRCodeDigit, 2);
			MemPtnGoukei.FieldByName('strExCode')       .AsString   :=  sCode;

            MemPtnGoukei.FieldByName('strAssociation')  .AsString   :=  GetFld('Renso') .AsString;
            MemPtnGoukei.FieldByName('strName')         .AsString   :=  GetFld('Nm')    .AsString;
            MemPtnGoukei.FieldByName('strNameSimple')   .AsString   :=  GetFld('Nmk')   .AsString;

            MemPtnGoukei.FieldByName('strAddress')      .AsString   :=  GetFld('Ads1')  .AsString;

            // 郵便番号(基番、枝番)
            if	((FieldByName ('PostNo1').AsInteger = 0) and
                 (FieldByName ('PostNo2').AsInteger = 0)) then
            begin
                MemPtnGoukei.FieldByName ('nZipCodeUpper').Clear ();
                MemPtnGoukei.FieldByName ('nZipCodeLower').Clear ();
            end
            else
            begin
                MemPtnGoukei.FieldByName ('nZipCodeUpper').AsInteger    :=  FieldByName('PostNo1')  .AsInteger;
                MemPtnGoukei.FieldByName ('nZipCodeLower').AsInteger	:=  FieldByName('PostNo2')  .AsInteger;
            end;

            MemPtnGoukei.Post();
            Next;
        end;
    end;

    MemPtnGoukei.First();

    dqMasterData.Close();
    dqMasterData.Free();

end;

// <151> 2007/05/07 H.Kawato Mod Start
(*
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】    <PRN>
// -----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrnSETShosaiJ();
var
	DmqMTOKUI       :   TMQuery;
    Qry	       		:   TMQuery;
    i               :   Integer;
    sCode           :   String;

	strExCode	: String;
//	strFormat	: String;
	sName		: String;
    lName		: String;

begin

    // MQueryの構築
	DmqMTOKUI       :=  TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqMTOKUI);

    if ( MemPrint.Active ) then MemPrint.Close();
    MemPrint.Open();

	with DmqMTOKUI do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
        SQL.Add('SELECT                                 '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ         (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　         (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称         (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称         (mtokui)
            +   '   ,mt.TStartDate                      '   // 適用開始         (mtokui)
            +   '   ,mt.TEndDate                        '   // 適用終了         (mtokui)
// <147> 2007/02/01 H.Kawato Mod
//            +   '   ,mt.UpdDateTM                       '   // 更新日時       (mtokui)
            +   '   ,py.UpdDateTM                       '   // 更新日時         (mtokui_Pay)
            +   '   ,py.PostNo1         py_PostNo1      '   // 郵便番号(基番)   (mtokui_Pay)
            +   '   ,py.PostNo2         py_PostNo2      '   // 郵便番号(枝番)   (mtokui_Pay)
            +   '   ,py.Ads1            py_Ads1         '   // 住所上段         (mtokui_Pay)
            +   '   ,py.Ads2            py_Ads2         '   // 住所下段         (mtokui_Pay)
            +   '   ,py.Tel1            py_Tel1         '   // 電話番号1        (mtokui_Pay)
            +   '   ,py.SectionName     py_SectionName  '   // 送付先部署名     (mtokui_Pay)
            +   '   ,py.TanNm           py_TanNm        '   // 担当者名         (mtokui_Pay)
            +   '   ,py.KeisyoKbn       py_KeisyoKbn    '   // 担当者敬称       (mtokui_Pay)
            +   '   ,py.MailAddress     py_MailAddress  '   // メールアドレス   (MTOKUI_Pay)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 支払通知書ﾌｫｰﾑ   (mtokui_sel) <104>
//<127>     +   '   ,se.USGKei          se_SSsyoKgm     '   // 仕入合計欄税印字 (mtokui_sel) <104>
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 鏡欄税印字   　  (mtokui_sel) <104><127>
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード   (mtokui_sel)
// <143> 2006/09/26 H.Kawato Mod Start
//            +   'FROM MTOKUI_PAY py, MTOKUI mt          '
//            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
//            +   '   (se.BaseNCode = mt.NCode)           '
            +   '   ,mt2.GCode         m_RendoCode      '   // 連動得意先コード (mtokui)
            +   '   ,mt2.Nmk           m_RendoNm        '   // 連動得意先名称 (mtokui)
            +   'FROM MTOKUI_PAY py                     '
            +   'LEFT OUTER JOIN MTOKUI mt ON           '
            +   '   (py.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI mt2 ON          '
            +   '   (py.RendoNCode = mt2.NCode)         '
            +   '   AND (mt2.RDelKbn = 0)               '
            +   '   AND (mt2.HojyoKbn1=1)               '
// <143> 2006/09/26 H.Kawato Mod End
            +   'WHERE  (mt.RDelKbn = 0)                '
            +   '   AND (mt.SumKbn = 0)                 ' 
            +   '   AND (mt.TemplateKbn   = 0)          '
            +   '   AND (py.BaseNCode = mt.NCode)       '
            +   '   AND (mt.HojyoKbn2=1)                '
            +   '   AND (se.RecKBN  = 2)                ');

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
*)
(* <HAN>
            if ( uvHani.pvrStCode[0] <> '' ) and
               ( uvHani.pvrEdCode[0] =  '' ) then
            begin
//@　↓12.02
{
                SQL.Add('  AND  (GCode >= :ExCode)   ');
                if ( m_TRCodeAttr <= 1 ) then
    			    ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrStCode[0];
            end
            else if ( uvHani.pvrStCode[0] =  '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
                SQL.Add('  AND  (GCode <= :ExCode)   ');
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
                SQL.Add('  AND  (GCode >= :ExStCode)     ');
			    SQL.Add('  AND  (GCode <= :ExEdCode)     ');
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
(*
			// <HAN> >>
// <143> 2006/09/26 H.Kawato Mod Start
//          SQL.Add('  AND  (GCode >= :ExStCode)     ');
//		    SQL.Add('  AND  (GCode <= :ExEdCode)     ');
            SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
// <143> 2006/09/26 H.Kawato Mod End
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
			// <HAN> <<
        end;

        // 出力順序
// <143> 2006/09/26 H.Kawato Mod Start
{
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY GCode         ')
        else    SQL.Add('ORDER BY Renso, GCode  ');
}
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY mt.GCode            ')
        else    SQL.Add('ORDER BY mt.Renso, mt.GCode  ');
// <143> 2006/09/26 H.Kawato Mod End

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
//			ErrorMessageDsp(DmqMTOKUI);
			DmqMTOKUI.Close();
			DmqMTOKUI.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MemPrint.Append();

            // 数値属性
            if ( m_TRCodeAttr = 0 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( m_TRCodeAttr = 1 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 2);

            // 外部ｺｰﾄﾞ
			MemPrint.FieldByName('GCode').AsString	    :=  sCode;
            // 連想
			MemPrint.FieldByName('Renso').AsString		:=	GetFld('m_Renso').AsString;
            // 簡略名称
			MemPrint.FieldByName('Nmk').AsString	    :=	GetFld('m_Nmk').AsString;
		    // 正式名称
            MemPrint.FieldByName('Nm').AsString	        :=	GetFld('m_Nm').AsString;
            // 郵便番号(基番)
            if ( not GetFld('py_PostNo1').IsNull      ) and
               ( GetFld('py_PostNo1').AsString <> '0' ) then
                //@　↓12.02 書式変換追加
               MemPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('py_PostNo1').AsInteger]);
                //MemPrint.FieldByName('PostNo1').AsString	        :=	GetFld('py_PostNo1').AsString;
                //@ ↑
            // 郵便番号(枝番)
            if ( not GetFld('py_PostNo2').IsNull      ) and
               ( GetFld('py_PostNo2').AsString <> '0' ) then
                //@　↓12.02 書式変換追加
                MemPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('py_PostNo2').AsInteger]);
                //MemPrint.FieldByName('PostNo2').AsString	        :=	GetFld('py_PostNo2').AsString;
                //@ ↑
            // 住所(上段)
            MemPrint.FieldByName('Ads1').AsString	            :=	GetFld('py_Ads1').AsString;
            // 住所(下段)
            MemPrint.FieldByName('Ads2').AsString	            :=	GetFld('py_Ads2').AsString;

		    // 電話番号1
			MemPrint.FieldByName('Tel1').AsString	            :=	GetFLD('py_Tel1').AsString;

            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MemPrint.FieldByName('TStartDate').AsString     :=  MjsGetGengou( GetFld('TStartDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TStartDate').AsDateTime );
                // 適用期間(終了)
                MemPrint.FieldByName('TEndDate').AsString		:=	MjsGetGengou( GetFld('TEndDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TEndDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString	:=	MjsGetGengou(GetFld('UpdDateTM').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('UpdDateTM').AsDateTime);
                 //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MemPrint.FieldByName('TStartDate').AsString     :=  FormatDateTime( 'yyyy/mm/dd', GetFld('TStartDate').AsDateTime );
                // 適用期間(終了)
                MemPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('TEndDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MemPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('UpdDateTM').AsDateTime);
                //@ ↑
            end;

		    // 送付先部署名
            MemPrint.FieldByName('SectNm').AsString     :=	GetFld('py_SectionName').AsString;
		    // 担当者名
            MemPrint.FieldByName('TanNm').AsString	    :=	GetFld('py_TanNm').AsString;
		    // 敬称
            MemPrint.FieldByName('Keisyo').AsString     :=	GetFld('py_KeisyoKbn').AsString;
		    // メアド
            MemPrint.FieldByName('Mail').AsString       :=	GetFld('py_MailAddress').AsString;

            // 部門コード・名称
            strExCode := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
            if (m_BMCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MemPrint.FieldByName('BmNCd').AsString := '';
				MemPrint.FieldByName('BmNm'	).AsString := '';
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
				MemPrint.FieldByName('BmNCd'	).AsString := sCode;
				// 名称取得
	            fnGetNAME(strExCode,41,m_BMCodeAttr,sName );
				MemPrint.FieldByName('BmNm'	).AsString := sName;
            end;
            // 担当者コード・名称
            strExCode := fnGetGCODE(GetFld('se_TnNCode').AsFloat,25);
            if (m_TNCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MemPrint.FieldByName('TnNCd').AsString := '';
				MemPrint.FieldByName('TnNm'	).AsString := '';
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
				MemPrint.FieldByName('TnNCd'	).AsString := sCode;
				// 名称取得
	            fnGetNAME(strExCode,25,m_TnCodeAttr,sName );
				MemPrint.FieldByName('TnNm'	).AsString := sName;
            end;

            // 支払通知書ﾌｫｰﾑ
            MemPrint.FieldByName('USDenPfm'	).AsInteger :=  GetFld('se_SSsyoPfm').AsInteger;
            // 支払通知書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            strExCode := IntToStr(GetFld('se_SSsyoPfm').AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'st00', strExCode, lName, sName) = True then
                MemPrint.FieldByName('USDenPfmNm'	).AsString := sName;
            Qry.Free;

            // 合計欄印字
            MemPrint.FieldByName('USGKei'	).AsInteger	:=  GetFld('se_SSsyoKgm').AsInteger;
			// 区分名称取得
			for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
		    begin
            	if GetFld('se_SSsyoKgm').AsInteger = _UsgKeiItems[i].iCode then
		            MemPrint.FieldByName('USGKeiNm'	).AsString	:=  _UsgKeiItems[i].sName;
		    end;

// <143> 2006/09/26 H.Kawato Add Start
            // 数値属性
            if ( m_TRCodeAttr = 0 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( m_TRCodeAttr = 1 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 2);

            // 連動得意先外部ｺｰﾄﾞ
			MemPrint.FieldByName('RendoCode').AsString   :=  sCode;

            // 連動得意先名称
			MemPrint.FieldByName('RendoNmk').AsString    :=	GetFld('m_RendoNm').AsString;
// <143> 2006/09/26 H.Kawato Add End

            MemPrint.Post();
            Next;
        end;
	end;

    DmqMTOKUI.Close();
	DmqMTOKUI.Free();

end;
*)
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト】    <PRN>
// -----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrnSETShosaiJ(pPtn:Integer);
var
	DmqMTOKUI   : TMQuery;
    Qry	       	: TMQuery;
    i           : Integer;
    sCode       : String;
	strExCode	: String;
	sName		: String;
    lName		: String;
//    lvCODE      : Extended;

begin
    // MQueryの構築
	DmqMTOKUI       :=  TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, DmqMTOKUI);

    if ( MDPrint.Active ) then MDPrint.Close();
    MDPrint.Open();

	with DmqMTOKUI do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
// <157> 2007/08/22 H.Kawato Mod Start
{
        SQL.Add('SELECT                                 '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ         (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　         (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称         (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称         (mtokui)
            +   '   ,mt.TStartDate                      '   // 適用開始         (mtokui)
            +   '   ,mt.TEndDate                        '   // 適用終了         (mtokui)
            +   '   ,py.UpdDateTM                       '   // 更新日時         (mtokui_Pay)
            +   '   ,py.PostNo1         py_PostNo1      '   // 郵便番号(基番)   (mtokui_Pay)
            +   '   ,py.PostNo2         py_PostNo2      '   // 郵便番号(枝番)   (mtokui_Pay)
            +   '   ,py.Ads1            py_Ads1         '   // 住所上段         (mtokui_Pay)
            +   '   ,py.Ads2            py_Ads2         '   // 住所下段         (mtokui_Pay)
            +   '   ,py.Tel1            py_Tel1         '   // 電話番号1        (mtokui_Pay)
            +   '   ,py.SectionName     py_SectionName  '   // 送付先部署名     (mtokui_Pay)
            +   '   ,py.TanNm           py_TanNm        '   // 担当者名         (mtokui_Pay)
            +   '   ,py.KeisyoKbn       py_KeisyoKbn    '   // 担当者敬称       (mtokui_Pay)
            +   '   ,py.MailAddress     py_MailAddress  '   // メールアドレス   (MTOKUI_Pay)
            +   '   ,py.UketoriName     py_UketoriName  '   // 受取人名称       (mtokui_Pay)
            +   '   ,py.LetterKbn       py_LetterKbn    '   // 支払通知書区分   (mtokui_Pay)
            +   '   ,py.CngNCode        py_CngNCode     '   // 代替仕入先内部コード (mtokui_Pay)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 支払通知書ﾌｫｰﾑ   (mtokui_sel) <104>
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 鏡欄税印字   　  (mtokui_sel) <104><127>
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード   (mtokui_sel)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分         (mtokui_sel)
            +   '   ,mt2.GCode          m_RendoCode     '   // 連動得意先コード (mtokui)
            +   '   ,mt2.Nmk            m_RendoNm       '   // 連動得意先名称   (mtokui)
            +   '   ,mt3.GCode          m_CngCode       '   // 代替仕入先コード (mtokui)
            +   '   ,mt3.Nmk            m_CngName       '   // 代替仕入先名称   (mtokui)
            +   'FROM MTOKUI_PAY py                     '
            +   'LEFT OUTER JOIN MTOKUI mt ON           '
            +   '   (py.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI mt2 ON          '
            +   '   (py.RendoNCode = mt2.NCode)         '
            +   '   AND (mt2.RDelKbn = 0)               '
            +   '   AND (mt2.HojyoKbn1=1)               '
            +   'LEFT OUTER JOIN MTOKUI mt3 ON          '
            +   '   (py.CngNCode = mt3.NCode)           '
            +   '   AND (mt3.RDelKbn = 0)               '
            +   '   AND (mt3.TemplateKbn = 0)           '
            +   '   AND (mt3.HojyoKbn2 = 1)             '
            +   'WHERE  (mt.RDelKbn = 0)                '
            +   '   AND (mt.TemplateKbn   = 0)          '
            +   '   AND (py.BaseNCode = mt.NCode)       '
            +   '   AND (mt.HojyoKbn2=1)                '
            +   '   AND (se.RecKBN  = 2)                ');
}
        SQL.Add('SELECT                                 '
            +   '    mt.GCode           m_GCode         '   // 外部ｺｰﾄﾞ         (mtokui)
            +   '   ,mt.Renso           m_Renso         '   // 連想　　         (mtokui)
            +   '   ,mt.Nm              m_Nm            '   // 正式名称         (mtokui)
            +   '   ,mt.Nmk             m_Nmk           '   // 簡略名称         (mtokui)
            +   '   ,mt.TStartDate                      '   // 適用開始         (mtokui)
            +   '   ,mt.TEndDate                        '   // 適用終了         (mtokui)
            +   '   ,py.UpdDateTM                       '   // 更新日時         (mtokui_Pay)
            +   '   ,py.PostNo1         py_PostNo1      '   // 郵便番号(基番)   (mtokui_Pay)
            +   '   ,py.PostNo2         py_PostNo2      '   // 郵便番号(枝番)   (mtokui_Pay)
            +   '   ,py.Ads1            py_Ads1         '   // 住所上段         (mtokui_Pay)
            +   '   ,py.Ads2            py_Ads2         '   // 住所下段         (mtokui_Pay)
            +   '   ,py.Tel1            py_Tel1         '   // 電話番号1        (mtokui_Pay)
            +   '   ,py.SectionName     py_SectionName  '   // 送付先部署名     (mtokui_Pay)
            +   '   ,py.TanNm           py_TanNm        '   // 担当者名         (mtokui_Pay)
            +   '   ,py.KeisyoKbn       py_KeisyoKbn    '   // 担当者敬称       (mtokui_Pay)
            +   '   ,py.MailAddress     py_MailAddress  '   // メールアドレス   (MTOKUI_Pay)
            +   '   ,py.UketoriName     py_UketoriName  '   // 受取人名称       (mtokui_Pay)
            +   '   ,py.LetterKbn       py_LetterKbn    '   // 支払通知書区分   (mtokui_Pay)
            +   '   ,py.CngNCode        py_CngNCode     '   // 代替仕入先内部コード (mtokui_Pay)
            +   '   ,se.SSsyoPfm        se_SSsyoPfm     '   // 支払通知書ﾌｫｰﾑ   (mtokui_sel) <104>
            +   '   ,se.SSsyoKgm        se_SSsyoKgm     '   // 鏡欄税印字   　  (mtokui_sel) <104><127>
            +   '   ,se.TnNCode         se_TnNCode      '   // 担当者内部コード (mtokui_sel)
            +   '   ,se.BmNCode         se_BmNCode      '   // 部門内部コード   (mtokui_sel)
            +   '   ,se.UsKinKbn        se_UsKinKbn     '   // 請求区分         (mtokui_sel)
            +   '   ,mt2.GCode          m_RendoCode     '   // 連動得意先コード (mtokui)
            +   '   ,mt2.Nmk            m_RendoNm       '   // 連動得意先名称   (mtokui)
            +   '   ,mt3.GCode          m_CngCode       '   // 代替仕入先コード (mtokui)
            +   '   ,mt3.Nmk            m_CngName       '); // 代替仕入先名称   (mtokui)

// <176> DEL-STR
//      // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//      if (m_iVerData > 5) then
//      begin
// <176> DEL-ENND
            SQL.Add(' ,py.GensenUseKbn  py_GensenKbn    '   // 預かり源泉税採用区分 (mtokui_Pay)
                +   ' ,py.PersonKbn     py_PersonKbn    '); // 個人／法人区分   (mtokui_Pay)
// <176> DEL    end;
// <176> ADD-STR
        SQL.Add('   ,py.PayKbn2         py_PayKbn2      '   // 通知書メール配信区分 (MTOKUI_Pay)
            +   '   ,py.ZipPass         py_ZipPass      '); // パスワード           (MTOKUI_Pay)
// <176> ADD-END

        SQL.Add('FROM MTOKUI_PAY py                     '
            +   'LEFT OUTER JOIN MTOKUI mt ON           '
            +   '   (py.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI_SEL se ON       '
            +   '   (se.BaseNCode = mt.NCode)           '
            +   'LEFT OUTER JOIN MTOKUI mt2 ON          '
            +   '   (py.RendoNCode = mt2.NCode)         '
            +   '   AND (mt2.RDelKbn = 0)               '
            +   '   AND (mt2.HojyoKbn1=1)               '
            +   'LEFT OUTER JOIN MTOKUI mt3 ON          '
            +   '   (py.CngNCode = mt3.NCode)           '
            +   '   AND (mt3.RDelKbn = 0)               '
            +   '   AND (mt3.TemplateKbn = 0)           '
            +   '   AND (mt3.HojyoKbn2 = 1)             '
            +   'WHERE  (mt.RDelKbn = 0)                '
            +   '   AND (mt.TemplateKbn   = 0)          '
            +   '   AND (py.BaseNCode = mt.NCode)       '
            +   '   AND (mt.HojyoKbn2=1)                '
            +   '   AND (se.RecKBN  = 2)                ');
// <157> 2007/08/22 H.Kawato Mod End

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
			// <HAN> >>
            SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
			// <HAN> <<
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
                SQL.Add('ORDER BY mt.GCode            ')
        else    SQL.Add('ORDER BY mt.Renso, mt.GCode  ');

        // ｴﾗｰの判定
		if ( Open = FALSE ) then
		begin
			DmqMTOKUI.Close();
			DmqMTOKUI.Free();
			Exit;
		end;

        while ( EOF <> TRUE ) do
		begin
			MDPrint.Append();

            // 数値属性
            if ( m_TRCodeAttr = 0 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( m_TRCodeAttr = 1 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_GCode').AsString, m_TRCodeDigit, 2);

            // 外部ｺｰﾄﾞ
			MDPrint.FieldByName('GCode').AsString   :=  sCode;
            // 連想
			MDPrint.FieldByName('Renso').AsString   :=	GetFld('m_Renso').AsString;
            // 簡略名称
			MDPrint.FieldByName('Nmk').AsString	    :=	GetFld('m_Nmk').AsString;
		    // 正式名称
            MDPrint.FieldByName('Nm').AsString      :=	GetFld('m_Nm').AsString;
            // 郵便番号(基番)
            if ( not GetFld('py_PostNo1').IsNull      ) and
               ( GetFld('py_PostNo1').AsString <> '0' ) then
               MDPrint.FieldByName('PostNo1').AsString	        :=	Format('%.3d', [GetFld('py_PostNo1').AsInteger]);
            // 郵便番号(枝番)
            if ( not GetFld('py_PostNo2').IsNull      ) and
               ( GetFld('py_PostNo2').AsString <> '0' ) then
                MDPrint.FieldByName('PostNo2').AsString	        :=	Format('%.4d',[GetFld('py_PostNo2').AsInteger]);
            // 住所(上段)
            MDPrint.FieldByName('Ads1').AsString	            :=	GetFld('py_Ads1').AsString;
            // 住所(下段)
            MDPrint.FieldByName('Ads2').AsString	            :=	GetFld('py_Ads2').AsString;

		    // 電話番号1
			MDPrint.FieldByName('Tel1').AsString	            :=	GetFLD('py_Tel1').AsString;

            // 和暦
            if ( m_iRekiKbn = 0 ) then
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString      :=  MjsGetGengou( GetFld('TStartDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TStartDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:=	MjsGetGengou( GetFld('TEndDate').AsDateTime, MdtCMP_YMD )
                                                                      + FormatDateTime( 'ee/mm/dd', GetFld('TEndDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MDPrint.FieldByName('UpdDateTM').AsString	:=	MjsGetGengou(GetFld('UpdDateTM').AsDateTime, MdtCMP_YMD )
                                                                    +  FormatDateTime('ee/mm/dd HH:MM:SS', GetFld('UpdDateTM').AsDateTime);
                 //@ ↑
            end
            // 西暦
            else
            begin
                // 適用期間(開始)
                MDPrint.FieldByName('TStartDate').AsString      :=  FormatDateTime( 'yyyy/mm/dd', GetFld('TStartDate').AsDateTime );
                // 適用期間(終了)
                MDPrint.FieldByName('TEndDate').AsString		:=	FormatDateTime( 'yyyy/mm/dd', GetFld('TEndDate').AsDateTime );
                //@　↓12.02 書式変換追加
                // 更新日
                if ( not GetFld('UpdDateTM').IsNull ) then
                    MDPrint.FieldByName('UpdDateTM').AsString	:=	FormatDateTime( 'yyyy/mm/dd HH:MM:SS',GetFld('UpdDateTM').AsDateTime);
                //@ ↑
            end;

		    // 送付先部署名
            MDPrint.FieldByName('SectNm').AsString  :=	GetFld('py_SectionName').AsString;
		    // 担当者名
            MDPrint.FieldByName('TanNm').AsString   :=	GetFld('py_TanNm').AsString;
		    // 敬称
            MDPrint.FieldByName('Keisyo').AsString  :=	GetFld('py_KeisyoKbn').AsString;
		    // メアド
            sName :=  GetFld('py_MailAddress'	).AsString;

            MDPrint.FieldByName('Mail'	).AsString := sName;
            MDPrint.FieldByName('Mail1'	).AsString := MjsHanCopy(sName, 1, 50);
            MDPrint.FieldByName('Mail2'	).AsString := MjsHanCopy(sName, 51, 100);

            MDPrint.FieldByName('BmnTitle'	).AsString := m_BMJHojyoName;	// <175> Add

            // 部門コード・名称
            strExCode := fnGetGCODE(GetFld('se_BmNCode').AsFloat,41);
            if (m_BMCodeAttr <> 2) and (strExCode = ucZeroCODE ) then
            begin
				MDPrint.FieldByName('BmNCd').AsString := '';
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
				MDPrint.FieldByName('TnNCd').AsString  := '';
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

            // 支払通知書ﾌｫｰﾑ
            MDPrint.FieldByName('USDenPfm'	).AsInteger :=  GetFld('se_SSsyoPfm').AsInteger;
            // 支払通知書ﾌｫｰﾑ名
            Qry := TMQuery.Create (Self);
            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
            strExCode := IntToStr(GetFld('se_SSsyoPfm').AsInteger);
            if gfnJNTSELRptNameGet(Qry, 'st00', strExCode, lName, sName) = True then
                MDPrint.FieldByName('USDenPfmNm'	).AsString := sName;
            Qry.Free;

            // 合計欄印字
            MDPrint.FieldByName('USGKei'	).AsInteger	:=  GetFld('se_SSsyoKgm').AsInteger;
			// 区分名称取得
			for i := Low(_UsgKeiItems) to High(_UsgKeiItems) do
		    begin
            	if GetFld('se_SSsyoKgm').AsInteger = _UsgKeiItems[i].iCode then
		            MDPrint.FieldByName('USGKeiNm'	).AsString	:=  _UsgKeiItems[i].sName;
		    end;

            // 数値属性
            if ( m_TRCodeAttr = 0 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 0)
            // 数値属性前ｾﾞﾛ有
            else if ( m_TRCodeAttr = 1 ) then
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 1)
            // ﾌﾘｰ属性
            else
                sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_RendoCode').AsString, m_TRCodeDigit, 2);

            // 連動得意先外部ｺｰﾄﾞ
			MDPrint.FieldByName('RendoCode').AsString   :=  sCode;

            // 連動得意先名称
			MDPrint.FieldByName('RendoNmk').AsString    :=	GetFld('m_RendoNm').AsString;

            // 受取人名称
			MDPrint.FieldByName('UketoriName').AsString :=	GetFld('py_UketoriName').AsString;

            // 支払通知書区分
            MDPrint.FieldByName('LetterKbn').AsString   :=	IntToStr(GetFld('py_LetterKbn').AsInteger);

			for i := Low(_LetterKbnItems) to High(_LetterKbnItems) do
		    begin
            	if GetFld('py_LetterKbn').AsInteger = _LetterKbnItems[i].iCode then
		            MDPrint.FieldByName('LetterKbnName'	).AsString	:=  _LetterKbnItems[i].sName;
		    end;

// <157> 2007/08/27 H.Kawato Add Start
// <176> DEL-STR
//          // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//          if (m_iVerData > 5) then
//          begin
// <176> DEL-END
                // 預かり源泉税採用区分
                MDPrint.FieldByName('GensenKbn').AsString   :=	IntToStr(GetFld('py_GensenKbn').AsInteger);

                for i := Low(_GensenKbnItems) to High(_GensenKbnItems) do
                begin
                	if GetFld('py_GensenKbn').AsInteger = _GensenKbnItems[i].iCode then
                        MDPrint.FieldByName('GensenKbnName'	).AsString	:=  _GensenKbnItems[i].sName;
                end;

                // 個人／法人区分
                MDPrint.FieldByName('PersonKbn').AsString   :=	IntToStr(GetFld('py_PersonKbn').AsInteger);

                for i := Low(_PersonKbnItems) to High(_PersonKbnItems) do
                begin
                	if GetFld('py_PersonKbn').AsInteger = _PersonKbnItems[i].iCode then
                        MDPrint.FieldByName('PersonKbnName'	).AsString	:=  _PersonKbnItems[i].sName;
                end;
// <176> DEL    end;

            // 債務ﾃﾞｰﾀﾊﾞｰｼﾞｮﾝ
            MDPrint.FieldByName('VerData').AsInteger    :=  m_iVerData;
// <157> 2007/08/27 H.Kawato Add End

// <176> ADD-STR
            // 通知書メール配信区分
            MDPrint.FieldByName('MailKbn').AsString   :=	IntToStr(GetFld('py_PayKbn2').AsInteger);

            for i := Low(_MailKbnItems) to High(_MailKbnItems) do
            begin
                if GetFld('py_PayKbn2').AsInteger = _MailKbnItems[i].iCode then
                    MDPrint.FieldByName('MailKbnName'	).AsString	:=  _MailKbnItems[i].sName;
            end;

            // パスワード
            MDPrint.FieldByName('Password').AsString   :=	GetFld('py_ZipPass').AsString;
// <176> ADD-END

            if ( pPtn = 3 ) then    // 合計
            begin
                // 請求区分
                MDPrint.FieldByName('UsKinKbn' ).AsInteger  := GetFld('se_UsKinKbn').AsInteger;

			    // 区分名称取得
                for i := Low(_SeikyuKbnItems) to High(_SeikyuKbnItems) do
                begin
                	if GetFld('se_UsKinKbn').AsInteger = _SeikyuKbnItems[i].iCode then
                        MDPrint.FieldByName('UsKinKbnNm').AsString	:=  _SeikyuKbnItems[i].sName;
                end;

                // 数値属性
                if ( m_TRCodeAttr = 0 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_CngCode').AsString, m_TRCodeDigit, 0)
                // 数値属性前ｾﾞﾛ有
                else if ( m_TRCodeAttr = 1 ) then
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_CngCode').AsString, m_TRCodeDigit, 1)
                // ﾌﾘｰ属性
                else
                    sCode   := m_cComArea.SetDspCodeAttr(GetFld('m_CngCode').AsString, m_TRCodeDigit, 2);

                // 代替仕入先外部ｺｰﾄﾞ
                MDPrint.FieldByName('CngGCode').AsString    :=  sCode;
                // 代替仕入先名称
                MDPrint.FieldByName('CngName'  ).AsString   := GetFld('m_CngName').AsString;
            end
            else                    // 単独
            begin
                // 請求区分
                MDPrint.FieldByName('UsKinKbn'  ).Clear;
                MDPrint.FieldByName('UsKinKbnNm').Clear;
                // 代替仕入先コード
                MDPrint.FieldByName('CngGCode'  ).Clear;
                // 代替仕入先名称
                MDPrint.FieldByName('CngName'   ).Clear;
            end;

            MDPrint.Post();
            Next;
        end;
	end;

    DmqMTOKUI.Close();
	DmqMTOKUI.Free();

end;
// <151> 2007/05/07 H.Kawato Mod End

// <151> 2007/05/07 H.Kawto Mod Start
(*
// -----------------------------------------------------------------------------
//  印刷処理【実在取引先登録リスト　債務情報　名寄せ】
// -----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrnSETNayose();
var
	dqMasterData    :   TMQuery;
	sHojCD		    :   String;
	sOyaCD		    :   String;
	strFormat	    :   String;
    sPreOyaCD       :   String;

begin

    // MQueryの構築
	dqMasterData    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    if ( MemPrintNayose.Active ) then MemPrintNayose.Close();
    MemPrintNayose.Open();

    with (dqMasterData) do
	begin
        // -------------------------------------
        //  取引先マスタ MTOKUI
        // -------------------------------------
		Close ();
		SQL.Clear();
		SQL.Add('select                                 '
            +   '    NI.PayNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode  as SGCode                '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode as OYAGCode              '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NMK    as SNAME                 '   // 子取引先名称
		    +   '   ,MTO.NMK   as OYANAME               '   // 親取引先名称
		    +   'FROM PayNayoseInfo NI                  '
            +   'LEFT OUTER JOIN MTOKUI MT              '
            +   '   ON (NI.PayNCode = MT.NCode)         '
            +   'LEFT OUTER JOIN MTOKUI MTO             '
            +   '   ON (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'WHERE (NI.MasterKbn = 22 )             '
            +   '  AND (NI.NayoseSyu = 1  )             '
            +   '  AND (NI.NayoseKbn = 1  )             ');

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
*)
(* <HAN>
            if ( uvHani.pvrStCode[0] <> '' ) and
               ( uvHani.pvrEdCode[0] =  '' ) then
            begin
//@　↓12.02
{
                SQL.Add('  AND  (MT.GCode >= :ExCode)   ');
                if ( m_TRCodeAttr <= 1 ) then
    			    ParamByName('ExCode').AsString :=  Format('%.16d', [StrToInt64(Trim(uvHani.pvrStCode[0]))])
                else
                    ParamByName('ExCode').AsString :=  uvHani.pvrStCode[0];
            end
            else if ( uvHani.pvrStCode[0] =  '' ) and
                    ( uvHani.pvrEdCode[0] <> '' ) then
            begin
                SQL.Add('  AND  (MT.GCode <= :ExCode)   ');
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
(*
			// <HAN> >>
            SQL.Add('  AND  (mt.GCode >= :ExStCode)     ');
		    SQL.Add('  AND  (mt.GCode <= :ExEdCode)     ');
            ParamByName('ExStCode').AsString   :=  uvHani.pvrStCode[0];
   			ParamByName('ExEdCode').AsString   :=  uvHani.pvrEdCode[0];
			// <HAN> <<
        end;

        // 出力順序
        if ( uvHani.pvrOrder = 0 ) then
            SQL.Add('ORDER BY MT.GCode, MTO.GCode ')
        else if ( uvHani.pvrOrder = 1 ) then
        	SQL.Add('ORDER BY MT.Renso, MTO.Renso, MT.GCode, MTO.GCode ')
        else if ( uvHani.pvrOrder = 2 ) then
            SQL.Add('ORDER BY MTO.GCode, MT.GCode ')
        else
        	SQL.Add('ORDER BY MTO.Renso, MT.Renso, MTO.GCode, MT.GCode ');

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
            //<130>
            if (sPreOyaCD <> FieldByName('OyaGCode').AsString) then
			begin

                sPreOyaCD := FieldByName('OyaGCode').AsString;
                //sOyaCD := FieldByName('OyaGCode').AsString;
            //<130>
			    if ( m_TRCodeAttr <= 1 ) then
			    begin
				    case ( m_TRCodeAttr ) of
					    0: strFormat := '%'  + IntToStr (m_TRCodeDigit) + 'd';
					    1: strFormat := '%.' + IntToStr (m_TRCodeDigit) + 'd';
				    end;

				    sOyaCD := Format(strFormat,[StrToInt64(Trim(sPreOyaCD))]);
			    end;
            end
            //<130>
            else
            begin
                sOyaCD := '';
            end;
            //<130>

			MemPrintNayose.Append;
			MemPrintNayose.FieldByName('HojCode'     ).AsString  := sHojCD;                           // 名寄せ子外部ｺｰﾄﾞ(DB用)
			MemPrintNayose.FieldByName('BaseHojCode' ).AsString  := GetFld('SGCode'   ).AsString;	 // 名寄せ子外部ｺｰﾄﾞ(表示用)
			MemPrintNayose.FieldByName('SName'       ).AsString  := GetFld('SNAME'    ).AsString;	 // 名寄せ子名称
			MemPrintNayose.FieldByName('OyaHojCD'    ).AsString  := sOyaCD;                           // 名寄せ親外部ｺｰﾄﾞ(DB用)
            MemPrintNayose.FieldByName('OyaBaseHojCD').AsString  := GetFld('OyaGCode' ).AsString;	 // 名寄せ親外部ｺｰﾄﾞ(表示用)
            //<130>
            if  sOyaCD <> '' then
            begin
			    MemPrintNayose.FieldByName('OyaName'     ).AsString  := GetFld('OYANAME'  ).AsString;	 // 名寄せ親名称
            end;
            //<130>

			MemPrintNayose.FieldByName('PayNCode'    ).AsFloat   := GetFld('PayNCode' ).AsFloat;      // 名寄せ子内部ｺｰﾄﾞ
			MemPrintNayose.FieldByName('OyaNCode'    ).AsFloat   := GetFld('NayoseOyaNCode').AsFloat; // 名寄せ親内部ｺｰﾄﾞ

            MemPrintNayose.Post();
            Next;
        end;
	end;

    dqMasterData.Close();
	dqMasterData.Free();

end;
*)
// -----------------------------------------------------------------------------
//  印刷処理【一括請求登録リスト(簡略型/詳細型)　債権情報　名寄せ】
// -----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnPrnSETNayose();
var
	dqMasterData    :   TMQuery;
	sHojCD		:   String;
	sOyaCD		:   String;
	strFormat	:   String;
    sPreOyaCD   :   String;
    nKaisu		:	Integer;
    nPCloseDay	:	Integer;
    nPayMonth	:	Integer;
    nPayDay		:	Integer;
    nPHolidayKbn:	Integer;
    cPCloseDayNm:	String;
    cPayMonthNm	:	String;
    cPayDayNm	:	String;
    cPHolidayKbnNm:	String;
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
            +   '    NI.PayNCode                        '   // 子取引先内部ｺｰﾄﾞ
            +   '   ,NI.NayoseOyaNCode                  '   // 親取引先内部ｺｰﾄﾞ
            +   '   ,MT.GCode         as SGCode         '   // 子取引先外部ｺｰﾄﾞ
            +   '   ,MTO.GCode        as OYAGCode       '   // 親取引先外部ｺｰﾄﾞ
            +   '   ,MT.NM            as SNAME          '   // 子取引先名称
		    +   '   ,MTO.NM           as OYANAME        '   // 親取引先名称
            +   '   ,SE.UsKinKbn      as UsKinKbn       '   // 請求区分
            +   '   ,PA.CngNCode      as CngNCode       '   // 代替仕入先内部コード
            +   '   ,MTO.PEndKaisu                      '   // 締日回数
            +   '   ,MTO.PCloseDay1                     '   // 締日１
            +   '   ,MTO.PCloseDay2                     '   // 締日２
            +   '   ,MTO.PCloseDay3                     '   // 締日３
            +   '   ,MTO.PayMonth1                      '   // 支払日１
            +   '   ,MTO.PayMonth2                      '   // 支払日２
            +   '   ,MTO.PayMonth3                      '   // 支払日３
            +   '   ,MTO.PayDay1                        '   // サイクル１
            +   '   ,MTO.PayDay2                        '   // サイクル２
            +   '   ,MTO.PayDay3                        '   // サイクル３
            +   '   ,MTO.PHolidayKbn1                   '   // 休日区分(１)
            +   '   ,MTO.PHolidayKbn2                   '   // 休日区分(２)
            +   '   ,MTO.PHolidayKbn3                   '   // 休日区分(３)
//            +   '   ,SE.TrSeiKbn                        '
            +   'from PayNayoseInfo NI                  '
            +   'left outer join MTOKUI MT              '
            +   '   on (NI.PayNCode = MT.NCode)         '
            +   'left outer join MTOKUI MTO             '
            +   '   on (NI.NayoseOyaNCode = MTO.NCode)  '
            +   'left outer join MTOKUI_SEL SE          '
            +   '   on (SE.BaseNCode = NI.NayoseOyaNCode and se.RecKBN = 2) '
            +   'left outer join MTOKUI_PAY PA          '
            +   '   on (PA.BaseNCode = NI.NayoseOyaNCode) '
            +   'where (NI.MasterKbn = 22 )             '
//            +   '  and (NI.NayoseSyu = 1  )             '
            +   '  and (NI.NayoseSyu = :SYU )           '   // <159> Mod
            +   '  and (NI.NayoseKbn = 1  )             ');

// <159> 2008/02/29 H.Kawato Add Start
        if (uvHani.pvrPattern = 5) then
            ParamByName('SYU').AsInteger := 2               // 通知書名寄せ
        else
            ParamByName('SYU').AsInteger := 1;              // 名寄せ
// <159> 2008/02/29 H.Kawato Add End

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
			MemPtnNayose.FieldByName('BaseHojCode' ).AsString  := GetFld('SGCode'   ).AsString;	    // 名寄せ子外部ｺｰﾄﾞ(表示用)
			MemPtnNayose.FieldByName('SName'       ).AsString  := GetFld('SNAME'    ).AsString;	    // 名寄せ子名称
			MemPtnNayose.FieldByName('OyaHojCD'    ).AsString  := sOyaCD;                           // 名寄せ親外部ｺｰﾄﾞ(DB用)
			MemPtnNayose.FieldByName('OyaBaseHojCD').AsString  := GetFld('OyaGCode' ).AsString;	    // 名寄せ親外部ｺｰﾄﾞ(表示用)
		    MemPtnNayose.FieldByName('OyaName'     ).AsString  := GetFld('OYANAME'  ).AsString;	    // 名寄せ親名称
			MemPtnNayose.FieldByName('PayNCode'    ).AsFloat   := GetFld('PayNCode' ).AsFloat;      // 名寄せ子内部ｺｰﾄﾞ
			MemPtnNayose.FieldByName('OyaNCode'    ).AsFloat   := GetFld('NayoseOyaNCode').AsFloat; // 名寄せ親内部ｺｰﾄﾞ

            // 請求区分名称取得    			
            for i := Low(_SeikyuKbnItems) to High(_SeikyuKbnItems) do
            begin
            	if GetFld('UsKinKbn').AsInteger = _SeikyuKbnItems[i].iCode then
                    MemPtnNayose.FieldByName('SeikyuKbnNm'	).AsString	:=  _SeikyuKbnItems[i].sName;
            end;

            // 支払締日情報1～3
            for nKaisu := 1 to GetFld('PEndKaisu'   ).AsInteger do
            begin
                nPCloseDay	 	:= GetFld('PCloseDay'  +IntToStr(nKaisu)).AsInteger;   	// 締日
                nPayMonth	 	:= GetFld('PayMonth'   +IntToStr(nKaisu)).AsInteger;   	// ｻｲｸﾙ
	            nPayDay      	:= GetFld('PayDay'	   +IntToStr(nKaisu)).AsInteger;	// 支払日
	            nPHolidayKbn    := GetFld('PHolidayKbn'+IntToStr(nKaisu)).AsInteger;	// 休日区分

	            cPCloseDayNm 	:= Format('%d日締'  , [ nPCloseDay ]);				   	// 締日名称
	            cPayMonthNm  	:= MjsHanFormat('%-7s'    , [ _ExpectItems [nPayMonth] ]);   	// ｻｲｸﾙ名称
	            cPayDayNm    	:= Format('%d日支払', [ nPayDay ]);						// 支払日名称
                cPHolidayKbnNm	:= MjsHanFormat('%-8s'    , [ _HolidayItems[nPHolidayKbn] ]);	// 休日区分名称

			    MemPtnNayose.FieldByName('PCloseDay'  +IntToStr(nKaisu)).AsInteger 		:= nPCloseDay;	   	// 締日名称
			    MemPtnNayose.FieldByName('PayMonth'   +IntToStr(nKaisu)).AsInteger 		:= nPayMonth;	   	// ｻｲｸﾙ名称
			    MemPtnNayose.FieldByName('PayDay'     +IntToStr(nKaisu)).AsInteger 		:= nPayDay;	 		// 支払日名称
			    MemPtnNayose.FieldByName('PHolidayKbn'+IntToStr(nKaisu)).AsInteger 		:= nPHolidayKbn;	// 休日区分名称

			    MemPtnNayose.FieldByName('PCloseDay'  +IntToStr(nKaisu)+'Nm').AsString  := cPCloseDayNm;	// 締日名称
			    MemPtnNayose.FieldByName('PayMonth'   +IntToStr(nKaisu)+'Nm').AsString  := cPayMonthNm;	 	// ｻｲｸﾙ名称
			    MemPtnNayose.FieldByName('PayDay'     +IntToStr(nKaisu)+'Nm').AsString  := cPayDayNm;	 	// 支払日名称
			    MemPtnNayose.FieldByName('PHolidayKbn'+IntToStr(nKaisu)+'Nm').AsString  := cPHolidayKbnNm;	// 休日区分名称
        	end;

			// 代替記号
            if GetFld('PayNCode').AsFloat = GetFld('CngNCode').AsFloat then
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
// <151> 2007/05/07 H.Kawato Mod End
// 051114 <<


//-----------------------------------------------------------------------------
// BChangeClick()   <118>
//  < 切出・埋込処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.BChangeClick(Sender: TObject);
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
procedure TJNTCRP004005F.evtGridNayoseKeyPress(Sender: TObject;
  var Key: Char);
begin
	if (TdxDBGrid(Sender).FocusedColumn = 0) or (TdxDBGrid(Sender).FocusedColumn = 2) then  // ｺｰﾄﾞｶﾗﾑ
	begin
		if m_TRCodeAttr <= 1 then
		begin
			if  ((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9) and (Key <> #13) then
			begin                          // #8=BackSpace   #27=Esc  #9=Tab #13=Enter
				Beep ();
				Abort;
			end;
		end;
	end;
end;

// <136> 2006/07/24 H.Kawato Add Start
//-----------------------------------------------------------------------------
// f1SKYKBNChange
//  < 基本情報／請求区分変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.f1SKYKBNChange(Sender: TObject);
var
    nCngNCode   : Extended;                 // <143> Add
begin
    nCngNCode   := 0;                       // <143> Add

    if f1SKYKBN.value = 1 then              //親一括請求一括支払
    begin
        NayoseOyaLabel.Enabled  := TRUE;
        f1NayoseOyaCode.enabled	:= TRUE;
        f1NayoseNM.enabled 		:= TRUE;
// <143> 2006/09/26 H.Kawato Add Start
        //「連動取引先」の使用可/不可チェック
        if ( Trim(f1NayoseOyaCode.Text) <> '' ) then
            nCngNCode := fnGetNCODE(f1NayoseOyaCode.text, 22, m_TrCodeAttr);

        if ( nCngNCode <> 0 ) and           // 名寄せ親代替仕入先の登録あり
//           ( m_bMankiChkFlg ) and           // 期日指定振込満期ﾃﾞｰﾀなし   // <149> Del
           ( m_bRenAdoptFlg ) and           // 連動得意先採用済ﾁｪｯｸ
           ( m_bSKNLicense  ) then          // 債権ﾗｲｾﾝｽﾁｪｯｸ
        begin
            LblRendouCode.Enabled := True;
            f1RendouCode.Enabled  := True;
            f1RendouNM.Enabled    := True;
        end
        else
        begin
            if ( m_TRCodeAttr <> 2 ) then
            begin
                if ( f1RendouCode.InputFlag = FALSE ) then
                        f1RendouCode.Zero    :=  TRUE
                else    f1RendouCode.Zero    :=  FALSE;
            end
            else
                f1RendouCode.Zero := FALSE;

            f1RendouCode.InputFlag	:= True;
            f1RendouCode.Text		:= '';
            f1RendouNM.Caption      := '';

            LblRendouCode.Enabled := False;
            f1RendouCode.Enabled  := False;
            f1RendouNM.Enabled    := False;
        end;
// <143> 2006/09/26 H.Kawato Add End
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

// <143> 2006/09/26 H.Kawato Add Start
        LblRendouCode.Enabled := False;
        f1RendouCode.Enabled  := False;
        f1RendouNM.Enabled    := False;
// <143> 2006/09/26 H.Kawato Add End
    end;

// <140> 2006/09/21 H.Kawato Add
    // 編集ｽｲｯﾁを設定する
    if ( m_EdtSw = False ) then m_EdtSw := True;
// <140> 2006/09/21 H.Kawato Add

end;

//-----------------------------------------------------------------------------
// fnGetMTOKUI_Info
//
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
// <138> 2006/08/16 H.Kawato Mod    
//function TJNTCRP004005F.fnGetMTOKUI_Info(sNCode: Extended): Boolean;
function TJNTCRP004005F.fnGetMTOKUI_Info(sNCode: Extended): Integer;
// <138> 2006/08/16 H.Kawato Mod    
type
    PSimeInfo = record
        PEndKaisu		:	Integer;
        PCloseDay1		:	Integer;
        PCloseDay2		:	Integer;
        PCloseDay3		:	Integer;
        PayMonth1		:	Integer;
        PayMonth2		:	Integer;
        PayMonth3		:	Integer;
        PayDay1			:	Integer;
        PayDay2			:	Integer;
        PayDay3			:	Integer;
        PHolidayKbn1	:	Integer;
        PHolidayKbn2	:	Integer;
        PHolidayKbn3	:	Integer;
        TrSeiKbn		:	Integer;
    end;
var
    Qry : TMQuery;
    Daitai, Goukei : PSimeInfo;
    nCount : Integer;               // <138> 2006/08/16 H.Kawato Add    

    function GetSimeInfo(sNCode: Extended):PSimeInfo;
	var
	    Qry : TMQuery;
    begin
        Result.PEndKaisu    := 0;	// 締日回数
        Result.PCloseDay1  	:= 0;   // 締日1
        Result.PCloseDay2  	:= 0;   // 締日2
        Result.PCloseDay3  	:= 0;   // 締日3
        Result.PayMonth1  	:= 0;	// ｻｲｸﾙ1
        Result.PayMonth2  	:= 0;	// ｻｲｸﾙ2
        Result.PayMonth3  	:= 0;	// ｻｲｸﾙ3
        Result.PayDay1 		:= 0;	// 支払日1
        Result.PayDay2 		:= 0;	// 支払日2
        Result.PayDay3 		:= 0;	// 支払日3
        Result.PHolidayKbn1	:= 0;	// 休日区分1
        Result.PHolidayKbn2	:= 0;	// 休日区分2
        Result.PHolidayKbn3	:= 0;	// 休日区分3
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
                    +   '    PEndKaisu             '	        		// 締日回数
                    +   '   ,PCloseDay1            '	        		// 締日1
                    +   '   ,PCloseDay2            '	        		// 締日2
                    +   '   ,PCloseDay3            '            		// 締日3
                    +   '   ,PayMonth1             '            		// ｻｲｸﾙ1
                    +   '   ,PayMonth2             '            		// ｻｲｸﾙ2
                    +   '   ,PayMonth3             '            		// ｻｲｸﾙ3
                    +   '   ,PayDay1               '            		// 支払日1
                    +   '   ,PayDay2               '            		// 支払日2
                    +   '   ,PayDay3               '            		// 支払日3
                    +   '   ,Isnull(PHolidayKbn1,0) as PHolidayKbn1 ' 	// 休日区分1
                    +   '   ,Isnull(PHolidayKbn2,0) as PHolidayKbn2 ' 	// 休日区分2
                    +   '   ,Isnull(PHolidayKbn3,0) as PHolidayKbn3 ' 	// 休日区分3
                    +   '   ,TrSeiKbn              '            		// 取引先請求区分
                    +   'from MTOKUI               '
                    +   '     left outer join MTOKUI_SEL se         '
                    +   '     on (BaseNCode = NCode and RecKBN = 2) '
                    +   'where RDelKbn   = 0     '
                    +   '  and HojyoKbn2 = 1     '
                    +   '  and NCode = :NCode    ');
                ParamByName('NCode').AsFloat := sNCode;

                Open;

                Result.PEndKaisu  	:= FieldByName('PEndKaisu'	 ).AsInteger;	// 締日回数
                Result.PCloseDay1  	:= FieldByName('PCloseDay1'	 ).AsInteger;   // 締日1
                Result.PCloseDay2  	:= FieldByName('PCloseDay2'	 ).AsInteger;   // 締日2
                Result.PCloseDay3  	:= FieldByName('PCloseDay3'	 ).AsInteger;   // 締日3
                Result.PayMonth1  	:= FieldByName('PayMonth1'	 ).AsInteger;	// ｻｲｸﾙ1
                Result.PayMonth2  	:= FieldByName('PayMonth2'	 ).AsInteger;	// ｻｲｸﾙ2
                Result.PayMonth3  	:= FieldByName('PayMonth3'	 ).AsInteger;	// ｻｲｸﾙ3
                Result.PayDay1 		:= FieldByName('PayDay1'	 ).AsInteger;	// 支払日1
                Result.PayDay2 		:= FieldByName('PayDay2'	 ).AsInteger;	// 支払日2
                Result.PayDay3 		:= FieldByName('PayDay3'	 ).AsInteger;	// 支払日3
                Result.PHolidayKbn1 := FieldByName('PHolidayKbn1').AsInteger;	// 休日区分1
                Result.PHolidayKbn2 := FieldByName('PHolidayKbn2').AsInteger;	// 休日区分2
                Result.PHolidayKbn3	:= FieldByName('PHolidayKbn3').AsInteger;	// 休日区分3
            	Result.TrSeiKbn		:= FieldByName('TrSeiKbn'	 ).AsInteger;
            end;
        finally
            Qry.Close;
            Qry.Free;
        end;
    end;
begin
// <138> 2006/08/16 H.Kawato Mod    
//	Result := True;
	Result := 0;
// <138> 2006/08/16 H.Kawato Mod    

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
                +	'from  PayNayoseInfo '
                +   'where (MasterKbn = 22 ) '
                +   '  and (NayoseSyu = 1  ) '
                +   '  and (NayoseKbn = 1  ) '
                +   '  and (NayoseOyaNCode = :NCode) ');
            ParamByName('NCode').AsFloat := m_TRNCode;

            Open;

            // 名寄せが存在しない場合はOK
// <138> 2006/08/16 H.Kawato Mod
//            if GetFld('CNT').AsInteger = 0 then
//                Exit;
            nCount := GetFld('CNT').AsInteger;
// <138> 2006/08/16 H.Kawato Mod
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
// <138> 2006/08/16 H.Kawato Mod
//        Result := False;
        Result := -2;
// <138> 2006/08/16 H.Kawato Mod
        if SimeChkFlg = 1 then Result := 0; // <164> 締日チェック不要の場合は、エラーとしない。
        Exit;
    end;

// <138> 2006/08/16 H.Kawato Add
    // 名寄せが存在しない場合は取得しない
    if nCount = 0 then
    	Exit;
// <138> 2006/08/16 H.Kawato Add

    if ( Daitai.PEndKaisu    <> Goukei.PEndKaisu    ) or
       ( Daitai.PCloseDay1   <> Goukei.PCloseDay1   ) or
       ( Daitai.PCloseDay2   <> Goukei.PCloseDay2   ) or
       ( Daitai.PCloseDay3   <> Goukei.PCloseDay3   ) or
       ( Daitai.PayMonth1  	 <> Goukei.PayMonth1    ) or
       ( Daitai.PayMonth2  	 <> Goukei.PayMonth2    ) or
       ( Daitai.PayMonth3  	 <> Goukei.PayMonth3    ) or
       ( Daitai.PayDay1 	 <> Goukei.PayDay1      ) or
       ( Daitai.PayDay2 	 <> Goukei.PayDay2      ) or
       ( Daitai.PayDay3 	 <> Goukei.PayDay3      ) or
       ( Daitai.PHolidayKbn1 <> Goukei.PHolidayKbn1 ) or
       ( Daitai.PHolidayKbn2 <> Goukei.PHolidayKbn2 ) or
       ( Daitai.PHolidayKbn3 <> Goukei.PHolidayKbn3 ) then
    begin
// <138> 2006/08/16 H.Kawato Mod    
//        Result := False;
        Result := -3;
// <138> 2006/08/16 H.Kawato Mod    
        if SimeChkFlg = 1 then Result := 0; // <164> 締日チェック不要の場合は、エラーとしない。
        Exit;
    end;
end;

procedure TJNTCRP004005F.GridNayoseCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
var
	nCol1, nCol2: Integer;
	nCode1, nCode2: Extended;
begin
//    if HedCsTab.Items.Selected <> 2 then Exit;  // <159> Add
	if not MemNayose.Active then Exit;
    if MemNayose.RecordCount = 0 then Exit;
	if ANode.HasChildren then Exit;
    if AFocused then Exit;

	with Sender as TdxDBGrid do
    begin
	    nCol1 := ColumnByFieldName('PayNCode').Index;
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
// <136> 2006/07/24 H.Kawato Add End

// <143> 2006/09/26 H.Kawato Add Start
// <149> 2007/04/16 H.Kawato Del Start
{
//-----------------------------------------------------------------------------
// fnRendoMankiChk(lvCode: Extended)
//      PARAM   : lvCode	:	取引先コード
//      VAR     :
//      RETURN  : Boolean   :   連動取引先の使用可/不可
//      MEMO    : 支払状況のﾁｪｯｸをする
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnRendoMankiChk(lvCode: Extended): Boolean;
var
    Qry     : TMQuery;
    strSQL  : String;
begin
    Result  := False;

    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    strSQL  := '';
    strSQL  := strSQL + 'SELECT 1 FROM PayKijituMankiData ';
    strSQL  := strSQL + 'WHERE MankiSyoKbn = 0 ';
    strSQL  := strSQL + 'AND PayNCode = ' + FloatToStr(m_TRNCode) + ' ';
    strSQL  := strSQL + 'AND SystemCode = 1 ';

    with (Qry) do
	begin
        Close();
  		SQL.Clear();
        SQL.Add(strSQL);
        Open();

        if ( EOF ) then
            Result := True;

        Close();

    end;

    Qry.Free();
end;
}
// <149> 2007/04/16 H.Kawato Del End

//-----------------------------------------------------------------------------
// fnRendoDataCheck(lvCode: Extended)
//      PARAM   : lvCode	:	取引先コード
//      VAR     :
//      RETURN  : Boolean   :   連動取引先の使用可/不可
//      MEMO    : 支払状況のﾁｪｯｸをする
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnRendoDataCheck(): Boolean;
var
    Qry         : TMQuery;
    strSQL      : String;
    lvNCODE     : Extended;
    lvRenNCD    : Extended;
    sHojCD      : String;
//    iNYKRootKbn : Integer;    // <150> Del

begin
    Result  := True;

    lvNCODE  := fnGetNCODE(f0CODE.text, 22, m_TrCodeAttr);
    lvRenNCD := fnGetNCODE(f1RendouCode.text, 22, m_TrCodeAttr);
    if (Trim(f0CODE.text) <> '') then   // 2006/12/15 H.Kawato Add テンプレートの時はチェックしない
    begin
        if (lvNCODE = lvRenNCD) then    // 取引先コードと連動得意先コードが同一の場合
        begin
            Result := FALSE;
            Exit;
        end;
    end;

    Qry := TMQuery.Create (Self);            
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    strSQL := '';
    strSQL := strSQL + 'SELECT RendoNCode FROM MTOKUI_PAY ';
    strSQL := strSQL + 'WHERE BaseNCode = ' + FloatToStr(lvRenNCD);

    with Qry do
    begin
        Close;
        SQL.Clear;
        SQL.Add(strSQL);
        Open;

        if ( not EOF ) then
        begin
            if ( FieldByName('RendoNCode').AsFloat <> 0 ) then
            begin
                Result := FALSE;
                Exit;
            end;
        end;
        Close;            
        Free;            
    end;

    sHojCD  := '';

    if ( m_TRCodeAttr <= 1 ) and (Trim(f1RendouCode.Text) <> '') then
    	sHojCD := Format('%.16d',[StrToInt64(Trim(f1RendouCode.Text))])
// <144> 2006/11/08 H.Kawato Add
    else if (m_TRCodeAttr = 2) then
        sHojCD := Trim(f1RendouCode.Text);
// <144> 2006/11/08 H.Kawato Add

// <150> 2007/05/07 H.Kawato Mod Start
{
    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    strSQL := '';
    strSQL := strSQL + 'SELECT NYKRootKbn FROM MTOKUI ';
    strSQL := strSQL + 'WHERE GCode = ' + AnsiQuotedStr(sHojCD, '''') + ' ';
    strSQL := strSQL + 'AND RDelKbn = 0 ';
    strSQL := strSQL + 'AND HojyoKbn1 = 1 ';

    with Qry do
    begin
        Close;
        SQL.Clear;
        SQL.Add(strSQL);
        Open;

        if ( EOF ) then
        begin
            Result := FALSE;
            Exit;
        end
        else
        begin
            iNYKRootKbn := FieldByName('NYKRootKbn').AsInteger; // 債権名寄せ区分
        end;
        Close;
        Free;
    end;

    if (iNYKRootKbn = 0) then       // 単独の場合
    begin

        Qry := TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

        strSQL := '';
        strSQL := strSQL + 'SELECT 1 FROM CRDNayoseInfo ';
        strSQL := strSQL + 'WHERE NknNCode = ' + FloatToStr(lvRenNCD) + ' ';
        strSQL := strSQL + 'AND NayoseSyu = 1 ';
        strSQL := strSQL + 'AND NayoseKbn = 1 ';
        strSQL := strSQL + 'AND MasterKbn = 22 ';

        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Add(strSQL);
            Open;

            if ( not EOF ) then     // データあり(名寄せ子)
            begin
                Result := FALSE;
                Exit;
            end;
            Close;
            Free;
        end;
    end;
}
    Qry := TMQuery.Create (Self);        
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    strSQL := '';
    strSQL := strSQL + 'SELECT 1 FROM CRDNayoseInfo AS CRD ';
    strSQL := strSQL + 'INNER JOIN MTOKUI_SEL AS SEL ';
    strSQL := strSQL + 'ON SEL.BaseNCode = CRD.NknNCode ';
    strSQL := strSQL + 'AND SEL.RecKbn = 1 ';
    strSQL := strSQL + 'AND (SEL.OyakoFlg = 2 or SEL.OyakoFlg = 3 or SEL.OyakoFlg = 11) ';
    strSQL := strSQL + 'WHERE CRD.NknNCode = ' + FloatToStr(lvRenNCD) + ' ';
    strSQL := strSQL + 'AND CRD.NayoseSyu = 1 ';
    strSQL := strSQL + 'AND CRD.MasterKbn = 22 ';

    with Qry do
    begin
        Close;
        SQL.Clear;
        SQL.Add(strSQL);
        Open;

        if ( not EOF ) then     // データあり(一括請求の名寄せ子、または各店別請求の名寄せ親)
        begin
            Result := FALSE;
            Exit;
        end;
        Close;
        Free;
    end;
// <150> 2007/05/07 H.Kawato Mod End
end;

//-----------------------------------------------------------------------------
// fnRendoAdoptChk(lvCode: Extended)
//      PARAM   : lvCode	:	取引先コード
//      VAR     :
//      RETURN  : Boolean   :   連動取引先の使用可/不可
//      MEMO    : 他の取引先の連動得意先に採用されているかチェックする
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnRendoAdoptChk(lvCode: Extended): Boolean;
var
    Qry     : TMQuery;
    strSQL  : String;
begin
    Result  := False;

    Qry := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);

    strSQL  := '';
    strSQL  := strSQL + 'SELECT 1 FROM MTOKUI_PAY ';
    strSQL  := strSQL + 'WHERE RendoNCode = ' + FloatToStr(lvCode);

    with (Qry) do
	begin
        Close();
  		SQL.Clear();
        SQL.Add(strSQL);
        Open();

        if ( EOF ) then
            Result := True;

        Close();

    end;

    Qry.Free();
end;
// <143> 2006/09/26 H.Kawato Add End

// <148> 2007/04/06 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnInsPayBaseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : PayBaseInfo(ItemID: 9003)が存在しない場合レコードを挿入
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.fnInsPayBaseInfo();
var
    dqMasterInfo : TMQuery;
    strSQL       : String;
begin
    // 名寄せ締日制限解除区分の存在チェック
    if not fnChkCloseDayKbn() then
    begin
        // MQueryの構築
        dqMasterInfo    := TMQuery.Create (Self);
        // DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

		SessionPractice(C_ST_PROCESS);				// <158>

        try
            with dqMasterInfo do
            begin
                Close();
                SQL.Clear();

                strSQL := 'Insert Into PayBaseInfo ('
                        + ' SystemCode'
                        + ',ItemID'
                        + ',ItemType'
                        + ',DataNum'
                        + ',UpdDateTM'
                        + ',InsDateTM'
                        + ',UpdTantoNCode'
                        + ') VALUES ('
                        + '1,9003,1,0,Now(),Now(),'
                        + FloatToStr(m_TantoNCode)
                        + ')';

                SQL.Add(strSQL);

                if ( not ExecSQL() ) then
                begin
                end;
            end;
        finally
			SessionPractice(C_ED_PROCESS);			// <158>
            dqMasterInfo.Close();
            dqMasterInfo.Free();
        end;
    end;
end;

//-----------------------------------------------------------------------------
// fnUpdPayBaseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ締日制限解除区分 PayBaseInfo(ItemID: 9003)の更新
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnUpdPayBaseInfo(iKbn: Integer): Boolean;
var
    dqMasterInfo : TMQuery;
    strSQL       : String;

begin
    Result  := True;
    // MQueryの構築        
    dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

	SessionPractice(C_ST_PROCESS);				// <158>

    try
        with dqMasterInfo do
        begin
            Close();
            SQL.Clear();

            strSQL := ' UPDATE PayBaseInfo Set '
                    + ' DataNum = ' + IntToStr(iKbn)
                    + ' WHERE SystemCode = 1 '
                    + ' AND ItemID = 9003 ';

            SQL.Add(strSQL);

            if ( not ExecSQL() ) then
            begin
                Result  := False;
            end;
        end;
    finally
		SessionPractice(C_ED_PROCESS);			// <158>
        dqMasterInfo.Close();
        dqMasterInfo.Free();
    end;
end;

//-----------------------------------------------------------------------------
// fnChkCloseDayKbn()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ締日制限解除区分を取得・存在チェック
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnChkCloseDayKbn(): Boolean;
var
    dqMasterInfo : TMQuery;
    
begin
    Result  := True;

    // MQueryの構築
    dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

    try
        with dqMasterInfo do
        begin
            Close();
        	SQL.Clear();
        	SQL.Add('SELECT DataNum         '
                +   'FROM PayBaseInfo       '
                +   'WHERE SystemCode = 1   '
                +   'AND ItemID = 9003      ');

        	Open();

            if not EOF then
                m_iCloseDayFlg := FieldByName('DataNum').AsInteger  // 名寄せ締日制限解除区分
            else
                Result := False;
        end;
    finally
        dqMasterInfo.Close();
        dqMasterInfo.Free();
    end;
end;

//-----------------------------------------------------------------------------
// fnChkPayNayoseInfo()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : 名寄せ件数チェック
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnChkPayNayoseInfo(): Boolean;
var
    dqMasterInfo : TMQuery;

begin
    Result  := False;

    // MQueryの構築
    dqMasterInfo    := TMQuery.Create (Self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

    try
        with dqMasterInfo do
        begin
            Close();
        	SQL.Clear();
        	SQL.Add('SELECT PayNCode '
                +   'FROM PayNayoseInfo '
                +   'WHERE RDelKbn = 0 '
                +   'AND NayoseKbn = 1 '
                +   'AND NayoseSyu = 1 '
                +   'AND MasterKbn = 22 ');

        	Open();

            if EOF then
                Result  := True;
        end;
    finally
        dqMasterInfo.Close();
        dqMasterInfo.Free();
    end;
end;

//-----------------------------------------------------------------------------
//     ファンクションの処理実行　<148>
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.AcCloseDayExecute(Sender: TObject);
var
    iValue  : Integer;
begin
    if (uvFncInfo.Caption[7] = 'F8 締日制限') then
    begin
// <161> ADD-STR
        if not fnChkPayNayoseInfo() then    // 名寄せあり
        begin
            MjsMessageBoxEX(Self,'名寄せデータが存在するため設定できません。','警告',mjWarning,mjOK,mjDefOK);
        end
        else
        begin
// <161> ADD-END
            MjsMessageBox(Self,'締日の一致した取引先同士でのみ名寄せ設定が可能となります。'#13#10
// <161> MOD-STR
//                          + '今後作成したデータについては、締日関係の帳票での正しい出力が可能となります。'
                            + '今後、仕入伝票データの処理が可能となります。'
// <161> MOD-END
                            ,mjInformation,mjDefOK);
            fnUpdPayBaseInfo(0);
        end;        // <161> ADD
    end
    else
    begin
        iValue := MjsMessageBoxEX(Self,'締日の整合性に関わらず名寄せの設定を行うことができるようになります。'#13#10
// <161> MOD-STR
//                                  + '今後、締日関係の帳票で正しいデータを出力することができなくなりますが、よろしいですか？',
                                    + '今後、仕入伝票データを処理することができなくなりますが、よろしいですか？',
// <161> MOD-END
                                    '確認',mjQuestion,mjYesNo,mjDefNo);
        if iValue = mrYes then
        begin
// <161> MOD-STR
//          MjsMessageBoxEX(Self,'この設定により、締日関係の処理を行えなくなります。','警告',mjWarning,mjOK,mjDefOK);
            MjsMessageBoxEX(Self,'この設定により、仕入伝票関係の処理を行えなくなります。','警告',mjWarning,mjOK,mjDefOK);
// <161> MOD-END
            fnUpdPayBaseInfo(1);
        end;
    end;

    fnSetFncType(0);
    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
    fnSetFncEnabled();
end;
// <148> 2007/04/06 H.Kawato Add End

//-----------------------------------------------------------------------------
// DtlCsTabChange <157>
//  < 基本情報／支払情報タブ変更処理 >
//      PARAM   : Sender : TObject
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP004005F.DtlCsTabChange(Sender: TObject);
begin

    if ( m_bFirstFlag = FALSE ) then Exit;

// <176> DEL-STR
//  // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
//  if ( m_iVerData < 6 ) then Exit;    // <157> Add
// <176> DEL-END

    DtlCsTab.SetFocus;

    if ( DtlCsTab.Items.Selected = 0 ) then
            DtlCsTab.Items.Selected := 0
    else    DtlCsTab.Items.Selected := 1;

	// ﾎﾞﾀﾝEnabled制御処理
    fnBtnEnbChg;

end;

// <157> 2007/08/22 H.Kawato Add Start
//-----------------------------------------------------------------------------
// fnGetPayBaseInfoNum()
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    : PayBaseInfoより情報を取得
//-----------------------------------------------------------------------------
function TJNTCRP004005F.fnGetPayBaseInfoNum(iItemID: Integer): Integer;
var
    dqMasterInfo : TMQuery;
    strSQL       : String;
begin
    Result := 0;

    strSQL := 'SELECT DataNum FROM PayBaseInfo '
            + 'WHERE SystemCode = 1 '
            + 'AND ItemID = ' + IntToStr(iItemID);

    // MQueryの構築
    dqMasterInfo    := TMQuery.Create (Self);
    
    try
        // DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);

        with dqMasterInfo do
        begin

            Close();
        	SQL.Clear();
        	SQL.Add(strSQL);
        	Open();

            if not EOF then
                Result  := GetFld('DataNum') .AsInteger;
        end;
    finally
        dqMasterInfo.Close();
        dqMasterInfo.Free();
    end;
end;
// <157> 2007/08/22 H.Kawato Add End

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<158>
//	Name		:	T.Seki
//	Date		:	2008/01/30
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004005F.SessionPractice(iSyori: Integer);
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
// Delphi10 ED

	if	m_SyncMaster.m_flgGrpCorp = 1 then		// ｸﾞﾙｰﾌﾟ会計の子会社の場合
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

// <163> ADD-STR
//-----------------------------------------------------------------------------
// fnCheckIsSpot()
//      PARAM   : CD    名寄せ外部ｺｰﾄﾞ
//      VAR     :
//      RETURN  : T : 存在する F: 存在しない
//      MEMO    : 名寄せ更新前処理
//-----------------------------------------------------------------------------
function    TJNTCRP004005F.fnCheckIsSpot(sPayCD: String): Boolean;
var
    DmqData :   TMQuery;
    strSQL  :   String;
begin
	Result := FALSE;

    if (sPayCD = '') then
        Exit;

	if ( m_TRCodeAttr <= 1 ) then
		sPayCD := Format ('%.16d',[StrToInt64(Trim(sPayCD))]);

    // スポット支払支払先として設定された支払先は名寄せ選択不可
    strSQL  := 'SELECT MT.NCode '
             + '  FROM PayBaseInfo PBI '
             + '  LEFT OUTER JOIN PayBaseInfo PBI2 '
             + '    ON PBI.SystemCode = PBI2.SystemCode '
             + '   AND PBI.ItemID + 1 = PBI2.ItemID '
             + '  LEFT OUTER JOIN MTOKUI MT '
             + '    ON MT.NCode = PBI2.DataNum '
             + '   AND MT.RDelKbn = 0 '
             + ' WHERE PBI.SystemCode = 1 '
             + '   AND PBI.ItemID = 4031 '
             + '   AND PBI.DataNum = 1 '
             + '   AND MT.GCode = ' + AnsiQuotedStr(sPayCD, '''') + ' ';

    // MQueryの構築
    DmqData := TMQuery.Create( Self );
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

    try
    	with ( DmqData ) do
    	begin
    		Close();
    		SQL.Clear();
    		SQL.Add(strSQL);

    		if ( not Open () ) then
    		begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, DmqData);

                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (DmqData);

                DmqData.Close();
                DmqData.Free();

    			Result := FALSE;
    			Exit;
    		end;

    		if ( EOF <> True ) then
    		begin
    			Result := True;
    		end;
    	end;
    finally
        DmqData.Free();
    end;
end;
// <163> ADD-END

// <164> ADD-STR
//**********************************************************************
//*     Proccess	:fnSimeChk関数　<164>
//*　　 True :締め日チェックなし（神鋼対応）
//* 	False:締め日チェックあり（標準モード）
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004005F.fnSimeChk(): Boolean;
const
    PAY_FileName			= 'MAS\PRG\PayControl.APG';
var
    cPath, cFileName : String;
    oIniFile : TIniFile;
    nKBN : Integer;

begin
    Result := False;		//デフォルト
    m_FeeBmnFlg := 0;		// <175> Add

    //実行ファイルのパス取得(Iniファイルも同じフォルダに必要)
    cPath := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot;
    if not IsPathDelimiter(cPath, Length(cPath)) then cPath := cPath + '\';

    cFileName := cPath + PAY_FileName;

    //個別用Iniファイルが存在しなければ、標準のモード。
    if  not FileExists(cFileName) then
        Result := False

        else
        begin
        	oIniFile := Nil;
			try
            	oIniFile := TIniFile.Create(cFileName);
            	nKBN := oIniFile.ReadInteger('Master', 'NAYOSE_CHKOFF', 0);
                //INIファイルが存在してかつ区分が1の場合は、名寄せ時の締め日チェックをしないモードに変更。
            	if  nKBN = 1 then
                 begin
                 	Result := true;
                 end;

                // <175> Add start
            	nKBN := oIniFile.ReadInteger('Shiharai', 'PAYSWK_FEEBMN', 0);
                //INIファイルが存在してかつ区分が1の場合は、部門フィールドを有効にする
            	if  nKBN > 0 then
                begin
                 	m_FeeBmnFlg := 1;

                 	DtlCs1LabelBmnNameTitle.Enabled := True;
					DtlCs1LabelBmnNameTitle.Visible := True;
                    f1BmnCode.Enabled := True;
                    f1BmnCode.Visible := True;
                    f1BmnName.Enabled := True;
                    f1BmnName.Visible := True;
                    
                end;
                // <175> Add end
            finally
            	if Assigned(oIniFile) then oIniFile.Free;
    		end;
        end;
end;


//**********************************************************************
//	Proccess	:	部門コードキー入力	<175>
//	Name		:	MSI G.Kojima
//	Date		:
//	Parameter	:
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004005F.f1BmnCodeKeyPress(Sender: TObject; var Key: Char);
begin
    // エクスプローラから取得した内部コードをクリア（外部コードから内部コードを再取得）
    m_BumonNcodeEx := 0;
end;

end.
