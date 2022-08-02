//******************************************************************************
//  System      :   新会計システム 支払管理システム
//  Program     :   銀行情報登録 依頼先銀行
//  ProgramID   :   JNTCRP008002
//  Name        :   ？？？
//  Create      :   ？？？
//  Comment	    :
//	History	    :   2000 / 99 / 99	X.Xxxxxx
//					        XXXXXXXX更新内容XXXXXXX
//                  2003 / 04 /08   T.Aoki ( MJS )
//                  <#1>  仕訳入力不可の科目を入力できないように修正
//					2003 / 06 / 30	H.Endo ( MJS )
//					<#2>  排他制御対応
//					2004 / 04 / 15	H.Endo ( MJS )	<T1612>
//					<#3>  分散仕訳未連結時に支払先を削除しようとすると正しいｴﾗｰﾒｯｾｰｼﾞではなくｷｰ違反のﾒｯｾｰｼﾞがでる。
//					2005 / 01 / 17	H.Endo ( MJS )
//					<#4>  解像度対応
//==============================================================================
//
//  修正履歴
//  <ﾏｰｸ> <修正者>   <修正日>        <修正内容>
//  <   > 井上佳美   2005.07.05(Thu) 付箋に関する部分を一斉にコメント（現在、依頼先銀行に付箋機能はなし）
//  <001> 井上佳美   2005.07.29(Fri) 権限機能を追加（削除権限のみ）
//  <002> 高橋功二   2005.08.19(FRI) JNTCommonを親から引き継ぐように修正
//  <003> 飯塚健介   2005.08.25(Thu) 詳細画面上に残ったデータが更新されてしまうのを修正
//  <004> 飯塚健介   2005.08.30(Thu) 全銀協の銀行ｺｰﾄﾞ桁数がMasterInfoの情報によって変更されるのを修正
//                                   銀行は4桁固定 支店は3桁固定とする
//  <   > 飯塚健介   2005.08.30(Thu) ｸﾞﾘｯﾄﾞ休日ｺｰﾄﾞのImeModeをimDontCare→imDisable
//  <005> 飯塚健介   2005.08.30(Thu) 印刷ﾎﾞﾀﾝの継承
//  <   > 飯塚健介   2005.08.31(Wed) 「預金種別」→「預金種目」にCaptionを変更
//  <KEY> 飯塚健介   2005/09/02(FRI) TMTxtEdit強制ｷｰｲﾍﾞﾝﾄ
//  <006> 飯塚健介   2005/09/02(FRI) 休日一括登録のPOPUPが何処でも表示できてしまうのを修正
//  <007> 飯塚健介   2005/09/02(FRI) 休日ﾀﾞｲｱﾛｸﾞの色修正
//  <008> 飯塚健介   2005/09/02(FRI) ﾌｧﾝｸｼｮﾝF8をCmnStatusBarに表示せず、MSPFunctionBarに表示するように修正
//  <009> 飯塚健介   2005/09/06(Tue) 評価ﾚﾎﾟｰﾄ№105 Or №108:ﾗﾍﾞﾙのCaptionが変わるように修正
//  <010> 飯塚健介   2005/09/06(Tue) 評価ﾚﾎﾟｰﾄ№106:銀行がパネル上に入力出来るよう出てこないのを修正
//  <011> 飯塚健介   2005/09/06(Tue) ｴｸｽﾌﾟﾛｰﾗｰｴﾗｰ対応
//  <012> 飯塚健介   2005/09/06(Tue) ﾌﾟﾛｼﾞｪｸﾄでSQLが作成されないｴﾗｰに対応
//  <013> 飯塚健介   2005/09/06(Tue) 0ｺｰﾄﾞ入力対応
//  <014> 飯塚健介   2005/09/06(Tue) 初期表示時、CmnGridAccInfoに依頼先銀行が表示されない現象を修正
//  <015> 飯塚健介   2005/09/06(Tue) 新規ﾃﾞｰﾀ入力時にCmnGridAccInfoにﾃﾞｰﾀが残る現象を修正
//  <016> 飯塚健介   2005/09/06(Tue) 銀行ｺｰﾄﾞを空白で先に進んだ場合に0が代入されてしまうのを抑止
//  <017> 飯塚健介   2005/09/06(Tue) 詳細から一覧に切り替えたときに依頼先口座を取得出来ない現象を回避
//  <018> 飯塚健介   2005/09/07(Wed) ｸﾞﾘｯﾄﾞからの更新時に詳細ﾊﾟﾈﾙの情報を元に更新がかかるのを回避
//  <019> 飯塚健介   2005/09/07(Wed) 依頼先口座削除時にｸﾞﾘｯﾄﾞの情報が初期化される現象を修正
//  <020> 飯塚健介   2005/09/07(Wed) 詳細画面から依頼口座ｺｰﾄﾞﾁｪｯｸ方法を修正
//  <021> 飯塚健介   2005/09/07(Wed) 評価ﾚﾎﾟｰﾄ№103:依頼先口座のPostｲﾍﾞﾝﾄでnNCode(BankNCode?)を代入
//  <022> 飯塚健介   2005/09/07(Wed) 取引先ﾃﾝﾌﾟﾚｰﾄ区分対応
//  <023> 飯塚健介   2005/09/21(Wed) 依頼先銀行Exp対応
//  <024> 飯塚健介   2005/09/28(Thu) 口座番号8桁固定
//  <025> 広田(PRIME)2005/10/18(Tue) ESCｷｰで終了できるように修正
//	<026> 広田(PRIME)2005/11/25(Fri) 科目別補助属性・桁数対応
//	<027> 広田(PRIME)2005/12/09(Fri) 共通部門に２が表示される対応
//		  広田(PRIME)2005/12/10(SAT) 謎のMTxtEdit1を削除
//	<028> 広田(PRIME)2005/12/13(TUE) 簡略名称対応
//  <CHK> 加藤(PRIME)2006/02/20(MON) 削除ﾁｪｯｸ対応
//  <029> 加藤(PRIME)2006/02/20(MON) 削除確認ﾒｯｾｰｼﾞで「いいえ」を選択してもｶﾚﾝﾄが動く不具合修正
//  <   > 加藤(PRIME)2006/02/22(WED) 連想の桁数12→10
//  <030> 加藤(PRIME)2006/02/22(WED) 削除権限がないときに削除できる不具合修正
//  <   > 加藤(PRIME)2006/02/23(THU) 次頁・前頁のﾋﾞｯﾄﾏｯﾌﾟ再設定
//  <031> 青木(PRIME)2006/03/15(WED) 仕訳情報での数字10桁登録時の不具合対応
//  <032> 加藤(PRIME)2006/03/20(MON) 仕訳情報の勘定科目には資金複合選択不可
//  <033> 加藤(PRIME)2006/03/20(MON) ﾌｧｲﾙﾊﾟｽに\が混ざっている場合の対応
//  <034> 加藤(PRIME)2006/03/20(MON) <024>の追加対応
//  <035> 加藤(PRIME)2006/03/22(WED) ｸﾞﾘｯﾄﾞで編集中に口座番号と依頼にｺｰﾄﾞがﾌｫｰﾏｯﾄされるように修正
//  <036> 飯塚健介   2006/04/06(THU) ｶｰﾄﾞ型入力時のExitｲﾍﾞﾝﾄで入力制御を追加
//  <037> 飯塚健介   2006/04/06(THU) 任意の項目で修正がある場合、その項目の後のﾁｪｯｸ（名称取得含む）を実行しなくなる不具合を修正
//  <038> 飯塚健介   2006/04/10(MON) ｸﾞﾘｯﾄﾞでの全銀協検索ｴｸｽﾌﾟﾛｰﾗｰを実装
//  <039> 飯塚健介   2006/04/10(MON) 全銀協支店検索ｴｸｽﾌﾟﾛｰﾗｰを実装
//  <040> 飯塚健介   2006/04/10(MON) 印刷ﾀﾞｲｱﾛｸﾞを削除
//  <   > 茂木勇次   2006/06/02(FRI) 1.04VerUP評価_不具合一覧 No.043対応
//  <   > 茂木勇次   2006/06/02(FRI) 1.04VerUP評価_不具合一覧 No.048対応
//  <041> 茂木勇次   2006/06/02(FRI) 1.04VerUP評価_不具合一覧 No.049対応
//  <042> 茂木勇次   2006/06/02(FRI) 1.04VerUP評価_不具合一覧 No.044対応
//  <043> 高橋功二   2006/10/23(MON) 銀行、支店名称(LENGTH_NAME_BANK)、連想(MaxLength)の桁修正
//  <044> 川戸仁美   2006/12/21(THU) プロジェクト別支払対応
//  <045> 川戸仁美   2007/04/17(THU) 口座管理情報登録を新規で登録時、区分にデフォルト値をセットする
//  <046> 川戸仁美   2007/06/04(MON) データ更新時、NULL値ではなくデフォルト値のセットを行う
//	<047> 茂木勇次   2007/06/07(THU) ｸﾞﾙｰﾌﾟ会社管理対応(子会社の場合は表示のみとする)
//                                   参照ﾓｰﾄﾞの場合の不具合対応。
//  <048> 佐藤(IDC)  2007/06/25(THU) 口座管理-仕訳情報にセグメント１が複数表示される場合がある
//  <049> 佐藤(IDC)  2007/06/25(MON) 銀行が一件も登録されていない状態で口座が登録できてしまう
//  <050> 佐藤(IDC)  2007/06/25(MON) 口座管理-仕訳情報で補助タイトルが長い場合切れる(FontRatioプロパティ変更:False→True)
//                                   一覧グリッド上で銀行のカナが10バイトしか入力できない(MaxLengthプロパティ変更:10→15)
//  <051> 佐藤(IDC)  2007/06/25(MON) 口座管理-仕訳情報でのセグメントがB/S・P/L区別されていない
//                                   併せて部門でも直接入力でP/L部門が入力できた点を修正
//
//  <052> 川戸仁美   2007/07/27(FRI) 工事を優先して仕訳科目のプロジェクト採用を行う
//  <053> 鈴木(PRIME)2007/07/31(TUE) 決算確定時は子の方で決算確定メッセージを出さないようにし、削除ボタンを無効にするように修正
//  <054> 鈴木(PRIME)2007/08/02(THU) 参照時は削除ボタンを無効にするよう修正
//  <055> 鈴木(PRIME)2007/08/02(THU) 追加権限なしおよび修正権限なしの場合、削除権限があっても削除できない不具合を修正
//  <056> 鈴木(PRIME)2007/08/23(THU) 追加権限なしおよび修正権限なしの場合、依頼先口座コードを入力できるように修正
//  <057> 鈴木(PRIME)2007/08/24(FRI) 追加権限なしおよび修正権限なしの場合、銀行情報グリッドの選択行切替で、
//									 口座管理情報グリッドの表示が切替わらない不具合を修正
//  <058> 鈴木(PRIME)2007/08/24(FRI) 追加権限なしおよび修正権限なしの場合、口座管理情報グリッドのデータが変更できてしまう不具合を修正
//  <059> 鈴木(PRIME)2007/08/24(FRI) 追加権限なしおよび修正権限なしの場合、保存確認メッセージを表示しないように修正
//	<060> 鈴木(PRIME)2007/08/28(TUE) 追加権限なしおよび修正権限なしの場合、標準手数料ボタンを無効にする
//  <061> 鈴木(PRIME)2007/12/11(TUE) ﾏｽﾀ更新履歴対応
//	<062> 関(PRIME)  2008/05/08(THU) 依頼先口座登録ﾘｽﾄ追加
//	<   > 鈴木(PRIME)2008/05/16(FRI) FB情報のﾌｫｰｶｽ順序を修正
//  <063> 鈴木(PRIME)2008/05/19(MON) 同一部門ｺｰﾄﾞ対応
//	<064> 鈴木(PRIME)2008/05/19(MON) 終了確認ﾒｯｾｰｼﾞでｷｬﾝｾﾙを選択した後、各制御が実行されない不具合を修正
//	<065> 関(PRIME)  2008/05/22(THU) 帳票の出力順序の見てる変数が違うので修正
//  <066> 鈴木(PRIME)2008/05/26(MON) 詳細画面で全てのﾃﾞｰﾀを削除し、一覧画面を表示したときｴﾗｰになってしまう不具合を修正
//  <067> 小川(RIT)  2008/08/04(MON) 口座番号の登録が8桁未満は7桁でDB更新
//  <068> 小川(RIT)  2008/08/04(MON) 第1補助（Or 第2補助）に銀行が採用されている場合は入力可とし、ブランクでの登録を可能とする
//  <DKAI>難波(LAB)  2008/08/27(WED) 名称に改行が入らないようにする
//	<069> 佐藤(IDC)  2009/02/03(TUE) 債務/経費精算で自動仕訳申請済みは修正不可
//	<070> 佐藤(IDC)  2009/08/24(MON) 仕訳情報のコードエディットに長体がかかっていなかった(デザイン変更のみ)
//	<071> 佐藤(IDC)  2009/08/24(MON) 仕訳情報のコードエディットで勝手に諸口が登録される
//	<072> 佐藤(IDC)  2009/12/07(TUE) 債務支払処理中は再分解確認メッセージを表示
//  <LPH> 佐藤(IDC)  2010/05/21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//  <073> 小島(MSI)  2010/06/28(MON) INSERT時、VALUESにセグメントのMasterKbnが含まれてしまっていた点を修正
//                                   INSERT文のカラム指定に余計なカンマが含まれてしまっていた点を修正
//  <074> 小島(MSI)  2010/06/28(MON) 依頼先銀行のセグメントが部門の採用区分で判定されてしまっていた点を修正
//  <075> 大田原(MSI)2011/01/14(FRI) 組戻対応：組戻依頼書ﾚｲｱｳﾄﾊﾟｽを追加
//  <076> 小島(MSI)  2011/03/01(TUE) 手数料支払区分追加	Ver4.04差分対応のため、一時使用不可に。
//  <077> 佐藤(GSOL) 2011/04/01(FRI) 印刷モジュールをUnLoadしていなかった点を修正
//  <078> 佐藤(GSOL) 2011/04/01(FRI) 使用不可項目へのSetFocusエラーを修正
//  <079> 佐藤(GSOL) 2011/04/01(FRI) ページ切替ボタンのフォーカス制御を取引先登録に合わせる
//  <080> 佐藤(GSOL) 2011/04/01(FRI) 依頼先口座登録リストの銀行コードに支店コードを追加出力
//  <081> 佐藤(GSOL) 2011/04/01(FRI) 依頼先銀行登録リストの入金口座の内容が誤っていた点を修正
//  <082> 佐藤(GSOL) 2011/04/05(TUE) グローバル変数の廃止
//  <083> 小島(MSI)	 2011/06/13(MON) 自動仕訳のWF申請中はメッセージを表示
//  <084> 佐藤(GSOL) 2011/10/05(WED) 振込種別の2.F/Bを廃止(0.全銀協FDとみなす)
//  <KDS> SATOH(GSOL)2012/02/07(TUE) ShiftState対応
//	<085> 張亜新(MJS)2012/04/19(THU) ・口座管理情報画面の「FB情報」→「FB／電子債権情報」へ変更
//									 ・勘定科目範囲追加：分析コードが支払手形の科目　
//  <086> 佐藤(GSOL) 2012/06/04(MON) 仕訳情報の取引先補助取得条件にテンプレート区分が漏れていた点を修正
//  <087> 佐藤(GSOL) 2012/06/22(FRI) 電子債権支払レイアウト設定対応
//  <088> 佐藤(GSOL) 2012/08/03(FRI) 各パスで「\n」などが消える場合の対応<XZF-0319>
//
// ========================↓MLX対応============================================
//
// <MLXHAP> 新保一馬 2013.01.25(Fri) MLX給与対応
// <DIC_BANK>新保一馬2013.03.01(Fri) 銀行辞書対応。（MLXでの新規対応。Galiでもこの仕様で動作することになります。）
// <090>    新保一馬 2013.03.01(Fri) グリッドにて、新規のみ、検索Expボタンを出す。
//
//  <091> 佐藤(GSOL) 2013/01/23(WED) <068>の修正でコード属性フリーが対応されていない不具合を修正
//  <092> 佐藤(GSOL) 2013/04/11(THU) 電子債権用フリー項目追加
//  <093> 佐藤(GSOL) 2013/05/01(WED) 期日指定振込科目切替対応
//  <094> 佐藤(GSOL) 2013/05/10(FRI) 電子記録債権手数料改良
//  <095> 佐藤(GSOL) 2013/07/10(MON) TMOpenDialogにはofNochangeDirオプションを使用する
//  <TX26>佐藤(GSOL) 2013/08/01(THU) H26消費税改正対応
//  <CDCHG>新保一馬  2013/08/14(Wed) コード変更統合対応
//  <DIC_BANK_2>新保一馬 2013.08.27(Tue) 銀行辞書対応（JNT系PGの仕様でTMjsAppRecord.rcSYSTEMAREAがTJNTMASComなために
//                                       Galiで銀行辞書を起動したとき、MjsColorChangeが正しく動作しない。グリッドの色がおかしくなる。
//                                       銀行辞書の仕様前後でrcSYSTEMAREAを切り替える対応を行った。）
//  <096> 大下(3A)   2014/01/06(MON) 外貨債務対応 手数料タブに海外送金を追加。レイアウト／送金情報タブに外国送金情報を追加
//  <097> 大下(3A)   2014/01/06(MON) 値変更時のチェック処理を修正（IDを追加、コントロール名変更、日付エディットの判定）
//  <C16> 雲         2014/07/02(WED) 取引先コード16桁対応（デザインのみ）
//                                   ・MemDataの補助コードstrHojCode04、strHojCode05をSizeを10→16に修正
//  <099> 佐藤(GSOL) 2014/09/18(THU) 口座メモ対応(旧Galiでは表示しない)
//  <102> 篠田(LAB)  2016/02/25(THU) 共通銀行と銀行辞書が同じコードの場合、正しく名称が取得できない不具合を修正
//  <103> 荒川(TakumiCo.)  2018/11/14(Wed) 全銀協（ZEDI）対応
//  <104> 荒川(TakumiCo.)  2018/11/21(Wed) 全銀協（ZEDI）対応 不具合指摘修正
//  <#NGEN>  小室(Admax)   2019/03/16(MON) 新元号対応
//  <105> 佐藤(GSOL) 2019/10/01(TUE) ジャパンネット銀行対応(依頼人コード0000000000)
//	<20200707>今野	 2020/07/07(TUE) 銀行口座メモ表示対応(OEY-0458)
//  <106> 江口(NEOTEX) 2021/06/09(WED) 銀行情報のガイドメッセージ対応(HAY-0292)
//  <107> 江口(NEOTEX) 2022/01/11(THU) 依頼先銀行_仕訳情報社員指定不具合修正(CVC-0064)
//******************************************************************************
unit JNTCRP008002u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.ExtCtrls, MJSSPFunctionBar, ComCtrls,
  MJSPageControl, VCL.ImgList, VCL.StdCtrls, MJSComboBox, MJSPanel, dxGrClms, dxTL,
  dxDBGrid, dxCntner, MJSGroupBox, MJSLabel, MJSEdits, MJSFunctionBar, MJSMsgStdu,
  JNTMasComu, MJSDBModuleu, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl, MJSDateCtrl, JNTMasWndIFu, MJSPreviewIFu,
  MJSTab, Db, dxmdaset, Menus, MJSCheckBox, MJSBitBtn, ppPrnabl, ppClass,
//<DIC_BANK>  CmnExpFuncu,
  CmnExpFuncExu, //<DIC_BANK>
  ppCtrls, ppModule, daDatMod, ppDB, ppBands, ppCache, ppDBPipe, ppComm, MJSCommonu, CommCtrl,
  ppRelatv, ppProd, ppReport, MjsPrnDlgu, MjsPrnSupportu, ppVar, ToolWin,
  MjsCommon2u{<#4>},
  MLBplLoaderU,     // <LPH> ADD
  MJSKeyDataState,	// <KDS> ADD
  Inifiles,         // <093> ADD
  JNTSelCorpSys,JNTExPGlobal,JNTPDlg,{<PRN>}
  JNTCRP008002_3u,
  //<040>JNTCRP008002_4u,
  JNTCRP008002_5u,
  JNTCRP008002_6u,  //<039>
// <TX26> ADD-STR
  JNTCRP008002_9u,
  JNTCRP008002_8u,
// <TX26> ADD-END
//↓<CDCHG>
  JNTCRP008002_ChgDlgU,
  MLManageru,
  FXLicense,
//↑<CDCHG>
  JNTMasTreee2Dlgu, MJSFormTab,
  JNTSelGlobal,
  JNTCommonu,
  JNTFuncU,
  SeriesCheckU,//<MLXHAP>
  dxExEdtr,		//<090>
  SeriesCheck2U,	// <20200707>Add
  ActnList, MJSTreeView, MJSSpeedButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer,
  ppParameter, FireDAC.Comp.DataSet, System.Actions, System.ImageList,
  Variants, System.AnsiStrings, MjsStrCtrl;


const
	WM_DISCONTINUE				= WM_APP + 1;
	WM_CHANGESCREENCONDITION	= WM_APP + 2;

type
	AccInfoData		= Record	nAccountCode	 : Integer;								// 口座ｺｰﾄﾞ
								nNBkCode      	 : Extended;  							// 内部銀行ｺｰﾄﾞ
								nDepDivision	 : Integer;								// 預金種別
								strAccountNo	 : String;								// 口座番号
								strClientCode	 : String;								// 振込依頼人ｺｰﾄﾞ
								strClientName	 : String;								// 振込依頼人名称
								strClientNameKana: String;								// ｶﾅ依頼人名称
								fDetails		 : Boolean;								// 詳細更新区分
	end;

	PAccInfoData	= ^AccInfoData;

	AdoptInfo		= Record	nMasterDivision: Integer;								// ﾏｽﾀ区分
								nAdoption	   : Integer;								// 採用区分
								nCodeDigit	   : Integer;								// ｺｰﾄﾞ桁数
								nCodeAttribute : Integer;								// ｺｰﾄﾞ属性
								strDescription : String;								// 名称
	end;

	CheckItemRec	= Record	nFieldID		: Integer;								// ﾌｨｰﾙﾄﾞID
								fNoCheck		: Boolean;
								fChangeData		: Boolean;
	end;

	PCheckItemRec	= ^CheckItemRec;

	CodeAttribute	= Record	nMasterDivision: Integer;
								nDigit		   : Integer;
								nAttribute	   : Integer;
								nClassCode	   : Integer;	  							// 部門分類ｺｰﾄﾞ(部門時のみ)
								strDescription : String;
								fEnabled	   : Boolean;
								fStatic		   : Boolean;
	end;

	TreeViewRec		= Record	nNCode        : Extended;
							  	nItemDivision : Byte;
								nBkCode       : Integer;
								nBrCode       : Integer;
								strDescription: String;
	end;

	PTreeViewRec	= ^TreeViewRec;

	BankInfoData		= Record
								nNCode	      : Extended;								// 内部ｺｰﾄﾞ
								nBkCode	      : Integer;								// 銀行ｺｰﾄﾞ
								nBrCode	      : Integer;								// 支店ｺｰﾄﾞ
								strBKName 	  : String;									// 正式名称
								strBKKana 	  : String;									// 銀行カナ
								strBrName 	  : String;									// 支店名称
								strBrKana 	  : String;									// 支店カナ
								strRenso 	  : String;									// 連想
								nHolCode 	  : Extended;							 	// 休日コード
								fDetails	  : Boolean;								// 詳細更新区分
	end;

    PBankInfoData    = ^BankInfoData;

	CodeCheckFlags	= Record	fKmkCode: Boolean;										// 仕訳情報 科目ｺｰﾄﾞ
	end;

    // ﾌｧﾝｸｼｮﾝ制御用<100>
    urFncInfo = record
        Caption: array[0..7] of String;
        Action:  array[0..7] of TAction;
    end;

{$include ActionInterface.inc} 			 												// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
{$include JNTMASWND_ColorDef.inc}
{$include JNTMASFUSENBIKODLGIFH.inc}
{$I JNTMasExceptIFI.inc}			// 排他制御		//<#2>
{$I JNTMasExceptIFH.inc}			// 排他制御		//<#2>
{$include JNTSelPrtIF.inc}              // <PRN>

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP008002f = class(TForm)
    CmnStatusBar: TStatusBar;
    CmnTreeView: TMTreeView;
    CmnSplitter: TSplitter;
    CmnPanelClientStandard: TMPanel;
    CmnTreeViewImage: TImageList;
    CmnPanelClientDetail: TMPanel;
    CmnScrollBoxInformation: TScrollBox;
    CmnPanelButtons: TMPanel;
    CmnPanelInformations: TMPanel;
    CmnTabInformations: TMTab;
    CmnPanelInformation01: TMPanel;
    CmnButtonUpdate: TMBitBtn;
    CmnButtonCancel: TMBitBtn;
    CmnPanelInformation04: TMPanel;
    CmnLabelClientNameKana: TMLabel;
    CmnLabelDepDivision: TMLabel;
    CmnLabelAccountCode: TMLabel;
    CmnLabel03002DepDivisionDesc: TMLabel;
    CmnLabelAccountNo: TMLabel;
    CmnEdit03001AccountCode: TMNumEdit;
    CmnEdit03002DepDivision: TMNumEdit;
    CmnEdit03010ClientName: TMTxtEdit;
    CmnEdit03003AccountNo: TMTxtEdit;
    CmnDataSourceAccInfo: TDataSource;
    CmnMemDataAccInfo: TdxMemData;
    CmnMemDataAccInfonDivision: TSmallintField;
    CmnMemDataAccInfostrDivisionDesc: TStringField;
    CmnMemDataAccInfonDivisionData: TSmallintField;
    CmnMemDataAccInfoDeposit: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    CmnButtonPagePrevious: TMBitBtn;
    CmnButtonPageNext: TMBitBtn;
    CmnPanelGridAccInfo: TMPanel;
    CmnGridAccInfo: TdxDBGrid;
    CmnGridAccInfoColumnDepDivision: TdxDBGridLookupColumn;
    CmnGridAccInfoColumnDepDivisionDesc: TdxDBGridMaskColumn;
    CmnToolbarImage: TImageList;
    CmnDataSourceHojyoMA: TDataSource;
    CmnMemDataHojyoMA: TdxMemData;
    CmnMemDataHojyoMATag: TGraphicField;
    CmnMemDataHojyoMAName: TStringField;
    CmnMemDataHojyoMAComment: TStringField;
    CmnPopupMenuTreeView: TPopupMenu;
    CmnPopupMenuTreeViewDetail: TMenuItem;
    CmnTreeViewPopupMenuBreak01: TMenuItem;
    CmnPopupMenuTreeViewDelete: TMenuItem;
    CmnTreeViewPopupMenuBreak03: TMenuItem;
    CmnPopupMenuTreeViewTagOff: TMenuItem;
    CmnPopupMenuTreeViewTagComment: TMenuItem;
    N1: TMenuItem;
    CmnPopupMenuTreeViewTag01: TMenuItem;
    CmnPopupMenuTreeViewTagItem01: TMenuItem;
    CmnPopupMenuTreeViewTagItem01Ex: TMenuItem;
    CmnPopupMenuTreeViewTag02: TMenuItem;
    CmnPopupMenuTreeViewTagItem02: TMenuItem;
    CmnPopupMenuTreeViewTagItem02Ex: TMenuItem;
    CmnPopupMenuTreeViewTag03: TMenuItem;
    CmnPopupMenuTreeViewTagItem03: TMenuItem;
    CmnPopupMenuTreeViewTagItem03Ex: TMenuItem;
    CmnPopupMenuTreeViewTag04: TMenuItem;
    CmnPopupMenuTreeViewTagItem04: TMenuItem;
    CmnPopupMenuTreeViewTagItem04Ex: TMenuItem;
    CmnPopupMenuGridHojyoMA: TPopupMenu;
    CmnPopupMenuGridHojyoMATagOff: TMenuItem;
    CmnPopupMenuGridHojyoMATagComment: TMenuItem;
    N2: TMenuItem;
    CmnPopupMenuGridHojyoMATag01: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem01: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem01Ex: TMenuItem;
    CmnPopupMenuGridHojyoMATag02: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem02: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem02Ex: TMenuItem;
    CmnPopupMenuGridHojyoMATag03: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem03: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem03Ex: TMenuItem;
    CmnPopupMenuGridHojyoMATag04: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem04: TMenuItem;
    CmnPopupMenuGridHojyoMATagItem04Ex: TMenuItem;
    CmnPanelGridHojyoMA: TMPanel;
    CmnGridHojyoMA: TdxDBGrid;
    CmnGridHojyoMAColumnTag: TdxDBGridGraphicColumn;
    CmnGridHojyoMAColumnBKCode: TdxDBGridMaskColumn;
    CmnGridHojyoMAColumnBKKana: TdxDBGridColumn;
    CmnGridHojyoMAColumnBKName: TdxDBGridColumn;
    CmnGridHojyoMAColumnBRName: TdxDBGridColumn;
    CmnGridHojyoMAColumnComment: TdxDBGridColumn;
    Splitter1: TSplitter;
    CmnMemDataAccInfoAccountNo: TStringField;
    CmnMemDataAccInfostrClientCode: TStringField;
    CmnMemDataAccInfostrClientNameKana: TStringField;
    CmnGridAccInfoColumnAccountNo: TdxDBGridColumn;
    CmnGridAccInfoColumnClientCode: TdxDBGridColumn;
    CmnGridAccInfoColumnClientNameKana: TdxDBGridColumn;
    CmnMemDataAccInfonAccountCode: TIntegerField;
    CmnGridAccInfoColumnAccountCode: TdxDBGridColumn;
    CmnTabAccount: TMTab;
    CmnPanelFeeStandard: TMPanel;
    CmnPanelFeeListTitle0101: TMPanel;
    CmnPanelFeeListTitle0102: TMPanel;
    CmnPanelFeeListTitle0103: TMPanel;
    CmnPanelFeeListTitle0104: TMPanel;
    CmnPanelFeeListTitle0105: TMPanel;
    CmnPanelFeeStdColumn01: TMPanel;
    CmnPanelFeeStdColumn02: TMPanel;
    CmnPanelFeeStdColumn03: TMPanel;
    CmnPanelFeeStdColumn04: TMPanel;
    CmnPanelFeeStdColumn05: TMPanel;
    CmnEditFeeValue010101: TMNumEdit;
    CmnEditFeeValue010201: TMNumEdit;
    CmnEditFeeValue010301: TMNumEdit;
    CmnEditFeeValue010102: TMNumEdit;
    CmnEditFeeValue010202: TMNumEdit;
    CmnLabelFeeUnit010201: TMLabel;
    CmnLabelFeeUnit010301: TMLabel;
    CmnLabelFeeUnit010102: TMLabel;
    CmnLabelFeeUnit010202: TMLabel;
    CmnEditFeeValue010106: TMNumEdit;
    CmnEditFeeValue010206: TMNumEdit;
    CmnEditFeeValue010306: TMNumEdit;
    CmnLabelFeeUnit010103: TMLabel;
    CmnLabelFeeUnit010203: TMLabel;
    CmnLabelFeeUnit010303: TMLabel;
    CmnEditFeeValue010105: TMNumEdit;
    CmnEditFeeValue010205: TMNumEdit;
    CmnEditFeeValue010305: TMNumEdit;
    CmnLabelFeeUnit010104: TMLabel;
    CmnLabelFeeUnit010204: TMLabel;
    CmnLabelFeeUnit010304: TMLabel;
    CmnLabelFeeUnit010105: TMLabel;
    CmnLabelFeeUnit010205: TMLabel;
    CmnLabelFeeUnit010305: TMLabel;
    CmnLabelFeeUnit010106: TMLabel;
    CmnLabelFeeUnit010206: TMLabel;
    CmnLabelFeeUnit010306: TMLabel;
    CmnPanelFeeFBUse: TMPanel;
    CmnPanelFeeListTitle0201: TMPanel;
    CmnPanelFeeListTitle0202: TMPanel;
    CmnPanelFeeListTitle0203: TMPanel;
    CmnPanelFeeListTitle0204: TMPanel;
    CmnPanelFeeListTitle0205: TMPanel;
    CmnPanelFeeFbuColumn01: TMPanel;
    CmnLabelFeeUnit020101: TMLabel;
    CmnLabelFeeUnit020201: TMLabel;
    CmnLabelFeeUnit020301: TMLabel;
    CmnLabelFeeUnit020102: TMLabel;
    CmnLabelFeeUnit020202: TMLabel;
    CmnEditFeeValue020101: TMNumEdit;
    CmnEditFeeValue020201: TMNumEdit;
    CmnEditFeeValue020301: TMNumEdit;
    CmnEditFeeValue020102: TMNumEdit;
    CmnEditFeeValue020202: TMNumEdit;
    CmnPanelFeeFbuColumn02: TMPanel;
    CmnLabelFeeUnit020103: TMLabel;
    CmnLabelFeeUnit020203: TMLabel;
    CmnLabelFeeUnit020303: TMLabel;
    CmnEditFeeValue020106: TMNumEdit;
    CmnEditFeeValue020206: TMNumEdit;
    CmnEditFeeValue020306: TMNumEdit;
    CmnPanelFeeFbuColumn03: TMPanel;
    CmnLabelFeeUnit020104: TMLabel;
    CmnLabelFeeUnit020204: TMLabel;
    CmnLabelFeeUnit020304: TMLabel;
    CmnEditFeeValue020105: TMNumEdit;
    CmnEditFeeValue020205: TMNumEdit;
    CmnEditFeeValue020305: TMNumEdit;
    CmnPanelFeeFbuColumn04: TMPanel;
    CmnLabelFeeUnit020105: TMLabel;
    CmnLabelFeeUnit020205: TMLabel;
    CmnLabelFeeUnit020305: TMLabel;
    CmnPanelFeeFbuColumn05: TMPanel;
    CmnLabelFeeUnit020106: TMLabel;
    CmnLabelFeeUnit020206: TMLabel;
    CmnLabelFeeUnit020306: TMLabel;
    CmnPanelFeeWindowUse: TMPanel;
    CmnPanelFeeListTitle0301: TMPanel;
    CmnPanelFeeListTitle0302: TMPanel;
    CmnPanelFeeListTitle0303: TMPanel;
    CmnPanelFeeListTitle0304: TMPanel;
    CmnPanelFeeListTitle0305: TMPanel;
    CmnPanelFeeWinColumn01: TMPanel;
    CmnLabelFeeUnit030101: TMLabel;
    CmnLabelFeeUnit030201: TMLabel;
    CmnLabelFeeUnit030301: TMLabel;
    CmnLabelFeeUnit030102: TMLabel;
    CmnLabelFeeUnit030202: TMLabel;
    CmnEditFeeValue030101: TMNumEdit;
    CmnEditFeeValue030201: TMNumEdit;
    CmnEditFeeValue030301: TMNumEdit;
    CmnEditFeeValue030102: TMNumEdit;
    CmnEditFeeValue030202: TMNumEdit;
    CmnPanelFeeWinColumn02: TMPanel;
    CmnLabelFeeUnit030103: TMLabel;
    CmnLabelFeeUnit030203: TMLabel;
    CmnLabelFeeUnit030303: TMLabel;
    CmnEditFeeValue030106: TMNumEdit;
    CmnEditFeeValue030206: TMNumEdit;
    CmnEditFeeValue030306: TMNumEdit;
    CmnPanelFeeWinColumn03: TMPanel;
    CmnLabelFeeUnit030104: TMLabel;
    CmnLabelFeeUnit030204: TMLabel;
    CmnLabelFeeUnit030304: TMLabel;
    CmnEditFeeValue030105: TMNumEdit;
    CmnEditFeeValue030205: TMNumEdit;
    CmnEditFeeValue030305: TMNumEdit;
    CmnPanelFeeWinColumn04: TMPanel;
    CmnLabelFeeUnit030105: TMLabel;
    CmnLabelFeeUnit030205: TMLabel;
    CmnLabelFeeUnit030305: TMLabel;
    CmnPanelFeeWinColumn05: TMPanel;
    CmnLabelFeeUnit030106: TMLabel;
    CmnLabelFeeUnit030206: TMLabel;
    CmnLabelFeeUnit030306: TMLabel;
    MLabel61: TMLabel;
    CmnLabelClientCode: TMLabel;
    CmnEdit03009ClientCode: TMTxtEdit;
    MLabel71: TMLabel;
    CmnLabel03014KmkCode: TMLabel;
    CmnLabel03015KmsCode: TMLabel;
    CmnLabel03016BumCode: TMLabel;
    CmnLabel03017SegCode: TMLabel;
    CmnLabel03018HojCode: TMLabel;
    CmnLabel03019HojCode: TMLabel;
    CmnEdit03018HojCodeFree: TMTxtEdit;
    CmnEdit03017SegCodeFree: TMTxtEdit;
    CmnEdit03016BumCodeFree: TMTxtEdit;
    CmnEdit03015KmsCodeNumeric: TMNumEdit;
    CmnEdit03014KmkCode: TMNumEdit;
    CmnLabel03014KmkCodeDesc: TMLabel;
    CmnLabel03015KmsCodeDesc: TMLabel;
    CmnLabel03016BumCodeDesc: TMLabel;
    CmnLabel03017SegCodeDesc: TMLabel;
    CmnLabel03018HojCodeDesc: TMLabel;
    CmnLabel03019HojCodeDesc: TMLabel;
    CmnMemDataAccInfostrBankCode: TStringField;
    CmnTabBank: TMTab;
    CmnGridAccInfoColumnDummy: TdxDBGridColumn;
    CmnFuriganaName: TMFurigana;
    CmnOpenDialogFileName: TMOpenDialog;
    CmnMemDataAccInfostrBankNameSimple: TStringField;
    CmnPanelInformation03: TMPanel;
    MLabel23: TMLabel;
    MLabel32: TMLabel;
    CmnLabel02002ChaDivisionDraftDesc: TMLabel;
    MLabel39: TMLabel;
    MLabel40: TMLabel;
    CmnEdit02002ChaDivisionDraft: TMNumEdit;
    CmnEdit02001LayoutPathDraft: TMTxtEdit;
    CmnEdit02003LayoutPathCheck: TMTxtEdit;
    CmnEdit02004ChaDivisionCheck: TMNumEdit;
    CmnLabel02004ChaDivisionCheckDesc: TMLabel;
    MLabel74: TMLabel;
    MLabel1: TMLabel;
    CmnEdit03011ClientNameKana: TMTxtEdit;
    CmnPipelinePrintStandard: TppDBPipeline;
    CmnMemDataPrintStandard: TdxMemData;
    CmnMemDataPrintStandardTag: TGraphicField;
    CmnMemDataPrintStandardBankCode: TStringField;
    CmnMemDataPrintStandardName: TStringField;
    CmnMemDataPrintStandardNameSimple: TStringField;
    CmnMemDataPrintStandardAssociation: TStringField;
    CmnMemDataPrintStandardAppDateStart: TDateField;
    CmnMemDataPrintStandardAppDateEnd: TDateField;
    CmnMemDataPrintStandardUpdateDate: TDateTimeField;
    CmnDataSourcePrintStandard: TDataSource;
    CmnReportDetail: TppReport;
    CmnDataSourcePrintDetail: TDataSource;
    CmnMemDataPrintDetail: TdxMemData;
    CmnMemDataPrintDetailTag: TGraphicField;
    CmnMemDataPrintDetailBankCode: TStringField;
    CmnMemDataPrintDetailNameSimple: TStringField;
    CmnPipelinePrintDetail: TppDBPipeline;
    CmnReportStandard: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    CmnReportStandardLabelCorpCode: TppLabel;
    CmnReportStandardLabelCorpName: TppLabel;
    CmnReportStandardLabelTitle: TppLabel;
    CmnReportStandardLineTitle: TppLine;
    CmnReportStandardSysVarDate: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLine110: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    CmnDetailBandStandard: TppDetailBand;
    CmnLineReportStandardDetailBand: TppLine;
    CmnReportStandardDBTextBankCode: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    CmnReportStandardDBTextAppDateStart: TppDBText;
    CmnReportStandardDBTextAppDateEnd: TppDBText;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLine109: TppLine;
    CmnReportStandardDBTextUpdateDate: TppDBText;
    ppFooterBand4: TppFooterBand;
    CmnReportStandardSysVarPage: TppSystemVariable;
    CmnReportStandardAccOffice: TppLabel;
    CmnDataSourcePrintAccount: TDataSource;
    CmnMemDataPrintAccount: TdxMemData;
    CmnMemDataPrintAccountBankCode: TStringField;
    CmnMemDataPrintAccountBankName: TStringField;
    CmnPipelinePrintAccount: TppDBPipeline;
    CmnReportAccount: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    CmnReportAccountSysVarDate: TppSystemVariable;
    CmnReportAccountLabelCorpCode: TppLabel;
    CmnReportAccountLabelCorpName: TppLabel;
    CmnDetailBandAccount: TppDetailBand;
    CmnLineReportAccountDetailBand: TppLine;
    ppDBText57: TppDBText;
    CmnReportAccountDBTextAccountCode: TppDBText;
    CmnReportAccountDBTextBankCode: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppDBText126: TppDBText;
    CmnReportAccountDBTextHojCode02: TppDBText;
    ppDBText130: TppDBText;
    ppLine99: TppLine;
    ppDBText142: TppDBText;
    ppLine108: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine111: TppLine;
    ppLine107: TppLine;
    ppLine13: TppLine;
    ppFooterBand5: TppFooterBand;
    CmnReportAccountSysVarPage: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLineJK_Bottom: TppLine;
    ppLineJK_Top: TppLine;
    ppLabel91: TppLabel;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLabel28: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLine102: TppLine;
    ppLine106: TppLine;
    ppLabel117: TppLabel;
    ppLineJK_Right: TppLine;
    ppLabel58: TppLabel;
    ppLabel31: TppLabel;
    ppLine89: TppLine;
    ppLineJK_Left: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    CmnMemDataPrintDetailAllBankCode: TIntegerField;
    CmnMemDataPrintDetailBranchCode: TIntegerField;
    CmnMemDataPrintDetailAllBankCodeDesc: TStringField;
    CmnMemDataPrintDetailBranchCodeDesc: TStringField;
    CmnMemDataPrintDetailAllBankCodeDescKana: TStringField;
    CmnMemDataPrintDetailBranchCodeDescKana: TStringField;
    CmnMemDataPrintDetailPayDivisionDesc: TStringField;
    CmnMemDataPrintDetailFBCodeModeDesc: TStringField;
    CmnMemDataPrintDetailRecordPauseDesc: TStringField;
    CmnMemDataPrintDetailFileName: TStringField;
    CmnMemDataPrintDetailVolumeName: TStringField;
    CmnMemDataPrintDetailstrLayoutPathDraft: TStringField;
    CmnMemDataPrintDetailstrChaDivisionDraftDesc: TStringField;
    CmnMemDataPrintDetailstrLayoutPathCheck: TStringField;
    CmnMemDataPrintDetailstrChaDivisionCheckDesc: TStringField;
    CmnMemDataPrintDetailFeeDivision: TSmallintField;
    CmnMemDataPrintDetailstrFeeDivisionDesc: TStringField;
    CmnMemDataPrintDetailnFeePriceStdScopeFr01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceStdScopeFr02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceStdScopeFr03: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceStdScopeRe01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceStdScopeRe02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceStd0101: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0201: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0301: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0102: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0202: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0302: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0103: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0203: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0303: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0104: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0204: TIntegerField;
    CmnMemDataPrintDetailnFeePriceStd0304: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbuScopeFr01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceFbuScopeFr02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceFbuScopeFr03: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceFbuScopeRe01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceFbuScopeRe02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceFbu0101: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0201: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0301: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0102: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0202: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0302: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0103: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0203: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0303: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0104: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0204: TIntegerField;
    CmnMemDataPrintDetailnFeePriceFbu0304: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWinScopeFr01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceWinScopeFr02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceWinScopeFr03: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceWinScopeRe01: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceWinScopeRe02: TCurrencyField;
    CmnMemDataPrintDetailnFeePriceWin0101: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0201: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0301: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0102: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0202: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0302: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0103: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0203: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0303: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0104: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0204: TIntegerField;
    CmnMemDataPrintDetailnFeePriceWin0304: TIntegerField;
    CmnMemDataPrintAccountnAccCode: TIntegerField;
    CmnMemDataPrintAccountstrAccKbnName: TStringField;
    CmnMemDataPrintAccountstrAccNo: TStringField;
    CmnMemDataPrintAccountnClientCode: TCurrencyField;
    CmnMemDataPrintAccountClientName: TStringField;
    CmnMemDataPrintAccountAccInfo1: TStringField;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    CmnReportAccountDBTextHojCode01: TppDBText;
    ppDBText4: TppDBText;
    CmnReportAccountDBTextHojCode03: TppDBText;
    ppDBText6: TppDBText;
    CmnMemDataPrintAccountnKmkCode: TIntegerField;
    CmnMemDataPrintAccountstrKmkCodeDesc: TStringField;
    CmnMemDataPrintAccountstrHojCode01: TStringField;
    CmnMemDataPrintAccountstrHojCodeDesc01: TStringField;
    CmnMemDataPrintAccountstrHojCode02: TStringField;
    CmnMemDataPrintAccountstrHojCodeDesc02: TStringField;
    CmnMemDataPrintAccountstrHojCode03: TStringField;
    CmnMemDataPrintAccountstrHojCodeDesc03: TStringField;
    CmnMemDataPrintAccountnCodeAttribute01: TSmallintField;
    CmnMemDataPrintAccountnCodeAttribute02: TSmallintField;
    CmnMemDataPrintAccountnCodeAttribute03: TSmallintField;
    CmnEditFeeValue010104: TMNumEdit;
    CmnEditFeeValue010204: TMNumEdit;
    CmnEditFeeValue010304: TMNumEdit;
    CmnEditFeeValue010103: TMNumEdit;
    CmnEditFeeValue010203: TMNumEdit;
    CmnEditFeeValue010303: TMNumEdit;
    CmnEditFeeValue020104: TMNumEdit;
    CmnEditFeeValue020204: TMNumEdit;
    CmnEditFeeValue020304: TMNumEdit;
    CmnEditFeeValue020103: TMNumEdit;
    CmnEditFeeValue020203: TMNumEdit;
    CmnEditFeeValue020303: TMNumEdit;
    CmnEditFeeValue030104: TMNumEdit;
    CmnEditFeeValue030204: TMNumEdit;
    CmnEditFeeValue030304: TMNumEdit;
    CmnEditFeeValue030103: TMNumEdit;
    CmnEditFeeValue030203: TMNumEdit;
    CmnEditFeeValue030303: TMNumEdit;
    CmnPopupMenuDummy: TPopupMenu;
    CmnMemDataPrintDetailstrFBSendDivisionDesc: TStringField;
    CmnMemDataPrintDetailstrFileNameExp: TStringField;
    CmnMemDataPrintDetailstrVolumeNameExp: TStringField;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    CmnReportDetailSysVarDate: TppSystemVariable;
    CmnReportDetailLabelCorpCode: TppLabel;
    CmnReportDetailLabelCorpName: TppLabel;
    CmnReportDetailLabelTitle: TppLabel;
    CmnReportDetailLineTitle: TppLine;
    CmnDetailBandDetail: TppDetailBand;
    ppLine35: TppLine;
    ppLine15: TppLine;
    CmnReportDetailDBTextBankCode: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBText21: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    CmnLineReportDetailDetailBand: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText29: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppLabel56: TppLabel;
    ppLabel62: TppLabel;
    ppLabel65: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLine5: TppLine;
    ppLine9: TppLine;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLine10: TppLine;
    ppFooterBand2: TppFooterBand;
    CmnReportDetailSysVarPage: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine28: TppLine;
    ppLine27: TppLine;
    ppLabel10: TppLabel;
    ppLine29: TppLine;
    ppLine33: TppLine;
    ppLabel14: TppLabel;
    ppLine34: TppLine;
    ppLabel15: TppLabel;
    ppLine36: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    CmnGridHojyoMAColumnBRCode: TdxDBGridMaskColumn;
    CmnGridHojyoMAColumnBRKana: TdxDBGridColumn;
    CmnMemDataHojyoMAnBraCode: TIntegerField;
    CmnMemDataHojyoMAnBKCODE: TIntegerField;
    CmnMemDataHojyoMAstrBrName: TStringField;
    CmnMemDataHojyoMAstrBkKana: TStringField;
    CmnMemDataHojyoMAstrBrKana: TStringField;
    CmnLabelFBCodeMode: TMLabel;
    CmnEdit03007FBCodeMode: TMNumEdit;
    CmnLabel03007FBCodeModeDesc: TMLabel;
    CmnLabelRecordPause: TMLabel;
    CmnEdit03008RecordPause: TMNumEdit;
    CmnLabel03008RecordPauseDesc: TMLabel;
    MLabel67: TMLabel;
    MLabel68: TMLabel;
    CmnEdit03012FileName: TMTxtEdit;
    CmnEdit03013VolumeName: TMTxtEdit;
    CmnLabel01044PayDivision: TMLabel;
    CmnEdit03004PayDivision: TMNumEdit;
    CmnLabel03004PayDivisionDesc: TMLabel;
    MLabel2: TMLabel;
    CmnLabel03005ReqKbnDesc: TMLabel;
    MLabel7: TMLabel;
    CmnEdit03006Syumoku: TMNumEdit;
    CmnLabel03006SyumokuDesc: TMLabel;
    MLabel9: TMLabel;
    MLabel10: TMLabel;
    MLabel11: TMLabel;
    MLabel12: TMLabel;
    CmnLabel02008ChaDivisionCheckDesc: TMLabel;
    CmnEdit01050BiilRate: TMNumEdit;
    MLabel5: TMLabel;
    CmnLabelFeeUnit010101: TMLabel;
    MLabel3: TMLabel;
    CmnMemDataHojyoMAnCODE: TFloatField;
    CmnMemDataAccInfonNCODE: TFloatField;
    CmnEdit02007LayoutPathCheck: TMTxtEdit;
    CmnEdit02006LayoutPathCheck: TMTxtEdit;
    CmnEdit02005LayoutPathCheck: TMTxtEdit;
    CmnEdit03019HojCodeFree: TMTxtEdit;
    CmnEdit03016BumCodeNumeric: TMNumEdit;
    CmnEdit03017SegCodeNumeric: TMNumEdit;
    CmnEdit03018HojCodeNumeric: TMNumEdit;
    CmnEdit03019HojCodeNumeric: TMNumEdit;
    CmnEdit03005ReqKbn: TMNumEdit;
    CmnLabel01001FeeDivision: TMLabel;
    CmnEdit03021FeeDivision: TMNumEdit;
    CmnLabel03021FeeDivisionDesc: TMLabel;
    CmnGridHojyoMAColumnHRBANE: TdxDBGridColumn;
    CmnGridHojyoMAHRCode: TdxDBGridLookupColumn;
    dxMemDataNM: TdxMemData;
    dxMemDataNMCODE: TIntegerField;
    dxMemDataNMNM: TStringField;
    dxMemDataNMNCODE: TFloatField;
    CmnMemDataHojyoMAOffDNm: TStringField;
    CmnMemDataHojyoMAOffDNcode: TFloatField;
    CmnMemDataHojyoMAOffDCode: TIntegerField;
    CmnMemDataHojyoMAorderCODE: TFloatField;
    MLabel14: TMLabel;
    MLabel4: TMLabel;
    MLabel8: TMLabel;
    MLabel13: TMLabel;
    MLabel15: TMLabel;
    MSPFunctionBar: TMSPFunctionBar;
    CmnGridHojyoMAColumnRenso: TdxDBGridColumn;
    CmnMemDataHojyoMAstrRenso: TStringField;
    CmnEdit02008ChaDivisionCheck: TMNumEdit;
    CmnLabel03020PrjCode: TMLabel;
    CmnLabel03020PrjCodeDesc: TMLabel;
    CmnEdit03020PrjCodeNumeric: TMNumEdit;
    CmnEdit03020PrjCodeFree: TMTxtEdit;
    CmnEdit03015KmsCodeFree: TMTxtEdit;
    MPnlTop: TMPanel;
    CmnLabelName: TMLabel;
    CmnLabelNameSimple: TMLabel;
    MLabel6: TMLabel;
    MLabel16: TMLabel;
    CmnEdit00007NMK: TMTxtEdit;
    CmnEdit00004BkKana: TMTxtEdit;
    CmnEdit00003BkName: TMTxtEdit;
    CmnEdit00005BrName: TMTxtEdit;
    CmnEdit00006BrKana: TMTxtEdit;
    CmnEdit00008Renso: TMTxtEdit;
    MPanel1: TMPanel;
    CmnLabelAllBankCode: TMLabel;
    CmnEdit00001BkCode: TMNumEdit;
    CmnEdit00002BrCode: TMNumEdit;
    aclExec: TActionList;
    KyujituDialog: TAction;
    CmnMemDataPrintDetailstrAllBankCd: TStringField;
    CmnMemDataPrintDetailBillLayPath1: TStringField;
    CmnMemDataPrintDetailBillLayPath2: TStringField;
    CmnMemDataPrintDetailBillLayPath3: TStringField;
    CmnMemDataPrintDetailAccNo: TStringField;
    CmnMemDataPrintDetailBillRate: TFloatField;
    SPPayAcc: TFDStoredProc;
    SPCrdAcc: TFDStoredProc;
    SPHapAcc: TFDStoredProc;
    CmnGridHojyoMAColumnBtnBKCode: TdxDBGridButtonColumn;
    CmnGridHojyoMAColumnBtnBRCode: TdxDBGridButtonColumn;
    CmnLabel03022PjSCode: TMLabel;
    CmnEdit03022PjSCodeNumeric: TMNumEdit;
    CmnLabel03022PjSCodeDesc: TMLabel;
    CmnEdit03022PjSCodeFree: TMTxtEdit;
    CmnPanelCode: TMPanel;
    CmnPanelRefer: TMPanel;
    SpMSHist: TFDStoredProc;
    CmnMemDataPrintAccountShubetsuName: TStringField;
    CmnMemDataPrintAccountRequestKbnName: TStringField;
    CmnMemDataPrintAccountShumokuName: TStringField;
    CmnMemDataPrintAccountFBCodeModeName: TStringField;
    CmnMemDataPrintAccountRecordPauseName: TStringField;
    CmnMemDataPrintAccountFileName: TStringField;
    CmnMemDataPrintAccountVolName: TStringField;
    CmnMemDataPrintAccountFeeUseModeName: TStringField;
    CmnMemDataPrintAccountstrHojCode04: TStringField;
    CmnMemDataPrintAccountnCodeAttribute04: TSmallintField;
    CmnMemDataPrintAccountstrHojCodeDesc04: TStringField;
    CmnMemDataPrintAccountstrHojCode05: TStringField;
    CmnMemDataPrintAccountnCodeAttribute05: TSmallintField;
    CmnMemDataPrintAccountstrHojCodeDesc05: TStringField;
    CmnMemDataPrintAccountstrHojCode06: TStringField;
    CmnMemDataPrintAccountnCodeAttribute06: TSmallintField;
    CmnMemDataPrintAccountstrHojCodeDesc06: TStringField;
    CmnMemDataPrintAccountstrHojCode07: TStringField;
    CmnMemDataPrintAccountnCodeAttribute07: TSmallintField;
    CmnMemDataPrintAccountstrHojCodeDesc07: TStringField;
    MLabel17: TMLabel;
    CmnEdit02009LayoutPathCheck: TMTxtEdit;
    CmnMemDataPrintDetailBillLayPath4: TStringField;
    CmnEdit03023FeePayKbn: TMNumEdit;
    MLabel18: TMLabel;
    CmnLabel03023FeePayKbnDesc: TMLabel;
    CmnMemDataPrintAccountFeePayKbnName: TStringField;
    CmnCmbo03024Layout: TMComboBox;
    MLabel19: TMLabel;
    CmnMemDataPrintAccountLayoutInfo: TStringField;
    CmnMemDataPrint_MLXHAP: TdxMemData;
    CmnMemDataPrint_MLXHAPAccCode: TIntegerField;
    CmnMemDataPrint_MLXHAPBankCode: TStringField;
    CmnMemDataPrint_MLXHAPSimpleName: TStringField;
    CmnMemDataPrint_MLXHAPAccKbnName: TStringField;
    CmnMemDataPrint_MLXHAPAccNo: TStringField;
    CmnMemDataPrint_MLXHAPShubetsuName: TStringField;
    CmnMemDataPrint_MLXHAPRequestKbnName: TStringField;
    CmnMemDataPrint_MLXHAPShumokuName: TStringField;
    CmnMemDataPrint_MLXHAPFBCodeModeName: TStringField;
    CmnMemDataPrint_MLXHAPRecordPauseName: TStringField;
    CmnMemDataPrint_MLXHAPClientCode: TCurrencyField;
    CmnMemDataPrint_MLXHAPAccInfo1: TStringField;
    CmnMemDataPrint_MLXHAPClientName: TStringField;
    CmnMemDataPrint_MLXHAPFileName: TStringField;
    CmnMemDataPrint_MLXHAPVolName: TStringField;
    CmnMemDataPrint_MLXHAPBankName: TStringField;
    CmnMemDataPrint_MLXHAPBkBraName: TStringField;
    CmnMemDataPrint_MLXHAPBankKanaName: TStringField;
    CmnMemDataPrint_MLXHAPBraKanaName: TStringField;
    MLabel22: TMLabel;
    MPanel2: TMPanel;
    MPanel3: TMPanel;
    MPanel4: TMPanel;
    MPanel5: TMPanel;
    MLabel20: TMLabel;
    CmnEdit01044Densai1: TMNumEdit;
    MPanel6: TMPanel;
    MLabel21: TMLabel;
    CmnEdit01045Densai2: TMNumEdit;
    CmnLabelFreeItem: TMLabel;
    CmnEdit03025FreeItem: TMTxtEdit;
    CmnMemDataPrintAccountAccInfo2: TStringField;
    CmnMemDataPrintDetailstrStartYMD: TStringField;
    MPanelStartYMD: TMPanel;
    MLabel_From: TMLabel;
    CmnEdit01049StartYMD: TMDateEdit;
    CmnPanelOverseaRem: TMPanel;
    CmnPanelTitle01046Oversea1: TMPanel;
    CmnPanelTitle01047Oversea2: TMPanel;
    CmnPanelWin01046Oversea1: TMPanel;
    CmnLabelUnit01046Oversea1: TMLabel;
    CmnEdit01046Oversea1: TMNumEdit;
    CmnPanelWin01047Oversea2: TMPanel;
    CmnLabelUnit01047Oversea2: TMLabel;
    CmnEdit01047Oversea2: TMNumEdit;
    CmnPanelTitle01048Oversea3: TMPanel;
    CmnPanelWin01048Oversea3: TMPanel;
    CmnLabelUnit01048Oversea3: TMLabel;
    CmnEdit01048Oversea3: TMNumEdit;
    CmnLabelOverseaRem: TMLabel;
    CmnMemDataPrintDetailnDensai1: TIntegerField;
    CmnMemDataPrintDetailnDensai2: TIntegerField;
    CmnMemDataPrintDetailnOversea1: TIntegerField;
    CmnMemDataPrintDetailnOversea2: TIntegerField;
    CmnMemDataPrintDetailnOversea3: TIntegerField;
    CmnLabelSoukinInfo: TMLabel;
    CmnLabel02010SoukinClientCode: TMLabel;
    CmnEdit02010SoukinClientCode: TMTxtEdit;
    CmnLabel02011SoukinClientNameKana: TMLabel;
    CmnEdit02011SoukinClientNameKana: TMTxtEdit;
    CmnLabel02012SoukinCodeMode: TMLabel;
    CmnEdit02012SoukinCodeMode: TMNumEdit;
    CmnLabel02012SoukinCodeModeDesc: TMLabel;
    CmnLabel02013SoukinRecordPause: TMLabel;
    CmnEdit02013SoukinRecordPause: TMNumEdit;
    CmnLabel02013SoukinRecordPauseDesc: TMLabel;
    CmnLabel02014SoukinFileName: TMLabel;
    CmnEdit02014SoukinFileName: TMTxtEdit;
    CmnMemDataPrintDetailstrSoukinClientCode: TStringField;
    CmnMemDataPrintDetailstrSoukinClientName: TStringField;
    CmnMemDataPrintDetailstrSoukinCodeModeDesc: TStringField;
    CmnMemDataPrintDetailstrSoukinRecordPauseDesc: TStringField;
    CmnMemDataPrintDetailstrSoukinFileName: TStringField;
    CmnEdit03026AccMemo: TMTxtEdit;
    CmnLabelAccMemo: TMLabel;
    CmnMemDataPrintAccountAccMemo: TStringField;
    MLabel24: TMLabel;
    CmnLabel03027SouFuriPatternDesc: TMLabel;
    CmnEdit03027SouFuripattern: TMNumEdit;
    CmnMemDataPrintAccountAccZanLimitName: TStringField;
    CmnMemDataPrint_MLXHAPAccZanLimitName: TStringField;
    CmnMemDataPrint_MLXHAPAccMemo: TStringField;

	procedure fnJNTCRP008002fOnDiscontinue				(var Msg: TMessage); message WM_DISCONTINUE;
	procedure fnJNTCRP008002fOnChangeScreenCondition	(var Msg: TMessage); message WM_CHANGESCREENCONDITION;

	procedure fnJNTCRP008002fOnCreate					(Sender: TObject);
	procedure fnJNTCRP008002fOnActivate				(Sender: TObject);
	procedure fnJNTCRP008002fOnCloseQuery				(Sender: TObject; var CanClose: Boolean);
	procedure fnJNTCRP008002fOnClose					(Sender: TObject; var Action: TCloseAction);
	procedure fnJNTCRP008002fOnShow					(Sender: TObject);
	procedure fnJNTCRP008002fOnHide					(Sender: TObject);
    procedure fnCmnButtonToolbarExitOnClick(Sender: TObject);
	procedure fnCmnFunctionOnEnter					(Sender: TObject);
	procedure fnCmnFunctionOnEnterException			(Sender: TObject);
    procedure fnCmnTreeViewOnChange					(Sender: TObject; Node: TTreeNode);
    procedure fnCmnFunctionNumEditOnChange(Sender: TObject);
    procedure fnCmnFunctionNumEditArrowDispOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fnCmnFunctionOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCmnPanelButtonsOnResize(Sender: TObject);
    procedure fnCmnTabInformationsOnChange(Sender: TObject);
    procedure fnCmnButtonPageOnClick(Sender: TObject);
    procedure fnCmnButtonUpdateOnClick(Sender: TObject);
    procedure fnCmnPopupMenuTreeViewOnPopup(Sender: TObject);
    procedure fnCmnTreeViewOnEnter(Sender: TObject);
    procedure fnCmnGridHojyoMAOnBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure fnCmnGridHojyoMAOnChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure fnCmnGridHojyoMAOnChangeNodeEx(Sender: TObject);
    procedure fnCmnGridHojyoMAOnEnter(Sender: TObject);
    procedure fnCmnGridHojyoMAOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnCmnGridHojyoMAOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnCmnGridHojyoMAOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnCmnDataSourceHojyoMAOnStateChange(Sender: TObject);
    procedure fnCmnMemDataHojyoMABeforePost(DataSet: TDataSet);
    procedure fnCmnPopupMenuGridHojyoMAOnPopup(Sender: TObject);
    procedure fnCmnPopupMenuGridHojyoMATagOnClick(Sender: TObject);
    procedure fnCmnPopupMenuGridHojyoMATagOnClickEx(Sender: TObject);
    procedure fnCmnPopupMenuTreeViewDetailOnClick(Sender: TObject);
    procedure fnCmnPopupMenuTreeViewDeleteOnClick(Sender: TObject);
    procedure fnCmnPopupMenuTreeViewTagOnClick(Sender: TObject);
    procedure fnCmnPopupMenuTreeViewTagOnClickEx(Sender: TObject);
    procedure fnCmnButtonToolbarDetailOnClick(Sender: TObject);
    procedure fnCmnButtonToolbarDeleteOnClick(Sender: TObject);
    procedure fnCmnEditAccountNoOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCmnFunctionTxtEditOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnCmnDataSourceAccInfoOnStateChange(Sender: TObject);
    procedure fnCmnMemDataAccInfoBeforePost(DataSet: TDataSet);
    procedure fnCmnGridAccInfoOnBeforeChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
      NewColumn: Integer; var CanChange: Boolean);
    procedure fnCmnGridAccInfoOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnCmnGridAccInfoColumnAccountNoOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnCmnGridAccInfoColumnClientCodeOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnCmnEditFeeListColumn02OnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCmnEditAllBankCodeOnArrowClick(Sender: TObject);
    procedure fnCmnEditAllBankNameOnEnter(Sender: TObject);
    procedure fnCmnEditAccountCodeOnChange(Sender: TObject);
    procedure fnCmnEditAccountCodeOnEnter(Sender: TObject);
    procedure fnCmnEditClientCodeOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCmnEditNameKanaOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnCmnTabInformationsOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCmnButtonToolbarFeeOnClick(Sender: TObject);
    procedure fnCmnFunctionOnChange(Sender: TObject);
    procedure fnCmnGridAccountColumnBankCodeOnEditButtonClick(Sender: TObject);
    procedure fnCmnTreeViewOnDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure fnCmnTreeViewOnDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure fnCmnButtonCancelOnClick(Sender: TObject);
    procedure fnCmnGridAccInfoOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnCmnButtonToolbarPrintOnClick(Sender: TObject);
    procedure fnCmnReportAccountDBTextHojCodeOnPrint(Sender: TObject);
    procedure fnCmnEditFileNameOnArrowClick(Sender: TObject);
    procedure fnCmnPopupMenuDummyOnPopup(Sender: TObject);
    procedure fnCmnReportBeforePrint(Sender: TObject);
    procedure fnCmnReportDetailBandBeforeGenerate(Sender: TObject);
    procedure fnCmnEditListDispOnChange(Sender: TObject);
    procedure fnCmnButtonPageOnEnter(Sender: TObject);
    procedure fnCmnGridAccInfoOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CmnMemDataHojyoMAAfterPost(DataSet: TDataSet);
    procedure MSPFunctionBarFunctionClick(Sender: TObject;
      FuncNo: Integer);
    procedure fnAllowClick(Sender: TObject);
    procedure fnCmnKeyPress(Sender: TObject;
      var Key: Char);
    Procedure fnKyujituDialogCreate(Sender: TObject);                                   // <006>
    procedure BChangeClick(Sender: TObject);
    procedure fnCmnGridAccInfoChangeNodeEx(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmnEdit00005BrNameExit(Sender: TObject);
    procedure fnCmnExit(Sender: TObject);
    procedure fnEditBkBtnClick(Sender: TObject);
    procedure fnEditBrBtnClick(Sender: TObject);
    procedure fnBrAllowClick(Sender: TObject);
    procedure CmnTreeViewChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure fnPopupMenuNewfeeOnClick(Sender: TObject);
    procedure CmnEdit01049StartYMDExit(Sender: TObject);                                // <TX26>
//↓<CDCHG>
    procedure BCodeChangeClick(Sender: TObject);
    procedure CmnTreeViewExit(Sender: TObject);
    procedure CmnGridHojyoMAExit(Sender: TObject);
//↑<CDCHG>

  private
    { Private 宣言 }
	m_pRec			       : ^TMjsAppRecord;											// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_Base_pRec		       : ^TMjsAppRecord;                                            // <008>
    m_cDataModule	       : TMDataModulef;
    m_cComArea		       : TJNTMASCom;
    m_cDBCommon		       : TFDConnection;
    m_cDBSelect		       : TFDConnection;
	m_cACControl	       : TWinControl;												// ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
	m_cPrnSupport		   : TMjsPrnSupport;
	m_cPreview		       : TMJSPreviewIF;
	m_cErrorMsgRec		   : TMJSMsgRec;
	m_cCheckItems		   : TList;
    m_cJNTArea             :   TJNTCommon;

	m_arAdoptInfo	       : array [0..15] of AdoptInfo;
//<044>	m_arCodeAttribute	   : array [0.. 5] of CodeAttribute;
  	m_arCodeAttribute	   : array [0.. 6] of CodeAttribute;    //<044>
//	m_arCodeAttributePrint : array [0.. 2] of CodeAttribute;	// <062>
	m_arCodeAttributePrint : array [0.. 6] of CodeAttribute;	// <062>

	m_cNodeRightClick	   : TTreeNode;

	m_nHojyoTree		   : Byte;
	m_nDateFormatDivision  : Integer;													// 和暦/西暦区分
	m_nMailAdoption		   : Integer;													// ﾒｰﾙ会計処理区分
	m_nCurCodeDigit		   : Integer;
	m_nCurCodeAttribute	   : Integer;
	m_nDBErrorCode		   : Integer;
//	m_nPrintOrder		   : Integer;			// <065>
	m_nReferMode		   : Integer;													// ﾒｰﾙ会計参照ﾌﾗｸﾞ
	m_nHintPosition		   : Extended;
	m_strHintPosition	   : String;
	m_strValidCharacters   : String;													// 使用可能ｺｰﾄﾞ
	m_strPrintBankCodeStr  : String;
	m_strPrintBankCodeEnd  : String;
///	m_fComboBoxListDraw	   : Boolean;
	m_fUnderConstruction   : Boolean;
	m_fThroughTab		   : Boolean;
	m_fIgnoreProc	       : Boolean;
///	m_fChangeBankCodeDetail: Boolean;
	m_fChangeAccountCode   : Boolean;

	m_cExcept			   : TJNTMASExceptIF;												// 排他制御	<#2>
	m_ZoomRatio			   : Integer;													// 拡大率	//<#4>

    //親Bplより
    B_Syousai       :   TMSpeedButton;
    B_HJunTesuuryo  :   TMSpeedButton;
    B_Delete        :   TMSpeedButton;
    B_Print         :   TMSpeedButton;
    B_Change        :   TMSpeedButton;  // KIRIUME
// <TX26> ADD-STR
    bumNewFeeStd    :   TMenuItem;
    bumNewFeeReg    :   TMenuItem;
    bumNewFeeImp    :   TMenuItem;
// <TX26> ADD-END
    B_CodeChange	:   TMSpeedButton;  // <CDCHG>
    P_ComBox        :   TMComboBox;
    m_CmpList	    :   TList;

    uvCloseFlg	    :   Boolean;
    uvAccCode       :   Extended;

    m_BraChk        :   Boolean;    //<016>
    m_fNewRec       :   Boolean;    //<020>
    m_bBtnChange    :   Boolean;
    m_bFirstUpd     :   Boolean;    // <072> ADD

    uvHani              :   TJNTHani;		                    // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	:	TPrintAppEntry;                     // <PRN>
    ArrHdl              :   Array[0..100] of Pointer;			// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    :	rcPrtParam;                         // <PRN>
    DmqPrint            :   TMQuery;                            // <PRN> 印刷用ｸｴﾘｰ
	uvSelSys            :   TJNTSelCorpSys; 	                // <PRN> 会社ｼｽﾃﾑ情報
	m_nOrderDivision	 : Integer;								// 印刷範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
///	m_strExCodeScopeStr	 : String;								// 印刷開始部門外部ｺｰﾄﾞ
///	m_strExCodeScopeEnd	 : String;								// 印刷終了部門外部ｺｰﾄﾞ
	TantoNCode			 : Int64;								// 担当者内部コード <MAS 353>
	m_DateStartYMD		: TDateTime;	 	 					// <097> ADD 適用開始日変更判定用

    m_bDelete			: Boolean;								// <055> ADD True=削除可能 False=削除不可

    m_RepHandle			: THandle;                              // <077> ADD 印刷モジュールハンドル

// <082> ADD-STR
	MASTER_SEGMENT01  : Integer;    // ｾｸﾞﾒﾝﾄ①
    MASTER_CONSTRUCT  : Integer;    // 工事
    uvFncInfo         : urFncInfo;
    uvExpOpenSW       : Boolean;
// <082> ADD-END

    m_sAddCharCode  :   String;                                 // <093> ADD

//↓<CDCHG>
	m_bSaimu		: Boolean;		// 債務が入っているか
	m_bKeihi		: Boolean;      // 経費精算が入っているか
//↑<CDCHG>

    function  fnGetNCODE(pBkCODE, pBrCODE: Integer): Extended;
    procedure fnZenGinDataSet(pKBN,pBKCode, pBrCode: Integer);
    function  fnGetNcode_Master(pCODE: String; pMasterKbn,pAttr: Integer): String;
    function  fnGetGcode_Master(pCODE:Extended;pMasterKbn,pAttr:Integer):String;
    function  fnGetDspData(sCode: String;pAttr:Integer): String;
//<006>    procedure fnSetFncType(pKBN: Integer);
    procedure fnSetFncType(nDspType: Boolean ;ifuncNo : Integer);   //<006>
    function fnSetFieldDescAccountCode(dqMasterData:TMQuery): Boolean;

    procedure SessionPractice(iSyori : Integer);					// <061> ADD  ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
    function  fnDelCRLF(sData: String): String;						// <DKAI> 改行削除

    function fnAllowEdit (): Boolean;               // <069> ADD
    function GetPayCommonValue(sSection, sKey: String): String;     // <093> ADD

  public
    { Public 宣言 }
    constructor fnCreateForm ( pRec : Pointer);	// ｺﾝｽﾄﾗｸﾗ

	procedure	CMChildkey (var Msg: TWMKey     ); message CM_CHILDKEY;

	procedure	fnChangeConditionAllControls		(fEnabled: Boolean);
	procedure	fnChangeConditionAllControlsDetail	(fEnabled: Boolean);
	procedure	fnChangeConditionGrid				();
	procedure	fnChangeConditionJournalInfo		(nPosition: Integer);
	procedure	fnChangeConditionJournalInfoEx		(nPosition: Integer);
	procedure	fnChangeConditionPageButtons		(fVisible: Boolean);
	procedure	fnChangeConditionToolbarButtons		(nCode: Extended; nAccountCode: Integer);
	function	fnChangeSelectionScreen				(): Boolean;
	function	fnCheckEditItemsValue				(): Boolean;
	function	fnCheckEditItemsValue00				(nFieldID: Integer): Boolean;
	function	fnCheckEditItemsValue01				(nFieldID: Integer): Boolean;
	function	fnCheckEditItemsValue02				(nFieldID: Integer): Boolean;
	function	fnCheckEditItemsValue03				(nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueAccountCode		(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueAllBankCode		(): Boolean;
///	function	fnCheckEditNumValueAppDate			(nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueBranchCode		(): Boolean;
	function	fnCheckEditNumValueFeeList			(nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueKmkCode			(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueKmsCode			(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditNumValueSelect			(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValue					(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValueAccountNo		(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValueBankCode			(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValueClientCode		(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValueDescription		(): Boolean;
	function	fnCheckEditTxtValueHojCode			(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckEditTxtValueKanaDesc		   	(nAreaNo: Integer; nFieldID: Integer): Boolean;
	function	fnCheckValidAllBankCode				(nAllBankCode: Integer; var strDescription: String; var strKanaDesc: String): Boolean;
	function	fnCheckValidBranchCode				(nAllBankCode: Integer; nBranchCode: Integer; var strDescription: String; var strKanaDesc: String): Boolean;
	function	fnCheckValidDepDivision				(nDepDivision: Integer): Boolean;
	function	fnCheckValidFundCode				(cNumEdit: TMNumEdit; var strDescription: String): Boolean;
// <063> MOD start
//	function	fnCheckValidHojCode					(nMasterDivision: Integer; strHojCode: String; var strDescription: String): Boolean;
	function	fnCheckValidHojCode					(nMasterDivision: Integer; strHojCode: String; var strDescription: String; exNCode : Extended): Boolean;
// <063> MOD end
	function	fnCheckValidHojCodeEx				(nPosition: Integer; strHojCode: String;nMasterKbn:Integer; var strDescription: String): Boolean;
	function	fnCheckValidKanaDesc				(strDescription: String): Boolean;
	function	fnCheckValidKmkCode					(nKmkCode: Integer; var strDescription: String): Boolean;
	function	fnCheckValidKmsCode					(nKmkCode: Integer; nKmsCode: String; var strDescription: String): Boolean;
	function	fnCheckValidRecordAccInfo			(nNCODE:Extended;nAccountCode: Integer): Boolean;
	function	fnCheckValidRecordHojyoMA			(nBKCode: Integer;nBrCode: Integer): Boolean;
	procedure	fnCreateTreeViewItems				(cNodeSrc: TTreeNode);

	function	fnDeleteRecord						(nBkCode,nBrCode ,nAccountCode: Integer;nNCODE:Extended): Boolean;
	function	fnDeleteRecordAccInfo				(nAccountCode: Integer;nNCODE:Extended): Boolean;
	function	fnDeleteRecordHojyoMA				(nBkCode,nBrCode: Integer): Boolean;
	procedure	fnDeleteTreeViewItems				(nBkCode: Integer; nAccountCode: Integer);

	function	fnExchangeCharacterKanaDesc			(strDescription: String): String;

	function	fnGetAdoptInformation				(nMasterDivision: Integer; var strDescription: String; var nCodeDigit: Integer; var nCodeAttribute: Integer; var nAdoption: Integer): Boolean;
	function	fnGetBitmapSelectedTag				(nSelectedTag: Integer): TBitmap;
	function	fnGetDescriptionSelectedItem		(cNumEdit: TMNumEdit; var strDescription: String): Boolean;
	function	fnGetDivisionSelectedTag			(nExCode: Integer): Integer;
	function	fnGetEditedAccountNumber			(strAccountNo: String): String;
	function	fnGetEditedClientCode				(strClientCode: String): String;
	procedure	fnGetEntryOrderClosingDays			(var arEntryOrder: array of Integer);
	function	fnGetFieldNameStandardFee			(nPosition: Integer): String;
	function	fnGetFieldValueStandardFee			(nPosition: Integer): Integer;
	function	fnGetGuideComment					(nFieldID: Integer): String;
	function	fnGetIndexSelectItem				(cNumEdit: TMNumEdit): Integer;
	function	fnGetSQLConstKmkMAWhere				(): String;
	function	fnGetSQLConstHojyoMAWhere			(nPosition: Integer): String;

	procedure	fnInitializeCheckItems				();
	procedure	fnInitializeComInformation			();
	function	fnInitializeFeeInformation			(): Boolean;
	procedure	fnInitializeMemDataAccInfo			();
	function	fnInitializeProcedure				(): Boolean;
	procedure	fnInitializeScreen				   	();
	procedure	fnInitializeScreenAttribute			();
	procedure	fnInitializeScreenDetailInfo		();
	procedure	fnInitializeScreenDetailInfo01		(nClass: Integer);
	procedure	fnInitializeScreenDetailInfo02		();
	procedure	fnInitializeScreenDetailInfo03		();
	procedure	fnInitializeScreenDetails			();

	function	fnMakeSQLConstAccInfoInsert			(pUpdateRecord: Pointer): String;
	function	fnMakeSQLConstAccInfoUpdate			(pUpdateRecord: Pointer): String;
	function	fnMakeSQLConstFeeInfoInsert			(pUpdateRecord: Pointer; nClass: Integer): String;
	function	fnMakeSQLConstFeeInfoUpdate			(pUpdateRecord: Pointer; nClass: Integer): String;
	function	fnMakeSQLConstBankInfoInsert			(pUpdateRecord: Pointer): String;
	function	fnMakeSQLConstBankInfoUpdate			(pUpdateRecord: Pointer): String;
	function	fnMoveFocusNextControl				(): Boolean;
	procedure	fnMoveRecSelecter					(nNCode: Extended);

	function	fnOutputConfirmationMessage			(nDivision: Integer): Integer;
	procedure	fnOutputDBErrorMessage				();

	procedure	fnPrintCheckListAccount				();
	function	fnPrintGetSQLAccount				(): String;	// <062>
	procedure	fnPrintCheckListDetail				();
	procedure	fnPrintCheckListStandard			();
//↓<MLXHAP>
	procedure	fnPrintCheckList_MLXHAP				();
	function	fnPrintGetSQL_MLXHAP				(): String;
//↑<MLXHAP>
	procedure	fnRebuildGridAccInfo				(nNCode: Extended);
	procedure	fnRebuildGridBankInfo				();
	procedure	fnRebuildTreeViewItems				();
	procedure	fnResetChangeFlagCheckItems			();

	procedure	fnSelectTreeViewItem			(nBkCode: Integer; nBrCode: Integer);
	procedure	fnSetAttributeJournalInfo		(nKmkCode: Integer);
//	procedure	fnSetAttributeJournalInfoPrint	(nKmkCode: Integer);						// <062>
	procedure	fnSetAttributeJournalInfoPrint	(nKmkCode: Integer; PrjNCode: Currency);	// <062>
	procedure	fnSetChangeFlagCheckItems		(Sender: TObject; fChangeFlag: Boolean);
	function	fnSetMasterInfoData				(): Boolean;
	procedure	fnSetRecordMemDataAccInfo		(dqMasterData: TMQuery);
	procedure	fnSetRecordMemDataHojyoMA		(dqMasterData: TMQuery);
	procedure	fnSetReportTitleField			(nSelected: Integer; strDescription: String; var cTitleField: TStringList; var cMemDataField: TStringList);
	procedure	fnSetScreenDetailInformation01	(dqMasterData: TMQuery; nFeeDivision: Integer; nPayDivision: Integer);
	procedure	fnSetScreenDetailInformation02	(dqMasterData: TMQuery);
	procedure	fnSetScreenDetailInformation03	(dqMasterData: TMQuery);
	procedure	fnSetScreenDetailInformation04	(dqMasterData: TMQuery);
	procedure	fnSetScreenDetailInformations	(dqMasterData: TMQuery; nAccountCode: Integer);
	function	fnSetScreenDetails				(nBkCode,nBrCode: Integer; nAccountCode: Integer): Boolean;
	procedure	fnSetTagInfoGridHojyoMA			(nTagKind: Integer);
	function	fnShowScreenInformations		(): Boolean;

	procedure	fnTerminateCheckItems			();

	function	fnUpdateRecordDetail			(): Boolean;
	function	fnUpdateRecordAccInfo			(pUpdateRecord: Pointer): Boolean;
	function	fnUpdateRecordAccount			(pUpdateRecord: Pointer): Boolean;
	function	fnUpdateRecordBrCodeEx			(nBkCode: Integer; nNCode: Extended): Boolean;
	function	fnUpdateRecordBank				(pUpdateRecord: Pointer): Boolean;
	function	fnUpdateRecordFeeInfo			(pUpdateRecord: Pointer): Boolean;
	function	fnUpdateRecordBankInfo			(pUpdateRecord: Pointer): Boolean;
	function	fnUpdateRecordMFusenInfo		(nBkCode: Integer; var nTagKind: Integer): Boolean;
	procedure	fnUpdateRecordMemDataHojyoMA	(nBkCode: Integer; nTagKind: Integer);
	procedure	fnUpdateTreeViewItemBank		(pUpdateRecord: Pointer);
	function	fnExcept						():Integer;						// 排他制御処理	<#2>
	function	fnGetZoom						(Int: Integer): Integer;		//<#4>

    function    fnGetHoliday                    (BkCode:Integer;BrCode:Integer):Extended;      //<003>
    function    fnDelCheck                      (exNCode: Extended; var strErr: String): Boolean;       // <CHK>
    function    fnDelCheckBank                  (exBankNCode: Extended; var strErr: String): Boolean;   // <CHK>
    function    fnGetAccNCode                   (exBankNCode: Extended; iAccCode: Integer): Extended;   // <CHK>

    function    PrjCodeNextControl              ():Boolean;                                             // <044>
    function    GetKojiInfo                     (iMasterkbn: Integer; GCode: String): Integer;          // <044>
    function    GetPrjNCode                     (iMasterKbn: Integer; GCode: String): Extended;         // <044>
    function    GetKojiPartKbn                  (iMasterKbn: Integer; nPrjNCode: Extended):Integer;     // <044>
    function    fnChkGroupKbn                   (): Boolean;                                            // <047>
  end;

function    AppEntry (pPar: Pointer) : Integer;
exports
	AppEntry;

implementation

const
	MASTER_SUBJECT			= 1;														// 勘定科目
	MASTER_SUBJECTPLUS		= 2;														// 細目科目
	MASTER_BANK				= 21;														// 銀行
	MASTER_CUSTOMER			= 22;														// 取引先
	MASTER_CUSTOMERPLUS01	= 23;														// 得意先
	MASTER_CUSTOMERPLUS02	= 24;														// 仕入先
	MASTER_STAFF			= 25;														// 社員
	MASTER_GENERAL01		= 31;														// 汎用補助①
	MASTER_GENERAL02		= 32;														// 汎用補助②
	MASTER_GENERAL03		= 33;														// 汎用補助③
	MASTER_GENERAL04		= 34;														// 汎用補助④
	MASTER_GENERAL05		= 35;														// 汎用補助⑤
	MASTER_SECTION			= 41;														// 部門
//	MASTER_SEGMENT01		= 101;														// ｾｸﾞﾒﾝﾄ①
//HIS0033	MASTER_CONSTRUCT		= 51;														// 工事
	MASTER_CONSTRUCTPLUS	= 52;														// 工種

	MASTER_SEGMENT_Str		= 101;														// ｾｸﾞﾒﾝﾄの開始範囲
	MASTER_SEGMENT_End		= 199;														// ｾｸﾞﾒﾝﾄの終了範囲

//HIS0033   Add↓
	MASTER_CONSTRUCT_Str	= 201;														// 工事の開始範囲
	MASTER_CONSTRUCT_End	= 299;														// 工事終了範囲
//HIS0033   Add↑

	TABLE_MASTERINFO		= 10;
	TABLE_HOJYOMA			= 111;
	TABLE_BANKINFO			= 112;
	TABLE_ACCINFO			= 116;
	TABLE_HOJYOTREE			= 199;
	TABLE_HOJYOTREE2		= 299;
	TABLE_FEEINFO			= 1601;

	LENGTH_NAME_BANK		= 30;														// 銀行 (全角15文字)<043>

	REQUISITE_OK			= 0;
	REQUISITE_CANCEL		= 1;
	REQUISITE_EXIT			= 9;

	CONFIRM_INSTRUCTION		= 0;														// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	CONFIRM_CANCEL			= 1;														// 取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			= 2;														// 終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			= 0;
	CONFIRM_RETFOCUSED		= 1;														// 元の位置にﾌｫｰｶｽを戻す
	CONFIRM_WRITE			= 2;														// ﾃﾞｰﾀを保存

//<009>	ITEMS_COUNT				= 78;
//<044>	ITEMS_COUNT				= 79;       //<009>
//<076>
//	ITEMS_COUNT				= 80;       //<044>
// <087> MOD-STR
//	ITEMS_COUNT				= 81;       	//<076>
// <092> MOD-STR
//	ITEMS_COUNT				= 82;
// <096> MOD↓
//	ITEMS_COUNT				= 83;
// <099> MOD-STR
//	ITEMS_COUNT				= 96;
//	ITEMS_COUNT				= 97;
// <103>
	ITEMS_COUNT				= 98;  // <103>														
// <099> MOD-END
// <096> MOD↑
// <092> MOD-END
// <087> MOD-END

	UMODE_INSERT			= 0;
	UMODE_UPDATE			= 1;

	NORMAL					= 1;														// 通常処理
	BASICONLY				= 2;														// 基本のみ設定可能(詳細ﾎﾞﾀﾝ使用不可)
	REFER					= 3;														// 参照

// <061> ADD start
	C_ST_PROCESS			= 0; 														// 設定
    C_ED_PROCESS            = 1;                                                        // 開放
// <061> ADD end

	// -----<062> Add-St-----
	C_IDX_SAIMOKU			= 0;				// 科目別補助
	C_IDX_BUMON				= 1;				// 部門
	C_IDX_SEGMENT			= 2;				// ｾｸﾞﾒﾝﾄ
	C_IDX_HOJYO1			= 3;				// 補助1
	C_IDX_HOJYO2			= 4;				// 補助2
	C_IDX_PROJECT			= 5;				// ﾌﾟﾛｼﾞｪｸﾄ
	C_IDX_PROJECTSUB		= 6;				// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
	// -----<062> Add-Ed-----

//↓<CDCHG>
	BCHG_CAP_BANK			= '銀行ｺｰﾄﾞ変更(&M)';
	BCHG_CAP_BRANCH         = '支店ｺｰﾄﾞ変更(&M)';
//↑<CDCHG>
var
	_StandardKeyCode: Extended	= 0;
	_DepositItems: array [0.. 3] of String	 = ('1: 普通', '2: 当座', '4: 貯蓄', '9: その他');
// <044> 2006/12/21 H.Kawato Mod
//	_JournalInfo : array [0.. 5] of String	 = ('CSubNCode', 'CBmnNCode', 'CSegNCode', 'CHojNCode1', 'CHojNCode2','CKojNCode');
	_JournalInfo : array [0.. 6] of String	 = ('CSubNCode', 'CBmnNCode', 'CSegNCode', 'CHojNCode1', 'CHojNCode2','CKojNCode','CKsyNCode');

	_StandardFee : array [0..13] of String	 = ('FeeStand1=10000',						// 分割基準額1
												'FeeStand2=30000',						// 分割基準額2
												'Fee11=420',							// 他行電信1
												'Fee12=525',							// 他行電信2
												'Fee13=735',							// 他行電信3
												'Fee21=315',							// 他行文書1
												'Fee22=420',							// 他行文書2
												'Fee23=630',							// 他行文書3
												'Fee31=105',							// 本支店宛1
												'Fee32=210',							// 本支店宛2
												'Fee33=420',							// 本支店宛3
												'Fee41=0',								// 同一店宛1
												'Fee42=0',								// 同一店宛2
												'Fee43=0'								// 同一店宛3
											   );

	_PMItemTVTag : String					= 'CmnPopupMenuTreeViewTag%.2d';
	_PMItemGSTag : String					= 'CmnPopupMenuGridHojyoMATag%.2d';
	_FeeTitle	 : String					= 'CmnPanelFeeListTitle%.2d%.2d';
	_FeeValue	 : String					= 'CmnEditFeeValue%.2d%.2d%.2d';
	_FeeUnit	 : String					= 'CmnLabelFeeUnit%.2d%.2d%.2d';

	_CheckItems: array [0..ITEMS_COUNT - 1]
            of Integer	 = (
                00001,						// 00.銀行ｺｰﾄﾞ
                00002,						// 00.支店コード
                00003,						// 00.銀行名称
                00004,						// 00.銀行カナ
                00005,						// 00.支店名称
                00006,						// 00.支店カナ
                00007,						// 00.簡略名
                00008,						// 00.連想
                01002,						// 01.標準手数料:分割基準額1
                01003,						// 01.標準手数料:分割基準額2
                01004,						// 01.標準手数料:同銀行同支店1
                01005,						// 01.標準手数料:同銀行同支店2
                01006,						// 01.標準手数料:同銀行同支店3
                01007,						// 01.標準手数料:同銀行他支店1
                01008,						// 01.標準手数料:同銀行他支店2
                01009,						// 01.標準手数料:同銀行他支店3
                01010,						// 01.標準手数料:他銀行(電信)1
                01011,						// 01.標準手数料:他銀行(電信)2
                01012,						// 01.標準手数料:他銀行(電信)3
                01013,						// 01.標準手数料:他銀行(文書)1
                01014,						// 01.標準手数料:他銀行(文書)2
                01015,						// 01.標準手数料:他銀行(文書)3
                01016,						// 01.FB用手数料:分割基準額1
                01017,						// 01.FB用手数料:分割基準額2
                01018,						// 01.FB用手数料:同銀行同支店1
                01019,						// 01.FB用手数料:同銀行同支店2
                01020,						// 01.FB用手数料:同銀行同支店3
                01021,						// 01.FB用手数料:同銀行他支店1
                01022,						// 01.FB用手数料:同銀行他支店2
                01023,						// 01.FB用手数料:同銀行他支店3
                01024,						// 01.FB用手数料:他銀行(電信)1
                01025,						// 01.FB用手数料:他銀行(電信)2
                01026,						// 01.FB用手数料:他銀行(電信)3
                01027,						// 01.FB用手数料:他銀行(文書)1
                01028,						// 01.FB用手数料:他銀行(文書)2
                01029,						// 01.FB用手数料:他銀行(文書)3
                01030,						// 01.窓口手数料:分割基準額1
                01031,						// 01.窓口手数料:分割基準額2
                01032,						// 01.窓口手数料:同銀行同支店1
                01033,						// 01.窓口手数料:同銀行同支店2
                01034,						// 01.窓口手数料:同銀行同支店3
                01035,						// 01.窓口手数料:同銀行他支店1
                01036,						// 01.窓口手数料:同銀行他支店2
                01037,						// 01.窓口手数料:同銀行他支店3
                01038,						// 01.窓口手数料:他銀行(電信)1
                01039,						// 01.窓口手数料:他銀行(電信)2
                01040,						// 01.窓口手数料:他銀行(電信)3
                01041,						// 01.窓口手数料:他銀行(文書)1
                01042,						// 01.窓口手数料:他銀行(文書)2
                01043,						// 01.窓口手数料:他銀行(文書)3
                01044,						// 01.電子記録債権:同行		<097> ADD
                01045,						// 01.電子記録債権:他行		<097> ADD
                01046,						// 01.海外送金:関係銀行		<096> ADD
                01047,						// 01.海外送金:他銀行		<096> ADD
                01048,						// 01.海外送金:海外手数料	<096> ADD
                01049,						// 01.適用開始日			<097> ADD
                01050,						// 01.手形割引率			<097> ADD
                02001,						// 02.手形ﾚｲｱｳﾄﾊﾟｽ
                02002,						// 02.金額文字種別
                02003,						// 02.小切手ﾚｲｱｳﾄﾊﾟｽ
                02004,						// 02.小切手文字種別
                02005,						// 02.割引依頼書
                02006,						// 02.取立依頼表
                02007,						// 02.担保依頼差入証
                02008,						// 02.入金口座
                02009,						// 02.組戻依頼書ﾚｲｱｳﾄﾊﾟｽ	<097> ADD
				02010,						// 02.送金依頼人ｺｰﾄﾞ		<096> ADD
				02011,						// 02.送金依頼人名称(ｶﾅ)	<096> ADD
				02012,						// 02.半角レコード			<096> ADD
				02013,						// 02.レコード区切り		<096> ADD
				02014,						// 02.ファイル名			<096> ADD
                03001,						// 03.口座ｺｰﾄﾞ
                03002,						// 03.預金種別
                03003,						// 03.口座番号
                03004,						// 03.振込種別
                03005,						// 03.依頼書電信扱い
                03006,						// 03.取扱種目
                03007,						// 03.半角レコード
                03008,						// 03.レコード区切り
                03009,						// 03.振込依頼人ｺｰﾄﾞ
                03010,						// 03.振込依頼人名称
                03011,						// 03.振込依頼人名称(ｶﾅ)
                03012,						// 03.ファイル名
                03013,						// 03.ボリューム名
                03014,						// 03.勘定科目コード
                03015,						// 03.科目別補助ｺｰﾄﾞ
                03016,						// 03.部門ｺｰﾄﾞ
                03017,						// 03.ｾｸﾞﾒﾝﾄｺｰﾄﾞ
                03018,						// 03.補助ｺｰﾄﾞ1
                03019,						// 03.補助ｺｰﾄﾞ2
                03020,						// 03.補助ｺｰﾄﾞ2
                03021,						// 03.手数料適用区分 <009>
                03022						// 03.ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞｺｰﾄﾞ<044>
                ,03023						// 03.手数料支払区分 <076> Add
                ,03024                      // 03.支払レイアウト <087> ADD
                ,03025                      // 03.フリー項目 <092> ADD
                ,03026                      // 03.口座メモ <099> ADD
			  	,03027                      // 03.総合振込出力方式  <103>
               );
// <082> DEL-STR
{var
	MASTER_SEGMENT01  : Integer;  // ｾｸﾞﾒﾝﾄ①
    MASTER_CONSTRUCT  : Integer;  // 工事
//    Holiday_List      : TStringList;
    uvFncInfo         : urFncInfo;  // <100>
    uvExpOpenSW       : Boolean;}
// <082> DEL-END
{$R *.DFM}
//{$include JNTMASERRORCODECHECK.inc}
{$include JNTMASFUSENBIKODLGIFB.inc}
{$I JNTMasExceptIFB.inc}				// 排他制御		//<#2>

//***********************************************************************************************************/
//***********************************************************************************************************/
function	AppEntry (pPar: Pointer): Integer;
var
	pForm  : ^TJNTCRP008002f;
	pRecord: ^TMjsAppRecord;

begin
	Result	:= ACTID_RET_OK;
	pRecord	:= Pointer (TAppParam (pPar^).pRecord);

	case (TAppParam (pPar^).iAction) of

		ACTID_FORMCREATESTART:															// Form Create要求
			begin
				New (pForm);

				try																		// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
					pForm^	:= TJNTCRP008002f.fnCreateForm (pPar);
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

		ACTID_FORMCREATESHOWSTART:														// Form Create&Show要求
			begin
				New (pForm);

				try																		// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
					pForm^	:= TJNTCRP008002f.fnCreateForm (pRecord);
					pForm^.Show ();
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

		ACTID_FORMCLOSESTART:															// Form Close要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Close ();
				pForm^.Free  ();
				Dispose (pForm);
			end;

		ACTID_FORMCANCLOSESTART:														// Form CanClose要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.CloseQuery () = FALSE) then
					Result	:= ACTID_RET_NG;
			end;

		ACTID_SHOWSTART:																// Show要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Show ();
			end;

		ACTID_HIDESTART:																// Hide要求
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.Parent <> nil) then
	            	pForm^.Hide ();
	        end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnCreateForm (Pointer)															*/
//*																											*/
//*	目的	: 支払情報登録処理 ｺﾝｽﾄﾗｸﾀ																		*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
constructor	TJNTCRP008002f.fnCreateForm (pRec: Pointer);
begin
	m_cDBCommon	:= nil;
	m_cDBSelect	:= nil;
	m_pRec		:= Pointer( TAppParam( pRec^ ).pRecord );          // 構造体のSave

	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^  );
	m_cComArea		:= TJNTMASCom       (m_pRec^.m_pSystemArea^);

    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);

    m_cDBCommon	:= m_cDataModule.CTLDBOpen ();

	if	(m_cDBCommon = nil) then
	begin
		ShowMessage ('ｴﾗｰ');
		raise	EMathError.Create ('ｴﾗｰ');
	end;

	m_cDBSelect	:= m_cDataModule.COPDBOpen (1, m_cComArea.m_iCopNo);

	if	(m_cDBSelect = nil) then
	begin
		ShowMessage ('ｴﾗｰ');
		raise	EMathError.Create ('ｴﾗｰ');
	end;

{FX 	if	(not fnInitializeProcedure ()) then
	begin
		ShowMessage ('ｴﾗｰ');
		raise	EMathError.Create ('ｴﾗｰ');
	end;
}
inherited Create(TForm(m_pRec^.m_pOwnerForm^))

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.CMChildKey (TWMKey)															*/
//*																											*/
//*	目的	: 支払情報登録処理 CM_CHILDKEY ﾒｯｾｰｼﾞ処理														*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.CMChildkey (var Msg: TWMKey);
var
	cShiftState	  : TShiftState;
//	cDBGrid		  : TdxDBGrid;
	cTabOrderList : TList;
	strDescription: String;

begin
	cShiftState	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD

	if	(Screen.ActiveControl.Name = CmnTreeView.Name) then								// ﾂﾘｰﾋﾞｭｰ
	begin
		if	(Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		begin
			if	(PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode > 0) then
			begin
				if	(CmnPanelClientDetail.Visible ) then
				begin
   					m_cACControl	:= CmnEdit00001BkCode;
				end
				else
				begin
                    if	(PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode <= 0) then
                        m_cACControl	:= CmnGridHojyoMA
                    else
                        m_cACControl	:= CmnGridAccInfo;
				end;

				m_cACControl.SetFocus ();

				Abort ();
			end;

		end;

        if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
        begin
			m_cACControl	:= P_ComBox;
      		m_cACControl.SetFocus ();
	    	Abort ();
        end;
	end;

	if	((Screen.ActiveControl.Name = CmnGridHojyoMA.Name) or							// HojyoMA ｸﾞﾘｯﾄﾞ
		 (Screen.ActiveControl.Name = CmnGridAccInfo.Name)) then						// Account ｸﾞﾘｯﾄﾞ
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then				// Home
		begin
			if	(TdxDBGrid (Screen.ActiveControl).EditingText = '') then
			begin
				TdxDBGrid (Screen.ActiveControl).FocusedColumn	:= 1;
				Abort ();
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then				// End
		begin
	 		if	(TdxDBGrid (Screen.ActiveControl).EditingText = '') then
			begin
				if	(TdxDBGrid (Screen.ActiveControl).FocusedColumn = 1) then
				begin
//					m_cACControl	:= CmnTreeView;
					m_cACControl	:= P_ComBox;
					m_cACControl.SetFocus ();
					Abort ();
				end
				else
				begin
					TdxDBGrid (Screen.ActiveControl).FocusedColumn	:= 4;
					Abort ();
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((TdxDBGrid (Screen.ActiveControl).EditingText <> '') or
				 (TdxDBGrid (Screen.ActiveControl).DataSource.DataSet.State in [dsEdit, dsInsert])) then
				Exit;

			m_cACControl	:= P_ComBox;
			m_cACControl.SetFocus ();
			Abort ();
		end;


		if	(Screen.ActiveControl.Name = CmnGridHojyoMA.Name) then						// HojyoMA ｸﾞﾘｯﾄﾞ
		begin
			if	(((Msg.CharCode = VK_F8) and (cShiftState = [])) and
				 (TdxDBGrid (Screen.ActiveControl).FocusedColumn = 4)) then
			begin
				strDescription	:= MJSKabuCut (TdxDBGrid (
								Screen.ActiveControl).DataSource.DataSet.FieldByName ('strName').AsString, 14);

				if	(strDescription <> '') then
				begin
					TdxDBGrid (Screen.ActiveControl).DataSource.DataSet.Edit ();
					TdxDBGrid (Screen.ActiveControl).DataSource.DataSet.Post ();
				end;

				Abort ();
			end;
		end;
	end;

	if	(Screen.ActiveControl.Name = CmnEdit00007NMK.Name) then					// 詳細: 簡略名称
	begin
		if	((Msg.CharCode = VK_F8) and (cShiftState = [])) then						// F8
		begin
			strDescription	:= CmnEdit00003BkName.Text;									// 正式名称

			if	(strDescription <> '') then
				CmnEdit00007NMK.Text := MJSKabuCut (strDescription, 14);

			Abort ();
            Exit;
		end;
	end;

	if	((Screen.ActiveControl.Name = CmnEdit00001BkCode    .Name) or				// 詳細: 全銀協銀行ｺｰﾄﾞ
		 (Screen.ActiveControl.Name = CmnEdit02001LayoutPathDraft.Name) or				// 詳細: 手形ﾚｲｱｳﾄﾊﾟｽ
		 (Screen.ActiveControl.Name = CmnEdit03001AccountCode    .Name)) then			// 詳細: 口座ｺｰﾄﾞ
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			m_cACControl	:= CmnTabInformations;
			m_cACControl.SetFocus ();

			Abort ();
		end;
	end;

	if	((Screen.ActiveControl.Name = CmnButtonPagePrevious.Name) or					// 詳細: [前頁]ﾎﾞﾀﾝ
		 (Screen.ActiveControl.Name = CmnButtonPageNext    .Name) or					// 詳細: [次頁]ﾎﾞﾀﾝ
		 (Screen.ActiveControl.Name = CmnButtonUpdate      .Name) or					// 詳細: [更新]ﾎﾞﾀﾝ
		 (Screen.ActiveControl.Name = CmnButtonCancel      .Name)) then					// 詳細: [取消]ﾎﾞﾀﾝ
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end
		else if	(Msg.CharCode = VK_RETURN) then
        begin
        	if	(Screen.ActiveControl.Name = CmnButtonPagePrevious.Name) or (Screen.ActiveControl.Name = CmnButtonPageNext    .Name) then
                fnCmnButtonPageOnClick(Screen.ActiveControl)
    		else if (Screen.ActiveControl.Name = CmnButtonUpdate     .Name) then					// 詳細: [更新]ﾎﾞﾀﾝ
                fnCmnButtonUpdateOnClick(Screen.ActiveControl)
    		else if (Screen.ActiveControl.Name = CmnButtonCancel     .Name) then					// 詳細: [更新]ﾎﾞﾀﾝ
                fnCmnButtonCancelOnClick(Screen.ActiveControl);
			Abort;
        end;
	end;

	if	(Screen.ActiveControl.Name = CmnButtonCancel.Name) then							// [取消]ﾎﾞﾀﾝ
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		begin
			cTabOrderList	:= TList.Create ();
//↓<MLXHAP>
			if TMSeries.IsMjsLink3 then
			begin
				// MLX給与のときは[口座管理情報]のパネルのみなので、直接指定する。
				// 先頭２つのTabを非表示にしている。CmnTabInformations.Items.Selected=0となるが、
				// CmnTabInformations.Itemsは[0][1][2]であり、先頭の[手数料]タブが求まってしまうため。
				CmnPanelInformation04.GetTabOrderList(cTabOrderList);
			end
			else
			begin
//↑<MLXHAP>下記、字下げ。
				TMPanel (CmnTabInformations.Items [CmnTabInformations.Items.Selected].SyncControl).GetTabOrderList (cTabOrderList);
//↓<MLXHAP>
			end;
//↑<MLXHAP>
			m_cACControl	:= cTabOrderList.First ();

			while (TRUE) do
			begin
				if	((m_cACControl is TMNumEdit) or (m_cACControl is TMTxtEdit)) then
					Break;

				cTabOrderList.Clear ();

				m_cACControl.GetTabOrderList (cTabOrderList);
				m_cACControl	:= cTabOrderList.First ();
			end;

			m_cACControl.SetFocus ();

			cTabOrderList.Free ();

			Abort ();
		end;
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


//<KEY>

    if CmnPanelClientDetail.Visible then
    begin
    	if ((Msg.CharCode = VK_TAB)    and (cShiftState = [])) or
	       ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) or
//<MAS349>           ((Msg.CharCode = VK_RIGHT)  and (cShiftState = [])) or
//<MAS349>           ((Msg.CharCode = VK_DOWN)   and (cShiftState = [])) or
           ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
           begin
                fnCmnFunctionOnKeyDown (Screen.ActiveControl,Msg.CharCode,cShiftState);
                abort;
           end;
    end;
(*
	// TAB,Enter,→,↓処理
	if ((Msg.CharCode = VK_TAB)    and (cShiftState = [])) or
	   ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) or
	   ((Msg.CharCode = VK_RIGHT)  and (cShiftState = [])) or
	   ((Msg.CharCode = VK_DOWN)   and (cShiftState = [])) then
	begin
        MjsNextCtrl(Self);
        Abort;
	end;

    if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
    begin
        MJSDispCtrl.MjsPrevCtrl (Self);
        abort;
    end;
*)

inherited;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnDiscontinue (var Msg: TMessage);
var
	cMessageRec: TMJSMsgRec;

begin
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 10);

	cMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '銀行');

	Beep ();

	MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);

	Close ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnChangeScreenCondition (var Msg: TMessage);
begin
	CmnPanelInformations.Visible	:= FALSE;
	CmnPanelInformations.Visible	:= TRUE;
	CmnPanelInformations.Visible	:= FALSE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnCreate (TObject)												*/
//*																											*/
//*	目的	: 基本情報登録処理 ﾌｫｰﾑ OnCreate ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnCreate (Sender: TObject);
var
    Qry : TMQuery;
    iRet        :   Integer;        // <PRN>
    lvHandle    :   THandle;        // <PRN>
// <087> ADD-STR
	sPath		:	String;
	sr	 		: 	TSearchRec;
// <087> ADD-END
	sPgID		:	string; //<MLXHAP>
//↓<CDCHG>
    ACheck: array of TMLicenseInfo;
    AIndex: Integer;
//↑<CDCHG>
// <099> ADD-STR
    iLoop       :   Integer;
    ChildControl:   TWinControl;
	sName		:	String;
// <099> ADD-END
begin
	Parent	:= TPanel (m_pRec^.m_pOwnerPanel^);
	Align	:= alClient;

	MJSColorChange (TJNTCRP008002f (Self), m_cComArea.SystemArea.SysColorB, m_cComArea.SystemArea.SysColorD,
									m_cComArea.SystemArea.SysBaseColorB, m_cComArea.SystemArea.SysBaseColorD,
															rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	m_ZoomRatio := MJSFontResize (TJNTCRP008002f (Self), Pointer (m_pRec));		//<#4>(戻り値取得)

//--- <#4> St -----
	if m_ZoomRatio <= 0 then
		m_ZoomRatio := 100;

//--- <#4> Ed -----

	m_cPreview	:= TMJSPreviewIF.Create ();
	m_cPreview.Init (m_pRec);

	CmnOpenDialogFileName.InitialDir	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot + '\Mas\Prg';

	m_nRefermode	:= NORMAL;

    m_BraChk    := False;   //<016>
    m_fNewRec   := False;   //<020>
    m_bFirstUpd := True;    // <072> ADD

    m_bDelete   := True;	// <055> ADD 削除可能に

    m_RepHandle	:= 0;       // <077> ADD 印刷モジュールハンドル

// <053> MOD start
    // ｸﾞﾙｰﾌﾟ管理の確認<047>
//    fnChkGroupKbn();
	m_cJNTArea := TJNTCommon( m_CmpList.Items[9]^);

    fnInitializeComInformation();
    if m_nReferMode <> REFER then         	// 決算確定時でない場合
    begin
     	fnChkGroupKbn();    				// ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ
    end;
// <053> MOD end

    //印刷ﾎﾞﾀﾝ <005>
    B_Print           := TMSpeedButton( m_CmpList.Items[0]^ );
    B_Print.OnClick   := fnCmnButtonToolbarPrintOnClick;

    B_Print.Enabled := False;

    //削除ﾎﾞﾀﾝ
    B_Delete          := TMSpeedButton( m_CmpList.Items[2]^ );
    B_Delete.OnClick  := fnCmnButtonToolbarDeleteOnClick;

    //詳細ﾎﾞﾀﾝ
    B_Syousai         := TMSpeedButton( m_CmpList.Items[3]^ );
    B_Syousai.OnClick := fnCmnButtonToolbarDetailOnClick;

    //手数料ﾎﾞﾀﾝ
    B_HJunTesuuryo    := TMSpeedButton( m_CmpList.Items[6]^ );
    B_HJunTesuuryo.OnClick := fnCmnButtonToolbarFeeOnClick;

    // TJNTCommon
// <053> DEL start
//    m_cJNTArea        := TJNTCommon   ( m_CmpList.Items[9]^ );     // <002>
// <053> DEL end
    m_Base_pRec       := Pointer      ( m_CmpList.Items[10]^);

    //切り埋めﾎﾞﾀﾝ
    B_Change          := TMSpeedButton( m_CmpList.Items[11]^ );
    B_Change.OnClick  := BChangeClick;

    // 処理区分Combo
    P_ComBox    :=  TMComboBox   ( m_CmpList.Items[8]^ );     // 機能選択

// <TX26> ADD-STR
    // 新手数料標準
    bumNewFeeStd         := TMenuItem( m_CmpList.Items[12]^ );
    bumNewFeeStd.OnClick := fnPopupMenuNewfeeOnClick;

    // 新手数料登録
    bumNewFeeReg         := TMenuItem( m_CmpList.Items[13]^ );
    bumNewFeeReg.OnClick := fnPopupMenuNewfeeOnClick;

    // 新手数料取込
    bumNewFeeImp         := TMenuItem( m_CmpList.Items[14]^ );
    bumNewFeeImp.OnClick := fnPopupMenuNewfeeOnClick;
// <TX26> ADD-END

//↓<CDCHG>
    B_CodeChange         := TMSpeedButton( m_CmpList.Items[15]^ );
    B_CodeChange.OnClick := BCodeChangeClick;
//↑<CDCHG>

	TantoNCode := rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;	// 担当者内部コード <MAS 353>

    // <047> - ST
    if (m_nReferMode <> REFER) then
    begin
        B_Delete      .Enabled  := m_cJNTArea.IsDelete;  //削除権限を考慮する<001>
        B_HJunTesuuryo.Enabled  := True;
    end
    else
    begin
        B_Delete      .Enabled  := False;  //削除権限を考慮する<001>
        B_HJunTesuuryo.Enabled  := False;
    end;
    // <047> - ED

    // <047>B_Delete.Enabled  := m_cJNTArea.IsDelete;  //削除権限を考慮する<001>
    B_Print.Enabled   := m_cJNTArea.IsPrint;	// <PRN2>

//↓<MLXHAP>MLX給与でないときに、OffDayNameをselectする。
	if not TMSeries.IsMjsLink3 then
	begin
//↑<MLXHAP>以下、字下げ。
        if ( dxMemDataNM.Active ) then dxMemDataNM.Close;
        dxMemDataNM.Open;

        Qry	:= TMQuery.Create (Self);

        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

        if ( dxMemDataNm.Active ) then dxMemDataNm.Close;
        dxMemDataNm.Open;

        with (Qry) do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT NCODE,OffdayName,OffdayCD from OffDayName ');
            Open ();
            While not Eof do
            begin
                dxMemDataNm.append;
                dxMemDataNMNCODE.asFloat   := FieldByName('NCODE').asFloat;
                dxMemDataNMCODE.asInteger  := FieldByName('OffdayCD').asInteger;
                dxMemDataNMNM.asString     := FieldByName('OffdayName').asString;
                dxMemDataNm.Post;
                Next;
            end;
// <096> DEL↓
//// <094> ADD-STR
//            Close ();
//            SQL.Clear ();
//            SQL.Add   ('SELECT DataVer FROM DTMAIN');
//            Open ();
//            if (FieldByName('DataVer').AsInteger < 45) then
//            begin
//                // H26消費税改正対応版では銀行別電債手数料対応はなし
//                MLabel22.Visible := False;
//                MPanel2.Visible := False;
//                MLabel5.Top := MLabel22.Top;
//                fBiilRate.Top := MLabel22.Top;
//                MLabel3.Top := MLabel22.Top;
//            end;
//// <094> ADD-END
// <096> DEL↑
        end;
        Qry.Close;
        Qry.Free;
//↓<MLXHAP>
	end;
//↑<MLXHAP>

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);


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
		MjsMessageBox(Self,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
    	if ( uvSelSys.CreateSysInfo(m_cDBSelect) <> 0 ) then
            Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
        raise;
    end;

// ↑↑↑<PRN>

// <061> ADD start
	SpMSHist.Connection := m_cDBSelect;
    //SpMSHist.SessionName  := m_cDBSelect.SessionName;
// <061> ADD end

// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
///    lvHandle := 0;
	try
// <LPH> MOD-STR
//		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008002L.BPL');
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008002L.BPL');
// <LPH> MOD-END
        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP008002LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
// <LPH> MOD-STR
//    	UnloadPackage( lvHandle );
    	UnloadPackageHelper( lvHandle );
// <LPH> MOD-END
    end;

    m_RepHandle	:= lvHandle;                            // <077> ADD 印刷モジュールハンドル

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
			Para		    :=  uvHani;
			TargetQry	    :=  nil;
			CorpSys		    :=  uvSelSys;
            iAPP_HDL_REC    :=  100;
            JntArea         :=  m_cJNTArea;
		end;

		iRet := PrintAppEntry(Self,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
//↓<MLXHAP>Dlg.iniをMLXは専用で持つため、ファイル名を切り分けます。
	sPgID := 'JNTCRP008002';
	if TMSeries.IsMjsLink3 then
	begin
    	sPgID := sPgID + '_HAP';
	end;
//↑<MLXHAP>
    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
//<MLXHAP>      'JNTCRP008002',
                sPgID, //<MLXHAP>
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------

// <053> DEL start
//	fnInitializeComInformation ();
// <053> DEL end
	fnInitializeFeeInformation ();
	fnInitializeCheckItems	   ();

	if	(not fnSetMasterInfoData ()) then
	begin
		PostMessage (Self.Handle, WM_DISCONTINUE, 0, 0);

        Exit;
	end;

	m_fIgnoreProc	:= FALSE;
	m_nHojyoTree	:= 0;

	uvCloseFlg        :=  False;

	CmnPanelClientStandard.Enabled	:= FALSE;
	CmnPanelClientDetail  .Enabled	:= FALSE;

	CmnTreeView           .Enabled	:= True;
	CmnTreeView           .Visible	:= TRUE;
	CmnPanelClientStandard.Visible	:= TRUE;
	CmnPanelClientDetail  .Visible	:= FALSE;

	fnInitializeScreenAttribute ();
	fnInitializeMemDataAccInfo  ();
    fnChangeSelectionScreen();

//↓<MLXHAP>
	if TMSeries.IsMjsLink3 then
	begin
		// MLXのときは下記パーツを非表示。
		// === グリッド型画面 ===
        CmnGridHojyoMA.Bands[5].Visible			:= False; // 休日カラム

		// === カード型画面 ===
		CmnTabInformations.Items[2].Selected	:= True;  // [口座管理情報]を選択状態にしておいて、以外のタブを消す。
		CmnTabInformations.Items[0].Visible		:= False; // [手数料]タブ
	    CmnPanelInformation03.Visible  			:= False; // [手数料]タブのパネル
		CmnTabInformations.Items[1].Visible		:= False; // [レイアウト情報]タブ
	    CmnPanelInformation01.Visible  			:= False; // [レイアウト情報]タブのパネル

        MLabel19.Visible						:= False; // 支払レイアウト
        CmnCmbo03024Layout.Visible				:= False;
        CmnLabel01001FeeDivision.Visible		:= False; // 手数料適用区分
        CmnEdit03021FeeDivision.Visible			:= False;
        CmnLabel03021FeeDivisionDesc.Visible	:= False;

		// 仕訳情報エリアのパーツを非表示。
        MLabel71.Visible						:= False; // 仕訳情報の見出し

        CmnLabel03014KmkCode.Visible			:= False;
        CmnEdit03014KmkCode.Visible				:= False;
        CmnLabel03014KmkCodeDesc.Visible		:= False;

        CmnLabel03015KmsCode.Visible			:= False;
        CmnEdit03015KmsCodeNumeric.Visible		:= False;
        CmnEdit03015KmsCodeFree.Visible			:= False;
        CmnLabel03015KmsCodeDesc.Visible		:= False;

        CmnLabel03016BumCode.Visible			:= False;
        CmnEdit03016BumCodeNumeric.Visible		:= False;
        CmnEdit03016BumCodeFree.Visible			:= False;
        CmnLabel03016BumCodeDesc.Visible		:= False;

        CmnLabel03018HojCode.Visible			:= False;
        CmnEdit03018HojCodeNumeric.Visible		:= False;
        CmnEdit03018HojCodeFree.Visible			:= False;
        CmnLabel03018HojCodeDesc.Visible		:= False;

        CmnLabel03020PrjCode.Visible			:= False;
        CmnEdit03020PrjCodeNumeric.Visible		:= False;
        CmnEdit03020PrjCodeFree.Visible			:= False;
        CmnLabel03020PrjCodeDesc.Visible		:= False;

        CmnLabel03019HojCode.Visible			:= False;
        CmnEdit03019HojCodeNumeric.Visible		:= False;
        CmnEdit03019HojCodeFree.Visible			:= False;
        CmnLabel03019HojCodeDesc.Visible		:= False;

        CmnLabel03022PjSCode.Visible			:= False;
        CmnEdit03022PjSCodeNumeric.Visible		:= False;
        CmnEdit03022PjSCodeFree.Visible			:= False;
        CmnLabel03022PjSCodeDesc.Visible		:= False;

        CmnLabel03017SegCode.Visible			:= False;
        CmnEdit03017SegCodeNumeric.Visible		:= False;
        CmnEdit03017SegCodeFree.Visible			:= False;
        CmnLabel03017SegCodeDesc.Visible		:= False;

        MLabel18.Visible						:= False; // 手数料支払区分
        CmnEdit03023FeePayKbn.Visible			:= False;
        CmnLabel03023FeePayKbnDesc.Visible		:= False;

        MLabel8.Visible							:= False; // アクセントライン

		// 「ＦＢ/電子債権情報」の見出しを変更。
		MLabel61.Caption						:= 'ＦＢ情報';
	end;
//↑<MLXHAP>
// <096> ADD↓
	if TMSeries.IsMjsLink3 or
	   TMSeries.IsGalileopt then
	begin
		// MLX、Galioptのときは下記パーツを非表示。
		// 手数料タブ－海外送金
		CmnLabelOverseaRem.Visible := False;
		CmnPanelOverseaRem.Visible := False;

		// レイアウト／送金情報タブ－外国送金情報
        CmnLabelSoukinInfo.Visible					:= false;
        CmnLabel02010SoukinClientCode.Visible		:= false;
        CmnEdit02010SoukinClientCode.Visible		:= false;
        CmnLabel02011SoukinClientNameKana.Visible	:= false;
        CmnEdit02011SoukinClientNameKana.Visible	:= false;
        CmnLabel02012SoukinCodeMode.Visible			:= false;
        CmnEdit02012SoukinCodeMode.Visible			:= false;
        CmnLabel02012SoukinCodeModeDesc.Visible		:= false;
        CmnLabel02013SoukinRecordPause.Visible		:= false;
        CmnEdit02013SoukinRecordPause.Visible		:= false;
        CmnLabel02013SoukinRecordPauseDesc.Visible	:= false;
        CmnLabel02014SoukinFileName.Visible			:= false;
        CmnEdit02014SoukinFileName.Visible			:= false;

        // レイアウト／送金情報タブのラベル変更
		CmnTabInformations.Items[1].Caption	:= 'レイアウト情報';

// <099> ADD-STR
// <20200707>Move-Del-S
//        // 併せて、メモについても非表示とし、メモより下のパーツを上に移動する
//        CmnLabelAccMemo.Visible	:= false;
//        CmnEdit03026AccMemo.Visible := false;
//
//        for iLoop := 0 to CmnPanelRefer.ControlCount - 1 do
//        begin
//            ChildControl := TWinControl(CmnPanelRefer.Controls[iLoop]);
//        	sName := ChildControl.Name;
//
//            if (sName = 'CmnPanelCode') or
//               (sName = 'CmnLabelAccountCode') or
//               (sName = 'CmnEdit03001AccountCode') or
//               (sName = 'CmnLabelDepDivision') or
//               (sName = 'CmnEdit03002DepDivision') or
//               (sName = 'CmnLabel03002DepDivisionDesc') or
//               (sName = 'CmnLabelAccountNo') or
//               (sName = 'CmnEdit03003AccountNo') then
//            else
//                ChildControl.Top := ChildControl.Top - 21;
//        end;
// <20200707>Move-Del-E
// <099> ADD-END
	end;
// <096> ADD↑

// <20200707>Move-Add-S ※条件分を「Gali,MLX,MLP」→「Gali,MLX」の場合に変更	※TMSeriesはML3とML4は同一の判定であるためTMSeries2に変更
	if TMSeries2.IsMjsLink3 or
	   TMSeries2.IsGalileopt then
	begin
        // 併せて、メモについても非表示とし、メモより下のパーツを上に移動する
        CmnLabelAccMemo.Visible	:= false;
        CmnEdit03026AccMemo.Visible := false;

        for iLoop := 0 to CmnPanelRefer.ControlCount - 1 do
        begin
            ChildControl := TWinControl(CmnPanelRefer.Controls[iLoop]);
        	sName := ChildControl.Name;

            if (sName = 'CmnPanelCode') or
               (sName = 'CmnLabelAccountCode') or
               (sName = 'CmnEdit03001AccountCode') or
               (sName = 'CmnLabelDepDivision') or
               (sName = 'CmnEdit03002DepDivision') or
               (sName = 'CmnLabel03002DepDivisionDesc') or
               (sName = 'CmnLabelAccountNo') or
               (sName = 'CmnEdit03003AccountNo') then
            else
                ChildControl.Top := ChildControl.Top - 21;
        end;
	end;
// <20200707>Move-Add-E

// <103>ADD-STR
    if TMSeries.IsGalileopt then  //Galioptのときは下記パーツを非表示。
	begin
    	MLabel24.Visible							:= false;
        CmnEdit03027SouFuripattern.Visible			:= false;
        CmnLabel03027SouFuripatternDesc.Visible     := false;
	end;
// <103>↑

//	m_cACControl	:= CmnTreeView;
	m_cACControl	:= CmnGridHojyoMA;

    // ｸﾞﾙｰﾌﾟ管理の確認<047>
    //fnChkGroupKbn();

    //権限情報を取得<101>
//    m_cJNTArea.FxPermission; <002>
    if (m_cJNTArea.IsModify = False) then
    begin
        if (m_cJNTArea.IsAppend = False ) then
        begin
            m_nReferMode := REFER;//決算確定と同様の処理
        end
        else
        begin
    		CmnGridHojyoMA.Options 	:= CmnGridHojyoMA.Options + [egoCanAppend] - [egoCanInsert];
    		CmnGridAccInfo.Options 	:= CmnGridAccInfo.Options + [egoCanAppend] - [egoCanInsert];
        end;
    end;

// <069> ADD-STR
    // 自動仕訳申請状況チェック
    if (not fnAllowEdit) then
    begin
        m_nReferMode := REFER;
		m_bDelete := False;
// <083> Add start
            MjsMessageBox(Self,
            				'債務管理（経費精算）の自動仕訳を承認申請中のため、関連情報の修正は行えません。',
                            mjWarning,
                            mjDefOK									);
// <083> Add end
    end;
// <069> ADD-END

    if m_nReferMode = REFER  then
    begin
        CmnGridHojyoMA.Options		:= CmnGridHojyoMA.Options - [egoCanAppend] + [egoRowSelect];
        CmnGridAccInfo.Options		:= CmnGridAccInfo.Options - [egoCanAppend] + [egoRowSelect];
// <060> ADD start
                                            // 参照時は標準手数料ボタンを無効にする
		B_HJunTesuuryo.Enabled 		:= False;
// <060> ADD end
    end;

// <087> ADD-STR
    // 支払レイアウトコンボの設定
    CmnCmbo03024Layout.Items.Clear;
    CmnCmbo03024Layout.Items.Add('');
    CmnCmbo03024Layout.ItemIndex := 0;
	sPath := rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot + '\MAS\PRG\PayERPara_*.APG';   // APGファイルからの読込
//	if FileExists( sPath ) = True then
//	begin
		if FindFirst(sPath, faArchive, sr) = 0 then
            CmnCmbo03024Layout.Items.Add(sr.Name);

		while FindNext(sr) = 0 do
		begin
            CmnCmbo03024Layout.Items.Add(sr.Name);
		end;
//	end;
// <087> ADD-END

// <093> ADD-STR
    // 仕訳情報科目追加条件
    if (StrToInt('0' + GetPayCommonValue('Shiharai', 'PAYSWK_KFURI_KMK')) <> 0) then
        m_sAddCharCode := ' OR CharCode = 17'
    else
        m_sAddCharCode := '';
// <093> ADD-END

//↓<CDCHG>モジュールライセンスをチェックします
    SetLength(ACheck, 2);

    ACheck[0].ModuleCode	:= FXLicense.MAS_SMU;	// 債務
    ACheck[1].ModuleCode	:= FXLicense.MAS_SEI;	// 経費精算

    CheckModuleLicenses(m_Base_pRec, ACheck);

    for AIndex := Low(ACheck) to High(ACheck) do
    begin
		case ACheck[AIndex].ModuleCode of
            FXLicense.MAS_SMU:	m_bSaimu	:= ACheck[AIndex].IsLicense;
            FXLicense.MAS_SEI:	m_bKeihi	:= ACheck[AIndex].IsLicense;
        end;
    end;

    SetLength(ACheck, 0);
//↑<CDCHG>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnActivate (TObject)													*/
//*																											*/
//*	目的	: 支払情報登録処理 ﾌｫｰﾑ OnActivate ｲﾍﾞﾝﾄ														*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnActivate (Sender: TObject);
var
	cAppParam: TAppParam;

begin
	cAppParam.iAction		:= ACTID_ACTIVEEND;
	cAppParam.pRecord		:= Pointer (m_pRec);
	cAppParam.pActionParam	:= nil;

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppParam);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnCloseQuery (TObject)												*/
//*																											*/
//*	目的	: 支払情報登録処理 ﾌｫｰﾑ OnCloseQuery ｲﾍﾞﾝﾄ														*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnCloseQuery (Sender: TObject; var CanClose: Boolean);
var
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;
	fReturn		: Boolean;

begin
    // 終了ﾌﾗｸﾞをONに設定する
    if ( uvCloseFlg = False ) then uvCloseFlg := True;

//	if	(m_cPreview.IsPreView ()) then
	if ( uvHani.mjspre.IsPreView = TRUE ) then
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);

		MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		CanClose	:= FALSE;
	end;

// <059> MOD start
(*
	nReturn	:= fnOutputConfirmationMessage (CONFIRM_EXIT);

	if	(nReturn = CONFIRM_RETFOCUSED) then
	begin
		CanClose	:= FALSE;
		Exit;
	end
	else if	(nReturn = CONFIRM_WRITE) then
	begin
		fReturn	:= fnUpdateRecordDetail ();

		if	(not fReturn) then
		begin
			Beep ();

			CanClose	:= FALSE;
			Exit;
		end;
	end;
*)
	if m_nReferMode <> REFER then  			// 参照ﾓｰﾄﾞの場合は保存確認ﾒｯｾｰｼﾞを表示しない
    begin
     	nReturn	:= fnOutputConfirmationMessage (CONFIRM_EXIT);

		if	(nReturn = CONFIRM_RETFOCUSED) then
		begin
           	uvCloseFlg  := FALSE;			// <064> ADD 各制御を実行可能にする

			CanClose	:= FALSE;
			Exit;
		end
		else if	(nReturn = CONFIRM_WRITE) then
		begin
			fReturn	:= fnUpdateRecordDetail ();

			if	(not fReturn) then
			begin
				Beep ();

				CanClose	:= FALSE;
				Exit;
			end;
		end;
	end;
// <059> MOD end

	fnResetChangeFlagCheckItems ();

    //  共通システム開放
//    m_cJNTArea.Free; <002>                                                                                           		

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnClose (TObject; var TCloseAction)									*/
//*																											*/
//*	目的	: 支払情報登録処理 ﾌｫｰﾑ OnShow ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnClose (Sender: TObject; var Action: TCloseAction);
var
	dqTreeWork		: TMQuery;
	cAppPrm			: TAppParam;
	cMessageRec		: TMJSMsgRec;
	cDlgMasTree2	: TJNTMasTreee2Dlgf;
	nCount			: Integer;
	arMasterDivision: Array of Integer;

begin
	m_fUnderConstruction	:= TRUE;

	for nCount := 0 to CmnTreeView.Items.Count - 1 do
	begin
		if	(CmnTreeView.Items [nCount].Data <> nil) then
			Dispose (CmnTreeView.Items [nCount].Data);
	end;

	m_fUnderConstruction	:= TRUE;

{	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_MASTERINFO, MASTER_BANK, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOMA   , MASTER_BANK, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_BANKINFO  , MASTER_BANK, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_ACCINFO   ,           0, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE , MASTER_BANK, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_FEEINFO   , MASTER_BANK, 0, 0);
}
	if	(m_nHojyoTree = 1) then
	begin
//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE, MASTER_BANK, 0, 1);

		SetLength (arMasterDivision, 1);

		arMasterDivision [0]	:= MASTER_BANK;

		cDlgMasTree2	:= TJNTMasTreee2Dlgf.Create (Self);

		if	(cDlgMasTree2.ExecTree2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
									m_cDataModule, m_cComArea.m_iCopNo, arMasterDivision, dqTreeWork) < 0) then
		begin
			if	(dqTreeWork <> nil) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (cMessageRec, dqTreeWork);
				MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
											cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, FALSE);
				dqTreeWork.Free ();
			end
			else
				MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
											cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, FALSE);
		end;

		cDlgMasTree2.Close ();
		cDlgMasTree2.Free  ();
	end;

	Action	:= caFree;

	fnTerminateCheckItems ();

//--- <#2> St -----
	// 排他情報ﾘｾｯﾄ
	if m_cExcept <> nil then
	begin
		m_cExcept.ResetTerm;
		m_cExcept.Free;
	end;
//--- <#2> Ed -----

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	m_cDataModule.CTLDBClose (m_cDBCommon);
	m_cDataModule.COPDBClose (m_cDBSelect);

	m_pRec^.m_iDelete		:= 1;

	cAppPrm.iAction			:= ACTID_FORMCLOSEEND;										// 呼び出し区分設定
	cAppPrm.pRecord			:= Pointer (m_pRec);										// 管理構造体ﾎﾟｲﾝﾀ設定
	cAppPrm.pActionParam	:= nil;				  										// 予備ﾎﾟｲﾝﾀ設定

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppPrm);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnShow (TObject)														*/
//*																											*/
//*	目的	: 支払情報登録処理 ﾌｫｰﾑ OnShow ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnShow (Sender: TObject);
begin

    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);

	JNTMasSetCaption (m_pRec);
	MJSBtnVisible (TJNTCRP008002f (Self), TRUE);

	if	(CmnTabInformations.Items [2].Enabled) then
		fnChangeConditionPageButtons (FALSE);

	if	(m_cPreview.IsPreView ()) then
		m_cPreview.Show ()
	else
		m_cACControl.SetFocus ();

    fnCmnGridHojyoMAOnChangeNodeEx(Sender);     //<014>

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008002f.fnJNTCRP008002fOnHide (TObject)												*/
//*																											*/
//*	目的	: 支払情報登録処理 ﾌｫｰﾑ OnHide ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnJNTCRP008002fOnHide (Sender: TObject);
begin

    MJSBtnVisible (TJNTCRP008002f (Self), FALSE);

    if	(m_cPreview.IsPreView ()) then
        m_cPreview.Hide ();

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionOnEnter (Sender: TObject);
var
//	cMessageRec: TMJSMsgRec;
	nCommentNo : Integer;
	strComment : String;

begin
	m_fIgnoreProc	:= FALSE;
	m_cACControl	:= Screen.ActiveControl;

	if	((Sender is TMNumEdit) or
		 (Sender is TMTxtEdit)) then
	begin
		if	(CompareStr (Copy (TWinControl (Sender).Name, 8, 8), 'FeeValue') = 0) then
			nCommentNo	:= StrToInt (Copy (TWinControl (Sender).Name, 20, 2)) + 1000
		else
			nCommentNo	:= StrToInt (Copy (TWinControl (Sender).Name, 8, 5));

		strComment	:= fnGetGuideComment (nCommentNo);
	end
	else
		strComment	:= '';

// <044> 2006/12/21 H.Kawato Add Start
	if	(Sender is TMNumEdit) then
        (Sender as TMNumEdit).Zero  := True;
// <044> 2006/12/21 H.Kawato Add End

//	CmnMemoFieldComment  .Lines.Text	:= strComment;

{	if	(CmnMemoFieldComment.Lines.Count > 4) then
		CmnMemoFieldComment.ScrollBars	:= ssVertical
	else
		CmnMemoFieldComment.ScrollBars	:= ssNone;
}
	if	(TWinControl (Sender).Name = CmnEdit00007NMK.Name) then
	begin
//<008>		m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 19);
//<008>		CmnStatusBar.SimpleText	:= cMessageRec.sMsg;
        fnSetFncType(True,7);   //<008>
	end
	else
//<008>		CmnStatusBar.SimpleText	:= '';
        fnSetFncType(False,7);  //<008>

{	if	(not fnCheckEditItemsValue ()) then
	begin
		if	((m_cACControl is TMNumEdit ) or
			 (m_cACControl is TMTxtEdit ) or
			 (m_cACControl is TMDateEdit)) then
		begin
			if	(m_cACControl.Enabled) then
			begin
				m_cACControl.SetFocus ();

				TEdit (m_cACControl).SelectAll ();
				Beep  ();
				Abort ();
			end;
		end;
	end;

	m_cACControl	:= Screen.ActiveControl;
}
// <079> ADD-STR
    // 次頁ボタンにフォーカスがある場合のみ、前頁ボタンへの移動を許す
	CmnButtonPagePrevious.TabStop := (TWinControl(Sender).Name = CmnButtonPageNext.Name);
// <079> ADD-END

//↓<CDCHG>
	if (TWinControl (Sender).Name = CmnEdit00001BkCode.Name) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BANK;
		CmnStatusBar.SimpleText := '銀行が《銀行検索エクスプローラー》に存在しない場合は、銀行のコードや名称は手入力で設定してください。'; // <106> ADD
    end
    else if (TWinControl (Sender).Name = CmnEdit00002BrCode.Name) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BRANCH;
		CmnStatusBar.SimpleText := '支店が《銀行検索エクスプローラー》に存在しない場合は、支店のコードや名称は手入力で設定してください。'; // <106> ADD
    end
    else
    begin
    	B_CodeChange.Visible := False;
    end;
//↑<CDCHG>
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionOnEnterException (Sender: TObject);
begin
	m_fIgnoreProc	:= FALSE;
	m_cACControl	:= Screen.ActiveControl;

//	CmnMemoFieldComment  .Lines.Text	:= '';
//	CmnMemoFieldComment  .ScrollBars	:= ssNone;

	CmnStatusBar.SimpleText	:= '';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionNumEditOnChange (Sender: TObject);
var
	strDescription: String;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnGetDescriptionSelectedItem (Sender as TMNumEdit, strDescription);

	TMLabel (MJSFindCtrl (Self, 'CmnLabel'
							+ Copy ((Sender as TMNumEdit).Name, 8, 64) + 'Desc')).Caption	:= strDescription;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionOnChange (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

		fnSetChangeFlagCheckItems (Sender, TRUE);

// <063> ADD start
	if Sender = CmnEdit03016BumCodeFree then    // 部門(ﾌﾘｰ属性)
    begin
      	CmnEdit03016BumCodeFree.TagStr := '';	// 検索Expでｾｯﾄした部門内部ｺｰﾄﾞをｸﾘｱする(入力時は最新の部門を表示するため)
    end
                                              	// 部門(数字属性)
    else if Sender = CmnEdit03016BumCodeNumeric then
    begin
     	CmnEdit03016BumCodeNumeric.TagStr := '';// 検索Expでｾｯﾄした部門内部ｺｰﾄﾞをｸﾘｱする(入力時は最新の部門を表示するため)
    end;
// <063> ADD end

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) or ((Key = VK_TAB) and (Shift = [])) then
	begin
        fnCmnExit(Sender);          // 入力制御前にﾌｫｰｶｽ移動しないよう追加 <044>
        MjsNextCtrl(Self);
//<036>		if	(not fnMoveFocusNextControl ()) then
//<036>			Exit ;
	end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		// <025> -->
		//if	((TWinControl (Sender).Name = CmnEdit00001BkCode.Name) or
		//	 (TWinControl (Sender).Name = CmnEdit03001AccountCode    .Name)) then
		if	(TWinControl (Sender).Name = CmnEdit00001BkCode.Name) then
        begin
			m_cACControl	:= P_ComBox;
			//if	(Key = VK_ESCAPE) then
			//	m_cACControl	:= P_ComBox
			//else if	(Key = VK_END) then
			//	m_cACControl	:= P_ComBox
			//else
			//	m_cACControl	:= TWinControl (Sender);
		end
		else
		begin
			//m_cACControl	:= CmnButtonUpdate
			if	(Key = VK_ESCAPE) then
            begin
				m_cACControl := CmnEdit00001BkCode;		// タブの外
            	// タブ内の最初
                if (TWinControl (Sender).Name = 'CmnEditFeeValue010101')
                or (TWinControl (Sender).Name = 'CmnEditFeeValue010102')
                or (TWinControl (Sender).Name = 'CmnEdit02001LayoutPathDraft')
                or (TWinControl (Sender).Name = 'CmnEdit03001AccountCode') then
					m_cACControl := CmnEdit00001BkCode		// タブの外
            	// 手数料タブ
            	else if (MjsHanPos('CmnEditFeeValue0', TWinControl (Sender).Name) <> 0)
// <096> MOD↓
//                or (TWinControl (Sender).Name = 'fBiiRate') then
                or (MjsHanPos('CmnEdit01', TWinControl (Sender).Name) <> 0) then
// <096> MOD↑
                begin
                	if CmnEditFeeValue010102.CanFocus then
						m_cACControl := CmnEditFeeValue010102;
                end
            	// レイアウト情報タブ
                else if MjsHanPos('CmnEdit02', TWinControl (Sender).Name) <> 0 then
                begin
                	if CmnEdit02001LayoutPathDraft.CanFocus then
						m_cACControl := CmnEdit02001LayoutPathDraft;
                end
            	// 講座管理情報タブ
                else if MjsHanPos('CmnEdit03', TWinControl (Sender).Name) <> 0 then
                begin
                	if CmnEdit03001AccountCode.CanFocus then
						m_cACControl := CmnEdit03001AccountCode;
                end;
            end
			else if	(Key = VK_END) then
				m_cACControl	:= CmnButtonUpdate	// <025>
			else
				m_cACControl	:= TWinControl (Sender);
		end;
       	// <025> <--

		m_cACControl.SetFocus ();
	end

	else if	((Key = VK_LEFT) or (Key = VK_UP)) or ((Key = VK_TAB) and (Shift = [ssShift])) then
	begin
		if	(TWinControl (Sender).Name = CmnEdit00001BkCode.Name) then
			Exit ;

		if	(Sender is TMTxtEdit) AND (Key = VK_LEFT) then	// <MAS349>
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN)) then						// Altｷｰが押された時
			Exit;

		if	(Sender is TMTxtEdit) AND (Key = VK_RIGHT) then	// <MAS349>
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
			begin
                fnCmnExit(Sender);  // 入力制御前にﾌｫｰｶｽ移動しないよう追加 <044>
                MjsNextCtrl(Self);
//<036>				if	(not fnMoveFocusNextControl ()) then
//<036>					Exit ;
			end;
		end
		else
		begin
            fnCmnExit(Sender);      // 入力制御前にﾌｫｰｶｽ移動しないよう追加 <044>
            MjsNextCtrl(Self);
//<036>			if	(not fnMoveFocusNextControl ()) then
//<036>				Exit ;
		end;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionNumEditArrowDispOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not ((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN))) then				// Altｷｰが押された時以外
		begin
			if	(fnGetIndexSelectItem (Sender as TMNumEdit) = -1) then
			begin
				Beep ();
				(Sender as TMNumEdit).SelectAll ();
				Abort ();
			end;
		end;
	end;

	fnCmnFunctionOnKeyDown (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnFunctionTxtEditOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(((Key < '0') or (Key > '9')) and
		  (Key <> #8) and (Key <> #9) and (Key <> #13) and (Key <> #27)) then
	begin
		Beep  ();
		Abort ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonToolbarExitOnClick (Sender: TObject);
begin
	Close ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
(*
procedure	TJNTCRP008002f.fnCmnButtonToolbarPrintOnClick (Sender: TObject);
var
	dqPrintData      : TMQuery;
	cDlgCondition    : TJNTCRP008002_4f;
	cDlgPrint	     : TMJSPrnDlgf;
	cMemData		 : TdxMemData;
	cMessageRec		 : TMJSMsgRec;
	cTitleField		 : TStringList;
	cMemDataField	 : TStringList;
	nCurCodeDigit	 : Integer;
	nCurCodeAttribute: Integer;
	nAdoption	     : Integer;
	strDescription	 : String;
	strTmpFileName   : String;
	strFormatDate	 : String;
	strFormatDateTime: String;

begin
	cMemData	:= nil;

	fnGetAdoptInformation (MASTER_BANK, strDescription, nCurCodeDigit, nCurCodeAttribute, nAdoption);

	cDlgCondition	:= TJNTCRP008002_4f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect,
											0, nCurCodeDigit, nCurCodeAttribute, strDescription);

	if	(cDlgCondition.ShowModal () = mrCancel) then
		Exit;

	cTitleField		:= TStringList.Create ();
	cMemDataField	:= TStringList.Create ();

	m_nPrintOrder			:= cDlgCondition.m_nOrderDivision;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strPrintBankCodeStr	:= cDlgCondition.m_strBankCodeStr;							// 出力範囲: 銀行ｺｰﾄﾞ(開始)
	m_strPrintBankCodeEnd	:= cDlgCondition.m_strBankCodeEnd;							// 出力範囲: 銀行ｺｰﾄﾞ(終了)

	dqPrintData	:= TMQuery.Create (Self);										// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqPrintData);							// DBとMQueryの接続

	cDlgPrint		:= TMJSPrnDlgf   .Create (Self);
	m_cPrnSupport	:= TMjsPrnSupport.Create ();

	gfnJNTMasSetPrnInfo (m_cPrnSupport, dqPrintData);

	case (cDlgCondition.m_nSelected) of
		0:	begin																		// 銀行登録ﾘｽﾄ(簡略)
				m_cPrnSupport.strDocName		:= strDescription + '登録リスト';
				m_cPrnSupport.ApRB				:= CmnReportStandard;
				m_cPrnSupport.pPage				:= CmnReportStandardSysVarPage;			// 頁
				m_cPrnSupport.pDate				:= CmnReportStandardSysVarDate;			// 日付
				m_cPrnSupport.pCorpCode			:= CmnReportStandardLabelCorpCode;		// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName			:= CmnReportStandardLabelCorpName;		// 会社名称
				m_cPrnSupport.pAccountOffice	:= CmnReportStandardAccOffice;			// 会計事務所名称

				strTmpFileName	:= '\tmp\' + strDescription + '登録リスト(簡略).csv';
			end;

		1:	begin																		// 銀行登録ﾘｽﾄ(詳細)
				m_cPrnSupport.strDocName	:= strDescription + '登録リスト';
				m_cPrnSupport.ApRB			:= CmnReportDetail;
				m_cPrnSupport.pPage			:= CmnReportDetailSysVarPage;				// 頁
				m_cPrnSupport.pDate			:= CmnReportDetailSysVarDate;				// 日付
				m_cPrnSupport.pCorpCode		:= CmnReportDetailLabelCorpCode;			// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		:= CmnReportDetailLabelCorpName;			// 会社名称

				strTmpFileName	:= '\tmp\' + strDescription + '登録リスト(詳細).csv';
			end;

		2:	begin																		// 口座登録ﾘｽﾄ
				m_cPrnSupport.strDocName	:= '口座登録リスト';
				m_cPrnSupport.ApRB			:= CmnReportAccount;
				m_cPrnSupport.pPage			:= CmnReportAccountSysVarPage;				// 頁
				m_cPrnSupport.pDate			:= CmnReportAccountSysVarDate;				// 日付
				m_cPrnSupport.pCorpCode		:= CmnReportAccountLabelCorpCode;			// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		:= CmnReportAccountLabelCorpName;			// 会社名称

				strTmpFileName	:= '\tmp\口座登録リスト.csv';
			end;

		else
			begin
				dqPrintData.Free ();
				cDlgPrint  .Free ();

				Exit;
			end;
	end;

	m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + strTmpFileName;
	m_cPrnSupport.pComArea		:= m_pRec^.m_pCommonArea;
	m_cPrnSupport.iDspFileBtn	:= 1; 													// ﾌｧｲﾙ出力表示
	m_cPrnSupport.iSysCode		:= m_pRec^.m_iSystemCode;								// ｼｽﾃﾑｺｰﾄﾞ
	m_cPrnSupport.iReportID		:= 990100;												// 帳票ｸﾞﾙｰﾌﾟ№
	m_cPrnSupport.MdataModule	:= m_cDataModule;
	m_cPrnSupport.iCalendarKbn	:= m_nDateFormatDivision + 1;

	if	(cDlgPrint.DoDLG (m_cPrnSupport) > 0) then
	begin
		if	((m_cPreview.IsExistPreview ()) and (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
		begin
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 10040, 1);

			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle, cMessageRec.icontype,
												cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);

			cDlgPrint  .Free ();
			dqPrintData.Free ();

			Exit;
		end;

		if	(m_nDateFormatDivision = 0) then											// 和暦/西暦区分: 0=和暦
		begin
			strFormatDate		:= 'ee/mm/dd';
			strFormatDateTime	:= 'ee/mm/dd hh:mm:ss';
		end
		else																			// 和暦/西暦区分: 1=西暦
        begin
			strFormatDate		:= 'yy/mm/dd';
			strFormatDateTime	:= 'yy/mm/dd hh:mm:ss';
		end;

		case (cDlgCondition.m_nSelected) of
			0:	begin																	// 銀行登録ﾘｽﾄ(簡略)
					CmnReportStandardLabelTitle.Caption	:= strDescription + '登録リスト';

					CmnReportStandardDBTextAppDateStart.DisplayFormat	:= strFormatDate;
					CmnReportStandardDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
					CmnReportStandardDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;

					CmnReportStandardLineTitle.Left		:= CmnReportStandardLabelTitle.Left;
					CmnReportStandardLineTitle.Width	:= CmnReportStandardLabelTitle.Width;

					fnPrintCheckListStandard ();

					cMemData	:= CmnMemDataPrintStandard;
				end;

			1:	begin																	// 銀行登録ﾘｽﾄ(詳細)
					CmnReportDetailLabelTitle.Caption	:= strDescription + '登録リスト';

					CmnReportDetailLineTitle.Left	:= CmnReportDetailLabelTitle.Left;
					CmnReportDetailLineTitle.Width	:= CmnReportDetailLabelTitle.Width;

					fnPrintCheckListDetail ();

					cMemData	:= CmnMemDataPrintDetail;
				end;

			2:	begin																	// 口座登録ﾘｽﾄ
					fnPrintCheckListAccount ();

					cMemData	:= CmnMemDataPrintAccount;
				end;
		end;

		if	((m_cPrnSupport.iCommand <> PDLG_CANCEL) and (cMemData.RecordCount = 0)) then
		begin
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 40, 3);

			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle, cMessageRec.icontype,
													cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);

			cDlgPrint  .Free ();
			dqPrintData.Free ();

			Exit;
		end;

		if	((m_cPrnSupport.iCommand = PDLG_PRINT) or (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
			m_cPreview.Exec (m_cPrnSupport, cDlgPrint, nil)
		else if	(m_cPrnSupport.iCommand = PDLG_FILE) then
		begin
			fnSetReportTitleField (cDlgCondition.m_nSelected, strDescription, cTitleField, cMemDataField);

			if	(MJSFileOut (cMemData, cMemDataField, cTitleField, m_cPrnSupport, m_pRec) = -1) then
			begin
				m_cComArea.m_MsgStd.GetMsg (cMessageRec, 10040, 3);

				MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle, cMessageRec.icontype,
													cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
			end;
		end;
	end;

	cDlgPrint  .Free ();
	dqPrintData.Free ();
end;
*)
procedure	TJNTCRP008002f.fnCmnButtonToolbarPrintOnClick (Sender: TObject);
var
	cMemData	: TdxMemData;
    lvRet       : Integer;            // <PRN>
    JNTPDlg     : TFrmJNTPDialog;     // <PRN>
begin

	cMemData	:= nil;

    m_cJNTArea.SetSelAppRecord;

    // 範囲ﾀﾞｲｱﾛｸﾞを表示する<PRN>
    JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
    lvRet   := JNTPDlg.ShowModal;
    JNTPDlg.Free;
//<Del10-VerUp001><D10_OwnMapRules> ST
	m_cDBSelect.FormatOptions.MapRules.Clear;
	m_cDBSelect.FormatOptions.OwnMapRules := False;
//<Del10-VerUp001><D10_OwnMapRules> ED

    //ｷｬﾝｾﾙ他
    if lvRet <> 1 then
    begin
        m_cJNTArea.SetMasAppRecord;
        Exit;
    end;

	case (uvHani.pvrPattern) of
        // 銀行登録ﾘｽﾄ(詳細)
		0:	begin
//↓<MLXHAP>
				if TMSeries.IsMjsLink3 then
				begin
					// MLX給与専用SQL(ベースは依頼先口座登録ﾘｽﾄのほう)
                    m_nOrderDivision := uvHani.pvrOrder;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
                    fnPrintCheckList_MLXHAP();
                    cMemData := CmnMemDataPrint_MLXHAP;
				end
				else
				begin
//↑<MLXHAP>下記、字下げ。
                    m_nOrderDivision	:= uvHani.pvrOrder;             		// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
                    //m_strPrintBankCodeStr	:= uvHani.pvrStCode[0];        		// 開始外部ｺｰﾄﾞ
                    //m_strPrintBankCodeEnd	:= uvHani.pvrEdCode[0];	    		// 終了外部ｺｰﾄﾞ

                    fnPrintCheckListDetail ();
                    cMemData	:= CmnMemDataPrintDetail;
//↓<MLXHAP>
				end;
//↑<MLXHAP>
			end;
{
        // 銀行登録ﾘｽﾄ(簡略)
    	0:  begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ

				fnPrintCheckListStandard ();
				cMemData	:= CmnMemDataPrintStandard;
            end;
        // 口座登録ﾘｽﾄ
		2:	begin
				fnPrintCheckListAccount ();
				cMemData	:= CmnMemDataPrintAccount;
    		end;
}
		// -----<062> Add-St-----
		// 依頼先口座登録ﾘｽﾄ
		1:
		begin
			m_nOrderDivision := uvHani.pvrOrder;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
			fnPrintCheckListAccount();
			cMemData := CmnMemDataPrintAccount;
		end;
		// -----<062> Add-Ed-----
    end;

    uvHani.pvrYearKbn   := m_nDateFormatDivision;                           // 和暦西暦区分

    // <PRN>
    with PrtParam do
  	begin
    	Para		:=  uvHani;
        TargetMD    :=  cMemData;
       	CorpSys		:=  uvSelSys;
   	end;

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( cMemData.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
    end
    else
    begin
	    //印刷する<PRN>
    	PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
    end;
    m_cJNTArea.SetMasAppRecord;


end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonToolbarDetailOnClick (Sender: TObject);
var
	nAccountCode: Integer;
//	nNCode	: Extended;
    nBkCode : Integer;

begin
	if	(CmnPanelClientDetail.Visible ) then
	begin
		// hirota 051206 >>
        if (not fnChangeSelectionScreen) then
        	Exit;						// 詳細画面のまま

		CmnPanelClientDetail  .Visible	:= FALSE;

		CmnPanelClientStandard.Visible	:= TRUE;
		// hirota 051206 <<

// <066> MOD start
//		fnMoveRecSelecter (PTreeViewRec (CmnTreeView.Selected.Data)^.nNCode);
        if CmnTreeView.Items.Count <> 0 then
        begin
			fnMoveRecSelecter (PTreeViewRec (CmnTreeView.Selected.Data)^.nNCode);
        end;
// <066> MOD end

        B_Syousai.Caption	:= '詳細(&T)';

//		m_cACControl	:= CmnTreeView;
    	m_cACControl	:= CmnGridHojyoMA;
		m_cACControl.SetFocus ();
		fnRebuildGridAccInfo (CmnMemDataHojyoMAnCODE.AsFloat);  //<017>
	end
	else
	begin

		if fnShowScreenInformations () = False then Exit;

        nBkCode	:= CmnEdit00001BkCode.AsInteger;

        if	(not CmnEdit00001BkCode.Static) then
            m_cACControl	:= CmnEdit00001BkCode
        else
            m_cACControl	:= CmnEdit03001AccountCode;

        nAccountCode	:= CmnEdit03001AccountCode.AsInteger;

		fnChangeConditionToolbarButtons (nBkCode, nAccountCode);

		if	(m_nReferMode = REFER) then													// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照の時
		begin
			CmnButtonUpdate.Enabled	:= FALSE;
			CmnButtonCancel.Enabled	:= FALSE;

			m_cACControl	:= CmnTreeView;
		end
		else
		begin
			CmnButtonUpdate.Enabled	:= TRUE;
			CmnButtonCancel.Enabled	:= TRUE;
		end;

        B_Syousai.Caption	:= '一覧(&T)';

		m_cACControl.SetFocus ();

        if m_nReferMode <> REFER then
            fnChangeConditionAllControlsDetail(True);
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonToolbarDeleteOnClick (Sender: TObject);
var
	cMessageRec	: TMJSMsgRec;
	nAccountCode: Integer;
	nGridTarget	: Integer;
	nBkCode,nBrCode : Integer;
	strMessage	: String;
    nNCODE      : Extended;
    RecNo		: Integer;
    exAccNCode  : Extended;                 // <CHK>
    strMsg      : String;                   // <CHK>
    strErr, strName, strCode : String;      // <CHK>
begin
    nNCode          := 0;   ///<044>
    RecNo           := 0;   ///<044>
	nGridTarget 	:= 0;
///	nAccountCode	:= 0;
    nBkCode         := 0;
    nBrCode         := 0;

	if	(Screen.ActiveControl.Name = CmnGridHojyoMA.Name) then							// HojyoMA ｸﾞﾘｯﾄﾞ
	begin
		nBkCode		 := CmnGridHojyoMA.DataSource.DataSet.FieldByName ('nBkCode'  ).AsInteger;
		nBrCode		 := CmnGridHojyoMA.DataSource.DataSet.FieldByName ('nBrCode'  ).AsInteger;
		nAccountCode := -1;
		nGridTarget	 := 1;
		strMessage	 := CmnGridHojyoMA.DataSource.DataSet.FieldByName ('strBKName').AsString
                            + CmnGridHojyoMA.DataSource.DataSet.FieldByName ('strBrName').AsString;
		nNCode       := CmnMemDataHojyoMAnCODE.AsFloat; //<019>
        RecNo		 := CmnGridHojyoMA.DataSource.DataSet.RecNo;
	end
	else if	(Screen.ActiveControl.Name = CmnGridAccInfo.Name) then						// AccInfo ｸﾞﾘｯﾄﾞ
	begin
		nBkCode	     := 0;
		nNCode       := CmnMemDataHojyoMAnCODE.AsFloat; //<019>
		nAccountCode := CmnGridAccInfo.DataSource.DataSet.FieldByName ('nAccountCode').AsInteger;
		with (CmnGridAccInfo.DataSource.DataSet) do
		begin
			case (FieldByName ('nDepDivision').AsInteger) of
				1:	strMessage	:= Format ('%.4d ', [nAccountCode]) + '普通 ';
				2:	strMessage	:= Format ('%.4d ', [nAccountCode]) + '当座 ';
				3:	strMessage	:= Format ('%.4d ', [nAccountCode]) + '貯蓄 ';
				9:	strMessage	:= Format ('%.4d ', [nAccountCode]) + 'その他 ';
			end;

			strMessage	:= strMessage + fnGetEditedAccountNumber (FieldByName ('strAccountNo').AsString);
		end;

		nGridTarget	:= 2;
        RecNo		 := CmnGridAccInfo.DataSource.DataSet.RecNo;
	end
	else if	(CmnPanelClientDetail  .Visible) then										// 詳細: 口座管理情報登録
	begin
        nBkCode	:= CmnEdit00001BkCode.asInteger;
        nBrCode	:= CmnEdit00002BrCode.asInteger;
        nAccountCode	:= -1;
		strMessage	:= CmnEdit00007NMK.Text;

        nNCode := fnGetNCODE(nBkCode,nBrCode);  //<019>
	end
	else																				// ﾂﾘｰﾋﾞｭｰ
	begin
		nBkCode	    	:= PTreeViewRec (CmnTreeView.Selected.Data)^.nBkCode;
		nBrCode	    	:= PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode;
		strMessage		:= PTreeViewRec (CmnTreeView.Selected.Data)^.strDescription;
		nAccountCode	:= -1;
	end;

  	nBkCode   := nBkCode;
    strName   := strMessage;                // <CHK>
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 4);

	strMessage	:= '"' + strMessage + '"のレコードを' + cMessageRec.sMsg;

	if	(MJSMessageBoxEx (Self,strMessage, cMessageRec.sTitle, cMessageRec.icontype,
									cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType) = mrYes) then
	begin
        // <CHK>↓
        if nAccountCode < 0 then            // 複数口座の削除ﾁｪｯｸ
        begin
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
            if not fnDelCheckBank(nNCode, strErr) then
            begin
                strCode := Format('%.4d', [nBkCode]) + ' ' + Format('%.3d', [nBrCode]);
                                            // 「銀行ｺｰﾄﾞ 支店ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
                strMsg := strCode + ' ' + strName + ' ' + strErr;
                MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
                Exit;
            end;
        end
        else                                // 口座の削除ﾁｪｯｸ
        begin
                                            // 口座情報の内部ｺｰﾄﾞ取得
            exAccNCode := fnGetAccNCode(nNCode, nAccountCode);
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
            if not fnDelCheck(exAccNCode, strErr) then
            begin
                                            // 「口座 預金種目 口座番号 は、xxxのため削除できません。」
                strMsg := strName + ' ' + strErr;
                MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
                Exit;
            end;
        end;
        // <CHK>↑

        SessionPractice(C_ST_PROCESS);			// <061> ADD

		fnDeleteRecord (nbkCode,nbrCode, nAccountCode,nNCODE);

        SessionPractice(C_ED_PROCESS);			// <061> ADD

        //ツリーを再構築
    	if	(Screen.ActiveControl.Name = CmnGridAccInfo.Name) then						// AccInfo ｸﾞﾘｯﾄﾞ
//<019>            fnRebuildGridAccInfo(nBkCode)
            fnRebuildGridAccInfo(nNCode)    //<019>
        else
            fnRebuildTreeViewItems ();
// <029>↓
     	if	(nGridTarget = 1) then							// HojyoMA ｸﾞﾘｯﾄﾞ
    	begin
        	if RecNo <> 1 then
	            CmnGridHojyoMA.DataSource.DataSet.RecNo := RecNo - 1;
    	end
	    else if	(nGridTarget = 2) then						// AccInfo ｸﾞﾘｯﾄﾞ
    	begin
        	if RecNo <> 1 then
            begin
	            CmnGridAccInfo.DataSource.DataSet.RecNo := RecNo - 1;
    			// なぜか１回では設定できないときがあるのでもう一回
	            if CmnGridAccInfo.DataSource.DataSet.RecNo <> RecNo - 1 then
		            CmnGridAccInfo.DataSource.DataSet.RecNo := RecNo - 1;
            end;
	    end;
// <029>↑
	end;
// <029>以下ｺﾒﾝﾄｱｳﾄ
	// 051124 >>
{	if	(nGridTarget = 1) then							// HojyoMA ｸﾞﾘｯﾄﾞ
	begin
    	if RecNo <> 1 then
	        CmnGridHojyoMA.DataSource.DataSet.RecNo := RecNo - 1;
	end
	else if	(nGridTarget = 2) then						// AccInfo ｸﾞﾘｯﾄﾞ
	begin
    	if RecNo <> 1 then
        begin
	        CmnGridAccInfo.DataSource.DataSet.RecNo := RecNo - 1;
			// なぜか１回では設定できないときがあるのでもう一回
	        if CmnGridAccInfo.DataSource.DataSet.RecNo <> RecNo - 1 then
		        CmnGridAccInfo.DataSource.DataSet.RecNo := RecNo - 1;
        end;
	end;
}
	// 051124 <<
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonToolbarFeeOnClick (Sender: TObject);
var
	cDialogFee: TJNTCRP008002_3f;

begin
	cDialogFee	:= TJNTCRP008002_3f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect, @_StandardFee);

	cDialogFee.ShowModal ();

	cDialogFee.Close ();
	cDialogFee.Free  ();
end;
//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTreeViewOnEnter (Sender: TObject);
begin
	fnCmnFunctionOnEnterException (Sender);

	if	(CmnTreeView.Items.Count <= 0) then
	begin
        // <047> 参照ﾓｰﾄﾞ時にﾚｺｰﾄﾞがない場合、SetFocusでｱﾄﾞﾚｽ違反が発生する対応。
        if (m_nReferMode <> REFER) then
        begin
    		m_cACControl	:= CmnGridHojyoMA;
    		m_cACControl.SetFocus ();
        end;

		Exit;
	end;

	fnChangeConditionToolbarButtons (PTreeViewRec (CmnTreeView.Selected.Data)^.nNCode,
														PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode);

	if	((PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode > 0)) then
	begin
		if	(CmnPanelClientDetail.Visible) then
			fnShowScreenInformations ()
		else
			fnMoveRecSelecter (PTreeViewRec (CmnTreeView.Selected.Data)^.nNCode);

        //<CDCHG>
//<CDCHG>end;
//↓<CDCHG>
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BRANCH;
	end
    else
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BANK;
    end;
//↑<CDCHG>
end;

//***********************************************************************************************************/
//  ツリーのNODEのチェンジイベント
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTreeViewOnChange (Sender: TObject; Node: TTreeNode);
var
    lvNCODE : Extended;
begin

    if PTreeViewRec (Node.Data)^.nItemDivision = 0 then
        lvNCODE := 0
    else
        lvNCODE := fnGetNCODE(PTreeViewRec (Node.Data)^.nBkCode,PTreeViewRec (Node.Data)^.nBrCode);

    if lvNCode = 0 then
        fnChangeConditionAllControlsDetail(False)
    else
        fnChangeConditionAllControlsDetail(True);

    PTreeViewRec (Node.Data)^.nNCode := lvNCODE;

	if	(m_fUnderConstruction) then
		Exit;

    if PTreeViewRec (Node.Data)^.nBrCode < 0 then
        PTreeViewRec (Node.Data)^.nBrCode := 0;

	fnChangeConditionToolbarButtons (PTreeViewRec (Node.Data)^.nNCode, PTreeViewRec (Node.Data)^.nBrCode);

    if lvNCode = 0 then
    begin
        B_Delete.Enabled := False;
        B_Syousai.Enabled := False;
    end else
    begin

// <054> MOD start
//		B_Delete.Enabled := m_cJNTArea.IsDelete;

    	if m_nReferMode = REFER then        // 参照時は削除ボタンを無効にする
        begin
// <055> MOD start
//			B_Delete.Enabled := False;
        	if m_bDelete then     			// 決算確定でなく、グループ管理なしの場合
            begin                 			// 削除権限ありの場合は削除ボタンを有効にする
             	B_Delete.Enabled := m_cJNTArea.IsDelete;
            end
            else
            begin
				B_Delete.Enabled := False;
            end;
// <055> MOD end
        end
        else
        begin
        	B_Delete.Enabled := m_cJNTArea.IsDelete;
        end;
// <054> MOD end

        B_Syousai.Enabled := True;
        fnRebuildGridAccInfo (lvNCode);                             //<015> 依頼先銀行表示
    end;

    if	(CmnPanelClientDetail.Visible) then
        fnShowScreenInformations ()                                 // 画面表示
    else
    begin
        fnMoveRecSelecter (PTreeViewRec (Node.Data)^.nNCode);       // グリッド表示
    end;

    //↓<CDCHG>
    if lvNCode = 0 then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BANK;
    end
    else
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BRANCH;
    end;
    //↑<CDCHG>

end;
//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTreeViewOnDragDrop (Sender, Source: TObject; X, Y: Integer);
var
///	nBrCode : Integer;
	nBkCode : Integer;
    nNCODE  : Extended;
    Qry     : TMQuery;
begin

///	nBrCode	:= PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode;
	nNCode	:= PTreeViewRec (CmnTreeView.Selected.Data)^.nNCode;

	if	(PTreeViewRec (CmnTreeView.DropTarget.Data)^.nItemDivision <> 2) then
		nBkCode	:= PTreeViewRec (CmnTreeView.DropTarget.Data)^.nBkCode
	else
	begin
		if	(CmnTreeView.DropTarget.Parent = nil) then
			nBkCode	:= 0
		else
			nBkCode	:= PTreeViewRec (CmnTreeView.DropTarget.Parent.Data)^.nBkCode;
	end;

    //存在チェック（ツリー後にドラック中のデータがあるか）？
    Qry	:= TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

    with (Qry) do
    begin
        Close ();
        Sql.Add('Select NCODE from BankInfo ');
        SQL.Add('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
        SQL.Add(' And AllBkCode = :nBkCode ');
        SQL.Add(' And AllBraCode = :nBrCode ');
        SQL.Add(' And RDelKBN   = 0 ');
        ParamByName ('nMasterDivision').AsInteger := MASTER_BANK;
        ParamByName ('nBkCode').AsInteger         := PTreeViewRec (CmnTreeView.DropTarget.Parent.Data)^.nBkCode;
        ParamByName ('nBrCode').AsInteger         := PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode;
        Open;
        //データが既にあった為未処理
        if not Eof then Exit;
    end;
	Qry.Close ();
	Qry.Free  ();

    //ツリーで移行したデータの更新
	if	(fnUpdateRecordBrCodeEx (nBkCode, nNCode)) then
	begin
		if	(CmnPanelClientDetail.Visible) then
			fnShowScreenInformations ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTreeViewOnDragOver (Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
	cNodeDst     : TTreeNode;
	cNodeTop	 : TTreeNode;
	cNodeTopNext : TTreeNode;
	cNodeLast	 : TTreeNode;
	cNodeLastPrev: TTreeNode;
	cNodeWork	 : TTreeNode;
	cNodeScroll	 : TTreeNode;
	hNodeID		 : HTreeItem;
	nCountVisible: Integer;
	nCountLoop	 : Integer;

begin
	cNodeDst		:= CmnTreeView.GetNodeAt (X, Y);									// ﾄﾞﾛｯﾌﾟ先ﾉｰﾄﾞ
	cNodeTop		:= CmnTreeView.TopItem;												// 一番上のﾉｰﾄﾞ
	cNodeTopNext	:= CmnTreeView.Items.GetNode (TreeView_GetNextVisible (CmnTreeView.Handle, cNodeTop.ItemId));
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

	if	(PTreeViewRec (CmnTreeView.Selected.Data)^.nItemDivision <> 2) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	if	(cNodeDst = nil) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	if	((PTreeViewRec (cNodeDst.Data)^.nItemDivision <> 2) and (CmnTreeView.Selected.Parent = cNodeDst)) then
	begin
		Accept	:= FALSE;
		Exit;
	end;

	if	((PTreeViewRec (cNodeDst.Data)^.nItemDivision = 2) and (CmnTreeView.Selected.Parent = cNodeDst.Parent)) then
	begin
		Accept	:= FALSE;
		Exit;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuTreeViewOnPopup (Sender: TObject);
var
	nCount		: Integer;
	nTagDivision: Integer;
	nTagWork	: Integer;

begin
	if	((CmnTreeView.Items.Count <= 0) or
		 (PTreeViewRec (CmnTreeView.Selected.Data)^.nItemDivision <> 2)) then
	begin
		for	nCount := 0 to CmnPopupMenuTreeView.Items.Count - 1 do
			CmnPopupMenuTreeView.Items [nCount].Enabled	:= FALSE;

		Exit;
	end
	else
	begin
		for	nCount := 0 to CmnPopupMenuTreeView.Items.Count - 1 do
			CmnPopupMenuTreeView.Items [nCount].Enabled	:= TRUE;
	end;

	m_cNodeRightClick			:= CmnTreeView.Selected;
	m_cNodeRightClick.Selected	:= TRUE;

	CmnPopupMenuTreeViewDetail.Enabled	:= TRUE;

	for	nCount := 1 to 4 do
	begin
		if	(m_nReferMode <> REFER) then												// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照以外
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Enabled	:= TRUE
		else
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Enabled	:= FALSE;
	end;

	if	(m_nReferMode <> REFER) then													// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照以外
	begin
		if	(PTreeViewRec (m_cNodeRightClick.Data)^.nItemDivision = 2) then
			CmnPopupMenuTreeViewDelete.Enabled	:= TRUE;
	end
	else
		CmnPopupMenuTreeViewDelete.Enabled	:= FALSE;

	if	(PTreeViewRec (m_cNodeRightClick.Data)^.nItemDivision = 2) then					// 口座ﾚｺｰﾄﾞ
	begin
		CmnPopupMenuTreeViewTagOff    .Visible	:= FALSE;
		CmnPopupMenuTreeViewTagComment.Visible	:= FALSE;

		for	nCount := 1 to 4 do
		begin
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible	:= TRUE;
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Enabled	:= FALSE;
		end;
	end
	else
	begin
		nTagDivision	:= fnGetDivisionSelectedTag (PTreeViewRec (m_cNodeRightClick.Data)^.nBkCode);

		if	(nTagDivision > 0) then
		begin
			CmnPopupMenuTreeViewTagOff    .Visible	:= TRUE;
			CmnPopupMenuTreeViewTagComment.Visible	:= TRUE;

			if	(nTagDivision = 2) then
				nTagWork	:= 3
			else if	(nTagDivision = 3) then
				nTagWork	:= 2
			else
				nTagWork	:= nTagDivision;

			CmnPopupMenuTreeViewTagOff.Bitmap	:= TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nTagWork]))).Bitmap;

			for	nCount := 1 to 4 do
			begin
				if	(nTagWork = nCount) then
					TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible	:= FALSE
				else
				begin
					if	(m_nReferMode <> REFER) then									// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照以外
						TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible	:= TRUE
					else
						TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible	:= FALSE;
				end;
			end;
		end
		else
		begin
			CmnPopupMenuTreeViewTagOff    .Visible	:= FALSE;
			CmnPopupMenuTreeViewTagComment.Visible	:= FALSE;

			for	nCount := 1 to 4 do
				TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible	:= TRUE;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuTreeViewDetailOnClick (Sender: TObject);
var
	nAccountCode: Integer;
	nNCode	: Extended;


begin
	m_cNodeRightClick.Selected	:= TRUE;

	fnShowScreenInformations ();

    nNCode	:= fnGetNCODE(CmnEdit00001BkCode.asInteger,CmnEdit00002BrCode.asInteger);

    if	(not CmnEdit00001BkCode.Static) then
        m_cACControl	:= CmnEdit00001BkCode
    else
        m_cACControl	:= CmnEdit03001AccountCode;

    nAccountCode	:= CmnEdit03001AccountCode.AsInteger;

	fnChangeConditionToolbarButtons (nNCode, nAccountCode);

    B_Syousai.Caption	:= '一覧(&T)';

	m_cACControl.SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuTreeViewDeleteOnClick (Sender: TObject);
var
	cMessageRec: TMJSMsgRec;
	pItemRec   : ^TreeViewRec;
	strMessage : String;

begin


	pItemRec	:= m_cNodeRightClick.Data;

	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 4);

	strMessage	:= '"' + pItemRec^.strDescription + '"のレコードを' +  cMessageRec.sMsg;

	if	(MJSMessageBoxEx (Self,strMessage, cMessageRec.sTitle, cMessageRec.icontype,
									cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType) = mrYes) then
    begin
    	SessionPractice(C_ST_PROCESS);  		// <061> ADD

		fnDeleteRecord (pItemRec^.nBkCode, pItemRec^.nBrCode,-1, pItemRec^.nNCode);

        SessionPractice(C_ED_PROCESS);  		// <061> ADD

        //ツリーを再構築
        fnRebuildTreeViewItems ();
    end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuTreeViewTagOnClick (Sender: TObject);
var
	pItemRec	: ^TreeViewRec;
	nTagKindWork: Integer;

begin
	pItemRec	:= m_cNodeRightClick.Data;

	m_cNodeRightClick.Selected	:= TRUE;

	if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagOff.Name) then
		nTagKindWork	:= 0
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem01.Name) then
		nTagKindWork	:= 1
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem02.Name) then
		nTagKindWork	:= 3
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem03.Name) then
		nTagKindWork	:= 2
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem04.Name) then
		nTagKindWork	:= 4
	else
		nTagKindWork	:= 0;

	fnUpdateRecordMFusenInfo	 (pItemRec^.nBkCode, nTagKindWork);
	fnUpdateRecordMemDataHojyoMA (pItemRec^.nBkCode, nTagKindWork);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuTreeViewTagOnClickEx (Sender: TObject);
var
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	pItemRec	: ^TreeViewRec;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

begin
	nTagKindWork	:= 0;
	fIgnore			:= FALSE;

	if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagComment.Name) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	(not TMenuItem (MJSFindCtrl (Self, Format (_PMItemTVTag, [nCount]))).Visible) then
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
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem01Ex.Name) then
		nTagKindWork	:= 1
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem02Ex.Name) then
		nTagKindWork	:= 3
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem03Ex.Name) then
		nTagKindWork	:= 2
	else if	((Sender as TMenuItem).Name = CmnPopupMenuTreeViewTagItem04Ex.Name) then
		nTagKindWork	:= 4
	else
		Exit;

	pItemRec	:= m_cNodeRightClick.Data;

	if	(not fIgnore) then
	begin
		fnUpdateRecordMFusenInfo	 (pItemRec^.nBkCode, nTagKindWork);
		fnUpdateRecordMemDataHojyoMA (pItemRec^.nBkCode, nTagKindWork);
	end;

///<044>
	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (Self,Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();
///<044>

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuGridHojyoMAOnPopup (Sender: TObject);
var
	nCount		: Integer;
	nTagDivision: Integer;
	nTagWork	: Integer;
	nBkCode	    : Integer;

begin
///	nBkCode	:= 0;

	nBkCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;

	if	(nBkCode = 0) then
	begin
		CmnPopupMenuGridHojyoMATagOff    .Visible	:= FALSE;
		CmnPopupMenuGridHojyoMATagComment.Visible	:= FALSE;

		for	nCount := 1 to 4 do
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Enabled	:= FALSE;

		Exit;
	end;

	for	nCount := 1 to 4 do
		TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Enabled	:= TRUE;

	nTagDivision	:= fnGetDivisionSelectedTag (nBkCode);

	if	(nTagDivision > 0) then
	begin
		CmnPopupMenuGridHojyoMATagOff    .Visible	:= TRUE;
		CmnPopupMenuGridHojyoMATagComment.Visible	:= TRUE;

		if	(nTagDivision = 2) then
			nTagWork	:= 3
		else if	(nTagDivision = 3) then
			nTagWork	:= 2
		else
			nTagWork	:= nTagDivision;

		CmnPopupMenuGridHojyoMATagOff.Bitmap	:= TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nTagWork]))).Bitmap;

		for	nCount := 1 to 4 do
		begin
			if	(nTagWork = nCount) then
				TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Visible	:= FALSE
			else
				TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Visible	:= TRUE;
		end;
	end
	else
	begin
		CmnPopupMenuGridHojyoMATagOff    .Visible	:= FALSE;
		CmnPopupMenuGridHojyoMATagComment.Visible	:= FALSE;

		for	nCount := 1 to 4 do
			TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Visible	:= TRUE;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuGridHojyoMATagOnClick (Sender: TObject);
var
	nTagKind: Integer;

begin
	if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagOff.Name) then
		nTagKind	:= 0
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem01.Name) then
		nTagKind	:= 1
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem02.Name) then
		nTagKind	:= 3
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem03.Name) then
		nTagKind	:= 2
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem04.Name) then
		nTagKind	:= 4
	else
		nTagKind	:= 0;

	fnSetTagInfoGridHojyoMA (nTagKind);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuGridHojyoMATagOnClickEx (Sender: TObject);
var
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

begin
	nTagKindWork	:= 0;
	fIgnore			:= FALSE;

	if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagComment.Name) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	(not TMenuItem (MJSFindCtrl (Self, Format (_PMItemGSTag, [nCount]))).Visible) then
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
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem01Ex.Name) then
		nTagKindWork	:= 1
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem02Ex.Name) then
		nTagKindWork	:= 3
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem03Ex.Name) then
		nTagKindWork	:= 2
	else if	((Sender as TMenuItem).Name = CmnPopupMenuGridHojyoMATagItem04Ex.Name) then
		nTagKindWork	:= 4
	else
		Exit;

	if	(not fIgnore) then
		fnSetTagInfoGridHojyoMA (nTagKindWork);

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (Self,Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnDataSourceHojyoMAOnStateChange (Sender: TObject);
begin
	if	(CmnMemDataHojyoMA.State in [dsInsert]) then
    begin
//↓<090>
        CmnGridHojyoMAColumnBtnBKCode.EditButtonStyle := ebsEllipsis;
        CmnGridHojyoMAColumnBtnBKCode.ClickKey        := TextToShortCut('F4');
        CmnGridHojyoMAColumnBtnBRCode.EditButtonStyle := ebsEllipsis;
        CmnGridHojyoMAColumnBtnBRCode.ClickKey        := TextToShortCut('F4');
//↑<090>
		CmnGridHojyoMA.Columns [3].ReadOnly	:= FALSE;
		CmnGridHojyoMA.Columns [4].ReadOnly	:= FALSE;
    end
	else
    begin
//↓<090>
        CmnGridHojyoMAColumnBtnBKCode.EditButtonStyle := ebsSimple;
        CmnGridHojyoMAColumnBtnBKCode.ClickKey        := TextToShortCut('');
        CmnGridHojyoMAColumnBtnBRCode.EditButtonStyle := ebsSimple;
        CmnGridHojyoMAColumnBtnBRCode.ClickKey        := TextToShortCut('');
//↑<090>
		CmnGridHojyoMA.Columns [3].ReadOnly	:= TRUE;
		CmnGridHojyoMA.Columns [4].ReadOnly	:= TRUE;
    end;

	if	(CmnMemDataHojyoMA.Active and (CmnDataSourceHojyoMA.DataSet <> nil)) then
	begin
		if	(CmnGridHojyoMA.DataSource.DataSet.RecordCount = 0) then
        begin
//↓<090>
	        CmnGridHojyoMAColumnBtnBKCode.EditButtonStyle := ebsEllipsis;
	        CmnGridHojyoMAColumnBtnBKCode.ClickKey        := TextToShortCut('F4');
	        CmnGridHojyoMAColumnBtnBRCode.EditButtonStyle := ebsEllipsis;
	        CmnGridHojyoMAColumnBtnBRCode.ClickKey        := TextToShortCut('F4');
//↑<090>
			CmnGridHojyoMA.Columns [3].ReadOnly	:= FALSE;
			CmnGridHojyoMA.Columns [4].ReadOnly	:= FALSE;
        end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnDataSourceAccInfoOnStateChange (Sender: TObject);
begin
	if	(CmnMemDataAccInfo.State in [dsInsert]) then
	begin
		CmnGridAccInfo.Columns [1].ReadOnly	:= FALSE;
	end
	else
	begin
		CmnGridAccInfo.Columns [1].ReadOnly	:= TRUE;
	end;

	if	(CmnMemDataAccInfo.Active and (CmnDataSourceAccInfo.DataSet <> nil)) then
	begin
		if	(CmnGridAccInfo.DataSource.DataSet.RecordCount = 0) then
			CmnGridAccInfo.Columns [1].ReadOnly	:= FALSE;

	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnMemDataHojyoMABeforePost (DataSet: TDataSet);
var
	cFieldWork	: TField;
	pBankInfoData: ^BankInfoData;
	nBkCode,nBrCode	: Integer;

begin
	if	(m_fUnderConstruction) then
		Exit;

	with (DataSet) do
	begin
        if State = dsInsert	 then
        begin
            cFieldWork	:= FieldByName ('nBkCode');

            // 銀行未入力ﾁｪｯｸ <016>
            if FieldByName ('nBkCode').AsString = '' then
            begin
                cFieldWork.FocusControl ();
                Abort ();
            end;

            if	(not fnCheckValidRecordHojyoMA (FieldByName ('nBkCode').asInteger,FieldByName ('nBrCode').asInteger)) then
            begin
                cFieldWork.FocusControl ();
                Abort ();
            end;
            cFieldWork	:= FieldByName ('nBrCode');

            // 支店未入力ﾁｪｯｸ <016>
            if FieldByName ('nBrCode').AsString = '' then
            begin
                cFieldWork.FocusControl ();
                Abort ();
            end;

            if	(not fnCheckValidRecordHojyoMA (FieldByName ('nBkCode').asInteger,FieldByName ('nBrCode').asInteger)) then
            begin
                cFieldWork.FocusControl ();
                Abort ();
            end;
        end;

		New (pBankInfoData);

		nBkCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;
		nBrCode	:= CmnMemDataHojyoMA.FieldByName ('nBRCode').AsInteger;

		pBankInfoData^.nNCODE 			:= CmnMemDataHojyoMA.FieldByName ('nCODE').AsFloat;
		pBankInfoData^.nBkCode	    	:= nBkCode;
		pBankInfoData^.nBrCode	    	:= nBrCode;
		pBankInfoData^.strBkName		:= CmnMemDataHojyoMA.FieldByName ('strBKName').AsString;
		pBankInfoData^.strBkKANA		:= CmnMemDataHojyoMA.FieldByName ('strBKKana').AsString;
		pBankInfoData^.strBrName		:= CmnMemDataHojyoMA.FieldByName ('strBRName').AsString;
		pBankInfoData^.strBrKANA		:= CmnMemDataHojyoMA.FieldByName ('strBRKana').AsString;
		pBankInfoData^.strRenso 		:= CmnMemDataHojyoMA.FieldByName ('strRenso').AsString;
		pBankInfoData^.nHolCode     	:= CmnMemDataHojyoMA.FieldByName ('OffDNCode').AsFloat;
		pBankInfoData^.fDetails			:= FALSE;

        SessionPractice(C_ST_PROCESS); 			// <061> ADD

		if	(not fnUpdateRecordBank (pBankInfoData)) then
		begin
			Dispose (pBankInfoData);

			CmnMemDataHojyoMA.Cancel ();
			CmnGridHojyoMA   .FocusedColumn	:= 1;

            SessionPractice(C_ED_PROCESS); 		// <061> ADD

			Abort ();
		end;

        SessionPractice(C_ED_PROCESS); 			// <061> ADD

        CmnMemDataHojyoMA.Edit;
        CmnMemDataHojyoMA.FieldByName ('nCODE').AsFloat := pBankInfoData^.nNCODE;
        CmnMemDataHojyoMA.FieldByName ('OrderCODE').AsFloat := nBkCode * 1000 + nBrCode * 100;

	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnMemDataAccInfoBeforePost (DataSet: TDataSet);
var
	pAccInfoData  : ^AccInfoData;
	nWorkNo	      : Extended;
	strWorkNo	  : String;

begin
	if	(m_fUnderConstruction) then
		Exit;

	with (DataSet) do
	begin
		if	(FieldByName ('nAccountCode').AsInteger = 0) then
		begin
			Beep ();

			TField (FieldByName ('nAccountCode')).FocusControl ();
			Abort ();
		end;

		if	(State in [dsInsert]) then
		begin
            //存在チェック
			if	(not fnCheckValidRecordAccInfo (CmnMemDataHojyoMA.FieldByName ('nCODE').AsFloat,FieldByName ('nAccountCode').AsInteger)) then
			begin
				Beep ();
				TField (FieldByName ('nAccountCode')).FocusControl ();
				Abort ();
			end;

///			nWorkNo	:= CmnMemDataHojyoMA.FieldByName ('nCODE').AsFloat;

		end;

		if	(not fnCheckValidDepDivision (FieldByName ('nDepDivision').AsInteger)) then
		begin
			Beep ();

			TField (FieldByName ('nDepDivision')).FocusControl ();
			Abort  ();
		end;

		if	(not fnCheckValidKanaDesc (FieldByName ('strClientNameKana').AsString)) then
		begin
			Beep ();

			MJSMessageBoxEX (Self,'使用できない文字が含まれています。','エラー', mjError, mjOK, mjDefOK);

			TField (FieldByName ('strClientNameKana')).FocusControl ();
			Abort  ();
		end;

		New (pAccInfoData);

		nWorkNo	:= CmnMemDataHojyoMA.FieldByName ('nCODE').AsFloat;
		pAccInfoData^.nNBkCode	    	:= nWorkNo;
		pAccInfoData^.nAccountCode		:= CmnMemDataAccinfo.FieldByName ('nAccountCode'     ).AsInteger;
		pAccInfoData^.nDepDivision		:= CmnMemDataAccInfo.FieldByName ('nDepDivision'     ).AsInteger;
		pAccInfoData^.strClientNameKana	:= CmnMemDataAccInfo.FieldByName ('strClientNameKana').AsString;

		StrWorkNo	:= CmnMemDataAccInfo.FieldByName ('strAccountNo').AsString;

//<067>		if	((Trim (strWorkNo) = '') or (StrToInt64 (Trim (strWorkNo)) = 0)) then
		if	(Trim (strWorkNo) = '')  then
			pAccInfoData^.strAccountNo	:= ''
		else
        begin
        	// <067> ↓
		   // pAccInfoData^.strAccountNo	:= Format ('%.8d', [StrToInt64 (Trim (strWorkNo))]);
                                            // <035>ﾌｫｰﾏｯﾄ後を詰め直す

            if Length(Trim (strWorkNo)) > 7 then
            	pAccInfoData^.strAccountNo	:= Trim (strWorkNo)
            else
            	pAccInfoData^.strAccountNo	:= Format ('%.7d', [StrToInt64 (Trim (strWorkNo))]);
            // <067> ↑
            CmnMemDataAccInfo.FieldByName ('strAccountNo').AsString := pAccInfoData^.strAccountNo;
        end;

		strWorkNo	:= CmnMemDataAccInfo.FieldByName ('strClientCode').AsString;

// <105> ADD-STR
        if (StrWorkNo = StringOfChar('0', 10)) then
            // 依頼人コード「0000000000」は認める(ジャパンネット銀行対応)
			pAccInfoData^.strClientCode	:= StrWorkNo
        else
// <105> ADD-END
		if	((Trim (strWorkNo) = '') or (StrToInt64 (Trim (strWorkNo)) = 0)) then
			pAccInfoData^.strClientCode	:= ''
		else
        begin
			pAccInfoData^.strClientCode	:= Format ('%.10d', [StrToInt64 (Trim (strWorkNo))]);
                                            // <035>ﾌｫｰﾏｯﾄ後を詰め直す
            CmnMemDataAccInfo.FieldByName ('strClientCode').AsString := pAccInfoData^.strClientCode;
        end;

		pAccInfoData^.fDetails	:= FALSE;

        SessionPractice(C_ST_PROCESS);  		// <061> ADD

		if	(not fnUpdateRecordAccount (pAccInfoData)) then
		begin
			Dispose (pAccInfoData);

			CmnMemDataAccInfo.Cancel ();
			CmnGridAccInfo   .FocusedColumn	:= 1;

            SessionPractice(C_ED_PROCESS); 		// <061> ADD

			Abort ();
		end;

        SessionPractice(C_ED_PROCESS); 			// <061> ADD

        CmnMemDataAccInfo.FieldByName ('nNCode').AsFloat := nWorkNo;  // BankNCode? <021>
		Dispose (pAccInfoData);
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode;
							Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cField       : TField;

begin

	if	(Column = 1) then																// 銀行ｺｰﾄﾞ
    begin
{		if	(CmnMemDataHojyoMA.State in [dsInsert]) then
        begin
            if	(not CmnGridHojyoMA.Columns [1].ReadOnly) then
            begin
           		cField	:= CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode');
                if	(not fnCheckValidRecordHojyoMA (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').asInteger,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').asInteger)) then
                begin
                    Beep ();
                    cField.FocusControl ();
                    Abort ();
                end;
        		cField	:= CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode');
                if	(not fnCheckValidRecordHojyoMA (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').asInteger,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').asInteger)) then
                begin
                    Beep ();
                    cField.FocusControl ();
                    Abort ();
                end;
            end;
        end;
}

		if	(CmnMemDataHojyoMA.State in [dsInsert,dsEdit]) then
        begin
            // 銀行入力ﾁｪｯｸ
            if CmnMemDataHojyoMA.FieldByName ('nBKCODE').AsString = '' then             // <016>
            begin                                                                       // <016>
                Beep ();                                                                // <016>
                CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').FocusControl();    // <016>
                Abort;                                                                  // <016>
            end;                                                                        // <016>

//<016>            if CmnMemDataHojyoMA.FieldByName ('nBKCODE').AsInteger = 0 then
//<016>                CmnMemDataHojyoMA.FieldByName ('nBKCODE').AsInteger := 0;
        end;

		if	(CmnMemDataHojyoMA.State in [dsInsert]) then
        begin
            //全銀協データをセット
            fnZenGinDataSet(2,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').asInteger,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').asInteger);
        end;

	end;
	if	(Column = 2) then 	// 支店ｺｰﾄﾞ
    begin
		if	(CmnMemDataHojyoMA.State in [dsInsert,dsEdit]) then
        begin

            // 支店入力ﾁｪｯｸ <016>
            if CmnMemDataHojyoMA.FieldByName ('nBrCode').AsString = '' then
            begin
                if (not m_BraChk) then
                begin
                    m_BraChk := False;
                    Beep ();
                    CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').FocusControl();
                    Abort;
                end;
            end;

            m_BraChk := False;

//<016>            if CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger = 0 then
//<016>                CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger := 0;
        end;

		if	(CmnMemDataHojyoMA.State in [dsInsert]) then
        begin
            cField	:= CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode');

            if	(not fnCheckValidRecordHojyoMA (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').asInteger,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').asInteger)) then
            begin
                Beep ();
                cField.FocusControl ();
                Abort ();
            end;
            //全銀協データをセット
            fnZenGinDataSet(2,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').asInteger,CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').asInteger);
        end;
    end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
//var
//	stMessageRec: TMJSMsgRec;

begin
	if	(Column = 8) then
    begin
        //ファンクションの設定
//<006>        fnSetFncType(1);
//<006>        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
        fnSetFncType(True,0);
    end
	else
    begin
        //ファンクションの設定
//<006>        fnSetFncType(0);
//<006>        MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
        fnSetFncType(False,0);
    end;

//↓<CDCHG>
    if (Column = 1) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BANK;
    end
    else if (Column = 2) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BRANCH;
    end
    else
    begin
    	B_CodeChange.Visible := False;
    end;
//↑<CDCHG>
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnChangeNodeEx (Sender: TObject);
var
	fValueCheck	: Boolean;
begin
    if uvCloseFlg  then Exit;

// <057> MOD start
    // <047> 参照ﾓｰﾄﾞ時にﾚｺｰﾄﾞがない場合、FocusedNode[1].Valueでｱﾄﾞﾚｽ違反が発生する対応。
//    if (m_nReferMode = REFER) then Exit;
	// 参照時かつﾚｺｰﾄﾞがなしの場合はExit
	if (m_nReferMode = REFER) and (CmnMemDataHojyoMA.RecordCount = 0) then
    begin
    	Exit;
    end;
// <057> MOD end

	fValueCheck	:= TRUE;

	if	 (CmnGridHojyoMA.FocusedNode.Values [1] <> 0) then
	begin
        // 新規ﾃﾞｰﾀ作成時   <016>
		if	(CmnMemDataHojyoMA.State in [dsInsert]) then
    		fValueCheck := FALSE;

        // 入力ﾃﾞｰﾀﾁｪｯｸ     <016>
        if (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode').AsString = '')
            or (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBrCode').AsString ='') then

    		fValueCheck := FALSE;

	end;

	if	(not fValueCheck) then
	begin
        m_BraChk    := True;
		CmnGridHojyoMA.FocusedColumn	:= 1;
		B_Delete.Enabled	:= FALSE;

        fnRebuildGridAccInfo (0);   //<015>

        B_CodeChange.Visible := False;	//<CDCHG>
	end
	else
	begin
		B_Syousai.Enabled	:= True;

// <054> MOD start
//        B_Delete.Enabled	:= m_cJNTArea.IsDelete;
        if m_nReferMode = REFER then    	// 参照時は削除ボタンを無効にする
        begin
// <055> MOD start
//			B_Delete.Enabled := False;
        	if m_bDelete then              	// 決算確定でなく、グループ管理なしの場合
            begin                           // 削除権限ありの場合は削除ボタンを有効にする
             	B_Delete.Enabled := m_cJNTArea.IsDelete;
            end
            else
            begin
				B_Delete.Enabled := False;
            end;
// <055> MOD end
        end
        else
        begin
			B_Delete.Enabled	:= m_cJNTArea.IsDelete;
        end;
// <054> MOD end

//↓<CDCHG>
		if CmnGridHojyoMA.FocusedColumn = 1 then
        begin
            B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
            B_CodeChange.Caption := BCHG_CAP_BANK;
        end
        else if CmnGridHojyoMA.FocusedColumn = 2 then
        begin
            B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
            B_CodeChange.Caption := BCHG_CAP_BRANCH;
        end
        else
        begin
        	B_CodeChange.Visible := False;
        end;
//↑<CDCHG>

		fnRebuildGridAccInfo (CmnMemDataHojyoMAnCODE.AsFloat);
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
	fnCmnFunctionOnEnter (Sender);

	fValueCheck	:= TRUE;

    // <047> 参照ﾓｰﾄﾞ時にﾚｺｰﾄﾞがない場合、FocusedNode[1].Valueでｱﾄﾞﾚｽ違反が発生する対応。
//    if (m_nReferMode = REFER) then Exit;
	if (m_nReferMode = REFER) and (CmnMemDataHojyoMA.RecordCount = 0) then
    begin
    	B_Syousai.Enabled	:= FALSE;
    	B_Delete.Enabled	:= FALSE;
    	Exit;
    end;

	if	CmnGridHojyoMA.FocusedNode.Values [1] <> 0 then
	begin
		if	((CmnMemDataHojyoMA.State in [dsInsert]) and (CmnGridHojyoMA.FocusedNode.values [1] = 0)) then
			fValueCheck	:= FALSE;
    end;

	if	(CmnGridHojyoMA.FocusedNode.values [1] = 0) or (not fValueCheck) then
	begin
		B_Syousai.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
	end;

    //↓<CDCHG>
    if (CmnGridHojyoMA.FocusedColumn = 1) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BANK;
    end
    else if (CmnGridHojyoMA.FocusedColumn = 2) then
    begin
		B_CodeChange.Visible := not (m_nReferMode = REFER) and m_cJNTArea.IsDelete;
        B_CodeChange.Caption := BCHG_CAP_BRANCH;
    end
    else
    begin
    	B_CodeChange.Visible := False;
    end;
//↑<CDCHG>

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnKeyPress (Sender: TObject; var Key: Char);

begin
    // 銀行ｶﾅ or 支店ｶﾅ
	if	(CmnGridHojyoMA.FocusedColumn = 5) or (CmnGridHojyoMA.FocusedColumn = 7) then
	begin
		case (Key) of
			Char (VK_BACK),
			Char (VK_ESCAPE),
			Char (VK_RETURN),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')' :
				begin
				end;
			'ｧ':		Key	:= 'ｱ';
			'ｨ':		Key	:= 'ｲ';
			'ｩ':		Key	:= 'ｳ';
			'ｪ':		Key	:= 'ｴ';
			'ｫ':		Key	:= 'ｵ';
			'ｬ':		Key	:= 'ﾔ';
			'ｭ':		Key	:= 'ﾕ';
			'ｮ':		Key	:= 'ﾖ';
			'ｯ':		Key	:= 'ﾂ';
			'{':		Key	:= '(';
			'[':		Key	:= '(';
			'}':		Key	:= ')';
			']':		Key	:= ')';
			'ｰ':		Key	:= '-';
			'a'..'z':	Key	:= Chr (Ord (Key) - 32);
			else		Abort ();
		end;
	end;

//	if	(CmnGridHojyoMA.FocusedColumn <> 1)  then
//      Exit;

	if	(CmnGridHojyoMA.FocusedColumn = 1) or (CmnGridHojyoMA.FocusedColumn = 2) then
    begin
    	//* #8=BackSpace, #27=Esc, #9=Tab */
	    if	(((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9)) then
    	begin
	       	Beep  ();
    		Abort ();
	    end;
    end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

    // <047> 参照ﾓｰﾄﾞ時にﾚｺｰﾄﾞがない場合、TField･･･でｱﾄﾞﾚｽ違反が発生する対応。
    if (m_nReferMode = REFER) then Exit;

	if	(CmnGridHojyoMA.FocusedColumn = 0) then											// ﾌｫｰｶｽ位置: 0=付箋
	begin
		TField (CmnDataSourceHojyoMA.DataSet.FieldByName ('nBkCode')).FocusControl ();

		Abort ();
		Exit;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridHojyoMAOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nBankCodeSelect  : Extended;
	strBankCodeSelect: String;

begin
	inherited;

///	nBankCodeSelect		:= 0;
	strBankCodeSelect	:= '';

	if	((Y <= CmnGridHojyoMA.HeaderPanelHeight) or
		 (X <= CmnGridHojyoMA.GrIndicatorWidth ) or
		 (X >= (CmnGridHojyoMA.GrIndicatorWidth + CmnGridHojyoMAColumnTag.Width))) then
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		CmnGridHojyoMA.Hint		:= '';
		CmnGridHojyoMA.ShowHint	:= FALSE;

		Exit;
	end;

	if	((CmnGridHojyoMA.GetNodeAt (X, Y) <> nil) and
		 (not VarIsNull (TdxTreeListNode (CmnGridHojyoMA.GetNodeAt (X, Y)).Values [1]))) then
	begin
		nBankCodeSelect		:= TdxTreeListNode (CmnGridHojyoMA.GetNodeAt (X, Y)).Values [1];

		if	(((nBankCodeSelect <> m_nHintPosition)) or
			 ((CompareStr (strBankCodeSelect, m_strHintPosition) <> 0))) then
		begin
			m_nHintPosition		:= nBankCodeSelect;
			m_strHintPosition	:= strBankCodeSelect;

			CmnGridHojyoMA.Hint		:= '';
			CmnGridHojyoMA.ShowHint	:= FALSE;

			Exit;
		end;

		if	(CmnGridHojyoMA.ShowHint and
			(((nBankCodeSelect = m_nHintPosition)) or
			 ((CompareStr (strBankCodeSelect, m_strHintPosition) = 0)))) then
			Exit;

		if	(VarIsNull (TdxTreeListNode (CmnGridHojyoMA.GetNodeAt (X, Y)).Values [5])) then
			Exit;

		if	(TdxTreeListNode (CmnGridHojyoMA.GetNodeAt (X, Y)).Values [5] <> '') then
		begin
			CmnGridHojyoMA.Hint		:= TdxTreeListNode (CmnGridHojyoMA.GetNodeAt (X, Y)).Values [5];
			CmnGridHojyoMA.ShowHint	:= TRUE;
		end;
	end
	else
	begin
		m_nHintPosition		:= 0;
		m_strHintPosition	:= '';

		CmnGridHojyoMA.Hint		:= '';
		CmnGridHojyoMA.ShowHint	:= FALSE;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode;
							Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cField: TField;

begin
	if	(Column = 1) then																// 口座ｺｰﾄﾞ
    begin
		cField	:= CmnDataSourceAccInfo.DataSet.FieldByName ('nAccountCode');

		if	(cField.AsInteger = 0) then
		begin
			Beep ();

			cField.FocusControl ();
			Abort ();
		end;

		if	(not CmnGridAccInfo.Columns [1].ReadOnly) then
		begin
            //存在チェック
			if	(not fnCheckValidRecordAccInfo (CmnDataSourceAccInfo.DataSet.FieldByName ('nNCode').AsFloat,cField.AsInteger)) then
			begin
				Beep ();

				cField.FocusControl ();
				Abort ();
			end;

			CmnMemDataAccInfo.FieldByName ('nDepDivision'    ).AsInteger	:= 1;
			CmnMemDataAccInfo.FieldByName ('nDepDivisionData').AsInteger	:= 1;
		end;
	end
	else if	(Column = 2) then															// 預金種別
    begin
		if	(CmnDataSourceAccInfo.DataSet.FieldByName ('nAccountCode').AsInteger > 0) then
		begin
			cField	:= CmnDataSourceAccInfo.DataSet.FieldByName ('nDepDivision');

			if	(not fnCheckValidDepDivision (cField.AsInteger)) then
			begin
				Beep ();

				cField.FocusControl ();
				Abort ();
			end;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(CmnGridAccInfo.FocusedColumn = 1) then
	begin
		if	((Key = '-') or (Key = '+')) then
		begin
			Beep  ();
			Abort ();
		end;
	end
	else if	((CmnGridAccInfo.FocusedColumn = 4) or (CmnGridAccInfo.FocusedColumn = 5)) then
	begin
		//* #8=BackSpace, #27=Esc, #9=Tab */
		if	(((Key < '0') or (Key > '9')) and (Key <> #8) and (Key <> #27) and (Key <> #9)) then
		begin
			Beep  ();
			Abort ();
		end;
	end
	else if	(CmnGridAccInfo.FocusedColumn = 6) then										// 振込依頼人名称(ｶﾅ)
	begin
		case (Key) of
			Char (VK_BACK),
			Char (VK_ESCAPE),
			Char (VK_RETURN),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')' :
				begin
				end;
			'ｧ':		Key	:= 'ｱ';
			'ｨ':		Key	:= 'ｲ';
			'ｩ':		Key	:= 'ｳ';
			'ｪ':		Key	:= 'ｴ';
			'ｫ':		Key	:= 'ｵ';
			'ｬ':		Key	:= 'ﾔ';
			'ｭ':		Key	:= 'ﾕ';
			'ｮ':		Key	:= 'ﾖ';
			'ｯ':		Key	:= 'ﾂ';
			'{':		Key	:= '(';
			'[':		Key	:= '(';
			'}':		Key	:= ')';
			']':		Key	:= ')';
			'ｰ':		Key	:= '-';
			'a'..'z':	Key	:= Chr (Ord (Key) - 32);
			else		Abort ();
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoOnMouseDown (Sender: TObject;
													 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	if	(CmnGridAccInfo.FocusedColumn = 3) then											// ﾌｫｰｶｽ位置: 3=預金種別名称
	begin
		TField (CmnDataSourceAccInfo.DataSet.FieldByName ('nDepDivision')).FocusControl ();
		Abort  ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoColumnAccountNoOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
begin
	if	(Trim (AText) <> '') then
		AText	:= fnGetEditedAccountNumber (Trim (AText));
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoColumnClientCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
begin
	if	(Trim (AText) <> '') then
		AText	:= fnGetEditedClientCode (Trim (AText));
end;





//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccountColumnBankCodeOnEditButtonClick (Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;
//	nBkCode	: Integer;
//	strFormat	: String;

begin
{	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'ALLBKCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'BraKanaName';											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'BkBraName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'BANKINFO';											// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCurCodeDigit;										// ｺｰﾄﾞ桁数
	cMasWndParam.m_SQL_Where	:= 'MasterKbn = ' + IntToStr (MASTER_BANK) + '  AND RdelKbn = 0';

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		CmnMemDataAccInfo.Edit ();

//		nBkCode	:= cMasWndParam.m_ExpRetCode;

		CmnMemDataAccInfo.FieldByName ('nCode'      ).AsInteger	:= nBkCode;
		CmnMemDataAccInfo.FieldByName ('strBankNameSimple').AsString	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTabInformationsOnChange (Sender: TObject);
var
	cTabOrderList: TList;
	nIndex		 : Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;


	fnChangeConditionPageButtons (CmnTabInformations.Visible);


	if	(m_fThroughTab and (Screen.ActiveControl.Name = CmnTabInformations.Name)) then
	begin
		m_fThroughTab	:= FALSE;
		Exit;
	end;

	if	(m_fUnderConstruction) then
		Exit;

	if	(m_nReferMode = REFER) then														// ﾒｰﾙ会計参照区分: 参照のみ
		Exit;

	nIndex	:= CmnTabInformations.Items.Selected;

	cTabOrderList	:= TList.Create ();

	TMPanel (CmnTabInformations.Items [nIndex].SyncControl).GetTabOrderList (cTabOrderList);

	m_cACControl	:= cTabOrderList.First ();

	while (TRUE) do
	begin
		if	((m_cACControl is TMNumEdit) or (m_cACControl is TMTxtEdit)) then
			Break;

		cTabOrderList.Clear ();

		m_cACControl.GetTabOrderList (cTabOrderList);
		m_cACControl	:= cTabOrderList.First ();
	end;

    if m_cACControl.CanFocus then   // <078> ADD
	    m_cACControl.SetFocus ();

	cTabOrderList.Free ();   
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnTabInformationsOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	(m_nReferMode = REFER) then														// ﾒｰﾙ会計参照区分: 参照のみ
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
	begin
		if	(CmnTabInformations.Items [1].Selected) then							// ﾚｲｱｳﾄ情報
			m_cACControl	:= CmnEdit02001LayoutPathDraft
		else if	(CmnTabInformations.Items [2].Selected) then							// 口座管理情報
			m_cACControl	:= CmnEdit03001AccountCode
		else
			Exit;

		m_cACControl.SetFocus ();
	end;

	if	(((Key = VK_LEFT) and (Shift = [])) or ((Key = VK_RIGHT) and (Shift = []))) then
		m_fThroughTab	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditFeeListColumn02OnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	nPrevFee: Extended;
	nClass	: Integer;
	nRow	: Integer;

begin
	if	((Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not ((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN))) then				// Altｷｰが押された時以外
		begin
			nClass	:= StrToInt (Copy (TMNumEdit (Sender).Name, 16, 2));
			nRow	:= StrToInt (Copy (TMNumEdit (Sender).Name, 18, 2));

			nPrevFee	:= TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, 1]))).Value;

			if	(TMNumEdit (Sender).AsInteger <= nPrevFee) then
			begin
				Beep ();

				m_cACControl	:= TMNumEdit (Sender);
				m_cACControl.SetFocus ();

				TMNumEdit (Sender).SelectAll ();

				Exit;
			end;

			TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow + 1, 1]))).Value	:= TMNumEdit (Sender).Value;
		end;
	end;

	fnCmnFunctionOnKeyDown (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditAllBankCodeOnArrowClick (Sender: TObject);
var
	dqCommonData  : TMQuery;
	nAllBankCode  : Integer;
	nBranchCode	  : Integer;
	nReturn		  : Integer;
	strAllBankName: String;
	strBranchName : String;
    strName		  : String;
//↓<DIC_BANK>
	strBankKanaName	: string;
	strBraKanaName	: string;
//↑<DIC_BANK>

begin
	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK>	fnCMNBankInit (m_pRec);
//<DIC_BANK_2>	fnCMNBankInit (m_pRec,P_BANKDIC_BANKTENPOFIND); //<DIC_BANK>
	fnCMNBankInit (m_Base_pRec,P_BANKDIC_BANKTENPOFIND); //<DIC_BANK><DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。
//	fnCMNBankInit (m_Base_pRec);

	nAllBankCode	:= Trunc (TMNumEdit (Sender).Value);

//<DIC_BANK>	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName);
	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName, strBankKanaName, strBraKanaName); //<DIC_BANK>

	fnCMNBankFree ();
	m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す

	if	(nReturn = 1) then
	begin
		CmnEdit00001BkCode.Value	:= nAllBankCode;
		CmnEdit00002BrCode .Value	:= nBranchCode;
{↓<DIC_BANK>CMN_BANKにないデータも選択できるようになるため、fnCheckEditNumValueAllBankCode()よりあとに移動。fnCheckEditNumValueAllBankCode()でCMN_BANKに無いと、名称を消してしまうため。
		CmnEdit00003BkName.Text	    := MJSKabuCut (strAllBankName, 30);
		CmnEdit00005BrName .Text	:= MJSKabuCut (strBranchName , 30);
↑<DIC_BANK>}
		// <028> >>
		fnCheckEditNumValueAllBankCode ();
		fnSetChangeFlagCheckItems (TObject(CmnEdit00001BkCode), FALSE);
		fnSetChangeFlagCheckItems (TObject(CmnEdit00002BrCode), FALSE);
//↓<DIC_BANK>
		CmnEdit00003BkName.Text	    := MJSKabuCut (strAllBankName, 30);
		CmnEdit00005BrName .Text	:= MJSKabuCut (strBranchName , 30);
//↑<DIC_BANK>

        strName := CmnEdit00003BkName.Text + '/' + CmnEdit00005BrName .Text;

        if  (strName <> '') then
        begin
		if	(MjsHanLength(strName) <= 14) then
			CmnEdit00007NMK.Text	:= MjsHanCopy (strName, 1, 14)
		else
			CmnEdit00007NMK.Text	:= MJSKabuCut (strName, 14);
        end;
		// <028> <<
//↓<DIC_BANK>
		CmnEdit00004BkKana.Text	:= fnExchangeCharacterKanaDesc (strBankKanaName);
        CmnEdit00006BrKana.Text	:= fnExchangeCharacterKanaDesc (strBraKanaName);
		CmnEdit00003BkName.SetFocus;
//↑<DIC_BANK>
	end
	else
	begin
		TWinControl (Sender).SetFocus ();
		Exit;
	end;
{↓<DIC_BANK>
	dqCommonData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBCommon, dqCommonData);							// DBとMQueryの接続

	with (dqCommonData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK WHERE BankCD = ' + IntToStr (nAllBankCode));

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqCommonData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqCommonData);

			dqCommonData.Close ();
			dqCommonData.Free  ();

			Exit;
		end;

		if	(not EOF) then
			CmnEdit00004BkKana.Text	:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankName').AsString)
		else
			CmnEdit00004BkKana.Text	:= '';

		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK_OFFICE WHERE BankCD = :nAllBankCode AND BankOfficeCD = :nBranchCode');

		ParamByName ('nAllBankCode').AsInteger	:= nAllBankCode;
		ParamByName ('nBranchCode' ).AsInteger	:= nBranchCode;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqCommonData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqCommonData);

			dqCommonData.Close ();
			dqCommonData.Free  ();

			Exit;
		end;

		if	(not EOF) then
			CmnEdit00006BrKana.Text	:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankOffice').AsString)
		else
			CmnEdit00006BrKana.Text	:= '';
	end;
	TWinControl (Sender).SetFocus ();
↑<DIC_BANK>}
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditNameKanaOnKeyPress (Sender: TObject; var Key: Char);
begin
	case (Key) of
		Char (VK_BACK),
		Char (VK_ESCAPE),
		Char (VK_RETURN),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')' :
			begin
			end;
		'ｧ':		Key	:= 'ｱ';
		'ｨ':		Key	:= 'ｲ';
		'ｩ':		Key	:= 'ｳ';
		'ｪ':		Key	:= 'ｴ';
		'ｫ':		Key	:= 'ｵ';
		'ｬ':		Key	:= 'ﾔ';
		'ｭ':		Key	:= 'ﾕ';
		'ｮ':		Key	:= 'ﾖ';
		'ｯ':		Key	:= 'ﾂ';
		'{':		Key	:= '(';
		'[':		Key	:= '(';
		'}':		Key	:= ')';
		']':		Key	:= ')';
		'ｰ':		Key	:= '-';
		'a'..'z':	Key	:= Chr (Ord (Key) - 32);
		else		Abort ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditAllBankNameOnEnter (Sender: TObject);
begin
	CmnFuriganaName.Control	:= TWinControl (Sender);

	m_cACControl	:= TWinControl (Sender);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditFileNameOnArrowClick (Sender: TObject);
var
	strFilter: String;

begin
// <096> MOD↓
//	if	(TMTxtEdit (Sender).Name = CmnEdit03012FileName.Name) then					// 経費精算用ﾌｧｲﾙ名称
	if	((TMTxtEdit (Sender).Name = CmnEdit03012FileName.Name) or					// 経費精算用ﾌｧｲﾙ名称
    	 (TMTxtEdit (Sender).Name = CmnEdit02014SoukinFileName.Name)) then			// 外国送金用ﾌｧｲﾙ名称
// <096> MOD↑
		strFilter	:= 'ﾌｧｲﾙ名称 (*.*)|*.*'
	else if	(TMTxtEdit (Sender).Name = CmnEdit02001LayoutPathDraft.Name) then			// 手形ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '手形ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
	else if	(TMTxtEdit (Sender).Name = CmnEdit02003LayoutPathCheck.Name) then			// 小切手ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '小切手ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
// ↓↓↓<041>
    else if	(TMTxtEdit (Sender).Name = CmnEdit02005LayoutPathCheck.Name) then			// 小切手ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '割引依頼書ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
    else if	(TMTxtEdit (Sender).Name = CmnEdit02006LayoutPathCheck.Name) then			// 小切手ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '取立依頼表ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
    else if	(TMTxtEdit (Sender).Name = CmnEdit02007LayoutPathCheck.Name) then			// 小切手ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '担保依頼差入証ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
// ↑↑↑<041>
// <075>↓↓
    else if	(TMTxtEdit (Sender).Name = CmnEdit02009LayoutPathCheck.Name) then			// 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ
		strFilter	:= '組戻依頼書ﾚｲｱｳﾄﾊﾟｽ (*.crf)|*.CRF'
// <075>↑↑
	else
		Exit;

	if	(TMTxtEdit (Sender).Text <> '') then
		CmnOpenDialogFileName.FileName	:= TMTxtEdit (Sender).Text;

	CmnOpenDialogFileName.Filter	:= strFilter;
	CmnOpenDialogFileName.Options	:= [ofNochangeDir];     // <095> ADD

	if	(CmnOpenDialogFileName.Execute ()) then
		TMTxtEdit (Sender).Text	:= CmnOpenDialogFileName.FileName;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditAccountCodeOnChange (Sender: TObject);
begin
	m_fChangeAccountCode	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditAccountCodeOnEnter (Sender: TObject);
begin
//	m_fChangeAccountCode	:= FALSE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditAccountNoOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not ((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN))) then				// Altｷｰが押された時以外
			(Sender as TMTxtEdit).Text	:= fnGetEditedAccountNumber ((Sender as TMTxtEdit).Text);
	end;

	fnCmnFunctionOnKeyDown (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditClientCodeOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not ((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN))) then				// Altｷｰが押された時以外
			(Sender as TMTxtEdit).Text	:= fnGetEditedClientCode ((Sender as TMTxtEdit).Text);
	end;

	fnCmnFunctionOnKeyDown (Sender, Key, Shift);
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPanelButtonsOnResize (Sender: TObject);
begin
	CmnButtonPagePrevious.Left	:= TMPanel (Sender).Width - fnGetZoom((4 + (70 * 4) + (3 * 3) + 8));	//<#4>（関数｢fnGetZoom｣を追加）
	CmnButtonPageNext    .Left	:= TMPanel (Sender).Width - fnGetZoom((4 + (70 * 3) + (3 * 2) + 8));	//<#4>（関数｢fnGetZoom｣を追加）
	CmnButtonUpdate      .Left	:= TMPanel (Sender).Width - fnGetZoom((4 + (70 * 2) + (3 * 1)));		//<#4>（関数｢fnGetZoom｣を追加）
	CmnButtonCancel      .Left	:= TMPanel (Sender).Width - fnGetZoom((4 + (70 * 1) + (3 * 0)));		//<#4>（関数｢fnGetZoom｣を追加）
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonPageOnClick (Sender: TObject);
var
	cTabOrderList : TList;
	nIndexPrevious: Integer;
	nIndexNew	  : Integer;

begin
	nIndexPrevious	:= CmnTabInformations.Items.Selected;

	if	((Sender as TMBitBtn).Name = CmnButtonPagePrevious.Name) then
		nIndexNew	:= nIndexPrevious - 1
	else
		nIndexNew	:= nIndexPrevious + 1;

	CmnTabInformations.Items [nIndexPrevious].Selected	:= FALSE;
	CmnTabInformations.Items [nIndexNew     ].Selected	:= TRUE;

	if	(m_nReferMode = REFER) then														// ﾒｰﾙ会計参照区分: 参照のみ
	begin
		fnChangeConditionPageButtons (TRUE);
		Exit;
	end;

	cTabOrderList	:= TList.Create ();

	TMPanel (CmnTabInformations.Items [nIndexNew].SyncControl).GetTabOrderList (cTabOrderList);

	m_cACControl	:= cTabOrderList.First ();

	while (TRUE) do
	begin
		if	((m_cACControl is TMNumEdit) or (m_cACControl is TMTxtEDit)) then
			Break;

		cTabOrderList.Clear ();

		m_cACControl.GetTabOrderList (cTabOrderList);
		m_cACControl	:= cTabOrderList.First ();
	end;

    if CmnPanelInformation01.Enabled then
	    m_cACControl.SetFocus ();

	cTabOrderList.Free ();

	fnChangeConditionPageButtons (TRUE);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonUpdateOnClick (Sender: TObject);
var
	dqMasterData: TMQuery;          // <072> ADD
begin
	if	(not fnUpdateRecordDetail ()) then
		Exit;

// <072> ADD-STR
    if m_bFirstUpd then
    begin
        m_bFirstUpd := False;

        dqMasterData	:= TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

        with (dqMasterData) do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add('SELECT Max(ProgHigh) AS PrgHigh'
                +   '  FROM  PayActionInfo          '
                +   ' WHERE SystemCode = 1          '
                +   '   AND SyoriKbn   = 1          '
                +   '   AND Condition  = 0          ');

            if	(not Open ()) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

                dqMasterData.Close ();
                dqMasterData.Free  ();

                Exit;
            end;

            if (2 < FieldByName('PrgHigh').AsInteger) then
            begin
                // 上位進捗が分解以上の場合はメッセージ表示
                MjsMessageBoxEX(Self,
                                '現在、債務管理で支払処理中です。' + #13#10 +
                                '変更を現在の支払に反映させる為には、再分解を行う必要があります。',
                                '確認',
                                mjInformation,
                                mjOk,
                                mjDefNo);
            end;
        end;

        dqMasterData.Close ();
        dqMasterData.Free  ();
    end;
// <072> ADD-END

	fnShowScreenInformations ();

    m_cACControl	:= CmnEdit00001BkCode;

	m_cACControl.SetFocus ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonCancelOnClick (Sender: TObject);
var
	cMessageRec: TMJSMsgRec;
	cWinControl: TWinControl;
	nItems	   : Integer;

begin

    cWinControl	:= CmnEdit00001BkCode;

	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		if	(PCheckItemRec (m_cCheckItems.Items [nItems])^.fChangeData) then
			Break;
	end;

	if	(nItems >= m_cCheckItems.Count) then
	begin
		m_cACControl	:= cWinControl;
		m_cACControl.SetFocus ();

		Exit;																			// 以下, 未処理
	end;

	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 10020, 1);

	if	(MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle, cMessageRec.icontype,
									cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType) = mrYes) then
	begin
		fnShowScreenInformations ();

		m_cACControl	:= cWinControl;
		m_cACControl.SetFocus ();
	end;
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionAllControls (fEnabled: Boolean);
var
	cColorBackground: TColor;

begin
	if	(fEnabled) then
		cColorBackground	:= clWindow
	else
		cColorBackground	:= TJNTCRP008002f (Self).Color;

	CmnLabelName          .Enabled	:= fEnabled;
	CmnLabelNameSimple    .Enabled	:= fEnabled;

    CmnEdit00001BkCode.Static	:= not fEnabled;
    CmnEdit00001BkCode.Color	:= cColorBackground;

	CmnEdit00004BkKana .Static	:= not fEnabled;
	CmnEdit00006BrKana .Static	:= not fEnabled;
    CmnEdit00003BkName .Static  := not fEnabled;
    CmnEdit00005BrName .Static  := not fEnabled;
	CmnEdit00007NMK    .Static	:= not fEnabled;
	CmnEdit00008Renso  .Static	:= not fEnabled;

	CmnEdit00004BkKana .Color	:= cColorBackground;
	CmnEdit00006BrKana .Color	:= cColorBackground;
	CmnEdit00003BkName .Color	:= cColorBackground;
	CmnEdit00005BrName .Color	:= cColorBackground;
	CmnEdit00007NMK    .Color	:= cColorBackground;
	CmnEdit00008Renso  .Color	:= cColorBackground;

	CmnButtonUpdate.Enabled	:= fEnabled;
	CmnButtonCancel.Enabled	:= fEnabled;
end;


//***********************************************************************************************************/
//  参照ﾓｰﾄﾞ等の画面の制御（カード型）
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionAllControlsDetail (fEnabled: Boolean);
begin

    MPnlTop.Enabled := fEnabled;

// <056> MOD start
    //CmnPanelInformation04.enabled  := fEnabled;
    CmnPanelRefer.Enabled := fEnabled;
    // 口座管理情報の依頼先口座コードと以外のコントロールをパネルで分け、参照時でも依頼先口座コードを入力可能にする
// <056> MOD end

    CmnPanelInformation03.enabled  := fEnabled;
    CmnPanelInformation01.enabled  := fEnabled;
	CmnButtonUpdate.Enabled	:= fEnabled;
	CmnButtonCancel.Enabled	:= fEnabled;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionGrid ();
begin
	if	(m_nRefermode = REFER) then														// ﾒｰｲﾙ会計参照ﾌﾗｸﾞ: 参照時
	begin
		CmnTreeView.DragMode	:=	dmManual;

		CmnGridHojyoMA                 .Options		:= CmnGridHojyoMA.Options - [egoCanAppend] + [egoRowSelect];
		CmnGridHojyoMAColumnBKName       .ReadOnly	:= TRUE;
		CmnGridHojyoMAColumnBKKANA .ReadOnly	:= TRUE;

		CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options - [egoCanAppend] + [egoRowSelect];
		CmnGridAccInfoColumnDepDivision   .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnAccountNo     .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnClientCode    .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnClientNameKana.ReadOnly	:= TRUE;


		CmnGridHojyoMA.PopupMenu	:= nil;
	end
	else
	begin
		CmnTreeView.DragMode	:=	dmAutomatic;

		CmnGridHojyoMA              .Options   := CmnGridHojyoMA.Options + [egoCanAppend] - [egoRowSelect];
		CmnGridHojyoMAColumnBKName  .ReadOnly  := FALSE;
		CmnGridHojyoMAColumnBKKANA  .ReadOnly  := FALSE;

		CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options + [egoCanAppend] - [egoRowSelect];
		CmnGridAccInfoColumnDepDivision   .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnAccountNo     .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnClientCode    .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnClientNameKana.ReadOnly	:= FALSE;

//		CmnGridHojyoMA.PopupMenu	:= CmnPopupMenuGridHojyoMA;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionJournalInfo (nPosition: Integer);
var
	cNumEdit : TMNumEdit;
	cTxtEdit : TMTxtEdit;
	strFormat: String;

begin
	case (nPosition) of
		0:	begin
				cNumEdit	:= CmnEdit03015KmsCodeNumeric;
				cTxtEdit	:= CmnEdit03015KmsCodeFree;
			end;
		1:	begin
				cNumEdit	:= CmnEdit03016BumCodeNumeric;
				cTxtEdit	:= CmnEdit03016BumCodeFree;
			end;
		2:	begin
				cNumEdit	:= CmnEdit03017SegCodeNumeric;
				cTxtEdit	:= CmnEdit03017SegCodeFree;
			end;
		3:	begin
				cNumEdit	:= CmnEdit03018HojCodeNumeric;
				cTxtEdit	:= CmnEdit03018HojCodeFree;
			end;
		4:	begin
				cNumEdit	:= CmnEdit03019HojCodeNumeric;
				cTxtEdit	:= CmnEdit03019HojCodeFree;
			end;
		5:	begin
				cNumEdit	:= CmnEdit03020PrjCodeNumeric;
				cTxtEdit	:= CmnEdit03020PrjCodeFree;
			end;
// <044> 2006/12/21 H.Kawato Add Start
		6:	begin
				cNumEdit	:= CmnEdit03022PjSCodeNumeric;
				cTxtEdit	:= CmnEdit03022PjSCodeFree;
			end;
// <044> 2006/12/21 H.Kawato Add End
		else	Exit;
	end;

	if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then							// ｺｰﾄﾞ属性: 数字
	begin
		cNumEdit.Visible	:= TRUE;

		cTxtEdit.Visible	:= FALSE;

		cNumEdit.DMaxLength	:= m_arCodeAttribute [nPosition].nDigit;

		if	(m_arCodeAttribute [nPosition].nAttribute = 1) then							// ｺｰﾄﾞ属性: 1=数字(前ｾﾞﾛあり)
			strFormat	:= StringOfChar ('0', m_arCodeAttribute [nPosition].nDigit)
		else																			// ｺｰﾄﾞ属性: 0=数字
			strFormat	:= '';

		cNumEdit.FormatStr	:= strFormat;
		cNumEdit.Enabled	:= m_arCodeAttribute [nPosition].fEnabled;
		cNumEdit.Digits		:= m_arCodeAttribute [nPosition].nDigit;
		// <026> >>
        if m_arCodeAttribute [nPosition].nDigit = 0 then
			cNumEdit.MaxValue	:= 0
        else
			cNumEdit.MaxValue	:= StrToInt64 (StringOfChar ('9', m_arCodeAttribute [nPosition].nDigit));
		// <026> <<

		if	(m_arCodeAttribute [nPosition].fEnabled) then
			cNumEdit.Static	:= m_arCodeAttribute [nPosition].fStatic
		else
			cNumEdit.Static	:= FALSE;

			cNumEdit.TabStop	:= FALSE;
			cNumEdit.Color		:= TJNTCRP008002f (Self).Color;
		if	(m_arCodeAttribute [nPosition].fEnabled and (not m_arCodeAttribute [nPosition].fStatic)) then
		begin
			cNumEdit.TabStop	:= TRUE;
			cNumEdit.Color		:= clWindow;
			cNumEdit.Zero       := True;     //<013>
		end
		else
		begin
			cNumEdit.TabStop	:= FALSE;
			cNumEdit.Color		:= TJNTCRP008002f (Self).Color;
			cNumEdit.Zero       := False;    //<013>
		end;

	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		cNumEdit.Visible	:= FALSE;
		cTxtEdit.Visible	:= TRUE;
		cTxtEdit.Enabled	:= m_arCodeAttribute [nPosition].fEnabled;
		cTxtEdit.MaxLength	:= m_arCodeAttribute [nPosition].nDigit;

		if	(m_arCodeAttribute [nPosition].fEnabled) then
			cTxtEdit.Static	:= m_arCodeAttribute [nPosition].fStatic
		else
			cTxtEdit.Static	:= FALSE;

		if	(m_arCodeAttribute [nPosition].fEnabled and (not m_arCodeAttribute [nPosition].fStatic)) then
		begin
			cTxtEdit.TabStop	:= TRUE;
			cTxtEdit.Color		:= clWindow;
		end
		else
		begin
			cTxtEdit.TabStop	:= FALSE;
			cTxtEdit.Color		:= TJNTCRP008002f (Self).Color;
		end;
	end;

	TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 12) + 'Desc')).Caption	:= '';
	TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 12) + 'Desc')).Enabled	:= m_arCodeAttribute [nPosition].fEnabled;

	if	((m_arCodeAttribute [nPosition].nMasterDivision = MASTER_SECTION  ) or			// 部門
		 (m_arCodeAttribute [nPosition].nMasterDivision = MASTER_SEGMENT01)) then		// ｾｸﾞﾒﾝﾄ1
		fnChangeConditionJournalInfoEx (nPosition);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionJournalInfoEx (nPosition: Integer);
var
	dqMasterData: TMQuery;
	cNumEdit	: TMNumEdit;
	cTxtEdit	: TMTxtEdit;
	strHojCode	: String;

begin
	if	(not m_arCodeAttribute [nPosition].fEnabled) then
		Exit;

	if	((m_arCodeAttribute [nPosition].nClassCode <> 1) and (m_arCodeAttribute [nPosition].nClassCode <> 3)) then
		Exit;

	case (nPosition) of
		1:	begin
				cNumEdit	:= CmnEdit03016BumCodeNumeric;
				cTxtEdit	:= CmnEdit03016BumCodeFree;
			end;
		2:	begin
				cNumEdit	:= CmnEdit03017SegCodeNumeric;
				cTxtEdit	:= CmnEdit03017SegCodeFree;
			end;
		else	Exit;
	end;

	if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then							// ｺｰﾄﾞ属性: 数字
	begin
		cNumEdit.Static		:= TRUE;
		cNumEdit.TabStop	:= FALSE;
		cNumEdit.Color		:= TJNTCRP008002f (Self).Color;
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		cTxtEdit.Static		:= TRUE;
		cTxtEdit.TabStop	:= FALSE;
		cTxtEdit.Color		:= TJNTCRP008002f (Self).Color;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	strHojCode	:= '';

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SpHojyoNCd1, SphojyoNCd2 FROM MasterInfo WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_arCodeAttribute [nPosition].nMasterDivision;

		Open ();

		if	(not EOF) then
		begin
			if	(m_arCodeAttribute [nPosition].nClassCode = 1) then
				strHojCode	:= FieldByName ('SpHojyoNCd1').AsString						    // B/S共通部門(ｾｸﾞﾒﾝﾄ)ｺｰﾄﾞ
			else
				strHojCode	:= FieldByName ('SphojyoNCd2').AsString;						// P/L共通部門(ｾｸﾞﾒﾝﾄ)ｺｰﾄﾞ
		end;

		if	(Trim (strHojCode) = '') then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT GCode FROM HojyoMA ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 AND Syokuchikbn = 1');

			ParamByName ('nMasterDivision').AsInteger	:= m_arCodeAttribute [nPosition].nMasterDivision;

			Open ();	// <027> OPENしよう！

			if	(not EOF) then
				strHojCode	:= FieldByName ('GCode').AsString;							// 諸口部門(ｾｸﾞﾒﾝﾄ)ｺｰﾄﾞ
		end
        // <027> >>
		// 会計不具合440対応
		else
        begin
        	// SpHojyoNCd1,SpHojyoNCd2は内部コードだからそのまま出したらダメだよ
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT GCode FROM HojyoMA ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 AND NCode = :NCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_arCodeAttribute [nPosition].nMasterDivision;
			ParamByName ('NCode').AsString	:= strHojCode;

			Open ();

			if	(not EOF) then
				strHojCode	:= FieldByName ('GCode').AsString
            else
				strHojCode	:= '';
        end;
        // <027> <<
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then							// ｺｰﾄﾞ属性: 数字
	begin
		if	(Trim (strHojCode) = '') then
		begin
			cNumEdit.Value		:= 0;
			cNumEdit.InputFlag	:= TRUE;
		end
		else
		begin
			cNumEdit.Value		:= StrToInt64 (Trim (strHojCode));
			cNumEdit.InputFlag	:= FALSE;
		end;
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
		cTxtEdit.Text	:= strHojCode;

	// <027>	fnCheckEditTxtValueHojCode (4 , 8 + nPosition);
	fnCheckEditTxtValueHojCode (4 , 15 + nPosition);	// <027>
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionPageButtons (fVisible: Boolean);
begin

//	if	(CmnTabInformations.Items.Selected = 2) then
//		fVisible	:= FALSE;

//	CmnButtonPagePrevious.Visible	:= fVisible;
//	CmnButtonPageNext    .Visible	:= fVisible;

//	if	(not fVisible) then
//		Exit;

//↓<MLXHAP>MLX給与の場合は[口座管理情報]タブのみなので、前頁・次頁ボタンは消す。
	if TMSeries.IsMjsLink3 then
	begin
		CmnButtonPagePrevious.Visible			:= False; // 前頁ボタン
		CmnButtonPageNext.Visible				:= False; // 次頁ボタン
	end;
//↑<MLXHAP>

	case (CmnTabInformations.Items.Selected) of
		0:	begin
				CmnButtonPagePrevious.Enabled	:= FALSE;
				CmnButtonPageNext    .Enabled	:= TRUE;
			end;
		1:	begin
				CmnButtonPagePrevious.Enabled	:= TRUE;
				CmnButtonPageNext    .Enabled	:= TRUE;
			end;
		2:	begin
				CmnButtonPagePrevious.Enabled	:= TRUE;
				CmnButtonPageNext    .Enabled	:= FALSE;
			end;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnChangeConditionToolbarButtons (nCode: Extended; nAccountCode: Integer);
begin

(*
	if	nCode <> 0 then
	begin

		if	(m_nReferMode <> REFER) then												// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照以外
		begin
			B_Delete.Enabled	:= TRUE;
		end
		else
			B_Delete.Enabled	:= FALSE;
	end
	else
	begin
		if	(nAccountCode <= 0) then
			B_Delete.Enabled	:= FALSE
		else
			B_Delete.Enabled	:= TRUE;
	end;

	if	( (nAccountCode <= 0)) then
        B_Syousai.Enabled := False
	else
	begin
		if	(m_nReferMode <> BASICONLY) then											// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 基本のみ以外
			B_Syousai.Enabled	:= TRUE
		else
			B_Syousai.Enabled	:= FALSE;
	end;

    if	(nAccountCode <= 0) then
        CmnButtonToolbarTag.Enabled	:= TRUE
    else
        CmnButtonToolbarTag.Enabled	:= FALSE;

*)
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnChangeSelectionScreen (): Boolean;
var
//	dqMasterData  : TMQuery;
	nReturn		  : Integer;
//	nCodeDigit	  : Integer;
//	nCodeAttribute: Integer;
//	nAdoption	  : Integer;
//	strMessage	  : String;
//	strDescription: String;

begin
	if	(m_nReferMode <> REFER) then														// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照時
		fnChangeConditionAllControlsDetail (TRUE);

// <059> MOD start
(*
	nReturn	:= fnOutputConfirmationMessage (CONFIRM_INSTRUCTION);

	if	(nReturn = CONFIRM_RETFOCUSED) then
	begin
		Result	:= FALSE;
		Exit;
	end
	else if	(nReturn = CONFIRM_WRITE) then
	begin
		if	(not fnUpdateRecordDetail ()) then
		begin
			Result	:= FALSE;
			Exit;
		end
	end;
*)
	if m_nReferMode <> REFER then    		// 参照時は保存確認ﾒｯｾｰｼﾞを表示しないようにする
    begin
    	nReturn	:= fnOutputConfirmationMessage (CONFIRM_INSTRUCTION);

		if	(nReturn = CONFIRM_RETFOCUSED) then
		begin
			Result := FALSE;
			Exit;
		end
		else if	(nReturn = CONFIRM_WRITE) then
		begin
			if	(not fnUpdateRecordDetail ()) then
			begin
				Result := FALSE;
				Exit;
			end
		end;
    end;
// <059> MOD end

	fnInitializeScreenAttribute ();
	fnInitializeScreen ();

	fnResetChangeFlagCheckItems ();

	fnChangeConditionGrid ();

	Result	:= TRUE;
end;
(* <037>
//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue (): Boolean;
var
	nItems	: Integer;
	nAreaNo	: Integer;
	nFieldID: Integer;
	nScreen	: Integer;
	fReturn	: Boolean;

begin

	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		if	(PCheckItemRec (m_cCheckItems.Items [nItems])^.fNoCheck) then
			Break;
	end;

	if	(nItems >= m_cCheckItems.Count) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	fReturn	:= TRUE;

	nAreaNo		:= Trunc (PCheckItemRec (m_cCheckItems.Items [nItems])^.nFieldID / 1000);
	nFieldID	:= Trunc (PCheckItemRec (m_cCheckItems.Items [nItems])^.nFieldID mod 1000);

	case (nAreaNo) of
		0:	fReturn	:= fnCheckEditItemsValue00 (nFieldID);								// 00.基本
		1:	fReturn	:= fnCheckEditItemsValue01 (nFieldID);								// 01.手数料
		2:	fReturn	:= fnCheckEditItemsValue02 (nFieldID);								// 02.全銀協/FB情報
		3:	fReturn	:= fnCheckEditItemsValue03 (nFieldID);								// 03.ﾚｲｱｳﾄ情報
	end;

	if	(not fReturn) then
	begin
		if	(nAreaNo <> 0) then
		begin
			for	nScreen := 0 to 2 do
			begin
				if	(nScreen = nAreaNo - 1) then
					CmnTabInformations.Items [nScreen].Selected	:= TRUE
				else
					CmnTabInformations.Items [nScreen].Selected	:= FALSE;

				fnChangeConditionPageButtons (CmnTabInformations.Visible);
			end;
		end;
	end;

	Result	:= fReturn;
end;
*)
//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue (): Boolean;
var
	nItems	: Integer;
	nAreaNo	: Integer;
	nFieldID: Integer;
	nScreen	: Integer;
	fReturn	: Boolean;

begin

	fReturn	:= TRUE;
    nAreaNo := 0;   ///<044>

	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		if	(PCheckItemRec (m_cCheckItems.Items [nItems])^.fNoCheck) then
        begin
        	nAreaNo		:= Trunc (PCheckItemRec (m_cCheckItems.Items [nItems])^.nFieldID / 1000);
        	nFieldID	:= Trunc (PCheckItemRec (m_cCheckItems.Items [nItems])^.nFieldID mod 1000);
        	case (nAreaNo) of
        		0:	fReturn	:= fnCheckEditItemsValue00 (nFieldID);								// 00.基本
        		1:	fReturn	:= fnCheckEditItemsValue01 (nFieldID);								// 01.手数料
        		2:	fReturn	:= fnCheckEditItemsValue02 (nFieldID);								// 02.全銀協/FB情報
        		3:	fReturn	:= fnCheckEditItemsValue03 (nFieldID);								// 03.ﾚｲｱｳﾄ情報
        	end;
            if (fReturn = false) then
                break;
        end;
	end;

	if	(nItems >= m_cCheckItems.Count) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(not fReturn) then
	begin
		if	(nAreaNo <> 0) then
		begin
			for	nScreen := 0 to 2 do
			begin
				if	(nScreen = nAreaNo - 1) then
					CmnTabInformations.Items [nScreen].Selected	:= TRUE
				else
					CmnTabInformations.Items [nScreen].Selected	:= FALSE;

				fnChangeConditionPageButtons (CmnTabInformations.Visible);
			end;
		end;
	end;

	Result	:= fReturn;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue00 (nFieldID: Integer): Boolean;
var
	fReturn: Boolean;

begin
	fReturn	:= TRUE;

	case (nFieldID) of
		 1:	fReturn	:= fnCheckEditNumValueAllBankCode ();								// 全銀協銀行ｺｰﾄﾞ
		 2:	fReturn	:= fnCheckEditNumValueAllBankCode ();								// 全銀協支店ｺｰﾄﾞ
//		 2:	fReturn	:= fnCheckEditNumValueBranchCode  ();								// 全銀協支店ｺｰﾄﾞ
		 3:	fReturn	:= fnCheckEditTxtValue			  (0, nFieldID);					// 全銀協銀行名称
		 4:	fReturn	:= fnCheckEditTxtValueKanaDesc	  (0, nFieldID);					// 全銀協銀行名称(ｶﾅ)
		 5:	fReturn	:= fnCheckEditTxtValue			  (0, nFieldID);					// 全銀協支店名称
		 6:	fReturn	:= fnCheckEditTxtValueKanaDesc	  (0, nFieldID);					// 全銀協支店名称(ｶﾅ)
         7:	fReturn	:= fnCheckEditTxtValue			  (0, nFieldID);					// 簡略名称
	end;

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue01 (nFieldID: Integer): Boolean;
var
	fReturn: Boolean;

begin
	fReturn	:= TRUE;

	case (nFieldID) of
		 2, 3, 16, 17, 30, 31:	fReturn	:= fnCheckEditNumValueFeeList (nFieldID);		// 分割基準額
	end;

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue02 (nFieldID: Integer): Boolean;
var
	fReturn: Boolean;
    Qry    : TMQuery;
begin
	fReturn	:= TRUE;


	case (nFieldID) of
		1:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 手形ﾚｲｱｳﾄﾊﾟｽ
		2:	fReturn	:= fnCheckEditNumValueSelect (2, nFieldID);							// 金額文字種別
		3:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 小切手ﾚｲｱｳﾄﾊﾟｽ
		4:	fReturn	:= fnCheckEditNumValueSelect (2, nFieldID);							// 小切手文字種別
		5:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 割引依頼書ﾚｲｱｳﾄﾊﾟｽ
		6:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 取立依頼表ﾚｲｱｳﾄﾊﾟｽ
		7:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 担保依頼差入証ﾚｲｱｳﾄﾊﾟｽ
		8:
            begin
            	Qry	:= TMQuery.Create (Self);
                m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);						// DBとMQueryの接続
                fReturn	:= fnSetFieldDescAccountCode(Qry);							    // 入金口座
                Qry.Close;
                Qry.Free;

                // <MAS 351> -->
                if (not fReturn) then
	                m_cACControl := CmnEdit02008ChaDivisionCheck;
                // <MAS 351> <--
            end;
		9:	fReturn	:= fnCheckEditTxtValue		 (2, nFieldID);							// 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
// <096> ADD↓
		10:	fReturn	:= fnCheckEditTxtValueClientCode  (2, nFieldID);					// 送金依頼人ｺｰﾄﾞ
		11:	fReturn	:= fnCheckEditTxtValueKanaDesc	  (2, nFieldID);					// 送金依頼人名称(ｶﾅ)
		12:	fReturn	:= fnCheckEditNumValueSelect	  (2, nFieldID);					// 半角ｺｰﾄﾞ体系
		13:	fReturn	:= fnCheckEditNumValueSelect	  (2, nFieldID);					// ﾚｺｰﾄﾞ区切
		14:	fReturn	:= fnCheckEditTxtValue			  (2, nFieldID);					// ﾌｧｲﾙ名称
// <096> ADD↑

	end;

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditItemsValue03 (nFieldID: Integer): Boolean;
var
	fReturn: Boolean;

begin
	fReturn	:= TRUE;

	case (nFieldID) of
		 1:	fReturn	:= fnCheckEditNumValueAccountCode (3, nFieldID);					// 口座ｺｰﾄﾞ
		 2:	fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);					// 預金種別
		 3:	fReturn	:= fnCheckEditTxtValueAccountNo	  (3, nFieldID);					// 口座番号
         4:	fReturn	:= fnCheckEditNumValueSelect      (3, nFieldID);				    // 金額文字種別
		 5:	fReturn	:= fnCheckEditNumValueSelect      (3, nFieldID);				   	// 金額文字種別
		 6:	fReturn	:= fnCheckEditNumValueSelect      (3, nFieldID);					// 金額文字種別
		 7:	fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);					// 半角ｺｰﾄﾞ体系
		 8:	fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);					// ﾚｺｰﾄﾞ区切
		 9:	fReturn	:= fnCheckEditTxtValueClientCode  (3, nFieldID);					// 振込依頼人ｺｰﾄﾞ
		10:	fReturn	:= fnCheckEditTxtValue			  (3, nFieldID);					// 振込依頼人名称
		11:	fReturn	:= fnCheckEditTxtValueKanaDesc	  (3, nFieldID);					// 振込依頼人名称(ｶﾅ)
		12:	fReturn	:= fnCheckEditTxtValue			  (3, nFieldID);					// ﾌｧｲﾙ名称
		13:	fReturn	:= fnCheckEditTxtValue			  (3, nFieldID);					// ﾎﾞﾘｭｰﾑ名称
		14:	fReturn	:= fnCheckEditNumValueKmkCode	  (3, nFieldID);					// 勘定科目ｺｰﾄﾞ
        15:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// 科目別補助ｺｰﾄﾞ	<026>
//<026> 15:	fReturn	:= fnCheckEditNumValueKmsCode	  (3, nFieldID);					// 科目別補助ｺｰﾄﾞ
        16:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// 部門ｺｰﾄﾞ
		17:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// ｾｸﾞﾒﾝﾄｺｰﾄﾞ
		18:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// 補助ｺｰﾄﾞ1
		19:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// 補助ｺｰﾄﾞ2
		20:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// ﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞ
		21:	fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);					// 手数料摘要区分
		22:	fReturn	:= fnCheckEditTxtValueHojCode	  (3, nFieldID);					// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞｺｰﾄﾞ  <044>
		23:	fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);					// 手数料支払区分	<076>
		25:	fReturn	:= fnCheckEditTxtValue			  (3, nFieldID);					// フルー項目 <092>
		26:	fReturn	:= fnCheckEditTxtValue			  (3, nFieldID);					// 口座メモ <099>
		27: fReturn	:= fnCheckEditNumValueSelect	  (3, nFieldID);                    // 総合振込出力方式  <103>
	end;

	Result	:= fReturn;


end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueAccountCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cNumEdit : TMNumEdit;
//	nBkCode  : Integer;
    Qry      : TMQuery;
    lvNCODE  : Extended;

begin

	cNumEdit	:= CmnEdit03001AccountCode;

///    lvNCODE := 0;
    lvNCODE := fnGetNCODE(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);

	if	(cNumEdit.AsInteger = 0) then
	begin
		m_cACControl    := cNumEdit;
		Result	        := FALSE;
		Exit;
    end;

(* <020>
	end
    else
    begin
        Qry	:= TMQuery.Create (Self);
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
        with (Qry) do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT BankNCode FROM AccInfo ');
            SQL.Add   ('WHERE GCode = :nAccountCode AND RdelKbn = 0');

            ParamByName ('nAccountCode').AsInteger	:= cNumEdit.AsInteger;

            Open ();

            if	RecordCount > 0  then
            begin
                if lvNCODE <> FieldByName('BankNCode').AsFloat then
                begin
                    Qry.Close ();
                    Qry.Free  ();
                    Result	:= FALSE;
                    Exit;
                end;
            end

        end;
    end;
*)

    Qry	:= TMQuery.Create (Self);                           //<020>
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);      //<020>

	with (Qry) do
    begin
        Close ();
        SQL.Clear ();
        SQL.Add   ('SELECT * FROM AccInfo ');
        SQL.Add   ('WHERE GCode = :nAccountCode AND RdelKbn = 0');
//<020>        SQL.Add   ('  And BankNCode = :nBkCode');

        ParamByName ('nAccountCode').AsInteger	:= CmnEdit03001AccountCode.AsInteger;
//<020>        ParamByName ('nBkCode'    ).AsFloat     := lvNCODE;
        Open ();

        if	(EOF) then
        begin
            // 新規ﾚｺｰﾄﾞ入力可能 <020>
            m_fNewRec := True;
            fnInitializeScreenDetailInfo03 ();
            m_fNewRec := False;
        end
        else
        begin
            // 入力済みのﾚｺｰﾄﾞとBankNCodeが一致する場合は修正 <020>
            if GetFld('BankNCode').AsFloat = lvNCode then
                fnSetScreenDetailInformation04 (Qry)
            else
            begin
                // BankNCodeが不一致の場合は既に他で入力されているので入力不可 <020>
                Result := False;
            	Qry.Close ();
            	Qry.Free  ();
                Exit;
            end;
        end;

    	fnResetChangeFlagCheckItems ();
    end;
	Qry.Close ();
	Qry.Free  ();

	fnSetChangeFlagCheckItems (cNumEdit, FALSE);

	Result	:= TRUE;
end;
//***********************************************************************************************************/
//　全銀協コードチェック
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueAllBankCode (): Boolean;
var
	nAllBankCode  : Integer;
	strDescription: String;
	strKanaDesc	  : String;

begin

	strDescription	:= '';
	strKanaDesc		:= '';

	if	(CmnEdit00001BkCode.InputFlag) then
		nAllBankCode	:= -1
	else
		nAllBankCode	:= CmnEdit00001BkCode.AsInteger;

	if	(fnCheckValidAllBankCode (nAllBankCode, strDescription, strKanaDesc)) then
	begin
		CmnEdit00003BkName.Text	:= strDescription;
		CmnEdit00004BkKana.Text	:= strKanaDesc;
	end;

//    if	(fnShowScreenInformations ()) then
//      fnSelectTreeViewItem (nAllBankCode, -1);
{    if (CmnEdit00001BkCode.value = 0) and (CmnEdit00002BrCode.value = 0) then
    begin
        fnInitializeScreenDetailInfo;
    end;
}
//    if (CmnEdit00001BkCode.value <> 0) and (CmnEdit00002BrCode.value <> 0) then
        fnShowScreenInformations ();

	fnSetChangeFlagCheckItems (CmnEdit00001BkCode, FALSE);

	Result	:= TRUE;
end;

{
//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueAppDate (nFieldID: Integer): Boolean;
var
	cDateEdit: TMDateEdit;

begin

	if	(cDateEdit.Value > 0) then
	begin
		if	(not MJSDateCtrl.MjsIntYMDChk (cDateEdit.Value)) then
		begin
			m_cACControl	:= cDateEdit;

			Result	:= FALSE;
			Exit;
		end;

	end;

	fnSetChangeFlagCheckItems (cDateEdit, FALSE);

	Result	:= TRUE;
end;
}

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueBranchCode (): Boolean;
var
	nAllBankCode  : Integer;
	nBranchCode	  : Integer;
	strDescription: String;
	strKanaDesc	  : String;

begin
	strDescription	:= '';
	strKanaDesc		:= '';

	if	(CmnEdit00001BkCode.InputFlag) then
		nAllBankCode	:= -1
	else
		nAllBankCode	:= CmnEdit00001BkCode.AsInteger;

	if	(fnCheckValidAllBankCode (nAllBankCode, strDescription, strKanaDesc)) then
	begin
		CmnEdit00003BkName	   .Text	:= strDescription;
		CmnEdit00004BkKana.Text	:= strKanaDesc;
	end;

	if	(CmnEdit00002BrCode.InputFlag) then
		nBranchCode	:= -1
	else
		nBranchCode	:= CmnEdit00002BrCode.AsInteger;

	if	(fnCheckValidBranchCode (nAllBankCode, nBranchCode, strDescription, strKanaDesc)) then
	begin
		CmnEdit00005BrName    .Text	:= strDescription;
		CmnEdit00006BrKana.Text	:= strKanaDesc;
	end;

	fnSetChangeFlagCheckItems (CmnEdit00002BrCode, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueFeeList (nFieldID: Integer): Boolean;
var
	cNumEdit: TMNumEdit;
	nPrevFee: Extended;
	nClass	: Integer;
	nRow	: Integer;

begin
	case (nFieldID) of
		 2:	cNumEdit	:= CmnEditFeeValue010102;
		 3:	cNumEdit	:= CmnEditFeeValue010202;
		16:	cNumEdit	:= CmnEditFeeValue020102;
		17:	cNumEdit	:= CmnEditFeeValue020202;
		30:	cNumEdit	:= CmnEditFeeValue030102;
		31:	cNumEdit	:= CmnEditFeeValue030202;
		else
		begin
			Result	:= TRUE;
			Exit;
		end;
	end;

	nClass	:= StrToInt (Copy (cNumEdit.Name, 16, 2));
	nRow	:= StrToInt (Copy (cNumEdit.Name, 18, 2));

	nPrevFee	:= TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, 1]))).Value;

	if	(cNumEdit.AsInteger <= nPrevFee) then
	begin
		m_cACControl	:= cNumEdit;

		Result	:= FALSE;
		Exit;
	end;

	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow + 1, 1]))).Value	:= cNumEdit.Value;

	fnSetChangeFlagCheckItems (cNumEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueKmkCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cNumEdit	  : TMNumEdit;
	strDescription: String;
	fReturn		  : Boolean;

begin
	strDescription	:= '';

	cNumEdit	:= CmnEdit03014KmkCode;

	if	(not (cNumEdit.InputFlag)) then
		fReturn	:= fnCheckValidKmkCode (cNumEdit.AsInteger, strDescription)
	else
		fReturn	:= TRUE;

	CmnLabel03014KmkCodeDesc.Caption	:= strDescription;

	if	(not fReturn) then
	begin
		m_cACControl	:= cNumEdit;

		Result	:= FALSE;
		Exit;
	end;

	fnSetAttributeJournalInfo (cNumEdit.AsInteger);
	fnSetChangeFlagCheckItems (cNumEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueKmsCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cNumEdit	  : TMNumEdit;
	strDescription: String;
	fReturn		  : Boolean;

begin
	strDescription	:= '';

	cNumEdit	:= CmnEdit03015KmsCodeNumeric;

	if	(not (cNumEdit.InputFlag)) then

		fReturn	:= fnCheckValidKmsCode (CmnEdit03014KmkCode.AsInteger, fnGetDspData(cNumEdit.Text,1), strDescription)
	else
		fReturn	:= TRUE;

	CmnLabel03015KmsCodeDesc.Caption	:= strDescription;

	if	(not fReturn) then
	begin
		m_cACControl	:= cNumEdit;

		Result	:= FALSE;
		Exit;
	end;

	fnSetChangeFlagCheckItems (cNumEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditNumValueSelect (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cNumEdit	  : TMNumEdit;
	strDescription: String;
	fReturn		  : Boolean;

begin
	cNumEdit	:= nil;
	case (nAreaNo) of
		2:	begin																		// 画面2.全銀協/FB情報
				case (nFieldID) of
					 2:	cNumEdit	:= CmnEdit02002ChaDivisionDraft;					// 画面2.金額文字種別
					 4:	cNumEdit	:= CmnEdit02004ChaDivisionCheck;					// 画面2.小切手文字種別
// <096> ADD↓
					12:	cNumEdit	:= CmnEdit02012SoukinCodeMode;						// 画面2.半角コード
					13:	cNumEdit	:= CmnEdit02013SoukinRecordPause;					// 画面2.レコード区切り
// <096> ADD↑
				end;
			end;
		3:	begin																		// 画面3.口座情報
				case (nFieldID) of
					 2:	cNumEdit	:= CmnEdit03002DepDivision;					// 画面3.預金種別
					 4:	cNumEdit	:= CmnEdit03004PayDivision;	        	    // 画面3.振込種別
					 5:	cNumEdit	:= CmnEdit03005ReqKbn;  					// 画面3.依頼書電信扱い
					 6:	cNumEdit	:= CmnEdit03006Syumoku;	    				// 画面3.取扱種目
					 7:	cNumEdit	:= CmnEdit03007FBCodeMode;	    		   	// 画面3.半角コード
					 8:	cNumEdit	:= CmnEdit03008RecordPause;	   				// 画面3.レコード区切り
				    21:	cNumEdit	:= CmnEdit03021FeeDivision;	   				// 画面3.手数料摘要区分
   				    23:	cNumEdit	:= CmnEdit03023FeePayKbn;	   				// 画面3.手数料支払区分 <076> Add
                    27: cNumEdit	:= CmnEdit03027SouFuripattern;				// 画面3.総合振込出力方式  <103>
				end;
			end;
	end;

	if	(cNumEdit = nil) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	fReturn	:= fnGetDescriptionSelectedItem (cNumEdit, strDescription);

	TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 64) + 'Desc')).Caption	:= strDescription;

	if	(fReturn) then
		fnSetChangeFlagCheckItems (cNumEdit, FALSE)
	else
		m_cACControl	:= cNumEdit;

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValue (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cTxtEdit: TMTxtEdit;

begin
	cTxtEdit	:= nil;

	case (nAreaNo) of
		0:	begin
				case (nFieldID) of
                    3:	cTxtEdit	:= CmnEdit00003BkName;						// 全銀協銀行名称
					4:	cTxtEdit	:= CmnEdit00004BkKana;			   			// 銀行カナ
					5:	cTxtEdit	:= CmnEdit00005BrName; 						// 全銀協支店名称
					6:	cTxtEdit	:= CmnEdit00006BrKana;			   			// 支店カナ
					7:	cTxtEdit	:= CmnEdit00007NMK;							// 簡略名称
					8:	cTxtEdit	:= CmnEdit00008Renso;					 	// 連想
				end;
			end;
		2:	begin
				case (nFieldID) of
					1:	cTxtEdit	:= CmnEdit02001LayoutPathDraft;						// 手形ﾚｲｱｳﾄﾊﾟｽ
					3:	cTxtEdit	:= CmnEdit02003LayoutPathCheck;						// 小切手ﾚｲｱｳﾄﾊﾟｽ
					5:	cTxtEdit	:= CmnEdit02005LayoutPathCheck;						//
					6:	cTxtEdit	:= CmnEdit02006LayoutPathCheck;						//
					7:	cTxtEdit	:= CmnEdit02007LayoutPathCheck;						//
					9:	cTxtEdit	:= CmnEdit02009LayoutPathCheck;						// 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
					14:	cTxtEdit	:= CmnEdit02014SoukinFileName;						// ファイル名称		<096> ADD
				end;
			end;
		3:	begin
				case (nFieldID) of
					10:	cTxtEdit	:= CmnEdit03010ClientName;						//
//					11:	cTxtEdit	:= CmnEdit03011ClientNameKana;				   	//				// <097> DEL
					12:	cTxtEdit	:= CmnEdit03012FileName;						//
					13:	cTxtEdit	:= CmnEdit03013VolumeName;						//
					25:	cTxtEdit	:= CmnEdit03025FreeItem;						// <092> ADD
					26:	cTxtEdit	:= CmnEdit03026AccMemo;						    // <099> ADD
				end;
			end;
	end;

	if	(cTxtEdit = nil) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	fnSetChangeFlagCheckItems (cTxtEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueAccountNo (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cTxtEdit: TMTxtEdit;

begin
	cTxtEdit		:= CmnEdit03003AccountNo;
	cTxtEdit.Text	:= fnGetEditedAccountNumber (cTxtEdit.Text);

	fnSetChangeFlagCheckItems (cTxtEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueBankCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	nBkCode	  : Integer;
//	strDescription: String;
//	fReturn		  : Boolean;

begin
    if	CmnEdit00001BkCode.InputFlag then
        nBkCode	:= 0
    else
        nBkCode	:= CmnEdit00001BkCode.AsInteger;

    if	(fnShowScreenInformations ()) then
        fnSelectTreeViewItem (nBkCode, -1);

	fnSetChangeFlagCheckItems (CmnEdit00001BkCode, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueClientCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cTxtEdit: TMTxtEdit;

begin
// <096> MOD↓
//	cTxtEdit		:= CmnEdit03009ClientCode;
	case (nAreaNo) of
		2:	// レイアウト／送金情報タブ
        	cTxtEdit	:= CmnEdit02010SoukinClientCode;
        3:	// 口座管理情報タブ
        	cTxtEdit	:= CmnEdit03009ClientCode;
        else
        begin
			Result	:= FALSE;
            exit;
        end;
	end;
// <096> MOD↑
	cTxtEdit.Text	:= fnGetEditedClientCode (cTxtEdit.Text);

	fnSetChangeFlagCheckItems (cTxtEdit, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueDescription (): Boolean;
var
	strDescription: String;

begin
	strDescription	:= '';

	if	(CmnEdit00007NMK.Text = '') then
	begin
		if	(MjsHanLength(CmnEdit00003BkName.Text) <= 14) then
			strDescription	:= CmnEdit00003BkName.Text
		else
			strDescription	:= MJSKabuCut (CmnEdit00003BkName.Text, 14);
	end;

	if	(strDescription <> '') then
		CmnEdit00007NMK.Text	:= strDescription;

	fnSetChangeFlagCheckItems (CmnEdit00003BkName, FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueHojCode (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	nPosition	  : Integer;
	strDescription: String;
	strFieldName  : String;
	strHojCode    : String;
	fReturn		  : Boolean;

//    cNumEdit      : TMNumEdit;

begin
	nPosition	:= nFieldID - (15);

	case (nPosition) of
		0:	strFieldName	:= 'CmnEdit03015KmsCode';	// <026>
		1:	strFieldName	:= 'CmnEdit03016BumCode';
		2:	strFieldName	:= 'CmnEdit03017SegCode';
		3:	strFieldName	:= 'CmnEdit03018HojCode';
		4:	strFieldName	:= 'CmnEdit03019HojCode';
		5:	strFieldName	:= 'CmnEdit03020PrjCode';
		7:	strFieldName	:= 'CmnEdit03022PjSCode';   // <044>
		else
		begin
			Result	:= TRUE;
			Exit;
		end;
	end;

// <044> 2006/12/21 H.Kawato Add Start
    if  (nPosition = 7) then
        nPosition   := 6;
// <044> 2006/12/21 H.Kawato Add End

	strDescription	:= '';
	fReturn			:= TRUE;

	if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then
	begin
		if	(TMNumEdit (MJSFindCtrl (Self, strFieldName + 'Numeric')).InputFlag) then
			strHojCode	:= ''
		else
//			strHojCode	:= fnGetDspData(Format ('%.10d', [Trunc (TMNumEdit (MJSFindCtrl (Self, strFieldName + 'Numeric')).Value)]),m_arCodeAttribute [nPosition].nAttribute);
			strHojCode	:= fnGetDspData(Format ('%.16d', [Trunc (TMNumEdit (MJSFindCtrl (Self, strFieldName + 'Numeric')).Value)]),m_arCodeAttribute [nPosition].nAttribute);
	end
	else
		strHojCode	:= fnGetDspData(TMTxtEdit (MJSFindCtrl (Self, strFieldName + 'Free')).Text,m_arCodeAttribute [nPosition].nAttribute);

	if	(strHojCode <> '') then
	begin
    	// <026> >>
        if nPosition = 0 then	// 科目別補助
			fReturn	:= fnCheckValidKmsCode (CmnEdit03014KmkCode.AsInteger, strHojCode, strDescription)
		else
	   		fReturn	:= fnCheckValidHojCodeEx (nPosition, strHojCode, m_arCodeAttribute [nPosition].nMasterDivision, strDescription);
    	// <026> <<
        TMNumEdit (MJSFindCtrl (Self, strFieldName + 'Numeric')).Zero := True;    //<013>
	end
    else
        TMNumEdit (MJSFindCtrl (Self, strFieldName + 'Numeric')).Zero := False;   //<013>

	TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (strFieldName, 8, 12) + 'Desc')).Caption	:= strDescription;

	if	(not fReturn) then
	begin
		if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then
			m_cACControl	:= TWinControl (MJSFindCtrl (Self, strFieldName + 'Numeric'))
		else
			m_cACControl	:= TWinControl (MJSFindCtrl (Self, strFieldName + 'Free'));

		Result	:= FALSE;
		Exit;
	end;

// <044> 2006/12/21 H.Kawato Add Start
    // ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ入力制御
    if  (nPosition = 5) then
        PrjCodeNextControl();
// <044> 2006/12/21 H.Kawato Add End

	fnSetChangeFlagCheckItems (TWinControl (MJSFindCtrl (Self, strFieldName + 'Numeric')), FALSE);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckEditTxtValueKanaDesc (nAreaNo: Integer; nFieldID: Integer): Boolean;
var
	cTxtEdit: TMTxtEdit;

begin
	cTxtEdit	:= nil;


	case (nAreaNo) of
		0:	begin																// 全銀協/FB情報
				case (nFieldID) of
					4:	cTxtEdit	:= CmnEdit00004BkKana;						// 全銀協銀行名称(ｶﾅ)
					6:	cTxtEdit	:= CmnEdit00006BrKana;						// 全銀協支店名称(ｶﾅ)
				end;
			end;
// <096> ADD↓
		2:	begin																// レイアウト／送金情報タブ
				case (nFieldID) of
					11:	cTxtEdit	:= CmnEdit02011SoukinClientNameKana;		// 送金依頼人名称(ｶﾅ)
				end;
			end;
		3:	begin																// 口座管理情報タブ
				case (nFieldID) of
					11:	cTxtEdit	:= CmnEdit03011ClientNameKana;				// ｶﾅ依頼人名称
				end;
			end;
// <096> ADD↑
	end;

	if	(cTxtEdit = nil) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(not fnCheckValidKanaDesc (cTxtEdit.Text)) then
	begin
		m_cACControl	:= cTxtEdit;

		Result	:= FALSE;
		Exit;
	end;

	fnSetChangeFlagCheckItems (cTxtEdit, FALSE);

	Result	:= TRUE;
end;




//***********************************************************************************************************/
//***********************************************************************************************************/
{↓<DIC_BANK>銀行辞書Exp対応にて作り変え。
function	TJNTCRP008002f.fnCheckValidAllBankCode (nAllBankCode: Integer; var strDescription: String; var strKanaDesc: String): Boolean;
var
	dqCommonData: TMQuery;

begin
	strDescription	:= '';
	strKanaDesc		:= '';

	if	(nAllBankCode = -1) then														// 全銀協ｺｰﾄﾞ=空
	begin
		Result	:= TRUE;
		Exit;
	end;

	dqCommonData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBCommon, dqCommonData);							// DBとMQueryの接続

	with (dqCommonData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK WHERE BankCD = :nAllBankCode');

		ParamByName ('nAllBankCode').AsInteger	:= nAllBankCode;

		Open ();

		if	(EOF) then
		begin
			dqCommonData.Close ();
			dqCommonData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('BankName').AsString;
		strKanaDesc		:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankName').AsString);
	end;

	dqCommonData.Close ();
	dqCommonData.Free  ();

	Result	:= TRUE;
end;
↑<DIC_BANK>}
//↓<DIC_BANK>銀行辞書Exp対応にて作り変え。CMN_BANKはみない。
function	TJNTCRP008002f.fnCheckValidAllBankCode (nAllBankCode: Integer; var strDescription: String; var strKanaDesc: String): Boolean;
var
	iRtn		: Integer;
	sBankName	: string;
	sBankKana	: string;
	nOfficeCD	: Integer;
	sOfficeName	: string;
	sOfficeKana	: string;
begin

	strDescription	:= '';
	strKanaDesc		:= '';

	if	(nAllBankCode = -1) then														// 全銀協ｺｰﾄﾞ=空
	begin
		Result	:= TRUE;
		Exit;
	end;

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_MASTERCHECK);
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK); //<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			nOfficeCD := -1;
			iRtn:=fnCMNBankShow(	nAllBankCode,
									nOfficeCD,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);

			//呼出失敗
			if(iRtn=-1)then
			begin
				Abort;
			end;

			//選択せず終了
			if(iRtn<>1)then
			begin
				Result	:= FALSE;
				Exit;
			end;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

    strDescription	:= sBankName;
	strKanaDesc		:= fnExchangeCharacterKanaDesc(sBankKana);

	Result	:= TRUE;
end;
//↑<DIC_BANK>

//***********************************************************************************************************/
//***********************************************************************************************************/
{↓<DIC_BANK>銀行辞書Exp対応にて作り変え。
function	TJNTCRP008002f.fnCheckValidBranchCode (nAllBankCode: Integer; nBranchCode: Integer;
													var strDescription: String; var strKanaDesc: String): Boolean;
var
	dqCommonData: TMQuery;

begin
	strDescription	:= '';
	strKanaDesc		:= '';

	dqCommonData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBCommon, dqCommonData);							// DBとMQueryの接続

	with (dqCommonData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK_OFFICE WHERE BankCD = :nAllBankCode AND BankOfficeCD = :nBranchCode');

		ParamByName ('nAllBankCode').AsInteger	:= nAllBankCode;
		ParamByName ('nBranchCode' ).AsInteger	:= nBranchCode;

		Open ();

		if	(EOF) then
		begin
			dqCommonData.Close ();
			dqCommonData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('BankOffice').AsString;
		strKanaDesc		:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankOffice').AsString);
	end;

	dqCommonData.Close ();
	dqCommonData.Free  ();

	Result	:= TRUE;
end;
↑<DIC_BANK>}
//↓<DIC_BANK>銀行辞書Exp対応にて作り変え。CMN_BANK_OFFICEはみない。
function	TJNTCRP008002f.fnCheckValidBranchCode (nAllBankCode: Integer; nBranchCode: Integer;
													var strDescription: String; var strKanaDesc: String): Boolean;
var
	iRtn		: Integer;
	sBankName	: string;
	sBankKana	: string;
	sOfficeName	: string;
	sOfficeKana	: string;
begin
	strDescription	:= '';
	strKanaDesc		:= '';


	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_MASTERCHECK);
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK); //<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			iRtn:=fnCMNBankShow(	nAllBankCode,
									nBranchCode,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);

			//呼出失敗
			if(iRtn=-1)then
			begin
				Abort;
			end;

			//選択せず終了
			if(iRtn<>1)then
			begin
				Result	:= FALSE;
				Exit;
			end;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

	strDescription	:= sOfficeName;
	strKanaDesc		:= fnExchangeCharacterKanaDesc (sOfficeKana);

	Result	:= TRUE;
end;
//↑<DIC_BANK>

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidDepDivision (nDepDivision: Integer): Boolean;
var
	nWrkDivision: Integer;
	nCount		: Integer;
	nPosition	: Integer;

begin
	for	nCount := 0 to Length (_DepositItems) - 1 do
	begin
		nWrkDivision	:= 0;

		for	nPosition := 1 to StrLen (PChar (_DepositItems [nCount])) do
		begin
			if	(Copy (_DepositItems [nCount], nPosition, 1) = ':') then
			begin
				nWrkDivision	:= StrToInt (Copy (_DepositItems [nCount], 1, nPosition - 1));
				Break;
			end;
		end;

		if	(nWrkDivision = nDepDivision) then
		begin
			Result	:= TRUE;
			Exit;
		end;
	end;

	Result	:= FALSE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidFundCode (cNumEdit: TMNumEdit; var strDescription: String): Boolean;
var
	dqMasterData: TMQuery;

begin
	strDescription	:= '';

	if	(cNumEdit.AsInteger = 0) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SimpleName FROM SKmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 3 AND RdelKbn = 0 AND SumKbn = 0 AND GCode = :nExCode');

		ParamByName ('nExCode').AsInteger	:= cNumEdit.AsInteger;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
// <063> MOD start
//function	TJNTCRP008002f.fnCheckValidHojCode (nMasterDivision: Integer; strHojCode: String; var strDescription: String): Boolean;
function	TJNTCRP008002f.fnCheckValidHojCode (nMasterDivision: Integer;
												strHojCode: String;
                                                var strDescription: String;
                                                exNCode : Extended): Boolean;
// <063> MOD end
var
	dqMasterData: TMQuery;
///	nMasterWork	: Integer;

begin

///	nMasterWork	:= nMasterDivision;

	strDescription	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
        if nMasterDivision = MASTER_CUSTOMER then //取引先
        begin
    		SQL.Add   ('SELECT NMK SimpleName FROM MTOKUI ');
// <086> MOD-STR
//    		SQL.Add   ('WHERE  SumKbn = 0 AND RDelKbn = 0 AND GCode = :strHojCode');
    		SQL.Add   ('WHERE  SumKbn = 0 AND RDelKbn = 0 AND GCode = :strHojCode AND TemplateKbn <> 1');
// <086> MOD-END
            ParamByName ('strHojCode'     ).AsString	:= strHojCode;
        end
        else if nMasterDivision = MASTER_STAFF then //社員
        begin
    		SQL.Add   ('SELECT SimpleName  ');
    		SQL.Add   ('FROM   HAPSC sc LEFT OUTER JOIN MOS_OFFICE_STAFF st ');
// <107> MOD-STR
//    		SQL.Add   ('ON     sc.CorpNCode = st.NCODE ');
    		SQL.Add   ('ON     sc.NCode = st.NCODE ');
// <107> MOD-END
    		SQL.Add   ('Where  st.RDelKbn = 0 AND sc.GCode = :strHojCode  ');
            ParamByName ('strHojCode'     ).AsString	:= strHojCode;
        end
        else
        begin
            SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :strHojCode');
// <063> ADD start
			if nMasterDivision = MASTER_SECTION	then// 部門
            begin
            	SQL.Add(' AND NCode = :parNCode'	+
                		' ORDER BY GCode, TStartDate desc, InsDateTM desc');
                        							// 部門の場合は同一のｺｰﾄﾞが存在するため内部ｺｰﾄﾞを指定する
                ParamByName ('parNCode').AsFloat := exNCode;
            end;
// <063> ADD end

            ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
            ParamByName ('strHojCode'     ).AsString	:= strHojCode;
        end;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close  ();
	dqMasterData.Free	();

	Result	:= TRUE;																	// ﾁｪｯｸOK
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidHojCodeEx (nPosition: Integer; strHojCode: String;nMasterKbn:Integer; var strDescription: String): Boolean;
var
	dqMasterData: TMQuery;
    nPrjNCode   : Extended;     // <044>
    iPartKbn    : Integer;      // <044>
    strKojCode  : String;       // <044>

begin
	strDescription	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        if nMasterKBN = MASTER_CUSTOMER then //取引先
        begin
    		SQL.Add   ('SELECT NMK SimpleName FROM MTOKUI ');
// <086> MOD-STR
//    		SQL.Add   ('WHERE  SumKbn = 0 AND RDelKbn = 0 AND GCode = :strHojCode');
    		SQL.Add   ('WHERE  SumKbn = 0 AND RDelKbn = 0 AND GCode = :strHojCode AND TemplateKbn <> 1');
// <086> MOD-END
        end
        else if nMasterKBN = MASTER_STAFF then //社員
        begin
    		SQL.Add   ('SELECT SimpleName  ');
    		SQL.Add   ('FROM   HAPSC sc LEFT OUTER JOIN MOS_OFFICE_STAFF st ');
// <107> MOD-STR
//    		SQL.Add   ('ON     sc.CorpNCode = st.NCODE ');
    		SQL.Add   ('ON     sc.NCode = st.NCODE ');
// <107> MOD-END
    		SQL.Add   ('Where  st.RDelKbn = 0 AND sc.GCode = :strHojCode  ');
        end
        else
        begin
            SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
            SQL.Add   ('WHERE  ' + fnGetSQLConstHojyoMAWhere (nPosition) + ' AND GCode = :strHojCode');
// <051> ADD-STR
            if (nMasterKBN = MASTER_SECTION) or     // 部門
              ((MASTER_SEGMENT_Str <= nMasterKBN) and (nMasterKBN <= MASTER_SEGMENT_End)) then  // ｾｸﾞﾒﾝﾄの範囲
                SQL.Add   (' AND HojyoKbn2 in (1,2)');
// <051> ADD-END

// <063> ADD start
			if nMasterKBN = MASTER_SECTION then		// 部門
            begin
            										// 数字属性
            	if (CmnEdit03016BumCodeNumeric.TagStr <> '') and (CmnEdit03016BumCodeNumeric.Visible) then
                begin                               // 部門の場合は同一ｺｰﾄﾞが存在するため内部ｺｰﾄﾞを指定する
                	SQL.Add(' AND NCode =' +  CmnEdit03016BumCodeNumeric.TagStr);
                end
                									// ﾌﾘｰ属性
                else if (CmnEdit03016BumCodeFree.TagStr <> '') and (CmnEdit03016BumCodeFree.Visible) then
				begin								// 部門の場合は同一ｺｰﾄﾞが存在するため内部ｺｰﾄﾞを指定する
                 	SQL.Add(' AND NCode =' +  CmnEdit03016BumCodeFree.TagStr);
                end;
                                               		// 入力時は最新の部門を取得する
                SQL.Add(' ORDER BY GCode, TStartDate desc, InsDateTM desc');
            end;
// <063> ADD end
        end;

// <044> 2006/12/21 H.Kawato Add Start
        nPrjNCode   := 0;
        iPartKbn    := 0;

        if (nMasterKBN >= 301) and (nMasterKBN <= 310) then // プロジェクトサブ
        begin
            if  (m_arCodeAttribute [5].nAttribute <= 1) then
            begin
                if	(CmnEdit03020PrjCodeNumeric.InputFlag) then
            	    strKojCode	:= ''
                else
            	    strKojCode	:= fnGetDspData(Format ('%.16d', [Trunc (CmnEdit03020PrjCodeNumeric.Value)]),m_arCodeAttribute [5].nAttribute);
            end
            else
                strKojCode	:= fnGetDspData(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nAttribute);

            // プロジェクト内部コード取得
            nPrjNCode   := GetPrjNCode (m_arCodeAttribute [5].nMasterDivision, strKojCode);

            // 工種管理区分チェック
            if nPrjNCode <> 0 then
                iPartKbn  := GetKojiPartKbn (m_arCodeAttribute [5].nMasterDivision, nPrjNCode);

            if  (iPartKbn = 2) then
            begin
                SQL.Add   (' AND HojyoMA.NCode in (');
                SQL.Add   (' SELECT KsyNCode FROM KousyuPtn');
                SQL.Add   (' INNER JOIN  KojiInfo');
                SQL.Add   (' ON KousyuPtn.PtnNCode = KojiInfo.PtnNCode');
                SQL.Add   (' AND KojiInfo.MasterKbn = :nPrjMasterKbn');
                SQL.Add   (' AND KojiInfo.NCode = :nPrjNCode');
                SQL.Add   (' WHERE KousyuPtn.MasterKbn = :nPjSMasterKbn )');
            end;
        end;
// <044> 2006/12/21 H.Kawato Add End

		ParamByName ('strHojCode').AsString	:= strHojCode;

// <044> 2006/12/21 H.Kawato Add Start
        if  (iPartKbn = 2) then
        begin
    		ParamByName ('nPrjNCode').AsFloat	    := nPrjNCode;
    		ParamByName ('nPrjMasterKbn').AsInteger	:= m_arCodeAttribute [5].nMasterDivision;
    		ParamByName ('nPjSMasterKbn').AsInteger	:= m_arCodeAttribute [6].nMasterDivision;
        end;
// <044> 2006/12/21 H.Kawato Add End

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close  ();
	dqMasterData.Free	();

	Result	:= TRUE;																	// ﾁｪｯｸOK
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidKanaDesc (strDescription: String): Boolean;
var
	nPosition	: Integer;
	chComparison: Char;

begin
	for	nPosition := 1 to StrLen (PChar (strDescription)) do
	begin
		chComparison	:= strDescription [nPosition];

		case (chComparison) of
			'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')':
				begin
				end;
			else
				begin
					Result	:= FALSE;
					Exit;
				end;
		end;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidKmkCode (nKmkCode: Integer; var strDescription: String): Boolean;
var
	dqMasterData: TMQuery;

begin
//↓<MLXHAP>MLX給与のときは、Trueで抜けます。
	if TMSeries.IsMjsLink3 then
	begin
    	Result := True;
		Exit;
	end;
//↑<MLXHAP>

	strDescription	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SimpleName FROM KmkMA ');
		SQL.Add   ('WHERE ' + fnGetSQLConstKmkMAWhere () + ' AND GCode = :nKmkCode');

		ParamByName ('nKmkCode').AsInteger	:= nKmkCode;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close  ();
	dqMasterData.Free	();

	Result	:= TRUE;																	// ﾁｪｯｸOK
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidKmsCode (nKmkCode: Integer; nKmsCode: String; var strDescription: String): Boolean;
var
	dqMasterData: TMQuery;
begin
	strDescription	:= '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SimpleName FROM KmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 2 AND ');
		SQL.Add   ('       SumKbn = 0 AND RdelKbn = 0 AND GCode = :nKmkCode AND SubCode = :nKmsCode');

		ParamByName ('nKmkCode').AsInteger	:= nKmkCode;
		ParamByName ('nKmsCode').AsString	:= nKmsCode;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close  ();
	dqMasterData.Free	();

	Result	:= TRUE;																	// ﾁｪｯｸOK
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidRecordAccInfo (nNCODE:Extended;nAccountCode: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	if	(nAccountCode = 0) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode FROM AccInfo ');
        SQL.Add   ('WHERE RdelKbn = 0');
        SQL.Add   ('And   GCode = :nAccountCode ');
//        SQL.Add   ('And   GCode = :nAccountCode AND BankNCode = :nNCODE');

		ParamByName ('nAccountCode').AsInteger	:= nAccountCode;
//		ParamByName ('nNCode').AsFloat      	:= nNCode;

		Open ();

		if  (not EOF) then
			Result	:= FALSE
		else
			Result	:= TRUE;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnCheckValidRecordHojyoMA (nBKCode: Integer;nBrCode: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM BankInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision ');
        SQL.Add   ('AND RdelKbn = 0 ');
        SQL.Add   ('AND AllBKCode = :nBkCode and AllBraCode = :nBrCode');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('nBkCode'    ).AsInteger    	:= nBkCode;
		ParamByName ('nBrCode'    ).AsInteger	    := nBrCode;

		Open ();

		if  (not EOF) then
			Result	:= FALSE
		else
			Result	:= TRUE;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCreateTreeViewItems (cNodeSrc: TTreeNode);
var
	dqMasterData: TMQuery;
	cNode		: TTreeNode;
	pItemRecSrc	: ^TreeViewRec;
	pItemRec	: ^TreeViewRec;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	pItemRecSrc	:= cNodeSrc.Data;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT AllBkCode,AllBraCode,BkBraName ');
        SQL.Add   ('FROM BankInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision ');
        SQL.Add   (' AND RdelKbn = 0 and AllBkCode = :nBKCODE ');
        SQL.Add   ('ORDER BY AllBraCode Desc ');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('nBKCODE').AsInteger	:= pItemRecSrc^.nBkCode;

		Open ();

		while (not EOF) do
		begin
			New (pItemRec);

			pItemRec^.nItemDivision	:= 2;
			pItemRec^.nBkCode		 := pItemRecSrc^.nBkCode;
			pItemRec^.nBrCode		 := FieldByName('AllBraCode').asInteger;
			pItemRec^.strDescription := FieldByName('BkBraName').asString;

			cNode	:= CmnTreeView.Items.AddChildObjectFirst (cNodeSrc, pItemRec^.strDescription, pItemRec);

			cNode.ImageIndex	:= pItemRec^.nItemDivision;
			cNode.SelectedIndex	:= pItemRec^.nItemDivision + 3;

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnDeleteRecord (nBkCode,nBrCode ,nAccountCode: Integer;nNCODE:Extended): Boolean;
begin
	m_cDataModule.BeginTran (m_cDBSelect);

	if	(nAccountCode = -1) then
	begin

		if	(not fnDeleteRecordHojyoMA (nBkCode,nBrCode)) then 								// 補助基本ﾏｽﾀ 更新
		begin
			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)

			Result	:= FALSE;
			Exit;
		end;
	end
	else
	begin
		if	(not fnDeleteRecordAccInfo (nAccountCode,nNCODE)) then 							// 口座管理情報 更新
		begin
			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)

			Result	:= FALSE;
			Exit;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)

	if	(nAccountCode = -1) then
		fnRebuildGridBankInfo ()
	else
	begin
//		fnRebuildGridAccInfo (nBkCode);
		fnRebuildGridAccInfo (nNCODE);
	end;

	fnDeleteTreeViewItems (nBkCode, nAccountCode);

	Result	:= TRUE;																	// 正常終了
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnDeleteRecordAccInfo (nAccountCode: Integer;nNCODE:Extended): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('Delete From AccInfo  ');
        SQL.Add   (' WHERE RdelKbn = 0 AND GCode = :nAccountCode');
        SQL.Add   (' AND BankNCODE = :nNCode');

		ParamByName ('nAccountCode').AsInteger	:= nAccountCode;
		ParamByName ('nNCODE').AsFloat      	:= nNCODE;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnDeleteRecordHojyoMA (nBkCode,nBrCode: Integer): Boolean;
var
	dqMasterData: TMQuery;
	nInCode		: Extended;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	nInCode	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM BankInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
        SQL.Add   (' AND   AllBkCode = :nBkCode AND AllBraCode = :nBrCode');

		ParamByName ('nMasterDivision').AsInteger  := MASTER_BANK;
		ParamByName ('nBkCode'    ).AsInteger	   := nBkCode;
		ParamByName ('nBrCode'    ).AsInteger	   := nBrCode;

		Open ();

		if	(not EOF) then
			nInCode	:= FieldByName ('NCode').AsInteger;

		Close ();

		SQL.Clear ();
		SQL.Add   ('UPDATE BankInfo SET RdelKbn = 1, UpdTantoNCode = :nUpdTantoNCode ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
        SQL.Add   (' AND   AllBkCode = :nBkCode AND AllBraCode = :nBrCode');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('nBkCode'    ).AsInteger	   := nBkCode;
		ParamByName ('nBrCode'    ).AsInteger	   := nBrCode;
		ParamByName ('nUpdTantoNCode').AsCurrency  := TantoNCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;
//↓<MLXHAP>MLXでないときに、FeeInfoにアクセスする。
		if not TMSeries.IsMjsLink3 then
		begin
//↑<MLXHAP>下記、字下げ。
            Close ();

            SQL.Clear ();
            SQL.Add   ('Delete From  FeeInfo  ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
            SQL.Add   (' AND   BankNCode = :nCode');

            ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
            ParamByName ('nCode'    ).AsFloat           := nInCode;

            if	(not ExecSQL ()) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

                dqMasterData.Close ();
                dqMasterData.Free  ();

                Result	:= FALSE;
                Exit;
            end;
//↓<MLXHAP>
		end;
//↑<MLXHAP>
		Close ();

		SQL.Clear ();
		SQL.Add   ('Delete From AccInfo ');
		SQL.Add   ('WHERE  RdelKbn = 0 ');
        SQL.Add   (' AND   BankNCode = :nCode ');

		ParamByName ('nCode'    ).AsFloat           := nInCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnDeleteTreeViewItems (nBkCode: Integer; nAccountCode: Integer);
var
	nCount: Integer;																	// ｶｳﾝﾀｰ

begin
	for	nCount := 0 to CmnTreeView.Items.Count - 1 do
	begin
		if	((PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBrCode = nAccountCode) and
			 (CompareStr (IntToStr(PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBkCode), IntToStr(nBkCode)) = 0)) then
		begin
			Dispose (CmnTreeView.Items [nCount].Data);

			CmnTreeView.Items [nCount].Delete ();
			Break;
		end;
	end;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnExchangeCharacterKanaDesc (strDescription: String): String;
var
	nPosition	   : Integer;
	strExchangeChar: String;
	chExchange	   : Char;

begin
	strExchangeChar	:= '';

	for	nPosition := 1 to StrLen (PChar (strDescription)) do
	begin
		chExchange	:= strDescription [nPosition];

		case (chExchange) of
			Char (VK_BACK),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')' :
					begin
						strExchangeChar	:= strExchangeChar + chExchange;
					end;
			'ｧ':		strExchangeChar	:= strExchangeChar + 'ｱ';
			'ｨ':		strExchangeChar	:= strExchangeChar + 'ｲ';
			'ｩ':		strExchangeChar	:= strExchangeChar + 'ｳ';
			'ｪ':		strExchangeChar	:= strExchangeChar + 'ｴ';
			'ｫ':		strExchangeChar	:= strExchangeChar + 'ｵ';
			'ｬ':		strExchangeChar	:= strExchangeChar + 'ﾔ';
			'ｭ':		strExchangeChar	:= strExchangeChar + 'ﾕ';
			'ｮ':		strExchangeChar	:= strExchangeChar + 'ﾖ';
			'ｯ':		strExchangeChar	:= strExchangeChar + 'ﾂ';
			'{':		strExchangeChar	:= strExchangeChar + '(';
			'[':		strExchangeChar	:= strExchangeChar + '(';
			'}':		strExchangeChar	:= strExchangeChar + ')';
			']':		strExchangeChar	:= strExchangeChar + ')';
			'ｰ':		strExchangeChar	:= strExchangeChar + '-';
			'a'..'z':	strExchangeChar	:= strExchangeChar + Chr (Ord (chExchange) - 32);
		end;
	end;

	Result	:= strExchangeChar;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetAdoptInformation (nMasterDivision: Integer; var strDescription: String;
						var nCodeDigit: Integer; var nCodeAttribute: Integer; var nAdoption: Integer): Boolean;
var
	nItemPosition: Integer;
	nMasterWork	 : Integer;

begin
	nMasterWork	:= nMasterDivision;
   
	if	((nMasterDivision = MASTER_CUSTOMERPLUS01) or
		 (nMasterDivision = MASTER_CUSTOMERPLUS02)) then
		nMasterDivision	:= MASTER_CUSTOMER;

	nAdoption		:= 0;
	nCodeDigit		:= 6;
	nCodeAttribute	:= 0;
	strDescription	:= '';

	for nItemPosition := 0 to 15 do
	begin
		if  (m_arAdoptInfo [nItemPosition].nMasterDivision = nMasterDivision) then
		begin
			nAdoption		:= m_arAdoptInfo [nItemPosition].nAdoption;
			nCodeDigit		:= m_arAdoptInfo [nItemPosition].nCodeDigit;
			nCodeAttribute	:= m_arAdoptInfo [nItemPosition].nCodeAttribute;
			strDescription	:= m_arAdoptInfo [nItemPosition].strDescription;

			if	(nMasterWork = MASTER_CUSTOMERPLUS01) then
				strDescription	:= '得意先'
			else if	(nMasterWork = MASTER_CUSTOMERPLUS02) then
				strDescription	:= '仕入先';

			Result	:= TRUE;
			Exit;
		end;
	end;

	Result	:= FALSE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetBitmapSelectedTag (nSelectedTag: Integer): TBitmap;
var
	bmpTag: TBitmap;

begin
	bmpTag	:= nil;

	case (nSelectedTag) of
		1:	bmpTag	:= CmnPopupMenuTreeViewTag01.Bitmap;
		2:	bmpTag	:= CmnPopupMenuTreeViewTag03.Bitmap;
        3:	bmpTag	:= CmnPopupMenuTreeViewTag02.Bitmap;
		4:	bmpTag	:= CmnPopupMenuTreeViewTag04.Bitmap;
	end;

	Result	:= bmpTag;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetDescriptionSelectedItem (cNumEdit: TMNumEdit; var strDescription: String): Boolean;
var
	nPosition: Integer;

begin
	strDescription	:= '';

	nPosition	:= fnGetIndexSelectItem (cNumEdit);

	if	(nPosition = -1) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	strDescription	:= cNumEdit.SelectItems.Strings [nPosition];

	for	nPosition := 1 to StrLen (PChar (strDescription)) do
	begin
		if	(Copy (strDescription, nPosition, 1) = ':') then
		begin
			strDescription	:= Copy (strDescription, nPosition + 2, 256);
			Break;
		end;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetDivisionSelectedTag (nExCode: Integer): Integer;
var
	dqMasterData: TMQuery;
	nTagDivision: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	nTagDivision	:= 0;

{	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND HojyoCode = :strExCode ');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strExCode'      ).AsInteger	:= nExCode;

		Open ();

		if	(not EOF) then
			nTagDivision	:= FieldByName ('FusenKbn').AsInteger;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
}
	Result	:= nTagDivision;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetEditedAccountNumber (strAccountNo: String): String;
var
	nAccountNo: Int64;

begin
	if	(Trim (strAccountNo) = '') then
	begin
		Result	:= '';
		Exit;
	end;

	nAccountNo	:= StrToInt64 (Trim (strAccountNo));
{ <067> ↓
	if	(nAccountNo = 0) then
	begin
		Result	:= '';
		Exit;
	end;
<067> ↑}

(* <024>
	if	(nAccountNo > 9999999) then
		strAccountNo	:= IntToStr (nAccountNo)
	else
		strAccountNo	:= Format ('%.7d', [nAccountNo]);
*)

	// <067> Start
   // strAccountNo	:= Format ('%.8d', [nAccountNo]);
{
    if	(nAccountNo > 9999999) then
		strAccountNo	:= IntToStr (nAccountNo)
	else
		strAccountNo	:= Format ('%.7d', [nAccountNo]);
}

    if	(Length(Trim(strAccountNo)) < 8) then
		strAccountNo	:= Format ('%.7d', [nAccountNo]);

    // <067> End

	Result	:= strAccountNo;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetEditedClientCode (strClientCode: String): String;
var
	nClientCode: Int64;

begin
// <105> ADD-STR
    // 依頼人コード「0000000000」は認める(ジャパンネット銀行対応)
    if (Trim (strClientCode) = StringOfChar('0', 10)) then
    begin
        Result	:= Trim (strClientCode);
		Exit;
    end;
// <105> ADD-END

	if	(Trim (strClientCode) = '') then
	begin
		Result	:= '';
		Exit;
	end;

	nClientCode	:= StrToInt64 (Trim (strClientCode));

	if	(nClientCode = 0) then
	begin
		Result	:= '';
		Exit;
	end;

	Result	:= Format ('%.10d', [nClientCode]);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnGetEntryOrderClosingDays (var arEntryOrder: array of Integer);
var
	arValues   : array [0..2] of Integer;
	nCountPlus : Integer;
	nCountMinus: Integer;

begin
	for	nCountPlus := 0 to 2 do
	begin
		arEntryOrder [nCountPlus]	:= 0;
		arValues     [nCountPlus]	:= Trunc (TMNumEdit (MJSFindCtrl (
												Self, Format ('CmnEditClosingDay%.2d', [nCountPlus + 1]))).Value);

		if	(arValues [nCountPlus] = 0) then
			arValues [nCountPlus]	:= 999;
	end;

	if	(arValues [0] <= arValues [1]) then
	begin
		arEntryOrder [0]	:= 1;
		arEntryOrder [1]	:= 2;
	end
	else
	begin
		arEntryOrder [0]	:= 2;
		arEntryOrder [1]	:= 1;
	end;

	for	nCountPlus := 0 to 1 do
	begin
		if	(arValues [2] <= arValues [arEntryOrder [nCountPlus] - 1]) then
		begin
			for	nCountMinus := 2 downto nCountPlus + 1 do
				arEntryOrder [nCountMinus]	:= arEntryOrder [nCountMinus - 1];

			arEntryOrder [nCountPlus]	:= 3;

			Break;
		end;
	end;

	if	(arEntryOrder [2] = 0) then
		arEntryOrder [2]	:= 3;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetFieldNameStandardFee (nPosition: Integer): String;
var
	nCount		: Integer;
	strFieldName: String;

begin
	strFieldName	:= '';

	for	nCount := 1 to StrLen (PChar (_StandardFee [nPosition])) do
	begin
		if	(Copy (_StandardFee [nPosition], nCount, 1) = '=') then
		begin
			strFieldName	:= Copy (_StandardFee [nPosition], 1, nCount - 1);
			Break;
		end;
	end;

	Result	:= strFieldName;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetFieldValueStandardFee (nPosition: Integer): Integer;
var
	nCount	   : Integer;
	nFieldValue: Integer;

begin
	nFieldValue	:= 0;

	for	nCount := 1 to StrLen (PChar (_StandardFee [nPosition])) do
	begin
		if	(Copy (_StandardFee [nPosition], nCount, 1) = '=') then
		begin
			nFieldValue	:= StrToInt (Copy (_StandardFee [nPosition], nCount + 1, 256));
			Break;
		end;
	end;

	Result	:= nFieldValue;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetGuideComment (nFieldID: Integer): String;
var
	strComment: String;

begin
	strComment	:= '';

	case (nFieldID) of
		1001:		strComment	:= '＜0：なし 1：自社負担 2：自社／他社負担＞' +
								   #13#10'　銀行ごとに設定した振込手数料を適用するかどうかを選択します。';
		1002:		strComment	:= '　手数料計算基準金額の範囲として、「～円未満」の金額を入力します。';
		1003:		strComment	:= '　他銀行（電信）への振込手数料を入力します。';
		1004:		strComment	:= '　他銀行（文書）への振込手数料を入力します。';
		1005:		strComment	:= '　同銀行他支店への振込手数料を入力します。';
		1006:		strComment	:= '　同銀行同支店への振込手数料を入力します。';
		2007:		strComment	:= '＜0：F/B 1：振込依頼書＞';
		2008:		strComment	:= '＜0：JIS 1：EBCDIC＞';
		2009:		strComment	:= '＜0：なし 1：CR 2：CR/LF＞';
		2010, 2013:	strComment	:= '　FBファイルを出力するときのファイル名を入力します。ファイル名称は「A:\FB.dat」のようにフルパスで入力して下さい。' +
								   #13#10'　ボタンからも選択できます。';
		2011:		strComment	:= '　FBファイル作成時FDにつけるボリューム名称を入力します。';
		2012:		strComment	:= '＜0：送信しない 1：送信する＞' +
								   #13#10'　支払処理でFBファイル作成を行う時にバンキングシステムと連動し直接送信を行うかどうかを選択します。' +
								   #13#10'　送信しない場合は「ファイル名称」で設定した場所にFBファイルを作成します。';
		2014:		strComment	:= '　経費精算システムでFBファイル作成時につけるボリューム名称を入力します。';
		3001:		strComment	:= '　手形印刷時に使用するレイアウトファイル名を入力します。' +
								   #13#10'　ボタンからも選択できます。';
		3002:		strComment	:= '＜0：縦縞 1：斜縞 2：漢数字 3：縦縞（狭）4：斜縞（狭）＞' +
								   #13#10'　手形金額に使用する文字の種別を選択します。';
		3003:		strComment	:= '　小切手印刷時に使用するレイアウトファイル名を入力します。' +
								   #13#10'　ボタンからも選択できます。';
		3004:		strComment	:= '＜0：縦縞 1：斜縞 2：漢数字 3：縦縞（狭）4：斜縞（狭）＞' +
								   #13#10'　小切手金額に使用する文字の種別を選択します。';
		4002, 5003:	strComment	:= '＜1：普通 2：当座 4: 貯蓄 9：その他＞';
	end;

	Result	:= strComment;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetIndexSelectItem (cNumEdit: TMNumEdit): Integer;
var
	nPickNo	 : Integer;
	nCount	 : Integer;
	nPosition: Integer;

begin
	for	nPosition := 0 to cNumEdit.SelectItems.Count - 1 do
	begin
		nPickNo	:= -1;

		for	nCount := 1 to StrLen (PChar (cNumEdit.SelectItems.Strings [nPosition])) do
		begin
			if	(Copy (cNumEdit.SelectItems.Strings [nPosition], nCount, 1) = ':') then
			begin
				nPickNo	:= StrToInt (Trim (Copy (cNumEdit.SelectItems.Strings [nPosition], 1, nCount - 1)));
				Break;
			end;
		end;

		if	(cNumEdit.AsInteger = nPickNo) then
		begin
			Result	:= nPosition;
			Exit;
		end;
	end;

	Result	:= -1;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetSQLConstKmkMAWhere (): String;
var
	strSQLConst: String;

begin
	strSQLConst	:= 'MasterKbn = 1 AND ' +												// ﾏｽﾀ区分       : 1=勘定科目
				   'SumKbn    = 0 AND ' +												// 実在/合計区分 : 0=実在
				   'RdelKbn = 0 AND ' +												// ﾚｺｰﾄﾞ区分     : 0=正規ﾚｺｰﾄﾞ
				   'SubCode   = 0 AND ' +												// 科目別補助ｺｰﾄﾞ:
// <#1-DEL>                   'AnalyzeCode >= 2 AND AnalyzeCode <= 9';								// 分析ｺｰﾄﾞ
//<#1-ADD-STR>
//<085>Del 'AnalyzeCode >= 2 AND AnalyzeCode <= 9' +		// 分析ｺｰﾄﾞ
// <093> MOD-STR
//         '(AnalyzeCode >= 2 AND AnalyzeCode <= 9 OR AnalyzeCode = 38)' +		//<085>-Add 分析ｺｰﾄﾞ
           '(AnalyzeCode >= 2 AND AnalyzeCode <= 9 OR AnalyzeCode = 38' + m_sAddCharCode + ')' +
// <093> MOD-END
// <032>DEL          ' and InputKbn <> 9 ';                       // 仕訳入力区分 : 入力不可でないもの
//<#1-ADD-END>

// <032>↓資金複合を除く
            ' AND InputKbn <> 9 '+                       // 仕訳入力区分 : 入力不可でないもの
            ' AND NCode NOT IN (SELECT NCode FROM KmkInfo WHERE SpeCode = 10302)';
// <032>↑

	Result	:= strSQLConst;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnGetSQLConstHojyoMAWhere (nPosition: Integer): String;
var
	nMasterDivision: Integer;
	strSQLConst	   : String;

begin
	if	((m_arCodeAttribute [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS01) or
		 (m_arCodeAttribute [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS02)) then
		nMasterDivision	:= MASTER_CUSTOMER
	else
		nMasterDivision	:= m_arCodeAttribute [nPosition].nMasterDivision;

	strSQLConst	:= 'MasterKbn = ' +	IntToStr (nMasterDivision) + ' AND ' +
				   'SumKbn    = 0 AND ' +												// 実在/合計区分 : 0=実在
				   'RdelKbn = 0';														// ﾚｺｰﾄﾞ区分     : 0=正規ﾚｺｰﾄﾞ

{	if	((m_arCodeAttribute [nPosition].nMasterDivision = MASTER_SECTION  ) or			// 部門
		 (m_arCodeAttribute [nPosition].nMasterDivision = MASTER_SEGMENT01)) then		// ｾｸﾞﾒﾝﾄ1
	begin
		case (m_arCodeAttribute [nPosition].nClassCode) of
			0:	strSQLConst	:= strSQLConst + ' AND HojyoKbn2 <> 2';
			2:	strSQLConst	:= strSQLConst + ' AND HojyoKbn2 <> 0';
		end;
	end
	else if	(m_arCodeAttribute [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS01) then
		strSQLConst	:= strSQLConst + ' AND HojyoKbn1 = 1';

}
	Result	:= strSQLConst;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeCheckItems ();
var
	pCheckItem: PCheckItemRec;
	nItems	  : Integer;

begin
	m_cCheckItems	:= TList.Create ();

	for nItems := 0 to ITEMS_COUNT - 1 do
	begin
		New (pCheckItem);

		pCheckItem^.nFieldID	:= _CheckItems [nItems];
		pCheckItem^.fNoCheck	:= FALSE;
		pCheckItem^.fChangeData	:= FALSE;

		m_cCheckItems.Add (pCheckItem);
	end;
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeComInformation ();
var
	dqMasterInfo: TMQuery;
//	cMessageRec : TMJSMsgRec;
begin
	m_nDateFormatDivision	:= 0;														// 和暦/西暦区分
	m_nMailAdoption			:= 0;														// ﾒｰﾙ会計処理区分
	m_strValidCharacters	:= '';														// 使用可能ｺｰﾄﾞ

	dqMasterInfo	:= TMQuery.Create (Self);									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);							// DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		Close ();

		SQL.Clear ();
// <TX26> MOD-STR
//		SQL.Add   ('SELECT YearKbn, DTName7,ComKbn2 FROM DTMAIN');
		SQL.Add   ('SELECT YearKbn, DTName7,ComKbn2, KEdDate FROM DTMAIN');
// <TX26> MOD-END

		Open ();

		if	(not EOF) then
		begin
			m_nDateFormatDivision	:= FieldByName ('YearKbn').AsInteger;				// 和暦/西暦区分
			m_strValidCharacters	:= FieldbyName ('DTName7').AsString;				// 使用可能ｺｰﾄﾞ

            if FieldByName ('ComKbn2').AsInteger = 1 then
// <055> MOD start
//				m_nReferMode	:= REFER;
   			begin
            	m_nReferMode := REFER;
				m_bDelete := False;  													// <055> ADD 削除不可
            end;
// <055> MOD end
// <TX26> ADD-STR
            if (m_nDateFormatDivision = 0) then 	//和暦
            begin
                CmnEdit01049StartYMD.DateFormat := MjsEdits.dfEMD;														// <097> MOD コントロール名変更
                CmnEdit01049StartYMD.Gengou	 := MjsDateCtrl.MjsGetGengou(FieldByName('KEdDate').AsDateTime, MdtCMP_YM);	// <097> MOD コントロール名変更
            end
            else
            begin
                CmnEdit01049StartYMD.DateFormat := MjsEdits.dfYMD;	// <097> MOD コントロール名変更
                CmnEdit01049StartYMD.Gengou	 := #0;					// <097> MOD コントロール名変更
            end;
// <TX26> ADD-END
		end;

//↓<MLXHAP>MLXでないとき、下記を実行。
		if not TMSeries.IsMjsLink3 then
		begin
//↑<MLXHAP>以下、字下げ。
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT ComKbn3 FROM DTMAIN_MAS');

            Open ();

            if	(not EOF) then
            begin
                m_nMailAdoption			:= FieldByName ('ComKbn3').AsInteger;				// ﾒｰﾙ会計処理区分
            end;
//↓<MLXHAP>
		end;
//↑<MLXHAP>
	end;

	dqMasterInfo.Close ();
	dqMasterInfo.Free  ();

{	case (MailEntCheck (m_cDBSelect, m_cDataModule, m_cComArea, MASTER_BANK, 1)) of
		DISPOSE_SETTLE    :	m_nReferMode	:= REFER;									// 決算確定の為参照のみ
		DISPOSE_MAILNOTUSE:	m_nReferMode	:= NORMAL;									// ﾒｰﾙ未採用の為通常処理
		DISPOSE_USUALLY   :	m_nReferMode	:= NORMAL;									// 通常処理
		DISPOSE_BASIC     :	m_nReferMode	:= BASICONLY;								// 基本のみ設定可能
		DISPOSE_REFER     :	m_nReferMode	:= REFER;									// 参照のみ
	end;
}
{
//--- <#2> St -----
	// 排他制御
	if m_nReferMode <> REFER then	// 参照以外
	begin
		// 排他制御ﾁｪｯｸ
		if fnExcept = 99 then
		begin
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 10, 113);

			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle, cMessageRec.icontype,
													cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
			m_nReferMode := REFER
		end;
	end;
//--- <#2> Ed -----
}
// <055> ADD start
	if (not m_cJNTArea.IsModify) or (not m_cJNTArea.IsAppend) then
    begin
    	m_nReferMode := REFER;
    end;
// <055> ADD end


end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnInitializeFeeInformation (): Boolean;
var
	dqFeeInfo  : TMQuery;
	nPosition  : Integer;
	strSQLConst: String;

begin
//↓<MLXHAP>MLXのときはExit。
	if TMSeries.IsMjsLink3 then
	begin
        Result	:= TRUE;
		Exit;
	end;
//↑<MLXHAP>

    // 参照ﾓｰﾄﾞの場合は、Exitする<047>
    if (m_nReferMode = REFER) then
    begin
        Result	:= TRUE;
        Exit;
    end;

	dqFeeInfo	:= TMQuery.Create (Self);										// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqFeeInfo);							// DBとMQueryの接続

	with (dqFeeInfo) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT BankNCode FROM FeeInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu = 1');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strBankCode'    ).AsFloat  	:= _StandardKeyCode;

		Open ();

		if	(EOF) then
		begin

        	SessionPractice(C_ST_PROCESS);  	// <061> ADD

			strSQLConst	:= 'INSERT INTO FeeInfo (MasterKbn, BankNCode, RecSyubetu, UpdTantoNCode';	// <MAS 353>

			for	nPosition := 0 to Length (_StandardFee) - 1 do
				strSQLConst	:= strSQLConst + ', ' + fnGetFieldNameStandardFee (nPosition);

			strSQLConst	:= strSQLConst + ') VALUES (' + intToStr(MASTER_BANK)
                                                      + ',' + FloatToStr(_StandardKeyCode)
                                                      + ',1 '
                                                      + ',' + FloatToStr(TantoNCode)	// <MAS 353>
                                                      ;

			for	nPosition := 0 to Length (_StandardFee) - 1 do
				strSQLConst	:= strSQLConst + ', ' + IntToStr (fnGetFieldValueStandardFee (nPosition));

			strSQLConst	:= strSQLConst + ')';

			Close ();

			SQL.Clear ();
			SQL.Add   (strSQLConst);

			if	(not ExecSQL ()) then
			begin
				ShowMessage ('標準手数料の設定でｴﾗｰになりましたが気にせず進んで下さい。');

				dqFeeInfo.Close ();
				dqFeeInfo.Free  ();

				Result  := FALSE;

                SessionPractice(C_ED_PROCESS);	// <061> ADD

				Exit;
			end;

            SessionPractice(C_ED_PROCESS);		// <061> ADD
		end;
	end;

	dqFeeInfo.Close ();
	dqFeeInfo.Free  ();

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreen ();
begin
	CmnTreeView.Enabled	:= TRUE;
	CmnSplitter.Enabled	:= TRUE;

    CmnPanelClientStandard.Visible	:= TRUE;
    CmnPanelClientStandard.Enabled	:= TRUE;

	CmnPanelClientDetail.Enabled	:= TRUE;
	CmnPanelClientDetail.Visible	:= FALSE;

    fnRebuildGridBankInfo ();

    CmnGridHojyoMA.FocusedColumn	:= 1;
    CmnGridAccInfo.FocusedColumn	:= 1;

	fnRebuildTreeViewItems ();

    B_Syousai.Caption	:= '詳細(&T)';

    if m_nReferMode <> REFER then
    begin
        B_Syousai.Enabled := True;
        B_Delete .Enabled := m_cJNTArea.IsDelete;
// <054> MOD start
//    end;
    end
    else        							// 参照時は削除ボタンを無効にする
    begin
// <055> MOD start
//		B_Delete .Enabled := False;
    	if m_bDelete then                	// 決算確定でなく、グループ管理なしの場合
        begin
        									// 削除権限がある場合は、削除ボタンを有効にする
        	B_Delete.Enabled := m_cJNTArea.IsDelete;
        end
        else
        begin
			B_Delete .Enabled := False;
        end;
// <055> MOD end
    end;
// <054> MOD end

	B_CodeChange.Visible := False;	//<CDCHG>
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenAttribute ();
var
	nAdoption	  : Integer;
	nClass		  : Integer;
	nRow		  : Integer;
	strDescription: String;

begin

	fnGetAdoptInformation (MASTER_BANK, strDescription, m_nCurCodeDigit, m_nCurCodeAttribute, nAdoption);

//<004>	CmnGridHojyoMAColumnBkCode.MaxLength	    := m_nCurCodeDigit;
//<004>    CmnGridHojyoMAColumnBkCode.MaxLength  		:= m_nCurCodeDigit;

    CmnGridHojyoMAColumnBkCode.MaxLength	    := 4;   //<004>
    CmnGridHojyoMAColumnBkCode.Alignment		:= taRightJustify;
    CmnGridHojyoMAColumnBKCode.EditAlignment	:= taRightJustify;
    CmnGridHojyoMAColumnBkCode.ImeMode	   	    := imDisable;
    CmnGridHojyoMAColumnBkCode.Hankaku	    	:= FALSE;


    CmnGridHojyoMAColumnBtnBkCode.MaxLength	    := 4;
    CmnGridHojyoMAColumnBtnBkCode.Alignment		:= taRightJustify;
    CmnGridHojyoMAColumnBtnBKCode.EditAlignment	:= taRightJustify;
    CmnGridHojyoMAColumnBtnBkCode.ImeMode       := imDisable;
    CmnGridHojyoMAColumnBtnBkCode.Hankaku	   	:= FALSE;

    CmnEdit00001BkCode.Visible	:= TRUE;

	CmnGridHojyoMAColumnBKName.MaxLength	:= LENGTH_NAME_BANK;
	CmnEdit00003BkName        .MaxLength   	:= LENGTH_NAME_BANK;
	CmnEdit00005BrName        .MaxLength   	:= LENGTH_NAME_BANK;
	CmnMemDataHojyoMAName   .DisplayWidth	:= LENGTH_NAME_BANK;
	CmnMemDataHojyoMAName   .DisplayWidth	:= LENGTH_NAME_BANK;

	CmnTabBank    .BorderCaption		:= strDescription + '情報';

	for	nClass := 1 to 3 do
	begin
		for	nRow := 1 to 3 do
			TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, 1]))).Color	:= TJNTCRP008002f (Self).Color;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeMemDataAccInfo ();
var
	nDivision	  : Integer;
	nCount		  : Integer;
	nPosition	  : Integer;
	strDescription: String;

begin
	CmnMemDataAccInfoDeposit.Close ();
	CmnMemDataAccInfoDeposit.Open  ();

	for	nCount := 0 to Length (_DepositItems) - 1 do
	begin
		nDivision		:= 0;
		strDescription	:= '';

		for	nPosition := 1 to StrLen (PChar (_DepositItems [nCount])) do
		begin
			if	(Copy (_DepositItems [nCount], nPosition, 1) = ':') then
			begin
				nDivision		:= StrToInt (Copy (_DepositItems [nCount], 1, nPosition - 1));
				strDescription	:= Copy (_DepositItems [nCount], nPosition + 2, 256);
				Break;
			end;
		end;

		CmnMemDataAccInfoDeposit.Append ();

		CmnMemDataAccInfoDeposit.FieldByName ('nDivision'     ).AsInteger	:= nDivision;
		CmnMemDataAccInfoDeposit.FieldByName ('strDescription').AsString	:= strDescription;

		CmnMemDataAccInfoDeposit.Post ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnInitializeProcedure (): Boolean;
var
	dqMasterData : TMQuery;
	dqControl	 : TMQuery;
///	nChargeCode  : Integer;
	strChargeName: String;
///	fSelected	 : Boolean;

begin
///	nChargeCode		:= 0;
	strChargeName	:=	'';
///	fSelected		:= FALSE;

	dqMasterData	:= TMQuery.Create (Self);									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	if	(rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD <> -1) then						// 共通ﾒﾓﾘﾎﾟｲﾝﾀの担当者内部ｺｰﾄﾞ
	begin
		dqControl	:= TMQuery.Create (Self);		 							// MQueryの構築

		m_cDataModule.SetDBInfoToQuery (m_cDBCommon, dqControl);						// DBとMQueryの接続

{		with (dqControl) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT Name, TantoGCD FROM MOS_OFFICE_STAFF WHERE TantoNCD = :nInCode');

			ParamByName ('nInCode').AsInteger	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).TantoNCD;

			Open ();

			if	(not EOF) then
			begin
				nChargeCode		:= FieldByName ('TantoGCD').AsInteger;
				strChargeName	:= FieldByName ('Name'    ).AsString;
			end;
		end;
}
		dqControl.Close ();
		dqControl.Free  ();

///		fSelected	:= TRUE;
	end;

{	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('CALL MP200010 (0');

		if	(fSelected) then
			SQL.Add (Format (',%d,''%s''', [nChargeCode, strChargeName]));

		SQL.Add (')');

		if	(not ExecSQL ()) then
			ShowMessage ('ｴﾗｰｺｰﾄﾞ ' + IntToStr (m_cComArea.m_MsgStd.GetDBCode (dqMasterData)) +
													'　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
	end;
}
	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenDetails ();
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

//	CmnEdit00001BkCode.Value	    := 0;		 								// 全銀協銀行ｺｰﾄﾞ
//	CmnEdit00001BkCode.InputFlag	:= TRUE;
//	CmnEdit00002BrCode.Value	    := 0;		 								// 全銀協支店ｺｰﾄﾞ
//	CmnEdit00002BrCode.InputFlag	:= TRUE;
	CmnEdit00004BkKana.Text         := '';
	CmnEdit00006BrKana.Text         := '';
	CmnEdit00003BkName.Text         := '';
	CmnEdit00005BrName.Text         := '';
	CmnEdit00007NMK   .Text         := '';
	CmnEdit00008Renso .Text         := '';

	fnInitializeScreenDetailInfo ();
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenDetailInfo ();
var
	nClass: Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

//	for	nClass := 0 to 3 do
	for	nClass := 1 to 3 do
		fnInitializeScreenDetailInfo01 (nClass);
// <094> ADD-STR
    CmnEdit01044Densai1.Value := 0;			// <097> MOD コントロール名変更
    CmnEdit01045Densai2.Value := 0;			// <097> MOD コントロール名変更

    CmnEdit01050BiilRate.Value := 0;		// <097> MOD コントロール名変更
// <094> ADD-END
// <096> ADD↓
	CmnEdit01046Oversea1.Value := 0;
	CmnEdit01047Oversea2.Value := 0;
	CmnEdit01048Oversea3.Value := 0;
// <096> ADD↑

    CmnEdit01049StartYMD.Value := 0;       // <TX26> ADD	// <097> MOD コントロール名変更
	m_DateStartYMD := CmnEdit01049StartYMD.AsDateTime;		// <097> ADD 適用開始日変更判定用

	fnInitializeScreenDetailInfo02 ();
	fnInitializeScreenDetailInfo03 ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenDetailInfo01 (nClass: Integer);
var
	dqMasterData  : TMQuery;
	arBasedFee	  : array [1..3] of Extended;
	nRow		  : Integer;
	nColumn		  : Integer;
//	strDescription: String;

begin
//↓<MLXHAP>MLX以外のときに、FeeInfoからselectを行う。
	if not TMSeries.IsMjsLink3 then
	begin
//↑<MLXHAP>以下、字下げ。
        if	(nClass = 1) then															// 標準手数料
        begin
            dqMasterData	:= TMQuery.Create (Self);		   						// MQueryの構築

            m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

            with (dqMasterData) do
            begin
                Close ();

                SQL.Clear ();
                SQL.Add   ('SELECT RecSyubetu, FeeStand1, FeeStand2, Fee11, Fee12, Fee13, ');
                SQL.Add   ('       Fee21, Fee22, Fee23, Fee31, Fee32, Fee33, Fee41, Fee42, Fee43 ');
                SQL.Add   ('FROM   FeeInfo ');
                SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
                SQL.Add   ('       BankNCode = :strBankCode AND RecSyubetu = :nClass');

                ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
                ParamByName ('strBankCode'    ).AsFloat 	:= _StandardKeyCode;
                ParamByName ('nClass'         ).AsInteger	:= nClass;

                Open ();

                if	(not EOF) then
                begin
                    fnSetScreenDetailInformation01 (dqMasterData, -1, -1);

                    dqMasterData.Close ();
                    dqMasterData.Free  ();
                    Exit;
                end;
            end;

            dqMasterData.Close ();
            dqMasterData.Free  ();
        end;
//↓<MLXHAP>
	end;
//↑<MLXHAP>

	arBasedFee [1]	:= 0;
	arBasedFee [2]	:= 10000;
	arBasedFee [3]	:= 30000;

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 1 to 6 do
		begin
			if	((nRow = 3) and (nColumn = 2)) then
				Continue;

			case (nColumn) of
				1:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow];
				2:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow + 1];
				else	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= 0;
			end;
		end;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenDetailInfo02 ();
var
	strDescription: String;

begin

	CmnEdit00003BkName.Text	    	:= '';										// 全銀協銀行名称
	CmnEdit00004BkKana.Text	     	:= '';										// 全銀協銀行名称(ｶﾅ)
	CmnEdit00005BrName.Text		    := '';										// 全銀協支店名称
	CmnEdit00006BrKana.Text		    := '';										// 全銀協支店名称(ｶﾅ)
	CmnEdit00007NMK   .Text         := '';
    CmnEdit00008Renso.Text		    := '';										// 全銀協支店名称(ｶﾅ)

	CmnEdit02001LayoutPathDraft .Text	:= '';											// 手形ﾚｲｱｳﾄﾊﾟｽ
	CmnEdit02002ChaDivisionDraft.Value	:= 0;											// 金額文字種別
	CmnEdit02003LayoutPathCheck .Text	:= '';											// 小切手ﾚｲｱｳﾄﾊﾟｽ
	CmnEdit02004ChaDivisionCheck.Value	:= 0;											// 小切手文字種別

    CmnEdit02005LayoutPathCheck .Text	:= '';
    CmnEdit02006LayoutPathCheck .Text	:= '';
    CmnEdit02007LayoutPathCheck .Text	:= '';

    CmnEdit02008ChaDivisionCheck.value  := 0;

    CmnEdit02009LayoutPathCheck .Text	:= '';                                  // 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add

	fnGetDescriptionSelectedItem (CmnEdit02002ChaDivisionDraft, strDescription);
	CmnLabel02002ChaDivisionDraftDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit02004ChaDivisionCheck, strDescription);
	CmnLabel02004ChaDivisionCheckDesc.Caption	:= strDescription;

    CmnEdit02008ChaDivisionCheck.value := 0;
    CmnLabel02008ChaDivisionCheckDesc.caption := '';

//    fnSetFieldDescAccountCode;

// <096> ADD↓
	CmnEdit02010SoukinClientCode.Text		  	:= '';					// 送金依頼人ｺｰﾄﾞ
	CmnEdit02011SoukinClientNameKana.Text	  	:= '';					// 送金依頼人名称(ｶﾅ)
    CmnEdit02012SoukinCodeMode.Value      		:= 0;					// 半角ｺｰﾄﾞ体系
    CmnEdit02013SoukinRecordPause.Value     	:= 0;					// ﾚｺｰﾄﾞ区切
    CmnEdit02014SoukinFileName.Text         	:= '';					// ﾌｧｲﾙ名称

    // ﾚｺｰﾄﾞ区切の文字
	fnGetDescriptionSelectedItem (CmnEdit02012SoukinCodeMode , strDescription);
	CmnLabel02012SoukinCodeModeDesc.Caption		:= strDescription;

    // ﾌｧｲﾙ名称の文字
	fnGetDescriptionSelectedItem (CmnEdit02013SoukinRecordPause, strDescription);
	CmnLabel02013SoukinRecordPauseDesc.Caption	:= strDescription;
// <096> ADD↑

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnInitializeScreenDetailInfo03 ();
var
	strDescription: String;

begin
    if m_fNewRec = False then                       //<020>
        CmnEdit03001AccountCode.Value     := 0;     //<020>

	CmnEdit03002DepDivision   .Value  := 1;		 								// 預金種別
	CmnEdit03003AccountNo     .Text	  := '';	 								// 口座番号
	CmnEdit03026AccMemo       .Text	  := '';	 								// 口座メモ <099> ADD
	CmnEdit03009ClientCode    .Text	  := '';	 								// 振込依頼人ｺｰﾄﾞ
	CmnEdit03010ClientName    .Text	  := '';	 								// 振込依頼人名称
	CmnEdit03011ClientNameKana.Text	  := '';	 								// 振込依頼人名称(ｶﾅ)
    CmnEdit03004PayDivision.value     := 0;
    CmnEdit03005ReqKbn.value          := 0;
    CmnEdit03006Syumoku.value         := 0;
    CmnEdit03007FBCodeMode.value      := 0;
    CmnEdit03008RecordPause.value     := 0;
    CmnCmbo03024Layout.ItemIndex      := 0;                                     // 支払レイアウト <087> ADD
	CmnEdit03025FreeItem.Text	      := '';	 								// フリー項目 <092> ADD
    CmnEdit03012FileName.text         := '';
    CmnEdit03013VolumeName.text       := '';
    CmnEdit03021FeeDivision.value     := 0;
	CmnEdit03027SouFuripattern.Value  := 0;										// 総合振込出力方式  <103>


	CmnEdit03014KmkCode  .Value	      := 0;										// 仕訳情報科目ｺｰﾄﾞ
	CmnEdit03014KmkCode  .InputFlag	  := TRUE;
    CmnEdit03023FeePayKbn.value		  := 0;										// <076> Add

	fnSetAttributeJournalInfo (CmnEdit03014KmkCode.AsInteger);

	fnGetDescriptionSelectedItem (CmnEdit03002DepDivision, strDescription);
	CmnLabel03002DepDivisionDesc.Caption	:= strDescription;

	CmnLabel03014KmkCodeDesc.Caption	:= '';

	fnGetDescriptionSelectedItem (CmnEdit03004PayDivision , strDescription);
	CmnLabel03004PayDivisionDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03005ReqKbn , strDescription);
	CmnLabel03005ReqKbnDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03006Syumoku , strDescription);
	CmnLabel03006SyumokuDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03007FBCodeMode , strDescription);
	CmnLabel03007FBCodeModeDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03008RecordPause, strDescription);
	CmnLabel03008RecordPauseDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03021FeeDivision, strDescription);
	CmnLabel03021FeeDivisionDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03027SouFuripattern, strDescription);	// <103>
	CmnLabel03027SouFuriPatternDesc.Caption	:= strDescription;					// <103>

    // <076> Add start
	fnGetDescriptionSelectedItem (CmnEdit03023FeePayKbn, strDescription);
	CmnLabel03023FeePayKbnDesc.Caption	:= strDescription;
    // <076> Add end

end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstAccInfoInsert (pUpdateRecord: Pointer): String;
var
	pRecord	   : ^AccInfoData;
	strSQLConst: String;
    strPath    : String;                    // <033>
begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'INSERT INTO AccInfo (' + 'GCode   ,'								// 口座ｺｰﾄﾞ
										   + 'UpdTantoNCode , '							// 担当者内部コード	<MAS 353>
										   + 'RdelKbn ,'								// ﾚｺｰﾄﾞ区分
										   + 'BankNCode  ,'								// 銀行ｺｰﾄﾞ
										   + 'AccKbn    ,'								// 預金種別
										   + 'AccNo     ,'								// 口座番号
										   + 'ClientCode,'								// 振込依頼人ｺｰﾄﾞ
//<018>									   + 'ClientName, '								// ｶﾅ振込依頼人名称
										   + 'ClientName ';								// ｶﾅ振込依頼人名称<018>

// <045> 2007/04/17 H.Kawato Mod Start
{
    if CmnPanelClientDetail.Visible then    //<018>
    begin                                   //<018>

//<018>                                    + 'Shubetsu,'
        strSQLConst:= strSQLConst          + ',Shubetsu,'                                //<018>
                                           + 'RequestKbn,'
                                           + 'Shumoku,'
                                           + 'FBCodeMode,'
                                           + 'RecordPause,'
                                           + 'FeeUseMode,'
                                           + 'FileName,'
                                           + 'VolName,'
                                           + 'AccInfo1,'								// 振込依頼人名称
										   + 'CKmkNCode,'								// 科目ｺｰﾄﾞ
										   + 'CSubNCode,'								// 科目別補助ｺｰﾄﾞ
										   + 'CBmnNCode,'                               // 部門ｺｰﾄﾞ
										   + 'CSegNCode,'                               // ｾｸﾞﾒﾝﾄ1ｺｰﾄﾞ
										   + 'CHojKbn1,'								// 第1補助区分
										   + 'CHojNCode1,'								// 第1補助ｺｰﾄﾞ
										   + 'CHojKbn2,'								// 第2補助区分
										   + 'CHojNCode2,'                              // 第2補助ｺｰﾄﾞ
// <044> 2006/12/21 H.Kawato Mod
//										   + 'CKojNCode ';						    	// ﾌﾟﾛｼﾞｪｸﾄ
										   + 'CKojNCode,'						    	// ﾌﾟﾛｼﾞｪｸﾄ
										   + 'CKsyNCode ';						    	// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
// <044> 2006/12/21 H.Kawato Mod
}
    strSQLConst:= strSQLConst              + ',Shubetsu,'                                //<018>
                                           + 'RequestKbn,'
                                           + 'Shumoku,'
                                           + 'FBCodeMode,'
                                           + 'RecordPause,'
                                           + 'FeeUseMode,'
                                           + 'FileName,'
                                           + 'VolName,'
                                           + 'AccInfo1';								// 振込依頼人名称

// <046> 2007/06/04 H.Kawato Del
//    if CmnPanelClientDetail.Visible then
//    begin
// <046> 2007/06/04 H.Kawato Del
        strSQLConst:= strSQLConst          + ',CKmkNCode,'								// 科目ｺｰﾄﾞ
										   + 'CSubNCode,'								// 科目別補助ｺｰﾄﾞ
										   + 'CBmnNCode,'                               // 部門ｺｰﾄﾞ
										   + 'CSegNCode,'                               // ｾｸﾞﾒﾝﾄ1ｺｰﾄﾞ
										   + 'CHojKbn1,'								// 第1補助区分
										   + 'CHojNCode1,'								// 第1補助ｺｰﾄﾞ
										   + 'CHojKbn2,'								// 第2補助区分
										   + 'CHojNCode2,'                              // 第2補助ｺｰﾄﾞ
										   + 'CKojNCode,'						    	// ﾌﾟﾛｼﾞｪｸﾄ
										   + 'CKsyNCode, '						    	// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ　<104>
// <045> 2007/04/17 H.Kawato Mod End
//    end;  // <046> Del

// <046> 2007/06/04 H.Kawato Add Start
                                           + 'AccZanLimit';								// 総合振込出力方式　<104>
    strSQLConst:= strSQLConst              + ',AnserNo,'								// ANSER口座番号
										   + 'AccInfo2,'								//
// <073> 2010/06/28	G.Kojima Mod		   + 'AccZanLimit,';                            // 残高限度額
// <076> Mod start
//                                           + 'AccZanLimit';                             // 残高限度額

                                           + 'FeePayKbn';								// 手数料支払区分
// <076> Mod end
// <046> 2007/06/04 H.Kawato Add End
	strSQLConst	:= strSQLConst + ',LayoutInfo';                                         // 支払レイアウト <087> ADD
	strSQLConst	:= strSQLConst + ',AccMemo';                                            // 口座メモ <099> ADD

	strSQLConst	:= strSQLConst + ') VALUES ('
							   + Format ('%d,'    , [pRecord^.nAccountCode ])           // 口座ｺｰﾄﾞ
							   + Format ('%d,'	  , [TantoNCode])						// 担当者内部コード	<MAS 353>
							   + Format ('%d,'    , [0                         ])		// ﾚｺｰﾄﾞ区分
							   + Format ('%g,'    , [pRecord^.nNBkCode      ])	    	// 銀行内部ｺｰﾄﾞ
							   + Format ('%d,'    , [pRecord^.nDepDivision])            // 預金種別
							   + Format ('''%s'',', [pRecord^.strAccountNo])	        // 口座番号
							   + Format ('''%s'',', [pRecord^.strClientCode])		    // 振込依頼人ｺｰﾄﾞ
//<018>						   + Format ('''%s'',', [pRecord^.strClientNameKana])	    // ｶﾅ振込依頼人名称
							   + Format ('''%s''' , [ fnDelCRLF(pRecord^.strClientNameKana) ]);	    // ｶﾅ振込依頼人名称 <018><DKAI>

// <033>↓
    strPath := CmnEdit03012FileName.text;
    strPath := StringReplace(strPath, '\', '\\', [rfReplaceAll]);
// <033>↑
    if CmnPanelClientDetail.Visible then    //<018>
    begin                                   //<018>
    	strSQLConst	:= strSQLConst + ','
                               + Format ('%d,', [CmnEdit03004PayDivision.AsInteger])    //
                               + Format ('%d,', [CmnEdit03005ReqKbn.AsInteger])         //
                               + Format ('%d,', [CmnEdit03006Syumoku.AsInteger])        //
                               + Format ('%d,', [CmnEdit03007FBCodeMode.AsInteger])     //
                               + Format ('%d,', [CmnEdit03008RecordPause.AsInteger])    //
                               + Format ('%d,', [CmnEdit03021FeeDivision.AsInteger])    //
//                               + Format ('''%s'',', [CmnEdit03012FileName.text])	    // <033>削除
                               + Format ('''%s'',', [strPath])	                        // <033>ﾌｧｲﾙ名
                               + Format ('''%s'',', [CmnEdit03013VolumeName.text])	    //
                               + Format ('''%s'',', [ fnDelCRLF(CmnEdit03010ClientName.text) ]);	    // 振込依頼人名称 <DKAI>


        //科目ｺｰﾄﾞ
        if	CmnEdit03014KmkCode.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL,'
            strSQLConst	:= strSQLConst + '0,'
        else
            strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03014KmkCode.asInteger),MASTER_SUBJECT,0) + ',';

{<026>
        //科目補助ｺｰﾄﾞ
        if	(not m_arCodeAttribute [0].fEnabled or CmnEdit03015KmsCodeNumeric.InputFlag) then
            strSQLConst	:= strSQLConst + 'NULL,'
        else
            strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03015KmsCodeNumeric.AsInteger),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
<026>}
// <026> >>
        //科目補助ｺｰﾄﾞ
        if	(not m_arCodeAttribute [0].fEnabled ) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL,'
            strSQLConst	:= strSQLConst + '0,'
        else
        begin
            if	(m_arCodeAttribute [0].nAttribute <= 1) then
            begin
                if	CmnEdit03015KmsCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'NULL,'
                    strSQLConst	:= strSQLConst + '0,'
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03015KmsCodeNumeric.asInteger),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03015KmsCodeNumeric.Value),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
                    // <031> ↑
            end
            else
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03015KmsCodeFree.Text,MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
        end;
// <026> <<
        // 部門ｺｰﾄﾞ
        if	(not m_arCodeAttribute [1].fEnabled ) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL,'
            strSQLConst	:= strSQLConst + '0,'
        else
        begin
            if	(m_arCodeAttribute [1].nAttribute <= 1) then
            begin
                if	CmnEdit03016BumCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'NULL,'
                    strSQLConst	:= strSQLConst + '0,'
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03016BumCodeNumeric.asInteger),MASTER_SECTION,m_arCodeAttribute [1].nAttribute) + ',';
// <063> MOD start
//                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03016BumCodeNumeric.Value),MASTER_SECTION,m_arCodeAttribute [1].nAttribute) + ',';
                    // <031> ↑
                    							// ｺｰﾄﾞ入力した場合
					if CmnEdit03016BumCodeNumeric.TagStr = '' then
        				strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03016BumCodeNumeric.Value),MASTER_SECTION,m_arCodeAttribute [1].nAttribute) + ','
                    else                   		// 検索Expで選択した場合
                     	strSQLConst := strSQLConst + CmnEdit03016BumCodeNumeric.TagStr + ',';
// <063> MOD end

            end
            else
// <063> MOD start
//              strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03016BumCodeFree	.Text,MASTER_SECTION,m_arCodeAttribute [1].nAttribute) + ',';
                								// ｺｰﾄﾞ入力した場合
				if CmnEdit03016BumCodeFree.TagStr = '' then
					strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03016BumCodeFree.Text,MASTER_SECTION,m_arCodeAttribute [1].nAttribute) + ','
				else   							// 検索Expで選択した場合
                  	strSQLConst := strSQLConst + CmnEdit03016BumCodeFree.TagStr + ',';
// <063> MOD end
        end;

        // ｾｸﾞﾒﾝﾄ
        if	(not m_arCodeAttribute [2].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL,'
            strSQLConst	:= strSQLConst + '0,'
        else
        begin
// <073> 2010/06/28 G.Kojima DEL
//            strSQLConst	:= strSQLConst + Format ('%d,', [m_arCodeAttribute [2].nMasterDivision]);

            if	(m_arCodeAttribute [2].nAttribute <= 1) then
            begin
                if	CmnEdit03017SegCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                strSQLConst	:= strSQLConst + 'NULL,'
                strSQLConst	:= strSQLConst + '0,'
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03017SegCodeNumeric.asInteger),m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute) + ',';
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03017SegCodeNumeric.Value),m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute) + ',';
                    // <031> ↑
            end
            else
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03017SegCodeFree.Text,m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute) + ',';
        end;

        // 第1補助
        if	(not m_arCodeAttribute [3].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL, NULL,'
            strSQLConst	:= strSQLConst + '0, 0,'
        else
        begin
{ <068> ↓
            strSQLConst	:= strSQLConst + Format ('%d,', [m_arCodeAttribute [3].nMasterDivision]);


            if	(m_arCodeAttribute [3].nAttribute <= 1) then
            begin
                if	CmnEdit03018HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'NULL,'
                    strSQLConst	:= strSQLConst + '0,'
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03018HojCodeNumeric.asInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03018HojCodeNumeric.Value),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
                    // <031> ↑
            end
            else
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03018HojCodeFree.Text,m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
<068> ↑}   // <068> ↓
		   
			if (m_arCodeAttribute [3].nMasterDivision = MASTER_BANK) and
// <091> MOD-STR
//            	(CmnEdit03018HojCodeNumeric.Text = '') then
            	((CmnEdit03018HojCodeNumeric.Text = '') and (CmnEdit03018HojCodeFree.Text = '')) then
// <091> MOD-END
            begin
            	strSQLConst	:= strSQLConst + '0, 0,'
            end
            else
            begin
            	strSQLConst	:= strSQLConst + Format ('%d,', [m_arCodeAttribute [3].nMasterDivision]);


            	if	(m_arCodeAttribute [3].nAttribute <= 1) then
            	begin
                	if	CmnEdit03018HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    	strSQLConst	:= strSQLConst + 'NULL,'
                    	strSQLConst	:= strSQLConst + '0,'
                	else
                    	// <031> ↓
                    	//strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03018HojCodeNumeric.asInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
                    	strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03018HojCodeNumeric.Value),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
                    	// <031> ↑
            	end
            	else
                	strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03018HojCodeFree.Text,m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
            end;
            // <068> ↑
        end;


        // 第2補助
        if	(not m_arCodeAttribute [4].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL, NULL,'
            strSQLConst	:= strSQLConst + '0, 0,'
        else
        begin
{ <068> ↓
            strSQLConst	:= strSQLConst + Format ('%d,', [m_arCodeAttribute [4].nMasterDivision]);

            if	(m_arCodeAttribute [4].nAttribute <= 1) then
            begin
                if	CmnEdit03019HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'NULL,'
                    strSQLConst	:= strSQLConst + '0,'
                else
                     // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03019HojCodeNumeric.asInteger),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute) + ',';
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03019HojCodeNumeric.Value),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute) + ',';
                    // <031> ↑
            end
            else
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03019HojCodeFree.Text,m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute) + ',';
<068> ↑} // <068> ↓
			if (m_arCodeAttribute [4].nMasterDivision = MASTER_BANK) and
// <091> MOD-STR
//            	(CmnEdit03019HojCodeNumeric.Text = '') then
            	((CmnEdit03019HojCodeNumeric.Text = '') and (CmnEdit03019HojCodeFree.Text = '')) then
// <091> MOD-END
            begin
            	strSQLConst	:= strSQLConst + '0, 0,'
            end
            else
            begin
            	strSQLConst	:= strSQLConst + Format ('%d,', [m_arCodeAttribute [4].nMasterDivision]);


            	if	(m_arCodeAttribute [4].nAttribute <= 1) then
            	begin
                	if	CmnEdit03019HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    	strSQLConst	:= strSQLConst + 'NULL,'
                    	strSQLConst	:= strSQLConst + '0,'
                	else
                    	// <031> ↓
                    	//strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03018HojCodeNumeric.asInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute) + ',';
                    	strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03019HojCodeNumeric.Value),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute) + ',';
                    	// <031> ↑
            	end
            	else
                	strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03019HojCodeFree.Text,m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute) + ',';
            end;
            // <068> ↑
        end;


        // ﾌﾟﾛｼﾞｪｸﾄ
        if	(not m_arCodeAttribute [5].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//// <044> 2006/12/21 H.Kawato Mod
////            strSQLConst	:= strSQLConst + 'NULL'
//            strSQLConst	:= strSQLConst + 'NULL,'
            strSQLConst	:= strSQLConst + '0,'
// <046> 2007/06/04 H.Kawato Mod
        else
        begin
            if	(m_arCodeAttribute [5].nAttribute <= 1) then
            begin
                if	CmnEdit03020PrjCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//// <044> 2006/12/21 H.Kawato Mod
////                    strSQLConst	:= strSQLConst + 'NULL'
//                    strSQLConst	:= strSQLConst + 'NULL,'
                    strSQLConst	:= strSQLConst + '0,'
// <046> 2007/06/04 H.Kawato Mod
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + fnGetNcode_Master(IntToStr(CmnEdit03020PrjCodeNumeric.asInteger),m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute);
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03020PrjCodeNumeric.Value),m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute) + ',';
                    // <031> ↑
            end
            else
// <044> 2006/12/21 H.Kawato Mod
//                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute);
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute) + ',';
        end;

// <044> 2006/12/21 H.Kawato Add Start
        // ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
        if	(not m_arCodeAttribute [6].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'NULL'
            strSQLConst	:= strSQLConst + '0'
        else
        begin
            if	(m_arCodeAttribute [6].nAttribute <= 1) then
            begin
                if	CmnEdit03022PjSCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'NULL'
                    strSQLConst	:= strSQLConst + '0'
                else
                    strSQLConst	:= strSQLConst + fnGetNcode_Master(FloatToStr(CmnEdit03022PjSCodeNumeric.Value),m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute);
            end
            else
                strSQLConst	:= strSQLConst + fnGetNcode_Master(CmnEdit03022PjSCodeFree.Text,m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute);
        end;
        strSQLConst	:= strSQLConst + Format (',%d', [CmnEdit03027SouFuripattern.AsInteger]); // 総合振込出力方式 <104>
// <044> 2006/12/21 H.Kawato Add End

// <045> 2007/04/17 H.Kawato Add Start
    end
    else
    begin
    	strSQLConst	:= strSQLConst + ',0,0,0,0,0,0,'
                                + AnsiQuotedStr('', '''') + ','
                                + AnsiQuotedStr('', '''') + ','
                                + AnsiQuotedStr('', '''');
// <046> 2007/06/04 H.Kawato Add Start
        //科目ｺｰﾄﾞ//科目補助ｺｰﾄﾞ// 部門ｺｰﾄﾞ// ｾｸﾞﾒﾝﾄ// 第1補助// 第2補助// ﾌﾟﾛｼﾞｪｸﾄ// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
        strSQLConst	:= strSQLConst + ',0,0,0,0,0,0,0,0,0,0,0';	//<104>
// <046> 2007/06/04 H.Kawato Add End
// <045> 2007/04/17 H.Kawato Add End
    end;

// <046> 2007/06/04 H.Kawato Add
   	strSQLConst	:= strSQLConst + ',' + AnsiQuotedStr('', '''') + ','
// <076> Mod start
//                                + AnsiQuotedStr('', '''') + ',' + '0';
// <092> MOD-STR
//                              + AnsiQuotedStr('', '''') + ',' + '0,';

                                + AnsiQuotedStr(CmnEdit03025FreeItem.Text, '''') + ',';  // フリー項目
// <092> MOD-END
	strSQLConst	:= strSQLConst + Format ('%d,', [CmnEdit03023FeePayKbn.AsInteger]);    // 手数料支払区分
// <046> 2007/06/04 H.Kawato Add
// <076> Mod end
	strSQLConst	:= strSQLConst + Format ('''%s''', [CmnCmbo03024Layout.SelectedText]); // 支払レイアウト <087> ADD
	strSQLConst	:= strSQLConst + ',' + AnsiQuotedStr(CmnEdit03026AccMemo.Text, '''');  // 口座メモ <099> ADD

    Result	:= strSQLConst + ')';

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstAccInfoUpdate (pUpdateRecord: Pointer): String;
var
	pRecord		  : ^AccInfoData;
	strBumCode	  : String;
	strSegCode	  : String;
	strHo1Division: String;
	strHo1Code	  : String;
	strHo2Division: String;
	strHo2Code	  : String;
    strKojCode	  : String;
    strKsyCode    : String;                 // <044>
	strSQLConst	  : String;
    strPath       : String;                 // <033>
begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'UPDATE AccInfo SET '
//					+ Format ('BankNCode   = %g,', [pRecord^.nNBkCode   ])	     	        // 銀行内部ｺｰﾄﾞ
					+ Format ('AccKbn      = %d,'    , [pRecord^.nDepDivision     ])		// 預金種別
					+ Format ('AccNo       = ''%s'',', [pRecord^.strAccountNo     ])		// 口座番号
					+ Format ('ClientCode  = ''%s'',', [pRecord^.strClientCode    ])		// 振込依頼人ｺｰﾄﾞ
//<018>					+ Format ('ClientName  = ''%s'',', [pRecord^.strClientNameKana])	    // ｶﾅ依頼人名称
					+ Format ('UpdTantoNCode = %d,',  [TantoNCode])							// 担当者内部コード	<MAS 353>
					+ Format ('ClientName  = ''%s''', [ fnDelCRLF(pRecord^.strClientNameKana) ]);	    // ｶﾅ依頼人名称 <DKAI>

// <033>↓
    strPath := CmnEdit03012FileName.text;
    strPath := StringReplace(strPath, '\', '\\', [rfReplaceAll]);
// <033>↑

    if CmnPanelClientDetail.Visible then    //<018>
    begin                                   //<018>
    	strSQLConst	:= strSQLConst + ','    //<018>
                    + Format ('AccInfo1    = ''%s'',', [ fnDelCRLF(CmnEdit03010ClientName.text) ])	// 依頼人名 <DKAI>
                    + Format ('Shubetsu    = %d,'   ,  [CmnEdit03004PayDivision.AsInteger]) //
                    + Format ('RequestKbn  = %d,'    , [CmnEdit03005ReqKbn.AsInteger])      //
                    + Format ('Shumoku     = %d,'    , [CmnEdit03006Syumoku.AsInteger])     //
                    + Format ('FBCodeMode  = %d,'    , [CmnEdit03007FBCodeMode.AsInteger])  //
                    + Format ('RecordPause = %d,'    , [CmnEdit03008RecordPause.AsInteger]) //
                    + Format ('FeeUseMode  = %d,'    , [CmnEdit03021FeeDivision.AsInteger]) //
                    + Format ('AccZanLimit = %d,'    , [CmnEdit03027SouFuripattern.AsInteger]) // <103>
//                    + Format ('FileName    = ''%s'',', [CmnEdit03012FileName.text])	    // <033>削除
                    + Format ('FileName    = ''%s'',', [strPath])	                        // <033>ﾌｧｲﾙ名
// <076> Mod start
//                    + Format ('VolName     = ''%s'',', [CmnEdit03013VolumeName.text]);	    //
                    + Format ('VolName     = ''%s'',', [CmnEdit03013VolumeName.text])	    //
					+ Format ('FeePayKbn   = %d,'    , [CmnEdit03023FeePayKbn.AsInteger]);	// 手数料支払区分
// <076> Mod end
// <087> ADD-STR
        strSQLConst	:= strSQLConst
                    + Format ('LayoutInfo  = ''%s'',', [CmnCmbo03024Layout.SelectedText]);  // 支払レイアウト
// <087> ADD-END
// <092> ADD-STR
        strSQLConst	:= strSQLConst
                    + Format ('AccInfo2    = ''%s'',', [CmnEdit03025FreeItem.text]);        // フリー項目
// <092> ADD-END
// <099> ADD-STR
        strSQLConst	:= strSQLConst
                    + Format ('AccMemo     = ''%s'',', [CmnEdit03026AccMemo.text]);         // 口座メモ
// <099> ADD-END

        // 科目ｺｰﾄﾞ
        if	CmnEdit03014KmkCode.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'CKmkNCode = NULL,'
            strSQLConst	:= strSQLConst + 'CKmkNCode = 0,'
        else
            strSQLConst	:= strSQLConst + 'CKmkNCode = ' + fnGetNcode_Master(INtToStr(CmnEdit03014KmkCode.AsInteger),MASTER_SUBJECT,1) + ',';

{ <026>
        // 科目補助ｺｰﾄﾞ
        if	(not m_arCodeAttribute [0].fEnabled or CmnEdit03015KmsCodeNumeric.InputFlag) then
            strSQLConst	:= strSQLConst + 'CSubNCode = NULL,'
        else
            strSQLConst	:= strSQLConst + 'CSubNCode = ' + fnGetNcode_Master(IntToStr(CmnEdit03015KmsCodeNumeric.AsInteger),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
<026> }
// <026> >>
        // 科目補助ｺｰﾄﾞ
        if	(not m_arCodeAttribute [0].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSQLConst	:= strSQLConst + 'CSubNCode = NULL,'
            strSQLConst	:= strSQLConst + 'CSubNCode = 0,'
        else
        begin
            if	(m_arCodeAttribute [0].nAttribute <= 1) then
            begin
                if	CmnEdit03015KmsCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSQLConst	:= strSQLConst + 'CSubNCode = NULL,'
                    strSQLConst	:= strSQLConst + 'CSubNCode = 0,'
                else
                    // <031> ↓
                    //strSQLConst	:= strSQLConst + 'CSubNCode = ' + fnGetNcode_Master(IntToStr(CmnEdit03015KmsCodeNumeric.AsInteger),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
                    strSQLConst	:= strSQLConst + 'CSubNCode = ' + fnGetNcode_Master(FloatToStr(CmnEdit03015KmsCodeNumeric.Value),MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
                    // <031> ↑
            end
            else
                strSQLConst	:= strSQLConst + 'CSubNCode = ' + fnGetNcode_Master(CmnEdit03015KmsCodeFree.Text,MASTER_SUBJECTPLUS,m_arCodeAttribute [0].nAttribute) + ',';
        end;
// <026> <<

        // 部門ｺｰﾄﾞ
        if	(not m_arCodeAttribute [1].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strBumCode	:= 'NULL'
            strBumCode	:= '0'
        else
        begin
            if	(m_arCodeAttribute [1].nAttribute <= 1) then
            begin
                if	CmnEdit03016BumCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strBumCode	:= 'NULL'
                    strBumCode	:= '0'
                else
                    // <031> ↓
                    //strBumCode	:= fnGetNcode_Master(IntToStr(CmnEdit03016BumCodeNumeric.AsInteger),MASTER_SECTION,m_arCodeAttribute [1].nAttribute);
// <063> MOD start
//                    strBumCode	:= fnGetNcode_Master(FloatToStr(CmnEdit03016BumCodeNumeric.Value),MASTER_SECTION,m_arCodeAttribute [1].nAttribute);
                    							// ｺｰﾄﾞ入力した場合
					if CmnEdit03016BumCodeNumeric.TagStr = '' then
						strBumCode	:= fnGetNcode_Master(FloatToStr(CmnEdit03016BumCodeNumeric.Value),MASTER_SECTION,m_arCodeAttribute [1].nAttribute)
					else                  		// 検索Expで選択した場合
                      	strBumCode := CmnEdit03016BumCodeNumeric.TagStr;
// <063> MOD end
                    // <031> ↑
            end
            else
// <063> MOD start
//                strBumCode	:= fnGetNcode_Master(CmnEdit03016BumCodeFree.Text,MASTER_SECTION,m_arCodeAttribute [1].nAttribute);
                								// ｺｰﾄﾞ入力した場合
          		if CmnEdit03016BumCodeFree.TagStr = '' then
					strBumCode	:= fnGetNcode_Master(CmnEdit03016BumCodeFree.Text,MASTER_SECTION,m_arCodeAttribute [1].nAttribute)
				else                           	// 検索Expで選択した場合
					strBumCode  := CmnEdit03016BumCodeFree.TagStr;
// <063> MOD end
        end;

        // ｾｸﾞﾒﾝﾄ
        if	(not m_arCodeAttribute [2].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strSegCode	:= 'NULL'
            strSegCode	:= '0'
        else
        begin
            if	(m_arCodeAttribute [2].nAttribute <= 1) then
            begin
                if	CmnEdit03017SegCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strSegCode	:= 'NULL'
                    strSegCode	:= '0'
                else
                    // <031> ↓
                    //strSegCode	:= fnGetNcode_Master(IntToStr(CmnEdit03017SegCodeNumeric.asInteger),m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute);
                    strSegCode	:= fnGetNcode_Master(FloatToStr(CmnEdit03017SegCodeNumeric.Value),m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute);
                    // <031> ↑
            end
            else
                strSegCode	:= fnGetNcode_Master(CmnEdit03017SegCodeFree.Text,m_arCodeAttribute [2].nMasterDivision,m_arCodeAttribute [2].nAttribute);
        end;

        // 第1補助
        if	(not m_arCodeAttribute [3].fEnabled) then
        begin
// <046> 2007/06/04 H.Kawato Mod
//            strHo1Division	:= 'NULL';
//            strHo1Code		:= 'NULL';
            strHo1Division	:= '0';
            strHo1Code		:= '0';
// <046> 2007/06/04 H.Kawato Mod
        end
        else
        begin
{ <068> ↓
            strHo1Division	:= Format ('%d', [m_arCodeAttribute [3].nMasterDivision]);

            if	(m_arCodeAttribute [3].nAttribute <= 1) then
            begin
                if	CmnEdit03018HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strHo1Code	:= 'NULL'
                    strHo1Code	:= '0'
                else
                    // <031> ↓
                    //strHo1Code	:= fnGetNcode_Master(IntTOStr(CmnEdit03018HojCodeNumeric.AsInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
                    strHo1Code	:= fnGetNcode_Master(FloatToStr(CmnEdit03018HojCodeNumeric.Value),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
                    // <031> ↑
            end
            else
                strHo1Code	:= fnGetNcode_Master(CmnEdit03018HojCodeFree.Text,m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
<068> ↑}  // <068> ↓
			if (m_arCodeAttribute [3].nMasterDivision = MASTER_BANK) and
// <091> MOD-STR
//            	(CmnEdit03018HojCodeNumeric.Text = '') then
            	((CmnEdit03018HojCodeNumeric.Text = '') and (CmnEdit03018HojCodeFree.Text = '')) then
// <091> MOD-END
            begin
            	strHo1Division	:= '0';
            	strHo1Code		:= '0';
            end
            else
            begin
            	strHo1Division	:= Format ('%d', [m_arCodeAttribute [3].nMasterDivision]);

            	if	(m_arCodeAttribute [3].nAttribute <= 1) then
            	begin
                	if	CmnEdit03018HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                  	  strHo1Code	:= 'NULL'
                    	strHo1Code	:= '0'
                	else
                    	// <031> ↓
                    	//strHo1Code	:= fnGetNcode_Master(IntTOStr(CmnEdit03018HojCodeNumeric.AsInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
                    	strHo1Code	:= fnGetNcode_Master(FloatToStr(CmnEdit03018HojCodeNumeric.Value),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
                    	// <031> ↑
            	end
            	else
                	strHo1Code	:= fnGetNcode_Master(CmnEdit03018HojCodeFree.Text,m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);

			end;
            // <068> ↑
        end;

        // 第2補助
        if	(not m_arCodeAttribute [4].fEnabled) then
        begin
// <046> 2007/06/04 H.Kawato Mod
//            strHo2Division	:= 'NULL';
//            strHo2Code		:= 'NULL';
            strHo2Division	:= '0';
            strHo2Code		:= '0';
// <046> 2007/06/04 H.Kawato Mod
        end
        else
        begin
{ <068> ↓
            strHo2Division	:= Format ('%d', [m_arCodeAttribute [4].nMasterDivision]);

            if	(m_arCodeAttribute [4].nAttribute <= 1) then
            begin
                if	CmnEdit03019HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strHo2Code	:= 'NULL'
                    strHo2Code	:= '0'
                else
                    // <031> ↓
                    //strHo2Code	:= fnGetNcode_Master(IntToStr(CmnEdit03019HojCodeNumeric.asInteger),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute);
                    strHo2Code	:= fnGetNcode_Master(FloatToStr(CmnEdit03019HojCodeNumeric.Value),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute);
                    // <031> ↑
            end
            else
                strHo2Code	:= fnGetNcode_Master(CmnEdit03019HojCodeFree.text,m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute);
<068> ↑} // <068> ↓
			if (m_arCodeAttribute [4].nMasterDivision = MASTER_BANK) and
// <091> MOD-STR
//            	(CmnEdit03019HojCodeNumeric.Text = '') then
            	((CmnEdit03019HojCodeNumeric.Text = '') and (CmnEdit03019HojCodeFree.Text = '')) then
// <091> MOD-END
            begin
            	strHo2Division	:= '0';
            	strHo2Code		:= '0';
            end
            else
            begin
            	strHo2Division	:= Format ('%d', [m_arCodeAttribute [4].nMasterDivision]);

            	if	(m_arCodeAttribute [4].nAttribute <= 1) then
            	begin
                	if	CmnEdit03019HojCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                  	  strHo1Code	:= 'NULL'
                    	strHo2Code	:= '0'
                	else
                    	// <031> ↓
                    	//strHo1Code	:= fnGetNcode_Master(IntTOStr(CmnEdit03018HojCodeNumeric.AsInteger),m_arCodeAttribute [3].nMasterDivision,m_arCodeAttribute [3].nAttribute);
                    	strHo2Code	:= fnGetNcode_Master(FloatToStr(CmnEdit03019HojCodeNumeric.Value),m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute);
                    	// <031> ↑
            	end
            	else
                	strHo2Code	:= fnGetNcode_Master(CmnEdit03019HojCodeFree.Text,m_arCodeAttribute [4].nMasterDivision,m_arCodeAttribute [4].nAttribute);

			end;
            // <068> ↑
        end;
        // ﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞ
        if	(not m_arCodeAttribute [5].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strKojCode	:= 'NULL'
            strKojCode	:= '0'
        else
        begin
            if	(m_arCodeAttribute [5].nAttribute <= 1) then
            begin
                if	CmnEdit03020PrjCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strKojCode	:= 'NULL'
                    strKojCode	:= '0'
                else
                    // <031> ↓
                    //strKojCode	:= fnGetNcode_Master(IntToStr(CmnEdit03020PrjCodeNumeric.asInteger),m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute);
                    strKojCode	:= fnGetNcode_Master(FloatToStr(CmnEdit03020PrjCodeNumeric.Value),m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute);
                    // <031> ↑
            end
            else
                strKojCode	:= fnGetNcode_Master(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nMasterDivision,m_arCodeAttribute [5].nAttribute);
        end;

// <044> 2006/12/21 H.Kawato Add Start
        // ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞｺｰﾄﾞ
        if	(not m_arCodeAttribute [6].fEnabled) then
// <046> 2007/06/04 H.Kawato Mod
//            strKsyCode	:= 'NULL'
            strKsyCode	:= '0'
        else
        begin
            if	(m_arCodeAttribute [6].nAttribute <= 1) then
            begin
                if	CmnEdit03022PjSCodeNumeric.InputFlag then
// <046> 2007/06/04 H.Kawato Mod
//                    strKsyCode	:= 'NULL'
                    strKsyCode	:= '0'
                else
                    strKsyCode	:= fnGetNcode_Master(FloatToStr(CmnEdit03022PjSCodeNumeric.Value),m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute);
            end
            else
                strKsyCode	:= fnGetNcode_Master(CmnEdit03022PjSCodeFree.Text,m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute);
        end;
// <044> 2006/12/21 H.Kawato Add End

        strSQLConst	:= strSQLConst + Format ('CBmnNCode   = %s,', [strBumCode    ])		// 部門ｺｰﾄﾞ
                               + Format ('CSegNCode  = %s,', [strSegCode    ])		// ｾｸﾞﾒﾝﾄ1ｺｰﾄﾞ
                               + Format ('CHojKbn1   = %s,', [strHo1Division])		// 第1補助区分
                               + Format ('CHojNCode1 = %s,', [strHo1Code    ])		// 第1補助ｺｰﾄﾞ
                               + Format ('CHojKbn2   = %s,', [strHo2Division])		// 第2補助区分
                               + Format ('CHojNCode2 = %s,', [strHo2Code    ])  	// 第2補助ｺｰﾄﾞ
// <044> 2006/12/21 H.Kawato Mod
//                               + Format ('CKojNCode = %s ', [strKojCode    ]);		// ﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞ
                               + Format ('CKojNCode = %s, ', [strKojCode    ])		// ﾌﾟﾛｼﾞｪｸﾄｺｰﾄﾞ
                               + Format ('CKsyNCode = %s ',  [strKsyCode    ]);		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞｺｰﾄﾞ
// <044> 2006/12/21 H.Kawato Mod
    end;

	strSQLConst	:= strSQLConst + ',' + 'UpdDateTM = NOW() ';                        // 修正日付 <046> Add

	strSQLConst	:= strSQLConst + ' WHERE RdelKbn = 0  '
                                + Format ('AND GCode = %d', [pRecord^.nAccountCode])
                                + Format ('AND BankNCode = %g', [pRecord^.nNBkcode]);

	Result	:= strSQLConst;
end;
//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstFeeInfoInsert (pUpdateRecord: Pointer; nClass: Integer): String;
var
	pRecord	   : ^BankInfoData;
	nColumn	   : Integer;
	nRow	   : Integer;
	strSQLConst: String;

begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'INSERT INTO FeeInfo  (' + 'MasterKbn ,'								// ﾏｽﾀ区分
											+ 'UpdTantoNCode ,'							// 担当者内部コード	<MAS 353>
											+ 'BankNCode  ,'							// 銀行ｺｰﾄﾞ
											+ 'RecSyubetu,'								// ﾚｺｰﾄﾞ種別
											+ 'FeeStand1 ,'								// 分割基準額1
											+ 'FeeStand2 ,'								// 分割基準額2
											+ 'Fee11     ,'								// 他銀行(電信)1
											+ 'Fee21     ,'								// 他銀行(文書)1
											+ 'Fee31     ,'								// 同銀行他支店1
											+ 'Fee41     ,'								// 同銀行同支店1
											+ 'Fee12     ,'								// 他銀行(電信)2
											+ 'Fee22     ,'								// 他銀行(文書)2
											+ 'Fee32     ,'								// 同銀行他支店2
											+ 'Fee42     ,'								// 同銀行同支店2
											+ 'Fee13     ,'								// 他銀行(電信)3
											+ 'Fee23     ,'								// 他銀行(文書)3
											+ 'Fee33     ,'								// 同銀行他支店3
											+ 'Fee43      ';							// 同銀行同支店3
	strSQLConst	:= strSQLConst + ', StartDate';                                         // 適用開始日 <TX26>

	strSQLConst	:= strSQLConst + ') VALUES ('
							   + Format ('%d,', [MASTER_BANK         ])				// ﾏｽﾀ区分
							   + Format ('%d,', [TantoNCode          ])			// 担当者内部コード	<MAS 353>
							   + Format ('%g,', [pRecord^.nNCode])				// 銀行ｺｰﾄﾞ
							   + Format ('%d,', [nClass              ])				// ﾚｺｰﾄﾞ種別

	+ Format ('%d,', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 1, 2]))).Value)])
	+ Format ('%d ', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 2, 2]))).Value)]);

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 3 to 6 do
			strSQLConst	:= strSQLConst + Format (',%d', [Trunc (TMNumEdit (
								   		MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value)]);
	end;

	strSQLConst	:= strSQLConst + ',' + IntToStr(MjsDateCtrl.MjsDateToInt8(CmnEdit01049StartYMD.AsDateTime)); // 適用開始日 <TX26>	// <097> MOD コントロール名変更

	Result	:= strSQLConst + ')';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstFeeInfoUpdate (pUpdateRecord: Pointer; nClass: Integer): String;
var
	pRecord	   : ^BankInfoData;
	nColumn	   : Integer;
	nRow	   : Integer;
	strSQLConst: String;

begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'UPDATE FeeInfo SET '
	+ Format ('UpdTantoNCode = %d,', [TantoNCode])			    // 担当者内部コード	<MAS 353>
	+ Format ('FeeStand1 = %d,', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 1, 2]))).Value)])
	+ Format ('FeeStand2 = %d ', [Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, 2, 2]))).Value)]);

	for	nRow := 1 to 3 do
	begin
		for	nColumn := 3 to 6 do
			strSQLConst	:= strSQLConst + Format (', Fee%d%d = %d', [nColumn - 2, nRow,
						Trunc (TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value)]);
	end;

	strSQLConst	:= strSQLConst + ',' + 'UpdDateTM = NOW() ';    // 修正日付 <046> Add

	strSQLConst	:= strSQLConst + ', StartDate = ' + IntToStr(MjsDateCtrl.MjsDateToInt8(CmnEdit01049StartYMD.AsDateTime));  // 適用開始日 <TX26>	// <097> MOD コントロール名変更

	strSQLConst	:= strSQLConst + ' WHERE '
						+ Format ('MasterKbn  = %d AND ', [MASTER_BANK         ])   // ﾏｽﾀ区分
						+ Format ('BankNCode  = %g AND ', [pRecord^.nNCode])        // 外部ｺｰﾄﾞ
						+ Format ('RecSyubetu = %d'     , [nClass              ]);	// ﾚｺｰﾄﾞ種別

	Result	:= strSQLConst;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstBankInfoInsert (pUpdateRecord: Pointer): String;
var
	pRecord		   : ^BankInfoData;
//	nAppDateStart  : Integer;
//	nAppDateEnd	   : Integer;
	strSQLConst	   : String;
//	strAppDateStart: String;
//	strAppDateEnd  : String;
    strName		   : String;

begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'INSERT INTO BankInfo (' + 'MasterKbn,'						    // ﾏｽﾀ区分
										   + 'UpdTantoNCode,'					    // 担当者内部コード	<MAS 353>
										   + 'AllBkCode,'						    // 全銀協コード（銀行）
										   + 'AllBraCode,'						    // 全銀協コード（支店）
										   + 'BankName,'						    // 銀行名称
										   + 'BankKanaName,'					    // 銀行カナ
										   + 'BkBraName,'						    // 支店名称
										   + 'BraKanaName,'					    	// 支店カナ
										   + 'OffDNCode,'				        	// 休日コード
										   + 'Renso';				             	// 連想

// <046> 2007/06/04 H.Kawato Del Start
    // --- <003> ST 詳細画面表示時は以下も更新 ---------------------------------
//    if	(CmnPanelClientDetail.Visible) then
//    begin
// <046> 2007/06/04 H.Kawato Del End
    	strSQLConst	:= strSQLConst + ','
										   + 'simplename    ,'				        	// 簡略名
										   + 'BillRate      ,'				        	// 手形割引率
										   + 'TegLayPath    ,'				        	// 手形ﾚｲｱｳﾄ
										   + 'TegkinSyubetu ,'				        	// 金額文字種別
										   + 'KogLayPath    ,'				        	// 小切手ﾚｲｱｳﾄﾊﾟｽ
										   + 'KogkinSyubetu ,'				        	// 小切手文字種別
										   + 'BillLayPath1  ,'				        	//
										   + 'BillLayPath2  ,'				        	//
										   + 'BillLayPath3  ,'					        //
										   + 'BillLayPath4  ,'					        //  組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
										   + 'BillAccCode  ';					        //
// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
    		strSQLConst	:= strSQLConst + ','
										   + 'ClientCode    ,'				        	// 送金依頼人ｺｰﾄﾞ
										   + 'ClientName    ,'				        	// 送金依頼人名称(ｶﾅ)
										   + 'FBCodeMode    ,'				        	// 半角ｺｰﾄﾞ体系
										   + 'RecordPause   ,'				        	// ﾚｺｰﾄﾞ区切
										   + 'FileName      '				        	// ﾌｧｲﾙ名称
		end;
// <096> ADD↑

// <046> 2007/06/04 H.Kawato Del Start
{
    end
    // --- <003> ED ------------------------------------------------------------
	// <028> >>
	else
	begin
		// 一覧で新規作成の場合も簡略名称（UPDATE時はしない）
    	strSQLConst	:= strSQLConst + ',simplename     ';				        	// 簡略名
    end;
	// <028> <<
}
// <046> 2007/06/04 H.Kawato Del End

// <046> 2007/06/04 H.Kawato Add Start
    strSQLConst	:= strSQLConst + ','
										   + 'TegBankSqNo   ,'				        	// 振出手形番号
										   + 'TegRenTanKbn  ,'				        	// 連帳・単票区分
										   + 'TegKinHaichi  ,'				        	// 金額文字配置
										   + 'KogBankSqNo   ,'				        	// 振出小切手番号
										   + 'KogRenTanKbn  ,'				        	// 連帳・単票区分
// <097> MOD↓
// 不要なカンマの除去
//										   + 'KogKinHaichi  ,';				        	// 金額文字配置
										   + 'KogKinHaichi  ';				        	// 金額文字配置
// <097> MOD↑
// <046> 2007/06/04 H.Kawato Add End

	strSQLConst	:= strSQLConst + ') VALUES ('
							   + Format ('%d,'    , [MASTER_BANK     ])			// ﾏｽﾀ区分
							   + Format ('%d,'	  , [TantoNCode      ])			// 担当者内部コード	<MAS 353>
							   + Format ('%d,'    , [pRecord^.nBkCode])
							   + Format ('%d,'    , [pRecord^.nBrCode])
							   + Format ('''%s'',', [ fnDelCRLF(pRecord^.strBkName) ])	//<DKAI>
							   + Format ('''%s'',', [ fnDelCRLF(pRecord^.strBkKana) ])	//<DKAI>
							   + Format ('''%s'',', [ fnDelCRLF(pRecord^.strBrName) ])	//<DKAI>
							   + Format ('''%s'',', [ fnDelCRLF(pRecord^.strBrKana) ])	//<DKAI>
							   + Format ('%g,'    , [pRecord^.nHolCode ])
							   + Format ('''%s''' , [ fnDelCRLF(pRecord^.strRenso) ]);	//<DKAI>

    // --- <003> ST 詳細画面表示時は以下も更新 ---------------------------------
    if	(CmnPanelClientDetail.Visible) then
    begin
// <088> MOD-STR
//      strSQLConst := strSQLConst + ','
//							   + Format ('''%s'',', [ fnDelCRLF(CmnEdit00007NMK.Text) ])	// 簡略名称 <DKAI>
//							   + Format ('%g,'    , [fBiilRate.value ])
//							   + Format ('''%s'',', [CmnEdit02001LayoutPathDraft.text])
//							   + Format ('%d,'    , [CmnEdit02002ChaDivisionDraft.asInteger])
//							   + Format ('''%s'',', [CmnEdit02003LayoutPathCheck.text ])
//							   + Format ('%d,'    , [CmnEdit02004ChaDivisionCheck.asinteger])
//							   + Format ('''%s'',', [CmnEdit02005LayoutPathCheck.text ])
//							   + Format ('''%s'',', [CmnEdit02006LayoutPathCheck.text])
//							   + Format ('''%s'',', [CmnEdit02007LayoutPathCheck.text])
//							   + Format ('''%s'',', [CmnEdit02009LayoutPathCheck.text])     // 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
//							   + Format ('%g'    ,  [uvAccCode]);
        strSQLConst := strSQLConst + ','
							   + Format ('''%s'',', [ fnDelCRLF(CmnEdit00007NMK.Text) ])	// 簡略名称 <DKAI>
							   + Format ('%g,'    , [CmnEdit01050BiilRate.value ])			// <097> MOD コントロール名変更
							   + ':wTegLayPath,'
							   + Format ('%d,'    , [CmnEdit02002ChaDivisionDraft.asInteger])
							   + ':wKogLayPath,'
							   + Format ('%d,'    , [CmnEdit02004ChaDivisionCheck.asinteger])
							   + ':wBillLayPath1,'
							   + ':wBillLayPath2,'
							   + ':wBillLayPath3,'
							   + ':wBillLayPath4,'
							   + Format ('%g'    ,  [uvAccCode]);
// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			strSQLConst := strSQLConst + ','
							   + ':wSoukinClientCode,'			// 送金依頼人ｺｰﾄﾞ
							   + ':wSoukinClientName,'			// 送金依頼人名称(ｶﾅ)
							   + ':wSoukinFBCodeMode,'			// 半角ｺｰﾄﾞ体系
							   + ':wSoukinRecordPause,'			// ﾚｺｰﾄﾞ区切
							   + ':wSoukinFileName'				// ﾌｧｲﾙ名称
		end;
// <096> ADD↑
// <088> MOD-END
    end
    // --- <003> ED ------------------------------------------------------------
	// <028> >>
	else
	begin
		// 一覧で新規作成の場合も簡略名称（UPDATE時はしない）
        strName := pRecord^.strBkName + '/' + pRecord^.strBrName;

        if  (strName <> '') then
        begin
		if	(MjsHanLength(strName) <= 14) then
			strName  := MjsHanCopy (strName, 1, 14)
		else
			strName	:= MJSKabuCut (strName, 14);
        end;

        strSQLConst := strSQLConst + ','
							   + Format ('''%s''' , [ fnDelCRLF(strName) ] );	// 簡略名称 <DKAI>

// <046> 2007/06/04 H.Kawato Mod Start
        strSQLConst := strSQLConst + ',0'                           // 手形割引率
							   + ',' + AnsiQuotedStr('', '''')      // 手形レイアウトファイルパス
							   + ',0'                               // 金額文字種別
							   + ',' + AnsiQuotedStr('', '''')      // 小切手レイアウトファイルパス
							   + ',0'                               // 金額文字種別
							   + ',' + AnsiQuotedStr('', '''')      // 割引依頼書レイアウトパス
							   + ',' + AnsiQuotedStr('', '''')      // 取立依頼表レイアウトパス
							   + ',' + AnsiQuotedStr('', '''')      // 担保依頼差入証レイアウトパス
							   + ',' + AnsiQuotedStr('', '''')      // 組戻依頼書レイアウトパス <075>Add
							   + ',0';                              // 銀行依頼書口座コード
// <046> 2007/06/04 H.Kawato Mod End
// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
	        strSQLConst := strSQLConst
							   + ',' + AnsiQuotedStr('', '''')		// 送金依頼人ｺｰﾄﾞ
							   + ',' + AnsiQuotedStr('', '''')		// 送金依頼人名称(ｶﾅ)
							   + ',0'								// 半角ｺｰﾄﾞ体系
							   + ',0'								// ﾚｺｰﾄﾞ区切
							   + ',' + AnsiQuotedStr('', '''')		// ﾌｧｲﾙ名称
		end;
// <096> ADD↑
    end;
	// <028> <<

// <046> 2007/06/04 H.Kawato Mod Start
    strSQLConst := strSQLConst + ',' + AnsiQuotedStr('', '''')      // 振出手形番号
							   + ',0'                               // 連帳・単票区分
							   + ',0'                               // 金額文字配置
							   + ',' + AnsiQuotedStr('', '''')      // 振出小切手番号
							   + ',0'                               // 連帳・単票区分
							   + ',0';                              // 金額文字配置
// <046> 2007/06/04 H.Kawato Mod End

	Result	:= strSQLConst + ')';
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMakeSQLConstBankInfoUpdate (pUpdateRecord: Pointer): String;
var
	pRecord		   : ^BankInfoData;
//	nAppDateStart  : Integer;
//	nAppDateEnd	   : Integer;
	strSQLConst	   : String;
//	strAppDateStart: String;
//	strAppDateEnd  : String;
// <075>↓↓
//	strTmp		   : array [1..5] of String;	// <MAS 352>
// <088> DEL    strTmp		   : array [1..6] of String;
// <075>↑↑
    i			   : Integer;					// <MAS 352>
begin
	pRecord	:= pUpdateRecord;

	strSQLConst	:= 'UPDATE BankInfo SET '
						+ Format ('BankName      = ''%s'',', [ fnDelCRLF(pRecord^.strBKName) ])	// 銀行名     <DKAI>
						+ Format ('BankKanaName  = ''%s'',', [ fnDelCRLF(pRecord^.strBKKANA) ])	// 銀行名カナ <DKAI>
						+ Format ('BkBraName     = ''%s'',', [ fnDelCRLF(pRecord^.strBrName) ])	// 支店名     <DKAI>
						+ Format ('BraKanaName   = ''%s'',', [ fnDelCRLF(pRecord^.strBrKANA) ])	// 簡略名称   <DKAI>
						+ Format ('OffDNCode     = ''%g'',', [pRecord^.nHolCode])				// 休日コード
						+ Format ('UpdTantoNCode = %d,',     [TantoNCode])						// 担当者内部コード	<MAS 353>
						+ Format ('Renso         = ''%s''' , [ fnDelCRLF(pRecord^.strRenso) ]);	// 連想       <DKAI>

    // --- <003> ST 詳細画面表示時は以下も更新 ---------------------------------
    if	(CmnPanelClientDetail.Visible) then
    begin
// <088> MOD-STR
{		// <MAS 352> -->
		strTmp[1] := CmnEdit02001LayoutPathDraft.text;
		strTmp[2] := CmnEdit02003LayoutPathCheck.text;
		strTmp[3] := CmnEdit02005LayoutPathCheck.text;
		strTmp[4] := CmnEdit02006LayoutPathCheck.text;
		strTmp[5] := CmnEdit02007LayoutPathCheck.text;
		strTmp[6] := CmnEdit02009LayoutPathCheck.text;      // 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
// <075>↓↓
//        for i:= 1 to 5 do
        for i:= 1 to 6 do
// <075>↑↑
        begin
			// 先頭が'\\'の場合
			if 1 = Pos('\\', strTmp[i]) then
            	strTmp[i] := '\' + strTmp[i];	// 頭にもう一つ'\'を足す
        end;
		// <MAS 352> <--
    	strSQLConst	:= strSQLConst + ','
						+ Format ('simplename    = ''%s'',', [ fnDelCRLF(CmnEdit00007NMK.Text) ])	// 簡略名称 <DKAI>
						+ Format ('BillRate      = %g,'     ,[fBiilRate.value])	                    // 手形割引率
                        // <MAS 352>+ Format ('TegLayPath    = ''%s'',', [CmnEdit02001LayoutPathDraft.text])
                        + Format ('TegLayPath    = ''%s'',', [strTmp[1]])		// <MAS 352>
                        + Format ('TegkinSyubetu = %d,'    , [CmnEdit02002ChaDivisionDraft.asInteger])
                        // <MAS 352>+ Format ('KogLayPath    = ''%s'',', [CmnEdit02003LayoutPathCheck.text ])
                        + Format ('KogLayPath    = ''%s'',', [strTmp[2]])		// <MAS 352>
                        + Format ('KogkinSyubetu = %d,'    , [CmnEdit02004ChaDivisionCheck.asinteger])
                        // <MAS 352>+ Format ('BillLayPath1  = ''%s'',', [CmnEdit02005LayoutPathCheck.text ])
                        // <MAS 352>+ Format ('BillLayPath2  = ''%s'',', [CmnEdit02006LayoutPathCheck.text])
                        // <MAS 352>+ Format ('BillLayPath3  = ''%s'',', [CmnEdit02007LayoutPathCheck.text])
                        + Format ('BillLayPath1  = ''%s'',', [strTmp[3]])		// <MAS 352>
                        + Format ('BillLayPath2  = ''%s'',', [strTmp[4]])		// <MAS 352>
                        + Format ('BillLayPath3  = ''%s'',', [strTmp[5]])		// <MAS 352>
                        + Format ('BillLayPath4  = ''%s'',', [strTmp[6]])		// 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
                        + Format ('BillAccCode  = %g',       [uvAccCode]);}

    	strSQLConst	:= strSQLConst + ','
						+ Format ('simplename    = ''%s'',', [ fnDelCRLF(CmnEdit00007NMK.Text) ])	// 簡略名称
						+ Format ('BillRate      = %g,'     ,[CmnEdit01050BiilRate.value])          // 手形割引率	// <097> MOD コントロール名変更
                        + 'TegLayPath   = :wTegLayPath,'
                        + Format ('TegkinSyubetu = %d,'    , [CmnEdit02002ChaDivisionDraft.asInteger])
                        + 'KogLayPath   = :wKogLayPath,'
                        + Format ('KogkinSyubetu = %d,'    , [CmnEdit02004ChaDivisionCheck.asinteger])
                        + 'BillLayPath1 = :wBillLayPath1,'
                        + 'BillLayPath2 = :wBillLayPath2,'
                        + 'BillLayPath3 = :wBillLayPath3,'
                        + 'BillLayPath4 = :wBillLayPath4,'
                        + Format ('BillAccCode  = %g',       [uvAccCode]);
// <088> MOD-END

// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			strSQLConst	:= strSQLConst + ','
						+ 'ClientCode  = :wSoukinClientCode,'		// 送金依頼人ｺｰﾄﾞ
						+ 'ClientName  = :wSoukinClientName,'		// 送金依頼人名称(ｶﾅ)
						+ 'FBCodeMode  = :wSoukinFBCodeMode,'		// 半角ｺｰﾄﾞ体系
						+ 'RecordPause = :wSoukinRecordPause,'		// ﾚｺｰﾄﾞ区切
						+ 'FileName    = :wSoukinFileName'	 		// ﾌｧｲﾙ名称
		end;
// <096> ADD↑
    end;
    // --- <003> ED ------------------------------------------------------------

	strSQLConst	:= strSQLConst + ',UpdDateTM = NOW() ';         // 修正日付 <046> Add

	strSQLConst	:= strSQLConst + ' WHERE RdelKbn = 0 AND '
							+ Format ('MasterKbn   = %d AND ', [MASTER_BANK         ]) // ﾏｽﾀ区分
							+ Format ('AllBkCode   = %d AND ', [pRecord^.nBkCode])	   // 銀行
							+ Format ('AllBraCode  = %d'     , [pRecord^.nBrCode]);	   // 支店

	Result	:= strSQLConst;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnMoveFocusNextControl (): Boolean;
begin
	if	(m_nReferMode <> REFER) then
        fnChangeConditionAllControlsDetail(True);

	if	(not fnCheckEditItemsValue ()) then
	begin
		if	((m_cACControl is TMNumEdit ) or
			 (m_cACControl is TMTxtEdit ) or
			 (m_cACControl is TMDateEdit)) then
		begin
			if	(m_cACControl.Enabled) then
			begin
				m_cACControl.SetFocus ();

				TEdit (m_cACControl).SelectAll ();
				Beep  ();

				Result	:= FALSE;
				Exit;
			end;
		end;
	end;


	MjsDispCtrl.MjsNextCtrl (Self);

	Result	:= TRUE;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnMoveRecSelecter (nNCode: Extended);
var
	nRetRecNo: Integer;
//	strFormat: String;

begin
	if	nNCode <> 0 then
	begin
		nRetRecNo	:= CmnMemDataHojyoMA.GetRecNoByFieldValue (nNCode, 'nCode');

		if	(nRetRecNo > 0) then
		begin
			if	(nRetRecNo = 1) then
				CmnMemDataHojyoMA.First ()
			else if	(nRetRecNo = CmnMemDataHojyoMA.RecordCount) then
				CmnMemDataHojyoMA.Last ()
			else
				CmnMemDataHojyoMA.RecNo	:= nRetRecNo;
		end;

//		fnRebuildGridAccInfo (CmnMemDataHojyoMA.FieldByName ('nCode').AsFloat);
        fnRebuildGridAccInfo (nNCODE);
	end
    else
    begin
        CmnMemDataAccInfo.Close;
        CmnMemDataAccInfo.Open;
    end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnOutputConfirmationMessage (nDivision: Integer): Integer;
var
	cMessageRec: TMJSMsgRec;
	nMessageID : Integer;
	nReturn	   : Integer;
	nItems	   : Integer;
	strFormat  : String;
	strMessage : String;

begin

	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		if	(PCheckItemRec (m_cCheckItems.Items [nItems])^.fChangeData) then
			Break;
	end;

	if	(nItems >= m_cCheckItems.Count) then
	begin
		Result	:= CONFIRM_THROUGH;
		Exit;
	end;

	case (nDivision) of
		CONFIRM_INSTRUCTION:	nMessageID	:= 3;
		CONFIRM_CANCEL     :	nMessageID	:= 1;
		CONFIRM_EXIT       :	nMessageID	:= 2;
		else
		begin
			Result	:= CONFIRM_THROUGH;
			Exit;
		end;
	end;

	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 10020, nMessageID);

	if	(nMessageID = 3) then
	begin
		strFormat	:= '';

        strMessage	:= IntToStr(CmnEdit00001BkCode.AsInteger);
        strMessage	:= strMessage + ' ' + CmnEdit00007NMK.Text;

		cMessageRec.sMsg	:= '『' + strMessage + '』  ' + cMessageRec.sMsg;
	end;

	nReturn	:= MJSMessageBoxEx (Self,cMessageRec.sMsg, m_pRec^.m_ProgramName, cMessageRec.icontype,
													cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);

	if	(nReturn = mrYes) then
	begin
		case (nDivision) of
			CONFIRM_INSTRUCTION:	nReturn	:= CONFIRM_WRITE;
			CONFIRM_CANCEL     :	nReturn	:= CONFIRM_THROUGH;
			CONFIRM_EXIT       :	nReturn	:= CONFIRM_WRITE;
		end;
	end
	else if	(nReturn = mrNo) then
	begin
		case (nDivision) of
			CONFIRM_INSTRUCTION:	nReturn	:= CONFIRM_THROUGH;
			CONFIRM_CANCEL     :	nReturn	:= CONFIRM_RETFOCUSED;
			CONFIRM_EXIT       :	nReturn	:= CONFIRM_THROUGH;
		end;
	end
	else if	(nReturn = mrCancel) then
		nReturn	:= CONFIRM_RETFOCUSED
	else
		nReturn	:= CONFIRM_THROUGH;

	Result	:= nReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnOutputDBErrorMessage ();
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
					m_cErrorMsgRec.sMsg	:= '仕訳入力済みのため削除' + m_cErrorMsgRec.sMsg;
				end;
			5:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '総合計又は諸口以外のレコードが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			6:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '支払予定データが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			7:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '部署情報が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
		//--- <#3> St -----
			8:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '未連結仕訳(部署or分散)が存在する為削除' + m_cErrorMsgRec.sMsg;
				end;
		//--- <#3> Ed -----
		end;
	end;

	MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
										m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
(* <062> Del-St
procedure	TJNTCRP008002f.fnPrintCheckListAccount ();
var
	dqMasterData  : TMQuery;
	nPosition	  : Integer;
//	strFormat	  : String;
	nHojCode	  : Integer;
	strDescription: String;
	strPrefix	  : String;

begin
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	CmnReportAccountDBTextBankCode.Width	:= 0.0625 * m_nCurCodeDigit;

	CmnReportAccountDBTextBankCode.Alignment	:= taRightJustify;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT ai.GCode AccCODE, ai.AccKbn, ai.AccNo, ai.ClientCode, ai.ClientName, ai.AccInfo1, ');
		SQL.Add   ('       ai.CKmkNCode, ai.CSubNCode, ai.CBmnNCode, ai.CSegNCode, ai.CHojKbn1, ai.CHojNCode1, ');
// <044> 2006/12/21 H.Kawato Mod
//		SQL.Add   ('       ai.CHojKbn2, ai.CHojNCode2, ai.CKojNCode, hm.GCode, hm.SimpleName ');
		SQL.Add   ('       ai.CHojKbn2, ai.CHojNCode2, ai.CKojNCode, ai.CKsyNCode, hm.GCode, hm.SimpleName ');
		SQL.Add   ('FROM   AccInfo ai LEFT OUTER JOIN HojyoMA hm ');
		SQL.Add   ('ON     hm.MasterKbn = 21 AND ai.BankNCode = hm.GCode AND hm.RdelKbn = 0 ');
		SQL.Add   ('WHERE  ai.RdelKbn = 0 AND ai.BankNCode >= :strBankCodeStr AND ai.BankNCode <= :strBankCodeEnd ');
//		SQL.Add   ('ORDER BY ai.BankCode, ai.AccCode');

		if	(m_nPrintOrder = 0) then													// 範囲指定: 0=ｺｰﾄﾞ順
			SQL.Add ('ORDER BY hm.GCode, ai.GCode')
		else																			// 範囲指定: 1=連想順
			SQL.Add ('ORDER BY hm.Renso, hm.GCode, ai.GCode');

		ParamByName ('strBankCodeStr').AsString	:= m_strPrintBankCodeStr;				// 出力範囲: 銀行ｺｰﾄﾞ(開始)
		ParamByName ('strBankCodeEnd').AsString	:= m_strPrintBankCodeEnd;				// 出力範囲: 銀行ｺｰﾄﾞ(終了)

		Open ();

		CmnMemDataPrintAccount.Active	:= FALSE;
		CmnMemDataPrintAccount.Active	:= TRUE;

		while (not EOF) do
		begin
			CmnMemDataPrintAccount.Append ();

			nHojCode	:= FieldByName ('GCode').AsInteger;

			CmnMemDataPrintAccount.FieldByName ('nBkCode'  ).AsInteger	    := nHojCode;
			CmnMemDataPrintAccount.FieldByName ('strNameSimple').AsString	:= FieldByName ('SimpleName').AsString;
			CmnMemDataPrintAccount.FieldByName ('nAccountCode' ).AsInteger	:= FieldByName ('AccCode'   ).AsInteger;
			CmnMemDataPrintAccount.FieldByName ('nDepDivision' ).AsInteger	:= FieldByName ('AccKbn'    ).AsInteger;

			case (FieldbyName ('AccKbn').AsInteger) of
				1:		CmnMemDataPrintAccount.FieldByName ('strDepDivisionDesc').AsString	:= '普通';
				2:		CmnMemDataPrintAccount.FieldByName ('strDepDivisionDesc').AsString	:= '当座';
				4:		CmnMemDataPrintAccount.FieldByName ('strDepDivisionDesc').AsString	:= '貯蓄';
				9:		CmnMemDataPrintAccount.FieldByName ('strDepDivisionDesc').AsString	:= 'その他';
				else	CmnMemDataPrintAccount.FieldByName ('strDepDivisionDesc').AsString	:= '';
			end;

			CmnMemDataPrintAccount.FieldByName ('strAccountNo').AsString	:= fnGetEditedAccountNumber (FieldByName ('AccNo').AsString);

			if	(FieldByName ('ClientCode').AsString = '') then
				CmnMemDataPrintAccount.FieldByName ('nClientCode').Clear ()
			else
				CmnMemDataPrintAccount.FieldByName ('nClientCode').AsCurrency	:= StrToInt64 (FieldByName ('ClientCode').AsString);

			CmnMemDataPrintAccount.FieldByName ('strClientCodeDescKana').AsString	:= FieldByName ('ClientName').AsString;
			CmnMemDataPrintAccount.FieldByName ('strClientCodeDesc'    ).AsString	:= FieldByName ('AccInfo1'  ).AsString;

			CmnMemDataPrintAccount.FieldByName ('nKmkCodeSub'      ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strKmkCodeSubDesc').Clear ();
			CmnMemDataPrintAccount.FieldByName ('strBumCode'       ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strBumCodeDesc'   ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strSegCode'       ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strSegCodeDesc'   ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strHo1Code'       ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strHo1CodeDesc'   ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strHo2Code'       ).Clear ();
			CmnMemDataPrintAccount.FieldByName ('strHo2CodeDesc'   ).Clear ();

			if	(FieldByName ('CKmkNCode').AsInteger = 0) then
			begin
				CmnMemDataPrintAccount.FieldByName ('nKmkCode'      ).Clear ();
				CmnMemDataPrintAccount.FieldByName ('strKmkCodeDesc').Clear ();
			end
			else
			begin
				fnCheckValidKmkCode (FieldByName ('CKmkNCode').AsInteger, strDescription);

				CmnMemDataPrintAccount.FieldByName ('nKmkCode'      ).AsInteger	:= FieldByName ('CKmkNCode').AsInteger;
				CmnMemDataPrintAccount.FieldByName ('strKmkCodeDesc').AsString	:= strDescription;

				fnSetAttributeJournalInfoPrint (FieldByName ('CKmkNCode').AsInteger);

				for	nPosition := 0 to 2 do
				begin
					CmnMemDataPrintAccount.FieldByName (Format ('nCodeAttribute%.2d',
									[nPosition + 1])).AsInteger	:= m_arCodeAttributePrint [nPosition].nAttribute;

					if	(not m_arCodeAttributePrint [nPosition].fEnabled) then
					begin
						CmnMemDataPrintAccount.FieldByName (Format ('strHojCode%.2d'    , [nPosition + 1])).Clear ();
						CmnMemDataPrintAccount.FieldByName (Format ('strHojCodeDesc%.2d', [nPosition + 1])).Clear ();

						Continue;
					end;

					if	(m_arCodeAttributePrint [nPosition].nMasterDivision = MASTER_SUBJECTPLUS) then
					begin
						if	(FieldByName ('CSubNCode').IsNull) then
						begin
							CmnMemDataPrintAccount.FieldByName (Format ('strHojCode%.2d'    , [nPosition + 1])).Clear ();
							CmnMemDataPrintAccount.FieldByName (Format ('strHojCodeDesc%.2d', [nPosition + 1])).Clear ();
						end
						else
						begin
							fnCheckValidKmsCode (StrToInt(fnGetGcode_Master(FieldByName ('CKmkNCode').AsFloat,MASTER_SUBJECT,1)),
															fnGetGcode_Master(FieldByName ('CSubNCode').AsFloat,MASTER_SUBJECTPLUS,1), strDescription);

							CmnMemDataPrintAccount.FieldByName (Format (
											'strHojCode%.2d'    , [nPosition + 1])).AsString	:= IntToStr (FieldByName ('CSubNCode').AsInteger);
							CmnMemDataPrintAccount.FieldByName (Format (
											'strHojCodeDesc%.2d', [nPosition + 1])).AsString	:= strDescription;

							CmnMemDataPrintAccount.FieldByName ('nKmkCodeSub'      ).AsInteger	:= FieldByName ('CSubNCode').AsInteger;
							CmnMemDataPrintAccount.FieldByName ('strKmkCodeSubDesc').AsString	:= strDescription;
						end;
					end
					else
					begin
						nHojCode	:= 0;

                        if (m_arCodeAttributePrint [nPosition].nMasterDivision = MASTER_SECTION) then
							nHojCode	:= FieldByName ('CBmnNCode').AsInteger
                        else if (m_arCodeAttributePrint [nPosition].nMasterDivision = MASTER_SEGMENT01) then
							nHojCode	:= FieldByName ('CSegNCode').AsInteger
                        else
                        begin
                            if	(m_arCodeAttributePrint [nPosition].nMasterDivision = FieldByName ('CHojKbn1').AsInteger) then
                                nHojCode	:= FieldByName ('CHojNCode1').AsInteger
                            else if (m_arCodeAttributePrint [nPosition].nMasterDivision = FieldByName ('CHojKbn2').AsInteger) then
                                nHojCode	:= FieldByName ('CHojNCode2').AsInteger;
                        end;

						if	nHojCode = 0 then
						begin
							CmnMemDataPrintAccount.FieldByName (Format ('strHojCode%.2d'    , [nPosition + 1])).Clear ();
							CmnMemDataPrintAccount.FieldByName (Format ('strHojCodeDesc%.2d', [nPosition + 1])).Clear ();
						end
						else
						begin
//							fnCheckValidHojCode (m_arCodeAttributePrint [nPosition].nMasterDivision, strHojCode, strDescription);

{							if	(m_arCodeAttributePrint [nPosition].nAttribute <= 1) then
							begin
								case (m_arCodeAttributePrint [nPosition].nAttribute) of
									0:	strFormat	:= '%'  + IntToStr (m_arCodeAttributePrint [nPosition].nDigit) + 'd';
									1:	strFormat	:= '%.' + IntToStr (m_arCodeAttributePrint [nPosition].nDigit) + 'd';
								end;

								strHojCode	:= Format (strFormat, [StrToInt64 (Trim (strHojCode))]);
							end;
}
							CmnMemDataPrintAccount.FieldByName (Format (
											'strHojCode%.2d'    , [nPosition + 1])).AsInteger	:= nHojCode;
							CmnMemDataPrintAccount.FieldByName (Format (
											'strHojCodeDesc%.2d', [nPosition + 1])).AsString	:= strDescription;

                            if (m_arCodeAttributePrint [nPosition].nMasterDivision = MASTER_SECTION) then
							    strPrefix	:= 'strBumCode'
                            else if (m_arCodeAttributePrint [nPosition].nMasterDivision = MASTER_SEGMENT01) then
								strPrefix	:= 'strSegCode'
                            else
                            begin
                                if	(CmnMemDataPrintAccount.FieldByName ('strHo1Code').AsString = '') then
                                    strPrefix	:= 'strHo1Code'
                                else
                                    strPrefix	:= 'strHo2Code';
                            end;

							CmnMemDataPrintAccount.FieldByName (strPrefix         ).AsInteger	:= nHojCode;
							CmnMemDataPrintAccount.FieldByName (strPrefix + 'Desc').AsString	:= strDescription;
						end;
					end;
				end;
			end;

			CmnMemDataPrintAccount.Post ();

			NEXT;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;
<062> Del-Ed *)
// -----<062> Add-St-----
//**************************************************************************
//	Proccess	:	依頼先口座登録ﾘｽﾄのﾃﾞｰﾀをMemDataにｾｯﾄ
//	Name		:	T.Seki
//	Date		:	2008/05/08
//	Parameter	:
//	Return		:
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP008002f.fnPrintCheckListAccount();
var
	dqMasterData	: TMQuery;
	iPosition		: Integer;
	cHojNCode		: Currency;
	strDescription	: String;
	strGCode		: String;
	strFormat		: String;

begin
	dqMasterData := TMQuery.Create(Self);

	try
												// DBとMQueryの接続
		m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterData);

		with dqMasterData do
		begin
			Close();
			SQL.Clear();
			SQL.Add(fnPrintGetSQLAccount());

			Open();

			CmnMemDataPrintAccount.Active := False;
			CmnMemDataPrintAccount.Active := True;

			while not Eof do
			begin
				CmnMemDataPrintAccount.Append();
												// 口座ｺｰﾄﾞ
				CmnMemDataPrintAccount.FieldByName('AccCode').AsInteger			:= FieldByName('AccCode').AsInteger;
												// 銀行ｺｰﾄﾞ
				strGCode := Format('%.4d', [FieldByName('AllBkCode').AsInteger]);
// <080> ADD-STR
                                                // 全銀協支店ｺｰﾄﾞ
				strGCode := strGCode + '-' + Format('%.3d', [FieldByName('AllBraCode').AsInteger]);
// <080> ADD-END
				CmnMemDataPrintAccount.FieldByName('BankCode').AsString			:= strGCode;
												// 銀行名称
				CmnMemDataPrintAccount.FieldByName('BankName').AsString			:= FieldByName('SimpleName').AsString;
												// 預金種目
				CmnMemDataPrintAccount.FieldByName('AccKbnName').AsString		:= FieldByName('AccKbn').AsString;
												// 口座番号
				CmnMemDataPrintAccount.FieldByName('AccNo').AsString			:= fnGetEditedAccountNumber(FieldByName('AccNo').AsString);
												// 振込種別
				CmnMemDataPrintAccount.FieldByName ('ShubetsuName').AsString	:= FieldByName ('Shubetsu').AsString;
												// 依頼書電信扱い
				CmnMemDataPrintAccount.FieldByName ('RequestKbnName').AsString	:= FieldByName ('RequestKbn').AsString;
												// 取扱種目
				CmnMemDataPrintAccount.FieldByName ('ShumokuName').AsString		:= FieldByName ('Shumoku').AsString;
												// 半角ｺｰﾄﾞ体系
				CmnMemDataPrintAccount.FieldByName ('FBCodeModeName').AsString	:= FieldByName ('FBCodeMode').AsString;
												// ﾚｺｰﾄﾞ区切
				CmnMemDataPrintAccount.FieldByName ('RecordPauseName').AsString	:= FieldByName ('RecordPause').AsString;
												// 振込依頼人ｺｰﾄﾞ
				if	FieldByName('ClientCode').AsString <> '' then
				begin
					CmnMemDataPrintAccount.FieldByName('ClientCode').AsCurrency	:= StrToInt64(FieldByName('ClientCode').AsString);
				end;
												// 振込依頼人名
				CmnMemDataPrintAccount.FieldByName('AccInfo1').AsString			:= FieldByName('AccInfo1').AsString;
												// ｶﾅ振込依頼人名
				CmnMemDataPrintAccount.FieldByName('ClientName').AsString		:= FieldByName('ClientName').AsString;
												// ﾌｧｲﾙ名
				CmnMemDataPrintAccount.FieldByName('FileName').AsString			:= FieldByName('FileName').AsString;
												// ﾎﾞﾘｭｰﾑ名
				CmnMemDataPrintAccount.FieldByName('VolName').AsString			:= FieldByName('VolName').AsString;
												// 手数料適用区分
				CmnMemDataPrintAccount.FieldByName('FeeUseModeName').AsString	:= FieldByName('FeeUseMode').AsString;
												// 仕訳情報の勘定科目が登録されていたら
				if	FieldByName('CKmkNCode').AsCurrency <> 0 then
				begin
												// 勘定科目
					fnCheckValidKmkCode(FieldByName('KmkCode').AsInteger, strDescription);

					CmnMemDataPrintAccount.FieldByName('nKmkCode'      ).AsInteger	:= FieldByName('KmkCode').AsInteger;
					CmnMemDataPrintAccount.FieldByName('strKmkCodeDesc').AsString	:= strDescription;

					fnSetAttributeJournalInfoPrint(FieldByName('KmkCode').AsInteger, FieldByName('CKojNCode').AsCurrency);

					for iPosition := 0 to 6 do
					begin
						CmnMemDataPrintAccount.FieldByName(Format('nCodeAttribute%.2d',
								[iPosition + 1])).AsInteger := m_arCodeAttributePrint[iPosition].nAttribute;

												// 採用していない場合は、次の補助へ　

						if	not m_arCodeAttributePrint[iPosition].fEnabled then
						begin
							Continue;
						end;

						case iPosition of
							C_IDX_SAIMOKU:		// 科目別補助
							begin
								if	(not FieldByName('CSubNCode').IsNull) and (not FieldByName('SubCode').IsNull) then
								begin
									strGCode := FieldByName('SubCode').AsString;
												// 属性が数値の場合
									if	m_arCodeAttributePrint[iPosition].nAttribute <= 1 then
									begin
										case m_arCodeAttributePrint[iPosition].nAttribute of
											0:	strFormat := '%'  + IntToStr(m_arCodeAttributePrint[iPosition].nDigit) + 'd';
											1:	strFormat := '%.' + IntToStr(m_arCodeAttributePrint[iPosition].nDigit) + 'd';
										end;

										strGCode := Format(strFormat, [StrToInt64(Trim(strGCode))]);
									end;

									CmnMemDataPrintAccount.FieldByName(Format('strHojCode%.2d',		[iPosition + 1])).AsString	:= strGCode;
									CmnMemDataPrintAccount.FieldByName(Format('strHojCodeDesc%.2d',	[iPosition + 1])).AsString	:= FieldByName('SubKmkName').AsString;
								end;
							end;

							else				// 科目別補助以外の場合
							begin
								cHojNCode	:= 0;

								case iPosition of
									C_IDX_BUMON:	// 部門
									begin
										cHojNCode := FieldByName('CBmnNCode').AsCurrency;
									end;

									C_IDX_SEGMENT:	// ｾｸﾞﾒﾝﾄ
									begin
										cHojNCode := FieldByName('CSegNCode').AsCurrency;
									end;

									C_IDX_HOJYO1:	// 補助1
									begin
										cHojNCode := FieldByName('CHojNCode1').AsCurrency;
									end;

									C_IDX_HOJYO2:	// 補助2
									begin
										cHojNCode := FieldByName('CHojNCode2').AsCurrency;
									end;

									C_IDX_PROJECT:	// ﾌﾟﾛｼﾞｪｸﾄ
									begin
										cHojNCode := FieldByName('CKojNCode').AsCurrency;
									end;

									C_IDX_PROJECTSUB:// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
									begin
										cHojNCode := FieldByName('CKsyNCode').AsCurrency;
									end;
								end;

								if	cHojNCode <> 0 then
								begin
									strGCode := fnGetGcode_Master(cHojNCode, m_arCodeAttributePrint[iPosition].nMasterDivision, m_arCodeAttributePrint[iPosition].nAttribute);

									if	not fnCheckValidHojCode(m_arCodeAttributePrint[iPosition].nMasterDivision, strGCode, strDescription, cHojNCode) then
									begin
										Continue;
									end;

												// 属性が数値の場合
									if	m_arCodeAttributePrint[iPosition].nAttribute <= 1 then
									begin
										case m_arCodeAttributePrint[iPosition].nAttribute of
											0:	strFormat := '%'  + IntToStr(m_arCodeAttributePrint[iPosition].nDigit) + 'd';
											1:	strFormat := '%.' + IntToStr(m_arCodeAttributePrint[iPosition].nDigit) + 'd';
										end;

										strGCode := Format(strFormat, [StrToInt64(Trim(strGCode))]);
									end;

									CmnMemDataPrintAccount.FieldByName(Format('strHojCode%.2d',		[iPosition + 1])).AsString	:= strGCode;
									CmnMemDataPrintAccount.FieldByName(Format('strHojCodeDesc%.2d',	[iPosition + 1])).AsString	:= strDescription;
								end;
							end;
						end;
					end;
				end;
                // <076> Add start
                												// 手数料支払区分
				CmnMemDataPrintAccount.FieldByName ('FeePayKbnName').AsString		:= FieldByName ('FeePayKbn').AsString;
                // <076> Add end
// <087> ADD-STR
                												// 支払レイアウト
				CmnMemDataPrintAccount.FieldByName ('LayoutInfo').AsString		:= FieldByName ('LayoutInfo').AsString;
// <087> ADD-END
// <092> ADD-STR
                												// フリー項目
				CmnMemDataPrintAccount.FieldByName ('AccInfo2').AsString		:= FieldByName ('AccInfo2').AsString;
// <092> ADD-END
// <099> ADD-STR
                												// 口座メモ
				CmnMemDataPrintAccount.FieldByName ('AccMemo').AsString		    := FieldByName ('AccMemo').AsString;
// <099> ADD-END
// <103> ADD-STR
                                                                // 総合振込出力方式
				CmnMemDataPrintAccount.FieldByName ('AccZanLimitName').AsString		:= FieldByName ('AccZanLimit').AsString;

// <103> ADD-END
				CmnMemDataPrintAccount.Post();

				Next();
			end;
		end;

	finally
		dqMasterData.Free();
	end;
end;

//**************************************************************************
//	Proccess	:	依頼先口座登録ﾘｽﾄのﾃﾞｰﾀ取得SQLを返す
//	Name		:	T.Seki
//	Date		:	2008/05/08
//	Parameter	:
//	Return		:	SQL
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP008002f.fnPrintGetSQLAccount(): String;
var
	strSQL: String;
begin
	strSQL :=	' SELECT'
			+	'  ai.GCode AccCode'					// 依頼先口座ｺｰﾄﾞ
			+	' ,bi.AllBkCode'						// 全銀協ｺｰﾄﾞ
			+	' ,bi.AllBraCode'						// 全銀協支店ｺｰﾄﾞ <080> ADD
			+	' ,bi.SimpleName'						// 銀行名称
			+	' ,case coalesce(ai.AccKbn, 0)'			// 預金種別
			+	'   when 1 then ''普通'''
			+	'   when 2 then ''当座'''
			+	'   when 4 then ''貯蓄'''
			+	'   when 9 then ''その他'''
			+	'   else '''''
			+	'  end as AccKbn'
			+	' ,ai.AccNo'							// 口座番号
			+	' ,case coalesce(ai.Shubetsu, 0)'		// 振込種別
			+	'   when 0 then ''全銀協FD'''
			+	'   when 1 then ''振込依頼書'''
// <084> MOD-STR
//			+	'   when 2 then ''F/B'''
			+	'   when 2 then ''全銀協FD'''
// <084> MOD-END
			+	'   else '''''
			+	'  end as Shubetsu'
			+	' ,case coalesce(ai.RequestKbn, 0)'		// 依頼書電信扱い
			+	'   when 0 then ''電信'''
			+	'   when 1 then ''文書'''
			+	'   else '''''
			+	'  end as RequestKbn'
			+	' ,case coalesce(ai.Shumoku, 0)'		// 取扱種目
			+	'   when 0 then ''総合振込'''
			+	'   when 1 then ''給与振込'''
			+	'   when 2 then ''振込'''
			+	'   when 3 then ''共通'''
			+	'   else '''''
			+	'  end as Shumoku'
			+	' ,case coalesce(ai.FBCodeMode, 0)'		// 半角ｺｰﾄﾞ体系
			+	'   when 0 then ''JIS'''
			+	'   when 1 then ''EBCDIC'''
			+	'   else '''''
			+	'  end as FBCodeMode'
			+	' ,case coalesce(ai.RecordPause, 0)'	// ﾚｺｰﾄﾞ区切
			+	'   when 0 then ''なし'''
			+	'   when 1 then ''CR'''
			+	'   when 2 then ''CR/LF'''
			+	'   else '''''
			+	'  end as RecordPause'
			+	' ,ai.ClientCode'						// 振込依頼人ｺｰﾄﾞ
			+	' ,ai.AccInfo1'							// 振込依頼人名
			+	' ,ai.ClientName'						// ｶﾅ振込依頼人名
			+	' ,ai.FileName'							// ﾌｧｲﾙ名
			+	' ,ai.VolName'							// ﾎﾞﾘｭｰﾑ名
			+	' ,case coalesce(ai.FeeUseMode, 0)'		// 手数料適用区分
			+	'   when 0 then ''標準手数料のみ'''
			+	'   when 1 then ''個別手数料（自社負担）'''
			+	'   when 2 then ''個別手数料（自社／他社負担）'''
			+	'   else '''''
			+	'  end as FeeUseMode'
			+	' ,ai.CKmkNCode, ai.CSubNCode, ai.CBmnNCode, ai.CSegNCode, ai.CHojKbn1, ai.CHojNCode1'
			+	' ,ai.CHojKbn2, ai.CHojNCode2, ai.CKojNCode, ai.CKsyNCode'
			+	' ,Km.GCode KmkCode, Km.SimpleName KmkName'
			+	' ,SubKm.SubCode, SubKm.SimpleName SubKmkName'
            // <076> Add start
			+	' ,case coalesce(ai.FeePayKbn, 0)'	// ﾚｺｰﾄﾞ区切
			+	'   when 0 then ''未払計上'''
			+	'   when 1 then ''支払時計上'''
			+	'   else '''''
			+	'  end as FeePayKbn'
			// <076> Add end
			+	' , LayoutInfo'                         // 支払レイアウト <087> ADD
			+	' , AccInfo2'							// フリー項目 <092> ADD
			+	' , AccMemo'							// 口座メモ <099> ADD
			+	' ,case coalesce(ai.AccZanLimit, 0)'	// 総合振込出力方式 <103>
			+	'   when 0 then ''固定長'''
			+	'   when 1 then ''XML'''
			+	'   else '''''
			+	'  end as AccZanLimit'
			+	' FROM AccInfo ai'
			+	' LEFT OUTER JOIN BankInfo bi'
			+	' ON bi.MasterKbn = 21 AND bi.NCode = ai.BankNCode AND bi.RdelKbn = 0'
			+	' LEFT OUTER JOIN KmkMA Km'
			+	' ON Km.MasterKbn = 1'
			+	' AND Km.SumKbn = 0'
			+	' AND Km.NCode = ai.CKmkNCode'
			+	' AND Km.CNCode = 0'
			+	' AND Km.RDelKbn = 0'
			+	' LEFT OUTER JOIN KmkMA SubKm'
			+	' ON SubKm.MasterKbn = 2'
			+	' AND SubKm.SumKbn = 0'
			+	' AND SubKm.NCode = ai.CKmkNCode'
			+	' AND SubKm.CNCode = ai.CSubNCode'
			+	' AND SubKm.RDelKbn = 0'
			+	' WHERE ai.RdelKbn = 0';

	if	m_nOrderDivision = 0 then				// 範囲指定: 0=ｺｰﾄﾞ順
	begin
		strSQL := strSQL
			+	' ORDER BY bi.AllBkCode, bi.AllBraCode';
	end
	else										// 範囲指定: 1=連想順
	begin
		strSQL := strSQL
			+	' ORDER BY bi.Renso, bi.AllBkCode, bi.AllBraCode';
	end;

	Result := strSQL;
end;
// -----<062> Add-Ed-----

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnPrintCheckListDetail ();
var
	dqMasterData: TMQuery;
	dqFeeInfo	: TMQuery;
	nClass		: Integer;
	nRow		: Integer;
	nColumn		: Integer;
//	strFormat	: String;
//	nBkCode  	: Integer;
	strPrefix	: String;

// <TX26> ADD-STR
    // 数値日付→文字型日付変換(PAY710100から流用)
    function fnCnvDateIntToStr(iDate: Integer): String;
    var
        dtDateValue	: TDateTime;	// 変換用
        iDateValue	: Longint;		// 変換用
        CmpOpt		: TMdtCmpOpt;	// 変換オプション
        cEra		: Char;			// 元号記号取得用
    begin
        Result := '';

		if iDate = 0 then
			Exit;

        dtDateValue := MjsDateCtrl.MjsIntToDate(iDate, #0);

        // 和暦/西暦判定
        if m_nDateFormatDivision = 0 then	// 和暦
        begin
            // 年、月、日が有効
            CmpOpt := MdtCMP_YMD;
            // 元号取得
            cEra := MjsGetGengou(dtDateValue, CmpOpt);
            // 6桁日付形式に変換
            iDateValue := MjsDateToInt6(dtDateValue, MdtWAREKI);
            // 日付文字作成
            Result := cEra + ' '							// 元号
                    + copy(IntToStr(iDateValue),1,2)      	// 年
                    + '/' + copy(IntToStr(iDateValue),3,2)	// 月
                    + '/' + copy(IntToStr(iDateValue),5,2);	// 日
        end
        else					// 西暦
        begin
            // 8桁日付形式に変換
            iDateValue := MjsDateToInt8(dtDateValue);
            // 日付文字作成
            Result := copy(IntToStr(iDateValue),1,4)		// 年
                    + '/' + copy(IntToStr(iDateValue),5,2)	// 月
                    + '/' + copy(IntToStr(iDateValue),7,2);	// 日
        end;
    end;
// <TX26> ADD-END
begin
//	CmnReportDetailDBTextBankCode.Alignment	:= taRightJustify;

	dqMasterData	:= TMQuery.Create (Self);
	dqFeeInfo		:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqFeeInfo   );							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
{
		SQL.Add   ('SELECT hm.GCode, hm.SimpleName,  bi.AllBkCode, bi.AllBraCode, bi.BankName, ');
//		SQL.Add   ('       bi.BkBraName, bi.BankKanaName, bi.BraKanaName, ac.FuriHouhou,ac.FeeUseMode ');
		SQL.Add   ('       bi.BkBraName, bi.BankKanaName, bi.BraKanaName,               ac.FeeUseMode ');
		SQL.Add   ('     , ac.FBCodeMode, ac.RecordPause, ac.FileName, ac.VolName ');
		SQL.Add   ('FROM   HojyoMA hm ');
		SQL.Add   ('LEFT OUTER JOIN BankInfo   bi ON hm.MasterKbn = bi.MasterKbn AND hm.BankNCode = bi.NCode AND bi.RdelKbn = 0 ');
		SQL.Add   ('LEFT OUTER JOIN AccInfo    ac ON hm.MasterKbn = bi.MasterKbn AND bi.NCode = ac.BankNCode AND ac.RdelKbn = 0 ');
		SQL.Add   ('WHERE  hm.MasterKbn = 21 AND hm.SumKbn = 0 AND ');
		SQL.Add   ('       hm.RdelKbn = 0 AND hm.GCode >= :strBankCodeStr and hm.GCode <= :strBankCodeEnd ');
}
		SQL.Add   ('SELECT ');
		SQL.Add   ('	bi.NCode As BiNCode,	');
		SQL.Add   ('	bi.AllBkCode,			');
		SQL.Add   ('	bi.AllBraCode,			');
		SQL.Add   ('	bi.BankName,			');
		SQL.Add   ('	bi.BkBraName,			');
		SQL.Add   ('	bi.BankKanaName,		');
		SQL.Add   ('	bi.BraKanaName,			');
		SQL.Add   ('	bi.SimpleName,			');
		SQL.Add   ('	bi.TegLayPath,			');
		SQL.Add   ('	bi.TegKinSyubetu,		');
		SQL.Add   ('	bi.KogLayPath,			');
		SQL.Add   ('	bi.KogKinSyubetu,		');
		SQL.Add   ('	bi.BillLayPath1,		');
		SQL.Add   ('	bi.BillLayPath2,		');
		SQL.Add   ('	bi.BillLayPath3,		');
		SQL.Add   ('	bi.BillLayPath4,		');     // 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
		SQL.Add   ('	bi.BillRate,			');
		SQL.Add   ('	ac.GCode,				');
		SQL.Add   ('	ac.AccKbn,				');
		SQL.Add   ('	ac.AccNo,				');
		SQL.Add   ('	ac.FBCodeMode,			');
		SQL.Add   ('	ac.RecordPause,			');
		SQL.Add   ('	ac.FileName,			');
		SQL.Add   ('	ac.VolName,				');
		SQL.Add   ('	ac.FeeUseMode			');
// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			SQL.Add   ('	,						');
			SQL.Add   ('	bi.ClientCode  AS SoukinClientCode,	');		// 送金依頼人ｺｰﾄﾞ
			SQL.Add   ('	bi.ClientName  AS SoukinClientName,	');		// 送金依頼人名称(ｶﾅ)
			SQL.Add   ('	bi.FBCodeMode  AS SoukinCodeMode,	');		// 半角ｺｰﾄﾞ体系
			SQL.Add   ('	bi.RecordPause AS SoukinRecordPause,');		// ﾚｺｰﾄﾞ区切
			SQL.Add   ('	bi.FileName    AS SoukinFileName	');		// ﾌｧｲﾙ名称
		end;
// <096> ADD↑
		SQL.Add   ('FROM   BankInfo bi ');
// <081> MOD-STR
//		SQL.Add   ('LEFT OUTER JOIN AccInfo ac ON bi.NCode = ac.BankNCode AND ac.RdelKbn = 0 ');
        // 銀行依頼書口座コードとAccInfoを結合する
		SQL.Add   ('LEFT OUTER JOIN AccInfo ac ON bi.BillAccCode = ac.NCode AND ac.RdelKbn = 0 ');
// <081> MOD-END
		SQL.Add   ('WHERE  bi.MasterKbn = 21 AND ');
		SQL.Add   ('       bi.RdelKbn = 0 ');
//        SQL.Add   ('       AND hm.GCode >= :strBankCodeStr and hm.GCode <= :strBankCodeEnd ');

//		if	(m_nPrintOrder = 0) then													// 範囲指定: 0=ｺｰﾄﾞ順	// <065>
		if	(m_nOrderDivision = 0) then													// 範囲指定: 0=ｺｰﾄﾞ順	// <062>
			SQL.Add ('ORDER BY bi.AllBkCode, bi.AllBraCode')
		else																			// 範囲指定: 1=連想順
			SQL.Add ('ORDER BY bi.Renso, bi.AllBkCode, bi.AllBraCode');
{
		ParamByName ('strBankCodeStr').AsString	:= m_strPrintBankCodeStr;				// 出力範囲: 銀行ｺｰﾄﾞ(開始)
		ParamByName ('strBankCodeEnd').AsString	:= m_strPrintBankCodeEnd;				// 出力範囲: 銀行ｺｰﾄﾞ(終了)
}
		Open ();

		CmnMemDataPrintDetail.Active	:= FALSE;
		CmnMemDataPrintDetail.Active	:= TRUE;

		while (not EOF) do
		begin
			CmnMemDataPrintDetail.Append ();

//<PRN2>			nBkCode	:= FieldByName ('GCode').AsInteger;

//			CmnMemDataPrintDetail.FieldByName ('grTag'        ).Assign (fnGetBitmapSelectedTag (FieldByName ('FusenKbn').AsInteger));
//<PRN2>			CmnMemDataPrintDetail.FieldByName ('nBkCode'  ).AsInteger   	:= nBkCode;
			CmnMemDataPrintDetail.FieldByName ('strNameSimple').AsString	:= FieldByName ('SimpleName').AsString;
//<PRN2>{
			if	((FieldByName ('AllBkCode').AsInteger = 0) and (FieldByName ('AllBraCode').AsInteger = 0)) then
			begin
				//CmnMemDataPrintDetail.FieldByName ('nAllBankCode').Clear ();
				//CmnMemDataPrintDetail.FieldByName ('nBranchCode' ).Clear ();
				CmnMemDataPrintDetail.FieldByName ('strAllBankCd' ).Clear ();
			end
			else
			begin
				//CmnMemDataPrintDetail.FieldByName ('nAllBankCode').AsInteger	:= FieldByName ('AllBkCode' ).AsInteger;
				//CmnMemDataPrintDetail.FieldByName ('nBranchCode' ).AsInteger	:= FieldByName ('AllBraCode').AsInteger;
				CmnMemDataPrintDetail.FieldByName ('strAllBankCd' ).AsString
                	 := Format('%.4d', [FieldByName ('AllBkCode' ).AsInteger])
                     + '-'
                	 + Format('%.3d', [FieldByName ('AllBraCode' ).AsInteger])
			end;

			CmnMemDataPrintDetail.FieldByName ('strAllBankCodeDesc'    ).AsString	:= FieldByName ('BankName'    ).AsString;
			CmnMemDataPrintDetail.FieldByName ('strBranchCodeDesc'     ).AsString	:= FieldByName ('BkBraName'   ).AsString;
			CmnMemDataPrintDetail.FieldByName ('strAllBankCodeDescKana').AsString	:= FieldByName ('BankKanaName').AsString;
			CmnMemDataPrintDetail.FieldByName ('strBranchCodeDescKana' ).AsString	:= FieldByName ('BraKanaName' ).AsString;
{
			case (FieldbyName ('FuriHouhou').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strPayDivisionDesc').AsString	:= 'F/B';
				1:		CmnMemDataPrintDetail.FieldByName ('strPayDivisionDesc').AsString	:= '振込依頼書';
				else	CmnMemDataPrintDetail.FieldByName ('strPayDivisionDesc').AsString	:= '';
			end;
}
{
			case (FieldbyName ('FBSendKbn').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strFBSendDivisionDesc').AsString	:= '送信しない';
				1:		CmnMemDataPrintDetail.FieldByName ('strFBSendDivisionDesc').AsString	:= '送信する';
				else	CmnMemDataPrintDetail.FieldByName ('strFBSendDivisionDesc').AsString	:= '送信しない';
			end;
}
			case (FieldbyName ('FBCodeMode').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strFBCodeModeDesc').AsString	:= 'JIS';
				1:		CmnMemDataPrintDetail.FieldByName ('strFBCodeModeDesc').AsString	:= 'EBCDIC';
				else	CmnMemDataPrintDetail.FieldByName ('strFBCodeModeDesc').AsString	:= '';
			end;

			case (FieldbyName ('RecordPause').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strRecordPauseDesc').AsString	:= 'なし';
				1:		CmnMemDataPrintDetail.FieldByName ('strRecordPauseDesc').AsString	:= 'CR';
				2:		CmnMemDataPrintDetail.FieldByName ('strRecordPauseDesc').AsString	:= 'CR/LF';
				else	CmnMemDataPrintDetail.FieldByName ('strRecordPauseDesc').AsString	:= '';
			end;

			CmnMemDataPrintDetail.FieldByName ('strFileName'       ).AsString	:= FieldByName ('FileName'  ).AsString;
			CmnMemDataPrintDetail.FieldByName ('strVolumeName'     ).AsString	:= FieldByName ('VolName'   ).AsString;
//			CmnMemDataPrintDetail.FieldByName ('strFileNameExp'    ).AsString	:= FieldByName ('KFileName' ).AsString;
//			CmnMemDataPrintDetail.FieldByName ('strVolumeNameExp'  ).AsString	:= FieldByName ('KValName'  ).AsString;
			CmnMemDataPrintDetail.FieldByName ('strLayoutPathDraft').AsString	:= FieldByName ('TegLayPath').AsString;
			CmnMemDataPrintDetail.FieldByName ('strLayoutPathCheck').AsString	:= FieldByName ('KogLayPath').AsString;
			CmnMemDataPrintDetail.FieldByName ('BillLayPath1').AsString	:= FieldByName ('BillLayPath1').AsString;
			CmnMemDataPrintDetail.FieldByName ('BillLayPath2').AsString	:= FieldByName ('BillLayPath2').AsString;
			CmnMemDataPrintDetail.FieldByName ('BillLayPath3').AsString	:= FieldByName ('BillLayPath3').AsString;
			CmnMemDataPrintDetail.FieldByName ('BillLayPath4').AsString	:= FieldByName ('BillLayPath4').AsString;   // 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
//			CmnMemDataPrintDetail.FieldByName ('AccNo').AsString	:= FieldByName ('AccNo').AsString;
			CmnMemDataPrintDetail.FieldByName ('BillRate').AsFloat	:= FieldByName ('BillRate').AsFloat;


			case (FieldByName ('TegKinSyubetu').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '縦縞';
				1:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '斜縞';
				2:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '漢数字';
				3:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '縦縞(狭)';
				4:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '斜縞(狭)';
				else	CmnMemDataPrintDetail.FieldByName ('strChaDivisionDraftDesc').AsString	:= '';
			end;

			case (FieldByName ('KogKinSyubetu').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '縦縞';
				1:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '斜縞';
				2:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '漢数字';
				3:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '縦縞(狭)';
				4:		CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '斜縞(狭)';
				else	CmnMemDataPrintDetail.FieldByName ('strChaDivisionCheckDesc').AsString	:= '';
			end;

// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			// 送金依頼人ｺｰﾄﾞ
			CmnMemDataPrintDetail.FieldByName ('strSoukinClientCode').AsString	:= FieldByName ('SoukinClientCode').AsString;

			// 送金依頼人名称(ｶﾅ)
			CmnMemDataPrintDetail.FieldByName ('strSoukinClientName').AsString	:= FieldByName ('SoukinClientName').AsString;

			// 半角ｺｰﾄﾞ体系
			case (FieldbyName ('SoukinCodeMode').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strSoukinCodeModeDesc').AsString	:= 'JIS';
				1:		CmnMemDataPrintDetail.FieldByName ('strSoukinCodeModeDesc').AsString	:= 'EBCDIC';
				else	CmnMemDataPrintDetail.FieldByName ('strSoukinCodeModeDesc').AsString	:= '';
			end;

			// ﾚｺｰﾄﾞ区切
			case (FieldbyName ('SoukinRecordPause').AsInteger) of
				0:		CmnMemDataPrintDetail.FieldByName ('strSoukinRecordPauseDesc').AsString	:= 'なし';
				1:		CmnMemDataPrintDetail.FieldByName ('strSoukinRecordPauseDesc').AsString	:= 'CR';
				2:		CmnMemDataPrintDetail.FieldByName ('strSoukinRecordPauseDesc').AsString	:= 'CR/LF';
				else	CmnMemDataPrintDetail.FieldByName ('strSoukinRecordPauseDesc').AsString	:= '';
			end;

			// 送金依頼人名称(ｶﾅ)
			CmnMemDataPrintDetail.FieldByName ('strSoukinFileName').AsString	:= FieldByName ('SoukinFileName').AsString;
		end;
// <096> ADD↑

			with (dqFeeInfo) do
			begin
				// ↓↓↓入金口座
				if (dqMasterData.FieldByName ('GCode').AsString <> '') then
                begin
{
					Close ();

					SQL.Clear ();
	    	        SQL.Add('SELECT SimpleName '
    	    	        +   'FROM   BankInfo '
        	    	    +   'WHERE RDelKbn   = 0 '
	                	+   '  AND AllBkCode = :BankCode ');

					ParamByName ('BankCode').AsString	:= dqMasterData.FieldByName ('GCode').AsString;

					Open ();

					if	(EOF) then
					begin
}
           				CmnMemDataPrintDetail.FieldByName ('AccNo').AsString
		                 := dqMasterData.FieldByName ('SimpleName').AsString
                         + '  預金種目：';
			            case dqMasterData.FieldByName ('AccKbn'    ).AsInteger of
            			    1: CmnMemDataPrintDetail.FieldByName ('AccNo').AsString := CmnMemDataPrintDetail.FieldByName ('AccNo').AsString+ '普通';
			                2: CmnMemDataPrintDetail.FieldByName ('AccNo').AsString := CmnMemDataPrintDetail.FieldByName ('AccNo').AsString+ '当座';
			                4: CmnMemDataPrintDetail.FieldByName ('AccNo').AsString := CmnMemDataPrintDetail.FieldByName ('AccNo').AsString+ '貯蓄';
			                9: CmnMemDataPrintDetail.FieldByName ('AccNo').AsString := CmnMemDataPrintDetail.FieldByName ('AccNo').AsString+ 'その他';
            			end;
                        CmnMemDataPrintDetail.FieldByName ('AccNo').AsString
                         := CmnMemDataPrintDetail.FieldByName ('AccNo').AsString
                         + '  口座番号：'
                         + dqMasterData.FieldByName ('AccNo').AsString;
//  					end;
                end;
				// ↑↑↑入金口座

				for	nClass := 1 to 3 do
				begin
					case (nClass) of
						1:	strPrefix	:= 'Std';
						2:	strPrefix	:= 'Fbu';
						3:	strPrefix	:= 'Win';
					end;

					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT * FROM FeeInfo ');
					SQL.Add   ('WHERE  MasterKbn = 21 AND BankNCode = :nBkCode AND RecSyubetu = :nClass');

					ParamByName ('nBkCode').AsString	:= dqMasterData.FieldByName ('BiNCode').AsString;
					ParamByName ('nClass'     ).AsInteger	:= nClass;

					Open ();

					if	(EOF) then
					begin
						for	nRow := 1 to 3 do
						begin
							CmnMemDataPrintDetail.FieldByName ('nFeeDivision'      ).Clear ();
							CmnMemDataPrintDetail.FieldByName ('strFeeDivisionDesc').AsString	:= '';

							CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeFr%.2d', [strPrefix, nRow])).Clear ();

							if	(nRow <> 3) then
								CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeRe%.2d', [strPrefix, nRow])).Clear ();

							for	nColumn := 1 to 4 do
								CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%s%.2d%.2d', [strPrefix, nRow, nColumn])).Clear ();
						end;
					end
					else
					begin
						CmnMemDataPrintDetail.FieldByName ('nFeeDivision').AsInteger	:= dqMasterData.FieldByName ('FeeUseMode').AsInteger;

						case (dqMasterData.FieldbyName ('FeeUseMode').AsInteger) of
							0:		CmnMemDataPrintDetail.FieldByName ('strFeeDivisionDesc').AsString	:= '標準手数料のみ';
							1:		CmnMemDataPrintDetail.FieldByName ('strFeeDivisionDesc').AsString	:= '個別手数料(自社負担)';
							2:		CmnMemDataPrintDetail.FieldByName ('strFeeDivisionDesc').AsString	:= '個別手数料(自社／他社負担)';
							else	CmnMemDataPrintDetail.FieldByName ('strFeeDivisionDesc').AsString	:= '';
						end;

						CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeFr01', [strPrefix])).AsCurrency	:= 0;
						CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeFr02', [strPrefix])).AsCurrency	:= FieldByName ('FeeStand1').AsCurrency;
						CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeFr03', [strPrefix])).AsCurrency	:= FieldByName ('FeeStand2').AsCurrency;
						CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeRe01', [strPrefix])).AsCurrency	:= FieldByName ('FeeStand1').AsCurrency;
						CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%sScopeRe02', [strPrefix])).AsCurrency	:= FieldByName ('FeeStand2').AsCurrency;

						for	nRow := 1 to 3 do
						begin
							for	nColumn := 1 to 4 do
								CmnMemDataPrintDetail.FieldByName (Format ('nFeePrice%s%.2d%.2d', [strPrefix, nRow, nColumn])).AsCurrency	:=
																						FieldByName (Format ('Fee%d%d', [nColumn, nRow])).AsCurrency;
						end;
                        CmnMemDataPrintDetail.FieldByName ('strStartYMD').AsString := fnCnvDateIntToStr(FieldByName ('StartDate').AsInteger);   // <TX26> ADD
					end;
				end;
// <096> ADD↓
				if not TMSeries.IsMjsLink3 then
				begin
					// 11:電子記録債権発生手数料
					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT Fee41, Fee11 FROM FeeInfo ');
					SQL.Add   ('WHERE  MasterKbn = 21 AND BankNCode = :nBkCode AND RecSyubetu = 11');

					ParamByName ('nBkCode').AsString	:= dqMasterData.FieldByName('BiNCode').AsString;

					Open ();

					if (not EOF) then
					begin
						CmnMemDataPrintDetail.FieldByName('nDensai1').AsCurrency	:= FieldByName('Fee41').AsCurrency;
						CmnMemDataPrintDetail.FieldByName('nDensai2').AsCurrency	:= FieldByName('Fee11').AsCurrency;
				   	end;
				end;

				if not TMSeries.IsMjsLink3 and
				   not TMSeries.IsGalileopt then
				begin
					// 12:海外手数料
					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT Fee41, Fee11, OverseaFee FROM FeeInfo ');
					SQL.Add   ('WHERE  MasterKbn = 21 AND BankNCode = :nBkCode AND RecSyubetu = 12');

					ParamByName ('nBkCode').AsString	:= dqMasterData.FieldByName('BiNCode').AsString;

					Open ();

					if (not EOF) then
					begin
						CmnMemDataPrintDetail.FieldByName('nOversea1').AsCurrency	:= FieldByName('Fee41').AsCurrency;
						CmnMemDataPrintDetail.FieldByName('nOversea2').AsCurrency	:= FieldByName('Fee11').AsCurrency;
						CmnMemDataPrintDetail.FieldByName('nOversea3').AsCurrency	:= FieldByName('OverseaFee').AsCurrency;
				   	end;
				end;
// <096> ADD↑
			end;
//<PRN2>}
			CmnMemDataPrintDetail.Post ();

			NEXT;
		end;
	end;

	dqMasterData.Close ();
	dqFeeInfo   .Close ();
	dqMasterData.Free  ();
	dqFeeinfo   .Free  ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnPrintCheckListStandard ();
var
	dqMasterData: TMQuery;
//	strFormat	: String;
	nBkCode	    : Integer;

begin
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	CmnReportStandardDBTextBankCode.Alignment	:= taRightJustify;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT hm.GCode, hm.Renso, ');
//		SQL.Add   ('       hm.LongName, hm.SimpleName, hm.StartDate, hm.EndDate, hm.UpdateTime, fi.FusenKbn  ');
		SQL.Add   ('       hm.LongName, hm.SimpleName, hm.StartDate, hm.EndDate, hm.UpdateTime  ');
		SQL.Add   ('FROM   HojyoMA hm ');
//		SQL.Add   ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn AND hm.GCode = fi.HojyoCode ');
		SQL.Add   ('WHERE  hm.MasterKbn = 21 AND hm.SumKbn = 0 AND ');
		SQL.Add   ('       RdelKbn = 0 AND hm.GCode >= :strBankCodeStr and hm.GCode <= :strBankCodeEnd ');

//		if	(m_nPrintOrder = 0) then													// 範囲指定: 0=ｺｰﾄﾞ順	// <065>
		if	(m_nOrderDivision = 0) then													// 範囲指定: 0=ｺｰﾄﾞ順	// <065>
			SQL.Add ('ORDER BY hm.GCode')
		else																			// 範囲指定: 1=連想順
			SQL.Add ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('strBankCodeStr').AsString	:= m_strPrintBankCodeStr;				// 出力範囲: 銀行ｺｰﾄﾞ(開始)
		ParamByName ('strBankCodeEnd').AsString	:= m_strPrintBankCodeEnd;				// 出力範囲: 銀行ｺｰﾄﾞ(終了)

		Open ();

		CmnMemDataPrintStandard.Active	:= FALSE;
		CmnMemDataPrintStandard.Active	:= TRUE;

		while (not EOF) do
		begin
			CmnMemDataPrintStandard.Append ();

			nBkCode	:= FieldByName ('GCode').AsInteger;

//			CmnMemDataPrintStandard.FieldByName ('grTag').Assign (fnGetBitmapSelectedTag (FieldByName ('FusenKbn').AsInteger));
			CmnMemDataPrintStandard.FieldByName ('nBkCode'   ).AsInteger	:= nBkCode;
			CmnMemDataPrintStandard.FieldByName ('strAssociation').AsString	:= FieldByName ('RenChar'   ).AsString;
			CmnMemDataPrintStandard.FieldByName ('strName'       ).AsString	:= FieldByName ('LongName'  ).AsString;
			CmnMemDataPrintStandard.FieldByName ('strNameSimple' ).AsString	:= FieldByName ('SimpleName').AsString;

			if	(not FieldByName ('StartDate').IsNull) then
				CmnMemDataPrintStandard.FieldByName ('dtAppDateStart').AsDateTime	:= FieldByName ('StartDate').AsDateTime
			else
				CmnMemDataPrintStandard.FieldbyName ('dtAppDateStart').Clear ();

			if	(not FieldByName ('EndDate').IsNull) then
				CmnMemDataPrintStandard.FieldByName ('dtAppDateEnd').AsDateTime	:= FieldByName ('EndDate').AsDateTime
			else
				CmnMemDataPrintStandard.FieldByName ('dtAppDateEnd').Clear ();

			if	(not FieldByName ('UpdateTime').IsNull) then
				CmnMemDataPrintStandard.FieldByName ('dtUpdateDate').AsDateTime	:= FieldByName ('UpdateTime').AsDateTime
			else
				CmnMemDataPrintStandard.FieldByName ('dtUpdateDate').Clear ();

			CmnMemDataPrintStandard.Post ();

			NEXT;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnRebuildGridAccInfo (nNCode: Extended);
var
	dqMasterData  : TMQuery;
//	strCaption	  : String;
//	strDescription: String;

begin
	CmnMemDataAccInfo.Active	:= FALSE;   //<015>
	CmnMemDataAccInfo.Active	:= TRUE;    //<015>

	if	nNCode = 0 then
	begin
		CmnTabAccount.BorderCaption	:= '口座管理情報';
// <049> ADD-STR
		CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options - [egoCanAppend] + [egoRowSelect];
		CmnGridAccInfoColumnDepDivision   .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnAccountNo     .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnClientCode    .ReadOnly	:= TRUE;
		CmnGridAccInfoColumnClientNameKana.ReadOnly	:= TRUE;
// <049> ADD-END
		Exit;
// <049> ADD-STR
    end
    else
    begin
// <058> MOD start
(*
		CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options + [egoCanAppend] - [egoRowSelect];
		CmnGridAccInfoColumnDepDivision   .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnAccountNo     .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnClientCode    .ReadOnly	:= FALSE;
		CmnGridAccInfoColumnClientNameKana.ReadOnly	:= FALSE;
*)

    	if m_nReferMode = REFER then        // 参照時は口座管理情報グリッドを行選択にする
        begin
        	CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options - [egoCanAppend] + [egoRowSelect];
			CmnGridAccInfoColumnDepDivision   .ReadOnly	:= TRUE;
			CmnGridAccInfoColumnAccountNo     .ReadOnly	:= TRUE;
			CmnGridAccInfoColumnClientCode    .ReadOnly	:= TRUE;
			CmnGridAccInfoColumnClientNameKana.ReadOnly	:= TRUE;
        end
        else
        begin
         	CmnGridAccInfo                    .Options	:= CmnGridAccInfo.Options + [egoCanAppend] - [egoRowSelect];
			CmnGridAccInfoColumnDepDivision   .ReadOnly	:= FALSE;
			CmnGridAccInfoColumnAccountNo     .ReadOnly	:= FALSE;
			CmnGridAccInfoColumnClientCode    .ReadOnly	:= FALSE;
			CmnGridAccInfoColumnClientNameKana.ReadOnly	:= FALSE;
        end;
// <058> MOD end

// <049> ADD-END
	end;

//	fnCheckValidHojCode	(MASTER_BANK, nBkCode, strDescription);

//	strCaption	:= IntToStr(nBkCode);

//	CmnTabAccount.BorderCaption	:= '口座管理情報： ' + strCaption + ' ' + strDescription;

	m_fUnderConstruction	:= TRUE;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

//<015>	CmnMemDataAccInfo.Active	:= FALSE;
//<015>	CmnMemDataAccInfo.Active	:= TRUE;

	CmnDataSourceAccInfo.DataSet	:= nil;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Add   ('SELECT ai.GCode, ai.BankNCode, ai.AccKbn, ai.AccNo, ai.ClientCode, ai.ClientName, ');
		SQL.Add   ('       bk.SimpleName ');
		SQL.Add   ('FROM   AccInfo ai LEFT OUTER JOIN BankInfo bk ');
		SQL.Add   ('ON     bk.MasterKbn = :nMasterDivision AND ai.BankNCode = bk.NCode AND bk.RdelKbn = 0 ');
		SQL.Add   ('WHERE  ai.RdelKbn = 0  AND ai.BankNCode = :nNCode ORDER BY ai.GCode');

		ParamByName ('nMasterDivision').AsInteger := MASTER_BANK;
		ParamByName ('nNCode'    ).AsFloat	      := nNCode;

		Open ();

		while (not EOF) do
		begin
			fnSetRecordMemDataAccInfo (dqMasterData);
			NEXT;
		end;
    end;

	CmnDataSourceAccInfo.DataSet	:= CmnMemDataAccInfo;

	CmnMemDataAccInfo.First ();

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_fUnderConstruction	:= FALSE;
end;
//***********************************************************************************************************/
//  ｸﾞﾘｯﾄﾞ表示
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnRebuildGridBankInfo ();
var
    dqMasterData: TMQuery;

begin

	m_fUnderConstruction	:= TRUE;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

    if ( CmnMemDataHojyoMA.Active ) then CmnMemDataHojyoMA.Close;
    CmnMemDataHojyoMA.Open;

//	CmnMemDataHojyoMA.Active	:= FALSE;
//	CmnMemDataHojyoMA.Active	:= TRUE;

	CmnDataSourceHojyoMA.DataSet	:= nil;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT Bk.NCODE,Bk.AllBkCODE, Bk.AllBraCode, bk.BankName, bk.BkBraName,BK.OffDNCode, ');
		SQL.Add   ('       Bk.BankKanaName,Bk.BraKanaName,bk.Renso ');
//		SQL.Add   ('       Bk.BankKanaName,Bk.BraKanaName,fi.FusenKbn, fi.FusenCmnt ');
		SQL.Add   ('FROM   BankInfo bk  ');
//		SQL.Add   (' LEFT OUTER JOIN MFusenInfo fi ON bk.MasterKbn = fi.MasterKbn AND fi.NCode = bk.NCode ');
		SQL.Add   ('WHERE  bk.MasterKbn = :nMasterDivision AND bk.RdelKbn = 0 ');
		SQL.Add   ('ORDER BY bk.AllBkCode, Bk.AllBraCode');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;

		Open ();

		while (not EOF) do
		begin
			fnSetRecordMemDataHojyoMA (dqMasterData);
			NEXT;
		end;
    end;

	CmnDataSourceHojyoMA.DataSet	:= CmnMemDataHojyoMA;

    if dqMasterData.RecordCount > 0 then
    	CmnMemDataHojyoMA.First ();

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_fUnderConstruction	:= FALSE;

	fnRebuildGridAccInfo (CmnMemDataHojyoMA.FieldByName ('nCode').AsFloat);
end;

//***********************************************************************************************************/
// ツリーを生成
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnRebuildTreeViewItems ();
var
	dqMasterData: TMQuery;
	cNode		: TTreeNode;
	pItemRec	: ^TreeViewRec;
//	nCount		: Integer;
function lfnGetBkName : String;
var
	Qry: TMQuery;
begin

    Result := '';

	Qry	:= TMQuery.Create (Self);
    if Assigned(Qry) <> True then
    begin
        Exit;
    end;
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

    with Qry do
    begin
        Close;
        Sql.Clear;
        Sql.Add('Select BankName from BankInfo ');
		SQL.Add('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
		SQL.Add(' And AllBkCode = :nBkCode ');
		SQL.Add(' And BankName  <> '''' ');
        SQL.Add(' Order BY AllBkCode,NCode ');
		ParamByName ('nMasterDivision').AsInteger := MASTER_BANK;
		ParamByName ('nBkCode').AsInteger         := dqMasterData.fieldbyName('AllBkCode').asInteger;

        Open;
        if not Eof then
            Result := FieldBYName('BankName').asString;


    end;
	Qry.Close ();
	Qry.Free  ();

end;
begin
	m_fUnderConstruction	:= TRUE;


//	for	nCount := 0 to CmnTreeView.Items.Count - 1 do
//		Dispose (CmnTreeView.Items [nCount].Data);

	CmnTreeView.Items.Clear ();

	dqMasterData	:= TMQuery.Create (Self);
    if Assigned(dqMasterData) <> True then
    begin
        Exit;
    end;
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続


	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT distinct AllBkCode ');
        SQL.Add   ('FROM BankInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
        SQL.Add   (' Order BY AllBkCode Desc');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;

		Open ();

		while (not EOF) do
		begin
			New (pItemRec);

    		pItemRec^.nItemDivision	:= 0;

			pItemRec^.nBkCode	       := FieldByName ('AllBkCode').AsInteger;
			pItemRec^.strDescription   := lfnGetBkName;
			pItemRec^.nBrCode		   := -1;

			cNode	:= CmnTreeView.Items.AddChildObjectFirst (nil, pItemRec^.strDescription, pItemRec);

			cNode.ImageIndex	:= pItemRec^.nItemDivision;
			cNode.SelectedIndex	:= pItemRec^.nItemDivision + 3;

			fnCreateTreeViewItems (cNode);

			NEXT;
		end;

    end;


	dqMasterData.Close ();
	dqMasterData.Free  ();


	m_fUnderConstruction	:= FALSE;

	if	(CmnTreeView.Items.Count > 0) then
		CmnTreeView.Items [0].Selected	:= TRUE;

	CmnTreeView.FullExpand ();

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnResetChangeFlagCheckItems ();
var
	nItems: Integer;

begin
	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		PCheckItemRec (m_cCheckItems.Items [nItems])^.fNoCheck		:= FALSE;
		PCheckItemRec (m_cCheckItems.Items [nItems])^.fChangeData	:= FALSE;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSelectTreeViewItem (nBkCode: Integer; nBrCode: Integer);
var
	nCount: Integer;

begin
	for nCount := 0 to CmnTreeView.Items.Count - 1 do
	begin
		if	((PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBrCode = nBrCode) and
			 (CompareStr (IntToStr(PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBkCode), IntToStr(nbkCode)) = 0)) then
		begin
			CmnTreeView.Items [nCount].Selected	:= TRUE;
			Break;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetAttributeJournalInfo (nKmkCode: Integer);
var
	dqMasterData: TMQuery;
	nCount		: Integer;
	nAdoption	: Integer;
    i           : Integer;
    lvMkbn      : Integer;
    lvHojyo1,lvHojyo2 : Integer;
    const uaHojyoNM : Array [0..7] of String
            = ('BankUse','ToriUse','ShainUse','HojyoUse1','HojyoUse2','HojyoUse3','HojyoUse4','HojyoUse5');
    const uaHojyoMKBN : Array [0..7] of Integer
            = (21,22,25,31,32,33,34,35);

// <074> 2010/06/28 G.Kojima Mod
// Procedure lfnSetMasterInfo(i,pMKBN:Integer);
Procedure lfnSetMasterInfo(i,pMKBN :Integer;var UseKbn:Integer);
var
	Qry: TMQuery;
begin

	Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
    with Qry do
    begin
        Close;
    	SQL.Clear ();
// <074> 2010/06/28 G.Kojima Mod
//		SQL.Add   ('SELECT MasterKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQL.Add   ('SELECT MasterKbn, JHojyoName, CodeDigit, CodeAttr,UseKbn FROM MasterInfo ');
		SQL.Add   ('Where MasterKbn = :pMKBN ');
        ParamByName('pMKBN').asInteger := pMKBN;
        Open;
        if not Eof then
        begin
            m_arCodeAttribute [i].strDescription := FieldByName('JHojyoName').asString;
            m_arCodeAttribute [i].nDigit         := FieldByName('CodeDigit').asInteger;
            m_arCodeAttribute [i].nAttribute     := FieldByName('CodeAttr').asInteger;
// <074> 2010/06/28 G.Kojima Add
            UseKbn     := FieldByName('UseKbn').asInteger;
        end;
        Close;
    end;

end;
begin
//↓<MLXHAP>MLX給与のときは抜ける。
	if TMSeries.IsMjsLink3 then
	begin
		Exit;
	end;
//↑<MLXHAP>
    CmnEdit03015KmsCodeNumeric.Value		:= 0;
    CmnEdit03016BumCodeNumeric.Value		:= 0;
    CmnEdit03017SegCodeNumeric.Value		:= 0;
    CmnEdit03020PrjCodeNumeric.Value		:= 0;
    CmnEdit03022PjSCodeNumeric.Value		:= 0;       // <044>
    CmnEdit03018HojCodeNumeric.Value		:= 0;
    CmnEdit03019HojCodeNumeric.Value		:= 0;
    CmnEdit03015KmsCodeNumeric.InputFlag	:= TRUE;
    CmnEdit03016BumCodeNumeric.InputFlag	:= TRUE;
    CmnEdit03017SegCodeNumeric.InputFlag	:= TRUE;
    CmnEdit03018HojCodeNumeric.InputFlag	:= TRUE;
    CmnEdit03019HojCodeNumeric.InputFlag	:= TRUE;
    CmnEdit03020PrjCodeNumeric.InputFlag	:= TRUE;    // <044>
    CmnEdit03022PjSCodeNumeric.InputFlag	:= TRUE;    // <044>
    CmnEdit03015KmsCodeFree   .Text  		:= '';
    CmnEdit03016BumCodeFree   .Text			:= '';
    CmnEdit03017SegCodeFree   .Text			:= '';
    CmnEdit03018HojCodeFree   .Text			:= '';
    CmnEdit03019HojCodeFree   .Text			:= '';
    CmnEdit03020PrjCodeFree   .Text			:= '';
    CmnEdit03022PjSCodeFree   .Text			:= '';      // <044>

    CmnLabel03016BumCode.caption := '';
    CmnLabel03020PrjCode.caption := '';
    CmnLabel03022PjSCode.caption := '';                 // <044>
    CmnLabel03015KmsCode.caption := '';
    CmnLabel03018HojCode.caption := '';
    CmnLabel03019HojCode.caption := '';
    CmnLabel03017SegCode.caption := '';


// <044> 2006/12/21 H.Kawato Mod
//	for	nCount := 0 to 5 do
	for	nCount := 0 to 6 do
	begin
		if	(nCount <> 0) then
			m_arCodeAttribute [nCount].strDescription	:= ''
		else
			fnGetAdoptInformation (MASTER_SUBJECTPLUS, m_arCodeAttribute [nCount].strDescription,
													   m_arCodeAttribute [nCount].nDigit,
													   m_arCodeAttribute [nCount].nAttribute, nAdoption);

		m_arCodeAttribute [nCount].nDigit		:= 6;
		m_arCodeAttribute [nCount].nAttribute	:= 0;
		m_arCodeAttribute [nCount].fEnabled		:= FALSE;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT '+
                   ' BPKbn, BmnUse, '+
				   ' CodeDigit, CodeAttr, '+									// <026>　051125
                   ' PrjUse1,PrjUse2,PrjUse3,PrjUse4,PrjUse5,PrjUse6,PrjUse7,PrjUse8,PrjUse9,PrjUse10, '+
                   ' SubKmkUse, BankUse,ToriUse,ShainUse,HojyoUse1,HojyoUse2,HojyoUse3,HojyoUse4,HojyoUse5, '+
                   ' SegUse1,SegUse2,SegUse3,SegUse4,SegUse5,SegUse6,SegUse7,SegUse8,SegUse9,SegUse10 '+
                   ' FROM KmkMA '+
		           ' WHERE  MasterKbn = 1 AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :nKmkCode');

		ParamByName ('nKmkCode').AsInteger	:= nKmkCode;

		Open ();

		if	(not EOF) then
		begin
//--------------------------------
//   科目別補助採用
//--------------------------------
			m_arCodeAttribute [0].nMasterDivision	:= MASTER_SUBJECTPLUS;				// 科目別補助

			fnGetAdoptInformation (MASTER_SUBJECTPLUS, m_arCodeAttribute [0].strDescription,
													   m_arCodeAttribute [0].nDigit,
													   m_arCodeAttribute [0].nAttribute,nAdoption);

     		if	FieldByName ('SubKmkUse').AsInteger = 1 then	// 科目別補助採用区分: 1=あり
			begin
                CmnLabel03015KmsCode.caption := m_arAdoptInfo [1].strDescription;
				m_arCodeAttribute [0].fEnabled	:= TRUE;
				m_arCodeAttribute [0].fStatic	:= FALSE;
			end
			else
				m_arCodeAttribute [0].fEnabled	:= FALSE;
			// <026>　051125 >>
			m_arCodeAttribute [0].nDigit		:= FieldByName ('CodeDigit').AsInteger;
            m_arCodeAttribute [0].nAttribute	:= FieldByName ('CodeAttr').AsInteger;
			// <026>　051125 <<

//--------------------------------
//   部門採用
//--------------------------------
			m_arCodeAttribute [1].nMasterDivision	:= MASTER_SECTION;					// 部門
			fnGetAdoptInformation (MASTER_SECTION, m_arCodeAttribute [1].strDescription,
												   m_arCodeAttribute [1].nDigit,
												   m_arCodeAttribute [1].nAttribute, nAdoption);
			if	FieldByName ('BmnUse').AsInteger <> 0 then		// 部門採用区分: あり
			begin
                CmnLabel03016BumCode.caption := m_arAdoptInfo [10].strDescription;
				m_arCodeAttribute [1].fEnabled	:= TRUE;
				m_arCodeAttribute [1].fStatic	:= FALSE;

				if	(nAdoption = 1) then												// P/Lのみ採用
				begin
					if	(FieldByName ('BPKbn').AsInteger = 0) then						// B/S科目
						m_arCodeAttribute [1].fEnabled	:= FALSE
					else
					begin
						if	(FieldByName ('BmnUse').AsInteger = 1) then
							m_arCodeAttribute [1].nClassCode	:= 0
						else
							m_arCodeAttribute [1].nClassCode	:= 3;
					end;
				end
				else																	// B/S&P/L採用
				begin
					if	(FieldByName ('BPKbn').AsInteger = 0) then						// B/S科目
					begin
						if	(FieldByName ('BmnUse').AsInteger = 1) then
							m_arCodeAttribute [1].nClassCode	:= 2
						else
							m_arCodeAttribute [1].nClassCode	:= 1;
					end
					else
					begin
						if	(FieldByName ('BmnUse').AsInteger = 1) then
							m_arCodeAttribute [1].nClassCode	:= 0
						else
							m_arCodeAttribute [1].nClassCode	:= 3;
					end;
				end;
			end
			else
				m_arCodeAttribute [1].fEnabled	:= FALSE;

//--------------------------------
//   ｾｸﾞﾒﾝﾄ採用
//--------------------------------
///            lvMKbn := 0;
    		m_arCodeAttribute [2].fEnabled	:= FALSE;
            //採用のｾｸﾞﾒﾝﾄﾏｽﾀ区分を求める
        	for i := 1 to 10 do
            begin
                if FIeldByName ('SegUse' + IntToStr(i)).AsInteger <> 0 then
                begin
                    lvMKbn := 100 + i;
                    m_arCodeAttribute [2].nMasterDivision	:= lvMKbn;				// ｾｸﾞﾒﾝﾄ1

// <074> 2010/06/28 G.Kojima Mod
//					lfnSetMasterInfo(2,lvMKbn);
                    lfnSetMasterInfo(2,lvMKbn,nAdoption);

                    m_arCodeAttribute [2].fEnabled	:= TRUE;
                    m_arCodeAttribute [2].fStatic	:= FALSE;
                    CmnLabel03017SegCode.caption := m_arCodeAttribute [2].strDescription;

                    if	(nAdoption = 1) then												// P/Lのみ採用
                    begin
                        if	(FieldByName ('BPKbn').AsInteger = 0) then						// B/S科目
                            m_arCodeAttribute [2].fEnabled	:= FALSE
                        else
                        begin
                            if	FIeldByName ('SegUse' + IntToStr(i)).AsInteger = 1 then
                                m_arCodeAttribute [2].nClassCode	:= 0
                            else
                                m_arCodeAttribute [2].nClassCode	:= 3;
                        end;
                    end
                    else																	// B/S&P/L採用
                    begin
                        if	(FieldByName ('BPKbn').AsInteger = 0) then						// B/S科目
                        begin
                            if	(FIeldByName ('SegUse' + IntToStr(i)).AsInteger = 1) then
                                m_arCodeAttribute [2].nClassCode	:= 2
                            else
                                m_arCodeAttribute [2].nClassCode	:= 1;
                        end
                        else
                        begin
                            if	(FIeldByName ('SegUse' + IntToStr(i)).AsInteger = 1) then
                                m_arCodeAttribute [2].nClassCode	:= 0
                            else
                                m_arCodeAttribute [2].nClassCode	:= 3;
                        end;
                    end;

                    Break;
                end;
            end;

//--------------------------------
//   補助1採用
//--------------------------------
            //補助１のﾏｽﾀ区分を求める
            lvHojyo1 := 0;
            for  i := 0 to 7 do
            begin
                if FIeldByName (uaHojyoNM[i]).AsInteger <> 0 then
                begin
                    lvHojyo1 := uaHojyoMKBN[i];
                    Break;
                end;
            end;
			m_arCodeAttribute [3].nMasterDivision	:= lvHojyo1;
			fnGetAdoptInformation (lvHojyo1, m_arCodeAttribute [3].strDescription,
																		m_arCodeAttribute [3].nDigit,
																		m_arCodeAttribute [3].nAttribute, nAdoption);
			if	(nAdoption <> 0) then
            begin
				m_arCodeAttribute [3].fEnabled	:= TRUE;

                CmnLabel03018HojCode.caption := m_arCodeAttribute [3].strDescription;

{ <068>
				if	(m_arCodeAttribute [3].nMasterDivision = MASTER_BANK) then
                begin
					m_arCodeAttribute [3].fStatic	:= TRUE;
                    m_arCodeAttribute [3].fEnabled	:= FALSE;
                end
				else
					m_arCodeAttribute [3].fStatic	:= FALSE;
<068> }
                m_arCodeAttribute [3].fStatic	:= FALSE; // <068>

            end
			else
				m_arCodeAttribute [3].fEnabled	:= FALSE;

//--------------------------------
//   補助2採用
//--------------------------------
            //補助2のﾏｽﾀ区分を求める
            lvHojyo2 := 0;
            for  i := 0 to 7 do
            begin
                if FIeldByName (uaHojyoNM[i]).AsInteger <> 0 then
                begin
                    if lvHojyo1 <> uaHojyoMKBN[i] then //補助１で採用されているものは除く
                    begin
                        lvHojyo2 := uaHojyoMKBN[i];
                        Break;
                    end;
                end;
            end;

			m_arCodeAttribute [4].nMasterDivision	:= lvHojyo2;
			fnGetAdoptInformation (lvHojyo2, m_arCodeAttribute [4].strDescription,
																		m_arCodeAttribute [4].nDigit,
																		m_arCodeAttribute [4].nAttribute, nAdoption);

			if	(nAdoption <> 0) then
            begin
                CmnLabel03019HojCode.caption := m_arCodeAttribute [4].strDescription;
				m_arCodeAttribute [4].fEnabled	:= TRUE;
{ <068>
				if	(m_arCodeAttribute [4].nMasterDivision = MASTER_BANK) then
                begin
					m_arCodeAttribute [4].fStatic	:= TRUE;
                    m_arCodeAttribute [4].fEnabled	:= FALSE;
                end
				else
					m_arCodeAttribute [4].fStatic	:= FALSE;
<068> }
				m_arCodeAttribute [4].fStatic	:= FALSE;  // <068>

            end
			else
				m_arCodeAttribute [4].fEnabled	:= FALSE;

//--------------------------------
//   ﾌﾟﾛｼﾞｪｸﾄ採用
//--------------------------------
///            lvMKbn := 0;
    		m_arCodeAttribute [5].fEnabled	:= FALSE;
            //ﾌﾟﾛｼﾞｪｸﾄﾏｽﾀ区分を求める

// <052> 2007/07/27 H.Kawato Add Start
            if (MASTER_CONSTRUCT - 200 > 0) and
               (FIeldByName ('PrjUse' + IntToStr(MASTER_CONSTRUCT - 200)).AsInteger <> 0) then
            begin
                lvMKbn := MASTER_CONSTRUCT;
                m_arCodeAttribute [5].nMasterDivision	:= lvMKbn;

// <074> 2010/06/28 G.Kojima Mod
//				lfnSetMasterInfo(5,lvMKbn);
                lfnSetMasterInfo(5,lvMKbn,nAdoption);

                m_arCodeAttribute [5].fEnabled	:= TRUE;
                m_arCodeAttribute [5].fStatic	:= FALSE;
                CmnLabel03020PrjCode.caption := m_arCodeAttribute [5].strDescription;
            end
            else
            begin
// <052> 2007/07/27 H.Kawato Add End

        		for i := 1 to 10 do
           	 	begin
                	if FIeldByName ('PrjUse' + IntToStr(i)).AsInteger <> 0 then
                	begin
                    	lvMKbn := 200 + i;
                    	m_arCodeAttribute [5].nMasterDivision	:= lvMKbn;

// <074> 2010/06/28 G.Kojima Mod
//						lfnSetMasterInfo(5,lvMKbn);
                    	lfnSetMasterInfo(5,lvMKbn,nAdoption);

                    	m_arCodeAttribute [5].fEnabled	:= TRUE;
                    	m_arCodeAttribute [5].fStatic	:= FALSE;
                    	CmnLabel03020PrjCode.caption := m_arCodeAttribute [5].strDescription;
                    	Break;
                	end;
            	end;
         	end;    // <052> Add       
		end;
	end;

// <044> 2006/12/21 H.Kawato Mod
//	for	nCount := 0 to 5 do
	for	nCount := 0 to 6 do
		fnChangeConditionJournalInfo (nCount);

	dqMasterData.Free ();

    fnSetChangeFlagCheckItems (CmnEdit03015KmsCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03016BumCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03017SegCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03018HojCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03019HojCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03020PrjCodeNumeric, FALSE);
    fnSetChangeFlagCheckItems (CmnEdit03022PjSCodeNumeric, FALSE);  // <044>
    fnSetChangeFlagCheckItems (CmnEdit03023FeePayKbn, FALSE);		// <076> Add
    fnSetChangeFlagCheckItems (CmnCmbo03024Layout, FALSE);		    // <087> ADD
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
(* <062> Del-St
procedure	TJNTCRP008002f.fnSetAttributeJournalInfoPrint (nKmkCode: Integer);
var
	dqMasterData  : TMQuery;
	nPosition	  : Integer;
	nCount		  : Integer;
	nAdoption	  : Integer;
	nAttribute	  : Integer;
	nDigit		  : Integer;
	strDescription: String;

begin
	for	nCount := 0 to 2 do
	begin
		m_arCodeAttributePrint [nCount].nMasterDivision	:= 0;
		m_arCodeAttributePrint [nCount].nDigit			:= 6;
		m_arCodeAttributePrint [nCount].nAttribute		:= 0;
		m_arCodeAttributePrint [nCount].fEnabled		:= FALSE;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT BPKbn, TaxKbn, STaxCode, STaxRate, BTaxCode, BTaxRate, ');
		SQL.Add   ('       CodeDigit, CodeAttr, ');								// <026>　051125
		SQL.Add   ('       SubKmkUse, BmnUse, SegUse1, HojyoUse1, HojyoUse2, KoujiUse ');
		SQL.Add   ('FROM   KmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :nKmkCode');

		ParamByName ('nKmkCode').AsInteger	:= nKmkCode;

		Open ();

		if	(not EOF) then
		begin
			nPosition	:= 0;

			fnGetAdoptInformation (MASTER_SUBJECTPLUS, strDescription, nDigit, nAttribute, nAdoption);

			if	((FieldByName ('SubKmkUse').AsInteger = 1) and (nAdoption <> 0)) then	// 科目別補助採用区分: 1=あり
			begin
				m_arCodeAttributePrint [nPosition].nMasterDivision	:= MASTER_SUBJECTPLUS;
//<026>　051125	m_arCodeAttributePrint [nPosition].nDigit			:= nDigit;
//<026>　051125	m_arCodeAttributePrint [nPosition].nAttribute		:= nAttribute;
				m_arCodeAttributePrint [nPosition].nDigit			:= FieldByName ('CodeDigit').AsInteger;	// <026>　051125
				m_arCodeAttributePrint [nPosition].nAttribute		:= FieldByName ('CodeAttr').AsInteger;	// <026>　051125
				m_arCodeAttributePrint [nPosition].fEnabled			:= TRUE;

				nPosition	:= nPosition + 1;
			end;

			fnGetAdoptInformation (MASTER_SECTION, strDescription, nDigit, nAttribute, nAdoption);

			if	(((FieldByName ('BmnUse').AsInteger <> 0) and (nAdoption <> 0)) and		// 部門採用区分: 1=あり
				 (not ((FieldByName ('BPKbn').AsInteger = 0) and (nAdoption = 1)))) then
			begin
				m_arCodeAttributePrint [nPosition].nMasterDivision	:= MASTER_SECTION;	// 部門
				m_arCodeAttributePrint [nPosition].nDigit			:= nDigit;
				m_arCodeAttributePrint [nPosition].nAttribute		:= nAttribute;
				m_arCodeAttributePrint [nPosition].fEnabled			:= TRUE;

				nPosition	:= nPosition + 1;
			end;

			fnGetAdoptInformation (MASTER_SEGMENT01, strDescription, nDigit, nAttribute, nAdoption);

			if	(((FIeldByName ('SegUse1').AsInteger <> 0) and (nAdoption <> 0)) and		// ｾｸﾞﾒﾝﾄ1採用区分: 1=あり
				 (not ((FieldByName ('BPKbn').AsInteger = 0) and (nAdoption = 1)))) then
			begin
				m_arCodeAttributePrint [nPosition].nMasterDivision	:= MASTER_SEGMENT01;	// ｾｸﾞﾒﾝﾄ1
				m_arCodeAttributePrint [nPosition].nDigit			:= nDigit;
				m_arCodeAttributePrint [nPosition].nAttribute		:= nAttribute;
				m_arCodeAttributePrint [nPosition].fEnabled			:= TRUE;

				nPosition	:= nPosition + 1;
			end;

			if	(nPosition <= 2) then
			begin
//				fnGetAdoptInformation (MASTER_Hojyo1,strDescription, nDigit, nAttribute, nAdoption);

				if	(nAdoption <> 0) then
				begin
//					m_arCodeAttributePrint [nPosition].nMasterDivision	:= MASTER_Hojyo1;
					m_arCodeAttributePrint [nPosition].nDigit			:= nDigit;
					m_arCodeAttributePrint [nPosition].nAttribute		:= nAttribute;
					m_arCodeAttributePrint [nPosition].fEnabled			:= TRUE;

					nPosition	:= nPosition + 1;
				end;
			end;

			if	(nPosition <= 2) then
			begin
//				fnGetAdoptInformation (MASTER_Hojyo2,strDescription, nDigit, nAttribute, nAdoption);

				if	(nAdoption <> 0) then
				begin
//					m_arCodeAttributePrint [nPosition].nMasterDivision	:= MASTER_Hojyo2;
					m_arCodeAttributePrint [nPosition].nDigit			:= nDigit;
					m_arCodeAttributePrint [nPosition].nAttribute		:= nAttribute;
					m_arCodeAttributePrint [nPosition].fEnabled			:= TRUE;
				end;
			end;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;
<062> Del-Ed *)
// -----<062> Add-St-----
procedure TJNTCRP008002f.fnSetAttributeJournalInfoPrint(nKmkCode: Integer; PrjNCode: Currency);
var
	dqMasterData	: TMQuery;
	iAdoption		: Integer;
	iAttribute		: Integer;
	iDigit			: Integer;
	strJHojyoName	: String;
	i				: Integer;
	lvMkbn			: Integer;
	lvHojyo1		: Integer;
	lvHojyo2		: Integer;
	iPartKbn		: Integer;

	const uaHojyoNM	: Array [0..7] of String
			= ('BankUse','ToriUse','ShainUse','HojyoUse1','HojyoUse2','HojyoUse3','HojyoUse4','HojyoUse5');
	const uaHojyoMKBN : Array [0..7] of Integer
			= (21, 22, 25, 31, 32, 33, 34, 35);

	procedure lfnSetMasterInfo(i, iMasterKbn: Integer);
	var
		Qry: TMQuery;
	begin

		Qry	:= TMQuery.Create (Self);
												// DBとMQueryの接続
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);
		with Qry do
		begin
			Close;
			SQL.Clear ();
			SQL.Add(' select MasterKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo'
				+	' where MasterKbn = :MasterKbn');
			ParamByName('MasterKbn').AsInteger := iMasterKbn;
			Open;
			if	not Eof then
			begin
				m_arCodeAttributePrint[i].strDescription	:= FieldByName('JHojyoName').AsString;
				m_arCodeAttributePrint[i].nDigit			:= FieldByName('CodeDigit').AsInteger;
				m_arCodeAttributePrint[i].nAttribute		:= FieldByName('CodeAttr').AsInteger;
			end;
			Close();
			Free();
		end;
	end;

begin
	for	i := 0 to 6 do
	begin
		m_arCodeAttributePrint[i].nMasterDivision	:= 0;
		m_arCodeAttributePrint[i].nDigit			:= 6;
		m_arCodeAttributePrint[i].nAttribute		:= 0;
		m_arCodeAttributePrint[i].fEnabled			:= False;
	end;

	dqMasterData := TMQuery.Create(Self);
												// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterData);

	with dqMasterData do
	begin
		Close();
		SQL.Clear();
		SQL.Add(' SELECT'
			+	'   BPKbn, SubKmkUse, CodeDigit, CodeAttr, HojyoUse1, HojyoUse2, HojyoUse3, HojyoUse4, HojyoUse5'
			+	'  ,BankUse, ToriUse, ShainUse, BmnUse, SegUse1, SegUse2, SegUse3, SegUse4, SegUse5'
			+	'  ,SegUse6, SegUse7, SegUse8, SegUse9, SegUse10'
			+	'  ,PrjUse1, PrjUse2, PrjUse3, PrjUse4, PrjUse5'
			+	'  ,PrjUse6, PrjUse7, PrjUse8, PrjUse9, PrjUse10'
			+	' FROM KmkMA'
			+	' WHERE MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :GCode');

		ParamByName('GCode').AsInteger := nKmkCode;

		Open();

		if	not Eof then
		begin
			{ 科目別補助 }
			fnGetAdoptInformation(MASTER_SUBJECTPLUS, strJHojyoName, iDigit, iAttribute, iAdoption);
			with m_arCodeAttributePrint[C_IDX_SAIMOKU] do
			begin
				nMasterDivision	:= MASTER_SUBJECTPLUS;
				nDigit			:= FieldByName ('CodeDigit').AsInteger;
				nAttribute		:= FieldByName ('CodeAttr').AsInteger;
				strDescription	:= strJHojyoName;

				if	((FieldByName('SubKmkUse').AsInteger = 1) and (iAdoption <> 0)) then
				begin
					fEnabled	:= True;
				end
				else
				begin
					fEnabled	:= False;
				end;
			end;

			{ 部門 }
			fnGetAdoptInformation(MASTER_SECTION, strJHojyoName, iDigit, iAttribute, iAdoption);
			with m_arCodeAttributePrint[C_IDX_BUMON] do
			begin
				nMasterDivision	:= MASTER_SECTION;
				nDigit			:= iDigit;
				nAttribute		:= iAttribute;
				strDescription	:= strJHojyoName;
				fEnabled		:= True;
												// 部門採用区分: 1=あり
				if	FieldByName('BmnUse').AsInteger <> 0 then
				begin
												// P/Lのみ採用でB/S科目の場合
					if	(iAdoption = 1) and (FieldByName('BPKbn').AsInteger = 0) then
					begin
						fEnabled:= False;
					end;
				end
				else
				begin
					fEnabled	:= False;
				end;
			end;

			{ ｾｸﾞﾒﾝﾄ }
			for i := 1 to 10 do					// 採用のｾｸﾞﾒﾝﾄﾏｽﾀ区分を求める
			begin
				if	FieldByName('SegUse' + IntToStr(i)).AsInteger <> 0 then
				begin
					lvMKbn := 100 + i;
					m_arCodeAttributePrint[C_IDX_SEGMENT].nMasterDivision	:= lvMKbn;
					lfnSetMasterInfo(C_IDX_SEGMENT, lvMKbn);
					with m_arCodeAttributePrint[C_IDX_SEGMENT] do
					begin
						if	iAdoption = 1 then	// P/Lのみ採用
						begin
												// B/S科目だったら採用なし
							if	FieldByName('BPKbn').AsInteger = 0 then
							begin
								fEnabled:= False;
							end
							else
							begin
								fEnabled:= True;
							end;
						end
						else					// B/S&P/L採用
						begin
							fEnabled	:= True;
						end;
					end;

					Break;						// 最初に採用しているｾｸﾞﾒﾝﾄで抜ける
				end;
			end;

			{ 補助1 }
			// 補助１のﾏｽﾀ区分を求める
			lvHojyo1 := 0;
			for  i := 0 to 7 do
			begin
				if	FieldByName(uaHojyoNM[i]).AsInteger <> 0 then
				begin
					lvHojyo1 := uaHojyoMKBN[i];
					fnGetAdoptInformation(lvHojyo1, strJHojyoName, iDigit, iAttribute, iAdoption);
					with m_arCodeAttributePrint[C_IDX_HOJYO1] do
					begin
						nMasterDivision	:= lvHojyo1;
						nDigit			:= iDigit;
						nAttribute		:= iAttribute;
						strDescription	:= strJHojyoName;

						if	iAdoption <> 0 then
						begin
							fEnabled	:= True;
{ <068> ↓
							if	 nMasterDivision = MASTER_BANK then
							begin
								fEnabled:= False;
							end;
<068> ↑}
						end
						else
						begin
							fEnabled	:= False;
						end;
					end;

					Break;						// 最初に採用している補助で抜ける
				end;
			end;

			{ 補助2 }
			// 補助2のﾏｽﾀ区分を求める
			for  i := 0 to 7 do
			begin
				if	FieldByName(uaHojyoNM[i]).AsInteger <> 0 then
				begin
												// 補助１で採用されているものは除く
					if	uaHojyoMKBN[i] <> lvHojyo1 then
					begin
						lvHojyo2 := uaHojyoMKBN[i];
						fnGetAdoptInformation(lvHojyo2, strJHojyoName, iDigit, iAttribute, iAdoption);
						with m_arCodeAttributePrint[C_IDX_HOJYO2] do
						begin
							nMasterDivision	:= lvHojyo2;
							nDigit			:= iDigit;
							nAttribute		:= iAttribute;
							strDescription	:= strJHojyoName;

							if	iAdoption <> 0 then
							begin
								fEnabled	:= True;
{ <068> ↓
								if	nMasterDivision = MASTER_BANK then
								begin
									fEnabled:= False;
								end;
<068> ↑}
							end
							else
							begin
								fEnabled	:= False;
							end;
						end;

						Break;					// 最初に採用している補助で抜ける(補助1以外で)
					end;
				end;
			end;

			{ ﾌﾟﾛｼﾞｪｸﾄ }
			for i := 1 to 10 do
			begin
				if	FieldByName('PrjUse' + IntToStr(i)).AsInteger <> 0 then
				begin
					lvMKbn := 200 + i;
					m_arCodeAttributePrint[C_IDX_PROJECT].nMasterDivision	:= lvMKbn;
					lfnSetMasterInfo(C_IDX_PROJECT, lvMKbn);
					m_arCodeAttributePrint[C_IDX_PROJECT].fEnabled			:= True;
					Break;
				end;
			end;

			{ ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ }
			if	m_arCodeAttributePrint[C_IDX_PROJECT].fEnabled then
			begin
				if	PrjNCode <> 0 then
				begin
					// 工種管理区分チェック
					iPartKbn := GetKojiPartKbn(m_arCodeAttributePrint[C_IDX_PROJECT].nMasterDivision, PrjNCode);

					if	iPartKbn <> 0 then
					begin
						// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞのﾏｽﾀ区分を求める
						lvMKbn := (m_arCodeAttributePrint[C_IDX_PROJECT].nMasterDivision + 100);
						m_arCodeAttributePrint[C_IDX_PROJECTSUB].nMasterDivision	:= lvMKbn;
						lfnSetMasterInfo(C_IDX_PROJECTSUB, lvMKbn);
						m_arCodeAttributePrint[C_IDX_PROJECTSUB].fEnabled			:= True;
					end;
				end;
			end;
		end;
	end;

	dqMasterData.Close();
	dqMasterData.Free();
end;
// -----<062> Add-Ed-----

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetChangeFlagCheckItems (Sender: TObject; fChangeFlag: Boolean);
var
	nFieldID: Integer;
	nItems	: Integer;

begin
	nFieldID	:= 0;


// <096> DEL↓
// 変更フラグを更新するため削除
//    //とりあえず
//    if TComponent (Sender).Name = 'CmnEdit01050BiilRate' then  Exit;
// <096> DEL↑


// <087> ADD-STR
	if	(TWinControl (Sender).Name = 'CmnCmbo03024Layout') then
        // 支払レイアウトコンボの場合(下の(Sender is TMComboBox)の用途が不明のため、別途追加)
        nFieldID	:= StrToInt (Copy (TComponent (Sender).Name, 8, 5))
    else
// <087> ADD-END
	if	(Sender is TMComboBox) then
		nFieldID	:= StrToInt (Copy (TComponent (Sender).Name, 12, 5))
	else
	begin
		if	(CompareStr (Copy (TComponent (Sender).Name, 8, 8), 'FeeValue') = 0) then
		begin
			case (StrToInt (Copy (TWinControl (Sender).Name, 20, 2))) of
				2:	nFieldID	:= StrToInt (Copy (TWinControl (Sender).Name, 18, 2)) +  1;
				3:	nFieldID	:= StrToInt (Copy (TWinControl (Sender).Name, 18, 2)) +  9;
				4:	nFieldID	:= StrToInt (Copy (TWinControl (Sender).Name, 18, 2)) + 12;
				5:	nFieldID	:= StrToInt (Copy (TWinControl (Sender).Name, 18, 2)) +  6;
				6:	nFieldID	:= StrToInt (Copy (TWinControl (Sender).Name, 18, 2)) +  3;
			end;

			nFieldID	:= 1000 + nFieldID + (StrToInt (Copy (TWinControl (Sender).Name, 16, 2)) - 1) * 14;
		end
		else
			nFieldID	:= StrToInt (Copy (TComponent (Sender).Name, 8, 5));
	end;

	for	nItems := 0 to m_cCheckItems.Count - 1 do
	begin
		if	(PCheckItemRec (m_cCheckItems.Items [nItems])^.nFieldID = nFieldID) then
		begin
			PCheckItemRec (m_cCheckItems.Items [nItems])^.fNoCheck	:= fChangeFlag;

			if	(fChangeFlag) then
				PCheckItemRec (m_cCheckItems.Items [nItems])^.fChangeData	:= fChangeFlag;

			Break;
		end;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnSetMasterInfoData (): Boolean;
var
	dqMasterInfo   : TMQuery;
	nItemPosition  : Integer;
    nMasterDivision: Integer;
//    i : Integer;

//    lvCount     : Integer;
//    lvString    : String;
//    lvMstKbn    : Integer;

begin
	nMasterDivision	:= 0;

	dqMasterInfo	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);							// DBとMQueryの接続

	with (dqMasterInfo) do
    begin
        //ｾｸﾞﾒﾝﾄ採用区分のMasterKbnを取得する
        Close;
        Sql.Clear;
        Sql.add(' Select MasterKbn From MasterInfo '+
                ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
// <048> MOD
                //'   and (UseKBN = 1)'+
                '   and (UseKBN <> 0)'+
// <048> MOD
                '   Order By MasterKBN');
        ParamByName('pSMKBN').asInteger := MASTER_SEGMENT_Str;
        ParamByName('pEMKBN').asInteger := MASTER_SEGMENT_End;
        Open;
        if not Eof then
            MASTER_SEGMENT01 := FieldByName('MasterKBN').asInteger
        else
            MASTER_SEGMENT01 := MASTER_SEGMENT_Str;

        //工事採用区分のMasterKbnを取得する         HIS0033 Add
        Close;
        Sql.Clear;
        Sql.add(' Select MasterKbn From MasterInfo '+
                ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
                '   and (KOJUSEKBN <> 0)'+
                '   Order By MasterKBN');
        ParamByName('pSMKBN').asInteger := MASTER_CONSTRUCT_Str;
        ParamByName('pEMKBN').asInteger := MASTER_CONSTRUCT_End;
        Open;
        if not Eof then
            MASTER_CONSTRUCT := FieldByName('MasterKBN').asInteger
        else
        begin
            Close;
            Sql.Clear;
            Sql.add(' Select MasterKbn From MasterInfo '+
                    ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
                    '   and (KOJUSEKBN = 0) and (UseKbn <> 0 )'+
                    '   Order By MasterKBN');
            ParamByName('pSMKBN').asInteger := MASTER_CONSTRUCT_Str;
            ParamByName('pEMKBN').asInteger := MASTER_CONSTRUCT_End;
            Open;
            if not Eof then
                MASTER_CONSTRUCT := FieldByName('MasterKBN').asInteger
        end;

    end;

	for	nItemPosition := 0 to 15 do
	begin
		case (nItemPosition) of
			 0:	nMasterDivision	:= MASTER_SUBJECT;										// 勘定科目
			 1:	nMasterDivision	:= MASTER_SUBJECTPLUS;									// 細目科目
			 2:	nMasterDivision	:= MASTER_BANK;											// 銀行
			 3:	nMasterDivision	:= MASTER_CUSTOMER;										// 取引先
			 4:	nMasterDivision	:= MASTER_STAFF;										// 社員
			 5:	nMasterDivision	:= MASTER_GENERAL01;									// 汎用補助①
			 6:	nMasterDivision	:= MASTER_GENERAL02;									// 汎用補助②
			 7:	nMasterDivision	:= MASTER_GENERAL03;									// 汎用補助③
			 8:	nMasterDivision	:= MASTER_GENERAL04;									// 汎用補助④
			 9:	nMasterDivision	:= MASTER_GENERAL05;									// 汎用補助⑤
			10:	nMasterDivision	:= MASTER_SECTION;										// 部門
			11:	nMasterDivision	:= MASTER_SEGMENT01;									// ｾｸﾞﾒﾝﾄ
			15:	nMasterDivision	:= MASTER_CONSTRUCT;									// 工事
		end;

		m_arAdoptInfo [nItemPosition].nMasterDivision	:= nMasterDivision;
		m_arAdoptInfo [nItemPosition].nAdoption			:= 0;
		m_arAdoptInfo [nItemPosition].nCodeDigit		:= 6;
		m_arAdoptInfo [nItemPosition].nCodeAttribute	:= 0;

		case (nItemPosition) of
			 0:	m_arAdoptInfo [nItemPosition].strDescription	:= '勘定科目';
			 1:	m_arAdoptInfo [nItemPosition].strDescription	:= '科目別補助';
			 2:	m_arAdoptInfo [nItemPosition].strDescription	:= '銀行';
			 3:	m_arAdoptInfo [nItemPosition].strDescription	:= '取引先';
			 4:	m_arAdoptInfo [nItemPosition].strDescription	:= '社員';
			 5:	m_arAdoptInfo [nItemPosition].strDescription	:= '汎用補助1';
			 6:	m_arAdoptInfo [nItemPosition].strDescription	:= '汎用補助2';
			 7:	m_arAdoptInfo [nItemPosition].strDescription	:= '汎用補助3';
			 8:	m_arAdoptInfo [nItemPosition].strDescription	:= '汎用補助4';
			 9:	m_arAdoptInfo [nItemPosition].strDescription	:= '汎用補助5';
			10:	m_arAdoptInfo [nItemPosition].strDescription	:= '部門';
			11:	m_arAdoptInfo [nItemPosition].strDescription	:= 'セグメント１';
			12:	m_arAdoptInfo [nItemPosition].strDescription	:= 'セグメント２';
			13:	m_arAdoptInfo [nItemPosition].strDescription	:= 'セグメント３';
			14:	m_arAdoptInfo [nItemPosition].strDescription	:= 'セグメント４';
			15:	m_arAdoptInfo [nItemPosition].strDescription	:= '工事';
		end;
	end;

	with (dqMasterInfo) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ORDER BY MasterKbn');

		Open ();

		while (not EOF) do
		begin
			nItemPosition	:= -1;

			case (FieldByName ('MasterKbn').AsInteger) of
				MASTER_SUBJECT    :	nItemPosition	:= 0;								// 勘定科目
				MASTER_SUBJECTPLUS:	nItemPosition	:= 1;								// 細目科目
				MASTER_BANK       :	nItemPosition	:= 2;								// 銀行
				MASTER_CUSTOMER	  :	nItemPosition	:= 3;								// 取引先
				MASTER_STAFF	  :	nItemPosition	:= 4;								// 社員
				MASTER_GENERAL01  :	nItemPosition	:= 5;								// 汎用補助①
				MASTER_GENERAL02  :	nItemPosition	:= 6;								// 汎用補助②
				MASTER_GENERAL03  :	nItemPosition	:= 7;								// 汎用補助③
				MASTER_GENERAL04  :	nItemPosition	:= 8;								// 汎用補助④
				MASTER_GENERAL05  :	nItemPosition	:= 9;								// 汎用補助⑤
				MASTER_SECTION	  :	nItemPosition	:= 10;								// 部門
//HIS0033				MASTER_CONSTRUCT  :	nItemPosition	:= 15;								// 工事
			end;

            if (FieldByName ('MasterKbn').AsInteger) = MASTER_SEGMENT01 then
    		    nItemPosition	:= 11;								// ｾｸﾞﾒﾝﾄ①

            //HIS0033 Add
// <048> MOD
            // if (FieldByName ('MasterKbn').AsInteger) = MASTER_SEGMENT01 then
            if (FieldByName ('MasterKbn').AsInteger) = MASTER_CONSTRUCT then
// <048> MOD
    		    nItemPosition	:= 15;								// 工事


			if	(nItemPosition >= 0) then
			begin
				m_arAdoptInfo [nItemPosition].nAdoption			:= FieldByName ('UseKbn'   ).AsInteger;
				m_arAdoptInfo [nItemPosition].nCodeDigit		:= FieldByName ('CodeDigit').AsInteger;
				m_arAdoptInfo [nItemPosition].nCodeAttribute	:= FieldByName ('CodeAttr' ).AsInteger;

//				if	((FieldByName ('JHojyoName').AsString <> '') and
//					 (FieldByName ('MasterKbn').AsInteger <> MASTER_SUBJECTPLUS)) then
				m_arAdoptInfo [nItemPosition].strDescription	:= FieldByName ('JHojyoName').AsString;
			end;

			NEXT;
		end;
	end;

	dqMasterInfo.Close ();
	dqMasterInfo.Free  ();


//銀行の採用区分で判別
{
	if	(m_arAdoptInfo [2].nAdoption = 0) then
	begin
		Result	:= FALSE;
		Exit;
	end;
}
	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetRecordMemDataAccInfo (dqMasterData: TMQuery);
var
	nWorkNo: Extended;
//	strFormat: String;
    strWorkNo: String;

begin
	with (dqMasterData) do
	begin
		CmnMemDataAccInfo.Append ();

		CmnMemDataAccInfo.FieldByName ('nAccountCode'     ).AsInteger	:= FieldByName ('GCode'   ).AsInteger;
		CmnMemDataAccInfo.FieldByName ('nDepDivision'     ).AsInteger	:= FieldByName ('AccKbn'    ).AsInteger;
		CmnMemDataAccInfo.FieldByName ('nDepDivisionData' ).AsInteger	:= FieldByName ('AccKbn'    ).AsInteger;
		CmnMemDataAccInfo.FieldByName ('strClientNameKana').AsString	:= FieldByName ('ClientName').AsString;

		nWorkNo	:= FieldByName ('BankNCode').AsFloat;

		CmnMemDataAccInfo.FieldByName ('nNCode').AsFloat	:= nWorkNo;

		strWorkNo	:= FieldByName ('AccNo').AsString;

//<067>		if	((Trim (strWorkNo) = '') or (StrToInt64 (Trim (strWorkNo)) = 0)) then
		if	(Trim (strWorkNo) = '') then    //<067>
			strWorkNo	:= ''
		else
		begin
// <034>↓
//			if	(StrToInt64 (Trim (strWorkNo)) <= 9999999) then
//				strWorkNo	:= Format ('%.7d', [StrToInt64 (Trim (strWorkNo))]);
	  // <067>		if	(StrToInt64 (Trim (strWorkNo)) <= 99999999) then
	  // <067>			strWorkNo	:= Format ('%.8d', [StrToInt64 (Trim (strWorkNo))]);
// <034>↑
        // <067> ↓
		if	(Length (Trim (strWorkNo)) < 8) then
        	strWorkNo	:= Format ('%.7d', [StrToInt64 (Trim (strWorkNo))]);
        // <067> ↑
		end;

		CmnMemDataAccInfo.FieldByName ('strAccountNo').AsString	:= strWorkNo;

		strWorkNo	:= FieldByName ('ClientCode').AsString;

// <105> ADD-STR
        if (StrWorkNo = StringOfChar('0', 10)) then
            // 依頼人コード「0000000000」は認める(ジャパンネット銀行対応)
        else
// <105> ADD-END
		if	((Trim (strWorkNo) = '') or (StrToInt64 (Trim (strWorkNo)) = 0)) then
			strWorkNo	:= ''
		else
		begin
			if	(StrToInt64 (Trim (strWorkNo)) <= 9999999) then
				strWorkNo	:= Format ('%.10d', [StrToInt64 (Trim (strWorkNo))]);
		end;

		CmnMemDataAccInfo.FieldByName ('strClientCode').AsString	:= strWorkNo;

		CmnMemDataAccInfo.Post ();
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetRecordMemDataHojyoMA (dqMasterData: TMQuery);
var
	nBkCode: Integer;
	nBrCode: Integer;
//	strFormat  : String;

Function  lfnGetGCode(pNCODE:Extended):integer;
var
    Qry : TMQuery;
begin

    Result :=  0;

	Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

	with (Qry) do
	begin
		Close ();

		SQL.Clear ();
    	SQL.Add   ('SELECT OffdayCD from OffDayName ');
    	SQL.Add   ('Where NCODE = :pCODE');
        ParamByName('pCODE').asFloat :=  pNCODE;
		Open ();
        if not Eof then
            Result  := FieldByName('OffdayCD').asInteger;
	end;

    Qry.Close;
    Qry.Free;

end;

begin
	with (dqMasterData) do
	begin
		nBkCode	:= FieldByName ('AllBkCode').AsInteger;
		nBrCode	:= FieldByName ('AllBraCode').AsInteger;

		CmnMemDataHojyoMA.Append ();

//		CmnMemDataHojyoMA.FieldByName ('grTag').Assign (fnGetBitmapSelectedTag (FieldByName ('FusenKbn').AsInteger));

		CmnMemDataHojyoMA.FieldByName ('nCode'   ).AsFloat  	  := FieldByName ('NCODE'   ).AsFloat;
		CmnMemDataHojyoMA.FieldByName ('nBkCode'   ).AsInteger	  := nBkCode;
		CmnMemDataHojyoMA.FieldByName ('nBrCode'   ).AsInteger	  := nBrCode;
		CmnMemDataHojyoMA.FieldByName ('strBKName').AsString	  := FieldByName ('BankName'   ).AsString;
		CmnMemDataHojyoMA.FieldByName ('strBKKana').AsString	  := FieldByName ('BankKanaName'   ).AsString;
		CmnMemDataHojyoMA.FieldByName ('strBRName').AsString	  := FieldByName ('BkBraName'   ).AsString;
		CmnMemDataHojyoMA.FieldByName ('strBRKana').AsString	  := FieldByName ('BraKanaName'   ).AsString;
		CmnMemDataHojyoMA.FieldByName ('strRenso').AsString	      := FieldByName ('Renso'   ).AsString;
//		CmnMemDataHojyoMA.FieldByName ('offDCODE').AsInteger 	  := lfnGetGCode(FieldByName ('offDNCODE'   ).AsFloat);
		CmnMemDataHojyoMA.FieldByName ('offDNCODE').AsFloat 	  := FieldByName ('offDNCODE'   ).AsFloat;
//		CmnMemDataHojyoMA.FieldByName ('strComment'    ).AsString := FieldByName ('FusenCmnt' ).AsString;

        CmnMemDataHojyoMA.FieldByName ('OrderCODE').AsFloat := nBkCode * 1000 + nBrCode * 100;

		CmnMemDataHojyoMA.Post ();
	end;
end;

//***********************************************************************************************************/
//   カードデータを取得
//***********************************************************************************************************/
function	TJNTCRP008002f.fnSetScreenDetails (nBkCode,nBrCode: Integer; nAccountCode: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('SELECT * FROM BankInfo ');
        SQL.Add   (' WHERE MasterKbn = :nMasterDivision and RdelKbn = 0');
        SQL.Add   (' AND AllBkCODE  = :nBkCode');
        SQL.Add   (' AND AllBraCode = :nBrCode');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('nBkCode'    ).AsInteger	:= nBkCode;
		ParamByName ('nBrCode'    ).AsInteger	:= nBrCode;

		Open ();

//		CmnEdit00001BkCode.InputFlag	:= TRUE;
		CmnEdit00001BkCode.Value		:= nBkCode;
		CmnEdit00002BrCode.Value		:= nBrCode;

		if	(EOF) then
        begin
            if m_cJNTArea.IsAppend = False then//権限（追加はなし、更新はあり）
            begin
                MjsMessageBoxEx(Self,'権限がない為新規登録できません。','確認',mjInformation,mjOK,mjDefOK );
    			dqMasterData.Close ();
    			dqMasterData.Free  ();
    			fnResetChangeFlagCheckItems ();
                fnInitializeScreenDetailInfo ();
                fnChangeConditionAllControlsDetail (FALSE);
                Result := false;
                Exit;
            end;
			fnInitializeScreenDetails ();
            //全銀協テーブルよりデータをセットする
            fnZenGinDataSet(1,CmnEdit00001BkCode.asInteger,CmnEdit00002BrCode.AsInteger);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			fnResetChangeFlagCheckItems ();

            B_Delete.Enabled := False;

			Result	:= FALSE;
			Exit;
		end;

// <054> MOD start
(*
// <030>↓
//        B_Delete.Enabled := True;
        B_Delete.Enabled := m_cJNTArea.IsDelete;
// <030>↑
*)
		if m_nReferMode = REFER then 		// 参照時は削除ボタンを無効にする
        begin
// <055> MOD start
//			B_Delete .Enabled := False;
        	if m_bDelete then          		// 決算確定でなく、グループ管理なしの場合
            begin
            								// 削除権限がある場合、削除ボタンを有効にする
             	B_Delete.Enabled := m_cJNTArea.IsDelete;
            end
            else
            begin
        		B_Delete.Enabled := False;
            end;
// <055> MOD end
        end
        else
        begin
        	B_Delete.Enabled := m_cJNTArea.IsDelete;
        end;
// <054> MOD end



		CmnEdit00006BrKana .Text   := FieldByName ('BraKanaName'   ).AsString;
		CmnEdit00004BkKana .Text   := FieldByName ('BankKanaName'   ).AsString;
		CmnEdit00003BkName .Text   := FieldByName ('BankName'  ).AsString;
		CmnEdit00005BrName .Text   := FieldByName ('BkBraName'  ).AsString;
		CmnEdit00007NMK  .Text     := FieldByName ('SimpleName').AsString;
		CmnEdit00008Renso.Text     := FieldByName ('Renso').AsString;
		CmnEdit01050BiilRate.value := FieldByName ('BillRate').AsFloat;	// <097> MOD コントロール名変更

		fnSetScreenDetailInformations (dqMasterData, nAccountCode);
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	fnResetChangeFlagCheckItems ();

//<036>    if CmnTabInformations.Items.Selected <> 2 then
//<036>    	CmnTabInformations.Items.Selected	:= 0;

    CmnPanelClientStandard.Visible	:= FALSE;
    CmnPanelClientDetail  .Visible	:= TRUE;

	fnChangeConditionPageButtons (TRUE);

	if	(m_nReferMode = REFER) then														// ﾒｰﾙ会計参照ﾌﾗｸﾞ: 参照時
		fnChangeConditionAllControlsDetail (FALSE);


	Result	:= TRUE;

end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetReportTitleField (nSelected: Integer; strDescription: String;
													var cTitleField: TStringList; var cMemDataField: TStringList);
begin
	case (nSelected) of
		0:	begin																		// 銀行登録ﾘｽﾄ(簡略)
				cTitleField  .Add (strDescription + 'ｺｰﾄﾞ'	  );
				cTitleField  .Add (strDescription + '正式名称');
				cTitleField  .Add (strDescription + '簡略名称');
				cTitleField  .Add ('適用期間開始'			  );
				cTitleField  .Add ('適用期間終了'			  );
				cTitleField  .Add ('最終更新日時'			  );

				cMemDataField.Add ('nBkCode'   );
				cMemDataField.Add ('strName'	   );
				cMemDataField.Add ('strNameSimple' );
				cMemDataField.Add ('strAssociation');
				cMemDataField.Add ('dtAppDateStart');
				cMemDataField.Add ('dtAppDateEnd'  );
				cMemDataField.Add ('dtUpdateDate'  );
			end;

		1:	begin																		// 銀行登録ﾘｽﾄ(詳細)
				cTitleField  .Add (strDescription + 'ｺｰﾄﾞ');
				cTitleField  .Add (strDescription + '名称');
				cTitleField  .Add ('全銀協銀行ｺｰﾄﾞ'		  );
				cTitleField  .Add ('全銀協支店ｺｰﾄﾞ'		  );
				cTitleField  .Add ('全銀協銀行名称'		  );
				cTitleField  .Add ('全銀協銀行名称(ｶﾅ)'	  );
				cTitleField  .Add ('全銀協支店名称'		  );
				cTitleField  .Add ('全銀協支店名称(ｶﾅ)'	  );
				cTitleField  .Add ('FB振込方法'			  );
				cTitleField  .Add ('FB半角ｺｰﾄﾞ体系'		  );
				cTitleField  .Add ('FBﾚｺｰﾄﾞ区切'		  );
				cTitleField  .Add ('FB支払ﾌｧｲﾙ名称'		  );
				cTitleField  .Add ('FB支払ﾎﾞﾘｭｰﾑ名称'	  );
				cTitleField  .Add ('FB経費ﾌｧｲﾙ名称'		  );
				cTitleField  .Add ('FB経費ﾎﾞﾘｭｰﾑ名称'	  );
				cTitleField  .Add ('FB送信区分'			  );
				cTitleField  .Add ('手形ﾚｲｱｳﾄﾌｧｲﾙ名'	  );
				cTitleField  .Add ('手形文字種別'		  );
				cTitleField  .Add ('小切手ﾚｲｱｳﾄﾌｧｲﾙ名'	  );
				cTitleField  .Add ('小切手文字種別'		  );
				cTitleField  .Add ('個別手数料採用区分'	  );

				cMemDataField.Add ('nBkCode'			);
				cMemDataField.Add ('strNameSimple'			);
				cMemDataField.Add ('nAllBankCode'			);
				cMemDataField.Add ('nBranchCode'			);
				cMemDataField.Add ('strAllBankCodeDesc'		);
				cMemDataField.Add ('strAllBankCodeDescKana'	);
				cMemDataField.Add ('strBranchCodeDesc'		);
				cMemDataField.Add ('strBranchCodeDescKana'	);
				cMemDataField.Add ('strPayDivisionDesc'		);
				cMemDataField.Add ('strFBCodeModeDesc'		);
				cMemDataField.Add ('strRecordPauseDesc'		);
				cMemDataField.Add ('strFileName'			);
				cMemDataField.Add ('strVolumeName'			);
				cMemDataField.Add ('strFileNameExp'			);
				cMemDataField.Add ('strVolumeNameExp'		);
				cMemDataField.Add ('strFBSendDivisionDesc'  );
				cMemDataField.Add ('strLayoutPathDraft'		);
				cMemDataField.Add ('strChaDivisionDraftDesc');
				cMemDataField.Add ('strLayoutPathCheck'		);
				cMemDataField.Add ('strChaDivisionCheckDesc');
				cMemDataField.Add ('strFeeDivisionDesc'		);
			end;

		2:	begin																		// 口座登録ﾘｽﾄ
				cTitleField  .Add ('口座ｺｰﾄﾞ'			  );
				cTitleField  .Add (strDescription + 'ｺｰﾄﾞ');
				cTitleField  .Add (strDescription + '名称');
				cTitleField  .Add ('預金種目'			  );
				cTitleField  .Add ('口座番号'			  );
				cTitleField  .Add ('振込依頼人ｺｰﾄﾞ'		  );
				cTitleField  .Add ('振込依頼人名称'		  );
				cTitleField  .Add ('振込依頼人名称(ｶﾅ)'	  );
				cTitleField  .Add ('科目ｺｰﾄﾞ'			  );
				cTitleField  .Add ('科目名称'			  );
				cTitleField  .Add ('科目別補助ｺｰﾄﾞ'       );
				cTitleField  .Add ('科目別補助名称'       );
				cTitleField  .Add ('部門ｺｰﾄﾞ'             );
				cTitleField  .Add ('部門名称'             );
				cTitleField  .Add ('ｾｸﾞﾒﾝﾄｺｰﾄﾞ'           );
				cTitleField  .Add ('ｾｸﾞﾒﾝﾄ名称'           );
				cTitleField  .Add ('第1補助ｺｰﾄﾞ'          );
				cTitleField  .Add ('第1補助名称'          );
				cTitleField  .Add ('第2補助ｺｰﾄﾞ'          );
				cTitleField  .Add ('第2補助名称'          );

				cMemDataField.Add ('nAccountCode'		  );
				cMemDataField.Add ('nBkCode'		  );
				cMemDataField.Add ('strNameSimple'		  );
				cMemDataField.Add ('strDepDivisionDesc'	  );
				cMemDataField.Add ('strAccountNo'		  );
				cMemDataField.Add ('nClientCode'		  );
				cMemDataField.Add ('strClientCodeDesc'	  );
				cMemDataField.Add ('strClientCodeDescKana');
				cMemDataField.Add ('nKmkCode'			  );
				cMemDataField.Add ('strKmkCodeDesc'		  );
				cMemDataField.Add ('nKmkCodeSub'          );
				cMemDataField.Add ('strKmkCodeSubDesc'    );
				cMemDataField.Add ('strBumCode'           );
				cMemDataField.Add ('strBumCodeDesc'       );
				cMemDataField.Add ('strSegCode'           );
				cMemDataField.Add ('strSegCodeDesc'       );
				cMemDataField.Add ('strHo1Code'           );
				cMemDataField.Add ('strHo1CodeDesc'       );
				cMemDataField.Add ('strHo2Code'           );
				cMemDataField.Add ('strHo2CodeDesc'       );
			end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetScreenDetailInformation01 (dqMasterData: TMQuery;
																	nFeeDivision: Integer; nPayDivision: Integer);
var
	arBasedFee	  : array [1..3] of Extended;
	nClass		  : Integer;
	nRow		  : Integer;
	nColumn		  : Integer;
//	strDescription: String;

begin
	with (dqMasterData) do
	begin
		arBasedFee [1]	:= 0;
		arBasedFee [2]	:= FieldByName ('FeeStand1').AsCurrency;
		arBasedFee [3]	:= FieldByName ('FeeStand2').AsCurrency;

		nClass	:= FieldByName ('RecSyubetu').AsInteger;

		for	nRow := 1 to 3 do
		begin
			for	nColumn := 1 to 6 do
			begin
				if	((nRow = 3) and (nColumn = 2)) then
					Continue;

//				TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:=
//        															FieldByName ('Fee' + IntToStr (nColumn - 2) + IntToStr (nRow)).AsCurrency;
				case (nColumn) of
					1:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow];
					2:		TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:= arBasedFee [nRow + 1];
					else	TMNumEdit (MJSFindCtrl (Self, Format (_FeeValue, [nClass, nRow, nColumn]))).Value	:=
															FieldByName ('Fee' + IntToStr (nColumn - 2) + IntToStr (nRow)).AsCurrency;
				end;
			end;
		end;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetScreenDetailInformation02 (dqMasterData: TMQuery);
var
	strDescription: String;

begin
	with (dqMasterData) do
	begin
		if	(FieldByName ('AllBkCode').IsNull) then										// 全銀協銀行ｺｰﾄﾞ
		begin
			CmnEdit00001BkCode.Value		:= 0;
//			CmnEdit00001BkCode.InputFlag	:= TRUE;
		end
		else
		begin
			CmnEdit00001BkCode.Value		:= FieldByName ('AllBkCode').AsInteger;
//			CmnEdit00001BkCode.InputFlag	:= FALSE;
		end;

		if	(FieldByName ('AllBraCode').IsNull) then	 								// 全銀協支店ｺｰﾄﾞ
		begin
			CmnEdit00002BrCode.Value		:= 0;
//			CmnEdit00002BrCode.InputFlag	:= TRUE;
		end
		else
		begin
			CmnEdit00002BrCode.Value		:= FieldByName ('AllBraCode').AsInteger;
//			CmnEdit00002BrCode.InputFlag	:= FALSE;
		end;

		CmnEdit00003BkName.Text	:= FieldByName ('BankName'    ).AsString;	// 全銀協銀行名称
		CmnEdit00004BkKana.Text	:= FieldByName ('BankKanaName').AsString;	// 全銀協銀行名称(ｶﾅ)
		CmnEdit00005BrName.Text	:= FieldByName ('BkBraName'   ).AsString;	// 全銀協支店名称
		CmnEdit00006BrKana.Text	:= FieldByName ('BraKanaName' ).AsString;	// 全銀協支店名称(ｶﾅ)
	end;

	fnGetDescriptionSelectedItem (CmnEdit03004PayDivision , strDescription);
	CmnLabel03004PayDivisionDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03005ReqKbn , strDescription);
	CmnLabel03005ReqKbnDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03006Syumoku , strDescription);
	CmnLabel03006SyumokuDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03007FBCodeMode    , strDescription);
	CmnLabel03007FBCodeModeDesc    .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03008RecordPause   , strDescription);
	CmnLabel03008RecordPauseDesc   .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03021FeeDivision   , strDescription);
	CmnLabel03021FeeDivisionDesc   .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03027SouFuripattern , strDescription);		// <103>
	CmnLabel03027SouFuriPatternDesc.Caption	:= strDescription;						// <103>

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetScreenDetailInformation03 (dqMasterData: TMQuery);
var
	strDescription: String;


    // -----------------------------------
    //  外部部ｺｰﾄﾞの取得
    // -----------------------------------
    function fnGetGCode(nData: Extended): Integer;
    var
    	dqMasterData    :   TMQuery;
    begin

        Result  :=  0;

        dqMasterData	:= TMQuery.Create (Self);

        // DBとMQueryの接続
    	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

        with (dqMasterData) do
    	begin
    		Close;
    		SQL.Clear;
            SQL.Add('SELECT GCODE FROM AccInfo'
                +   ' WHERE NCODE = :nExNCode     ');
            ParamByName('nExNCode').AsFloat  :=  nData;
            Open();

            if	( not EOF ) then
                Result  :=  GetFld('GCODE').AsInteger;

        end;

    	dqMasterData.Close ();
    	dqMasterData.Free  ();

    end;
begin
	with (dqMasterData) do
	begin
		CmnEdit02001LayoutPathDraft .Text	:= FieldByName ('TegLayPath'   ).AsString;	// 手形ﾚｲｱｳﾄﾊﾟｽ
		CmnEdit02002ChaDivisionDraft.Value	:= FieldByName ('TegKinSyubetu').AsInteger;	// 金額文字種別
		CmnEdit02003LayoutPathCheck .Text	:= FieldByName ('KogLayPath'   ).AsString;	// 小切手ﾚｲｱｳﾄﾊﾟｽ
		CmnEdit02004ChaDivisionCheck.Value	:= FieldByName ('KogKinSyubetu').AsInteger;	// 小切手文字種別
		CmnEdit02005LayoutPathCheck .Text	:= FieldByName ('BillLayPath1'   ).AsString;	//
		CmnEdit02006LayoutPathCheck .Text	:= FieldByName ('BillLayPath2'   ).AsString;	//
		CmnEdit02007LayoutPathCheck .Text	:= FieldByName ('BillLayPath3'   ).AsString;	//
		CmnEdit02008ChaDivisionCheck .Value	:= fnGetGCode(FieldByName ('BillAccCode'   ).AsFloat);	//
		CmnEdit02009LayoutPathCheck .Text	:= FieldByName ('BillLayPath4'   ).AsString;	// 組戻依頼書ﾚｲｱｳﾄﾊﾟｽ <075>Add
// <096> ADD↓
		// 外国送金情報はGaliNX-Iのみ
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			CmnEdit02010SoukinClientCode.Text		:= FieldByName ('ClientCode').AsString;		// 送金依頼人ｺｰﾄﾞ
			CmnEdit02011SoukinClientNameKana.Text	:= FieldByName ('ClientName').AsString;		// 送金依頼人名称(ｶﾅ)
	        CmnEdit02012SoukinCodeMode.Value		:= FieldByName ('FBCodeMode').AsInteger;   	// 半角レコード体系
	        CmnEdit02013SoukinRecordPause.Value     := FieldByName ('RecordPause').AsInteger;	// レコード区切り
	        CmnEdit02014SoukinFileName.Text			:= FieldByName ('FileName').AsString;		// ファイル名
		end;
// <096> ADD↑
	end;

	fnGetDescriptionSelectedItem (CmnEdit02002ChaDivisionDraft, strDescription);
	CmnLabel02002ChaDivisionDraftDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit02004ChaDivisionCheck, strDescription);
	CmnLabel02004ChaDivisionCheckDesc.Caption	:= strDescription;

    fnSetFieldDescAccountCode(dqMasterData);

// <096> ADD↓
	// 外国送金情報はGaliNX-Iのみ
	if not TMSeries.IsMjsLink3 and
	   not TMSeries.IsGalileopt then
	begin
		fnGetDescriptionSelectedItem (CmnEdit02012SoukinCodeMode, strDescription);
		CmnLabel02012SoukinCodeModeDesc.Caption	:= strDescription;

		fnGetDescriptionSelectedItem (CmnEdit02013SoukinRecordPause, strDescription);
		CmnLabel02013SoukinRecordPauseDesc.Caption	:= strDescription;
	end;
// <096> ADD↑
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetScreenDetailInformation04 (dqMasterData: TMQuery);
var
	cNumEdit	  : TMNumEdit;
	cTxtEdit	  : TMTxtEdit;
	nPosition	  : Integer;
	strDescription: String;
    strHojCode    : String;     // <044>
    iPartKbn      : Integer;    // <044>
    iLoop         : Integer;    // <087> ADD

// <044> 2006/12/21 H.Kawato Add Start
Procedure lfnSetMasterInfo(i,pMKBN:Integer);
var
	Qry: TMQuery;
begin

	Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
    with Qry do
    begin
        Close;
    	SQL.Clear ();
		SQL.Add   ('SELECT MasterKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQL.Add   ('Where MasterKbn = :pMKBN ');
        ParamByName('pMKBN').asInteger := pMKBN;
        Open;
        if not Eof then
        begin
            m_arCodeAttribute [i].strDescription := FieldByName('JHojyoName').asString;
            m_arCodeAttribute [i].nDigit         := FieldByName('CodeDigit').asInteger;
            m_arCodeAttribute [i].nAttribute     := FieldByName('CodeAttr').asInteger;
        end;
        Close;
    end;

end;
// <044> 2006/12/21 H.Kawato Add End
begin
	with (dqMasterData) do
	begin
        CmnEdit03001AccountCode.Value		:= FieldByName ('GCode').AsInteger;
        CmnEdit03001AccountCode.InputFlag	:= FALSE;

		CmnEdit03002DepDivision.Value	:= FieldByName ('AccKbn').AsInteger;			// 預金種別

		if	(Trim (FieldByName ('AccNo').AsString) <> '') then							// 口座番号
		begin
// <034>↓
{			if	(StrToInt64 (Trim (FieldByName ('AccNo').AsString)) > 9999999) then
				CmnEdit03003AccountNo.Text	:= FieldByName ('AccNo').AsString
			else
				CmnEdit03003AccountNo.Text	:= Format ('%.7d', [StrToInt64 (Trim (FieldByName ('AccNo').AsString))]);
}
		// <067>	if	(StrToInt64 (Trim (FieldByName ('AccNo').AsString)) > 99999999) then
		// <067>		CmnEdit03003AccountNo.Text	:= FieldByName ('AccNo').AsString
		// <067>	else
		// <067>		CmnEdit03003AccountNo.Text	:= Format ('%.8d', [StrToInt64 (Trim (FieldByName ('AccNo').AsString))]);
// <034>↑
			// <067> ↓
			if	(Length (Trim (FieldByName ('AccNo').AsString)) > 7) then
				CmnEdit03003AccountNo.Text	:= FieldByName ('AccNo').AsString
			else
				CmnEdit03003AccountNo.Text	:= Format ('%.7d', [StrToInt64 (Trim (FieldByName ('AccNo').AsString))]);
            // <067> ↑
		end
		else
			CmnEdit03003AccountNo.Text	:= '';
        CmnEdit03026AccMemo.Text	      := FieldByName ('AccMemo').AsString; 		// 口座メモ <099> ADD

// <084> ADD-STR
        if (FieldByName ('Shubetsu').AsInteger = 2) then
            CmnEdit03004PayDivision.value     := 0
        else
// <084> ADD-END
            CmnEdit03004PayDivision.value     := FieldByName ('Shubetsu').AsInteger; 	// 振込種別
        CmnEdit03005ReqKbn.value          := FieldByName ('RequestKbn').AsInteger; 		// リクエスト区分
        CmnEdit03006Syumoku.Value         := FieldByName ('Shumoku').AsInteger;    	    // 種目
        CmnEdit03007FBCodeMode.Value      := FieldByName ('FBCodeMode').AsInteger;    	// 半角レコード体系
        CmnEdit03008RecordPause.Value     := FieldByName ('RecordPause').AsInteger;    	// レコード区切り
// <087> ADD-STR
        // 支払レイアウト
        CmnCmbo03024Layout.ItemIndex      := 0;
        for iLoop := 1 to CmnCmbo03024Layout.Items.Count - 1 do
        begin
            if (CmnCmbo03024Layout.Items[iLoop] = FieldByName ('LayoutInfo').AsString) then
            begin
                CmnCmbo03024Layout.ItemIndex      := iLoop;
                Break;
            end;
        end;
// <087> ADD-END
        CmnEdit03021FeeDivision.Value     := FieldByName ('FeeUseMode').AsInteger;    	// 手数料摘要区分
		CmnEdit03009ClientCode    .Text	  := FieldByName ('ClientCode').AsString; 		// 振込依頼人ｺｰﾄﾞ
		CmnEdit03010ClientName    .Text	  := FieldByName ('AccInfo1'  ).AsString; 		// 振込依頼人名称
		CmnEdit03011ClientNameKana.Text	  := FieldByName ('ClientName').AsString; 		// 振込依頼人名称(ｶﾅ)
        CmnEdit03012FileName.Text	      := FieldByName ('FileName').AsString; 		// ファイル名
        CmnEdit03013VolumeName.Text	      := FieldByName ('VolName').AsString; 		    // ボリューム名
        CmnEdit03023FeePayKbn.Value	      := FieldByName ('FeePayKbn').AsInteger;		// <076> Add 手数料支払区分
        CmnEdit03025FreeItem.Text	      := FieldByName ('AccInfo2').AsString; 		// フリー項目 <092> ADD
        CmnEdit03027SouFuripattern.Value  := FieldByName ('AccZanLimit').AsInteger;    	// 総合振込出力方式	 <103>

		if	(FieldByName ('CKmkNCode').IsNull or (FieldByName ('CKmkNCode').AsInteger = 0)) then
		begin
			CmnEdit03014KmkCode.Value		:= 0;
			CmnEdit03014KmkCode.InputFlag	:= TRUE;
		end
		else
		begin
			CmnEdit03014KmkCode.Value		:= StrToFloat(fnGetGcode_Master(FieldByName ('CKmkNCode').AsFloat,MASTER_SUBJECT,1));
			CmnEdit03014KmkCode.InputFlag	:= FALSE;
		end;

		fnSetAttributeJournalInfo (CmnEdit03014KmkCode.AsInteger);

		for	nPosition := 0 to 5 do
		begin
			if	(m_arCodeAttribute [nPosition].fEnabled) then
			begin
				cNumEdit	:= nil;
				cTxtEdit	:= nil;

				case (nPosition) of
					0:	begin
							cNumEdit	:= CmnEdit03015KmsCodeNumeric;//科目別補助
							cTxtEdit	:= CmnEdit03015KmsCodeFree;
						end;
					1:	begin
							cNumEdit	:= CmnEdit03016BumCodeNumeric;//部門
							cTxtEdit	:= CmnEdit03016BumCodeFree;
						end;
					2:	begin
							cNumEdit	:= CmnEdit03017SegCodeNumeric;//セグメント
							cTxtEdit	:= CmnEdit03017SegCodeFree;
						end;
					3:	begin
							cNumEdit	:= CmnEdit03018HojCodeNumeric;//第一補助
							cTxtEdit	:= CmnEdit03018HojCodeFree;
						end;
					4:	begin
							cNumEdit	:= CmnEdit03019HojCodeNumeric;//第二補助
							cTxtEdit	:= CmnEdit03019HojCodeFree;
						end;
					5:	begin
							cNumEdit	:= CmnEdit03020PrjCodeNumeric;//プロジェクト
							cTxtEdit	:= CmnEdit03020PrjCodeFree;
						end;
				end;
              
				if	(m_arCodeAttribute [nPosition].nAttribute <= 1) then
				begin
                    if	(not FieldByName (_JournalInfo [nPosition]).IsNull) then
                    begin
                       // <068> ↓ cNumEdit.Value		:= StrToFloat(fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,m_arCodeAttribute [nPosition].nMasterDivision,m_arCodeAttribute [nPosition].nAttribute));
                        if (nPosition = 3) and (FieldByName ('CHojKbn1').AsInteger = 0)
                        	and (m_arCodeAttribute [nPosition].nMasterDivision = MASTER_BANK) then
                           //	cNumEdit.Text := ''
                        else if (nPosition = 4) and (FieldByName ('CHojKbn2').AsInteger = 0)
                        	and (m_arCodeAttribute [nPosition].nMasterDivision = MASTER_BANK) then
                           //	cNumEdit.Text := ''
// <071> ADD-STR
                        else if (FieldByName (_JournalInfo [nPosition]).AsFloat = 0) then
// <071> ADD-END
                        else
                        begin
                            cNumEdit.Value		:= StrToFloat(fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,m_arCodeAttribute [nPosition].nMasterDivision,m_arCodeAttribute [nPosition].nAttribute));
                            cNumEdit.InputFlag	:= FALSE;
                        end;

                       // cNumEdit.InputFlag	:= FALSE;
                        // <068> ↑
                    end;
				end
				else
					cTxtEdit.Text	:= fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,m_arCodeAttribute [nPosition].nMasterDivision,m_arCodeAttribute [nPosition].nAttribute);

				strDescription	:= '';

				if	(nPosition = 0) then
				begin
					if	(not FieldByName (_JournalInfo [nPosition]).IsNull) then
						fnCheckValidKmsCode (StrToInt(fnGetGcode_Master(FieldByName ('CKmkNCode').AsFloat,MASTER_SUBJECT,1)),
												fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,MASTER_SUBJECTPLUS,1),strDescription);

				end
				else
				begin
					if	((not FieldByName (_JournalInfo [nPosition]).IsNull) and
						 (Trim (FieldByName (_JournalInfo [nPosition]).AsString) <> '')) then
					begin
// <063> MOD start
(*
						fnCheckValidHojCode (m_arCodeAttribute [nPosition].nMasterDivision,
												fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,m_arCodeAttribute [nPosition].nMasterDivision,m_arCodeAttribute [nPosition].nAttribute), strDescription);
*)
						if	not fnCheckValidHojCode (m_arCodeAttribute [nPosition].nMasterDivision,
											 fnGetGcode_Master(FieldByName (_JournalInfo [nPosition]).AsFloat,
                                             m_arCodeAttribute [nPosition].nMasterDivision,
                                             m_arCodeAttribute [nPosition].nAttribute),
                                             strDescription, FieldByName ('CBmnNCode').AsFloat) then
						begin
							Continue;
						end;

						// 部門
						if (nPosition = 1) and (strDescription <> '') then
                        begin
                        	cNumEdit.TagStr := FloatToStr(FieldByName ('CBmnNCode').AsFloat);
							cTxtEdit.TagStr := FloatToStr(FieldByName ('CBmnNCode').AsFloat);
                        end;
					end;

// <063> MOD end
				end;

				TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 12) + 'Desc')).Caption	:= strDescription;
			end;
		end;
// <044> 2006/12/21 H.Kawato Add Start
        // プロジェクトサブ
        if	(m_arCodeAttribute [5].fEnabled) then   // ﾌﾟﾛｼﾞｪｸﾄ
        begin
            if  (m_arCodeAttribute [5].nAttribute <= 1) then
            begin
        	    if	(CmnEdit03020PrjCodeNumeric.InputFlag) then
        		    strHojCode	:= ''
        	    else
        		    strHojCode	:= fnGetDspData(Format ('%.16d', [Trunc (CmnEdit03020PrjCodeNumeric.Value)]),m_arCodeAttribute [5].nAttribute);
            end
            else
        	    strHojCode	:= fnGetDspData(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nAttribute);

            iPartKbn    := GetKojiInfo(m_arCodeAttribute [5].nMasterDivision, strHojCode);

            if  (iPartKbn <> 0) then
            begin
                m_arCodeAttribute [6].fEnabled	:= FALSE;

                //ﾌﾟﾛｼﾞｪｸﾄﾏｽﾀ区分を求める
                m_arCodeAttribute [6].nMasterDivision	:= m_arCodeAttribute [5].nMasterDivision + 100;

                lfnSetMasterInfo(6,m_arCodeAttribute [6].nMasterDivision);

                m_arCodeAttribute [6].fEnabled	:= TRUE;
                m_arCodeAttribute [6].fStatic	:= FALSE;
                CmnLabel03022PjSCode.caption    := m_arCodeAttribute [6].strDescription;

            	fnChangeConditionJournalInfo (6);
                fnSetChangeFlagCheckItems (CmnEdit03022PjSCodeNumeric, FALSE);

                cNumEdit	:= CmnEdit03022PjSCodeNumeric;//プロジェクトサブ
                cTxtEdit	:= CmnEdit03022PjSCodeFree;

                if	(m_arCodeAttribute [6].nAttribute <= 1) then
                begin
                    if	(not FieldByName (_JournalInfo [6]).IsNull) then
                    begin
// <071> ADD-STR
                        if (FieldByName (_JournalInfo [6]).AsFloat <> 0) then
                        begin
// <071> ADD-END
                            cNumEdit.Value		:= StrToFloat(fnGetGcode_Master(FieldByName (_JournalInfo [6]).AsFloat,m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute));
                            cNumEdit.InputFlag	:= FALSE;
                        end;    // <071> ADD
                    end;
                end
                else
                	cTxtEdit.Text	:= fnGetGcode_Master(FieldByName (_JournalInfo [6]).AsFloat,m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute);

                strDescription	:= '';

                if	((not FieldByName (_JournalInfo [6]).IsNull) and (Trim (FieldByName (_JournalInfo [6]).AsString) <> '')) then
// <063> MOD start
(*
                	fnCheckValidHojCode (m_arCodeAttribute [6].nMasterDivision,
                							fnGetGcode_Master(FieldByName (_JournalInfo [6]).AsFloat,m_arCodeAttribute [6].nMasterDivision,m_arCodeAttribute [6].nAttribute), strDescription);
*)
					fnCheckValidHojCode (m_arCodeAttribute [6].nMasterDivision,
                						 fnGetGcode_Master(FieldByName (_JournalInfo [6]).AsFloat,
                                         m_arCodeAttribute [6].nMasterDivision,
                                         m_arCodeAttribute [6].nAttribute),
                                         strDescription, 0);

// <063> MOD end
                TMLabel (MJSFindCtrl (Self, 'CmnLabel' + Copy (cNumEdit.Name, 8, 12) + 'Desc')).Caption	:= strDescription;
            end;
        end;
// <044> 2006/12/21 H.Kawato Add End
	end;

	fnGetDescriptionSelectedItem (CmnEdit03002DepDivision, strDescription);
	CmnLabel03002DepDivisionDesc.Caption	:= strDescription;

	fnCheckValidKmkCode (CmnEdit03014KmkCode.AsInteger, strDescription);
	CmnLabel03014KmkCodeDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03004PayDivision , strDescription);
	CmnLabel03004PayDivisionDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03005ReqKbn , strDescription);
	CmnLabel03005ReqKbnDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03006Syumoku , strDescription);
	CmnLabel03006SyumokuDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03007FBCodeMode , strDescription);
	CmnLabel03007FBCodeModeDesc .Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03008RecordPause, strDescription);
	CmnLabel03008RecordPauseDesc.Caption	:= strDescription;

	fnGetDescriptionSelectedItem (CmnEdit03021FeeDivision, strDescription);
	CmnLabel03021FeeDivisionDesc.Caption	:= strDescription;

    // <076> Add start
	fnGetDescriptionSelectedItem (CmnEdit03023FeePayKbn, strDescription);
	CmnLabel03023FeePayKbnDesc.Caption	:= strDescription;
    // <076> Add end
    
    fnGetDescriptionSelectedItem (CmnEdit03027SouFuriPattern, strDescription);		// <103>
	CmnLabel03027SouFuriPatternDesc.Caption	:= strDescription;						// <103>


end;
//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetScreenDetailInformations (dqMasterData: TMQuery; nAccountCode: Integer);
var
	nClass		: Integer;
	nFeeDivision: Integer;
	nPayDivision: Integer;
///	nBkCode	: Integer;
    nNCode  : Extended;
//    Qry : TMQuery;
    sSQL    : String;   // <094> ADD
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

    CmnEdit01049StartYMD.AsDateTime := 0;          // <TX26> ADD	// <097> MOD コントロール名変更
	m_DateStartYMD := CmnEdit01049StartYMD.AsDateTime;				// <097> ADD 適用開始日変更判定用

	with (dqMasterData) do
	begin
///		nBkCode		    := FieldByName ('AllBkCode').AsInteger;							// 銀行ｺｰﾄﾞ
		nNCode		    := FieldByName ('NCode').AsFloat;							    // 内部ｺｰﾄﾞ
//		nFeeDivision	:= FieldByName ('FeeUseMode').AsInteger;						// 個別手数料適用区分
		nFeeDivision	:= 0;						// 個別手数料適用区分
//		nPayDivision	:= FieldByName ('FuriHouHou').AsInteger;						// 振込方法
		nPayDivision	:= 0;						// 振込方法

        fnSetScreenDetailInformation02 (dqMasterData);
        fnSetScreenDetailInformation03 (dqMasterData);

        for	nClass := 1 to 3 do
        begin
//↓<MLXHAP>MLXでないときに、FeeInfoからのselectを行う。
            if not TMSeries.IsMjsLink3 then
            begin
//↑<MLXHAP>以下、字下げ。
                Close ();

                SQL.Clear ();
                SQL.Add   ('SELECT RecSyubetu, FeeStand1, FeeStand2, Fee11, Fee12, Fee13, ');
                SQL.Add   ('       Fee21, Fee22, Fee23, Fee31, Fee32, Fee33, Fee41, Fee42, Fee43 ');
                SQL.Add   ('      ,StartDate ');    // <TX26> ADD
                SQL.Add   ('FROM   FeeInfo ');
                SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
                SQL.Add   ('       BankNCode = :nBkCode AND RecSyubetu = :nClass');

                ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
                ParamByName ('nBkCode'    ).AsFloat     	:= nNCode;
                ParamByName ('nClass'         ).AsInteger	:= nClass;

                Open ();

                if	(EOF) then
                    fnInitializeScreenDetailInfo01 (nClass)
                else
                    fnSetScreenDetailInformation01 (dqMasterData, nFeeDivision, nPayDivision);
// <TX26> ADD-STR
                if (nClass = 1) and (not Eof) then
// <097> MOD↓
//                    MDateStartYMD.AsDateTime := MjsDateCtrl.MjsIntToDate(FieldByName ('StartDate').AsInteger, #0);
				begin
					CmnEdit01049StartYMD.AsDateTime := MjsDateCtrl.MjsIntToDate(FieldByName ('StartDate').AsInteger, #0);
					// 変更判定変数にも値を格納する
					m_DateStartYMD := CmnEdit01049StartYMD.AsDateTime;
				end;
// <097> MOD↑
// <TX26> ADD-END
//↓<MLXHAP>
			end
			else
			begin
				// MLX時は、上記クエリ結果EOF=TRUEのロジックと同じロジックとしておく。
				fnInitializeScreenDetailInfo01 (nClass);
			end;
//↑<MLXHAP>
        end;
// <094> ADD-STR
        if not TMSeries.IsMjsLink3 then
        begin
            // 11:電子記録債権発生手数料
            sSQL := SQL.Text;
            Close ();
            SQL.Clear ();
            SQL.Add   (sSQL);

            ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
            ParamByName ('nBkCode'    ).AsFloat     	:= nNCode;
            ParamByName ('nClass').AsInteger            := 11;

            CmnEdit01044Densai1.Value := 0;		// <097> MOD コントロール名変更
            CmnEdit01045Densai2.Value := 0;		// <097> MOD コントロール名変更

            Open ();

            if (not EOF) then
            begin
                CmnEdit01044Densai1.Value := FieldByName ('Fee41').AsCurrency;    // 同行	// <097> MOD コントロール名変更
                CmnEdit01045Densai2.Value := FieldByName ('Fee11').AsCurrency;    // 他行	// <097> MOD コントロール名変更
            end;
		end;
// <094> ADD-END
// <096> ADD↓
		if not TMSeries.IsMjsLink3 and
		   not TMSeries.IsGalileopt then
		begin
			// 12:海外手数料
			Close ();
			SQL.Clear ();
			SQL.Add('SELECT Fee11, Fee41, OverseaFee FROM FeeInfo ');
			SQL.Add('WHERE  MasterKbn = :nMasterDivision AND ');
			SQL.Add('       BankNCode = :nBkCode AND RecSyubetu = :nClass');

			ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
			ParamByName ('nBkCode').AsFloat     		:= nNCode;
			ParamByName ('nClass').AsInteger			:= 12;

			CmnEdit01046Oversea1.Value := 0;
			CmnEdit01047Oversea2.Value := 0;
			CmnEdit01048Oversea3.Value := 0;

			Open ();

			if (not EOF) then
			begin
				CmnEdit01046Oversea1.Value := FieldByName ('Fee41').AsCurrency;			// 関係銀行
				CmnEdit01047Oversea2.Value := FieldByName ('Fee11').AsCurrency;			// 他銀行
				CmnEdit01048Oversea3.Value := FieldByName ('OverseaFee').AsCurrency;	// 海外手数料
			end;
		end;
// <096> ADD↑

        Close ();

        SQL.Clear ();
        SQL.Add   ('SELECT * FROM AccInfo ');
        SQL.Add   ('WHERE GCode = :nAccountCode AND RdelKbn = 0');
        SQL.Add   ('  And BankNCode = :nBkCode');

        ParamByName ('nAccountCode').AsInteger	:= nAccountCode;
        ParamByName ('nBkCode'    ).AsFloat     := nNCode;

        Open ();

        if	(EOF) then
            fnInitializeScreenDetailInfo03 ()
        else
            fnSetScreenDetailInformation04 (dqMasterData);
    end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnSetTagInfoGridHojyoMA (nTagKind: Integer);
var
	nTagKindWork: Integer;
	nBkCode	: Integer;

begin
	if	(Trim (CmnMemDataHojyoMA.FieldByName ('nBkCode').AsString) = '') then
		Exit;

	nBkCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;

	if	(fnUpdateRecordMFusenInfo (nbkCode, nTagKind)) then
		nTagKindWork	:= nTagKind
	else
		nTagKindWork	:= 0;

	fnUpdateRecordMemDataHojyoMA (nBkCode, nTagKindWork);
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnShowScreenInformations (): Boolean;
var
	nAccountCode: Integer;
	nBkCode,
    nBrCode	    : Integer;
	fReturn		: Boolean;

begin
    nAccountCode    := 0;   ///<044>

	if	(Screen.ActiveControl.Name = CmnTreeView.Name) then								// ﾂﾘｰﾋﾞｭｰ
	begin
		nBkCode		 := PTreeViewRec (CmnTreeView.Selected.Data)^.nBkCode;
		nBrCode	     := PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode;
		nAccountCode := CmnMemDataAccInfo.FieldByName ('nAccountCode').AsInteger;
	end
	else if	(Screen.ActiveControl.Name = CmnGridHojyoMA.Name) then						// HojyoMA ｸﾞﾘｯﾄﾞ
	begin
		nBkCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;
		nBrCode	:= CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger;
		nAccountCode := CmnMemDataAccInfo.FieldByName ('nAccountCode').AsInteger;
	end
	else if	((Screen.ActiveControl.Name = CmnGridAccInfo.Name)) then
	begin
//<021>	if	(CmnMemDataAccInfo.FieldByName ('nNCode').AsInteger <> 0) then
		if ( CmnMemDataAccInfonNCODE.AsFloat <> 0 ) then
		begin
			nBkCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;
			nBrCode	:= CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger;
		end
		else
        begin
			nBkCode	:= 0;
			nBrCode	:= 0;
        end;

		nAccountCode	:= CmnMemDataAccInfo.FieldByName ('nAccountCode').AsInteger;
	end
	else if	(CmnPanelClientDetail.Visible) then											// 詳細: 銀行情報登録
	begin
		nBkCode	:= CmnEdit00001BkCode.asInteger;
		nBrCode	:= CmnEdit00002BrCode.asInteger;
        nAccountCode	:= CmnEdit03001AccountCode.AsInteger
	end
	else																				// ﾂﾘｰﾋﾞｭｰ
	begin
		nBkCode		 := PTreeViewRec (CmnTreeView.Selected.Data)^.nBkCode;
		nBrCode		 := PTreeViewRec (CmnTreeView.Selected.Data)^.nBrCode;
//	end
//	begin
//		Result	:= FALSE;
//		Exit;
	end;

    //カードデータを表示
	fReturn	:= fnSetScreenDetails (nBkCode,nBrCode, nAccountCode);

	Result	:= fReturn;


end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnTerminateCheckItems ();
var
	nItems: Integer;

begin
	for nItems := 0 to m_cCheckItems.Count - 1 do
		Dispose (PCheckItemRec (m_cCheckItems.Items [nItems]));

	m_cCheckItems.Free ();
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordDetail (): Boolean;
var
	pBankInfoData: ^BankInfoData;
//	pAccInfoData: ^AccInfoData;
///	nDivision	: Integer;

begin
	if	(not fnCheckEditItemsValue ()) then
	begin
		if	((m_cACControl is TMNumEdit) or (m_cACControl is TMTxtEdit) or (m_cACControl is TMDateEdit)) then
		begin
			m_cACControl.SetFocus ();

			TEdit (m_cACControl).SelectAll ();
//			Beep  ();
		end;

		Result	:= FALSE;
		Exit;
	end;
{
    if	(CmnEdit00001BkCode.Static) then
        nDivision	:= 1
    else
        nDivision	:= 0;
}

    New (pBankInfoData);

    pBankInfoData^.nBkCode	    	:= CmnEdit00001BkCode.AsInteger;
    pBankInfoData^.nBrCode	    	:= CmnEdit00002BrCode.AsInteger;
    pBankInfoData^.strBKName	   	:= CmnEdit00003BkName       .Text;
    pBankInfoData^.strBrName	   	:= CmnEdit00005BrName       .Text;
    pBankInfoData^.strBKKana	   	:= CmnEdit00004BkKana       .Text;
    pBankInfoData^.strBrKana	   	:= CmnEdit00006BrKana       .Text;
    pBankInfoData^.strRenso 	   	:= CmnEdit00008Renso        .Text;
//<003>    pBankInfoData^.nHolCode  	   	:= 0;
    pBankInfoData^.nHolCode  	   	:= fnGetHoliday(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);
    pBankInfoData^.fDetails			:= TRUE;

    SessionPractice(C_ST_PROCESS); 				// <061> ADD

	if	(not fnUpdateRecordBank (pBankInfoData)) then								// 補助基本ﾏｽﾀ 更新
   	begin

    	SessionPractice(C_ED_PROCESS);			// <061> ADD

		Result	:= FALSE;
		Exit;
   	end;

    SessionPractice(C_ED_PROCESS);				// <061> ADD

    Dispose (pBankInfoData);

	fnSelectTreeViewItem (CmnEdit00001BkCode.AsInteger, CmnEdit00002BrCode.asInteger);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordAccInfo (pUpdateRecord: Pointer): Boolean;
var
	dqMasterData: TMQuery;
	pRecord		: ^AccInfoData;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	pRecord	:= pUpdateRecord;

    if CmnPanelClientDetail.Visible then
        pRecord^.nNBkCODE := fnGetNCODE(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode FROM AccInfo ');
        SQL.Add   ('WHERE RdelKbn = 0 AND GCode = :nAccCode');
        SQL.Add   (' AND  BankNCode = :nNcode');

		ParamByName ('nAccCode').AsInteger	:= pRecord^.nAccountCode;
		ParamByName ('nNCode').AsFloat  	:= pRecord^.nNBkCODE;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
			dqMasterData.Close ();
			dqMasterData.Free  ();
			Result	:= FALSE;
			Exit;
		end;

        SessionPractice(C_ST_PROCESS); 			// <061> ADD

		if	(EOF) then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstAccInfoInsert (pUpdateRecord));
		end
		else
		begin
			Close ();
			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstAccInfoUpdate (pUpdateRecord));
		end;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result  := FALSE;

            SessionPractice(C_ED_PROCESS);      // <061> ADD

			Exit;
		end;

        SessionPractice(C_ED_PROCESS);			// <061> ADD
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordAccount (pUpdateRecord: Pointer): Boolean;
//var
//	nUpdateMode: Integer;

begin
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	if	(not fnUpdateRecordAccInfo (pUpdateRecord)) then					            // 口座管理情報 更新
   	begin
		Beep ();

		fnOutputDBErrorMessage ();
		m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)

		Result	:= FALSE;
		Exit;
   	end;

	m_cDataModule.Commit (m_cDBSelect);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordBrCodeEx (nBkCode: Integer; nNCode: Extended): Boolean;
var
	pAccInfo: PAccInfoData;
    Qry     : TMQuery;
begin
	New (pAccInfo);

	m_cDataModule.BeginTran (m_cDBSelect);                                      // ﾄﾗﾝｻﾞｸｼｮﾝの開始

    //ツリーで移行したデータの更新
///    Try
        Qry	:= TMQuery.Create (Self);

        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);                      // DBとMQueryの接続
    Try
        with (Qry) do
        begin
            Close ();
    		SQL.Add   ('UPDATE BankInfo SET AllBKCODE = :BKCODE, UpdTantoNCode = :Tanto ');	// <MAS 353>
    		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCODE = :nNCode');
    		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
    		ParamByName ('nNCode').AsFloat          	:= nNCode;
    		ParamByName ('BKCODE').AsInteger         	:= nBkCode;
    		ParamByName ('Tanto').AsFloat          		:= TantoNCode;	        // <MAS 353>
            ExecSql;
        end;
    Except
		Beep ();

		fnOutputDBErrorMessage ();
		m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)

		Dispose (pAccInfo);

		Result	:= FALSE;
        Qry.Close ();
        Qry.Free  ();
		Exit;

    end;

	Qry.Close ();
	Qry.Free  ();


	m_cDataModule.Commit (m_cDBSelect);

	Dispose (pAccInfo);

	Result	:= TRUE;

    fnRebuildGridBankInfo;
    fnRebuildGridAccInfo(nNCode);
    fnRebuildTreeViewItems ();


end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordBank (pUpdateRecord: Pointer): Boolean;
var
	pRecord: ^BankInfoData;
	pAccInfoData: ^AccInfoData;

begin
	pRecord	:= pUpdateRecord;

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始


	if	(not fnUpdateRecordBankInfo (pUpdateRecord)) then								// 補助基本ﾏｽﾀ 更新
   	begin
		Beep ();

		fnOutputDBErrorMessage ();
		m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)

		Result	:= FALSE;
		Exit;
   	end;


	if	(not pRecord^.fDetails) then
	begin
		m_cDataModule.Commit (m_cDBSelect);

        fnRebuildTreeViewItems ();

//		fnUpdateTreeViewItemBank (pUpdateRecord);

		Result	:= TRUE;
		Exit;																			// 以下, 未処理
	end;


	if	(not fnUpdateRecordFeeInfo (pUpdateRecord)) then								// 手数料情報 更新
	begin
		Beep ();

		fnOutputDBErrorMessage ();
		m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)

		Result	:= FALSE;
		Exit;
	end;

    //口座情報を登録
    if CmnEdit03001AccountCode.AsInteger <> 0 then
    begin
        New (pAccInfoData);

        pAccInfoData^.nNBkCode		    := fnGetNCODE(CmnEdit00001BkCode.asInteger,CmnEdit00002BrCode.AsInteger);
        pAccInfoData^.nAccountCode		:= CmnEdit03001AccountCode.asInteger;
        pAccInfoData^.nDepDivision		:= CmnEdit03002DepDivision.AsInteger;
        pAccInfoData^.strClientCode		:= CmnEdit03009ClientCode.Text;
        pAccInfoData^.strClientName		:= CmnEdit03010ClientName.Text;
        pAccInfoData^.strClientNameKana	:= CmnEdit03011ClientNameKana.Text;


        if	Trim (CmnEdit03003AccountNo.Text) <> '' then
            pAccInfoData^.strAccountNo	:= CmnEdit03003AccountNo.Text
        else
            pAccInfoData^.strAccountNo	:= '';

        if	Trim (CmnEdit03009ClientCode.Text) <> '' then
            pAccInfoData^.strClientCode	:= CmnEdit03009ClientCode.Text
        else
            pAccInfoData^.strClientCode	:= '';

        pAccInfoData^.fDetails	:= TRUE;

        fnUpdateRecordAccount (pAccInfoData);


        Dispose (pAccinfoData);
    end;


	m_cDataModule.Commit (m_cDBSelect);

    fnRebuildTreeViewItems ();

//	fnUpdateTreeViewItemBank (pUpdateRecord);

	Result	:= TRUE;
end;
//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordFeeInfo (pUpdateRecord: Pointer): Boolean;
var
	dqMasterData: TMQuery;
	pRecord		: ^BankInfoData;
	nClass		: Integer;

begin
//↓<MLXHAP>MLX給与の場合は、Trueで抜けます。
	if TMSeries.IsMjsLink3 then
	begin
		Result := True;
		Exit;
	end;
//↑<MLXHAP>

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	pRecord	:= pUpdateRecord;

	with (dqMasterData) do
	begin
		for	nClass := 1 to 3 do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT BankNCode FROM FeeInfo ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BankNCode = :strBankCode AND RecSyubetu = :nClass');

			ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
			ParamByName ('strBankCode'    ).AsFloat 	:= pRecord^.nNCode;
			ParamByName ('nClass'         ).AsInteger	:= nClass;

			if	(not Open ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				dqMasterData.Close ();
				dqMasterData.Free  ();

				Result	:= FALSE;
				Exit;
			end;

			if	(EOF) then
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   (fnMakeSQLConstFeeInfoInsert (pUpdateRecord, nClass));
			end
			else
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   (fnMakeSQLConstFeeInfoUpdate (pUpdateRecord, nClass));
			end;

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				dqMasterData.Close ();
				dqMasterData.Free  ();

				Result  := FALSE;
				Exit;
			end;
		end;
// <094> ADD-STR
        // 11:電子記録債権発生手数料
        Close ();

        SQL.Clear ();
// <096> MOD↓
//        SQL.Add   ('INSERT INTO FeeInfo (MasterKbn, BankNCode, RecSyubetu, Fee11, Fee41, UpdTantoNCode)' +
//                   '    ON EXISTING UPDATE '+
//                   'VALUES (' + IntToStr(MASTER_BANK) +
//                            ', ' + FloatToStr(pRecord^.nNCode) +
//                            ', 11' +                                            // 11:電子記録債権発生手数料
//                            ', ' + FloatToStr(CmnEditFeeValue040103.Value) +    // 他行
//                            ', ' + FloatToStr(CmnEditFeeValue040106.Value) +    // 同行
//                            ', ' + FloatToStr(TantoNCode) + ')');
		SQL.Add   ('INSERT INTO FeeInfo (MasterKbn, BankNCode, RecSyubetu, Fee11, Fee41, UpdTantoNCode, StartDate)' +
				   '    ON EXISTING UPDATE '+
				   'VALUES (' + IntToStr(MASTER_BANK) +
							', ' + FloatToStr(pRecord^.nNCode) +
							', 11' +													// 11:電子記録債権発生手数料
							', ' + FloatToStr(CmnEdit01045Densai2.Value) +				// 他行（コントロール名変更）
							', ' + FloatToStr(CmnEdit01044Densai1.Value) +				// 同行（コントロール名変更）
							', ' + FloatToStr(TantoNCode) +								// 処理者
							', ' + IntToStr(MjsDateCtrl.MjsDateToInt8(CmnEdit01049StartYMD.AsDateTime)) + ')');	// 適用開始日
// <096> MOD↑

        if	(not ExecSQL ()) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close ();
            dqMasterData.Free  ();

            Result  := FALSE;
            Exit;
        end;
// <094> ADD-END
// <096> ADD↓
		if not TMSeries.IsGalileopt then
		begin
			// 12:海外手数料
			Close ();

			SQL.Clear ();
			SQL.Add   ('INSERT INTO FeeInfo (MasterKbn, BankNCode, RecSyubetu, Fee11, Fee41, UpdTantoNCode, StartDate, OverseaFee)' +
					   '    ON EXISTING UPDATE '+
					   'VALUES (' + IntToStr(MASTER_BANK) +
								', ' + FloatToStr(pRecord^.nNCode) +
								', 12' +												// 12:海外手数料
								', ' + FloatToStr(CmnEdit01047Oversea2.Value) +			// 他銀行
								', ' + FloatToStr(CmnEdit01046Oversea1.Value) +			// 関係銀行
								', ' + FloatToStr(TantoNCode) +							// 処理者
								', ' + IntToStr(MjsDateCtrl.MjsDateToInt8(CmnEdit01049StartYMD.AsDateTime)) +	// 適用開始日
								', ' + FloatToStr(CmnEdit01048Oversea3.Value) + ')');	// 海外手数料

			if (not ExecSQL()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				dqMasterData.Close ();
				dqMasterData.Free  ();

				Result := FALSE;
				Exit;
			end;
		end;
// <096> ADD↑
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordBankInfo (pUpdateRecord: Pointer): Boolean;
var
	dqMasterData: TMQuery;
	pRecord		: ^BankInfoData;
    lvInsFlg    :  Boolean;
begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	pRecord	:= pUpdateRecord;
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM BankInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RdelKbn = 0 ');
        SQL.Add   (' AND   AllBkCode = :nBkCode AND AllBraCode = :nBrCode');

		ParamByName ('nMasterDivision').AsInteger := MASTER_BANK;
		ParamByName ('nBkCode'    ).AsInteger	  := pRecord^.nBkCode;
		ParamByName ('nBrCode'    ).AsInteger	  := pRecord^.nBrCode;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		if	(EOF) then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstBankInfoInsert (pUpdateRecord));
            lvInsFlg := True;
		end
		else
		begin
            pRecord^.nNCode := FieldByName('NCODE').asFloat;
			Close ();
			SQL.Clear ();
			SQL.Add   (fnMakeSQLConstBankInfoUpdate (pUpdateRecord));
            lvInsFlg := False;
		end;
// <088> ADD-STR
        // 詳細画面表示時は以下も更新
        if	(CmnPanelClientDetail.Visible) then
        begin
    		ParamByName ('wTegLayPath'  ).AsString := CmnEdit02001LayoutPathDraft.text;
	    	ParamByName ('wKogLayPath'  ).AsString := CmnEdit02003LayoutPathCheck.text;
		    ParamByName ('wBillLayPath1').AsString := CmnEdit02005LayoutPathCheck.text;
		    ParamByName ('wBillLayPath2').AsString := CmnEdit02006LayoutPathCheck.text;
		    ParamByName ('wBillLayPath3').AsString := CmnEdit02007LayoutPathCheck.text;
		    ParamByName ('wBillLayPath4').AsString := CmnEdit02009LayoutPathCheck.text;
// <096> ADD↓
			// レイアウト／送金情報タブ－外国送金情報はGaliNX-Iのみ表示
			if not TMSeries.IsMjsLink3 and
			   not TMSeries.IsGalileopt then
			begin
				ParamByName ('wSoukinClientCode' ).AsString	 := CmnEdit02010SoukinClientCode.Text;		// 送金依頼人ｺｰﾄﾞ
				ParamByName ('wSoukinClientName' ).AsString  := fnDelCRLF(CmnEdit02011SoukinClientNameKana.Text);	// 送金依頼人名称(ｶﾅ)
				ParamByName ('wSoukinFBCodeMode' ).AsInteger := CmnEdit02012SoukinCodeMode.asInteger;	// 半角ｺｰﾄﾞ体系
				ParamByName ('wSoukinRecordPause').AsInteger := CmnEdit02013SoukinRecordPause.asInteger;// ﾚｺｰﾄﾞ区切
				ParamByName ('wSoukinFileName'   ).AsString  := CmnEdit02014SoukinFileName.Text;		// ﾌｧｲﾙ名称(ParamByNameでセットするため、StringReplaceで「\」→「\\」にする処理は不要)
			end;
// <096> ADD↑
        end;
// <088> ADD-END
		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result  := FALSE;
			Exit;
		end;
        if lvInsFlg then //新規の時はNCODEを取得する
        begin
            Close;
            Sql.Clear;
            Sql.Clear;
            Sql.Add(' select @@identity NCODE from BankInfo');
            Open;
            if Not Eof then
                pRecord^.nNCode := FieldByName('NCODE').asFloat;
        end;

	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																	// 正常終了
end;



//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008002f.fnUpdateRecordMFusenInfo (nBkCode: Integer; var nTagKind: Integer): Boolean;
//var
//	dqMasterData: TMQuery;

begin
    Result	:= TRUE;    ///<044>
    
{	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND HojyoCode = :strBankCode');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strBankCode'    ).AsInteger	:= nBkCode;

		Open ();

		if  (not EOF) then
		begin
			if	((nTagKind = 0) or (FieldByName ('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind	:= 0;

				Close ();

				SQL.Clear ();
				SQL.Add   ('DELETE FROM MFusenInfo WHERE MasterKbn = :nMasterDivision AND HojyoCode = :strBankCode');
			end
			else
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('UPDATE MFusenInfo SET FusenKbn = :nTagDivision, FusenCmnt = '''' ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND HojyoCode = :strBankCode');

				ParamByName ('nTagDivision').AsInteger	:= nTagKind;
			end;

			ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
			ParamByName ('strBankCode'    ).AsInteger	:= nBkCode;

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				fnOutputDBErrorMessage ();

				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
				dqMasterData .Close	   ();
				dqMasterData .Free     ();

				Result	:= FALSE;
				Exit;
			end;

			m_cDataModule.Commit (m_cDBSelect);											// ｺﾐｯﾄ(反映)

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= TRUE;
			Exit;
		end;

		Close ();
	end;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();;
		SQL.Add   ('INSERT INTO MFusenInfo (MasterKbn, KmkCode, Subcode, HojyoCode, FusenKbn, FusenCmnt) ');
		SQL.Add   ('VALUES (:nMasterDivision, 0, 0, :strBankCode, :nTagDivision, '''')');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('strBankCode'    ).AsInteger	:= nBkCode;
		ParamByName ('nTagDivision'   ).AsInteger	:= nTagKind;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterData .Close    ();
			dqMasterData .Free	   ();

			Result	:= FALSE;
			Exit;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterData .Close  ();
	dqMasterData .Free   ();

	Result	:= TRUE;
}
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnUpdateRecordMemDataHojyoMA (nBkCode: Integer; nTagKind: Integer);
var
	nRetRecNo: Integer;
//	strFormat: String;

begin

	nRetRecNo	:= CmnMemDataHojyoMA.GetRecNoByFieldValue (nBkCode, 'nBkCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			CmnMemDataHojyoMA.First ()
		else if	(nRetRecNo = CmnMemDataHojyoMA.RecordCount) then
			CmnMemDataHojyoMA.Last ()
		else
			CmnMemDataHojyoMA.RecNo	:= nRetRecNo;

		CmnMemDataHojyoMA.Edit ();
		CmnMemDataHojyoMA.FieldByName ('grTag').Assign (fnGetBitmapSelectedTag (nTagKind));

		if	(nTagKind = 0) then
			CmnMemDataHojyoMA.FieldByName ('strComment').AsString	:= '';

		CmnMemDataHojyoMA.Post ();
	end;
end;



//***********************************************************************************************************/
//    ツリーをセット
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnUpdateTreeViewItemBank (pUpdateRecord: Pointer);
var
	cNode		: TTreeNode;
	pItemRec	: ^TreeViewRec;
	pItemNew	: ^TreeViewRec;
	pBankInfoData: ^BankInfoData;

begin
	pBankInfoData	:= pUpdateRecord;

	if	(CmnTreeView.Items.Count > 0) then
		cNode	:= CmnTreeView.Items [0]
	else
		cNode	:= nil;

	while (TRUE) do
	begin
		if	(cNode = nil) then
			Break;

		pItemRec	:= cNode.Data;

		if	(CompareStr (IntToStr(pItemRec^.nBkCode), IntToStr(pBankInfoData^.nBkCode)) = 0) then
		begin
			pItemRec^.strDescription	:= pBankInfoData^.strBKNAME;
			cNode    .Text				:= pBankInfoData^.strBrName;

			Exit;																		// 以下, 未処理
		end;

		cNode	:= cNode.GetNextSibling ();
	end;

	New (pItemNew);

	pItemNew^.nItemDivision		:=  1;
    pItemNew^.nBkCode		    := pBankInfoData^.nBkCode;
	pItemNew^.strDescription	:= pBankInfoData^.strBkName;

	if	(CmnTreeView.Items.Count > 0) then
		cNode	:= CmnTreeView.Items [0]
	else
		cNode	:= nil;

	while (TRUE) do
	begin
		if	(cNode = nil) then
			Break;

		pItemRec	:= cNode.Data;

		if	(CompareStr (IntToStr(pItemRec^.nBkCode), IntToStr(pBankInfoData^.nBkCode)) > 0) then
		begin
			cNode	:= CmnTreeView.Items.InsertObject (cNode, pItemNew^.strDescription, pItemNew);

			cNode.ImageIndex	:= 0;
			cNode.SelectedIndex	:= cNode.ImageIndex + 3;

			Exit;																		// 以下, 未処理
		end;

		cNode	:= cNode.GetNextSibling ();
	end;

	cNode	:= CmnTreeView.Items.AddChildObject (nil, pItemNew^.strDescription, pItemNew);

	cNode.ImageIndex	:= 0;
	cNode.SelectedIndex	:= cNode.ImageIndex + 3;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnReportAccountDBTextHojCodeOnPrint (Sender: TObject);
var
	nPosition: Integer;

begin
	nPosition	:= StrToInt (Copy (TppDBText (Sender).Name, 30, 2));

	if	(CmnMemDataPrintAccount.FieldByName (Format ('nCodeAttribute%.2d', [nPosition])).AsInteger <= 1) then
		TppDBText (Sender).Alignment	:= taRightJustify
	else
		TppDBText (Sender).Alignment	:= taLeftJustify;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnPopupMenuDummyOnPopup (Sender: TObject);
begin
	Abort ();
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnReportBeforePrint (Sender: TObject);
begin
	m_cPrnSupport.BeforePrint (Sender);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnReportDetailBandBeforeGenerate (Sender: TObject);
var
	cUnderLine: TppLine;

begin
	if	(TppDetailBand (Sender).Name = CmnDetailBandStandard.Name) then
		cUnderLine	:= CmnLineReportStandardDetailBand
	else if	(TppDetailBand (Sender).Name = CmnDetailBandDetail.Name) then
		cUnderLine	:= CmnLineReportDetailDetailBand
	else if	(TppDetailBand (Sender).Name = CmnDetailBandAccount.Name) then
		cUnderLine	:= CmnLineReportAccountDetailBand
	else
		Exit;

	if	(TppDetailBand (Sender).LastRecord or TppDetailBand (Sender).PageOutOfSpace) then
	begin
		if	(not TppDetailBand (Sender).OverFlow) then
			TppDetailBand (Sender).OverFlow	:= TRUE;

		if	(not cUnderLine.ReprintOnOverFlow) then
			cUnderLine.ReprintOnOverFlow	:= TRUE;

		cUnderLine.Weight	:= 0.75;
	end
	else
	begin
		if	(TppDetailBand (Sender).Name = CmnDetailBandDetail.Name) then
			cUnderLine.Weight	:= 0.75
		else
			cUnderLine.Weight	:= 0.25;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnEditListDispOnChange (Sender: TObject);
begin
	fnCmnFunctionOnChange (Sender);

	if	(not TMNumEdit (Sender).ListDisp) then
		Exit;

	CmnButtonPagePrevious.TabStop	:= FALSE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnButtonPageOnEnter (Sender: TObject);
begin
	CmnButtonPagePrevious.TabStop	:= TRUE;

	fnCmnFunctionOnEnter (Sender);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP008002f.fnCmnGridAccInfoOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_UP) or (Key = VK_PRIOR)) then										// ↑or PageUp
	begin
		if	(TdxDBGrid (Sender).DataSource.DataSet.RecNo = 1) then
		begin
			Beep ();

			Key	:= 0;
		end
		else if	((TdxDBGrid (Sender).DataSource.DataSet.State in [dsInsert]) and
				  TdxDBGrid (Sender).DataSource.DataSet.FieldByName ('nAccountCode').IsNull) then
			TdxDBGrid (Sender).DataSource.DataSet.Cancel ();
	end;

	if	(((Key = VK_TAB ) and (Shift = [ssShift])) or
		 ((Key = VK_LEFT) and (TdxDBGrid (Sender).State <> tsEditing))) then
	begin
		if	((TdxDBGrid (Sender).FocusedColumn = 0) and (TdxDBGrid (Sender).DataSource.DataSet.RecNo = 1)) then
		begin
			Beep ();

			Key	:= 0;
			Exit;
		end;
	end;

end;

//--- <#2> St -----
//**********************************************************************
//*		Proccess	:	排他制御処理
//*		Name		:	H.Endo
//*		Date		:	2003/06/30
//*		Parameter	:	なし
//*		Return		:	他で使われていない(0)/使われている(99)
//*		History		:
//**********************************************************************
function TJNTCRP008002f.fnExcept():Integer;
var
///	iRet	:	Integer;
	bFlg	:	Boolean;
begin
	bFlg	  := False;
	result    := 0;
	m_cExcept := nil;

	try
//		m_cExcept := TJNTMASExceptIF.Init(m_pRec);
		// 銀行関係ﾏｽﾀの排他ﾁｪｯｸ
///		iRet := m_cExcept.SetExcept(521);
		m_cExcept.SetExcept(521);
{		if iRet <> EXCEPT_RET_OK then
		begin
			MjsMessageBoxEx(Self,'銀行マスタの排他制御でエラーが発生しました。','排他制御',mjError,mjOK,mjDefOK);
			bFlg   := True;
			result := -1;
			exit;
		end;
}		// 他で更新処理が流れていないかﾁｪｯｸ
		if (m_cExcept.Status100 = 1) or (m_cExcept.Status400 = 1) then
		begin
			bFlg   := True;
			result := 99;
			exit;
		end;

	finally
		// m_cExceptがnilではなく、他で更新処理が行われている時
		if (m_cExcept <> nil) and (bFlg = True) then
		begin
			m_cExcept.ResetTerm;
			m_cExcept.Free;
			m_cExcept := nil;
		end;
	end;
end;
//--- <#2> Ed -----

//--- <#4> St -----
//**********************************************************************
//*		Proccess	:	拡大率を掛けた値を取得
//*		Name		:	H.Endo(MJS)
//*		Date		:	2005/01/17
//*		Parameter	:	Int		:	拡大率をかける元の値
//*		Return		:	拡大率を掛けた値
//**********************************************************************
function TJNTCRP008002f.fnGetZoom(Int: Integer): Integer;
begin
	Result := Trunc(Int*m_ZoomRatio/100);
end;
//**********************************************************************
//*		Proccess	:	内部コードを取得（BankInfo）
//*		Name		:
//*		Date		:	2005/03/31
//*		Parameter	:	銀行コード、支店コード　Int		:
//*		Return		:
//**********************************************************************
Function TJNTCRP008002f.fnGetNCODE(pBkCODE,pBrCODE:Integer) : Extended;
var
    Qry : TMQuery;
begin

    Result := 0;

	Qry	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

	with (Qry) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCODE FROM BankInfo ');
        SQL.Add   ('WHERE MasterKbn = :nMasterDivision AND RdelKbn = 0');
        SQL.Add   ('  And AllBkCode = :nBKCode AND AllBraCode = :nBrCODE');

		ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
		ParamByName ('nBkCode').AsInteger	:= pBkCode;
		ParamByName ('nBrCode').AsInteger	:= pBrCode;

		Open ();

		if	(not EOF) then
            Result := FieldByName('NCODE').asfloat;
	end;

	Qry.Close ();
	Qry.Free  ();

end;
//***********************************************************************************************************/
//   仕訳情報の各項目外部コードよりの内部コードを求める（AccInfoテーブルへのUpdate、Insert用）
//***********************************************************************************************************/
function  TJNTCRP008002f.fnGetNcode_Master(pCODE:String;pMasterKbn,pAttr:Integer):String;
var
    Qry : TMQuery;
    lvCODE : String;
begin

    Result := '0';

    //コード属性・桁数を考慮した外部コードを求める
    lvCODE :=  fnGetDspData(pCODE,pAttr);

    Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
	with (Qry) do
	begin
		Close ();
		SQL.Clear ();
        if pMasterKbn = MASTER_SUBJECT then //科目
        begin
            SQL.Add   ('SELECT NCODE FROM KmkMa ');
            SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('pCode').AsInteger	:= CmnEdit03014KmkCode.asInteger;
        end
        else if pMasterKbn = MASTER_SUBJECTPLUS then //科目別補助
        begin
            SQL.Add   ('SELECT CNCODE NCODE FROM KmkMa ');
            SQL.Add   ('WHERE  MasterKbn = 2 AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode and SubCode = :pSCODE');
			ParamByName ('pCode').AsInteger	:= CmnEdit03014KmkCode.asInteger;
			ParamByName ('pSCode').AsString	:= lvCODE;
        end
        else if pMasterKbn = MASTER_SECTION then //部門
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
// <063> ADD start
            SQL.Add   ('ORDER BY GCode, TStartDate desc, InsDateTM desc');
// <063> ADD end
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKBN;
			ParamByName ('pCode').AsString 	        := lvCODE;
        end
        else if pMasterKbn = MASTER_SEGMENT01 then //セグメント
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsString 	:= lvCODE;
        end

(* <012>
        else if pMasterKbn = MASTER_CONSTRUCT then //ﾌﾟﾛｼﾞｪｸﾄ
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsString 	:= lvCODE;
        end
*)
        else if pMasterKbn = MASTER_BANK then //銀行
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
			ParamByName ('pCode').AsString 	:= lvCODE;
        end
        else if pMasterKbn = MASTER_CUSTOMER then //取引先
        begin
            SQL.Add   ('SELECT NCODE FROM MTOKUI ');
// <086> MOD-STR
//          SQL.Add   ('WHERE   SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
            SQL.Add   ('WHERE   SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode AND TemplateKbn <> 1');
// <086> MOD-END
			ParamByName ('pCode').AsString 	:= lvCODE;
        end
        else if pMasterKbn = MASTER_STAFF then //社員
        begin
// <107> MOD-STR
//            SQL.Add   ('SELECT CorpNCode NCODE FROM HapSC ');
            SQL.Add   ('SELECT NCode FROM HapSC ');
// <107> MOD-END
            SQL.Add   ('WHERE  SumKbn = 0 AND  GCode = :pCode');
			ParamByName ('pCode').AsString 	:= lvCODE;
        end
        else if (pMasterKbn >= MASTER_GENERAL01) and  (pMasterKbn <= MASTER_GENERAL05) then //汎用補助
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsString 	:= lvCODE;
        end
        //<012> Add
        else
        begin
            SQL.Add   ('SELECT NCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RdelKbn = 0 AND GCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsString 	:= lvCODE;
        end;

		Open ();

		if	(not EOF) then
            Result := FloatToStr(FieldByName ('NCODE').AsFloat);
	end;

	Qry.Close ();
	Qry.Free  ();


end;
//***********************************************************************************************************/
//   仕訳情報の各項目内部コードよりの外部コードを求める（Tableデータより画面表示用）
//***********************************************************************************************************/
function  TJNTCRP008002f.fnGetGcode_Master(pCODE:Extended;pMasterKbn,pAttr:Integer):String;
var
    Qry : TMQuery;
//    lvSQL : String;
begin

    if	pAttr <= 1 then
        Result := '0'
    else
        Result := '';

    Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
	with (Qry) do
	begin
		Close ();
		SQL.Clear ();
        if pMasterKbn = MASTER_SUBJECT then //科目
        begin
            SQL.Add   ('SELECT GCODE FROM KmkMa ');
            SQL.Add   ('WHERE  MasterKbn = 1 AND NCode = :pCode');
			ParamByName ('pCode').AsFloat	:= pCODE;
        end
        else if pMasterKbn = MASTER_SUBJECTPLUS then //科目別補助
        begin
            SQL.Add   ('SELECT SUBCODE GCODE  FROM KmkMa ');
            SQL.Add   ('WHERE  MasterKbn = 2 AND NCode = :pCode and CNCode = :pSCODE');
			ParamByName ('pCode').AsFloat 	:= StrToFloat(fnGetNcode_Master(IntToStr(CmnEdit03014KmkCode.asInteger),MASTER_SUBJECT,1));
			ParamByName ('pSCode').AsFloat  := pCODE;
        end
        else if pMasterKbn = MASTER_SECTION then //部門
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision  AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKBN;
			ParamByName ('pCode').AsFloat    	        := pCODE;
        end
        else if pMasterKbn = MASTER_SEGMENT01 then //セグメント
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end

(* <012>
        else if pMasterKbn = MASTER_CONSTRUCT then //ﾌﾟﾛｼﾞｪｸﾄ
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end
*)
        else if pMasterKbn = MASTER_BANK then //銀行
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= MASTER_BANK;
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end
        else if pMasterKbn = MASTER_CUSTOMER then //取引先
        begin
            SQL.Add   ('SELECT GCODE FROM MTOKUI ');
// <086> MOD-STR
//          SQL.Add   ('WHERE  NCode = :pCode');
            SQL.Add   ('WHERE  NCode = :pCode AND RdelKbn = 0 AND TemplateKbn <> 1');
// <086> MOD-END
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end
        else if pMasterKbn = MASTER_STAFF then //社員
        begin
            SQL.Add   ('SELECT GCODE FROM HapSC ');
// <107> MOD-STR
//            SQL.Add   ('WHERE  CorpNCode = :pCode');
            SQL.Add   ('WHERE  NCode = :pCode');
// <107> MOD-END
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end
        else if (pMasterKbn >= MASTER_GENERAL01) and  (pMasterKbn <= MASTER_GENERAL05) then //汎用補助
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end
        //<012> Add
        else
        begin
            SQL.Add   ('SELECT GCODE FROM HojyoMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :pCode');
			ParamByName ('nMasterDivision').AsInteger	:= pMasterKbn;
			ParamByName ('pCode').AsFloat 	:= pCODE;
        end;

		Open ();

		if	(not EOF) then
            Result := FieldByName ('GCODE').AsString;
	end;

	Qry.Close ();
	Qry.Free  ();


end;
//**********************************************************************
//*		Proccess	:	全銀協データをセット
//*		Name		:
//*		Date		:	2005/03/31
//*		Parameter	:	pKBN,pBKCode,pBrCode(pKBN=ｸﾞﾘｯﾄﾞorｶｰﾄﾞ):
//*		Return		:
//**********************************************************************
{↓<DIC_BANK>銀行辞書Exp対応にて作り変え。
Procedure TJNTCRP008002f.fnZenGinDataSet(pKBN,pBKCode,pBrCode:Integer);
var
    Qry : TMQuery;
begin

	Qry	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBCommon, Qry);							// DBとMQueryの接続

	with (Qry) do
	begin
		Close ();

		SQL.Clear ();
    	SQL.Add   ('SELECT bk.BankName,bk.KanaBankName,br.BankOffice,br.KanaBankOffice ');
        SQL.Add   ('  FROM CMN_BANK_OFFICE br');
    	SQL.Add   (' LEFT OUTER JOIN CMN_BANK bk ON  bk.BANKCD = br.BankCD ');
        SQL.Add   ('WHERE br.BankCD = :nBKCD and br.BankOfficeCD = :nBRCD');

		ParamByName ('nBkCd').AsInteger	:= pBkCode;
		ParamByName ('nBrCd').AsInteger	:= pBrCode;

		Open ();

		if	(not EOF) then
        begin
            if pKBN = 1 then
            begin
                CmnEdit00003BkName .Text   := FieldByName ('BankName').AsString;
                CmnEdit00004BkKana .Text   := FieldByName ('KanaBankName').AsString;
                CmnEdit00005BrName .Text   := FieldByName ('BankOffice').AsString;
                CmnEdit00006BrKana .Text   := FieldByName ('KanaBankOffice').AsString;
            end
            else
            begin
                CmnMemDataHojyoMA.FieldByName ('strBKName').AsString := FieldByName ('BankName').AsString;
                CmnMemDataHojyoMA.FieldByName ('strBKKana').AsString := FieldByName ('KanaBankName').AsString;
                CmnMemDataHojyoMA.FieldByName ('strBRName').AsString := FieldByName ('BankOffice').AsString;
                CmnMemDataHojyoMA.FieldByName ('strBRKana').AsString := FieldByName ('KanaBankOffice').AsString;
            end;
        end;
	end;

	Qry.Close ();
	Qry.Free  ();

end;
↑<DIC_BANK>}
//↓<DIC_BANK>銀行辞書Exp対応にて作り変え。CMN_BANK,CMN_BANK_OFFICEはみない。
Procedure TJNTCRP008002f.fnZenGinDataSet(pKBN,pBKCode,pBrCode:Integer);
var
	iRtn		:	integer;
	sBankName	:	string;
	sBankKana	:	string;
	sOfficeName	:	string;
	sOfficeKana	:	string;
begin

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit(m_pRec, P_BANKDIC_MASTERCHECK) ;					 //初期化です
	fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK) ;					 //初期化です<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	try
		try
			//検索ｴｸｽﾌﾟﾛｰﾗを表示します
			{内部処理
			 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
			 と店舗を入力することで絞込みが可能です
			 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
			}
			iRtn:=fnCMNBankShow(	pBKCode,
									pBrCode,
									sBankName,
									sOfficeName,
									sBankKana,
									sOfficeKana		);

			//呼出失敗
			if(iRtn=-1)then
				Abort;

			//選択せず終了
			if(iRtn<>1)then
				Exit;
		except
			raise Exception.Create('全銀検索Exp呼出に失敗しました');
		end;
	finally
		fnCMNBankFree ;							 //開放します
		m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す
	end;

	if pKBN = 1 then
	begin
		CmnEdit00003BkName .Text   := sBankName;
		CmnEdit00004BkKana .Text   := sBankKana;
		CmnEdit00005BrName .Text   := sOfficeName;
		CmnEdit00006BrKana .Text   := sOfficeKana;
	end
	else
	begin
		if CmnMemDataHojyoMA.FieldByName ('strBKName').AsString = '' then		//<102>
			CmnMemDataHojyoMA.FieldByName ('strBKName').AsString := sBankName;
		if CmnMemDataHojyoMA.FieldByName ('strBKKana').AsString = '' then		//<102>
			CmnMemDataHojyoMA.FieldByName ('strBKKana').AsString := sBankKana;
		if CmnMemDataHojyoMA.FieldByName ('strBRName').AsString = '' then		//<102>
			CmnMemDataHojyoMA.FieldByName ('strBRName').AsString := sOfficeName;
		if CmnMemDataHojyoMA.FieldByName ('strBRKana').AsString = '' then		//<102>
			CmnMemDataHojyoMA.FieldByName ('strBRKana').AsString := sOfficeKana;
	end;
end;
//↑<DIC_BANK>

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
function TJNTCRP008002f.fnGetDspData(sCode: String;pAttr:Integer): String;
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
        if pAttr = 2 then
        begin
            if Length(sCode) > lvDigit then
                Result := Copy(sCode, 1, lvDigit)
            else
                Result := sCode;

            Exit;
        end;

        //数値属性なら
        if (pAttr = 0) or (pAttr = 1) then
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
//**********************************************************************
//*		Proccess	:	休日一括登録ダイアログを表示
//*		Name		:
//*		Date		:	2005/03/31
//*		Parameter	:	:
//*		Return		:
//**********************************************************************
Procedure TJNTCRP008002f.fnKyujituDialogCreate(Sender: TObject);    //<006>
var
	cDialogFee: TJNTCRP008002_5f;
//    lvNCODE    : Extended;
//    lvRet : Integer;
begin

    fnCmnMemDataHojyoMABeforePost(CmnMemDataHojyoMA);

//<007>	cDialogFee	:= TJNTCRP008002_5f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect, @_StandardFee,CmnMemDataHojyoMAnBKCODE.asInteger);
    cDialogFee	:= TJNTCRP008002_5f.fnCreateDialog  //<007>
                (
                Pointer (m_Base_pRec), Self,
                m_cDBSelect,
                @_StandardFee,
                CmnMemDataHojyoMAnBKCODE.AsInteger
                );

  	if cDialogFee.ShowModal = mrOK then
    begin
    	cDialogFee.Close ();
    	cDialogFee.Free  ();

        fnRebuildGridBankInfo;
        Exit;
    end;
    cDialogFee.Close ();
    cDialogFee.Free  ();

end;
procedure TJNTCRP008002f.CmnMemDataHojyoMAAfterPost(DataSet: TDataSet);
begin

    CmnMemDataHojyoMA.Refresh;

end;
procedure TJNTCRP008002f.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin

//    if FuncNO = 1 then
//        fnKyujituDialogCreate;

    // <002>
    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
    begin
        case FuncNo of
            1:  uvFncInfo.Action[FuncNo-1].Execute;
            8:  Keybd_Event(VK_F8, 0, 0, 0);
        end;
    end;


end;
(*
//-----------------------------------------------------------------------------
// <100>fnSetFncType
//-----------------------------------------------------------------------------
procedure TJNTCRP008002f.fnSetFncType(pKBN:Integer);
begin
    if pKBN = 1 then
        // ｸﾘｱ
        uvFncInfo.Caption[0] := 'F1 休日一括登録'
    else
        // ｸﾘｱ
        uvFncInfo.Caption[0] := '';
    uvFncInfo.Caption[1] := '';
    uvFncInfo.Caption[2] := '';
    uvFncInfo.Caption[3] := '';
    uvFncInfo.Caption[4] := '';
    uvFncInfo.Caption[5] := '';
    uvFncInfo.Caption[6] := '';
    uvFncInfo.Caption[7] := '';

end;
*)
//-----------------------------------------------------------------------------
// fnSetFncType()
//      PARAM   : nDspType  :   表示識別子
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｧﾝｸｼｮﾝｷｰ/ｲﾍﾞﾝﾄの設定
//-----------------------------------------------------------------------------
procedure TJNTCRP008002f.fnSetFncType(nDspType: Boolean ;ifuncNo : Integer);
var
	stMessageRec : TMJSMsgRec;
begin

    case iFuncNo of
        0:  //[F1 ]
        begin
            if ( nDspType = False ) then
            begin
                uvFncInfo.Caption[iFuncNo] := '';
                uvFncInfo.Action [iFuncNo] := nil;
            end
            else
            begin
                uvFncInfo.Caption[iFuncNo] := 'F1 休日一括登録';
                uvFncInfo.Action [iFuncNo] := KyujituDialog;
            end;
        end;
        7:  //[F8 ]
        begin
            if ( nDspType = False ) then
            begin
                uvFncInfo.Caption[iFuncNo] := '';
                uvFncInfo.Action [iFuncNo] := nil;
            end
            else
            begin
                m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);
                uvFncInfo.Caption[iFuncNo] := stMessageRec.sMsg;
                uvFncInfo.Action [iFuncNo] := nil;
            end;
        end;
        else
        begin
            uvFncInfo.Caption[iFuncNo] := '';
            uvFncInfo.Action [iFuncNo]  := nil;
        end;
    end;

    MSPFunctionBar.CopyFuncData(uvFncInfo.Caption);
end;


//-----------------------------------------------------------------------------
// fnSetFieldDescAccountCode()
//      PARAM   : nScreenID     Integer 指示識別番号
//                nFieldID      Integer ﾌｨｰﾙﾄﾞ識別番号
//      VAR     :
//      RETURN  : Boolean
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP008002f.fnSetFieldDescAccountCode(dqMasterData:TMQuery): Boolean;
var
	lvBKNM,lvAccNM  :   String;
	fReturn		    :   Boolean;
    lvNCode         :   Extended;

begin

///	fReturn :=  FALSE;

    CmnLabel02008ChaDivisionCheckDesc.Caption	:= '';
    uvAccCode := 0;		// 051122 広田　会計評価対応（入金口座が勝手に登録される対応）

	if (CmnEdit02008ChaDivisionCheck.Text = '' ) then
		fReturn	:= TRUE
	else
	begin
///        lvNCode := 0;
        lvNCode := fnGetNCODE(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);

        lvBkNM	:= '';
        lvAccNM	:= '';
		CmnLabel02008ChaDivisionCheckDesc.Caption := '';
        uvAccCode := 0;

        with dqMasterData do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ai.AccKbn, ai.AccNo,ai.Ncode, bk.SimpleName  '
                +   'FROM   AccInfo ai, BankInfo bk              '
                +   'WHERE bk.RDelKbn   = 0                     '
                +   '  AND bk.NCode = ai.BankNCode          '
                +   '  AND ai.BankNCode = :pBankNCode  '
                +   '  AND ai.RDelKbn   = 0                     '
                +   '  AND ai.GCode     = :nAccountCode         ');

            ParamByName ('nAccountCode').AsInteger	:= CmnEdit02008ChaDivisionCheck.asInteger;
            ParamByName ('pBankNCode').AsFloat	    :=lvNCode;
            Open;

            if	( EOF ) then
            begin
                Close ();

                Result	:= FALSE;
                Exit;
            end;

            lvBkNM	:= FieldByName ('SimpleName').AsString;				// 銀行名称(簡略)

            // 預金種別
            case FieldByName ('AccKbn'    ).AsInteger of
                1: lvAccNM := '普通';
                2: lvAccNM := '当座';
                4: lvAccNM := '貯蓄';
                9: lvAccNM := 'その他';
            end;

            CmnLabel02008ChaDivisionCheckDesc.Caption
                 := lvBkNM + '  預金種目：' + lvAccNM + '  口座番号：' + FieldByName ('AccNo').AsString;

            uvAccCode := FieldByName ('NCode').AsFloat;
            fReturn	:= TRUE;
            Close ();
        end;

	end;


	Result := fReturn;

end;
procedure TJNTCRP008002f.fnAllowClick(Sender: TObject);
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    CompName:   String;         //
//    i : Integer;

    lvNCode     : Extended;     // <011>
    strWherePhase   :   String;

    nPrjNCode   : Extended;     // <044>
    iPartKbn    : Integer;      // <044>
    strHojCode  : String;       // <044>

begin

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);              //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;         //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;   //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    if (CompName = 'CmnEdit03014KmkCode') then  //科目
    begin
        lvExpSend.MasterKbn     :=  1;          //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;          //モジュール区分
        lvExpSend.PatternNo     :=  1;          //マスタ区分＝
        lvExpSend.TableName     :=  'KmkMA';    //

        lvExpSend.WhereStr      :=  'MasterKbn = 1 AND SumKbn = 0 AND RdelKbn = 0 AND SubCode   = 0 AND '
//<085> -Del                        + 'AnalyzeCode >= 2 AND AnalyzeCode <= 9 and InputKbn <> 9';
// <093> MOD-STR
//                                  + '(AnalyzeCode >= 2 AND AnalyzeCode <= 9 OR AnalyzeCode = 38) AND InputKbn <> 9';	//<085> -Add
                                    + '(AnalyzeCode >= 2 AND AnalyzeCode <= 9 OR AnalyzeCode = 38' + m_sAddCharCode + ') AND InputKbn <> 9';
// <093> MOD-END
// <032>↓資金複合を除く
        lvExpSend.WhereStr      :=  lvExpSend.WhereStr
                                    + ' AND NCode NOT IN (SELECT NCode FROM KmkInfo WHERE SpeCode = 10302)';
// <032>↑

//<011>        lvExpSend.TBarNM        :=  CmnLabel03014KmkCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03014KmkCode.Caption;

    end
    else if (CompName = 'CmnEdit03015KmsCodeFree')
            or  (CompName = 'CmnEdit03015KmsCodeNumeric') then//科目別補助
    begin
        lvExpSend.MasterKbn     :=  2;          //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;          //モジュール区分
        lvExpSend.PatternNo     :=  1;          //マスタ区分＝

        lvNCode := StrToFloat(fnGetNcode_Master(IntToStr(CmnEdit03014KmkCode.asInteger),MASTER_SUBJECT,0));
        lvExpSend.KmkNCode      := lvNCode;                                                 //<011> 科目別補助の時は必須？
        lvExpSend.TableName     :=  'KmkMA';
//<011>        lvExpSend.TBarNM        :=  CmnLabel03018HojCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ';
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03018HojCode.Caption;
//<011>        lvExpSend.WhereStr      :=  'SumKbn = 0 AND RdelKbn = 0 AND GCode = '+ CmnEdit03014KmkCode.text;
        lvExpSend.WhereStr      :=  'SumKbn = 0 AND RdelKbn = 0 AND SubCode <> ''0'' ' ;        //<011>

    end
    else if (CompName = 'CmnEdit03018HojCodeFree') //補助1
            or  (CompName = 'CmnEdit03018HojCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  m_arCodeAttribute [3].nMasterDivision;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝

//<011>        lvExpSend.TableName     :=  'HojyoMA';           //
//<011>        lvExpSend.TBarNM        :=  CmnLabel03018HojCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03018HojCode.Caption;
//<011>        lvExpSend.WhereStr      :=  'SumKbn = 0 AND RdelKbn = 0 and MasterKbn = ' + IntToStr(m_arCodeAttribute [3].nMasterDivision);
        if m_arCodeAttribute [3].nMasterDivision = MASTER_CUSTOMER then
            lvExpSend.WhereStr      :=  'MTOKUI.SumKbn = 0 AND MTOKUI.RdelKbn = 0 AND MTOKUI.TemplateKbn <> 1'   //<022>
// <107> ADD-STR
        else if m_arCodeAttribute [3].nMasterDivision = MASTER_STAFF then
            lvExpSend.WhereStr      :=  'MOS_OFFICE_STAFF.RdelKbn = 0'
// <107> ADD-END
        else
            lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.MasterKbn = '
                                    + IntToStr(m_arCodeAttribute [3].nMasterDivision);

    end
    else if (CompName = 'CmnEdit03019HojCodeFree') //補助2
            or  (CompName = 'CmnEdit03019HojCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  m_arCodeAttribute [4].nMasterDivision;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝

//<011>        lvExpSend.TableName     :=  'HojyoMA';           //
//<011>        lvExpSend.TBarNM        :=  CmnLabel03018HojCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03018HojCode.Caption;
//<011>        lvExpSend.WhereStr      :=  'SumKbn = 0 AND RdelKbn = 0 and MasterKbn = ' + IntToStr(m_arCodeAttribute [4].nMasterDivision);

        if m_arCodeAttribute [4].nMasterDivision = MASTER_CUSTOMER then
            lvExpSend.WhereStr      :=  'MTOKUI.SumKbn = 0 AND MTOKUI.RdelKbn = 0 AND MTOKUI.TemplateKbn <> 1'   //<022>
// <107> ADD-STR
        else if m_arCodeAttribute [4].nMasterDivision = MASTER_STAFF then
            lvExpSend.WhereStr      :=  'MOS_OFFICE_STAFF.RdelKbn = 0'
// <107> ADD-END
        else
            lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.MasterKbn = '
                                    + IntToStr(m_arCodeAttribute [4].nMasterDivision);

    end
    else if (CompName = 'CmnEdit03016BumCodeFree') or //部門
            (CompName = 'CmnEdit03016BumCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  41;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝

        lvExpSend.TableName     :=  'HojyoMA';           //

//<011>        lvExpSend.TBarNM        :=  CmnLabel03016BumCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03014KmkCode.Caption;
//<042>        lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn = 41'
        lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn = 41 and HojyoKbn2 in (1,2)'; // <042>
// <063> ADD start
												// 外部ｺｰﾄﾞの昇順かつ最新の部門順
		lvExpSend.SortStr		:= ' ORDER BY GCode, TStartDate desc, InsDateTM desc';
// <063> ADD end
    end
    else if (CompName = 'CmnEdit03020PrjCodeFree') //ﾌﾟﾛｼﾞｪｸﾄ
            or  (CompName = 'CmnEdit03020PrjCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  m_arCodeAttribute [5].nMasterDivision;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TableName     :=  'HojyoMA';           //

//<011>        lvExpSend.TBarNM        :=  CmnLabel03014KmkCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03014KmkCode.Caption;
        lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn =  ' + IntToStr(m_arCodeAttribute [5].nMasterDivision);
    end
//<044> 2006/12/21 H.Kawato Add Start
    else if (CompName = 'CmnEdit03022PjSCodeFree') //ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
            or  (CompName = 'CmnEdit03022PjSCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  m_arCodeAttribute [6].nMasterDivision;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TableName     :=  'HojyoMA';           //

        strWherePhase   :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn =  ' + IntToStr(m_arCodeAttribute [6].nMasterDivision);

        if  (m_arCodeAttribute [5].nAttribute <= 1) then
        begin
            if	(CmnEdit03020PrjCodeNumeric.InputFlag) then
        	    strHojCode	:= ''
            else
        	    strHojCode	:= fnGetDspData(Format ('%.16d', [Trunc (CmnEdit03020PrjCodeNumeric.Value)]),m_arCodeAttribute [5].nAttribute);
        end
        else
            strHojCode	:= fnGetDspData(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nAttribute);

///        nPrjNCode   := 0;
        iPartKbn    := 0;

        // プロジェクト内部コード取得
        nPrjNCode   := GetPrjNCode (m_arCodeAttribute [5].nMasterDivision, strHojCode);

        // 工種管理区分チェック
        if nPrjNCode <> 0 then
            iPartKbn  := GetKojiPartKbn (m_arCodeAttribute [5].nMasterDivision, nPrjNCode);

        if  (iPartKbn = 2) then
        begin
            strWherePhase  := strWherePhase + ' AND HojyoMA.NCode in ('
                    + ' SELECT KsyNCode FROM KousyuPtn'
                    + ' INNER JOIN  KojiInfo'
                    + ' ON KousyuPtn.PtnNCode = KojiInfo.PtnNCode'
                    + ' AND KojiInfo.MasterKbn = ' + IntToStr(m_arCodeAttribute [5].nMasterDivision)
                    + ' AND KojiInfo.NCode = ' + FloatToStr(nPrjNCode)
                    + ' WHERE KousyuPtn.MasterKbn = ' + IntToStr(m_arCodeAttribute [6].nMasterDivision) + ' )';
        end;

        lvExpSend.WhereStr  := strWherePhase;
    end
// <044> 2006/12/21 H.Kawato Add End
    else if (CompName = 'CmnEdit03017SegCodeFree') //ｾｸﾞﾒﾝﾄ
            or  (CompName = 'CmnEdit03017SegCodeNumeric') then
    begin
        lvExpSend.MasterKbn     :=  m_arCodeAttribute [2].nMasterDivision;         //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝

        lvExpSend.TableName     :=  'HojyoMA';          //

//<011>        lvExpSend.TBarNM        :=  CmnLabel03014KmkCode.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
//<011>        lvExpSend.TrRootCaption :=  CmnLabel03014KmkCode.Caption;
// <051> MOD
        // lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn = ' + intToStr(m_arCodeAttribute [2].nMasterDivision);
        lvExpSend.WhereStr      :=  'HojyoMA.SumKbn = 0 AND HojyoMA.RdelKbn = 0 and HojyoMA.Masterkbn = ' + intToStr(m_arCodeAttribute [2].nMasterDivision) + ' and HojyoKbn2 in (1,2)';
// <051> MOD
    end


    //***** 依頼先銀行ｺｰﾄﾞ *************************************************<023>
    else if (CompName = 'CmnEdit03001AccountCode') then
    begin
        lvNCode := fnGetNCODE(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);

        lvExpSend.MasterKbn     := 9120;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        strWherePhase           := 'BankInfo.RDelKbn = 0 and AccInfo.RDelKbn = 0 '
                                    + ' And BankNCode = ' + FloatToStr(lvNCode);

        lvExpSend.WhereStr := strWherePhase;
    end
    //***** 依頼先銀行ｺｰﾄﾞ *************************************************<023>


    //***** 入金口座ｺｰﾄﾞ ***************************************************<025>
    else if (CompName = 'CmnEdit02008ChaDivisionCheck') then
    begin
        lvNCode := fnGetNCODE(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);

        lvExpSend.MasterKbn     := 9120;                    // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO
        strWherePhase           := 'BankInfo.RDelKbn = 0 and AccInfo.RDelKbn = 0 '
                                    + ' And BankNCode = ' + FloatToStr(lvNCode);

        lvExpSend.WhereStr := strWherePhase;
    end;
    //***** 入金口座ｺｰﾄﾞ ***************************************************<025>


    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin

        if Sender is TMNumEdit then
        begin
           TMNumEdit(MJSFindCtrl(Self,CompName )).value := StrToFloat(lvExpRecv.GCode);
		   TMNumEdit(MJSFindCtrl(Self,CompName )).InputFlag := False;	// <026>
        end
        else if Sender is TMTxtEdit then
           TMTxtEdit(MJSFindCtrl(Self,CompName )).Text := lvExpRecv.GCode;

        if (CompName = 'CmnEdit03014KmkCode') then//科目
            CmnLabel03014KmkCodeDesc.Caption := lvExpRecv.NMK
        else
            TMLabel  (MJSFindCtrl(Self, 'CmnLabel' + Copy(CompName,8,12) + 'Desc')).Caption := lvExpRecv.NMK;

// <063> ADD start
	                  							// 部門の場合は同一ｺｰﾄﾞが存在するためﾀｸﾞに内部ｺｰﾄﾞを入れておく
		if CompName = 'CmnEdit03016BumCodeNumeric' then
        begin
          	TMNumEdit(Sender).TagStr := FloatToStr(lvExpRecv.NCode);
        end
        else if CompName = 'CmnEdit03016BumCodeFree' then
        begin
         	TMTxtEdit(Sender).TagStr := FloatToStr(lvExpRecv.NCode);
        end;
// <063> ADD end

        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ

		abort;
    end;

end;
//***********************************************************************************************************/
//   休日内部ｺｰﾄﾞ
//***********************************************************************************************************/
function  TJNTCRP008002f.fnGetHoliday(BkCode:Integer;BrCode:Integer):Extended;
var
    Qry : TMQuery;
begin

    Result := 0;

    Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

	with (Qry) do
	begin
		Close ();
		SQL.Clear ();
        SQL.Add   ('SELECT OffDNCode FROM BankInfo ');
        SQL.Add   ('WHERE  AllBkCode = :BkCode and AllBraCode = :BrCode ');
        SQL.Add   ('And RDelKbn = 0');

    	ParamByName ('BkCode').AsFloat	:= BkCODE;
    	ParamByName ('BrCode').AsFloat	:= BrCODE;
		Open ();

		if	(not EOF) then
            Result := FieldByName ('OffDNCode').AsFloat;
	end;

	Qry.Close ();
	Qry.Free  ();

end;
//***********************************************************************************************************/
//<KEY> CMChildkeyでは取れないので…
//***********************************************************************************************************/
procedure TJNTCRP008002f.fnCmnKeyPress(Sender: TObject;var Key: Char);
begin

(*
//<KEY>

    if Screen.ActiveControl is TSelectStrGrid then
    begin
        m_cACControl.SetFocus ();
        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
    end;
*)
end;
//-----------------------------------------------------------------------------
// BChangeClick()
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008002f.BChangeClick(Sender: TObject);
var
	wkParam : TAppParam;
//    iAction : Integer;

    lvRect: TRect;
    lvWidth, lvHeight: Integer;
begin

    m_bBtnChange := False;
    if  (B_Change.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGINEND;            //  格納通知
        B_Change.Caption := '切出(&G)';                         // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible      :=	False;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect       := Self.ClientRect;
        lvWidth      := lvRect.Right - lvRect.Left;
        lvHeight     := lvRect.Bottom - lvRect.Top;

        ClientWidth  := lvWidth;
        ClientHeight := lvHeight;
		Visible		 := True;

        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGOUTEND;           //  取出通知
        B_Change.Caption := '埋込(&G)';                         // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=    Pointer(m_Base_pRec);         // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                          // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_Base_pRec^).m_pOwnerEntry(@wkParam);

    m_bBtnChange := True;

end;



procedure TJNTCRP008002f.fnCmnGridAccInfoChangeNodeEx(Sender: TObject);
var
	fValueCheck: Boolean;

begin
    if uvCloseFlg  then Exit;

	fValueCheck	:= TRUE;

	if	 (CmnGridHojyoMA.FocusedNode.Values [1] <> 0) then
	begin
        // 新規ﾃﾞｰﾀ作成時   <016>
		if	(CmnMemDataAccInfo.State in [dsInsert]) then
    		fValueCheck := FALSE;

        // 入力ﾃﾞｰﾀﾁｪｯｸ     <016>
        if (CmnDataSourceAccInfo.DataSet.FieldByName ('nAccountCode').AsString = '') then
    		fValueCheck := FALSE;
	end;

	if	(not fValueCheck) then
	begin
		CmnGridAccInfo.FocusedColumn	:= 1;
		B_Delete.Enabled	:= FALSE;
	end
	else
	begin

// <054> MOD start
(*
// <030>↓
//		B_Delete.Enabled	:= True;
		B_Delete.Enabled	:= m_cJNTArea.IsDelete;
// <030>↑
*)
		if m_nReferMode = REFER then
        begin
// <055> MOD start
//			B_Delete .Enabled := False;
        	if m_bDelete then
            begin
             	B_Delete.Enabled := m_cJNTArea.IsDelete;
            end
            else
            begin
    			B_Delete.Enabled := False;
            end;
// <055> MOD end
		end
        else
        begin
        	B_Delete.Enabled := m_cJNTArea.IsDelete;
		end;
// <054> MOD end

	end;

end;

procedure TJNTCRP008002f.FormDestroy(Sender: TObject);
begin

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
    PrintAppEntry(nil,nil,6,PrtParam,ArrHdl);

// <077> ADD-STR
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
// <077> ADD-END

end;

// <028> >>
procedure TJNTCRP008002f.CmnEdit00005BrNameExit(Sender: TObject);
var	strName : String;
begin
	// 簡略名称が入っていたら終了
	if CmnEdit00007NMK.Text <> '' then
    	Exit;

	// 銀行名も支店名も変更なしなら終了
    if ((not PCheckItemRec (m_cCheckItems.Items [2])^.fChangeData)
     and (not PCheckItemRec (m_cCheckItems.Items [4])^.fChangeData)) then
    	Exit;

    strName := CmnEdit00003BkName.Text + '/' + CmnEdit00005BrName .Text;

    if  (strName <> '') then
    begin
	if	(MjsHanLength(strName) <= 14) then
		CmnEdit00007NMK.Text	:= MjsHanCopy (strName, 1, 14)
	else
		CmnEdit00007NMK.Text	:= MJSKabuCut (strName, 14);
    end;
end;
// <028> <<

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/20
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008002f.fnDelCheck(exNCode: Extended; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
    Result := False;
//↓<MLXHAP>債務と債権のチェックストアドは、MLX給与以外のときに流す。
	if not TMSeries.IsMjsLink3 then
	begin
//↑<MLXHAP>下記、字下げ。
        try
            SPPayAcc.Connection := m_cDBSelect;
            //SPPayAcc.SessionName := m_cDBSelect.SessionName;

            // 【債務】MP_PAY_CHK_ACCINFO
            with SPPayAcc do
            begin
                ParamByName('@NCode').AsFloat := exNCode;
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
            strErr := '例外発生(MP_PAY_CHK_ACCINFO)';
            Exit;
        end;

        if iRet = 1 then                        // 削除不可
            Exit;

        try
            SPCrdAcc.Connection := m_cDBSelect;
            //SPCrdAcc.SessionName := m_cDBSelect.SessionName;

            // 【債権】MP_CRD_CHK_ACCINFO
            with SPCrdAcc do
            begin
                ParamByName('@NCode').AsFloat := exNCode;
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
            strErr := '例外発生(MP_CRD_CHK_ACCINFO)';
            Exit;
        end;

        if iRet = 1 then                        // 削除不可
            Exit;
//↓<MLXHAP>
	end;
//↑<MLXHAP>
    try
        SPHapAcc.Connection := m_cDBSelect;
        //SPHapAcc.SessionName := m_cDBSelect.SessionName;

        // 【人給】MP_HAP_CHK_ACCINFO
        with SPHapAcc do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
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
        strErr := '例外発生(MP_HAP_CHK_ACCINFO)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

//**********************************************************************
//*		Proccess	:	口座情報の内部ｺｰﾄﾞ取得 <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/20
//*		Parameter	:	exBankNCode : 銀行内部ｺｰﾄﾞ
//*                     iAccCode    : 依頼先口座ｺｰﾄﾞ
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008002f.fnGetAccNCode(exBankNCode: Extended; iAccCode: Integer): Extended;
var
    QueryAcc    : TMQuery;
begin
    Result := 0;

    QueryAcc := TMQuery.Create(Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, QueryAcc);

    try
        with QueryAcc do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT NCode FROM AccInfo '             );
            SQL.Add   ('WHERE GCode = :parGCode AND RdelKbn = 0');
            SQL.Add   ('  And BankNCode = :parBankNCode'        );

                                            // 銀行内部ｺｰﾄﾞ
            ParamByName ('parBankNCode').AsFloat    := exBankNCode;
                                            // 依頼先口座ｺｰﾄﾞ
            ParamByName ('parGCode').AsInteger      := iAccCode;

            Open ();

            if not Eof then
                Result := GetFld('NCode').AsFloat;
        end;
    finally
        QueryAcc.Close;
        QueryAcc.Free;
    end;

end;

//**********************************************************************
//*		Proccess	:	銀行に付随する全口座の削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/02/22
//*		Parameter	:	exNCode : ﾁｪｯｸ対象銀行内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008002f.fnDelCheckBank(exBankNCode: Extended; var strErr: String): Boolean;
var
    QueryAcc    : TMQuery;
begin
    Result := False;

    QueryAcc := TMQuery.Create(Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, QueryAcc);

    try
        with QueryAcc do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT NCode FROM AccInfo '         );
            SQL.Add   ('WHERE BankNCode = :parBankNCode'    );
            SQL.Add   (' AND RDelKbn = 0'                   );
                                            // 銀行内部ｺｰﾄﾞ
            ParamByName ('parBankNCode').AsFloat    := exBankNCode;
            Open ();

            while not Eof do                // 口座1件ずつ
            begin
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
                if not fnDelCheck(GetFld('NCode').AsFloat, strErr) then
                begin
                    Exit;
                end;
                Next;
            end;
        end;
    finally
        QueryAcc.Close;
        QueryAcc.Free;
    end;

    Result := True;

end;

//<036>
procedure TJNTCRP008002f.fnCmnExit(Sender: TObject);
begin

    if uvCloseFlg = True then exit; // CloseでExitｲﾍﾞﾝﾄ起動を抑止する為

	if	(m_nReferMode <> REFER) then
        fnChangeConditionAllControlsDetail(True);

	if	(not fnCheckEditItemsValue ()) then
	begin
		if	((m_cACControl is TMNumEdit ) or
			 (m_cACControl is TMTxtEdit ) or
			 (m_cACControl is TMDateEdit)) then
		begin
			if	(m_cACControl.Enabled) then
			begin
				m_cACControl.SetFocus ();
				TEdit (m_cACControl).SelectAll ();
			end;
		end;
	end;

//↓<CDCHG>
	// コード変更のボタンは非表示
	B_CodeChange.Visible := False;
//↑<CDCHG>
// <106> ADD-STR
	// 全銀協-銀行コード、支店コードからフォーカスが離れた場合、メッセージをクリアする
	if (TWinControl (Sender).Name = CmnEdit00001BkCode.Name)
    	or (TWinControl (Sender).Name = CmnEdit00002BrCode.Name) then
    begin
		CmnStatusBar.SimpleText := '';
    end;
// <106> ADD-END

end;
//<038>
//**********************************************************************
//*		Proccess	:	全銀協本店支店検索ｴｸｽﾌﾟﾛｰﾗｰ(ｸﾞﾘｯﾄﾞ)
//*		Name		:	K.Iiduka(LEAD)
//*		Date		:	2006/04/10
//**********************************************************************
procedure TJNTCRP008002f.fnEditBkBtnClick(Sender: TObject);
var
	dqCommonData  : TMQuery;
	nAllBankCode  : Integer;
	nBranchCode	  : Integer;
	nReturn		  : Integer;
	strAllBankName: String;
	strBranchName : String;
///    strName		  : String;
//↓<DIC_BANK>
	strBankKanaName	: string;
	strBraKanaName	: string;
//↑<DIC_BANK>
begin

    if (CmnMemDataHojyoMA.State in [dsInsert]) = False then
        Exit;

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK>	fnCMNBankInit (m_pRec);
//<DIC_BANK_2>	fnCMNBankInit (m_pRec,P_BANKDIC_BANKTENPOFIND); //<DIC_BANK>
	fnCMNBankInit (m_Base_pRec,P_BANKDIC_BANKTENPOFIND); //<DIC_BANK><DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	nAllBankCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;

//<DIC_BANK>	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName);
	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName, strBankKanaName, strBraKanaName); //<DIC_BANK>

	fnCMNBankFree ();
	m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す

	if	(nReturn = 1) then
	begin
        // 重複ﾁｪｯｸ(BankInfoに重複ﾃﾞｰﾀがある場合には処理終了)
        if (fnCheckValidRecordHojyoMA(nAllBankCode,nBranchCode)=false) then
        begin
            Exit;
        end;

		CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger	:= nAllBankCode;
		CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger	:= nBranchCode;
		CmnMemDataHojyoMA.FieldByName ('strBkName').AsString  := MJSKabuCut (strAllBankName, 30);
		CmnMemDataHojyoMA.FieldByName ('strBrName').AsString  := MJSKabuCut (strBranchName , 30);
//↓<DIC_BANK>
		CmnMemDataHojyoMA.FieldByName ('strBkKana').AsString  := fnExchangeCharacterKanaDesc(strBankKanaName);
		CmnMemDataHojyoMA.FieldByName ('strBrKana').AsString  := fnExchangeCharacterKanaDesc(strBraKanaName);
        CmnGridHojyoMA.FocusedColumn	:= 3; // 連想にフォーカス
//↑<DIC_BANK>
	end
	else
	begin
		Exit;
	end;
{↓<DIC_BANK>銀行辞書対応により、カナが返却されるようになったので、下記のカナを取得するロジックは不要になった。
	dqCommonData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBCommon, dqCommonData);							// DBとMQueryの接続

	with (dqCommonData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK WHERE BankCD = ' + IntToStr (nAllBankCode));

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqCommonData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqCommonData);

			dqCommonData.Close ();
			dqCommonData.Free  ();

			Exit;
		end;

		if	(not EOF) then
			CmnMemDataHojyoMA.FieldByName ('strBkKana').AsString:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankName').AsString)
		else
			CmnMemDataHojyoMA.FieldByName ('strBkKana').AsString	:= '';

		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM CMN_BANK_OFFICE WHERE BankCD = :nAllBankCode AND BankOfficeCD = :nBranchCode');

		ParamByName ('nAllBankCode').AsInteger	:= nAllBankCode;
		ParamByName ('nBranchCode' ).AsInteger	:= nBranchCode;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqCommonData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqCommonData);

			dqCommonData.Close ();
			dqCommonData.Free  ();

			Exit;
		end;

		if	(not EOF) then
			CmnMemDataHojyoMA.FieldByName ('strBrKana').AsString	:= fnExchangeCharacterKanaDesc (FieldByName ('KanaBankOffice').AsString)
		else
			CmnMemDataHojyoMA.FieldByName ('strBrKana').AsString	:= '';


        dqCommonData.Close ();
		dqCommonData.Free  ();

	end;
↑<DIC_BANK>}
end;
{↓<DIC_BANK>銀行辞書Exp対応により作り変え。
//<039>
//**********************************************************************
//*		Proccess	:	全銀協支店検索ｴｸｽﾌﾟﾛｰﾗｰ(ｸﾞﾘｯﾄﾞ)
//*		Name		:	K.Iiduka(LEAD)
//*		Date		:	2006/04/10
//**********************************************************************
procedure TJNTCRP008002f.fnEditBrBtnClick(Sender: TObject);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;

	sSQL:string;
	mqQry:TMQuery;

	fDlg:TJNTCRP008002_6F;
begin

    if (CmnMemDataHojyoMA.State in [dsInsert]) = False then
        Exit;

	nBankCd := CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;

	fDlg:=TJNTCRP008002_6F.CreateForm(Self,	m_pRec,	nBankCD	);

	try
	    if fDlg.DoDlg(@nOfficeCD)<>mrOK then
			Exit;
	finally
		fDlg.Free;
	end;

	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_cDataModule.SetDBInfoToQuery(m_cDBCommon,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BK.BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//支店ｺｰﾄﾞ
				sSQL:=sSQL+#13#10',BR.BankOfficeCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchCode';
				//銀行名
				sSQL:=sSQL+#13#10',BK.BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//支店名
				sSQL:=sSQL+#13#10',BR.BankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',BK.KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				//ｶﾅ支店名
				sSQL:=sSQL+#13#10',BR.KanaBankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchKana';

				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BK';
				sSQL:=sSQL+#13#10' INNER JOIN';
				sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BR';
				sSQL:=sSQL+#13#10' ON';
				sSQL:=sSQL+#13#10' BK.BankCD=BR.BankCD';

				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BK.BankCD=';
				sSQL:=sSQL+		 IntToStr(nBankCD);
				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BankOfficeCD=';
				sSQL:=sSQL+		 IntToStr(nOfficeCD);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//取得できない->検索Expの戻値不正(念のため)
				if IsEmpty then
					Abort;
			end;

            // 重複ﾁｪｯｸ(BankInfoに重複ﾃﾞｰﾀがある場合には処理終了)
            if (fnCheckValidRecordHojyoMA(nBankCD,nOfficeCD)=false) then
            begin
                Exit;
            end;

			//ｸﾞﾘｯﾄﾞMemDataにｾｯﾄ
			with CmnMemDataHojyoMA do
			begin
				//支店ｺｰﾄﾞ
				FieldByName('nBrCODE').AsInteger	:=mqQry.GetFld('BranchCode').AsInteger;
				//支店名
				FieldByName('strBrName').AsString	:=Copy(mqQry.GetFld('BranchName').AsString,1,20);
				//支店名ｶﾅ
				FieldByName('strBrKana').AsString	:=Copy(mqQry.GetFld('BranchKana').AsString,1,15);
				//この時点では行にｾｯﾄするのみ
				//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
                keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
			end;
		except
			raise Exception.Create('全銀情報の取得に失敗しました');
		end;
	finally
		mqQry.Free;
	end;

end;
↑<DIC_BANK>}
//↓<DIC_BANK>銀行辞書Exp対応により作り変え。
//**********************************************************************
//*		Proccess	:	全銀協支店検索ｴｸｽﾌﾟﾛｰﾗｰ(ｸﾞﾘｯﾄﾞ)
//*		Name		:	K.Iiduka(LEAD)
//*		Date		:	2006/04/10
//**********************************************************************
procedure TJNTCRP008002f.fnEditBrBtnClick(Sender: TObject);
var
	nAllBankCode  : Integer;
	nBranchCode	  : Integer;
	nReturn		  : Integer;
	strAllBankName: String;
	strBranchName : String;
	strBankKanaName	: string;
	strBraKanaName	: string;
begin

    if (CmnMemDataHojyoMA.State in [dsInsert]) = False then
        Exit;

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit (m_pRec,P_BANKDIC_TENPOFINDONLY);
	fnCMNBankInit (m_Base_pRec,P_BANKDIC_TENPOFINDONLY);				//<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	nAllBankCode	:= CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger;

	nBranchCode		:= 0;

	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName, strBankKanaName, strBraKanaName);

	fnCMNBankFree ();
	m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す

	if	(nReturn = 1) then
	begin
        // 重複ﾁｪｯｸ(BankInfoに重複ﾃﾞｰﾀがある場合には処理終了)
        if (fnCheckValidRecordHojyoMA(nAllBankCode,nBranchCode)=false) then
        begin
            Exit;
        end;

		CmnMemDataHojyoMA.FieldByName ('nBkCode').AsInteger	:= nAllBankCode;
		CmnMemDataHojyoMA.FieldByName ('nBrCode').AsInteger	:= nBranchCode;
		CmnMemDataHojyoMA.FieldByName ('strBkName').AsString  := MJSKabuCut (strAllBankName, 30);
		CmnMemDataHojyoMA.FieldByName ('strBrName').AsString  := MJSKabuCut (strBranchName , 30);
		CmnMemDataHojyoMA.FieldByName ('strBkKana').AsString  := MjsHanCopy (strBankKanaName,1, 15);
		CmnMemDataHojyoMA.FieldByName ('strBrKana').AsString  := MjsHanCopy (strBraKanaName ,1, 15);
		keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
	end
	else
	begin
		Exit;
	end;
end;
//↑<DIC_BANK>
{↓<DIC_BANK>銀行辞書Exp対応により作り変え。
//<039>
//**********************************************************************
//*		Proccess	:	全銀協支店検索ｴｸｽﾌﾟﾛｰﾗｰ(ｸﾞﾘｯﾄﾞ・ｶｰﾄﾞ型共通)
//*		Name		:	K.Iiduka(LEAD)
//*		Date		:	2006/04/10
//**********************************************************************
procedure TJNTCRP008002f.fnBrAllowClick(Sender: TObject);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;

	sSQL:string;
	mqQry:TMQuery;

	fDlg:TJNTCRP008002_6F;
begin

	nBankCd := CmnEdit00001BkCode.AsInteger;

	fDlg:=TJNTCRP008002_6F.CreateForm(Self,	m_pRec,	nBankCD	);

	try
	    if fDlg.DoDlg(@nOfficeCD)<>mrOK then
			Exit;
	finally
		fDlg.Free;
	end;

	//共通DBから情報取得
	mqQry:=TMQuery.Create(Self);
	try
		try
			m_cDataModule.SetDBInfoToQuery(m_cDBCommon,mqQry);

			with mqQry do
			begin
				//振込先銀行登録
				sSQL:=			 'SELECT';
				//銀行ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BK.BankCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankCode';
				//支店ｺｰﾄﾞ
				sSQL:=sSQL+#13#10',BR.BankOfficeCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchCode';
				//銀行名
				sSQL:=sSQL+#13#10',BK.BankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankName';
				//支店名
				sSQL:=sSQL+#13#10',BR.BankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchName';
				//ｶﾅ銀行名
				sSQL:=sSQL+#13#10',BK.KanaBankName';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BankKana';
				//ｶﾅ支店名
				sSQL:=sSQL+#13#10',BR.KanaBankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchKana';

				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BK';
				sSQL:=sSQL+#13#10' INNER JOIN';
				sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BR';
				sSQL:=sSQL+#13#10' ON';
				sSQL:=sSQL+#13#10' BK.BankCD=BR.BankCD';

				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BK.BankCD=';
				sSQL:=sSQL+		 IntToStr(nBankCD);
				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BankOfficeCD=';
				sSQL:=sSQL+		 IntToStr(nOfficeCD);

				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				//取得できない->検索Expの戻値不正(念のため)
				if IsEmpty then
					Abort;
			end;

            if (Sender <> CmnEdit00002BrCode) then
            begin
                // 重複ﾁｪｯｸ
                if (fnCheckValidRecordHojyoMA(nBankCD,nOfficeCD)=false) then
                begin
                    mqQry.Free;
                    Exit;
                end;
            end;

			//ｸﾞﾘｯﾄﾞMemDataにｾｯﾄ
			with CmnMemDataHojyoMA do
			begin
				//支店ｺｰﾄﾞ
				CmnEdit00002BrCode.Value    	:=mqQry.GetFld('BranchCode').AsInteger;
				//支店名
				CmnEdit00005BrName.Text	        :=Copy(mqQry.GetFld('BranchName').AsString,1,20);
				//支店名ｶﾅ
				CmnEdit00006BrKana.Text	        :=Copy(mqQry.GetFld('BranchKana').AsString,1,15);
				//この時点では行にｾｯﾄするのみ
				//ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
                keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
			end;
		except
			raise Exception.Create('全銀情報の取得に失敗しました');
		end;
	finally
		mqQry.Free;
	end;
end;
↑<DIC_BANK>}
//↓<DIC_BANK>銀行辞書Exp対応により作り変え。
//**********************************************************************
//*		Proccess	:	全銀協支店検索ｴｸｽﾌﾟﾛｰﾗｰ(ｸﾞﾘｯﾄﾞ・ｶｰﾄﾞ型共通)
//*		Name		:	K.Iiduka(LEAD)
//*		Date		:	2006/04/10
//**********************************************************************
procedure TJNTCRP008002f.fnBrAllowClick(Sender: TObject);
var
	strName		  : string;
	nAllBankCode  : Integer;
	nBranchCode	  : Integer;
	nReturn		  : Integer;
	strAllBankName: String;
	strBranchName : String;
	strBankKanaName	: string;
	strBraKanaName	: string;
begin

	m_cJNTArea.setOthAppRecord;									//<DIC_BANK_2>rcSYSTEMAREAに変更
//<DIC_BANK_2>	fnCMNBankInit (m_pRec,P_BANKDIC_TENPOFINDONLY);
	fnCMNBankInit (m_Base_pRec,P_BANKDIC_TENPOFINDONLY);				//<DIC_BANK_2>m_cJNTArea.setxxxで操作できるm_Base_pRecを渡します。

	nAllBankCode	:= CmnEdit00001BkCode.AsInteger;

	nBranchCode		:= 0;

	nReturn	:= fnCMNBankShow (nAllBankCode, nBranchCode, strAllBankName, strBranchName, strBankKanaName, strBraKanaName);

	fnCMNBankFree ();
	m_cJNTArea.setMasAppRecord;									//<DIC_BANK_2>TJNTMASComに戻す

	if	(nReturn = 1) then
	begin

        if (Sender <> CmnEdit00002BrCode) then
        begin
            // 重複ﾁｪｯｸ
            if (fnCheckValidRecordHojyoMA(nAllBankCode,nBranchCode)=false) then
            begin
                Exit;
            end;
        end;

        CmnEdit00001BkCode.Value	:= nAllBankCode;
        CmnEdit00002BrCode .Value	:= nBranchCode;
        fnCheckEditNumValueAllBankCode ();
        fnSetChangeFlagCheckItems (TObject(CmnEdit00001BkCode), FALSE);
        fnSetChangeFlagCheckItems (TObject(CmnEdit00002BrCode), FALSE);

        CmnEdit00003BkName.Text	    := MJSKabuCut (strAllBankName, 30);
        CmnEdit00005BrName .Text	:= MJSKabuCut (strBranchName , 30);

        strName := CmnEdit00003BkName.Text + '/' + CmnEdit00005BrName .Text;

        if  (strName <> '') then
        begin
        if	(MjsHanLength(strName) <= 14) then
            CmnEdit00007NMK.Text	:= MjsHanCopy (strName, 1, 14)
        else
            CmnEdit00007NMK.Text	:= MJSKabuCut (strName, 14);
        end;

		CmnEdit00004BkKana.Text		:= MjsHanCopy(strBankKanaName,1,15);
        CmnEdit00006BrKana.Text	    := MjsHanCopy(strBraKanaName,1,15);

        //この時点では行にｾｯﾄするのみ
        //ﾃｰﾌﾞﾙへの更新はMemDataのBeforePostで行う(KDB入力と同じ)
        keybd_event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ
	end
	else
	begin

		Exit;
	end;
end;
//↑<DIC_BANK>

procedure TJNTCRP008002f.CmnTreeViewChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);

///var
///    nReturn : Integer;
begin


end;

//**********************************************************************
//		Proccess	:   プロジェクトサブ入力制御
//		Name		:   MSI川戸
//		Date		:   2006/12/21 <044>
//		Parameter	:
//		Return		:   Boolean
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008002f.PrjCodeNextControl ():Boolean;
var
    iPartKbn    : Integer;  // <044> Add
    strHojCode  : String;   // <044> Add

Procedure lfnSetMasterInfo(i,pMKBN:Integer);
var
	Qry: TMQuery;
begin

	Qry	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続
    with Qry do
    begin
        Close;
    	SQL.Clear ();
		SQL.Add   ('SELECT MasterKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
		SQL.Add   ('Where MasterKbn = :pMKBN ');
        ParamByName('pMKBN').asInteger := pMKBN;
        Open;
        if not Eof then
        begin
            m_arCodeAttribute [i].strDescription := FieldByName('JHojyoName').asString;
            m_arCodeAttribute [i].nDigit         := FieldByName('CodeDigit').asInteger;
            m_arCodeAttribute [i].nAttribute     := FieldByName('CodeAttr').asInteger;
        end;
        Close;
    end;

end;
begin
    Result  := True;

    CmnEdit03022PjSCodeNumeric.Value		:= 0;
    CmnEdit03022PjSCodeFree   .Text			:= '';
    CmnLabel03022PjSCode.caption            := '';

    m_arCodeAttribute [6].strDescription	:= '';
    m_arCodeAttribute [6].nDigit		    := 6;
    m_arCodeAttribute [6].nAttribute	    := 0;
    m_arCodeAttribute [6].fEnabled		    := FALSE;

    if  (m_arCodeAttribute [5].nAttribute <= 1) then
    begin
        if	(CmnEdit03020PrjCodeNumeric.InputFlag) then
    	    strHojCode	:= ''
        else
    	    strHojCode	:= fnGetDspData(Format ('%.16d', [Trunc (CmnEdit03020PrjCodeNumeric.Value)]),m_arCodeAttribute [5].nAttribute);
    end
    else
        strHojCode	:= fnGetDspData(CmnEdit03020PrjCodeFree.Text,m_arCodeAttribute [5].nAttribute);

    // ﾌﾟﾛｼﾞｪｸﾄ内部ｺｰﾄﾞを取得し、工種管理区分をﾁｪｯｸ
    iPartKbn    := GetKojiInfo(m_arCodeAttribute [5].nMasterDivision, strHojCode);
    if  (iPartKbn <> 0) then
    begin
        m_arCodeAttribute [6].nMasterDivision   := m_arCodeAttribute [5].nMasterDivision + 100;
        m_arCodeAttribute [6].fEnabled	:= TRUE;
        m_arCodeAttribute [6].fStatic	:= FALSE;
    end
    else
    begin
        m_arCodeAttribute [6].nMasterDivision   := 0;
        m_arCodeAttribute [6].fEnabled	:= FALSE;
        m_arCodeAttribute [6].fStatic	:= TRUE;
    end;
    lfnSetMasterInfo(6,m_arCodeAttribute [6].nMasterDivision);
    CmnLabel03022PjSCode.caption := m_arCodeAttribute [6].strDescription;

    fnChangeConditionJournalInfo (6);
    fnSetChangeFlagCheckItems (CmnEdit03022PjSCodeNumeric, FALSE);
end;

//**********************************************************************
//		Proccess	:   工種管理区分チェック
//		Name		:   MSI川戸
//		Date		:   2006/12/21 <044>
//		Parameter	:   iMasterkbn  : マスタ区分(プロジェクト)
//                      GCode       : プロジェクトコード
//		Return		:   工種管理区分
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008002f.GetKojiInfo(iMasterkbn: Integer; GCode: String): Integer;
var
    nPrjNCode   : Extended;
begin
    Result  := 0;

    // プロジェクト内部コード取得
    nPrjNCode   := GetPrjNCode (iMasterKbn, GCode);

    if nPrjNCode <> 0 then
    begin
        // 工種管理区分チェック
        Result  := GetKojiPartKbn (iMasterKbn, nPrjNCode);
    end;
end;

//**********************************************************************
//		Proccess	:   プロジェクト内部コード取得
//		Name		:   MSI川戸
//		Date		:   2006/12/21 <044>
//		Parameter	:   iMasterkbn  : マスタ区分(プロジェクト)
//                      GCode       : プロジェクトコード
//		Return		:   プロジェクト内部コード
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008002f.GetPrjNCode (iMasterKbn: Integer; GCode: String): Extended;
const
	strSQL	:	String	=	'SELECT NCode FROM HojyoMA '
                        +	'WHERE RDelKbn = 0  '
                        +   'AND SumKbn = 0 '
                        +   'AND GCode = :pGCode '
                        +   'AND MasterKbn = :pMasterkbn ';
var
    Qry     : TMQuery;
begin
    Result  := 0;
    
    Qry	:= TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

	try
        with (Qry) do
        begin
        	Close ();
        	SQL.Clear ();
        	SQL.Add   (strSQL);

            ParamByName('pMasterkbn').AsInteger	:=	iMasterKbn;
            ParamByName('pGCode').AsString      :=	GCode;

        	Open  ();
            if not Eof then
                Result := GetFld('NCode').AsFloat;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;
end;

//**********************************************************************
//		Proccess	:   工種管理区分取得
//		Name		:   MSI川戸
//		Date		:   2006/12/21 <044>
//		Parameter	:   iMasterkbn  : マスタ区分(プロジェクト)
//                      GCode       : プロジェクトコード
//		Return		:   工種管理区分
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008002f.GetKojiPartKbn (iMasterKbn: Integer; nPrjNCode: Extended):Integer;
const
	strSQL	:	String	=	'SELECT PartKbn FROM KojiInfo '
                        +	'WHERE NCode = :pNCode '
                        +   'AND MasterKbn = :pMasterkbn ';
var
    Qry     : TMQuery;
begin

    Result  := 0;

    Qry	:= TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qry);							// DBとMQueryの接続

	try
        with (Qry) do
        begin
        	Close ();
        	SQL.Clear ();
        	SQL.Add   (strSQL);

            ParamByName('pMasterkbn').AsInteger	:= iMasterKbn;
            ParamByName('pNCode').AsFloat       := nPrjNCode;

        	Open  ();
            if not Eof then
                Result := GetFld('PartKbn').AsInteger;
        end;
    finally
        Qry.Close;
        Qry.Free;
    end;
end;

//**********************************************************************
//	Proccess	:	ｸﾞﾙｰﾌﾟ会計採用ﾁｪｯｸ <047>
//	Name		:	Y.Mogi
//	Date		:	2007/06/07
//	Parameter	:
//	Return		:	True: 正常 False: 異常
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
function TJNTCRP008002f.fnChkGroupKbn(): Boolean;
var
    mqCtrlDb : TMQuery;

begin
//↓<MLXHAP>MLXのときはTrueで抜ける。
	if TMSeries.IsMjsLink3 then
	begin
		Result := True;
		Exit;
	end;
//↑<MLXHAP>

    Result       := True;
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
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, mqCtrlDb);
			    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (mqCtrlDb);
		        m_nReferMode	:= REFER;                                           // 参照ﾓｰﾄﾞ
                m_bDelete       := False;											// <055> ADD 削除不可
                Result := False;
                Exit;
            end;

            // ﾚｺｰﾄﾞが存在する場合は、子会社としてｸﾞﾙｰﾌﾟ管理されている
            if (not Eof) then
            begin
                MJSMessageBoxEx(Self, 'ｸﾞﾙｰﾌﾟ管理が採用されている為、追加、修正、削除は'
                                    + '配信会社で行ってください。','依頼先銀行登録',
                                    mjInformation, mjOk, mjDefOk, FALSE);

		        m_nReferMode	:= REFER;                                           // 参照ﾓｰﾄﾞ
                m_bDelete       := False;											// <055> ADD 削除不可
            end;
        end;
    finally
        mqCtrlDb.Close();
        mqCtrlDb.Free();
    end;

end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行 <061>
//	Name		:	S.Suzuki
//	Date		:	2007/12/11
//	Parameter	:   iSyori 0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008002f.SessionPractice(iSyori : Integer);
begin
												// 処理区分
	SpMSHist.ParamByName('@pSyoriKbn').AsInteger := iSyori;
			                   					// 履歴取得区分
	SpMSHist.ParamByName('@pMSHistKbn').AsInteger    := 1;
    											// 担当者内部ｺｰﾄﾞ
    SpMSHist.ParamByName('@pTanNCode').AsCurrency    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    											// 担当者名称
    SpMSHist.ParamByName('@pTanSimpleName').AsString := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
    											// ｼｽﾃﾑｺｰﾄﾞ
    SpMSHist.ParamByName('@pSysCode').AsInteger      := m_pRec^.m_iSystemCode;
    											// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SpMSHist.ParamByName('@pOptCode').AsInteger      := m_pRec^.m_iOptionCode;
    											// 処理ｺｰﾄﾞ
    SpMSHist.ParamByName('@pPrgCode').AsInteger      := m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SpMSHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SpMSHist.FetchOptions.Items := SpMSHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SpMSHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SpMSHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
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
function TJNTCRP008002f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

// <069> ADD-STR
//**********************************************************************
//		Proccess	:   債務/経費精算自動仕訳申請状況チェック
//		Name		:   T.SATOH(IDC)
//		Date		:   2009/02/03
//		Parameter	:
//		Return		:   修正可否
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008002f.fnAllowEdit (): Boolean;
const
    iSwkForm    : Integer = 6061;
var
	objQuery    : TMQuery;
    iLoop       : Integer;
    bIsWF       : Boolean;
begin
//↓<MLXHAP>MLXのときはTrueで抜ける。
	if TMSeries.IsMjsLink3 then
	begin
		Result := True;
		Exit;
	end;
//↑<MLXHAP>

	objQuery    := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, objQuery);  // DBとMQueryの接続

    bIsWF := False;

    with objQuery do
    begin
        for iLoop := 1 to 2 do
        begin
            // ＷＦ採用状況確認
            Close;
            SQL.Clear;
            SQL.Add('SELECT DataNum' +
                    '  FROM PayBaseInfo' +
                    ' WHERE SystemCode = ' + IntToStr(iLoop) +
                    '   AND ItemID = 5161');
            Open;
            if not Eof then
            begin
                bIsWF := (FieldByName('DataNum').AsInteger = 1);
            end;

            // 申請状況確認
            if (bIsWF) then
            begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT ISNULL(FAI.OrgStatus, 0) OrgStatus, PWI.FuncNo' +
                        '  FROM PayWFInfo PWI' +
                        ' INNER JOIN PayActionInfo PAY' +
                        '    ON PAY.SystemCode = PWI.SystemCode' +
                        '   AND PAY.FuncNo = PWI.FuncNo' +
                        '   AND PAY.Condition = 0' +
                        ' INNER JOIN MasApplyGroupInfo MAG' +
                        '    ON MAG.SwkForm = PWI.SwkForm' +
                        '   AND MAG.AppGroupID = PWI.AppGroupID' +
                        ' INNER JOIN FLW_AppInfo FAI' +
                        '    ON FAI.SwkForm = MAG.SwkForm' +
                        '   AND FAI.OrgNo = MAG.OrgNo' +
                        ' WHERE	PWI.SystemCode = ' + IntToStr(iLoop) +
                        '   AND PWI.DtClearKbn = 0' +
                        '   AND PWI.SwkForm = ' + IntToStr(iSwkForm + iLoop * 100));
                Open;
                bIsWF := (not Eof);
            end;

            if bIsWF then
                Break;
        end;

        Close;
        Free;
    end;

    Result := (not bIsWF);
end;
// <069> ADD-END

//↓<MLXHAP>
//**************************************************************************
//	Proccess	:	【MLX給与】依頼先銀行登録ﾘｽﾄのﾃﾞｰﾀをMemDataにｾｯﾄ
//	Parameter	:
//	Return		:
//**************************************************************************
procedure TJNTCRP008002f.fnPrintCheckList_MLXHAP();
var
	dqMasterData	: TMQuery;
	iPosition		: Integer;
	cHojNCode		: Currency;
	strDescription	: String;
	strGCode		: String;
	strFormat		: String;

begin
	dqMasterData := TMQuery.Create(Self);

	try
												// DBとMQueryの接続
		m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterData);

		with dqMasterData do
		begin
			Close();
			SQL.Clear();
			SQL.Add(fnPrintGetSQL_MLXHAP());

			Open();

			CmnMemDataPrint_MLXHAP.Active := False;
			CmnMemDataPrint_MLXHAP.Active := True;

			while not Eof do
			begin
				CmnMemDataPrint_MLXHAP.Append();
												// 銀行ｺｰﾄﾞ
				strGCode := Format('%.4d', [FieldByName('AllBkCode').AsInteger]);
                                                // 全銀協支店ｺｰﾄﾞ
				strGCode := strGCode + '-' + Format('%.3d', [FieldByName('AllBraCode').AsInteger]);
				CmnMemDataPrint_MLXHAP.FieldByName('BankCode').AsString			:= strGCode;
												// 銀行名称
				CmnMemDataPrint_MLXHAP.FieldByName('BankName').AsString			:= FieldByName('BankName').AsString;
												// カナ銀行名
				CmnMemDataPrint_MLXHAP.FieldByName('BankKanaName').AsString		:= FieldByName('BankKanaName').AsString;
												// 支店名称
				CmnMemDataPrint_MLXHAP.FieldByName('BkBraName').AsString		:= FieldByName('BkBraName').AsString;
												// カナ支店名
				CmnMemDataPrint_MLXHAP.FieldByName('BraKanaName').AsString		:= FieldByName('BraKanaName').AsString;
												// 簡略名称
				CmnMemDataPrint_MLXHAP.FieldByName('SimpleName').AsString		:= FieldByName('SimpleName').AsString;

												// 口座ｺｰﾄﾞ
				CmnMemDataPrint_MLXHAP.FieldByName('AccCode').AsInteger			:= FieldByName('AccCode').AsInteger;
												// 預金種目
				CmnMemDataPrint_MLXHAP.FieldByName('AccKbnName').AsString		:= FieldByName('AccKbn').AsString;
												// 口座番号
				CmnMemDataPrint_MLXHAP.FieldByName('AccNo').AsString			:= fnGetEditedAccountNumber(FieldByName('AccNo').AsString);
												// 振込種別
				CmnMemDataPrint_MLXHAP.FieldByName ('ShubetsuName').AsString	:= FieldByName ('Shubetsu').AsString;
												// 依頼書電信扱い
				CmnMemDataPrint_MLXHAP.FieldByName ('RequestKbnName').AsString	:= FieldByName ('RequestKbn').AsString;
												// 取扱種目
				CmnMemDataPrint_MLXHAP.FieldByName ('ShumokuName').AsString		:= FieldByName ('Shumoku').AsString;
												// 半角ｺｰﾄﾞ体系
				CmnMemDataPrint_MLXHAP.FieldByName ('FBCodeModeName').AsString	:= FieldByName ('FBCodeMode').AsString;
												// ﾚｺｰﾄﾞ区切
				CmnMemDataPrint_MLXHAP.FieldByName ('RecordPauseName').AsString	:= FieldByName ('RecordPause').AsString;
												// 振込依頼人ｺｰﾄﾞ
				if	FieldByName('ClientCode').AsString <> '' then
				begin
					CmnMemDataPrint_MLXHAP.FieldByName('ClientCode').AsCurrency	:= StrToInt64(FieldByName('ClientCode').AsString);
				end;
												// 振込依頼人名
				CmnMemDataPrint_MLXHAP.FieldByName('AccInfo1').AsString			:= FieldByName('AccInfo1').AsString;
												// ｶﾅ振込依頼人名
				CmnMemDataPrint_MLXHAP.FieldByName('ClientName').AsString		:= FieldByName('ClientName').AsString;
												// ﾌｧｲﾙ名
				CmnMemDataPrint_MLXHAP.FieldByName('FileName').AsString			:= FieldByName('FileName').AsString;
												// ﾎﾞﾘｭｰﾑ名
				CmnMemDataPrint_MLXHAP.FieldByName('VolName').AsString			:= FieldByName('VolName').AsString;
// <103> ADD-STR
                                                // 総合振込出力方式
				CmnMemDataPrint_MLXHAP.FieldByName('AccZanLimitName').AsString	:= FieldByName('AccZanLimit').AsString;
// <103> ADD-END
				CmnMemDataPrint_MLXHAP.FieldByName('AccMemo').AsString			:= FieldByName('AccMemo').AsString;	//<20200707>Add

				CmnMemDataPrint_MLXHAP.Post();

				Next();
			end;
		end;

	finally
		dqMasterData.Free();
	end;
end;

//**************************************************************************
//	Proccess	:	【MLX給与】依頼先銀行登録ﾘｽﾄのﾃﾞｰﾀ取得SQLを返す
//	Parameter	:
//	Return		:	SQL
//**************************************************************************
function TJNTCRP008002f.fnPrintGetSQL_MLXHAP(): String;
var
	strSQL: String;
begin
	strSQL :=	' SELECT'
			+	'  ai.GCode AccCode'					// 依頼先口座ｺｰﾄﾞ
			+	' ,bi.AllBkCode'						// 全銀協ｺｰﾄﾞ
			+	' ,bi.AllBraCode'						// 全銀協支店ｺｰﾄﾞ

			+	' ,bi.BankName'							// 銀行名称
			+	' ,bi.BankKanaName'						// カナ銀行名
			+	' ,bi.BkBraName'						// 支店名称
			+	' ,bi.BraKanaName'						// カナ支店名

			+	' ,bi.SimpleName'						// 簡略名称
			+	' ,case coalesce(ai.AccKbn, 0)'			// 預金種別
			+	'   when 1 then ''普通'''
			+	'   when 2 then ''当座'''
			+	'   when 4 then ''貯蓄'''
			+	'   when 9 then ''その他'''
			+	'   else '''''
			+	'  end as AccKbn'
			+	' ,ai.AccNo'							// 口座番号
			+	' ,case coalesce(ai.Shubetsu, 0)'		// 振込種別
			+	'   when 0 then ''全銀協FD'''
			+	'   when 1 then ''振込依頼書'''
			+	'   when 2 then ''全銀協FD'''
			+	'   else '''''
			+	'  end as Shubetsu'
			+	' ,case coalesce(ai.RequestKbn, 0)'		// 依頼書電信扱い
			+	'   when 0 then ''電信'''
			+	'   when 1 then ''文書'''
			+	'   else '''''
			+	'  end as RequestKbn'
			+	' ,case coalesce(ai.Shumoku, 0)'		// 取扱種目
			+	'   when 0 then ''総合振込'''
			+	'   when 1 then ''給与振込'''
			+	'   when 2 then ''振込'''
			+	'   when 3 then ''共通'''
			+	'   else '''''
			+	'  end as Shumoku'
			+	' ,case coalesce(ai.FBCodeMode, 0)'		// 半角ｺｰﾄﾞ体系
			+	'   when 0 then ''JIS'''
			+	'   when 1 then ''EBCDIC'''
			+	'   else '''''
			+	'  end as FBCodeMode'
			+	' ,case coalesce(ai.RecordPause, 0)'	// ﾚｺｰﾄﾞ区切
			+	'   when 0 then ''なし'''
			+	'   when 1 then ''CR'''
			+	'   when 2 then ''CR/LF'''
			+	'   else '''''
			+	'  end as RecordPause'
			+	' ,ai.ClientCode'						// 振込依頼人ｺｰﾄﾞ
			+	' ,ai.AccInfo1'							// 振込依頼人名
			+	' ,ai.ClientName'						// ｶﾅ振込依頼人名
			+	' ,ai.FileName'							// ﾌｧｲﾙ名
			+	' ,ai.VolName'							// ﾎﾞﾘｭｰﾑ名
			+	' ,case coalesce(ai.AccZanLimit, 0)'	// 総合振込出力方式 <103>
			+	'   when 0 then ''固定長'''
			+	'   when 1 then ''XML'''
			+	'   else '''''
			+	'  end as AccZanLimit'
			+	' ,ai.AccMemo'							// メモ<20200707>Add
			+	' FROM BankInfo bi'
			+	' LEFT OUTER JOIN AccInfo ai '
			+	' ON ( bi.MasterKbn = 21 AND bi.NCode = ai.BankNCode ) '
			+	' WHERE bi.RdelKbn = 0';

	if	m_nOrderDivision = 0 then				// 範囲指定: 0=ｺｰﾄﾞ順
	begin
		strSQL := strSQL
			+	' ORDER BY bi.AllBkCode, bi.AllBraCode';
	end
	else										// 範囲指定: 1=連想順
	begin
		strSQL := strSQL
			+	' ORDER BY bi.Renso, bi.AllBkCode, bi.AllBraCode';
	end;

	Result := strSQL;
end;
//↑<MLXHAP>

// <093> ADD-STR
//*****************************************************************************
//	Process			:	債務共通INIファイルから設定値を取得する
//	Name			:	T.SATOH(GSOL)
//	Date			:	2013/05/01
//	Parameter		:	sSection 	: String
//						sKey 		: String
//	Return			:	設定値
//	History			:	YYYY/MM/DD
//*****************************************************************************
function TJNTCRP008002f.GetPayCommonValue(sSection, sKey: String): String;
const
    APG_FILE = 'MAS\PRG\PayControl.APG';
var
	_pRec       : ^TMjsAppRecord;
	cComArea    : rcCOMMONAREA;
	sPath       : String;
	sFile       : String;
    oIniFile    : TIniFile;
begin
    Result := '';

	_pRec := pointer(m_pRec);
	cComArea := rcCOMMONAREA(_pRec^.m_pCommonArea^);

	sPath := cComArea.SysRoot;
    if not IsPathDelimiter(sPath, Length(sPath)) then sPath := sPath + '\';

    sFile := sPath + APG_FILE;

    if FileExists(sFile) then
    begin
        oIniFile := Nil;
        try
            oIniFile := TIniFile.Create(sFile);
            Result := oIniFile.ReadString(sSection, sKey, '');
        finally
            if Assigned(oIniFile) then oIniFile.Free;
        end;
    end;
end;
// <093> ADD-END

// <TX26> ADD-STR
//*****************************************************************************
//	Process			:	新手数料ポップアップメニュークリックイベント
//	Name			:	T.SATOH(GSOL)
//	Date			:	2013/08/01(
//	Parameter		:	Sender 	: TObject
//	Return			:
//	History			:	YYYY/MM/DD
//*****************************************************************************
procedure TJNTCRP008002f.fnPopupMenuNewfeeOnClick(Sender: TObject);
var
	cDialogStdFee: TJNTCRP008002_3f;
	cDialogFeeReg: TJNTCRP008002_9f;
	cDialogFeeCnv: TJNTCRP008002_8f;
begin
    if (TControl(Sender).Name = 'popitmStdFee') then
    begin
        // 新手数料標準
        cDialogStdFee := TJNTCRP008002_3f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect, @_StandardFee, True);

        cDialogStdFee.ShowModal ();

        cDialogStdFee.Close ();
        cDialogStdFee.Free  ();
    end
    else if (TControl(Sender).Name = 'popitmBankFee') then
    begin
        // 新手数料登録
        cDialogFeeReg := TJNTCRP008002_9f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect, @_StandardFee);

        cDialogFeeReg.ShowModal ();

        cDialogFeeReg.Close ();
        cDialogFeeReg.Free  ();
    end
    else if (TControl(Sender).Name = 'popitmFeeImp') then
    begin
        // 新手数料取込
        cDialogFeeCnv := TJNTCRP008002_8f.fnCreateDialog (Pointer (m_pRec), Self, m_cDBSelect);

        if (cDialogFeeCnv.ShowModal() = mrOK) and (CmnPanelClientDetail.Visible) then
            // 取り込み(データなし含む)が完了し、詳細画面の場合は銀行コードにフォーカス
            CmnEdit00001BkCode.SetFocus;

        cDialogFeeCnv.Close ();
        cDialogFeeCnv.Free  ();
    end;
end;

procedure TJNTCRP008002f.CmnEdit01049StartYMDExit(Sender: TObject);
begin
//    if (CmnEdit01049StartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(CmnEdit01049StartYMD.Value)) then	// <097> MOD コントロール名変更		<#NGEN>
    if (CmnEdit01049StartYMD.Value <> 0) and (not MjsDateCtrl.MjsIntYMDChk(CmnEdit01049StartYMD.AsIntYM)) then	// <#NGEN>
    begin
        // 不正日付不可
        Beep ();
        CmnEdit01049StartYMD.SetFocus  ();	// <097> MOD コントロール名変更
        Abort ();
    end;
// <097> ADD↓
	// 日付が変わっていたら、変更フラグを立てる
	if (m_DateStartYMD <> CmnEdit01049StartYMD.AsDateTime) then
	begin
		fnSetChangeFlagCheckItems(Sender, TRUE);
	end;
// <097> MOD↑
end;
// <TX26> ADD-END

//↓<CDCHG>
//************************************************************************
//		Component	: BCodeChange
//		Event		: Click
//		Memo		: コード変更ボタン押下時
//************************************************************************
procedure TJNTCRP008002f.BCodeChangeClick(Sender: TObject);
var
	DlgForm			:	TJNTCRP008002_ChgDlgF;		// コード変更ダイアログ
	iBankCode		:	Integer;					// 銀行コード起動時保持用
	iBranchCode		:	Integer;                    // 支店コード起動時保持用
	sMsg			:	String;						// 銀行⇔支店 文言切替用
	sInfoMsg		:	String;						// 確認メッセージ作成用

  	BM				:	TBookMark;					// グリッドのブックマーク

    nBankNCode		:	Extended;					// 変更前の銀行内部コード格納用
    IsGrd			:	Boolean;					// グリッド画面でツリーの銀行ノードがさわられた状態で実行されたかフラグ
    IsParent		:	Boolean;                    // 銀行コード変更で、グリッド画面でツリーの銀行ノードがさわられた状態で実行されたかフラグ
    nCount			:	Integer;					// ツリーアイテムの件数

    moveBkCode		:	Integer;					// 変更後の銀行コード
    moveBrCode		:	Integer;                    // 変更後の支店コード
begin
	IsGrd	:= False;
    IsParent:= False;

    nBankNCode := 0;

// カード型画面からの起動
	if CmnPanelClientDetail.Visible then
    begin
    	// 銀行ｺｰﾄﾞ変更
    	if B_CodeChange.Caption = BCHG_CAP_BANK then
        begin
            // 未登録の銀行なら抜ける
            nBankNCode := fnGetNCode(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);
            if nBankNCode = 0 then
            begin
                Exit;
            end;

            // 選択状態にする
			fnCmnExit(CmnEdit00001BkCode);
            fnCmnFunctionOnEnter(CmnEdit00001BkCode);

            sMsg		:= '銀行';
            iBankCode	:= CmnEdit00001BkCode.AsInteger;
            iBranchCode	:= -1;
        end
    	// 支店ｺｰﾄﾞ変更
        else
        begin
            // 未登録の支店なら抜ける
            nBankNCode := fnGetNCode(CmnEdit00001BkCode.AsInteger,CmnEdit00002BrCode.AsInteger);
            if nBankNCode = 0 then
            begin
                Exit;
            end;

            // 選択状態にする
			fnCmnExit(CmnEdit00002BrCode);
            fnCmnFunctionOnEnter(CmnEdit00002BrCode);

            sMsg		:= '支店';
            iBankCode	:= CmnEdit00001BkCode.AsInteger;
            iBranchCode	:= CmnEdit00002BrCode.AsInteger;
        end;
    end
// グリッド型画面からの起動
    else
    begin
    	if CmnMemDataHojyoMA.State = dsInsert then
        begin
        	Exit;
        end;

		BM	:= CmnMemDataHojyoMA.GetBookmark;

    	// 銀行ｺｰﾄﾞ変更
    	if B_CodeChange.Caption = BCHG_CAP_BANK then
        begin
            sMsg		:= '銀行';
            iBankCode	:= CmnMemDataHojyoMAnBKCODE.AsInteger;
            iBranchCode	:= -1;

            // グリッド型画面で、ツリーをさわられて起動された かつ 銀行にフォーカスが当たっていた場合は、
            // ツリービューから銀行コードを取得する。グリッドにフォーカスがあるコードも取得してしまうので。
	        if	(m_cACControl = CmnTreeView) and ((PTreeViewRec (CmnTreeView.Selected.Data)^.nItemDivision = 0)) then
	        begin
            	IsGrd		:= True;
            	iBankCode	:= PTreeViewRec (CmnTreeView.Selected.Data)^.nBkCode;
	        end;
        end
    	// 支店ｺｰﾄﾞ変更
        else
        begin
            nBankNCode := fnGetNCode(CmnMemDataHojyoMAnBKCODE.AsInteger,CmnMemDataHojyoMAnBraCode.AsInteger);

            sMsg		:= '支店';
            iBankCode	:= CmnMemDataHojyoMAnBKCODE.AsInteger;
            iBranchCode	:= CmnMemDataHojyoMAnBraCode.AsInteger;
        end;
    end;

    if  (B_CodeChange.Caption = BCHG_CAP_BANK)
    and (m_cACControl = CmnTreeView)
    and ((PTreeViewRec (CmnTreeView.Selected.Data)^.nItemDivision = 0)) then
    begin
        IsParent	:= True;
    end;

	DlgForm		:= TJNTCRP008002_ChgDlgF.CreateDialog(Self,m_pRec,m_cDBSelect,m_Base_pRec,m_cJNTArea);

	if DlgForm = Nil then
		abort;

	try
		DlgForm.iBankCode		:= iBankCode;
		DlgForm.iBranchCode		:= iBranchCode;

        DlgForm.exBfBankNCode	:= nBankNCode;

		try
			if DlgForm.ShowModal <> mrOk then
				exit;

// カード型画面からの起動
            if CmnPanelClientDetail.Visible then
            begin
                // 銀行ｺｰﾄﾞ変更
                if B_CodeChange.Caption = BCHG_CAP_BANK then
                begin
                	CmnEdit00001BkCode.Value	:= Trunc(DlgForm.ECode.Value);
                    CmnEdit00003BkName.Text		:= DlgForm.EName.Text;
                    CmnEdit00004BkKana.Text		:= DlgForm.EKana.Text;
                    CmnEdit00007NMK.Text		:= DlgForm.EName.Text + '/' + CmnEdit00005BrName.Text;
                end
                // 支店ｺｰﾄﾞ変更
                else
                begin
                	CmnEdit00002BrCode.Value	:= Trunc(DlgForm.ECode.Value);
                    CmnEdit00005BrName.Text		:= DlgForm.EName.Text;
                    CmnEdit00006BrKana.Text		:= DlgForm.EKana.Text;
                    CmnEdit00007NMK.Text		:= CmnEdit00005BrName.Text + '/' + DlgForm.EName.Text;
                end;
            end
// グリッド型画面からの起動
            else
            begin
                // 銀行ｺｰﾄﾞ変更
                if B_CodeChange.Caption = BCHG_CAP_BANK then
                begin
                	try
                    	m_fUnderConstruction := True;
                        CmnMemDataHojyoMA.DisableControls;
                        CmnMemDataHojyoMA.First;

                        while not CmnMemDataHojyoMA.EOF do
                        begin
                        	// 銀行コードが変更前と同じレコードの情報を置き換える。
                        	if CmnMemDataHojyoMAnBKCODE.AsInteger = DlgForm.iBankCode then
                            begin
                            	CmnMemDataHojyoMA.Edit;

                                CmnMemDataHojyoMAnBKCODE.Value		:= DlgForm.ECode.AsInteger;
                                CmnMemDataHojyoMAName.AsString		:= DlgForm.EName.Text;
                                CmnMemDataHojyoMAstrBkKana.AsString	:= DlgForm.EKana.Text;

                                CmnMemDataHojyoMAorderCODE.AsFloat	:= CmnMemDataHojyoMAnBKCODE.Value * 1000 + CmnMemDataHojyoMAnBraCode.Value * 100;

                            	CmnMemDataHojyoMA.Post;
                            end;
                            CmnMemDataHojyoMA.Next;
                        end;
                    finally
                    	m_fUnderConstruction := False;

						CmnMemDataHojyoMA.SortedField	:= '';
						CmnMemDataHojyoMA.SortedField	:= 'orderCODE';
						CmnMemDataHojyoMA.SortedField	:= '';

						CmnMemDataHojyoMA.GotoBookmark(BM);
						CmnMemDataHojyoMA.FreeBookmark(BM);

                        CmnMemDataHojyoMA.EnableControls;

                        if IsGrd then
                        begin
                            m_fUnderConstruction := True;
                            CmnMemDataHojyoMA.DisableControls;
                            CmnMemDataHojyoMA.First;
                            while not CmnMemDataHojyoMA.EOF do
                            begin
                                // 銀行コードが変更後の先頭支店に移動。
                                if CmnMemDataHojyoMAnBKCODE.AsInteger = DlgForm.ECode.AsInteger then
                                begin
                                	break;
                                end;
                                CmnMemDataHojyoMA.Next;
                            end;
                            m_fUnderConstruction := False;

	                        CmnMemDataHojyoMA.EnableControls;
                        end;
                    end;
                end
                // 支店ｺｰﾄﾞ変更
                else
                begin
                	try
                    	m_fUnderConstruction := True;
                        CmnMemDataHojyoMA.DisableControls;

                        // 新規コード
                        if DlgForm.bNewCode then
                        begin
                        	// グリッドの支店情報を変更後にする。
                            CmnMemDataHojyoMA.Edit;
                            CmnMemDataHojyoMAnBraCode.Value		:= Trunc(DlgForm.ECode.Value);
                            CmnMemDataHojyoMAstrBrName.Text		:= DlgForm.EName.Text;
                            CmnMemDataHojyoMAstrBrKana.Text		:= DlgForm.EKana.Text;
                            CmnMemDataHojyoMAorderCODE.AsFloat	:= CmnMemDataHojyoMAnBKCODE.Value * 1000 + CmnMemDataHojyoMAnBraCode.Value * 100;
                            CmnMemDataHojyoMA.Post;
                        end
                        // 既存コード
                        else
                        begin
                        	// 変更前の支店を削除するとき
                       		if DlgForm.bDelCode then
                            begin
                            	// グリッドから変更前の支店を削除
                        		CmnMemDataHojyoMA.Delete;
								CmnMemDataHojyoMA.FreeBookmark(BM);

                                // 統合後の場所にメモデータを移動
                                CmnMemDataHojyoMA.Locate('nBKCODE;nBrCode',VarArrayOf([iBankCode,DlgForm.ECode.Value]),[]);

								BM	:= CmnMemDataHojyoMA.GetBookmark;
                            end;
                        end;

                    finally
                    	m_fUnderConstruction := False;

						CmnMemDataHojyoMA.SortedField	:= '';
						CmnMemDataHojyoMA.SortedField	:= 'orderCODE';
						CmnMemDataHojyoMA.SortedField	:= '';

						CmnMemDataHojyoMA.GotoBookmark(BM);
						CmnMemDataHojyoMA.FreeBookmark(BM);

                        CmnMemDataHojyoMA.EnableControls;
                    end;
                end;
            end;


            // 確認メッセージを出力

            sInfoMsg :=  '依頼先' + sMsg + 'のコード変更は、正常に終了しました。';

            // Gali/GaliNX-Iのみ
            if not TMSeries.IsMjsLink3 then
            begin
                if m_bSaimu or m_bKeihi then
                begin
	                sInfoMsg := sInfoMsg + #13#10 + 'コードの変更により、手数料金額の判定が変わる可能性があります。';
				end;

                if m_bSaimu and not m_bKeihi then
                begin
                	// 債務○、経費精算×
                	sInfoMsg := sInfoMsg + #13#10 + '取引先登録の支払情報の手数料計算区分を確認してください。';
                end
                else if not m_bSaimu and m_bKeihi then
                begin
                	// 債務×、経費精算○
                	sInfoMsg := sInfoMsg + #13#10 + '経費精算情報の手数料計算区分を確認してください。';
                end
                else if m_bSaimu and m_bKeihi then
                begin
                	// 債務○、経費精算○
                	sInfoMsg := sInfoMsg + #13#10 + '取引先登録の支払情報、経費精算情報の手数料計算区分を確認してください。';
                end;
            end;

            // 支店のコード変更かつ、統合
			if (B_CodeChange.Caption = BCHG_CAP_BRANCH) and (not DlgForm.bNewCode) then
    	    begin
              	sInfoMsg := sInfoMsg + #13#10 + '支店が統合されたので、口座管理情報を見直してください。';
            end;

            sInfoMsg := sInfoMsg + #13#10 + '必要であれば、振込銀行情報でもコード変更を行ってください。';

			MjsMessageBox(Self,sInfoMsg,mjInformation,mjDefOk);


            // ツリーを再作成
            fnRebuildTreeViewItems();

            // グリッド型のときは、口座グリッドも再描画。
            if CmnPanelClientStandard.Visible then
            begin
				fnRebuildGridAccInfo(CmnMemDataHojyoMAnCODE.AsFloat);
            end;

		except
			MjsMessageBox(Self,sMsg+'のコード変更に失敗しました。',mjError,mjDefOk);
		end;
	finally
		DlgForm.Release;

        // ツリービューは、変更後の位置を選択状態にさせる
        m_fUnderConstruction := True;
        if CmnPanelClientStandard.Visible then
        begin
            moveBkCode	:= CmnMemDataHojyoMAnBKCODE.AsInteger;
            moveBrCode	:= CmnMemDataHojyoMAnBraCode.AsInteger;
        end
        else
        begin
            moveBkCode	:= CmnEdit00001BkCode.AsInteger;
            moveBrCode	:= CmnEdit00002BrCode.AsInteger;
        end;

        for	nCount := 0 to CmnTreeView.Items.Count - 1 do
        begin
        	if IsParent then
            begin
            	if (PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBkCode = moveBkCode) then
                begin
                	CmnTreeView.Items [nCount].Selected := True;
                    break;
                end;
            end
            else
            begin
            	if (PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBkCode = moveBkCode)
                and (PTreeViewRec (CmnTreeView.Items [nCount].Data)^.nBrCode = moveBrCode) then
                begin
                	CmnTreeView.Items [nCount].Selected := True;
                    break;
                end;
            end;
        end;
        m_fUnderConstruction := False;

        // 選択したノードに対してOnChangeを発行
		fnCmnTreeViewOnChange(CmnTreeView,CmnTreeView.Items [nCount]);

        // コンポーネントにフォーカス
		MjsSetFocus(Self,m_cACControl.Name);

        // フォーカス後コンポーネントに応じたOnEnterを発行
        if m_cACControl = CmnGridHojyoMA then
        begin
        	// グリッド
	        fnCmnGridHojyoMAOnEnter(m_cACControl);
        end
        else if (m_cACControl = CmnEdit00001BkCode) or (m_cACControl = CmnEdit00002BrCode) then
        begin
        	// カード画面の銀行or支店コード
        	fnCmnFunctionOnEnter(m_cACControl);
        end
        else if m_cACControl = CmnTreeView then
        begin
        	// ツリー
        	fnCmnTreeViewOnEnter(CmnTreeView);
        end;
	end;
end;

//******************************************************************************
//	Component	: CmnTreeView
//	Event		: Exit
//	Memo		: ツリー部から抜けるとき
//******************************************************************************
procedure TJNTCRP008002f.CmnTreeViewExit(Sender: TObject);
begin
	// コード変更のボタンは非表示
	B_CodeChange.Visible := False;
end;

//******************************************************************************
//	Component	: CmnGridHojyoMA
//	Event		: Exit
//	Memo		: 銀行情報のグリッドから抜けるとき
//******************************************************************************
procedure TJNTCRP008002f.CmnGridHojyoMAExit(Sender: TObject);
begin
	// コード変更のボタンは非表示
	B_CodeChange.Visible := False;
end;
//↑<CDCHG>

end.

//***********************************************************************************************************/
//*																											*/
//* End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/


