//************************************************************************
//*
//*		Systeme			:	新会計システム
//*		Program			:	補助登録
//*		ProgramID		:	JNTCRP008001
//*		Name			:	S.Suzuki（AP開発）
//*		Create			:	2000/08/03
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	00/12/21 HIS0001  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						PopupMenuの合計補助追加(CmnTreeViewPopupMenuAddTotal),
//*						実在補助追加(CmnTreeViewPopupMenuAddExist)をPopupMenu
//*						から削除する
//*	00/12/28 HIS0002  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						印刷時にﾍﾟｰｼﾞの最終明細行の下線を太する
//*	01/1/5	 HIS0003  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						帳票ｸﾞﾙｰﾌﾟNoをPrnSupportへ渡す
//*	01/1/5	 HIS0004  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						HojyoMAに内部ｺｰﾄﾞ2がのﾌｨｰﾙﾄﾞが追加されたのでその対応
//*	01/1/9	 HIS0005  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ﾒｰﾙ会計で登録あり・なしによって参照・入力を切り替える
//*	01/1/10	 HIS0006  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						KmkTree2を呼ぶ処理
//*	01/1/11	 HIS0007  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ﾌｧｲﾙ出力変更
//*	01/1/30	 HIS0008  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ｽﾄｱﾄﾞの初期処理
//*
//* 2002/04/17 HIS0009  Y.Ichihashi	Insert文の変更（''を含めて書き込むとエラーになるため）
//* 2002/04/18 HIS0010  Y.Ichihashi	UpDate文の変更（''を含めて書き込むとエラーになるため）
//* 2002/04/18 HIS0011  Y.Ichihashi	ﾌﾘｰｺｰﾄﾞのとき右のスペースはｶｯﾄする。
//* 2002/04/23 HIS0012  Y.Ichihashi	同一ｺｰﾄﾞのときエラーメッセージを表示する
//* 2002/04/25 HIS0013	Y.Ichihashi	詳細画面で更新ボタンを押した後、更新されているが表示が
//*									反映されておらずTreeのSelectされているものが表示されているので
//*                                 詳細画面からｺｰﾄﾞと実在/合計区分を取得するように追加
//* 2002/04/25 HIS0014	Y.Ichihashi	Drag＆Dropでチェック処理をしていないのでチェック処理を追加
//* 2002/04/25 HIS0015  Y.Ichihashi	BeforePostを呼ばれるとTreeがFullExpandするので修正
//* 2002/04/25 HIS0016  Y.Ichihashi	POPUPメニューを表示するときにレコードが0件でも表示しようとしていたのを制御
//* 2002/04/25 HIS0017  Y.Ichihashi	他の加算先へｺﾋﾟｰした後、どちらかを加算しないとしたときは削除するように修正
//* 2002/06/04 HIS0018	Y.Ichihashi	HIS0014の追加修正
//*	2002/06/05 HIS0019	Y.Ichihashi	郵便番号検索ｴｸｽﾌﾟﾛｰﾗでAlt+↓をしたとき、
//*									ﾌｫｰｶｽ移動しないように制御
//*	2002/06/05 HIS0020	Y.Ichihashi	HIS0015の追加修正でTreeの+がとじているときは
//*									追加した部分だけ開くように修正
//* 2002/06/24 HIS0021	Y.Ichihashi	DragOverでﾀｰｹﾞｯﾄ先にｾﾚｸﾄされたコードとノードが同じだったら移動不可
//*	2002/06/25 HIS0022	Y.Ichihashi	加算情報で不整合があった時、削除。
//*	2002/06/25 HIS0023  Y.Ichihashi 加算情報での不整合を削除した時のﾒｯｾｰｼﾞ
//*	2002/06/24 HIS0024	Y.Ichihashi	同じコードが存在するコードに子供を作った時に、片方しか
//*									子供ができなくなっていたので、両方作成できるように修正
//* 2002/08/28 HIS0025	Y.Ichihashi 得意先、仕入先それぞれ採用されているもののみデータのチェックをする
//* 2002/08/28 HIS0026	Y.Ichihashi	取引先詳細情報への登録の仕方を変更
//* 2002/08/30 HIS0027	Y.Ichihashi	取引先詳細情報での郵便番号の表示のされ方がおかしかったので修正
//*	2002/09/10 HIS0028	Y.Ichihashi	Treeで合計をｸﾘｯｸしてPOPUPﾒﾆｭｰで詳細画面を表示して更新ﾎﾞﾀﾝを押した時、
//*									加算先、加算元が同じｺｰﾄﾞで登録されてしまうので、同じｺｰﾄﾞのときは
//*									HojyoMAでｺｰﾄﾞが存在していたら、登録しないように制御
//*	2002/09/18 HIS0029	Y.Ichihashi	入力制御
//* 2002/10/07 HIS0030	Y.Ichihashi	社員での所属部門を登録・変更・印刷できるように追加
//* 2002/10/09 HIS0031	Y.Ichihashi	ファイル出力で取引先ではないときに余計なものまで出力されるのを修正
//*	2002/11/25 HIS0032	Y.Ichihashi	詳細画面でのコードのコンポーネントで検索エクスプローラで選択できるように対応
//*	2002/12/09 HIS0033	Y.Ichihashi	Treeクリック時にプログレスバーを表示
//* 2002/12/09 HIS0034	Y.Ichihashi	初期表示時にプログレスバーを表示
//*	2002/12/11 HIS0034	Y.Ichihashi	得意先、仕入先での締日のフォーカス移動の修正
//*	2002/12/11 HIS0035	Y.Ichihashi	得意先選択時で更新ボタンを押すとエラーになるのを修正
//*	2003/01/06 HIS0036	Y.Ichihashi	各部署で共通補助諸口を登録すると整合性の問題が発生するので、
//*                                	部署側での諸口補助の登録は出来ないようにする。
//*	2003/01/14 HIS0037	Y.Ichihashi	新規登録されたときにメッセージを出すようにする（出力順序登録などの見直しが必要な為）
//* 2003/03/25 HIS0038  Y.Ichihashi 未接続アイテムが存在するときにHojyoTreeに1件もレコードがないときに
//*                                 処理が抜けてしまうのを修正
//* 2003/03/25 HIS0039  Y.Ichihashi Treeにコードを表示する
//* 2003/06/27 HIS0040  Y.Ichihashi 排他制御
//* 2003/10/07 HIS0041  Y.Ichihashi 「並び替え」ボタン追加
//* 2003/12/16 HIS0042  Y.Ichihashi 得意先、仕入先の採用チェックを指定して印刷するように対応
//* 2004/01/20 HIS0043  Y.Ichihashi HIS0040の排他制御で仕様変更のため対応
//* 2004/01/28 HIS0044  Y.Ichihashi 与信限度額でMAXで金額を入力して保存するとゴミるため
//*                                 金額の取得をCureency型に変更
//* 2004/06/25 HIS0045  Y.Ichihashi 検索処理対応
//* 2004/09/02 HIS0046  Y.Ichihashi DBでのHojyoTreeのデータがおかしくなってしまうことがあるので、
//*                                 Shiftを押しながら削除ボタンが押された時、Hojyotree,HojyoTree2を削除して再作成するように修正
//*
//*			   SpeedTest			スピードアップ
//*
//* <001>   高橋功二(LEAD)  2005/08/19(FRI) JNTCommonを親から引き継ぐように修正
//* <PRN>   飯塚健介(LEAD)  2005/08/26(FRI) 印刷機能実装
//* <002>   飯塚健介(LEAD)  2005/08/31(WED) ﾌｧﾝｸｼｮﾝ機能実装
//* <KEY>   飯塚健介(LEAD)  2005/09/02(FRI) 強制ｷｰｲﾍﾞﾝﾄ
//* <PEF>   飯塚健介(LEAD)  2005/09/13(TUE) ﾌﾟﾘﾝﾀｰ使用不可
//* <003>   広田茂雄(PRIME) 2005/10/17(MON) ESCｷｰで終了できるように修正
//* <004>   加藤香織(PRIME) 2005/11/30(WED) 履歴用ｽﾄｱﾄﾞ呼び出し
//* <005>   加藤香織(PRIME) 2005/11/30(WED) 簡略名称が未入力の時に連想に簡略名称がｺﾋﾟｰされる不具合修正
//* <006>   広田茂雄(PRIME) 2005/12/14(WED) ﾌﾟﾚﾋﾞｭｰ中の終了処理修正
//* <007>   青木由香(PRIME) 2006/03/09(THU) 諸口から新規ｺｰﾄﾞ入力時のEdit有効無効設定
//* <008>   青木由香(PRIME) 2006/03/09(THU) 詳細画面でTabを変更した場合にｸﾞﾘｯﾄﾞを表示しないように対応
//* <CHK>   加藤香織(PRIME) 2006/03/16(THU) 削除ﾁｪｯｸ対応
//* <   >   加藤香織(PRIME) 2006/03/24(FRI) ｺｰﾄﾞEditのArrowTypeなど見た目を修正
//* <009>   加藤香織(PRIME) 2006/03/24(FRI) 詳細画面のｷｰ動作修正
//* <010>   加藤香織(PRIME) 2006/03/24(FRI) ｺｰﾄﾞがﾌﾘｰ属性の時にﾂﾘｰの合計銀行で右ｸﾘｯｸした時の不具合修正
//* <011>   加藤香織(PRIME) 2006/03/29(WED) ｸﾞﾘｯﾄﾞにF8 正式名称ｺﾋﾟｰが表示されない不具合修正
//* <012>   小林孝子        2006/07/07(FRI) 全銀行と支店の間に'-'を入れた
//* <013>   高橋功二(LEAD)  2006/09/19(TUE) ﾊﾞｲﾝﾄﾞ変数を修正(nMasterDivision→nMasterKbn)
//* <014>   高橋功二(LEAD)  2007/01/25(THU) ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一) Ver1.07正式版(2007/2)にてﾘﾘｰｽ
//* <015>   茂木勇次(LEAD)  2007/03/22(THU) ﾏｽﾀ同期対応(ｸﾞﾙｰﾌﾟ会社管理対応)
//* <016>   茂木勇次(LEAD)  2007/03/23(FRI) 起動時に諸口ｷｬﾝｾﾙ等で、情報を表示しない場合に、並び替え&検索ﾎﾞﾀﾝが
//*                                         使用可能状態となり、検索ﾎﾞﾀﾝを押下するとｴﾗｰが発生する不具合対応。
//* <017>   茂木勇次(LEAD)  2007/03/28(WED) 汎用補助と同様に更新権限有無の判別条件を変更。
//* <018>   茂木勇次(LEAD)  2007/03/29(THU) Screen.ActiveControl.Nameで判定している部分でｱﾄﾞﾚｽ違反が発生している不具合対応。
//* <019>   茂木勇次(LEAD)  2007/03/29(WED) 参照ﾓｰﾄﾞの場合、「並び替え」ﾎﾞﾀﾝを使用不可とする。
//* <020>   茂木勇次(LEAD)  2007/04/13(FRI) 合計情報の詳細で付箋が付加できない(使用不可となっている)
//* <021>   茂木勇次(LEAD)  2007/04/13(FRI) 合計情報(ｸﾞﾘｯﾄﾞ)、新規ﾛｰで付箋ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰを起動させると「""は整数ではありません」のｴﾗｰが発生する不具合対応。
//* <022>   茂木勇次(LEAD)  2007/04/13(FRI) 実在情報(ｸﾞﾘｯﾄﾞ)、付箋備考ｺﾒﾝﾄが表示されない不具合対応。
//* <023>   茂木勇次(LEAD)  2007/04/13(FRI) 「ﾊﾞﾘｱﾝﾄの型変換が不正です」のｴﾗｰへの対処。
//* <024>   茂木勇次(LEAD)  2007/05/06(SUN) 処理終了時に、ｸﾞﾙｰﾌﾟ会計を行っている場合は、一括配信DLGを呼出。
//* <025>   茂木勇次(LEAD)  2007/05/06(SUN) ｸﾞﾙｰﾌﾟ会計採用時に、追加・更新・削除を行った後、SecHojyoDispInfoのﾒﾝﾃを行う。
//* <026>   茂木勇次(LEAD)  2007/05/06(SUN) HojyoMAの問合せで条件が内部ｺｰﾄﾞのみのものに関して、ﾏｽﾀ区分も条件に追加する。
//* <027>   茂木勇次(LEAD)  2007/06/06(WED) 諸口登録時の場合に、SecHojyoDispInfoのﾒﾝﾃを行うように修正。
//* <028>   茂木勇次(LEAD)  2007/06/06(WED) 全社でも一括配信DLGを呼出。
//* <029>   鈴木敏史(PRIME) 2007/08/01(WED) 親側で決算確定済みのメッセージを出すので、子の方はメッセージを出さないように修正
//* <030>   鈴木敏史(PRIME) 2007/08/09(THU) 初期処理で失敗しても終了できるように修正
//* <031>   鈴木敏史(PRIME) 2007/08/09(THU) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//* <032>   鈴木敏史(PRIME) 2007/12/10(MON) ﾏｽﾀ更新履歴対応
//* <033>   鈴木敏史(PRIME) 2008/01/08(TUE) HojyoTreeの履歴対応
//* <034>   大竹文顕(LEAD)  2008.03.15(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//* <DKAI>  難波(LAB)       2008.08.27(WED) 名称に改行が入らないようにする
//*	<035>   佐藤(IDC)       2009/02/03(TUE) 債務/経費精算で自動仕訳申請済みは修正不可
//*	<036>   佐藤(IDC)       2009/02/03(TUE) <CHK>修正時、削除ボタンのみでツリービューへの対応が漏れていた
//*-ver3.01差分/ver302-------------------------------
//* <037>   吉澤            2009.05.27(WED) GWC-0189　項目名称情報で登録した名称がフリー項目の名称に反映されない点の修正
//* <LPH>   T.SATOH(IDC)    2010.05.21(FRI) MLBplLoader対応(LoadPackageの置き換え)
//*-ver4.01修正内容-------------------------------
//* <038>   T.Ogawa(RIT)    2010.08.02(MON) マシン環境によって適用期間が空白で更新するとキャストエラーが発生する不具合修正。
//*                                         更新ボタンクリック時に例外エラーをキャッチして、メッセージボックスを表示する。
//* <039>   T.SATOH(IDC)    2010.09.17(FRI) 削除された依頼先銀行が表示されている不具合を修正
//*-ver4.06修正内容-------------------------------
//* <040>   S.Otahara(MSI)  2011.05.12(THU) 印刷モジュールをUnLoadしていなかった点を修正
//* <041>   G.Kojima(MSI)	2011.06.13(MON) 自動仕訳のWF申請中はメッセージを表示
//*	<042>   G.Kojima(MSI)   2011.06.29(WED) BeforePrint対応(CmnReportSystemのBeforePrintイベント追加)
//*-ver4.08 / NX-Ⅰ5.01修正内容-------------------------------
//* <Shift> T.Ogawa(LEAD)   2012.02.08(WED) KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//
//*-ver4.09 / NX-Ⅰ5.02修正内容-------------------------------
//* <043>   T.Ogawa(LEAD)   2012.05.08(TUE) 詳細画面から一覧画面に切り替える場合、一覧画面のタブは詳細画面で選択されているタブに従い表示する。
//*-MLX 固定資産 修正内容-------------------------------------
//*	<MLXDEP>K.Iwata(NTC)	2013.01.15(TUE) MLXリース対応
//* <MLXDEP-2>K.Yoshida(MJS)2013.01.25(FRI) 削除時に財務・債務のﾁｪｯｸｽﾄｱﾄﾞが流れないように修正、MLXは諸口を登録させないように対応
//* <MLXDEP-3>K.Yoshida(MJS)2013.02.08(FRI)	銀行辞書対応
//*											・MLXリースの時に全銀協コードのEXPの参照先を変更Bankinfoを経由せず、CMN_BANK、CMN_BANK_OFFICEもしくはDIC_BANKと直接関連づける。
//*											・MLXリースの時のみHOJYOMA.Yobi09をこの関連づけのためのフィールドとして使用します。
//*											・MLXリースの時のみHOJYOMA.VFree1を全銀協の銀行名の格納場所として使用HOJYOMA.VFree2を全銀協の支店名として使用　
//*											・RequiresのMjsDictionaryを削除、MjsDictionaryを新規に追加
//* <MLXDEP-4>T.Kuramochi(NTC)2013.02.15(FRI) MLXリースの時は、銀行体系ツリーや詳細表示等の機能がないので｢F3｣キー押下時の検索Expは表示しないように修正。
//* <MLXDEP-5>iwata(NTC)2013.06.13(THU) MLXリースの時は、更新日付は編集した文字列を登録する。
//*
//*-ver4.12 / NX-Ⅰ5.05修正内容-------------------------------
//* <044>   T.Ogawa(LEAD)   2013.01.09(WED) 更新ボタン押下時、全銀コードが間違っているときのメッセージがよろしくない対応。
//
//*-ver4.15 / NX-Ⅰ5.10修正内容-------------------------------
//* <045>   T.Ogawa(LEAD)   2015.10.13(TUE) 一覧から全銀協コードをクリアしてもDBに反映されていなかった不具合対応
//* <046>   T.Ogawa(LEAD)   2015.10.13(TUE) 「0：諸口」の場合、フリー項目ダイアログが呼び出せなかった点を修正
//* <047>   T.Ogawa(LEAD)   2015.11.11(WED) フリー項目ダイアログにて入力した内容が再度呼び出したときにクリアされてしまう不具合対応。
//* <048>   T.Ogawa(LEAD)   2015.11.11(WED) フリー項目の日付を削除して更新しても削除されていない不具合対応
//* <FREEINIT>   T.Ogawa(LEAD)   2016.01.18(MON) 複数画面起動時にフリー項目ダイアログの起動制御が正しく行われていない不具合対応
//* <049>   T.Ogawa(LEAD)   2016.01.27(WED) <047>の対応でフリー項目が更新されない場合がある点の修正
//
//*-ver4.17 / NX-Ⅰ5.12 / NX-Plus 1.01修正内容-------------------------------
//* <050>   M.Tamura(ALPHA) 2018.09.13(THU) EdgeTracker連携： 銀行を削除した時にメッセージを出す。（連携時のみ）
//
//* <#NGEN> S.Komuro(Admax) 2018.11.12(MON)  新元号対応
//************************************************************************
unit JNTCRP008001u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.StdCtrls, ComCtrls, VCL.ExtCtrls, VCL.ImgList, Menus, ToolWin, CommCtrl,
  ActnList, Db, FireDAC.Comp.Client, dxTL, dxDBGrid, dxCntner, dxGrClms, dxmdaset,

  ppReport, ppCtrls, ppPrnabl, ppClass, ppVar, ppDB, ppDBPipe, ppModule, daDatMod,
  ppBands, ppCache, ppComm, ppRelatv, ppProd,

  MjsPrnSupportu, MjsPrnDlgu, MJSPreviewIFu, MJSTreeView, MJSTab, MJSCheckBox,
  MJSBitBtn, MJSLabel, MJSEdits, MJSSpeedButton, MJSFunctionBar, MJSSPFunctionBar,
  MJSPanel, MJSPageControl, MJSComboBox, MJSGroupBox,

  MJSCommonu, MJSDBModuleu, MJSQuery, MJSDispCtrl, MJSDateCtrl, MJSMsgStdu,
//<MLXDEP-3>  CMNExpFuncU,
  CMNExpFuncExU,	//<MLXDEP-3>
  MLBplLoaderU, // <LPH> ADD
  MJSKeyDataState,  //<Shift> ADD
  JNTCommonu, JNTSelGlobal, JNTMasComu, JNTMasWndIFu, JNTMasTreee2Dlgu,
  JNTFuncU, JNTSelCorpSys,JNTExPGlobal,JNTPDlg,
  SeriesCheckU,//<MLXDEP>

  JNTCRP0080011u, JNTCRP0080012u, JNTCRP0080013u,
  Variants, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer, ppParameter, System.Actions,
  FireDAC.Comp.DataSet, System.ImageList, System.AnsiStrings, MjsStrCtrl;

type
  SelectValidItem = record
    nMasterDivision : Integer;				// ﾏｽﾀ区分 (21:銀行, 22:取引先, 25:社員...)
	strItemCaption  : String;				// 補助名称(実在)
	nCodeDigit      : Integer;				// ｺｰﾄﾞ桁数 (3～10桁)
	nCodeAttribute  : Integer;				// ｺｰﾄﾞ属性 (0:数字, 1:数字(前ｾﾞﾛあり), 2:ﾌﾘｰ)
	nAdoptDivision  : Integer;				// 採用区分 (0:なし, 1:あり)
end;

type
  TreeViewRec = record
    nDivision       : Byte;
    strExCode       : String;
    strName         : String;
    cNCode          : Currency
end;
PTreeViewRec = ^TreeViewRec;                // 2003.02.27 Add


type
  TagInfo = record
	fChecked        : Boolean;
	strComment      : String;
end;

type
  MasterData = record
	nDivision	    : Integer;				// 実在/合計区分
    strExCodeParent : String;				// 補助外部ｺｰﾄﾞ(親)
	cExCodeParent   : Currency;				// 補助内部ｺｰﾄﾞ(親)
    strExCode	    : String;				// 補助外部ｺｰﾄﾞ
	cExCode	        : Currency;				// 補助内部ｺｰﾄﾞ
	strAssociation  : String;				// 連想
	strName		    : String;				// 正式名称
	strNameSimple   : String;				// 簡略名称
	nAssDivision01  : Integer;				// 得意先区分
	nAssDivision02  : Integer;				// 仕入先区分
	fDetails	    : Boolean;				// 詳細更新区分
	dDateStart      : TDateTime;			// 適用開始年月日
	dDateEnd        : TDateTime;		    // 適用終了年月日
    cBankNCode      : Currency;             // 銀行内部コード
	nAssDivision03  : Integer;				// 名寄せ区分
	nClassCode      : Integer;				// 取引先分類
	nLimitPrice	    : Currency;				// 手形割引(与信)限度額     //HIS0044
	nTaxCodeSales   : Integer;				// 売上消費税ｺｰﾄﾞ
	nTaxRateSales   : Integer;				// 売上消費税率
	nTaxCodeStock   : Integer;				// 仕入消費税ｺｰﾄﾞ
	nTaxRateStock   : Integer;				// 仕入消費税率
	nFundCodeDeb01  : Integer;				// (得意先)借方資金繰ｺｰﾄﾞ
	nFundCodeCre01  : Integer;				// (得意先)貸方資金繰ｺｰﾄﾞ
	nFundCodeDeb02  : Integer;				// (仕入先)借方資金繰ｺｰﾄﾞ
	nFundCodeCre02  : Integer;				// (仕入先)貸方資金繰ｺｰﾄﾞ
    cBunruiNCode01  : Currency;             // 銀行分類01内部ｺｰﾄﾞ
    cBunruiNCode02  : Currency;             // 銀行分類02内部ｺｰﾄﾞ
    cBunruiNCode03  : Currency;             // 銀行分類03内部ｺｰﾄﾞ
    cBunruiNCode04  : Currency;             // 銀行分類04内部ｺｰﾄﾞ
    cBunruiNCode05  : Currency;             // 銀行分類05内部ｺｰﾄﾞ
    cBunruiNCode06  : Currency;             // 銀行分類06内部ｺｰﾄﾞ
    cBunruiNCode07  : Currency;             // 銀行分類07内部ｺｰﾄﾞ
    cBunruiNCode08  : Currency;             // 銀行分類08内部ｺｰﾄﾞ
    cBunruiNCode09  : Currency;             // 銀行分類09内部ｺｰﾄﾞ
    cBunruiNCode10  : Currency;             // 銀行分類10内部ｺｰﾄﾞ
    cSegNCode01     : Currency;             // ｾｸﾞﾒﾝﾄ01内部ｺｰﾄﾞ
    cSegNCode02     : Currency;             // ｾｸﾞﾒﾝﾄ02内部ｺｰﾄﾞ
    cSegNCode03     : Currency;             // ｾｸﾞﾒﾝﾄ03内部ｺｰﾄﾞ
    cSegNCode04     : Currency;             // ｾｸﾞﾒﾝﾄ04内部ｺｰﾄﾞ
    cSegNCode05     : Currency;             // ｾｸﾞﾒﾝﾄ05内部ｺｰﾄﾞ
    cSegNCode06     : Currency;             // ｾｸﾞﾒﾝﾄ06内部ｺｰﾄﾞ
    cSegNCode07     : Currency;             // ｾｸﾞﾒﾝﾄ07内部ｺｰﾄﾞ
    cSegNCode08     : Currency;             // ｾｸﾞﾒﾝﾄ08内部ｺｰﾄﾞ
    cSegNCode09     : Currency;             // ｾｸﾞﾒﾝﾄ09内部ｺｰﾄﾞ
    cSegNCode10     : Currency;             // ｾｸﾞﾒﾝﾄ10内部ｺｰﾄﾞ
	Yobi09			: String;				// <MLXDEP-3>予備09	MLXの時に全銀協コードの保存場所として使用
	ZenBankNM		: String;				//<MLXDEP-3>全銀協銀行名として使用
	ZenOfficeNM		: String;				//<MLXDEP-3>全銀協支店名として使用
end;

type
  SaveTreeRec = record
	strSumCode		: String;				// 加算先外部ｺｰﾄﾞ
	strBasedCode	: String;				// 加算元外部ｺｰﾄﾞ
    eSumNCode       : Extended;
    eBasedNCode     : Extended;
end;

type
  PrintDstData = record
	strExCode       : String;				// 補助外部ｺｰﾄﾞ
	strAssociation  : String;				// 連想
	strName         : String;				// 正式名称
	strNameSimple   : String;				// 簡略名称
    strNCode        : String;				// 内部ｺｰﾄﾞ
end;

type
  MasterInfoSeg	= record
	MasterKbn       : Integer;
	JHojyoName      : String;
	CodeAttr        : Integer;
	CodeDigit       : Integer;
end;

//--- HIS0045 St -----
//	検索情報 構造体
type
  SearchInfoRec = Record
	sHojCD	        : String;		        // 検索部門
	iItem	        : Integer;		        // 検索するItemの位置
	iStItem	        : Integer;		        // 最初に一致したItemNo
	bFstFlg	        : Boolean;		        // 初回判定ﾌﾗｸﾞ
end;
//--- HIS0028 Ed -----

// ---------------------------
//  ﾌｧﾝｸｼｮﾝ制御情報構造体<003>
// ---------------------------
type
  urFncInfo = record
    Caption         : array[0..7] of String;
    Action          : array[0..7] of TAction;
end;

{$include JNTConst.inc}

const
	WM_ONPAINT	= WM_APP + 1;	                // OnPaint 時の処理起動ﾒｯｾｰｼﾞ用
    BoolStr : array[Boolean] of String = ('False', 'True');  //*Log*
type
{$include ActionInterface.inc}                  // ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
{$include JNTMASFUSENBIKODLGIFH.inc}
{$include JNTMASExceptIFI.inc}
{$include JNTMASExceptIFH.inc}
{$include JNTMASSEARCHDLGIFH.inc}
{$include JNTSelPrtIF.inc}                      // <PRN>
{$include JNTCRPSyncMasterH.inc}                // <015> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMAsterIFH.inc}                 // <024> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部
//{$I Log_Writer_1.inc}  //*Log*

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP008001f = class(TForm)
    CmnToolBar: TPanel;
    BEnd: TMSpeedButton;
    BPrint: TMSpeedButton;
    BChange: TMSpeedButton;
    BDelete: TMSpeedButton;
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
    DtlCmnLabelExCodeTitle: TMLabel;
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
    BDetails: TMSpeedButton;
    DtlCmnEditExCodeFree: TMTxtEdit;
    MPanel2: TMPanel;
    CmnTreeViewPopupMenuDetail: TMenuItem;
    DtlCmnButtonUpdate: TMBitBtn;
    DtlCmnButtonCancel: TMBitBtn;
    DtlCmnEditExCodeNumeric: TMNumEdit;
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
    DtlCmnImageTag: TImage;
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
    ToolBar1: TToolBar;
    CmnToolbarButtonTag: TToolButton;
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
    CmnStatusBar: TStatusBar;
    Prog1: TProgressBar;
    BRowChange: TMSpeedButton;
    ppLSaiyouName: TppLabel;
    ppLSaiyouName2: TppLabel;
    CmnMemDataPrintExtDetailsCstnLimitPrice: TCurrencyField;
    dxMBankInfo: TdxMemData;
    dxMBankInfoNCode: TCurrencyField;
    dxMBankInfoHojyoNCode: TCurrencyField;
    dxMBankInfoAllBkCode: TIntegerField;
    dxMBankInfoAllBraCode: TIntegerField;
    dxMBankInfoBankName: TStringField;
    dxMBankInfoBkBraName: TStringField;
    dxMBankInfoBkCode: TStringField;
    StdCmnMemDataExistcBankNCode: TCurrencyField;
    StdCmnMemDataExistcNCode: TCurrencyField;
    StdCmnMemDataExistlBkCode: TStringField;
    StdCmnMemDataTotalcBankNCode: TCurrencyField;
    StdCmnMemDataTotalcNCode: TCurrencyField;
    StdCmnMemDataTotallAllBkCode: TIntegerField;
    StdCmnGridExistBkCode: TdxDBGridLookupColumn;
    MQMaSel: TMQuery;
    MQMaDetailIns: TMQuery;
    MQMaDetailUpd: TMQuery;
    MQTreeSel: TMQuery;
    MQTreeIns: TMQuery;
    MQTreeEntNo: TMQuery;
    MQTreeCount: TMQuery;
    MQTreeSortRead: TMQuery;
    MQTreeSortWrite: TMQuery;
    MQMaSortRead: TMQuery;
    MQMaSortWrite: TMQuery;
    StdCmnMemDataTotalAppDateStart: TDateField;
    StdCmnMemDataTotalAppDateEnd: TDateField;
    dxMBankInfoBkName: TStringField;
    StdCmnMemDataExistlBkName: TStringField;
    QryBankInfo: TMQuery;
    MLine1: TMLabel;
    MLabel1: TMLabel;
    DtlCmnLabelSegment: TMLabel;
    DtlCmnLabelBunrui: TMLabel;
    DtlBumonScrBox: TScrollBox;
    DtlCmnLabelBun01: TMLabel;
    DtlCmnDspBun01: TMLabel;
    DtlCmnLabelBun02: TMLabel;
    DtlCmnDspBun02: TMLabel;
    DtlCmnLabelBun03: TMLabel;
    DtlCmnLabelBun04: TMLabel;
    DtlCmnLabelBun05: TMLabel;
    DtlCmnLabelBun06: TMLabel;
    DtlCmnLabelBun07: TMLabel;
    DtlCmnLabelBun08: TMLabel;
    DtlCmnLabelBun09: TMLabel;
    DtlCmnLabelBun10: TMLabel;
    DtlCmnDspBun03: TMLabel;
    DtlCmnDspBun04: TMLabel;
    DtlCmnDspBun05: TMLabel;
    DtlCmnDspBun06: TMLabel;
    DtlCmnDspBun07: TMLabel;
    DtlCmnDspBun08: TMLabel;
    DtlCmnDspBun09: TMLabel;
    DtlCmnDspBun10: TMLabel;
    DtlCmnEditBun01: TMTxtEdit;
    DtlCmnEditBun02: TMTxtEdit;
    DtlCmnEditBun03: TMTxtEdit;
    DtlCmnEditBun04: TMTxtEdit;
    DtlCmnEditBun05: TMTxtEdit;
    DtlCmnEditBun06: TMTxtEdit;
    DtlCmnEditBun07: TMTxtEdit;
    DtlCmnEditBun08: TMTxtEdit;
    DtlCmnEditBun09: TMTxtEdit;
    DtlCmnEditBun10: TMTxtEdit;
    DtlSegScrBox: TScrollBox;
    DtlCmnLabelSeg01: TMLabel;
    DtlCmnLabelSeg02: TMLabel;
    DtlCmnLabelSeg03: TMLabel;
    DtlCmnLabelSeg04: TMLabel;
    DtlCmnLabelSeg05: TMLabel;
    DtlCmnLabelSeg06: TMLabel;
    DtlCmnLabelSeg07: TMLabel;
    DtlCmnLabelSeg08: TMLabel;
    DtlCmnLabelSeg09: TMLabel;
    DtlCmnLabelSeg10: TMLabel;
    DtlCmnDspSeg07: TMLabel;
    DtlCmnDspSeg08: TMLabel;
    DtlCmnDspSeg09: TMLabel;
    DtlCmnDspSeg10: TMLabel;
    DtlCmnDspSeg01: TMLabel;
    DtlCmnDspSeg02: TMLabel;
    DtlCmnDspSeg03: TMLabel;
    DtlCmnDspSeg04: TMLabel;
    DtlCmnDspSeg05: TMLabel;
    DtlCmnDspSeg06: TMLabel;
    DtlCmnEditSeg01: TMTxtEdit;
    DtlCmnEditSeg02: TMTxtEdit;
    DtlCmnEditSeg03: TMTxtEdit;
    DtlCmnEditSeg04: TMTxtEdit;
    DtlCmnEditSeg05: TMTxtEdit;
    DtlCmnEditSeg06: TMTxtEdit;
    DtlCmnEditSeg07: TMTxtEdit;
    DtlCmnEditSeg08: TMTxtEdit;
    DtlCmnEditSeg09: TMTxtEdit;
    DtlCmnEditSeg10: TMTxtEdit;
    MPanel: TMPanel;
    DtlCmnLabelAppDateAddtion: TMLabel;
    DtlCmnLabelName: TMLabel;
    DtlCmnLabelNameSimple: TMLabel;
    DtlCmnLabelAssociation: TMLabel;
    DtlCmnLabelAppDateTitle: TMLabel;
    DtlCmnLabelDescSumDivision: TMLabel;
    DtlCmnLabelZengin: TMLabel;
    DtlCmnLabelZenginName: TMLabel;
    DtlCmnEditName: TMTxtEdit;
    DtlCmnEditNameSimple: TMTxtEdit;
    DtlCmnEditAssociation: TMTxtEdit;
    DtlCmnEditAppDateEnd: TMDateEdit;
    DtlCmnEditAppDateStart: TMDateEdit;
    DtlCmnEditSumDivision: TMNumEdit;
    DtlCmnEditBankCode: TMNumEdit;
    DtlCmnEditBrCode: TMNumEdit;
    DtlCmnEditBkNCode: TMNumEdit;
    StdCmnGridExistBkExp: TdxDBGridButtonColumn;
    CmnMemDataPrintExtStandardstrBkExp: TStringField;
    StdCmnMemDataExiststrBkExp: TStringField;
    MSPFunctionBar: TMSPFunctionBar;
    aclExec: TActionList;
    FreeSetHojyo: TAction;
    BmpGrid01: TMenuItem;
    BmpGrid02: TMenuItem;
    BmpGrid03: TMenuItem;
    BmpGrid04: TMenuItem;
    CmnMemDataPrintExtStandardAllBkCd: TStringField;
    CmnMemDataPrintExtStandardAllBkNm: TStringField;
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
    MLabel2: TMLabel;
    SpMSHist: TFDStoredProc;
    StdCmnMemDataExistZenBankNM: TStringField;
    StdCmnMemDataExistZenOfficeNM: TStringField;
    CmnMemDataPrintExtStandarddtUpdateDateDisp: TStringField;	//<MLXDEP-3>



    procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
    procedure fnOnCreate(Sender: TObject);
    procedure fnOnClose(Sender: TObject; var Action: TCloseAction);
    procedure fnCmnInstructionComboOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnEnter01(Sender: TObject);
	procedure fnCommonFunctionOnEnter02(Sender: TObject);
	procedure fnCommonFunctionOnKeyDown01(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnKeyDown02(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnKeyDown03(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure fnCmnTreeViewOnDblClick(Sender: TObject);
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
    procedure fnStdCmnGridExistCodeOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnStdCmnGridExistOnEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure fnStdCmnGridTotalOnEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure fnStdCmnGridTotalCodeOnGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure fnStdCmnGridExistOnKeyPress(Sender: TObject; var Key: Char);
    procedure fnBDeleteOnClick(Sender: TObject);
    procedure fnBDetailsOnClick(Sender: TObject);
    procedure fnCmnTreeViewOnChange(Sender: TObject; Node: TTreeNode);
    procedure fnCmnTreeViewPopupMenuDetailOnClick(Sender: TObject);
    procedure fnDtlCmnButtonUpdateOnClick(Sender: TObject);
    procedure fnDtlCmnButtonCancelOnClick(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnEnter		(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnChange	(Sender: TObject);
	procedure fnDtlCmnEditExCodeOnExit		(Sender: TObject);
    procedure fnDtlCmnEditNameSimpleOnEnter(Sender: TObject);
    procedure fnBPrintOnClick(Sender: TObject);
    procedure fnCmnReportSystemppDBTextExCodeDstOnPrint(Sender: TObject);
    procedure fnCmnReportSystemOnEndPage(Sender: TObject);
    procedure fnDtlCmnEditAppDateStartOnExit(Sender: TObject);
    procedure fnDtlCmnEditAppDateEndOnExit(Sender: TObject);
    procedure fnStdCmnTabOnEnter(Sender: TObject);
    procedure fnCmnTreeViewOnEnter(Sender: TObject);
    procedure fnDtlCmnTabOnChange(Sender: TObject);
    procedure fnStdCmnGridPopupMenuOnPopup(Sender: TObject);
    procedure fnOnShow(Sender: TObject);
    procedure fnJNTCRP008001fOnHide(Sender: TObject);
    procedure fnJNTCRP008001fOnActivate(Sender: TObject);
    procedure fnDtlCmnTabOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnJNTCRP008001fOnPaint(Sender: TObject);
	procedure fnStdCmnTabOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnJNTCRP008001fOnCloseQuery(Sender: TObject; var CanClose: Boolean);
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
    procedure fnDtlCommonFunctionOnEnter(Sender: TObject);
    procedure fnStdCmnGridExistOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnStdCmnGridTotalOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnDtlCs2EditDraftRankOnExit(Sender: TObject);
    procedure DtlCmnButtonUpdateEnter(Sender: TObject);
    procedure DtlCmnEditExCodeNumericArrowClick(Sender: TObject);
    procedure BRowChangeClick(Sender: TObject);
    procedure CmnTreeViewExit(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BDeleteMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StdCmnGridExistBkCodeCloseUp(Sender: TObject;
      var Value: Variant; var Accept: Boolean);
    procedure ArrowClick(Sender: TObject);
    procedure StdCmnGridExistBkExpEditButtonClick(Sender: TObject);

    procedure MSPFunctionBarFunctionClick(Sender: TObject;FuncNo: Integer); //<003>
    procedure FreeSetHojyoExecute(Sender: TObject);
    procedure BChangeClick(Sender: TObject);

  private
    { Private 宣言 }
    // ----- <BPL> -------------------------------------------------------------
    m_CmpList	            : TList;
    B_Print 	            : TMSpeedButton;                        // 印刷
    B_Delete                : TMSpeedButton;                        // 削除
    B_Details               : TMSpeedButton;                        // 詳細
    B_RowChange             : TMSpeedButton;                        // 並び替え
    B_Search                : TMSpeedButton;                        // 検索
    B_Change                : TMSpeedButton;                        // 切出/埋込
    FusenButton             : TToolButton;                          // 付箋
    P_ComBox                : TMComboBox;                           // 処理選択ｺﾝﾎﾞ
    //--------------------------------------------------------------------------

	m_pRec				    : ^TMjsAppRecord;			            // ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_Base_pRec		        : ^TMjsAppRecord;
    m_cDataModule		    : TMDataModulef;
    m_cComArea			    : TJNTMASCom;
    m_cDBSelect			    : TFDConnection;
	m_cACControl		    : TWinControl;				            // ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
	m_cPrnSupport		    : TMjsPrnSupport;
	m_cPreview			    : TMJSPreviewIF;
	m_cErrorMsgRec		    : TMJSMsgRec;
    m_nCurrentMasterDiv     : Integer;
    m_nCurrentCodeDigit     : Integer;
    m_nCurrentCodeAttr      : Integer;
	m_nProcDivision		    : Integer;					            // 処理区分 (0:通常, 21:銀行のみ, 25:社員のみ)
	m_nSelectTagKind	    : Integer;
    m_nCurrentTagKind       : Integer;
	m_nDateFormatDivision   : Integer;
	m_nMailAdoption		    : Integer;
	m_nDBErrorCode		    : Integer;
	m_nSaveTreeRecCount	    : Integer;
	m_nSaveTreeRecMax	    : Integer;
	m_nHintPosition		    : Extended;
	m_strHintPosition	    : String;
    m_MasterInfoSeg         : array [0.. 9] of MasterInfoSeg;
	m_stSelectItem          : array [1.. 8] of SelectValidItem;
	m_stSaveTreeRec		    : array of SaveTreeRec;
	m_bHojyoTreeDelete	    : array [0..14] of Byte;
	m_bHojyoTree2		    : array [0..14] of Byte;
	m_strExCodeCurrent      : String;
	m_strExCodePrint        : String;
	m_cExCodeCurrent        : Currency;
	m_strValidCharacters    : String;					            // 使用可能ｺｰﾄﾞ
	m_stWorkRecPaste        : TreeViewRec;
	m_stMasterData	        : MasterData;
	m_stPrintDstData        : PrintDstData;
    m_fAccessTab            : Boolean;
	m_fIgnoreProc		    : Boolean;
    m_fUpdateRecord         : Boolean;
	m_fUpDeleteRecord	    : Boolean;
	m_fDtlChangeExCode      : Boolean;
	m_fDtlNewRecord	        : Boolean;
	m_fUnderConstruction    : Boolean;
	m_fComboBoxListDraw	    : Boolean;
	m_fDeleteCSInfo		    : Boolean;
	m_fChangeDetails	    : Boolean;
	m_cNodePrevSelect	    : TTreeNode;
    m_cNodeRightClick       : TTreeNode;
	m_nGridExistRecords     : Integer;
	m_nGridTotalRecords     : Integer;
	m_nOrderDivision	    : Integer;								// 印刷範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr	    : String;								// 印刷開始部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd	    : String;								// 印刷終了部門外部ｺｰﾄﾞ
	giReferFlag			    : Integer;							    // 参照ﾌﾗｸﾞ		HIS0005
	gbTabFlag			    : Boolean;
	m_DeleteCheck		    : Boolean;
	m_Close				    : Boolean;
	m_DataKbn			    : Integer;							    // ﾃﾞｰﾀ区分	HIS0036
	m_NewRecord			    : Boolean;							    // HIS0037
  	m_SearchInfo	        : SearchInfoRec;                        // HIS0045   検索対象分類情報
	m_fSystemClear          : Boolean;                              // 2004/09/02
    m_ComBox                : Integer;
    m_DtlNCode              : Currency;
    m_TantoNCode            : Currency;
    uvExpOpenSW             : Boolean;                              // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)　
    m_cJNTArea              : TJNTCommon;
    m_IsUpdate              : Boolean;                              // 更新権限 Append and Modify
    uvHani                  : TJNTHani;		                        // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	    : TPrintAppEntry;                       // <PRN>
    ArrHdl                  : Array[0..100] of Pointer;			    // <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        : rcPrtParam;                           // <PRN>
    DmqPrint                : TMQuery;                              // <PRN> 印刷用ｸｴﾘｰ
	uvSelSys                : TJNTSelCorpSys; 	                    // <PRN> 会社ｼｽﾃﾑ情報
    m_FncInfo               : urFncInfo;                            // <003> ﾌﾘｰ項目ﾌｧﾝｸｼｮﾝ
    m_UpdFreeFlg			: Boolean;                              // <003>
    m_freeItem			    : TJNTFreeRec;                          // <003>
    m_freeItemNull		    : TJNTFreeRec;                          // <003>
    m_bBtnChange            : Boolean;
    AOwner                  : TComponent;
    m_SyncMaster            : TSyncMaster;                          // <015> ﾏｽﾀ同期基本ｸﾗｽ
    m_RowState              : Integer;                              // <015> 詳細画面行ｽﾃｰﾀｽ
    m_IsDelete              : Boolean;                              // 削除権限 <035>
    m_RepHandle             : THandle;                              // 印刷モジュールハンドル <040>

//    m_Log           : TLog_Writer;  //*Log*

    procedure   fnBankInfoSet;
    function    fnCorpRelation                  (pExCode: String; pSumKbn: Integer): Integer;     // <015>

    procedure   SessionPractice(iSyori : Integer); 					// <032> ADD ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
    function    fnDelCRLF                       (sData: String): String;	// <DKAI> 改行削除

    function fnAllowEdit (): Boolean;               // <035> ADD

	function	DateToStrTmp(date: TDateTime; sts: String = ''): String;	//<MLXDEP-5>

  public
    { Public 宣言 }
    constructor fnCreateForm                    (pRec : Pointer);
	procedure	CMChildkey                      (var Msg: TWMKey); message CM_CHILDKEY;

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
//	procedure	fnChangeComponentStateGen		(fGeneral: Boolean);
//	procedure	fnCHangeConditionGridExist		(strExCode: String);
	procedure	fnAddTreeViewUnconnectedItems	();
    procedure   fnUpdateTreeViewItems           (nDivision: Integer; strExCode: String; strNameSimple: String; cNCode: Currency;nAccessMethod: Integer);
    procedure   fnUpdateTreeViewItemsEx         (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent: TTreeNode);
    procedure   fnUpdateTreeViewItemsEx2		(cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
	procedure	fnDeleteTreeViewItems			(cExCode: Currency);
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
	function	fnPrintCheckListSegBun			():Boolean;
	procedure	fnMoveGridRecordSelecter		(nDivision: Integer; strExCode: String);
    procedure   fnSetParentItemsInfo			();
	procedure	fnSetParentItemsInfoEx			(nDivision: Integer; pTView, pTViewParent: Pointer; strName: String;bDtlTab:Boolean=False);  // bDtlTab追加  <043>
	procedure	fnSetGridMemData				(dqMasterData: TMQuery);
	function	fnSetDetailScreenInfo			(cNCode: Currency; var nSumDivision: Integer): Boolean;
//	procedure	fnSetDetailScreenIndInfoCs		(strExCode: String);
	procedure	fnSetSystemRecords				();
	procedure	fnSetSystemRecord				(dqMasterData: TMQuery);
	procedure	fnSetGridTagInfo				(nTagKind: Integer);
	procedure	fnShowDetailScreen				();
	function	fnUpdateDetailsScreenRecord		(): Boolean;
	function	fnUpdateMasterRecord			(): Boolean;
	procedure	fnUpdateDetailIndInfo			();
	function	fnUpdateMasterDataTagInfo       (cExCode: Currency; var nTagKind: Integer): Boolean;
	procedure	fnUpdateGridMemDataRecord		(nDivision: Integer; strExCode: String; nTagKind: Integer);
	procedure	fnUpdateParentItemsInfoCaption	(strExCode: String; strNameSimple: String);
    procedure   fnInsertMasterTreeRecord		(cExCodeSrc, cExCodeSrcParent,
     									         cExCodeDst, cExCodeDstParent: Currency;
                                                 strExCodeDstParent: String;
                                                 nDivisionDst, nAccessMethod: Integer);
    procedure   fnDeleteMasterRecord            (nDivision: Integer; cExCode: Currency);
    procedure   fnEraseMasterTreeRecord         (cExCode, cExCodeParent: Currency);
    procedure   fnResetParentItemsInfo			();
    procedure   fnRewriteMasterTreeRecords		(cExCodeParent: Currency);
	function	fnCheckExCodeValidCharacter		(strExCode: String): Boolean;
	function	fnCheckFreeCodeValidCharacter	(strFreeCode: String): Boolean;
    function    fnCheckMasterDataRecordValid	(strExCode: String): Boolean;
	function	fnCheckMasterTreePasteValid		(strExCodeSrc: String; cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValid	(strExCodeSrc, strExCodeDst: String): Boolean;
    function    fnCheckMasterTreeInsertValid3	(cNodeSrc, cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValid2	(cNodeSrc, cNodeDst: TTreeNode): Boolean;
    function    fnCheckMasterTreeInsertValidEx	(nDivision: Integer; strExCodeCmp1, strExCodeCmp2: String): Boolean;
	function	fnCheckCommonDetailScreenValue	(nDivision: Integer): Boolean;
	function	fnCheckRequisiteItem			(nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer): Integer;
	function	fnCheckPermitGeneralRecDelete	(): Boolean;
	function	fnCheckDtlExCodeValid			(): Boolean;
    function    fnGetMasterTreeEntryNo			(dqMasterTree: TMQuery; cExCode, cExCodeParent: Currency): Integer;
    function    fnGetMasterTreeEntryNoFinal		(cDstExCode: Currency): Integer;
	function	fnGetMasterDataTagInfo			(cNCode: Currency): Integer;
    function    fnGetTagColorBitmap				(nTagColor: Integer): TBitmap;
	function	fnGetNameSimple					(nExCode: Integer): String;
	function	fnGetClassDescription			(nClassCode: Integer): String;
	function	fnGetRespectDescription			(nRespectDivision: Integer): String;
	function	fnGetTaxRateDescription			(nTaxRateCode: Integer): String;
	function	fnOutputConfirmationMessage		(nDivision: Integer): Integer;
	function	fnResetDetailScreen				(): Boolean;
    function    fnUpdateMasterTreeRecord		(): Boolean;
    function    fnUpdateMasterDataRecord		(): Boolean;
    function    fnDeleteMasterTreeRecord        (nDivision: Integer; cExCode: Currency): Boolean;
    function    fnDeleteMasterDataRecord        (nDivision: Integer; cExCode: Currency): Boolean;
    function    fnDeleteMasterDataAddition		(cExCode: Currency): Boolean;
	procedure	fnSetDeleteButtonCondition		();
	procedure	fnPartsControl					(Select: Integer);	//	HIS0005
	procedure	fnSetFileOutTF					(PrintDivision: Integer; var sTitle: TStringList; var sMemFld: TStringList);	//	HIS0007
	function	fnMakeSQL						(nType: Integer): String;   // <015>
	function	fnCheckTreeViewDropItem			(cNodeDst: TTreeNode; cExCode: Currency; nDivisionSrc: Integer): Boolean;		//  HIS0014
	function	fnHojyoTreeDelete               (cPreExCode, cExCode: Currency): Integer;
	procedure	fnDeleteCheck					();
	function    MakeDspString                   (CODE: String; NAME: String):String;
    //--- HIS0045 St -----
	procedure   fnSearch		                ();
	function    fnDownSearch	                ():Boolean;
    //--- HIS0045 Ed -----
	function	fnClearAllSystems				(): Boolean;
    function    fnBankInfoGet                   (BankCode, BrCode: Integer;
                                                 var BankName: String; var NCode: Extended): Boolean;
    procedure   fnGetMasterInfo                 ();
    function    fnGetHojyoMA                    (MasterKbn : Integer ;GCode: String;
                                                  var pName: String; var NCode : Extended): Boolean;
    function    fnGetGCode                      (MasterKbn : Integer ;NCode: Extended;
                                                 var pName: String; var GCode : String): Boolean;
    function    fnGetDspData                    (sCode: String; uvAttr :Integer): String;
    function    fnGetDtlNCode                   ():Boolean;
    function    fnDtlChk                        (): Boolean;
    procedure   fnCheckTekiDate                 (nDmqDataQry: TMQuery);
    procedure   fnCmnBankEnabled                (fEnabled: Boolean);
    function    fnSyokuchiChk                   (strExCode : String): Boolean;
    procedure   fnGetGrants                     ();
    function    fnSumChk                        (strExCode : String): Boolean;
    procedure   fnSetFncType                    (nDspType: Boolean ;ifuncNo : Integer); // <003>
    procedure   fnFreeDlg                       (nFunc: Integer);                       // <003>
    function    fnGetTagColorBitmap_Grid        (nTagColor: Integer): TBitmap;
    function    fnDelCheck                      (exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;   // <CHK>
  end;

function    AppEntry (pPar: Pointer) : Integer;
exports
	AppEntry;
implementation

var
	_SystemClear: String = '加算情報を消去します。'#13#10'再登録後はマスタ更新処理を行って下さい。';     //2004/09/02
	_CodeError  : String = 'コードには次の文字は使用できません。'' " : ? \ *';

const
    xcoZeroDate             = -693594;

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

	MASTER_BANK				= 21;						// 銀行

	MASTER_CUSTOMER			= 22;						// 取引先


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

	CHECKLIST				= 990100;					//	帳票ｸﾞﾙｰﾌﾟNo(ﾁｪｯｸﾘｽﾄ系)		HIS0003
	//	参照フラグ時に使用		HIS0005
	NORMAL					= 1;						//	通常処理
	BASICONLY				= 2;						//	基本のみ設定可能(詳細ボタン使用不可)
	REFER					= 3;						//	参照

	TABLE_HOJYOMA			= 111;						// 補助基本ﾏｽﾀ
	TABLE_CSINFO			= 113;						// 取引先詳細情報
	TABLE_HOJYOTREE			= 199;						// 補助加算体系ﾏｽﾀ
	TABLE_HOJYOTREE2		= 299;						// 補助加算体系ﾏｽﾀ2

	REQUISITE_OK			= 0;
	REQUISITE_CANCEL		= 1;
	REQUISITE_EXIT			= 9;

    MASTER_SEG_START        = 101;
    MASTER_SEG_END          = 110;

    ucBaseColorD            = $006E533A;
    ucBaseColorB            = $00FFD6D0;

    // ↓↓↓<015>
    STATE_NONE              = 0;
    STATE_INSERT            = 1;
    STATE_EDIT              = 2;
    // ↑↑↑<015>

    OPE_SEC                 = 1;                        // <025>使用区分(ｾｷｭﾘﾃｨ)
    OPE_GROUP               = 2;                        // <025>使用区分(ｸﾞﾙｰﾌﾟ管理)
    DISP_ON                 = 1;                        // <025>表示区分(表示)
    DISP_OFF                = 2;                        // <025>表示区分(非表示)

// <032> ADD start
	C_ST_PROCESS			= 0; 						// 設定
    C_ED_PROCESS            = 1;                        // 開放
// <032> ADD end

// <038> ADD St
	DEF_S_DATE  = 2;		//1900/01/01
	DEF_E_DATE  = 73050;	//2099/12/31
// <038> ADD Ed


{$R *.DFM}
{$include JNTMASFUSENBIKODLGIFB.inc}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTMASExceptIFB.inc}      // HIS0040
{$include JNTMASSEARCHDLGIFB.inc}	// 検索DLG		HIS0045
{$include JNTCRPSyncMasterB.inc}    // <015> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}     // <024> ﾏｽﾀ同期一括配信DLGﾍｯﾀﾞ部
//{$I Log_Writer_2.inc}  //*Log*

//-----------------------------------------------------------------------------
//  AppEntry
//      ｴﾝﾄﾘｰ関数群     <BPL>
//      親ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
function	AppEntry (pPar :Pointer): Integer;
var
	pFrm:   ^TJNTCRP008001f;
	pRec:   ^TMjsAppRecord;

begin
	Result	:= ACTID_RET_OK;

	pRec	:= Pointer (TAppParam (pPar^).pRecord);

	case TAppParam(pPar^).iAction of
        // ---------------------------
        //	Form Create要求
        // ---------------------------
		ACTID_FORMCREATESTART:			// Form Create要求
		begin
			New(pFrm);

			try							// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^	:=	TJNTCRP008001f.fnCreateForm (pPar);
				pRec^.m_pChildForm	:= pFrm;
			except
				Dispose (pFrm);
				Result	:= ACTID_RET_NG;
			end;
		end;

        // ---------------------------
        //	Form Create通知
        // ---------------------------
		ACTID_FORMCREATESHOWSTART:		// Form Create&Show要求
		begin
			New (pFrm);

			try							// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^	:=	TJNTCRP008001f.fnCreateForm (pPar);
				pFrm^.Show();
				pRec^.m_pChildForm	:=	pFrm;
			except
				Dispose(pFrm);
				Result	:= ACTID_RET_NG;
			end;
		end;

        // ---------------------------
        //	Form Close要求
        // ---------------------------
		ACTID_FORMCLOSESTART:			// Form Close要求
		begin
			pFrm	:=	Pointer(pRec^.m_pChildForm);
			pFrm^.Close();
			pFrm^.Free();
			Dispose (pFrm);
		end;

        // ---------------------------
        //	Form CanClose要求
        // ---------------------------
		ACTID_FORMCANCLOSESTART:		// Form CanClose要求
		begin
			pFrm	:= Pointer (pRec^.m_pChildForm);

			if	(pFrm^.CloseQuery () = False) then
				Result	:= ACTID_RET_NG;
		end;

        // ---------------------------
        //	Show要求
        // ---------------------------
		ACTID_SHOWSTART:				// Show要求
		begin
			pFrm	:= Pointer (pRec^.m_pChildForm);
			pFrm^.Show ();
		end;

        // ---------------------------
        //	Hide要求
        // ---------------------------
		ACTID_HIDESTART:				// Hide要求
		begin
			pFrm	:= Pointer (pRec^.m_pChildForm);

			if	(pFrm^.Parent <> nil) then
            	pFrm^.Hide ();
        end;
	end;
end;

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor	TJNTCRP008001f.fnCreateForm (pRec: Pointer);
var
    sMessage	:	String;
    DmqData		:	TMQuery;
	nParameter	:   Integer;
	strParameter:   String;
begin

	//	初期処理
	gbTabFlag		:=	FALSE;
	m_DeleteCheck	:=	TRUE;
	m_Close			:=  TRUE;
	m_NewRecord		:=  FALSE;		                        // HIS0037
    m_nProcDivision	:=  MKBN_GINKOU;                        // 銀行
	m_fAccessTab	:=  FALSE;

//  m_cJNTArea      :=  TJNTCommon.Create(Self);              <001>
//  m_cJNTArea.Init(Pointer( TAppParam( pRec^ ).pRecord ));   <001>
//  m_cJNTArea.SetMasAppRecord;

	m_pRec		    := Pointer( TAppParam( pRec^ ).pRecord );       //  構造体のｾｰﾌﾞ
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^  );
	m_cComArea		:= TJNTMASCom	 (m_pRec^.m_pSystemArea^);
    m_CmpList       := TList(TAppParam( pRec^ ).pActionParam^);     //  親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    AOwner          := TForm(m_pRec^.m_pOwnerForm^);
    m_TantoNCode    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
//    m_Log := TLog_Writer.Init(0,rcCOMMONAREA ( m_pRec^.m_pCommonArea^ ).SysCliRoot);  //*Log*
    // 子会社DBのOpen
	m_cDBSelect		:=  m_cDataModule.COPDBOpen (1, m_pRec.m_iCorpID);

	if ( m_cDBSelect = nil ) then
	begin
        ShowMessage ('COPDBOpenエラー');
        raise   EMathError.Create ('エラー');
    end;

    // ↓↓↓<015>
    // MQueryの構築
    DmqData := TMQuery.Create( Self );

    try
        // 子会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );

        // ﾏｽﾀ履歴用のｽﾄｱﾄﾞ(開始)を実行(子会社用)
        DmqData.Close();
        DmqData.SQL.Clear();
        DmqData.SQL.Add(fnMakeSQL(1));

        // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
        DmqData.ParamByName('TANCD').AsFloat := m_TantoNCode;

        // ｽﾄｱﾄﾞの実行
        if ( DmqData.ExecSQL = FALSE ) then
        begin
            sMessage := IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
            showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ﾏｽﾀ履歴ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりました。');
            raise Exception.Create( '' );
        end;

        // SyncMasterｸﾗｽの生成
        try
            m_SyncMaster := TSyncMaster.Create (Self, m_pRec, m_cJNTArea, m_cDBSelect);
            m_SyncMaster.InitData();
            m_SyncMaster.m_AOwner := TForm(m_pRec^.m_pOwnerForm^);
        except
            raise;
        end;
        // ↑↑↑<015>
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

//    fnCMNPostInit ( m_pRec );

    inherited Create ( TForm(m_pRec^.m_pOwnerForm^) )

end;

//************************************************************************
//*		Proccess		:	CMChildkey
//************************************************************************
procedure	TJNTCRP008001f.CMChildkey (var Msg: TWMKey);
var
	cShiftState : TShiftState;
	strNameWork : String;
    lvName      : String;
    lvNCode     : Extended;
    strExCode   : String;
    i           : Integer;
    cTxtEdit    : TMTxtEdit;
    cLabel      : TMLabel;
    iAttr       : Integer;

begin

    iAttr := 0;
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);   						// Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);   						// Shiftｷｰの取得  <Shift> ADD

(*
	if	(Screen.ActiveControl.Name = P_ComBox.Name) then						// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	begin

		if	 (Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
			 (Msg.CharCode = VK_RIGHT) then
		begin
			//HIS0036
			if	(fnChangeSelectionScreen ()) then
			begin
            	if CmnTreeView.Items.Count > 0 then
					CmnTreeView.SetFocus ();
    		end;
//			if	(fnChangeSelectionScreen ()) then
//				CmnTreeView.SetFocus ();

			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_LEFT) then
			Abort;

		Exit;
	end;
*)
    //--- HIS0045 St -----
	// F3
	if (Msg.CharCode = VK_F3) and (cShiftState=[]) then
	begin
		//MLNXリースでの動作時は以下の処理は行わない		//<MLXDEP-4> Ins
        if not (TMSeries.IsMjsLink3) then
		begin
            if m_SearchInfo.sHojCD = '' then				// 検索対象ｺｰﾄﾞが存在しない時
                BSearchClick(Self)							// 検索DLG表示
            else 											// 検索対象ｺｰﾄﾞが存在する時
                fnSearch();									// 検索
        end;
    end;
    //--- HIS0045 Ed -----

	if	(CmnTreeView.Focused) then
	begin
		if	(Msg.CharCode = VK_RETURN) or ((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		begin
			if	(DtlCmnClientPanel.Visible) then
			begin
				if	(m_nCurrentCodeAttr <= 1) then
					m_cACControl	:= DtlCmnEditExCodeNumeric
				else
					m_cACControl	:= DtlCmnEditExCodeFree;

				m_cACControl.SetFocus ();

				Abort;
			end
			else if	(StdCmnClientPanelExist.Visible) then
			begin
				m_cACControl	:= StdCmnGridExist;
				m_cACControl.SetFocus ();
				Abort;
			end
			else if	(StdCmnClientPanelTotal.Visible) then
			begin
				m_cACControl	:= StdCmnGridTotal;
				m_cACControl.SetFocus ();
				Abort;
			end;
		end;

        if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
        begin
			m_cACControl	:= P_ComBox;
      		m_cACControl.SetFocus ();
	    	Abort ();
        end;
	end;

	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then					// 実在Grid
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then		// Home
		begin
			if	(StdCmnGridExist.EditingText = '') then
			begin
				StdCmnGridExist.FocusedColumn	:= 1;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then		// End
		begin
	 		if	(StdCmnGridExist.EditingText = '') then
			begin
				if	(StdCmnGridExist.FocusedColumn = 1) then
				begin
					P_ComBox.SetFocus ();
					Abort
				end
				else
				begin
					if	(m_nCurrentMasterDiv = 22) then							// 22:取引先
						StdCmnGridExist.FocusedColumn	:= 7
					else
						StdCmnGridExist.FocusedColumn	:= 4;

					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then			// Esc
		begin
			if	((StdCmnDataSourceExist.DataSet.State in [dsEdit, dsInsert]) or	// ﾃﾞｰﾀ変更中
				 (StdCmnGridExist.EditingText <> '')) then						// ﾃﾞｰﾀ入力中
				Exit;

			P_ComBox.SetFocus ();
			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if	(StdCmnGridExist.FocusedColumn = 1) then
			begin
				m_cACControl	:= StdCmnTab;
				m_cACControl.SetFocus ();
				Abort;
			end;
		end;

//		if	((StdCmnGridExist.FocusedColumn = 4) and
		if	((StdCmnGridExist.FocusedColumn = 5 ) and
            ((Msg.CharCode = VK_F8) and (cShiftState = []))) then
		begin
			strNameWork	:= StdCmnMemDataExist.FieldByName ('strName').AsString;	// 正式名称

			if	(strNameWork <> '') then
			begin
				StdCmnMemDataExist.Edit ();
				StdCmnMemDataExist.FieldByName ('strNameSimple').AsString	:=
                                                MJSKabuCut (strNameWork, 14);
				StdCmnMemDataExist.Post ();
			end;

			Abort;
		end;

		Exit;
	end;

	if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then					// 合計Grid
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then		// Home
		begin
			if	(StdCmnGridTotal.EditingText = '') then
			begin
				StdCmnGridTotal.FocusedColumn	:= 1;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then		// End
		begin
	 		if	(StdCmnGridTotal.EditingText = '') then
			begin
				if	(StdCmnGridTotal.FocusedColumn = 1) then
				begin
					P_ComBox.SetFocus ();
					Abort
				end
				else
				begin
					StdCmnGridTotal.FocusedColumn	:= 4;
					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((StdCmnDataSourceTotal.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridTotal.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

			P_ComBox.SetFocus ();
			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if	(StdCmnGridTotal.FocusedColumn = 1) then
			begin
				m_cACControl	:= StdCmnTab;
				m_cACControl.SetFocus ();
				Abort;
			end;
		end;

		if	((StdCmnGridTotal.FocusedColumn = 4) and
            ((Msg.CharCode = VK_F8) and (cShiftState = []))) then
		begin
			strNameWork	:= StdCmnMemDataTotal.FieldByName ('strName').AsString;			// 正式名称

			if	(strNameWork <> '') then
			begin
				StdCmnMemDataTotal.Edit ();
				StdCmnMemDataTotal.FieldByName ('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
				StdCmnMemDataTotal.Post ();
			end;

			Abort;
		end;

		Exit;
	end;

	if	((StdCmnTab.Focused) or (DtlCmnTab.Focused)) then						// 一覧/詳細ﾀﾌﾞ
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			m_cACControl	:= P_ComBox;
			m_cACControl.SetFocus ();

			Abort;
		end
		else if (StdCmnTab.Focused and ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN))) then
		begin
			if	(StdCmnTab.Items [0].Selected) then										// 実在Grid
				m_cACControl	:= StdCmnGridExist
			else																		// 合計Grid
				m_cACControl	:= StdCmnGridTotal;

			m_cACControl.SetFocus ();

			Abort;
		end
		else if	(DtlCmnTab.Focused and ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN))) then
        begin
			if	(m_nCurrentCodeAttr <= 1) then
				DtlCmnEditExCodeNumeric.SetFocus ()
			else
				DtlCmnEditExCodeFree   .SetFocus ();

			Abort;
		end;
	end;

	if	(DtlCmnEditExCodeNumeric.Focused or										// 詳細画面 ｴﾃﾞｨｯﾄ[補助ｺｰﾄﾞ]
		 DtlCmnEditExCodeFree   .Focused) then
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			m_cACControl	:= DtlCmnTab;
			m_cACControl.SetFocus ();
			Abort;
		end;
	end;

    //  全銀協コード変更(BankCode)
    if (DtlCmnEditBankCode.Focused) then
    begin
		if	((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
		begin
            //銀行情報取得・名称設定
            if (DtlCmnEditBankCode.Text ='') or (DtlCmnEditBrCode.Text ='') then
            begin
                DtlCmnLabelZenginName.Caption   :=  '';
                DtlCmnEditBkNCode.Value         :=  0;
                MLabel2.Caption := '';           //<012>
            end
            else begin
                if fnBankInfoGet(DtlCmnEditBankCode.AsInteger, DtlCmnEditBrCode.AsInteger, lvName, lvNCode) then
                begin
                    DtlCmnLabelZenginName.Caption   :=  lvName;
                    DtlCmnEditBkNCode.Value         :=  lvNCode;
                    MLabel2.Caption := '－';      //<012>

                    if Trim(DtlCmnEditName.Text) = '' then
                        DtlCmnEditName.Text :=  lvName;

                    if Trim(DtlCmnEditNameSimple.Text) = '' then
                        DtlCmnEditNameSimple.Text   :=
                                       MJSKabuCut (lvName, 14);
                end
                else
                begin
                    DtlCmnLabelZenginName.Caption   :=  '';
                    DtlCmnEditBkNCode.Value         :=  0;
                    MLabel2.Caption := '';        //<012>
        			m_cACControl	:= DtlCmnEditBankCode;
	        		m_cACControl.SetFocus ();
		        	Abort;
                end;
            end;
// <009>↓
//        end;
        end
                                            // Shift+Tab
		else if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or
            (Msg.CharCode = VK_LEFT) or     // ←
            (Msg.CharCode = VK_UP) then     // ↑
        begin                               // 銀行ｺｰﾄﾞに移動
			if	(m_nCurrentCodeAttr <= 1) then
           		DtlCmnEditExCodeNumeric.SetFocus
			else
             	DtlCmnEditExCodeFree.SetFocus;
            Abort;
        end;
// <009>↑
    end;

    //  全銀協コード変更(BranchCode)
    if (DtlCmnEditBrCode.Focused) then
    begin
		if	((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
		begin
            //銀行情報取得・名称設定
            if (DtlCmnEditBankCode.Text ='') or (DtlCmnEditBrCode.Text ='') then
            begin
                DtlCmnLabelZenginName.Caption   :=  '';
                DtlCmnEditBkNCode.Value         :=  0;
                MLabel2.Caption := '';              //<012>
{　051109 全銀協ｺｰﾄﾞは必須からはずす
      			m_cACControl	:= DtlCmnEditBankCode;
        		m_cACControl.SetFocus ();
	        	Abort;
}
            end
            else begin
                if fnBankInfoGet(DtlCmnEditBankCode.AsInteger, DtlCmnEditBrCode.AsInteger, lvName, lvNCode) then
                begin
                    DtlCmnLabelZenginName.Caption   :=  lvName;
                    DtlCmnEditBkNCode.Value         :=  lvNCode;
                    MLabel2.Caption := '－';          //<012>

                    if Trim(DtlCmnEditName.Text) = '' then
                        DtlCmnEditName.Text :=  lvName;

                    if Trim(DtlCmnEditNameSimple.Text) = '' then
                        DtlCmnEditNameSimple.Text   :=
                                       MJSKabuCut (lvName, 14);

                end
                else
                begin
                    DtlCmnLabelZenginName.Caption   :=  '';
                    DtlCmnEditBkNCode.Value         :=  0;
                    MLabel2.Caption := '';          //<012>
        			m_cACControl	:= DtlCmnEditBankCode;
	        		m_cACControl.SetFocus ();
		        	Abort;
                end;
            end;
		end;
    end;

	if (DtlCmnEditAssociation.Focused) then // 連想
	begin
// <009>↓
{		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if	(m_nCurrentCodeAttr <= 1) then
           		DtlCmnEditExCodeNumeric.SetFocus
			else
             	DtlCmnEditExCodeFree.SetFocus;

			Abort;
		end;
}
                                            // Shift + Tab
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or
            (Msg.CharCode = VK_LEFT) or     // ←
            (Msg.CharCode = VK_UP) then     // ↑
        begin
                                            // 全銀ｺｰﾄﾞに移動できたら
            if (DtlCmnEditBrCode.Visible) and (DtlCmnEditBrCode.Enabled) then
            begin
                MjsPrevCtrl(Self);          // 全銀(枝番)に移動
            end
            else                            // ﾀﾞﾒなら銀行ｺｰﾄﾞに移動
            begin
    			if	(m_nCurrentCodeAttr <= 1) then
               		DtlCmnEditExCodeNumeric.SetFocus
		    	else
                 	DtlCmnEditExCodeFree.SetFocus;
            end;

            Abort;
        end;
// <009>↑
	end;

	if	(DtlCmnButtonUpdate.Focused) then										// 詳細画面 ﾎﾞﾀﾝ[更新]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
// <009>↓
		if	(((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
			 ((Msg.CharCode = VK_DOWN  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsNextCtrl (Self);
			Abort;
		end;
// <009>↑
	end;

	if	(Screen.ActiveControl.Name = DtlCmnEditNameSimple.Name) then
	begin
		if	((Msg.CharCode = VK_F8) and (cShiftState = [])) then						// F8
		begin
			strNameWork	:= DtlCmnEditName.Text;											// 正式名称

			if	(strNameWork <> '') then
				DtlCmnEditNameSimple.Text	:= MJSKabuCut (strNameWork, 14);

			Abort;
		end;
	end;

    //---------------------------------------------------------------------
    //  分類・ｾｸﾞﾒﾝﾄ
    //---------------------------------------------------------------------
    if (Copy(Screen.ActiveControl.Name,1,13) = 'DtlCmnEditBun') or
                (Copy(Screen.ActiveControl.Name,1,13) = 'DtlCmnEditSeg') then
    begin

        for i := 10 downto 1 do
        begin
            //分類
            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
            cLabel   := TMLabel(MJSFindCtrl (Self, Format ('DtlCmnDspBun%.2d%.', [i])));

            if Screen.ActiveControl = cTxtEdit then
            begin

                if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                    ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                    ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                     ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
    	    	begin

                    Case cTxtEdit.InputAttr of
                        iaZeroSup   : iAttr := 0;
                        iaZeroPad   : iAttr := 1;
                        iaNone      : iAttr := 2;
                    end;

                    strExCode := fnGetDspData(cTxtEdit.text,iAttr);

                    //名称設定
                    if fnGetHojyoMA(cTxtEdit.Tag, strExCode, lvName, lvNCode) then
                    begin
                        cLabel.Caption   :=  lvName;
                    end
                    else
                    begin
                        cLabel.Caption  :=  '';
                        cTxtEdit.Text   :=  '';
                    end;
                end;

        	end;

            //ｾｸﾞﾒﾝﾄ
            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
            cLabel   := TMLabel(MJSFindCtrl (Self, Format ('DtlCmnDspSeg%.2d%.', [i])));

            if Screen.ActiveControl = cTxtEdit then
            begin
                if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                    ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                    ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                     ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
	    	    begin

                    Case cTxtEdit.InputAttr of
                        iaZeroSup   : iAttr := 0;
                        iaZeroPad   : iAttr := 1;
                        iaNone      : iAttr := 2;
                    end;

                    strExCode := fnGetDspData(cTxtEdit.text,iAttr);

                    //名称設定
                    if fnGetHojyoMA(cTxtEdit.Tag, strExCode, lvName, lvNCode) then
                    begin
                        cLabel.Caption   :=  lvName;
                    end
                    else
                    begin
                        cLabel.Caption  :=  '';
                        cTxtEdit.Text   :=  '';
                    end;
                end;
        	end;
        end;
    end;

// -----------------------------------------
//  ﾌｧﾝｸｼｮﾝｷｰの補足（ﾌﾘｰ項目）<003>
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


    //<KEY>

	if ((Screen.ActiveControl.Name = DtlCmnButtonUpdate.Name) or
		 (Screen.ActiveControl.Name = DtlCmnButtonCancel.Name)) then
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end
		else if	(Msg.CharCode = VK_RETURN) then
        begin
    		if (Screen.ActiveControl.Name = DtlCmnButtonUpdate.Name) then	    		// 詳細: [更新]ﾎﾞﾀﾝ
                fnDtlCmnButtonUpdateOnClick(Screen.ActiveControl)
    		else if (Screen.ActiveControl.Name = DtlCmnButtonCancel.Name) then			// 詳細: [更新]ﾎﾞﾀﾝ
                fnDtlCmnButtonUpdateOnClick(Screen.ActiveControl);
			Abort;
        end;
	end;

    if DtlCmnClientPanel.Visible then
    begin
		// 051114 >>
   		if  ((Msg.CharCode = VK_TAB)    and (cShiftState = [])) then
	    begin
			MjsDispCtrl.MjsNextCtrl (Self);
        	abort;
	    end;
    	// 051114 <<

//{051114
      	if  ((Msg.CharCode = VK_TAB)    and (cShiftState = [])) or
	        ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) or
// 051114            ((Msg.CharCode = VK_RIGHT)  and (cShiftState = [])) or
            ((Msg.CharCode = VK_DOWN)   and (cShiftState = [])) or
            ((Msg.CharCode = VK_UP)     and (cShiftState = [])) or		// 051114
            ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
//051114}
        begin
            if (Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name) or
                (Screen.ActiveControl.Name = DtlCmnEditExCodeFree.Name) then
                fnCommonFunctionOnKeyDown01(Screen.ActiveControl,Msg.CharCode,cShiftState)
            else if (Screen.ActiveControl.Name = DtlCmnEditName.Name) then
                fnDtlCmnEditNameOnKeyDown(Screen.ActiveControl,Msg.CharCode,cShiftState)
            else
                fnCommonFunctionOnKeyDown02(Screen.ActiveControl,Msg.CharCode,cShiftState);
            abort;
        end;
        exit;
    end;

    inherited;
end;
//************************************************************************
//*		Proccess		:	fnOnCreate
//************************************************************************
procedure	TJNTCRP008001f.fnOnCreate (Sender: TObject);
var
    dqMasterInfo : TMQuery;
    nItemPosition: Integer;
    nCount       : Integer;

    iRet        :   Integer;        // <PRN>
    lvHandle    :   THandle;        // <PRN>
	sMLWF       :   String;         // <MLXDEP>
begin
    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    B_Print     :=  TMSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    B_Delete 	:=  TMSpeedButton( m_CmpList.Items[2]^ );     // 削除
    B_Details 	:=  TMSpeedButton( m_CmpList.Items[3]^ );     // 詳細
    B_RowChange	:=  TMSpeedButton( m_CmpList.Items[4]^ );     // 並び替え
    B_Search 	:=  TMSpeedButton( m_CmpList.Items[5]^ );     // 検索
    FusenButton	:=  TToolButton  ( m_CmpList.Items[7]^ );     // 付箋
    P_ComBox    :=  TMComboBox   ( m_CmpList.Items[8]^ );     // 機能選択
    m_cJNTArea  :=  TJNTCommon   ( m_CmpList.Items[9]^ );     // <001>
    m_Base_pRec :=  Pointer      ( m_CmpList.Items[10]^);
    B_Change    :=  TMSpeedButton( m_CmpList.Items[11]^ );    // KIRIUME

    m_SyncMaster.m_cJNTArea := m_cJNTArea;  // <015>

    B_Print.OnClick     := fnBPrintOnClick;
    B_Details.OnClick   := fnBDetailsOnClick;
    B_Delete.OnClick    := fnBDeleteOnClick;
    B_RowChange.OnClick := BRowChangeClick;
    B_Search.OnClick    := BSearchClick;
    B_Change.OnClick    := BChangeClick;

    FusenButton.OnClick  := fnCmnToolbarButtonTagOnClick;
    FusenButton.DropdownMenu := CmnToolbarDropDownMenu;
    //--------------------------------------------------------------------------

	Parent          := TPanel (m_pRec^.m_pOwnerPanel^);
	Align           := alClient;

	dqMasterInfo    := TMQuery.Create (Self);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterInfo );
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQMaSel      );
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQMaDetailIns);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQMaDetailUpd);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeSel);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeIns);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeEntNo);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeCount);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeSortRead);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQTreeSortWrite);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQMaSortRead);
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, MQMaSortWrite);

    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, QryBankInfo);

	with (dqMasterInfo) do
	begin
		Close ();

		SQL.Clear;
		SQL.Add('SELECT DTM.YearKbn, DTM.DTName7, MAS.ComKbn3, MAS.ComKbn4, MAS.DataKbn ');	//HIS0036
		SQL.Add('FROM DTMAIN AS DTM, DTMAIN_MAS AS MAS ');	                                //HIS0036

		Open ();

		m_nDateFormatDivision	:= FieldByName ('YearKbn').AsInteger;					// 和暦/西暦区分
		m_nMailAdoption			:= FieldByName ('ComKbn3').AsInteger;					// ﾒｰﾙ会計処理区分
		m_strValidCharacters	:= FieldbyName ('DTName7').AsString;					// 使用可能ｺｰﾄﾞ
		m_DataKbn				:= FieldByName ('DataKbn').AsInteger;					// データ区分	//HIS0036

		Close ();
	end;

	if	(m_nDateFormatDivision = 0) then												// 和暦/西暦区分: 0=和暦
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfEMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfEMD;
//		DtlCmnEditAppDateStart.Gengou		:=	'H';								// <#NGEN>
		DtlCmnEditAppDateStart.Gengou		:=	MjsGetGengou(Now, MdtCMP_YMD);		// <#NGEN>
//		DtlCmnEditAppDateEnd  .Gengou		:=	'H';								// <#NGEN>
		DtlCmnEditAppDateEnd  .Gengou		:=	MjsGetGengou(Now, MdtCMP_YMD);		// <#NGEN>
	end
	else																				// 和暦/西暦区分: 1=西暦
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfYMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfYMD;
		DtlCmnEditAppDateStart.Gengou		:=	#0;
		DtlCmnEditAppDateEnd  .Gengou		:=	#0;
	end;

	if	(m_nMailAdoption = 1) then
	begin
		B_Delete    .Visible	:= FALSE;
		CmnTreeViewPopupMenuDelete.Visible	:= FALSE;
	end;

	for nCount := 1 to 8 do
    begin
        m_stSelectItem [nCount].nMasterDivision := 0;
        m_stSelectItem [nCount].strItemCaption  := '';
    end;

	m_nSaveTreeRecMax	:= 0;
	m_nSaveTreeRecCount	:= 0;

	for	nCount := 0 to 14 do
	begin
		m_bHojyoTreeDelete [nCount]	:= 0;
		m_bHojyoTree2      [nCount]	:= 0;
	end;

	m_cPreview	:= TMJSPreviewIF.Create ();
	m_cPreview.Init (m_pRec);

    nItemPosition   := 1;

	StdCmnMemDataCustomer.Open;
    StdCmnMemDataCustomer.Append;
	StdCmnMemDataCustomer.FieldByName ('nDivision'     ).AsInteger	:= 0;
	StdCmnMemDataCustomer.FieldByName ('strDescription').AsString	:= 'なし';
	StdCmnMemDataCustomer.Post;
    StdCmnMemDataCustomer.Append;
	StdCmnMemDataCustomer.FieldByName ('nDivision'     ).AsInteger	:= 1;
	StdCmnMemDataCustomer.FieldByName ('strDescription').AsString	:= '採用';
	StdCmnMemDataCustomer.Post;

	StdCmnMemDataSupplier.Open;
	StdCmnMemDataSupplier.Append;
	StdCmnMemDataSupplier.FieldByName ('nDivision'     ).AsInteger	:= 0;
	StdCmnMemDataSupplier.FieldByName ('strDescription').AsString	:= 'なし';
	StdCmnMemDataSupplier.Post;
	StdCmnMemDataSupplier.Append;
	StdCmnMemDataSupplier.FieldByName ('nDivision'     ).AsInteger	:= 1;
	StdCmnMemDataSupplier.FieldByName ('strDescription').AsString	:= '採用';
	StdCmnMemDataSupplier.Post;


	with (dqMasterInfo) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add('SELECT MasterKbn,UseKbn,JHojyoName,CodeDigit,CodeAttr ');
        SQL.Add('FROM MasterInfo ');
		SQL.Add('WHERE MasterKbn=:nMasterDivision AND UseKbn<>0 ORDER BY MasterKbn');
		ParamByName('nMasterDivision').AsInteger    := m_nProcDivision; //銀行
		Open ();
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
					MASTER_BANK     : m_stSelectItem [nItemPosition].strItemCaption   := '銀行';
				end;
			end;

			nItemPosition	:= nItemPosition + 1;

			NEXT;
		end;

		Close ();
    end;

    m_nCurrentMasterDiv := 0;
    m_nCurrentCodeDigit := 10;
    m_nCurrentCodeAttr  := 0;
	m_nSelectTagKind	:= 0;
	m_nDBErrorCode		:= 0;
    m_strExCodeCurrent  := '          ';
    m_cExCodeCurrent    := 0;
	m_cNodePrevSelect	:= nil;
    m_fUpdateRecord     := False;    //  FX　本当はFALSE　
	m_fDtlNewRecord		:= FALSE;
	m_fIgnoreProc		:= FALSE;
	m_fComboBoxListDraw	:= TRUE;
	m_fDeleteCSInfo		:= FALSE;
	m_fChangeDetails	:= FALSE;

    m_stWorkRecPaste.nDivision	:= 9;
    m_stWorkRecPaste.strExCode	:= '';
    m_stWorkRecPaste.strName	:= '';

   	m_SearchInfo.sHojCD := '';													//HIS0045

    m_ComBox   := 1;
    m_RowState := STATE_NONE; // <015>

    m_RepHandle	:= 0;           // 印刷モジュールハンドル <040>

	if (m_nProcDivision = 21) then
	begin
		CmnTreeViewPopupMenuDetail .Visible	:= FALSE;
		CmnTreeViewPopupMenuBreak01.Visible	:= FALSE;
	end;

    CmnTreeView.Enabled	        := FALSE;
    CmnSplitter.Enabled	        := FALSE;
	B_Print.Enabled	            := FALSE;
	B_Details.Enabled	        := FALSE;
	B_Delete.Enabled            := FALSE;
    B_RowChange.Enabled         := FALSE;   // <016>
    B_Search.Enabled            := FALSE;   // <016>
    fnEnableToolbarButtonTag(false);
    StdCmnClientPanel.Enabled	:= FALSE;
    DtlCmnClientPanel.Enabled	:= FALSE;


    DtlCmnClientPanel.Visible   := False;

	StdCmnGridExist.FocusedColumn   := 1;
	StdCmnGridTotal.FocusedColumn   := 1;

    m_fAccessTab	:= True;


    // 権限取得
    fnGetGrants();

	MJSColorChange( TJNTCRP008001f(Self),
                    m_cComArea.SystemArea.SysColorB,
                    m_cComArea.SystemArea.SysColorD,
                    m_cComArea.SystemArea.SysBaseColorB,
                    m_cComArea.SystemArea.SysBaseColorD,
                    rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor);


	MJSFontResize(TJNTCRP008001f (Self), Pointer (m_pRec));

	dqMasterInfo.Free ();

    //　部門・セグメント取得
    fnGetMasterInfo;

	if TMSeries.IsMjsLink3 = False then //<MLXDEP-3>
	begin	//<MLXDEP-3>begin,end内を一段字下げ
	    //  銀行情報取得
	    fnBankInfoSet;

//    fnChangeSelectionScreen();			// <030> DEL

	    //  銀行情報取得
	    fnBankInfoSet;
	end;	//<MLXDEP-3>

// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
    lvHandle := 0;
	try
// <LPH> MOD-STR
//		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008001L.BPL');
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP008001L.BPL');
// <LPH> MOD-END
        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP008001LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
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

    m_RepHandle	:= lvHandle;        // 印刷モジュールハンドル <040>

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

//<MLXDEP>↓
	sMLWF := '';
	if (TMSeries.IsMjsLink3) then     //<MLXDEP>
	begin
		sMLWF	:= '_DEP_';
		StdCmnTab.Visible   := False;
		CmnTreeView.Visible := False;
	end;
//<MLXDEP>↑

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    gfnHaniInit(Self,
                m_Base_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
//*             'JNTCRP008001',
	            'JNTCRP008001' + sMLWF,		//<MLXDEP>
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------


// <032> ADD start
	SpMSHist.Connection := m_cDBSelect;
    //SpMSHist.SessionName  := m_cDBSelect.SessionName;
// <032> ADD end

    // ﾌｧﾝｸｼｮﾝ設定<003>
    fnSetFncType(False,0);
    fnSetFncType(False,7);

    // ﾌﾘｰ項目設定ﾀﾞｲｱﾛｸﾞ初期化<003>
    fnJNTFreeDlgLoad( m_pRec );
    fnJNTFreeDlgInit( m_pRec, @m_cComArea, @m_cDBSelect,m_cJNTArea);

    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if ( fnJNTExpInit(Self,m_pRec) = 0 ) then
            uvExpOpenSW := TRUE
    else    MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					      + 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);

    DtlCmnEditBankCode.Zero := True;
    DtlCmnEditBrCode.Zero   := True;

//<MLXDEP>
	if (TMSeries.IsMjsLink3) then
	    m_cACControl	:=  StdCmnGridExist
	else
	    m_cACControl	:=  CmnTreeView;
    //m_cACControl	:=  CmnTreeView;
//<MLXDEP>

    fnChangeSelectionScreen();   			// <030> ADD 同期に失敗した場合、終了できるようにするために最後に呼ぶ

end;
//************************************************************************
//*		Proccess		:	fnOnClose
//************************************************************************
procedure TJNTCRP008001f.fnOnClose (Sender: TObject; var Action: TCloseAction);
var
    cDlgMasTree2        :   TJNTMasTreee2Dlgf;
    arMasterDIvision    :   array of Integer;
    stItemRec		    :   ^TreeViewRec;
    dqWork              :   TMQuery;
    nCount			    :   Integer;
	stMessageRec        :   TMJSMsgRec;
    DmqData             :	TMQuery;    // <015>
	sMessage            :	String;     // <015>
    AppPrm              :   TAppParam;
    Dlg                 :   TJNTSyncMasterIF;       // <024>
    IDs                 :   Array[0..0] of integer; // <024>
begin

	m_Close	:= False;

//<MLXDEP>
	if (TMSeries.IsMjsLink3)	then
		BRowChangeClick(Sender);
//<MLXDEP>

    // 加算体系2 更新
	if	(m_bHojyoTree2 [0] = 1) and (not (TMSeries.IsMjsLink3)) then	//<MLXDEP>
	begin
		SetLength (arMasterDivision, Length (arMasterDivision) + 1);

		arMasterDivision [Length (arMasterDivision) - 1] := MASTER_BANK + 0;
	end;

	if	(Length (arMasterDivision) > 0) and (not (TMSeries.IsMjsLink3)) then	//<MLXDEP>
	begin
		cDlgMasTree2 := TJNTMasTreee2Dlgf.Create (Self);

		if ( cDlgMasTree2.ExecTree2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
                m_cDataModule, m_cComArea.m_iCopNo, arMasterDivision, dqWork) < 0 ) then
		begin
			if ( dqWork <> nil ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (stMessageRec, dqWork);
				MjsMessageBoxEx (Self,
                                 stMessageRec.sMsg,
                                 stMessageRec.sTitle,
                                 stMessageRec.icontype,
                                 stMessageRec.btntype,
                                 stMessageRec.btndef,
                                 FALSE);
				dqWork.Free ();
			end
			else
				MjsMessageBoxEx (Self,
                                 stMessageRec.sMsg,
                                 stMessageRec.sTitle,
                                 stMessageRec.icontype,
                                 stMessageRec.btntype,
                                 stMessageRec.btndef,
                                 FALSE);
       	end;

		cDlgMasTree2.Close ();
		cDlgMasTree2.Free  ();
	end;

	if ( m_NewRecord = True ) and (not (TMSeries.IsMjsLink3)) then	//<MLXDEP>
	begin
		//マスタが新規登録されました。出力順序などの設定の見直しが必要と思われます。
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,30 );
		MjsMessageBoxEx(Self,
                        m_cErrorMsgRec.sMsg,
                        m_cErrorMsgRec.sTitle,
                        m_cErrorMsgRec.icontype,
                        m_cErrorMsgRec.btntype,
                        m_cErrorMsgRec.btndef,
                        m_cErrorMsgRec.LogType);
	end;


	m_fUnderConstruction := TRUE;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec := CmnTreeView.Items [nCount - 1].Data;

		Dispose (stItemRec);
	end;

    // <024> - ST
    // ｸﾞﾙｰﾌﾟ会社ありの場合
    // <028>if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    if ( m_SyncMaster.m_flgGrpCorp in [0,1] ) then  // <028>
    begin
// <031> MOD start
(*
        IDs[0] := JNTSYNC_HojyoMA;
        Dlg := TJNTSyncMasterIF.Create (Self, m_pRec);

        try
            Dlg.ShowDlg(IDs);
    	finally
    		Dlg.Free;
    		Dlg:=nil;
    	end;
*)
		if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
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
// <031> MOD end
    end;
    // <024> - ED

    // ↓↓↓<015>
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

    // ｸﾗｽの開放
    m_SyncMaster.fnSyncTerm();
    // ↑↑↑<015>

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if ( uvExpOpenSW = TRUE ) then
        fnJNTExpFree;

    // m_cJNTArea.Free; <001>

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

//    fnCMNPostFree();

    // 子会社DBのClose
	if ( m_cDBSelect <> nil ) then
	    m_cDataModule.COPDBClose (m_cDBSelect);

    // ｸﾞﾙｰﾌﾟ会社ありの場合<015>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社DBのClose
        if ( m_SyncMaster.m_cPDBSelect <> nil ) then
        	m_cDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;

	m_fUnderConstruction := TRUE;

	m_pRec^.m_iDelete   := 1;
	AppPrm.iAction		:= ACTID_FORMCLOSEEND;									//	呼び出し区分設定
	AppPrm.pRecord		:= Pointer (m_pRec);									//	管理構造体ﾎﾟｲﾝﾀ設定
	AppPrm.pActionParam	:= nil;				  									//	予備ﾎﾟｲﾝﾀ設定
	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@AppPrm);
    Action              := caFree;

end;

procedure	TJNTCRP008001f.fnOnShow (Sender: TObject);
begin
	JNTMasSetCaption (m_pRec);
	MJSBtnVisible (TJNTCRP008001f (Self), TRUE);

	if	(m_nMailAdoption = 1) then
	begin
		B_Delete    .Visible	:= FALSE;
		CmnTreeViewPopupMenuDelete.Visible	:= FALSE;
	end;

	if (m_nProcDivision = 21) then
	begin
		CmnTreeViewPopupMenuDetail .Visible	:= FALSE;
		CmnTreeViewPopupMenuBreak01.Visible	:= FALSE;
	end;

	if	(m_cPreview.IsPreView ()) then
		m_cPreview.Show ()
	else
    begin
        if m_cACControl.Enabled = false then
            m_cACControl := P_ComBox;

	    m_cACControl.SetFocus ();
    end;

    // ﾌｧﾝｸｼｮﾝｷｰの設定<002>
    MSPFunctionBar.CopyFuncData(m_FncInfo.Caption);

end;


procedure	TJNTCRP008001f.fnJNTCRP008001fOnHide (Sender: TObject);
begin
	MJSBtnVisible (TJNTCRP008001f (Self), FALSE);

	if	(m_cPreview.IsPreView ()) then
		m_cPreview.Hide ();
end;
//************************************************************************
//*		Proccess		:	OnCloseQuery
//************************************************************************
procedure	TJNTCRP008001f.fnJNTCRP008001fOnCloseQuery (Sender: TObject; var CanClose: Boolean);
var
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;
begin
	m_Close	:= False;


  	if ( uvHani.mjspre.IsPreView = TRUE ) then
	//if	(m_cPreview.IsPreView ()) then
 	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);

		MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		CanClose	:= FALSE;
	    Exit;	// <006>
	end;

    // 更新権限があり
    if ( m_IsUpdate ) then
    begin

        // 変更されたデータを保存しますか？
       	nReturn	:= fnOutputConfirmationMessage (CONFIRM_EXIT);

    	if	(nReturn = CONFIRM_RETFOCUSED) then
    	begin
	    	CanClose	:= FALSE;
    		Exit;
    	end
    	else if	(nReturn = CONFIRM_EXITWRITE) then
        begin
            //FX0047 必須入力ﾁｪｯｸ
            if not fnDtlChk then begin
                DtlCmnEditBankCode.SetFocus;
  		        CanClose	:= FALSE;
      		    Exit;
            end;

    		fnUpdateDetailsScreenRecord ();
        end;
    end;

	m_fChangeDetails	:= FALSE;

end;
//************************************************************************
//*		Proccess		:	OnActivate
//************************************************************************
procedure	TJNTCRP008001f.fnJNTCRP008001fOnActivate (Sender: TObject);
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
//*	関数	: TJNTCRP008001f.fnCommonFunctionDetailsOnChange (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 共通 OnChange ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCommonFunctionDetailsOnChange (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if ((not m_fChangeDetails) and
        (not m_fUnderConstruction) and
        (giReferFlag = NORMAL)) then
		m_fChangeDetails	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCmnTreeViewOnEnter (TObject; TTreeNode)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnEnter ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnTreeViewOnEnter (Sender: TObject);
begin
	fnChangeToolbarButtonsCondition (CmnTreeView.Selected);								// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewOnChange (TObject; TTreeNode)								*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnChange ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnTreeViewOnChange (Sender: TObject; Node: TTreeNode);
var
    stSelectRec    : ^TreeViewRec;
    stParentRec    : ^TreeViewRec;
	strExCodeParent: String;
	strName		   : String;

begin

	if (m_fUnderConstruction) then
		Exit;

	fnChangeToolbarButtonsCondition(Node);												// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更

	stSelectRec	:= Node.Data;

	if	(stSelectRec^.nDivision = DIVISION_NEWRECORD) then
		Exit;

	fnCleanupTreeViewNewItem (FALSE);

	if ((stSelectRec^.nDivision = 0) or
        (stSelectRec^.nDivision = DIVISION_GENERAL)) then
    begin
		stParentRec		:= Node.Parent.Data;
		strExCodeParent	:= stParentRec^.strExCode;
		strName			:= stParentRec^.strName;
	end
	else
	begin
		stParentRec		:= Node.Data;
		strExCodeParent	:= stSelectRec^.strExCode;
		strName			:= stSelectRec^.strName;
	end;

//	if	(m_strExCodeCurrent <> strExCodeParent) then
	if	(CompareStr (m_strExCodeCurrent, strExCodeParent) <> 0) then
    begin
		fnSetParentItemsInfoEx(stSelectRec^.nDivision,
                                stSelectRec, stParentRec, strName);
    end;

	if	(DtlCmnClientPanel.Visible) then
	begin
		if	(stSelectRec^.nDivision = 9) then
		begin
			DtlCmnClientPanel     .Visible	:= FALSE;
			StdCmnClientPanel     .Visible	:= TRUE;
 			B_Details              .Caption	:= '詳細(&T)';

			m_fChangeDetails	:= FALSE;
		end
		else
		begin
			fnShowDetailScreen ();
		end;
	end
	else
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.strExCode);

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewOnDblClick (TObject)											*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnDblClick ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewOnDblClick (Sender: TObject);
//var
//	stWorkRec: ^TreeViewRec;
//	cNode    : TTreeNode;

begin
//	cNode       := CmnTreeView.Selected;
//	stWorkRec   := cNode.Data;

//	if  ((stWorkRec^.nDivision = 0) or (stWorkRec^.nDivision = DIVISION_GENERAL)) then
//		Exit;

//	m_cACControl    := StdCmnGridExist;

//	StdCmnGridExist.SetFocus;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnFunctionOnEnter01 (TObject)											*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnEnter ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCommonFunctionOnEnter01 (Sender: TObject);
begin
	B_Details   .Enabled := FALSE;
	B_Delete    .Enabled := FALSE;
    B_RowChange .Enabled := FALSE;  // <016>
    B_Search    .Enabled := FALSE;  // <016>
//	FusenButton.Enabled	:= FALSE;
    fnEnableToolbarButtonTag(false);

    m_cACControl    := Screen.ActiveControl;
	m_fIgnoreProc	:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnFunctionOnEnter02 (TObject)										*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnEnter ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCommonFunctionOnEnter02 (Sender: TObject);
var
	fDeleteEnabled: Boolean;
begin
	fDeleteEnabled	:= TRUE;

	if (giReferFlag	<> BASICONLY) then      //	基本のみ以外	HIS0005
		B_Details.Enabled	:= TRUE
	else
		B_Details.Enabled	:= FALSE;

	if	((Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name) or
		 (Screen.ActiveControl.Name = DtlCmnEditExCodeFree   .Name)) then
	begin
		fnSetDeleteButtonCondition();

		if	(not B_Delete.Enabled) then
			fDeleteEnabled	:= FALSE;
	end;

//	if (giReferFlag	<> REFER) then          //	参照以外		HIS0005
//	begin
	if	(fDeleteEnabled) then
// <035> MOD-STR
//		B_Delete.Enabled	:= m_cJNTArea.IsDelete;
		B_Delete.Enabled	:= m_IsDelete;
// <035> MOD-END

//	end;

    B_RowChange .Enabled := m_IsUpdate;     // <016><019>
    B_Search    .Enabled := True;           // <016>

	m_cACControl	:= Screen.ActiveControl;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCommonFunctionOnKeyDown01 (TObject; var Word; TShiftState)			*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	(Key = VK_RETURN) or ((Key = VK_TAB) and (Shift = [])) then
    begin
        if not fnGetDtlNCode() then
            Exit;

        // 参照時Enterｲﾍﾞﾝﾄが実行されない為
//        if giReferFlag = REFER then

        if not fnCheckDtlExCodeValid then
            Exit;

		MjsDispCtrl.MjsNextCtrl (Self)
    end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
		P_ComBox.SetFocus ()
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		//HIS0032
		if	((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN)) then						// Altｷｰが押された時
			Exit;
// <009>↓
//		if	(Sender is TMTxtEdit) then
		if	(Sender is TMTxtEdit) and (Key = VK_RIGHT) then                             // 入力Edit内で→
// <009>↑
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCommonFunctionOnKeyDown02 (TObject; var Word; TShiftState)					*/
//*																											*/
//*	目的	: 補助登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

	if	(Key = VK_RETURN) or ((Key = VK_TAB) and (Shift = [])) then
		MjsDispCtrl.MjsNextCtrl (Self)
	// <003> -->
	//else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	//	DtlCmnButtonUpdate.SetFocus ()
	else if	(Key = VK_END) then
		DtlCmnButtonUpdate.SetFocus ()
	else if	(Key = VK_ESCAPE) then
    begin
		if DtlCmnEditExCodeFree.CanFocus then
        	DtlCmnEditExCodeFree.SetFocus()
        else if DtlCmnEditExCodeNumeric.CanFocus then
        	DtlCmnEditExCodeNumeric.SetFocus()
        else
			P_ComBox.SetFocus ();
    end
	// <003> <--
//	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	else if ((Key = VK_LEFT) or (Key = VK_UP)) and (Shift = []) then	// 051114
	begin
		if	(Sender is TMTxtEdit) then
		begin
//			if	(MJSChkCurTop (Sender as TComponent)) then
//				MJSDispCtrl.MjsPrevCtrl (Self);

            if DtlCmnEditAssociation.Focused = True then
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
                if (MJSChkCurTop (Sender as TComponent)) OR (Key = VK_UP) then	// 051114
    				MJSDispCtrl.MjsPrevCtrl (Self);
            end;
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end

    else if ((Key = VK_TAB) and (Shift = [ssShift])) then
        MJSDispCtrl.MjsPrevCtrl (Self)

	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) and (Shift = []) then		// 051114
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) OR (Key = VK_DOWN) then	// 051114
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;

//	abort;		HIS0034
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCommonFunctionOnKeyDown03 (TObject; var Word; TShiftState)					*/
//*																											*/
//*	目的	: 補助登録処理 共通(ComboBox用) OnKeyDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCommonFunctionOnKeyDown03 (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	cComboBox: TMComboBox;

begin
	cComboBox	:= Sender as TMComboBox;

	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
		Abort;
	end;

	// <003> -->
	//if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	//begin
	//	m_cACControl	:= DtlCmnButtonUpdate;
	//	m_cACControl.SetFocus ();
	//	Abort;
	//end;
	if	(Key = VK_END) then
    begin
		m_cACControl	:= DtlCmnButtonUpdate;
		m_cACControl.SetFocus ();
		Abort;
    end
	else if	(Key = VK_ESCAPE) then
    begin
		if DtlCmnEditExCodeFree.CanFocus then
			m_cACControl	:= DtlCmnEditExCodeFree
        else if DtlCmnEditExCodeNumeric.CanFocus then
			m_cACControl	:= DtlCmnEditExCodeNumeric
        else
        begin
			P_ComBox.SetFocus ();
            Abort;
        end;
		m_cACControl.SetFocus ();
		Abort;
    end;
	// <003> <--

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(cComboBox.ItemIndex = 0) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;

        Exit;
	end;

	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(cComboBox.ItemIndex = cComboBox.Items.Count - 1) then
		begin
			MJSDispCtrl.MjsNextCtrl (Self);
			Abort;
		end;

        Exit;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCommonFunctionOnBeforePrint (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnBeforePrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCommonFunctionOnBeforePrint (Sender: TObject);
begin
	m_cPrnSupport.BeforePrint (Sender);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnInstructionComboOnKeyDown (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 指示ｺﾝﾎﾞﾎﾞｯｸｽ OnKeyDown ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnInstructionComboOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//	if  (Key = VK_Return)   then
//	begin
//		if  (m_nCurrentMasterDiv = 0) then
//			Exit;

//		if  (StdCmnTab.Items [0].Selected) then
//		begin
//			m_cACControl    := StdCmnGridExist;

//			StdCmnGridExist.SetFocus;
//		end
//		else
//		begin
//			m_cACControl    := StdCmnGridTotal;

//			StdCmnGridTotal.SetFocus;
//		end;
//	end

	if	((Key = VK_ESCAPE) or (Key = VK_END)) then								// End & Esc
	begin
		Close;
		Abort;
	end;

	if	((Key = VK_TAB) and (Shift = [ssShift])) then							// Shift+Tab
		Abort;

	if	((Key = VK_RETURN) or (Key = VK_TAB)) then								// Enter & Tab
	begin
		m_fIgnoreProc	:= True;

		if	(fnChangeSelectionScreen ()) then
			CmnTreeView.SetFocus ();

		Abort;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnToolbarButtonPrintOnClick (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[印刷] OnClick ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnBPrintOnClick (Sender: TObject);
var
	cMemDataWork	 : TdxMemData;

    lvRet       :   Integer;            // <PRN>
    JNTPDlg     :   TFrmJNTPDialog;     // <PRN>

begin

	cMemDataWork	:= nil;

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
    	0:  begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ

    			fnPrintCheckListExtStandard ();
	    		cMemDataWork	:= CmnMemDataPrintExtStandard;
            end;
		1:	begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ

				fnPrintCheckListTtlStandard ();
				cMemDataWork	:= CmnMemDataPrintTtlStandard;
			end;
		2:	begin
				fnPrintCheckListSystem ();
				cMemDataWork	:= CmnMemDataPrintSystem;
    		end;
		3:	begin
				if (not fnPrintCheckListSegBun ()) then
                begin
				    m_cJNTArea.SetMasAppRecord;
                    Exit;
                end;
				cMemDataWork	:= CmnMemDataPrintSegBun;
    		end;
    end;

    uvHani.pvrYearKbn   := m_nDateFormatDivision;                           // 和暦西暦区分

    // <PRN>
    with PrtParam do
  	begin
    	Para		:=  uvHani;
        TargetMD    :=  cMemDataWork;
       	CorpSys		:=  uvSelSys;
   	end;

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( cMemDataWork.RecordCount = 0 ) then
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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnToolbarButtonDetailOnClick (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[一覧/詳細] OnClick ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnBDetailsOnClick (Sender: TObject);
var

	cNode	       : TTreeNode;
	stSelectRec    : ^TreeViewRec;
	stParentRec	   : ^TreeViewRec;
	strExCodeParent: String;
	strName		   : String;
begin
	if	(DtlCmnClientPanel.Visible) then
	begin
		DtlCmnClientPanel.Visible	:= FALSE;
		StdCmnClientPanel.Visible	:= TRUE;

		cNode		:= CmnTreeView.Selected;
		stSelectRec	:= cNode.Data;

		if ((stSelectRec^.nDivision = 0) or
            (stSelectRec^.nDivision = DIVISION_GENERAL)) then
		begin
			stParentRec		:= cNode.Parent.Data;
			strExCodeParent	:= stParentRec^.strExCode;
			strName			:= stParentRec^.strName;
		end
		else
		begin
			stParentRec		:= cNode.Data;
			strExCodeParent	:= stSelectRec^.strExCode;
			strName			:= stSelectRec^.strName;
		end;

		fnSetParentItemsInfoEx(stSelectRec^.nDivision, stSelectRec, stParentRec, strName,true);  //true 追加 <043>
		fnMoveGridRecordSelecter(stSelectRec^.nDivision, stSelectRec^.strExCode);

		m_cACControl	:= CmnTreeView;
		m_cACControl.SetFocus ();

		B_Details.Caption	:= '詳細(&T)';

		m_fChangeDetails	:= FALSE;

        // ﾌｧﾝｸｼｮﾝ設定<003>
        fnSetFncType(False,0);
	end
	else
	begin
		fnShowDetailScreen;

		B_Details.Caption	:= '一覧(&T)';

		if (giReferFlag	= REFER) then
		begin
			DtlCmnButtonUpdate.Enabled	:=	False;		//	更新ボタン
			DtlCmnButtonCancel.Enabled	:=	False;		//	取消ボタン
		end;

		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();

		fnSetDeleteButtonCondition ();

        // ﾌｧﾝｸｼｮﾝ設定<003>
        fnSetFncType(True,0);
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnToolbarButtonDeleteOnClick (TObject)								*/
//*																									*/
//*	目的	: 補助登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[削除] OnClick ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnBDeleteOnClick (Sender: TObject);
var
	cNode        : TTreeNode;
	stWorkRec    : ^TreeViewRec;
	stMessageRec : TMJSMsgRec;
	strExCode    : String;
	strMessage	 : String;
	nSumDivision : Integer;
    cExCode      : Currency;
    strErr       : String;         // <CHK>
    strMsg       : String;         // <CHK>
    strCode,                       // <CHK>
    strName      : String;         // <CHK>
begin

    //--- HIS0046 St -----
	if ( m_fSystemClear ) then
	begin
		m_fSystemClear := FALSE;

		if ( MJSMessageBoxEx (Self,
                              _SystemClear,
                              '警告',
                              mjWarning,
                              mjOkCancel,
                              mjDefCancel,
                              FALSE) = mrCancel ) then
			Exit;

		if ( not fnClearAllSystems() ) then
			Exit;

		fnRebuildTreeViewItems();
		fnSetParentItemsInfo();
		Exit;
	end;
    //--- HIS0046 Ed -----

    // ----------------------------
    //  フォーカス：ツリー
    // ----------------------------
	if ( CmnTreeView.Focused ) then
	begin
		cNode	  := CmnTreeView.Selected;
		stWorkRec := cNode.Data;
		strExCode := stWorkRec^.strExCode;
        cExCode   := stWorkRec^.cNCode;

		if ( stWorkRec^.nDivision = DIVISION_GENERAL ) then
       			nSumDivision := 0
		else    nSumDivision := stWorkRec^.nDivision;

		strMessage := '"' + stWorkRec^.strName;
        strName    := stWorkRec^.strName;  // <CHK>
	end
    // ----------------------------
    //  フォーカス：実在グリッド
    // ----------------------------
	else if	( Screen.ActiveControl.Name = StdCmnGridExist.Name ) then
	begin
		strExCode	 := StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString;
		cExCode		 := StdCmnGridExist.DataSource.DataSet.FieldByName('cNCode').AsCurrency;
		nSumDivision := 0;
		strMessage	 := '"' + StdCmnGridExist.DataSource.DataSet.FieldByName ('strNameSimple').AsString;
        strName      :=  StdCmnGridExist.DataSource.DataSet.FieldByName('strNameSimple').AsString;   // <CHK>
	end
    // ----------------------------
    //  フォーカス：合計グリッド
    // ----------------------------
	else if	( Screen.ActiveControl.Name = StdCmnGridTotal.Name ) then
	begin
		strExCode	 := StdCmnGridTotal.DataSource.DataSet.FieldByName ('strExCode').AsString;
		cExCode		 := StdCmnGridTotal.DataSource.DataSet.FieldByName('cNCode').AsCurrency;
		nSumDivision := 1;
		strMessage	 := '"' + StdCmnGridTotal.DataSource.DataSet.FieldByName ('strNameSimple').AsString;
        strName      := StdCmnGridTotal.DataSource.DataSet.FieldByName('strNameSimple').AsString;    // <CHK>
	end
    // ----------------------------
    //  フォーカス：詳細画面
    // ----------------------------
	else
	begin
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
        begin
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
        end
        // ﾌﾘｰ属性
		else
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);		// HIS0011
			strExCode	:= DtlCmnEditExCodeFree.Text;
        end;
        cExCode      := m_DtlNCode;
		nSumDivision := DtlCmnEditSumDivision.AsInteger;
		strMessage	 := '"' + DtlCmnEditNameSimple.Text;
        strName      := DtlCmnEditNameSimple.Text;   // <CHK>
	end;

	if ( Trim (strExCode) = '' ) then
		Exit;

    strCode := Trim(strExCode);                         // <CHK>
	if ( m_nCurrentCodeAttr <= 1 ) then
		strExCode := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);

	strMessage := strMessage + '"のレコードを' + stMessageRec.sMsg;

	if ( MJSMessageBoxEx (Self,
                          strMessage,
                          stMessageRec.sTitle,
                          stMessageRec.icontype,
                          stMessageRec.btntype,
                          stMessageRec.btndef,
                          stMessageRec.LogType) = mrYes ) then
	begin
        // <CHK>↓
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if ( not fnDelCheck(StrToFloat(CurrToStr(cExCode)), m_nCurrentMasterDiv, strErr) ) then
        begin
            strCode := m_cComArea.SetDspCodeAttr(strCode, m_nCurrentCodeDigit, m_nCurrentCodeAttr);
                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strMsg := strCode + ' ' + strName + ' ' + strErr;
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <CHK>↑

        SessionPractice(C_ST_PROCESS); 			// <032> ADD

		fnDeleteMasterRecord (nSumDivision, cExCode);
		fnResetParentItemsInfo ();

        SessionPractice(C_ED_PROCESS);      	// <032> ADD
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnTabOnEnter (TObject)									            */
//*																									*/
//*	目的	: 補助登録処理 ﾀﾌﾞ OnEnter ｲﾍﾞﾝﾄ												        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnTabOnEnter (Sender: TObject);
begin
	B_Details.Enabled    := False;
	B_Delete.Enabled	    := False;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnEnter (TObject)										*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
    fnCommonFunctionOnEnter02 (Sender);

	StdCmnGridExist.FocusedColumn	:= 1;

	fValueCheck	:= TRUE;

	if ((m_nCurrentCodeAttr <= 1) and
        (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
	begin
		if ((StdCmnMemDataExist.State in [dsInsert]) and
		    (StrToInt64(Trim(StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if ((StdCmnGridExist.FocusedNode.Strings [1] = '') or
        (not fValueCheck)) then
	begin
		B_Details.Enabled	        := FALSE;
		B_Delete.Enabled            := FALSE;
//		FusenButton.Enabled	        := FALSE;
        fnEnableToolbarButtonTag(false);
	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			B_Details.Enabled	:= TRUE
		else
			B_Details.Enabled	:= FALSE;

		fnEnableToolbarButtonTag (m_cJNTArea.IsFusen);

		fnSetDeleteButtonCondition ();
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnEnter (TObject)										*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridTotalOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
    fnCommonFunctionOnEnter02 (Sender);

	StdCmnGridTotal.FocusedColumn	:= 1;

	fValueCheck	:= TRUE;

	if ((m_nCurrentCodeAttr <= 1) and
        (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
	begin
		if ((StdCmnMemDataTotal.State in [dsInsert]) and
			(StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or
        (not fValueCheck)) then
	begin
		B_Details.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
//		FusenButton.Enabled	:= FALSE;
        fnEnableToolbarButtonTag(false);
	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			B_Details.Enabled	:= TRUE
		else
			B_Details.Enabled	:= FALSE;

		fnEnableToolbarButtonTag   (m_cJNTArea.IsFusen);
		fnSetDeleteButtonCondition ();
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnChangeNodeEx (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistOnChangeNodeEx (Sender: TObject);
var
    fValueCheck: Boolean;
begin
    fValueCheck := TRUE;

    if ((m_nCurrentCodeAttr <= 1) and
        (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
    begin
		if ((StdCmnMemDataExist.State in [dsInsert]) and
		    (StrToInt64 (Trim (StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

    if ((StdCmnGridExist.FocusedNode.Strings [1] = '') or
        (not fValueCheck)) then
	begin
		StdCmnGridExist.FocusedColumn   := 1;

		B_Details.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
        fnEnableToolbarButtonTag(false);
	end
	else
	begin
		if	(Screen.ActiveControl = StdCmnGridExist) then
		begin
			if	(giReferFlag <> BASICONLY) then											// 基本のみ以外	HIS0005
				B_Details.Enabled	:= TRUE
			else
				B_Details.Enabled	:= FALSE;

    		if (StdCmnMemDataExist.State in [dsInsert]) then
            begin
           		B_Delete.Enabled	:= FALSE;
                fnEnableToolbarButtonTag(false);
            end else
            begin
   	    		fnEnableToolbarButtonTag   (m_cJNTArea.IsFusen);
    	    	fnSetDeleteButtonCondition ();
            end;
		end;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnChangeNodeEx (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridTotalOnChangeNodeEx (Sender: TObject);
var
    fValueCheck: Boolean;

begin
	fValueCheck	:= TRUE;

    if ((m_nCurrentCodeAttr <= 1) and
        (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
    begin
		if ((StdCmnMemDataTotal.State in [dsInsert]) and
		    (StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
			fValueCheck := FALSE;
    end;

	if ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or
        (not fValueCheck)) then
	begin
		StdCmnGridTotal.FocusedColumn   := 1;

		B_Details.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
        fnEnableToolbarButtonTag(false);
	end
	else
	begin
		// <018>if ( Screen.ActiveControl.Name = StdCmnGridTotal.Name ) then
        if ( Screen.ActiveControl = StdCmnGridTotal ) then // <018>
		begin
			if	(giReferFlag <> BASICONLY) then
				B_Details.Enabled	:= TRUE
			else
				B_Details.Enabled	:= FALSE;

//			fnEnableToolbarButtonTag   (m_cJNTArea.IsFusen);
//			fnSetDeleteButtonCondition ();
    		if (StdCmnMemDataTotal.State in [dsInsert]) then
            begin
           		B_Delete.Enabled	:= FALSE;
                fnEnableToolbarButtonTag(false);
            end else
            begin
   	    		fnEnableToolbarButtonTag   (m_cJNTArea.IsFusen);
    	    	fnSetDeleteButtonCondition ();
            end;
		end;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnBeforeChangeColumn (TObject; TdxTreeListNode ...)	*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField        : TField;
	strExCode	  : String;
	strFormat	  : String;
    strName       : String;
    strNameSimple : String;
    iWork         : Integer;
begin

    // 外部ｺｰﾄﾞ
    if ( Column = 1 ) then
    begin
        with ( StdCmnDataSourceExist.DataSet ) do
        begin
            cField := FieldByName ('strExCode');

            // 有効ｺｰﾄﾞﾁｪｯｸ
			if ( not fnCheckExCodeValidCharacter (cField.AsString) ) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

            if  ( not StdCmnGridExist.Columns [1].ReadOnly ) then
            begin
                if ( not fnCheckMasterDataRecordValid (cField.AsString) ) then
                begin
 	 	 	        Beep ();

					// 同一ｺｰﾄﾞが存在してます
					m_cComArea.m_MsgStd.GetMsg ( m_cErrorMsgRec, 30 ,8 );
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,
                                    m_cErrorMsgRec.sMsg,
                                    m_cErrorMsgRec.sTitle,
                                    m_cErrorMsgRec.icontype,
                                    m_cErrorMsgRec.btntype,
                                    m_cErrorMsgRec.btndef,
                                    m_cErrorMsgRec.LogType);

                    CanChange := false;
                    cField.FocusControl;
                    Abort;
                end;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <015>
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
                // ↑↑↑<015>
                // -------------------------------------------------------------------------

				strExCode := TrimRight(cField.AsString);	// HIS0011

				if ( m_nCurrentCodeAttr <= 1 ) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode := Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				StdCmnMemDataExist.FieldByName ('strExCode').AsString := strExCode;

				if ( m_nCurrentMasterDiv = 22 ) then
				begin
					StdCmnMemDataExist.FieldByName ('nAdoptData01').AsInteger	:= 0;
					StdCmnMemDataExist.FieldByName ('nAdoptData02').AsInteger	:= 0;
				end;
            end;
        end;
    end;

    if ( Column = 2 ) then
    begin
        with ( StdCmnGridExist ) do
        begin
            if ( DataSource.DataSet.FieldByName ('strBkExp').AsString = '' ) then
            begin
                StdCmnGridExist.DataLink.Edit;
                DataSource.DataSet.FieldByName ('cBankNCode').AsFloat := 0;
            end;
        end;
    end;

// <005>↓
//    if  (Column = 3) then
    if ( Column = 4 ) then
// <005>↑
    begin
        with ( StdCmnGridExist ) do
        begin
            strNameSimple := DataSource.DataSet.FieldByName ('strNameSimple').AsString;

            if ( strNameSimple = '' ) then
            begin
                strName := DataSource.DataSet.FieldByName ('strName').AsString;

                if ( strName <> '' ) then
                begin
                    StdCmnGridExist.DataLink.Edit;
// <005>↓
{					if ( StrLen (PChar (strName)) <= 14 ) then
						    StdCmnGridExist.Columns [4].Field.AsString := Copy (strName, 1, 14)
					else    StdCmnGridExist.Columns [4].Field.AsString := MJSKabuCut (strName, 14);
}
					if ( MjsHanLength(strName) <= 14 ) then
						    StdCmnGridExist.Columns [6].Field.AsString := MjsHanCopy (strName, 1, 14)
					else    StdCmnGridExist.Columns [6].Field.AsString := MJSKabuCut (strName, 14);
// <005>↑
                end;
            end;
        end;
    end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnBeforeChangeColumn (TObject; TdxTreeListNode ...)	*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridTotalOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField        : TField;
	strExCode	  : String;
	strFormat	  : String;
    strName       : String;
    strNameSimple : String;
begin

    // 外部ｺｰﾄﾞ
    if ( Column = 1 ) then
    begin
        with ( StdCmnDataSourceTotal.DataSet ) do
        begin
            cField := FieldByName ('strExCode');

            // 有効ｺｰﾄﾞﾁｪｯｸ
			if ( not fnCheckExCodeValidCharacter (cField.AsString) ) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

            if ( not StdCmnGridTotal.Columns [1].ReadOnly ) then
            begin
                if  (not fnCheckMasterDataRecordValid (cField.AsString)) then
                begin
                    Beep ();

					// 同一ｺｰﾄﾞが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,
                                    m_cErrorMsgRec.sMsg,
                                    m_cErrorMsgRec.sTitle,
                                    m_cErrorMsgRec.icontype,
                                    m_cErrorMsgRec.btntype,
                                    m_cErrorMsgRec.btndef,
                                    m_cErrorMsgRec.LogType);
                    cField.FocusControl;
                    Abort;
                end;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <015>
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
                // ↑↑↑<015>
                // -------------------------------------------------------------------------

				strExCode	:= TrimRight(cField.AsString);						// HIS0011

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

    if ( Column = 3  ) then		
    begin
        with ( StdCmnGridTotal ) do
        begin
            strNameSimple := DataSource.DataSet.FieldByName ('strNameSimple').AsString;

            if ( strNameSimple = '' ) then
            begin
                strName := DataSource.DataSet.FieldByName ('strName').AsString;

                if ( strName <> '' ) then
                begin
                    StdCmnGridTotal.DataLink.Edit;

					if ( MjsHanLength(strName) <= 14 ) then
						    StdCmnGridTotal.Columns [4].Field.AsString := MjsHanCopy (strName, 1, 14)
					else    StdCmnGridTotal.Columns [4].Field.AsString := MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnMouseDown (TObject; TMouseButton; TShiftState...)				*/
//*																											*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridExistOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnMouseDown (TObject; TMouseButton; TShiftState...)				*/
//*																											*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridTotalOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
//*	関数	: fnCorpRelation    <015>		                                                        */
//*																									*/
//*	目的	: 会社関連付処理(ﾏｽﾀ同期)								                                */
//*																									*/
//*	戻り値	: 0: 対象外 1: 正常 2:ｷｬﾝｾﾙ -1: 実在合計不一致 -9:ｴﾗｰ                                   */
//*																									*/
//***************************************************************************************************/
function    TJNTCRP008001f.fnCorpRelation(pExCode: String; pSumKbn: Integer): Integer;
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
        m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, Qe );
        with m_cErrorMsgRec do
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
                           '銀行補助登録', mjQuestion, mjOk, mjDefOk);
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
                m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, Qe );
                with m_cErrorMsgRec do
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

                // <025> - ST
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
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, Qe);
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
                // <025> - ED

                // 構造体に情報を保存する
                m_stMasterData.nDivision        := pSumKbn;                 // 実在、合計区分
                m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;      // 加算先(親)外部ｺｰﾄﾞ
                m_stMasterData.cExCodeParent    := m_cExCodeCurrent;        // 加算先(親)内部ｺｰﾄﾞ
                m_stMasterData.strExCode        := strGCode;                // 加算元外部ｺｰﾄﾞ
                m_stMasterData.cExCode          := nPNCode;                 // 加算元内部ｺｰﾄﾞ
                m_stMasterData.strNameSimple    := strNameSimple;           // 簡略名称

                // 子会社DBの補助体系を更新する
                if ( fnUpdateMasterTreeRecord () = false ) then
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
                                   m_stMasterData.strNameSimple, // 簡略名称
                                   m_stMasterData.cExCode,       // 加算元内部ｺｰﾄﾞ
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

            m_NewRecord := true;
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

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnMemDataExistBeforePost (TDataSet)										*/
//*																											*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnMemDataExistBeforePost (DataSet: TDataSet);
var
    cFieldWork : TField;
    fValueCheck: Boolean;
    strExCode  : String;
begin

	fValueCheck	:= TRUE;

    if  ( m_fUpdateRecord ) then
    begin
        with DataSet do
        begin
            cFieldWork := FieldByName ('strExCode');

			if ( not fnCheckExCodeValidCharacter (cFieldWork.AsString) ) then
			begin
				cFieldWork.FocusControl ();
				Abort ();
			end;

            strExCode := StdCmnMemDataExist.FieldByName('strExCode').AsString;

            if  (m_nCurrentCodeAttr <= 1) then
        		    strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))])
           	else    strExCode	:= TrimRight(strExCode);

			if ( fValueCheck and (StdCmnMemDataExist.State in [dsInsert]) ) then
			begin
				if ( not fnCheckMasterDataRecordValid (cFieldWork.AsString) ) then
					fValueCheck	:= FALSE;
			end;
//<045> ADD St
            // 全銀協コード
            if (StdCmnMemDataExist.FieldByName ('strBkExp').AsString = '') then
            begin
                StdCmnMemDataExist.FieldByName('cBankNCode').AsFloat := 0;
            end;
//<045> ADD Ed
			if	( fValueCheck ) then
			begin
                // 実在/合計区分
				m_stMasterData.nDivision		:= 0;
                // 補助外部ｺｰﾄﾞ(親)
                m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;
                // 補助内部ｺｰﾄﾞ(親)
				m_stMasterData.cExCodeParent	:= m_cExCodeCurrent;
                // 補助内部ｺｰﾄﾞ
				m_stMasterData.cExCode		    := StdCmnMemDataExist.FieldByName('cNCode').AsCurrency;
                // 補助外部ｺｰﾄﾞ
				m_stMasterData.strExCode		:= StdCmnMemDataExist.FieldByName('strExCode'     ).AsString;
                // 連想
				m_stMasterData.strAssociation	:= StdCmnMemDataExist.FieldByName('strAssociation').AsString;
                // 正式名称
				m_stMasterData.strName			:= StdCmnMemDataExist.FieldByName('strName'       ).AsString;
                // 簡略名称
				m_stMasterData.strNameSimple	:= StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString;
                // 銀行内部ｺｰﾄﾞ
				m_stMasterData.cBankNCode   	:= StdCmnMemDataExist.FieldByName('cBankNCode'    ).AsCurrency;
                // 得意先区分
				m_stMasterData.nAssDivision01	:= 0;
                // 仕入先区分
				m_stMasterData.nAssDivision02	:= 0;
                // 詳細更新区分
				m_stMasterData.fDetails	        := FALSE;

				//↓<MLXDEP-3>
				if TMSeries.IsMjsLink3 = True then
				begin
					m_stMasterData.Yobi09		:= StdCmnMemDataExist.FieldByName('strBkExp' ).AsString;
					m_stMasterData.ZenBankNM	:= StdCmnMemDataExist.FieldByName('ZenBankNM' ).AsString;
					m_stMasterData.ZenOfficeNM	:= StdCmnMemDataExist.FieldByName('ZenOfficeNM' ).AsString;
				end;
				//↑<MLXDEP-3>

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <015>    insert状態の時のみ
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
                // ↑↑↑<015>
                // -------------------------------------------------------------------------

                SessionPractice(C_ST_PROCESS); 			// <032> ADD

                // 更新処理
				if ( not fnUpdateMasterRecord () ) then
				begin
					StdCmnMemDataExist.Cancel();
					StdCmnGridExist   .FocusedColumn := 1;

                    SessionPractice(C_ED_PROCESS);		// <032> ADD

					Abort;
				end;

                SessionPractice(C_ED_PROCESS); 			// <032> ADD

                // 内部ｺｰﾄﾞをStdCmnMemDataExistにPostする
                StdCmnMemDataExist.FieldByName('cNCode').AsCurrency := m_stMasterData.cExCode;
			end
            else
			begin
                Beep;
                Abort;
			end;
        end;
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnMemDataTotalBeforePost (TDataSet)										*/
//*																											*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnMemDataTotalBeforePost (DataSet: TDataSet);
var
	cFieldWork  : TField;
    fValueCheck : Boolean;
    strExCode   : String;
begin

	fValueCheck	:= TRUE;

    if  ( m_fUpdateRecord ) then
    begin
        with DataSet do
        begin
			cFieldWork := FieldByName ('strExCode');

			if ( not fnCheckExCodeValidCharacter (cFieldWork.AsString) ) then
			begin
				cFieldWork.FocusControl ();
				Abort ();
			end;

			if ( fValueCheck and (StdCmnMemDataTotal.State in [dsInsert]) ) then
			begin
				if ( not fnCheckMasterDataRecordValid (cFieldWork.AsString) ) then
					fValueCheck	:= FALSE;
			end;

			if ( fValueCheck ) then
			begin
                // 実在/合計区分
				m_stMasterData.nDivision		:= 1;
                // 補助外部ｺｰﾄﾞ(親)
                m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;
                // 補助内部ｺｰﾄﾞ(親)
				m_stMasterData.cExCodeParent	:= m_cExCodeCurrent;
                // 補助内部ｺｰﾄﾞ
				m_stMasterData.cExCode		    := StdCmnMemDataTotal.FieldByName ('cNCode').AsCurrency;
                // 補助外部ｺｰﾄﾞ
				m_stMasterData.strExCode		:= StdCmnMemDataTotal.FieldByName ('strExCode'     ).AsString;
                // 連想
				m_stMasterData.strAssociation	:= StdCmnMemDataTotal.FieldByName ('strAssociation').AsString;
                // 正式名称
				m_stMasterData.strName			:= StdCmnMemDataTotal.FieldByName ('strName'       ).AsString;
                // 簡略名称
				m_stMasterData.strNameSimple	:= StdCmnMemDataTotal.FieldByName ('strNameSimple' ).AsString;
                // 得意先区分
				m_stMasterData.nAssDivision01	:= 0;
                // 仕入先区分
				m_stMasterData.nAssDivision02	:= 0;
                // 銀行内部ｺｰﾄﾞ
				m_stMasterData.cBankNCode	    := 0;
                // 詳細更新区分
				m_stMasterData.fDetails			:= FALSE;

                // -------------------------------------------------------------------------
                //  ｸﾞﾙｰﾌﾟ管理処理 <015>    insert状態の時のみ
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
                // ↑↑↑<015>
                // -------------------------------------------------------------------------

                SessionPractice(C_ST_PROCESS); 				// <032> ADD

                // 更新処理
				if ( not fnUpdateMasterRecord () ) then
				begin
					StdCmnMemDataTotal.Cancel();
					StdCmnGridTotal.FocusedColumn := 1;

                    SessionPractice(C_ED_PROCESS); 			// <032> ADD

					Abort;
				end;

                SessionPractice(C_ED_PROCESS); 				// <032> ADD

                // 内部ｺｰﾄﾞをStdCmnMemDataTotalにPostする
                StdCmnMemDataTotal.FieldByName('cNCode').AsCurrency := m_stMasterData.cExCode;
			end
            else
			begin
				Beep;
				Abort;
			end;
        end;
    end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnDataSourceExistOnStateChange (TObject)							*/
//*																									*/
//*	目的	: 補助登録処理 実在補助ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnDataSourceExistOnStateChange (Sender: TObject);
begin
    if  (StdCmnMemDataExist.State in [dsInsert]) then
    	StdCmnGridExist.Columns [1].ReadOnly    := False
    else
		StdCmnGridExist.Columns [1].ReadOnly    := True;

	if  (StdCmnMemDataExist.Active and (StdCmnDataSourceExist.DataSet <> nil)) then
	begin
		if  (StdCmnGridExist.DataSource.DataSet.RecordCount = 0) then
        	StdCmnGridExist.Columns [1].ReadOnly    := False;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnDataSourceTotalOnStateChange (TObject)							*/
//*																									*/
//*	目的	: 補助登録処理 合計補助ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnDataSourceTotalOnStateChange (Sender: TObject);
begin

    if  (StdCmnMemDataTotal.State in [dsInsert]) then
    	StdCmnGridTotal.Columns [1].ReadOnly    := False
    else
		StdCmnGridTotal.Columns [1].ReadOnly    := True;

	if  (StdCmnMemDataTotal.Active and (StdCmnDataSourceTotal.DataSet <> nil)) then
	begin
		if  (StdCmnGridTotal.DataSource.DataSet.RecordCount = 0) then
        	StdCmnGridTotal.Columns [1].ReadOnly    := False;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewOnDragOver (TObject; TObject; Integer; Integer ...)			*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnDragOver ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewOnDragOver (Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
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
						PTreeViewRec (cNodeSrc.Data)^.strExCode, PTreeViewRec (cNodeDst.Data)^.strExCode)) then
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
		Accept	:= False;
		Exit;
	end;
//------------------------------------------------------------------------------HIS0021End
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewOnDragDrop (TObject; TObject; Integer; Integer)				*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ OnDragDrop ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewOnDragDrop (Sender, Source: TObject; X, Y: Integer);
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
    strExCodeDstParent: String;
    cExCodeDstParent  : Currency;
	stWork			  : ^TreeViewRec;		//HIS0018
begin
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
    begin
        strExCodeDstParent  := '';
        cExCodeDstParent    :=  0;
    end
    else
    begin
        strExCodeDstParent  :=  stWorkRecDstParent^.strExCode;
        cExCodeDstParent    :=  stWorkRecDstParent^.cNCode;
    end;

//-------------------------------------------------------------------------------------------------HIS0014Start
//	if stWorkRecSrcParent^.strExCode <> stWorkRecDstParent.strExCode then
	if stWorkRecSrcParent^.strExCode <> strExCodeDstParent then		//HIS0018
	begin
		stRecWork		:= cNodeSrc.Data;

		if	(not fnCheckTreeViewDropItem(cNodeDst, stRecWork^.cNCode, stRecWork^.nDivision)) then
			Exit;
	end;
//-------------------------------------------------------------------------------------------------HIS0014End



	if (stWorkRecSrc^.strExCode       = stWorkRecDst^.strExCode)  and
       (stWorkRecSrcParent^.strExCode = strExCodeDstParent     )  then
	begin
		Exit;
	end;

    SessionPractice(C_ST_PROCESS); 				// <033> ADD

    fnInsertMasterTreeRecord(stWorkRecSrc^.cNCode, stWorkRecSrcParent^.cNCode,
                             stWorkRecDst^.cNCode, cExCodeDstParent, strExCodeDstParent,
                             stWorkRecDst^.nDivision, ACCESS_CUTANDPASTE);

	fnUpdateTreeViewItemsEx (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent);

    SessionPractice(C_ED_PROCESS); 				// <033> ADD

//	fnDeleteCheck();	//HIS0023

	CmnTreeView.FullExpand ();

	fnResetParentItemsInfo ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuOnPopup (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ OnPopup ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuOnPopup (Sender: TObject);
var
	nCount		   : Integer;
	strCaption	   : String;
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
	nTagDivision   : Integer;

begin
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
		CmnTreeViewPopupMenuPaste.Enabled	:= m_IsUpdate;

	if	(not fnCheckMasterTreePasteValid (m_stWorkRecPaste.strExCode, cNode)) then
		CmnTreeViewPopupMenuPaste.Enabled	:= FALSE;

	if	(m_stWorkRecPaste.nDivision = 1) then
    begin
        if  (not fnCheckMasterTreeInsertValid (m_stWorkRecPaste.strExCode, stWorkRec^.strExCode)) then
			CmnTreeViewPopupMenuPaste.Enabled	:= FALSE;
    end;

	CmnTreeViewPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;
	CmnTreeViewPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;


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

		CmnTreeViewPopupMenuCopy .Enabled	:= m_IsUpdate;
		CmnTreeViewPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

		if	(stWorkRec^.nDivision = DIVISION_GENERAL) then
		begin
			if	(fnCheckPermitGeneralRecDelete ()) then
			begin
//				if (giReferFlag	<>	REFER) then						//	参照以外		HIS0005
// <035> MOD-STR
//		        CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete;
        		CmnTreeViewPopupMenuDelete.Enabled	:= m_IsDelete;
// <035> MOD-END
			end
			else
				CmnTreeViewPopupMenuDelete.Enabled	:= FALSE;
		end
		else
		begin
//			if (giReferFlag	<>	REFER) then							//	参照以外		HIS0005
// <035> MOD-STR
//          CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete;
        	CmnTreeViewPopupMenuDelete.Enabled	:= m_IsDelete;
// <035> MOD-END
//			else
//				CmnTreeViewPopupMenuDelete.Enabled	:= FALSE;
		end;

		nTagDivision	:= fnGetMasterDataTagInfo(stWorkRec^.cNCode);

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
//			if (giReferFlag	<>	REFER) then							//	参照以外		HIS0005
//				CmnTreeViewPopupMenuErase.Enabled	:= m_cJNTArea.IsFusen
//			else
//				CmnTreeViewPopupMenuErase.Enabled	:= FALSE;
    		CmnTreeViewPopupMenuErase.Enabled	:= m_IsUpdate;
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
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuDetailOnClick (TObject)								*/
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細] OnClick ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnTreeViewPopupMenuDetailOnClick (Sender: TObject);
var
	cNode: TTreeNode;

begin
    cNode           := m_cNodeRightClick;
    cNode.Selected  := True;

	fnShowDetailScreen ();

	B_Details.Caption:= '一覧(&T)';


	if (giReferFlag	= REFER)  then
	begin
		DtlCmnButtonUpdate.Enabled	:=	False;		//	更新ボタン
		DtlCmnButtonCancel.Enabled	:=	False;		//	取消ボタン
		exit;
	end;


	if	(m_nCurrentCodeAttr <= 1) then
		m_cACControl	:= DtlCmnEditExCodeNumeric
	else
		m_cACControl	:= DtlCmnEditExCodeFree;

	m_cACControl.SetFocus ();

    // ﾌｧﾝｸｼｮﾝ設定<003>
    fnSetFncType(True,0);

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuCutOnClick (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[切り取り] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuCutOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
    dqMasterTree   : TMQuery;

    eBasedNCode    : Extended;
    eSumNCode      : Extended;

begin
	m_cDataModule.BeginTran (m_cDBSelect);                                      // ﾄﾗﾝｻﾞｸｼｮﾝの開始

    cNode           := m_cNodeRightClick;
    cNodeParent     := cNode.Parent;
    stWorkRec       := cNode.Data;
    stWorkRecParent := cNodeParent.Data;

    m_stWorkRecPaste.nDivision  := stWorkRec^.nDivision;
    m_stWorkRecPaste.strExCode  := stWorkRec^.strExCode;
    m_stWorkRecPaste.strName    := stWorkRec^.strName;

    dqMasterTree    := TMQuery.Create (Self);                            // MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);                 // DBとMQueryの接続

    with (dqMasterTree) do
    begin

		Close ();
		SQL.Clear;

        SQL.ADD('Select HT.SumNCode,HT.BasedNCode,');
        SQL.ADD('HM1.GCode as BasedGCode,HM2.GCode as SumGCode ');
        SQL.ADD('FROM HojyoTree HT ');
        SQL.ADD('Left outer join HojyoMA HM1 On HM1.NCode = HT.BasedNCode ');
        SQL.ADD('Left outer join HojyoMA HM2 On HM2.NCode = HT.SumNCode ');
        SQL.ADD('Where MasterKbn = :nMasterDivision ');
        SQL.ADD('and SumGCode = :strDstCode and BasedGCode = :strSrcCode');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strDstCode'     ).AsString    := stWorkRecParent^.strExCode;
        ParamByName ('strSrcCode'     ).AsString    := stWorkRec^      .strExCode;

        if not Open then
        begin
            m_cDataModule.Rollback (m_cDBSelect);                               // ﾛｰﾙﾊﾞｯｸ(破棄)
            Exit;
        end;

        if Eof then
        begin
            m_cDataModule.Rollback (m_cDBSelect);                               // ﾛｰﾙﾊﾞｯｸ(破棄)
            Exit;
        end;

        eBasedNCode    := GetFld('BasedNCode').AsFloat;
        eSumNCode      := GetFld('SumNCode').AsFloat;

        SessionPractice(C_ST_PROCESS); 										   	// <033> ADD

		Close ();
		SQL.Clear;
        SQL.ADD('DELETE FROM HojyoTree ');
        SQL.ADD('WHERE MasterKbn = :nMasterDivision and ');
        SQL.Add('SumNCode = :DstCode and BasedNCode = :SrcCode');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('DstCode'     ).AsFloat    := eSumNCode;
        ParamByName ('SrcCode'     ).AsFloat    := eBasedNCode;

		ExecSQL;

        if  (Status <> 0) then                                                  // ｴﾗｰ
        begin
        	SessionPractice(C_ED_PROCESS); 										// <033> ADD
            m_cDataModule.Rollback (m_cDBSelect);                               // ﾛｰﾙﾊﾞｯｸ(破棄)
            Exit;
        end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
    end;

    SessionPractice(C_ED_PROCESS); 												// <033> ADD
    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)

    fnResetParentItemsInfo ();
    fnRebuildTreeViewItems ();

	dqMasterTree.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuCopyOnClick (TObject)                               */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｺﾋﾟｰ] OnClick ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuCopyOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
    lvNCode  : Extended;
    strName  : String;

begin
    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

    m_stWorkRecPaste.nDivision  := stWorkRec^.nDivision;
    m_stWorkRecPaste.strExCode  := stWorkRec^.strExCode;
    m_stWorkRecPaste.strName    := stWorkRec^.strName;


    if fnGetHojyoMA(MASTER_BANK,stWorkRec^.strExCode,strName,lvNCode) then
        m_stWorkRecPaste.cNCode  := lvNCode;

    cNode.Selected  := True;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuPasteOnClick (TObject)                              */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[張り付け] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuPasteOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
    strExCodeParent: String;
    cExCodeParent  : Currency;

begin
    cNode           := m_cNodeRightClick;
    cNodeParent     := cNode.Parent;
    stWorkRec       := cNode.Data;

    if  (cNodeParent = nil) then
        stWorkRecParent := nil
    else
        stWorkRecParent := cNodeParent.Data;

    if  (stWorkRecParent = nil) then
    begin
        strExCodeParent := '';
        cExCodeParent   :=  0;
    end
    else
    begin
        strExCodeParent :=  stWorkRecParent^.strExCode;
        cExCodeParent   :=  stWorkRecParent^.cNCode;
    end;

    if m_stWorkRecPaste.cNCode = stWorkRec^.cNCode then
        Exit;

	SessionPractice(C_ST_PROCESS); 				// <033> ADD


    fnInsertMasterTreeRecord(m_stWorkRecPaste.cNCode, 0,
                                stWorkRec^.cNCode, cExCodeParent, strExCodeParent,
                                stWorkRec^.nDivision, ACCESS_PASTE);

	fnUpdateTreeViewItemsEx2(cNode,
                             m_stWorkRecPaste.strExCode,
                             m_stWorkRecPaste.nDivision);

	SessionPractice(C_ED_PROCESS); 				// <033> ADD

//	fnDeleteCheck();	//HIS0023

	CmnTreeView.FullExpand ();

    fnResetParentItemsInfo ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuDeleteOnClick (TObject)                          */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[削除] OnClick ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuDeleteOnClick (Sender: TObject);
var
	cNode		 : TTreeNode;
	stWorkRec	 : ^TreeViewRec;
	stMessageRec : TMJSMsgRec;
	strMessage	 : String;
	nDivision	 : Integer;
// <036> ADD-STR
    strCode      : String;
    strErr       : String;
// <036> ADD-END
begin

	cNode     := m_cNodeRightClick;
	stWorkRec := cNode.Data;

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);

	strMessage := '"' + stWorkRec^.strName + '"のレコードを' +  stMessageRec.sMsg;

	if ( MJSMessageBoxEx(Self,strMessage, stMessageRec.sTitle, stMessageRec.icontype,
									stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType) = mrYes ) then
	begin
// <036> ADD-STR
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if ( not fnDelCheck(StrToFloat(CurrToStr(stWorkRec^.cNCode)), m_nCurrentMasterDiv, strErr) ) then
        begin
            strCode := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, m_nCurrentCodeAttr);
                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strMessage := strCode + ' ' + stWorkRec^.strName + ' ' + strErr;
            MjsMessageBoxEx(Self, strMessage, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
// <036> ADD-END

		if ( stWorkRec^.nDivision = DIVISION_GENERAL ) then
    			nDivision := 0
		else    nDivision := stWorkRec^.nDivision;

        SessionPractice(C_ST_PROCESS);   		// <032> ADD

		fnDeleteMasterRecord (nDivision, stWorkRec^.cNCode);
		fnResetParentItemsInfo ();

        SessionPractice(C_ED_PROCESS);  		// <032> ADD
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuEraseOnClick (TObject)                              */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[体系消去] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuEraseOnClick (Sender: TObject);
var
    cNode          : TTreeNode;
	cNodeErase	   : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;

begin
    cNode           := m_cNodeRightClick;
	cNodeErase		:= cNode;
    stWorkRec       := cNode.Data;
    cNode           := cNode.Parent;
    stWorkRecParent := cNode.Data;

    SessionPractice(C_ST_PROCESS); 				// <033> ADD

    fnEraseMasterTreeRecord(stWorkRec^.cNCode, stWorkRecParent^.cNCode);
	fnEraseTreeViewItems   (cNodeErase);

    SessionPractice(C_ED_PROCESS); 				// <033> ADD

    fnResetParentItemsInfo ();

	CmnTreeView.FullExpand ();		

//	fnRebuildTreeViewItems ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagRedOnClick (TObject)                             */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(赤)] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuTagRedOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
	nTagKind : Integer;

begin
    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

	if	((stWorkRec^.nDivision = 0) or (stWorkRec^.nDivision = DIVISION_GENERAL)) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 1;

	if	(fnUpdateMasterDataTagInfo(stWorkRec^.cNCode, nTagKind)) then
		nTagKind	:= nTagKind
	else
		nTagKind	:= 0;

    fnUpdateGridMemDataRecord(stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagGreenOnClick (TObject)                           */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(緑)] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuTagGreenOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
	nTagKind : Integer;

begin
    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

	if	((stWorkRec^.nDivision = 0) or (stWorkRec^.nDivision = DIVISION_GENERAL)) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 3;

	if	(fnUpdateMasterDataTagInfo(stWorkRec^.cNCode, nTagKind)) then
		nTagKind	:= nTagKind
	else
		nTagKind	:= 0;

	fnUpdateGridMemDataRecord(stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagBlueOnClick (TObject)                            */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(青)] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuTagBlueOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
	nTagKind : Integer;

begin
	cNode       := m_cNodeRightClick;
	stWorkRec   := cNode.Data;

	if	((stWorkRec^.nDivision = 0) or (stWorkRec^.nDivision = DIVISION_GENERAL)) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 2;

	if	(fnUpdateMasterDataTagInfo(stWorkRec^.cNCode, nTagKind)) then
		nTagKind	:= nTagKind
	else
		nTagKind	:= 0;

	fnUpdateGridMemDataRecord(stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOrangeOnClick (TObject)                          */
//*																									*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋(橙)] OnClick ｲﾍﾞﾝﾄ                                    */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOrangeOnClick (Sender: TObject);
var
    cNode    : TTreeNode;
    stWorkRec: ^TreeViewRec;
	nTagKind : Integer;

begin
    cNode       := m_cNodeRightClick;
    stWorkRec   := cNode.Data;

	if	((stWorkRec^.nDivision = 0) or (stWorkRec^.nDivision = DIVISION_GENERAL)) then
		cNode.Selected	:= TRUE;

	nTagKind	:= 4;

	if	(fnUpdateMasterDataTagInfo(stWorkRec^.cNCode, nTagKind)) then
		nTagKind	:= nTagKind
	else
		nTagKind	:= 0;

	fnUpdateGridMemDataRecord(stWorkRec^.nDivision, stWorkRec^.strExCode, nTagKind);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnClientPanelExistOnResize (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnClientPanelExistOnResize (Sender: TObject);
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
//*	関数	: TJNTCRP008001f.fnStdCmnClientPanelTotalOnResize (TObject)                                */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnClientPanelTotalOnResize (Sender: TObject);
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
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnEditing (TObject; TdxTreeListNode; var Boolean)        */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ OnEditing ｲﾍﾞﾝﾄ                                         */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistOnEditing (Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
//	StdCmnGridExist.FocusedField.DataSet.Edit;
//	StdCmnGridExist.FocusedField.AsString   := Node.Strings [StdCmnGridExist.FocusedColumn];
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnEditing (TObject; TdxTreeListNode; var Boolean)        */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ OnEditing ｲﾍﾞﾝﾄ                                         */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridTotalOnEditing (Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
//	StdCmnGridTotal.FocusedField.DataSet.Edit;
//	StdCmnGridTotal.FocusedField.AsString   := Node.Strings [StdCmnGridTotal.FocusedColumn];
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistOnKeyPress (TObject; Char)										*/
//*																											*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistOnKeyPress (Sender: TObject; var Key: Char);
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

	if	(StdCmnGridExist.FocusedColumn = 2) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			if	((Key <> #8) and (Key <> #27) and (Key <> #9)) then					// #8=BackSpace, #27=Esc, #9=Tab
			begin
				Beep ();
				Abort;
			end;
		end;
	end;





end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalOnKeyPress (TObject; Char)										*/
//*																											*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridTotalOnKeyPress (Sender: TObject; var Key: Char);
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
//*	関数	: TJNTCRP008001f.fnStdCmnGridExistCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 補助登録処理 実在補助用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridExistCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
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
//*	関数	: TJNTCRP008001f.fnStdCmnGridTotalCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 補助登録処理 合計補助用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnStdCmnGridTotalCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
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
//*	関数	: TJNTCRP008001f.fnDtlCmnEditExCodeOnEnter (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnEnter ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditExCodeOnEnter (Sender: TObject);
begin
	fnCommonFunctionOnEnter02 (Sender);

	m_fDtlChangeExCode	:= FALSE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnEditExCodeOnChange (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditExCodeOnChange (Sender: TObject);
begin
	m_fDtlChangeExCode	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnEditExCodeOnExit (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[補助外部ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditExCodeOnExit (Sender: TObject);
var
	fNewRecord: Boolean;
    stWorkRec : ^TreeViewRec;
//	stNewRec  : ^TreeViewRec;
    cNode     : TTreeNode;
	strExCode : String;
	nCount    : Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

{	0ｺｰﾄﾞが入可能となった為ﾁｪｯｸの必要なしの為ｺﾒﾝﾄ化
	if	(not (fnCheckCommonDetailScreenValue (0))) then
	begin
		Beep ();
		DtlCmnEditExCodeNumeric.SetFocus ();
		Abort;
	end;
}
	if	(not m_fDtlChangeExCode) then
		Exit;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);		//HIS0011
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
{
		if	(Trunc (DtlCs1EditTaxCodeSales.Value) = 0) then
		begin
			DtlCs1LabelDescTaxRateSales.Visible	:= FALSE;
			DtlCs1EditTaxRateSales     .Visible	:= FALSE;
			DtlCs1LabelTaxRateSalesDesc.Visible	:= FALSE;
		end
		else
		begin
			DtlCs1LabelDescTaxRateSales.Visible	:= TRUE;
			DtlCs1EditTaxRateSales     .Visible	:= TRUE;
			DtlCs1LabelTaxRateSalesDesc.Visible	:= TRUE;
		end;

		if	(Trunc (DtlCs1EditTaxCodeStock.Value) = 0) then
		begin
			DtlCs1LabelDescTaxRateStock.Visible	:= FALSE;
			DtlCs1EditTaxRateStock     .Visible	:= FALSE;
			DtlCs1LabelTaxRateStockDesc.Visible	:= FALSE;
		end
		else
		begin
			DtlCs1LabelDescTaxRateStock.Visible	:= TRUE;
			DtlCs1EditTaxRateStock     .Visible	:= TRUE;
			DtlCs1LabelTaxRateStockDesc.Visible	:= TRUE;
		end;
}
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
//		stWorkRec			:= cNode.Data;

//		if	((stWorkRec^.nDivision = 0) or (stWorkRec^.nDIvision = DIVISION_GENERAL)) then
//			cNode	:= cNode.Parent;

//		New (stNewRec);

//		stNewRec^.nDivision	:= DIVISION_NEWRECORD;
//		stNewRec^.strExCode	:= strExCode;
//		stNewRec^.strName	:= '新規作成';

//		cNode	:= CmnTreeView.Items.AddChildObject (cNode, stNewRec^.strName, stNewRec);

//		cNode.ImageIndex	:= 4;
//		cNode.SelectedIndex	:= 4;
//		cNode.Selected		:= TRUE;

		//m_fDtlNewRecord		:= TRUE; //<008>
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
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnEditNameOnKeyDown (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[正式名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditNameOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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

	if	(Key = VK_RETURN) or ((Key = VK_TAB) and (Shift = [])) then
	begin
		if	(strDuplicateDesc <> '') then
			DtlCmnEditNameSimple.Text	:= strDuplicateDesc;

		MjsDispCtrl.MjsNextCtrl (Self);

		Exit;
	end;

	if	((Key = VK_TAB) and (Shift = [ssShift])) then
	begin
		MJSDispCtrl.MjsPrevCtrl (Self);
		Exit;
	end;

	// <003> -->
	//if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	//begin
	//	DtlCmnButtonUpdate.SetFocus ();
    //
	//	Exit;
	//end;
	if	(Key = VK_END) then
	begin
		DtlCmnButtonUpdate.SetFocus ();
        Exit;
    end
	else if	(Key = VK_ESCAPE) then
    begin
		if DtlCmnEditExCodeFree.CanFocus then
        	DtlCmnEditExCodeFree.SetFocus()
        else if DtlCmnEditExCodeNumeric.CanFocus then
        	DtlCmnEditExCodeNumeric.SetFocus()
        else
			P_ComBox.SetFocus ();
		Exit;
    end;
	// <003> <--

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) AND (Key = VK_LEFT) then		// 051114
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
		if	(Sender is TMTxtEdit) AND (Key = VK_RIGHT) then	// 051114
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
//*	関数	: TJNTCRP008001f.fnDtlCmnEditNameSimpleOnEnter (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditNameSimpleOnEnter (Sender: TObject);
var
	stMessageRec : TMJSMsgRec;
//	strName		 : String;
//	strNameSimple: String;

begin
//	fnCommonFunctionOnEnter02 (Sender);
	fnDtlCommonFunctionOnEnter (Sender);

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

//<003>	CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
    fnSetFncType(True,7);

//	strNameSimple	:= DtlCmnEditNameSimple.Text;

//	if  (strNameSimple = '') then
//	begin
//		strName	:= DtlCmnEditName.Text;

//		if  (strName <> '') then
//			DtlCmnEditNameSimple.Text	:= Copy (strName, 1, 14);
//	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnEditNameSimpleOnExit (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditNameSimpleOnExit (Sender: TObject);
begin
//<003>	CmnStatusBar.SimpleText	:= '';
    fnSetFncType(False,7);
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnDtlCmnEditAppDateStartOnExit (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[適用開始年月日] OnExit ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditAppDateStartOnExit (Sender: TObject);
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
//*	関数	: TJNTCRP008001f.fnDtlCmnEditAppDateEndOnExit (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 ｴﾃﾞｨｯﾄ[適用終了年月日] OnExit ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnEditAppDateEndOnExit (Sender: TObject);
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
//*	関数	: TJNTCRP008001f.fnDtlCmnButtonUpdateOnClick (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 更新ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnButtonUpdateOnClick (Sender: TObject);
var
   	fNewRecord  : Boolean;
    iLoop       : Integer;
    stWorkRec   : ^TreeViewRec;
    strExCode   : String;
    bFlg        : Boolean;  // <015>
    iSumKbn     : Integer;
begin
try //<038> ADD
    // FX0047 必須入力ﾁｪｯｸ
    if ( not fnDtlChk ) then
    begin
//<044> ADD St
        MjsMessageBoxEX(self, 'コードの入力に誤りがあります。'+#13#10+'依頼先銀行のコードを指定してください。', '確認',
            MjInformation, MjOK, MjDefOK);
//<044> ADD Ed
        DtlCmnEditBankCode.SetFocus;
//<044> DEL        Abort;
        Exit;  //<044> ADD
    end;

    // -------------------------------------------------------------------------
    //  会社関連付処理 <015>
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
    	if	( DtlCmnTab.Items [0].Selected ) then
    		    iSumKbn := 0   // 実在
    	else    iSumKbn := 1;  // 合計

        case fnCorpRelation ( strExCode, 0 ) of
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
    // ↑↑↑<015>
    // -------------------------------------------------------------------------

    if ( not bFlg ) then
    begin
        // 更新処理
        if ( fnUpdateDetailsScreenRecord () ) then  // 正常
        begin
            // ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理
            fnCleanupTreeViewNewItem (FALSE);
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
   	if ( m_nCurrentCodeAttr <= 1 ) then
    begin
		strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])  // 数値属性
    end
	else
	begin
		DtlCmnEditExCodeFree.Text := TrimRight(DtlCmnEditExCodeFree.Text);		// ﾌﾘｰ属性 HIS0011
		strExCode := DtlCmnEditExCodeFree.Text;
	end;

    // TreeViewの検索
    for iLoop := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec := CmnTreeView.Items[iLoop - 1].Data;

        // ﾋｯﾄする外侮ｺｰﾄﾞを検索
        if ( CompareStr (stWorkRec^.strExCode, strExCode) = 0 ) then
        begin
            CmnTreeView.Items[iLoop - 1].Selected   := True;
            Break;
        end;
    end;

    // ﾌｫｰｶｽ設定
	if ( m_nCurrentCodeAttr <= 1 ) then
    		m_cACControl := DtlCmnEditExCodeNumeric
	else    m_cACControl := DtlCmnEditExCodeFree;
    m_cACControl.SetFocus();

    // ﾌﾘｰ項目情報初期化
    if ( m_UpdFreeFlg ) then
    begin
        m_UpdFreeFlg := false;
        m_freeItem   := m_freeItemNull;
    end;
//<038> ADD St
except
    on e : Exception do
    begin
        Showmessage('更新エラー：'+e.Message);
    end;
end;
//<038> ADD Ed
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnButtonCancelOnClick (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 取消ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnButtonCancelOnClick (Sender: TObject);
var
	nReturn: Integer;

begin
	nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	if (nReturn = CONFIRM_THROUGH) then
	begin
		fnCleanupTreeViewNewItem (True);
        
		fnResetDetailScreen		 ();

		m_fChangeDetails	:= FALSE;

		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnSetGridMemData (TMQuery)														*/
//*																											*/
//*	目的	: 補助登録処理 実在/合計補助ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ													*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 補助基本ﾏｽﾀ用ｸｴﾘｰ																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnSetGridMemData (dqMasterData: TMQuery);
var
	strExCode: String;
	strFormat: String;
    sBkCode  : String;
begin

	m_fUpdateRecord	:= FALSE;

	with (dqMasterData) do
	begin
		strExCode	:= FieldByName ('GCode').AsString;

		if	(m_nCurrentCodeAttr <= 1) then
		begin
			case (m_nCurrentCodeAttr) of
				0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
				1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
			end;

			strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
		end;

		if  (FieldByName ('SumKbn').AsInteger = 0) then
		begin
			StdCmnMemDataExist.Append ();

			StdCmnMemDataExist.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap_Grid (GetFld ('FusenKbn').AsInteger));
			StdCmnMemDataExist.FieldByName('strExCode'     ).AsString	:= strExCode;
			StdCmnMemDataExist.FieldByName('strAssociation').AsString	:= GetFld('Renso'     ).AsString;
			StdCmnMemDataExist.FieldByName('strName'       ).AsString	:= GetFld('LongName'  ).AsString;
			StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString	:= GetFld('SimpleName').AsString;
			StdCmnMemDataExist.FieldByName('strComment'    ).AsString	:= GetFld('FusenCmnt' ).AsString;
			StdCmnMemDataExist.FieldByName('cNCode'        ).AsCurrency := GetFld('NCode'     ).AsCurrency;
			StdCmnMemDataExist.FieldByName('cBankNCode'    ).AsCurrency	:= GetFld('BankNCode' ).AsCurrency;
			StdCmnMemDataExist.FieldByName('dtAppDateStart').AsDateTime := GetFld('TStartDate').AsDateTime;
			StdCmnMemDataExist.FieldByName('dtAppDateEnd'  ).AsDateTime := GetFld('TEndDate'  ).AsDateTime;

			if TMSeries.IsMjsLink3 = False then	//<MLXDEP-3>
			begin	//<MLXDEP-3>begin,end内を一段字下げ
	            //FX0047
	            if StdCmnMemDataExist.FieldByName('cBankNCode').AsCurrency <> 0 then
	            begin
	    			sBkCode :=  Format('%.4d-%.3d', [GetFld ('AllBkCode').AsInteger,
                                                GetFld ('AllBraCode').AsInteger]);

	    			StdCmnMemDataExist.FieldByName('lBkCode'     ).AsString := sBkCode;
	    			StdCmnMemDataExist.FieldByName('strBkExp'    ).AsString := sBkCode;
//	    			StdCmnMemDataExist.FieldByName('ZenBankNM'   ).AsString := GetFld('Vfree1'     ).AsString;
//	    			StdCmnMemDataExist.FieldByName('ZenOfficeNM' ).AsString := GetFld('Vfree2'     ).AsString;
	            end;
			//↓<MLXDEP-3>
			end
			else
			begin
	            if StdCmnMemDataExist.FieldByName('cBankNCode').AsCurrency <> 0 then
	            begin
					sBkCode													:=	GetFld('Yobi09').AsString ;
					StdCmnMemDataExist.FieldByName('ZenBankNM'   ).AsString	:=	GetFld('VFree1').AsString ;
					StdCmnMemDataExist.FieldByName('ZenOfficeNM' ).AsString	:=	GetFld('VFree2').AsString ;

	    			StdCmnMemDataExist.FieldByName('lBkCode'  ).AsString := sBkCode;
	     			StdCmnMemDataExist.FieldByName('strBkExp' ).AsString := sBkCode;
	            end;
			end;
			//↑<MLXDEP-3>

    		StdCmnMemDataExist.Post ();

			m_nGridExistRecords	:= m_nGridExistRecords + 1;
		end
		else
		begin
			StdCmnMemDataTotal.Append ();

			StdCmnMemDataTotal.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap_Grid (GetFld ('FusenKbn').AsInteger));
			StdCmnMemDataTotal.FieldByName('strExCode'     ).AsString   := strExCode;
			StdCmnMemDataTotal.FieldByName('strAssociation').AsString   := GetFld('Renso'     ).AsString;
			StdCmnMemDataTotal.FieldByName('strName'       ).AsString   := GetFld('LongName'  ).AsString;
			StdCmnMemDataTotal.FieldByName('strNameSimple' ).AsString   := GetFld('SimpleName').AsString;
			StdCmnMemDataTotal.FieldByName('strComment'    ).AsString	:= GetFld('FusenCmnt' ).AsString;
			StdCmnMemDataTotal.FieldByName('cNCode'        ).AsCurrency := GetFld('NCode'     ).AsCurrency;
			StdCmnMemDataTotal.FieldByName('cBankNCode'    ).AsCurrency	:= GetFld('BankNCode' ).AsCurrency;
			StdCmnMemDataTotal.FieldByName('dtAppDateStart').AsDateTime := GetFld('TStartDate').AsDateTime;
			StdCmnMemDataTotal.FieldByName('dtAppDateEnd'  ).AsDateTime := GetFld('TEndDate'  ).AsDateTime;

			StdCmnMemDataTotal.Post ();

			m_nGridTotalRecords	:= m_nGridTotalRecords + 1;
		end;
	end;
	m_fUpdateRecord	:= TRUE;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnSetParentItemsInfo ()													*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親に対する子情報をｾｯﾄ									*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnSetParentItemsInfo ();
var
    dqMasterData: TMQuery;
    stWorkRec   : ^TreeViewRec;
    cNode       : TTreeNode;
	strFormat	: String;
	strCaption	: String;

	iCount		: Integer;
	iCount2		: Integer;
begin
	cNode		:= CmnTreeView.Selected;
	stWorkRec   := cNode.Data;

	if	(stWorkRec^.strExCode = '') then
		Exit;

	m_strExCodeCurrent  := stWorkRec^.strExCode;
	m_cExCodeCurrent    := stWorkRec^.cNCode;

	strCaption	:= '';

	if	(stWorkRec^.nDivision <> 9) then
	begin
    	if  (m_nCurrentCodeAttr <= 1) then
		begin
        	case (m_nCurrentCodeAttr) of
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

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

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
        SQL.Add('SELECT Count(ht.BasedNCode) as Count FROM HojyoTree ht, HojyoMA hm ');
        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ON                                   ');
        SQL.Add('  (fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode)            ');
        SQL.Add('WHERE (ht.MasterKbn  = :nMasterKbn)                                ');
        SQL.Add('  AND (ht.SumNCode   = :cNCode)                                    ');
        SQL.Add('  AND (ht.MasterKbn  = hm.MasterKbn)                               ');
        SQL.Add('  AND (hm.RDelKbn    = 0)                                          ');
        SQL.Add('  AND (ht.BasedNCode = hm.NCode)                                   ');

		ParamByName('nMasterKbn').AsInteger  := m_nCurrentMasterDiv;
		ParamByName('cNCode')    .AsCurrency := m_cExCodeCurrent;
		Open;

		if not Eof then
			    iCount	:= GetFld('Count').AsInteger
		else    iCount	:= 0;

		Close();
        SQL.Clear();
		SQL.Add('SELECT ht.BasedNCode, hm.GCode, hm.SumKbn, hm.Renso, ');
		SQL.Add('       Bi.AllBkCode,Bi.AllBraCode, '); //FX0047
// <039> MOD-STR
//		SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, hm.BankNCode, ');
//<MLXDEP-3>		SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, Bi.NCode BankNCode, ');
// <039> MOD-END
//↓<MLXDEP-3>
		if TMSeries.IsMjsLink3 = False then
		begin
			SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, Bi.NCode BankNCode, ');
		end
		else
		begin
			SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, hm.BankNCode , hm.Yobi09 ,  hm.VFree1 ,  hm.VFree2 , ');
		end;
//↑<MLXDEP-3>
        SQL.Add('       hm.TStartDate,hm.TEndDate, fi.FusenKbn, fi.FusenCmnt ');
		SQL.Add('FROM   HojyoTree ht, HojyoMA hm ');

        //FX0047 Add
        SQL.Add('LEFT OUTER JOIN BankInfo Bi ');
		SQL.Add('ON    (Bi.NCode = hm.BankNCode) ');
		SQL.Add('AND   (Bi.RDelKbn = 0) ');             // <039> ADD
        //FX0047 Add

        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add('ON    (fi.MasterKbn=hm.MasterKbn AND fi.NCode=hm.NCode) ');
		SQL.Add('WHERE ht.MasterKbn=:nMasterKbn ');
		SQL.Add('AND   ht.MasterKbn=hm.MasterKbn ');
		SQL.Add('AND   hm.RDelKbn=0 AND ht.BasedNCode = hm.NCode ');
        SQL.Add('AND   ht.SumNCode=:cNCode ');
		SQL.Add('ORDER BY ht.EntNo');

		SetFld('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		SetFld('cNCode').AsCurrency     := m_cExCodeCurrent;
		Open ();

		iCount2	:= 1;
		while (not EOF) do
		begin
			fnSetGridMemData(dqMasterData);

			//HIS0034
			if iCount <> 0 then
			begin
				Prog1.Position	:= (iCount2 * 100 div iCount) + 50;

				inc(iCount2);
			end;

			NEXT;
		end;
//↓<MLXDEP-2>何も登録なしで開いた場合にfnSetGridMemDataが流れずm_fUpdateRecordがTrueにならないのでここで行う。MLXは諸口なし
		if (EOF) and (TMSeries.IsMjsLink3 = True) then
		begin
			m_fUpdateRecord	:= TRUE;
		end;
//↑<MLXDEP-2>
		Close ();
    end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

    if ( m_nGridExistRecords <> 0) then
    	StdCmnMemDataExist.First ();
    if ( m_nGridTotalRecords <> 0 ) then
    	StdCmnMemDataTotal.First ();

	StdCmnGridExist.EndUpdate;
    StdCmnGridTotal.EndUpdate;

	dqMasterData.Free ();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnSetParentItemsInfoEx (Integer; String; String; String)					*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親に対する子情報をｾｯﾄ									*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision			= 実在/合計区分 (0:実在, 1:合計, 9:総合計)							*/
//*			  pTView			= 補助内部ｺｰﾄﾞ														*/
//*			  pTViewParent	    = 補助内部ｺｰﾄﾞ(親)													*/
//*			  strName			= 名称																*/
//*                                                                                                 */
//***************************************************************************************************/
procedure TJNTCRP008001f.fnSetParentItemsInfoEx(nDivision: Integer;
            pTView, pTViewParent: Pointer; strName: String;bDtlTab:Boolean=False);  //bDtlTab追加 <043>
var
    dqMasterData: TMQuery;
	strFormat	: String;
	strCaption	: String;

	iCount		: Integer;
	iCount2		: Integer;
    stTView     : ^TreeViewRec;
    stTViewParent   : ^TreeViewRec;
begin

    stTView         :=  pTView;
    stTViewParent   :=  pTViewParent;
	Prog1.Position		:= 0;		//HIS0033
	Prog1.Visible		:= True;    //HIS0033

	if	((nDivision = 0) or (nDivision = DIVISION_GENERAL)) then
	begin
		if	(stTViewParent^.strExCode = '') then
			Exit;

		m_strExCodeCurrent	:= stTViewParent^.strExCode;
		m_cExCodeCurrent	:= stTViewParent^.cNCode;
	end
	else
	begin
		if	(stTView^.strExCode = '') then
			Exit;

		m_strExCodeCurrent	:= stTView^.strExCode;
		m_cExCodeCurrent	:= stTView^.cNCode;
//		m_strExCodeCurrent	:= '          ';
	end;

	strCaption	:= '';

	if	(m_strExCodeCurrent <> '          ') then
	begin
        if StdCmnClientPanel.Visible then
        begin
//<043> MOD St
//        	StdCmnTab.Items.Selected := 0;      // 実在ﾀﾌﾞに移動
//        	StdCmnGridExist.SetFocus;
            if bDtlTab then
                StdCmnTab.Items.Selected := DtlCmnTab.Items.Selected
            else
                StdCmnTab.Items.Selected := 0;

            if StdCmnGridTotal.CanFocus = true then
                StdCmnGridTotal.SetFocus
            else
                StdCmnGridExist.SetFocus;
//<043> MOD Ed
        end;

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
	end else
    begin

        if StdCmnClientPanel.Visible then
        begin

            // '銀行体系'選択時
//<043> MOD St
//        	StdCmnTab.Items.Selected := 1;      // 合計ﾀﾌﾞに移動
//    	    StdCmnGridTotal.SetFocus;
            if bDtlTab then
                StdCmnTab.Items.Selected := DtlCmnTab.Items.Selected
            else
                StdCmnTab.Items.Selected := 1;

            if StdCmnGridTotal.CanFocus = true then
                StdCmnGridTotal.SetFocus
            else
                StdCmnGridExist.SetFocus;
//<043> MOD Ed
        end;
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
//------------------------------------------------------------------------------HIS0033Start
	    Close;
		SQL.Clear;
		SQL.Add('SELECT Count(ht.BasedNCode) as Count ');
		SQL.Add('FROM   HojyoTree ht, HojyoMA hm ');
        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add('ON     (fi.MasterKbn=hm.MasterKbn AND fi.NCode=hm.NCode) ');
		SQL.Add('WHERE ');
        SQL.Add('ht.MasterKbn=:nMasterKbn AND ');
        SQL.Add('ht.MasterKbn=hm.MasterKbn AND');
		SQL.Add('hm.RDelKbn=0 AND ht.BasedNCode=hm.NCode AND');
        SQL.Add('ht.SumNCode=:cNCode ');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('cNCode'    ).AsCurrency   := m_cExCodeCurrent;
		Open;

		if not Eof then
			iCount	:= GetFld('Count').AsInteger
		else
			iCount	:= 0;
//------------------------------------------------------------------------------HIS0033End


		Close ();

		SQL.Clear ();
		SQL.Add('SELECT ht.BasedNCode,hm.GCode, hm.SumKbn, hm.Renso, ');

		SQL.Add('       Bi.AllBkCode,Bi.AllBraCode, '); //FX0047
// <039> MOD-STR
//		SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, hm.BankNCode, ');
		SQL.Add('       hm.LongName,  hm.SimpleName, hm.NCode, Bi.NCode BankNCode, ');
// <039> MOD-END
        SQL.Add('       hm.TStartDate,hm.TEndDate, fi.FusenKbn, fi.FusenCmnt ');
		SQL.Add('FROM   HojyoTree ht, HojyoMA hm ');

        //FX0047 Add
        SQL.Add('LEFT OUTER JOIN BankInfo Bi ');
		SQL.Add('ON    (Bi.NCode = hm.BankNCode) ');
		SQL.Add('AND   (Bi.RDelKbn = 0) ');             // <039> ADD
        //FX0047 Add

        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add('ON    (fi.MasterKbn=hm.MasterKbn AND fi.NCode=hm.NCode) ');
		SQL.Add('WHERE ht.MasterKbn=:nMasterKbn ');
		SQL.Add('AND   ht.MasterKbn=hm.MasterKbn ');
		SQL.Add('AND   hm.RDelKbn=0 AND ht.BasedNCode = hm.NCode ');
        SQL.Add('AND   ht.SumNCode=:cNCode');
		SQL.Add('ORDER BY ht.EntNo');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('cNCode'    ).AsCurrency   := m_cExCodeCurrent;

		Open ();

		iCount2	:= 1;	//HIS0033

		while (not EOF) do
		begin
			fnSetGridMemData (dqMasterData);

			//HIS0033
			if iCount <> 0 then
			begin
				Prog1.Position	:= iCount2 * 100 div iCount;

				inc(iCount2);
			end;

			NEXT;
		end;

		Close ();
    end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	Prog1.Visible		:= False;	//HIS0033

	dqMasterData.Free ();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateParentItemsInfoCaption (String; String)							*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親情報を更新											*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode		= 補助外部ｺｰﾄﾞ															*/
//*			  strNameSimple	= 簡略名称																*/
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnUpdateParentItemsInfoCaption (strExCode: String; strNameSimple: String);
var
	strFormat	: String;
	strCaption	: String;

begin
	if	(CompareStr (m_strExCodeCurrent, strExCode) <> 0) then
		Exit;

	if	(strExCode = '') then
		Exit;

	strCaption	:= '';

   	if  (m_nCurrentCodeAttr <= 1) then
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
//*	関数	: TJNTCRP008001f.fnInitializeDetailScreen (Boolean)												*/
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
procedure	TJNTCRP008001f.fnInitializeDetailScreen (fClearExCode: Boolean);
var
    i           :   Integer;
    cTxtEdit    :   TMTxtEdit;
    cLabel      :   TMLabel;
begin
	if	(fClearExCode) then
	begin
		DtlCmnEditExCodeNumeric.Value		:= 0;
		DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
		DtlCmnEditExCodeFree   .Text		:= '';
	end;

    DtlCmnLabelZenginName.Caption   := '';      //FX0047 Add
    MLabel2.Caption := '';                      //<012>
    DtlCmnEditBankCode    .Value    := 0;
    DtlCmnEditBrCode      .Value    := 0;

    DtlCmnEditBrCode      .Zero    := False;
    DtlCmnEditBankCode    .Zero    := False;


    DtlCmnEditBkNCode     .Value    := 0;

	DtlCmnEditAssociation .Text		:= '';										// 連想ｼﾝﾎﾞﾙ
	DtlCmnEditName        .Text		:= '';										// 正式名称
	DtlCmnEditNameSimple  .Text		:= '';										// 簡略名称
	DtlCmnEditAppDateStart.Value	:= 0;										// 適用開始期間
	DtlCmnEditAppDateStart.Clear ();
	DtlCmnEditAppDateEnd  .Value	:= 0;										// 適用終了期間
	DtlCmnEditAppDateEnd  .Clear ();

	m_nSelectTagKind	:= 0;

	DtlCmnImageTag.Picture	:= nil;

    for i := 1 to 10 do
    begin
        cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
        cLabel   := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspBun%.2d%.', [i])));

        cTxtEdit.text := '';
        cLabel.Caption := '';
    end;

    for i := 1 to 10 do
    begin
        cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
        cLabel   := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspSeg%.2d%.', [i])));

        cTxtEdit.text := '';
        cLabel.Caption := '';
    end;
//<047> ADD St
    m_UpdFreeFlg := FALSE;
    m_freeItem   := m_freeItemNull;
//<047> ADD Ed
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnSetDetailScreenInfo (String; var Integer)										*/
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
function	TJNTCRP008001f.fnSetDetailScreenInfo(cNCode: Currency; var nSumDivision: Integer): Boolean;
var
	dqMasterData: TMQuery;
	fNewRecord  : Boolean;
    sBkName     : String;
    i           : Integer;
    cTxtEdit    : TMTxtEdit;
    cLabel      : TMLabel;
    strFldName  : String;

    lvName      : String;
    lvGCode     : String;

begin
	fNewRecord	:= TRUE;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= fNewRecord;

		Exit;
	end;

	fnInitializeDetailScreen (FALSE);

	dqMasterData    := TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
    	Close ();

		SQL.Clear ();
		SQL.Add('SELECT hm.SumKbn, hm.GCode,hm.NCode,hm.SyokuchiKbn,');
        SQL.Add('hm.Renso,hm.LongName,hm.SimpleName,');

        SQL.Add('HM.BunruiNCode1,HM.BunruiNCode2,HM.BunruiNCode3,HM.BunruiNCode4,HM.BunruiNCode5,');
        SQL.Add('HM.BunruiNCode6,HM.BunruiNCode7,HM.BunruiNCode8,HM.BunruiNCode9,HM.BunruiNCode10,');
        SQL.Add('HM.SegNCode1,HM.SegNCode2,HM.SegNCode3,HM.SegNCode4,HM.SegNCode5,');
        SQL.Add('HM.SegNCode6,HM.SegNCode7,HM.SegNCode8,HM.SegNCode9,HM.SegNCode10,');

// <039> MOD-STR
//		SQL.Add('hm.TStartDate,hm.TEndDate,hm.BankNCode,hm.LimitSum,');
		SQL.Add('hm.TStartDate,hm.TEndDate,bi.NCode BankNCode,hm.LimitSum,');
// <039> MOD-END
		SQL.Add('fi.FusenKbn, fi.FusenCmnt,');
        SQL.Add('bi.AllBkCode, bi.AllBraCode, Bi.BankName, bi.BkBraName ');
		SQL.Add('FROM   HojyoMA hm ');
        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ON');
		SQL.Add(' (fi.MasterKbn=hm.MasterKbn AND fi.NCode=hm.NCode)');
        SQL.Add('LEFT OUTER JOIN BankInfo bi ON');
		SQL.Add(' (bi.NCode=hm.BankNCode)');
		SQL.Add('  AND (bi.RDelKbn = 0) ');             // <039> ADD
		SQL.Add('WHERE hm.MasterKbn=:nMasterKbn AND hm.RDelKbn=0 AND hm.NCode = :cNCode');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
        ParamByName ('cNCode'    ).AsCurrency   := cNCode;

        Open ();

//        if  (not EOF) then
		if not dqMasterData.Eof then
        begin
            m_DtlNCode  :=  cNCode;

			if  (m_nCurrentCodeAttr <= 1) then
			begin
				DtlCmnEditExCodeNumeric.Value		:= StrToInt64 (Trim (FieldByName ('GCode').AsString));
				DtlCmnEditExCodeNumeric.InputFlag	:= FALSE;
			end
			else
				DtlCmnEditExCodeFree.Text	:= FieldByName ('GCode').AsString;

			m_fDtlChangeExCode	:= FALSE;	// <049> ADD

            if (FieldByName ('BankNCode').AsFloat = 0) or (FieldByName ('BankNCode').IsNull) then
                sBkName                 :=  ''
            else
            begin
                sBkName                 := TrimRight(FieldByName('BankName').AsString) + '／'
                                        +  TrimRight(FieldByName('BkBraName').AsString);
                DtlCmnEditBankCode.Zero := True;
                DtlCmnEditBrCode.Zero   := True;
                DtlCmnEditBankCode.Value := 0;
                DtlCmnEditBrCode.Value   := 0;
            end;

            DtlCmnLabelZenginName.Caption   :=  sBkName;
            MLabel2.Caption := '－';                                             //<012>

            DtlCmnEditBankCode.Value    := FieldByName ('AllBkCode' ).AsInteger;
            DtlCmnEditBrCode.Value      := FieldByName ('AllBraCode').AsInteger;
            DtlCmnEditBkNCode.Value     := FieldByName ('BankNCode').AsFloat;

			DtlCmnEditSumDivision.Value	:= FieldByName ('SumKbn'    ).AsInteger;
			DtlCmnEditAssociation.Text	:= FieldByName ('Renso'     ).AsString;
			DtlCmnEditName       .Text	:= FieldByName ('LongName'  ).AsString;
			DtlCmnEditNameSimple .Text	:= FieldByName ('SimpleName').AsString;

			if	(FieldByName ('SumKbn').AsInteger = 0) then
			begin

                fnCheckTekiDate(dqMasterData);

//  				DtlCmnEditAppDateStart  .AsDateTime	:= FieldByName ('TStartDate'  ).AsDateTime;
//   				DtlCmnEditAppDateEnd  .AsDateTime	:= FieldByName ('TEndDate'  ).AsDateTime;
			end;

//			if ((not FieldByName ('NCode').IsNull) and
//                (    FieldByName ('NCode').AsInteger = 0)) then
			if (FieldByName ('SyokuchiKbn').AsInteger = 1) then

			begin
				nSumDivision	:= DIVISION_GENERAL;

				fnChangeComponentState (nSumDivision);
			end
			else
			begin
				nSumDivision	:= FieldByName ('SumKbn').AsInteger;

				fnChangeComponentState (nSumDivision);

			end;

			m_nSelectTagKind	:= FieldByName ('FusenKbn').AsInteger;					// 付箋情報

			case (m_nSelectTagKind) of
				0:	DtlCmnImageTag.Picture	:= nil;
				1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
				2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
				3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
				4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
			end;

			fNewRecord	:= FALSE;

            // 銀行分類・ｾｸﾞﾒﾝﾄ     外部ｺｰﾄﾞ&名称取得
            for i := 1 to 10 do
            begin
                // 銀行分類
                strFldName  := Format ('BunruiNCode%.1d%.', [i]);
                cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
                cLabel   := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspBun%.2d%.', [i])));

                if (FieldByName (strFldName).IsNull) or (FieldByName (strFldName).AsFloat = 0) then
                begin
                    cTxtEdit.text   := '';
                    cLabel.Caption  := '';
                end
                else
                begin
                    if fnGetGCode(cTxtEdit.tag,FieldByName (strFldName).AsFloat,lvName,lvGCode) then
                    begin
                        cTxtEdit.text   := lvGCode;
                        cLabel.Caption  := lvName;
                    end
                end;

                // ｾｸﾞﾒﾝﾄ
                strFldName  := Format ('SegNCode%.1d%.', [i]);
                cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
                cLabel   := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspSeg%.2d%.', [i])));

                if (FieldByName (strFldName).IsNull) or (FieldByName (strFldName).AsFloat = 0) then
                begin
                    cTxtEdit.text   := '';
                    cLabel.Caption  := '';
                end
                else
                begin

                    if fnGetGCode(cTxtEdit.tag,FieldByName (strFldName).AsFloat,lvName,lvGCode) then
                    begin
                        cTxtEdit.text   := lvGCode;
                        cLabel.Caption  := lvName;
                    end
                end;

            end;

        end
		else
			fNewRecord	:= TRUE;

		Close ();
    end;

	Result	:= fNewRecord;

	dqMasterData.Free ();

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetNameSimple (Integer)													*/
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
function    TJNTCRP008001f.fnGetNameSimple (nExCode: Integer): String;
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
		SQL.Add   ('WHERE  MasterKbn=3 AND SumKbn=0 AND RDelKbn=0 AND GCode=:nExCode');

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
//*	関数	: TJNTCRP008001f.fnShowDetailScreen ()																*/
//*																											*/
//*	目的	: 補助登録処理 詳細画面表示処理																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnShowDetailScreen ();
var
	cNode       : TTreeNode;
	stWorkRec   : ^TreeViewRec;
	nSumDivision: Integer;
    cNCode      : Currency;

begin
	m_fUnderConstruction	:= TRUE;

	if	(Screen.ActiveControl = StdCmnGridExist) then							// 実在補助ｸﾞﾘｯﾄﾞ
	begin
        cNCode  :=  StdCmnMemDataExist.FieldByName('cNCode').AsCurrency;
		nSumDivision	:= 0;
	end
	else if	(Screen.ActiveControl = StdCmnGridTotal) then						// 合計補助ｸﾞﾘｯﾄﾞ
	begin
        cNCode  :=  StdCmnMemDataTotal.FieldByName('cNCode').AsCurrency;
		nSumDivision	:= 1;
	end
//----------------------------------------------------------------------------------------HIS0013Start
	else if (Screen.ActiveControl = DtlCmnButtonUpdate) then			//更新ボタンが押された時
	begin
        cNCode  :=  m_DtlNCode;
        if DtlCmnTab.Items[0].Selected = True then
			nSumDivision	:= 0
		else
			nSumDivision	:= 1;
	end
//-----------------------------------------------------------------------------------------HIS0013End
	else																				// ﾂﾘｰﾋﾞｭｰ
	begin
	    cNode		    := CmnTreeView.Selected;
    	stWorkRec	    := cNode.Data;
        cNCode          := stWorkRec^.cNCode;
		nSumDivision    := stWorkRec^.nDivision;
	end;

	fnSetDetailScreenInfo(cNCode, nSumDivision);

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

	m_fUnderConstruction	:= FALSE;
	m_fChangeDetails		:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnResetDetailScreen ()													*/
//*																									*/
//*	目的	: 補助登録処理 詳細画面再ｾｯﾄ処理														*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:新規ﾚｺｰﾄﾞ, FALSE:既存ﾚｺｰﾄﾞ)											*/
//*																									*/
//***************************************************************************************************/
function	TJNTCRP008001f.fnResetDetailScreen (): Boolean;
var
	fNewRecord	: Boolean;
	nSumDivision: Integer;

begin

	fNewRecord	:= fnSetDetailScreenInfo(m_DtlNCode, nSumDivision);

	StdCmnClientPanel.Visible	:= FALSE;
	DtlCmnClientPanel.Visible	:= TRUE;

	Result	:= fNewRecord;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnResetParentItemsInfo ()													*/
//*																									*/
//*	目的	: 補助登録処理 現在選択されている親に対する子情報を再ｾｯﾄ								*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnResetParentItemsInfo ();
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
			SQL.Add('SELECT SimpleName FROM HojyoMA ');
        	SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
			SQL.Add('       SumKbn=1 AND RDelKbn=0 AND GCode=:sGCode');

            ParamByName ('nMasterKbn').AsInteger   := m_nCurrentMasterDiv;
            ParamByName ('sGCode'    ).AsString    := m_strExCodeCurrent;

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
		SQL.Add('SELECT HT.BasedNCode, HM.GCode, HM.SumKbn, ');

		SQL.Add('       Bi.AllBkCode,Bi.AllBraCode, '); //FX0047

// <039> MOD-STR
//      SQL.Add('       HM.Renso, HM.LongName, HM.SimpleName, HM.NCode, HM.BankNCode, ');
//<MLXDEP-3>        SQL.Add('       HM.Renso, HM.LongName, HM.SimpleName, HM.NCode, Bi.NCode BankNCode, ');
//↓<MLXDEP-3>
		if TMSeries.IsMjsLink3 = False then
		begin
        	SQL.Add('       HM.Renso, HM.LongName, HM.SimpleName, HM.NCode, Bi.NCode BankNCode, ');
		end
		else
		begin
        	SQL.Add('       HM.Renso, HM.LongName, HM.SimpleName, HM.NCode, hm.BankNCode, hm.Yobi09 ,  hm.VFree1 ,  hm.VFree2 ,');
		end;
//↑<MLXDEP-3>
// <039> MOD-END
		SQL.Add('       HM.TStartDate, HM.TEndDate, Fi.FusenKbn, Fi.FusenCmnt, ');
        SQL.Add('HM.BunruiNCode1,HM.BunruiNCode2,HM.BunruiNCode3,HM.BunruiNCode4,HM.BunruiNCode5,');
        SQL.Add('HM.BunruiNCode6,HM.BunruiNCode7,HM.BunruiNCode8,HM.BunruiNCode9,HM.BunruiNCode10,');
        SQL.Add('HM.SegNCode1,HM.SegNCode2,HM.SegNCode3,HM.SegNCode4,HM.SegNCode5,');
        SQL.Add('HM.SegNCode6,HM.SegNCode7,HM.SegNCode8,HM.SegNCode9,HM.SegNCode10 ');
		SQL.Add('FROM   HojyoTree ht, HojyoMA hm ');

        //FX0047 Add
        SQL.Add('LEFT OUTER JOIN BankInfo Bi ');
		SQL.Add('ON    (Bi.NCode = HM.BankNCode) ');
		SQL.Add('AND   (Bi.RDelKbn = 0) ');             // <039> ADD
        //FX0047 Add

        SQL.Add('LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add('ON (Fi.MasterKbn=HM.MasterKbn AND Fi.NCode=HM.NCode) ');
		SQL.Add('WHERE ');
        SQL.Add(' HT.MasterKbn=:nMasterKbn AND');
		SQL.Add(' HT.MasterKbn=HM.MasterKbn AND');
        SQL.Add(' HM.RDelKbn=0 AND HT.BasedNCode=HM.NCode AND');
        SQL.Add(' HT.SumNCode=Isnull((SELECT hm2.NCode FROM HojyoMA AS hm2');
        SQL.Add('   WHERE hm2.GCode=:sGCode AND hm2.RDelKbn=0  ');

        //FX0047 Add(ｻﾌﾞｸｴﾘは複数行を返せないｴﾗｰ発生)
        SQL.Add('And hm2.MasterKbn = :nMasterKbn ),0) ');

		SQL.Add('ORDER BY HT.EntNo');

        ParamByName ('nMasterKbn').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('sGCode'    ).AsString    := m_strExCodeCurrent;

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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnRebuildTreeViewItems ()                                              */
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ再作成処理                                                        */
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnRebuildTreeViewItems ();
var
    stWorkRec  : ^TreeViewRec;
    cNode      : TTreeNode;
    nCount     : Integer;
    strItemName: String;

begin
	m_fUnderConstruction	:= TRUE;

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

        Dispose (stWorkRec);
    end;

    for nCount := 1 to 8 do
    begin
        if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
        begin
            strItemName := m_stSelectItem [nCount].strItemCaption + '体系';
            break;
        end;
    end;

	if	(CmnTreeView.Items.Count > 0) then
		CmnTreeView.Items [0].Delete ();

    New (stWorkRec);

    stWorkRec^.nDivision    := 9;
    stWorkRec^.strExCode    := '          ';
    stWorkRec^.strName      := strItemName;
    stWorkRec^.cNCode       := 0;
    cNode   := CmnTreeView.Items.AddChildObject (nil, strItemName, stWorkRec);

    cNode.ImageIndex    := 0;
	cNode.SelectedIndex := 2;

	CmnTreeView.Items.BeginUpdate;

    fnCreateTreeViewItems(cNode, 0);

	CmnTreeView.Items.EndUpdate;

	fnDeleteCheck();    //HIS0023

	if (m_nSaveTreeRecCount > 0) then
		fnDeleteTreeViewUselessItems ();

	fnAddTreeViewUnconnectedItems ();

	Prog1.Position	:= 50;			//HIS0034

	m_fUnderConstruction	:= FALSE;
    m_strExCodeCurrent      := stWorkRec^.strExCode;
    m_cExCodeCurrent        := stWorkRec^.cNCode;
    cNode.Selected  	    := TRUE;

    CmnTreeView.FullExpand ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCreatTreeViewItems (TTreeNode)                                       */
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理                                                     */
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: cSrcNode  = ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)                                                          */
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnCreateTreeViewItems(cSrcNode: TTreeNode; iKbn: Integer);
var
	dqMasterData: TMQuery;
    stWorkRec   : ^TreeViewRec;

	iCount		: Integer;
	iCount2		: Integer;
begin
    stWorkRec		:= cSrcNode.Data;
    dqMasterData	:= TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	iCount	:= 0;
	iCount2	:= 0;

    with (dqMasterData) do
    begin
//------------------------------------------------------------------------------2002/12/11
		if iKbn = 0 then
		begin
			Close();
			SQL.Clear();
			SQL.Add('SELECT Count(ht.BasedNCode) as Count ');
            SQL.Add('FROM HojyoTree ht, HojyoMA hm ');
			SQL.Add('WHERE ht.MasterKbn=:nMasterKbn AND');
			SQL.Add('hm.Masterkbn=ht.MasterKbn AND hm.RDelKbn=0 AND');
            SQL.Add('hm.NCode=ht.BasedNCode AND ');
            SQL.Add('ht.SumNCode=:cNCode');

	        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
//    	    ParamByName ('sGCode'    ).AsString     := stWorkRec^.strExCode;
    	    ParamByName ('cNCode'    ).AsCurrency   := stWorkRec^.cNCode;

			Open ();

			if not Eof then
				iCount	:= GetFld('Count').AsInteger
			else
				iCount 	:= 0;
		end;
//------------------------------------------------------------------------------2002/12/11


		Close ();

		SQL.Clear ();
		SQL.Add('SELECT ht.SumNCode, ht.BasedNCode, ');
		SQL.Add('hm.GCode, hm.SumKbn, hm.SimpleName, hm.NCode,hm.SyokuchiKbn ');
        SQL.Add('FROM HojyoTree ht, HojyoMA hm ');
		SQL.Add('WHERE ht.MasterKbn=:nMasterKbn AND');
		SQL.Add('hm.Masterkbn=ht.MasterKbn AND');
		SQL.Add('hm.RDelKbn=0 AND hm.NCode=ht.BasedNCode AND');
        SQL.Add('ht.SumNCode=:cNCode ');
//      SQL.Add('(SELECT hm2.NCode FROM HojyoMA AS hm2');
//      SQL.Add(' WHERE hm2.GCode=:sGCode)');
		SQL.Add('ORDER BY EntNo DESC');

        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
//      ParamByName ('sGCode'    ).AsString     := stWorkRec^.strExCode;
   	    ParamByName ('cNCode'    ).AsCurrency   := stWorkRec^.cNCode;

		Open ();

		if iKbn = 0 then
			iCount2	:= 1;

		while (not EOF) do
		begin
            fnCreateTreeViewItem (dqMasterData, cSrcNode);

			if iKbn = 0 then
			begin
				if iCount <> 0 then
				begin
					Prog1.Position	:= iCount2 * 40 div iCount;

					inc(iCount2);
				end;
			end;

			NEXT;
		end;

		Close ();
    end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCreatTreeViewItem (TMQuery; TTreeNode)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData  = 補助加算体系ﾏｽﾀ用ｸｴﾘｰ															*/
//*			  cSrcNode      = ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)																*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP008001f.fnCreateTreeViewItem (dqMasterData: TMQuery; cNodeSrc: TTreeNode);
var
	cNode     : TTreeNode;
	cNodeCheck:	TTreeNode;
	stChildRec: ^TreeViewRec;
	stRecCheck: ^TreeViewRec;
	stRecCheck2:^TreeViewRec;
	nCount	  : Integer;
	fCheckNG  : Boolean;
	strExCode : String;
    cNCode    : Currency;

    sCode     : String;
begin
	New (stChildRec);

    with (dqMasterData) do
    begin
		strExCode	:= FieldByName ('GCode').AsString;
        cNCode      := FieldByName('NCode').AsCurrency;

		if  (m_nCurrentCodeAttr <= 1) then
			strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

		stChildRec^.strExCode	:= strExCode;
		stChildRec^.nDivision	:= FieldByName ('SumKbn'    ).AsInteger;
		stChildRec^.strName		:= FieldByName ('SimpleName').AsString;
		stChildRec^.cNCode		:= FieldByName ('NCode'     ).AsCurrency;

		if	(FieldByName ('SyokuchiKbn').AsInteger = 1) then
			stChildRec^.nDivision	:= DIVISION_GENERAL;

		fCheckNG	:= FALSE;																			// ☆

		if ((stChildRec^.nDivision <> 0) and
            (stChildRec^.nDivision <> DIVISION_GENERAL)) then	                                		// ☆
		begin																							// ☆
			cNodeCheck	:= cNodeSrc;
			stRecCheck2	:= cNodeCheck.Data;																// ☆

			while (TRUE) do																				// ☆
			begin																						// ☆
				stRecCheck	:= cNodeCheck.Data;															// ☆

				if	(CompareStr (strExCode, stRecCheck^.strExCode) = 0) then							// ☆
				begin																					// ☆
//------------------------------------------------------------------------------HIS0022Start
					if fnHojyoTreeDelete(cNCode, stRecCheck2^.cNCode) = 0 then
						m_DeleteCheck	:= False;
//------------------------------------------------------------------------------HIS0022End

					fCheckNG	:= TRUE;																// ☆
					Break;																				// ☆
				end;																					// ☆

				cNodeCheck	:= cNodeCheck.Parent;														// ☆

				if	(cNodeCheck = nil) then																// ☆
					Break;																				// ☆
			end;																						// ☆
		end;																							// ☆

		if	(fCheckNG) then																				// ☆
		begin																							// ☆
			if	(m_nSaveTreeRecCount >= m_nSaveTreeRecMax) then											// ☆
			begin																						// ☆
				SetLength (m_stSaveTreeRec, m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS);					// ☆

				for	nCount := m_nSaveTreeRecMax to m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS - 1 do		// ☆
				begin																					// ☆
					m_stSaveTreeRec [nCount].strSumCode		:= '';										// ☆
					m_stSaveTreeRec [nCount].strBasedCode	:= '';										// ☆
				end;																					// ☆

				m_nSaveTreeRecMax	:= m_nSaveTreeRecMax + UNIT_ALLOC_RECORDS;							// ☆
			end;																						// ☆

//			m_stSaveTreeRec [m_nSaveTreeRecCount].strSumCode	:= FieldByName ('SumNCode'  ).AsString;	// ☆
//			m_stSaveTreeRec [m_nSaveTreeRecCount].strBasedCode	:= FieldByName ('BasedNCode').AsString;	// ☆

			m_stSaveTreeRec [m_nSaveTreeRecCount].eSumNCode	    := FieldByName ('SumNCode'  ).AsFloat;	// ☆
			m_stSaveTreeRec [m_nSaveTreeRecCount].eBasedNCode	:= FieldByName ('BasedNCode').AsFloat;	// ☆

			m_nSaveTreeRecCount	:= m_nSaveTreeRecCount + 1;												// ☆

			Exit;																						// ☆
		end;																							// ☆


//------------------------------------------------------------------------------HIS0039Start

//		cNode	:= CmnTreeView.Items.AddChildObjectFirst (cNodeSrc, stChildRec^.strName, stChildRec);

        if m_nCurrentCodeAttr = 0 then
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 0)
        else if m_nCurrentCodeAttr = 1 then
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 1)
        else
            sCode   := m_cComArea.SetDspCodeAttr(stChildRec^.strExCode, m_nCurrentCodeDigit, 2);

        cNode	:= CmnTreeView.Items.AddChildObjectFirst (cNodeSrc, MakeDspString(sCode, stChildRec^.strName), stChildRec);

//------------------------------------------------------------------------------HIS0039End


        if  ((stChildRec^.nDivision = 0) or (stChildRec^.nDivision = DIVISION_GENERAL)) then
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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateTreeViewItems (Integer; String; String; Integer)                  */
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理                                                     */
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision     = 実在/合計区分 (0:実在, 1:合計)                                        */
//*			  strExCode     = 補助外部ｺｰﾄﾞ                                                          */
//*           strNameSimple = 補助簡略名称                                                          */
//*           nAccessMethod = ｱｸｾｽ方法      (ACCESS_TREE_ADD:追加, ACCESS_TREE_UPDATE:変更...)      */
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnUpdateTreeViewItems (nDivision: Integer; strExCode: String;
    strNameSimple: String; cNCode: Currency; nAccessMethod: Integer);
var
    cNode       : TTreeNode;
    stWorkRec   : ^TreeViewRec;
    stWorkRecAdd: ^TreeViewRec;
    nCount      : Integer;
    strExCodeCmp: String;

    sCode       : String;
begin
    case (nAccessMethod) of
        ACCESS_TREE_ADD   : strExCodeCmp    := m_strExCodeCurrent;
        ACCESS_TREE_INSERT: strExCodeCmp    := m_strExCodeCurrent;
        ACCESS_TREE_UPDATE: strExCodeCmp    := strExCode;
        ACCESS_TREE_DELETE: strExCodeCmp    := strExCode;
    end;


//------------------------------------------------------------------------------HIS0024Start
	nCount	:= 0;

//    for nCount := 1 to CmnTreeView.Items.Count do
	while (True) do
    begin
		inc(nCount);

    	if CmnTreeView.Items.Count < nCount then
			break;
//------------------------------------------------------------------------------HIS0024End

        stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

		if  (CompareStr (stWorkRec^.strExCode, strExCodeCmp) = 0) then
        begin
            cNode   := CmnTreeView.Items [nCount - 1];

            if  (nAccessMethod = ACCESS_TREE_ADD) then                          // ｱｲﾃﾑ追加
            begin
                New (stWorkRecAdd);

				if  (m_nCurrentCodeAttr <= 1) then
					strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

				stWorkRecAdd^.nDivision := nDivision;
				stWorkRecAdd^.strExCode := strExCode;
				stWorkRecAdd^.strName   := strNameSimple;
				stWorkRecAdd^.cNCode    := cNCode;

//------------------------------------------------------------------------------HIS0039Start
//				cNode	:= CmnTreeView.Items.AddChildObject (cNode, strNameSimple, stWorkRecAdd);

                if m_nCurrentCodeAttr = 0 then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 0)
                else if m_nCurrentCodeAttr = 1 then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 1)
                else
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRecAdd^.strExCode, m_nCurrentCodeDigit, 2);

                cNode	:= CmnTreeView.Items.AddChildObject (cNode, MakeDspString(sCode, strNameSimple), stWorkRecAdd);
//------------------------------------------------------------------------------HIS0039End


                if  ((nDivision = 0) or (nDivision = DIVISION_GENERAL)) then
                begin
                    cNode.ImageIndex	:= 1;
                    cNode.SelectedIndex	:= 3;
                end
                else
                begin
                    cNode.ImageIndex	:= 0;
                    cNode.SelectedIndex	:= 2;
                end;

				CmnTreeView.Items [nCount - 1].Expanded := True;				//HIS0020
            end;

            if  (nAccessMethod = ACCESS_TREE_UPDATE) then                       // ｱｲﾃﾑ変更
			begin
				stWorkRec	:= cNode.Data;

				stWorkRec^.strName	:= strNameSimple;

//------------------------------------------------------------------------------HIS0039Start
//				cNode     .Text		:= strNameSimple;

                if m_nCurrentCodeAttr = 0 then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 0)
                else if m_nCurrentCodeAttr = 1 then
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 1)
                else
                    sCode   := m_cComArea.SetDspCodeAttr(stWorkRec^.strExCode, m_nCurrentCodeDigit, 2);

                cNode.Text  := MakeDspString(sCode, strNameSimple);
//------------------------------------------------------------------------------HIS0039End

				fnUpdateParentItemsInfoCaption (stWorkRec^.strExCode, strNameSimple);
			end;

            if  (nAccessMethod = ACCESS_TREE_DELETE) then                       // ｱｲﾃﾑ削除
                cNode.Delete;
        end;
    end;

//    CmnTreeView.FullExpand ();		//HIS0015
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnUpdateTreeViewItemsEx (TTreeNode; TTreeNode; TTreeNode; TTreeNode)				*/
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
procedure   TJNTCRP008001f.fnUpdateTreeViewItemsEx (cNodeSrc, cNodeSrcParent, cNodeDst, cNodeDstParent: TTreeNode);
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

	if ((stRecDst^.nDivision = 0) or
        (stRecDst^.nDivision = DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
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

			if ((stRecDst^.nDivision <> 0) and
                (stRecDst^.nDivision <> DIVISION_GENERAL)) then		// 挿入先ﾉｰﾄﾞが親ﾉｰﾄﾞ(合計)
				cNodeDstOther	:= CmnTreeView.Items [nCount - 1];									// 現在のﾉｰﾄﾞを保存

			cNodeWork       := CmnTreeView.Items [nCount - 1].GetFirstChild ();						// 先頭の子ﾉｰﾄﾞ取得

			while (TRUE) do
			begin
				if  (cNodeWork = nil) then
					Break;

				stRecTreeItem   := cNodeWork.Data;													// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

				if (CompareStr(stRecTreeItem^.strExCode, stRecSrc^.strExCode) = 0) then			// 挿入元ｱｲﾃﾑと外部ｺｰﾄﾞが一致
                    cNodeSrcOther   := cNodeWork;

				if ((stRecDst^.nDivision <> 0) and (stRecDst^.nDivision <> DIVISION_GENERAL) and
                    (cNodeSrcOther <> nil)) then
					Break;

				if ((stRecDst^.nDivision = 0) or
                    (stRecDst^.nDivision = DIVISION_GENERAL)) then	// 挿入先ﾉｰﾄﾞが子ﾉｰﾄﾞ(実在)
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
//*	関数	: TJNTCRP008001f.fnUpdateTreeViewItemsEx2 (TTreeNode; String; Integer)								*/
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
procedure   TJNTCRP008001f.fnUpdateTreeViewItemsEx2 (cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
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
//*	関数	: TJNTCRP008001f.fnDeleteTreeViewItems (String)													*/
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
procedure   TJNTCRP008001f.fnDeleteTreeViewItems(cExCode: Currency);
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

		if (CmnTreeView.Items.Count < nCount) then
			Break;

		stRecTreeItem	:= CmnTreeView.Items [nCount - 1].Data;							// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if (stRecTreeItem^.cNCode = cExCode) then   // 内部ｺｰﾄﾞが一致
		begin
			if ((stRecTreeItem^.nDivision = 1) or
                (stRecTreeItem^.nDivision = DIVISION_GENERAL)) then
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

						if	(CompareStr(stRecTreeBase^.strExCode, stRecTreeItem^.strExCode) = 0) then
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
//*	関数	: TJNTCRP008001f.fnEraseTreeViewItems (TTreeNode)													*/
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
procedure   TJNTCRP008001f.fnEraseTreeViewItems (cNodeTarget: TTreeNode);
var
	strExCodeParent: String;															//
	strExCodeTarget: String;															//
	stRecTreeItem  : ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	cNodeChild	   : TTreeNode;															// 子ﾉｰﾄﾞ
	nCount         : Integer;															// ｶｳﾝﾀｰ
	nDivisionTarget: Integer;
	fCreateNode	   : Boolean;

begin
	nCount	:= 0;

	stRecTreeItem	:= cNodeTarget.Data;
	strExCodeTarget	:= stRecTreeItem^.strExCode;
	nDivisionTarget	:= stRecTreeItem^.nDivision;
	stRecTreeItem	:= cNodeTarget.Parent.Data;
	strExCodeParent	:= stRecTreeItem^.strExCode;

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

	if m_fUpDeleteRecord = False then
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
//*	関数	: TJNTCRP008001f.fnInsertTreeViewItemsEx (TTreeNode; String; Integer)								*/
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
procedure   TJNTCRP008001f.fnInsertTreeViewItemsEx (cNodeTarget: TTreeNode; strExCode: String; nDivision: Integer);
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
		SQL.Add('SELECT SimpleName, NCode FROM HojyoMA ');
		SQL.Add('WHERE  MasterKbn=:nMasterKbn AND RDelKbn=0 AND GCode=:sGCode');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('sGCode'  ).AsString		:= strExCode;

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
        stRecInsert^.strName    := FieldByName('SimpleName').AsString;
        stRecInsert^.cNCode     := FieldByName('NCode').AsCurrency;

//------------------------------------------------------------------------------HIS0039Start
//		if	((stRecTarget^.nDivision = 0) or (stRectarget^.nDivision = DIVISION_GENERAL)) then
//        	cNodeTarget := CmnTreeView.Items.InsertObject   (cNodeTarget, stRecInsert^.strName, stRecInsert)
//		else
//			cNodeTarget	:= CmnTreeView.Items.AddChildObject (cNodeTarget, stRecInsert^.strName, stRecInsert);

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

//------------------------------------------------------------------------------HIS0039End



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
		SQL.Add('SELECT ht.SumNCode, ht.BasedNCode, ');
        SQL.Add('hm.GCode, hm.SumKbn, hm.SimpleName,hm.NCode,hm.SyokuchiKbn ');
		SQL.Add('FROM HojyoTree ht, HojyoMA hm ');
		SQL.Add('WHERE ');
        SQL.Add('ht.MasterKbn=:nMasterKbn AND hm.Masterkbn=ht.Masterkbn AND ');
		SQL.Add('hm.RDelKbn=0 AND hm.NCode=ht.BasedNCode AND ');
        SQL.Add('ht.SumNCode=(SELECT hm2.NCode FROM HojyoMA AS hm2 ');
        SQL.Add(' WHERE hm2.GCode=:sGCode and hm2.MasterKbn = :nMasterKbn and hm2.RDelKbn = 0) ');
		SQL.Add('ORDER BY EntNo DESC');

		ParamByName('nMasterKbn').AsInteger := m_nCurrentMasterDiv;
		ParamByName('sGCode'    ).AsString	:= strExCode;

		Open ();

		while (not EOF) do
		begin
            fnCreateTreeViewItem(dqMasterTree, cNodeTarget);
			NEXT;
		end;

		Close ();
    end;

	dqMasterData.Free ();
	dqMasterTree.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnAddTreeViewUnconnectedItems ()													*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ未接続ｱｲﾃﾑ追加処理														*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnAddTreeViewUnconnectedItems ();
var
	dqMasterData: TMQuery;
	dqMasterTree: TMQuery;
	cNodeTarget	: TTreeNode;
	stRecTarget	: ^TreeViewRec;
	nEntryNo	: Integer;

	iCount		: Integer;
	iCount2		: Integer;

    iTreeCnt    : Integer;
    sCode       : String;
begin
	dqMasterData	:= TMQuery.Create (Self);
	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);						// DBとMQueryの接続


	with (dqMasterData) do
	begin
//------------------------------------------------------------------------------HIS0034Start
		Close();
		SQL.Clear();
		SQL.Add('SELECT Count(GCode) as Count FROM HojyoMA');
		SQL.Add('WHERE MasterKbn=:nMasterKbn AND RDelKbn=0 ');
		ParamByName('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		Open;

		if not Eof then
			iCount	:= GetFld('Count').AsInteger
		else
			iCount	:= 0;
//------------------------------------------------------------------------------HIS0034End


{		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT hm.SumKbn, hm.GCode, hm.SimpleName, ht.MasterKbn ');
		SQL.Add   ('FROM   HojyoMA hm LEFT OUTER JOIN HojyoTree ht ');
		SQL.Add   ('ON     hm.MasterKbn = ht.MasterKbn AND hm.GCode = ht.BasedCode ');
		SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision AND RecordKbn = 0 AND ht.MasterKbn is Null ');
		SQL.Add   ('ORDER  BY hm.sumKbn,hm.GCode ');
//		SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision AND RecordKbn = 0 ORDER BY hm.SumKbn, hm.GCode');//
}

        //HIS0038   HojyoTreeにレコードが存在するか確認
        Close;
        SQL.Clear;
        SQL.Add('select Count(BasedNCode) as Count from HojyoTree ');
        SQL.Add('where MasterKbn=:nMasterKbn ');
        ParamByName('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
        Open;

        if not Eof then
            iTreeCnt    := GetFld('Count').AsInteger
        else
            iTreeCnt    := 0;


        //HIS0038   HojyoTreeにレコードが1件もなかったときは未接続アイテムすべてを呼び出す
        if iTreeCnt = 0 then
        begin
            Close;
            SQL.Clear;
            SQL.Add('select NCode, GCode, SumKbn, SimpleName from HojyoMA ');
            SQL.Add('where  MasterKbn=:nMasterKbn ');
            SQL.Add('and    RDelKbn=0 ');
        end
        //HojyoTreeに1件でもレコードがあるときはどのコードが未接続が検索
        else
        begin
    		//2002/12/09
	    	Close;
            SQL.Clear;
    		SQL.Add('SELECT DISTINCT hm.NCode, hm.GCode, hm.SumKbn, hm.SimpleName ');
            SQL.Add('FROM HojyoMA hm ');
	    	SQL.Add('INNER JOIN HojyoTree ON NOT EXISTS ');
		    SQL.Add('(SELECT ht.SumNCode FROM HojyoTree ht ');
    		SQL.Add('WHERE hm.MasterKbn=Ht.MasterKbn AND hm.NCode = ht.BasedNCode ');
	    	SQL.Add('AND hm.NCode = ht.BasedNCode) ');
		    SQL.Add('WHERE hm.MasterKbn=:nMasterKbn AND Hm.RDelKbn=0 ');
    		SQL.Add('ORDER BY hm.SumKbn, hm.GCode');
        end;

	    ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;

		Open ();

		iCount2	:= 1;	//HIS0034

		while (not EOF) do
		begin
//			if	(GetFld ('MasterKbn').IsNull) then									// 未接続ｱｲﾃﾑ
//			begin

			nEntryNo	:= fnGetMasterTreeEntryNoFinal(0);

			with (dqMasterTree) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add('INSERT INTO HojyoTree');
                SQL.Add('(MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode, ');
                SQL.Add('UpdTantoNCode) '); // <034>
				SQL.Add('VALUES ');
                SQL.Add('(:nMasterKbn, 0, :cSumNCode, :nEntryNo, :cBasedNCode, ');
                SQL.Add(':cUpdTantoNCode) '); // <034>

				ParamByName('nMasterKbn'     ).AsInteger	:= m_nCurrentMasterDiv;
				ParamByName('cSumNCode'      ).AsCurrency	:= 0;
				ParamByName('nEntryNo'       ).AsInteger	:= nEntryNo;
				ParamByName('cBasedNCode'     ).AsCurrency	:= dqMasterData.FieldByName ('NCode').AsCurrency;
                ParamByName('cUpdTantoNCode').AsCurrency    := m_TantoNCode; // <034>

				ExecSQL ();

				if	(Status <> 0) then											// ｴﾗｰ
					Break;

				m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
			end;

			New(stRecTarget);

			stRecTarget^.nDivision	:= FieldByName ('SumKbn'    ).AsInteger;
			stRecTarget^.strExCode	:= FieldByName ('GCode'     ).AsString;
			stRecTarget^.strName	:= FieldByName ('SimpleName').AsString;
			stRecTarget^.cNCode 	:= FieldByName ('NCode'     ).AsCurrency;

			cNodeTarget	:= CmnTreeView.Items [0];


//------------------------------------------------------------------------------HIS0039Start
//			cNodeTarget	:= CmnTreeView.Items.AddChildObject (cNodeTarget, stRecTarget^.strName, stRecTarget);

            if m_nCurrentCodeAttr = 0 then
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 0)
            else if m_nCurrentCodeAttr = 1 then
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 1)
            else
                sCode   := m_cComArea.SetDspCodeAttr(stRecTarget^.strExCode, m_nCurrentCodeDigit, 2);

            cNodeTarget	:= CmnTreeView.Items.AddChildObject (cNodeTarget, MakeDspString(sCode, stRecTarget^.strName), stRecTarget);
//------------------------------------------------------------------------------HIS0039End

			if	(stRecTarget^.nDivision = 0) then								// 実在
			begin
				cNodeTarget.ImageIndex		:= 1;
				cNodeTarget.SelectedIndex	:= 3;
			end
			else																// 合計
			begin
				cNodeTarget.ImageIndex		:= 0;
				cNodeTarget.SelectedIndex	:= 2;
			end;

			if	(stRecTarget^.nDivision = 1) then
				fnCreateTreeViewItems (cNodeTarget, 1);

			//HIS0034
			if iCount <> 0 then
			begin
				Prog1.Position	:= (iCount2 * 10 div iCount) + 40;
				inc(iCount2);
			end;
//			end;

			NEXT;
		end;
	end;

	dqMasterData.Free ();
	dqMasterTree.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnInsertMasterTreeRecord (String; String; String;                         */
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
procedure TJNTCRP008001f.fnInsertMasterTreeRecord(cExCodeSrc, cExCodeSrcParent,
    cExCodeDst, cExCodeDstParent: Currency; strExCodeDstParent: String;
    nDivisionDst, nAccessMethod: Integer);
var
	dqMasterTree:   TMQuery;
	nEntryNo:       Integer;
	nChangeOrder:   Integer;
	cExCodeWork:    Currency;

begin
	dqMasterTree	:= TMQuery.Create (Self);							// MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);					// DBとMQueryの接続

	if  ((nDivisionDst = 0) or (nDivisionDst = DIVISION_GENERAL)) then			// 挿入先が実在
	begin
        nChangeOrder    := fnGetMasterTreeEntryNo(dqMasterTree,
                                                    cExCodeDst,
                                                    cExCodeDstParent);

        if  (nChangeOrder = -1) then
            nChangeOrder    := fnGetMasterTreeEntryNo(dqMasterTree,
                                                        cExCodeDst,
                                                        cExCodeDstParent);
    end
    else                                                                        // 挿入先が合計
        nChangeOrder    := 0;

    m_cDataModule.BeginTran (m_cDBSelect);                                      // ﾄﾗﾝｻﾞｸｼｮﾝの開始

    if  (nAccessMethod = ACCESS_CUTANDPASTE) then
    begin
        with (dqMasterTree) do
        begin
		    Close ();

			SQL.Clear ();
			SQL.Add('DELETE FROM HojyoTree ');
			SQL.Add('WHERE MasterKbn=:nMasterKbn AND SumNCode=:cDstCode AND');
            SQL.Add('BasedNCode=:cSrcCode');

			ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('cDstCode'  ).AsCurrency   := cExCodeSrcParent;
			ParamByName ('cSrcCode'  ).AsCurrency	:= cExCodeSrc;

			ExecSQL ();

            if  (Status <> 0) then                      // ｴﾗｰ
            begin
                m_cDataModule.Rollback(m_cDBSelect);    // ﾛｰﾙﾊﾞｯｸ(破棄)
				dqMasterTree .Free();
                Exit;
            end;
			m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
			m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
        end;
    end;

    if  (nChangeOrder = 0) then
    begin
        nEntryNo    := fnGetMasterTreeEntryNoFinal(cExCodeDst);
        cExCodeWork := cExCodeDst;
    end
    else
    begin
        nEntryNo    := nChangeOrder;
        cExCodeWork := cExCodeDstParent;
    end;

    with (dqMasterTree) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add('INSERT INTO HojyoTree ');
        SQL.Add('(MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode,');
        SQL.Add('UpdTantoNCode) '); // <034>
		SQL.Add('VALUES (:nMasterKbn, 0, :cSumNCode, :nEntryNo, :cBasedNCode,');
        SQL.Add(':cUpdTantoNCode) '); // <034>

		ParamByName ('nMasterKbn' ).AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('cSumNCode'  ).AsCurrency  := cExCodeWork;
		ParamByName ('nEntryNo'   ).AsInteger   := nEntryNo;
		ParamByName ('cBasedNCode').AsCurrency  := cExCodeSrc;
        ParamByName ('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

		ExecSQL;

        if  (Status <> 0) then                                                  // ｴﾗｰ
        begin
            m_cDataModule.Rollback (m_cDBSelect);                               // ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree .Free	   ();
            Exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
    end;

    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)
	dqMasterTree .Free();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnRewriteMasterTreeRecords (String)									*/
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
procedure   TJNTCRP008001f.fnRewriteMasterTreeRecords(cExCodeParent: Currency);
var
    dqMasterTreeSelect: TMQuery;
    dqMasterTreeUpdate: TMQuery;
    nCount            : Integer;

begin
    m_cDataModule.BeginTran (m_cDBSelect);                                      // tﾗﾝｻﾞｸｼｮﾝの開始

    nCount  := 1;

    dqMasterTreeSelect  := TMQuery.Create (Self);                        // MQueryの構築
    dqMasterTreeUpdate  := TMQuery.Create (Self);                        // MQueryの構築

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeSelect);           // DBとMQueryの接続	                                    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeUpdate);           // DBとMQueryの接続	                                    // DBとMQueryの接続

    with (dqMasterTreeSelect) do
    begin
        Close ();

        SQL.Clear ();
        SQL.Add   ('SELECT MasterKbn, SumNCode, BasedNCode FROM HojyoTree ');
        SQL.Add   ('WHERE  MasterKbn=:nMasterKbn AND SumNCode=:cDstCode ');
        SQL.Add   ('ORDER BY EntNo');

        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
        ParamByName ('cDstCode'  ).AsCurrency   := cExCodeParent;

        Open ();

		while (not EOF) do
		begin
            with (dqMasterTreeUpdate) do
            begin
                Close ();

	    	    SQL.Clear ();
        	    SQL.Add   ('UPDATE HojyoTree SET EntNo=:nEntryNo ');
        	    SQL.Add   (', UpdTantoNCode = :cUpdTantoNCode '); // <034>
                SQL.Add   ('WHERE  MasterKbn=:nMasterKbn AND ');
				SQL.Add   ('       SumNCode=:cDstExCode AND BasedNCode = :cSrcExCode');

// <013>      	        ParamByName ('nMasterDivision').AsInteger   := dqMasterTreeSelect.FieldByName('MasterKbn').AsInteger;
       	        ParamByName ('nMasterKbn').AsInteger        := dqMasterTreeSelect.FieldByName('MasterKbn').AsInteger;
       	        ParamByName ('cDstExCode'   ).AsCurrency    := dqMasterTreeSelect.FieldByName('SumNCode'  ).AsCurrency;
      	        ParamByName ('cSrcExCode'   ).AsCurrency    := dqMasterTreeSelect.FieldByName('BasedNCode').AsCurrency;

                ParamByName ('nEntryNo').AsInteger  := nCount * -100;
                ParamByName ('cUpdTantoNCode').AsCurrency   := m_TantoNCode; // <034>

        	    ExecSQL ();

                if  (Status <> 0) then                                          // ｴﾗｰ
                begin
                    m_cDataModule     .Rollback (m_cDBSelect);                  // ﾛｰﾙﾊﾞｯｸ(破棄)
				    dqMasterTreeSelect.Free		();
				    dqMasterTreeUpdate.Free		();
                    Exit;
                end;

				m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
            end;

            nCount  := nCount + 1;

            NEXT;
        end;

		Close ();
    end;

    with (dqMasterTreeUpdate) do
    begin
        Close ();

        SQL.Clear ();
        SQL.Add('UPDATE HojyoTree SET EntNo=EntNo*-1, ');
        SQL.Add('UpdTantoNCode = :cUpdTantoNCode '); // <034>
        SQL.Add('WHERE  MasterKbn=:nMasterKbn AND SumNCode = :cDstExCode ');
		SQL.Add('AND    EntNo < 0 ');

        ParamByName('nMasterKbn').AsInteger     := m_nCurrentMasterDiv;
        ParamByName('cDstExCode').AsCurrency    := cExCodeParent;
        ParamByName('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

        ExecSQL ();

        if  (Status <> 0) then                                                  // ｴﾗｰ
        begin
            m_cDataModule     .Rollback (m_cDBSelect);                          // ﾛｰﾙﾊﾞｯｸ(破棄)
		    dqMasterTreeSelect.Free		();
		    dqMasterTreeUpdate.Free		();
            Exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
    end;

    m_cDataModule     .Commit (m_cDBSelect);									// ｺﾐｯﾄ(反映)
    dqMasterTreeSelect.Free	  ();
    dqMasterTreeUpdate.Free	  ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDeleteTreeViewUselessItems ()													*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ不要ｱｲﾃﾑ 削除処理															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDeleteTreeViewUselessItems ();
var
	dqMasterTree: TMQuery;
	nCount		: Integer;

begin
	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		for	nCount := 0 to m_nSaveTreeRecCount - 1 do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT MasterKbn FROM HojyoTree ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
			SQL.Add   ('       SumNCode = :strSumCode AND BasedNCode = :strBasedCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//			ParamByName ('strSumCode'     ).AsString	:= m_stSaveTreeRec [nCount].strSumCode;
//			ParamByName ('strBasedCode'   ).AsString	:= m_stSaveTreeRec [nCount].strBasedCode;
			ParamByName ('strSumCode'     ).AsFloat	:= m_stSaveTreeRec [nCount].eSumNCode;
			ParamByName ('strBasedCode'   ).AsFloat	:= m_stSaveTreeRec [nCount].eBasedNCode;


			Open ();

            if	(EOF) then
				Continue;

			Close ();

			SQL.Clear ();
			SQL.Add   ('DELETE FROM HojyoTree ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
			SQL.Add   ('       SumNCode = :strSumCode AND BasedNCode = :strBasedCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//			ParamByName ('strSumCode'     ).AsString	:= m_stSaveTreeRec [nCount].strSumCode;
//			ParamByName ('strBasedCode'   ).AsString	:= m_stSaveTreeRec [nCount].strBasedCode;
			ParamByName ('strSumCode'     ).AsFloat	:= m_stSaveTreeRec [nCount].eSumNCode;
			ParamByName ('strBasedCode'   ).AsFloat	:= m_stSaveTreeRec [nCount].eBasedNCode;


			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

				fnOutputDBErrorMessage ();

				dqMasterTree.Close ();
				dqMasterTree.Free  ();

				Exit;
			end;

			m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
		end;
    end;

	dqMasterTree.Close ();
	dqMasterTree.Free  ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetMasterTreeEntryNo (TMQuery; String; String)							*/
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 登録№取得												*/
//*																									*/
//*	戻り値	: Integer, (最終登録№)										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterTree		= 補助加算体系ﾏｽﾀ用ｸｴﾘｰ												*/
//*			  cExCode			= 挿入(加算)先補助内部ｺｰﾄﾞ							                */
//*			  cExCodeParent	    = 挿入(加算)先補助内部ｺｰﾄﾞ(親)						                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnGetMasterTreeEntryNo(dqMasterTree: TMQuery; cExCode, cExCodeParent: Currency): Integer;
var
    nEntryNo   : Integer;
    nEntryNoCur: Integer;
    nEntryNoPre: Integer;
begin
    with (dqMasterTree) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT EntNo FROM HojyoTree ');
		SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
        SQL.Add('SumNCode=:cDstCode AND BasedNCode = :cSrcCode');

        ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
        ParamByName ('cDstCode'  ).AsCurrency   := cExCodeParent;
        ParamByName ('cSrcCode'  ).AsCurrency   := cExCode;

		Open ();

        nEntryNoCur := dqMasterTree.FieldByName ('EntNo').AsInteger;

		Close ();

		SQL.Clear ();
		SQL.Add('SELECT EntNo FROM HojyoTree ');
		SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
        SQL.Add('SumNCode=:cDstCode AND EntNo<:nEntryNo');
		SQL.Add   ('AND EntNo < :nEntryNo ');
		SQL.Add   ('ORDER BY EntNo DESC');

		ParamByName ('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
		ParamByName ('cDstCode'  ).AsCurrency   := cExCodeParent;
		ParamByName ('nEntryNo'  ).AsInteger    := nEntryNoCur;

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
        fnRewriteMasterTreeRecords(cExCodeParent);

        nEntryNo    := -1;
    end;

	Result	:= nEntryNo;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetMasterTreeEntryNoFinal (TMQuery; String)							*/
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 最終登録№取得                                  		    */
//*																									*/
//*	戻り値	: Integer, (最終登録№)										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	:   strExCodeDst  = 挿入(加算)先補助外部ｺｰﾄﾞ								            */
//*                                                                                                 */
//***************************************************************************************************/
function TJNTCRP008001f.fnGetMasterTreeEntryNoFinal(cDstExCode: Currency): Integer;
var
    nWorkEntryNo : Integer;
begin

    with ( MQTreeEntNo ) do
    begin
        Close();
        ParamByName('nMasterKbn').AsInteger  := m_nCurrentMasterDiv;    // ﾏｽﾀ区分
        ParamByName('cDstExCode').AsCurrency := cDstExCode;             // 加算先内部ｺｰﾄﾞ
        Open();

		if ( not EOF ) then
                nWorkEntryNo := GetFld('EntNo').AsInteger
        else    nWorkEntryNo := 0;

		Close();
    end;

	Result := (nWorkEntryNo + 100) div 100 * 100;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetTagColorBitmap (Integer)									            */
//*																									*/
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報取得                		                                */
//*																									*/
//*	戻り値	: TBitmap,													                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP008001f.fnGetTagColorBitmap (nTagColor: Integer): TBitmap;
var
	bmpTagColor : TBitmap;

begin
	bmpTagColor := nil;

	case (nTagColor) of
		1:	bmpTagColor	:= CmnTreeViewPopupMenuTag01.Bitmap;
		2:	bmpTagColor	:= CmnTreeViewPopupMenuTag03.Bitmap;
        3:	bmpTagColor	:= CmnTreeViewPopupMenuTag02.Bitmap;
		4:	bmpTagColor	:= CmnTreeViewPopupMenuTag04.Bitmap;
	end;

	Result	:= bmpTagColor;
end;
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetTagColorBitmap_Grid (Integer) 						            */
//*																									*/
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報取得                		                                */
//*																									*/
//*	戻り値	: TBitmap,													                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP008001f.fnGetTagColorBitmap_Grid (nTagColor: Integer): TBitmap;
var
	bmpTagColor : TBitmap;

begin
	bmpTagColor := nil;

	case (nTagColor) of
		1:	bmpTagColor	:= BmpGrid01.Bitmap;
		2:	bmpTagColor	:= BmpGrid03.Bitmap;
        3:	bmpTagColor	:= BmpGrid02.Bitmap;
		4:	bmpTagColor	:= BmpGrid04.Bitmap;
	end;

	Result	:= bmpTagColor;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCheckMasterDataRecordValid (String)										*/
//*																									*/
//*	目的	: 補助登録処理 補助基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
    dqMasterData: TMQuery;

begin
	if	(Trim (strExCode) = '') then
	begin
		Result	:= FALSE;
		Exit;
	end;

    if  (m_nCurrentCodeAttr <= 1) then
        strExCode   := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

    dqMasterData    := TMQuery.Create (Self);

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM HojyoMA ');
        SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		if  (not EOF) then
			Result	:= FALSE
        else
			Result	:= TRUE;

		Close ();
    end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCheckMasterTreePasteValid (String; TTreeNode)							*/
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 張付ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	= 張付(加算)元補助外部ｺｰﾄﾞ                                  		    */
//*			  cNodeDst		= 張付(加算)先ﾉｰﾄﾞ														*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnCheckMasterTreePasteValid (strExCodeSrc: String; cNodeDst: TTreeNode): Boolean;
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
		SQL.Add   ('SELECT BasedNCode FROM HojyoTree ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumNCode = :strExCodeDst');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
// <010>↓
//        ParamByName ('strExCodeDst'   ).AsString    := stRecDst^.strExCode;
        ParamByName ('strExCodeDst'   ).AsString    := CurrToStr(stRecDst^.cNCode);
// <010>↑

        Open ();

		while (not EOF) do
		begin
			if	(CompareStr (strExCodeSrc, FieldByName ('BasedNCode').AsString) = 0) then
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
//*	関数	: TJNTCRP008001f.fnCheckMasterTreeInsertValid (String; String)	                            */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ 挿入ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCodeSrc	= 挿入(加算)元補助外部ｺｰﾄﾞ                                  		    */
//*			  strExCodeDst  = 挿入(加算)先補助外部ｺｰﾄﾞ								                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnCheckMasterTreeInsertValid (strExCodeSrc, strExCodeDst: String): Boolean;
var
//	dqMasterTree: TMQuery;

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


(*
	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);						// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();
		SQL.Clear ();

{FX0047
		SQL.Add   ('SELECT ht.SumNCode, ht.BasedNCode, hm.SumKbn FROM HojyoTree ht ');
		SQL.Add   ('LEFT OUTER JOIN HojyoMA hm ');
		SQL.Add   ('ON     ht.MasterKbn = hm.MasterKbn AND ht.BasedNCode = hm.NCode AND hm.RDelKbn = 0 ');
		SQL.Add   ('WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumNCode = :strSumCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsString	:= strExCodeSrc;
}

		SQL.Clear ();
		SQL.Add   ('SELECT HT.SumNCode, HT.BasedNCode, HM.SumKbn ,');
        SQL.Add   ('HM.GCode As BasedGCode,HM2.GCode As SumGCode FROM HojyoTree HT ');

		SQL.Add   ('LEFT OUTER JOIN HojyoMA HM ');
		SQL.Add   ('ON     HT.MasterKbn = HM.MasterKbn AND HT.BasedNCode = hm.NCode AND hm.RDelKbn = 0 ');

		SQL.Add   ('LEFT OUTER JOIN HojyoMA HM2 ');
		SQL.Add   ('ON     HT.MasterKbn = HM2.MasterKbn AND HT.SumNCode = HM2.NCode AND HM2.RDelKbn = 0 ');

		SQL.Add   ('WHERE  HT.MasterKbn = :nMasterDivision AND HM2.GCode = :strSumGCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumGCode'     ).AsString	:= strExCodeSrc;

        Open ();

		while (not EOF) do
		begin
			if	(not fnCheckMasterTreeInsertValidEx (FieldByName ('SumKbn'   ).AsInteger,
													 FieldByName ('BasedGCode').AsString, strExCodeDst)) then
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
*)
end;


//***************************************************************************************************/
//***************************************************************************************************/
function	TJNTCRP008001f.fnCheckMasterTreeInsertValidEx (nDivision: Integer; strExCodeCmp1, strExCodeCmp2: String): Boolean;
begin
	if	(nDivision = 1) then
	begin
		if	(CompareStr (strExCodeCmp1, strExCodeCmp2) = 0) then
		begin
			Result	:= FALSE;
			Exit;
		end;

		if	(not fnCheckMasterTreeInsertValid (strExCodeCmp1, strExCodeCmp2)) then
		begin
			Result	:= FALSE;
			Exit;
		end;
	end;

	Result	:= TRUE;
end;


//***************************************************************************************************/
//***************************************************************************************************/
function	TJNTCRP008001f.fnCheckMasterTreeInsertValid3 (cNodeSrc, cNodeDst: TTreeNode): Boolean;
var
	dqMasterTree: TMQuery;
	strExCode	: String;

begin
	strExCode	:= PTreeViewRec (cNodeDst.Data)^.strExCode;

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
{FX0047
		SQL.Add   ('SELECT BasedNCode FROM HojyoTree ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumNCode = :strSumCode');
}
        SQL.ADD('Select HT.SumNCode,HT.BasedNCode,');
        SQL.ADD('HM1.GCode as BasedGCode,HM2.GCode as SumGCode ');
        SQL.ADD('FROM HojyoTree HT ');
        SQL.ADD('Left outer join HojyoMA HM1 On HM1.NCode = HT.BasedNCode ');
        SQL.ADD('Left outer join HojyoMA HM2 On HM2.NCode = HT.SumNCode ');

		SQL.Add   ('WHERE  HT.MasterKbn = :nMasterDivision AND HM2.GCode = :strSumCode');


		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsString	:= strExCode;

        Open ();

		while (not EOF) do
		begin
			if	(CompareStr (PTreeViewRec (cNodeSrc.Data)^.strExCode,
												FieldByName ('BasedGCode').AsString) = 0) then
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
function TJNTCRP008001f.fnCheckMasterTreeInsertValid2(cNodeSrc, cNodeDst: TTreeNode): Boolean;
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
			Result	:= False;
            Exit;
		end;
	end;


//////////////////////////////////////////////////////////////////////////////////////////////////////

	stWorkDst2	:= cNodeDst.Data;

	while (True) do
	begin
       	if cNodeSrc = nil then
			break;

		stWorkScr2	:= cNodeSrc.Data;

		if (cNodeSrc.Data    <> cNodeDst.Data) and
		   (stWorkScr2^.strExCode = stWorkDst2^.strExCode) then
		begin
			Result	:= False;
            Exit;
		end;

		cNodeSrc	:= cNodeSrc.Parent;
	end;


	Result			:= True;
end;
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateMasterRecord ()						                        */
//*																									*/
//*	目的	: 補助登録処理 補助ﾏｽﾀ更新					                                   		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)												*/
//*																									*/
//***************************************************************************************************/
function TJNTCRP008001f.fnUpdateMasterRecord (): Boolean;
var
    fReturn	    :   Boolean;
    DmqData	    :   TMQuery;
    nWorkNCode  :   Integer;
begin

    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
    m_cDataModule.BeginTran ( m_cDBSelect );

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
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

    // -----------------------------
    //      補助基本ﾏｽﾀ更新
    // -----------------------------
    fReturn := fnUpdateMasterDataRecord ();

    // ｴﾗｰ
    if ( not fReturn ) then
    begin
		Beep();
		fnOutputDBErrorMessage ();
        // ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback (m_cDBSelect);

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <015>
        begin
            // 親会社DBのﾛｰﾙﾊﾞｯｸ
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;

        // 異常終了
		Result := false;
		Exit;
	end;

	if ( m_stMasterData.strExCodeParent = m_stMasterData.strExCode ) then
	begin
        if ( m_stMasterData.cExCode <> 0 ) then
       		fReturn	:= True
        else
            // --------------------------------
            //      補助加算体系ﾏｽﾀ更新
            // --------------------------------
			fReturn	:= fnUpdateMasterTreeRecord ();
	end
	else
    begin
        // --------------------------------
        //      補助加算体系ﾏｽﾀ更新
        // --------------------------------
	    fReturn := fnUpdateMasterTreeRecord ();
    end;

    // ｴﾗｰ
    if  ( not fReturn ) then
    begin
		Beep();
		fnOutputDBErrorMessage ();

        // ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback (m_cDBSelect);

        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <015>
        begin
            // 親会社DBのﾛｰﾙﾊﾞｯｸ
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;

        // 異常終了
		Result := false;
		Exit;
    end;

    // ｺﾐｯﾄ(反映)
    m_cDataModule.Commit ( m_cDBSelect );

    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then   // <015>
    begin
        // 親会社DBのｺﾐｯﾄ
        m_cDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
    end;

    // 正常終了
	Result := true;

end;
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateMasterTreeRecord ()										    */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ更新			                                   		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)												*/
//*																									*/
//***************************************************************************************************/
function TJNTCRP008001f.fnUpdateMasterTreeRecord (): Boolean;
var
	strExCode	 : String;
    fNewRecord   : Boolean;
    nEntryNo     : Integer;
begin

    // 外部ｺｰﾄﾞ
	strExCode := m_stMasterData.strExCode;

    if ( m_nCurrentCodeAttr <= 1 ) then
        strExCode := Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

    // 補助体系の存在ﾁｪｯｸ
    with ( MQTreeSel ) do
    begin
		Close();
        SetFld('nMasterKbn' ).AsInteger  := m_nCurrentMasterDiv;            // ﾏｽﾀ区分
        SetFld('cSumNCode'  ).AsCurrency := m_stMasterData.cExCodeParent;   // 加算先内部ｺｰﾄﾞ
        SetFld('cBasedNCode').AsCurrency := m_stMasterData.cExCode;         // 加算元内部ｺｰﾄﾞ

		if ( not Open () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, MQTreeSel);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (MQTreeSel);
			Close();
			Result := false;
            Exit;
        end;

		if ( not EOF ) then
    			fNewRecord := false
        else    fNewRecord := true;

		Close();
    end;

	m_fUpdateRecord	:= true;

    if ( not fNewRecord ) then
    begin
        // 以下, 未処理
		Result := true;
        Exit;
    end;

    // 登録No.の取得
    nEntryNo := fnGetMasterTreeEntryNoFinal ( m_stMasterData.cExCodeParent );

    with (MQTreeIns) do
    begin
        Close ();

        SetFld('nMasterKbn'    ).AsInteger  := m_nCurrentMasterDiv;             // ﾏｽﾀ区分
        SetFld('cSumNCode'     ).AsCurrency := m_stMasterData.cExCodeParent;    // 加算先内部ｺｰﾄﾞ
        SetFld('nEntNo'        ).AsInteger  := nEntryNo;                        // 登録No.
        SetFld('cBasedNCode'   ).AsCurrency := m_stMasterData.cExCode;          // 加算元内部ｺｰﾄﾞ
        SetFld('cUpdTantoNCode').AsCurrency := m_TantoNCode;                    // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ

		if ( not ExecSQL() ) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, MQTreeIns);
			m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (MQTreeIns);
			Close ();
			Result	:= FALSE;
            Exit;
        end;

		m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK] := 1;
    end;

    // 正常終了
	Result	:= true;

end;
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateMasterDataRecord () 				                            */
//*																									*/
//*	目的	: 補助登録処理 補助基本ﾏｽﾀ更新				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)					                            */
//*																									*/
//***************************************************************************************************/
function TJNTCRP008001f.fnUpdateMasterDataRecord (): Boolean;
var
	strExCode	 : String;
    cNCode       : Currency;
    nAccess      : Integer;
	fNewRecord	 : Boolean;

    i            : Integer;
    cTxtEdit     : TMTxtEdit;
    strHojCode   : String;       //分類・ｾｸﾞﾒﾝﾄ外部ｺｰﾄﾞ
    strFldName   : String;
    lvNcode      : Extended;
    lvName       : String;
    lvAttr       : Integer;
    dqMasterData : TMQuery;
	cMLXBankNCode: Currency;	//<MLXDEP-3>
begin
    lvAttr      := 0;
    cNCode  :=  0;
    cMLXBankNCode := 0;

    // 外部ｺｰﾄﾞ
	strExCode := m_stMasterData.strExCode;
	if ( m_nCurrentCodeAttr <= 1 ) then
		strExCode := Format ('%.16d', [StrToInt64(Trim (strExCode))]);

    m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, MQMaDetailIns );
    m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, MQMaDetailUpd );
    m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, MQMaSel );

    //----------------------------------------
    //  子会社の存在ﾁｪｯｸ [重複ﾁｪｯｸ]
    //----------------------------------------
    with ( MQMaSel ) do
    begin
        Close();
    	SetFld('nMasterKbn').AsInteger := m_nCurrentMasterDiv;          // ﾏｽﾀ区分
    	SetFld('nSumKbn'   ).AsInteger := m_stMasterData.nDivision;     // 実在/合計区分
    	SetFld('sGCode'    ).AsString  := strExCode;                    // 外部ｺｰﾄﾞ

		if ( not Open () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, MQMaSel);
			m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (MQMaSel);
			Close();
			Result := false;
			Exit;
		end;

        // 既存ﾚｺｰﾄﾞ (UPDATE)
		if ( not EOF ) then
        begin
            cNCode                 := GetFld('NCode').AsCurrency;
            m_DtlNCode             := cNCode;                           // FX0047 Add
            m_stMasterData.cExCode := cNCode;
			fNewRecord	           := false;
        end
        // 新規ﾚｺｰﾄﾞ (INSERT)
        else
        begin
			fNewRecord	           := true;
        end;

		Close ();
	end;

	m_fUpdateRecord	:= true;

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
    //
    //  ｸﾞﾙｰﾌﾟ管理を行っている場合は、接続ﾃﾞｰﾀﾍﾞｰｽを親会社に切り替える
    //  通常は、自ﾃﾞｰﾀﾍﾞｰｽに接続されます。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        MQMaDetailIns.Close();

        // 親会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, MQMaDetailIns );
        m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, MQMaDetailUpd );
        m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, MQMaSel );
    end;
    // ↑↑↑<015>
    // -------------------------------------------------------------------------
//↓<MLXDEP-3>
	//MLX新規の時はNCODEを設定するためNCODEの最大値に+1した値を用意しておく。
	//新規と登録時に全銀協のＥＸＰで選択されていた場合はすでに銀行内部コードが入っているが、同じ番号の振り方なので問題なし。
	if ( fNewRecord ) and (TMSeries.IsMjsLink3 = True) then
	begin
		with (MQMaDetailIns) do
		begin
			Close();
            SQL.Clear();
			SQL.Add('select MAX(BankNCode) as MAX from HojyoMA where RDelKbn = 0 and Masterkbn = 21');
			OPEN();
			if not Eof then
			begin
			    cMLXBankNCode := GetFld('MAX').AsInteger;
				cMLXBankNCode := cMLXBankNCode + 1;
			end;
		end;
	end;
//↑<MLXDEP-3>

	if ( fNewRecord ) then      // 新規ﾚｺｰﾄﾞ (INSERT)
	begin
		with (MQMaDetailIns) do
		begin
			Close();
            SQL.Clear();
            SQL.Add('INSERT INTO HojyoMA(   ');
            SQL.Add('    MasterKbn          ');     // ﾏｽﾀ区分
            SQL.Add('   ,SumKbn             ');     // 実在/合計区分
            SQL.Add('   ,GCode              ');     // 外部ｺｰﾄﾞ
            SQL.Add('   ,Renso              ');     // 連想
            SQL.Add('   ,LongName           ');     // 正式名称
            SQL.Add('   ,SimpleName         ');     // 簡略名称
            SQL.Add('   ,BankNCode          ');     // 銀行内部ｺｰﾄﾞ
            SQL.Add('   ,LimitSum           ');     //
            SQL.Add('   ,RDelKbn            ');     // 削除区分
            SQL.Add('   ,UpdTantoNCode      ');     // ﾛｸﾞｲﾝ担当者内部ｺｰﾄﾞ
            SQL.Add('   ,TStartDate         ');     // 適用期間(自)
            SQL.Add('   ,TEndDate           ');     // 適用期間(至)
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
            	SQL.Add('   ,Yobi09        ');		//予備09　全銀協コード
            	SQL.Add('   ,VFree1        ');		//文字フリー項目1（MLXではフリー項目の登録はないので大丈夫）　全銀協の銀行名として使用
            	SQL.Add('   ,VFree2        ');		//文字フリー項目2（MLXではフリー項目の登録はないので大丈夫）　全銀協の支店名として使用
			end;
			//↑<MLXDEP-3>


            // 詳細時追加
            if ( m_stMasterData.fDetails ) then
            begin
                SQL.Add('   ,BunruiNCode1       '); // 銀行分類01
                SQL.Add('   ,BunruiNCode2       '); // 銀行分類02
                SQL.Add('   ,BunruiNCode3       '); // 銀行分類03
                SQL.Add('   ,BunruiNCode4       '); // 銀行分類04
                SQL.Add('   ,BunruiNCode5       '); // 銀行分類05
                SQL.Add('   ,BunruiNCode6       '); // 銀行分類06
                SQL.Add('   ,BunruiNCode7       '); // 銀行分類07
                SQL.Add('   ,BunruiNCode8       '); // 銀行分類08
                SQL.Add('   ,BunruiNCode9       '); // 銀行分類09
                SQL.Add('   ,BunruiNCode10      '); // 銀行分類10
                SQL.Add('   ,SegNCode1          '); // ｾｸﾞﾒﾝﾄ01
                SQL.Add('   ,SegNCode2          '); // ｾｸﾞﾒﾝﾄ02
                SQL.Add('   ,SegNCode3          '); // ｾｸﾞﾒﾝﾄ03
                SQL.Add('   ,SegNCode4          '); // ｾｸﾞﾒﾝﾄ04
                SQL.Add('   ,SegNCode5          '); // ｾｸﾞﾒﾝﾄ05
                SQL.Add('   ,SegNCode6          '); // ｾｸﾞﾒﾝﾄ06
                SQL.Add('   ,SegNCode7          '); // ｾｸﾞﾒﾝﾄ07
                SQL.Add('   ,SegNCode8          '); // ｾｸﾞﾒﾝﾄ08
                SQL.Add('   ,SegNCode9          '); // ｾｸﾞﾒﾝﾄ09
                SQL.Add('   ,SegNCode10         '); // ｾｸﾞﾒﾝﾄ10
            end;

            // ﾌﾘｰ項目追加
            if ( m_UpdFreeFlg ) then
            begin
                SQL.Add('   ,VFree1             '); // 文字項目01
                SQL.Add('   ,VFree2             '); // 文字項目02
                SQL.Add('   ,VFree3             '); // 文字項目03
                SQL.Add('   ,VFree4             '); // 文字項目04
                SQL.Add('   ,VFree5             '); // 文字項目05
                SQL.Add('   ,VFree6             '); // 文字項目06
                SQL.Add('   ,VFree7             '); // 文字項目07
                SQL.Add('   ,VFree8             '); // 文字項目08
                SQL.Add('   ,VFree9             '); // 文字項目09
                SQL.Add('   ,VFree10            '); // 文字項目10
                SQL.Add('   ,NFree1             '); // 数値項目01
                SQL.Add('   ,NFree2             '); // 数値項目02
                SQL.Add('   ,NFree3             '); // 数値項目03
                SQL.Add('   ,NFree4             '); // 数値項目04
                SQL.Add('   ,NFree5             '); // 数値項目05
                SQL.Add('   ,NFree6             '); // 数値項目06
                SQL.Add('   ,NFree7             '); // 数値項目07
                SQL.Add('   ,NFree8             '); // 数値項目08
                SQL.Add('   ,NFree9             '); // 数値項目09
                SQL.Add('   ,NFree10            '); // 数値項目10

//<048> DEL                if ( m_freeItem.DFree1 > 0 ) then
                    SQL.Add('   ,DFree1         '); // 日付項目01
//<048> DEL                if ( m_freeItem.DFree2 > 0 ) then
                    SQL.Add('   ,DFree2         '); // 日付項目02
//<048> DEL                if ( m_freeItem.DFree3 > 0 ) then
                    SQL.Add('   ,DFree3         '); // 日付項目03
            end;
            SQL.Add(') VALUES(                  ');
            SQL.Add('    :MasterKbn             ');
            SQL.Add('   ,:SumKbn                ');
            SQL.Add('   ,:GCode                 ');
            SQL.Add('   ,:Renso                 ');
            SQL.Add('   ,:LongName              ');
            SQL.Add('   ,:SimpleName            ');
            SQL.Add('   ,:BankNCode             ');
            SQL.Add('   ,0                      ');
            SQL.Add('   ,:RDelKbn               ');
            SQL.Add('   ,:UpdTantoNCode         ');
            SQL.Add('   ,:TStartDate            ');
            SQL.Add('   ,:TEndDate              ');
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
            	SQL.Add('   ,:Yobi09        ');		//予備09　全銀協コード
            	SQL.Add('   ,:VFree1        ');		//文字フリー項目1（MLXではフリー項目の登録はないので大丈夫）　全銀協の銀行名として使用
            	SQL.Add('   ,:VFree2        ');		//文字フリー項目2（MLXではフリー項目の登録はないので大丈夫）　全銀協の支店名として使用

			end;
			//↑<MLXDEP-3>

            // 詳細時追加
            if ( m_stMasterData.fDetails ) then
            begin
                SQL.Add('   ,:BunruiNCode1      ');
                SQL.Add('   ,:BunruiNCode2      ');
                SQL.Add('   ,:BunruiNCode3      ');
                SQL.Add('   ,:BunruiNCode4      ');
                SQL.Add('   ,:BunruiNCode5      ');
                SQL.Add('   ,:BunruiNCode6      ');
                SQL.Add('   ,:BunruiNCode7      ');
                SQL.Add('   ,:BunruiNCode8      ');
                SQL.Add('   ,:BunruiNCode9      ');
                SQL.Add('   ,:BunruiNCode10     ');
                SQL.Add('   ,:SegNCode1         ');
                SQL.Add('   ,:SegNCode2         ');
                SQL.Add('   ,:SegNCode3         ');
                SQL.Add('   ,:SegNCode4         ');
                SQL.Add('   ,:SegNCode5         ');
                SQL.Add('   ,:SegNCode6         ');
                SQL.Add('   ,:SegNCode7         ');
                SQL.Add('   ,:SegNCode8         ');
                SQL.Add('   ,:SegNCode9         ');
                SQL.Add('   ,:SegNCode10        ');
            end;

            // ﾌﾘｰ項目追加
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
//<048> MOD St
{
                if ( m_freeItem.DFree1 > 0 ) then
                    SQL.Add('   ,:DFree1        ');
                if ( m_freeItem.DFree2 > 0 ) then
                    SQL.Add('   ,:DFree2        ');
                if ( m_freeItem.DFree3 > 0 ) then
                    SQL.Add('   ,:DFree3        ');
}
                if ( m_freeItem.DFree1 > 0 ) then
                begin
                    SQL.Add('   ,:DFree1    ');
                end
                else
                begin
                    SQL.Add('   ,NULL    ');
                end;
                if ( m_freeItem.DFree2 > 0 ) then
                begin
                    SQL.Add('   ,:DFree2    ');
                end
                else
                begin
                    SQL.Add('   ,NULL    ');
                end;
                if ( m_freeItem.DFree3 > 0 ) then
                begin
                    SQL.Add('   ,:DFree3    ');
                end
                else
                begin
                    SQL.Add('   ,NULL    ');
                end;
//<048> MOD Ed
            end;
            SQL.Add(')');

            SetFld('MasterKbn'    ).AsInteger  := m_nCurrentMasterDiv;
			SetFld('SumKbn'       ).AsInteger  := m_stMasterData.nDivision;
			SetFld('GCode'        ).AsString   := TrimRight(strExCode);
			SetFld('Renso'        ).AsString   := m_stMasterData.strAssociation;
			SetFld('LongName'     ).AsString   := m_stMasterData.strName;
			SetFld('SimpleName'   ).AsString   := m_stMasterData.strNameSimple;
			SetFld('BankNCode'    ).AsCurrency := m_stMasterData.cBankNCode;
			SetFld('RDelKbn'      ).AsInteger  := 0;
			SetFld('UpdTantoNCode').AsCurrency := m_TantoNCode;
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
				SetFld('BankNCode'    ).AsCurrency	:= cMLXBankNCode;
				SetFld('Yobi09'    ).AsString		:= m_stMasterData.Yobi09;
				SetFld('VFree1'    ).AsString		:= m_stMasterData.ZenBankNM;
				SetFld('VFree2'    ).AsString		:= m_stMasterData.ZenOfficeNM;
			end;
			//↑<MLXDEP-3>


            // 詳細時追加
            if ( m_stMasterData.fDetails ) then
            begin
//<038> MOD St
                SetFld('TStartDate').AsDateTime     :=  m_stMasterData.dDateStart;
                if (m_stMasterData.dDateStart = xcoZeroDate) then
//                    SetFld('TStartDate').AsDateTime :=  StrToDate('1900/01/01');
                    SetFld('TStartDate').AsInteger :=  MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE);

                SetFld('TEndDate').AsDateTime       :=  m_stMasterData.dDateEnd;
                if (m_stMasterData.dDateEnd = xcoZeroDate) then
//                    SetFld('TEndDate').AsDateTime   :=  StrToDate('2099/12/31');
                    SetFld('TEndDate').AsInteger   :=  MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE);
//<038> MOD Ed

                // 分類ｺｰﾄﾞｾｯﾄ
                for i := 1 to 10 do
                begin
                    cTxtEdit    := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
                    strFldName  := Format ('BunruiNCode%.1d%.', [i]);

                    Case cTxtEdit.InputAttr of
                        iaZeroSup   : lvAttr := 0;
                        iaZeroPad   : lvAttr := 1;
                        iaNone      : lvAttr := 2;
                    end;

                    strHojCode := fnGetDspData(cTxtEdit.text,lvAttr);

                    if (m_stMasterData.fDetails) then
                    begin
                        //内部ｺｰﾄﾞ取得
                        if fnGetHojyoMA(cTxtEdit.Tag, strHojCode, lvName, lvNCode) then
                            SetFld(strFldName).AsFloat := lvNCode
                        else
                            SetFld(strFldName).AsFloat := 0;
                    end
                    else
                        SetFld(strFldName).AsFloat := 0;
                end;

                // ｾｸﾞﾒﾝﾄｺｰﾄﾞｾｯﾄ
                for i := 1 to 10 do
                begin
                    cTxtEdit    := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
                    strFldName  := Format ('SegNCode%.1d%.', [i]);

                    Case cTxtEdit.InputAttr of
                        iaZeroSup   : lvAttr := 0;
                        iaZeroPad   : lvAttr := 1;
                        iaNone      : lvAttr := 2;
                    end;

                    strHojCode := fnGetDspData(cTxtEdit.text,lvAttr);

                    if (m_stMasterData.fDetails) then
                    begin
                        //内部ｺｰﾄﾞ取得
                        if fnGetHojyoMA(cTxtEdit.Tag, strHojCode, lvName, lvNCode) then
                            SetFld(strFldName).AsFloat := lvNCode
                        else
                            SetFld(strFldName).AsFloat := 0;
                    end
                    else
                        SetFld(strFldName).AsFloat := 0;

                end;
            end
            // 詳細時以外
            else
            begin
//<038> MOD St
//                SetFld('TStartDate').AsDateTime := StrToDate('1900/01/01');
//                SetFld('TEndDate'  ).AsDateTime := StrToDate('2099/12/31');

                SetFld('TStartDate').AsInteger :=  MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE);
                SetFld('TEndDate').AsInteger   :=  MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE);
//<038> MOD Ed
            end;

            // ﾌﾘｰ項目追加ﾊﾟﾗﾒｰﾀ
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
                    ParamByName('DFree1').AsDateTime := m_freeItem.DFree1;
                if ( m_freeItem.DFree2 > 0 ) then
                    ParamByName('DFree2').AsDateTime := m_freeItem.DFree2;
                if ( m_freeItem.DFree3 > 0 ) then
                    ParamByName('DFree3').AsDateTime := m_freeItem.DFree3;

            end;

			if	(not ExecSQL ()) then
            begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, MQMaDetailIns);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (MQMaDetailIns);
				Close();
				Result := false;
				Exit;
			end;

			m_NewRecord := true;


            // 登録したNCodeを取得する
	        with ( MQMaSel ) do
        	begin
        		Close();
        		SetFld('nMasterKbn').AsInteger := m_nCurrentMasterDiv;
        		SetFld('nSumKbn'   ).AsInteger := m_stMasterData.nDivision;
        		SetFld('sGCode'    ).AsString  := strExCode;

        		if ( not Open () ) then
        		begin
        			m_cComArea.m_MsgStd.GetMsgDB(m_cErrorMsgRec, MQMaSel);
        			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (MQMaSel);
        			Close ();
        			Result := false;
        			Exit;
        		end;

		        if ( not EOF ) then
                begin
                    cNCode                 := GetFld('NCode').AsCurrency;
                    m_DtlNCode             := cNCode;                       // FX0047 Add
                    m_stMasterData.cExCode := cNCode;
                end;

		        Close ();
        	end;
		end;

        // 補助体系追加ﾓｰﾄﾞ
        nAccess := ACCESS_TREE_ADD;
	end
    // 既存ﾚｺｰﾄﾞ (UPDATE)
	else
	begin
		with ( MQMaDetailUpd ) do
		begin
			Close();
            SQL.Clear();
            SQL.Add('UPDATE HojyoMA SET                 ');
            SQL.Add('    Renso         = :Renso         ');
            SQL.Add('   ,LongName      = :LongName      ');
            SQL.Add('   ,SimpleName    = :SimpleName    ');
            SQL.Add('   ,BankNCode     = :BankNCode     ');
            SQL.Add('   ,UpdTantoNCode = :UpdTantoNCode ');
            SQL.Add('   ,RDelKbn       = 0              ');
            SQL.Add('   ,GCode         = :GCode         ');
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
		       	SQL.Add('   ,Yobi09        = :Yobi09        ');		//予備09　全銀協コード
		       	SQL.Add('   ,VFree1        = :VFree1        ');	//文字フリー項目1（MLXではフリー項目の登録はないので大丈夫）　全銀協の銀行名として使用
		       	SQL.Add('   ,VFree2        = :VFree2        ');	//文字フリー項目2（MLXではフリー項目の登録はないので大丈夫）　全銀協の支店名として使用
			end;
			//↑<MLXDEP-3>

            // 詳細時追加
            if ( m_stMasterData.fDetails ) then
            begin
                SQL.Add('   ,TStartDate    = :TStartDate    ');
                SQL.Add('   ,TEndDate      = :TEndDate      ');
                SQL.Add('   ,BunruiNCode1  = :BunruiNCode1  ');
                SQL.Add('   ,BunruiNCode2  = :BunruiNCode2  ');
                SQL.Add('   ,BunruiNCode3  = :BunruiNCode3  ');
                SQL.Add('   ,BunruiNCode4  = :BunruiNCode4  ');
                SQL.Add('   ,BunruiNCode5  = :BunruiNCode5  ');
                SQL.Add('   ,BunruiNCode6  = :BunruiNCode6  ');
                SQL.Add('   ,BunruiNCode7  = :BunruiNCode7  ');
                SQL.Add('   ,BunruiNCode8  = :BunruiNCode8  ');
                SQL.Add('   ,BunruiNCode9  = :BunruiNCode9  ');
                SQL.Add('   ,BunruiNCode10 = :BunruiNCode10 ');
                SQL.Add('   ,SegNCode1     = :SegNCode1     ');
                SQL.Add('   ,SegNCode2     = :SegNCode2     ');
                SQL.Add('   ,SegNCode3     = :SegNCode3     ');
                SQL.Add('   ,SegNCode4     = :SegNCode4     ');
                SQL.Add('   ,SegNCode5     = :SegNCode5     ');
                SQL.Add('   ,SegNCode6     = :SegNCode6     ');
                SQL.Add('   ,SegNCode7     = :SegNCode7     ');
                SQL.Add('   ,SegNCode8     = :SegNCode8     ');
                SQL.Add('   ,SegNCode9     = :SegNCode9     ');
                SQL.Add('   ,SegNCode10    = :SegNCode10    ');
            end;

            // ﾌﾘｰ項目追加SQL
            if ( m_UpdFreeFlg ) then
            begin
                SQL.Add('   ,VFree1        = :VFree1        ');
                SQL.Add('   ,VFree2        = :VFree2        ');
                SQL.Add('   ,VFree3        = :VFree3        ');
                SQL.Add('   ,VFree4        = :VFree4        ');
                SQL.Add('   ,VFree5        = :VFree5        ');
                SQL.Add('   ,VFree6        = :VFree6        ');
                SQL.Add('   ,VFree7        = :VFree7        ');
                SQL.Add('   ,VFree8        = :VFree8        ');
                SQL.Add('   ,VFree9        = :VFree9        ');
                SQL.Add('   ,VFree10       = :VFree10       ');
                SQL.Add('   ,NFree1        = :NFree1        ');
                SQL.Add('   ,NFree2        = :NFree2        ');
                SQL.Add('   ,NFree3        = :NFree3        ');
                SQL.Add('   ,NFree4        = :NFree4        ');
                SQL.Add('   ,NFree5        = :NFree5        ');
                SQL.Add('   ,NFree6        = :NFree6        ');
                SQL.Add('   ,NFree7        = :NFree7        ');
                SQL.Add('   ,NFree8        = :NFree8        ');
                SQL.Add('   ,NFree9        = :NFree9        ');
                SQL.Add('   ,NFree10       = :NFree10       ');
//<048> MOD St
{
                if ( m_freeItem.DFree1 > 0 ) then
                    SQL.Add('   ,DFree1 = :DFree1           ');
                if ( m_freeItem.DFree2 > 0 ) then
                    SQL.Add('   ,DFree2 = :DFree2           ');
                if ( m_freeItem.DFree3 > 0 ) then
                    SQL.Add('   ,DFree3 = :DFree3           ');
}
                if ( m_freeItem.DFree1 > 0 ) then
                begin
                    SQL.Add('   ,DFree1 = :DFree1       ');
                end
                else
                begin
                    SQL.Add('   ,DFree1 = NULL       ');
                end;
                if ( m_freeItem.DFree2 > 0 ) then
                begin
                    SQL.Add('   ,DFree2 = :DFree2       ');
                end
                else
                begin
                    SQL.Add('   ,DFree2 = NULL       ');
                end;
                if ( m_freeItem.DFree3 > 0 ) then
                begin
                    SQL.Add('   ,DFree3 = :DFree3       ');
                end
                else
                begin
                    SQL.Add('   ,DFree3 = NULL       ');
                end;
//<048> MOD Ed
            end;

            SQL.Add('WHERE NCode     = :NCode           ');
            SQL.Add('  and Masterkbn = :MstKbn          ');     // <026>

			SetFld('Renso'        ).AsString   := m_stMasterData.strAssociation;
			SetFld('LongName'     ).AsString   := m_stMasterData.strName;
			SetFld('SimpleName'   ).AsString   := m_stMasterData.strNameSImple;
			SetFld('BankNCode'    ).AsCurrency := m_stMasterData.cBankNCode;
			SetFld('UpdTantoNCode').AsCurrency := m_TantoNCode;
			SetFld('GCode'        ).AsString   := TrimRight(strExCode);
			SetFld('NCode'        ).AsCurrency := cNCode;
            SetFld('MstKbn'       ).AsInteger  := m_nCurrentMasterDiv;   // <026>
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
				SetFld('Yobi09'    ).AsString		:= m_stMasterData.Yobi09;
				if m_stMasterData.Yobi09 <> '' then
				begin
					SetFld('VFree1'    ).AsString		:= m_stMasterData.ZenBankNM;
					SetFld('VFree2'    ).AsString		:= m_stMasterData.ZenOfficeNM;
				end
				else
				begin
					SetFld('VFree1'    ).AsString		:= '';
					SetFld('VFree2'    ).AsString		:= '';
				end;
			end;
			//↑<MLXDEP-3>

            // 詳細時追加ﾊﾟﾗﾒｰﾀ
            if (m_stMasterData.fDetails) then
            begin
//<038> MOD St
                SetFld('TStartDate').AsDateTime     :=  m_stMasterData.dDateStart;
                if ( m_stMasterData.dDateStart = xcoZeroDate ) then
//                    SetFld('TStartDate').AsDateTime :=  StrToDate('1900/01/01');
                    SetFld('TStartDate').AsInteger :=  MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE);
                SetFld('TEndDate').AsDateTime       :=  m_stMasterData.dDateEnd;
                if ( m_stMasterData.dDateEnd = xcoZeroDate ) then
//                    SetFld('TEndDate').AsDateTime   :=  StrToDate('2099/12/31');
                    SetFld('TEndDate').AsInteger   :=  MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE);
//<038> MOD Ed

                // 分類ｺｰﾄﾞｾｯﾄ
                for i := 1 to 10 do
                begin
                    cTxtEdit   := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
                    strFldName := Format ('BunruiNCode%.1d%.', [i]);

                    Case cTxtEdit.InputAttr of
                        iaZeroSup : lvAttr := 0;
                        iaZeroPad : lvAttr := 1;
                        iaNone    : lvAttr := 2;
                    end;

                    strHojCode := fnGetDspData(cTxtEdit.text,lvAttr);

                    // 内部ｺｰﾄﾞ取得
                    if ( fnGetHojyoMA(cTxtEdit.Tag, strHojCode, lvName, lvNCode) ) then
                            SetFld(strFldName).AsFloat := lvNCode
                    else    SetFld(strFldName).AsFloat := 0;
                end;

                // ｾｸﾞﾒﾝﾄｺｰﾄﾞｾｯﾄ
                for i := 1 to 10 do
                begin
                    cTxtEdit   := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
                    strFldName := Format ('SegNCode%.1d%.', [i]);

                    Case cTxtEdit.InputAttr of
                        iaZeroSup : lvAttr := 0;
                        iaZeroPad : lvAttr := 1;
                        iaNone    : lvAttr := 2;
                    end;

                    strHojCode := fnGetDspData(cTxtEdit.text,lvAttr);

                    // 内部ｺｰﾄﾞ取得
                    if ( fnGetHojyoMA(cTxtEdit.Tag, strHojCode, lvName, lvNCode) ) then
                            SetFld(strFldName).AsFloat := lvNCode
                    else    SetFld(strFldName).AsFloat := 0;
                end;
            end;

            // ﾌﾘｰ項目追加ﾊﾟﾗﾒｰﾀ
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
                    ParamByName('DFree1').AsDateTime := m_freeItem.DFree1;
                if ( m_freeItem.DFree2 > 0 ) then
                    ParamByName('DFree2').AsDateTime := m_freeItem.DFree2;
                if ( m_freeItem.DFree3 > 0 ) then
                    ParamByName('DFree3').AsDateTime := m_freeItem.DFree3;
            end;

	        if ( not ExecSQL () ) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, MQMaDetailUpd);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (MQMaDetailUpd);
				Close ();
				Result := false;
				Exit;
			end;
		end;

        // 補助体系更新ﾓｰﾄﾞ
        nAccess :=  ACCESS_TREE_UPDATE;
	end;

    // 体系の更新
	fnUpdateTreeViewItems (m_stMasterData.nDivision,
                           strExCode,
                           m_stMasterData.strNameSimple,
                           cNCode,
                           nAccess);

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
    //
    //  ｸﾞﾙｰﾌﾟ管理を行っている場合は、同期配信ﾌﾟﾛｼｼﾞｬを実行し自DBへ情報を書込み
    //  親DBと同期を図る。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
        if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) = false ) then
        begin
            Result := false;
            Exit;
        end;

        // <025> - ST
        // SecHojyoDispInfoのﾒﾝﾃを行う
        dqMasterData := TMQuery.Create ( Self );
        // 親会社DBとMQueryの接続
        m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, dqMasterData );

        try

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
            dqMasterData.ParamByName('NCode'  ).AsFloat   := cNCode;

            //  ｴﾗｰの判定
            if	( not dqMasterData.Open() ) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
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
                dqMasterData.ParamByName('NCode'  ).AsFloat   := cNCode;
                dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                if	( not dqMasterData.ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
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
                dqMasterData.ParamByName('NCode'  ).AsFloat   := cNCode;
                dqMasterData.ParamByName('DispKbn').AsInteger := DISP_ON;

                if	( not dqMasterData.ExecSQL() ) then
                begin
                    m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
                    m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
                    Result := false;
                    Exit;
                end;
            end;
        finally
            dqMasterData.Close();
            dqMasterData.Free();
        end;
        // <025> - ED
    end;
    // ↑↑↑<015>
    // -------------------------------------------------------------------------

    // 正常終了
	Result := true;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnDeleteMasterRecord (Integer; String)                                 */
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
procedure   TJNTCRP008001f.fnDeleteMasterRecord(nDivision: Integer; cExCode: Currency);
var
    fReturn: Boolean;
    DmqData: TMQuery;                                                           // <050>
    iCnt   : Integer;                                                           // <050>
    strMstr: String;                                                            // <050>
begin
    // ﾄﾗﾝｻﾞｸｼｮﾝの開始
    m_cDataModule.BeginTran (m_cDBSelect);

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
    //
    //  ﾏｽﾀﾃﾞｰﾀを削除する際に、ｸﾞﾙｰﾌﾟ管理を採用している場合は、親会社ﾃﾞｰﾀﾍﾞｰｽに
    //  対してﾄﾗﾝｻﾞｸｼｮﾝを掛ける。。
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        // 親会社ﾃﾞｰﾀﾍﾞｰｽに対してﾄﾗﾝｻﾞｸｼｮﾝを掛ける
        m_cDataModule.BeginTran ( m_SyncMaster.m_cPDBSelect );
    end;
    // <015>
    // -------------------------------------------------------------------------

    // HojyoTree
    fReturn := fnDeleteMasterTreeRecord(nDivision, cExCode);                    // 補助加算体系ﾏｽﾀ更新

    if  (not fReturn) then                                                      // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();

        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    // HojyoMA
    fReturn := fnDeleteMasterDataRecord (nDivision, cExCode); 				    // 補助基本ﾏｽﾀ更新

    if  (not fReturn) then                                                      // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();

        // <015>
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
        begin
            m_cDataModule.Rollback ( m_SyncMaster.m_cPDBSelect );
        end;
        // <015>

        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    // MFusenInfo
    fReturn := fnDeleteMasterDataAddition (cExCode); 							// その他ﾏｽﾀ削除

    if  (not fReturn) then                                                      // ｴﾗｰ
    begin
		fnOutputDBErrorMessage ();

        m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
    end;

    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)

    // <015>
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        m_cDataModule.Commit ( m_SyncMaster.m_cPDBSelect );
    end;
    // <015>

	fnDeleteTreeViewItems (cExCode);

    // <050> Start
    // 実在の時
    if (nDivision = 0) then
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
            strMstr := '銀行';
            MjsMessageBoxEx(Self, strMstr + 'が削除されました。' + #13#10 + 'Edge Tracker でマスタを見直してください。', '確認', mjInformation, mjOk, mjDefOk);
        end;

    end;
    // <050> End

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnDeleteMasterTreeRecord (Integer; String)			                    */
//*																									*/
//*	目的	: 補助登録処理 補助加算体系ﾏｽﾀ削除			                                   		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)                                              */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           strExCode = 補助外部ｺｰﾄﾞ                                                              */
//*                                                                                                 */
//***************************************************************************************************/
function TJNTCRP008001f.fnDeleteMasterTreeRecord(nDivision: Integer; cExCode: Currency): Boolean;
var
	dqMasterTree       : TMQuery;
	dqMasterTreeUpdate : TMQuery;
	nEntryNo           : Integer;
	fUpdateRecord      : Boolean;

begin
	dqMasterTree		:= TMQuery.Create (Self);
	dqMasterTreeUpdate	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterTree      );				// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterTreeUpdate);				// DBとMQueryの接続

	if	(nDivision = 1) then
	begin
		with (dqMasterTree) do
		begin
			nEntryNo	:= fnGetMasterTreeEntryNoFinal(0);

			Close ();

			SQL.Clear ();
			SQL.Add('SELECT BasedNCode FROM HojyoTree ');
			SQL.Add('WHERE  MasterKbn=:nMasterKbn AND SumNCode=:cExCodeDst ');
            SQL.Add('ORDER BY EntNo');

			ParamByName('nMasterKbn').AsInteger     := m_nCurrentMasterDiv;
			ParamByName('cExCodeDst').AsCurrency	:= cExCode;

			if	(not Open ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

				dqMasterTree      .Close ();
				dqMasterTreeUpdate.Close ();
				dqMasterTree      .Free  ();
				dqMasterTreeUpdate.Free  ();

				Result	:= FALSE;
				Exit;
			end;

			while (not EOF) do
			begin
				with (dqMasterTreeUpdate) do
				begin
					Close ();

					SQL.Clear ();
					SQL.Add('SELECT BasedNCode FROM HojyoTree ');
					SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
					SQL.Add('SumNCode=:cCodeDst AND BasedNCode=:cCodeSrc');

					ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
					ParamByName ('cCodeDst'  ).AsCurrency   := 0;
					ParamByName ('cCodeSrc'  ).AsCurrency	:= dqMasterTree.FieldByName('BasedNCode').AsCurrency;

					if	(not Open ()) then
					begin
						m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

						m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

						dqMasterTree      .Close ();
						dqMasterTreeUpdate.Close ();
						dqMasterTree      .Free  ();
						dqMasterTreeUpdate.Free  ();

						Result	:= FALSE;
						Exit;
					end;

					if	(not EOF) then
						fUpdateRecord	:= FALSE
					else
						fUpdateRecord	:= TRUE;

					Close ();
				end;

				if	(fUpdateRecord) then
				begin
					with (dqMasterTreeUpdate) do
					begin
						Close ();

						SQL.Clear ();
						SQL.Add('UPDATE HojyoTree SET ');
                        SQL.Add('EntNo=:nEntryNo, SumNCode=:cSumCode, ');
                        SQL.Add('UpdTantoNCode=:cUpdTantoNCode '); // <034>
						SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
						SQL.Add('SumNCode=:cCodeDst AND BasedNCode=:cCodeSrc');

						SetFld('nEntryNo'  ).AsInteger	:= nEntryNo;
						SetFld('cSumCode'  ).AsCurrency := 0;
						SetFld('nMasterKbn').AsInteger  := m_nCurrentMasterDiv;
						SetFld('cCodeDst'  ).AsCurrency := cExCode;
						SetFld('cCodeSrc'  ).AsCurrency := dqMasterTree.FieldByName('BasedNCode').AsCurrency;
                        SetFld('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

						if	(not ExecSQL ()) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= FALSE;
							Exit;
						end;

						m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
					end;

					nEntryNo	:= nEntryNo + 100;
				end
				else
				begin
					with (dqMasterTreeUpdate) do
					begin
						Close ();

						SQL.Clear ();
						SQL.Add('DELETE FROM HojyoTree ');
						SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
						SQL.Add('SumNCode=:cCodeDst AND BasedNCode=:cCodeSrc');

						SetFld('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
						SetFld('cCodeDst'  ).AsCurrency	:= cExCode;
						SetFld('cCodeSrc'  ).AsCurrency	:= dqMasterTree.FieldByName('BasedNCode').AsCurrency;

						if	(not ExecSQL ()) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= FALSE;
							Exit;
						end;

						m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
						m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
					end;
				end;

				NEXT;
			end;

			Close ();
		end;
	end;

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM HojyoTree ');
		SQL.Add   ('WHERE  MasterKbn=:nMasterKbn AND BasedNCode = :cCodeSrc');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('cCodeSrc'  ).AsCurrency   := cExCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree      .Close ();
			dqMasterTreeUpdate.Close ();
			dqMasterTree      .Free  ();
			dqMasterTreeUpdate.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
	end;

	dqMasterTree      .Close ();
	dqMasterTreeUpdate.Close ();
	dqMasterTree      .Free  ();
	dqMasterTreeUpdate.Free  ();

	Result	:= TRUE;															// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnDeleteMasterDataRecord (Integer; String)                             */
//*																									*/
//*	目的	: 補助登録処理 補助基本ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           strExCode = 補助外部ｺｰﾄﾞ                                                              */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnDeleteMasterDataRecord (nDivision: Integer; cExCode: Currency): Boolean;
var
	dqMasterData: TMQuery;
//	cNCode		:	AsCurrency;	//	削除するﾚｺｰﾄﾞの内部ｺｰﾄﾞ		HIS0004
begin
	//	初期処理
//	cNCode	:=	0;

	dqMasterData := TMQuery.Create (Self);

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
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
        dqMasterData.ParamByName('pNCode'      ).AsFloat   := cExCode;
        dqMasterData.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

        if ( dqMasterData.ExecSQL = false ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
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

        // <025> - ST
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
        dqMasterData.ParamByName('NCode'  ).AsFloat   := cExCode;
        dqMasterData.ParamByName('DispKbn').AsInteger := DISP_OFF;

        if	( not dqMasterData.ExecSQL() ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
            Result := FALSE;
            Exit;
        end;
        // <025> - ED
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
        dqMasterData.ParamByName('pNCode' ).AsFloat   := cExCode;

        if ( dqMasterData.Open = False ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
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
        dqMasterData.ParamByName('strExCode'    ).AsFloat    := cExCode;
        dqMasterData.ParamByName('UpdTantoNCode').AsCurrency := m_TantoNCode;

        if ( dqMasterData.ExecSQL = false ) then
        begin
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close();
			dqMasterData.Free();
            result := false;
            Abort;
        end;
    end;
    // ↑↑↑<015>
    // -------------------------------------------------------------------------

(*
	with (dqMasterData) do
	begin
		//	削除するﾚｺｰﾄﾞの内部ｺｰﾄﾞを取得	HIS0004
		Close ();
		SQL.Clear ();
		SQL.Add('UPDATE HojyoMA SET RDelKbn=1 ');				//	HIS0004
		SQL.Add('WHERE NCode=:cNCode          ');
		SetFld('cNCode').AsCurrency  := cExCode;

		if ( not ExecSQL () ) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode := m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
			dqMasterData.Close();
			dqMasterData.Free();
			Result := FALSE;
			Exit;
		end;
	end;
*) // <015>

	dqMasterData.Close ();
	dqMasterData.Free  ();

    // 正常終了
	Result := TRUE;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnDeleteMasterDataAddition (String)										*/
//*																									*/
//*	目的	: 補助登録処理 その他ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP008001f.fnDeleteMasterDataAddition(cExCode: Currency): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('DELETE FROM MFusenInfo ');
        SQL.Add('WHERE MasterKbn=:nMasterKbn AND NCode=:cNCode');

		SetFld('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		SetFld('cNCode'    ).AsCurrency := cExCode;

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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnEraseMasterTreeRecord (String; String)	                                */
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
procedure   TJNTCRP008001f.fnEraseMasterTreeRecord(cExCode, cExCodeParent: Currency);
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
		SQL.Add('SELECT Count(BasedNCode) as Count FROM HojyoTree ');
		SQL.Add('WHERE MasterKbn=:nMasterKbn AND BasedNCode=:cExCodeSrc');

        SetFld('nMasterKbn').AsInteger  := m_nCurrentMasterDiv;
        SetFld('cExCodeSrc').AsCurrency := cExCode;

		Open;

		if FieldByName('Count').AsInteger <= 1 then
		begin
//------------------------------------------------------------------------------HIS0017End

	        nEntryNo    := fnGetMasterTreeEntryNoFinal(0);

    	    Close ();

	        SQL.Clear;
    	    SQL.ADD('SELECT BasedNCode FROM HojyoTree ');
        	SQL.ADD('WHERE MasterKbn=:nMasterKbn AND');
            SQL.Add('SumNCode=:cExCodeDst AND BasedNCode=:cExCodeSrc');

	        SetFld('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
    	    SetFld('cExCodeDst').AsCurrency   := 0;
        	SetFld('cExCodeSrc').AsCurrency   := cExCode;

	        Open ();

    	    if  (not EOF) then
        	    fUpdateRecord   := False
	        else
    	        fUpdateRecord   := True;
		end
//------------------------------------------------------------------------------HIS0017Start
		else
		begin
			fUpdateRecord		:= False;
		end;
//------------------------------------------------------------------------------HIS0017End


		m_fUpDeleteRecord		:= False;


        if  (fUpdateRecord) then
        begin
            with (dqMasterTreeUpdate) do
            begin
                Close ();

                SQL.Clear ();
				SQL.Add('UPDATE HojyoTree SET EntNo=:nEntryNo, SumNCode=:cSumCode, ');
				SQL.Add('UpdTantoNCode=:cUpdTantoNCode  '); // <034>
				SQL.Add('WHERE MasterKbn=:nMasterKbn AND ');
				SQL.Add('SumNCode=:cExCodeDst AND BasedNCode=:cExCodeSrc');

                SetFld('nEntryNo'  ).AsInteger    := nEntryNo;
                SetFld('cSumCode'  ).AsCurrency   := 0;
                SetFld('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
                SetFld('cExCodeDst').AsCurrency   := cExCodeParent;
                SetFld('cExCodeSrc').AsCurrency   := cExCode;
                SetFld('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

				if	(not ExecSQL ()) then
                begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

					fnOutputDBErrorMessage ();

					m_cDataModule     .Rollback (m_cDBSelect);							// ﾛｰﾙﾊﾞｯｸ(破棄)
					dqMasterTree      .Close	();
					dqMasterTreeUpdate.Close	();
					dqMasterTree      .Free		();
					dqMasterTreeUpdate.Free		();
                    Exit;
				end;

				m_bHojyoTree2 [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;

				m_fUpDeleteRecord	:= True;
            end;
        end
        else
        begin
            with (dqMasterTreeUpdate) do
            begin
                Close ();

				SQL.Clear ();
				SQL.Add('DELETE FROM HojyoTree ');
				SQL.Add('WHERE  MasterKbn=:nMasterKbn AND ');
				SQL.Add('SumNCode=:cExCodeDst AND BasedNCode=:cExCodeSrc');

                SetFld('nMasterKbn').AsInteger  := m_nCurrentMasterDiv;
                SetFld('cExCodeDst').AsCurrency := cExCodeParent;
                SetFld('cExCodeSrc').AsCurrency := cExCode;

				if	(not ExecSQL ()) then
                begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

					fnOutputDBErrorMessage ();

					m_cDataModule     .Rollback (m_cDBSelect);							// ﾛｰﾙﾊﾞｯｸ(破棄)
					dqMasterTree      .Close	();
					dqMasterTreeUpdate.Close	();
					dqMasterTree      .Free		();
					dqMasterTreeUpdate.Free		();
                    Exit;
                end;

				m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
				m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;

				m_fUpDeleteRecord	:= False;
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
//*	関数	: TJNTCRP008001f.fnUpdateDetailIndInfo ()													*/
//*																									*/
//*	目的	: 補助登録処理 各種管理情報更新															*/
//*																									*/
//*	戻り値	: なし,                                                 		                        */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnUpdateDetailIndInfo ();
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
//*	関数	: TJNTCRP008001f.fnCleanupTreeViewNewItem (Boolean)										*/
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
procedure	TJNTCRP008001f.fnCleanupTreeViewNewItem (fSelected: Boolean);
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

	m_fUnderConstruction	:= FALSE;

	if	(fSelected and (m_cNodePrevSelect <> nil)) then
		m_cNodePrevSelect.Selected	:= TRUE;

	m_fDtlNewRecord	:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCleanupTreeViewNewItemEx ()												*/
//*																									*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理 (ｴｷｽﾄﾗ･ｳﾞｧｰｼﾞｮﾝ)								*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCleanupTreeViewNewItemEx ();
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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnPrintCheckListExtStandard ()													*/
//*																											*/
//*	目的	: 補助登録処理 実在xxxx登録ﾘｽﾄ印刷処理															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnPrintCheckListExtStandard ();
var
	dqMasterData: TMQuery;
	dqCommonData: TMQuery;	//<MLXDEP-3>
	strExCode	: String;
	strFormat	: String;
	sMlxBank	: String;	//<MLXDEP-3>
	sMlxOffice	: String;	//<MLXDEP-3>
begin

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続


	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.Add('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.TStartDate, hm.TEndDate, ');
		SQL.Add('       hm.UpdDateTM, hm.HojyoKbn1, hm.HojyoKbn2, hm.BunCode, fi.FusenKbn,  ');
// <039> MOD-STR
//		SQL.Add('       hm.BankNCode, Bi.AllBkCode, Bi.AllBraCode, Bi.BankName, Bi.BkBraName  ');		// <PRN2>
//<MLXDEP-3>		SQL.Add('       Bi.NCode BankNCode, Bi.AllBkCode, Bi.AllBraCode, Bi.BankName, Bi.BkBraName  ');
//↓<MLXDEP-3>
		if TMSeries.IsMjsLink3 = False then
		begin
			SQL.Add('       Bi.NCode BankNCode, Bi.AllBkCode, Bi.AllBraCode, Bi.BankName, Bi.BkBraName  ');
		end
		else
		begin
			SQL.Add('       hm.BankNCode, Bi.AllBkCode, Bi.AllBraCode, Bi.BankName, Bi.BkBraName , hm.Yobi09 , hm.VFree1 , hm.VFree2 ');
		end;
//↑<MLXDEP-3>
// <039> MOD-END

		SQL.Add('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add('ON     hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
        SQL.Add('LEFT OUTER JOIN BankInfo Bi ');										// <PRN2>
		SQL.Add('ON    (Bi.NCode = hm.BankNCode and Bi.RDelKbn = 0) ');					// <PRN2>
		SQL.Add('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and hm.RDelKbn = 0 ');

        if ( uvHani.pvrRgType[0] = 1 ) then
    		SQL.Add('       And hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');


		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.Add ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.Add ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
    		ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始外部ｺｰﾄﾞ
	    	ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了外部ｺｰﾄﾞ
        end;

		Open ();

		CmnMemDataPrintExtStandard.Active	:= False;
		CmnMemDataPrintExtStandard.Active	:= True;

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

			CmnMemDataPrintExtStandard.FieldByName ('grTag'         ).AsSign (fnGetTagColorBitmap_Grid (GetFld ('FusenKbn').AsInteger));
			CmnMemDataPrintExtStandard.FieldByName ('strExCode'     ).AsString	:= strExCode;
			CmnMemDataPrintExtStandard.FieldByName ('strAssociation').AsString	:= GetFld ('Renso'   ).AsString;
			CmnMemDataPrintExtStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintExtStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;


//			if	(not GetFld ('TStartDate' ).IsNull) then
            if StrToInt(FormatDateTime('yyyymmdd',GetFLD('TStartDate').AsDateTime)) <> DEFDATE_START then
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateStart').AsDateTime := GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldbyName ('dtAppDateStart').Clear;

//			if	(not GetFld ('TEndDate'   ).IsNull) then
            if StrToInt(FormatDateTime('yyyymmdd',GetFLD('TEndDate').AsDateTime)) <> DEFDATE_END then
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldByName ('dtAppDateEnd'  ).Clear;

			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdDateTM').AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldByName ('dtUpdateDate'  ).Clear;

//<MLXDEP-5>
			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDateDisp').AsString	:= DateToStrTmp(GetFld ('UpdDateTM').AsDateTime)
																						 + FormatDateTime(' hh:mm:ss', GetFld ('UpdDateTM').AsDateTime)
			else
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDateDisp').AsString	:= '';
//<MLXDEP-5>

			// <PRN2>
           	if (GetFld ('BankNCode').AsString <> '')
           	AND (GetFld ('BankNCode').AsInteger <> 0) then
            begin
				CmnMemDataPrintExtStandard.FieldByName ('AllBkCd'  ).AsString	:=
    	        	Format('%.4d', [GetFld ('AllBkCode').AsInteger])
        	      + '-'
    	          +	Format('%.3d', [GetFld ('AllBraCode').AsInteger]);
				CmnMemDataPrintExtStandard.FieldByName ('AllBkNm'  ).AsString	:=
    	        	GetFld ('BankName').AsString
        	      + '／'
            	  + GetFld ('BkBraName').AsString;
            end;
			// <PRN2>
			//↓<MLXDEP-3>
			if TMSeries.IsMjsLink3 = True then
			begin
				//予備09が空でない時は全銀協コード欄に何か番号が入っているのでその時のみ名称をセット
				if GetFld ('Yobi09').AsString <> '' then
				begin
					CmnMemDataPrintExtStandardAllBkNm.AsString	:=	GetFld ('VFree1').AsSTring
																	 + '／' +
																	GetFld ('VFree2').AsSTring;
				end
				else
				begin
					CmnMemDataPrintExtStandardAllBkNm.AsString	:= '';
				end;
				CmnMemDataPrintExtStandardAllBkCd.AsString	:= GetFld ('Yobi09').AsString;
			end;
			//↑<MLXDEP-3>

			CmnMemDataPrintExtStandard.Post;
			NEXT;
		end;
		Close ();
	end;

	dqMasterData.Free ();

	//dqCommonData.Free(); //<MLXDEP-3>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnPrintCheckListTtlStandard ()													*/
//*																											*/
//*	目的	: 補助登録処理 合計xxxx登録ﾘｽﾄ印刷処理															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnPrintCheckListTtlStandard ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;

//	b_Start		: Boolean;
//	b_End		: Boolean;
begin
{
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_BANK						  :	CmnReportTtlStandardBnkDBTextCode.Alignment	:= taRightJustify;
		end;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
		case (m_nCurrentMasterDiv) of
			MASTER_BANK						  :	CmnReportTtlStandardBnkDBTextCode.Alignment	:= taLeftJustify;
		end;
	end;
}
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.ADD('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.UpdDateTM ');
//		SQL.ADD(' , hm.RootKbn, ci.ZipCode1, ci.ZipCode2, ci.Address1, fi.FusenKbn ');
		SQL.ADD('FROM   HojyoMA hm ');
//		SQL.ADD ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
		SQL.ADD ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
		SQL.ADD ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn <> 0 and RDelKbn = 0 ');

        if ( uvHani.pvrRgType[0] = 1 ) then
    		SQL.ADD ('and hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');


		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

        if ( uvHani.pvrRgType[0] = 1 ) then
        begin
    		ParamByName ('strExCodeStr'   ).AsString	:= m_strExCodeScopeStr;		// 印刷開始外部ｺｰﾄﾞ
	    	ParamByName ('strExCodeEnd'   ).AsString	:= m_strExCodeScopeEnd;		// 印刷終了外部ｺｰﾄﾞ
        end;

		Open ();

		CmnMemDataPrintTtlStandard.Active	:= False;
		CmnMemDataPrintTtlStandard.Active	:= True;

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
			CmnMemDataPrintTtlStandard.FieldByName ('strAssociation').AsString	:= GetFld ('Renso'   ).AsString;
			CmnMemDataPrintTtlStandard.FieldByName ('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintTtlStandard.FieldByName ('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;

			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').AsDateTime	:= GetFld ('UpdDateTM').AsDateTime
			else
				CmnMemDataPrintTtlStandard.FieldByName ('dtUpdateDate').Clear;

{
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
}

			CmnMemDataPrintTtlStandard.Post;

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnPrintCheckListSystem ()					                                */
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ印刷処理															*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnPrintCheckListSystem ();
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;

begin
{
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
}
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.ADD ('SELECT GCode, Renso, LongName, SimpleName, NCode FROM HojyoMA ');
		SQL.ADD ('WHERE MasterKbn = :nMasterDivision and SumKbn = 1 and RDelKbn = 0 ');
		SQL.ADD ('ORDER BY GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		Open ();

		CmnMemDataPrintSystem.Active	:= False;
		CmnMemDataPrintSystem.Active	:= True;

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
			m_stPrintDstData.strNCode		:= GetFld ('NCode'     ).AsString;
			m_stPrintDstData.strAssociation	:= GetFld ('Renso'     ).AsString;
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
//*	関数	: TJNTCRP008001f.fnPrintCheckListSegBun ()					                                */
//*																									*/
//*	目的	: 補助登録処理 分類セグメントﾘｽﾄ印刷処理															*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP008001f.fnPrintCheckListSegBun ():Boolean;
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;
    i,j			: Integer;
//    tmpLabel	: TppLabel;
//    tmpLabel2	: TppDBText;
    cTxtEdit	: TMTxtEdit;
    cLabel1		: TMLabel;
begin
	// 先に採用の判定
    Result := False;
	for i:=1 to 10 do
	begin
	    for j:=0 to 9 do
	    begin
	    	if i+100 = m_MasterInfoSeg [j].MasterKbn then
	        	Result := True;
	    end;

	    for j:=1 to 10 do
	    begin
			cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [j])));

	    	if i+520 = cTxtEdit.Tag then
	        	Result := True;
	    end;
	end;
    if Result = False then
    begin
	    MjsMessageBox(Self,'分類とセグメントが採用されていません。', mjError, mjDefOk);	//<DSP>
    	Exit;
    end;


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

		SQL.Add   ('WHERE  hm.MasterKbn = 21 and hm.SumKbn = 0 and hm.RDelKbn = 0 ');
        SQL.Add	  ('AND (');
        SQL.Add   (' EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg01, SegMA ');
		SQL.Add   ('  WHERE seg01.MasterKbn = 101 and hm.SegNCode1 = seg01.NCode and seg01.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse1 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg02, SegMA ');
		SQL.Add   ('  WHERE seg02.MasterKbn = 102 and hm.SegNCode2 = seg02.NCode and seg02.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse2 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg03, SegMA ');
		SQL.Add   ('  WHERE seg03.MasterKbn = 103 and hm.SegNCode3 = seg03.NCode and seg03.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse3 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg04, SegMA ');
		SQL.Add   ('  WHERE seg04.MasterKbn = 104 and hm.SegNCode4 = seg04.NCode and seg04.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse4 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg05, SegMA ');
		SQL.Add   ('  WHERE seg05.MasterKbn = 105 and hm.SegNCode5 = seg05.NCode and seg05.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse5 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg06, SegMA ');
		SQL.Add   ('  WHERE seg06.MasterKbn = 106 and hm.SegNCode6 = seg06.NCode and seg06.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse6 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg07, SegMA ');
		SQL.Add   ('  WHERE seg07.MasterKbn = 107 and hm.SegNCode7 = seg07.NCode and seg07.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse7 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg08, SegMA ');
		SQL.Add   ('  WHERE seg08.MasterKbn = 108 and hm.SegNCode8 = seg08.NCode and seg08.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse8 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg09, SegMA ');
		SQL.Add   ('  WHERE seg09.MasterKbn = 109 and hm.SegNCode9 = seg09.NCode and seg09.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse9 = 1 and SegMA.RDelKbn = 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from HojyoMA seg10, SegMA ');
		SQL.Add   ('  WHERE seg10.MasterKbn = 110 and hm.SegNCode10 = seg10.NCode and seg10.RDelKbn = 0 ');
		SQL.Add   ('    AND SegMA.MasterKbn = 21 and SegMA.SegUse10 = 1 and SegMA.RDelKbn = 0 ');
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

		ParamByName ('SetNM01').AsInteger	:= 521;
		ParamByName ('SetNM02').AsInteger	:= 522;
		ParamByName ('SetNM03').AsInteger	:= 523;
		ParamByName ('SetNM04').AsInteger	:= 524;
		ParamByName ('SetNM05').AsInteger	:= 525;
		ParamByName ('SetNM06').AsInteger	:= 526;
		ParamByName ('SetNM07').AsInteger	:= 527;
		ParamByName ('SetNM08').AsInteger	:= 528;
		ParamByName ('SetNM09').AsInteger	:= 529;
		ParamByName ('SetNM10').AsInteger	:= 520;
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
//<006>{
			//if	(not GetFld ('TStartDate' ).IsNull) AND (GetFld ('TStartDate' ).AsDateTime <> DEF_S_DATE) then
            if StrToInt(FormatDateTime('yyyymmdd',GetFLD('TStartDate').AsDateTime)) <> DEFDATE_START then
				CmnMemDataPrintSegBun.FieldByName ('dtStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintSegBun.FieldByName ('dtStart').Clear;

			//if	(not GetFld ('TEndDate'   ).IsNull)  AND (GetFld ('TEndDate' ).AsDateTime <> DEF_E_DATE)then
            if StrToInt(FormatDateTime('yyyymmdd',GetFLD('TEndDate').AsDateTime)) <> DEFDATE_END then
				CmnMemDataPrintSegBun.FieldByName ('dtEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintSegBun.FieldByName ('dtEnd'  ).Clear;
//<006>}
			// セグメント
            for i:=1 to 10 do
            begin
				strExCode	:= GetFld ('seg' + Format('%.2d',[i]) + 'Code').AsString;
                if strExCode = '' then							// 未設定
                	continue;

	            for j:=0 to 9 do
    	        begin
                	if i+100 = m_MasterInfoSeg [j].MasterKbn then
                    	break;
                end;

                if j > 9 then	// 採用なし
                	continue;

				if	(m_MasterInfoSeg [j].CodeAttr <= 1) then
				begin
					case (m_MasterInfoSeg [j].CodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_MasterInfoSeg [j].CodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_MasterInfoSeg [j].CodeDigit) + 'd';
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
            		cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [j])));
		            cLabel1  := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnLabelBun%.2d%.', [j])));

                	if i+520 = cTxtEdit.Tag then
                    	break;
                end;

                if j > 10 then	// 採用なし
                	continue;

				if	(cTxtEdit.InputAttr <> iaNone) then
				begin
					case (cTxtEdit.InputAttr) of
						iaZeroSup:	strFormat	:= '%'  + IntToStr (cTxtEdit.Maxlength) + 'd';
						iaZeroPad:	strFormat	:= '%.' + IntToStr (cTxtEdit.Maxlength) + 'd';
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
//*	関数	: TJNTCRP008001f.fnPrintCheckListExtDetails ()				                            */
//*																									*/
//*	目的	: 補助登録処理 実在xxxx登録ﾘｽﾄ(詳細)印刷処理											*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnPrintCheckListExtDetails ();
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
		SQL.Add   ('SELECT * FROM HojyoMA hm ');
		SQL.Add   ('LEFT OUTER JOIN CSInfo ci     ON hm.MasterKbn = ci.MasterKbn and hm.GCode = ci.GCode ');
		SQL.Add   ('LEFT OUTER JOIN MFusenInfo fi ON hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
		SQL.Add   ('WHERE hm.MasterKbn = :nMasterDivision AND hm.SumKbn = 0 AND hm.RDelKbn = 0 AND ');
		SQL.Add   ('      hm.GCode >= :strExCodeStr and hm.GCode <= :strExCodeEnd ');

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY hm.RenChar, hm.GCode');

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
			CmnMemDataPrintExtDetailsCst.FieldByName ('grTag'                 ).AsSign (fnGetTagColorBitmap_Grid (GetFld ('FusenKbn').AsInteger));
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


	dqMasterData.Free ();
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnSetSystemRecords ()														*/
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ印刷用ﾚｺｰﾄﾞｾｯﾄ処理												*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP008001f.fnSetSystemRecords ();
var
	dqMasterData: TMQuery;
	nRecords	: Integer;
	strExCode	: String;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	nRecords	:= 0;

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear;
		SQL.Add('SELECT hm.GCode, hm.SimpleName FROM HojyoTree ht, HojyoMA hm ');
		SQL.Add('WHERE  ht.MasterKbn=:nMasterKbn AND hm.Masterkbn=ht.MasterKbn AND');
		SQL.Add('       hm.RDelKbn=0 AND hm.NCode = ht.BasedNCode');
        //SQL.Add('and ht.SumNCode=(SELECT hm2.NCode FROM HojyoMA AS hm2 WHERE hm2.GCode=:sGCodeDst ');
		//SQL.Add('And hm2.RDelKbn = 0 ) ');
        SQL.Add('and ht.SumNCode=:sNCodeDst ');
		SQL.Add('ORDER BY EntNo');

		strExCode	:= m_stPrintDstData.strExCode;

		if	(m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		//ParamByName ('sGCodeDst' ).AsString     := strExCode;
		ParamByName ('sNCodeDst' ).AsString     := m_stPrintDstData.strNCode;

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
		CmnMemDataPrintSystem.FieldByName('strExCodeDst'    ).AsString	:= m_stPrintDstData.strExCode;
		CmnMemDataPrintSystem.FieldByName('strNameSimpleDst').AsString	:= m_stPrintDstData.strNameSimple;
		CmnMemDataPrintSystem.Post;
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnSetSystemRecord (TMQuery)												*/
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
procedure	TJNTCRP008001f.fnSetSystemRecord (dqMasterData: TMQuery);
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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCmnReportSystemppDBTextExCodeDstOnPrint (TObject)						*/
//*																									*/
//*	目的	: 補助登録処理 体系ﾘｽﾄ OnPrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnReportSystemppDBTextExCodeDstOnPrint (Sender: TObject);
var
	cDBTextExCode: TppDBText;
	strExCode    : String;

begin
	cDBTextExCode	:= Sender as TppDBText;
	strExCode		:= cDBTextExCode.Text;

//	CmnReportSystemLineDetailsBottom.Visible	:= False;

//	if	(strExCode = m_strExCodePrint) then
	if	(CompareStr (strExCode, m_strExCodePrint) = 0) then
	begin
		cDBTextExCode.Visible	:= False;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= False;
		CmnReportSystemLineDetailsTop     .Visible	:= False;
	end
	else
    begin
		cDBTextExCode.Visible	:= True;

		CmnReportSystemDBTextNameSimpleDst.Visible	:= True;

		if	(m_strExCodePrint = '') then
			CmnReportSystemLineDetailsTop.Visible	:= False
		else
			CmnReportSystemLineDetailsTop.Visible	:= True;

		m_strExCodePrint	:= strExCode;
	end;
end;


procedure	TJNTCRP008001f.fnCmnReportSystemOnEndPage (Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCheckRequisiteItem (Integer, Integer, Integer)								*/
//*																											*/
//*	目的	: 補助登録処理 諸口ﾁｪｯｸ																			*/
//*																											*/
//*	戻り値	: Integer,																						*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分																	*/
//*			  nCodeDigit		= ｺｰﾄﾞ桁数																	*/
//*			  nCodeAttribute	= ｺｰﾄﾞ属性																	*/
//*                                                     		                                            */
//***********************************************************************************************************/
function	TJNTCRP008001f.fnCheckRequisiteItem (nMasterDivision: Integer; nCodeDigit: Integer;
                                                 nCodeAttribute: Integer): Integer;
var
	cDlgRequisite   : TJNTCRP0080012f;  // 諸口ﾀﾞｲｱﾛｸﾞ
	dqMasterData    : TMQuery;
    dqMasterData_P  : TMQuery;          // <015>
	nReturn		    : Integer;
	fNoRecord       : Boolean;
    iMastKbn        : Integer;          // <015>
    nPNCode         : Extended;         // <015>
    bRet            : Boolean;          // <015>
begin

	fNoRecord	:= TRUE;
	nReturn		:= REQUISITE_OK;

	dqMasterData := TMQuery.Create ( Self);
	m_cDataModule.SetDBInfoToQuery ( m_cDBSelect, dqMasterData );

	with dqMasterData do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT * FROM HojyoMA          ');
        SQL.Add('WHERE MasterKbn   = :pMstKbn   ');
        SQL.Add('  AND SyokuchiKbn = 1          ');
        SQL.Add('  AND RDelKbn     = 0          ');
		ParamByName('pMstKbn').AsInteger := nMasterDivision;

        if ( Open() = false ) then
        begin
            // SQLｴﾗｰ
            m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, dqMasterData );
            with m_cErrorMsgRec do
                MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
            Result := REQUISITE_EXIT;
            Exit;
        end;

        // 既に諸口ﾃﾞｰﾀが登録済みの場合、諸口登録DLGは表示しない
		if ( not EOF ) then
        begin
			fNoRecord := FALSE;
        end;

//↓<MLXDEP-2>MLXは諸口を使用しない。
		if TMSeries.IsMjsLink3 = True then
		begin
			fNoRecord := FALSE;
		end;
//↑<MLXDEP-2>
		Close ();
    end;

	if ( fNoRecord = TRUE ) then
	begin
		if ( giReferFlag = REFER ) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= REQUISITE_EXIT;
			Exit;
		end;

        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理 <015>
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
                m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, dqMasterData );
                with m_cErrorMsgRec do
                    MjsMessageBoxEx (Self, sMsg, sTitle, icontype, btntype, btndef, false);
                Result := REQUISITE_EXIT;
                Abort;
            end;

            // 親会社DBに「諸口」が存在していた場合は、諸口ﾏｽﾀ同期処理を行う
            if ( not dqMasterData.Eof ) then
            begin
                iMastKbn := dqMasterData.GetFld('MasterKbn').AsInteger;
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
                    m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, dqMasterData );
                    with m_cErrorMsgRec do
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

                    // <027> - ST
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
                        // SQLｴﾗｰ
                        m_cComArea.m_MsgStd.GetMsgDB ( m_cErrorMsgRec, dqMasterData );
                        with m_cErrorMsgRec do
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
                    // <027> - ED
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
        // ↑↑↑<015>
        // -------------------------------------------------------------------------

        // -------------------------------------------------------------------------
        //      諸口ﾀﾞｲｱﾛｸﾞの表示
        // -------------------------------------------------------------------------
		cDlgRequisite	:= TJNTCRP0080012f.fnCreateDialog(Pointer (m_pRec),
                                                          Self,
                                                          m_cDBSelect,
                                                          nMasterDivision,
								                          nCodeDigit,
                                                          nCodeAttribute,
                                                          m_strValidCharacters,
                                                          @m_SyncMaster); // <015>

		if ( cDlgRequisite.ShowModal () = mrCancel ) then
        begin
			nReturn	:= REQUISITE_CANCEL
        end
		else
        begin
			m_bHojyoTree2 [nMasterDivision - MASTER_BANK]	:= 1;
            m_NewRecord := True;
        end;

		cDlgRequisite.Close ();
		cDlgRequisite.Free  ();
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result := nReturn;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCheckCommonDetailScreenValue (Integer)								*/
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
function	TJNTCRP008001f.fnCheckCommonDetailScreenValue (nDivision: Integer): Boolean;
var
	strErrorMessage: String;
    fReturn		   : Boolean;

begin
	CmnStatusBar.SimpleText	:= '';

	strErrorMessage	:= '';
	fReturn			:= True;

	case (nDivision) of
		0:	begin
				if	(Trunc (DtlCmnEditExCodeNumeric.Value) = 0) then
				begin
					strErrorMessage	:= 'コードを正しく入力してください。';
					fReturn			:= False;
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
						fReturn			:= False;
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
						fReturn			:= False;
					end;

					if	(fReturn) then
					begin
//						if	(DtlCmnEditAppDateEnd.Value < DtlCmnEditAppDateStart.Value) then		// <#NGEN>
						if	(DtlCmnEditAppDateEnd.AsIntYM < DtlCmnEditAppDateStart.AsIntYM) then	// <#NGEN>
						begin
							strErrorMessage	:= '適用終了年月日は開始年月日以降でなければなりません。';
							fReturn			:= False;
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
//*	関数	: TJNTCRP008001f.fnChangeToolbarButtonsCondition (TTreeNode)										*/
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
procedure	TJNTCRP008001f.fnChangeToolbarButtonsCondition (cNodeTarget: TTreeNode);
var
	cNodeWork  : TTreeNode;
	stRecTarget: ^TreeViewRec;

begin
	stRecTarget	:= cNodeTarget.Data;

	if	(stRecTarget^.nDivision = 9) then												// 体系
	begin
		B_Details.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
        fnEnableToolbarButtonTag(false);
	end
	else if	(stRecTarget^.nDivision = DIVISION_GENERAL) then							// 諸口
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			B_Details.Enabled	:= TRUE
		else
			B_Details.Enabled	:= FALSE;

		if	(fnCheckPermitGeneralRecDelete ()) then
		begin
//			if	(giReferFlag <> REFER) then												// 参照以外		HIS0005
// <035> MOD-STR
//		        B_Delete.Enabled	:= m_cJNTArea.IsDelete;
		        B_Delete.Enabled	:= m_IsDelete;
// <035> MOD-END
		end
		else
			B_Delete.Enabled	:= FALSE;

		fnEnableToolbarButtonTag (m_cJNTArea.IsFusen);

        // 諸口は全銀行の編集禁止
        fnCmnBankEnabled (False);

	end
	else if	(stRecTarget^.nDivision = DIVISION_NEWRECORD) then							// 新規作成
	begin
		B_Details.Enabled	:= FALSE;
		B_Delete.Enabled	:= FALSE;
        fnEnableToolbarButtonTag(false);

	end
	else
	begin
		if	(giReferFlag <> BASICONLY) then												// 基本のみ以外	HIS0005
			B_Details.Enabled	:= TRUE
		else
			B_Details.Enabled	:= FALSE;

//		if	(giReferFlag <> REFER) then													// 参照以外		HIS0005
//		begin
// <035> MOD-STR
//		    B_Delete.Enabled	:= m_cJNTArea.IsDelete;
		    B_Delete.Enabled	:= m_IsDelete;
// <035> MOD-END
			fnEnableToolbarButtonTag (m_cJNTArea.IsFusen);
//		end;
	end;

	if	(B_Delete.Enabled) then
	begin
		cNodeWork	:= cNodeTarget.GetFirstChild ();
        fnCmnBankEnabled (True);

		if	(cNodeWork <> nil) then
			B_Delete.Enabled	:= FALSE;
	end;

    B_RowChange.Enabled := m_IsUpdate;      // <016><019>
    B_Search   .Enabled := True;            // <016>
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnSetDeleteButtonCondition ()														*/
//*																											*/
//*	目的	: 共通補助登録処理																				*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnSetDeleteButtonCondition ();
var
	dqMasterTree: TMQuery;
	dqMasterData: TMQuery;
	strExCode   : String;
//	iLoop		: Integer;         //*Test* コメント解除
//	stRecTarget : ^TreeViewRec;    //*Test* コメント解除
    strName     : String;
    lvNCode     : Extended;

begin
	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
		strExCode	:= StdCmnGridExist.DataSource.DataSet.FieldByName ('strExCode').AsString
	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then
		strExCode	:= StdCmnGridTotal.DataSource.DataSet.FieldByName ('strExCode').AsString
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
	end
	else
		Exit;

	if	(Trim (strExCode) = '') then
	begin
		B_Details.Enabled	:= FALSE;
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

		//HIS0030
		SQL.Add   ('SELECT ');

		SQL.Add   ('NCode, SumKbn,SyokuchiKbn FROM HojyoMA ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
		begin
			if	(FieldByName ('SyokuchiKbn').AsInteger = 1) then
			begin
             // 諸口は全銀行変更不可
                fnCmnBankEnabled(False);

				if	(fnCheckPermitGeneralRecDelete ()) then
				begin
//					if	(giReferFlag <> REFER) then										// 参照以外	HIS0002
// <035> MOD-STR
//		                B_Delete.Enabled	:= m_cJNTArea.IsDelete;
		                B_Delete.Enabled	:= m_IsDelete;
// <035> MOD-END
				end
				else
					B_Delete.Enabled	:= FALSE;
			end
			else
			begin
            // 諸口以外は全銀協変更可能
                fnCmnBankEnabled(True);

//				if	(giReferFlag <> REFER) then		   aaaa								// 参照以外	HIS0002
// <035> MOD-STR
//		            B_Delete.Enabled	:= m_cJNTArea.IsDelete;
		            B_Delete.Enabled	:= m_IsDelete;
// <035> MOD-END

			end;

			if	(B_Delete.Enabled and (FieldByName ('SumKbn').AsInteger = 1)) then
			begin

                fnGetHojyoMA(MASTER_BANK,strExCode,strName,lvNCode);

				with (dqMasterTree) do
				begin

					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT BasedNCode FROM HojyoTree ');
					SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumNCode = :strExCode');

					ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//					ParamByName ('strExCode'      ).AsString	:= strExCode;
					ParamByName ('strExCode'      ).AsFloat 	:= lvNCode;

					Open ();

					if	(not EOF) then
						B_Delete.Enabled	:= FALSE;

					Close ();
				end;
			end;
		end
		else
        begin
            // 新規ﾚｺｰﾄﾞ
			B_Delete.Enabled	:= FALSE;
            fnCmnBankEnabled(True);
        end;
		Close ();
// *Test* コメント解除 Start
{//--------------------------------------------------------------Y.Ichihashi
		//GridでSelectされているものをTreeでもSelectされるようにする
		for iLoop := 0 to CmnTreeView.Items.Count-1 do
		begin
        	stRecTarget	:= CmnTreeView.Items[iLoop].Data;

			if stRecTarget^.strExCode = strExCode then
            	CmnTreeView.Items[iLoop].Selected	:= True;
		end;
//--------------------------------------------------------------}
// *Test* コメント解除 End
    end;

	dqMasterTree.Close ();
	dqMasterData.Close ();
	dqMasterTree.Free  ();
	dqMasterData.Free  ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnStdCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 補助登録処理 一覧ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ											        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
//*	関数	: TJNTCRP008001f.fnDtlCmnTabOnChange (TObject)									            */
//*																									*/
//*	目的	: 補助登録処理 詳細画面ﾀﾌﾞ OnChange ｲﾍﾞﾝﾄ										        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnTabOnChange (Sender: TObject);
var
//	stNewRec    : ^TreeViewRec;
	cNode	    : TTreeNode;
	cTabItem    : TMTabItems;
	nSumDivision: Integer;

begin
    nSumDivision := 0;

	cTabItem	 := Sender as TMTabItems;

	if	(not m_fAccessTab) then
		Exit;

	if	(m_fDtlNewRecord) then
	begin
		fnCleanupTreeViewNewItemEx ();

		m_fChangeDetails	:= FALSE;

		//Exit; //<008>
	end;

	//nSumDivision	:= Trunc (DtlCmnEditSumDivision.Value); //<008>

	if	(nSumDivision = 0) then
		nSumDivision	:= 1
	else
		nSumDivision	:= 0;

	//HIS0030
{	if (m_nCurrentMasterDiv = 25) and (rcCOMMONAREA(m_pRec^.m_pCommonArea^).ObjectFlg = 1) then
	begin
		if nSumDivision = 1 then
		begin
			BumonCodeName.Visible	:= False;
			BumonName.Visible		:= False;
			TxtBumonCode.Visible	:= False;
           	NumBumonCode.Visible	:= False;
		end
		else if m_BumonUseKbn <> 0 then
		begin
			BumonCodeName.Visible	:= True;
			BumonName.Visible		:= True;

			if m_BumonCodeAttr <= 1 then
			begin
				TxtBumonCode.Visible	:= False;
    	       	NumBumonCode.Visible	:= True;
			end
			else
			begin
				TxtBumonCode.Visible	:= True;
    	       	NumBumonCode.Visible	:= False;
			end;
		end;
	end;
}
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

//		m_fDtlNewRecord		:= TRUE;    //<008>

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
//*	関数	: TJNTCRP008001f.fnDtlCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 補助登録処理 詳細画面ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ										        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
//*	関数	: TJNTCRP008001f.fnStdCmnPopupMenuOnPopup (TObject)							            */
//*																									*/
//*	目的	: 補助登録処理 ｸﾞﾘｯﾄﾞ用ﾎﾟｯﾌﾟｱｯﾌﾟ･ﾒﾆｭｰ OnPopup ｲﾍﾞﾝﾄ								        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridPopupMenuOnPopup (Sender: TObject);
var
	strExCode	: String;
    cNCode      : Currency;
	nTagDivision: Integer;

begin
	strExCode	:= '';
    cNCode      :=  0;

	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
	begin
		if StdCmnMemDataExist.RecordCount <> 0 then										// HIS0016
		begin
            cNCode  :=  StdCmnMemDataExist.FieldByName('cNCode').AsCurrency;
			if  (m_nCurrentCodeAttr <= 1) then
			begin
				if	(StdCmnMemDataExist.FieldByName ('strExCode').AsString <> '') then
					strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
			end
			else
				strExCode	:= StdCmnMemDataExist.FieldByName ('strExCode').AsString;
		end;
	end
	else																				// 合計ｸﾞﾘｯﾄﾞ
	begin
		if StdCmnMemDataTotal.RecordCount <> 0 then 									// HIS0016
		begin
            cNCode  :=  StdCmnMemDataTotal.FieldByName('cNCode').AsCurrency;
			if  (m_nCurrentCodeAttr <= 1) then
			begin
                if ( StdCmnMemDataTotal.FieldByName ('strExCode').AsString <> '' ) then // <021>
    				strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
			end
			else
				strExCode	:= StdCmnMemDataTotal.FieldByName ('strExCode').AsString;
		end;
	end;


	StdCmnGridPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;

	if	(strExCode <> '') then
	begin
		StdCmnGridPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
		StdCmnGridPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
		StdCmnGridPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
		StdCmnGridPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

		nTagDivision	:= fnGetMasterDataTagInfo (cNCode);

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

		StdCmnGridPopupMenuTag01.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag02.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag03.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag04.Enabled	:= FALSE;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnSetGridTagInfo (Integer)												*/
//*																									*/
//*	目的	: 補助登録処理									                                 		*/
//*																									*/
//*	戻り値	: なし,                                                 		                        */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nTagKind	= 付箋種類 (0:なし, 1:赤, 2:青, 3:緑, 4:橙)									*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnSetGridTagInfo (nTagKind: Integer);
var
	strExCode	: String;
	nDivision	: Integer;
	nTagKindWork: Integer;
    cNCode      : Currency;
begin
	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
	begin
		if	(Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString) = '') then
			Exit;

		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
		else
			strExCode	:= StdCmnMemDataExist.FieldByName ('strExCode').AsString;

        cNCode      :=  StdCmnMemDataExist.FieldByName('cNCode').AsCurrency;
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

        cNCode      :=  StdCmnMemDataTotal.FieldByName('cNCode').AsCurrency;
		nDivision	:= 1;
	end;

	if	(fnUpdateMasterDataTagInfo(cNCode, nTagKind)) then
		nTagKindWork	:= nTagKind
	else
		nTagKindWork	:= 0;

	fnUpdateGridMemDataRecord(nDivision, strExCode, nTagKindWork);
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnGetClassDescription (Integer)											*/
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
function	TJNTCRP008001f.fnGetClassDescription (nClassCode: Integer): String;
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
//*	関数	: TJNTCRP008001f.fnGetRespectDescription (Integer)											*/
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
function	TJNTCRP008001f.fnGetRespectDescription (nRespectDivision: Integer): String;
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
//*	関数	: TJNTCRP008001f.fnGetTaxRateDescription (Integer)											*/
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
function	TJNTCRP008001f.fnGetTaxRateDescription (nTaxRateCode: Integer): String;
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
//*	関数	: TJNTCRP008001f.fnChangeSelectionScreen ()												*/
//*																									*/
//*	目的	: 補助登録処理																			*/
//*																									*/
//*	戻り値	: Boolen,																				*/
//*																									*/
//***************************************************************************************************/
function TJNTCRP008001f.fnChangeSelectionScreen (): Boolean;
var
	dqMasterData   : TMQuery;
//	cDialogAdopt    :   TJNTCRP018003f;
    stItemRec	   : ^TreeViewRec;
	nMasterDivision: Integer;
	nCodeDigit     : Integer;
	nCodeAttribute : Integer;
	nNameLength	   : Integer;
	nCount		   : Integer;
	nReturn		   : Integer;
	strFormat	   : String;
	strItemName	   : String;
// <015>	fDialogAdopt    :   Boolean;
begin

    // -------------------------------------------------------------------------
    //  ｸﾞﾙｰﾌﾟ管理処理 <015>
    //
    //  親子間の採用区分、ｺｰﾄﾞ属性、桁数の整合性ﾁｪｯｸを行う
    // -------------------------------------------------------------------------
    if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
    begin
        case m_SyncMaster.fnChkP_MasterInfo
            (m_stSelectItem [m_ComBox].nMasterDivision) of
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
                    Exit;
                end;
            // 属性・桁数違う
            JNTSYNC_RET_MASCHK_DIFF_C:
                begin
                    MjsMessageBoxEx(Self, JNTSYNC_MSG_DIFF_C,
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Result := false;
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
            Abort;
        end;

        // 子会社DBに対してｺﾐｯﾄを実行する
        m_cDataModule.Commit ( m_cDBSelect );
    end;
    // ↑↑↑<015>
    // -------------------------------------------------------------------------

(*
	if ( m_stSelectItem[m_ComBox].nMasterDivision = m_nCurrentMasterDiv ) then
	begin
        // 部署の時
		if ( m_DataKbn = 3 ) then
		begin
			if ( CmnTreeView.Items.Count = 0 ) then
			begin
				stMessageRec.sMsg	:= '経理側で「諸口マスタ」が未登録のため部署側でのマスタ登録は行えません。';
          		stMessageRec.sTitle	:= '登録';

           		MjsMessageBoxEx (Self,
                                 stMessageRec.sMsg,
                                 stMessageRec.sTitle,
                                 stMessageRec.icontype,
                                 mjOk,
                                 stMessageRec.btndef,
                                 FALSE);
             	P_ComBox.SetFocus;
			end;
		end;

		Result	:= TRUE;
		Exit;
	end;

	dqMasterData := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	// 部署の時
	if ( m_DataKbn = 3 ) then
	begin
		with dqMasterData do
		begin
			// 諸口が存在するかﾁｪｯｸ
        	Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM HojyoMA WHERE MasterKbn = :nMasterKbn ');
			SQL.Add('AND NCode = 0 AND RDelKbn= 0 ');
			ParamByName('nMasterKbn').AsInteger	:= m_stSelectItem [m_ComBox].nMasterDivision;
			if ( Open = False ) then
			begin
				Close;
				Free;
                Result := FALSE;
				Exit;
			end;

			// 諸口が存在しない場合はﾒｯｾｰｼﾞを表示してﾌｫｰｶｽをｺﾝﾎﾞﾎﾞｯｸｽに戻す
			if Eof then
			begin
              	stMessageRec.sMsg	:= '経理側で「諸口マスタ」が未登録のため部署側でのマスタ登録は行えません。';
          		stMessageRec.sTitle	:= '登録';

           		MjsMessageBoxEx (Self,
                                 stMessageRec.sMsg,
                                 stMessageRec.sTitle,
                                 stMessageRec.icontype,
                                 mjOk,
                                 stMessageRec.btndef,
                                 FALSE);

				StdCmnMemDataExist.Close();
              	StdCmnMemDataTotal.Close();

				for nCount := 1 to CmnTreeView.Items.Count do
				begin
					stItemRec	:= CmnTreeView.Items [CmnTreeView.Items.Count - 1].Data;

					Dispose (stItemRec);
               		CmnTreeView.Items [CmnTreeView.Items.Count - 1].Delete;
				end;

				m_nCurrentMasterDiv	:= m_stSelectItem [m_ComBox].nMasterDivision;
             	P_ComBox.SetFocus;
                Result := False;
				Exit;
			end;
		end;
	end;
*)
// ↑↑↑<015>

    dqMasterData := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    nMasterDivision	:= m_stSelectItem [m_ComBox].nMasterDivision;

(*
    fDialogAdopt := True;

	with dqMasterData do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT MasterKbn FROM HojyoMA ');
		SQL.Add('WHERE  MasterKbn = :nMasterKbn AND RDelKbn = 0');
		ParamByName ('nMasterKbn').AsInteger := nMasterDivision;
		Open();

		if ( not EOF ) then
			fDialogAdopt := FALSE;
	end;
*) // <015>

// ﾒｰﾙ会計によって通常処理・基本のみ設定・参照を切り替える
// (NORMAL:通常処理,BASICONLY:基本のみ設定可能,REFER:参照のみ)
(*
	nRetID	:=	MailEntCheck (m_cDBSelect, m_cDataModule, m_cComArea, nMasterDivision, 1);

	case (nRetID) of
		DISPOSE_SETTLE    :	giReferFlag	:= REFER;		// 決算確定の為参照のみ
		DISPOSE_MAILNOTUSE:	giReferFlag	:= NORMAL;		// ﾒｰﾙ未採用の為通常処理
		DISPOSE_USUALLY   :	giReferFlag	:= NORMAL;		// 通常処理
		DISPOSE_BASIC     :	giReferFlag	:= BASICONLY;	// 基本のみ設定可能
		DISPOSE_REFER     :	giReferFlag	:= REFER;		// 参照のみ
	end;
*)
//    giReferFlag	:= NORMAL;

(*
    // 採用ﾀﾞｲｱﾛｸﾞ
	if ( fDialogAdopt ) then
	begin
		if ( giReferFlag = REFER ) then
		begin
			if	(m_nCurrentMasterDiv <> 0) then
			begin
				for nCount := 1 to 8 do
				begin
					if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
						break;
				end;

				P_ComBox.ItemIndex	:= nCount - 1;
			end
			else
				P_ComBox.ItemIndex	:= 0;

			dqMasterData.Close();
			dqMasterData.Free();

			Result := FALSE;
			Exit;
		end;

        // -----------------------------------
        //  採用情報ダイアログの表示
        // -----------------------------------
		cDialogAdopt	:= TJNTCRP0080013f.fnCreateDialog(Pointer(m_pRec),
                                                            Self,
                                                            m_cDataModule,
                                                            m_cDBSelect,
                                                            nMasterDivision);

        // ｷｬﾝｾﾙ時
		if ( cDialogAdopt.ShowModal () = mrCancel ) then
		begin
			Result	:= FALSE;

			if ( m_nCurrentMasterDiv <> 0 ) then
			begin
				for nCount := 1 to 8 do
				begin
					if ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
						break;
				end;

				P_ComBox.ItemIndex	:= nCount - 1;
			end
			else
				P_ComBox.ItemIndex	:= 0;

			dqMasterData.Free();
			Exit;
		end;

        // 桁数,属性の取得
		m_stSelectItem [m_ComBox].nAdoptDivision	:= 1;
		m_stSelectItem [m_ComBox].nCodeDigit		:= cDialogAdopt.m_nCodeDigit;
		m_stSelectItem [m_ComBox].nCodeAttribute	:= cDialogAdopt.m_nCodeAttribute;
	end;
*)

	nCodeDigit		:= m_stSelectItem [m_ComBox].nCodeDigit;
	nCodeAttribute	:= m_stSelectItem [m_ComBox].nCodeAttribute;

    if ( giReferFlag <> REFER ) then
    begin
        // 諸口ﾃﾞｰﾀの存在ﾁｪｯｸ
    	nReturn	:= fnCheckRequisiteItem (nMasterDivision, nCodeDigit, nCodeAttribute);

    	if	(( nReturn = REQUISITE_CANCEL )  or
//           ( nReturn = REQUISITE_EXIT   )) then
             ( nReturn = REQUISITE_EXIT   )) and
             ( not (TMSeries.IsMjsLink3)) then   	 //<MLXDEP>
    	begin
    		dqMasterData.Close ();
    		dqMasterData.Free  ();

    		Result	:= FALSE;
    		Exit;
    	end;
    end;

	m_nCurrentMasterDiv	:= nMasterDivision;
	m_nCurrentCodeDigit	:= nCodeDigit;
	m_nCurrentCodeAttr	:= nCodeAttribute;

    // 実在,合計用ﾒﾑﾃﾞｰﾀをOpenする
	StdCmnMemDataExist.Close ();
	StdCmnMemDataTotal.Close ();
	StdCmnMemDataExist.Open  ();
	StdCmnMemDataTotal.Open  ();

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

    if ( m_nCurrentMasterDiv = MASTER_BANK ) then
        nNameLength	:= LENGTH_NAME_BANK;

	StdCmnGridExistName   .MaxLength	:= nNameLength;
	StdCmnGridTotalName   .MaxLength	:= nNameLength;
	DtlCmnEditName        .MaxLength	:= nNameLength;
	StdCmnMemDataExistName.DisplayWidth	:= nNameLength;
	StdCmnMemDataExistName.DisplayWidth	:= nNameLength;

	StdCmnGridExist.Bands [6].Visible	:= FALSE;
	StdCmnGridExist.Bands [7].Visible	:= FALSE;

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

	for nCount := 1 to 8 do
	begin
		if  ( m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv ) then
		begin
			strItemName := m_stSelectItem [nCount].strItemCaption;
			Break;
		end;
	end;

	DtlCmnLabelExCodeTitle      .Caption	:= strItemName + 'コード';

    CmnTreeView           .Enabled	:= TRUE;
    CmnSplitter           .Enabled	:= TRUE;
	BPrint                .Enabled	:= TRUE;
    StdCmnClientPanel     .Enabled	:= TRUE;
    DtlCmnClientPanel     .Enabled	:= TRUE;

	StdCmnTab.Items [0].Selected	:= TRUE;
	StdCmnTab.Items [1].Selected	:= FALSE;

	DtlCmnClientPanel.Visible		:= FALSE;
	StdCmnClientPanel.Visible		:= TRUE;

    DtlCmnEditBankCode.FormatStr    := StringOfChar ('0', 4);
    DtlCmnEditBrCode  .FormatStr    := StringOfChar ('0', 3);

	B_Details.Caption	:= '詳細(&T)';

	Prog1.Visible		:= True;	//HIS0034

	fnRebuildTreeViewItems ();
	fnSetParentItemsInfo   ();

	dqMasterData.Free ();

	fnPartsControl(giReferFlag);

	Prog1.Visible		:= False;	//HIS0034

	Result	:= TRUE;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnCheckPermitGeneralRecDelete ()											*/
//*																									*/
//*	目的	: 補助登録処理 諸口補助ﾚｺｰﾄﾞ削除ﾁｪｯｸ													*/
//*																									*/
//*	戻り値	: Boolean, (TRUE:削除可能, FALSE:削除不可能)				                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP008001f.fnCheckPermitGeneralRecDelete (): Boolean;
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
		SQL.Add ('SELECT GCode FROM HojyoMA ');
//		SQL.Add ('WHERE  MasterKbn=:nMasterKbn AND RDelKbn=0 AND (NCode <> 0 OR NCode IS NULL)');
		SQL.Add ('WHERE  MasterKbn=:nMasterKbn AND RDelKbn=0 AND SyokuchiKbn = 0 ');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;

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


procedure	TJNTCRP008001f.fnJNTCRP008001fOnPaint (Sender: TObject);
begin
	if	(m_fComboBoxListDraw) then
	begin
		m_fComboBoxListDraw	:= FALSE;
{
		if	(P_ComBox.Items.Count = 1) then
		begin
			if	(fnChangeSelectionScreen ()) then
			begin
				m_cACControl	:= CmnTreeView;
				m_cACControl.SetFocus ();
			end;
		end
		else
			P_ComBox.DroppedDown	:= TRUE;
}

//<MLXDEP>
		if (TMSeries.IsMjsLink3) then
		    m_cACControl	:=  StdCmnGridExist
		else
		    m_cACControl	:=  CmnTreeView;
	    //m_cACControl	:=  CmnTreeView;
//<MLXDEP>

        if m_cACControl. Enabled = false then
            m_cACControl := P_ComBox;

   		m_cACControl.SetFocus ();

	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnUpdateGridMemDataRecord (Integer; String; Integer)						*/
//*																									*/
//*	目的	: 補助登録処理 																			*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)											*/
//*			  strExCode	= 部門ｺｰﾄﾞ																	*/
//*			  nTagKind	= 付箋種類 (0:なし, 1:赤, 2:青...)											*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP008001f.fnUpdateGridMemDataRecord (nDivision: Integer; strExCode: String; nTagKind: Integer);
var
	cMemData	 : TdxMemData;
	strExCodeWork: String;
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
//		cMemData.FieldByName ('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
		cMemData.FieldByName ('grTag').AsSign (fnGetTagColorBitmap_Grid(nTagKind));

	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnMoveGridRecordSelecter (Integer; String)										*/
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
procedure	TJNTCRP008001f.fnMoveGridRecordSelecter (nDivision: Integer; strExCode: String);
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
//*	関数	: TJNTCRP008001f.fnChangeComponentState (Integer)											*/
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
procedure	TJNTCRP008001f.fnChangeComponentState (nSumDivision: Integer);
begin
	case (nSumDivision) of
		0:	begin
//<MLXDEP>↓
//				fnChangeComponentStateCmn (TRUE);                          	// 実在/合計区分: 0=実在
				if (TMSeries.IsMjsLink3) then
					fnChangeComponentStateCmn (FALSE)
				else
					fnChangeComponentStateCmn (TRUE);
//<MLXDEP>↑
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
//*	関数	: TJNTCRP008001f.fnChangeComponentStateCmn (Boolean)										*/
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
procedure	TJNTCRP008001f.fnChangeComponentStateCmn (fEnabled: Boolean);
begin
	DtlCmnEditAppDateStart   .Visible	:= fEnabled;
	DtlCmnEditAppDateEnd     .Visible	:= fEnabled;
	DtlCmnLabelAppDateTitle  .Visible	:= fEnabled;
	DtlCmnLabelAppDateAddtion.Visible	:= fEnabled;

    DtlCmnEditBankCode       .Visible   := fEnabled;
    DtlCmnEditBrCode         .Visible   := fEnabled;
    DtlCmnLabelZengin        .Visible   := fEnabled;
    DtlCmnLabelZenginName    .Visible   := fEnabled;

    DtlSegScrBox             .Visible   := fEnabled;
    DtlBumonScrBox           .Visible   := fEnabled;
    DtlCmnLabelBunrui        .Visible   := fEnabled;
    DtlCmnLabelSegment       .Visible   := fEnabled;

    MLabel2                  .Visible   := fEnabled;            //<012>



    fnCmnBankEnabled(fEnabled); //<007>
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP008001f.fnChangeComponentStateInd (Integer)										*/
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
procedure	TJNTCRP008001f.fnChangeComponentStateInd (nSumDivision: Integer);
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

//************************************************************************
//*		Component		:	ppDetailBand_StandardBnk ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP008001f.ppDetailBand_StandardBnkBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardBnk.LastRecord) or
		(ppDetailBand_StandardBnk.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardBnk.OverFlow = False) then
			ppDetailBand_StandardBnk.OverFlow	:=	True;

		if (ppStandardBnkUnderLine.ReprintOnOverFlow = False) then
			ppStandardBnkUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_StandardCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardCst.LastRecord) or
		(ppDetailBand_StandardCst.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardCst.OverFlow = False) then
			ppDetailBand_StandardCst.OverFlow	:=	True;

		if (ppStandardCstUnderLine.ReprintOnOverFlow = False) then
			ppStandardCstUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_StandardStfBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardStf.LastRecord) or
		(ppDetailBand_StandardStf.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardStf.OverFlow = False) then
			ppDetailBand_StandardStf.OverFlow	:=	True;

		if (ppStandardStfUnderLine.ReprintOnOverFlow = False) then
			ppStandardStfUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_StandardGenBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardGen.LastRecord) or
		(ppDetailBand_StandardGen.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_StandardGen.OverFlow = False) then
			ppDetailBand_StandardGen.OverFlow	:=	True;

		if (ppStandardGenUnderLine.ReprintOnOverFlow = False) then
			ppStandardGenUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_TtlStandardBnkBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardBnk.LastRecord) or
		(ppDetailBand_TtlStandardBnk.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_TtlStandardBnk.OverFlow = False) then
			ppDetailBand_TtlStandardBnk.OverFlow	:=	True;

		if (ppTtlStandardBnkUnderLine.ReprintOnOverFlow = False) then
			ppTtlStandardBnkUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_TtlStandardCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardCst.LastRecord) or
		(ppDetailBand_TtlStandardCst.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_TtlStandardCst.OverFlow = False) then
			ppDetailBand_TtlStandardCst.OverFlow	:=	True;

		if (ppTtlStandardCstUnderLine.ReprintOnOverFlow = False) then
			ppTtlStandardCstUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_TtlStandardStfBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardStf.LastRecord) or
		(ppDetailBand_TtlStandardStf.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_TtlStandardStf.OverFlow = False) then
			ppDetailBand_TtlStandardStf.OverFlow	:=	True;

		if (ppTtlStandardStfUnderLine.ReprintOnOverFlow = False) then
			ppTtlStandardStfUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_TtlStandardGenBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandardGen.LastRecord) or
		(ppDetailBand_TtlStandardGen.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_TtlStandardGen.OverFlow = False) then
			ppDetailBand_TtlStandardGen.OverFlow	:=	True;

		if (ppTtlStandardGenUnderLine.ReprintOnOverFlow = False) then
			ppTtlStandardGenUnderLine.ReprintOnOverFlow	:=	True;

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
procedure TJNTCRP008001f.ppDetailBand_ExtDetailsCstBeforeGenerate(Sender: TObject);	//	HIS0002
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_ExtDetailsCst.LastRecord) or
		(ppDetailBand_ExtDetailsCst.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_ExtDetailsCst.OverFlow = False) then
			ppDetailBand_ExtDetailsCst.OverFlow	:=	True;

		if (ppExtDetailsCstUnderLine.ReprintOnOverFlow = False) then
			ppExtDetailsCstUnderLine.ReprintOnOverFlow	:=	True;

		ppExtDetailsCstUnderLine.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		ppExtDetailsCstUnderLine.Weight	:=	0.25;	// ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_System ( TppDetailBand )
//*							最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP008001f.ppDetailBand_SystemBeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_System.LastRecord) or
		(ppDetailBand_System.PageOutOfSpace = True) Then
	begin
		if (ppDetailBand_System.OverFlow = False) then
			ppDetailBand_System.OverFlow	:=	True;

		if (CmnReportSystemLineDetailsBottom.ReprintOnOverFlow = False) then
			CmnReportSystemLineDetailsBottom.ReprintOnOverFlow	:=	True;

		CmnReportSystemLineDetailsBottom.Visible    :=	True;
		CmnReportSystemLineDetailsBottom.Weight	:=	0.75;	// ラインの太さを太くしている
	end
	else
	begin
		CmnReportSystemLineDetailsBottom.Visible    :=	False;
		CmnReportSystemLineDetailsBottom.Weight	:=	0.25;	// ラインの太さを元にもどす
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
procedure TJNTCRP008001f.fnSetFileOutTF(PrintDivision: Integer;							//	HIS0007
								var sTitle: TStringList; var sMemFld: TStringList);
begin
	case PrintDivision of
		0:
		begin
			//HIS0030
			sTitle.Add	('コード'			    );

			sTitle.Add	('正式名称'					);
			sTitle.Add	('簡略名称'					);
			sTitle.Add	('連想'						);

			sTitle.Add	('適用期間開始'				);
			sTitle.Add	('適用期間終了'				);
			sTitle.Add	('最終更新日時'				);

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);

			sMemFld.Add	('dtAppDateStart'			);
			sMemFld.Add	('dtAppDateEnd'				);
			sMemFld.Add	('dtUpdateDate'				);

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

			sMemFld.Add	('strExCode'				);
			sMemFld.Add	('strName'					);
			sMemFld.Add	('strNameSimple'			);
			sMemFld.Add	('strAssociation'			);
			sMemFld.Add	('dtUpdateDate'				);

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
function TJNTCRP008001f.fnMakeSQL(nType: Integer): String;
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

//************************************************************************
//*		Component		:	StdCmnTabChange ( TMTab )
//*							Tabが変わった時
//*		Event			:	OnChange
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure	TJNTCRP008001f.fnStdCmnTabOnChange (Sender: TObject);
begin
	if	(not m_fAccessTab) then
		Exit;

	if	(StdCmnTab.Items.Selected = 0) then
	begin
		if	(not StdCmnTab.Focused) then
			StdCmnGridExist.SetFocus;
	end
	else
	begin
		if	(not StdCmnTab.Focused) then
			StdCmnGridTotal.SetFocus;
	end;
end;


//************************************************************************
//*		Component		:	TJNTCRP008001f ( TForm )
//*
//*		Event			:	OnDestroy
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP008001f.FormDestroy(Sender: TObject);
begin
	m_cPreview.Term ();
	m_cPreview.Free ();

    // ﾌﾘｰﾀﾞｲｱﾛｸﾞ開放<002>
    fnJNTFreeDlgFree();


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

//<040>↓↓
    // 印刷モジュール開放
	if ( m_RepHandle <> 0 ) then
	begin
    	UnloadPackageHelper( m_RepHandle );
	end;
//<040>↑↑

    // ﾏｽﾀ同期ｸﾗｽの破棄<015>
    if ( m_SyncMaster <> nil ) then
    begin
		m_SyncMaster.Free();
    end;

end;

//**************************************************************************
//	Component  :	Form
//	Event	    :	OnPaint ( ﾕｰｻﾞｰﾒｯｾｰｼﾞ)
//	Name	    :	T.Nobezawa
//**************************************************************************
procedure TJNTCRP008001f.WMOnPaint(var Msg: TMessage);
var
	stMessageRec : TMJSMsgRec;
begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 10);

		if (m_nProcDivision = 21) then
            stMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (stMessageRec.sMsg, '@_@', '銀行')
        else
            stMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (stMessageRec.sMsg, '@_@', '補助');

		MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

	close;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnOutputConfirmationMessage (Integer)												*/
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
function	TJNTCRP008001f.fnOutputConfirmationMessage (nDivision: Integer): Integer;
var
	stMessageRec: TMJSMsgRec;
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

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10020, nMessageID);

	nReturn	:= MJSMessageBoxEx (Self,stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

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
//*																											*/
//*	関数	: TJNTCRP008001f.fnOutputDBErrorMessage ()															*/
//*																											*/
//*	目的	: 補助登録処理 DBｴﾗｰﾒｯｾｰｼﾞ出力処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnOutputDBErrorMessage ();
begin
	if	(m_nDBErrorCode <> 0) then
	begin
		case (m_nDBErrorCode) of
			1:	m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 0, 1 );
			2:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 5 );
					m_cErrorMsgRec.sMsg	:= '固定体系区分が固定' + m_cErrorMsgRec.sMsg;
				end;
			3:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
					m_cErrorMsgRec.sMsg	:= '子供が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			4:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
					m_cErrorMsgRec.sMsg	:= '仕訳が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			5:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
					m_cErrorMsgRec.sMsg	:= '諸口以外のレコードが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;

{			6:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
   					m_cErrorMsgRec.sMsg	:= '支払予定データが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
}
			//2002/11/14
			6:	begin
                	if m_nCurrentMasterDiv = 22 then
					begin
                    	m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
	   					m_cErrorMsgRec.sMsg	:= '削除できません。（支払予定データが存在するため削除' + m_cErrorMsgRec.sMsg + '）';
					end
					else if m_nCurrentMasterDiv = 25 then
					begin
						m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
	   					m_cErrorMsgRec.sMsg	:= '削除できません。（経費精算データが存在するため削除' + m_cErrorMsgRec.sMsg + '）';
					end;
				end;

			//2002/11/14
			7:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
   					m_cErrorMsgRec.sMsg	:= '部署情報が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			//2002/11/14
			8:	begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30, 18 );
   					m_cErrorMsgRec.sMsg	:= '未連結仕訳(部署or分散)が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
// <014> ↓
            -193, -196:             // 重複ｴﾗｰ
			    m_cComArea.m_MsgStd.GetMsg ( m_cErrorMsgRec, 10000, 10017 );
            -210:                   // ﾛｯｸｴﾗｰ
			    m_cComArea.m_MsgStd.GetMsg ( m_cErrorMsgRec, 10000, 10016 );
// <014> ↑
		end;
	end;

	MJSMessageBoxEx (Self,
                     m_cErrorMsgRec.sMsg,
                     m_cErrorMsgRec.sTitle,
// <014>                     m_pRec^.m_ProgramName,
                     m_cErrorMsgRec.icontype,
					 m_cErrorMsgRec.btntype,
                     m_cErrorMsgRec.btndef,
                     m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnUpdateDetailsScreenRecord (): Boolean;
var
//	cNode	   : TTreeNode;
//	cNodeParent: TTreeNode;
//	stWorkRec  : ^TreeViewRec;
	strExCode  : String;
	fReturn	   : Boolean;
begin

    // 外部ｺｰﾄﾞ属性、桁数対応
	if ( m_nCurrentCodeAttr <= 1 ) then
    begin
        // 数値属性
    	strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
    end
    else
	begin
        // ﾌﾘｰ属性
    	DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0011
    	strExCode := DtlCmnEditExCodeFree.Text;
	end;

    // 実在/合計区分
	if	(DtlCmnTab.Items [0].Selected) then
		    m_stMasterData.nDivision := 0   // 実在
	else    m_stMasterData.nDivision := 1;  // 合計

    m_stMasterData.cExCodeParent	:= m_cExCodeCurrent;                    // 加算先内部ｺｰﾄﾞ
	m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;                  // 加算先外部ｺｰﾄﾞ
    m_stMasterData.strExCode		:= strExCode;							// 加算元外部ｺｰﾄﾞ
    m_stMasterData.cExCode		    := m_DtlNCode;							// 加算元内部ｺｰﾄﾞ
	m_stMasterData.strAssociation	:= DtlCmnEditAssociation.Text;			// 連想
	m_stMasterData.strName			:= DtlCmnEditName.Text;					// 正式名称
	m_stMasterData.strNameSimple	:= DtlCmnEditNameSimple.Text;			// 簡略名称
	m_stMasterData.fDetails			:= TRUE;								// 詳細更新区分: True=あり
	m_stMasterData.dDateStart	    := DtlCmnEditAppDateStart.AsDateTime;	// 適用開始年月日
	m_stMasterData.dDateEnd		    := DtlCmnEditAppDateEnd  .AsDateTime;	// 適用終了年月日
	m_stMasterData.cBankNCode   	:= DtlCmnEditBkNCode.AsCurrency;        // 銀行内部ｺｰﾄﾞ

    //  分類・ｾｸﾞﾒﾝﾄ設定
    with m_stMasterData do
    begin
        cBunruiNCode01  :=  0;
        cBunruiNCode02  :=  0;
        cBunruiNCode03  :=  0;
        cBunruiNCode04  :=  0;
        cBunruiNCode05  :=  0;
        cBunruiNCode06  :=  0;
        cBunruiNCode07  :=  0;
        cBunruiNCode08  :=  0;
        cBunruiNCode09  :=  0;
        cBunruiNCode10  :=  0;
        cSegNCode01     :=  0;
        cSegNCode02     :=  0;
        cSegNCode03     :=  0;
        cSegNCode04     :=  0;
        cSegNCode05     :=  0;
        cSegNCode06     :=  0;
        cSegNCode07     :=  0;
        cSegNCode08     :=  0;
        cSegNCode09     :=  0;
        cSegNCode10     :=  0;
    end;

    SessionPractice(C_ST_PROCESS); 				// <032> ADD

    // 補助基本ﾏｽﾀ更新
	fReturn := fnUpdateMasterRecord ();

    SessionPractice(C_ED_PROCESS);  			// <032> ADD

	if ( fReturn ) then
	begin
        // 各種詳細情報更新
		fnUpdateDetailIndInfo ();
        // 付箋情報の更新
//		fnUpdateMasterDataTagInfo (strExCode, m_nSelectTagKind);
	end;

	Result	:= fReturn;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnGetMasterDataTagInfo (String)													*/
//*																											*/
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報取得																*/
//*																											*/
//*	戻り値	: Integer, (付箋№)																				*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode = 補助外部ｺｰﾄﾞ      																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnGetMasterDataTagInfo(cNCode: Currency): Integer;
var
	dqMasterData: TMQuery;
	nTagDivision: Integer;

begin
	dqMasterData    := TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	nTagDivision	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add('WHERE  MasterKbn=:nMasterKbn AND NCode=:cNCode ');

		SetFld('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		SetFld('cNCode'    ).AsCurrency := cNCode;

		Open ();

		if	(not EOF) then
			nTagDivision    := GetFld('FusenKbn').AsInteger;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= nTagDivision;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnUpdateMasterDataTagInfo (String; var Integer)			        			*/
//*																											*/
//*	目的	: 補助登録処理 ﾏｽﾀ付箋管理情報更新																*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:正常, FALSE:異常)																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 補助外部ｺｰﾄﾞ																		*/
//*           nTagKind  = 付箋種類 (0:なし, 1:赤, 2:青, 3:緑, 4:橙)											*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnUpdateMasterDataTagInfo(cExCode: Currency; var nTagKind: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add('WHERE  MasterKbn=:nMasterKbn AND NCode=:cNCode');

		SetFld('nMasterKbn').AsInteger    := m_nCurrentMasterDiv;
		SetFld('cNCode'    ).AsCurrency   := cExCode;

		Open ();

		if  (not EOF) then
		begin
			if ((nTagKind = 0) or
                (GetFld('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind	:= 0;

				Close ();

				SQL.Clear ();
				SQL.Add('DELETE FROM MFusenInfo ');
				SQL.Add('WHERE  MasterKbn=:nMasterKbn AND NCode=:cNCode');
			end
			else
			begin
				Close ();

				SQL.Clear ();
				SQL.Add('UPDATE MFusenInfo SET FusenKbn=:nTagDivision, FusenCmnt='''' ');
				SQL.Add(', UpdTantoNCode = :cUpdTantoNCode');
				SQL.Add('WHERE  MasterKbn=:nMasterKbn AND NCode = :cNCode');

				ParamByName ('nTagDivision').AsInteger	:= nTagKind;
                ParamByName ('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>
			end;

			ParamByName('nMasterKbn').AsInteger     := m_nCurrentMasterDiv;
			ParamByName('cNCode'    ).AsCurrency	:= cExCode;

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

		SQL.Clear ();
		SQL.Add('INSERT INTO MFusenInfo ');
        SQL.Add('(MasterKbn,SubNcode,NCode,FusenKbn,FusenCmnt,UpdTantoNCode) ');
		SQL.Add('VALUES (:nMasterKbn,0,:cNCode,:nFusenKbn,'''',:cUpdNCode)');

		ParamByName ('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('cNCode'    ).AsCurrency	:= cExCode;
		ParamByName ('nFusenKbn' ).AsInteger	:= nTagKind;
		ParamByName ('cUpdNCode' ).AsCurrency	:= m_TantoNCode;

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
end;


procedure	TJNTCRP008001f.fnDtlCmnPopupMenuOnPopup (Sender: TObject);
begin


	DtlCmnPopupMenuTag01.Enabled	:= False;
	DtlCmnPopupMenuTag02.Enabled	:= False;
	DtlCmnPopupMenuTag03.Enabled	:= False;
	DtlCmnPopupMenuTag04.Enabled	:= False;

	DtlCmnPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;

    (*
    if DtlCmnTab.Items.Selected = 1 then
	begin
		DtlCmnPopupMenuTagOff    .Visible	:= False;
		DtlCmnPopupMenuTagComment.Visible	:= False;
        Exit;
    end;
    *) // <020>

	DtlCmnPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

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
//*	関数	: TJNTCRP008001f.fnCmnEditDayOnExit (TObject)														*/
//*																											*/
//*	目的	: 補助登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnEditDayOnExit (Sender: TObject);
begin
	if	((TMNumEdit (Sender).Value < 0) or (TMNumEdit (Sender).Value > 31)) then
	begin
		Beep ();

		TMNumEdit (Sender).SetFocus ();
	end;
end;


procedure	TJNTCRP008001f.fnDtlCs2EditDraftRankOnExit (Sender: TObject);
begin
	if	(not fnCheckFreeCodeValidCharacter (TMTxtEdit (Sender).Text)) then
		TMTxtEdit (Sender).SetFocus ();
end;

procedure TJNTCRP008001f.DtlCmnButtonUpdateEnter(Sender: TObject);
begin

	if	(not fnCheckDtlExCodeValid ()) then
		Abort;

end;


procedure	TJNTCRP008001f.fnStdCmnGridExistOnChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
var
	stMessageRec: TMJSMsgRec;

begin
// <005><011>↓
	if	(Column = 5) then
//	if	(Column = 6) then                   // 簡略名称ｶﾗﾑに移動時
// <005>↑
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

//<003>		CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
        fnSetFncType(True,7);
	end
	else
//<003>		CmnStatusBar.SimpleText	:= '';
        fnSetFncType(False,7);
end;


procedure	TJNTCRP008001f.fnStdCmnGridTotaOnlChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
var
	stMessageRec: TMJSMsgRec;

begin
// <011>↓
//	if	(Column = 5) then
	if	(Column = 4 ) then	
// <011>↑
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

//<003>		CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
        fnSetFncType(True,7);
	end
	else
//<003>		CmnStatusBar.SimpleText	:= '';
        fnSetFncType(False,7);
end;

procedure	TJNTCRP008001f.fnCmnToolbarDropDownMenuItemOnClick (Sender: TObject);
begin


//	CmnToolbarButtonTag.ImageIndex	:= (Sender as TMenuItem).ImageIndex;
    FusenButton.ImageIndex	:= (Sender as TMenuItem).ImageIndex;
    m_nCurrentTagKind := FusenButton.ImageIndex;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCmnToolbarButtonTagOnClick (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ [付箋] OnClick ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnToolbarButtonTagOnClick (Sender: TObject);
var
	stItemRec	: ^TreeViewRec;
	nTagKindWork: Integer;
    strExCode   : String;
    strName     : String;
    lvNCode     : Extended;
    nSumDivision : Integer;
begin
	nTagKindWork	:= 0;

	case (FusenButton.ImageIndex) of
		0:	nTagKindWork	:= 1;
		1:	nTagKindWork	:= 3;
		2:	nTagKindWork	:= 2;
		3:	nTagKindWork	:= 4;
	end;

	if	(DtlCmnClientPanel.Visible) then												// 詳細画面表示中
	begin
		if	(m_nSelectTagKind = nTagKindWork) then
			nTagKindWork	:= 0;

		case (nTagKindWork) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		end;

        // 外部コード
		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
		else
		begin
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);		//HIS0011
			strExCode	:= DtlCmnEditExCodeFree.Text;
        end;

        // 実在 or 合計
        if DtlCmnTab.Items[0].Selected = True then
			nSumDivision	:= 0
		else
			nSumDivision	:= 1;


        if fnGetHojyoMA(MASTER_BANK,strExCode,strName,lvNCode) then
        begin
    		fnUpdateMasterDataTagInfo(lvNCode, nTagKindWork);
	    	fnUpdateGridMemDataRecord(nSumDivision, strExCode, nTagKindWork);
        end;

		fnCommonFunctionDetailsOnChange (Sender);

		m_nSelectTagKind	:= nTagKindWork;
	end
	else if	((Screen.ActiveControl.Name = StdCmnGridExist.Name) or						// 実在補助ｸﾞﾘｯﾄﾞ
			 (Screen.ActiveControl.Name = StdCmnGridTotal.Name)) then					// 合計補助ｸﾞﾘｯﾄﾞ
			fnSetGridTagInfo (nTagKindWork)
	else if	(Screen.ActiveControl.Name = CmnTreeView.Name) then							// ﾂﾘｰﾋﾞｭｰ
	begin
		stItemRec	:= CmnTreeView.Selected.Data;

		fnUpdateMasterDataTagInfo(stItemRec^.cNCode, nTagKindWork);
		fnUpdateGridMemDataRecord(stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOnClick (TObject)										*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	: TMenuItem;
	stItemRec	: ^TreeViewRec;
	nTagKindWork: Integer;

begin
	stItemRec	:= m_cNodeRightClick.Data;

	if ((stItemRec^.nDivision = 0) or
        (stItemRec^.nDivision = DIVISION_GENERAL)) then
		m_cNodeRightClick.Selected	:= TRUE;

	cMenuItem	:= Sender as TMenuItem;

	if	(cMenuItem.Name = CmnTreeViewPopupMenuTagOff.Name) then
		nTagKindWork	:= 0
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag01.Name) then
		nTagKindWork	:= 1
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag02.Name) then
		nTagKindWork	:= 3
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag03.Name) then
		nTagKindWork	:= 2
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag04.Name) then
		nTagKindWork	:= 4
	else
		nTagKindWork	:= 0;

	fnUpdateMasterDataTagInfo(stItemRec^.cNCode, nTagKindWork);
	fnUpdateGridMemDataRecord(stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);


	if	(DtlCmnClientPanel.Visible) then												// 詳細画面表示中
	begin
		case (nTagKindWork) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		end;
    end;


end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOnClickEx (TObject)										*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnCmnTreeViewPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData: TMQuery;
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	cMenuItem	: TMenuItem;
	cMemData	: TdxMemData;
	stItemRec	: ^TreeViewRec;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

begin

	cMenuItem		:= Sender as TMenuItem;
	nTagKindWork	:= 0;
	fIgnore			:= FALSE;

	if	(cMenuItem.Name = CmnTreeViewPopupMenuTagComment.Name) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	(not TMenuItem (MJSFindCtrl (Self, Format ('CmnTreeViewPopupMenuTag%.2d', [nCount]))).Visible) then
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
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag01Ex.Name) then
		nTagKindWork	:= 1
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag02Ex.Name) then
		nTagKindWork	:= 3
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag03Ex.Name) then
		nTagKindWork	:= 2
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag04Ex.Name) then
		nTagKindWork	:= 4
	else
		Exit;


	if	(DtlCmnClientPanel.Visible) then	// 詳細画面表示中
	begin
		case (nTagKindWork) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		end;
    end;



//	m_cNodeRightClick	:= CmnTreeView.Selected;
//	stItemRec			:= CmnTreeView.Selected.Data;

	stItemRec	:= m_cNodeRightClick.Data;

	if	(not fIgnore) then
	begin
		fnUpdateMasterDataTagInfo(stItemRec^.cNCode, nTagKindWork);
		fnUpdateGridMemDataRecord(stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);
	end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (Self,Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;									// ﾏｽﾀ区分

	cMasDlgParam.m_iNCode		:= stItemRec^.cNCode;
	cMasDlgParam.m_iSubNCode	:= 0;													// 科目別補助ｺｰﾄﾞ

	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;										// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);									// TMjsAppRecord

	if	(cMasDlgIF.DoDlg (cMasDlgParam) = mrOK) then									// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close ();

			SQL.Add('SELECT FusenCmnt FROM MFusenInfo mf');
            SQL.Add('RIGHT JOIN HojyoMA hm ON ');
            SQL.Add('(mf.MasterKbn=hm.MasterKbn AND mf.NCode=hm.NCode)');
			SQL.Add('WHERE mf.MasterKbn=:nMasterKbn AND hm.NCode=:ExCode');

			ParamByName ('nMasterKbn').AsInteger	:= cMasDlgParam.m_iMasterkbn;
			ParamByName ('ExCode'   ).AsFloat       := cMasDlgParam.m_iNCode;

			Open ();

			if ((stItemRec^.nDivision = 0) or
                (stItemRec^.nDivision = DIVISION_GENERAL)) then
				cMemData	:= StdCmnMemDataExist
			else
				cMemData	:= StdCmnMemDataTotal;

			if (not (StdCmnClientPanel.Visible and
                StdCmnTab.Items [0].Selected and
				((stItemRec^.nDivision = 0) or
                 (stItemRec^.nDivision = DIVISION_GENERAL)))) then
			begin
				cMemData.First ();

				while (not cMemData.Eof) do
				begin
//					if	(CompareStr (cMasDlgParam.m_sHojyoCode,
//									 cMemData.FieldByName ('strExCode').AsString) = 0) then

					if	(CompareStr (stItemRec^.strExCode,
									 cMemData.FieldByName ('strExCode').AsString) = 0) then

						Exit;

					cMemData.Next ();
				end;
			end;

			cMemData.Edit ();

			if	(not EOF) then
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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridPopupMenuTagOnClick (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem: TMenuItem;
	nTagKind : Integer;

begin
	cMenuItem	:= Sender as TMenuItem;

	if	(cMenuItem.Name = StdCmnGridPopupMenuTagOff.Name) then
		nTagKind	:= 0
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01.Name) then
		nTagKind	:= 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02.Name) then
		nTagKind	:= 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03.Name) then
		nTagKind	:= 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04.Name) then
		nTagKind	:= 4
	else
		nTagKind	:= 0;

	fnSetGridTagInfo (nTagKind);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnStdCmnGridPopupMenuTagOnClickEx (TObject)										*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[ｸﾞﾘｯﾄﾞ付箋] OnClick ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);
var
	dqMasterData: TMQuery;
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	cMenuItem	: TMenuItem;
	cMemData	: TdxMemData;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

    strExCode   : String;
    lvName      : String;
    lvNCode     : Extended;


begin

	cMenuItem		:= Sender as TMenuItem;
	nTagKindWork	:= 0;
	fIgnore			:= FALSE;

	if	(cMenuItem.Name = StdCmnGridPopupMenuTagComment.Name) then
	begin
		for	nCount := 1 to 4 do
		begin
			if	(not TMenuItem (MJSFindCtrl (Self, Format ('StdCmnGridPopupMenuTag%.2d', [nCount]))).Visible) then
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
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01Ex.Name) then
		nTagKindWork	:= 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02Ex.Name) then
		nTagKindWork	:= 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03Ex.Name) then
		nTagKindWork	:= 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04Ex.Name) then
		nTagKindWork	:= 4
	else
		Exit;

	if	(not fIgnore) then
		fnSetGridTagInfo (nTagKindWork);

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (Self,Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;									// ﾏｽﾀ区分

	cMasDlgParam.m_iNCode		:= 0;													// 科目ｺｰﾄﾞ
	cMasDlgParam.m_iSubNCode	:= 0;													// 科目別補助ｺｰﾄﾞ


	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
	begin
		if  (m_nCurrentCodeAttr <= 1) then
		begin
			if	(StdCmnMemDataExist.FieldByName ('strExCode').AsString <> '') then
				strExCode	:= Format (
							'%.16d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName ('strExCode').AsString))])
		end
		else
            strExCode   := StdCmnMemDataExist.FieldByName ('strExCode').AsString;
	end
	else																				// 合計ｸﾞﾘｯﾄﾞ
	begin
		if  (m_nCurrentCodeAttr <= 1) then
		begin
			strExCode	:= Format (
							'%.16d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName ('strExCode').AsString))])
		end
		else
			strExCode	:= StdCmnMemDataTotal.FieldByName ('strExCode').AsString;
	end;

    if fnGetHojyoMA(MASTER_BANK, strExCode, lvName, lvNCode) then
         cMasDlgParam.m_iNCode := lvNCode;

	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;										// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);									// TMjsAppRecord

	if	(cMasDlgIF.DoDlg (cMasDlgParam) = mrOK) then									// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add('SELECT FusenCmnt FROM MFusenInfo mf');
            SQL.Add('RIGHT JOIN HojyoMA hm ON ');
            SQL.Add('(mf.MasterKbn=hm.MasterKbn AND mf.NCode=hm.NCode)');
			SQL.Add('WHERE mf.MasterKbn=:nMasterKbn AND hm.NCode=:ExCode');

			ParamByName ('nMasterKbn').AsInteger	:= cMasDlgParam.m_iMasterkbn;
			ParamByName ('ExCode'   ).AsFloat       := cMasDlgParam.m_iNCode;

			Open ();

			if	(StdCmnTab.Items [0].Selected) then
				cMemData	:= StdCmnMemDataExist
			else
				cMemData	:= StdCmnMemDataTotal;

			cMemData.Edit ();

			if	(not EOF) then
				cMemData.FieldByName('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				cMemData.FieldByName('strComment').AsString	:= '';

			cMemData.Post ();
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnPopupMenuTagOnClick (TObject)												*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細画面･付箋] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	: TMenuItem;
	nTagKindWork: Integer;

begin
	cMenuItem	:= Sender as TMenuItem;

	if	(cMenuItem.Name = DtlCmnPopupMenuTagOff.Name) then
		nTagKindWork	:= 0
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag01.Name) then
		nTagKindWork	:= 1
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag02.Name) then
		nTagKindWork	:= 3
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag03.Name) then
		nTagKindWork	:= 2
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag04.Name) then
		nTagKindWork	:= 4
	else
		nTagKindWork	:= 0;

	case (nTagKindWork) of
		0:	DtlCmnImageTag.Picture	:= nil;
		1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
		3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	end;

	if	(nTagKindWork <> m_nSelectTagKind) then
		fnCommonFunctionDetailsOnChange (Sender);

	m_nSelectTagKind	:= nTagKindWork;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnDtlCmnPopupMenuTagOnClickEx (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[詳細画面･付箋] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnDtlCmnPopupMenuTagOnClickEx (Sender: TObject);
var
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	cMenuItem	: TMenuItem;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

    lvNCode     : Extended;
    lvName      : String;
    strExCode   : String;

begin
	cMenuItem	:= Sender as TMenuItem;
	fIgnore		:= FALSE;

	if	(cMenuItem.Name = DtlCmnPopupMenuTagComment.Name) then
	begin
		nTagKindWork	:= m_nSelectTagKind;
		fIgnore			:= TRUE;
	end
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag01Ex.Name) then
		nTagKindWork	:= 1
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag02Ex.Name) then
		nTagKindWork	:= 3
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag03Ex.Name) then
		nTagKindWork	:= 2
	else if	(cMenuItem.Name = DtlCmnPopupMenuItemTag04Ex.Name) then
		nTagKindWork	:= 4
	else
		Exit;


	if	(not fIgnore) then
	begin
		case (nTagKindWork) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		end;
	end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (Self,Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;									// ﾏｽﾀ区分
//	cMasDlgParam.m_iNCode		:= 0;													// 科目ｺｰﾄﾞ

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);		//HIS0011
		strExCode	:= DtlCmnEditExCodeFree.Text;
    end;

    if fnGetHojyoMA(MASTER_BANK, strExCode, lvName, lvNCode) then
         cMasDlgParam.m_iNCode := lvNCode;



	cMasDlgParam.m_iSubNCode	:= 0;													// 科目別補助ｺｰﾄﾞ

{
	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
		cMasDlgParam.m_sHojyoCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);			//HIS0011
		cMasDlgParam.m_sHojyoCode	:= DtlCmnEditExCodeFree.Text;
	end;
}

	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;										// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);									// TMjsAppRecord

	cMasDlgIF.DoDlg (cMasDlgParam);														// 付箋備考ﾀﾞｲｱﾛｸﾞ表示

	if	(not fIgnore) then
	begin
		if	(nTagKindWork <> m_nSelectTagKind) then
			fnCommonFunctionDetailsOnChange (Sender);

		m_nSelectTagKind	:= nTagKindWork;
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnEnableToolbarButtonTag (Boolean)												*/
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
procedure	TJNTCRP008001f.fnEnableToolbarButtonTag (fEnabled: Boolean);
begin
//	if	(fEnabled) then
//	begin
//		if	(DtlCmnClientPanel.Visible) then
//			FusenButton.Enabled	:= FALSE
//		else
//			FusenButton.Enabled	:= fEnabled;
//	end
//	else

    if (not m_cJNTArea.IsFusen ) then
    begin
        FusenButton.ImageIndex	:= 4;
    	FusenButton.Enabled	:= False;
    end else
    begin
       	if not (fEnabled) then
            FusenButton.ImageIndex	:= 4
        else
            FusenButton.ImageIndex	:= m_nCurrentTagKind;

    	FusenButton.Enabled	:= fEnabled;
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP008001f.fnCheckDtlExCodeValid ()														*/
//*																											*/
//*	目的	: 補助登録処理																					*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:ﾁｪｯｸOK, FALSE:ﾁｪｯｸNG)															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnCheckDtlExCodeValid (): Boolean;
var
	stWorkRec : ^TreeViewRec;
	nCount	  : Integer;
	strExCode : String;
    iSumKbn   : Integer;
begin

    // 未処理(初回時)
	if ( m_pRec^.m_pChildForm = nil ) then
	begin
		Result := TRUE;
		Exit;
	end;

    // 数値属性
	if ( m_nCurrentCodeAttr <= 1 ) then
	begin
		if ( DtlCmnEditExCodeNumeric.InputFlag and (Trunc (DtlCmnEditExCodeNumeric.Value) = 0) ) then
			strExCode := ''
		else
			strExCode := Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);
	end
    // ﾌﾘｰ属性
	else
	begin
		DtlCmnEditExCodeFree.Text := TrimRight(DtlCmnEditExCodeFree.Text);			// HIS0011
		strExCode := DtlCmnEditExCodeFree.Text;

		if ( not fnCheckExCodeValidCharacter (strExCode) ) then
		begin
			DtlCmnEditExCodeFree.SetFocus();
			Result := FALSE;
			Exit;
		end;
	end;

	if ( Trim (strExCode) = '' ) then
	begin
		Beep ();

		if ( m_nCurrentCodeAttr <= 1 ) then
    			m_cACControl := DtlCmnEditExCodeNumeric     // 数値属性
		else    m_cACControl := DtlCmnEditExCodeFree;       // ﾌﾘｰ属性

		m_cACControl.SetFocus ();
		Result := FALSE;
		Exit;
	end;

    // 外部ｺｰﾄﾞ変更ﾁｪｯｸ
	if ( not m_fDtlChangeExCode ) then
	begin
        // 変更がない場合は終了
		Result := TRUE;
		Exit;
	end;

	m_fDtlNewRecord	:= FALSE;
    m_RowState := STATE_NONE;   // <015>

	if ( fnResetDetailScreen () ) then
	begin
        // 新規ﾚｺｰﾄﾞ
        if ( DtlCmnTab.Items [0].Selected ) then
    			fnChangeComponentState (0)      // 実在
		else    fnChangeComponentState (1);     // 合計

		m_cNodePrevSelect := CmnTreeView.Selected;
		m_fDtlNewRecord	  := TRUE;

        // -------------------------------------------------------------------------
        //  ｸﾞﾙｰﾌﾟ管理処理 <015>
        //
        //  ｸﾞﾙｰﾌﾟ管理を採用している場合、詳細画面のｺｰﾄﾞｺﾝﾄﾛｰﾙ確定時に同期を
        //  行う。親会社に既に同一ﾏｽﾀが存在している場合は同期配信を行います。
        //  存在していない場合は、通常処理。
        // -------------------------------------------------------------------------
        if ( m_SyncMaster.m_flgGrpCorp = 1 ) then
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
                        fnSetDetailScreenInfo ( m_stMasterData.cExCode,  iSumKbn );
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
        // ↑↑↑<015>
        // -------------------------------------------------------------------------
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
		end;

        m_RowState := STATE_EDIT; // <015>
	end;

    if not fnSumChk(strExCode) then
    begin
        Result := False;
        Exit;
    end;

	m_fDtlChangeExCode	:= FALSE;
	Result				:= TRUE;
end;

//2002/10/08
procedure	TJNTCRP008001f.fnDtlCommonFunctionOnEnter (Sender: TObject);
begin

	if	(not fnCheckDtlExCodeValid ()) then
		Abort;


end;



//***********************************************************************************************************/
//*																											*/
//*	関数	: TMas210100f.DtlCs1EditRespectDivisionExit (Sender: TObject)											*/
//*																											*/
//*	目的	: 共通補助登録処理 様、殿、御中 OnExit ｲﾍﾞﾝﾄ														*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/


//***********************************************************************************************************/
//*																											*/
//*	関数	: TMas210100f.fnStdCmnGridExistOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 実在補助ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*           付箋備考ｺﾒﾝﾄの表示                                                                            */
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridExistOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nExCodeSelect   : Extended;
	strExCodeSelect : String;
begin

	inherited;

	nExCodeSelect	:= 0;
	strExCodeSelect	:= '';

    // 付箋ｶﾗﾑの座標以外はｽﾙｰ
	if	(( Y <= StdCmnGridExist.HeaderPanelHeight  ) or
		 ( X <= StdCmnGridExist.GrIndicatorWidth  ) or
		 ( X >= (StdCmnGridExist.GrIndicatorWidth + StdCmnGridExistTag.Width) )) then
	begin
		m_nHintPosition		     := 0;
		m_strHintPosition	     := '';
		StdCmnGridExist.Hint	 := '';
		StdCmnGridExist.ShowHint := false;
		Exit;
	end;

	if	(( StdCmnGridExist.GetNodeAt (X, Y) <> nil ) and
		 ( not VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1]) ) and
         ( TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1] <> '' )) then   // ﾌﾞﾗﾝｸの場合も除外<023>
	begin
        // 数値属性
		if ( m_nCurrentCodeAttr <= 1 ) then
            nExCodeSelect	:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1]
		else
			strExCodeSelect	:= TdxTreelistNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1];

		if	((( m_nCurrentCodeAttr <= 1 ) and ( nExCodeSelect <> m_nHintPosition )) or
			 (( m_nCurrentCodeAttr  = 2 ) and ( CompareStr (strExCodeSelect, m_strHintPosition) <> 0 ))) then
		begin
			m_nHintPosition		     := nExCodeSelect;
			m_strHintPosition	     := strExCodeSelect;
			StdCmnGridExist.Hint	 := '';
			StdCmnGridExist.ShowHint := false;
			Exit;
		end;

		if ( StdCmnGridExist.ShowHint  and
		   ((( m_nCurrentCodeAttr <= 1 ) and ( nExCodeSelect = m_nHintPosition )) or
		    (( m_nCurrentCodeAttr  = 2 ) and ( CompareStr (strExCodeSelect, m_strHintPosition) = 0 )))) then Exit;    

		// <022>if ( VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [10]) ) then
        if	( VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [11]) ) then   // <022>
			Exit;

		// <022>if	(TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [10] <> '') then
        if ( TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [11] <> '' ) then // <022>
		begin
			// <022>StdCmnGridExist.Hint := TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [10];
            StdCmnGridExist.Hint	 := TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [11];  // <022>
			StdCmnGridExist.ShowHint := true;
		end;
	end
	else
	begin
		m_nHintPosition		     := 0;
		m_strHintPosition	     := '';
		StdCmnGridExist.Hint	 := '';
		StdCmnGridExist.ShowHint := false;
	end;

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TMas210100f.fnStdCmnGridTotalOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 合計補助ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*           付箋備考ｺﾒﾝﾄの表示                                                                            */
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP008001f.fnStdCmnGridTotalOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nExCodeSelect   : Extended;
	strExCodeSelect : String;

begin
	inherited;

	nExCodeSelect	:= 0;
	strExCodeSelect	:= '';

    // 付箋ｶﾗﾑの座標以外はｽﾙｰ
	if (( Y <= StdCmnGridTotal.HeaderPanelHeight ) or
	    ( X <= StdCmnGridTotal.GrIndicatorWidth  ) or
	    ( X >= (StdCmnGridTotal.GrIndicatorWidth + StdCmnGridTotalTag.Width) )) then
	begin
		m_nHintPosition		     := 0;
		m_strHintPosition	     := '';
		StdCmnGridTotal.Hint	 := '';
		StdCmnGridTotal.ShowHint := false;
		Exit;
	end;

	if (( StdCmnGridTotal.GetNodeAt (X, Y) <> nil ) and
	    ( not VarIsNull (TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1]) ) and
        ( TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1] <> '' )) then   // ﾌﾞﾗﾝｸの場合も除外<023>
	begin
		if ( m_nCurrentCodeAttr <= 1 ) then
			nExCodeSelect	:= TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1]
		else
			strExCodeSelect	:= TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [1];

		if ((( m_nCurrentCodeAttr <= 1 ) and ( nExCodeSelect <> m_nHintPosition) ) or
		    (( m_nCurrentCodeAttr  = 2 ) and ( CompareStr (strExCodeSelect, m_strHintPosition) <> 0) )) then
		begin
			m_nHintPosition		     := nExCodeSelect;
			m_strHintPosition	     := strExCodeSelect;
			StdCmnGridTotal.Hint	 := '';
			StdCmnGridTotal.ShowHint := false;
			Exit;
		end;

		if ( StdCmnGridTotal.ShowHint and
           ((( m_nCurrentCodeAttr <= 1 ) and ( nExCodeSelect = m_nHintPosition )) or
            (( m_nCurrentCodeAttr  = 2 ) and ( CompareStr (strExCodeSelect, m_strHintPosition) = 0) ))) then Exit;

		if ( VarIsNull (TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5]) ) then Exit;

		if ( TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5] <> '' ) then
		begin
			StdCmnGridTotal.Hint	 := TdxTreeListNode (StdCmnGridTotal.GetNodeAt (X, Y)).Values [5];
			StdCmnGridTotal.ShowHint := true;
		end;
	end
	else
	begin
		m_nHintPosition	    	 := 0;
		m_strHintPosition	     := '';
		StdCmnGridTotal.Hint	 := '';
		StdCmnGridTotal.ShowHint := false;
	end;

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnCheckExCodeValidCharacter (strExCode: String): Boolean;
begin
	if	(Trim (strExCode) = '') then
	begin
		Beep ();

		Result	:= FALSE;
		Exit;
	end;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(not fnCheckFreeCodeValidCharacter (strExCode)) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP008001f.fnCheckFreeCodeValidCharacter (strFreeCode: String): Boolean;
begin
	if	(Trim (strFreeCode) = '') then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(not JNTMASERRORCODECHECK (strFreeCode, m_strValidCharacters)) then
	begin
		Beep ();

		m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 21);

		MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
										m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;
end;


//******************************************************************************
//	チェック処理	//HIS0014
//******************************************************************************
function TJNTCRP008001f.fnCheckTreeViewDropItem(cNodeDst: TTreeNode;
  cExCode: Currency; nDivisionSrc: Integer): Boolean;
var
	dqMasterData: TMQuery;
	stRecDst	: ^TreeViewRec;
begin
	stRecDst	:= cNodeDst.Data;

	if (DIVISION_GENERAL = stRecDst^.nDivision) or (stRecDst^.nDivision = 0) then	//HIS0018
		stRecDst	:= cNodeDst.Parent.Data;

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close;

		SQL.Clear;

		SQL.Add   ('SELECT MasterKbn FROM HojyoTree ');
		SQL.Add   ('WHERE  MasterKbn=:nMasterKbn AND ');
		SQL.Add   ('       SumNCode=:cSumCode AND BasedNCode=:cBasedCode');

		ParamByName('nMasterKbn').AsInteger     :=	m_nCurrentMasterDiv;
		ParamByName('cSumCode').AsCurrency      := 	stRecDst.cNCode;
		ParamByName('cBasedCode').AsCurrency    := 	cExCode;

		Open;

		if not Eof then
		begin
			Close;
			Free;

			Result	:= False;
			Exit;
		end;
	end;

	dqMasterData.Close;
	dqMasterData.Free;

	Result	:= True;
end;

//******************************************************************************
//	HIS0022
//******************************************************************************
function TJNTCRP008001f.fnHojyoTreeDelete(cPreExCode, cExCode: Currency): Integer;
var
	Qe	:	TMQuery;
begin
    Result	:= -1;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);							// DBとMQueryの接続

	//メール会計未採用、通常処理のときだけ削除可能。それ以外はコードが同じでも削除不可。
	if giReferFlag	= NORMAL then
	begin
		m_cDataModule.BeginTran(m_cDBSelect);

		Qe.Close;
		Qe.SQL.Add('delete from HojyoTree  ');
		Qe.SQL.Add('where                  ');
	    Qe.SQL.Add('	SumNCode   = :SCode');
		Qe.SQL.Add('and BasedNCode = :BCode');
		Qe.SQL.add('and MasterKbn  = :MKbn  ');
		Qe.ParamByName('SCode').AsCurrency  := cExCode;
		Qe.ParamByName('BCode').AsCurrency	:= cPreExCode;
		Qe.ParamByName('MKbn').AsInteger	:= m_nCurrentMasterDiv;
		if Qe.ExecSQL = False then
		begin
 			m_cDataModule.Rollback(m_cDBSelect);
			Qe.Close;
			Qe.Free;
			Exit;
		end;

		m_cDataModule.Commit(m_cDBSelect);
	end;

	Result	:= 0;

	Qe.Close;
	Qe.Free;
end;


//******************************************************************************
//	HIS0022
//******************************************************************************
procedure TJNTCRP008001f.fnDeleteCheck;
var
	stCap : String;//stMsg,,stNo
begin
	if m_DeleteCheck = False then
	begin
		stCap := '共通補助登録';

		if giReferFlag	= NORMAL then
			MjsMessageBoxEx(Self, '加算情報の不整合がありました。不整合部分を削除しましたので、再度加算情報を見直して下さい。',stCap,mjInformation,mjOK,mjDefOK )
		else
			MjsMessageBoxEx(Self, '加算情報の不整合がありました。登録権利がありませんので、復旧は行いませんでした。',stCap,mjInformation,mjOK,mjDefOK );

		m_DeleteCheck	:= True;
	end;
end;

//***********************************************************************************************************
//*
//*	関数	: TMas210100f.DtlCmnEditExCodeNumericArrowClick														　　
//*
//*	目的	: 共通補助登録処理　詳細画面でのコードを検索エクスプローラで表示　HIS0032
//*
//*	戻り値	: なし,
//*
//***********************************************************************************************************
procedure TJNTCRP008001f.DtlCmnEditExCodeNumericArrowClick(Sender: TObject);
//var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;
//	sSQL		: String;
begin
{HIS0047
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';					// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'Renso';					// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';			// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'HojyoMA';				// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_pApRec		:= pointer( m_pRec ); 		// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCurrentCodeDigit;		// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCurrentCodeAttr; 		// ｺｰﾄﾞ属性

	sSQL	:= sSQL + 'MasterKbn = ' + IntToStr(m_nCurrentMasterDiv);
	sSQL	:= sSQL + 'and RDelKbn=0 ';

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


function TJNTCRP008001f.MakeDspString(CODE: String; NAME: String): String;
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

//**************************************************************************
//	Proccess	:	Treeをコードの昇順に並び替え
//	Name		:	Y.Ichihashi
//	Date		:	2003/10/07
//	Parameter	:	nMasterDivision     Integer
//	Return		:
//	History		:	HIS0041
//**************************************************************************
procedure TJNTCRP008001f.BRowChangeClick(Sender: TObject);
var
	QueryRead   :   TMQuery;
    QueryWrite  :   TMQuery;
	iRet		:	Integer;
	iEntNo		:	Integer;
	sSvSumCode	:	Extended;
	iCount		:	Integer;
	stName		:	String;

begin
    sSvSumCode  := 0;
	QueryRead	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, QueryRead);							// DBとMQueryの接続
	QueryWrite	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, QueryWrite);							// DBとMQueryの接続

	iEntNo := 100;

//<MLXDEP>
	if (TMSeries.IsMjsLink3) then
		iRet :=  mrYes
	else
	begin
	    stName  :=  m_stSelectItem[m_ComBox].strItemCaption;
    	iRet := MjsMessageBoxEX(Self,stName + 'コード昇順で並び替えを行います。よろしいですか？','並び替え',mjQuestion,mjYesNo,mjDefYes);
	end;
//<MLXDEP>

    if iRet <> mrYes then
        Exit;
    try
    	SessionPractice(C_ST_PROCESS); 				// <033> ADD

		// 加算体系更新下準備
		QueryWrite.Close;
		QueryWrite.SQL.Clear;		 							// QueryFree 初期化
		QueryWrite.SQL.Add('Update HojyoTree Set EntNo = EntNo * -1, ');
		QueryWrite.SQL.Add('UpdTantoNCode = :cUpdTantoNCode '); // <034>
        QueryWrite.SQL.Add('Where MasterKbn = :pMKBN and EntNo > 0');
		QueryWrite.SetFld('pMKBN').AsInteger	    := m_nCurrentMasterDiv;
        QueryWrite.SetFld('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

		if (QueryWrite.ExecSQL = False) then
		begin
       		m_cDataModule.Rollback(m_cDBSelect);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
            MQTreeSortWrite.Close;
            MQTreeSortRead.Close;

            SessionPractice(C_ED_PROCESS); 			// <033> ADD

            Exit;
		end;

		// 加算体系の読み込み
		QueryRead.Close;
		QueryRead.SQL.Clear;		 							// QueryFree 初期化
		QueryRead.SQL.Add('Select Count(*) as Kensu from HojyoTree Where MasterKbn = :pMKBN');
		QueryRead.SetFld('pMKBN').AsInteger	    := m_nCurrentMasterDiv;
		QueryRead.Open;

		if QueryRead.Eof = False then
		begin
			Prog1.Max := QueryRead.GetFld('Kensu').AsInteger;
			Prog1.Position := 0;
			iCount := 0;
		end
		else
        begin
        	SessionPractice(C_ED_PROCESS); 			// <033> ADD
			Exit;
        end;


		// 加算体系の読み込み
		QueryRead.Close;
		QueryRead.SQL.Clear;		 							// QueryFree 初期化
		QueryRead.SQL.Add('Select HT.MasterKbn, HT.SumNCode, HT.BasedNCode, HT.EntNo,HM.SumKbn from HojyoTree HT ');
        QueryRead.SQL.Add('Left Outer Join HojyoMA HM  ');
		QueryRead.SQL.Add('on HT.BasedNCode = HM.NCode ');
        QueryRead.SQL.Add('Left Outer Join HojyoMA HMOya ');
		QueryRead.SQL.Add('on HT.SumNCode = HMOya.NCode  ');
		QueryRead.SQL.Add('Where HT.MasterKbn = :pMKBN and HT.BasedNCode = HM.NCode and HM.RDelKbn = 0 ');
		QueryRead.SQL.Add('Order by HMOya.GCode,HM.SumKbn,HM.GCode, HT.EntNo');

		QueryRead.SetFld('pMKBN').AsInteger	    := m_nCurrentMasterDiv;
		QueryRead.Open;
		QueryRead.FetchAll;

		while QueryRead.Eof = False do
		begin
			if sSvSumCode <> QueryRead.GetFld('SumNCode').AsFloat then
				iEntNo := 100;

			QueryWrite.Close;
			QueryWrite.SQL.Clear;		 							// QueryFree 初期化
			QueryWrite.SQL.Add('Update HojyoTree Set EntNo =:NewENT, ');
			QueryWrite.SQL.Add('UpdTantoNCode = :cUpdTantoNCode '); // <034>
            QueryWrite.SQL.Add('Where MasterKbn = :pMKBN and SumNCode =:SUM and BasedNCode =:BASED and EntNo =:ENT');
			QueryWrite.SetFld('pMKBN').AsInteger  := m_nCurrentMasterDiv;
			QueryWrite.SetFld('NewENT').AsInteger := iEntNo;
			QueryWrite.SetFld('SUM').AsFloat := QueryRead.GetFld('SumNCode').AsFloat;
			QueryWrite.SetFld('BASED').AsFloat := QueryRead.GetFld('BasedNCode').AsFloat;
			QueryWrite.SetFld('ENT').AsInteger := QueryRead.GetFld('EntNo').AsInteger;
            QueryWrite.SetFld('cUpdTantoNCode').AsCurrency := m_TantoNCode; // <034>

			if (QueryWrite.ExecSQL = False) then
			begin
            	SessionPractice(C_ED_PROCESS); 			// <033> ADD
           		m_cDataModule.Rollback(m_cDBSelect);	//	ﾛｰﾙﾊﾞｯｸ(破棄)
                MQTreeSortWrite.Close;
                  MQTreeSortRead.Close;
                Exit;
			end;

    		sSvSumCode := QueryRead.GetFld('SumNCode').AsInteger;
			iEntNo := iEntNo + 100;

			QueryRead.Next;

			Inc(iCount);
			Prog1.Position := iCount;
		end;

		m_cDataModule.Commit (m_cDBSelect);		//	ｺﾐｯﾄ(反映)

        fnRebuildTreeViewItems();
        fnSetParentItemsInfo;

        SessionPractice(C_ED_PROCESS); 			// <033> ADD

        if  DtlCmnClientPanel.Visible then
        begin
            if m_nCurrentCodeAttr = 2 then
                MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeFree')
            else
                MjsDispCtrl.MjsSetFocus(Self, 'DtlCmnEditExCodeNumeric');
            fnSetFncType(True,0);
        end
        else
        begin
            if StdCmnTab.Items[0].Selected = True then
                MjsDispCtrl.MjsSetFocus(Self, 'StdCmnGridExist')
            else
                MjsDispCtrl.MjsSetFocus(Self, 'StdCmnGridTotal');
            fnSetFncType(False,0);
        end;


    except

    end;

end;

//************************************************************************
//*		Component		:	BSearch ( TMSpeedButton )
//*							検索DLG
//*		Date		    :	2004/06/24
//*		Event			:	OnClick
//*		Name			:	H.Endo（MJS）
//************************************************************************
procedure TJNTCRP008001f.BSearchClick(Sender: TObject);
var

    lvExpSend   :   rcJNTExpSend;   // 親BPL送信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    lvExpRecv   :   rcJNTExpRecv;   // 親BPL受信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    iExpRtn     :   Integer;        // 戻り値
    strExCode   :   String;

begin

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam( @lvExpSend );
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;                                 // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;                           // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;        //
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;        //

    lvExpSend.MasterKbn     :=  m_nCurrentMasterDiv;                // ﾏｽﾀ区分
    lvExpSend.ModulKbn      :=  0;                          // ﾓｼﾞｭｰﾙ区分(共通=0)
    lvExpSend.PatternNo     :=  1;                          // ﾊﾟﾀｰﾝNo.
//    lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';             // ﾂｰﾙﾊﾞｰｷｬﾌﾟｼｮﾝ
//    lvExpSend.TableName     :=  'HojyoMA';                  // ﾃｰﾌﾞﾙ名
    lvExpSend.WhereStr      :=  'HojyoMA.MasterKbn =' + IntToStr(m_nCurrentMasterDiv)
                                                    + ' And HojyoMA.RDelKbn = 0';

    lvExpSend.SortStr       :=  'Order By HojyoMA.GCode';


    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin

		if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64(lvExpRecv.GCode)])
		else
			strExCode	:= TrimRight(lvExpRecv.GCode);

    	m_SearchInfo.sHojCD     := strExCode;
		m_SearchInfo.iItem      := 0;
		m_SearchInfo.bFstFlg    := False;
		CmnTreeView.SetFocus;
		fnSearch();
	end;

end;

//**********************************************************************
//*		Proccess	:	検索
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/24
//*		Parameter	:   Nothing
//*		Return		:	Nothing
//**********************************************************************
procedure TJNTCRP008001f.fnSearch;
begin
	if fnDownSearch() = True then
	begin
		if m_SearchInfo.bFstFlg = False then
		begin
			m_SearchInfo.iStItem := P_ComBox.ItemIndex;
			m_SearchInfo.bFstFlg := True;
		end;
		exit;
	end;

	while True do
	begin
		// 1件も一致しなかった時
		if (m_SearchInfo.bFstFlg = False) then
			break;

		// 最後まで検索した時
		if (m_SearchInfo.bFstFlg = True) then
		begin
    		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,32 );
	    	MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			break;
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	検索処理
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/24
//*		Parameter	:	Nothing
//*		Return		:	一致(True)/不一致(False)
//**********************************************************************
function TJNTCRP008001f.fnDownSearch: Boolean;
var
	wkRec	: ^TreeViewRec;
	i		: Integer;
begin
	Result := False;
	for i:=m_SearchInfo.iItem to CmnTreeView.Items.Count-1 do
    begin
        wkRec   := CmnTreeView.Items[i].Data;

		if (wkRec.strExCode = m_SearchInfo.sHojCD) then
		begin
			CmnTreeView.Items[i].Selected := True;
			m_SearchInfo.iItem := i+1;
			Result := True;
			break;
		end
	end;
end;


procedure TJNTCRP008001f.CmnTreeViewExit(Sender: TObject);
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
procedure TJNTCRP008001f.BDeleteMouseDown(Sender: TObject;
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
function TJNTCRP008001f.fnClearAllSystems: Boolean;
var
	dqMasterTree: TMQuery;

begin
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterTree	:= TMQuery.Create (Self);									        // MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM HojyoTree WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		if	(not ExecSQL ()) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree .Close    ();
			dqMasterTree .Free     ();

			Result	:= FALSE;
			Exit;
		end;

		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM HojyoTree2 WHERE MasterKbn = :nMasterDivision');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		if	(not ExecSQL ()) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree .Close    ();
			dqMasterTree .Free     ();

			Result	:= FALSE;
            Exit;
		end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - MASTER_BANK]	:= 1;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

	Result	:= TRUE;
end;

//**********************************************************************
//*		Proccess	:   銀行情報設定
//*		Parameter	:	Nothing
//**********************************************************************
procedure TJNTCRP008001f.fnBankInfoSet();
var
	dqBank:     TMQuery;
    sBkCode:    String;
begin
	dqBank  :=  TMQuery.Create(Self);									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqBank);							// DBとMQueryの接続
    dxMBankInfo.Active  :=  False;
    dxMBankInfo.Active  :=  True;
	with (dqBank) do
	begin
        Close;
        SQL.Clear;
        SQL.Add('Select NCode,AllBkCode,AllBraCode,BankName,BkBraName FROM BankInfo');
        SQL.Add('WHERE MasterKbn=:nMasterKbn AND RDelKbn=0');
        SQL.Add('ORDER BY AllBkCode,AllBraCode');

		SetFld('nMasterKbn').AsInteger	:= m_nCurrentMasterDiv;
        Open;
        while EOF = False do
        begin
            dxMBankInfo.Append;
            dxMBankInfoNCode.AsCurrency     :=  GetFld('NCode').AsCurrency;
            dxMBankInfoAllBkCode.AsInteger  :=  GetFld('AllBkCode').AsInteger;
            dxMBankInfoAllBraCode.AsInteger :=  GetFld('AllBraCode').AsInteger;
            dxMBankInfoBankName.AsString    :=  GetFld('BankName').AsString;
            dxMBankInfoBkBraName.AsString   :=  GetFld('BkBraName').AsString;
			sBkCode :=  Format('%.4d-%.3d', [   dxMBankInfoAllBkCode.AsInteger,
                                                dxMBankInfoAllBraCode.AsInteger]);
            dxMBankInfoBkCode.AsString      :=  sBkCode;
            dxMbankInfoBkName.AsString      :=  Trim(GetFld('BankName').AsString) + '／' +
                                                Trim(GetFld('BkBraName').AsString);
            dxMBankInfo.Post;
            Next;
        end;
        Close;
    end;
    dqBank.Free;
end;
//**********************************************************************
//*		Proccess	:
//**********************************************************************
procedure TJNTCRP008001f.StdCmnGridExistBkCodeCloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
begin
    if Trim(StdCmnMemDataExistName.AsString) = '' then
    begin
        StdCmnMemDataExistName.AsString :=  Trim(dxMBankInfoBankName.AsString) + '／' +
                                            Trim(dxMBankInfoBkBraName.AsString);
    end;
    if Trim(StdCmnMemDataExistNameSimple.AsString) = '' then
    begin
        StdCmnMemDataExistNameSimple.AsString   :=  StdCmnMemDataExistName.AsString;
    end;
end;
//**********************************************************************
//*		Proccess	:
//**********************************************************************
function TJNTCRP008001f.fnBankInfoGet(BankCode, BrCode: Integer;
  var BankName: String; var NCode: Extended): Boolean;
begin
    Result  :=  False;

    try
        with QryBankInfo do
        begin
            Close;
            SetFld('AllBkCode').AsInteger   :=  BankCode;
            SetFld('AllBraCode').AsInteger  :=  BrCode;
            Open;

            if Eof then
            begin
                BankName    :=  '';
                NCode       :=  0;
            end
            else
            begin
                BankName    :=  TrimRight(GetFld('BankName').AsString) + '／'
                            +   TrimRight(GetFld('BkBraName').AsString);
                NCode       :=  GetFld('NCode').AsFloat;
                Result  :=  True;
            end;
            Close;
        end;
    except
    end;
end;
//**********************************************************************
//*		Proccess	:   部門・セグメント情報取得
//*		Parameter	:	Nothing
//**********************************************************************
procedure TJNTCRP008001f.fnGetMasterInfo();
var
	dqMasterInfo:   TMQuery;
//    sBkCode     :   String;
    cTxtEdit    :   TMTxtEdit;
    cLabel1     :   TMLabel;
    cLabel2     :   TMLabel;
    i           :   Integer;
    iTop        :   Integer;
    iUse        :   Integer;

    strSegUse   :   String;

begin

	dqMasterInfo  :=  TMQuery.Create(Self);									// MQueryの構築
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, dqMasterInfo);				// DBとMQueryの接続

	with (dqMasterInfo) do
	begin
        // 銀行分類------------------------------------------------------------
        Close;
        SQL.Clear;
        SQL.Add('Select * from MasterInfo   ');
        SQL.Add('WHERE MasterKbn between :sMstKbn and :eMstKbn  ');
        SQL.Add('Order by MasterKbn  ');

		SetFld('sMstKbn').AsInteger	:= MKBN_GINBN1;
		SetFld('eMstKbn').AsInteger	:= MKBN_GINBN10;
        Open;

        i       := 0;
        iUse    := 0;
        iTop    := 0;

        while not EOF do
        begin
            i := i + 1;
            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
            cLabel1  := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnLabelBun%.2d%.', [i])));
            cLabel2  := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspBun%.2d%.', [i])));

            // Top位置確保
            if i = 1 then iTop := cTxtEdit.Top;

            // 採用有り
            if GetFld('UseKbn').AsInteger <> 0 then
            begin
                cTxtEdit.Tag        := GetFld('MasterKbn').AsInteger;
                cTxtEdit.Maxlength  := GetFld('CodeDigit').AsInteger;
                cLabel1.Caption     := GetFld('JHojyoName').AsString;

                case GetFld('CodeAttr').AsInteger of
                    0:  cTxtEdit.InputAttr    :=  iaZeroSup;
                    1:  cTxtEdit.InputAttr    :=  iaZeroPad;
                    2:  cTxtEdit.InputAttr    :=  iaNone;
                end;
                iUse := iUse + 1;
                if iUse = 1 then
                begin;
                    cTxtEdit.Top    := iTop;
                    cLabel1.Top     := iTop;
                    cLabel2.Top     := iTop;
                end     else begin
                    iTop := iTop + 22;
                    cTxtEdit.Top    := iTop;
                    cLabel1.Top     := iTop;
                    cLabel2.Top     := iTop;
                end;
            end
            // 採用無し
            else begin
                cTxtEdit.Visible    := False;
                cLabel1.Visible     := False;
                cLabel2.Visible     := False;
            end;
            next;
        end;

        // ｾｸﾞﾒﾝﾄ------------------------------------------------------------
        Close;
        SQL.Clear;
        SQL.Add('Select * from MasterInfo   ');
        SQL.Add('WHERE MasterKbn between :sMstKbn and :eMstKbn  ');
        SQL.Add('Order by MasterKbn  ');

		SetFld('sMstKbn').AsInteger	:= MKBN_SEG1;
		SetFld('eMstKbn').AsInteger	:= MKBN_SEG10;

        Open;

        i := 0;
        While not Eof do
        begin
        	m_MasterInfoSeg[i].MasterKbn  := GetFld('MasterKbn').AsInteger;
			m_MasterInfoSeg[i].JHojyoName := GetFld('JHojyoName').AsString;
			m_MasterInfoSeg[i].CodeAttr   := GetFld('CodeAttr').AsInteger;
			m_MasterInfoSeg[i].CodeDigit  := GetFld('CodeDigit').AsInteger;;
            i := i + 1;
            next;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select MasterKbn,');
        SQL.Add('Isnull(SegUse1,0) as SegUse1, ');
        SQL.Add('Isnull(SegUse2,0) as SegUse2, ');
        SQL.Add('Isnull(SegUse3,0) as SegUse3, ');
        SQL.Add('Isnull(SegUse4,0) as SegUse4, ');
        SQL.Add('Isnull(SegUse5,0) as SegUse5, ');
        SQL.Add('Isnull(SegUse6,0) as SegUse6, ');
        SQL.Add('Isnull(SegUse7,0) as SegUse7, ');
        SQL.Add('Isnull(SegUse8,0) as SegUse8, ');
        SQL.Add('Isnull(SegUse9,0) as SegUse9, ');
        SQL.Add('Isnull(SegUse10,0) as SegUse10 ');
        SQL.Add(' from SegMA ');
        SQL.Add('WHERE MasterKbn = :MstKbn  ');
		SetFld('MstKbn').AsInteger	:= MASTER_BANK;

        Open;

        i       := 0;
        iUse    := 0;
        iTop    := 0;

        for i := 0 to 9 do
        begin

            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i+1])));
            cLabel1  := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnLabelSeg%.2d%.', [i+1])));
            cLabel2  := TMLabel   (MJSFindCtrl (Self, Format ('DtlCmnDspSeg%.2d%.', [i+1])));

            // Top位置確保
            if i  = 0 then iTop := cTxtEdit.Top;

            // 採用有り
            StrSegUse := 'SegUse' + IntToStr(i + 1);
            if GetFld(StrSegUse).AsInteger <> 0 then
            begin

                cTxtEdit.Tag        := m_MasterInfoSeg[i].MasterKbn;
                cTxtEdit.Maxlength  := m_MasterInfoSeg[i].CodeDigit;
                cLabel1.Caption     := m_MasterInfoSeg[i].JHojyoName;

                case m_MasterInfoSeg[i].CodeAttr of
                    0:  cTxtEdit.InputAttr    :=  iaZeroSup;
                    1:  cTxtEdit.InputAttr    :=  iaZeroPad;
                    2:  cTxtEdit.InputAttr    :=  iaNone;
                end;
                iUse := iUse + 1;
                if iUse = 1 then
                begin;
                    cTxtEdit.Top    := iTop;
                    cLabel1.Top     := iTop;
                    cLabel2.Top     := iTop;
                end     else begin
                    iTop := iTop + 22;
                    cTxtEdit.Top    := iTop;
                    cLabel1.Top     := iTop;
                    cLabel2.Top     := iTop;
                end;
            end
            // 採用無し
            else begin
                cTxtEdit.Visible    := False;
                cLabel1.Visible     := False;
                cLabel2.Visible     := False;
            end;

        end;

    end;

    dqMasterInfo.Close;
    dqMasterInfo.free;
end;
//******************************************************************************
//*		Proccess	:  名称取得                               parm:GCode
//******************************************************************************
function    TJNTCRP008001f.fnGetHojyoMA(MasterKbn : Integer ;GCode: String;
                                var pName: String; var NCode : Extended): Boolean;
var
    dqMasterData: TMQuery;
begin
    Result  :=  False;

    dqMasterData :=	TMQuery.Create( Self );		 		            //	MQueryの構築
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect,dqMasterData );		//	DBとMQueryの接続

    NCode := 0;
    pName := '';

    with dqMasterData do
    begin
        try
        begin
            Close;
            SQL.Clear;

            if ((MasterKbn >= MASTER_SEG_START) and (MasterKbn <= MASTER_SEG_END)) or (Masterkbn = MASTER_BANK) then
            begin
                SQL.Add('Select * from HojyoMA     ');
                SQL.Add('Where MasterKbn = :Kbn    ');

                if MasterKbn <> MASTER_BANK then    // ｾｸﾞﾒﾝﾄは実在のみ
                    SQL.Add(' And SumKbn = 0 ');
            end
            else begin
                SQL.Add('Select * from MMeisho      ');
                SQL.Add('Where SetNM = :Kbn    ');
            end;

            SQL.Add('And GCode = :GCode ');
            SQL.Add('And RDelKbn = 0    ');

            SetFld('Kbn').AsInteger  := MasterKbn;
            SetFld('GCode').AsString    := GCode;
            Open;

            if not Eof then
            begin
            if ((MasterKbn >= MASTER_SEG_START) and (MasterKbn <= MASTER_SEG_END)) or (Masterkbn = MASTER_BANK) then
                    pName   :=  GetFld('SimpleName').AsString
                else
                    pName   :=  GetFld('NMK').AsString;

                NCode   :=  GetFld('NCode').AsFloat;
                Result  :=  True;
            end;

        end;
        finally
            Close;
            Free;
        end;

    end;
end;
//******************************************************************************
//*		Proccess	:  名称取得                               parm:NCode
//******************************************************************************
function    TJNTCRP008001f.fnGetGCode(MasterKbn : Integer ;NCode: Extended;
                                var pName: String; var GCode : String): Boolean;
var
    dqMasterData: TMQuery;
begin
    Result  :=  False;

    dqMasterData :=	TMQuery.Create( Self );		 		            //	MQueryの構築
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect,dqMasterData );		//	DBとMQueryの接続

    GCode := '';
    pName := '';

    with dqMasterData do
    begin
        try
        begin
            Close;
            SQL.Clear;

            if ((MasterKbn >= MASTER_SEG_START) and (MasterKbn <= MASTER_SEG_END)) or (Masterkbn = MASTER_BANK) then
            begin
                SQL.Add('Select * from HojyoMA     ');
                SQL.Add('Where MasterKbn = :Kbn    ');
                SQL.Add('And SumKbn = 0            ');
            end
            else begin
                SQL.Add('Select * from MMeisho      ');
                SQL.Add('Where SetNM = :Kbn    ');
            end;

            SQL.Add('And NCode = :NCode ');
            SQL.Add('And RDelKbn = 0    ');

            SetFld('Kbn').AsInteger     := MasterKbn;
            SetFld('NCode').AsFloat     := NCode;
            Open;

            if not Eof then
            begin
            if ((MasterKbn >= MASTER_SEG_START) and (MasterKbn <= MASTER_SEG_END)) or (Masterkbn = MASTER_BANK) then
                    pName   :=  GetFld('SimpleName').AsString
                else
                    pName   :=  GetFld('NMK').AsString;

                GCode   :=  GetFld('GCode').AsString;
                Result  :=  True;
            end;

        end;
        finally
            Close;
            Free;
        end;

    end;
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
function TJNTCRP008001f.fnGetDspData(sCode: String; uvAttr :Integer): String;
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

    if sCode = '' then Exit;

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
//******************************************************************************
//*		Proccess	:  名称取得                               parm:NCode
//******************************************************************************
function    TJNTCRP008001f.fnGetDtlNCode():Boolean;
var
    Qe          : TMQuery;
    strExCode   : String;
    nSumkbn     : Integer;
begin

    Result := True;

    if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
		strExCode	:= DtlCmnEditExCodeFree.Text;
    end;

    if DtlCmnTab.Items[0].Selected = True then
    	nSumkbn	:= 0
	else
	 	nSumkbn	:= 1;

  	Qe := TMQuery.Create( Self );					        //	MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe );		//	DBとMQueryの接続

    with Qe do
    begin
        Close;
        SQL.Clear;
        SQL.Add('Select NCode from HojyoMA      ');
        SQL.Add('Where MasterKbn = :pMstKbn      ');
        SQL.Add('And SumKbn = :nSumKbn and RDelKbn = 0 ');
        SQL.Add('And GCode = :pGCode');
    	SetFld('pMstKbn').AsInteger 	:= MASTER_BANK;
	    SetFld('nSumkbn').AsInteger		:= nSumKbn;
	    SetFld('pGCode' ).AsString 		:= strExCode;

        Open;

        if not Eof then
        begin
            m_DtlNCode := GetFld('NCode').AsCurrency;
            fnEnableToolbarButtonTag(True);
        end
        else
        begin
            m_DtlNCode := -1;
            fnEnableToolbarButtonTag(false);
        end;

        Close;
        Free;
    end;
end;

//******************************************************************************
//*		Proccess	: 詳細画面必須項目ﾁｪｯｸ
//******************************************************************************
function TJNTCRP008001f.fnDtlChk(): Boolean;
var
//    dqMasterData    : TMQuery;
    lvCode          : Extended;
    lvName          : String;
    fResult         : Boolean;
    fSyokuchi       : Boolean;
    strExCode       : String;

begin

    fResult := True;
    fSyokuchi := false;

    if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);		//HIS0011
		strExCode	:= DtlCmnEditExCodeFree.Text;
    end;


    if fnSyokuchiChk(strExCode) then fSyokuchi := True;

    // FX0047 必須ﾁｪｯｸ
    if	(DtlCmnTab.Items [0].Selected) then
    begin
        if fSyokuchi = false then
        begin
            // ﾌﾞﾗﾝｸﾁｪｯｸ
            if (DtlCmnEditBankCode.Text ='') or (DtlCmnEditBrCode.Text ='') then
                //fResult := False	051109 全銀協ｺｰﾄﾞは必須じゃない
            else begin
            // 該当ﾁｪｯｸ
                if not fnBankInfoGet(DtlCmnEditBankCode.AsInteger,DtlCmnEditBrCode.AsInteger,
                                                            lvName,lvCode) then
                    fResult := false;
            end;
            fnCmnBankEnabled(True);
        end
        else
            fnCmnBankEnabled(False);

    end;

    // Caption
    if fResult = false then
    begin
        DtlCmnLabelZenginName.Caption := '';
        MLabel2.Caption := '';                             //<012>
    end;

        Result := fResult;

end;

// =============================================================================
// 適用期間の開始・終了の判定処理(デフォルト値の場合はブランクとする)
// =============================================================================
procedure TJNTCRP008001f.fnCheckTekiDate(nDmqDataQry: TMQuery);
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
//***********************************************************************************************************/
//*																											*/
//*	関数	: ArrowClick(Sender: TObject);
//*																											*/
//***********************************************************************************************************/
procedure TJNTCRP008001f.ArrowClick(Sender: TObject);
var
    lvExpSend   :  rcJNTExpSend;
    lvExpRecv   :  rcJNTExpRecv;
    iExpRtn     :  Integer;
    CompName    :  String;
    i           :  Integer;
//    iMasterkbn  :  Integer;

//    lvPatternNo :  Integer;
//    strWhere    :  String;

    cTxtEdit    :   TMtxtEdit;
    cLabel      :   TMLabel;

    lvSQL       :   String;

    sBkCode     :   String;
    Qe          :   TMQuery;

begin

    cTxtEdit := nil;
    cLabel   := nil;

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;


    // *********** 銀行ｺｰﾄﾞ ***********
    if (CompName = 'DtlCmnEditExCodeNumeric')
                                   or (CompName = 'DtlCmnEditExCodeFree')then
    begin
        lvExpSend.MasterKbn     :=  MASTER_BANK;        //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TBarNM        :=  DtlCmnLabelExCodeTitle.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
        lvExpSend.TableName     :=  'HojyoMA';            //
        lvExpSend.TrRootCaption :=  DtlCmnLabelExCodeTitle.Caption;
        lvExpSend.SumKbn        :=  DtlCmnTab.items.Selected;

        lvSQL := 'HojyoMA.Masterkbn = ' + IntToStr(MASTER_BANK) + ' And HojyoMA.RDelKbn = 0';
        lvExpSend.WhereStr      :=  lvSQL;

    end;

    // *********** 全銀協ｺｰﾄﾞ ***********
    if (CompName = 'DtlCmnEditBrCode') then
    begin
        lvExpSend.MasterKbn     :=  9110;               //マスタ区分＝
        lvExpSend.ModulKbn      :=  0;                  //モジュール区分
        lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
        lvExpSend.TableName     :=  'BankInfo';
        lvExpSend.WhereStr      :=  'Masterkbn = 21 and RDelKbn = 0';
        lvExpSend.SortStr       :=  'Order by AllBkCode,AllBraCode';
    end;


    // *********** 分類 ***********
    if Copy(CompName,11,3) = 'Bun' then
    begin
        for i := 1 to 10 do
        begin

            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditBun%.2d%.', [i])));
            cLabel   := TMLabel(MJSFindCtrl (Self, Format ('DtlCmnDspBun%.2d%.', [i])));

            if (CompName = cTxtEdit.Name) then
            begin
                lvExpSend.MasterKbn     :=  cTxtEdit.Tag;       //マスタ区分＝
                lvExpSend.ModulKbn      :=  0;                  //モジュール区分
                lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
                lvExpSend.TBarNM        :=  DtlCmnLabelExCodeTitle.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
                lvExpSend.TableName     :=  'MMeisho';            //
                lvExpSend.TrRootCaption :=  DtlCmnLabelExCodeTitle.Caption;
                Break;
            end;
        end;
    end;
    // *********** ｾｸﾞﾒﾝﾄ ***********
    if Copy(CompName,11,3) = 'Seg' then
    begin
        for i := 1 to 10 do
        begin

            cTxtEdit := TMTxtEdit (MJSFindCtrl (Self, Format ('DtlCmnEditSeg%.2d%.', [i])));
            cLabel   := TMLabel(MJSFindCtrl (Self, Format ('DtlCmnDspSeg%.2d%.', [i])));

            if (CompName = cTxtEdit.Name) then
            begin
                lvExpSend.MasterKbn     :=  cTxtEdit.Tag;       //マスタ区分＝
                lvExpSend.ModulKbn      :=  0;                  //モジュール区分
                lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
                lvExpSend.TBarNM        :=  DtlCmnLabelExCodeTitle.Caption + '検索ｴｸｽﾌﾟﾛｰﾗ'; //
                lvExpSend.TableName     :=  'HojyoMA';            //
                lvExpSend.TrRootCaption :=  DtlCmnLabelExCodeTitle.Caption;
                lvExpSend.WhereStr      := 'HojyoMA.SumKbn = 0 and HojyoMA.RDelKbn = 0 and HojyoMA.Masterkbn = ' + IntToStr(cTxtEdit.Tag) ;
                Break;
            end;
        end;
    end;

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        // *********** 銀行ｺｰﾄﾞ ***********
        if (CompName = 'DtlCmnEditExCodeNumeric') then
        begin
            DtlCmnEditExCodeNumeric.Value  := StrToFloat(lvExpRecv.GCode);
            fnDtlChk;
        end;

        if (CompName = 'DtlCmnEditExCodeFree') then
        begin
            DtlCmnEditExCodeFree.Text     := lvExpRecv.GCode;
            fnDtlChk;
        end;

        // *********** 全銀協ｺｰﾄﾞ ***********
        if (CompName = 'DtlCmnEditBrCode') then
        begin
            DtlCmnEditBkNCode.Value := lvExpRecv.NCode;

        	Qe := TMQuery.Create( Self );					        //	MQueryの構築
	        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe );		//	DBとMQueryの接続

        	with (Qe) do
	        begin
		        Close ();
    		    SQL.Clear;
    		    SQL.Add('SELECT * from BankInfo WHERE NCODE = :pNcode');
                SetFld('pNCode').AsFloat := lvExpRecv.NCode;
		        Open;

        		if (not Eof) then
                begin
                    if lvExpRecv.NCode <> 0 then
                    begin
		            	sBkCode :=  Format('%.4d-%.3d', [GetFld ('AllBkCode').AsInteger,
                                                    GetFld ('AllBraCode').AsInteger]);

                        DtlCmnEditBankCode.Value := GetFld ('AllBkCode').AsInteger;
                        DtlCmnEditBrCode.Value   := GetFld ('AllBraCode').AsInteger;

              			DtlCmnLabelZenginName.Caption := sBkCode;
                        MLabel2.Caption := '－';                                 //<012>
                    end;

                    if Trim(DtlCmnEditName.Text) = '' then
                        DtlCmnEditName.Text :=  Trim(GetFld('BankName').AsString) + '／' +
                                                Trim(GetFld('BkBraName').AsString);

                    if Trim(DtlCmnEditNameSimple.Text) = '' then
                        DtlCmnEditNameSimple.Text   :=
                                                        MJSKabuCut (DtlCmnEditName.Text, 14);
					// hirota 051206 >>
                    if Trim(DtlCmnEditAssociation.Text) = '' then
                        DtlCmnEditAssociation.Text :=  Trim(GetFld('Renso').AsString);
					// hirota 051206 <<
                end;
                Close;
                Free;
            end;
        end;

        // *********** 分類・ｾｸﾞﾒﾝﾄｺｰﾄﾞ ***********
        if cTxtEdit <> nil then
        begin
            if (CompName = cTxtEdit.Name) then
            begin
                cTxtEdit.Text   := lvExpRecv.GCode;
                cLabel.Caption := lvExpRecv.Nmk;
            end;
        end;

        Keybd_Event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ

		abort;
    end;

end;
//***********************************************************************************************************/
//*																											*/
//*	関数	: fnCmnBankEnabled(fEnabled : Boolean)
//*																											*/
//***********************************************************************************************************/
procedure TJNTCRP008001f.fnCmnBankEnabled(fEnabled:Boolean);
begin

    if fEnabled = False then
    begin
        DtlCmnEditBankCode.Enabled := False;
        DtlCmnEditBrCode.Enabled := False;
        StdCmnGridExistBkCode.DisableEditor := True;
        StdCmnGridExistBkCode.ReadOnly := True;
    end else
    begin
        DtlCmnEditBankCode.Enabled := True;
        DtlCmnEditBrCode.Enabled := True;
        StdCmnGridExistBkCode.DisableEditor := False;
        StdCmnGridExistBkCode.ReadOnly := False;
    end;

end;

//******************************************************************************
//*		Proccess	: 諸口ﾁｪｯｸ
//******************************************************************************
function TJNTCRP008001f.fnSyokuchiChk(strExCode : String): Boolean;
var
    dqMasterData    : TMQuery;

begin

    Result := False;

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT * FROM HojyoMA ');
        SQL.Add('WHERE MasterKbn=:nMasterKbn AND SyokuchiKbn=1 AND RDelKbn=0 and GCode = :strGCode');

		ParamByName ('nMasterKbn').AsInteger	:= m_nProcDivision; //銀行;
		ParamByName ('strGCode').AsString      	:= strExCode;
		Open ();

		if(not EOF) then
			Result := True;

		Close ();
        Free();
    end;
end;
//**********************************************************************
//*		Proccess	:	参照・入力時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Name		:	H.Endo
//*		Date		:	2001/1/9
//*		Parameter	:	Select		:	NORMAL(通常処理),BASICONLY(基本のみ設定可能),REFER(参照のみ)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP008001f.fnPartsControl(Select: Integer);	//	HIS0005
begin

	if (Select = REFER) then	//	参照の時
	begin
		//	TreeView
		CmnTreeView.DragMode	:=	dmManual;
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridExistCode				.ReadOnly	:=	True;
		StdCmnGridExistAssociation		.ReadOnly 	:=	True;
		StdCmnGridExistName				.ReadOnly	:=	True;
		StdCmnGridExistNameSimple		.ReadOnly	:=	True;
		StdCmnGridExistAdoptDivision01	.ReadOnly 	:=	True;
		StdCmnGridExistAdoptComment01	.ReadOnly 	:=	True;
		StdCmnGridExistAdoptDivision02	.ReadOnly 	:=	True;
		StdCmnGridExistAdoptComment02	.ReadOnly 	:=	True;
        StdCmnGridExistBkCode           .ReadOnly 	:=	True;
		//	合計情報Grid
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridTotalCode			.ReadOnly	:=	True;
		StdCmnGridTotalAssociation	.ReadOnly	:=	True;
		StdCmnGridTotalName			.ReadOnly	:=	True;
		StdCmnGridTotalNameSimple	.ReadOnly 	:=	True;

		//	POPUP
        CmnTreeView.PopupMenu       :=  CmnTreeViewPopupMenu;
     	StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
        StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;
        DtlCmnScrollBox.PopupMenu   :=  DtlCmnPopupMenu;

        // 詳細
  		DtlCmnButtonUpdate.Enabled	:= False;
      	DtlCmnButtonCancel.Enabled	:= False;
        MPanel.Enabled              := False;
        DtlBumonScrBox.Enabled      := False;
        DtlSegScrBox.Enabled        := False;

        // 並び替え
        B_RowChange.Enabled         := False;
        B_Search.Enabled            := False;   // <016>
	end
	else
	begin

  		CmnTreeView.DragMode	:=	dmAutomatic;    // 更新権限有り

		//	実在情報Grid
   		StdCmnGridExist.Options	:=	StdCmnGridExist.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		//	合計情報Grid
    	StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];

		StdCmnGridExistAssociation		.ReadOnly 	:=	False;
		StdCmnGridExistName				.ReadOnly	:=	False;
		StdCmnGridExistNameSimple		.ReadOnly	:=	False;
		StdCmnGridExistAdoptDivision01	.ReadOnly 	:=	False;
		StdCmnGridExistAdoptComment01	.ReadOnly 	:=	False;
		StdCmnGridExistAdoptDivision02	.ReadOnly 	:=	False;
		StdCmnGridExistAdoptComment02	.ReadOnly 	:=	False;
        StdCmnGridExistBkCode           .ReadOnly 	:=	False;

		StdCmnGridTotalAssociation	.ReadOnly	:=	False;
		StdCmnGridTotalName			.ReadOnly	:=	False;
		StdCmnGridTotalNameSimple	.ReadOnly 	:=	False;

        CmnTreeView.PopupMenu       :=  CmnTreeViewPopupMenu;
      	StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
        StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;
        DtlCmnScrollBox.PopupMenu   :=  DtlCmnPopupMenu;

        // 詳細
  		DtlCmnButtonUpdate.Enabled	:=  m_IsUpdate;
      	DtlCmnButtonCancel.Enabled	:=  m_IsUpdate;
        MPanel.Enabled              :=  m_IsUpdate;
        DtlBumonScrBox.Enabled      :=  m_IsUpdate;
        DtlSegScrBox.Enabled        :=  m_IsUpdate;

        // 並び替え
        B_RowChange.Enabled         :=  m_IsUpdate;
        B_Search.Enabled            :=  m_IsUpdate; // <016>
	end;
end;
//******************************************************************************
//*		Proccess	: SumKbnﾁｪｯｸ
//******************************************************************************
function TJNTCRP008001f.fnSumChk(strExCode : String): Boolean;
var
    dqMasterData    : TMQuery;

begin

    Result := True;

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT SumKbn FROM HojyoMA ');
        SQL.Add('WHERE MasterKbn=:nMasterKbn AND RDelKbn=0 and GCode = :strGCode');

		ParamByName ('nMasterKbn').AsInteger	:= m_nProcDivision; //銀行;
		ParamByName ('strGCode').AsString      	:= strExCode;
		Open ();

		if(not EOF) then
        begin
            if GetFld('SumKbn').AsInteger <> DtlCmnTab.Items.Selected then
                Result := False;
        end;

		Close ();
        Free();
    end;
end;
//**********************************************************************
//*		Proccess	:	権限取得
//**********************************************************************
procedure TJNTCRP008001f.fnGetGrants();
begin

//    m_cJNTArea.FxPermission;				    // 権限取得 <001>
    B_Print.Enabled := m_cJNTArea.IsPrint;		// 印刷権限 <PRN2>

//<PRN2>	B_Print.Enabled := False;           // <PEF>

// <029> DEL start      						// 親側で決算確定メッセージを表示するのでここでは出さない
(*
    // 決算確定時
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then
    begin
        giReferFlag	:= REFER;
        m_IsUpdate  := False;
    end
    else
	begin
*)
// <029> DEL end

        // <017>if ( m_cJNTArea.IsAppend ) and ( m_cJNTArea.IsModify ) then
        if ( m_cJNTArea.IsAppend ) or ( m_cJNTArea.IsModify ) then // <017>
                m_IsUpdate := true
        else    m_IsUpdate := false;

// <035> ADD-STR
        // 自動仕訳申請状況チェック
        if (not fnAllowEdit) then
        begin
            m_IsUpdate := false;
            m_IsDelete := false;
// <041> Add start
            MjsMessageBox(Self,
            				'債務管理（経費精算）の自動仕訳を承認申請中のため、関連情報の修正は行えません。',
                            mjWarning,
                            mjDefOK									);
// <041> Add end
        end else begin
            m_IsDelete := m_cJNTArea.IsDelete;
        end;
// <035> ADD-END

		if ( m_IsUpdate ) then
	            giReferFlag	:= NORMAL   // 通常処理
		else    giReferFlag	:= REFER;	// 更新権限無

        // ↓<015> ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
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
        // ↑<015>
// <029> DEL start
//	end;
// <029> DEL end

end;

procedure TJNTCRP008001f.StdCmnGridExistBkExpEditButtonClick(
  Sender: TObject);
var
	cMem		: TdxMemData;

    lvExpSend   :  rcJNTExpSend;
    lvExpRecv   :  rcJNTExpRecv;
    iExpRtn     :  Integer;
//    CompName    :  String;

//    sName       :  String;
    sBkCode     :  String;
    Qe          :  TMQuery;

    strExCode   :  String;

//↓<MLXDEP-3>
	dqCommonData  : TMQuery;

	iBankCD		:  	integer;		// 銀行コード
	iOfficeCD	:  	integer;		// 支店コード
	sBankName	:	string;			// 銀行名
	sBankKana	:	string;			// 銀行名カナ
	sOfficeName	:	string;			// 支店名
	sOfficeKana	:	string;			// 支店名カナ
//↑<MLXDEP-3>

begin
    iExpRtn := 0;

	if TMSeries.IsMjsLink3 = False then	//<MLXDEP-3>
	begin	//<MLXDEP-3>begin,end内を一段字下げ
		cMem := StdCmnMemDataExist;

	    strExCode := cMem.FieldByName('strExCode').AsString;

	    if  (m_nCurrentCodeAttr <= 1) then
			strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))])
	   	else
	   		strExCode	:= TrimRight(strExCode);


	    // 諸口はExpを表示しない。
	    if fnSyokuchiChk(strExCode) then
 	       Exit;

	    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
	    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
	    lvExpSend.pMjsAppRec    :=  m_pRec;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
	    lvExpSend.pCopDB        :=  @m_cDBSelect;           //TDatabaseﾎﾟｲﾝﾀ
	    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
	    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

	    lvExpSend.MasterKbn     :=  9110;               //マスタ区分＝
	    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
	    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝
	    lvExpSend.TableName     :=  'BankInfo';
    	lvExpSend.WhereStr      :=  'Masterkbn = 21 and RDelKbn = 0';
    	lvExpSend.SortStr       :=  'Order by AllBkCode,AllBraCode';

    	//共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    	iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    	if iExpRtn <>1 then  //ｷｬﾝｾﾙ
    	    Exit;


    	if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    	begin
    		Qe := TMQuery.Create( Self );					        //	MQueryの構築
		    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe );		//	DBとMQueryの接続

    		with (Qe) do
		    begin
			    Close ();
    			SQL.Clear;
			    SQL.Add('SELECT * from BankInfo WHERE NCODE = :pNcode');
    	        SetFld('pNCode').AsFloat := lvExpRecv.NCode;
			    Open;

	    		if (not Eof) then
	            begin
	        		cMem.Edit;
	                cMem.FieldByName('cBankNCode').AsFloat := lvExpRecv.NCode;

	                if cMem.FieldByName('cBankNCode').AsCurrency <> 0 then
	                begin
			        	sBkCode :=  Format('%.4d-%.3d', [GetFld ('AllBkCode').AsInteger,
	                                                GetFld ('AllBraCode').AsInteger]);

	          			cMem.FieldByName('lBkCode'  ).AsString := sBkCode;
	           			cMem.FieldByName('strBkExp' ).AsString := sBkCode;
	                end;


	                if Trim(StdCmnMemDataExistName.AsString) = '' then
	                    StdCmnMemDataExistName.AsString :=  Trim(GetFld('BankName').AsString) + '／' +
	                                            Trim(GetFld('BkBraName').AsString);

	                if Trim(StdCmnMemDataExistNameSimple.AsString) = '' then
	                    StdCmnMemDataExistNameSimple.AsString   :=
	                                   MJSKabuCut (StdCmnMemDataExistName.AsString, 14);

					// hirota 051206 >>
	                if Trim(StdCmnMemDataExistAssociation.AsString) = '' then
	                    StdCmnMemDataExistAssociation.AsString :=  Trim(GetFld('Renso').AsString);
					// hirota 051206 <<
	            end;

	            Close;
	            Free;

	        end;
	    end;


	    Keybd_Event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ

	    abort;
//↓<MLXDEP-3>
	end
	else
	begin
		try
			try
				fnCMNBankInit(m_pRec ,P_BANKDIC_BANKTENPOFIND);

				// 銀行検索エクスプローラ表示
				iExpRtn	:=	fnCMNBankShow(	iBankCD,
											iOfficeCD,
											sBankName,
											sOfficeName,
											sBankKana,
											sOfficeKana
										);

				// 呼出失敗
				if	iExpRtn = -1	then
				begin
					Abort;
				end;

				// 選択せず終了
				if	iExpRtn <> 1	then
				begin
					Exit;
				end;

			except
				MjsMessageBox(nil,'銀行検索Exp呼出に失敗しました。',mjError,mjDefOK);
			end;
		finally
			fnCMNBankFree;
		end;

		StdCmnMemDataExist.Edit;

		if	(iExpRtn = 1) then
		begin
			StdCmnMemDataExiststrBkExp.AsString		:= Format('%.4d-%.3d', [iBankCD,iOfficeCD]);
			StdCmnMemDataExistName.AsString			:= MJSKabuCut (sBankName, 18) + '/' + MJSKabuCut (sOfficeName, 18);
			StdCmnMemDataExistNameSimple.AsString	:= '';//データ上簡略はないので空を入れて置き、正式名称コピー機能に任せる
			StdCmnMemDataExistAssociation.AsString	:= sBankKana;
			StdCmnMemDataExistZenBankNM.AsString    := sBankName;
			StdCmnMemDataExistZenOfficeNM.AsString	:= sOfficeName;

			if StdCmnMemDataExistcBankNCode.AsCurrency = 0 then
			begin
	    		Qe := TMQuery.Create( Self );					        //	MQueryの構築
			    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe );		//	DBとMQueryの接続

				//Galiの時はExpでマスタを選択した時に、銀行内部コードをセットしてるのでそれに習ってここで入れる。
				//ここで銀行内部コードを入れてやらないと、update時に0が入っておかしくなる。
	    		with (Qe) do
			    begin
					Close();
		            SQL.Clear();
					SQL.Add('select MAX(BankNCode) as MAX from HojyoMA where RDelKbn = 0 and Masterkbn = 21');
					OPEN();
					if not Eof then
					begin
					    StdCmnMemDataExistcBankNCode.AsCurrency := GetFld('MAX').AsInteger +1 ;
					end;
		            Close;
		            Free;
		        end;
			end;
		end
		else
		begin
			Exit;
		end;
	end;
//↑<MLXDEP-3>

end;
//-----------------------------------------------------------------------------
// MSPFunctionBarFunctionClick
//-----------------------------------------------------------------------------
procedure TJNTCRP008001f.MSPFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
begin
    // <002>
    if MSPFunctionBar.GetFuncCaption(FuncNo) <> '' then
    begin
        case FuncNo of
            1:  m_FncInfo.Action[FuncNo-1].Execute;
            8:  Keybd_Event(VK_F8, 0, 0, 0);
        end;
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
procedure TJNTCRP008001f.FreeSetHojyoExecute(Sender: TObject);
begin

    fnFreeDlg(0);

end;
//-----------------------------------------------------------------------------
// fnFreeDlg()
//      PARAM   : nFunc         :   ﾌｧﾝｸｼｮﾝｷｰ番号
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌﾘｰ項目画面の表示
//-----------------------------------------------------------------------------
procedure TJNTCRP008001f.fnFreeDlg(nFunc: Integer);
var
    nExCode     :   String;
    nExNCode    :   Extended;
//    nDivision   :   Integer;
    nCaption    :   String;
    nType       :   Integer;
    nTblName    :   String;

//    strCode     :   String;
    strName     :   String;
//    cMem        :   TdxMemData;

begin

    fnJNTFreeDlgInit( m_pRec, @m_cComArea, @m_cDBSelect,m_cJNTArea);  //<FREEINIT> ADD
    nType           := 0;
//<047> DEL    m_UpdFreeFlg    :=  FALSE;
//<047> DEL    m_freeItem      :=  m_freeItemNull;

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
//<046> DEL                        if DtlCmnEditExCodeNumeric.Value = 0 then Exit;     // ｺｰﾄﾞ未入力時
                        nExCode     :=  Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
                    end
                    // ﾌﾘｰ属性
            		else
                    begin
                        if DtlCmnEditExCodeFree.Text = '' then Exit;        // ｺｰﾄﾞ未入力時
                        nExCode     :=  DtlCmnEditExCodeFree.Text;
                    end;
                end
                // 一覧画面時
                else
                begin
(* 未使用
                	if ( StdCmnTab.Items [0].Selected ) then
                        cMem := StdCmnMemDataExist
                    else
                        cMem := StdCmnMemDataTotal;


              		if ( cMem.RecordCount <> 0 ) then
               		begin
               			if ( m_nCurrentCodeAttr <= 1 ) then
               			begin
                            strCode   := cMem.FieldByName ('strExCode') .AsString;
                            nExCode   := Format ('%.16d', [StrToInt(strCode)])
                  		end else
                            nExCode   := cMem.FieldByName ('strExCode') .AsString;
               		end;
*)
                end;

                fnGetHojyoMA(MASTER_BANK,nExCode,strName,nExNCode);

                nTblName    :=  'HojyoMA';
                nCaption    :=  '銀行補助ｺｰﾄﾞ';
                //nType       :=  MASTER_BANK;   //<037>
                nType       :=  MMEI_GINKOU_S;   //<037>
            end;
        end;

        // ﾌﾘｰ項目ﾀﾞｲｱﾛｸﾞ表示内容変更
        //  第1引数 対象ﾃｰﾌﾞﾙ名
        //  第2引数 内部ｺｰﾄﾞﾌｨｰﾙﾄﾞ識別子
        //  第3引数 外部ｺｰﾄﾞﾌｨｰﾙﾄﾞ識別子
        //  第4引数 簡略名称ﾌｨｰﾙﾄﾞ識別子
        //  第5引数 ｷｬﾌﾟｼｮﾝ名称
        //  第6引数 ﾏｽﾀ区分

        fnJNTFreeDlgInfo('HojyoMA', 'NCode', 'GCode', 'SimpleName', nCaption, nType);

        if ( nExNCode <> 0 ) then
        begin
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
    except
    end;

end;
//-----------------------------------------------------------------------------
// fnSetFncType()
//      PARAM   : nDspType  :   表示識別子
//      VAR     :
//      RETURN  :
//      MEMO    : ﾌｧﾝｸｼｮﾝｷｰ/ｲﾍﾞﾝﾄの設定
//-----------------------------------------------------------------------------
procedure TJNTCRP008001f.fnSetFncType(nDspType: Boolean ;ifuncNo : Integer);
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
				if TMSeries.IsMjsLink3 = False then //<MLXDEP>
				begin						//<MLXDEP>begin,end内を一段字下げしました。
	                m_FncInfo.Caption[iFuncNo] := 'F1 ﾌﾘｰ項目登録';
	                m_FncInfo.Action [iFuncNo] := FreeSetHojyo;
				end;						//<MLXDEP>
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
// BChangeClick()
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP008001f.BChangeClick(Sender: TObject);
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

//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/03/16
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     iMKbn   : ﾏｽﾀ区分
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP008001f.fnDelCheck(exNCode: Extended; iMKbn: Integer; var strErr: String): Boolean;
var
    iRet        : Integer;
begin
//↓<MLXDEP-2>
	if TMSeries.IsMjsLink3 = True then
	begin
        Result := True;
		Exit;
	end;
//↑<MLXDEP-2>
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
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行 <032>
//	Name		:	S.Suzuki
//	Date		:	2007/12/11
//	Parameter	:   iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008001f.SessionPractice(iSyori : Integer);
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
function TJNTCRP008001f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

// <035> ADD-STR
//**********************************************************************
//		Proccess	:   債務/経費精算自動仕訳申請状況チェック
//		Name		:   T.SATOH(IDC)
//		Date		:   2009/02/03
//		Parameter	:
//		Return		:   修正可否
//		History		:   9999/99/99
//**********************************************************************
function TJNTCRP008001f.fnAllowEdit (): Boolean;
const
    iSwkForm    : Integer = 6061;
var
	objQuery    : TMQuery;
    iLoop       : Integer;
    bIsWF       : Boolean;
begin
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
// <035> ADD-END

//<MLXDEP-5>↓
//**********************************************************************
//*		Proccess	:日付を文字列に変換して返す
//*		Name		:
//*		Date		:
//*		Parameter	:
//*		Return		:
//**********************************************************************
function TJNTCRP008001f.DateToStrTmp(date: TDateTime; sts: String): String;
var
	strDate	: String;
	iTmp	: Integer;
begin

	Result := '';

	if date = 0 then
		exit;
	if sts = 'S' then							// 開始日の場合
	begin
		if date = DEF_S_DATE then				// デフォルト値の場合
			exit;								// 空白
	end
	else if sts = 'E' then						// 終了日の場合
	begin
		if date = DEF_E_DATE then				// デフォルト値の場合
			exit;								// 空白
	end;

	if	(m_nDateFormatDivision = 0) then															// 和暦/西暦区分: 0=和暦
	begin
		// 元号
		strDate	:= MjsDateCtrl.MjsGetGengou(date, MdtCMP_YMD);	// 元号取得

		iTmp := MjsDateCtrl.MjsDateToInt6(date, MdtWAREKI);
		// 年
		strDate :=	strDate + Format (' %.2d', [iTmp div 10000]);
		iTmp := (iTmp mod 10000);
		// 月
		strDate :=	strDate + Format ('/%.2d', [iTmp div 100]);
		iTmp := (iTmp mod 100);
		// 日
		strDate :=	strDate + Format ('/%.2d', [iTmp]);
	end
	else																							// 和暦/西暦区分: 1=西暦
	begin
		strDate :=	DateToStr(date);
	end;
	Result := strDate;
end;
//<MLXDEP-5>↑

end.
//***********************************************************************************************************/
//*																											*/
//* End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/





