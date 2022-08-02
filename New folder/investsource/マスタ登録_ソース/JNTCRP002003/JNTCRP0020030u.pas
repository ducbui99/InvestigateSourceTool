//************************************************************************
//*
//*		Systeme			:	FX共通マスタ
//*		Program			:	部門登録
//*		ProgramID		:	JNTCRP0020030
//*		Name			:	広田　茂雄（プライム）
//*		Create			:	2005/02/XX
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX  XX修正者XX（所属）
//*                                     XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	00/12/21 HIS0001  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						PopupMenuの合計部門追加(fnCmnTreeViewPopupMenuAddTotal),
//*						実在部門追加(fnCmnTreeViewPopupMenuAddExist)をPopupMenu
//*						から削除する
//*	00/12/25 HIS0002  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						区分によって参照・入力を切り替える
//*	00/12/28 HIS0003  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						印刷時にﾍﾟｰｼﾞの最終明細行の下線を太する
//*	01/1/5	 HIS0004  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						帳票ｸﾞﾙｰﾌﾟNoをPrnSupportへ渡す
//*	01/1/5	 HIS0005  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						HojyoMAに内部ｺｰﾄﾞ2がのﾌｨｰﾙﾄﾞが追加されたのでその対応
//*	01/1/10	 HIS0006  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						KmkTree2を呼ぶ処理
//*	01/1/11	 HIS0007  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ﾌｧｲﾙ出力変更
//*	01/1/30	 HIS0008  H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ｽﾄｱﾄﾞの初期処理
//*
//* 2002/04/17 HIS0009  Y.Ichihashi	Insert＆UpDateのSQL文の変更
//*								   （''をDBに書き込もうとするとエラーになるため）
//* 2002/04/18 HIS0010  Y.Ichihashi	ﾌﾘｰｺｰﾄﾞの右スペースはｶｯﾄ
//* 2002/04/23 HIS0011  Y.Ichihashi	同一ｺｰﾄﾞのときエラーメッセージを表示する
//*	2002/04/26 HIS0012  Y.Ichihashi 分類の親が体系のときはPOPUPメニューの
//*									「他の加算先へコピー」は使用不可
//*	2002/05/01 HIS0013  Y.Ichihashi	詳細画面でｺﾝﾎﾟｰﾈﾝﾄがｸﾞﾚｰのときマウスで
//*									ｸﾘｯｸしたときﾌｫｰｶｽを持ってしまうのを修正
//*	2002/07/02 HIS0014	Y.Ichihashi	加算先、加算元のコードが同じ時は削除
//*	2002/07/02 HIS0015	Y.Ichiahshi	同じコードでもノードが違う時は移動は不可
//*	2002/07/17 HIS0016	Y.Ichihashi	ﾂﾘｰﾋﾞｭｰ未接続ｱｲﾃﾑ追加処理での総合計への未接続アイテムを
//*									コード順に関係なくEntoNoを100ずつ足していく
//*	2002/07/18 HIS0017	Y.Ichihashi	総合計にぶら下がっている実在はコード順にする
//* 2002/08/28 HIS0018	Y.Ichihashi	部署で部門を登録されている時は削除できないｴﾗｰﾒｯｾｰｼﾞを表示
//* 2002/10/18 HIS0019	Y.Ichihashi EntNo再付番でのSQL文の条件追加（HojyoTreeがおかしくなって
//*									何回かDrog&Dropしたときに無限ループされた状態になってしまうため）
//*	2002/11/15 HIS0020	Y.Ichihashi	詳細画面でのコードで検索エクスプローラで選択出来るように対応
//*	2002/11/27 HIS0021	Y.Ichihashi	印刷で連想順選択された時のデータの取得を変更
//*	2003/01/10 HIS0022	Y.Ichihashi	B/S計上部門が印刷・プレビュー・ファイル出力の処理がされていないので追加
//*	2003/01/14 HIS0023	Y.Ichihashi	新規登録されたかチェック（出力順序設定の見直しが必要な為）
//* 2003/03/25 HIS0024  Y.Ichihashi Treeにコードを表示する
//* 2003/06/27 HIS0025  Y.Ichihashi 排他制御
//* 2003/10/07 HIS0026  Y.Ichihashi 「並び替え」ボタン追加
//* 2004/01/14 HIS0027  Y.Ichihashi 排他制御仕様変更のため修正
//* 2004/06/24 HIS0028  Y.Ichihashi 検索処理対応
//* 2004/12/10 HIS0029  Y.Ichihashi 解像度対応
//* 2004/12/24 HIS0030  Y.Ichihashi PopupMenuに「全て展開」「全て閉じる」を追加
//******************************************************************************
//* 2005/04/01  FX10000 M.KATSUNUMA JNT共通関数対応
//*                                     uses 順番変更
//*                                     MasWndIF関係 JNT化
//*                                     MasTreee2Dlg関係 JNT化
//*                                     MasComu関係 JNT化
//*                                     include 変更
//* 2005/11/30  FX10001 K.Katou     履歴用ｽﾄｱﾄﾞ呼び出し
//* 2006/02/22  <CHK>   y.Aoki      削除ﾁｪｯｸ追加
//* 2006/02/22  <001>   y.Aoki      JNTConst.incをｲﾝｸﾙｰﾄﾞ
//* 2006/02/27  <002>   y.Aoki      終了時エラー対応
//* 2006/03/02  <003>   y.Aoki      ｺｰﾄﾞ未入力のときﾌﾟﾚﾋﾞｭｰで倍率変更可にするよう修正
//* 2006/03/16  <004>   K.Katou     削除ﾁｪｯｸｽﾄｱﾄﾞ追加
//* 2006/03/23  <005>   y.Aoki      ｺｰﾄﾞ未入力のときSift+Tabでﾀﾌﾞに移動できるよう修正
//* 2006/03/24  <006>   y.Aoki      詳細画面で項目が全て空の場合に編集中のﾒｯｾｰｼﾞが出ないよう修正
//* 2006/03/24  <007>   y.Aoki      Tab上で右・左に移動したときﾌｫｰｶｽはTabのままになるよう修正
//* 2006/03/24  <008>   y.Aoki      ｺｰﾄﾞから左・上でTabに移動しないよう修正
//* 2006/03/29  <009>   y.Aoki      Tab上で↑・Sift+Tabで移動しないよう修正
//* 2006/03/30  <010>   K.Katou     ｾｸﾞﾒﾝﾄのｺﾝﾎﾞ動作不具合を修正
//* 2006/03/30  <011>   K.Katou     登録権限のない時に総合計・諸口が登録できる不具合修正 その他権限処理見直し
//* -------- ここからは人事給与チーム引き取り後の修正 --------
//*
//* 2006/09/13 T.Shinoda(Lab)	<000001>「実在部門登録リスト[分類、セグメント型]」印刷時に
//* 							        部門分類（セグメント分類）の不採用時に表示されるメッセージを修正
//* 2007/03/23 S.Hirota(PRIME)	<マスタ同期>
//*	2007/04/10 T.ABE (BUNTECHNO) <070410>		・合計ﾀﾌﾞに切替える時に日付にﾌｫｰｶｽがある時はﾌｫｰｶｽ移動する
//*												・ﾀﾌﾞを切替える時は削除ﾎﾞﾀﾝを無効にする
//*												・ﾀﾞｲｱﾛｸﾞでOK以外は同じ動作にする
//* 2007/04/23 S.Suzuki(PRIME)      <012>		SecHojyoDispInfoのﾒﾝﾃﾅﾝｽ
//*	2007/05/08 S.Suzuki(PRIME)      <013>		配信ﾀﾞｲｱﾛｸﾞの追加
//* 2007/05/17 S.Suzuki(PRIME)      <014>		自社へ関連付けをするときのﾒｯｾｰｼﾞに全社に登録済みの
//*												ﾏｽﾀ簡略名称を表示するように修正
//* 2007/06/27 S.Suzuki(PRIME)      <015>		表示権限のみで詳細表示中に諸口ｺｰﾄﾞを入力してもｴﾗｰにならないように修正
//* 2007/06/27 S.Suzuki(PRIME)      <016>		詳細表示中に取消ﾎﾞﾀﾝで諸口をｸﾘｱするように修正
//* 2007/07/10 S.Hirota(RPIME)      <IDS>		人事異動シミュレーション対応
//* 2007/08/09 S.Suzuki(PRIME)      <017>		配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//* 2007/08/28 S.Hirota(RPIME)      <IDS2>		人事異動シミュレーション対応
//* 2008/02/14 T.Shinoda(Lab)		<080214_1>	合計部門の適用期間入力対応
//* 								<080214_2>	ﾏｽﾀ更新履歴対応
//* 2008/03/11 T.Shinoda(Lab)		<080311>	部門登録と他の処理の画面を切り替えた後
//*												部門登録の詳細画面で既存部門をロードでエラー発生する不具合を修正
//*	2008/06/11 H.Takaishi(TakumiCo.)<2008-06-11>印刷履歴対応
//* 2008/08/26 T.Shinoda(Lab)		<080826>	セグメント削除チェック修正
//* 2008/09/02 T.Shinoda(Lab)		<080902>	改行コードを除去してから更新するように修正
//* 2008/11/26 T.Shinoda(Lab)		<MLWK>		MLワークフロー対応(実在部門は参照、合計は編集可能)
//* 2009/04/07 T.Shinoda(Lab)		<090407>	・部門登録側で適用期間変更、削除などを行った時の対応
//* 2009/06/15 T.Shinoda(Lab)		<090615>	・合計、諸口の詳細で新規コード入力時に適用期間欄が表示されない不具合修正
//* 2009/06/16 T.Shinoda(Lab)		<090616>	・削除ボタンの制御を修正
//* 2009/06/19 T.Shinoda(Lab)		<090619>	・メッセージの文言を修正
//* 2009/07/21 T.Shinoda(Lab)		<090721_1>	・適用期間に1900/01/01～2099/12/31の範囲外の日付が
//*												　設定されていた場合でもグリッドに表示する。
//*									<090721_2>	・グリッド入力中のTABキーによる移動を修正
//* 2009/07/22 T.Shinoda(Lab)		<090722_1>	・適用期間に1900/01/01～2099/12/31以外の日付が入力できないように修正
//*									<090722_2>	・コードが重複したデータをロード時に読み込む対象が不定だった件を修正
//* 2009/07/24 T.Shinoda(Lab)		<090724>	・削除時に1行目に移動で削除ボタン等が有効にならない不具合を修正
//* 2009/09/24 T.Shinoda(Lab)		<090924>	・検索EXPに渡すパラメータを修正
//* 2009/10/26 T.Shinoda(Lab)		<091026>	・部門が未登録の会社で異動ｼﾐｭﾚｰｼｮﾝの部門登録を行うとｴﾗｰとなる件を修正
//* 2010/02/15 T.Shinoda(Lab)		<100215_1>	・一覧型の適用期間入力対応
//*									<100215_2>	・合計部門登録リストの適用期間出力対応
//* 2010/02/17 T.Shinoda(Lab)		<100217>	・諸口と総合計に適用日を入力できる不具合を修正
//* 2010/03/23 T.Shinoda(Lab)		<100323>	・諸口の分類を変更できないように修正
//* 2010/04/05 T.Shinoda(Lab)		<100405>	・フリー項目登録リスト新規作成
//* 2010/05/24 T.Shinoda(Lab)		<LPH>		・LoadPackageHelper対応
//* 2010/06/15 T.Shinoda(Lab)		<100615>	・一覧型の適用期間のチェックの不具合を修正
//* 2010/06/17 T.Shinoda(Lab)		<100617>	・セグメント2以降のフリー項目登録リストが正常に動作しない不具合を修正
//* 2010/06/30 T.Shinoda(Lab)		<100630>	・ファンクションが常に表示されている為、
//*												　フリー項目登録ダイアログをいつでも呼び出せる不具合を修正
//* 2010/08/27 T.Shinoda(Lab)		<100827>	・コードに数値以外の文字を入力した時にエラーが発生する不具合を修正。
//* 2010/09/03 T.Shinoda(Lab)		<100903>	・ファンクションが非表示時でもF1キーが有効になっていた不具合を修正。
//* 2010/09/06 T.Shinoda(Lab)		<100906>	・<100903>不具合を修正。
//* 2010/09/07 T.Shinoda(Lab)		<100907>	・検索エクスプローラーで同じコードを選択すると、
//*												　次の入力時にチェンジイベントが発生しない不具合を修正。
//* 2010/12/03 T.Shinoda(Lab)		<101203>	・ファイル出力の日付項目に和暦/西暦区分が有効になるように修正
//* 2010/12/08 T.Shinoda(Lab)		<101208>	・印刷ダイアログでキャンセルしてもメッセージが表示される不具合を修正。
//* 2011/01/31 T.Shinoda(Lab)		<110131_1>	・同じ日の適用開始日と適用終了日の入力を可能に対応。
//*									<110131_2>	・部門分類コードクリアで名称が消えない不具合修正。
//*									<110131_3>	・詳細登録で、未選択時に「F1 フリー項目登録」使用不可に修正。
//*									<画面>		・グリッドの下にScrollBoxを設置。
//* 2011/08/01 T.Shinoda(Lab)		<110801>	・合計グリッド新規行の動作を修正
//* 2012/05/17 T.Shinoda(Lab)		<120517>	・消費税95％ルール改正対応
//*	2013/01/11 K.Iwata(NTC)			<MLXDEP>	・MLX固定資産・リース資産対応
//*	2013/01/25 T.Shinoda(Lab)		<MLXHAP>	・MLX給与大将対応
//* 2013/02/08 T.Shinoda(Lab)		<130208>	・Enterキー対応
//* 2013/07/10 T.Shinoda(Lab)		<130710>	・タブ切り替え時に[F8 正式名称コピー]が消えない不具合修正
//* 2013/10/01 T.Shinoda(Lab)		<131001>	・タブにフォーカス時に[F8 正式名称コピー]が消えない不具合修正(<130710>の修正漏れ)
//*	2014/09/04 T.Shinoda(Lab)		<MLXDSP>	・MLX拡大率対応
//*	2016/02/22 T.Shinoda(Lab)		<FREEINIT>	・複数画面起動時にフリー項目ダイアログの起動制御が正しく行われていない不具合対応
//*	2016/02/24 T.Shinoda(Lab)		<160224>	・修正権限がない場合にフリー項目ダイアログのデータが表示できない
//*	2017/09/07 T.Shinoda(Lab)		<Edge>		・Edge Tracker 連携対応 削除メッセージ追加
//*	2018/10/11 T.Shinoda(Lab)		<Edge_2>	・Edge Tracker 連携対応 MJSLINK NX-I / Galileopt NX-I に 対応
//*	2018/11/26 T.Shinoda(Lab)		<Edge_3>	・Edge Tracker 連携対応 MLX系資産で削除メッセージのロジックを通る不具合修正
//*	2019/03/08 R.Kobayashi(TakumiCo)<NewEra>	・新元号対応(HAPのincファイルを参照しています)
//*													[HAPEraNameCtrl_H.inc]
//*													[HAPEraNameCtrl_B.inc]
//*	2019/04/02 R.Kobayashi(TakumiCo)<190402>	・うるう年が入力エラーになる現象を修正
//*	2020/01/28 T.Doi(CyberCom)		<D10-U>		・Delphi10 Unicode対応
//*	2020/03/05 N.Honda(CyberCom)	<D10-P>		・Delphi10 ストアドデータ型エラー対応
//*	2020/03/09 Y.Iwakawa			<D10-Stored>・ストアドプロシージャ対応
//*												・m_SPMsHistのTanNCodeはFloat→Currencyのまま（D10-P戻し）
//* 2020/09/20 K.Shinbo(MJS)        <D10_OwnMapRules>・D10 不具合管理票No.951に対する修正
//******************************************************************************
unit JNTCRP0020030u;

interface

uses
  JNTCommonu,
  JNTFuncU,
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Buttons, CommCtrl, VCL.ExtCtrls, ComCtrls, VCL.ImgList, VCL.StdCtrls, FireDAC.Comp.Client, ToolWin,
  Db, Menus,
  dxDBGrid, dxCntner, dxGrClms, dxTL, dxmdaset,
  dxExEdtr,
  ppPrnabl, ppClass, ppCtrls, ppModule, {daDatMod,} ppDB, ppBands, ppCache,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar,
  MJSCommonu, MJSCommon2u, MJSDBModuleu, MJSDispCtrl, MJSDateCtrl, MJSStrCtrl,
  MJSQuery, MJSMsgStdu, MJSEdits, MJSBitBtn, MJSRadioButton, MJSSpeedButton,
  MJSPanel, MJSLabel, MJSFunctionBar, MJSSPFunctionBar, MJSMemo, MJSTab,
  MJSPageControl, MJSGroupBox, MJSComboBox, MJSCheckBox, MJSExceptu,
  MJSPreviewIFu, MjsPrnDlgu, MjsPrnSupportu,
  MjsKeyDataState,	//<130208>
//<LPH>↓
  MLBplLoaderu,
//<LPH>↑
  JNTMasComu, JNTMasTree2IFu, //JNTMasWndIFu, JNTMasTreee2Dlgu,
  SeriesCheckU,//<MLXDEP>
  SeriesCheck2U,	//<Edge>
// 印刷対応 050803 >>
  JNTSelCorpSys,
  JNTExpGlobal,   // <999>
  JNTPDlg,        // <999>
// 印刷対応 050803 <<
  JNTCRP0020032u, MJSStatusBar, MJSToolBar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  ppDesignLayer, ppParameter, System.ImageList, FireDAC.Comp.DataSet,
  Variants;

//{$DEFINE _NOT_PRINT_}

type
	SelectValidItem = record
			nMasterDivision: Integer;				// ﾏｽﾀ区分 (41:部門, 42:ｾｸﾞﾒﾝﾄ1, 43:ｾｸﾞﾒﾝﾄ2...)
			strItemCaption : string;				// 補助	名称(実在)
			nCodeDigit     : Integer;				// ｺｰﾄﾞ桁数 (3～10桁)
			nCodeAttribute : Integer;				// ｺｰﾄﾞ属性 (0:数字, 1:数字(前ｾﾞﾛあり), 2:ﾌﾘｰ)
			nAdoptDivision : Integer;				// 採用区分 (1:P/Lのみ採用, 2:B/S&P/L採用)
end;

type
	TreeViewRec  = record
			nDivision: Byte;
			strExCode: string;
			strName  : string;
end;

type
	TagInfo	= record
			fChecked  : Boolean;
			strComment: string;
end;

type
	MasterData	= record
			nDivision	   : Integer;				// 実在/合計区分
			strExCodeParent: String;				// 補助外部ｺｰﾄﾞ(親)
			strExCode	   : String;				// 補助外部ｺｰﾄﾞ
			strAssociation : String;				// 連想
			strName		   : String;				// 正式名称
			strNameSimple  : String;				// 簡略名称
			nClassCode	   : Integer;				// 部門分類ｺｰﾄﾞ
			fDetails	   : Boolean;				// 詳細更新区分
			nCharacterCode : Integer;				// 部門性格ｺｰﾄﾞ
			nCmnStDivision : Integer;				// 共通仕入部門区分
			nAppDateStart  : Integer;				// 適用開始年月日
			nAppDateEnd    : Integer;				// 適用終了年月日
			strExCodeBSAdd : String;				// B/S計上部門外部ｺｰﾄﾞ
			strNCode   	   : String;				// 内部ｺｰﾄﾞ
			//▼▼▼▼▼
			BunruiNCode    : array [1..10] of String;
			SegNCode       : array [1..10] of String;
			//▲▲▲▲▲
end;

type
	PrintDstData	= Record
			strExCode     : String;					// 補助外部ｺｰﾄﾞ
			strNameSimple : String;					// 簡略名称
end;

type
	PrintSystemRec	  = Record
						nDivision	  : Integer;
						strExCode	  : String;
						strDescription: String;
end;

  {$include JNTCRPSyncMasterH.inc}                  // <マスタ同期> ﾏｽﾀ同期共通ﾍｯﾀﾞ部

//--- HIS0028 St -----
//	検索情報 構造体
type
	SearchInfoRec = Record
		sBmnCD	:	String;		    // 検索部門
		iItem	:	Integer;		// 検索するItemの位置
		iStItem	:	Integer;		// 最初に一致したItemNo
		bFstFlg	:	Boolean;		// 初回判定ﾌﾗｸﾞ
end;
//--- HIS0028 Ed -----

const
	WM_ONPAINT			= WM_APP + 1;	//OnPaint 時の処理起動メッセージ用
	WM_ONDISCONTINUE	= WM_APP + 2;
{$I JNTConst.inc}                                //<001>

type
{$include ActionInterface.inc} 			 	// ｱｸｼｮﾝｲﾝﾀｰﾌｪｲｽの追加
{$I JNTMASFUSENBIKODLGIFH.inc}                          //FX10000
//{$I JNTMASSEARCHDLGIFH.inc}     // 検索DLG  //HIS0028   //FX10000
//{$I JNTMASExceptIFI.inc}                    //HIS0025   //FX10000
//{$I JNTMASExceptIFH.inc}                    //HIS0025   //FX10000
{$I HAPEraNameCtrl_H.inc}					  //<NewEra>

{$I JNTSyncMasterIFH.inc}  					// <013> ADD

  TJNTCRP0020030f = class(TForm)
    CmnToolBar: TMPanel;
    CmnButtonToolbarExit: TMSpeedButton;
    CmnToolbarButtonPrint: TMSpeedButton;
    CmnToolbarButtonChange: TMSpeedButton;
	CmnToolbarButtonDelete: TMSpeedButton;
    CmnSplitter: TSplitter;
	StdCmnClientPanel: TMPanel;
    DtlCmnClientPanel: TMPanel;
    DtlCmnScrollBox: TScrollBox;
    DtlCmnEditAppDateStart: TMDateEdit;
    DtlCmnLabelAppDateAddtion: TMLabel;
    DtlCmnLabelAppDateTitle: TMLabel;
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
    StdCmnMemDataExistStartDate: TDateField;
    StdCmnMemDataExistEndDate: TDateField;
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
    StdCmnMemDataExistgrTag: TGraphicField;
    StdCmnMemDataTotalgrTag: TGraphicField;
    StdCmnGridPopupMenu: TPopupMenu;
    StdCmnGridPopupMenuTag01: TMenuItem;
    StdCmnGridPopupMenuTag03: TMenuItem;
    StdCmnGridPopupMenuTag02: TMenuItem;
	StdCmnGridPopupMenuTag04: TMenuItem;
    CmnToolbarButtonDetail: TMSpeedButton;
    CmnTreeViewPopupMenuDetail: TMenuItem;
    StdCmnMemDataExistnAdoptDivision: TIntegerField;
    StdCmnMemDataExiststrAdoptComment: TStringField;
    DtlCmnEditSumDivision: TMNumEdit;
    StdCmnMemDataExistnAdoptData01: TSmallintField;
    StdCmnMemDataClass: TdxMemData;
    StdCmnMemDataClassDivision: TIntegerField;
    StdCmnMemDataClassDescription: TStringField;
    CmnMemDataPrintExtStandard: TdxMemData;
    CmnPipelinePrintExtStandard: TppDBPipeline;
    CmnDataSourcePrintExtStandard: TDataSource;
    CmnMemDataPrintExtStandardstrExCode: TStringField;
    CmnMemDataPrintExtStandardstrName: TStringField;
    CmnMemDataPrintExtStandardstrNameSimple: TStringField;
    CmnReportExtStandardDep: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine49: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLabel50: TppLabel;
	ppLabel51: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    CmnReportExtStandardDepLabelCorpCode: TppLabel;
    CmnReportExtStandardDepLabelCorpName: TppLabel;
    CmnReportExtStandardDepLabelTitle: TppLabel;
    CmnReportExtStandardDepLineTitle: TppLine;
    CmnReportExtStandardDepSysVarDate: TppSystemVariable;
    ppDetailBand_StandardDep: TppDetailBand;
    ppStandardDepUnderLine: TppLine;
    CmnReportExtStandardDepDBTextCode: TppDBText;
	ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine65: TppLine;
    ppFooterBand3: TppFooterBand;
    CmnReportExtStandardDepSysVarPage: TppSystemVariable;
    ppLabel62: TppLabel;
    CmnReportExtStandardBSBumonCode: TppDBText;
    ppDBText103: TppDBText;
    ppLine67: TppLine;
    ppLine68: TppLine;
    CmnMemDataPrintExtStandardstrClassDesc: TStringField;
    DtlCmnTab: TMTab;
    ppDBText13: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine16: TppLine;
    ppDBText21: TppDBText;
    ppLine18: TppLine;
    CmnReportExtStandardDepDBTextAppDateStart: TppDBText;
    ppLine19: TppLine;
    CmnReportExtStandardDepDBTextAppDateEnd: TppDBText;
	ppLine20: TppLine;
    CmnReportExtStandardDepDBTextUpdateDate: TppDBText;
    ppLine21: TppLine;
    ppLabel6: TppLabel;
    ppLine28: TppLine;
    ppLabel7: TppLabel;
    ppLine29: TppLine;
    ppLabel9: TppLabel;
    ppLine30: TppLine;
    ppLabel13: TppLabel;
    CmnMemDataPrintExtStandardgrTag: TGraphicField;
    CmnMemDataPrintExtStandardstrAssociation: TStringField;
    CmnMemDataPrintExtStandardstrCharacterDesc: TStringField;
	CmnMemDataPrintExtStandardstrExCodeBSAdd: TStringField;
    CmnMemDataPrintExtStandardstrNameSimpleBSAdd: TStringField;
    CmnMemDataPrintExtStandardflCostRate: TFloatField;
    CmnMemDataPrintExtStandardstrCmnStockDesc: TStringField;
    CmnMemDataPrintExtStandarddtUpdateDate: TDateTimeField;
    ppDBImage1: TppDBImage;
    CmnReportTtlStandard: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLine38: TppLine;
    ppLine64: TppLine;
    ppLine66: TppLine;
    ppLine73: TppLine;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    CmnReportTtlStandardLabelCorpCode: TppLabel;
    CmnReportTtlStandardLabelCorpName: TppLabel;
    CmnReportTtlStandardLabelTitle: TppLabel;
    CmnReportTtlStandardLineTitle: TppLine;
    CmnReportTtlStandardSysVarDate: TppSystemVariable;
    ppLabel40: TppLabel;
    ppDetailBand_TtlStandard: TppDetailBand;
    ppTtlStandardUnderLine: TppLine;
    CmnReportTtlStandardDBTextCode: TppDBText;
    ppDBText29: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
	ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    CmnReportTtlStandardDBTextUpdateDate: TppDBText;
    ppDBImage3: TppDBImage;
    ppFooterBand4: TppFooterBand;
    CmnReportTtlStandardSysVarPage: TppSystemVariable;
    CmnDataSourcePrintTtlStandard: TDataSource;
    CmnMemDataPrintTtlStandard: TdxMemData;
    CmnMemDataPrintTtlStandardgrTag: TGraphicField;
	CmnMemDataPrintTtlStandardstrExCode: TStringField;
    CmnMemDataPrintTtlStandardstrName: TStringField;
    CmnMemDataPrintTtlStandardstrNameSimple: TStringField;
    CmnMemDataPrintTtlStandardstrAssociation: TStringField;
    CmnMemDataPrintTtlStandarddtUpdateDate: TDateTimeField;
    CmnPipelinePrintTtlStandard: TppDBPipeline;
    CmnImageGeneral: TImageList;
    CmnReportExtStandardDepAccOffice: TppLabel;
    CmnReportTtlStandardAccOffice: TppLabel;
    CmnTreeViewPopupMenuTagBreak: TMenuItem;
    CmnTreeViewPopupMenuTagOff: TMenuItem;
    N1: TMenuItem;
    StdCmnGridPopupMenuTagOff: TMenuItem;
    CmnToolbarDropDownMenu: TPopupMenu;
    CmnToolbarDropDownMenuTag01: TMenuItem;
    CmnToolbarDropDownMenuTag02: TMenuItem;
    CmnToolbarDropDownMenuTag03: TMenuItem;
    CmnToolbarDropDownMenuTag04: TMenuItem;
    DtlCmnPopupMenuTagOff: TMenuItem;
    DtlCmnPopupMenuTagComment: TMenuItem;
    MenuItem2: TMenuItem;
    DtlCmnPopupMenuTag01: TMenuItem;
    DtlCmnPopupMenuItemTag01: TMenuItem;
    DtlCmnPopupMenuItemTag01Ex: TMenuItem;
    DtlCmnPopupMenuTag02: TMenuItem;
    DtlCmnPopupMenuItemTag02: TMenuItem;
	DtlCmnPopupMenuItemTag02Ex: TMenuItem;
    DtlCmnPopupMenuTag03: TMenuItem;
    DtlCmnPopupMenuItemTag03: TMenuItem;
    DtlCmnPopupMenuItemTag03Ex: TMenuItem;
    DtlCmnPopupMenuTag04: TMenuItem;
    DtlCmnPopupMenuItemTag04: TMenuItem;
    DtlCmnPopupMenuItemTag04Ex: TMenuItem;
    StdCmnGridPopupMenuTagComment: TMenuItem;
    StdCmnGridPopupMenuItemTag01: TMenuItem;
    StdCmnGridPopupMenuItemTag02: TMenuItem;
    StdCmnGridPopupMenuItemTag03: TMenuItem;
    StdCmnGridPopupMenuItemTag04: TMenuItem;
    StdCmnGridPopupMenuItemTag01Ex: TMenuItem;
	StdCmnGridPopupMenuItemTag02Ex: TMenuItem;
    StdCmnGridPopupMenuItemTag03Ex: TMenuItem;
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
    PopupMenu1: TPopupMenu;
    CmnReportPopupMenuImage01: TMenuItem;
    CmnReportPopupMenuImage02: TMenuItem;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    MPanel1: TMPanel;
	CmnStatusBar: TMStatusBar;
    ProgressBar1: TProgressBar;
    N2: TMenuItem;
    CmnTreeViewPopupMenuAllOpen: TMenuItem;
    CmnTreeViewPopupMenuAllClose: TMenuItem;
    MPanel4: TMPanel;
    StdCmnTab: TMTab;
    MLine1t: TMLabel;
    DtlCmnEditAppDateEnd: TMDateEdit;
    Panel1: TMPanel;
    PDtlMasPanel: TMPanel;
    MLabel8: TMLabel;
    DtlCmnLabelExCodeBSAddTitle: TMLabel;
	DtlCmnEditExCodeBSAddNumeric: TMNumEdit;
    DtlCmnLabelExCodeBSAddDesc: TMLabel;
    DtlCmnLabelClassDesc: TMLabel;
    DtlCmnEditClassCode: TMNumEdit;
    DtlCmnLabelClassTitle: TMLabel;
    DtlCmnLabelCharacterTitle: TMLabel;
    DtlCmnEditCharacterCode: TMNumEdit;
    DtlCmnLabelCharacterDesc: TMLabel;
    DtlCmnLabelCommonStockDesc: TMLabel;
    DtlCmnEditCommonStockDivision: TMNumEdit;
    DtlCmnLabelCommonStockTitle: TMLabel;
    DtlCmnEditExCodeBSAddFree: TMTxtEdit;
    PDtlDepPanel: TMPanel;
    MLabel12: TMLabel;
    DtlCmnLabelHonsitenTitle: TMLabel;
    DtlCmnLabelDfKeihiTitle: TMLabel;
    DtlCmnEditDfKeihiCode: TMNumEdit;
    DtlCmnEditHonsitenCodeNumeric: TMNumEdit;
    DtlCmnLabelHonsitenDesc: TMLabel;
    DtlCmnLabelDfKeihiDesc: TMLabel;
    MPanel2: TMPanel;
    DtlCmnButtonUpdate: TMBitBtn;
    DtlCmnButtonCancel: TMBitBtn;
    StdCmnMemDataExistnInCode: TStringField;
    StdCmnMemDataTotalnInCode: TStringField;
	PDtlBiCdPanel: TMPanel;
    MLabel18: TMLabel;
    ScrollBox3: TScrollBox;
    MLabel9: TMLabel;
    MLabel10: TMLabel;
    MLabel27: TMLabel;
    MLabel28: TMLabel;
    MLabel29: TMLabel;
    MLabel19: TMLabel;
    MLabel20: TMLabel;
    MLabel21: TMLabel;
    MLabel22: TMLabel;
    MLabel23: TMLabel;
	MLabel5: TMLabel;
    MLabel40: TMLabel;
    MLabel41: TMLabel;
    MLabel42: TMLabel;
    MLabel43: TMLabel;
    MLabel44: TMLabel;
    MLabel45: TMLabel;
    MLabel46: TMLabel;
    MLabel47: TMLabel;
    MLabel48: TMLabel;
    DtlCmnEditBunruiCD1: TMTxtEdit;
    DtlCmnEditBunruiCD2: TMTxtEdit;
    DtlCmnEditBunruiCD3: TMTxtEdit;
    DtlCmnEditBunruiCD4: TMTxtEdit;
    DtlCmnEditBunruiCD5: TMTxtEdit;
    DtlCmnEditBunruiCD6: TMTxtEdit;
    DtlCmnEditBunruiCD7: TMTxtEdit;
    DtlCmnEditBunruiCD8: TMTxtEdit;
    DtlCmnEditBunruiCD9: TMTxtEdit;
    DtlCmnEditBunruiCD10: TMTxtEdit;
    PDtlSegCdPanel: TMPanel;
    MLabel6: TMLabel;
    ScrollBox4: TScrollBox;
    MLabel30: TMLabel;
    MLabel31: TMLabel;
    MLabel32: TMLabel;
    MLabel33: TMLabel;
    MLabel34: TMLabel;
	MLabel35: TMLabel;
    MLabel36: TMLabel;
    MLabel37: TMLabel;
    MLabel38: TMLabel;
    MLabel39: TMLabel;
    MLabel49: TMLabel;
    MLabel50: TMLabel;
    MLabel51: TMLabel;
    MLabel52: TMLabel;
    MLabel53: TMLabel;
    MLabel54: TMLabel;
    MLabel55: TMLabel;
    MLabel56: TMLabel;
	MLabel57: TMLabel;
    MLabel58: TMLabel;
    DtlCmnEditSegCD1: TMTxtEdit;
    DtlCmnEditSegCD2: TMTxtEdit;
    DtlCmnEditSegCD3: TMTxtEdit;
    DtlCmnEditSegCD4: TMTxtEdit;
    DtlCmnEditSegCD5: TMTxtEdit;
    DtlCmnEditSegCD6: TMTxtEdit;
    DtlCmnEditSegCD7: TMTxtEdit;
    DtlCmnEditSegCD8: TMTxtEdit;
    DtlCmnEditSegCD9: TMTxtEdit;
    DtlCmnEditSegCD10: TMTxtEdit;
    MPanel3: TMPanel;
    MLabel1: TMLabel;
    EDateStart: TMDateEdit;
    MLabel2: TMLabel;
    EDateEnd: TMDateEdit;
    FFunctionBar: TMSPFunctionBar;
    CmnInstructionCombo: TMComboBox;
    DtlCmnLabelNCodeBSAdd: TMLabel;
    MPanel6: TMPanel;
    ModeBtn: TMSpeedButton;
    MLine5d: TMLabel;
    MLine4d: TMLabel;
    MLabel3: TMLabel;
    MLine4t: TMLabel;
    DtlCmnPopupMenu: TPopupMenu;
    CmnToolbarImageD: TImageList;
	ToolBar1: TMToolBar;
    CmnToolbarButtonTag: TToolButton;
    MPanel5: TMPanel;
    MPanel7: TMPanel;
    MPanel8: TMPanel;
    DtlCmnLabelName: TMLabel;
    DtlCmnEditName: TMTxtEdit;
    DtlCmnLabelNameSimple: TMLabel;
    DtlCmnEditNameSimple: TMTxtEdit;
    DtlCmnEditAssociation: TMTxtEdit;
    DtlCmnLabelAssociation: TMLabel;
    Dummy: TMTxtEdit;
    MPanel9: TMPanel;
	DtlCmnImageTag: TImage;
    DtlCmnLabelExCodeTitle: TMLabel;
    DtlCmnEditExCodeNumeric: TMNumEdit;
    DtlCmnEditExCodeFree: TMTxtEdit;
    MLabel4: TMLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    CmnDataSourcePrintSystem: TDataSource;
    CmnMemDataPrintSystem: TdxMemData;
    CmnMemDataPrintSystemstrExCode: TStringField;
    CmnMemDataPrintSystemstrName: TStringField;
    CmnPipelinePrintSystem: TppDBPipeline;
    CmnReportSystem: TppReport;
    ppHeaderBand6: TppHeaderBand;
    CmnReportSystemLabelCorpCode: TppLabel;
    CmnReportSystemLabelCorpName: TppLabel;
    CmnReportSystemLabelTitle: TppLabel;
    CmnReportSystemLineTitle: TppLine;
    CmnReportSystemSysVarDate: TppSystemVariable;
    ppLine116: TppLine;
    ppLabel81: TppLabel;
    ppLabel83: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine36: TppLine;
    ppDetailBand_CmnReportSystem: TppDetailBand;
    CmnReportSystemppDBTextExCodeDst: TppDBText;
	CmnReportSystemppDBTextNameSimpleDst: TppDBText;
    CmnReportSystemppDBTextAppDateStart: TppDBText;
    CmnReportSystemppDBTextAppDateEnd: TppDBText;
    ppLine121: TppLine;
    ppLine129: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    CmnReportSystemppLineDetailsBottom: TppLine;
    ppFooterBand6: TppFooterBand;
    CmnReportSystemSysVarPage: TppSystemVariable;
    CmnReportSystemAccOffice: TppLabel;
    ppLabel3: TppLabel;
	ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLine8: TppLine;
    ppBun1: TppLabel;
    ppSeg1: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppBun2: TppLabel;
    ppSeg2: TppLabel;
    ppLine11: TppLine;
    ppBun3: TppLabel;
    ppSeg3: TppLabel;
    ppBun4: TppLabel;
    ppSeg4: TppLabel;
    ppLine17: TppLine;
    ppBun5: TppLabel;
    ppSeg5: TppLabel;
    ppLine22: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppLine39: TppLine;
	ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
	ppDBBun1: TppDBText;
    ppDBSeg1: TppDBText;
    ppDBBun2: TppDBText;
    ppDBSeg2: TppDBText;
    ppDBBun3: TppDBText;
    ppDBSeg3: TppDBText;
    ppDBSeg4: TppDBText;
    ppDBBun4: TppDBText;
    ppDBBun5: TppDBText;
    ppDBSeg5: TppDBText;
	ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
	ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
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
    MLabel11: TMLabel;
    CmnInstructionComboDtl: TMComboBox;
    MLabel13: TMLabel;
    SPDep: TFDStoredProc;
    SPEnt: TFDStoredProc;
    SPMas: TFDStoredProc;
	SPPay: TFDStoredProc;
    SPSel: TFDStoredProc;
    SPHap: TFDStoredProc;
    LidsGuideDtl: TMLabel;
    LidsGuideStd: TMLabel;
    StdCmnMemDataTotalStartDate: TDateField;
    StdCmnMemDataTotalEndDate: TDateField;
    ppLabel8: TppLabel;
    ppLine43: TppLine;
    ppLabel10: TppLabel;
    CmnReportTtlStandardDBTextAppDateStart: TppDBText;
    ppLine44: TppLine;
    CmnReportTtlStandardDBTextAppDateEnd: TppDBText;
    ppLine45: TppLine;
    ppLine46: TppLine;
    CmnMemDataPrintExtStandarddtAppDateStartDisp: TStringField;
    CmnMemDataPrintExtStandarddtAppDateEndDisp: TStringField;
    CmnMemDataPrintTtlStandarddtAppDateStartDisp: TStringField;
    CmnMemDataPrintTtlStandarddtAppDateEndDisp: TStringField;
    CmnMemDataPrintSystemdtStartDisp: TStringField;
    CmnMemDataPrintSystemdtEndDisp: TStringField;
    CmnMemDataPrintExtStandarddtAppDateStart: TDateField;
    CmnMemDataPrintExtStandarddtAppDateEnd: TDateField;
    CmnMemDataPrintTtlStandarddtAppDateStart: TDateField;
    CmnMemDataPrintTtlStandarddtAppDateEnd: TDateField;
    CmnMemDataPrintSystemdtStart: TDateTimeField;
    CmnMemDataPrintSystemdtEnd: TDateTimeField;
    CmnMemDataPrintExtStandarddtUpdateDateDisp: TStringField;
    CmnMemDataPrintTtlStandarddtUpdateDateDisp: TStringField;
    CmnReportFree: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine56: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel17: TppLabel;
    CmnReportFreeLabelCorpCode: TppLabel;
    CmnReportFreeLabelCorpName: TppLabel;
    CmnReportFreeLabelTitle: TppLabel;
    ppLine57: TppLine;
    CmnReportFreeSysVarDate: TppSystemVariable;
    ppLine70: TppLine;
    ppLabel27: TppLabel;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppDetailBand_Free: TppDetailBand;
    ppFreeUnderLineLeft: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine88: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppDBText8: TppDBText;
    ppLine94: TppLine;
    ppDBText9: TppDBText;
    ppLine95: TppLine;
    ppDBText10: TppDBText;
    ppLine97: TppLine;
    ppDBText24: TppDBText;
    ppFooterBand1: TppFooterBand;
    CmnReportFreeSysVarPage: TppSystemVariable;
    CmnReportFreeAccOffice: TppLabel;
    CmnPipelinePrintFree: TppDBPipeline;
    CmnMemDataPrintFree: TdxMemData;
    CmnMemDataPrintFreestrExCode: TStringField;
    CmnMemDataPrintFreestrNameSimple: TStringField;
    CmnDataSourcePrintFree: TDataSource;
    CmnMemDataPrintFreestrVFreeTitle: TStringField;
    CmnMemDataPrintFreestrVFree: TStringField;
    CmnMemDataPrintFreestrNFreeTitle: TStringField;
    CmnMemDataPrintFreestrNFree: TStringField;
    CmnMemDataPrintFreestrDFreeTitle: TStringField;
    CmnMemDataPrintFreestrDFree: TStringField;
    ppFreeUnderLine: TppLine;
    CmnMemDataPrintFreedtDFree: TDateField;
    CmnMemDataPrintFreebCodeBreak: TBooleanField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    scrGridPanel: TScrollBox;
    StdCmnClientPanelExist: TMPanel;
    StdCmnGridExist: TdxDBGrid;
    StdCmnGridExistTag: TdxDBGridGraphicColumn;
    StdCmnGridExistCode: TdxDBGridMaskColumn;
    StdCmnGridExistName: TdxDBGridColumn;
    StdCmnGridExistNameSimple: TdxDBGridColumn;
    StdCmnGridExistAssociation: TdxDBGridColumn;
    StdCmnGridExistComment: TdxDBGridColumn;
    StdCmnGridExistNCode: TdxDBGridColumn;
    StdCmnGridExistAdoptDivision: TdxDBGridLookupColumn;
    StdCmnGridExistAdoptComment: TdxDBGridMaskColumn;
    StdCmnGridExistStartDate: TdxDBGridDateColumn;
    StdCmnGridExistEndDate: TdxDBGridDateColumn;
    StdCmnClientPanelTotal: TMPanel;
    StdCmnGridTotal: TdxDBGrid;
    StdCmnGridTotalTag: TdxDBGridGraphicColumn;
    StdCmnGridTotalCode: TdxDBGridMaskColumn;
    StdCmnGridTotalName: TdxDBGridColumn;
    StdCmnGridTotalNameSimple: TdxDBGridColumn;
    StdCmnGridTotalAssociation: TdxDBGridColumn;
    StdCmnGridTotalComment: TdxDBGridColumn;
    StdCmnGridTotalNCode: TdxDBGridColumn;
    StdCmnGridTotalStartDate: TdxDBGridDateColumn;
    StdCmnGridTotalEndDate: TdxDBGridDateColumn;
    CmnReportExtStandardDep_DEP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine60: TppLine;
    ppLine69: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    CmnReportExtStandardDepLabelCorpCode_DEP: TppLabel;
    CmnReportExtStandardDepLabelCorpName_DEP: TppLabel;
    CmnReportExtStandardDepLabelTitle_DEP: TppLabel;
    CmnReportExtStandardDepLineTitle_DEP: TppLine;
    CmnReportExtStandardDepSysVarDate_DEP: TppSystemVariable;
    ppLine92: TppLine;
    ppLabel32: TppLabel;
    ppLine93: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLine98: TppLine;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLabel35: TppLabel;
    ppDetailBand_StandardDep_DEP: TppDetailBand;
    ppStandardDepUnderLine_DEP: TppLine;
    CmnReportExtStandardDepDBTextCode_DEP: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText23: TppDBText;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLine106: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppLine113: TppLine;
    ppDBText31: TppDBText;
    ppLine114: TppLine;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBImage2: TppDBImage;
    ppFooterBand2: TppFooterBand;
    CmnReportExtStandardDepSysVarPage_DEP: TppSystemVariable;
    CmnReportExtStandardDepAccOffice_DEP: TppLabel;
	procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
    procedure fnOnCreate(Sender: TObject);
    procedure fnOnClose(Sender: TObject; var Action: TCloseAction);
    procedure fnCmnButtonToolbarExitOnClick(Sender: TObject);
    procedure fnCmnToolbarButtonChangeOnClick(Sender: TObject);
	procedure fnCmnFunctionOnEnter01(Sender: TObject);
	procedure fnCommonFunctionOnEnter02(Sender: TObject);
	procedure fnCommonFunctionOnKeyDown01(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnKeyDown02(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnCommonFunctionOnBeforePrint(Sender: TObject);
    procedure fnStdCmnGridExistOnEnter(Sender: TObject);
    procedure fnStdCmnGridTotalOnEnter(Sender: TObject);
    procedure fnStdCmnGridExistOnChangeNodeEx(Sender: TObject);
    procedure fnStdCmnGridTotalOnChangeNodeEx(Sender: TObject);
    procedure fnStdCmnGridExistOnBeforeChangeColumn(Sender: TObject;
                    Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure fnStdCmnGridTotalOnBeforeChangeColumn(Sender: TObject;
                    Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
    procedure fnStdCmnMemDataExistBeforePost(DataSet: TDataSet);
    procedure fnStdCmnMemDataTotalBeforePost(DataSet: TDataSet);
    procedure fnStdCmnDataSourceExistOnStateChange(Sender: TObject);
    procedure fnStdCmnDataSourceTotalOnStateChange(Sender: TObject);
    procedure fnStdCmnClientPanelExistOnResize(Sender: TObject);
    procedure fnStdCmnClientPanelTotalOnResize(Sender: TObject);
    procedure fnStdCmnGridExistCodeOnGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
	procedure fnStdCmnGridTotalCodeOnGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
	procedure fnStdCmnGridExistOnKeyPress(Sender: TObject; var Key: Char);
	procedure fnStdCmnGridTotalOnKeyPress(Sender: TObject; var Key: Char);
	procedure fnCmnToolbarButtonDeleteOnClick(Sender: TObject);
    procedure fnCmnToolbarButtonDetailOnClick(Sender: TObject);
    procedure fnDtlCmnButtonUpdateOnClick(Sender: TObject);
    procedure fnDtlCmnButtonCancelOnClick(Sender: TObject);
//    procedure fnDtlCmnEditExCodeNumericOnExit(Sender: TObject);
    procedure fnDtlCmnEditExCodeNumericOnEnter(Sender: TObject);
    procedure fnDtlCmnEditExCodeNumericOnChange(Sender: TObject);
//    procedure fnDtlCmnEditExCodeFreeOnExit(Sender: TObject);
    procedure fnDtlCmnEditExCodeFreeOnEnter(Sender: TObject);
    procedure fnDtlCmnEditExCodeFreeOnChange(Sender: TObject);
	procedure fnDtlCmnEditNameSimpleOnEnter(Sender: TObject);
    procedure fnCmnToolbarButtonPrintOnClick(Sender: TObject);
    procedure fnCmnReportSystemOnEndPage(Sender: TObject);
	procedure fnStdCmnTabOnEnter(Sender: TObject);
    procedure fnDtlCmnTabOnChange(Sender: TObject);
    procedure fnDtlCmnEditClassCodeOnChange(Sender: TObject);
    procedure fnDtlCmnEditCharacterCodeOnChange(Sender: TObject);
    procedure fnDtlCmnEditCommonStockDivisionOnChange(Sender: TObject);
    procedure fnStdCmnGridPopupMenuOnPopup(Sender: TObject);
    procedure fnOnShow(Sender: TObject);
    procedure fnDtlCmnEditExCodeBSAddNumericOnExit(Sender: TObject);
    procedure fnDtlCmnEditExCodeBSAddFreeOnExit(Sender: TObject);
    procedure fnCmnReportDetailsppDBTextExCodeBSAddOnPrint(Sender: TObject);
    procedure fnCmnReportSystemColumnFooterOnAffterPrint(Sender: TObject);
    procedure fnJNTCRP0020030fOnHide(Sender: TObject);
    procedure fnJNTCRP0020030fOnActivate(Sender: TObject);
    procedure fnDtlCmnEditExCodeBSAddOnArrowClick(Sender: TObject);
    procedure fnDtlCmnTabOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnJNTCRP0020030fOnPaint(Sender: TObject);
    procedure fnStdCmnTabOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnJNTCRP0020030fOnCloseQuery(Sender: TObject;
      var CanClose: Boolean);
    procedure ppDetailBand_StandardDepBeforeGenerate(Sender: TObject);		//	HIS0003
    procedure ppDetailBand_TtlStandardBeforeGenerate(Sender: TObject);		//	HIS0003

    procedure ppDetailBand_StandardDepBeforeGenerate_DEP(Sender: TObject);	//<MLXDEP>

    procedure fnStdCmnTabOnChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
	procedure fnDtlCmnEditAppDateOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
//	procedure fnDtlCmnEditAssociationOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnDtlCmnEditNameOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fnCommonFunctionDetailsOnChange(Sender: TObject);
    procedure fnStdCmnGridPopupMenuTagOnClick(Sender: TObject);
    procedure fnDtlCmnPopupMenuOnPopup(Sender: TObject);
    procedure fnDtlCmnPopupMenuTagOnClick(Sender: TObject);
    procedure fnStdCmnGridExistOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnStdCmnGridTotalOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
	procedure fnDtlCmnEditNameSimpleOnExit(Sender: TObject);
    procedure fnStdCmnGridExistOnChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
	procedure fnStdCmnGridTotalOnChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
//	procedure fnDtlCmnEditExCodeBSAddOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fnCmnToolbarButtonTagOnClick(Sender: TObject);
    procedure fnCmnToolbarDropDownMenuTagOnClick(Sender: TObject);
	procedure fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);
    procedure fnStdCmnGridExistOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnStdCmnGridTotalOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fnCmnReportSystemRenewalOnStartPage(Sender: TObject);
    procedure fnCmnReportSystemRenewalOnEndPage(Sender: TObject);
    procedure fnCmnToolbarButtonDeleteOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fnCmnFunctionNumEditSelectOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtlCmnEditExCodeArrowClick(Sender: TObject);
    procedure BSpeedButtonSortClick(Sender: TObject);
    procedure B_SearchClick(Sender: TObject);
    procedure StdCmnGridExistDblClick(Sender: TObject);
    procedure StdCmnGridTotalDblClick(Sender: TObject);
    procedure DtlCmnEditDfKeihiCodeChange(Sender: TObject);
    procedure DtlCmnEditHonsitenCodeNumericArrowClick(Sender: TObject);
    procedure EDateStartExit(Sender: TObject);
    procedure EDateEndExit(Sender: TObject);
	procedure DtlCmnEditAppDateStartExit(Sender: TObject);
    procedure StdCmnGridTotalExit(Sender: TObject);
    procedure DtlCmnEditSegCDArrowClick(Sender: TObject);
    procedure DtlCmnEditExCodeFreeExit(Sender: TObject);
    procedure DtlCmnEditExCodeNumericExit(Sender: TObject);
    procedure FFunctionBarFunctionClick(Sender: TObject; FuncNo: Integer);
    procedure CmnInstructionComboChange(Sender: TObject);
    procedure CmnInstructionComboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtlCmnEditSegCD1Exit(Sender: TObject);
    procedure DtlCmnEditBunruiCD1ArrowClick(Sender: TObject);
    procedure DtlCmnEditBunruiCD1Exit(Sender: TObject);
	function  JNTTree2ReMake2( 	sSysRoot : string; DBM : TMDataModuleF; CID : integer;
							BaseNCode : Extended ;
							var ErrQry : TMQuery;
    	                    Prog : TComponent = nil; _Label : TComponent = nil  ) : integer;
	procedure DummyEnter(Sender: TObject);
    procedure DtlCmnEditNameEnter(Sender: TObject);
    procedure DtlCmnEditAppDateEndEnter(Sender: TObject);
    procedure DtlCmnTabEnter(Sender: TObject);
    procedure DtlCmnButtonCancelEnter(Sender: TObject);
    procedure CmnReportExtStandardDepBeforePrint(Sender: TObject);
    procedure ppDetailBand_CmnReportSystemBeforeGenerate(Sender: TObject);
	function  DspCtrlFromKey (Sender: TObject; var Key: Word; Shift: TShiftState) : Boolean;
    procedure CmnInstructionComboEnter(Sender: TObject);
    procedure CmnInstructionComboClick(Sender: TObject);
    procedure CmnInstructionComboDtlChange(Sender: TObject);
    procedure AllCtrlEnter(Sender: TObject);
    procedure StdCmnMemDataExistAfterScroll(DataSet: TDataSet);
    procedure StdCmnMemDataTotalAfterScroll(DataSet: TDataSet);
    procedure ppDetailBand_FreeBeforeGenerate(Sender: TObject);

  private
    { Private 宣言 }
	m_pRec			  	 : ^TMjsAppRecord;			// ｾｰﾌﾞ用ﾎﾟｲﾝﾀ
	m_cJNTArea           : TJNTCommon;				// FX
	m_cDataModule     	 : TMDataModulef;
	m_cComArea        	 : TJNTMASCom;              //  FX10000
	m_cDBSelect       	 : TFDConnection;
	m_cACControl 	  	 : TWinControl;				// ｱｸﾃｨﾌﾞｺﾝﾄﾛｰﾙ
	m_cPrnSupport	  	 : TMjsPrnSupport;
	m_cAppPrm			 : TAppParam;
	m_cPreview			 : TMJSPreviewIF;
	m_cErrorMsgRec		 : TMJSMsgRec;
	// 0706 EXP
	uvExpOpenSW     	 : Boolean;                 // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)

    m_nCurrentMasterDiv  : Integer;
    m_nCurrentCodeDigit  : Integer;
    m_nCurrentCodeAttr   : Integer;
	m_nCurrentAdoptDiv	 : Integer;
	m_nSelectTagKind	 : Integer;
	m_nKStDate			 : TDateTime;
	m_nKEdDate			 : TDateTime;
	m_nDateFormatDivision: Integer;
	m_nDBErrorCode		 : Integer;
//	m_nChargeCode		 : Integer;
	m_nHintPosition		 : Extended;
	m_strHintPosition	 : String;
	m_stSelectItem       : array [1..10] of SelectValidItem;
    m_stMasterItem       : SelectValidItem;
	m_bHojyoTreeDelete	 : array [0..10] of Byte;						// 0:部門/1～10:セグメント1～10
	m_bHojyoTree2		 : array [0..10] of Byte;						// 0:部門/1～10:セグメント1～10
	m_strExCodeTotal	 : String;
    m_strExCodeCurrent   : String;
	m_strExCodePrint     : String;
//	m_strChargeName		 : String;
	m_strLoginNCode		 : String;
	m_strValidCharacters : String;
    m_stWorkRecPaste     : TreeViewRec;
	m_stMasterData	     : MasterData;
    m_fAccessTab         : Boolean;
	m_fIgnoreProc		 : Boolean;
    m_fUpdateRecord      : Boolean;
//	m_fDtlChangeExCode   : Boolean; 
//	m_fDtlNewRecord	     : Boolean;
	m_fUnderConstruction : Boolean;
	m_fComboBoxListDraw	 : Boolean;
	m_fChangeDetails	 : Boolean;
	m_fChargeDivision	 : Boolean;
	m_fPrintSystemTop	 : Boolean;
	m_fSystemClear		 : Boolean;
	m_cNodePrevSelect    : TTreeNode;
	m_nGridExistRecords  : Integer;
	m_nGridTotalRecords  : Integer;
	m_nOrderDivision	 : Integer;							// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
//	m_strExCodeScopeStr	 : String;							// 開始実在部門外部ｺｰﾄﾞ
//	m_strExCodeScopeEnd	 : String;							// 終了実在部門外部ｺｰﾄﾞ

	m_nReferMode		:	Integer;						//	参照ﾌﾗｸﾞ		HIS0002
	gbTabFlag			:	Boolean;						//	TabChangeの処理が一番最初に来てしまうのを防ぐﾌﾗｸﾞ
	m_DeleteCheck		:	Boolean;

	m_NewRecord			:	Boolean;						//HIS0023
	m_DelRecord			:	Boolean;						//<090407>
	m_DelRecordN		:	Boolean;						//<090407>(新体系)

//    cExcept             :   TJNTMASExceptIF;                //HIS0025   FX10000

    m_BmnFlg            :   Boolean;                        //HIS0027   部門用排他フラグ
    m_SegFlg            :   Boolean;                        //HIS0027   セグメント用排他フラグ

  	m_SearchInfo	    :	SearchInfoRec;                  //HIS0028   検索対象分類情報

	ParentMasterDiv		:	Integer;						//★★★　マスタ区分
	TotalRead			:	Boolean;
   	firstFlg 			:	Boolean;						// 最初の１回目の判定用(処理モード：新規／更新)
	CloseFlg 			:	Boolean;
    DtlAppDateExit 		:	Boolean;
	NewGCode 			:	Boolean;
    DefPosition			:	Integer;
//	DefDateS			:	TDateTime;
//	DefDateE	 		:	TDateTime;
	//0214 >>
    DtlCmnEditBunruiCD	: array[1..10] of ^TMTxtEdit;
    DtlCmnEditSegCD		: array[1..10] of ^TMTxtEdit;
	//0214 <<
	//0217 >>
    DtlLabelSegNM		: array[1..10] of ^TMLabel;
    DtlLabelSegTx		: array[1..10] of ^TMLabel;
    DtlSegNCode			: array[1..10] of String;
	//0217 <<
	tmpStartDate		: TDateTime;
	tmpEndDate 			: TDateTime;

	DtlNCode			: String;
	DtlNCode2			: String;
    DtlLabelBunruiNM	: array[1..10] of ^TMLabel;
    DtlLabelBunruiTx	: array[1..10] of ^TMLabel;
	DtlBunruiNCode		: array[1..10] of String;
    m_stBunruiItem      : array [1..10] of SelectValidItem;
    InputAttrTmp		: array[0..2] of TInputAttr;
    BunruiMKbn			: Integer;
    UpdFreeFlg			: Boolean;
    freeItem			: TJNTFreeRec;
    freeItemNull		: TJNTFreeRec;
    arBaseNCode 		: Array of String;
   	SelectExp			: Boolean;
    BeforeFocus			: String;
    SegMa		   		: Array [1..10] of Integer;

    m_vInit:                Boolean;						// FX
    UseFlg				 : Boolean;

    m_iSegMasterKbn      : Integer;   			// <012> ADD ｾｸﾞﾒﾝﾄﾏｽﾀ区分

    m_strSimpleName      : String;				// <014> ADD 全社のﾏｽﾀ簡略名称

	// 印刷対応 050803 >>
{$IFNDEF _NOT_PRINT_}
    uvHani          :   TJNTHani;		                    // <999> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
//    AOwner          :   TComponent;                         // <MessageBox用 y.mogi>
	uvSelSys        :   TJNTSelCorpSys;
{$ENDIF _NOT_PRINT_}
	// 印刷対応 050803 <<
    SegIndex			: Integer;
    SgkChk				: Boolean;

//  <マスタ同期>---Begin---
	m_SyncMaster    : TSyncMaster;                         // <SYNC>
	m_bKanendo		: Boolean;

	m_bIDS			:	Boolean;				//<IDS>
	m_bMLWF			:	Boolean;				//<MLWK>

	m_SPMsHist		: TFDStoredProc;				// <080214_2>

	m_ChkQry		: TMQuery;					//<090616>
//<100215_1>↓
	m_SyokuchiNCd	: String;
//<100215_1>↑
//<100217>↓
	m_TotalNCd		: String;
//<100217>↑
//<100906>↓
	m_arFunction	: Array [0..7] of String ;
//<100906>↑
//<MLXHAP>↓
	m_DEPflg				:	Boolean;			// True:固定資産管理
	m_LEAflg				:	Boolean;			// True:リース資産管理
	m_HAPflg				:	Boolean;			// True:給与大将
//<MLXHAP>↑

//<Edge>↓
	m_iEdgeFlag				: Integer;				//Edge Tracker使用フラグ(0:未使用、1:使用)
//<Edge>↑


	function	fnWriteData_Rel(iNCode : Int64; iMasterKbn : Integer;
								mqCopDB: TMQuery; RDelKbn: Integer=0): Boolean;
	function	fnSYNC(): Boolean;				//同期
	function	IsChild(): Boolean;				//子社か？
	function	IsParent(): Boolean;			//全社か？
//  <マスタ同期>--- End ---


// <012> ADD start
	    										// SecHojyoDispInfoに更新
	function fnWriteData_SecHojyo(exNCode : Extended; iDspKbn : Integer) : Boolean;

    function GetSegMasterKbn() : Boolean;       // ｾｸﾞﾒﾝﾄのﾏｽﾀ区分を取得
                                           		// ﾏｽﾀ区分内部ｺｰﾄﾞを取得
    function GetMstNCode(var exNCode : Extended) : Boolean;

// <012> ADD end

	function IsGrop() : Boolean;  				// <013> ADD ｸﾞﾙｰﾌﾟ管理か?

	procedure	SessionPractice(iSyori: Integer);	// <080214_2> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加
//<080902>↓
	function	fnReplaceCRLF(sBaseText : String) : String;
//<080902>↑
//<100215_2>↓
	function	 DateToStrTmp(date: TDateTime; sts: String = ''): String;
//<100215_2>↑
//<100615>↓
	function	fnChkDate(iNCode:Int64; sGCode: String; StartDate, EndDate: TDateTime): Boolean;
//<100615>↑
	procedure 	ToolBarObjectMove();	//<MLXDEP>

  public
	{ Public 宣言 }

    constructor fnCreateForm ( pRec : Pointer);	// ｺﾝｽﾄﾗｸﾗ

	procedure	fnJNTCRP0020030fOnDiscontinue		(var Msg: TMessage); message WM_ONDISCONTINUE;

	procedure	CMChildkey						(var Msg: TWMKey); message CM_CHILDKEY;
//	procedure	fnChangeToolbarButtonsCondition	(cNodeTarget: TTreeNode);
	procedure	fnEnableToolbarButtonTag		(fEnabled: Boolean);
	procedure	fnInitializeDetailScreen		(fClearExCode: Boolean);
	procedure	fnDisableDetailScreen			(nSumDivision: Integer);
	procedure	fnChangeComponentState			(nSumDivision: Integer; fEnabled: Boolean);
	procedure	fnChangeEditComponentState		(fEnabled: Boolean);
	procedure	fnMoveGridRecordSelecter		(nSumDivision: Integer; strExCode: String);
	procedure	fnOutputDBErrorMessage			();
	procedure	fnPrintCheckListExtStandard		();
	procedure	fnPrintCheckListTtlStandard		();
	function	fnPrintCheckListSystem			(): Boolean;
//<100405>↓
	function	fnPrintCheckListFree			(PrintPtn : Integer): Boolean;
//<100405>↑
    procedure   fnSetParentItemsInfo			();
	procedure	fnSetGridMemDataRecords			();
	procedure	fnSetGridMemData				(dqMasterData: TMQuery);
//<100215_1>↓
//	procedure	fnSetGridMemDataEx				(nSumDivision: Integer; strExCode: String; strInCode: String; strAssociation: String; strName: String; strNameSimple: String; nAdoptDivision: Integer; nTagDivision: Integer; strComment: String);
	procedure	fnSetGridMemDataEx				(nSumDivision: Integer; strExCode: String; strInCode: String; strAssociation: String; strName: String; strNameSimple: String; nAdoptDivision: Integer; dtStart: TDateTime; dtEnd: TDateTime; nTagDivision: Integer; strComment: String);
//<100215_1>↑
	procedure	fnSetGridTagInfo				(nTagKind: Integer);
	procedure	fnShowDetailScreen				();
	procedure	fnSetDeleteButtonCondition		();
	function	fnUpdateMasterRecord			(): Boolean;
	procedure	fnUpdateDetailIndInfo			();
    procedure   fnUpdateMasterDataTagInfoEx		(strExCode: String; var nTagKind: Integer; strTagComment: String);
	procedure	fnUpdateGridMemDataRecord		(nSumDivision: Integer; strExCode: String; nTagKind: Integer);
    procedure   fnDeleteMasterRecord            (nSumDivision: Integer; nInCode: String);
    procedure   fnCheckMasterDataTagInfo        (strExCode: String; var pTagInfo: array of TagInfo);

	function	fnUpdateDetailsScreenRecord		(): Boolean;

    procedure	fnPartsControl					(Select: Integer);	//	HIS0002
	procedure	fnSetFileOutTF					(PrintDivision: Integer; var sTitle: TStringList; var sMemFld: TStringList);	//	HIS0007

	function	fnUpdateMasterDataTagInfo       	(strExCode: String; var nTagKind: Integer): Boolean;
	function	fnChangeSelectionScreen				(): Boolean;
	function	fnSetDetailScreenInfo				(strExCode: String; var nSumDivision: Integer): Boolean;
	function	fnCheckDtlExCodeValid				(): Boolean;
	function	fnCheckExCodeValidCharacter			(strExCode: String): Boolean;
	//  <マスタ同期>---Begin---
//	function    fnCheckMasterDataRecordValid		(strExCode: String): Boolean;
//	function    fnCheckMasterDataRecordValid2		(strExCode: String): Boolean;
	function    fnCheckMasterDataRecordValid		(strExCode: String): Integer;
	function    fnCheckMasterDataRecordValid2		(strExCode: String): Integer;
	//  <マスタ同期>--- End ---
	function	fnCheckRequisiteItem				(nPrcDivision: Integer; nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer): Integer;
	function	fnCheckCommonDetailScreenValue		(nDivision: Integer): Boolean;
//	function	fnCheckRegistBSAddDepartment		(strExCode: String; var strDepartmentName: String): Boolean;
	function	fnCheckRegistBSAddDepartment		(strExCode: String; var strDepartmentName, strNCode: String): Boolean;
	function	fnCheckRegistBSAddDepartment2		(strNCode: String; var strDepartmentName, strGCode: String): Boolean;
	function	fnCheckRegistSegCd					(strExCode: String; MasKbn : Integer; var strDepartmentName, strNCode: String): Boolean;
	function	fnCheckRegistSegCd2					(strNCode: String; MasKbn : Integer; var strDepartmentName, strGCode: String): Boolean;
	function	fnCheckRegistBunruiCd				(strExCode: String; MasKbn : Integer; var strDepartmentName, strNCode: String): Boolean;
	function	fnCheckRegistBunruiCd2				(strNCode: String; MasKbn : Integer; var strDepartmentName, strGCode: String): Boolean;
	function	fnCheckRegistRenewCompany			(nCompCode: Integer; var strCompName: String): Boolean;
//	function	fnCheckPermitGeneralRecDelete		(): Boolean;
//	function	fnCheckPermitTotalRecDelete			(): Boolean;
	function	fnCheckMasterInfoCommonSection		(nMasterDivision: Integer; strSectionCode: String): Boolean;
//	function	fnCheckDetailNewRecord				(strExCode: String): Boolean;
	function	fnGetMasterDataTagInfo				(strExCode: String): Integer;
	function    fnGetTagColorBitmap					(nTagColor: Integer): TBitmap;
	function	fnGetTaxName						(nDivision: Integer; nTaxCode: Integer): String;
	function	fnGetNameSimple						(nExCode: Integer): String;
	function	fnGetSumDescription					(nSumDivision: Integer): String;
	function	fnGetClassDescription				(nClassCode: Integer; nDescSize: Integer): String;
	function	fnGetCharacterDescription			(nCharacterCode: Integer; nDescSize: Integer): String;
	function	fnGetCmnStockDescription			(nCStDivision: Integer; nDescSize: Integer): String;
	function	fnGetPrintSystemImage				(nDivision: Integer): TBitmap;
	function	fnOutputConfirmationMessage			(nDivision: Integer): Integer;
	function	fnReadPrintSystemNextRecordParent01	(strExCode: String): Boolean;
	function	fnReadPrintSystemNextRecordParent02	(strExCode: String): Boolean;
	function	fnReadPrintSystemNextRecord			(strExCode: String; nEntryNo: Integer): Boolean;
	function	fnResetDetailScreen					(): Boolean;
    function    fnUpdateMasterDataRecord			(): Boolean;
//    function    fnDeleteMasterTreeRecord			(nDivision: Integer; strExCode: String): Boolean;
	function	fnDeleteMasterTreeRecord 			(nDivision: Integer; NCode: String): Boolean;
    function    fnDeleteMasterDataRecord			(nDivision: Integer; nInCode: String): Boolean;
	function	fnDeleteMasterDataAddition			(strExCode: String): Boolean;
//	function	fnMakeSQLConstructionInsert			(strExCode: String): String;
//	function	fnMakeSQLConstructionUpdate			(strExCode: String): String;
	function	fnMakeSQLConstructionBSAdd			(): String;
	function	fnMakeSQL							(FLAG,StratEndFlag: Boolean):String;

	function	fnCheckDetailScreenDivisions		(): Boolean;
	function	fnCheckNumEditSelectedItem			(cNumEdit: TMNumEdit): Boolean;
	function	fnGetIndexSelectItem				(cNumEdit: TMNumEdit): Integer;

	function	fnClearAllSystems					(): Boolean;

	procedure	fnSetMasterInfoCommonSections	();
	function	fnSetMasterInfoCommonSection	(nMasterDivision: Integer; strBSSectionCode: String; strPLSectionCode: String): Boolean;
	procedure	fnDeleteCheck					();

	function	fnKbnCheck(nMasterKbn: Integer; sCode: String): Integer;
	function    MakeDspString                   (CODE: String; NAME: String):String;

//    function    fnExcept(nMasterDivision: Integer): Integer;

//    function    fnHaitaCheck(): Integer;

	procedure ErrorMessageDsp(Query: TMQuery);
	function  ChkChild(strInCode : string):Boolean;
	function  ChkPtn1 (iParam : Integer): Integer;
	function  ChkPtn2 (nMasterDiv : Integer; nInCode : String): Integer;
	procedure ChgFree();
	function  GetNCodeFromGCode (strGCode: String): String;
	procedure fnPrintML ();

    function    fnDelCheck(exNCode: Extended; var strErr: String): Boolean;  //<CHK>

    { Public 宣言 }
  end;

function    AppEntry (pPar: Pointer) : Integer;
exports
	AppEntry;
implementation

var
	_SystemClear: String	= '加算情報を消去します。'#13#10'再登録後はマスター更新処理を行って下さい。';//<210202>Upd 長音対応
	_CodeError  : String	= 'コードには次の文字は使用できません。'' " : ? \ *';

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

	DIVISION_SYSTEM			= 77;
	DIVISION_GENERAL		= 88;
	DIVISION_NEWRECORD		= 99;

	DESCRIPTION_FULL		= 0;
	DESCRIPTION_SHORT		= 1;
	DESCRIPTION_PRINT		= 2;

	CONFIRM_EDITCODE		= 0;														// ｺｰﾄﾞ欄編集
	CONFIRM_CANCEL			= 1;														// 取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			= 2;														// 終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			= 0;
	CONFIRM_RETFOCUSED		= 1;														// 元の位置にﾌｫｰｶｽを戻す
	CONFIRM_EXITWRITE		= 2;														// ﾃﾞｰﾀを保存して処理を終了

	CHECKLIST				=	990100;	//	帳票ｸﾞﾙｰﾌﾟNo(ﾁｪｯｸﾘｽﾄ系)		HIS0004

	//	参照フラグ時に使用		HIS0002
	NORMAL			=	1;		//	通常処理
	REFER			=	3;		//	参照

	TABLE_MASTERINFO		= 10;														// ﾏｽﾀ基本情報
	TABLE_HOJYOMA			= 111;														// 補助基本ﾏｽﾀ
	TABLE_HOJYOTREE			= 199;														// 補助加算体系ﾏｽﾀ
	TABLE_HOJYOTREE2		= 299;														// 補助加算体系ﾏｽﾀ2

	REQUISITE_OK			= 0;
	REQUISITE_CANCEL		= 1;
	REQUISITE_EXIT			= 9;

	DEF_HOJYOMA				= 'HojyoMA';
	DEF_HAPTLR 				= 'HAPTLR';
	DEF_HAPTLR2 			= 'HAPTLR2';

    DEF_NOT_DEL				= 0;					// ★削除区分＝０を正規レコードだと思うことにする
    DEF_DELETE				= 1;					// ★削除区分＝１を削除レコードだと思うことにする

	DEF_S_DATE  = 2;		//1900/01/01
	DEF_E_DATE  = 73050;	//2099/12/31

    MK_SEG01	= 101;		// セグメント１のマスタ区分
    ITEM_MAX	= 10;		// セグメント　10個

    //<001> ↓
	// 削除時の確認メッセージ（暫定：JNTConst.inc に入る予定）//
	//MSG_DELETE					=	'当該マスタにデータが存在している場合、削除すると管理表に不整合が生ずる恐れがあります。'
	//								+ #10#13 + '削除してもよろしいですか？';
    //<001> ↑
    
	MSG_DATE_EROOR				=   '終了日は開始日より後でなければいけません。';

	STR_FUNC_FREE				=	'フリー項目登録';

//  <マスタ同期>---Begin---
	// コードチェック結果
	C_RET_SAME_SELF		= 1;					// 自社に存在
	C_RET_SYNC			= 2;					// 全社に存在→同期
	C_RET_SAME_PARENT	= 3;					// 全社に存在
	C_RET_ERROR			= -1;					// 異常
	C_RET_NONE			= 0;					// 重複なし
//  <マスタ同期>--- End ---

//<080214_2>↓
	// J-SOX履歴対応
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
//<080214_2>↑

{$R *.DFM}
{$I JNTMASFUSENBIKODLGIFB.inc}  // FX10000
{$I JNTMASERRORCODECHECK.inc}   // FX10000
//{$I JNTMASSEARCHDLGIFB.inc}     // 検索DLG  HIS0028 FX10000
//{$I JNTMASExceptIFB.inc}        // HIS0025  FX10000

{$include JNTCRPSyncMasterB.inc}    // <マスタ同期> ﾏｽﾀ同期共通実装部

{$I JNTSyncMasterIFB.inc}  					// <013> ADD

{$I HAPEraNameCtrl_B.inc}			//<NewEra>

// ================================================
//  ｴﾝﾄﾘｰ関数群
// ================================================
function	AppEntry (pPar :Pointer): Integer;
var
	pForm  : ^TJNTCRP0020030f;
	pRecord: ^TMjsAppRecord;

begin
	Result	:= ACTID_RET_OK;
	pRecord	:= Pointer (TAppParam (pPar^).pRecord);

	case (TAppParam (pPar^).iAction) of

		ACTID_FORMCREATESTART:													// Form Create要求
			begin
				New (pForm);

				try																// ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
					pForm^	:= TJNTCRP0020030f.fnCreateForm (pRecord);
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
					pForm^	:= TJNTCRP0020030f.fnCreateForm (pRecord);
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

				if	(pForm^.CloseQuery () = False) then
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

//************************************************************************
//*		Proccess		:	CONSTRUCTOR関数
//*		Name			:	S.Suzuki（AP開発G）
//*		Date			:	2000/06/30
//*		Paqrameter		:	Nathing
//*		Retrun			:	Nathing
//*		History			:	2001/1/30  H.Endo（企業ｼｽﾃﾑ企画設計）
//*										ｽﾄｱﾄﾞの初期処理追加(HIS0008)
//************************************************************************
constructor TJNTCRP0020030f.fnCreateForm (pRec: Pointer);
var
//	CTRL_DB		:	TDatabase;
//	DmqCtrlDb	:	TMQuery;
	DmqData		:	TMQuery;                // FX10001復帰
	sMessage	:	String;                 // FX10001復帰
	POwnerForm	: ^TControl;				// FX
begin
	// FX>> FX10000
    m_cJNTArea      :=  TJNTCommon.Create(Self);		// 050606
    m_cJNTArea.Init(pRec);
	// MAS情報の設定
	m_cJNTArea.setMasAppRecord;
	// FX<<

	m_pRec := pRec;						// 構造体のｾｰﾌﾞ

	// セグメント
//<IDS>	if m_pRec^.m_sParameter = '101' then
	if 0 <> Pos('101', m_pRec^.m_sParameter) then	//<IDS>
	begin
		ParentMasterDiv := 101;
		BunruiMKbn := 500;		// セグメント分類
	end
	// 職種
//<IDS>	else if m_pRec^.m_sParameter = '86' then
	else if 0 <> Pos('86', m_pRec^.m_sParameter) then	//<IDS>
	begin
		ParentMasterDiv := 86;
	end
	// 役職
//<IDS>	else if m_pRec^.m_sParameter = '87' then
	else if 0 <> Pos('87', m_pRec^.m_sParameter) then	//<IDS>
	begin
		ParentMasterDiv := 87;
	end
	// 職能資格
//<IDS>	else if m_pRec^.m_sParameter = '88' then
	else if 0 <> Pos('88', m_pRec^.m_sParameter) then	//<IDS>
	begin
		ParentMasterDiv := 88;
	end
	// 職位
//<IDS>	else if m_pRec^.m_sParameter = '89' then
	else if 0 <> Pos('89', m_pRec^.m_sParameter) then	//<IDS>
	begin
	    ParentMasterDiv := 89;
	end
	// 部門
    else
	begin
		ParentMasterDiv := 41;
		BunruiMKbn := 430;		// 部門分類
    end;
	//<IDS>>>
	// 人事異動シミュレーション
	if 0 <> Pos('IDS', m_pRec^.m_sParameter) then
	begin
		m_bIDS	:= True;						// 人事異動モード
	end
	else
	begin
		m_bIDS	:= False;						// 共通マスタモード
	end;
	//<<<IDS>

//<MLWK>↓
	// MLワークフロー
	if 0 <> Pos('MLWF', m_pRec^.m_sParameter) then
	begin
		m_bMLWF	:= True;						// MLワークフローモード
	end
	else
	begin
		m_bMLWF	:= False;						// 共通マスタモード
	end;
//<MLWK>↑

	//	初期処理		//	HIS0008
   	firstFlg := TRUE;					// 最初
	CloseFlg := False;
    DtlAppDateExit := False;
	NewGCode := FALSE;
    UpdFreeFlg := False;
   	SgkChk := False;
//<080214_2>↓
	m_SPMsHist		:= nil;
//<080214_2>↑

	// コード属性
    InputAttrTmp[0] := iaZeroSup;	//0:数字
    InputAttrTmp[1] := iaZeroPad;	//1:数字（前ゼロあり）
    InputAttrTmp[2] := iaFree;		//2:フリー
    //InputAttrTmp[2] := iaNone;		//2:フリー

    // 0214>>
    DtlCmnEditBunruiCD[1] := @DtlCmnEditBunruiCD1;
    DtlCmnEditBunruiCD[2] := @DtlCmnEditBunruiCD2;
    DtlCmnEditBunruiCD[3] := @DtlCmnEditBunruiCD3;
    DtlCmnEditBunruiCD[4] := @DtlCmnEditBunruiCD4;
    DtlCmnEditBunruiCD[5] := @DtlCmnEditBunruiCD5;
    DtlCmnEditBunruiCD[6] := @DtlCmnEditBunruiCD6;
    DtlCmnEditBunruiCD[7] := @DtlCmnEditBunruiCD7;
    DtlCmnEditBunruiCD[8] := @DtlCmnEditBunruiCD8;
    DtlCmnEditBunruiCD[9] := @DtlCmnEditBunruiCD9;
    DtlCmnEditBunruiCD[10] := @DtlCmnEditBunruiCD10;

    DtlCmnEditSegCD[1] := @DtlCmnEditSegCD1;
    DtlCmnEditSegCD[2] := @DtlCmnEditSegCD2;
    DtlCmnEditSegCD[3] := @DtlCmnEditSegCD3;
    DtlCmnEditSegCD[4] := @DtlCmnEditSegCD4;
    DtlCmnEditSegCD[5] := @DtlCmnEditSegCD5;
    DtlCmnEditSegCD[6] := @DtlCmnEditSegCD6;
    DtlCmnEditSegCD[7] := @DtlCmnEditSegCD7;
    DtlCmnEditSegCD[8] := @DtlCmnEditSegCD8;
    DtlCmnEditSegCD[9] := @DtlCmnEditSegCD9;
    DtlCmnEditSegCD[10] := @DtlCmnEditSegCD10;
    // 0214<<
    // 0217>>
	DtlLabelSegNM[1] := @MLabel35;
	DtlLabelSegNM[2] := @MLabel36;
	DtlLabelSegNM[3] := @MLabel37;
	DtlLabelSegNM[4] := @MLabel38;
	DtlLabelSegNM[5] := @MLabel39;
	DtlLabelSegNM[6] := @MLabel30;
	DtlLabelSegNM[7] := @MLabel31;
	DtlLabelSegNM[8] := @MLabel32;
	DtlLabelSegNM[9] := @MLabel33;
	DtlLabelSegNM[10] := @MLabel34;

	DtlLabelSegTx[1] := @MLabel49;
	DtlLabelSegTx[2] := @MLabel50;
	DtlLabelSegTx[3] := @MLabel51;
	DtlLabelSegTx[4] := @MLabel52;
	DtlLabelSegTx[5] := @MLabel53;
	DtlLabelSegTx[6] := @MLabel54;
	DtlLabelSegTx[7] := @MLabel55;
	DtlLabelSegTx[8] := @MLabel56;
	DtlLabelSegTx[9] := @MLabel57;
	DtlLabelSegTx[10] := @MLabel58;
    // 0217<<

	DtlLabelBunruiNM[1] := @MLabel19;
	DtlLabelBunruiNM[2] := @MLabel20;
	DtlLabelBunruiNM[3] := @MLabel21;
	DtlLabelBunruiNM[4] := @MLabel22;
	DtlLabelBunruiNM[5] := @MLabel23;
	DtlLabelBunruiNM[6] := @MLabel9;
	DtlLabelBunruiNM[7] := @MLabel10;
	DtlLabelBunruiNM[8] := @MLabel27;
	DtlLabelBunruiNM[9] := @MLabel28;
	DtlLabelBunruiNM[10] := @MLabel29;

	DtlLabelBunruiTx[1] := @MLabel5;
	DtlLabelBunruiTx[2] := @MLabel40;
	DtlLabelBunruiTx[3] := @MLabel41;
	DtlLabelBunruiTx[4] := @MLabel42;
	DtlLabelBunruiTx[5] := @MLabel43;
	DtlLabelBunruiTx[6] := @MLabel44;
	DtlLabelBunruiTx[7] := @MLabel45;
	DtlLabelBunruiTx[8] := @MLabel46;
	DtlLabelBunruiTx[9] := @MLabel47;
	DtlLabelBunruiTx[10] := @MLabel48;

	m_fChargeDivision	:= FALSE;
//	m_nChargeCode		:= 0;			//	担当者ｺｰﾄﾞ
//	m_strChargeName		:= '';			//	担当者名
	gbTabFlag		:=	False;

    m_fAccessTab    := False;

	m_DeleteCheck	:= True;

	m_NewRecord		:= False;           //	HIS0023
	m_DelRecord		:= False;           //	<090407>
	m_DelRecordN	:= False;           //	<090407>

    m_cJNTArea.FxPermission;                            // 権限の取得 <Pms>

    m_BmnFlg        := False;                       //HIS0027
    m_SegFlg        := False;                       //HIS0027

{
    try
    cExcept         := nil;                         //HIS0027
    cExcept         := TJNTMASExceptIF.Init(m_pRec);//HIS0027   FX10000
    except
        on E: Exception do
        begin
            showmessage(E.Message + ':' + intToStr(E.HelpContext));
        end;
    end;
}

    m_cDataModule   := TMDataModulef (m_pRec^.m_pDBModule^  );
    m_cComArea      := TJNTMASCom    (m_pRec^.m_pSystemArea^);  //FX10000

	m_cDBSelect     := m_cDataModule.COPDBOpen (1, m_cComArea.m_iCopNo);

	if	(m_cDBSelect = nil) then
	begin
		ShowMessage ('エラー');
		raise   EMathError.Create ('エラー');
	end;

//  <マスタ同期>---Begin---
	if (ParentMasterDiv = 41)						// 部門
	or (ParentMasterDiv = 101) then					// セグメント
	begin
		// SyncMasterｸﾗｽの生成
		try
			//m_SyncMaster := TSyncMasterf.Create();
			//m_SyncMaster.CreateForm(Self, m_pRec, m_cJNTArea, m_cDBSelect);
			m_SyncMaster := TSyncMaster.Create (Self, m_pRec, m_cJNTArea,m_cDBSelect);
			m_SyncMaster.InitData();
		except
			m_cDataModule.CopDBClose(m_cDBSelect);
			raise;
		end;
	end;
//  <マスタ同期>--- End ---

// FX10001↓復帰
//{ストアド
//	ｽﾄｱﾄﾞの初期処理	*****			HIS0008
	DmqData := TMQuery.Create( Self );					//	MQueryの構築		// 050606
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DmqData );		//	DBとMQueryの接続
//}
// FX10001↑
	//	共通ﾒﾓﾘﾎﾟｲﾝﾀの担当者内部ｺｰﾄﾞ		HIS0010
	if (rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD <> -1) then
	begin
{
		//	CTLDBOpen
		CTRL_DB	:=	m_cDataModule.CTLDBOpen(0);
		if CTRL_DB = nil then
		begin
			ShowMessage('エラー');
			raise EMathError.Create('エラー');
		end;

		DmqCtrlDb	:=	TMQuery.Create( Self );		 		//	MQueryの構築		// 050606
		m_cDataModule.SetDBInfoToQuery( CTRL_DB, DmqCtrlDb );		//	DBとMQueryの接続

		DmqCtrlDb.Close;
		DmqCtrlDb.SQL.Clear;
		DmqCtrlDb.SQL.Add('SELECT '				);
		DmqCtrlDb.SQL.Add(	'Name, '			);		//	担当者名
		DmqCtrlDb.SQL.Add(	'TantoGCD '			);		//	担当者ｺｰﾄﾞ
		DmqCtrlDb.SQL.Add('FROM '				);
		DmqCtrlDb.SQL.Add(	'MOS_OFFICE_STAFF '	);
		DmqCtrlDb.SQL.Add('WHERE '				);
		DmqCtrlDb.SQL.Add(	'TantoNCD = :NCode'	);		//	担当者内部ｺｰﾄﾞ
		DmqCtrlDb.ParamByName('NCode').AsInteger	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
		DmqCtrlDb.Open;
		if (DmqCtrlDb.Eof <> True) then
		begin
			m_nChargeCode	:=	DmqCtrlDb.GetFLD('TantoGCD').AsInteger;
			m_strChargeName	:=	DmqCtrlDb.GetFLD('Name'	   ).AsString;
		end;
		m_fChargeDivision	:=	True;

		DmqCtrlDb.Close;
		DmqCtrlDb.Free;
}
		m_strLoginNCode		:= IntToStr(rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD);
		m_fChargeDivision	:= True;
	end;

// FX10001↓復帰
//{ストアド
	DmqData.Close;
	DmqData.SQL.Clear;
	DmqData.SQL.Add (fnMakeSQL (m_fChargeDivision, TRUE));

	if m_fChargeDivision = True then
	begin
//		DmqData.ParamByName('TANCD'  ).AsInteger := m_nChargeCode;  // FX10001削除
//		DmqData.ParamByName('TANNAME').AsString  := m_strChargeName;// FX10001削除
		DmqData.ParamByName('TANCD'  ).AsFloat := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;    // FX10001追加
	end;

	if (DmqData.ExecSQL  = False) then
	begin
		//  <マスタ同期>---Begin---
		//sMessage	:=	IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData));
		//showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
		sMessage	:=	IntToStr(m_cComArea.m_MsgStd.GetDBCode(DmqData) );
		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ﾏｽﾀｰ履歴ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりました。');//<210202>Upd 長音対応

		DmqData.Free;
		m_cDataModule.CopDBClose(m_cDBSelect);

		raise Exception.Create('');
		//  <マスタ同期>--- End ---
	end;

	DmqData.Close;
	DmqData.Free;
//}
// FX10001↑
//***********************

//<080214_2>↓
	m_SPMsHist := TFDStoredProc.Create(nil);
	with m_SPMsHist do
	begin
		ConnectionName := m_cDBSelect.ConnectionName;
		Connection  := m_cDBSelect;

		StoredProcName := 'MP_MSHIST_SETINFO';
		ParamBindMode  := pbByName;

		Params.Clear();
//<D10-Stored> S
		MJSPrepareStoredProc(m_SPMsHist);
{
		Params.CreateParam(ftInteger,	'@pSyoriKbn',		ptInput);
		Params.CreateParam(ftInteger,	'@pMSHistKbn',		ptInput);
		// <D10-P> mod Start ->
		//Params.CreateParam(ftCurrency,'@pTanNCode',		ptInput);
		Params.CreateParam(ftFloat,		'@pTanNCode',		ptInput);
		// <D10-P> mod End <-
		Params.CreateParam(ftString,	'@pTanSimpleName',	ptInput);
		Params.CreateParam(ftInteger,	'@pSysCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pOptCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pPrgCode',		ptInput);
}
//<D10-Stored> E
	end;
//<080214_2>↑

//<090616>↓
	m_ChkQry	:= TMQuery.Create(nil);
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, m_ChkQry);					// DBとMQueryの接続
//<090616>↑

	// FX>>
	m_vInit     :=  False;
	POwnerForm  :=  m_pRec^.m_pOwnerForm;       //  オーナーフォームを取得

	//  フリー項目設定ダイアログ初期化
	fnJNTFreeDlgLoad(m_pRec);
	fnJNTFreeDlgInit(m_pRec, m_pRec^.m_pSystemArea, @m_cDBSelect);

//    AOwner  :=  TForm(m_pRec^.m_pOwnerForm^); 	// 印刷対応 050803

	//  <マスタ同期>---Begin---
	if (ParentMasterDiv = 41)						// 部門
	or (ParentMasterDiv = 101) then					// セグメント
	begin
		m_SyncMaster.m_AOwner := TForm(m_pRec^.m_pOwnerForm^);
	end;
	//  <マスタ同期>--- End ---

	inherited   Create(POwnerForm^);            // ﾌｫｰﾑCreate
	// FX<<

end;


//************************************************************************
//*		Proccess		:	CMChildkey関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.CMChildkey (var Msg: TWMKey);
var
	cShiftState: TShiftState;
	strNameWork: String;

begin

//<130208>↓
	if ( GetKeyState(VK_MENU) < 0 ) then Exit;

	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);						// Shiftｷｰの取得
//<130208>↑

//<080311>↓
//	if	(Screen.ActiveControl.Name = CmnInstructionCombo.Name)	 						// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
//	or	(Screen.ActiveControl.Name = CmnInstructionComboDtl.Name) then					// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	if	(m_cACControl.Name = CmnInstructionCombo.Name)	 						// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	or	(m_cACControl.Name = CmnInstructionComboDtl.Name) then					// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
//<080311>↑
	begin
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then				// End & Esc
		begin
			//if (not CmnInstructionCombo.DroppedDown) then
//<080311>↓
//			if (not TMComboBox(Screen.ActiveControl).DroppedDown) then
			if (not TMComboBox(m_cACControl).DroppedDown) then
//<080311>↑
    	    begin
				Close ();
				Abort;
            end;
		end;

		//Exit;
	end;

    //--- HIS0028 St -----
	if (Msg.CharCode = VK_F1) and (cShiftState=[]) then
	begin
		//if FFunctionBar.FuncItems = ' F1 フリー項目入力' then
		//if FFunctionBar.FuncItems <> '' then
		//if (FFunctionBar.GetFuncCaption(1) <> '') then
		if (((ParentMasterDiv = 41) OR (ParentMasterDiv = 101))
		AND (DtlCmnClientPanel.Visible)) then
		begin
//<110131_3>↓
////<100903>↓
//			if (m_arFunction[0] <> '') then
////<100903>↑
			if (m_arFunction[0] <> '') and (FFunctionBar.Enabled = True) then
//<110131_3>↑
				ChgFree();
		end;
	end;
	//--- HIS0028 Ed -----


//<080311>↓
//	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then							// 実在Grid
	if	(m_cACControl.Name = StdCmnGridExist.Name) then							// 実在Grid
//<080311>↑
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then				// Home
		begin
			if	(StdCmnGridExist.EditingText = '') then
			begin
				StdCmnGridExist.FocusedColumn	:= 1;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then				// End
		begin
			if	(StdCmnGridExist.EditingText = '') then
			begin
				if	(StdCmnGridExist.FocusedColumn = 1) then
				begin
					if CmnInstructionCombo.Visible = True then								//★★★ コンボ
						CmnInstructionCombo.SetFocus ()
					else
						EDateStart.SetFocus ();				//★★★

					Abort;
				end
				else
				begin
					if	(m_nCurrentAdoptDiv <> 1) 											// 部門採用区分: 1=B/S採用
					AND ((ParentMasterDiv = 41) OR (ParentMasterDiv = 101)) then			// 部門 OR セグメント
//<100215_1>↓
//						StdCmnGridExist.FocusedColumn	:= 5
//					else
//						StdCmnGridExist.FocusedColumn	:= 4;
						StdCmnGridExist.FocusedColumn	:= 7
					else
						StdCmnGridExist.FocusedColumn	:= 6;
//<100215_1>↑
					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((StdCmnDataSourceExist.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridExist.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

			if CmnInstructionCombo.Visible = True then								//★★★ コンボ
				CmnInstructionCombo.SetFocus ()
			else
				EDateStart.SetFocus ();				//★★★

			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if ((StdCmnGridExist.FocusedNode.Index = 0)
			and	(StdCmnGridExist.FocusedColumn = 1)) then
//			if	(StdCmnGridExist.FocusedColumn = 1) then
			begin
				if StdCmnTab.Enabled then
					StdCmnTab.SetFocus()
				else
					MjsDispCtrl.MjsPrevCtrl (Self);
				//m_cACControl	:= StdCmnTab;
				//m_cACControl.SetFocus ();
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		begin
//<090721_2>↓
//			if (StdCmnGridExist.Columns [1].Field.Text = '') then		// 外部コード未入力
//			begin
//				MjsDispCtrl.MjsNextCtrl (Self);
//				//m_cACControl	:= StdCmnTab;
//				//m_cACControl.SetFocus ();
//				Abort;
//			end;
			if	((StdCmnDataSourceExist.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridExist.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;
//<090721_2>↑
		end;

		//略称でF8キー
		if	((StdCmnGridExist.FocusedColumn = 3) and ((Msg.CharCode = VK_F8) and (cShiftState = []))) then
		begin
//<131001>↓
			if (m_arFunction[7] <> '') and (FFunctionBar.Enabled = True) then
			begin
//<131001>↑
				strNameWork	:= StdCmnMemDataExist.FieldByName('strName').AsString;			// 正式名称

				if	(strNameWork <> '') then
				begin
					StdCmnMemDataExist.Edit ();
					StdCmnMemDataExist.FieldByName('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
					StdCmnMemDataExist.Post ();
				end;

				Abort;
//<131001>↓
			end;
//<131001>↑
		end;

		Exit;
	end;

//<080311>↓
//	if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then							// 合計Grid
	if	(m_cACControl.Name = StdCmnGridTotal.Name) then							// 合計Grid
//<080311>↑
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then				// Home
		begin
			if	(StdCmnGridTotal.EditingText = '') then
			begin
				StdCmnGridTotal.FocusedColumn	:= 1;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then				// End
		begin
			if	(StdCmnGridTotal.EditingText = '') then
			begin
				if	(StdCmnGridTotal.FocusedColumn = 1) then
				begin
					if CmnInstructionCombo.Visible = True then								//★★★ コンボ
						CmnInstructionCombo.SetFocus ()
					else
						EDateStart.SetFocus ();				//★★★

					Abort
				end
				else
				begin
//<100215_1>↓
//					StdCmnGridTotal.FocusedColumn	:= 4;
					StdCmnGridTotal.FocusedColumn	:= 6;
//<100215_1>↑
					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((StdCmnDataSourceTotal.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridTotal.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

			if CmnInstructionCombo.Visible = True then								//★★★ コンボ
				CmnInstructionCombo.SetFocus ()
			else
				EDateStart.SetFocus ();				//★★★

			Abort;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if ((StdCmnGridTotal.FocusedNode.Index = 0)			// １行目
			and	(StdCmnGridTotal.FocusedColumn = 1)) then		// １列目
//			if	(StdCmnGridTotal.FocusedColumn = 1) then
			begin
				if StdCmnTab.Enabled then
					StdCmnTab.SetFocus()
				else
					MjsDispCtrl.MjsPrevCtrl (Self);
				//m_cACControl	:= StdCmnTab;
				//m_cACControl.SetFocus ();
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
		begin
//<110801>↓
//			if (StdCmnGridTotal.Columns [1].Field.Text = '') then		// 外部コード未入力
//			begin
//				MjsDispCtrl.MjsNextCtrl (Self);
//				//m_cACControl	:= StdCmnTab;
//				//m_cACControl.SetFocus ();
//				Abort;
//			end;
			if	((StdCmnDataSourceTotal.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridTotal.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;
//<110801>↑
		end;

		//略称でF8
		if	((StdCmnGridTotal.FocusedColumn = 3) and ((Msg.CharCode = VK_F8) and (cShiftState = []))) then
		begin
//<131001>↓
			if (m_arFunction[7] <> '') and (FFunctionBar.Enabled = True) then
			begin
//<131001>↑
				strNameWork	:= StdCmnMemDataTotal.FieldByName('strName').AsString;			// 正式名称

				if	(strNameWork <> '') then
				begin
					StdCmnMemDataTotal.Edit ();
					StdCmnMemDataTotal.FieldByName('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
					StdCmnMemDataTotal.Post ();
				end;

				Abort;
//<131001>↓
			end;
//<131001>↑
		end;

		Exit;
	end;

	if	((StdCmnTab.Focused) or (DtlCmnTab.Focused)) then								// 一覧/詳細ﾀﾌﾞ
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			//MjsDispCtrl.MjsPrevCtrl (Self);
//            if StdCmnTab.Focused then
				//MjsDispCtrl.MjsPrevCtrl (Self);   //<009>
//            else
//				DtlCmnButtonCancel.SetFocus ();

            //<009> ↓ 部門：移動せず／ｾｸﾞﾒﾝﾄ：ｺﾝﾎﾞへ移動
            if  (ParentMasterDiv = 101) then
                MjsDispCtrl.MjsPrevCtrl (Self);
            //<009> ↑

			Abort;
		end
		else if (StdCmnTab.Focused and ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN))) then
		begin
			MjsDispCtrl.MjsNextCtrl (Self);
            {
			if	(StdCmnTab.Items [0].Selected) then										// 実在Grid
				m_cACControl	:= StdCmnGridExist
			else																		// 合計Grid
				m_cACControl	:= StdCmnGridTotal;

			m_cACControl.SetFocus ();
            }
			Abort;
		end
		else if	(DtlCmnTab.Focused and ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN))) then
        begin
			MjsDispCtrl.MjsNextCtrl (Self);
            {
			if	(m_nCurrentCodeAttr <= 1) then
				DtlCmnEditExCodeNumeric.SetFocus
			else
				DtlCmnEditExCodeFree.SetFocus;
            }
        	abort;
		end;
	end;

	if	(DtlCmnEditExCodeNumeric.Focused or										// ｴﾃﾞｨｯﾄ[部門ｺｰﾄﾞ]
		 DtlCmnEditExCodeFree   .Focused) then
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			//MjsDispCtrl.MjsPrevCtrl (Self);
			DtlCmnTab.SetFocus ();
			Abort;
		end;

//		Exit;
	end;

	if	(DtlCmnEditAssociation.Focused) then											// ｴﾃﾞｨｯﾄ [連想]
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			MjsDispCtrl.MjsPrevCtrl (Self);
			//m_cACControl	:= DtlCmnEditNameSimple;
			//m_cACControl.SetFocus ();

			Abort;
		end;
	end;
{
	if	(DtlCmnButtonUpdate.Focused) then										// 詳細画面 ﾎﾞﾀﾝ[更新]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or				// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;
}
//<080311>↓
//	if	(Screen.ActiveControl.Name = DtlCmnEditNameSimple.Name) then
	if	(m_cACControl.Name = DtlCmnEditNameSimple.Name) then
//<080311>↑
	begin
		if	((Msg.CharCode = VK_F8) and (cShiftState = [])) then						// F8
		begin
//<131001>↓
			if (m_arFunction[7] <> '') and (FFunctionBar.Enabled = True) then
			begin
//<131001>↑
				strNameWork	:= DtlCmnEditName.Text;											// 正式名称

				if	(strNameWork <> '') then
					DtlCmnEditNameSimple.Text	:= MJSKabuCut (strNameWork, 14);

				Abort;
//<131001>↓
			end;
//<131001>↑
		end;
	end;


	// FX ?
	if	((Msg.CharCode = VK_TAB) and (cShiftState = [])) then
	begin
//<080311>↓
//		if (Screen.ActiveControl.Name = CmnInstructionCombo.Name)
//		OR (Screen.ActiveControl.Name = CmnInstructionComboDtl.Name) then
		if (m_cACControl.Name = CmnInstructionCombo.Name)
		OR (m_cACControl.Name = CmnInstructionComboDtl.Name) then
//<080311>↑
		begin
//<080311>↓
//			if Screen.ActiveControl.Name = 'CmnInstructionComboDtl' then
			if m_cACControl.Name = 'CmnInstructionComboDtl' then
//<080311>↑
				CmnInstructionCombo.ItemIndex := CmnInstructionComboDtl.ItemIndex;
//<080311>↓
//			if Screen.ActiveControl.Name = 'CmnInstructionCombo' then				// <010>
			if m_cACControl.Name = 'CmnInstructionCombo' then				// <010>
//<080311>↑
				CmnInstructionComboDtl.ItemIndex := CmnInstructionCombo.ItemIndex;	// <010>

//        	// 選択されている　＆＆　次のフォーカスがない
//			if (CmnInstructionCombo.Text <> '') AND (not MPanel3.Enabled) then
				m_fIgnoreProc	:= TRUE;
				if (not fnChangeSelectionScreen ()) then
                	Abort;
        end;

		//if	(Screen.ActiveControl.Name <> CmnInstructionCombo.Name) then
			MjsDispCtrl.MjsNextCtrl (Self);
	    Abort;
    end
	else if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
	begin
		// グリッドの場合
//<080311>↓
//		if ((Screen.ActiveControl.Name = StdCmnGridExist.Name)
//		 or (Screen.ActiveControl.Name = StdCmnGridTotal.Name)) then
		if ((m_cACControl.Name = StdCmnGridExist.Name)
		 or (m_cACControl.Name = StdCmnGridTotal.Name)) then
//<080311>↑
        begin
           	if StdCmnTab.Enabled then
               	StdCmnTab.SetFocus()
            else
				MjsDispCtrl.MjsPrevCtrl (Self);
        end
		// コードの場合
//<080311>↓
//		else if ((Screen.ActiveControl.Name = DtlCmnEditExCodeFree.Name)
//		 or (Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name)) then
		else if ((m_cACControl.Name = DtlCmnEditExCodeFree.Name)
		 or (m_cACControl.Name = DtlCmnEditExCodeNumeric.Name)) then
//<080311>↑
        begin
           	if DtlCmnTab.Enabled then
               	DtlCmnTab.SetFocus()
            else
				MjsDispCtrl.MjsPrevCtrl (Self);
        end
        //<009> ↓
//<080311>↓
//		else if (Screen.ActiveControl.Name = CmnInstructionComboDtl.Name) then
		else if (m_cACControl.Name = CmnInstructionComboDtl.Name) then
//<080311>↑
			Abort
		//<009> ↑
//<080311>↓
//		else if (Screen.ActiveControl.Name <> CmnInstructionCombo.Name) then
		else if (m_cACControl.Name <> CmnInstructionCombo.Name) then
//<080311>↑
			MjsDispCtrl.MjsPrevCtrl (Self);
	    Abort;
    end;
	// FX ?

	inherited;
end;


//************************************************************************
//*		Proccess		:	fnOnCreate関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnOnCreate (Sender: TObject);
var
    dqMasterInfo  : TMQuery;
    nItemPosition : Integer;
    nCount        : Integer;
    iZoomSize     : Integer;
    i			  : Integer;
//<MLWK>↓
	sMLWF		:	String;
//<MLWK>↑
begin
	Parent          := TPanel (m_pRec^.m_pOwnerPanel^);
	Align           := alClient;

	dqMasterInfo    := TMQuery.Create (Self);			    		                        // MQueryの構築		// 050606

//<MLXHAP>↓
	//初期化
	m_DEPflg	:= False;
	m_LEAflg	:= False;
	m_HAPflg	:= False;	//<MLXHAP>

	//固定資産
	if		0 <> pos('DEP', m_pRec^.m_sParameter) then
	begin
		m_DEPflg := True;
	end
	//リース資産
	else if	0 <> pos('LEA', m_pRec^.m_sParameter) then
	begin
		m_LEAflg := True;
	end
	//給与大将
	else if	0 <> pos('HAP', m_pRec^.m_sParameter) then
	begin
		m_HAPflg := True;
	end;
//<MLXHAP>↑

//  <マスタ同期>---Begin---
	if IsChild() then							// 子会社
	begin
		// 使用可能ｺｰﾄﾞは全社から取得する
		m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterInfo    );                            // 全社DBとMQueryの接続
		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear;
			SQL.Add ('SELECT DTName7 FROM DTMAIN');

			Open ();

			m_strValidCharacters	:= FieldByName('DTName7').AsString;					// 使用可能ｺｰﾄﾞ

			Close ();
		end;
	end;
//  <マスタ同期>--- End ---
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo    );	                                // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdCmnQueryExist);	                                // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, StdCmnQueryTotal);	                                // DBとMQueryの接続

	UseFlg := True;
	with (dqMasterInfo) do
	begin
		Close ();

		SQL.Clear;
		SQL.Add ('SELECT YearKbn, KStDate, KEdDate, DTName7 FROM DTMAIN');

		Open ();

		m_nDateFormatDivision	:= FieldByName('YearKbn').AsInteger;					// 和暦/西暦区分
		//  <マスタ同期>---Begin---
		if not IsChild() then					// 子会社以外
		begin
			m_strValidCharacters	:= FieldByName('DTName7').AsString;				// 使用可能ｺｰﾄﾞ
		end;
		//  <マスタ同期>--- End ---
		m_nKStDate	:= FieldByName('KStDate').AsDateTime;								// 当期開始日
		m_nKEdDate	:= FieldByName('KEdDate').AsDateTime;								// 当期終了日

		Close ();
	end;

	if	(m_nDateFormatDivision = 0) then												// 和暦/西暦区分: 0=和暦
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfEMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfEMD;
	//<NewEra>St
	//	DtlCmnEditAppDateStart.Gengou		:=	'H';
	//	DtlCmnEditAppDateEnd  .Gengou		:=	'H';

		DtlCmnEditAppDateStart.Gengou		:=	#0;
		DtlCmnEditAppDateEnd  .Gengou		:=	#0;
	//<NewEra>Ed
		EDateStart.DateFormat	:=	dfEMD;
		EDateEnd  .DateFormat	:=	dfEMD;
	//<NewEra>St
	//	EDateStart.Gengou		:=	'H';
	//	EDateEnd  .Gengou		:=	'H';

		EDateStart.Gengou		:=	#0;
		EDateEnd  .Gengou		:=	#0;
	//<NewEra>Ed
//<100215_1>↓
		StdCmnGridExistStartDate.DateEditFormat	:=	dxExEdtr.dfEMD;
		StdCmnGridExistEndDate.DateEditFormat	:=	dxExEdtr.dfEMD;
	//<NewEra>St
	//	StdCmnGridExistStartDate.Gengou			:=	'H';
	//	StdCmnGridExistEndDate.Gengou			:=	'H';

		StdCmnGridExistStartDate.Gengou			:=	GetEraName(Now, emAlpha, '')[1];
		StdCmnGridExistEndDate.Gengou			:=	GetEraName(Now, emAlpha, '')[1];
	//<NewEra>Ed
		StdCmnMemDataExistStartDate.DisplayFormat := 'g ee/mm/dd';
		StdCmnMemDataExistEndDate.DisplayFormat := 'g ee/mm/dd';
		StdCmnGridTotalStartDate.DateEditFormat	:=	dxExEdtr.dfEMD;
		StdCmnGridTotalEndDate.DateEditFormat	:=	dxExEdtr.dfEMD;
	//<NewEra>St
	//	StdCmnGridTotalStartDate.Gengou			:=	'H';
	//	StdCmnGridTotalEndDate.Gengou			:=	'H';

		StdCmnGridTotalStartDate.Gengou			:=	GetEraName(Now, emAlpha, '')[1];
		StdCmnGridTotalEndDate.Gengou			:=	GetEraName(Now, emAlpha, '')[1];
	//<NewEra>Ed
		StdCmnMemDataTotalStartDate.DisplayFormat := 'g ee/mm/dd';
		StdCmnMemDataTotalEndDate.DisplayFormat := 'g ee/mm/dd';
//<100215_1>↑
//		EDateStart.AsString		:= FormatDateTime('ee/mm/dd', m_nKStDate);
//		EDateStart.AsString		:= FormatDateTime('ee/mm/dd', m_nKEdDate);
//050425>>
		//デフォルトは1900/01/01～2099/12/31
//		EDateStart.AsDateTime	:= m_nKStDate;
//		EDateEnd.AsDateTime	:= m_nKEdDate;
//050425<<
	end
	else																				// 和暦/西暦区分: 1=西暦
	begin
		DtlCmnEditAppDateStart.DateFormat	:=	dfYMD;
		DtlCmnEditAppDateEnd  .DateFormat	:=	dfYMD;
		DtlCmnEditAppDateStart.Gengou		:=	#0;
		DtlCmnEditAppDateEnd  .Gengou		:=	#0;
		EDateStart.DateFormat	:=	dfYMD;
		EDateEnd  .DateFormat	:=	dfYMD;
		EDateStart.Gengou		:=	#0;
		EDateEnd  .Gengou		:=	#0;
//<100215_1>↓
		StdCmnGridExistStartDate.DateEditFormat	:=	dxExEdtr.dfYMD;
		StdCmnGridExistEndDate.DateEditFormat	:=	dxExEdtr.dfYMD;
		StdCmnGridExistStartDate.Gengou			:=	#0;
		StdCmnGridExistEndDate.Gengou			:=	#0;
		StdCmnMemDataExistStartDate.DisplayFormat := 'yyyy/mm/dd';
		StdCmnMemDataExistEndDate.DisplayFormat := 'yyyy/mm/dd';
		StdCmnGridTotalStartDate.DateEditFormat	:=	dxExEdtr.dfYMD;
		StdCmnGridTotalEndDate.DateEditFormat	:=	dxExEdtr.dfYMD;
		StdCmnGridTotalStartDate.Gengou			:=	#0;
		StdCmnGridTotalEndDate.Gengou			:=	#0;
		StdCmnMemDataTotalStartDate.DisplayFormat := 'yyyy/mm/dd';
		StdCmnMemDataTotalEndDate.DisplayFormat := 'yyyy/mm/dd';
//<100215_1>↑
//050425>>
		//デフォルトは1900/01/01～2099/12/31
//		EDateStart.AsDateTime	:= m_nKStDate;
//		EDateEnd.AsDateTime	:= m_nKEdDate;
//050425<<
	end;

    for nCount := 1 to ITEM_MAX do
    begin
        m_stSelectItem [nCount].nMasterDivision := 0;
        m_stSelectItem [nCount].strItemCaption  := '';
    end;

	for nCount := 0 to 10 do
	begin
		m_bHojyoTreeDelete [nCount]	:= 0;
		m_bHojyoTree2      [nCount]	:= 0;
	end;

	//	{★★★
	//*if (ParentMasterDiv = 41) OR (ParentMasterDiv = 101) then  								//<MLXDEP>
	if ((ParentMasterDiv = 41) OR (ParentMasterDiv = 101)) and ((TMSeries.IsMjsLink3 = False)) then     //<MLXDEP>
	begin
		// ｸﾞﾘｯﾄﾞ[分類]用MemData 初期化
		StdCmnMemDataClass.Open;
	    StdCmnMemDataClass.Append;
		StdCmnMemDataClass.FieldByName('nDivision'     ).AsInteger	:= 0;
		StdCmnMemDataClass.FieldByName('strDescription').AsString	:= 'P/L';
		StdCmnMemDataClass.Post;
	    StdCmnMemDataClass.Append;
		StdCmnMemDataClass.FieldByName('nDivision'     ).AsInteger	:= 1;
		StdCmnMemDataClass.FieldByName('strDescription').AsString	:= 'B/S+P/L';
		StdCmnMemDataClass.Post;
	    StdCmnMemDataClass.Append;
		StdCmnMemDataClass.FieldByName('nDivision'     ).AsInteger	:= 2;
		StdCmnMemDataClass.FieldByName('strDescription').AsString	:= 'B/S';
		StdCmnMemDataClass.Post;
	end
	else
	begin
	//<100215_1>↓
	//	StdCmnGridExist.Bands[8].Visible := False;
		StdCmnGridExist.Bands[10].Visible := False;
	//<100215_1>↑
	end;
	//   	★★★}

	m_cPreview	:= TMJSPreviewIF.Create ();
	m_cPreview.Init (m_pRec);

    if ParentMasterDiv = 101 then		// セグメントだったらコンボ
    begin
	    CmnInstructionCombo.Visible := True;
        MLabel11.Visible := True;
	    CmnInstructionComboDtl.Visible := True;
        MLabel13.Visible := True;
    end
    else 	    						// セグメント以外
    begin
		CmnInstructionCombo.Visible := False;
        MLabel11.Visible := False;
	    CmnInstructionComboDtl.Visible := False;
        MLabel13.Visible := False;

		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear;
			SQL.ADD ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
        	SQL.ADD ('WHERE  MasterKbn = :MasterKbn AND UseKbn <> 0 ORDER BY MasterKbn');
			ParamByName ('MasterKbn').AsInteger	:= ParentMasterDiv;

			Open ();

			if (not EOF) then
			begin
				m_stMasterItem.nMasterDivision	:= GetFld ('MasterKbn' ).AsInteger;		// ﾏｽﾀ区分
				m_stMasterItem.strItemCaption	:= GetFld ('JHojyoName').AsString;  	// 補助名称(実在)
				m_stMasterItem.nCodeDigit		:= GetFld ('CodeDigit' ).AsInteger; 	// ｺｰﾄﾞ桁数
				m_stMasterItem.nCodeAttribute	:= GetFld ('CodeAttr'  ).AsInteger; 	// ｺｰﾄﾞ属性
				m_stMasterItem.nAdoptDivision	:= GetFld ('UseKbn'    ).AsInteger;		// 採用区分 (1:P/Lのみ採用, 2:B/S&P/L採用)

				if	(m_stMasterItem.strItemCaption = '') then							// 省略時はﾏｽﾀ区分名称と同一
				begin
					case (m_stMasterItem.nMasterDivision) of
						41 : m_stMasterItem.strItemCaption	:= '部門';
						86 : m_stMasterItem.strItemCaption	:= '職種';
						87 : m_stMasterItem.strItemCaption	:= '役職';
						88 : m_stMasterItem.strItemCaption	:= '職能資格';
						89 : m_stMasterItem.strItemCaption	:= '職位';
					end;
				end;
			end
            else																// 採用なし
			begin
				UseFlg := False;
				PostMessage (Self.Handle, WM_ONPAINT, 0, 0);					// ｲﾍﾞﾝﾄOnCreateの最後に
			end;
			Close ();
		end;
		//  <マスタ同期>---Begin---
		if IsChild() then						// 子会社
		begin
			// 全社DBのMasterInfoと比較
			i := m_SyncMaster.fnChkP_MasterInfo( m_stMasterItem.nMasterDivision );
			if i <> JNTSYNC_RET_MASCHK_OK then
			begin
				if UseFlg then					// 初エラー
				begin
					UseFlg := False;
					PostMessage (Self.Handle, WM_ONPAINT, Abs(i), Abs(i));			// ｲﾍﾞﾝﾄOnCreateの最後に
				end;
			end;
		end;
		//  <マスタ同期>--- End ---
	end;

	// 部門かセグメントの場合
	if (ParentMasterDiv = 41) OR (ParentMasterDiv = 101) then
	begin
		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear;
			SQL.ADD ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
			SQL.ADD ('WHERE  (MasterKbn >= :seg01 AND MasterKbn <= :seg10) AND UseKbn <> 0 ORDER BY MasterKbn');
			ParamByName ('seg01').AsInteger	:= MK_SEG01;
			ParamByName ('seg10').AsInteger	:= MK_SEG01 + 9;

			Open ();

			nItemPosition   := 1;
			while (not EOF) do
			begin
				m_stSelectItem [nItemPosition].nMasterDivision	:= GetFld ('MasterKbn' ).AsInteger;		// ﾏｽﾀ区分
				m_stSelectItem [nItemPosition].strItemCaption	:= GetFld ('JHojyoName').AsString;  	// 補助名称(実在)
				m_stSelectItem [nItemPosition].nCodeDigit		:= GetFld ('CodeDigit' ).AsInteger; 	// ｺｰﾄﾞ桁数
				m_stSelectItem [nItemPosition].nCodeAttribute	:= GetFld ('CodeAttr'  ).AsInteger; 	// ｺｰﾄﾞ属性
				m_stSelectItem [nItemPosition].nAdoptDivision	:= GetFld ('UseKbn'    ).AsInteger;		// 採用区分 (1:P/Lのみ採用, 2:B/S&P/L採用)

				if	(m_stSelectItem [nItemPosition].strItemCaption = '') then							// 省略時はﾏｽﾀ区分名称と同一
				begin
					case (m_stSelectItem [nItemPosition].nMasterDivision) of
						MK_SEG01    :	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ1';
						MK_SEG01 + 1:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ2';
						MK_SEG01 + 2:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ3';
						MK_SEG01 + 3:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ4';
						MK_SEG01 + 4:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ5';
						MK_SEG01 + 5:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ6';
						MK_SEG01 + 6:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ7';
						MK_SEG01 + 7:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ8';
						MK_SEG01 + 8:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ9';
						MK_SEG01 + 9:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ10';
					end;
				end;

				if ParentMasterDiv = 101 then
				begin
					CmnInstructionCombo.Items.Add (m_stSelectItem [nItemPosition].strItemCaption);
					CmnInstructionComboDtl.Items.Add (m_stSelectItem [nItemPosition].strItemCaption);
                end;
				nItemPosition   := nItemPosition + 1;

				NEXT;
			end;
			if (ParentMasterDiv = 101) AND (nItemPosition = 1) then             // 採用なし
			begin
				//  <マスタ同期>---Begin---
				if UseFlg then					// 初エラー
				begin
				//  <マスタ同期>--- End ---
					UseFlg := False;
					PostMessage (Self.Handle, WM_ONPAINT, 0, 0);					// ｲﾍﾞﾝﾄOnCreateの最後に
				//  <マスタ同期>---Begin---
				end;
				//  <マスタ同期>--- End ---
			end;

			Close ();
		end;
	end;

//  <マスタ同期>---Begin---
	if IsChild() then							// 子会社
	begin
// <012> ADD start
        if not GetSegMasterKbn then   			// ｾｸﾞﾒﾝﾄのﾏｽﾀ区分を取得
        begin
        	PostMessage (Self.Handle, WM_ONPAINT, 99, 99);
        	UseFlg := False;
        end;
// <012> ADD end


		// 未配信分を配信
		m_cDataModule.BeginTran(m_cDBSelect);


		if m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) then
		begin
			m_cDataModule.Commit(m_cDBSelect);
		end
		else
		begin
			if UseFlg then					// 初エラー
			begin
				UseFlg := False;
				m_cDataModule.Rollback(m_cDBSelect);
				PostMessage (Self.Handle, WM_ONPAINT, 99, 99);					// ｲﾍﾞﾝﾄOnCreateの最後に
			end;
		end;
	end;

	m_bKanendo := False;
	// 全社の過年度DBを選択している場合
	if IsParent() then
	begin
		if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
		begin
			if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
									'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
			begin
				// 通常のﾏｽﾀ登録として起動する。
				// 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
			end
			else
			begin
				m_bKanendo	:= True;			// 翌期更新済み
			end;
		end;
	end
	// 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
	else if IsChild() then
	begin
		// 子会社が過年度DBの場合
		if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
		begin
			MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
								'グループ会計', mjInformation, mjOk, mjDefOk);
			m_bKanendo	:= True;				// 翌期更新済み
		end
		// 親会社が過年度DBの場合
		else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
		begin
			MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
								'グループ会計', mjInformation, mjOk, mjDefOk);
			m_bKanendo	:= True;				// 翌期更新済み
		end;
	end;
//  <マスタ同期>--- End ---

{
	with (dqMasterInfo) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
        SQL.ADD ('WHERE  ((MasterKbn = 41) OR (MasterKbn >= :seg01 AND MasterKbn <= :seg10)) AND UseKbn <> 0 ORDER BY MasterKbn');
		ParamByName ('seg01').AsInteger	:= MK_SEG01;
		ParamByName ('seg10').AsInteger	:= MK_SEG01 + 9;

		Open ();

		while (not EOF) do
		begin
			m_stSelectItem [nItemPosition].nMasterDivision	:= GetFld ('MasterKbn' ).AsInteger;		// ﾏｽﾀ区分
			m_stSelectItem [nItemPosition].strItemCaption	:= GetFld ('JHojyoName').AsString;  	// 補助名称(実在)
			m_stSelectItem [nItemPosition].nCodeDigit		:= GetFld ('CodeDigit' ).AsInteger; 	// ｺｰﾄﾞ桁数
			m_stSelectItem [nItemPosition].nCodeAttribute	:= GetFld ('CodeAttr'  ).AsInteger; 	// ｺｰﾄﾞ属性
			m_stSelectItem [nItemPosition].nAdoptDivision	:= GetFld ('UseKbn'    ).AsInteger;		// 採用区分 (1:P/Lのみ採用, 2:B/S&P/L採用)

			if	(m_stSelectItem [nItemPosition].strItemCaption = '') then							// 省略時はﾏｽﾀ区分名称と同一
			begin
				case (m_stSelectItem [nItemPosition].nMasterDivision) of
					41          :	m_stSelectItem [nItemPosition].strItemCaption	:= '部門';
					MK_SEG01    :	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ1';
					MK_SEG01 + 1:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ2';
					MK_SEG01 + 2:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ3';
					MK_SEG01 + 3:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ4';
					MK_SEG01 + 4:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ5';
					MK_SEG01 + 5:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ6';
					MK_SEG01 + 6:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ7';
					MK_SEG01 + 7:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ8';
					MK_SEG01 + 8:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ9';
					MK_SEG01 + 9:	m_stSelectItem [nItemPosition].strItemCaption	:= 'ｾｸﾞﾒﾝﾄ10';
				end;
			end;

			if GetFld ('MasterKbn' ).AsInteger <> 41 then
				CmnInstructionCombo.Items.Add (m_stSelectItem [nItemPosition].strItemCaption);

			nItemPosition   := nItemPosition + 1;

			NEXT;
		end;

		Close ();
	end;

	if	(nItemPosition = 1) then														// 採用なし
		PostMessage (Self.Handle, WM_ONPAINT, 0, 0);									// ｲﾍﾞﾝﾄOnCreateの最後に
}

	if ParentMasterDiv = 41 then
	begin
		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT * FROM SegMA ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0');

			ParamByName ('nMasterDivision').AsInteger	:= ParentMasterDiv;

			Open ();

			if	(not EOF) then
	        begin
				SegMa[1]  := FieldByName('SegUse1' ).AsInteger;
				SegMa[2]  := FieldByName('SegUse2' ).AsInteger;
				SegMa[3]  := FieldByName('SegUse3' ).AsInteger;
				SegMa[4]  := FieldByName('SegUse4' ).AsInteger;
				SegMa[5]  := FieldByName('SegUse5' ).AsInteger;
				SegMa[6]  := FieldByName('SegUse6' ).AsInteger;
				SegMa[7]  := FieldByName('SegUse7' ).AsInteger;
				SegMa[8]  := FieldByName('SegUse8' ).AsInteger;
				SegMa[9]  := FieldByName('SegUse9' ).AsInteger;
				SegMa[10] := FieldByName('SegUse10').AsInteger;
	        end;
		end;
	end;

	// 部門かセグメントの場合
    if (ParentMasterDiv = 41) OR (ParentMasterDiv = 101) then
	begin
		// 分類コード
		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear;
			SQL.ADD ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr FROM MasterInfo ');
    	    SQL.ADD ('WHERE  ((MasterKbn >= :Bunrui01 AND MasterKbn <= :Bunrui10)) AND UseKbn <> 0 ORDER BY MasterKbn');
			ParamByName ('Bunrui01').AsInteger	:= BunruiMKbn + 1;
			ParamByName ('Bunrui10').AsInteger	:= BunruiMKbn + 10;

			Open ();

			while (not EOF) do
			begin
				nItemPosition := GetFld ('MasterKbn' ).AsInteger - BunruiMKbn;
				m_stBunruiItem [nItemPosition].nMasterDivision	:= GetFld ('MasterKbn' ).AsInteger;		// ﾏｽﾀ区分
				m_stBunruiItem [nItemPosition].strItemCaption	:= GetFld ('JHojyoName').AsString;  	// 補助名称(実在)
				m_stBunruiItem [nItemPosition].nCodeDigit		:= GetFld ('CodeDigit' ).AsInteger; 	// ｺｰﾄﾞ桁数
				m_stBunruiItem [nItemPosition].nCodeAttribute	:= GetFld ('CodeAttr'  ).AsInteger; 	// ｺｰﾄﾞ属性
				m_stBunruiItem [nItemPosition].nAdoptDivision	:= GetFld ('UseKbn'    ).AsInteger;		// 採用区分 (1:P/Lのみ採用, 2:B/S&P/L採用)

				if	(m_stBunruiItem [nItemPosition].strItemCaption = '') then							// 省略時はﾏｽﾀ区分名称と同一
					m_stBunruiItem [nItemPosition].strItemCaption	:= 'BI分類' + IntToStr(nItemPosition);

				NEXT;
			end;

			Close ();
		end;
	end
    else
	    CmnToolbarButtonTag.Visible := False;

	m_nCurrentMasterDiv := 0;
	m_nCurrentCodeDigit := 10;
	m_nCurrentCodeAttr  := 0;
	m_nCurrentAdoptDiv	:= 0;
	m_nSelectTagKind	:= 0;
	m_nDBErrorCode		:= 0;
	m_strExCodeTotal	:= '';
	m_strExCodeCurrent  := '';
	m_cNodePrevSelect	:= nil;
	m_fUpdateRecord     := TRUE;
//	m_fDtlNewRecord		:= FALSE;
	m_fIgnoreProc		:= FALSE;

	m_fComboBoxListDraw	:= TRUE;

	m_fChangeDetails	:= FALSE;

	m_stWorkRecPaste.nDivision  := 9;
	m_stWorkRecPaste.strExCode  := '';
	m_stWorkRecPaste.strName    := '';

   	m_SearchInfo.sBmnCD := '';													//HIS0028

    for i := 1 to 10 do
    begin
	    DtlCmnEditSegCD[i].InputFlagEnabled := True;
	    DtlCmnEditSegCD[i].Zero := True;

	    DtlCmnEditBunruiCD[i].InputFlagEnabled := False;
		DtlCmnEditBunruiCD[i].Zero := False;
    end;

	CmnSplitter           .Enabled	:= FALSE;
	CmnToolbarButtonPrint .Enabled	:= FALSE;

	CmnToolbarButtonDetail.Enabled	:= FALSE;
	CmnToolbarButtonDelete.Enabled	:= FALSE;
	fnEnableToolbarButtonTag (FALSE);
//	StdCmnClientPanel     .Enabled	:= FALSE;
	StdCmnClientPanelExist.Enabled	:= FALSE;
    MPanel3				  .Enabled	:= FALSE;
    MPanel4				  .Enabled	:= FALSE;
	StdCmnClientPanelTotal.Enabled	:= FALSE;

	DtlCmnClientPanel     .Enabled	:= FALSE;

//★★★	DtlCmnLabelCostRateTitle   .Visible	:= FALSE;										// 個別原価率は非表示
//	DtlCmnEditCostRate         .Visible	:= FALSE;
//★★★	DtlCmnLabelCostRateAddition.Visible	:= FALSE;

    //<006> ↓詳細画面ｺｰﾄﾞ初期化
    DtlCmnEditExCodeFree.Text   := '';
    DtlCmnEditExCodeNumeric.Value:= 0;
    DtlCmnEditExCodeNumeric.InputFlag   := TRUE;
    //<006> ↑

	DtlCmnClientPanel.Visible   := False;												// 詳細画面非表示

	StdCmnGridExist.FocusedColumn   := 1;
	StdCmnGridTotal.FocusedColumn   := 1;

	DtlCmnImageTag.Picture	:= nil;														////////////////////////


    if ParentMasterDiv = 101 then
    begin
    	if CmnInstructionCombo.Items.Count = 1 then								// 有効なセグメントが一つ
			CmnInstructionCombo.ItemIndex := 0;

		m_cACControl    := CmnInstructionCombo;
    end
	else
		m_cACControl    := EDateStart;

	m_fAccessTab    := True;

	MJSColorChange (TJNTCRP0020030f (Self), m_cComArea.SystemArea.SysColorB, 	 m_cComArea.SystemArea.SysColorD,
											m_cComArea.SystemArea.SysBaseColorB, m_cComArea.SystemArea.SysBaseColorD,
															rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

//	MJSFontResize (TJNTCRP0020030f (Self),Pointer (m_pRec));
    iZoomSize   := MJSFontResize (TJNTCRP0020030f (Self),Pointer (m_pRec));

	// ToolBarの位置    HIS0029
//	ToolBar1.Left         := B_Search.Left     + B_Search.Width;
    DefPosition := ToolBar1.Left;
//	ToolBar1.Height       := B_Search.Height-1 + B_Search.Top;
//    MjsCompoResize(ToolBar1, 0, Pointer(m_pRec));
	//ToolBar1.ButtonHeight := B_Search.Height   + B_Search.Top;

//    if iZoomSize > 100 then
//        ToolBar1.Images := CmnImageGeneral
//    else
//        ToolBar1.Images := CmnImageGeneral;
//<MLXDSP>↓
	// 付箋ボタンはMJSFontResizeで拡大しない
	MjsCompoResize(ToolBar1,0,pointer(m_pRec));
	with ToolBar1 do
	begin
		ButtonHeight	:= Height;
		ButtonWidth		:= Trunc(ButtonWidth * iZoomSize / 100);
	end;
//<MLXDSP>↑

    ScrollBox3.VertScrollBar.Increment := (24 * iZoomSize) div 100;
    ScrollBox4.VertScrollBar.Increment := (24 * iZoomSize) div 100;

	//資産項目は非表示(050425)
	PDtlDepPanel.Visible := False;
//    MLine3t.Visible := False;
    MLabel12.Visible := False;
    DtlCmnLabelHonsitenTitle.Visible := False;
    DtlCmnLabelDfKeihiTitle.Visible := False;
    DtlCmnEditHonsitenCodeNumeric.Visible := False;
    DtlCmnEditDfKeihiCode.Visible := False;
    DtlCmnLabelHonsitenDesc.Visible := False;
    DtlCmnLabelDfKeihiDesc.Visible := False;

	//<IDS>>>
	if m_bIDS then								// 人事異動モード
	begin
		// 最新のシミュレーション開始日を取得してガイダンス表示
		LidsGuideStd.Caption := '新規' + m_stMasterItem.strItemCaption
							  + 'の適用開始日はシミュレーション発令日';

		with (dqMasterInfo) do
		begin
			Close ();

			SQL.Clear;
			SQL.ADD ('SELECT StartDate FROM HAPIDS_SimInfo ');
			SQL.ADD ('ORDER BY StartDate DESC');

			if Open () then
			begin
				if (not EOF) then
				begin
					// 和暦
					if m_nDateFormatDivision = 0 then
					begin
						LidsGuideStd.Caption := LidsGuideStd.Caption
										   + '('
										   + MjsGetGengou(GetFld ('StartDate' ).AsDateTime, MdtCMP_YMD)
										   + FormatDateTime(' ee/mm/dd', GetFld ('StartDate' ).AsDateTime)
										   + ')';
					end
					// 西暦
					else
					begin
						LidsGuideStd.Caption := LidsGuideStd.Caption
										   + '('
										   + FormatDateTime('yyyy/mm/dd', GetFld ('StartDate' ).AsDateTime)
										   + ')';
					end;
				end;
			end;
		end;
		LidsGuideStd.Caption := LidsGuideStd.Caption
						   + '以前を指定してください。';
		LidsGuideDtl.Caption := LidsGuideStd.Caption;
	end;
	LidsGuideStd.Visible := m_bIds;
	LidsGuideDtl.Visible := m_bIds;
	//<<<IDS>

//<Edge>↓
	// Edge Tracker使用フラグ
	m_iEdgeFlag	:= 0;

//<Edge_2>↓
//	// NX-Plusの環境で部門が削除された場合、Edge Tracker でマスタを見直しが必要
//	if (TMSeries2.IsGalileopt3)												// Galileopt NX-Plus
//	or ((TMSeries2.IsMjsLink4) and (m_HAPflg = True)) then					// MJSLINK NX-Plus 給与大将

//<Edge_3>↓
//	if (not TMSeries.IsGalileopt)												// 旧Galileopt 以外
	if (TMSeries.IsGalielopt2)													// Galileopt NX-I、Galileopt NX-Plus
//<Edge_3>↑
	or ((TMSeries.IsMjsLink3) and (m_HAPflg = True)) then						// MLX系給与大将の場合
//<Edge_2>↑
	begin
		// 部門 か セグメントの場合
		if (ParentMasterDiv = 41)
		or (ParentMasterDiv = 101) then											//<Edge_2>
		begin
			with (dqMasterInfo) do
			begin
				Close();
				SQL.Clear();
				SQL.Add( 'SELECT NumData FROM HAPCTL WHERE KeyNoA = 10 AND KeyNoB = 601 AND KeyNoC = 1' );
				if ( Open = True ) then
				begin
					if Eof <> True then
					begin
						m_iEdgeFlag := FieldByName( 'NumData' ).AsInteger;
					end;
				end
				else
				begin
					ErrorMessageDsp(dqMasterInfo);
				end;
				Close();
			end;
		end;
	end;
//<Edge>↑

	dqMasterInfo.Free ();

	m_nReferMode	:=	NORMAL;										//	HIS0002

	if ((ParentMasterDiv = 87)										// 役職
   	 OR (ParentMasterDiv = 88)										// 職能資格
   	 OR (ParentMasterDiv = 89)) then								// 職位
    begin
		DtlCmnTab.Items[1].Enabled := False;						// 合計タブ無効
		StdCmnTab.Items[1].Enabled := False;						// 合計タブ無効
    end;

	// 0706 EXP
    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(self,'エクスプローラーの初期化に失敗しました。'#13#10#13#10//<210202>Upd 長音対応
					+ 'エクスプローラーは使用できません。', mjError, mjDefOk);//<210202>Upd 長音対応

   	SelectExp := False;		// 検索エクスプローラから選んでない

	// 印刷対応 050803 >>
    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    // 会社別ｼｽﾃﾑ情報の初期化
{$IFNDEF _NOT_PRINT_}
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if uvSelSys = nil then
            Abort;

    	if uvSelSys.CreateSysMsg(m_pRec) <> 0 then
            Abort;
    except
		MjsMessageBox(self, 'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

	// 050831 >>
    // 会社別ｼｽﾃﾑ情報読み込み
    try
    	if ( uvSelSys.CreateSysInfo(m_cDBSelect) <> 0 ) then
			Abort;
    except
        MjsMessageBox(Self,'ｼｽﾃﾑ情報が取得できませんでした。', mjError, mjDefOk);
		raise;
    end;
	// 050831 <<

//<MLWK>↓
	sMLWF	:= '';
	if m_bMLWF = True then
		sMLWF	:= 'MLWF_';
//<MLWK>↑

//<MLXHAP>↓
//<MLXDEP>↓
//	if ((ParentMasterDiv = 41) or (ParentMasterDiv = 101)) and (TMSeries.IsMjsLink3) then     //<MLXDEP>
//		sMLWF	:= 'MLX_';
	if ((ParentMasterDiv = 41) or (ParentMasterDiv = 101)) and (TMSeries.IsMjsLink3) then
	begin
		if ((m_DEPflg = True) or (m_LEAflg = True)) then
		begin
			sMLWF	:= 'DEP_';
		end
		else if (m_HAPflg = True) then
		begin
			sMLWF	:= 'HAP_';
		end;
	end;
//<MLXDEP>↑
//<MLXHAP>↑

    gfnHaniInit(Self,
                m_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
//<MLWK>↓
//              'JNTCRP002003_' + IntToStr(ParentMasterDiv),	// 取りあえずこうしておこう
                'JNTCRP002003_' + sMLWF + IntToStr(ParentMasterDiv),
//<MLWK>↑
                uvHani,
                uvSelSys);
{$ENDIF _NOT_PRINT_}
	// 印刷対応 050803 <<

    //...............................................................................>>
//    LMem_Msg_Syosai.Lines.Text := '050328版(DBSchema20050322)' + #13#10
//							    + '使用テーブル:' + DEF_HOJYOMA + '(R/W), MFusenInfo(R/W), '
//                                + 'MOS_OFFICE_STAFF(R), DTMAIN(R), MasterInfo(R), SegMA(R)';
    //...............................................................................<<

	if	(CmnInstructionCombo.Items.Count > 1)		// 有効なセグメントが複数
	 AND (ParentMasterDiv = 101) then				// セグメント
    begin
		PostMessage (Self.Handle, WM_ONPAINT, 0, 0);					// ｲﾍﾞﾝﾄOnCreateの最後に
	//<IDS>>>
	end
	else if m_bIds then
	begin
		PostMessage (Self.Handle, WM_ONPAINT, 0, 0);					// ｲﾍﾞﾝﾄOnCreateの最後に
	//<<<IDS>
	end;
end;


//************************************************************************
//*		Proccess		:	fnOnClose関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnOnClose (Sender: TObject; var Action: TCloseAction);
var
	cAppPrm: TAppParam;
	stMessageRec	: TMJSMsgRec;
//  FX10000
//	cDlgMasTree2	: TJNTMasTreee2Dlgf;
	dqWork			: TMQuery;
    arMasterDivision: Array of Integer;
	nCount			: Integer;
	pos				: Integer;
    iRet            : Integer;

// <013> ADD start
    Dlg 			: TJNTSyncMasterIF;
    aryIDs		    : array[0..0] of Integer;
// <013> ADD end
//<090407>↓
	sMessage		: String;
//<090407>↑
begin
	dqWork := nil;  //<002>
	CloseFlg := True;
	// TblHistory 更新処理

    //<002> ↓
    if  (ParentMasterDiv = 41) or (ParentMasterDiv = 101) then
    begin
    //<002> ↑
	    for nCount := 0 to 10 do
	    begin
	        if nCount = 0 then
			    pos := 41
	        else
	    	    pos := nCount + MK_SEG01 - 1;

//{ツリーは更新しないので	⇒ 削除のみある
		if	(m_bHojyoTree2 [nCount] = 1) then
		begin
			SetLength (arMasterDivision, Length (arMasterDivision) + 1);

			arMasterDivision [Length (arMasterDivision) - 1]	:= pos;
		end;
//}
//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_MASTERINFO, pos, 0, 0);
//FX10000
//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOMA   , pos, 0, 0);
//		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE , pos, 0, 0);

		{削除した場合のみ}
//FX10000
{
		if	(m_bHojyoTreeDelete [nCount] = 1) then
			MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_HOJYOTREE, pos, 0, 1);
}
	    end;

	end;

	// 加算体系2 更新
//{0210版ではHojyoTree2は更新しない　ここからでいいのかな？
//	if	(Length (arMasterDivision) > 0) then
  if Length (arBaseNCode) <> 0 then
  begin
	for nCount := 0 to Length (arBaseNCode) - 1 do
	begin
//  FX10000
//		cDlgMasTree2	:= TJNTMasTreee2Dlgf.Create (Self);

//		if	(cDlgMasTree2.ExecTree2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
//					  			m_cDataModule, m_cComArea.m_iCopNo, arMasterDivision, dqWork) < 0) then
//<002> ↓
{
		if	(JNTTree2ReMake2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
					  			m_cDataModule, m_cComArea.m_iCopNo, StrToFloat(arBaseNCode[nCount]), dqWork) < 0) then
}
        iRet := JNTTree2ReMake2 (rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysRoot,
								m_cDataModule, m_cComArea.m_iCopNo, StrToFloat(arBaseNCode[nCount]), dqWork);

        //　部門・ｾｸﾞﾒﾝﾄ以外はﾒｯｾｰｼﾞを出力しない
        //  ｴﾗｰの場合ｸｴﾘｰの値によってﾒｯｾｰｼﾞ出力
        if	(iRet < 0) and (iRet <> -104) then
//<002> ↑
		begin
			if	(dqWork <> nil) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (stMessageRec, dqWork);
				dqWork.Free ();
			end
			else
            begin
                m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10050, 76);   //<002>　その他のｴﾗｰ
            end;

			MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
                				stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, FALSE);   //<002>
		end;


//		cDlgMasTree2.Close ();
//		cDlgMasTree2.Free  ();
	end;
  end;
//0210版ではHojyoTree2は更新しない　ここまででいいのかな？}

	//HIS0023
	if m_NewRecord = True then
	begin
		// <IDS2> 人事異動の部門登録の場合、不要
		if (not m_bIDS) or (ParentMasterDiv <> 41) then	// <IDS2>
		begin
			//マスタが新規登録されました。出力順序などの設定の見直しが必要と思われます。
			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,30 );
//<080214_1>↓
			if (ParentMasterDiv = 41) OR (ParentMasterDiv = 101) then
			begin
				m_cErrorMsgRec.sMsg := m_cErrorMsgRec.sMsg
									 + #13#10
									 + 'また、組織体系登録に関しても確認をお願いします。';
			end;
//<080214_1>↑
			MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		end;											// <IDS2>
	end;

//<090407>↓
	if (m_DelRecord = True) or (m_DelRecordN = True) then
	begin
		// <IDS2> 人事異動の部門登録の場合、不要
		if (not m_bIDS) or (ParentMasterDiv <> 41) then	// <IDS2>
		begin


			sMessage	:=	'マスターの削除や適用期間の変更によって組織体系から削除された'//<210202>Upd 長音対応
						+	m_stMasterItem.strItemCaption
						+	'があります。'
						+	#13#10;

			if m_DelRecord = True then
				sMessage	:=	sMessage
							+ '『組織体系登録』';

			if (m_DelRecord = True) and (m_DelRecordN = True) then
				sMessage	:=	sMessage
							+ '及び';

			if m_DelRecordN = True then
				sMessage	:=	sMessage
							+ '『新組織体系登録』';

			sMessage	:=	sMessage
						+ 'の確認をお願いします。';

			MJSMessageBoxEx(Self,sMessage, '確認', mjWarning, mjOk, mjDefOk, FALSE);
		end;											// <IDS2>
	end;
//<090407>↑

	m_fUnderConstruction	:= TRUE;

// <017> MOD start
(*
// <013> ADD start
    if (IsGrop())			   		   and 	// ｸﾞﾙｰﾌﾟ管理あり
       (m_SyncMaster.m_CEComKbn5 <> 1) and  // 翌期更新済みでない
       (m_SyncMaster.m_PEComKbn5 <> 1) and
       (m_cJNTArea.IsModify()) 		   and  // 修正権限あり
	   (m_cJNTArea.IsAppend()) then     	// 追加権限あり
    begin
        	           						// 初期処理
    	Dlg := TJNTSyncMasterIF.Create(Self,m_pRec);

        try
        	aryIDs[0] := JNTSYNC_HojyoMA;
            Dlg.ShowDlg(aryIDs);       		// 配信ﾀﾞｲｱﾛｸﾞ呼び出し

        finally
        	Dlg.Free;         				// 破棄
 		end;

    end;
// <013> ADD end
*)
	if IsGrop() then
    begin
     	if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (UseFlg) and 					// 採用あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
        begin
         		           					// 初期処理
    		Dlg := TJNTSyncMasterIF.Create(Self,m_pRec);

       		try
        		aryIDs[0] := JNTSYNC_HojyoMA;
            	Dlg.ShowDlg(aryIDs);       	 // 配信ﾀﾞｲｱﾛｸﾞ呼び出し

        	finally
        		Dlg.Free;         			 // 破棄
 			end;
        end;
    end;
// <017> MOD end


{★★★
	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec	:= CmnTreeView.Items [nCount - 1].Data;

		Dispose (stItemRec);
	end;
★★★}

	m_fUnderConstruction	:= TRUE;

//  <マスタ同期>---Begin---
	if (ParentMasterDiv = 41)						// 部門
	or (ParentMasterDiv = 101) then					// セグメント
	begin
		// 開放
		m_SyncMaster.fnSyncTerm();
	end;
//  <マスタ同期>--- End ---

	m_cJNTArea.Free;			// FX


	// 印刷対応 050803 >>
	// 販売ｼｽﾃﾑ情報の開放
{$IFNDEF _NOT_PRINT_}
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();
{$ENDIF _NOT_PRINT_}
	// 印刷対応 050803 <<

	Action	:= caFree;

	// 0706 EXP
    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

	m_cDataModule.COPDBClose (m_cDBSelect);
//  <マスタ同期>---Begin---
	if IsChild() then
	begin
		// 親会社DBのClose
		m_cDataModule.COPDBClose( m_SyncMaster.m_cPDBSelect );
	end;
//  <マスタ同期>--- End ---

	m_pRec^.m_iDelete		:= 1;
	cAppPrm.iAction			:= ACTID_FORMCLOSEEND;											// 呼び出し区分設定
	cAppPrm.pRecord			:= Pointer( m_pRec );											// 管理構造体ﾎﾟｲﾝﾀ設定
	cAppPrm.pActionParam	:= nil;				  											// 予備ﾎﾟｲﾝﾀ設定

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppPrm);

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TJNTCRP0020030f.JNTTree2ReMake2( 	sSysRoot : string; DBM : TMDataModuleF; CID : integer;
                            BaseNCode : Extended ;
							var ErrQry : TMQuery;
    	                    Prog : TComponent = nil; _Label : TComponent = nil  ) : integer;
var
	hBpl:			THandle;					// 子 bpl ハンドル
    sBPLName:       string;
	Tree2ReMakeMain:	TJNTTree2ReMakeMain2;

begin
	sBPLName := sSysRoot + '\' + 'JNT\prg\JNTTree2ReMake.Bpl';

//<LPH>↓
//	hBpl		:= LoadPackage( sBPLName );
	hBpl		:= LoadPackageHelper( sBPLName );
//<LPH>↑
    if hBpl = 0 then
    begin
    	result := -1;
        exit;
    end;

	Tree2ReMakeMain	:= GetProcAddress( hBpl, 'JntTree2ReMakeMain2' );		//	Export関数ｱﾄﾞﾚｽの取得
	if @Tree2ReMakeMain = nil then
	begin
		MJSMessageBoxEx (Self, 'JntTree2ReMakeMain2()関数アドレスの取得に失敗しました。', 'エラー',mjError, mjOk, mjDefOk, FALSE );
        result := -1;
//<LPH>↓
//		UnloadPackage( hBpl );
		UnloadPackageHelper( hBpl );
//<LPH>↑
		exit;
	end;

    result := Tree2ReMakeMain( self,  sSysRoot, DBM, CID, BaseNCode, ErrQry, Prog, _Label  );

//<LPH>↓
//	UnloadPackage( hBpl );
	UnloadPackageHelper( hBpl );
//<LPH>↑
end;


//************************************************************************
//*		Proccess		:	fnOnShow関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnOnShow (Sender: TObject);
begin
	JNTMasSetCaption (m_pRec);  //FX10000
	MJSBtnVisible (TJNTCRP0020030f (Self), TRUE);

//<MLXDEP>
	if (TMSeries.IsMjsLink3) then
	begin
		CmnToolbarButtonDetail.Visible := False;
		ToolBarObjectMove;
	end;
//<MLXDEP>

//★★★	DtlCmnLabelCostRateTitle   .Visible	:= FALSE;										// 個別原価率は非表示
//	DtlCmnEditCostRate         .Visible	:= FALSE;
//★★★	DtlCmnLabelCostRateAddition.Visible	:= FALSE;

	if	(m_cPreview.IsPreView ()) then
    begin
		m_cPreview.Show ();
    end
	else if ParentMasterDiv = 101 then			// 部門登録の場合はパネルが有効になっていないのでフォーカスがあわせられりコントロールがない
    begin
		m_cACControl.SetFocus ();
	end;

	if UseFlg then
    begin
		if	(CmnInstructionCombo.Items.Count = 1)		// 有効なセグメントが一つ
		 OR (ParentMasterDiv <> 101) then					// 部門
			fnJNTCRP0020030fOnPaint(Sender);	// 0214	// 050926
    end;
end;


//************************************************************************
//*		Proccess		:	fnJNTCRP0020030fOnHide関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnJNTCRP0020030fOnHide (Sender: TObject);
begin
	MJSBtnVisible (TJNTCRP0020030f (Self), FALSE);

	if	(m_cPreview.IsPreView ()) then
		m_cPreview.Hide ();
end;


//************************************************************************
//*		Proccess		:	fnJNTCRP0020030fOnCloseQuery関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnJNTCRP0020030fOnCloseQuery (Sender: TObject; var CanClose: Boolean);
var
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;

begin
	if	(m_cPreview.IsPreView ()) then
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);

		MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		CanClose	:= FALSE;
		Exit;
	end;

    //<006> ↓
    if  ((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
        and (DtlCmnEditExCodeNumeric.Visible))
        or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
    begin
    //<006> ↑

        nReturn	:= fnOutputConfirmationMessage (CONFIRM_EXIT);

	    if	(nReturn = CONFIRM_RETFOCUSED) then
	    begin
	        CanClose	:= FALSE;
	        Exit;
        end
	    else if	(nReturn = CONFIRM_EXITWRITE) then
	    begin
	        if	(not fnUpdateDetailsScreenRecord ()) then
		    begin
		        CanClose	:= FALSE;
			    Exit;
            end;
        end;
    end;

    m_fChangeDetails	:= FALSE;

    fnSetMasterInfoCommonSections ();

end;


//************************************************************************
//*		Proccess		:	fnJNTCRP0020030fOnActivate関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnJNTCRP0020030fOnActivate (Sender: TObject);
begin
	m_cAppPrm.iAction		:= ACTID_ACTIVEEND;
	m_cAppPrm.pRecord		:= Pointer (m_pRec);
	m_cAppPrm.pActionParam	:= nil;

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@m_cAppPrm);
end;


//************************************************************************
//*		Proccess		:	fnCmnButtonToolbarExitOnClick関数
//*		Name			:
//*		Date			:
//*		Paqrameter		:
//*		Retrun			:
//*		History			:
//*
//************************************************************************
procedure	TJNTCRP0020030f.fnCmnButtonToolbarExitOnClick (Sender: TObject);
begin
    close;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnFunctionOnEnter01 (TObject)											*/
//*																									*/
//*	目的	: 部門登録処理 共通 OnEnter ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnCmnFunctionOnEnter01 (Sender: TObject);
begin
	CmnToolbarButtonDetail.Enabled	:= FALSE;
	CmnToolbarButtonDelete.Enabled	:= FALSE;
	fnEnableToolbarButtonTag (FALSE);

//<080311>↓
//	m_cACControl	:= Screen.ActiveControl;
	m_cACControl	:= TWinControl(Sender);
//<080311>↑
	m_fIgnoreProc	:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnFunctionOnEnter02 (TObject)											*/
//*																									*/
//*	目的	: 部門登録処理 共通 OnEnter ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnCommonFunctionOnEnter02 (Sender: TObject);
var
	fDeleteEnabled: Boolean;

begin
	BeforeFocus := '';

	fDeleteEnabled	:= TRUE;

	CmnToolbarButtonDetail.Enabled	:= TRUE;

//<080311>↓
//	m_cACControl	:= Screen.ActiveControl;
	m_cACControl	:= TWinControl(Sender);
//<080311>↑

//<080311>↓
//	if	((Screen.ActiveControl.Name = DtlCmnEditExCodeNumeric.Name) or
//		 (Screen.ActiveControl.Name = DtlCmnEditExCodeFree   .Name)) then
	if	((m_cACControl.Name = DtlCmnEditExCodeNumeric.Name) or
		 (m_cACControl.Name = DtlCmnEditExCodeFree   .Name)) then
//<080311>↑
	begin
		fnSetDeleteButtonCondition ();

		if	(not CmnToolbarButtonDelete.Enabled) then
			fDeleteEnabled	:= FALSE;
	end;


//<MLWK>↓
	// MLワークフローモードの場合
	if m_bMLWF = True then
	begin
		if	(DtlCmnClientPanel.Visible) then									//詳細だった場合
		begin
			if DtlCmnTab.Items[0].Selected = True then							// 実在
			begin
				CmnToolbarButtonDelete.Enabled	:= False;
				fDeleteEnabled	:= FALSE;
			end;
		end
		else																	//一覧だった場合
		begin
			if StdCmnTab.Items[0].Selected = True then							// 実在
			begin
				CmnToolbarButtonDelete.Enabled	:= False;
				fDeleteEnabled	:= FALSE;
			end;
		end;
	end;
//<MLWK>↑

	if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
	begin
		if	(fDeleteEnabled) then
			CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete();

//		fnEnableToolbarButtonTag (TRUE);
	end;

//<080311>↓
//	m_cACControl	:= Screen.ActiveControl;
//<080311>↑
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCommonFunctionOnKeyDown01 (TObject; var Word; TShiftState)				*/
//*																									*/
//*	目的	: 部門登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if DspCtrlFromKey(Sender, Key, Shift) then									// 050906
	    abort;																	// 050906
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCommonFunctionOnKeyDown02 (TObject; var Word; TShiftState)				*/
//*																									*/
//*	目的	: 部門登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	DspCtrlFromKey(Sender, Key, Shift);											// 050906
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCommonFunctionOnBeforePrint (TObject)									*/
//*																									*/
//*	目的	: 補助登録処理 共通 OnBeforePrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCommonFunctionOnBeforePrint (Sender: TObject);
begin
	m_cPrnSupport.BeforePrint (Sender);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCommonFunctionDetailsOnChange (TObject)											*/
//*																											*/
//*	目的	: 補助登録処理 共通 OnChange ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnCommonFunctionDetailsOnChange (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	((not m_fChangeDetails) and (not m_fUnderConstruction) and (m_nReferMode = NORMAL)) then
		m_fChangeDetails	:= TRUE;
end;


{★★★FX未対応}
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnToolbarButtonPrintOnClick (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[印刷] OnClick ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnToolbarButtonPrintOnClick (Sender: TObject);
{$IFNDEF _NOT_PRINT_}
var
	lvRet	:	Integer;
	JNTPDlg	:	TFrmJNTPDialog;	// <999>
begin

	// 販売ｼｽﾃﾑｴﾘｱに設定
	m_cJNTArea.setSelAppRecord;

	// 	051025 hirota >>
	if ParentMasterDiv = 101 then						// セグメントの場合
	begin
		uvHani.pvMasterKbn := m_nCurrentMasterDiv;				// マスタ区分を渡す
		uvHani.pvHojyoName := m_stMasterItem.strItemCaption;	// マスタ名称を渡す
	end;
	// 	051025 hirota <<

	// 範囲ﾀﾞｲｱﾛｸﾞを表示する<999>
//	  JNTPDlg := TFrmJNTPDialog.Create(AOwner, @uvHani);
	JNTPDlg := TFrmJNTPDialog.Create(Self, @uvHani);
	lvRet	:= JNTPDlg.ShowModal;
	JNTPDlg.Free;

//↓<D10_OwnMapRules>
	// TFDConnectionのマッピングをクリア
	m_cDBSelect.FormatOptions.MapRules.Clear;
	m_cDBSelect.FormatOptions.OwnMapRules := False;
//↑<D10_OwnMapRules>

	// 財務ｼｽﾃﾑｴﾘｱに設定し直し
	m_cJNTArea.setMasAppRecord;

	//結果を判断する
	case lvRet of
	 0:	//ｷｬﾝｾﾙ
		begin
			Exit;
		end;
	 1:	//通常
		begin
			//印刷する（ﾀﾞｲｱﾛｸﾞ表示）
			fnPrintML ();
		end;
	else Exit;		//ｴﾗｰ
	end;

{$ELSE}
begin
{$ENDIF _NOT_PRINT_}
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnToolbarButtonPrintOnClick (TObject)									*/
//*																									*/
//*	目的	: MLの部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[印刷] OnClick ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし, 																				*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnPrintML ();
{$IFNDEF _NOT_PRINT_}
var
	dqPrintWork 	 : TMQuery;
	cDlgPrint		 : TMJSPrnDlgf;
	cMemDataWork	 : TdxMemData;
	stMessageRec	 : TMJSMsgRec;
	nReturn			 : Integer;
//	nCount			 : Integer;
	strCaption		 : String;
	strTmpFileName	 : String;
	strFormatDate	 : String;
	strFormatDateTime: String;
	sTitle			 : TStringList;		//	HIS0007
	sMemFld			 : TStringList;		//	HIS0007
	PrintPtn		 : Integer;
{$ENDIF _NOT_PRINT_}
begin
{$IFNDEF _NOT_PRINT_}
	cMemDataWork	:= nil;
	PrintPtn := 0;								//070309 HIROTA

	strCaption	:= m_stMasterItem.strItemCaption;

	//	HIS0007
	sTitle	:=	TStringList.Create;
	sMemFld	:=	TStringList.Create;

	m_nOrderDivision	:= uvHani.pvrOrder;									// 範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
//	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];								// 開始実在部門外部ｺｰﾄﾞ
//	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];								// 終了実在部門外部ｺｰﾄﾞ

	dqPrintWork	:= TMQuery.Create (Self);											// MQueryの構築		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqPrintWork);						// DBとMQueryの接続

	cDlgPrint		:= TMJSPrnDlgf.Create (Self);
	m_cPrnSupport	:= TMjsPrnSupport.Create ();
//<100405>↓
	try
//<100405>↑
		gfnJNTMasSetPrnInfo (m_cPrnSupport, dqPrintWork);	//FX10000

{
		050901 ページと日時のデフォルトが「印刷しない」になっている
		↓こうすれば、販売と同じになるけど、gfnJNTMasSetPrnInfo()でやった方がいい
		m_cPrnSupport.iDate			:= 1;
		m_cPrnSupport.iPage			:= 1;
}
//<100405>↓
//		if (m_nCurrentMasterDiv < 86) OR (89 < m_nCurrentMasterDiv) then				// 職種～職位以外＝部門・セグ
//		begin
//			if (uvHani.pvrPattern = 0) then												// 実在リスト
//			begin
//				strCaption	:= '実在' + strCaption + '登録リスト';
//				m_cPrnSupport.ApRB			 := CmnReportExtStandardDep;
//				m_cPrnSupport.pPage			 := CmnReportExtStandardDepSysVarPage;		// 頁
//				m_cPrnSupport.pDate			 := CmnReportExtStandardDepSysVarDate;		// 日付
//				m_cPrnSupport.pCorpCode		 := CmnReportExtStandardDepLabelCorpCode;	// 会社ｺｰﾄﾞ
//				m_cPrnSupport.pCorpName		 := CmnReportExtStandardDepLabelCorpName;	// 会社名称
//				m_cPrnSupport.pAccountOffice :=	CmnReportExtStandardDepAccOffice;		// 会計事務所名称
//			end
//			else if (uvHani.pvrPattern = 1) then										// 合計リスト
//			begin
//				strCaption	:= '合計' + strCaption + '登録リスト';
//				m_cPrnSupport.ApRB			 := CmnReportTtlStandard;
//				m_cPrnSupport.pPage			 := CmnReportTtlStandardSysVarPage;			// 頁
//				m_cPrnSupport.pDate			 := CmnReportTtlStandardSysVarDate;			// 日付
//				m_cPrnSupport.pCorpCode		 := CmnReportTtlStandardLabelCorpCode;		// 会社ｺｰﾄﾞ
//				m_cPrnSupport.pCorpName		 := CmnReportTtlStandardLabelCorpName;		// 会社名称
//				m_cPrnSupport.pAccountOffice :=	CmnReportTtlStandardAccOffice;			// 会計事務所名称
//			end
//			else if (uvHani.pvrPattern = 2) AND (m_nCurrentMasterDiv = 41 )then			// 分類リスト
//			begin
//				strCaption	:= '実在' + strCaption + '登録リスト';
//				m_cPrnSupport.ApRB			 := CmnReportSystem;
//				m_cPrnSupport.pPage			 := CmnReportSystemSysVarPage;				// 頁
//				m_cPrnSupport.pDate			 := CmnReportSystemSysVarDate;				// 日付
//				m_cPrnSupport.pCorpCode		 := CmnReportSystemLabelCorpCode;			// 会社ｺｰﾄﾞ
//				m_cPrnSupport.pCorpName		 := CmnReportSystemLabelCorpName;			// 会社名称
//				m_cPrnSupport.pAccountOffice :=	CmnReportSystemAccOffice;				// 会計事務所名称
//			end
//		end
//		else																			// 職種～職位
//		begin
//			if (uvHani.pvrPattern = 0) then												// 実在リスト
//			begin
//				strCaption	:= strCaption + '登録リスト';
//				// 合計を使う
//				m_cPrnSupport.ApRB			 := CmnReportTtlStandard;
//				m_cPrnSupport.pPage			 := CmnReportTtlStandardSysVarPage;			// 頁
//				m_cPrnSupport.pDate			 := CmnReportTtlStandardSysVarDate;			// 日付
//				m_cPrnSupport.pCorpCode		 := CmnReportTtlStandardLabelCorpCode;		// 会社ｺｰﾄﾞ
//				m_cPrnSupport.pCorpName		 := CmnReportTtlStandardLabelCorpName;		// 会社名称
//				m_cPrnSupport.pAccountOffice :=	CmnReportTtlStandardAccOffice;			// 会計事務所名称
//			end;
//		end;

		// マスター区分から帳票の種類を判定
//<100617>↓
//		case (m_nCurrentMasterDiv) of
		case ParentMasterDiv of
//<100617>↑
			41:				// 部門
			begin
				case (uvHani.pvrPattern) of
					0:	PrintPtn := 0;	// 実在登録リスト
					1:	PrintPtn := 1;	// 合計登録リスト
					2:	PrintPtn := 2;	// 実在分類リスト
					3:	PrintPtn := 3;	// 実在フリー登録リスト
					4:	PrintPtn := 4;	// 合計フリー登録リスト
				end;
			end;
			101:			// セグメント
			begin
				case (uvHani.pvrPattern) of
					0:	PrintPtn := 0;	// 実在登録リスト
					1:	PrintPtn := 1;	// 合計登録リスト
					2:	PrintPtn := 3;	// 実在フリー登録リスト
					3:	PrintPtn := 4;	// 合計フリー登録リスト
				end;
			end;
			86,87,88,89:	// 職種,役職,職能資格,職位
			begin
				case (uvHani.pvrPattern) of
					0:	PrintPtn := 1;	// 合計登録リスト
				end;
			end;
		end;

		case (PrintPtn) of
			0:	// 実在登録リスト
			begin

//<MLXDEP>↓
//				m_cPrnSupport.ApRB			 := CmnReportExtStandardDep;
//				m_cPrnSupport.pPage			 := CmnReportExtStandardDepSysVarPage;		// 頁
//				m_cPrnSupport.pDate			 := CmnReportExtStandardDepSysVarDate;		// 日付
//				m_cPrnSupport.pCorpCode		 := CmnReportExtStandardDepLabelCorpCode;	// 会社ｺｰﾄﾞ
//				m_cPrnSupport.pCorpName		 := CmnReportExtStandardDepLabelCorpName;	// 会社名称
//				m_cPrnSupport.pAccountOffice :=	CmnReportExtStandardDepAccOffice;		// 会計事務所名称

				if (TMSeries.IsMjsLink3) then
				begin
					strCaption	:= strCaption + '登録リスト';
					m_cPrnSupport.ApRB			 := CmnReportExtStandardDep_DEP;
					m_cPrnSupport.pPage			 := CmnReportExtStandardDepSysVarPage_DEP;		// 頁
					m_cPrnSupport.pDate			 := CmnReportExtStandardDepSysVarDate_DEP;		// 日付
					m_cPrnSupport.pCorpCode		 := CmnReportExtStandardDepLabelCorpCode_DEP;	// 会社ｺｰﾄﾞ
					m_cPrnSupport.pCorpName		 := CmnReportExtStandardDepLabelCorpName_DEP;	// 会社名称
					m_cPrnSupport.pAccountOffice :=	CmnReportExtStandardDepAccOffice_DEP;		// 会計事務所名称
                end else begin
					strCaption	:= strCaption + '登録リスト';
//<100617>↓
//					if (m_nCurrentMasterDiv < 86) or (89 < m_nCurrentMasterDiv) then	// 職種～職位以外＝部門・セグ
					if (ParentMasterDiv < 86) or (89 < ParentMasterDiv) then		// 職種～職位以外＝部門・セグ
//<100617>↑
						strCaption	:= '実在' + strCaption;

					m_cPrnSupport.ApRB			 := CmnReportExtStandardDep;
					m_cPrnSupport.pPage			 := CmnReportExtStandardDepSysVarPage;		// 頁
					m_cPrnSupport.pDate			 := CmnReportExtStandardDepSysVarDate;		// 日付
					m_cPrnSupport.pCorpCode		 := CmnReportExtStandardDepLabelCorpCode;	// 会社ｺｰﾄﾞ
					m_cPrnSupport.pCorpName		 := CmnReportExtStandardDepLabelCorpName;	// 会社名称
					m_cPrnSupport.pAccountOffice :=	CmnReportExtStandardDepAccOffice;		// 会計事務所名称
                end;
//<MLXDEP>↑
			end;
			1:	// 合計登録リスト
			begin
				strCaption	:= strCaption + '登録リスト';
//<100617>↓
//				if (m_nCurrentMasterDiv < 86) or (89 < m_nCurrentMasterDiv) then	// 職種～職位以外＝部門・セグ
				if (ParentMasterDiv < 86) or (89 < ParentMasterDiv) then		// 職種～職位以外＝部門・セグ
//<100617>↑
					strCaption	:= '合計' + strCaption;
				m_cPrnSupport.ApRB			 := CmnReportTtlStandard;
				m_cPrnSupport.pPage			 := CmnReportTtlStandardSysVarPage;			// 頁
				m_cPrnSupport.pDate			 := CmnReportTtlStandardSysVarDate;			// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportTtlStandardLabelCorpCode;		// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportTtlStandardLabelCorpName;		// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportTtlStandardAccOffice;			// 会計事務所名称
			end;
			2:	// 実在分類リスト
			begin
				strCaption	:= strCaption + '登録リスト';
//<100617>↓
//				if (m_nCurrentMasterDiv < 86) or (89 < m_nCurrentMasterDiv) then	// 職種～職位以外＝部門・セグ
				if (ParentMasterDiv < 86) or (89 < ParentMasterDiv) then		// 職種～職位以外＝部門・セグ
//<100617>↑
					strCaption	:= '実在' + strCaption;
				m_cPrnSupport.ApRB			 := CmnReportSystem;
				m_cPrnSupport.pPage			 := CmnReportSystemSysVarPage;				// 頁
				m_cPrnSupport.pDate			 := CmnReportSystemSysVarDate;				// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportSystemLabelCorpCode;			// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportSystemLabelCorpName;			// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportSystemAccOffice;				// 会計事務所名称
			end;
			3:	// 実在フリー登録リスト
			begin
				strCaption	:= strCaption + 'フリー項目登録リスト';
//<100617>↓
//				if (m_nCurrentMasterDiv < 86) or (89 < m_nCurrentMasterDiv) then	// 職種～職位以外＝部門・セグ
				if (ParentMasterDiv < 86) or (89 < ParentMasterDiv) then		// 職種～職位以外＝部門・セグ
//<100617>↑
					strCaption	:= '実在' + strCaption;
				m_cPrnSupport.ApRB			 := CmnReportFree;
				m_cPrnSupport.pPage			 := CmnReportFreeSysVarPage;				// 頁
				m_cPrnSupport.pDate			 := CmnReportFreeSysVarDate;				// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportFreeLabelCorpCode;				// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportFreeLabelCorpName;				// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportFreeAccOffice;					// 会計事務所名称
			end;
			4:	// 合計フリー登録リスト
			begin
				strCaption	:= strCaption + 'フリー項目登録リスト';
//<100617>↓
//				if (m_nCurrentMasterDiv < 86) or (89 < m_nCurrentMasterDiv) then	// 職種～職位以外＝部門・セグ
				if (ParentMasterDiv < 86) or (89 < ParentMasterDiv) then		// 職種～職位以外＝部門・セグ
//<100617>↑
					strCaption	:= '合計' + strCaption;
				m_cPrnSupport.ApRB			 := CmnReportFree;
				m_cPrnSupport.pPage			 := CmnReportFreeSysVarPage;				// 頁
				m_cPrnSupport.pDate			 := CmnReportFreeSysVarDate;				// 日付
				m_cPrnSupport.pCorpCode		 := CmnReportFreeLabelCorpCode;				// 会社ｺｰﾄﾞ
				m_cPrnSupport.pCorpName		 := CmnReportFreeLabelCorpName;				// 会社名称
				m_cPrnSupport.pAccountOffice :=	CmnReportFreeAccOffice;					// 会計事務所名称
			end;
		end;
//<100405>↑

		m_cPrnSupport.strDocName	:= strCaption;
		strTmpFileName	:= '\tmp\' + strCaption + '.csv';

		m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + strTmpFileName;
		m_cPrnSupport.pComArea 		:= m_pRec^.m_pCommonArea;

		if (m_cJNTArea.IsExtract = False)  then				// 050822 hirota
			m_cPrnSupport.iDspFileBtn	:= 0 								// ファイル出力非表示
		else
			m_cPrnSupport.iDspFileBtn	:= 1; 								// ファイル出力表示
		m_cPrnSupport.pApRec		:= m_pRec;		// <2008-06-11>
		m_cPrnSupport.iSysCode		:= m_pRec^.m_iSystemCode;			//	システムコード	HIS0004
		m_cPrnSupport.iReportID		:= CHECKLIST;						//	帳票ｸﾞﾙｰﾌﾟNO	HIS0004
		m_cPrnSupport.MdataModule	:= m_cDataModule;
		m_cPrnSupport.iCalendarKbn	:= m_nDateFormatDivision + 1;

		nReturn	:= cDlgPrint.DoDLG (m_cPrnSupport);

		if	(nReturn > 0) then
		begin
			if	((m_cPreview.IsExistPreview ()) and (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
			begin
				m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 1);

				MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
													stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
//<100405>↓
//				cDlgPrint.Free ();
//				dqPrintWork.Free ();
//<100405>↑
				Exit;
			end;

//<100215_2>↓
//			if	(m_nDateFormatDivision = 0) then												// 和暦/西暦区分: 0=和暦
//			begin
//				strFormatDate		:= 'ee/mm/dd';
//				strFormatDateTime	:= 'ee/mm/dd hh:mm:ss';
//			end
//			else																				// 和暦/西暦区分: 1=西暦
//			  begin
//				strFormatDate		:= 'yy/mm/dd';
//				strFormatDateTime	:= 'yy/mm/dd hh:mm:ss';
//			end;
//<100215_2>↑

//<100405>↓
//			if (m_nCurrentMasterDiv < 86) OR (89 < m_nCurrentMasterDiv) then				// 職種～職位以外＝部門・セグ
//			begin
//				if (uvHani.pvrPattern = 0) then												// 実在リスト
//				begin
//					CmnReportExtStandardDepLabelTitle		 .Caption		:= strCaption;
////<100215_2>↓
////					CmnReportExtStandardDepDBTextAppDateStart.DisplayFormat	:= strFormatDate;
////					CmnReportExtStandardDepDBTextAppDateEnd  .DisplayFormat	:= strFormatDate;
////<100215_2>↑
//					CmnReportExtStandardDepDBTextUpdateDate  .DisplayFormat	:= strFormatDateTime;
//
////050819					CmnReportExtStandardDepLineTitle.Left	:= CmnReportExtStandardDepLabelTitle.Left;
////050819					CmnReportExtStandardDepLineTitle.Width	:= CmnReportExtStandardDepLabelTitle.Width;
//					fnPrintCheckListExtStandard ();
//
//					cMemDataWork	:= CmnMemDataPrintExtStandard;
//					PrintPtn := 0;
//				end
//				else if (uvHani.pvrPattern = 1) then										// 合計リスト
//				begin
//					CmnReportTtlStandardLabelTitle		.Caption		:= strCaption;
//					CmnReportTtlStandardDBTextUpdateDate.DisplayFormat	:= strFormatDateTime;
//
////050819					CmnReportTtlStandardLineTitle.Left	:= CmnReportTtlStandardLabelTitle.Left;
////050819					CmnReportTtlStandardLineTitle.Width	:= CmnReportTtlStandardLabelTitle.Width;
//
//					fnPrintCheckListTtlStandard ();
//
//					cMemDataWork	:= CmnMemDataPrintTtlStandard;
//					PrintPtn := 1;
//				end
//				else if (uvHani.pvrPattern = 2) AND (m_nCurrentMasterDiv = 41 )then			// 分類リスト
//				begin
//					CmnReportSystemLabelTitle.Caption	:= strCaption;
//
////<100215_2>↓
////					CmnReportSystemppDBTextAppDateStart.DisplayFormat	:= strFormatDate;	// 適用開始
////					CmnReportSystemppDBTextAppDateEnd.DisplayFormat		:= strFormatDate;	// 適用終了
////<100215_2>↑
//
////050819					CmnReportSystemLineTitle.Left	:= CmnReportSystemLabelTitle.Left;
////050819					CmnReportSystemLineTitle.Width	:= CmnReportSystemLabelTitle.Width;
//
//					if (not fnPrintCheckListSystem ()) then
//					begin
//						// 終了
//						cDlgPrint  .Free ();
//						dqPrintWork.Free ();
//						Exit;
//					end;
//
//					cMemDataWork	:= CmnMemDataPrintSystem;
//					PrintPtn := 2;
//				end
//			end
//			else																			// 職種～職位
//			begin
//				if (uvHani.pvrPattern = 0) then												// 実在リスト
//				begin
//					CmnReportTtlStandardLabelTitle		.Caption		:= strCaption;
//					CmnReportTtlStandardDBTextUpdateDate.DisplayFormat	:= strFormatDateTime;
//
////050819					CmnReportTtlStandardLineTitle.Left	:= CmnReportTtlStandardLabelTitle.Left;
////050819					CmnReportTtlStandardLineTitle.Width	:= CmnReportTtlStandardLabelTitle.Width;
//
//					fnPrintCheckListTtlStandard ();
//
//					cMemDataWork	:= CmnMemDataPrintTtlStandard;
//					PrintPtn := 1;
//				end;
//			end;
			// データ取得
			case (PrintPtn) of
				0:	// 実在登録リスト
				begin
					CmnReportExtStandardDepLabelTitle.Caption		:= strCaption;
                    CmnReportExtStandardDepLabelTitle_DEP.Caption	:= strCaption;			//<MLXDEP>
					fnPrintCheckListExtStandard();
					cMemDataWork	:= CmnMemDataPrintExtStandard;
				end;
				1:	// 合計登録リスト
				begin
					CmnReportTtlStandardLabelTitle.Caption	:= strCaption;
					if (TMSeries.IsMjsLink3) then ppLabel2.Visible := False;						//<MLXDEP>
					fnPrintCheckListTtlStandard();
					cMemDataWork	:= CmnMemDataPrintTtlStandard;
				end;
				2:	// 実在分類リスト
				begin
					CmnReportSystemLabelTitle.Caption	:= strCaption;
					if (not fnPrintCheckListSystem ()) then
						Exit;
					cMemDataWork	:= CmnMemDataPrintSystem;
				end;
				3:	// 実在フリー登録リスト
				begin
					CmnReportFreeLabelTitle.Caption	:= strCaption;
					fnPrintCheckListFree(PrintPtn);
					cMemDataWork	:= CmnMemDataPrintFree;
				end;
				4:	// 合計フリー登録リスト
				begin
					CmnReportFreeLabelTitle.Caption	:= strCaption;
					fnPrintCheckListFree(PrintPtn);
					cMemDataWork	:= CmnMemDataPrintFree;
				end;
			end;
//<100405>↑

//<101208>↓
			if m_cPrnSupport.iCommand in [PDLG_PRINT, PDLG_PREVIEW, PDLG_FILE] then
			begin
//<101208>↑
				// ﾃﾞｰﾀの存在ﾁｪｯｸ
				if ( cMemDataWork.RecordCount = 0 ) then
				begin
					uvSelSys.MsgDlg(2010,10);
//<100405>↓
//					cDlgPrint.Free ();
//					dqPrintWork.Free ();
//<100405>↑
					Exit;
				end;
//<101208>↓
			end;
//<101208>↑

			if	((m_cPrnSupport.iCommand = PDLG_PRINT) or (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
				m_cPreview.Exec (m_cPrnSupport, cDlgPrint, nil)
			else if	(m_cPrnSupport.iCommand = PDLG_FILE) then
			begin
				//	HIS0007
				//fnSetFileOutTF(uvHani.pvrPattern,sTitle,sMemFld);
				fnSetFileOutTF(PrintPtn,sTitle,sMemFld);
				if ( MjsFileOut(cMemDataWork, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 ) then
				begin
					//	ファイル出力大失敗
					m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
				end;

//				if	(DSet2CSV (cMemDataWork, m_cPrnSupport.strFileName) = -1) then
//					ShowMessage ('ファイル出力大失敗');
			end;
		end;

//<100405>↓
	finally
//<100405>↑
		cDlgPrint.Free();
		dqPrintWork.Free();
//<100405>↓
	end;
//<100405>↑
{$ENDIF _NOT_PRINT_}
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnToolbarButtonChangeOnClick (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[切出] OnClick ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnCmnToolbarButtonChangeOnClick (Sender: TObject);
begin
	m_fUnderConstruction	:= TRUE;

// 050606>>
    if CmnToolbarButtonChange.Caption = '切出(&G)' then
    begin
        CmnToolbarButtonChange.Caption := '埋込(&G)';
        m_cAppPrm.iAction := ACTID_DOCKINGOUTEND;
    end
    else
    begin
        CmnToolbarButtonChange.Caption := '切出(&G)';
        m_cAppPrm.iAction := ACTID_DOCKINGINEND;
    end;
    m_cAppPrm.pRecord := Pointer(m_pRec);
    m_cAppPrm.pActionParam := nil;

    TMjsAppRecord(m_pRec^).m_pOwnerEntry( @m_cAppPrm );
// 050606<<

	m_fUnderConstruction	:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnToolbarButtonDetailOnClick (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[一覧/詳細] OnClick ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnToolbarButtonDetailOnClick (Sender: TObject);
var SelectTab : Integer;
begin
	if	(DtlCmnClientPanel.Visible) then										//詳細だった場合
	begin
		{0214 編集中の場合は確認}
        ///<006> ↓
        if  ((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
            and (DtlCmnEditExCodeNumeric.Visible))
            or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
        begin
        //<006> ↑

		    if CONFIRM_THROUGH<> fnOutputConfirmationMessage (CONFIRM_CANCEL) then
        	    exit;
        end;

		m_fChangeDetails	:= FALSE;

// <010>↓ｾｸﾞﾒﾝﾄの場合詳細のｺﾝﾎﾞの状態を一覧に設定
        if ParentMasterDiv = 101 then
    	   	CmnInstructionCombo.ItemIndex := CmnInstructionComboDtl.ItemIndex;
// <010>↑

		CloseFlg	:= TRUE;
    	firstFlg 	:= TRUE;

	    if DtlCmnTab.Items[0].Selected = True then								// 実在
        begin
			StdCmnTab.Items[0].Selected := True;
			StdCmnTab.Items[1].Selected := False;
            m_cACControl := StdCmnGridExist;
            SelectTab := 0;
        end
        else																	// 合計
        begin
			StdCmnTab.Items[1].Selected := True;
			StdCmnTab.Items[0].Selected := False;
            m_cACControl := StdCmnGridTotal;
            SelectTab := 1;
        end;

		DtlCmnClientPanel.Visible	:= FALSE;									//詳細パネル無効
		StdCmnClientPanel.Visible	:= TRUE;									//一覧パネル有効
//		FFunctionBar.Visible		:= FALSE;									//Fバー無効
//		FFunctionBar.FuncItems := '';
//<100906>↓
//	    FFunctionBar.SetFuncCaption (1, '');
//		FFunctionBar.SetFuncEnabled (1, False) ;
		m_arFunction[0]	:= '';
		FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
		FFunctionBar.Enabled	:= True;
//<110131_3>↑

{★★★
		cNode		:= CmnTreeView.Selected;
		stSelectRec	:= cNode.Data;

		if	((stSelectRec^.nDivision = 0) or (stSelectRec^.nDivision = DIVISION_GENERAL)) then
		begin
			stParentRec		:= cNode.Parent.Data;
			strExCodeParent	:= stParentRec^.strExCode;
			strName			:= stParentRec^.strName;
		end
		else
		begin
			strExCodeParent	:= stSelectRec^.strExCode;
			strName			:= stSelectRec^.strName;
		end;

		fnSetParentItemsInfoEx	 (stSelectRec^.nDivision, stSelectRec^.strExCode, strExCodeParent, strName);
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.strExCode);
★★★}
//★★★		m_cACControl	:= CmnTreeView;
		fnSetParentItemsInfo ();
		fnMoveGridRecordSelecter (SelectTab, DtlNCode);

//		m_cACControl	:= EDateStart;
		m_cACControl.SetFocus ();

		CmnToolbarButtonDetail.Caption	:= '詳細(&T)';

//		CmnToolbarButtonDetail.Enabled	:= FALSE;
//		CmnToolbarButtonDelete.Enabled	:= FALSE;
//		fnEnableToolbarButtonTag (FALSE);
		ToolBar1.Left := DefPosition;
		CloseFlg := FALSE;
	end
	else																		//一覧だった場合
	begin
// <010>↓ｾｸﾞﾒﾝﾄの場合一覧のｺﾝﾎﾞの状態を詳細に設定
        if ParentMasterDiv = 101 then
        	CmnInstructionComboDtl.ItemIndex := CmnInstructionCombo.ItemIndex;
// <010>↑

		CloseFlg	:= TRUE;
		fnShowDetailScreen ();													//詳細表示

		if (m_nReferMode <> REFER) then								//	参照以外	HIS0002
		begin
			if	(m_nCurrentCodeAttr <= 1) then
			begin
				if	(DtlCmnEditExCodeNumeric.ReadOnly) then
					m_cACControl	:= DtlCmnEditAssociation
				else
					m_cACControl	:= DtlCmnEditExCodeNumeric;
			end
			else
			begin
				if	(DtlCmnEditExCodeFree.ReadOnly) then
					m_cACControl	:= DtlCmnEditAssociation
				else
					m_cACControl	:= DtlCmnEditExCodeFree;
			end;

			m_cACControl.SetFocus ();

			fnSetDeleteButtonCondition ();
		end;

		CmnToolbarButtonDetail.Caption	:= '一覧(&T)';
		fnEnableToolbarButtonTag (TRUE);
		CloseFlg := FALSE;
//		FFunctionBar.Visible		:= TRUE;									//Fバー有効
		if ((ParentMasterDiv = 41)
         OR (ParentMasterDiv = 101)) then
        begin
//<100906>↓
//			if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
//			    FFunctionBar.SetFuncCaption (1, ' F1 ' + STR_FUNC_FREE)
//            else
//			    FFunctionBar.SetFuncCaption (1, ' F1 フリー項目参照');
//
//			FFunctionBar.SetFuncEnabled (1, True) ;
			if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
			begin							//<MLXDEP>begin,end内を一段字下げ
                if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                    m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
                else
                    m_arFunction[0]	:= ' F1 フリー項目参照';
			end;							//<MLXDEP>
			FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
			FFunctionBar.Enabled	:= True;
//<110131_3>↑

{
				FFunctionBar.FuncItems := ' F1 フリー項目入力'
            else
				FFunctionBar.FuncItems := ' F1 フリー項目参照';
}
        end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCmnToolbarButtonDeleteOnClick (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ[削除] OnClick ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP0020030f.fnCmnToolbarButtonDeleteOnClick (Sender: TObject);
var
	stMessageRec: TMJSMsgRec;
	nInCode		: String;
	strMessage	: String;
	nSumDivision: Integer;
    ret, ret1	: Integer;
    exCode      :Extended;                      //<CHK>
    strErr, strGCode, strName, strMsg:String;   //<CHK>
	Qe          :   TMQuery;					//	<マスタ同期>
begin
	if	(m_fSystemClear) then
	begin
		m_fSystemClear	:= FALSE;

		//<070410> 削除時OK以外は同じ動作
		{if	(MJSMessageBoxEx (Self, _SystemClear, '警告',
											mjWarning, mjOkCancel, mjDefCancel, FALSE) = mrCancel) then
		}
		if	(MJSMessageBoxEx (Self, _SystemClear, '警告',
											mjWarning, mjOkCancel, mjDefCancel, FALSE) <> mrOk) then
			Exit;

		if	(not fnClearAllSystems ()) then
			Exit;

//		fnRebuildTreeViewItems ();
		fnSetParentItemsInfo ();

//		PostMessage (Self.Handle, WM_ONDISCONTINUE, 0, 0);

		Exit;
	end;

//<080311>↓
//	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then						// 実在補助ｸﾞﾘｯﾄﾞ
	if	(m_cACControl.Name = StdCmnGridExist.Name) then							// 実在補助ｸﾞﾘｯﾄﾞ
//<080311>↑
	begin
		nInCode			:= StdCmnGridExist.DataSource.DataSet.FieldByName('nInCode').AsString;
		nSumDivision	:= 0;
		strMessage		:= '"' + StdCmnGridExist.DataSource.DataSet.FieldByName('strNameSimple').AsString;
	end
//<080311>↓
//	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then					// 合計補助ｸﾞﾘｯﾄﾞ
	else if	(m_cACControl.Name = StdCmnGridTotal.Name) then						// 合計補助ｸﾞﾘｯﾄﾞ
//<080311>↑
	begin
		nInCode			:= StdCmnGridTotal.DataSource.DataSet.FieldByName('nInCode').AsString;
//		nSumDivision	:= 1;
		nSumDivision	:= fnKbnCheck(m_nCurrentMasterDiv, nInCode);
		strMessage		:= '"' + StdCmnGridTotal.DataSource.DataSet.FieldByName('strNameSimple').AsString;
	end
	else if	(DtlCmnClientPanel.Visible) then										// <IDS2>詳細だった場合
	begin
		nInCode			:= DtlNCode;
		nSumDivision	:= DtlCmnEditSumDivision.AsInteger;
		strMessage		:= '"' + DtlCmnEditNameSimple.Text;
	end											//<<<IDS2>
	else
	begin
		Exit;									//<<<IDs2>
	end;

	// 組織体系チェック
	ret1 := ChkPtn2(m_nCurrentMasterDiv, nInCode);
	if 0 = ret1 then				// 組織体系で未使用
	begin
    	// 確認メッセージ（他の場合は１度確認しているから出さない）
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);
		strMessage	:= strMessage + '"のレコードを' + stMessageRec.sMsg;
		ret := MJSMessageBoxEx (Self, strMessage, stMessageRec.sTitle, stMessageRec.icontype,
						stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
	end
    else if 1 = ret1 then			// 消さない
    	exit
    else							// 消す
		ret := mrYes;				// 確認済みなので消す

	if	(ret = mrYes) then
	begin
		//--- HIS0027 St -----
{
		if fnHaitaCheck() = 99 then
		begin
			if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then							// 実在補助ｸﾞﾘｯﾄﾞ
				StdCmnGridExist.SetFocus
			else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then						// 合計補助ｸﾞﾘｯﾄﾞ
				StdCmnGridTotal.SetFocus
			else
			begin
				if	(m_nCurrentCodeAttr <= 1) then
					DtlCmnEditExCodeNumeric.SetFocus
				else
					DtlCmnEditExCodeFree.SetFocus;
			end;

			abort;
		end;
}
		//--- HIS0027 Ed -----

		// 不整合の確認 050830 >>
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);
		strMessage	:= MSG_DELETE;
		if mrYes <> MJSMessageBoxEx (Self, strMessage, stMessageRec.sTitle, stMessageRec.icontype,
						stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType) then
			exit;	// 消さない
		// 不整合の確認 050830 <<

		// <CHK> ↓
		exCode := StrToFloat(nInCode);

		// 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
		if not fnDelCheck(exCode, strErr) then
		begin								// 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
//<080311>↓
//			if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then						// 実在補助ｸﾞﾘｯﾄﾞ
			if	(m_cACControl.Name = StdCmnGridExist.Name) then					// 実在補助ｸﾞﾘｯﾄﾞ
//<080311>↑
			begin
				strGCode:= StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString;
				strName := StdCmnGridExist.DataSource.DataSet.FieldByName('strNameSimple').AsString;
			end
//<080311>↓
//			else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then					// 合計補助ｸﾞﾘｯﾄﾞ
			else if	(m_cACControl.Name = StdCmnGridTotal.Name) then				// 合計補助ｸﾞﾘｯﾄﾞ
//<080311>↑
			begin
				strGCode:= StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString;
				strName := StdCmnGridTotal.DataSource.DataSet.FieldByName('strNameSimple').AsString;
			end
			else																			//　詳細
			begin
				// 属性が数字・0あり数字のｺｰﾄﾞ
				if	(m_nCurrentCodeAttr <= 1) then
				begin
					strGCode:= DtlCmnEditExCodeNumeric.Text;
				end
				// 属性がﾌﾘｰのｺｰﾄﾞ
				else
				begin
					strGCode:= DtlCmnEditExCodeFree.Text;
				end;
				strName := DtlCmnEditNameSimple.Text;
			end;

			// 名称
			strMsg	:= strGCode + ' ' + strName + ' ' + strErr ;
			MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
			Exit;
		end;
		// <CHK> ↑

		//  <マスタ同期>---Begin---
		if IsParent() then						// 全社
		begin
			Qe := TMQuery.Create (Self);                        // MQueryの構築
			m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qe);	// 自社DBとMQueryの接続
			Qe.Close();
			Qe.SQL.Clear();
			Qe.SQL.Add('select Count(NCode) CNT from HojyoMA_Rel ');
			Qe.SQL.Add('where MasterKbn   = :pMstKbn             ');
			Qe.SQL.Add('  and NCode       = :pNCode              ');
			Qe.SQL.Add('  and RDelKbn_REL = 0                    ');
			Qe.ParamByName('pMstKbn').AsInteger := m_nCurrentMasterDiv;
			Qe.ParamByName('pNCode' ).AsFloat   := exCode;

			if ( Qe.Open = False ) then
			begin
				ErrorMessageDsp(Qe);
				Abort;
			end;

			if ( Qe.FieldByName('CNT').AsInteger <> 0 ) then
			begin
				MjsMessageBoxEx(Self,
							JNTSYNC_MSG_USE_CHILD,
							'削除', mjInformation, mjOk, mjDefOk);
				Qe.Free();
				Exit;
			end;
			Qe.Free();
		end;
		//  <マスタ同期>--- End ---

		fnDeleteMasterRecord (nSumDivision, nInCode);
		fnSetParentItemsInfo ();

//<Edge>↓
		// 0:未使用 1:使用
		if m_iEdgeFlag = 1 then
		begin
			MJSMessageBoxEx (Self, m_stMasterItem.strItemCaption + 'が削除されました。'+#13#10+'Edge Tracker でマスターを見直してください。', '確認', mjInformation, mjOk, mjDefOk, FALSE);//<210202>Upd 長音対応
		end;
//<Edge>↑

//<090724>↓
		if	(m_cACControl.Name = StdCmnGridExist.Name) then						// 実在補助ｸﾞﾘｯﾄﾞ
		begin
			StdCmnMemDataExistAfterScroll(StdCmnGridExist.DataSource.DataSet);
		end
		else
		if	(m_cACControl.Name = StdCmnGridTotal.Name) then						// 合計補助ｸﾞﾘｯﾄﾞ
		begin
			StdCmnMemDataTotalAfterScroll(StdCmnGridTotal.DataSource.DataSet);
		end;
//<090724>↑

		if DtlCmnClientPanel.Visible then			// 詳細画面
		begin
			// 新規入力
//			DtlNCode := IntToStr(GetNewNCode());	// 0207 新規データ入力
			DtlNCode := '0';						// 0317
			fnResetDetailScreen		 ();

			// 外部コード消去>>
			if	(m_nCurrentCodeAttr <= 1) then
			begin
				DtlCmnEditExCodeNumeric.Enabled	:= TRUE;
				DtlCmnEditExCodeNumeric.Color	:= clWindow;
				DtlCmnEditExCodeNumeric.SetFocus;			// 051121 削除後はコードにフォーカス(外部コード０重複対応)
			end
			else
			begin
				DtlCmnEditExCodeFree.Enabled	:= TRUE;
				DtlCmnEditExCodeFree.Color		:= clWindow;
				DtlCmnEditExCodeFree.SetFocus;				// 051121 削除後はコードにフォーカス(外部コード０重複対応)
			end;

			DtlCmnEditExCodeNumeric.Value		:= 0;
			DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
			DtlCmnEditExCodeFree   .Text		:= '';
			// 外部コード消去<<

			m_fChangeDetails	:= FALSE;
        end;

	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnTabOnEnter (TObject)									            */
//*																									*/
//*	目的	: 部門登録処理 ﾀﾌﾞ OnEnter ｲﾍﾞﾝﾄ												        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnTabOnEnter (Sender: TObject);
begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	CmnToolbarButtonDetail.Enabled	:= FALSE;
	CmnToolbarButtonDelete.Enabled	:= FALSE;
	fnEnableToolbarButtonTag (FALSE);
//<131001>↓
	//[F8 正式名称コピー]の表示を消す
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
//<131001>↑
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 部門登録処理 一覧ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ											        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
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
	end
	else if	(Key = VK_UP) then
	begin
        //<009> ↓ 部門：移動せず／ｾｸﾞﾒﾝﾄ：ｺﾝﾎﾞへ移動
        //MjsDispCtrl.MjsPrevCtrl (Self);

        if  (ParentMasterDiv = 101) then
            MjsDispCtrl.MjsPrevCtrl (Self);
        Abort;
        //<009> ↑
	end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
    	if CmnInstructionCombo.Visible = True then								//★★★ コンボ
			CmnInstructionCombo.SetFocus ()
    	else if StdCmnClientPanel.Visible = True then							//★★★ 一覧
			EDateStart.SetFocus ()												//★★★

		else if ((DtlCmnButtonUpdate.Enabled) AND (Key = VK_END)) then
           	DtlCmnButtonUpdate.SetFocus ()
		else if ((DtlCmnButtonCancel.Enabled) AND (Key = VK_ESCAPE)) then
           	DtlCmnButtonCancel.SetFocus ()

        else if DtlCmnEditExCodeFree.Visible then								//★★★ 詳細
			DtlCmnEditExCodeFree.SetFocus ()									//★★★
        else																	//★★★
			DtlCmnEditExCodeNumeric.SetFocus ()									//★★★
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnTabOnChange (TObject)									            */
//*																									*/
//*	目的	: 部門登録処理 詳細ﾀﾌﾞ OnChange ｲﾍﾞﾝﾄ											        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnTabOnChange (Sender: TObject);
var
	cTabItem    : TMTabItems;
	nSumDivision: Integer;
//    str:string ;
begin
	{0214 編集中の場合は確認}
	///<006> ↓
	if	((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
		and (DtlCmnEditExCodeNumeric.Visible))
		or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
		begin
	//<006> ↑

		if CONFIRM_THROUGH<> fnOutputConfirmationMessage (CONFIRM_CANCEL) then
		begin
			if DtlCmnTab.Items[0].Selected = True then					// 実在
			begin
	 			DtlCmnTab.Items[0].Selected := False;
	   			DtlCmnTab.Items[1].Selected := True;
			end
			else
			begin
	   			DtlCmnTab.Items[1].Selected := False;
	   			DtlCmnTab.Items[0].Selected := True;
			end;
			exit;
		end;
	end;

	m_fChangeDetails	:= FALSE;

	cTabItem	:= Sender as TMTabItems;

	if	(not m_fAccessTab) then
		Exit;


    {
	if	(m_fDtlNewRecord) then
	begin
		m_fDtlNewRecord	:= FALSE;
		Exit;
	end;
    }

	// 0214
    if DtlCmnTab.Items[0].Selected = True then					// 実在
		DtlCmnEditSumDivision.Value := 1
    else
		DtlCmnEditSumDivision.Value := 0;

	nSumDivision	:= Trunc (DtlCmnEditSumDivision.Value);

	if	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
		nSumDivision	:= 1
	else
		nSumDivision	:= 0;

	if	(cTabItem [nSumDivision].Selected) then
	begin
{★★★
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
★★★}
//		m_fDtlNewRecord		:= TRUE;

		fnInitializeDetailScreen (TRUE);

//		if	(cTabItem [1].Selected) then												// 合計
//			fnChangeComponentState (1, FALSE);

		if	(cTabItem [0].Selected) then												// 実在
		begin
			fnDisableDetailScreen (0);
		end
		else																			// 合計
		begin
			//<070410> 日付にﾌｫｰｶｽがある時はｺｰﾄﾞへﾌｫｰｶｽ移動
//<080311>↓
//			if (Screen.ActiveControl.Name = DtlCmnEditAppDateStart.Name) or
//				(Screen.ActiveControl.Name = DtlCmnEditAppDateEnd.Name) then
			if (m_cACControl.Name = DtlCmnEditAppDateStart.Name) or
				(m_cACControl.Name = DtlCmnEditAppDateEnd.Name) then
//<080311>↑
			begin
				if	(m_nCurrentCodeAttr <= 1) then
					m_cACControl	:= DtlCmnEditExCodeNumeric
				else
					m_cACControl	:= DtlCmnEditExCodeFree;
				m_cACControl.SetFocus ();
            end;

			fnDisableDetailScreen (1);
		end;
	end;

	{0214}
	m_fChangeDetails	:= FALSE;

    //<007> ↓
    {
	if	(m_nCurrentCodeAttr <= 1) then
		m_cACControl	:= DtlCmnEditExCodeNumeric
	else
		m_cACControl	:= DtlCmnEditExCodeFree;

	m_cACControl.SetFocus ();
    }
    //<007> ↑
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnTabOnKeyDown (TObject; var Word; TShiftState)			            */
//*																									*/
//*	目的	: 部門登録処理 詳細ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ											        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(not m_fAccessTab) then
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
//	if	((Key = VK_RETURN) or (Key = VK_DOWN) or (Key = VK_TAB)) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();
	end
	else if	(Key = VK_UP) then
	begin
        //<009> ↓ 部門：移動せず／ｾｸﾞﾒﾝﾄ：ｺﾝﾎﾞへ移動
        //MjsDispCtrl.MjsPrevCtrl (Self);

        if  (ParentMasterDiv = 101) then
            MjsDispCtrl.MjsPrevCtrl (Self);
        Abort;
        //<009> ↑
	end
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		if ((DtlCmnButtonUpdate.Enabled) AND (Key = VK_END)) then
           	DtlCmnButtonUpdate.SetFocus ()
		else if ((DtlCmnButtonCancel.Enabled) AND (Key = VK_ESCAPE)) then
           	DtlCmnButtonCancel.SetFocus ()
       	else if DtlCmnEditExCodeFree.Visible then								//★★★ 詳細
			DtlCmnEditExCodeFree.SetFocus ()									//★★★
        else																	//★★★
			DtlCmnEditExCodeNumeric.SetFocus ();								//★★★
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnEnter (TObject)										*/
//*																									*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridExistOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
	fnCommonFunctionOnEnter02 (Sender);
	fnEnableToolbarButtonTag (TRUE);

	StdCmnGridExist.FocusedColumn	:= 1;
//<130710>↓
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
	FFunctionBar.Enabled	:= True;
//<130710>↑

	fValueCheck	:= TRUE;

//<100827>↓
//	if	((m_nCurrentCodeAttr <= 1) and (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
	if	((m_nCurrentCodeAttr <= 1) and (Trim(StdCmnGridExist.FocusedNode.Strings [1]) <> '')) then
//<100827>↑
	begin
		if	((StdCmnMemDataExist.State in [dsInsert]) and
//<100827>↓
//			 (StrToInt64 (Trim (StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
			 (StrToInt64Def(Trim (StdCmnGridExist.FocusedNode.Strings [1]), 0) = 0)) then
//<100827>↑
			fValueCheck	:= FALSE;
	end;

	if  ((StdCmnGridExist.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		CmnToolbarButtonDelete.Enabled	:= FALSE;
		fnEnableToolbarButtonTag (FALSE);
	end
	else
	begin
		CmnToolbarButtonDetail.Enabled	:= TRUE;

		fnEnableToolbarButtonTag   (TRUE);
		fnSetDeleteButtonCondition ();
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnEnter (TObject)										*/
//*																									*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridTotalOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
    fnCommonFunctionOnEnter02 (Sender);
	fnEnableToolbarButtonTag (TRUE);

	StdCmnGridTotal.FocusedColumn	:= 1;
//<130710>↓
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
	FFunctionBar.Enabled	:= True;
//<130710>↑

	fValueCheck	:= TRUE;

//<100827>↓
//	if	((m_nCurrentCodeAttr <= 1) and (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
	if	((m_nCurrentCodeAttr <= 1) and (Trim(StdCmnGridTotal.FocusedNode.Strings [1]) <> '')) then
//<100827>↑
	begin
		if	((StdCmnMemDataTotal.State in [dsInsert]) and
//<100827>↓
//			 (StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
			 (StrToInt64Def(Trim (StdCmnGridTotal.FocusedNode.Strings [1]), 0) = 0)) then
//<100827>↑
			fValueCheck	:= FALSE;
    end;

	if  ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		CmnToolbarButtonDelete.Enabled	:= FALSE;
		fnEnableToolbarButtonTag (FALSE);
	end
	else
	begin
		CmnToolbarButtonDetail.Enabled	:= TRUE;

		fnEnableToolbarButtonTag   (TRUE);
		fnSetDeleteButtonCondition ();
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnChangeNodeEx (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridExistOnChangeNodeEx (Sender: TObject);
//<090616>↓
//var
//    fValueCheck: Boolean;
//<090616>↑

begin
//<090616>↓
//    fValueCheck := True;
//
//    if  ((m_nCurrentCodeAttr <= 1) and (StdCmnGridExist.FocusedNode.Strings [1] <> '')) then
//    begin
//		if	((StdCmnMemDataExist.State in [dsInsert]) and
//			 (StrToInt64 (Trim (StdCmnGridExist.FocusedNode.Strings [1])) = 0)) then
//			fValueCheck := False;
//    end;
//
//	if  ((StdCmnGridExist.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
//	begin
//		StdCmnGridExist.FocusedColumn   := 1;
//
//		CmnToolbarButtonDetail.Enabled	:= FALSE;
//		CmnToolbarButtonDelete.Enabled	:= FALSE;
//		fnEnableToolbarButtonTag (FALSE);
////		StdCmnMemDataExist.FieldByName('nInCode'    ).AsString	:= IntToStr(GetNewNCode());
//	end
//	else
//	begin
////<080311>↓
////		if Screen.ActiveControl = nil then
////			exit;
////		if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
//		if m_cACControl = nil then
//			exit;
//		if	(m_cACControl.Name = StdCmnGridExist.Name) then
////<080311>↑
//		begin
//			CmnToolbarButtonDetail.Enabled	:= TRUE;
//
//			fnEnableToolbarButtonTag   (TRUE);
//			fnSetDeleteButtonCondition ();
//		end;
//	end;
//<090616>↑
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnChangeNodeEx (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridTotalOnChangeNodeEx (Sender: TObject);
//<090616>↓
//var
//	fValueCheck: Boolean;
//<090616>↑

begin
//<090616>↓
//	fValueCheck	:= TRUE;
//
//    if  ((m_nCurrentCodeAttr <= 1) and (StdCmnGridTotal.FocusedNode.Strings [1] <> '')) then
//    begin
//		if	((StdCmnMemDataTotal.State in [dsInsert]) and
//			 (StrToInt64 (Trim (StdCmnGridTotal.FocusedNode.Strings [1])) = 0)) then
//			fValueCheck := False;
//	end;
//
//	if  ((StdCmnGridTotal.FocusedNode.Strings [1] = '') or (not fValueCheck)) then
//	begin
//		StdCmnGridTotal.FocusedColumn   := 1;
//
//		CmnToolbarButtonDetail.Enabled	:= FALSE;
//		CmnToolbarButtonDelete.Enabled	:= FALSE;
//		fnEnableToolbarButtonTag (FALSE);
////		StdCmnMemDataTotal.FieldByName('nInCode'    ).AsString	:= IntToStr(GetNewNCode());
//	end
//	else
//	begin
////<080311>↓
////		if Screen.ActiveControl = nil then
//		if m_cACControl = nil then
////<080311>↑
//			exit;
////<080311>↓
////		if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then
//		if	(m_cACControl.Name = StdCmnGridTotal.Name) then
////<080311>↑
//		begin
//			CmnToolbarButtonDetail.Enabled	:= TRUE;
//
//			fnEnableToolbarButtonTag   (TRUE);
//			fnSetDeleteButtonCondition ();
//		end;
//	end;
//<090616>↑

end;

//<090616>↓
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.StdCmnMemDataExistAfterScroll(DataSet: TDataSet);								*/
//*																											*/
//*	目的	: 部門登録処理 実在部門MemData OnAfterScroll ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure TJNTCRP0020030f.StdCmnMemDataExistAfterScroll(DataSet: TDataSet);
var
	fValueCheck: Boolean;
begin
	fValueCheck := True;

	if  (m_fUpdateRecord) then
	begin
//<100217>↓
		if m_SyokuchiNCd = StdCmnGridExist.DataSource.DataSet.FieldByName('nInCode').AsString then
		begin
			if	(StdCmnGridExist.FocusedColumn = 5) or							// ﾌｫｰｶｽ位置: 5=適用日(開始)
//<100323>↓
//				(StdCmnGridExist.FocusedColumn = 6)  then						// ﾌｫｰｶｽ位置: 6=適用日(終了)
				(StdCmnGridExist.FocusedColumn = 6) or							// ﾌｫｰｶｽ位置: 6=適用日(終了)
				(StdCmnGridExist.FocusedColumn = 8) or							// ﾌｫｰｶｽ位置: 8=分類(名称)
				(StdCmnGridExist.FocusedColumn = 7) then						// ﾌｫｰｶｽ位置: 7=分類(区分)
//<100323>↑
			begin
				StdCmnGridExist.FocusedColumn	:= 4;
			end;

			StdCmnGridExistStartDate.ReadOnly		:= True;
			StdCmnGridExistStartDate.TabStop		:= False;
			StdCmnGridExistEndDate.ReadOnly			:= True;
			StdCmnGridExistEndDate.TabStop			:= False;
			StdCmnGridExistAdoptDivision.ReadOnly	:= True;
			StdCmnGridExistAdoptDivision.TabStop	:= False;
		end
		else
		begin
			StdCmnGridExistStartDate.ReadOnly		:= False;
			StdCmnGridExistStartDate.TabStop		:= True;
			StdCmnGridExistEndDate.ReadOnly			:= False;
			StdCmnGridExistEndDate.TabStop			:= True;
//<100323>↓
			if m_nCurrentAdoptDiv <> 1 then
			begin
				StdCmnGridExistAdoptDivision.ReadOnly	:= False;
				StdCmnGridExistAdoptDivision.TabStop	:= True;
			end;
//<100323>↑
		end;
//<100217>↑

		if   ((m_nCurrentCodeAttr <= 1)
//<100827>↓
//		 and  (StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString <> '')) then
		 and  (Trim(StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString) <> '')) then
//<100827>↑
		begin
			if   ((StdCmnMemDataExist.State in [dsInsert])
//<100827>↓
//			 and  (StrToInt64(Trim(StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString)) = 0)) then
			 and  (StrToInt64Def(Trim(StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString), 0) = 0)) then
//<100827>↑
				fValueCheck := False;
		end;

		if	((StdCmnGridExist.DataSource.DataSet.FieldByName('strExCode').AsString = '')
		 or  (not fValueCheck)) then
		begin
			if	(m_cACControl.Name = StdCmnGridExist.Name) then
				StdCmnGridExist.FocusedColumn	:= 1;

			CmnToolbarButtonDetail.Enabled	:= FALSE;
			CmnToolbarButtonDelete.Enabled	:= FALSE;
			fnEnableToolbarButtonTag (FALSE);
		end
		else
		begin
			if m_cACControl = nil then
				exit;
			if	(m_cACControl.Name = StdCmnGridExist.Name) then
			begin
				CmnToolbarButtonDetail.Enabled	:= TRUE;

				fnEnableToolbarButtonTag   (TRUE);
				fnSetDeleteButtonCondition ();
			end;
		end;
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.StdCmnMemDataTotalAfterScroll(DataSet: TDataSet)								*/
//*																											*/
//*	目的	: 部門登録処理 合計部門MemData OnAfterScroll ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure TJNTCRP0020030f.StdCmnMemDataTotalAfterScroll(DataSet: TDataSet);
var
	fValueCheck: Boolean;

begin
	fValueCheck	:= TRUE;

	if (m_fUpdateRecord) then
	begin
//<100217>↓
		if m_TotalNCd = StdCmnGridTotal.DataSource.DataSet.FieldByName('nInCode').AsString then
		begin
			if	(StdCmnGridTotal.FocusedColumn = 5) or								// ﾌｫｰｶｽ位置: 5=適用日(開始)
				(StdCmnGridTotal.FocusedColumn = 6)  then							// ﾌｫｰｶｽ位置: 6=適用日(終了)
			begin
				StdCmnGridTotal.FocusedColumn	:= 4;
			end;

			StdCmnGridTotalStartDate.ReadOnly	:= True;
			StdCmnGridTotalStartDate.TabStop	:= False;
			StdCmnGridTotalEndDate.ReadOnly		:= True;
			StdCmnGridTotalEndDate.TabStop		:= False;
		end
		else
		begin
			StdCmnGridTotalStartDate.ReadOnly	:= False;
			StdCmnGridTotalStartDate.TabStop	:= True;
			StdCmnGridTotalEndDate.ReadOnly		:= False;
			StdCmnGridTotalEndDate.TabStop		:= True;
		end;
//<100217>↑

		if   ((m_nCurrentCodeAttr <= 1)
//<100827>↓
//		 and  (StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString <> '')) then
		 and  (Trim(StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString) <> '')) then
//<100827>↑
		begin
			if   ((StdCmnMemDataTotal.State in [dsInsert])
//<100827>↓
//			 and  (StrToInt64 (Trim (StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString)) = 0)) then
			 and  (StrToInt64Def(Trim (StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString), 0) = 0)) then
//<100827>↑
				fValueCheck := False;
		end;

		if  ((StdCmnGridTotal.DataSource.DataSet.FieldByName('strExCode').AsString = '') or (not fValueCheck)) then
		begin
			if	(m_cACControl.Name = StdCmnGridTotal.Name) then
				StdCmnGridTotal.FocusedColumn   := 1;

			CmnToolbarButtonDetail.Enabled	:= FALSE;
			CmnToolbarButtonDelete.Enabled	:= FALSE;
			fnEnableToolbarButtonTag (FALSE);
		end
		else
		begin
			if m_cACControl = nil then
				exit;
			if	(m_cACControl.Name = StdCmnGridTotal.Name) then
			begin
				CmnToolbarButtonDetail.Enabled	:= TRUE;
				fnEnableToolbarButtonTag   (TRUE);
				fnSetDeleteButtonCondition ();
			end;
		end;
	end;

end;
//<090616>↑



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnBeforeChangeColumn (TObject; TdxTreeListNode ...)		*/
//*																									*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridExistOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField       : TField;
	strExCode	 : String;
	strFormat	 : String;
    strName      : String;
    strNameSimple: String;
	iRet		 : Integer;						//  <マスタ同期>
begin
    if  (Column = 1) then
    begin
		with (StdCmnDataSourceExist.DataSet) do
		begin
            cField  := FieldByName('strExCode');

			if	(not fnCheckExCodeValidCharacter (cField.AsString)) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

			if	(StdCmnMemDataExist.State in [dsInsert]) then
			begin
				if  (Trim (cField.AsString) = '0') then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
//<100827>↓
				if  (Trim(cField.AsString) = '') then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
//<100827>↑
				if  (m_nCurrentCodeAttr <= 1) then
				begin
//<100827>↓
//					if  (StrToInt64 (Trim (cField.AsString)) = 0) then
					if  (StrToInt64Def(Trim (cField.AsString), 0) = 0) then
//<100827>↑
					begin
						Beep ();
//<100827>↓
////---------------------------------------------------------------------------------------------HIS0011
//					//	同一コードが存在してます
//					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
//					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
//		    		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
////---------------------------------------------------------------------------------------------
//<100827>↑
						cField.FocusControl;
						Abort;
					end;
				end;
			end;

			if  (not StdCmnGridExist.Columns [1].ReadOnly) then
			begin
				//  <マスタ同期>---Begin---
				iRet := fnCheckMasterDataRecordValid (cField.AsString);
				{自社に同一コードが存在}
				if  iRet = C_RET_SAME_SELF then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在→関連付けしない}
				else if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在→関連付け}
				else if iRet = C_RET_SYNC then
				begin
					// ★一覧に追加
					cField.FocusControl;

					Abort;
				end
				{その他のエラー}
				else if iRet = C_RET_ERROR then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;

				iRet := fnCheckMasterDataRecordValid2 (cField.AsString);
				{自社の合計に同一コードが存在}
				if iRet = C_RET_SAME_SELF then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在}
				else if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
                   							// 簡略名称もﾒｯｾｰｼﾞに表示する
					MJSMessageBoxEx (Self,
                    			     m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                                     m_cErrorMsgRec.sTitle,
                                     m_cErrorMsgRec.icontype,
                                     m_cErrorMsgRec.btntype,
                                     m_cErrorMsgRec.btndef,
                                     m_cErrorMsgRec.LogType);
// <014> MOD end


					cField.FocusControl;
					Abort;
				end
				{その他のエラー}
				else if iRet = C_RET_ERROR then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
				(*
				if  (not fnCheckMasterDataRecordValid (cField.AsString)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0011
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl;
					Abort;
				end;
				if  (not fnCheckMasterDataRecordValid2 (cField.AsString)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0011
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl;
					Abort;
				end;
				*)
				//  <マスタ同期>--- End ---

//				strExCode	:= cField.AsString;
				strExCode	:= TrimRight(cField.AsString);		//HIS0010

				if  (m_nCurrentCodeAttr <= 1) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			    end;

				StdCmnMemDataExist.FieldByName('strExCode'   ).AsString	:= strExCode;
				StdCmnMemDataExist.FieldByName('nAdoptData01').AsInteger	:= 0
            end;
        end;
    end;

    if  (Column = 2) then
    begin
		with (StdCmnGridExist) do
		begin
			strNameSimple   := DataSource.DataSet.FieldByName('strNameSimple').AsString;

			if  (strNameSimple = '') then
			begin
				strName := DataSource.DataSet.FieldByName('strName').AsString;

				if  (strName <> '') then
				begin
					StdCmnGridExist.DataLink.Edit;

					if	(StrLen (PChar (strName)) <= 14) then
						StdCmnGridExist.Columns [3].Field.AsString  := MjsHanCopy (strName, 1, 14)	//<D10-U> Copy → MjsHanCopy
					else
						StdCmnGridExist.Columns [3].Field.AsString	:= MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnBeforeChangeColumn (TObject; TdxTreeListNode ...)		*/
//*																									*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridTotalOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer;
                                                                NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
    cField       : TField;
	strExCode	 : String;
	strFormat	 : String;
    strName      : String;
    strNameSimple: String;
	iRet		 : Integer;						//  <マスタ同期>
begin
    if  (Column = 1) then
    begin
        with (StdCmnDataSourceTotal.DataSet) do
        begin
            cField  := FieldByName('strExCode');

			if	(not fnCheckExCodeValidCharacter (cField.AsString)) then
			begin
				cField.FocusControl ();
				Abort ();
			end;

			if	(StdCmnMemDataTotal.State in [dsInsert]) then
			begin
				if  (Trim (cField.AsString) = '0') then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
//<100827>↓
				if  (Trim(cField.AsString) = '') then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
//<100827>↑
				if  (m_nCurrentCodeAttr <= 1) then
				begin
//<100827>↓
//					if  (StrToInt64 (Trim (cField.AsString)) = 0) then
					if  (StrToInt64Def(Trim (cField.AsString), 0) = 0) then
//<100827>↑
					begin
						Beep ();
						cField.FocusControl;
						Abort;
					end;
				end;
			end;

//            if  (not StdCmnGridTotal.Columns [1].ReadOnly) then
			if (not TotalRead) then
            begin
				//  <マスタ同期>---Begin---
				iRet := fnCheckMasterDataRecordValid (cField.AsString);
				{自社に同一コードが存在}
				if iRet = C_RET_SAME_SELF then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在→関連付けしない}
				else if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在→関連付け}
				else if iRet = C_RET_SYNC then
				begin
					// ★一覧に追加
					cField.FocusControl;

					Abort;
				end
				{その他のエラー}
				else if iRet = C_RET_ERROR then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;

				iRet := fnCheckMasterDataRecordValid2 (cField.AsString);
				{自社の実在に同一コードが存在}
				if iRet = C_RET_SAME_SELF then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg;
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cField.FocusControl;
					Abort;
				end
				{全社に同一コードが存在}
				else if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
                    						// 簡略名称もﾒｯｾｰｼﾞに表示する
					MJSMessageBoxEx (Self,
                    				 m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                                     m_cErrorMsgRec.sTitle,
                                     m_cErrorMsgRec.icontype,
                                     m_cErrorMsgRec.btntype,
                                     m_cErrorMsgRec.btndef,
                                     m_cErrorMsgRec.LogType);
// <014> MOD end

					cField.FocusControl;
					Abort;
				end
				{その他のエラー}
				else if iRet = C_RET_ERROR then
				begin
					Beep ();
					cField.FocusControl;
					Abort;
				end;
				(*
				if  (not fnCheckMasterDataRecordValid (cField.AsString)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0011
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl;
					Abort;
				end;
				if  (not fnCheckMasterDataRecordValid2 (cField.AsString)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0011
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
					m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg;
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl;
					Abort;
				end;
				*)
				//  <マスタ同期>--- End ---

//				strExCode	:= cField.AsString;
				strExCode	:= TrimRight(cField.AsString);		//HIS0010

				if  (m_nCurrentCodeAttr <= 1) then
				begin
					case (m_nCurrentCodeAttr) of
						0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			    end;

				StdCmnMemDataTotal.FieldByName('strExCode').AsString	:= strExCode;
            end;
        end;
    end;

    if  (Column = 2) then
    begin
        with (StdCmnGridTotal) do
        begin
            strNameSimple   := DataSource.DataSet.FieldByName('strNameSimple').AsString;

            if  (strNameSimple = '') then
            begin
                strName := DataSource.DataSet.FieldByName('strName').AsString;

                if  (strName <> '') then
                begin
                    StdCmnGridTotal.DataLink.Edit;

					if	(StrLen (PChar (strName)) <= 14) then
						StdCmnGridTotal.Columns [3].Field.AsString  := MjsHanCopy (strName, 1, 14)	//<D10-U> Copy → MjsHanCopy
					else
						StdCmnGridTotal.Columns [3].Field.AsString	:= MJSKabuCut (strName, 14);
                end;
            end;
        end;
    end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnChangeColumn (TObject; TdxTreeListNode; Integer)				*/
//*																											*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ OnChangeColumn ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridExistOnChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
var
	stMessageRec: TMJSMsgRec;

begin
	//略称だったらガイド表示
	if	(Column = 3) then
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

//<100906>↓
//		FFunctionBar.SetFuncCaption (8, stMessageRec.sMsg);
//		FFunctionBar.SetFuncEnabled (8, True) ;
		m_arFunction[7]	:= stMessageRec.sMsg;
//<100906>↑
//		CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
	end
	else
	begin
//<100906>↓
//		FFunctionBar.SetFuncCaption (8, '');
//		FFunctionBar.SetFuncEnabled (8, False) ;
		m_arFunction[7]	:= '';
//<100906>↑
//		CmnStatusBar.SimpleText	:= '';
	end;
//<100906>↓
	FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
	FFunctionBar.Enabled	:= True;
//<110131_3>↑

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnChangeColumn (TObject; TdxTreeListNode; Integer)				*/
//*																											*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnChangeColumn ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridTotalOnChangeColumn (Sender: TObject; Node: TdxTreeListNode; Column: Integer);
var
	stMessageRec: TMJSMsgRec;

begin
	//略称だったらガイド表示
	if	(Column = 3) then
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

//<100906>↓
//		FFunctionBar.SetFuncCaption (8, stMessageRec.sMsg);
//		FFunctionBar.SetFuncEnabled (8, True) ;
		m_arFunction[7]	:= stMessageRec.sMsg;
//<100906>↑
		//CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
	end
	else
	begin
//<100906>↓
//		FFunctionBar.SetFuncCaption (8, '');
//		FFunctionBar.SetFuncEnabled (8, False) ;
		m_arFunction[7]	:= '';
//<100906>↑
		//CmnStatusBar.SimpleText	:= '';
	end;
//<100906>↓
	FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
	FFunctionBar.Enabled	:= True;
//<110131_3>↑

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnMouseDown (TObject; TMouseButton; TShiftState...)				*/
//*																											*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridExistOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;

begin
//<100217>↓
	if m_SyokuchiNCd = StdCmnMemDataExist.FieldByName('nInCode').AsString then
	begin
		if	(StdCmnGridExist.FocusedColumn = 5) or								// ﾌｫｰｶｽ位置: 5=適用日(開始)
//<100323>↓
//			(StdCmnGridExist.FocusedColumn = 6) then							// ﾌｫｰｶｽ位置: 6=適用日(終了)
			(StdCmnGridExist.FocusedColumn = 6) or								// ﾌｫｰｶｽ位置: 6=適用日(終了)
			(StdCmnGridExist.FocusedColumn = 8) or								// ﾌｫｰｶｽ位置: 8=分類(名称)
			(StdCmnGridExist.FocusedColumn = 7) then							// ﾌｫｰｶｽ位置: 7=分類(区分)
//<100323>↑
		begin
			cField	:= StdCmnDataSourceExist.DataSet.FieldByName('strExCode');
			cField.FocusControl ();

			Abort ();
			Exit;
		end;
	end;
//<100217>↑


	if	((StdCmnGridExist.FocusedColumn = 0) or											// ﾌｫｰｶｽ位置: 0=付箋
//<100215_1>↓
//		 (StdCmnGridExist.FocusedColumn = 6) or											// ﾌｫｰｶｽ位置: 6=分類(名称)
//    	((StdCmnGridExist.FocusedColumn = 5) and (m_nCurrentAdoptDiv = 1))) then		// ﾌｫｰｶｽ位置: 6=分類(区分)＆採用1
		 (StdCmnGridExist.FocusedColumn = 8) or											// ﾌｫｰｶｽ位置: 8=分類(名称)
    	((StdCmnGridExist.FocusedColumn = 7) and (m_nCurrentAdoptDiv = 1))) then		// ﾌｫｰｶｽ位置: 7=分類(区分)＆採用1
//<100215_1>↑
	begin
		cField	:= StdCmnDataSourceExist.DataSet.FieldByName('strExCode');
		cField.FocusControl ();

		Abort ();
		Exit;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnMouseDown (TObject; TMouseButton; TShiftState...)				*/
//*																											*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridTotalOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;

begin
//<100217>↓
	if m_TotalNCd = StdCmnMemDataTotal.FieldByName('nInCode').AsString then
	begin
		if	(StdCmnGridTotal.FocusedColumn = 5) or								// ﾌｫｰｶｽ位置: 5=適用日(開始)
			(StdCmnGridTotal.FocusedColumn = 6)  then							// ﾌｫｰｶｽ位置: 6=適用日(終了)
		begin

			cField	:= StdCmnDataSourceTotal.DataSet.FieldByName('strExCode');
			cField.FocusControl ();

			Abort ();
			Exit;
		end;
	end;
//<100217>↑


	if	(StdCmnGridTotal.FocusedColumn = 0) then										// ﾌｫｰｶｽ位置: 0=付箋
	begin
		cField	:= StdCmnDataSourceTotal.DataSet.FieldByName('strExCode');
		cField.FocusControl ();

		Abort ();
		Exit;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnMemDataExistBeforePost (TDataSet)											*/
//*																											*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnMemDataExistBeforePost (DataSet: TDataSet);
var
	cFieldWork	: TField;
    fValueCheck	: Boolean;
//<100215_1>↓
	iStDate		: Integer;
	iEdDate		: Integer;
//<100215_1>↑
//<100615>↓
	iNCode		: Int64;
//<100615>↑
	iRet		: Integer;						//  <マスタ同期>
begin
	fValueCheck	:= TRUE;

	if  (m_fUpdateRecord) then
	begin
		with (DataSet) do
		begin
            //--- HIS0027 St -----
{
            if fnHaitaCheck() = 99 then
            begin
                StdCmnMemDataExist.Cancel;
                StdCmnGridExist.FocusedColumn   := 1;
                StdCmnGridExist.SetFocus;
                abort;
            end;
}
            //--- HIS0027 Ed -----

			cFieldWork	:= FieldByName('strExCode');

			if	(not fnCheckExCodeValidCharacter (cFieldWork.AsString)) then
			begin
				cFieldWork.FocusControl ();
				Abort ();
			end;

			if	(fValueCheck and (StdCmnMemDataExist.State in [dsInsert])) then
			begin
				if	(m_nCurrentCodeAttr <= 1) then
				begin
//<100827>↓
//					if	(StrToInt64 (Trim (cFieldWork.AsString)) = 0) then
					if	(StrToInt64Def (Trim (cFieldWork.AsString), 0) = 0) then
//<100827>↑
						fValueCheck	:= FALSE;
				end
				else
				begin
					if	(Trim (cFieldWork.AsString) = '0') then
						fValueCheck	:= FALSE;
				end;
			end;

			if	(fValueCheck and (StdCmnMemDataExist.State in [dsInsert])) then
			begin
				//  <マスタ同期>---Begin---
				iRet := fnCheckMasterDataRecordValid (cFieldWork.AsString);
				{全社に同一コードが存在→関連付け}
				if iRet = C_RET_SYNC then
				begin
					// ★一覧に追加

					Abort;
				end
				{両方に存在なし以外}
				else if iRet <> C_RET_NONE then
				begin
					Beep ();
					Abort;
				end;
				iRet := fnCheckMasterDataRecordValid2 (cFieldWork.AsString);
				{全社の実在・合計違いに同一コードが存在}
				if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();

					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
                                 			// 簡略名称もﾒｯｾｰｼﾞに表示する
					MJSMessageBoxEx (Self,
                    				 m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                                     m_cErrorMsgRec.sTitle,
                                     m_cErrorMsgRec.icontype,
                                     m_cErrorMsgRec.btntype,
                                     m_cErrorMsgRec.btndef,
                                     m_cErrorMsgRec.LogType);
// <014> MOD end

					Abort;
				end
				{両方に存在なし以外}
				else if iRet <> C_RET_NONE then
				begin
					Beep ();
					Abort;
				end;
				(*
				if  (not fnCheckMasterDataRecordValid (cFieldWork.AsString)) then
					fValueCheck	:= FALSE
				else if  (not fnCheckMasterDataRecordValid2 (cFieldWork.AsString)) then
					fValueCheck	:= FALSE;
				*)
				//  <マスタ同期>--- End ---
			end;

			cFieldWork	:= FieldByName('strName');
            if Trim(cFieldWork.AsString) = '' then
            begin
				m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
				m_cErrorMsgRec.sMsg := '正式名称が未入力です。';
   				MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

				cFieldWork.FocusControl ();
				Abort ();
            end;

//<100217>↓
			if m_SyokuchiNCd = StdCmnMemDataExist.FieldByName('nInCode').AsString then
			begin
				// 念のためガード
				if (StdCmnMemDataExist.FieldByName('dtStartDate').AsDateTime <> 0)
				or (StdCmnMemDataExist.FieldByName('dtEndDate').AsDateTime <> 0) then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '諸口に適用日を設定することはできません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					StdCmnMemDataExist.FieldByName('dtStartDate').Clear;
					StdCmnMemDataExist.FieldByName('dtEndDate').Clear;
				end;

//<100323>↓
				if StdCmnMemDataExist.FieldByName('nAdoptDivision').AsInteger <> 1 then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '諸口の分類を設定することはできません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					StdCmnMemDataExist.FieldByName('nAdoptDivision').AsInteger	:= 1;
				end;
//<100323>↑
			end
			else
			begin
//<100217>↑
//<100215_1>↓
				cFieldWork	:= FieldByName('dtEndDate');
				iStDate	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataExist.FieldByName('dtStartDate').AsDateTime);
				if	(iStDate = 18991230) then
					iStDate	:= MjsDateCtrl.MjsDateToInt8(DEF_S_DATE);
				iEdDate	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataExist.FieldByName('dtEndDate').AsDateTime);
				if	(iEdDate = 18991230) then
					iEdDate	:= MjsDateCtrl.MjsDateToInt8(DEF_E_DATE);

//<100615>↓
				if (iStDate < MjsDateCtrl.MjsDateToInt8(DEF_S_DATE))
				or (MjsDateCtrl.MjsDateToInt8(DEF_E_DATE) < iStDate)
				or (iEdDate < MjsDateCtrl.MjsDateToInt8(DEF_S_DATE))
				or (MjsDateCtrl.MjsDateToInt8(DEF_E_DATE) < iEdDate) then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用期間が適切ではありません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100615>↑

//<110131_1>↓
//				if	(iStDate >= iEdDate) then
				if	(iStDate > iEdDate) then
//<110131_1>↑
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用終了年月日は開始年月日以降でなければなりません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100215_1>↑
//<100615>↓
				if ((StdCmnMemDataExist.FieldByName('nInCode').IsNull) or (StdCmnMemDataExist.FieldByName('nInCode').AsString = '')) then
				begin
					iNCode	:= 0;
				end
				else
				begin
					iNCode	:= StrToInt64(StdCmnMemDataExist.FieldByName('nInCode').AsString);
				end;

				if fnChkDate(iNCode,
							 StdCmnMemDataExist.FieldByName('strExCode').AsString,
							 StdCmnMemDataExist.FieldByName('dtStartDate').AsDateTime,
							 StdCmnMemDataExist.FieldByName('dtEndDate').AsDateTime) = False then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用期間が重複した同一コードが存在します。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100615>↑
//<100217>↓
			end;
//<100217>↑
{
			cFieldWork	:= FieldByName('strAssociation');
            if Trim(cFieldWork.AsString) = '' then
            begin
				m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
				m_cErrorMsgRec.sMsg := '連想が未入力です。';
   				MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

				cFieldWork.FocusControl ();
				Abort ();
            end;
}
			if  (fValueCheck) then
			begin
				m_stMasterData.nDivision		:= 0;
				m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;
				m_stMasterData.strExCode		:= StdCmnMemDataExist.FieldByName('strExCode'     ).AsString;
//<080902>↓
//				m_stMasterData.strAssociation	:= StdCmnMemDataExist.FieldByName('strAssociation').AsString;
//				m_stMasterData.strName			:= StdCmnMemDataExist.FieldByName('strName'       ).AsString;
//				m_stMasterData.strNameSimple	:= StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString;
				m_stMasterData.strAssociation	:= fnReplaceCRLF(StdCmnMemDataExist.FieldByName('strAssociation').AsString);
				m_stMasterData.strName			:= fnReplaceCRLF(StdCmnMemDataExist.FieldByName('strName'       ).AsString);
				m_stMasterData.strNameSimple	:= fnReplaceCRLF(StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString);
//<080902>↑
				m_stMasterData.nClassCode		:= StdCmnMemDataExist.FieldByName('nAdoptDivision').AsInteger;
				m_stMasterData.fDetails			:= FALSE;
//<100215_1>↓
//				m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8 (EDateStart.AsDateTime);	// 適用開始年月日
//				m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8 (EDateEnd  .AsDateTime);	// 適用終了年月日
				m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataExist.FieldByName('dtStartDate').AsDateTime);	// 適用開始年月日
				if	(m_stMasterData.nAppDateStart = 18991230) then
					m_stMasterData.nAppDateStart	:= 0;
				m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataExist.FieldByName('dtEndDate').AsDateTime);	// 適用終了年月日
				if	(m_stMasterData.nAppDateEnd = 18991230) then
					m_stMasterData.nAppDateEnd		:= 0;
//<100215_1>↑
				if ((StdCmnMemDataExist.FieldByName('nInCode').IsNull) or (StdCmnMemDataExist.FieldByName('nInCode').AsString = '')) then
				begin
                	//m_stMasterData.strNCode			:= IntToStr(GetNewNCode());
                	m_stMasterData.strNCode			:= '0';		// 0317
					StdCmnMemDataExist.FieldByName('nInCode').AsString := m_stMasterData.strNCode;
                end
				else
                	m_stMasterData.strNCode			:= StdCmnMemDataExist.FieldByName('nInCode'     ).AsString;

				if	(not fnUpdateMasterRecord ()) then
				begin
					StdCmnMemDataExist.Cancel ();
					StdCmnGridExist   .FocusedColumn	:= 1;

					Abort ();
				end;
				StdCmnMemDataExist.FieldByName('nInCode'     ).AsString := m_stMasterData.strNCode;
			end
            else
			begin
				Beep  ();
				Abort ();
			end;
        end;
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnMemDataTotalBeforePost (TDataSet)											*/
//*																											*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ BeforePost ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnMemDataTotalBeforePost (DataSet: TDataSet);
var
	cFieldWork	: TField;
	fValueCheck	: Boolean;
//<100215_1>↓
	iStDate		: Integer;
	iEdDate		: Integer;
//<100215_1>↑
//<100615>↓
	iNCode		: Int64;
//<100615>↑
	iRet		: Integer;						//  <マスタ同期>
begin
	fValueCheck	:= TRUE;

    if  (m_fUpdateRecord) then
    begin
        with (DataSet) do
        begin
            //--- HIS0027 St -----
{
            if fnHaitaCheck() = 99 then
            begin
                StdCmnMemDataTotal.Cancel;
                StdCmnGridTotal.FocusedColumn   := 1;
                StdCmnGridTotal.SetFocus;
                abort;
            end;
}
            //--- HIS0027 Ed -----

            cFieldWork	:= FieldByName('strExCode');

			if	(not fnCheckExCodeValidCharacter (cFieldWork.AsString)) then
			begin
				cFieldWork.FocusControl ();
				Abort ();
			end;

//<110801>↓
//			if	(fValueCheck) then
			if	(fValueCheck and (StdCmnMemDataTotal.State in [dsInsert])) then
//<110801>↑
			begin
				if	(m_nCurrentCodeAttr <= 1) then
				begin
//<100827>↓
//					if	(StrToInt64 (Trim (cFieldWork.AsString)) = 0) then
					if	(StrToInt64Def (Trim (cFieldWork.AsString), 0) = 0) then
//<100827>↑
						fValueCheck	:= FALSE;
				end
				else
				begin
					if	(Trim (cFieldWork.AsString) = '0') then
						fValueCheck	:= FALSE;
				end;
			end;

			if	(fValueCheck and (StdCmnMemDataTotal.State in [dsInsert])) then
			begin
				//  <マスタ同期>---Begin---
				iRet := fnCheckMasterDataRecordValid (cFieldWork.AsString);
				{全社に同一コードが存在→関連付け}
				if iRet = C_RET_SYNC then
				begin
					// ★一覧に追加

					Abort;
				end
				{両方に存在なし以外}
				else if iRet <> C_RET_NONE then
				begin
					Beep ();
					Abort;
				end;
				iRet := fnCheckMasterDataRecordValid2 (cFieldWork.AsString);
				{全社の実在・合計違いに同一コードが存在}
				if iRet = C_RET_SAME_PARENT then
				begin
					Beep ();

					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;
// <014> MOD start
//					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
											// 簡略名称もﾒｯｾｰｼﾞに表示する
					MJSMessageBoxEx (Self,
                    				 m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                                     m_cErrorMsgRec.sTitle,
                                     m_cErrorMsgRec.icontype,
                                     m_cErrorMsgRec.btntype,
                                     m_cErrorMsgRec.btndef,
                                     m_cErrorMsgRec.LogType);
// <014> MOD end
					Abort;
				end
				{両方に存在なし以外}
				else if iRet <> C_RET_NONE then
				begin
					Beep ();
					Abort;
				end;
				(*
				if  (not fnCheckMasterDataRecordValid (cFieldWork.AsString)) then
					fValueCheck	:= FALSE
				else if  (not fnCheckMasterDataRecordValid2 (cFieldWork.AsString)) then
					fValueCheck	:= FALSE;
				*)
				//  <マスタ同期>--- End ---
			end;

			cFieldWork	:= FieldByName('strName');
            if Trim(cFieldWork.AsString) = '' then
            begin
				m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
				m_cErrorMsgRec.sMsg := '正式名称が未入力です。';
   				MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

				cFieldWork.FocusControl ();
				Abort ();
            end;

//<100217>↓
			if m_TotalNCd = StdCmnMemDataTotal.FieldByName('nInCode').AsString then
			begin
				// 念のためガード
				if (StdCmnMemDataTotal.FieldByName('dtStartDate').AsDateTime <> 0)
				or (StdCmnMemDataTotal.FieldByName('dtEndDate').AsDateTime <> 0) then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '総合計に適用日を設定することはできません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					StdCmnMemDataTotal.FieldByName('dtStartDate').Clear;
					StdCmnMemDataTotal.FieldByName('dtEndDate').Clear;
				end;
			end
			else
			begin
//<100217>↑
//<100215_1>↓
				cFieldWork	:= FieldByName('dtEndDate');
				iStDate	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataTotal.FieldByName('dtStartDate').AsDateTime);
				if	(iStDate = 18991230) then
					iStDate	:= MjsDateCtrl.MjsDateToInt8(DEF_S_DATE);
				iEdDate	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataTotal.FieldByName('dtEndDate').AsDateTime);
				if	(iEdDate = 18991230) then
					iEdDate	:= MjsDateCtrl.MjsDateToInt8(DEF_E_DATE);

//<100615>↓
				if (iStDate < MjsDateCtrl.MjsDateToInt8(DEF_S_DATE))
				or (MjsDateCtrl.MjsDateToInt8(DEF_E_DATE) < iStDate)
				or (iEdDate < MjsDateCtrl.MjsDateToInt8(DEF_S_DATE))
				or (MjsDateCtrl.MjsDateToInt8(DEF_E_DATE) < iEdDate) then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用期間が適切ではありません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100615>↑

//<110131_1>↓
//				if	(iStDate >= iEdDate) then
				if	(iStDate > iEdDate) then
//<110131_1>↑
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用終了年月日は開始年月日以降でなければなりません。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100215_1>↑
//<100615>↓
				if ((StdCmnMemDataTotal.FieldByName('nInCode').IsNull) or (StdCmnMemDataTotal.FieldByName('nInCode').AsString = '')) then
				begin
					iNCode	:= 0;
				end
				else
				begin
					iNCode	:= StrToInt64(StdCmnMemDataTotal.FieldByName('nInCode').AsString);
				end;

				if fnChkDate(iNCode,
							 StdCmnMemDataTotal.FieldByName('strExCode').AsString,
							 StdCmnMemDataTotal.FieldByName('dtStartDate').AsDateTime,
							 StdCmnMemDataTotal.FieldByName('dtEndDate').AsDateTime) = False then
				begin
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := '適用期間が重複した同一コードが存在します。';
					MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
					cFieldWork.FocusControl ();
					Abort ();
				end;
//<100615>↑
//<100217>↓
			end;
//<100217>↑
{
			cFieldWork	:= FieldByName('strAssociation');
            if Trim(cFieldWork.AsString) = '' then
            begin
				m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
				m_cErrorMsgRec.sMsg := '連想が未入力です。';
   				MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

				cFieldWork.FocusControl ();
				Abort ();
            end;
}
			if  (fValueCheck) then
			begin
				m_stMasterData.nDivision		:= 1;
				m_stMasterData.strExCodeParent	:= m_strExCodeCurrent;
				m_stMasterData.strExCode		:= StdCmnMemDataTotal.FieldByName('strExCode'     ).AsString;
//<080902>↓
//				m_stMasterData.strAssociation	:= StdCmnMemDataTotal.FieldByName('strAssociation').AsString;
//				m_stMasterData.strName			:= StdCmnMemDataTotal.FieldByName('strName'       ).AsString;
//				m_stMasterData.strNameSimple	:= StdCmnMemDataTotal.FieldByName('strNameSimple' ).AsString;
				m_stMasterData.strAssociation	:= fnReplaceCRLF(StdCmnMemDataTotal.FieldByName('strAssociation').AsString);
				m_stMasterData.strName			:= fnReplaceCRLF(StdCmnMemDataTotal.FieldByName('strName'       ).AsString);
				m_stMasterData.strNameSimple	:= fnReplaceCRLF(StdCmnMemDataTotal.FieldByName('strNameSimple' ).AsString);
//<080902>↑
				m_stMasterData.nClassCode		:= 0;
				m_stMasterData.fDetails			:= FALSE;
//<100215_1>↓
//				m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8 (EDateStart.AsDateTime);	// 適用開始年月日
//				m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8 (EDateEnd  .AsDateTime);	// 適用終了年月日
				m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataTotal.FieldByName('dtStartDate').AsDateTime);	// 適用開始年月日
				m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8(StdCmnMemDataTotal.FieldByName('dtEndDate').AsDateTime);	// 適用終了年月日
				if	(m_stMasterData.nAppDateStart = 18991230) then
					m_stMasterData.nAppDateStart	:= 0;
				if	(m_stMasterData.nAppDateEnd = 18991230) then
					m_stMasterData.nAppDateEnd		:= 0;
//<100215_1>↑
				if ((StdCmnMemDataTotal.FieldByName('nInCode').IsNull) or (StdCmnMemDataTotal.FieldByName('nInCode').AsString = '')) then
                begin
//                	m_stMasterData.strNCode			:= IntToStr(GetNewNCode());
                	m_stMasterData.strNCode			:= '0';
   					StdCmnMemDataTotal.FieldByName('nInCode').AsString := m_stMasterData.strNCode;
				end
				else
                	m_stMasterData.strNCode			:= StdCmnMemDataTotal.FieldByName('nInCode'     ).AsString;

				if	(not fnUpdateMasterRecord ()) then
				begin
					StdCmnMemDataTotal.Cancel ();
					StdCmnGridTotal   .FocusedColumn	:= 1;

					Abort ();
				end;
				StdCmnMemDataTotal.FieldByName('nInCode'     ).AsString := m_stMasterData.strNCode;
			end
			else
			begin
				Beep  ();
				Abort ();
			end;
        end;
    end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnDataSourceExistOnStateChange (TObject)									*/
//*																											*/
//*	目的	: 部門登録処理 実在部門ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnDataSourceExistOnStateChange (Sender: TObject);
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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnDataSourceTotalOnStateChange (TObject)									*/
//*																											*/
//*	目的	: 部門登録処理 合計部門ｸﾞﾘｯﾄﾞ用ﾃﾞｰﾀｿｰｽ OnStateChange ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnDataSourceTotalOnStateChange (Sender: TObject);
begin
	if  (StdCmnMemDataTotal.State in [dsInsert]) then
	begin
		StdCmnGridTotal.Columns [1].ReadOnly	:= FALSE;
        TotalRead := False;
	end
	else
	begin
		StdCmnGridTotal.Columns [1].ReadOnly	:= True;
        TotalRead := True;
	end;

	if  (StdCmnMemDataTotal.Active and (StdCmnDataSourceTotal.DataSet <> nil)) then
	begin
		if  (StdCmnGridTotal.DataSource.DataSet.RecordCount = 0) then
		begin
        	StdCmnGridTotal.Columns [1].ReadOnly    := FALSE;
	        TotalRead := False;
		end;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnClientPanelExistOnResize (TObject)                                */
//*																									*/
//*	目的	: 部門登録処理 実在部門用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnClientPanelExistOnResize (Sender: TObject);
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
//*	関数	: TJNTCRP0020030f.fnStdCmnClientPanelTotalOnResize (TObject)                                */
//*																									*/
//*	目的	: 部門登録処理 合計部門用ｸﾗｲｱﾝﾄ･ﾊﾟﾈﾙ OnResize ｲﾍﾞﾝﾄ                                     */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnClientPanelTotalOnResize (Sender: TObject);
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

    if  (nPanelWidth <= (WIDTH_T_MINIMUM + StdCmnGridTotal.GrIndicatorWidth)) then
        exit;

    nNameWidth  := nPanelWidth - ((WIDTH_T_MINIMUM + StdCmnGridTotal.GrIndicatorWidth) - WIDTH_T_NAME);

    StdCmnGridTotalName.Width    := nNameWidth;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnKeyPress (TObject; Char)                               */
//*																									*/
//*	目的	: 部門登録処理 実在部門用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridExistOnKeyPress (Sender: TObject; var Key: Char);
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


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalOnKeyPress (TObject; Char)                               */
//*																									*/
//*	目的	: 部門登録処理 合計部門用ｸﾞﾘｯﾄﾞ OnKeyPress ｲﾍﾞﾝﾄ                                        */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridTotalOnKeyPress (Sender: TObject; var Key: Char);
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
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 部門登録処理 実在部門用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridExistCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
var
    strFormat: String;

begin
    if  (m_nCurrentCodeAttr <= 1) then
    begin
        case (m_nCurrentCodeAttr) of
            0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        end;

//<100827>↓
//        if  (AText <> '') then
//            AText   := Format (strFormat, [StrToInt64 (Trim (AText))]);
		if	(Trim(AText) <> '')
		and (StrToInt64Def(Trim (AText), -1) <> -1) then
			AText	:= Format (strFormat, [StrToInt64Def (Trim (AText), 0)]);
//<100827>↑
    end
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnStdCmnGridTotalCodeOnGetText (TObject; TdxTreeListNode; var String)     */
//*																									*/
//*	目的	: 部門登録処理 合計部門用ｸﾞﾘｯﾄﾞ[ｺｰﾄﾞ] OnGetText ｲﾍﾞﾝﾄ                                   */
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnStdCmnGridTotalCodeOnGetText (Sender: TObject; ANode: TdxTreeListNode; var AText: String);
var
    strFormat: String;

begin
    if  (m_nCurrentCodeAttr <= 1) then
    begin
        case (m_nCurrentCodeAttr) of
            0:  strFormat   := '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
            1:  strFormat   := '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
        end;

//<100827>↓
//        if  (AText <> '') then
//            AText   := Format (strFormat, [StrToInt64 (Trim (AText))]);
		if	(Trim(AText) <> '')
		and (StrToInt64Def(Trim (AText), -1) <> -1) then
			AText	:= Format (strFormat, [StrToInt64Def (Trim (AText), 0)]);
//<100827>↑
    end
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnEnter (TObject)								*/
//*																									*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnEnter ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnEnter (Sender: TObject);
begin
//<131001>↓
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
//<131001>↑

	fnCommonFunctionOnEnter02 (Sender);

	//m_fDtlChangeExCode	:= FALSE;
    end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnEnter (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnEnter ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnEnter (Sender: TObject);
begin
//<131001>↓
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
//<131001>↑

	fnCommonFunctionOnEnter02 (Sender);

	//m_fDtlChangeExCode	:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnChange (TObject)								*/
//*																									*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnChange (Sender: TObject);
begin
	// 検索エクスプローラから選択
    if SelectExp then
	begin
    	SelectExp := False;
    	exit;
    end;

	if	((not m_fChangeDetails) and (not m_fUnderConstruction) and (m_nReferMode = NORMAL)) then
		m_fChangeDetails	:= TRUE;

//	m_fDtlChangeExCode	:= TRUE;    
	NewGCode := TRUE;
	// 手入力の場合は必ず新規
//	DtlNCode := IntToStr(GetNewNCode());
	DtlNCode := '0';		// 0317

	{処理モード}
	if firstFlg = TRUE	then
    	firstFlg := FALSE
    else
    begin
		ModeBtn.Caption := '新　規';
//		ModeBtn.Font.Color := clBlack;
        fnResetDetailScreen ();
//<080214_1>↓
//		if	(DtlCmnTab.Items [0].Selected) then					// 実在
//		begin
//			// 0214 適用期間表示
//			DtlCmnEditAppDateStart.Visible := True;
//			DtlCmnEditAppDateEnd.Visible := True;
//			DtlCmnLabelAppDateTitle.Visible := True;
//			DtlCmnLabelAppDateAddtion.Visible := True;
//		end
//<080214_1>↑
    end;
	NewGCode := FALSE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnChange (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnChange (Sender: TObject);
begin
	// 検索エクスプローラから選択
	if SelectExp then
	begin
		SelectExp := False;
		exit;
	end;

	if	((not m_fChangeDetails) and (not m_fUnderConstruction) and (m_nReferMode = NORMAL)) then
		m_fChangeDetails	:= TRUE;

//	m_fDtlChangeExCode	:= TRUE; 
	NewGCode := TRUE;
	// 手入力の場合は必ず新規
//	DtlNCode := IntToStr(GetNewNCode());
	DtlNCode := '0';

	{処理モード}
	if firstFlg = TRUE	then
		firstFlg := FALSE
	else
	begin
		ModeBtn.Caption := '新　規';
//		ModeBtn.Font.Color := clBlack;
		fnResetDetailScreen ();
//<080214_1>↓
//		if	(DtlCmnTab.Items [0].Selected) then					// 実在
//		begin
//			// 0214 適用期間表示
//			DtlCmnEditAppDateStart.Visible := True;
//			DtlCmnEditAppDateEnd.Visible := True;
//			DtlCmnLabelAppDateTitle.Visible := True;
//			DtlCmnLabelAppDateAddtion.Visible := True;
//		end
//<080214_1>↑
	end;
	NewGCode := FALSE;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditNameOnKeyDown (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[正式名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditNameOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	strDuplicateDesc: String;

begin
	strDuplicateDesc	:= '';

	if	(DtlCmnEditNameSimple.Text = '') then
	begin
		if	(StrLen (PChar (DtlCmnEditName.Text)) <= 14) then
			strDuplicateDesc	:= DtlCmnEditName.Text
		else
			strDuplicateDesc	:= MJSKabuCut (DtlCmnEditName.Text, 14);
	end;

	// 050906>>
	if DspCtrlFromKey(Sender, Key, Shift) then
	begin
		if	(strDuplicateDesc <> '') then
			DtlCmnEditNameSimple.Text	:= strDuplicateDesc;
	end;
	// 050906<<
end;


// 050906>>
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.DspCtrlFromKey (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 部門登録処理 Key ｲﾍﾞﾝﾄ																		*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.DspCtrlFromKey (Sender: TObject; var Key: Word; Shift: TShiftState) : Boolean;
begin
	Result := False;

	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);

		Result := True;
	end

	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		if ((Key = VK_END) AND (Sender is TMTxtEdit) AND (not MJSChkCurEnd (Sender as TComponent))) then
    	else if ((StdCmnClientPanel.Visible) AND (CmnInstructionCombo.Visible = True)) then								//★★★ コンボ
			CmnInstructionCombo.SetFocus ()
    	else if ((DtlCmnClientPanel.Visible) AND (CmnInstructionComboDtl.Visible = True)) then								//★★★ コンボ
			CmnInstructionComboDtl.SetFocus ()
		else
        begin
        	// コンボがない場合
            if ((TComponent(Sender).Name = 'DtlCmnEditExCodeFree')				// 詳細：外部コード
             OR (TComponent(Sender).Name = 'DtlCmnEditExCodeNumeric')			// 詳細：外部コード
             OR (TComponent(Sender).Name = 'EDateStart')) then					// 一覧：適用日(自)
            begin
				Close ();
            end
//051007            else if ((TComponent(Sender).Name = 'DtlCmnButtonUpdate')			// 更新ボタン
//051007             OR (TComponent(Sender).Name = 'DtlCmnButtonCancel')) then			// 取消ボタン
//051007				// 何もしない
	    	else if StdCmnClientPanel.Visible = True then						//★★★ 一覧
				EDateStart.SetFocus ()											//★★★
			else if ((DtlCmnButtonUpdate.Enabled) AND (Key = VK_END)) then
            	DtlCmnButtonUpdate.SetFocus ()
//051007			else if ((DtlCmnButtonCancel.Enabled) AND (Key = VK_ESCAPE)) then
//051007            	DtlCmnButtonCancel.SetFocus ()
        	else if DtlCmnEditExCodeFree.Visible then								//★★★ 詳細
				DtlCmnEditExCodeFree.SetFocus ()									//★★★
	        else																	//★★★
				DtlCmnEditExCodeNumeric.SetFocus ();								//★★★

		end;
	end

	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	((Sender is TMTxtEdit) AND (Key = VK_LEFT)) then					//　050906 左のみ
		begin
//        	if ((TMTxtEdit(Sender).InputAttr = iaFree)							// 050906 文字のみ
//           or (TMTxtEdit(Sender).InputAttr = iaNone)) then					// 050906 文字のみ
//          begin
				if	(MJSChkCurTop (Sender as TComponent)) then
                begin
                	if ((TComponent(Sender).Name = DtlCmnEditExCodeFree.Name)
                    and (DtlCmnTab.Enabled)) then
                        //<008> ↓
                    	//DtlCmnTab.SetFocus()
                        abort
                        //<008> ↑
                    else
						MJSDispCtrl.MjsPrevCtrl (Self);
                end;
//          end
//          else
//          begin
//				Result := True;
//				MJSDispCtrl.MjsPrevCtrl (Self);
//          end;
		end
		else
        begin
        //<008> ↓
        {  	if ((TComponent(Sender).Name = DtlCmnEditExCodeNumeric.Name)
            and (DtlCmnTab.Enabled)) then
        }
            if ((TComponent(Sender).Name = DtlCmnEditExCodeNumeric.Name) and (DtlCmnTab.Enabled))
                or ((TComponent(Sender).Name = DtlCmnEditExCodeFree.Name) and (DtlCmnTab.Enabled)) then
               	//DtlCmnTab.SetFocus()
                abort
        //<008> ↑
            else
            begin
                //<009> ↓
                if	((StdCmnTab.Focused) or (DtlCmnTab.Focused)) then								// 一覧/詳細ﾀﾌﾞ
	            begin
                    //部門：移動せず／ｾｸﾞﾒﾝﾄ：ｺﾝﾎﾞへ移動
                    if  (ParentMasterDiv = 101) then
                        MjsDispCtrl.MjsPrevCtrl (Self);
                    Abort;
                end;
                //<009> ↑

				MJSDispCtrl.MjsPrevCtrl (Self);
            end;

            if TComponent(Sender).Name <>'DtlCmnEditName' then
				Result := True;
        end;
	end

	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		//HIS0020
		if	((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN)) then				// Altｷｰが押された時
			Exit;

		if	((Sender is TMTxtEdit) AND (Key = VK_RIGHT))then					// 050906 右のみ
		begin
//      	if ((TMTxtEdit(Sender).InputAttr = iaFree)							// 050906 文字のみ
//           or (TMTxtEdit(Sender).InputAttr = iaNone)) then					// 050906 文字のみ
//          begin
				if	(MJSChkCurEnd (Sender as TComponent)) then
				begin
					MJSDispCtrl.MjsNextCtrl (Self);
					Result := True;
				end;
//			end
//          else
//          begin
//				MJSDispCtrl.MjsNextCtrl (Self);
//				Result := True;
//          end;
		end
		else
		begin
			MJSDispCtrl.MjsNextCtrl (Self);
			Result := True;
		end;
	end;
end;
// 050906<<


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditNameSimpleOnEnter (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnEnter ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditNameSimpleOnEnter (Sender: TObject);
var
	stMessageRec : TMJSMsgRec;

begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);

	//CmnStatusBar.SimpleText	:= stMessageRec.sMsg;
//<100906>↓
//	FFunctionBar.SetFuncCaption (8, stMessageRec.sMsg);
//	FFunctionBar.SetFuncEnabled (8, True) ;
	m_arFunction[7]	:= stMessageRec.sMsg;
	FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
	FFunctionBar.Enabled	:= True;
//<110131_3>↑

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditNameSimpleOnExit (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[簡略名称] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditNameSimpleOnExit (Sender: TObject);
begin
	//CmnStatusBar.SimpleText	:= '';
//<100906>↓
//	FFunctionBar.SetFuncCaption (8, '');
//	FFunctionBar.SetFuncEnabled (8, False) ;
	m_arFunction[7]	:= '';
	FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
	FFunctionBar.Enabled	:= True;
//<110131_3>↑

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditAppDateOnKeyDown (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 部門登録処理 日付ｴﾃﾞｨｯﾄ[適用開始(終了)期間] OnKeyDown ｲﾍﾞﾝﾄ									*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditAppDateOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	cDateEdit	  : TMDateEdit;
	nCheckDivision: Integer;

begin
	if	(DtlCmnEditAppDateStart.Focused) then
	begin
		cDateEdit		:= DtlCmnEditAppDateStart;
		nCheckDivision	:= 2;
	end
	else
	begin
		cDateEdit		:= DtlCmnEditAppDateEnd;
		nCheckDivision	:= 3;
	end;

	if	(Key = VK_RETURN) then
	begin
		if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
		begin
			m_cACControl	:= cDateEdit;
			m_cACControl.SetFocus ();

			Abort;
		end;

		MjsDispCtrl.MjsNextCtrl (Self);

		Exit;
	end;

	if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
		begin
			m_cACControl	:= cDateEdit;
			m_cACControl.SetFocus ();

			Abort;
		end;

		//DtlCmnButtonUpdate.SetFocus ();
		if ((DtlCmnButtonUpdate.Enabled) AND (Key = VK_END)) then
           	DtlCmnButtonUpdate.SetFocus ()
		else if ((DtlCmnButtonCancel.Enabled) AND (Key = VK_ESCAPE)) then
           	DtlCmnButtonCancel.SetFocus ()
        else if DtlCmnEditExCodeFree.Visible then
			DtlCmnEditExCodeFree.SetFocus ()
   	    else
			DtlCmnEditExCodeNumeric.SetFocus ();

		Exit;
	end;

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
			begin
				if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
				begin
					m_cACControl	:= cDateEdit;
					m_cACControl.SetFocus ();

					Abort;
				end;

				MJSDispCtrl.MjsPrevCtrl (Self);
			end;
		end
		else
		begin
			if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
			begin
				m_cACControl	:= cDateEdit;
				m_cACControl.SetFocus ();

				Abort;
			end;

			MJSDispCtrl.MjsPrevCtrl (Self);
		end;

		Exit;
	end;

	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
			begin
				if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
				begin
					m_cACControl	:= cDateEdit;
					m_cACControl.SetFocus ();

					Abort;
				end;

				MJSDispCtrl.MjsNextCtrl (Self);
			end;
		end
		else
		begin
			if	(not fnCheckCommonDetailScreenValue	(nCheckDivision)) then
			begin
				m_cACControl	:= cDateEdit;
				m_cACControl.SetFocus ();

				Abort;
			end;

			MJSDispCtrl.MjsNextCtrl (Self);
		end;

		Exit;
	end;

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnButtonUpdateOnClick (TObject)												*/
//*																											*/
//*	目的	: 部門登録処理 更新ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnButtonUpdateOnClick (Sender: TObject);
begin
	//--- HIS0027 St -----
{
    if fnHaitaCheck() = 99 then
    begin
        if fnResetDetailScreen() then
        begin
            DtlCmnEditExCodeNumeric.Value       := 0;
            DtlCmnEditExCodeNumeric.InputFlag   := True;
            DtlCmnEditExCodeFree.Text           := '';
        end;

        m_fChangeDetails    := False;

        if	(m_nCurrentCodeAttr <= 1) then
			DtlCmnEditExCodeNumeric.SetFocus
		else
			DtlCmnEditExCodeFree.SetFocus;

        abort;
    end;
}
    //--- HIS0027 Ed -----

	if	(not fnUpdateDetailsScreenRecord ()) then
		Exit;

//	DtlNCode := IntToStr(GetNewNCode());	// 0207 新規データ入力
	DtlNCode := '0';						// 0317
	fnResetDetailScreen		 ();				// 0207 新規データ入力

	// 外部コード消去>>
	if	(m_nCurrentCodeAttr <= 1) then
	begin
		DtlCmnEditExCodeNumeric.Enabled	:= TRUE;
		DtlCmnEditExCodeNumeric.Color	:= clWindow;
	end
	else
	begin
		DtlCmnEditExCodeFree.Enabled	:= TRUE;
		DtlCmnEditExCodeFree.Color		:= clWindow;
	end;

	DtlCmnEditExCodeNumeric.Value		:= 0;
	DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
	DtlCmnEditExCodeFree   .Text		:= '';
	// 外部コード消去<<

//	fnShowDetailScreen ();						// 0207 新規データ入力

	if	(m_nCurrentCodeAttr <= 1) then
	begin
		if	(DtlCmnEditExCodeNumeric.ReadOnly) then
			m_cACControl	:= DtlCmnEditAssociation
		else
			m_cACControl	:= DtlCmnEditExCodeNumeric
	end
	else
	begin
		if	(DtlCmnEditExCodeFree.ReadOnly) then
			m_cACControl	:= DtlCmnEditAssociation
		else
			m_cACControl	:= DtlCmnEditExCodeFree;
	end;

	fnEnableToolbarButtonTag (TRUE);
	fnSetDeleteButtonCondition();
	fnEnableToolbarButtonTag (FALSE);

	m_fChangeDetails	:= FALSE;

	m_cACControl.SetFocus ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnButtonCancelOnClick (TObject)												*/
//*																											*/
//*	目的	: 部門登録処理 取消ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnButtonCancelOnClick (Sender: TObject);
var
	nReturn: Integer;

begin
// <016> MOD start
(*
    ///<006> ↓
    if  ((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
        and (DtlCmnEditExCodeNumeric.Visible))
        or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
    begin
    //<006> ↑
*)
	if ((not DtlCmnEditExCodeNumeric.InputFlag) and (DtlCmnEditExCodeNumeric.Visible)) or
       ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
    begin
// <016> MOD end

        nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	    if	(nReturn = CONFIRM_THROUGH) then
	    begin
//		    fnCleanupTreeViewNewItem (True);
//		    DtlNCode := IntToStr(GetNewNCode());	// 0207 新規データ入力
		    DtlNCode := '0';						// 0317
		    fnResetDetailScreen		 ();

		    // 外部コード消去>>
		    if	(m_nCurrentCodeAttr <= 1) then
		    begin
			    DtlCmnEditExCodeNumeric.Enabled	:= TRUE;
			    DtlCmnEditExCodeNumeric.Color	:= clWindow;
		    end
		    else
		    begin
			    DtlCmnEditExCodeFree.Enabled	:= TRUE;
			    DtlCmnEditExCodeFree.Color		:= clWindow;
		    end;

		    DtlCmnEditExCodeNumeric.Value		:= 0;
		    DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
		    DtlCmnEditExCodeFree   .Text		:= '';
		    // 外部コード消去<<

//		fnCmnToolbarButtonDetailOnClick(Sender);
{★★★
		if	(m_nCurrentCodeAttr <= 1) then
			m_cACControl	:= DtlCmnEditExCodeNumeric
		else
			m_cACControl	:= DtlCmnEditExCodeFree;

		m_cACControl.SetFocus ();
★★★}
		m_fChangeDetails	:= FALSE;
        UpdFreeFlg			:= FALSE;

	    end
        else
        begin
		    if	(m_nCurrentCodeAttr <= 1) then
				m_cACControl	:= DtlCmnEditExCodeNumeric
		    else
			    m_cACControl	:= DtlCmnEditExCodeFree;

		    m_cACControl.SetFocus ();

	    end;
    end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetGridMemDataRecords ()														*/
//*																											*/
//*	目的	: 部門登録処理 実在/合計部門ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ													*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnSetGridMemDataRecords ();
var
	dqMasterTree: TMQuery;
    dqMasterData: TMQuery;

begin
	dqMasterTree	:= TMQuery.Create (Self);		// 050606
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

{★★★削除予定？
	if	(CompareStr (m_strExCodeCurrent, '          ') = 0) then
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT hm.SumKbn, hm.GCode, hm.NCode, hm.RenChar, ');
			SQL.Add   ('       hm.LongName, hm.SimpleName, hm.HojyoKbn2, fi.FusenKbn, fi.FusenCmnt ');
    		SQL.Add   ('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add   ('ON     fi.MasterKbn = hm.MasterKbn AND fi.HojyoCode = hm.GCode ');
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision AND hm.RecordKbn = 0 AND hm.SumKbn <> 0 ');
			SQL.Add   ('ORDER BY hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

			Open ();

			while (not EOF) do
			begin
				with (dqMasterTree) do
				begin
					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT SumCode FROM HojyoTree ');
					SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BasedCode = :strExCodeBase');

					ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					ParamByName ('strExCodeBase'  ).AsString	:= dqMasterData.FieldByName('GCode').AsString;

					Open ();

					if	(EOF) then
						fAddItem	:= TRUE
					else
						fAddItem	:= FALSE;
				end;
				if	(fAddItem) then
					fnSetGridMemDataEx (FieldByName('SumKbn'    ).AsInteger,
										FieldByName('GCode'     ).AsString,
										FieldByName('NCode'     ).AsInteger,
										FieldByName('RenChar'   ).AsString,
										FieldByName('LongName'  ).AsString,
										FieldByName('SimpleName').AsString,
										FieldByName('HojyoKbn2' ).AsInteger,
										FieldByName('FusenKbn'  ).AsInteger,
										FieldByName('FusenCmnt' ).AsString);

				NEXT;
			end;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT hm.SumKbn, hm.GCode, hm.NCode, hm.RenChar, ');
			SQL.Add   ('       hm.LongName, hm.SimpleName, hm.HojyoKbn2, fi.FusenKbn, fi.FusenCmnt ');
    		SQL.Add   ('FROM   HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add   ('ON     fi.MasterKbn = hm.MasterKbn AND fi.HojyoCode = hm.GCode ');
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision AND hm.RecordKbn = 0 AND hm.SumKbn = 0 ');
			SQL.Add   ('ORDER BY hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

			Open ();

			while (not EOF) do
			begin
				with (dqMasterTree) do
				begin
					nCount	:= 0;

					Close ();

					SQL.Clear ();
					SQL.Add   ('SELECT SumCode FROM HojyoTree ');
					SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BasedCode = :strExCodeBase');

					ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					ParamByName ('strExCodeBase'  ).AsString	:= dqMasterData.FieldByName('GCode').AsString;

					Open ();

					while (not EOF) do
					begin
						strExCodeSum	:= FieldByName('SumCode').AsString;
						nCount			:= nCount + 1;

						NEXT;
					end;

					if	((nCount = 1) and (CompareStr (strExCodeSum, m_strExCodeTotal) = 0)) then
						fAddItem	:= TRUE
					else
						fAddItem	:= FALSE;
				end;
				if	(fAddItem) then
					fnSetGridMemDataEx (FieldByName('SumKbn'    ).AsInteger,
										FieldByName('GCode'     ).AsString,
										FieldByName('NCode'     ).AsInteger,
										FieldByName('RenChar'   ).AsString,
										FieldByName('LongName'  ).AsString,
										FieldByName('SimpleName').AsString,
										FieldByName('HojyoKbn2' ).AsInteger,
										FieldByName('FusenKbn'  ).AsInteger,
										FieldByName('FusenCmnt' ).AsString);

				NEXT;
			end;
		end;
	end
	else
	begin
★★★削除予定？}
	    with (dqMasterData) do
	    begin
			Close ();

			SQL.Clear ();
{★★★
			SQL.Add   ('SELECT ht.BasedCode, hm.SumKbn,     hm.NCode,     hm.RenChar, ');
			SQL.Add   ('       hm.LongName,  hm.SimpleName, hm.HojyoKbn1, hm.HojyoKbn2,');
			SQL.Add	  ('       fi.FusenKbn,  fi.FusenCmnt ');
			SQL.Add   ('FROM   HojyoTree ht, HojyoMA hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add   ('ON     fi.MasterKbn = hm.MasterKbn AND fi.HojyoCode = hm.GCode ');
			SQL.Add   ('WHERE  ht.MasterKbn = :nMasterDivision AND ht.SumCode = :strExCode ');
			SQL.Add   ('AND    ht.MasterKbn = hm.MasterKbn AND ');
			SQL.Add   ('       hm.RecordKbn = 0 AND ht.BasedCode = hm.GCode ');
★★★}

//▼▼▼▼▼
			// ◆◇◆　諸口区分取得
			SQL.Add   ('SELECT hm.GCode, hm.SumKbn, hm.NCode, hm.Renso, hm.SyokuchiKbn,');
			SQL.Add   ('       hm.LongName,  hm.SimpleName, hm.HojyoKbn1, hm.HojyoKbn2,');
//<100215_1>↓
			SQL.Add   ('       hm.TStartDate, hm.TEndDate,');
//<100215_1>↑
			SQL.Add	  ('       fi.FusenKbn,  fi.FusenCmnt ');
			SQL.Add   ('FROM   ' + DEF_HOJYOMA + ' hm LEFT OUTER JOIN MFusenInfo fi ');
			SQL.Add   ('ON     fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode ');
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision ');
			SQL.Add   ('AND    hm.RDelKbn = 0 ');

//<090721_1>↓
//			SQL.Add   ('AND    (((hm.TEndDate   >= :SDate)');
//			SQL.Add   (' AND     (hm.TStartDate <= :EDate))');
//			SQL.Add   (' OR     ((hm.TStartDate is null)AND(hm.TEndDate is null)))');
			if ((EDateStart.Value <> 0) and (EDateStart.Value <> NULL))
			or ((EDateEnd.Value <> 0) and (EDateEnd.Value <> NULL)) then
			begin
				SQL.Add   ('AND    ((');

				if ((EDateStart.Value <> 0) and (EDateStart.Value <> NULL)) then
					SQL.Add   ('         (hm.TEndDate   >= :SDate)');

				if  ((EDateStart.Value <> 0) and (EDateStart.Value <> NULL))
				and ((EDateEnd.Value <> 0) and (EDateEnd.Value <> NULL)) then
					SQL.Add   (' AND ');

				if ((EDateEnd.Value <> 0) and (EDateEnd.Value <> NULL)) then
					SQL.Add   ('         (hm.TStartDate <= :EDate)');

				SQL.Add   (') OR ((hm.TStartDate is null)AND(hm.TEndDate is null)))');
			end;
//<090721_1>↑


//▲▲▲▲▲
//------------------------------------------------------------------------------HIS0017Start
//			if m_strExCodeTotal = m_strExCodeCurrent then
//				SQL.Add('ORDER BY hm.GCode ')
//			else
				SQL.Add('ORDER BY hm.GCode');		//★★★？
//★★★				SQL.Add('ORDER BY ht.EntNo');
//------------------------------------------------------------------------------HIS0017End

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

//<090721_1>↓
//			if ((EDateStart.Value = 0) or (EDateStart.Value = NULL)) then
//				ParamByName ('SDate').AsDateTime			:= DEF_S_DATE
//			else
//				ParamByName ('SDate').AsDateTime			:= EDateStart.AsDateTime;
//			if ((EDateEnd.Value = 0) or (EDateEnd.Value = NULL)) then
//				ParamByName ('EDate').AsDateTime			:= DEF_E_DATE
//			else
//				ParamByName ('EDate').AsDateTime			:= EDateEnd.AsDateTime;
			if ((EDateStart.Value <> 0) and (EDateStart.Value <> NULL)) then
				ParamByName ('SDate').AsDateTime			:= EDateStart.AsDateTime;
			if ((EDateEnd.Value <> 0) and (EDateEnd.Value <> NULL)) then
				ParamByName ('EDate').AsDateTime			:= EDateEnd.AsDateTime;
//<090721_1>↑

//			ParamByName ('strExCode'      ).AsString	:= m_strExCodeCurrent;

			Open ();

			while (not EOF) do
			begin
				fnSetGridMemData (dqMasterData);
				NEXT;
			end;

			Close ();
	    end;
{★★★削除予定？
	end;
★★★削除予定？}

	dqMasterTree.Close ();
	dqMasterData.Close ();
	dqMasterTree.Free  ();
	dqMasterData.Free  ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetGridMemData (TMQuery)														*/
//*																											*/
//*	目的	: 部門登録処理 実在/合計部門ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ													*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 部門基本ﾏｽﾀ用ｸｴﾘｰ																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnSetGridMemData (dqMasterData: TMQuery);
begin
	with (dqMasterData) do
	begin
//▼▼▼▼▼
		// ◆◇◆　諸口の内部コードを書いておく
		if FieldByName('SyokuchiKbn').AsInteger = 1 then
//<100215_1>↓
//	        Label3.Caption := FieldByName('NCode'     ).AsString;
			m_SyokuchiNCd := FieldByName('NCode').AsString;
//<100215_1>↑

//<100217>↓
		// 総合計の内部コードを保持する
		if FieldByName('SumKbn').AsInteger = 9 then
			m_TotalNCd := FieldByName('NCode').AsString;
//<100217>↑

		fnSetGridMemDataEx (FieldByName('SumKbn'    ).AsInteger,
							FieldByName('GCode'     ).AsString,
							FieldByName('NCode'     ).AsString,
							FieldByName('Renso'     ).AsString,
							FieldByName('LongName'  ).AsString,
							FieldByName('SimpleName').AsString,
							FieldByName('HojyoKbn2' ).AsInteger,
//<100215_1>↓
							FieldByName('TStartDate').AsDateTime,
							FieldByName('TEndDate' ).AsDateTime,
//<100215_1>↑
							FieldByName('FusenKbn'  ).AsInteger,
							FieldByName('FusenCmnt' ).AsString);
//▲▲▲▲▲
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetGridMemDataEx (Integer; String; Integer; Sring; String; String...)			*/
//*																											*/
//*	目的	: 部門登録処理 実在/合計部門ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ													*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision		= 実在/合計区分																*/
//*			  strExCode			= 部門外部ｺｰﾄﾞ																*/
//*			  nInCode			= 部門内部ｺｰﾄﾞ																*/
//*			  strAssociation	= 連想																		*/
//*			  strName			= 正式名称																	*/
//*			  strNameSimple		= 簡略名称																	*/
//*			  nAdoptDivision	= 部門採用区分																*/
//*			  nTagDivision		= 付箋区分																	*/
//*			  strComment		= 付箋備考																	*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnSetGridMemDataEx (nSumDivision: Integer; strExCode: String; strInCode: String;
											strAssociation: String; strName: String; strNameSimple: String;
											nAdoptDivision: Integer;
//<100215_1>↓
											dtStart: TDateTime; dtEnd: TDateTime;
//<100215_1>↑
											nTagDivision: Integer; strComment: String);
var
	strFormat: String;

begin
	m_fUpdateRecord	:= FALSE;

	if  (m_nCurrentCodeAttr <= 1) then
	begin
		case (m_nCurrentCodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
		end;

		strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
    end;

	if  (nSumDivision = 0) then
	begin
		StdCmnMemDataExist.Append ();

		StdCmnMemDataExist.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap (nTagDivision));
		StdCmnMemDataExist.FieldByName('strExCode'     ).AsString	:= strExCode;
		StdCmnMemDataExist.FieldByName('strAssociation').AsString	:= strAssociation;
		StdCmnMemDataExist.FieldByName('strName'       ).AsString	:= strName;
		StdCmnMemDataExist.FieldByName('strNameSimple' ).AsString	:= strNameSimple;
		StdCmnMemDataExist.FieldByName('strComment'    ).AsString	:= strComment;
		StdCmnMemDataExist.FieldByName('nInCode'       ).AsString	:= strInCode;
//<100215_1>↓
		if dtStart <> DEF_S_DATE then
			StdCmnMemDataExist.FieldByName('dtStartDate').AsDateTime	:= dtStart
		else
			StdCmnMemDataExist.FieldByName('dtStartDate').Clear;
		if	dtEnd <> DEF_E_DATE then
			StdCmnMemDataExist.FieldByName('dtEndDate').AsDateTime		:= dtEnd
		else
			StdCmnMemDataExist.FieldByName('dtEndDate').Clear;
//<100215_1>↑

		if	(m_nCurrentAdoptDiv = 1) then												// 部門採用区分: 1=P/Lのみ採用
		begin
			//if	(nInCode = 0) then													// ◆◇◆諸口だったら
//<100215_1>↓
//			if	(strInCode = Label3.Caption) then										// ◆◇◆諸口だったら
			if	(strInCode = m_SyokuchiNCd) then										// ◆◇◆諸口だったら
//<100215_1>↑
				StdCmnMemDataExist.FieldByName('nAdoptData01').AsInteger	:= 1
			else
				StdCmnMemDataExist.FieldByName('nAdoptData01').AsInteger	:= 0;
		end
		else
			StdCmnMemDataExist.FieldByName('nAdoptData01').AsInteger	:= nAdoptDivision;

		StdCmnMemDataExist.Post ();

		m_nGridExistRecords	:= m_nGridExistRecords + 1;
	end
	else
	begin
		// SumKbn=1の総合計ができてしまう対応 050907 >>
		// 総合計の場合
		if  (nSumDivision = 9) then
		begin
			if  (m_nCurrentCodeAttr <= 1) then
				m_strExCodeTotal	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))])
			else
				m_strExCodeTotal	:= strExCode;
	    end;
		// SumKbn=1の総合計ができてしまう対応 050907 <<

		StdCmnMemDataTotal.Append ();

		StdCmnMemDataTotal.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap (nTagDivision));
		StdCmnMemDataTotal.FieldByName('strExCode'     ).AsString  := strExCode;
		StdCmnMemDataTotal.FieldByName('strAssociation').AsString  := strAssociation;
		StdCmnMemDataTotal.FieldByName('strName'       ).AsString  := strName;
		StdCmnMemDataTotal.FieldByName('strNameSimple' ).AsString  := strNameSimple;
		StdCmnMemDataTotal.FieldByName('strComment'    ).AsString	:= strComment;
		StdCmnMemDataTotal.FieldByName('nInCode'       ).AsString	:= strInCode;
//<100215_1>↓
		if dtStart <> DEF_S_DATE then
			StdCmnMemDataTotal.FieldByName('dtStartDate').AsDateTime	:= dtStart
		else
			StdCmnMemDataTotal.FieldByName('dtStartDate').Clear;
		if	dtEnd <> DEF_E_DATE then
			StdCmnMemDataTotal.FieldByName('dtEndDate').AsDateTime		:= dtEnd
		else
			StdCmnMemDataTotal.FieldByName('dtEndDate').Clear;
//<100215_1>↑

		StdCmnMemDataTotal.Post ();

		m_nGridTotalRecords	:= m_nGridTotalRecords + 1;
	end;

	m_fUpdateRecord	:= TRUE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnSetParentItemsInfo ()													*/
//*																									*/
//*	目的	: 部門登録処理 グリッドにデータを設定等													*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnSetParentItemsInfo ();
begin
	StdCmnMemDataExist.Active	:= FALSE;
	StdCmnMemDataTotal.Active	:= FALSE;
	StdCmnMemDataExist.Active	:= TRUE;
	StdCmnMemDataTotal.Active	:= TRUE;

	StdCmnMemDataClass.Open;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

	StdCmnGridTotal.BeginUpdate;
 	StdCmnGridExist.BeginUpdate;

	fnSetGridMemDataRecords ();													// グリッドにデータを設定

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	StdCmnGridTotal.EndUpdate;
	StdCmnGridExist.EndUpdate;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetDetailScreenInfo (String; var Integer)										*/
//*																											*/
//*	目的	: 部門登録処理 詳細情報を画面にｾｯﾄ																*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:新規ﾚｺｰﾄﾞ, FALSE:既存ﾚｺｰﾄﾞ)						                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門内部ｺｰﾄﾞ！																	*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnSetDetailScreenInfo (strExCode: String; var nSumDivision: Integer): Boolean;
var
	dqMasterData : TMQuery;
	fNewRecord	 : Boolean;
	strWorkExCode: String;
	strWorkName  : String;
    i			 : Integer;
    StrTmp		 : String;
//	lvBit		 : TBitMap;
begin
	fNewRecord	:= TRUE;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= fNewRecord;
		Exit;
	end;

	fnInitializeDetailScreen (FALSE);

	dqMasterData    := TMQuery.Create (Self);		// 050606

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
//▼▼▼▼▼
		SQL.Add ('SELECT hm.SumKbn,      hm.GCode,       hm.Renso,       hm.LongName,    hm.SimpleName,  hm.NCode,  hm.HojyoKbn1, hm.HojyoKbn2, ');
		SQL.Add ('       hm.BunCode,     hm.TStartDate,  hm.TEndDate,    hm.BSBumonNCode,fi.FusenKbn,    fi.FusenCmnt, ');
		SQL.Add ('       hm.BunruiNCode1, hm.BunruiNCode2, hm.BunruiNCode3, hm.BunruiNCode4, hm.BunruiNCode5, ');
		SQL.Add ('       hm.BunruiNCode6, hm.BunruiNCode7, hm.BunruiNCode8, hm.BunruiNCode9, hm.BunruiNCode10, ');
		SQL.Add ('       hm.SegNCode1,   hm.SegNCode2,   hm.SegNCode3,   hm.SegNCode4,   hm.SegNCode5, ');
		SQL.Add ('       hm.SegNCode6,   hm.SegNCode7,   hm.SegNCode8,   hm.SegNCode9,   hm.SegNCode10 ');
		SQL.Add ('FROM   ' + DEF_HOJYOMA + ' hm LEFT OUTER JOIN MFusenInfo fi ');
		SQL.Add ('ON     fi.MasterKbn = hm.MasterKbn and fi.NCode = hm.NCode ');
		SQL.Add ('WHERE  hm.MasterKbn = :nMasterDivision and hm.RDelKbn = 0 and hm.NCode = :strExCode');
//▲▲▲▲▲

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if  (not EOF) then
		begin
			strWorkName	:= '';

			if  (m_nCurrentCodeAttr <= 1) then
			begin
				DtlCmnEditExCodeNumeric.Value		:= StrToInt64 (Trim (FieldByName('GCode').AsString));
				DtlCmnEditExCodeNumeric.InputFlag	:= FALSE;

				if	((FieldByName('BSBumonNCode').IsNull) or (FieldByName('BSBumonNCode').AsString = '')) then
				begin
					DtlCmnEditExCodeBSAddNumeric.Value		:= 0;
					DtlCmnEditExCodeBSAddNumeric.InputFlag	:= TRUE;
				end
				else
				begin
					{0318
					DtlCmnEditExCodeBSAddNumeric.Value		:= StrToInt64 (Trim (FieldByName('BSBumonNCode').AsString));
					DtlCmnEditExCodeBSAddNumeric.InputFlag	:= FALSE;

					strWorkExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeBSAddNumeric.Value)]);

					fnCheckRegistBSAddDepartment (strWorkExCode, strWorkName, strWorkInCode);
					}
					DtlCmnLabelNCodeBSAdd.Caption	:= FieldByName('BSBumonNCode').AsString;
					if fnCheckRegistBSAddDepartment2 (DtlCmnLabelNCodeBSAdd.Caption, strWorkName, strWorkExCode) then
                    begin
						DtlCmnEditExCodeBSAddNumeric.Value		:= StrToInt64 (Trim (strWorkExCode));
						DtlCmnEditExCodeBSAddNumeric.InputFlag	:= FALSE;
                    end
                    else
                    begin
						DtlCmnEditExCodeBSAddNumeric.Value		:= 0;
						DtlCmnEditExCodeBSAddNumeric.InputFlag	:= TRUE;
                    end;
				end;
			end
			else
			begin
				DtlCmnEditExCodeFree.Text	:= FieldByName('GCode').AsString;

				if	(FieldByName('BSBumonNCode').IsNull) then
					DtlCmnEditExCodeBSAddFree.Text	:= ''
				else
				begin
                	{0318
					DtlCmnEditExCodeBSAddFree.Text	:= FieldByName('BSBumonNCode').AsString;

					fnCheckRegistBSAddDepartment (DtlCmnEditExCodeBSAddFree.Text, strWorkName, strWorkInCode);
                    }
					DtlCmnLabelNCodeBSAdd.Caption	:= FieldByName('BSBumonNCode').AsString;
					if fnCheckRegistBSAddDepartment2 (DtlCmnLabelNCodeBSAdd.Caption, strWorkName, strWorkExCode) then
					begin
						DtlCmnEditExCodeBSAddFree.Text	:= strWorkExCode;
                    end
                    else
                    begin
						DtlCmnEditExCodeBSAddFree.Text	:= ''
                    end;
				end;
			end;
			DtlCmnLabelExCodeBSAddDesc   .Caption	:= strWorkName;

			// ◆◇◆　諸口
			//if	((not FieldByName('NCode').IsNull) and (FieldByName('NCode').AsInteger = 0)) then
//<100215_1>↓
//			if	((not FieldByName('NCode').IsNull) and (FieldByName('NCode').AsInteger = StrToInt64(Label3.Caption))) then
			if	((not FieldByName('NCode').IsNull) and (FieldByName('NCode').AsInteger = StrToInt64(m_SyokuchiNCd))) then
//<100215_1>↑
				nSumDivision	:= DIVISION_GENERAL
			else
				nSumDivision	:= FieldByName('SumKbn').AsInteger;

			DtlCmnEditSumDivision        .Value		:= nSumDivision;
			DtlCmnEditAssociation        .Text		:= FieldByName('Renso'   ).AsString;
			DtlCmnEditName               .Text		:= FieldByName('LongName'  ).AsString;
			DtlCmnEditNameSimple         .Text		:= FieldByName('SimpleName').AsString;
			if ((not FieldByName('HojyoKbn1').IsNull) and (FieldByName('HojyoKbn1').AsString <> '')) then
            begin
				DtlCmnEditCharacterCode.Value		:= FieldByName('HojyoKbn1' ).AsInteger;	// 部門性格ｺｰﾄﾞ
				DtlCmnEditCharacterCode.InputFlag	:= FALSE;
			end
			else
            begin
				DtlCmnEditCharacterCode.Value		:= 0;										// 部門性格ｺｰﾄﾞ
				DtlCmnEditCharacterCode.InputFlag	:= FALSE;
			end;
			if ((not FieldByName('BunCode').IsNull) and (FieldByName('BunCode').AsString <> '')) then
            begin
				DtlCmnEditCommonStockDivision.Value		:= FieldByName('BunCode'   ).AsInteger;	// 共通仕入部門区分
				DtlCmnEditCommonStockDivision.InputFlag	:= FALSE;
			end
			else
            begin
				DtlCmnEditCommonStockDivision.Value		:= 0;										// 共通仕入部門区分
				DtlCmnEditCommonStockDivision.InputFlag	:= FALSE;
			end;

//			if	(m_nCurrentAdoptDiv <> 1) then
				DtlCmnEditClassCode.Value		:= FieldByName('HojyoKbn2').AsInteger;		// 部門分類ｺｰﾄﾞ
				DtlCmnEditClassCode.InputFlag	:= FALSE;

			if FieldByName('TStartDate').AsDateTime = DEF_S_DATE then
				DtlCmnEditAppDateStart.Value := 0
            else
				DtlCmnEditAppDateStart.AsDateTime	:= FieldByName('TStartDate').AsDateTime;	// 適用開始年月日
			if FieldByName('TEndDate').AsDateTime = DEF_E_DATE then
				DtlCmnEditAppDateEnd.Value := 0
            else
				DtlCmnEditAppDateEnd  .AsDateTime	:= FieldByName('TEndDate'  ).AsDateTime;	// 適用終了年月日
            //DefDateS := DtlCmnEditAppDateStart.AsDateTime;
            //DefDateE := DtlCmnEditAppDateEnd.AsDateTime;

			//◆◆◆DtlCmnEditHonsitenCodeNumeric.Value	:= FieldByName('?????').AsInteger;			// 本支店コード
			DtlCmnEditHonsitenCodeNumeric.Value	:= 0;			//◆◆◆ 本支店コード
			DtlCmnEditHonsitenCodeNumeric.InputFlag	:= FALSE;
			//◆◆◆DtlCmnEditDfKeihiCode.Value		:= FieldByName('?????').AsInteger;				// 標準経費ｺｰﾄﾞ
			DtlCmnEditDfKeihiCode.Value		:= 0;				// ◆◆◆標準経費ｺｰﾄﾞ
			DtlCmnEditDfKeihiCode.InputFlag	:= FALSE;

            DtlNCode := FieldByName('NCode').AsString;
			//▼▼▼▼▼
            for i := 1 to 10 do
            begin
				{BI分類コードはじめ}
            	StrTmp := 'BunruiNCode' + IntToStr(i);
	            if ((FieldByName(StrTmp).IsNull) or (FieldByName(StrTmp).AsString = '')) then
				begin
                    DtlBunruiNCode[i]				:= '';						// 内部コード
					DtlCmnEditBunruiCD[i].Text		:= '';						// 外部コード
					DtlCmnEditBunruiCD[i].InputFlag	:= TRUE;					// 未入力
                    DtlLabelBunruiTx[i].Caption		:= '';						// 名称
				end
        	    else
				begin
					if fnCheckRegistBunruiCd2 (FieldByName(StrTmp).AsString, (BunruiMKbn + i), strWorkName, strWorkExCode) then
                    begin
	                    DtlBunruiNCode[i]				:= FieldByName(StrTmp).AsString;	// 内部コード
						DtlCmnEditBunruiCD[i].InputFlag	:= FALSE;				// 入力済み
						DtlCmnEditBunruiCD[i].Text		:= strWorkExCode;		// 外部コード
                        DtlLabelBunruiTx[i].Caption		:= strWorkName;			// 名称
                    end
                    else
                    begin
	                    DtlBunruiNCode[i]				:= '';					// 内部コード
						DtlCmnEditBunruiCD[i].Text		:= '';					// 外部コード
						DtlCmnEditBunruiCD[i].InputFlag	:= TRUE;				// 未入力
            	        DtlLabelBunruiTx[i].Caption		:= '';					// 名称
                    end;

				end;
				{セグメントコードはじめ}
            	StrTmp := 'SegNCode' + IntToStr(i);
	            if ((FieldByName(StrTmp).IsNull) or (FieldByName(StrTmp).AsString = '')) then
				begin
                    DtlSegNCode[i]					:= '';						// 内部コード
					DtlCmnEditSegCD[i].Text		:= '';						// 外部コード
					DtlCmnEditSegCD[i].InputFlag	:= TRUE;					// 未入力
                    DtlLabelSegTx[i].Caption		:= '';						// 名称
				end
        	    else
				begin
					if fnCheckRegistSegCd2 (FieldByName(StrTmp).AsString, (MK_SEG01 + i - 1), strWorkName, strWorkExCode) then
                    begin
	                    DtlSegNCode[i]					:= FieldByName(StrTmp).AsString;	// 内部コード
						DtlCmnEditSegCD[i].InputFlag	:= FALSE;				// 入力済み
						DtlCmnEditSegCD[i].Text		:= strWorkExCode;			// 外部コード
                        DtlLabelSegTx[i].Caption		:= strWorkName;			// 名称
                    end
                    else
                    begin
	                    DtlSegNCode[i]					:= '';					// 内部コード
						DtlCmnEditSegCD[i].Text		:= '';					// 外部コード
						DtlCmnEditSegCD[i].InputFlag	:= TRUE;				// 未入力
            	        DtlLabelSegTx[i].Caption		:= '';					// 名称
                    end;

				end;
			end;
			//▲▲▲▲▲
			if	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then			// 実在部門のみ
			begin
				fnChangeComponentState (nSumDivision, TRUE);

				if	(Trunc (DtlCmnEditClassCode.Value) = 0) then
				begin
					fnChangeEditComponentState (TRUE);
				end
				else
				begin
					fnChangeEditComponentState (FALSE);

					DtlCmnEditExCodeBSAddNumeric.Value		:= 0;
					DtlCmnEditExCodeBSAddFree   .Text		:= '';
					DtlCmnLabelExCodeBSAddDesc  .Caption	:= '';
					DtlCmnLabelNCodeBSAdd		.Caption	:= '';
				end;

				DtlCmnLabelClassDesc      .Caption	:= fnGetClassDescription     (GetFld ('HojyoKbn2').AsInteger, DESCRIPTION_FULL);
				if DtlCmnEditCharacterCode.InputFlag	= FALSE then
					DtlCmnLabelCharacterDesc  .Caption	:= fnGetCharacterDescription (GetFld ('HojyoKbn1').AsInteger, DESCRIPTION_FULL);
				if DtlCmnEditCommonStockDivision.InputFlag	= FALSE then
					DtlCmnLabelCommonStockDesc.Caption	:= fnGetCmnStockDescription  (GetFld ('BunCode'  ).AsInteger, DESCRIPTION_FULL);
			end
			else
				fnDisableDetailScreen (nSumDivision);

			m_nSelectTagKind	:= FieldByName('FusenKbn').AsInteger;

{0624
			case (m_nSelectTagKind) of
				0:	DtlCmnImageTag.Picture	:= nil;
				1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
				2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
				3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
				4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
			end;
}
//0624>>
			case (m_nSelectTagKind) of
				0:	DtlCmnImageTag.Picture	:= nil;
				1:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag01.Bitmap);
				2:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag03.Bitmap);
				3:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag02.Bitmap);
				4:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag04.Bitmap);
			end;
//0624<<

			ScrollBox3.VertScrollBar.Position := 0;
			ScrollBox4.VertScrollBar.Position := 0;

			if	((nSumDivision =DIVISION_GENERAL)					// 諸口
//<080214_1>↓
//			 or (nSumDivision <> 0)) then							// 合計・総合計
			 or (nSumDivision = 9)) then							// 総合計
//<080214_1>↑
            begin
				CmnToolbarButtonDelete.Enabled := False;
				// 0214 諸口・総合系・合計は適用期間非表示
                //DtlCmnEditAppDateStart.Enabled := False;
                //DtlCmnEditAppDateEnd.Enabled := False;
				DtlCmnEditAppDateStart.Visible := False;
				DtlCmnEditAppDateEnd.Visible := False;
				DtlCmnLabelAppDateTitle.Visible := False;
				DtlCmnLabelAppDateAddtion.Visible := False;
				// 適用日が非表示になるので、正式名称に移動（セグメントの場合）
                if ((DtlCmnEditAppDateStart.Focused = True)
                 OR (DtlCmnEditAppDateEnd.Focused = True)) Then
				begin
// <015> MOD start
(*					m_cACControl	:= DtlCmnEditName;
					m_cACControl.SetFocus ();
*)
                    if (m_cJNTArea.IsModify()) and  		// 修正権限あり
	   				   (m_cJNTArea.IsAppend()) then     	// 追加権限あり
                    begin
						m_cACControl := DtlCmnEditName;  	// 正式名称にﾌｫｰｶｽをｾｯﾄ
                    end
                    else
                    begin
                    	m_cACControl := DtlCmnButtonCancel; // 取消ﾎﾞﾀﾝにﾌｫｰｶｽをｾｯﾄ
                    end;

                    m_cACControl.SetFocus ();
// <015> MOD end
                end;

            end
            else
            begin
				CmnToolbarButtonDelete.Enabled := m_cJNTArea.IsDelete();
				// 0214 諸口・総合系・合計は適用期間非表示
                //DtlCmnEditAppDateStart.Enabled := true;
                //DtlCmnEditAppDateEnd.Enabled := true;
				DtlCmnEditAppDateStart.Visible := true;
				DtlCmnEditAppDateEnd.Visible := true;
				DtlCmnLabelAppDateTitle.Visible := true;
				DtlCmnLabelAppDateAddtion.Visible := true;
            end;

//<MLWK>↓
			// MLワークフローモードの場合
			if m_bMLWF = True then
			begin
				if	(DtlCmnClientPanel.Visible) then							//詳細だった場合
				begin
					if DtlCmnTab.Items[0].Selected = True then					// 実在
					begin
						CmnToolbarButtonDelete.Enabled	:= False;
					end;
				end
				else															//一覧だった場合
				begin
					if StdCmnTab.Items[0].Selected = True then					// 実在
					begin
						CmnToolbarButtonDelete.Enabled	:= False;
					end;
				end;
			end;
//<MLWK>↑

			fNewRecord	:= FALSE;
            // 既存レコードなら付箋可
			fnEnableToolbarButtonTag (TRUE);
            DtlCmnImageTag.Hint := FieldByName('FusenCmnt').AsString;
            if FieldByName('FusenCmnt').AsString <> '' then
            	DtlCmnImageTag.ShowHint := True
            else
            	DtlCmnImageTag.ShowHint := False;
//<100630>↓
			if ((ParentMasterDiv = 41)
			 or (ParentMasterDiv = 101)) then
			begin
//<100906>↓
//				if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
//					FFunctionBar.SetFuncCaption (1, ' F1 ' + STR_FUNC_FREE)
//				else
//					FFunctionBar.SetFuncCaption (1, ' F1 フリー項目参照');
//				FFunctionBar.SetFuncEnabled (1, True) ;
                if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
                begin							//<MLXDEP>begin,end内を一段字下げ
                    if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                        m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
                    else
                        m_arFunction[0]	:= ' F1 フリー項目参照';
                end;							//<MLXDEP>
				FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
				FFunctionBar.Enabled	:= True;
			end
			else
			begin
				m_arFunction[0]	:= '';
				FFunctionBar.CopyFuncData(m_arFunction);
				FFunctionBar.Enabled	:= True;
//<110131_3>↑
			end;
//<100630>↑
		end
		else
        begin
			fNewRecord	:= TRUE;
            // 新規レコードなら付箋可
			fnEnableToolbarButtonTag (FALSE);
            DtlCmnImageTag.Hint := '';
           	DtlCmnImageTag.ShowHint := False;
//<100630>↓
//<100906>↓
//			FFunctionBar.SetFuncCaption (1, '');
//			FFunctionBar.SetFuncEnabled (1, False) ;
//<110131_3>↓
//			m_arFunction[0]	:= '';
//			FFunctionBar.CopyFuncData(m_arFunction);
			if ((ParentMasterDiv = 41)
			 or (ParentMasterDiv = 101)) then
			begin
                if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
                begin							//<MLXDEP>begin,end内を一段字下げ
                    if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                        m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
                    else
                        m_arFunction[0]	:= ' F1 フリー項目参照';
                end;							//<MLXDEP>
				FFunctionBar.Enabled	:= False;
			end
			else
			begin
				m_arFunction[0]	:= '';
				FFunctionBar.CopyFuncData(m_arFunction);
				FFunctionBar.Enabled	:= False;
			end;
//<110131_3>↑
//<100906>↑
//<100630>↑
		end;

		Close ();
	end;

	UpdFreeFlg := False;	// フリー項目未更新
	freeItem := freeItemNull;

	Result	:= fNewRecord;

	dqMasterData.Free ();

    // 適用期間を保存しておく
	tmpStartDate	:= DtlCmnEditAppDateStart.AsDateTime;
	tmpEndDate 		:= DtlCmnEditAppDateEnd.AsDateTime;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetTaxName (Integer; Integer)											*/
//*																									*/
//*	目的	: 部門登録処理 消費税簡略名称取得処理													*/
//*																									*/
//*	戻り値	: String, (消費税簡略名称)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 性格区分 (0:売上, 1:仕入)													*/
//*			  nTaxCode	= 消費税ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetTaxName (nDivision: Integer; nTaxCode: Integer): String;
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
			34:	strTaxName	:= '有価証券売上高(非課税)';
			40:	strTaxName	:= '不課税売上(精算取引)';
			60:	strTaxName	:= '輸出売上';
			64:	strTaxName	:= '非課税輸出売上';
			80:	strTaxName	:= '課税仕入対応特定収入';
			81:	strTaxName	:= '共通仕入対応特定収入';
			84:	strTaxName	:= '非課税仕入対応特定収入';
			89:	strTaxName	:= '使途不特定の特定収入';
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
			20:	strTaxName	:= '課税仕入(外税)';
			21:	strTaxName	:= '共通仕入(外税)';
			22:	strTaxName	:= '課税仕入控除(外税)';
			24:	strTaxName	:= '非課税売上対応仕入(外税)';
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
			99:	strTaxName	:= '不明';
		end;
	end;

	result	:= strTaxName;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetNameSimple (Integer)													*/
//*																									*/
//*	目的	: 部門登録処理 資金繰科目簡略名称取得処理												*/
//*																									*/
//*	戻り値	: String, (資金繰科目簡略名称)										                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 資金繰科目外部ｺｰﾄﾞ 														*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetNameSimple (nExCode: Integer): String;
var
	dqMasterData : TMQuery;
	strNameSimple: String;

begin
	dqMasterData    := TMQuery.Create (Self);		// 050606

    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	strNameSimple	:= '';

    with (dqMasterData) do
    begin
    	Close ();

		SQL.Clear;
		SQL.ADD ('SELECT SimpleName FROM SKmkMA ');
		SQL.ADD ('WHERE MasterKbn = 3 and SumKbn = 0 and RecordKbn = 0 and GCode = :nExCode');

		ParamByName ('nExCode').AsInteger	:= nExCode;

		Open ();

		if  (not EOF) then
			strNameSimple	:= GetFld ('SimpleName').AsString;

		Close ();
	end;

	result	:= strNameSimple;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetSumDescription (Integer)												*/
//*																									*/
//*	目的	: 部門登録処理 実在/合計区分記述取得処理												*/
//*																									*/
//*	戻り値	: String, (実在/合計区分記述)										                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nClassCode	= 部門分類ｺｰﾄﾞ															*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetSumDescription (nSumDivision: Integer): String;
var
	strSumDescription: String;

begin
	strSumDescription	:= '';

	case (nSumDivision) of
		0:	strSumDescription	:= '実在';
		1:	strSumDescription	:= '合計';
		9:	strSumDescription	:= '総合計';
	end;

	Result	:= strSumDescription;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetClassDescription (Integer; Integer)									*/
//*																									*/
//*	目的	: 部門登録処理 部門分類記述取得処理														*/
//*																									*/
//*	戻り値	: String, (部門分類記述)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nClassCode	= 部門分類ｺｰﾄﾞ															*/
//*			  nDescSize		= 取得記述ｻｲｽﾞ (DESCRIPTION_FULL, DESCRIPTION_SHORT...)					*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetClassDescription (nClassCode: Integer; nDescSize: Integer): String;
var
	strClassDescription: String;
	strItemName		   : String;
//	nCount			   : Integer;

begin
	strClassDescription	:= '';
{
	for nCount := 1 to ITEM_MAX do
	begin
		if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			strItemName := m_stSelectItem [nCount].strItemCaption;
			break;
		end;
	end;
}
	strItemName := m_stMasterItem.strItemCaption;
	case (nClassCode) of
		0:	begin
				strClassDescription	:= 'P/L';

				if	(nDescSize <> DESCRIPTION_PRINT) then
					strClassDescription	:= strClassDescription + strItemName;
			end;
		1:	begin
				case (nDescSize) of
					DESCRIPTION_FULL :	strClassDescription	:= '共通' + strItemName + '(B/S+P/L)';
					DESCRIPTION_SHORT:	strClassDescription	:= '共通' + strItemName;
					DESCRIPTION_PRINT:	strClassDescription	:= 'B/S+P/L';
				end;
			end;
		2:	begin
				strClassDescription	:= 'B/S';

				if	(nDescSize <> DESCRIPTION_PRINT) then
					strClassDescription	:= strClassDescription + strItemName;
			end;
	end;

	Result	:= strClassDescription;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetCharacterDescription (Integer, Integer)								*/
//*																									*/
//*	目的	: 部門登録処理 部門性格記述取得処理														*/
//*																									*/
//*	戻り値	: String, (部門性格記述)											                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nCharacterCode	= 部門性格ｺｰﾄﾞ														*/
//*			  nDescSize			= 取得記述ｻｲｽﾞ (DESCRIPTION_FULL, DESCRIPTION_SHORT...)				*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetCharacterDescription (nCharacterCode: Integer; nDescSize: Integer): String;
var
	strCharacterDescription: String;
	strItemName			   : String;
//	nCount				   : Integer;

begin
	strCharacterDescription	:= '';
{
	for nCount := 1 to ITEM_MAX do
	begin
		if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			strItemName := m_stSelectItem [nCount].strItemCaption;
			break;
		end;
	end;
}
	strItemName := m_stMasterItem.strItemCaption;
	case (nCharacterCode) of
		0:	strCharacterDescription	:= '通常';
		1:	strCharacterDescription	:= '営業';
		2:	strCharacterDescription	:= '製造';
		3:	strCharacterDescription	:= '管理';
		4:	strCharacterDescription	:= '営業+管理';
		5:	strCharacterDescription	:= '製造+管理';
	end;

	if	((nDescSize <> DESCRIPTION_PRINT) and (strCharacterDescription <> '')) then
		strCharacterDescription	:= strCharacterDescription + strItemName;

	Result	:= strCharacterDescription;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetCmnStrockDescription (Integer, Integer)								*/
//*																									*/
//*	目的	: 部門登録処理 共通仕入部門記述取得処理													*/
//*																									*/
//*	戻り値	: String, (共通仕入部門記述)										                    */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nCStDivision	= 共通仕入部門区分														*/
//*			  nDescSize		= 取得記述ｻｲｽﾞ (DESCRIPTION_FULL, DESCRIPTION_SHORT...)					*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnGetCmnStockDescription (nCStDivision: Integer; nDescSize: Integer): String;
var
	strCmnStockDescription: String;
	strItemName			  : String;
//	nCount				  : Integer;

begin
	strCmnStockDescription	:= '';
{
	for nCount := 1 to ITEM_MAX do
	begin
		if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			strItemName := m_stSelectItem [nCount].strItemCaption;
			break;
		end;
	end;
}
	strItemName := m_stMasterItem.strItemCaption;
	case (nCStDivision) of
//<120517>↓
//		0:	strCmnStockDescription	:= '対象外';
//		1:	begin
//				strCmnStockDescription	:= '対象';
//
//				if	(nDescSize <> DESCRIPTION_PRINT) then
//					strCmnStockDescription	:= strCmnStockDescription + strItemName;
//			end;
		0:	strCmnStockDescription	:= '指定なし';
		1:	strCmnStockDescription	:= '課税・非課税売上共通';
		2:	strCmnStockDescription	:= '非課税売上対応';
//<120517>↑
	end;

	result	:= strCmnStockDescription;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnShowDetailScreen ()																*/
//*																											*/
//*	目的	: 部門登録処理 詳細画面表示処理																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnShowDetailScreen ();
var
	nSumDivision: Integer;
	strExCode	: String;
begin
	m_fUnderConstruction	:= TRUE;

	strExCode	:= '';

	if  (m_nCurrentCodeAttr <= 1) then
	begin
		DtlCmnEditExCodeBSAddFree.Visible	:= FALSE;

//0318?		if	((m_nCurrentMasterDiv = 41) and (m_nCurrentAdoptDiv = 2)) then
		if	(m_nCurrentAdoptDiv = 2) then
			DtlCmnEditExCodeBSAddNumeric.Visible	:= TRUE;
	end
	else
	begin
		DtlCmnEditExCodeBSAddNumeric.Visible	:= FALSE;

//0318?		if	((m_nCurrentMasterDiv = 41) and (m_nCurrentAdoptDiv = 2)) then
		if	(m_nCurrentAdoptDiv = 2) then
			DtlCmnEditExCodeBSAddFree.Visible	:= TRUE;
	end;

//<080311>↓
//	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then							// 実在部門ｸﾞﾘｯﾄﾞ
	if	(m_cACControl.Name = StdCmnGridExist.Name) then							// 実在部門ｸﾞﾘｯﾄﾞ
//<080311>↑
	begin
//		if  (m_nCurrentCodeAttr <= 1) then
//			strExCode	:= Format ('%.10d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName('nInCode').AsString))])
//		else
			strExCode	:= StdCmnMemDataExist.FieldByName('nInCode').AsString;

		DtlNCode := strExCode;
		nSumDivision	:= 0;
		{処理モード}
//<MLWK>↓
		// 実在はMLワークフローモードのときは参照のみ
//		if m_cJNTArea.IsModify() then
		if	(m_bMLWF = False)
		and	(m_cJNTArea.IsModify()) then
//<MLWK>↑
			ModeBtn.Caption := '修　正'
        else
			ModeBtn.Caption := '参　照';
//		ModeBtn.Font.Color := clRed;
		firstFlg := TRUE;						//  <マスタ同期>
	end
//<080311>↓
//	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then						// 合計部門ｸﾞﾘｯﾄﾞ
	else if	(m_cACControl.Name = StdCmnGridTotal.Name) then						// 合計部門ｸﾞﾘｯﾄﾞ
//<080311>↑
	begin
//		if  (m_nCurrentCodeAttr <= 1) then
//			strExCode	:= Format ('%.10d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName('nInCode').AsString))])
//		else
			strExCode	:= StdCmnMemDataTotal.FieldByName('nInCode').AsString;

		DtlNCode := strExCode;
		nSumDivision	:= 1;
		{処理モード}
		if m_cJNTArea.IsModify() then
			ModeBtn.Caption := '修　正'
        else
			ModeBtn.Caption := '参　照';
//		ModeBtn.Font.Color := clRed;
		firstFlg := TRUE;						//  <マスタ同期>
	end
	//--- 2004/01/21 St -----
//<080311>↓
//	else if (Screen.ActiveControl.Name = DtlCmnButtonUpdate.Name) then
	else if (m_cACControl.Name = DtlCmnButtonUpdate.Name) then
//<080311>↑
	begin
//        if  (m_nCurrentCodeAttr <= 1) then
//			strExCode   := Format ('%.10d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
//        else
//            strExCode   := DtlCmnEditExCodeFree.Text;
			strExCode := DtlNCode;

        if DtlCmnTab.Items[0].Selected = True then
            nSumDivision    := 0
        else
            nSumDivision    := 1;
{★★★削除予定
    end
    //--- 2004/01/21 Ed -----
	else																				// ﾂﾘｰﾋﾞｭｰ
	begin
		cNode		:= CmnTreeView.Selected;
    	stWorkRec	:= cNode.Data;
		strExCode	:= stWorkRec^.strExCode;

		nSumDivision	:= stWorkRec^.nDivision;
★★★削除予定}
	end;

	if	(strExCode = '') then
	begin
//		if  (m_nCurrentCodeAttr <= 1) then
//			strExCode	:= Format ('%.10d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
//		else
//		begin
//			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
//			strExCode	:= DtlCmnEditExCodeFree.Text;
//		end;
		strExCode := DtlNCode;

		if	(DtlCmnTab.Items [0].Selected) then									// 実在
			nSumDivision	:= 0
		else
			nSumDIvision	:= 1;
	end;

{★★★
	if	((nSumDivision <> 0) and (nSumDivision <> DIVISION_GENERAL)) then
	begin
		stWorkRec	:= CmnTreeView.Selected.Data;

		if	(CompareStr (stWorkRec^.strExCode, strExCode) = 0) then
		begin
			if	(CmnTreeView.Selected.Parent <> nil) then
			begin
				stWorkRec	:= CmnTreeView.Selected.Parent.Data;

				fnSetParentItemsInfoEx (stWorkRec^.nDivision, stWorkRec^.strExCode, '', stWorkRec^.strName);
			end;
		end;
	end;
★★★}

	fnSetDetailScreenInfo (strExCode, nSumDivision);

	if ((ParentMasterDiv <> 87)										// 役職
   	AND (ParentMasterDiv <> 88)										// 職能資格
   	AND (ParentMasterDiv <> 89)) then								// 職位
		DtlCmnTab.Items [1].Enabled	:= TRUE;

	if	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
	begin
		DtlCmnTab.Items [0].Selected	:= TRUE;
		DtlCmnTab.Items [1].Selected	:= FALSE;
	end
	else
	begin
		DtlCmnTab.Items [1].Selected	:= TRUE;
		DtlCmnTab.Items [0].Selected	:= FALSE;
	end;

	if	((CompareStr (m_strExCodeCurrent, m_strExCodeTotal) = 0) and
		((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL))) then
	begin
//☆		DtlCmnTab.Items [1].Enabled		:= FALSE;
		DtlCmnTab.Items [0].Selected	:= TRUE;
	end;

	StdCmnClientPanel.Visible	:= FALSE;
	DtlCmnClientPanel.Visible	:= TRUE;

	m_fUnderConstruction	:= FALSE;
	m_fChangeDetails		:= FALSE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnResetDetailScreen ()													*/
//*																									*/
//*	目的	: 部門登録処理 詳細画面再ｾｯﾄ処理														*/
//*																									*/
//*	戻り値	: Boolean, (True:新規ﾚｺｰﾄﾞ, False:既存ﾚｺｰﾄﾞ)											*/
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnResetDetailScreen (): Boolean;
var
	strExCode	: String;
	fNewRecord	: Boolean;
	nSumDivision: Integer;

begin
{
	if	(m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.10d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;
}
	strExCode := DtlNCode;

	fNewRecord	:= fnSetDetailScreenInfo (strExCode, nSumDivision);

	StdCmnClientPanel.Visible	:= False;
	DtlCmnClientPanel.Visible	:= True;

	// 050905 >>
	// 削除ボタンの有効/無効がおかしい対応
	fnSetDeleteButtonCondition();
	//if (not ChkChild(strExCode)) then	//0209
	//	  CmnToolbarButtonDelete.Enabled := FALSE;
	// 050905 <<

//<090615>↓
	if	((nSumDivision = DIVISION_GENERAL)					// 諸口
	 or  (nSumDivision = 9)) then							// 総合計
	begin
		// 諸口・総合計は適用期間非表示
		DtlCmnEditAppDateStart.Visible		:= False;
		DtlCmnEditAppDateEnd.Visible		:= False;
		DtlCmnLabelAppDateTitle.Visible		:= False;
		DtlCmnLabelAppDateAddtion.Visible	:= False;
	end
	else
	begin
		// 実在・合計は適用期間表示
		DtlCmnEditAppDateStart.Visible		:= true;
		DtlCmnEditAppDateEnd.Visible		:= true;
		DtlCmnLabelAppDateTitle.Visible		:= true;
		DtlCmnLabelAppDateAddtion.Visible	:= true;
	end;
//<090615>↑
	Result	:= fNewRecord;
end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnGetTagColorBitmap (Integer)									            */
//*																									*/
//*	目的	: 部門登録処理 ﾏｽﾀ付箋管理情報取得                		                                */
//*																									*/
//*	戻り値	: TBitmap,													                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnGetTagColorBitmap (nTagColor: Integer): TBitmap;
var
	bmpTagColor : TBitmap;
	lvBit		 : TBitMap;
begin
//	bmpTagColor := nil;

// 0624 >>
	lvBit := TBitMap.Create;

	case (nTagColor) of
		1:	CmnImageGeneral.GetBitmap(0, lvBit);
		2:	CmnImageGeneral.GetBitmap(2, lvBit);
        3:	CmnImageGeneral.GetBitmap(1, lvBit);
		4:	CmnImageGeneral.GetBitmap(3, lvBit);
        else lvBit := nil;
	end;

    bmpTagColor := lvBit;
// 0624 <<
{0624
	case (nTagColor) of
		1:	bmpTagColor	:= CmnTreeViewPopupMenuTag01.Bitmap;
		2:	bmpTagColor	:= CmnTreeViewPopupMenuTag03.Bitmap;
        3:	bmpTagColor	:= CmnTreeViewPopupMenuTag02.Bitmap;
		4:	bmpTagColor	:= CmnTreeViewPopupMenuTag04.Bitmap;
	end;
}
	Result	:= bmpTagColor;
end;


//  <マスタ同期>---Begin---
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckMasterDataRecordValid (String)									*/
//*																									*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Integer													                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnCheckMasterDataRecordValid (strExCode: String): Integer;
var
	dqMasterData: TMQuery;
	DateS  :	TDateTime;
	DateE  :	TDateTime;
	DateS2 :	TDateTime;
	DateE2 :	TDateTime;
	i	   :	Integer;
	iMax   :	Integer;
	bFlag  :	Boolean;
	fNCode :	Single;
begin
//適用期間 開始日＜終了日が前提

	Result	:= C_RET_ERROR;
	if	(Trim (strExCode) = '') then
	begin
		Exit;
	end;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	if (IsChild())								// 子社
	and	(m_nReferMode <> REFER)					// 追加可能
	and (m_cJNTArea.IsAppend()) then
	begin
		if (DtlCmnClientPanel.Visible = TRUE)	// 詳細画面
		and (ModeBtn.Caption <> '新　規') then	// 修正モード
		begin
			iMax := 1;							// 自社のみ
		end
		else
		begin
			iMax := 2;							// 自社 ＆ 全社
		end;
	end
	else
	begin
		iMax := 1;								// 自社のみ
	end;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	bFlag	:= False;
	for i:=1 to iMax do
	begin
		if i = 1 then
		begin
			// 自社に接続
			m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);
		end
		else
		begin
			// 全社に接続
			m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);
		end;

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
// <014> MOD start
//			SQL.Add   ('SELECT TStartDate, TEndDate , NCode, LongName FROM ' + DEF_HOJYOMA);
			SQL.Add   ('SELECT TStartDate, TEndDate , NCode, LongName, SimpleName FROM ' + DEF_HOJYOMA);
// <014> MOD end
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');
			// 一覧画面 && 全社検索の場合
			if (DtlCmnClientPanel.Visible = False)
			and (i <> 1) then
			begin
				if	(StdCmnTab.Items [1].Selected) then				// 合計タブ
					SQL.Add   ('  AND  SumKbn <> 0')				// 実在以外
				else												// 実在タブ
					SQL.Add   ('  AND  SumKbn = 0');				// 実在
			end;

			// 詳細画面 && 自社検索の場合
			if (DtlCmnClientPanel.Visible = True)
			and (i = 1) then
				SQL.Add   ('  AND  NCode <> :NCode');				// 自分とは比較しない

//<090722_2>↓
			SQL.Add   ('ORDER BY TStartDate DESC');
//<090722_2>↑

			ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
			ParamByName ('strExCode'      ).AsString    := strExCode;

			// 詳細画面 && 自社検索の場合
			if (DtlCmnClientPanel.Visible = True)
			and (i = 1) then
				ParamByName ('NCode'      ).AsString    := DtlNCode;

			Open ();

			while  (not EOF) do
			begin
				// 職種・役職等も外部コードは重複できる！
				if (ParentMasterDiv = 101) then					// セグメントの場合は適用期間は無関係
				begin
					// 重複データ
					bFlag	:= True;
					if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
					begin
						DtlNCode2 := FieldByName('NCode').AsString;
					end;
					Break;
				end;

				{外部ｺｰﾄﾞ重複→適用期間チェック！}
				{比較元日付取得}
				if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
				begin
					if ((DtlCmnEditAppDateStart.Value = 0) or (DtlCmnEditAppDateStart.Value = NULL)) then
						DateS := DEF_S_DATE
					else
						DateS := DtlCmnEditAppDateStart.AsDateTime;
					if ((DtlCmnEditAppDateEnd.Value = 0) or (DtlCmnEditAppDateEnd.Value = NULL)) then
						DateE := DEF_E_DATE
					else
						DateE := DtlCmnEditAppDateEnd.AsDateTime;
				end
				else											// 一覧画面
				begin
					if ((EDateStart.Value = 0) or (EDateStart.Value = NULL)) then
						DateS := DEF_S_DATE
					else
						DateS := EDateStart.AsDateTime;
					if ((EDateEnd.Value = 0) or (EDateEnd.Value = NULL)) then
						DateE := DEF_E_DATE
					else
						DateE := EDateEnd.AsDateTime;
				end;

				{比較先日付取得}
				if ((FieldByName('TStartDate').AsString = '') or (FieldByName('TStartDate').IsNull)) then
					DateS2 := DEF_S_DATE
				else
					DateS2 := FieldByName('TStartDate').AsDateTime;
				if ((FieldByName('TEndDate').AsString = '') or (FieldByName('TEndDate').IsNull)) then
					DateE2 := DEF_E_DATE
				else
					DateE2 := FieldByName('TEndDate').AsDateTime;

				{チェック}
				{
				  ①比較元	  ====
					比較先         ----

				  ②比較元	       ====
					比較先    ----

				  のみ有効
				}

				if ((DateE < DateS2) OR (DateS > DateE2)) then
				begin
				end
				else
				begin
					// 重複データ
					bFlag	:= True;
					if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
					begin
						DtlNCode2 := FieldByName('NCode').AsString;
						//DtlNCode := FieldByName('NCode').AsString;
						//ModeBtn.Caption := '修　正';
						//ModeBtn.Font.Color := clRed;
					end;
					Break;
				end;
				NEXT;
			end;

			if bFlag then						// 重複データあり
			begin
				if i = 1 then					// 自社に
				begin
					Result := C_RET_SAME_SELF;
					Break;						// 全社の確認不要
				end
				else							// 全社＆（一覧ｏｒ新規）
				begin
// <014> MOD start
(*					if ( MjsMessageBoxEx(Self,
										 JNTSYNC_MSG_CHK_SYNC,
										 '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
*)
											// 簡略名称も表示する
					if (MjsMessageBoxEx(Self,
                                        JNTSYNC_MSG_CHK_SYNC + #13#10 + #13#10 + FieldByName('SimpleName').AsString,
										'確認', mjQuestion, mjYESNO, mjDefNO) = mrYES) then
// <014> MOD start
					begin						// 関連付け
						fNCode := FieldByName('NCode').AsFloat;
						if fnWriteData_Rel(Trunc(fNCode), m_nCurrentMasterDiv, dqMasterData) then
						begin
							Result := C_RET_SYNC;

							if not DtlCmnClientPanel.Visible then		// 一覧画面
							begin
								if	(StdCmnTab.Items [1].Selected) then	// 合計
								begin
									StdCmnMemDataTotal.Cancel;
								end
								else									// 実在
								begin
									StdCmnMemDataExist.Cancel;
								end;

								// 一覧に追加
								Close();
								// 自社に接続
								m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

								Close ();

								SQL.Clear ();
								SQL.Add   ('SELECT hm.GCode, hm.SumKbn, hm.NCode, hm.Renso, hm.SyokuchiKbn,');
								SQL.Add   ('       hm.LongName,  hm.SimpleName, hm.HojyoKbn1, hm.HojyoKbn2,');
//<100215_1>↓
								SQL.Add   ('       hm.TStartDate, hm.TEndDate,');
//<100215_1>↑
								SQL.Add	  ('       fi.FusenKbn,  fi.FusenCmnt ');
								SQL.Add   ('FROM   ' + DEF_HOJYOMA + ' hm LEFT OUTER JOIN MFusenInfo fi ');
								SQL.Add   ('ON     fi.MasterKbn = hm.MasterKbn AND fi.NCode = hm.NCode ');
								SQL.Add   ('WHERE  hm.NCode = :NCode');

                                SQL.Add   ('AND    hm.MasterKbn = :MasterKbn'); 	// <012> ADD 条件にﾏｽﾀ区分を追加
								ParamByName('NCode').AsFloat := fNCode;
                                						   							// <012> ADD ﾏｽﾀ区分をｾｯﾄ
                                ParamByName('MasterKbn').AsInteger := m_nCurrentMasterDiv;

								if not Open() then
								begin
									// 関連付け失敗
									Result := C_RET_SAME_PARENT;
								end
								else if Eof then
								begin
									// 関連付け失敗
									Result := C_RET_SAME_PARENT;
								end
								else
								begin
									fnSetGridMemDataEx (FieldByName('SumKbn'    ).AsInteger,
														FieldByName('GCode'     ).AsString,
														FieldByName('NCode'     ).AsString,
														FieldByName('Renso'     ).AsString,
														FieldByName('LongName'  ).AsString,
														FieldByName('SimpleName').AsString,
														FieldByName('HojyoKbn2' ).AsInteger,
//<100215_1>↓
														FieldByName('TStartDate').AsDateTime,
														FieldByName('TEndDate' ).AsDateTime,
//<100215_1>↑
														FieldByName('FusenKbn'  ).AsInteger,
														FieldByName('FusenCmnt' ).AsString);

								end;
							end
							else				// 詳細画面
							begin
								DtlNCode := CurrToStr(fNCode);
								fnShowDetailScreen();
							end;
						end
						else
						begin
							// 関連付け失敗
							Result := C_RET_SAME_PARENT;
						end
					end
					else						// 関連付けない
					begin
						Result := C_RET_SAME_PARENT;
					end;
				end;
			end;
			Close ();
		end;
	end;
	if not bFlag then							// 重複データなし
	begin
		Result := C_RET_NONE;
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckMasterDataRecordValid2 (String)  								*/
//*																									*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Integer													                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnCheckMasterDataRecordValid2 (strExCode: String): Integer;
var
	dqMasterData: TMQuery;
    DefStr		: String;
	i	   :	Integer;
	iMax   :	Integer;
	bFlag  :	Boolean;
begin

	Result	:= C_RET_ERROR;
	if	(Trim (strExCode) = '') then
	begin
		Exit;
	end;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	if (IsChild()) 								// 子社
	and	(m_nReferMode <> REFER)					// 追加可能
	and (m_cJNTArea.IsAppend()) then
	begin
		iMax := 2;								// 自社 ＆ 全社
	end
	else
	begin
		iMax := 1;								// 自社のみ
	end;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	bFlag	:= False;
	for i:=1 to iMax do
	begin
		if i = 1 then
		begin
			// 自社に接続
			m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);
		end
		else
		begin
			// 全社に接続
			m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);
		end;

		if DtlCmnClientPanel.Visible = True then				// 詳細画面の場合
		begin
			if	(DtlCmnTab.Items [1].Selected) then				// 合計
				DefStr := '='									// 実在部門で同じものがあるか？
			else												// 実在
				DefStr := '<>';									// 実在以外で同じものがあるか？
		end														// 一覧画面の場合
		else
		begin
			if	(StdCmnTab.Items [1].Selected) then				// 合計
				DefStr := '='									// 実在部門で同じものがあるか？
			else												// 実在
				DefStr := '<>';									// 実在以外で同じものがあるか？
		end;

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
// <014> MOD start
//			SQL.Add   ('SELECT NCode FROM ' + DEF_HOJYOMA);
			SQL.Add   ('SELECT NCode, SimpleName FROM ' + DEF_HOJYOMA);
// <014> MOD end
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');
			SQL.Add   ('  AND  SumKbn ' + DefStr + ' 0');

			ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
			ParamByName ('strExCode'      ).AsString    := strExCode;

			Open ();

			if  (not EOF) then
			begin
				bFlag 	:= True;
				if i = 1 then
				begin
					Result  := C_RET_SAME_SELF;
				end
				else
				begin
					Result  := C_RET_SAME_PARENT;
                      						// <014> ADD 全社ﾏｽﾀの簡略名称を取得
                    m_strSimpleName := GetFld('SimpleName').AsString;
				end;
				Break;
			end;

			Close ();
		end;
	end;

	dqMasterData.Free ();

	if not bFlag then							// 重複なし
	begin
		Result  := C_RET_NONE;
	end;
end;
//  <マスタ同期>--- End ---


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckMasterDataTagInfo (String; var array of TagInfo)                   */
//*																									*/
//*	目的	: 部門登録処理 ﾏｽﾀ付箋管理情報ﾁｪｯｸ               		                                */
//*																									*/
//*	戻り値	: なし,             										                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode = 部門内部ｺｰﾄﾞ！    														*/
//*           pTagInfo	= 付箋区分 (array [1..4] of TagInfo)										*/
//*                                                                                                 */
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnCheckMasterDataTagInfo (strExCode: String; var pTagInfo: array of TagInfo);
var
	dqMasterData: TMQuery;
	nCount      : Integer;

begin
	for nCount := 0 to 3 do
	begin
		pTagInfo [nCount].fChecked		:= False;								// 付箋区分初期化
		pTagInfo [nCount].strComment	:= '';									// 付箋ｺﾒﾝﾄ初期化
	end;

	dqMasterData    := TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT FusenKbn, FusenCmnt FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode ');

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
        ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		while (not EOF) do
		begin
			pTagInfo [FieldByName('FusenKbn').AsInteger - 1].fChecked		:= TRUE;
			pTagInfo [FieldByName('FusenKbn').AsInteger - 1].strComment	:= FieldByName('FusenCmnt').AsString;

            NEXT;
        end;

		Close ();
    end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnUpdateMasterRecord ()															*/
//*																											*/
//*	目的	: 部門登録処理 部門ﾏｽﾀ更新処理																	*/
//*																											*/
//*	戻り値	: Boolean,																						*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnUpdateMasterRecord (): Boolean;
begin

	m_cDataModule.BeginTran (m_cDBSelect);											   	// ﾄﾗﾝｻﾞｸｼｮﾝの開始
// <012> ADD start
    if IsChild() then       			// 子会社の場合
    begin
    	m_cDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);											   	// ﾄﾗﾝｻﾞｸｼｮﾝの開始
    end;
// <012> ADD end
{★★★
	if	(m_stMasterData.nDivision <> 9) then
	begin           
    	if  (not fnUpdateMasterTreeRecord (m_stMasterData.strExCodeParent)) then		// 部門加算体系ﾏｽﾀ更新
    	begin
			Beep ();

			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)

			Result	:= FALSE;
			Exit;
    	end;

		if	((m_stMasterData.nDivision = 0) and
			 (CompareStr (m_stMasterData.strExCodeParent, m_strExCodeTotal) <> 0)) then
		begin
			if	(not fnUpdateMasterTreeRecord (m_strExCodeTotal)) then
			begin
				Beep ();

				fnOutputDBErrorMessage ();
				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)

				Result	:= FALSE;
				Exit;
			end;
		end;
	end;
★★★}

//<080214_2>↓
	SessionPractice(C_ST_PROCESS);
	try
//<080214_2>↑
		if	(not fnUpdateMasterDataRecord ()) then											// 部門基本ﾏｽﾀ更新
		begin
			Beep ();

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)
// <012> ADD start
			if IsChild() then  				// 子会社の場合
			begin
				m_cDataModule.Rollback(m_SyncMaster.m_cPDBSelect);											// ﾛｰﾙﾊﾞｯｸ(破棄)
			end;
			
// <012> ADD end

			Result	:= FALSE;
			Exit;
		end;
//<080214_2>↓
	finally
		SessionPractice(C_ED_PROCESS);
	end;
//<080214_2>↑

    m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
// <012> ADD start
  	if IsChild() then  					// 子会社の場合
    begin
    	m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);													// ｺﾐｯﾄ(反映)
    end;
// <012> ADD end

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnUpdateMasterDataRecord ()														*/
//*																											*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ更新処理																*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)														*/
//*																											*/
//***********************************************************************************************************/
function    TJNTCRP0020030f.fnUpdateMasterDataRecord (): Boolean;
var
	dqMasterData: TMQuery;
	fNewRecord  : Boolean;
	strExCode	: String;
	strInCode	: String;
	strDateStart: String;
	strDateEnd  : String;
    i			: Integer;
    strTmp		: String;
//    lvType		: Integer;
begin
	dqMasterData    := TMQuery.Create (Self);		// 050606

//  <マスタ同期>---Begin---
	if IsChild() then							// 子会社
	begin
		// 全社に接続
		m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);
// <012> DEL start
(*		m_cDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);
		m_cDataModule.BeginTran(m_cDBSelect);
*)
// <012> DEL end
	end
	else										// 全社orグループ管理なし
	begin
		// 自社に接続
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);
	end;
//  <マスタ同期>--- End ---

	strExCode   := m_stMasterData.strExCode;
	strInCode   := m_stMasterData.strNCode;

	if  (m_nCurrentCodeAttr <= 1) then
    begin
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);
		//strInCode	:= Format ('%.10d', [StrToInt64 (Trim (strInCode))]);
	end;

	if	((m_stMasterData.nDivision = 1) and (CompareStr (strExCode, m_strExCodeTotal) = 0)) then
		m_stMasterData.nDivision	:= 9;

	with (dqMasterData) do																// ﾚｺｰﾄﾞ存在ﾁｪｯｸ
	begin
		Close ();

		SQL.Clear ();

		SQL.Add	  ('SELECT GCode, NCode FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
//		SQL.Add   ('       SumKbn = :nSumDivision AND RecordKbn = 0 AND GCode = :strExCode');
		SQL.Add   ('       SumKbn = :nSumDivision AND RDelKbn = 0 AND NCode = :strInCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('nSumDivision'   ).AsInteger	:= m_stMasterData.nDivision;
//		ParamByName ('strExCode'      ).AsString	:= strExCode;
		ParamByName ('strInCode'      ).AsString	:= strInCode;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		if	(not EOF) then
        begin
			// ◆◇◆　諸口
			//if	(FieldByName('NCode').AsInteger = 0) then				  			// 諸口
//<100215_1>↓
//			if	(strInCode = Label3.Caption) then										// 諸口
			if	(strInCode = m_SyokuchiNCd) then										// 諸口
//<100215_1>↑
				m_stMasterData.nClassCode	:= 1;

			fNewRecord	:= FALSE														// 既存ﾚｺｰﾄﾞ (UPDATE)
		end
		else
			fNewRecord	:= TRUE;														// 新規ﾚｺｰﾄﾞ (INSERT)

		Close ();
	end;

	m_fUpdateRecord	:= TRUE;

	if	(fNewRecord) then																// 新規ﾚｺｰﾄﾞ (INSERT)
	begin
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
//			SQL.Add   (fnMakeSQLConstructionInsert (strExCode));
			SQL.Add('INSERT INTO ' + DEF_HOJYOMA );                    			//HIS0009
			SQL.Add('	(UpdTantoNCode,         ');                             //ログイン者
			SQL.Add('	 MasterKbn,             ');                             //マスタ区分
			SQL.Add('	 SumKbn,                ');								//実在/合計区分
			SQL.Add('	 RDelKbn,               ');								//レコード区分
			SQL.Add('	 GCode,                 ');								//外部コード
			SQL.Add('	 RenSo,		            ');								//連想シンボル
			SQL.Add(' 	 LongName,              ');								//正式名称
			SQL.Add('	 SimpleName,            ');                             //簡略名称
//050915	if	(not DtlCmnEditClassCode.InputFlag) then						// 入力された場合のみ
			SQL.Add('	 HojyoKbn2,         ');								//部門分類コード
			SQL.Add('    TStartDate,            ');
			SQL.Add('    TEndDate,              ');

			// ◆◇◆　諸口区分
			SQL.Add('	 SyokuchiKbn            ');								//諸口区分

			if	(m_stMasterData.fDetails) then									// 詳細更新区分: TRUE=あり
			begin
				SQL.Add(',                      ');
				if	(not DtlCmnEditCharacterCode.InputFlag) then				// 入力された場合のみ
					SQL.Add('HojyoKbn1,         ');								//部門性格コード
{
				// 050915 >>
				if	(not DtlCmnEditClassCode.InputFlag) then					// 入力された場合のみ
					SQL.Add('HojyoKbn2,         ');								//部門分類コード
				// 050915 <<
}
				if	(not DtlCmnEditCommonStockDivision.InputFlag) then			// 入力された場合のみ
					SQL.Add('BunCode,           ');
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.BunruiNCode[i] <> '' then
                    	SQL.Add('BunruiNCode' + IntToStr(i) + ',')
				end;

                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.SegNCode[i] <> '' then
                    	SQL.Add('SegNCode' + IntToStr(i) + ',')
				end;

				if UpdFreeFlg then
                begin
					SQL.Add('VFree1,  ');
					SQL.Add('VFree2,  ');
					SQL.Add('VFree3,  ');
					SQL.Add('VFree4,  ');
					SQL.Add('VFree5,  ');
					SQL.Add('VFree6,  ');
					SQL.Add('VFree7,  ');
					SQL.Add('VFree8,  ');
					SQL.Add('VFree9,  ');
					SQL.Add('VFree10, ');
					SQL.Add('NFree1,  ');
					SQL.Add('NFree2,  ');
					SQL.Add('NFree3,  ');
					SQL.Add('NFree4,  ');
					SQL.Add('NFree5,  ');
					SQL.Add('NFree6,  ');
					SQL.Add('NFree7,  ');
					SQL.Add('NFree8,  ');
					SQL.Add('NFree9,  ');
					SQL.Add('NFree10, ');
					if freeItem.DFree1 > 0 then
						SQL.Add('DFree1,  ');
					if freeItem.DFree2 > 0 then
						SQL.Add('DFree2,  ');
					if freeItem.DFree3 > 0 then
						SQL.Add('DFree3,  ');
				end;

				SQL.Add('BSBumonNCode           ');
			// 050915 >>
			end
			// 一覧画面
            else
            begin
				SQL.Add(',			        ');
				SQL.Add('HojyoKbn1,         ');								//部門性格コード
//				SQL.Add('HojyoKbn2,         ');								//部門分類コード
				SQL.Add('BunCode,           ');
				SQL.Add('BSBumonNCode       ');
			// 050915 <<
			end;

			SQL.Add(') Values (                 ');
			SQL.Add('	:LoginID,               ');
			SQL.Add('	:MasterKbn,             ');
			SQL.Add('	:SumKbn,                ');
			SQL.Add('	:RecordKbn,             ');
			SQL.Add('	:GCode,                 ');
			SQL.Add('	:Renso,                 ');
			SQL.Add('	:LongName,              ');
			SQL.Add('	:SimpleName,            ');
//050915	if	(not DtlCmnEditClassCode.InputFlag) then						// 入力された場合のみ
			SQL.Add('	:HojyoKbn2,         ');
			SQL.Add('	:DateStart,             ');
			SQL.Add('	:DateEnd,               ');
			// ◆◇◆　諸口
//<100215_1>↓
//			if	(strInCode = Label3.Caption) then								// 諸口
			if	(strInCode = m_SyokuchiNCd) then								// 諸口
//<100215_1>↑
				SQL.Add('	1                   ')
			else																// 諸口以外
				SQL.Add('	0                   ');

			if	(m_stMasterData.fDetails) then									// 詳細更新区分: TRUE=あり
			begin

       			SQL.Add(',                      ');
				if	(not DtlCmnEditCharacterCode.InputFlag) then				// 入力された場合のみ
					SQL.Add('	:HojyoKbn1,     ');
{
				//050915 >>
				if	(not DtlCmnEditClassCode.InputFlag) then					// 入力された場合のみ
					SQL.Add('	:HojyoKbn2,         ');
				//050915 <<
}
				if	(not DtlCmnEditCommonStockDivision.InputFlag) then			// 入力された場合のみ
					SQL.Add('	:BunCode,       ');
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.BunruiNCode[i] <> '' then
						SQL.Add('	:BunruiNCode' + IntToStr(i) +',          ');
				end;

                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.SegNCode[i] <> '' then
						SQL.Add('	:SegNCode' + IntToStr(i) +',             ');
				end;

				if UpdFreeFlg then
                begin
					SQL.Add(' :VFree1,  ');
					SQL.Add(' :VFree2,  ');
					SQL.Add(' :VFree3,  ');
					SQL.Add(' :VFree4,  ');
					SQL.Add(' :VFree5,  ');
					SQL.Add(' :VFree6,  ');
					SQL.Add(' :VFree7,  ');
					SQL.Add(' :VFree8,  ');
					SQL.Add(' :VFree9,  ');
					SQL.Add(' :VFree10, ');
					SQL.Add(' :NFree1,  ');
					SQL.Add(' :NFree2,  ');
					SQL.Add(' :NFree3,  ');
					SQL.Add(' :NFree4,  ');
					SQL.Add(' :NFree5,  ');
					SQL.Add(' :NFree6,  ');
					SQL.Add(' :NFree7,  ');
					SQL.Add(' :NFree8,  ');
					SQL.Add(' :NFree9,  ');
					SQL.Add(' :NFree10, ');
					if freeItem.DFree1 > 0 then
						SQL.Add(' :DFree1,  ');
					if freeItem.DFree2 > 0 then
						SQL.Add(' :DFree2,  ');
					if freeItem.DFree3 > 0 then
						SQL.Add(' :DFree3,  ');
				end;

				SQL.Add('	:BSBumonNCode           ');
			// 050915 >>
			end
			// 一覧画面
            else
            begin
				SQL.Add(',				    ');
				SQL.Add('	:HojyoKbn1,     ');
//				SQL.Add('	:HojyoKbn2,     ');
				SQL.Add('	:BunCode,       ');
				SQL.Add('   :BSBumonNCode   ');
			// 050915 <<
			end;

			SQL.Add(')');
			ParamByName('LoginID').AsString			:= m_strLoginNCode;
			ParamByName('MasterKbn').AsInteger		:= m_nCurrentMasterDiv;
			ParamByName('SumKbn').AsInteger			:= m_stMasterData.nDivision;
			ParamByName('RecordKbn').AsInteger		:= 0;
			ParamByName('GCode').AsString			:= TrimRight(strExCode);
			ParamByName('Renso').AsString			:= m_stMasterData.strAssociation;
			ParamByName('LongName').AsString		:= m_stMasterData.strName;
			ParamByName('SimpleName').AsString		:= m_stMasterData.strNameSimple;
//050915	if	(not DtlCmnEditClassCode.InputFlag) then						// 入力された場合のみ
			ParamByName('HojyoKbn2').AsInteger		:= m_stMasterData.nClassCode;
//<080214_1>↓
//			if m_stMasterData.nDivision = 0 then	//実在
//			begin
//<080214_1>↑
				if	(m_stMasterData.nAppDateStart > 0) then
					ParamByName('DateStart').AsInteger := m_stMasterData.nAppDateStart
				else
					ParamByName('DateStart').AsInteger := MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE);

				if	(m_stMasterData.nAppDateEnd > 0) then
					ParamByName('DateEnd').AsInteger := m_stMasterData.nAppDateEnd
				else
					ParamByName('DateEnd').AsInteger := MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE);
//<080214_1>↓
//			end
//			else									// 諸口or合計
//			begin
//				ParamByName('DateStart').AsInteger := MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE);
//				ParamByName('DateEnd').AsInteger := MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE);
//			end;
//<080214_1>↑

			if	(m_stMasterData.fDetails) then									// 詳細更新区分: TRUE=あり
			begin
				if	(not DtlCmnEditCharacterCode.InputFlag) then				// 入力された場合のみ
					ParamByName('HojyoKbn1').AsInteger	:= m_stMasterData.nCharacterCode;
{
				//050915 >>
				if	(not DtlCmnEditClassCode.InputFlag) then					// 入力された場合のみ
					ParamByName('HojyoKbn2').AsInteger		:= m_stMasterData.nClassCode;
				//050915 <<
}
				if	(not DtlCmnEditCommonStockDivision.InputFlag) then			// 入力された場合のみ
					ParamByName('BunCode').AsInteger	:= m_stMasterData.nCmnStDivision;
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.BunruiNCode[i] <> '' then
		            begin
	                	strTmp := 'BunruiNCode' + IntToStr(i);
						ParamByName(strTmp).AsString	:= m_stMasterData.BunruiNCode[i];
					end;
				end;
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.SegNCode[i] <> '' then
		            begin
	                	strTmp := 'SegNCode' + IntToStr(i);
						ParamByName(strTmp).AsString		:= m_stMasterData.SegNCode[i];
					end;
				end;

				if UpdFreeFlg then
                begin
					ParamByName('VFree1' ).AsString		:= freeItem.VFree1;
					ParamByName('VFree2' ).AsString		:= freeItem.VFree2;
					ParamByName('VFree3' ).AsString		:= freeItem.VFree3;
					ParamByName('VFree4' ).AsString		:= freeItem.VFree4;
					ParamByName('VFree5' ).AsString		:= freeItem.VFree5;
					ParamByName('VFree6' ).AsString		:= freeItem.VFree6;
					ParamByName('VFree7' ).AsString		:= freeItem.VFree7;
					ParamByName('VFree8' ).AsString		:= freeItem.VFree8;
					ParamByName('VFree9' ).AsString		:= freeItem.VFree9;
					ParamByName('VFree10').AsString		:= freeItem.VFree10;
					ParamByName('NFree1' ).AsCurrency	:= freeItem.NFree1;
					ParamByName('NFree2' ).AsCurrency	:= freeItem.NFree2;
					ParamByName('NFree3' ).AsCurrency	:= freeItem.NFree3;
					ParamByName('NFree4' ).AsCurrency	:= freeItem.NFree4;
					ParamByName('NFree5' ).AsCurrency	:= freeItem.NFree5;
					ParamByName('NFree6' ).AsCurrency	:= freeItem.NFree6;
					ParamByName('NFree7' ).AsCurrency	:= freeItem.NFree7;
					ParamByName('NFree8' ).AsCurrency	:= freeItem.NFree8;
					ParamByName('NFree9' ).AsCurrency	:= freeItem.NFree9;
					ParamByName('NFree10').AsCurrency	:= freeItem.NFree10;
					if freeItem.DFree1 > 0 then
						ParamByName('DFree1').AsDateTime	:= freeItem.DFree1;
					if freeItem.DFree2 > 0 then
						ParamByName('DFree2').AsDateTime	:= freeItem.DFree2;
					if freeItem.DFree3 > 0 then
						ParamByName('DFree3').AsDateTime	:= freeItem.DFree3;
				end;

				ParamByName('BSBumonNCode').AsString		:= m_stMasterData.strExCodeBSAdd;
			// 050915 >>
            end
			// 一覧画面
            else
            begin
				ParamByName('HojyoKbn1'   ).AsInteger	:= 0;
//				ParamByName('HojyoKbn2'   ).AsInteger	:= 0;
				ParamByName('BunCode'     ).AsInteger	:= 0;
				ParamByName('BSBumonNCode').AsString	:= '0';
			// 050915 <<
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

			m_NewRecord	:= True;	//HIS0023

			{内部コード取得}
			Close ();
			SQL.Clear ();
			SQL.Add   ('SELECT @@identity as NCode');
            open();
			if (not EOF) then
				strInCode := FieldByName('NCode'  ).AsString;

			m_stMasterData.strNCode := strInCode;
			if	(m_stMasterData.fDetails) then									// 詳細更新区分: TRUE=あり
				DtlNCode := strInCode;
		end;

//★★★		fnUpdateTreeViewItems (m_stMasterData.nDivision, strExCode, m_stMasterData.strNameSimple, ACCESS_TREE_ADD);
	end
	else																				// 既存ﾚｺｰﾄﾞ (UPDATE)
	begin
		// HojyoMAを消される前にツリーを消す
		if	(m_stMasterData.fDetails) then
		begin
			if ChkPtn1(1) = 1 then
	   		begin
				Result  := FALSE;
				Exit;
            end;
        end;

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
//			SQL.Add   (fnMakeSQLConstructionUpdate (strExCode));
			SQL.Add('UPDATE ' + DEF_HOJYOMA + ' SET        ');					// HIS0009
			SQL.Add('UpdTantoNCode	= :LoginID,            ');
			SQL.Add('InsDateTM	= InsDateTM,               ');
			SQL.Add('Renso		= :Renso,                  ');
			SQL.Add('LongName   = :LongName,               ');
			SQL.Add('SimpleName = :SimpleName,             ');
//			if	(not DtlCmnEditClassCode.InputFlag) then						// 入力された場合のみ
			SQL.Add('HojyoKbn2  = :HojyoKbn2,          ');

//<100215_1>↓
			if (m_stMasterData.nAppDateStart > 0) then						// 入力済み
				strDateStart	:= '''' + IntToStr(m_stMasterData.nAppDateStart) + ''''
			else
				strDateStart	:= '''' + IntToStr(MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE)) + '''';

			if (m_stMasterData.nAppDateEnd > 0) then						// 入力済み
				strDateEnd		:= '''' + IntToStr(m_stMasterData.nAppDateEnd) + ''''
			else
				strDateEnd		:= '''' + IntToStr(MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE)) + '''';
			SQL.Add('TStartDate  = ' + strDateStart + ',');
			SQL.Add('TEndDate    = ' + strDateEnd + ',');
//<100215_1>↑
			SQL.Add('NCode		= :NCode                   ');

			if	(m_stMasterData.fDetails) then													// 詳細更新区分: TRUE=あり
			begin
//<100215_1>↓
////<080214_1>↓
////				if ((m_stMasterData.nAppDateStart > 0) AND (m_stMasterData.nDivision = 0)) then	// 入力済み＆実在
//				if (m_stMasterData.nAppDateStart > 0) then						// 入力済み
////<080214_1>↑
//					strDateStart	:= '''' + IntToStr(m_stMasterData.nAppDateStart) + ''''
//				else
//					strDateStart	:= '''' + IntToStr(MjsDateCtrl.MjsDateToInt8 (DEF_S_DATE)) + '''';
//
////<080214_1>↓
////				if ((m_stMasterData.nAppDateEnd > 0) AND (m_stMasterData.nDivision = 0)) then	// 入力済み＆実在
//				if (m_stMasterData.nAppDateEnd > 0) then						// 入力済み
////<080214_1>↑
//					strDateEnd		:= '''' + IntToStr(m_stMasterData.nAppDateEnd) + ''''
//				else
//					strDateEnd		:= '''' + IntToStr(MjsDateCtrl.MjsDateToInt8 (DEF_E_DATE)) + '''';
//<100215_1>↑

				SQL.Add(',                                 ');
				if	(not DtlCmnEditCharacterCode.InputFlag) then				// 入力された場合のみ
					SQL.Add('HojyoKbn1	= :HojyoKbn1,      ');
				if	(not DtlCmnEditCommonStockDivision.InputFlag) then			// 入力された場合のみ
					SQL.Add('BunCode	= :BunCode,        ');
//<100215_1>↓
//				SQL.Add('TStartDate  = ' + strDateStart + ',');
//				SQL.Add('TEndDate    = ' + strDateEnd + ',  ');
//<100215_1>↑
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.BunruiNCode[i] <> '' then
						SQL.Add('BunruiNCode' + IntToStr(i) + ' = :BunruiNCode' + IntToStr(i) + ',          ');
				end;
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.SegNCode[i] <> '' then
						SQL.Add('SegNCode' + IntToStr(i) + ' = :SegNCode' + IntToStr(i) + ',          ');
				end;
				if UpdFreeFlg then
                begin
					SQL.Add(' VFree1 = :VFree1,  ');
					SQL.Add(' VFree2 = :VFree2,  ');
					SQL.Add(' VFree3 = :VFree3,  ');
					SQL.Add(' VFree4 = :VFree4,  ');
					SQL.Add(' VFree5 = :VFree5,  ');
					SQL.Add(' VFree6 = :VFree6,  ');
					SQL.Add(' VFree7 = :VFree7,  ');
					SQL.Add(' VFree8 = :VFree8,  ');
					SQL.Add(' VFree9 = :VFree9,  ');
					SQL.Add(' VFree10 = :VFree10, ');
					SQL.Add(' NFree1 = :NFree1,  ');
					SQL.Add(' NFree2 = :NFree2,  ');
					SQL.Add(' NFree3 = :NFree3,  ');
					SQL.Add(' NFree4 = :NFree4,  ');
					SQL.Add(' NFree5 = :NFree5,  ');
					SQL.Add(' NFree6 = :NFree6,  ');
					SQL.Add(' NFree7 = :NFree7,  ');
					SQL.Add(' NFree8 = :NFree8,  ');
					SQL.Add(' NFree9 = :NFree9,  ');
					SQL.Add(' NFree10 = :NFree10, ');
					//if freeItem.DFree1 > 0 then
						SQL.Add(' DFree1 = :DFree1,  ');
					//if freeItem.DFree2 > 0 then
						SQL.Add(' DFree2 = :DFree2,  ');
					//if freeItem.DFree3 > 0 then
						SQL.Add(' DFree3 = :DFree3,  ');
				end;
				SQL.Add('BSBumonNCode	= :BSBumonNCode            ');
			end;

			SQL.Add('WHERE                                 ');
			SQL.Add('    Masterkbn	= :Masterkbn           ');
			SQL.Add('and SumKbn		= :SumKbn              ');
			SQL.Add('and RDelKbn    = :RecordKbn           ');
			SQL.Add('and NCode		= :NCode               ');					//0207

			ParamByName('LoginID').AsString			:= m_strLoginNCode;
			ParamByName('Renso').AsString			:= m_stMasterData.strAssociation;
			ParamByName('LongName').AsString		:= m_stMasterData.strName;
			ParamByName('SimpleName').AsString		:= m_stMasterData.strNameSimple;
//			if	(not DtlCmnEditClassCode.InputFlag) then						// 入力された場合のみ
			ParamByName('HojyoKbn2').AsInteger		:= m_stMasterData.nClassCode;
			ParamByName('NCode').AsString			:= TrimRight(strInCode);

			if	(m_stMasterData.fDetails) then													// 詳細更新区分: TRUE=あり
			begin
				if	(not DtlCmnEditCharacterCode.InputFlag) then				// 入力された場合のみ
	            	ParamByName('HojyoKbn1').AsInteger	:= m_stMasterData.nCharacterCode;
				if	(not DtlCmnEditCommonStockDivision.InputFlag) then			// 入力された場合のみ
					ParamByName('BunCode').AsInteger	:= m_stMasterData.nCmnStDivision;
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.BunruiNCode[i] <> '' then
	                begin
    	            	strTmp := 'BunruiNCode' + IntToStr(i);
						ParamByName(strTmp).AsString	:= m_stMasterData.BunruiNCode[i];
                    end;
				end;
                for i := 1 to 10 do
                begin
//0214                	if m_stMasterData.SegNCode[i] <> '' then
	                begin
	                	strTmp := 'SegNCode' + IntToStr(i);
						ParamByName(strTmp).AsString		:= m_stMasterData.SegNCode[i];
                    end;
				end;

				if UpdFreeFlg then
                begin
					ParamByName('VFree1' ).AsString		:= freeItem.VFree1;
					ParamByName('VFree2' ).AsString		:= freeItem.VFree2;
					ParamByName('VFree3' ).AsString		:= freeItem.VFree3;
					ParamByName('VFree4' ).AsString		:= freeItem.VFree4;
					ParamByName('VFree5' ).AsString		:= freeItem.VFree5;
					ParamByName('VFree6' ).AsString		:= freeItem.VFree6;
					ParamByName('VFree7' ).AsString		:= freeItem.VFree7;
					ParamByName('VFree8' ).AsString		:= freeItem.VFree8;
					ParamByName('VFree9' ).AsString		:= freeItem.VFree9;
					ParamByName('VFree10').AsString		:= freeItem.VFree10;
					ParamByName('NFree1' ).AsCurrency	:= freeItem.NFree1;
					ParamByName('NFree2' ).AsCurrency	:= freeItem.NFree2;
					ParamByName('NFree3' ).AsCurrency	:= freeItem.NFree3;
					ParamByName('NFree4' ).AsCurrency	:= freeItem.NFree4;
					ParamByName('NFree5' ).AsCurrency	:= freeItem.NFree5;
					ParamByName('NFree6' ).AsCurrency	:= freeItem.NFree6;
					ParamByName('NFree7' ).AsCurrency	:= freeItem.NFree7;
					ParamByName('NFree8' ).AsCurrency	:= freeItem.NFree8;
					ParamByName('NFree9' ).AsCurrency	:= freeItem.NFree9;
					ParamByName('NFree10').AsCurrency	:= freeItem.NFree10;
					if freeItem.DFree1 > 0 then
						ParamByName('DFree1').AsDateTime	:= freeItem.DFree1
                    else
						ParamByName('DFree1').AsDateTime	:= 0;
					if freeItem.DFree2 > 0 then
						ParamByName('DFree2').AsDateTime	:= freeItem.DFree2
                    else
						ParamByName('DFree2').AsDateTime	:= 0;
					if freeItem.DFree3 > 0 then
						ParamByName('DFree3').AsDateTime	:= freeItem.DFree3
					else
						ParamByName('DFree3').AsDateTime	:= 0;
				end;

				ParamByName('BSBumonNCode').AsString		:= m_stMasterData.strExCodeBSAdd;
  			end;

			ParamByName('MasterKbn').AsInteger		:= m_nCurrentMasterDiv;
			ParamByName('SumKbn').AsInteger			:= m_stMasterData.nDivision;
			ParamByName('RecordKbn').AsInteger		:= 0;
//			ParamByName('GCode').AsString			:= TrimRight(strExCode);

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

//★★★		fnUpdateTreeViewItems (m_stMasterData.nDivision, strExCode, m_stMasterData.strNameSimple, ACCESS_TREE_UPDATE);
	end;
//  <マスタ同期>---Begin---
	if IsChild() then							// 子会社
	begin

// <012> MOD start
//		fnSYNC();								// 子会社に同期
                                   				// 表示区分を表示で更新する
	    if not fnWriteData_SecHojyo(strToFloat(m_stMasterData.strNCode), 1) then
        begin
            dqMasterData.Close();
			dqMasterData.Free();
            Result := False;
            Exit;
        end;
													// 子会社に同期
		if not m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) then
		begin
            dqMasterData.Close();
			dqMasterData.Free();
			Result := False;
            Exit;
		end ;
// <012> MOD end


	end;
//  <マスタ同期>--- End ---

	UpdFreeFlg := False;	// フリー項目未更新

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;															// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDeleteMasterRecord (Integer; Integer)                               */
//*																									*/
//*	目的	: 部門登録処理 部門ﾏｽﾀ削除					                                   		    */
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計)										*/
//*           nInCode		= 部門内部ｺｰﾄﾞ！														*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDeleteMasterRecord (nSumDivision: Integer; nInCode: String);
var
	fReturn: Boolean;

begin
	m_cDataModule.BeginTran (m_cDBSelect);										// ﾄﾗﾝｻﾞｸｼｮﾝ開始

//<080214_2>↓
	SessionPractice(C_ST_PROCESS);
	try
//<080214_2>↑
		fReturn	:= fnDeleteMasterTreeRecord (nSumDivision, nInCode);				// 部門加算体系ﾏｽﾀ更新

		if	(not fReturn) then														// ｴﾗｰ
		begin
			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
			Exit;
		end;

		fReturn	:= fnDeleteMasterDataRecord (nSumDivision, nInCode);				// 部門基本ﾏｽﾀ更新

		if	(not fReturn) then														// ｴﾗｰ
		begin
			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);                                   // ﾛｰﾙﾊﾞｯｸ(破棄)
			Exit;
		end;

		fReturn	:= fnDeleteMasterDataAddition (nInCode);							// その他ﾏｽﾀ削除

		if	(not fReturn) then
		begin
			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
			Exit;
		end;
//<080214_2>↓
	finally
		SessionPractice(C_ED_PROCESS);
	end;
//<080214_2>↑

    m_cDataModule.Commit (m_cDBSelect);                                         // ｺﾐｯﾄ(反映)

//	fnDeleteTreeViewItems (strExCode);
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDeleteMasterTreeRecord (Integer; Integer)									*/
//*																											*/
//*	目的	: 部門登録処理 部門加算体系ﾏｽﾀ削除																*/
//*																											*/
//*	戻り値	: Boolean, (TREU=正常終了, FALSE=異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)													*/
//*           NCode     = 内部ｺｰﾄﾞ																			*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnDeleteMasterTreeRecord (nDivision: Integer; NCode: String): Boolean;
var
	dqMasterTree	  : TMQuery;
	dqMasterDate	  : TMQuery;
//<090407>↓
//	delNCode		  : String;
//<090407>↑
	delBaseNCode	  : String;
	pos				  : Integer;
	i				  : Integer;

begin
	pos := 0;									//070309 HIROTA
	if m_nCurrentMasterDiv = 41 then
		pos := 0
	//<002> ↓
	{
	else
		pos := m_nCurrentMasterDiv - MK_SEG01 + 1;
	}
	else if m_nCurrentMasterDiv = 101 then
		pos := m_nCurrentMasterDiv - MK_SEG01 + 1;
	//<002> ↑
	
	dqMasterTree		:= TMQuery.Create (Self);		// 050606
	dqMasterDate		:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree      );				// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterDate      );				// DBとMQueryの接続

	with (dqMasterDate) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT 0 as NewKbn,t2.NCode, t2.BaseNCode ');
		SQL.Add   ('FROM ' + DEF_HAPTLR2 + ' t2, ' + DEF_HAPTLR + ' t1, ' + DEF_HOJYOMA + ' ma ');
		SQL.Add   ('WHERE ma.MasterKbn = :MasterKbn AND ma.NCode = :NCode ');
		SQL.Add   ('  AND ma.RDelKbn = 0 ');
		SQL.Add   ('  AND ma.MasterKbn = t1.MasterKbn ');
		SQL.Add   ('  AND t1.NCode = t2.BaseNCode ');
		SQL.Add   ('  AND ma.NCode = t2.DeptNCode ');

		SQL.Add   ('UNION ALL');

		SQL.Add   ('SELECT 1 as NewKbn,t2.NCode, t2.BaseNCode ');
		SQL.Add   ('FROM ' + DEF_HAPTLR2 + 'Nx t2, ' + DEF_HAPTLR + 'Nx t1, ' + DEF_HOJYOMA + ' ma ');
		SQL.Add   ('WHERE ma.MasterKbn = :MasterKbn AND ma.NCode = :NCode ');
		SQL.Add   ('  AND ma.RDelKbn = 0 ');
		SQL.Add   ('  AND ma.MasterKbn = t1.MasterKbn ');
		SQL.Add   ('  AND t1.NCode = t2.BaseNCode ');
		SQL.Add   ('  AND ma.NCode = t2.DeptNCode ');


		ParamByName ('MasterKbn').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('NCode'	).AsString	:= NCode;

		Open ();

		while (not EOF) do
		begin
//<090407>↓
//			delNCode := FieldByName('NCode').AsString;
//<090407>↑
			delBaseNCode := FieldByName('BaseNCode').AsString;
//<090407>↓
//			with (dqMasterTree) do
//			begin
//				Close ();
//
//				SQL.Clear ();
//				SQL.Add   ('DELETE FROM ' + DEF_HAPTLR2 + ' ');
//				SQL.Add   ('WHERE NCode = :NCode ');
//				SQL.Add   ('  AND BaseNCode = :BaseNCode ');
//
//				ParamByName ('NCode').AsString	:= delNCode;
//				ParamByName ('BaseNCode').AsString	:= delBaseNCode;
//
//				if	(not ExecSQL ()) then
//				begin
//					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);
//
//					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);
//
//					dqMasterDate.Free ();
//					dqMasterTree.Free ();
//
//					Result	:= FALSE;
//					Exit;
//				end;
//			end;
			if FieldByName('NewKbn').AsInteger = 0 then
				m_DelRecord	:= True
			else
				m_DelRecordN:= True;
//<090407>↑



			//<002> ↓
			if (m_nCurrentMasterDiv = 41) or (m_nCurrentMasterDiv = 101) then
			begin
			//<002> ↑
				m_bHojyoTreeDelete [pos]	:= 1;
				m_bHojyoTree2	   [pos]	:= 1;
			end;

			if Length (arBaseNCode) = 0 then
			begin
				SetLength (arBaseNCode, Length (arBaseNCode) + 1);
				arBaseNCode[0] := delBaseNCode;
			end
			else
			begin
				for i := 0 to Length (arBaseNCode) do
				begin
					if i = Length (arBaseNCode) then
					begin
						SetLength (arBaseNCode, Length (arBaseNCode) + 1);
						arBaseNCode[i] := delBaseNCode;
						break;
					end;
					if arBaseNCode[i] = delBaseNCode then
						break;
				end;
			end;
			NEXT;
		end;
	end;

	Result	:= TRUE;															// 正常終了

	dqMasterDate.Free ();
	dqMasterTree.Free ();
end;



//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDeleteMasterDataRecord (Integer; Integer)                           */
//*																									*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (TRUE:正常終了, FALSE:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)                                  		    */
//*           nInCode = 部門内部ｺｰﾄﾞ！                                                            	*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnDeleteMasterDataRecord (nDivision: Integer; nInCode: String): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

//  <マスタ同期>---Begin---
	if IsChild() then							// 子会社の場合
	begin
		// 全社に接続
		m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);					// DBとMQueryの接続
	end
	else										// 全社orグループ管理なし
	begin
		// 自社に接続
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続
	end;
//  <マスタ同期>--- End ---

	//  <マスタ同期>---Begin---
	if not IsChild() then						// 全社orグループ管理なしの場合
	begin
	  // HojyoMAを削除する
	//  <マスタ同期>--- End ---
	  with (dqMasterData) do
	  begin
{
		//	削除するﾚｺｰﾄﾞの内部ｺｰﾄﾞを取得	HIS0005
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       RecordKbn = 0 AND SumKbn = :nSumDivision AND NCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('nSumDivision'   ).AsInteger	:= nDivision;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
			nInCode	:= FieldByName('NCode').AsInteger;
}
		Close ();

		SQL.Clear ();
		SQL.Add   ('UPDATE ' + DEF_HOJYOMA + ' SET RDelKbn = 1');			//	HIS0005
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       RDelKbn = 0 AND SumKbn = :nSumDivision AND NCode = :nInCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('nSumDivision'   ).AsInteger	:= nDivision;
		ParamByName ('nInCode'        ).AsString	:= nInCode;

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
	//  <マスタ同期>---Begin---
	end
	else										// 子会社の場合
	begin
		// Relのみを削除し、同期する
		if not fnWriteData_Rel(StrToInt64(nInCode), m_nCurrentMasterDiv, dqMasterData, 1) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;
	end;
//  <マスタ同期>--- End ---

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= TRUE;																// 正常終了
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDeleteMasterDataAddition (Integer; String)								*/
//*																									*/
//*	目的	: 部門登録処理 その他ﾏｽﾀ削除				                                 		    */
//*																									*/
//*	戻り値	: Boolean, (True:正常終了, False:異常終了)	                                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門内部ｺｰﾄﾞ！															*/
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnDeleteMasterDataAddition (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM MFusenInfo WHERE MasterKbn = :nMasterDivision AND NCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

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
//*																											*/
//*	関数	: TJNTCRP0020030f.fnUpdateMasterDataTagInfoEx (String; var Integer; String)							*/
//*																											*/
//*	目的	: 部門登録処理 ﾏｽﾀ付箋管理情報更新																*/
//*																											*/
//*	戻り値	: なし, 																						*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode		= 部門内部ｺｰﾄﾞ！																*/
//*           nTagKind  	= 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)										*/
//*			  strTagComment	= 付箋ｺﾒﾝﾄ																		*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnUpdateMasterDataTagInfoEx (strExCode: String; var nTagKind: Integer; strTagComment: String);
var
	dqMasterData: TMQuery;
	fNewRecord	: Boolean;

begin
	m_cDataModule.BeginTran (m_cDBSelect);										// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT * FROM MFusenInfo WHERE MasterKbn = :nMasterDivision and NCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if  (not EOF) then
		begin
			if	((nTagKind = 0) or (FieldByName('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind	:= 0;

				Close ();

				SQL.Clear ();
				SQL.Add   ('DELETE FROM MFusenInfo WHERE MasterKbn = :nMasterDivision and NCode = :strExCode');

				ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				ParamByName ('strExCode'      ).AsString	:= strExCode;

				if	(not ExecSQL ()) then
				begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

					fnOutputDBErrorMessage ();

					m_cDataModule.Rollback (m_cDBSelect);								// ﾛｰﾙﾊﾞｯｸ(破棄)
				end
				else																// 正常
					m_cDataModule.Commit (m_cDBSelect);								// ｺﾐｯﾄ(反映)

				dqMasterData.Close ();
				dqMasterData.Free  ();
				Exit;
			end
			else
				fNewRecord	:= False;
		end
		else
			fNewRecord	:= True;

		Close ();

		if	(nTagKind = 0) then
		begin
			dqMasterData.Free ();
			Exit;
		end;

		Close ();

		SQL.Clear;

		if	(fNewRecord) then
		begin
			Close ();
			SQL.ADD ('INSERT INTO MFusenInfo (MasterKbn, SubNCode, NCode, FusenKbn, FusenCmnt) ');
			SQL.ADD ('VALUES (:nMasterDivision, 0, :strExCode, :nTagDivision, :strTagComment)');
		end
		else
		begin
			SQL.ADD ('UPDATE MFusenInfo SET FusenKbn = :nTagDivision, FusenCmnt = :strTagComment ');
			SQL.ADD ('WHERE MasterKbn = :nMasterDivision and NCode = :strExCode');
		end;

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;
		ParamByName ('nTagDivision'   ).AsInteger   := nTagKind;
		ParamByName ('strTagComment'  ).AsString	:= strTagComment;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterData .Close    ();
			dqMasterData .Free	   ();
			Exit;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);												// ｺﾐｯﾄ(反映)
	dqMasterData .Close  ();
	dqMasterData .Free   ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnUpdateDetailIndInfo ()													*/
//*																									*/
//*	目的	: 部門登録処理 各種管理情報更新															*/
//*																									*/
//*	戻り値	: なし,                                                 		                        */
//*																									*/
//***************************************************************************************************/
procedure   TJNTCRP0020030f.fnUpdateDetailIndInfo ();
var
	strExCode: String;

begin
	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnPrintCheckListExtStandard ()			                                */
//*																									*/
//*	目的	: 部門登録処理 実在xxxx登録ﾘｽﾄ印刷処理													*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnPrintCheckListExtStandard ();
var
	dqMasterData: TMQuery;
	strBmnCode	: String;
	strFormat	: String;

	strWorkExCode:	String;
	strWorkName	:	String;
   	strWorkInCode: String;

//	b_Start		: Boolean;	//HIS0021
//	b_End		: Boolean;	//HIS0021
begin
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	//HIS0022
	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
//0722		if	(m_nCurrentMasterDiv = 41) 													// 部門
//0722		OR ((101 <= m_nCurrentMasterDiv) AND (m_nCurrentMasterDiv <= 111)) then			// セグメント
//0722		begin
			CmnReportExtStandardDepDBTextCode.Alignment	:= taRightJustify;
			CmnReportExtStandardDepDBTextCode_DEP.Alignment	:= taRightJustify;				//<MLXDEP>
          	CmnReportExtStandardBSBumonCode.Alignment	:= taRightJustify;
//0722		end
//0722		else																			// ｾｸﾞﾒﾝﾄ
//0722			CmnReportExtStandardSegDBTextCode.Alignment	:= taRightJustify;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
//0722		if	(m_nCurrentMasterDiv = 41) 													// 部門
//0722		OR ((101 <= m_nCurrentMasterDiv) AND (m_nCurrentMasterDiv <= 111)) then			// セグメント
//0722		begin
			CmnReportExtStandardDepDBTextCode.Alignment	:= taLeftJustify;
			CmnReportExtStandardDepDBTextCode_DEP.Alignment	:= taLeftJustify;				//<MLXDEP>
        	CmnReportExtStandardBSBumonCode.Alignment	:= taLeftJustify;
//0722		end
//0722		else																			// ｾｸﾞﾒﾝﾄ
//0722			CmnReportExtStandardSegDBTextCode.Alignment	:= taLeftJustify;
	end;

{	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		if	(m_nCurrentMasterDiv = 41) then												// 部門
			CmnReportExtStandardDepDBTextCode.Alignment	:= taRightJustify
		else																			// ｾｸﾞﾒﾝﾄ
			CmnReportExtStandardSegDBTextCode.Alignment	:= taRightJustify;
	end
	else																				// ｺｰﾄﾞ属性: 文字
	begin
		if	(m_nCurrentMasterDiv = 41) then												// 部門
			CmnReportExtStandardDepDBTextCode.Alignment	:= taLeftJustify
		else																			// ｾｸﾞﾒﾝﾄ
			CmnReportExtStandardSegDBTextCode.Alignment	:= taLeftJustify;
	end;
}
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.TStartDate, hm.TEndDate, ');
		SQL.Add   ('       hm.UpdDateTM, hm.HojyoKbn1, hm.HojyoKbn2, hm.BunCode, hm.BSBumonNCode, fi.FusenKbn ');
		SQL.Add   ('FROM   ' + DEF_HOJYOMA + ' hm LEFT OUTER JOIN MFusenInfo fi');
		SQL.Add   ('ON     hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
		SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and hm.RDelKbn = 0 ');

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

		// 適用期間による絞込 050901 >>
		SQL.Add   ('and hm.TStartDate <= :EdD ');							// 指定した期間より後に開始していない
		SQL.Add   ('and hm.TEndDate   >= :StD ');							// 指定した期間より前に終了していない
		// 適用期間による絞込 050901 <<

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY Renso, GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		// 適用期間による絞込 050901 >>
		ParamByName ('EdD'  ).AsInteger	:= uvHani.pvrEdDate;
		ParamByName ('StD'  ).AsInteger	:= uvHani.pvrStDate;
		// 適用期間による絞込 050901 <<

		Open ();

		CmnMemDataPrintExtStandard.Active	:= FALSE;
		CmnMemDataPrintExtStandard.Active	:= TRUE;

		while (not EOF) do
		begin
			CmnMemDataPrintExtStandard.Append ();

			strBmnCode	:= FieldByName('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strBmnCode	:= Format (strFormat, [StrToInt64 (Trim (strBmnCode))]);
			end;


			//HIS0022
			strWorkName		:= '';
			if ((FieldByName('BSBumonNCode').IsNull) OR (FieldByName('BSBumonNCode').AsString = '0')) then
				CmnMemDataPrintExtStandard.FieldByName('strExCodeBSAdd').AsString	:= ''
			else
			begin
				strWorkInCode	:= FieldByName('BSBumonNCode').AsString;

				fnCheckRegistBSAddDepartment2 (strWorkInCode, strWorkName, strWorkExCode);
				CmnMemDataPrintExtStandard.FieldByName('strExCodeBSAdd').AsString	:= strWorkExCode;
			end;

    		CmnMemDataPrintExtStandard.FieldByName('strNameSimpleBSAdd').AsString	:= strWorkName;


			CmnMemDataPrintExtStandard.FieldByName('grTag'           ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			CmnMemDataPrintExtStandard.FieldByName('strExCode'       ).AsString	:= strBmnCode;
			CmnMemDataPrintExtStandard.FieldByName('strAssociation'  ).AsString	:= GetFld ('Renso'     ).AsString;
			CmnMemDataPrintExtStandard.FieldByName('strName'         ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintExtStandard.FieldByName('strNameSimple'   ).AsString	:= GetFld ('SimpleName').AsString;
			CmnMemDataPrintExtStandard.FieldByName('strClassDesc'    ).AsString	:= fnGetClassDescription     (GetFld ('HojyoKbn2').AsInteger, DESCRIPTION_PRINT);
			CmnMemDataPrintExtStandard.FieldByName('strCharacterDesc').AsString	:= fnGetCharacterDescription (GetFld ('HojyoKbn1').AsInteger, DESCRIPTION_PRINT);
			CmnMemDataPrintExtStandard.FieldByName('strCmnStockDesc' ).AsString	:= fnGetCmnStockDescription  (GetFld ('BunCode'  ).AsInteger, DESCRIPTION_PRINT);

			if	(not GetFld ('TStartDate' ).IsNull) AND (GetFld ('TStartDate' ).AsDateTime <> DEF_S_DATE) then
				CmnMemDataPrintExtStandard.FieldByName('dtAppDateStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldByName('dtAppDateStart').Clear;

			if	(not GetFld ('TEndDate'   ).IsNull)  AND (GetFld ('TEndDate' ).AsDateTime <> DEF_E_DATE)then
				CmnMemDataPrintExtStandard.FieldByName('dtAppDateEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldByName('dtAppDateEnd'  ).Clear;

//<100215_2>↓
			CmnMemDataPrintExtStandard.FieldByName('dtAppDateStartDisp').AsString	:= DateToStrTmp(GetFld('TStartDate' ).AsDateTime, 'S');
			CmnMemDataPrintExtStandard.FieldByName('dtAppDateEndDisp'  ).AsString	:= DateToStrTmp(GetFld('TEndDate'   ).AsDateTime, 'E');
//<100215_2>↑

			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDate'  ).AsDateTime	:= GetFld ('UpdDateTM').AsDateTime
			else
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDate'  ).Clear;

//<100215_2>↓
			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDateDisp').AsString	:= DateToStrTmp(GetFld ('UpdDateTM').AsDateTime)
																						 + FormatDateTime(' hh:mm:ss', GetFld ('UpdDateTM').AsDateTime)
			else
				CmnMemDataPrintExtStandard.FieldByName('dtUpdateDateDisp').AsString	:= '';
//<100215_2>↑

			CmnMemDataPrintExtStandard.Post ();

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnPrintCheckListTtlStandard ()			                                */
//*																									*/
//*	目的	: 部門登録処理 合計xxxx登録ﾘｽﾄ印刷処理													*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnPrintCheckListTtlStandard ();
var
	dqMasterData: TMQuery;
	strBmnCode	: String;
	strFormat	: String;

//	b_Start		: Boolean;	//HIS0021
//	b_End		: Boolean;	//HIS0021
begin
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then
		CmnReportTtlStandardDBTextCode.Alignment	:= taRightJustify
	else
		CmnReportTtlStandardDBTextCode.Alignment	:= taLeftJustify;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		SQL.ADD ('SELECT hm.GCode, hm.Renso, hm.LongName, hm.SimpleName, hm.UpdDateTM, fi.FusenKbn ');
//<100215_2>↓
		SQL.ADD (', hm.TStartDate, hm.TEndDate ');
//<100215_2>↑
		SQL.ADD ('FROM   ' + DEF_HOJYOMA + ' hm LEFT OUTER JOIN MFusenInfo fi');
		SQL.ADD ('ON     hm.MasterKbn = fi.MasterKbn and hm.NCode = fi.NCode ');
		if ((87 <= m_nCurrentMasterDiv) AND (m_nCurrentMasterDiv <= 89)) then			// 役職～職位
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn = 0 and hm.RDelKbn = 0 ')
		else if (m_nCurrentMasterDiv = 86) then											// 職種
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision and hm.RDelKbn = 0 ')
        else
			SQL.Add   ('WHERE  hm.MasterKbn = :nMasterDivision and hm.SumKbn <> 0 and hm.RDelKbn = 0 ');

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

		// 適用期間による絞込 050901 >>
		SQL.Add   ('and hm.TStartDate <= :EdD ');							// 指定した期間より後に開始していない
		SQL.Add   ('and hm.TEndDate   >= :StD ');							// 指定した期間より前に終了していない
		// 適用期間による絞込 050901 <<

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		// 適用期間による絞込 050901 >>
		ParamByName ('EdD'  ).AsInteger	:= uvHani.pvrEdDate;
		ParamByName ('StD'  ).AsInteger	:= uvHani.pvrStDate;
		// 適用期間による絞込 050901 <<

		Open ();

		CmnMemDataPrintTtlStandard.Active	:= FALSE;
		CmnMemDataPrintTtlStandard.Active	:= TRUE;

		while (not EOF) do
		begin
			CmnMemDataPrintTtlStandard.Append ();

			strBmnCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strBmnCode	:= Format (strFormat, [StrToInt64 (Trim (strBmnCode))]);
			end;

			CmnMemDataPrintTtlStandard.FieldByName('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
			CmnMemDataPrintTtlStandard.FieldByName('strExCode'     ).AsString	:= strBmnCode;
			CmnMemDataPrintTtlStandard.FieldByName('strAssociation').AsString	:= GetFld ('Renso'   ).AsString;
			CmnMemDataPrintTtlStandard.FieldByName('strName'       ).AsString	:= GetFld ('LongName'  ).AsString;
			CmnMemDataPrintTtlStandard.FieldByName('strNameSimple' ).AsString	:= GetFld ('SimpleName').AsString;

//<100215_2>↓
			if	(not GetFld ('TStartDate' ).IsNull) AND (GetFld ('TStartDate' ).AsDateTime <> DEF_S_DATE) then
				CmnMemDataPrintTtlStandard.FieldByName('dtAppDateStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintTtlStandard.FieldByName('dtAppDateStart').Clear;

			if	(not GetFld ('TEndDate'   ).IsNull)  AND (GetFld ('TEndDate' ).AsDateTime <> DEF_E_DATE)then
				CmnMemDataPrintTtlStandard.FieldByName('dtAppDateEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintTtlStandard.FieldByName('dtAppDateEnd'  ).Clear;

			CmnMemDataPrintTtlStandard.FieldByName('dtAppDateStartDisp').AsString	:= DateToStrTmp(GetFld('TStartDate' ).AsDateTime, 'S');
			CmnMemDataPrintTtlStandard.FieldByName('dtAppDateEndDisp'  ).AsString	:= DateToStrTmp(GetFld('TEndDate'   ).AsDateTime, 'E');
//<100215_2>↑
			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintTtlStandard.FieldByName('dtUpdateDate').AsDateTime	:= GetFld ('UpdDateTM').AsDateTime
			else
				CmnMemDataPrintTtlStandard.FieldByName('dtUpdateDate').Clear;

//<100215_2>↓
			if	(not GetFld ('UpdDateTM').IsNull) then
				CmnMemDataPrintTtlStandard.FieldByName('dtUpdateDateDisp').AsString	:= DateToStrTmp(GetFld ('UpdDateTM').AsDateTime)
																						 + FormatDateTime(' hh:mm:ss', GetFld ('UpdDateTM').AsDateTime)
			else
				CmnMemDataPrintTtlStandard.FieldByName('dtUpdateDateDisp').AsString	:= '';
//<100215_2>↑

			CmnMemDataPrintTtlStandard.Post ();

			NEXT;
		end;

		Close ();
	end;


	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnPrintCheckListSystem ()					                                */
//*																									*/
//*	目的	: 部門登録処理 分類・セグメントﾘｽﾄ印刷処理															*/
//*																									*/
//*	戻り値	: なし,                         						                                */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnPrintCheckListSystem ():Boolean;
var
	dqMasterData: TMQuery;
	strExCode	: String;
	strFormat	: String;
    i,j			: Integer;
    tmpLabel	: TppLabel;
    tmpLabel2	: TppDBText;

begin
	Result := False;
	if	((m_cPrnSupport.iCommand <> PDLG_PRINT  ) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	// 部門コード
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
			else                  				// 070309 HIROTA
				tmpLabel := ppSeg1;				// 070309 HIROTA
		end;
		tmpLabel.Text := '';													// タイトル削除
		case (i) of
			1:	tmpLabel := ppBun1;
			2:	tmpLabel := ppBun2;
			3:	tmpLabel := ppBun3;
			4:	tmpLabel := ppBun4;
			5:	tmpLabel := ppBun5;
			else                  				// 070309 HIROTA
				tmpLabel := ppBun1;				// 070309 HIROTA
		end;
    	tmpLabel.Text := '';													// タイトル削除
	end;

	// セグメント
	for i:=1 to 10 do
    begin
		j := m_stSelectItem [i].nMasterDivision;
		tmpLabel2 := ppDBSeg1;					//070309 HIROTA
		tmpLabel  := ppSeg1;					//070309 HIROTA
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
        	Result := True;								// 採用あり
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
        	Result := True;								// 採用あり
        	tmpLabel.Text := m_stBunruiItem [i].strItemCaption;
			if	(m_stBunruiItem [i].nCodeAttribute <= 1) then													// ｺｰﾄﾞ属性: 数字
				tmpLabel2.Alignment	:= taRightJustify
			else																				// ｺｰﾄﾞ属性: 文字
				tmpLabel2.Alignment	:= taLeftJustify;
		end;
	end;
   	if (not Result) then								// 一つも採用ない
    begin
//<000001>↓
//		MjsMessageBox(Self,'分類とセグメントが採用されていません。', mjError, mjDefOk);
		MJSMessageBoxEx(Self,'分類とセグメントが採用されていません。', '確認', mjInformation, mjOk, mjDefOk, FALSE);
//<000001>↑
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
		SQL.Add   ('       seg05.GCode As seg05Code, seg05.SimpleName As seg05Name, bun05.GCode As bun05Code, bun05.Nmk As bun05Name  ');
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
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun01 ');
		SQL.Add   ('  ON   bun01.SetNm = 431 and hm.BunruiNCode1 = bun01.NCode and bun01.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun02 ');
		SQL.Add   ('  ON   bun02.SetNm = 432 and hm.BunruiNCode2 = bun02.NCode and bun02.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun03 ');
		SQL.Add   ('  ON   bun03.SetNm = 433 and hm.BunruiNCode3 = bun03.NCode and bun03.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun04 ');
		SQL.Add   ('  ON   bun04.SetNm = 434 and hm.BunruiNCode4 = bun04.NCode and bun04.RDelKbn = 0 ');
        SQL.Add   ('LEFT OUTER JOIN MMEISHO bun05 ');
		SQL.Add   ('  ON   bun05.SetNm = 435 and hm.BunruiNCode5 = bun05.NCode and bun05.RDelKbn = 0 ');

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
        SQL.Add   ('  select * from MMEISHO bun01, MasterInfo ');
		SQL.Add   ('  WHERE bun01.SetNm = 431 and hm.BunruiNCode1 = bun01.NCode and bun01.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = 431 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun02, MasterInfo ');
		SQL.Add   ('  WHERE bun02.SetNm = 432 and hm.BunruiNCode2 = bun02.NCode and bun02.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = 432 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun03, MasterInfo ');
		SQL.Add   ('  WHERE bun03.SetNm = 433 and hm.BunruiNCode3 = bun03.NCode and bun03.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = 433 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun04, MasterInfo ');
		SQL.Add   ('  WHERE bun04.SetNm = 434 and hm.BunruiNCode4 = bun04.NCode and bun04.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = 434 and MasterInfo.UseKbn <> 0 ');
		SQL.Add   (') ');
        SQL.Add   (' OR EXISTS(');
        SQL.Add   ('  select * from MMEISHO bun05, MasterInfo ');
		SQL.Add   ('  WHERE bun05.SetNm = 435 and hm.BunruiNCode5 = bun05.NCode and bun05.RDelKbn = 0 ');
		SQL.Add   ('    AND MasterInfo.MasterKbn = 435 and MasterInfo.UseKbn <> 0 ');
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

		// 適用期間による絞込 050901 >>
		SQL.Add   ('and hm.TStartDate <= :EdD ');							// 指定した期間より後に開始していない
		SQL.Add   ('and hm.TEndDate   >= :StD ');							// 指定した期間より前に終了していない
		// 適用期間による絞込 050901 <<

		if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
			SQL.ADD ('ORDER BY hm.GCode')
		else																	// 印刷範囲指定: 1=連想順
			SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

		// 適用期間による絞込 050901 >>
		ParamByName ('EdD'  ).AsInteger	:= uvHani.pvrEdDate;
		ParamByName ('StD'  ).AsInteger	:= uvHani.pvrStDate;
		// 適用期間による絞込 050901 <<

		Open ();

		CmnMemDataPrintSystem.Active	:= False;
		CmnMemDataPrintSystem.Active	:= True;

		while  (not EOF) do
		begin
			CmnMemDataPrintSystem.Append();

			strExCode	:= GetFld ('GCode').AsString;

			if	(m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
			end;

			CmnMemDataPrintSystem.FieldByName('strExCodeDst').AsString		:= strExCode;
			CmnMemDataPrintSystem.FieldByName('strNameSimpleDst').AsString	:= GetFld ('LongName').AsString;

			if	(not GetFld ('TStartDate' ).IsNull) AND (GetFld ('TStartDate' ).AsDateTime <> DEF_S_DATE) then
				CmnMemDataPrintSystem.FieldByName('dtStart').AsDateTime	:= GetFld ('TStartDate' ).AsDateTime
			else
				CmnMemDataPrintSystem.FieldByName('dtStart').Clear;

			if	(not GetFld ('TEndDate'   ).IsNull)  AND (GetFld ('TEndDate' ).AsDateTime <> DEF_E_DATE)then
				CmnMemDataPrintSystem.FieldByName('dtEnd'  ).AsDateTime	:= GetFld ('TEndDate'   ).AsDateTime
			else
				CmnMemDataPrintSystem.FieldByName('dtEnd'  ).Clear;
//<100215_2>↓
			CmnMemDataPrintSystem.FieldByName('dtStartDisp').AsString	:= DateToStrTmp(GetFld('TStartDate' ).AsDateTime, 'S');
			CmnMemDataPrintSystem.FieldByName('dtEndDisp'  ).AsString	:= DateToStrTmp(GetFld('TEndDate'   ).AsDateTime, 'E');
//<100215_2>↑

			// セグメント
            for i:=1 to 5 do
            begin
				strExCode	:= GetFld ('seg0' + IntToStr(i) + 'Code').AsString;
                if strExCode = '' then							// 未設定
                	continue;

	            for j:=1 to 10 do
    	        begin
                	if i+100 = m_stSelectItem [j].nMasterDivision then
                    	break;
                end;

                if (m_stSelectItem [j].nAdoptDivision = 0)
		        or (SegMa[i] = 0) then										// 採用なし
                	continue;

				if	(m_stSelectItem [j].nCodeAttribute <= 1) then
				begin
					case (m_stSelectItem [j].nCodeAttribute) of
						0:	strFormat	:= '%'  + IntToStr (m_stSelectItem [j].nCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_stSelectItem [j].nCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintSystem.FieldByName('strSeg0' + IntToStr(i) + 'Code').AsString	:= strExCode;
				CmnMemDataPrintSystem.FieldByName('strSeg0' + IntToStr(i) + 'Name').AsString	:= GetFld ('seg0' + IntToStr(i) + 'Name').AsString;
			end;

			// 分類
            for i:=1 to 5 do
            begin
				strExCode	:= GetFld ('bun0' + IntToStr(i) + 'Code').AsString;
                if strExCode = '' then							// 未設定
                	continue;

	            for j:=1 to 10 do
    	        begin
                	if i+430 = m_stBunruiItem [j].nMasterDivision then
                    	break;
                end;

                if m_stBunruiItem [j].nAdoptDivision = 0 then	// 採用なし
                	continue;

				if	(m_stBunruiItem [j].nCodeAttribute <= 1) then
				begin
					case (m_stBunruiItem [j].nCodeAttribute) of
						0:	strFormat	:= '%'  + IntToStr (m_stBunruiItem [j].nCodeDigit) + 'd';
						1:	strFormat	:= '%.' + IntToStr (m_stBunruiItem [j].nCodeDigit) + 'd';
					end;

					strExCode	:= Format (strFormat, [StrToInt64 (Trim (strExCode))]);
				end;

				CmnMemDataPrintSystem.FieldByName('strBun0' + IntToStr(i) + 'Code').AsString	:= strExCode;
				CmnMemDataPrintSystem.FieldByName('strBun0' + IntToStr(i) + 'Name').AsString	:= GetFld ('bun0' + IntToStr(i) + 'Name').AsString;
            end;

			CmnMemDataPrintSystem.Post();

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;

//<100405>↓
//***************************************************************************************************/
//* 																								*/
//*	関数	: TJNTCRP0020030f.fnPrintCheckListFree()												*/
//*																									*/
//*	目的	: 部門登録処理 合計xxxx登録ﾘｽﾄ印刷処理													*/
//*																									*/
//*	戻り値	: なし, 																				*/
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnPrintCheckListFree(PrintPtn : Integer) : Boolean;
var
	dqMasterData: TMQuery;
	strBmnCode	: String;
	strFormat	: String;
	i			: Integer;
	iIdx		: Integer;
	SetNm		: Integer;
	iVIdx		: Integer;
	iNIdx		: Integer;
	iDIdx		: Integer;
	bVFree		: Boolean;
	bNFree		: Boolean;
	bDFree		: Boolean;
	bAdd		: Boolean;
	sFreeTitle	: array[0..2,1..10] of String;
begin
	Result	:= False;

	if	((m_cPrnSupport.iCommand <> PDLG_PRINT	) and
		 (m_cPrnSupport.iCommand <> PDLG_PREVIEW) and (m_cPrnSupport.iCommand <> PDLG_FILE)) then
		Exit;

	if	(m_nCurrentCodeAttr <= 1) then
		CmnReportTtlStandardDBTextCode.Alignment	:= taRightJustify
	else
		CmnReportTtlStandardDBTextCode.Alignment	:= taLeftJustify;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	try
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

		with (dqMasterData) do
		begin
			// フリー項目名称の取得
			if m_nCurrentMasterDiv = 41 then
				SetNm		:=	1120											// MMEISHOマスタ区分 （フリー項目(文字)部門）
			else
				SetNm		:=	1200 + (m_nCurrentMasterDiv - 101) * 10;		// MMEISHOマスタ区分 （フリー項目(文字)セグメント）

			Close ();
			SQL.Clear;
			SQL.ADD('SELECT '
				+		' GCode,'
				+		' Nm '
				+	' FROM MMEISHO '
				+	' WHERE SetNm = :nMasterDivision'
				+	  ' AND RDelKbn = 0'
				+	' ORDER BY GCode');

			for i := 0 to 2 do
			begin
				ParamByName ('nMasterDivision').AsInteger	:= SetNm + i;

				Open();
				while (not EOF) do
				begin
					iIdx	:= GetFld('GCode').AsInteger;
					sFreeTitle[i,iIdx]	:= GetFld ('Nm').AsString;
					Next
				end;

				Close();
			end;

			Close();
			SQL.Clear;
			SQL.Add('SELECT '
				+		' hm.GCode,'
				+		' hm.SimpleName,'
				+		' hm.VFree1,'
				+		' hm.VFree2,'
				+		' hm.VFree3,'
				+		' hm.VFree4,'
				+		' hm.VFree5,'
				+		' hm.VFree6,'
				+		' hm.VFree7,'
				+		' hm.VFree8,'
				+		' hm.VFree9,'
				+		' hm.VFree10,'
				+		' hm.NFree1,'
				+		' hm.NFree2,'
				+		' hm.NFree3,'
				+		' hm.NFree4,'
				+		' hm.NFree5,'
				+		' hm.NFree6,'
				+		' hm.NFree7,'
				+		' hm.NFree8,'
				+		' hm.NFree9,'
				+		' hm.NFree10,'
				+		' hm.DFree1,'
				+		' hm.DFree2,'
				+		' hm.DFree3 '
				+	' FROM ' + DEF_HOJYOMA + ' AS hm');

//<100617>↓
//			case m_nCurrentMasterDiv of
			case ParentMasterDiv of
//<100617>↑
				41,101:			// 部門,セグメント
				begin
					SQL.Add('WHERE hm.MasterKbn = :nMasterDivision '
						+	 ' AND hm.RDelKbn = 0 ');
					if PrintPtn = 3 then	// 実在
						SQL.Add(' AND hm.SumKbn = 0 ')
					else
					if PrintPtn = 4 then	// 合計
						SQL.Add(' AND hm.SumKbn <> 0 ');
				end;
				86:				// 職種
				begin
					SQL.Add('WHERE hm.MasterKbn = :nMasterDivision '
						+	 ' AND hm.RDelKbn = 0 ')
				end;
				87,88,89:		// 役職,職能資格,職位
				begin
					SQL.Add('WHERE hm.MasterKbn = :nMasterDivision '
						+	 ' AND hm.SumKbn = 0 '
						+	 ' AND hm.RDelKbn = 0 ');
				end;
			end;

			// コードによる範囲指定
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

			// 適用期間による絞込
			SQL.Add(' AND hm.TStartDate <= :EdD ');									// 指定した期間より後に開始していない
			SQL.Add(' AND hm.TEndDate   >= :StD ');									// 指定した期間より前に終了していない

			if	(m_nOrderDivision = 0) then											// 印刷範囲指定: 0=ｺｰﾄﾞ順
				SQL.ADD ('ORDER BY hm.GCode')
			else																	// 印刷範囲指定: 1=連想順
				SQL.ADD ('ORDER BY hm.Renso, hm.GCode');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

			// 適用期間による絞込
			ParamByName ('EdD').AsInteger	:= uvHani.pvrEdDate;
			ParamByName ('StD').AsInteger	:= uvHani.pvrStDate;

			Open ();

			CmnMemDataPrintFree.Active	:= FALSE;
			CmnMemDataPrintFree.Active	:= TRUE;

			while (not EOF) do
			begin
				bAdd	:= False;
				iVIdx	:= 0;
				iNIdx	:= 0;
				iDIdx	:= 0;

				while ((iVIdx < 10)
				   or  (iNIdx < 10)
				   or  (iDIdx <  3)) do
				begin
					bVFree	:= False;
					bNFree	:= False;
					bDFree	:= False;

					while ((iVIdx < 10) and (bVFree = False)) do
					begin
						Inc(iVIdx);
						if GetFld('VFree' + IntToStr(iVIdx)).AsString <> '' then
							bVFree	:= True;
					end;
					while ((iNIdx < 10) and (bNFree = False)) do
					begin
						Inc(iNIdx);
						if GetFld('NFree' + IntToStr(iNIdx)).AsInteger <> 0 then
							bNFree	:= True;
					end;
					while ((iDIdx < 3) and (bDFree = False)) do
					begin
						Inc(iDIdx);
						if	(not GetFld('DFree' + IntToStr(iDIdx)).IsNull)
						and (GetFld('DFree' + IntToStr(iDIdx)).AsDateTime <> 0) then
							bDFree	:= True;
					end;

					if bVFree or bNFree or bDFree then
					begin
						bAdd	:= True;
						Result	:= True;

						CmnMemDataPrintFree.Append ();
						strBmnCode	:= GetFld ('GCode').AsString;
						if	(m_nCurrentCodeAttr <= 1) then
						begin
							case (m_nCurrentCodeAttr) of
								0:	strFormat	:= '%'	+ IntToStr (m_nCurrentCodeDigit) + 'd';
								1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
							end;

							strBmnCode	:= Format (strFormat, [StrToInt64 (Trim (strBmnCode))]);
						end;
						CmnMemDataPrintFree.FieldByName('strExCode').AsString		:= strBmnCode;
						CmnMemDataPrintFree.FieldByName('strNameSimple').AsString	:= GetFld ('SimpleName').AsString;

						if bVFree = True then
						begin
							CmnMemDataPrintFree.FieldByName('strVFreeTitle').AsString	:= sFreeTitle[0,iVIdx];
							CmnMemDataPrintFree.FieldByName('strVFree').AsString		:= GetFld('VFree' + IntToStr(iVIdx)).AsString;
						end
						else
						begin
							CmnMemDataPrintFree.FieldByName('strVFreeTitle').AsString	:= '';
							CmnMemDataPrintFree.FieldByName('strVFree').AsString		:= '';
						end;

						if bNFree = True then
						begin
							CmnMemDataPrintFree.FieldByName('strNFreeTitle').AsString	:= sFreeTitle[1,iNIdx];
							CmnMemDataPrintFree.FieldByName('strNFree').AsString		:= Format ('%9.3f', [GetFld('NFree' + IntToStr(iNIdx)).AsCurrency]);
						end
						else
						begin
							CmnMemDataPrintFree.FieldByName('strNFreeTitle').AsString	:= '';
							CmnMemDataPrintFree.FieldByName('strNFree').AsString		:= '';
						end;

						if bDFree = True then
						begin
							CmnMemDataPrintFree.FieldByName('strDFreeTitle').AsString	:= sFreeTitle[2,iDIdx];
							CmnMemDataPrintFree.FieldByName('strDFree').AsString		:= DateToStrTmp(GetFld('DFree' + IntToStr(iDIdx)).AsDateTime);
							CmnMemDataPrintFree.FieldByName('dtDFree').AsDateTime		:= GetFld('DFree' + IntToStr(iDIdx)).AsDateTime;
						end
						else
						begin
							CmnMemDataPrintFree.FieldByName('strDFreeTitle').AsString	:= '';
							CmnMemDataPrintFree.FieldByName('strDFree').AsString		:= '';
							CmnMemDataPrintFree.FieldByName('dtDFree').Clear;
						end;
						CmnMemDataPrintFree.FieldByName('bCodeBreak').AsBoolean := False;
						CmnMemDataPrintFree.Post ();
					end;
				end;

				if bAdd = True then
				begin
					CmnMemDataPrintFree.Edit();
					CmnMemDataPrintFree.FieldByName('bCodeBreak').AsBoolean := True;
					CmnMemDataPrintFree.Post();
				end;
				NEXT;
			end;

			Close ();
		end;
	finally
		dqMasterData.Free();
	end;
end;
//<100405>↑

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCmnReportDetailsppDBTextExCodeBSAddOnPrint (TObject)					*/
//*																									*/
//*	目的	: 部門登録処理 詳細ﾘｽﾄ OnPrint ｲﾍﾞﾝﾄ													*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnReportDetailsppDBTextExCodeBSAddOnPrint (Sender: TObject);
var
	cDBTextExCode: TppDBText;

begin
	cDBTextExCode	:= Sender as TppDBText;

	cDBTextExCode.Visible	:= True;

	if	(Trim (cDBTextExCode.Text) = '') then
		cDBTextExCode.Visible	:= False
	else
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			if	(StrToInt64 (Trim (cDBTextExCode.Text)) = 0) then
				cDBTextExCode.Visible	:= False
		end;
	end;
end;


procedure	TJNTCRP0020030f.fnCmnReportSystemColumnFooterOnAffterPrint (Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;


procedure	TJNTCRP0020030f.fnCmnReportSystemOnEndPage (Sender: TObject);
begin
	m_strExCodePrint	:= '';
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCheckRequisiteItem (Integer, Integer, Integer, Integer)							*/
//*																											*/
//*	目的	: 補助登録処理 必須登録ｱｲﾃﾑ･ﾁｪｯｸ																*/
//*																											*/
//*	戻り値	: Integer,																						*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nPrcDivision		= 処理区分	(0:総合計, 1:諸口)												*/
//*			  nMasterDivision	= ﾏｽﾀ 区分																	*/
//*			  nCodeDigit		= ｺｰﾄﾞ桁数																	*/
//*			  nCodeAttribute	= ｺｰﾄﾞ属性																	*/
//*                                                                     		                            */
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRequisiteItem (nPrcDivision: Integer;
								nMasterDivision: Integer; nCodeDigit: Integer; nCodeAttribute: Integer): Integer;
var
	dqMasterData : TMQuery;
	cDlgRequisite: TJNTCRP0020032f;
	nReturn		 : Integer;
	fNoRecord    : Boolean;
//  <マスタ同期>---Begin---
	iRet		 : Integer;
//  <マスタ同期>--- End ---
	exNCode : Extended;
begin

	nReturn		:= REQUISITE_OK;
	fNoRecord	:= TRUE;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;

		if	(nPrcDivision = 0) then													// 総合計
			SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and SumKbn = 9 and RDelKbn = 0')
		else																		// ◆◇◆　諸口
			SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and SyokuchiKbn = 1 and RDelKbn = 0');
//			SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and NCode = 0 and RecordKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

		Open ();

		if	(not EOF) then
			fNoRecord	:= FALSE;

		Close ();
	end;

//  <マスタ同期>---Begin---
	if	(fNoRecord) then						// 自社にない
	begin
		if IsChild() then						// 子会社の場合
		begin
			// 全社DBも見てみる
			dqMasterData.Close();
			m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);				// DBとMQueryの接続

			with (dqMasterData) do                                                       	
			begin
				Close ();

				SQL.Clear;

				if	(nPrcDivision = 0) then													// 総合計
					SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and SumKbn = 9 and RDelKbn = 0')
				else																		// ◆◇◆　諸口
					SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and SyokuchiKbn = 1 and RDelKbn = 0');
//					SQL.ADD ('SELECT * FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and NCode = 0 and RecordKbn = 0');

				ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

				Open ();

				if	(not EOF) then				// 全社にあった
				begin
                    exNCode := FieldByName('NCode').AsFloat;

					// 同期
					if not fnWriteData_Rel(Trunc(FieldByName('NCode').AsFloat), nMasterDivision, dqMasterData) then
					begin
						nReturn := REQUISITE_CANCEL;
					end;

					fNoRecord	:= FALSE;
				end;

				Close ();
			end;
		end;
	end;
//  <マスタ同期>--- End ---

	if	(fNoRecord) then
	begin
// <011>↓
//		if	((nPrcDivision = 0) and (m_nReferMode = REFER)) then						// 処理区分: 0=総合計
		if	((m_nReferMode = REFER) or (not m_cJNTArea.IsAppend())) then						// 処理区分: 0=総合計
// <011>↑
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= REQUISITE_EXIT;
			Exit;
		end;

//  <マスタ同期>---Begin---
		if IsChild() then						// 子会社の場合
		begin
			m_cDataModule.BeginTran(m_cDBSelect);
			m_cDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);

			cDlgRequisite	:= TJNTCRP0020032f.fnCreateDialog (Pointer (m_pRec), nPrcDivision, Self,
									m_SyncMaster.m_cPDBSelect, nMasterDivision, nCodeDigit, nCodeAttribute,
//<080214_2>↓
//									m_strValidCharacters, @m_BmnFlg, @m_SegFlg);
									m_strValidCharacters, @m_BmnFlg, @m_SegFlg, @m_SPMsHist);
//<080214_2>↑
//                                    m_strValidCharacters, @m_BmnFlg, @m_SegFlg, @cExcept);

		end
		else
		begin
			cDlgRequisite	:= TJNTCRP0020032f.fnCreateDialog (Pointer (m_pRec), nPrcDivision, Self,
									m_cDBSelect, nMasterDivision, nCodeDigit, nCodeAttribute,
//<080214_2>↓
//									m_strValidCharacters, @m_BmnFlg, @m_SegFlg);
									m_strValidCharacters, @m_BmnFlg, @m_SegFlg, @m_SPMsHist);
//<080214_2>↑
//                                    m_strValidCharacters, @m_BmnFlg, @m_SegFlg, @cExcept);
		end;
//  <マスタ同期>--- End ---



//		if	(cDlgRequisite.ShowModal () = mrCancel) then
//			nReturn	:=	REQUISITE_CANCEL
//		else
//			m_bHojyoTree2 [nMasterDivision - 41]	:= 1;

		//HIS0023
//  <マスタ同期>---Begin---
//		if	(cDlgRequisite.ShowModal () = mrCancel) then
		iRet := cDlgRequisite.ShowModal ();
		if	(iRet = mrRetry) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free ();

			// 再帰
			Result	:= fnCheckRequisiteItem (nPrcDivision,	nMasterDivision,
											 nCodeDigit, nCodeAttribute);
			Exit;
		end
		else if	(iRet = mrCancel) then
//  <マスタ同期>--- End ---
			nReturn	:=	REQUISITE_CANCEL
		else
		begin
			if nMasterDivision = 41 then
				m_bHojyoTree2 [0]	:= 1
            //<002> ↓
            {
		    else
				m_bHojyoTree2 [nMasterDivision - MK_SEG01 + 1]	:= 1;
            }
            else if nMasterDivision = 101 then
				m_bHojyoTree2 [nMasterDivision - MK_SEG01 + 1]	:= 1;
            //<002> ↑
			m_NewRecord								:= True;

			//  <マスタ同期>---Begin---
			if IsChild() then					// 子会社の場合
			begin


// <012> ADD start
				if not GetMstNCode(exNCode) then// ﾏｽﾀ区分の内部ｺｰﾄﾞを取得
            	begin
                	m_cDataModule.Commit(m_cDBSelect);
					m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
             		nReturn := REQUISITE_EXIT;
            	end;
                                              	// 表示区分を表示で更新する  	
       			if not fnWriteData_SecHojyo(exNCode, 1) then
            	begin
                	m_cDataModule.Commit(m_cDBSelect);
					m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
            		nReturn := REQUISITE_EXIT;
            	end;
// <012> ADD end
             	fnSYNC();						// 子会社に同期
			end;
			//  <マスタ同期>--- End ---
		end;

		cDlgRequisite.Close ();
		cDlgRequisite.Free  ();
	end;

	if	(nPrcDivision <> 0) AND (nReturn<> REQUISITE_CANCEL) then				// 諸口があれば
	with (dqMasterData) do
	begin
		DtlCmnEditExCodeNumeric.InputFlagEnabled := False;						// ０入力不可
        DtlCmnEditExCodeNumeric.Zero := False;

		Close ();

		SQL.Clear;

		SQL.ADD ('SELECT GCode FROM ' + DEF_HOJYOMA + ' WHERE MasterKbn = :nMasterDivision and SyokuchiKbn = 1 and RDelKbn = 0');
		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

		Open ();

		if  (nCodeAttribute <= 1) then											// 数字の場合
		begin
			if FieldByName('GCode').AsFloat = 0 then							// 諸口＝０だったら
            begin
	            DtlCmnEditExCodeNumeric.InputFlagEnabled := True;				// ０入力可能
                DtlCmnEditExCodeNumeric.Zero := True;
            end;
        end;
		Close ();
	end;

	dqMasterData.Free ();

	Result	:= nReturn;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckCommonDetailScreenValue (Integer)									*/
//*																									*/
//*	目的	: 部門登録処理 詳細画面入力値ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 区分	(0:ｺｰﾄﾞ(数字), 1:ｺｰﾄﾞ(ﾌﾘｰ)...)										*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckCommonDetailScreenValue (nDivision: Integer): Boolean;
var
	stMessageRec   : TMJSMsgRec;
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
				//<190402>MOD St
				//		fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateStart.Value);
						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateStart.AsIntYM);
				//<190402>MOD Ed

						if	(not fReturn) then
						begin
							m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 15);

							MJSMessageBoxEx (Self, '日付' + stMessageRec.sMsg, stMessageRec.sTitle,
                            	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
						end;

					except
						m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 15);

						MJSMessageBoxEx (Self, '日付' + stMessageRec.sMsg, stMessageRec.sTitle,
                            	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

						Result	:= FALSE;

                        Exit;
					end;
				end;
			end;

		3:	begin
				if	(DtlCmnEditAppDateEnd.Value > 0) then
				begin
					try
				//<190402>MOD St
				//		fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateEnd.Value);
						fReturn	:= MJSDateCtrl.MjsIntYMDChk (DtlCmnEditAppDateEnd.AsIntYM);
				//<190402>MOD Ed

						if	(not fReturn) then
						begin
							m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 15);

							MJSMessageBoxEx (Self, '日付' + stMessageRec.sMsg, stMessageRec.sTitle,
                            	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
						end;

					except
						m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 15);

						MJSMessageBoxEx (Self, '日付' + stMessageRec.sMsg, stMessageRec.sTitle,
                            	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

						Result	:= FALSE;

                        Exit;
					end;

					if	(fReturn) then
					begin
						if	(DtlCmnEditAppDateEnd.Value < DtlCmnEditAppDateStart.Value) then
						begin
							strErrorMessage	:= '適用終了年月日は開始年月日以降でなければなりません。';

							MJSMessageBoxEx (Self, strErrorMessage, '確認', mjInformation, mjOk, mjDefOk, FALSE);

							Result	:= FALSE;

							Exit;
						end;
					end;
				end;
			end;
	end;

	if	(not fReturn) then
		CmnStatusBar.SimpleText	:= strErrorMessage;

	result	:= fReturn;
end;

//<090616>
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetDeleteButtonCondition ()													*/
//*																											*/
//*	目的	: 部門登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnSetDeleteButtonCondition();
var
	strExCode	: String;							//内部コード！
	bDelEnabled	: Boolean;
	lwSumKbn	: Integer;
	lwSkcKbn	: Integer;
begin

	bDelEnabled	:= False;
	try
		// 削除権限
		if not m_cJNTArea.IsDelete() then
		begin
			Exit;
		end;

		// 参照モード
		if (m_nReferMode = REFER) then
		begin
			Exit;
		end;

		// 選択中の内部コード取得
		if	(m_cACControl.Name = StdCmnGridExist.Name) then
		begin
			strExCode	:= StdCmnGridExist.DataSource.DataSet.FieldByName('nInCode').AsString
		end
		else
		if	(m_cACControl.Name = StdCmnGridTotal.Name) then
		begin
			strExCode	:= StdCmnGridTotal.DataSource.DataSet.FieldByName('nInCode').AsString
		end
		else
		if	(DtlCmnClientPanel.Visible) then									// 詳細だった場合
		begin
			strExCode	:= DtlNCode;
		end
		else
		begin
			Exit;
		end;

		// 内部コードが空
		if	(Trim (strExCode) = '') then
		begin
			CmnToolbarButtonDetail.Enabled	:= False;
			Exit;
		end;

		with (m_ChkQry) do
		begin
			Close ();
			SQL.Clear ();
			SQL.Add('SELECT NCode, SumKbn, SyokuchiKbn'
				+	' FROM ' + DEF_HOJYOMA
				+	' WHERE MasterKbn = :nMasterDivision'
				+	  ' AND RDelKbn = 0'
				+	  ' AND NCode = :strExCode');

			SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			SetFld('strExCode').AsString		:= strExCode;

			Open ();

			if EOF then
			begin
				bDelEnabled	:= False;
				Exit;
			end;

			lwSumKbn	:= GetFld('SumKbn').AsInteger;
			lwSkcKbn	:= GetFld('SyokuchiKbn').AsInteger;

			// 総合計
			if	(lwSumKbn = 9) then
			begin
				Close ();
				SQL.Clear ();
				SQL.Add('SELECT GCode'
					+	' FROM ' + DEF_HOJYOMA
					+	' WHERE MasterKbn = :nMasterDivision'
					+	  ' AND RDelKbn = 0'
					+	  ' AND SumKbn <> 9');

				SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

				Open ();

				// 他に１件も登録されていなければ
				if EOF then
				begin
					// 削除可
					bDelEnabled	:= True;
				end
				// 総合計は削除不可
				else
				begin
					bDelEnabled	:= False;
					Exit;
				end;
			end
			// 諸口
			else if	(lwSkcKbn = 1) then
			begin
				Close ();
				SQL.Clear ();
				SQL.Add('SELECT GCode'
					+	' FROM ' + DEF_HOJYOMA
					+	' WHERE MasterKbn = :nMasterDivision'
					+	  ' AND RDelKbn = 0'
					+	  ' AND SyokuchiKbn = 0'
					+	  ' AND SumKbn <> 9');

				SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;

				Open ();

				// 他に１件も登録されていなければ
				if EOF then
				begin
					// 削除可
					bDelEnabled	:= True;
				end
				// 諸口は削除不可
				else
				begin
					bDelEnabled	:= False;
					Exit;
				end;
			end
			// それ以外は削除可（基本的には）
			else
			begin
				bDelEnabled	:= True;
			end;

//<MLWK>↓
			// MLワークフローモードの場合諸口と実在の削除不可
			if m_bMLWF = True then
			begin
				// 諸口
				if	(lwSkcKbn = 1)
				// 実在
				or	(lwSumKbn = 0) then
				begin
					bDelEnabled	:= False;
					Exit;
				end;
			end;
//<MLWK>↑

			// 実在がぶら下がっている合計部門は削除できないものとする
			if	(bDelEnabled and (lwSumKbn = 1)) then
			begin
				Close ();
				SQL.Clear ();
				SQL.Add('SELECT tr2.DeptPNCode'
					+	' FROM ' + DEF_HAPTLR + ' tr1, ' + DEF_HAPTLR2 + ' tr2'
					+	' WHERE tr1.MasterKbn = :nMasterDivision'			// マスタ区分
					+	  ' AND tr1.NCode = tr2.BaseNCode'					// 内部コードが一致
					+	  ' AND tr2.DeptPNCode = :strExCode');				// 自分が親

				SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				SetFld('strExCode').AsString		:= strExCode;

				Open ();

				if	(not EOF) then
				begin
					bDelEnabled	:= False;
					Exit;
				end;
			end;


			if  (bDelEnabled = True)
			and ((m_nCurrentMasterDiv = 41)					// 部門
			  or (m_nCurrentMasterDiv = 86)					// 職種
			  or (m_nCurrentMasterDiv = 87)					// 役職
			  or (m_nCurrentMasterDiv = 88)					// 職能資格
			  or (m_nCurrentMasterDiv = 89)) then			// 職位
			begin
				// 社員が所属している部門は削除できないものとする
				if	(lwSumKbn = 0) then
				begin
					Close ();
					SQL.Clear ();
					SQL.Add('SELECT NCode'
						+	' FROM HAPChg'
						+	' WHERE MasterKbn = :nMasterDivision'				// マスタ区分
						+	  ' AND DeptNCode = :strExCode');					// 自分が親

					SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					SetFld('strExCode').AsString		:= strExCode;

					Open ();

					if	(not EOF) then
					begin
						bDelEnabled	:= False;
						Exit;
					end;
				end;

				// 新所属体系で実在がぶら下がっている合計部門は削除できないものとする
				if	(lwSumKbn = 1) then
				begin
					Close ();
					SQL.Clear ();
					SQL.Add('SELECT tr2.DeptPNCode'
						+	' FROM ' + DEF_HAPTLR + 'Nx tr1, ' + DEF_HAPTLR2 + 'Nx tr2'
						+	' WHERE tr1.MasterKbn = :nMasterDivision'			// マスタ区分
						+	  ' AND tr1.NCode = tr2.BaseNCode'					// 内部コードが一致
						+	  ' AND tr2.DeptPNCode = :strExCode');				// 自分が親

					SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					SetFld('strExCode').AsString		:= strExCode;

					Open ();

					if	(not EOF) then
					begin
						bDelEnabled	:= False;
						Exit;
					end;
				end;

				// 新所属人員登録で社員が所属している部門は削除できないものとする
				if	(lwSumKbn = 0) then
				begin
					Close ();
					SQL.Clear ();
					SQL.Add('SELECT NCode'
						+	' FROM HAPChgNx'
						+	' WHERE MasterKbn = :nMasterDivision'				// マスタ区分
						+	  ' AND DeptNCode = :strExCode');					// 自分が親

					SetFld('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
					SetFld('strExCode').AsString		:= strExCode;

					Open ();

					if	(not EOF) then
					begin
						bDelEnabled	:= False;
						Exit;
					end;
				end;
			end;
		end;
	finally
		CmnToolbarButtonDelete.Enabled	:= bDelEnabled;
	end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditClassCodeOnChange ()													*/
//*																											*/
//*	目的	: 部門登録処理 詳細画面 部門分類 Changeイベント																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditClassCodeOnChange (Sender: TObject);
var
	nClassCode: Integer;
	fEditState: Boolean;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnCommonFunctionDetailsOnChange (Sender);

	nClassCode	:= Trunc (DtlCmnEditClassCode.Value);

	if	(nClassCode = 0) then
		fEditState	:= TRUE
	else
		fEditState	:= FALSE;

	fnChangeEditComponentState (fEditState);

	if	(not DtlCmnEditClassCode.InputFlag) then
		DtlCmnLabelClassDesc.Caption	:= fnGetClassDescription (nClassCode, DESCRIPTION_FULL);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnFunctionNumEditSelectOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_RETURN) or (Key = VK_LEFT) or (Key = VK_UP) or (Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(not fnCheckNumEditSelectedItem (TMNumEdit (Sender))) then
			Abort ();
	end;

	fnCommonFunctionOnKeyDown02 (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditCharacterCodeOnChange (Sender: TObject);
var
	nCharacterCode: Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnCommonFunctionDetailsOnChange (Sender);

	nCharacterCode	:= DtlCmnEditCharacterCode.AsInteger;

	DtlCmnLabelCharacterDesc.Caption	:= fnGetCharacterDescription (nCharacterCode, DESCRIPTION_FULL);

end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckDetailScreenDivisions (): Boolean;
begin
// <010>↓ｺｰﾄﾞ未入力で更新されることもあるので未入力ﾁｪｯｸ
    if ((DtlCmnEditExCodeFree.Visible) and (Trim(DtlCmnEditExCodeFree.Text) = ''))
        or ((DtlCmnEditExCodeNumeric.Visible) and (DtlCmnEditExCodeNumeric.Value = 0) and (DtlCmnEditExCodeNumeric.InputFlag)) then
    begin
        if DtlCmnEditExCodeNumeric.Visible then
            DtlCmnEditExCodeNumeric.SetFocus
        else if DtlCmnEditExCodeFree.Visible then
            DtlCmnEditExCodeFree.SetFocus;
        Result := FALSE;
        Exit;
    end;
// <010>↑

	if	(not fnCheckNumEditSelectedItem (DtlCmnEditClassCode)) then						// 部門分類区分
	begin
		Result	:= FALSE;
		Exit;
	end;

	if	(not fnCheckNumEditSelectedItem (DtlCmnEditCharacterCode)) then					// 部門性格ｺｰﾄﾞ
	begin
		Result	:= FALSE;
		Exit;
	end;

	if	(not fnCheckNumEditSelectedItem (DtlCmnEditCommonStockDivision)) then 			// 共通仕入部門区分
	begin
		Result	:= FALSE;
		Exit;
	end;

	// 正式名称
	if Trim(DtlCmnEditName.Text) = '' then
	begin
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := '正式名称が未入力です。';
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditName.SetFocus ();

		Result	:= FALSE;
		Exit;
	end;

{
	// 連想
	if Trim(DtlCmnEditAssociation.Text) = '' then
	begin
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := '連想が未入力です。';
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditAssociation   .SetFocus ();

		Result	:= FALSE;
		Exit;
	end;
}
	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckNumEditSelectedItem (cNumEdit: TMNumEdit): Boolean;
begin
	if	((not cNumEdit.Enabled) or (not cNumEdit.Visible)) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(fnGetIndexSelectItem (cNumEdit) = -1) then
	begin
		Beep ();

		m_cACControl	:= cNumEdit;
		m_cACControl.SetFocus ();

		cNumEdit.SelectAll ();

		Result	:= FALSE;
		Exit;
	end;

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnGetIndexSelectItem (cNumEdit: TMNumEdit): Integer;
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
procedure	TJNTCRP0020030f.fnDtlCmnEditCommonStockDivisionOnChange (Sender: TObject);
var
	nCSDivision: Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnCommonFunctionDetailsOnChange (Sender);

	nCSDivision	:= DtlCmnEditCommonStockDivision.AsInteger;

	DtlCmnLabelCommonStockDesc.Caption	:= fnGetCmnStockDescription (nCSDivision, DESCRIPTION_FULL);
end;


procedure	TJNTCRP0020030f.fnStdCmnGridPopupMenuOnPopup (Sender: TObject);
var
	strExCode	: String;				// 内部コード！
	nTagDivision: Integer;
begin
	strExCode	:= '';

	// 選択中の内部コード取得
    if DtlCmnClientPanel.Visible then											// 詳細画面
		strExCode	:= DtlNCode
	else if	(StdCmnTab.Items [0].Selected) then									// 実在ｸﾞﾘｯﾄﾞ
		strExCode	:= StdCmnMemDataExist.FieldByName('nInCode').AsString
	else																		// 合計ｸﾞﾘｯﾄﾞ
		strExCode	:= StdCmnMemDataTotal.FieldByName('nInCode').AsString;

	if	(strExCode <> '') then
	begin
		StdCmnGridPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen();
		StdCmnGridPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen();
		StdCmnGridPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen();
		StdCmnGridPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen();
		StdCmnGridPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen();
		StdCmnGridPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen();

		nTagDivision	:= fnGetMasterDataTagInfo (strExCode);

		// 付箋が貼られている場合
		if	(nTagDivision > 0) then
		begin
			StdCmnGridPopupMenuTagOff    .Visible	:= TRUE;
			StdCmnGridPopupMenuTagComment.Visible	:= TRUE;

			case (nTagDivision) of
				1:	begin
						StdCmnGridPopupMenuTagOff.ImageIndex	:= StdCmnGridPopupMenuTag01.ImageIndex;
						StdCmnGridPopupMenuTag01 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				2:	begin
						StdCmnGridPopupMenuTagOff.ImageIndex	:= StdCmnGridPopupMenuTag03.ImageIndex;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				3:	begin
						StdCmnGridPopupMenuTagOff.ImageIndex	:= StdCmnGridPopupMenuTag02.ImageIndex;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= TRUE;
					end;
				4:	begin
						StdCmnGridPopupMenuTagOff.ImageIndex	:= StdCmnGridPopupMenuTag04.ImageIndex;
						StdCmnGridPopupMenuTag01 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= FALSE;
					end;
			end;
		end
		// 付箋が貼られていない場合
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
		StdCmnGridPopupMenuTagOff    .Enabled	:= FALSE;
		StdCmnGridPopupMenuTagComment.Enabled	:= FALSE;
		StdCmnGridPopupMenuTagOff    .Visible	:= FALSE;
		StdCmnGridPopupMenuTagComment.Visible	:= FALSE;

		StdCmnGridPopupMenuTag01.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag02.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag03.Enabled	:= FALSE;
		StdCmnGridPopupMenuTag04.Enabled	:= FALSE;
	end;
end;


procedure	TJNTCRP0020030f.fnStdCmnGridPopupMenuTagOnClick (Sender: TObject);
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

	// 詳細画面表示中
	if	(DtlCmnClientPanel.Visible) then
	begin
		if	(m_nSelectTagKind = nTagKind) then
			nTagKind	:= 0;

		case (nTagKind) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag04.Bitmap);
		end;

		// その場で書き込む
        fnUpdateMasterDataTagInfo (dtlNCode, nTagKind);

		m_nSelectTagKind	:= nTagKind;
		if nTagKind = 0 then
        begin
			DtlCmnImageTag.ShowHint := False;
			DtlCmnImageTag.Hint := '';
        end;
	end
    else
		fnSetGridTagInfo (nTagKind);

end;

procedure	TJNTCRP0020030f.fnSetGridTagInfo (nTagKind: Integer);
var
	strExCode	: String;						// 内部コード！
	nDivision	: Integer;

begin
	if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
	begin
		if	(Trim (StdCmnMemDataExist.FieldByName('nInCode').AsString) = '') then
			Exit;

//		if  (m_nCurrentCodeAttr <= 1) then
//			strExCode	:= Format ('%.10d', [StrToInt64 (Trim (StdCmnMemDataExist.FieldByName('nInCode').AsString))])
//		else
			strExCode	:= StdCmnMemDataExist.FieldByName('nInCode').AsString;

		nDivision	:= 0;
	end
	else																				// 合計ｸﾞﾘｯﾄﾞ
	begin
		if	(Trim (StdCmnMemDataTotal.FieldByName('nInCode').AsString) = '') then
			Exit;

//		if  (m_nCurrentCodeAttr <= 1) then
//			strExCode	:= Format ('%.10d', [StrToInt64 (Trim (StdCmnMemDataTotal.FieldByName('nInCode').AsString))])
//		else
			strExCode	:= StdCmnMemDataTotal.FieldByName('nInCode').AsString;

		nDivision	:= 1;
	end;

	fnUpdateMasterDataTagInfo (strExCode, nTagKind);
	fnUpdateGridMemDataRecord (nDivision, strExCode, nTagKind);
end;


procedure	TJNTCRP0020030f.fnStdCmnGridPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData: TMQuery;
	cMasDlgParam: TJNTMasDLGParam;          //FX10000
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;    //FX10000
	cMenuItem	: TMenuItem;
	cMemData	: TdxMemData;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

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
    begin
		// 詳細画面表示中
		if	(DtlCmnClientPanel.Visible) then
		begin
			if	(m_nSelectTagKind = nTagKindWork) then
				nTagKindWork	:= 0;

			case (nTagKindWork) of
				0:	DtlCmnImageTag.Picture	:= nil;
				1:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag01.Bitmap);
				2:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag03.Bitmap);
				3:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag02.Bitmap);
				4:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag04.Bitmap);
			end;

			// その場で書き込む
    	    fnUpdateMasterDataTagInfo (dtlNCode, nTagKindWork);

			m_nSelectTagKind	:= nTagKindWork;
			if nTagKindWork = 0 then
            begin
				DtlCmnImageTag.ShowHint := False;
				DtlCmnImageTag.Hint := '';
            end;
		end
    	else
			fnSetGridTagInfo (nTagKindWork);
    end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();     //FX10000
	cMasDlgIF.Init (self, Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();  //FX10000

	cMasDlgParam.m_iMasterkbn	:= m_nCurrentMasterDiv;									// ﾏｽﾀ区分
	cMasDlgParam.m_iSubNCode	:= 0;													// 科目別補助ｺｰﾄﾞ

	// 詳細画面表示中
	if	(DtlCmnClientPanel.Visible) then
		cMasDlgParam.m_iNCode	:= StrToInt64 (DtlNCode)
	else if	(StdCmnTab.Items [0].Selected) then												// 実在ｸﾞﾘｯﾄﾞ
	begin
		cMasDlgParam.m_iNCode	:= StdCmnMemDataExist.FieldByName('nInCode').AsCurrency;
	end
	else																				// 合計ｸﾞﾘｯﾄﾞ
	begin
		cMasDlgParam.m_iNCode	:= StdCmnMemDataTotal.FieldByName('nInCode').AsCurrency;
	end;

	cMasDlgParam.m_iFusenKbn	:= nTagKindWork;										// 付箋区分
	cMasDlgParam.m_pApRec		:= Pointer (m_pRec);									// TMjsAppRecord

	if	(cMasDlgIF.DoDlg (cMasDlgParam) = mrOK) then									// 付箋備考ﾀﾞｲｱﾛｸﾞ表示
	begin
		dqMasterData	:= TMQuery.Create (Self);		// 050606

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT FusenCmnt FROM MFusenInfo ');
			SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode');

			ParamByName ('nMasterDivision').AsInteger	:= cMasDlgParam.m_iMasterkbn;
			ParamByName ('strExCode'      ).AsCurrency	:= cMasDlgParam.m_iNCode;

			Open ();

			// 詳細画面表示中
			if	(DtlCmnClientPanel.Visible) then
            begin
				DtlCmnImageTag.Hint := FieldByName('FusenCmnt').AsString;
                if FieldByName('FusenCmnt').AsString <> '' then
					DtlCmnImageTag.ShowHint := True
                else
					DtlCmnImageTag.ShowHint := False;
            end
            else
            begin
				if	(StdCmnTab.Items [0].Selected) then
					cMemData	:= StdCmnMemDataExist
				else
					cMemData	:= StdCmnMemDataTotal;

				cMemData.Edit ();

				if	(not EOF) then
					cMemData.FieldByName('strComment').AsString	:= FieldByName('FusenCmnt').AsString
				else
					cMemData.FieldByName('strComment').AsString	:= '';

				cMemData.Post ();
			end;
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistBSAddDepartment (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 B/S計上部門登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistBSAddDepartment (strExCode: String; var strDepartmentName, strNCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	// 入力された外部コードから略称と内部コードを取得する
    // 適用期間が最新のもの
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT NCode, SimpleName, HojyoKbn2 FROM ' + DEF_HOJYOMA);
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and GCode = :strExCode and RDelKbn = 0');
		SQL.ADD ('ORDER BY TStartDate DESC');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		while  (not EOF) do
		begin
	        strNCode			:= GetFld ('NCode').AsString;
			strDepartmentName	:= GetFld ('SimpleName').AsString;

			if	((GetFld ('HojyoKbn2').AsInteger <> 0) AND (GetFld ('NCode').AsString <> DtlNCode))then
            begin
				fReturn	:= True;
                break;
            end;

			NEXT;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistBSAddDepartment (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 B/S計上部門登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistBSAddDepartment2 (strNCode: String; var strDepartmentName, strGCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;
    strFormat	: String;

begin
	// 入力された内部コードから略称と外部コードを取得する
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT GCode, SimpleName, HojyoKbn2 FROM ' + DEF_HOJYOMA);
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and NCode = :strInCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strInCode'      ).AsString    := strNCode;

		Open ();

		if  (not EOF) then
		begin
	        strGCode			:= GetFld ('GCode').AsString;
			if  (m_nCurrentCodeAttr <= 1) then
			begin
				case (m_nCurrentCodeAttr) of
					0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
					1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
				end;

				strGCode	:= Format (strFormat, [StrToInt64 (Trim (strGCode))]);
		    end;

			strDepartmentName	:= GetFld ('SimpleName').AsString;

			if	(GetFld ('HojyoKbn2').AsInteger <> 0) then
            begin
				fReturn	:= True;
            end;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistRenewCompany (Integer; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 付替先会社登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nCompCode	= 会社ｺｰﾄﾞ																	*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistRenewCompany (nCompCode: Integer; var strCompName: String): Boolean;
begin
	strCompName	:= '';

	Result	:= False;
end;

procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddNumericOnExit (Sender: TObject);
var
	strExCode    : String;
	strNameSimple: String;
	strWorkInCode: String;
	fReturn      : Boolean;

begin
//	if	(Trunc (DtlCmnEditExCodeBSAddNumeric.Value) > 0) then
//	begin
//		strExCode	:= Format ('%.10d', [Trunc (DtlCmnEditExCodeBSAddNumeric.Value)]);
//		fReturn		:= fnCheckRegistBSAddDepartment (strExCode, strNameSimple);

//		DtlCmnLabelExCodeBSAddDesc.Caption	:= strNameSimple;

//		if	(not fReturn) then
//		begin
//			Beep ();
//			DtlCmnEditExCodeBSAddNumeric.SetFocus ();
//			Abort;
//		end;
//	end
//	else
//		DtlCmnLabelExCodeBSAddDesc.Caption	:= '';

	if CloseFlg then
    	exit;

	if	(not DtlCmnEditExCodeBSAddNumeric.InputFlag) then
	begin
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeBSAddNumeric.Value)]);
		fReturn		:= fnCheckRegistBSAddDepartment (strExCode, strNameSimple, strWorkInCode);

		DtlCmnLabelExCodeBSAddDesc.Caption	:= strNameSimple;
        DtlCmnLabelNCodeBSAdd.Caption		:= strWorkInCode;

		if	(not fReturn) then
		begin
			Beep ();
			// 取消ボタンに移動
            if (DtlCmnButtonCancel.Focused) then
            begin
            	DtlCmnEditExCodeBSAddNumeric.Value := 0;		// クリア
                DtlCmnEditExCodeBSAddNumeric.InputFlag := True;
            end
            else
				DtlCmnEditExCodeBSAddNumeric.SetFocus ();
			Abort;
		end;
	end
	else
    begin
		DtlCmnLabelExCodeBSAddDesc.Caption	:= '';
		DtlCmnLabelNCodeBSAdd	  .Caption	:= '';
    end;
end;


procedure TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddFreeOnExit(Sender: TObject);
var
	strNameSimple: String;
	strWorkInCode: String;
	fReturn      : Boolean;

begin
	if	(Trim (DtlCmnEditExCodeBSAddFree.Text) <> '') then
	begin
		fReturn	:= fnCheckRegistBSAddDepartment (DtlCmnEditExCodeBSAddFree.Text, strNameSimple, strWorkInCode);

		DtlCmnLabelExCodeBSAddDesc.Caption	:= strNameSimple;
        DtlCmnLabelNCodeBSAdd.Caption		:= strWorkInCode;

		if	(not fReturn) then
		begin
			Beep ();
			// 取消ボタンに移動
            if (DtlCmnButtonCancel.Focused) then
            	DtlCmnEditExCodeBSAddFree.Text := ''		// クリア
            else
				DtlCmnEditExCodeBSAddFree.SetFocus ();
			Abort;
		end;
	end
	else
    begin
		DtlCmnLabelExCodeBSAddDesc.Caption	:= '';
		DtlCmnLabelNCodeBSAdd	  .Caption	:= '';
    end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnChangeSelectionScreen ()												*/
//*																									*/
//*	目的	: 部門登録処理																			*/
//*																									*/
//*	戻り値	: Boolean,																				*/
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnChangeSelectionScreen (): Boolean;
var
	dqMasterData   : TMQuery;
//	cDialogAdopt   : TJNTCRP0020033f;
	nMasterDivision: Integer;
	nCodeDigit     : Integer;
	nCodeAttribute : Integer;
	nCount		   : Integer;
	nAdoptDivision : Integer;
	nReturn		   : Integer;
	strFormat	   : String;
	strItemName	   : String;
	fDialogAdopt   : Boolean;
//	nRetID		   : TRetID;		//	HIS0002 FX10000
	iTmp		   : Integer;
	iTmp2		   : Integer;
//    tmp			   : Integer;

begin
	{051124 編集中の場合は確認}
	// 詳細の場合
	if (DtlCmnClientPanel.Visible) then
    begin
        ///<006> ↓
        if  ((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
            and (DtlCmnEditExCodeNumeric.Visible))
            or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
        begin
        //<006> ↑

		    if CONFIRM_THROUGH<> fnOutputConfirmationMessage (CONFIRM_CANCEL) then
		    begin
                if (SegIndex <> -1) then
                begin
					// 戻す
					CmnInstructionCombo.ItemIndex := SegIndex;
					CmnInstructionComboDtl.ItemIndex := SegIndex;
					CmnInstructionCombo.Text := CmnInstructionCombo.ColumnText(SegIndex);
					CmnInstructionComboDtl.Text := CmnInstructionComboDtl.ColumnText(SegIndex);
				end;
				Result := True;					//070309 Hirota
				exit;
			end;
		end;
	end;

	if ParentMasterDiv = 101 then
	begin
		//  <マスタ同期>---Begin---
		if IsChild() then
		begin
			// 全社DBのMasterInfoと比較
			iTmp := m_SyncMaster.fnChkP_MasterInfo(m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision);
			if iTmp <> JNTSYNC_RET_MASCHK_OK then
			begin
				if iTmp = JNTSYNC_RET_MASCHK_NO_USE then
				begin
					MjsMessageBoxEx(Self,
								JNTSYNC_MSG_NO_USE,
								'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
				end
				else if iTmp = JNTSYNC_RET_MASCHK_DIFF_C then
				begin
					MjsMessageBoxEx(Self,
								JNTSYNC_MSG_DIFF_C,
								'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
				end
				else if iTmp = JNTSYNC_RET_MASCHK_DIFF_U then
				begin
					MjsMessageBoxEx(Self,
								JNTSYNC_MSG_DIFF_U,
								'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
				end
				else
				begin
					MjsMessageBox(Self,'マスター基本情報の取得に失敗しました。',//<210202>Upd 長音対応
								  mjError,mjDefOK);
				end;
				// 戻す
				CmnInstructionCombo.ItemIndex := SegIndex;
				CmnInstructionComboDtl.ItemIndex := SegIndex;
				CmnInstructionCombo.Text := CmnInstructionCombo.ColumnText(SegIndex);
				CmnInstructionComboDtl.Text := CmnInstructionComboDtl.ColumnText(SegIndex);

				Result := True;					//070309 Hirota
				Exit;
			end;
		end;
		//  <マスタ同期>--- End ---
		m_stMasterItem := m_stSelectItem [CmnInstructionCombo.ItemIndex + 1];
		if	(m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			Result	:= TRUE;
			Exit;
		end;

		nMasterDivision	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nMasterDivision;
		//下でやらないとダメ
{
		// 詳細の場合、画面クリア
		if (not StdCmnClientPanel.Visible) then	// 051124 >>
    	begin
			DtlNCode := '0';
			fnResetDetailScreen		 ();
        end;									// 051124 <<
}
    end
    else
		nMasterDivision	:= ParentMasterDiv;		//★★★

	fDialogAdopt	:= TRUE;
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT MasterKbn FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

		Open ();

		if	(not EOF) then
			fDialogAdopt	:= FALSE;
	end;

	// 決算確定
	if 1 = m_cJNTArea.IsKessan(True) then
		m_nReferMode	:= REFER		//	決算確定の為参照のみ
	//  <マスタ同期>---Begin---
	else if m_bKanendo then
		m_nReferMode	:= REFER		//	翌期更新済みの為参照のみ
	//  <マスタ同期>--- End ---
	else
		m_nReferMode	:= NORMAL;		//	通常処理

//--- HIS0027 St ------
{
//--- HIS0025 St -----
	//参照のみ以外のときのみ排他処理を行う
	if m_nReferMode <> REFER then
	begin
		if cExcept <> nil then
		begin
			cExcept.ResetTerm;
			cExcept.Free;
			cExcept := nil;
        end;

        if fnExcept(nMasterDivision) = 99 then
            m_nReferMode	:= REFER;		//他で使用中のため参照のみ
    end;
//--- HIS0025 Ed -----
}
//--- HIS0027 Ed -----

	if	(fDialogAdopt) then
	begin
		if	(m_nReferMode = REFER) then
		begin
			if	(m_nCurrentMasterDiv <> 0) then
			begin
				for nCount := 1 to ITEM_MAX do
				begin
					if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
						Break;
				end;

				CmnInstructionCombo.ItemIndex	:= nCount - 1;
			end
			else
				CmnInstructionCombo.ItemIndex	:= 0;

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

{
		cDialogAdopt	:= TJNTCRP0020033f.fnCreateDialog (Pointer (m_pRec), Self, m_cDataModule, m_cDBSelect, nMasterDivision);

		if	(cDialogAdopt.ShowModal () = mrCancel) then
		begin
			Result	:= FALSE;

			if	(m_nCurrentMasterDiv <> 0) then
			begin
				for nCount := 1 to ITEM_MAX do
				begin
					if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
						Break;
				end;

//★★★				CmnInstructionCombo.ItemIndex	:= nCount - 1;
			end;
//★★★			else
//★★★				CmnInstructionCombo.ItemIndex	:= 0;

			dqMasterData.Free ();
			Exit;
		end;
}

{★★★？？？
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nAdoptDivision	:= cDialogAdopt.m_nAdoptDivision;
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeDigit		:= cDialogAdopt.m_nCodeDigit;
		m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeAttribute	:= cDialogAdopt.m_nCodeAttribute;
★★★？？？}
	end;

	if ParentMasterDiv = 101 then
	begin
		nAdoptDivision	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nAdoptDivision;
		nCodeDigit		:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeDigit;
		nCodeAttribute	:= m_stSelectItem [CmnInstructionCombo.ItemIndex + 1].nCodeAttribute;
		m_stMasterItem.nAdoptDivision	:= nAdoptDivision;
		m_stMasterItem.nCodeDigit		:= nCodeDigit;
		m_stMasterItem.nCodeAttribute	:= nCodeAttribute;
	end
	else
	begin
		//
		nAdoptDivision	:= m_stMasterItem.nAdoptDivision;
		nCodeDigit		:= m_stMasterItem.nCodeDigit;
		nCodeAttribute	:= m_stMasterItem.nCodeAttribute;
	end;
//★★★

{やっぱりダメ 050906
	// コード属性・桁数はもっと上で取得 050905 >>
    m_nCurrentMasterDiv := nMasterDivision;
	m_nCurrentAdoptDiv	:= nAdoptDivision;
    m_nCurrentCodeDigit := nCodeDigit;
   	m_nCurrentCodeAttr  := nCodeAttribute;
	// コード属性・桁数はもっと上で取得 050905 <<
}
	// 以下の３つのマスタは合計部門がないので総合計も不要
	if ((ParentMasterDiv <> 87)										// 役職
   	AND (ParentMasterDiv <> 88)										// 職能資格
   	AND (ParentMasterDiv <> 89)) then								// 職位
	begin
		nReturn	:= fnCheckRequisiteItem (0, nMasterDivision, nCodeDigit, nCodeAttribute);	// 総合計ﾁｪｯｸ

		if	((nReturn = REQUISITE_CANCEL) or (nReturn = REQUISITE_EXIT)) then
		begin
			Result	:= FALSE;

			if	(m_nCurrentMasterDiv <> 0) then
			begin
				for nCount := 1 to ITEM_MAX do
				begin
					if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
						Break;
				end;

//				CmnInstructionCombo.ItemIndex	:= nCount - 1;
			end
			else
//				CmnInstructionCombo.ItemIndex	:= 0;

			dqMasterData.Free ();

			// 051124 >>
            if (ParentMasterDiv = 101) AND (SegIndex <> -1)
            AND (CmnInstructionCombo.Items.Count <> 1)
            AND (SgkChk = False) then
            begin
            	SgkChk := True;
            	// 戻す
			    CmnInstructionCombo.ItemIndex := SegIndex;
			    CmnInstructionComboDtl.ItemIndex := SegIndex;
   	    	    CmnInstructionCombo.Text := CmnInstructionCombo.ColumnText(SegIndex);
   	        	CmnInstructionComboDtl.Text := CmnInstructionComboDtl.ColumnText(SegIndex);
                fnChangeSelectionScreen();
            end;
			// 051124 <<

			Exit;
		end;
	end;

	// 社員系は諸口不要
//<MLXHAP>↓
//	if ((ParentMasterDiv = 41)										// 部門
//   	 OR (ParentMasterDiv = 101)) then								// セグメント
	if ((ParentMasterDiv = 41)										// 部門
	 OR (ParentMasterDiv = 101))									// セグメント
	and (TMSeries.IsMjsLink3 <> True) then							// MLXでは諸口を作成しない
//<MLXHAP>↑
	begin
		nReturn	:= fnCheckRequisiteItem (1, nMasterDivision, nCodeDigit, nCodeAttribute);	// 諸口ﾁｪｯｸ

		if	((nReturn = REQUISITE_CANCEL) or (nReturn = REQUISITE_EXIT)) then
		begin
			dqMasterData.Free ();

			// 051124 >>
            if (ParentMasterDiv = 101) AND (SegIndex <> -1)
            AND (CmnInstructionCombo.Items.Count <> 1)
            AND (SgkChk = False) then
            begin
            	SgkChk := True;
            	// 戻す
			    CmnInstructionCombo.ItemIndex := SegIndex;
			    CmnInstructionComboDtl.ItemIndex := SegIndex;
   	    	    CmnInstructionCombo.Text := CmnInstructionCombo.ColumnText(SegIndex);
   	        	CmnInstructionComboDtl.Text := CmnInstructionComboDtl.ColumnText(SegIndex);
                fnChangeSelectionScreen();
            end;
			// 051124 <<

			Result	:= FALSE;
			Exit;
		end;
	end
    else
    begin
//<100215_1>↓
//		Label3.Caption := '-1';													// 諸口の内部コードを-1としておく
		m_SyokuchiNCd := '-1';													// 諸口の内部コードを-1としておく
//<100215_1>↑
        DtlCmnEditExCodeNumeric.InputFlagEnabled := False;						// ０入力不可
        DtlCmnEditExCodeNumeric.Zero := False;
	end;
   	SgkChk := False;

    m_nCurrentMasterDiv := nMasterDivision;
	m_nCurrentAdoptDiv	:= nAdoptDivision;
    m_nCurrentCodeDigit := nCodeDigit;
   	m_nCurrentCodeAttr  := nCodeAttribute;

	StdCmnGridExistCode.MaxLength	:= m_nCurrentCodeDigit;
	StdCmnGridTotalCode.MaxLength	:= m_nCurrentCodeDigit;

    if  (m_nCurrentCodeAttr = 2) then
    begin
        StdCmnGridExistCode.Alignment		:= taLeftJustify;
        StdCmnGridExistCode.EditAlignment	:= taLeftJustify;
        StdCmnGridExistCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridExistCode.ImeMode			:= imClose;
		StdCmnGridExistCode.Hankaku			:= TRUE;

        StdCmnGridTotalCode.Alignment		:= taLeftJustify;
        StdCmnGridTotalCode.EditAlignment	:= taLeftJustify;
        StdCmnGridTotalCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridTotalCode.ImeMode			:= imClose;
		StdCmnGridTotalCode.Hankaku			:= TRUE;
    end
    else
    begin
        StdCmnGridExistCode.Alignment		:= taRightJustify;
        StdCmnGridExistCode.EditAlignment	:= taRightJustify;
        StdCmnGridExistCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridExistCode.ImeMode			:= imDisable;
		StdCmnGridExistCode.Hankaku			:= FALSE;

        StdCmnGridTotalCode.Alignment		:= taRightJustify;
        StdCmnGridTotalCode.EditAlignment	:= taRightJustify;
        StdCmnGridTotalCode.MaxLength		:= m_nCurrentCodeDigit;
		StdCmnGridTotalCode.ImeMode			:= imDisable;
		StdCmnGridTotalCode.Hankaku			:= FALSE;
    end;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		DtlCmnEditExCodeFree        .Visible	:= FALSE;
		DtlCmnEditExCodeBSAddFree   .Visible	:= FALSE;
		DtlCmnEditExCodeNumeric     .Visible	:= TRUE;
		DtlCmnEditExCodeBSAddNumeric.Visible	:= TRUE;

		if	(m_nCurrentCodeAttr = 1) then												// ｺｰﾄﾞ属性: 1=数字(前ｾﾞﾛあり)
			strFormat	:= StringOfChar ('0', m_nCurrentCodeDigit)
		else																			// ｺｰﾄﾞ属性: 0=数字
			strFormat	:= '';

		DtlCmnEditExCodeNumeric     .FormatStr	:= strFormat;
		DtlCmnEditExCodeBSAddNumeric.FormatStr	:= strFormat;
		DtlCmnEditExCodeNumeric     .Digits		:= m_nCurrentCodeDigit;
		DtlCmnEditExCodeBSAddNumeric.Digits		:= m_nCurrentCodeDigit;
		DtlCmnEditExCodeNumeric     .MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCurrentCodeDigit));
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DtlCmnEditExCodeNumeric     .Visible	:= FALSE;
		DtlCmnEditExCodeBSAddNumeric.Visible	:= FALSE;
		DtlCmnEditExCodeFree        .Visible	:= TRUE;
		DtlCmnEditExCodeBSAddFree   .Visible	:= TRUE;
		DtlCmnEditExCodeFree        .MaxLength	:= m_nCurrentCodeDigit;
		DtlCmnEditExCodeBSAddFree   .MaxLength	:= m_nCurrentCodeDigit;
		DtlCmnEditExCodeFree		.InputAttr	:= iaFree;
		DtlCmnEditExCodeBSAddFree   .InputAttr	:= iaFree;
		DtlCmnEditExCodeFree		.ValidChars := m_strValidCharacters;
		DtlCmnEditExCodeBSAddFree   .ValidChars := m_strValidCharacters;
	end;
{
	for nCount := 1 to ITEM_MAX do
	begin
		if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			strItemName		:= m_stSelectItem [nCount].strItemCaption;
			break;
		end;
	end;
}
	strItemName		:= m_stMasterItem.strItemCaption;
	DtlCmnLabelExCodeTitle     .Caption	:= strItemName + 'ｺｰﾄﾞ';
	DtlCmnLabelClassTitle      .Caption	:= strItemName + '分類';
	DtlCmnLabelCharacterTitle  .Caption	:= strItemName + '性格ｺｰﾄﾞ';
//<120517>↓
//	DtlCmnLabelCommonStockTitle.Caption	:= '共通仕入'   + strItemName;
	DtlCmnLabelCommonStockTitle.Caption	:= '消費税課税仕入'   + strItemName;
//<120517>↑
	DtlCmnLabelExCodeBSAddTitle.Caption	:= 'BS 計上' + strItemName;

	DtlCmnEditClassCode          .SelectItems.Clear ();
	DtlCmnEditClassCode          .SelectItems.Add   ('0: P/L'  + strItemName);
	DtlCmnEditClassCode          .SelectItems.Add   ('1: 共通' + strItemName + '(B/S+P/L)');
	DtlCmnEditClassCode          .SelectItems.Add   ('2: B/S'  + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Clear ();
	DtlCmnEditCharacterCode      .SelectItems.Add   ('0: 通常'      + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Add   ('1: 営業'      + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Add   ('2: 製造'      + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Add   ('3: 管理'      + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Add   ('4: 営業+管理' + strItemName);
	DtlCmnEditCharacterCode      .SelectItems.Add   ('5: 製造+管理' + strItemName);
//	DtlCmnEditCharacterCode      .SelectItems.Add   ('9: 支店'      + strItemName);
	DtlCmnEditCommonStockDivision.SelectItems.Clear ();
//<120517>↓
//	DtlCmnEditCommonStockDivision.SelectItems.Add   ('0: 対象外');
//	DtlCmnEditCommonStockDivision.SelectItems.Add   ('1: 対象' + strItemName);
	DtlCmnEditCommonStockDivision.SelectItems.Add   ('0: 指定なし');
	DtlCmnEditCommonStockDivision.SelectItems.Add   ('1: 課税・非課税売上共通');
	DtlCmnEditCommonStockDivision.SelectItems.Add   ('2: 非課税売上対応');
//<120517>↑

	// セグメント＆分類.......................................................>>
	for iTmp := 1 to 10 do
    begin
		// 一旦セグメント未採用にする
		DtlLabelSegNM[iTmp].Visible := False;									// タイトル
		DtlCmnEditSegCD[iTmp].Visible := False;									// 外部ｺｰﾄﾞ
		DtlLabelSegTx[iTmp].Visible := False;									// 名称
		DtlLabelSegNM[iTmp].Top := 6;
		DtlCmnEditSegCD[iTmp].Top := 5;
		DtlLabelSegTx[iTmp].Top := 5;
		// 一旦分類未採用にする
		DtlLabelBunruiNM[iTmp].Visible := False;									// タイトル
		DtlCmnEditBunruiCD[iTmp].Visible := False;									// 外部ｺｰﾄﾞ
		DtlLabelBunruiTx[iTmp].Visible := False;									// 名称
		DtlLabelBunruiNM[iTmp].Top := 6;
		DtlCmnEditBunruiCD[iTmp].Top := 5;
		DtlLabelBunruiTx[iTmp].Top := 5;
	end;
   	MLabel6.Visible := False;
//    MLine5t.Visible := False;
    MLine5d.Visible := False;

   	MLabel18.Visible := False;
//    MLine4t.Visible := False;
    MLine4d.Visible := False;

	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if ParentMasterDiv = 41 then
  begin

	iTmp2 := 0;
	for nCount := 1 to ITEM_MAX do
	begin
		if ((MK_SEG01 <= m_stSelectItem [nCount].nMasterDivision)
	     AND (m_stSelectItem [nCount].nMasterDivision <= MK_SEG01 + 9)) then
		begin
        	iTmp := m_stSelectItem [nCount].nMasterDivision - MK_SEG01 + 1;
            if (SegMa[iTmp] = 1) then
			begin
	        	DtlLabelSegNM[iTmp].Caption := m_stSelectItem [nCount].strItemCaption + 'ｺｰﾄﾞ';
    	        // 採用にする
				DtlLabelSegNM[iTmp].Visible := True;
				DtlCmnEditSegCD[iTmp].Visible := True;
                DtlCmnEditSegCD[iTmp].InputAttr := InputAttrTmp[m_stSelectItem [nCount].nCodeAttribute];	// コード属性
                if (m_stSelectItem [nCount].nCodeAttribute <= 1) then	// 数字
					DtlCmnEditSegCD[iTmp].ImeMode   := imDisable
                else													// フリー
                begin
					DtlCmnEditSegCD[iTmp].ImeMode   := imClose;
                    DtlCmnEditSegCD[iTmp].ValidChars := m_strValidCharacters;
                end;
                DtlCmnEditSegCD[iTmp].MaxLength	:= m_stSelectItem [nCount].nCodeDigit;	// コード桁数
				DtlLabelSegTx[iTmp].Visible := True;

				DtlLabelSegNM[iTmp].Top := (iTmp2 * ScrollBox4.VertScrollBar.Increment) + 6;
				DtlCmnEditSegCD[iTmp].Top := (iTmp2 * ScrollBox4.VertScrollBar.Increment) + 5;
				DtlLabelSegTx[iTmp].Top := (iTmp2 * ScrollBox4.VertScrollBar.Increment) + 5;

	            iTmp2 := iTmp2 + 1;
		    	MLabel6.Visible := True;
//	    	    MLine5t.Visible := True;
    	    	MLine5d.Visible := True;
			end;
		end;
	end;
   	ScrollBox4.VertScrollBar.Range := iTmp2 * ScrollBox4.VertScrollBar.Increment;
  end;
	// セグメント ........................................................<<
	// 分類 ........................................................>>
	iTmp2 := 0;
	for nCount := 1 to 10 do
	begin
		if (BunruiMKbn + nCount = m_stBunruiItem [nCount].nMasterDivision) then
		begin
        	DtlLabelBunruiNM[nCount].Caption := m_stBunruiItem [nCount].strItemCaption + 'ｺｰﾄﾞ';
   	        // 採用にする
			DtlLabelBunruiNM[nCount].Visible := True;
			DtlCmnEditBunruiCD[nCount].Visible := True;
            DtlCmnEditBunruiCD[nCount].InputAttr := InputAttrTmp[m_stBunruiItem [nCount].nCodeAttribute];	// コード属性
            if (m_stBunruiItem [nCount].nCodeAttribute <= 1) then	// 数字
				DtlCmnEditBunruiCD[nCount].ImeMode   := imDisable
            else													// フリー
            begin
				DtlCmnEditBunruiCD[nCount].ImeMode   := imClose;
                DtlCmnEditBunruiCD[nCount].ValidChars := m_strValidCharacters;
            end;
            DtlCmnEditBunruiCD[nCount].MaxLength	:= m_stBunruiItem [nCount].nCodeDigit;	// コード桁数
			DtlLabelBunruiTx[nCount].Visible := True;

			DtlLabelBunruiNM[nCount].Top := (iTmp2 * ScrollBox3.VertScrollBar.Increment) + 6;
			DtlCmnEditBunruiCD[nCount].Top := (iTmp2 * ScrollBox3.VertScrollBar.Increment) + 5;
			DtlLabelBunruiTx[nCount].Top := (iTmp2 * ScrollBox3.VertScrollBar.Increment) + 5;

            iTmp2 := iTmp2 + 1;
	    	MLabel18.Visible := True;
//    	    MLine4t.Visible := True;
   	    	MLine4d.Visible := True;
		end;
	end;
   	ScrollBox3.VertScrollBar.Range := iTmp2 * ScrollBox4.VertScrollBar.Increment;
	// 分類 ........................................................<<

	if	(m_nCurrentAdoptDiv = 1) then											// 部門採用区分: 1=P/Lのみ採用
	begin
		if ((ParentMasterDiv = 41) OR (ParentMasterDiv = 101)) then
        begin
			StdCmnGridExistAdoptDivision.ReadOnly	:= TRUE;
			StdCmnGridExistAdoptDivision.TabStop	:= FALSE;
        end;

		DtlCmnEditClassCode .Value		:= 0;									// 部門分類: 0=P/L部門
		DtlCmnEditClassCode .Color		:= TJNTCRP0020030f (Self).Color;
		DtlCmnLabelClassDesc.Caption	:= 'P/L' + strItemName;

		DtlCmnEditClassCode.ArrowDisp	:= adNone;
		DtlCmnEditClassCode.F4Arrow		:= FALSE;
		DtlCmnEditClassCode.TabStop		:= FALSE;
		DtlCmnEditClassCode.Static		:= TRUE;	//HIS0013
		DtlCmnEditClassCode.ReadOnly	:= TRUE;

//		DtlCmnEditClassCode  .Enabled	:= FALSE;
//		DtlCmnLabelClassTitle.Enabled	:= FALSE;
//		DtlCmnLabelClassDesc .Enabled	:= FALSE;
	end
	else
	begin
		if ((ParentMasterDiv = 41) OR (ParentMasterDiv = 101)) then
        begin
			StdCmnGridExistAdoptDivision.ReadOnly	:= FALSE;
			StdCmnGridExistAdoptDivision.TabStop	:= TRUE;
        end;

		DtlCmnEditClassCode.ArrowDisp	:= adFocused;
		DtlCmnEditClassCode.F4Arrow		:= TRUE;
//		DtlCmnEditClassCode.Static		:= TRUE;	//HIS0013
		DtlCmnEditClassCode.Static		:= FALSE;	//HIS0013
		DtlCmnEditClassCode.ReadOnly	:= FALSE;
		DtlCmnEditClassCode.TabStop		:= TRUE;	// 051121 最後にこれでないとダメみたいだ

//		DtlCmnEditClassCode  .Enabled	:= TRUE;
//		DtlCmnLabelClassTitle.Enabled	:= TRUE;
//		DtlCmnLabelClassDesc .Enabled	:= TRUE;
	end;

	// 部門 OR セグメント
	if	(((m_nCurrentMasterDiv = 41)
      OR ((101 <= m_nCurrentMasterDiv) AND (m_nCurrentMasterDiv <= 111)))
    and (m_nCurrentAdoptDiv = 2)) then
	begin
		DtlCmnEditExCodeBSAddNumeric.Visible	:= TRUE;
		DtlCmnEditExCodeBSAddFree   .Visible	:= TRUE;
		DtlCmnLabelExCodeBSAddTitle .Visible	:= TRUE;
		DtlCmnLabelExCodeBSAddDesc  .Visible	:= TRUE;
	end
	else
	begin
		DtlCmnEditExCodeBSAddNumeric.Visible	:= FALSE;
		DtlCmnEditExCodeBSAddFree   .Visible	:= FALSE;
		DtlCmnLabelExCodeBSAddTitle .Visible	:= FALSE;
		DtlCmnLabelExCodeBSAddDesc  .Visible	:= FALSE;
	end;

	CmnSplitter           .Enabled	:= TRUE;
	CmnToolbarButtonPrint .Enabled	:= m_cJNTArea.IsPrint();
	StdCmnClientPanel     .Enabled	:= TRUE;
	StdCmnClientPanelExist.Enabled	:= TRUE;
	StdCmnClientPanelTotal.Enabled	:= TRUE;
    MPanel3				  .Enabled	:= TRUE;
    MPanel4				  .Enabled	:= TRUE;
	DtlCmnClientPanel     .Enabled	:= TRUE;
{051124
	StdCmnTab.Items [0]   .Selected	:= TRUE;
	StdCmnTab.Items [1]   .Selected	:= FALSE;

	DtlCmnClientPanel     .Visible	:= FALSE;
	StdCmnClientPanel     .Visible	:= TRUE;

	CmnToolbarButtonDetail.Caption	:= '詳細(&T)';
}
//★★★	fnRebuildTreeViewItems ();
	if StdCmnClientPanel.Visible then	// 051124 >>
		fnSetParentItemsInfo   ()		// 一覧の場合
    else
    begin
			DtlNCode := '0';
			fnResetDetailScreen		 ();

			// 外部コード消去>>
			if	(m_nCurrentCodeAttr <= 1) then
			begin
				DtlCmnEditExCodeNumeric.Enabled	:= TRUE;
				DtlCmnEditExCodeNumeric.Color	:= clWindow;
//				DtlCmnEditExCodeNumeric.SetFocus;			// コードにフォーカス
			end
			else
			begin
				DtlCmnEditExCodeFree.Enabled	:= TRUE;
				DtlCmnEditExCodeFree.Color		:= clWindow;
//				DtlCmnEditExCodeFree.SetFocus;				//  コードにフォーカス
			end;

			DtlCmnEditExCodeNumeric.Value		:= 0;
			DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
			DtlCmnEditExCodeFree   .Text		:= '';
			// 外部コード消去<<

			m_fChangeDetails	:= FALSE;
    end;								// 051124 <<

	//組織体系パターン１がなかったら作る
{
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode, TStartDate, TEndDate, PtnNm FROM '+ DEF_HAPTLR);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND PtnNo = 1 AND RDelKbn = :not_del');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('not_del'        ).AsInteger	:= DEF_NOT_DEL;				// 削除区分＝正規レコード

		Open ();

		if	(EOF) then
        begin
			//MakeNspTlrで使うので一旦切断
			dqMasterData.Close ();
			dqMasterData.Free  ();

			MakeNspTlr(1);		// パターン１作成

            //一応再接続
			dqMasterData	:= TMQuery.Create (Self);		// 050606
			m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続
		end;
	end;
}
	//組織体系パターン１がなかったら作る

	dqMasterData.Close ();
	dqMasterData.Free  ();

	fnPartsControl(m_nReferMode);

	Result	:= TRUE;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddOnArrowClick (TObject)								*/
//*																									*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ [B/S計上部門ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddOnArrowClick (Sender: TObject);
// 0706 EXP >>
var
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
//    i64		:	Int64;
begin
    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;		       	//MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;       //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.MasterKbn     :=  m_nCurrentMasterDiv;	//マスタ区分
    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝部門

    lvExpSend.TBarNM        :=  m_stMasterItem.strItemCaption + '検索エクスプローラー'; //<210202>Upd 長音対応
{
    lvExpSend.TableName     :=  'HojyoMA';          //部門マスタ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;
    lvExpSend.TrRootCaption :=  m_stMasterItem.strItemCaption;
    lvExpSend.WhereStr		:= fnMakeSQLConstructionBSAdd ();			// Where句の条件
}
    lvExpSend.WhereStr		:= 'HojyoKbn2 <> 0';						// Where句の条件

    lvExpSend.WhereStr		:= lvExpSend.WhereStr + ' AND RDelKbn = 0 ';		// 050829

    lvExpSend.WhereStr		:= lvExpSend.WhereStr + ' AND NCode <> ' + DtlNCode + ' ';	// 050913

	lvExpSend.SumKbn		:= 0;										// 実在のみ 050906

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			DtlCmnEditExCodeBSAddNumeric.Value		:= StrToInt64 (Trim (lvExpRecv.GCode));
			DtlCmnEditExCodeBSAddNumeric.InputFlag	:= FALSE;
		end
		else
			DtlCmnEditExCodeBSAddFree.Text	:= lvExpRecv.GCode;

		DtlCmnLabelExCodeBSAddDesc.Caption	:= lvExpRecv.Nmk;

		// 暫定＞＞内部コードが返ってこない
		DtlCmnLabelNCodeBSAdd	  .Caption	:= GetNCodeFromGCode(lvExpRecv.GCode);
		MjsDispCtrl.MjsNextCtrl (Self);
    end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnMakeSQLConstructionBSAdd ()												*/
//*																									*/
//*	目的	: 部門登録処理 条件SQL文取得処理														*/
//*																									*/
//*	戻り値	: String, (条件SQL文)										                            */
//*																									*/
//***************************************************************************************************/
function	TJNTCRP0020030f.fnMakeSQLConstructionBSAdd (): String;
var
	strSQLConst: String;

begin
	strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [m_nCurrentMasterDiv]) +
													' AND RDelKbn = 0 AND SumKbn = 0 AND HojyoKbn2 <> 0';

	Result	:= strSQLConst;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnJNTCRP0020030fOnPaint ()													*/
//*																									*/
//*	目的	: OnPaintイベント																		*/
//*			  最初の１回目のみfnChangeSelectionScreen()を呼び出し、適用開始日にフォーカス			*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
procedure	TJNTCRP0020030f.fnJNTCRP0020030fOnPaint (Sender: TObject);
var
	stMessageRec: TMJSMsgRec;
begin
	if	(m_fComboBoxListDraw) then
	begin
		m_fComboBoxListDraw	:= FALSE;

		if	(CmnInstructionCombo.Items.Count = 1)		// 有効なセグメントが一つ
		 OR (ParentMasterDiv <> 101) then					// 部門
		begin
			if	(fnChangeSelectionScreen ()) then
			begin
				m_cACControl	:= EDateStart;
				m_cACControl.SetFocus ();
			end;
		end
		else
        begin
			CmnInstructionCombo.ItemIndex := 0;
			CmnInstructionCombo.DroppedDown	:= TRUE;
       		//CmnInstructionCombo.SetFocus ();
		end;
	// 050915 >>
	end
	else
    begin
		// 詳細
		if (DtlCmnClientPanel.Visible) then
        begin
//<100630>↓
//			if ((ParentMasterDiv = 41) OR (ParentMasterDiv = 101)) then
//            begin
//				if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
//				    FFunctionBar.SetFuncCaption (1, ' F1 ' + STR_FUNC_FREE)
//        	    else
//				    FFunctionBar.SetFuncCaption (1, ' F1 フリー項目参照');
//				FFunctionBar.SetFuncEnabled (1, True) ;
//			end;
//<100630>↑
            if DtlCmnEditNameSimple.Focused then
            begin
				m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 19);
//<100906>↓
//				FFunctionBar.SetFuncCaption (8, stMessageRec.sMsg);
//				FFunctionBar.SetFuncEnabled (8, True) ;
				m_arFunction[7]	:= stMessageRec.sMsg;
				FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
				FFunctionBar.Enabled	:= True;
//<110131_3>↑
            end;
		end;
	// 050915 <<
	end;

end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnUpdateGridMemDataRecord (Integer; String; Integer)						*/
//*																									*/
//*	目的	: 部門登録処理 																			*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計)										*/
//*			  strExCode		= 部門内部ｺｰﾄﾞ！														*/
//*			  nTagKind		= 付箋種類 (0:なし, 1:赤, 2:緑...)										*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnUpdateGridMemDataRecord (nSumDivision: Integer; strExCode: String; nTagKind: Integer);
var
	cMemData	 : TdxMemData;
	strExCodeWork: String;
//	strFormat	 : String;
	nRetRecNo	 : Integer;

begin
	if	(Trim (strExCode) = '') then
		Exit;

	strExCodeWork	:= strExCode;

{strExCodeWork は内部コードなので不要
	if  (m_nCurrentCodeAttr <= 1) then
	begin
		case (m_nCurrentCodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
		strExCodeWork	:= Trim (strExCodeWork);
	end;
}
	if	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
		cMemData	:= StdCmnMemDataExist
	else
		cMemData	:= StdCmnMemDataTotal;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'nInCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			cMemData.First ()
		else
			cMemData.RecNo	:= nRetRecNo;

		cMemData.Edit ();
		cMemData.FieldByName('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnMoveGridRecordSelecter (Integer; String)								*/
//*																									*/
//*	目的	: 部門登録処理 																			*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計...)										*/
//*			  strExCode		= 部門ｺｰﾄﾞ																*/
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnMoveGridRecordSelecter (nSumDivision: Integer; strExCode: String);
var
	cMemData	 : TdxMemData;
	nRetRecNo	 : Integer;
	nRecMax		 : Integer;
	strExCodeWork: String;
//	strFormat	 : String;

begin
	// 内部コード！
	if	(Trim (strExCode) = '') then
		Exit;

	if	(strExCode = '0') then
		Exit;

	strExCodeWork	:= strExCode;

{
	if  (m_nCurrentCodeAttr <= 1) then
	begin
		case (m_nCurrentCodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_nCurrentCodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_nCurrentCodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
	end;
}
	if	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
	begin
		cMemData	:= StdCmnMemDataExist;
		nRecMax		:= m_nGridExistRecords;
	end
	else
	begin
		cMemData	:= StdCmnMemDataTotal;
		nRecMax		:= m_nGridTotalRecords;
	end;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'nInCode');

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
//*	関数	: TJNTCRP0020030f.fnChangeEditComponentState (Boolean)										*/
//*																									*/
//*	目的	: 部門登録処理 詳細画面ｴﾃﾞｨｯﾄ[個別原価率／B/S計上部門]表示状態変更処理					*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: fEnabled	= 表示状態 (TRUE:ON, FALSE:OFF)												*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnChangeEditComponentState (fEnabled: Boolean);
begin
	DtlCmnEditExCodeBSAddNumeric.Enabled	:= fEnabled;
	DtlCmnEditExCodeBSAddFree   .Enabled	:= fEnabled;
	DtlCmnLabelExCodeBSAddTitle .Enabled	:= fEnabled;
	DtlCmnLabelExCodeBSAddDesc  .Enabled	:= fEnabled;
//★★★	DtlCmnLabelCostRateTitle    .Enabled	:= fEnabled;
//★★★	DtlCmnLabelCostRateAddition .Enabled	:= fEnabled;

	if	(fEnabled) then
	begin
		DtlCmnEditExCodeBSAddNumeric.Color	:= clWindow;
		DtlCmnEditExCodeBSAddFree   .Color	:= clWindow;
	end
	else
	begin
		DtlCmnEditExCodeBSAddNumeric.Color	:= TJNTCRP0020030f (Self).Color;
		DtlCmnEditExCodeBSAddFree   .Color	:= TJNTCRP0020030f (Self).Color;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnInitializeDetailScreen (Boolean)												*/
//*																											*/
//*	目的	: 部門登録処理 詳細画面初期化処理																*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: fClearExCode	= 外部ｺｰﾄﾞ消去 (TRUE:する, FALSE:しない)										*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnInitializeDetailScreen (fClearExCode: Boolean);
var
	i			: Integer;
begin

	if	(fClearExCode) then															// 外部ｺｰﾄﾞ消去
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			DtlCmnEditExCodeNumeric.Enabled	:= TRUE;
			DtlCmnEditExCodeNumeric.Color	:= clWindow;
		end
		else
		begin
			DtlCmnEditExCodeFree.Enabled	:= TRUE;
			DtlCmnEditExCodeFree.Color		:= clWindow;
		end;

		DtlCmnEditExCodeNumeric.InputFlag	:= TRUE;
		DtlCmnEditExCodeNumeric.Value		:= 0;
		DtlCmnEditExCodeFree   .Text		:= '';
	end;

	DtlCmnEditAssociation        .Text		:= '';
	DtlCmnEditName               .Text		:= '';
	DtlCmnEditNameSimple         .Text		:= '';
	DtlCmnEditCharacterCode      .InputFlag	:= TRUE;
	DtlCmnEditCharacterCode      .Value		:= 0;
//	DtlCmnLabelCharacterDesc     .Caption	:= fnGetCharacterDescription (0, DESCRIPTION_FULL);
	DtlCmnLabelCharacterDesc     .Caption	:= '';
	DtlCmnEditCommonStockDivision.InputFlag	:= TRUE;
	DtlCmnEditCommonStockDivision.Value		:= 0;
//	DtlCmnLabelCommonStockDesc   .Caption	:= fnGetCmnStockDescription  (0, DESCRIPTION_FULL);
	DtlCmnLabelCommonStockDesc   .Caption	:= '';
	DtlCmnEditAppDateStart       .Value		:= 0;
	DtlCmnEditAppDateEnd         .Value		:= 0;

	DtlCmnEditExCodeBSAddNumeric .InputFlag	:= TRUE;
	DtlCmnEditExCodeBSAddNumeric .Value		:= 0;
	DtlCmnEditExCodeBSAddFree    .Text		:= '';
	DtlCmnLabelExCodeBSAddDesc   .Caption	:= '';
	DtlCmnLabelNCodeBSAdd		 .Caption	:= '';

//	if	(m_nCurrentAdoptDiv <> 1) then
//	begin
		DtlCmnEditClassCode .Value		:= 0;
		DtlCmnEditClassCode .InputFlag	:= TRUE;
//		DtlCmnLabelClassDesc.Caption	:= fnGetClassDescription (0, DESCRIPTION_FULL);
		DtlCmnLabelClassDesc.Caption	:= '';
//	end;

	DtlCmnEditHonsitenCodeNumeric .Value		:= 0;
	DtlCmnEditHonsitenCodeNumeric .InputFlag	:= TRUE;
	DtlCmnLabelHonsitenDesc.Caption				:= '';
	DtlCmnEditDfKeihiCode .Value				:= 0;
	DtlCmnEditDfKeihiCode .InputFlag			:= TRUE;
	DtlCmnLabelDfKeihiDesc.Caption				:= '';

    for i := 1 to 10 do
    begin
		{BI分類コード}
		DtlCmnEditBunruiCD[i].Text		:= '';
		DtlCmnEditBunruiCD[i].InputFlag	:= TRUE;
        DtlBunruiNCode[i]				:= '';
        DtlLabelBunruiTx[i].Caption		:= '';						// 名称

		{セグメントコード}
		DtlCmnEditSegCD[i].Text		:= '';
		DtlCmnEditSegCD[i].InputFlag	:= TRUE;
        DtlSegNCode[i]					:= '';
        DtlLabelSegTx[i].Caption		:= '';						// 名称
	end;

//<100906>↓
////<100630>↓
//	FFunctionBar.SetFuncCaption (1, '');
//	FFunctionBar.SetFuncEnabled (1, False) ;
////<100630>↑
//<110131_3>↓
//	m_arFunction[0]	:= '';
//	FFunctionBar.CopyFuncData(m_arFunction);
////<100906>↑
	if ((ParentMasterDiv = 41)
	 or (ParentMasterDiv = 101)) then
	begin
        if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
        begin							//<MLXDEP>begin,end内を一段字下げ
            if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
            else
                m_arFunction[0]	:= ' F1 フリー項目参照';
        end;							//<MLXDEP>
		FFunctionBar.CopyFuncData(m_arFunction);
	end
	else
	begin
		m_arFunction[0]	:= '';
		FFunctionBar.CopyFuncData(m_arFunction);
	end;
	FFunctionBar.Enabled	:= True;
//<110131_3>↑

	m_nSelectTagKind	:= 0;

	DtlCmnImageTag.Picture	:= nil;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDisableDetailScreen (Integer)											*/
//*																									*/
//*	目的	: 部門登録処理 詳細画面無効化処理														*/
//*																									*/
//*	戻り値	: なし,														                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計, 9:総合計)								*/
//*                                                                                                 */
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDisableDetailScreen (nSumDivision: Integer);
begin
	if	((nSumDivision <> 0)							// 0214 合計・総合系
   	  or (nSumDivision = DIVISION_GENERAL)) 			// 0214 諸口
    then
	begin
		//DtlCmnEditClassCode          .Value		:= 0;
		//DtlCmnEditCharacterCode      .Value		:= 0;
		//DtlCmnEditCommonStockDivision.Value		:= 0;
		// 050920 >>
//<080214_1>↓
//		DtlCmnEditAppDateStart.Visible := False;
//		DtlCmnEditAppDateEnd.Visible := False;
//		DtlCmnLabelAppDateTitle.Visible := False;
//		DtlCmnLabelAppDateAddtion.Visible := False;
//<080214_1>↑
		// 050920 <<
		DtlCmnEditClassCode          .InputFlag	:= TRUE;
		DtlCmnEditCharacterCode      .InputFlag	:= TRUE;
		DtlCmnEditCommonStockDivision.InputFlag	:= TRUE;
		DtlCmnLabelClassDesc         .Caption	:= '';
		DtlCmnLabelCharacterDesc     .Caption	:= '';
		DtlCmnLabelCommonStockDesc   .Caption	:= '';

		fnChangeComponentState (nSumDivision, FALSE);
	end
	else
	begin
		// 050920 >>
//<080214_1>↓
//		DtlCmnEditAppDateStart.Visible := True;
//		DtlCmnEditAppDateEnd.Visible := True;
//		DtlCmnLabelAppDateTitle.Visible := True;
//		DtlCmnLabelAppDateAddtion.Visible := True;
//<080214_1>↑
		// 050920 <<
		DtlCmnEditClassCode          .InputFlag	:= FALSE;
		DtlCmnEditCharacterCode      .InputFlag	:= FALSE;
		DtlCmnEditCommonStockDivision.InputFlag	:= FALSE;

		fnChangeComponentState (nSumDivision, TRUE);
	end;

//<100906>↓
////<100630>↓
//	FFunctionBar.SetFuncCaption (1, '');
//	FFunctionBar.SetFuncEnabled (1, False) ;
////<100630>↑
//<110131_3>↓
//	m_arFunction[0]	:= '';
//	FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
	if ((ParentMasterDiv = 41)
	 or (ParentMasterDiv = 101)) then
	begin
        if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
        begin							//<MLXDEP>begin,end内を一段字下げ
            if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
            else
                m_arFunction[0]	:= ' F1 フリー項目参照';
        end;							//<MLXDEP>
		FFunctionBar.CopyFuncData(m_arFunction);
	end
	else
	begin
		m_arFunction[0]	:= '';
		FFunctionBar.CopyFuncData(m_arFunction);
	end;
	FFunctionBar.Enabled	:= False;
//<110131_3>↑

    //<070410> ﾀﾌﾞ切替時は削除は無効
    CmnToolbarButtonDelete.Enabled	:= False;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnChangeComponentState (Integer; Boolean)											*/
//*																											*/
//*	目的	: 部門登録処理 詳細画面表示状態変更処理															*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0: 実在, 1:合計, 9:総合計, DIVISION_GENERAL:諸口)				*/
//*			  fEnabled		= 表示状態 (TRUE:ON, FALSE:OFF)													*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnChangeComponentState (nSumDivision: Integer; fEnabled: Boolean);
var		i : Integer;
begin

//<MLWK>↓
	// 実在
	if	(m_bMLWF = True)
	and	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
	begin
		DtlCmnButtonUpdate.Enabled	:= FALSE;
	end
	else
	begin
//<MLWK>↑
// <011>↓
//	DtlCmnButtonUpdate.Enabled	:= TRUE;										//	HIS0002
		if m_cJNTArea.IsAppend or m_cJNTArea.IsModify then
			DtlCmnButtonUpdate.Enabled	:= TRUE;
// <011>↑
//<MLWK>↓
	end;
//<MLWK>↑
	DtlCmnButtonCancel.Enabled	:= TRUE;

	DtlCmnEditCharacterCode      .Enabled	:= fEnabled;
	DtlCmnEditCommonStockDivision.Enabled	:= fEnabled;
//	DtlCmnEditAppDateStart       .Enabled	:= fEnabled;
//	DtlCmnEditAppDateEnd         .Enabled	:= fEnabled;
	DtlCmnEditExCodeBSAddNumeric .Enabled	:= fEnabled;
	DtlCmnEditExCodeBSAddFree    .Enabled	:= fEnabled;

	DtlCmnLabelCharacterTitle    .Enabled	:= fEnabled;
	DtlCmnLabelCommonStockTitle  .Enabled	:= fEnabled;
//	DtlCmnLabelAppDateTitle      .Enabled	:= fEnabled;
//	DtlCmnLabelAppDateAddtion    .Enabled	:= fEnabled;
	DtlCmnLabelExCodeBSAddTitle  .Enabled	:= fEnabled;
//★★★	DtlCmnLabelCostRateTitle     .Enabled	:= fEnabled;
//★★★	DtlCmnLabelCostRateAddition  .Enabled	:= fEnabled;
//★★★	DtlCmnLabelCompanyTitle      .Enabled	:= fEnabled;

	if	(nSumDivision = 9) then															// 実在/合計区分: 9=総合計
		DtlCmnImageTag.Enabled	:= FALSE
	else
		DtlCmnImageTag.Enabled	:= TRUE;

//	if	(m_nCurrentAdoptDiv <> 1) then
//	begin
		DtlCmnEditClassCode  .Enabled	:= fEnabled;
		DtlCmnLabelClassTitle.Enabled	:= fEnabled;
//	end;

	if	(fEnabled) then
	begin
		if	(m_nCurrentAdoptDiv <> 1) then
			DtlCmnEditClassCode.Color	:= clWindow;

		DtlCmnEditCharacterCode      .Color		:= clWindow;
		DtlCmnEditAppDateStart       .Color		:= clWindow;
		DtlCmnEditAppDateEnd         .Color		:= clWindow;
		DtlCmnEditExCodeBSAddNumeric .Color		:= clWindow;
		DtlCmnEditExCodeBSAddFree    .Color		:= clWindow;
	end
	else
	begin
		if	(m_nCurrentAdoptDiv <> 1) then
			DtlCmnEditClassCode.Color	:= TJNTCRP0020030f (Self).Color;

		DtlCmnEditCharacterCode     .Color	:= TJNTCRP0020030f (Self).Color;
//		DtlCmnEditAppDateStart      .Color	:= TJNTCRP0020030f (Self).Color;
//		DtlCmnEditAppDateEnd        .Color	:= TJNTCRP0020030f (Self).Color;
		DtlCmnEditExCodeBSAddNumeric.Color	:= TJNTCRP0020030f (Self).Color;
		DtlCmnEditExCodeBSAddFree   .Color	:= TJNTCRP0020030f (Self).Color;
	end;

	DtlCmnEditCommonStockDivision.Color	:= TJNTCRP0020030f (Self).Color;		// 共通仕入部門

	if	(m_nReferMode = REFER)													// 参照時 HIS0002
     OR (ModeBtn.Caption = '参　照') then										// 修正権限なし && 修正
	begin
		//参照時も外部コードは入力可
//		DtlCmnEditExCodeNumeric		 .Enabled	:= FALSE;
//		DtlCmnEditExCodeFree		 .Enabled	:= FALSE;
		//参照時も適用期間は入力可？
//		DtlCmnEditAppDateStart		 .Enabled	:= FALSE;
//		DtlCmnEditAppDateEnd		 .Enabled	:= FALSE;
		//基本情報無効
		MPanel8						 .Enabled	:= FALSE;
		// 会計情報無効
		PDtlMasPanel				 .Enabled	:= FALSE;
		// 資産情報無効
		PDtlDepPanel				 .Enabled	:= FALSE;
		// 分類・セグメント無効
        MPanel5						 .Enabled	:= FALSE;
        MPanel7						 .Enabled	:= FALSE;

		DtlCmnButtonUpdate			 .Enabled	:= FALSE;
//		DtlCmnButtonCancel			 .Enabled	:= FALSE;
	end
    else
	begin
		//基本情報無効
		MPanel8						 .Enabled	:= TRUE;
		// 会計情報無効
		PDtlMasPanel				 .Enabled	:= TRUE;
		// 資産情報無効
		PDtlDepPanel				 .Enabled	:= TRUE;
		// 分類・セグメント無効
        MPanel5						 .Enabled	:= TRUE;
        MPanel7						 .Enabled	:= TRUE;

//<MLWK>↓
		// 実在
		if	(m_bMLWF = True)
		and	((nSumDivision = 0) or (nSumDivision = DIVISION_GENERAL)) then
			DtlCmnButtonUpdate			 .Enabled	:= False
		else
//<MLWK>↑
			DtlCmnButtonUpdate			 .Enabled	:= TRUE;

		DtlCmnButtonCancel			 .Enabled	:= TRUE;
	end;

	if	((nSumDivision <> 0)							// 0214 合計・総合系
   	  or (nSumDivision = DIVISION_GENERAL)) 			// 0214 諸口
    then
	begin
        PDtlMasPanel.Visible := False;					// 会計パネル
		PDtlDepPanel.Visible := False;					// 資産パネル
		PDtlBiCdPanel.Visible := False;					// 分類パネル
		PDtlSegCdPanel.Visible := False;				// セグメントパネル
		MLine4t.Visible := False;						// 分類の上
		MLine4d.Visible := False;						// 分類の下
//		MLine5t.Visible := False;						// セグの上
		MLine5d.Visible := False;						// セグの下
    end
	else
	begin
		// 社員系でない場合（部門・セグメント）
	    if (ParentMasterDiv = 41) OR (ParentMasterDiv = 101) then
        begin
	        PDtlMasPanel.Visible := True;		  		// 会計パネル
			MLine4t.Visible := True;			 		// 分類の上
			PDtlBiCdPanel.Visible := True;		 		// 分類パネル

			for i := 1 to 10 do
			begin
				if DtlCmnEditBunruiCD[i].Visible then
				begin
	    			//MLabel18.Visible := True;
		    	    //MLine4t.Visible := True;
   	    			MLine4d.Visible := True;
				end;
			end;
//			MLine4d.Visible := True;						// 分類の下
//			PDtlDepPanel.Visible := True;					// 資産パネル
		end
        else
        begin
	        PDtlMasPanel.Visible := False;					// 会計パネル
			MLine4t.Visible := False;						// 分類の上
			PDtlBiCdPanel.Visible := False;					// 分類パネル
			MLine4d.Visible := False;						// 分類の下
			PDtlDepPanel.Visible := False;					// 資産パネル
        end;

		// 実在部門の場合のみセグメントパネルを表示
	    if ParentMasterDiv = 41 then					// 部門登録の場合
        begin
			PDtlSegCdPanel.Visible := True;				// セグメントパネル
//			MLine5t.Visible := True;					// セグの上
//			MLine5d.Visible := True;					// セグの下
			for i := 1 to ITEM_MAX do
			begin
				if DtlCmnEditSegCD[i].Visible then
				begin
			    	//MLabel6.Visible := True;
		    	    //MLine5t.Visible := True;
		   	    	MLine5d.Visible := True;
				end;
			end;
        end
        else											// 部門以外の場合
        begin
			PDtlSegCdPanel.Visible := False;			// セグメントパネル
//			MLine5t.Visible := False;					// セグの上
			MLine5d.Visible := False;					// セグの下
        end
    end;
end;


//**********************************************************************
//*		Proccess	:	参照・入力時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Name		:	H.Endo
//*		Date		:	2000/12/25
//*		Parameter	:	Select		:	NORMAL(通常処理),BASICONLY(基本のみ設定可能),REFER(参照のみ)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP0020030f.fnPartsControl(Select: Integer);	//	HIS0002
begin
	// 追加権限なし
	if (not m_cJNTArea.IsAppend()) then
    begin
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options - [egoCanAppend] - [egoCanInsert];
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options - [egoCanAppend] - [egoCanInsert];
    end;
	// 参照モード OR 修正権限なし
	if (Select = REFER) OR (not m_cJNTArea.IsModify()) then
	begin
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridExistCode.ReadOnly 			:=	True;
		StdCmnGridExistAssociation.ReadOnly 	:=	True;
		StdCmnGridExistName.ReadOnly 			:=	True;
		StdCmnGridExistNameSimple.ReadOnly 		:=	True;
		//	合計情報Grid
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options - [egoCanAppend] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridTotalCode.ReadOnly 		:=	True;
		StdCmnGridTotalAssociation.ReadOnly	:=	True;
		StdCmnGridTotalName.ReadOnly 		:=	True;
		StdCmnGridTotalNameSimple.ReadOnly 	:=	True;
		// 付箋は権限に関係ない？
		//	GridのPOPUP
		//StdCmnGridExist.PopupMenu	:=	nil;
		//StdCmnGridTotal.PopupMenu	:=	nil;
	end
	else
	begin
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		StdCmnGridExistAssociation.ReadOnly 	:=	False;
		StdCmnGridExistName.ReadOnly 			:=	False;
		StdCmnGridExistNameSimple.ReadOnly 		:=	False;
		//	合計情報Grid
		StdCmnGridTotal.Options	:=	StdCmnGridTotal.Options + [egoCanAppend] - [egoMultiSelect] - [egoRowSelect];
		StdCmnGridTotalCode.ReadOnly 			:=	False;
		StdCmnGridTotalAssociation.ReadOnly		:=	False;
		StdCmnGridTotalName.ReadOnly 			:=	False;
		StdCmnGridTotalNameSimple.ReadOnly 		:=	False;
		// 付箋は権限に関係ない？
		//	GridのPOPUP
		//StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
		//StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;
	end;
//<MLWK>↓
	// MLワークフローモード(実在参照のみ)
	if m_bMLWF = True then
	begin
		//	実在情報Grid
		StdCmnGridExist.Options	:=	StdCmnGridExist.Options - [egoCanAppend] - [egoCanInsert] + [egoMultiSelect] + [egoRowSelect];
		StdCmnGridExistCode.ReadOnly 			:=	True;
		StdCmnGridExistAssociation.ReadOnly 	:=	True;
		StdCmnGridExistName.ReadOnly 			:=	True;
		StdCmnGridExistNameSimple.ReadOnly 		:=	True;
	end;
//<MLWK>↑
	// 付箋は権限に関係ない？
	//	GridのPOPUP
	if (86 <= ParentMasterDiv) AND (ParentMasterDiv <= 89) then
    begin
		StdCmnGridExist.PopupMenu	:=	nil;
		StdCmnGridTotal.PopupMenu	:=	nil;
        MPanel9.PopupMenu	:=	nil;
    end
    else
    begin
		StdCmnGridExist.PopupMenu	:=	StdCmnGridPopupMenu;
		StdCmnGridTotal.PopupMenu	:=	StdCmnGridPopupMenu;
    end;

end;

//************************************************************************
//*		Component		:	ppDetailBand_StandardDep ( TppDetailBand )
//*							実在登録リスト最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP0020030f.ppDetailBand_StandardDepBeforeGenerate(Sender: TObject);	//	HIS0003
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardDep.LastRecord ) or
		(ppDetailBand_StandardDep.PageOutOfSpace  = True) Then
	begin
		if ppDetailBand_StandardDep.OverFlow = False then
			ppDetailBand_StandardDep.OverFlow := True;

		if ppStandardDepUnderLine.ReprintOnOverFlow = False then
			ppStandardDepUnderLine.ReprintOnOverFlow := True;

		ppStandardDepUnderLine.Weight := 0.75;  // ラインの太さを太くしている
	end
	else
	begin
		ppStandardDepUnderLine.Weight := 0.25;  // ラインの太さを元にもどす
	end;
end;

//************************************************************************
//*		Component		:	ppDetailBand_TtlStandard ( TppDetailBand )
//*							合計登録リスト最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP0020030f.ppDetailBand_TtlStandardBeforeGenerate(Sender: TObject);	//	HIS0003
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_TtlStandard.LastRecord ) or
		(ppDetailBand_TtlStandard.PageOutOfSpace  = True) Then
	begin
		if ppDetailBand_TtlStandard.OverFlow = False then
			ppDetailBand_TtlStandard.OverFlow := True;

		if ppTtlStandardUnderLine.ReprintOnOverFlow = False then
			ppTtlStandardUnderLine.ReprintOnOverFlow := True;

		ppTtlStandardUnderLine.Weight := 0.75;  // ラインの太さを太くしている
	end
	else
	begin
		ppTtlStandardUnderLine.Weight := 0.25;  // ラインの太さを元にもどす
	end;
end;

//<MLXDEP>↓
//************************************************************************
//*		Component		:	ppDetailBand_StandardDep ( TppDetailBand )
//*							実在登録リスト最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP0020030f.ppDetailBand_StandardDepBeforeGenerate_DEP(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_StandardDep_DEP.LastRecord ) or
		(ppDetailBand_StandardDep_DEP.PageOutOfSpace  = True) Then
	begin
		if ppDetailBand_StandardDep_DEP.OverFlow = False then
			ppDetailBand_StandardDep_DEP.OverFlow := True;

		if ppStandardDepUnderLine_DEP.ReprintOnOverFlow = False then
			ppStandardDepUnderLine_DEP.ReprintOnOverFlow := True;

		ppStandardDepUnderLine_DEP.Weight := 0.75;  // ラインの太さを太くしている
	end
	else
	begin
		ppStandardDepUnderLine_DEP.Weight := 0.25;  // ラインの太さを元にもどす
	end;
end;
//<MLXDEP>↑

//<100405>↓
//************************************************************************
//*		Component		:	ppDetailBand_TtlStandard ( TppDetailBand )
//*							フリー登録リスト最終レコード、頁の最下行を判定
//*		Event			:	BeforeGenerate
//*		Name			:	T.Shinoda
//************************************************************************
procedure TJNTCRP0020030f.ppDetailBand_FreeBeforeGenerate(Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_Free.LastRecord ) or
		(ppDetailBand_Free.PageOutOfSpace  = True) Then
	begin
		if ppDetailBand_Free.OverFlow = False then
			ppDetailBand_Free.OverFlow := True;

		if ppFreeUnderLineLeft.ReprintOnOverFlow = False then
			ppFreeUnderLineLeft.ReprintOnOverFlow := True;
		if ppFreeUnderLine.ReprintOnOverFlow = False then
			ppFreeUnderLine.ReprintOnOverFlow := True;

		ppFreeUnderLineLeft.Visible	:= True;
		ppFreeUnderLine.Pen.Style	:= psSolid;

		ppFreeUnderLineLeft.Weight	:= 0.75;	// ラインの太さを太くしている
		ppFreeUnderLine.Weight		:= 0.75;	// ラインの太さを太くしている
	end
	else
	begin
		if CmnMemDataPrintFree.FieldByName('bCodeBreak').AsBoolean = False then
		begin
			ppFreeUnderLineLeft.Visible	:= False;
			ppFreeUnderLine.Pen.Style	:= psDot;
		end
		else
		begin
			ppFreeUnderLineLeft.Visible	:= True;
			ppFreeUnderLine.Pen.Style	:= psSolid;
		end;

		ppFreeUnderLineLeft.Weight	:= 0.25;	// ラインの太さを元にもどす
		ppFreeUnderLine.Weight		:= 0.25;	// ラインの太さを元にもどす
	end;
end;
//<100405>↑

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
procedure TJNTCRP0020030f.fnSetFileOutTF(PrintDivision: Integer;							//	HIS0007
								var sTitle: TStringList; var sMemFld: TStringList);
var		i, j : Integer;
begin
	case PrintDivision of
		0:
		begin
			sTitle.Add	('コード'				);
			sTitle.Add	('正式名称'				);
			sTitle.Add	('簡略名称'				);
			sTitle.Add	('連想'					);

//<MLXDEP>↓
            if not TMSeries.IsMjsLink3 then
			begin
				sTitle.Add	('分類'					);
				sTitle.Add	('性格'					);
				sTitle.Add	('B/S計上'+ m_stMasterItem.strItemCaption + 'ｺｰﾄﾞ'		);
				sTitle.Add	('B/S計上'+ m_stMasterItem.strItemCaption + '名称'		);
//				sTitle.Add	('原価率'				);
//<120517>↓
//			sTitle.Add	('共通仕入'				);
				sTitle.Add	('消費税課税仕入'		);
//<120517>↑
			end;
//<MLXDEP>↑

			sTitle.Add	('適用期間開始'			);
			sTitle.Add	('適用期間終了'			);
			sTitle.Add	('最終更新日時'			);

			sMemFld.Add	('strExCode'			);
			sMemFld.Add	('strName'				);
			sMemFld.Add	('strNameSimple'		);
			sMemFld.Add	('strAssociation'		);

//<MLXDEP>↓
            if not TMSeries.IsMjsLink3 then
			begin
				sMemFld.Add	('strClassDesc'			);
				sMemFld.Add	('strCharacterDesc'		);
				sMemFld.Add	('strExCodeBSAdd'		);
				sMemFld.Add	('strNameSimpleBSAdd'	);
//				sMemFld.Add	('flCostRate'			);
				sMemFld.Add	('strCmnStockDesc'		);
			end;
//<MLXDEP>↑

//<101203>↓
//			sMemFld.Add	('dtAppDateStart'		);
//			sMemFld.Add	('dtAppDateEnd'			);
//			sMemFld.Add	('dtUpdateDate'			);
			sMemFld.Add	('dtAppDateStartDisp'	);
			sMemFld.Add	('dtAppDateEndDisp'		);
			sMemFld.Add	('dtUpdateDateDisp'		);
//<101203>↑
		end;
		1:
		begin
			sTitle.Add	('コード'				);
			sTitle.Add	('正式名称'				);
			sTitle.Add	('簡略名称'				);
			sTitle.Add	('連想'					);
//<100215_2>↓
			sTitle.Add	('適用期間開始'			);
			sTitle.Add	('適用期間終了'			);
//<100215_2>↑
			sTitle.Add	('最終更新日時'			);

			sMemFld.Add	('strExCode'			);
			sMemFld.Add	('strName'				);
			sMemFld.Add	('strNameSimple'		);
			sMemFld.Add	('strAssociation'		);
//<101203>↓
////<100215_2>↓
//			sMemFld.Add	('dtAppDateStart'		);
//			sMemFld.Add	('dtAppDateEnd'			);
////<100215_2>↑
//			sMemFld.Add	('dtUpdateDate'			);
			sMemFld.Add	('dtAppDateStartDisp'	);
			sMemFld.Add	('dtAppDateEndDisp'		);
			sMemFld.Add	('dtUpdateDateDisp'		);
//<101203>↑
		end;
		2:
		begin
			sTitle.Add	('コード'				);
			sTitle.Add	('正式名称'				);
			sTitle.Add	('適用期間開始'			);
			sTitle.Add	('適用期間終了'			);
			sMemFld.Add	('strExCodeDst'			);
			sMemFld.Add	('strNameSimpleDst'		);
//<101203>↓
//			sMemFld.Add	('dtStart'		        );
//			sMemFld.Add	('dtEnd'			    );
			sMemFld.Add	('dtStartDisp'			);
			sMemFld.Add	('dtEndDisp'			);
//<101203>↑

            for i:=1 to 5 do
            begin
	            for j:=1 to 10 do
    	        begin
                	if i+100 = m_stSelectItem [j].nMasterDivision then
                    	break;
                end;
                if j > 10 then
                	continue;
                if (m_stSelectItem [j].nAdoptDivision = 0)
		        or (SegMa[i] = 0) then										// 採用なし
                	continue;

				sTitle.Add	(m_stSelectItem [j].strItemCaption + 'コード');
				sMemFld.Add	('strSeg0' + IntToStr(i) + 'Code');
				sTitle.Add	(m_stSelectItem [j].strItemCaption + '名称');
				sMemFld.Add	('strSeg0' + IntToStr(i) + 'Name');
			end;

            for i:=1 to 5 do
            begin
	            for j:=1 to 10 do
    	        begin
                	if i+430 = m_stBunruiItem [j].nMasterDivision then
                    	break;
                end;

                if j > 10 then
                	continue;
                if m_stBunruiItem [j].nAdoptDivision = 0 then	// 採用なし
                	continue;

				sTitle.Add	(m_stBunruiItem [j].strItemCaption + 'コード');
				sMemFld.Add	('strBun0' + IntToStr(i) + 'Code');
				sTitle.Add	(m_stBunruiItem [j].strItemCaption + '名称');
				sMemFld.Add	('strBun0' + IntToStr(i) + 'Name');
			end;
		end;
//<100405>↓
		3,4:
		begin
			sTitle.Add	('コード'				);
			sTitle.Add	('簡略名称'				);
			sTitle.Add	('文字フリー項目名'		);
			sTitle.Add	('文字フリー項目値'		);
			sTitle.Add	('数値フリー項目名'		);
			sTitle.Add	('数値フリー項目値'		);
			sTitle.Add	('日付フリー項目名'		);
			sTitle.Add	('日付フリー項目値'		);

			sMemFld.Add	('strExCode'			);
			sMemFld.Add	('strNameSimple'		);
			sMemFld.Add	('strVFreeTitle'		);
			sMemFld.Add	('strVFree'				);
			sMemFld.Add	('strNFreeTitle'		);
			sMemFld.Add	('strNFree'				);
			sMemFld.Add	('strDFreeTitle'		);
//<101203>↓
//			sMemFld.Add	('dtDFree'				);
			sMemFld.Add	('strDFree'				);
//<101203>↑
		end;
//<100405>↑
	end;
end;

//**********************************************************************
//*		Proccess	:	ｽﾄｱﾄﾞのSQL文作成
//*		Name		:	H.Endo
//*		Date		:	2001/1/30
//*		Parameter	:	TAN_CD		:	担当者ｺｰﾄﾞ
//*						TAN_NAME	:	担当者名
//*						FLAG		:	担当者選択なし(-1以外:True/-1:False)
//*		Return		:	作成したSQL文
//*		History		:
//**********************************************************************
function	TJNTCRP0020030f.fnMakeSQL(FLAG,StratEndFlag: Boolean):String;
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
// FX10001↓
//		sSQL	:=	sSQL + ',:TANCD,:TANNAME'
		sSQL	:=	sSQL + ',:TANCD'
// FX10001↑
	end;
	sSQL	:=	sSQL + ')';

	Result	:=	sSQL;
end;


//************************************************************************
//*		Component		:	StdCmnTabChange ( TMTab )
//*							Tabが変わった時
//*		Event			:	OnChange
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure	TJNTCRP0020030f.fnStdCmnTabOnChange (Sender: TObject);
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
//*		Component		:	JNTCRP0020030f( TForm )
//*
//*		Event			:	OnDestroy
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure TJNTCRP0020030f.FormDestroy(Sender: TObject);
begin
	m_cPreview.Term ();
	m_cPreview.Free ();

    //  フリーダイアログ開放
    fnJNTFreeDlgFree();

{$IFNDEF _NOT_PRINT_}
	gfnHaniTerm(uvHani);	// 印刷対応 050803
{$ENDIF _NOT_PRINT_}

    //--- HIS0025 St ------
{
    if cExcept <> nil then
    begin
        cExcept.ResetTerm;
        cExcept.Free;
    end;
}

	//--- HIS0025 Ed ------
//  <マスタ同期>---Begin---
    if ( m_SyncMaster <> nil ) then
		m_SyncMaster.Free();
//  <マスタ同期>--- End ---

//<090616>↓
	if Assigned(m_ChkQry) then
		m_ChkQry.Free();
//<090616>↑

//<080214_2>↓
	if Assigned(m_SPMsHist) then
		m_SPMsHist.Free();
//<080214_2>↑
end;

//**************************************************************************
//	Component  :	Form
//	Event	    :	OnPaint ( ﾕｰｻﾞｰﾒｯｾｰｼﾞ)
//	Name	    :	T.Nobezawa
//**************************************************************************
procedure TJNTCRP0020030f.WMOnPaint(var Msg: TMessage);
var
	stMessageRec : TMJSMsgRec;
    strMaster	 : String;
begin

		//<IDS>>>
		if m_bIDS then							// 人事異動シミュレーションモード
		begin
			m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);

			stMessageRec.sMsg := '会社別マスターの'//<210202>Upd 長音対応
								+ m_cComArea.m_MsgStd.MsgChange (m_pRec^.m_ProgramName, '登録', '')
								+ 'を登録します。';

			MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
							 stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

//<091026>↓
			if MPanel3.Enabled = True then
//<091026>↑
				m_cACControl.SetFocus();			//<IDS2>
			Exit;
		end;
		//<<<IDS>

	if UseFlg then
	begin
		fnJNTCRP0020030fOnPaint(self);
	end
//  <マスタ同期>---Begin---
	else if Msg.WParam = Cardinal(Abs(JNTSYNC_RET_MASCHK_ERR)) then
	begin
		MjsMessageBox(nil,'マスター基本情報の取得に失敗しました。',//<210202>Upd 長音対応
					  mjError,mjDefOK);
		close;
	end
	else if Msg.WParam = Cardinal(Abs(JNTSYNC_RET_MASCHK_NO_USE)) then
	begin
		MjsMessageBoxEx(Self,
						JNTSYNC_MSG_NO_USE,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
		close;
	end
	else if Msg.WParam = Cardinal(Abs(JNTSYNC_RET_MASCHK_DIFF_C)) then
	begin
		MjsMessageBoxEx(Self,
						JNTSYNC_MSG_DIFF_C,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
		close;
	end
	else if Msg.WParam = Cardinal(Abs(JNTSYNC_RET_MASCHK_DIFF_U)) then
	begin
		MjsMessageBoxEx(Self,
						JNTSYNC_MSG_DIFF_U,
						'マスター同期', mjInformation, mjOk, mjDefOk);//<210202>Upd 長音対応
		close;
	end
	else if Msg.WParam = 99 then
	begin
		MjsMessageBoxEx(Self,
						'マスターの同期に失敗しました。',//<210202>Upd 長音対応
						'マスター同期', mjInformation, mjOk, mjDefOk); //<210202>Upd 長音対応
		close;
	end
//  <マスタ同期>--- End ---
	else
	begin
		// 採用されていないので、画面表示しない		050905
		m_fComboBoxListDraw	:= FALSE;

		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 10);

		case (ParentMasterDiv) of
			41:		strMaster := '部門';
			101:	strMaster := 'セグメント';
			86:		strMaster := '職種';
			87:		strMaster := '役職';
			88:		strMaster := '職能資格';
			89:		strMaster := '職位';
			else	strMaster := '部門';
		end;

		stMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (stMessageRec.sMsg, '@_@', strMaster);

		MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		close;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnOutputConfirmationMessage (Integer)												*/
//*																											*/
//*	目的	: 部門登録処理 終了･取消時, 確認ﾒｯｾｰｼﾞ出力処理													*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分																			*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnOutputConfirmationMessage (nDivision: Integer): Integer;
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
	if	(m_nReferMode = REFER) OR (ModeBtn.Caption = '参　照') then			// 参照時 HIS0002
	begin
		Result	:= CONFIRM_THROUGH;
		Exit;
	end;

//<MLWK>↓
	// MLワークフローモードの場合
	if m_bMLWF = True then
	begin
		if	(DtlCmnClientPanel.Visible) then								//詳細だった場合
		begin
			if DtlCmnTab.Items[0].Selected = True then						// 実在
			begin
				Result	:= CONFIRM_THROUGH;
				Exit;
			end;
		end
		else																//一覧だった場合
		begin
			if StdCmnTab.Items[0].Selected = True then						// 実在
			begin
				Result	:= CONFIRM_THROUGH;
				Exit;
			end;
		end;
	end;
//<MLWK>↑

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
			DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
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

	nReturn	:= MJSMessageBoxEx (Self, stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
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
//*	関数	: TJNTCRP0020030f.fnOutputDBErrorMessage ()															*/
//*																											*/
//*	目的	: 部門登録処理 DBｴﾗｰﾒｯｾｰｼﾞ出力処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分																			*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnOutputDBErrorMessage ();
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
					m_cErrorMsgRec.sMsg	:= '総合計又は諸口以外のレコードが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;

			//2002/11/14
			6:	begin
              		m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '支払予定データが存在するため削除' + m_cErrorMsgRec.sMsg;
				end;

			//HIS0018
    		7:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '部署情報が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;

			//2002/11/14
			8:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '未連結仕訳(部署or分散)が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
		end;
	end;

	MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
											m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnUpdateDetailsScreenRecord ()													*/
//*																											*/
//*	目的	: 部門登録処理																					*/
//*																											*/
//*	戻り値	: Boolean,                         																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnUpdateDetailsScreenRecord (): Boolean;
var
	strExCode     : String;
	strExCodeBSAdd: String;
    i			  : Integer;
	//  <マスタ同期>---Begin---
	iRet		  : Integer;
	//  <マスタ同期>--- End ---
begin
	if	(not fnCheckDetailScreenDivisions ()) then
	begin
		Result	:= FALSE;
		Exit;
	end;

	if  (m_nCurrentCodeAttr <= 1) then
	begin
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);

		if	(not DtlCmnEditExCodeBSAddNumeric.InputFlag) then
			strExCodeBSAdd	:= DtlCmnLabelNCodeBSAdd.Caption
//			strExCodeBSAdd	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeBSAddNumeric.Value)])
		else
			strExCodeBSAdd	:= '';
	end
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
		strExCode		:= DtlCmnEditExCodeFree     .Text;
//		strExCodeBSAdd	:= DtlCmnEditExCodeBSAddFree.Text;
		strExCodeBSAdd	:= DtlCmnLabelNCodeBSAdd.Caption
	end;

	//  <マスタ同期>---Begin---
	if IsChild() then
	begin
		iRet := fnCheckMasterDataRecordValid2 (strExCode);
		{全社の実在・合計違いに同一コードが存在}
		if iRet = C_RET_SAME_PARENT then
		begin
			Beep ();

			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
			m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//			MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
                 						// 簡略名称もﾒｯｾｰｼﾞに表示する
            MJSMessageBoxEx (Self,
            				 m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                             m_cErrorMsgRec.sTitle,
                             m_cErrorMsgRec.icontype,
                             m_cErrorMsgRec.btntype,
                             m_cErrorMsgRec.btndef,
                             m_cErrorMsgRec.LogType);
// <014> MOD end

			Result	:= FALSE;
			Exit;
		end
		{エラー}
		else if iRet = C_RET_ERROR then
		begin
			Beep ();
			Result	:= FALSE;
			Exit;
		end;
		iRet := fnCheckMasterDataRecordValid (strExCode);
		{全社に同一コードが存在→関連付け}
		if iRet = C_RET_SYNC then
		begin
			Result	:= FALSE;
			Exit;
		end
		{全社に同一コードが存在→関連付けしない}
		{エラー}
		else if (iRet = C_RET_SAME_PARENT)
		or (iRet = C_RET_ERROR) then
		begin
			Beep ();
			Result	:= FALSE;
			Exit;
		end;
	end;
	//  <マスタ同期>--- End ---

	if	(CompareStr (strExCode, m_strExCodeTotal) = 0) then
		m_stMasterData.nDivision	:= 9
	else
	begin
		if	(DtlCmnTab.Items [0].Selected) then
			m_stMasterData.nDivision	:= 0
		else
			m_stMasterData.nDivision	:= 1;
	end;

	if	(m_strExCodeCurrent <> '') then
		m_stMasterData.strExCodeParent	:= m_strExCodeCurrent
	else
		m_stMasterData.strExCodeParent	:= '          ';

	m_stMasterData.strExCode		:= strExCode;														// 部門外部ｺｰﾄﾞ
	m_stMasterData.strAssociation	:= DtlCmnEditAssociation.Text;										// 連想
	m_stMasterData.strName			:= DtlCmnEditName.Text;												// 正式名称
	m_stMasterData.strNameSimple	:= DtlCmnEditNameSimple.Text;										// 簡略名称
	m_stMasterData.nClassCode		:= Trunc (DtlCmnEditClassCode.Value);								// 部門分類ｺｰﾄﾞ
	m_stMasterData.fDetails			:= TRUE;															// 詳細更新区分: True=あり
	m_stMasterData.nCharacterCode	:= Trunc (DtlCmnEditCharacterCode.Value);							// 部門性格ｺｰﾄﾞ
	m_stMasterData.nCmnStDivision	:= Trunc (DtlCmnEditCommonStockDivision.Value);						// 共通仕入部門区分
	m_stMasterData.nAppDateStart	:= MjsDateCtrl.MjsDateToInt8 (DtlCmnEditAppDateStart.AsDateTime);	// 適用開始年月日
	m_stMasterData.nAppDateEnd		:= MjsDateCtrl.MjsDateToInt8 (DtlCmnEditAppDateEnd  .AsDateTime);	// 適用終了年月日
	m_stMasterData.strExCodeBSAdd	:= strExCodeBSAdd;													// B/S計上部門外部ｺｰﾄﾞ
    m_stMasterData.strNCode			:= DtlNCode;
	//▼▼▼▼▼
    for i := 1 to 10 do
    begin
//        if (DtlCmnEditBunruiCD[i].InputFlag) then
//			m_stMasterData.BunruiNCode[i] := ''
//        else
			m_stMasterData.BunruiNCode[i] := DtlBunruiNCode[i];					//050425 内部コードを書く

//        if (DtlCmnEditSegCD[i].InputFlag) then
//			m_stMasterData.SegNCode[i] := ''
//        else
			m_stMasterData.SegNCode[i] := DtlSegNCode[i];
	end;
	//▲▲▲▲▲

    fnUpdateMasterRecord	  ();
//	fnUpdateMasterDataTagInfo (strExCode, m_nSelectTagKind);

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetMasterInfoCommonSections ()													*/
//*																											*/
//*	目的	: 部門登録処理 BS/PL共通部門(MasterInfo) ｾｯﾄ処理												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnSetMasterInfoCommonSections ();
var
	dqMasterInfo   : TMQuery;
	nMasterDivision: Integer;
    i			   : Integer;

begin
	dqMasterInfo	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);							// DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		for	i := 0 to 10 do
		begin
			if i = 0 then
		        nMasterDivision := 41
            else
		        nMasterDivision := 100 + 1;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT SpHojyoNCd1, SpHojyoNCd2 FROM MasterInfo WHERE MasterKbn = :nMasterDivision');

			ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

			if	(not Open ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterInfo);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterInfo);

				fnOutputDBErrorMessage ();

				dqMasterInfo.Close ();
				dqMasterInfo.Free  ();

				Exit;
			end;

			if	(not EOF) then
			begin
				if	(not fnSetMasterInfoCommonSection (nMasterDivision,
						FieldByName('SpHojyoNCd1').AsString, FieldByName('SpHojyoNCd2').AsString)) then
				begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterInfo);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterInfo);

					dqMasterInfo.Close ();
					dqMasterInfo.Free  ();

					Exit;
				end;
			end;
		end;
	end;

	dqMasterInfo.Close ();
	dqMasterInfo.Free  ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnSetMasterInfoCommonSection (Integer; String; String)							*/
//*																											*/
//*	目的	: 部門登録処理 BS/PL共通部門(MasterInfo) ｾｯﾄ処理												*/
//*																											*/
//*	戻り値	: Boolean,																						*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分																	*/
//*			  strBSSectionCode	= B/S共通部門ｺｰﾄﾞ															*/
//*			  strPLSectionCode	= P/L共通部門ｺｰﾄﾞ															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnSetMasterInfoCommonSection (nMasterDivision: Integer;
													strBSSectionCode: String; strPLSectionCode: String): Boolean;
var
	dqMasterData : TMQuery;
	strGenCode	 : String;
	strBSWorkCode: String;
	strPLWorkCode: String;
	strSQLConst	 : String;

begin
	strBSWorkCode	:= MjsHanCopy (strBSSectionCode, 0, 10);	//<D10-U> Copy → MjsHanCopy
	strPLWorkCode	:= MjsHanCopy (strPLSectionCode, 0, 10);	//<D10-U> Copy → MjsHanCopy

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM ' + DEF_HOJYOMA);							// 050909 内部コード！
		// ◆◇◆　諸口区分
		//SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RecordKbn = 0 AND SumKbn = 0 AND NCode = 0');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND SumKbn = 0 AND SyokuchiKbn = 1');

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= FALSE;
			Exit;
		end;

		if	(not EOF) then
			strGenCode	:= FieldByName('NCode').AsString						// 050909 内部コード！
		else
			strGenCode	:= '';
	end;

	if	(Trim (strBSWorkCode) = '') then
		strBSWorkCode	:= MjsHanCopy (strGenCode, 0, 10)		//<D10-U> Copy → MjsHanCopy
	else
	begin
		if	(not fnCheckMasterInfoCommonSection (nMasterDivision, strBSWorkCode)) then
			strBSWorkCode	:= MjsHanCopy (strGenCode, 0, 10);	//<D10-U> Copy → MjsHanCopy
	end;

	if	(Trim (strPLWorkCode) = '') then
		strPLWorkCode	:= MjsHanCopy (strGenCode, 0, 10)		//<D10-U> Copy → MjsHanCopy
	else
	begin
		if	(not fnCheckMasterInfoCommonSection (nMasterDivision, strPLWorkCode)) then
			strPLWorkCode	:= MjsHanCopy (strGenCode, 0, 10);	//<D10-U> Copy → MjsHanCopy
	end;

	if	((CompareStr (strBSSectionCode, strBSWorkCode) = 0) and
		 (CompareStr (strPLSectionCode, strPLWorkCode) = 0)) then
	begin
		dqMasterData.Close ();
		dqMasterData.Free  ();

		Result	:= TRUE;
		Exit;																			// 以下, 未処理
	end;

	strSQLConst	:= 'UPDATE MasterInfo SET SpHojyoNCd1 = ';

	if	(Trim (strBSWorkCode) = '') then
		strSQLConst	:= strSQLConst + 'NULL'
	else
		strSQLConst	:= strSQLConst + '''' + strBSWorkCode + '''';

	strSQLConst	:= strSQLConst + ' , SpHojyoNCd2 = ';

	if	(Trim (strPLWorkCode) = '') then
		strSQLConst	:= strSQLConst + 'NULL'
	else
		strSQLConst	:= strSQLConst + '''' + strPLWorkCode + '''';

	strSQLConst	:= strSQLConst + ' WHERE ' + Format ('MasterKbn = %d', [nMasterDivision]);

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   (strSQLConst);

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

	Result	:= TRUE;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCheckMasterInfoCommonSection (Integer; String)									*/
//*																											*/
//*	目的	: 部門登録処理 BS/PL共通部門(MasterInfo) ﾁｪｯｸ処理												*/
//*																											*/
//*	戻り値	: Boolean,																						*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分																	*/
//*			  strSectionCode	= 共通部門ｺｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckMasterInfoCommonSection (nMasterDivision: Integer; strSectionCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQl.Add   ('       RDelKbn = 0 AND SumKbn = 0 AND NCode = :strSectionCode');	// 050909 内部コード！

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
		ParamByName ('strSectionCode' ).AsString	:= strSectionCode;;

		Open ();

		if	(not EOF) then
			fReturn	:= TRUE
		else
			fReturn	:= FALSE;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnGetMasterDataTagInfo (String)													*/
//*																											*/
//*	目的	: 部門登録処理 ﾏｽﾀ付箋管理情報取得																*/
//*																											*/
//*	戻り値	: Integer, (付箋№)																				*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode = 部門内部ｺｰﾄﾞ！    																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnGetMasterDataTagInfo (strExCode: String): Integer;
var
	dqMasterData: TMQuery;
	nTagDivision: Integer;

begin
	dqMasterData    := TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);					// DBとMQueryの接続

	nTagDivision	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode ');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
			nTagDivision	:= FieldByName('FusenKbn').AsInteger;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= nTagDivision;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnUpdateMasterDataTagInfo (String; var Integer)									*/
//*																											*/
//*	目的	: 部門登録処理 ﾏｽﾀ付箋管理情報更新																*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:正常, FALSE:異常)																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門内部ｺｰﾄﾞ！																	*/
//*           nTagKind  = 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)											*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnUpdateMasterDataTagInfo (strExCode: String; var nTagKind: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT FusenKbn FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if  (not EOF) then
		begin

			if	((nTagKind = 0) or (FieldByName('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind	:= 0;

				Close ();

				SQL.Clear ();
				SQL.Add   ('DELETE FROM MFusenInfo ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode');
			end
			else
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('UPDATE MFusenInfo SET FusenKbn = :nTagDivision, FusenCmnt = '''' ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND NCode = :strExCode');

				ParamByName ('nTagDivision').AsInteger	:= nTagKind;
			end;

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strExCode'      ).AsString	:= strExCode;

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
		SQL.Add   ('INSERT INTO MFusenInfo (MasterKbn, SubNCode, NCode, FusenKbn, FusenCmnt) ');
		SQL.Add   ('VALUES (:nMasterDivision, 0, :strExCode, :nTagDivision, '''')');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;
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
end;


procedure	TJNTCRP0020030f.fnDtlCmnPopupMenuOnPopup (Sender: TObject);
//var	lvBit		 : TBitMap;
begin
//	lvBit := TBitMap.Create;

	DtlCmnPopupMenuTag01.Enabled	:= TRUE;
	DtlCmnPopupMenuTag02.Enabled	:= TRUE;
	DtlCmnPopupMenuTag03.Enabled	:= TRUE;
	DtlCmnPopupMenuTag04.Enabled	:= TRUE;

	if	(m_nSelectTagKind > 0) then
	begin
		DtlCmnPopupMenuTagOff    .Visible	:= TRUE;
		DtlCmnPopupMenuTagComment.Visible	:= TRUE;

		case (m_nSelectTagKind) of
			1:	begin
//0624					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag01.Bitmap;
//					CmnImageGeneral.GetBitmap(0,lvBit);	// 0624
//                    DtlCmnPopupMenuTagOff.Bitmap	:= lvBit;	//0624
					DtlCmnPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag01.Bitmap;	//0624
					DtlCmnPopupMenuTag01 .Visible	:= FALSE;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			2:	begin
//0624					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag03.Bitmap;
//					CmnImageGeneral.GetBitmap(2,lvBit);	// 0624
//                    DtlCmnPopupMenuTagOff.Bitmap	:= lvBit;	//0624
					DtlCmnPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag03.Bitmap;	//0624
					DtlCmnPopupMenuTag01 .Visible	:= TRUE;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= FALSE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			3:	begin
//0624					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag02.Bitmap;
//					CmnImageGeneral.GetBitmap(1,lvBit);	// 0624
//                    DtlCmnPopupMenuTagOff.Bitmap	:= lvBit;	//0624
					DtlCmnPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag02.Bitmap;	//0624
					DtlCmnPopupMenuTag01 .Visible	:= TRUE;
					DtlCmnPopupMenuTag02 .Visible	:= FALSE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= TRUE;
				end;
			4:	begin
//0624					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag04.Bitmap;
//					CmnImageGeneral.GetBitmap(3,lvBit);	// 0624
//                    DtlCmnPopupMenuTagOff.Bitmap	:= lvBit;	//0624
					DtlCmnPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag04.Bitmap;	//0624
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

		DtlCmnPopupMenuTag01.Visible	:= TRUE;
		DtlCmnPopupMenuTag02.Visible	:= TRUE;
		DtlCmnPopupMenuTag03.Visible	:= TRUE;
		DtlCmnPopupMenuTag04.Visible	:= TRUE;
	end;
end;


procedure	TJNTCRP0020030f.fnDtlCmnPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	: TMenuItem;
	nTagKindWork: Integer;
	lvBit		 : TBitMap;
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

// 0624>>
	if nTagKindWork = 0 then
		DtlCmnImageTag.Picture	:= nil
    else
    begin
		lvBit := TBitMap.Create;
		CmnImageGeneral.GetBitmap(nTagKindWork - 1,lvBit);
		DtlCmnImageTag.Picture	:= TPicture (lvBit);
    end;

// 0624<<
{0624
	case (nTagKindWork) of
		0:	DtlCmnImageTag.Picture	:= nil;
		1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
		3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	end;
}

	if	(nTagKindWork <> m_nSelectTagKind) then
		fnCommonFunctionDetailsOnChange (Sender);

	m_nSelectTagKind	:= nTagKindWork;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCheckDtlExCodeValid ()														*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: Boolean,																						*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckDtlExCodeValid (): Boolean;
var
	strExCode: String;
    ret		 : Integer;
    dateS	 : TDateTime;
    dateE	 : TDateTime;
    mrRet	 : Integer;
	iRet	   : Integer;						//  <マスタ同期>
begin
	Result	:= FALSE;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
		if	(DtlCmnEditExCodeNumeric.InputFlag and (Trunc (DtlCmnEditExCodeNumeric.Value) = 0)) then
			strExCode	:= ''
		else
			strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);
	end
	else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;

//	m_fDtlNewRecord	:= FALSE;

	//  <マスタ同期>---Begin---
	// 重複チェック
	iRet := fnCheckMasterDataRecordValid (strExCode);
	if iRet = C_RET_ERROR then					// 異常
	begin
		Exit;
	end
	else if iRet <> C_RET_NONE then				// 自社or全社に存在
	begin
		//全社に同一コードが存在→関連付けしない
		if iRet = C_RET_SAME_PARENT then
			mrRet := mrNo						// ロードしないと同じ
//<MLWK>↓
		else
		// MLワークフローモードで実在のときは無条件でロード
		if	(m_bMLWF = True)
		and	(DtlCmnTab.Items[0].Selected) then
			mrRet := mrYes
//<MLWK>↑
		//	参照、追加権限なしだったら無条件でロード
		else if (m_nReferMode = REFER) OR (not m_cJNTArea.IsAppend())
		//全社に同一コードが存在→関連付けの場合もロード
		or (iRet = C_RET_SYNC) then
			mrRet := mrYes
		//自社に同一コードが存在
		else
		begin
			// 重複データあり
			Beep ();
			//	同一コードが存在してます
			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
			m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
			m_cErrorMsgRec.sMsg := m_cErrorMsgRec.sMsg + #13#10 + 'ロードしますか？';
			//MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			mrRet := MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg,
										m_cErrorMsgRec.sTitle,
										mjQuestion,
										mjYesNo,
										mjDefYes,
										FALSE);
		end;
		if mrRet = mrYes then
		begin
			// ロード
			DtlNCode := DtlNCode2;
//<MLWK>↓
			if	(m_bMLWF = True)
			and	(DtlCmnTab.Items[0].Selected) then
				ModeBtn.Caption := '参　照'
			else
			begin
//<MLWK>↑
				if m_cJNTArea.IsModify() then
					ModeBtn.Caption := '修　正'
				else
					ModeBtn.Caption := '参　照';
//<MLWK>↓
			end;
//<MLWK>↑
//			ModeBtn.Font.Color := clRed;
			m_fUnderConstruction := TRUE;
			m_fChangeDetails	:= FALSE;
		end
		else
		begin
			// ロードしない
			if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
				DtlCmnEditExCodeNumeric.SetFocus()
			else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
				DtlCmnEditExCodeFree.SetFocus();
			//m_fDtlChangeExCode := TRUE;
			Result	:= TRUE;
			Exit;
		end;
	end
	(*
	// 重複チェック
	if  (not fnCheckMasterDataRecordValid (strExCode)) then
	begin
		//	参照、追加権限なしだったら無条件でロード
		if (m_nReferMode = REFER) OR (not m_cJNTArea.IsAppend()) then
			mrRet := mrYes
		else
		begin
			// 重複データあり
			Beep ();
			//	同一コードが存在してます
			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
			m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
			m_cErrorMsgRec.sMsg := m_cErrorMsgRec.sMsg + #13#10 + 'ロードしますか？';
			//MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			mrRet := MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg,
										m_cErrorMsgRec.sTitle,
										mjQuestion,
										mjYesNo,
										mjDefYes,
										FALSE);
		end;
		if mrRet = mrYes then
		begin
			// ロード
			DtlNCode := DtlNCode2;
			if m_cJNTArea.IsModify() then
				ModeBtn.Caption := '修　正'
			else
				ModeBtn.Caption := '参　照';
//			ModeBtn.Font.Color := clRed;
			m_fUnderConstruction := TRUE;
			m_fChangeDetails	:= FALSE;
		end
		else
		begin
			// ロードしない
			if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
				DtlCmnEditExCodeNumeric.SetFocus()
			else																				// ｺｰﾄﾞ属性: ﾌﾘｰ
				DtlCmnEditExCodeFree.SetFocus();
			//m_fDtlChangeExCode := TRUE;
			Result	:= TRUE;
			Exit;
		end;
	end
	*)
	//  <マスタ同期>--- End ---
	else
	begin
		// 修正モード＆適用期間が変わった場合
		if (ModeBtn.Caption <> '新　規') then
		begin
			if ((tmpStartDate <> DtlCmnEditAppDateStart.AsDateTime)
			   OR (tmpEndDate 	<> DtlCmnEditAppDateEnd.AsDateTime)) then
			begin
				// 組織体系適用期間外チェック
				ret := ChkPtn1(0);
				// ①問題なし
				// ②戻す
				// ③外す
				if ret <> 2 then
					m_fChangeDetails	:= TRUE;
			end;
			Exit;
		end
		// 重複データなし＆新規作成
		//	参照、追加権限なしだったら再入力
		else if (m_nReferMode = REFER) OR (not m_cJNTArea.IsAppend()) then
		begin
			if	(m_nCurrentCodeAttr <= 1) then
			begin
				DtlCmnEditExCodeNumeric.SetFocus;
				DtlCmnEditExCodeNumeric.SelectAll;
			end
			else
			begin
				DtlCmnEditExCodeFree.SetFocus;
				DtlCmnEditExCodeFree.SelectAll;
			end;
			exit;
		end;
	end;

	// ロード
	dateS := DtlCmnEditAppDateStart.AsDateTime;
	dateE := DtlCmnEditAppDateEnd.AsDateTime;
	if	(fnResetDetailScreen ()) then													// 新規ﾚｺｰﾄﾞ
	begin
		DtlCmnEditAppDateStart.AsDateTime := dateS;
		DtlCmnEditAppDateEnd.AsDateTime := dateE;
		if	(DtlCmnTab.Items [0].Selected) then											// 実在
			fnDisableDetailScreen (0)
		else																			// 合計
			fnDisableDetailScreen (1);

//<100630>↓
		if ((ParentMasterDiv = 41)
		 or (ParentMasterDiv = 101)) then
		begin
//<100906>↓
//			if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
//				FFunctionBar.SetFuncCaption (1, ' F1 ' + STR_FUNC_FREE)
//			else
//				FFunctionBar.SetFuncCaption (1, ' F1 フリー項目参照');
//			FFunctionBar.SetFuncEnabled (1, True) ;
			if TMSeries.IsMjsLink3 = False then		//<MLXDEP>
			begin							//<MLXDEP>begin,end内を一段字下げ
                if (m_nReferMode <> REFER) then									//	参照以外		HIS0002
                    m_arFunction[0]	:= ' F1 ' + STR_FUNC_FREE
                else
                    m_arFunction[0]	:= ' F1 フリー項目参照';
			end;							//<MLXDEP>
			FFunctionBar.CopyFuncData(m_arFunction);
//<100906>↑
//<110131_3>↓
			FFunctionBar.Enabled	:= True;
		end
		else
		begin
			m_arFunction[0]	:= '';
			FFunctionBar.CopyFuncData(m_arFunction);
			FFunctionBar.Enabled	:= True;
//<110131_3>↑
		end;
//<100630>↑
//		m_fDtlNewRecord		:= TRUE;
	end;

	// 050905 >>
	// 削除ボタンの有効/無効がおかしい対応
	fnSetDeleteButtonCondition();
	// 050905 <<

	m_fUnderConstruction := FALSE;

	//m_fDtlChangeExCode	:= FALSE;
end;


procedure	TJNTCRP0020030f.fnCmnToolbarButtonTagOnClick (Sender: TObject);
var
	nTagKindWork: Integer;
begin
	nTagKindWork	:= 0;

	case (CmnToolbarButtonTag.ImageIndex) of
		0:	nTagKindWork	:= 1;
		1:	nTagKindWork	:= 3;
		2:	nTagKindWork	:= 2;
		3:	nTagKindWork	:= 4;
	end;

	// 詳細画面表示中
	if	(DtlCmnClientPanel.Visible) then
	begin
		if	(m_nSelectTagKind = nTagKindWork) then
			nTagKindWork	:= 0;

{ 0624>>
		if nTagKindWork = 0 then
        	DtlCmnImageTag.Picture	:= nil
        else
        begin
			lvBit := TBitMap.Create;
			if nTagKindWork = 2 then
				CmnImageGeneral.GetBitmap(3 - 1,lvBit)
			else if nTagKindWork = 3 then
				CmnImageGeneral.GetBitmap(2 - 1,lvBit)
			else
				CmnImageGeneral.GetBitmap(nTagKindWork - 1,lvBit);
			DtlCmnImageTag.Picture	:= TPicture (lvBit);
        end;
}
		case (nTagKindWork) of
			0:	DtlCmnImageTag.Picture	:= nil;
			1:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag01.Bitmap);
			2:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag03.Bitmap);
			3:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag02.Bitmap);
			4:	DtlCmnImageTag.Picture	:= TPicture (StdCmnGridPopupMenuTag04.Bitmap);
		end;

		// その場で書き込む
		//fnCommonFunctionDetailsOnChange (Sender);
        fnUpdateMasterDataTagInfo (dtlNCode, nTagKindWork);

		m_nSelectTagKind	:= nTagKindWork;
		if nTagKindWork = 0 then
        begin
			DtlCmnImageTag.ShowHint := False;
			DtlCmnImageTag.Hint := '';
        end;
	end
    // 一覧画面表示中
//<080311>↓
//	else if	((Screen.ActiveControl.Name = StdCmnGridExist.Name) or						// 実在補助ｸﾞﾘｯﾄﾞ
//			 (Screen.ActiveControl.Name = StdCmnGridTotal.Name)) then					// 合計補助ｸﾞﾘｯﾄﾞ
	else if	((m_cACControl.Name = StdCmnGridExist.Name) or						// 実在補助ｸﾞﾘｯﾄﾞ
			 (m_cACControl.Name = StdCmnGridTotal.Name)) then					// 合計補助ｸﾞﾘｯﾄﾞ
//<080311>↑
			fnSetGridTagInfo (nTagKindWork);
{★★★
	else if	(Screen.ActiveControl.Name = CmnTreeView.Name) then							// ﾂﾘｰﾋﾞｭｰ
	begin
		stItemRec	:= CmnTreeView.Selected.Data;

		fnUpdateMasterDataTagInfo (stItemRec^.strExCode, nTagKindWork);
		fnUpdateGridMemDataRecord (stItemRec^.nDivision, stItemRec^.strExCode, nTagKindWork);
	end;
★★★}
end;


procedure	TJNTCRP0020030f.fnCmnToolbarDropDownMenuTagOnClick (Sender: TObject);
begin
	CmnToolbarButtonTag.ImageIndex	:= (Sender as TMenuItem).ImageIndex;
end;



procedure	TJNTCRP0020030f.fnEnableToolbarButtonTag (fEnabled: Boolean);
begin
{詳細画面でも有効
	if	(fEnabled) then
	begin
		if	(DtlCmnClientPanel.Visible) then
			CmnToolbarButtonTag.Enabled	:= FALSE
		else
			CmnToolbarButtonTag.Enabled	:= fEnabled;
	end
	else
}
	if fEnabled then
		CmnToolbarButtonTag.Enabled	:= m_cJNTArea.IsFusen()
    else
		CmnToolbarButtonTag.Enabled	:= fEnabled;

	// 詳細画面の場合
	if	(DtlCmnClientPanel.Visible) then
	begin
		if	(fEnabled) then
		begin
			DtlCmnEditExCodeFree.PopupMenu		:=	StdCmnGridPopupMenu;
			DtlCmnEditExCodeNumeric.PopupMenu	:=	StdCmnGridPopupMenu;
        end
        else
        begin
			DtlCmnEditExCodeFree.PopupMenu		:=	nil;
			DtlCmnEditExCodeNumeric.PopupMenu	:=	nil;
        end;
    end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 実在部門ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridExistOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
			strExCodeSelect	:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1];

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

		if	(VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [5])) then
			Exit;

		if	(TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [5] <> '') then
		begin
			StdCmnGridExist.Hint		:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [5];
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
//*	関数	: TJNTCRP0020030f.fnStdCmnGridExistOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 実在部門ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnStdCmnGridTotalOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
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


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnGetPrintSystemImage (nDivision: Integer): TBitmap;
var
	bmpPrintImage: TBitmap;

begin
	bmpPrintImage	:= nil;

	case (nDivision) of
		0:	bmpPrintImage	:= CmnReportPopupMenuImage01.Bitmap;
		1:	bmpPrintImage	:= CmnReportPopupMenuImage02.Bitmap;
	end;

	Result	:= bmpPrintImage;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnReadPrintSystemNextRecordParent01 (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	dqMasterTree: TMQuery;
	fReturn		: Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606
	dqMasterTree	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	fReturn	:= FALSE;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode, SumKbn, SimpleName FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       RDelKbn = 0 AND SumKbn <> 0 AND GCode > :strExCode ORDER BY GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if	(not EOF) then
		begin
			with (dqMasterTree) do
			begin
				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT SumNCode FROM ' + DEF_HAPTLR2 + ' ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BasedNCode = :strExCodeBase');

				ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				ParamByName ('strExCodeBase'  ).AsString	:= dqMasterData.FieldByName('GCode').AsString;

				Open ();

				if	(EOF) then
					fReturn	:= TRUE;
			end;
		end;
	end;

	dqMasterData.Close ();
	dqMasterTree.Close ();
	dqMasterData.Free  ();
	dqMasterTree.Free  ();

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnReadPrintSystemNextRecordParent02 (strExCode: String): Boolean;
var
	dqMasterData : TMQuery;
	dqMasterTree : TMQuery;
	nCount		 : Integer;
	strExCodeWork: String;
	fReturn		 : Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606
	dqMasterTree	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	fReturn	:= FALSE;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode, SimpleName FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       RDelKbn = 0 AND SumKbn = 0 AND GCode > :strExCode ORDER BY GCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		while (not EOF) do
		begin
			with (dqMasterTree) do
			begin
				nCount	:= 0;

				Close ();

				SQL.Clear ();
				SQL.Add   ('SELECT SumNCode FROM ' + DEF_HAPTLR2 + ' ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND BasedNCode = :strExCodeBase');

				ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				ParamByName ('strExCodeBase'  ).AsString	:= dqMasterData.FieldByName('GCode').AsString;

				Open ();

				while (not EOF) do
				begin
					strExCodeWork	:= FieldByName('SumNCode').AsString;
					nCount			:= nCount + 1;

					NEXT;
				end;

				if	((nCount = 1) and (CompareStr (strExCodeWork, m_strExCodeTotal) = 0)) then
					fReturn	:= TRUE;
			end;

			if	(fReturn) then
				Break;

			NEXT;
		end;
	end;

	dqMasterData.Close ();
	dqMasterTree.Close ();
	dqMasterData.Free  ();
	dqMasterTree.Free  ();

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnReadPrintSystemNextRecord (strExCode: String; nEntryNo: Integer): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= FALSE;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT ht.EntNo, ht.SumNCode, ht.BasedNCode, ');
		SQL.Add   ('       hm.SumKbn, hm.SimpleName, hm.NCode FROM ' + DEF_HAPTLR2 + ' ht, ' + DEF_HOJYOMA + ' hm ');
		SQL.Add   ('WHERE  ht.MasterKbn = :nMasterDivision AND ');
		SQL.Add   ('       ht.SumNCode = :strSumCode AND ht.EntNo > :nEntryNo AND ');
		SQL.Add   ('       hm.Masterkbn = ht.Masterkbn AND hm.RDelKbn = 0 AND hm.GCode = ht.BasedNCode ');
		SQL.Add   ('ORDER BY ht.EntNo');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSumCode'     ).AsString	:= strExCode;
		ParamByName ('nEntryNo'       ).AsInteger	:= nEntryNo;

		Open ();

		if	(not EOF) then
			fReturn	:= TRUE;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= fReturn;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnReportSystemRenewalOnStartPage (Sender: TObject);
begin
	m_fPrintSystemTop	:= TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnReportSystemRenewalOnEndPage (Sender: TObject);
begin
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckExCodeValidCharacter (strExCode: String): Boolean;
begin
	if	(Trim (strExCode) = '') then
	begin
		Beep ();

		Result	:= FALSE;
		Exit;
	end;

	if	(m_nCurrentCodeAttr <= 1) then													// ｺｰﾄﾞ属性: 数字
	begin
//<100827>↓
		if (StrToInt64Def(Trim(strExCode), -1) = -1) then
		begin
			Beep ();

			Result	:= FALSE;
			Exit;
		end;
//<100827>↑

		Result	:= TRUE;
		Exit;
	end;

//FX10000
	if	(not JNTMASERRORCODECHECK (strExCode, m_strValidCharacters)) then
	begin
		Beep ();

		m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 21);

		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
										m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnCmnToolbarButtonDeleteOnMouseDown (Sender: TObject;
													Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	m_fSystemClear	:= FALSE;

	if	(ssShift in Shift) then
		m_fSystemClear	:= TRUE;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnClearAllSystems (): Boolean;
var
	dqMasterTree: TMQuery;
    pos			: Integer;

begin
	if m_nCurrentMasterDiv = 41 then
    	pos := 0
    else
    	pos := m_nCurrentMasterDiv - MK_SEG01 + 1;
{
	if	(TMJSExceptDbmF (m_pRec^.m_pExpModule^).SetExcept (ueCop, m_pRec^.m_iSystemCode,
			m_pRec^.m_iOptionCode, m_pRec^.m_iCorpCode, m_pRec^.m_iCorpSubCode, m_pRec^.m_iProgramCode, 0) <> 0) then
	begin
		Beep ();

		MJSMessageBoxEx (Self, '会社単独処理の設定を行うことができませんでした。',
														m_pRec^.m_ProgramName, mjError, mjOk, mjDefOk, FALSE);

		Result	:= FALSE;
		Exit;
	end;
}
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterTree	:= TMQuery.Create (Self);									// MQueryの構築		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
{部門登録ではツリーは削除しない
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM ' + DEF_HAPTLR2 + ' WHERE MasterKbn = :nMasterDivision');

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
部門登録ではツリーは削除しない}

{0210版ではHojyoTree2は更新しない　ここからでいいのかな？
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
0210版ではHojyoTree2は更新しない　ここまででいいのかな？}
        //<002> ↓
        if (m_nCurrentMasterDiv = 41) or (m_nCurrentMasterDiv = 101) then
        begin
        //<002> ↑
		    m_bHojyoTreeDelete [pos]	:= 1;
		    m_bHojyoTree2      [pos]	:= 1;
        end;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)

	dqMasterTree.Close ();
	dqMasterTree.Free  ();
{
	TMJSExceptDbmF (m_pRec^.m_pExpModule^).ResetExcept (ueCop, m_pRec^.m_iSystemCode,
			  	m_pRec^.m_iOptionCode, m_pRec^.m_iCorpCode, m_pRec^.m_iCorpSubCode, m_pRec^.m_iProgramCode, 0);
}
	Result	:= TRUE;
end;

//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnJNTCRP0020030fOnDiscontinue (var Msg: TMessage);
begin
	Close ();
end;


procedure TJNTCRP0020030f.fnDeleteCheck;
var
	stCap : String;//stNo, stMsg,
begin
 	if m_DeleteCheck = False then
	begin
		stCap := '部門登録';

		if m_nReferMode	= NORMAL then
			MJSMessageBoxEx (Self,  '加算情報の不整合がありました。不整合部分を削除しましたので、再度加算情報を見直して下さい。',stCap,mjInformation,mjOK,mjDefOK )
		else
			MJSMessageBoxEx (Self,  '加算情報の不整合がありました。登録権利がありませんので、復旧は行いませんでした。',stCap,mjInformation,mjOK,mjDefOK );

		m_DeleteCheck	:= True;
	end;
end;


function TJNTCRP0020030f.fnKbnCheck(nMasterKbn: Integer; sCode: String): Integer;
var
	dqMasterData : TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);		// 050606
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	Result	:= -1;
	dqMasterData.Close;
	dqMasterData.SQL.Clear;
	dqMasterData.SQL.Add('select SumKbn from ' + DEF_HOJYOMA);
	dqMasterData.SQL.Add('where MasterKbn = :Mkbn ');
	dqMasterData.SQL.Add('and   RDelKbn = 0 ');
	dqMasterData.SQL.Add('and   NCode     = :NCode ');
	dqMasterData.ParamByName('MKbn').AsInteger		:= nMasterKbn;
//	if	(m_nCurrentCodeAttr <= 1) then
		dqMasterData.ParamByName('NCode').AsString	:= sCode;
//		dqMasterData.ParamByName('GCode').AsString	:= Format ('%.10d', [StrToInt64 (Trim (sCode))]);
	if dqMasterData.Open = False then
	begin
		dqMasterData.Close;
		dqMasterData.Free;
		Exit;
	end;

	if not dqMasterData.Eof then
		Result	:= dqMasterData.GetFld('SumKbn').AsInteger;

	dqMasterData.Close;
	dqMasterData.Free;
end;

//******************************************************************************
//	HIS0020
//******************************************************************************
procedure TJNTCRP0020030f.DtlCmnEditExCodeArrowClick(Sender: TObject);
// 0706 EXP >>
var
	lvExpSend:	rcJNTExpSend;	//
	lvExpRecv:	rcJNTExpRecv;	//
	iExpRtn:	Integer;		//
	i64		:	Int64;
begin
	// 編集中の場合は確認
	///<006> ↓
	if	((Trunc (DtlCmnEditExCodeNumeric.Value) <> 0) and (not DtlCmnEditExCodeNumeric.InputFlag)
		and (DtlCmnEditExCodeNumeric.Visible))
		or ((Trim(DtlCmnEditExCodeFree.Text) <> '') and (DtlCmnEditExCodeFree.Visible)) then
	begin
	//<006> ↑

		if CONFIRM_THROUGH<> fnOutputConfirmationMessage (CONFIRM_CANCEL) then
			Exit;
	end;

	// 未対応？
//	if (86 <= m_nCurrentMasterDiv) AND (m_nCurrentMasterDiv <= 89) then
//		Exit;

	fnJNTExpMakeParam(@lvExpSend);	 //ﾊﾟﾗﾒｰﾀ初期設定
	//共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
	lvExpSend.pMjsAppRec	:=	m_pRec;			   	//MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
	lvExpSend.pCopDB		:=	@m_cDBSelect;		//TDatabaseﾎﾟｲﾝﾀ
	lvExpSend.MasterKbn 	:=	m_nCurrentMasterDiv;	//マスタ区分

	lvExpSend.ModulKbn		:=	0;					//モジュール区分
	lvExpSend.PatternNo 	:=	1;					//パターンNo

	lvExpSend.TBarNM		:=	m_stMasterItem.strItemCaption + '検索エクスプローラー'; //<210202>Upd 長音対応
//	lvExpSend.TableName	  :=  'HojyoMA';		  //部門マスタ
{
	lvExpSend.ColorB		:=	m_cComArea.SystemArea.SysColorB;
	lvExpSend.ColorD		:=	m_cComArea.SystemArea.SysColorD;
	lvExpSend.TrRootCaption :=	m_stMasterItem.strItemCaption;
	lvExpSend.WhereStr		:= 'MasterKbn = ' + IntToStr(m_nCurrentMasterDiv);
}

	lvExpSend.WhereStr		:= 'RDelKbn = 0 ';		// 050829

	if DtlCmnTab.Items[0].Selected then		// 実在
		lvExpSend.SumKbn := 0
	else									// 合計
//<090924>↓
//		lvExpSend.WhereStr		:= lvExpSend.WhereStr + ' AND SumKbn <> 0';
		lvExpSend.SumKbn := 1;
//<090924>↑
//		lvExpSend.SumKbn := 1;

	//共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
	iExpRtn :=	fnJNTExpShow(@lvExpSend, @lvExpRecv);
	if iExpRtn <>1 then  //ｷｬﾝｾﾙ
		Exit;

	if Length(Trim(lvExpRecv.GCode))>0 then 	//中身あり?
	begin
		i64			:= Trunc(lvExpRecv.NCode);
		DtlNCode	:= IntToStr(i64);
		SelectExp	:= True;					// 検索エクスプローラから選んだ
//<100907>↓
		try
//<100907>↑
//<MLWK>↓
			if	(m_bMLWF = True)
			and	(DtlCmnTab.Items[0].Selected) then
				ModeBtn.Caption := '参　照'
			else
			begin
//<MLWK>↑
				if m_cJNTArea.IsModify() then
					ModeBtn.Caption := '修　正'
				else
					ModeBtn.Caption := '参　照';
//<MLWK>↓
			end;
//<MLWK>↑
			fnResetDetailScreen();
			m_fChangeDetails	:= FALSE;
			MjsDispCtrl.MjsNextCtrl (Self);
//<100907>↓
		finally
			SelectExp	:= False;				// 検索エクスプローラからの選択終わり
		end;
//<100907>↑
	end;

end;

function TJNTCRP0020030f.MakeDspString(CODE, NAME: String): String;
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
	iCnt	:=	m_nCurrentCodeDigit - MjsHanLength(sWork);	//<D10-U> Length → MjsHanLength
	sWork2	:=	StringOfChar(' ', iCnt);

    if m_nCurrentCodeAttr <= 1 then
    	sWork	:=	sWork2 + sWork
    else
       	sWork	:=	sWork  + sWork2;

	Result	:=	sWork + ' ' + NAME;
end;

//**************************************************************************
//	Proccess	:	Tree並び替え
//	Name		:	Y.Ichihashi
//	Date		:	2003/10/07
//	Parameter	:	nMasterDivision     Integer
//	Return		:
//	History		:	HIS0026
//**************************************************************************
procedure TJNTCRP0020030f.BSpeedButtonSortClick(Sender: TObject);
begin
end;


//************************************************************************
//*		Component		:	B_Search ( TMSpeedButton )
//*							検索DLG
//*		Date		    :	2004/06/24
//*		Event			:	OnClick
//*		Name			:	H.Endo（MJS）
//************************************************************************
procedure TJNTCRP0020030f.B_SearchClick(Sender: TObject);
begin
end;

//**********************************************************************
//*		Proccess	:	StdCmnGridExistDblClick「グリッドダブルクリック」
//*		Name		:	S.Hirota
//*		Date		:	2005/1/25
//*		Parameter	:	Nothing
//*		Return		:	Nothing
//**********************************************************************
procedure TJNTCRP0020030f.StdCmnGridExistDblClick(Sender: TObject);
begin
	if Trim (StdCmnMemDataExist.FieldByName('strExCode').AsString) = '' then
   		exit
    else if (not CmnToolbarButtonDetail.Enabled) then
   		exit;
//↓<MLXDEP>
	if TMSeries.IsMjsLink3 = True then
	begin
		Exit;
	end;
//↑<MLXDEP>
	fnCmnToolbarButtonDetailOnClick(Sender);
end;

//**********************************************************************
//*		Proccess	:	StdCmnGridTotalDblClick「グリッドダブルクリック」
//*		Name		:	S.Hirota
//*		Date		:	2005/1/25
//*		Parameter	:	Nothing
//*		Return		:	Nothing
//**********************************************************************
procedure TJNTCRP0020030f.StdCmnGridTotalDblClick(Sender: TObject);
begin
	if Trim (StdCmnMemDataTotal.FieldByName('strExCode').AsString) = '' then
   		exit
    else if (not CmnToolbarButtonDetail.Enabled) then
   		exit;
//↓<MLXDEP>
	if TMSeries.IsMjsLink3 = True then
	begin
		Exit;
	end;
//↑<MLXDEP>

	fnCmnToolbarButtonDetailOnClick(Sender);
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditClassCodeOnChange ()													*/
//*																											*/
//*	目的	: 部門登録処理 詳細画面 標準経費コード Changeイベント																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure 	TJNTCRP0020030f.DtlCmnEditDfKeihiCodeChange(Sender: TObject);
var
	nKeihiCode: Integer;
	fEditState: Boolean;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnCommonFunctionDetailsOnChange (Sender);

	nKeihiCode	:= Trunc (DtlCmnEditDfKeihiCode.Value);

	if	(nKeihiCode = 0) then
		fEditState	:= TRUE
	else
		fEditState	:= FALSE;

	fnChangeEditComponentState (fEditState);

	if	(not DtlCmnEditDfKeihiCode.InputFlag) then
	begin
		case (nKeihiCode) of
			0:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= '一般管理販売';
				end;
			1:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= '製造原価';
				end;
			2:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= '販売費';
				end;
			3:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= '一般管理費';
				end;
			4:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= '営業外費用';
				end;
			5:	begin
					DtlCmnLabelDfKeihiDesc.Caption	:= 'その他';
				end;
		end;
	end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.DtlCmnEditHonsitenCodeNumericArrowClick (TObject)								*/
//*																									*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ [本支店ｺｰﾄﾞ] OnArrowClick ｲﾍﾞﾝﾄ								*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.DtlCmnEditHonsitenCodeNumericArrowClick(
  Sender: TObject);
//var
//	cMasWndParam: TMasWndParam;
//	cMasWndIF	: TMasWndIF;
begin
{
	cMasWndIF	:= TMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'BrCode';								// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'RenChar';								// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'lBraName';								// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= DEF_HOJYOMA;								// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnMakeSQL	ConstructionBSAdd ();			// Where句の条件
	strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [m_nCurrentMasterDiv]) +
													' AND RecordKbn = 0 AND SumKbn = 0 AND HojyoKbn2 <> 0';
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);						// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_nCurrentCodeDigit;						// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_nCurrentCodeAttr;						// ｺｰﾄﾞ属性

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(m_nCurrentCodeAttr <= 1) then
		begin
			DtlCmnEditExCodeBSAddNumeric.Value		:= StrToInt64 (Trim (cMasWndParam.m_ExpRetCode));
			DtlCmnEditExCodeBSAddNumeric.InputFlag	:= FALSE;
		end
		else
			DtlCmnEditExCodeBSAddFree.Text	:= cMasWndParam.m_ExpRetCode;

		DtlCmnLabelExCodeBSAddDesc.Caption	:= cMasWndParam.m_ExpRetText;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.EDateStartExit (TObject)													*/
//*																									*/
//*	目的	: 部門登録処理 一覧画面 適用開始日 Exitイベント											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.EDateStartExit(Sender: TObject);
var ErrFlg : Boolean;

begin
    ErrFlg := FALSE;

	if CloseFlg then
    begin
	    CloseFlg := FALSE;
    	exit;
    end;

	// 未入力の場合
	if ((EDateStart.Value = 0) or (EDateStart.Value = NULL)) then
    	// チェック不要
    else
    begin
//<090722_1>↓
		if (TMDateEdit(Sender).AsDateTime < DEF_S_DATE)
		or (TMDateEdit(Sender).AsDateTime > DEF_E_DATE) then
		begin
			Beep;
			TWinControl(Sender).SetFocus;
			Exit;
		end;
//<090722_1>↑

		// 050920 >>
		//月日の入力ﾁｪｯｸ
       if not MjsIntYMDChk(MjsDateToInt8(TMDateEdit(Sender).AsDateTime)) then
       begin
	       Beep;
           TWinControl(Sender).SetFocus;
           Exit;
       end;
		// 050920 <<
		// 終了が未入力の場合
		if ((EDateEnd.Value = 0) or (EDateEnd.Value = NULL)) then
	    	// チェック不要
        else
        begin
			// 大小チェック
//<110131_1>↓
//			if EDateStart.AsDateTime >= EDateEnd.AsDateTime then
			if EDateStart.AsDateTime > EDateEnd.AsDateTime then
//<110131_1>↑
            begin
				//異常→終了日にフォーカス
				EDateEnd.SetFocus ();
                ErrFlg := TRUE;
            end;
        end;
    end;

    if ErrFlg = FALSE then
    	fnSetParentItemsInfo();
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.EDateEndExit (TObject)													*/
//*																									*/
//*	目的	: 部門登録処理 一覧画面 適用終了日 Exitイベント											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.EDateEndExit(Sender: TObject);
var ErrFlg : Boolean;

begin
    ErrFlg := FALSE;

	if CloseFlg then
    begin
	    CloseFlg := FALSE;
    	exit;
    end;

	// 未入力の場合
	if ((EDateEnd.Value = 0) or (EDateEnd.Value = NULL)) then
    	// チェック不要
    else
    begin
//<090722_1>↓
		if (TMDateEdit(Sender).AsDateTime < DEF_S_DATE)
		or (TMDateEdit(Sender).AsDateTime > DEF_E_DATE) then
		begin
			Beep;
			TWinControl(Sender).SetFocus;
			Exit;
		end;
//<090722_1>↑

		// 050920 >>
		//月日の入力ﾁｪｯｸ
       if not MjsIntYMDChk(MjsDateToInt8(TMDateEdit(Sender).AsDateTime)) then
       begin
	       Beep;
           TWinControl(Sender).SetFocus;
           Exit;
       end;
		// 050920 <<
		// 開始が未入力の場合
		if ((EDateStart.Value = 0) or (EDateStart.Value = NULL)) then
	    	// チェック不要
        else
        begin
			// 大小チェック
//<110131_1>↓
//			if EDateStart.AsDateTime >= EDateEnd.AsDateTime then
			if EDateStart.AsDateTime > EDateEnd.AsDateTime then
//<110131_1>↑
            begin
				//異常→終了日にフォーカス
				EDateEnd.SetFocus ();
                ErrFlg := TRUE;
            end;
        end;
    end;

    if ErrFlg = FALSE then
    	fnSetParentItemsInfo();
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.DtlCmnEditAppDateStartExit (TObject)										*/
//*																									*/
//*	目的	: 部門登録処理 詳細画面 適用日 Exitイベント												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.DtlCmnEditAppDateStartExit(Sender: TObject);
var
	strErrorMessage: String;
begin
	// 終了処理のときはチェック不要
	if CloseFlg then
    begin
    	exit;
    end;

	// 050920 >>
	if (not DtlCmnButtonCancel.Focused ) Then
    begin
    	if ((TMDateEdit(Sender).Value <> 0) AND (TMDateEdit(Sender).Value <> NULL)) then
        begin
//<090722_1>↓
			if (TMDateEdit(Sender).AsDateTime < DEF_S_DATE)
			or (TMDateEdit(Sender).AsDateTime > DEF_E_DATE) then
			begin
				Beep;
				TWinControl(Sender).SetFocus;
				Exit;
			end;
//<090722_1>↑

			//月日の入力ﾁｪｯｸ
       		if not MjsIntYMDChk(MjsDateToInt8(TMDateEdit(Sender).AsDateTime)) then
	        begin
	       		Beep;
                TWinControl(Sender).SetFocus;
	            Exit;
	       end;
       end;
    end;
	// 050920 <<

	// 適用期間(自／至)・取消しボタン　チェック不要
    if ((DtlCmnEditAppDateStart.Focused) OR (DtlCmnEditAppDateEnd.Focused) OR (CmnInstructionComboDtl.Focused)
	 OR (DtlCmnButtonCancel.Focused )) Then
		exit;

	// 大小チェック
	// 未入力の場合チェック不要
	if ((DtlCmnEditAppDateEnd.Value   <> 0) AND (DtlCmnEditAppDateEnd.Value   <> NULL)
	AND (DtlCmnEditAppDateStart.Value <> 0) AND (DtlCmnEditAppDateStart.Value <> NULL)) then
    begin
		// 大小チェック
//<110131_1>↓
//		if DtlCmnEditAppDateStart.AsDateTime >= DtlCmnEditAppDateEnd.AsDateTime then
		if DtlCmnEditAppDateStart.AsDateTime > DtlCmnEditAppDateEnd.AsDateTime then
//<110131_1>↑
        begin
			strErrorMessage	:= '適用終了年月日は開始年月日以降でなければなりません。';
			MJSMessageBoxEx (Self, strErrorMessage, '確認', mjInformation, mjOk, mjDefOk, FALSE);
			//異常→終了日にフォーカス
			DtlCmnEditAppDateEnd.SetFocus ();
			Exit;
        end;
    end;

	// 外部コード　チェック不要
    if ((DtlCmnEditExCodeFree.Focused) OR (DtlCmnEditExCodeNumeric.Focused)) THEN
		exit;

    // 重複チェック
	if (not fnCheckDtlExCodeValid()) then
    begin
		// 異常がなければ適用期間を保存しておく
		tmpStartDate	:= DtlCmnEditAppDateStart.AsDateTime;
		tmpEndDate 		:= DtlCmnEditAppDateEnd.AsDateTime;
    end;

//	m_fDtlChangeExCode	:= FALSE;		// 外部ｺｰﾄﾞが変わったか？
//    DtlAppDateExit := True;				// 未使用
end;

procedure TJNTCRP0020030f.StdCmnGridTotalExit(Sender: TObject);
begin
		CmnToolbarButtonDetail.Enabled	:= FALSE;
		CmnToolbarButtonDelete.Enabled	:= FALSE;
		fnEnableToolbarButtonTag (FALSE);
end;

// *************************************************************
// *
// *　　　作成日付：2005.01.27
// *　　　作成者  ：K.Kato
// *
// *　　　関数名称：ErrorMessageDsp
// *　　　関数説明：ｴﾗｰﾒｯｾｰｼﾞ表示
// *
// *　　　入力　　：Query: ｴﾗｰになったｸｴﾘ
// *　　　出力　　：なし
// *
// *************************************************************
procedure TJNTCRP0020030f.ErrorMessageDsp(Query: TMQuery);
var
	MsgRec	: TMjsMsgRec;
begin
//FX10000
	TJNTMASCom(m_pRec^.m_pSystemArea^).m_MsgStd.GetMsgDB(MsgRec, Query);
	MJSMessageBoxEx (Self, MsgRec.sMsg, MsgRec.sTitle, MsgRec.icontype ,MsgRec.btntype ,MsgRec.btndef, FALSE);

end;

// *************************************************************
// *
// *　　　作成日付：2005.02.09
// *　　　作成者  ：Hirota
// *
// *　　　関数名称：ChkChild
// *　　　関数説明：指定の部門が子部門を持つかチェックする
// *
// *　　　入力　　：string   内部コード
// *　　　出力　　：Boolean　結果(TRUE：子なし／FALSE：子あり)
// *
// *************************************************************
function TJNTCRP0020030f.ChkChild(strInCode : string):Boolean;
var
	dqMasterTree   : TMQuery;
begin
    Result := TRUE;

											//MQueryの構築
	dqMasterTree := TMQuery.Create (Self);		// 050606

	try
											//DBとMQueryの接続
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

		with (dqMasterTree) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT tr2.DeptPNCode FROM ' + DEF_HAPTLR + ' tr1, ' + DEF_HAPTLR2 + ' tr2 ');
			SQL.Add   ('WHERE  tr1.MasterKbn = :nMasterDivision ');		// マスタ区分
			SQL.Add   ('  AND  tr1.NCode = tr2.BaseNCode ');			// 内部コードが一致
			SQL.Add   ('  AND  tr2.DeptPNCode = :strExCode');			// 自分が親

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('strExCode'      ).AsString	:= strInCode;

			Open ();

			if	(not EOF) then
				Result := FALSE;

			Close ();

			// 社員が所属している場合は消せないことにする(050425)
			if m_nCurrentMasterDiv = 41 then
            begin
				SQL.Clear ();
				SQL.Add   ('SELECT * FROM HapChg ');
				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision ');			// マスタ区分
				SQL.Add   ('  AND  DeptNCode = :strExCode');				// 自分が親

				ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
				ParamByName ('strExCode'      ).AsString	:= strInCode;

				Open ();

				if	(not EOF) then
					Result := FALSE;

				Close ();
			end;
		end;
    finally
	    dqMasterTree.Free;
    end;
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.ChkPtn1 ()															*/
//*																									*/
//*	目的	: 部門登録処理 パターンから消えるチェック                                    		    */
//*																									*/
//*	引き数	: Integer (0:確認のみ／1:テーブル削除)					                            	*/
//*	戻り値	: Integer (0:外れない／1:外さない／2:外す)					                            */
//*																									*/
//***************************************************************************************************/
function    TJNTCRP0020030f.ChkPtn1 (iParam : Integer): Integer;
var
	dqMasterData: TMQuery;
	dqMasterTree: TMQuery;
	DateS  :	TDateTime;
	DateE  :	TDateTime;
	DateS2 :	TDateTime;
	DateE2 :	TDateTime;
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;
//<090407>↓
//	delNCode	: String;
//	delBaseNCode: String;
	bDel		: Boolean;
	bDelNew		: Boolean;
//<090407>↑
	pos			: Integer;

begin
	if m_nCurrentMasterDiv = 41 then
		pos := 0
	else
		pos := m_nCurrentMasterDiv - MK_SEG01 + 1;

	// 適用期間修正時のチェック or 適用期間が修正された場合のテーブル削除処理なので詳細画面のみ！
	Result  := 0;

	dqMasterData	:= TMQuery.Create (Self);		// 050606
	dqMasterTree	:= TMQuery.Create (Self);		// 050606
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);	                                    // DBとMQueryの接続

	// 部門適用期間
	if ((DtlCmnEditAppDateStart.Value = 0) or (DtlCmnEditAppDateStart.Value = NULL)) then
		DateS := DEF_S_DATE
	else
		DateS := DtlCmnEditAppDateStart.AsDateTime;
	if ((DtlCmnEditAppDateEnd.Value = 0) or (DtlCmnEditAppDateEnd.Value = NULL)) then
		DateE := DEF_E_DATE
	else
		DateE := DtlCmnEditAppDateEnd.AsDateTime;

//<090407>↓
	bDel	:= False;
	bDelNew	:= False;

	try
//<090407>↑
		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
//<090407>↓
			// 現体系のチェック
			SQL.Add('SELECT TR.PtnNm, TR2.BaseNCode, TR2.NCode'
				+	' FROM ' + DEF_HAPTLR + ' TR, ' + DEF_HAPTLR2 + ' TR2 '
				+	' WHERE TR.MasterKbn = :nMasterDivision '					// マスタ区分
				+	  ' AND TR.NCode     = TR2.BaseNCode '						// 組織体系内部コード
				+	  ' AND TR2.DeptNCode= :NCode '								// 部門内部コード
				+	  ' AND ((TR.TStartDate > :nEDate)'
				+	    ' OR (TR.TEndDate < :nSDate))');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('NCode').AsString				:= DtlNCode;
			ParamByName ('nSDate').AsDateTime			:= DateS;
			ParamByName ('nEDate').AsDateTime			:= DateE;

			Open ();

			if	(not EOF) then
				bDel	:= True;

			Close ();
			SQL.Clear ();

			// 新体系のチェック
			SQL.Add('SELECT TR.PtnNm, TR2.BaseNCode, TR2.NCode'
				+	' FROM ' + DEF_HAPTLR + 'Nx TR, ' + DEF_HAPTLR2 + 'Nx TR2 '
				+	' WHERE TR.MasterKbn = :nMasterDivision '					// マスタ区分
				+	  ' AND TR.NCode     = TR2.BaseNCode '						// 組織体系内部コード
				+	  ' AND TR2.DeptNCode= :NCode '								// 部門内部コード
				+	  ' AND ((TR.TStartDate > :nEDate)'
				+	    ' OR (TR.TEndDate < :nSDate))');

			ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
			ParamByName ('NCode').AsString				:= DtlNCode;
			ParamByName ('nSDate').AsDateTime			:= DateS;
			ParamByName ('nEDate').AsDateTime			:= DateE;

			Open ();

			if	(not EOF) then
				bDelNew	:= True;

			if (bDel = True) or (bDelNew = True) then
			begin
				if iParam = 0 then
				begin
					m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10020, 1);

//<090619>↓
//					stMessageRec.sMsg := DtlCmnEditName.Text + 'は、組織体系' + FieldByName('PtnNm').AsString + '等の適用期間外になりますが、変更して宜しいですか？';
					stMessageRec.sMsg := DtlCmnEditName.Text + 'は、組織体系' + FieldByName('PtnNm').AsString + '等の適用期間外になりますが、変更してよろしいですか？';
//<090619>↑
					nReturn	:= MJSMessageBoxEx (Self, stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
					if	(nReturn <> mrYes) then		// やっぱりやめる
					begin
						// 適用期間を元に戻す
						DtlCmnEditAppDateStart.AsDateTime	:= tmpStartDate;
						DtlCmnEditAppDateEnd.AsDateTime		:= tmpEndDate;
						Result	:= 1;
					end
					else
						Result	:= 2;
				end
				else
				begin
					if bDel = True then
						m_DelRecord	:= True;

					if bDelNew = True then
						m_DelRecordN:= True;
				end;
			end;

//		SQL.Add   ('SELECT TR.TStartDate, TR.TEndDate , TR.PtnNm, TR2.BaseNCode, TR2.NCode');
//		SQL.Add   ('FROM ' + DEF_HAPTLR + ' TR, ' + DEF_HAPTLR2 + ' TR2 ');
//		SQL.Add   ('WHERE  TR.MasterKbn = :nMasterDivision ');					// マスタ区分
////		SQL.Add   ('  AND  TR.PtnNo     = 1 ');									// パターン１
//		SQL.Add   ('  AND  TR.NCode     = TR2.BaseNCode ');						// 組織体系内部コード
//		SQL.Add   ('  AND  TR2.DeptNCode= :NCode ');							// 部門内部コード
//
//		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//		ParamByName ('NCode'          ).AsString    := DtlNCode;
//
//		Open ();
//
//		while  (not EOF) do
//		begin
//			{組織体系日付取得}
//			if ((FieldByName('TStartDate').AsString = '') or (FieldByName('TStartDate').IsNull)) then
//				DateS2 := DEF_S_DATE
//			else
//				DateS2 := FieldByName('TStartDate').AsDateTime;
//			if ((FieldByName('TEndDate').AsString = '') or (FieldByName('TEndDate').IsNull)) then
//				DateE2 := DEF_E_DATE
//			else
//				DateE2 := FieldByName('TEndDate').AsDateTime;
//
//			{チェック}
//			{
//			  ①部門	====
//				体系		 ----
//
//			  ②部門		 ====
//				体系	----
//
//			  は警告
//			}
//			if ((DateE < DateS2) OR (DateS > DateE2)) then
//			begin
//				if iParam = 0 then
//				begin
//					if Result = 0 then			// 確認は１回だけ
//					begin
//						m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10020, 1);
//
//						stMessageRec.sMsg := DtlCmnEditName.Text + 'は、組織体系' + FieldByName('PtnNm').AsString + '等の適用期間外になりますが、変更して宜しいですか？';
//						nReturn	:= MJSMessageBoxEx (Self, stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
//													stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
//						//<070410>
//						//if	(nReturn = mrNo) then		// やっぱりやめる
//						if	(nReturn <> mrYes) then		// やっぱりやめる
//						begin
//							// 適用期間を元に戻す
//							DtlCmnEditAppDateStart.AsDateTime	:= tmpStartDate;
//							DtlCmnEditAppDateEnd.AsDateTime		:= tmpEndDate;
//							Result	:= 1;
//							break;
//						end;
//					end;
//					Result	:= 2;
//				end
//				else
//				begin
//					// ツリー削除
//					delNCode := FieldByName('NCode').AsString;
//					delBaseNCode := FieldByName('BaseNCode').AsString;
//					with (dqMasterTree) do
//					begin
//						Close ();
//
//						SQL.Clear ();
//						SQL.Add   ('DELETE FROM ' + DEF_HAPTLR2 + ' ');
//						SQL.Add   ('WHERE NCode = :NCode ');
//						SQL.Add   ('  AND BaseNCode = :BaseNCode ');
//
//						ParamByName ('NCode').AsString	:= delNCode;
//						ParamByName ('BaseNCode').AsString	:= delBaseNCode;
//
//						if	(not ExecSQL ()) then
//						begin
//							m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);
//
//							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);
//
//							dqMasterData.Free ();
//							dqMasterTree.Free ();
//
//							Result	:= 1;
//							Exit;
//						end;
//					end;
//
//					//<002> ↓
//					if (m_nCurrentMasterDiv = 41) or (m_nCurrentMasterDiv = 101) then
//					begin
//					//<002>↑
//						m_bHojyoTreeDelete [pos]	:= 1;
//						m_bHojyoTree2	   [pos]	:= 1;
//					end;
//				end;
//			end;
//			NEXT;
//		end;
//<090407>↑

			Close ();
		end;
//<090407>↓
	finally
//<090407>↑
		dqMasterTree.Free ();
		dqMasterData.Free ();
//<090407>↓
	end;
//<090407>↑
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.ChkPtn2 ()															*/
//*																									*/
//*	目的	: 部門登録処理 パターンで使われているかチェック                                    		*/
//*																									*/
//*	戻り値	: Integer (0:未使用／1:消さない／2:消す)					                            */
//*																									*/
//***************************************************************************************************/
function    TJNTCRP0020030f.ChkPtn2 (nMasterDiv : Integer; nInCode : String): Integer;
var
	dqMasterData: TMQuery;
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;

begin
	Result  := 0;

	dqMasterData	:= TMQuery.Create (Self);		// 050606
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();

		SQL.Add   ('SELECT TR.PtnNm, TR2.BaseNCode, TR2.NCode');
        SQL.Add   ('FROM ' + DEF_HAPTLR + ' TR, ' + DEF_HAPTLR2 + ' TR2 ');
		SQL.Add   ('WHERE  TR.MasterKbn = :nMasterDivision ');					// マスタ区分
//        SQL.Add   ('  AND  TR.PtnNo     = 1 ');									// パターン１
        SQL.Add   ('  AND  TR.NCode     = TR2.BaseNCode ');						// 組織体系内部コード
        SQL.Add   ('  AND  TR2.DeptNCode= :NCode ');							// 部門内部コード

        ParamByName ('nMasterDivision').AsInteger   := nMasterDiv;
        ParamByName ('NCode'          ).AsString    := nInCode;

		Open ();

		// 組織体系登録されていたら
		if  (not EOF) then
        begin
			Result  := 2;
        	// 確認メッセージ表示
			m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10020, 1);

//<090619>↓
//			stMessageRec.sMsg := '組織体系' + FieldByName('PtnNm').AsString + '等で使用されていますが、削除して宜しいですか？';
			stMessageRec.sMsg := '組織体系' + FieldByName('PtnNm').AsString + '等で使用されていますが、削除してよろしいですか？';
//<090619>↑
			nReturn	:= MJSMessageBoxEx (Self, stMessageRec.sMsg, m_pRec^.m_ProgramName, stMessageRec.icontype,
										stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
			//<070410>
			//if	(nReturn = mrNo) then		// やっぱりやめる
			if	(nReturn <> mrYes) then		// やっぱりやめる
			begin
				Result  := 1;
           	end;
        end;

		Close ();
    end;

	dqMasterData.Free ();
end;


procedure TJNTCRP0020030f.DtlCmnEditSegCDArrowClick(Sender: TObject);
var i			: integer;
	j			: integer;
// 0706 EXP >>
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    i64		:	Int64;

begin
	for i := 1 to 10 do
    begin
    	if DtlCmnEditSegCD[i].Focused then
        	break;
    end;
	for j := 1 to ITEM_MAX do
    begin
		if m_stSelectItem [j].nMasterDivision = (MK_SEG01 + i - 1) then
        	break;
    end;

// 0706 EXP >>
    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;		       	//MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;       //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.MasterKbn     :=  m_stSelectItem [j].nMasterDivision;	//マスタ区分
    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝部門

    lvExpSend.TBarNM        :=  m_stSelectItem [j].strItemCaption + '検索エクスプローラー'; //<210202>Upd 長音対応
{
    lvExpSend.TableName     :=  'HojyoMA';          //部門マスタ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;
    lvExpSend.TrRootCaption :=  m_stSelectItem [j].strItemCaption;
    lvExpSend.WhereStr		:= 'MasterKbn = ' + IntToStr(m_stSelectItem [j].nMasterDivision);
}
    lvExpSend.WhereStr		:= 'RDelKbn = 0 ';		// 050829
	lvExpSend.SumKbn		:= 0;					// 050905 実在のみ

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
		DtlCmnEditSegCD[i].Text		:= lvExpRecv.GCode;
//		DtlCmnEditSegCD[i].InputFlag	:= FALSE;
		DtlLabelSegTx[i].Caption	:= lvExpRecv.Nmk;

    	i64 := Trunc(lvExpRecv.NCode);
        DtlSegNCode[i]				:= IntToStr(i64);
		MjsDispCtrl.MjsNextCtrl (Self);
    end;
end;


//***********************************************************************************************************/
//	外部コード(フリー)フォーカスアウト
//***********************************************************************************************************/
procedure TJNTCRP0020030f.DtlCmnEditExCodeFreeExit(Sender: TObject);
var strExCode : String;
    bln       : Boolean; //<003>
	iRet	   : Integer;						//  <マスタ同期>
begin
	// 終了処理のときはチェック不要
	if CloseFlg then
    begin
    	exit;
    end;

	// 取消しボタン・コンボ　チェック不要
    if  (DtlCmnButtonCancel.Focused) OR (CmnInstructionComboDtl.Focused) Then
		exit;
//<080311>↓
//	if Screen.ActiveControl.Name = 'CmnInstructionComboDtl' then
	if m_cACControl.Name = 'CmnInstructionComboDtl' then
//<080311>↑
		exit;

	//<003> ↓
	// ﾌｫｰｶｽが自分のﾌｫｰﾑ上のｺﾝﾄﾛｰﾙではない時
//<080311>↓
//	bln:= Self.ContainsControl(Screen.ActiveControl);
	bln:= Self.ContainsControl(m_cACControl);
//<080311>↑
	if not bln then
	begin
		Exit;
	end;
	// ﾌﾟﾚﾋﾞｭｰ中のとき
	if	(m_cPreview.IsPreView ()) then
	begin
		Exit;
	end;
	//<003> ↑

    //<005> ↓
    // Tabのときﾁｪｯｸ不要
    if	DtlCmnTab.Focused   then
    begin
        Exit;
    end;
    //<005> ↑

	DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);
	strExCode	:= DtlCmnEditExCodeFree.Text;
    
	if	(Trim (strExCode) = '') then
	begin
		Beep ();
		DtlCmnEditExCodeFree   .SetFocus ();
		Exit;
	end;

	if	(not fnCheckExCodeValidCharacter (strExCode)) then
	begin
		DtlCmnEditExCodeFree.SetFocus ();
		Exit;
	end;

	//  <マスタ同期>---Begin---
	// 実在／合計同一コードチェック
	iRet := fnCheckMasterDataRecordValid2 (strExCode);
	// 自社に存在
	if iRet = C_RET_SAME_SELF then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		if	(DtlCmnTab.Items [1].Selected) then				// 合計
			m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg
		else
			m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditExCodeFree   .SetFocus ();

		Exit;
	end
	// 全社に存在
	else if iRet = C_RET_SAME_PARENT then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
        									// 簡略名称もﾒｯｾｰｼﾞに表示する
		MJSMessageBoxEx (Self,
        				 m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                         m_cErrorMsgRec.sTitle,
                         m_cErrorMsgRec.icontype,
                         m_cErrorMsgRec.btntype,
                         m_cErrorMsgRec.btndef,
                         m_cErrorMsgRec.LogType);
// <014> MOD end

		DtlCmnEditExCodeFree   .SetFocus ();

		Exit;
	end
	// 両方に存在しない以外（異常）
	else if iRet <> C_RET_NONE then
	begin
		Beep ();
		DtlCmnEditExCodeFree   .SetFocus ();

		Exit;
	end;
	(*
	// 実在／合計同一コードチェック
	if  (not fnCheckMasterDataRecordValid2 (strExCode)) then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		if	(DtlCmnTab.Items [1].Selected) then				// 合計
			m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg
		else
			m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditExCodeFree   .SetFocus ();

		Exit;
	end;
	*)
	//  <マスタ同期>--- End ---
	// セグメント登録の場合は適用期間は無関係
    if ParentMasterDiv <> 101 then
    begin
		// 適用期間(自／至)　チェック不要
    	if  (DtlCmnEditAppDateStart.Focused) OR (DtlCmnEditAppDateEnd.Focused) then
			exit;
    end;

    // 重複チェック
	if (not fnCheckDtlExCodeValid()) then
    begin
		// 異常がなければ適用期間を保存しておく
		tmpStartDate	:= DtlCmnEditAppDateStart.AsDateTime;
		tmpEndDate 		:= DtlCmnEditAppDateEnd.AsDateTime;
    end;

end;

//***********************************************************************************************************/
//	外部コード(数字)フォーカスアウト
//***********************************************************************************************************/
procedure TJNTCRP0020030f.DtlCmnEditExCodeNumericExit(Sender: TObject);
var strExCode : String;
    bln       : Boolean; //<003>
	iRet	   : Integer;						//  <マスタ同期>
begin
	// 終了処理のときはチェック不要
	if CloseFlg then
    begin
    	exit;
    end;

	// 取消しボタン　チェック不要
    if  (DtlCmnButtonCancel.Focused) OR (CmnInstructionComboDtl.Focused) Then
		exit;
//<080311>↓
//	if Screen.ActiveControl.Name = 'CmnInstructionComboDtl' then
	if m_cACControl.Name = 'CmnInstructionComboDtl' then
//<080311>↑
		exit;

	//<003> ↓
	// ﾌｫｰｶｽが自分のﾌｫｰﾑ上のｺﾝﾄﾛｰﾙではない時
//<080311>↓
//	bln:= Self.ContainsControl(Screen.ActiveControl);
	bln:= Self.ContainsControl(m_cACControl);
//<080311>↑
	if not bln then
	begin
		Exit;
	end;
	// ﾌﾟﾚﾋﾞｭｰ中のとき
	if	(m_cPreview.IsPreView ()) then
	begin
		Exit;
	end;
	//<003> ↑

    //<005> ↓
    // Tabのときﾁｪｯｸ不要
    if	DtlCmnTab.Focused   then
    begin
        Exit;
    end;
    //<005> ↑
    
	if	(DtlCmnEditExCodeNumeric.InputFlag and (Trunc (DtlCmnEditExCodeNumeric.Value) = 0)) then
		strExCode	:= ''
	else
		strExCode	:= Format ('%.16d', [Trunc (DtlCmnEditExCodeNumeric.Value)]);

	if	(Trim (strExCode) = '') then
	begin
		Beep ();
		DtlCmnEditExCodeNumeric.SetFocus ();
		Exit;
	end;
	//  <マスタ同期>---Begin---
	// 実在／合計同一コードチェック
	iRet := fnCheckMasterDataRecordValid2 (strExCode);
	// 自社に存在
	if iRet = C_RET_SAME_SELF then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		if	(DtlCmnTab.Items [1].Selected) then				// 合計
			m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg
		else
			m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditExCodeNumeric.SetFocus ();

		Exit;
	end
	// 全社に存在
	else if iRet = C_RET_SAME_PARENT then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := JNTSYNC_MSG_SUM_ERR;

// <014> MOD start
//		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
         									// 簡略名称もﾒｯｾｰｼﾞに表示する
    	MJSMessageBoxEx (Self,
        				m_cErrorMsgRec.sMsg + #13#10 + #13#10 + m_strSimpleName,
                        m_cErrorMsgRec.sTitle,
                        m_cErrorMsgRec.icontype,
                        m_cErrorMsgRec.btntype,
                        m_cErrorMsgRec.btndef,
                        m_cErrorMsgRec.LogType);
// <014> MOD end

		DtlCmnEditExCodeNumeric.SetFocus ();

		Exit;
	end
	// 両方に存在しない以外（異常）
	else if iRet <> C_RET_NONE then
	begin
		Beep ();
		DtlCmnEditExCodeNumeric.SetFocus ();

		Exit;
	end;
	(*
	// 実在／合計同一コードチェック
	if  (not fnCheckMasterDataRecordValid2 (strExCode)) then
	begin
		Beep ();
		//	同一コードが存在してます
		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
		m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		if	(DtlCmnTab.Items [1].Selected) then				// 合計
			m_cErrorMsgRec.sMsg := '実在情報で' + m_cErrorMsgRec.sMsg
		else
			m_cErrorMsgRec.sMsg := '合計情報で' + m_cErrorMsgRec.sMsg;
		MJSMessageBoxEx (Self, m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
		DtlCmnEditExCodeNumeric.SetFocus ();

		Exit;
	end;
	*)
	//  <マスタ同期>--- End ---
	// セグメント登録の場合は適用期間は無関係
	if ParentMasterDiv <> 101 then
	begin
		// 適用期間(自／至)　チェック不要
		if  (DtlCmnEditAppDateStart.Focused) OR (DtlCmnEditAppDateEnd.Focused) then
			exit;
	end;

    // 重複チェック
	if (not fnCheckDtlExCodeValid()) then
    begin
		// 異常がなければ適用期間を保存しておく
		tmpStartDate	:= DtlCmnEditAppDateStart.AsDateTime;
		tmpEndDate 		:= DtlCmnEditAppDateEnd.AsDateTime;
    end;


end;

procedure TJNTCRP0020030f.FFunctionBarFunctionClick(Sender: TObject;
  FuncNo: Integer);
var strNameWork : String;
begin
	if FuncNo = 1 then
//<100903>↓
	begin
//<110131_3>↓
//		if (m_arFunction[0] <> '') then
		if (m_arFunction[0] <> '') and (FFunctionBar.Enabled = True) then
//<110131_3>↑
//<100903>↑
			ChgFree()
//<100903>↓
	end
//<100903>↑

	else if FuncNo = 8 then
	begin
//<131001>↓
		if (m_arFunction[7] <> '') and (FFunctionBar.Enabled = True) then
		begin
//<131001>↑
			//略称でF8キー
			if	((StdCmnClientPanel.Visible) AND (StdCmnTab.Items[0].Selected)) then								// 一覧（実在）
			begin
				strNameWork	:= StdCmnMemDataExist.FieldByName('strName').AsString;			// 正式名称

				if	(strNameWork <> '') then
				begin
					StdCmnMemDataExist.Edit ();
					StdCmnMemDataExist.FieldByName('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
					StdCmnMemDataExist.Post ();
				end;
			end
			//略称でF8
			else if	((StdCmnClientPanel.Visible) AND (StdCmnTab.Items[1].Selected)) then								// 一覧（実在）
			begin
				strNameWork	:= StdCmnMemDataTotal.FieldByName('strName').AsString;			// 正式名称

				if	(strNameWork <> '') then
				begin
					StdCmnMemDataTotal.Edit ();
					StdCmnMemDataTotal.FieldByName('strNameSimple').AsString	:= MJSKabuCut (strNameWork, 14);
					StdCmnMemDataTotal.Post ();
				end;
			end
			else if	(DtlCmnClientPanel.Visible) then								// 詳細
			begin
				strNameWork	:= DtlCmnEditName.Text;											// 正式名称

				if	(strNameWork <> '') then
					DtlCmnEditNameSimple.Text	:= MJSKabuCut (strNameWork, 14);
			end;
//<131001>↓
		end;
//<131001>↑
    end;
end;


procedure TJNTCRP0020030f.ChgFree();
var
    lvNCode:    Currency;
    lvCaption:  String;
    lvType:     integer;
    lvTblName:  String;
//    nCount:     integer;
begin
{
	for nCount := 1 to ITEM_MAX do
	begin
		if  (m_stSelectItem [nCount].nMasterDivision = m_nCurrentMasterDiv) then
		begin
			lvCaption		:= m_stSelectItem [nCount].strItemCaption;
			break;
		end;
	end;
}
	// フリー項目設定ダイアログ初期化
	fnJNTFreeDlgInit(m_pRec, m_pRec^.m_pSystemArea, @m_cDBSelect);			//<FREEINIT> ADD

	lvCaption		:= m_stMasterItem.strItemCaption;
    lvNCode     :=  StrToCurr(DtlNCode);
    lvCaption   :=  lvCaption + 'ｺｰﾄﾞ';
	if m_nCurrentMasterDiv = 41 then
	    lvType      :=  1120					// MMEISHOマスタ区分 （フリー項目(文字)部門）
    else
	    lvType      :=  1200 + (m_nCurrentMasterDiv - 101) * 10;	// MMEISHOマスタ区分 （フリー項目(文字)セグメント）
    lvTblName   :=  DEF_HOJYOMA;

    try
        //  ダイアログ表示内容変更
   	    fnJNTFreeDlgInfo(lvTblName, 'NCode', 'GCode', 'SimpleName', lvCaption, lvType);

//<160224>↓
//		// 修正モードの場合
//		if (lvNCode <> 0) AND (ModeBtn.Caption <> '参　照') AND (UpdFreeFlg = FALSE) then
//		begin
//			//	ダイアログ表示
//			if fnJNTFreeDlgShow(lvNCode) = mrOK then
//			begin
//				//	フリー項目更新
//				freeItem := fnJNTFreeDlgGetItem;
//				UpdFreeFlg := True;
//				m_fChangeDetails := True;
//			end;
//		end

		// 修正権限が無くても表示のためにデータを取得する
		if (lvNCode <> 0) then
		begin
			// UpdFreeFlg が Trueのときはフリー項目編集中
			if (UpdFreeFlg = FALSE) then
			begin
				//	ダイアログ表示
				if fnJNTFreeDlgShow(lvNCode) = mrOK then
				begin
					//	フリー項目更新
					freeItem := fnJNTFreeDlgGetItem;
					UpdFreeFlg := True;
					m_fChangeDetails := True;
				end;
			end
			else
			begin
				// 表示項目設定
				fnJNTFreeDlgSetItem(@freeItem, lvType);
				// ﾀﾞｲｱﾛｸﾞの表示
				if ( fnJNTFreeDlgShow2() = mrOK ) then
				begin
					//	フリー項目更新
					freeItem := fnJNTFreeDlgGetItem;
					UpdFreeFlg := True;
					m_fChangeDetails := True;
				end;
			end;
		end
		// 新規登録時の動作
//<160224>↑
        else
        begin
			if	(m_nCurrentCodeAttr <= 1) then
				freeItem.GCode := IntToStr(Trunc(DtlCmnEditExCodeNumeric.Value))
			else
				freeItem.GCode := DtlCmnEditExCodeFree.Text;

			freeItem.LCaption := lvCaption;
            freeItem.NCode := lvNCode;
            freeItem.Nm := DtlCmnEditName.Text;
			freeItem.Nmk := DtlCmnEditNameSimple.Text;

        	//  表示項目設定
    	    fnJNTFreeDlgSetItem(@freeItem, lvType);
        	//  ダイアログ表示
	        if fnJNTFreeDlgShow2() = mrOK then
    	    begin
        	    //  フリー項目更新
	            freeItem := fnJNTFreeDlgGetItem;
    	        UpdFreeFlg := True;
                m_fChangeDetails := True;
        	end;
        end;
    except
    end;
//	ShowMessage('フリー項目の入力をします。');
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TMas210100f.fnCmnInstructionComboOnChange (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 指示ｺﾝﾎﾞﾎﾞｯｸｽ OnChange ｲﾍﾞﾝﾄ												*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.CmnInstructionComboChange(Sender: TObject);
begin
	if	(m_fIgnoreProc) then
	begin
		m_fIgnoreProc	:= False;
		Exit;
	end;

	if	(not CmnInstructionCombo.DroppedDown) then
    begin
    	CmnInstructionComboDtl.ItemIndex := CmnInstructionCombo.ItemIndex;
		if fnChangeSelectionScreen () then
			MjsDispCtrl.MjsNextCtrl (Self);
    end;
end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TMas210100f.fnCmnInstructionComboOnKeyDown (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 指示ｺﾝﾎﾞﾎﾞｯｸｽ OnKeyDown ｲﾍﾞﾝﾄ											*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure TJNTCRP0020030f.CmnInstructionComboKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if	((Key = VK_ESCAPE) or (Key = VK_END)) then								// End & Esc
	begin
		if (not TMComboBox(Sender).DroppedDown) then
        begin
			Close ();
			Abort;
        end
        else
        begin
           	// 元に戻す
			TMComboBox(Sender).DroppedDown := False;
            TMComboBox(Sender).ItemIndex := SegIndex;
   	        TMComboBox(Sender).Text := TMComboBox(Sender).ColumnText(SegIndex);
			Abort;
        end;
	end;

	if	((Key = VK_TAB) and (Shift = [ssShift])) then							// Shift+Tab
		Abort;

	if	((Key = VK_RETURN) or (Key = VK_TAB)) then								// Enter & Tab
	begin
		m_fIgnoreProc	:= TRUE;
		if TMComboBox(Sender).Name = 'CmnInstructionComboDtl' then
        	CmnInstructionCombo.ItemIndex := CmnInstructionComboDtl.ItemIndex;
		if TMComboBox(Sender).Name = 'CmnInstructionCombo' then                 // <010>
        	CmnInstructionComboDtl.ItemIndex := CmnInstructionCombo.ItemIndex;  // <010>
            
		if TMComboBox(Sender).Text <> '' then
        begin
			if	(fnChangeSelectionScreen ()) then
				MJSDispCtrl.MjsNextCtrl (Self);	// 051124
				// 051124	EDateStart.SetFocus ();
        end;

		Abort;
	end;

	if	(Key = VK_LEFT) then
	begin
    {
    	if (SegIndex <> CmnInstructionCombo.ItemIndex) then						// 変わった
        begin
			if	(fnChangeSelectionScreen ()) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
        else
			MJSDispCtrl.MjsPrevCtrl (Self);
	}
        abort;
	end

	else if	(Key = VK_RIGHT) then
	begin
		if TMComboBox(Sender).Name = 'CmnInstructionComboDtl' then
        	CmnInstructionCombo.ItemIndex := CmnInstructionComboDtl.ItemIndex;
    	if (SegIndex <> TMComboBox(Sender).ItemIndex) then						// 変わった
        begin
			if	(fnChangeSelectionScreen ()) then
				MJSDispCtrl.MjsNextCtrl (Self);
        end
        else
			MJSDispCtrl.MjsNextCtrl (Self);
        abort;
	end

	else if	((Key = VK_UP) OR (Key = VK_DOWN)) then
	begin
		m_fIgnoreProc	:= TRUE;
	end;
    
end;

procedure TJNTCRP0020030f.DtlCmnEditSegCD1Exit(Sender: TObject);
var
	strExCode    : String;
	strNameSimple: String;
	strWorkInCode: String;
	fReturn      : Boolean;
    i			 : Integer;

begin
	if CloseFlg then
    	exit;

	for i := 1 to 10 do
    begin
    	if DtlCmnEditSegCD[i]^ = Pointer(Sender) then
        	break;
    end;

//<100827>↓
//   	if DtlCmnEditSegCD[i].Text = '' then
   	if Trim(DtlCmnEditSegCD[i].Text) = '' then
//<100827>↑
       	exit;

//	if	(not DtlCmnEditSegCD[i].InputFlag) then
	begin
		if ((DtlCmnEditSegCD[i].InputAttr <> iaFree)
		AND (DtlCmnEditSegCD[i].InputAttr <> iaNone)) then							// 数値
			strExCode	:= Format ('%.16d', [StrToInt64(DtlCmnEditSegCD[i].Text)])
		else																	// フリー
			strExCode	:= DtlCmnEditSegCD[i].Text;

		fReturn		:= fnCheckRegistSegCd (strExCode, (MK_SEG01 + i - 1), strNameSimple, strWorkInCode);

		DtlLabelSegTx[i].Caption	:= strNameSimple;
        DtlSegNCode[i]				:= strWorkInCode;

		if	(not fReturn) then
		begin
			Beep ();
			// 取消ボタンに移動
            if (DtlCmnButtonCancel.Focused) then
            	DtlCmnEditSegCD[i].Text := ''		// クリア
            else
				DtlCmnEditSegCD[i].SetFocus ();		// 再入力
			Abort;
		end;
//	end
//	else
//    begin
//		DtlLabelSegTx[i].Caption	:= '';
//		DtlSegNCode[i]				:= '';
    end;

end;

//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistSegCd (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 セグメント登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistSegCd (strExCode: String; MasKbn : Integer; var strDepartmentName, strNCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	// 入力された外部コードから略称と内部コードを取得する
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT NCode, SimpleName FROM ' + DEF_HOJYOMA);
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and GCode = :strExCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= MasKbn;
		ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		if  (not EOF) then
		begin
	        strNCode			:= GetFld ('NCode').AsString;
			strDepartmentName	:= GetFld ('SimpleName').AsString;

			fReturn	:= True;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistSegCd2 (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 セグメント登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistSegCd2 (strNCode: String; MasKbn : Integer; var strDepartmentName, strGCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	// 入力された内部コードから略称と外部コードを取得する
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT GCode, SimpleName FROM ' + DEF_HOJYOMA);
		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision and NCode = :strInCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= MasKbn;
		ParamByName ('strInCode'      ).AsString    := strNCode;

		Open ();

		if  (not EOF) then
		begin
	        strGCode			:= GetFld ('GCode').AsString;
			strDepartmentName	:= GetFld ('SimpleName').AsString;

			fReturn	:= True;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;


//050425>>
procedure TJNTCRP0020030f.DtlCmnEditBunruiCD1ArrowClick(Sender: TObject);
var i			: integer;
// 0706 EXP >>
    lvExpSend:  rcJNTExpSend;   //
    lvExpRecv:  rcJNTExpRecv;   //
    iExpRtn:    Integer;        //
    i64		:	Int64;

begin
	for i := 1 to 10 do
    begin
    	if DtlCmnEditBunruiCD[i].Focused then
        	break;
    end;

// 0706 EXP >>
    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;		       	//MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;       //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.MasterKbn     :=  BunruiMKbn + i;		//マスタ区分
    lvExpSend.ModulKbn      :=  0;                  //モジュール区分
    lvExpSend.PatternNo     :=  1;                  //マスタ区分＝部門

    lvExpSend.TBarNM        :=  m_stBunruiItem [i].strItemCaption + '検索エクスプローラー'; //<210202>Upd 長音対応
{
    lvExpSend.TableName     :=  'MMEISHO';          //名称マスタ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;
    lvExpSend.TrRootCaption :=  m_stBunruiItem [i].strItemCaption;
    lvExpSend.WhereStr		:= 'SetNm = ' + IntToStr(BunruiMKbn + i);
}
    lvExpSend.WhereStr		:= 'RDelKbn = 0 ';		// 050829

    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
		DtlCmnEditBunruiCD[i].Text		:= lvExpRecv.GCode;
//		DtlCmnEditBunruiCD[i].InputFlag	:= FALSE;
		DtlLabelBunruiTx[i].Caption	:= lvExpRecv.Nmk;

    	i64 := Trunc(lvExpRecv.NCode);
        DtlBunruiNCode[i]				:= IntToStr(i64);
		MjsDispCtrl.MjsNextCtrl (Self);
    end;
end;
//050425<<


//050425>>
procedure TJNTCRP0020030f.DtlCmnEditBunruiCD1Exit(Sender: TObject);
var
	strExCode	 : String;
	strNameSimple: String;
	strWorkInCode: String;
	fReturn 	 : Boolean;
	i			 : Integer;

begin
	if CloseFlg then
		exit;

	for i := 1 to 10 do
	begin
		if DtlCmnEditBunruiCD[i]^ = Pointer(Sender) then
			break;
	end;

//<100827>↓
//	if DtlCmnEditBunruiCD[i].Text = '' then
	if Trim(DtlCmnEditBunruiCD[i].Text) = '' then
//<100827>↑
//<110131_2>↓
	begin
		DtlBunruiNCode[i]				:= '';						// 内部コード
		DtlLabelBunruiTx[i].Caption		:= '';						// 名称
//<110131_2>↑
		exit;
//<110131_2>↓
	end;
//<110131_2>↑

//	if	(not DtlCmnEditBunruiCD[i].InputFlag) then
	begin
		// MMEISHOの外部ｺｰﾄﾞ16桁
		if ((DtlCmnEditBunruiCD[i].InputAttr <> iaFree)
		AND (DtlCmnEditBunruiCD[i].InputAttr <> iaNone)) then							// 数値
			strExCode	:= Format ('%.16d', [StrToInt64(DtlCmnEditBunruiCD[i].Text)])
		else																	// フリー
			strExCode	:= DtlCmnEditBunruiCD[i].Text;

		fReturn		:= fnCheckRegistBunruiCd (strExCode, (BunruiMKbn + i), strNameSimple, strWorkInCode);

		DtlLabelBunruiTx[i].Caption		:= strNameSimple;
		DtlBunruiNCode[i]				:= strWorkInCode;

		if	(not fReturn) then
		begin
			Beep ();
			// 取消ボタンに移動
			if (DtlCmnButtonCancel.Focused) then
				DtlCmnEditBunruiCD[i].Text := ''		// クリア
			else
				DtlCmnEditBunruiCD[i].SetFocus ();
			Abort;
		end;
//	end
//	else
//	  begin
//		DtlLabelSegTx[i].Caption	:= '';
//		DtlSegNCode[i]				:= '';
	end;

end;
//050425<<


//050425>>
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistBunruiCd (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 セグメント登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistBunruiCd (strExCode: String; MasKbn : Integer; var strDepartmentName, strNCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	// 入力された外部コードから略称と内部コードを取得する
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT NCode, Nmk FROM MMEISHO ');
		SQL.ADD ('WHERE  SetNm = :nMasterDivision and GCode = :strExCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= MasKbn;
		ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		if  (not EOF) then
		begin
	        strNCode			:= GetFld ('NCode').AsString;
			strDepartmentName	:= GetFld ('Nmk').AsString;

			fReturn	:= True;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;
//050425<<


//050425>>
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckRegistBunruiCd2 (String; var String)							*/
//*																									*/
//*	目的	: 部門登録処理 セグメント登録ﾁｪｯｸ														*/
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																*/
//*                                                                                                 */
//***************************************************************************************************/
function	TJNTCRP0020030f.fnCheckRegistBunruiCd2 (strNCode: String; MasKbn : Integer; var strDepartmentName, strGCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;

begin
	// 入力された内部コードから略称と外部コードを取得する
	strDepartmentName	:= '';

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	fReturn	:= False;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT GCode, Nmk FROM MMEISHO ');
		SQL.ADD ('WHERE  SetNm = :nMasterDivision and NCode = :strInCode and RDelKbn = 0');

		ParamByName ('nMasterDivision').AsInteger	:= MasKbn;
		ParamByName ('strInCode'      ).AsString    := strNCode;

		Open ();

		if  (not EOF) then
		begin
	        strGCode			:= GetFld ('GCode').AsString;
			strDepartmentName	:= GetFld ('Nmk').AsString;

			fReturn	:= True;
		end;

		Close ();
	end;

	Result	:= fReturn;

	dqMasterData.Free ();
end;
//050425<<

function	TJNTCRP0020030f.GetNCodeFromGCode (strGCode: String): String;
var
	dqMasterData: TMQuery;
	strTmp	: String;
begin
    Result			:= '0';

//   	ShowMessage('検索エクスプローラが開発途中の為、指定外部コードで適用期間が最新のものを表示します。');

	if	(m_nCurrentCodeAttr <= 1) then
    	strTmp := Format ('%.16d', [StrToInt64(strGCode)]);

	dqMasterData	:= TMQuery.Create (Self);		// 050606
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear;
		SQL.ADD ('SELECT NCode FROM HojyoMA ');
		SQL.ADD ('WHERE MasterKbn = :nMasterDivision ');
        SQL.ADD ('  AND GCode = :GCode ');
        SQL.ADD ('  AND RDelKbn = 0');
        SQL.ADD ('ORDER BY TStartDate DESC');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('GCode'          ).AsString    := strTmp;

		Open ();

		if  (not EOF) then
		begin
	        Result			:= GetFld ('NCode').AsString;
		end;

		Close ();
	end;
	dqMasterData.Free ();
end;


procedure TJNTCRP0020030f.DummyEnter(Sender: TObject);
begin
    // 正式名称、タブから来た
//	if (BeforeFocus = DtlCmnEditName.Name) OR (BeforeFocus = DtlCmnTab.Name) then
    // 正式名称、取消ボタンから来た
	if (BeforeFocus = DtlCmnEditName.Name) OR (BeforeFocus = DtlCmnButtonCancel.Name) then
		MjsDispCtrl.MjsPrevCtrl (Self)
    else
		MjsDispCtrl.MjsNextCtrl (Self);

end;

procedure TJNTCRP0020030f.DtlCmnEditNameEnter(Sender: TObject);
begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	BeforeFocus := DtlCmnEditName.Name;
end;

procedure TJNTCRP0020030f.DtlCmnEditAppDateEndEnter(Sender: TObject);
begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	BeforeFocus := DtlCmnEditAppDateEnd.Name;
end;

procedure TJNTCRP0020030f.DtlCmnTabEnter(Sender: TObject);
begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	BeforeFocus := DtlCmnTab.Name;
end;

procedure TJNTCRP0020030f.DtlCmnButtonCancelEnter(Sender: TObject);
begin
	m_cACControl := TWinControl(Sender);		//<IDS2>
	BeforeFocus := DtlCmnButtonCancel.Name;
end;

procedure TJNTCRP0020030f.CmnReportExtStandardDepBeforePrint(
  Sender: TObject);
begin
	m_cPrnSupport.BeforePrint (Sender);
end;

procedure TJNTCRP0020030f.ppDetailBand_CmnReportSystemBeforeGenerate(
  Sender: TObject);
begin
	// 最終レコード、頁の最下行を判定する関数の追加
	if (ppDetailBand_CmnReportSystem.LastRecord ) or
		(ppDetailBand_CmnReportSystem.PageOutOfSpace  = True) Then
	begin
		if ppDetailBand_CmnReportSystem.OverFlow = False then
			ppDetailBand_CmnReportSystem.OverFlow := True;

		if CmnReportSystemppLineDetailsBottom.ReprintOnOverFlow = False then
			CmnReportSystemppLineDetailsBottom.ReprintOnOverFlow := True;

		CmnReportSystemppLineDetailsBottom.Weight := 0.75;  // ラインの太さを太くしている
	end
	else
	begin
		CmnReportSystemppLineDetailsBottom.Weight := 0.25;  // ラインの太さを元にもどす
	end;
end;

procedure TJNTCRP0020030f.CmnInstructionComboEnter(Sender: TObject);
begin
	m_cACControl	:= TWinControl(Sender);		//<IDS2>

	m_fIgnoreProc	:= False;
    //SegIndex		:= CmnInstructionCombo.ItemIndex;
    SegIndex		:= TMComboBox(Sender).ItemIndex;
end;

procedure TJNTCRP0020030f.CmnInstructionComboClick(Sender: TObject);
begin
//	if CmnInstructionCombo.DroppedDown then
//    begin
//    	if CmnInstructionCombo.Text <> '' then
//			fnChangeSelectionScreen ();
//    end;
//    abort;
end;

procedure TJNTCRP0020030f.CmnInstructionComboDtlChange(Sender: TObject);
begin
	if	(m_fIgnoreProc) then
	begin
		m_fIgnoreProc	:= False;
		Exit;
	end;

	if	(not CmnInstructionComboDtl.DroppedDown) then
    begin
	   	CmnInstructionCombo.ItemIndex := CmnInstructionComboDtl.ItemIndex;
//        CmnInstructionComboChange(Sender);            // <010>
		CmnInstructionComboChange(CmnInstructionCombo); // <010>
    end;
end;
// <CHK> ↓
//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/16
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function    TJNTCRP0020030f.fnDelCheck(exNCode: Extended; var strErr: String): Boolean;
var
//<080826>↓
//	iRet, nItemPosition,iMasterkbn		  : Integer;
	iRet	: Integer;
//<080826>↑
begin
	Result	:=False;

//<080826>↓
//	iMasterkbn := ParentMasterDiv;
//
//	// ｾｸﾞﾒﾝﾄの場合はｾｸﾞﾒﾝﾄXXにする
//	if (iMasterkbn = 101) then
//	begin
//		nItemPosition	:= CmnInstructionComboDtl.ItemIndex;
//		iMasterkbn		:= iMasterkbn + nItemPosition;
//	end;
//<080826>↑

//<MLXHAP>↓
	if TMSeries.IsMjsLink3 <> True then
	begin
//<MLXHAP>↑
		try
			SPMas.ConnectionName := m_cDBSelect.ConnectionName;
			SPMas.Connection  := m_cDBSelect;

			// 【会計】MP_MAS_CHK_HOJYOMA
			with SPMas do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
	//<080826>↑
//<D10-Stored> S
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
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

		if iRet = 1 then						// 削除不可
			Exit;


		try
			SPPay.ConnectionName := m_cDBSelect.ConnectionName;
			SPPay.Connection  := m_cDBSelect;

			// 【会計】MP_PAY_CHK_HOJYOMA
			with SPPay do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
	//<080826>↑
//<D10-Stored> S
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
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

		if iRet = 1 then						// 削除不可
			Exit;


		try
			SPSel.ConnectionName := m_cDBSelect.ConnectionName;
			SPSel.Connection  := m_cDBSelect;

			// 【販売】MP_SEL_CHK_HOJYOMA
			with SPSel do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
	//<080826>↑
//<D10-Stored> S
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
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

		if iRet = 1 then						// 削除不可
			Exit;

		try
			SPEnt.ConnectionName := m_cDBSelect.ConnectionName;
			SPEnt.Connection  := m_cDBSelect;

			// 【フロント】MP_ETY_CHK_HojyoMA
			with SPEnt do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
//<D10-Stored> S
{
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
	//<080826>↑
}
				ParamByName('@MasterKbn').AsSmallInt := m_nCurrentMasterDiv;
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
												// 結果
				iRet := ParamByName('@RetCd').AsInteger;
												// ｴﾗｰ時の理由
				strErr := ParamByName('@errMsg').AsString;
			end;
		except
			// 例外発生
			strErr := '例外発生(MP_ETY_CHK_HojyoMA)';
			Exit;
		end;

		if iRet = 1 then						// 削除不可
			Exit;

		try
			SPDep.ConnectionName := m_cDBSelect.ConnectionName;
			SPDep.Connection  := m_cDBSelect;

			// 【資産】MP_DEP_CHK_HojyoMA
			with SPDep do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
//<D10-Stored> S
{
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
	//<080826>↑
}
				ParamByName('@MasterKbn').AsSmallInt := m_nCurrentMasterDiv;
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
												// 結果
				iRet := ParamByName('@RetCd').AsInteger;
												// ｴﾗｰ時の理由
				strErr := ParamByName('@errMsg').AsString;
			end;
		except
			// 例外発生
			strErr := '例外発生(MP_DEP_CHK_HojyoMA)';
			Exit;
		end;

		if iRet = 1 then						// 削除不可
			Exit;

	// <004>↓
		try
			SPHap.ConnectionName := m_cDBSelect.ConnectionName;
			SPHap.Connection  := m_cDBSelect;

			// 【人給】MP_HAP_CHK_HOJYOMA
			with SPHap do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
	//<080826>↓
	//			ParamByName('@MasterKbn').AsInteger := iMasterkbn;
				//ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
				ParamByName('@MasterKbn').AsSmallInt:= m_nCurrentMasterDiv;
	//<080826>↑
//<D10-Stored> S
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
												// 結果
				iRet := ParamByName('@RetCd').AsInteger;
												// ｴﾗｰ時の理由
				strErr := ParamByName('@errMsg').AsString;
			end;
		except
			// 例外発生
			strErr := '例外発生(MP_HAP_CHK_HojyoMA)';
			Exit;
		end;

		if iRet = 1 then						// 削除不可
			Exit;
	// <004>↑

//<MLXHAP>↓
	end
	else if ((m_DEPflg = True) or (m_LEAflg = True)) then	//固定資産 or リース資産
	begin
		try
			SPDep.ConnectionName := m_cDBSelect.ConnectionName;
			SPDep.Connection  := m_cDBSelect;

			// 【資産】MP_DEP_CHK_HojyoMA
			with SPDep do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
//<D10-Stored> S
				//ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
				ParamByName('@MasterKbn').AsSmallInt := m_nCurrentMasterDiv;
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E
				ExecProc;						// ｽﾄｱﾄﾞ実行
												// 結果
				iRet := ParamByName('@RetCd').AsInteger;
												// ｴﾗｰ時の理由
				strErr := ParamByName('@errMsg').AsString;
			end;
		except
			// 例外発生
			strErr := '例外発生(MP_DEP_CHK_HojyoMA)';
			Exit;
		end;

		if iRet = 1 then						// 削除不可
			Exit;
	end
	else if (m_HAPflg = True) then							//給与大将
	begin
		try
			SPHap.ConnectionName := m_cDBSelect.ConnectionName;
			SPHap.Connection  := m_cDBSelect;

			// 【人給】MP_HAP_CHK_HOJYOMA
			with SPHap do
			begin
				ParamByName('@NCode').AsFloat := exNCode;
				// <D10-P> mod Start ->
				//ParamByName('@MasterKbn').AsInteger := m_nCurrentMasterDiv;
				ParamByName('@MasterKbn').AsSmallInt := m_nCurrentMasterDiv;
				// <D10-P> mod End <-

//<D10-Stored> S
//デザイン上でConnectionが登録されていない旨のメッセージが出た場合は
//Paramがリセットされるので注意
				FetchOptions.Items := FetchOptions.Items - [fiMeta];
//<D10-Stored> E

				ExecProc;						// ｽﾄｱﾄﾞ実行
												// 結果
				iRet := ParamByName('@RetCd').AsInteger;
												// ｴﾗｰ時の理由
				strErr := ParamByName('@errMsg').AsString;
			end;
		except
			// 例外発生
			strErr := '例外発生(MP_HAP_CHK_HojyoMA)';
			Exit;
		end;

		if iRet = 1 then						// 削除不可
			Exit;
	end;
//<MLXHAP>↑

	Result := True; 						// 削除可能
end;
// <CHK> ↑
//  <マスタ同期>---Begin---
//*************************************************
//*		Proccess	:	Relを更新
//*		Name		:	S.Hirota
//*		Date		:	2007/03/01
//*		Parameter	:	iNCode,mqCopDB
//*		Return		:	Boolean
//*		History		:	9999/99/99	X.Xxxx
//*************************************************
function TJNTCRP0020030f.fnWriteData_REl(iNCode : Int64; iMasterKbn: Integer;
										 mqCopDB : TMQuery; RDelKbn: Integer=0) : Boolean;
var		bNew	: Boolean;
		iDspKbn : Integer;					// <012> ADD
begin
	Result := False;

	if (iNCode < 1) then
		Exit;

	with mqCopDB do
	begin
		{HAPSC_Relの更新}
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM HojyoMA_Rel');
		SQL.Add('WHERE Ncode = :NCode');
		SQL.Add('AND GrpSegNCode = :GrpSegNCode');
		SQL.Add('AND MasterKbn = :MasterKbn');

		SetFld('NCode').AsFloat			:=	iNCode;
		SetFld('GrpSegNCode').AsFloat	:=	m_SyncMaster.m_nSegNCode;
		SetFld('MasterKbn').AsInteger	:=	iMasterKbn;

		if not Open then
		begin
			Exit;
		end;

		if Eof then
		begin
			bNew := True;						// 新規
		end
		else
		begin
			bNew := False;						// 修正
		end;


		Close;
		SQL.Clear;

		if bNew then
		begin
			SQL.Add('INSERT INTO');
			SQL.Add('HojyoMA_Rel (');
			SQL.Add('NCode,');
			SQL.Add('GrpSegNCode,');
			SQL.Add('MasterKbn,');
			SQL.Add('RDelKbn_REL');
			SQL.Add(') VALUES (');
			SQL.Add(':NCode,');
			SQL.Add(':GrpSegNCode,');
			SQL.Add(':MasterKbn,');
			SQL.Add(':RDelKbn');
			SQL.Add(')');
		end
		else
		begin
			SQL.Add('UPDATE');
			SQL.Add('HojyoMA_Rel');
			SQL.Add('SET');
			SQL.Add('RDelKbn_REL=:RDelKbn,');
			SQL.Add('UpdDateTM=Now(),');
			SQL.Add('InsDateTM=InsDateTM');
			SQL.Add('WHERE Ncode = :NCode');
			SQL.Add('AND GrpSegNCode = :GrpSegNCode');
			SQL.Add('AND MasterKbn = :MasterKbn');
		end;
		SetFld('NCode').AsFloat			:=	iNCode;
		SetFld('GrpSegNCode').AsFloat	:=	m_SyncMaster.m_nSegNCode;
		SetFld('MasterKbn').AsInteger	:=	iMasterKbn;
		SetFld('RDelKbn').AsInteger		:=	RDelKbn;

		m_cDataModule.BeginTran (m_cDBSelect);
		m_cDataModule.BeginTran (m_SyncMaster.m_cPDBSelect);

		if not ExecSQL then
		begin
			// 失敗
			m_cDataModule.Rollback (m_cDBSelect);	// ﾛｰﾙﾊﾞｯｸ(破棄)
			m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);	// ﾛｰﾙﾊﾞｯｸ(破棄)

			Exit;
		end;
	end;


// <012> ADD start
    if RDelKbn = 1 then 					// 削除時
    begin
        iDspKbn := 2
    end
    else
    begin                   				// 登録時
		iDspKbn := 1;
    end;
                               				// 表示区分を表示で更新する
    if not fnWriteData_SecHojyo(iNCode, iDspKbn) then
    begin
    	m_cDataModule.Rollback (m_cDBSelect);	// ﾛｰﾙﾊﾞｯｸ(破棄)
        m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);	// ﾛｰﾙﾊﾞｯｸ(破棄)

        Exit;
    end;

// <012> ADD end


	if m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) then		// 子会社に同期
	begin
		m_cDataModule.Commit(m_cDBSelect);
		m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
		Result := True;
	end
	else										// 同期失敗
	begin
		m_cDataModule.Rollback (m_cDBSelect);
		m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);
	end;
end;
//*************************************************
//*		Proccess	:	マスタ同期プロシージャーを呼ぶ
//*		Name		:	S.Hirota
//*		Date		:	2007/03/09
//*		Parameter	:
//*		Return		:	Boolean
//*		History		:	9999/99/99	X.Xxxx
//*************************************************
function TJNTCRP0020030f.fnSYNC(): Boolean;
begin
	// 子会社に同期
	if m_SyncMaster.fnCall_SYNC(JNTSYNC_HojyoMA) then
	begin
		m_cDataModule.Commit(m_cDBSelect);
		m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
		Result := True;
	end
	else										// 同期失敗
	begin
		m_cDataModule.Rollback (m_cDBSelect);
		m_cDataModule.Rollback (m_SyncMaster.m_cPDBSelect);
		Result := False;
	end;

end;

//*************************************************
//*		Proccess	:	子社か？
//*		Name		:	S.Hirota
//*		Date		:	2007/03/01
//*		Parameter	:	なし
//*		Return		:	Boolean
//*		History		:	9999/99/99	X.Xxxx
//*************************************************
function TJNTCRP0020030f.IsChild(): Boolean;
begin
	// グループ管理ありか？
//	Result := (m_flgGrpCorp <> C_GRP_N);
	if (ParentMasterDiv = 41)						// 部門
	or (ParentMasterDiv = 101) then					// セグメント
	begin
		// 全社の場合はなしと同じ扱いでよい
		Result := (m_SyncMaster.m_flgGrpCorp = 1);
	end
	else
	begin
		Result := False;
	end;
end;

//*************************************************
//*		Proccess	:	全社か？
//*		Name		:	S.Hirota
//*		Date		:	2007/03/01
//*		Parameter	:	なし
//*		Return		:	Boolean
//*		History		:	9999/99/99	X.Xxxx
//*************************************************
function TJNTCRP0020030f.IsParent(): Boolean;
begin
	// グループ管理ありか？
	if (ParentMasterDiv = 41)						// 部門
	or (ParentMasterDiv = 101) then					// セグメント
	begin
		// 全社？
		Result := (m_SyncMaster.m_flgGrpCorp = 0);
	end
	else
	begin
		Result := False;
	end;
end;

//  <マスタ同期>--- End ---

//**************************************************************************
//	Proccess  : ｸﾞﾙｰﾌﾟ管理か?				<002> ADD
//	Name	  :	S.Suzuki
//	Date	  :	2007/05/11
//	Parameter : なし
//
//	Retrun	  : True = ｸﾞﾙｰﾌﾟ管理あり False = ｸﾞﾙｰﾌﾟ管理なし
//	History	　:
//
//**************************************************************************
function TJNTCRP0020030f.IsGrop() : Boolean;
begin
    if (ParentMasterDiv = 41) or         	// 部門
       (ParentMasterDiv = 101) then         // ｾｸﾞﾒﾝﾄ
	begin                                	// ｸﾞﾙｰﾌﾟ管理
    	Result := (m_SyncMaster.m_flgGrpCorp <> -1);
    end
    else
    begin
    	Result := False;
    end;
end;

// <012> ADD start
//**************************************************************************
//	Proccess  : ﾏｽﾀ区分の内部ｺｰﾄﾞを取得
//	Name	  :	S.Suzuki
//	Date	  :	2007/04/23
//	Parameter : exNCode 内部ｺｰﾄﾞ
//
//	Retrun	  : True / False
//	History	　:
//
//**************************************************************************
function TJNTCRP0020030f.GetMstNCode(var exNCode : Extended) : Boolean;
var
	dQuery : TMQuery;
begin
	exNCode := 0;  						// 初期化
	Result := False;

    dQuery := TMQuery.Create(Self);

    try                       			// 親会社のDB
        m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, dQuery);
        with dQuery do
        begin
            Close();
            SQL.Clear();
            SQL.Add(' Select @@identity As NCode');

        	if not Open() then
        	begin
        		Exit;
        	end;

        	if not Eof then
        	begin                   		// 内部ｺｰﾄﾞを取得
          		exNCode := GetFld('NCode').AsFloat;
        	end;
        end;
        Result := True;
    finally
    	if dQuery <> nil then
        begin
        	dQuery.Close();
            dQuery.Free();
        end;
    end;
end;

//**************************************************************************
//	Proccess  : ｾｸﾞﾒﾝﾄのﾏｽﾀ区分取得
//	Name	  :	S.Suzuki
//	Date	  :	2007/04/23
//	Parameter : なし
//
//	Retrun	  : True / False
//	History	　:
//
//**************************************************************************
function TJNTCRP0020030f.GetSegMasterKbn() : Boolean;
var
	dQuery : TMQuery;
begin
	Result := False;

    dQuery := TMQuery.Create(Self);

    try            							// 親会社のDB
        m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, dQuery);
        with dQuery do
        begin
            
            Close();
            SQL.Clear();
            SQL.Add(' Select SecMasterKbn'		+
            		' From SecMain'				+
            		' Where OpeKbn = 2'    		+
                    ' And UseKbn = 1');

         	if not Open() then
            begin
            	Exit;
            end;

            if not Eof then      		// ﾚｺｰﾄﾞなしの場合はありえない
            begin
                  						// ｾｸﾞﾒﾝﾄのﾏｽﾀ区分を取得
            	m_iSegMasterKbn := GetFld('SecMasterKbn').AsInteger;
            end;
        end;
        Result := True;

    finally
    	if dQuery <> nil then
        begin
        	dQuery.Close();
            dQuery.Free();
        end;
    end;
end;

//**************************************************************************
//	Proccess  : SecHojyoDispInfoに更新
//	Name	  :	S.Suzuki
//	Date	  :	2007/04/23
//	Parameter : exNCode　　ﾏｽﾀ区分内部ｺｰﾄﾞ
//            : iDspKbn    1 = 表示　2 = 非表示
//
//	Retrun	  : True / False
//	History	　:
//
//**************************************************************************
function TJNTCRP0020030f.fnWriteData_SecHojyo(exNCode : Extended; iDspKbn : Integer) : Boolean;
var
	dQuery : TMQuery;
begin
	Result := False;
    dQuery := TMQuery.Create(Self);
    try                         			// 親会社のDB
        m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, dQuery);
		with dQuery do
		begin
    		Close();
        	SQL.Clear();
    		SQL.Add(' Select NCode From SecHojyoDispInfo'	+
        			' Where OpeKbn = 2'						+
                	' And MasterKbn =:parMstrKbn'			+
                	' And PlaceNCode =:parPlaceNCode'		+
                	' And NoDispMasterKbn =:parNoDspMstr'	+
                	' And NCode =:parNCode');
                              				// ｾｸﾞﾒﾝﾄﾏｽﾀ区分
        	SetFld('parMstrKbn').AsInteger := m_iSegMasterKbn;
        									// ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
        	SetFld('parPlaceNCode').AsFloat := m_SyncMaster.m_nSegNCode;

            if ParentMasterDiv = 41 then    // 部門
            begin
             	SetFld('parNoDspMstr').AsInteger := ParentMasterDiv;
            end
            else                            // ｾｸﾞﾒﾝﾄ
            begin
        									// 内部ｺｰﾄﾞ
            	SetFld('parNoDspMstr').AsInteger := m_stSelectItem[CmnInstructionCombo.ItemIndex + 1].nMasterDivision;
            end;
        									// ﾏｽﾀ内部ｺｰﾄﾞ
           	SetFld('parNCode').AsFloat := exNCode;

        	if not Open() then
        	begin
        		Exit;
        	end;

        	if Eof then
        	begin
        		Close();
				SQL.Clear();
            	SQL.Add(' Insert Into SecHojyoDispInfo'	+
            			' ('							+
                    	' OpeKbn'						+
                    	',MasterKbn'					+
                    	',PlaceNCode'					+
                    	',NoDispMasterKbn'				+
                    	',NCode'						+
                    	',DispKbn'						+
                    	' )'							+
                    	' Values'						+
                    	' ('							+
                    	' :parOpeKbn'					+
                    	',:parMstrKbn'					+
                    	',:parPlaceNCode'				+
                    	',:parNoDspMstr'				+
                    	',:parNCode'					+
                    	',:parDspKbn'					+
                    	' )');
        	end
        	else
        	begin
        		Close();
				SQL.Clear();
            	SQL.Add(' UpDate SecHojyoDispInfo'				+
            			' Set'									+
                       	' DispKbn =:parDspKbn'					+
                    	' Where OpeKbn =:parOpeKbn'				+
                    	' And MasterKbn =:parMstrKbn'  			+
                    	' And PlaceNCode =:parPlaceNCode'		+
                    	' And NoDispMasterKbn =:parNoDspMstr'	+
                    	' And NCode =:parNCode');
        	end;
                                           	// ｸﾞﾙｰﾌﾟ管理
        	SetFld('parOpeKbn').AsInteger := 2;
                                            // ｾｸﾞﾒﾝﾄﾏｽﾀ区分
        	SetFld('parMstrKbn').AsInteger := m_iSegMasterKbn;
        									// ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
        	SetFld('parPlaceNCode').AsFloat := m_SyncMaster.m_nSegNCode;

            if ParentMasterDiv = 41 then    // 部門
            begin
             	SetFld('parNoDspMstr').AsInteger := ParentMasterDiv;
            end
            else                            // ｾｸﾞﾒﾝﾄ
            begin
        									// 内部ｺｰﾄﾞ
            	SetFld('parNoDspMstr').AsInteger := m_stSelectItem[CmnInstructionCombo.ItemIndex + 1].nMasterDivision;
            end;
        									// 内部ｺｰﾄﾞ
        	SetFld('parNCode').AsFloat := exNCode;
        									// 表示または非表示
        	SetFld('parDspKbn').AsInteger := iDspKbn;


        	if not ExecSQL() then
			begin
				Exit;
			end;
		end;
        Result := True;
    finally
    	if dQuery <> nil then
        begin
        	dQuery.Close();
            dQuery.Free();
        end;
    end;
end;

// <012> ADD end



//<IDS2>>>
procedure TJNTCRP0020030f.AllCtrlEnter(Sender: TObject);
begin
	m_cACControl	:= TWinControl(Sender);
end;
//<<<IDS2>

//<080214_2>↓
//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name		:	T.Shinoda(Lab)
//	Date		:	2008/02/14
//	Parameter	:	iSyori  0=設定 1=開放
//	History		:	9999/99/99  X.Xxxxxx
//**********************************************************************
procedure TJNTCRP0020030f.SessionPractice(iSyori: Integer);
begin
	with m_SPMsHist do
	begin
												// 処理区分
		ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		ParamByName('@pTanNCode').AsCurrency	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

		//Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする			//<D10-Stored> DEL
		ExecProc();								// ｽﾄｱﾄﾞ実行
		//UnPrepare();							// ﾘｿｰｽを解放する				//<D10-Stored> DEL
	end;
end;
//<080214_2>↑

//<080902>↓
//**********************************************************************
//	Proccess	:	改行コードの除去
//	Name		:	T.Shinoda(Lab)
//	Date		:	2008/09/02
//	Parameter	:	sBaseText	編集前文字列
//	History		:	9999/99/99  X.Xxxxxx
//**********************************************************************
function TJNTCRP0020030f.fnReplaceCRLF(sBaseText : String) : String;
var
	sWork : String;
begin
	sWork	:= sBaseText;
	sWork	:= StringReplace(sWork,#13,'',[rfReplaceAll]);
	sWork	:= StringReplace(sWork,#10,'',[rfReplaceAll]);

	Result	:= sWork;
end;
//<080902>↑

//<100215_2>↓
//**********************************************************************
//*		Proccess	:日付を文字列に変換して返す
//*		Name		:
//*		Date		:
//*		Parameter	:
//*		Return		:
//**********************************************************************
function TJNTCRP0020030f.DateToStrTmp(date: TDateTime; sts: String): String;
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
//<100215_2>↑

//<100615>↓
//**********************************************************************
//*		Proccess	:適用期間チェック
//*		Name		:
//*		Date		:
//*		Parameter	:
//*		Return		:
//**********************************************************************
function TJNTCRP0020030f.fnChkDate(iNCode:Int64; sGCode: String; StartDate, EndDate: TDateTime): Boolean;
var
	sWkGCode	: String;
begin
	Result	:= False;

	with (m_ChkQry) do
	begin
		Close ();

		SQL.Clear();
		SQL.Add('SELECT GCode, TStartDate, TEndDate'
			+	' FROM ' + DEF_HOJYOMA
			+	' WHERE MasterKbn = :pMaster '
			+	  ' AND RDelKbn = 0'
			+	  ' AND SumKbn = 0'
			+	  ' AND GCode = :pCode'
			+	  ' AND ((TStartDate <= :pStartDate AND :pStartDate <= TEndDate) '
			+	    ' OR (TStartDate <= :pEndDate AND :pEndDate <= TEndDate) '
			+	    ' OR (:pStartDate <= TStartDate AND TStartDate <= :pEndDate) '
			+	    ' OR (:pStartDate <= TEndDate AND TEndDate <= :pEndDate)) '
			);

		if iNCode <> 0 then
			SQL.Add(' AND NCode <> :pNCode');

		sWkGCode	:= sGCode;
		if  (m_nCurrentCodeAttr <= 1) then
		begin
			sWkGCode	:= Format('%.16d', [StrToInt64(Trim(sGCode))]);
		end;

		ParamByName ('pMaster').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('pCode').AsString		:= TrimRight(sWkGCode);
		if	(MjsDateCtrl.MjsDateToInt8(StartDate) = 18991230) then
			ParamByName ('pStartDate').AsDateTIme	:= DEF_S_DATE
		else
			ParamByName ('pStartDate').AsDateTIme	:= StartDate;
		if	(MjsDateCtrl.MjsDateToInt8(EndDate) = 18991230) then
			ParamByName ('pEndDate').AsDateTIme	:= DEF_E_DATE
		else
			ParamByName ('pEndDate').AsDateTIme	:= EndDate;
		if iNCode <> 0 then
			ParamByName ('pNCode').AsInteger	:= iNCode;

		Open ();
		if EOF then
			Result	:= True;
	end;
end;
//<100615>↑

//<MLXDEP>↓
//**********************************************************************
//*		Proccess	:	ツールバーの表示設定
//*		Name		:	IWATA（NTC）
//*		Date		:	2002/04/22
//*		Parameter	:
//*		Return		:
//**********************************************************************
procedure TJNTCRP0020030f.ToolBarObjectMove;
var
	iLeft	: Integer;

	// 一行入力欄のLeftとVisible設定
	procedure TbMove(bVisible: Boolean; TbCtrl: TControl);
	begin
		TbCtrl.Visible	:= bVisible;

		if bVisible = True then
		begin
			TbCtrl.Left	:= iLeft;
			iLeft		:= iLeft + TbCtrl.Width;
		end;
	end;
begin
	iLeft 	:= CmnButtonToolbarExit.Left;
	TbMove(True,					CmnButtonToolbarExit);		// 終了
	TbMove(True,					CmnToolbarButtonPrint);		// 印刷
	TbMove(True,					CmnToolbarButtonChange);	// 切出
	TbMove(True,					CmnToolbarButtonDelete);	// 削除
	TbMove(True,					ToolBar1);					// 付箋
end;
//<MLXDEP>↑

//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
//□		未使用
//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
{
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnExit (TObject)									*/
//*																									*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ										*/
//*																									*/
//*	戻り値	: なし,                                                                                 */
//*																									*/
//***************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeNumericOnExit (Sender: TObject);
var
	strExCode : String;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	(not m_fDtlChangeExCode) then
		Exit;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.10d', [Trunc (DtlCmnEditExCodeNumeric.Value)])
	else
	begin
		DtlCmnEditExCodeFree.Text	:= TrimRight(DtlCmnEditExCodeFree.Text);	//HIS0010
		strExCode	:= DtlCmnEditExCodeFree.Text;
	end;

	if	(m_fDtlNewRecord) then
	begin
		if	(not fnCheckMasterDataRecordValid (strExCode)) then
		begin
			Beep ();
			DtlCmnEditExCodeNumeric.SetFocus ();
			Abort;
		end;

		Exit;
	end;

	m_fDtlNewRecord	:= FALSE;

	if	(fnCheckDetailNewRecord (strExCode)) then										// 新規ﾚｺｰﾄﾞ
	begin
		fnResetDetailScreen ();

		if	(DtlCmnTab.Items [1].Selected) then											// 合計
			fnChangeComponentState (1, FALSE);

//		m_cNodePrevSelect	:= CmnTreeView.Selected;
		m_fDtlNewRecord		:= TRUE;
	end;
end;
}

{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnExit (TObject)											*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[部門外部ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeFreeOnExit (Sender: TObject);
begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	if	(not m_fDtlChangeExCode) then
		Exit;

	if	(m_fDtlNewRecord) then
	begin
		if	(not fnCheckMasterDataRecordValid (DtlCmnEditExCodeFree.Text)) then
		begin
			Beep ();
			DtlCmnEditExCodeFree.SetFocus ();
			Abort;
		end;

		fnResetDetailScreen ();

		if	(DtlCmnTab.Items [1].Selected) then											// 合計
			fnChangeComponentState (1, FALSE);

//		m_cNodePrevSelect	:= CmnTreeView.Selected;

		Exit;
	end;

	m_fDtlNewRecord	:= FALSE;

	if	(fnResetDetailScreen ()) then													// 新規ﾚｺｰﾄﾞ
	begin
		if	(DtlCmnTab.Items [1].Selected) then											// 合計
			fnChangeComponentState (1, FALSE);

//★★★		m_cNodePrevSelect	:= CmnTreeView.Selected;
		m_fDtlNewRecord		:= TRUE;
	end;
end;
}

{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditAssociationOnKeyDown (TObject; var Word; TShiftState)					*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[連想] OnEnter ｲﾍﾞﾝﾄ														*/
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditAssociationOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
		Exit;
	end;

	if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		DtlCmnButtonUpdate.SetFocus ();
		Exit;
	end;

	if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurTop (Sender as TComponent)) then
			begin
				if	(m_nCurrentCodeAttr <= 1) then
					MJSDispCtrl.MjsPrevCtrl (Self)
				else
				begin
					m_cACControl	:= DtlCmnEditExCodeFree;
					m_cACControl.SetFocus ();
				end;
			end;
		end
		else
		begin
			if	(m_nCurrentCodeAttr <= 1) then
				MJSDispCtrl.MjsPrevCtrl (Self)
			else
			begin
				m_cACControl	:= DtlCmnEditExCodeFree;
				m_cACControl.SetFocus ();
			end;
		end;

		Exit;
	end;

	if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);

		Exit;
	end;
end;
}

{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddOnKeyDown (TObject; var Word; TShiftState)					*/
//*																											*/
//*	目的	: 部門登録処理 ｴﾃﾞｨｯﾄ[B/S計上部門] OnKeyDown ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,                                     		                                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP0020030f.fnDtlCmnEditExCodeBSAddOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN) then
	begin
		MjsDispCtrl.MjsNextCtrl (Self);
		Exit;
	end;

	if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		DtlCmnButtonUpdate.SetFocus ();
		Exit;
	end;

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
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);

		Exit;
	end;
end;
}
(*
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckMasterDataRecordValid (String)										*/
//*																									*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	DateS  :	TDateTime;
	DateE  :	TDateTime;
	DateS2 :	TDateTime;
	DateE2 :	TDateTime;
begin
//適用期間 開始日＜終了日が前提

	Result  := TRUE;

	if	(Trim (strExCode) = '') then
	begin
		Result	:= FALSE;
		Exit;
	end;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT TStartDate, TEndDate , NCode, LongName FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');
		if DtlCmnClientPanel.Visible = True then				// 詳細画面の場合
			SQL.Add   ('  AND  NCode <> :NCode');				// 自分とは比較しない

        ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;
		if DtlCmnClientPanel.Visible = True then				// 詳細画面の場合
	        ParamByName ('NCode'      ).AsString    := DtlNCode;

		Open ();

		while  (not EOF) do
        begin
			// 職種・役職等も外部コードは重複できる！
            if (ParentMasterDiv = 101) then					// セグメントの場合は適用期間は無関係
            begin
            	// 重複データ
				Result	:= FALSE;
				if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
                begin
                	DtlNCode2 := FieldByName('NCode').AsString;
                end;
				Close ();
				dqMasterData.Free ();
                exit;
            end;

			{外部ｺｰﾄﾞ重複→適用期間チェック！}
			{比較元日付取得}
            if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
            begin
	            if ((DtlCmnEditAppDateStart.Value = 0) or (DtlCmnEditAppDateStart.Value = NULL)) then
	            	DateS := DEF_S_DATE
				else
					DateS := DtlCmnEditAppDateStart.AsDateTime;
	            if ((DtlCmnEditAppDateEnd.Value = 0) or (DtlCmnEditAppDateEnd.Value = NULL)) then
	            	DateE := DEF_E_DATE
				else
					DateE := DtlCmnEditAppDateEnd.AsDateTime;
            end
            else											// 一覧画面
            begin
	            if ((EDateStart.Value = 0) or (EDateStart.Value = NULL)) then
	            	DateS := DEF_S_DATE
				else
					DateS := EDateStart.AsDateTime;
	            if ((EDateEnd.Value = 0) or (EDateEnd.Value = NULL)) then
	            	DateE := DEF_E_DATE
				else
					DateE := EDateEnd.AsDateTime;
            end;

			{比較先日付取得}
            if ((FieldByName('TStartDate').AsString = '') or (FieldByName('TStartDate').IsNull)) then
            	DateS2 := DEF_S_DATE
            else
				DateS2 := FieldByName('TStartDate').AsDateTime;
            if ((FieldByName('TEndDate').AsString = '') or (FieldByName('TEndDate').IsNull)) then
            	DateE2 := DEF_E_DATE
            else
                DateE2 := FieldByName('TEndDate').AsDateTime;

            {チェック}
            {
			  ①比較元	  ====
                比較先         ----

			  ②比較元	       ====
                比較先    ----

			  のみ有効
            }

			if ((DateE < DateS2) OR (DateS > DateE2)) then
            begin
            end
            else
            begin
            	// 重複データ
				Result	:= FALSE;
	            if DtlCmnClientPanel.Visible = TRUE then		// 詳細画面
                begin
                	DtlNCode2 := FieldByName('NCode').AsString;
					//DtlNCode := FieldByName('NCode').AsString;
					//ModeBtn.Caption := '修　正';
					//ModeBtn.Font.Color := clRed;
                end;
				Close ();
				dqMasterData.Free ();
                exit;
            end;
			NEXT;
        end;

		Close ();
    end;

	dqMasterData.Free ();
end;


//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP0020030f.fnCheckMasterDataRecordValid2 (String)  								*/
//*																									*/
//*	目的	: 部門登録処理 部門基本ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ                                     		    */
//*																									*/
//*	戻り値	: Boolean, (True:ﾁｪｯｸOK, False:ﾁｪｯｸNG)						                            */
//*																									*/
//*-------------------------------------------------------------------------------------------------*/
//*																									*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ												                */
//*                                                                                                 */
//***************************************************************************************************/
function    TJNTCRP0020030f.fnCheckMasterDataRecordValid2 (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
    DefStr		: String;
begin

	Result	:= TRUE;
	if	(Trim (strExCode) = '') then
	begin
		Result	:= FALSE;
		Exit;
	end;

	if  (m_nCurrentCodeAttr <= 1) then
		strExCode	:= Format ('%.16d', [StrToInt64 (Trim (strExCode))]);

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);	                                    // DBとMQueryの接続

	if DtlCmnClientPanel.Visible = True then				// 詳細画面の場合
    begin
		if	(DtlCmnTab.Items [1].Selected) then				// 合計
        	DefStr := '='									// 実在部門で同じものがあるか？
        else												// 実在
        	DefStr := '<>';									// 実在以外で同じものがあるか？
    end														// 一覧画面の場合
    else
    begin
		if	(StdCmnTab.Items [1].Selected) then				// 合計
        	DefStr := '='									// 実在部門で同じものがあるか？
        else												// 実在
        	DefStr := '<>';									// 実在以外で同じものがあるか？
    end;

    with (dqMasterData) do
    begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT NCode FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND GCode = :strExCode');
		SQL.Add   ('  AND  SumKbn ' + DefStr + ' 0');

		ParamByName ('nMasterDivision').AsInteger   := m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString    := strExCode;

		Open ();

		if  (not EOF) then
			Result  := FALSE;

		Close ();
	end;

	dqMasterData.Free ();
end;
*)
{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnDeleteMasterTreeRecord (Integer; String)										*/
//*																											*/
//*	目的	: 部門登録処理 部門加算体系ﾏｽﾀ削除																*/
//*																											*/
//*	戻り値	: Boolean, (TREU=正常終了, FALSE=異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 実在/合計区分 (0:実在, 1:合計)													*/
//*           strExCode = 部門内部ｺｰﾄﾞ ！																	*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnDeleteMasterTreeRecord (nDivision: Integer; strExCode: String): Boolean;
var
	dqMasterTree      : TMQuery;

begin
	dqMasterTree		:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree      );				// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM ' + DEF_HAPTLR2 + ' WHERE MasterKbn = :nMasterDivision AND BasedNCode = :strSrcCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strSrcCode'     ).AsString	:= strExCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree      .Free ();

			Result	:= FALSE;
			Exit;
		end;

		m_bHojyoTreeDelete [m_nCurrentMasterDiv - 41]	:= 1;
		m_bHojyoTree2      [m_nCurrentMasterDiv - 41]	:= 1;
	end;

	Result	:= TRUE;															// 正常終了

	dqMasterTree      .Free ();
end;
}

////***********************************************************************************************************/
////*																											*/
////*	関数	: TJNTCRP0020030f.fnChangeToolbarButtonsCondition (TTreeNode)										*/
////*																											*/
////*	目的	: 部門登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更																*/
////*																											*/
////*	戻り値	: なし,																							*/
////*																											*/
////*---------------------------------------------------------------------------------------------------------*/
////*																											*/
////*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget	= 対象ﾉｰﾄﾞ																		*/
////*																											*/
////***********************************************************************************************************/
//procedure	TJNTCRP0020030f.fnChangeToolbarButtonsCondition (cNodeTarget: TTreeNode);
//var
//	cNodeWork  : TTreeNode;
//	stRecTarget: ^TreeViewRec;
//
//begin
//	stRecTarget	:= cNodeTarget.Data;
//
//	// 新規追加中
//	if	((stRecTarget^.nDivision = DIVISION_SYSTEM) or (stRecTarget^.nDivision = DIVISION_NEWRECORD)) then
//	begin
//		// 全て無効
//		CmnToolbarButtonDetail.Enabled	:= FALSE;
//		CmnToolbarButtonDelete.Enabled	:= FALSE;
//		fnEnableToolbarButtonTag (FALSE);
//	end
//	else
//	begin
//		// 詳細は常に有効
//		CmnToolbarButtonDetail.Enabled	:= TRUE;
//
//		// 削除・付箋は一旦無効にする
//		CmnToolbarButtonDelete.Enabled	:= FALSE;
//		fnEnableToolbarButtonTag (FALSE);
//
//		// 参照以外(通常)
//		if	(m_nReferMode <> REFER) then
//		begin
//			if	(stRecTarget^.nDivision = 9) then												// 総合計
//			begin
//				if	(fnCheckPermitTotalRecDelete ()) then
//					CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete();
//			end
//			else if	(stRecTarget^.nDivision = DIVISION_GENERAL) then							// 諸口
//			begin
//				if	(fnCheckPermitGeneralRecDelete ()) then
//					CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete();
//			end
//			else																				// 通常は常に削除可
//				CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete();
//
//		end;
//		// 付箋はモードによらない
//		fnEnableToolbarButtonTag (TRUE);
//	end;
//
//	if	(CmnToolbarButtonDelete.Enabled) then
//	begin
//		cNodeWork	:= cNodeTarget.GetFirstChild ();
//
//		if	(cNodeWork <> nil) then
//			CmnToolbarButtonDelete.Enabled	:= FALSE;
//	end;
//end;

{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP0020030f.fnCheckDetailNewRecord (String)													*/
//*																											*/
//*	目的	: 部門登録処理 詳細情報を画面にｾｯﾄ																*/
//*																											*/
//*	戻り値	: Boolean, (TRUE:新規ﾚｺｰﾄﾞ, FALSE:既存ﾚｺｰﾄﾞ)						                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: strExCode	= 部門外部ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP0020030f.fnCheckDetailNewRecord (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fNewRecord	: Boolean;

begin
	fNewRecord	:= TRUE;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= fNewRecord;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);		// 050606

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode FROM ' + DEF_HOJYOMA);
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND RecordKbn = 0 AND GCode = :strExCode');

		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
		ParamByName ('strExCode'      ).AsString	:= strExCode;

		Open ();

		if  (not EOF) then
			fNewRecord	:= FALSE
		else
			fNewRecord	:= TRUE;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= fNewRecord;
end;
}

//**************************************************************************
//	Proccess	:	排他チェック
//	Name		:	Y.Ichihashi
//	Date		:	2003/06/27
//	Parameter	:	nMasterDivision     Integer
//	Return		:
//	History		:	HIS0025
//**************************************************************************
{
function TJNTCRP0020030f.fnExcept(nMasterDivision: Integer): Integer;
var
    iRet            :   Integer;
	stMessageRec    :   TMJSMsgRec;
begin

    if nMasterDivision = 41 then
        iRet    := cExcept.SetExcept(541)   //部門
    else
        iRet    := cExcept.SetExcept(542);  //セグメント

//FX10000

    if iRet <> JNTMAS_EXCEPT_RET_OK then
    begin
        showmessage('排他情報セット失敗');

        Result  := -1;

        Exit;
    end;


//    if (cExcept.Status100 = 1) or (cExcept.Status400 = 1) then
    begin
        m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10, 113);
        MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
                   	stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

//        cExcept.ResetTerm;
//        cExcept.Free;
//        cExcept := nil;

//        cExcept.ResetExcept(500 + nMasterDivision);

        Result  := 99;
    end;
end;
}
//**************************************************************************
//	Proccess	:	排他チェック
//	Name		:	Y.Ichihashi
//	Date		:	2004/01/16
//	Parameter	:
//	Return		:
//	History		:	HIS0027
//**************************************************************************
{
function TJNTCRP0020030f.fnHaitaCheck: Integer;
var
    iResult :   Integer;
begin
    iResult := 0;

    if m_nCurrentMasterDiv = 41 then
    begin
        if m_BmnFlg = False then
        begin
            iResult := fnExcept(m_nCurrentMasterDiv);

            if iResult <> 99 then
                m_BmnFlg    := True;
        end;
    end
    else
    if m_nCurrentMasterDiv = 42 then
    begin
        if m_SegFlg = False then
        begin
            iResult := fnExcept(m_nCurrentMasterDiv);

            if iResult <> 99 then
                m_SegFlg    := True;
        end;
    end;

    Result  := iResult;
end;
}
////***************************************************************************************************/
////*                                                                                                 */
////*	関数	: TJNTCRP0020030f.fnCheckPermitTotalRecDelete ()											*/
////*																									*/
////*	目的	: 部門登録処理 総合計部門ﾚｺｰﾄﾞ削除ﾁｪｯｸ													*/
////*																									*/
////*	戻り値	: Boolean, (True:削除可能, False:削除不可能)				                            */
////*																									*/
////***************************************************************************************************/
//function	TJNTCRP0020030f.fnCheckPermitTotalRecDelete (): Boolean;
//var
//	dqMasterData: TMQuery;
//	fReturn		: Boolean;
//
//begin
//	dqMasterData	:= TMQuery.Create (Self);		// 050606
//
//	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
//
//	with (dqMasterData) do
//	begin
//		Close ();
//
//		SQL.Clear;
//		SQL.ADD ('SELECT GCode FROM ' + DEF_HOJYOMA);
//		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision AND RDelKbn = 0 AND SumKbn <> 9');
//
//		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//
//		Open ();
//
//		if  (not EOF) then
//			fReturn	:= FALSE
//		else
//			fReturn	:= TRUE;
//
//		Close ();
//	end;
//
//	Result	:= fReturn;
//
//	dqMasterData.Free ();
//end;

////***************************************************************************************************/
////*                                                                                                 */
////*	関数	: TJNTCRP0020030f.fnCheckPermitGeneralRecDelete ()											*/
////*																									*/
////*	目的	: 部門登録処理 諸口部門ﾚｺｰﾄﾞ削除ﾁｪｯｸ													*/
////*																									*/
////*	戻り値	: Boolean, (TRUE:削除可能, FALSE:削除不可能)				                            */
////*																									*/
////***************************************************************************************************/
//function	TJNTCRP0020030f.fnCheckPermitGeneralRecDelete (): Boolean;
//var
//	dqMasterData: TMQuery;
//	fReturn		: Boolean;
//
//begin
//	dqMasterData	:= TMQuery.Create (Self);		// 050606
//
//	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
//
//	with (dqMasterData) do
//	begin
//		Close ();
//
//		SQL.Clear;
//		SQL.ADD ('SELECT GCode FROM ' + DEF_HOJYOMA);
//		SQL.ADD ('WHERE  MasterKbn = :nMasterDivision AND ');
//		// ◆◇◆　諸口区分
//		//SQL.ADD ('       RecordKbn = 0 AND (NCode <> 0 OR NCode IS NULL) AND SumKbn <> 9');
//		SQL.ADD ('       RDelKbn = 0 AND SyokuchiKbn = 0 AND SumKbn <> 9');
//
//		ParamByName ('nMasterDivision').AsInteger	:= m_nCurrentMasterDiv;
//
//		Open ();
//
//		if  (not EOF) then
//			fReturn	:= FALSE
//		else
//			fReturn	:= TRUE;
//
//		Close ();
//	end;
//
//	Result	:= fReturn;
//
//	dqMasterData.Free ();
//end;

end.
//***********************************************************************************************************/
//*																											*/
//* End of Specifications																					*/
//*																											*/
//***********************************************************************************************************/


